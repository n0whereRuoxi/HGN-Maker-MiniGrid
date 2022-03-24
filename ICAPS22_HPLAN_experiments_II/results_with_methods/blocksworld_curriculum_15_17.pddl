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
      ?auto_449293 - BLOCK
    )
    :vars
    (
      ?auto_449294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449293 ?auto_449294 ) ( CLEAR ?auto_449293 ) ( HAND-EMPTY ) ( not ( = ?auto_449293 ?auto_449294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449293 ?auto_449294 )
      ( !PUTDOWN ?auto_449293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_449296 - BLOCK
    )
    :vars
    (
      ?auto_449297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449296 ?auto_449297 ) ( CLEAR ?auto_449296 ) ( HAND-EMPTY ) ( not ( = ?auto_449296 ?auto_449297 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449296 ?auto_449297 )
      ( !PUTDOWN ?auto_449296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_449300 - BLOCK
      ?auto_449301 - BLOCK
    )
    :vars
    (
      ?auto_449302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449300 ) ( ON ?auto_449301 ?auto_449302 ) ( CLEAR ?auto_449301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449300 ) ( not ( = ?auto_449300 ?auto_449301 ) ) ( not ( = ?auto_449300 ?auto_449302 ) ) ( not ( = ?auto_449301 ?auto_449302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449301 ?auto_449302 )
      ( !STACK ?auto_449301 ?auto_449300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_449305 - BLOCK
      ?auto_449306 - BLOCK
    )
    :vars
    (
      ?auto_449307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449305 ) ( ON ?auto_449306 ?auto_449307 ) ( CLEAR ?auto_449306 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449305 ) ( not ( = ?auto_449305 ?auto_449306 ) ) ( not ( = ?auto_449305 ?auto_449307 ) ) ( not ( = ?auto_449306 ?auto_449307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449306 ?auto_449307 )
      ( !STACK ?auto_449306 ?auto_449305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_449310 - BLOCK
      ?auto_449311 - BLOCK
    )
    :vars
    (
      ?auto_449312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449311 ?auto_449312 ) ( not ( = ?auto_449310 ?auto_449311 ) ) ( not ( = ?auto_449310 ?auto_449312 ) ) ( not ( = ?auto_449311 ?auto_449312 ) ) ( ON ?auto_449310 ?auto_449311 ) ( CLEAR ?auto_449310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449310 )
      ( MAKE-2PILE ?auto_449310 ?auto_449311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_449315 - BLOCK
      ?auto_449316 - BLOCK
    )
    :vars
    (
      ?auto_449317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449316 ?auto_449317 ) ( not ( = ?auto_449315 ?auto_449316 ) ) ( not ( = ?auto_449315 ?auto_449317 ) ) ( not ( = ?auto_449316 ?auto_449317 ) ) ( ON ?auto_449315 ?auto_449316 ) ( CLEAR ?auto_449315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449315 )
      ( MAKE-2PILE ?auto_449315 ?auto_449316 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449321 - BLOCK
      ?auto_449322 - BLOCK
      ?auto_449323 - BLOCK
    )
    :vars
    (
      ?auto_449324 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449322 ) ( ON ?auto_449323 ?auto_449324 ) ( CLEAR ?auto_449323 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449321 ) ( ON ?auto_449322 ?auto_449321 ) ( not ( = ?auto_449321 ?auto_449322 ) ) ( not ( = ?auto_449321 ?auto_449323 ) ) ( not ( = ?auto_449321 ?auto_449324 ) ) ( not ( = ?auto_449322 ?auto_449323 ) ) ( not ( = ?auto_449322 ?auto_449324 ) ) ( not ( = ?auto_449323 ?auto_449324 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449323 ?auto_449324 )
      ( !STACK ?auto_449323 ?auto_449322 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449328 - BLOCK
      ?auto_449329 - BLOCK
      ?auto_449330 - BLOCK
    )
    :vars
    (
      ?auto_449331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449329 ) ( ON ?auto_449330 ?auto_449331 ) ( CLEAR ?auto_449330 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449328 ) ( ON ?auto_449329 ?auto_449328 ) ( not ( = ?auto_449328 ?auto_449329 ) ) ( not ( = ?auto_449328 ?auto_449330 ) ) ( not ( = ?auto_449328 ?auto_449331 ) ) ( not ( = ?auto_449329 ?auto_449330 ) ) ( not ( = ?auto_449329 ?auto_449331 ) ) ( not ( = ?auto_449330 ?auto_449331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449330 ?auto_449331 )
      ( !STACK ?auto_449330 ?auto_449329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449335 - BLOCK
      ?auto_449336 - BLOCK
      ?auto_449337 - BLOCK
    )
    :vars
    (
      ?auto_449338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449337 ?auto_449338 ) ( ON-TABLE ?auto_449335 ) ( not ( = ?auto_449335 ?auto_449336 ) ) ( not ( = ?auto_449335 ?auto_449337 ) ) ( not ( = ?auto_449335 ?auto_449338 ) ) ( not ( = ?auto_449336 ?auto_449337 ) ) ( not ( = ?auto_449336 ?auto_449338 ) ) ( not ( = ?auto_449337 ?auto_449338 ) ) ( CLEAR ?auto_449335 ) ( ON ?auto_449336 ?auto_449337 ) ( CLEAR ?auto_449336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449335 ?auto_449336 )
      ( MAKE-3PILE ?auto_449335 ?auto_449336 ?auto_449337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449342 - BLOCK
      ?auto_449343 - BLOCK
      ?auto_449344 - BLOCK
    )
    :vars
    (
      ?auto_449345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449344 ?auto_449345 ) ( ON-TABLE ?auto_449342 ) ( not ( = ?auto_449342 ?auto_449343 ) ) ( not ( = ?auto_449342 ?auto_449344 ) ) ( not ( = ?auto_449342 ?auto_449345 ) ) ( not ( = ?auto_449343 ?auto_449344 ) ) ( not ( = ?auto_449343 ?auto_449345 ) ) ( not ( = ?auto_449344 ?auto_449345 ) ) ( CLEAR ?auto_449342 ) ( ON ?auto_449343 ?auto_449344 ) ( CLEAR ?auto_449343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449342 ?auto_449343 )
      ( MAKE-3PILE ?auto_449342 ?auto_449343 ?auto_449344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449349 - BLOCK
      ?auto_449350 - BLOCK
      ?auto_449351 - BLOCK
    )
    :vars
    (
      ?auto_449352 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449351 ?auto_449352 ) ( not ( = ?auto_449349 ?auto_449350 ) ) ( not ( = ?auto_449349 ?auto_449351 ) ) ( not ( = ?auto_449349 ?auto_449352 ) ) ( not ( = ?auto_449350 ?auto_449351 ) ) ( not ( = ?auto_449350 ?auto_449352 ) ) ( not ( = ?auto_449351 ?auto_449352 ) ) ( ON ?auto_449350 ?auto_449351 ) ( ON ?auto_449349 ?auto_449350 ) ( CLEAR ?auto_449349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449349 )
      ( MAKE-3PILE ?auto_449349 ?auto_449350 ?auto_449351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_449356 - BLOCK
      ?auto_449357 - BLOCK
      ?auto_449358 - BLOCK
    )
    :vars
    (
      ?auto_449359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449358 ?auto_449359 ) ( not ( = ?auto_449356 ?auto_449357 ) ) ( not ( = ?auto_449356 ?auto_449358 ) ) ( not ( = ?auto_449356 ?auto_449359 ) ) ( not ( = ?auto_449357 ?auto_449358 ) ) ( not ( = ?auto_449357 ?auto_449359 ) ) ( not ( = ?auto_449358 ?auto_449359 ) ) ( ON ?auto_449357 ?auto_449358 ) ( ON ?auto_449356 ?auto_449357 ) ( CLEAR ?auto_449356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449356 )
      ( MAKE-3PILE ?auto_449356 ?auto_449357 ?auto_449358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449364 - BLOCK
      ?auto_449365 - BLOCK
      ?auto_449366 - BLOCK
      ?auto_449367 - BLOCK
    )
    :vars
    (
      ?auto_449368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449366 ) ( ON ?auto_449367 ?auto_449368 ) ( CLEAR ?auto_449367 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449364 ) ( ON ?auto_449365 ?auto_449364 ) ( ON ?auto_449366 ?auto_449365 ) ( not ( = ?auto_449364 ?auto_449365 ) ) ( not ( = ?auto_449364 ?auto_449366 ) ) ( not ( = ?auto_449364 ?auto_449367 ) ) ( not ( = ?auto_449364 ?auto_449368 ) ) ( not ( = ?auto_449365 ?auto_449366 ) ) ( not ( = ?auto_449365 ?auto_449367 ) ) ( not ( = ?auto_449365 ?auto_449368 ) ) ( not ( = ?auto_449366 ?auto_449367 ) ) ( not ( = ?auto_449366 ?auto_449368 ) ) ( not ( = ?auto_449367 ?auto_449368 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449367 ?auto_449368 )
      ( !STACK ?auto_449367 ?auto_449366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449373 - BLOCK
      ?auto_449374 - BLOCK
      ?auto_449375 - BLOCK
      ?auto_449376 - BLOCK
    )
    :vars
    (
      ?auto_449377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449375 ) ( ON ?auto_449376 ?auto_449377 ) ( CLEAR ?auto_449376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449373 ) ( ON ?auto_449374 ?auto_449373 ) ( ON ?auto_449375 ?auto_449374 ) ( not ( = ?auto_449373 ?auto_449374 ) ) ( not ( = ?auto_449373 ?auto_449375 ) ) ( not ( = ?auto_449373 ?auto_449376 ) ) ( not ( = ?auto_449373 ?auto_449377 ) ) ( not ( = ?auto_449374 ?auto_449375 ) ) ( not ( = ?auto_449374 ?auto_449376 ) ) ( not ( = ?auto_449374 ?auto_449377 ) ) ( not ( = ?auto_449375 ?auto_449376 ) ) ( not ( = ?auto_449375 ?auto_449377 ) ) ( not ( = ?auto_449376 ?auto_449377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449376 ?auto_449377 )
      ( !STACK ?auto_449376 ?auto_449375 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449382 - BLOCK
      ?auto_449383 - BLOCK
      ?auto_449384 - BLOCK
      ?auto_449385 - BLOCK
    )
    :vars
    (
      ?auto_449386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449385 ?auto_449386 ) ( ON-TABLE ?auto_449382 ) ( ON ?auto_449383 ?auto_449382 ) ( not ( = ?auto_449382 ?auto_449383 ) ) ( not ( = ?auto_449382 ?auto_449384 ) ) ( not ( = ?auto_449382 ?auto_449385 ) ) ( not ( = ?auto_449382 ?auto_449386 ) ) ( not ( = ?auto_449383 ?auto_449384 ) ) ( not ( = ?auto_449383 ?auto_449385 ) ) ( not ( = ?auto_449383 ?auto_449386 ) ) ( not ( = ?auto_449384 ?auto_449385 ) ) ( not ( = ?auto_449384 ?auto_449386 ) ) ( not ( = ?auto_449385 ?auto_449386 ) ) ( CLEAR ?auto_449383 ) ( ON ?auto_449384 ?auto_449385 ) ( CLEAR ?auto_449384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449382 ?auto_449383 ?auto_449384 )
      ( MAKE-4PILE ?auto_449382 ?auto_449383 ?auto_449384 ?auto_449385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449391 - BLOCK
      ?auto_449392 - BLOCK
      ?auto_449393 - BLOCK
      ?auto_449394 - BLOCK
    )
    :vars
    (
      ?auto_449395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449394 ?auto_449395 ) ( ON-TABLE ?auto_449391 ) ( ON ?auto_449392 ?auto_449391 ) ( not ( = ?auto_449391 ?auto_449392 ) ) ( not ( = ?auto_449391 ?auto_449393 ) ) ( not ( = ?auto_449391 ?auto_449394 ) ) ( not ( = ?auto_449391 ?auto_449395 ) ) ( not ( = ?auto_449392 ?auto_449393 ) ) ( not ( = ?auto_449392 ?auto_449394 ) ) ( not ( = ?auto_449392 ?auto_449395 ) ) ( not ( = ?auto_449393 ?auto_449394 ) ) ( not ( = ?auto_449393 ?auto_449395 ) ) ( not ( = ?auto_449394 ?auto_449395 ) ) ( CLEAR ?auto_449392 ) ( ON ?auto_449393 ?auto_449394 ) ( CLEAR ?auto_449393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449391 ?auto_449392 ?auto_449393 )
      ( MAKE-4PILE ?auto_449391 ?auto_449392 ?auto_449393 ?auto_449394 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449400 - BLOCK
      ?auto_449401 - BLOCK
      ?auto_449402 - BLOCK
      ?auto_449403 - BLOCK
    )
    :vars
    (
      ?auto_449404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449403 ?auto_449404 ) ( ON-TABLE ?auto_449400 ) ( not ( = ?auto_449400 ?auto_449401 ) ) ( not ( = ?auto_449400 ?auto_449402 ) ) ( not ( = ?auto_449400 ?auto_449403 ) ) ( not ( = ?auto_449400 ?auto_449404 ) ) ( not ( = ?auto_449401 ?auto_449402 ) ) ( not ( = ?auto_449401 ?auto_449403 ) ) ( not ( = ?auto_449401 ?auto_449404 ) ) ( not ( = ?auto_449402 ?auto_449403 ) ) ( not ( = ?auto_449402 ?auto_449404 ) ) ( not ( = ?auto_449403 ?auto_449404 ) ) ( ON ?auto_449402 ?auto_449403 ) ( CLEAR ?auto_449400 ) ( ON ?auto_449401 ?auto_449402 ) ( CLEAR ?auto_449401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449400 ?auto_449401 )
      ( MAKE-4PILE ?auto_449400 ?auto_449401 ?auto_449402 ?auto_449403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449409 - BLOCK
      ?auto_449410 - BLOCK
      ?auto_449411 - BLOCK
      ?auto_449412 - BLOCK
    )
    :vars
    (
      ?auto_449413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449412 ?auto_449413 ) ( ON-TABLE ?auto_449409 ) ( not ( = ?auto_449409 ?auto_449410 ) ) ( not ( = ?auto_449409 ?auto_449411 ) ) ( not ( = ?auto_449409 ?auto_449412 ) ) ( not ( = ?auto_449409 ?auto_449413 ) ) ( not ( = ?auto_449410 ?auto_449411 ) ) ( not ( = ?auto_449410 ?auto_449412 ) ) ( not ( = ?auto_449410 ?auto_449413 ) ) ( not ( = ?auto_449411 ?auto_449412 ) ) ( not ( = ?auto_449411 ?auto_449413 ) ) ( not ( = ?auto_449412 ?auto_449413 ) ) ( ON ?auto_449411 ?auto_449412 ) ( CLEAR ?auto_449409 ) ( ON ?auto_449410 ?auto_449411 ) ( CLEAR ?auto_449410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449409 ?auto_449410 )
      ( MAKE-4PILE ?auto_449409 ?auto_449410 ?auto_449411 ?auto_449412 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449418 - BLOCK
      ?auto_449419 - BLOCK
      ?auto_449420 - BLOCK
      ?auto_449421 - BLOCK
    )
    :vars
    (
      ?auto_449422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449421 ?auto_449422 ) ( not ( = ?auto_449418 ?auto_449419 ) ) ( not ( = ?auto_449418 ?auto_449420 ) ) ( not ( = ?auto_449418 ?auto_449421 ) ) ( not ( = ?auto_449418 ?auto_449422 ) ) ( not ( = ?auto_449419 ?auto_449420 ) ) ( not ( = ?auto_449419 ?auto_449421 ) ) ( not ( = ?auto_449419 ?auto_449422 ) ) ( not ( = ?auto_449420 ?auto_449421 ) ) ( not ( = ?auto_449420 ?auto_449422 ) ) ( not ( = ?auto_449421 ?auto_449422 ) ) ( ON ?auto_449420 ?auto_449421 ) ( ON ?auto_449419 ?auto_449420 ) ( ON ?auto_449418 ?auto_449419 ) ( CLEAR ?auto_449418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449418 )
      ( MAKE-4PILE ?auto_449418 ?auto_449419 ?auto_449420 ?auto_449421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_449427 - BLOCK
      ?auto_449428 - BLOCK
      ?auto_449429 - BLOCK
      ?auto_449430 - BLOCK
    )
    :vars
    (
      ?auto_449431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449430 ?auto_449431 ) ( not ( = ?auto_449427 ?auto_449428 ) ) ( not ( = ?auto_449427 ?auto_449429 ) ) ( not ( = ?auto_449427 ?auto_449430 ) ) ( not ( = ?auto_449427 ?auto_449431 ) ) ( not ( = ?auto_449428 ?auto_449429 ) ) ( not ( = ?auto_449428 ?auto_449430 ) ) ( not ( = ?auto_449428 ?auto_449431 ) ) ( not ( = ?auto_449429 ?auto_449430 ) ) ( not ( = ?auto_449429 ?auto_449431 ) ) ( not ( = ?auto_449430 ?auto_449431 ) ) ( ON ?auto_449429 ?auto_449430 ) ( ON ?auto_449428 ?auto_449429 ) ( ON ?auto_449427 ?auto_449428 ) ( CLEAR ?auto_449427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449427 )
      ( MAKE-4PILE ?auto_449427 ?auto_449428 ?auto_449429 ?auto_449430 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449437 - BLOCK
      ?auto_449438 - BLOCK
      ?auto_449439 - BLOCK
      ?auto_449440 - BLOCK
      ?auto_449441 - BLOCK
    )
    :vars
    (
      ?auto_449442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449440 ) ( ON ?auto_449441 ?auto_449442 ) ( CLEAR ?auto_449441 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449437 ) ( ON ?auto_449438 ?auto_449437 ) ( ON ?auto_449439 ?auto_449438 ) ( ON ?auto_449440 ?auto_449439 ) ( not ( = ?auto_449437 ?auto_449438 ) ) ( not ( = ?auto_449437 ?auto_449439 ) ) ( not ( = ?auto_449437 ?auto_449440 ) ) ( not ( = ?auto_449437 ?auto_449441 ) ) ( not ( = ?auto_449437 ?auto_449442 ) ) ( not ( = ?auto_449438 ?auto_449439 ) ) ( not ( = ?auto_449438 ?auto_449440 ) ) ( not ( = ?auto_449438 ?auto_449441 ) ) ( not ( = ?auto_449438 ?auto_449442 ) ) ( not ( = ?auto_449439 ?auto_449440 ) ) ( not ( = ?auto_449439 ?auto_449441 ) ) ( not ( = ?auto_449439 ?auto_449442 ) ) ( not ( = ?auto_449440 ?auto_449441 ) ) ( not ( = ?auto_449440 ?auto_449442 ) ) ( not ( = ?auto_449441 ?auto_449442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449441 ?auto_449442 )
      ( !STACK ?auto_449441 ?auto_449440 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449448 - BLOCK
      ?auto_449449 - BLOCK
      ?auto_449450 - BLOCK
      ?auto_449451 - BLOCK
      ?auto_449452 - BLOCK
    )
    :vars
    (
      ?auto_449453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449451 ) ( ON ?auto_449452 ?auto_449453 ) ( CLEAR ?auto_449452 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449448 ) ( ON ?auto_449449 ?auto_449448 ) ( ON ?auto_449450 ?auto_449449 ) ( ON ?auto_449451 ?auto_449450 ) ( not ( = ?auto_449448 ?auto_449449 ) ) ( not ( = ?auto_449448 ?auto_449450 ) ) ( not ( = ?auto_449448 ?auto_449451 ) ) ( not ( = ?auto_449448 ?auto_449452 ) ) ( not ( = ?auto_449448 ?auto_449453 ) ) ( not ( = ?auto_449449 ?auto_449450 ) ) ( not ( = ?auto_449449 ?auto_449451 ) ) ( not ( = ?auto_449449 ?auto_449452 ) ) ( not ( = ?auto_449449 ?auto_449453 ) ) ( not ( = ?auto_449450 ?auto_449451 ) ) ( not ( = ?auto_449450 ?auto_449452 ) ) ( not ( = ?auto_449450 ?auto_449453 ) ) ( not ( = ?auto_449451 ?auto_449452 ) ) ( not ( = ?auto_449451 ?auto_449453 ) ) ( not ( = ?auto_449452 ?auto_449453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449452 ?auto_449453 )
      ( !STACK ?auto_449452 ?auto_449451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449459 - BLOCK
      ?auto_449460 - BLOCK
      ?auto_449461 - BLOCK
      ?auto_449462 - BLOCK
      ?auto_449463 - BLOCK
    )
    :vars
    (
      ?auto_449464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449463 ?auto_449464 ) ( ON-TABLE ?auto_449459 ) ( ON ?auto_449460 ?auto_449459 ) ( ON ?auto_449461 ?auto_449460 ) ( not ( = ?auto_449459 ?auto_449460 ) ) ( not ( = ?auto_449459 ?auto_449461 ) ) ( not ( = ?auto_449459 ?auto_449462 ) ) ( not ( = ?auto_449459 ?auto_449463 ) ) ( not ( = ?auto_449459 ?auto_449464 ) ) ( not ( = ?auto_449460 ?auto_449461 ) ) ( not ( = ?auto_449460 ?auto_449462 ) ) ( not ( = ?auto_449460 ?auto_449463 ) ) ( not ( = ?auto_449460 ?auto_449464 ) ) ( not ( = ?auto_449461 ?auto_449462 ) ) ( not ( = ?auto_449461 ?auto_449463 ) ) ( not ( = ?auto_449461 ?auto_449464 ) ) ( not ( = ?auto_449462 ?auto_449463 ) ) ( not ( = ?auto_449462 ?auto_449464 ) ) ( not ( = ?auto_449463 ?auto_449464 ) ) ( CLEAR ?auto_449461 ) ( ON ?auto_449462 ?auto_449463 ) ( CLEAR ?auto_449462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449459 ?auto_449460 ?auto_449461 ?auto_449462 )
      ( MAKE-5PILE ?auto_449459 ?auto_449460 ?auto_449461 ?auto_449462 ?auto_449463 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449470 - BLOCK
      ?auto_449471 - BLOCK
      ?auto_449472 - BLOCK
      ?auto_449473 - BLOCK
      ?auto_449474 - BLOCK
    )
    :vars
    (
      ?auto_449475 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449474 ?auto_449475 ) ( ON-TABLE ?auto_449470 ) ( ON ?auto_449471 ?auto_449470 ) ( ON ?auto_449472 ?auto_449471 ) ( not ( = ?auto_449470 ?auto_449471 ) ) ( not ( = ?auto_449470 ?auto_449472 ) ) ( not ( = ?auto_449470 ?auto_449473 ) ) ( not ( = ?auto_449470 ?auto_449474 ) ) ( not ( = ?auto_449470 ?auto_449475 ) ) ( not ( = ?auto_449471 ?auto_449472 ) ) ( not ( = ?auto_449471 ?auto_449473 ) ) ( not ( = ?auto_449471 ?auto_449474 ) ) ( not ( = ?auto_449471 ?auto_449475 ) ) ( not ( = ?auto_449472 ?auto_449473 ) ) ( not ( = ?auto_449472 ?auto_449474 ) ) ( not ( = ?auto_449472 ?auto_449475 ) ) ( not ( = ?auto_449473 ?auto_449474 ) ) ( not ( = ?auto_449473 ?auto_449475 ) ) ( not ( = ?auto_449474 ?auto_449475 ) ) ( CLEAR ?auto_449472 ) ( ON ?auto_449473 ?auto_449474 ) ( CLEAR ?auto_449473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449470 ?auto_449471 ?auto_449472 ?auto_449473 )
      ( MAKE-5PILE ?auto_449470 ?auto_449471 ?auto_449472 ?auto_449473 ?auto_449474 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449481 - BLOCK
      ?auto_449482 - BLOCK
      ?auto_449483 - BLOCK
      ?auto_449484 - BLOCK
      ?auto_449485 - BLOCK
    )
    :vars
    (
      ?auto_449486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449485 ?auto_449486 ) ( ON-TABLE ?auto_449481 ) ( ON ?auto_449482 ?auto_449481 ) ( not ( = ?auto_449481 ?auto_449482 ) ) ( not ( = ?auto_449481 ?auto_449483 ) ) ( not ( = ?auto_449481 ?auto_449484 ) ) ( not ( = ?auto_449481 ?auto_449485 ) ) ( not ( = ?auto_449481 ?auto_449486 ) ) ( not ( = ?auto_449482 ?auto_449483 ) ) ( not ( = ?auto_449482 ?auto_449484 ) ) ( not ( = ?auto_449482 ?auto_449485 ) ) ( not ( = ?auto_449482 ?auto_449486 ) ) ( not ( = ?auto_449483 ?auto_449484 ) ) ( not ( = ?auto_449483 ?auto_449485 ) ) ( not ( = ?auto_449483 ?auto_449486 ) ) ( not ( = ?auto_449484 ?auto_449485 ) ) ( not ( = ?auto_449484 ?auto_449486 ) ) ( not ( = ?auto_449485 ?auto_449486 ) ) ( ON ?auto_449484 ?auto_449485 ) ( CLEAR ?auto_449482 ) ( ON ?auto_449483 ?auto_449484 ) ( CLEAR ?auto_449483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449481 ?auto_449482 ?auto_449483 )
      ( MAKE-5PILE ?auto_449481 ?auto_449482 ?auto_449483 ?auto_449484 ?auto_449485 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449492 - BLOCK
      ?auto_449493 - BLOCK
      ?auto_449494 - BLOCK
      ?auto_449495 - BLOCK
      ?auto_449496 - BLOCK
    )
    :vars
    (
      ?auto_449497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449496 ?auto_449497 ) ( ON-TABLE ?auto_449492 ) ( ON ?auto_449493 ?auto_449492 ) ( not ( = ?auto_449492 ?auto_449493 ) ) ( not ( = ?auto_449492 ?auto_449494 ) ) ( not ( = ?auto_449492 ?auto_449495 ) ) ( not ( = ?auto_449492 ?auto_449496 ) ) ( not ( = ?auto_449492 ?auto_449497 ) ) ( not ( = ?auto_449493 ?auto_449494 ) ) ( not ( = ?auto_449493 ?auto_449495 ) ) ( not ( = ?auto_449493 ?auto_449496 ) ) ( not ( = ?auto_449493 ?auto_449497 ) ) ( not ( = ?auto_449494 ?auto_449495 ) ) ( not ( = ?auto_449494 ?auto_449496 ) ) ( not ( = ?auto_449494 ?auto_449497 ) ) ( not ( = ?auto_449495 ?auto_449496 ) ) ( not ( = ?auto_449495 ?auto_449497 ) ) ( not ( = ?auto_449496 ?auto_449497 ) ) ( ON ?auto_449495 ?auto_449496 ) ( CLEAR ?auto_449493 ) ( ON ?auto_449494 ?auto_449495 ) ( CLEAR ?auto_449494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449492 ?auto_449493 ?auto_449494 )
      ( MAKE-5PILE ?auto_449492 ?auto_449493 ?auto_449494 ?auto_449495 ?auto_449496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449503 - BLOCK
      ?auto_449504 - BLOCK
      ?auto_449505 - BLOCK
      ?auto_449506 - BLOCK
      ?auto_449507 - BLOCK
    )
    :vars
    (
      ?auto_449508 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449507 ?auto_449508 ) ( ON-TABLE ?auto_449503 ) ( not ( = ?auto_449503 ?auto_449504 ) ) ( not ( = ?auto_449503 ?auto_449505 ) ) ( not ( = ?auto_449503 ?auto_449506 ) ) ( not ( = ?auto_449503 ?auto_449507 ) ) ( not ( = ?auto_449503 ?auto_449508 ) ) ( not ( = ?auto_449504 ?auto_449505 ) ) ( not ( = ?auto_449504 ?auto_449506 ) ) ( not ( = ?auto_449504 ?auto_449507 ) ) ( not ( = ?auto_449504 ?auto_449508 ) ) ( not ( = ?auto_449505 ?auto_449506 ) ) ( not ( = ?auto_449505 ?auto_449507 ) ) ( not ( = ?auto_449505 ?auto_449508 ) ) ( not ( = ?auto_449506 ?auto_449507 ) ) ( not ( = ?auto_449506 ?auto_449508 ) ) ( not ( = ?auto_449507 ?auto_449508 ) ) ( ON ?auto_449506 ?auto_449507 ) ( ON ?auto_449505 ?auto_449506 ) ( CLEAR ?auto_449503 ) ( ON ?auto_449504 ?auto_449505 ) ( CLEAR ?auto_449504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449503 ?auto_449504 )
      ( MAKE-5PILE ?auto_449503 ?auto_449504 ?auto_449505 ?auto_449506 ?auto_449507 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449514 - BLOCK
      ?auto_449515 - BLOCK
      ?auto_449516 - BLOCK
      ?auto_449517 - BLOCK
      ?auto_449518 - BLOCK
    )
    :vars
    (
      ?auto_449519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449518 ?auto_449519 ) ( ON-TABLE ?auto_449514 ) ( not ( = ?auto_449514 ?auto_449515 ) ) ( not ( = ?auto_449514 ?auto_449516 ) ) ( not ( = ?auto_449514 ?auto_449517 ) ) ( not ( = ?auto_449514 ?auto_449518 ) ) ( not ( = ?auto_449514 ?auto_449519 ) ) ( not ( = ?auto_449515 ?auto_449516 ) ) ( not ( = ?auto_449515 ?auto_449517 ) ) ( not ( = ?auto_449515 ?auto_449518 ) ) ( not ( = ?auto_449515 ?auto_449519 ) ) ( not ( = ?auto_449516 ?auto_449517 ) ) ( not ( = ?auto_449516 ?auto_449518 ) ) ( not ( = ?auto_449516 ?auto_449519 ) ) ( not ( = ?auto_449517 ?auto_449518 ) ) ( not ( = ?auto_449517 ?auto_449519 ) ) ( not ( = ?auto_449518 ?auto_449519 ) ) ( ON ?auto_449517 ?auto_449518 ) ( ON ?auto_449516 ?auto_449517 ) ( CLEAR ?auto_449514 ) ( ON ?auto_449515 ?auto_449516 ) ( CLEAR ?auto_449515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449514 ?auto_449515 )
      ( MAKE-5PILE ?auto_449514 ?auto_449515 ?auto_449516 ?auto_449517 ?auto_449518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449525 - BLOCK
      ?auto_449526 - BLOCK
      ?auto_449527 - BLOCK
      ?auto_449528 - BLOCK
      ?auto_449529 - BLOCK
    )
    :vars
    (
      ?auto_449530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449529 ?auto_449530 ) ( not ( = ?auto_449525 ?auto_449526 ) ) ( not ( = ?auto_449525 ?auto_449527 ) ) ( not ( = ?auto_449525 ?auto_449528 ) ) ( not ( = ?auto_449525 ?auto_449529 ) ) ( not ( = ?auto_449525 ?auto_449530 ) ) ( not ( = ?auto_449526 ?auto_449527 ) ) ( not ( = ?auto_449526 ?auto_449528 ) ) ( not ( = ?auto_449526 ?auto_449529 ) ) ( not ( = ?auto_449526 ?auto_449530 ) ) ( not ( = ?auto_449527 ?auto_449528 ) ) ( not ( = ?auto_449527 ?auto_449529 ) ) ( not ( = ?auto_449527 ?auto_449530 ) ) ( not ( = ?auto_449528 ?auto_449529 ) ) ( not ( = ?auto_449528 ?auto_449530 ) ) ( not ( = ?auto_449529 ?auto_449530 ) ) ( ON ?auto_449528 ?auto_449529 ) ( ON ?auto_449527 ?auto_449528 ) ( ON ?auto_449526 ?auto_449527 ) ( ON ?auto_449525 ?auto_449526 ) ( CLEAR ?auto_449525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449525 )
      ( MAKE-5PILE ?auto_449525 ?auto_449526 ?auto_449527 ?auto_449528 ?auto_449529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_449536 - BLOCK
      ?auto_449537 - BLOCK
      ?auto_449538 - BLOCK
      ?auto_449539 - BLOCK
      ?auto_449540 - BLOCK
    )
    :vars
    (
      ?auto_449541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449540 ?auto_449541 ) ( not ( = ?auto_449536 ?auto_449537 ) ) ( not ( = ?auto_449536 ?auto_449538 ) ) ( not ( = ?auto_449536 ?auto_449539 ) ) ( not ( = ?auto_449536 ?auto_449540 ) ) ( not ( = ?auto_449536 ?auto_449541 ) ) ( not ( = ?auto_449537 ?auto_449538 ) ) ( not ( = ?auto_449537 ?auto_449539 ) ) ( not ( = ?auto_449537 ?auto_449540 ) ) ( not ( = ?auto_449537 ?auto_449541 ) ) ( not ( = ?auto_449538 ?auto_449539 ) ) ( not ( = ?auto_449538 ?auto_449540 ) ) ( not ( = ?auto_449538 ?auto_449541 ) ) ( not ( = ?auto_449539 ?auto_449540 ) ) ( not ( = ?auto_449539 ?auto_449541 ) ) ( not ( = ?auto_449540 ?auto_449541 ) ) ( ON ?auto_449539 ?auto_449540 ) ( ON ?auto_449538 ?auto_449539 ) ( ON ?auto_449537 ?auto_449538 ) ( ON ?auto_449536 ?auto_449537 ) ( CLEAR ?auto_449536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449536 )
      ( MAKE-5PILE ?auto_449536 ?auto_449537 ?auto_449538 ?auto_449539 ?auto_449540 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449548 - BLOCK
      ?auto_449549 - BLOCK
      ?auto_449550 - BLOCK
      ?auto_449551 - BLOCK
      ?auto_449552 - BLOCK
      ?auto_449553 - BLOCK
    )
    :vars
    (
      ?auto_449554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449552 ) ( ON ?auto_449553 ?auto_449554 ) ( CLEAR ?auto_449553 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449548 ) ( ON ?auto_449549 ?auto_449548 ) ( ON ?auto_449550 ?auto_449549 ) ( ON ?auto_449551 ?auto_449550 ) ( ON ?auto_449552 ?auto_449551 ) ( not ( = ?auto_449548 ?auto_449549 ) ) ( not ( = ?auto_449548 ?auto_449550 ) ) ( not ( = ?auto_449548 ?auto_449551 ) ) ( not ( = ?auto_449548 ?auto_449552 ) ) ( not ( = ?auto_449548 ?auto_449553 ) ) ( not ( = ?auto_449548 ?auto_449554 ) ) ( not ( = ?auto_449549 ?auto_449550 ) ) ( not ( = ?auto_449549 ?auto_449551 ) ) ( not ( = ?auto_449549 ?auto_449552 ) ) ( not ( = ?auto_449549 ?auto_449553 ) ) ( not ( = ?auto_449549 ?auto_449554 ) ) ( not ( = ?auto_449550 ?auto_449551 ) ) ( not ( = ?auto_449550 ?auto_449552 ) ) ( not ( = ?auto_449550 ?auto_449553 ) ) ( not ( = ?auto_449550 ?auto_449554 ) ) ( not ( = ?auto_449551 ?auto_449552 ) ) ( not ( = ?auto_449551 ?auto_449553 ) ) ( not ( = ?auto_449551 ?auto_449554 ) ) ( not ( = ?auto_449552 ?auto_449553 ) ) ( not ( = ?auto_449552 ?auto_449554 ) ) ( not ( = ?auto_449553 ?auto_449554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449553 ?auto_449554 )
      ( !STACK ?auto_449553 ?auto_449552 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449561 - BLOCK
      ?auto_449562 - BLOCK
      ?auto_449563 - BLOCK
      ?auto_449564 - BLOCK
      ?auto_449565 - BLOCK
      ?auto_449566 - BLOCK
    )
    :vars
    (
      ?auto_449567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449565 ) ( ON ?auto_449566 ?auto_449567 ) ( CLEAR ?auto_449566 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449561 ) ( ON ?auto_449562 ?auto_449561 ) ( ON ?auto_449563 ?auto_449562 ) ( ON ?auto_449564 ?auto_449563 ) ( ON ?auto_449565 ?auto_449564 ) ( not ( = ?auto_449561 ?auto_449562 ) ) ( not ( = ?auto_449561 ?auto_449563 ) ) ( not ( = ?auto_449561 ?auto_449564 ) ) ( not ( = ?auto_449561 ?auto_449565 ) ) ( not ( = ?auto_449561 ?auto_449566 ) ) ( not ( = ?auto_449561 ?auto_449567 ) ) ( not ( = ?auto_449562 ?auto_449563 ) ) ( not ( = ?auto_449562 ?auto_449564 ) ) ( not ( = ?auto_449562 ?auto_449565 ) ) ( not ( = ?auto_449562 ?auto_449566 ) ) ( not ( = ?auto_449562 ?auto_449567 ) ) ( not ( = ?auto_449563 ?auto_449564 ) ) ( not ( = ?auto_449563 ?auto_449565 ) ) ( not ( = ?auto_449563 ?auto_449566 ) ) ( not ( = ?auto_449563 ?auto_449567 ) ) ( not ( = ?auto_449564 ?auto_449565 ) ) ( not ( = ?auto_449564 ?auto_449566 ) ) ( not ( = ?auto_449564 ?auto_449567 ) ) ( not ( = ?auto_449565 ?auto_449566 ) ) ( not ( = ?auto_449565 ?auto_449567 ) ) ( not ( = ?auto_449566 ?auto_449567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449566 ?auto_449567 )
      ( !STACK ?auto_449566 ?auto_449565 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449574 - BLOCK
      ?auto_449575 - BLOCK
      ?auto_449576 - BLOCK
      ?auto_449577 - BLOCK
      ?auto_449578 - BLOCK
      ?auto_449579 - BLOCK
    )
    :vars
    (
      ?auto_449580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449579 ?auto_449580 ) ( ON-TABLE ?auto_449574 ) ( ON ?auto_449575 ?auto_449574 ) ( ON ?auto_449576 ?auto_449575 ) ( ON ?auto_449577 ?auto_449576 ) ( not ( = ?auto_449574 ?auto_449575 ) ) ( not ( = ?auto_449574 ?auto_449576 ) ) ( not ( = ?auto_449574 ?auto_449577 ) ) ( not ( = ?auto_449574 ?auto_449578 ) ) ( not ( = ?auto_449574 ?auto_449579 ) ) ( not ( = ?auto_449574 ?auto_449580 ) ) ( not ( = ?auto_449575 ?auto_449576 ) ) ( not ( = ?auto_449575 ?auto_449577 ) ) ( not ( = ?auto_449575 ?auto_449578 ) ) ( not ( = ?auto_449575 ?auto_449579 ) ) ( not ( = ?auto_449575 ?auto_449580 ) ) ( not ( = ?auto_449576 ?auto_449577 ) ) ( not ( = ?auto_449576 ?auto_449578 ) ) ( not ( = ?auto_449576 ?auto_449579 ) ) ( not ( = ?auto_449576 ?auto_449580 ) ) ( not ( = ?auto_449577 ?auto_449578 ) ) ( not ( = ?auto_449577 ?auto_449579 ) ) ( not ( = ?auto_449577 ?auto_449580 ) ) ( not ( = ?auto_449578 ?auto_449579 ) ) ( not ( = ?auto_449578 ?auto_449580 ) ) ( not ( = ?auto_449579 ?auto_449580 ) ) ( CLEAR ?auto_449577 ) ( ON ?auto_449578 ?auto_449579 ) ( CLEAR ?auto_449578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_449574 ?auto_449575 ?auto_449576 ?auto_449577 ?auto_449578 )
      ( MAKE-6PILE ?auto_449574 ?auto_449575 ?auto_449576 ?auto_449577 ?auto_449578 ?auto_449579 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449587 - BLOCK
      ?auto_449588 - BLOCK
      ?auto_449589 - BLOCK
      ?auto_449590 - BLOCK
      ?auto_449591 - BLOCK
      ?auto_449592 - BLOCK
    )
    :vars
    (
      ?auto_449593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449592 ?auto_449593 ) ( ON-TABLE ?auto_449587 ) ( ON ?auto_449588 ?auto_449587 ) ( ON ?auto_449589 ?auto_449588 ) ( ON ?auto_449590 ?auto_449589 ) ( not ( = ?auto_449587 ?auto_449588 ) ) ( not ( = ?auto_449587 ?auto_449589 ) ) ( not ( = ?auto_449587 ?auto_449590 ) ) ( not ( = ?auto_449587 ?auto_449591 ) ) ( not ( = ?auto_449587 ?auto_449592 ) ) ( not ( = ?auto_449587 ?auto_449593 ) ) ( not ( = ?auto_449588 ?auto_449589 ) ) ( not ( = ?auto_449588 ?auto_449590 ) ) ( not ( = ?auto_449588 ?auto_449591 ) ) ( not ( = ?auto_449588 ?auto_449592 ) ) ( not ( = ?auto_449588 ?auto_449593 ) ) ( not ( = ?auto_449589 ?auto_449590 ) ) ( not ( = ?auto_449589 ?auto_449591 ) ) ( not ( = ?auto_449589 ?auto_449592 ) ) ( not ( = ?auto_449589 ?auto_449593 ) ) ( not ( = ?auto_449590 ?auto_449591 ) ) ( not ( = ?auto_449590 ?auto_449592 ) ) ( not ( = ?auto_449590 ?auto_449593 ) ) ( not ( = ?auto_449591 ?auto_449592 ) ) ( not ( = ?auto_449591 ?auto_449593 ) ) ( not ( = ?auto_449592 ?auto_449593 ) ) ( CLEAR ?auto_449590 ) ( ON ?auto_449591 ?auto_449592 ) ( CLEAR ?auto_449591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_449587 ?auto_449588 ?auto_449589 ?auto_449590 ?auto_449591 )
      ( MAKE-6PILE ?auto_449587 ?auto_449588 ?auto_449589 ?auto_449590 ?auto_449591 ?auto_449592 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449600 - BLOCK
      ?auto_449601 - BLOCK
      ?auto_449602 - BLOCK
      ?auto_449603 - BLOCK
      ?auto_449604 - BLOCK
      ?auto_449605 - BLOCK
    )
    :vars
    (
      ?auto_449606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449605 ?auto_449606 ) ( ON-TABLE ?auto_449600 ) ( ON ?auto_449601 ?auto_449600 ) ( ON ?auto_449602 ?auto_449601 ) ( not ( = ?auto_449600 ?auto_449601 ) ) ( not ( = ?auto_449600 ?auto_449602 ) ) ( not ( = ?auto_449600 ?auto_449603 ) ) ( not ( = ?auto_449600 ?auto_449604 ) ) ( not ( = ?auto_449600 ?auto_449605 ) ) ( not ( = ?auto_449600 ?auto_449606 ) ) ( not ( = ?auto_449601 ?auto_449602 ) ) ( not ( = ?auto_449601 ?auto_449603 ) ) ( not ( = ?auto_449601 ?auto_449604 ) ) ( not ( = ?auto_449601 ?auto_449605 ) ) ( not ( = ?auto_449601 ?auto_449606 ) ) ( not ( = ?auto_449602 ?auto_449603 ) ) ( not ( = ?auto_449602 ?auto_449604 ) ) ( not ( = ?auto_449602 ?auto_449605 ) ) ( not ( = ?auto_449602 ?auto_449606 ) ) ( not ( = ?auto_449603 ?auto_449604 ) ) ( not ( = ?auto_449603 ?auto_449605 ) ) ( not ( = ?auto_449603 ?auto_449606 ) ) ( not ( = ?auto_449604 ?auto_449605 ) ) ( not ( = ?auto_449604 ?auto_449606 ) ) ( not ( = ?auto_449605 ?auto_449606 ) ) ( ON ?auto_449604 ?auto_449605 ) ( CLEAR ?auto_449602 ) ( ON ?auto_449603 ?auto_449604 ) ( CLEAR ?auto_449603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449600 ?auto_449601 ?auto_449602 ?auto_449603 )
      ( MAKE-6PILE ?auto_449600 ?auto_449601 ?auto_449602 ?auto_449603 ?auto_449604 ?auto_449605 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449613 - BLOCK
      ?auto_449614 - BLOCK
      ?auto_449615 - BLOCK
      ?auto_449616 - BLOCK
      ?auto_449617 - BLOCK
      ?auto_449618 - BLOCK
    )
    :vars
    (
      ?auto_449619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449618 ?auto_449619 ) ( ON-TABLE ?auto_449613 ) ( ON ?auto_449614 ?auto_449613 ) ( ON ?auto_449615 ?auto_449614 ) ( not ( = ?auto_449613 ?auto_449614 ) ) ( not ( = ?auto_449613 ?auto_449615 ) ) ( not ( = ?auto_449613 ?auto_449616 ) ) ( not ( = ?auto_449613 ?auto_449617 ) ) ( not ( = ?auto_449613 ?auto_449618 ) ) ( not ( = ?auto_449613 ?auto_449619 ) ) ( not ( = ?auto_449614 ?auto_449615 ) ) ( not ( = ?auto_449614 ?auto_449616 ) ) ( not ( = ?auto_449614 ?auto_449617 ) ) ( not ( = ?auto_449614 ?auto_449618 ) ) ( not ( = ?auto_449614 ?auto_449619 ) ) ( not ( = ?auto_449615 ?auto_449616 ) ) ( not ( = ?auto_449615 ?auto_449617 ) ) ( not ( = ?auto_449615 ?auto_449618 ) ) ( not ( = ?auto_449615 ?auto_449619 ) ) ( not ( = ?auto_449616 ?auto_449617 ) ) ( not ( = ?auto_449616 ?auto_449618 ) ) ( not ( = ?auto_449616 ?auto_449619 ) ) ( not ( = ?auto_449617 ?auto_449618 ) ) ( not ( = ?auto_449617 ?auto_449619 ) ) ( not ( = ?auto_449618 ?auto_449619 ) ) ( ON ?auto_449617 ?auto_449618 ) ( CLEAR ?auto_449615 ) ( ON ?auto_449616 ?auto_449617 ) ( CLEAR ?auto_449616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449613 ?auto_449614 ?auto_449615 ?auto_449616 )
      ( MAKE-6PILE ?auto_449613 ?auto_449614 ?auto_449615 ?auto_449616 ?auto_449617 ?auto_449618 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449626 - BLOCK
      ?auto_449627 - BLOCK
      ?auto_449628 - BLOCK
      ?auto_449629 - BLOCK
      ?auto_449630 - BLOCK
      ?auto_449631 - BLOCK
    )
    :vars
    (
      ?auto_449632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449631 ?auto_449632 ) ( ON-TABLE ?auto_449626 ) ( ON ?auto_449627 ?auto_449626 ) ( not ( = ?auto_449626 ?auto_449627 ) ) ( not ( = ?auto_449626 ?auto_449628 ) ) ( not ( = ?auto_449626 ?auto_449629 ) ) ( not ( = ?auto_449626 ?auto_449630 ) ) ( not ( = ?auto_449626 ?auto_449631 ) ) ( not ( = ?auto_449626 ?auto_449632 ) ) ( not ( = ?auto_449627 ?auto_449628 ) ) ( not ( = ?auto_449627 ?auto_449629 ) ) ( not ( = ?auto_449627 ?auto_449630 ) ) ( not ( = ?auto_449627 ?auto_449631 ) ) ( not ( = ?auto_449627 ?auto_449632 ) ) ( not ( = ?auto_449628 ?auto_449629 ) ) ( not ( = ?auto_449628 ?auto_449630 ) ) ( not ( = ?auto_449628 ?auto_449631 ) ) ( not ( = ?auto_449628 ?auto_449632 ) ) ( not ( = ?auto_449629 ?auto_449630 ) ) ( not ( = ?auto_449629 ?auto_449631 ) ) ( not ( = ?auto_449629 ?auto_449632 ) ) ( not ( = ?auto_449630 ?auto_449631 ) ) ( not ( = ?auto_449630 ?auto_449632 ) ) ( not ( = ?auto_449631 ?auto_449632 ) ) ( ON ?auto_449630 ?auto_449631 ) ( ON ?auto_449629 ?auto_449630 ) ( CLEAR ?auto_449627 ) ( ON ?auto_449628 ?auto_449629 ) ( CLEAR ?auto_449628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449626 ?auto_449627 ?auto_449628 )
      ( MAKE-6PILE ?auto_449626 ?auto_449627 ?auto_449628 ?auto_449629 ?auto_449630 ?auto_449631 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449639 - BLOCK
      ?auto_449640 - BLOCK
      ?auto_449641 - BLOCK
      ?auto_449642 - BLOCK
      ?auto_449643 - BLOCK
      ?auto_449644 - BLOCK
    )
    :vars
    (
      ?auto_449645 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449644 ?auto_449645 ) ( ON-TABLE ?auto_449639 ) ( ON ?auto_449640 ?auto_449639 ) ( not ( = ?auto_449639 ?auto_449640 ) ) ( not ( = ?auto_449639 ?auto_449641 ) ) ( not ( = ?auto_449639 ?auto_449642 ) ) ( not ( = ?auto_449639 ?auto_449643 ) ) ( not ( = ?auto_449639 ?auto_449644 ) ) ( not ( = ?auto_449639 ?auto_449645 ) ) ( not ( = ?auto_449640 ?auto_449641 ) ) ( not ( = ?auto_449640 ?auto_449642 ) ) ( not ( = ?auto_449640 ?auto_449643 ) ) ( not ( = ?auto_449640 ?auto_449644 ) ) ( not ( = ?auto_449640 ?auto_449645 ) ) ( not ( = ?auto_449641 ?auto_449642 ) ) ( not ( = ?auto_449641 ?auto_449643 ) ) ( not ( = ?auto_449641 ?auto_449644 ) ) ( not ( = ?auto_449641 ?auto_449645 ) ) ( not ( = ?auto_449642 ?auto_449643 ) ) ( not ( = ?auto_449642 ?auto_449644 ) ) ( not ( = ?auto_449642 ?auto_449645 ) ) ( not ( = ?auto_449643 ?auto_449644 ) ) ( not ( = ?auto_449643 ?auto_449645 ) ) ( not ( = ?auto_449644 ?auto_449645 ) ) ( ON ?auto_449643 ?auto_449644 ) ( ON ?auto_449642 ?auto_449643 ) ( CLEAR ?auto_449640 ) ( ON ?auto_449641 ?auto_449642 ) ( CLEAR ?auto_449641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449639 ?auto_449640 ?auto_449641 )
      ( MAKE-6PILE ?auto_449639 ?auto_449640 ?auto_449641 ?auto_449642 ?auto_449643 ?auto_449644 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449652 - BLOCK
      ?auto_449653 - BLOCK
      ?auto_449654 - BLOCK
      ?auto_449655 - BLOCK
      ?auto_449656 - BLOCK
      ?auto_449657 - BLOCK
    )
    :vars
    (
      ?auto_449658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449657 ?auto_449658 ) ( ON-TABLE ?auto_449652 ) ( not ( = ?auto_449652 ?auto_449653 ) ) ( not ( = ?auto_449652 ?auto_449654 ) ) ( not ( = ?auto_449652 ?auto_449655 ) ) ( not ( = ?auto_449652 ?auto_449656 ) ) ( not ( = ?auto_449652 ?auto_449657 ) ) ( not ( = ?auto_449652 ?auto_449658 ) ) ( not ( = ?auto_449653 ?auto_449654 ) ) ( not ( = ?auto_449653 ?auto_449655 ) ) ( not ( = ?auto_449653 ?auto_449656 ) ) ( not ( = ?auto_449653 ?auto_449657 ) ) ( not ( = ?auto_449653 ?auto_449658 ) ) ( not ( = ?auto_449654 ?auto_449655 ) ) ( not ( = ?auto_449654 ?auto_449656 ) ) ( not ( = ?auto_449654 ?auto_449657 ) ) ( not ( = ?auto_449654 ?auto_449658 ) ) ( not ( = ?auto_449655 ?auto_449656 ) ) ( not ( = ?auto_449655 ?auto_449657 ) ) ( not ( = ?auto_449655 ?auto_449658 ) ) ( not ( = ?auto_449656 ?auto_449657 ) ) ( not ( = ?auto_449656 ?auto_449658 ) ) ( not ( = ?auto_449657 ?auto_449658 ) ) ( ON ?auto_449656 ?auto_449657 ) ( ON ?auto_449655 ?auto_449656 ) ( ON ?auto_449654 ?auto_449655 ) ( CLEAR ?auto_449652 ) ( ON ?auto_449653 ?auto_449654 ) ( CLEAR ?auto_449653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449652 ?auto_449653 )
      ( MAKE-6PILE ?auto_449652 ?auto_449653 ?auto_449654 ?auto_449655 ?auto_449656 ?auto_449657 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449665 - BLOCK
      ?auto_449666 - BLOCK
      ?auto_449667 - BLOCK
      ?auto_449668 - BLOCK
      ?auto_449669 - BLOCK
      ?auto_449670 - BLOCK
    )
    :vars
    (
      ?auto_449671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449670 ?auto_449671 ) ( ON-TABLE ?auto_449665 ) ( not ( = ?auto_449665 ?auto_449666 ) ) ( not ( = ?auto_449665 ?auto_449667 ) ) ( not ( = ?auto_449665 ?auto_449668 ) ) ( not ( = ?auto_449665 ?auto_449669 ) ) ( not ( = ?auto_449665 ?auto_449670 ) ) ( not ( = ?auto_449665 ?auto_449671 ) ) ( not ( = ?auto_449666 ?auto_449667 ) ) ( not ( = ?auto_449666 ?auto_449668 ) ) ( not ( = ?auto_449666 ?auto_449669 ) ) ( not ( = ?auto_449666 ?auto_449670 ) ) ( not ( = ?auto_449666 ?auto_449671 ) ) ( not ( = ?auto_449667 ?auto_449668 ) ) ( not ( = ?auto_449667 ?auto_449669 ) ) ( not ( = ?auto_449667 ?auto_449670 ) ) ( not ( = ?auto_449667 ?auto_449671 ) ) ( not ( = ?auto_449668 ?auto_449669 ) ) ( not ( = ?auto_449668 ?auto_449670 ) ) ( not ( = ?auto_449668 ?auto_449671 ) ) ( not ( = ?auto_449669 ?auto_449670 ) ) ( not ( = ?auto_449669 ?auto_449671 ) ) ( not ( = ?auto_449670 ?auto_449671 ) ) ( ON ?auto_449669 ?auto_449670 ) ( ON ?auto_449668 ?auto_449669 ) ( ON ?auto_449667 ?auto_449668 ) ( CLEAR ?auto_449665 ) ( ON ?auto_449666 ?auto_449667 ) ( CLEAR ?auto_449666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449665 ?auto_449666 )
      ( MAKE-6PILE ?auto_449665 ?auto_449666 ?auto_449667 ?auto_449668 ?auto_449669 ?auto_449670 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449678 - BLOCK
      ?auto_449679 - BLOCK
      ?auto_449680 - BLOCK
      ?auto_449681 - BLOCK
      ?auto_449682 - BLOCK
      ?auto_449683 - BLOCK
    )
    :vars
    (
      ?auto_449684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449683 ?auto_449684 ) ( not ( = ?auto_449678 ?auto_449679 ) ) ( not ( = ?auto_449678 ?auto_449680 ) ) ( not ( = ?auto_449678 ?auto_449681 ) ) ( not ( = ?auto_449678 ?auto_449682 ) ) ( not ( = ?auto_449678 ?auto_449683 ) ) ( not ( = ?auto_449678 ?auto_449684 ) ) ( not ( = ?auto_449679 ?auto_449680 ) ) ( not ( = ?auto_449679 ?auto_449681 ) ) ( not ( = ?auto_449679 ?auto_449682 ) ) ( not ( = ?auto_449679 ?auto_449683 ) ) ( not ( = ?auto_449679 ?auto_449684 ) ) ( not ( = ?auto_449680 ?auto_449681 ) ) ( not ( = ?auto_449680 ?auto_449682 ) ) ( not ( = ?auto_449680 ?auto_449683 ) ) ( not ( = ?auto_449680 ?auto_449684 ) ) ( not ( = ?auto_449681 ?auto_449682 ) ) ( not ( = ?auto_449681 ?auto_449683 ) ) ( not ( = ?auto_449681 ?auto_449684 ) ) ( not ( = ?auto_449682 ?auto_449683 ) ) ( not ( = ?auto_449682 ?auto_449684 ) ) ( not ( = ?auto_449683 ?auto_449684 ) ) ( ON ?auto_449682 ?auto_449683 ) ( ON ?auto_449681 ?auto_449682 ) ( ON ?auto_449680 ?auto_449681 ) ( ON ?auto_449679 ?auto_449680 ) ( ON ?auto_449678 ?auto_449679 ) ( CLEAR ?auto_449678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449678 )
      ( MAKE-6PILE ?auto_449678 ?auto_449679 ?auto_449680 ?auto_449681 ?auto_449682 ?auto_449683 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_449691 - BLOCK
      ?auto_449692 - BLOCK
      ?auto_449693 - BLOCK
      ?auto_449694 - BLOCK
      ?auto_449695 - BLOCK
      ?auto_449696 - BLOCK
    )
    :vars
    (
      ?auto_449697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449696 ?auto_449697 ) ( not ( = ?auto_449691 ?auto_449692 ) ) ( not ( = ?auto_449691 ?auto_449693 ) ) ( not ( = ?auto_449691 ?auto_449694 ) ) ( not ( = ?auto_449691 ?auto_449695 ) ) ( not ( = ?auto_449691 ?auto_449696 ) ) ( not ( = ?auto_449691 ?auto_449697 ) ) ( not ( = ?auto_449692 ?auto_449693 ) ) ( not ( = ?auto_449692 ?auto_449694 ) ) ( not ( = ?auto_449692 ?auto_449695 ) ) ( not ( = ?auto_449692 ?auto_449696 ) ) ( not ( = ?auto_449692 ?auto_449697 ) ) ( not ( = ?auto_449693 ?auto_449694 ) ) ( not ( = ?auto_449693 ?auto_449695 ) ) ( not ( = ?auto_449693 ?auto_449696 ) ) ( not ( = ?auto_449693 ?auto_449697 ) ) ( not ( = ?auto_449694 ?auto_449695 ) ) ( not ( = ?auto_449694 ?auto_449696 ) ) ( not ( = ?auto_449694 ?auto_449697 ) ) ( not ( = ?auto_449695 ?auto_449696 ) ) ( not ( = ?auto_449695 ?auto_449697 ) ) ( not ( = ?auto_449696 ?auto_449697 ) ) ( ON ?auto_449695 ?auto_449696 ) ( ON ?auto_449694 ?auto_449695 ) ( ON ?auto_449693 ?auto_449694 ) ( ON ?auto_449692 ?auto_449693 ) ( ON ?auto_449691 ?auto_449692 ) ( CLEAR ?auto_449691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449691 )
      ( MAKE-6PILE ?auto_449691 ?auto_449692 ?auto_449693 ?auto_449694 ?auto_449695 ?auto_449696 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449705 - BLOCK
      ?auto_449706 - BLOCK
      ?auto_449707 - BLOCK
      ?auto_449708 - BLOCK
      ?auto_449709 - BLOCK
      ?auto_449710 - BLOCK
      ?auto_449711 - BLOCK
    )
    :vars
    (
      ?auto_449712 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449710 ) ( ON ?auto_449711 ?auto_449712 ) ( CLEAR ?auto_449711 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449705 ) ( ON ?auto_449706 ?auto_449705 ) ( ON ?auto_449707 ?auto_449706 ) ( ON ?auto_449708 ?auto_449707 ) ( ON ?auto_449709 ?auto_449708 ) ( ON ?auto_449710 ?auto_449709 ) ( not ( = ?auto_449705 ?auto_449706 ) ) ( not ( = ?auto_449705 ?auto_449707 ) ) ( not ( = ?auto_449705 ?auto_449708 ) ) ( not ( = ?auto_449705 ?auto_449709 ) ) ( not ( = ?auto_449705 ?auto_449710 ) ) ( not ( = ?auto_449705 ?auto_449711 ) ) ( not ( = ?auto_449705 ?auto_449712 ) ) ( not ( = ?auto_449706 ?auto_449707 ) ) ( not ( = ?auto_449706 ?auto_449708 ) ) ( not ( = ?auto_449706 ?auto_449709 ) ) ( not ( = ?auto_449706 ?auto_449710 ) ) ( not ( = ?auto_449706 ?auto_449711 ) ) ( not ( = ?auto_449706 ?auto_449712 ) ) ( not ( = ?auto_449707 ?auto_449708 ) ) ( not ( = ?auto_449707 ?auto_449709 ) ) ( not ( = ?auto_449707 ?auto_449710 ) ) ( not ( = ?auto_449707 ?auto_449711 ) ) ( not ( = ?auto_449707 ?auto_449712 ) ) ( not ( = ?auto_449708 ?auto_449709 ) ) ( not ( = ?auto_449708 ?auto_449710 ) ) ( not ( = ?auto_449708 ?auto_449711 ) ) ( not ( = ?auto_449708 ?auto_449712 ) ) ( not ( = ?auto_449709 ?auto_449710 ) ) ( not ( = ?auto_449709 ?auto_449711 ) ) ( not ( = ?auto_449709 ?auto_449712 ) ) ( not ( = ?auto_449710 ?auto_449711 ) ) ( not ( = ?auto_449710 ?auto_449712 ) ) ( not ( = ?auto_449711 ?auto_449712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449711 ?auto_449712 )
      ( !STACK ?auto_449711 ?auto_449710 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449720 - BLOCK
      ?auto_449721 - BLOCK
      ?auto_449722 - BLOCK
      ?auto_449723 - BLOCK
      ?auto_449724 - BLOCK
      ?auto_449725 - BLOCK
      ?auto_449726 - BLOCK
    )
    :vars
    (
      ?auto_449727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449725 ) ( ON ?auto_449726 ?auto_449727 ) ( CLEAR ?auto_449726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449720 ) ( ON ?auto_449721 ?auto_449720 ) ( ON ?auto_449722 ?auto_449721 ) ( ON ?auto_449723 ?auto_449722 ) ( ON ?auto_449724 ?auto_449723 ) ( ON ?auto_449725 ?auto_449724 ) ( not ( = ?auto_449720 ?auto_449721 ) ) ( not ( = ?auto_449720 ?auto_449722 ) ) ( not ( = ?auto_449720 ?auto_449723 ) ) ( not ( = ?auto_449720 ?auto_449724 ) ) ( not ( = ?auto_449720 ?auto_449725 ) ) ( not ( = ?auto_449720 ?auto_449726 ) ) ( not ( = ?auto_449720 ?auto_449727 ) ) ( not ( = ?auto_449721 ?auto_449722 ) ) ( not ( = ?auto_449721 ?auto_449723 ) ) ( not ( = ?auto_449721 ?auto_449724 ) ) ( not ( = ?auto_449721 ?auto_449725 ) ) ( not ( = ?auto_449721 ?auto_449726 ) ) ( not ( = ?auto_449721 ?auto_449727 ) ) ( not ( = ?auto_449722 ?auto_449723 ) ) ( not ( = ?auto_449722 ?auto_449724 ) ) ( not ( = ?auto_449722 ?auto_449725 ) ) ( not ( = ?auto_449722 ?auto_449726 ) ) ( not ( = ?auto_449722 ?auto_449727 ) ) ( not ( = ?auto_449723 ?auto_449724 ) ) ( not ( = ?auto_449723 ?auto_449725 ) ) ( not ( = ?auto_449723 ?auto_449726 ) ) ( not ( = ?auto_449723 ?auto_449727 ) ) ( not ( = ?auto_449724 ?auto_449725 ) ) ( not ( = ?auto_449724 ?auto_449726 ) ) ( not ( = ?auto_449724 ?auto_449727 ) ) ( not ( = ?auto_449725 ?auto_449726 ) ) ( not ( = ?auto_449725 ?auto_449727 ) ) ( not ( = ?auto_449726 ?auto_449727 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449726 ?auto_449727 )
      ( !STACK ?auto_449726 ?auto_449725 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449735 - BLOCK
      ?auto_449736 - BLOCK
      ?auto_449737 - BLOCK
      ?auto_449738 - BLOCK
      ?auto_449739 - BLOCK
      ?auto_449740 - BLOCK
      ?auto_449741 - BLOCK
    )
    :vars
    (
      ?auto_449742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449741 ?auto_449742 ) ( ON-TABLE ?auto_449735 ) ( ON ?auto_449736 ?auto_449735 ) ( ON ?auto_449737 ?auto_449736 ) ( ON ?auto_449738 ?auto_449737 ) ( ON ?auto_449739 ?auto_449738 ) ( not ( = ?auto_449735 ?auto_449736 ) ) ( not ( = ?auto_449735 ?auto_449737 ) ) ( not ( = ?auto_449735 ?auto_449738 ) ) ( not ( = ?auto_449735 ?auto_449739 ) ) ( not ( = ?auto_449735 ?auto_449740 ) ) ( not ( = ?auto_449735 ?auto_449741 ) ) ( not ( = ?auto_449735 ?auto_449742 ) ) ( not ( = ?auto_449736 ?auto_449737 ) ) ( not ( = ?auto_449736 ?auto_449738 ) ) ( not ( = ?auto_449736 ?auto_449739 ) ) ( not ( = ?auto_449736 ?auto_449740 ) ) ( not ( = ?auto_449736 ?auto_449741 ) ) ( not ( = ?auto_449736 ?auto_449742 ) ) ( not ( = ?auto_449737 ?auto_449738 ) ) ( not ( = ?auto_449737 ?auto_449739 ) ) ( not ( = ?auto_449737 ?auto_449740 ) ) ( not ( = ?auto_449737 ?auto_449741 ) ) ( not ( = ?auto_449737 ?auto_449742 ) ) ( not ( = ?auto_449738 ?auto_449739 ) ) ( not ( = ?auto_449738 ?auto_449740 ) ) ( not ( = ?auto_449738 ?auto_449741 ) ) ( not ( = ?auto_449738 ?auto_449742 ) ) ( not ( = ?auto_449739 ?auto_449740 ) ) ( not ( = ?auto_449739 ?auto_449741 ) ) ( not ( = ?auto_449739 ?auto_449742 ) ) ( not ( = ?auto_449740 ?auto_449741 ) ) ( not ( = ?auto_449740 ?auto_449742 ) ) ( not ( = ?auto_449741 ?auto_449742 ) ) ( CLEAR ?auto_449739 ) ( ON ?auto_449740 ?auto_449741 ) ( CLEAR ?auto_449740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_449735 ?auto_449736 ?auto_449737 ?auto_449738 ?auto_449739 ?auto_449740 )
      ( MAKE-7PILE ?auto_449735 ?auto_449736 ?auto_449737 ?auto_449738 ?auto_449739 ?auto_449740 ?auto_449741 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449750 - BLOCK
      ?auto_449751 - BLOCK
      ?auto_449752 - BLOCK
      ?auto_449753 - BLOCK
      ?auto_449754 - BLOCK
      ?auto_449755 - BLOCK
      ?auto_449756 - BLOCK
    )
    :vars
    (
      ?auto_449757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449756 ?auto_449757 ) ( ON-TABLE ?auto_449750 ) ( ON ?auto_449751 ?auto_449750 ) ( ON ?auto_449752 ?auto_449751 ) ( ON ?auto_449753 ?auto_449752 ) ( ON ?auto_449754 ?auto_449753 ) ( not ( = ?auto_449750 ?auto_449751 ) ) ( not ( = ?auto_449750 ?auto_449752 ) ) ( not ( = ?auto_449750 ?auto_449753 ) ) ( not ( = ?auto_449750 ?auto_449754 ) ) ( not ( = ?auto_449750 ?auto_449755 ) ) ( not ( = ?auto_449750 ?auto_449756 ) ) ( not ( = ?auto_449750 ?auto_449757 ) ) ( not ( = ?auto_449751 ?auto_449752 ) ) ( not ( = ?auto_449751 ?auto_449753 ) ) ( not ( = ?auto_449751 ?auto_449754 ) ) ( not ( = ?auto_449751 ?auto_449755 ) ) ( not ( = ?auto_449751 ?auto_449756 ) ) ( not ( = ?auto_449751 ?auto_449757 ) ) ( not ( = ?auto_449752 ?auto_449753 ) ) ( not ( = ?auto_449752 ?auto_449754 ) ) ( not ( = ?auto_449752 ?auto_449755 ) ) ( not ( = ?auto_449752 ?auto_449756 ) ) ( not ( = ?auto_449752 ?auto_449757 ) ) ( not ( = ?auto_449753 ?auto_449754 ) ) ( not ( = ?auto_449753 ?auto_449755 ) ) ( not ( = ?auto_449753 ?auto_449756 ) ) ( not ( = ?auto_449753 ?auto_449757 ) ) ( not ( = ?auto_449754 ?auto_449755 ) ) ( not ( = ?auto_449754 ?auto_449756 ) ) ( not ( = ?auto_449754 ?auto_449757 ) ) ( not ( = ?auto_449755 ?auto_449756 ) ) ( not ( = ?auto_449755 ?auto_449757 ) ) ( not ( = ?auto_449756 ?auto_449757 ) ) ( CLEAR ?auto_449754 ) ( ON ?auto_449755 ?auto_449756 ) ( CLEAR ?auto_449755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_449750 ?auto_449751 ?auto_449752 ?auto_449753 ?auto_449754 ?auto_449755 )
      ( MAKE-7PILE ?auto_449750 ?auto_449751 ?auto_449752 ?auto_449753 ?auto_449754 ?auto_449755 ?auto_449756 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449765 - BLOCK
      ?auto_449766 - BLOCK
      ?auto_449767 - BLOCK
      ?auto_449768 - BLOCK
      ?auto_449769 - BLOCK
      ?auto_449770 - BLOCK
      ?auto_449771 - BLOCK
    )
    :vars
    (
      ?auto_449772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449771 ?auto_449772 ) ( ON-TABLE ?auto_449765 ) ( ON ?auto_449766 ?auto_449765 ) ( ON ?auto_449767 ?auto_449766 ) ( ON ?auto_449768 ?auto_449767 ) ( not ( = ?auto_449765 ?auto_449766 ) ) ( not ( = ?auto_449765 ?auto_449767 ) ) ( not ( = ?auto_449765 ?auto_449768 ) ) ( not ( = ?auto_449765 ?auto_449769 ) ) ( not ( = ?auto_449765 ?auto_449770 ) ) ( not ( = ?auto_449765 ?auto_449771 ) ) ( not ( = ?auto_449765 ?auto_449772 ) ) ( not ( = ?auto_449766 ?auto_449767 ) ) ( not ( = ?auto_449766 ?auto_449768 ) ) ( not ( = ?auto_449766 ?auto_449769 ) ) ( not ( = ?auto_449766 ?auto_449770 ) ) ( not ( = ?auto_449766 ?auto_449771 ) ) ( not ( = ?auto_449766 ?auto_449772 ) ) ( not ( = ?auto_449767 ?auto_449768 ) ) ( not ( = ?auto_449767 ?auto_449769 ) ) ( not ( = ?auto_449767 ?auto_449770 ) ) ( not ( = ?auto_449767 ?auto_449771 ) ) ( not ( = ?auto_449767 ?auto_449772 ) ) ( not ( = ?auto_449768 ?auto_449769 ) ) ( not ( = ?auto_449768 ?auto_449770 ) ) ( not ( = ?auto_449768 ?auto_449771 ) ) ( not ( = ?auto_449768 ?auto_449772 ) ) ( not ( = ?auto_449769 ?auto_449770 ) ) ( not ( = ?auto_449769 ?auto_449771 ) ) ( not ( = ?auto_449769 ?auto_449772 ) ) ( not ( = ?auto_449770 ?auto_449771 ) ) ( not ( = ?auto_449770 ?auto_449772 ) ) ( not ( = ?auto_449771 ?auto_449772 ) ) ( ON ?auto_449770 ?auto_449771 ) ( CLEAR ?auto_449768 ) ( ON ?auto_449769 ?auto_449770 ) ( CLEAR ?auto_449769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_449765 ?auto_449766 ?auto_449767 ?auto_449768 ?auto_449769 )
      ( MAKE-7PILE ?auto_449765 ?auto_449766 ?auto_449767 ?auto_449768 ?auto_449769 ?auto_449770 ?auto_449771 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449780 - BLOCK
      ?auto_449781 - BLOCK
      ?auto_449782 - BLOCK
      ?auto_449783 - BLOCK
      ?auto_449784 - BLOCK
      ?auto_449785 - BLOCK
      ?auto_449786 - BLOCK
    )
    :vars
    (
      ?auto_449787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449786 ?auto_449787 ) ( ON-TABLE ?auto_449780 ) ( ON ?auto_449781 ?auto_449780 ) ( ON ?auto_449782 ?auto_449781 ) ( ON ?auto_449783 ?auto_449782 ) ( not ( = ?auto_449780 ?auto_449781 ) ) ( not ( = ?auto_449780 ?auto_449782 ) ) ( not ( = ?auto_449780 ?auto_449783 ) ) ( not ( = ?auto_449780 ?auto_449784 ) ) ( not ( = ?auto_449780 ?auto_449785 ) ) ( not ( = ?auto_449780 ?auto_449786 ) ) ( not ( = ?auto_449780 ?auto_449787 ) ) ( not ( = ?auto_449781 ?auto_449782 ) ) ( not ( = ?auto_449781 ?auto_449783 ) ) ( not ( = ?auto_449781 ?auto_449784 ) ) ( not ( = ?auto_449781 ?auto_449785 ) ) ( not ( = ?auto_449781 ?auto_449786 ) ) ( not ( = ?auto_449781 ?auto_449787 ) ) ( not ( = ?auto_449782 ?auto_449783 ) ) ( not ( = ?auto_449782 ?auto_449784 ) ) ( not ( = ?auto_449782 ?auto_449785 ) ) ( not ( = ?auto_449782 ?auto_449786 ) ) ( not ( = ?auto_449782 ?auto_449787 ) ) ( not ( = ?auto_449783 ?auto_449784 ) ) ( not ( = ?auto_449783 ?auto_449785 ) ) ( not ( = ?auto_449783 ?auto_449786 ) ) ( not ( = ?auto_449783 ?auto_449787 ) ) ( not ( = ?auto_449784 ?auto_449785 ) ) ( not ( = ?auto_449784 ?auto_449786 ) ) ( not ( = ?auto_449784 ?auto_449787 ) ) ( not ( = ?auto_449785 ?auto_449786 ) ) ( not ( = ?auto_449785 ?auto_449787 ) ) ( not ( = ?auto_449786 ?auto_449787 ) ) ( ON ?auto_449785 ?auto_449786 ) ( CLEAR ?auto_449783 ) ( ON ?auto_449784 ?auto_449785 ) ( CLEAR ?auto_449784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_449780 ?auto_449781 ?auto_449782 ?auto_449783 ?auto_449784 )
      ( MAKE-7PILE ?auto_449780 ?auto_449781 ?auto_449782 ?auto_449783 ?auto_449784 ?auto_449785 ?auto_449786 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449795 - BLOCK
      ?auto_449796 - BLOCK
      ?auto_449797 - BLOCK
      ?auto_449798 - BLOCK
      ?auto_449799 - BLOCK
      ?auto_449800 - BLOCK
      ?auto_449801 - BLOCK
    )
    :vars
    (
      ?auto_449802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449801 ?auto_449802 ) ( ON-TABLE ?auto_449795 ) ( ON ?auto_449796 ?auto_449795 ) ( ON ?auto_449797 ?auto_449796 ) ( not ( = ?auto_449795 ?auto_449796 ) ) ( not ( = ?auto_449795 ?auto_449797 ) ) ( not ( = ?auto_449795 ?auto_449798 ) ) ( not ( = ?auto_449795 ?auto_449799 ) ) ( not ( = ?auto_449795 ?auto_449800 ) ) ( not ( = ?auto_449795 ?auto_449801 ) ) ( not ( = ?auto_449795 ?auto_449802 ) ) ( not ( = ?auto_449796 ?auto_449797 ) ) ( not ( = ?auto_449796 ?auto_449798 ) ) ( not ( = ?auto_449796 ?auto_449799 ) ) ( not ( = ?auto_449796 ?auto_449800 ) ) ( not ( = ?auto_449796 ?auto_449801 ) ) ( not ( = ?auto_449796 ?auto_449802 ) ) ( not ( = ?auto_449797 ?auto_449798 ) ) ( not ( = ?auto_449797 ?auto_449799 ) ) ( not ( = ?auto_449797 ?auto_449800 ) ) ( not ( = ?auto_449797 ?auto_449801 ) ) ( not ( = ?auto_449797 ?auto_449802 ) ) ( not ( = ?auto_449798 ?auto_449799 ) ) ( not ( = ?auto_449798 ?auto_449800 ) ) ( not ( = ?auto_449798 ?auto_449801 ) ) ( not ( = ?auto_449798 ?auto_449802 ) ) ( not ( = ?auto_449799 ?auto_449800 ) ) ( not ( = ?auto_449799 ?auto_449801 ) ) ( not ( = ?auto_449799 ?auto_449802 ) ) ( not ( = ?auto_449800 ?auto_449801 ) ) ( not ( = ?auto_449800 ?auto_449802 ) ) ( not ( = ?auto_449801 ?auto_449802 ) ) ( ON ?auto_449800 ?auto_449801 ) ( ON ?auto_449799 ?auto_449800 ) ( CLEAR ?auto_449797 ) ( ON ?auto_449798 ?auto_449799 ) ( CLEAR ?auto_449798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449795 ?auto_449796 ?auto_449797 ?auto_449798 )
      ( MAKE-7PILE ?auto_449795 ?auto_449796 ?auto_449797 ?auto_449798 ?auto_449799 ?auto_449800 ?auto_449801 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449810 - BLOCK
      ?auto_449811 - BLOCK
      ?auto_449812 - BLOCK
      ?auto_449813 - BLOCK
      ?auto_449814 - BLOCK
      ?auto_449815 - BLOCK
      ?auto_449816 - BLOCK
    )
    :vars
    (
      ?auto_449817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449816 ?auto_449817 ) ( ON-TABLE ?auto_449810 ) ( ON ?auto_449811 ?auto_449810 ) ( ON ?auto_449812 ?auto_449811 ) ( not ( = ?auto_449810 ?auto_449811 ) ) ( not ( = ?auto_449810 ?auto_449812 ) ) ( not ( = ?auto_449810 ?auto_449813 ) ) ( not ( = ?auto_449810 ?auto_449814 ) ) ( not ( = ?auto_449810 ?auto_449815 ) ) ( not ( = ?auto_449810 ?auto_449816 ) ) ( not ( = ?auto_449810 ?auto_449817 ) ) ( not ( = ?auto_449811 ?auto_449812 ) ) ( not ( = ?auto_449811 ?auto_449813 ) ) ( not ( = ?auto_449811 ?auto_449814 ) ) ( not ( = ?auto_449811 ?auto_449815 ) ) ( not ( = ?auto_449811 ?auto_449816 ) ) ( not ( = ?auto_449811 ?auto_449817 ) ) ( not ( = ?auto_449812 ?auto_449813 ) ) ( not ( = ?auto_449812 ?auto_449814 ) ) ( not ( = ?auto_449812 ?auto_449815 ) ) ( not ( = ?auto_449812 ?auto_449816 ) ) ( not ( = ?auto_449812 ?auto_449817 ) ) ( not ( = ?auto_449813 ?auto_449814 ) ) ( not ( = ?auto_449813 ?auto_449815 ) ) ( not ( = ?auto_449813 ?auto_449816 ) ) ( not ( = ?auto_449813 ?auto_449817 ) ) ( not ( = ?auto_449814 ?auto_449815 ) ) ( not ( = ?auto_449814 ?auto_449816 ) ) ( not ( = ?auto_449814 ?auto_449817 ) ) ( not ( = ?auto_449815 ?auto_449816 ) ) ( not ( = ?auto_449815 ?auto_449817 ) ) ( not ( = ?auto_449816 ?auto_449817 ) ) ( ON ?auto_449815 ?auto_449816 ) ( ON ?auto_449814 ?auto_449815 ) ( CLEAR ?auto_449812 ) ( ON ?auto_449813 ?auto_449814 ) ( CLEAR ?auto_449813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_449810 ?auto_449811 ?auto_449812 ?auto_449813 )
      ( MAKE-7PILE ?auto_449810 ?auto_449811 ?auto_449812 ?auto_449813 ?auto_449814 ?auto_449815 ?auto_449816 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449825 - BLOCK
      ?auto_449826 - BLOCK
      ?auto_449827 - BLOCK
      ?auto_449828 - BLOCK
      ?auto_449829 - BLOCK
      ?auto_449830 - BLOCK
      ?auto_449831 - BLOCK
    )
    :vars
    (
      ?auto_449832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449831 ?auto_449832 ) ( ON-TABLE ?auto_449825 ) ( ON ?auto_449826 ?auto_449825 ) ( not ( = ?auto_449825 ?auto_449826 ) ) ( not ( = ?auto_449825 ?auto_449827 ) ) ( not ( = ?auto_449825 ?auto_449828 ) ) ( not ( = ?auto_449825 ?auto_449829 ) ) ( not ( = ?auto_449825 ?auto_449830 ) ) ( not ( = ?auto_449825 ?auto_449831 ) ) ( not ( = ?auto_449825 ?auto_449832 ) ) ( not ( = ?auto_449826 ?auto_449827 ) ) ( not ( = ?auto_449826 ?auto_449828 ) ) ( not ( = ?auto_449826 ?auto_449829 ) ) ( not ( = ?auto_449826 ?auto_449830 ) ) ( not ( = ?auto_449826 ?auto_449831 ) ) ( not ( = ?auto_449826 ?auto_449832 ) ) ( not ( = ?auto_449827 ?auto_449828 ) ) ( not ( = ?auto_449827 ?auto_449829 ) ) ( not ( = ?auto_449827 ?auto_449830 ) ) ( not ( = ?auto_449827 ?auto_449831 ) ) ( not ( = ?auto_449827 ?auto_449832 ) ) ( not ( = ?auto_449828 ?auto_449829 ) ) ( not ( = ?auto_449828 ?auto_449830 ) ) ( not ( = ?auto_449828 ?auto_449831 ) ) ( not ( = ?auto_449828 ?auto_449832 ) ) ( not ( = ?auto_449829 ?auto_449830 ) ) ( not ( = ?auto_449829 ?auto_449831 ) ) ( not ( = ?auto_449829 ?auto_449832 ) ) ( not ( = ?auto_449830 ?auto_449831 ) ) ( not ( = ?auto_449830 ?auto_449832 ) ) ( not ( = ?auto_449831 ?auto_449832 ) ) ( ON ?auto_449830 ?auto_449831 ) ( ON ?auto_449829 ?auto_449830 ) ( ON ?auto_449828 ?auto_449829 ) ( CLEAR ?auto_449826 ) ( ON ?auto_449827 ?auto_449828 ) ( CLEAR ?auto_449827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449825 ?auto_449826 ?auto_449827 )
      ( MAKE-7PILE ?auto_449825 ?auto_449826 ?auto_449827 ?auto_449828 ?auto_449829 ?auto_449830 ?auto_449831 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449840 - BLOCK
      ?auto_449841 - BLOCK
      ?auto_449842 - BLOCK
      ?auto_449843 - BLOCK
      ?auto_449844 - BLOCK
      ?auto_449845 - BLOCK
      ?auto_449846 - BLOCK
    )
    :vars
    (
      ?auto_449847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449846 ?auto_449847 ) ( ON-TABLE ?auto_449840 ) ( ON ?auto_449841 ?auto_449840 ) ( not ( = ?auto_449840 ?auto_449841 ) ) ( not ( = ?auto_449840 ?auto_449842 ) ) ( not ( = ?auto_449840 ?auto_449843 ) ) ( not ( = ?auto_449840 ?auto_449844 ) ) ( not ( = ?auto_449840 ?auto_449845 ) ) ( not ( = ?auto_449840 ?auto_449846 ) ) ( not ( = ?auto_449840 ?auto_449847 ) ) ( not ( = ?auto_449841 ?auto_449842 ) ) ( not ( = ?auto_449841 ?auto_449843 ) ) ( not ( = ?auto_449841 ?auto_449844 ) ) ( not ( = ?auto_449841 ?auto_449845 ) ) ( not ( = ?auto_449841 ?auto_449846 ) ) ( not ( = ?auto_449841 ?auto_449847 ) ) ( not ( = ?auto_449842 ?auto_449843 ) ) ( not ( = ?auto_449842 ?auto_449844 ) ) ( not ( = ?auto_449842 ?auto_449845 ) ) ( not ( = ?auto_449842 ?auto_449846 ) ) ( not ( = ?auto_449842 ?auto_449847 ) ) ( not ( = ?auto_449843 ?auto_449844 ) ) ( not ( = ?auto_449843 ?auto_449845 ) ) ( not ( = ?auto_449843 ?auto_449846 ) ) ( not ( = ?auto_449843 ?auto_449847 ) ) ( not ( = ?auto_449844 ?auto_449845 ) ) ( not ( = ?auto_449844 ?auto_449846 ) ) ( not ( = ?auto_449844 ?auto_449847 ) ) ( not ( = ?auto_449845 ?auto_449846 ) ) ( not ( = ?auto_449845 ?auto_449847 ) ) ( not ( = ?auto_449846 ?auto_449847 ) ) ( ON ?auto_449845 ?auto_449846 ) ( ON ?auto_449844 ?auto_449845 ) ( ON ?auto_449843 ?auto_449844 ) ( CLEAR ?auto_449841 ) ( ON ?auto_449842 ?auto_449843 ) ( CLEAR ?auto_449842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_449840 ?auto_449841 ?auto_449842 )
      ( MAKE-7PILE ?auto_449840 ?auto_449841 ?auto_449842 ?auto_449843 ?auto_449844 ?auto_449845 ?auto_449846 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449855 - BLOCK
      ?auto_449856 - BLOCK
      ?auto_449857 - BLOCK
      ?auto_449858 - BLOCK
      ?auto_449859 - BLOCK
      ?auto_449860 - BLOCK
      ?auto_449861 - BLOCK
    )
    :vars
    (
      ?auto_449862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449861 ?auto_449862 ) ( ON-TABLE ?auto_449855 ) ( not ( = ?auto_449855 ?auto_449856 ) ) ( not ( = ?auto_449855 ?auto_449857 ) ) ( not ( = ?auto_449855 ?auto_449858 ) ) ( not ( = ?auto_449855 ?auto_449859 ) ) ( not ( = ?auto_449855 ?auto_449860 ) ) ( not ( = ?auto_449855 ?auto_449861 ) ) ( not ( = ?auto_449855 ?auto_449862 ) ) ( not ( = ?auto_449856 ?auto_449857 ) ) ( not ( = ?auto_449856 ?auto_449858 ) ) ( not ( = ?auto_449856 ?auto_449859 ) ) ( not ( = ?auto_449856 ?auto_449860 ) ) ( not ( = ?auto_449856 ?auto_449861 ) ) ( not ( = ?auto_449856 ?auto_449862 ) ) ( not ( = ?auto_449857 ?auto_449858 ) ) ( not ( = ?auto_449857 ?auto_449859 ) ) ( not ( = ?auto_449857 ?auto_449860 ) ) ( not ( = ?auto_449857 ?auto_449861 ) ) ( not ( = ?auto_449857 ?auto_449862 ) ) ( not ( = ?auto_449858 ?auto_449859 ) ) ( not ( = ?auto_449858 ?auto_449860 ) ) ( not ( = ?auto_449858 ?auto_449861 ) ) ( not ( = ?auto_449858 ?auto_449862 ) ) ( not ( = ?auto_449859 ?auto_449860 ) ) ( not ( = ?auto_449859 ?auto_449861 ) ) ( not ( = ?auto_449859 ?auto_449862 ) ) ( not ( = ?auto_449860 ?auto_449861 ) ) ( not ( = ?auto_449860 ?auto_449862 ) ) ( not ( = ?auto_449861 ?auto_449862 ) ) ( ON ?auto_449860 ?auto_449861 ) ( ON ?auto_449859 ?auto_449860 ) ( ON ?auto_449858 ?auto_449859 ) ( ON ?auto_449857 ?auto_449858 ) ( CLEAR ?auto_449855 ) ( ON ?auto_449856 ?auto_449857 ) ( CLEAR ?auto_449856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449855 ?auto_449856 )
      ( MAKE-7PILE ?auto_449855 ?auto_449856 ?auto_449857 ?auto_449858 ?auto_449859 ?auto_449860 ?auto_449861 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449870 - BLOCK
      ?auto_449871 - BLOCK
      ?auto_449872 - BLOCK
      ?auto_449873 - BLOCK
      ?auto_449874 - BLOCK
      ?auto_449875 - BLOCK
      ?auto_449876 - BLOCK
    )
    :vars
    (
      ?auto_449877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449876 ?auto_449877 ) ( ON-TABLE ?auto_449870 ) ( not ( = ?auto_449870 ?auto_449871 ) ) ( not ( = ?auto_449870 ?auto_449872 ) ) ( not ( = ?auto_449870 ?auto_449873 ) ) ( not ( = ?auto_449870 ?auto_449874 ) ) ( not ( = ?auto_449870 ?auto_449875 ) ) ( not ( = ?auto_449870 ?auto_449876 ) ) ( not ( = ?auto_449870 ?auto_449877 ) ) ( not ( = ?auto_449871 ?auto_449872 ) ) ( not ( = ?auto_449871 ?auto_449873 ) ) ( not ( = ?auto_449871 ?auto_449874 ) ) ( not ( = ?auto_449871 ?auto_449875 ) ) ( not ( = ?auto_449871 ?auto_449876 ) ) ( not ( = ?auto_449871 ?auto_449877 ) ) ( not ( = ?auto_449872 ?auto_449873 ) ) ( not ( = ?auto_449872 ?auto_449874 ) ) ( not ( = ?auto_449872 ?auto_449875 ) ) ( not ( = ?auto_449872 ?auto_449876 ) ) ( not ( = ?auto_449872 ?auto_449877 ) ) ( not ( = ?auto_449873 ?auto_449874 ) ) ( not ( = ?auto_449873 ?auto_449875 ) ) ( not ( = ?auto_449873 ?auto_449876 ) ) ( not ( = ?auto_449873 ?auto_449877 ) ) ( not ( = ?auto_449874 ?auto_449875 ) ) ( not ( = ?auto_449874 ?auto_449876 ) ) ( not ( = ?auto_449874 ?auto_449877 ) ) ( not ( = ?auto_449875 ?auto_449876 ) ) ( not ( = ?auto_449875 ?auto_449877 ) ) ( not ( = ?auto_449876 ?auto_449877 ) ) ( ON ?auto_449875 ?auto_449876 ) ( ON ?auto_449874 ?auto_449875 ) ( ON ?auto_449873 ?auto_449874 ) ( ON ?auto_449872 ?auto_449873 ) ( CLEAR ?auto_449870 ) ( ON ?auto_449871 ?auto_449872 ) ( CLEAR ?auto_449871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_449870 ?auto_449871 )
      ( MAKE-7PILE ?auto_449870 ?auto_449871 ?auto_449872 ?auto_449873 ?auto_449874 ?auto_449875 ?auto_449876 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449885 - BLOCK
      ?auto_449886 - BLOCK
      ?auto_449887 - BLOCK
      ?auto_449888 - BLOCK
      ?auto_449889 - BLOCK
      ?auto_449890 - BLOCK
      ?auto_449891 - BLOCK
    )
    :vars
    (
      ?auto_449892 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449891 ?auto_449892 ) ( not ( = ?auto_449885 ?auto_449886 ) ) ( not ( = ?auto_449885 ?auto_449887 ) ) ( not ( = ?auto_449885 ?auto_449888 ) ) ( not ( = ?auto_449885 ?auto_449889 ) ) ( not ( = ?auto_449885 ?auto_449890 ) ) ( not ( = ?auto_449885 ?auto_449891 ) ) ( not ( = ?auto_449885 ?auto_449892 ) ) ( not ( = ?auto_449886 ?auto_449887 ) ) ( not ( = ?auto_449886 ?auto_449888 ) ) ( not ( = ?auto_449886 ?auto_449889 ) ) ( not ( = ?auto_449886 ?auto_449890 ) ) ( not ( = ?auto_449886 ?auto_449891 ) ) ( not ( = ?auto_449886 ?auto_449892 ) ) ( not ( = ?auto_449887 ?auto_449888 ) ) ( not ( = ?auto_449887 ?auto_449889 ) ) ( not ( = ?auto_449887 ?auto_449890 ) ) ( not ( = ?auto_449887 ?auto_449891 ) ) ( not ( = ?auto_449887 ?auto_449892 ) ) ( not ( = ?auto_449888 ?auto_449889 ) ) ( not ( = ?auto_449888 ?auto_449890 ) ) ( not ( = ?auto_449888 ?auto_449891 ) ) ( not ( = ?auto_449888 ?auto_449892 ) ) ( not ( = ?auto_449889 ?auto_449890 ) ) ( not ( = ?auto_449889 ?auto_449891 ) ) ( not ( = ?auto_449889 ?auto_449892 ) ) ( not ( = ?auto_449890 ?auto_449891 ) ) ( not ( = ?auto_449890 ?auto_449892 ) ) ( not ( = ?auto_449891 ?auto_449892 ) ) ( ON ?auto_449890 ?auto_449891 ) ( ON ?auto_449889 ?auto_449890 ) ( ON ?auto_449888 ?auto_449889 ) ( ON ?auto_449887 ?auto_449888 ) ( ON ?auto_449886 ?auto_449887 ) ( ON ?auto_449885 ?auto_449886 ) ( CLEAR ?auto_449885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449885 )
      ( MAKE-7PILE ?auto_449885 ?auto_449886 ?auto_449887 ?auto_449888 ?auto_449889 ?auto_449890 ?auto_449891 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_449900 - BLOCK
      ?auto_449901 - BLOCK
      ?auto_449902 - BLOCK
      ?auto_449903 - BLOCK
      ?auto_449904 - BLOCK
      ?auto_449905 - BLOCK
      ?auto_449906 - BLOCK
    )
    :vars
    (
      ?auto_449907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449906 ?auto_449907 ) ( not ( = ?auto_449900 ?auto_449901 ) ) ( not ( = ?auto_449900 ?auto_449902 ) ) ( not ( = ?auto_449900 ?auto_449903 ) ) ( not ( = ?auto_449900 ?auto_449904 ) ) ( not ( = ?auto_449900 ?auto_449905 ) ) ( not ( = ?auto_449900 ?auto_449906 ) ) ( not ( = ?auto_449900 ?auto_449907 ) ) ( not ( = ?auto_449901 ?auto_449902 ) ) ( not ( = ?auto_449901 ?auto_449903 ) ) ( not ( = ?auto_449901 ?auto_449904 ) ) ( not ( = ?auto_449901 ?auto_449905 ) ) ( not ( = ?auto_449901 ?auto_449906 ) ) ( not ( = ?auto_449901 ?auto_449907 ) ) ( not ( = ?auto_449902 ?auto_449903 ) ) ( not ( = ?auto_449902 ?auto_449904 ) ) ( not ( = ?auto_449902 ?auto_449905 ) ) ( not ( = ?auto_449902 ?auto_449906 ) ) ( not ( = ?auto_449902 ?auto_449907 ) ) ( not ( = ?auto_449903 ?auto_449904 ) ) ( not ( = ?auto_449903 ?auto_449905 ) ) ( not ( = ?auto_449903 ?auto_449906 ) ) ( not ( = ?auto_449903 ?auto_449907 ) ) ( not ( = ?auto_449904 ?auto_449905 ) ) ( not ( = ?auto_449904 ?auto_449906 ) ) ( not ( = ?auto_449904 ?auto_449907 ) ) ( not ( = ?auto_449905 ?auto_449906 ) ) ( not ( = ?auto_449905 ?auto_449907 ) ) ( not ( = ?auto_449906 ?auto_449907 ) ) ( ON ?auto_449905 ?auto_449906 ) ( ON ?auto_449904 ?auto_449905 ) ( ON ?auto_449903 ?auto_449904 ) ( ON ?auto_449902 ?auto_449903 ) ( ON ?auto_449901 ?auto_449902 ) ( ON ?auto_449900 ?auto_449901 ) ( CLEAR ?auto_449900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_449900 )
      ( MAKE-7PILE ?auto_449900 ?auto_449901 ?auto_449902 ?auto_449903 ?auto_449904 ?auto_449905 ?auto_449906 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_449916 - BLOCK
      ?auto_449917 - BLOCK
      ?auto_449918 - BLOCK
      ?auto_449919 - BLOCK
      ?auto_449920 - BLOCK
      ?auto_449921 - BLOCK
      ?auto_449922 - BLOCK
      ?auto_449923 - BLOCK
    )
    :vars
    (
      ?auto_449924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449922 ) ( ON ?auto_449923 ?auto_449924 ) ( CLEAR ?auto_449923 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449916 ) ( ON ?auto_449917 ?auto_449916 ) ( ON ?auto_449918 ?auto_449917 ) ( ON ?auto_449919 ?auto_449918 ) ( ON ?auto_449920 ?auto_449919 ) ( ON ?auto_449921 ?auto_449920 ) ( ON ?auto_449922 ?auto_449921 ) ( not ( = ?auto_449916 ?auto_449917 ) ) ( not ( = ?auto_449916 ?auto_449918 ) ) ( not ( = ?auto_449916 ?auto_449919 ) ) ( not ( = ?auto_449916 ?auto_449920 ) ) ( not ( = ?auto_449916 ?auto_449921 ) ) ( not ( = ?auto_449916 ?auto_449922 ) ) ( not ( = ?auto_449916 ?auto_449923 ) ) ( not ( = ?auto_449916 ?auto_449924 ) ) ( not ( = ?auto_449917 ?auto_449918 ) ) ( not ( = ?auto_449917 ?auto_449919 ) ) ( not ( = ?auto_449917 ?auto_449920 ) ) ( not ( = ?auto_449917 ?auto_449921 ) ) ( not ( = ?auto_449917 ?auto_449922 ) ) ( not ( = ?auto_449917 ?auto_449923 ) ) ( not ( = ?auto_449917 ?auto_449924 ) ) ( not ( = ?auto_449918 ?auto_449919 ) ) ( not ( = ?auto_449918 ?auto_449920 ) ) ( not ( = ?auto_449918 ?auto_449921 ) ) ( not ( = ?auto_449918 ?auto_449922 ) ) ( not ( = ?auto_449918 ?auto_449923 ) ) ( not ( = ?auto_449918 ?auto_449924 ) ) ( not ( = ?auto_449919 ?auto_449920 ) ) ( not ( = ?auto_449919 ?auto_449921 ) ) ( not ( = ?auto_449919 ?auto_449922 ) ) ( not ( = ?auto_449919 ?auto_449923 ) ) ( not ( = ?auto_449919 ?auto_449924 ) ) ( not ( = ?auto_449920 ?auto_449921 ) ) ( not ( = ?auto_449920 ?auto_449922 ) ) ( not ( = ?auto_449920 ?auto_449923 ) ) ( not ( = ?auto_449920 ?auto_449924 ) ) ( not ( = ?auto_449921 ?auto_449922 ) ) ( not ( = ?auto_449921 ?auto_449923 ) ) ( not ( = ?auto_449921 ?auto_449924 ) ) ( not ( = ?auto_449922 ?auto_449923 ) ) ( not ( = ?auto_449922 ?auto_449924 ) ) ( not ( = ?auto_449923 ?auto_449924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449923 ?auto_449924 )
      ( !STACK ?auto_449923 ?auto_449922 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_449933 - BLOCK
      ?auto_449934 - BLOCK
      ?auto_449935 - BLOCK
      ?auto_449936 - BLOCK
      ?auto_449937 - BLOCK
      ?auto_449938 - BLOCK
      ?auto_449939 - BLOCK
      ?auto_449940 - BLOCK
    )
    :vars
    (
      ?auto_449941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_449939 ) ( ON ?auto_449940 ?auto_449941 ) ( CLEAR ?auto_449940 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_449933 ) ( ON ?auto_449934 ?auto_449933 ) ( ON ?auto_449935 ?auto_449934 ) ( ON ?auto_449936 ?auto_449935 ) ( ON ?auto_449937 ?auto_449936 ) ( ON ?auto_449938 ?auto_449937 ) ( ON ?auto_449939 ?auto_449938 ) ( not ( = ?auto_449933 ?auto_449934 ) ) ( not ( = ?auto_449933 ?auto_449935 ) ) ( not ( = ?auto_449933 ?auto_449936 ) ) ( not ( = ?auto_449933 ?auto_449937 ) ) ( not ( = ?auto_449933 ?auto_449938 ) ) ( not ( = ?auto_449933 ?auto_449939 ) ) ( not ( = ?auto_449933 ?auto_449940 ) ) ( not ( = ?auto_449933 ?auto_449941 ) ) ( not ( = ?auto_449934 ?auto_449935 ) ) ( not ( = ?auto_449934 ?auto_449936 ) ) ( not ( = ?auto_449934 ?auto_449937 ) ) ( not ( = ?auto_449934 ?auto_449938 ) ) ( not ( = ?auto_449934 ?auto_449939 ) ) ( not ( = ?auto_449934 ?auto_449940 ) ) ( not ( = ?auto_449934 ?auto_449941 ) ) ( not ( = ?auto_449935 ?auto_449936 ) ) ( not ( = ?auto_449935 ?auto_449937 ) ) ( not ( = ?auto_449935 ?auto_449938 ) ) ( not ( = ?auto_449935 ?auto_449939 ) ) ( not ( = ?auto_449935 ?auto_449940 ) ) ( not ( = ?auto_449935 ?auto_449941 ) ) ( not ( = ?auto_449936 ?auto_449937 ) ) ( not ( = ?auto_449936 ?auto_449938 ) ) ( not ( = ?auto_449936 ?auto_449939 ) ) ( not ( = ?auto_449936 ?auto_449940 ) ) ( not ( = ?auto_449936 ?auto_449941 ) ) ( not ( = ?auto_449937 ?auto_449938 ) ) ( not ( = ?auto_449937 ?auto_449939 ) ) ( not ( = ?auto_449937 ?auto_449940 ) ) ( not ( = ?auto_449937 ?auto_449941 ) ) ( not ( = ?auto_449938 ?auto_449939 ) ) ( not ( = ?auto_449938 ?auto_449940 ) ) ( not ( = ?auto_449938 ?auto_449941 ) ) ( not ( = ?auto_449939 ?auto_449940 ) ) ( not ( = ?auto_449939 ?auto_449941 ) ) ( not ( = ?auto_449940 ?auto_449941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_449940 ?auto_449941 )
      ( !STACK ?auto_449940 ?auto_449939 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_449950 - BLOCK
      ?auto_449951 - BLOCK
      ?auto_449952 - BLOCK
      ?auto_449953 - BLOCK
      ?auto_449954 - BLOCK
      ?auto_449955 - BLOCK
      ?auto_449956 - BLOCK
      ?auto_449957 - BLOCK
    )
    :vars
    (
      ?auto_449958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449957 ?auto_449958 ) ( ON-TABLE ?auto_449950 ) ( ON ?auto_449951 ?auto_449950 ) ( ON ?auto_449952 ?auto_449951 ) ( ON ?auto_449953 ?auto_449952 ) ( ON ?auto_449954 ?auto_449953 ) ( ON ?auto_449955 ?auto_449954 ) ( not ( = ?auto_449950 ?auto_449951 ) ) ( not ( = ?auto_449950 ?auto_449952 ) ) ( not ( = ?auto_449950 ?auto_449953 ) ) ( not ( = ?auto_449950 ?auto_449954 ) ) ( not ( = ?auto_449950 ?auto_449955 ) ) ( not ( = ?auto_449950 ?auto_449956 ) ) ( not ( = ?auto_449950 ?auto_449957 ) ) ( not ( = ?auto_449950 ?auto_449958 ) ) ( not ( = ?auto_449951 ?auto_449952 ) ) ( not ( = ?auto_449951 ?auto_449953 ) ) ( not ( = ?auto_449951 ?auto_449954 ) ) ( not ( = ?auto_449951 ?auto_449955 ) ) ( not ( = ?auto_449951 ?auto_449956 ) ) ( not ( = ?auto_449951 ?auto_449957 ) ) ( not ( = ?auto_449951 ?auto_449958 ) ) ( not ( = ?auto_449952 ?auto_449953 ) ) ( not ( = ?auto_449952 ?auto_449954 ) ) ( not ( = ?auto_449952 ?auto_449955 ) ) ( not ( = ?auto_449952 ?auto_449956 ) ) ( not ( = ?auto_449952 ?auto_449957 ) ) ( not ( = ?auto_449952 ?auto_449958 ) ) ( not ( = ?auto_449953 ?auto_449954 ) ) ( not ( = ?auto_449953 ?auto_449955 ) ) ( not ( = ?auto_449953 ?auto_449956 ) ) ( not ( = ?auto_449953 ?auto_449957 ) ) ( not ( = ?auto_449953 ?auto_449958 ) ) ( not ( = ?auto_449954 ?auto_449955 ) ) ( not ( = ?auto_449954 ?auto_449956 ) ) ( not ( = ?auto_449954 ?auto_449957 ) ) ( not ( = ?auto_449954 ?auto_449958 ) ) ( not ( = ?auto_449955 ?auto_449956 ) ) ( not ( = ?auto_449955 ?auto_449957 ) ) ( not ( = ?auto_449955 ?auto_449958 ) ) ( not ( = ?auto_449956 ?auto_449957 ) ) ( not ( = ?auto_449956 ?auto_449958 ) ) ( not ( = ?auto_449957 ?auto_449958 ) ) ( CLEAR ?auto_449955 ) ( ON ?auto_449956 ?auto_449957 ) ( CLEAR ?auto_449956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_449950 ?auto_449951 ?auto_449952 ?auto_449953 ?auto_449954 ?auto_449955 ?auto_449956 )
      ( MAKE-8PILE ?auto_449950 ?auto_449951 ?auto_449952 ?auto_449953 ?auto_449954 ?auto_449955 ?auto_449956 ?auto_449957 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_449967 - BLOCK
      ?auto_449968 - BLOCK
      ?auto_449969 - BLOCK
      ?auto_449970 - BLOCK
      ?auto_449971 - BLOCK
      ?auto_449972 - BLOCK
      ?auto_449973 - BLOCK
      ?auto_449974 - BLOCK
    )
    :vars
    (
      ?auto_449975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449974 ?auto_449975 ) ( ON-TABLE ?auto_449967 ) ( ON ?auto_449968 ?auto_449967 ) ( ON ?auto_449969 ?auto_449968 ) ( ON ?auto_449970 ?auto_449969 ) ( ON ?auto_449971 ?auto_449970 ) ( ON ?auto_449972 ?auto_449971 ) ( not ( = ?auto_449967 ?auto_449968 ) ) ( not ( = ?auto_449967 ?auto_449969 ) ) ( not ( = ?auto_449967 ?auto_449970 ) ) ( not ( = ?auto_449967 ?auto_449971 ) ) ( not ( = ?auto_449967 ?auto_449972 ) ) ( not ( = ?auto_449967 ?auto_449973 ) ) ( not ( = ?auto_449967 ?auto_449974 ) ) ( not ( = ?auto_449967 ?auto_449975 ) ) ( not ( = ?auto_449968 ?auto_449969 ) ) ( not ( = ?auto_449968 ?auto_449970 ) ) ( not ( = ?auto_449968 ?auto_449971 ) ) ( not ( = ?auto_449968 ?auto_449972 ) ) ( not ( = ?auto_449968 ?auto_449973 ) ) ( not ( = ?auto_449968 ?auto_449974 ) ) ( not ( = ?auto_449968 ?auto_449975 ) ) ( not ( = ?auto_449969 ?auto_449970 ) ) ( not ( = ?auto_449969 ?auto_449971 ) ) ( not ( = ?auto_449969 ?auto_449972 ) ) ( not ( = ?auto_449969 ?auto_449973 ) ) ( not ( = ?auto_449969 ?auto_449974 ) ) ( not ( = ?auto_449969 ?auto_449975 ) ) ( not ( = ?auto_449970 ?auto_449971 ) ) ( not ( = ?auto_449970 ?auto_449972 ) ) ( not ( = ?auto_449970 ?auto_449973 ) ) ( not ( = ?auto_449970 ?auto_449974 ) ) ( not ( = ?auto_449970 ?auto_449975 ) ) ( not ( = ?auto_449971 ?auto_449972 ) ) ( not ( = ?auto_449971 ?auto_449973 ) ) ( not ( = ?auto_449971 ?auto_449974 ) ) ( not ( = ?auto_449971 ?auto_449975 ) ) ( not ( = ?auto_449972 ?auto_449973 ) ) ( not ( = ?auto_449972 ?auto_449974 ) ) ( not ( = ?auto_449972 ?auto_449975 ) ) ( not ( = ?auto_449973 ?auto_449974 ) ) ( not ( = ?auto_449973 ?auto_449975 ) ) ( not ( = ?auto_449974 ?auto_449975 ) ) ( CLEAR ?auto_449972 ) ( ON ?auto_449973 ?auto_449974 ) ( CLEAR ?auto_449973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_449967 ?auto_449968 ?auto_449969 ?auto_449970 ?auto_449971 ?auto_449972 ?auto_449973 )
      ( MAKE-8PILE ?auto_449967 ?auto_449968 ?auto_449969 ?auto_449970 ?auto_449971 ?auto_449972 ?auto_449973 ?auto_449974 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_449984 - BLOCK
      ?auto_449985 - BLOCK
      ?auto_449986 - BLOCK
      ?auto_449987 - BLOCK
      ?auto_449988 - BLOCK
      ?auto_449989 - BLOCK
      ?auto_449990 - BLOCK
      ?auto_449991 - BLOCK
    )
    :vars
    (
      ?auto_449992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_449991 ?auto_449992 ) ( ON-TABLE ?auto_449984 ) ( ON ?auto_449985 ?auto_449984 ) ( ON ?auto_449986 ?auto_449985 ) ( ON ?auto_449987 ?auto_449986 ) ( ON ?auto_449988 ?auto_449987 ) ( not ( = ?auto_449984 ?auto_449985 ) ) ( not ( = ?auto_449984 ?auto_449986 ) ) ( not ( = ?auto_449984 ?auto_449987 ) ) ( not ( = ?auto_449984 ?auto_449988 ) ) ( not ( = ?auto_449984 ?auto_449989 ) ) ( not ( = ?auto_449984 ?auto_449990 ) ) ( not ( = ?auto_449984 ?auto_449991 ) ) ( not ( = ?auto_449984 ?auto_449992 ) ) ( not ( = ?auto_449985 ?auto_449986 ) ) ( not ( = ?auto_449985 ?auto_449987 ) ) ( not ( = ?auto_449985 ?auto_449988 ) ) ( not ( = ?auto_449985 ?auto_449989 ) ) ( not ( = ?auto_449985 ?auto_449990 ) ) ( not ( = ?auto_449985 ?auto_449991 ) ) ( not ( = ?auto_449985 ?auto_449992 ) ) ( not ( = ?auto_449986 ?auto_449987 ) ) ( not ( = ?auto_449986 ?auto_449988 ) ) ( not ( = ?auto_449986 ?auto_449989 ) ) ( not ( = ?auto_449986 ?auto_449990 ) ) ( not ( = ?auto_449986 ?auto_449991 ) ) ( not ( = ?auto_449986 ?auto_449992 ) ) ( not ( = ?auto_449987 ?auto_449988 ) ) ( not ( = ?auto_449987 ?auto_449989 ) ) ( not ( = ?auto_449987 ?auto_449990 ) ) ( not ( = ?auto_449987 ?auto_449991 ) ) ( not ( = ?auto_449987 ?auto_449992 ) ) ( not ( = ?auto_449988 ?auto_449989 ) ) ( not ( = ?auto_449988 ?auto_449990 ) ) ( not ( = ?auto_449988 ?auto_449991 ) ) ( not ( = ?auto_449988 ?auto_449992 ) ) ( not ( = ?auto_449989 ?auto_449990 ) ) ( not ( = ?auto_449989 ?auto_449991 ) ) ( not ( = ?auto_449989 ?auto_449992 ) ) ( not ( = ?auto_449990 ?auto_449991 ) ) ( not ( = ?auto_449990 ?auto_449992 ) ) ( not ( = ?auto_449991 ?auto_449992 ) ) ( ON ?auto_449990 ?auto_449991 ) ( CLEAR ?auto_449988 ) ( ON ?auto_449989 ?auto_449990 ) ( CLEAR ?auto_449989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_449984 ?auto_449985 ?auto_449986 ?auto_449987 ?auto_449988 ?auto_449989 )
      ( MAKE-8PILE ?auto_449984 ?auto_449985 ?auto_449986 ?auto_449987 ?auto_449988 ?auto_449989 ?auto_449990 ?auto_449991 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450001 - BLOCK
      ?auto_450002 - BLOCK
      ?auto_450003 - BLOCK
      ?auto_450004 - BLOCK
      ?auto_450005 - BLOCK
      ?auto_450006 - BLOCK
      ?auto_450007 - BLOCK
      ?auto_450008 - BLOCK
    )
    :vars
    (
      ?auto_450009 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450008 ?auto_450009 ) ( ON-TABLE ?auto_450001 ) ( ON ?auto_450002 ?auto_450001 ) ( ON ?auto_450003 ?auto_450002 ) ( ON ?auto_450004 ?auto_450003 ) ( ON ?auto_450005 ?auto_450004 ) ( not ( = ?auto_450001 ?auto_450002 ) ) ( not ( = ?auto_450001 ?auto_450003 ) ) ( not ( = ?auto_450001 ?auto_450004 ) ) ( not ( = ?auto_450001 ?auto_450005 ) ) ( not ( = ?auto_450001 ?auto_450006 ) ) ( not ( = ?auto_450001 ?auto_450007 ) ) ( not ( = ?auto_450001 ?auto_450008 ) ) ( not ( = ?auto_450001 ?auto_450009 ) ) ( not ( = ?auto_450002 ?auto_450003 ) ) ( not ( = ?auto_450002 ?auto_450004 ) ) ( not ( = ?auto_450002 ?auto_450005 ) ) ( not ( = ?auto_450002 ?auto_450006 ) ) ( not ( = ?auto_450002 ?auto_450007 ) ) ( not ( = ?auto_450002 ?auto_450008 ) ) ( not ( = ?auto_450002 ?auto_450009 ) ) ( not ( = ?auto_450003 ?auto_450004 ) ) ( not ( = ?auto_450003 ?auto_450005 ) ) ( not ( = ?auto_450003 ?auto_450006 ) ) ( not ( = ?auto_450003 ?auto_450007 ) ) ( not ( = ?auto_450003 ?auto_450008 ) ) ( not ( = ?auto_450003 ?auto_450009 ) ) ( not ( = ?auto_450004 ?auto_450005 ) ) ( not ( = ?auto_450004 ?auto_450006 ) ) ( not ( = ?auto_450004 ?auto_450007 ) ) ( not ( = ?auto_450004 ?auto_450008 ) ) ( not ( = ?auto_450004 ?auto_450009 ) ) ( not ( = ?auto_450005 ?auto_450006 ) ) ( not ( = ?auto_450005 ?auto_450007 ) ) ( not ( = ?auto_450005 ?auto_450008 ) ) ( not ( = ?auto_450005 ?auto_450009 ) ) ( not ( = ?auto_450006 ?auto_450007 ) ) ( not ( = ?auto_450006 ?auto_450008 ) ) ( not ( = ?auto_450006 ?auto_450009 ) ) ( not ( = ?auto_450007 ?auto_450008 ) ) ( not ( = ?auto_450007 ?auto_450009 ) ) ( not ( = ?auto_450008 ?auto_450009 ) ) ( ON ?auto_450007 ?auto_450008 ) ( CLEAR ?auto_450005 ) ( ON ?auto_450006 ?auto_450007 ) ( CLEAR ?auto_450006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_450001 ?auto_450002 ?auto_450003 ?auto_450004 ?auto_450005 ?auto_450006 )
      ( MAKE-8PILE ?auto_450001 ?auto_450002 ?auto_450003 ?auto_450004 ?auto_450005 ?auto_450006 ?auto_450007 ?auto_450008 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450018 - BLOCK
      ?auto_450019 - BLOCK
      ?auto_450020 - BLOCK
      ?auto_450021 - BLOCK
      ?auto_450022 - BLOCK
      ?auto_450023 - BLOCK
      ?auto_450024 - BLOCK
      ?auto_450025 - BLOCK
    )
    :vars
    (
      ?auto_450026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450025 ?auto_450026 ) ( ON-TABLE ?auto_450018 ) ( ON ?auto_450019 ?auto_450018 ) ( ON ?auto_450020 ?auto_450019 ) ( ON ?auto_450021 ?auto_450020 ) ( not ( = ?auto_450018 ?auto_450019 ) ) ( not ( = ?auto_450018 ?auto_450020 ) ) ( not ( = ?auto_450018 ?auto_450021 ) ) ( not ( = ?auto_450018 ?auto_450022 ) ) ( not ( = ?auto_450018 ?auto_450023 ) ) ( not ( = ?auto_450018 ?auto_450024 ) ) ( not ( = ?auto_450018 ?auto_450025 ) ) ( not ( = ?auto_450018 ?auto_450026 ) ) ( not ( = ?auto_450019 ?auto_450020 ) ) ( not ( = ?auto_450019 ?auto_450021 ) ) ( not ( = ?auto_450019 ?auto_450022 ) ) ( not ( = ?auto_450019 ?auto_450023 ) ) ( not ( = ?auto_450019 ?auto_450024 ) ) ( not ( = ?auto_450019 ?auto_450025 ) ) ( not ( = ?auto_450019 ?auto_450026 ) ) ( not ( = ?auto_450020 ?auto_450021 ) ) ( not ( = ?auto_450020 ?auto_450022 ) ) ( not ( = ?auto_450020 ?auto_450023 ) ) ( not ( = ?auto_450020 ?auto_450024 ) ) ( not ( = ?auto_450020 ?auto_450025 ) ) ( not ( = ?auto_450020 ?auto_450026 ) ) ( not ( = ?auto_450021 ?auto_450022 ) ) ( not ( = ?auto_450021 ?auto_450023 ) ) ( not ( = ?auto_450021 ?auto_450024 ) ) ( not ( = ?auto_450021 ?auto_450025 ) ) ( not ( = ?auto_450021 ?auto_450026 ) ) ( not ( = ?auto_450022 ?auto_450023 ) ) ( not ( = ?auto_450022 ?auto_450024 ) ) ( not ( = ?auto_450022 ?auto_450025 ) ) ( not ( = ?auto_450022 ?auto_450026 ) ) ( not ( = ?auto_450023 ?auto_450024 ) ) ( not ( = ?auto_450023 ?auto_450025 ) ) ( not ( = ?auto_450023 ?auto_450026 ) ) ( not ( = ?auto_450024 ?auto_450025 ) ) ( not ( = ?auto_450024 ?auto_450026 ) ) ( not ( = ?auto_450025 ?auto_450026 ) ) ( ON ?auto_450024 ?auto_450025 ) ( ON ?auto_450023 ?auto_450024 ) ( CLEAR ?auto_450021 ) ( ON ?auto_450022 ?auto_450023 ) ( CLEAR ?auto_450022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450018 ?auto_450019 ?auto_450020 ?auto_450021 ?auto_450022 )
      ( MAKE-8PILE ?auto_450018 ?auto_450019 ?auto_450020 ?auto_450021 ?auto_450022 ?auto_450023 ?auto_450024 ?auto_450025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450035 - BLOCK
      ?auto_450036 - BLOCK
      ?auto_450037 - BLOCK
      ?auto_450038 - BLOCK
      ?auto_450039 - BLOCK
      ?auto_450040 - BLOCK
      ?auto_450041 - BLOCK
      ?auto_450042 - BLOCK
    )
    :vars
    (
      ?auto_450043 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450042 ?auto_450043 ) ( ON-TABLE ?auto_450035 ) ( ON ?auto_450036 ?auto_450035 ) ( ON ?auto_450037 ?auto_450036 ) ( ON ?auto_450038 ?auto_450037 ) ( not ( = ?auto_450035 ?auto_450036 ) ) ( not ( = ?auto_450035 ?auto_450037 ) ) ( not ( = ?auto_450035 ?auto_450038 ) ) ( not ( = ?auto_450035 ?auto_450039 ) ) ( not ( = ?auto_450035 ?auto_450040 ) ) ( not ( = ?auto_450035 ?auto_450041 ) ) ( not ( = ?auto_450035 ?auto_450042 ) ) ( not ( = ?auto_450035 ?auto_450043 ) ) ( not ( = ?auto_450036 ?auto_450037 ) ) ( not ( = ?auto_450036 ?auto_450038 ) ) ( not ( = ?auto_450036 ?auto_450039 ) ) ( not ( = ?auto_450036 ?auto_450040 ) ) ( not ( = ?auto_450036 ?auto_450041 ) ) ( not ( = ?auto_450036 ?auto_450042 ) ) ( not ( = ?auto_450036 ?auto_450043 ) ) ( not ( = ?auto_450037 ?auto_450038 ) ) ( not ( = ?auto_450037 ?auto_450039 ) ) ( not ( = ?auto_450037 ?auto_450040 ) ) ( not ( = ?auto_450037 ?auto_450041 ) ) ( not ( = ?auto_450037 ?auto_450042 ) ) ( not ( = ?auto_450037 ?auto_450043 ) ) ( not ( = ?auto_450038 ?auto_450039 ) ) ( not ( = ?auto_450038 ?auto_450040 ) ) ( not ( = ?auto_450038 ?auto_450041 ) ) ( not ( = ?auto_450038 ?auto_450042 ) ) ( not ( = ?auto_450038 ?auto_450043 ) ) ( not ( = ?auto_450039 ?auto_450040 ) ) ( not ( = ?auto_450039 ?auto_450041 ) ) ( not ( = ?auto_450039 ?auto_450042 ) ) ( not ( = ?auto_450039 ?auto_450043 ) ) ( not ( = ?auto_450040 ?auto_450041 ) ) ( not ( = ?auto_450040 ?auto_450042 ) ) ( not ( = ?auto_450040 ?auto_450043 ) ) ( not ( = ?auto_450041 ?auto_450042 ) ) ( not ( = ?auto_450041 ?auto_450043 ) ) ( not ( = ?auto_450042 ?auto_450043 ) ) ( ON ?auto_450041 ?auto_450042 ) ( ON ?auto_450040 ?auto_450041 ) ( CLEAR ?auto_450038 ) ( ON ?auto_450039 ?auto_450040 ) ( CLEAR ?auto_450039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450035 ?auto_450036 ?auto_450037 ?auto_450038 ?auto_450039 )
      ( MAKE-8PILE ?auto_450035 ?auto_450036 ?auto_450037 ?auto_450038 ?auto_450039 ?auto_450040 ?auto_450041 ?auto_450042 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450052 - BLOCK
      ?auto_450053 - BLOCK
      ?auto_450054 - BLOCK
      ?auto_450055 - BLOCK
      ?auto_450056 - BLOCK
      ?auto_450057 - BLOCK
      ?auto_450058 - BLOCK
      ?auto_450059 - BLOCK
    )
    :vars
    (
      ?auto_450060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450059 ?auto_450060 ) ( ON-TABLE ?auto_450052 ) ( ON ?auto_450053 ?auto_450052 ) ( ON ?auto_450054 ?auto_450053 ) ( not ( = ?auto_450052 ?auto_450053 ) ) ( not ( = ?auto_450052 ?auto_450054 ) ) ( not ( = ?auto_450052 ?auto_450055 ) ) ( not ( = ?auto_450052 ?auto_450056 ) ) ( not ( = ?auto_450052 ?auto_450057 ) ) ( not ( = ?auto_450052 ?auto_450058 ) ) ( not ( = ?auto_450052 ?auto_450059 ) ) ( not ( = ?auto_450052 ?auto_450060 ) ) ( not ( = ?auto_450053 ?auto_450054 ) ) ( not ( = ?auto_450053 ?auto_450055 ) ) ( not ( = ?auto_450053 ?auto_450056 ) ) ( not ( = ?auto_450053 ?auto_450057 ) ) ( not ( = ?auto_450053 ?auto_450058 ) ) ( not ( = ?auto_450053 ?auto_450059 ) ) ( not ( = ?auto_450053 ?auto_450060 ) ) ( not ( = ?auto_450054 ?auto_450055 ) ) ( not ( = ?auto_450054 ?auto_450056 ) ) ( not ( = ?auto_450054 ?auto_450057 ) ) ( not ( = ?auto_450054 ?auto_450058 ) ) ( not ( = ?auto_450054 ?auto_450059 ) ) ( not ( = ?auto_450054 ?auto_450060 ) ) ( not ( = ?auto_450055 ?auto_450056 ) ) ( not ( = ?auto_450055 ?auto_450057 ) ) ( not ( = ?auto_450055 ?auto_450058 ) ) ( not ( = ?auto_450055 ?auto_450059 ) ) ( not ( = ?auto_450055 ?auto_450060 ) ) ( not ( = ?auto_450056 ?auto_450057 ) ) ( not ( = ?auto_450056 ?auto_450058 ) ) ( not ( = ?auto_450056 ?auto_450059 ) ) ( not ( = ?auto_450056 ?auto_450060 ) ) ( not ( = ?auto_450057 ?auto_450058 ) ) ( not ( = ?auto_450057 ?auto_450059 ) ) ( not ( = ?auto_450057 ?auto_450060 ) ) ( not ( = ?auto_450058 ?auto_450059 ) ) ( not ( = ?auto_450058 ?auto_450060 ) ) ( not ( = ?auto_450059 ?auto_450060 ) ) ( ON ?auto_450058 ?auto_450059 ) ( ON ?auto_450057 ?auto_450058 ) ( ON ?auto_450056 ?auto_450057 ) ( CLEAR ?auto_450054 ) ( ON ?auto_450055 ?auto_450056 ) ( CLEAR ?auto_450055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450052 ?auto_450053 ?auto_450054 ?auto_450055 )
      ( MAKE-8PILE ?auto_450052 ?auto_450053 ?auto_450054 ?auto_450055 ?auto_450056 ?auto_450057 ?auto_450058 ?auto_450059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450069 - BLOCK
      ?auto_450070 - BLOCK
      ?auto_450071 - BLOCK
      ?auto_450072 - BLOCK
      ?auto_450073 - BLOCK
      ?auto_450074 - BLOCK
      ?auto_450075 - BLOCK
      ?auto_450076 - BLOCK
    )
    :vars
    (
      ?auto_450077 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450076 ?auto_450077 ) ( ON-TABLE ?auto_450069 ) ( ON ?auto_450070 ?auto_450069 ) ( ON ?auto_450071 ?auto_450070 ) ( not ( = ?auto_450069 ?auto_450070 ) ) ( not ( = ?auto_450069 ?auto_450071 ) ) ( not ( = ?auto_450069 ?auto_450072 ) ) ( not ( = ?auto_450069 ?auto_450073 ) ) ( not ( = ?auto_450069 ?auto_450074 ) ) ( not ( = ?auto_450069 ?auto_450075 ) ) ( not ( = ?auto_450069 ?auto_450076 ) ) ( not ( = ?auto_450069 ?auto_450077 ) ) ( not ( = ?auto_450070 ?auto_450071 ) ) ( not ( = ?auto_450070 ?auto_450072 ) ) ( not ( = ?auto_450070 ?auto_450073 ) ) ( not ( = ?auto_450070 ?auto_450074 ) ) ( not ( = ?auto_450070 ?auto_450075 ) ) ( not ( = ?auto_450070 ?auto_450076 ) ) ( not ( = ?auto_450070 ?auto_450077 ) ) ( not ( = ?auto_450071 ?auto_450072 ) ) ( not ( = ?auto_450071 ?auto_450073 ) ) ( not ( = ?auto_450071 ?auto_450074 ) ) ( not ( = ?auto_450071 ?auto_450075 ) ) ( not ( = ?auto_450071 ?auto_450076 ) ) ( not ( = ?auto_450071 ?auto_450077 ) ) ( not ( = ?auto_450072 ?auto_450073 ) ) ( not ( = ?auto_450072 ?auto_450074 ) ) ( not ( = ?auto_450072 ?auto_450075 ) ) ( not ( = ?auto_450072 ?auto_450076 ) ) ( not ( = ?auto_450072 ?auto_450077 ) ) ( not ( = ?auto_450073 ?auto_450074 ) ) ( not ( = ?auto_450073 ?auto_450075 ) ) ( not ( = ?auto_450073 ?auto_450076 ) ) ( not ( = ?auto_450073 ?auto_450077 ) ) ( not ( = ?auto_450074 ?auto_450075 ) ) ( not ( = ?auto_450074 ?auto_450076 ) ) ( not ( = ?auto_450074 ?auto_450077 ) ) ( not ( = ?auto_450075 ?auto_450076 ) ) ( not ( = ?auto_450075 ?auto_450077 ) ) ( not ( = ?auto_450076 ?auto_450077 ) ) ( ON ?auto_450075 ?auto_450076 ) ( ON ?auto_450074 ?auto_450075 ) ( ON ?auto_450073 ?auto_450074 ) ( CLEAR ?auto_450071 ) ( ON ?auto_450072 ?auto_450073 ) ( CLEAR ?auto_450072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450069 ?auto_450070 ?auto_450071 ?auto_450072 )
      ( MAKE-8PILE ?auto_450069 ?auto_450070 ?auto_450071 ?auto_450072 ?auto_450073 ?auto_450074 ?auto_450075 ?auto_450076 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450086 - BLOCK
      ?auto_450087 - BLOCK
      ?auto_450088 - BLOCK
      ?auto_450089 - BLOCK
      ?auto_450090 - BLOCK
      ?auto_450091 - BLOCK
      ?auto_450092 - BLOCK
      ?auto_450093 - BLOCK
    )
    :vars
    (
      ?auto_450094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450093 ?auto_450094 ) ( ON-TABLE ?auto_450086 ) ( ON ?auto_450087 ?auto_450086 ) ( not ( = ?auto_450086 ?auto_450087 ) ) ( not ( = ?auto_450086 ?auto_450088 ) ) ( not ( = ?auto_450086 ?auto_450089 ) ) ( not ( = ?auto_450086 ?auto_450090 ) ) ( not ( = ?auto_450086 ?auto_450091 ) ) ( not ( = ?auto_450086 ?auto_450092 ) ) ( not ( = ?auto_450086 ?auto_450093 ) ) ( not ( = ?auto_450086 ?auto_450094 ) ) ( not ( = ?auto_450087 ?auto_450088 ) ) ( not ( = ?auto_450087 ?auto_450089 ) ) ( not ( = ?auto_450087 ?auto_450090 ) ) ( not ( = ?auto_450087 ?auto_450091 ) ) ( not ( = ?auto_450087 ?auto_450092 ) ) ( not ( = ?auto_450087 ?auto_450093 ) ) ( not ( = ?auto_450087 ?auto_450094 ) ) ( not ( = ?auto_450088 ?auto_450089 ) ) ( not ( = ?auto_450088 ?auto_450090 ) ) ( not ( = ?auto_450088 ?auto_450091 ) ) ( not ( = ?auto_450088 ?auto_450092 ) ) ( not ( = ?auto_450088 ?auto_450093 ) ) ( not ( = ?auto_450088 ?auto_450094 ) ) ( not ( = ?auto_450089 ?auto_450090 ) ) ( not ( = ?auto_450089 ?auto_450091 ) ) ( not ( = ?auto_450089 ?auto_450092 ) ) ( not ( = ?auto_450089 ?auto_450093 ) ) ( not ( = ?auto_450089 ?auto_450094 ) ) ( not ( = ?auto_450090 ?auto_450091 ) ) ( not ( = ?auto_450090 ?auto_450092 ) ) ( not ( = ?auto_450090 ?auto_450093 ) ) ( not ( = ?auto_450090 ?auto_450094 ) ) ( not ( = ?auto_450091 ?auto_450092 ) ) ( not ( = ?auto_450091 ?auto_450093 ) ) ( not ( = ?auto_450091 ?auto_450094 ) ) ( not ( = ?auto_450092 ?auto_450093 ) ) ( not ( = ?auto_450092 ?auto_450094 ) ) ( not ( = ?auto_450093 ?auto_450094 ) ) ( ON ?auto_450092 ?auto_450093 ) ( ON ?auto_450091 ?auto_450092 ) ( ON ?auto_450090 ?auto_450091 ) ( ON ?auto_450089 ?auto_450090 ) ( CLEAR ?auto_450087 ) ( ON ?auto_450088 ?auto_450089 ) ( CLEAR ?auto_450088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450086 ?auto_450087 ?auto_450088 )
      ( MAKE-8PILE ?auto_450086 ?auto_450087 ?auto_450088 ?auto_450089 ?auto_450090 ?auto_450091 ?auto_450092 ?auto_450093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450103 - BLOCK
      ?auto_450104 - BLOCK
      ?auto_450105 - BLOCK
      ?auto_450106 - BLOCK
      ?auto_450107 - BLOCK
      ?auto_450108 - BLOCK
      ?auto_450109 - BLOCK
      ?auto_450110 - BLOCK
    )
    :vars
    (
      ?auto_450111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450110 ?auto_450111 ) ( ON-TABLE ?auto_450103 ) ( ON ?auto_450104 ?auto_450103 ) ( not ( = ?auto_450103 ?auto_450104 ) ) ( not ( = ?auto_450103 ?auto_450105 ) ) ( not ( = ?auto_450103 ?auto_450106 ) ) ( not ( = ?auto_450103 ?auto_450107 ) ) ( not ( = ?auto_450103 ?auto_450108 ) ) ( not ( = ?auto_450103 ?auto_450109 ) ) ( not ( = ?auto_450103 ?auto_450110 ) ) ( not ( = ?auto_450103 ?auto_450111 ) ) ( not ( = ?auto_450104 ?auto_450105 ) ) ( not ( = ?auto_450104 ?auto_450106 ) ) ( not ( = ?auto_450104 ?auto_450107 ) ) ( not ( = ?auto_450104 ?auto_450108 ) ) ( not ( = ?auto_450104 ?auto_450109 ) ) ( not ( = ?auto_450104 ?auto_450110 ) ) ( not ( = ?auto_450104 ?auto_450111 ) ) ( not ( = ?auto_450105 ?auto_450106 ) ) ( not ( = ?auto_450105 ?auto_450107 ) ) ( not ( = ?auto_450105 ?auto_450108 ) ) ( not ( = ?auto_450105 ?auto_450109 ) ) ( not ( = ?auto_450105 ?auto_450110 ) ) ( not ( = ?auto_450105 ?auto_450111 ) ) ( not ( = ?auto_450106 ?auto_450107 ) ) ( not ( = ?auto_450106 ?auto_450108 ) ) ( not ( = ?auto_450106 ?auto_450109 ) ) ( not ( = ?auto_450106 ?auto_450110 ) ) ( not ( = ?auto_450106 ?auto_450111 ) ) ( not ( = ?auto_450107 ?auto_450108 ) ) ( not ( = ?auto_450107 ?auto_450109 ) ) ( not ( = ?auto_450107 ?auto_450110 ) ) ( not ( = ?auto_450107 ?auto_450111 ) ) ( not ( = ?auto_450108 ?auto_450109 ) ) ( not ( = ?auto_450108 ?auto_450110 ) ) ( not ( = ?auto_450108 ?auto_450111 ) ) ( not ( = ?auto_450109 ?auto_450110 ) ) ( not ( = ?auto_450109 ?auto_450111 ) ) ( not ( = ?auto_450110 ?auto_450111 ) ) ( ON ?auto_450109 ?auto_450110 ) ( ON ?auto_450108 ?auto_450109 ) ( ON ?auto_450107 ?auto_450108 ) ( ON ?auto_450106 ?auto_450107 ) ( CLEAR ?auto_450104 ) ( ON ?auto_450105 ?auto_450106 ) ( CLEAR ?auto_450105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450103 ?auto_450104 ?auto_450105 )
      ( MAKE-8PILE ?auto_450103 ?auto_450104 ?auto_450105 ?auto_450106 ?auto_450107 ?auto_450108 ?auto_450109 ?auto_450110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450120 - BLOCK
      ?auto_450121 - BLOCK
      ?auto_450122 - BLOCK
      ?auto_450123 - BLOCK
      ?auto_450124 - BLOCK
      ?auto_450125 - BLOCK
      ?auto_450126 - BLOCK
      ?auto_450127 - BLOCK
    )
    :vars
    (
      ?auto_450128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450127 ?auto_450128 ) ( ON-TABLE ?auto_450120 ) ( not ( = ?auto_450120 ?auto_450121 ) ) ( not ( = ?auto_450120 ?auto_450122 ) ) ( not ( = ?auto_450120 ?auto_450123 ) ) ( not ( = ?auto_450120 ?auto_450124 ) ) ( not ( = ?auto_450120 ?auto_450125 ) ) ( not ( = ?auto_450120 ?auto_450126 ) ) ( not ( = ?auto_450120 ?auto_450127 ) ) ( not ( = ?auto_450120 ?auto_450128 ) ) ( not ( = ?auto_450121 ?auto_450122 ) ) ( not ( = ?auto_450121 ?auto_450123 ) ) ( not ( = ?auto_450121 ?auto_450124 ) ) ( not ( = ?auto_450121 ?auto_450125 ) ) ( not ( = ?auto_450121 ?auto_450126 ) ) ( not ( = ?auto_450121 ?auto_450127 ) ) ( not ( = ?auto_450121 ?auto_450128 ) ) ( not ( = ?auto_450122 ?auto_450123 ) ) ( not ( = ?auto_450122 ?auto_450124 ) ) ( not ( = ?auto_450122 ?auto_450125 ) ) ( not ( = ?auto_450122 ?auto_450126 ) ) ( not ( = ?auto_450122 ?auto_450127 ) ) ( not ( = ?auto_450122 ?auto_450128 ) ) ( not ( = ?auto_450123 ?auto_450124 ) ) ( not ( = ?auto_450123 ?auto_450125 ) ) ( not ( = ?auto_450123 ?auto_450126 ) ) ( not ( = ?auto_450123 ?auto_450127 ) ) ( not ( = ?auto_450123 ?auto_450128 ) ) ( not ( = ?auto_450124 ?auto_450125 ) ) ( not ( = ?auto_450124 ?auto_450126 ) ) ( not ( = ?auto_450124 ?auto_450127 ) ) ( not ( = ?auto_450124 ?auto_450128 ) ) ( not ( = ?auto_450125 ?auto_450126 ) ) ( not ( = ?auto_450125 ?auto_450127 ) ) ( not ( = ?auto_450125 ?auto_450128 ) ) ( not ( = ?auto_450126 ?auto_450127 ) ) ( not ( = ?auto_450126 ?auto_450128 ) ) ( not ( = ?auto_450127 ?auto_450128 ) ) ( ON ?auto_450126 ?auto_450127 ) ( ON ?auto_450125 ?auto_450126 ) ( ON ?auto_450124 ?auto_450125 ) ( ON ?auto_450123 ?auto_450124 ) ( ON ?auto_450122 ?auto_450123 ) ( CLEAR ?auto_450120 ) ( ON ?auto_450121 ?auto_450122 ) ( CLEAR ?auto_450121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450120 ?auto_450121 )
      ( MAKE-8PILE ?auto_450120 ?auto_450121 ?auto_450122 ?auto_450123 ?auto_450124 ?auto_450125 ?auto_450126 ?auto_450127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450137 - BLOCK
      ?auto_450138 - BLOCK
      ?auto_450139 - BLOCK
      ?auto_450140 - BLOCK
      ?auto_450141 - BLOCK
      ?auto_450142 - BLOCK
      ?auto_450143 - BLOCK
      ?auto_450144 - BLOCK
    )
    :vars
    (
      ?auto_450145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450144 ?auto_450145 ) ( ON-TABLE ?auto_450137 ) ( not ( = ?auto_450137 ?auto_450138 ) ) ( not ( = ?auto_450137 ?auto_450139 ) ) ( not ( = ?auto_450137 ?auto_450140 ) ) ( not ( = ?auto_450137 ?auto_450141 ) ) ( not ( = ?auto_450137 ?auto_450142 ) ) ( not ( = ?auto_450137 ?auto_450143 ) ) ( not ( = ?auto_450137 ?auto_450144 ) ) ( not ( = ?auto_450137 ?auto_450145 ) ) ( not ( = ?auto_450138 ?auto_450139 ) ) ( not ( = ?auto_450138 ?auto_450140 ) ) ( not ( = ?auto_450138 ?auto_450141 ) ) ( not ( = ?auto_450138 ?auto_450142 ) ) ( not ( = ?auto_450138 ?auto_450143 ) ) ( not ( = ?auto_450138 ?auto_450144 ) ) ( not ( = ?auto_450138 ?auto_450145 ) ) ( not ( = ?auto_450139 ?auto_450140 ) ) ( not ( = ?auto_450139 ?auto_450141 ) ) ( not ( = ?auto_450139 ?auto_450142 ) ) ( not ( = ?auto_450139 ?auto_450143 ) ) ( not ( = ?auto_450139 ?auto_450144 ) ) ( not ( = ?auto_450139 ?auto_450145 ) ) ( not ( = ?auto_450140 ?auto_450141 ) ) ( not ( = ?auto_450140 ?auto_450142 ) ) ( not ( = ?auto_450140 ?auto_450143 ) ) ( not ( = ?auto_450140 ?auto_450144 ) ) ( not ( = ?auto_450140 ?auto_450145 ) ) ( not ( = ?auto_450141 ?auto_450142 ) ) ( not ( = ?auto_450141 ?auto_450143 ) ) ( not ( = ?auto_450141 ?auto_450144 ) ) ( not ( = ?auto_450141 ?auto_450145 ) ) ( not ( = ?auto_450142 ?auto_450143 ) ) ( not ( = ?auto_450142 ?auto_450144 ) ) ( not ( = ?auto_450142 ?auto_450145 ) ) ( not ( = ?auto_450143 ?auto_450144 ) ) ( not ( = ?auto_450143 ?auto_450145 ) ) ( not ( = ?auto_450144 ?auto_450145 ) ) ( ON ?auto_450143 ?auto_450144 ) ( ON ?auto_450142 ?auto_450143 ) ( ON ?auto_450141 ?auto_450142 ) ( ON ?auto_450140 ?auto_450141 ) ( ON ?auto_450139 ?auto_450140 ) ( CLEAR ?auto_450137 ) ( ON ?auto_450138 ?auto_450139 ) ( CLEAR ?auto_450138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450137 ?auto_450138 )
      ( MAKE-8PILE ?auto_450137 ?auto_450138 ?auto_450139 ?auto_450140 ?auto_450141 ?auto_450142 ?auto_450143 ?auto_450144 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450154 - BLOCK
      ?auto_450155 - BLOCK
      ?auto_450156 - BLOCK
      ?auto_450157 - BLOCK
      ?auto_450158 - BLOCK
      ?auto_450159 - BLOCK
      ?auto_450160 - BLOCK
      ?auto_450161 - BLOCK
    )
    :vars
    (
      ?auto_450162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450161 ?auto_450162 ) ( not ( = ?auto_450154 ?auto_450155 ) ) ( not ( = ?auto_450154 ?auto_450156 ) ) ( not ( = ?auto_450154 ?auto_450157 ) ) ( not ( = ?auto_450154 ?auto_450158 ) ) ( not ( = ?auto_450154 ?auto_450159 ) ) ( not ( = ?auto_450154 ?auto_450160 ) ) ( not ( = ?auto_450154 ?auto_450161 ) ) ( not ( = ?auto_450154 ?auto_450162 ) ) ( not ( = ?auto_450155 ?auto_450156 ) ) ( not ( = ?auto_450155 ?auto_450157 ) ) ( not ( = ?auto_450155 ?auto_450158 ) ) ( not ( = ?auto_450155 ?auto_450159 ) ) ( not ( = ?auto_450155 ?auto_450160 ) ) ( not ( = ?auto_450155 ?auto_450161 ) ) ( not ( = ?auto_450155 ?auto_450162 ) ) ( not ( = ?auto_450156 ?auto_450157 ) ) ( not ( = ?auto_450156 ?auto_450158 ) ) ( not ( = ?auto_450156 ?auto_450159 ) ) ( not ( = ?auto_450156 ?auto_450160 ) ) ( not ( = ?auto_450156 ?auto_450161 ) ) ( not ( = ?auto_450156 ?auto_450162 ) ) ( not ( = ?auto_450157 ?auto_450158 ) ) ( not ( = ?auto_450157 ?auto_450159 ) ) ( not ( = ?auto_450157 ?auto_450160 ) ) ( not ( = ?auto_450157 ?auto_450161 ) ) ( not ( = ?auto_450157 ?auto_450162 ) ) ( not ( = ?auto_450158 ?auto_450159 ) ) ( not ( = ?auto_450158 ?auto_450160 ) ) ( not ( = ?auto_450158 ?auto_450161 ) ) ( not ( = ?auto_450158 ?auto_450162 ) ) ( not ( = ?auto_450159 ?auto_450160 ) ) ( not ( = ?auto_450159 ?auto_450161 ) ) ( not ( = ?auto_450159 ?auto_450162 ) ) ( not ( = ?auto_450160 ?auto_450161 ) ) ( not ( = ?auto_450160 ?auto_450162 ) ) ( not ( = ?auto_450161 ?auto_450162 ) ) ( ON ?auto_450160 ?auto_450161 ) ( ON ?auto_450159 ?auto_450160 ) ( ON ?auto_450158 ?auto_450159 ) ( ON ?auto_450157 ?auto_450158 ) ( ON ?auto_450156 ?auto_450157 ) ( ON ?auto_450155 ?auto_450156 ) ( ON ?auto_450154 ?auto_450155 ) ( CLEAR ?auto_450154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450154 )
      ( MAKE-8PILE ?auto_450154 ?auto_450155 ?auto_450156 ?auto_450157 ?auto_450158 ?auto_450159 ?auto_450160 ?auto_450161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_450171 - BLOCK
      ?auto_450172 - BLOCK
      ?auto_450173 - BLOCK
      ?auto_450174 - BLOCK
      ?auto_450175 - BLOCK
      ?auto_450176 - BLOCK
      ?auto_450177 - BLOCK
      ?auto_450178 - BLOCK
    )
    :vars
    (
      ?auto_450179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450178 ?auto_450179 ) ( not ( = ?auto_450171 ?auto_450172 ) ) ( not ( = ?auto_450171 ?auto_450173 ) ) ( not ( = ?auto_450171 ?auto_450174 ) ) ( not ( = ?auto_450171 ?auto_450175 ) ) ( not ( = ?auto_450171 ?auto_450176 ) ) ( not ( = ?auto_450171 ?auto_450177 ) ) ( not ( = ?auto_450171 ?auto_450178 ) ) ( not ( = ?auto_450171 ?auto_450179 ) ) ( not ( = ?auto_450172 ?auto_450173 ) ) ( not ( = ?auto_450172 ?auto_450174 ) ) ( not ( = ?auto_450172 ?auto_450175 ) ) ( not ( = ?auto_450172 ?auto_450176 ) ) ( not ( = ?auto_450172 ?auto_450177 ) ) ( not ( = ?auto_450172 ?auto_450178 ) ) ( not ( = ?auto_450172 ?auto_450179 ) ) ( not ( = ?auto_450173 ?auto_450174 ) ) ( not ( = ?auto_450173 ?auto_450175 ) ) ( not ( = ?auto_450173 ?auto_450176 ) ) ( not ( = ?auto_450173 ?auto_450177 ) ) ( not ( = ?auto_450173 ?auto_450178 ) ) ( not ( = ?auto_450173 ?auto_450179 ) ) ( not ( = ?auto_450174 ?auto_450175 ) ) ( not ( = ?auto_450174 ?auto_450176 ) ) ( not ( = ?auto_450174 ?auto_450177 ) ) ( not ( = ?auto_450174 ?auto_450178 ) ) ( not ( = ?auto_450174 ?auto_450179 ) ) ( not ( = ?auto_450175 ?auto_450176 ) ) ( not ( = ?auto_450175 ?auto_450177 ) ) ( not ( = ?auto_450175 ?auto_450178 ) ) ( not ( = ?auto_450175 ?auto_450179 ) ) ( not ( = ?auto_450176 ?auto_450177 ) ) ( not ( = ?auto_450176 ?auto_450178 ) ) ( not ( = ?auto_450176 ?auto_450179 ) ) ( not ( = ?auto_450177 ?auto_450178 ) ) ( not ( = ?auto_450177 ?auto_450179 ) ) ( not ( = ?auto_450178 ?auto_450179 ) ) ( ON ?auto_450177 ?auto_450178 ) ( ON ?auto_450176 ?auto_450177 ) ( ON ?auto_450175 ?auto_450176 ) ( ON ?auto_450174 ?auto_450175 ) ( ON ?auto_450173 ?auto_450174 ) ( ON ?auto_450172 ?auto_450173 ) ( ON ?auto_450171 ?auto_450172 ) ( CLEAR ?auto_450171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450171 )
      ( MAKE-8PILE ?auto_450171 ?auto_450172 ?auto_450173 ?auto_450174 ?auto_450175 ?auto_450176 ?auto_450177 ?auto_450178 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450189 - BLOCK
      ?auto_450190 - BLOCK
      ?auto_450191 - BLOCK
      ?auto_450192 - BLOCK
      ?auto_450193 - BLOCK
      ?auto_450194 - BLOCK
      ?auto_450195 - BLOCK
      ?auto_450196 - BLOCK
      ?auto_450197 - BLOCK
    )
    :vars
    (
      ?auto_450198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450196 ) ( ON ?auto_450197 ?auto_450198 ) ( CLEAR ?auto_450197 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450189 ) ( ON ?auto_450190 ?auto_450189 ) ( ON ?auto_450191 ?auto_450190 ) ( ON ?auto_450192 ?auto_450191 ) ( ON ?auto_450193 ?auto_450192 ) ( ON ?auto_450194 ?auto_450193 ) ( ON ?auto_450195 ?auto_450194 ) ( ON ?auto_450196 ?auto_450195 ) ( not ( = ?auto_450189 ?auto_450190 ) ) ( not ( = ?auto_450189 ?auto_450191 ) ) ( not ( = ?auto_450189 ?auto_450192 ) ) ( not ( = ?auto_450189 ?auto_450193 ) ) ( not ( = ?auto_450189 ?auto_450194 ) ) ( not ( = ?auto_450189 ?auto_450195 ) ) ( not ( = ?auto_450189 ?auto_450196 ) ) ( not ( = ?auto_450189 ?auto_450197 ) ) ( not ( = ?auto_450189 ?auto_450198 ) ) ( not ( = ?auto_450190 ?auto_450191 ) ) ( not ( = ?auto_450190 ?auto_450192 ) ) ( not ( = ?auto_450190 ?auto_450193 ) ) ( not ( = ?auto_450190 ?auto_450194 ) ) ( not ( = ?auto_450190 ?auto_450195 ) ) ( not ( = ?auto_450190 ?auto_450196 ) ) ( not ( = ?auto_450190 ?auto_450197 ) ) ( not ( = ?auto_450190 ?auto_450198 ) ) ( not ( = ?auto_450191 ?auto_450192 ) ) ( not ( = ?auto_450191 ?auto_450193 ) ) ( not ( = ?auto_450191 ?auto_450194 ) ) ( not ( = ?auto_450191 ?auto_450195 ) ) ( not ( = ?auto_450191 ?auto_450196 ) ) ( not ( = ?auto_450191 ?auto_450197 ) ) ( not ( = ?auto_450191 ?auto_450198 ) ) ( not ( = ?auto_450192 ?auto_450193 ) ) ( not ( = ?auto_450192 ?auto_450194 ) ) ( not ( = ?auto_450192 ?auto_450195 ) ) ( not ( = ?auto_450192 ?auto_450196 ) ) ( not ( = ?auto_450192 ?auto_450197 ) ) ( not ( = ?auto_450192 ?auto_450198 ) ) ( not ( = ?auto_450193 ?auto_450194 ) ) ( not ( = ?auto_450193 ?auto_450195 ) ) ( not ( = ?auto_450193 ?auto_450196 ) ) ( not ( = ?auto_450193 ?auto_450197 ) ) ( not ( = ?auto_450193 ?auto_450198 ) ) ( not ( = ?auto_450194 ?auto_450195 ) ) ( not ( = ?auto_450194 ?auto_450196 ) ) ( not ( = ?auto_450194 ?auto_450197 ) ) ( not ( = ?auto_450194 ?auto_450198 ) ) ( not ( = ?auto_450195 ?auto_450196 ) ) ( not ( = ?auto_450195 ?auto_450197 ) ) ( not ( = ?auto_450195 ?auto_450198 ) ) ( not ( = ?auto_450196 ?auto_450197 ) ) ( not ( = ?auto_450196 ?auto_450198 ) ) ( not ( = ?auto_450197 ?auto_450198 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450197 ?auto_450198 )
      ( !STACK ?auto_450197 ?auto_450196 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450208 - BLOCK
      ?auto_450209 - BLOCK
      ?auto_450210 - BLOCK
      ?auto_450211 - BLOCK
      ?auto_450212 - BLOCK
      ?auto_450213 - BLOCK
      ?auto_450214 - BLOCK
      ?auto_450215 - BLOCK
      ?auto_450216 - BLOCK
    )
    :vars
    (
      ?auto_450217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450215 ) ( ON ?auto_450216 ?auto_450217 ) ( CLEAR ?auto_450216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450208 ) ( ON ?auto_450209 ?auto_450208 ) ( ON ?auto_450210 ?auto_450209 ) ( ON ?auto_450211 ?auto_450210 ) ( ON ?auto_450212 ?auto_450211 ) ( ON ?auto_450213 ?auto_450212 ) ( ON ?auto_450214 ?auto_450213 ) ( ON ?auto_450215 ?auto_450214 ) ( not ( = ?auto_450208 ?auto_450209 ) ) ( not ( = ?auto_450208 ?auto_450210 ) ) ( not ( = ?auto_450208 ?auto_450211 ) ) ( not ( = ?auto_450208 ?auto_450212 ) ) ( not ( = ?auto_450208 ?auto_450213 ) ) ( not ( = ?auto_450208 ?auto_450214 ) ) ( not ( = ?auto_450208 ?auto_450215 ) ) ( not ( = ?auto_450208 ?auto_450216 ) ) ( not ( = ?auto_450208 ?auto_450217 ) ) ( not ( = ?auto_450209 ?auto_450210 ) ) ( not ( = ?auto_450209 ?auto_450211 ) ) ( not ( = ?auto_450209 ?auto_450212 ) ) ( not ( = ?auto_450209 ?auto_450213 ) ) ( not ( = ?auto_450209 ?auto_450214 ) ) ( not ( = ?auto_450209 ?auto_450215 ) ) ( not ( = ?auto_450209 ?auto_450216 ) ) ( not ( = ?auto_450209 ?auto_450217 ) ) ( not ( = ?auto_450210 ?auto_450211 ) ) ( not ( = ?auto_450210 ?auto_450212 ) ) ( not ( = ?auto_450210 ?auto_450213 ) ) ( not ( = ?auto_450210 ?auto_450214 ) ) ( not ( = ?auto_450210 ?auto_450215 ) ) ( not ( = ?auto_450210 ?auto_450216 ) ) ( not ( = ?auto_450210 ?auto_450217 ) ) ( not ( = ?auto_450211 ?auto_450212 ) ) ( not ( = ?auto_450211 ?auto_450213 ) ) ( not ( = ?auto_450211 ?auto_450214 ) ) ( not ( = ?auto_450211 ?auto_450215 ) ) ( not ( = ?auto_450211 ?auto_450216 ) ) ( not ( = ?auto_450211 ?auto_450217 ) ) ( not ( = ?auto_450212 ?auto_450213 ) ) ( not ( = ?auto_450212 ?auto_450214 ) ) ( not ( = ?auto_450212 ?auto_450215 ) ) ( not ( = ?auto_450212 ?auto_450216 ) ) ( not ( = ?auto_450212 ?auto_450217 ) ) ( not ( = ?auto_450213 ?auto_450214 ) ) ( not ( = ?auto_450213 ?auto_450215 ) ) ( not ( = ?auto_450213 ?auto_450216 ) ) ( not ( = ?auto_450213 ?auto_450217 ) ) ( not ( = ?auto_450214 ?auto_450215 ) ) ( not ( = ?auto_450214 ?auto_450216 ) ) ( not ( = ?auto_450214 ?auto_450217 ) ) ( not ( = ?auto_450215 ?auto_450216 ) ) ( not ( = ?auto_450215 ?auto_450217 ) ) ( not ( = ?auto_450216 ?auto_450217 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450216 ?auto_450217 )
      ( !STACK ?auto_450216 ?auto_450215 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450227 - BLOCK
      ?auto_450228 - BLOCK
      ?auto_450229 - BLOCK
      ?auto_450230 - BLOCK
      ?auto_450231 - BLOCK
      ?auto_450232 - BLOCK
      ?auto_450233 - BLOCK
      ?auto_450234 - BLOCK
      ?auto_450235 - BLOCK
    )
    :vars
    (
      ?auto_450236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450235 ?auto_450236 ) ( ON-TABLE ?auto_450227 ) ( ON ?auto_450228 ?auto_450227 ) ( ON ?auto_450229 ?auto_450228 ) ( ON ?auto_450230 ?auto_450229 ) ( ON ?auto_450231 ?auto_450230 ) ( ON ?auto_450232 ?auto_450231 ) ( ON ?auto_450233 ?auto_450232 ) ( not ( = ?auto_450227 ?auto_450228 ) ) ( not ( = ?auto_450227 ?auto_450229 ) ) ( not ( = ?auto_450227 ?auto_450230 ) ) ( not ( = ?auto_450227 ?auto_450231 ) ) ( not ( = ?auto_450227 ?auto_450232 ) ) ( not ( = ?auto_450227 ?auto_450233 ) ) ( not ( = ?auto_450227 ?auto_450234 ) ) ( not ( = ?auto_450227 ?auto_450235 ) ) ( not ( = ?auto_450227 ?auto_450236 ) ) ( not ( = ?auto_450228 ?auto_450229 ) ) ( not ( = ?auto_450228 ?auto_450230 ) ) ( not ( = ?auto_450228 ?auto_450231 ) ) ( not ( = ?auto_450228 ?auto_450232 ) ) ( not ( = ?auto_450228 ?auto_450233 ) ) ( not ( = ?auto_450228 ?auto_450234 ) ) ( not ( = ?auto_450228 ?auto_450235 ) ) ( not ( = ?auto_450228 ?auto_450236 ) ) ( not ( = ?auto_450229 ?auto_450230 ) ) ( not ( = ?auto_450229 ?auto_450231 ) ) ( not ( = ?auto_450229 ?auto_450232 ) ) ( not ( = ?auto_450229 ?auto_450233 ) ) ( not ( = ?auto_450229 ?auto_450234 ) ) ( not ( = ?auto_450229 ?auto_450235 ) ) ( not ( = ?auto_450229 ?auto_450236 ) ) ( not ( = ?auto_450230 ?auto_450231 ) ) ( not ( = ?auto_450230 ?auto_450232 ) ) ( not ( = ?auto_450230 ?auto_450233 ) ) ( not ( = ?auto_450230 ?auto_450234 ) ) ( not ( = ?auto_450230 ?auto_450235 ) ) ( not ( = ?auto_450230 ?auto_450236 ) ) ( not ( = ?auto_450231 ?auto_450232 ) ) ( not ( = ?auto_450231 ?auto_450233 ) ) ( not ( = ?auto_450231 ?auto_450234 ) ) ( not ( = ?auto_450231 ?auto_450235 ) ) ( not ( = ?auto_450231 ?auto_450236 ) ) ( not ( = ?auto_450232 ?auto_450233 ) ) ( not ( = ?auto_450232 ?auto_450234 ) ) ( not ( = ?auto_450232 ?auto_450235 ) ) ( not ( = ?auto_450232 ?auto_450236 ) ) ( not ( = ?auto_450233 ?auto_450234 ) ) ( not ( = ?auto_450233 ?auto_450235 ) ) ( not ( = ?auto_450233 ?auto_450236 ) ) ( not ( = ?auto_450234 ?auto_450235 ) ) ( not ( = ?auto_450234 ?auto_450236 ) ) ( not ( = ?auto_450235 ?auto_450236 ) ) ( CLEAR ?auto_450233 ) ( ON ?auto_450234 ?auto_450235 ) ( CLEAR ?auto_450234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_450227 ?auto_450228 ?auto_450229 ?auto_450230 ?auto_450231 ?auto_450232 ?auto_450233 ?auto_450234 )
      ( MAKE-9PILE ?auto_450227 ?auto_450228 ?auto_450229 ?auto_450230 ?auto_450231 ?auto_450232 ?auto_450233 ?auto_450234 ?auto_450235 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450246 - BLOCK
      ?auto_450247 - BLOCK
      ?auto_450248 - BLOCK
      ?auto_450249 - BLOCK
      ?auto_450250 - BLOCK
      ?auto_450251 - BLOCK
      ?auto_450252 - BLOCK
      ?auto_450253 - BLOCK
      ?auto_450254 - BLOCK
    )
    :vars
    (
      ?auto_450255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450254 ?auto_450255 ) ( ON-TABLE ?auto_450246 ) ( ON ?auto_450247 ?auto_450246 ) ( ON ?auto_450248 ?auto_450247 ) ( ON ?auto_450249 ?auto_450248 ) ( ON ?auto_450250 ?auto_450249 ) ( ON ?auto_450251 ?auto_450250 ) ( ON ?auto_450252 ?auto_450251 ) ( not ( = ?auto_450246 ?auto_450247 ) ) ( not ( = ?auto_450246 ?auto_450248 ) ) ( not ( = ?auto_450246 ?auto_450249 ) ) ( not ( = ?auto_450246 ?auto_450250 ) ) ( not ( = ?auto_450246 ?auto_450251 ) ) ( not ( = ?auto_450246 ?auto_450252 ) ) ( not ( = ?auto_450246 ?auto_450253 ) ) ( not ( = ?auto_450246 ?auto_450254 ) ) ( not ( = ?auto_450246 ?auto_450255 ) ) ( not ( = ?auto_450247 ?auto_450248 ) ) ( not ( = ?auto_450247 ?auto_450249 ) ) ( not ( = ?auto_450247 ?auto_450250 ) ) ( not ( = ?auto_450247 ?auto_450251 ) ) ( not ( = ?auto_450247 ?auto_450252 ) ) ( not ( = ?auto_450247 ?auto_450253 ) ) ( not ( = ?auto_450247 ?auto_450254 ) ) ( not ( = ?auto_450247 ?auto_450255 ) ) ( not ( = ?auto_450248 ?auto_450249 ) ) ( not ( = ?auto_450248 ?auto_450250 ) ) ( not ( = ?auto_450248 ?auto_450251 ) ) ( not ( = ?auto_450248 ?auto_450252 ) ) ( not ( = ?auto_450248 ?auto_450253 ) ) ( not ( = ?auto_450248 ?auto_450254 ) ) ( not ( = ?auto_450248 ?auto_450255 ) ) ( not ( = ?auto_450249 ?auto_450250 ) ) ( not ( = ?auto_450249 ?auto_450251 ) ) ( not ( = ?auto_450249 ?auto_450252 ) ) ( not ( = ?auto_450249 ?auto_450253 ) ) ( not ( = ?auto_450249 ?auto_450254 ) ) ( not ( = ?auto_450249 ?auto_450255 ) ) ( not ( = ?auto_450250 ?auto_450251 ) ) ( not ( = ?auto_450250 ?auto_450252 ) ) ( not ( = ?auto_450250 ?auto_450253 ) ) ( not ( = ?auto_450250 ?auto_450254 ) ) ( not ( = ?auto_450250 ?auto_450255 ) ) ( not ( = ?auto_450251 ?auto_450252 ) ) ( not ( = ?auto_450251 ?auto_450253 ) ) ( not ( = ?auto_450251 ?auto_450254 ) ) ( not ( = ?auto_450251 ?auto_450255 ) ) ( not ( = ?auto_450252 ?auto_450253 ) ) ( not ( = ?auto_450252 ?auto_450254 ) ) ( not ( = ?auto_450252 ?auto_450255 ) ) ( not ( = ?auto_450253 ?auto_450254 ) ) ( not ( = ?auto_450253 ?auto_450255 ) ) ( not ( = ?auto_450254 ?auto_450255 ) ) ( CLEAR ?auto_450252 ) ( ON ?auto_450253 ?auto_450254 ) ( CLEAR ?auto_450253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_450246 ?auto_450247 ?auto_450248 ?auto_450249 ?auto_450250 ?auto_450251 ?auto_450252 ?auto_450253 )
      ( MAKE-9PILE ?auto_450246 ?auto_450247 ?auto_450248 ?auto_450249 ?auto_450250 ?auto_450251 ?auto_450252 ?auto_450253 ?auto_450254 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450265 - BLOCK
      ?auto_450266 - BLOCK
      ?auto_450267 - BLOCK
      ?auto_450268 - BLOCK
      ?auto_450269 - BLOCK
      ?auto_450270 - BLOCK
      ?auto_450271 - BLOCK
      ?auto_450272 - BLOCK
      ?auto_450273 - BLOCK
    )
    :vars
    (
      ?auto_450274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450273 ?auto_450274 ) ( ON-TABLE ?auto_450265 ) ( ON ?auto_450266 ?auto_450265 ) ( ON ?auto_450267 ?auto_450266 ) ( ON ?auto_450268 ?auto_450267 ) ( ON ?auto_450269 ?auto_450268 ) ( ON ?auto_450270 ?auto_450269 ) ( not ( = ?auto_450265 ?auto_450266 ) ) ( not ( = ?auto_450265 ?auto_450267 ) ) ( not ( = ?auto_450265 ?auto_450268 ) ) ( not ( = ?auto_450265 ?auto_450269 ) ) ( not ( = ?auto_450265 ?auto_450270 ) ) ( not ( = ?auto_450265 ?auto_450271 ) ) ( not ( = ?auto_450265 ?auto_450272 ) ) ( not ( = ?auto_450265 ?auto_450273 ) ) ( not ( = ?auto_450265 ?auto_450274 ) ) ( not ( = ?auto_450266 ?auto_450267 ) ) ( not ( = ?auto_450266 ?auto_450268 ) ) ( not ( = ?auto_450266 ?auto_450269 ) ) ( not ( = ?auto_450266 ?auto_450270 ) ) ( not ( = ?auto_450266 ?auto_450271 ) ) ( not ( = ?auto_450266 ?auto_450272 ) ) ( not ( = ?auto_450266 ?auto_450273 ) ) ( not ( = ?auto_450266 ?auto_450274 ) ) ( not ( = ?auto_450267 ?auto_450268 ) ) ( not ( = ?auto_450267 ?auto_450269 ) ) ( not ( = ?auto_450267 ?auto_450270 ) ) ( not ( = ?auto_450267 ?auto_450271 ) ) ( not ( = ?auto_450267 ?auto_450272 ) ) ( not ( = ?auto_450267 ?auto_450273 ) ) ( not ( = ?auto_450267 ?auto_450274 ) ) ( not ( = ?auto_450268 ?auto_450269 ) ) ( not ( = ?auto_450268 ?auto_450270 ) ) ( not ( = ?auto_450268 ?auto_450271 ) ) ( not ( = ?auto_450268 ?auto_450272 ) ) ( not ( = ?auto_450268 ?auto_450273 ) ) ( not ( = ?auto_450268 ?auto_450274 ) ) ( not ( = ?auto_450269 ?auto_450270 ) ) ( not ( = ?auto_450269 ?auto_450271 ) ) ( not ( = ?auto_450269 ?auto_450272 ) ) ( not ( = ?auto_450269 ?auto_450273 ) ) ( not ( = ?auto_450269 ?auto_450274 ) ) ( not ( = ?auto_450270 ?auto_450271 ) ) ( not ( = ?auto_450270 ?auto_450272 ) ) ( not ( = ?auto_450270 ?auto_450273 ) ) ( not ( = ?auto_450270 ?auto_450274 ) ) ( not ( = ?auto_450271 ?auto_450272 ) ) ( not ( = ?auto_450271 ?auto_450273 ) ) ( not ( = ?auto_450271 ?auto_450274 ) ) ( not ( = ?auto_450272 ?auto_450273 ) ) ( not ( = ?auto_450272 ?auto_450274 ) ) ( not ( = ?auto_450273 ?auto_450274 ) ) ( ON ?auto_450272 ?auto_450273 ) ( CLEAR ?auto_450270 ) ( ON ?auto_450271 ?auto_450272 ) ( CLEAR ?auto_450271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_450265 ?auto_450266 ?auto_450267 ?auto_450268 ?auto_450269 ?auto_450270 ?auto_450271 )
      ( MAKE-9PILE ?auto_450265 ?auto_450266 ?auto_450267 ?auto_450268 ?auto_450269 ?auto_450270 ?auto_450271 ?auto_450272 ?auto_450273 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450284 - BLOCK
      ?auto_450285 - BLOCK
      ?auto_450286 - BLOCK
      ?auto_450287 - BLOCK
      ?auto_450288 - BLOCK
      ?auto_450289 - BLOCK
      ?auto_450290 - BLOCK
      ?auto_450291 - BLOCK
      ?auto_450292 - BLOCK
    )
    :vars
    (
      ?auto_450293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450292 ?auto_450293 ) ( ON-TABLE ?auto_450284 ) ( ON ?auto_450285 ?auto_450284 ) ( ON ?auto_450286 ?auto_450285 ) ( ON ?auto_450287 ?auto_450286 ) ( ON ?auto_450288 ?auto_450287 ) ( ON ?auto_450289 ?auto_450288 ) ( not ( = ?auto_450284 ?auto_450285 ) ) ( not ( = ?auto_450284 ?auto_450286 ) ) ( not ( = ?auto_450284 ?auto_450287 ) ) ( not ( = ?auto_450284 ?auto_450288 ) ) ( not ( = ?auto_450284 ?auto_450289 ) ) ( not ( = ?auto_450284 ?auto_450290 ) ) ( not ( = ?auto_450284 ?auto_450291 ) ) ( not ( = ?auto_450284 ?auto_450292 ) ) ( not ( = ?auto_450284 ?auto_450293 ) ) ( not ( = ?auto_450285 ?auto_450286 ) ) ( not ( = ?auto_450285 ?auto_450287 ) ) ( not ( = ?auto_450285 ?auto_450288 ) ) ( not ( = ?auto_450285 ?auto_450289 ) ) ( not ( = ?auto_450285 ?auto_450290 ) ) ( not ( = ?auto_450285 ?auto_450291 ) ) ( not ( = ?auto_450285 ?auto_450292 ) ) ( not ( = ?auto_450285 ?auto_450293 ) ) ( not ( = ?auto_450286 ?auto_450287 ) ) ( not ( = ?auto_450286 ?auto_450288 ) ) ( not ( = ?auto_450286 ?auto_450289 ) ) ( not ( = ?auto_450286 ?auto_450290 ) ) ( not ( = ?auto_450286 ?auto_450291 ) ) ( not ( = ?auto_450286 ?auto_450292 ) ) ( not ( = ?auto_450286 ?auto_450293 ) ) ( not ( = ?auto_450287 ?auto_450288 ) ) ( not ( = ?auto_450287 ?auto_450289 ) ) ( not ( = ?auto_450287 ?auto_450290 ) ) ( not ( = ?auto_450287 ?auto_450291 ) ) ( not ( = ?auto_450287 ?auto_450292 ) ) ( not ( = ?auto_450287 ?auto_450293 ) ) ( not ( = ?auto_450288 ?auto_450289 ) ) ( not ( = ?auto_450288 ?auto_450290 ) ) ( not ( = ?auto_450288 ?auto_450291 ) ) ( not ( = ?auto_450288 ?auto_450292 ) ) ( not ( = ?auto_450288 ?auto_450293 ) ) ( not ( = ?auto_450289 ?auto_450290 ) ) ( not ( = ?auto_450289 ?auto_450291 ) ) ( not ( = ?auto_450289 ?auto_450292 ) ) ( not ( = ?auto_450289 ?auto_450293 ) ) ( not ( = ?auto_450290 ?auto_450291 ) ) ( not ( = ?auto_450290 ?auto_450292 ) ) ( not ( = ?auto_450290 ?auto_450293 ) ) ( not ( = ?auto_450291 ?auto_450292 ) ) ( not ( = ?auto_450291 ?auto_450293 ) ) ( not ( = ?auto_450292 ?auto_450293 ) ) ( ON ?auto_450291 ?auto_450292 ) ( CLEAR ?auto_450289 ) ( ON ?auto_450290 ?auto_450291 ) ( CLEAR ?auto_450290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_450284 ?auto_450285 ?auto_450286 ?auto_450287 ?auto_450288 ?auto_450289 ?auto_450290 )
      ( MAKE-9PILE ?auto_450284 ?auto_450285 ?auto_450286 ?auto_450287 ?auto_450288 ?auto_450289 ?auto_450290 ?auto_450291 ?auto_450292 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450303 - BLOCK
      ?auto_450304 - BLOCK
      ?auto_450305 - BLOCK
      ?auto_450306 - BLOCK
      ?auto_450307 - BLOCK
      ?auto_450308 - BLOCK
      ?auto_450309 - BLOCK
      ?auto_450310 - BLOCK
      ?auto_450311 - BLOCK
    )
    :vars
    (
      ?auto_450312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450311 ?auto_450312 ) ( ON-TABLE ?auto_450303 ) ( ON ?auto_450304 ?auto_450303 ) ( ON ?auto_450305 ?auto_450304 ) ( ON ?auto_450306 ?auto_450305 ) ( ON ?auto_450307 ?auto_450306 ) ( not ( = ?auto_450303 ?auto_450304 ) ) ( not ( = ?auto_450303 ?auto_450305 ) ) ( not ( = ?auto_450303 ?auto_450306 ) ) ( not ( = ?auto_450303 ?auto_450307 ) ) ( not ( = ?auto_450303 ?auto_450308 ) ) ( not ( = ?auto_450303 ?auto_450309 ) ) ( not ( = ?auto_450303 ?auto_450310 ) ) ( not ( = ?auto_450303 ?auto_450311 ) ) ( not ( = ?auto_450303 ?auto_450312 ) ) ( not ( = ?auto_450304 ?auto_450305 ) ) ( not ( = ?auto_450304 ?auto_450306 ) ) ( not ( = ?auto_450304 ?auto_450307 ) ) ( not ( = ?auto_450304 ?auto_450308 ) ) ( not ( = ?auto_450304 ?auto_450309 ) ) ( not ( = ?auto_450304 ?auto_450310 ) ) ( not ( = ?auto_450304 ?auto_450311 ) ) ( not ( = ?auto_450304 ?auto_450312 ) ) ( not ( = ?auto_450305 ?auto_450306 ) ) ( not ( = ?auto_450305 ?auto_450307 ) ) ( not ( = ?auto_450305 ?auto_450308 ) ) ( not ( = ?auto_450305 ?auto_450309 ) ) ( not ( = ?auto_450305 ?auto_450310 ) ) ( not ( = ?auto_450305 ?auto_450311 ) ) ( not ( = ?auto_450305 ?auto_450312 ) ) ( not ( = ?auto_450306 ?auto_450307 ) ) ( not ( = ?auto_450306 ?auto_450308 ) ) ( not ( = ?auto_450306 ?auto_450309 ) ) ( not ( = ?auto_450306 ?auto_450310 ) ) ( not ( = ?auto_450306 ?auto_450311 ) ) ( not ( = ?auto_450306 ?auto_450312 ) ) ( not ( = ?auto_450307 ?auto_450308 ) ) ( not ( = ?auto_450307 ?auto_450309 ) ) ( not ( = ?auto_450307 ?auto_450310 ) ) ( not ( = ?auto_450307 ?auto_450311 ) ) ( not ( = ?auto_450307 ?auto_450312 ) ) ( not ( = ?auto_450308 ?auto_450309 ) ) ( not ( = ?auto_450308 ?auto_450310 ) ) ( not ( = ?auto_450308 ?auto_450311 ) ) ( not ( = ?auto_450308 ?auto_450312 ) ) ( not ( = ?auto_450309 ?auto_450310 ) ) ( not ( = ?auto_450309 ?auto_450311 ) ) ( not ( = ?auto_450309 ?auto_450312 ) ) ( not ( = ?auto_450310 ?auto_450311 ) ) ( not ( = ?auto_450310 ?auto_450312 ) ) ( not ( = ?auto_450311 ?auto_450312 ) ) ( ON ?auto_450310 ?auto_450311 ) ( ON ?auto_450309 ?auto_450310 ) ( CLEAR ?auto_450307 ) ( ON ?auto_450308 ?auto_450309 ) ( CLEAR ?auto_450308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_450303 ?auto_450304 ?auto_450305 ?auto_450306 ?auto_450307 ?auto_450308 )
      ( MAKE-9PILE ?auto_450303 ?auto_450304 ?auto_450305 ?auto_450306 ?auto_450307 ?auto_450308 ?auto_450309 ?auto_450310 ?auto_450311 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450322 - BLOCK
      ?auto_450323 - BLOCK
      ?auto_450324 - BLOCK
      ?auto_450325 - BLOCK
      ?auto_450326 - BLOCK
      ?auto_450327 - BLOCK
      ?auto_450328 - BLOCK
      ?auto_450329 - BLOCK
      ?auto_450330 - BLOCK
    )
    :vars
    (
      ?auto_450331 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450330 ?auto_450331 ) ( ON-TABLE ?auto_450322 ) ( ON ?auto_450323 ?auto_450322 ) ( ON ?auto_450324 ?auto_450323 ) ( ON ?auto_450325 ?auto_450324 ) ( ON ?auto_450326 ?auto_450325 ) ( not ( = ?auto_450322 ?auto_450323 ) ) ( not ( = ?auto_450322 ?auto_450324 ) ) ( not ( = ?auto_450322 ?auto_450325 ) ) ( not ( = ?auto_450322 ?auto_450326 ) ) ( not ( = ?auto_450322 ?auto_450327 ) ) ( not ( = ?auto_450322 ?auto_450328 ) ) ( not ( = ?auto_450322 ?auto_450329 ) ) ( not ( = ?auto_450322 ?auto_450330 ) ) ( not ( = ?auto_450322 ?auto_450331 ) ) ( not ( = ?auto_450323 ?auto_450324 ) ) ( not ( = ?auto_450323 ?auto_450325 ) ) ( not ( = ?auto_450323 ?auto_450326 ) ) ( not ( = ?auto_450323 ?auto_450327 ) ) ( not ( = ?auto_450323 ?auto_450328 ) ) ( not ( = ?auto_450323 ?auto_450329 ) ) ( not ( = ?auto_450323 ?auto_450330 ) ) ( not ( = ?auto_450323 ?auto_450331 ) ) ( not ( = ?auto_450324 ?auto_450325 ) ) ( not ( = ?auto_450324 ?auto_450326 ) ) ( not ( = ?auto_450324 ?auto_450327 ) ) ( not ( = ?auto_450324 ?auto_450328 ) ) ( not ( = ?auto_450324 ?auto_450329 ) ) ( not ( = ?auto_450324 ?auto_450330 ) ) ( not ( = ?auto_450324 ?auto_450331 ) ) ( not ( = ?auto_450325 ?auto_450326 ) ) ( not ( = ?auto_450325 ?auto_450327 ) ) ( not ( = ?auto_450325 ?auto_450328 ) ) ( not ( = ?auto_450325 ?auto_450329 ) ) ( not ( = ?auto_450325 ?auto_450330 ) ) ( not ( = ?auto_450325 ?auto_450331 ) ) ( not ( = ?auto_450326 ?auto_450327 ) ) ( not ( = ?auto_450326 ?auto_450328 ) ) ( not ( = ?auto_450326 ?auto_450329 ) ) ( not ( = ?auto_450326 ?auto_450330 ) ) ( not ( = ?auto_450326 ?auto_450331 ) ) ( not ( = ?auto_450327 ?auto_450328 ) ) ( not ( = ?auto_450327 ?auto_450329 ) ) ( not ( = ?auto_450327 ?auto_450330 ) ) ( not ( = ?auto_450327 ?auto_450331 ) ) ( not ( = ?auto_450328 ?auto_450329 ) ) ( not ( = ?auto_450328 ?auto_450330 ) ) ( not ( = ?auto_450328 ?auto_450331 ) ) ( not ( = ?auto_450329 ?auto_450330 ) ) ( not ( = ?auto_450329 ?auto_450331 ) ) ( not ( = ?auto_450330 ?auto_450331 ) ) ( ON ?auto_450329 ?auto_450330 ) ( ON ?auto_450328 ?auto_450329 ) ( CLEAR ?auto_450326 ) ( ON ?auto_450327 ?auto_450328 ) ( CLEAR ?auto_450327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_450322 ?auto_450323 ?auto_450324 ?auto_450325 ?auto_450326 ?auto_450327 )
      ( MAKE-9PILE ?auto_450322 ?auto_450323 ?auto_450324 ?auto_450325 ?auto_450326 ?auto_450327 ?auto_450328 ?auto_450329 ?auto_450330 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450341 - BLOCK
      ?auto_450342 - BLOCK
      ?auto_450343 - BLOCK
      ?auto_450344 - BLOCK
      ?auto_450345 - BLOCK
      ?auto_450346 - BLOCK
      ?auto_450347 - BLOCK
      ?auto_450348 - BLOCK
      ?auto_450349 - BLOCK
    )
    :vars
    (
      ?auto_450350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450349 ?auto_450350 ) ( ON-TABLE ?auto_450341 ) ( ON ?auto_450342 ?auto_450341 ) ( ON ?auto_450343 ?auto_450342 ) ( ON ?auto_450344 ?auto_450343 ) ( not ( = ?auto_450341 ?auto_450342 ) ) ( not ( = ?auto_450341 ?auto_450343 ) ) ( not ( = ?auto_450341 ?auto_450344 ) ) ( not ( = ?auto_450341 ?auto_450345 ) ) ( not ( = ?auto_450341 ?auto_450346 ) ) ( not ( = ?auto_450341 ?auto_450347 ) ) ( not ( = ?auto_450341 ?auto_450348 ) ) ( not ( = ?auto_450341 ?auto_450349 ) ) ( not ( = ?auto_450341 ?auto_450350 ) ) ( not ( = ?auto_450342 ?auto_450343 ) ) ( not ( = ?auto_450342 ?auto_450344 ) ) ( not ( = ?auto_450342 ?auto_450345 ) ) ( not ( = ?auto_450342 ?auto_450346 ) ) ( not ( = ?auto_450342 ?auto_450347 ) ) ( not ( = ?auto_450342 ?auto_450348 ) ) ( not ( = ?auto_450342 ?auto_450349 ) ) ( not ( = ?auto_450342 ?auto_450350 ) ) ( not ( = ?auto_450343 ?auto_450344 ) ) ( not ( = ?auto_450343 ?auto_450345 ) ) ( not ( = ?auto_450343 ?auto_450346 ) ) ( not ( = ?auto_450343 ?auto_450347 ) ) ( not ( = ?auto_450343 ?auto_450348 ) ) ( not ( = ?auto_450343 ?auto_450349 ) ) ( not ( = ?auto_450343 ?auto_450350 ) ) ( not ( = ?auto_450344 ?auto_450345 ) ) ( not ( = ?auto_450344 ?auto_450346 ) ) ( not ( = ?auto_450344 ?auto_450347 ) ) ( not ( = ?auto_450344 ?auto_450348 ) ) ( not ( = ?auto_450344 ?auto_450349 ) ) ( not ( = ?auto_450344 ?auto_450350 ) ) ( not ( = ?auto_450345 ?auto_450346 ) ) ( not ( = ?auto_450345 ?auto_450347 ) ) ( not ( = ?auto_450345 ?auto_450348 ) ) ( not ( = ?auto_450345 ?auto_450349 ) ) ( not ( = ?auto_450345 ?auto_450350 ) ) ( not ( = ?auto_450346 ?auto_450347 ) ) ( not ( = ?auto_450346 ?auto_450348 ) ) ( not ( = ?auto_450346 ?auto_450349 ) ) ( not ( = ?auto_450346 ?auto_450350 ) ) ( not ( = ?auto_450347 ?auto_450348 ) ) ( not ( = ?auto_450347 ?auto_450349 ) ) ( not ( = ?auto_450347 ?auto_450350 ) ) ( not ( = ?auto_450348 ?auto_450349 ) ) ( not ( = ?auto_450348 ?auto_450350 ) ) ( not ( = ?auto_450349 ?auto_450350 ) ) ( ON ?auto_450348 ?auto_450349 ) ( ON ?auto_450347 ?auto_450348 ) ( ON ?auto_450346 ?auto_450347 ) ( CLEAR ?auto_450344 ) ( ON ?auto_450345 ?auto_450346 ) ( CLEAR ?auto_450345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450341 ?auto_450342 ?auto_450343 ?auto_450344 ?auto_450345 )
      ( MAKE-9PILE ?auto_450341 ?auto_450342 ?auto_450343 ?auto_450344 ?auto_450345 ?auto_450346 ?auto_450347 ?auto_450348 ?auto_450349 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450360 - BLOCK
      ?auto_450361 - BLOCK
      ?auto_450362 - BLOCK
      ?auto_450363 - BLOCK
      ?auto_450364 - BLOCK
      ?auto_450365 - BLOCK
      ?auto_450366 - BLOCK
      ?auto_450367 - BLOCK
      ?auto_450368 - BLOCK
    )
    :vars
    (
      ?auto_450369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450368 ?auto_450369 ) ( ON-TABLE ?auto_450360 ) ( ON ?auto_450361 ?auto_450360 ) ( ON ?auto_450362 ?auto_450361 ) ( ON ?auto_450363 ?auto_450362 ) ( not ( = ?auto_450360 ?auto_450361 ) ) ( not ( = ?auto_450360 ?auto_450362 ) ) ( not ( = ?auto_450360 ?auto_450363 ) ) ( not ( = ?auto_450360 ?auto_450364 ) ) ( not ( = ?auto_450360 ?auto_450365 ) ) ( not ( = ?auto_450360 ?auto_450366 ) ) ( not ( = ?auto_450360 ?auto_450367 ) ) ( not ( = ?auto_450360 ?auto_450368 ) ) ( not ( = ?auto_450360 ?auto_450369 ) ) ( not ( = ?auto_450361 ?auto_450362 ) ) ( not ( = ?auto_450361 ?auto_450363 ) ) ( not ( = ?auto_450361 ?auto_450364 ) ) ( not ( = ?auto_450361 ?auto_450365 ) ) ( not ( = ?auto_450361 ?auto_450366 ) ) ( not ( = ?auto_450361 ?auto_450367 ) ) ( not ( = ?auto_450361 ?auto_450368 ) ) ( not ( = ?auto_450361 ?auto_450369 ) ) ( not ( = ?auto_450362 ?auto_450363 ) ) ( not ( = ?auto_450362 ?auto_450364 ) ) ( not ( = ?auto_450362 ?auto_450365 ) ) ( not ( = ?auto_450362 ?auto_450366 ) ) ( not ( = ?auto_450362 ?auto_450367 ) ) ( not ( = ?auto_450362 ?auto_450368 ) ) ( not ( = ?auto_450362 ?auto_450369 ) ) ( not ( = ?auto_450363 ?auto_450364 ) ) ( not ( = ?auto_450363 ?auto_450365 ) ) ( not ( = ?auto_450363 ?auto_450366 ) ) ( not ( = ?auto_450363 ?auto_450367 ) ) ( not ( = ?auto_450363 ?auto_450368 ) ) ( not ( = ?auto_450363 ?auto_450369 ) ) ( not ( = ?auto_450364 ?auto_450365 ) ) ( not ( = ?auto_450364 ?auto_450366 ) ) ( not ( = ?auto_450364 ?auto_450367 ) ) ( not ( = ?auto_450364 ?auto_450368 ) ) ( not ( = ?auto_450364 ?auto_450369 ) ) ( not ( = ?auto_450365 ?auto_450366 ) ) ( not ( = ?auto_450365 ?auto_450367 ) ) ( not ( = ?auto_450365 ?auto_450368 ) ) ( not ( = ?auto_450365 ?auto_450369 ) ) ( not ( = ?auto_450366 ?auto_450367 ) ) ( not ( = ?auto_450366 ?auto_450368 ) ) ( not ( = ?auto_450366 ?auto_450369 ) ) ( not ( = ?auto_450367 ?auto_450368 ) ) ( not ( = ?auto_450367 ?auto_450369 ) ) ( not ( = ?auto_450368 ?auto_450369 ) ) ( ON ?auto_450367 ?auto_450368 ) ( ON ?auto_450366 ?auto_450367 ) ( ON ?auto_450365 ?auto_450366 ) ( CLEAR ?auto_450363 ) ( ON ?auto_450364 ?auto_450365 ) ( CLEAR ?auto_450364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450360 ?auto_450361 ?auto_450362 ?auto_450363 ?auto_450364 )
      ( MAKE-9PILE ?auto_450360 ?auto_450361 ?auto_450362 ?auto_450363 ?auto_450364 ?auto_450365 ?auto_450366 ?auto_450367 ?auto_450368 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450379 - BLOCK
      ?auto_450380 - BLOCK
      ?auto_450381 - BLOCK
      ?auto_450382 - BLOCK
      ?auto_450383 - BLOCK
      ?auto_450384 - BLOCK
      ?auto_450385 - BLOCK
      ?auto_450386 - BLOCK
      ?auto_450387 - BLOCK
    )
    :vars
    (
      ?auto_450388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450387 ?auto_450388 ) ( ON-TABLE ?auto_450379 ) ( ON ?auto_450380 ?auto_450379 ) ( ON ?auto_450381 ?auto_450380 ) ( not ( = ?auto_450379 ?auto_450380 ) ) ( not ( = ?auto_450379 ?auto_450381 ) ) ( not ( = ?auto_450379 ?auto_450382 ) ) ( not ( = ?auto_450379 ?auto_450383 ) ) ( not ( = ?auto_450379 ?auto_450384 ) ) ( not ( = ?auto_450379 ?auto_450385 ) ) ( not ( = ?auto_450379 ?auto_450386 ) ) ( not ( = ?auto_450379 ?auto_450387 ) ) ( not ( = ?auto_450379 ?auto_450388 ) ) ( not ( = ?auto_450380 ?auto_450381 ) ) ( not ( = ?auto_450380 ?auto_450382 ) ) ( not ( = ?auto_450380 ?auto_450383 ) ) ( not ( = ?auto_450380 ?auto_450384 ) ) ( not ( = ?auto_450380 ?auto_450385 ) ) ( not ( = ?auto_450380 ?auto_450386 ) ) ( not ( = ?auto_450380 ?auto_450387 ) ) ( not ( = ?auto_450380 ?auto_450388 ) ) ( not ( = ?auto_450381 ?auto_450382 ) ) ( not ( = ?auto_450381 ?auto_450383 ) ) ( not ( = ?auto_450381 ?auto_450384 ) ) ( not ( = ?auto_450381 ?auto_450385 ) ) ( not ( = ?auto_450381 ?auto_450386 ) ) ( not ( = ?auto_450381 ?auto_450387 ) ) ( not ( = ?auto_450381 ?auto_450388 ) ) ( not ( = ?auto_450382 ?auto_450383 ) ) ( not ( = ?auto_450382 ?auto_450384 ) ) ( not ( = ?auto_450382 ?auto_450385 ) ) ( not ( = ?auto_450382 ?auto_450386 ) ) ( not ( = ?auto_450382 ?auto_450387 ) ) ( not ( = ?auto_450382 ?auto_450388 ) ) ( not ( = ?auto_450383 ?auto_450384 ) ) ( not ( = ?auto_450383 ?auto_450385 ) ) ( not ( = ?auto_450383 ?auto_450386 ) ) ( not ( = ?auto_450383 ?auto_450387 ) ) ( not ( = ?auto_450383 ?auto_450388 ) ) ( not ( = ?auto_450384 ?auto_450385 ) ) ( not ( = ?auto_450384 ?auto_450386 ) ) ( not ( = ?auto_450384 ?auto_450387 ) ) ( not ( = ?auto_450384 ?auto_450388 ) ) ( not ( = ?auto_450385 ?auto_450386 ) ) ( not ( = ?auto_450385 ?auto_450387 ) ) ( not ( = ?auto_450385 ?auto_450388 ) ) ( not ( = ?auto_450386 ?auto_450387 ) ) ( not ( = ?auto_450386 ?auto_450388 ) ) ( not ( = ?auto_450387 ?auto_450388 ) ) ( ON ?auto_450386 ?auto_450387 ) ( ON ?auto_450385 ?auto_450386 ) ( ON ?auto_450384 ?auto_450385 ) ( ON ?auto_450383 ?auto_450384 ) ( CLEAR ?auto_450381 ) ( ON ?auto_450382 ?auto_450383 ) ( CLEAR ?auto_450382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450379 ?auto_450380 ?auto_450381 ?auto_450382 )
      ( MAKE-9PILE ?auto_450379 ?auto_450380 ?auto_450381 ?auto_450382 ?auto_450383 ?auto_450384 ?auto_450385 ?auto_450386 ?auto_450387 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450398 - BLOCK
      ?auto_450399 - BLOCK
      ?auto_450400 - BLOCK
      ?auto_450401 - BLOCK
      ?auto_450402 - BLOCK
      ?auto_450403 - BLOCK
      ?auto_450404 - BLOCK
      ?auto_450405 - BLOCK
      ?auto_450406 - BLOCK
    )
    :vars
    (
      ?auto_450407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450406 ?auto_450407 ) ( ON-TABLE ?auto_450398 ) ( ON ?auto_450399 ?auto_450398 ) ( ON ?auto_450400 ?auto_450399 ) ( not ( = ?auto_450398 ?auto_450399 ) ) ( not ( = ?auto_450398 ?auto_450400 ) ) ( not ( = ?auto_450398 ?auto_450401 ) ) ( not ( = ?auto_450398 ?auto_450402 ) ) ( not ( = ?auto_450398 ?auto_450403 ) ) ( not ( = ?auto_450398 ?auto_450404 ) ) ( not ( = ?auto_450398 ?auto_450405 ) ) ( not ( = ?auto_450398 ?auto_450406 ) ) ( not ( = ?auto_450398 ?auto_450407 ) ) ( not ( = ?auto_450399 ?auto_450400 ) ) ( not ( = ?auto_450399 ?auto_450401 ) ) ( not ( = ?auto_450399 ?auto_450402 ) ) ( not ( = ?auto_450399 ?auto_450403 ) ) ( not ( = ?auto_450399 ?auto_450404 ) ) ( not ( = ?auto_450399 ?auto_450405 ) ) ( not ( = ?auto_450399 ?auto_450406 ) ) ( not ( = ?auto_450399 ?auto_450407 ) ) ( not ( = ?auto_450400 ?auto_450401 ) ) ( not ( = ?auto_450400 ?auto_450402 ) ) ( not ( = ?auto_450400 ?auto_450403 ) ) ( not ( = ?auto_450400 ?auto_450404 ) ) ( not ( = ?auto_450400 ?auto_450405 ) ) ( not ( = ?auto_450400 ?auto_450406 ) ) ( not ( = ?auto_450400 ?auto_450407 ) ) ( not ( = ?auto_450401 ?auto_450402 ) ) ( not ( = ?auto_450401 ?auto_450403 ) ) ( not ( = ?auto_450401 ?auto_450404 ) ) ( not ( = ?auto_450401 ?auto_450405 ) ) ( not ( = ?auto_450401 ?auto_450406 ) ) ( not ( = ?auto_450401 ?auto_450407 ) ) ( not ( = ?auto_450402 ?auto_450403 ) ) ( not ( = ?auto_450402 ?auto_450404 ) ) ( not ( = ?auto_450402 ?auto_450405 ) ) ( not ( = ?auto_450402 ?auto_450406 ) ) ( not ( = ?auto_450402 ?auto_450407 ) ) ( not ( = ?auto_450403 ?auto_450404 ) ) ( not ( = ?auto_450403 ?auto_450405 ) ) ( not ( = ?auto_450403 ?auto_450406 ) ) ( not ( = ?auto_450403 ?auto_450407 ) ) ( not ( = ?auto_450404 ?auto_450405 ) ) ( not ( = ?auto_450404 ?auto_450406 ) ) ( not ( = ?auto_450404 ?auto_450407 ) ) ( not ( = ?auto_450405 ?auto_450406 ) ) ( not ( = ?auto_450405 ?auto_450407 ) ) ( not ( = ?auto_450406 ?auto_450407 ) ) ( ON ?auto_450405 ?auto_450406 ) ( ON ?auto_450404 ?auto_450405 ) ( ON ?auto_450403 ?auto_450404 ) ( ON ?auto_450402 ?auto_450403 ) ( CLEAR ?auto_450400 ) ( ON ?auto_450401 ?auto_450402 ) ( CLEAR ?auto_450401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450398 ?auto_450399 ?auto_450400 ?auto_450401 )
      ( MAKE-9PILE ?auto_450398 ?auto_450399 ?auto_450400 ?auto_450401 ?auto_450402 ?auto_450403 ?auto_450404 ?auto_450405 ?auto_450406 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450417 - BLOCK
      ?auto_450418 - BLOCK
      ?auto_450419 - BLOCK
      ?auto_450420 - BLOCK
      ?auto_450421 - BLOCK
      ?auto_450422 - BLOCK
      ?auto_450423 - BLOCK
      ?auto_450424 - BLOCK
      ?auto_450425 - BLOCK
    )
    :vars
    (
      ?auto_450426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450425 ?auto_450426 ) ( ON-TABLE ?auto_450417 ) ( ON ?auto_450418 ?auto_450417 ) ( not ( = ?auto_450417 ?auto_450418 ) ) ( not ( = ?auto_450417 ?auto_450419 ) ) ( not ( = ?auto_450417 ?auto_450420 ) ) ( not ( = ?auto_450417 ?auto_450421 ) ) ( not ( = ?auto_450417 ?auto_450422 ) ) ( not ( = ?auto_450417 ?auto_450423 ) ) ( not ( = ?auto_450417 ?auto_450424 ) ) ( not ( = ?auto_450417 ?auto_450425 ) ) ( not ( = ?auto_450417 ?auto_450426 ) ) ( not ( = ?auto_450418 ?auto_450419 ) ) ( not ( = ?auto_450418 ?auto_450420 ) ) ( not ( = ?auto_450418 ?auto_450421 ) ) ( not ( = ?auto_450418 ?auto_450422 ) ) ( not ( = ?auto_450418 ?auto_450423 ) ) ( not ( = ?auto_450418 ?auto_450424 ) ) ( not ( = ?auto_450418 ?auto_450425 ) ) ( not ( = ?auto_450418 ?auto_450426 ) ) ( not ( = ?auto_450419 ?auto_450420 ) ) ( not ( = ?auto_450419 ?auto_450421 ) ) ( not ( = ?auto_450419 ?auto_450422 ) ) ( not ( = ?auto_450419 ?auto_450423 ) ) ( not ( = ?auto_450419 ?auto_450424 ) ) ( not ( = ?auto_450419 ?auto_450425 ) ) ( not ( = ?auto_450419 ?auto_450426 ) ) ( not ( = ?auto_450420 ?auto_450421 ) ) ( not ( = ?auto_450420 ?auto_450422 ) ) ( not ( = ?auto_450420 ?auto_450423 ) ) ( not ( = ?auto_450420 ?auto_450424 ) ) ( not ( = ?auto_450420 ?auto_450425 ) ) ( not ( = ?auto_450420 ?auto_450426 ) ) ( not ( = ?auto_450421 ?auto_450422 ) ) ( not ( = ?auto_450421 ?auto_450423 ) ) ( not ( = ?auto_450421 ?auto_450424 ) ) ( not ( = ?auto_450421 ?auto_450425 ) ) ( not ( = ?auto_450421 ?auto_450426 ) ) ( not ( = ?auto_450422 ?auto_450423 ) ) ( not ( = ?auto_450422 ?auto_450424 ) ) ( not ( = ?auto_450422 ?auto_450425 ) ) ( not ( = ?auto_450422 ?auto_450426 ) ) ( not ( = ?auto_450423 ?auto_450424 ) ) ( not ( = ?auto_450423 ?auto_450425 ) ) ( not ( = ?auto_450423 ?auto_450426 ) ) ( not ( = ?auto_450424 ?auto_450425 ) ) ( not ( = ?auto_450424 ?auto_450426 ) ) ( not ( = ?auto_450425 ?auto_450426 ) ) ( ON ?auto_450424 ?auto_450425 ) ( ON ?auto_450423 ?auto_450424 ) ( ON ?auto_450422 ?auto_450423 ) ( ON ?auto_450421 ?auto_450422 ) ( ON ?auto_450420 ?auto_450421 ) ( CLEAR ?auto_450418 ) ( ON ?auto_450419 ?auto_450420 ) ( CLEAR ?auto_450419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450417 ?auto_450418 ?auto_450419 )
      ( MAKE-9PILE ?auto_450417 ?auto_450418 ?auto_450419 ?auto_450420 ?auto_450421 ?auto_450422 ?auto_450423 ?auto_450424 ?auto_450425 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450436 - BLOCK
      ?auto_450437 - BLOCK
      ?auto_450438 - BLOCK
      ?auto_450439 - BLOCK
      ?auto_450440 - BLOCK
      ?auto_450441 - BLOCK
      ?auto_450442 - BLOCK
      ?auto_450443 - BLOCK
      ?auto_450444 - BLOCK
    )
    :vars
    (
      ?auto_450445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450444 ?auto_450445 ) ( ON-TABLE ?auto_450436 ) ( ON ?auto_450437 ?auto_450436 ) ( not ( = ?auto_450436 ?auto_450437 ) ) ( not ( = ?auto_450436 ?auto_450438 ) ) ( not ( = ?auto_450436 ?auto_450439 ) ) ( not ( = ?auto_450436 ?auto_450440 ) ) ( not ( = ?auto_450436 ?auto_450441 ) ) ( not ( = ?auto_450436 ?auto_450442 ) ) ( not ( = ?auto_450436 ?auto_450443 ) ) ( not ( = ?auto_450436 ?auto_450444 ) ) ( not ( = ?auto_450436 ?auto_450445 ) ) ( not ( = ?auto_450437 ?auto_450438 ) ) ( not ( = ?auto_450437 ?auto_450439 ) ) ( not ( = ?auto_450437 ?auto_450440 ) ) ( not ( = ?auto_450437 ?auto_450441 ) ) ( not ( = ?auto_450437 ?auto_450442 ) ) ( not ( = ?auto_450437 ?auto_450443 ) ) ( not ( = ?auto_450437 ?auto_450444 ) ) ( not ( = ?auto_450437 ?auto_450445 ) ) ( not ( = ?auto_450438 ?auto_450439 ) ) ( not ( = ?auto_450438 ?auto_450440 ) ) ( not ( = ?auto_450438 ?auto_450441 ) ) ( not ( = ?auto_450438 ?auto_450442 ) ) ( not ( = ?auto_450438 ?auto_450443 ) ) ( not ( = ?auto_450438 ?auto_450444 ) ) ( not ( = ?auto_450438 ?auto_450445 ) ) ( not ( = ?auto_450439 ?auto_450440 ) ) ( not ( = ?auto_450439 ?auto_450441 ) ) ( not ( = ?auto_450439 ?auto_450442 ) ) ( not ( = ?auto_450439 ?auto_450443 ) ) ( not ( = ?auto_450439 ?auto_450444 ) ) ( not ( = ?auto_450439 ?auto_450445 ) ) ( not ( = ?auto_450440 ?auto_450441 ) ) ( not ( = ?auto_450440 ?auto_450442 ) ) ( not ( = ?auto_450440 ?auto_450443 ) ) ( not ( = ?auto_450440 ?auto_450444 ) ) ( not ( = ?auto_450440 ?auto_450445 ) ) ( not ( = ?auto_450441 ?auto_450442 ) ) ( not ( = ?auto_450441 ?auto_450443 ) ) ( not ( = ?auto_450441 ?auto_450444 ) ) ( not ( = ?auto_450441 ?auto_450445 ) ) ( not ( = ?auto_450442 ?auto_450443 ) ) ( not ( = ?auto_450442 ?auto_450444 ) ) ( not ( = ?auto_450442 ?auto_450445 ) ) ( not ( = ?auto_450443 ?auto_450444 ) ) ( not ( = ?auto_450443 ?auto_450445 ) ) ( not ( = ?auto_450444 ?auto_450445 ) ) ( ON ?auto_450443 ?auto_450444 ) ( ON ?auto_450442 ?auto_450443 ) ( ON ?auto_450441 ?auto_450442 ) ( ON ?auto_450440 ?auto_450441 ) ( ON ?auto_450439 ?auto_450440 ) ( CLEAR ?auto_450437 ) ( ON ?auto_450438 ?auto_450439 ) ( CLEAR ?auto_450438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450436 ?auto_450437 ?auto_450438 )
      ( MAKE-9PILE ?auto_450436 ?auto_450437 ?auto_450438 ?auto_450439 ?auto_450440 ?auto_450441 ?auto_450442 ?auto_450443 ?auto_450444 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450455 - BLOCK
      ?auto_450456 - BLOCK
      ?auto_450457 - BLOCK
      ?auto_450458 - BLOCK
      ?auto_450459 - BLOCK
      ?auto_450460 - BLOCK
      ?auto_450461 - BLOCK
      ?auto_450462 - BLOCK
      ?auto_450463 - BLOCK
    )
    :vars
    (
      ?auto_450464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450463 ?auto_450464 ) ( ON-TABLE ?auto_450455 ) ( not ( = ?auto_450455 ?auto_450456 ) ) ( not ( = ?auto_450455 ?auto_450457 ) ) ( not ( = ?auto_450455 ?auto_450458 ) ) ( not ( = ?auto_450455 ?auto_450459 ) ) ( not ( = ?auto_450455 ?auto_450460 ) ) ( not ( = ?auto_450455 ?auto_450461 ) ) ( not ( = ?auto_450455 ?auto_450462 ) ) ( not ( = ?auto_450455 ?auto_450463 ) ) ( not ( = ?auto_450455 ?auto_450464 ) ) ( not ( = ?auto_450456 ?auto_450457 ) ) ( not ( = ?auto_450456 ?auto_450458 ) ) ( not ( = ?auto_450456 ?auto_450459 ) ) ( not ( = ?auto_450456 ?auto_450460 ) ) ( not ( = ?auto_450456 ?auto_450461 ) ) ( not ( = ?auto_450456 ?auto_450462 ) ) ( not ( = ?auto_450456 ?auto_450463 ) ) ( not ( = ?auto_450456 ?auto_450464 ) ) ( not ( = ?auto_450457 ?auto_450458 ) ) ( not ( = ?auto_450457 ?auto_450459 ) ) ( not ( = ?auto_450457 ?auto_450460 ) ) ( not ( = ?auto_450457 ?auto_450461 ) ) ( not ( = ?auto_450457 ?auto_450462 ) ) ( not ( = ?auto_450457 ?auto_450463 ) ) ( not ( = ?auto_450457 ?auto_450464 ) ) ( not ( = ?auto_450458 ?auto_450459 ) ) ( not ( = ?auto_450458 ?auto_450460 ) ) ( not ( = ?auto_450458 ?auto_450461 ) ) ( not ( = ?auto_450458 ?auto_450462 ) ) ( not ( = ?auto_450458 ?auto_450463 ) ) ( not ( = ?auto_450458 ?auto_450464 ) ) ( not ( = ?auto_450459 ?auto_450460 ) ) ( not ( = ?auto_450459 ?auto_450461 ) ) ( not ( = ?auto_450459 ?auto_450462 ) ) ( not ( = ?auto_450459 ?auto_450463 ) ) ( not ( = ?auto_450459 ?auto_450464 ) ) ( not ( = ?auto_450460 ?auto_450461 ) ) ( not ( = ?auto_450460 ?auto_450462 ) ) ( not ( = ?auto_450460 ?auto_450463 ) ) ( not ( = ?auto_450460 ?auto_450464 ) ) ( not ( = ?auto_450461 ?auto_450462 ) ) ( not ( = ?auto_450461 ?auto_450463 ) ) ( not ( = ?auto_450461 ?auto_450464 ) ) ( not ( = ?auto_450462 ?auto_450463 ) ) ( not ( = ?auto_450462 ?auto_450464 ) ) ( not ( = ?auto_450463 ?auto_450464 ) ) ( ON ?auto_450462 ?auto_450463 ) ( ON ?auto_450461 ?auto_450462 ) ( ON ?auto_450460 ?auto_450461 ) ( ON ?auto_450459 ?auto_450460 ) ( ON ?auto_450458 ?auto_450459 ) ( ON ?auto_450457 ?auto_450458 ) ( CLEAR ?auto_450455 ) ( ON ?auto_450456 ?auto_450457 ) ( CLEAR ?auto_450456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450455 ?auto_450456 )
      ( MAKE-9PILE ?auto_450455 ?auto_450456 ?auto_450457 ?auto_450458 ?auto_450459 ?auto_450460 ?auto_450461 ?auto_450462 ?auto_450463 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450474 - BLOCK
      ?auto_450475 - BLOCK
      ?auto_450476 - BLOCK
      ?auto_450477 - BLOCK
      ?auto_450478 - BLOCK
      ?auto_450479 - BLOCK
      ?auto_450480 - BLOCK
      ?auto_450481 - BLOCK
      ?auto_450482 - BLOCK
    )
    :vars
    (
      ?auto_450483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450482 ?auto_450483 ) ( ON-TABLE ?auto_450474 ) ( not ( = ?auto_450474 ?auto_450475 ) ) ( not ( = ?auto_450474 ?auto_450476 ) ) ( not ( = ?auto_450474 ?auto_450477 ) ) ( not ( = ?auto_450474 ?auto_450478 ) ) ( not ( = ?auto_450474 ?auto_450479 ) ) ( not ( = ?auto_450474 ?auto_450480 ) ) ( not ( = ?auto_450474 ?auto_450481 ) ) ( not ( = ?auto_450474 ?auto_450482 ) ) ( not ( = ?auto_450474 ?auto_450483 ) ) ( not ( = ?auto_450475 ?auto_450476 ) ) ( not ( = ?auto_450475 ?auto_450477 ) ) ( not ( = ?auto_450475 ?auto_450478 ) ) ( not ( = ?auto_450475 ?auto_450479 ) ) ( not ( = ?auto_450475 ?auto_450480 ) ) ( not ( = ?auto_450475 ?auto_450481 ) ) ( not ( = ?auto_450475 ?auto_450482 ) ) ( not ( = ?auto_450475 ?auto_450483 ) ) ( not ( = ?auto_450476 ?auto_450477 ) ) ( not ( = ?auto_450476 ?auto_450478 ) ) ( not ( = ?auto_450476 ?auto_450479 ) ) ( not ( = ?auto_450476 ?auto_450480 ) ) ( not ( = ?auto_450476 ?auto_450481 ) ) ( not ( = ?auto_450476 ?auto_450482 ) ) ( not ( = ?auto_450476 ?auto_450483 ) ) ( not ( = ?auto_450477 ?auto_450478 ) ) ( not ( = ?auto_450477 ?auto_450479 ) ) ( not ( = ?auto_450477 ?auto_450480 ) ) ( not ( = ?auto_450477 ?auto_450481 ) ) ( not ( = ?auto_450477 ?auto_450482 ) ) ( not ( = ?auto_450477 ?auto_450483 ) ) ( not ( = ?auto_450478 ?auto_450479 ) ) ( not ( = ?auto_450478 ?auto_450480 ) ) ( not ( = ?auto_450478 ?auto_450481 ) ) ( not ( = ?auto_450478 ?auto_450482 ) ) ( not ( = ?auto_450478 ?auto_450483 ) ) ( not ( = ?auto_450479 ?auto_450480 ) ) ( not ( = ?auto_450479 ?auto_450481 ) ) ( not ( = ?auto_450479 ?auto_450482 ) ) ( not ( = ?auto_450479 ?auto_450483 ) ) ( not ( = ?auto_450480 ?auto_450481 ) ) ( not ( = ?auto_450480 ?auto_450482 ) ) ( not ( = ?auto_450480 ?auto_450483 ) ) ( not ( = ?auto_450481 ?auto_450482 ) ) ( not ( = ?auto_450481 ?auto_450483 ) ) ( not ( = ?auto_450482 ?auto_450483 ) ) ( ON ?auto_450481 ?auto_450482 ) ( ON ?auto_450480 ?auto_450481 ) ( ON ?auto_450479 ?auto_450480 ) ( ON ?auto_450478 ?auto_450479 ) ( ON ?auto_450477 ?auto_450478 ) ( ON ?auto_450476 ?auto_450477 ) ( CLEAR ?auto_450474 ) ( ON ?auto_450475 ?auto_450476 ) ( CLEAR ?auto_450475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450474 ?auto_450475 )
      ( MAKE-9PILE ?auto_450474 ?auto_450475 ?auto_450476 ?auto_450477 ?auto_450478 ?auto_450479 ?auto_450480 ?auto_450481 ?auto_450482 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450493 - BLOCK
      ?auto_450494 - BLOCK
      ?auto_450495 - BLOCK
      ?auto_450496 - BLOCK
      ?auto_450497 - BLOCK
      ?auto_450498 - BLOCK
      ?auto_450499 - BLOCK
      ?auto_450500 - BLOCK
      ?auto_450501 - BLOCK
    )
    :vars
    (
      ?auto_450502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450501 ?auto_450502 ) ( not ( = ?auto_450493 ?auto_450494 ) ) ( not ( = ?auto_450493 ?auto_450495 ) ) ( not ( = ?auto_450493 ?auto_450496 ) ) ( not ( = ?auto_450493 ?auto_450497 ) ) ( not ( = ?auto_450493 ?auto_450498 ) ) ( not ( = ?auto_450493 ?auto_450499 ) ) ( not ( = ?auto_450493 ?auto_450500 ) ) ( not ( = ?auto_450493 ?auto_450501 ) ) ( not ( = ?auto_450493 ?auto_450502 ) ) ( not ( = ?auto_450494 ?auto_450495 ) ) ( not ( = ?auto_450494 ?auto_450496 ) ) ( not ( = ?auto_450494 ?auto_450497 ) ) ( not ( = ?auto_450494 ?auto_450498 ) ) ( not ( = ?auto_450494 ?auto_450499 ) ) ( not ( = ?auto_450494 ?auto_450500 ) ) ( not ( = ?auto_450494 ?auto_450501 ) ) ( not ( = ?auto_450494 ?auto_450502 ) ) ( not ( = ?auto_450495 ?auto_450496 ) ) ( not ( = ?auto_450495 ?auto_450497 ) ) ( not ( = ?auto_450495 ?auto_450498 ) ) ( not ( = ?auto_450495 ?auto_450499 ) ) ( not ( = ?auto_450495 ?auto_450500 ) ) ( not ( = ?auto_450495 ?auto_450501 ) ) ( not ( = ?auto_450495 ?auto_450502 ) ) ( not ( = ?auto_450496 ?auto_450497 ) ) ( not ( = ?auto_450496 ?auto_450498 ) ) ( not ( = ?auto_450496 ?auto_450499 ) ) ( not ( = ?auto_450496 ?auto_450500 ) ) ( not ( = ?auto_450496 ?auto_450501 ) ) ( not ( = ?auto_450496 ?auto_450502 ) ) ( not ( = ?auto_450497 ?auto_450498 ) ) ( not ( = ?auto_450497 ?auto_450499 ) ) ( not ( = ?auto_450497 ?auto_450500 ) ) ( not ( = ?auto_450497 ?auto_450501 ) ) ( not ( = ?auto_450497 ?auto_450502 ) ) ( not ( = ?auto_450498 ?auto_450499 ) ) ( not ( = ?auto_450498 ?auto_450500 ) ) ( not ( = ?auto_450498 ?auto_450501 ) ) ( not ( = ?auto_450498 ?auto_450502 ) ) ( not ( = ?auto_450499 ?auto_450500 ) ) ( not ( = ?auto_450499 ?auto_450501 ) ) ( not ( = ?auto_450499 ?auto_450502 ) ) ( not ( = ?auto_450500 ?auto_450501 ) ) ( not ( = ?auto_450500 ?auto_450502 ) ) ( not ( = ?auto_450501 ?auto_450502 ) ) ( ON ?auto_450500 ?auto_450501 ) ( ON ?auto_450499 ?auto_450500 ) ( ON ?auto_450498 ?auto_450499 ) ( ON ?auto_450497 ?auto_450498 ) ( ON ?auto_450496 ?auto_450497 ) ( ON ?auto_450495 ?auto_450496 ) ( ON ?auto_450494 ?auto_450495 ) ( ON ?auto_450493 ?auto_450494 ) ( CLEAR ?auto_450493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450493 )
      ( MAKE-9PILE ?auto_450493 ?auto_450494 ?auto_450495 ?auto_450496 ?auto_450497 ?auto_450498 ?auto_450499 ?auto_450500 ?auto_450501 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_450512 - BLOCK
      ?auto_450513 - BLOCK
      ?auto_450514 - BLOCK
      ?auto_450515 - BLOCK
      ?auto_450516 - BLOCK
      ?auto_450517 - BLOCK
      ?auto_450518 - BLOCK
      ?auto_450519 - BLOCK
      ?auto_450520 - BLOCK
    )
    :vars
    (
      ?auto_450521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450520 ?auto_450521 ) ( not ( = ?auto_450512 ?auto_450513 ) ) ( not ( = ?auto_450512 ?auto_450514 ) ) ( not ( = ?auto_450512 ?auto_450515 ) ) ( not ( = ?auto_450512 ?auto_450516 ) ) ( not ( = ?auto_450512 ?auto_450517 ) ) ( not ( = ?auto_450512 ?auto_450518 ) ) ( not ( = ?auto_450512 ?auto_450519 ) ) ( not ( = ?auto_450512 ?auto_450520 ) ) ( not ( = ?auto_450512 ?auto_450521 ) ) ( not ( = ?auto_450513 ?auto_450514 ) ) ( not ( = ?auto_450513 ?auto_450515 ) ) ( not ( = ?auto_450513 ?auto_450516 ) ) ( not ( = ?auto_450513 ?auto_450517 ) ) ( not ( = ?auto_450513 ?auto_450518 ) ) ( not ( = ?auto_450513 ?auto_450519 ) ) ( not ( = ?auto_450513 ?auto_450520 ) ) ( not ( = ?auto_450513 ?auto_450521 ) ) ( not ( = ?auto_450514 ?auto_450515 ) ) ( not ( = ?auto_450514 ?auto_450516 ) ) ( not ( = ?auto_450514 ?auto_450517 ) ) ( not ( = ?auto_450514 ?auto_450518 ) ) ( not ( = ?auto_450514 ?auto_450519 ) ) ( not ( = ?auto_450514 ?auto_450520 ) ) ( not ( = ?auto_450514 ?auto_450521 ) ) ( not ( = ?auto_450515 ?auto_450516 ) ) ( not ( = ?auto_450515 ?auto_450517 ) ) ( not ( = ?auto_450515 ?auto_450518 ) ) ( not ( = ?auto_450515 ?auto_450519 ) ) ( not ( = ?auto_450515 ?auto_450520 ) ) ( not ( = ?auto_450515 ?auto_450521 ) ) ( not ( = ?auto_450516 ?auto_450517 ) ) ( not ( = ?auto_450516 ?auto_450518 ) ) ( not ( = ?auto_450516 ?auto_450519 ) ) ( not ( = ?auto_450516 ?auto_450520 ) ) ( not ( = ?auto_450516 ?auto_450521 ) ) ( not ( = ?auto_450517 ?auto_450518 ) ) ( not ( = ?auto_450517 ?auto_450519 ) ) ( not ( = ?auto_450517 ?auto_450520 ) ) ( not ( = ?auto_450517 ?auto_450521 ) ) ( not ( = ?auto_450518 ?auto_450519 ) ) ( not ( = ?auto_450518 ?auto_450520 ) ) ( not ( = ?auto_450518 ?auto_450521 ) ) ( not ( = ?auto_450519 ?auto_450520 ) ) ( not ( = ?auto_450519 ?auto_450521 ) ) ( not ( = ?auto_450520 ?auto_450521 ) ) ( ON ?auto_450519 ?auto_450520 ) ( ON ?auto_450518 ?auto_450519 ) ( ON ?auto_450517 ?auto_450518 ) ( ON ?auto_450516 ?auto_450517 ) ( ON ?auto_450515 ?auto_450516 ) ( ON ?auto_450514 ?auto_450515 ) ( ON ?auto_450513 ?auto_450514 ) ( ON ?auto_450512 ?auto_450513 ) ( CLEAR ?auto_450512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450512 )
      ( MAKE-9PILE ?auto_450512 ?auto_450513 ?auto_450514 ?auto_450515 ?auto_450516 ?auto_450517 ?auto_450518 ?auto_450519 ?auto_450520 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450532 - BLOCK
      ?auto_450533 - BLOCK
      ?auto_450534 - BLOCK
      ?auto_450535 - BLOCK
      ?auto_450536 - BLOCK
      ?auto_450537 - BLOCK
      ?auto_450538 - BLOCK
      ?auto_450539 - BLOCK
      ?auto_450540 - BLOCK
      ?auto_450541 - BLOCK
    )
    :vars
    (
      ?auto_450542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450540 ) ( ON ?auto_450541 ?auto_450542 ) ( CLEAR ?auto_450541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450532 ) ( ON ?auto_450533 ?auto_450532 ) ( ON ?auto_450534 ?auto_450533 ) ( ON ?auto_450535 ?auto_450534 ) ( ON ?auto_450536 ?auto_450535 ) ( ON ?auto_450537 ?auto_450536 ) ( ON ?auto_450538 ?auto_450537 ) ( ON ?auto_450539 ?auto_450538 ) ( ON ?auto_450540 ?auto_450539 ) ( not ( = ?auto_450532 ?auto_450533 ) ) ( not ( = ?auto_450532 ?auto_450534 ) ) ( not ( = ?auto_450532 ?auto_450535 ) ) ( not ( = ?auto_450532 ?auto_450536 ) ) ( not ( = ?auto_450532 ?auto_450537 ) ) ( not ( = ?auto_450532 ?auto_450538 ) ) ( not ( = ?auto_450532 ?auto_450539 ) ) ( not ( = ?auto_450532 ?auto_450540 ) ) ( not ( = ?auto_450532 ?auto_450541 ) ) ( not ( = ?auto_450532 ?auto_450542 ) ) ( not ( = ?auto_450533 ?auto_450534 ) ) ( not ( = ?auto_450533 ?auto_450535 ) ) ( not ( = ?auto_450533 ?auto_450536 ) ) ( not ( = ?auto_450533 ?auto_450537 ) ) ( not ( = ?auto_450533 ?auto_450538 ) ) ( not ( = ?auto_450533 ?auto_450539 ) ) ( not ( = ?auto_450533 ?auto_450540 ) ) ( not ( = ?auto_450533 ?auto_450541 ) ) ( not ( = ?auto_450533 ?auto_450542 ) ) ( not ( = ?auto_450534 ?auto_450535 ) ) ( not ( = ?auto_450534 ?auto_450536 ) ) ( not ( = ?auto_450534 ?auto_450537 ) ) ( not ( = ?auto_450534 ?auto_450538 ) ) ( not ( = ?auto_450534 ?auto_450539 ) ) ( not ( = ?auto_450534 ?auto_450540 ) ) ( not ( = ?auto_450534 ?auto_450541 ) ) ( not ( = ?auto_450534 ?auto_450542 ) ) ( not ( = ?auto_450535 ?auto_450536 ) ) ( not ( = ?auto_450535 ?auto_450537 ) ) ( not ( = ?auto_450535 ?auto_450538 ) ) ( not ( = ?auto_450535 ?auto_450539 ) ) ( not ( = ?auto_450535 ?auto_450540 ) ) ( not ( = ?auto_450535 ?auto_450541 ) ) ( not ( = ?auto_450535 ?auto_450542 ) ) ( not ( = ?auto_450536 ?auto_450537 ) ) ( not ( = ?auto_450536 ?auto_450538 ) ) ( not ( = ?auto_450536 ?auto_450539 ) ) ( not ( = ?auto_450536 ?auto_450540 ) ) ( not ( = ?auto_450536 ?auto_450541 ) ) ( not ( = ?auto_450536 ?auto_450542 ) ) ( not ( = ?auto_450537 ?auto_450538 ) ) ( not ( = ?auto_450537 ?auto_450539 ) ) ( not ( = ?auto_450537 ?auto_450540 ) ) ( not ( = ?auto_450537 ?auto_450541 ) ) ( not ( = ?auto_450537 ?auto_450542 ) ) ( not ( = ?auto_450538 ?auto_450539 ) ) ( not ( = ?auto_450538 ?auto_450540 ) ) ( not ( = ?auto_450538 ?auto_450541 ) ) ( not ( = ?auto_450538 ?auto_450542 ) ) ( not ( = ?auto_450539 ?auto_450540 ) ) ( not ( = ?auto_450539 ?auto_450541 ) ) ( not ( = ?auto_450539 ?auto_450542 ) ) ( not ( = ?auto_450540 ?auto_450541 ) ) ( not ( = ?auto_450540 ?auto_450542 ) ) ( not ( = ?auto_450541 ?auto_450542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450541 ?auto_450542 )
      ( !STACK ?auto_450541 ?auto_450540 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450553 - BLOCK
      ?auto_450554 - BLOCK
      ?auto_450555 - BLOCK
      ?auto_450556 - BLOCK
      ?auto_450557 - BLOCK
      ?auto_450558 - BLOCK
      ?auto_450559 - BLOCK
      ?auto_450560 - BLOCK
      ?auto_450561 - BLOCK
      ?auto_450562 - BLOCK
    )
    :vars
    (
      ?auto_450563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450561 ) ( ON ?auto_450562 ?auto_450563 ) ( CLEAR ?auto_450562 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450553 ) ( ON ?auto_450554 ?auto_450553 ) ( ON ?auto_450555 ?auto_450554 ) ( ON ?auto_450556 ?auto_450555 ) ( ON ?auto_450557 ?auto_450556 ) ( ON ?auto_450558 ?auto_450557 ) ( ON ?auto_450559 ?auto_450558 ) ( ON ?auto_450560 ?auto_450559 ) ( ON ?auto_450561 ?auto_450560 ) ( not ( = ?auto_450553 ?auto_450554 ) ) ( not ( = ?auto_450553 ?auto_450555 ) ) ( not ( = ?auto_450553 ?auto_450556 ) ) ( not ( = ?auto_450553 ?auto_450557 ) ) ( not ( = ?auto_450553 ?auto_450558 ) ) ( not ( = ?auto_450553 ?auto_450559 ) ) ( not ( = ?auto_450553 ?auto_450560 ) ) ( not ( = ?auto_450553 ?auto_450561 ) ) ( not ( = ?auto_450553 ?auto_450562 ) ) ( not ( = ?auto_450553 ?auto_450563 ) ) ( not ( = ?auto_450554 ?auto_450555 ) ) ( not ( = ?auto_450554 ?auto_450556 ) ) ( not ( = ?auto_450554 ?auto_450557 ) ) ( not ( = ?auto_450554 ?auto_450558 ) ) ( not ( = ?auto_450554 ?auto_450559 ) ) ( not ( = ?auto_450554 ?auto_450560 ) ) ( not ( = ?auto_450554 ?auto_450561 ) ) ( not ( = ?auto_450554 ?auto_450562 ) ) ( not ( = ?auto_450554 ?auto_450563 ) ) ( not ( = ?auto_450555 ?auto_450556 ) ) ( not ( = ?auto_450555 ?auto_450557 ) ) ( not ( = ?auto_450555 ?auto_450558 ) ) ( not ( = ?auto_450555 ?auto_450559 ) ) ( not ( = ?auto_450555 ?auto_450560 ) ) ( not ( = ?auto_450555 ?auto_450561 ) ) ( not ( = ?auto_450555 ?auto_450562 ) ) ( not ( = ?auto_450555 ?auto_450563 ) ) ( not ( = ?auto_450556 ?auto_450557 ) ) ( not ( = ?auto_450556 ?auto_450558 ) ) ( not ( = ?auto_450556 ?auto_450559 ) ) ( not ( = ?auto_450556 ?auto_450560 ) ) ( not ( = ?auto_450556 ?auto_450561 ) ) ( not ( = ?auto_450556 ?auto_450562 ) ) ( not ( = ?auto_450556 ?auto_450563 ) ) ( not ( = ?auto_450557 ?auto_450558 ) ) ( not ( = ?auto_450557 ?auto_450559 ) ) ( not ( = ?auto_450557 ?auto_450560 ) ) ( not ( = ?auto_450557 ?auto_450561 ) ) ( not ( = ?auto_450557 ?auto_450562 ) ) ( not ( = ?auto_450557 ?auto_450563 ) ) ( not ( = ?auto_450558 ?auto_450559 ) ) ( not ( = ?auto_450558 ?auto_450560 ) ) ( not ( = ?auto_450558 ?auto_450561 ) ) ( not ( = ?auto_450558 ?auto_450562 ) ) ( not ( = ?auto_450558 ?auto_450563 ) ) ( not ( = ?auto_450559 ?auto_450560 ) ) ( not ( = ?auto_450559 ?auto_450561 ) ) ( not ( = ?auto_450559 ?auto_450562 ) ) ( not ( = ?auto_450559 ?auto_450563 ) ) ( not ( = ?auto_450560 ?auto_450561 ) ) ( not ( = ?auto_450560 ?auto_450562 ) ) ( not ( = ?auto_450560 ?auto_450563 ) ) ( not ( = ?auto_450561 ?auto_450562 ) ) ( not ( = ?auto_450561 ?auto_450563 ) ) ( not ( = ?auto_450562 ?auto_450563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450562 ?auto_450563 )
      ( !STACK ?auto_450562 ?auto_450561 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450574 - BLOCK
      ?auto_450575 - BLOCK
      ?auto_450576 - BLOCK
      ?auto_450577 - BLOCK
      ?auto_450578 - BLOCK
      ?auto_450579 - BLOCK
      ?auto_450580 - BLOCK
      ?auto_450581 - BLOCK
      ?auto_450582 - BLOCK
      ?auto_450583 - BLOCK
    )
    :vars
    (
      ?auto_450584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450583 ?auto_450584 ) ( ON-TABLE ?auto_450574 ) ( ON ?auto_450575 ?auto_450574 ) ( ON ?auto_450576 ?auto_450575 ) ( ON ?auto_450577 ?auto_450576 ) ( ON ?auto_450578 ?auto_450577 ) ( ON ?auto_450579 ?auto_450578 ) ( ON ?auto_450580 ?auto_450579 ) ( ON ?auto_450581 ?auto_450580 ) ( not ( = ?auto_450574 ?auto_450575 ) ) ( not ( = ?auto_450574 ?auto_450576 ) ) ( not ( = ?auto_450574 ?auto_450577 ) ) ( not ( = ?auto_450574 ?auto_450578 ) ) ( not ( = ?auto_450574 ?auto_450579 ) ) ( not ( = ?auto_450574 ?auto_450580 ) ) ( not ( = ?auto_450574 ?auto_450581 ) ) ( not ( = ?auto_450574 ?auto_450582 ) ) ( not ( = ?auto_450574 ?auto_450583 ) ) ( not ( = ?auto_450574 ?auto_450584 ) ) ( not ( = ?auto_450575 ?auto_450576 ) ) ( not ( = ?auto_450575 ?auto_450577 ) ) ( not ( = ?auto_450575 ?auto_450578 ) ) ( not ( = ?auto_450575 ?auto_450579 ) ) ( not ( = ?auto_450575 ?auto_450580 ) ) ( not ( = ?auto_450575 ?auto_450581 ) ) ( not ( = ?auto_450575 ?auto_450582 ) ) ( not ( = ?auto_450575 ?auto_450583 ) ) ( not ( = ?auto_450575 ?auto_450584 ) ) ( not ( = ?auto_450576 ?auto_450577 ) ) ( not ( = ?auto_450576 ?auto_450578 ) ) ( not ( = ?auto_450576 ?auto_450579 ) ) ( not ( = ?auto_450576 ?auto_450580 ) ) ( not ( = ?auto_450576 ?auto_450581 ) ) ( not ( = ?auto_450576 ?auto_450582 ) ) ( not ( = ?auto_450576 ?auto_450583 ) ) ( not ( = ?auto_450576 ?auto_450584 ) ) ( not ( = ?auto_450577 ?auto_450578 ) ) ( not ( = ?auto_450577 ?auto_450579 ) ) ( not ( = ?auto_450577 ?auto_450580 ) ) ( not ( = ?auto_450577 ?auto_450581 ) ) ( not ( = ?auto_450577 ?auto_450582 ) ) ( not ( = ?auto_450577 ?auto_450583 ) ) ( not ( = ?auto_450577 ?auto_450584 ) ) ( not ( = ?auto_450578 ?auto_450579 ) ) ( not ( = ?auto_450578 ?auto_450580 ) ) ( not ( = ?auto_450578 ?auto_450581 ) ) ( not ( = ?auto_450578 ?auto_450582 ) ) ( not ( = ?auto_450578 ?auto_450583 ) ) ( not ( = ?auto_450578 ?auto_450584 ) ) ( not ( = ?auto_450579 ?auto_450580 ) ) ( not ( = ?auto_450579 ?auto_450581 ) ) ( not ( = ?auto_450579 ?auto_450582 ) ) ( not ( = ?auto_450579 ?auto_450583 ) ) ( not ( = ?auto_450579 ?auto_450584 ) ) ( not ( = ?auto_450580 ?auto_450581 ) ) ( not ( = ?auto_450580 ?auto_450582 ) ) ( not ( = ?auto_450580 ?auto_450583 ) ) ( not ( = ?auto_450580 ?auto_450584 ) ) ( not ( = ?auto_450581 ?auto_450582 ) ) ( not ( = ?auto_450581 ?auto_450583 ) ) ( not ( = ?auto_450581 ?auto_450584 ) ) ( not ( = ?auto_450582 ?auto_450583 ) ) ( not ( = ?auto_450582 ?auto_450584 ) ) ( not ( = ?auto_450583 ?auto_450584 ) ) ( CLEAR ?auto_450581 ) ( ON ?auto_450582 ?auto_450583 ) ( CLEAR ?auto_450582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_450574 ?auto_450575 ?auto_450576 ?auto_450577 ?auto_450578 ?auto_450579 ?auto_450580 ?auto_450581 ?auto_450582 )
      ( MAKE-10PILE ?auto_450574 ?auto_450575 ?auto_450576 ?auto_450577 ?auto_450578 ?auto_450579 ?auto_450580 ?auto_450581 ?auto_450582 ?auto_450583 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450595 - BLOCK
      ?auto_450596 - BLOCK
      ?auto_450597 - BLOCK
      ?auto_450598 - BLOCK
      ?auto_450599 - BLOCK
      ?auto_450600 - BLOCK
      ?auto_450601 - BLOCK
      ?auto_450602 - BLOCK
      ?auto_450603 - BLOCK
      ?auto_450604 - BLOCK
    )
    :vars
    (
      ?auto_450605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450604 ?auto_450605 ) ( ON-TABLE ?auto_450595 ) ( ON ?auto_450596 ?auto_450595 ) ( ON ?auto_450597 ?auto_450596 ) ( ON ?auto_450598 ?auto_450597 ) ( ON ?auto_450599 ?auto_450598 ) ( ON ?auto_450600 ?auto_450599 ) ( ON ?auto_450601 ?auto_450600 ) ( ON ?auto_450602 ?auto_450601 ) ( not ( = ?auto_450595 ?auto_450596 ) ) ( not ( = ?auto_450595 ?auto_450597 ) ) ( not ( = ?auto_450595 ?auto_450598 ) ) ( not ( = ?auto_450595 ?auto_450599 ) ) ( not ( = ?auto_450595 ?auto_450600 ) ) ( not ( = ?auto_450595 ?auto_450601 ) ) ( not ( = ?auto_450595 ?auto_450602 ) ) ( not ( = ?auto_450595 ?auto_450603 ) ) ( not ( = ?auto_450595 ?auto_450604 ) ) ( not ( = ?auto_450595 ?auto_450605 ) ) ( not ( = ?auto_450596 ?auto_450597 ) ) ( not ( = ?auto_450596 ?auto_450598 ) ) ( not ( = ?auto_450596 ?auto_450599 ) ) ( not ( = ?auto_450596 ?auto_450600 ) ) ( not ( = ?auto_450596 ?auto_450601 ) ) ( not ( = ?auto_450596 ?auto_450602 ) ) ( not ( = ?auto_450596 ?auto_450603 ) ) ( not ( = ?auto_450596 ?auto_450604 ) ) ( not ( = ?auto_450596 ?auto_450605 ) ) ( not ( = ?auto_450597 ?auto_450598 ) ) ( not ( = ?auto_450597 ?auto_450599 ) ) ( not ( = ?auto_450597 ?auto_450600 ) ) ( not ( = ?auto_450597 ?auto_450601 ) ) ( not ( = ?auto_450597 ?auto_450602 ) ) ( not ( = ?auto_450597 ?auto_450603 ) ) ( not ( = ?auto_450597 ?auto_450604 ) ) ( not ( = ?auto_450597 ?auto_450605 ) ) ( not ( = ?auto_450598 ?auto_450599 ) ) ( not ( = ?auto_450598 ?auto_450600 ) ) ( not ( = ?auto_450598 ?auto_450601 ) ) ( not ( = ?auto_450598 ?auto_450602 ) ) ( not ( = ?auto_450598 ?auto_450603 ) ) ( not ( = ?auto_450598 ?auto_450604 ) ) ( not ( = ?auto_450598 ?auto_450605 ) ) ( not ( = ?auto_450599 ?auto_450600 ) ) ( not ( = ?auto_450599 ?auto_450601 ) ) ( not ( = ?auto_450599 ?auto_450602 ) ) ( not ( = ?auto_450599 ?auto_450603 ) ) ( not ( = ?auto_450599 ?auto_450604 ) ) ( not ( = ?auto_450599 ?auto_450605 ) ) ( not ( = ?auto_450600 ?auto_450601 ) ) ( not ( = ?auto_450600 ?auto_450602 ) ) ( not ( = ?auto_450600 ?auto_450603 ) ) ( not ( = ?auto_450600 ?auto_450604 ) ) ( not ( = ?auto_450600 ?auto_450605 ) ) ( not ( = ?auto_450601 ?auto_450602 ) ) ( not ( = ?auto_450601 ?auto_450603 ) ) ( not ( = ?auto_450601 ?auto_450604 ) ) ( not ( = ?auto_450601 ?auto_450605 ) ) ( not ( = ?auto_450602 ?auto_450603 ) ) ( not ( = ?auto_450602 ?auto_450604 ) ) ( not ( = ?auto_450602 ?auto_450605 ) ) ( not ( = ?auto_450603 ?auto_450604 ) ) ( not ( = ?auto_450603 ?auto_450605 ) ) ( not ( = ?auto_450604 ?auto_450605 ) ) ( CLEAR ?auto_450602 ) ( ON ?auto_450603 ?auto_450604 ) ( CLEAR ?auto_450603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_450595 ?auto_450596 ?auto_450597 ?auto_450598 ?auto_450599 ?auto_450600 ?auto_450601 ?auto_450602 ?auto_450603 )
      ( MAKE-10PILE ?auto_450595 ?auto_450596 ?auto_450597 ?auto_450598 ?auto_450599 ?auto_450600 ?auto_450601 ?auto_450602 ?auto_450603 ?auto_450604 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450616 - BLOCK
      ?auto_450617 - BLOCK
      ?auto_450618 - BLOCK
      ?auto_450619 - BLOCK
      ?auto_450620 - BLOCK
      ?auto_450621 - BLOCK
      ?auto_450622 - BLOCK
      ?auto_450623 - BLOCK
      ?auto_450624 - BLOCK
      ?auto_450625 - BLOCK
    )
    :vars
    (
      ?auto_450626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450625 ?auto_450626 ) ( ON-TABLE ?auto_450616 ) ( ON ?auto_450617 ?auto_450616 ) ( ON ?auto_450618 ?auto_450617 ) ( ON ?auto_450619 ?auto_450618 ) ( ON ?auto_450620 ?auto_450619 ) ( ON ?auto_450621 ?auto_450620 ) ( ON ?auto_450622 ?auto_450621 ) ( not ( = ?auto_450616 ?auto_450617 ) ) ( not ( = ?auto_450616 ?auto_450618 ) ) ( not ( = ?auto_450616 ?auto_450619 ) ) ( not ( = ?auto_450616 ?auto_450620 ) ) ( not ( = ?auto_450616 ?auto_450621 ) ) ( not ( = ?auto_450616 ?auto_450622 ) ) ( not ( = ?auto_450616 ?auto_450623 ) ) ( not ( = ?auto_450616 ?auto_450624 ) ) ( not ( = ?auto_450616 ?auto_450625 ) ) ( not ( = ?auto_450616 ?auto_450626 ) ) ( not ( = ?auto_450617 ?auto_450618 ) ) ( not ( = ?auto_450617 ?auto_450619 ) ) ( not ( = ?auto_450617 ?auto_450620 ) ) ( not ( = ?auto_450617 ?auto_450621 ) ) ( not ( = ?auto_450617 ?auto_450622 ) ) ( not ( = ?auto_450617 ?auto_450623 ) ) ( not ( = ?auto_450617 ?auto_450624 ) ) ( not ( = ?auto_450617 ?auto_450625 ) ) ( not ( = ?auto_450617 ?auto_450626 ) ) ( not ( = ?auto_450618 ?auto_450619 ) ) ( not ( = ?auto_450618 ?auto_450620 ) ) ( not ( = ?auto_450618 ?auto_450621 ) ) ( not ( = ?auto_450618 ?auto_450622 ) ) ( not ( = ?auto_450618 ?auto_450623 ) ) ( not ( = ?auto_450618 ?auto_450624 ) ) ( not ( = ?auto_450618 ?auto_450625 ) ) ( not ( = ?auto_450618 ?auto_450626 ) ) ( not ( = ?auto_450619 ?auto_450620 ) ) ( not ( = ?auto_450619 ?auto_450621 ) ) ( not ( = ?auto_450619 ?auto_450622 ) ) ( not ( = ?auto_450619 ?auto_450623 ) ) ( not ( = ?auto_450619 ?auto_450624 ) ) ( not ( = ?auto_450619 ?auto_450625 ) ) ( not ( = ?auto_450619 ?auto_450626 ) ) ( not ( = ?auto_450620 ?auto_450621 ) ) ( not ( = ?auto_450620 ?auto_450622 ) ) ( not ( = ?auto_450620 ?auto_450623 ) ) ( not ( = ?auto_450620 ?auto_450624 ) ) ( not ( = ?auto_450620 ?auto_450625 ) ) ( not ( = ?auto_450620 ?auto_450626 ) ) ( not ( = ?auto_450621 ?auto_450622 ) ) ( not ( = ?auto_450621 ?auto_450623 ) ) ( not ( = ?auto_450621 ?auto_450624 ) ) ( not ( = ?auto_450621 ?auto_450625 ) ) ( not ( = ?auto_450621 ?auto_450626 ) ) ( not ( = ?auto_450622 ?auto_450623 ) ) ( not ( = ?auto_450622 ?auto_450624 ) ) ( not ( = ?auto_450622 ?auto_450625 ) ) ( not ( = ?auto_450622 ?auto_450626 ) ) ( not ( = ?auto_450623 ?auto_450624 ) ) ( not ( = ?auto_450623 ?auto_450625 ) ) ( not ( = ?auto_450623 ?auto_450626 ) ) ( not ( = ?auto_450624 ?auto_450625 ) ) ( not ( = ?auto_450624 ?auto_450626 ) ) ( not ( = ?auto_450625 ?auto_450626 ) ) ( ON ?auto_450624 ?auto_450625 ) ( CLEAR ?auto_450622 ) ( ON ?auto_450623 ?auto_450624 ) ( CLEAR ?auto_450623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_450616 ?auto_450617 ?auto_450618 ?auto_450619 ?auto_450620 ?auto_450621 ?auto_450622 ?auto_450623 )
      ( MAKE-10PILE ?auto_450616 ?auto_450617 ?auto_450618 ?auto_450619 ?auto_450620 ?auto_450621 ?auto_450622 ?auto_450623 ?auto_450624 ?auto_450625 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450637 - BLOCK
      ?auto_450638 - BLOCK
      ?auto_450639 - BLOCK
      ?auto_450640 - BLOCK
      ?auto_450641 - BLOCK
      ?auto_450642 - BLOCK
      ?auto_450643 - BLOCK
      ?auto_450644 - BLOCK
      ?auto_450645 - BLOCK
      ?auto_450646 - BLOCK
    )
    :vars
    (
      ?auto_450647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450646 ?auto_450647 ) ( ON-TABLE ?auto_450637 ) ( ON ?auto_450638 ?auto_450637 ) ( ON ?auto_450639 ?auto_450638 ) ( ON ?auto_450640 ?auto_450639 ) ( ON ?auto_450641 ?auto_450640 ) ( ON ?auto_450642 ?auto_450641 ) ( ON ?auto_450643 ?auto_450642 ) ( not ( = ?auto_450637 ?auto_450638 ) ) ( not ( = ?auto_450637 ?auto_450639 ) ) ( not ( = ?auto_450637 ?auto_450640 ) ) ( not ( = ?auto_450637 ?auto_450641 ) ) ( not ( = ?auto_450637 ?auto_450642 ) ) ( not ( = ?auto_450637 ?auto_450643 ) ) ( not ( = ?auto_450637 ?auto_450644 ) ) ( not ( = ?auto_450637 ?auto_450645 ) ) ( not ( = ?auto_450637 ?auto_450646 ) ) ( not ( = ?auto_450637 ?auto_450647 ) ) ( not ( = ?auto_450638 ?auto_450639 ) ) ( not ( = ?auto_450638 ?auto_450640 ) ) ( not ( = ?auto_450638 ?auto_450641 ) ) ( not ( = ?auto_450638 ?auto_450642 ) ) ( not ( = ?auto_450638 ?auto_450643 ) ) ( not ( = ?auto_450638 ?auto_450644 ) ) ( not ( = ?auto_450638 ?auto_450645 ) ) ( not ( = ?auto_450638 ?auto_450646 ) ) ( not ( = ?auto_450638 ?auto_450647 ) ) ( not ( = ?auto_450639 ?auto_450640 ) ) ( not ( = ?auto_450639 ?auto_450641 ) ) ( not ( = ?auto_450639 ?auto_450642 ) ) ( not ( = ?auto_450639 ?auto_450643 ) ) ( not ( = ?auto_450639 ?auto_450644 ) ) ( not ( = ?auto_450639 ?auto_450645 ) ) ( not ( = ?auto_450639 ?auto_450646 ) ) ( not ( = ?auto_450639 ?auto_450647 ) ) ( not ( = ?auto_450640 ?auto_450641 ) ) ( not ( = ?auto_450640 ?auto_450642 ) ) ( not ( = ?auto_450640 ?auto_450643 ) ) ( not ( = ?auto_450640 ?auto_450644 ) ) ( not ( = ?auto_450640 ?auto_450645 ) ) ( not ( = ?auto_450640 ?auto_450646 ) ) ( not ( = ?auto_450640 ?auto_450647 ) ) ( not ( = ?auto_450641 ?auto_450642 ) ) ( not ( = ?auto_450641 ?auto_450643 ) ) ( not ( = ?auto_450641 ?auto_450644 ) ) ( not ( = ?auto_450641 ?auto_450645 ) ) ( not ( = ?auto_450641 ?auto_450646 ) ) ( not ( = ?auto_450641 ?auto_450647 ) ) ( not ( = ?auto_450642 ?auto_450643 ) ) ( not ( = ?auto_450642 ?auto_450644 ) ) ( not ( = ?auto_450642 ?auto_450645 ) ) ( not ( = ?auto_450642 ?auto_450646 ) ) ( not ( = ?auto_450642 ?auto_450647 ) ) ( not ( = ?auto_450643 ?auto_450644 ) ) ( not ( = ?auto_450643 ?auto_450645 ) ) ( not ( = ?auto_450643 ?auto_450646 ) ) ( not ( = ?auto_450643 ?auto_450647 ) ) ( not ( = ?auto_450644 ?auto_450645 ) ) ( not ( = ?auto_450644 ?auto_450646 ) ) ( not ( = ?auto_450644 ?auto_450647 ) ) ( not ( = ?auto_450645 ?auto_450646 ) ) ( not ( = ?auto_450645 ?auto_450647 ) ) ( not ( = ?auto_450646 ?auto_450647 ) ) ( ON ?auto_450645 ?auto_450646 ) ( CLEAR ?auto_450643 ) ( ON ?auto_450644 ?auto_450645 ) ( CLEAR ?auto_450644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_450637 ?auto_450638 ?auto_450639 ?auto_450640 ?auto_450641 ?auto_450642 ?auto_450643 ?auto_450644 )
      ( MAKE-10PILE ?auto_450637 ?auto_450638 ?auto_450639 ?auto_450640 ?auto_450641 ?auto_450642 ?auto_450643 ?auto_450644 ?auto_450645 ?auto_450646 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450658 - BLOCK
      ?auto_450659 - BLOCK
      ?auto_450660 - BLOCK
      ?auto_450661 - BLOCK
      ?auto_450662 - BLOCK
      ?auto_450663 - BLOCK
      ?auto_450664 - BLOCK
      ?auto_450665 - BLOCK
      ?auto_450666 - BLOCK
      ?auto_450667 - BLOCK
    )
    :vars
    (
      ?auto_450668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450667 ?auto_450668 ) ( ON-TABLE ?auto_450658 ) ( ON ?auto_450659 ?auto_450658 ) ( ON ?auto_450660 ?auto_450659 ) ( ON ?auto_450661 ?auto_450660 ) ( ON ?auto_450662 ?auto_450661 ) ( ON ?auto_450663 ?auto_450662 ) ( not ( = ?auto_450658 ?auto_450659 ) ) ( not ( = ?auto_450658 ?auto_450660 ) ) ( not ( = ?auto_450658 ?auto_450661 ) ) ( not ( = ?auto_450658 ?auto_450662 ) ) ( not ( = ?auto_450658 ?auto_450663 ) ) ( not ( = ?auto_450658 ?auto_450664 ) ) ( not ( = ?auto_450658 ?auto_450665 ) ) ( not ( = ?auto_450658 ?auto_450666 ) ) ( not ( = ?auto_450658 ?auto_450667 ) ) ( not ( = ?auto_450658 ?auto_450668 ) ) ( not ( = ?auto_450659 ?auto_450660 ) ) ( not ( = ?auto_450659 ?auto_450661 ) ) ( not ( = ?auto_450659 ?auto_450662 ) ) ( not ( = ?auto_450659 ?auto_450663 ) ) ( not ( = ?auto_450659 ?auto_450664 ) ) ( not ( = ?auto_450659 ?auto_450665 ) ) ( not ( = ?auto_450659 ?auto_450666 ) ) ( not ( = ?auto_450659 ?auto_450667 ) ) ( not ( = ?auto_450659 ?auto_450668 ) ) ( not ( = ?auto_450660 ?auto_450661 ) ) ( not ( = ?auto_450660 ?auto_450662 ) ) ( not ( = ?auto_450660 ?auto_450663 ) ) ( not ( = ?auto_450660 ?auto_450664 ) ) ( not ( = ?auto_450660 ?auto_450665 ) ) ( not ( = ?auto_450660 ?auto_450666 ) ) ( not ( = ?auto_450660 ?auto_450667 ) ) ( not ( = ?auto_450660 ?auto_450668 ) ) ( not ( = ?auto_450661 ?auto_450662 ) ) ( not ( = ?auto_450661 ?auto_450663 ) ) ( not ( = ?auto_450661 ?auto_450664 ) ) ( not ( = ?auto_450661 ?auto_450665 ) ) ( not ( = ?auto_450661 ?auto_450666 ) ) ( not ( = ?auto_450661 ?auto_450667 ) ) ( not ( = ?auto_450661 ?auto_450668 ) ) ( not ( = ?auto_450662 ?auto_450663 ) ) ( not ( = ?auto_450662 ?auto_450664 ) ) ( not ( = ?auto_450662 ?auto_450665 ) ) ( not ( = ?auto_450662 ?auto_450666 ) ) ( not ( = ?auto_450662 ?auto_450667 ) ) ( not ( = ?auto_450662 ?auto_450668 ) ) ( not ( = ?auto_450663 ?auto_450664 ) ) ( not ( = ?auto_450663 ?auto_450665 ) ) ( not ( = ?auto_450663 ?auto_450666 ) ) ( not ( = ?auto_450663 ?auto_450667 ) ) ( not ( = ?auto_450663 ?auto_450668 ) ) ( not ( = ?auto_450664 ?auto_450665 ) ) ( not ( = ?auto_450664 ?auto_450666 ) ) ( not ( = ?auto_450664 ?auto_450667 ) ) ( not ( = ?auto_450664 ?auto_450668 ) ) ( not ( = ?auto_450665 ?auto_450666 ) ) ( not ( = ?auto_450665 ?auto_450667 ) ) ( not ( = ?auto_450665 ?auto_450668 ) ) ( not ( = ?auto_450666 ?auto_450667 ) ) ( not ( = ?auto_450666 ?auto_450668 ) ) ( not ( = ?auto_450667 ?auto_450668 ) ) ( ON ?auto_450666 ?auto_450667 ) ( ON ?auto_450665 ?auto_450666 ) ( CLEAR ?auto_450663 ) ( ON ?auto_450664 ?auto_450665 ) ( CLEAR ?auto_450664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_450658 ?auto_450659 ?auto_450660 ?auto_450661 ?auto_450662 ?auto_450663 ?auto_450664 )
      ( MAKE-10PILE ?auto_450658 ?auto_450659 ?auto_450660 ?auto_450661 ?auto_450662 ?auto_450663 ?auto_450664 ?auto_450665 ?auto_450666 ?auto_450667 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450679 - BLOCK
      ?auto_450680 - BLOCK
      ?auto_450681 - BLOCK
      ?auto_450682 - BLOCK
      ?auto_450683 - BLOCK
      ?auto_450684 - BLOCK
      ?auto_450685 - BLOCK
      ?auto_450686 - BLOCK
      ?auto_450687 - BLOCK
      ?auto_450688 - BLOCK
    )
    :vars
    (
      ?auto_450689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450688 ?auto_450689 ) ( ON-TABLE ?auto_450679 ) ( ON ?auto_450680 ?auto_450679 ) ( ON ?auto_450681 ?auto_450680 ) ( ON ?auto_450682 ?auto_450681 ) ( ON ?auto_450683 ?auto_450682 ) ( ON ?auto_450684 ?auto_450683 ) ( not ( = ?auto_450679 ?auto_450680 ) ) ( not ( = ?auto_450679 ?auto_450681 ) ) ( not ( = ?auto_450679 ?auto_450682 ) ) ( not ( = ?auto_450679 ?auto_450683 ) ) ( not ( = ?auto_450679 ?auto_450684 ) ) ( not ( = ?auto_450679 ?auto_450685 ) ) ( not ( = ?auto_450679 ?auto_450686 ) ) ( not ( = ?auto_450679 ?auto_450687 ) ) ( not ( = ?auto_450679 ?auto_450688 ) ) ( not ( = ?auto_450679 ?auto_450689 ) ) ( not ( = ?auto_450680 ?auto_450681 ) ) ( not ( = ?auto_450680 ?auto_450682 ) ) ( not ( = ?auto_450680 ?auto_450683 ) ) ( not ( = ?auto_450680 ?auto_450684 ) ) ( not ( = ?auto_450680 ?auto_450685 ) ) ( not ( = ?auto_450680 ?auto_450686 ) ) ( not ( = ?auto_450680 ?auto_450687 ) ) ( not ( = ?auto_450680 ?auto_450688 ) ) ( not ( = ?auto_450680 ?auto_450689 ) ) ( not ( = ?auto_450681 ?auto_450682 ) ) ( not ( = ?auto_450681 ?auto_450683 ) ) ( not ( = ?auto_450681 ?auto_450684 ) ) ( not ( = ?auto_450681 ?auto_450685 ) ) ( not ( = ?auto_450681 ?auto_450686 ) ) ( not ( = ?auto_450681 ?auto_450687 ) ) ( not ( = ?auto_450681 ?auto_450688 ) ) ( not ( = ?auto_450681 ?auto_450689 ) ) ( not ( = ?auto_450682 ?auto_450683 ) ) ( not ( = ?auto_450682 ?auto_450684 ) ) ( not ( = ?auto_450682 ?auto_450685 ) ) ( not ( = ?auto_450682 ?auto_450686 ) ) ( not ( = ?auto_450682 ?auto_450687 ) ) ( not ( = ?auto_450682 ?auto_450688 ) ) ( not ( = ?auto_450682 ?auto_450689 ) ) ( not ( = ?auto_450683 ?auto_450684 ) ) ( not ( = ?auto_450683 ?auto_450685 ) ) ( not ( = ?auto_450683 ?auto_450686 ) ) ( not ( = ?auto_450683 ?auto_450687 ) ) ( not ( = ?auto_450683 ?auto_450688 ) ) ( not ( = ?auto_450683 ?auto_450689 ) ) ( not ( = ?auto_450684 ?auto_450685 ) ) ( not ( = ?auto_450684 ?auto_450686 ) ) ( not ( = ?auto_450684 ?auto_450687 ) ) ( not ( = ?auto_450684 ?auto_450688 ) ) ( not ( = ?auto_450684 ?auto_450689 ) ) ( not ( = ?auto_450685 ?auto_450686 ) ) ( not ( = ?auto_450685 ?auto_450687 ) ) ( not ( = ?auto_450685 ?auto_450688 ) ) ( not ( = ?auto_450685 ?auto_450689 ) ) ( not ( = ?auto_450686 ?auto_450687 ) ) ( not ( = ?auto_450686 ?auto_450688 ) ) ( not ( = ?auto_450686 ?auto_450689 ) ) ( not ( = ?auto_450687 ?auto_450688 ) ) ( not ( = ?auto_450687 ?auto_450689 ) ) ( not ( = ?auto_450688 ?auto_450689 ) ) ( ON ?auto_450687 ?auto_450688 ) ( ON ?auto_450686 ?auto_450687 ) ( CLEAR ?auto_450684 ) ( ON ?auto_450685 ?auto_450686 ) ( CLEAR ?auto_450685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_450679 ?auto_450680 ?auto_450681 ?auto_450682 ?auto_450683 ?auto_450684 ?auto_450685 )
      ( MAKE-10PILE ?auto_450679 ?auto_450680 ?auto_450681 ?auto_450682 ?auto_450683 ?auto_450684 ?auto_450685 ?auto_450686 ?auto_450687 ?auto_450688 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450700 - BLOCK
      ?auto_450701 - BLOCK
      ?auto_450702 - BLOCK
      ?auto_450703 - BLOCK
      ?auto_450704 - BLOCK
      ?auto_450705 - BLOCK
      ?auto_450706 - BLOCK
      ?auto_450707 - BLOCK
      ?auto_450708 - BLOCK
      ?auto_450709 - BLOCK
    )
    :vars
    (
      ?auto_450710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450709 ?auto_450710 ) ( ON-TABLE ?auto_450700 ) ( ON ?auto_450701 ?auto_450700 ) ( ON ?auto_450702 ?auto_450701 ) ( ON ?auto_450703 ?auto_450702 ) ( ON ?auto_450704 ?auto_450703 ) ( not ( = ?auto_450700 ?auto_450701 ) ) ( not ( = ?auto_450700 ?auto_450702 ) ) ( not ( = ?auto_450700 ?auto_450703 ) ) ( not ( = ?auto_450700 ?auto_450704 ) ) ( not ( = ?auto_450700 ?auto_450705 ) ) ( not ( = ?auto_450700 ?auto_450706 ) ) ( not ( = ?auto_450700 ?auto_450707 ) ) ( not ( = ?auto_450700 ?auto_450708 ) ) ( not ( = ?auto_450700 ?auto_450709 ) ) ( not ( = ?auto_450700 ?auto_450710 ) ) ( not ( = ?auto_450701 ?auto_450702 ) ) ( not ( = ?auto_450701 ?auto_450703 ) ) ( not ( = ?auto_450701 ?auto_450704 ) ) ( not ( = ?auto_450701 ?auto_450705 ) ) ( not ( = ?auto_450701 ?auto_450706 ) ) ( not ( = ?auto_450701 ?auto_450707 ) ) ( not ( = ?auto_450701 ?auto_450708 ) ) ( not ( = ?auto_450701 ?auto_450709 ) ) ( not ( = ?auto_450701 ?auto_450710 ) ) ( not ( = ?auto_450702 ?auto_450703 ) ) ( not ( = ?auto_450702 ?auto_450704 ) ) ( not ( = ?auto_450702 ?auto_450705 ) ) ( not ( = ?auto_450702 ?auto_450706 ) ) ( not ( = ?auto_450702 ?auto_450707 ) ) ( not ( = ?auto_450702 ?auto_450708 ) ) ( not ( = ?auto_450702 ?auto_450709 ) ) ( not ( = ?auto_450702 ?auto_450710 ) ) ( not ( = ?auto_450703 ?auto_450704 ) ) ( not ( = ?auto_450703 ?auto_450705 ) ) ( not ( = ?auto_450703 ?auto_450706 ) ) ( not ( = ?auto_450703 ?auto_450707 ) ) ( not ( = ?auto_450703 ?auto_450708 ) ) ( not ( = ?auto_450703 ?auto_450709 ) ) ( not ( = ?auto_450703 ?auto_450710 ) ) ( not ( = ?auto_450704 ?auto_450705 ) ) ( not ( = ?auto_450704 ?auto_450706 ) ) ( not ( = ?auto_450704 ?auto_450707 ) ) ( not ( = ?auto_450704 ?auto_450708 ) ) ( not ( = ?auto_450704 ?auto_450709 ) ) ( not ( = ?auto_450704 ?auto_450710 ) ) ( not ( = ?auto_450705 ?auto_450706 ) ) ( not ( = ?auto_450705 ?auto_450707 ) ) ( not ( = ?auto_450705 ?auto_450708 ) ) ( not ( = ?auto_450705 ?auto_450709 ) ) ( not ( = ?auto_450705 ?auto_450710 ) ) ( not ( = ?auto_450706 ?auto_450707 ) ) ( not ( = ?auto_450706 ?auto_450708 ) ) ( not ( = ?auto_450706 ?auto_450709 ) ) ( not ( = ?auto_450706 ?auto_450710 ) ) ( not ( = ?auto_450707 ?auto_450708 ) ) ( not ( = ?auto_450707 ?auto_450709 ) ) ( not ( = ?auto_450707 ?auto_450710 ) ) ( not ( = ?auto_450708 ?auto_450709 ) ) ( not ( = ?auto_450708 ?auto_450710 ) ) ( not ( = ?auto_450709 ?auto_450710 ) ) ( ON ?auto_450708 ?auto_450709 ) ( ON ?auto_450707 ?auto_450708 ) ( ON ?auto_450706 ?auto_450707 ) ( CLEAR ?auto_450704 ) ( ON ?auto_450705 ?auto_450706 ) ( CLEAR ?auto_450705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_450700 ?auto_450701 ?auto_450702 ?auto_450703 ?auto_450704 ?auto_450705 )
      ( MAKE-10PILE ?auto_450700 ?auto_450701 ?auto_450702 ?auto_450703 ?auto_450704 ?auto_450705 ?auto_450706 ?auto_450707 ?auto_450708 ?auto_450709 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450721 - BLOCK
      ?auto_450722 - BLOCK
      ?auto_450723 - BLOCK
      ?auto_450724 - BLOCK
      ?auto_450725 - BLOCK
      ?auto_450726 - BLOCK
      ?auto_450727 - BLOCK
      ?auto_450728 - BLOCK
      ?auto_450729 - BLOCK
      ?auto_450730 - BLOCK
    )
    :vars
    (
      ?auto_450731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450730 ?auto_450731 ) ( ON-TABLE ?auto_450721 ) ( ON ?auto_450722 ?auto_450721 ) ( ON ?auto_450723 ?auto_450722 ) ( ON ?auto_450724 ?auto_450723 ) ( ON ?auto_450725 ?auto_450724 ) ( not ( = ?auto_450721 ?auto_450722 ) ) ( not ( = ?auto_450721 ?auto_450723 ) ) ( not ( = ?auto_450721 ?auto_450724 ) ) ( not ( = ?auto_450721 ?auto_450725 ) ) ( not ( = ?auto_450721 ?auto_450726 ) ) ( not ( = ?auto_450721 ?auto_450727 ) ) ( not ( = ?auto_450721 ?auto_450728 ) ) ( not ( = ?auto_450721 ?auto_450729 ) ) ( not ( = ?auto_450721 ?auto_450730 ) ) ( not ( = ?auto_450721 ?auto_450731 ) ) ( not ( = ?auto_450722 ?auto_450723 ) ) ( not ( = ?auto_450722 ?auto_450724 ) ) ( not ( = ?auto_450722 ?auto_450725 ) ) ( not ( = ?auto_450722 ?auto_450726 ) ) ( not ( = ?auto_450722 ?auto_450727 ) ) ( not ( = ?auto_450722 ?auto_450728 ) ) ( not ( = ?auto_450722 ?auto_450729 ) ) ( not ( = ?auto_450722 ?auto_450730 ) ) ( not ( = ?auto_450722 ?auto_450731 ) ) ( not ( = ?auto_450723 ?auto_450724 ) ) ( not ( = ?auto_450723 ?auto_450725 ) ) ( not ( = ?auto_450723 ?auto_450726 ) ) ( not ( = ?auto_450723 ?auto_450727 ) ) ( not ( = ?auto_450723 ?auto_450728 ) ) ( not ( = ?auto_450723 ?auto_450729 ) ) ( not ( = ?auto_450723 ?auto_450730 ) ) ( not ( = ?auto_450723 ?auto_450731 ) ) ( not ( = ?auto_450724 ?auto_450725 ) ) ( not ( = ?auto_450724 ?auto_450726 ) ) ( not ( = ?auto_450724 ?auto_450727 ) ) ( not ( = ?auto_450724 ?auto_450728 ) ) ( not ( = ?auto_450724 ?auto_450729 ) ) ( not ( = ?auto_450724 ?auto_450730 ) ) ( not ( = ?auto_450724 ?auto_450731 ) ) ( not ( = ?auto_450725 ?auto_450726 ) ) ( not ( = ?auto_450725 ?auto_450727 ) ) ( not ( = ?auto_450725 ?auto_450728 ) ) ( not ( = ?auto_450725 ?auto_450729 ) ) ( not ( = ?auto_450725 ?auto_450730 ) ) ( not ( = ?auto_450725 ?auto_450731 ) ) ( not ( = ?auto_450726 ?auto_450727 ) ) ( not ( = ?auto_450726 ?auto_450728 ) ) ( not ( = ?auto_450726 ?auto_450729 ) ) ( not ( = ?auto_450726 ?auto_450730 ) ) ( not ( = ?auto_450726 ?auto_450731 ) ) ( not ( = ?auto_450727 ?auto_450728 ) ) ( not ( = ?auto_450727 ?auto_450729 ) ) ( not ( = ?auto_450727 ?auto_450730 ) ) ( not ( = ?auto_450727 ?auto_450731 ) ) ( not ( = ?auto_450728 ?auto_450729 ) ) ( not ( = ?auto_450728 ?auto_450730 ) ) ( not ( = ?auto_450728 ?auto_450731 ) ) ( not ( = ?auto_450729 ?auto_450730 ) ) ( not ( = ?auto_450729 ?auto_450731 ) ) ( not ( = ?auto_450730 ?auto_450731 ) ) ( ON ?auto_450729 ?auto_450730 ) ( ON ?auto_450728 ?auto_450729 ) ( ON ?auto_450727 ?auto_450728 ) ( CLEAR ?auto_450725 ) ( ON ?auto_450726 ?auto_450727 ) ( CLEAR ?auto_450726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_450721 ?auto_450722 ?auto_450723 ?auto_450724 ?auto_450725 ?auto_450726 )
      ( MAKE-10PILE ?auto_450721 ?auto_450722 ?auto_450723 ?auto_450724 ?auto_450725 ?auto_450726 ?auto_450727 ?auto_450728 ?auto_450729 ?auto_450730 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450742 - BLOCK
      ?auto_450743 - BLOCK
      ?auto_450744 - BLOCK
      ?auto_450745 - BLOCK
      ?auto_450746 - BLOCK
      ?auto_450747 - BLOCK
      ?auto_450748 - BLOCK
      ?auto_450749 - BLOCK
      ?auto_450750 - BLOCK
      ?auto_450751 - BLOCK
    )
    :vars
    (
      ?auto_450752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450751 ?auto_450752 ) ( ON-TABLE ?auto_450742 ) ( ON ?auto_450743 ?auto_450742 ) ( ON ?auto_450744 ?auto_450743 ) ( ON ?auto_450745 ?auto_450744 ) ( not ( = ?auto_450742 ?auto_450743 ) ) ( not ( = ?auto_450742 ?auto_450744 ) ) ( not ( = ?auto_450742 ?auto_450745 ) ) ( not ( = ?auto_450742 ?auto_450746 ) ) ( not ( = ?auto_450742 ?auto_450747 ) ) ( not ( = ?auto_450742 ?auto_450748 ) ) ( not ( = ?auto_450742 ?auto_450749 ) ) ( not ( = ?auto_450742 ?auto_450750 ) ) ( not ( = ?auto_450742 ?auto_450751 ) ) ( not ( = ?auto_450742 ?auto_450752 ) ) ( not ( = ?auto_450743 ?auto_450744 ) ) ( not ( = ?auto_450743 ?auto_450745 ) ) ( not ( = ?auto_450743 ?auto_450746 ) ) ( not ( = ?auto_450743 ?auto_450747 ) ) ( not ( = ?auto_450743 ?auto_450748 ) ) ( not ( = ?auto_450743 ?auto_450749 ) ) ( not ( = ?auto_450743 ?auto_450750 ) ) ( not ( = ?auto_450743 ?auto_450751 ) ) ( not ( = ?auto_450743 ?auto_450752 ) ) ( not ( = ?auto_450744 ?auto_450745 ) ) ( not ( = ?auto_450744 ?auto_450746 ) ) ( not ( = ?auto_450744 ?auto_450747 ) ) ( not ( = ?auto_450744 ?auto_450748 ) ) ( not ( = ?auto_450744 ?auto_450749 ) ) ( not ( = ?auto_450744 ?auto_450750 ) ) ( not ( = ?auto_450744 ?auto_450751 ) ) ( not ( = ?auto_450744 ?auto_450752 ) ) ( not ( = ?auto_450745 ?auto_450746 ) ) ( not ( = ?auto_450745 ?auto_450747 ) ) ( not ( = ?auto_450745 ?auto_450748 ) ) ( not ( = ?auto_450745 ?auto_450749 ) ) ( not ( = ?auto_450745 ?auto_450750 ) ) ( not ( = ?auto_450745 ?auto_450751 ) ) ( not ( = ?auto_450745 ?auto_450752 ) ) ( not ( = ?auto_450746 ?auto_450747 ) ) ( not ( = ?auto_450746 ?auto_450748 ) ) ( not ( = ?auto_450746 ?auto_450749 ) ) ( not ( = ?auto_450746 ?auto_450750 ) ) ( not ( = ?auto_450746 ?auto_450751 ) ) ( not ( = ?auto_450746 ?auto_450752 ) ) ( not ( = ?auto_450747 ?auto_450748 ) ) ( not ( = ?auto_450747 ?auto_450749 ) ) ( not ( = ?auto_450747 ?auto_450750 ) ) ( not ( = ?auto_450747 ?auto_450751 ) ) ( not ( = ?auto_450747 ?auto_450752 ) ) ( not ( = ?auto_450748 ?auto_450749 ) ) ( not ( = ?auto_450748 ?auto_450750 ) ) ( not ( = ?auto_450748 ?auto_450751 ) ) ( not ( = ?auto_450748 ?auto_450752 ) ) ( not ( = ?auto_450749 ?auto_450750 ) ) ( not ( = ?auto_450749 ?auto_450751 ) ) ( not ( = ?auto_450749 ?auto_450752 ) ) ( not ( = ?auto_450750 ?auto_450751 ) ) ( not ( = ?auto_450750 ?auto_450752 ) ) ( not ( = ?auto_450751 ?auto_450752 ) ) ( ON ?auto_450750 ?auto_450751 ) ( ON ?auto_450749 ?auto_450750 ) ( ON ?auto_450748 ?auto_450749 ) ( ON ?auto_450747 ?auto_450748 ) ( CLEAR ?auto_450745 ) ( ON ?auto_450746 ?auto_450747 ) ( CLEAR ?auto_450746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450742 ?auto_450743 ?auto_450744 ?auto_450745 ?auto_450746 )
      ( MAKE-10PILE ?auto_450742 ?auto_450743 ?auto_450744 ?auto_450745 ?auto_450746 ?auto_450747 ?auto_450748 ?auto_450749 ?auto_450750 ?auto_450751 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450763 - BLOCK
      ?auto_450764 - BLOCK
      ?auto_450765 - BLOCK
      ?auto_450766 - BLOCK
      ?auto_450767 - BLOCK
      ?auto_450768 - BLOCK
      ?auto_450769 - BLOCK
      ?auto_450770 - BLOCK
      ?auto_450771 - BLOCK
      ?auto_450772 - BLOCK
    )
    :vars
    (
      ?auto_450773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450772 ?auto_450773 ) ( ON-TABLE ?auto_450763 ) ( ON ?auto_450764 ?auto_450763 ) ( ON ?auto_450765 ?auto_450764 ) ( ON ?auto_450766 ?auto_450765 ) ( not ( = ?auto_450763 ?auto_450764 ) ) ( not ( = ?auto_450763 ?auto_450765 ) ) ( not ( = ?auto_450763 ?auto_450766 ) ) ( not ( = ?auto_450763 ?auto_450767 ) ) ( not ( = ?auto_450763 ?auto_450768 ) ) ( not ( = ?auto_450763 ?auto_450769 ) ) ( not ( = ?auto_450763 ?auto_450770 ) ) ( not ( = ?auto_450763 ?auto_450771 ) ) ( not ( = ?auto_450763 ?auto_450772 ) ) ( not ( = ?auto_450763 ?auto_450773 ) ) ( not ( = ?auto_450764 ?auto_450765 ) ) ( not ( = ?auto_450764 ?auto_450766 ) ) ( not ( = ?auto_450764 ?auto_450767 ) ) ( not ( = ?auto_450764 ?auto_450768 ) ) ( not ( = ?auto_450764 ?auto_450769 ) ) ( not ( = ?auto_450764 ?auto_450770 ) ) ( not ( = ?auto_450764 ?auto_450771 ) ) ( not ( = ?auto_450764 ?auto_450772 ) ) ( not ( = ?auto_450764 ?auto_450773 ) ) ( not ( = ?auto_450765 ?auto_450766 ) ) ( not ( = ?auto_450765 ?auto_450767 ) ) ( not ( = ?auto_450765 ?auto_450768 ) ) ( not ( = ?auto_450765 ?auto_450769 ) ) ( not ( = ?auto_450765 ?auto_450770 ) ) ( not ( = ?auto_450765 ?auto_450771 ) ) ( not ( = ?auto_450765 ?auto_450772 ) ) ( not ( = ?auto_450765 ?auto_450773 ) ) ( not ( = ?auto_450766 ?auto_450767 ) ) ( not ( = ?auto_450766 ?auto_450768 ) ) ( not ( = ?auto_450766 ?auto_450769 ) ) ( not ( = ?auto_450766 ?auto_450770 ) ) ( not ( = ?auto_450766 ?auto_450771 ) ) ( not ( = ?auto_450766 ?auto_450772 ) ) ( not ( = ?auto_450766 ?auto_450773 ) ) ( not ( = ?auto_450767 ?auto_450768 ) ) ( not ( = ?auto_450767 ?auto_450769 ) ) ( not ( = ?auto_450767 ?auto_450770 ) ) ( not ( = ?auto_450767 ?auto_450771 ) ) ( not ( = ?auto_450767 ?auto_450772 ) ) ( not ( = ?auto_450767 ?auto_450773 ) ) ( not ( = ?auto_450768 ?auto_450769 ) ) ( not ( = ?auto_450768 ?auto_450770 ) ) ( not ( = ?auto_450768 ?auto_450771 ) ) ( not ( = ?auto_450768 ?auto_450772 ) ) ( not ( = ?auto_450768 ?auto_450773 ) ) ( not ( = ?auto_450769 ?auto_450770 ) ) ( not ( = ?auto_450769 ?auto_450771 ) ) ( not ( = ?auto_450769 ?auto_450772 ) ) ( not ( = ?auto_450769 ?auto_450773 ) ) ( not ( = ?auto_450770 ?auto_450771 ) ) ( not ( = ?auto_450770 ?auto_450772 ) ) ( not ( = ?auto_450770 ?auto_450773 ) ) ( not ( = ?auto_450771 ?auto_450772 ) ) ( not ( = ?auto_450771 ?auto_450773 ) ) ( not ( = ?auto_450772 ?auto_450773 ) ) ( ON ?auto_450771 ?auto_450772 ) ( ON ?auto_450770 ?auto_450771 ) ( ON ?auto_450769 ?auto_450770 ) ( ON ?auto_450768 ?auto_450769 ) ( CLEAR ?auto_450766 ) ( ON ?auto_450767 ?auto_450768 ) ( CLEAR ?auto_450767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_450763 ?auto_450764 ?auto_450765 ?auto_450766 ?auto_450767 )
      ( MAKE-10PILE ?auto_450763 ?auto_450764 ?auto_450765 ?auto_450766 ?auto_450767 ?auto_450768 ?auto_450769 ?auto_450770 ?auto_450771 ?auto_450772 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450784 - BLOCK
      ?auto_450785 - BLOCK
      ?auto_450786 - BLOCK
      ?auto_450787 - BLOCK
      ?auto_450788 - BLOCK
      ?auto_450789 - BLOCK
      ?auto_450790 - BLOCK
      ?auto_450791 - BLOCK
      ?auto_450792 - BLOCK
      ?auto_450793 - BLOCK
    )
    :vars
    (
      ?auto_450794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450793 ?auto_450794 ) ( ON-TABLE ?auto_450784 ) ( ON ?auto_450785 ?auto_450784 ) ( ON ?auto_450786 ?auto_450785 ) ( not ( = ?auto_450784 ?auto_450785 ) ) ( not ( = ?auto_450784 ?auto_450786 ) ) ( not ( = ?auto_450784 ?auto_450787 ) ) ( not ( = ?auto_450784 ?auto_450788 ) ) ( not ( = ?auto_450784 ?auto_450789 ) ) ( not ( = ?auto_450784 ?auto_450790 ) ) ( not ( = ?auto_450784 ?auto_450791 ) ) ( not ( = ?auto_450784 ?auto_450792 ) ) ( not ( = ?auto_450784 ?auto_450793 ) ) ( not ( = ?auto_450784 ?auto_450794 ) ) ( not ( = ?auto_450785 ?auto_450786 ) ) ( not ( = ?auto_450785 ?auto_450787 ) ) ( not ( = ?auto_450785 ?auto_450788 ) ) ( not ( = ?auto_450785 ?auto_450789 ) ) ( not ( = ?auto_450785 ?auto_450790 ) ) ( not ( = ?auto_450785 ?auto_450791 ) ) ( not ( = ?auto_450785 ?auto_450792 ) ) ( not ( = ?auto_450785 ?auto_450793 ) ) ( not ( = ?auto_450785 ?auto_450794 ) ) ( not ( = ?auto_450786 ?auto_450787 ) ) ( not ( = ?auto_450786 ?auto_450788 ) ) ( not ( = ?auto_450786 ?auto_450789 ) ) ( not ( = ?auto_450786 ?auto_450790 ) ) ( not ( = ?auto_450786 ?auto_450791 ) ) ( not ( = ?auto_450786 ?auto_450792 ) ) ( not ( = ?auto_450786 ?auto_450793 ) ) ( not ( = ?auto_450786 ?auto_450794 ) ) ( not ( = ?auto_450787 ?auto_450788 ) ) ( not ( = ?auto_450787 ?auto_450789 ) ) ( not ( = ?auto_450787 ?auto_450790 ) ) ( not ( = ?auto_450787 ?auto_450791 ) ) ( not ( = ?auto_450787 ?auto_450792 ) ) ( not ( = ?auto_450787 ?auto_450793 ) ) ( not ( = ?auto_450787 ?auto_450794 ) ) ( not ( = ?auto_450788 ?auto_450789 ) ) ( not ( = ?auto_450788 ?auto_450790 ) ) ( not ( = ?auto_450788 ?auto_450791 ) ) ( not ( = ?auto_450788 ?auto_450792 ) ) ( not ( = ?auto_450788 ?auto_450793 ) ) ( not ( = ?auto_450788 ?auto_450794 ) ) ( not ( = ?auto_450789 ?auto_450790 ) ) ( not ( = ?auto_450789 ?auto_450791 ) ) ( not ( = ?auto_450789 ?auto_450792 ) ) ( not ( = ?auto_450789 ?auto_450793 ) ) ( not ( = ?auto_450789 ?auto_450794 ) ) ( not ( = ?auto_450790 ?auto_450791 ) ) ( not ( = ?auto_450790 ?auto_450792 ) ) ( not ( = ?auto_450790 ?auto_450793 ) ) ( not ( = ?auto_450790 ?auto_450794 ) ) ( not ( = ?auto_450791 ?auto_450792 ) ) ( not ( = ?auto_450791 ?auto_450793 ) ) ( not ( = ?auto_450791 ?auto_450794 ) ) ( not ( = ?auto_450792 ?auto_450793 ) ) ( not ( = ?auto_450792 ?auto_450794 ) ) ( not ( = ?auto_450793 ?auto_450794 ) ) ( ON ?auto_450792 ?auto_450793 ) ( ON ?auto_450791 ?auto_450792 ) ( ON ?auto_450790 ?auto_450791 ) ( ON ?auto_450789 ?auto_450790 ) ( ON ?auto_450788 ?auto_450789 ) ( CLEAR ?auto_450786 ) ( ON ?auto_450787 ?auto_450788 ) ( CLEAR ?auto_450787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450784 ?auto_450785 ?auto_450786 ?auto_450787 )
      ( MAKE-10PILE ?auto_450784 ?auto_450785 ?auto_450786 ?auto_450787 ?auto_450788 ?auto_450789 ?auto_450790 ?auto_450791 ?auto_450792 ?auto_450793 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450805 - BLOCK
      ?auto_450806 - BLOCK
      ?auto_450807 - BLOCK
      ?auto_450808 - BLOCK
      ?auto_450809 - BLOCK
      ?auto_450810 - BLOCK
      ?auto_450811 - BLOCK
      ?auto_450812 - BLOCK
      ?auto_450813 - BLOCK
      ?auto_450814 - BLOCK
    )
    :vars
    (
      ?auto_450815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450814 ?auto_450815 ) ( ON-TABLE ?auto_450805 ) ( ON ?auto_450806 ?auto_450805 ) ( ON ?auto_450807 ?auto_450806 ) ( not ( = ?auto_450805 ?auto_450806 ) ) ( not ( = ?auto_450805 ?auto_450807 ) ) ( not ( = ?auto_450805 ?auto_450808 ) ) ( not ( = ?auto_450805 ?auto_450809 ) ) ( not ( = ?auto_450805 ?auto_450810 ) ) ( not ( = ?auto_450805 ?auto_450811 ) ) ( not ( = ?auto_450805 ?auto_450812 ) ) ( not ( = ?auto_450805 ?auto_450813 ) ) ( not ( = ?auto_450805 ?auto_450814 ) ) ( not ( = ?auto_450805 ?auto_450815 ) ) ( not ( = ?auto_450806 ?auto_450807 ) ) ( not ( = ?auto_450806 ?auto_450808 ) ) ( not ( = ?auto_450806 ?auto_450809 ) ) ( not ( = ?auto_450806 ?auto_450810 ) ) ( not ( = ?auto_450806 ?auto_450811 ) ) ( not ( = ?auto_450806 ?auto_450812 ) ) ( not ( = ?auto_450806 ?auto_450813 ) ) ( not ( = ?auto_450806 ?auto_450814 ) ) ( not ( = ?auto_450806 ?auto_450815 ) ) ( not ( = ?auto_450807 ?auto_450808 ) ) ( not ( = ?auto_450807 ?auto_450809 ) ) ( not ( = ?auto_450807 ?auto_450810 ) ) ( not ( = ?auto_450807 ?auto_450811 ) ) ( not ( = ?auto_450807 ?auto_450812 ) ) ( not ( = ?auto_450807 ?auto_450813 ) ) ( not ( = ?auto_450807 ?auto_450814 ) ) ( not ( = ?auto_450807 ?auto_450815 ) ) ( not ( = ?auto_450808 ?auto_450809 ) ) ( not ( = ?auto_450808 ?auto_450810 ) ) ( not ( = ?auto_450808 ?auto_450811 ) ) ( not ( = ?auto_450808 ?auto_450812 ) ) ( not ( = ?auto_450808 ?auto_450813 ) ) ( not ( = ?auto_450808 ?auto_450814 ) ) ( not ( = ?auto_450808 ?auto_450815 ) ) ( not ( = ?auto_450809 ?auto_450810 ) ) ( not ( = ?auto_450809 ?auto_450811 ) ) ( not ( = ?auto_450809 ?auto_450812 ) ) ( not ( = ?auto_450809 ?auto_450813 ) ) ( not ( = ?auto_450809 ?auto_450814 ) ) ( not ( = ?auto_450809 ?auto_450815 ) ) ( not ( = ?auto_450810 ?auto_450811 ) ) ( not ( = ?auto_450810 ?auto_450812 ) ) ( not ( = ?auto_450810 ?auto_450813 ) ) ( not ( = ?auto_450810 ?auto_450814 ) ) ( not ( = ?auto_450810 ?auto_450815 ) ) ( not ( = ?auto_450811 ?auto_450812 ) ) ( not ( = ?auto_450811 ?auto_450813 ) ) ( not ( = ?auto_450811 ?auto_450814 ) ) ( not ( = ?auto_450811 ?auto_450815 ) ) ( not ( = ?auto_450812 ?auto_450813 ) ) ( not ( = ?auto_450812 ?auto_450814 ) ) ( not ( = ?auto_450812 ?auto_450815 ) ) ( not ( = ?auto_450813 ?auto_450814 ) ) ( not ( = ?auto_450813 ?auto_450815 ) ) ( not ( = ?auto_450814 ?auto_450815 ) ) ( ON ?auto_450813 ?auto_450814 ) ( ON ?auto_450812 ?auto_450813 ) ( ON ?auto_450811 ?auto_450812 ) ( ON ?auto_450810 ?auto_450811 ) ( ON ?auto_450809 ?auto_450810 ) ( CLEAR ?auto_450807 ) ( ON ?auto_450808 ?auto_450809 ) ( CLEAR ?auto_450808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_450805 ?auto_450806 ?auto_450807 ?auto_450808 )
      ( MAKE-10PILE ?auto_450805 ?auto_450806 ?auto_450807 ?auto_450808 ?auto_450809 ?auto_450810 ?auto_450811 ?auto_450812 ?auto_450813 ?auto_450814 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450826 - BLOCK
      ?auto_450827 - BLOCK
      ?auto_450828 - BLOCK
      ?auto_450829 - BLOCK
      ?auto_450830 - BLOCK
      ?auto_450831 - BLOCK
      ?auto_450832 - BLOCK
      ?auto_450833 - BLOCK
      ?auto_450834 - BLOCK
      ?auto_450835 - BLOCK
    )
    :vars
    (
      ?auto_450836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450835 ?auto_450836 ) ( ON-TABLE ?auto_450826 ) ( ON ?auto_450827 ?auto_450826 ) ( not ( = ?auto_450826 ?auto_450827 ) ) ( not ( = ?auto_450826 ?auto_450828 ) ) ( not ( = ?auto_450826 ?auto_450829 ) ) ( not ( = ?auto_450826 ?auto_450830 ) ) ( not ( = ?auto_450826 ?auto_450831 ) ) ( not ( = ?auto_450826 ?auto_450832 ) ) ( not ( = ?auto_450826 ?auto_450833 ) ) ( not ( = ?auto_450826 ?auto_450834 ) ) ( not ( = ?auto_450826 ?auto_450835 ) ) ( not ( = ?auto_450826 ?auto_450836 ) ) ( not ( = ?auto_450827 ?auto_450828 ) ) ( not ( = ?auto_450827 ?auto_450829 ) ) ( not ( = ?auto_450827 ?auto_450830 ) ) ( not ( = ?auto_450827 ?auto_450831 ) ) ( not ( = ?auto_450827 ?auto_450832 ) ) ( not ( = ?auto_450827 ?auto_450833 ) ) ( not ( = ?auto_450827 ?auto_450834 ) ) ( not ( = ?auto_450827 ?auto_450835 ) ) ( not ( = ?auto_450827 ?auto_450836 ) ) ( not ( = ?auto_450828 ?auto_450829 ) ) ( not ( = ?auto_450828 ?auto_450830 ) ) ( not ( = ?auto_450828 ?auto_450831 ) ) ( not ( = ?auto_450828 ?auto_450832 ) ) ( not ( = ?auto_450828 ?auto_450833 ) ) ( not ( = ?auto_450828 ?auto_450834 ) ) ( not ( = ?auto_450828 ?auto_450835 ) ) ( not ( = ?auto_450828 ?auto_450836 ) ) ( not ( = ?auto_450829 ?auto_450830 ) ) ( not ( = ?auto_450829 ?auto_450831 ) ) ( not ( = ?auto_450829 ?auto_450832 ) ) ( not ( = ?auto_450829 ?auto_450833 ) ) ( not ( = ?auto_450829 ?auto_450834 ) ) ( not ( = ?auto_450829 ?auto_450835 ) ) ( not ( = ?auto_450829 ?auto_450836 ) ) ( not ( = ?auto_450830 ?auto_450831 ) ) ( not ( = ?auto_450830 ?auto_450832 ) ) ( not ( = ?auto_450830 ?auto_450833 ) ) ( not ( = ?auto_450830 ?auto_450834 ) ) ( not ( = ?auto_450830 ?auto_450835 ) ) ( not ( = ?auto_450830 ?auto_450836 ) ) ( not ( = ?auto_450831 ?auto_450832 ) ) ( not ( = ?auto_450831 ?auto_450833 ) ) ( not ( = ?auto_450831 ?auto_450834 ) ) ( not ( = ?auto_450831 ?auto_450835 ) ) ( not ( = ?auto_450831 ?auto_450836 ) ) ( not ( = ?auto_450832 ?auto_450833 ) ) ( not ( = ?auto_450832 ?auto_450834 ) ) ( not ( = ?auto_450832 ?auto_450835 ) ) ( not ( = ?auto_450832 ?auto_450836 ) ) ( not ( = ?auto_450833 ?auto_450834 ) ) ( not ( = ?auto_450833 ?auto_450835 ) ) ( not ( = ?auto_450833 ?auto_450836 ) ) ( not ( = ?auto_450834 ?auto_450835 ) ) ( not ( = ?auto_450834 ?auto_450836 ) ) ( not ( = ?auto_450835 ?auto_450836 ) ) ( ON ?auto_450834 ?auto_450835 ) ( ON ?auto_450833 ?auto_450834 ) ( ON ?auto_450832 ?auto_450833 ) ( ON ?auto_450831 ?auto_450832 ) ( ON ?auto_450830 ?auto_450831 ) ( ON ?auto_450829 ?auto_450830 ) ( CLEAR ?auto_450827 ) ( ON ?auto_450828 ?auto_450829 ) ( CLEAR ?auto_450828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450826 ?auto_450827 ?auto_450828 )
      ( MAKE-10PILE ?auto_450826 ?auto_450827 ?auto_450828 ?auto_450829 ?auto_450830 ?auto_450831 ?auto_450832 ?auto_450833 ?auto_450834 ?auto_450835 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450847 - BLOCK
      ?auto_450848 - BLOCK
      ?auto_450849 - BLOCK
      ?auto_450850 - BLOCK
      ?auto_450851 - BLOCK
      ?auto_450852 - BLOCK
      ?auto_450853 - BLOCK
      ?auto_450854 - BLOCK
      ?auto_450855 - BLOCK
      ?auto_450856 - BLOCK
    )
    :vars
    (
      ?auto_450857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450856 ?auto_450857 ) ( ON-TABLE ?auto_450847 ) ( ON ?auto_450848 ?auto_450847 ) ( not ( = ?auto_450847 ?auto_450848 ) ) ( not ( = ?auto_450847 ?auto_450849 ) ) ( not ( = ?auto_450847 ?auto_450850 ) ) ( not ( = ?auto_450847 ?auto_450851 ) ) ( not ( = ?auto_450847 ?auto_450852 ) ) ( not ( = ?auto_450847 ?auto_450853 ) ) ( not ( = ?auto_450847 ?auto_450854 ) ) ( not ( = ?auto_450847 ?auto_450855 ) ) ( not ( = ?auto_450847 ?auto_450856 ) ) ( not ( = ?auto_450847 ?auto_450857 ) ) ( not ( = ?auto_450848 ?auto_450849 ) ) ( not ( = ?auto_450848 ?auto_450850 ) ) ( not ( = ?auto_450848 ?auto_450851 ) ) ( not ( = ?auto_450848 ?auto_450852 ) ) ( not ( = ?auto_450848 ?auto_450853 ) ) ( not ( = ?auto_450848 ?auto_450854 ) ) ( not ( = ?auto_450848 ?auto_450855 ) ) ( not ( = ?auto_450848 ?auto_450856 ) ) ( not ( = ?auto_450848 ?auto_450857 ) ) ( not ( = ?auto_450849 ?auto_450850 ) ) ( not ( = ?auto_450849 ?auto_450851 ) ) ( not ( = ?auto_450849 ?auto_450852 ) ) ( not ( = ?auto_450849 ?auto_450853 ) ) ( not ( = ?auto_450849 ?auto_450854 ) ) ( not ( = ?auto_450849 ?auto_450855 ) ) ( not ( = ?auto_450849 ?auto_450856 ) ) ( not ( = ?auto_450849 ?auto_450857 ) ) ( not ( = ?auto_450850 ?auto_450851 ) ) ( not ( = ?auto_450850 ?auto_450852 ) ) ( not ( = ?auto_450850 ?auto_450853 ) ) ( not ( = ?auto_450850 ?auto_450854 ) ) ( not ( = ?auto_450850 ?auto_450855 ) ) ( not ( = ?auto_450850 ?auto_450856 ) ) ( not ( = ?auto_450850 ?auto_450857 ) ) ( not ( = ?auto_450851 ?auto_450852 ) ) ( not ( = ?auto_450851 ?auto_450853 ) ) ( not ( = ?auto_450851 ?auto_450854 ) ) ( not ( = ?auto_450851 ?auto_450855 ) ) ( not ( = ?auto_450851 ?auto_450856 ) ) ( not ( = ?auto_450851 ?auto_450857 ) ) ( not ( = ?auto_450852 ?auto_450853 ) ) ( not ( = ?auto_450852 ?auto_450854 ) ) ( not ( = ?auto_450852 ?auto_450855 ) ) ( not ( = ?auto_450852 ?auto_450856 ) ) ( not ( = ?auto_450852 ?auto_450857 ) ) ( not ( = ?auto_450853 ?auto_450854 ) ) ( not ( = ?auto_450853 ?auto_450855 ) ) ( not ( = ?auto_450853 ?auto_450856 ) ) ( not ( = ?auto_450853 ?auto_450857 ) ) ( not ( = ?auto_450854 ?auto_450855 ) ) ( not ( = ?auto_450854 ?auto_450856 ) ) ( not ( = ?auto_450854 ?auto_450857 ) ) ( not ( = ?auto_450855 ?auto_450856 ) ) ( not ( = ?auto_450855 ?auto_450857 ) ) ( not ( = ?auto_450856 ?auto_450857 ) ) ( ON ?auto_450855 ?auto_450856 ) ( ON ?auto_450854 ?auto_450855 ) ( ON ?auto_450853 ?auto_450854 ) ( ON ?auto_450852 ?auto_450853 ) ( ON ?auto_450851 ?auto_450852 ) ( ON ?auto_450850 ?auto_450851 ) ( CLEAR ?auto_450848 ) ( ON ?auto_450849 ?auto_450850 ) ( CLEAR ?auto_450849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_450847 ?auto_450848 ?auto_450849 )
      ( MAKE-10PILE ?auto_450847 ?auto_450848 ?auto_450849 ?auto_450850 ?auto_450851 ?auto_450852 ?auto_450853 ?auto_450854 ?auto_450855 ?auto_450856 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450868 - BLOCK
      ?auto_450869 - BLOCK
      ?auto_450870 - BLOCK
      ?auto_450871 - BLOCK
      ?auto_450872 - BLOCK
      ?auto_450873 - BLOCK
      ?auto_450874 - BLOCK
      ?auto_450875 - BLOCK
      ?auto_450876 - BLOCK
      ?auto_450877 - BLOCK
    )
    :vars
    (
      ?auto_450878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450877 ?auto_450878 ) ( ON-TABLE ?auto_450868 ) ( not ( = ?auto_450868 ?auto_450869 ) ) ( not ( = ?auto_450868 ?auto_450870 ) ) ( not ( = ?auto_450868 ?auto_450871 ) ) ( not ( = ?auto_450868 ?auto_450872 ) ) ( not ( = ?auto_450868 ?auto_450873 ) ) ( not ( = ?auto_450868 ?auto_450874 ) ) ( not ( = ?auto_450868 ?auto_450875 ) ) ( not ( = ?auto_450868 ?auto_450876 ) ) ( not ( = ?auto_450868 ?auto_450877 ) ) ( not ( = ?auto_450868 ?auto_450878 ) ) ( not ( = ?auto_450869 ?auto_450870 ) ) ( not ( = ?auto_450869 ?auto_450871 ) ) ( not ( = ?auto_450869 ?auto_450872 ) ) ( not ( = ?auto_450869 ?auto_450873 ) ) ( not ( = ?auto_450869 ?auto_450874 ) ) ( not ( = ?auto_450869 ?auto_450875 ) ) ( not ( = ?auto_450869 ?auto_450876 ) ) ( not ( = ?auto_450869 ?auto_450877 ) ) ( not ( = ?auto_450869 ?auto_450878 ) ) ( not ( = ?auto_450870 ?auto_450871 ) ) ( not ( = ?auto_450870 ?auto_450872 ) ) ( not ( = ?auto_450870 ?auto_450873 ) ) ( not ( = ?auto_450870 ?auto_450874 ) ) ( not ( = ?auto_450870 ?auto_450875 ) ) ( not ( = ?auto_450870 ?auto_450876 ) ) ( not ( = ?auto_450870 ?auto_450877 ) ) ( not ( = ?auto_450870 ?auto_450878 ) ) ( not ( = ?auto_450871 ?auto_450872 ) ) ( not ( = ?auto_450871 ?auto_450873 ) ) ( not ( = ?auto_450871 ?auto_450874 ) ) ( not ( = ?auto_450871 ?auto_450875 ) ) ( not ( = ?auto_450871 ?auto_450876 ) ) ( not ( = ?auto_450871 ?auto_450877 ) ) ( not ( = ?auto_450871 ?auto_450878 ) ) ( not ( = ?auto_450872 ?auto_450873 ) ) ( not ( = ?auto_450872 ?auto_450874 ) ) ( not ( = ?auto_450872 ?auto_450875 ) ) ( not ( = ?auto_450872 ?auto_450876 ) ) ( not ( = ?auto_450872 ?auto_450877 ) ) ( not ( = ?auto_450872 ?auto_450878 ) ) ( not ( = ?auto_450873 ?auto_450874 ) ) ( not ( = ?auto_450873 ?auto_450875 ) ) ( not ( = ?auto_450873 ?auto_450876 ) ) ( not ( = ?auto_450873 ?auto_450877 ) ) ( not ( = ?auto_450873 ?auto_450878 ) ) ( not ( = ?auto_450874 ?auto_450875 ) ) ( not ( = ?auto_450874 ?auto_450876 ) ) ( not ( = ?auto_450874 ?auto_450877 ) ) ( not ( = ?auto_450874 ?auto_450878 ) ) ( not ( = ?auto_450875 ?auto_450876 ) ) ( not ( = ?auto_450875 ?auto_450877 ) ) ( not ( = ?auto_450875 ?auto_450878 ) ) ( not ( = ?auto_450876 ?auto_450877 ) ) ( not ( = ?auto_450876 ?auto_450878 ) ) ( not ( = ?auto_450877 ?auto_450878 ) ) ( ON ?auto_450876 ?auto_450877 ) ( ON ?auto_450875 ?auto_450876 ) ( ON ?auto_450874 ?auto_450875 ) ( ON ?auto_450873 ?auto_450874 ) ( ON ?auto_450872 ?auto_450873 ) ( ON ?auto_450871 ?auto_450872 ) ( ON ?auto_450870 ?auto_450871 ) ( CLEAR ?auto_450868 ) ( ON ?auto_450869 ?auto_450870 ) ( CLEAR ?auto_450869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450868 ?auto_450869 )
      ( MAKE-10PILE ?auto_450868 ?auto_450869 ?auto_450870 ?auto_450871 ?auto_450872 ?auto_450873 ?auto_450874 ?auto_450875 ?auto_450876 ?auto_450877 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450889 - BLOCK
      ?auto_450890 - BLOCK
      ?auto_450891 - BLOCK
      ?auto_450892 - BLOCK
      ?auto_450893 - BLOCK
      ?auto_450894 - BLOCK
      ?auto_450895 - BLOCK
      ?auto_450896 - BLOCK
      ?auto_450897 - BLOCK
      ?auto_450898 - BLOCK
    )
    :vars
    (
      ?auto_450899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450898 ?auto_450899 ) ( ON-TABLE ?auto_450889 ) ( not ( = ?auto_450889 ?auto_450890 ) ) ( not ( = ?auto_450889 ?auto_450891 ) ) ( not ( = ?auto_450889 ?auto_450892 ) ) ( not ( = ?auto_450889 ?auto_450893 ) ) ( not ( = ?auto_450889 ?auto_450894 ) ) ( not ( = ?auto_450889 ?auto_450895 ) ) ( not ( = ?auto_450889 ?auto_450896 ) ) ( not ( = ?auto_450889 ?auto_450897 ) ) ( not ( = ?auto_450889 ?auto_450898 ) ) ( not ( = ?auto_450889 ?auto_450899 ) ) ( not ( = ?auto_450890 ?auto_450891 ) ) ( not ( = ?auto_450890 ?auto_450892 ) ) ( not ( = ?auto_450890 ?auto_450893 ) ) ( not ( = ?auto_450890 ?auto_450894 ) ) ( not ( = ?auto_450890 ?auto_450895 ) ) ( not ( = ?auto_450890 ?auto_450896 ) ) ( not ( = ?auto_450890 ?auto_450897 ) ) ( not ( = ?auto_450890 ?auto_450898 ) ) ( not ( = ?auto_450890 ?auto_450899 ) ) ( not ( = ?auto_450891 ?auto_450892 ) ) ( not ( = ?auto_450891 ?auto_450893 ) ) ( not ( = ?auto_450891 ?auto_450894 ) ) ( not ( = ?auto_450891 ?auto_450895 ) ) ( not ( = ?auto_450891 ?auto_450896 ) ) ( not ( = ?auto_450891 ?auto_450897 ) ) ( not ( = ?auto_450891 ?auto_450898 ) ) ( not ( = ?auto_450891 ?auto_450899 ) ) ( not ( = ?auto_450892 ?auto_450893 ) ) ( not ( = ?auto_450892 ?auto_450894 ) ) ( not ( = ?auto_450892 ?auto_450895 ) ) ( not ( = ?auto_450892 ?auto_450896 ) ) ( not ( = ?auto_450892 ?auto_450897 ) ) ( not ( = ?auto_450892 ?auto_450898 ) ) ( not ( = ?auto_450892 ?auto_450899 ) ) ( not ( = ?auto_450893 ?auto_450894 ) ) ( not ( = ?auto_450893 ?auto_450895 ) ) ( not ( = ?auto_450893 ?auto_450896 ) ) ( not ( = ?auto_450893 ?auto_450897 ) ) ( not ( = ?auto_450893 ?auto_450898 ) ) ( not ( = ?auto_450893 ?auto_450899 ) ) ( not ( = ?auto_450894 ?auto_450895 ) ) ( not ( = ?auto_450894 ?auto_450896 ) ) ( not ( = ?auto_450894 ?auto_450897 ) ) ( not ( = ?auto_450894 ?auto_450898 ) ) ( not ( = ?auto_450894 ?auto_450899 ) ) ( not ( = ?auto_450895 ?auto_450896 ) ) ( not ( = ?auto_450895 ?auto_450897 ) ) ( not ( = ?auto_450895 ?auto_450898 ) ) ( not ( = ?auto_450895 ?auto_450899 ) ) ( not ( = ?auto_450896 ?auto_450897 ) ) ( not ( = ?auto_450896 ?auto_450898 ) ) ( not ( = ?auto_450896 ?auto_450899 ) ) ( not ( = ?auto_450897 ?auto_450898 ) ) ( not ( = ?auto_450897 ?auto_450899 ) ) ( not ( = ?auto_450898 ?auto_450899 ) ) ( ON ?auto_450897 ?auto_450898 ) ( ON ?auto_450896 ?auto_450897 ) ( ON ?auto_450895 ?auto_450896 ) ( ON ?auto_450894 ?auto_450895 ) ( ON ?auto_450893 ?auto_450894 ) ( ON ?auto_450892 ?auto_450893 ) ( ON ?auto_450891 ?auto_450892 ) ( CLEAR ?auto_450889 ) ( ON ?auto_450890 ?auto_450891 ) ( CLEAR ?auto_450890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_450889 ?auto_450890 )
      ( MAKE-10PILE ?auto_450889 ?auto_450890 ?auto_450891 ?auto_450892 ?auto_450893 ?auto_450894 ?auto_450895 ?auto_450896 ?auto_450897 ?auto_450898 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450910 - BLOCK
      ?auto_450911 - BLOCK
      ?auto_450912 - BLOCK
      ?auto_450913 - BLOCK
      ?auto_450914 - BLOCK
      ?auto_450915 - BLOCK
      ?auto_450916 - BLOCK
      ?auto_450917 - BLOCK
      ?auto_450918 - BLOCK
      ?auto_450919 - BLOCK
    )
    :vars
    (
      ?auto_450920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450919 ?auto_450920 ) ( not ( = ?auto_450910 ?auto_450911 ) ) ( not ( = ?auto_450910 ?auto_450912 ) ) ( not ( = ?auto_450910 ?auto_450913 ) ) ( not ( = ?auto_450910 ?auto_450914 ) ) ( not ( = ?auto_450910 ?auto_450915 ) ) ( not ( = ?auto_450910 ?auto_450916 ) ) ( not ( = ?auto_450910 ?auto_450917 ) ) ( not ( = ?auto_450910 ?auto_450918 ) ) ( not ( = ?auto_450910 ?auto_450919 ) ) ( not ( = ?auto_450910 ?auto_450920 ) ) ( not ( = ?auto_450911 ?auto_450912 ) ) ( not ( = ?auto_450911 ?auto_450913 ) ) ( not ( = ?auto_450911 ?auto_450914 ) ) ( not ( = ?auto_450911 ?auto_450915 ) ) ( not ( = ?auto_450911 ?auto_450916 ) ) ( not ( = ?auto_450911 ?auto_450917 ) ) ( not ( = ?auto_450911 ?auto_450918 ) ) ( not ( = ?auto_450911 ?auto_450919 ) ) ( not ( = ?auto_450911 ?auto_450920 ) ) ( not ( = ?auto_450912 ?auto_450913 ) ) ( not ( = ?auto_450912 ?auto_450914 ) ) ( not ( = ?auto_450912 ?auto_450915 ) ) ( not ( = ?auto_450912 ?auto_450916 ) ) ( not ( = ?auto_450912 ?auto_450917 ) ) ( not ( = ?auto_450912 ?auto_450918 ) ) ( not ( = ?auto_450912 ?auto_450919 ) ) ( not ( = ?auto_450912 ?auto_450920 ) ) ( not ( = ?auto_450913 ?auto_450914 ) ) ( not ( = ?auto_450913 ?auto_450915 ) ) ( not ( = ?auto_450913 ?auto_450916 ) ) ( not ( = ?auto_450913 ?auto_450917 ) ) ( not ( = ?auto_450913 ?auto_450918 ) ) ( not ( = ?auto_450913 ?auto_450919 ) ) ( not ( = ?auto_450913 ?auto_450920 ) ) ( not ( = ?auto_450914 ?auto_450915 ) ) ( not ( = ?auto_450914 ?auto_450916 ) ) ( not ( = ?auto_450914 ?auto_450917 ) ) ( not ( = ?auto_450914 ?auto_450918 ) ) ( not ( = ?auto_450914 ?auto_450919 ) ) ( not ( = ?auto_450914 ?auto_450920 ) ) ( not ( = ?auto_450915 ?auto_450916 ) ) ( not ( = ?auto_450915 ?auto_450917 ) ) ( not ( = ?auto_450915 ?auto_450918 ) ) ( not ( = ?auto_450915 ?auto_450919 ) ) ( not ( = ?auto_450915 ?auto_450920 ) ) ( not ( = ?auto_450916 ?auto_450917 ) ) ( not ( = ?auto_450916 ?auto_450918 ) ) ( not ( = ?auto_450916 ?auto_450919 ) ) ( not ( = ?auto_450916 ?auto_450920 ) ) ( not ( = ?auto_450917 ?auto_450918 ) ) ( not ( = ?auto_450917 ?auto_450919 ) ) ( not ( = ?auto_450917 ?auto_450920 ) ) ( not ( = ?auto_450918 ?auto_450919 ) ) ( not ( = ?auto_450918 ?auto_450920 ) ) ( not ( = ?auto_450919 ?auto_450920 ) ) ( ON ?auto_450918 ?auto_450919 ) ( ON ?auto_450917 ?auto_450918 ) ( ON ?auto_450916 ?auto_450917 ) ( ON ?auto_450915 ?auto_450916 ) ( ON ?auto_450914 ?auto_450915 ) ( ON ?auto_450913 ?auto_450914 ) ( ON ?auto_450912 ?auto_450913 ) ( ON ?auto_450911 ?auto_450912 ) ( ON ?auto_450910 ?auto_450911 ) ( CLEAR ?auto_450910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450910 )
      ( MAKE-10PILE ?auto_450910 ?auto_450911 ?auto_450912 ?auto_450913 ?auto_450914 ?auto_450915 ?auto_450916 ?auto_450917 ?auto_450918 ?auto_450919 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_450931 - BLOCK
      ?auto_450932 - BLOCK
      ?auto_450933 - BLOCK
      ?auto_450934 - BLOCK
      ?auto_450935 - BLOCK
      ?auto_450936 - BLOCK
      ?auto_450937 - BLOCK
      ?auto_450938 - BLOCK
      ?auto_450939 - BLOCK
      ?auto_450940 - BLOCK
    )
    :vars
    (
      ?auto_450941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_450940 ?auto_450941 ) ( not ( = ?auto_450931 ?auto_450932 ) ) ( not ( = ?auto_450931 ?auto_450933 ) ) ( not ( = ?auto_450931 ?auto_450934 ) ) ( not ( = ?auto_450931 ?auto_450935 ) ) ( not ( = ?auto_450931 ?auto_450936 ) ) ( not ( = ?auto_450931 ?auto_450937 ) ) ( not ( = ?auto_450931 ?auto_450938 ) ) ( not ( = ?auto_450931 ?auto_450939 ) ) ( not ( = ?auto_450931 ?auto_450940 ) ) ( not ( = ?auto_450931 ?auto_450941 ) ) ( not ( = ?auto_450932 ?auto_450933 ) ) ( not ( = ?auto_450932 ?auto_450934 ) ) ( not ( = ?auto_450932 ?auto_450935 ) ) ( not ( = ?auto_450932 ?auto_450936 ) ) ( not ( = ?auto_450932 ?auto_450937 ) ) ( not ( = ?auto_450932 ?auto_450938 ) ) ( not ( = ?auto_450932 ?auto_450939 ) ) ( not ( = ?auto_450932 ?auto_450940 ) ) ( not ( = ?auto_450932 ?auto_450941 ) ) ( not ( = ?auto_450933 ?auto_450934 ) ) ( not ( = ?auto_450933 ?auto_450935 ) ) ( not ( = ?auto_450933 ?auto_450936 ) ) ( not ( = ?auto_450933 ?auto_450937 ) ) ( not ( = ?auto_450933 ?auto_450938 ) ) ( not ( = ?auto_450933 ?auto_450939 ) ) ( not ( = ?auto_450933 ?auto_450940 ) ) ( not ( = ?auto_450933 ?auto_450941 ) ) ( not ( = ?auto_450934 ?auto_450935 ) ) ( not ( = ?auto_450934 ?auto_450936 ) ) ( not ( = ?auto_450934 ?auto_450937 ) ) ( not ( = ?auto_450934 ?auto_450938 ) ) ( not ( = ?auto_450934 ?auto_450939 ) ) ( not ( = ?auto_450934 ?auto_450940 ) ) ( not ( = ?auto_450934 ?auto_450941 ) ) ( not ( = ?auto_450935 ?auto_450936 ) ) ( not ( = ?auto_450935 ?auto_450937 ) ) ( not ( = ?auto_450935 ?auto_450938 ) ) ( not ( = ?auto_450935 ?auto_450939 ) ) ( not ( = ?auto_450935 ?auto_450940 ) ) ( not ( = ?auto_450935 ?auto_450941 ) ) ( not ( = ?auto_450936 ?auto_450937 ) ) ( not ( = ?auto_450936 ?auto_450938 ) ) ( not ( = ?auto_450936 ?auto_450939 ) ) ( not ( = ?auto_450936 ?auto_450940 ) ) ( not ( = ?auto_450936 ?auto_450941 ) ) ( not ( = ?auto_450937 ?auto_450938 ) ) ( not ( = ?auto_450937 ?auto_450939 ) ) ( not ( = ?auto_450937 ?auto_450940 ) ) ( not ( = ?auto_450937 ?auto_450941 ) ) ( not ( = ?auto_450938 ?auto_450939 ) ) ( not ( = ?auto_450938 ?auto_450940 ) ) ( not ( = ?auto_450938 ?auto_450941 ) ) ( not ( = ?auto_450939 ?auto_450940 ) ) ( not ( = ?auto_450939 ?auto_450941 ) ) ( not ( = ?auto_450940 ?auto_450941 ) ) ( ON ?auto_450939 ?auto_450940 ) ( ON ?auto_450938 ?auto_450939 ) ( ON ?auto_450937 ?auto_450938 ) ( ON ?auto_450936 ?auto_450937 ) ( ON ?auto_450935 ?auto_450936 ) ( ON ?auto_450934 ?auto_450935 ) ( ON ?auto_450933 ?auto_450934 ) ( ON ?auto_450932 ?auto_450933 ) ( ON ?auto_450931 ?auto_450932 ) ( CLEAR ?auto_450931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_450931 )
      ( MAKE-10PILE ?auto_450931 ?auto_450932 ?auto_450933 ?auto_450934 ?auto_450935 ?auto_450936 ?auto_450937 ?auto_450938 ?auto_450939 ?auto_450940 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_450953 - BLOCK
      ?auto_450954 - BLOCK
      ?auto_450955 - BLOCK
      ?auto_450956 - BLOCK
      ?auto_450957 - BLOCK
      ?auto_450958 - BLOCK
      ?auto_450959 - BLOCK
      ?auto_450960 - BLOCK
      ?auto_450961 - BLOCK
      ?auto_450962 - BLOCK
      ?auto_450963 - BLOCK
    )
    :vars
    (
      ?auto_450964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450962 ) ( ON ?auto_450963 ?auto_450964 ) ( CLEAR ?auto_450963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450953 ) ( ON ?auto_450954 ?auto_450953 ) ( ON ?auto_450955 ?auto_450954 ) ( ON ?auto_450956 ?auto_450955 ) ( ON ?auto_450957 ?auto_450956 ) ( ON ?auto_450958 ?auto_450957 ) ( ON ?auto_450959 ?auto_450958 ) ( ON ?auto_450960 ?auto_450959 ) ( ON ?auto_450961 ?auto_450960 ) ( ON ?auto_450962 ?auto_450961 ) ( not ( = ?auto_450953 ?auto_450954 ) ) ( not ( = ?auto_450953 ?auto_450955 ) ) ( not ( = ?auto_450953 ?auto_450956 ) ) ( not ( = ?auto_450953 ?auto_450957 ) ) ( not ( = ?auto_450953 ?auto_450958 ) ) ( not ( = ?auto_450953 ?auto_450959 ) ) ( not ( = ?auto_450953 ?auto_450960 ) ) ( not ( = ?auto_450953 ?auto_450961 ) ) ( not ( = ?auto_450953 ?auto_450962 ) ) ( not ( = ?auto_450953 ?auto_450963 ) ) ( not ( = ?auto_450953 ?auto_450964 ) ) ( not ( = ?auto_450954 ?auto_450955 ) ) ( not ( = ?auto_450954 ?auto_450956 ) ) ( not ( = ?auto_450954 ?auto_450957 ) ) ( not ( = ?auto_450954 ?auto_450958 ) ) ( not ( = ?auto_450954 ?auto_450959 ) ) ( not ( = ?auto_450954 ?auto_450960 ) ) ( not ( = ?auto_450954 ?auto_450961 ) ) ( not ( = ?auto_450954 ?auto_450962 ) ) ( not ( = ?auto_450954 ?auto_450963 ) ) ( not ( = ?auto_450954 ?auto_450964 ) ) ( not ( = ?auto_450955 ?auto_450956 ) ) ( not ( = ?auto_450955 ?auto_450957 ) ) ( not ( = ?auto_450955 ?auto_450958 ) ) ( not ( = ?auto_450955 ?auto_450959 ) ) ( not ( = ?auto_450955 ?auto_450960 ) ) ( not ( = ?auto_450955 ?auto_450961 ) ) ( not ( = ?auto_450955 ?auto_450962 ) ) ( not ( = ?auto_450955 ?auto_450963 ) ) ( not ( = ?auto_450955 ?auto_450964 ) ) ( not ( = ?auto_450956 ?auto_450957 ) ) ( not ( = ?auto_450956 ?auto_450958 ) ) ( not ( = ?auto_450956 ?auto_450959 ) ) ( not ( = ?auto_450956 ?auto_450960 ) ) ( not ( = ?auto_450956 ?auto_450961 ) ) ( not ( = ?auto_450956 ?auto_450962 ) ) ( not ( = ?auto_450956 ?auto_450963 ) ) ( not ( = ?auto_450956 ?auto_450964 ) ) ( not ( = ?auto_450957 ?auto_450958 ) ) ( not ( = ?auto_450957 ?auto_450959 ) ) ( not ( = ?auto_450957 ?auto_450960 ) ) ( not ( = ?auto_450957 ?auto_450961 ) ) ( not ( = ?auto_450957 ?auto_450962 ) ) ( not ( = ?auto_450957 ?auto_450963 ) ) ( not ( = ?auto_450957 ?auto_450964 ) ) ( not ( = ?auto_450958 ?auto_450959 ) ) ( not ( = ?auto_450958 ?auto_450960 ) ) ( not ( = ?auto_450958 ?auto_450961 ) ) ( not ( = ?auto_450958 ?auto_450962 ) ) ( not ( = ?auto_450958 ?auto_450963 ) ) ( not ( = ?auto_450958 ?auto_450964 ) ) ( not ( = ?auto_450959 ?auto_450960 ) ) ( not ( = ?auto_450959 ?auto_450961 ) ) ( not ( = ?auto_450959 ?auto_450962 ) ) ( not ( = ?auto_450959 ?auto_450963 ) ) ( not ( = ?auto_450959 ?auto_450964 ) ) ( not ( = ?auto_450960 ?auto_450961 ) ) ( not ( = ?auto_450960 ?auto_450962 ) ) ( not ( = ?auto_450960 ?auto_450963 ) ) ( not ( = ?auto_450960 ?auto_450964 ) ) ( not ( = ?auto_450961 ?auto_450962 ) ) ( not ( = ?auto_450961 ?auto_450963 ) ) ( not ( = ?auto_450961 ?auto_450964 ) ) ( not ( = ?auto_450962 ?auto_450963 ) ) ( not ( = ?auto_450962 ?auto_450964 ) ) ( not ( = ?auto_450963 ?auto_450964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450963 ?auto_450964 )
      ( !STACK ?auto_450963 ?auto_450962 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_450976 - BLOCK
      ?auto_450977 - BLOCK
      ?auto_450978 - BLOCK
      ?auto_450979 - BLOCK
      ?auto_450980 - BLOCK
      ?auto_450981 - BLOCK
      ?auto_450982 - BLOCK
      ?auto_450983 - BLOCK
      ?auto_450984 - BLOCK
      ?auto_450985 - BLOCK
      ?auto_450986 - BLOCK
    )
    :vars
    (
      ?auto_450987 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_450985 ) ( ON ?auto_450986 ?auto_450987 ) ( CLEAR ?auto_450986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_450976 ) ( ON ?auto_450977 ?auto_450976 ) ( ON ?auto_450978 ?auto_450977 ) ( ON ?auto_450979 ?auto_450978 ) ( ON ?auto_450980 ?auto_450979 ) ( ON ?auto_450981 ?auto_450980 ) ( ON ?auto_450982 ?auto_450981 ) ( ON ?auto_450983 ?auto_450982 ) ( ON ?auto_450984 ?auto_450983 ) ( ON ?auto_450985 ?auto_450984 ) ( not ( = ?auto_450976 ?auto_450977 ) ) ( not ( = ?auto_450976 ?auto_450978 ) ) ( not ( = ?auto_450976 ?auto_450979 ) ) ( not ( = ?auto_450976 ?auto_450980 ) ) ( not ( = ?auto_450976 ?auto_450981 ) ) ( not ( = ?auto_450976 ?auto_450982 ) ) ( not ( = ?auto_450976 ?auto_450983 ) ) ( not ( = ?auto_450976 ?auto_450984 ) ) ( not ( = ?auto_450976 ?auto_450985 ) ) ( not ( = ?auto_450976 ?auto_450986 ) ) ( not ( = ?auto_450976 ?auto_450987 ) ) ( not ( = ?auto_450977 ?auto_450978 ) ) ( not ( = ?auto_450977 ?auto_450979 ) ) ( not ( = ?auto_450977 ?auto_450980 ) ) ( not ( = ?auto_450977 ?auto_450981 ) ) ( not ( = ?auto_450977 ?auto_450982 ) ) ( not ( = ?auto_450977 ?auto_450983 ) ) ( not ( = ?auto_450977 ?auto_450984 ) ) ( not ( = ?auto_450977 ?auto_450985 ) ) ( not ( = ?auto_450977 ?auto_450986 ) ) ( not ( = ?auto_450977 ?auto_450987 ) ) ( not ( = ?auto_450978 ?auto_450979 ) ) ( not ( = ?auto_450978 ?auto_450980 ) ) ( not ( = ?auto_450978 ?auto_450981 ) ) ( not ( = ?auto_450978 ?auto_450982 ) ) ( not ( = ?auto_450978 ?auto_450983 ) ) ( not ( = ?auto_450978 ?auto_450984 ) ) ( not ( = ?auto_450978 ?auto_450985 ) ) ( not ( = ?auto_450978 ?auto_450986 ) ) ( not ( = ?auto_450978 ?auto_450987 ) ) ( not ( = ?auto_450979 ?auto_450980 ) ) ( not ( = ?auto_450979 ?auto_450981 ) ) ( not ( = ?auto_450979 ?auto_450982 ) ) ( not ( = ?auto_450979 ?auto_450983 ) ) ( not ( = ?auto_450979 ?auto_450984 ) ) ( not ( = ?auto_450979 ?auto_450985 ) ) ( not ( = ?auto_450979 ?auto_450986 ) ) ( not ( = ?auto_450979 ?auto_450987 ) ) ( not ( = ?auto_450980 ?auto_450981 ) ) ( not ( = ?auto_450980 ?auto_450982 ) ) ( not ( = ?auto_450980 ?auto_450983 ) ) ( not ( = ?auto_450980 ?auto_450984 ) ) ( not ( = ?auto_450980 ?auto_450985 ) ) ( not ( = ?auto_450980 ?auto_450986 ) ) ( not ( = ?auto_450980 ?auto_450987 ) ) ( not ( = ?auto_450981 ?auto_450982 ) ) ( not ( = ?auto_450981 ?auto_450983 ) ) ( not ( = ?auto_450981 ?auto_450984 ) ) ( not ( = ?auto_450981 ?auto_450985 ) ) ( not ( = ?auto_450981 ?auto_450986 ) ) ( not ( = ?auto_450981 ?auto_450987 ) ) ( not ( = ?auto_450982 ?auto_450983 ) ) ( not ( = ?auto_450982 ?auto_450984 ) ) ( not ( = ?auto_450982 ?auto_450985 ) ) ( not ( = ?auto_450982 ?auto_450986 ) ) ( not ( = ?auto_450982 ?auto_450987 ) ) ( not ( = ?auto_450983 ?auto_450984 ) ) ( not ( = ?auto_450983 ?auto_450985 ) ) ( not ( = ?auto_450983 ?auto_450986 ) ) ( not ( = ?auto_450983 ?auto_450987 ) ) ( not ( = ?auto_450984 ?auto_450985 ) ) ( not ( = ?auto_450984 ?auto_450986 ) ) ( not ( = ?auto_450984 ?auto_450987 ) ) ( not ( = ?auto_450985 ?auto_450986 ) ) ( not ( = ?auto_450985 ?auto_450987 ) ) ( not ( = ?auto_450986 ?auto_450987 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_450986 ?auto_450987 )
      ( !STACK ?auto_450986 ?auto_450985 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_450999 - BLOCK
      ?auto_451000 - BLOCK
      ?auto_451001 - BLOCK
      ?auto_451002 - BLOCK
      ?auto_451003 - BLOCK
      ?auto_451004 - BLOCK
      ?auto_451005 - BLOCK
      ?auto_451006 - BLOCK
      ?auto_451007 - BLOCK
      ?auto_451008 - BLOCK
      ?auto_451009 - BLOCK
    )
    :vars
    (
      ?auto_451010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451009 ?auto_451010 ) ( ON-TABLE ?auto_450999 ) ( ON ?auto_451000 ?auto_450999 ) ( ON ?auto_451001 ?auto_451000 ) ( ON ?auto_451002 ?auto_451001 ) ( ON ?auto_451003 ?auto_451002 ) ( ON ?auto_451004 ?auto_451003 ) ( ON ?auto_451005 ?auto_451004 ) ( ON ?auto_451006 ?auto_451005 ) ( ON ?auto_451007 ?auto_451006 ) ( not ( = ?auto_450999 ?auto_451000 ) ) ( not ( = ?auto_450999 ?auto_451001 ) ) ( not ( = ?auto_450999 ?auto_451002 ) ) ( not ( = ?auto_450999 ?auto_451003 ) ) ( not ( = ?auto_450999 ?auto_451004 ) ) ( not ( = ?auto_450999 ?auto_451005 ) ) ( not ( = ?auto_450999 ?auto_451006 ) ) ( not ( = ?auto_450999 ?auto_451007 ) ) ( not ( = ?auto_450999 ?auto_451008 ) ) ( not ( = ?auto_450999 ?auto_451009 ) ) ( not ( = ?auto_450999 ?auto_451010 ) ) ( not ( = ?auto_451000 ?auto_451001 ) ) ( not ( = ?auto_451000 ?auto_451002 ) ) ( not ( = ?auto_451000 ?auto_451003 ) ) ( not ( = ?auto_451000 ?auto_451004 ) ) ( not ( = ?auto_451000 ?auto_451005 ) ) ( not ( = ?auto_451000 ?auto_451006 ) ) ( not ( = ?auto_451000 ?auto_451007 ) ) ( not ( = ?auto_451000 ?auto_451008 ) ) ( not ( = ?auto_451000 ?auto_451009 ) ) ( not ( = ?auto_451000 ?auto_451010 ) ) ( not ( = ?auto_451001 ?auto_451002 ) ) ( not ( = ?auto_451001 ?auto_451003 ) ) ( not ( = ?auto_451001 ?auto_451004 ) ) ( not ( = ?auto_451001 ?auto_451005 ) ) ( not ( = ?auto_451001 ?auto_451006 ) ) ( not ( = ?auto_451001 ?auto_451007 ) ) ( not ( = ?auto_451001 ?auto_451008 ) ) ( not ( = ?auto_451001 ?auto_451009 ) ) ( not ( = ?auto_451001 ?auto_451010 ) ) ( not ( = ?auto_451002 ?auto_451003 ) ) ( not ( = ?auto_451002 ?auto_451004 ) ) ( not ( = ?auto_451002 ?auto_451005 ) ) ( not ( = ?auto_451002 ?auto_451006 ) ) ( not ( = ?auto_451002 ?auto_451007 ) ) ( not ( = ?auto_451002 ?auto_451008 ) ) ( not ( = ?auto_451002 ?auto_451009 ) ) ( not ( = ?auto_451002 ?auto_451010 ) ) ( not ( = ?auto_451003 ?auto_451004 ) ) ( not ( = ?auto_451003 ?auto_451005 ) ) ( not ( = ?auto_451003 ?auto_451006 ) ) ( not ( = ?auto_451003 ?auto_451007 ) ) ( not ( = ?auto_451003 ?auto_451008 ) ) ( not ( = ?auto_451003 ?auto_451009 ) ) ( not ( = ?auto_451003 ?auto_451010 ) ) ( not ( = ?auto_451004 ?auto_451005 ) ) ( not ( = ?auto_451004 ?auto_451006 ) ) ( not ( = ?auto_451004 ?auto_451007 ) ) ( not ( = ?auto_451004 ?auto_451008 ) ) ( not ( = ?auto_451004 ?auto_451009 ) ) ( not ( = ?auto_451004 ?auto_451010 ) ) ( not ( = ?auto_451005 ?auto_451006 ) ) ( not ( = ?auto_451005 ?auto_451007 ) ) ( not ( = ?auto_451005 ?auto_451008 ) ) ( not ( = ?auto_451005 ?auto_451009 ) ) ( not ( = ?auto_451005 ?auto_451010 ) ) ( not ( = ?auto_451006 ?auto_451007 ) ) ( not ( = ?auto_451006 ?auto_451008 ) ) ( not ( = ?auto_451006 ?auto_451009 ) ) ( not ( = ?auto_451006 ?auto_451010 ) ) ( not ( = ?auto_451007 ?auto_451008 ) ) ( not ( = ?auto_451007 ?auto_451009 ) ) ( not ( = ?auto_451007 ?auto_451010 ) ) ( not ( = ?auto_451008 ?auto_451009 ) ) ( not ( = ?auto_451008 ?auto_451010 ) ) ( not ( = ?auto_451009 ?auto_451010 ) ) ( CLEAR ?auto_451007 ) ( ON ?auto_451008 ?auto_451009 ) ( CLEAR ?auto_451008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_450999 ?auto_451000 ?auto_451001 ?auto_451002 ?auto_451003 ?auto_451004 ?auto_451005 ?auto_451006 ?auto_451007 ?auto_451008 )
      ( MAKE-11PILE ?auto_450999 ?auto_451000 ?auto_451001 ?auto_451002 ?auto_451003 ?auto_451004 ?auto_451005 ?auto_451006 ?auto_451007 ?auto_451008 ?auto_451009 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451022 - BLOCK
      ?auto_451023 - BLOCK
      ?auto_451024 - BLOCK
      ?auto_451025 - BLOCK
      ?auto_451026 - BLOCK
      ?auto_451027 - BLOCK
      ?auto_451028 - BLOCK
      ?auto_451029 - BLOCK
      ?auto_451030 - BLOCK
      ?auto_451031 - BLOCK
      ?auto_451032 - BLOCK
    )
    :vars
    (
      ?auto_451033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451032 ?auto_451033 ) ( ON-TABLE ?auto_451022 ) ( ON ?auto_451023 ?auto_451022 ) ( ON ?auto_451024 ?auto_451023 ) ( ON ?auto_451025 ?auto_451024 ) ( ON ?auto_451026 ?auto_451025 ) ( ON ?auto_451027 ?auto_451026 ) ( ON ?auto_451028 ?auto_451027 ) ( ON ?auto_451029 ?auto_451028 ) ( ON ?auto_451030 ?auto_451029 ) ( not ( = ?auto_451022 ?auto_451023 ) ) ( not ( = ?auto_451022 ?auto_451024 ) ) ( not ( = ?auto_451022 ?auto_451025 ) ) ( not ( = ?auto_451022 ?auto_451026 ) ) ( not ( = ?auto_451022 ?auto_451027 ) ) ( not ( = ?auto_451022 ?auto_451028 ) ) ( not ( = ?auto_451022 ?auto_451029 ) ) ( not ( = ?auto_451022 ?auto_451030 ) ) ( not ( = ?auto_451022 ?auto_451031 ) ) ( not ( = ?auto_451022 ?auto_451032 ) ) ( not ( = ?auto_451022 ?auto_451033 ) ) ( not ( = ?auto_451023 ?auto_451024 ) ) ( not ( = ?auto_451023 ?auto_451025 ) ) ( not ( = ?auto_451023 ?auto_451026 ) ) ( not ( = ?auto_451023 ?auto_451027 ) ) ( not ( = ?auto_451023 ?auto_451028 ) ) ( not ( = ?auto_451023 ?auto_451029 ) ) ( not ( = ?auto_451023 ?auto_451030 ) ) ( not ( = ?auto_451023 ?auto_451031 ) ) ( not ( = ?auto_451023 ?auto_451032 ) ) ( not ( = ?auto_451023 ?auto_451033 ) ) ( not ( = ?auto_451024 ?auto_451025 ) ) ( not ( = ?auto_451024 ?auto_451026 ) ) ( not ( = ?auto_451024 ?auto_451027 ) ) ( not ( = ?auto_451024 ?auto_451028 ) ) ( not ( = ?auto_451024 ?auto_451029 ) ) ( not ( = ?auto_451024 ?auto_451030 ) ) ( not ( = ?auto_451024 ?auto_451031 ) ) ( not ( = ?auto_451024 ?auto_451032 ) ) ( not ( = ?auto_451024 ?auto_451033 ) ) ( not ( = ?auto_451025 ?auto_451026 ) ) ( not ( = ?auto_451025 ?auto_451027 ) ) ( not ( = ?auto_451025 ?auto_451028 ) ) ( not ( = ?auto_451025 ?auto_451029 ) ) ( not ( = ?auto_451025 ?auto_451030 ) ) ( not ( = ?auto_451025 ?auto_451031 ) ) ( not ( = ?auto_451025 ?auto_451032 ) ) ( not ( = ?auto_451025 ?auto_451033 ) ) ( not ( = ?auto_451026 ?auto_451027 ) ) ( not ( = ?auto_451026 ?auto_451028 ) ) ( not ( = ?auto_451026 ?auto_451029 ) ) ( not ( = ?auto_451026 ?auto_451030 ) ) ( not ( = ?auto_451026 ?auto_451031 ) ) ( not ( = ?auto_451026 ?auto_451032 ) ) ( not ( = ?auto_451026 ?auto_451033 ) ) ( not ( = ?auto_451027 ?auto_451028 ) ) ( not ( = ?auto_451027 ?auto_451029 ) ) ( not ( = ?auto_451027 ?auto_451030 ) ) ( not ( = ?auto_451027 ?auto_451031 ) ) ( not ( = ?auto_451027 ?auto_451032 ) ) ( not ( = ?auto_451027 ?auto_451033 ) ) ( not ( = ?auto_451028 ?auto_451029 ) ) ( not ( = ?auto_451028 ?auto_451030 ) ) ( not ( = ?auto_451028 ?auto_451031 ) ) ( not ( = ?auto_451028 ?auto_451032 ) ) ( not ( = ?auto_451028 ?auto_451033 ) ) ( not ( = ?auto_451029 ?auto_451030 ) ) ( not ( = ?auto_451029 ?auto_451031 ) ) ( not ( = ?auto_451029 ?auto_451032 ) ) ( not ( = ?auto_451029 ?auto_451033 ) ) ( not ( = ?auto_451030 ?auto_451031 ) ) ( not ( = ?auto_451030 ?auto_451032 ) ) ( not ( = ?auto_451030 ?auto_451033 ) ) ( not ( = ?auto_451031 ?auto_451032 ) ) ( not ( = ?auto_451031 ?auto_451033 ) ) ( not ( = ?auto_451032 ?auto_451033 ) ) ( CLEAR ?auto_451030 ) ( ON ?auto_451031 ?auto_451032 ) ( CLEAR ?auto_451031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_451022 ?auto_451023 ?auto_451024 ?auto_451025 ?auto_451026 ?auto_451027 ?auto_451028 ?auto_451029 ?auto_451030 ?auto_451031 )
      ( MAKE-11PILE ?auto_451022 ?auto_451023 ?auto_451024 ?auto_451025 ?auto_451026 ?auto_451027 ?auto_451028 ?auto_451029 ?auto_451030 ?auto_451031 ?auto_451032 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451045 - BLOCK
      ?auto_451046 - BLOCK
      ?auto_451047 - BLOCK
      ?auto_451048 - BLOCK
      ?auto_451049 - BLOCK
      ?auto_451050 - BLOCK
      ?auto_451051 - BLOCK
      ?auto_451052 - BLOCK
      ?auto_451053 - BLOCK
      ?auto_451054 - BLOCK
      ?auto_451055 - BLOCK
    )
    :vars
    (
      ?auto_451056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451055 ?auto_451056 ) ( ON-TABLE ?auto_451045 ) ( ON ?auto_451046 ?auto_451045 ) ( ON ?auto_451047 ?auto_451046 ) ( ON ?auto_451048 ?auto_451047 ) ( ON ?auto_451049 ?auto_451048 ) ( ON ?auto_451050 ?auto_451049 ) ( ON ?auto_451051 ?auto_451050 ) ( ON ?auto_451052 ?auto_451051 ) ( not ( = ?auto_451045 ?auto_451046 ) ) ( not ( = ?auto_451045 ?auto_451047 ) ) ( not ( = ?auto_451045 ?auto_451048 ) ) ( not ( = ?auto_451045 ?auto_451049 ) ) ( not ( = ?auto_451045 ?auto_451050 ) ) ( not ( = ?auto_451045 ?auto_451051 ) ) ( not ( = ?auto_451045 ?auto_451052 ) ) ( not ( = ?auto_451045 ?auto_451053 ) ) ( not ( = ?auto_451045 ?auto_451054 ) ) ( not ( = ?auto_451045 ?auto_451055 ) ) ( not ( = ?auto_451045 ?auto_451056 ) ) ( not ( = ?auto_451046 ?auto_451047 ) ) ( not ( = ?auto_451046 ?auto_451048 ) ) ( not ( = ?auto_451046 ?auto_451049 ) ) ( not ( = ?auto_451046 ?auto_451050 ) ) ( not ( = ?auto_451046 ?auto_451051 ) ) ( not ( = ?auto_451046 ?auto_451052 ) ) ( not ( = ?auto_451046 ?auto_451053 ) ) ( not ( = ?auto_451046 ?auto_451054 ) ) ( not ( = ?auto_451046 ?auto_451055 ) ) ( not ( = ?auto_451046 ?auto_451056 ) ) ( not ( = ?auto_451047 ?auto_451048 ) ) ( not ( = ?auto_451047 ?auto_451049 ) ) ( not ( = ?auto_451047 ?auto_451050 ) ) ( not ( = ?auto_451047 ?auto_451051 ) ) ( not ( = ?auto_451047 ?auto_451052 ) ) ( not ( = ?auto_451047 ?auto_451053 ) ) ( not ( = ?auto_451047 ?auto_451054 ) ) ( not ( = ?auto_451047 ?auto_451055 ) ) ( not ( = ?auto_451047 ?auto_451056 ) ) ( not ( = ?auto_451048 ?auto_451049 ) ) ( not ( = ?auto_451048 ?auto_451050 ) ) ( not ( = ?auto_451048 ?auto_451051 ) ) ( not ( = ?auto_451048 ?auto_451052 ) ) ( not ( = ?auto_451048 ?auto_451053 ) ) ( not ( = ?auto_451048 ?auto_451054 ) ) ( not ( = ?auto_451048 ?auto_451055 ) ) ( not ( = ?auto_451048 ?auto_451056 ) ) ( not ( = ?auto_451049 ?auto_451050 ) ) ( not ( = ?auto_451049 ?auto_451051 ) ) ( not ( = ?auto_451049 ?auto_451052 ) ) ( not ( = ?auto_451049 ?auto_451053 ) ) ( not ( = ?auto_451049 ?auto_451054 ) ) ( not ( = ?auto_451049 ?auto_451055 ) ) ( not ( = ?auto_451049 ?auto_451056 ) ) ( not ( = ?auto_451050 ?auto_451051 ) ) ( not ( = ?auto_451050 ?auto_451052 ) ) ( not ( = ?auto_451050 ?auto_451053 ) ) ( not ( = ?auto_451050 ?auto_451054 ) ) ( not ( = ?auto_451050 ?auto_451055 ) ) ( not ( = ?auto_451050 ?auto_451056 ) ) ( not ( = ?auto_451051 ?auto_451052 ) ) ( not ( = ?auto_451051 ?auto_451053 ) ) ( not ( = ?auto_451051 ?auto_451054 ) ) ( not ( = ?auto_451051 ?auto_451055 ) ) ( not ( = ?auto_451051 ?auto_451056 ) ) ( not ( = ?auto_451052 ?auto_451053 ) ) ( not ( = ?auto_451052 ?auto_451054 ) ) ( not ( = ?auto_451052 ?auto_451055 ) ) ( not ( = ?auto_451052 ?auto_451056 ) ) ( not ( = ?auto_451053 ?auto_451054 ) ) ( not ( = ?auto_451053 ?auto_451055 ) ) ( not ( = ?auto_451053 ?auto_451056 ) ) ( not ( = ?auto_451054 ?auto_451055 ) ) ( not ( = ?auto_451054 ?auto_451056 ) ) ( not ( = ?auto_451055 ?auto_451056 ) ) ( ON ?auto_451054 ?auto_451055 ) ( CLEAR ?auto_451052 ) ( ON ?auto_451053 ?auto_451054 ) ( CLEAR ?auto_451053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_451045 ?auto_451046 ?auto_451047 ?auto_451048 ?auto_451049 ?auto_451050 ?auto_451051 ?auto_451052 ?auto_451053 )
      ( MAKE-11PILE ?auto_451045 ?auto_451046 ?auto_451047 ?auto_451048 ?auto_451049 ?auto_451050 ?auto_451051 ?auto_451052 ?auto_451053 ?auto_451054 ?auto_451055 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451068 - BLOCK
      ?auto_451069 - BLOCK
      ?auto_451070 - BLOCK
      ?auto_451071 - BLOCK
      ?auto_451072 - BLOCK
      ?auto_451073 - BLOCK
      ?auto_451074 - BLOCK
      ?auto_451075 - BLOCK
      ?auto_451076 - BLOCK
      ?auto_451077 - BLOCK
      ?auto_451078 - BLOCK
    )
    :vars
    (
      ?auto_451079 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451078 ?auto_451079 ) ( ON-TABLE ?auto_451068 ) ( ON ?auto_451069 ?auto_451068 ) ( ON ?auto_451070 ?auto_451069 ) ( ON ?auto_451071 ?auto_451070 ) ( ON ?auto_451072 ?auto_451071 ) ( ON ?auto_451073 ?auto_451072 ) ( ON ?auto_451074 ?auto_451073 ) ( ON ?auto_451075 ?auto_451074 ) ( not ( = ?auto_451068 ?auto_451069 ) ) ( not ( = ?auto_451068 ?auto_451070 ) ) ( not ( = ?auto_451068 ?auto_451071 ) ) ( not ( = ?auto_451068 ?auto_451072 ) ) ( not ( = ?auto_451068 ?auto_451073 ) ) ( not ( = ?auto_451068 ?auto_451074 ) ) ( not ( = ?auto_451068 ?auto_451075 ) ) ( not ( = ?auto_451068 ?auto_451076 ) ) ( not ( = ?auto_451068 ?auto_451077 ) ) ( not ( = ?auto_451068 ?auto_451078 ) ) ( not ( = ?auto_451068 ?auto_451079 ) ) ( not ( = ?auto_451069 ?auto_451070 ) ) ( not ( = ?auto_451069 ?auto_451071 ) ) ( not ( = ?auto_451069 ?auto_451072 ) ) ( not ( = ?auto_451069 ?auto_451073 ) ) ( not ( = ?auto_451069 ?auto_451074 ) ) ( not ( = ?auto_451069 ?auto_451075 ) ) ( not ( = ?auto_451069 ?auto_451076 ) ) ( not ( = ?auto_451069 ?auto_451077 ) ) ( not ( = ?auto_451069 ?auto_451078 ) ) ( not ( = ?auto_451069 ?auto_451079 ) ) ( not ( = ?auto_451070 ?auto_451071 ) ) ( not ( = ?auto_451070 ?auto_451072 ) ) ( not ( = ?auto_451070 ?auto_451073 ) ) ( not ( = ?auto_451070 ?auto_451074 ) ) ( not ( = ?auto_451070 ?auto_451075 ) ) ( not ( = ?auto_451070 ?auto_451076 ) ) ( not ( = ?auto_451070 ?auto_451077 ) ) ( not ( = ?auto_451070 ?auto_451078 ) ) ( not ( = ?auto_451070 ?auto_451079 ) ) ( not ( = ?auto_451071 ?auto_451072 ) ) ( not ( = ?auto_451071 ?auto_451073 ) ) ( not ( = ?auto_451071 ?auto_451074 ) ) ( not ( = ?auto_451071 ?auto_451075 ) ) ( not ( = ?auto_451071 ?auto_451076 ) ) ( not ( = ?auto_451071 ?auto_451077 ) ) ( not ( = ?auto_451071 ?auto_451078 ) ) ( not ( = ?auto_451071 ?auto_451079 ) ) ( not ( = ?auto_451072 ?auto_451073 ) ) ( not ( = ?auto_451072 ?auto_451074 ) ) ( not ( = ?auto_451072 ?auto_451075 ) ) ( not ( = ?auto_451072 ?auto_451076 ) ) ( not ( = ?auto_451072 ?auto_451077 ) ) ( not ( = ?auto_451072 ?auto_451078 ) ) ( not ( = ?auto_451072 ?auto_451079 ) ) ( not ( = ?auto_451073 ?auto_451074 ) ) ( not ( = ?auto_451073 ?auto_451075 ) ) ( not ( = ?auto_451073 ?auto_451076 ) ) ( not ( = ?auto_451073 ?auto_451077 ) ) ( not ( = ?auto_451073 ?auto_451078 ) ) ( not ( = ?auto_451073 ?auto_451079 ) ) ( not ( = ?auto_451074 ?auto_451075 ) ) ( not ( = ?auto_451074 ?auto_451076 ) ) ( not ( = ?auto_451074 ?auto_451077 ) ) ( not ( = ?auto_451074 ?auto_451078 ) ) ( not ( = ?auto_451074 ?auto_451079 ) ) ( not ( = ?auto_451075 ?auto_451076 ) ) ( not ( = ?auto_451075 ?auto_451077 ) ) ( not ( = ?auto_451075 ?auto_451078 ) ) ( not ( = ?auto_451075 ?auto_451079 ) ) ( not ( = ?auto_451076 ?auto_451077 ) ) ( not ( = ?auto_451076 ?auto_451078 ) ) ( not ( = ?auto_451076 ?auto_451079 ) ) ( not ( = ?auto_451077 ?auto_451078 ) ) ( not ( = ?auto_451077 ?auto_451079 ) ) ( not ( = ?auto_451078 ?auto_451079 ) ) ( ON ?auto_451077 ?auto_451078 ) ( CLEAR ?auto_451075 ) ( ON ?auto_451076 ?auto_451077 ) ( CLEAR ?auto_451076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_451068 ?auto_451069 ?auto_451070 ?auto_451071 ?auto_451072 ?auto_451073 ?auto_451074 ?auto_451075 ?auto_451076 )
      ( MAKE-11PILE ?auto_451068 ?auto_451069 ?auto_451070 ?auto_451071 ?auto_451072 ?auto_451073 ?auto_451074 ?auto_451075 ?auto_451076 ?auto_451077 ?auto_451078 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451091 - BLOCK
      ?auto_451092 - BLOCK
      ?auto_451093 - BLOCK
      ?auto_451094 - BLOCK
      ?auto_451095 - BLOCK
      ?auto_451096 - BLOCK
      ?auto_451097 - BLOCK
      ?auto_451098 - BLOCK
      ?auto_451099 - BLOCK
      ?auto_451100 - BLOCK
      ?auto_451101 - BLOCK
    )
    :vars
    (
      ?auto_451102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451101 ?auto_451102 ) ( ON-TABLE ?auto_451091 ) ( ON ?auto_451092 ?auto_451091 ) ( ON ?auto_451093 ?auto_451092 ) ( ON ?auto_451094 ?auto_451093 ) ( ON ?auto_451095 ?auto_451094 ) ( ON ?auto_451096 ?auto_451095 ) ( ON ?auto_451097 ?auto_451096 ) ( not ( = ?auto_451091 ?auto_451092 ) ) ( not ( = ?auto_451091 ?auto_451093 ) ) ( not ( = ?auto_451091 ?auto_451094 ) ) ( not ( = ?auto_451091 ?auto_451095 ) ) ( not ( = ?auto_451091 ?auto_451096 ) ) ( not ( = ?auto_451091 ?auto_451097 ) ) ( not ( = ?auto_451091 ?auto_451098 ) ) ( not ( = ?auto_451091 ?auto_451099 ) ) ( not ( = ?auto_451091 ?auto_451100 ) ) ( not ( = ?auto_451091 ?auto_451101 ) ) ( not ( = ?auto_451091 ?auto_451102 ) ) ( not ( = ?auto_451092 ?auto_451093 ) ) ( not ( = ?auto_451092 ?auto_451094 ) ) ( not ( = ?auto_451092 ?auto_451095 ) ) ( not ( = ?auto_451092 ?auto_451096 ) ) ( not ( = ?auto_451092 ?auto_451097 ) ) ( not ( = ?auto_451092 ?auto_451098 ) ) ( not ( = ?auto_451092 ?auto_451099 ) ) ( not ( = ?auto_451092 ?auto_451100 ) ) ( not ( = ?auto_451092 ?auto_451101 ) ) ( not ( = ?auto_451092 ?auto_451102 ) ) ( not ( = ?auto_451093 ?auto_451094 ) ) ( not ( = ?auto_451093 ?auto_451095 ) ) ( not ( = ?auto_451093 ?auto_451096 ) ) ( not ( = ?auto_451093 ?auto_451097 ) ) ( not ( = ?auto_451093 ?auto_451098 ) ) ( not ( = ?auto_451093 ?auto_451099 ) ) ( not ( = ?auto_451093 ?auto_451100 ) ) ( not ( = ?auto_451093 ?auto_451101 ) ) ( not ( = ?auto_451093 ?auto_451102 ) ) ( not ( = ?auto_451094 ?auto_451095 ) ) ( not ( = ?auto_451094 ?auto_451096 ) ) ( not ( = ?auto_451094 ?auto_451097 ) ) ( not ( = ?auto_451094 ?auto_451098 ) ) ( not ( = ?auto_451094 ?auto_451099 ) ) ( not ( = ?auto_451094 ?auto_451100 ) ) ( not ( = ?auto_451094 ?auto_451101 ) ) ( not ( = ?auto_451094 ?auto_451102 ) ) ( not ( = ?auto_451095 ?auto_451096 ) ) ( not ( = ?auto_451095 ?auto_451097 ) ) ( not ( = ?auto_451095 ?auto_451098 ) ) ( not ( = ?auto_451095 ?auto_451099 ) ) ( not ( = ?auto_451095 ?auto_451100 ) ) ( not ( = ?auto_451095 ?auto_451101 ) ) ( not ( = ?auto_451095 ?auto_451102 ) ) ( not ( = ?auto_451096 ?auto_451097 ) ) ( not ( = ?auto_451096 ?auto_451098 ) ) ( not ( = ?auto_451096 ?auto_451099 ) ) ( not ( = ?auto_451096 ?auto_451100 ) ) ( not ( = ?auto_451096 ?auto_451101 ) ) ( not ( = ?auto_451096 ?auto_451102 ) ) ( not ( = ?auto_451097 ?auto_451098 ) ) ( not ( = ?auto_451097 ?auto_451099 ) ) ( not ( = ?auto_451097 ?auto_451100 ) ) ( not ( = ?auto_451097 ?auto_451101 ) ) ( not ( = ?auto_451097 ?auto_451102 ) ) ( not ( = ?auto_451098 ?auto_451099 ) ) ( not ( = ?auto_451098 ?auto_451100 ) ) ( not ( = ?auto_451098 ?auto_451101 ) ) ( not ( = ?auto_451098 ?auto_451102 ) ) ( not ( = ?auto_451099 ?auto_451100 ) ) ( not ( = ?auto_451099 ?auto_451101 ) ) ( not ( = ?auto_451099 ?auto_451102 ) ) ( not ( = ?auto_451100 ?auto_451101 ) ) ( not ( = ?auto_451100 ?auto_451102 ) ) ( not ( = ?auto_451101 ?auto_451102 ) ) ( ON ?auto_451100 ?auto_451101 ) ( ON ?auto_451099 ?auto_451100 ) ( CLEAR ?auto_451097 ) ( ON ?auto_451098 ?auto_451099 ) ( CLEAR ?auto_451098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_451091 ?auto_451092 ?auto_451093 ?auto_451094 ?auto_451095 ?auto_451096 ?auto_451097 ?auto_451098 )
      ( MAKE-11PILE ?auto_451091 ?auto_451092 ?auto_451093 ?auto_451094 ?auto_451095 ?auto_451096 ?auto_451097 ?auto_451098 ?auto_451099 ?auto_451100 ?auto_451101 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451114 - BLOCK
      ?auto_451115 - BLOCK
      ?auto_451116 - BLOCK
      ?auto_451117 - BLOCK
      ?auto_451118 - BLOCK
      ?auto_451119 - BLOCK
      ?auto_451120 - BLOCK
      ?auto_451121 - BLOCK
      ?auto_451122 - BLOCK
      ?auto_451123 - BLOCK
      ?auto_451124 - BLOCK
    )
    :vars
    (
      ?auto_451125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451124 ?auto_451125 ) ( ON-TABLE ?auto_451114 ) ( ON ?auto_451115 ?auto_451114 ) ( ON ?auto_451116 ?auto_451115 ) ( ON ?auto_451117 ?auto_451116 ) ( ON ?auto_451118 ?auto_451117 ) ( ON ?auto_451119 ?auto_451118 ) ( ON ?auto_451120 ?auto_451119 ) ( not ( = ?auto_451114 ?auto_451115 ) ) ( not ( = ?auto_451114 ?auto_451116 ) ) ( not ( = ?auto_451114 ?auto_451117 ) ) ( not ( = ?auto_451114 ?auto_451118 ) ) ( not ( = ?auto_451114 ?auto_451119 ) ) ( not ( = ?auto_451114 ?auto_451120 ) ) ( not ( = ?auto_451114 ?auto_451121 ) ) ( not ( = ?auto_451114 ?auto_451122 ) ) ( not ( = ?auto_451114 ?auto_451123 ) ) ( not ( = ?auto_451114 ?auto_451124 ) ) ( not ( = ?auto_451114 ?auto_451125 ) ) ( not ( = ?auto_451115 ?auto_451116 ) ) ( not ( = ?auto_451115 ?auto_451117 ) ) ( not ( = ?auto_451115 ?auto_451118 ) ) ( not ( = ?auto_451115 ?auto_451119 ) ) ( not ( = ?auto_451115 ?auto_451120 ) ) ( not ( = ?auto_451115 ?auto_451121 ) ) ( not ( = ?auto_451115 ?auto_451122 ) ) ( not ( = ?auto_451115 ?auto_451123 ) ) ( not ( = ?auto_451115 ?auto_451124 ) ) ( not ( = ?auto_451115 ?auto_451125 ) ) ( not ( = ?auto_451116 ?auto_451117 ) ) ( not ( = ?auto_451116 ?auto_451118 ) ) ( not ( = ?auto_451116 ?auto_451119 ) ) ( not ( = ?auto_451116 ?auto_451120 ) ) ( not ( = ?auto_451116 ?auto_451121 ) ) ( not ( = ?auto_451116 ?auto_451122 ) ) ( not ( = ?auto_451116 ?auto_451123 ) ) ( not ( = ?auto_451116 ?auto_451124 ) ) ( not ( = ?auto_451116 ?auto_451125 ) ) ( not ( = ?auto_451117 ?auto_451118 ) ) ( not ( = ?auto_451117 ?auto_451119 ) ) ( not ( = ?auto_451117 ?auto_451120 ) ) ( not ( = ?auto_451117 ?auto_451121 ) ) ( not ( = ?auto_451117 ?auto_451122 ) ) ( not ( = ?auto_451117 ?auto_451123 ) ) ( not ( = ?auto_451117 ?auto_451124 ) ) ( not ( = ?auto_451117 ?auto_451125 ) ) ( not ( = ?auto_451118 ?auto_451119 ) ) ( not ( = ?auto_451118 ?auto_451120 ) ) ( not ( = ?auto_451118 ?auto_451121 ) ) ( not ( = ?auto_451118 ?auto_451122 ) ) ( not ( = ?auto_451118 ?auto_451123 ) ) ( not ( = ?auto_451118 ?auto_451124 ) ) ( not ( = ?auto_451118 ?auto_451125 ) ) ( not ( = ?auto_451119 ?auto_451120 ) ) ( not ( = ?auto_451119 ?auto_451121 ) ) ( not ( = ?auto_451119 ?auto_451122 ) ) ( not ( = ?auto_451119 ?auto_451123 ) ) ( not ( = ?auto_451119 ?auto_451124 ) ) ( not ( = ?auto_451119 ?auto_451125 ) ) ( not ( = ?auto_451120 ?auto_451121 ) ) ( not ( = ?auto_451120 ?auto_451122 ) ) ( not ( = ?auto_451120 ?auto_451123 ) ) ( not ( = ?auto_451120 ?auto_451124 ) ) ( not ( = ?auto_451120 ?auto_451125 ) ) ( not ( = ?auto_451121 ?auto_451122 ) ) ( not ( = ?auto_451121 ?auto_451123 ) ) ( not ( = ?auto_451121 ?auto_451124 ) ) ( not ( = ?auto_451121 ?auto_451125 ) ) ( not ( = ?auto_451122 ?auto_451123 ) ) ( not ( = ?auto_451122 ?auto_451124 ) ) ( not ( = ?auto_451122 ?auto_451125 ) ) ( not ( = ?auto_451123 ?auto_451124 ) ) ( not ( = ?auto_451123 ?auto_451125 ) ) ( not ( = ?auto_451124 ?auto_451125 ) ) ( ON ?auto_451123 ?auto_451124 ) ( ON ?auto_451122 ?auto_451123 ) ( CLEAR ?auto_451120 ) ( ON ?auto_451121 ?auto_451122 ) ( CLEAR ?auto_451121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_451114 ?auto_451115 ?auto_451116 ?auto_451117 ?auto_451118 ?auto_451119 ?auto_451120 ?auto_451121 )
      ( MAKE-11PILE ?auto_451114 ?auto_451115 ?auto_451116 ?auto_451117 ?auto_451118 ?auto_451119 ?auto_451120 ?auto_451121 ?auto_451122 ?auto_451123 ?auto_451124 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451137 - BLOCK
      ?auto_451138 - BLOCK
      ?auto_451139 - BLOCK
      ?auto_451140 - BLOCK
      ?auto_451141 - BLOCK
      ?auto_451142 - BLOCK
      ?auto_451143 - BLOCK
      ?auto_451144 - BLOCK
      ?auto_451145 - BLOCK
      ?auto_451146 - BLOCK
      ?auto_451147 - BLOCK
    )
    :vars
    (
      ?auto_451148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451147 ?auto_451148 ) ( ON-TABLE ?auto_451137 ) ( ON ?auto_451138 ?auto_451137 ) ( ON ?auto_451139 ?auto_451138 ) ( ON ?auto_451140 ?auto_451139 ) ( ON ?auto_451141 ?auto_451140 ) ( ON ?auto_451142 ?auto_451141 ) ( not ( = ?auto_451137 ?auto_451138 ) ) ( not ( = ?auto_451137 ?auto_451139 ) ) ( not ( = ?auto_451137 ?auto_451140 ) ) ( not ( = ?auto_451137 ?auto_451141 ) ) ( not ( = ?auto_451137 ?auto_451142 ) ) ( not ( = ?auto_451137 ?auto_451143 ) ) ( not ( = ?auto_451137 ?auto_451144 ) ) ( not ( = ?auto_451137 ?auto_451145 ) ) ( not ( = ?auto_451137 ?auto_451146 ) ) ( not ( = ?auto_451137 ?auto_451147 ) ) ( not ( = ?auto_451137 ?auto_451148 ) ) ( not ( = ?auto_451138 ?auto_451139 ) ) ( not ( = ?auto_451138 ?auto_451140 ) ) ( not ( = ?auto_451138 ?auto_451141 ) ) ( not ( = ?auto_451138 ?auto_451142 ) ) ( not ( = ?auto_451138 ?auto_451143 ) ) ( not ( = ?auto_451138 ?auto_451144 ) ) ( not ( = ?auto_451138 ?auto_451145 ) ) ( not ( = ?auto_451138 ?auto_451146 ) ) ( not ( = ?auto_451138 ?auto_451147 ) ) ( not ( = ?auto_451138 ?auto_451148 ) ) ( not ( = ?auto_451139 ?auto_451140 ) ) ( not ( = ?auto_451139 ?auto_451141 ) ) ( not ( = ?auto_451139 ?auto_451142 ) ) ( not ( = ?auto_451139 ?auto_451143 ) ) ( not ( = ?auto_451139 ?auto_451144 ) ) ( not ( = ?auto_451139 ?auto_451145 ) ) ( not ( = ?auto_451139 ?auto_451146 ) ) ( not ( = ?auto_451139 ?auto_451147 ) ) ( not ( = ?auto_451139 ?auto_451148 ) ) ( not ( = ?auto_451140 ?auto_451141 ) ) ( not ( = ?auto_451140 ?auto_451142 ) ) ( not ( = ?auto_451140 ?auto_451143 ) ) ( not ( = ?auto_451140 ?auto_451144 ) ) ( not ( = ?auto_451140 ?auto_451145 ) ) ( not ( = ?auto_451140 ?auto_451146 ) ) ( not ( = ?auto_451140 ?auto_451147 ) ) ( not ( = ?auto_451140 ?auto_451148 ) ) ( not ( = ?auto_451141 ?auto_451142 ) ) ( not ( = ?auto_451141 ?auto_451143 ) ) ( not ( = ?auto_451141 ?auto_451144 ) ) ( not ( = ?auto_451141 ?auto_451145 ) ) ( not ( = ?auto_451141 ?auto_451146 ) ) ( not ( = ?auto_451141 ?auto_451147 ) ) ( not ( = ?auto_451141 ?auto_451148 ) ) ( not ( = ?auto_451142 ?auto_451143 ) ) ( not ( = ?auto_451142 ?auto_451144 ) ) ( not ( = ?auto_451142 ?auto_451145 ) ) ( not ( = ?auto_451142 ?auto_451146 ) ) ( not ( = ?auto_451142 ?auto_451147 ) ) ( not ( = ?auto_451142 ?auto_451148 ) ) ( not ( = ?auto_451143 ?auto_451144 ) ) ( not ( = ?auto_451143 ?auto_451145 ) ) ( not ( = ?auto_451143 ?auto_451146 ) ) ( not ( = ?auto_451143 ?auto_451147 ) ) ( not ( = ?auto_451143 ?auto_451148 ) ) ( not ( = ?auto_451144 ?auto_451145 ) ) ( not ( = ?auto_451144 ?auto_451146 ) ) ( not ( = ?auto_451144 ?auto_451147 ) ) ( not ( = ?auto_451144 ?auto_451148 ) ) ( not ( = ?auto_451145 ?auto_451146 ) ) ( not ( = ?auto_451145 ?auto_451147 ) ) ( not ( = ?auto_451145 ?auto_451148 ) ) ( not ( = ?auto_451146 ?auto_451147 ) ) ( not ( = ?auto_451146 ?auto_451148 ) ) ( not ( = ?auto_451147 ?auto_451148 ) ) ( ON ?auto_451146 ?auto_451147 ) ( ON ?auto_451145 ?auto_451146 ) ( ON ?auto_451144 ?auto_451145 ) ( CLEAR ?auto_451142 ) ( ON ?auto_451143 ?auto_451144 ) ( CLEAR ?auto_451143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_451137 ?auto_451138 ?auto_451139 ?auto_451140 ?auto_451141 ?auto_451142 ?auto_451143 )
      ( MAKE-11PILE ?auto_451137 ?auto_451138 ?auto_451139 ?auto_451140 ?auto_451141 ?auto_451142 ?auto_451143 ?auto_451144 ?auto_451145 ?auto_451146 ?auto_451147 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451160 - BLOCK
      ?auto_451161 - BLOCK
      ?auto_451162 - BLOCK
      ?auto_451163 - BLOCK
      ?auto_451164 - BLOCK
      ?auto_451165 - BLOCK
      ?auto_451166 - BLOCK
      ?auto_451167 - BLOCK
      ?auto_451168 - BLOCK
      ?auto_451169 - BLOCK
      ?auto_451170 - BLOCK
    )
    :vars
    (
      ?auto_451171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451170 ?auto_451171 ) ( ON-TABLE ?auto_451160 ) ( ON ?auto_451161 ?auto_451160 ) ( ON ?auto_451162 ?auto_451161 ) ( ON ?auto_451163 ?auto_451162 ) ( ON ?auto_451164 ?auto_451163 ) ( ON ?auto_451165 ?auto_451164 ) ( not ( = ?auto_451160 ?auto_451161 ) ) ( not ( = ?auto_451160 ?auto_451162 ) ) ( not ( = ?auto_451160 ?auto_451163 ) ) ( not ( = ?auto_451160 ?auto_451164 ) ) ( not ( = ?auto_451160 ?auto_451165 ) ) ( not ( = ?auto_451160 ?auto_451166 ) ) ( not ( = ?auto_451160 ?auto_451167 ) ) ( not ( = ?auto_451160 ?auto_451168 ) ) ( not ( = ?auto_451160 ?auto_451169 ) ) ( not ( = ?auto_451160 ?auto_451170 ) ) ( not ( = ?auto_451160 ?auto_451171 ) ) ( not ( = ?auto_451161 ?auto_451162 ) ) ( not ( = ?auto_451161 ?auto_451163 ) ) ( not ( = ?auto_451161 ?auto_451164 ) ) ( not ( = ?auto_451161 ?auto_451165 ) ) ( not ( = ?auto_451161 ?auto_451166 ) ) ( not ( = ?auto_451161 ?auto_451167 ) ) ( not ( = ?auto_451161 ?auto_451168 ) ) ( not ( = ?auto_451161 ?auto_451169 ) ) ( not ( = ?auto_451161 ?auto_451170 ) ) ( not ( = ?auto_451161 ?auto_451171 ) ) ( not ( = ?auto_451162 ?auto_451163 ) ) ( not ( = ?auto_451162 ?auto_451164 ) ) ( not ( = ?auto_451162 ?auto_451165 ) ) ( not ( = ?auto_451162 ?auto_451166 ) ) ( not ( = ?auto_451162 ?auto_451167 ) ) ( not ( = ?auto_451162 ?auto_451168 ) ) ( not ( = ?auto_451162 ?auto_451169 ) ) ( not ( = ?auto_451162 ?auto_451170 ) ) ( not ( = ?auto_451162 ?auto_451171 ) ) ( not ( = ?auto_451163 ?auto_451164 ) ) ( not ( = ?auto_451163 ?auto_451165 ) ) ( not ( = ?auto_451163 ?auto_451166 ) ) ( not ( = ?auto_451163 ?auto_451167 ) ) ( not ( = ?auto_451163 ?auto_451168 ) ) ( not ( = ?auto_451163 ?auto_451169 ) ) ( not ( = ?auto_451163 ?auto_451170 ) ) ( not ( = ?auto_451163 ?auto_451171 ) ) ( not ( = ?auto_451164 ?auto_451165 ) ) ( not ( = ?auto_451164 ?auto_451166 ) ) ( not ( = ?auto_451164 ?auto_451167 ) ) ( not ( = ?auto_451164 ?auto_451168 ) ) ( not ( = ?auto_451164 ?auto_451169 ) ) ( not ( = ?auto_451164 ?auto_451170 ) ) ( not ( = ?auto_451164 ?auto_451171 ) ) ( not ( = ?auto_451165 ?auto_451166 ) ) ( not ( = ?auto_451165 ?auto_451167 ) ) ( not ( = ?auto_451165 ?auto_451168 ) ) ( not ( = ?auto_451165 ?auto_451169 ) ) ( not ( = ?auto_451165 ?auto_451170 ) ) ( not ( = ?auto_451165 ?auto_451171 ) ) ( not ( = ?auto_451166 ?auto_451167 ) ) ( not ( = ?auto_451166 ?auto_451168 ) ) ( not ( = ?auto_451166 ?auto_451169 ) ) ( not ( = ?auto_451166 ?auto_451170 ) ) ( not ( = ?auto_451166 ?auto_451171 ) ) ( not ( = ?auto_451167 ?auto_451168 ) ) ( not ( = ?auto_451167 ?auto_451169 ) ) ( not ( = ?auto_451167 ?auto_451170 ) ) ( not ( = ?auto_451167 ?auto_451171 ) ) ( not ( = ?auto_451168 ?auto_451169 ) ) ( not ( = ?auto_451168 ?auto_451170 ) ) ( not ( = ?auto_451168 ?auto_451171 ) ) ( not ( = ?auto_451169 ?auto_451170 ) ) ( not ( = ?auto_451169 ?auto_451171 ) ) ( not ( = ?auto_451170 ?auto_451171 ) ) ( ON ?auto_451169 ?auto_451170 ) ( ON ?auto_451168 ?auto_451169 ) ( ON ?auto_451167 ?auto_451168 ) ( CLEAR ?auto_451165 ) ( ON ?auto_451166 ?auto_451167 ) ( CLEAR ?auto_451166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_451160 ?auto_451161 ?auto_451162 ?auto_451163 ?auto_451164 ?auto_451165 ?auto_451166 )
      ( MAKE-11PILE ?auto_451160 ?auto_451161 ?auto_451162 ?auto_451163 ?auto_451164 ?auto_451165 ?auto_451166 ?auto_451167 ?auto_451168 ?auto_451169 ?auto_451170 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451183 - BLOCK
      ?auto_451184 - BLOCK
      ?auto_451185 - BLOCK
      ?auto_451186 - BLOCK
      ?auto_451187 - BLOCK
      ?auto_451188 - BLOCK
      ?auto_451189 - BLOCK
      ?auto_451190 - BLOCK
      ?auto_451191 - BLOCK
      ?auto_451192 - BLOCK
      ?auto_451193 - BLOCK
    )
    :vars
    (
      ?auto_451194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451193 ?auto_451194 ) ( ON-TABLE ?auto_451183 ) ( ON ?auto_451184 ?auto_451183 ) ( ON ?auto_451185 ?auto_451184 ) ( ON ?auto_451186 ?auto_451185 ) ( ON ?auto_451187 ?auto_451186 ) ( not ( = ?auto_451183 ?auto_451184 ) ) ( not ( = ?auto_451183 ?auto_451185 ) ) ( not ( = ?auto_451183 ?auto_451186 ) ) ( not ( = ?auto_451183 ?auto_451187 ) ) ( not ( = ?auto_451183 ?auto_451188 ) ) ( not ( = ?auto_451183 ?auto_451189 ) ) ( not ( = ?auto_451183 ?auto_451190 ) ) ( not ( = ?auto_451183 ?auto_451191 ) ) ( not ( = ?auto_451183 ?auto_451192 ) ) ( not ( = ?auto_451183 ?auto_451193 ) ) ( not ( = ?auto_451183 ?auto_451194 ) ) ( not ( = ?auto_451184 ?auto_451185 ) ) ( not ( = ?auto_451184 ?auto_451186 ) ) ( not ( = ?auto_451184 ?auto_451187 ) ) ( not ( = ?auto_451184 ?auto_451188 ) ) ( not ( = ?auto_451184 ?auto_451189 ) ) ( not ( = ?auto_451184 ?auto_451190 ) ) ( not ( = ?auto_451184 ?auto_451191 ) ) ( not ( = ?auto_451184 ?auto_451192 ) ) ( not ( = ?auto_451184 ?auto_451193 ) ) ( not ( = ?auto_451184 ?auto_451194 ) ) ( not ( = ?auto_451185 ?auto_451186 ) ) ( not ( = ?auto_451185 ?auto_451187 ) ) ( not ( = ?auto_451185 ?auto_451188 ) ) ( not ( = ?auto_451185 ?auto_451189 ) ) ( not ( = ?auto_451185 ?auto_451190 ) ) ( not ( = ?auto_451185 ?auto_451191 ) ) ( not ( = ?auto_451185 ?auto_451192 ) ) ( not ( = ?auto_451185 ?auto_451193 ) ) ( not ( = ?auto_451185 ?auto_451194 ) ) ( not ( = ?auto_451186 ?auto_451187 ) ) ( not ( = ?auto_451186 ?auto_451188 ) ) ( not ( = ?auto_451186 ?auto_451189 ) ) ( not ( = ?auto_451186 ?auto_451190 ) ) ( not ( = ?auto_451186 ?auto_451191 ) ) ( not ( = ?auto_451186 ?auto_451192 ) ) ( not ( = ?auto_451186 ?auto_451193 ) ) ( not ( = ?auto_451186 ?auto_451194 ) ) ( not ( = ?auto_451187 ?auto_451188 ) ) ( not ( = ?auto_451187 ?auto_451189 ) ) ( not ( = ?auto_451187 ?auto_451190 ) ) ( not ( = ?auto_451187 ?auto_451191 ) ) ( not ( = ?auto_451187 ?auto_451192 ) ) ( not ( = ?auto_451187 ?auto_451193 ) ) ( not ( = ?auto_451187 ?auto_451194 ) ) ( not ( = ?auto_451188 ?auto_451189 ) ) ( not ( = ?auto_451188 ?auto_451190 ) ) ( not ( = ?auto_451188 ?auto_451191 ) ) ( not ( = ?auto_451188 ?auto_451192 ) ) ( not ( = ?auto_451188 ?auto_451193 ) ) ( not ( = ?auto_451188 ?auto_451194 ) ) ( not ( = ?auto_451189 ?auto_451190 ) ) ( not ( = ?auto_451189 ?auto_451191 ) ) ( not ( = ?auto_451189 ?auto_451192 ) ) ( not ( = ?auto_451189 ?auto_451193 ) ) ( not ( = ?auto_451189 ?auto_451194 ) ) ( not ( = ?auto_451190 ?auto_451191 ) ) ( not ( = ?auto_451190 ?auto_451192 ) ) ( not ( = ?auto_451190 ?auto_451193 ) ) ( not ( = ?auto_451190 ?auto_451194 ) ) ( not ( = ?auto_451191 ?auto_451192 ) ) ( not ( = ?auto_451191 ?auto_451193 ) ) ( not ( = ?auto_451191 ?auto_451194 ) ) ( not ( = ?auto_451192 ?auto_451193 ) ) ( not ( = ?auto_451192 ?auto_451194 ) ) ( not ( = ?auto_451193 ?auto_451194 ) ) ( ON ?auto_451192 ?auto_451193 ) ( ON ?auto_451191 ?auto_451192 ) ( ON ?auto_451190 ?auto_451191 ) ( ON ?auto_451189 ?auto_451190 ) ( CLEAR ?auto_451187 ) ( ON ?auto_451188 ?auto_451189 ) ( CLEAR ?auto_451188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_451183 ?auto_451184 ?auto_451185 ?auto_451186 ?auto_451187 ?auto_451188 )
      ( MAKE-11PILE ?auto_451183 ?auto_451184 ?auto_451185 ?auto_451186 ?auto_451187 ?auto_451188 ?auto_451189 ?auto_451190 ?auto_451191 ?auto_451192 ?auto_451193 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451206 - BLOCK
      ?auto_451207 - BLOCK
      ?auto_451208 - BLOCK
      ?auto_451209 - BLOCK
      ?auto_451210 - BLOCK
      ?auto_451211 - BLOCK
      ?auto_451212 - BLOCK
      ?auto_451213 - BLOCK
      ?auto_451214 - BLOCK
      ?auto_451215 - BLOCK
      ?auto_451216 - BLOCK
    )
    :vars
    (
      ?auto_451217 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451216 ?auto_451217 ) ( ON-TABLE ?auto_451206 ) ( ON ?auto_451207 ?auto_451206 ) ( ON ?auto_451208 ?auto_451207 ) ( ON ?auto_451209 ?auto_451208 ) ( ON ?auto_451210 ?auto_451209 ) ( not ( = ?auto_451206 ?auto_451207 ) ) ( not ( = ?auto_451206 ?auto_451208 ) ) ( not ( = ?auto_451206 ?auto_451209 ) ) ( not ( = ?auto_451206 ?auto_451210 ) ) ( not ( = ?auto_451206 ?auto_451211 ) ) ( not ( = ?auto_451206 ?auto_451212 ) ) ( not ( = ?auto_451206 ?auto_451213 ) ) ( not ( = ?auto_451206 ?auto_451214 ) ) ( not ( = ?auto_451206 ?auto_451215 ) ) ( not ( = ?auto_451206 ?auto_451216 ) ) ( not ( = ?auto_451206 ?auto_451217 ) ) ( not ( = ?auto_451207 ?auto_451208 ) ) ( not ( = ?auto_451207 ?auto_451209 ) ) ( not ( = ?auto_451207 ?auto_451210 ) ) ( not ( = ?auto_451207 ?auto_451211 ) ) ( not ( = ?auto_451207 ?auto_451212 ) ) ( not ( = ?auto_451207 ?auto_451213 ) ) ( not ( = ?auto_451207 ?auto_451214 ) ) ( not ( = ?auto_451207 ?auto_451215 ) ) ( not ( = ?auto_451207 ?auto_451216 ) ) ( not ( = ?auto_451207 ?auto_451217 ) ) ( not ( = ?auto_451208 ?auto_451209 ) ) ( not ( = ?auto_451208 ?auto_451210 ) ) ( not ( = ?auto_451208 ?auto_451211 ) ) ( not ( = ?auto_451208 ?auto_451212 ) ) ( not ( = ?auto_451208 ?auto_451213 ) ) ( not ( = ?auto_451208 ?auto_451214 ) ) ( not ( = ?auto_451208 ?auto_451215 ) ) ( not ( = ?auto_451208 ?auto_451216 ) ) ( not ( = ?auto_451208 ?auto_451217 ) ) ( not ( = ?auto_451209 ?auto_451210 ) ) ( not ( = ?auto_451209 ?auto_451211 ) ) ( not ( = ?auto_451209 ?auto_451212 ) ) ( not ( = ?auto_451209 ?auto_451213 ) ) ( not ( = ?auto_451209 ?auto_451214 ) ) ( not ( = ?auto_451209 ?auto_451215 ) ) ( not ( = ?auto_451209 ?auto_451216 ) ) ( not ( = ?auto_451209 ?auto_451217 ) ) ( not ( = ?auto_451210 ?auto_451211 ) ) ( not ( = ?auto_451210 ?auto_451212 ) ) ( not ( = ?auto_451210 ?auto_451213 ) ) ( not ( = ?auto_451210 ?auto_451214 ) ) ( not ( = ?auto_451210 ?auto_451215 ) ) ( not ( = ?auto_451210 ?auto_451216 ) ) ( not ( = ?auto_451210 ?auto_451217 ) ) ( not ( = ?auto_451211 ?auto_451212 ) ) ( not ( = ?auto_451211 ?auto_451213 ) ) ( not ( = ?auto_451211 ?auto_451214 ) ) ( not ( = ?auto_451211 ?auto_451215 ) ) ( not ( = ?auto_451211 ?auto_451216 ) ) ( not ( = ?auto_451211 ?auto_451217 ) ) ( not ( = ?auto_451212 ?auto_451213 ) ) ( not ( = ?auto_451212 ?auto_451214 ) ) ( not ( = ?auto_451212 ?auto_451215 ) ) ( not ( = ?auto_451212 ?auto_451216 ) ) ( not ( = ?auto_451212 ?auto_451217 ) ) ( not ( = ?auto_451213 ?auto_451214 ) ) ( not ( = ?auto_451213 ?auto_451215 ) ) ( not ( = ?auto_451213 ?auto_451216 ) ) ( not ( = ?auto_451213 ?auto_451217 ) ) ( not ( = ?auto_451214 ?auto_451215 ) ) ( not ( = ?auto_451214 ?auto_451216 ) ) ( not ( = ?auto_451214 ?auto_451217 ) ) ( not ( = ?auto_451215 ?auto_451216 ) ) ( not ( = ?auto_451215 ?auto_451217 ) ) ( not ( = ?auto_451216 ?auto_451217 ) ) ( ON ?auto_451215 ?auto_451216 ) ( ON ?auto_451214 ?auto_451215 ) ( ON ?auto_451213 ?auto_451214 ) ( ON ?auto_451212 ?auto_451213 ) ( CLEAR ?auto_451210 ) ( ON ?auto_451211 ?auto_451212 ) ( CLEAR ?auto_451211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_451206 ?auto_451207 ?auto_451208 ?auto_451209 ?auto_451210 ?auto_451211 )
      ( MAKE-11PILE ?auto_451206 ?auto_451207 ?auto_451208 ?auto_451209 ?auto_451210 ?auto_451211 ?auto_451212 ?auto_451213 ?auto_451214 ?auto_451215 ?auto_451216 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451229 - BLOCK
      ?auto_451230 - BLOCK
      ?auto_451231 - BLOCK
      ?auto_451232 - BLOCK
      ?auto_451233 - BLOCK
      ?auto_451234 - BLOCK
      ?auto_451235 - BLOCK
      ?auto_451236 - BLOCK
      ?auto_451237 - BLOCK
      ?auto_451238 - BLOCK
      ?auto_451239 - BLOCK
    )
    :vars
    (
      ?auto_451240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451239 ?auto_451240 ) ( ON-TABLE ?auto_451229 ) ( ON ?auto_451230 ?auto_451229 ) ( ON ?auto_451231 ?auto_451230 ) ( ON ?auto_451232 ?auto_451231 ) ( not ( = ?auto_451229 ?auto_451230 ) ) ( not ( = ?auto_451229 ?auto_451231 ) ) ( not ( = ?auto_451229 ?auto_451232 ) ) ( not ( = ?auto_451229 ?auto_451233 ) ) ( not ( = ?auto_451229 ?auto_451234 ) ) ( not ( = ?auto_451229 ?auto_451235 ) ) ( not ( = ?auto_451229 ?auto_451236 ) ) ( not ( = ?auto_451229 ?auto_451237 ) ) ( not ( = ?auto_451229 ?auto_451238 ) ) ( not ( = ?auto_451229 ?auto_451239 ) ) ( not ( = ?auto_451229 ?auto_451240 ) ) ( not ( = ?auto_451230 ?auto_451231 ) ) ( not ( = ?auto_451230 ?auto_451232 ) ) ( not ( = ?auto_451230 ?auto_451233 ) ) ( not ( = ?auto_451230 ?auto_451234 ) ) ( not ( = ?auto_451230 ?auto_451235 ) ) ( not ( = ?auto_451230 ?auto_451236 ) ) ( not ( = ?auto_451230 ?auto_451237 ) ) ( not ( = ?auto_451230 ?auto_451238 ) ) ( not ( = ?auto_451230 ?auto_451239 ) ) ( not ( = ?auto_451230 ?auto_451240 ) ) ( not ( = ?auto_451231 ?auto_451232 ) ) ( not ( = ?auto_451231 ?auto_451233 ) ) ( not ( = ?auto_451231 ?auto_451234 ) ) ( not ( = ?auto_451231 ?auto_451235 ) ) ( not ( = ?auto_451231 ?auto_451236 ) ) ( not ( = ?auto_451231 ?auto_451237 ) ) ( not ( = ?auto_451231 ?auto_451238 ) ) ( not ( = ?auto_451231 ?auto_451239 ) ) ( not ( = ?auto_451231 ?auto_451240 ) ) ( not ( = ?auto_451232 ?auto_451233 ) ) ( not ( = ?auto_451232 ?auto_451234 ) ) ( not ( = ?auto_451232 ?auto_451235 ) ) ( not ( = ?auto_451232 ?auto_451236 ) ) ( not ( = ?auto_451232 ?auto_451237 ) ) ( not ( = ?auto_451232 ?auto_451238 ) ) ( not ( = ?auto_451232 ?auto_451239 ) ) ( not ( = ?auto_451232 ?auto_451240 ) ) ( not ( = ?auto_451233 ?auto_451234 ) ) ( not ( = ?auto_451233 ?auto_451235 ) ) ( not ( = ?auto_451233 ?auto_451236 ) ) ( not ( = ?auto_451233 ?auto_451237 ) ) ( not ( = ?auto_451233 ?auto_451238 ) ) ( not ( = ?auto_451233 ?auto_451239 ) ) ( not ( = ?auto_451233 ?auto_451240 ) ) ( not ( = ?auto_451234 ?auto_451235 ) ) ( not ( = ?auto_451234 ?auto_451236 ) ) ( not ( = ?auto_451234 ?auto_451237 ) ) ( not ( = ?auto_451234 ?auto_451238 ) ) ( not ( = ?auto_451234 ?auto_451239 ) ) ( not ( = ?auto_451234 ?auto_451240 ) ) ( not ( = ?auto_451235 ?auto_451236 ) ) ( not ( = ?auto_451235 ?auto_451237 ) ) ( not ( = ?auto_451235 ?auto_451238 ) ) ( not ( = ?auto_451235 ?auto_451239 ) ) ( not ( = ?auto_451235 ?auto_451240 ) ) ( not ( = ?auto_451236 ?auto_451237 ) ) ( not ( = ?auto_451236 ?auto_451238 ) ) ( not ( = ?auto_451236 ?auto_451239 ) ) ( not ( = ?auto_451236 ?auto_451240 ) ) ( not ( = ?auto_451237 ?auto_451238 ) ) ( not ( = ?auto_451237 ?auto_451239 ) ) ( not ( = ?auto_451237 ?auto_451240 ) ) ( not ( = ?auto_451238 ?auto_451239 ) ) ( not ( = ?auto_451238 ?auto_451240 ) ) ( not ( = ?auto_451239 ?auto_451240 ) ) ( ON ?auto_451238 ?auto_451239 ) ( ON ?auto_451237 ?auto_451238 ) ( ON ?auto_451236 ?auto_451237 ) ( ON ?auto_451235 ?auto_451236 ) ( ON ?auto_451234 ?auto_451235 ) ( CLEAR ?auto_451232 ) ( ON ?auto_451233 ?auto_451234 ) ( CLEAR ?auto_451233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_451229 ?auto_451230 ?auto_451231 ?auto_451232 ?auto_451233 )
      ( MAKE-11PILE ?auto_451229 ?auto_451230 ?auto_451231 ?auto_451232 ?auto_451233 ?auto_451234 ?auto_451235 ?auto_451236 ?auto_451237 ?auto_451238 ?auto_451239 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451252 - BLOCK
      ?auto_451253 - BLOCK
      ?auto_451254 - BLOCK
      ?auto_451255 - BLOCK
      ?auto_451256 - BLOCK
      ?auto_451257 - BLOCK
      ?auto_451258 - BLOCK
      ?auto_451259 - BLOCK
      ?auto_451260 - BLOCK
      ?auto_451261 - BLOCK
      ?auto_451262 - BLOCK
    )
    :vars
    (
      ?auto_451263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451262 ?auto_451263 ) ( ON-TABLE ?auto_451252 ) ( ON ?auto_451253 ?auto_451252 ) ( ON ?auto_451254 ?auto_451253 ) ( ON ?auto_451255 ?auto_451254 ) ( not ( = ?auto_451252 ?auto_451253 ) ) ( not ( = ?auto_451252 ?auto_451254 ) ) ( not ( = ?auto_451252 ?auto_451255 ) ) ( not ( = ?auto_451252 ?auto_451256 ) ) ( not ( = ?auto_451252 ?auto_451257 ) ) ( not ( = ?auto_451252 ?auto_451258 ) ) ( not ( = ?auto_451252 ?auto_451259 ) ) ( not ( = ?auto_451252 ?auto_451260 ) ) ( not ( = ?auto_451252 ?auto_451261 ) ) ( not ( = ?auto_451252 ?auto_451262 ) ) ( not ( = ?auto_451252 ?auto_451263 ) ) ( not ( = ?auto_451253 ?auto_451254 ) ) ( not ( = ?auto_451253 ?auto_451255 ) ) ( not ( = ?auto_451253 ?auto_451256 ) ) ( not ( = ?auto_451253 ?auto_451257 ) ) ( not ( = ?auto_451253 ?auto_451258 ) ) ( not ( = ?auto_451253 ?auto_451259 ) ) ( not ( = ?auto_451253 ?auto_451260 ) ) ( not ( = ?auto_451253 ?auto_451261 ) ) ( not ( = ?auto_451253 ?auto_451262 ) ) ( not ( = ?auto_451253 ?auto_451263 ) ) ( not ( = ?auto_451254 ?auto_451255 ) ) ( not ( = ?auto_451254 ?auto_451256 ) ) ( not ( = ?auto_451254 ?auto_451257 ) ) ( not ( = ?auto_451254 ?auto_451258 ) ) ( not ( = ?auto_451254 ?auto_451259 ) ) ( not ( = ?auto_451254 ?auto_451260 ) ) ( not ( = ?auto_451254 ?auto_451261 ) ) ( not ( = ?auto_451254 ?auto_451262 ) ) ( not ( = ?auto_451254 ?auto_451263 ) ) ( not ( = ?auto_451255 ?auto_451256 ) ) ( not ( = ?auto_451255 ?auto_451257 ) ) ( not ( = ?auto_451255 ?auto_451258 ) ) ( not ( = ?auto_451255 ?auto_451259 ) ) ( not ( = ?auto_451255 ?auto_451260 ) ) ( not ( = ?auto_451255 ?auto_451261 ) ) ( not ( = ?auto_451255 ?auto_451262 ) ) ( not ( = ?auto_451255 ?auto_451263 ) ) ( not ( = ?auto_451256 ?auto_451257 ) ) ( not ( = ?auto_451256 ?auto_451258 ) ) ( not ( = ?auto_451256 ?auto_451259 ) ) ( not ( = ?auto_451256 ?auto_451260 ) ) ( not ( = ?auto_451256 ?auto_451261 ) ) ( not ( = ?auto_451256 ?auto_451262 ) ) ( not ( = ?auto_451256 ?auto_451263 ) ) ( not ( = ?auto_451257 ?auto_451258 ) ) ( not ( = ?auto_451257 ?auto_451259 ) ) ( not ( = ?auto_451257 ?auto_451260 ) ) ( not ( = ?auto_451257 ?auto_451261 ) ) ( not ( = ?auto_451257 ?auto_451262 ) ) ( not ( = ?auto_451257 ?auto_451263 ) ) ( not ( = ?auto_451258 ?auto_451259 ) ) ( not ( = ?auto_451258 ?auto_451260 ) ) ( not ( = ?auto_451258 ?auto_451261 ) ) ( not ( = ?auto_451258 ?auto_451262 ) ) ( not ( = ?auto_451258 ?auto_451263 ) ) ( not ( = ?auto_451259 ?auto_451260 ) ) ( not ( = ?auto_451259 ?auto_451261 ) ) ( not ( = ?auto_451259 ?auto_451262 ) ) ( not ( = ?auto_451259 ?auto_451263 ) ) ( not ( = ?auto_451260 ?auto_451261 ) ) ( not ( = ?auto_451260 ?auto_451262 ) ) ( not ( = ?auto_451260 ?auto_451263 ) ) ( not ( = ?auto_451261 ?auto_451262 ) ) ( not ( = ?auto_451261 ?auto_451263 ) ) ( not ( = ?auto_451262 ?auto_451263 ) ) ( ON ?auto_451261 ?auto_451262 ) ( ON ?auto_451260 ?auto_451261 ) ( ON ?auto_451259 ?auto_451260 ) ( ON ?auto_451258 ?auto_451259 ) ( ON ?auto_451257 ?auto_451258 ) ( CLEAR ?auto_451255 ) ( ON ?auto_451256 ?auto_451257 ) ( CLEAR ?auto_451256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_451252 ?auto_451253 ?auto_451254 ?auto_451255 ?auto_451256 )
      ( MAKE-11PILE ?auto_451252 ?auto_451253 ?auto_451254 ?auto_451255 ?auto_451256 ?auto_451257 ?auto_451258 ?auto_451259 ?auto_451260 ?auto_451261 ?auto_451262 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451275 - BLOCK
      ?auto_451276 - BLOCK
      ?auto_451277 - BLOCK
      ?auto_451278 - BLOCK
      ?auto_451279 - BLOCK
      ?auto_451280 - BLOCK
      ?auto_451281 - BLOCK
      ?auto_451282 - BLOCK
      ?auto_451283 - BLOCK
      ?auto_451284 - BLOCK
      ?auto_451285 - BLOCK
    )
    :vars
    (
      ?auto_451286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451285 ?auto_451286 ) ( ON-TABLE ?auto_451275 ) ( ON ?auto_451276 ?auto_451275 ) ( ON ?auto_451277 ?auto_451276 ) ( not ( = ?auto_451275 ?auto_451276 ) ) ( not ( = ?auto_451275 ?auto_451277 ) ) ( not ( = ?auto_451275 ?auto_451278 ) ) ( not ( = ?auto_451275 ?auto_451279 ) ) ( not ( = ?auto_451275 ?auto_451280 ) ) ( not ( = ?auto_451275 ?auto_451281 ) ) ( not ( = ?auto_451275 ?auto_451282 ) ) ( not ( = ?auto_451275 ?auto_451283 ) ) ( not ( = ?auto_451275 ?auto_451284 ) ) ( not ( = ?auto_451275 ?auto_451285 ) ) ( not ( = ?auto_451275 ?auto_451286 ) ) ( not ( = ?auto_451276 ?auto_451277 ) ) ( not ( = ?auto_451276 ?auto_451278 ) ) ( not ( = ?auto_451276 ?auto_451279 ) ) ( not ( = ?auto_451276 ?auto_451280 ) ) ( not ( = ?auto_451276 ?auto_451281 ) ) ( not ( = ?auto_451276 ?auto_451282 ) ) ( not ( = ?auto_451276 ?auto_451283 ) ) ( not ( = ?auto_451276 ?auto_451284 ) ) ( not ( = ?auto_451276 ?auto_451285 ) ) ( not ( = ?auto_451276 ?auto_451286 ) ) ( not ( = ?auto_451277 ?auto_451278 ) ) ( not ( = ?auto_451277 ?auto_451279 ) ) ( not ( = ?auto_451277 ?auto_451280 ) ) ( not ( = ?auto_451277 ?auto_451281 ) ) ( not ( = ?auto_451277 ?auto_451282 ) ) ( not ( = ?auto_451277 ?auto_451283 ) ) ( not ( = ?auto_451277 ?auto_451284 ) ) ( not ( = ?auto_451277 ?auto_451285 ) ) ( not ( = ?auto_451277 ?auto_451286 ) ) ( not ( = ?auto_451278 ?auto_451279 ) ) ( not ( = ?auto_451278 ?auto_451280 ) ) ( not ( = ?auto_451278 ?auto_451281 ) ) ( not ( = ?auto_451278 ?auto_451282 ) ) ( not ( = ?auto_451278 ?auto_451283 ) ) ( not ( = ?auto_451278 ?auto_451284 ) ) ( not ( = ?auto_451278 ?auto_451285 ) ) ( not ( = ?auto_451278 ?auto_451286 ) ) ( not ( = ?auto_451279 ?auto_451280 ) ) ( not ( = ?auto_451279 ?auto_451281 ) ) ( not ( = ?auto_451279 ?auto_451282 ) ) ( not ( = ?auto_451279 ?auto_451283 ) ) ( not ( = ?auto_451279 ?auto_451284 ) ) ( not ( = ?auto_451279 ?auto_451285 ) ) ( not ( = ?auto_451279 ?auto_451286 ) ) ( not ( = ?auto_451280 ?auto_451281 ) ) ( not ( = ?auto_451280 ?auto_451282 ) ) ( not ( = ?auto_451280 ?auto_451283 ) ) ( not ( = ?auto_451280 ?auto_451284 ) ) ( not ( = ?auto_451280 ?auto_451285 ) ) ( not ( = ?auto_451280 ?auto_451286 ) ) ( not ( = ?auto_451281 ?auto_451282 ) ) ( not ( = ?auto_451281 ?auto_451283 ) ) ( not ( = ?auto_451281 ?auto_451284 ) ) ( not ( = ?auto_451281 ?auto_451285 ) ) ( not ( = ?auto_451281 ?auto_451286 ) ) ( not ( = ?auto_451282 ?auto_451283 ) ) ( not ( = ?auto_451282 ?auto_451284 ) ) ( not ( = ?auto_451282 ?auto_451285 ) ) ( not ( = ?auto_451282 ?auto_451286 ) ) ( not ( = ?auto_451283 ?auto_451284 ) ) ( not ( = ?auto_451283 ?auto_451285 ) ) ( not ( = ?auto_451283 ?auto_451286 ) ) ( not ( = ?auto_451284 ?auto_451285 ) ) ( not ( = ?auto_451284 ?auto_451286 ) ) ( not ( = ?auto_451285 ?auto_451286 ) ) ( ON ?auto_451284 ?auto_451285 ) ( ON ?auto_451283 ?auto_451284 ) ( ON ?auto_451282 ?auto_451283 ) ( ON ?auto_451281 ?auto_451282 ) ( ON ?auto_451280 ?auto_451281 ) ( ON ?auto_451279 ?auto_451280 ) ( CLEAR ?auto_451277 ) ( ON ?auto_451278 ?auto_451279 ) ( CLEAR ?auto_451278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_451275 ?auto_451276 ?auto_451277 ?auto_451278 )
      ( MAKE-11PILE ?auto_451275 ?auto_451276 ?auto_451277 ?auto_451278 ?auto_451279 ?auto_451280 ?auto_451281 ?auto_451282 ?auto_451283 ?auto_451284 ?auto_451285 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451298 - BLOCK
      ?auto_451299 - BLOCK
      ?auto_451300 - BLOCK
      ?auto_451301 - BLOCK
      ?auto_451302 - BLOCK
      ?auto_451303 - BLOCK
      ?auto_451304 - BLOCK
      ?auto_451305 - BLOCK
      ?auto_451306 - BLOCK
      ?auto_451307 - BLOCK
      ?auto_451308 - BLOCK
    )
    :vars
    (
      ?auto_451309 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451308 ?auto_451309 ) ( ON-TABLE ?auto_451298 ) ( ON ?auto_451299 ?auto_451298 ) ( ON ?auto_451300 ?auto_451299 ) ( not ( = ?auto_451298 ?auto_451299 ) ) ( not ( = ?auto_451298 ?auto_451300 ) ) ( not ( = ?auto_451298 ?auto_451301 ) ) ( not ( = ?auto_451298 ?auto_451302 ) ) ( not ( = ?auto_451298 ?auto_451303 ) ) ( not ( = ?auto_451298 ?auto_451304 ) ) ( not ( = ?auto_451298 ?auto_451305 ) ) ( not ( = ?auto_451298 ?auto_451306 ) ) ( not ( = ?auto_451298 ?auto_451307 ) ) ( not ( = ?auto_451298 ?auto_451308 ) ) ( not ( = ?auto_451298 ?auto_451309 ) ) ( not ( = ?auto_451299 ?auto_451300 ) ) ( not ( = ?auto_451299 ?auto_451301 ) ) ( not ( = ?auto_451299 ?auto_451302 ) ) ( not ( = ?auto_451299 ?auto_451303 ) ) ( not ( = ?auto_451299 ?auto_451304 ) ) ( not ( = ?auto_451299 ?auto_451305 ) ) ( not ( = ?auto_451299 ?auto_451306 ) ) ( not ( = ?auto_451299 ?auto_451307 ) ) ( not ( = ?auto_451299 ?auto_451308 ) ) ( not ( = ?auto_451299 ?auto_451309 ) ) ( not ( = ?auto_451300 ?auto_451301 ) ) ( not ( = ?auto_451300 ?auto_451302 ) ) ( not ( = ?auto_451300 ?auto_451303 ) ) ( not ( = ?auto_451300 ?auto_451304 ) ) ( not ( = ?auto_451300 ?auto_451305 ) ) ( not ( = ?auto_451300 ?auto_451306 ) ) ( not ( = ?auto_451300 ?auto_451307 ) ) ( not ( = ?auto_451300 ?auto_451308 ) ) ( not ( = ?auto_451300 ?auto_451309 ) ) ( not ( = ?auto_451301 ?auto_451302 ) ) ( not ( = ?auto_451301 ?auto_451303 ) ) ( not ( = ?auto_451301 ?auto_451304 ) ) ( not ( = ?auto_451301 ?auto_451305 ) ) ( not ( = ?auto_451301 ?auto_451306 ) ) ( not ( = ?auto_451301 ?auto_451307 ) ) ( not ( = ?auto_451301 ?auto_451308 ) ) ( not ( = ?auto_451301 ?auto_451309 ) ) ( not ( = ?auto_451302 ?auto_451303 ) ) ( not ( = ?auto_451302 ?auto_451304 ) ) ( not ( = ?auto_451302 ?auto_451305 ) ) ( not ( = ?auto_451302 ?auto_451306 ) ) ( not ( = ?auto_451302 ?auto_451307 ) ) ( not ( = ?auto_451302 ?auto_451308 ) ) ( not ( = ?auto_451302 ?auto_451309 ) ) ( not ( = ?auto_451303 ?auto_451304 ) ) ( not ( = ?auto_451303 ?auto_451305 ) ) ( not ( = ?auto_451303 ?auto_451306 ) ) ( not ( = ?auto_451303 ?auto_451307 ) ) ( not ( = ?auto_451303 ?auto_451308 ) ) ( not ( = ?auto_451303 ?auto_451309 ) ) ( not ( = ?auto_451304 ?auto_451305 ) ) ( not ( = ?auto_451304 ?auto_451306 ) ) ( not ( = ?auto_451304 ?auto_451307 ) ) ( not ( = ?auto_451304 ?auto_451308 ) ) ( not ( = ?auto_451304 ?auto_451309 ) ) ( not ( = ?auto_451305 ?auto_451306 ) ) ( not ( = ?auto_451305 ?auto_451307 ) ) ( not ( = ?auto_451305 ?auto_451308 ) ) ( not ( = ?auto_451305 ?auto_451309 ) ) ( not ( = ?auto_451306 ?auto_451307 ) ) ( not ( = ?auto_451306 ?auto_451308 ) ) ( not ( = ?auto_451306 ?auto_451309 ) ) ( not ( = ?auto_451307 ?auto_451308 ) ) ( not ( = ?auto_451307 ?auto_451309 ) ) ( not ( = ?auto_451308 ?auto_451309 ) ) ( ON ?auto_451307 ?auto_451308 ) ( ON ?auto_451306 ?auto_451307 ) ( ON ?auto_451305 ?auto_451306 ) ( ON ?auto_451304 ?auto_451305 ) ( ON ?auto_451303 ?auto_451304 ) ( ON ?auto_451302 ?auto_451303 ) ( CLEAR ?auto_451300 ) ( ON ?auto_451301 ?auto_451302 ) ( CLEAR ?auto_451301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_451298 ?auto_451299 ?auto_451300 ?auto_451301 )
      ( MAKE-11PILE ?auto_451298 ?auto_451299 ?auto_451300 ?auto_451301 ?auto_451302 ?auto_451303 ?auto_451304 ?auto_451305 ?auto_451306 ?auto_451307 ?auto_451308 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451321 - BLOCK
      ?auto_451322 - BLOCK
      ?auto_451323 - BLOCK
      ?auto_451324 - BLOCK
      ?auto_451325 - BLOCK
      ?auto_451326 - BLOCK
      ?auto_451327 - BLOCK
      ?auto_451328 - BLOCK
      ?auto_451329 - BLOCK
      ?auto_451330 - BLOCK
      ?auto_451331 - BLOCK
    )
    :vars
    (
      ?auto_451332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451331 ?auto_451332 ) ( ON-TABLE ?auto_451321 ) ( ON ?auto_451322 ?auto_451321 ) ( not ( = ?auto_451321 ?auto_451322 ) ) ( not ( = ?auto_451321 ?auto_451323 ) ) ( not ( = ?auto_451321 ?auto_451324 ) ) ( not ( = ?auto_451321 ?auto_451325 ) ) ( not ( = ?auto_451321 ?auto_451326 ) ) ( not ( = ?auto_451321 ?auto_451327 ) ) ( not ( = ?auto_451321 ?auto_451328 ) ) ( not ( = ?auto_451321 ?auto_451329 ) ) ( not ( = ?auto_451321 ?auto_451330 ) ) ( not ( = ?auto_451321 ?auto_451331 ) ) ( not ( = ?auto_451321 ?auto_451332 ) ) ( not ( = ?auto_451322 ?auto_451323 ) ) ( not ( = ?auto_451322 ?auto_451324 ) ) ( not ( = ?auto_451322 ?auto_451325 ) ) ( not ( = ?auto_451322 ?auto_451326 ) ) ( not ( = ?auto_451322 ?auto_451327 ) ) ( not ( = ?auto_451322 ?auto_451328 ) ) ( not ( = ?auto_451322 ?auto_451329 ) ) ( not ( = ?auto_451322 ?auto_451330 ) ) ( not ( = ?auto_451322 ?auto_451331 ) ) ( not ( = ?auto_451322 ?auto_451332 ) ) ( not ( = ?auto_451323 ?auto_451324 ) ) ( not ( = ?auto_451323 ?auto_451325 ) ) ( not ( = ?auto_451323 ?auto_451326 ) ) ( not ( = ?auto_451323 ?auto_451327 ) ) ( not ( = ?auto_451323 ?auto_451328 ) ) ( not ( = ?auto_451323 ?auto_451329 ) ) ( not ( = ?auto_451323 ?auto_451330 ) ) ( not ( = ?auto_451323 ?auto_451331 ) ) ( not ( = ?auto_451323 ?auto_451332 ) ) ( not ( = ?auto_451324 ?auto_451325 ) ) ( not ( = ?auto_451324 ?auto_451326 ) ) ( not ( = ?auto_451324 ?auto_451327 ) ) ( not ( = ?auto_451324 ?auto_451328 ) ) ( not ( = ?auto_451324 ?auto_451329 ) ) ( not ( = ?auto_451324 ?auto_451330 ) ) ( not ( = ?auto_451324 ?auto_451331 ) ) ( not ( = ?auto_451324 ?auto_451332 ) ) ( not ( = ?auto_451325 ?auto_451326 ) ) ( not ( = ?auto_451325 ?auto_451327 ) ) ( not ( = ?auto_451325 ?auto_451328 ) ) ( not ( = ?auto_451325 ?auto_451329 ) ) ( not ( = ?auto_451325 ?auto_451330 ) ) ( not ( = ?auto_451325 ?auto_451331 ) ) ( not ( = ?auto_451325 ?auto_451332 ) ) ( not ( = ?auto_451326 ?auto_451327 ) ) ( not ( = ?auto_451326 ?auto_451328 ) ) ( not ( = ?auto_451326 ?auto_451329 ) ) ( not ( = ?auto_451326 ?auto_451330 ) ) ( not ( = ?auto_451326 ?auto_451331 ) ) ( not ( = ?auto_451326 ?auto_451332 ) ) ( not ( = ?auto_451327 ?auto_451328 ) ) ( not ( = ?auto_451327 ?auto_451329 ) ) ( not ( = ?auto_451327 ?auto_451330 ) ) ( not ( = ?auto_451327 ?auto_451331 ) ) ( not ( = ?auto_451327 ?auto_451332 ) ) ( not ( = ?auto_451328 ?auto_451329 ) ) ( not ( = ?auto_451328 ?auto_451330 ) ) ( not ( = ?auto_451328 ?auto_451331 ) ) ( not ( = ?auto_451328 ?auto_451332 ) ) ( not ( = ?auto_451329 ?auto_451330 ) ) ( not ( = ?auto_451329 ?auto_451331 ) ) ( not ( = ?auto_451329 ?auto_451332 ) ) ( not ( = ?auto_451330 ?auto_451331 ) ) ( not ( = ?auto_451330 ?auto_451332 ) ) ( not ( = ?auto_451331 ?auto_451332 ) ) ( ON ?auto_451330 ?auto_451331 ) ( ON ?auto_451329 ?auto_451330 ) ( ON ?auto_451328 ?auto_451329 ) ( ON ?auto_451327 ?auto_451328 ) ( ON ?auto_451326 ?auto_451327 ) ( ON ?auto_451325 ?auto_451326 ) ( ON ?auto_451324 ?auto_451325 ) ( CLEAR ?auto_451322 ) ( ON ?auto_451323 ?auto_451324 ) ( CLEAR ?auto_451323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_451321 ?auto_451322 ?auto_451323 )
      ( MAKE-11PILE ?auto_451321 ?auto_451322 ?auto_451323 ?auto_451324 ?auto_451325 ?auto_451326 ?auto_451327 ?auto_451328 ?auto_451329 ?auto_451330 ?auto_451331 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451344 - BLOCK
      ?auto_451345 - BLOCK
      ?auto_451346 - BLOCK
      ?auto_451347 - BLOCK
      ?auto_451348 - BLOCK
      ?auto_451349 - BLOCK
      ?auto_451350 - BLOCK
      ?auto_451351 - BLOCK
      ?auto_451352 - BLOCK
      ?auto_451353 - BLOCK
      ?auto_451354 - BLOCK
    )
    :vars
    (
      ?auto_451355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451354 ?auto_451355 ) ( ON-TABLE ?auto_451344 ) ( ON ?auto_451345 ?auto_451344 ) ( not ( = ?auto_451344 ?auto_451345 ) ) ( not ( = ?auto_451344 ?auto_451346 ) ) ( not ( = ?auto_451344 ?auto_451347 ) ) ( not ( = ?auto_451344 ?auto_451348 ) ) ( not ( = ?auto_451344 ?auto_451349 ) ) ( not ( = ?auto_451344 ?auto_451350 ) ) ( not ( = ?auto_451344 ?auto_451351 ) ) ( not ( = ?auto_451344 ?auto_451352 ) ) ( not ( = ?auto_451344 ?auto_451353 ) ) ( not ( = ?auto_451344 ?auto_451354 ) ) ( not ( = ?auto_451344 ?auto_451355 ) ) ( not ( = ?auto_451345 ?auto_451346 ) ) ( not ( = ?auto_451345 ?auto_451347 ) ) ( not ( = ?auto_451345 ?auto_451348 ) ) ( not ( = ?auto_451345 ?auto_451349 ) ) ( not ( = ?auto_451345 ?auto_451350 ) ) ( not ( = ?auto_451345 ?auto_451351 ) ) ( not ( = ?auto_451345 ?auto_451352 ) ) ( not ( = ?auto_451345 ?auto_451353 ) ) ( not ( = ?auto_451345 ?auto_451354 ) ) ( not ( = ?auto_451345 ?auto_451355 ) ) ( not ( = ?auto_451346 ?auto_451347 ) ) ( not ( = ?auto_451346 ?auto_451348 ) ) ( not ( = ?auto_451346 ?auto_451349 ) ) ( not ( = ?auto_451346 ?auto_451350 ) ) ( not ( = ?auto_451346 ?auto_451351 ) ) ( not ( = ?auto_451346 ?auto_451352 ) ) ( not ( = ?auto_451346 ?auto_451353 ) ) ( not ( = ?auto_451346 ?auto_451354 ) ) ( not ( = ?auto_451346 ?auto_451355 ) ) ( not ( = ?auto_451347 ?auto_451348 ) ) ( not ( = ?auto_451347 ?auto_451349 ) ) ( not ( = ?auto_451347 ?auto_451350 ) ) ( not ( = ?auto_451347 ?auto_451351 ) ) ( not ( = ?auto_451347 ?auto_451352 ) ) ( not ( = ?auto_451347 ?auto_451353 ) ) ( not ( = ?auto_451347 ?auto_451354 ) ) ( not ( = ?auto_451347 ?auto_451355 ) ) ( not ( = ?auto_451348 ?auto_451349 ) ) ( not ( = ?auto_451348 ?auto_451350 ) ) ( not ( = ?auto_451348 ?auto_451351 ) ) ( not ( = ?auto_451348 ?auto_451352 ) ) ( not ( = ?auto_451348 ?auto_451353 ) ) ( not ( = ?auto_451348 ?auto_451354 ) ) ( not ( = ?auto_451348 ?auto_451355 ) ) ( not ( = ?auto_451349 ?auto_451350 ) ) ( not ( = ?auto_451349 ?auto_451351 ) ) ( not ( = ?auto_451349 ?auto_451352 ) ) ( not ( = ?auto_451349 ?auto_451353 ) ) ( not ( = ?auto_451349 ?auto_451354 ) ) ( not ( = ?auto_451349 ?auto_451355 ) ) ( not ( = ?auto_451350 ?auto_451351 ) ) ( not ( = ?auto_451350 ?auto_451352 ) ) ( not ( = ?auto_451350 ?auto_451353 ) ) ( not ( = ?auto_451350 ?auto_451354 ) ) ( not ( = ?auto_451350 ?auto_451355 ) ) ( not ( = ?auto_451351 ?auto_451352 ) ) ( not ( = ?auto_451351 ?auto_451353 ) ) ( not ( = ?auto_451351 ?auto_451354 ) ) ( not ( = ?auto_451351 ?auto_451355 ) ) ( not ( = ?auto_451352 ?auto_451353 ) ) ( not ( = ?auto_451352 ?auto_451354 ) ) ( not ( = ?auto_451352 ?auto_451355 ) ) ( not ( = ?auto_451353 ?auto_451354 ) ) ( not ( = ?auto_451353 ?auto_451355 ) ) ( not ( = ?auto_451354 ?auto_451355 ) ) ( ON ?auto_451353 ?auto_451354 ) ( ON ?auto_451352 ?auto_451353 ) ( ON ?auto_451351 ?auto_451352 ) ( ON ?auto_451350 ?auto_451351 ) ( ON ?auto_451349 ?auto_451350 ) ( ON ?auto_451348 ?auto_451349 ) ( ON ?auto_451347 ?auto_451348 ) ( CLEAR ?auto_451345 ) ( ON ?auto_451346 ?auto_451347 ) ( CLEAR ?auto_451346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_451344 ?auto_451345 ?auto_451346 )
      ( MAKE-11PILE ?auto_451344 ?auto_451345 ?auto_451346 ?auto_451347 ?auto_451348 ?auto_451349 ?auto_451350 ?auto_451351 ?auto_451352 ?auto_451353 ?auto_451354 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451367 - BLOCK
      ?auto_451368 - BLOCK
      ?auto_451369 - BLOCK
      ?auto_451370 - BLOCK
      ?auto_451371 - BLOCK
      ?auto_451372 - BLOCK
      ?auto_451373 - BLOCK
      ?auto_451374 - BLOCK
      ?auto_451375 - BLOCK
      ?auto_451376 - BLOCK
      ?auto_451377 - BLOCK
    )
    :vars
    (
      ?auto_451378 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451377 ?auto_451378 ) ( ON-TABLE ?auto_451367 ) ( not ( = ?auto_451367 ?auto_451368 ) ) ( not ( = ?auto_451367 ?auto_451369 ) ) ( not ( = ?auto_451367 ?auto_451370 ) ) ( not ( = ?auto_451367 ?auto_451371 ) ) ( not ( = ?auto_451367 ?auto_451372 ) ) ( not ( = ?auto_451367 ?auto_451373 ) ) ( not ( = ?auto_451367 ?auto_451374 ) ) ( not ( = ?auto_451367 ?auto_451375 ) ) ( not ( = ?auto_451367 ?auto_451376 ) ) ( not ( = ?auto_451367 ?auto_451377 ) ) ( not ( = ?auto_451367 ?auto_451378 ) ) ( not ( = ?auto_451368 ?auto_451369 ) ) ( not ( = ?auto_451368 ?auto_451370 ) ) ( not ( = ?auto_451368 ?auto_451371 ) ) ( not ( = ?auto_451368 ?auto_451372 ) ) ( not ( = ?auto_451368 ?auto_451373 ) ) ( not ( = ?auto_451368 ?auto_451374 ) ) ( not ( = ?auto_451368 ?auto_451375 ) ) ( not ( = ?auto_451368 ?auto_451376 ) ) ( not ( = ?auto_451368 ?auto_451377 ) ) ( not ( = ?auto_451368 ?auto_451378 ) ) ( not ( = ?auto_451369 ?auto_451370 ) ) ( not ( = ?auto_451369 ?auto_451371 ) ) ( not ( = ?auto_451369 ?auto_451372 ) ) ( not ( = ?auto_451369 ?auto_451373 ) ) ( not ( = ?auto_451369 ?auto_451374 ) ) ( not ( = ?auto_451369 ?auto_451375 ) ) ( not ( = ?auto_451369 ?auto_451376 ) ) ( not ( = ?auto_451369 ?auto_451377 ) ) ( not ( = ?auto_451369 ?auto_451378 ) ) ( not ( = ?auto_451370 ?auto_451371 ) ) ( not ( = ?auto_451370 ?auto_451372 ) ) ( not ( = ?auto_451370 ?auto_451373 ) ) ( not ( = ?auto_451370 ?auto_451374 ) ) ( not ( = ?auto_451370 ?auto_451375 ) ) ( not ( = ?auto_451370 ?auto_451376 ) ) ( not ( = ?auto_451370 ?auto_451377 ) ) ( not ( = ?auto_451370 ?auto_451378 ) ) ( not ( = ?auto_451371 ?auto_451372 ) ) ( not ( = ?auto_451371 ?auto_451373 ) ) ( not ( = ?auto_451371 ?auto_451374 ) ) ( not ( = ?auto_451371 ?auto_451375 ) ) ( not ( = ?auto_451371 ?auto_451376 ) ) ( not ( = ?auto_451371 ?auto_451377 ) ) ( not ( = ?auto_451371 ?auto_451378 ) ) ( not ( = ?auto_451372 ?auto_451373 ) ) ( not ( = ?auto_451372 ?auto_451374 ) ) ( not ( = ?auto_451372 ?auto_451375 ) ) ( not ( = ?auto_451372 ?auto_451376 ) ) ( not ( = ?auto_451372 ?auto_451377 ) ) ( not ( = ?auto_451372 ?auto_451378 ) ) ( not ( = ?auto_451373 ?auto_451374 ) ) ( not ( = ?auto_451373 ?auto_451375 ) ) ( not ( = ?auto_451373 ?auto_451376 ) ) ( not ( = ?auto_451373 ?auto_451377 ) ) ( not ( = ?auto_451373 ?auto_451378 ) ) ( not ( = ?auto_451374 ?auto_451375 ) ) ( not ( = ?auto_451374 ?auto_451376 ) ) ( not ( = ?auto_451374 ?auto_451377 ) ) ( not ( = ?auto_451374 ?auto_451378 ) ) ( not ( = ?auto_451375 ?auto_451376 ) ) ( not ( = ?auto_451375 ?auto_451377 ) ) ( not ( = ?auto_451375 ?auto_451378 ) ) ( not ( = ?auto_451376 ?auto_451377 ) ) ( not ( = ?auto_451376 ?auto_451378 ) ) ( not ( = ?auto_451377 ?auto_451378 ) ) ( ON ?auto_451376 ?auto_451377 ) ( ON ?auto_451375 ?auto_451376 ) ( ON ?auto_451374 ?auto_451375 ) ( ON ?auto_451373 ?auto_451374 ) ( ON ?auto_451372 ?auto_451373 ) ( ON ?auto_451371 ?auto_451372 ) ( ON ?auto_451370 ?auto_451371 ) ( ON ?auto_451369 ?auto_451370 ) ( CLEAR ?auto_451367 ) ( ON ?auto_451368 ?auto_451369 ) ( CLEAR ?auto_451368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_451367 ?auto_451368 )
      ( MAKE-11PILE ?auto_451367 ?auto_451368 ?auto_451369 ?auto_451370 ?auto_451371 ?auto_451372 ?auto_451373 ?auto_451374 ?auto_451375 ?auto_451376 ?auto_451377 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451390 - BLOCK
      ?auto_451391 - BLOCK
      ?auto_451392 - BLOCK
      ?auto_451393 - BLOCK
      ?auto_451394 - BLOCK
      ?auto_451395 - BLOCK
      ?auto_451396 - BLOCK
      ?auto_451397 - BLOCK
      ?auto_451398 - BLOCK
      ?auto_451399 - BLOCK
      ?auto_451400 - BLOCK
    )
    :vars
    (
      ?auto_451401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451400 ?auto_451401 ) ( ON-TABLE ?auto_451390 ) ( not ( = ?auto_451390 ?auto_451391 ) ) ( not ( = ?auto_451390 ?auto_451392 ) ) ( not ( = ?auto_451390 ?auto_451393 ) ) ( not ( = ?auto_451390 ?auto_451394 ) ) ( not ( = ?auto_451390 ?auto_451395 ) ) ( not ( = ?auto_451390 ?auto_451396 ) ) ( not ( = ?auto_451390 ?auto_451397 ) ) ( not ( = ?auto_451390 ?auto_451398 ) ) ( not ( = ?auto_451390 ?auto_451399 ) ) ( not ( = ?auto_451390 ?auto_451400 ) ) ( not ( = ?auto_451390 ?auto_451401 ) ) ( not ( = ?auto_451391 ?auto_451392 ) ) ( not ( = ?auto_451391 ?auto_451393 ) ) ( not ( = ?auto_451391 ?auto_451394 ) ) ( not ( = ?auto_451391 ?auto_451395 ) ) ( not ( = ?auto_451391 ?auto_451396 ) ) ( not ( = ?auto_451391 ?auto_451397 ) ) ( not ( = ?auto_451391 ?auto_451398 ) ) ( not ( = ?auto_451391 ?auto_451399 ) ) ( not ( = ?auto_451391 ?auto_451400 ) ) ( not ( = ?auto_451391 ?auto_451401 ) ) ( not ( = ?auto_451392 ?auto_451393 ) ) ( not ( = ?auto_451392 ?auto_451394 ) ) ( not ( = ?auto_451392 ?auto_451395 ) ) ( not ( = ?auto_451392 ?auto_451396 ) ) ( not ( = ?auto_451392 ?auto_451397 ) ) ( not ( = ?auto_451392 ?auto_451398 ) ) ( not ( = ?auto_451392 ?auto_451399 ) ) ( not ( = ?auto_451392 ?auto_451400 ) ) ( not ( = ?auto_451392 ?auto_451401 ) ) ( not ( = ?auto_451393 ?auto_451394 ) ) ( not ( = ?auto_451393 ?auto_451395 ) ) ( not ( = ?auto_451393 ?auto_451396 ) ) ( not ( = ?auto_451393 ?auto_451397 ) ) ( not ( = ?auto_451393 ?auto_451398 ) ) ( not ( = ?auto_451393 ?auto_451399 ) ) ( not ( = ?auto_451393 ?auto_451400 ) ) ( not ( = ?auto_451393 ?auto_451401 ) ) ( not ( = ?auto_451394 ?auto_451395 ) ) ( not ( = ?auto_451394 ?auto_451396 ) ) ( not ( = ?auto_451394 ?auto_451397 ) ) ( not ( = ?auto_451394 ?auto_451398 ) ) ( not ( = ?auto_451394 ?auto_451399 ) ) ( not ( = ?auto_451394 ?auto_451400 ) ) ( not ( = ?auto_451394 ?auto_451401 ) ) ( not ( = ?auto_451395 ?auto_451396 ) ) ( not ( = ?auto_451395 ?auto_451397 ) ) ( not ( = ?auto_451395 ?auto_451398 ) ) ( not ( = ?auto_451395 ?auto_451399 ) ) ( not ( = ?auto_451395 ?auto_451400 ) ) ( not ( = ?auto_451395 ?auto_451401 ) ) ( not ( = ?auto_451396 ?auto_451397 ) ) ( not ( = ?auto_451396 ?auto_451398 ) ) ( not ( = ?auto_451396 ?auto_451399 ) ) ( not ( = ?auto_451396 ?auto_451400 ) ) ( not ( = ?auto_451396 ?auto_451401 ) ) ( not ( = ?auto_451397 ?auto_451398 ) ) ( not ( = ?auto_451397 ?auto_451399 ) ) ( not ( = ?auto_451397 ?auto_451400 ) ) ( not ( = ?auto_451397 ?auto_451401 ) ) ( not ( = ?auto_451398 ?auto_451399 ) ) ( not ( = ?auto_451398 ?auto_451400 ) ) ( not ( = ?auto_451398 ?auto_451401 ) ) ( not ( = ?auto_451399 ?auto_451400 ) ) ( not ( = ?auto_451399 ?auto_451401 ) ) ( not ( = ?auto_451400 ?auto_451401 ) ) ( ON ?auto_451399 ?auto_451400 ) ( ON ?auto_451398 ?auto_451399 ) ( ON ?auto_451397 ?auto_451398 ) ( ON ?auto_451396 ?auto_451397 ) ( ON ?auto_451395 ?auto_451396 ) ( ON ?auto_451394 ?auto_451395 ) ( ON ?auto_451393 ?auto_451394 ) ( ON ?auto_451392 ?auto_451393 ) ( CLEAR ?auto_451390 ) ( ON ?auto_451391 ?auto_451392 ) ( CLEAR ?auto_451391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_451390 ?auto_451391 )
      ( MAKE-11PILE ?auto_451390 ?auto_451391 ?auto_451392 ?auto_451393 ?auto_451394 ?auto_451395 ?auto_451396 ?auto_451397 ?auto_451398 ?auto_451399 ?auto_451400 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451413 - BLOCK
      ?auto_451414 - BLOCK
      ?auto_451415 - BLOCK
      ?auto_451416 - BLOCK
      ?auto_451417 - BLOCK
      ?auto_451418 - BLOCK
      ?auto_451419 - BLOCK
      ?auto_451420 - BLOCK
      ?auto_451421 - BLOCK
      ?auto_451422 - BLOCK
      ?auto_451423 - BLOCK
    )
    :vars
    (
      ?auto_451424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451423 ?auto_451424 ) ( not ( = ?auto_451413 ?auto_451414 ) ) ( not ( = ?auto_451413 ?auto_451415 ) ) ( not ( = ?auto_451413 ?auto_451416 ) ) ( not ( = ?auto_451413 ?auto_451417 ) ) ( not ( = ?auto_451413 ?auto_451418 ) ) ( not ( = ?auto_451413 ?auto_451419 ) ) ( not ( = ?auto_451413 ?auto_451420 ) ) ( not ( = ?auto_451413 ?auto_451421 ) ) ( not ( = ?auto_451413 ?auto_451422 ) ) ( not ( = ?auto_451413 ?auto_451423 ) ) ( not ( = ?auto_451413 ?auto_451424 ) ) ( not ( = ?auto_451414 ?auto_451415 ) ) ( not ( = ?auto_451414 ?auto_451416 ) ) ( not ( = ?auto_451414 ?auto_451417 ) ) ( not ( = ?auto_451414 ?auto_451418 ) ) ( not ( = ?auto_451414 ?auto_451419 ) ) ( not ( = ?auto_451414 ?auto_451420 ) ) ( not ( = ?auto_451414 ?auto_451421 ) ) ( not ( = ?auto_451414 ?auto_451422 ) ) ( not ( = ?auto_451414 ?auto_451423 ) ) ( not ( = ?auto_451414 ?auto_451424 ) ) ( not ( = ?auto_451415 ?auto_451416 ) ) ( not ( = ?auto_451415 ?auto_451417 ) ) ( not ( = ?auto_451415 ?auto_451418 ) ) ( not ( = ?auto_451415 ?auto_451419 ) ) ( not ( = ?auto_451415 ?auto_451420 ) ) ( not ( = ?auto_451415 ?auto_451421 ) ) ( not ( = ?auto_451415 ?auto_451422 ) ) ( not ( = ?auto_451415 ?auto_451423 ) ) ( not ( = ?auto_451415 ?auto_451424 ) ) ( not ( = ?auto_451416 ?auto_451417 ) ) ( not ( = ?auto_451416 ?auto_451418 ) ) ( not ( = ?auto_451416 ?auto_451419 ) ) ( not ( = ?auto_451416 ?auto_451420 ) ) ( not ( = ?auto_451416 ?auto_451421 ) ) ( not ( = ?auto_451416 ?auto_451422 ) ) ( not ( = ?auto_451416 ?auto_451423 ) ) ( not ( = ?auto_451416 ?auto_451424 ) ) ( not ( = ?auto_451417 ?auto_451418 ) ) ( not ( = ?auto_451417 ?auto_451419 ) ) ( not ( = ?auto_451417 ?auto_451420 ) ) ( not ( = ?auto_451417 ?auto_451421 ) ) ( not ( = ?auto_451417 ?auto_451422 ) ) ( not ( = ?auto_451417 ?auto_451423 ) ) ( not ( = ?auto_451417 ?auto_451424 ) ) ( not ( = ?auto_451418 ?auto_451419 ) ) ( not ( = ?auto_451418 ?auto_451420 ) ) ( not ( = ?auto_451418 ?auto_451421 ) ) ( not ( = ?auto_451418 ?auto_451422 ) ) ( not ( = ?auto_451418 ?auto_451423 ) ) ( not ( = ?auto_451418 ?auto_451424 ) ) ( not ( = ?auto_451419 ?auto_451420 ) ) ( not ( = ?auto_451419 ?auto_451421 ) ) ( not ( = ?auto_451419 ?auto_451422 ) ) ( not ( = ?auto_451419 ?auto_451423 ) ) ( not ( = ?auto_451419 ?auto_451424 ) ) ( not ( = ?auto_451420 ?auto_451421 ) ) ( not ( = ?auto_451420 ?auto_451422 ) ) ( not ( = ?auto_451420 ?auto_451423 ) ) ( not ( = ?auto_451420 ?auto_451424 ) ) ( not ( = ?auto_451421 ?auto_451422 ) ) ( not ( = ?auto_451421 ?auto_451423 ) ) ( not ( = ?auto_451421 ?auto_451424 ) ) ( not ( = ?auto_451422 ?auto_451423 ) ) ( not ( = ?auto_451422 ?auto_451424 ) ) ( not ( = ?auto_451423 ?auto_451424 ) ) ( ON ?auto_451422 ?auto_451423 ) ( ON ?auto_451421 ?auto_451422 ) ( ON ?auto_451420 ?auto_451421 ) ( ON ?auto_451419 ?auto_451420 ) ( ON ?auto_451418 ?auto_451419 ) ( ON ?auto_451417 ?auto_451418 ) ( ON ?auto_451416 ?auto_451417 ) ( ON ?auto_451415 ?auto_451416 ) ( ON ?auto_451414 ?auto_451415 ) ( ON ?auto_451413 ?auto_451414 ) ( CLEAR ?auto_451413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_451413 )
      ( MAKE-11PILE ?auto_451413 ?auto_451414 ?auto_451415 ?auto_451416 ?auto_451417 ?auto_451418 ?auto_451419 ?auto_451420 ?auto_451421 ?auto_451422 ?auto_451423 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_451436 - BLOCK
      ?auto_451437 - BLOCK
      ?auto_451438 - BLOCK
      ?auto_451439 - BLOCK
      ?auto_451440 - BLOCK
      ?auto_451441 - BLOCK
      ?auto_451442 - BLOCK
      ?auto_451443 - BLOCK
      ?auto_451444 - BLOCK
      ?auto_451445 - BLOCK
      ?auto_451446 - BLOCK
    )
    :vars
    (
      ?auto_451447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451446 ?auto_451447 ) ( not ( = ?auto_451436 ?auto_451437 ) ) ( not ( = ?auto_451436 ?auto_451438 ) ) ( not ( = ?auto_451436 ?auto_451439 ) ) ( not ( = ?auto_451436 ?auto_451440 ) ) ( not ( = ?auto_451436 ?auto_451441 ) ) ( not ( = ?auto_451436 ?auto_451442 ) ) ( not ( = ?auto_451436 ?auto_451443 ) ) ( not ( = ?auto_451436 ?auto_451444 ) ) ( not ( = ?auto_451436 ?auto_451445 ) ) ( not ( = ?auto_451436 ?auto_451446 ) ) ( not ( = ?auto_451436 ?auto_451447 ) ) ( not ( = ?auto_451437 ?auto_451438 ) ) ( not ( = ?auto_451437 ?auto_451439 ) ) ( not ( = ?auto_451437 ?auto_451440 ) ) ( not ( = ?auto_451437 ?auto_451441 ) ) ( not ( = ?auto_451437 ?auto_451442 ) ) ( not ( = ?auto_451437 ?auto_451443 ) ) ( not ( = ?auto_451437 ?auto_451444 ) ) ( not ( = ?auto_451437 ?auto_451445 ) ) ( not ( = ?auto_451437 ?auto_451446 ) ) ( not ( = ?auto_451437 ?auto_451447 ) ) ( not ( = ?auto_451438 ?auto_451439 ) ) ( not ( = ?auto_451438 ?auto_451440 ) ) ( not ( = ?auto_451438 ?auto_451441 ) ) ( not ( = ?auto_451438 ?auto_451442 ) ) ( not ( = ?auto_451438 ?auto_451443 ) ) ( not ( = ?auto_451438 ?auto_451444 ) ) ( not ( = ?auto_451438 ?auto_451445 ) ) ( not ( = ?auto_451438 ?auto_451446 ) ) ( not ( = ?auto_451438 ?auto_451447 ) ) ( not ( = ?auto_451439 ?auto_451440 ) ) ( not ( = ?auto_451439 ?auto_451441 ) ) ( not ( = ?auto_451439 ?auto_451442 ) ) ( not ( = ?auto_451439 ?auto_451443 ) ) ( not ( = ?auto_451439 ?auto_451444 ) ) ( not ( = ?auto_451439 ?auto_451445 ) ) ( not ( = ?auto_451439 ?auto_451446 ) ) ( not ( = ?auto_451439 ?auto_451447 ) ) ( not ( = ?auto_451440 ?auto_451441 ) ) ( not ( = ?auto_451440 ?auto_451442 ) ) ( not ( = ?auto_451440 ?auto_451443 ) ) ( not ( = ?auto_451440 ?auto_451444 ) ) ( not ( = ?auto_451440 ?auto_451445 ) ) ( not ( = ?auto_451440 ?auto_451446 ) ) ( not ( = ?auto_451440 ?auto_451447 ) ) ( not ( = ?auto_451441 ?auto_451442 ) ) ( not ( = ?auto_451441 ?auto_451443 ) ) ( not ( = ?auto_451441 ?auto_451444 ) ) ( not ( = ?auto_451441 ?auto_451445 ) ) ( not ( = ?auto_451441 ?auto_451446 ) ) ( not ( = ?auto_451441 ?auto_451447 ) ) ( not ( = ?auto_451442 ?auto_451443 ) ) ( not ( = ?auto_451442 ?auto_451444 ) ) ( not ( = ?auto_451442 ?auto_451445 ) ) ( not ( = ?auto_451442 ?auto_451446 ) ) ( not ( = ?auto_451442 ?auto_451447 ) ) ( not ( = ?auto_451443 ?auto_451444 ) ) ( not ( = ?auto_451443 ?auto_451445 ) ) ( not ( = ?auto_451443 ?auto_451446 ) ) ( not ( = ?auto_451443 ?auto_451447 ) ) ( not ( = ?auto_451444 ?auto_451445 ) ) ( not ( = ?auto_451444 ?auto_451446 ) ) ( not ( = ?auto_451444 ?auto_451447 ) ) ( not ( = ?auto_451445 ?auto_451446 ) ) ( not ( = ?auto_451445 ?auto_451447 ) ) ( not ( = ?auto_451446 ?auto_451447 ) ) ( ON ?auto_451445 ?auto_451446 ) ( ON ?auto_451444 ?auto_451445 ) ( ON ?auto_451443 ?auto_451444 ) ( ON ?auto_451442 ?auto_451443 ) ( ON ?auto_451441 ?auto_451442 ) ( ON ?auto_451440 ?auto_451441 ) ( ON ?auto_451439 ?auto_451440 ) ( ON ?auto_451438 ?auto_451439 ) ( ON ?auto_451437 ?auto_451438 ) ( ON ?auto_451436 ?auto_451437 ) ( CLEAR ?auto_451436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_451436 )
      ( MAKE-11PILE ?auto_451436 ?auto_451437 ?auto_451438 ?auto_451439 ?auto_451440 ?auto_451441 ?auto_451442 ?auto_451443 ?auto_451444 ?auto_451445 ?auto_451446 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451460 - BLOCK
      ?auto_451461 - BLOCK
      ?auto_451462 - BLOCK
      ?auto_451463 - BLOCK
      ?auto_451464 - BLOCK
      ?auto_451465 - BLOCK
      ?auto_451466 - BLOCK
      ?auto_451467 - BLOCK
      ?auto_451468 - BLOCK
      ?auto_451469 - BLOCK
      ?auto_451470 - BLOCK
      ?auto_451471 - BLOCK
    )
    :vars
    (
      ?auto_451472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_451470 ) ( ON ?auto_451471 ?auto_451472 ) ( CLEAR ?auto_451471 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_451460 ) ( ON ?auto_451461 ?auto_451460 ) ( ON ?auto_451462 ?auto_451461 ) ( ON ?auto_451463 ?auto_451462 ) ( ON ?auto_451464 ?auto_451463 ) ( ON ?auto_451465 ?auto_451464 ) ( ON ?auto_451466 ?auto_451465 ) ( ON ?auto_451467 ?auto_451466 ) ( ON ?auto_451468 ?auto_451467 ) ( ON ?auto_451469 ?auto_451468 ) ( ON ?auto_451470 ?auto_451469 ) ( not ( = ?auto_451460 ?auto_451461 ) ) ( not ( = ?auto_451460 ?auto_451462 ) ) ( not ( = ?auto_451460 ?auto_451463 ) ) ( not ( = ?auto_451460 ?auto_451464 ) ) ( not ( = ?auto_451460 ?auto_451465 ) ) ( not ( = ?auto_451460 ?auto_451466 ) ) ( not ( = ?auto_451460 ?auto_451467 ) ) ( not ( = ?auto_451460 ?auto_451468 ) ) ( not ( = ?auto_451460 ?auto_451469 ) ) ( not ( = ?auto_451460 ?auto_451470 ) ) ( not ( = ?auto_451460 ?auto_451471 ) ) ( not ( = ?auto_451460 ?auto_451472 ) ) ( not ( = ?auto_451461 ?auto_451462 ) ) ( not ( = ?auto_451461 ?auto_451463 ) ) ( not ( = ?auto_451461 ?auto_451464 ) ) ( not ( = ?auto_451461 ?auto_451465 ) ) ( not ( = ?auto_451461 ?auto_451466 ) ) ( not ( = ?auto_451461 ?auto_451467 ) ) ( not ( = ?auto_451461 ?auto_451468 ) ) ( not ( = ?auto_451461 ?auto_451469 ) ) ( not ( = ?auto_451461 ?auto_451470 ) ) ( not ( = ?auto_451461 ?auto_451471 ) ) ( not ( = ?auto_451461 ?auto_451472 ) ) ( not ( = ?auto_451462 ?auto_451463 ) ) ( not ( = ?auto_451462 ?auto_451464 ) ) ( not ( = ?auto_451462 ?auto_451465 ) ) ( not ( = ?auto_451462 ?auto_451466 ) ) ( not ( = ?auto_451462 ?auto_451467 ) ) ( not ( = ?auto_451462 ?auto_451468 ) ) ( not ( = ?auto_451462 ?auto_451469 ) ) ( not ( = ?auto_451462 ?auto_451470 ) ) ( not ( = ?auto_451462 ?auto_451471 ) ) ( not ( = ?auto_451462 ?auto_451472 ) ) ( not ( = ?auto_451463 ?auto_451464 ) ) ( not ( = ?auto_451463 ?auto_451465 ) ) ( not ( = ?auto_451463 ?auto_451466 ) ) ( not ( = ?auto_451463 ?auto_451467 ) ) ( not ( = ?auto_451463 ?auto_451468 ) ) ( not ( = ?auto_451463 ?auto_451469 ) ) ( not ( = ?auto_451463 ?auto_451470 ) ) ( not ( = ?auto_451463 ?auto_451471 ) ) ( not ( = ?auto_451463 ?auto_451472 ) ) ( not ( = ?auto_451464 ?auto_451465 ) ) ( not ( = ?auto_451464 ?auto_451466 ) ) ( not ( = ?auto_451464 ?auto_451467 ) ) ( not ( = ?auto_451464 ?auto_451468 ) ) ( not ( = ?auto_451464 ?auto_451469 ) ) ( not ( = ?auto_451464 ?auto_451470 ) ) ( not ( = ?auto_451464 ?auto_451471 ) ) ( not ( = ?auto_451464 ?auto_451472 ) ) ( not ( = ?auto_451465 ?auto_451466 ) ) ( not ( = ?auto_451465 ?auto_451467 ) ) ( not ( = ?auto_451465 ?auto_451468 ) ) ( not ( = ?auto_451465 ?auto_451469 ) ) ( not ( = ?auto_451465 ?auto_451470 ) ) ( not ( = ?auto_451465 ?auto_451471 ) ) ( not ( = ?auto_451465 ?auto_451472 ) ) ( not ( = ?auto_451466 ?auto_451467 ) ) ( not ( = ?auto_451466 ?auto_451468 ) ) ( not ( = ?auto_451466 ?auto_451469 ) ) ( not ( = ?auto_451466 ?auto_451470 ) ) ( not ( = ?auto_451466 ?auto_451471 ) ) ( not ( = ?auto_451466 ?auto_451472 ) ) ( not ( = ?auto_451467 ?auto_451468 ) ) ( not ( = ?auto_451467 ?auto_451469 ) ) ( not ( = ?auto_451467 ?auto_451470 ) ) ( not ( = ?auto_451467 ?auto_451471 ) ) ( not ( = ?auto_451467 ?auto_451472 ) ) ( not ( = ?auto_451468 ?auto_451469 ) ) ( not ( = ?auto_451468 ?auto_451470 ) ) ( not ( = ?auto_451468 ?auto_451471 ) ) ( not ( = ?auto_451468 ?auto_451472 ) ) ( not ( = ?auto_451469 ?auto_451470 ) ) ( not ( = ?auto_451469 ?auto_451471 ) ) ( not ( = ?auto_451469 ?auto_451472 ) ) ( not ( = ?auto_451470 ?auto_451471 ) ) ( not ( = ?auto_451470 ?auto_451472 ) ) ( not ( = ?auto_451471 ?auto_451472 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_451471 ?auto_451472 )
      ( !STACK ?auto_451471 ?auto_451470 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451485 - BLOCK
      ?auto_451486 - BLOCK
      ?auto_451487 - BLOCK
      ?auto_451488 - BLOCK
      ?auto_451489 - BLOCK
      ?auto_451490 - BLOCK
      ?auto_451491 - BLOCK
      ?auto_451492 - BLOCK
      ?auto_451493 - BLOCK
      ?auto_451494 - BLOCK
      ?auto_451495 - BLOCK
      ?auto_451496 - BLOCK
    )
    :vars
    (
      ?auto_451497 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_451495 ) ( ON ?auto_451496 ?auto_451497 ) ( CLEAR ?auto_451496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_451485 ) ( ON ?auto_451486 ?auto_451485 ) ( ON ?auto_451487 ?auto_451486 ) ( ON ?auto_451488 ?auto_451487 ) ( ON ?auto_451489 ?auto_451488 ) ( ON ?auto_451490 ?auto_451489 ) ( ON ?auto_451491 ?auto_451490 ) ( ON ?auto_451492 ?auto_451491 ) ( ON ?auto_451493 ?auto_451492 ) ( ON ?auto_451494 ?auto_451493 ) ( ON ?auto_451495 ?auto_451494 ) ( not ( = ?auto_451485 ?auto_451486 ) ) ( not ( = ?auto_451485 ?auto_451487 ) ) ( not ( = ?auto_451485 ?auto_451488 ) ) ( not ( = ?auto_451485 ?auto_451489 ) ) ( not ( = ?auto_451485 ?auto_451490 ) ) ( not ( = ?auto_451485 ?auto_451491 ) ) ( not ( = ?auto_451485 ?auto_451492 ) ) ( not ( = ?auto_451485 ?auto_451493 ) ) ( not ( = ?auto_451485 ?auto_451494 ) ) ( not ( = ?auto_451485 ?auto_451495 ) ) ( not ( = ?auto_451485 ?auto_451496 ) ) ( not ( = ?auto_451485 ?auto_451497 ) ) ( not ( = ?auto_451486 ?auto_451487 ) ) ( not ( = ?auto_451486 ?auto_451488 ) ) ( not ( = ?auto_451486 ?auto_451489 ) ) ( not ( = ?auto_451486 ?auto_451490 ) ) ( not ( = ?auto_451486 ?auto_451491 ) ) ( not ( = ?auto_451486 ?auto_451492 ) ) ( not ( = ?auto_451486 ?auto_451493 ) ) ( not ( = ?auto_451486 ?auto_451494 ) ) ( not ( = ?auto_451486 ?auto_451495 ) ) ( not ( = ?auto_451486 ?auto_451496 ) ) ( not ( = ?auto_451486 ?auto_451497 ) ) ( not ( = ?auto_451487 ?auto_451488 ) ) ( not ( = ?auto_451487 ?auto_451489 ) ) ( not ( = ?auto_451487 ?auto_451490 ) ) ( not ( = ?auto_451487 ?auto_451491 ) ) ( not ( = ?auto_451487 ?auto_451492 ) ) ( not ( = ?auto_451487 ?auto_451493 ) ) ( not ( = ?auto_451487 ?auto_451494 ) ) ( not ( = ?auto_451487 ?auto_451495 ) ) ( not ( = ?auto_451487 ?auto_451496 ) ) ( not ( = ?auto_451487 ?auto_451497 ) ) ( not ( = ?auto_451488 ?auto_451489 ) ) ( not ( = ?auto_451488 ?auto_451490 ) ) ( not ( = ?auto_451488 ?auto_451491 ) ) ( not ( = ?auto_451488 ?auto_451492 ) ) ( not ( = ?auto_451488 ?auto_451493 ) ) ( not ( = ?auto_451488 ?auto_451494 ) ) ( not ( = ?auto_451488 ?auto_451495 ) ) ( not ( = ?auto_451488 ?auto_451496 ) ) ( not ( = ?auto_451488 ?auto_451497 ) ) ( not ( = ?auto_451489 ?auto_451490 ) ) ( not ( = ?auto_451489 ?auto_451491 ) ) ( not ( = ?auto_451489 ?auto_451492 ) ) ( not ( = ?auto_451489 ?auto_451493 ) ) ( not ( = ?auto_451489 ?auto_451494 ) ) ( not ( = ?auto_451489 ?auto_451495 ) ) ( not ( = ?auto_451489 ?auto_451496 ) ) ( not ( = ?auto_451489 ?auto_451497 ) ) ( not ( = ?auto_451490 ?auto_451491 ) ) ( not ( = ?auto_451490 ?auto_451492 ) ) ( not ( = ?auto_451490 ?auto_451493 ) ) ( not ( = ?auto_451490 ?auto_451494 ) ) ( not ( = ?auto_451490 ?auto_451495 ) ) ( not ( = ?auto_451490 ?auto_451496 ) ) ( not ( = ?auto_451490 ?auto_451497 ) ) ( not ( = ?auto_451491 ?auto_451492 ) ) ( not ( = ?auto_451491 ?auto_451493 ) ) ( not ( = ?auto_451491 ?auto_451494 ) ) ( not ( = ?auto_451491 ?auto_451495 ) ) ( not ( = ?auto_451491 ?auto_451496 ) ) ( not ( = ?auto_451491 ?auto_451497 ) ) ( not ( = ?auto_451492 ?auto_451493 ) ) ( not ( = ?auto_451492 ?auto_451494 ) ) ( not ( = ?auto_451492 ?auto_451495 ) ) ( not ( = ?auto_451492 ?auto_451496 ) ) ( not ( = ?auto_451492 ?auto_451497 ) ) ( not ( = ?auto_451493 ?auto_451494 ) ) ( not ( = ?auto_451493 ?auto_451495 ) ) ( not ( = ?auto_451493 ?auto_451496 ) ) ( not ( = ?auto_451493 ?auto_451497 ) ) ( not ( = ?auto_451494 ?auto_451495 ) ) ( not ( = ?auto_451494 ?auto_451496 ) ) ( not ( = ?auto_451494 ?auto_451497 ) ) ( not ( = ?auto_451495 ?auto_451496 ) ) ( not ( = ?auto_451495 ?auto_451497 ) ) ( not ( = ?auto_451496 ?auto_451497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_451496 ?auto_451497 )
      ( !STACK ?auto_451496 ?auto_451495 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451510 - BLOCK
      ?auto_451511 - BLOCK
      ?auto_451512 - BLOCK
      ?auto_451513 - BLOCK
      ?auto_451514 - BLOCK
      ?auto_451515 - BLOCK
      ?auto_451516 - BLOCK
      ?auto_451517 - BLOCK
      ?auto_451518 - BLOCK
      ?auto_451519 - BLOCK
      ?auto_451520 - BLOCK
      ?auto_451521 - BLOCK
    )
    :vars
    (
      ?auto_451522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451521 ?auto_451522 ) ( ON-TABLE ?auto_451510 ) ( ON ?auto_451511 ?auto_451510 ) ( ON ?auto_451512 ?auto_451511 ) ( ON ?auto_451513 ?auto_451512 ) ( ON ?auto_451514 ?auto_451513 ) ( ON ?auto_451515 ?auto_451514 ) ( ON ?auto_451516 ?auto_451515 ) ( ON ?auto_451517 ?auto_451516 ) ( ON ?auto_451518 ?auto_451517 ) ( ON ?auto_451519 ?auto_451518 ) ( not ( = ?auto_451510 ?auto_451511 ) ) ( not ( = ?auto_451510 ?auto_451512 ) ) ( not ( = ?auto_451510 ?auto_451513 ) ) ( not ( = ?auto_451510 ?auto_451514 ) ) ( not ( = ?auto_451510 ?auto_451515 ) ) ( not ( = ?auto_451510 ?auto_451516 ) ) ( not ( = ?auto_451510 ?auto_451517 ) ) ( not ( = ?auto_451510 ?auto_451518 ) ) ( not ( = ?auto_451510 ?auto_451519 ) ) ( not ( = ?auto_451510 ?auto_451520 ) ) ( not ( = ?auto_451510 ?auto_451521 ) ) ( not ( = ?auto_451510 ?auto_451522 ) ) ( not ( = ?auto_451511 ?auto_451512 ) ) ( not ( = ?auto_451511 ?auto_451513 ) ) ( not ( = ?auto_451511 ?auto_451514 ) ) ( not ( = ?auto_451511 ?auto_451515 ) ) ( not ( = ?auto_451511 ?auto_451516 ) ) ( not ( = ?auto_451511 ?auto_451517 ) ) ( not ( = ?auto_451511 ?auto_451518 ) ) ( not ( = ?auto_451511 ?auto_451519 ) ) ( not ( = ?auto_451511 ?auto_451520 ) ) ( not ( = ?auto_451511 ?auto_451521 ) ) ( not ( = ?auto_451511 ?auto_451522 ) ) ( not ( = ?auto_451512 ?auto_451513 ) ) ( not ( = ?auto_451512 ?auto_451514 ) ) ( not ( = ?auto_451512 ?auto_451515 ) ) ( not ( = ?auto_451512 ?auto_451516 ) ) ( not ( = ?auto_451512 ?auto_451517 ) ) ( not ( = ?auto_451512 ?auto_451518 ) ) ( not ( = ?auto_451512 ?auto_451519 ) ) ( not ( = ?auto_451512 ?auto_451520 ) ) ( not ( = ?auto_451512 ?auto_451521 ) ) ( not ( = ?auto_451512 ?auto_451522 ) ) ( not ( = ?auto_451513 ?auto_451514 ) ) ( not ( = ?auto_451513 ?auto_451515 ) ) ( not ( = ?auto_451513 ?auto_451516 ) ) ( not ( = ?auto_451513 ?auto_451517 ) ) ( not ( = ?auto_451513 ?auto_451518 ) ) ( not ( = ?auto_451513 ?auto_451519 ) ) ( not ( = ?auto_451513 ?auto_451520 ) ) ( not ( = ?auto_451513 ?auto_451521 ) ) ( not ( = ?auto_451513 ?auto_451522 ) ) ( not ( = ?auto_451514 ?auto_451515 ) ) ( not ( = ?auto_451514 ?auto_451516 ) ) ( not ( = ?auto_451514 ?auto_451517 ) ) ( not ( = ?auto_451514 ?auto_451518 ) ) ( not ( = ?auto_451514 ?auto_451519 ) ) ( not ( = ?auto_451514 ?auto_451520 ) ) ( not ( = ?auto_451514 ?auto_451521 ) ) ( not ( = ?auto_451514 ?auto_451522 ) ) ( not ( = ?auto_451515 ?auto_451516 ) ) ( not ( = ?auto_451515 ?auto_451517 ) ) ( not ( = ?auto_451515 ?auto_451518 ) ) ( not ( = ?auto_451515 ?auto_451519 ) ) ( not ( = ?auto_451515 ?auto_451520 ) ) ( not ( = ?auto_451515 ?auto_451521 ) ) ( not ( = ?auto_451515 ?auto_451522 ) ) ( not ( = ?auto_451516 ?auto_451517 ) ) ( not ( = ?auto_451516 ?auto_451518 ) ) ( not ( = ?auto_451516 ?auto_451519 ) ) ( not ( = ?auto_451516 ?auto_451520 ) ) ( not ( = ?auto_451516 ?auto_451521 ) ) ( not ( = ?auto_451516 ?auto_451522 ) ) ( not ( = ?auto_451517 ?auto_451518 ) ) ( not ( = ?auto_451517 ?auto_451519 ) ) ( not ( = ?auto_451517 ?auto_451520 ) ) ( not ( = ?auto_451517 ?auto_451521 ) ) ( not ( = ?auto_451517 ?auto_451522 ) ) ( not ( = ?auto_451518 ?auto_451519 ) ) ( not ( = ?auto_451518 ?auto_451520 ) ) ( not ( = ?auto_451518 ?auto_451521 ) ) ( not ( = ?auto_451518 ?auto_451522 ) ) ( not ( = ?auto_451519 ?auto_451520 ) ) ( not ( = ?auto_451519 ?auto_451521 ) ) ( not ( = ?auto_451519 ?auto_451522 ) ) ( not ( = ?auto_451520 ?auto_451521 ) ) ( not ( = ?auto_451520 ?auto_451522 ) ) ( not ( = ?auto_451521 ?auto_451522 ) ) ( CLEAR ?auto_451519 ) ( ON ?auto_451520 ?auto_451521 ) ( CLEAR ?auto_451520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_451510 ?auto_451511 ?auto_451512 ?auto_451513 ?auto_451514 ?auto_451515 ?auto_451516 ?auto_451517 ?auto_451518 ?auto_451519 ?auto_451520 )
      ( MAKE-12PILE ?auto_451510 ?auto_451511 ?auto_451512 ?auto_451513 ?auto_451514 ?auto_451515 ?auto_451516 ?auto_451517 ?auto_451518 ?auto_451519 ?auto_451520 ?auto_451521 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451535 - BLOCK
      ?auto_451536 - BLOCK
      ?auto_451537 - BLOCK
      ?auto_451538 - BLOCK
      ?auto_451539 - BLOCK
      ?auto_451540 - BLOCK
      ?auto_451541 - BLOCK
      ?auto_451542 - BLOCK
      ?auto_451543 - BLOCK
      ?auto_451544 - BLOCK
      ?auto_451545 - BLOCK
      ?auto_451546 - BLOCK
    )
    :vars
    (
      ?auto_451547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451546 ?auto_451547 ) ( ON-TABLE ?auto_451535 ) ( ON ?auto_451536 ?auto_451535 ) ( ON ?auto_451537 ?auto_451536 ) ( ON ?auto_451538 ?auto_451537 ) ( ON ?auto_451539 ?auto_451538 ) ( ON ?auto_451540 ?auto_451539 ) ( ON ?auto_451541 ?auto_451540 ) ( ON ?auto_451542 ?auto_451541 ) ( ON ?auto_451543 ?auto_451542 ) ( ON ?auto_451544 ?auto_451543 ) ( not ( = ?auto_451535 ?auto_451536 ) ) ( not ( = ?auto_451535 ?auto_451537 ) ) ( not ( = ?auto_451535 ?auto_451538 ) ) ( not ( = ?auto_451535 ?auto_451539 ) ) ( not ( = ?auto_451535 ?auto_451540 ) ) ( not ( = ?auto_451535 ?auto_451541 ) ) ( not ( = ?auto_451535 ?auto_451542 ) ) ( not ( = ?auto_451535 ?auto_451543 ) ) ( not ( = ?auto_451535 ?auto_451544 ) ) ( not ( = ?auto_451535 ?auto_451545 ) ) ( not ( = ?auto_451535 ?auto_451546 ) ) ( not ( = ?auto_451535 ?auto_451547 ) ) ( not ( = ?auto_451536 ?auto_451537 ) ) ( not ( = ?auto_451536 ?auto_451538 ) ) ( not ( = ?auto_451536 ?auto_451539 ) ) ( not ( = ?auto_451536 ?auto_451540 ) ) ( not ( = ?auto_451536 ?auto_451541 ) ) ( not ( = ?auto_451536 ?auto_451542 ) ) ( not ( = ?auto_451536 ?auto_451543 ) ) ( not ( = ?auto_451536 ?auto_451544 ) ) ( not ( = ?auto_451536 ?auto_451545 ) ) ( not ( = ?auto_451536 ?auto_451546 ) ) ( not ( = ?auto_451536 ?auto_451547 ) ) ( not ( = ?auto_451537 ?auto_451538 ) ) ( not ( = ?auto_451537 ?auto_451539 ) ) ( not ( = ?auto_451537 ?auto_451540 ) ) ( not ( = ?auto_451537 ?auto_451541 ) ) ( not ( = ?auto_451537 ?auto_451542 ) ) ( not ( = ?auto_451537 ?auto_451543 ) ) ( not ( = ?auto_451537 ?auto_451544 ) ) ( not ( = ?auto_451537 ?auto_451545 ) ) ( not ( = ?auto_451537 ?auto_451546 ) ) ( not ( = ?auto_451537 ?auto_451547 ) ) ( not ( = ?auto_451538 ?auto_451539 ) ) ( not ( = ?auto_451538 ?auto_451540 ) ) ( not ( = ?auto_451538 ?auto_451541 ) ) ( not ( = ?auto_451538 ?auto_451542 ) ) ( not ( = ?auto_451538 ?auto_451543 ) ) ( not ( = ?auto_451538 ?auto_451544 ) ) ( not ( = ?auto_451538 ?auto_451545 ) ) ( not ( = ?auto_451538 ?auto_451546 ) ) ( not ( = ?auto_451538 ?auto_451547 ) ) ( not ( = ?auto_451539 ?auto_451540 ) ) ( not ( = ?auto_451539 ?auto_451541 ) ) ( not ( = ?auto_451539 ?auto_451542 ) ) ( not ( = ?auto_451539 ?auto_451543 ) ) ( not ( = ?auto_451539 ?auto_451544 ) ) ( not ( = ?auto_451539 ?auto_451545 ) ) ( not ( = ?auto_451539 ?auto_451546 ) ) ( not ( = ?auto_451539 ?auto_451547 ) ) ( not ( = ?auto_451540 ?auto_451541 ) ) ( not ( = ?auto_451540 ?auto_451542 ) ) ( not ( = ?auto_451540 ?auto_451543 ) ) ( not ( = ?auto_451540 ?auto_451544 ) ) ( not ( = ?auto_451540 ?auto_451545 ) ) ( not ( = ?auto_451540 ?auto_451546 ) ) ( not ( = ?auto_451540 ?auto_451547 ) ) ( not ( = ?auto_451541 ?auto_451542 ) ) ( not ( = ?auto_451541 ?auto_451543 ) ) ( not ( = ?auto_451541 ?auto_451544 ) ) ( not ( = ?auto_451541 ?auto_451545 ) ) ( not ( = ?auto_451541 ?auto_451546 ) ) ( not ( = ?auto_451541 ?auto_451547 ) ) ( not ( = ?auto_451542 ?auto_451543 ) ) ( not ( = ?auto_451542 ?auto_451544 ) ) ( not ( = ?auto_451542 ?auto_451545 ) ) ( not ( = ?auto_451542 ?auto_451546 ) ) ( not ( = ?auto_451542 ?auto_451547 ) ) ( not ( = ?auto_451543 ?auto_451544 ) ) ( not ( = ?auto_451543 ?auto_451545 ) ) ( not ( = ?auto_451543 ?auto_451546 ) ) ( not ( = ?auto_451543 ?auto_451547 ) ) ( not ( = ?auto_451544 ?auto_451545 ) ) ( not ( = ?auto_451544 ?auto_451546 ) ) ( not ( = ?auto_451544 ?auto_451547 ) ) ( not ( = ?auto_451545 ?auto_451546 ) ) ( not ( = ?auto_451545 ?auto_451547 ) ) ( not ( = ?auto_451546 ?auto_451547 ) ) ( CLEAR ?auto_451544 ) ( ON ?auto_451545 ?auto_451546 ) ( CLEAR ?auto_451545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_451535 ?auto_451536 ?auto_451537 ?auto_451538 ?auto_451539 ?auto_451540 ?auto_451541 ?auto_451542 ?auto_451543 ?auto_451544 ?auto_451545 )
      ( MAKE-12PILE ?auto_451535 ?auto_451536 ?auto_451537 ?auto_451538 ?auto_451539 ?auto_451540 ?auto_451541 ?auto_451542 ?auto_451543 ?auto_451544 ?auto_451545 ?auto_451546 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451560 - BLOCK
      ?auto_451561 - BLOCK
      ?auto_451562 - BLOCK
      ?auto_451563 - BLOCK
      ?auto_451564 - BLOCK
      ?auto_451565 - BLOCK
      ?auto_451566 - BLOCK
      ?auto_451567 - BLOCK
      ?auto_451568 - BLOCK
      ?auto_451569 - BLOCK
      ?auto_451570 - BLOCK
      ?auto_451571 - BLOCK
    )
    :vars
    (
      ?auto_451572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451571 ?auto_451572 ) ( ON-TABLE ?auto_451560 ) ( ON ?auto_451561 ?auto_451560 ) ( ON ?auto_451562 ?auto_451561 ) ( ON ?auto_451563 ?auto_451562 ) ( ON ?auto_451564 ?auto_451563 ) ( ON ?auto_451565 ?auto_451564 ) ( ON ?auto_451566 ?auto_451565 ) ( ON ?auto_451567 ?auto_451566 ) ( ON ?auto_451568 ?auto_451567 ) ( not ( = ?auto_451560 ?auto_451561 ) ) ( not ( = ?auto_451560 ?auto_451562 ) ) ( not ( = ?auto_451560 ?auto_451563 ) ) ( not ( = ?auto_451560 ?auto_451564 ) ) ( not ( = ?auto_451560 ?auto_451565 ) ) ( not ( = ?auto_451560 ?auto_451566 ) ) ( not ( = ?auto_451560 ?auto_451567 ) ) ( not ( = ?auto_451560 ?auto_451568 ) ) ( not ( = ?auto_451560 ?auto_451569 ) ) ( not ( = ?auto_451560 ?auto_451570 ) ) ( not ( = ?auto_451560 ?auto_451571 ) ) ( not ( = ?auto_451560 ?auto_451572 ) ) ( not ( = ?auto_451561 ?auto_451562 ) ) ( not ( = ?auto_451561 ?auto_451563 ) ) ( not ( = ?auto_451561 ?auto_451564 ) ) ( not ( = ?auto_451561 ?auto_451565 ) ) ( not ( = ?auto_451561 ?auto_451566 ) ) ( not ( = ?auto_451561 ?auto_451567 ) ) ( not ( = ?auto_451561 ?auto_451568 ) ) ( not ( = ?auto_451561 ?auto_451569 ) ) ( not ( = ?auto_451561 ?auto_451570 ) ) ( not ( = ?auto_451561 ?auto_451571 ) ) ( not ( = ?auto_451561 ?auto_451572 ) ) ( not ( = ?auto_451562 ?auto_451563 ) ) ( not ( = ?auto_451562 ?auto_451564 ) ) ( not ( = ?auto_451562 ?auto_451565 ) ) ( not ( = ?auto_451562 ?auto_451566 ) ) ( not ( = ?auto_451562 ?auto_451567 ) ) ( not ( = ?auto_451562 ?auto_451568 ) ) ( not ( = ?auto_451562 ?auto_451569 ) ) ( not ( = ?auto_451562 ?auto_451570 ) ) ( not ( = ?auto_451562 ?auto_451571 ) ) ( not ( = ?auto_451562 ?auto_451572 ) ) ( not ( = ?auto_451563 ?auto_451564 ) ) ( not ( = ?auto_451563 ?auto_451565 ) ) ( not ( = ?auto_451563 ?auto_451566 ) ) ( not ( = ?auto_451563 ?auto_451567 ) ) ( not ( = ?auto_451563 ?auto_451568 ) ) ( not ( = ?auto_451563 ?auto_451569 ) ) ( not ( = ?auto_451563 ?auto_451570 ) ) ( not ( = ?auto_451563 ?auto_451571 ) ) ( not ( = ?auto_451563 ?auto_451572 ) ) ( not ( = ?auto_451564 ?auto_451565 ) ) ( not ( = ?auto_451564 ?auto_451566 ) ) ( not ( = ?auto_451564 ?auto_451567 ) ) ( not ( = ?auto_451564 ?auto_451568 ) ) ( not ( = ?auto_451564 ?auto_451569 ) ) ( not ( = ?auto_451564 ?auto_451570 ) ) ( not ( = ?auto_451564 ?auto_451571 ) ) ( not ( = ?auto_451564 ?auto_451572 ) ) ( not ( = ?auto_451565 ?auto_451566 ) ) ( not ( = ?auto_451565 ?auto_451567 ) ) ( not ( = ?auto_451565 ?auto_451568 ) ) ( not ( = ?auto_451565 ?auto_451569 ) ) ( not ( = ?auto_451565 ?auto_451570 ) ) ( not ( = ?auto_451565 ?auto_451571 ) ) ( not ( = ?auto_451565 ?auto_451572 ) ) ( not ( = ?auto_451566 ?auto_451567 ) ) ( not ( = ?auto_451566 ?auto_451568 ) ) ( not ( = ?auto_451566 ?auto_451569 ) ) ( not ( = ?auto_451566 ?auto_451570 ) ) ( not ( = ?auto_451566 ?auto_451571 ) ) ( not ( = ?auto_451566 ?auto_451572 ) ) ( not ( = ?auto_451567 ?auto_451568 ) ) ( not ( = ?auto_451567 ?auto_451569 ) ) ( not ( = ?auto_451567 ?auto_451570 ) ) ( not ( = ?auto_451567 ?auto_451571 ) ) ( not ( = ?auto_451567 ?auto_451572 ) ) ( not ( = ?auto_451568 ?auto_451569 ) ) ( not ( = ?auto_451568 ?auto_451570 ) ) ( not ( = ?auto_451568 ?auto_451571 ) ) ( not ( = ?auto_451568 ?auto_451572 ) ) ( not ( = ?auto_451569 ?auto_451570 ) ) ( not ( = ?auto_451569 ?auto_451571 ) ) ( not ( = ?auto_451569 ?auto_451572 ) ) ( not ( = ?auto_451570 ?auto_451571 ) ) ( not ( = ?auto_451570 ?auto_451572 ) ) ( not ( = ?auto_451571 ?auto_451572 ) ) ( ON ?auto_451570 ?auto_451571 ) ( CLEAR ?auto_451568 ) ( ON ?auto_451569 ?auto_451570 ) ( CLEAR ?auto_451569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_451560 ?auto_451561 ?auto_451562 ?auto_451563 ?auto_451564 ?auto_451565 ?auto_451566 ?auto_451567 ?auto_451568 ?auto_451569 )
      ( MAKE-12PILE ?auto_451560 ?auto_451561 ?auto_451562 ?auto_451563 ?auto_451564 ?auto_451565 ?auto_451566 ?auto_451567 ?auto_451568 ?auto_451569 ?auto_451570 ?auto_451571 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451585 - BLOCK
      ?auto_451586 - BLOCK
      ?auto_451587 - BLOCK
      ?auto_451588 - BLOCK
      ?auto_451589 - BLOCK
      ?auto_451590 - BLOCK
      ?auto_451591 - BLOCK
      ?auto_451592 - BLOCK
      ?auto_451593 - BLOCK
      ?auto_451594 - BLOCK
      ?auto_451595 - BLOCK
      ?auto_451596 - BLOCK
    )
    :vars
    (
      ?auto_451597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451596 ?auto_451597 ) ( ON-TABLE ?auto_451585 ) ( ON ?auto_451586 ?auto_451585 ) ( ON ?auto_451587 ?auto_451586 ) ( ON ?auto_451588 ?auto_451587 ) ( ON ?auto_451589 ?auto_451588 ) ( ON ?auto_451590 ?auto_451589 ) ( ON ?auto_451591 ?auto_451590 ) ( ON ?auto_451592 ?auto_451591 ) ( ON ?auto_451593 ?auto_451592 ) ( not ( = ?auto_451585 ?auto_451586 ) ) ( not ( = ?auto_451585 ?auto_451587 ) ) ( not ( = ?auto_451585 ?auto_451588 ) ) ( not ( = ?auto_451585 ?auto_451589 ) ) ( not ( = ?auto_451585 ?auto_451590 ) ) ( not ( = ?auto_451585 ?auto_451591 ) ) ( not ( = ?auto_451585 ?auto_451592 ) ) ( not ( = ?auto_451585 ?auto_451593 ) ) ( not ( = ?auto_451585 ?auto_451594 ) ) ( not ( = ?auto_451585 ?auto_451595 ) ) ( not ( = ?auto_451585 ?auto_451596 ) ) ( not ( = ?auto_451585 ?auto_451597 ) ) ( not ( = ?auto_451586 ?auto_451587 ) ) ( not ( = ?auto_451586 ?auto_451588 ) ) ( not ( = ?auto_451586 ?auto_451589 ) ) ( not ( = ?auto_451586 ?auto_451590 ) ) ( not ( = ?auto_451586 ?auto_451591 ) ) ( not ( = ?auto_451586 ?auto_451592 ) ) ( not ( = ?auto_451586 ?auto_451593 ) ) ( not ( = ?auto_451586 ?auto_451594 ) ) ( not ( = ?auto_451586 ?auto_451595 ) ) ( not ( = ?auto_451586 ?auto_451596 ) ) ( not ( = ?auto_451586 ?auto_451597 ) ) ( not ( = ?auto_451587 ?auto_451588 ) ) ( not ( = ?auto_451587 ?auto_451589 ) ) ( not ( = ?auto_451587 ?auto_451590 ) ) ( not ( = ?auto_451587 ?auto_451591 ) ) ( not ( = ?auto_451587 ?auto_451592 ) ) ( not ( = ?auto_451587 ?auto_451593 ) ) ( not ( = ?auto_451587 ?auto_451594 ) ) ( not ( = ?auto_451587 ?auto_451595 ) ) ( not ( = ?auto_451587 ?auto_451596 ) ) ( not ( = ?auto_451587 ?auto_451597 ) ) ( not ( = ?auto_451588 ?auto_451589 ) ) ( not ( = ?auto_451588 ?auto_451590 ) ) ( not ( = ?auto_451588 ?auto_451591 ) ) ( not ( = ?auto_451588 ?auto_451592 ) ) ( not ( = ?auto_451588 ?auto_451593 ) ) ( not ( = ?auto_451588 ?auto_451594 ) ) ( not ( = ?auto_451588 ?auto_451595 ) ) ( not ( = ?auto_451588 ?auto_451596 ) ) ( not ( = ?auto_451588 ?auto_451597 ) ) ( not ( = ?auto_451589 ?auto_451590 ) ) ( not ( = ?auto_451589 ?auto_451591 ) ) ( not ( = ?auto_451589 ?auto_451592 ) ) ( not ( = ?auto_451589 ?auto_451593 ) ) ( not ( = ?auto_451589 ?auto_451594 ) ) ( not ( = ?auto_451589 ?auto_451595 ) ) ( not ( = ?auto_451589 ?auto_451596 ) ) ( not ( = ?auto_451589 ?auto_451597 ) ) ( not ( = ?auto_451590 ?auto_451591 ) ) ( not ( = ?auto_451590 ?auto_451592 ) ) ( not ( = ?auto_451590 ?auto_451593 ) ) ( not ( = ?auto_451590 ?auto_451594 ) ) ( not ( = ?auto_451590 ?auto_451595 ) ) ( not ( = ?auto_451590 ?auto_451596 ) ) ( not ( = ?auto_451590 ?auto_451597 ) ) ( not ( = ?auto_451591 ?auto_451592 ) ) ( not ( = ?auto_451591 ?auto_451593 ) ) ( not ( = ?auto_451591 ?auto_451594 ) ) ( not ( = ?auto_451591 ?auto_451595 ) ) ( not ( = ?auto_451591 ?auto_451596 ) ) ( not ( = ?auto_451591 ?auto_451597 ) ) ( not ( = ?auto_451592 ?auto_451593 ) ) ( not ( = ?auto_451592 ?auto_451594 ) ) ( not ( = ?auto_451592 ?auto_451595 ) ) ( not ( = ?auto_451592 ?auto_451596 ) ) ( not ( = ?auto_451592 ?auto_451597 ) ) ( not ( = ?auto_451593 ?auto_451594 ) ) ( not ( = ?auto_451593 ?auto_451595 ) ) ( not ( = ?auto_451593 ?auto_451596 ) ) ( not ( = ?auto_451593 ?auto_451597 ) ) ( not ( = ?auto_451594 ?auto_451595 ) ) ( not ( = ?auto_451594 ?auto_451596 ) ) ( not ( = ?auto_451594 ?auto_451597 ) ) ( not ( = ?auto_451595 ?auto_451596 ) ) ( not ( = ?auto_451595 ?auto_451597 ) ) ( not ( = ?auto_451596 ?auto_451597 ) ) ( ON ?auto_451595 ?auto_451596 ) ( CLEAR ?auto_451593 ) ( ON ?auto_451594 ?auto_451595 ) ( CLEAR ?auto_451594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_451585 ?auto_451586 ?auto_451587 ?auto_451588 ?auto_451589 ?auto_451590 ?auto_451591 ?auto_451592 ?auto_451593 ?auto_451594 )
      ( MAKE-12PILE ?auto_451585 ?auto_451586 ?auto_451587 ?auto_451588 ?auto_451589 ?auto_451590 ?auto_451591 ?auto_451592 ?auto_451593 ?auto_451594 ?auto_451595 ?auto_451596 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451610 - BLOCK
      ?auto_451611 - BLOCK
      ?auto_451612 - BLOCK
      ?auto_451613 - BLOCK
      ?auto_451614 - BLOCK
      ?auto_451615 - BLOCK
      ?auto_451616 - BLOCK
      ?auto_451617 - BLOCK
      ?auto_451618 - BLOCK
      ?auto_451619 - BLOCK
      ?auto_451620 - BLOCK
      ?auto_451621 - BLOCK
    )
    :vars
    (
      ?auto_451622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451621 ?auto_451622 ) ( ON-TABLE ?auto_451610 ) ( ON ?auto_451611 ?auto_451610 ) ( ON ?auto_451612 ?auto_451611 ) ( ON ?auto_451613 ?auto_451612 ) ( ON ?auto_451614 ?auto_451613 ) ( ON ?auto_451615 ?auto_451614 ) ( ON ?auto_451616 ?auto_451615 ) ( ON ?auto_451617 ?auto_451616 ) ( not ( = ?auto_451610 ?auto_451611 ) ) ( not ( = ?auto_451610 ?auto_451612 ) ) ( not ( = ?auto_451610 ?auto_451613 ) ) ( not ( = ?auto_451610 ?auto_451614 ) ) ( not ( = ?auto_451610 ?auto_451615 ) ) ( not ( = ?auto_451610 ?auto_451616 ) ) ( not ( = ?auto_451610 ?auto_451617 ) ) ( not ( = ?auto_451610 ?auto_451618 ) ) ( not ( = ?auto_451610 ?auto_451619 ) ) ( not ( = ?auto_451610 ?auto_451620 ) ) ( not ( = ?auto_451610 ?auto_451621 ) ) ( not ( = ?auto_451610 ?auto_451622 ) ) ( not ( = ?auto_451611 ?auto_451612 ) ) ( not ( = ?auto_451611 ?auto_451613 ) ) ( not ( = ?auto_451611 ?auto_451614 ) ) ( not ( = ?auto_451611 ?auto_451615 ) ) ( not ( = ?auto_451611 ?auto_451616 ) ) ( not ( = ?auto_451611 ?auto_451617 ) ) ( not ( = ?auto_451611 ?auto_451618 ) ) ( not ( = ?auto_451611 ?auto_451619 ) ) ( not ( = ?auto_451611 ?auto_451620 ) ) ( not ( = ?auto_451611 ?auto_451621 ) ) ( not ( = ?auto_451611 ?auto_451622 ) ) ( not ( = ?auto_451612 ?auto_451613 ) ) ( not ( = ?auto_451612 ?auto_451614 ) ) ( not ( = ?auto_451612 ?auto_451615 ) ) ( not ( = ?auto_451612 ?auto_451616 ) ) ( not ( = ?auto_451612 ?auto_451617 ) ) ( not ( = ?auto_451612 ?auto_451618 ) ) ( not ( = ?auto_451612 ?auto_451619 ) ) ( not ( = ?auto_451612 ?auto_451620 ) ) ( not ( = ?auto_451612 ?auto_451621 ) ) ( not ( = ?auto_451612 ?auto_451622 ) ) ( not ( = ?auto_451613 ?auto_451614 ) ) ( not ( = ?auto_451613 ?auto_451615 ) ) ( not ( = ?auto_451613 ?auto_451616 ) ) ( not ( = ?auto_451613 ?auto_451617 ) ) ( not ( = ?auto_451613 ?auto_451618 ) ) ( not ( = ?auto_451613 ?auto_451619 ) ) ( not ( = ?auto_451613 ?auto_451620 ) ) ( not ( = ?auto_451613 ?auto_451621 ) ) ( not ( = ?auto_451613 ?auto_451622 ) ) ( not ( = ?auto_451614 ?auto_451615 ) ) ( not ( = ?auto_451614 ?auto_451616 ) ) ( not ( = ?auto_451614 ?auto_451617 ) ) ( not ( = ?auto_451614 ?auto_451618 ) ) ( not ( = ?auto_451614 ?auto_451619 ) ) ( not ( = ?auto_451614 ?auto_451620 ) ) ( not ( = ?auto_451614 ?auto_451621 ) ) ( not ( = ?auto_451614 ?auto_451622 ) ) ( not ( = ?auto_451615 ?auto_451616 ) ) ( not ( = ?auto_451615 ?auto_451617 ) ) ( not ( = ?auto_451615 ?auto_451618 ) ) ( not ( = ?auto_451615 ?auto_451619 ) ) ( not ( = ?auto_451615 ?auto_451620 ) ) ( not ( = ?auto_451615 ?auto_451621 ) ) ( not ( = ?auto_451615 ?auto_451622 ) ) ( not ( = ?auto_451616 ?auto_451617 ) ) ( not ( = ?auto_451616 ?auto_451618 ) ) ( not ( = ?auto_451616 ?auto_451619 ) ) ( not ( = ?auto_451616 ?auto_451620 ) ) ( not ( = ?auto_451616 ?auto_451621 ) ) ( not ( = ?auto_451616 ?auto_451622 ) ) ( not ( = ?auto_451617 ?auto_451618 ) ) ( not ( = ?auto_451617 ?auto_451619 ) ) ( not ( = ?auto_451617 ?auto_451620 ) ) ( not ( = ?auto_451617 ?auto_451621 ) ) ( not ( = ?auto_451617 ?auto_451622 ) ) ( not ( = ?auto_451618 ?auto_451619 ) ) ( not ( = ?auto_451618 ?auto_451620 ) ) ( not ( = ?auto_451618 ?auto_451621 ) ) ( not ( = ?auto_451618 ?auto_451622 ) ) ( not ( = ?auto_451619 ?auto_451620 ) ) ( not ( = ?auto_451619 ?auto_451621 ) ) ( not ( = ?auto_451619 ?auto_451622 ) ) ( not ( = ?auto_451620 ?auto_451621 ) ) ( not ( = ?auto_451620 ?auto_451622 ) ) ( not ( = ?auto_451621 ?auto_451622 ) ) ( ON ?auto_451620 ?auto_451621 ) ( ON ?auto_451619 ?auto_451620 ) ( CLEAR ?auto_451617 ) ( ON ?auto_451618 ?auto_451619 ) ( CLEAR ?auto_451618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_451610 ?auto_451611 ?auto_451612 ?auto_451613 ?auto_451614 ?auto_451615 ?auto_451616 ?auto_451617 ?auto_451618 )
      ( MAKE-12PILE ?auto_451610 ?auto_451611 ?auto_451612 ?auto_451613 ?auto_451614 ?auto_451615 ?auto_451616 ?auto_451617 ?auto_451618 ?auto_451619 ?auto_451620 ?auto_451621 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451635 - BLOCK
      ?auto_451636 - BLOCK
      ?auto_451637 - BLOCK
      ?auto_451638 - BLOCK
      ?auto_451639 - BLOCK
      ?auto_451640 - BLOCK
      ?auto_451641 - BLOCK
      ?auto_451642 - BLOCK
      ?auto_451643 - BLOCK
      ?auto_451644 - BLOCK
      ?auto_451645 - BLOCK
      ?auto_451646 - BLOCK
    )
    :vars
    (
      ?auto_451647 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451646 ?auto_451647 ) ( ON-TABLE ?auto_451635 ) ( ON ?auto_451636 ?auto_451635 ) ( ON ?auto_451637 ?auto_451636 ) ( ON ?auto_451638 ?auto_451637 ) ( ON ?auto_451639 ?auto_451638 ) ( ON ?auto_451640 ?auto_451639 ) ( ON ?auto_451641 ?auto_451640 ) ( ON ?auto_451642 ?auto_451641 ) ( not ( = ?auto_451635 ?auto_451636 ) ) ( not ( = ?auto_451635 ?auto_451637 ) ) ( not ( = ?auto_451635 ?auto_451638 ) ) ( not ( = ?auto_451635 ?auto_451639 ) ) ( not ( = ?auto_451635 ?auto_451640 ) ) ( not ( = ?auto_451635 ?auto_451641 ) ) ( not ( = ?auto_451635 ?auto_451642 ) ) ( not ( = ?auto_451635 ?auto_451643 ) ) ( not ( = ?auto_451635 ?auto_451644 ) ) ( not ( = ?auto_451635 ?auto_451645 ) ) ( not ( = ?auto_451635 ?auto_451646 ) ) ( not ( = ?auto_451635 ?auto_451647 ) ) ( not ( = ?auto_451636 ?auto_451637 ) ) ( not ( = ?auto_451636 ?auto_451638 ) ) ( not ( = ?auto_451636 ?auto_451639 ) ) ( not ( = ?auto_451636 ?auto_451640 ) ) ( not ( = ?auto_451636 ?auto_451641 ) ) ( not ( = ?auto_451636 ?auto_451642 ) ) ( not ( = ?auto_451636 ?auto_451643 ) ) ( not ( = ?auto_451636 ?auto_451644 ) ) ( not ( = ?auto_451636 ?auto_451645 ) ) ( not ( = ?auto_451636 ?auto_451646 ) ) ( not ( = ?auto_451636 ?auto_451647 ) ) ( not ( = ?auto_451637 ?auto_451638 ) ) ( not ( = ?auto_451637 ?auto_451639 ) ) ( not ( = ?auto_451637 ?auto_451640 ) ) ( not ( = ?auto_451637 ?auto_451641 ) ) ( not ( = ?auto_451637 ?auto_451642 ) ) ( not ( = ?auto_451637 ?auto_451643 ) ) ( not ( = ?auto_451637 ?auto_451644 ) ) ( not ( = ?auto_451637 ?auto_451645 ) ) ( not ( = ?auto_451637 ?auto_451646 ) ) ( not ( = ?auto_451637 ?auto_451647 ) ) ( not ( = ?auto_451638 ?auto_451639 ) ) ( not ( = ?auto_451638 ?auto_451640 ) ) ( not ( = ?auto_451638 ?auto_451641 ) ) ( not ( = ?auto_451638 ?auto_451642 ) ) ( not ( = ?auto_451638 ?auto_451643 ) ) ( not ( = ?auto_451638 ?auto_451644 ) ) ( not ( = ?auto_451638 ?auto_451645 ) ) ( not ( = ?auto_451638 ?auto_451646 ) ) ( not ( = ?auto_451638 ?auto_451647 ) ) ( not ( = ?auto_451639 ?auto_451640 ) ) ( not ( = ?auto_451639 ?auto_451641 ) ) ( not ( = ?auto_451639 ?auto_451642 ) ) ( not ( = ?auto_451639 ?auto_451643 ) ) ( not ( = ?auto_451639 ?auto_451644 ) ) ( not ( = ?auto_451639 ?auto_451645 ) ) ( not ( = ?auto_451639 ?auto_451646 ) ) ( not ( = ?auto_451639 ?auto_451647 ) ) ( not ( = ?auto_451640 ?auto_451641 ) ) ( not ( = ?auto_451640 ?auto_451642 ) ) ( not ( = ?auto_451640 ?auto_451643 ) ) ( not ( = ?auto_451640 ?auto_451644 ) ) ( not ( = ?auto_451640 ?auto_451645 ) ) ( not ( = ?auto_451640 ?auto_451646 ) ) ( not ( = ?auto_451640 ?auto_451647 ) ) ( not ( = ?auto_451641 ?auto_451642 ) ) ( not ( = ?auto_451641 ?auto_451643 ) ) ( not ( = ?auto_451641 ?auto_451644 ) ) ( not ( = ?auto_451641 ?auto_451645 ) ) ( not ( = ?auto_451641 ?auto_451646 ) ) ( not ( = ?auto_451641 ?auto_451647 ) ) ( not ( = ?auto_451642 ?auto_451643 ) ) ( not ( = ?auto_451642 ?auto_451644 ) ) ( not ( = ?auto_451642 ?auto_451645 ) ) ( not ( = ?auto_451642 ?auto_451646 ) ) ( not ( = ?auto_451642 ?auto_451647 ) ) ( not ( = ?auto_451643 ?auto_451644 ) ) ( not ( = ?auto_451643 ?auto_451645 ) ) ( not ( = ?auto_451643 ?auto_451646 ) ) ( not ( = ?auto_451643 ?auto_451647 ) ) ( not ( = ?auto_451644 ?auto_451645 ) ) ( not ( = ?auto_451644 ?auto_451646 ) ) ( not ( = ?auto_451644 ?auto_451647 ) ) ( not ( = ?auto_451645 ?auto_451646 ) ) ( not ( = ?auto_451645 ?auto_451647 ) ) ( not ( = ?auto_451646 ?auto_451647 ) ) ( ON ?auto_451645 ?auto_451646 ) ( ON ?auto_451644 ?auto_451645 ) ( CLEAR ?auto_451642 ) ( ON ?auto_451643 ?auto_451644 ) ( CLEAR ?auto_451643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_451635 ?auto_451636 ?auto_451637 ?auto_451638 ?auto_451639 ?auto_451640 ?auto_451641 ?auto_451642 ?auto_451643 )
      ( MAKE-12PILE ?auto_451635 ?auto_451636 ?auto_451637 ?auto_451638 ?auto_451639 ?auto_451640 ?auto_451641 ?auto_451642 ?auto_451643 ?auto_451644 ?auto_451645 ?auto_451646 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451660 - BLOCK
      ?auto_451661 - BLOCK
      ?auto_451662 - BLOCK
      ?auto_451663 - BLOCK
      ?auto_451664 - BLOCK
      ?auto_451665 - BLOCK
      ?auto_451666 - BLOCK
      ?auto_451667 - BLOCK
      ?auto_451668 - BLOCK
      ?auto_451669 - BLOCK
      ?auto_451670 - BLOCK
      ?auto_451671 - BLOCK
    )
    :vars
    (
      ?auto_451672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451671 ?auto_451672 ) ( ON-TABLE ?auto_451660 ) ( ON ?auto_451661 ?auto_451660 ) ( ON ?auto_451662 ?auto_451661 ) ( ON ?auto_451663 ?auto_451662 ) ( ON ?auto_451664 ?auto_451663 ) ( ON ?auto_451665 ?auto_451664 ) ( ON ?auto_451666 ?auto_451665 ) ( not ( = ?auto_451660 ?auto_451661 ) ) ( not ( = ?auto_451660 ?auto_451662 ) ) ( not ( = ?auto_451660 ?auto_451663 ) ) ( not ( = ?auto_451660 ?auto_451664 ) ) ( not ( = ?auto_451660 ?auto_451665 ) ) ( not ( = ?auto_451660 ?auto_451666 ) ) ( not ( = ?auto_451660 ?auto_451667 ) ) ( not ( = ?auto_451660 ?auto_451668 ) ) ( not ( = ?auto_451660 ?auto_451669 ) ) ( not ( = ?auto_451660 ?auto_451670 ) ) ( not ( = ?auto_451660 ?auto_451671 ) ) ( not ( = ?auto_451660 ?auto_451672 ) ) ( not ( = ?auto_451661 ?auto_451662 ) ) ( not ( = ?auto_451661 ?auto_451663 ) ) ( not ( = ?auto_451661 ?auto_451664 ) ) ( not ( = ?auto_451661 ?auto_451665 ) ) ( not ( = ?auto_451661 ?auto_451666 ) ) ( not ( = ?auto_451661 ?auto_451667 ) ) ( not ( = ?auto_451661 ?auto_451668 ) ) ( not ( = ?auto_451661 ?auto_451669 ) ) ( not ( = ?auto_451661 ?auto_451670 ) ) ( not ( = ?auto_451661 ?auto_451671 ) ) ( not ( = ?auto_451661 ?auto_451672 ) ) ( not ( = ?auto_451662 ?auto_451663 ) ) ( not ( = ?auto_451662 ?auto_451664 ) ) ( not ( = ?auto_451662 ?auto_451665 ) ) ( not ( = ?auto_451662 ?auto_451666 ) ) ( not ( = ?auto_451662 ?auto_451667 ) ) ( not ( = ?auto_451662 ?auto_451668 ) ) ( not ( = ?auto_451662 ?auto_451669 ) ) ( not ( = ?auto_451662 ?auto_451670 ) ) ( not ( = ?auto_451662 ?auto_451671 ) ) ( not ( = ?auto_451662 ?auto_451672 ) ) ( not ( = ?auto_451663 ?auto_451664 ) ) ( not ( = ?auto_451663 ?auto_451665 ) ) ( not ( = ?auto_451663 ?auto_451666 ) ) ( not ( = ?auto_451663 ?auto_451667 ) ) ( not ( = ?auto_451663 ?auto_451668 ) ) ( not ( = ?auto_451663 ?auto_451669 ) ) ( not ( = ?auto_451663 ?auto_451670 ) ) ( not ( = ?auto_451663 ?auto_451671 ) ) ( not ( = ?auto_451663 ?auto_451672 ) ) ( not ( = ?auto_451664 ?auto_451665 ) ) ( not ( = ?auto_451664 ?auto_451666 ) ) ( not ( = ?auto_451664 ?auto_451667 ) ) ( not ( = ?auto_451664 ?auto_451668 ) ) ( not ( = ?auto_451664 ?auto_451669 ) ) ( not ( = ?auto_451664 ?auto_451670 ) ) ( not ( = ?auto_451664 ?auto_451671 ) ) ( not ( = ?auto_451664 ?auto_451672 ) ) ( not ( = ?auto_451665 ?auto_451666 ) ) ( not ( = ?auto_451665 ?auto_451667 ) ) ( not ( = ?auto_451665 ?auto_451668 ) ) ( not ( = ?auto_451665 ?auto_451669 ) ) ( not ( = ?auto_451665 ?auto_451670 ) ) ( not ( = ?auto_451665 ?auto_451671 ) ) ( not ( = ?auto_451665 ?auto_451672 ) ) ( not ( = ?auto_451666 ?auto_451667 ) ) ( not ( = ?auto_451666 ?auto_451668 ) ) ( not ( = ?auto_451666 ?auto_451669 ) ) ( not ( = ?auto_451666 ?auto_451670 ) ) ( not ( = ?auto_451666 ?auto_451671 ) ) ( not ( = ?auto_451666 ?auto_451672 ) ) ( not ( = ?auto_451667 ?auto_451668 ) ) ( not ( = ?auto_451667 ?auto_451669 ) ) ( not ( = ?auto_451667 ?auto_451670 ) ) ( not ( = ?auto_451667 ?auto_451671 ) ) ( not ( = ?auto_451667 ?auto_451672 ) ) ( not ( = ?auto_451668 ?auto_451669 ) ) ( not ( = ?auto_451668 ?auto_451670 ) ) ( not ( = ?auto_451668 ?auto_451671 ) ) ( not ( = ?auto_451668 ?auto_451672 ) ) ( not ( = ?auto_451669 ?auto_451670 ) ) ( not ( = ?auto_451669 ?auto_451671 ) ) ( not ( = ?auto_451669 ?auto_451672 ) ) ( not ( = ?auto_451670 ?auto_451671 ) ) ( not ( = ?auto_451670 ?auto_451672 ) ) ( not ( = ?auto_451671 ?auto_451672 ) ) ( ON ?auto_451670 ?auto_451671 ) ( ON ?auto_451669 ?auto_451670 ) ( ON ?auto_451668 ?auto_451669 ) ( CLEAR ?auto_451666 ) ( ON ?auto_451667 ?auto_451668 ) ( CLEAR ?auto_451667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_451660 ?auto_451661 ?auto_451662 ?auto_451663 ?auto_451664 ?auto_451665 ?auto_451666 ?auto_451667 )
      ( MAKE-12PILE ?auto_451660 ?auto_451661 ?auto_451662 ?auto_451663 ?auto_451664 ?auto_451665 ?auto_451666 ?auto_451667 ?auto_451668 ?auto_451669 ?auto_451670 ?auto_451671 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451685 - BLOCK
      ?auto_451686 - BLOCK
      ?auto_451687 - BLOCK
      ?auto_451688 - BLOCK
      ?auto_451689 - BLOCK
      ?auto_451690 - BLOCK
      ?auto_451691 - BLOCK
      ?auto_451692 - BLOCK
      ?auto_451693 - BLOCK
      ?auto_451694 - BLOCK
      ?auto_451695 - BLOCK
      ?auto_451696 - BLOCK
    )
    :vars
    (
      ?auto_451697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451696 ?auto_451697 ) ( ON-TABLE ?auto_451685 ) ( ON ?auto_451686 ?auto_451685 ) ( ON ?auto_451687 ?auto_451686 ) ( ON ?auto_451688 ?auto_451687 ) ( ON ?auto_451689 ?auto_451688 ) ( ON ?auto_451690 ?auto_451689 ) ( ON ?auto_451691 ?auto_451690 ) ( not ( = ?auto_451685 ?auto_451686 ) ) ( not ( = ?auto_451685 ?auto_451687 ) ) ( not ( = ?auto_451685 ?auto_451688 ) ) ( not ( = ?auto_451685 ?auto_451689 ) ) ( not ( = ?auto_451685 ?auto_451690 ) ) ( not ( = ?auto_451685 ?auto_451691 ) ) ( not ( = ?auto_451685 ?auto_451692 ) ) ( not ( = ?auto_451685 ?auto_451693 ) ) ( not ( = ?auto_451685 ?auto_451694 ) ) ( not ( = ?auto_451685 ?auto_451695 ) ) ( not ( = ?auto_451685 ?auto_451696 ) ) ( not ( = ?auto_451685 ?auto_451697 ) ) ( not ( = ?auto_451686 ?auto_451687 ) ) ( not ( = ?auto_451686 ?auto_451688 ) ) ( not ( = ?auto_451686 ?auto_451689 ) ) ( not ( = ?auto_451686 ?auto_451690 ) ) ( not ( = ?auto_451686 ?auto_451691 ) ) ( not ( = ?auto_451686 ?auto_451692 ) ) ( not ( = ?auto_451686 ?auto_451693 ) ) ( not ( = ?auto_451686 ?auto_451694 ) ) ( not ( = ?auto_451686 ?auto_451695 ) ) ( not ( = ?auto_451686 ?auto_451696 ) ) ( not ( = ?auto_451686 ?auto_451697 ) ) ( not ( = ?auto_451687 ?auto_451688 ) ) ( not ( = ?auto_451687 ?auto_451689 ) ) ( not ( = ?auto_451687 ?auto_451690 ) ) ( not ( = ?auto_451687 ?auto_451691 ) ) ( not ( = ?auto_451687 ?auto_451692 ) ) ( not ( = ?auto_451687 ?auto_451693 ) ) ( not ( = ?auto_451687 ?auto_451694 ) ) ( not ( = ?auto_451687 ?auto_451695 ) ) ( not ( = ?auto_451687 ?auto_451696 ) ) ( not ( = ?auto_451687 ?auto_451697 ) ) ( not ( = ?auto_451688 ?auto_451689 ) ) ( not ( = ?auto_451688 ?auto_451690 ) ) ( not ( = ?auto_451688 ?auto_451691 ) ) ( not ( = ?auto_451688 ?auto_451692 ) ) ( not ( = ?auto_451688 ?auto_451693 ) ) ( not ( = ?auto_451688 ?auto_451694 ) ) ( not ( = ?auto_451688 ?auto_451695 ) ) ( not ( = ?auto_451688 ?auto_451696 ) ) ( not ( = ?auto_451688 ?auto_451697 ) ) ( not ( = ?auto_451689 ?auto_451690 ) ) ( not ( = ?auto_451689 ?auto_451691 ) ) ( not ( = ?auto_451689 ?auto_451692 ) ) ( not ( = ?auto_451689 ?auto_451693 ) ) ( not ( = ?auto_451689 ?auto_451694 ) ) ( not ( = ?auto_451689 ?auto_451695 ) ) ( not ( = ?auto_451689 ?auto_451696 ) ) ( not ( = ?auto_451689 ?auto_451697 ) ) ( not ( = ?auto_451690 ?auto_451691 ) ) ( not ( = ?auto_451690 ?auto_451692 ) ) ( not ( = ?auto_451690 ?auto_451693 ) ) ( not ( = ?auto_451690 ?auto_451694 ) ) ( not ( = ?auto_451690 ?auto_451695 ) ) ( not ( = ?auto_451690 ?auto_451696 ) ) ( not ( = ?auto_451690 ?auto_451697 ) ) ( not ( = ?auto_451691 ?auto_451692 ) ) ( not ( = ?auto_451691 ?auto_451693 ) ) ( not ( = ?auto_451691 ?auto_451694 ) ) ( not ( = ?auto_451691 ?auto_451695 ) ) ( not ( = ?auto_451691 ?auto_451696 ) ) ( not ( = ?auto_451691 ?auto_451697 ) ) ( not ( = ?auto_451692 ?auto_451693 ) ) ( not ( = ?auto_451692 ?auto_451694 ) ) ( not ( = ?auto_451692 ?auto_451695 ) ) ( not ( = ?auto_451692 ?auto_451696 ) ) ( not ( = ?auto_451692 ?auto_451697 ) ) ( not ( = ?auto_451693 ?auto_451694 ) ) ( not ( = ?auto_451693 ?auto_451695 ) ) ( not ( = ?auto_451693 ?auto_451696 ) ) ( not ( = ?auto_451693 ?auto_451697 ) ) ( not ( = ?auto_451694 ?auto_451695 ) ) ( not ( = ?auto_451694 ?auto_451696 ) ) ( not ( = ?auto_451694 ?auto_451697 ) ) ( not ( = ?auto_451695 ?auto_451696 ) ) ( not ( = ?auto_451695 ?auto_451697 ) ) ( not ( = ?auto_451696 ?auto_451697 ) ) ( ON ?auto_451695 ?auto_451696 ) ( ON ?auto_451694 ?auto_451695 ) ( ON ?auto_451693 ?auto_451694 ) ( CLEAR ?auto_451691 ) ( ON ?auto_451692 ?auto_451693 ) ( CLEAR ?auto_451692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_451685 ?auto_451686 ?auto_451687 ?auto_451688 ?auto_451689 ?auto_451690 ?auto_451691 ?auto_451692 )
      ( MAKE-12PILE ?auto_451685 ?auto_451686 ?auto_451687 ?auto_451688 ?auto_451689 ?auto_451690 ?auto_451691 ?auto_451692 ?auto_451693 ?auto_451694 ?auto_451695 ?auto_451696 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451710 - BLOCK
      ?auto_451711 - BLOCK
      ?auto_451712 - BLOCK
      ?auto_451713 - BLOCK
      ?auto_451714 - BLOCK
      ?auto_451715 - BLOCK
      ?auto_451716 - BLOCK
      ?auto_451717 - BLOCK
      ?auto_451718 - BLOCK
      ?auto_451719 - BLOCK
      ?auto_451720 - BLOCK
      ?auto_451721 - BLOCK
    )
    :vars
    (
      ?auto_451722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451721 ?auto_451722 ) ( ON-TABLE ?auto_451710 ) ( ON ?auto_451711 ?auto_451710 ) ( ON ?auto_451712 ?auto_451711 ) ( ON ?auto_451713 ?auto_451712 ) ( ON ?auto_451714 ?auto_451713 ) ( ON ?auto_451715 ?auto_451714 ) ( not ( = ?auto_451710 ?auto_451711 ) ) ( not ( = ?auto_451710 ?auto_451712 ) ) ( not ( = ?auto_451710 ?auto_451713 ) ) ( not ( = ?auto_451710 ?auto_451714 ) ) ( not ( = ?auto_451710 ?auto_451715 ) ) ( not ( = ?auto_451710 ?auto_451716 ) ) ( not ( = ?auto_451710 ?auto_451717 ) ) ( not ( = ?auto_451710 ?auto_451718 ) ) ( not ( = ?auto_451710 ?auto_451719 ) ) ( not ( = ?auto_451710 ?auto_451720 ) ) ( not ( = ?auto_451710 ?auto_451721 ) ) ( not ( = ?auto_451710 ?auto_451722 ) ) ( not ( = ?auto_451711 ?auto_451712 ) ) ( not ( = ?auto_451711 ?auto_451713 ) ) ( not ( = ?auto_451711 ?auto_451714 ) ) ( not ( = ?auto_451711 ?auto_451715 ) ) ( not ( = ?auto_451711 ?auto_451716 ) ) ( not ( = ?auto_451711 ?auto_451717 ) ) ( not ( = ?auto_451711 ?auto_451718 ) ) ( not ( = ?auto_451711 ?auto_451719 ) ) ( not ( = ?auto_451711 ?auto_451720 ) ) ( not ( = ?auto_451711 ?auto_451721 ) ) ( not ( = ?auto_451711 ?auto_451722 ) ) ( not ( = ?auto_451712 ?auto_451713 ) ) ( not ( = ?auto_451712 ?auto_451714 ) ) ( not ( = ?auto_451712 ?auto_451715 ) ) ( not ( = ?auto_451712 ?auto_451716 ) ) ( not ( = ?auto_451712 ?auto_451717 ) ) ( not ( = ?auto_451712 ?auto_451718 ) ) ( not ( = ?auto_451712 ?auto_451719 ) ) ( not ( = ?auto_451712 ?auto_451720 ) ) ( not ( = ?auto_451712 ?auto_451721 ) ) ( not ( = ?auto_451712 ?auto_451722 ) ) ( not ( = ?auto_451713 ?auto_451714 ) ) ( not ( = ?auto_451713 ?auto_451715 ) ) ( not ( = ?auto_451713 ?auto_451716 ) ) ( not ( = ?auto_451713 ?auto_451717 ) ) ( not ( = ?auto_451713 ?auto_451718 ) ) ( not ( = ?auto_451713 ?auto_451719 ) ) ( not ( = ?auto_451713 ?auto_451720 ) ) ( not ( = ?auto_451713 ?auto_451721 ) ) ( not ( = ?auto_451713 ?auto_451722 ) ) ( not ( = ?auto_451714 ?auto_451715 ) ) ( not ( = ?auto_451714 ?auto_451716 ) ) ( not ( = ?auto_451714 ?auto_451717 ) ) ( not ( = ?auto_451714 ?auto_451718 ) ) ( not ( = ?auto_451714 ?auto_451719 ) ) ( not ( = ?auto_451714 ?auto_451720 ) ) ( not ( = ?auto_451714 ?auto_451721 ) ) ( not ( = ?auto_451714 ?auto_451722 ) ) ( not ( = ?auto_451715 ?auto_451716 ) ) ( not ( = ?auto_451715 ?auto_451717 ) ) ( not ( = ?auto_451715 ?auto_451718 ) ) ( not ( = ?auto_451715 ?auto_451719 ) ) ( not ( = ?auto_451715 ?auto_451720 ) ) ( not ( = ?auto_451715 ?auto_451721 ) ) ( not ( = ?auto_451715 ?auto_451722 ) ) ( not ( = ?auto_451716 ?auto_451717 ) ) ( not ( = ?auto_451716 ?auto_451718 ) ) ( not ( = ?auto_451716 ?auto_451719 ) ) ( not ( = ?auto_451716 ?auto_451720 ) ) ( not ( = ?auto_451716 ?auto_451721 ) ) ( not ( = ?auto_451716 ?auto_451722 ) ) ( not ( = ?auto_451717 ?auto_451718 ) ) ( not ( = ?auto_451717 ?auto_451719 ) ) ( not ( = ?auto_451717 ?auto_451720 ) ) ( not ( = ?auto_451717 ?auto_451721 ) ) ( not ( = ?auto_451717 ?auto_451722 ) ) ( not ( = ?auto_451718 ?auto_451719 ) ) ( not ( = ?auto_451718 ?auto_451720 ) ) ( not ( = ?auto_451718 ?auto_451721 ) ) ( not ( = ?auto_451718 ?auto_451722 ) ) ( not ( = ?auto_451719 ?auto_451720 ) ) ( not ( = ?auto_451719 ?auto_451721 ) ) ( not ( = ?auto_451719 ?auto_451722 ) ) ( not ( = ?auto_451720 ?auto_451721 ) ) ( not ( = ?auto_451720 ?auto_451722 ) ) ( not ( = ?auto_451721 ?auto_451722 ) ) ( ON ?auto_451720 ?auto_451721 ) ( ON ?auto_451719 ?auto_451720 ) ( ON ?auto_451718 ?auto_451719 ) ( ON ?auto_451717 ?auto_451718 ) ( CLEAR ?auto_451715 ) ( ON ?auto_451716 ?auto_451717 ) ( CLEAR ?auto_451716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_451710 ?auto_451711 ?auto_451712 ?auto_451713 ?auto_451714 ?auto_451715 ?auto_451716 )
      ( MAKE-12PILE ?auto_451710 ?auto_451711 ?auto_451712 ?auto_451713 ?auto_451714 ?auto_451715 ?auto_451716 ?auto_451717 ?auto_451718 ?auto_451719 ?auto_451720 ?auto_451721 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451735 - BLOCK
      ?auto_451736 - BLOCK
      ?auto_451737 - BLOCK
      ?auto_451738 - BLOCK
      ?auto_451739 - BLOCK
      ?auto_451740 - BLOCK
      ?auto_451741 - BLOCK
      ?auto_451742 - BLOCK
      ?auto_451743 - BLOCK
      ?auto_451744 - BLOCK
      ?auto_451745 - BLOCK
      ?auto_451746 - BLOCK
    )
    :vars
    (
      ?auto_451747 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451746 ?auto_451747 ) ( ON-TABLE ?auto_451735 ) ( ON ?auto_451736 ?auto_451735 ) ( ON ?auto_451737 ?auto_451736 ) ( ON ?auto_451738 ?auto_451737 ) ( ON ?auto_451739 ?auto_451738 ) ( ON ?auto_451740 ?auto_451739 ) ( not ( = ?auto_451735 ?auto_451736 ) ) ( not ( = ?auto_451735 ?auto_451737 ) ) ( not ( = ?auto_451735 ?auto_451738 ) ) ( not ( = ?auto_451735 ?auto_451739 ) ) ( not ( = ?auto_451735 ?auto_451740 ) ) ( not ( = ?auto_451735 ?auto_451741 ) ) ( not ( = ?auto_451735 ?auto_451742 ) ) ( not ( = ?auto_451735 ?auto_451743 ) ) ( not ( = ?auto_451735 ?auto_451744 ) ) ( not ( = ?auto_451735 ?auto_451745 ) ) ( not ( = ?auto_451735 ?auto_451746 ) ) ( not ( = ?auto_451735 ?auto_451747 ) ) ( not ( = ?auto_451736 ?auto_451737 ) ) ( not ( = ?auto_451736 ?auto_451738 ) ) ( not ( = ?auto_451736 ?auto_451739 ) ) ( not ( = ?auto_451736 ?auto_451740 ) ) ( not ( = ?auto_451736 ?auto_451741 ) ) ( not ( = ?auto_451736 ?auto_451742 ) ) ( not ( = ?auto_451736 ?auto_451743 ) ) ( not ( = ?auto_451736 ?auto_451744 ) ) ( not ( = ?auto_451736 ?auto_451745 ) ) ( not ( = ?auto_451736 ?auto_451746 ) ) ( not ( = ?auto_451736 ?auto_451747 ) ) ( not ( = ?auto_451737 ?auto_451738 ) ) ( not ( = ?auto_451737 ?auto_451739 ) ) ( not ( = ?auto_451737 ?auto_451740 ) ) ( not ( = ?auto_451737 ?auto_451741 ) ) ( not ( = ?auto_451737 ?auto_451742 ) ) ( not ( = ?auto_451737 ?auto_451743 ) ) ( not ( = ?auto_451737 ?auto_451744 ) ) ( not ( = ?auto_451737 ?auto_451745 ) ) ( not ( = ?auto_451737 ?auto_451746 ) ) ( not ( = ?auto_451737 ?auto_451747 ) ) ( not ( = ?auto_451738 ?auto_451739 ) ) ( not ( = ?auto_451738 ?auto_451740 ) ) ( not ( = ?auto_451738 ?auto_451741 ) ) ( not ( = ?auto_451738 ?auto_451742 ) ) ( not ( = ?auto_451738 ?auto_451743 ) ) ( not ( = ?auto_451738 ?auto_451744 ) ) ( not ( = ?auto_451738 ?auto_451745 ) ) ( not ( = ?auto_451738 ?auto_451746 ) ) ( not ( = ?auto_451738 ?auto_451747 ) ) ( not ( = ?auto_451739 ?auto_451740 ) ) ( not ( = ?auto_451739 ?auto_451741 ) ) ( not ( = ?auto_451739 ?auto_451742 ) ) ( not ( = ?auto_451739 ?auto_451743 ) ) ( not ( = ?auto_451739 ?auto_451744 ) ) ( not ( = ?auto_451739 ?auto_451745 ) ) ( not ( = ?auto_451739 ?auto_451746 ) ) ( not ( = ?auto_451739 ?auto_451747 ) ) ( not ( = ?auto_451740 ?auto_451741 ) ) ( not ( = ?auto_451740 ?auto_451742 ) ) ( not ( = ?auto_451740 ?auto_451743 ) ) ( not ( = ?auto_451740 ?auto_451744 ) ) ( not ( = ?auto_451740 ?auto_451745 ) ) ( not ( = ?auto_451740 ?auto_451746 ) ) ( not ( = ?auto_451740 ?auto_451747 ) ) ( not ( = ?auto_451741 ?auto_451742 ) ) ( not ( = ?auto_451741 ?auto_451743 ) ) ( not ( = ?auto_451741 ?auto_451744 ) ) ( not ( = ?auto_451741 ?auto_451745 ) ) ( not ( = ?auto_451741 ?auto_451746 ) ) ( not ( = ?auto_451741 ?auto_451747 ) ) ( not ( = ?auto_451742 ?auto_451743 ) ) ( not ( = ?auto_451742 ?auto_451744 ) ) ( not ( = ?auto_451742 ?auto_451745 ) ) ( not ( = ?auto_451742 ?auto_451746 ) ) ( not ( = ?auto_451742 ?auto_451747 ) ) ( not ( = ?auto_451743 ?auto_451744 ) ) ( not ( = ?auto_451743 ?auto_451745 ) ) ( not ( = ?auto_451743 ?auto_451746 ) ) ( not ( = ?auto_451743 ?auto_451747 ) ) ( not ( = ?auto_451744 ?auto_451745 ) ) ( not ( = ?auto_451744 ?auto_451746 ) ) ( not ( = ?auto_451744 ?auto_451747 ) ) ( not ( = ?auto_451745 ?auto_451746 ) ) ( not ( = ?auto_451745 ?auto_451747 ) ) ( not ( = ?auto_451746 ?auto_451747 ) ) ( ON ?auto_451745 ?auto_451746 ) ( ON ?auto_451744 ?auto_451745 ) ( ON ?auto_451743 ?auto_451744 ) ( ON ?auto_451742 ?auto_451743 ) ( CLEAR ?auto_451740 ) ( ON ?auto_451741 ?auto_451742 ) ( CLEAR ?auto_451741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_451735 ?auto_451736 ?auto_451737 ?auto_451738 ?auto_451739 ?auto_451740 ?auto_451741 )
      ( MAKE-12PILE ?auto_451735 ?auto_451736 ?auto_451737 ?auto_451738 ?auto_451739 ?auto_451740 ?auto_451741 ?auto_451742 ?auto_451743 ?auto_451744 ?auto_451745 ?auto_451746 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451760 - BLOCK
      ?auto_451761 - BLOCK
      ?auto_451762 - BLOCK
      ?auto_451763 - BLOCK
      ?auto_451764 - BLOCK
      ?auto_451765 - BLOCK
      ?auto_451766 - BLOCK
      ?auto_451767 - BLOCK
      ?auto_451768 - BLOCK
      ?auto_451769 - BLOCK
      ?auto_451770 - BLOCK
      ?auto_451771 - BLOCK
    )
    :vars
    (
      ?auto_451772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451771 ?auto_451772 ) ( ON-TABLE ?auto_451760 ) ( ON ?auto_451761 ?auto_451760 ) ( ON ?auto_451762 ?auto_451761 ) ( ON ?auto_451763 ?auto_451762 ) ( ON ?auto_451764 ?auto_451763 ) ( not ( = ?auto_451760 ?auto_451761 ) ) ( not ( = ?auto_451760 ?auto_451762 ) ) ( not ( = ?auto_451760 ?auto_451763 ) ) ( not ( = ?auto_451760 ?auto_451764 ) ) ( not ( = ?auto_451760 ?auto_451765 ) ) ( not ( = ?auto_451760 ?auto_451766 ) ) ( not ( = ?auto_451760 ?auto_451767 ) ) ( not ( = ?auto_451760 ?auto_451768 ) ) ( not ( = ?auto_451760 ?auto_451769 ) ) ( not ( = ?auto_451760 ?auto_451770 ) ) ( not ( = ?auto_451760 ?auto_451771 ) ) ( not ( = ?auto_451760 ?auto_451772 ) ) ( not ( = ?auto_451761 ?auto_451762 ) ) ( not ( = ?auto_451761 ?auto_451763 ) ) ( not ( = ?auto_451761 ?auto_451764 ) ) ( not ( = ?auto_451761 ?auto_451765 ) ) ( not ( = ?auto_451761 ?auto_451766 ) ) ( not ( = ?auto_451761 ?auto_451767 ) ) ( not ( = ?auto_451761 ?auto_451768 ) ) ( not ( = ?auto_451761 ?auto_451769 ) ) ( not ( = ?auto_451761 ?auto_451770 ) ) ( not ( = ?auto_451761 ?auto_451771 ) ) ( not ( = ?auto_451761 ?auto_451772 ) ) ( not ( = ?auto_451762 ?auto_451763 ) ) ( not ( = ?auto_451762 ?auto_451764 ) ) ( not ( = ?auto_451762 ?auto_451765 ) ) ( not ( = ?auto_451762 ?auto_451766 ) ) ( not ( = ?auto_451762 ?auto_451767 ) ) ( not ( = ?auto_451762 ?auto_451768 ) ) ( not ( = ?auto_451762 ?auto_451769 ) ) ( not ( = ?auto_451762 ?auto_451770 ) ) ( not ( = ?auto_451762 ?auto_451771 ) ) ( not ( = ?auto_451762 ?auto_451772 ) ) ( not ( = ?auto_451763 ?auto_451764 ) ) ( not ( = ?auto_451763 ?auto_451765 ) ) ( not ( = ?auto_451763 ?auto_451766 ) ) ( not ( = ?auto_451763 ?auto_451767 ) ) ( not ( = ?auto_451763 ?auto_451768 ) ) ( not ( = ?auto_451763 ?auto_451769 ) ) ( not ( = ?auto_451763 ?auto_451770 ) ) ( not ( = ?auto_451763 ?auto_451771 ) ) ( not ( = ?auto_451763 ?auto_451772 ) ) ( not ( = ?auto_451764 ?auto_451765 ) ) ( not ( = ?auto_451764 ?auto_451766 ) ) ( not ( = ?auto_451764 ?auto_451767 ) ) ( not ( = ?auto_451764 ?auto_451768 ) ) ( not ( = ?auto_451764 ?auto_451769 ) ) ( not ( = ?auto_451764 ?auto_451770 ) ) ( not ( = ?auto_451764 ?auto_451771 ) ) ( not ( = ?auto_451764 ?auto_451772 ) ) ( not ( = ?auto_451765 ?auto_451766 ) ) ( not ( = ?auto_451765 ?auto_451767 ) ) ( not ( = ?auto_451765 ?auto_451768 ) ) ( not ( = ?auto_451765 ?auto_451769 ) ) ( not ( = ?auto_451765 ?auto_451770 ) ) ( not ( = ?auto_451765 ?auto_451771 ) ) ( not ( = ?auto_451765 ?auto_451772 ) ) ( not ( = ?auto_451766 ?auto_451767 ) ) ( not ( = ?auto_451766 ?auto_451768 ) ) ( not ( = ?auto_451766 ?auto_451769 ) ) ( not ( = ?auto_451766 ?auto_451770 ) ) ( not ( = ?auto_451766 ?auto_451771 ) ) ( not ( = ?auto_451766 ?auto_451772 ) ) ( not ( = ?auto_451767 ?auto_451768 ) ) ( not ( = ?auto_451767 ?auto_451769 ) ) ( not ( = ?auto_451767 ?auto_451770 ) ) ( not ( = ?auto_451767 ?auto_451771 ) ) ( not ( = ?auto_451767 ?auto_451772 ) ) ( not ( = ?auto_451768 ?auto_451769 ) ) ( not ( = ?auto_451768 ?auto_451770 ) ) ( not ( = ?auto_451768 ?auto_451771 ) ) ( not ( = ?auto_451768 ?auto_451772 ) ) ( not ( = ?auto_451769 ?auto_451770 ) ) ( not ( = ?auto_451769 ?auto_451771 ) ) ( not ( = ?auto_451769 ?auto_451772 ) ) ( not ( = ?auto_451770 ?auto_451771 ) ) ( not ( = ?auto_451770 ?auto_451772 ) ) ( not ( = ?auto_451771 ?auto_451772 ) ) ( ON ?auto_451770 ?auto_451771 ) ( ON ?auto_451769 ?auto_451770 ) ( ON ?auto_451768 ?auto_451769 ) ( ON ?auto_451767 ?auto_451768 ) ( ON ?auto_451766 ?auto_451767 ) ( CLEAR ?auto_451764 ) ( ON ?auto_451765 ?auto_451766 ) ( CLEAR ?auto_451765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_451760 ?auto_451761 ?auto_451762 ?auto_451763 ?auto_451764 ?auto_451765 )
      ( MAKE-12PILE ?auto_451760 ?auto_451761 ?auto_451762 ?auto_451763 ?auto_451764 ?auto_451765 ?auto_451766 ?auto_451767 ?auto_451768 ?auto_451769 ?auto_451770 ?auto_451771 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451785 - BLOCK
      ?auto_451786 - BLOCK
      ?auto_451787 - BLOCK
      ?auto_451788 - BLOCK
      ?auto_451789 - BLOCK
      ?auto_451790 - BLOCK
      ?auto_451791 - BLOCK
      ?auto_451792 - BLOCK
      ?auto_451793 - BLOCK
      ?auto_451794 - BLOCK
      ?auto_451795 - BLOCK
      ?auto_451796 - BLOCK
    )
    :vars
    (
      ?auto_451797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451796 ?auto_451797 ) ( ON-TABLE ?auto_451785 ) ( ON ?auto_451786 ?auto_451785 ) ( ON ?auto_451787 ?auto_451786 ) ( ON ?auto_451788 ?auto_451787 ) ( ON ?auto_451789 ?auto_451788 ) ( not ( = ?auto_451785 ?auto_451786 ) ) ( not ( = ?auto_451785 ?auto_451787 ) ) ( not ( = ?auto_451785 ?auto_451788 ) ) ( not ( = ?auto_451785 ?auto_451789 ) ) ( not ( = ?auto_451785 ?auto_451790 ) ) ( not ( = ?auto_451785 ?auto_451791 ) ) ( not ( = ?auto_451785 ?auto_451792 ) ) ( not ( = ?auto_451785 ?auto_451793 ) ) ( not ( = ?auto_451785 ?auto_451794 ) ) ( not ( = ?auto_451785 ?auto_451795 ) ) ( not ( = ?auto_451785 ?auto_451796 ) ) ( not ( = ?auto_451785 ?auto_451797 ) ) ( not ( = ?auto_451786 ?auto_451787 ) ) ( not ( = ?auto_451786 ?auto_451788 ) ) ( not ( = ?auto_451786 ?auto_451789 ) ) ( not ( = ?auto_451786 ?auto_451790 ) ) ( not ( = ?auto_451786 ?auto_451791 ) ) ( not ( = ?auto_451786 ?auto_451792 ) ) ( not ( = ?auto_451786 ?auto_451793 ) ) ( not ( = ?auto_451786 ?auto_451794 ) ) ( not ( = ?auto_451786 ?auto_451795 ) ) ( not ( = ?auto_451786 ?auto_451796 ) ) ( not ( = ?auto_451786 ?auto_451797 ) ) ( not ( = ?auto_451787 ?auto_451788 ) ) ( not ( = ?auto_451787 ?auto_451789 ) ) ( not ( = ?auto_451787 ?auto_451790 ) ) ( not ( = ?auto_451787 ?auto_451791 ) ) ( not ( = ?auto_451787 ?auto_451792 ) ) ( not ( = ?auto_451787 ?auto_451793 ) ) ( not ( = ?auto_451787 ?auto_451794 ) ) ( not ( = ?auto_451787 ?auto_451795 ) ) ( not ( = ?auto_451787 ?auto_451796 ) ) ( not ( = ?auto_451787 ?auto_451797 ) ) ( not ( = ?auto_451788 ?auto_451789 ) ) ( not ( = ?auto_451788 ?auto_451790 ) ) ( not ( = ?auto_451788 ?auto_451791 ) ) ( not ( = ?auto_451788 ?auto_451792 ) ) ( not ( = ?auto_451788 ?auto_451793 ) ) ( not ( = ?auto_451788 ?auto_451794 ) ) ( not ( = ?auto_451788 ?auto_451795 ) ) ( not ( = ?auto_451788 ?auto_451796 ) ) ( not ( = ?auto_451788 ?auto_451797 ) ) ( not ( = ?auto_451789 ?auto_451790 ) ) ( not ( = ?auto_451789 ?auto_451791 ) ) ( not ( = ?auto_451789 ?auto_451792 ) ) ( not ( = ?auto_451789 ?auto_451793 ) ) ( not ( = ?auto_451789 ?auto_451794 ) ) ( not ( = ?auto_451789 ?auto_451795 ) ) ( not ( = ?auto_451789 ?auto_451796 ) ) ( not ( = ?auto_451789 ?auto_451797 ) ) ( not ( = ?auto_451790 ?auto_451791 ) ) ( not ( = ?auto_451790 ?auto_451792 ) ) ( not ( = ?auto_451790 ?auto_451793 ) ) ( not ( = ?auto_451790 ?auto_451794 ) ) ( not ( = ?auto_451790 ?auto_451795 ) ) ( not ( = ?auto_451790 ?auto_451796 ) ) ( not ( = ?auto_451790 ?auto_451797 ) ) ( not ( = ?auto_451791 ?auto_451792 ) ) ( not ( = ?auto_451791 ?auto_451793 ) ) ( not ( = ?auto_451791 ?auto_451794 ) ) ( not ( = ?auto_451791 ?auto_451795 ) ) ( not ( = ?auto_451791 ?auto_451796 ) ) ( not ( = ?auto_451791 ?auto_451797 ) ) ( not ( = ?auto_451792 ?auto_451793 ) ) ( not ( = ?auto_451792 ?auto_451794 ) ) ( not ( = ?auto_451792 ?auto_451795 ) ) ( not ( = ?auto_451792 ?auto_451796 ) ) ( not ( = ?auto_451792 ?auto_451797 ) ) ( not ( = ?auto_451793 ?auto_451794 ) ) ( not ( = ?auto_451793 ?auto_451795 ) ) ( not ( = ?auto_451793 ?auto_451796 ) ) ( not ( = ?auto_451793 ?auto_451797 ) ) ( not ( = ?auto_451794 ?auto_451795 ) ) ( not ( = ?auto_451794 ?auto_451796 ) ) ( not ( = ?auto_451794 ?auto_451797 ) ) ( not ( = ?auto_451795 ?auto_451796 ) ) ( not ( = ?auto_451795 ?auto_451797 ) ) ( not ( = ?auto_451796 ?auto_451797 ) ) ( ON ?auto_451795 ?auto_451796 ) ( ON ?auto_451794 ?auto_451795 ) ( ON ?auto_451793 ?auto_451794 ) ( ON ?auto_451792 ?auto_451793 ) ( ON ?auto_451791 ?auto_451792 ) ( CLEAR ?auto_451789 ) ( ON ?auto_451790 ?auto_451791 ) ( CLEAR ?auto_451790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_451785 ?auto_451786 ?auto_451787 ?auto_451788 ?auto_451789 ?auto_451790 )
      ( MAKE-12PILE ?auto_451785 ?auto_451786 ?auto_451787 ?auto_451788 ?auto_451789 ?auto_451790 ?auto_451791 ?auto_451792 ?auto_451793 ?auto_451794 ?auto_451795 ?auto_451796 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451810 - BLOCK
      ?auto_451811 - BLOCK
      ?auto_451812 - BLOCK
      ?auto_451813 - BLOCK
      ?auto_451814 - BLOCK
      ?auto_451815 - BLOCK
      ?auto_451816 - BLOCK
      ?auto_451817 - BLOCK
      ?auto_451818 - BLOCK
      ?auto_451819 - BLOCK
      ?auto_451820 - BLOCK
      ?auto_451821 - BLOCK
    )
    :vars
    (
      ?auto_451822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451821 ?auto_451822 ) ( ON-TABLE ?auto_451810 ) ( ON ?auto_451811 ?auto_451810 ) ( ON ?auto_451812 ?auto_451811 ) ( ON ?auto_451813 ?auto_451812 ) ( not ( = ?auto_451810 ?auto_451811 ) ) ( not ( = ?auto_451810 ?auto_451812 ) ) ( not ( = ?auto_451810 ?auto_451813 ) ) ( not ( = ?auto_451810 ?auto_451814 ) ) ( not ( = ?auto_451810 ?auto_451815 ) ) ( not ( = ?auto_451810 ?auto_451816 ) ) ( not ( = ?auto_451810 ?auto_451817 ) ) ( not ( = ?auto_451810 ?auto_451818 ) ) ( not ( = ?auto_451810 ?auto_451819 ) ) ( not ( = ?auto_451810 ?auto_451820 ) ) ( not ( = ?auto_451810 ?auto_451821 ) ) ( not ( = ?auto_451810 ?auto_451822 ) ) ( not ( = ?auto_451811 ?auto_451812 ) ) ( not ( = ?auto_451811 ?auto_451813 ) ) ( not ( = ?auto_451811 ?auto_451814 ) ) ( not ( = ?auto_451811 ?auto_451815 ) ) ( not ( = ?auto_451811 ?auto_451816 ) ) ( not ( = ?auto_451811 ?auto_451817 ) ) ( not ( = ?auto_451811 ?auto_451818 ) ) ( not ( = ?auto_451811 ?auto_451819 ) ) ( not ( = ?auto_451811 ?auto_451820 ) ) ( not ( = ?auto_451811 ?auto_451821 ) ) ( not ( = ?auto_451811 ?auto_451822 ) ) ( not ( = ?auto_451812 ?auto_451813 ) ) ( not ( = ?auto_451812 ?auto_451814 ) ) ( not ( = ?auto_451812 ?auto_451815 ) ) ( not ( = ?auto_451812 ?auto_451816 ) ) ( not ( = ?auto_451812 ?auto_451817 ) ) ( not ( = ?auto_451812 ?auto_451818 ) ) ( not ( = ?auto_451812 ?auto_451819 ) ) ( not ( = ?auto_451812 ?auto_451820 ) ) ( not ( = ?auto_451812 ?auto_451821 ) ) ( not ( = ?auto_451812 ?auto_451822 ) ) ( not ( = ?auto_451813 ?auto_451814 ) ) ( not ( = ?auto_451813 ?auto_451815 ) ) ( not ( = ?auto_451813 ?auto_451816 ) ) ( not ( = ?auto_451813 ?auto_451817 ) ) ( not ( = ?auto_451813 ?auto_451818 ) ) ( not ( = ?auto_451813 ?auto_451819 ) ) ( not ( = ?auto_451813 ?auto_451820 ) ) ( not ( = ?auto_451813 ?auto_451821 ) ) ( not ( = ?auto_451813 ?auto_451822 ) ) ( not ( = ?auto_451814 ?auto_451815 ) ) ( not ( = ?auto_451814 ?auto_451816 ) ) ( not ( = ?auto_451814 ?auto_451817 ) ) ( not ( = ?auto_451814 ?auto_451818 ) ) ( not ( = ?auto_451814 ?auto_451819 ) ) ( not ( = ?auto_451814 ?auto_451820 ) ) ( not ( = ?auto_451814 ?auto_451821 ) ) ( not ( = ?auto_451814 ?auto_451822 ) ) ( not ( = ?auto_451815 ?auto_451816 ) ) ( not ( = ?auto_451815 ?auto_451817 ) ) ( not ( = ?auto_451815 ?auto_451818 ) ) ( not ( = ?auto_451815 ?auto_451819 ) ) ( not ( = ?auto_451815 ?auto_451820 ) ) ( not ( = ?auto_451815 ?auto_451821 ) ) ( not ( = ?auto_451815 ?auto_451822 ) ) ( not ( = ?auto_451816 ?auto_451817 ) ) ( not ( = ?auto_451816 ?auto_451818 ) ) ( not ( = ?auto_451816 ?auto_451819 ) ) ( not ( = ?auto_451816 ?auto_451820 ) ) ( not ( = ?auto_451816 ?auto_451821 ) ) ( not ( = ?auto_451816 ?auto_451822 ) ) ( not ( = ?auto_451817 ?auto_451818 ) ) ( not ( = ?auto_451817 ?auto_451819 ) ) ( not ( = ?auto_451817 ?auto_451820 ) ) ( not ( = ?auto_451817 ?auto_451821 ) ) ( not ( = ?auto_451817 ?auto_451822 ) ) ( not ( = ?auto_451818 ?auto_451819 ) ) ( not ( = ?auto_451818 ?auto_451820 ) ) ( not ( = ?auto_451818 ?auto_451821 ) ) ( not ( = ?auto_451818 ?auto_451822 ) ) ( not ( = ?auto_451819 ?auto_451820 ) ) ( not ( = ?auto_451819 ?auto_451821 ) ) ( not ( = ?auto_451819 ?auto_451822 ) ) ( not ( = ?auto_451820 ?auto_451821 ) ) ( not ( = ?auto_451820 ?auto_451822 ) ) ( not ( = ?auto_451821 ?auto_451822 ) ) ( ON ?auto_451820 ?auto_451821 ) ( ON ?auto_451819 ?auto_451820 ) ( ON ?auto_451818 ?auto_451819 ) ( ON ?auto_451817 ?auto_451818 ) ( ON ?auto_451816 ?auto_451817 ) ( ON ?auto_451815 ?auto_451816 ) ( CLEAR ?auto_451813 ) ( ON ?auto_451814 ?auto_451815 ) ( CLEAR ?auto_451814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_451810 ?auto_451811 ?auto_451812 ?auto_451813 ?auto_451814 )
      ( MAKE-12PILE ?auto_451810 ?auto_451811 ?auto_451812 ?auto_451813 ?auto_451814 ?auto_451815 ?auto_451816 ?auto_451817 ?auto_451818 ?auto_451819 ?auto_451820 ?auto_451821 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451835 - BLOCK
      ?auto_451836 - BLOCK
      ?auto_451837 - BLOCK
      ?auto_451838 - BLOCK
      ?auto_451839 - BLOCK
      ?auto_451840 - BLOCK
      ?auto_451841 - BLOCK
      ?auto_451842 - BLOCK
      ?auto_451843 - BLOCK
      ?auto_451844 - BLOCK
      ?auto_451845 - BLOCK
      ?auto_451846 - BLOCK
    )
    :vars
    (
      ?auto_451847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451846 ?auto_451847 ) ( ON-TABLE ?auto_451835 ) ( ON ?auto_451836 ?auto_451835 ) ( ON ?auto_451837 ?auto_451836 ) ( ON ?auto_451838 ?auto_451837 ) ( not ( = ?auto_451835 ?auto_451836 ) ) ( not ( = ?auto_451835 ?auto_451837 ) ) ( not ( = ?auto_451835 ?auto_451838 ) ) ( not ( = ?auto_451835 ?auto_451839 ) ) ( not ( = ?auto_451835 ?auto_451840 ) ) ( not ( = ?auto_451835 ?auto_451841 ) ) ( not ( = ?auto_451835 ?auto_451842 ) ) ( not ( = ?auto_451835 ?auto_451843 ) ) ( not ( = ?auto_451835 ?auto_451844 ) ) ( not ( = ?auto_451835 ?auto_451845 ) ) ( not ( = ?auto_451835 ?auto_451846 ) ) ( not ( = ?auto_451835 ?auto_451847 ) ) ( not ( = ?auto_451836 ?auto_451837 ) ) ( not ( = ?auto_451836 ?auto_451838 ) ) ( not ( = ?auto_451836 ?auto_451839 ) ) ( not ( = ?auto_451836 ?auto_451840 ) ) ( not ( = ?auto_451836 ?auto_451841 ) ) ( not ( = ?auto_451836 ?auto_451842 ) ) ( not ( = ?auto_451836 ?auto_451843 ) ) ( not ( = ?auto_451836 ?auto_451844 ) ) ( not ( = ?auto_451836 ?auto_451845 ) ) ( not ( = ?auto_451836 ?auto_451846 ) ) ( not ( = ?auto_451836 ?auto_451847 ) ) ( not ( = ?auto_451837 ?auto_451838 ) ) ( not ( = ?auto_451837 ?auto_451839 ) ) ( not ( = ?auto_451837 ?auto_451840 ) ) ( not ( = ?auto_451837 ?auto_451841 ) ) ( not ( = ?auto_451837 ?auto_451842 ) ) ( not ( = ?auto_451837 ?auto_451843 ) ) ( not ( = ?auto_451837 ?auto_451844 ) ) ( not ( = ?auto_451837 ?auto_451845 ) ) ( not ( = ?auto_451837 ?auto_451846 ) ) ( not ( = ?auto_451837 ?auto_451847 ) ) ( not ( = ?auto_451838 ?auto_451839 ) ) ( not ( = ?auto_451838 ?auto_451840 ) ) ( not ( = ?auto_451838 ?auto_451841 ) ) ( not ( = ?auto_451838 ?auto_451842 ) ) ( not ( = ?auto_451838 ?auto_451843 ) ) ( not ( = ?auto_451838 ?auto_451844 ) ) ( not ( = ?auto_451838 ?auto_451845 ) ) ( not ( = ?auto_451838 ?auto_451846 ) ) ( not ( = ?auto_451838 ?auto_451847 ) ) ( not ( = ?auto_451839 ?auto_451840 ) ) ( not ( = ?auto_451839 ?auto_451841 ) ) ( not ( = ?auto_451839 ?auto_451842 ) ) ( not ( = ?auto_451839 ?auto_451843 ) ) ( not ( = ?auto_451839 ?auto_451844 ) ) ( not ( = ?auto_451839 ?auto_451845 ) ) ( not ( = ?auto_451839 ?auto_451846 ) ) ( not ( = ?auto_451839 ?auto_451847 ) ) ( not ( = ?auto_451840 ?auto_451841 ) ) ( not ( = ?auto_451840 ?auto_451842 ) ) ( not ( = ?auto_451840 ?auto_451843 ) ) ( not ( = ?auto_451840 ?auto_451844 ) ) ( not ( = ?auto_451840 ?auto_451845 ) ) ( not ( = ?auto_451840 ?auto_451846 ) ) ( not ( = ?auto_451840 ?auto_451847 ) ) ( not ( = ?auto_451841 ?auto_451842 ) ) ( not ( = ?auto_451841 ?auto_451843 ) ) ( not ( = ?auto_451841 ?auto_451844 ) ) ( not ( = ?auto_451841 ?auto_451845 ) ) ( not ( = ?auto_451841 ?auto_451846 ) ) ( not ( = ?auto_451841 ?auto_451847 ) ) ( not ( = ?auto_451842 ?auto_451843 ) ) ( not ( = ?auto_451842 ?auto_451844 ) ) ( not ( = ?auto_451842 ?auto_451845 ) ) ( not ( = ?auto_451842 ?auto_451846 ) ) ( not ( = ?auto_451842 ?auto_451847 ) ) ( not ( = ?auto_451843 ?auto_451844 ) ) ( not ( = ?auto_451843 ?auto_451845 ) ) ( not ( = ?auto_451843 ?auto_451846 ) ) ( not ( = ?auto_451843 ?auto_451847 ) ) ( not ( = ?auto_451844 ?auto_451845 ) ) ( not ( = ?auto_451844 ?auto_451846 ) ) ( not ( = ?auto_451844 ?auto_451847 ) ) ( not ( = ?auto_451845 ?auto_451846 ) ) ( not ( = ?auto_451845 ?auto_451847 ) ) ( not ( = ?auto_451846 ?auto_451847 ) ) ( ON ?auto_451845 ?auto_451846 ) ( ON ?auto_451844 ?auto_451845 ) ( ON ?auto_451843 ?auto_451844 ) ( ON ?auto_451842 ?auto_451843 ) ( ON ?auto_451841 ?auto_451842 ) ( ON ?auto_451840 ?auto_451841 ) ( CLEAR ?auto_451838 ) ( ON ?auto_451839 ?auto_451840 ) ( CLEAR ?auto_451839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_451835 ?auto_451836 ?auto_451837 ?auto_451838 ?auto_451839 )
      ( MAKE-12PILE ?auto_451835 ?auto_451836 ?auto_451837 ?auto_451838 ?auto_451839 ?auto_451840 ?auto_451841 ?auto_451842 ?auto_451843 ?auto_451844 ?auto_451845 ?auto_451846 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451860 - BLOCK
      ?auto_451861 - BLOCK
      ?auto_451862 - BLOCK
      ?auto_451863 - BLOCK
      ?auto_451864 - BLOCK
      ?auto_451865 - BLOCK
      ?auto_451866 - BLOCK
      ?auto_451867 - BLOCK
      ?auto_451868 - BLOCK
      ?auto_451869 - BLOCK
      ?auto_451870 - BLOCK
      ?auto_451871 - BLOCK
    )
    :vars
    (
      ?auto_451872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451871 ?auto_451872 ) ( ON-TABLE ?auto_451860 ) ( ON ?auto_451861 ?auto_451860 ) ( ON ?auto_451862 ?auto_451861 ) ( not ( = ?auto_451860 ?auto_451861 ) ) ( not ( = ?auto_451860 ?auto_451862 ) ) ( not ( = ?auto_451860 ?auto_451863 ) ) ( not ( = ?auto_451860 ?auto_451864 ) ) ( not ( = ?auto_451860 ?auto_451865 ) ) ( not ( = ?auto_451860 ?auto_451866 ) ) ( not ( = ?auto_451860 ?auto_451867 ) ) ( not ( = ?auto_451860 ?auto_451868 ) ) ( not ( = ?auto_451860 ?auto_451869 ) ) ( not ( = ?auto_451860 ?auto_451870 ) ) ( not ( = ?auto_451860 ?auto_451871 ) ) ( not ( = ?auto_451860 ?auto_451872 ) ) ( not ( = ?auto_451861 ?auto_451862 ) ) ( not ( = ?auto_451861 ?auto_451863 ) ) ( not ( = ?auto_451861 ?auto_451864 ) ) ( not ( = ?auto_451861 ?auto_451865 ) ) ( not ( = ?auto_451861 ?auto_451866 ) ) ( not ( = ?auto_451861 ?auto_451867 ) ) ( not ( = ?auto_451861 ?auto_451868 ) ) ( not ( = ?auto_451861 ?auto_451869 ) ) ( not ( = ?auto_451861 ?auto_451870 ) ) ( not ( = ?auto_451861 ?auto_451871 ) ) ( not ( = ?auto_451861 ?auto_451872 ) ) ( not ( = ?auto_451862 ?auto_451863 ) ) ( not ( = ?auto_451862 ?auto_451864 ) ) ( not ( = ?auto_451862 ?auto_451865 ) ) ( not ( = ?auto_451862 ?auto_451866 ) ) ( not ( = ?auto_451862 ?auto_451867 ) ) ( not ( = ?auto_451862 ?auto_451868 ) ) ( not ( = ?auto_451862 ?auto_451869 ) ) ( not ( = ?auto_451862 ?auto_451870 ) ) ( not ( = ?auto_451862 ?auto_451871 ) ) ( not ( = ?auto_451862 ?auto_451872 ) ) ( not ( = ?auto_451863 ?auto_451864 ) ) ( not ( = ?auto_451863 ?auto_451865 ) ) ( not ( = ?auto_451863 ?auto_451866 ) ) ( not ( = ?auto_451863 ?auto_451867 ) ) ( not ( = ?auto_451863 ?auto_451868 ) ) ( not ( = ?auto_451863 ?auto_451869 ) ) ( not ( = ?auto_451863 ?auto_451870 ) ) ( not ( = ?auto_451863 ?auto_451871 ) ) ( not ( = ?auto_451863 ?auto_451872 ) ) ( not ( = ?auto_451864 ?auto_451865 ) ) ( not ( = ?auto_451864 ?auto_451866 ) ) ( not ( = ?auto_451864 ?auto_451867 ) ) ( not ( = ?auto_451864 ?auto_451868 ) ) ( not ( = ?auto_451864 ?auto_451869 ) ) ( not ( = ?auto_451864 ?auto_451870 ) ) ( not ( = ?auto_451864 ?auto_451871 ) ) ( not ( = ?auto_451864 ?auto_451872 ) ) ( not ( = ?auto_451865 ?auto_451866 ) ) ( not ( = ?auto_451865 ?auto_451867 ) ) ( not ( = ?auto_451865 ?auto_451868 ) ) ( not ( = ?auto_451865 ?auto_451869 ) ) ( not ( = ?auto_451865 ?auto_451870 ) ) ( not ( = ?auto_451865 ?auto_451871 ) ) ( not ( = ?auto_451865 ?auto_451872 ) ) ( not ( = ?auto_451866 ?auto_451867 ) ) ( not ( = ?auto_451866 ?auto_451868 ) ) ( not ( = ?auto_451866 ?auto_451869 ) ) ( not ( = ?auto_451866 ?auto_451870 ) ) ( not ( = ?auto_451866 ?auto_451871 ) ) ( not ( = ?auto_451866 ?auto_451872 ) ) ( not ( = ?auto_451867 ?auto_451868 ) ) ( not ( = ?auto_451867 ?auto_451869 ) ) ( not ( = ?auto_451867 ?auto_451870 ) ) ( not ( = ?auto_451867 ?auto_451871 ) ) ( not ( = ?auto_451867 ?auto_451872 ) ) ( not ( = ?auto_451868 ?auto_451869 ) ) ( not ( = ?auto_451868 ?auto_451870 ) ) ( not ( = ?auto_451868 ?auto_451871 ) ) ( not ( = ?auto_451868 ?auto_451872 ) ) ( not ( = ?auto_451869 ?auto_451870 ) ) ( not ( = ?auto_451869 ?auto_451871 ) ) ( not ( = ?auto_451869 ?auto_451872 ) ) ( not ( = ?auto_451870 ?auto_451871 ) ) ( not ( = ?auto_451870 ?auto_451872 ) ) ( not ( = ?auto_451871 ?auto_451872 ) ) ( ON ?auto_451870 ?auto_451871 ) ( ON ?auto_451869 ?auto_451870 ) ( ON ?auto_451868 ?auto_451869 ) ( ON ?auto_451867 ?auto_451868 ) ( ON ?auto_451866 ?auto_451867 ) ( ON ?auto_451865 ?auto_451866 ) ( ON ?auto_451864 ?auto_451865 ) ( CLEAR ?auto_451862 ) ( ON ?auto_451863 ?auto_451864 ) ( CLEAR ?auto_451863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_451860 ?auto_451861 ?auto_451862 ?auto_451863 )
      ( MAKE-12PILE ?auto_451860 ?auto_451861 ?auto_451862 ?auto_451863 ?auto_451864 ?auto_451865 ?auto_451866 ?auto_451867 ?auto_451868 ?auto_451869 ?auto_451870 ?auto_451871 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451885 - BLOCK
      ?auto_451886 - BLOCK
      ?auto_451887 - BLOCK
      ?auto_451888 - BLOCK
      ?auto_451889 - BLOCK
      ?auto_451890 - BLOCK
      ?auto_451891 - BLOCK
      ?auto_451892 - BLOCK
      ?auto_451893 - BLOCK
      ?auto_451894 - BLOCK
      ?auto_451895 - BLOCK
      ?auto_451896 - BLOCK
    )
    :vars
    (
      ?auto_451897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451896 ?auto_451897 ) ( ON-TABLE ?auto_451885 ) ( ON ?auto_451886 ?auto_451885 ) ( ON ?auto_451887 ?auto_451886 ) ( not ( = ?auto_451885 ?auto_451886 ) ) ( not ( = ?auto_451885 ?auto_451887 ) ) ( not ( = ?auto_451885 ?auto_451888 ) ) ( not ( = ?auto_451885 ?auto_451889 ) ) ( not ( = ?auto_451885 ?auto_451890 ) ) ( not ( = ?auto_451885 ?auto_451891 ) ) ( not ( = ?auto_451885 ?auto_451892 ) ) ( not ( = ?auto_451885 ?auto_451893 ) ) ( not ( = ?auto_451885 ?auto_451894 ) ) ( not ( = ?auto_451885 ?auto_451895 ) ) ( not ( = ?auto_451885 ?auto_451896 ) ) ( not ( = ?auto_451885 ?auto_451897 ) ) ( not ( = ?auto_451886 ?auto_451887 ) ) ( not ( = ?auto_451886 ?auto_451888 ) ) ( not ( = ?auto_451886 ?auto_451889 ) ) ( not ( = ?auto_451886 ?auto_451890 ) ) ( not ( = ?auto_451886 ?auto_451891 ) ) ( not ( = ?auto_451886 ?auto_451892 ) ) ( not ( = ?auto_451886 ?auto_451893 ) ) ( not ( = ?auto_451886 ?auto_451894 ) ) ( not ( = ?auto_451886 ?auto_451895 ) ) ( not ( = ?auto_451886 ?auto_451896 ) ) ( not ( = ?auto_451886 ?auto_451897 ) ) ( not ( = ?auto_451887 ?auto_451888 ) ) ( not ( = ?auto_451887 ?auto_451889 ) ) ( not ( = ?auto_451887 ?auto_451890 ) ) ( not ( = ?auto_451887 ?auto_451891 ) ) ( not ( = ?auto_451887 ?auto_451892 ) ) ( not ( = ?auto_451887 ?auto_451893 ) ) ( not ( = ?auto_451887 ?auto_451894 ) ) ( not ( = ?auto_451887 ?auto_451895 ) ) ( not ( = ?auto_451887 ?auto_451896 ) ) ( not ( = ?auto_451887 ?auto_451897 ) ) ( not ( = ?auto_451888 ?auto_451889 ) ) ( not ( = ?auto_451888 ?auto_451890 ) ) ( not ( = ?auto_451888 ?auto_451891 ) ) ( not ( = ?auto_451888 ?auto_451892 ) ) ( not ( = ?auto_451888 ?auto_451893 ) ) ( not ( = ?auto_451888 ?auto_451894 ) ) ( not ( = ?auto_451888 ?auto_451895 ) ) ( not ( = ?auto_451888 ?auto_451896 ) ) ( not ( = ?auto_451888 ?auto_451897 ) ) ( not ( = ?auto_451889 ?auto_451890 ) ) ( not ( = ?auto_451889 ?auto_451891 ) ) ( not ( = ?auto_451889 ?auto_451892 ) ) ( not ( = ?auto_451889 ?auto_451893 ) ) ( not ( = ?auto_451889 ?auto_451894 ) ) ( not ( = ?auto_451889 ?auto_451895 ) ) ( not ( = ?auto_451889 ?auto_451896 ) ) ( not ( = ?auto_451889 ?auto_451897 ) ) ( not ( = ?auto_451890 ?auto_451891 ) ) ( not ( = ?auto_451890 ?auto_451892 ) ) ( not ( = ?auto_451890 ?auto_451893 ) ) ( not ( = ?auto_451890 ?auto_451894 ) ) ( not ( = ?auto_451890 ?auto_451895 ) ) ( not ( = ?auto_451890 ?auto_451896 ) ) ( not ( = ?auto_451890 ?auto_451897 ) ) ( not ( = ?auto_451891 ?auto_451892 ) ) ( not ( = ?auto_451891 ?auto_451893 ) ) ( not ( = ?auto_451891 ?auto_451894 ) ) ( not ( = ?auto_451891 ?auto_451895 ) ) ( not ( = ?auto_451891 ?auto_451896 ) ) ( not ( = ?auto_451891 ?auto_451897 ) ) ( not ( = ?auto_451892 ?auto_451893 ) ) ( not ( = ?auto_451892 ?auto_451894 ) ) ( not ( = ?auto_451892 ?auto_451895 ) ) ( not ( = ?auto_451892 ?auto_451896 ) ) ( not ( = ?auto_451892 ?auto_451897 ) ) ( not ( = ?auto_451893 ?auto_451894 ) ) ( not ( = ?auto_451893 ?auto_451895 ) ) ( not ( = ?auto_451893 ?auto_451896 ) ) ( not ( = ?auto_451893 ?auto_451897 ) ) ( not ( = ?auto_451894 ?auto_451895 ) ) ( not ( = ?auto_451894 ?auto_451896 ) ) ( not ( = ?auto_451894 ?auto_451897 ) ) ( not ( = ?auto_451895 ?auto_451896 ) ) ( not ( = ?auto_451895 ?auto_451897 ) ) ( not ( = ?auto_451896 ?auto_451897 ) ) ( ON ?auto_451895 ?auto_451896 ) ( ON ?auto_451894 ?auto_451895 ) ( ON ?auto_451893 ?auto_451894 ) ( ON ?auto_451892 ?auto_451893 ) ( ON ?auto_451891 ?auto_451892 ) ( ON ?auto_451890 ?auto_451891 ) ( ON ?auto_451889 ?auto_451890 ) ( CLEAR ?auto_451887 ) ( ON ?auto_451888 ?auto_451889 ) ( CLEAR ?auto_451888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_451885 ?auto_451886 ?auto_451887 ?auto_451888 )
      ( MAKE-12PILE ?auto_451885 ?auto_451886 ?auto_451887 ?auto_451888 ?auto_451889 ?auto_451890 ?auto_451891 ?auto_451892 ?auto_451893 ?auto_451894 ?auto_451895 ?auto_451896 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451910 - BLOCK
      ?auto_451911 - BLOCK
      ?auto_451912 - BLOCK
      ?auto_451913 - BLOCK
      ?auto_451914 - BLOCK
      ?auto_451915 - BLOCK
      ?auto_451916 - BLOCK
      ?auto_451917 - BLOCK
      ?auto_451918 - BLOCK
      ?auto_451919 - BLOCK
      ?auto_451920 - BLOCK
      ?auto_451921 - BLOCK
    )
    :vars
    (
      ?auto_451922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451921 ?auto_451922 ) ( ON-TABLE ?auto_451910 ) ( ON ?auto_451911 ?auto_451910 ) ( not ( = ?auto_451910 ?auto_451911 ) ) ( not ( = ?auto_451910 ?auto_451912 ) ) ( not ( = ?auto_451910 ?auto_451913 ) ) ( not ( = ?auto_451910 ?auto_451914 ) ) ( not ( = ?auto_451910 ?auto_451915 ) ) ( not ( = ?auto_451910 ?auto_451916 ) ) ( not ( = ?auto_451910 ?auto_451917 ) ) ( not ( = ?auto_451910 ?auto_451918 ) ) ( not ( = ?auto_451910 ?auto_451919 ) ) ( not ( = ?auto_451910 ?auto_451920 ) ) ( not ( = ?auto_451910 ?auto_451921 ) ) ( not ( = ?auto_451910 ?auto_451922 ) ) ( not ( = ?auto_451911 ?auto_451912 ) ) ( not ( = ?auto_451911 ?auto_451913 ) ) ( not ( = ?auto_451911 ?auto_451914 ) ) ( not ( = ?auto_451911 ?auto_451915 ) ) ( not ( = ?auto_451911 ?auto_451916 ) ) ( not ( = ?auto_451911 ?auto_451917 ) ) ( not ( = ?auto_451911 ?auto_451918 ) ) ( not ( = ?auto_451911 ?auto_451919 ) ) ( not ( = ?auto_451911 ?auto_451920 ) ) ( not ( = ?auto_451911 ?auto_451921 ) ) ( not ( = ?auto_451911 ?auto_451922 ) ) ( not ( = ?auto_451912 ?auto_451913 ) ) ( not ( = ?auto_451912 ?auto_451914 ) ) ( not ( = ?auto_451912 ?auto_451915 ) ) ( not ( = ?auto_451912 ?auto_451916 ) ) ( not ( = ?auto_451912 ?auto_451917 ) ) ( not ( = ?auto_451912 ?auto_451918 ) ) ( not ( = ?auto_451912 ?auto_451919 ) ) ( not ( = ?auto_451912 ?auto_451920 ) ) ( not ( = ?auto_451912 ?auto_451921 ) ) ( not ( = ?auto_451912 ?auto_451922 ) ) ( not ( = ?auto_451913 ?auto_451914 ) ) ( not ( = ?auto_451913 ?auto_451915 ) ) ( not ( = ?auto_451913 ?auto_451916 ) ) ( not ( = ?auto_451913 ?auto_451917 ) ) ( not ( = ?auto_451913 ?auto_451918 ) ) ( not ( = ?auto_451913 ?auto_451919 ) ) ( not ( = ?auto_451913 ?auto_451920 ) ) ( not ( = ?auto_451913 ?auto_451921 ) ) ( not ( = ?auto_451913 ?auto_451922 ) ) ( not ( = ?auto_451914 ?auto_451915 ) ) ( not ( = ?auto_451914 ?auto_451916 ) ) ( not ( = ?auto_451914 ?auto_451917 ) ) ( not ( = ?auto_451914 ?auto_451918 ) ) ( not ( = ?auto_451914 ?auto_451919 ) ) ( not ( = ?auto_451914 ?auto_451920 ) ) ( not ( = ?auto_451914 ?auto_451921 ) ) ( not ( = ?auto_451914 ?auto_451922 ) ) ( not ( = ?auto_451915 ?auto_451916 ) ) ( not ( = ?auto_451915 ?auto_451917 ) ) ( not ( = ?auto_451915 ?auto_451918 ) ) ( not ( = ?auto_451915 ?auto_451919 ) ) ( not ( = ?auto_451915 ?auto_451920 ) ) ( not ( = ?auto_451915 ?auto_451921 ) ) ( not ( = ?auto_451915 ?auto_451922 ) ) ( not ( = ?auto_451916 ?auto_451917 ) ) ( not ( = ?auto_451916 ?auto_451918 ) ) ( not ( = ?auto_451916 ?auto_451919 ) ) ( not ( = ?auto_451916 ?auto_451920 ) ) ( not ( = ?auto_451916 ?auto_451921 ) ) ( not ( = ?auto_451916 ?auto_451922 ) ) ( not ( = ?auto_451917 ?auto_451918 ) ) ( not ( = ?auto_451917 ?auto_451919 ) ) ( not ( = ?auto_451917 ?auto_451920 ) ) ( not ( = ?auto_451917 ?auto_451921 ) ) ( not ( = ?auto_451917 ?auto_451922 ) ) ( not ( = ?auto_451918 ?auto_451919 ) ) ( not ( = ?auto_451918 ?auto_451920 ) ) ( not ( = ?auto_451918 ?auto_451921 ) ) ( not ( = ?auto_451918 ?auto_451922 ) ) ( not ( = ?auto_451919 ?auto_451920 ) ) ( not ( = ?auto_451919 ?auto_451921 ) ) ( not ( = ?auto_451919 ?auto_451922 ) ) ( not ( = ?auto_451920 ?auto_451921 ) ) ( not ( = ?auto_451920 ?auto_451922 ) ) ( not ( = ?auto_451921 ?auto_451922 ) ) ( ON ?auto_451920 ?auto_451921 ) ( ON ?auto_451919 ?auto_451920 ) ( ON ?auto_451918 ?auto_451919 ) ( ON ?auto_451917 ?auto_451918 ) ( ON ?auto_451916 ?auto_451917 ) ( ON ?auto_451915 ?auto_451916 ) ( ON ?auto_451914 ?auto_451915 ) ( ON ?auto_451913 ?auto_451914 ) ( CLEAR ?auto_451911 ) ( ON ?auto_451912 ?auto_451913 ) ( CLEAR ?auto_451912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_451910 ?auto_451911 ?auto_451912 )
      ( MAKE-12PILE ?auto_451910 ?auto_451911 ?auto_451912 ?auto_451913 ?auto_451914 ?auto_451915 ?auto_451916 ?auto_451917 ?auto_451918 ?auto_451919 ?auto_451920 ?auto_451921 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451935 - BLOCK
      ?auto_451936 - BLOCK
      ?auto_451937 - BLOCK
      ?auto_451938 - BLOCK
      ?auto_451939 - BLOCK
      ?auto_451940 - BLOCK
      ?auto_451941 - BLOCK
      ?auto_451942 - BLOCK
      ?auto_451943 - BLOCK
      ?auto_451944 - BLOCK
      ?auto_451945 - BLOCK
      ?auto_451946 - BLOCK
    )
    :vars
    (
      ?auto_451947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451946 ?auto_451947 ) ( ON-TABLE ?auto_451935 ) ( ON ?auto_451936 ?auto_451935 ) ( not ( = ?auto_451935 ?auto_451936 ) ) ( not ( = ?auto_451935 ?auto_451937 ) ) ( not ( = ?auto_451935 ?auto_451938 ) ) ( not ( = ?auto_451935 ?auto_451939 ) ) ( not ( = ?auto_451935 ?auto_451940 ) ) ( not ( = ?auto_451935 ?auto_451941 ) ) ( not ( = ?auto_451935 ?auto_451942 ) ) ( not ( = ?auto_451935 ?auto_451943 ) ) ( not ( = ?auto_451935 ?auto_451944 ) ) ( not ( = ?auto_451935 ?auto_451945 ) ) ( not ( = ?auto_451935 ?auto_451946 ) ) ( not ( = ?auto_451935 ?auto_451947 ) ) ( not ( = ?auto_451936 ?auto_451937 ) ) ( not ( = ?auto_451936 ?auto_451938 ) ) ( not ( = ?auto_451936 ?auto_451939 ) ) ( not ( = ?auto_451936 ?auto_451940 ) ) ( not ( = ?auto_451936 ?auto_451941 ) ) ( not ( = ?auto_451936 ?auto_451942 ) ) ( not ( = ?auto_451936 ?auto_451943 ) ) ( not ( = ?auto_451936 ?auto_451944 ) ) ( not ( = ?auto_451936 ?auto_451945 ) ) ( not ( = ?auto_451936 ?auto_451946 ) ) ( not ( = ?auto_451936 ?auto_451947 ) ) ( not ( = ?auto_451937 ?auto_451938 ) ) ( not ( = ?auto_451937 ?auto_451939 ) ) ( not ( = ?auto_451937 ?auto_451940 ) ) ( not ( = ?auto_451937 ?auto_451941 ) ) ( not ( = ?auto_451937 ?auto_451942 ) ) ( not ( = ?auto_451937 ?auto_451943 ) ) ( not ( = ?auto_451937 ?auto_451944 ) ) ( not ( = ?auto_451937 ?auto_451945 ) ) ( not ( = ?auto_451937 ?auto_451946 ) ) ( not ( = ?auto_451937 ?auto_451947 ) ) ( not ( = ?auto_451938 ?auto_451939 ) ) ( not ( = ?auto_451938 ?auto_451940 ) ) ( not ( = ?auto_451938 ?auto_451941 ) ) ( not ( = ?auto_451938 ?auto_451942 ) ) ( not ( = ?auto_451938 ?auto_451943 ) ) ( not ( = ?auto_451938 ?auto_451944 ) ) ( not ( = ?auto_451938 ?auto_451945 ) ) ( not ( = ?auto_451938 ?auto_451946 ) ) ( not ( = ?auto_451938 ?auto_451947 ) ) ( not ( = ?auto_451939 ?auto_451940 ) ) ( not ( = ?auto_451939 ?auto_451941 ) ) ( not ( = ?auto_451939 ?auto_451942 ) ) ( not ( = ?auto_451939 ?auto_451943 ) ) ( not ( = ?auto_451939 ?auto_451944 ) ) ( not ( = ?auto_451939 ?auto_451945 ) ) ( not ( = ?auto_451939 ?auto_451946 ) ) ( not ( = ?auto_451939 ?auto_451947 ) ) ( not ( = ?auto_451940 ?auto_451941 ) ) ( not ( = ?auto_451940 ?auto_451942 ) ) ( not ( = ?auto_451940 ?auto_451943 ) ) ( not ( = ?auto_451940 ?auto_451944 ) ) ( not ( = ?auto_451940 ?auto_451945 ) ) ( not ( = ?auto_451940 ?auto_451946 ) ) ( not ( = ?auto_451940 ?auto_451947 ) ) ( not ( = ?auto_451941 ?auto_451942 ) ) ( not ( = ?auto_451941 ?auto_451943 ) ) ( not ( = ?auto_451941 ?auto_451944 ) ) ( not ( = ?auto_451941 ?auto_451945 ) ) ( not ( = ?auto_451941 ?auto_451946 ) ) ( not ( = ?auto_451941 ?auto_451947 ) ) ( not ( = ?auto_451942 ?auto_451943 ) ) ( not ( = ?auto_451942 ?auto_451944 ) ) ( not ( = ?auto_451942 ?auto_451945 ) ) ( not ( = ?auto_451942 ?auto_451946 ) ) ( not ( = ?auto_451942 ?auto_451947 ) ) ( not ( = ?auto_451943 ?auto_451944 ) ) ( not ( = ?auto_451943 ?auto_451945 ) ) ( not ( = ?auto_451943 ?auto_451946 ) ) ( not ( = ?auto_451943 ?auto_451947 ) ) ( not ( = ?auto_451944 ?auto_451945 ) ) ( not ( = ?auto_451944 ?auto_451946 ) ) ( not ( = ?auto_451944 ?auto_451947 ) ) ( not ( = ?auto_451945 ?auto_451946 ) ) ( not ( = ?auto_451945 ?auto_451947 ) ) ( not ( = ?auto_451946 ?auto_451947 ) ) ( ON ?auto_451945 ?auto_451946 ) ( ON ?auto_451944 ?auto_451945 ) ( ON ?auto_451943 ?auto_451944 ) ( ON ?auto_451942 ?auto_451943 ) ( ON ?auto_451941 ?auto_451942 ) ( ON ?auto_451940 ?auto_451941 ) ( ON ?auto_451939 ?auto_451940 ) ( ON ?auto_451938 ?auto_451939 ) ( CLEAR ?auto_451936 ) ( ON ?auto_451937 ?auto_451938 ) ( CLEAR ?auto_451937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_451935 ?auto_451936 ?auto_451937 )
      ( MAKE-12PILE ?auto_451935 ?auto_451936 ?auto_451937 ?auto_451938 ?auto_451939 ?auto_451940 ?auto_451941 ?auto_451942 ?auto_451943 ?auto_451944 ?auto_451945 ?auto_451946 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451960 - BLOCK
      ?auto_451961 - BLOCK
      ?auto_451962 - BLOCK
      ?auto_451963 - BLOCK
      ?auto_451964 - BLOCK
      ?auto_451965 - BLOCK
      ?auto_451966 - BLOCK
      ?auto_451967 - BLOCK
      ?auto_451968 - BLOCK
      ?auto_451969 - BLOCK
      ?auto_451970 - BLOCK
      ?auto_451971 - BLOCK
    )
    :vars
    (
      ?auto_451972 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451971 ?auto_451972 ) ( ON-TABLE ?auto_451960 ) ( not ( = ?auto_451960 ?auto_451961 ) ) ( not ( = ?auto_451960 ?auto_451962 ) ) ( not ( = ?auto_451960 ?auto_451963 ) ) ( not ( = ?auto_451960 ?auto_451964 ) ) ( not ( = ?auto_451960 ?auto_451965 ) ) ( not ( = ?auto_451960 ?auto_451966 ) ) ( not ( = ?auto_451960 ?auto_451967 ) ) ( not ( = ?auto_451960 ?auto_451968 ) ) ( not ( = ?auto_451960 ?auto_451969 ) ) ( not ( = ?auto_451960 ?auto_451970 ) ) ( not ( = ?auto_451960 ?auto_451971 ) ) ( not ( = ?auto_451960 ?auto_451972 ) ) ( not ( = ?auto_451961 ?auto_451962 ) ) ( not ( = ?auto_451961 ?auto_451963 ) ) ( not ( = ?auto_451961 ?auto_451964 ) ) ( not ( = ?auto_451961 ?auto_451965 ) ) ( not ( = ?auto_451961 ?auto_451966 ) ) ( not ( = ?auto_451961 ?auto_451967 ) ) ( not ( = ?auto_451961 ?auto_451968 ) ) ( not ( = ?auto_451961 ?auto_451969 ) ) ( not ( = ?auto_451961 ?auto_451970 ) ) ( not ( = ?auto_451961 ?auto_451971 ) ) ( not ( = ?auto_451961 ?auto_451972 ) ) ( not ( = ?auto_451962 ?auto_451963 ) ) ( not ( = ?auto_451962 ?auto_451964 ) ) ( not ( = ?auto_451962 ?auto_451965 ) ) ( not ( = ?auto_451962 ?auto_451966 ) ) ( not ( = ?auto_451962 ?auto_451967 ) ) ( not ( = ?auto_451962 ?auto_451968 ) ) ( not ( = ?auto_451962 ?auto_451969 ) ) ( not ( = ?auto_451962 ?auto_451970 ) ) ( not ( = ?auto_451962 ?auto_451971 ) ) ( not ( = ?auto_451962 ?auto_451972 ) ) ( not ( = ?auto_451963 ?auto_451964 ) ) ( not ( = ?auto_451963 ?auto_451965 ) ) ( not ( = ?auto_451963 ?auto_451966 ) ) ( not ( = ?auto_451963 ?auto_451967 ) ) ( not ( = ?auto_451963 ?auto_451968 ) ) ( not ( = ?auto_451963 ?auto_451969 ) ) ( not ( = ?auto_451963 ?auto_451970 ) ) ( not ( = ?auto_451963 ?auto_451971 ) ) ( not ( = ?auto_451963 ?auto_451972 ) ) ( not ( = ?auto_451964 ?auto_451965 ) ) ( not ( = ?auto_451964 ?auto_451966 ) ) ( not ( = ?auto_451964 ?auto_451967 ) ) ( not ( = ?auto_451964 ?auto_451968 ) ) ( not ( = ?auto_451964 ?auto_451969 ) ) ( not ( = ?auto_451964 ?auto_451970 ) ) ( not ( = ?auto_451964 ?auto_451971 ) ) ( not ( = ?auto_451964 ?auto_451972 ) ) ( not ( = ?auto_451965 ?auto_451966 ) ) ( not ( = ?auto_451965 ?auto_451967 ) ) ( not ( = ?auto_451965 ?auto_451968 ) ) ( not ( = ?auto_451965 ?auto_451969 ) ) ( not ( = ?auto_451965 ?auto_451970 ) ) ( not ( = ?auto_451965 ?auto_451971 ) ) ( not ( = ?auto_451965 ?auto_451972 ) ) ( not ( = ?auto_451966 ?auto_451967 ) ) ( not ( = ?auto_451966 ?auto_451968 ) ) ( not ( = ?auto_451966 ?auto_451969 ) ) ( not ( = ?auto_451966 ?auto_451970 ) ) ( not ( = ?auto_451966 ?auto_451971 ) ) ( not ( = ?auto_451966 ?auto_451972 ) ) ( not ( = ?auto_451967 ?auto_451968 ) ) ( not ( = ?auto_451967 ?auto_451969 ) ) ( not ( = ?auto_451967 ?auto_451970 ) ) ( not ( = ?auto_451967 ?auto_451971 ) ) ( not ( = ?auto_451967 ?auto_451972 ) ) ( not ( = ?auto_451968 ?auto_451969 ) ) ( not ( = ?auto_451968 ?auto_451970 ) ) ( not ( = ?auto_451968 ?auto_451971 ) ) ( not ( = ?auto_451968 ?auto_451972 ) ) ( not ( = ?auto_451969 ?auto_451970 ) ) ( not ( = ?auto_451969 ?auto_451971 ) ) ( not ( = ?auto_451969 ?auto_451972 ) ) ( not ( = ?auto_451970 ?auto_451971 ) ) ( not ( = ?auto_451970 ?auto_451972 ) ) ( not ( = ?auto_451971 ?auto_451972 ) ) ( ON ?auto_451970 ?auto_451971 ) ( ON ?auto_451969 ?auto_451970 ) ( ON ?auto_451968 ?auto_451969 ) ( ON ?auto_451967 ?auto_451968 ) ( ON ?auto_451966 ?auto_451967 ) ( ON ?auto_451965 ?auto_451966 ) ( ON ?auto_451964 ?auto_451965 ) ( ON ?auto_451963 ?auto_451964 ) ( ON ?auto_451962 ?auto_451963 ) ( CLEAR ?auto_451960 ) ( ON ?auto_451961 ?auto_451962 ) ( CLEAR ?auto_451961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_451960 ?auto_451961 )
      ( MAKE-12PILE ?auto_451960 ?auto_451961 ?auto_451962 ?auto_451963 ?auto_451964 ?auto_451965 ?auto_451966 ?auto_451967 ?auto_451968 ?auto_451969 ?auto_451970 ?auto_451971 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_451985 - BLOCK
      ?auto_451986 - BLOCK
      ?auto_451987 - BLOCK
      ?auto_451988 - BLOCK
      ?auto_451989 - BLOCK
      ?auto_451990 - BLOCK
      ?auto_451991 - BLOCK
      ?auto_451992 - BLOCK
      ?auto_451993 - BLOCK
      ?auto_451994 - BLOCK
      ?auto_451995 - BLOCK
      ?auto_451996 - BLOCK
    )
    :vars
    (
      ?auto_451997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_451996 ?auto_451997 ) ( ON-TABLE ?auto_451985 ) ( not ( = ?auto_451985 ?auto_451986 ) ) ( not ( = ?auto_451985 ?auto_451987 ) ) ( not ( = ?auto_451985 ?auto_451988 ) ) ( not ( = ?auto_451985 ?auto_451989 ) ) ( not ( = ?auto_451985 ?auto_451990 ) ) ( not ( = ?auto_451985 ?auto_451991 ) ) ( not ( = ?auto_451985 ?auto_451992 ) ) ( not ( = ?auto_451985 ?auto_451993 ) ) ( not ( = ?auto_451985 ?auto_451994 ) ) ( not ( = ?auto_451985 ?auto_451995 ) ) ( not ( = ?auto_451985 ?auto_451996 ) ) ( not ( = ?auto_451985 ?auto_451997 ) ) ( not ( = ?auto_451986 ?auto_451987 ) ) ( not ( = ?auto_451986 ?auto_451988 ) ) ( not ( = ?auto_451986 ?auto_451989 ) ) ( not ( = ?auto_451986 ?auto_451990 ) ) ( not ( = ?auto_451986 ?auto_451991 ) ) ( not ( = ?auto_451986 ?auto_451992 ) ) ( not ( = ?auto_451986 ?auto_451993 ) ) ( not ( = ?auto_451986 ?auto_451994 ) ) ( not ( = ?auto_451986 ?auto_451995 ) ) ( not ( = ?auto_451986 ?auto_451996 ) ) ( not ( = ?auto_451986 ?auto_451997 ) ) ( not ( = ?auto_451987 ?auto_451988 ) ) ( not ( = ?auto_451987 ?auto_451989 ) ) ( not ( = ?auto_451987 ?auto_451990 ) ) ( not ( = ?auto_451987 ?auto_451991 ) ) ( not ( = ?auto_451987 ?auto_451992 ) ) ( not ( = ?auto_451987 ?auto_451993 ) ) ( not ( = ?auto_451987 ?auto_451994 ) ) ( not ( = ?auto_451987 ?auto_451995 ) ) ( not ( = ?auto_451987 ?auto_451996 ) ) ( not ( = ?auto_451987 ?auto_451997 ) ) ( not ( = ?auto_451988 ?auto_451989 ) ) ( not ( = ?auto_451988 ?auto_451990 ) ) ( not ( = ?auto_451988 ?auto_451991 ) ) ( not ( = ?auto_451988 ?auto_451992 ) ) ( not ( = ?auto_451988 ?auto_451993 ) ) ( not ( = ?auto_451988 ?auto_451994 ) ) ( not ( = ?auto_451988 ?auto_451995 ) ) ( not ( = ?auto_451988 ?auto_451996 ) ) ( not ( = ?auto_451988 ?auto_451997 ) ) ( not ( = ?auto_451989 ?auto_451990 ) ) ( not ( = ?auto_451989 ?auto_451991 ) ) ( not ( = ?auto_451989 ?auto_451992 ) ) ( not ( = ?auto_451989 ?auto_451993 ) ) ( not ( = ?auto_451989 ?auto_451994 ) ) ( not ( = ?auto_451989 ?auto_451995 ) ) ( not ( = ?auto_451989 ?auto_451996 ) ) ( not ( = ?auto_451989 ?auto_451997 ) ) ( not ( = ?auto_451990 ?auto_451991 ) ) ( not ( = ?auto_451990 ?auto_451992 ) ) ( not ( = ?auto_451990 ?auto_451993 ) ) ( not ( = ?auto_451990 ?auto_451994 ) ) ( not ( = ?auto_451990 ?auto_451995 ) ) ( not ( = ?auto_451990 ?auto_451996 ) ) ( not ( = ?auto_451990 ?auto_451997 ) ) ( not ( = ?auto_451991 ?auto_451992 ) ) ( not ( = ?auto_451991 ?auto_451993 ) ) ( not ( = ?auto_451991 ?auto_451994 ) ) ( not ( = ?auto_451991 ?auto_451995 ) ) ( not ( = ?auto_451991 ?auto_451996 ) ) ( not ( = ?auto_451991 ?auto_451997 ) ) ( not ( = ?auto_451992 ?auto_451993 ) ) ( not ( = ?auto_451992 ?auto_451994 ) ) ( not ( = ?auto_451992 ?auto_451995 ) ) ( not ( = ?auto_451992 ?auto_451996 ) ) ( not ( = ?auto_451992 ?auto_451997 ) ) ( not ( = ?auto_451993 ?auto_451994 ) ) ( not ( = ?auto_451993 ?auto_451995 ) ) ( not ( = ?auto_451993 ?auto_451996 ) ) ( not ( = ?auto_451993 ?auto_451997 ) ) ( not ( = ?auto_451994 ?auto_451995 ) ) ( not ( = ?auto_451994 ?auto_451996 ) ) ( not ( = ?auto_451994 ?auto_451997 ) ) ( not ( = ?auto_451995 ?auto_451996 ) ) ( not ( = ?auto_451995 ?auto_451997 ) ) ( not ( = ?auto_451996 ?auto_451997 ) ) ( ON ?auto_451995 ?auto_451996 ) ( ON ?auto_451994 ?auto_451995 ) ( ON ?auto_451993 ?auto_451994 ) ( ON ?auto_451992 ?auto_451993 ) ( ON ?auto_451991 ?auto_451992 ) ( ON ?auto_451990 ?auto_451991 ) ( ON ?auto_451989 ?auto_451990 ) ( ON ?auto_451988 ?auto_451989 ) ( ON ?auto_451987 ?auto_451988 ) ( CLEAR ?auto_451985 ) ( ON ?auto_451986 ?auto_451987 ) ( CLEAR ?auto_451986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_451985 ?auto_451986 )
      ( MAKE-12PILE ?auto_451985 ?auto_451986 ?auto_451987 ?auto_451988 ?auto_451989 ?auto_451990 ?auto_451991 ?auto_451992 ?auto_451993 ?auto_451994 ?auto_451995 ?auto_451996 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_452010 - BLOCK
      ?auto_452011 - BLOCK
      ?auto_452012 - BLOCK
      ?auto_452013 - BLOCK
      ?auto_452014 - BLOCK
      ?auto_452015 - BLOCK
      ?auto_452016 - BLOCK
      ?auto_452017 - BLOCK
      ?auto_452018 - BLOCK
      ?auto_452019 - BLOCK
      ?auto_452020 - BLOCK
      ?auto_452021 - BLOCK
    )
    :vars
    (
      ?auto_452022 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452021 ?auto_452022 ) ( not ( = ?auto_452010 ?auto_452011 ) ) ( not ( = ?auto_452010 ?auto_452012 ) ) ( not ( = ?auto_452010 ?auto_452013 ) ) ( not ( = ?auto_452010 ?auto_452014 ) ) ( not ( = ?auto_452010 ?auto_452015 ) ) ( not ( = ?auto_452010 ?auto_452016 ) ) ( not ( = ?auto_452010 ?auto_452017 ) ) ( not ( = ?auto_452010 ?auto_452018 ) ) ( not ( = ?auto_452010 ?auto_452019 ) ) ( not ( = ?auto_452010 ?auto_452020 ) ) ( not ( = ?auto_452010 ?auto_452021 ) ) ( not ( = ?auto_452010 ?auto_452022 ) ) ( not ( = ?auto_452011 ?auto_452012 ) ) ( not ( = ?auto_452011 ?auto_452013 ) ) ( not ( = ?auto_452011 ?auto_452014 ) ) ( not ( = ?auto_452011 ?auto_452015 ) ) ( not ( = ?auto_452011 ?auto_452016 ) ) ( not ( = ?auto_452011 ?auto_452017 ) ) ( not ( = ?auto_452011 ?auto_452018 ) ) ( not ( = ?auto_452011 ?auto_452019 ) ) ( not ( = ?auto_452011 ?auto_452020 ) ) ( not ( = ?auto_452011 ?auto_452021 ) ) ( not ( = ?auto_452011 ?auto_452022 ) ) ( not ( = ?auto_452012 ?auto_452013 ) ) ( not ( = ?auto_452012 ?auto_452014 ) ) ( not ( = ?auto_452012 ?auto_452015 ) ) ( not ( = ?auto_452012 ?auto_452016 ) ) ( not ( = ?auto_452012 ?auto_452017 ) ) ( not ( = ?auto_452012 ?auto_452018 ) ) ( not ( = ?auto_452012 ?auto_452019 ) ) ( not ( = ?auto_452012 ?auto_452020 ) ) ( not ( = ?auto_452012 ?auto_452021 ) ) ( not ( = ?auto_452012 ?auto_452022 ) ) ( not ( = ?auto_452013 ?auto_452014 ) ) ( not ( = ?auto_452013 ?auto_452015 ) ) ( not ( = ?auto_452013 ?auto_452016 ) ) ( not ( = ?auto_452013 ?auto_452017 ) ) ( not ( = ?auto_452013 ?auto_452018 ) ) ( not ( = ?auto_452013 ?auto_452019 ) ) ( not ( = ?auto_452013 ?auto_452020 ) ) ( not ( = ?auto_452013 ?auto_452021 ) ) ( not ( = ?auto_452013 ?auto_452022 ) ) ( not ( = ?auto_452014 ?auto_452015 ) ) ( not ( = ?auto_452014 ?auto_452016 ) ) ( not ( = ?auto_452014 ?auto_452017 ) ) ( not ( = ?auto_452014 ?auto_452018 ) ) ( not ( = ?auto_452014 ?auto_452019 ) ) ( not ( = ?auto_452014 ?auto_452020 ) ) ( not ( = ?auto_452014 ?auto_452021 ) ) ( not ( = ?auto_452014 ?auto_452022 ) ) ( not ( = ?auto_452015 ?auto_452016 ) ) ( not ( = ?auto_452015 ?auto_452017 ) ) ( not ( = ?auto_452015 ?auto_452018 ) ) ( not ( = ?auto_452015 ?auto_452019 ) ) ( not ( = ?auto_452015 ?auto_452020 ) ) ( not ( = ?auto_452015 ?auto_452021 ) ) ( not ( = ?auto_452015 ?auto_452022 ) ) ( not ( = ?auto_452016 ?auto_452017 ) ) ( not ( = ?auto_452016 ?auto_452018 ) ) ( not ( = ?auto_452016 ?auto_452019 ) ) ( not ( = ?auto_452016 ?auto_452020 ) ) ( not ( = ?auto_452016 ?auto_452021 ) ) ( not ( = ?auto_452016 ?auto_452022 ) ) ( not ( = ?auto_452017 ?auto_452018 ) ) ( not ( = ?auto_452017 ?auto_452019 ) ) ( not ( = ?auto_452017 ?auto_452020 ) ) ( not ( = ?auto_452017 ?auto_452021 ) ) ( not ( = ?auto_452017 ?auto_452022 ) ) ( not ( = ?auto_452018 ?auto_452019 ) ) ( not ( = ?auto_452018 ?auto_452020 ) ) ( not ( = ?auto_452018 ?auto_452021 ) ) ( not ( = ?auto_452018 ?auto_452022 ) ) ( not ( = ?auto_452019 ?auto_452020 ) ) ( not ( = ?auto_452019 ?auto_452021 ) ) ( not ( = ?auto_452019 ?auto_452022 ) ) ( not ( = ?auto_452020 ?auto_452021 ) ) ( not ( = ?auto_452020 ?auto_452022 ) ) ( not ( = ?auto_452021 ?auto_452022 ) ) ( ON ?auto_452020 ?auto_452021 ) ( ON ?auto_452019 ?auto_452020 ) ( ON ?auto_452018 ?auto_452019 ) ( ON ?auto_452017 ?auto_452018 ) ( ON ?auto_452016 ?auto_452017 ) ( ON ?auto_452015 ?auto_452016 ) ( ON ?auto_452014 ?auto_452015 ) ( ON ?auto_452013 ?auto_452014 ) ( ON ?auto_452012 ?auto_452013 ) ( ON ?auto_452011 ?auto_452012 ) ( ON ?auto_452010 ?auto_452011 ) ( CLEAR ?auto_452010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_452010 )
      ( MAKE-12PILE ?auto_452010 ?auto_452011 ?auto_452012 ?auto_452013 ?auto_452014 ?auto_452015 ?auto_452016 ?auto_452017 ?auto_452018 ?auto_452019 ?auto_452020 ?auto_452021 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_452035 - BLOCK
      ?auto_452036 - BLOCK
      ?auto_452037 - BLOCK
      ?auto_452038 - BLOCK
      ?auto_452039 - BLOCK
      ?auto_452040 - BLOCK
      ?auto_452041 - BLOCK
      ?auto_452042 - BLOCK
      ?auto_452043 - BLOCK
      ?auto_452044 - BLOCK
      ?auto_452045 - BLOCK
      ?auto_452046 - BLOCK
    )
    :vars
    (
      ?auto_452047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452046 ?auto_452047 ) ( not ( = ?auto_452035 ?auto_452036 ) ) ( not ( = ?auto_452035 ?auto_452037 ) ) ( not ( = ?auto_452035 ?auto_452038 ) ) ( not ( = ?auto_452035 ?auto_452039 ) ) ( not ( = ?auto_452035 ?auto_452040 ) ) ( not ( = ?auto_452035 ?auto_452041 ) ) ( not ( = ?auto_452035 ?auto_452042 ) ) ( not ( = ?auto_452035 ?auto_452043 ) ) ( not ( = ?auto_452035 ?auto_452044 ) ) ( not ( = ?auto_452035 ?auto_452045 ) ) ( not ( = ?auto_452035 ?auto_452046 ) ) ( not ( = ?auto_452035 ?auto_452047 ) ) ( not ( = ?auto_452036 ?auto_452037 ) ) ( not ( = ?auto_452036 ?auto_452038 ) ) ( not ( = ?auto_452036 ?auto_452039 ) ) ( not ( = ?auto_452036 ?auto_452040 ) ) ( not ( = ?auto_452036 ?auto_452041 ) ) ( not ( = ?auto_452036 ?auto_452042 ) ) ( not ( = ?auto_452036 ?auto_452043 ) ) ( not ( = ?auto_452036 ?auto_452044 ) ) ( not ( = ?auto_452036 ?auto_452045 ) ) ( not ( = ?auto_452036 ?auto_452046 ) ) ( not ( = ?auto_452036 ?auto_452047 ) ) ( not ( = ?auto_452037 ?auto_452038 ) ) ( not ( = ?auto_452037 ?auto_452039 ) ) ( not ( = ?auto_452037 ?auto_452040 ) ) ( not ( = ?auto_452037 ?auto_452041 ) ) ( not ( = ?auto_452037 ?auto_452042 ) ) ( not ( = ?auto_452037 ?auto_452043 ) ) ( not ( = ?auto_452037 ?auto_452044 ) ) ( not ( = ?auto_452037 ?auto_452045 ) ) ( not ( = ?auto_452037 ?auto_452046 ) ) ( not ( = ?auto_452037 ?auto_452047 ) ) ( not ( = ?auto_452038 ?auto_452039 ) ) ( not ( = ?auto_452038 ?auto_452040 ) ) ( not ( = ?auto_452038 ?auto_452041 ) ) ( not ( = ?auto_452038 ?auto_452042 ) ) ( not ( = ?auto_452038 ?auto_452043 ) ) ( not ( = ?auto_452038 ?auto_452044 ) ) ( not ( = ?auto_452038 ?auto_452045 ) ) ( not ( = ?auto_452038 ?auto_452046 ) ) ( not ( = ?auto_452038 ?auto_452047 ) ) ( not ( = ?auto_452039 ?auto_452040 ) ) ( not ( = ?auto_452039 ?auto_452041 ) ) ( not ( = ?auto_452039 ?auto_452042 ) ) ( not ( = ?auto_452039 ?auto_452043 ) ) ( not ( = ?auto_452039 ?auto_452044 ) ) ( not ( = ?auto_452039 ?auto_452045 ) ) ( not ( = ?auto_452039 ?auto_452046 ) ) ( not ( = ?auto_452039 ?auto_452047 ) ) ( not ( = ?auto_452040 ?auto_452041 ) ) ( not ( = ?auto_452040 ?auto_452042 ) ) ( not ( = ?auto_452040 ?auto_452043 ) ) ( not ( = ?auto_452040 ?auto_452044 ) ) ( not ( = ?auto_452040 ?auto_452045 ) ) ( not ( = ?auto_452040 ?auto_452046 ) ) ( not ( = ?auto_452040 ?auto_452047 ) ) ( not ( = ?auto_452041 ?auto_452042 ) ) ( not ( = ?auto_452041 ?auto_452043 ) ) ( not ( = ?auto_452041 ?auto_452044 ) ) ( not ( = ?auto_452041 ?auto_452045 ) ) ( not ( = ?auto_452041 ?auto_452046 ) ) ( not ( = ?auto_452041 ?auto_452047 ) ) ( not ( = ?auto_452042 ?auto_452043 ) ) ( not ( = ?auto_452042 ?auto_452044 ) ) ( not ( = ?auto_452042 ?auto_452045 ) ) ( not ( = ?auto_452042 ?auto_452046 ) ) ( not ( = ?auto_452042 ?auto_452047 ) ) ( not ( = ?auto_452043 ?auto_452044 ) ) ( not ( = ?auto_452043 ?auto_452045 ) ) ( not ( = ?auto_452043 ?auto_452046 ) ) ( not ( = ?auto_452043 ?auto_452047 ) ) ( not ( = ?auto_452044 ?auto_452045 ) ) ( not ( = ?auto_452044 ?auto_452046 ) ) ( not ( = ?auto_452044 ?auto_452047 ) ) ( not ( = ?auto_452045 ?auto_452046 ) ) ( not ( = ?auto_452045 ?auto_452047 ) ) ( not ( = ?auto_452046 ?auto_452047 ) ) ( ON ?auto_452045 ?auto_452046 ) ( ON ?auto_452044 ?auto_452045 ) ( ON ?auto_452043 ?auto_452044 ) ( ON ?auto_452042 ?auto_452043 ) ( ON ?auto_452041 ?auto_452042 ) ( ON ?auto_452040 ?auto_452041 ) ( ON ?auto_452039 ?auto_452040 ) ( ON ?auto_452038 ?auto_452039 ) ( ON ?auto_452037 ?auto_452038 ) ( ON ?auto_452036 ?auto_452037 ) ( ON ?auto_452035 ?auto_452036 ) ( CLEAR ?auto_452035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_452035 )
      ( MAKE-12PILE ?auto_452035 ?auto_452036 ?auto_452037 ?auto_452038 ?auto_452039 ?auto_452040 ?auto_452041 ?auto_452042 ?auto_452043 ?auto_452044 ?auto_452045 ?auto_452046 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452061 - BLOCK
      ?auto_452062 - BLOCK
      ?auto_452063 - BLOCK
      ?auto_452064 - BLOCK
      ?auto_452065 - BLOCK
      ?auto_452066 - BLOCK
      ?auto_452067 - BLOCK
      ?auto_452068 - BLOCK
      ?auto_452069 - BLOCK
      ?auto_452070 - BLOCK
      ?auto_452071 - BLOCK
      ?auto_452072 - BLOCK
      ?auto_452073 - BLOCK
    )
    :vars
    (
      ?auto_452074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_452072 ) ( ON ?auto_452073 ?auto_452074 ) ( CLEAR ?auto_452073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_452061 ) ( ON ?auto_452062 ?auto_452061 ) ( ON ?auto_452063 ?auto_452062 ) ( ON ?auto_452064 ?auto_452063 ) ( ON ?auto_452065 ?auto_452064 ) ( ON ?auto_452066 ?auto_452065 ) ( ON ?auto_452067 ?auto_452066 ) ( ON ?auto_452068 ?auto_452067 ) ( ON ?auto_452069 ?auto_452068 ) ( ON ?auto_452070 ?auto_452069 ) ( ON ?auto_452071 ?auto_452070 ) ( ON ?auto_452072 ?auto_452071 ) ( not ( = ?auto_452061 ?auto_452062 ) ) ( not ( = ?auto_452061 ?auto_452063 ) ) ( not ( = ?auto_452061 ?auto_452064 ) ) ( not ( = ?auto_452061 ?auto_452065 ) ) ( not ( = ?auto_452061 ?auto_452066 ) ) ( not ( = ?auto_452061 ?auto_452067 ) ) ( not ( = ?auto_452061 ?auto_452068 ) ) ( not ( = ?auto_452061 ?auto_452069 ) ) ( not ( = ?auto_452061 ?auto_452070 ) ) ( not ( = ?auto_452061 ?auto_452071 ) ) ( not ( = ?auto_452061 ?auto_452072 ) ) ( not ( = ?auto_452061 ?auto_452073 ) ) ( not ( = ?auto_452061 ?auto_452074 ) ) ( not ( = ?auto_452062 ?auto_452063 ) ) ( not ( = ?auto_452062 ?auto_452064 ) ) ( not ( = ?auto_452062 ?auto_452065 ) ) ( not ( = ?auto_452062 ?auto_452066 ) ) ( not ( = ?auto_452062 ?auto_452067 ) ) ( not ( = ?auto_452062 ?auto_452068 ) ) ( not ( = ?auto_452062 ?auto_452069 ) ) ( not ( = ?auto_452062 ?auto_452070 ) ) ( not ( = ?auto_452062 ?auto_452071 ) ) ( not ( = ?auto_452062 ?auto_452072 ) ) ( not ( = ?auto_452062 ?auto_452073 ) ) ( not ( = ?auto_452062 ?auto_452074 ) ) ( not ( = ?auto_452063 ?auto_452064 ) ) ( not ( = ?auto_452063 ?auto_452065 ) ) ( not ( = ?auto_452063 ?auto_452066 ) ) ( not ( = ?auto_452063 ?auto_452067 ) ) ( not ( = ?auto_452063 ?auto_452068 ) ) ( not ( = ?auto_452063 ?auto_452069 ) ) ( not ( = ?auto_452063 ?auto_452070 ) ) ( not ( = ?auto_452063 ?auto_452071 ) ) ( not ( = ?auto_452063 ?auto_452072 ) ) ( not ( = ?auto_452063 ?auto_452073 ) ) ( not ( = ?auto_452063 ?auto_452074 ) ) ( not ( = ?auto_452064 ?auto_452065 ) ) ( not ( = ?auto_452064 ?auto_452066 ) ) ( not ( = ?auto_452064 ?auto_452067 ) ) ( not ( = ?auto_452064 ?auto_452068 ) ) ( not ( = ?auto_452064 ?auto_452069 ) ) ( not ( = ?auto_452064 ?auto_452070 ) ) ( not ( = ?auto_452064 ?auto_452071 ) ) ( not ( = ?auto_452064 ?auto_452072 ) ) ( not ( = ?auto_452064 ?auto_452073 ) ) ( not ( = ?auto_452064 ?auto_452074 ) ) ( not ( = ?auto_452065 ?auto_452066 ) ) ( not ( = ?auto_452065 ?auto_452067 ) ) ( not ( = ?auto_452065 ?auto_452068 ) ) ( not ( = ?auto_452065 ?auto_452069 ) ) ( not ( = ?auto_452065 ?auto_452070 ) ) ( not ( = ?auto_452065 ?auto_452071 ) ) ( not ( = ?auto_452065 ?auto_452072 ) ) ( not ( = ?auto_452065 ?auto_452073 ) ) ( not ( = ?auto_452065 ?auto_452074 ) ) ( not ( = ?auto_452066 ?auto_452067 ) ) ( not ( = ?auto_452066 ?auto_452068 ) ) ( not ( = ?auto_452066 ?auto_452069 ) ) ( not ( = ?auto_452066 ?auto_452070 ) ) ( not ( = ?auto_452066 ?auto_452071 ) ) ( not ( = ?auto_452066 ?auto_452072 ) ) ( not ( = ?auto_452066 ?auto_452073 ) ) ( not ( = ?auto_452066 ?auto_452074 ) ) ( not ( = ?auto_452067 ?auto_452068 ) ) ( not ( = ?auto_452067 ?auto_452069 ) ) ( not ( = ?auto_452067 ?auto_452070 ) ) ( not ( = ?auto_452067 ?auto_452071 ) ) ( not ( = ?auto_452067 ?auto_452072 ) ) ( not ( = ?auto_452067 ?auto_452073 ) ) ( not ( = ?auto_452067 ?auto_452074 ) ) ( not ( = ?auto_452068 ?auto_452069 ) ) ( not ( = ?auto_452068 ?auto_452070 ) ) ( not ( = ?auto_452068 ?auto_452071 ) ) ( not ( = ?auto_452068 ?auto_452072 ) ) ( not ( = ?auto_452068 ?auto_452073 ) ) ( not ( = ?auto_452068 ?auto_452074 ) ) ( not ( = ?auto_452069 ?auto_452070 ) ) ( not ( = ?auto_452069 ?auto_452071 ) ) ( not ( = ?auto_452069 ?auto_452072 ) ) ( not ( = ?auto_452069 ?auto_452073 ) ) ( not ( = ?auto_452069 ?auto_452074 ) ) ( not ( = ?auto_452070 ?auto_452071 ) ) ( not ( = ?auto_452070 ?auto_452072 ) ) ( not ( = ?auto_452070 ?auto_452073 ) ) ( not ( = ?auto_452070 ?auto_452074 ) ) ( not ( = ?auto_452071 ?auto_452072 ) ) ( not ( = ?auto_452071 ?auto_452073 ) ) ( not ( = ?auto_452071 ?auto_452074 ) ) ( not ( = ?auto_452072 ?auto_452073 ) ) ( not ( = ?auto_452072 ?auto_452074 ) ) ( not ( = ?auto_452073 ?auto_452074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_452073 ?auto_452074 )
      ( !STACK ?auto_452073 ?auto_452072 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452088 - BLOCK
      ?auto_452089 - BLOCK
      ?auto_452090 - BLOCK
      ?auto_452091 - BLOCK
      ?auto_452092 - BLOCK
      ?auto_452093 - BLOCK
      ?auto_452094 - BLOCK
      ?auto_452095 - BLOCK
      ?auto_452096 - BLOCK
      ?auto_452097 - BLOCK
      ?auto_452098 - BLOCK
      ?auto_452099 - BLOCK
      ?auto_452100 - BLOCK
    )
    :vars
    (
      ?auto_452101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_452099 ) ( ON ?auto_452100 ?auto_452101 ) ( CLEAR ?auto_452100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_452088 ) ( ON ?auto_452089 ?auto_452088 ) ( ON ?auto_452090 ?auto_452089 ) ( ON ?auto_452091 ?auto_452090 ) ( ON ?auto_452092 ?auto_452091 ) ( ON ?auto_452093 ?auto_452092 ) ( ON ?auto_452094 ?auto_452093 ) ( ON ?auto_452095 ?auto_452094 ) ( ON ?auto_452096 ?auto_452095 ) ( ON ?auto_452097 ?auto_452096 ) ( ON ?auto_452098 ?auto_452097 ) ( ON ?auto_452099 ?auto_452098 ) ( not ( = ?auto_452088 ?auto_452089 ) ) ( not ( = ?auto_452088 ?auto_452090 ) ) ( not ( = ?auto_452088 ?auto_452091 ) ) ( not ( = ?auto_452088 ?auto_452092 ) ) ( not ( = ?auto_452088 ?auto_452093 ) ) ( not ( = ?auto_452088 ?auto_452094 ) ) ( not ( = ?auto_452088 ?auto_452095 ) ) ( not ( = ?auto_452088 ?auto_452096 ) ) ( not ( = ?auto_452088 ?auto_452097 ) ) ( not ( = ?auto_452088 ?auto_452098 ) ) ( not ( = ?auto_452088 ?auto_452099 ) ) ( not ( = ?auto_452088 ?auto_452100 ) ) ( not ( = ?auto_452088 ?auto_452101 ) ) ( not ( = ?auto_452089 ?auto_452090 ) ) ( not ( = ?auto_452089 ?auto_452091 ) ) ( not ( = ?auto_452089 ?auto_452092 ) ) ( not ( = ?auto_452089 ?auto_452093 ) ) ( not ( = ?auto_452089 ?auto_452094 ) ) ( not ( = ?auto_452089 ?auto_452095 ) ) ( not ( = ?auto_452089 ?auto_452096 ) ) ( not ( = ?auto_452089 ?auto_452097 ) ) ( not ( = ?auto_452089 ?auto_452098 ) ) ( not ( = ?auto_452089 ?auto_452099 ) ) ( not ( = ?auto_452089 ?auto_452100 ) ) ( not ( = ?auto_452089 ?auto_452101 ) ) ( not ( = ?auto_452090 ?auto_452091 ) ) ( not ( = ?auto_452090 ?auto_452092 ) ) ( not ( = ?auto_452090 ?auto_452093 ) ) ( not ( = ?auto_452090 ?auto_452094 ) ) ( not ( = ?auto_452090 ?auto_452095 ) ) ( not ( = ?auto_452090 ?auto_452096 ) ) ( not ( = ?auto_452090 ?auto_452097 ) ) ( not ( = ?auto_452090 ?auto_452098 ) ) ( not ( = ?auto_452090 ?auto_452099 ) ) ( not ( = ?auto_452090 ?auto_452100 ) ) ( not ( = ?auto_452090 ?auto_452101 ) ) ( not ( = ?auto_452091 ?auto_452092 ) ) ( not ( = ?auto_452091 ?auto_452093 ) ) ( not ( = ?auto_452091 ?auto_452094 ) ) ( not ( = ?auto_452091 ?auto_452095 ) ) ( not ( = ?auto_452091 ?auto_452096 ) ) ( not ( = ?auto_452091 ?auto_452097 ) ) ( not ( = ?auto_452091 ?auto_452098 ) ) ( not ( = ?auto_452091 ?auto_452099 ) ) ( not ( = ?auto_452091 ?auto_452100 ) ) ( not ( = ?auto_452091 ?auto_452101 ) ) ( not ( = ?auto_452092 ?auto_452093 ) ) ( not ( = ?auto_452092 ?auto_452094 ) ) ( not ( = ?auto_452092 ?auto_452095 ) ) ( not ( = ?auto_452092 ?auto_452096 ) ) ( not ( = ?auto_452092 ?auto_452097 ) ) ( not ( = ?auto_452092 ?auto_452098 ) ) ( not ( = ?auto_452092 ?auto_452099 ) ) ( not ( = ?auto_452092 ?auto_452100 ) ) ( not ( = ?auto_452092 ?auto_452101 ) ) ( not ( = ?auto_452093 ?auto_452094 ) ) ( not ( = ?auto_452093 ?auto_452095 ) ) ( not ( = ?auto_452093 ?auto_452096 ) ) ( not ( = ?auto_452093 ?auto_452097 ) ) ( not ( = ?auto_452093 ?auto_452098 ) ) ( not ( = ?auto_452093 ?auto_452099 ) ) ( not ( = ?auto_452093 ?auto_452100 ) ) ( not ( = ?auto_452093 ?auto_452101 ) ) ( not ( = ?auto_452094 ?auto_452095 ) ) ( not ( = ?auto_452094 ?auto_452096 ) ) ( not ( = ?auto_452094 ?auto_452097 ) ) ( not ( = ?auto_452094 ?auto_452098 ) ) ( not ( = ?auto_452094 ?auto_452099 ) ) ( not ( = ?auto_452094 ?auto_452100 ) ) ( not ( = ?auto_452094 ?auto_452101 ) ) ( not ( = ?auto_452095 ?auto_452096 ) ) ( not ( = ?auto_452095 ?auto_452097 ) ) ( not ( = ?auto_452095 ?auto_452098 ) ) ( not ( = ?auto_452095 ?auto_452099 ) ) ( not ( = ?auto_452095 ?auto_452100 ) ) ( not ( = ?auto_452095 ?auto_452101 ) ) ( not ( = ?auto_452096 ?auto_452097 ) ) ( not ( = ?auto_452096 ?auto_452098 ) ) ( not ( = ?auto_452096 ?auto_452099 ) ) ( not ( = ?auto_452096 ?auto_452100 ) ) ( not ( = ?auto_452096 ?auto_452101 ) ) ( not ( = ?auto_452097 ?auto_452098 ) ) ( not ( = ?auto_452097 ?auto_452099 ) ) ( not ( = ?auto_452097 ?auto_452100 ) ) ( not ( = ?auto_452097 ?auto_452101 ) ) ( not ( = ?auto_452098 ?auto_452099 ) ) ( not ( = ?auto_452098 ?auto_452100 ) ) ( not ( = ?auto_452098 ?auto_452101 ) ) ( not ( = ?auto_452099 ?auto_452100 ) ) ( not ( = ?auto_452099 ?auto_452101 ) ) ( not ( = ?auto_452100 ?auto_452101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_452100 ?auto_452101 )
      ( !STACK ?auto_452100 ?auto_452099 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452115 - BLOCK
      ?auto_452116 - BLOCK
      ?auto_452117 - BLOCK
      ?auto_452118 - BLOCK
      ?auto_452119 - BLOCK
      ?auto_452120 - BLOCK
      ?auto_452121 - BLOCK
      ?auto_452122 - BLOCK
      ?auto_452123 - BLOCK
      ?auto_452124 - BLOCK
      ?auto_452125 - BLOCK
      ?auto_452126 - BLOCK
      ?auto_452127 - BLOCK
    )
    :vars
    (
      ?auto_452128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452127 ?auto_452128 ) ( ON-TABLE ?auto_452115 ) ( ON ?auto_452116 ?auto_452115 ) ( ON ?auto_452117 ?auto_452116 ) ( ON ?auto_452118 ?auto_452117 ) ( ON ?auto_452119 ?auto_452118 ) ( ON ?auto_452120 ?auto_452119 ) ( ON ?auto_452121 ?auto_452120 ) ( ON ?auto_452122 ?auto_452121 ) ( ON ?auto_452123 ?auto_452122 ) ( ON ?auto_452124 ?auto_452123 ) ( ON ?auto_452125 ?auto_452124 ) ( not ( = ?auto_452115 ?auto_452116 ) ) ( not ( = ?auto_452115 ?auto_452117 ) ) ( not ( = ?auto_452115 ?auto_452118 ) ) ( not ( = ?auto_452115 ?auto_452119 ) ) ( not ( = ?auto_452115 ?auto_452120 ) ) ( not ( = ?auto_452115 ?auto_452121 ) ) ( not ( = ?auto_452115 ?auto_452122 ) ) ( not ( = ?auto_452115 ?auto_452123 ) ) ( not ( = ?auto_452115 ?auto_452124 ) ) ( not ( = ?auto_452115 ?auto_452125 ) ) ( not ( = ?auto_452115 ?auto_452126 ) ) ( not ( = ?auto_452115 ?auto_452127 ) ) ( not ( = ?auto_452115 ?auto_452128 ) ) ( not ( = ?auto_452116 ?auto_452117 ) ) ( not ( = ?auto_452116 ?auto_452118 ) ) ( not ( = ?auto_452116 ?auto_452119 ) ) ( not ( = ?auto_452116 ?auto_452120 ) ) ( not ( = ?auto_452116 ?auto_452121 ) ) ( not ( = ?auto_452116 ?auto_452122 ) ) ( not ( = ?auto_452116 ?auto_452123 ) ) ( not ( = ?auto_452116 ?auto_452124 ) ) ( not ( = ?auto_452116 ?auto_452125 ) ) ( not ( = ?auto_452116 ?auto_452126 ) ) ( not ( = ?auto_452116 ?auto_452127 ) ) ( not ( = ?auto_452116 ?auto_452128 ) ) ( not ( = ?auto_452117 ?auto_452118 ) ) ( not ( = ?auto_452117 ?auto_452119 ) ) ( not ( = ?auto_452117 ?auto_452120 ) ) ( not ( = ?auto_452117 ?auto_452121 ) ) ( not ( = ?auto_452117 ?auto_452122 ) ) ( not ( = ?auto_452117 ?auto_452123 ) ) ( not ( = ?auto_452117 ?auto_452124 ) ) ( not ( = ?auto_452117 ?auto_452125 ) ) ( not ( = ?auto_452117 ?auto_452126 ) ) ( not ( = ?auto_452117 ?auto_452127 ) ) ( not ( = ?auto_452117 ?auto_452128 ) ) ( not ( = ?auto_452118 ?auto_452119 ) ) ( not ( = ?auto_452118 ?auto_452120 ) ) ( not ( = ?auto_452118 ?auto_452121 ) ) ( not ( = ?auto_452118 ?auto_452122 ) ) ( not ( = ?auto_452118 ?auto_452123 ) ) ( not ( = ?auto_452118 ?auto_452124 ) ) ( not ( = ?auto_452118 ?auto_452125 ) ) ( not ( = ?auto_452118 ?auto_452126 ) ) ( not ( = ?auto_452118 ?auto_452127 ) ) ( not ( = ?auto_452118 ?auto_452128 ) ) ( not ( = ?auto_452119 ?auto_452120 ) ) ( not ( = ?auto_452119 ?auto_452121 ) ) ( not ( = ?auto_452119 ?auto_452122 ) ) ( not ( = ?auto_452119 ?auto_452123 ) ) ( not ( = ?auto_452119 ?auto_452124 ) ) ( not ( = ?auto_452119 ?auto_452125 ) ) ( not ( = ?auto_452119 ?auto_452126 ) ) ( not ( = ?auto_452119 ?auto_452127 ) ) ( not ( = ?auto_452119 ?auto_452128 ) ) ( not ( = ?auto_452120 ?auto_452121 ) ) ( not ( = ?auto_452120 ?auto_452122 ) ) ( not ( = ?auto_452120 ?auto_452123 ) ) ( not ( = ?auto_452120 ?auto_452124 ) ) ( not ( = ?auto_452120 ?auto_452125 ) ) ( not ( = ?auto_452120 ?auto_452126 ) ) ( not ( = ?auto_452120 ?auto_452127 ) ) ( not ( = ?auto_452120 ?auto_452128 ) ) ( not ( = ?auto_452121 ?auto_452122 ) ) ( not ( = ?auto_452121 ?auto_452123 ) ) ( not ( = ?auto_452121 ?auto_452124 ) ) ( not ( = ?auto_452121 ?auto_452125 ) ) ( not ( = ?auto_452121 ?auto_452126 ) ) ( not ( = ?auto_452121 ?auto_452127 ) ) ( not ( = ?auto_452121 ?auto_452128 ) ) ( not ( = ?auto_452122 ?auto_452123 ) ) ( not ( = ?auto_452122 ?auto_452124 ) ) ( not ( = ?auto_452122 ?auto_452125 ) ) ( not ( = ?auto_452122 ?auto_452126 ) ) ( not ( = ?auto_452122 ?auto_452127 ) ) ( not ( = ?auto_452122 ?auto_452128 ) ) ( not ( = ?auto_452123 ?auto_452124 ) ) ( not ( = ?auto_452123 ?auto_452125 ) ) ( not ( = ?auto_452123 ?auto_452126 ) ) ( not ( = ?auto_452123 ?auto_452127 ) ) ( not ( = ?auto_452123 ?auto_452128 ) ) ( not ( = ?auto_452124 ?auto_452125 ) ) ( not ( = ?auto_452124 ?auto_452126 ) ) ( not ( = ?auto_452124 ?auto_452127 ) ) ( not ( = ?auto_452124 ?auto_452128 ) ) ( not ( = ?auto_452125 ?auto_452126 ) ) ( not ( = ?auto_452125 ?auto_452127 ) ) ( not ( = ?auto_452125 ?auto_452128 ) ) ( not ( = ?auto_452126 ?auto_452127 ) ) ( not ( = ?auto_452126 ?auto_452128 ) ) ( not ( = ?auto_452127 ?auto_452128 ) ) ( CLEAR ?auto_452125 ) ( ON ?auto_452126 ?auto_452127 ) ( CLEAR ?auto_452126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_452115 ?auto_452116 ?auto_452117 ?auto_452118 ?auto_452119 ?auto_452120 ?auto_452121 ?auto_452122 ?auto_452123 ?auto_452124 ?auto_452125 ?auto_452126 )
      ( MAKE-13PILE ?auto_452115 ?auto_452116 ?auto_452117 ?auto_452118 ?auto_452119 ?auto_452120 ?auto_452121 ?auto_452122 ?auto_452123 ?auto_452124 ?auto_452125 ?auto_452126 ?auto_452127 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452142 - BLOCK
      ?auto_452143 - BLOCK
      ?auto_452144 - BLOCK
      ?auto_452145 - BLOCK
      ?auto_452146 - BLOCK
      ?auto_452147 - BLOCK
      ?auto_452148 - BLOCK
      ?auto_452149 - BLOCK
      ?auto_452150 - BLOCK
      ?auto_452151 - BLOCK
      ?auto_452152 - BLOCK
      ?auto_452153 - BLOCK
      ?auto_452154 - BLOCK
    )
    :vars
    (
      ?auto_452155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452154 ?auto_452155 ) ( ON-TABLE ?auto_452142 ) ( ON ?auto_452143 ?auto_452142 ) ( ON ?auto_452144 ?auto_452143 ) ( ON ?auto_452145 ?auto_452144 ) ( ON ?auto_452146 ?auto_452145 ) ( ON ?auto_452147 ?auto_452146 ) ( ON ?auto_452148 ?auto_452147 ) ( ON ?auto_452149 ?auto_452148 ) ( ON ?auto_452150 ?auto_452149 ) ( ON ?auto_452151 ?auto_452150 ) ( ON ?auto_452152 ?auto_452151 ) ( not ( = ?auto_452142 ?auto_452143 ) ) ( not ( = ?auto_452142 ?auto_452144 ) ) ( not ( = ?auto_452142 ?auto_452145 ) ) ( not ( = ?auto_452142 ?auto_452146 ) ) ( not ( = ?auto_452142 ?auto_452147 ) ) ( not ( = ?auto_452142 ?auto_452148 ) ) ( not ( = ?auto_452142 ?auto_452149 ) ) ( not ( = ?auto_452142 ?auto_452150 ) ) ( not ( = ?auto_452142 ?auto_452151 ) ) ( not ( = ?auto_452142 ?auto_452152 ) ) ( not ( = ?auto_452142 ?auto_452153 ) ) ( not ( = ?auto_452142 ?auto_452154 ) ) ( not ( = ?auto_452142 ?auto_452155 ) ) ( not ( = ?auto_452143 ?auto_452144 ) ) ( not ( = ?auto_452143 ?auto_452145 ) ) ( not ( = ?auto_452143 ?auto_452146 ) ) ( not ( = ?auto_452143 ?auto_452147 ) ) ( not ( = ?auto_452143 ?auto_452148 ) ) ( not ( = ?auto_452143 ?auto_452149 ) ) ( not ( = ?auto_452143 ?auto_452150 ) ) ( not ( = ?auto_452143 ?auto_452151 ) ) ( not ( = ?auto_452143 ?auto_452152 ) ) ( not ( = ?auto_452143 ?auto_452153 ) ) ( not ( = ?auto_452143 ?auto_452154 ) ) ( not ( = ?auto_452143 ?auto_452155 ) ) ( not ( = ?auto_452144 ?auto_452145 ) ) ( not ( = ?auto_452144 ?auto_452146 ) ) ( not ( = ?auto_452144 ?auto_452147 ) ) ( not ( = ?auto_452144 ?auto_452148 ) ) ( not ( = ?auto_452144 ?auto_452149 ) ) ( not ( = ?auto_452144 ?auto_452150 ) ) ( not ( = ?auto_452144 ?auto_452151 ) ) ( not ( = ?auto_452144 ?auto_452152 ) ) ( not ( = ?auto_452144 ?auto_452153 ) ) ( not ( = ?auto_452144 ?auto_452154 ) ) ( not ( = ?auto_452144 ?auto_452155 ) ) ( not ( = ?auto_452145 ?auto_452146 ) ) ( not ( = ?auto_452145 ?auto_452147 ) ) ( not ( = ?auto_452145 ?auto_452148 ) ) ( not ( = ?auto_452145 ?auto_452149 ) ) ( not ( = ?auto_452145 ?auto_452150 ) ) ( not ( = ?auto_452145 ?auto_452151 ) ) ( not ( = ?auto_452145 ?auto_452152 ) ) ( not ( = ?auto_452145 ?auto_452153 ) ) ( not ( = ?auto_452145 ?auto_452154 ) ) ( not ( = ?auto_452145 ?auto_452155 ) ) ( not ( = ?auto_452146 ?auto_452147 ) ) ( not ( = ?auto_452146 ?auto_452148 ) ) ( not ( = ?auto_452146 ?auto_452149 ) ) ( not ( = ?auto_452146 ?auto_452150 ) ) ( not ( = ?auto_452146 ?auto_452151 ) ) ( not ( = ?auto_452146 ?auto_452152 ) ) ( not ( = ?auto_452146 ?auto_452153 ) ) ( not ( = ?auto_452146 ?auto_452154 ) ) ( not ( = ?auto_452146 ?auto_452155 ) ) ( not ( = ?auto_452147 ?auto_452148 ) ) ( not ( = ?auto_452147 ?auto_452149 ) ) ( not ( = ?auto_452147 ?auto_452150 ) ) ( not ( = ?auto_452147 ?auto_452151 ) ) ( not ( = ?auto_452147 ?auto_452152 ) ) ( not ( = ?auto_452147 ?auto_452153 ) ) ( not ( = ?auto_452147 ?auto_452154 ) ) ( not ( = ?auto_452147 ?auto_452155 ) ) ( not ( = ?auto_452148 ?auto_452149 ) ) ( not ( = ?auto_452148 ?auto_452150 ) ) ( not ( = ?auto_452148 ?auto_452151 ) ) ( not ( = ?auto_452148 ?auto_452152 ) ) ( not ( = ?auto_452148 ?auto_452153 ) ) ( not ( = ?auto_452148 ?auto_452154 ) ) ( not ( = ?auto_452148 ?auto_452155 ) ) ( not ( = ?auto_452149 ?auto_452150 ) ) ( not ( = ?auto_452149 ?auto_452151 ) ) ( not ( = ?auto_452149 ?auto_452152 ) ) ( not ( = ?auto_452149 ?auto_452153 ) ) ( not ( = ?auto_452149 ?auto_452154 ) ) ( not ( = ?auto_452149 ?auto_452155 ) ) ( not ( = ?auto_452150 ?auto_452151 ) ) ( not ( = ?auto_452150 ?auto_452152 ) ) ( not ( = ?auto_452150 ?auto_452153 ) ) ( not ( = ?auto_452150 ?auto_452154 ) ) ( not ( = ?auto_452150 ?auto_452155 ) ) ( not ( = ?auto_452151 ?auto_452152 ) ) ( not ( = ?auto_452151 ?auto_452153 ) ) ( not ( = ?auto_452151 ?auto_452154 ) ) ( not ( = ?auto_452151 ?auto_452155 ) ) ( not ( = ?auto_452152 ?auto_452153 ) ) ( not ( = ?auto_452152 ?auto_452154 ) ) ( not ( = ?auto_452152 ?auto_452155 ) ) ( not ( = ?auto_452153 ?auto_452154 ) ) ( not ( = ?auto_452153 ?auto_452155 ) ) ( not ( = ?auto_452154 ?auto_452155 ) ) ( CLEAR ?auto_452152 ) ( ON ?auto_452153 ?auto_452154 ) ( CLEAR ?auto_452153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_452142 ?auto_452143 ?auto_452144 ?auto_452145 ?auto_452146 ?auto_452147 ?auto_452148 ?auto_452149 ?auto_452150 ?auto_452151 ?auto_452152 ?auto_452153 )
      ( MAKE-13PILE ?auto_452142 ?auto_452143 ?auto_452144 ?auto_452145 ?auto_452146 ?auto_452147 ?auto_452148 ?auto_452149 ?auto_452150 ?auto_452151 ?auto_452152 ?auto_452153 ?auto_452154 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452169 - BLOCK
      ?auto_452170 - BLOCK
      ?auto_452171 - BLOCK
      ?auto_452172 - BLOCK
      ?auto_452173 - BLOCK
      ?auto_452174 - BLOCK
      ?auto_452175 - BLOCK
      ?auto_452176 - BLOCK
      ?auto_452177 - BLOCK
      ?auto_452178 - BLOCK
      ?auto_452179 - BLOCK
      ?auto_452180 - BLOCK
      ?auto_452181 - BLOCK
    )
    :vars
    (
      ?auto_452182 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452181 ?auto_452182 ) ( ON-TABLE ?auto_452169 ) ( ON ?auto_452170 ?auto_452169 ) ( ON ?auto_452171 ?auto_452170 ) ( ON ?auto_452172 ?auto_452171 ) ( ON ?auto_452173 ?auto_452172 ) ( ON ?auto_452174 ?auto_452173 ) ( ON ?auto_452175 ?auto_452174 ) ( ON ?auto_452176 ?auto_452175 ) ( ON ?auto_452177 ?auto_452176 ) ( ON ?auto_452178 ?auto_452177 ) ( not ( = ?auto_452169 ?auto_452170 ) ) ( not ( = ?auto_452169 ?auto_452171 ) ) ( not ( = ?auto_452169 ?auto_452172 ) ) ( not ( = ?auto_452169 ?auto_452173 ) ) ( not ( = ?auto_452169 ?auto_452174 ) ) ( not ( = ?auto_452169 ?auto_452175 ) ) ( not ( = ?auto_452169 ?auto_452176 ) ) ( not ( = ?auto_452169 ?auto_452177 ) ) ( not ( = ?auto_452169 ?auto_452178 ) ) ( not ( = ?auto_452169 ?auto_452179 ) ) ( not ( = ?auto_452169 ?auto_452180 ) ) ( not ( = ?auto_452169 ?auto_452181 ) ) ( not ( = ?auto_452169 ?auto_452182 ) ) ( not ( = ?auto_452170 ?auto_452171 ) ) ( not ( = ?auto_452170 ?auto_452172 ) ) ( not ( = ?auto_452170 ?auto_452173 ) ) ( not ( = ?auto_452170 ?auto_452174 ) ) ( not ( = ?auto_452170 ?auto_452175 ) ) ( not ( = ?auto_452170 ?auto_452176 ) ) ( not ( = ?auto_452170 ?auto_452177 ) ) ( not ( = ?auto_452170 ?auto_452178 ) ) ( not ( = ?auto_452170 ?auto_452179 ) ) ( not ( = ?auto_452170 ?auto_452180 ) ) ( not ( = ?auto_452170 ?auto_452181 ) ) ( not ( = ?auto_452170 ?auto_452182 ) ) ( not ( = ?auto_452171 ?auto_452172 ) ) ( not ( = ?auto_452171 ?auto_452173 ) ) ( not ( = ?auto_452171 ?auto_452174 ) ) ( not ( = ?auto_452171 ?auto_452175 ) ) ( not ( = ?auto_452171 ?auto_452176 ) ) ( not ( = ?auto_452171 ?auto_452177 ) ) ( not ( = ?auto_452171 ?auto_452178 ) ) ( not ( = ?auto_452171 ?auto_452179 ) ) ( not ( = ?auto_452171 ?auto_452180 ) ) ( not ( = ?auto_452171 ?auto_452181 ) ) ( not ( = ?auto_452171 ?auto_452182 ) ) ( not ( = ?auto_452172 ?auto_452173 ) ) ( not ( = ?auto_452172 ?auto_452174 ) ) ( not ( = ?auto_452172 ?auto_452175 ) ) ( not ( = ?auto_452172 ?auto_452176 ) ) ( not ( = ?auto_452172 ?auto_452177 ) ) ( not ( = ?auto_452172 ?auto_452178 ) ) ( not ( = ?auto_452172 ?auto_452179 ) ) ( not ( = ?auto_452172 ?auto_452180 ) ) ( not ( = ?auto_452172 ?auto_452181 ) ) ( not ( = ?auto_452172 ?auto_452182 ) ) ( not ( = ?auto_452173 ?auto_452174 ) ) ( not ( = ?auto_452173 ?auto_452175 ) ) ( not ( = ?auto_452173 ?auto_452176 ) ) ( not ( = ?auto_452173 ?auto_452177 ) ) ( not ( = ?auto_452173 ?auto_452178 ) ) ( not ( = ?auto_452173 ?auto_452179 ) ) ( not ( = ?auto_452173 ?auto_452180 ) ) ( not ( = ?auto_452173 ?auto_452181 ) ) ( not ( = ?auto_452173 ?auto_452182 ) ) ( not ( = ?auto_452174 ?auto_452175 ) ) ( not ( = ?auto_452174 ?auto_452176 ) ) ( not ( = ?auto_452174 ?auto_452177 ) ) ( not ( = ?auto_452174 ?auto_452178 ) ) ( not ( = ?auto_452174 ?auto_452179 ) ) ( not ( = ?auto_452174 ?auto_452180 ) ) ( not ( = ?auto_452174 ?auto_452181 ) ) ( not ( = ?auto_452174 ?auto_452182 ) ) ( not ( = ?auto_452175 ?auto_452176 ) ) ( not ( = ?auto_452175 ?auto_452177 ) ) ( not ( = ?auto_452175 ?auto_452178 ) ) ( not ( = ?auto_452175 ?auto_452179 ) ) ( not ( = ?auto_452175 ?auto_452180 ) ) ( not ( = ?auto_452175 ?auto_452181 ) ) ( not ( = ?auto_452175 ?auto_452182 ) ) ( not ( = ?auto_452176 ?auto_452177 ) ) ( not ( = ?auto_452176 ?auto_452178 ) ) ( not ( = ?auto_452176 ?auto_452179 ) ) ( not ( = ?auto_452176 ?auto_452180 ) ) ( not ( = ?auto_452176 ?auto_452181 ) ) ( not ( = ?auto_452176 ?auto_452182 ) ) ( not ( = ?auto_452177 ?auto_452178 ) ) ( not ( = ?auto_452177 ?auto_452179 ) ) ( not ( = ?auto_452177 ?auto_452180 ) ) ( not ( = ?auto_452177 ?auto_452181 ) ) ( not ( = ?auto_452177 ?auto_452182 ) ) ( not ( = ?auto_452178 ?auto_452179 ) ) ( not ( = ?auto_452178 ?auto_452180 ) ) ( not ( = ?auto_452178 ?auto_452181 ) ) ( not ( = ?auto_452178 ?auto_452182 ) ) ( not ( = ?auto_452179 ?auto_452180 ) ) ( not ( = ?auto_452179 ?auto_452181 ) ) ( not ( = ?auto_452179 ?auto_452182 ) ) ( not ( = ?auto_452180 ?auto_452181 ) ) ( not ( = ?auto_452180 ?auto_452182 ) ) ( not ( = ?auto_452181 ?auto_452182 ) ) ( ON ?auto_452180 ?auto_452181 ) ( CLEAR ?auto_452178 ) ( ON ?auto_452179 ?auto_452180 ) ( CLEAR ?auto_452179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_452169 ?auto_452170 ?auto_452171 ?auto_452172 ?auto_452173 ?auto_452174 ?auto_452175 ?auto_452176 ?auto_452177 ?auto_452178 ?auto_452179 )
      ( MAKE-13PILE ?auto_452169 ?auto_452170 ?auto_452171 ?auto_452172 ?auto_452173 ?auto_452174 ?auto_452175 ?auto_452176 ?auto_452177 ?auto_452178 ?auto_452179 ?auto_452180 ?auto_452181 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452196 - BLOCK
      ?auto_452197 - BLOCK
      ?auto_452198 - BLOCK
      ?auto_452199 - BLOCK
      ?auto_452200 - BLOCK
      ?auto_452201 - BLOCK
      ?auto_452202 - BLOCK
      ?auto_452203 - BLOCK
      ?auto_452204 - BLOCK
      ?auto_452205 - BLOCK
      ?auto_452206 - BLOCK
      ?auto_452207 - BLOCK
      ?auto_452208 - BLOCK
    )
    :vars
    (
      ?auto_452209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452208 ?auto_452209 ) ( ON-TABLE ?auto_452196 ) ( ON ?auto_452197 ?auto_452196 ) ( ON ?auto_452198 ?auto_452197 ) ( ON ?auto_452199 ?auto_452198 ) ( ON ?auto_452200 ?auto_452199 ) ( ON ?auto_452201 ?auto_452200 ) ( ON ?auto_452202 ?auto_452201 ) ( ON ?auto_452203 ?auto_452202 ) ( ON ?auto_452204 ?auto_452203 ) ( ON ?auto_452205 ?auto_452204 ) ( not ( = ?auto_452196 ?auto_452197 ) ) ( not ( = ?auto_452196 ?auto_452198 ) ) ( not ( = ?auto_452196 ?auto_452199 ) ) ( not ( = ?auto_452196 ?auto_452200 ) ) ( not ( = ?auto_452196 ?auto_452201 ) ) ( not ( = ?auto_452196 ?auto_452202 ) ) ( not ( = ?auto_452196 ?auto_452203 ) ) ( not ( = ?auto_452196 ?auto_452204 ) ) ( not ( = ?auto_452196 ?auto_452205 ) ) ( not ( = ?auto_452196 ?auto_452206 ) ) ( not ( = ?auto_452196 ?auto_452207 ) ) ( not ( = ?auto_452196 ?auto_452208 ) ) ( not ( = ?auto_452196 ?auto_452209 ) ) ( not ( = ?auto_452197 ?auto_452198 ) ) ( not ( = ?auto_452197 ?auto_452199 ) ) ( not ( = ?auto_452197 ?auto_452200 ) ) ( not ( = ?auto_452197 ?auto_452201 ) ) ( not ( = ?auto_452197 ?auto_452202 ) ) ( not ( = ?auto_452197 ?auto_452203 ) ) ( not ( = ?auto_452197 ?auto_452204 ) ) ( not ( = ?auto_452197 ?auto_452205 ) ) ( not ( = ?auto_452197 ?auto_452206 ) ) ( not ( = ?auto_452197 ?auto_452207 ) ) ( not ( = ?auto_452197 ?auto_452208 ) ) ( not ( = ?auto_452197 ?auto_452209 ) ) ( not ( = ?auto_452198 ?auto_452199 ) ) ( not ( = ?auto_452198 ?auto_452200 ) ) ( not ( = ?auto_452198 ?auto_452201 ) ) ( not ( = ?auto_452198 ?auto_452202 ) ) ( not ( = ?auto_452198 ?auto_452203 ) ) ( not ( = ?auto_452198 ?auto_452204 ) ) ( not ( = ?auto_452198 ?auto_452205 ) ) ( not ( = ?auto_452198 ?auto_452206 ) ) ( not ( = ?auto_452198 ?auto_452207 ) ) ( not ( = ?auto_452198 ?auto_452208 ) ) ( not ( = ?auto_452198 ?auto_452209 ) ) ( not ( = ?auto_452199 ?auto_452200 ) ) ( not ( = ?auto_452199 ?auto_452201 ) ) ( not ( = ?auto_452199 ?auto_452202 ) ) ( not ( = ?auto_452199 ?auto_452203 ) ) ( not ( = ?auto_452199 ?auto_452204 ) ) ( not ( = ?auto_452199 ?auto_452205 ) ) ( not ( = ?auto_452199 ?auto_452206 ) ) ( not ( = ?auto_452199 ?auto_452207 ) ) ( not ( = ?auto_452199 ?auto_452208 ) ) ( not ( = ?auto_452199 ?auto_452209 ) ) ( not ( = ?auto_452200 ?auto_452201 ) ) ( not ( = ?auto_452200 ?auto_452202 ) ) ( not ( = ?auto_452200 ?auto_452203 ) ) ( not ( = ?auto_452200 ?auto_452204 ) ) ( not ( = ?auto_452200 ?auto_452205 ) ) ( not ( = ?auto_452200 ?auto_452206 ) ) ( not ( = ?auto_452200 ?auto_452207 ) ) ( not ( = ?auto_452200 ?auto_452208 ) ) ( not ( = ?auto_452200 ?auto_452209 ) ) ( not ( = ?auto_452201 ?auto_452202 ) ) ( not ( = ?auto_452201 ?auto_452203 ) ) ( not ( = ?auto_452201 ?auto_452204 ) ) ( not ( = ?auto_452201 ?auto_452205 ) ) ( not ( = ?auto_452201 ?auto_452206 ) ) ( not ( = ?auto_452201 ?auto_452207 ) ) ( not ( = ?auto_452201 ?auto_452208 ) ) ( not ( = ?auto_452201 ?auto_452209 ) ) ( not ( = ?auto_452202 ?auto_452203 ) ) ( not ( = ?auto_452202 ?auto_452204 ) ) ( not ( = ?auto_452202 ?auto_452205 ) ) ( not ( = ?auto_452202 ?auto_452206 ) ) ( not ( = ?auto_452202 ?auto_452207 ) ) ( not ( = ?auto_452202 ?auto_452208 ) ) ( not ( = ?auto_452202 ?auto_452209 ) ) ( not ( = ?auto_452203 ?auto_452204 ) ) ( not ( = ?auto_452203 ?auto_452205 ) ) ( not ( = ?auto_452203 ?auto_452206 ) ) ( not ( = ?auto_452203 ?auto_452207 ) ) ( not ( = ?auto_452203 ?auto_452208 ) ) ( not ( = ?auto_452203 ?auto_452209 ) ) ( not ( = ?auto_452204 ?auto_452205 ) ) ( not ( = ?auto_452204 ?auto_452206 ) ) ( not ( = ?auto_452204 ?auto_452207 ) ) ( not ( = ?auto_452204 ?auto_452208 ) ) ( not ( = ?auto_452204 ?auto_452209 ) ) ( not ( = ?auto_452205 ?auto_452206 ) ) ( not ( = ?auto_452205 ?auto_452207 ) ) ( not ( = ?auto_452205 ?auto_452208 ) ) ( not ( = ?auto_452205 ?auto_452209 ) ) ( not ( = ?auto_452206 ?auto_452207 ) ) ( not ( = ?auto_452206 ?auto_452208 ) ) ( not ( = ?auto_452206 ?auto_452209 ) ) ( not ( = ?auto_452207 ?auto_452208 ) ) ( not ( = ?auto_452207 ?auto_452209 ) ) ( not ( = ?auto_452208 ?auto_452209 ) ) ( ON ?auto_452207 ?auto_452208 ) ( CLEAR ?auto_452205 ) ( ON ?auto_452206 ?auto_452207 ) ( CLEAR ?auto_452206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_452196 ?auto_452197 ?auto_452198 ?auto_452199 ?auto_452200 ?auto_452201 ?auto_452202 ?auto_452203 ?auto_452204 ?auto_452205 ?auto_452206 )
      ( MAKE-13PILE ?auto_452196 ?auto_452197 ?auto_452198 ?auto_452199 ?auto_452200 ?auto_452201 ?auto_452202 ?auto_452203 ?auto_452204 ?auto_452205 ?auto_452206 ?auto_452207 ?auto_452208 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452223 - BLOCK
      ?auto_452224 - BLOCK
      ?auto_452225 - BLOCK
      ?auto_452226 - BLOCK
      ?auto_452227 - BLOCK
      ?auto_452228 - BLOCK
      ?auto_452229 - BLOCK
      ?auto_452230 - BLOCK
      ?auto_452231 - BLOCK
      ?auto_452232 - BLOCK
      ?auto_452233 - BLOCK
      ?auto_452234 - BLOCK
      ?auto_452235 - BLOCK
    )
    :vars
    (
      ?auto_452236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452235 ?auto_452236 ) ( ON-TABLE ?auto_452223 ) ( ON ?auto_452224 ?auto_452223 ) ( ON ?auto_452225 ?auto_452224 ) ( ON ?auto_452226 ?auto_452225 ) ( ON ?auto_452227 ?auto_452226 ) ( ON ?auto_452228 ?auto_452227 ) ( ON ?auto_452229 ?auto_452228 ) ( ON ?auto_452230 ?auto_452229 ) ( ON ?auto_452231 ?auto_452230 ) ( not ( = ?auto_452223 ?auto_452224 ) ) ( not ( = ?auto_452223 ?auto_452225 ) ) ( not ( = ?auto_452223 ?auto_452226 ) ) ( not ( = ?auto_452223 ?auto_452227 ) ) ( not ( = ?auto_452223 ?auto_452228 ) ) ( not ( = ?auto_452223 ?auto_452229 ) ) ( not ( = ?auto_452223 ?auto_452230 ) ) ( not ( = ?auto_452223 ?auto_452231 ) ) ( not ( = ?auto_452223 ?auto_452232 ) ) ( not ( = ?auto_452223 ?auto_452233 ) ) ( not ( = ?auto_452223 ?auto_452234 ) ) ( not ( = ?auto_452223 ?auto_452235 ) ) ( not ( = ?auto_452223 ?auto_452236 ) ) ( not ( = ?auto_452224 ?auto_452225 ) ) ( not ( = ?auto_452224 ?auto_452226 ) ) ( not ( = ?auto_452224 ?auto_452227 ) ) ( not ( = ?auto_452224 ?auto_452228 ) ) ( not ( = ?auto_452224 ?auto_452229 ) ) ( not ( = ?auto_452224 ?auto_452230 ) ) ( not ( = ?auto_452224 ?auto_452231 ) ) ( not ( = ?auto_452224 ?auto_452232 ) ) ( not ( = ?auto_452224 ?auto_452233 ) ) ( not ( = ?auto_452224 ?auto_452234 ) ) ( not ( = ?auto_452224 ?auto_452235 ) ) ( not ( = ?auto_452224 ?auto_452236 ) ) ( not ( = ?auto_452225 ?auto_452226 ) ) ( not ( = ?auto_452225 ?auto_452227 ) ) ( not ( = ?auto_452225 ?auto_452228 ) ) ( not ( = ?auto_452225 ?auto_452229 ) ) ( not ( = ?auto_452225 ?auto_452230 ) ) ( not ( = ?auto_452225 ?auto_452231 ) ) ( not ( = ?auto_452225 ?auto_452232 ) ) ( not ( = ?auto_452225 ?auto_452233 ) ) ( not ( = ?auto_452225 ?auto_452234 ) ) ( not ( = ?auto_452225 ?auto_452235 ) ) ( not ( = ?auto_452225 ?auto_452236 ) ) ( not ( = ?auto_452226 ?auto_452227 ) ) ( not ( = ?auto_452226 ?auto_452228 ) ) ( not ( = ?auto_452226 ?auto_452229 ) ) ( not ( = ?auto_452226 ?auto_452230 ) ) ( not ( = ?auto_452226 ?auto_452231 ) ) ( not ( = ?auto_452226 ?auto_452232 ) ) ( not ( = ?auto_452226 ?auto_452233 ) ) ( not ( = ?auto_452226 ?auto_452234 ) ) ( not ( = ?auto_452226 ?auto_452235 ) ) ( not ( = ?auto_452226 ?auto_452236 ) ) ( not ( = ?auto_452227 ?auto_452228 ) ) ( not ( = ?auto_452227 ?auto_452229 ) ) ( not ( = ?auto_452227 ?auto_452230 ) ) ( not ( = ?auto_452227 ?auto_452231 ) ) ( not ( = ?auto_452227 ?auto_452232 ) ) ( not ( = ?auto_452227 ?auto_452233 ) ) ( not ( = ?auto_452227 ?auto_452234 ) ) ( not ( = ?auto_452227 ?auto_452235 ) ) ( not ( = ?auto_452227 ?auto_452236 ) ) ( not ( = ?auto_452228 ?auto_452229 ) ) ( not ( = ?auto_452228 ?auto_452230 ) ) ( not ( = ?auto_452228 ?auto_452231 ) ) ( not ( = ?auto_452228 ?auto_452232 ) ) ( not ( = ?auto_452228 ?auto_452233 ) ) ( not ( = ?auto_452228 ?auto_452234 ) ) ( not ( = ?auto_452228 ?auto_452235 ) ) ( not ( = ?auto_452228 ?auto_452236 ) ) ( not ( = ?auto_452229 ?auto_452230 ) ) ( not ( = ?auto_452229 ?auto_452231 ) ) ( not ( = ?auto_452229 ?auto_452232 ) ) ( not ( = ?auto_452229 ?auto_452233 ) ) ( not ( = ?auto_452229 ?auto_452234 ) ) ( not ( = ?auto_452229 ?auto_452235 ) ) ( not ( = ?auto_452229 ?auto_452236 ) ) ( not ( = ?auto_452230 ?auto_452231 ) ) ( not ( = ?auto_452230 ?auto_452232 ) ) ( not ( = ?auto_452230 ?auto_452233 ) ) ( not ( = ?auto_452230 ?auto_452234 ) ) ( not ( = ?auto_452230 ?auto_452235 ) ) ( not ( = ?auto_452230 ?auto_452236 ) ) ( not ( = ?auto_452231 ?auto_452232 ) ) ( not ( = ?auto_452231 ?auto_452233 ) ) ( not ( = ?auto_452231 ?auto_452234 ) ) ( not ( = ?auto_452231 ?auto_452235 ) ) ( not ( = ?auto_452231 ?auto_452236 ) ) ( not ( = ?auto_452232 ?auto_452233 ) ) ( not ( = ?auto_452232 ?auto_452234 ) ) ( not ( = ?auto_452232 ?auto_452235 ) ) ( not ( = ?auto_452232 ?auto_452236 ) ) ( not ( = ?auto_452233 ?auto_452234 ) ) ( not ( = ?auto_452233 ?auto_452235 ) ) ( not ( = ?auto_452233 ?auto_452236 ) ) ( not ( = ?auto_452234 ?auto_452235 ) ) ( not ( = ?auto_452234 ?auto_452236 ) ) ( not ( = ?auto_452235 ?auto_452236 ) ) ( ON ?auto_452234 ?auto_452235 ) ( ON ?auto_452233 ?auto_452234 ) ( CLEAR ?auto_452231 ) ( ON ?auto_452232 ?auto_452233 ) ( CLEAR ?auto_452232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_452223 ?auto_452224 ?auto_452225 ?auto_452226 ?auto_452227 ?auto_452228 ?auto_452229 ?auto_452230 ?auto_452231 ?auto_452232 )
      ( MAKE-13PILE ?auto_452223 ?auto_452224 ?auto_452225 ?auto_452226 ?auto_452227 ?auto_452228 ?auto_452229 ?auto_452230 ?auto_452231 ?auto_452232 ?auto_452233 ?auto_452234 ?auto_452235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452250 - BLOCK
      ?auto_452251 - BLOCK
      ?auto_452252 - BLOCK
      ?auto_452253 - BLOCK
      ?auto_452254 - BLOCK
      ?auto_452255 - BLOCK
      ?auto_452256 - BLOCK
      ?auto_452257 - BLOCK
      ?auto_452258 - BLOCK
      ?auto_452259 - BLOCK
      ?auto_452260 - BLOCK
      ?auto_452261 - BLOCK
      ?auto_452262 - BLOCK
    )
    :vars
    (
      ?auto_452263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452262 ?auto_452263 ) ( ON-TABLE ?auto_452250 ) ( ON ?auto_452251 ?auto_452250 ) ( ON ?auto_452252 ?auto_452251 ) ( ON ?auto_452253 ?auto_452252 ) ( ON ?auto_452254 ?auto_452253 ) ( ON ?auto_452255 ?auto_452254 ) ( ON ?auto_452256 ?auto_452255 ) ( ON ?auto_452257 ?auto_452256 ) ( ON ?auto_452258 ?auto_452257 ) ( not ( = ?auto_452250 ?auto_452251 ) ) ( not ( = ?auto_452250 ?auto_452252 ) ) ( not ( = ?auto_452250 ?auto_452253 ) ) ( not ( = ?auto_452250 ?auto_452254 ) ) ( not ( = ?auto_452250 ?auto_452255 ) ) ( not ( = ?auto_452250 ?auto_452256 ) ) ( not ( = ?auto_452250 ?auto_452257 ) ) ( not ( = ?auto_452250 ?auto_452258 ) ) ( not ( = ?auto_452250 ?auto_452259 ) ) ( not ( = ?auto_452250 ?auto_452260 ) ) ( not ( = ?auto_452250 ?auto_452261 ) ) ( not ( = ?auto_452250 ?auto_452262 ) ) ( not ( = ?auto_452250 ?auto_452263 ) ) ( not ( = ?auto_452251 ?auto_452252 ) ) ( not ( = ?auto_452251 ?auto_452253 ) ) ( not ( = ?auto_452251 ?auto_452254 ) ) ( not ( = ?auto_452251 ?auto_452255 ) ) ( not ( = ?auto_452251 ?auto_452256 ) ) ( not ( = ?auto_452251 ?auto_452257 ) ) ( not ( = ?auto_452251 ?auto_452258 ) ) ( not ( = ?auto_452251 ?auto_452259 ) ) ( not ( = ?auto_452251 ?auto_452260 ) ) ( not ( = ?auto_452251 ?auto_452261 ) ) ( not ( = ?auto_452251 ?auto_452262 ) ) ( not ( = ?auto_452251 ?auto_452263 ) ) ( not ( = ?auto_452252 ?auto_452253 ) ) ( not ( = ?auto_452252 ?auto_452254 ) ) ( not ( = ?auto_452252 ?auto_452255 ) ) ( not ( = ?auto_452252 ?auto_452256 ) ) ( not ( = ?auto_452252 ?auto_452257 ) ) ( not ( = ?auto_452252 ?auto_452258 ) ) ( not ( = ?auto_452252 ?auto_452259 ) ) ( not ( = ?auto_452252 ?auto_452260 ) ) ( not ( = ?auto_452252 ?auto_452261 ) ) ( not ( = ?auto_452252 ?auto_452262 ) ) ( not ( = ?auto_452252 ?auto_452263 ) ) ( not ( = ?auto_452253 ?auto_452254 ) ) ( not ( = ?auto_452253 ?auto_452255 ) ) ( not ( = ?auto_452253 ?auto_452256 ) ) ( not ( = ?auto_452253 ?auto_452257 ) ) ( not ( = ?auto_452253 ?auto_452258 ) ) ( not ( = ?auto_452253 ?auto_452259 ) ) ( not ( = ?auto_452253 ?auto_452260 ) ) ( not ( = ?auto_452253 ?auto_452261 ) ) ( not ( = ?auto_452253 ?auto_452262 ) ) ( not ( = ?auto_452253 ?auto_452263 ) ) ( not ( = ?auto_452254 ?auto_452255 ) ) ( not ( = ?auto_452254 ?auto_452256 ) ) ( not ( = ?auto_452254 ?auto_452257 ) ) ( not ( = ?auto_452254 ?auto_452258 ) ) ( not ( = ?auto_452254 ?auto_452259 ) ) ( not ( = ?auto_452254 ?auto_452260 ) ) ( not ( = ?auto_452254 ?auto_452261 ) ) ( not ( = ?auto_452254 ?auto_452262 ) ) ( not ( = ?auto_452254 ?auto_452263 ) ) ( not ( = ?auto_452255 ?auto_452256 ) ) ( not ( = ?auto_452255 ?auto_452257 ) ) ( not ( = ?auto_452255 ?auto_452258 ) ) ( not ( = ?auto_452255 ?auto_452259 ) ) ( not ( = ?auto_452255 ?auto_452260 ) ) ( not ( = ?auto_452255 ?auto_452261 ) ) ( not ( = ?auto_452255 ?auto_452262 ) ) ( not ( = ?auto_452255 ?auto_452263 ) ) ( not ( = ?auto_452256 ?auto_452257 ) ) ( not ( = ?auto_452256 ?auto_452258 ) ) ( not ( = ?auto_452256 ?auto_452259 ) ) ( not ( = ?auto_452256 ?auto_452260 ) ) ( not ( = ?auto_452256 ?auto_452261 ) ) ( not ( = ?auto_452256 ?auto_452262 ) ) ( not ( = ?auto_452256 ?auto_452263 ) ) ( not ( = ?auto_452257 ?auto_452258 ) ) ( not ( = ?auto_452257 ?auto_452259 ) ) ( not ( = ?auto_452257 ?auto_452260 ) ) ( not ( = ?auto_452257 ?auto_452261 ) ) ( not ( = ?auto_452257 ?auto_452262 ) ) ( not ( = ?auto_452257 ?auto_452263 ) ) ( not ( = ?auto_452258 ?auto_452259 ) ) ( not ( = ?auto_452258 ?auto_452260 ) ) ( not ( = ?auto_452258 ?auto_452261 ) ) ( not ( = ?auto_452258 ?auto_452262 ) ) ( not ( = ?auto_452258 ?auto_452263 ) ) ( not ( = ?auto_452259 ?auto_452260 ) ) ( not ( = ?auto_452259 ?auto_452261 ) ) ( not ( = ?auto_452259 ?auto_452262 ) ) ( not ( = ?auto_452259 ?auto_452263 ) ) ( not ( = ?auto_452260 ?auto_452261 ) ) ( not ( = ?auto_452260 ?auto_452262 ) ) ( not ( = ?auto_452260 ?auto_452263 ) ) ( not ( = ?auto_452261 ?auto_452262 ) ) ( not ( = ?auto_452261 ?auto_452263 ) ) ( not ( = ?auto_452262 ?auto_452263 ) ) ( ON ?auto_452261 ?auto_452262 ) ( ON ?auto_452260 ?auto_452261 ) ( CLEAR ?auto_452258 ) ( ON ?auto_452259 ?auto_452260 ) ( CLEAR ?auto_452259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_452250 ?auto_452251 ?auto_452252 ?auto_452253 ?auto_452254 ?auto_452255 ?auto_452256 ?auto_452257 ?auto_452258 ?auto_452259 )
      ( MAKE-13PILE ?auto_452250 ?auto_452251 ?auto_452252 ?auto_452253 ?auto_452254 ?auto_452255 ?auto_452256 ?auto_452257 ?auto_452258 ?auto_452259 ?auto_452260 ?auto_452261 ?auto_452262 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452277 - BLOCK
      ?auto_452278 - BLOCK
      ?auto_452279 - BLOCK
      ?auto_452280 - BLOCK
      ?auto_452281 - BLOCK
      ?auto_452282 - BLOCK
      ?auto_452283 - BLOCK
      ?auto_452284 - BLOCK
      ?auto_452285 - BLOCK
      ?auto_452286 - BLOCK
      ?auto_452287 - BLOCK
      ?auto_452288 - BLOCK
      ?auto_452289 - BLOCK
    )
    :vars
    (
      ?auto_452290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452289 ?auto_452290 ) ( ON-TABLE ?auto_452277 ) ( ON ?auto_452278 ?auto_452277 ) ( ON ?auto_452279 ?auto_452278 ) ( ON ?auto_452280 ?auto_452279 ) ( ON ?auto_452281 ?auto_452280 ) ( ON ?auto_452282 ?auto_452281 ) ( ON ?auto_452283 ?auto_452282 ) ( ON ?auto_452284 ?auto_452283 ) ( not ( = ?auto_452277 ?auto_452278 ) ) ( not ( = ?auto_452277 ?auto_452279 ) ) ( not ( = ?auto_452277 ?auto_452280 ) ) ( not ( = ?auto_452277 ?auto_452281 ) ) ( not ( = ?auto_452277 ?auto_452282 ) ) ( not ( = ?auto_452277 ?auto_452283 ) ) ( not ( = ?auto_452277 ?auto_452284 ) ) ( not ( = ?auto_452277 ?auto_452285 ) ) ( not ( = ?auto_452277 ?auto_452286 ) ) ( not ( = ?auto_452277 ?auto_452287 ) ) ( not ( = ?auto_452277 ?auto_452288 ) ) ( not ( = ?auto_452277 ?auto_452289 ) ) ( not ( = ?auto_452277 ?auto_452290 ) ) ( not ( = ?auto_452278 ?auto_452279 ) ) ( not ( = ?auto_452278 ?auto_452280 ) ) ( not ( = ?auto_452278 ?auto_452281 ) ) ( not ( = ?auto_452278 ?auto_452282 ) ) ( not ( = ?auto_452278 ?auto_452283 ) ) ( not ( = ?auto_452278 ?auto_452284 ) ) ( not ( = ?auto_452278 ?auto_452285 ) ) ( not ( = ?auto_452278 ?auto_452286 ) ) ( not ( = ?auto_452278 ?auto_452287 ) ) ( not ( = ?auto_452278 ?auto_452288 ) ) ( not ( = ?auto_452278 ?auto_452289 ) ) ( not ( = ?auto_452278 ?auto_452290 ) ) ( not ( = ?auto_452279 ?auto_452280 ) ) ( not ( = ?auto_452279 ?auto_452281 ) ) ( not ( = ?auto_452279 ?auto_452282 ) ) ( not ( = ?auto_452279 ?auto_452283 ) ) ( not ( = ?auto_452279 ?auto_452284 ) ) ( not ( = ?auto_452279 ?auto_452285 ) ) ( not ( = ?auto_452279 ?auto_452286 ) ) ( not ( = ?auto_452279 ?auto_452287 ) ) ( not ( = ?auto_452279 ?auto_452288 ) ) ( not ( = ?auto_452279 ?auto_452289 ) ) ( not ( = ?auto_452279 ?auto_452290 ) ) ( not ( = ?auto_452280 ?auto_452281 ) ) ( not ( = ?auto_452280 ?auto_452282 ) ) ( not ( = ?auto_452280 ?auto_452283 ) ) ( not ( = ?auto_452280 ?auto_452284 ) ) ( not ( = ?auto_452280 ?auto_452285 ) ) ( not ( = ?auto_452280 ?auto_452286 ) ) ( not ( = ?auto_452280 ?auto_452287 ) ) ( not ( = ?auto_452280 ?auto_452288 ) ) ( not ( = ?auto_452280 ?auto_452289 ) ) ( not ( = ?auto_452280 ?auto_452290 ) ) ( not ( = ?auto_452281 ?auto_452282 ) ) ( not ( = ?auto_452281 ?auto_452283 ) ) ( not ( = ?auto_452281 ?auto_452284 ) ) ( not ( = ?auto_452281 ?auto_452285 ) ) ( not ( = ?auto_452281 ?auto_452286 ) ) ( not ( = ?auto_452281 ?auto_452287 ) ) ( not ( = ?auto_452281 ?auto_452288 ) ) ( not ( = ?auto_452281 ?auto_452289 ) ) ( not ( = ?auto_452281 ?auto_452290 ) ) ( not ( = ?auto_452282 ?auto_452283 ) ) ( not ( = ?auto_452282 ?auto_452284 ) ) ( not ( = ?auto_452282 ?auto_452285 ) ) ( not ( = ?auto_452282 ?auto_452286 ) ) ( not ( = ?auto_452282 ?auto_452287 ) ) ( not ( = ?auto_452282 ?auto_452288 ) ) ( not ( = ?auto_452282 ?auto_452289 ) ) ( not ( = ?auto_452282 ?auto_452290 ) ) ( not ( = ?auto_452283 ?auto_452284 ) ) ( not ( = ?auto_452283 ?auto_452285 ) ) ( not ( = ?auto_452283 ?auto_452286 ) ) ( not ( = ?auto_452283 ?auto_452287 ) ) ( not ( = ?auto_452283 ?auto_452288 ) ) ( not ( = ?auto_452283 ?auto_452289 ) ) ( not ( = ?auto_452283 ?auto_452290 ) ) ( not ( = ?auto_452284 ?auto_452285 ) ) ( not ( = ?auto_452284 ?auto_452286 ) ) ( not ( = ?auto_452284 ?auto_452287 ) ) ( not ( = ?auto_452284 ?auto_452288 ) ) ( not ( = ?auto_452284 ?auto_452289 ) ) ( not ( = ?auto_452284 ?auto_452290 ) ) ( not ( = ?auto_452285 ?auto_452286 ) ) ( not ( = ?auto_452285 ?auto_452287 ) ) ( not ( = ?auto_452285 ?auto_452288 ) ) ( not ( = ?auto_452285 ?auto_452289 ) ) ( not ( = ?auto_452285 ?auto_452290 ) ) ( not ( = ?auto_452286 ?auto_452287 ) ) ( not ( = ?auto_452286 ?auto_452288 ) ) ( not ( = ?auto_452286 ?auto_452289 ) ) ( not ( = ?auto_452286 ?auto_452290 ) ) ( not ( = ?auto_452287 ?auto_452288 ) ) ( not ( = ?auto_452287 ?auto_452289 ) ) ( not ( = ?auto_452287 ?auto_452290 ) ) ( not ( = ?auto_452288 ?auto_452289 ) ) ( not ( = ?auto_452288 ?auto_452290 ) ) ( not ( = ?auto_452289 ?auto_452290 ) ) ( ON ?auto_452288 ?auto_452289 ) ( ON ?auto_452287 ?auto_452288 ) ( ON ?auto_452286 ?auto_452287 ) ( CLEAR ?auto_452284 ) ( ON ?auto_452285 ?auto_452286 ) ( CLEAR ?auto_452285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_452277 ?auto_452278 ?auto_452279 ?auto_452280 ?auto_452281 ?auto_452282 ?auto_452283 ?auto_452284 ?auto_452285 )
      ( MAKE-13PILE ?auto_452277 ?auto_452278 ?auto_452279 ?auto_452280 ?auto_452281 ?auto_452282 ?auto_452283 ?auto_452284 ?auto_452285 ?auto_452286 ?auto_452287 ?auto_452288 ?auto_452289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452304 - BLOCK
      ?auto_452305 - BLOCK
      ?auto_452306 - BLOCK
      ?auto_452307 - BLOCK
      ?auto_452308 - BLOCK
      ?auto_452309 - BLOCK
      ?auto_452310 - BLOCK
      ?auto_452311 - BLOCK
      ?auto_452312 - BLOCK
      ?auto_452313 - BLOCK
      ?auto_452314 - BLOCK
      ?auto_452315 - BLOCK
      ?auto_452316 - BLOCK
    )
    :vars
    (
      ?auto_452317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452316 ?auto_452317 ) ( ON-TABLE ?auto_452304 ) ( ON ?auto_452305 ?auto_452304 ) ( ON ?auto_452306 ?auto_452305 ) ( ON ?auto_452307 ?auto_452306 ) ( ON ?auto_452308 ?auto_452307 ) ( ON ?auto_452309 ?auto_452308 ) ( ON ?auto_452310 ?auto_452309 ) ( ON ?auto_452311 ?auto_452310 ) ( not ( = ?auto_452304 ?auto_452305 ) ) ( not ( = ?auto_452304 ?auto_452306 ) ) ( not ( = ?auto_452304 ?auto_452307 ) ) ( not ( = ?auto_452304 ?auto_452308 ) ) ( not ( = ?auto_452304 ?auto_452309 ) ) ( not ( = ?auto_452304 ?auto_452310 ) ) ( not ( = ?auto_452304 ?auto_452311 ) ) ( not ( = ?auto_452304 ?auto_452312 ) ) ( not ( = ?auto_452304 ?auto_452313 ) ) ( not ( = ?auto_452304 ?auto_452314 ) ) ( not ( = ?auto_452304 ?auto_452315 ) ) ( not ( = ?auto_452304 ?auto_452316 ) ) ( not ( = ?auto_452304 ?auto_452317 ) ) ( not ( = ?auto_452305 ?auto_452306 ) ) ( not ( = ?auto_452305 ?auto_452307 ) ) ( not ( = ?auto_452305 ?auto_452308 ) ) ( not ( = ?auto_452305 ?auto_452309 ) ) ( not ( = ?auto_452305 ?auto_452310 ) ) ( not ( = ?auto_452305 ?auto_452311 ) ) ( not ( = ?auto_452305 ?auto_452312 ) ) ( not ( = ?auto_452305 ?auto_452313 ) ) ( not ( = ?auto_452305 ?auto_452314 ) ) ( not ( = ?auto_452305 ?auto_452315 ) ) ( not ( = ?auto_452305 ?auto_452316 ) ) ( not ( = ?auto_452305 ?auto_452317 ) ) ( not ( = ?auto_452306 ?auto_452307 ) ) ( not ( = ?auto_452306 ?auto_452308 ) ) ( not ( = ?auto_452306 ?auto_452309 ) ) ( not ( = ?auto_452306 ?auto_452310 ) ) ( not ( = ?auto_452306 ?auto_452311 ) ) ( not ( = ?auto_452306 ?auto_452312 ) ) ( not ( = ?auto_452306 ?auto_452313 ) ) ( not ( = ?auto_452306 ?auto_452314 ) ) ( not ( = ?auto_452306 ?auto_452315 ) ) ( not ( = ?auto_452306 ?auto_452316 ) ) ( not ( = ?auto_452306 ?auto_452317 ) ) ( not ( = ?auto_452307 ?auto_452308 ) ) ( not ( = ?auto_452307 ?auto_452309 ) ) ( not ( = ?auto_452307 ?auto_452310 ) ) ( not ( = ?auto_452307 ?auto_452311 ) ) ( not ( = ?auto_452307 ?auto_452312 ) ) ( not ( = ?auto_452307 ?auto_452313 ) ) ( not ( = ?auto_452307 ?auto_452314 ) ) ( not ( = ?auto_452307 ?auto_452315 ) ) ( not ( = ?auto_452307 ?auto_452316 ) ) ( not ( = ?auto_452307 ?auto_452317 ) ) ( not ( = ?auto_452308 ?auto_452309 ) ) ( not ( = ?auto_452308 ?auto_452310 ) ) ( not ( = ?auto_452308 ?auto_452311 ) ) ( not ( = ?auto_452308 ?auto_452312 ) ) ( not ( = ?auto_452308 ?auto_452313 ) ) ( not ( = ?auto_452308 ?auto_452314 ) ) ( not ( = ?auto_452308 ?auto_452315 ) ) ( not ( = ?auto_452308 ?auto_452316 ) ) ( not ( = ?auto_452308 ?auto_452317 ) ) ( not ( = ?auto_452309 ?auto_452310 ) ) ( not ( = ?auto_452309 ?auto_452311 ) ) ( not ( = ?auto_452309 ?auto_452312 ) ) ( not ( = ?auto_452309 ?auto_452313 ) ) ( not ( = ?auto_452309 ?auto_452314 ) ) ( not ( = ?auto_452309 ?auto_452315 ) ) ( not ( = ?auto_452309 ?auto_452316 ) ) ( not ( = ?auto_452309 ?auto_452317 ) ) ( not ( = ?auto_452310 ?auto_452311 ) ) ( not ( = ?auto_452310 ?auto_452312 ) ) ( not ( = ?auto_452310 ?auto_452313 ) ) ( not ( = ?auto_452310 ?auto_452314 ) ) ( not ( = ?auto_452310 ?auto_452315 ) ) ( not ( = ?auto_452310 ?auto_452316 ) ) ( not ( = ?auto_452310 ?auto_452317 ) ) ( not ( = ?auto_452311 ?auto_452312 ) ) ( not ( = ?auto_452311 ?auto_452313 ) ) ( not ( = ?auto_452311 ?auto_452314 ) ) ( not ( = ?auto_452311 ?auto_452315 ) ) ( not ( = ?auto_452311 ?auto_452316 ) ) ( not ( = ?auto_452311 ?auto_452317 ) ) ( not ( = ?auto_452312 ?auto_452313 ) ) ( not ( = ?auto_452312 ?auto_452314 ) ) ( not ( = ?auto_452312 ?auto_452315 ) ) ( not ( = ?auto_452312 ?auto_452316 ) ) ( not ( = ?auto_452312 ?auto_452317 ) ) ( not ( = ?auto_452313 ?auto_452314 ) ) ( not ( = ?auto_452313 ?auto_452315 ) ) ( not ( = ?auto_452313 ?auto_452316 ) ) ( not ( = ?auto_452313 ?auto_452317 ) ) ( not ( = ?auto_452314 ?auto_452315 ) ) ( not ( = ?auto_452314 ?auto_452316 ) ) ( not ( = ?auto_452314 ?auto_452317 ) ) ( not ( = ?auto_452315 ?auto_452316 ) ) ( not ( = ?auto_452315 ?auto_452317 ) ) ( not ( = ?auto_452316 ?auto_452317 ) ) ( ON ?auto_452315 ?auto_452316 ) ( ON ?auto_452314 ?auto_452315 ) ( ON ?auto_452313 ?auto_452314 ) ( CLEAR ?auto_452311 ) ( ON ?auto_452312 ?auto_452313 ) ( CLEAR ?auto_452312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_452304 ?auto_452305 ?auto_452306 ?auto_452307 ?auto_452308 ?auto_452309 ?auto_452310 ?auto_452311 ?auto_452312 )
      ( MAKE-13PILE ?auto_452304 ?auto_452305 ?auto_452306 ?auto_452307 ?auto_452308 ?auto_452309 ?auto_452310 ?auto_452311 ?auto_452312 ?auto_452313 ?auto_452314 ?auto_452315 ?auto_452316 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452331 - BLOCK
      ?auto_452332 - BLOCK
      ?auto_452333 - BLOCK
      ?auto_452334 - BLOCK
      ?auto_452335 - BLOCK
      ?auto_452336 - BLOCK
      ?auto_452337 - BLOCK
      ?auto_452338 - BLOCK
      ?auto_452339 - BLOCK
      ?auto_452340 - BLOCK
      ?auto_452341 - BLOCK
      ?auto_452342 - BLOCK
      ?auto_452343 - BLOCK
    )
    :vars
    (
      ?auto_452344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452343 ?auto_452344 ) ( ON-TABLE ?auto_452331 ) ( ON ?auto_452332 ?auto_452331 ) ( ON ?auto_452333 ?auto_452332 ) ( ON ?auto_452334 ?auto_452333 ) ( ON ?auto_452335 ?auto_452334 ) ( ON ?auto_452336 ?auto_452335 ) ( ON ?auto_452337 ?auto_452336 ) ( not ( = ?auto_452331 ?auto_452332 ) ) ( not ( = ?auto_452331 ?auto_452333 ) ) ( not ( = ?auto_452331 ?auto_452334 ) ) ( not ( = ?auto_452331 ?auto_452335 ) ) ( not ( = ?auto_452331 ?auto_452336 ) ) ( not ( = ?auto_452331 ?auto_452337 ) ) ( not ( = ?auto_452331 ?auto_452338 ) ) ( not ( = ?auto_452331 ?auto_452339 ) ) ( not ( = ?auto_452331 ?auto_452340 ) ) ( not ( = ?auto_452331 ?auto_452341 ) ) ( not ( = ?auto_452331 ?auto_452342 ) ) ( not ( = ?auto_452331 ?auto_452343 ) ) ( not ( = ?auto_452331 ?auto_452344 ) ) ( not ( = ?auto_452332 ?auto_452333 ) ) ( not ( = ?auto_452332 ?auto_452334 ) ) ( not ( = ?auto_452332 ?auto_452335 ) ) ( not ( = ?auto_452332 ?auto_452336 ) ) ( not ( = ?auto_452332 ?auto_452337 ) ) ( not ( = ?auto_452332 ?auto_452338 ) ) ( not ( = ?auto_452332 ?auto_452339 ) ) ( not ( = ?auto_452332 ?auto_452340 ) ) ( not ( = ?auto_452332 ?auto_452341 ) ) ( not ( = ?auto_452332 ?auto_452342 ) ) ( not ( = ?auto_452332 ?auto_452343 ) ) ( not ( = ?auto_452332 ?auto_452344 ) ) ( not ( = ?auto_452333 ?auto_452334 ) ) ( not ( = ?auto_452333 ?auto_452335 ) ) ( not ( = ?auto_452333 ?auto_452336 ) ) ( not ( = ?auto_452333 ?auto_452337 ) ) ( not ( = ?auto_452333 ?auto_452338 ) ) ( not ( = ?auto_452333 ?auto_452339 ) ) ( not ( = ?auto_452333 ?auto_452340 ) ) ( not ( = ?auto_452333 ?auto_452341 ) ) ( not ( = ?auto_452333 ?auto_452342 ) ) ( not ( = ?auto_452333 ?auto_452343 ) ) ( not ( = ?auto_452333 ?auto_452344 ) ) ( not ( = ?auto_452334 ?auto_452335 ) ) ( not ( = ?auto_452334 ?auto_452336 ) ) ( not ( = ?auto_452334 ?auto_452337 ) ) ( not ( = ?auto_452334 ?auto_452338 ) ) ( not ( = ?auto_452334 ?auto_452339 ) ) ( not ( = ?auto_452334 ?auto_452340 ) ) ( not ( = ?auto_452334 ?auto_452341 ) ) ( not ( = ?auto_452334 ?auto_452342 ) ) ( not ( = ?auto_452334 ?auto_452343 ) ) ( not ( = ?auto_452334 ?auto_452344 ) ) ( not ( = ?auto_452335 ?auto_452336 ) ) ( not ( = ?auto_452335 ?auto_452337 ) ) ( not ( = ?auto_452335 ?auto_452338 ) ) ( not ( = ?auto_452335 ?auto_452339 ) ) ( not ( = ?auto_452335 ?auto_452340 ) ) ( not ( = ?auto_452335 ?auto_452341 ) ) ( not ( = ?auto_452335 ?auto_452342 ) ) ( not ( = ?auto_452335 ?auto_452343 ) ) ( not ( = ?auto_452335 ?auto_452344 ) ) ( not ( = ?auto_452336 ?auto_452337 ) ) ( not ( = ?auto_452336 ?auto_452338 ) ) ( not ( = ?auto_452336 ?auto_452339 ) ) ( not ( = ?auto_452336 ?auto_452340 ) ) ( not ( = ?auto_452336 ?auto_452341 ) ) ( not ( = ?auto_452336 ?auto_452342 ) ) ( not ( = ?auto_452336 ?auto_452343 ) ) ( not ( = ?auto_452336 ?auto_452344 ) ) ( not ( = ?auto_452337 ?auto_452338 ) ) ( not ( = ?auto_452337 ?auto_452339 ) ) ( not ( = ?auto_452337 ?auto_452340 ) ) ( not ( = ?auto_452337 ?auto_452341 ) ) ( not ( = ?auto_452337 ?auto_452342 ) ) ( not ( = ?auto_452337 ?auto_452343 ) ) ( not ( = ?auto_452337 ?auto_452344 ) ) ( not ( = ?auto_452338 ?auto_452339 ) ) ( not ( = ?auto_452338 ?auto_452340 ) ) ( not ( = ?auto_452338 ?auto_452341 ) ) ( not ( = ?auto_452338 ?auto_452342 ) ) ( not ( = ?auto_452338 ?auto_452343 ) ) ( not ( = ?auto_452338 ?auto_452344 ) ) ( not ( = ?auto_452339 ?auto_452340 ) ) ( not ( = ?auto_452339 ?auto_452341 ) ) ( not ( = ?auto_452339 ?auto_452342 ) ) ( not ( = ?auto_452339 ?auto_452343 ) ) ( not ( = ?auto_452339 ?auto_452344 ) ) ( not ( = ?auto_452340 ?auto_452341 ) ) ( not ( = ?auto_452340 ?auto_452342 ) ) ( not ( = ?auto_452340 ?auto_452343 ) ) ( not ( = ?auto_452340 ?auto_452344 ) ) ( not ( = ?auto_452341 ?auto_452342 ) ) ( not ( = ?auto_452341 ?auto_452343 ) ) ( not ( = ?auto_452341 ?auto_452344 ) ) ( not ( = ?auto_452342 ?auto_452343 ) ) ( not ( = ?auto_452342 ?auto_452344 ) ) ( not ( = ?auto_452343 ?auto_452344 ) ) ( ON ?auto_452342 ?auto_452343 ) ( ON ?auto_452341 ?auto_452342 ) ( ON ?auto_452340 ?auto_452341 ) ( ON ?auto_452339 ?auto_452340 ) ( CLEAR ?auto_452337 ) ( ON ?auto_452338 ?auto_452339 ) ( CLEAR ?auto_452338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_452331 ?auto_452332 ?auto_452333 ?auto_452334 ?auto_452335 ?auto_452336 ?auto_452337 ?auto_452338 )
      ( MAKE-13PILE ?auto_452331 ?auto_452332 ?auto_452333 ?auto_452334 ?auto_452335 ?auto_452336 ?auto_452337 ?auto_452338 ?auto_452339 ?auto_452340 ?auto_452341 ?auto_452342 ?auto_452343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452358 - BLOCK
      ?auto_452359 - BLOCK
      ?auto_452360 - BLOCK
      ?auto_452361 - BLOCK
      ?auto_452362 - BLOCK
      ?auto_452363 - BLOCK
      ?auto_452364 - BLOCK
      ?auto_452365 - BLOCK
      ?auto_452366 - BLOCK
      ?auto_452367 - BLOCK
      ?auto_452368 - BLOCK
      ?auto_452369 - BLOCK
      ?auto_452370 - BLOCK
    )
    :vars
    (
      ?auto_452371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452370 ?auto_452371 ) ( ON-TABLE ?auto_452358 ) ( ON ?auto_452359 ?auto_452358 ) ( ON ?auto_452360 ?auto_452359 ) ( ON ?auto_452361 ?auto_452360 ) ( ON ?auto_452362 ?auto_452361 ) ( ON ?auto_452363 ?auto_452362 ) ( ON ?auto_452364 ?auto_452363 ) ( not ( = ?auto_452358 ?auto_452359 ) ) ( not ( = ?auto_452358 ?auto_452360 ) ) ( not ( = ?auto_452358 ?auto_452361 ) ) ( not ( = ?auto_452358 ?auto_452362 ) ) ( not ( = ?auto_452358 ?auto_452363 ) ) ( not ( = ?auto_452358 ?auto_452364 ) ) ( not ( = ?auto_452358 ?auto_452365 ) ) ( not ( = ?auto_452358 ?auto_452366 ) ) ( not ( = ?auto_452358 ?auto_452367 ) ) ( not ( = ?auto_452358 ?auto_452368 ) ) ( not ( = ?auto_452358 ?auto_452369 ) ) ( not ( = ?auto_452358 ?auto_452370 ) ) ( not ( = ?auto_452358 ?auto_452371 ) ) ( not ( = ?auto_452359 ?auto_452360 ) ) ( not ( = ?auto_452359 ?auto_452361 ) ) ( not ( = ?auto_452359 ?auto_452362 ) ) ( not ( = ?auto_452359 ?auto_452363 ) ) ( not ( = ?auto_452359 ?auto_452364 ) ) ( not ( = ?auto_452359 ?auto_452365 ) ) ( not ( = ?auto_452359 ?auto_452366 ) ) ( not ( = ?auto_452359 ?auto_452367 ) ) ( not ( = ?auto_452359 ?auto_452368 ) ) ( not ( = ?auto_452359 ?auto_452369 ) ) ( not ( = ?auto_452359 ?auto_452370 ) ) ( not ( = ?auto_452359 ?auto_452371 ) ) ( not ( = ?auto_452360 ?auto_452361 ) ) ( not ( = ?auto_452360 ?auto_452362 ) ) ( not ( = ?auto_452360 ?auto_452363 ) ) ( not ( = ?auto_452360 ?auto_452364 ) ) ( not ( = ?auto_452360 ?auto_452365 ) ) ( not ( = ?auto_452360 ?auto_452366 ) ) ( not ( = ?auto_452360 ?auto_452367 ) ) ( not ( = ?auto_452360 ?auto_452368 ) ) ( not ( = ?auto_452360 ?auto_452369 ) ) ( not ( = ?auto_452360 ?auto_452370 ) ) ( not ( = ?auto_452360 ?auto_452371 ) ) ( not ( = ?auto_452361 ?auto_452362 ) ) ( not ( = ?auto_452361 ?auto_452363 ) ) ( not ( = ?auto_452361 ?auto_452364 ) ) ( not ( = ?auto_452361 ?auto_452365 ) ) ( not ( = ?auto_452361 ?auto_452366 ) ) ( not ( = ?auto_452361 ?auto_452367 ) ) ( not ( = ?auto_452361 ?auto_452368 ) ) ( not ( = ?auto_452361 ?auto_452369 ) ) ( not ( = ?auto_452361 ?auto_452370 ) ) ( not ( = ?auto_452361 ?auto_452371 ) ) ( not ( = ?auto_452362 ?auto_452363 ) ) ( not ( = ?auto_452362 ?auto_452364 ) ) ( not ( = ?auto_452362 ?auto_452365 ) ) ( not ( = ?auto_452362 ?auto_452366 ) ) ( not ( = ?auto_452362 ?auto_452367 ) ) ( not ( = ?auto_452362 ?auto_452368 ) ) ( not ( = ?auto_452362 ?auto_452369 ) ) ( not ( = ?auto_452362 ?auto_452370 ) ) ( not ( = ?auto_452362 ?auto_452371 ) ) ( not ( = ?auto_452363 ?auto_452364 ) ) ( not ( = ?auto_452363 ?auto_452365 ) ) ( not ( = ?auto_452363 ?auto_452366 ) ) ( not ( = ?auto_452363 ?auto_452367 ) ) ( not ( = ?auto_452363 ?auto_452368 ) ) ( not ( = ?auto_452363 ?auto_452369 ) ) ( not ( = ?auto_452363 ?auto_452370 ) ) ( not ( = ?auto_452363 ?auto_452371 ) ) ( not ( = ?auto_452364 ?auto_452365 ) ) ( not ( = ?auto_452364 ?auto_452366 ) ) ( not ( = ?auto_452364 ?auto_452367 ) ) ( not ( = ?auto_452364 ?auto_452368 ) ) ( not ( = ?auto_452364 ?auto_452369 ) ) ( not ( = ?auto_452364 ?auto_452370 ) ) ( not ( = ?auto_452364 ?auto_452371 ) ) ( not ( = ?auto_452365 ?auto_452366 ) ) ( not ( = ?auto_452365 ?auto_452367 ) ) ( not ( = ?auto_452365 ?auto_452368 ) ) ( not ( = ?auto_452365 ?auto_452369 ) ) ( not ( = ?auto_452365 ?auto_452370 ) ) ( not ( = ?auto_452365 ?auto_452371 ) ) ( not ( = ?auto_452366 ?auto_452367 ) ) ( not ( = ?auto_452366 ?auto_452368 ) ) ( not ( = ?auto_452366 ?auto_452369 ) ) ( not ( = ?auto_452366 ?auto_452370 ) ) ( not ( = ?auto_452366 ?auto_452371 ) ) ( not ( = ?auto_452367 ?auto_452368 ) ) ( not ( = ?auto_452367 ?auto_452369 ) ) ( not ( = ?auto_452367 ?auto_452370 ) ) ( not ( = ?auto_452367 ?auto_452371 ) ) ( not ( = ?auto_452368 ?auto_452369 ) ) ( not ( = ?auto_452368 ?auto_452370 ) ) ( not ( = ?auto_452368 ?auto_452371 ) ) ( not ( = ?auto_452369 ?auto_452370 ) ) ( not ( = ?auto_452369 ?auto_452371 ) ) ( not ( = ?auto_452370 ?auto_452371 ) ) ( ON ?auto_452369 ?auto_452370 ) ( ON ?auto_452368 ?auto_452369 ) ( ON ?auto_452367 ?auto_452368 ) ( ON ?auto_452366 ?auto_452367 ) ( CLEAR ?auto_452364 ) ( ON ?auto_452365 ?auto_452366 ) ( CLEAR ?auto_452365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_452358 ?auto_452359 ?auto_452360 ?auto_452361 ?auto_452362 ?auto_452363 ?auto_452364 ?auto_452365 )
      ( MAKE-13PILE ?auto_452358 ?auto_452359 ?auto_452360 ?auto_452361 ?auto_452362 ?auto_452363 ?auto_452364 ?auto_452365 ?auto_452366 ?auto_452367 ?auto_452368 ?auto_452369 ?auto_452370 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452385 - BLOCK
      ?auto_452386 - BLOCK
      ?auto_452387 - BLOCK
      ?auto_452388 - BLOCK
      ?auto_452389 - BLOCK
      ?auto_452390 - BLOCK
      ?auto_452391 - BLOCK
      ?auto_452392 - BLOCK
      ?auto_452393 - BLOCK
      ?auto_452394 - BLOCK
      ?auto_452395 - BLOCK
      ?auto_452396 - BLOCK
      ?auto_452397 - BLOCK
    )
    :vars
    (
      ?auto_452398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452397 ?auto_452398 ) ( ON-TABLE ?auto_452385 ) ( ON ?auto_452386 ?auto_452385 ) ( ON ?auto_452387 ?auto_452386 ) ( ON ?auto_452388 ?auto_452387 ) ( ON ?auto_452389 ?auto_452388 ) ( ON ?auto_452390 ?auto_452389 ) ( not ( = ?auto_452385 ?auto_452386 ) ) ( not ( = ?auto_452385 ?auto_452387 ) ) ( not ( = ?auto_452385 ?auto_452388 ) ) ( not ( = ?auto_452385 ?auto_452389 ) ) ( not ( = ?auto_452385 ?auto_452390 ) ) ( not ( = ?auto_452385 ?auto_452391 ) ) ( not ( = ?auto_452385 ?auto_452392 ) ) ( not ( = ?auto_452385 ?auto_452393 ) ) ( not ( = ?auto_452385 ?auto_452394 ) ) ( not ( = ?auto_452385 ?auto_452395 ) ) ( not ( = ?auto_452385 ?auto_452396 ) ) ( not ( = ?auto_452385 ?auto_452397 ) ) ( not ( = ?auto_452385 ?auto_452398 ) ) ( not ( = ?auto_452386 ?auto_452387 ) ) ( not ( = ?auto_452386 ?auto_452388 ) ) ( not ( = ?auto_452386 ?auto_452389 ) ) ( not ( = ?auto_452386 ?auto_452390 ) ) ( not ( = ?auto_452386 ?auto_452391 ) ) ( not ( = ?auto_452386 ?auto_452392 ) ) ( not ( = ?auto_452386 ?auto_452393 ) ) ( not ( = ?auto_452386 ?auto_452394 ) ) ( not ( = ?auto_452386 ?auto_452395 ) ) ( not ( = ?auto_452386 ?auto_452396 ) ) ( not ( = ?auto_452386 ?auto_452397 ) ) ( not ( = ?auto_452386 ?auto_452398 ) ) ( not ( = ?auto_452387 ?auto_452388 ) ) ( not ( = ?auto_452387 ?auto_452389 ) ) ( not ( = ?auto_452387 ?auto_452390 ) ) ( not ( = ?auto_452387 ?auto_452391 ) ) ( not ( = ?auto_452387 ?auto_452392 ) ) ( not ( = ?auto_452387 ?auto_452393 ) ) ( not ( = ?auto_452387 ?auto_452394 ) ) ( not ( = ?auto_452387 ?auto_452395 ) ) ( not ( = ?auto_452387 ?auto_452396 ) ) ( not ( = ?auto_452387 ?auto_452397 ) ) ( not ( = ?auto_452387 ?auto_452398 ) ) ( not ( = ?auto_452388 ?auto_452389 ) ) ( not ( = ?auto_452388 ?auto_452390 ) ) ( not ( = ?auto_452388 ?auto_452391 ) ) ( not ( = ?auto_452388 ?auto_452392 ) ) ( not ( = ?auto_452388 ?auto_452393 ) ) ( not ( = ?auto_452388 ?auto_452394 ) ) ( not ( = ?auto_452388 ?auto_452395 ) ) ( not ( = ?auto_452388 ?auto_452396 ) ) ( not ( = ?auto_452388 ?auto_452397 ) ) ( not ( = ?auto_452388 ?auto_452398 ) ) ( not ( = ?auto_452389 ?auto_452390 ) ) ( not ( = ?auto_452389 ?auto_452391 ) ) ( not ( = ?auto_452389 ?auto_452392 ) ) ( not ( = ?auto_452389 ?auto_452393 ) ) ( not ( = ?auto_452389 ?auto_452394 ) ) ( not ( = ?auto_452389 ?auto_452395 ) ) ( not ( = ?auto_452389 ?auto_452396 ) ) ( not ( = ?auto_452389 ?auto_452397 ) ) ( not ( = ?auto_452389 ?auto_452398 ) ) ( not ( = ?auto_452390 ?auto_452391 ) ) ( not ( = ?auto_452390 ?auto_452392 ) ) ( not ( = ?auto_452390 ?auto_452393 ) ) ( not ( = ?auto_452390 ?auto_452394 ) ) ( not ( = ?auto_452390 ?auto_452395 ) ) ( not ( = ?auto_452390 ?auto_452396 ) ) ( not ( = ?auto_452390 ?auto_452397 ) ) ( not ( = ?auto_452390 ?auto_452398 ) ) ( not ( = ?auto_452391 ?auto_452392 ) ) ( not ( = ?auto_452391 ?auto_452393 ) ) ( not ( = ?auto_452391 ?auto_452394 ) ) ( not ( = ?auto_452391 ?auto_452395 ) ) ( not ( = ?auto_452391 ?auto_452396 ) ) ( not ( = ?auto_452391 ?auto_452397 ) ) ( not ( = ?auto_452391 ?auto_452398 ) ) ( not ( = ?auto_452392 ?auto_452393 ) ) ( not ( = ?auto_452392 ?auto_452394 ) ) ( not ( = ?auto_452392 ?auto_452395 ) ) ( not ( = ?auto_452392 ?auto_452396 ) ) ( not ( = ?auto_452392 ?auto_452397 ) ) ( not ( = ?auto_452392 ?auto_452398 ) ) ( not ( = ?auto_452393 ?auto_452394 ) ) ( not ( = ?auto_452393 ?auto_452395 ) ) ( not ( = ?auto_452393 ?auto_452396 ) ) ( not ( = ?auto_452393 ?auto_452397 ) ) ( not ( = ?auto_452393 ?auto_452398 ) ) ( not ( = ?auto_452394 ?auto_452395 ) ) ( not ( = ?auto_452394 ?auto_452396 ) ) ( not ( = ?auto_452394 ?auto_452397 ) ) ( not ( = ?auto_452394 ?auto_452398 ) ) ( not ( = ?auto_452395 ?auto_452396 ) ) ( not ( = ?auto_452395 ?auto_452397 ) ) ( not ( = ?auto_452395 ?auto_452398 ) ) ( not ( = ?auto_452396 ?auto_452397 ) ) ( not ( = ?auto_452396 ?auto_452398 ) ) ( not ( = ?auto_452397 ?auto_452398 ) ) ( ON ?auto_452396 ?auto_452397 ) ( ON ?auto_452395 ?auto_452396 ) ( ON ?auto_452394 ?auto_452395 ) ( ON ?auto_452393 ?auto_452394 ) ( ON ?auto_452392 ?auto_452393 ) ( CLEAR ?auto_452390 ) ( ON ?auto_452391 ?auto_452392 ) ( CLEAR ?auto_452391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_452385 ?auto_452386 ?auto_452387 ?auto_452388 ?auto_452389 ?auto_452390 ?auto_452391 )
      ( MAKE-13PILE ?auto_452385 ?auto_452386 ?auto_452387 ?auto_452388 ?auto_452389 ?auto_452390 ?auto_452391 ?auto_452392 ?auto_452393 ?auto_452394 ?auto_452395 ?auto_452396 ?auto_452397 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452412 - BLOCK
      ?auto_452413 - BLOCK
      ?auto_452414 - BLOCK
      ?auto_452415 - BLOCK
      ?auto_452416 - BLOCK
      ?auto_452417 - BLOCK
      ?auto_452418 - BLOCK
      ?auto_452419 - BLOCK
      ?auto_452420 - BLOCK
      ?auto_452421 - BLOCK
      ?auto_452422 - BLOCK
      ?auto_452423 - BLOCK
      ?auto_452424 - BLOCK
    )
    :vars
    (
      ?auto_452425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452424 ?auto_452425 ) ( ON-TABLE ?auto_452412 ) ( ON ?auto_452413 ?auto_452412 ) ( ON ?auto_452414 ?auto_452413 ) ( ON ?auto_452415 ?auto_452414 ) ( ON ?auto_452416 ?auto_452415 ) ( ON ?auto_452417 ?auto_452416 ) ( not ( = ?auto_452412 ?auto_452413 ) ) ( not ( = ?auto_452412 ?auto_452414 ) ) ( not ( = ?auto_452412 ?auto_452415 ) ) ( not ( = ?auto_452412 ?auto_452416 ) ) ( not ( = ?auto_452412 ?auto_452417 ) ) ( not ( = ?auto_452412 ?auto_452418 ) ) ( not ( = ?auto_452412 ?auto_452419 ) ) ( not ( = ?auto_452412 ?auto_452420 ) ) ( not ( = ?auto_452412 ?auto_452421 ) ) ( not ( = ?auto_452412 ?auto_452422 ) ) ( not ( = ?auto_452412 ?auto_452423 ) ) ( not ( = ?auto_452412 ?auto_452424 ) ) ( not ( = ?auto_452412 ?auto_452425 ) ) ( not ( = ?auto_452413 ?auto_452414 ) ) ( not ( = ?auto_452413 ?auto_452415 ) ) ( not ( = ?auto_452413 ?auto_452416 ) ) ( not ( = ?auto_452413 ?auto_452417 ) ) ( not ( = ?auto_452413 ?auto_452418 ) ) ( not ( = ?auto_452413 ?auto_452419 ) ) ( not ( = ?auto_452413 ?auto_452420 ) ) ( not ( = ?auto_452413 ?auto_452421 ) ) ( not ( = ?auto_452413 ?auto_452422 ) ) ( not ( = ?auto_452413 ?auto_452423 ) ) ( not ( = ?auto_452413 ?auto_452424 ) ) ( not ( = ?auto_452413 ?auto_452425 ) ) ( not ( = ?auto_452414 ?auto_452415 ) ) ( not ( = ?auto_452414 ?auto_452416 ) ) ( not ( = ?auto_452414 ?auto_452417 ) ) ( not ( = ?auto_452414 ?auto_452418 ) ) ( not ( = ?auto_452414 ?auto_452419 ) ) ( not ( = ?auto_452414 ?auto_452420 ) ) ( not ( = ?auto_452414 ?auto_452421 ) ) ( not ( = ?auto_452414 ?auto_452422 ) ) ( not ( = ?auto_452414 ?auto_452423 ) ) ( not ( = ?auto_452414 ?auto_452424 ) ) ( not ( = ?auto_452414 ?auto_452425 ) ) ( not ( = ?auto_452415 ?auto_452416 ) ) ( not ( = ?auto_452415 ?auto_452417 ) ) ( not ( = ?auto_452415 ?auto_452418 ) ) ( not ( = ?auto_452415 ?auto_452419 ) ) ( not ( = ?auto_452415 ?auto_452420 ) ) ( not ( = ?auto_452415 ?auto_452421 ) ) ( not ( = ?auto_452415 ?auto_452422 ) ) ( not ( = ?auto_452415 ?auto_452423 ) ) ( not ( = ?auto_452415 ?auto_452424 ) ) ( not ( = ?auto_452415 ?auto_452425 ) ) ( not ( = ?auto_452416 ?auto_452417 ) ) ( not ( = ?auto_452416 ?auto_452418 ) ) ( not ( = ?auto_452416 ?auto_452419 ) ) ( not ( = ?auto_452416 ?auto_452420 ) ) ( not ( = ?auto_452416 ?auto_452421 ) ) ( not ( = ?auto_452416 ?auto_452422 ) ) ( not ( = ?auto_452416 ?auto_452423 ) ) ( not ( = ?auto_452416 ?auto_452424 ) ) ( not ( = ?auto_452416 ?auto_452425 ) ) ( not ( = ?auto_452417 ?auto_452418 ) ) ( not ( = ?auto_452417 ?auto_452419 ) ) ( not ( = ?auto_452417 ?auto_452420 ) ) ( not ( = ?auto_452417 ?auto_452421 ) ) ( not ( = ?auto_452417 ?auto_452422 ) ) ( not ( = ?auto_452417 ?auto_452423 ) ) ( not ( = ?auto_452417 ?auto_452424 ) ) ( not ( = ?auto_452417 ?auto_452425 ) ) ( not ( = ?auto_452418 ?auto_452419 ) ) ( not ( = ?auto_452418 ?auto_452420 ) ) ( not ( = ?auto_452418 ?auto_452421 ) ) ( not ( = ?auto_452418 ?auto_452422 ) ) ( not ( = ?auto_452418 ?auto_452423 ) ) ( not ( = ?auto_452418 ?auto_452424 ) ) ( not ( = ?auto_452418 ?auto_452425 ) ) ( not ( = ?auto_452419 ?auto_452420 ) ) ( not ( = ?auto_452419 ?auto_452421 ) ) ( not ( = ?auto_452419 ?auto_452422 ) ) ( not ( = ?auto_452419 ?auto_452423 ) ) ( not ( = ?auto_452419 ?auto_452424 ) ) ( not ( = ?auto_452419 ?auto_452425 ) ) ( not ( = ?auto_452420 ?auto_452421 ) ) ( not ( = ?auto_452420 ?auto_452422 ) ) ( not ( = ?auto_452420 ?auto_452423 ) ) ( not ( = ?auto_452420 ?auto_452424 ) ) ( not ( = ?auto_452420 ?auto_452425 ) ) ( not ( = ?auto_452421 ?auto_452422 ) ) ( not ( = ?auto_452421 ?auto_452423 ) ) ( not ( = ?auto_452421 ?auto_452424 ) ) ( not ( = ?auto_452421 ?auto_452425 ) ) ( not ( = ?auto_452422 ?auto_452423 ) ) ( not ( = ?auto_452422 ?auto_452424 ) ) ( not ( = ?auto_452422 ?auto_452425 ) ) ( not ( = ?auto_452423 ?auto_452424 ) ) ( not ( = ?auto_452423 ?auto_452425 ) ) ( not ( = ?auto_452424 ?auto_452425 ) ) ( ON ?auto_452423 ?auto_452424 ) ( ON ?auto_452422 ?auto_452423 ) ( ON ?auto_452421 ?auto_452422 ) ( ON ?auto_452420 ?auto_452421 ) ( ON ?auto_452419 ?auto_452420 ) ( CLEAR ?auto_452417 ) ( ON ?auto_452418 ?auto_452419 ) ( CLEAR ?auto_452418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_452412 ?auto_452413 ?auto_452414 ?auto_452415 ?auto_452416 ?auto_452417 ?auto_452418 )
      ( MAKE-13PILE ?auto_452412 ?auto_452413 ?auto_452414 ?auto_452415 ?auto_452416 ?auto_452417 ?auto_452418 ?auto_452419 ?auto_452420 ?auto_452421 ?auto_452422 ?auto_452423 ?auto_452424 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452439 - BLOCK
      ?auto_452440 - BLOCK
      ?auto_452441 - BLOCK
      ?auto_452442 - BLOCK
      ?auto_452443 - BLOCK
      ?auto_452444 - BLOCK
      ?auto_452445 - BLOCK
      ?auto_452446 - BLOCK
      ?auto_452447 - BLOCK
      ?auto_452448 - BLOCK
      ?auto_452449 - BLOCK
      ?auto_452450 - BLOCK
      ?auto_452451 - BLOCK
    )
    :vars
    (
      ?auto_452452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452451 ?auto_452452 ) ( ON-TABLE ?auto_452439 ) ( ON ?auto_452440 ?auto_452439 ) ( ON ?auto_452441 ?auto_452440 ) ( ON ?auto_452442 ?auto_452441 ) ( ON ?auto_452443 ?auto_452442 ) ( not ( = ?auto_452439 ?auto_452440 ) ) ( not ( = ?auto_452439 ?auto_452441 ) ) ( not ( = ?auto_452439 ?auto_452442 ) ) ( not ( = ?auto_452439 ?auto_452443 ) ) ( not ( = ?auto_452439 ?auto_452444 ) ) ( not ( = ?auto_452439 ?auto_452445 ) ) ( not ( = ?auto_452439 ?auto_452446 ) ) ( not ( = ?auto_452439 ?auto_452447 ) ) ( not ( = ?auto_452439 ?auto_452448 ) ) ( not ( = ?auto_452439 ?auto_452449 ) ) ( not ( = ?auto_452439 ?auto_452450 ) ) ( not ( = ?auto_452439 ?auto_452451 ) ) ( not ( = ?auto_452439 ?auto_452452 ) ) ( not ( = ?auto_452440 ?auto_452441 ) ) ( not ( = ?auto_452440 ?auto_452442 ) ) ( not ( = ?auto_452440 ?auto_452443 ) ) ( not ( = ?auto_452440 ?auto_452444 ) ) ( not ( = ?auto_452440 ?auto_452445 ) ) ( not ( = ?auto_452440 ?auto_452446 ) ) ( not ( = ?auto_452440 ?auto_452447 ) ) ( not ( = ?auto_452440 ?auto_452448 ) ) ( not ( = ?auto_452440 ?auto_452449 ) ) ( not ( = ?auto_452440 ?auto_452450 ) ) ( not ( = ?auto_452440 ?auto_452451 ) ) ( not ( = ?auto_452440 ?auto_452452 ) ) ( not ( = ?auto_452441 ?auto_452442 ) ) ( not ( = ?auto_452441 ?auto_452443 ) ) ( not ( = ?auto_452441 ?auto_452444 ) ) ( not ( = ?auto_452441 ?auto_452445 ) ) ( not ( = ?auto_452441 ?auto_452446 ) ) ( not ( = ?auto_452441 ?auto_452447 ) ) ( not ( = ?auto_452441 ?auto_452448 ) ) ( not ( = ?auto_452441 ?auto_452449 ) ) ( not ( = ?auto_452441 ?auto_452450 ) ) ( not ( = ?auto_452441 ?auto_452451 ) ) ( not ( = ?auto_452441 ?auto_452452 ) ) ( not ( = ?auto_452442 ?auto_452443 ) ) ( not ( = ?auto_452442 ?auto_452444 ) ) ( not ( = ?auto_452442 ?auto_452445 ) ) ( not ( = ?auto_452442 ?auto_452446 ) ) ( not ( = ?auto_452442 ?auto_452447 ) ) ( not ( = ?auto_452442 ?auto_452448 ) ) ( not ( = ?auto_452442 ?auto_452449 ) ) ( not ( = ?auto_452442 ?auto_452450 ) ) ( not ( = ?auto_452442 ?auto_452451 ) ) ( not ( = ?auto_452442 ?auto_452452 ) ) ( not ( = ?auto_452443 ?auto_452444 ) ) ( not ( = ?auto_452443 ?auto_452445 ) ) ( not ( = ?auto_452443 ?auto_452446 ) ) ( not ( = ?auto_452443 ?auto_452447 ) ) ( not ( = ?auto_452443 ?auto_452448 ) ) ( not ( = ?auto_452443 ?auto_452449 ) ) ( not ( = ?auto_452443 ?auto_452450 ) ) ( not ( = ?auto_452443 ?auto_452451 ) ) ( not ( = ?auto_452443 ?auto_452452 ) ) ( not ( = ?auto_452444 ?auto_452445 ) ) ( not ( = ?auto_452444 ?auto_452446 ) ) ( not ( = ?auto_452444 ?auto_452447 ) ) ( not ( = ?auto_452444 ?auto_452448 ) ) ( not ( = ?auto_452444 ?auto_452449 ) ) ( not ( = ?auto_452444 ?auto_452450 ) ) ( not ( = ?auto_452444 ?auto_452451 ) ) ( not ( = ?auto_452444 ?auto_452452 ) ) ( not ( = ?auto_452445 ?auto_452446 ) ) ( not ( = ?auto_452445 ?auto_452447 ) ) ( not ( = ?auto_452445 ?auto_452448 ) ) ( not ( = ?auto_452445 ?auto_452449 ) ) ( not ( = ?auto_452445 ?auto_452450 ) ) ( not ( = ?auto_452445 ?auto_452451 ) ) ( not ( = ?auto_452445 ?auto_452452 ) ) ( not ( = ?auto_452446 ?auto_452447 ) ) ( not ( = ?auto_452446 ?auto_452448 ) ) ( not ( = ?auto_452446 ?auto_452449 ) ) ( not ( = ?auto_452446 ?auto_452450 ) ) ( not ( = ?auto_452446 ?auto_452451 ) ) ( not ( = ?auto_452446 ?auto_452452 ) ) ( not ( = ?auto_452447 ?auto_452448 ) ) ( not ( = ?auto_452447 ?auto_452449 ) ) ( not ( = ?auto_452447 ?auto_452450 ) ) ( not ( = ?auto_452447 ?auto_452451 ) ) ( not ( = ?auto_452447 ?auto_452452 ) ) ( not ( = ?auto_452448 ?auto_452449 ) ) ( not ( = ?auto_452448 ?auto_452450 ) ) ( not ( = ?auto_452448 ?auto_452451 ) ) ( not ( = ?auto_452448 ?auto_452452 ) ) ( not ( = ?auto_452449 ?auto_452450 ) ) ( not ( = ?auto_452449 ?auto_452451 ) ) ( not ( = ?auto_452449 ?auto_452452 ) ) ( not ( = ?auto_452450 ?auto_452451 ) ) ( not ( = ?auto_452450 ?auto_452452 ) ) ( not ( = ?auto_452451 ?auto_452452 ) ) ( ON ?auto_452450 ?auto_452451 ) ( ON ?auto_452449 ?auto_452450 ) ( ON ?auto_452448 ?auto_452449 ) ( ON ?auto_452447 ?auto_452448 ) ( ON ?auto_452446 ?auto_452447 ) ( ON ?auto_452445 ?auto_452446 ) ( CLEAR ?auto_452443 ) ( ON ?auto_452444 ?auto_452445 ) ( CLEAR ?auto_452444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_452439 ?auto_452440 ?auto_452441 ?auto_452442 ?auto_452443 ?auto_452444 )
      ( MAKE-13PILE ?auto_452439 ?auto_452440 ?auto_452441 ?auto_452442 ?auto_452443 ?auto_452444 ?auto_452445 ?auto_452446 ?auto_452447 ?auto_452448 ?auto_452449 ?auto_452450 ?auto_452451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452466 - BLOCK
      ?auto_452467 - BLOCK
      ?auto_452468 - BLOCK
      ?auto_452469 - BLOCK
      ?auto_452470 - BLOCK
      ?auto_452471 - BLOCK
      ?auto_452472 - BLOCK
      ?auto_452473 - BLOCK
      ?auto_452474 - BLOCK
      ?auto_452475 - BLOCK
      ?auto_452476 - BLOCK
      ?auto_452477 - BLOCK
      ?auto_452478 - BLOCK
    )
    :vars
    (
      ?auto_452479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452478 ?auto_452479 ) ( ON-TABLE ?auto_452466 ) ( ON ?auto_452467 ?auto_452466 ) ( ON ?auto_452468 ?auto_452467 ) ( ON ?auto_452469 ?auto_452468 ) ( ON ?auto_452470 ?auto_452469 ) ( not ( = ?auto_452466 ?auto_452467 ) ) ( not ( = ?auto_452466 ?auto_452468 ) ) ( not ( = ?auto_452466 ?auto_452469 ) ) ( not ( = ?auto_452466 ?auto_452470 ) ) ( not ( = ?auto_452466 ?auto_452471 ) ) ( not ( = ?auto_452466 ?auto_452472 ) ) ( not ( = ?auto_452466 ?auto_452473 ) ) ( not ( = ?auto_452466 ?auto_452474 ) ) ( not ( = ?auto_452466 ?auto_452475 ) ) ( not ( = ?auto_452466 ?auto_452476 ) ) ( not ( = ?auto_452466 ?auto_452477 ) ) ( not ( = ?auto_452466 ?auto_452478 ) ) ( not ( = ?auto_452466 ?auto_452479 ) ) ( not ( = ?auto_452467 ?auto_452468 ) ) ( not ( = ?auto_452467 ?auto_452469 ) ) ( not ( = ?auto_452467 ?auto_452470 ) ) ( not ( = ?auto_452467 ?auto_452471 ) ) ( not ( = ?auto_452467 ?auto_452472 ) ) ( not ( = ?auto_452467 ?auto_452473 ) ) ( not ( = ?auto_452467 ?auto_452474 ) ) ( not ( = ?auto_452467 ?auto_452475 ) ) ( not ( = ?auto_452467 ?auto_452476 ) ) ( not ( = ?auto_452467 ?auto_452477 ) ) ( not ( = ?auto_452467 ?auto_452478 ) ) ( not ( = ?auto_452467 ?auto_452479 ) ) ( not ( = ?auto_452468 ?auto_452469 ) ) ( not ( = ?auto_452468 ?auto_452470 ) ) ( not ( = ?auto_452468 ?auto_452471 ) ) ( not ( = ?auto_452468 ?auto_452472 ) ) ( not ( = ?auto_452468 ?auto_452473 ) ) ( not ( = ?auto_452468 ?auto_452474 ) ) ( not ( = ?auto_452468 ?auto_452475 ) ) ( not ( = ?auto_452468 ?auto_452476 ) ) ( not ( = ?auto_452468 ?auto_452477 ) ) ( not ( = ?auto_452468 ?auto_452478 ) ) ( not ( = ?auto_452468 ?auto_452479 ) ) ( not ( = ?auto_452469 ?auto_452470 ) ) ( not ( = ?auto_452469 ?auto_452471 ) ) ( not ( = ?auto_452469 ?auto_452472 ) ) ( not ( = ?auto_452469 ?auto_452473 ) ) ( not ( = ?auto_452469 ?auto_452474 ) ) ( not ( = ?auto_452469 ?auto_452475 ) ) ( not ( = ?auto_452469 ?auto_452476 ) ) ( not ( = ?auto_452469 ?auto_452477 ) ) ( not ( = ?auto_452469 ?auto_452478 ) ) ( not ( = ?auto_452469 ?auto_452479 ) ) ( not ( = ?auto_452470 ?auto_452471 ) ) ( not ( = ?auto_452470 ?auto_452472 ) ) ( not ( = ?auto_452470 ?auto_452473 ) ) ( not ( = ?auto_452470 ?auto_452474 ) ) ( not ( = ?auto_452470 ?auto_452475 ) ) ( not ( = ?auto_452470 ?auto_452476 ) ) ( not ( = ?auto_452470 ?auto_452477 ) ) ( not ( = ?auto_452470 ?auto_452478 ) ) ( not ( = ?auto_452470 ?auto_452479 ) ) ( not ( = ?auto_452471 ?auto_452472 ) ) ( not ( = ?auto_452471 ?auto_452473 ) ) ( not ( = ?auto_452471 ?auto_452474 ) ) ( not ( = ?auto_452471 ?auto_452475 ) ) ( not ( = ?auto_452471 ?auto_452476 ) ) ( not ( = ?auto_452471 ?auto_452477 ) ) ( not ( = ?auto_452471 ?auto_452478 ) ) ( not ( = ?auto_452471 ?auto_452479 ) ) ( not ( = ?auto_452472 ?auto_452473 ) ) ( not ( = ?auto_452472 ?auto_452474 ) ) ( not ( = ?auto_452472 ?auto_452475 ) ) ( not ( = ?auto_452472 ?auto_452476 ) ) ( not ( = ?auto_452472 ?auto_452477 ) ) ( not ( = ?auto_452472 ?auto_452478 ) ) ( not ( = ?auto_452472 ?auto_452479 ) ) ( not ( = ?auto_452473 ?auto_452474 ) ) ( not ( = ?auto_452473 ?auto_452475 ) ) ( not ( = ?auto_452473 ?auto_452476 ) ) ( not ( = ?auto_452473 ?auto_452477 ) ) ( not ( = ?auto_452473 ?auto_452478 ) ) ( not ( = ?auto_452473 ?auto_452479 ) ) ( not ( = ?auto_452474 ?auto_452475 ) ) ( not ( = ?auto_452474 ?auto_452476 ) ) ( not ( = ?auto_452474 ?auto_452477 ) ) ( not ( = ?auto_452474 ?auto_452478 ) ) ( not ( = ?auto_452474 ?auto_452479 ) ) ( not ( = ?auto_452475 ?auto_452476 ) ) ( not ( = ?auto_452475 ?auto_452477 ) ) ( not ( = ?auto_452475 ?auto_452478 ) ) ( not ( = ?auto_452475 ?auto_452479 ) ) ( not ( = ?auto_452476 ?auto_452477 ) ) ( not ( = ?auto_452476 ?auto_452478 ) ) ( not ( = ?auto_452476 ?auto_452479 ) ) ( not ( = ?auto_452477 ?auto_452478 ) ) ( not ( = ?auto_452477 ?auto_452479 ) ) ( not ( = ?auto_452478 ?auto_452479 ) ) ( ON ?auto_452477 ?auto_452478 ) ( ON ?auto_452476 ?auto_452477 ) ( ON ?auto_452475 ?auto_452476 ) ( ON ?auto_452474 ?auto_452475 ) ( ON ?auto_452473 ?auto_452474 ) ( ON ?auto_452472 ?auto_452473 ) ( CLEAR ?auto_452470 ) ( ON ?auto_452471 ?auto_452472 ) ( CLEAR ?auto_452471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_452466 ?auto_452467 ?auto_452468 ?auto_452469 ?auto_452470 ?auto_452471 )
      ( MAKE-13PILE ?auto_452466 ?auto_452467 ?auto_452468 ?auto_452469 ?auto_452470 ?auto_452471 ?auto_452472 ?auto_452473 ?auto_452474 ?auto_452475 ?auto_452476 ?auto_452477 ?auto_452478 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452493 - BLOCK
      ?auto_452494 - BLOCK
      ?auto_452495 - BLOCK
      ?auto_452496 - BLOCK
      ?auto_452497 - BLOCK
      ?auto_452498 - BLOCK
      ?auto_452499 - BLOCK
      ?auto_452500 - BLOCK
      ?auto_452501 - BLOCK
      ?auto_452502 - BLOCK
      ?auto_452503 - BLOCK
      ?auto_452504 - BLOCK
      ?auto_452505 - BLOCK
    )
    :vars
    (
      ?auto_452506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452505 ?auto_452506 ) ( ON-TABLE ?auto_452493 ) ( ON ?auto_452494 ?auto_452493 ) ( ON ?auto_452495 ?auto_452494 ) ( ON ?auto_452496 ?auto_452495 ) ( not ( = ?auto_452493 ?auto_452494 ) ) ( not ( = ?auto_452493 ?auto_452495 ) ) ( not ( = ?auto_452493 ?auto_452496 ) ) ( not ( = ?auto_452493 ?auto_452497 ) ) ( not ( = ?auto_452493 ?auto_452498 ) ) ( not ( = ?auto_452493 ?auto_452499 ) ) ( not ( = ?auto_452493 ?auto_452500 ) ) ( not ( = ?auto_452493 ?auto_452501 ) ) ( not ( = ?auto_452493 ?auto_452502 ) ) ( not ( = ?auto_452493 ?auto_452503 ) ) ( not ( = ?auto_452493 ?auto_452504 ) ) ( not ( = ?auto_452493 ?auto_452505 ) ) ( not ( = ?auto_452493 ?auto_452506 ) ) ( not ( = ?auto_452494 ?auto_452495 ) ) ( not ( = ?auto_452494 ?auto_452496 ) ) ( not ( = ?auto_452494 ?auto_452497 ) ) ( not ( = ?auto_452494 ?auto_452498 ) ) ( not ( = ?auto_452494 ?auto_452499 ) ) ( not ( = ?auto_452494 ?auto_452500 ) ) ( not ( = ?auto_452494 ?auto_452501 ) ) ( not ( = ?auto_452494 ?auto_452502 ) ) ( not ( = ?auto_452494 ?auto_452503 ) ) ( not ( = ?auto_452494 ?auto_452504 ) ) ( not ( = ?auto_452494 ?auto_452505 ) ) ( not ( = ?auto_452494 ?auto_452506 ) ) ( not ( = ?auto_452495 ?auto_452496 ) ) ( not ( = ?auto_452495 ?auto_452497 ) ) ( not ( = ?auto_452495 ?auto_452498 ) ) ( not ( = ?auto_452495 ?auto_452499 ) ) ( not ( = ?auto_452495 ?auto_452500 ) ) ( not ( = ?auto_452495 ?auto_452501 ) ) ( not ( = ?auto_452495 ?auto_452502 ) ) ( not ( = ?auto_452495 ?auto_452503 ) ) ( not ( = ?auto_452495 ?auto_452504 ) ) ( not ( = ?auto_452495 ?auto_452505 ) ) ( not ( = ?auto_452495 ?auto_452506 ) ) ( not ( = ?auto_452496 ?auto_452497 ) ) ( not ( = ?auto_452496 ?auto_452498 ) ) ( not ( = ?auto_452496 ?auto_452499 ) ) ( not ( = ?auto_452496 ?auto_452500 ) ) ( not ( = ?auto_452496 ?auto_452501 ) ) ( not ( = ?auto_452496 ?auto_452502 ) ) ( not ( = ?auto_452496 ?auto_452503 ) ) ( not ( = ?auto_452496 ?auto_452504 ) ) ( not ( = ?auto_452496 ?auto_452505 ) ) ( not ( = ?auto_452496 ?auto_452506 ) ) ( not ( = ?auto_452497 ?auto_452498 ) ) ( not ( = ?auto_452497 ?auto_452499 ) ) ( not ( = ?auto_452497 ?auto_452500 ) ) ( not ( = ?auto_452497 ?auto_452501 ) ) ( not ( = ?auto_452497 ?auto_452502 ) ) ( not ( = ?auto_452497 ?auto_452503 ) ) ( not ( = ?auto_452497 ?auto_452504 ) ) ( not ( = ?auto_452497 ?auto_452505 ) ) ( not ( = ?auto_452497 ?auto_452506 ) ) ( not ( = ?auto_452498 ?auto_452499 ) ) ( not ( = ?auto_452498 ?auto_452500 ) ) ( not ( = ?auto_452498 ?auto_452501 ) ) ( not ( = ?auto_452498 ?auto_452502 ) ) ( not ( = ?auto_452498 ?auto_452503 ) ) ( not ( = ?auto_452498 ?auto_452504 ) ) ( not ( = ?auto_452498 ?auto_452505 ) ) ( not ( = ?auto_452498 ?auto_452506 ) ) ( not ( = ?auto_452499 ?auto_452500 ) ) ( not ( = ?auto_452499 ?auto_452501 ) ) ( not ( = ?auto_452499 ?auto_452502 ) ) ( not ( = ?auto_452499 ?auto_452503 ) ) ( not ( = ?auto_452499 ?auto_452504 ) ) ( not ( = ?auto_452499 ?auto_452505 ) ) ( not ( = ?auto_452499 ?auto_452506 ) ) ( not ( = ?auto_452500 ?auto_452501 ) ) ( not ( = ?auto_452500 ?auto_452502 ) ) ( not ( = ?auto_452500 ?auto_452503 ) ) ( not ( = ?auto_452500 ?auto_452504 ) ) ( not ( = ?auto_452500 ?auto_452505 ) ) ( not ( = ?auto_452500 ?auto_452506 ) ) ( not ( = ?auto_452501 ?auto_452502 ) ) ( not ( = ?auto_452501 ?auto_452503 ) ) ( not ( = ?auto_452501 ?auto_452504 ) ) ( not ( = ?auto_452501 ?auto_452505 ) ) ( not ( = ?auto_452501 ?auto_452506 ) ) ( not ( = ?auto_452502 ?auto_452503 ) ) ( not ( = ?auto_452502 ?auto_452504 ) ) ( not ( = ?auto_452502 ?auto_452505 ) ) ( not ( = ?auto_452502 ?auto_452506 ) ) ( not ( = ?auto_452503 ?auto_452504 ) ) ( not ( = ?auto_452503 ?auto_452505 ) ) ( not ( = ?auto_452503 ?auto_452506 ) ) ( not ( = ?auto_452504 ?auto_452505 ) ) ( not ( = ?auto_452504 ?auto_452506 ) ) ( not ( = ?auto_452505 ?auto_452506 ) ) ( ON ?auto_452504 ?auto_452505 ) ( ON ?auto_452503 ?auto_452504 ) ( ON ?auto_452502 ?auto_452503 ) ( ON ?auto_452501 ?auto_452502 ) ( ON ?auto_452500 ?auto_452501 ) ( ON ?auto_452499 ?auto_452500 ) ( ON ?auto_452498 ?auto_452499 ) ( CLEAR ?auto_452496 ) ( ON ?auto_452497 ?auto_452498 ) ( CLEAR ?auto_452497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_452493 ?auto_452494 ?auto_452495 ?auto_452496 ?auto_452497 )
      ( MAKE-13PILE ?auto_452493 ?auto_452494 ?auto_452495 ?auto_452496 ?auto_452497 ?auto_452498 ?auto_452499 ?auto_452500 ?auto_452501 ?auto_452502 ?auto_452503 ?auto_452504 ?auto_452505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452520 - BLOCK
      ?auto_452521 - BLOCK
      ?auto_452522 - BLOCK
      ?auto_452523 - BLOCK
      ?auto_452524 - BLOCK
      ?auto_452525 - BLOCK
      ?auto_452526 - BLOCK
      ?auto_452527 - BLOCK
      ?auto_452528 - BLOCK
      ?auto_452529 - BLOCK
      ?auto_452530 - BLOCK
      ?auto_452531 - BLOCK
      ?auto_452532 - BLOCK
    )
    :vars
    (
      ?auto_452533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452532 ?auto_452533 ) ( ON-TABLE ?auto_452520 ) ( ON ?auto_452521 ?auto_452520 ) ( ON ?auto_452522 ?auto_452521 ) ( ON ?auto_452523 ?auto_452522 ) ( not ( = ?auto_452520 ?auto_452521 ) ) ( not ( = ?auto_452520 ?auto_452522 ) ) ( not ( = ?auto_452520 ?auto_452523 ) ) ( not ( = ?auto_452520 ?auto_452524 ) ) ( not ( = ?auto_452520 ?auto_452525 ) ) ( not ( = ?auto_452520 ?auto_452526 ) ) ( not ( = ?auto_452520 ?auto_452527 ) ) ( not ( = ?auto_452520 ?auto_452528 ) ) ( not ( = ?auto_452520 ?auto_452529 ) ) ( not ( = ?auto_452520 ?auto_452530 ) ) ( not ( = ?auto_452520 ?auto_452531 ) ) ( not ( = ?auto_452520 ?auto_452532 ) ) ( not ( = ?auto_452520 ?auto_452533 ) ) ( not ( = ?auto_452521 ?auto_452522 ) ) ( not ( = ?auto_452521 ?auto_452523 ) ) ( not ( = ?auto_452521 ?auto_452524 ) ) ( not ( = ?auto_452521 ?auto_452525 ) ) ( not ( = ?auto_452521 ?auto_452526 ) ) ( not ( = ?auto_452521 ?auto_452527 ) ) ( not ( = ?auto_452521 ?auto_452528 ) ) ( not ( = ?auto_452521 ?auto_452529 ) ) ( not ( = ?auto_452521 ?auto_452530 ) ) ( not ( = ?auto_452521 ?auto_452531 ) ) ( not ( = ?auto_452521 ?auto_452532 ) ) ( not ( = ?auto_452521 ?auto_452533 ) ) ( not ( = ?auto_452522 ?auto_452523 ) ) ( not ( = ?auto_452522 ?auto_452524 ) ) ( not ( = ?auto_452522 ?auto_452525 ) ) ( not ( = ?auto_452522 ?auto_452526 ) ) ( not ( = ?auto_452522 ?auto_452527 ) ) ( not ( = ?auto_452522 ?auto_452528 ) ) ( not ( = ?auto_452522 ?auto_452529 ) ) ( not ( = ?auto_452522 ?auto_452530 ) ) ( not ( = ?auto_452522 ?auto_452531 ) ) ( not ( = ?auto_452522 ?auto_452532 ) ) ( not ( = ?auto_452522 ?auto_452533 ) ) ( not ( = ?auto_452523 ?auto_452524 ) ) ( not ( = ?auto_452523 ?auto_452525 ) ) ( not ( = ?auto_452523 ?auto_452526 ) ) ( not ( = ?auto_452523 ?auto_452527 ) ) ( not ( = ?auto_452523 ?auto_452528 ) ) ( not ( = ?auto_452523 ?auto_452529 ) ) ( not ( = ?auto_452523 ?auto_452530 ) ) ( not ( = ?auto_452523 ?auto_452531 ) ) ( not ( = ?auto_452523 ?auto_452532 ) ) ( not ( = ?auto_452523 ?auto_452533 ) ) ( not ( = ?auto_452524 ?auto_452525 ) ) ( not ( = ?auto_452524 ?auto_452526 ) ) ( not ( = ?auto_452524 ?auto_452527 ) ) ( not ( = ?auto_452524 ?auto_452528 ) ) ( not ( = ?auto_452524 ?auto_452529 ) ) ( not ( = ?auto_452524 ?auto_452530 ) ) ( not ( = ?auto_452524 ?auto_452531 ) ) ( not ( = ?auto_452524 ?auto_452532 ) ) ( not ( = ?auto_452524 ?auto_452533 ) ) ( not ( = ?auto_452525 ?auto_452526 ) ) ( not ( = ?auto_452525 ?auto_452527 ) ) ( not ( = ?auto_452525 ?auto_452528 ) ) ( not ( = ?auto_452525 ?auto_452529 ) ) ( not ( = ?auto_452525 ?auto_452530 ) ) ( not ( = ?auto_452525 ?auto_452531 ) ) ( not ( = ?auto_452525 ?auto_452532 ) ) ( not ( = ?auto_452525 ?auto_452533 ) ) ( not ( = ?auto_452526 ?auto_452527 ) ) ( not ( = ?auto_452526 ?auto_452528 ) ) ( not ( = ?auto_452526 ?auto_452529 ) ) ( not ( = ?auto_452526 ?auto_452530 ) ) ( not ( = ?auto_452526 ?auto_452531 ) ) ( not ( = ?auto_452526 ?auto_452532 ) ) ( not ( = ?auto_452526 ?auto_452533 ) ) ( not ( = ?auto_452527 ?auto_452528 ) ) ( not ( = ?auto_452527 ?auto_452529 ) ) ( not ( = ?auto_452527 ?auto_452530 ) ) ( not ( = ?auto_452527 ?auto_452531 ) ) ( not ( = ?auto_452527 ?auto_452532 ) ) ( not ( = ?auto_452527 ?auto_452533 ) ) ( not ( = ?auto_452528 ?auto_452529 ) ) ( not ( = ?auto_452528 ?auto_452530 ) ) ( not ( = ?auto_452528 ?auto_452531 ) ) ( not ( = ?auto_452528 ?auto_452532 ) ) ( not ( = ?auto_452528 ?auto_452533 ) ) ( not ( = ?auto_452529 ?auto_452530 ) ) ( not ( = ?auto_452529 ?auto_452531 ) ) ( not ( = ?auto_452529 ?auto_452532 ) ) ( not ( = ?auto_452529 ?auto_452533 ) ) ( not ( = ?auto_452530 ?auto_452531 ) ) ( not ( = ?auto_452530 ?auto_452532 ) ) ( not ( = ?auto_452530 ?auto_452533 ) ) ( not ( = ?auto_452531 ?auto_452532 ) ) ( not ( = ?auto_452531 ?auto_452533 ) ) ( not ( = ?auto_452532 ?auto_452533 ) ) ( ON ?auto_452531 ?auto_452532 ) ( ON ?auto_452530 ?auto_452531 ) ( ON ?auto_452529 ?auto_452530 ) ( ON ?auto_452528 ?auto_452529 ) ( ON ?auto_452527 ?auto_452528 ) ( ON ?auto_452526 ?auto_452527 ) ( ON ?auto_452525 ?auto_452526 ) ( CLEAR ?auto_452523 ) ( ON ?auto_452524 ?auto_452525 ) ( CLEAR ?auto_452524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_452520 ?auto_452521 ?auto_452522 ?auto_452523 ?auto_452524 )
      ( MAKE-13PILE ?auto_452520 ?auto_452521 ?auto_452522 ?auto_452523 ?auto_452524 ?auto_452525 ?auto_452526 ?auto_452527 ?auto_452528 ?auto_452529 ?auto_452530 ?auto_452531 ?auto_452532 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452547 - BLOCK
      ?auto_452548 - BLOCK
      ?auto_452549 - BLOCK
      ?auto_452550 - BLOCK
      ?auto_452551 - BLOCK
      ?auto_452552 - BLOCK
      ?auto_452553 - BLOCK
      ?auto_452554 - BLOCK
      ?auto_452555 - BLOCK
      ?auto_452556 - BLOCK
      ?auto_452557 - BLOCK
      ?auto_452558 - BLOCK
      ?auto_452559 - BLOCK
    )
    :vars
    (
      ?auto_452560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452559 ?auto_452560 ) ( ON-TABLE ?auto_452547 ) ( ON ?auto_452548 ?auto_452547 ) ( ON ?auto_452549 ?auto_452548 ) ( not ( = ?auto_452547 ?auto_452548 ) ) ( not ( = ?auto_452547 ?auto_452549 ) ) ( not ( = ?auto_452547 ?auto_452550 ) ) ( not ( = ?auto_452547 ?auto_452551 ) ) ( not ( = ?auto_452547 ?auto_452552 ) ) ( not ( = ?auto_452547 ?auto_452553 ) ) ( not ( = ?auto_452547 ?auto_452554 ) ) ( not ( = ?auto_452547 ?auto_452555 ) ) ( not ( = ?auto_452547 ?auto_452556 ) ) ( not ( = ?auto_452547 ?auto_452557 ) ) ( not ( = ?auto_452547 ?auto_452558 ) ) ( not ( = ?auto_452547 ?auto_452559 ) ) ( not ( = ?auto_452547 ?auto_452560 ) ) ( not ( = ?auto_452548 ?auto_452549 ) ) ( not ( = ?auto_452548 ?auto_452550 ) ) ( not ( = ?auto_452548 ?auto_452551 ) ) ( not ( = ?auto_452548 ?auto_452552 ) ) ( not ( = ?auto_452548 ?auto_452553 ) ) ( not ( = ?auto_452548 ?auto_452554 ) ) ( not ( = ?auto_452548 ?auto_452555 ) ) ( not ( = ?auto_452548 ?auto_452556 ) ) ( not ( = ?auto_452548 ?auto_452557 ) ) ( not ( = ?auto_452548 ?auto_452558 ) ) ( not ( = ?auto_452548 ?auto_452559 ) ) ( not ( = ?auto_452548 ?auto_452560 ) ) ( not ( = ?auto_452549 ?auto_452550 ) ) ( not ( = ?auto_452549 ?auto_452551 ) ) ( not ( = ?auto_452549 ?auto_452552 ) ) ( not ( = ?auto_452549 ?auto_452553 ) ) ( not ( = ?auto_452549 ?auto_452554 ) ) ( not ( = ?auto_452549 ?auto_452555 ) ) ( not ( = ?auto_452549 ?auto_452556 ) ) ( not ( = ?auto_452549 ?auto_452557 ) ) ( not ( = ?auto_452549 ?auto_452558 ) ) ( not ( = ?auto_452549 ?auto_452559 ) ) ( not ( = ?auto_452549 ?auto_452560 ) ) ( not ( = ?auto_452550 ?auto_452551 ) ) ( not ( = ?auto_452550 ?auto_452552 ) ) ( not ( = ?auto_452550 ?auto_452553 ) ) ( not ( = ?auto_452550 ?auto_452554 ) ) ( not ( = ?auto_452550 ?auto_452555 ) ) ( not ( = ?auto_452550 ?auto_452556 ) ) ( not ( = ?auto_452550 ?auto_452557 ) ) ( not ( = ?auto_452550 ?auto_452558 ) ) ( not ( = ?auto_452550 ?auto_452559 ) ) ( not ( = ?auto_452550 ?auto_452560 ) ) ( not ( = ?auto_452551 ?auto_452552 ) ) ( not ( = ?auto_452551 ?auto_452553 ) ) ( not ( = ?auto_452551 ?auto_452554 ) ) ( not ( = ?auto_452551 ?auto_452555 ) ) ( not ( = ?auto_452551 ?auto_452556 ) ) ( not ( = ?auto_452551 ?auto_452557 ) ) ( not ( = ?auto_452551 ?auto_452558 ) ) ( not ( = ?auto_452551 ?auto_452559 ) ) ( not ( = ?auto_452551 ?auto_452560 ) ) ( not ( = ?auto_452552 ?auto_452553 ) ) ( not ( = ?auto_452552 ?auto_452554 ) ) ( not ( = ?auto_452552 ?auto_452555 ) ) ( not ( = ?auto_452552 ?auto_452556 ) ) ( not ( = ?auto_452552 ?auto_452557 ) ) ( not ( = ?auto_452552 ?auto_452558 ) ) ( not ( = ?auto_452552 ?auto_452559 ) ) ( not ( = ?auto_452552 ?auto_452560 ) ) ( not ( = ?auto_452553 ?auto_452554 ) ) ( not ( = ?auto_452553 ?auto_452555 ) ) ( not ( = ?auto_452553 ?auto_452556 ) ) ( not ( = ?auto_452553 ?auto_452557 ) ) ( not ( = ?auto_452553 ?auto_452558 ) ) ( not ( = ?auto_452553 ?auto_452559 ) ) ( not ( = ?auto_452553 ?auto_452560 ) ) ( not ( = ?auto_452554 ?auto_452555 ) ) ( not ( = ?auto_452554 ?auto_452556 ) ) ( not ( = ?auto_452554 ?auto_452557 ) ) ( not ( = ?auto_452554 ?auto_452558 ) ) ( not ( = ?auto_452554 ?auto_452559 ) ) ( not ( = ?auto_452554 ?auto_452560 ) ) ( not ( = ?auto_452555 ?auto_452556 ) ) ( not ( = ?auto_452555 ?auto_452557 ) ) ( not ( = ?auto_452555 ?auto_452558 ) ) ( not ( = ?auto_452555 ?auto_452559 ) ) ( not ( = ?auto_452555 ?auto_452560 ) ) ( not ( = ?auto_452556 ?auto_452557 ) ) ( not ( = ?auto_452556 ?auto_452558 ) ) ( not ( = ?auto_452556 ?auto_452559 ) ) ( not ( = ?auto_452556 ?auto_452560 ) ) ( not ( = ?auto_452557 ?auto_452558 ) ) ( not ( = ?auto_452557 ?auto_452559 ) ) ( not ( = ?auto_452557 ?auto_452560 ) ) ( not ( = ?auto_452558 ?auto_452559 ) ) ( not ( = ?auto_452558 ?auto_452560 ) ) ( not ( = ?auto_452559 ?auto_452560 ) ) ( ON ?auto_452558 ?auto_452559 ) ( ON ?auto_452557 ?auto_452558 ) ( ON ?auto_452556 ?auto_452557 ) ( ON ?auto_452555 ?auto_452556 ) ( ON ?auto_452554 ?auto_452555 ) ( ON ?auto_452553 ?auto_452554 ) ( ON ?auto_452552 ?auto_452553 ) ( ON ?auto_452551 ?auto_452552 ) ( CLEAR ?auto_452549 ) ( ON ?auto_452550 ?auto_452551 ) ( CLEAR ?auto_452550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_452547 ?auto_452548 ?auto_452549 ?auto_452550 )
      ( MAKE-13PILE ?auto_452547 ?auto_452548 ?auto_452549 ?auto_452550 ?auto_452551 ?auto_452552 ?auto_452553 ?auto_452554 ?auto_452555 ?auto_452556 ?auto_452557 ?auto_452558 ?auto_452559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452574 - BLOCK
      ?auto_452575 - BLOCK
      ?auto_452576 - BLOCK
      ?auto_452577 - BLOCK
      ?auto_452578 - BLOCK
      ?auto_452579 - BLOCK
      ?auto_452580 - BLOCK
      ?auto_452581 - BLOCK
      ?auto_452582 - BLOCK
      ?auto_452583 - BLOCK
      ?auto_452584 - BLOCK
      ?auto_452585 - BLOCK
      ?auto_452586 - BLOCK
    )
    :vars
    (
      ?auto_452587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452586 ?auto_452587 ) ( ON-TABLE ?auto_452574 ) ( ON ?auto_452575 ?auto_452574 ) ( ON ?auto_452576 ?auto_452575 ) ( not ( = ?auto_452574 ?auto_452575 ) ) ( not ( = ?auto_452574 ?auto_452576 ) ) ( not ( = ?auto_452574 ?auto_452577 ) ) ( not ( = ?auto_452574 ?auto_452578 ) ) ( not ( = ?auto_452574 ?auto_452579 ) ) ( not ( = ?auto_452574 ?auto_452580 ) ) ( not ( = ?auto_452574 ?auto_452581 ) ) ( not ( = ?auto_452574 ?auto_452582 ) ) ( not ( = ?auto_452574 ?auto_452583 ) ) ( not ( = ?auto_452574 ?auto_452584 ) ) ( not ( = ?auto_452574 ?auto_452585 ) ) ( not ( = ?auto_452574 ?auto_452586 ) ) ( not ( = ?auto_452574 ?auto_452587 ) ) ( not ( = ?auto_452575 ?auto_452576 ) ) ( not ( = ?auto_452575 ?auto_452577 ) ) ( not ( = ?auto_452575 ?auto_452578 ) ) ( not ( = ?auto_452575 ?auto_452579 ) ) ( not ( = ?auto_452575 ?auto_452580 ) ) ( not ( = ?auto_452575 ?auto_452581 ) ) ( not ( = ?auto_452575 ?auto_452582 ) ) ( not ( = ?auto_452575 ?auto_452583 ) ) ( not ( = ?auto_452575 ?auto_452584 ) ) ( not ( = ?auto_452575 ?auto_452585 ) ) ( not ( = ?auto_452575 ?auto_452586 ) ) ( not ( = ?auto_452575 ?auto_452587 ) ) ( not ( = ?auto_452576 ?auto_452577 ) ) ( not ( = ?auto_452576 ?auto_452578 ) ) ( not ( = ?auto_452576 ?auto_452579 ) ) ( not ( = ?auto_452576 ?auto_452580 ) ) ( not ( = ?auto_452576 ?auto_452581 ) ) ( not ( = ?auto_452576 ?auto_452582 ) ) ( not ( = ?auto_452576 ?auto_452583 ) ) ( not ( = ?auto_452576 ?auto_452584 ) ) ( not ( = ?auto_452576 ?auto_452585 ) ) ( not ( = ?auto_452576 ?auto_452586 ) ) ( not ( = ?auto_452576 ?auto_452587 ) ) ( not ( = ?auto_452577 ?auto_452578 ) ) ( not ( = ?auto_452577 ?auto_452579 ) ) ( not ( = ?auto_452577 ?auto_452580 ) ) ( not ( = ?auto_452577 ?auto_452581 ) ) ( not ( = ?auto_452577 ?auto_452582 ) ) ( not ( = ?auto_452577 ?auto_452583 ) ) ( not ( = ?auto_452577 ?auto_452584 ) ) ( not ( = ?auto_452577 ?auto_452585 ) ) ( not ( = ?auto_452577 ?auto_452586 ) ) ( not ( = ?auto_452577 ?auto_452587 ) ) ( not ( = ?auto_452578 ?auto_452579 ) ) ( not ( = ?auto_452578 ?auto_452580 ) ) ( not ( = ?auto_452578 ?auto_452581 ) ) ( not ( = ?auto_452578 ?auto_452582 ) ) ( not ( = ?auto_452578 ?auto_452583 ) ) ( not ( = ?auto_452578 ?auto_452584 ) ) ( not ( = ?auto_452578 ?auto_452585 ) ) ( not ( = ?auto_452578 ?auto_452586 ) ) ( not ( = ?auto_452578 ?auto_452587 ) ) ( not ( = ?auto_452579 ?auto_452580 ) ) ( not ( = ?auto_452579 ?auto_452581 ) ) ( not ( = ?auto_452579 ?auto_452582 ) ) ( not ( = ?auto_452579 ?auto_452583 ) ) ( not ( = ?auto_452579 ?auto_452584 ) ) ( not ( = ?auto_452579 ?auto_452585 ) ) ( not ( = ?auto_452579 ?auto_452586 ) ) ( not ( = ?auto_452579 ?auto_452587 ) ) ( not ( = ?auto_452580 ?auto_452581 ) ) ( not ( = ?auto_452580 ?auto_452582 ) ) ( not ( = ?auto_452580 ?auto_452583 ) ) ( not ( = ?auto_452580 ?auto_452584 ) ) ( not ( = ?auto_452580 ?auto_452585 ) ) ( not ( = ?auto_452580 ?auto_452586 ) ) ( not ( = ?auto_452580 ?auto_452587 ) ) ( not ( = ?auto_452581 ?auto_452582 ) ) ( not ( = ?auto_452581 ?auto_452583 ) ) ( not ( = ?auto_452581 ?auto_452584 ) ) ( not ( = ?auto_452581 ?auto_452585 ) ) ( not ( = ?auto_452581 ?auto_452586 ) ) ( not ( = ?auto_452581 ?auto_452587 ) ) ( not ( = ?auto_452582 ?auto_452583 ) ) ( not ( = ?auto_452582 ?auto_452584 ) ) ( not ( = ?auto_452582 ?auto_452585 ) ) ( not ( = ?auto_452582 ?auto_452586 ) ) ( not ( = ?auto_452582 ?auto_452587 ) ) ( not ( = ?auto_452583 ?auto_452584 ) ) ( not ( = ?auto_452583 ?auto_452585 ) ) ( not ( = ?auto_452583 ?auto_452586 ) ) ( not ( = ?auto_452583 ?auto_452587 ) ) ( not ( = ?auto_452584 ?auto_452585 ) ) ( not ( = ?auto_452584 ?auto_452586 ) ) ( not ( = ?auto_452584 ?auto_452587 ) ) ( not ( = ?auto_452585 ?auto_452586 ) ) ( not ( = ?auto_452585 ?auto_452587 ) ) ( not ( = ?auto_452586 ?auto_452587 ) ) ( ON ?auto_452585 ?auto_452586 ) ( ON ?auto_452584 ?auto_452585 ) ( ON ?auto_452583 ?auto_452584 ) ( ON ?auto_452582 ?auto_452583 ) ( ON ?auto_452581 ?auto_452582 ) ( ON ?auto_452580 ?auto_452581 ) ( ON ?auto_452579 ?auto_452580 ) ( ON ?auto_452578 ?auto_452579 ) ( CLEAR ?auto_452576 ) ( ON ?auto_452577 ?auto_452578 ) ( CLEAR ?auto_452577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_452574 ?auto_452575 ?auto_452576 ?auto_452577 )
      ( MAKE-13PILE ?auto_452574 ?auto_452575 ?auto_452576 ?auto_452577 ?auto_452578 ?auto_452579 ?auto_452580 ?auto_452581 ?auto_452582 ?auto_452583 ?auto_452584 ?auto_452585 ?auto_452586 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452601 - BLOCK
      ?auto_452602 - BLOCK
      ?auto_452603 - BLOCK
      ?auto_452604 - BLOCK
      ?auto_452605 - BLOCK
      ?auto_452606 - BLOCK
      ?auto_452607 - BLOCK
      ?auto_452608 - BLOCK
      ?auto_452609 - BLOCK
      ?auto_452610 - BLOCK
      ?auto_452611 - BLOCK
      ?auto_452612 - BLOCK
      ?auto_452613 - BLOCK
    )
    :vars
    (
      ?auto_452614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452613 ?auto_452614 ) ( ON-TABLE ?auto_452601 ) ( ON ?auto_452602 ?auto_452601 ) ( not ( = ?auto_452601 ?auto_452602 ) ) ( not ( = ?auto_452601 ?auto_452603 ) ) ( not ( = ?auto_452601 ?auto_452604 ) ) ( not ( = ?auto_452601 ?auto_452605 ) ) ( not ( = ?auto_452601 ?auto_452606 ) ) ( not ( = ?auto_452601 ?auto_452607 ) ) ( not ( = ?auto_452601 ?auto_452608 ) ) ( not ( = ?auto_452601 ?auto_452609 ) ) ( not ( = ?auto_452601 ?auto_452610 ) ) ( not ( = ?auto_452601 ?auto_452611 ) ) ( not ( = ?auto_452601 ?auto_452612 ) ) ( not ( = ?auto_452601 ?auto_452613 ) ) ( not ( = ?auto_452601 ?auto_452614 ) ) ( not ( = ?auto_452602 ?auto_452603 ) ) ( not ( = ?auto_452602 ?auto_452604 ) ) ( not ( = ?auto_452602 ?auto_452605 ) ) ( not ( = ?auto_452602 ?auto_452606 ) ) ( not ( = ?auto_452602 ?auto_452607 ) ) ( not ( = ?auto_452602 ?auto_452608 ) ) ( not ( = ?auto_452602 ?auto_452609 ) ) ( not ( = ?auto_452602 ?auto_452610 ) ) ( not ( = ?auto_452602 ?auto_452611 ) ) ( not ( = ?auto_452602 ?auto_452612 ) ) ( not ( = ?auto_452602 ?auto_452613 ) ) ( not ( = ?auto_452602 ?auto_452614 ) ) ( not ( = ?auto_452603 ?auto_452604 ) ) ( not ( = ?auto_452603 ?auto_452605 ) ) ( not ( = ?auto_452603 ?auto_452606 ) ) ( not ( = ?auto_452603 ?auto_452607 ) ) ( not ( = ?auto_452603 ?auto_452608 ) ) ( not ( = ?auto_452603 ?auto_452609 ) ) ( not ( = ?auto_452603 ?auto_452610 ) ) ( not ( = ?auto_452603 ?auto_452611 ) ) ( not ( = ?auto_452603 ?auto_452612 ) ) ( not ( = ?auto_452603 ?auto_452613 ) ) ( not ( = ?auto_452603 ?auto_452614 ) ) ( not ( = ?auto_452604 ?auto_452605 ) ) ( not ( = ?auto_452604 ?auto_452606 ) ) ( not ( = ?auto_452604 ?auto_452607 ) ) ( not ( = ?auto_452604 ?auto_452608 ) ) ( not ( = ?auto_452604 ?auto_452609 ) ) ( not ( = ?auto_452604 ?auto_452610 ) ) ( not ( = ?auto_452604 ?auto_452611 ) ) ( not ( = ?auto_452604 ?auto_452612 ) ) ( not ( = ?auto_452604 ?auto_452613 ) ) ( not ( = ?auto_452604 ?auto_452614 ) ) ( not ( = ?auto_452605 ?auto_452606 ) ) ( not ( = ?auto_452605 ?auto_452607 ) ) ( not ( = ?auto_452605 ?auto_452608 ) ) ( not ( = ?auto_452605 ?auto_452609 ) ) ( not ( = ?auto_452605 ?auto_452610 ) ) ( not ( = ?auto_452605 ?auto_452611 ) ) ( not ( = ?auto_452605 ?auto_452612 ) ) ( not ( = ?auto_452605 ?auto_452613 ) ) ( not ( = ?auto_452605 ?auto_452614 ) ) ( not ( = ?auto_452606 ?auto_452607 ) ) ( not ( = ?auto_452606 ?auto_452608 ) ) ( not ( = ?auto_452606 ?auto_452609 ) ) ( not ( = ?auto_452606 ?auto_452610 ) ) ( not ( = ?auto_452606 ?auto_452611 ) ) ( not ( = ?auto_452606 ?auto_452612 ) ) ( not ( = ?auto_452606 ?auto_452613 ) ) ( not ( = ?auto_452606 ?auto_452614 ) ) ( not ( = ?auto_452607 ?auto_452608 ) ) ( not ( = ?auto_452607 ?auto_452609 ) ) ( not ( = ?auto_452607 ?auto_452610 ) ) ( not ( = ?auto_452607 ?auto_452611 ) ) ( not ( = ?auto_452607 ?auto_452612 ) ) ( not ( = ?auto_452607 ?auto_452613 ) ) ( not ( = ?auto_452607 ?auto_452614 ) ) ( not ( = ?auto_452608 ?auto_452609 ) ) ( not ( = ?auto_452608 ?auto_452610 ) ) ( not ( = ?auto_452608 ?auto_452611 ) ) ( not ( = ?auto_452608 ?auto_452612 ) ) ( not ( = ?auto_452608 ?auto_452613 ) ) ( not ( = ?auto_452608 ?auto_452614 ) ) ( not ( = ?auto_452609 ?auto_452610 ) ) ( not ( = ?auto_452609 ?auto_452611 ) ) ( not ( = ?auto_452609 ?auto_452612 ) ) ( not ( = ?auto_452609 ?auto_452613 ) ) ( not ( = ?auto_452609 ?auto_452614 ) ) ( not ( = ?auto_452610 ?auto_452611 ) ) ( not ( = ?auto_452610 ?auto_452612 ) ) ( not ( = ?auto_452610 ?auto_452613 ) ) ( not ( = ?auto_452610 ?auto_452614 ) ) ( not ( = ?auto_452611 ?auto_452612 ) ) ( not ( = ?auto_452611 ?auto_452613 ) ) ( not ( = ?auto_452611 ?auto_452614 ) ) ( not ( = ?auto_452612 ?auto_452613 ) ) ( not ( = ?auto_452612 ?auto_452614 ) ) ( not ( = ?auto_452613 ?auto_452614 ) ) ( ON ?auto_452612 ?auto_452613 ) ( ON ?auto_452611 ?auto_452612 ) ( ON ?auto_452610 ?auto_452611 ) ( ON ?auto_452609 ?auto_452610 ) ( ON ?auto_452608 ?auto_452609 ) ( ON ?auto_452607 ?auto_452608 ) ( ON ?auto_452606 ?auto_452607 ) ( ON ?auto_452605 ?auto_452606 ) ( ON ?auto_452604 ?auto_452605 ) ( CLEAR ?auto_452602 ) ( ON ?auto_452603 ?auto_452604 ) ( CLEAR ?auto_452603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_452601 ?auto_452602 ?auto_452603 )
      ( MAKE-13PILE ?auto_452601 ?auto_452602 ?auto_452603 ?auto_452604 ?auto_452605 ?auto_452606 ?auto_452607 ?auto_452608 ?auto_452609 ?auto_452610 ?auto_452611 ?auto_452612 ?auto_452613 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452628 - BLOCK
      ?auto_452629 - BLOCK
      ?auto_452630 - BLOCK
      ?auto_452631 - BLOCK
      ?auto_452632 - BLOCK
      ?auto_452633 - BLOCK
      ?auto_452634 - BLOCK
      ?auto_452635 - BLOCK
      ?auto_452636 - BLOCK
      ?auto_452637 - BLOCK
      ?auto_452638 - BLOCK
      ?auto_452639 - BLOCK
      ?auto_452640 - BLOCK
    )
    :vars
    (
      ?auto_452641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452640 ?auto_452641 ) ( ON-TABLE ?auto_452628 ) ( ON ?auto_452629 ?auto_452628 ) ( not ( = ?auto_452628 ?auto_452629 ) ) ( not ( = ?auto_452628 ?auto_452630 ) ) ( not ( = ?auto_452628 ?auto_452631 ) ) ( not ( = ?auto_452628 ?auto_452632 ) ) ( not ( = ?auto_452628 ?auto_452633 ) ) ( not ( = ?auto_452628 ?auto_452634 ) ) ( not ( = ?auto_452628 ?auto_452635 ) ) ( not ( = ?auto_452628 ?auto_452636 ) ) ( not ( = ?auto_452628 ?auto_452637 ) ) ( not ( = ?auto_452628 ?auto_452638 ) ) ( not ( = ?auto_452628 ?auto_452639 ) ) ( not ( = ?auto_452628 ?auto_452640 ) ) ( not ( = ?auto_452628 ?auto_452641 ) ) ( not ( = ?auto_452629 ?auto_452630 ) ) ( not ( = ?auto_452629 ?auto_452631 ) ) ( not ( = ?auto_452629 ?auto_452632 ) ) ( not ( = ?auto_452629 ?auto_452633 ) ) ( not ( = ?auto_452629 ?auto_452634 ) ) ( not ( = ?auto_452629 ?auto_452635 ) ) ( not ( = ?auto_452629 ?auto_452636 ) ) ( not ( = ?auto_452629 ?auto_452637 ) ) ( not ( = ?auto_452629 ?auto_452638 ) ) ( not ( = ?auto_452629 ?auto_452639 ) ) ( not ( = ?auto_452629 ?auto_452640 ) ) ( not ( = ?auto_452629 ?auto_452641 ) ) ( not ( = ?auto_452630 ?auto_452631 ) ) ( not ( = ?auto_452630 ?auto_452632 ) ) ( not ( = ?auto_452630 ?auto_452633 ) ) ( not ( = ?auto_452630 ?auto_452634 ) ) ( not ( = ?auto_452630 ?auto_452635 ) ) ( not ( = ?auto_452630 ?auto_452636 ) ) ( not ( = ?auto_452630 ?auto_452637 ) ) ( not ( = ?auto_452630 ?auto_452638 ) ) ( not ( = ?auto_452630 ?auto_452639 ) ) ( not ( = ?auto_452630 ?auto_452640 ) ) ( not ( = ?auto_452630 ?auto_452641 ) ) ( not ( = ?auto_452631 ?auto_452632 ) ) ( not ( = ?auto_452631 ?auto_452633 ) ) ( not ( = ?auto_452631 ?auto_452634 ) ) ( not ( = ?auto_452631 ?auto_452635 ) ) ( not ( = ?auto_452631 ?auto_452636 ) ) ( not ( = ?auto_452631 ?auto_452637 ) ) ( not ( = ?auto_452631 ?auto_452638 ) ) ( not ( = ?auto_452631 ?auto_452639 ) ) ( not ( = ?auto_452631 ?auto_452640 ) ) ( not ( = ?auto_452631 ?auto_452641 ) ) ( not ( = ?auto_452632 ?auto_452633 ) ) ( not ( = ?auto_452632 ?auto_452634 ) ) ( not ( = ?auto_452632 ?auto_452635 ) ) ( not ( = ?auto_452632 ?auto_452636 ) ) ( not ( = ?auto_452632 ?auto_452637 ) ) ( not ( = ?auto_452632 ?auto_452638 ) ) ( not ( = ?auto_452632 ?auto_452639 ) ) ( not ( = ?auto_452632 ?auto_452640 ) ) ( not ( = ?auto_452632 ?auto_452641 ) ) ( not ( = ?auto_452633 ?auto_452634 ) ) ( not ( = ?auto_452633 ?auto_452635 ) ) ( not ( = ?auto_452633 ?auto_452636 ) ) ( not ( = ?auto_452633 ?auto_452637 ) ) ( not ( = ?auto_452633 ?auto_452638 ) ) ( not ( = ?auto_452633 ?auto_452639 ) ) ( not ( = ?auto_452633 ?auto_452640 ) ) ( not ( = ?auto_452633 ?auto_452641 ) ) ( not ( = ?auto_452634 ?auto_452635 ) ) ( not ( = ?auto_452634 ?auto_452636 ) ) ( not ( = ?auto_452634 ?auto_452637 ) ) ( not ( = ?auto_452634 ?auto_452638 ) ) ( not ( = ?auto_452634 ?auto_452639 ) ) ( not ( = ?auto_452634 ?auto_452640 ) ) ( not ( = ?auto_452634 ?auto_452641 ) ) ( not ( = ?auto_452635 ?auto_452636 ) ) ( not ( = ?auto_452635 ?auto_452637 ) ) ( not ( = ?auto_452635 ?auto_452638 ) ) ( not ( = ?auto_452635 ?auto_452639 ) ) ( not ( = ?auto_452635 ?auto_452640 ) ) ( not ( = ?auto_452635 ?auto_452641 ) ) ( not ( = ?auto_452636 ?auto_452637 ) ) ( not ( = ?auto_452636 ?auto_452638 ) ) ( not ( = ?auto_452636 ?auto_452639 ) ) ( not ( = ?auto_452636 ?auto_452640 ) ) ( not ( = ?auto_452636 ?auto_452641 ) ) ( not ( = ?auto_452637 ?auto_452638 ) ) ( not ( = ?auto_452637 ?auto_452639 ) ) ( not ( = ?auto_452637 ?auto_452640 ) ) ( not ( = ?auto_452637 ?auto_452641 ) ) ( not ( = ?auto_452638 ?auto_452639 ) ) ( not ( = ?auto_452638 ?auto_452640 ) ) ( not ( = ?auto_452638 ?auto_452641 ) ) ( not ( = ?auto_452639 ?auto_452640 ) ) ( not ( = ?auto_452639 ?auto_452641 ) ) ( not ( = ?auto_452640 ?auto_452641 ) ) ( ON ?auto_452639 ?auto_452640 ) ( ON ?auto_452638 ?auto_452639 ) ( ON ?auto_452637 ?auto_452638 ) ( ON ?auto_452636 ?auto_452637 ) ( ON ?auto_452635 ?auto_452636 ) ( ON ?auto_452634 ?auto_452635 ) ( ON ?auto_452633 ?auto_452634 ) ( ON ?auto_452632 ?auto_452633 ) ( ON ?auto_452631 ?auto_452632 ) ( CLEAR ?auto_452629 ) ( ON ?auto_452630 ?auto_452631 ) ( CLEAR ?auto_452630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_452628 ?auto_452629 ?auto_452630 )
      ( MAKE-13PILE ?auto_452628 ?auto_452629 ?auto_452630 ?auto_452631 ?auto_452632 ?auto_452633 ?auto_452634 ?auto_452635 ?auto_452636 ?auto_452637 ?auto_452638 ?auto_452639 ?auto_452640 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452655 - BLOCK
      ?auto_452656 - BLOCK
      ?auto_452657 - BLOCK
      ?auto_452658 - BLOCK
      ?auto_452659 - BLOCK
      ?auto_452660 - BLOCK
      ?auto_452661 - BLOCK
      ?auto_452662 - BLOCK
      ?auto_452663 - BLOCK
      ?auto_452664 - BLOCK
      ?auto_452665 - BLOCK
      ?auto_452666 - BLOCK
      ?auto_452667 - BLOCK
    )
    :vars
    (
      ?auto_452668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452667 ?auto_452668 ) ( ON-TABLE ?auto_452655 ) ( not ( = ?auto_452655 ?auto_452656 ) ) ( not ( = ?auto_452655 ?auto_452657 ) ) ( not ( = ?auto_452655 ?auto_452658 ) ) ( not ( = ?auto_452655 ?auto_452659 ) ) ( not ( = ?auto_452655 ?auto_452660 ) ) ( not ( = ?auto_452655 ?auto_452661 ) ) ( not ( = ?auto_452655 ?auto_452662 ) ) ( not ( = ?auto_452655 ?auto_452663 ) ) ( not ( = ?auto_452655 ?auto_452664 ) ) ( not ( = ?auto_452655 ?auto_452665 ) ) ( not ( = ?auto_452655 ?auto_452666 ) ) ( not ( = ?auto_452655 ?auto_452667 ) ) ( not ( = ?auto_452655 ?auto_452668 ) ) ( not ( = ?auto_452656 ?auto_452657 ) ) ( not ( = ?auto_452656 ?auto_452658 ) ) ( not ( = ?auto_452656 ?auto_452659 ) ) ( not ( = ?auto_452656 ?auto_452660 ) ) ( not ( = ?auto_452656 ?auto_452661 ) ) ( not ( = ?auto_452656 ?auto_452662 ) ) ( not ( = ?auto_452656 ?auto_452663 ) ) ( not ( = ?auto_452656 ?auto_452664 ) ) ( not ( = ?auto_452656 ?auto_452665 ) ) ( not ( = ?auto_452656 ?auto_452666 ) ) ( not ( = ?auto_452656 ?auto_452667 ) ) ( not ( = ?auto_452656 ?auto_452668 ) ) ( not ( = ?auto_452657 ?auto_452658 ) ) ( not ( = ?auto_452657 ?auto_452659 ) ) ( not ( = ?auto_452657 ?auto_452660 ) ) ( not ( = ?auto_452657 ?auto_452661 ) ) ( not ( = ?auto_452657 ?auto_452662 ) ) ( not ( = ?auto_452657 ?auto_452663 ) ) ( not ( = ?auto_452657 ?auto_452664 ) ) ( not ( = ?auto_452657 ?auto_452665 ) ) ( not ( = ?auto_452657 ?auto_452666 ) ) ( not ( = ?auto_452657 ?auto_452667 ) ) ( not ( = ?auto_452657 ?auto_452668 ) ) ( not ( = ?auto_452658 ?auto_452659 ) ) ( not ( = ?auto_452658 ?auto_452660 ) ) ( not ( = ?auto_452658 ?auto_452661 ) ) ( not ( = ?auto_452658 ?auto_452662 ) ) ( not ( = ?auto_452658 ?auto_452663 ) ) ( not ( = ?auto_452658 ?auto_452664 ) ) ( not ( = ?auto_452658 ?auto_452665 ) ) ( not ( = ?auto_452658 ?auto_452666 ) ) ( not ( = ?auto_452658 ?auto_452667 ) ) ( not ( = ?auto_452658 ?auto_452668 ) ) ( not ( = ?auto_452659 ?auto_452660 ) ) ( not ( = ?auto_452659 ?auto_452661 ) ) ( not ( = ?auto_452659 ?auto_452662 ) ) ( not ( = ?auto_452659 ?auto_452663 ) ) ( not ( = ?auto_452659 ?auto_452664 ) ) ( not ( = ?auto_452659 ?auto_452665 ) ) ( not ( = ?auto_452659 ?auto_452666 ) ) ( not ( = ?auto_452659 ?auto_452667 ) ) ( not ( = ?auto_452659 ?auto_452668 ) ) ( not ( = ?auto_452660 ?auto_452661 ) ) ( not ( = ?auto_452660 ?auto_452662 ) ) ( not ( = ?auto_452660 ?auto_452663 ) ) ( not ( = ?auto_452660 ?auto_452664 ) ) ( not ( = ?auto_452660 ?auto_452665 ) ) ( not ( = ?auto_452660 ?auto_452666 ) ) ( not ( = ?auto_452660 ?auto_452667 ) ) ( not ( = ?auto_452660 ?auto_452668 ) ) ( not ( = ?auto_452661 ?auto_452662 ) ) ( not ( = ?auto_452661 ?auto_452663 ) ) ( not ( = ?auto_452661 ?auto_452664 ) ) ( not ( = ?auto_452661 ?auto_452665 ) ) ( not ( = ?auto_452661 ?auto_452666 ) ) ( not ( = ?auto_452661 ?auto_452667 ) ) ( not ( = ?auto_452661 ?auto_452668 ) ) ( not ( = ?auto_452662 ?auto_452663 ) ) ( not ( = ?auto_452662 ?auto_452664 ) ) ( not ( = ?auto_452662 ?auto_452665 ) ) ( not ( = ?auto_452662 ?auto_452666 ) ) ( not ( = ?auto_452662 ?auto_452667 ) ) ( not ( = ?auto_452662 ?auto_452668 ) ) ( not ( = ?auto_452663 ?auto_452664 ) ) ( not ( = ?auto_452663 ?auto_452665 ) ) ( not ( = ?auto_452663 ?auto_452666 ) ) ( not ( = ?auto_452663 ?auto_452667 ) ) ( not ( = ?auto_452663 ?auto_452668 ) ) ( not ( = ?auto_452664 ?auto_452665 ) ) ( not ( = ?auto_452664 ?auto_452666 ) ) ( not ( = ?auto_452664 ?auto_452667 ) ) ( not ( = ?auto_452664 ?auto_452668 ) ) ( not ( = ?auto_452665 ?auto_452666 ) ) ( not ( = ?auto_452665 ?auto_452667 ) ) ( not ( = ?auto_452665 ?auto_452668 ) ) ( not ( = ?auto_452666 ?auto_452667 ) ) ( not ( = ?auto_452666 ?auto_452668 ) ) ( not ( = ?auto_452667 ?auto_452668 ) ) ( ON ?auto_452666 ?auto_452667 ) ( ON ?auto_452665 ?auto_452666 ) ( ON ?auto_452664 ?auto_452665 ) ( ON ?auto_452663 ?auto_452664 ) ( ON ?auto_452662 ?auto_452663 ) ( ON ?auto_452661 ?auto_452662 ) ( ON ?auto_452660 ?auto_452661 ) ( ON ?auto_452659 ?auto_452660 ) ( ON ?auto_452658 ?auto_452659 ) ( ON ?auto_452657 ?auto_452658 ) ( CLEAR ?auto_452655 ) ( ON ?auto_452656 ?auto_452657 ) ( CLEAR ?auto_452656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_452655 ?auto_452656 )
      ( MAKE-13PILE ?auto_452655 ?auto_452656 ?auto_452657 ?auto_452658 ?auto_452659 ?auto_452660 ?auto_452661 ?auto_452662 ?auto_452663 ?auto_452664 ?auto_452665 ?auto_452666 ?auto_452667 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452682 - BLOCK
      ?auto_452683 - BLOCK
      ?auto_452684 - BLOCK
      ?auto_452685 - BLOCK
      ?auto_452686 - BLOCK
      ?auto_452687 - BLOCK
      ?auto_452688 - BLOCK
      ?auto_452689 - BLOCK
      ?auto_452690 - BLOCK
      ?auto_452691 - BLOCK
      ?auto_452692 - BLOCK
      ?auto_452693 - BLOCK
      ?auto_452694 - BLOCK
    )
    :vars
    (
      ?auto_452695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452694 ?auto_452695 ) ( ON-TABLE ?auto_452682 ) ( not ( = ?auto_452682 ?auto_452683 ) ) ( not ( = ?auto_452682 ?auto_452684 ) ) ( not ( = ?auto_452682 ?auto_452685 ) ) ( not ( = ?auto_452682 ?auto_452686 ) ) ( not ( = ?auto_452682 ?auto_452687 ) ) ( not ( = ?auto_452682 ?auto_452688 ) ) ( not ( = ?auto_452682 ?auto_452689 ) ) ( not ( = ?auto_452682 ?auto_452690 ) ) ( not ( = ?auto_452682 ?auto_452691 ) ) ( not ( = ?auto_452682 ?auto_452692 ) ) ( not ( = ?auto_452682 ?auto_452693 ) ) ( not ( = ?auto_452682 ?auto_452694 ) ) ( not ( = ?auto_452682 ?auto_452695 ) ) ( not ( = ?auto_452683 ?auto_452684 ) ) ( not ( = ?auto_452683 ?auto_452685 ) ) ( not ( = ?auto_452683 ?auto_452686 ) ) ( not ( = ?auto_452683 ?auto_452687 ) ) ( not ( = ?auto_452683 ?auto_452688 ) ) ( not ( = ?auto_452683 ?auto_452689 ) ) ( not ( = ?auto_452683 ?auto_452690 ) ) ( not ( = ?auto_452683 ?auto_452691 ) ) ( not ( = ?auto_452683 ?auto_452692 ) ) ( not ( = ?auto_452683 ?auto_452693 ) ) ( not ( = ?auto_452683 ?auto_452694 ) ) ( not ( = ?auto_452683 ?auto_452695 ) ) ( not ( = ?auto_452684 ?auto_452685 ) ) ( not ( = ?auto_452684 ?auto_452686 ) ) ( not ( = ?auto_452684 ?auto_452687 ) ) ( not ( = ?auto_452684 ?auto_452688 ) ) ( not ( = ?auto_452684 ?auto_452689 ) ) ( not ( = ?auto_452684 ?auto_452690 ) ) ( not ( = ?auto_452684 ?auto_452691 ) ) ( not ( = ?auto_452684 ?auto_452692 ) ) ( not ( = ?auto_452684 ?auto_452693 ) ) ( not ( = ?auto_452684 ?auto_452694 ) ) ( not ( = ?auto_452684 ?auto_452695 ) ) ( not ( = ?auto_452685 ?auto_452686 ) ) ( not ( = ?auto_452685 ?auto_452687 ) ) ( not ( = ?auto_452685 ?auto_452688 ) ) ( not ( = ?auto_452685 ?auto_452689 ) ) ( not ( = ?auto_452685 ?auto_452690 ) ) ( not ( = ?auto_452685 ?auto_452691 ) ) ( not ( = ?auto_452685 ?auto_452692 ) ) ( not ( = ?auto_452685 ?auto_452693 ) ) ( not ( = ?auto_452685 ?auto_452694 ) ) ( not ( = ?auto_452685 ?auto_452695 ) ) ( not ( = ?auto_452686 ?auto_452687 ) ) ( not ( = ?auto_452686 ?auto_452688 ) ) ( not ( = ?auto_452686 ?auto_452689 ) ) ( not ( = ?auto_452686 ?auto_452690 ) ) ( not ( = ?auto_452686 ?auto_452691 ) ) ( not ( = ?auto_452686 ?auto_452692 ) ) ( not ( = ?auto_452686 ?auto_452693 ) ) ( not ( = ?auto_452686 ?auto_452694 ) ) ( not ( = ?auto_452686 ?auto_452695 ) ) ( not ( = ?auto_452687 ?auto_452688 ) ) ( not ( = ?auto_452687 ?auto_452689 ) ) ( not ( = ?auto_452687 ?auto_452690 ) ) ( not ( = ?auto_452687 ?auto_452691 ) ) ( not ( = ?auto_452687 ?auto_452692 ) ) ( not ( = ?auto_452687 ?auto_452693 ) ) ( not ( = ?auto_452687 ?auto_452694 ) ) ( not ( = ?auto_452687 ?auto_452695 ) ) ( not ( = ?auto_452688 ?auto_452689 ) ) ( not ( = ?auto_452688 ?auto_452690 ) ) ( not ( = ?auto_452688 ?auto_452691 ) ) ( not ( = ?auto_452688 ?auto_452692 ) ) ( not ( = ?auto_452688 ?auto_452693 ) ) ( not ( = ?auto_452688 ?auto_452694 ) ) ( not ( = ?auto_452688 ?auto_452695 ) ) ( not ( = ?auto_452689 ?auto_452690 ) ) ( not ( = ?auto_452689 ?auto_452691 ) ) ( not ( = ?auto_452689 ?auto_452692 ) ) ( not ( = ?auto_452689 ?auto_452693 ) ) ( not ( = ?auto_452689 ?auto_452694 ) ) ( not ( = ?auto_452689 ?auto_452695 ) ) ( not ( = ?auto_452690 ?auto_452691 ) ) ( not ( = ?auto_452690 ?auto_452692 ) ) ( not ( = ?auto_452690 ?auto_452693 ) ) ( not ( = ?auto_452690 ?auto_452694 ) ) ( not ( = ?auto_452690 ?auto_452695 ) ) ( not ( = ?auto_452691 ?auto_452692 ) ) ( not ( = ?auto_452691 ?auto_452693 ) ) ( not ( = ?auto_452691 ?auto_452694 ) ) ( not ( = ?auto_452691 ?auto_452695 ) ) ( not ( = ?auto_452692 ?auto_452693 ) ) ( not ( = ?auto_452692 ?auto_452694 ) ) ( not ( = ?auto_452692 ?auto_452695 ) ) ( not ( = ?auto_452693 ?auto_452694 ) ) ( not ( = ?auto_452693 ?auto_452695 ) ) ( not ( = ?auto_452694 ?auto_452695 ) ) ( ON ?auto_452693 ?auto_452694 ) ( ON ?auto_452692 ?auto_452693 ) ( ON ?auto_452691 ?auto_452692 ) ( ON ?auto_452690 ?auto_452691 ) ( ON ?auto_452689 ?auto_452690 ) ( ON ?auto_452688 ?auto_452689 ) ( ON ?auto_452687 ?auto_452688 ) ( ON ?auto_452686 ?auto_452687 ) ( ON ?auto_452685 ?auto_452686 ) ( ON ?auto_452684 ?auto_452685 ) ( CLEAR ?auto_452682 ) ( ON ?auto_452683 ?auto_452684 ) ( CLEAR ?auto_452683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_452682 ?auto_452683 )
      ( MAKE-13PILE ?auto_452682 ?auto_452683 ?auto_452684 ?auto_452685 ?auto_452686 ?auto_452687 ?auto_452688 ?auto_452689 ?auto_452690 ?auto_452691 ?auto_452692 ?auto_452693 ?auto_452694 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452709 - BLOCK
      ?auto_452710 - BLOCK
      ?auto_452711 - BLOCK
      ?auto_452712 - BLOCK
      ?auto_452713 - BLOCK
      ?auto_452714 - BLOCK
      ?auto_452715 - BLOCK
      ?auto_452716 - BLOCK
      ?auto_452717 - BLOCK
      ?auto_452718 - BLOCK
      ?auto_452719 - BLOCK
      ?auto_452720 - BLOCK
      ?auto_452721 - BLOCK
    )
    :vars
    (
      ?auto_452722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452721 ?auto_452722 ) ( not ( = ?auto_452709 ?auto_452710 ) ) ( not ( = ?auto_452709 ?auto_452711 ) ) ( not ( = ?auto_452709 ?auto_452712 ) ) ( not ( = ?auto_452709 ?auto_452713 ) ) ( not ( = ?auto_452709 ?auto_452714 ) ) ( not ( = ?auto_452709 ?auto_452715 ) ) ( not ( = ?auto_452709 ?auto_452716 ) ) ( not ( = ?auto_452709 ?auto_452717 ) ) ( not ( = ?auto_452709 ?auto_452718 ) ) ( not ( = ?auto_452709 ?auto_452719 ) ) ( not ( = ?auto_452709 ?auto_452720 ) ) ( not ( = ?auto_452709 ?auto_452721 ) ) ( not ( = ?auto_452709 ?auto_452722 ) ) ( not ( = ?auto_452710 ?auto_452711 ) ) ( not ( = ?auto_452710 ?auto_452712 ) ) ( not ( = ?auto_452710 ?auto_452713 ) ) ( not ( = ?auto_452710 ?auto_452714 ) ) ( not ( = ?auto_452710 ?auto_452715 ) ) ( not ( = ?auto_452710 ?auto_452716 ) ) ( not ( = ?auto_452710 ?auto_452717 ) ) ( not ( = ?auto_452710 ?auto_452718 ) ) ( not ( = ?auto_452710 ?auto_452719 ) ) ( not ( = ?auto_452710 ?auto_452720 ) ) ( not ( = ?auto_452710 ?auto_452721 ) ) ( not ( = ?auto_452710 ?auto_452722 ) ) ( not ( = ?auto_452711 ?auto_452712 ) ) ( not ( = ?auto_452711 ?auto_452713 ) ) ( not ( = ?auto_452711 ?auto_452714 ) ) ( not ( = ?auto_452711 ?auto_452715 ) ) ( not ( = ?auto_452711 ?auto_452716 ) ) ( not ( = ?auto_452711 ?auto_452717 ) ) ( not ( = ?auto_452711 ?auto_452718 ) ) ( not ( = ?auto_452711 ?auto_452719 ) ) ( not ( = ?auto_452711 ?auto_452720 ) ) ( not ( = ?auto_452711 ?auto_452721 ) ) ( not ( = ?auto_452711 ?auto_452722 ) ) ( not ( = ?auto_452712 ?auto_452713 ) ) ( not ( = ?auto_452712 ?auto_452714 ) ) ( not ( = ?auto_452712 ?auto_452715 ) ) ( not ( = ?auto_452712 ?auto_452716 ) ) ( not ( = ?auto_452712 ?auto_452717 ) ) ( not ( = ?auto_452712 ?auto_452718 ) ) ( not ( = ?auto_452712 ?auto_452719 ) ) ( not ( = ?auto_452712 ?auto_452720 ) ) ( not ( = ?auto_452712 ?auto_452721 ) ) ( not ( = ?auto_452712 ?auto_452722 ) ) ( not ( = ?auto_452713 ?auto_452714 ) ) ( not ( = ?auto_452713 ?auto_452715 ) ) ( not ( = ?auto_452713 ?auto_452716 ) ) ( not ( = ?auto_452713 ?auto_452717 ) ) ( not ( = ?auto_452713 ?auto_452718 ) ) ( not ( = ?auto_452713 ?auto_452719 ) ) ( not ( = ?auto_452713 ?auto_452720 ) ) ( not ( = ?auto_452713 ?auto_452721 ) ) ( not ( = ?auto_452713 ?auto_452722 ) ) ( not ( = ?auto_452714 ?auto_452715 ) ) ( not ( = ?auto_452714 ?auto_452716 ) ) ( not ( = ?auto_452714 ?auto_452717 ) ) ( not ( = ?auto_452714 ?auto_452718 ) ) ( not ( = ?auto_452714 ?auto_452719 ) ) ( not ( = ?auto_452714 ?auto_452720 ) ) ( not ( = ?auto_452714 ?auto_452721 ) ) ( not ( = ?auto_452714 ?auto_452722 ) ) ( not ( = ?auto_452715 ?auto_452716 ) ) ( not ( = ?auto_452715 ?auto_452717 ) ) ( not ( = ?auto_452715 ?auto_452718 ) ) ( not ( = ?auto_452715 ?auto_452719 ) ) ( not ( = ?auto_452715 ?auto_452720 ) ) ( not ( = ?auto_452715 ?auto_452721 ) ) ( not ( = ?auto_452715 ?auto_452722 ) ) ( not ( = ?auto_452716 ?auto_452717 ) ) ( not ( = ?auto_452716 ?auto_452718 ) ) ( not ( = ?auto_452716 ?auto_452719 ) ) ( not ( = ?auto_452716 ?auto_452720 ) ) ( not ( = ?auto_452716 ?auto_452721 ) ) ( not ( = ?auto_452716 ?auto_452722 ) ) ( not ( = ?auto_452717 ?auto_452718 ) ) ( not ( = ?auto_452717 ?auto_452719 ) ) ( not ( = ?auto_452717 ?auto_452720 ) ) ( not ( = ?auto_452717 ?auto_452721 ) ) ( not ( = ?auto_452717 ?auto_452722 ) ) ( not ( = ?auto_452718 ?auto_452719 ) ) ( not ( = ?auto_452718 ?auto_452720 ) ) ( not ( = ?auto_452718 ?auto_452721 ) ) ( not ( = ?auto_452718 ?auto_452722 ) ) ( not ( = ?auto_452719 ?auto_452720 ) ) ( not ( = ?auto_452719 ?auto_452721 ) ) ( not ( = ?auto_452719 ?auto_452722 ) ) ( not ( = ?auto_452720 ?auto_452721 ) ) ( not ( = ?auto_452720 ?auto_452722 ) ) ( not ( = ?auto_452721 ?auto_452722 ) ) ( ON ?auto_452720 ?auto_452721 ) ( ON ?auto_452719 ?auto_452720 ) ( ON ?auto_452718 ?auto_452719 ) ( ON ?auto_452717 ?auto_452718 ) ( ON ?auto_452716 ?auto_452717 ) ( ON ?auto_452715 ?auto_452716 ) ( ON ?auto_452714 ?auto_452715 ) ( ON ?auto_452713 ?auto_452714 ) ( ON ?auto_452712 ?auto_452713 ) ( ON ?auto_452711 ?auto_452712 ) ( ON ?auto_452710 ?auto_452711 ) ( ON ?auto_452709 ?auto_452710 ) ( CLEAR ?auto_452709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_452709 )
      ( MAKE-13PILE ?auto_452709 ?auto_452710 ?auto_452711 ?auto_452712 ?auto_452713 ?auto_452714 ?auto_452715 ?auto_452716 ?auto_452717 ?auto_452718 ?auto_452719 ?auto_452720 ?auto_452721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_452736 - BLOCK
      ?auto_452737 - BLOCK
      ?auto_452738 - BLOCK
      ?auto_452739 - BLOCK
      ?auto_452740 - BLOCK
      ?auto_452741 - BLOCK
      ?auto_452742 - BLOCK
      ?auto_452743 - BLOCK
      ?auto_452744 - BLOCK
      ?auto_452745 - BLOCK
      ?auto_452746 - BLOCK
      ?auto_452747 - BLOCK
      ?auto_452748 - BLOCK
    )
    :vars
    (
      ?auto_452749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452748 ?auto_452749 ) ( not ( = ?auto_452736 ?auto_452737 ) ) ( not ( = ?auto_452736 ?auto_452738 ) ) ( not ( = ?auto_452736 ?auto_452739 ) ) ( not ( = ?auto_452736 ?auto_452740 ) ) ( not ( = ?auto_452736 ?auto_452741 ) ) ( not ( = ?auto_452736 ?auto_452742 ) ) ( not ( = ?auto_452736 ?auto_452743 ) ) ( not ( = ?auto_452736 ?auto_452744 ) ) ( not ( = ?auto_452736 ?auto_452745 ) ) ( not ( = ?auto_452736 ?auto_452746 ) ) ( not ( = ?auto_452736 ?auto_452747 ) ) ( not ( = ?auto_452736 ?auto_452748 ) ) ( not ( = ?auto_452736 ?auto_452749 ) ) ( not ( = ?auto_452737 ?auto_452738 ) ) ( not ( = ?auto_452737 ?auto_452739 ) ) ( not ( = ?auto_452737 ?auto_452740 ) ) ( not ( = ?auto_452737 ?auto_452741 ) ) ( not ( = ?auto_452737 ?auto_452742 ) ) ( not ( = ?auto_452737 ?auto_452743 ) ) ( not ( = ?auto_452737 ?auto_452744 ) ) ( not ( = ?auto_452737 ?auto_452745 ) ) ( not ( = ?auto_452737 ?auto_452746 ) ) ( not ( = ?auto_452737 ?auto_452747 ) ) ( not ( = ?auto_452737 ?auto_452748 ) ) ( not ( = ?auto_452737 ?auto_452749 ) ) ( not ( = ?auto_452738 ?auto_452739 ) ) ( not ( = ?auto_452738 ?auto_452740 ) ) ( not ( = ?auto_452738 ?auto_452741 ) ) ( not ( = ?auto_452738 ?auto_452742 ) ) ( not ( = ?auto_452738 ?auto_452743 ) ) ( not ( = ?auto_452738 ?auto_452744 ) ) ( not ( = ?auto_452738 ?auto_452745 ) ) ( not ( = ?auto_452738 ?auto_452746 ) ) ( not ( = ?auto_452738 ?auto_452747 ) ) ( not ( = ?auto_452738 ?auto_452748 ) ) ( not ( = ?auto_452738 ?auto_452749 ) ) ( not ( = ?auto_452739 ?auto_452740 ) ) ( not ( = ?auto_452739 ?auto_452741 ) ) ( not ( = ?auto_452739 ?auto_452742 ) ) ( not ( = ?auto_452739 ?auto_452743 ) ) ( not ( = ?auto_452739 ?auto_452744 ) ) ( not ( = ?auto_452739 ?auto_452745 ) ) ( not ( = ?auto_452739 ?auto_452746 ) ) ( not ( = ?auto_452739 ?auto_452747 ) ) ( not ( = ?auto_452739 ?auto_452748 ) ) ( not ( = ?auto_452739 ?auto_452749 ) ) ( not ( = ?auto_452740 ?auto_452741 ) ) ( not ( = ?auto_452740 ?auto_452742 ) ) ( not ( = ?auto_452740 ?auto_452743 ) ) ( not ( = ?auto_452740 ?auto_452744 ) ) ( not ( = ?auto_452740 ?auto_452745 ) ) ( not ( = ?auto_452740 ?auto_452746 ) ) ( not ( = ?auto_452740 ?auto_452747 ) ) ( not ( = ?auto_452740 ?auto_452748 ) ) ( not ( = ?auto_452740 ?auto_452749 ) ) ( not ( = ?auto_452741 ?auto_452742 ) ) ( not ( = ?auto_452741 ?auto_452743 ) ) ( not ( = ?auto_452741 ?auto_452744 ) ) ( not ( = ?auto_452741 ?auto_452745 ) ) ( not ( = ?auto_452741 ?auto_452746 ) ) ( not ( = ?auto_452741 ?auto_452747 ) ) ( not ( = ?auto_452741 ?auto_452748 ) ) ( not ( = ?auto_452741 ?auto_452749 ) ) ( not ( = ?auto_452742 ?auto_452743 ) ) ( not ( = ?auto_452742 ?auto_452744 ) ) ( not ( = ?auto_452742 ?auto_452745 ) ) ( not ( = ?auto_452742 ?auto_452746 ) ) ( not ( = ?auto_452742 ?auto_452747 ) ) ( not ( = ?auto_452742 ?auto_452748 ) ) ( not ( = ?auto_452742 ?auto_452749 ) ) ( not ( = ?auto_452743 ?auto_452744 ) ) ( not ( = ?auto_452743 ?auto_452745 ) ) ( not ( = ?auto_452743 ?auto_452746 ) ) ( not ( = ?auto_452743 ?auto_452747 ) ) ( not ( = ?auto_452743 ?auto_452748 ) ) ( not ( = ?auto_452743 ?auto_452749 ) ) ( not ( = ?auto_452744 ?auto_452745 ) ) ( not ( = ?auto_452744 ?auto_452746 ) ) ( not ( = ?auto_452744 ?auto_452747 ) ) ( not ( = ?auto_452744 ?auto_452748 ) ) ( not ( = ?auto_452744 ?auto_452749 ) ) ( not ( = ?auto_452745 ?auto_452746 ) ) ( not ( = ?auto_452745 ?auto_452747 ) ) ( not ( = ?auto_452745 ?auto_452748 ) ) ( not ( = ?auto_452745 ?auto_452749 ) ) ( not ( = ?auto_452746 ?auto_452747 ) ) ( not ( = ?auto_452746 ?auto_452748 ) ) ( not ( = ?auto_452746 ?auto_452749 ) ) ( not ( = ?auto_452747 ?auto_452748 ) ) ( not ( = ?auto_452747 ?auto_452749 ) ) ( not ( = ?auto_452748 ?auto_452749 ) ) ( ON ?auto_452747 ?auto_452748 ) ( ON ?auto_452746 ?auto_452747 ) ( ON ?auto_452745 ?auto_452746 ) ( ON ?auto_452744 ?auto_452745 ) ( ON ?auto_452743 ?auto_452744 ) ( ON ?auto_452742 ?auto_452743 ) ( ON ?auto_452741 ?auto_452742 ) ( ON ?auto_452740 ?auto_452741 ) ( ON ?auto_452739 ?auto_452740 ) ( ON ?auto_452738 ?auto_452739 ) ( ON ?auto_452737 ?auto_452738 ) ( ON ?auto_452736 ?auto_452737 ) ( CLEAR ?auto_452736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_452736 )
      ( MAKE-13PILE ?auto_452736 ?auto_452737 ?auto_452738 ?auto_452739 ?auto_452740 ?auto_452741 ?auto_452742 ?auto_452743 ?auto_452744 ?auto_452745 ?auto_452746 ?auto_452747 ?auto_452748 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452764 - BLOCK
      ?auto_452765 - BLOCK
      ?auto_452766 - BLOCK
      ?auto_452767 - BLOCK
      ?auto_452768 - BLOCK
      ?auto_452769 - BLOCK
      ?auto_452770 - BLOCK
      ?auto_452771 - BLOCK
      ?auto_452772 - BLOCK
      ?auto_452773 - BLOCK
      ?auto_452774 - BLOCK
      ?auto_452775 - BLOCK
      ?auto_452776 - BLOCK
      ?auto_452777 - BLOCK
    )
    :vars
    (
      ?auto_452778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_452776 ) ( ON ?auto_452777 ?auto_452778 ) ( CLEAR ?auto_452777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_452764 ) ( ON ?auto_452765 ?auto_452764 ) ( ON ?auto_452766 ?auto_452765 ) ( ON ?auto_452767 ?auto_452766 ) ( ON ?auto_452768 ?auto_452767 ) ( ON ?auto_452769 ?auto_452768 ) ( ON ?auto_452770 ?auto_452769 ) ( ON ?auto_452771 ?auto_452770 ) ( ON ?auto_452772 ?auto_452771 ) ( ON ?auto_452773 ?auto_452772 ) ( ON ?auto_452774 ?auto_452773 ) ( ON ?auto_452775 ?auto_452774 ) ( ON ?auto_452776 ?auto_452775 ) ( not ( = ?auto_452764 ?auto_452765 ) ) ( not ( = ?auto_452764 ?auto_452766 ) ) ( not ( = ?auto_452764 ?auto_452767 ) ) ( not ( = ?auto_452764 ?auto_452768 ) ) ( not ( = ?auto_452764 ?auto_452769 ) ) ( not ( = ?auto_452764 ?auto_452770 ) ) ( not ( = ?auto_452764 ?auto_452771 ) ) ( not ( = ?auto_452764 ?auto_452772 ) ) ( not ( = ?auto_452764 ?auto_452773 ) ) ( not ( = ?auto_452764 ?auto_452774 ) ) ( not ( = ?auto_452764 ?auto_452775 ) ) ( not ( = ?auto_452764 ?auto_452776 ) ) ( not ( = ?auto_452764 ?auto_452777 ) ) ( not ( = ?auto_452764 ?auto_452778 ) ) ( not ( = ?auto_452765 ?auto_452766 ) ) ( not ( = ?auto_452765 ?auto_452767 ) ) ( not ( = ?auto_452765 ?auto_452768 ) ) ( not ( = ?auto_452765 ?auto_452769 ) ) ( not ( = ?auto_452765 ?auto_452770 ) ) ( not ( = ?auto_452765 ?auto_452771 ) ) ( not ( = ?auto_452765 ?auto_452772 ) ) ( not ( = ?auto_452765 ?auto_452773 ) ) ( not ( = ?auto_452765 ?auto_452774 ) ) ( not ( = ?auto_452765 ?auto_452775 ) ) ( not ( = ?auto_452765 ?auto_452776 ) ) ( not ( = ?auto_452765 ?auto_452777 ) ) ( not ( = ?auto_452765 ?auto_452778 ) ) ( not ( = ?auto_452766 ?auto_452767 ) ) ( not ( = ?auto_452766 ?auto_452768 ) ) ( not ( = ?auto_452766 ?auto_452769 ) ) ( not ( = ?auto_452766 ?auto_452770 ) ) ( not ( = ?auto_452766 ?auto_452771 ) ) ( not ( = ?auto_452766 ?auto_452772 ) ) ( not ( = ?auto_452766 ?auto_452773 ) ) ( not ( = ?auto_452766 ?auto_452774 ) ) ( not ( = ?auto_452766 ?auto_452775 ) ) ( not ( = ?auto_452766 ?auto_452776 ) ) ( not ( = ?auto_452766 ?auto_452777 ) ) ( not ( = ?auto_452766 ?auto_452778 ) ) ( not ( = ?auto_452767 ?auto_452768 ) ) ( not ( = ?auto_452767 ?auto_452769 ) ) ( not ( = ?auto_452767 ?auto_452770 ) ) ( not ( = ?auto_452767 ?auto_452771 ) ) ( not ( = ?auto_452767 ?auto_452772 ) ) ( not ( = ?auto_452767 ?auto_452773 ) ) ( not ( = ?auto_452767 ?auto_452774 ) ) ( not ( = ?auto_452767 ?auto_452775 ) ) ( not ( = ?auto_452767 ?auto_452776 ) ) ( not ( = ?auto_452767 ?auto_452777 ) ) ( not ( = ?auto_452767 ?auto_452778 ) ) ( not ( = ?auto_452768 ?auto_452769 ) ) ( not ( = ?auto_452768 ?auto_452770 ) ) ( not ( = ?auto_452768 ?auto_452771 ) ) ( not ( = ?auto_452768 ?auto_452772 ) ) ( not ( = ?auto_452768 ?auto_452773 ) ) ( not ( = ?auto_452768 ?auto_452774 ) ) ( not ( = ?auto_452768 ?auto_452775 ) ) ( not ( = ?auto_452768 ?auto_452776 ) ) ( not ( = ?auto_452768 ?auto_452777 ) ) ( not ( = ?auto_452768 ?auto_452778 ) ) ( not ( = ?auto_452769 ?auto_452770 ) ) ( not ( = ?auto_452769 ?auto_452771 ) ) ( not ( = ?auto_452769 ?auto_452772 ) ) ( not ( = ?auto_452769 ?auto_452773 ) ) ( not ( = ?auto_452769 ?auto_452774 ) ) ( not ( = ?auto_452769 ?auto_452775 ) ) ( not ( = ?auto_452769 ?auto_452776 ) ) ( not ( = ?auto_452769 ?auto_452777 ) ) ( not ( = ?auto_452769 ?auto_452778 ) ) ( not ( = ?auto_452770 ?auto_452771 ) ) ( not ( = ?auto_452770 ?auto_452772 ) ) ( not ( = ?auto_452770 ?auto_452773 ) ) ( not ( = ?auto_452770 ?auto_452774 ) ) ( not ( = ?auto_452770 ?auto_452775 ) ) ( not ( = ?auto_452770 ?auto_452776 ) ) ( not ( = ?auto_452770 ?auto_452777 ) ) ( not ( = ?auto_452770 ?auto_452778 ) ) ( not ( = ?auto_452771 ?auto_452772 ) ) ( not ( = ?auto_452771 ?auto_452773 ) ) ( not ( = ?auto_452771 ?auto_452774 ) ) ( not ( = ?auto_452771 ?auto_452775 ) ) ( not ( = ?auto_452771 ?auto_452776 ) ) ( not ( = ?auto_452771 ?auto_452777 ) ) ( not ( = ?auto_452771 ?auto_452778 ) ) ( not ( = ?auto_452772 ?auto_452773 ) ) ( not ( = ?auto_452772 ?auto_452774 ) ) ( not ( = ?auto_452772 ?auto_452775 ) ) ( not ( = ?auto_452772 ?auto_452776 ) ) ( not ( = ?auto_452772 ?auto_452777 ) ) ( not ( = ?auto_452772 ?auto_452778 ) ) ( not ( = ?auto_452773 ?auto_452774 ) ) ( not ( = ?auto_452773 ?auto_452775 ) ) ( not ( = ?auto_452773 ?auto_452776 ) ) ( not ( = ?auto_452773 ?auto_452777 ) ) ( not ( = ?auto_452773 ?auto_452778 ) ) ( not ( = ?auto_452774 ?auto_452775 ) ) ( not ( = ?auto_452774 ?auto_452776 ) ) ( not ( = ?auto_452774 ?auto_452777 ) ) ( not ( = ?auto_452774 ?auto_452778 ) ) ( not ( = ?auto_452775 ?auto_452776 ) ) ( not ( = ?auto_452775 ?auto_452777 ) ) ( not ( = ?auto_452775 ?auto_452778 ) ) ( not ( = ?auto_452776 ?auto_452777 ) ) ( not ( = ?auto_452776 ?auto_452778 ) ) ( not ( = ?auto_452777 ?auto_452778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_452777 ?auto_452778 )
      ( !STACK ?auto_452777 ?auto_452776 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452793 - BLOCK
      ?auto_452794 - BLOCK
      ?auto_452795 - BLOCK
      ?auto_452796 - BLOCK
      ?auto_452797 - BLOCK
      ?auto_452798 - BLOCK
      ?auto_452799 - BLOCK
      ?auto_452800 - BLOCK
      ?auto_452801 - BLOCK
      ?auto_452802 - BLOCK
      ?auto_452803 - BLOCK
      ?auto_452804 - BLOCK
      ?auto_452805 - BLOCK
      ?auto_452806 - BLOCK
    )
    :vars
    (
      ?auto_452807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_452805 ) ( ON ?auto_452806 ?auto_452807 ) ( CLEAR ?auto_452806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_452793 ) ( ON ?auto_452794 ?auto_452793 ) ( ON ?auto_452795 ?auto_452794 ) ( ON ?auto_452796 ?auto_452795 ) ( ON ?auto_452797 ?auto_452796 ) ( ON ?auto_452798 ?auto_452797 ) ( ON ?auto_452799 ?auto_452798 ) ( ON ?auto_452800 ?auto_452799 ) ( ON ?auto_452801 ?auto_452800 ) ( ON ?auto_452802 ?auto_452801 ) ( ON ?auto_452803 ?auto_452802 ) ( ON ?auto_452804 ?auto_452803 ) ( ON ?auto_452805 ?auto_452804 ) ( not ( = ?auto_452793 ?auto_452794 ) ) ( not ( = ?auto_452793 ?auto_452795 ) ) ( not ( = ?auto_452793 ?auto_452796 ) ) ( not ( = ?auto_452793 ?auto_452797 ) ) ( not ( = ?auto_452793 ?auto_452798 ) ) ( not ( = ?auto_452793 ?auto_452799 ) ) ( not ( = ?auto_452793 ?auto_452800 ) ) ( not ( = ?auto_452793 ?auto_452801 ) ) ( not ( = ?auto_452793 ?auto_452802 ) ) ( not ( = ?auto_452793 ?auto_452803 ) ) ( not ( = ?auto_452793 ?auto_452804 ) ) ( not ( = ?auto_452793 ?auto_452805 ) ) ( not ( = ?auto_452793 ?auto_452806 ) ) ( not ( = ?auto_452793 ?auto_452807 ) ) ( not ( = ?auto_452794 ?auto_452795 ) ) ( not ( = ?auto_452794 ?auto_452796 ) ) ( not ( = ?auto_452794 ?auto_452797 ) ) ( not ( = ?auto_452794 ?auto_452798 ) ) ( not ( = ?auto_452794 ?auto_452799 ) ) ( not ( = ?auto_452794 ?auto_452800 ) ) ( not ( = ?auto_452794 ?auto_452801 ) ) ( not ( = ?auto_452794 ?auto_452802 ) ) ( not ( = ?auto_452794 ?auto_452803 ) ) ( not ( = ?auto_452794 ?auto_452804 ) ) ( not ( = ?auto_452794 ?auto_452805 ) ) ( not ( = ?auto_452794 ?auto_452806 ) ) ( not ( = ?auto_452794 ?auto_452807 ) ) ( not ( = ?auto_452795 ?auto_452796 ) ) ( not ( = ?auto_452795 ?auto_452797 ) ) ( not ( = ?auto_452795 ?auto_452798 ) ) ( not ( = ?auto_452795 ?auto_452799 ) ) ( not ( = ?auto_452795 ?auto_452800 ) ) ( not ( = ?auto_452795 ?auto_452801 ) ) ( not ( = ?auto_452795 ?auto_452802 ) ) ( not ( = ?auto_452795 ?auto_452803 ) ) ( not ( = ?auto_452795 ?auto_452804 ) ) ( not ( = ?auto_452795 ?auto_452805 ) ) ( not ( = ?auto_452795 ?auto_452806 ) ) ( not ( = ?auto_452795 ?auto_452807 ) ) ( not ( = ?auto_452796 ?auto_452797 ) ) ( not ( = ?auto_452796 ?auto_452798 ) ) ( not ( = ?auto_452796 ?auto_452799 ) ) ( not ( = ?auto_452796 ?auto_452800 ) ) ( not ( = ?auto_452796 ?auto_452801 ) ) ( not ( = ?auto_452796 ?auto_452802 ) ) ( not ( = ?auto_452796 ?auto_452803 ) ) ( not ( = ?auto_452796 ?auto_452804 ) ) ( not ( = ?auto_452796 ?auto_452805 ) ) ( not ( = ?auto_452796 ?auto_452806 ) ) ( not ( = ?auto_452796 ?auto_452807 ) ) ( not ( = ?auto_452797 ?auto_452798 ) ) ( not ( = ?auto_452797 ?auto_452799 ) ) ( not ( = ?auto_452797 ?auto_452800 ) ) ( not ( = ?auto_452797 ?auto_452801 ) ) ( not ( = ?auto_452797 ?auto_452802 ) ) ( not ( = ?auto_452797 ?auto_452803 ) ) ( not ( = ?auto_452797 ?auto_452804 ) ) ( not ( = ?auto_452797 ?auto_452805 ) ) ( not ( = ?auto_452797 ?auto_452806 ) ) ( not ( = ?auto_452797 ?auto_452807 ) ) ( not ( = ?auto_452798 ?auto_452799 ) ) ( not ( = ?auto_452798 ?auto_452800 ) ) ( not ( = ?auto_452798 ?auto_452801 ) ) ( not ( = ?auto_452798 ?auto_452802 ) ) ( not ( = ?auto_452798 ?auto_452803 ) ) ( not ( = ?auto_452798 ?auto_452804 ) ) ( not ( = ?auto_452798 ?auto_452805 ) ) ( not ( = ?auto_452798 ?auto_452806 ) ) ( not ( = ?auto_452798 ?auto_452807 ) ) ( not ( = ?auto_452799 ?auto_452800 ) ) ( not ( = ?auto_452799 ?auto_452801 ) ) ( not ( = ?auto_452799 ?auto_452802 ) ) ( not ( = ?auto_452799 ?auto_452803 ) ) ( not ( = ?auto_452799 ?auto_452804 ) ) ( not ( = ?auto_452799 ?auto_452805 ) ) ( not ( = ?auto_452799 ?auto_452806 ) ) ( not ( = ?auto_452799 ?auto_452807 ) ) ( not ( = ?auto_452800 ?auto_452801 ) ) ( not ( = ?auto_452800 ?auto_452802 ) ) ( not ( = ?auto_452800 ?auto_452803 ) ) ( not ( = ?auto_452800 ?auto_452804 ) ) ( not ( = ?auto_452800 ?auto_452805 ) ) ( not ( = ?auto_452800 ?auto_452806 ) ) ( not ( = ?auto_452800 ?auto_452807 ) ) ( not ( = ?auto_452801 ?auto_452802 ) ) ( not ( = ?auto_452801 ?auto_452803 ) ) ( not ( = ?auto_452801 ?auto_452804 ) ) ( not ( = ?auto_452801 ?auto_452805 ) ) ( not ( = ?auto_452801 ?auto_452806 ) ) ( not ( = ?auto_452801 ?auto_452807 ) ) ( not ( = ?auto_452802 ?auto_452803 ) ) ( not ( = ?auto_452802 ?auto_452804 ) ) ( not ( = ?auto_452802 ?auto_452805 ) ) ( not ( = ?auto_452802 ?auto_452806 ) ) ( not ( = ?auto_452802 ?auto_452807 ) ) ( not ( = ?auto_452803 ?auto_452804 ) ) ( not ( = ?auto_452803 ?auto_452805 ) ) ( not ( = ?auto_452803 ?auto_452806 ) ) ( not ( = ?auto_452803 ?auto_452807 ) ) ( not ( = ?auto_452804 ?auto_452805 ) ) ( not ( = ?auto_452804 ?auto_452806 ) ) ( not ( = ?auto_452804 ?auto_452807 ) ) ( not ( = ?auto_452805 ?auto_452806 ) ) ( not ( = ?auto_452805 ?auto_452807 ) ) ( not ( = ?auto_452806 ?auto_452807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_452806 ?auto_452807 )
      ( !STACK ?auto_452806 ?auto_452805 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452822 - BLOCK
      ?auto_452823 - BLOCK
      ?auto_452824 - BLOCK
      ?auto_452825 - BLOCK
      ?auto_452826 - BLOCK
      ?auto_452827 - BLOCK
      ?auto_452828 - BLOCK
      ?auto_452829 - BLOCK
      ?auto_452830 - BLOCK
      ?auto_452831 - BLOCK
      ?auto_452832 - BLOCK
      ?auto_452833 - BLOCK
      ?auto_452834 - BLOCK
      ?auto_452835 - BLOCK
    )
    :vars
    (
      ?auto_452836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452835 ?auto_452836 ) ( ON-TABLE ?auto_452822 ) ( ON ?auto_452823 ?auto_452822 ) ( ON ?auto_452824 ?auto_452823 ) ( ON ?auto_452825 ?auto_452824 ) ( ON ?auto_452826 ?auto_452825 ) ( ON ?auto_452827 ?auto_452826 ) ( ON ?auto_452828 ?auto_452827 ) ( ON ?auto_452829 ?auto_452828 ) ( ON ?auto_452830 ?auto_452829 ) ( ON ?auto_452831 ?auto_452830 ) ( ON ?auto_452832 ?auto_452831 ) ( ON ?auto_452833 ?auto_452832 ) ( not ( = ?auto_452822 ?auto_452823 ) ) ( not ( = ?auto_452822 ?auto_452824 ) ) ( not ( = ?auto_452822 ?auto_452825 ) ) ( not ( = ?auto_452822 ?auto_452826 ) ) ( not ( = ?auto_452822 ?auto_452827 ) ) ( not ( = ?auto_452822 ?auto_452828 ) ) ( not ( = ?auto_452822 ?auto_452829 ) ) ( not ( = ?auto_452822 ?auto_452830 ) ) ( not ( = ?auto_452822 ?auto_452831 ) ) ( not ( = ?auto_452822 ?auto_452832 ) ) ( not ( = ?auto_452822 ?auto_452833 ) ) ( not ( = ?auto_452822 ?auto_452834 ) ) ( not ( = ?auto_452822 ?auto_452835 ) ) ( not ( = ?auto_452822 ?auto_452836 ) ) ( not ( = ?auto_452823 ?auto_452824 ) ) ( not ( = ?auto_452823 ?auto_452825 ) ) ( not ( = ?auto_452823 ?auto_452826 ) ) ( not ( = ?auto_452823 ?auto_452827 ) ) ( not ( = ?auto_452823 ?auto_452828 ) ) ( not ( = ?auto_452823 ?auto_452829 ) ) ( not ( = ?auto_452823 ?auto_452830 ) ) ( not ( = ?auto_452823 ?auto_452831 ) ) ( not ( = ?auto_452823 ?auto_452832 ) ) ( not ( = ?auto_452823 ?auto_452833 ) ) ( not ( = ?auto_452823 ?auto_452834 ) ) ( not ( = ?auto_452823 ?auto_452835 ) ) ( not ( = ?auto_452823 ?auto_452836 ) ) ( not ( = ?auto_452824 ?auto_452825 ) ) ( not ( = ?auto_452824 ?auto_452826 ) ) ( not ( = ?auto_452824 ?auto_452827 ) ) ( not ( = ?auto_452824 ?auto_452828 ) ) ( not ( = ?auto_452824 ?auto_452829 ) ) ( not ( = ?auto_452824 ?auto_452830 ) ) ( not ( = ?auto_452824 ?auto_452831 ) ) ( not ( = ?auto_452824 ?auto_452832 ) ) ( not ( = ?auto_452824 ?auto_452833 ) ) ( not ( = ?auto_452824 ?auto_452834 ) ) ( not ( = ?auto_452824 ?auto_452835 ) ) ( not ( = ?auto_452824 ?auto_452836 ) ) ( not ( = ?auto_452825 ?auto_452826 ) ) ( not ( = ?auto_452825 ?auto_452827 ) ) ( not ( = ?auto_452825 ?auto_452828 ) ) ( not ( = ?auto_452825 ?auto_452829 ) ) ( not ( = ?auto_452825 ?auto_452830 ) ) ( not ( = ?auto_452825 ?auto_452831 ) ) ( not ( = ?auto_452825 ?auto_452832 ) ) ( not ( = ?auto_452825 ?auto_452833 ) ) ( not ( = ?auto_452825 ?auto_452834 ) ) ( not ( = ?auto_452825 ?auto_452835 ) ) ( not ( = ?auto_452825 ?auto_452836 ) ) ( not ( = ?auto_452826 ?auto_452827 ) ) ( not ( = ?auto_452826 ?auto_452828 ) ) ( not ( = ?auto_452826 ?auto_452829 ) ) ( not ( = ?auto_452826 ?auto_452830 ) ) ( not ( = ?auto_452826 ?auto_452831 ) ) ( not ( = ?auto_452826 ?auto_452832 ) ) ( not ( = ?auto_452826 ?auto_452833 ) ) ( not ( = ?auto_452826 ?auto_452834 ) ) ( not ( = ?auto_452826 ?auto_452835 ) ) ( not ( = ?auto_452826 ?auto_452836 ) ) ( not ( = ?auto_452827 ?auto_452828 ) ) ( not ( = ?auto_452827 ?auto_452829 ) ) ( not ( = ?auto_452827 ?auto_452830 ) ) ( not ( = ?auto_452827 ?auto_452831 ) ) ( not ( = ?auto_452827 ?auto_452832 ) ) ( not ( = ?auto_452827 ?auto_452833 ) ) ( not ( = ?auto_452827 ?auto_452834 ) ) ( not ( = ?auto_452827 ?auto_452835 ) ) ( not ( = ?auto_452827 ?auto_452836 ) ) ( not ( = ?auto_452828 ?auto_452829 ) ) ( not ( = ?auto_452828 ?auto_452830 ) ) ( not ( = ?auto_452828 ?auto_452831 ) ) ( not ( = ?auto_452828 ?auto_452832 ) ) ( not ( = ?auto_452828 ?auto_452833 ) ) ( not ( = ?auto_452828 ?auto_452834 ) ) ( not ( = ?auto_452828 ?auto_452835 ) ) ( not ( = ?auto_452828 ?auto_452836 ) ) ( not ( = ?auto_452829 ?auto_452830 ) ) ( not ( = ?auto_452829 ?auto_452831 ) ) ( not ( = ?auto_452829 ?auto_452832 ) ) ( not ( = ?auto_452829 ?auto_452833 ) ) ( not ( = ?auto_452829 ?auto_452834 ) ) ( not ( = ?auto_452829 ?auto_452835 ) ) ( not ( = ?auto_452829 ?auto_452836 ) ) ( not ( = ?auto_452830 ?auto_452831 ) ) ( not ( = ?auto_452830 ?auto_452832 ) ) ( not ( = ?auto_452830 ?auto_452833 ) ) ( not ( = ?auto_452830 ?auto_452834 ) ) ( not ( = ?auto_452830 ?auto_452835 ) ) ( not ( = ?auto_452830 ?auto_452836 ) ) ( not ( = ?auto_452831 ?auto_452832 ) ) ( not ( = ?auto_452831 ?auto_452833 ) ) ( not ( = ?auto_452831 ?auto_452834 ) ) ( not ( = ?auto_452831 ?auto_452835 ) ) ( not ( = ?auto_452831 ?auto_452836 ) ) ( not ( = ?auto_452832 ?auto_452833 ) ) ( not ( = ?auto_452832 ?auto_452834 ) ) ( not ( = ?auto_452832 ?auto_452835 ) ) ( not ( = ?auto_452832 ?auto_452836 ) ) ( not ( = ?auto_452833 ?auto_452834 ) ) ( not ( = ?auto_452833 ?auto_452835 ) ) ( not ( = ?auto_452833 ?auto_452836 ) ) ( not ( = ?auto_452834 ?auto_452835 ) ) ( not ( = ?auto_452834 ?auto_452836 ) ) ( not ( = ?auto_452835 ?auto_452836 ) ) ( CLEAR ?auto_452833 ) ( ON ?auto_452834 ?auto_452835 ) ( CLEAR ?auto_452834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_452822 ?auto_452823 ?auto_452824 ?auto_452825 ?auto_452826 ?auto_452827 ?auto_452828 ?auto_452829 ?auto_452830 ?auto_452831 ?auto_452832 ?auto_452833 ?auto_452834 )
      ( MAKE-14PILE ?auto_452822 ?auto_452823 ?auto_452824 ?auto_452825 ?auto_452826 ?auto_452827 ?auto_452828 ?auto_452829 ?auto_452830 ?auto_452831 ?auto_452832 ?auto_452833 ?auto_452834 ?auto_452835 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452851 - BLOCK
      ?auto_452852 - BLOCK
      ?auto_452853 - BLOCK
      ?auto_452854 - BLOCK
      ?auto_452855 - BLOCK
      ?auto_452856 - BLOCK
      ?auto_452857 - BLOCK
      ?auto_452858 - BLOCK
      ?auto_452859 - BLOCK
      ?auto_452860 - BLOCK
      ?auto_452861 - BLOCK
      ?auto_452862 - BLOCK
      ?auto_452863 - BLOCK
      ?auto_452864 - BLOCK
    )
    :vars
    (
      ?auto_452865 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452864 ?auto_452865 ) ( ON-TABLE ?auto_452851 ) ( ON ?auto_452852 ?auto_452851 ) ( ON ?auto_452853 ?auto_452852 ) ( ON ?auto_452854 ?auto_452853 ) ( ON ?auto_452855 ?auto_452854 ) ( ON ?auto_452856 ?auto_452855 ) ( ON ?auto_452857 ?auto_452856 ) ( ON ?auto_452858 ?auto_452857 ) ( ON ?auto_452859 ?auto_452858 ) ( ON ?auto_452860 ?auto_452859 ) ( ON ?auto_452861 ?auto_452860 ) ( ON ?auto_452862 ?auto_452861 ) ( not ( = ?auto_452851 ?auto_452852 ) ) ( not ( = ?auto_452851 ?auto_452853 ) ) ( not ( = ?auto_452851 ?auto_452854 ) ) ( not ( = ?auto_452851 ?auto_452855 ) ) ( not ( = ?auto_452851 ?auto_452856 ) ) ( not ( = ?auto_452851 ?auto_452857 ) ) ( not ( = ?auto_452851 ?auto_452858 ) ) ( not ( = ?auto_452851 ?auto_452859 ) ) ( not ( = ?auto_452851 ?auto_452860 ) ) ( not ( = ?auto_452851 ?auto_452861 ) ) ( not ( = ?auto_452851 ?auto_452862 ) ) ( not ( = ?auto_452851 ?auto_452863 ) ) ( not ( = ?auto_452851 ?auto_452864 ) ) ( not ( = ?auto_452851 ?auto_452865 ) ) ( not ( = ?auto_452852 ?auto_452853 ) ) ( not ( = ?auto_452852 ?auto_452854 ) ) ( not ( = ?auto_452852 ?auto_452855 ) ) ( not ( = ?auto_452852 ?auto_452856 ) ) ( not ( = ?auto_452852 ?auto_452857 ) ) ( not ( = ?auto_452852 ?auto_452858 ) ) ( not ( = ?auto_452852 ?auto_452859 ) ) ( not ( = ?auto_452852 ?auto_452860 ) ) ( not ( = ?auto_452852 ?auto_452861 ) ) ( not ( = ?auto_452852 ?auto_452862 ) ) ( not ( = ?auto_452852 ?auto_452863 ) ) ( not ( = ?auto_452852 ?auto_452864 ) ) ( not ( = ?auto_452852 ?auto_452865 ) ) ( not ( = ?auto_452853 ?auto_452854 ) ) ( not ( = ?auto_452853 ?auto_452855 ) ) ( not ( = ?auto_452853 ?auto_452856 ) ) ( not ( = ?auto_452853 ?auto_452857 ) ) ( not ( = ?auto_452853 ?auto_452858 ) ) ( not ( = ?auto_452853 ?auto_452859 ) ) ( not ( = ?auto_452853 ?auto_452860 ) ) ( not ( = ?auto_452853 ?auto_452861 ) ) ( not ( = ?auto_452853 ?auto_452862 ) ) ( not ( = ?auto_452853 ?auto_452863 ) ) ( not ( = ?auto_452853 ?auto_452864 ) ) ( not ( = ?auto_452853 ?auto_452865 ) ) ( not ( = ?auto_452854 ?auto_452855 ) ) ( not ( = ?auto_452854 ?auto_452856 ) ) ( not ( = ?auto_452854 ?auto_452857 ) ) ( not ( = ?auto_452854 ?auto_452858 ) ) ( not ( = ?auto_452854 ?auto_452859 ) ) ( not ( = ?auto_452854 ?auto_452860 ) ) ( not ( = ?auto_452854 ?auto_452861 ) ) ( not ( = ?auto_452854 ?auto_452862 ) ) ( not ( = ?auto_452854 ?auto_452863 ) ) ( not ( = ?auto_452854 ?auto_452864 ) ) ( not ( = ?auto_452854 ?auto_452865 ) ) ( not ( = ?auto_452855 ?auto_452856 ) ) ( not ( = ?auto_452855 ?auto_452857 ) ) ( not ( = ?auto_452855 ?auto_452858 ) ) ( not ( = ?auto_452855 ?auto_452859 ) ) ( not ( = ?auto_452855 ?auto_452860 ) ) ( not ( = ?auto_452855 ?auto_452861 ) ) ( not ( = ?auto_452855 ?auto_452862 ) ) ( not ( = ?auto_452855 ?auto_452863 ) ) ( not ( = ?auto_452855 ?auto_452864 ) ) ( not ( = ?auto_452855 ?auto_452865 ) ) ( not ( = ?auto_452856 ?auto_452857 ) ) ( not ( = ?auto_452856 ?auto_452858 ) ) ( not ( = ?auto_452856 ?auto_452859 ) ) ( not ( = ?auto_452856 ?auto_452860 ) ) ( not ( = ?auto_452856 ?auto_452861 ) ) ( not ( = ?auto_452856 ?auto_452862 ) ) ( not ( = ?auto_452856 ?auto_452863 ) ) ( not ( = ?auto_452856 ?auto_452864 ) ) ( not ( = ?auto_452856 ?auto_452865 ) ) ( not ( = ?auto_452857 ?auto_452858 ) ) ( not ( = ?auto_452857 ?auto_452859 ) ) ( not ( = ?auto_452857 ?auto_452860 ) ) ( not ( = ?auto_452857 ?auto_452861 ) ) ( not ( = ?auto_452857 ?auto_452862 ) ) ( not ( = ?auto_452857 ?auto_452863 ) ) ( not ( = ?auto_452857 ?auto_452864 ) ) ( not ( = ?auto_452857 ?auto_452865 ) ) ( not ( = ?auto_452858 ?auto_452859 ) ) ( not ( = ?auto_452858 ?auto_452860 ) ) ( not ( = ?auto_452858 ?auto_452861 ) ) ( not ( = ?auto_452858 ?auto_452862 ) ) ( not ( = ?auto_452858 ?auto_452863 ) ) ( not ( = ?auto_452858 ?auto_452864 ) ) ( not ( = ?auto_452858 ?auto_452865 ) ) ( not ( = ?auto_452859 ?auto_452860 ) ) ( not ( = ?auto_452859 ?auto_452861 ) ) ( not ( = ?auto_452859 ?auto_452862 ) ) ( not ( = ?auto_452859 ?auto_452863 ) ) ( not ( = ?auto_452859 ?auto_452864 ) ) ( not ( = ?auto_452859 ?auto_452865 ) ) ( not ( = ?auto_452860 ?auto_452861 ) ) ( not ( = ?auto_452860 ?auto_452862 ) ) ( not ( = ?auto_452860 ?auto_452863 ) ) ( not ( = ?auto_452860 ?auto_452864 ) ) ( not ( = ?auto_452860 ?auto_452865 ) ) ( not ( = ?auto_452861 ?auto_452862 ) ) ( not ( = ?auto_452861 ?auto_452863 ) ) ( not ( = ?auto_452861 ?auto_452864 ) ) ( not ( = ?auto_452861 ?auto_452865 ) ) ( not ( = ?auto_452862 ?auto_452863 ) ) ( not ( = ?auto_452862 ?auto_452864 ) ) ( not ( = ?auto_452862 ?auto_452865 ) ) ( not ( = ?auto_452863 ?auto_452864 ) ) ( not ( = ?auto_452863 ?auto_452865 ) ) ( not ( = ?auto_452864 ?auto_452865 ) ) ( CLEAR ?auto_452862 ) ( ON ?auto_452863 ?auto_452864 ) ( CLEAR ?auto_452863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_452851 ?auto_452852 ?auto_452853 ?auto_452854 ?auto_452855 ?auto_452856 ?auto_452857 ?auto_452858 ?auto_452859 ?auto_452860 ?auto_452861 ?auto_452862 ?auto_452863 )
      ( MAKE-14PILE ?auto_452851 ?auto_452852 ?auto_452853 ?auto_452854 ?auto_452855 ?auto_452856 ?auto_452857 ?auto_452858 ?auto_452859 ?auto_452860 ?auto_452861 ?auto_452862 ?auto_452863 ?auto_452864 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452880 - BLOCK
      ?auto_452881 - BLOCK
      ?auto_452882 - BLOCK
      ?auto_452883 - BLOCK
      ?auto_452884 - BLOCK
      ?auto_452885 - BLOCK
      ?auto_452886 - BLOCK
      ?auto_452887 - BLOCK
      ?auto_452888 - BLOCK
      ?auto_452889 - BLOCK
      ?auto_452890 - BLOCK
      ?auto_452891 - BLOCK
      ?auto_452892 - BLOCK
      ?auto_452893 - BLOCK
    )
    :vars
    (
      ?auto_452894 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452893 ?auto_452894 ) ( ON-TABLE ?auto_452880 ) ( ON ?auto_452881 ?auto_452880 ) ( ON ?auto_452882 ?auto_452881 ) ( ON ?auto_452883 ?auto_452882 ) ( ON ?auto_452884 ?auto_452883 ) ( ON ?auto_452885 ?auto_452884 ) ( ON ?auto_452886 ?auto_452885 ) ( ON ?auto_452887 ?auto_452886 ) ( ON ?auto_452888 ?auto_452887 ) ( ON ?auto_452889 ?auto_452888 ) ( ON ?auto_452890 ?auto_452889 ) ( not ( = ?auto_452880 ?auto_452881 ) ) ( not ( = ?auto_452880 ?auto_452882 ) ) ( not ( = ?auto_452880 ?auto_452883 ) ) ( not ( = ?auto_452880 ?auto_452884 ) ) ( not ( = ?auto_452880 ?auto_452885 ) ) ( not ( = ?auto_452880 ?auto_452886 ) ) ( not ( = ?auto_452880 ?auto_452887 ) ) ( not ( = ?auto_452880 ?auto_452888 ) ) ( not ( = ?auto_452880 ?auto_452889 ) ) ( not ( = ?auto_452880 ?auto_452890 ) ) ( not ( = ?auto_452880 ?auto_452891 ) ) ( not ( = ?auto_452880 ?auto_452892 ) ) ( not ( = ?auto_452880 ?auto_452893 ) ) ( not ( = ?auto_452880 ?auto_452894 ) ) ( not ( = ?auto_452881 ?auto_452882 ) ) ( not ( = ?auto_452881 ?auto_452883 ) ) ( not ( = ?auto_452881 ?auto_452884 ) ) ( not ( = ?auto_452881 ?auto_452885 ) ) ( not ( = ?auto_452881 ?auto_452886 ) ) ( not ( = ?auto_452881 ?auto_452887 ) ) ( not ( = ?auto_452881 ?auto_452888 ) ) ( not ( = ?auto_452881 ?auto_452889 ) ) ( not ( = ?auto_452881 ?auto_452890 ) ) ( not ( = ?auto_452881 ?auto_452891 ) ) ( not ( = ?auto_452881 ?auto_452892 ) ) ( not ( = ?auto_452881 ?auto_452893 ) ) ( not ( = ?auto_452881 ?auto_452894 ) ) ( not ( = ?auto_452882 ?auto_452883 ) ) ( not ( = ?auto_452882 ?auto_452884 ) ) ( not ( = ?auto_452882 ?auto_452885 ) ) ( not ( = ?auto_452882 ?auto_452886 ) ) ( not ( = ?auto_452882 ?auto_452887 ) ) ( not ( = ?auto_452882 ?auto_452888 ) ) ( not ( = ?auto_452882 ?auto_452889 ) ) ( not ( = ?auto_452882 ?auto_452890 ) ) ( not ( = ?auto_452882 ?auto_452891 ) ) ( not ( = ?auto_452882 ?auto_452892 ) ) ( not ( = ?auto_452882 ?auto_452893 ) ) ( not ( = ?auto_452882 ?auto_452894 ) ) ( not ( = ?auto_452883 ?auto_452884 ) ) ( not ( = ?auto_452883 ?auto_452885 ) ) ( not ( = ?auto_452883 ?auto_452886 ) ) ( not ( = ?auto_452883 ?auto_452887 ) ) ( not ( = ?auto_452883 ?auto_452888 ) ) ( not ( = ?auto_452883 ?auto_452889 ) ) ( not ( = ?auto_452883 ?auto_452890 ) ) ( not ( = ?auto_452883 ?auto_452891 ) ) ( not ( = ?auto_452883 ?auto_452892 ) ) ( not ( = ?auto_452883 ?auto_452893 ) ) ( not ( = ?auto_452883 ?auto_452894 ) ) ( not ( = ?auto_452884 ?auto_452885 ) ) ( not ( = ?auto_452884 ?auto_452886 ) ) ( not ( = ?auto_452884 ?auto_452887 ) ) ( not ( = ?auto_452884 ?auto_452888 ) ) ( not ( = ?auto_452884 ?auto_452889 ) ) ( not ( = ?auto_452884 ?auto_452890 ) ) ( not ( = ?auto_452884 ?auto_452891 ) ) ( not ( = ?auto_452884 ?auto_452892 ) ) ( not ( = ?auto_452884 ?auto_452893 ) ) ( not ( = ?auto_452884 ?auto_452894 ) ) ( not ( = ?auto_452885 ?auto_452886 ) ) ( not ( = ?auto_452885 ?auto_452887 ) ) ( not ( = ?auto_452885 ?auto_452888 ) ) ( not ( = ?auto_452885 ?auto_452889 ) ) ( not ( = ?auto_452885 ?auto_452890 ) ) ( not ( = ?auto_452885 ?auto_452891 ) ) ( not ( = ?auto_452885 ?auto_452892 ) ) ( not ( = ?auto_452885 ?auto_452893 ) ) ( not ( = ?auto_452885 ?auto_452894 ) ) ( not ( = ?auto_452886 ?auto_452887 ) ) ( not ( = ?auto_452886 ?auto_452888 ) ) ( not ( = ?auto_452886 ?auto_452889 ) ) ( not ( = ?auto_452886 ?auto_452890 ) ) ( not ( = ?auto_452886 ?auto_452891 ) ) ( not ( = ?auto_452886 ?auto_452892 ) ) ( not ( = ?auto_452886 ?auto_452893 ) ) ( not ( = ?auto_452886 ?auto_452894 ) ) ( not ( = ?auto_452887 ?auto_452888 ) ) ( not ( = ?auto_452887 ?auto_452889 ) ) ( not ( = ?auto_452887 ?auto_452890 ) ) ( not ( = ?auto_452887 ?auto_452891 ) ) ( not ( = ?auto_452887 ?auto_452892 ) ) ( not ( = ?auto_452887 ?auto_452893 ) ) ( not ( = ?auto_452887 ?auto_452894 ) ) ( not ( = ?auto_452888 ?auto_452889 ) ) ( not ( = ?auto_452888 ?auto_452890 ) ) ( not ( = ?auto_452888 ?auto_452891 ) ) ( not ( = ?auto_452888 ?auto_452892 ) ) ( not ( = ?auto_452888 ?auto_452893 ) ) ( not ( = ?auto_452888 ?auto_452894 ) ) ( not ( = ?auto_452889 ?auto_452890 ) ) ( not ( = ?auto_452889 ?auto_452891 ) ) ( not ( = ?auto_452889 ?auto_452892 ) ) ( not ( = ?auto_452889 ?auto_452893 ) ) ( not ( = ?auto_452889 ?auto_452894 ) ) ( not ( = ?auto_452890 ?auto_452891 ) ) ( not ( = ?auto_452890 ?auto_452892 ) ) ( not ( = ?auto_452890 ?auto_452893 ) ) ( not ( = ?auto_452890 ?auto_452894 ) ) ( not ( = ?auto_452891 ?auto_452892 ) ) ( not ( = ?auto_452891 ?auto_452893 ) ) ( not ( = ?auto_452891 ?auto_452894 ) ) ( not ( = ?auto_452892 ?auto_452893 ) ) ( not ( = ?auto_452892 ?auto_452894 ) ) ( not ( = ?auto_452893 ?auto_452894 ) ) ( ON ?auto_452892 ?auto_452893 ) ( CLEAR ?auto_452890 ) ( ON ?auto_452891 ?auto_452892 ) ( CLEAR ?auto_452891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_452880 ?auto_452881 ?auto_452882 ?auto_452883 ?auto_452884 ?auto_452885 ?auto_452886 ?auto_452887 ?auto_452888 ?auto_452889 ?auto_452890 ?auto_452891 )
      ( MAKE-14PILE ?auto_452880 ?auto_452881 ?auto_452882 ?auto_452883 ?auto_452884 ?auto_452885 ?auto_452886 ?auto_452887 ?auto_452888 ?auto_452889 ?auto_452890 ?auto_452891 ?auto_452892 ?auto_452893 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452909 - BLOCK
      ?auto_452910 - BLOCK
      ?auto_452911 - BLOCK
      ?auto_452912 - BLOCK
      ?auto_452913 - BLOCK
      ?auto_452914 - BLOCK
      ?auto_452915 - BLOCK
      ?auto_452916 - BLOCK
      ?auto_452917 - BLOCK
      ?auto_452918 - BLOCK
      ?auto_452919 - BLOCK
      ?auto_452920 - BLOCK
      ?auto_452921 - BLOCK
      ?auto_452922 - BLOCK
    )
    :vars
    (
      ?auto_452923 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452922 ?auto_452923 ) ( ON-TABLE ?auto_452909 ) ( ON ?auto_452910 ?auto_452909 ) ( ON ?auto_452911 ?auto_452910 ) ( ON ?auto_452912 ?auto_452911 ) ( ON ?auto_452913 ?auto_452912 ) ( ON ?auto_452914 ?auto_452913 ) ( ON ?auto_452915 ?auto_452914 ) ( ON ?auto_452916 ?auto_452915 ) ( ON ?auto_452917 ?auto_452916 ) ( ON ?auto_452918 ?auto_452917 ) ( ON ?auto_452919 ?auto_452918 ) ( not ( = ?auto_452909 ?auto_452910 ) ) ( not ( = ?auto_452909 ?auto_452911 ) ) ( not ( = ?auto_452909 ?auto_452912 ) ) ( not ( = ?auto_452909 ?auto_452913 ) ) ( not ( = ?auto_452909 ?auto_452914 ) ) ( not ( = ?auto_452909 ?auto_452915 ) ) ( not ( = ?auto_452909 ?auto_452916 ) ) ( not ( = ?auto_452909 ?auto_452917 ) ) ( not ( = ?auto_452909 ?auto_452918 ) ) ( not ( = ?auto_452909 ?auto_452919 ) ) ( not ( = ?auto_452909 ?auto_452920 ) ) ( not ( = ?auto_452909 ?auto_452921 ) ) ( not ( = ?auto_452909 ?auto_452922 ) ) ( not ( = ?auto_452909 ?auto_452923 ) ) ( not ( = ?auto_452910 ?auto_452911 ) ) ( not ( = ?auto_452910 ?auto_452912 ) ) ( not ( = ?auto_452910 ?auto_452913 ) ) ( not ( = ?auto_452910 ?auto_452914 ) ) ( not ( = ?auto_452910 ?auto_452915 ) ) ( not ( = ?auto_452910 ?auto_452916 ) ) ( not ( = ?auto_452910 ?auto_452917 ) ) ( not ( = ?auto_452910 ?auto_452918 ) ) ( not ( = ?auto_452910 ?auto_452919 ) ) ( not ( = ?auto_452910 ?auto_452920 ) ) ( not ( = ?auto_452910 ?auto_452921 ) ) ( not ( = ?auto_452910 ?auto_452922 ) ) ( not ( = ?auto_452910 ?auto_452923 ) ) ( not ( = ?auto_452911 ?auto_452912 ) ) ( not ( = ?auto_452911 ?auto_452913 ) ) ( not ( = ?auto_452911 ?auto_452914 ) ) ( not ( = ?auto_452911 ?auto_452915 ) ) ( not ( = ?auto_452911 ?auto_452916 ) ) ( not ( = ?auto_452911 ?auto_452917 ) ) ( not ( = ?auto_452911 ?auto_452918 ) ) ( not ( = ?auto_452911 ?auto_452919 ) ) ( not ( = ?auto_452911 ?auto_452920 ) ) ( not ( = ?auto_452911 ?auto_452921 ) ) ( not ( = ?auto_452911 ?auto_452922 ) ) ( not ( = ?auto_452911 ?auto_452923 ) ) ( not ( = ?auto_452912 ?auto_452913 ) ) ( not ( = ?auto_452912 ?auto_452914 ) ) ( not ( = ?auto_452912 ?auto_452915 ) ) ( not ( = ?auto_452912 ?auto_452916 ) ) ( not ( = ?auto_452912 ?auto_452917 ) ) ( not ( = ?auto_452912 ?auto_452918 ) ) ( not ( = ?auto_452912 ?auto_452919 ) ) ( not ( = ?auto_452912 ?auto_452920 ) ) ( not ( = ?auto_452912 ?auto_452921 ) ) ( not ( = ?auto_452912 ?auto_452922 ) ) ( not ( = ?auto_452912 ?auto_452923 ) ) ( not ( = ?auto_452913 ?auto_452914 ) ) ( not ( = ?auto_452913 ?auto_452915 ) ) ( not ( = ?auto_452913 ?auto_452916 ) ) ( not ( = ?auto_452913 ?auto_452917 ) ) ( not ( = ?auto_452913 ?auto_452918 ) ) ( not ( = ?auto_452913 ?auto_452919 ) ) ( not ( = ?auto_452913 ?auto_452920 ) ) ( not ( = ?auto_452913 ?auto_452921 ) ) ( not ( = ?auto_452913 ?auto_452922 ) ) ( not ( = ?auto_452913 ?auto_452923 ) ) ( not ( = ?auto_452914 ?auto_452915 ) ) ( not ( = ?auto_452914 ?auto_452916 ) ) ( not ( = ?auto_452914 ?auto_452917 ) ) ( not ( = ?auto_452914 ?auto_452918 ) ) ( not ( = ?auto_452914 ?auto_452919 ) ) ( not ( = ?auto_452914 ?auto_452920 ) ) ( not ( = ?auto_452914 ?auto_452921 ) ) ( not ( = ?auto_452914 ?auto_452922 ) ) ( not ( = ?auto_452914 ?auto_452923 ) ) ( not ( = ?auto_452915 ?auto_452916 ) ) ( not ( = ?auto_452915 ?auto_452917 ) ) ( not ( = ?auto_452915 ?auto_452918 ) ) ( not ( = ?auto_452915 ?auto_452919 ) ) ( not ( = ?auto_452915 ?auto_452920 ) ) ( not ( = ?auto_452915 ?auto_452921 ) ) ( not ( = ?auto_452915 ?auto_452922 ) ) ( not ( = ?auto_452915 ?auto_452923 ) ) ( not ( = ?auto_452916 ?auto_452917 ) ) ( not ( = ?auto_452916 ?auto_452918 ) ) ( not ( = ?auto_452916 ?auto_452919 ) ) ( not ( = ?auto_452916 ?auto_452920 ) ) ( not ( = ?auto_452916 ?auto_452921 ) ) ( not ( = ?auto_452916 ?auto_452922 ) ) ( not ( = ?auto_452916 ?auto_452923 ) ) ( not ( = ?auto_452917 ?auto_452918 ) ) ( not ( = ?auto_452917 ?auto_452919 ) ) ( not ( = ?auto_452917 ?auto_452920 ) ) ( not ( = ?auto_452917 ?auto_452921 ) ) ( not ( = ?auto_452917 ?auto_452922 ) ) ( not ( = ?auto_452917 ?auto_452923 ) ) ( not ( = ?auto_452918 ?auto_452919 ) ) ( not ( = ?auto_452918 ?auto_452920 ) ) ( not ( = ?auto_452918 ?auto_452921 ) ) ( not ( = ?auto_452918 ?auto_452922 ) ) ( not ( = ?auto_452918 ?auto_452923 ) ) ( not ( = ?auto_452919 ?auto_452920 ) ) ( not ( = ?auto_452919 ?auto_452921 ) ) ( not ( = ?auto_452919 ?auto_452922 ) ) ( not ( = ?auto_452919 ?auto_452923 ) ) ( not ( = ?auto_452920 ?auto_452921 ) ) ( not ( = ?auto_452920 ?auto_452922 ) ) ( not ( = ?auto_452920 ?auto_452923 ) ) ( not ( = ?auto_452921 ?auto_452922 ) ) ( not ( = ?auto_452921 ?auto_452923 ) ) ( not ( = ?auto_452922 ?auto_452923 ) ) ( ON ?auto_452921 ?auto_452922 ) ( CLEAR ?auto_452919 ) ( ON ?auto_452920 ?auto_452921 ) ( CLEAR ?auto_452920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_452909 ?auto_452910 ?auto_452911 ?auto_452912 ?auto_452913 ?auto_452914 ?auto_452915 ?auto_452916 ?auto_452917 ?auto_452918 ?auto_452919 ?auto_452920 )
      ( MAKE-14PILE ?auto_452909 ?auto_452910 ?auto_452911 ?auto_452912 ?auto_452913 ?auto_452914 ?auto_452915 ?auto_452916 ?auto_452917 ?auto_452918 ?auto_452919 ?auto_452920 ?auto_452921 ?auto_452922 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452938 - BLOCK
      ?auto_452939 - BLOCK
      ?auto_452940 - BLOCK
      ?auto_452941 - BLOCK
      ?auto_452942 - BLOCK
      ?auto_452943 - BLOCK
      ?auto_452944 - BLOCK
      ?auto_452945 - BLOCK
      ?auto_452946 - BLOCK
      ?auto_452947 - BLOCK
      ?auto_452948 - BLOCK
      ?auto_452949 - BLOCK
      ?auto_452950 - BLOCK
      ?auto_452951 - BLOCK
    )
    :vars
    (
      ?auto_452952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452951 ?auto_452952 ) ( ON-TABLE ?auto_452938 ) ( ON ?auto_452939 ?auto_452938 ) ( ON ?auto_452940 ?auto_452939 ) ( ON ?auto_452941 ?auto_452940 ) ( ON ?auto_452942 ?auto_452941 ) ( ON ?auto_452943 ?auto_452942 ) ( ON ?auto_452944 ?auto_452943 ) ( ON ?auto_452945 ?auto_452944 ) ( ON ?auto_452946 ?auto_452945 ) ( ON ?auto_452947 ?auto_452946 ) ( not ( = ?auto_452938 ?auto_452939 ) ) ( not ( = ?auto_452938 ?auto_452940 ) ) ( not ( = ?auto_452938 ?auto_452941 ) ) ( not ( = ?auto_452938 ?auto_452942 ) ) ( not ( = ?auto_452938 ?auto_452943 ) ) ( not ( = ?auto_452938 ?auto_452944 ) ) ( not ( = ?auto_452938 ?auto_452945 ) ) ( not ( = ?auto_452938 ?auto_452946 ) ) ( not ( = ?auto_452938 ?auto_452947 ) ) ( not ( = ?auto_452938 ?auto_452948 ) ) ( not ( = ?auto_452938 ?auto_452949 ) ) ( not ( = ?auto_452938 ?auto_452950 ) ) ( not ( = ?auto_452938 ?auto_452951 ) ) ( not ( = ?auto_452938 ?auto_452952 ) ) ( not ( = ?auto_452939 ?auto_452940 ) ) ( not ( = ?auto_452939 ?auto_452941 ) ) ( not ( = ?auto_452939 ?auto_452942 ) ) ( not ( = ?auto_452939 ?auto_452943 ) ) ( not ( = ?auto_452939 ?auto_452944 ) ) ( not ( = ?auto_452939 ?auto_452945 ) ) ( not ( = ?auto_452939 ?auto_452946 ) ) ( not ( = ?auto_452939 ?auto_452947 ) ) ( not ( = ?auto_452939 ?auto_452948 ) ) ( not ( = ?auto_452939 ?auto_452949 ) ) ( not ( = ?auto_452939 ?auto_452950 ) ) ( not ( = ?auto_452939 ?auto_452951 ) ) ( not ( = ?auto_452939 ?auto_452952 ) ) ( not ( = ?auto_452940 ?auto_452941 ) ) ( not ( = ?auto_452940 ?auto_452942 ) ) ( not ( = ?auto_452940 ?auto_452943 ) ) ( not ( = ?auto_452940 ?auto_452944 ) ) ( not ( = ?auto_452940 ?auto_452945 ) ) ( not ( = ?auto_452940 ?auto_452946 ) ) ( not ( = ?auto_452940 ?auto_452947 ) ) ( not ( = ?auto_452940 ?auto_452948 ) ) ( not ( = ?auto_452940 ?auto_452949 ) ) ( not ( = ?auto_452940 ?auto_452950 ) ) ( not ( = ?auto_452940 ?auto_452951 ) ) ( not ( = ?auto_452940 ?auto_452952 ) ) ( not ( = ?auto_452941 ?auto_452942 ) ) ( not ( = ?auto_452941 ?auto_452943 ) ) ( not ( = ?auto_452941 ?auto_452944 ) ) ( not ( = ?auto_452941 ?auto_452945 ) ) ( not ( = ?auto_452941 ?auto_452946 ) ) ( not ( = ?auto_452941 ?auto_452947 ) ) ( not ( = ?auto_452941 ?auto_452948 ) ) ( not ( = ?auto_452941 ?auto_452949 ) ) ( not ( = ?auto_452941 ?auto_452950 ) ) ( not ( = ?auto_452941 ?auto_452951 ) ) ( not ( = ?auto_452941 ?auto_452952 ) ) ( not ( = ?auto_452942 ?auto_452943 ) ) ( not ( = ?auto_452942 ?auto_452944 ) ) ( not ( = ?auto_452942 ?auto_452945 ) ) ( not ( = ?auto_452942 ?auto_452946 ) ) ( not ( = ?auto_452942 ?auto_452947 ) ) ( not ( = ?auto_452942 ?auto_452948 ) ) ( not ( = ?auto_452942 ?auto_452949 ) ) ( not ( = ?auto_452942 ?auto_452950 ) ) ( not ( = ?auto_452942 ?auto_452951 ) ) ( not ( = ?auto_452942 ?auto_452952 ) ) ( not ( = ?auto_452943 ?auto_452944 ) ) ( not ( = ?auto_452943 ?auto_452945 ) ) ( not ( = ?auto_452943 ?auto_452946 ) ) ( not ( = ?auto_452943 ?auto_452947 ) ) ( not ( = ?auto_452943 ?auto_452948 ) ) ( not ( = ?auto_452943 ?auto_452949 ) ) ( not ( = ?auto_452943 ?auto_452950 ) ) ( not ( = ?auto_452943 ?auto_452951 ) ) ( not ( = ?auto_452943 ?auto_452952 ) ) ( not ( = ?auto_452944 ?auto_452945 ) ) ( not ( = ?auto_452944 ?auto_452946 ) ) ( not ( = ?auto_452944 ?auto_452947 ) ) ( not ( = ?auto_452944 ?auto_452948 ) ) ( not ( = ?auto_452944 ?auto_452949 ) ) ( not ( = ?auto_452944 ?auto_452950 ) ) ( not ( = ?auto_452944 ?auto_452951 ) ) ( not ( = ?auto_452944 ?auto_452952 ) ) ( not ( = ?auto_452945 ?auto_452946 ) ) ( not ( = ?auto_452945 ?auto_452947 ) ) ( not ( = ?auto_452945 ?auto_452948 ) ) ( not ( = ?auto_452945 ?auto_452949 ) ) ( not ( = ?auto_452945 ?auto_452950 ) ) ( not ( = ?auto_452945 ?auto_452951 ) ) ( not ( = ?auto_452945 ?auto_452952 ) ) ( not ( = ?auto_452946 ?auto_452947 ) ) ( not ( = ?auto_452946 ?auto_452948 ) ) ( not ( = ?auto_452946 ?auto_452949 ) ) ( not ( = ?auto_452946 ?auto_452950 ) ) ( not ( = ?auto_452946 ?auto_452951 ) ) ( not ( = ?auto_452946 ?auto_452952 ) ) ( not ( = ?auto_452947 ?auto_452948 ) ) ( not ( = ?auto_452947 ?auto_452949 ) ) ( not ( = ?auto_452947 ?auto_452950 ) ) ( not ( = ?auto_452947 ?auto_452951 ) ) ( not ( = ?auto_452947 ?auto_452952 ) ) ( not ( = ?auto_452948 ?auto_452949 ) ) ( not ( = ?auto_452948 ?auto_452950 ) ) ( not ( = ?auto_452948 ?auto_452951 ) ) ( not ( = ?auto_452948 ?auto_452952 ) ) ( not ( = ?auto_452949 ?auto_452950 ) ) ( not ( = ?auto_452949 ?auto_452951 ) ) ( not ( = ?auto_452949 ?auto_452952 ) ) ( not ( = ?auto_452950 ?auto_452951 ) ) ( not ( = ?auto_452950 ?auto_452952 ) ) ( not ( = ?auto_452951 ?auto_452952 ) ) ( ON ?auto_452950 ?auto_452951 ) ( ON ?auto_452949 ?auto_452950 ) ( CLEAR ?auto_452947 ) ( ON ?auto_452948 ?auto_452949 ) ( CLEAR ?auto_452948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_452938 ?auto_452939 ?auto_452940 ?auto_452941 ?auto_452942 ?auto_452943 ?auto_452944 ?auto_452945 ?auto_452946 ?auto_452947 ?auto_452948 )
      ( MAKE-14PILE ?auto_452938 ?auto_452939 ?auto_452940 ?auto_452941 ?auto_452942 ?auto_452943 ?auto_452944 ?auto_452945 ?auto_452946 ?auto_452947 ?auto_452948 ?auto_452949 ?auto_452950 ?auto_452951 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452967 - BLOCK
      ?auto_452968 - BLOCK
      ?auto_452969 - BLOCK
      ?auto_452970 - BLOCK
      ?auto_452971 - BLOCK
      ?auto_452972 - BLOCK
      ?auto_452973 - BLOCK
      ?auto_452974 - BLOCK
      ?auto_452975 - BLOCK
      ?auto_452976 - BLOCK
      ?auto_452977 - BLOCK
      ?auto_452978 - BLOCK
      ?auto_452979 - BLOCK
      ?auto_452980 - BLOCK
    )
    :vars
    (
      ?auto_452981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_452980 ?auto_452981 ) ( ON-TABLE ?auto_452967 ) ( ON ?auto_452968 ?auto_452967 ) ( ON ?auto_452969 ?auto_452968 ) ( ON ?auto_452970 ?auto_452969 ) ( ON ?auto_452971 ?auto_452970 ) ( ON ?auto_452972 ?auto_452971 ) ( ON ?auto_452973 ?auto_452972 ) ( ON ?auto_452974 ?auto_452973 ) ( ON ?auto_452975 ?auto_452974 ) ( ON ?auto_452976 ?auto_452975 ) ( not ( = ?auto_452967 ?auto_452968 ) ) ( not ( = ?auto_452967 ?auto_452969 ) ) ( not ( = ?auto_452967 ?auto_452970 ) ) ( not ( = ?auto_452967 ?auto_452971 ) ) ( not ( = ?auto_452967 ?auto_452972 ) ) ( not ( = ?auto_452967 ?auto_452973 ) ) ( not ( = ?auto_452967 ?auto_452974 ) ) ( not ( = ?auto_452967 ?auto_452975 ) ) ( not ( = ?auto_452967 ?auto_452976 ) ) ( not ( = ?auto_452967 ?auto_452977 ) ) ( not ( = ?auto_452967 ?auto_452978 ) ) ( not ( = ?auto_452967 ?auto_452979 ) ) ( not ( = ?auto_452967 ?auto_452980 ) ) ( not ( = ?auto_452967 ?auto_452981 ) ) ( not ( = ?auto_452968 ?auto_452969 ) ) ( not ( = ?auto_452968 ?auto_452970 ) ) ( not ( = ?auto_452968 ?auto_452971 ) ) ( not ( = ?auto_452968 ?auto_452972 ) ) ( not ( = ?auto_452968 ?auto_452973 ) ) ( not ( = ?auto_452968 ?auto_452974 ) ) ( not ( = ?auto_452968 ?auto_452975 ) ) ( not ( = ?auto_452968 ?auto_452976 ) ) ( not ( = ?auto_452968 ?auto_452977 ) ) ( not ( = ?auto_452968 ?auto_452978 ) ) ( not ( = ?auto_452968 ?auto_452979 ) ) ( not ( = ?auto_452968 ?auto_452980 ) ) ( not ( = ?auto_452968 ?auto_452981 ) ) ( not ( = ?auto_452969 ?auto_452970 ) ) ( not ( = ?auto_452969 ?auto_452971 ) ) ( not ( = ?auto_452969 ?auto_452972 ) ) ( not ( = ?auto_452969 ?auto_452973 ) ) ( not ( = ?auto_452969 ?auto_452974 ) ) ( not ( = ?auto_452969 ?auto_452975 ) ) ( not ( = ?auto_452969 ?auto_452976 ) ) ( not ( = ?auto_452969 ?auto_452977 ) ) ( not ( = ?auto_452969 ?auto_452978 ) ) ( not ( = ?auto_452969 ?auto_452979 ) ) ( not ( = ?auto_452969 ?auto_452980 ) ) ( not ( = ?auto_452969 ?auto_452981 ) ) ( not ( = ?auto_452970 ?auto_452971 ) ) ( not ( = ?auto_452970 ?auto_452972 ) ) ( not ( = ?auto_452970 ?auto_452973 ) ) ( not ( = ?auto_452970 ?auto_452974 ) ) ( not ( = ?auto_452970 ?auto_452975 ) ) ( not ( = ?auto_452970 ?auto_452976 ) ) ( not ( = ?auto_452970 ?auto_452977 ) ) ( not ( = ?auto_452970 ?auto_452978 ) ) ( not ( = ?auto_452970 ?auto_452979 ) ) ( not ( = ?auto_452970 ?auto_452980 ) ) ( not ( = ?auto_452970 ?auto_452981 ) ) ( not ( = ?auto_452971 ?auto_452972 ) ) ( not ( = ?auto_452971 ?auto_452973 ) ) ( not ( = ?auto_452971 ?auto_452974 ) ) ( not ( = ?auto_452971 ?auto_452975 ) ) ( not ( = ?auto_452971 ?auto_452976 ) ) ( not ( = ?auto_452971 ?auto_452977 ) ) ( not ( = ?auto_452971 ?auto_452978 ) ) ( not ( = ?auto_452971 ?auto_452979 ) ) ( not ( = ?auto_452971 ?auto_452980 ) ) ( not ( = ?auto_452971 ?auto_452981 ) ) ( not ( = ?auto_452972 ?auto_452973 ) ) ( not ( = ?auto_452972 ?auto_452974 ) ) ( not ( = ?auto_452972 ?auto_452975 ) ) ( not ( = ?auto_452972 ?auto_452976 ) ) ( not ( = ?auto_452972 ?auto_452977 ) ) ( not ( = ?auto_452972 ?auto_452978 ) ) ( not ( = ?auto_452972 ?auto_452979 ) ) ( not ( = ?auto_452972 ?auto_452980 ) ) ( not ( = ?auto_452972 ?auto_452981 ) ) ( not ( = ?auto_452973 ?auto_452974 ) ) ( not ( = ?auto_452973 ?auto_452975 ) ) ( not ( = ?auto_452973 ?auto_452976 ) ) ( not ( = ?auto_452973 ?auto_452977 ) ) ( not ( = ?auto_452973 ?auto_452978 ) ) ( not ( = ?auto_452973 ?auto_452979 ) ) ( not ( = ?auto_452973 ?auto_452980 ) ) ( not ( = ?auto_452973 ?auto_452981 ) ) ( not ( = ?auto_452974 ?auto_452975 ) ) ( not ( = ?auto_452974 ?auto_452976 ) ) ( not ( = ?auto_452974 ?auto_452977 ) ) ( not ( = ?auto_452974 ?auto_452978 ) ) ( not ( = ?auto_452974 ?auto_452979 ) ) ( not ( = ?auto_452974 ?auto_452980 ) ) ( not ( = ?auto_452974 ?auto_452981 ) ) ( not ( = ?auto_452975 ?auto_452976 ) ) ( not ( = ?auto_452975 ?auto_452977 ) ) ( not ( = ?auto_452975 ?auto_452978 ) ) ( not ( = ?auto_452975 ?auto_452979 ) ) ( not ( = ?auto_452975 ?auto_452980 ) ) ( not ( = ?auto_452975 ?auto_452981 ) ) ( not ( = ?auto_452976 ?auto_452977 ) ) ( not ( = ?auto_452976 ?auto_452978 ) ) ( not ( = ?auto_452976 ?auto_452979 ) ) ( not ( = ?auto_452976 ?auto_452980 ) ) ( not ( = ?auto_452976 ?auto_452981 ) ) ( not ( = ?auto_452977 ?auto_452978 ) ) ( not ( = ?auto_452977 ?auto_452979 ) ) ( not ( = ?auto_452977 ?auto_452980 ) ) ( not ( = ?auto_452977 ?auto_452981 ) ) ( not ( = ?auto_452978 ?auto_452979 ) ) ( not ( = ?auto_452978 ?auto_452980 ) ) ( not ( = ?auto_452978 ?auto_452981 ) ) ( not ( = ?auto_452979 ?auto_452980 ) ) ( not ( = ?auto_452979 ?auto_452981 ) ) ( not ( = ?auto_452980 ?auto_452981 ) ) ( ON ?auto_452979 ?auto_452980 ) ( ON ?auto_452978 ?auto_452979 ) ( CLEAR ?auto_452976 ) ( ON ?auto_452977 ?auto_452978 ) ( CLEAR ?auto_452977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_452967 ?auto_452968 ?auto_452969 ?auto_452970 ?auto_452971 ?auto_452972 ?auto_452973 ?auto_452974 ?auto_452975 ?auto_452976 ?auto_452977 )
      ( MAKE-14PILE ?auto_452967 ?auto_452968 ?auto_452969 ?auto_452970 ?auto_452971 ?auto_452972 ?auto_452973 ?auto_452974 ?auto_452975 ?auto_452976 ?auto_452977 ?auto_452978 ?auto_452979 ?auto_452980 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_452996 - BLOCK
      ?auto_452997 - BLOCK
      ?auto_452998 - BLOCK
      ?auto_452999 - BLOCK
      ?auto_453000 - BLOCK
      ?auto_453001 - BLOCK
      ?auto_453002 - BLOCK
      ?auto_453003 - BLOCK
      ?auto_453004 - BLOCK
      ?auto_453005 - BLOCK
      ?auto_453006 - BLOCK
      ?auto_453007 - BLOCK
      ?auto_453008 - BLOCK
      ?auto_453009 - BLOCK
    )
    :vars
    (
      ?auto_453010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453009 ?auto_453010 ) ( ON-TABLE ?auto_452996 ) ( ON ?auto_452997 ?auto_452996 ) ( ON ?auto_452998 ?auto_452997 ) ( ON ?auto_452999 ?auto_452998 ) ( ON ?auto_453000 ?auto_452999 ) ( ON ?auto_453001 ?auto_453000 ) ( ON ?auto_453002 ?auto_453001 ) ( ON ?auto_453003 ?auto_453002 ) ( ON ?auto_453004 ?auto_453003 ) ( not ( = ?auto_452996 ?auto_452997 ) ) ( not ( = ?auto_452996 ?auto_452998 ) ) ( not ( = ?auto_452996 ?auto_452999 ) ) ( not ( = ?auto_452996 ?auto_453000 ) ) ( not ( = ?auto_452996 ?auto_453001 ) ) ( not ( = ?auto_452996 ?auto_453002 ) ) ( not ( = ?auto_452996 ?auto_453003 ) ) ( not ( = ?auto_452996 ?auto_453004 ) ) ( not ( = ?auto_452996 ?auto_453005 ) ) ( not ( = ?auto_452996 ?auto_453006 ) ) ( not ( = ?auto_452996 ?auto_453007 ) ) ( not ( = ?auto_452996 ?auto_453008 ) ) ( not ( = ?auto_452996 ?auto_453009 ) ) ( not ( = ?auto_452996 ?auto_453010 ) ) ( not ( = ?auto_452997 ?auto_452998 ) ) ( not ( = ?auto_452997 ?auto_452999 ) ) ( not ( = ?auto_452997 ?auto_453000 ) ) ( not ( = ?auto_452997 ?auto_453001 ) ) ( not ( = ?auto_452997 ?auto_453002 ) ) ( not ( = ?auto_452997 ?auto_453003 ) ) ( not ( = ?auto_452997 ?auto_453004 ) ) ( not ( = ?auto_452997 ?auto_453005 ) ) ( not ( = ?auto_452997 ?auto_453006 ) ) ( not ( = ?auto_452997 ?auto_453007 ) ) ( not ( = ?auto_452997 ?auto_453008 ) ) ( not ( = ?auto_452997 ?auto_453009 ) ) ( not ( = ?auto_452997 ?auto_453010 ) ) ( not ( = ?auto_452998 ?auto_452999 ) ) ( not ( = ?auto_452998 ?auto_453000 ) ) ( not ( = ?auto_452998 ?auto_453001 ) ) ( not ( = ?auto_452998 ?auto_453002 ) ) ( not ( = ?auto_452998 ?auto_453003 ) ) ( not ( = ?auto_452998 ?auto_453004 ) ) ( not ( = ?auto_452998 ?auto_453005 ) ) ( not ( = ?auto_452998 ?auto_453006 ) ) ( not ( = ?auto_452998 ?auto_453007 ) ) ( not ( = ?auto_452998 ?auto_453008 ) ) ( not ( = ?auto_452998 ?auto_453009 ) ) ( not ( = ?auto_452998 ?auto_453010 ) ) ( not ( = ?auto_452999 ?auto_453000 ) ) ( not ( = ?auto_452999 ?auto_453001 ) ) ( not ( = ?auto_452999 ?auto_453002 ) ) ( not ( = ?auto_452999 ?auto_453003 ) ) ( not ( = ?auto_452999 ?auto_453004 ) ) ( not ( = ?auto_452999 ?auto_453005 ) ) ( not ( = ?auto_452999 ?auto_453006 ) ) ( not ( = ?auto_452999 ?auto_453007 ) ) ( not ( = ?auto_452999 ?auto_453008 ) ) ( not ( = ?auto_452999 ?auto_453009 ) ) ( not ( = ?auto_452999 ?auto_453010 ) ) ( not ( = ?auto_453000 ?auto_453001 ) ) ( not ( = ?auto_453000 ?auto_453002 ) ) ( not ( = ?auto_453000 ?auto_453003 ) ) ( not ( = ?auto_453000 ?auto_453004 ) ) ( not ( = ?auto_453000 ?auto_453005 ) ) ( not ( = ?auto_453000 ?auto_453006 ) ) ( not ( = ?auto_453000 ?auto_453007 ) ) ( not ( = ?auto_453000 ?auto_453008 ) ) ( not ( = ?auto_453000 ?auto_453009 ) ) ( not ( = ?auto_453000 ?auto_453010 ) ) ( not ( = ?auto_453001 ?auto_453002 ) ) ( not ( = ?auto_453001 ?auto_453003 ) ) ( not ( = ?auto_453001 ?auto_453004 ) ) ( not ( = ?auto_453001 ?auto_453005 ) ) ( not ( = ?auto_453001 ?auto_453006 ) ) ( not ( = ?auto_453001 ?auto_453007 ) ) ( not ( = ?auto_453001 ?auto_453008 ) ) ( not ( = ?auto_453001 ?auto_453009 ) ) ( not ( = ?auto_453001 ?auto_453010 ) ) ( not ( = ?auto_453002 ?auto_453003 ) ) ( not ( = ?auto_453002 ?auto_453004 ) ) ( not ( = ?auto_453002 ?auto_453005 ) ) ( not ( = ?auto_453002 ?auto_453006 ) ) ( not ( = ?auto_453002 ?auto_453007 ) ) ( not ( = ?auto_453002 ?auto_453008 ) ) ( not ( = ?auto_453002 ?auto_453009 ) ) ( not ( = ?auto_453002 ?auto_453010 ) ) ( not ( = ?auto_453003 ?auto_453004 ) ) ( not ( = ?auto_453003 ?auto_453005 ) ) ( not ( = ?auto_453003 ?auto_453006 ) ) ( not ( = ?auto_453003 ?auto_453007 ) ) ( not ( = ?auto_453003 ?auto_453008 ) ) ( not ( = ?auto_453003 ?auto_453009 ) ) ( not ( = ?auto_453003 ?auto_453010 ) ) ( not ( = ?auto_453004 ?auto_453005 ) ) ( not ( = ?auto_453004 ?auto_453006 ) ) ( not ( = ?auto_453004 ?auto_453007 ) ) ( not ( = ?auto_453004 ?auto_453008 ) ) ( not ( = ?auto_453004 ?auto_453009 ) ) ( not ( = ?auto_453004 ?auto_453010 ) ) ( not ( = ?auto_453005 ?auto_453006 ) ) ( not ( = ?auto_453005 ?auto_453007 ) ) ( not ( = ?auto_453005 ?auto_453008 ) ) ( not ( = ?auto_453005 ?auto_453009 ) ) ( not ( = ?auto_453005 ?auto_453010 ) ) ( not ( = ?auto_453006 ?auto_453007 ) ) ( not ( = ?auto_453006 ?auto_453008 ) ) ( not ( = ?auto_453006 ?auto_453009 ) ) ( not ( = ?auto_453006 ?auto_453010 ) ) ( not ( = ?auto_453007 ?auto_453008 ) ) ( not ( = ?auto_453007 ?auto_453009 ) ) ( not ( = ?auto_453007 ?auto_453010 ) ) ( not ( = ?auto_453008 ?auto_453009 ) ) ( not ( = ?auto_453008 ?auto_453010 ) ) ( not ( = ?auto_453009 ?auto_453010 ) ) ( ON ?auto_453008 ?auto_453009 ) ( ON ?auto_453007 ?auto_453008 ) ( ON ?auto_453006 ?auto_453007 ) ( CLEAR ?auto_453004 ) ( ON ?auto_453005 ?auto_453006 ) ( CLEAR ?auto_453005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_452996 ?auto_452997 ?auto_452998 ?auto_452999 ?auto_453000 ?auto_453001 ?auto_453002 ?auto_453003 ?auto_453004 ?auto_453005 )
      ( MAKE-14PILE ?auto_452996 ?auto_452997 ?auto_452998 ?auto_452999 ?auto_453000 ?auto_453001 ?auto_453002 ?auto_453003 ?auto_453004 ?auto_453005 ?auto_453006 ?auto_453007 ?auto_453008 ?auto_453009 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453025 - BLOCK
      ?auto_453026 - BLOCK
      ?auto_453027 - BLOCK
      ?auto_453028 - BLOCK
      ?auto_453029 - BLOCK
      ?auto_453030 - BLOCK
      ?auto_453031 - BLOCK
      ?auto_453032 - BLOCK
      ?auto_453033 - BLOCK
      ?auto_453034 - BLOCK
      ?auto_453035 - BLOCK
      ?auto_453036 - BLOCK
      ?auto_453037 - BLOCK
      ?auto_453038 - BLOCK
    )
    :vars
    (
      ?auto_453039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453038 ?auto_453039 ) ( ON-TABLE ?auto_453025 ) ( ON ?auto_453026 ?auto_453025 ) ( ON ?auto_453027 ?auto_453026 ) ( ON ?auto_453028 ?auto_453027 ) ( ON ?auto_453029 ?auto_453028 ) ( ON ?auto_453030 ?auto_453029 ) ( ON ?auto_453031 ?auto_453030 ) ( ON ?auto_453032 ?auto_453031 ) ( ON ?auto_453033 ?auto_453032 ) ( not ( = ?auto_453025 ?auto_453026 ) ) ( not ( = ?auto_453025 ?auto_453027 ) ) ( not ( = ?auto_453025 ?auto_453028 ) ) ( not ( = ?auto_453025 ?auto_453029 ) ) ( not ( = ?auto_453025 ?auto_453030 ) ) ( not ( = ?auto_453025 ?auto_453031 ) ) ( not ( = ?auto_453025 ?auto_453032 ) ) ( not ( = ?auto_453025 ?auto_453033 ) ) ( not ( = ?auto_453025 ?auto_453034 ) ) ( not ( = ?auto_453025 ?auto_453035 ) ) ( not ( = ?auto_453025 ?auto_453036 ) ) ( not ( = ?auto_453025 ?auto_453037 ) ) ( not ( = ?auto_453025 ?auto_453038 ) ) ( not ( = ?auto_453025 ?auto_453039 ) ) ( not ( = ?auto_453026 ?auto_453027 ) ) ( not ( = ?auto_453026 ?auto_453028 ) ) ( not ( = ?auto_453026 ?auto_453029 ) ) ( not ( = ?auto_453026 ?auto_453030 ) ) ( not ( = ?auto_453026 ?auto_453031 ) ) ( not ( = ?auto_453026 ?auto_453032 ) ) ( not ( = ?auto_453026 ?auto_453033 ) ) ( not ( = ?auto_453026 ?auto_453034 ) ) ( not ( = ?auto_453026 ?auto_453035 ) ) ( not ( = ?auto_453026 ?auto_453036 ) ) ( not ( = ?auto_453026 ?auto_453037 ) ) ( not ( = ?auto_453026 ?auto_453038 ) ) ( not ( = ?auto_453026 ?auto_453039 ) ) ( not ( = ?auto_453027 ?auto_453028 ) ) ( not ( = ?auto_453027 ?auto_453029 ) ) ( not ( = ?auto_453027 ?auto_453030 ) ) ( not ( = ?auto_453027 ?auto_453031 ) ) ( not ( = ?auto_453027 ?auto_453032 ) ) ( not ( = ?auto_453027 ?auto_453033 ) ) ( not ( = ?auto_453027 ?auto_453034 ) ) ( not ( = ?auto_453027 ?auto_453035 ) ) ( not ( = ?auto_453027 ?auto_453036 ) ) ( not ( = ?auto_453027 ?auto_453037 ) ) ( not ( = ?auto_453027 ?auto_453038 ) ) ( not ( = ?auto_453027 ?auto_453039 ) ) ( not ( = ?auto_453028 ?auto_453029 ) ) ( not ( = ?auto_453028 ?auto_453030 ) ) ( not ( = ?auto_453028 ?auto_453031 ) ) ( not ( = ?auto_453028 ?auto_453032 ) ) ( not ( = ?auto_453028 ?auto_453033 ) ) ( not ( = ?auto_453028 ?auto_453034 ) ) ( not ( = ?auto_453028 ?auto_453035 ) ) ( not ( = ?auto_453028 ?auto_453036 ) ) ( not ( = ?auto_453028 ?auto_453037 ) ) ( not ( = ?auto_453028 ?auto_453038 ) ) ( not ( = ?auto_453028 ?auto_453039 ) ) ( not ( = ?auto_453029 ?auto_453030 ) ) ( not ( = ?auto_453029 ?auto_453031 ) ) ( not ( = ?auto_453029 ?auto_453032 ) ) ( not ( = ?auto_453029 ?auto_453033 ) ) ( not ( = ?auto_453029 ?auto_453034 ) ) ( not ( = ?auto_453029 ?auto_453035 ) ) ( not ( = ?auto_453029 ?auto_453036 ) ) ( not ( = ?auto_453029 ?auto_453037 ) ) ( not ( = ?auto_453029 ?auto_453038 ) ) ( not ( = ?auto_453029 ?auto_453039 ) ) ( not ( = ?auto_453030 ?auto_453031 ) ) ( not ( = ?auto_453030 ?auto_453032 ) ) ( not ( = ?auto_453030 ?auto_453033 ) ) ( not ( = ?auto_453030 ?auto_453034 ) ) ( not ( = ?auto_453030 ?auto_453035 ) ) ( not ( = ?auto_453030 ?auto_453036 ) ) ( not ( = ?auto_453030 ?auto_453037 ) ) ( not ( = ?auto_453030 ?auto_453038 ) ) ( not ( = ?auto_453030 ?auto_453039 ) ) ( not ( = ?auto_453031 ?auto_453032 ) ) ( not ( = ?auto_453031 ?auto_453033 ) ) ( not ( = ?auto_453031 ?auto_453034 ) ) ( not ( = ?auto_453031 ?auto_453035 ) ) ( not ( = ?auto_453031 ?auto_453036 ) ) ( not ( = ?auto_453031 ?auto_453037 ) ) ( not ( = ?auto_453031 ?auto_453038 ) ) ( not ( = ?auto_453031 ?auto_453039 ) ) ( not ( = ?auto_453032 ?auto_453033 ) ) ( not ( = ?auto_453032 ?auto_453034 ) ) ( not ( = ?auto_453032 ?auto_453035 ) ) ( not ( = ?auto_453032 ?auto_453036 ) ) ( not ( = ?auto_453032 ?auto_453037 ) ) ( not ( = ?auto_453032 ?auto_453038 ) ) ( not ( = ?auto_453032 ?auto_453039 ) ) ( not ( = ?auto_453033 ?auto_453034 ) ) ( not ( = ?auto_453033 ?auto_453035 ) ) ( not ( = ?auto_453033 ?auto_453036 ) ) ( not ( = ?auto_453033 ?auto_453037 ) ) ( not ( = ?auto_453033 ?auto_453038 ) ) ( not ( = ?auto_453033 ?auto_453039 ) ) ( not ( = ?auto_453034 ?auto_453035 ) ) ( not ( = ?auto_453034 ?auto_453036 ) ) ( not ( = ?auto_453034 ?auto_453037 ) ) ( not ( = ?auto_453034 ?auto_453038 ) ) ( not ( = ?auto_453034 ?auto_453039 ) ) ( not ( = ?auto_453035 ?auto_453036 ) ) ( not ( = ?auto_453035 ?auto_453037 ) ) ( not ( = ?auto_453035 ?auto_453038 ) ) ( not ( = ?auto_453035 ?auto_453039 ) ) ( not ( = ?auto_453036 ?auto_453037 ) ) ( not ( = ?auto_453036 ?auto_453038 ) ) ( not ( = ?auto_453036 ?auto_453039 ) ) ( not ( = ?auto_453037 ?auto_453038 ) ) ( not ( = ?auto_453037 ?auto_453039 ) ) ( not ( = ?auto_453038 ?auto_453039 ) ) ( ON ?auto_453037 ?auto_453038 ) ( ON ?auto_453036 ?auto_453037 ) ( ON ?auto_453035 ?auto_453036 ) ( CLEAR ?auto_453033 ) ( ON ?auto_453034 ?auto_453035 ) ( CLEAR ?auto_453034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_453025 ?auto_453026 ?auto_453027 ?auto_453028 ?auto_453029 ?auto_453030 ?auto_453031 ?auto_453032 ?auto_453033 ?auto_453034 )
      ( MAKE-14PILE ?auto_453025 ?auto_453026 ?auto_453027 ?auto_453028 ?auto_453029 ?auto_453030 ?auto_453031 ?auto_453032 ?auto_453033 ?auto_453034 ?auto_453035 ?auto_453036 ?auto_453037 ?auto_453038 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453054 - BLOCK
      ?auto_453055 - BLOCK
      ?auto_453056 - BLOCK
      ?auto_453057 - BLOCK
      ?auto_453058 - BLOCK
      ?auto_453059 - BLOCK
      ?auto_453060 - BLOCK
      ?auto_453061 - BLOCK
      ?auto_453062 - BLOCK
      ?auto_453063 - BLOCK
      ?auto_453064 - BLOCK
      ?auto_453065 - BLOCK
      ?auto_453066 - BLOCK
      ?auto_453067 - BLOCK
    )
    :vars
    (
      ?auto_453068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453067 ?auto_453068 ) ( ON-TABLE ?auto_453054 ) ( ON ?auto_453055 ?auto_453054 ) ( ON ?auto_453056 ?auto_453055 ) ( ON ?auto_453057 ?auto_453056 ) ( ON ?auto_453058 ?auto_453057 ) ( ON ?auto_453059 ?auto_453058 ) ( ON ?auto_453060 ?auto_453059 ) ( ON ?auto_453061 ?auto_453060 ) ( not ( = ?auto_453054 ?auto_453055 ) ) ( not ( = ?auto_453054 ?auto_453056 ) ) ( not ( = ?auto_453054 ?auto_453057 ) ) ( not ( = ?auto_453054 ?auto_453058 ) ) ( not ( = ?auto_453054 ?auto_453059 ) ) ( not ( = ?auto_453054 ?auto_453060 ) ) ( not ( = ?auto_453054 ?auto_453061 ) ) ( not ( = ?auto_453054 ?auto_453062 ) ) ( not ( = ?auto_453054 ?auto_453063 ) ) ( not ( = ?auto_453054 ?auto_453064 ) ) ( not ( = ?auto_453054 ?auto_453065 ) ) ( not ( = ?auto_453054 ?auto_453066 ) ) ( not ( = ?auto_453054 ?auto_453067 ) ) ( not ( = ?auto_453054 ?auto_453068 ) ) ( not ( = ?auto_453055 ?auto_453056 ) ) ( not ( = ?auto_453055 ?auto_453057 ) ) ( not ( = ?auto_453055 ?auto_453058 ) ) ( not ( = ?auto_453055 ?auto_453059 ) ) ( not ( = ?auto_453055 ?auto_453060 ) ) ( not ( = ?auto_453055 ?auto_453061 ) ) ( not ( = ?auto_453055 ?auto_453062 ) ) ( not ( = ?auto_453055 ?auto_453063 ) ) ( not ( = ?auto_453055 ?auto_453064 ) ) ( not ( = ?auto_453055 ?auto_453065 ) ) ( not ( = ?auto_453055 ?auto_453066 ) ) ( not ( = ?auto_453055 ?auto_453067 ) ) ( not ( = ?auto_453055 ?auto_453068 ) ) ( not ( = ?auto_453056 ?auto_453057 ) ) ( not ( = ?auto_453056 ?auto_453058 ) ) ( not ( = ?auto_453056 ?auto_453059 ) ) ( not ( = ?auto_453056 ?auto_453060 ) ) ( not ( = ?auto_453056 ?auto_453061 ) ) ( not ( = ?auto_453056 ?auto_453062 ) ) ( not ( = ?auto_453056 ?auto_453063 ) ) ( not ( = ?auto_453056 ?auto_453064 ) ) ( not ( = ?auto_453056 ?auto_453065 ) ) ( not ( = ?auto_453056 ?auto_453066 ) ) ( not ( = ?auto_453056 ?auto_453067 ) ) ( not ( = ?auto_453056 ?auto_453068 ) ) ( not ( = ?auto_453057 ?auto_453058 ) ) ( not ( = ?auto_453057 ?auto_453059 ) ) ( not ( = ?auto_453057 ?auto_453060 ) ) ( not ( = ?auto_453057 ?auto_453061 ) ) ( not ( = ?auto_453057 ?auto_453062 ) ) ( not ( = ?auto_453057 ?auto_453063 ) ) ( not ( = ?auto_453057 ?auto_453064 ) ) ( not ( = ?auto_453057 ?auto_453065 ) ) ( not ( = ?auto_453057 ?auto_453066 ) ) ( not ( = ?auto_453057 ?auto_453067 ) ) ( not ( = ?auto_453057 ?auto_453068 ) ) ( not ( = ?auto_453058 ?auto_453059 ) ) ( not ( = ?auto_453058 ?auto_453060 ) ) ( not ( = ?auto_453058 ?auto_453061 ) ) ( not ( = ?auto_453058 ?auto_453062 ) ) ( not ( = ?auto_453058 ?auto_453063 ) ) ( not ( = ?auto_453058 ?auto_453064 ) ) ( not ( = ?auto_453058 ?auto_453065 ) ) ( not ( = ?auto_453058 ?auto_453066 ) ) ( not ( = ?auto_453058 ?auto_453067 ) ) ( not ( = ?auto_453058 ?auto_453068 ) ) ( not ( = ?auto_453059 ?auto_453060 ) ) ( not ( = ?auto_453059 ?auto_453061 ) ) ( not ( = ?auto_453059 ?auto_453062 ) ) ( not ( = ?auto_453059 ?auto_453063 ) ) ( not ( = ?auto_453059 ?auto_453064 ) ) ( not ( = ?auto_453059 ?auto_453065 ) ) ( not ( = ?auto_453059 ?auto_453066 ) ) ( not ( = ?auto_453059 ?auto_453067 ) ) ( not ( = ?auto_453059 ?auto_453068 ) ) ( not ( = ?auto_453060 ?auto_453061 ) ) ( not ( = ?auto_453060 ?auto_453062 ) ) ( not ( = ?auto_453060 ?auto_453063 ) ) ( not ( = ?auto_453060 ?auto_453064 ) ) ( not ( = ?auto_453060 ?auto_453065 ) ) ( not ( = ?auto_453060 ?auto_453066 ) ) ( not ( = ?auto_453060 ?auto_453067 ) ) ( not ( = ?auto_453060 ?auto_453068 ) ) ( not ( = ?auto_453061 ?auto_453062 ) ) ( not ( = ?auto_453061 ?auto_453063 ) ) ( not ( = ?auto_453061 ?auto_453064 ) ) ( not ( = ?auto_453061 ?auto_453065 ) ) ( not ( = ?auto_453061 ?auto_453066 ) ) ( not ( = ?auto_453061 ?auto_453067 ) ) ( not ( = ?auto_453061 ?auto_453068 ) ) ( not ( = ?auto_453062 ?auto_453063 ) ) ( not ( = ?auto_453062 ?auto_453064 ) ) ( not ( = ?auto_453062 ?auto_453065 ) ) ( not ( = ?auto_453062 ?auto_453066 ) ) ( not ( = ?auto_453062 ?auto_453067 ) ) ( not ( = ?auto_453062 ?auto_453068 ) ) ( not ( = ?auto_453063 ?auto_453064 ) ) ( not ( = ?auto_453063 ?auto_453065 ) ) ( not ( = ?auto_453063 ?auto_453066 ) ) ( not ( = ?auto_453063 ?auto_453067 ) ) ( not ( = ?auto_453063 ?auto_453068 ) ) ( not ( = ?auto_453064 ?auto_453065 ) ) ( not ( = ?auto_453064 ?auto_453066 ) ) ( not ( = ?auto_453064 ?auto_453067 ) ) ( not ( = ?auto_453064 ?auto_453068 ) ) ( not ( = ?auto_453065 ?auto_453066 ) ) ( not ( = ?auto_453065 ?auto_453067 ) ) ( not ( = ?auto_453065 ?auto_453068 ) ) ( not ( = ?auto_453066 ?auto_453067 ) ) ( not ( = ?auto_453066 ?auto_453068 ) ) ( not ( = ?auto_453067 ?auto_453068 ) ) ( ON ?auto_453066 ?auto_453067 ) ( ON ?auto_453065 ?auto_453066 ) ( ON ?auto_453064 ?auto_453065 ) ( ON ?auto_453063 ?auto_453064 ) ( CLEAR ?auto_453061 ) ( ON ?auto_453062 ?auto_453063 ) ( CLEAR ?auto_453062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_453054 ?auto_453055 ?auto_453056 ?auto_453057 ?auto_453058 ?auto_453059 ?auto_453060 ?auto_453061 ?auto_453062 )
      ( MAKE-14PILE ?auto_453054 ?auto_453055 ?auto_453056 ?auto_453057 ?auto_453058 ?auto_453059 ?auto_453060 ?auto_453061 ?auto_453062 ?auto_453063 ?auto_453064 ?auto_453065 ?auto_453066 ?auto_453067 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453083 - BLOCK
      ?auto_453084 - BLOCK
      ?auto_453085 - BLOCK
      ?auto_453086 - BLOCK
      ?auto_453087 - BLOCK
      ?auto_453088 - BLOCK
      ?auto_453089 - BLOCK
      ?auto_453090 - BLOCK
      ?auto_453091 - BLOCK
      ?auto_453092 - BLOCK
      ?auto_453093 - BLOCK
      ?auto_453094 - BLOCK
      ?auto_453095 - BLOCK
      ?auto_453096 - BLOCK
    )
    :vars
    (
      ?auto_453097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453096 ?auto_453097 ) ( ON-TABLE ?auto_453083 ) ( ON ?auto_453084 ?auto_453083 ) ( ON ?auto_453085 ?auto_453084 ) ( ON ?auto_453086 ?auto_453085 ) ( ON ?auto_453087 ?auto_453086 ) ( ON ?auto_453088 ?auto_453087 ) ( ON ?auto_453089 ?auto_453088 ) ( ON ?auto_453090 ?auto_453089 ) ( not ( = ?auto_453083 ?auto_453084 ) ) ( not ( = ?auto_453083 ?auto_453085 ) ) ( not ( = ?auto_453083 ?auto_453086 ) ) ( not ( = ?auto_453083 ?auto_453087 ) ) ( not ( = ?auto_453083 ?auto_453088 ) ) ( not ( = ?auto_453083 ?auto_453089 ) ) ( not ( = ?auto_453083 ?auto_453090 ) ) ( not ( = ?auto_453083 ?auto_453091 ) ) ( not ( = ?auto_453083 ?auto_453092 ) ) ( not ( = ?auto_453083 ?auto_453093 ) ) ( not ( = ?auto_453083 ?auto_453094 ) ) ( not ( = ?auto_453083 ?auto_453095 ) ) ( not ( = ?auto_453083 ?auto_453096 ) ) ( not ( = ?auto_453083 ?auto_453097 ) ) ( not ( = ?auto_453084 ?auto_453085 ) ) ( not ( = ?auto_453084 ?auto_453086 ) ) ( not ( = ?auto_453084 ?auto_453087 ) ) ( not ( = ?auto_453084 ?auto_453088 ) ) ( not ( = ?auto_453084 ?auto_453089 ) ) ( not ( = ?auto_453084 ?auto_453090 ) ) ( not ( = ?auto_453084 ?auto_453091 ) ) ( not ( = ?auto_453084 ?auto_453092 ) ) ( not ( = ?auto_453084 ?auto_453093 ) ) ( not ( = ?auto_453084 ?auto_453094 ) ) ( not ( = ?auto_453084 ?auto_453095 ) ) ( not ( = ?auto_453084 ?auto_453096 ) ) ( not ( = ?auto_453084 ?auto_453097 ) ) ( not ( = ?auto_453085 ?auto_453086 ) ) ( not ( = ?auto_453085 ?auto_453087 ) ) ( not ( = ?auto_453085 ?auto_453088 ) ) ( not ( = ?auto_453085 ?auto_453089 ) ) ( not ( = ?auto_453085 ?auto_453090 ) ) ( not ( = ?auto_453085 ?auto_453091 ) ) ( not ( = ?auto_453085 ?auto_453092 ) ) ( not ( = ?auto_453085 ?auto_453093 ) ) ( not ( = ?auto_453085 ?auto_453094 ) ) ( not ( = ?auto_453085 ?auto_453095 ) ) ( not ( = ?auto_453085 ?auto_453096 ) ) ( not ( = ?auto_453085 ?auto_453097 ) ) ( not ( = ?auto_453086 ?auto_453087 ) ) ( not ( = ?auto_453086 ?auto_453088 ) ) ( not ( = ?auto_453086 ?auto_453089 ) ) ( not ( = ?auto_453086 ?auto_453090 ) ) ( not ( = ?auto_453086 ?auto_453091 ) ) ( not ( = ?auto_453086 ?auto_453092 ) ) ( not ( = ?auto_453086 ?auto_453093 ) ) ( not ( = ?auto_453086 ?auto_453094 ) ) ( not ( = ?auto_453086 ?auto_453095 ) ) ( not ( = ?auto_453086 ?auto_453096 ) ) ( not ( = ?auto_453086 ?auto_453097 ) ) ( not ( = ?auto_453087 ?auto_453088 ) ) ( not ( = ?auto_453087 ?auto_453089 ) ) ( not ( = ?auto_453087 ?auto_453090 ) ) ( not ( = ?auto_453087 ?auto_453091 ) ) ( not ( = ?auto_453087 ?auto_453092 ) ) ( not ( = ?auto_453087 ?auto_453093 ) ) ( not ( = ?auto_453087 ?auto_453094 ) ) ( not ( = ?auto_453087 ?auto_453095 ) ) ( not ( = ?auto_453087 ?auto_453096 ) ) ( not ( = ?auto_453087 ?auto_453097 ) ) ( not ( = ?auto_453088 ?auto_453089 ) ) ( not ( = ?auto_453088 ?auto_453090 ) ) ( not ( = ?auto_453088 ?auto_453091 ) ) ( not ( = ?auto_453088 ?auto_453092 ) ) ( not ( = ?auto_453088 ?auto_453093 ) ) ( not ( = ?auto_453088 ?auto_453094 ) ) ( not ( = ?auto_453088 ?auto_453095 ) ) ( not ( = ?auto_453088 ?auto_453096 ) ) ( not ( = ?auto_453088 ?auto_453097 ) ) ( not ( = ?auto_453089 ?auto_453090 ) ) ( not ( = ?auto_453089 ?auto_453091 ) ) ( not ( = ?auto_453089 ?auto_453092 ) ) ( not ( = ?auto_453089 ?auto_453093 ) ) ( not ( = ?auto_453089 ?auto_453094 ) ) ( not ( = ?auto_453089 ?auto_453095 ) ) ( not ( = ?auto_453089 ?auto_453096 ) ) ( not ( = ?auto_453089 ?auto_453097 ) ) ( not ( = ?auto_453090 ?auto_453091 ) ) ( not ( = ?auto_453090 ?auto_453092 ) ) ( not ( = ?auto_453090 ?auto_453093 ) ) ( not ( = ?auto_453090 ?auto_453094 ) ) ( not ( = ?auto_453090 ?auto_453095 ) ) ( not ( = ?auto_453090 ?auto_453096 ) ) ( not ( = ?auto_453090 ?auto_453097 ) ) ( not ( = ?auto_453091 ?auto_453092 ) ) ( not ( = ?auto_453091 ?auto_453093 ) ) ( not ( = ?auto_453091 ?auto_453094 ) ) ( not ( = ?auto_453091 ?auto_453095 ) ) ( not ( = ?auto_453091 ?auto_453096 ) ) ( not ( = ?auto_453091 ?auto_453097 ) ) ( not ( = ?auto_453092 ?auto_453093 ) ) ( not ( = ?auto_453092 ?auto_453094 ) ) ( not ( = ?auto_453092 ?auto_453095 ) ) ( not ( = ?auto_453092 ?auto_453096 ) ) ( not ( = ?auto_453092 ?auto_453097 ) ) ( not ( = ?auto_453093 ?auto_453094 ) ) ( not ( = ?auto_453093 ?auto_453095 ) ) ( not ( = ?auto_453093 ?auto_453096 ) ) ( not ( = ?auto_453093 ?auto_453097 ) ) ( not ( = ?auto_453094 ?auto_453095 ) ) ( not ( = ?auto_453094 ?auto_453096 ) ) ( not ( = ?auto_453094 ?auto_453097 ) ) ( not ( = ?auto_453095 ?auto_453096 ) ) ( not ( = ?auto_453095 ?auto_453097 ) ) ( not ( = ?auto_453096 ?auto_453097 ) ) ( ON ?auto_453095 ?auto_453096 ) ( ON ?auto_453094 ?auto_453095 ) ( ON ?auto_453093 ?auto_453094 ) ( ON ?auto_453092 ?auto_453093 ) ( CLEAR ?auto_453090 ) ( ON ?auto_453091 ?auto_453092 ) ( CLEAR ?auto_453091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_453083 ?auto_453084 ?auto_453085 ?auto_453086 ?auto_453087 ?auto_453088 ?auto_453089 ?auto_453090 ?auto_453091 )
      ( MAKE-14PILE ?auto_453083 ?auto_453084 ?auto_453085 ?auto_453086 ?auto_453087 ?auto_453088 ?auto_453089 ?auto_453090 ?auto_453091 ?auto_453092 ?auto_453093 ?auto_453094 ?auto_453095 ?auto_453096 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453112 - BLOCK
      ?auto_453113 - BLOCK
      ?auto_453114 - BLOCK
      ?auto_453115 - BLOCK
      ?auto_453116 - BLOCK
      ?auto_453117 - BLOCK
      ?auto_453118 - BLOCK
      ?auto_453119 - BLOCK
      ?auto_453120 - BLOCK
      ?auto_453121 - BLOCK
      ?auto_453122 - BLOCK
      ?auto_453123 - BLOCK
      ?auto_453124 - BLOCK
      ?auto_453125 - BLOCK
    )
    :vars
    (
      ?auto_453126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453125 ?auto_453126 ) ( ON-TABLE ?auto_453112 ) ( ON ?auto_453113 ?auto_453112 ) ( ON ?auto_453114 ?auto_453113 ) ( ON ?auto_453115 ?auto_453114 ) ( ON ?auto_453116 ?auto_453115 ) ( ON ?auto_453117 ?auto_453116 ) ( ON ?auto_453118 ?auto_453117 ) ( not ( = ?auto_453112 ?auto_453113 ) ) ( not ( = ?auto_453112 ?auto_453114 ) ) ( not ( = ?auto_453112 ?auto_453115 ) ) ( not ( = ?auto_453112 ?auto_453116 ) ) ( not ( = ?auto_453112 ?auto_453117 ) ) ( not ( = ?auto_453112 ?auto_453118 ) ) ( not ( = ?auto_453112 ?auto_453119 ) ) ( not ( = ?auto_453112 ?auto_453120 ) ) ( not ( = ?auto_453112 ?auto_453121 ) ) ( not ( = ?auto_453112 ?auto_453122 ) ) ( not ( = ?auto_453112 ?auto_453123 ) ) ( not ( = ?auto_453112 ?auto_453124 ) ) ( not ( = ?auto_453112 ?auto_453125 ) ) ( not ( = ?auto_453112 ?auto_453126 ) ) ( not ( = ?auto_453113 ?auto_453114 ) ) ( not ( = ?auto_453113 ?auto_453115 ) ) ( not ( = ?auto_453113 ?auto_453116 ) ) ( not ( = ?auto_453113 ?auto_453117 ) ) ( not ( = ?auto_453113 ?auto_453118 ) ) ( not ( = ?auto_453113 ?auto_453119 ) ) ( not ( = ?auto_453113 ?auto_453120 ) ) ( not ( = ?auto_453113 ?auto_453121 ) ) ( not ( = ?auto_453113 ?auto_453122 ) ) ( not ( = ?auto_453113 ?auto_453123 ) ) ( not ( = ?auto_453113 ?auto_453124 ) ) ( not ( = ?auto_453113 ?auto_453125 ) ) ( not ( = ?auto_453113 ?auto_453126 ) ) ( not ( = ?auto_453114 ?auto_453115 ) ) ( not ( = ?auto_453114 ?auto_453116 ) ) ( not ( = ?auto_453114 ?auto_453117 ) ) ( not ( = ?auto_453114 ?auto_453118 ) ) ( not ( = ?auto_453114 ?auto_453119 ) ) ( not ( = ?auto_453114 ?auto_453120 ) ) ( not ( = ?auto_453114 ?auto_453121 ) ) ( not ( = ?auto_453114 ?auto_453122 ) ) ( not ( = ?auto_453114 ?auto_453123 ) ) ( not ( = ?auto_453114 ?auto_453124 ) ) ( not ( = ?auto_453114 ?auto_453125 ) ) ( not ( = ?auto_453114 ?auto_453126 ) ) ( not ( = ?auto_453115 ?auto_453116 ) ) ( not ( = ?auto_453115 ?auto_453117 ) ) ( not ( = ?auto_453115 ?auto_453118 ) ) ( not ( = ?auto_453115 ?auto_453119 ) ) ( not ( = ?auto_453115 ?auto_453120 ) ) ( not ( = ?auto_453115 ?auto_453121 ) ) ( not ( = ?auto_453115 ?auto_453122 ) ) ( not ( = ?auto_453115 ?auto_453123 ) ) ( not ( = ?auto_453115 ?auto_453124 ) ) ( not ( = ?auto_453115 ?auto_453125 ) ) ( not ( = ?auto_453115 ?auto_453126 ) ) ( not ( = ?auto_453116 ?auto_453117 ) ) ( not ( = ?auto_453116 ?auto_453118 ) ) ( not ( = ?auto_453116 ?auto_453119 ) ) ( not ( = ?auto_453116 ?auto_453120 ) ) ( not ( = ?auto_453116 ?auto_453121 ) ) ( not ( = ?auto_453116 ?auto_453122 ) ) ( not ( = ?auto_453116 ?auto_453123 ) ) ( not ( = ?auto_453116 ?auto_453124 ) ) ( not ( = ?auto_453116 ?auto_453125 ) ) ( not ( = ?auto_453116 ?auto_453126 ) ) ( not ( = ?auto_453117 ?auto_453118 ) ) ( not ( = ?auto_453117 ?auto_453119 ) ) ( not ( = ?auto_453117 ?auto_453120 ) ) ( not ( = ?auto_453117 ?auto_453121 ) ) ( not ( = ?auto_453117 ?auto_453122 ) ) ( not ( = ?auto_453117 ?auto_453123 ) ) ( not ( = ?auto_453117 ?auto_453124 ) ) ( not ( = ?auto_453117 ?auto_453125 ) ) ( not ( = ?auto_453117 ?auto_453126 ) ) ( not ( = ?auto_453118 ?auto_453119 ) ) ( not ( = ?auto_453118 ?auto_453120 ) ) ( not ( = ?auto_453118 ?auto_453121 ) ) ( not ( = ?auto_453118 ?auto_453122 ) ) ( not ( = ?auto_453118 ?auto_453123 ) ) ( not ( = ?auto_453118 ?auto_453124 ) ) ( not ( = ?auto_453118 ?auto_453125 ) ) ( not ( = ?auto_453118 ?auto_453126 ) ) ( not ( = ?auto_453119 ?auto_453120 ) ) ( not ( = ?auto_453119 ?auto_453121 ) ) ( not ( = ?auto_453119 ?auto_453122 ) ) ( not ( = ?auto_453119 ?auto_453123 ) ) ( not ( = ?auto_453119 ?auto_453124 ) ) ( not ( = ?auto_453119 ?auto_453125 ) ) ( not ( = ?auto_453119 ?auto_453126 ) ) ( not ( = ?auto_453120 ?auto_453121 ) ) ( not ( = ?auto_453120 ?auto_453122 ) ) ( not ( = ?auto_453120 ?auto_453123 ) ) ( not ( = ?auto_453120 ?auto_453124 ) ) ( not ( = ?auto_453120 ?auto_453125 ) ) ( not ( = ?auto_453120 ?auto_453126 ) ) ( not ( = ?auto_453121 ?auto_453122 ) ) ( not ( = ?auto_453121 ?auto_453123 ) ) ( not ( = ?auto_453121 ?auto_453124 ) ) ( not ( = ?auto_453121 ?auto_453125 ) ) ( not ( = ?auto_453121 ?auto_453126 ) ) ( not ( = ?auto_453122 ?auto_453123 ) ) ( not ( = ?auto_453122 ?auto_453124 ) ) ( not ( = ?auto_453122 ?auto_453125 ) ) ( not ( = ?auto_453122 ?auto_453126 ) ) ( not ( = ?auto_453123 ?auto_453124 ) ) ( not ( = ?auto_453123 ?auto_453125 ) ) ( not ( = ?auto_453123 ?auto_453126 ) ) ( not ( = ?auto_453124 ?auto_453125 ) ) ( not ( = ?auto_453124 ?auto_453126 ) ) ( not ( = ?auto_453125 ?auto_453126 ) ) ( ON ?auto_453124 ?auto_453125 ) ( ON ?auto_453123 ?auto_453124 ) ( ON ?auto_453122 ?auto_453123 ) ( ON ?auto_453121 ?auto_453122 ) ( ON ?auto_453120 ?auto_453121 ) ( CLEAR ?auto_453118 ) ( ON ?auto_453119 ?auto_453120 ) ( CLEAR ?auto_453119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_453112 ?auto_453113 ?auto_453114 ?auto_453115 ?auto_453116 ?auto_453117 ?auto_453118 ?auto_453119 )
      ( MAKE-14PILE ?auto_453112 ?auto_453113 ?auto_453114 ?auto_453115 ?auto_453116 ?auto_453117 ?auto_453118 ?auto_453119 ?auto_453120 ?auto_453121 ?auto_453122 ?auto_453123 ?auto_453124 ?auto_453125 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453141 - BLOCK
      ?auto_453142 - BLOCK
      ?auto_453143 - BLOCK
      ?auto_453144 - BLOCK
      ?auto_453145 - BLOCK
      ?auto_453146 - BLOCK
      ?auto_453147 - BLOCK
      ?auto_453148 - BLOCK
      ?auto_453149 - BLOCK
      ?auto_453150 - BLOCK
      ?auto_453151 - BLOCK
      ?auto_453152 - BLOCK
      ?auto_453153 - BLOCK
      ?auto_453154 - BLOCK
    )
    :vars
    (
      ?auto_453155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453154 ?auto_453155 ) ( ON-TABLE ?auto_453141 ) ( ON ?auto_453142 ?auto_453141 ) ( ON ?auto_453143 ?auto_453142 ) ( ON ?auto_453144 ?auto_453143 ) ( ON ?auto_453145 ?auto_453144 ) ( ON ?auto_453146 ?auto_453145 ) ( ON ?auto_453147 ?auto_453146 ) ( not ( = ?auto_453141 ?auto_453142 ) ) ( not ( = ?auto_453141 ?auto_453143 ) ) ( not ( = ?auto_453141 ?auto_453144 ) ) ( not ( = ?auto_453141 ?auto_453145 ) ) ( not ( = ?auto_453141 ?auto_453146 ) ) ( not ( = ?auto_453141 ?auto_453147 ) ) ( not ( = ?auto_453141 ?auto_453148 ) ) ( not ( = ?auto_453141 ?auto_453149 ) ) ( not ( = ?auto_453141 ?auto_453150 ) ) ( not ( = ?auto_453141 ?auto_453151 ) ) ( not ( = ?auto_453141 ?auto_453152 ) ) ( not ( = ?auto_453141 ?auto_453153 ) ) ( not ( = ?auto_453141 ?auto_453154 ) ) ( not ( = ?auto_453141 ?auto_453155 ) ) ( not ( = ?auto_453142 ?auto_453143 ) ) ( not ( = ?auto_453142 ?auto_453144 ) ) ( not ( = ?auto_453142 ?auto_453145 ) ) ( not ( = ?auto_453142 ?auto_453146 ) ) ( not ( = ?auto_453142 ?auto_453147 ) ) ( not ( = ?auto_453142 ?auto_453148 ) ) ( not ( = ?auto_453142 ?auto_453149 ) ) ( not ( = ?auto_453142 ?auto_453150 ) ) ( not ( = ?auto_453142 ?auto_453151 ) ) ( not ( = ?auto_453142 ?auto_453152 ) ) ( not ( = ?auto_453142 ?auto_453153 ) ) ( not ( = ?auto_453142 ?auto_453154 ) ) ( not ( = ?auto_453142 ?auto_453155 ) ) ( not ( = ?auto_453143 ?auto_453144 ) ) ( not ( = ?auto_453143 ?auto_453145 ) ) ( not ( = ?auto_453143 ?auto_453146 ) ) ( not ( = ?auto_453143 ?auto_453147 ) ) ( not ( = ?auto_453143 ?auto_453148 ) ) ( not ( = ?auto_453143 ?auto_453149 ) ) ( not ( = ?auto_453143 ?auto_453150 ) ) ( not ( = ?auto_453143 ?auto_453151 ) ) ( not ( = ?auto_453143 ?auto_453152 ) ) ( not ( = ?auto_453143 ?auto_453153 ) ) ( not ( = ?auto_453143 ?auto_453154 ) ) ( not ( = ?auto_453143 ?auto_453155 ) ) ( not ( = ?auto_453144 ?auto_453145 ) ) ( not ( = ?auto_453144 ?auto_453146 ) ) ( not ( = ?auto_453144 ?auto_453147 ) ) ( not ( = ?auto_453144 ?auto_453148 ) ) ( not ( = ?auto_453144 ?auto_453149 ) ) ( not ( = ?auto_453144 ?auto_453150 ) ) ( not ( = ?auto_453144 ?auto_453151 ) ) ( not ( = ?auto_453144 ?auto_453152 ) ) ( not ( = ?auto_453144 ?auto_453153 ) ) ( not ( = ?auto_453144 ?auto_453154 ) ) ( not ( = ?auto_453144 ?auto_453155 ) ) ( not ( = ?auto_453145 ?auto_453146 ) ) ( not ( = ?auto_453145 ?auto_453147 ) ) ( not ( = ?auto_453145 ?auto_453148 ) ) ( not ( = ?auto_453145 ?auto_453149 ) ) ( not ( = ?auto_453145 ?auto_453150 ) ) ( not ( = ?auto_453145 ?auto_453151 ) ) ( not ( = ?auto_453145 ?auto_453152 ) ) ( not ( = ?auto_453145 ?auto_453153 ) ) ( not ( = ?auto_453145 ?auto_453154 ) ) ( not ( = ?auto_453145 ?auto_453155 ) ) ( not ( = ?auto_453146 ?auto_453147 ) ) ( not ( = ?auto_453146 ?auto_453148 ) ) ( not ( = ?auto_453146 ?auto_453149 ) ) ( not ( = ?auto_453146 ?auto_453150 ) ) ( not ( = ?auto_453146 ?auto_453151 ) ) ( not ( = ?auto_453146 ?auto_453152 ) ) ( not ( = ?auto_453146 ?auto_453153 ) ) ( not ( = ?auto_453146 ?auto_453154 ) ) ( not ( = ?auto_453146 ?auto_453155 ) ) ( not ( = ?auto_453147 ?auto_453148 ) ) ( not ( = ?auto_453147 ?auto_453149 ) ) ( not ( = ?auto_453147 ?auto_453150 ) ) ( not ( = ?auto_453147 ?auto_453151 ) ) ( not ( = ?auto_453147 ?auto_453152 ) ) ( not ( = ?auto_453147 ?auto_453153 ) ) ( not ( = ?auto_453147 ?auto_453154 ) ) ( not ( = ?auto_453147 ?auto_453155 ) ) ( not ( = ?auto_453148 ?auto_453149 ) ) ( not ( = ?auto_453148 ?auto_453150 ) ) ( not ( = ?auto_453148 ?auto_453151 ) ) ( not ( = ?auto_453148 ?auto_453152 ) ) ( not ( = ?auto_453148 ?auto_453153 ) ) ( not ( = ?auto_453148 ?auto_453154 ) ) ( not ( = ?auto_453148 ?auto_453155 ) ) ( not ( = ?auto_453149 ?auto_453150 ) ) ( not ( = ?auto_453149 ?auto_453151 ) ) ( not ( = ?auto_453149 ?auto_453152 ) ) ( not ( = ?auto_453149 ?auto_453153 ) ) ( not ( = ?auto_453149 ?auto_453154 ) ) ( not ( = ?auto_453149 ?auto_453155 ) ) ( not ( = ?auto_453150 ?auto_453151 ) ) ( not ( = ?auto_453150 ?auto_453152 ) ) ( not ( = ?auto_453150 ?auto_453153 ) ) ( not ( = ?auto_453150 ?auto_453154 ) ) ( not ( = ?auto_453150 ?auto_453155 ) ) ( not ( = ?auto_453151 ?auto_453152 ) ) ( not ( = ?auto_453151 ?auto_453153 ) ) ( not ( = ?auto_453151 ?auto_453154 ) ) ( not ( = ?auto_453151 ?auto_453155 ) ) ( not ( = ?auto_453152 ?auto_453153 ) ) ( not ( = ?auto_453152 ?auto_453154 ) ) ( not ( = ?auto_453152 ?auto_453155 ) ) ( not ( = ?auto_453153 ?auto_453154 ) ) ( not ( = ?auto_453153 ?auto_453155 ) ) ( not ( = ?auto_453154 ?auto_453155 ) ) ( ON ?auto_453153 ?auto_453154 ) ( ON ?auto_453152 ?auto_453153 ) ( ON ?auto_453151 ?auto_453152 ) ( ON ?auto_453150 ?auto_453151 ) ( ON ?auto_453149 ?auto_453150 ) ( CLEAR ?auto_453147 ) ( ON ?auto_453148 ?auto_453149 ) ( CLEAR ?auto_453148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_453141 ?auto_453142 ?auto_453143 ?auto_453144 ?auto_453145 ?auto_453146 ?auto_453147 ?auto_453148 )
      ( MAKE-14PILE ?auto_453141 ?auto_453142 ?auto_453143 ?auto_453144 ?auto_453145 ?auto_453146 ?auto_453147 ?auto_453148 ?auto_453149 ?auto_453150 ?auto_453151 ?auto_453152 ?auto_453153 ?auto_453154 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453170 - BLOCK
      ?auto_453171 - BLOCK
      ?auto_453172 - BLOCK
      ?auto_453173 - BLOCK
      ?auto_453174 - BLOCK
      ?auto_453175 - BLOCK
      ?auto_453176 - BLOCK
      ?auto_453177 - BLOCK
      ?auto_453178 - BLOCK
      ?auto_453179 - BLOCK
      ?auto_453180 - BLOCK
      ?auto_453181 - BLOCK
      ?auto_453182 - BLOCK
      ?auto_453183 - BLOCK
    )
    :vars
    (
      ?auto_453184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453183 ?auto_453184 ) ( ON-TABLE ?auto_453170 ) ( ON ?auto_453171 ?auto_453170 ) ( ON ?auto_453172 ?auto_453171 ) ( ON ?auto_453173 ?auto_453172 ) ( ON ?auto_453174 ?auto_453173 ) ( ON ?auto_453175 ?auto_453174 ) ( not ( = ?auto_453170 ?auto_453171 ) ) ( not ( = ?auto_453170 ?auto_453172 ) ) ( not ( = ?auto_453170 ?auto_453173 ) ) ( not ( = ?auto_453170 ?auto_453174 ) ) ( not ( = ?auto_453170 ?auto_453175 ) ) ( not ( = ?auto_453170 ?auto_453176 ) ) ( not ( = ?auto_453170 ?auto_453177 ) ) ( not ( = ?auto_453170 ?auto_453178 ) ) ( not ( = ?auto_453170 ?auto_453179 ) ) ( not ( = ?auto_453170 ?auto_453180 ) ) ( not ( = ?auto_453170 ?auto_453181 ) ) ( not ( = ?auto_453170 ?auto_453182 ) ) ( not ( = ?auto_453170 ?auto_453183 ) ) ( not ( = ?auto_453170 ?auto_453184 ) ) ( not ( = ?auto_453171 ?auto_453172 ) ) ( not ( = ?auto_453171 ?auto_453173 ) ) ( not ( = ?auto_453171 ?auto_453174 ) ) ( not ( = ?auto_453171 ?auto_453175 ) ) ( not ( = ?auto_453171 ?auto_453176 ) ) ( not ( = ?auto_453171 ?auto_453177 ) ) ( not ( = ?auto_453171 ?auto_453178 ) ) ( not ( = ?auto_453171 ?auto_453179 ) ) ( not ( = ?auto_453171 ?auto_453180 ) ) ( not ( = ?auto_453171 ?auto_453181 ) ) ( not ( = ?auto_453171 ?auto_453182 ) ) ( not ( = ?auto_453171 ?auto_453183 ) ) ( not ( = ?auto_453171 ?auto_453184 ) ) ( not ( = ?auto_453172 ?auto_453173 ) ) ( not ( = ?auto_453172 ?auto_453174 ) ) ( not ( = ?auto_453172 ?auto_453175 ) ) ( not ( = ?auto_453172 ?auto_453176 ) ) ( not ( = ?auto_453172 ?auto_453177 ) ) ( not ( = ?auto_453172 ?auto_453178 ) ) ( not ( = ?auto_453172 ?auto_453179 ) ) ( not ( = ?auto_453172 ?auto_453180 ) ) ( not ( = ?auto_453172 ?auto_453181 ) ) ( not ( = ?auto_453172 ?auto_453182 ) ) ( not ( = ?auto_453172 ?auto_453183 ) ) ( not ( = ?auto_453172 ?auto_453184 ) ) ( not ( = ?auto_453173 ?auto_453174 ) ) ( not ( = ?auto_453173 ?auto_453175 ) ) ( not ( = ?auto_453173 ?auto_453176 ) ) ( not ( = ?auto_453173 ?auto_453177 ) ) ( not ( = ?auto_453173 ?auto_453178 ) ) ( not ( = ?auto_453173 ?auto_453179 ) ) ( not ( = ?auto_453173 ?auto_453180 ) ) ( not ( = ?auto_453173 ?auto_453181 ) ) ( not ( = ?auto_453173 ?auto_453182 ) ) ( not ( = ?auto_453173 ?auto_453183 ) ) ( not ( = ?auto_453173 ?auto_453184 ) ) ( not ( = ?auto_453174 ?auto_453175 ) ) ( not ( = ?auto_453174 ?auto_453176 ) ) ( not ( = ?auto_453174 ?auto_453177 ) ) ( not ( = ?auto_453174 ?auto_453178 ) ) ( not ( = ?auto_453174 ?auto_453179 ) ) ( not ( = ?auto_453174 ?auto_453180 ) ) ( not ( = ?auto_453174 ?auto_453181 ) ) ( not ( = ?auto_453174 ?auto_453182 ) ) ( not ( = ?auto_453174 ?auto_453183 ) ) ( not ( = ?auto_453174 ?auto_453184 ) ) ( not ( = ?auto_453175 ?auto_453176 ) ) ( not ( = ?auto_453175 ?auto_453177 ) ) ( not ( = ?auto_453175 ?auto_453178 ) ) ( not ( = ?auto_453175 ?auto_453179 ) ) ( not ( = ?auto_453175 ?auto_453180 ) ) ( not ( = ?auto_453175 ?auto_453181 ) ) ( not ( = ?auto_453175 ?auto_453182 ) ) ( not ( = ?auto_453175 ?auto_453183 ) ) ( not ( = ?auto_453175 ?auto_453184 ) ) ( not ( = ?auto_453176 ?auto_453177 ) ) ( not ( = ?auto_453176 ?auto_453178 ) ) ( not ( = ?auto_453176 ?auto_453179 ) ) ( not ( = ?auto_453176 ?auto_453180 ) ) ( not ( = ?auto_453176 ?auto_453181 ) ) ( not ( = ?auto_453176 ?auto_453182 ) ) ( not ( = ?auto_453176 ?auto_453183 ) ) ( not ( = ?auto_453176 ?auto_453184 ) ) ( not ( = ?auto_453177 ?auto_453178 ) ) ( not ( = ?auto_453177 ?auto_453179 ) ) ( not ( = ?auto_453177 ?auto_453180 ) ) ( not ( = ?auto_453177 ?auto_453181 ) ) ( not ( = ?auto_453177 ?auto_453182 ) ) ( not ( = ?auto_453177 ?auto_453183 ) ) ( not ( = ?auto_453177 ?auto_453184 ) ) ( not ( = ?auto_453178 ?auto_453179 ) ) ( not ( = ?auto_453178 ?auto_453180 ) ) ( not ( = ?auto_453178 ?auto_453181 ) ) ( not ( = ?auto_453178 ?auto_453182 ) ) ( not ( = ?auto_453178 ?auto_453183 ) ) ( not ( = ?auto_453178 ?auto_453184 ) ) ( not ( = ?auto_453179 ?auto_453180 ) ) ( not ( = ?auto_453179 ?auto_453181 ) ) ( not ( = ?auto_453179 ?auto_453182 ) ) ( not ( = ?auto_453179 ?auto_453183 ) ) ( not ( = ?auto_453179 ?auto_453184 ) ) ( not ( = ?auto_453180 ?auto_453181 ) ) ( not ( = ?auto_453180 ?auto_453182 ) ) ( not ( = ?auto_453180 ?auto_453183 ) ) ( not ( = ?auto_453180 ?auto_453184 ) ) ( not ( = ?auto_453181 ?auto_453182 ) ) ( not ( = ?auto_453181 ?auto_453183 ) ) ( not ( = ?auto_453181 ?auto_453184 ) ) ( not ( = ?auto_453182 ?auto_453183 ) ) ( not ( = ?auto_453182 ?auto_453184 ) ) ( not ( = ?auto_453183 ?auto_453184 ) ) ( ON ?auto_453182 ?auto_453183 ) ( ON ?auto_453181 ?auto_453182 ) ( ON ?auto_453180 ?auto_453181 ) ( ON ?auto_453179 ?auto_453180 ) ( ON ?auto_453178 ?auto_453179 ) ( ON ?auto_453177 ?auto_453178 ) ( CLEAR ?auto_453175 ) ( ON ?auto_453176 ?auto_453177 ) ( CLEAR ?auto_453176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_453170 ?auto_453171 ?auto_453172 ?auto_453173 ?auto_453174 ?auto_453175 ?auto_453176 )
      ( MAKE-14PILE ?auto_453170 ?auto_453171 ?auto_453172 ?auto_453173 ?auto_453174 ?auto_453175 ?auto_453176 ?auto_453177 ?auto_453178 ?auto_453179 ?auto_453180 ?auto_453181 ?auto_453182 ?auto_453183 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453199 - BLOCK
      ?auto_453200 - BLOCK
      ?auto_453201 - BLOCK
      ?auto_453202 - BLOCK
      ?auto_453203 - BLOCK
      ?auto_453204 - BLOCK
      ?auto_453205 - BLOCK
      ?auto_453206 - BLOCK
      ?auto_453207 - BLOCK
      ?auto_453208 - BLOCK
      ?auto_453209 - BLOCK
      ?auto_453210 - BLOCK
      ?auto_453211 - BLOCK
      ?auto_453212 - BLOCK
    )
    :vars
    (
      ?auto_453213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453212 ?auto_453213 ) ( ON-TABLE ?auto_453199 ) ( ON ?auto_453200 ?auto_453199 ) ( ON ?auto_453201 ?auto_453200 ) ( ON ?auto_453202 ?auto_453201 ) ( ON ?auto_453203 ?auto_453202 ) ( ON ?auto_453204 ?auto_453203 ) ( not ( = ?auto_453199 ?auto_453200 ) ) ( not ( = ?auto_453199 ?auto_453201 ) ) ( not ( = ?auto_453199 ?auto_453202 ) ) ( not ( = ?auto_453199 ?auto_453203 ) ) ( not ( = ?auto_453199 ?auto_453204 ) ) ( not ( = ?auto_453199 ?auto_453205 ) ) ( not ( = ?auto_453199 ?auto_453206 ) ) ( not ( = ?auto_453199 ?auto_453207 ) ) ( not ( = ?auto_453199 ?auto_453208 ) ) ( not ( = ?auto_453199 ?auto_453209 ) ) ( not ( = ?auto_453199 ?auto_453210 ) ) ( not ( = ?auto_453199 ?auto_453211 ) ) ( not ( = ?auto_453199 ?auto_453212 ) ) ( not ( = ?auto_453199 ?auto_453213 ) ) ( not ( = ?auto_453200 ?auto_453201 ) ) ( not ( = ?auto_453200 ?auto_453202 ) ) ( not ( = ?auto_453200 ?auto_453203 ) ) ( not ( = ?auto_453200 ?auto_453204 ) ) ( not ( = ?auto_453200 ?auto_453205 ) ) ( not ( = ?auto_453200 ?auto_453206 ) ) ( not ( = ?auto_453200 ?auto_453207 ) ) ( not ( = ?auto_453200 ?auto_453208 ) ) ( not ( = ?auto_453200 ?auto_453209 ) ) ( not ( = ?auto_453200 ?auto_453210 ) ) ( not ( = ?auto_453200 ?auto_453211 ) ) ( not ( = ?auto_453200 ?auto_453212 ) ) ( not ( = ?auto_453200 ?auto_453213 ) ) ( not ( = ?auto_453201 ?auto_453202 ) ) ( not ( = ?auto_453201 ?auto_453203 ) ) ( not ( = ?auto_453201 ?auto_453204 ) ) ( not ( = ?auto_453201 ?auto_453205 ) ) ( not ( = ?auto_453201 ?auto_453206 ) ) ( not ( = ?auto_453201 ?auto_453207 ) ) ( not ( = ?auto_453201 ?auto_453208 ) ) ( not ( = ?auto_453201 ?auto_453209 ) ) ( not ( = ?auto_453201 ?auto_453210 ) ) ( not ( = ?auto_453201 ?auto_453211 ) ) ( not ( = ?auto_453201 ?auto_453212 ) ) ( not ( = ?auto_453201 ?auto_453213 ) ) ( not ( = ?auto_453202 ?auto_453203 ) ) ( not ( = ?auto_453202 ?auto_453204 ) ) ( not ( = ?auto_453202 ?auto_453205 ) ) ( not ( = ?auto_453202 ?auto_453206 ) ) ( not ( = ?auto_453202 ?auto_453207 ) ) ( not ( = ?auto_453202 ?auto_453208 ) ) ( not ( = ?auto_453202 ?auto_453209 ) ) ( not ( = ?auto_453202 ?auto_453210 ) ) ( not ( = ?auto_453202 ?auto_453211 ) ) ( not ( = ?auto_453202 ?auto_453212 ) ) ( not ( = ?auto_453202 ?auto_453213 ) ) ( not ( = ?auto_453203 ?auto_453204 ) ) ( not ( = ?auto_453203 ?auto_453205 ) ) ( not ( = ?auto_453203 ?auto_453206 ) ) ( not ( = ?auto_453203 ?auto_453207 ) ) ( not ( = ?auto_453203 ?auto_453208 ) ) ( not ( = ?auto_453203 ?auto_453209 ) ) ( not ( = ?auto_453203 ?auto_453210 ) ) ( not ( = ?auto_453203 ?auto_453211 ) ) ( not ( = ?auto_453203 ?auto_453212 ) ) ( not ( = ?auto_453203 ?auto_453213 ) ) ( not ( = ?auto_453204 ?auto_453205 ) ) ( not ( = ?auto_453204 ?auto_453206 ) ) ( not ( = ?auto_453204 ?auto_453207 ) ) ( not ( = ?auto_453204 ?auto_453208 ) ) ( not ( = ?auto_453204 ?auto_453209 ) ) ( not ( = ?auto_453204 ?auto_453210 ) ) ( not ( = ?auto_453204 ?auto_453211 ) ) ( not ( = ?auto_453204 ?auto_453212 ) ) ( not ( = ?auto_453204 ?auto_453213 ) ) ( not ( = ?auto_453205 ?auto_453206 ) ) ( not ( = ?auto_453205 ?auto_453207 ) ) ( not ( = ?auto_453205 ?auto_453208 ) ) ( not ( = ?auto_453205 ?auto_453209 ) ) ( not ( = ?auto_453205 ?auto_453210 ) ) ( not ( = ?auto_453205 ?auto_453211 ) ) ( not ( = ?auto_453205 ?auto_453212 ) ) ( not ( = ?auto_453205 ?auto_453213 ) ) ( not ( = ?auto_453206 ?auto_453207 ) ) ( not ( = ?auto_453206 ?auto_453208 ) ) ( not ( = ?auto_453206 ?auto_453209 ) ) ( not ( = ?auto_453206 ?auto_453210 ) ) ( not ( = ?auto_453206 ?auto_453211 ) ) ( not ( = ?auto_453206 ?auto_453212 ) ) ( not ( = ?auto_453206 ?auto_453213 ) ) ( not ( = ?auto_453207 ?auto_453208 ) ) ( not ( = ?auto_453207 ?auto_453209 ) ) ( not ( = ?auto_453207 ?auto_453210 ) ) ( not ( = ?auto_453207 ?auto_453211 ) ) ( not ( = ?auto_453207 ?auto_453212 ) ) ( not ( = ?auto_453207 ?auto_453213 ) ) ( not ( = ?auto_453208 ?auto_453209 ) ) ( not ( = ?auto_453208 ?auto_453210 ) ) ( not ( = ?auto_453208 ?auto_453211 ) ) ( not ( = ?auto_453208 ?auto_453212 ) ) ( not ( = ?auto_453208 ?auto_453213 ) ) ( not ( = ?auto_453209 ?auto_453210 ) ) ( not ( = ?auto_453209 ?auto_453211 ) ) ( not ( = ?auto_453209 ?auto_453212 ) ) ( not ( = ?auto_453209 ?auto_453213 ) ) ( not ( = ?auto_453210 ?auto_453211 ) ) ( not ( = ?auto_453210 ?auto_453212 ) ) ( not ( = ?auto_453210 ?auto_453213 ) ) ( not ( = ?auto_453211 ?auto_453212 ) ) ( not ( = ?auto_453211 ?auto_453213 ) ) ( not ( = ?auto_453212 ?auto_453213 ) ) ( ON ?auto_453211 ?auto_453212 ) ( ON ?auto_453210 ?auto_453211 ) ( ON ?auto_453209 ?auto_453210 ) ( ON ?auto_453208 ?auto_453209 ) ( ON ?auto_453207 ?auto_453208 ) ( ON ?auto_453206 ?auto_453207 ) ( CLEAR ?auto_453204 ) ( ON ?auto_453205 ?auto_453206 ) ( CLEAR ?auto_453205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_453199 ?auto_453200 ?auto_453201 ?auto_453202 ?auto_453203 ?auto_453204 ?auto_453205 )
      ( MAKE-14PILE ?auto_453199 ?auto_453200 ?auto_453201 ?auto_453202 ?auto_453203 ?auto_453204 ?auto_453205 ?auto_453206 ?auto_453207 ?auto_453208 ?auto_453209 ?auto_453210 ?auto_453211 ?auto_453212 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453228 - BLOCK
      ?auto_453229 - BLOCK
      ?auto_453230 - BLOCK
      ?auto_453231 - BLOCK
      ?auto_453232 - BLOCK
      ?auto_453233 - BLOCK
      ?auto_453234 - BLOCK
      ?auto_453235 - BLOCK
      ?auto_453236 - BLOCK
      ?auto_453237 - BLOCK
      ?auto_453238 - BLOCK
      ?auto_453239 - BLOCK
      ?auto_453240 - BLOCK
      ?auto_453241 - BLOCK
    )
    :vars
    (
      ?auto_453242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453241 ?auto_453242 ) ( ON-TABLE ?auto_453228 ) ( ON ?auto_453229 ?auto_453228 ) ( ON ?auto_453230 ?auto_453229 ) ( ON ?auto_453231 ?auto_453230 ) ( ON ?auto_453232 ?auto_453231 ) ( not ( = ?auto_453228 ?auto_453229 ) ) ( not ( = ?auto_453228 ?auto_453230 ) ) ( not ( = ?auto_453228 ?auto_453231 ) ) ( not ( = ?auto_453228 ?auto_453232 ) ) ( not ( = ?auto_453228 ?auto_453233 ) ) ( not ( = ?auto_453228 ?auto_453234 ) ) ( not ( = ?auto_453228 ?auto_453235 ) ) ( not ( = ?auto_453228 ?auto_453236 ) ) ( not ( = ?auto_453228 ?auto_453237 ) ) ( not ( = ?auto_453228 ?auto_453238 ) ) ( not ( = ?auto_453228 ?auto_453239 ) ) ( not ( = ?auto_453228 ?auto_453240 ) ) ( not ( = ?auto_453228 ?auto_453241 ) ) ( not ( = ?auto_453228 ?auto_453242 ) ) ( not ( = ?auto_453229 ?auto_453230 ) ) ( not ( = ?auto_453229 ?auto_453231 ) ) ( not ( = ?auto_453229 ?auto_453232 ) ) ( not ( = ?auto_453229 ?auto_453233 ) ) ( not ( = ?auto_453229 ?auto_453234 ) ) ( not ( = ?auto_453229 ?auto_453235 ) ) ( not ( = ?auto_453229 ?auto_453236 ) ) ( not ( = ?auto_453229 ?auto_453237 ) ) ( not ( = ?auto_453229 ?auto_453238 ) ) ( not ( = ?auto_453229 ?auto_453239 ) ) ( not ( = ?auto_453229 ?auto_453240 ) ) ( not ( = ?auto_453229 ?auto_453241 ) ) ( not ( = ?auto_453229 ?auto_453242 ) ) ( not ( = ?auto_453230 ?auto_453231 ) ) ( not ( = ?auto_453230 ?auto_453232 ) ) ( not ( = ?auto_453230 ?auto_453233 ) ) ( not ( = ?auto_453230 ?auto_453234 ) ) ( not ( = ?auto_453230 ?auto_453235 ) ) ( not ( = ?auto_453230 ?auto_453236 ) ) ( not ( = ?auto_453230 ?auto_453237 ) ) ( not ( = ?auto_453230 ?auto_453238 ) ) ( not ( = ?auto_453230 ?auto_453239 ) ) ( not ( = ?auto_453230 ?auto_453240 ) ) ( not ( = ?auto_453230 ?auto_453241 ) ) ( not ( = ?auto_453230 ?auto_453242 ) ) ( not ( = ?auto_453231 ?auto_453232 ) ) ( not ( = ?auto_453231 ?auto_453233 ) ) ( not ( = ?auto_453231 ?auto_453234 ) ) ( not ( = ?auto_453231 ?auto_453235 ) ) ( not ( = ?auto_453231 ?auto_453236 ) ) ( not ( = ?auto_453231 ?auto_453237 ) ) ( not ( = ?auto_453231 ?auto_453238 ) ) ( not ( = ?auto_453231 ?auto_453239 ) ) ( not ( = ?auto_453231 ?auto_453240 ) ) ( not ( = ?auto_453231 ?auto_453241 ) ) ( not ( = ?auto_453231 ?auto_453242 ) ) ( not ( = ?auto_453232 ?auto_453233 ) ) ( not ( = ?auto_453232 ?auto_453234 ) ) ( not ( = ?auto_453232 ?auto_453235 ) ) ( not ( = ?auto_453232 ?auto_453236 ) ) ( not ( = ?auto_453232 ?auto_453237 ) ) ( not ( = ?auto_453232 ?auto_453238 ) ) ( not ( = ?auto_453232 ?auto_453239 ) ) ( not ( = ?auto_453232 ?auto_453240 ) ) ( not ( = ?auto_453232 ?auto_453241 ) ) ( not ( = ?auto_453232 ?auto_453242 ) ) ( not ( = ?auto_453233 ?auto_453234 ) ) ( not ( = ?auto_453233 ?auto_453235 ) ) ( not ( = ?auto_453233 ?auto_453236 ) ) ( not ( = ?auto_453233 ?auto_453237 ) ) ( not ( = ?auto_453233 ?auto_453238 ) ) ( not ( = ?auto_453233 ?auto_453239 ) ) ( not ( = ?auto_453233 ?auto_453240 ) ) ( not ( = ?auto_453233 ?auto_453241 ) ) ( not ( = ?auto_453233 ?auto_453242 ) ) ( not ( = ?auto_453234 ?auto_453235 ) ) ( not ( = ?auto_453234 ?auto_453236 ) ) ( not ( = ?auto_453234 ?auto_453237 ) ) ( not ( = ?auto_453234 ?auto_453238 ) ) ( not ( = ?auto_453234 ?auto_453239 ) ) ( not ( = ?auto_453234 ?auto_453240 ) ) ( not ( = ?auto_453234 ?auto_453241 ) ) ( not ( = ?auto_453234 ?auto_453242 ) ) ( not ( = ?auto_453235 ?auto_453236 ) ) ( not ( = ?auto_453235 ?auto_453237 ) ) ( not ( = ?auto_453235 ?auto_453238 ) ) ( not ( = ?auto_453235 ?auto_453239 ) ) ( not ( = ?auto_453235 ?auto_453240 ) ) ( not ( = ?auto_453235 ?auto_453241 ) ) ( not ( = ?auto_453235 ?auto_453242 ) ) ( not ( = ?auto_453236 ?auto_453237 ) ) ( not ( = ?auto_453236 ?auto_453238 ) ) ( not ( = ?auto_453236 ?auto_453239 ) ) ( not ( = ?auto_453236 ?auto_453240 ) ) ( not ( = ?auto_453236 ?auto_453241 ) ) ( not ( = ?auto_453236 ?auto_453242 ) ) ( not ( = ?auto_453237 ?auto_453238 ) ) ( not ( = ?auto_453237 ?auto_453239 ) ) ( not ( = ?auto_453237 ?auto_453240 ) ) ( not ( = ?auto_453237 ?auto_453241 ) ) ( not ( = ?auto_453237 ?auto_453242 ) ) ( not ( = ?auto_453238 ?auto_453239 ) ) ( not ( = ?auto_453238 ?auto_453240 ) ) ( not ( = ?auto_453238 ?auto_453241 ) ) ( not ( = ?auto_453238 ?auto_453242 ) ) ( not ( = ?auto_453239 ?auto_453240 ) ) ( not ( = ?auto_453239 ?auto_453241 ) ) ( not ( = ?auto_453239 ?auto_453242 ) ) ( not ( = ?auto_453240 ?auto_453241 ) ) ( not ( = ?auto_453240 ?auto_453242 ) ) ( not ( = ?auto_453241 ?auto_453242 ) ) ( ON ?auto_453240 ?auto_453241 ) ( ON ?auto_453239 ?auto_453240 ) ( ON ?auto_453238 ?auto_453239 ) ( ON ?auto_453237 ?auto_453238 ) ( ON ?auto_453236 ?auto_453237 ) ( ON ?auto_453235 ?auto_453236 ) ( ON ?auto_453234 ?auto_453235 ) ( CLEAR ?auto_453232 ) ( ON ?auto_453233 ?auto_453234 ) ( CLEAR ?auto_453233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_453228 ?auto_453229 ?auto_453230 ?auto_453231 ?auto_453232 ?auto_453233 )
      ( MAKE-14PILE ?auto_453228 ?auto_453229 ?auto_453230 ?auto_453231 ?auto_453232 ?auto_453233 ?auto_453234 ?auto_453235 ?auto_453236 ?auto_453237 ?auto_453238 ?auto_453239 ?auto_453240 ?auto_453241 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453257 - BLOCK
      ?auto_453258 - BLOCK
      ?auto_453259 - BLOCK
      ?auto_453260 - BLOCK
      ?auto_453261 - BLOCK
      ?auto_453262 - BLOCK
      ?auto_453263 - BLOCK
      ?auto_453264 - BLOCK
      ?auto_453265 - BLOCK
      ?auto_453266 - BLOCK
      ?auto_453267 - BLOCK
      ?auto_453268 - BLOCK
      ?auto_453269 - BLOCK
      ?auto_453270 - BLOCK
    )
    :vars
    (
      ?auto_453271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453270 ?auto_453271 ) ( ON-TABLE ?auto_453257 ) ( ON ?auto_453258 ?auto_453257 ) ( ON ?auto_453259 ?auto_453258 ) ( ON ?auto_453260 ?auto_453259 ) ( ON ?auto_453261 ?auto_453260 ) ( not ( = ?auto_453257 ?auto_453258 ) ) ( not ( = ?auto_453257 ?auto_453259 ) ) ( not ( = ?auto_453257 ?auto_453260 ) ) ( not ( = ?auto_453257 ?auto_453261 ) ) ( not ( = ?auto_453257 ?auto_453262 ) ) ( not ( = ?auto_453257 ?auto_453263 ) ) ( not ( = ?auto_453257 ?auto_453264 ) ) ( not ( = ?auto_453257 ?auto_453265 ) ) ( not ( = ?auto_453257 ?auto_453266 ) ) ( not ( = ?auto_453257 ?auto_453267 ) ) ( not ( = ?auto_453257 ?auto_453268 ) ) ( not ( = ?auto_453257 ?auto_453269 ) ) ( not ( = ?auto_453257 ?auto_453270 ) ) ( not ( = ?auto_453257 ?auto_453271 ) ) ( not ( = ?auto_453258 ?auto_453259 ) ) ( not ( = ?auto_453258 ?auto_453260 ) ) ( not ( = ?auto_453258 ?auto_453261 ) ) ( not ( = ?auto_453258 ?auto_453262 ) ) ( not ( = ?auto_453258 ?auto_453263 ) ) ( not ( = ?auto_453258 ?auto_453264 ) ) ( not ( = ?auto_453258 ?auto_453265 ) ) ( not ( = ?auto_453258 ?auto_453266 ) ) ( not ( = ?auto_453258 ?auto_453267 ) ) ( not ( = ?auto_453258 ?auto_453268 ) ) ( not ( = ?auto_453258 ?auto_453269 ) ) ( not ( = ?auto_453258 ?auto_453270 ) ) ( not ( = ?auto_453258 ?auto_453271 ) ) ( not ( = ?auto_453259 ?auto_453260 ) ) ( not ( = ?auto_453259 ?auto_453261 ) ) ( not ( = ?auto_453259 ?auto_453262 ) ) ( not ( = ?auto_453259 ?auto_453263 ) ) ( not ( = ?auto_453259 ?auto_453264 ) ) ( not ( = ?auto_453259 ?auto_453265 ) ) ( not ( = ?auto_453259 ?auto_453266 ) ) ( not ( = ?auto_453259 ?auto_453267 ) ) ( not ( = ?auto_453259 ?auto_453268 ) ) ( not ( = ?auto_453259 ?auto_453269 ) ) ( not ( = ?auto_453259 ?auto_453270 ) ) ( not ( = ?auto_453259 ?auto_453271 ) ) ( not ( = ?auto_453260 ?auto_453261 ) ) ( not ( = ?auto_453260 ?auto_453262 ) ) ( not ( = ?auto_453260 ?auto_453263 ) ) ( not ( = ?auto_453260 ?auto_453264 ) ) ( not ( = ?auto_453260 ?auto_453265 ) ) ( not ( = ?auto_453260 ?auto_453266 ) ) ( not ( = ?auto_453260 ?auto_453267 ) ) ( not ( = ?auto_453260 ?auto_453268 ) ) ( not ( = ?auto_453260 ?auto_453269 ) ) ( not ( = ?auto_453260 ?auto_453270 ) ) ( not ( = ?auto_453260 ?auto_453271 ) ) ( not ( = ?auto_453261 ?auto_453262 ) ) ( not ( = ?auto_453261 ?auto_453263 ) ) ( not ( = ?auto_453261 ?auto_453264 ) ) ( not ( = ?auto_453261 ?auto_453265 ) ) ( not ( = ?auto_453261 ?auto_453266 ) ) ( not ( = ?auto_453261 ?auto_453267 ) ) ( not ( = ?auto_453261 ?auto_453268 ) ) ( not ( = ?auto_453261 ?auto_453269 ) ) ( not ( = ?auto_453261 ?auto_453270 ) ) ( not ( = ?auto_453261 ?auto_453271 ) ) ( not ( = ?auto_453262 ?auto_453263 ) ) ( not ( = ?auto_453262 ?auto_453264 ) ) ( not ( = ?auto_453262 ?auto_453265 ) ) ( not ( = ?auto_453262 ?auto_453266 ) ) ( not ( = ?auto_453262 ?auto_453267 ) ) ( not ( = ?auto_453262 ?auto_453268 ) ) ( not ( = ?auto_453262 ?auto_453269 ) ) ( not ( = ?auto_453262 ?auto_453270 ) ) ( not ( = ?auto_453262 ?auto_453271 ) ) ( not ( = ?auto_453263 ?auto_453264 ) ) ( not ( = ?auto_453263 ?auto_453265 ) ) ( not ( = ?auto_453263 ?auto_453266 ) ) ( not ( = ?auto_453263 ?auto_453267 ) ) ( not ( = ?auto_453263 ?auto_453268 ) ) ( not ( = ?auto_453263 ?auto_453269 ) ) ( not ( = ?auto_453263 ?auto_453270 ) ) ( not ( = ?auto_453263 ?auto_453271 ) ) ( not ( = ?auto_453264 ?auto_453265 ) ) ( not ( = ?auto_453264 ?auto_453266 ) ) ( not ( = ?auto_453264 ?auto_453267 ) ) ( not ( = ?auto_453264 ?auto_453268 ) ) ( not ( = ?auto_453264 ?auto_453269 ) ) ( not ( = ?auto_453264 ?auto_453270 ) ) ( not ( = ?auto_453264 ?auto_453271 ) ) ( not ( = ?auto_453265 ?auto_453266 ) ) ( not ( = ?auto_453265 ?auto_453267 ) ) ( not ( = ?auto_453265 ?auto_453268 ) ) ( not ( = ?auto_453265 ?auto_453269 ) ) ( not ( = ?auto_453265 ?auto_453270 ) ) ( not ( = ?auto_453265 ?auto_453271 ) ) ( not ( = ?auto_453266 ?auto_453267 ) ) ( not ( = ?auto_453266 ?auto_453268 ) ) ( not ( = ?auto_453266 ?auto_453269 ) ) ( not ( = ?auto_453266 ?auto_453270 ) ) ( not ( = ?auto_453266 ?auto_453271 ) ) ( not ( = ?auto_453267 ?auto_453268 ) ) ( not ( = ?auto_453267 ?auto_453269 ) ) ( not ( = ?auto_453267 ?auto_453270 ) ) ( not ( = ?auto_453267 ?auto_453271 ) ) ( not ( = ?auto_453268 ?auto_453269 ) ) ( not ( = ?auto_453268 ?auto_453270 ) ) ( not ( = ?auto_453268 ?auto_453271 ) ) ( not ( = ?auto_453269 ?auto_453270 ) ) ( not ( = ?auto_453269 ?auto_453271 ) ) ( not ( = ?auto_453270 ?auto_453271 ) ) ( ON ?auto_453269 ?auto_453270 ) ( ON ?auto_453268 ?auto_453269 ) ( ON ?auto_453267 ?auto_453268 ) ( ON ?auto_453266 ?auto_453267 ) ( ON ?auto_453265 ?auto_453266 ) ( ON ?auto_453264 ?auto_453265 ) ( ON ?auto_453263 ?auto_453264 ) ( CLEAR ?auto_453261 ) ( ON ?auto_453262 ?auto_453263 ) ( CLEAR ?auto_453262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_453257 ?auto_453258 ?auto_453259 ?auto_453260 ?auto_453261 ?auto_453262 )
      ( MAKE-14PILE ?auto_453257 ?auto_453258 ?auto_453259 ?auto_453260 ?auto_453261 ?auto_453262 ?auto_453263 ?auto_453264 ?auto_453265 ?auto_453266 ?auto_453267 ?auto_453268 ?auto_453269 ?auto_453270 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453286 - BLOCK
      ?auto_453287 - BLOCK
      ?auto_453288 - BLOCK
      ?auto_453289 - BLOCK
      ?auto_453290 - BLOCK
      ?auto_453291 - BLOCK
      ?auto_453292 - BLOCK
      ?auto_453293 - BLOCK
      ?auto_453294 - BLOCK
      ?auto_453295 - BLOCK
      ?auto_453296 - BLOCK
      ?auto_453297 - BLOCK
      ?auto_453298 - BLOCK
      ?auto_453299 - BLOCK
    )
    :vars
    (
      ?auto_453300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453299 ?auto_453300 ) ( ON-TABLE ?auto_453286 ) ( ON ?auto_453287 ?auto_453286 ) ( ON ?auto_453288 ?auto_453287 ) ( ON ?auto_453289 ?auto_453288 ) ( not ( = ?auto_453286 ?auto_453287 ) ) ( not ( = ?auto_453286 ?auto_453288 ) ) ( not ( = ?auto_453286 ?auto_453289 ) ) ( not ( = ?auto_453286 ?auto_453290 ) ) ( not ( = ?auto_453286 ?auto_453291 ) ) ( not ( = ?auto_453286 ?auto_453292 ) ) ( not ( = ?auto_453286 ?auto_453293 ) ) ( not ( = ?auto_453286 ?auto_453294 ) ) ( not ( = ?auto_453286 ?auto_453295 ) ) ( not ( = ?auto_453286 ?auto_453296 ) ) ( not ( = ?auto_453286 ?auto_453297 ) ) ( not ( = ?auto_453286 ?auto_453298 ) ) ( not ( = ?auto_453286 ?auto_453299 ) ) ( not ( = ?auto_453286 ?auto_453300 ) ) ( not ( = ?auto_453287 ?auto_453288 ) ) ( not ( = ?auto_453287 ?auto_453289 ) ) ( not ( = ?auto_453287 ?auto_453290 ) ) ( not ( = ?auto_453287 ?auto_453291 ) ) ( not ( = ?auto_453287 ?auto_453292 ) ) ( not ( = ?auto_453287 ?auto_453293 ) ) ( not ( = ?auto_453287 ?auto_453294 ) ) ( not ( = ?auto_453287 ?auto_453295 ) ) ( not ( = ?auto_453287 ?auto_453296 ) ) ( not ( = ?auto_453287 ?auto_453297 ) ) ( not ( = ?auto_453287 ?auto_453298 ) ) ( not ( = ?auto_453287 ?auto_453299 ) ) ( not ( = ?auto_453287 ?auto_453300 ) ) ( not ( = ?auto_453288 ?auto_453289 ) ) ( not ( = ?auto_453288 ?auto_453290 ) ) ( not ( = ?auto_453288 ?auto_453291 ) ) ( not ( = ?auto_453288 ?auto_453292 ) ) ( not ( = ?auto_453288 ?auto_453293 ) ) ( not ( = ?auto_453288 ?auto_453294 ) ) ( not ( = ?auto_453288 ?auto_453295 ) ) ( not ( = ?auto_453288 ?auto_453296 ) ) ( not ( = ?auto_453288 ?auto_453297 ) ) ( not ( = ?auto_453288 ?auto_453298 ) ) ( not ( = ?auto_453288 ?auto_453299 ) ) ( not ( = ?auto_453288 ?auto_453300 ) ) ( not ( = ?auto_453289 ?auto_453290 ) ) ( not ( = ?auto_453289 ?auto_453291 ) ) ( not ( = ?auto_453289 ?auto_453292 ) ) ( not ( = ?auto_453289 ?auto_453293 ) ) ( not ( = ?auto_453289 ?auto_453294 ) ) ( not ( = ?auto_453289 ?auto_453295 ) ) ( not ( = ?auto_453289 ?auto_453296 ) ) ( not ( = ?auto_453289 ?auto_453297 ) ) ( not ( = ?auto_453289 ?auto_453298 ) ) ( not ( = ?auto_453289 ?auto_453299 ) ) ( not ( = ?auto_453289 ?auto_453300 ) ) ( not ( = ?auto_453290 ?auto_453291 ) ) ( not ( = ?auto_453290 ?auto_453292 ) ) ( not ( = ?auto_453290 ?auto_453293 ) ) ( not ( = ?auto_453290 ?auto_453294 ) ) ( not ( = ?auto_453290 ?auto_453295 ) ) ( not ( = ?auto_453290 ?auto_453296 ) ) ( not ( = ?auto_453290 ?auto_453297 ) ) ( not ( = ?auto_453290 ?auto_453298 ) ) ( not ( = ?auto_453290 ?auto_453299 ) ) ( not ( = ?auto_453290 ?auto_453300 ) ) ( not ( = ?auto_453291 ?auto_453292 ) ) ( not ( = ?auto_453291 ?auto_453293 ) ) ( not ( = ?auto_453291 ?auto_453294 ) ) ( not ( = ?auto_453291 ?auto_453295 ) ) ( not ( = ?auto_453291 ?auto_453296 ) ) ( not ( = ?auto_453291 ?auto_453297 ) ) ( not ( = ?auto_453291 ?auto_453298 ) ) ( not ( = ?auto_453291 ?auto_453299 ) ) ( not ( = ?auto_453291 ?auto_453300 ) ) ( not ( = ?auto_453292 ?auto_453293 ) ) ( not ( = ?auto_453292 ?auto_453294 ) ) ( not ( = ?auto_453292 ?auto_453295 ) ) ( not ( = ?auto_453292 ?auto_453296 ) ) ( not ( = ?auto_453292 ?auto_453297 ) ) ( not ( = ?auto_453292 ?auto_453298 ) ) ( not ( = ?auto_453292 ?auto_453299 ) ) ( not ( = ?auto_453292 ?auto_453300 ) ) ( not ( = ?auto_453293 ?auto_453294 ) ) ( not ( = ?auto_453293 ?auto_453295 ) ) ( not ( = ?auto_453293 ?auto_453296 ) ) ( not ( = ?auto_453293 ?auto_453297 ) ) ( not ( = ?auto_453293 ?auto_453298 ) ) ( not ( = ?auto_453293 ?auto_453299 ) ) ( not ( = ?auto_453293 ?auto_453300 ) ) ( not ( = ?auto_453294 ?auto_453295 ) ) ( not ( = ?auto_453294 ?auto_453296 ) ) ( not ( = ?auto_453294 ?auto_453297 ) ) ( not ( = ?auto_453294 ?auto_453298 ) ) ( not ( = ?auto_453294 ?auto_453299 ) ) ( not ( = ?auto_453294 ?auto_453300 ) ) ( not ( = ?auto_453295 ?auto_453296 ) ) ( not ( = ?auto_453295 ?auto_453297 ) ) ( not ( = ?auto_453295 ?auto_453298 ) ) ( not ( = ?auto_453295 ?auto_453299 ) ) ( not ( = ?auto_453295 ?auto_453300 ) ) ( not ( = ?auto_453296 ?auto_453297 ) ) ( not ( = ?auto_453296 ?auto_453298 ) ) ( not ( = ?auto_453296 ?auto_453299 ) ) ( not ( = ?auto_453296 ?auto_453300 ) ) ( not ( = ?auto_453297 ?auto_453298 ) ) ( not ( = ?auto_453297 ?auto_453299 ) ) ( not ( = ?auto_453297 ?auto_453300 ) ) ( not ( = ?auto_453298 ?auto_453299 ) ) ( not ( = ?auto_453298 ?auto_453300 ) ) ( not ( = ?auto_453299 ?auto_453300 ) ) ( ON ?auto_453298 ?auto_453299 ) ( ON ?auto_453297 ?auto_453298 ) ( ON ?auto_453296 ?auto_453297 ) ( ON ?auto_453295 ?auto_453296 ) ( ON ?auto_453294 ?auto_453295 ) ( ON ?auto_453293 ?auto_453294 ) ( ON ?auto_453292 ?auto_453293 ) ( ON ?auto_453291 ?auto_453292 ) ( CLEAR ?auto_453289 ) ( ON ?auto_453290 ?auto_453291 ) ( CLEAR ?auto_453290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_453286 ?auto_453287 ?auto_453288 ?auto_453289 ?auto_453290 )
      ( MAKE-14PILE ?auto_453286 ?auto_453287 ?auto_453288 ?auto_453289 ?auto_453290 ?auto_453291 ?auto_453292 ?auto_453293 ?auto_453294 ?auto_453295 ?auto_453296 ?auto_453297 ?auto_453298 ?auto_453299 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453315 - BLOCK
      ?auto_453316 - BLOCK
      ?auto_453317 - BLOCK
      ?auto_453318 - BLOCK
      ?auto_453319 - BLOCK
      ?auto_453320 - BLOCK
      ?auto_453321 - BLOCK
      ?auto_453322 - BLOCK
      ?auto_453323 - BLOCK
      ?auto_453324 - BLOCK
      ?auto_453325 - BLOCK
      ?auto_453326 - BLOCK
      ?auto_453327 - BLOCK
      ?auto_453328 - BLOCK
    )
    :vars
    (
      ?auto_453329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453328 ?auto_453329 ) ( ON-TABLE ?auto_453315 ) ( ON ?auto_453316 ?auto_453315 ) ( ON ?auto_453317 ?auto_453316 ) ( ON ?auto_453318 ?auto_453317 ) ( not ( = ?auto_453315 ?auto_453316 ) ) ( not ( = ?auto_453315 ?auto_453317 ) ) ( not ( = ?auto_453315 ?auto_453318 ) ) ( not ( = ?auto_453315 ?auto_453319 ) ) ( not ( = ?auto_453315 ?auto_453320 ) ) ( not ( = ?auto_453315 ?auto_453321 ) ) ( not ( = ?auto_453315 ?auto_453322 ) ) ( not ( = ?auto_453315 ?auto_453323 ) ) ( not ( = ?auto_453315 ?auto_453324 ) ) ( not ( = ?auto_453315 ?auto_453325 ) ) ( not ( = ?auto_453315 ?auto_453326 ) ) ( not ( = ?auto_453315 ?auto_453327 ) ) ( not ( = ?auto_453315 ?auto_453328 ) ) ( not ( = ?auto_453315 ?auto_453329 ) ) ( not ( = ?auto_453316 ?auto_453317 ) ) ( not ( = ?auto_453316 ?auto_453318 ) ) ( not ( = ?auto_453316 ?auto_453319 ) ) ( not ( = ?auto_453316 ?auto_453320 ) ) ( not ( = ?auto_453316 ?auto_453321 ) ) ( not ( = ?auto_453316 ?auto_453322 ) ) ( not ( = ?auto_453316 ?auto_453323 ) ) ( not ( = ?auto_453316 ?auto_453324 ) ) ( not ( = ?auto_453316 ?auto_453325 ) ) ( not ( = ?auto_453316 ?auto_453326 ) ) ( not ( = ?auto_453316 ?auto_453327 ) ) ( not ( = ?auto_453316 ?auto_453328 ) ) ( not ( = ?auto_453316 ?auto_453329 ) ) ( not ( = ?auto_453317 ?auto_453318 ) ) ( not ( = ?auto_453317 ?auto_453319 ) ) ( not ( = ?auto_453317 ?auto_453320 ) ) ( not ( = ?auto_453317 ?auto_453321 ) ) ( not ( = ?auto_453317 ?auto_453322 ) ) ( not ( = ?auto_453317 ?auto_453323 ) ) ( not ( = ?auto_453317 ?auto_453324 ) ) ( not ( = ?auto_453317 ?auto_453325 ) ) ( not ( = ?auto_453317 ?auto_453326 ) ) ( not ( = ?auto_453317 ?auto_453327 ) ) ( not ( = ?auto_453317 ?auto_453328 ) ) ( not ( = ?auto_453317 ?auto_453329 ) ) ( not ( = ?auto_453318 ?auto_453319 ) ) ( not ( = ?auto_453318 ?auto_453320 ) ) ( not ( = ?auto_453318 ?auto_453321 ) ) ( not ( = ?auto_453318 ?auto_453322 ) ) ( not ( = ?auto_453318 ?auto_453323 ) ) ( not ( = ?auto_453318 ?auto_453324 ) ) ( not ( = ?auto_453318 ?auto_453325 ) ) ( not ( = ?auto_453318 ?auto_453326 ) ) ( not ( = ?auto_453318 ?auto_453327 ) ) ( not ( = ?auto_453318 ?auto_453328 ) ) ( not ( = ?auto_453318 ?auto_453329 ) ) ( not ( = ?auto_453319 ?auto_453320 ) ) ( not ( = ?auto_453319 ?auto_453321 ) ) ( not ( = ?auto_453319 ?auto_453322 ) ) ( not ( = ?auto_453319 ?auto_453323 ) ) ( not ( = ?auto_453319 ?auto_453324 ) ) ( not ( = ?auto_453319 ?auto_453325 ) ) ( not ( = ?auto_453319 ?auto_453326 ) ) ( not ( = ?auto_453319 ?auto_453327 ) ) ( not ( = ?auto_453319 ?auto_453328 ) ) ( not ( = ?auto_453319 ?auto_453329 ) ) ( not ( = ?auto_453320 ?auto_453321 ) ) ( not ( = ?auto_453320 ?auto_453322 ) ) ( not ( = ?auto_453320 ?auto_453323 ) ) ( not ( = ?auto_453320 ?auto_453324 ) ) ( not ( = ?auto_453320 ?auto_453325 ) ) ( not ( = ?auto_453320 ?auto_453326 ) ) ( not ( = ?auto_453320 ?auto_453327 ) ) ( not ( = ?auto_453320 ?auto_453328 ) ) ( not ( = ?auto_453320 ?auto_453329 ) ) ( not ( = ?auto_453321 ?auto_453322 ) ) ( not ( = ?auto_453321 ?auto_453323 ) ) ( not ( = ?auto_453321 ?auto_453324 ) ) ( not ( = ?auto_453321 ?auto_453325 ) ) ( not ( = ?auto_453321 ?auto_453326 ) ) ( not ( = ?auto_453321 ?auto_453327 ) ) ( not ( = ?auto_453321 ?auto_453328 ) ) ( not ( = ?auto_453321 ?auto_453329 ) ) ( not ( = ?auto_453322 ?auto_453323 ) ) ( not ( = ?auto_453322 ?auto_453324 ) ) ( not ( = ?auto_453322 ?auto_453325 ) ) ( not ( = ?auto_453322 ?auto_453326 ) ) ( not ( = ?auto_453322 ?auto_453327 ) ) ( not ( = ?auto_453322 ?auto_453328 ) ) ( not ( = ?auto_453322 ?auto_453329 ) ) ( not ( = ?auto_453323 ?auto_453324 ) ) ( not ( = ?auto_453323 ?auto_453325 ) ) ( not ( = ?auto_453323 ?auto_453326 ) ) ( not ( = ?auto_453323 ?auto_453327 ) ) ( not ( = ?auto_453323 ?auto_453328 ) ) ( not ( = ?auto_453323 ?auto_453329 ) ) ( not ( = ?auto_453324 ?auto_453325 ) ) ( not ( = ?auto_453324 ?auto_453326 ) ) ( not ( = ?auto_453324 ?auto_453327 ) ) ( not ( = ?auto_453324 ?auto_453328 ) ) ( not ( = ?auto_453324 ?auto_453329 ) ) ( not ( = ?auto_453325 ?auto_453326 ) ) ( not ( = ?auto_453325 ?auto_453327 ) ) ( not ( = ?auto_453325 ?auto_453328 ) ) ( not ( = ?auto_453325 ?auto_453329 ) ) ( not ( = ?auto_453326 ?auto_453327 ) ) ( not ( = ?auto_453326 ?auto_453328 ) ) ( not ( = ?auto_453326 ?auto_453329 ) ) ( not ( = ?auto_453327 ?auto_453328 ) ) ( not ( = ?auto_453327 ?auto_453329 ) ) ( not ( = ?auto_453328 ?auto_453329 ) ) ( ON ?auto_453327 ?auto_453328 ) ( ON ?auto_453326 ?auto_453327 ) ( ON ?auto_453325 ?auto_453326 ) ( ON ?auto_453324 ?auto_453325 ) ( ON ?auto_453323 ?auto_453324 ) ( ON ?auto_453322 ?auto_453323 ) ( ON ?auto_453321 ?auto_453322 ) ( ON ?auto_453320 ?auto_453321 ) ( CLEAR ?auto_453318 ) ( ON ?auto_453319 ?auto_453320 ) ( CLEAR ?auto_453319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_453315 ?auto_453316 ?auto_453317 ?auto_453318 ?auto_453319 )
      ( MAKE-14PILE ?auto_453315 ?auto_453316 ?auto_453317 ?auto_453318 ?auto_453319 ?auto_453320 ?auto_453321 ?auto_453322 ?auto_453323 ?auto_453324 ?auto_453325 ?auto_453326 ?auto_453327 ?auto_453328 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453344 - BLOCK
      ?auto_453345 - BLOCK
      ?auto_453346 - BLOCK
      ?auto_453347 - BLOCK
      ?auto_453348 - BLOCK
      ?auto_453349 - BLOCK
      ?auto_453350 - BLOCK
      ?auto_453351 - BLOCK
      ?auto_453352 - BLOCK
      ?auto_453353 - BLOCK
      ?auto_453354 - BLOCK
      ?auto_453355 - BLOCK
      ?auto_453356 - BLOCK
      ?auto_453357 - BLOCK
    )
    :vars
    (
      ?auto_453358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453357 ?auto_453358 ) ( ON-TABLE ?auto_453344 ) ( ON ?auto_453345 ?auto_453344 ) ( ON ?auto_453346 ?auto_453345 ) ( not ( = ?auto_453344 ?auto_453345 ) ) ( not ( = ?auto_453344 ?auto_453346 ) ) ( not ( = ?auto_453344 ?auto_453347 ) ) ( not ( = ?auto_453344 ?auto_453348 ) ) ( not ( = ?auto_453344 ?auto_453349 ) ) ( not ( = ?auto_453344 ?auto_453350 ) ) ( not ( = ?auto_453344 ?auto_453351 ) ) ( not ( = ?auto_453344 ?auto_453352 ) ) ( not ( = ?auto_453344 ?auto_453353 ) ) ( not ( = ?auto_453344 ?auto_453354 ) ) ( not ( = ?auto_453344 ?auto_453355 ) ) ( not ( = ?auto_453344 ?auto_453356 ) ) ( not ( = ?auto_453344 ?auto_453357 ) ) ( not ( = ?auto_453344 ?auto_453358 ) ) ( not ( = ?auto_453345 ?auto_453346 ) ) ( not ( = ?auto_453345 ?auto_453347 ) ) ( not ( = ?auto_453345 ?auto_453348 ) ) ( not ( = ?auto_453345 ?auto_453349 ) ) ( not ( = ?auto_453345 ?auto_453350 ) ) ( not ( = ?auto_453345 ?auto_453351 ) ) ( not ( = ?auto_453345 ?auto_453352 ) ) ( not ( = ?auto_453345 ?auto_453353 ) ) ( not ( = ?auto_453345 ?auto_453354 ) ) ( not ( = ?auto_453345 ?auto_453355 ) ) ( not ( = ?auto_453345 ?auto_453356 ) ) ( not ( = ?auto_453345 ?auto_453357 ) ) ( not ( = ?auto_453345 ?auto_453358 ) ) ( not ( = ?auto_453346 ?auto_453347 ) ) ( not ( = ?auto_453346 ?auto_453348 ) ) ( not ( = ?auto_453346 ?auto_453349 ) ) ( not ( = ?auto_453346 ?auto_453350 ) ) ( not ( = ?auto_453346 ?auto_453351 ) ) ( not ( = ?auto_453346 ?auto_453352 ) ) ( not ( = ?auto_453346 ?auto_453353 ) ) ( not ( = ?auto_453346 ?auto_453354 ) ) ( not ( = ?auto_453346 ?auto_453355 ) ) ( not ( = ?auto_453346 ?auto_453356 ) ) ( not ( = ?auto_453346 ?auto_453357 ) ) ( not ( = ?auto_453346 ?auto_453358 ) ) ( not ( = ?auto_453347 ?auto_453348 ) ) ( not ( = ?auto_453347 ?auto_453349 ) ) ( not ( = ?auto_453347 ?auto_453350 ) ) ( not ( = ?auto_453347 ?auto_453351 ) ) ( not ( = ?auto_453347 ?auto_453352 ) ) ( not ( = ?auto_453347 ?auto_453353 ) ) ( not ( = ?auto_453347 ?auto_453354 ) ) ( not ( = ?auto_453347 ?auto_453355 ) ) ( not ( = ?auto_453347 ?auto_453356 ) ) ( not ( = ?auto_453347 ?auto_453357 ) ) ( not ( = ?auto_453347 ?auto_453358 ) ) ( not ( = ?auto_453348 ?auto_453349 ) ) ( not ( = ?auto_453348 ?auto_453350 ) ) ( not ( = ?auto_453348 ?auto_453351 ) ) ( not ( = ?auto_453348 ?auto_453352 ) ) ( not ( = ?auto_453348 ?auto_453353 ) ) ( not ( = ?auto_453348 ?auto_453354 ) ) ( not ( = ?auto_453348 ?auto_453355 ) ) ( not ( = ?auto_453348 ?auto_453356 ) ) ( not ( = ?auto_453348 ?auto_453357 ) ) ( not ( = ?auto_453348 ?auto_453358 ) ) ( not ( = ?auto_453349 ?auto_453350 ) ) ( not ( = ?auto_453349 ?auto_453351 ) ) ( not ( = ?auto_453349 ?auto_453352 ) ) ( not ( = ?auto_453349 ?auto_453353 ) ) ( not ( = ?auto_453349 ?auto_453354 ) ) ( not ( = ?auto_453349 ?auto_453355 ) ) ( not ( = ?auto_453349 ?auto_453356 ) ) ( not ( = ?auto_453349 ?auto_453357 ) ) ( not ( = ?auto_453349 ?auto_453358 ) ) ( not ( = ?auto_453350 ?auto_453351 ) ) ( not ( = ?auto_453350 ?auto_453352 ) ) ( not ( = ?auto_453350 ?auto_453353 ) ) ( not ( = ?auto_453350 ?auto_453354 ) ) ( not ( = ?auto_453350 ?auto_453355 ) ) ( not ( = ?auto_453350 ?auto_453356 ) ) ( not ( = ?auto_453350 ?auto_453357 ) ) ( not ( = ?auto_453350 ?auto_453358 ) ) ( not ( = ?auto_453351 ?auto_453352 ) ) ( not ( = ?auto_453351 ?auto_453353 ) ) ( not ( = ?auto_453351 ?auto_453354 ) ) ( not ( = ?auto_453351 ?auto_453355 ) ) ( not ( = ?auto_453351 ?auto_453356 ) ) ( not ( = ?auto_453351 ?auto_453357 ) ) ( not ( = ?auto_453351 ?auto_453358 ) ) ( not ( = ?auto_453352 ?auto_453353 ) ) ( not ( = ?auto_453352 ?auto_453354 ) ) ( not ( = ?auto_453352 ?auto_453355 ) ) ( not ( = ?auto_453352 ?auto_453356 ) ) ( not ( = ?auto_453352 ?auto_453357 ) ) ( not ( = ?auto_453352 ?auto_453358 ) ) ( not ( = ?auto_453353 ?auto_453354 ) ) ( not ( = ?auto_453353 ?auto_453355 ) ) ( not ( = ?auto_453353 ?auto_453356 ) ) ( not ( = ?auto_453353 ?auto_453357 ) ) ( not ( = ?auto_453353 ?auto_453358 ) ) ( not ( = ?auto_453354 ?auto_453355 ) ) ( not ( = ?auto_453354 ?auto_453356 ) ) ( not ( = ?auto_453354 ?auto_453357 ) ) ( not ( = ?auto_453354 ?auto_453358 ) ) ( not ( = ?auto_453355 ?auto_453356 ) ) ( not ( = ?auto_453355 ?auto_453357 ) ) ( not ( = ?auto_453355 ?auto_453358 ) ) ( not ( = ?auto_453356 ?auto_453357 ) ) ( not ( = ?auto_453356 ?auto_453358 ) ) ( not ( = ?auto_453357 ?auto_453358 ) ) ( ON ?auto_453356 ?auto_453357 ) ( ON ?auto_453355 ?auto_453356 ) ( ON ?auto_453354 ?auto_453355 ) ( ON ?auto_453353 ?auto_453354 ) ( ON ?auto_453352 ?auto_453353 ) ( ON ?auto_453351 ?auto_453352 ) ( ON ?auto_453350 ?auto_453351 ) ( ON ?auto_453349 ?auto_453350 ) ( ON ?auto_453348 ?auto_453349 ) ( CLEAR ?auto_453346 ) ( ON ?auto_453347 ?auto_453348 ) ( CLEAR ?auto_453347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_453344 ?auto_453345 ?auto_453346 ?auto_453347 )
      ( MAKE-14PILE ?auto_453344 ?auto_453345 ?auto_453346 ?auto_453347 ?auto_453348 ?auto_453349 ?auto_453350 ?auto_453351 ?auto_453352 ?auto_453353 ?auto_453354 ?auto_453355 ?auto_453356 ?auto_453357 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453373 - BLOCK
      ?auto_453374 - BLOCK
      ?auto_453375 - BLOCK
      ?auto_453376 - BLOCK
      ?auto_453377 - BLOCK
      ?auto_453378 - BLOCK
      ?auto_453379 - BLOCK
      ?auto_453380 - BLOCK
      ?auto_453381 - BLOCK
      ?auto_453382 - BLOCK
      ?auto_453383 - BLOCK
      ?auto_453384 - BLOCK
      ?auto_453385 - BLOCK
      ?auto_453386 - BLOCK
    )
    :vars
    (
      ?auto_453387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453386 ?auto_453387 ) ( ON-TABLE ?auto_453373 ) ( ON ?auto_453374 ?auto_453373 ) ( ON ?auto_453375 ?auto_453374 ) ( not ( = ?auto_453373 ?auto_453374 ) ) ( not ( = ?auto_453373 ?auto_453375 ) ) ( not ( = ?auto_453373 ?auto_453376 ) ) ( not ( = ?auto_453373 ?auto_453377 ) ) ( not ( = ?auto_453373 ?auto_453378 ) ) ( not ( = ?auto_453373 ?auto_453379 ) ) ( not ( = ?auto_453373 ?auto_453380 ) ) ( not ( = ?auto_453373 ?auto_453381 ) ) ( not ( = ?auto_453373 ?auto_453382 ) ) ( not ( = ?auto_453373 ?auto_453383 ) ) ( not ( = ?auto_453373 ?auto_453384 ) ) ( not ( = ?auto_453373 ?auto_453385 ) ) ( not ( = ?auto_453373 ?auto_453386 ) ) ( not ( = ?auto_453373 ?auto_453387 ) ) ( not ( = ?auto_453374 ?auto_453375 ) ) ( not ( = ?auto_453374 ?auto_453376 ) ) ( not ( = ?auto_453374 ?auto_453377 ) ) ( not ( = ?auto_453374 ?auto_453378 ) ) ( not ( = ?auto_453374 ?auto_453379 ) ) ( not ( = ?auto_453374 ?auto_453380 ) ) ( not ( = ?auto_453374 ?auto_453381 ) ) ( not ( = ?auto_453374 ?auto_453382 ) ) ( not ( = ?auto_453374 ?auto_453383 ) ) ( not ( = ?auto_453374 ?auto_453384 ) ) ( not ( = ?auto_453374 ?auto_453385 ) ) ( not ( = ?auto_453374 ?auto_453386 ) ) ( not ( = ?auto_453374 ?auto_453387 ) ) ( not ( = ?auto_453375 ?auto_453376 ) ) ( not ( = ?auto_453375 ?auto_453377 ) ) ( not ( = ?auto_453375 ?auto_453378 ) ) ( not ( = ?auto_453375 ?auto_453379 ) ) ( not ( = ?auto_453375 ?auto_453380 ) ) ( not ( = ?auto_453375 ?auto_453381 ) ) ( not ( = ?auto_453375 ?auto_453382 ) ) ( not ( = ?auto_453375 ?auto_453383 ) ) ( not ( = ?auto_453375 ?auto_453384 ) ) ( not ( = ?auto_453375 ?auto_453385 ) ) ( not ( = ?auto_453375 ?auto_453386 ) ) ( not ( = ?auto_453375 ?auto_453387 ) ) ( not ( = ?auto_453376 ?auto_453377 ) ) ( not ( = ?auto_453376 ?auto_453378 ) ) ( not ( = ?auto_453376 ?auto_453379 ) ) ( not ( = ?auto_453376 ?auto_453380 ) ) ( not ( = ?auto_453376 ?auto_453381 ) ) ( not ( = ?auto_453376 ?auto_453382 ) ) ( not ( = ?auto_453376 ?auto_453383 ) ) ( not ( = ?auto_453376 ?auto_453384 ) ) ( not ( = ?auto_453376 ?auto_453385 ) ) ( not ( = ?auto_453376 ?auto_453386 ) ) ( not ( = ?auto_453376 ?auto_453387 ) ) ( not ( = ?auto_453377 ?auto_453378 ) ) ( not ( = ?auto_453377 ?auto_453379 ) ) ( not ( = ?auto_453377 ?auto_453380 ) ) ( not ( = ?auto_453377 ?auto_453381 ) ) ( not ( = ?auto_453377 ?auto_453382 ) ) ( not ( = ?auto_453377 ?auto_453383 ) ) ( not ( = ?auto_453377 ?auto_453384 ) ) ( not ( = ?auto_453377 ?auto_453385 ) ) ( not ( = ?auto_453377 ?auto_453386 ) ) ( not ( = ?auto_453377 ?auto_453387 ) ) ( not ( = ?auto_453378 ?auto_453379 ) ) ( not ( = ?auto_453378 ?auto_453380 ) ) ( not ( = ?auto_453378 ?auto_453381 ) ) ( not ( = ?auto_453378 ?auto_453382 ) ) ( not ( = ?auto_453378 ?auto_453383 ) ) ( not ( = ?auto_453378 ?auto_453384 ) ) ( not ( = ?auto_453378 ?auto_453385 ) ) ( not ( = ?auto_453378 ?auto_453386 ) ) ( not ( = ?auto_453378 ?auto_453387 ) ) ( not ( = ?auto_453379 ?auto_453380 ) ) ( not ( = ?auto_453379 ?auto_453381 ) ) ( not ( = ?auto_453379 ?auto_453382 ) ) ( not ( = ?auto_453379 ?auto_453383 ) ) ( not ( = ?auto_453379 ?auto_453384 ) ) ( not ( = ?auto_453379 ?auto_453385 ) ) ( not ( = ?auto_453379 ?auto_453386 ) ) ( not ( = ?auto_453379 ?auto_453387 ) ) ( not ( = ?auto_453380 ?auto_453381 ) ) ( not ( = ?auto_453380 ?auto_453382 ) ) ( not ( = ?auto_453380 ?auto_453383 ) ) ( not ( = ?auto_453380 ?auto_453384 ) ) ( not ( = ?auto_453380 ?auto_453385 ) ) ( not ( = ?auto_453380 ?auto_453386 ) ) ( not ( = ?auto_453380 ?auto_453387 ) ) ( not ( = ?auto_453381 ?auto_453382 ) ) ( not ( = ?auto_453381 ?auto_453383 ) ) ( not ( = ?auto_453381 ?auto_453384 ) ) ( not ( = ?auto_453381 ?auto_453385 ) ) ( not ( = ?auto_453381 ?auto_453386 ) ) ( not ( = ?auto_453381 ?auto_453387 ) ) ( not ( = ?auto_453382 ?auto_453383 ) ) ( not ( = ?auto_453382 ?auto_453384 ) ) ( not ( = ?auto_453382 ?auto_453385 ) ) ( not ( = ?auto_453382 ?auto_453386 ) ) ( not ( = ?auto_453382 ?auto_453387 ) ) ( not ( = ?auto_453383 ?auto_453384 ) ) ( not ( = ?auto_453383 ?auto_453385 ) ) ( not ( = ?auto_453383 ?auto_453386 ) ) ( not ( = ?auto_453383 ?auto_453387 ) ) ( not ( = ?auto_453384 ?auto_453385 ) ) ( not ( = ?auto_453384 ?auto_453386 ) ) ( not ( = ?auto_453384 ?auto_453387 ) ) ( not ( = ?auto_453385 ?auto_453386 ) ) ( not ( = ?auto_453385 ?auto_453387 ) ) ( not ( = ?auto_453386 ?auto_453387 ) ) ( ON ?auto_453385 ?auto_453386 ) ( ON ?auto_453384 ?auto_453385 ) ( ON ?auto_453383 ?auto_453384 ) ( ON ?auto_453382 ?auto_453383 ) ( ON ?auto_453381 ?auto_453382 ) ( ON ?auto_453380 ?auto_453381 ) ( ON ?auto_453379 ?auto_453380 ) ( ON ?auto_453378 ?auto_453379 ) ( ON ?auto_453377 ?auto_453378 ) ( CLEAR ?auto_453375 ) ( ON ?auto_453376 ?auto_453377 ) ( CLEAR ?auto_453376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_453373 ?auto_453374 ?auto_453375 ?auto_453376 )
      ( MAKE-14PILE ?auto_453373 ?auto_453374 ?auto_453375 ?auto_453376 ?auto_453377 ?auto_453378 ?auto_453379 ?auto_453380 ?auto_453381 ?auto_453382 ?auto_453383 ?auto_453384 ?auto_453385 ?auto_453386 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453402 - BLOCK
      ?auto_453403 - BLOCK
      ?auto_453404 - BLOCK
      ?auto_453405 - BLOCK
      ?auto_453406 - BLOCK
      ?auto_453407 - BLOCK
      ?auto_453408 - BLOCK
      ?auto_453409 - BLOCK
      ?auto_453410 - BLOCK
      ?auto_453411 - BLOCK
      ?auto_453412 - BLOCK
      ?auto_453413 - BLOCK
      ?auto_453414 - BLOCK
      ?auto_453415 - BLOCK
    )
    :vars
    (
      ?auto_453416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453415 ?auto_453416 ) ( ON-TABLE ?auto_453402 ) ( ON ?auto_453403 ?auto_453402 ) ( not ( = ?auto_453402 ?auto_453403 ) ) ( not ( = ?auto_453402 ?auto_453404 ) ) ( not ( = ?auto_453402 ?auto_453405 ) ) ( not ( = ?auto_453402 ?auto_453406 ) ) ( not ( = ?auto_453402 ?auto_453407 ) ) ( not ( = ?auto_453402 ?auto_453408 ) ) ( not ( = ?auto_453402 ?auto_453409 ) ) ( not ( = ?auto_453402 ?auto_453410 ) ) ( not ( = ?auto_453402 ?auto_453411 ) ) ( not ( = ?auto_453402 ?auto_453412 ) ) ( not ( = ?auto_453402 ?auto_453413 ) ) ( not ( = ?auto_453402 ?auto_453414 ) ) ( not ( = ?auto_453402 ?auto_453415 ) ) ( not ( = ?auto_453402 ?auto_453416 ) ) ( not ( = ?auto_453403 ?auto_453404 ) ) ( not ( = ?auto_453403 ?auto_453405 ) ) ( not ( = ?auto_453403 ?auto_453406 ) ) ( not ( = ?auto_453403 ?auto_453407 ) ) ( not ( = ?auto_453403 ?auto_453408 ) ) ( not ( = ?auto_453403 ?auto_453409 ) ) ( not ( = ?auto_453403 ?auto_453410 ) ) ( not ( = ?auto_453403 ?auto_453411 ) ) ( not ( = ?auto_453403 ?auto_453412 ) ) ( not ( = ?auto_453403 ?auto_453413 ) ) ( not ( = ?auto_453403 ?auto_453414 ) ) ( not ( = ?auto_453403 ?auto_453415 ) ) ( not ( = ?auto_453403 ?auto_453416 ) ) ( not ( = ?auto_453404 ?auto_453405 ) ) ( not ( = ?auto_453404 ?auto_453406 ) ) ( not ( = ?auto_453404 ?auto_453407 ) ) ( not ( = ?auto_453404 ?auto_453408 ) ) ( not ( = ?auto_453404 ?auto_453409 ) ) ( not ( = ?auto_453404 ?auto_453410 ) ) ( not ( = ?auto_453404 ?auto_453411 ) ) ( not ( = ?auto_453404 ?auto_453412 ) ) ( not ( = ?auto_453404 ?auto_453413 ) ) ( not ( = ?auto_453404 ?auto_453414 ) ) ( not ( = ?auto_453404 ?auto_453415 ) ) ( not ( = ?auto_453404 ?auto_453416 ) ) ( not ( = ?auto_453405 ?auto_453406 ) ) ( not ( = ?auto_453405 ?auto_453407 ) ) ( not ( = ?auto_453405 ?auto_453408 ) ) ( not ( = ?auto_453405 ?auto_453409 ) ) ( not ( = ?auto_453405 ?auto_453410 ) ) ( not ( = ?auto_453405 ?auto_453411 ) ) ( not ( = ?auto_453405 ?auto_453412 ) ) ( not ( = ?auto_453405 ?auto_453413 ) ) ( not ( = ?auto_453405 ?auto_453414 ) ) ( not ( = ?auto_453405 ?auto_453415 ) ) ( not ( = ?auto_453405 ?auto_453416 ) ) ( not ( = ?auto_453406 ?auto_453407 ) ) ( not ( = ?auto_453406 ?auto_453408 ) ) ( not ( = ?auto_453406 ?auto_453409 ) ) ( not ( = ?auto_453406 ?auto_453410 ) ) ( not ( = ?auto_453406 ?auto_453411 ) ) ( not ( = ?auto_453406 ?auto_453412 ) ) ( not ( = ?auto_453406 ?auto_453413 ) ) ( not ( = ?auto_453406 ?auto_453414 ) ) ( not ( = ?auto_453406 ?auto_453415 ) ) ( not ( = ?auto_453406 ?auto_453416 ) ) ( not ( = ?auto_453407 ?auto_453408 ) ) ( not ( = ?auto_453407 ?auto_453409 ) ) ( not ( = ?auto_453407 ?auto_453410 ) ) ( not ( = ?auto_453407 ?auto_453411 ) ) ( not ( = ?auto_453407 ?auto_453412 ) ) ( not ( = ?auto_453407 ?auto_453413 ) ) ( not ( = ?auto_453407 ?auto_453414 ) ) ( not ( = ?auto_453407 ?auto_453415 ) ) ( not ( = ?auto_453407 ?auto_453416 ) ) ( not ( = ?auto_453408 ?auto_453409 ) ) ( not ( = ?auto_453408 ?auto_453410 ) ) ( not ( = ?auto_453408 ?auto_453411 ) ) ( not ( = ?auto_453408 ?auto_453412 ) ) ( not ( = ?auto_453408 ?auto_453413 ) ) ( not ( = ?auto_453408 ?auto_453414 ) ) ( not ( = ?auto_453408 ?auto_453415 ) ) ( not ( = ?auto_453408 ?auto_453416 ) ) ( not ( = ?auto_453409 ?auto_453410 ) ) ( not ( = ?auto_453409 ?auto_453411 ) ) ( not ( = ?auto_453409 ?auto_453412 ) ) ( not ( = ?auto_453409 ?auto_453413 ) ) ( not ( = ?auto_453409 ?auto_453414 ) ) ( not ( = ?auto_453409 ?auto_453415 ) ) ( not ( = ?auto_453409 ?auto_453416 ) ) ( not ( = ?auto_453410 ?auto_453411 ) ) ( not ( = ?auto_453410 ?auto_453412 ) ) ( not ( = ?auto_453410 ?auto_453413 ) ) ( not ( = ?auto_453410 ?auto_453414 ) ) ( not ( = ?auto_453410 ?auto_453415 ) ) ( not ( = ?auto_453410 ?auto_453416 ) ) ( not ( = ?auto_453411 ?auto_453412 ) ) ( not ( = ?auto_453411 ?auto_453413 ) ) ( not ( = ?auto_453411 ?auto_453414 ) ) ( not ( = ?auto_453411 ?auto_453415 ) ) ( not ( = ?auto_453411 ?auto_453416 ) ) ( not ( = ?auto_453412 ?auto_453413 ) ) ( not ( = ?auto_453412 ?auto_453414 ) ) ( not ( = ?auto_453412 ?auto_453415 ) ) ( not ( = ?auto_453412 ?auto_453416 ) ) ( not ( = ?auto_453413 ?auto_453414 ) ) ( not ( = ?auto_453413 ?auto_453415 ) ) ( not ( = ?auto_453413 ?auto_453416 ) ) ( not ( = ?auto_453414 ?auto_453415 ) ) ( not ( = ?auto_453414 ?auto_453416 ) ) ( not ( = ?auto_453415 ?auto_453416 ) ) ( ON ?auto_453414 ?auto_453415 ) ( ON ?auto_453413 ?auto_453414 ) ( ON ?auto_453412 ?auto_453413 ) ( ON ?auto_453411 ?auto_453412 ) ( ON ?auto_453410 ?auto_453411 ) ( ON ?auto_453409 ?auto_453410 ) ( ON ?auto_453408 ?auto_453409 ) ( ON ?auto_453407 ?auto_453408 ) ( ON ?auto_453406 ?auto_453407 ) ( ON ?auto_453405 ?auto_453406 ) ( CLEAR ?auto_453403 ) ( ON ?auto_453404 ?auto_453405 ) ( CLEAR ?auto_453404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_453402 ?auto_453403 ?auto_453404 )
      ( MAKE-14PILE ?auto_453402 ?auto_453403 ?auto_453404 ?auto_453405 ?auto_453406 ?auto_453407 ?auto_453408 ?auto_453409 ?auto_453410 ?auto_453411 ?auto_453412 ?auto_453413 ?auto_453414 ?auto_453415 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453431 - BLOCK
      ?auto_453432 - BLOCK
      ?auto_453433 - BLOCK
      ?auto_453434 - BLOCK
      ?auto_453435 - BLOCK
      ?auto_453436 - BLOCK
      ?auto_453437 - BLOCK
      ?auto_453438 - BLOCK
      ?auto_453439 - BLOCK
      ?auto_453440 - BLOCK
      ?auto_453441 - BLOCK
      ?auto_453442 - BLOCK
      ?auto_453443 - BLOCK
      ?auto_453444 - BLOCK
    )
    :vars
    (
      ?auto_453445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453444 ?auto_453445 ) ( ON-TABLE ?auto_453431 ) ( ON ?auto_453432 ?auto_453431 ) ( not ( = ?auto_453431 ?auto_453432 ) ) ( not ( = ?auto_453431 ?auto_453433 ) ) ( not ( = ?auto_453431 ?auto_453434 ) ) ( not ( = ?auto_453431 ?auto_453435 ) ) ( not ( = ?auto_453431 ?auto_453436 ) ) ( not ( = ?auto_453431 ?auto_453437 ) ) ( not ( = ?auto_453431 ?auto_453438 ) ) ( not ( = ?auto_453431 ?auto_453439 ) ) ( not ( = ?auto_453431 ?auto_453440 ) ) ( not ( = ?auto_453431 ?auto_453441 ) ) ( not ( = ?auto_453431 ?auto_453442 ) ) ( not ( = ?auto_453431 ?auto_453443 ) ) ( not ( = ?auto_453431 ?auto_453444 ) ) ( not ( = ?auto_453431 ?auto_453445 ) ) ( not ( = ?auto_453432 ?auto_453433 ) ) ( not ( = ?auto_453432 ?auto_453434 ) ) ( not ( = ?auto_453432 ?auto_453435 ) ) ( not ( = ?auto_453432 ?auto_453436 ) ) ( not ( = ?auto_453432 ?auto_453437 ) ) ( not ( = ?auto_453432 ?auto_453438 ) ) ( not ( = ?auto_453432 ?auto_453439 ) ) ( not ( = ?auto_453432 ?auto_453440 ) ) ( not ( = ?auto_453432 ?auto_453441 ) ) ( not ( = ?auto_453432 ?auto_453442 ) ) ( not ( = ?auto_453432 ?auto_453443 ) ) ( not ( = ?auto_453432 ?auto_453444 ) ) ( not ( = ?auto_453432 ?auto_453445 ) ) ( not ( = ?auto_453433 ?auto_453434 ) ) ( not ( = ?auto_453433 ?auto_453435 ) ) ( not ( = ?auto_453433 ?auto_453436 ) ) ( not ( = ?auto_453433 ?auto_453437 ) ) ( not ( = ?auto_453433 ?auto_453438 ) ) ( not ( = ?auto_453433 ?auto_453439 ) ) ( not ( = ?auto_453433 ?auto_453440 ) ) ( not ( = ?auto_453433 ?auto_453441 ) ) ( not ( = ?auto_453433 ?auto_453442 ) ) ( not ( = ?auto_453433 ?auto_453443 ) ) ( not ( = ?auto_453433 ?auto_453444 ) ) ( not ( = ?auto_453433 ?auto_453445 ) ) ( not ( = ?auto_453434 ?auto_453435 ) ) ( not ( = ?auto_453434 ?auto_453436 ) ) ( not ( = ?auto_453434 ?auto_453437 ) ) ( not ( = ?auto_453434 ?auto_453438 ) ) ( not ( = ?auto_453434 ?auto_453439 ) ) ( not ( = ?auto_453434 ?auto_453440 ) ) ( not ( = ?auto_453434 ?auto_453441 ) ) ( not ( = ?auto_453434 ?auto_453442 ) ) ( not ( = ?auto_453434 ?auto_453443 ) ) ( not ( = ?auto_453434 ?auto_453444 ) ) ( not ( = ?auto_453434 ?auto_453445 ) ) ( not ( = ?auto_453435 ?auto_453436 ) ) ( not ( = ?auto_453435 ?auto_453437 ) ) ( not ( = ?auto_453435 ?auto_453438 ) ) ( not ( = ?auto_453435 ?auto_453439 ) ) ( not ( = ?auto_453435 ?auto_453440 ) ) ( not ( = ?auto_453435 ?auto_453441 ) ) ( not ( = ?auto_453435 ?auto_453442 ) ) ( not ( = ?auto_453435 ?auto_453443 ) ) ( not ( = ?auto_453435 ?auto_453444 ) ) ( not ( = ?auto_453435 ?auto_453445 ) ) ( not ( = ?auto_453436 ?auto_453437 ) ) ( not ( = ?auto_453436 ?auto_453438 ) ) ( not ( = ?auto_453436 ?auto_453439 ) ) ( not ( = ?auto_453436 ?auto_453440 ) ) ( not ( = ?auto_453436 ?auto_453441 ) ) ( not ( = ?auto_453436 ?auto_453442 ) ) ( not ( = ?auto_453436 ?auto_453443 ) ) ( not ( = ?auto_453436 ?auto_453444 ) ) ( not ( = ?auto_453436 ?auto_453445 ) ) ( not ( = ?auto_453437 ?auto_453438 ) ) ( not ( = ?auto_453437 ?auto_453439 ) ) ( not ( = ?auto_453437 ?auto_453440 ) ) ( not ( = ?auto_453437 ?auto_453441 ) ) ( not ( = ?auto_453437 ?auto_453442 ) ) ( not ( = ?auto_453437 ?auto_453443 ) ) ( not ( = ?auto_453437 ?auto_453444 ) ) ( not ( = ?auto_453437 ?auto_453445 ) ) ( not ( = ?auto_453438 ?auto_453439 ) ) ( not ( = ?auto_453438 ?auto_453440 ) ) ( not ( = ?auto_453438 ?auto_453441 ) ) ( not ( = ?auto_453438 ?auto_453442 ) ) ( not ( = ?auto_453438 ?auto_453443 ) ) ( not ( = ?auto_453438 ?auto_453444 ) ) ( not ( = ?auto_453438 ?auto_453445 ) ) ( not ( = ?auto_453439 ?auto_453440 ) ) ( not ( = ?auto_453439 ?auto_453441 ) ) ( not ( = ?auto_453439 ?auto_453442 ) ) ( not ( = ?auto_453439 ?auto_453443 ) ) ( not ( = ?auto_453439 ?auto_453444 ) ) ( not ( = ?auto_453439 ?auto_453445 ) ) ( not ( = ?auto_453440 ?auto_453441 ) ) ( not ( = ?auto_453440 ?auto_453442 ) ) ( not ( = ?auto_453440 ?auto_453443 ) ) ( not ( = ?auto_453440 ?auto_453444 ) ) ( not ( = ?auto_453440 ?auto_453445 ) ) ( not ( = ?auto_453441 ?auto_453442 ) ) ( not ( = ?auto_453441 ?auto_453443 ) ) ( not ( = ?auto_453441 ?auto_453444 ) ) ( not ( = ?auto_453441 ?auto_453445 ) ) ( not ( = ?auto_453442 ?auto_453443 ) ) ( not ( = ?auto_453442 ?auto_453444 ) ) ( not ( = ?auto_453442 ?auto_453445 ) ) ( not ( = ?auto_453443 ?auto_453444 ) ) ( not ( = ?auto_453443 ?auto_453445 ) ) ( not ( = ?auto_453444 ?auto_453445 ) ) ( ON ?auto_453443 ?auto_453444 ) ( ON ?auto_453442 ?auto_453443 ) ( ON ?auto_453441 ?auto_453442 ) ( ON ?auto_453440 ?auto_453441 ) ( ON ?auto_453439 ?auto_453440 ) ( ON ?auto_453438 ?auto_453439 ) ( ON ?auto_453437 ?auto_453438 ) ( ON ?auto_453436 ?auto_453437 ) ( ON ?auto_453435 ?auto_453436 ) ( ON ?auto_453434 ?auto_453435 ) ( CLEAR ?auto_453432 ) ( ON ?auto_453433 ?auto_453434 ) ( CLEAR ?auto_453433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_453431 ?auto_453432 ?auto_453433 )
      ( MAKE-14PILE ?auto_453431 ?auto_453432 ?auto_453433 ?auto_453434 ?auto_453435 ?auto_453436 ?auto_453437 ?auto_453438 ?auto_453439 ?auto_453440 ?auto_453441 ?auto_453442 ?auto_453443 ?auto_453444 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453460 - BLOCK
      ?auto_453461 - BLOCK
      ?auto_453462 - BLOCK
      ?auto_453463 - BLOCK
      ?auto_453464 - BLOCK
      ?auto_453465 - BLOCK
      ?auto_453466 - BLOCK
      ?auto_453467 - BLOCK
      ?auto_453468 - BLOCK
      ?auto_453469 - BLOCK
      ?auto_453470 - BLOCK
      ?auto_453471 - BLOCK
      ?auto_453472 - BLOCK
      ?auto_453473 - BLOCK
    )
    :vars
    (
      ?auto_453474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453473 ?auto_453474 ) ( ON-TABLE ?auto_453460 ) ( not ( = ?auto_453460 ?auto_453461 ) ) ( not ( = ?auto_453460 ?auto_453462 ) ) ( not ( = ?auto_453460 ?auto_453463 ) ) ( not ( = ?auto_453460 ?auto_453464 ) ) ( not ( = ?auto_453460 ?auto_453465 ) ) ( not ( = ?auto_453460 ?auto_453466 ) ) ( not ( = ?auto_453460 ?auto_453467 ) ) ( not ( = ?auto_453460 ?auto_453468 ) ) ( not ( = ?auto_453460 ?auto_453469 ) ) ( not ( = ?auto_453460 ?auto_453470 ) ) ( not ( = ?auto_453460 ?auto_453471 ) ) ( not ( = ?auto_453460 ?auto_453472 ) ) ( not ( = ?auto_453460 ?auto_453473 ) ) ( not ( = ?auto_453460 ?auto_453474 ) ) ( not ( = ?auto_453461 ?auto_453462 ) ) ( not ( = ?auto_453461 ?auto_453463 ) ) ( not ( = ?auto_453461 ?auto_453464 ) ) ( not ( = ?auto_453461 ?auto_453465 ) ) ( not ( = ?auto_453461 ?auto_453466 ) ) ( not ( = ?auto_453461 ?auto_453467 ) ) ( not ( = ?auto_453461 ?auto_453468 ) ) ( not ( = ?auto_453461 ?auto_453469 ) ) ( not ( = ?auto_453461 ?auto_453470 ) ) ( not ( = ?auto_453461 ?auto_453471 ) ) ( not ( = ?auto_453461 ?auto_453472 ) ) ( not ( = ?auto_453461 ?auto_453473 ) ) ( not ( = ?auto_453461 ?auto_453474 ) ) ( not ( = ?auto_453462 ?auto_453463 ) ) ( not ( = ?auto_453462 ?auto_453464 ) ) ( not ( = ?auto_453462 ?auto_453465 ) ) ( not ( = ?auto_453462 ?auto_453466 ) ) ( not ( = ?auto_453462 ?auto_453467 ) ) ( not ( = ?auto_453462 ?auto_453468 ) ) ( not ( = ?auto_453462 ?auto_453469 ) ) ( not ( = ?auto_453462 ?auto_453470 ) ) ( not ( = ?auto_453462 ?auto_453471 ) ) ( not ( = ?auto_453462 ?auto_453472 ) ) ( not ( = ?auto_453462 ?auto_453473 ) ) ( not ( = ?auto_453462 ?auto_453474 ) ) ( not ( = ?auto_453463 ?auto_453464 ) ) ( not ( = ?auto_453463 ?auto_453465 ) ) ( not ( = ?auto_453463 ?auto_453466 ) ) ( not ( = ?auto_453463 ?auto_453467 ) ) ( not ( = ?auto_453463 ?auto_453468 ) ) ( not ( = ?auto_453463 ?auto_453469 ) ) ( not ( = ?auto_453463 ?auto_453470 ) ) ( not ( = ?auto_453463 ?auto_453471 ) ) ( not ( = ?auto_453463 ?auto_453472 ) ) ( not ( = ?auto_453463 ?auto_453473 ) ) ( not ( = ?auto_453463 ?auto_453474 ) ) ( not ( = ?auto_453464 ?auto_453465 ) ) ( not ( = ?auto_453464 ?auto_453466 ) ) ( not ( = ?auto_453464 ?auto_453467 ) ) ( not ( = ?auto_453464 ?auto_453468 ) ) ( not ( = ?auto_453464 ?auto_453469 ) ) ( not ( = ?auto_453464 ?auto_453470 ) ) ( not ( = ?auto_453464 ?auto_453471 ) ) ( not ( = ?auto_453464 ?auto_453472 ) ) ( not ( = ?auto_453464 ?auto_453473 ) ) ( not ( = ?auto_453464 ?auto_453474 ) ) ( not ( = ?auto_453465 ?auto_453466 ) ) ( not ( = ?auto_453465 ?auto_453467 ) ) ( not ( = ?auto_453465 ?auto_453468 ) ) ( not ( = ?auto_453465 ?auto_453469 ) ) ( not ( = ?auto_453465 ?auto_453470 ) ) ( not ( = ?auto_453465 ?auto_453471 ) ) ( not ( = ?auto_453465 ?auto_453472 ) ) ( not ( = ?auto_453465 ?auto_453473 ) ) ( not ( = ?auto_453465 ?auto_453474 ) ) ( not ( = ?auto_453466 ?auto_453467 ) ) ( not ( = ?auto_453466 ?auto_453468 ) ) ( not ( = ?auto_453466 ?auto_453469 ) ) ( not ( = ?auto_453466 ?auto_453470 ) ) ( not ( = ?auto_453466 ?auto_453471 ) ) ( not ( = ?auto_453466 ?auto_453472 ) ) ( not ( = ?auto_453466 ?auto_453473 ) ) ( not ( = ?auto_453466 ?auto_453474 ) ) ( not ( = ?auto_453467 ?auto_453468 ) ) ( not ( = ?auto_453467 ?auto_453469 ) ) ( not ( = ?auto_453467 ?auto_453470 ) ) ( not ( = ?auto_453467 ?auto_453471 ) ) ( not ( = ?auto_453467 ?auto_453472 ) ) ( not ( = ?auto_453467 ?auto_453473 ) ) ( not ( = ?auto_453467 ?auto_453474 ) ) ( not ( = ?auto_453468 ?auto_453469 ) ) ( not ( = ?auto_453468 ?auto_453470 ) ) ( not ( = ?auto_453468 ?auto_453471 ) ) ( not ( = ?auto_453468 ?auto_453472 ) ) ( not ( = ?auto_453468 ?auto_453473 ) ) ( not ( = ?auto_453468 ?auto_453474 ) ) ( not ( = ?auto_453469 ?auto_453470 ) ) ( not ( = ?auto_453469 ?auto_453471 ) ) ( not ( = ?auto_453469 ?auto_453472 ) ) ( not ( = ?auto_453469 ?auto_453473 ) ) ( not ( = ?auto_453469 ?auto_453474 ) ) ( not ( = ?auto_453470 ?auto_453471 ) ) ( not ( = ?auto_453470 ?auto_453472 ) ) ( not ( = ?auto_453470 ?auto_453473 ) ) ( not ( = ?auto_453470 ?auto_453474 ) ) ( not ( = ?auto_453471 ?auto_453472 ) ) ( not ( = ?auto_453471 ?auto_453473 ) ) ( not ( = ?auto_453471 ?auto_453474 ) ) ( not ( = ?auto_453472 ?auto_453473 ) ) ( not ( = ?auto_453472 ?auto_453474 ) ) ( not ( = ?auto_453473 ?auto_453474 ) ) ( ON ?auto_453472 ?auto_453473 ) ( ON ?auto_453471 ?auto_453472 ) ( ON ?auto_453470 ?auto_453471 ) ( ON ?auto_453469 ?auto_453470 ) ( ON ?auto_453468 ?auto_453469 ) ( ON ?auto_453467 ?auto_453468 ) ( ON ?auto_453466 ?auto_453467 ) ( ON ?auto_453465 ?auto_453466 ) ( ON ?auto_453464 ?auto_453465 ) ( ON ?auto_453463 ?auto_453464 ) ( ON ?auto_453462 ?auto_453463 ) ( CLEAR ?auto_453460 ) ( ON ?auto_453461 ?auto_453462 ) ( CLEAR ?auto_453461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_453460 ?auto_453461 )
      ( MAKE-14PILE ?auto_453460 ?auto_453461 ?auto_453462 ?auto_453463 ?auto_453464 ?auto_453465 ?auto_453466 ?auto_453467 ?auto_453468 ?auto_453469 ?auto_453470 ?auto_453471 ?auto_453472 ?auto_453473 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453489 - BLOCK
      ?auto_453490 - BLOCK
      ?auto_453491 - BLOCK
      ?auto_453492 - BLOCK
      ?auto_453493 - BLOCK
      ?auto_453494 - BLOCK
      ?auto_453495 - BLOCK
      ?auto_453496 - BLOCK
      ?auto_453497 - BLOCK
      ?auto_453498 - BLOCK
      ?auto_453499 - BLOCK
      ?auto_453500 - BLOCK
      ?auto_453501 - BLOCK
      ?auto_453502 - BLOCK
    )
    :vars
    (
      ?auto_453503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453502 ?auto_453503 ) ( ON-TABLE ?auto_453489 ) ( not ( = ?auto_453489 ?auto_453490 ) ) ( not ( = ?auto_453489 ?auto_453491 ) ) ( not ( = ?auto_453489 ?auto_453492 ) ) ( not ( = ?auto_453489 ?auto_453493 ) ) ( not ( = ?auto_453489 ?auto_453494 ) ) ( not ( = ?auto_453489 ?auto_453495 ) ) ( not ( = ?auto_453489 ?auto_453496 ) ) ( not ( = ?auto_453489 ?auto_453497 ) ) ( not ( = ?auto_453489 ?auto_453498 ) ) ( not ( = ?auto_453489 ?auto_453499 ) ) ( not ( = ?auto_453489 ?auto_453500 ) ) ( not ( = ?auto_453489 ?auto_453501 ) ) ( not ( = ?auto_453489 ?auto_453502 ) ) ( not ( = ?auto_453489 ?auto_453503 ) ) ( not ( = ?auto_453490 ?auto_453491 ) ) ( not ( = ?auto_453490 ?auto_453492 ) ) ( not ( = ?auto_453490 ?auto_453493 ) ) ( not ( = ?auto_453490 ?auto_453494 ) ) ( not ( = ?auto_453490 ?auto_453495 ) ) ( not ( = ?auto_453490 ?auto_453496 ) ) ( not ( = ?auto_453490 ?auto_453497 ) ) ( not ( = ?auto_453490 ?auto_453498 ) ) ( not ( = ?auto_453490 ?auto_453499 ) ) ( not ( = ?auto_453490 ?auto_453500 ) ) ( not ( = ?auto_453490 ?auto_453501 ) ) ( not ( = ?auto_453490 ?auto_453502 ) ) ( not ( = ?auto_453490 ?auto_453503 ) ) ( not ( = ?auto_453491 ?auto_453492 ) ) ( not ( = ?auto_453491 ?auto_453493 ) ) ( not ( = ?auto_453491 ?auto_453494 ) ) ( not ( = ?auto_453491 ?auto_453495 ) ) ( not ( = ?auto_453491 ?auto_453496 ) ) ( not ( = ?auto_453491 ?auto_453497 ) ) ( not ( = ?auto_453491 ?auto_453498 ) ) ( not ( = ?auto_453491 ?auto_453499 ) ) ( not ( = ?auto_453491 ?auto_453500 ) ) ( not ( = ?auto_453491 ?auto_453501 ) ) ( not ( = ?auto_453491 ?auto_453502 ) ) ( not ( = ?auto_453491 ?auto_453503 ) ) ( not ( = ?auto_453492 ?auto_453493 ) ) ( not ( = ?auto_453492 ?auto_453494 ) ) ( not ( = ?auto_453492 ?auto_453495 ) ) ( not ( = ?auto_453492 ?auto_453496 ) ) ( not ( = ?auto_453492 ?auto_453497 ) ) ( not ( = ?auto_453492 ?auto_453498 ) ) ( not ( = ?auto_453492 ?auto_453499 ) ) ( not ( = ?auto_453492 ?auto_453500 ) ) ( not ( = ?auto_453492 ?auto_453501 ) ) ( not ( = ?auto_453492 ?auto_453502 ) ) ( not ( = ?auto_453492 ?auto_453503 ) ) ( not ( = ?auto_453493 ?auto_453494 ) ) ( not ( = ?auto_453493 ?auto_453495 ) ) ( not ( = ?auto_453493 ?auto_453496 ) ) ( not ( = ?auto_453493 ?auto_453497 ) ) ( not ( = ?auto_453493 ?auto_453498 ) ) ( not ( = ?auto_453493 ?auto_453499 ) ) ( not ( = ?auto_453493 ?auto_453500 ) ) ( not ( = ?auto_453493 ?auto_453501 ) ) ( not ( = ?auto_453493 ?auto_453502 ) ) ( not ( = ?auto_453493 ?auto_453503 ) ) ( not ( = ?auto_453494 ?auto_453495 ) ) ( not ( = ?auto_453494 ?auto_453496 ) ) ( not ( = ?auto_453494 ?auto_453497 ) ) ( not ( = ?auto_453494 ?auto_453498 ) ) ( not ( = ?auto_453494 ?auto_453499 ) ) ( not ( = ?auto_453494 ?auto_453500 ) ) ( not ( = ?auto_453494 ?auto_453501 ) ) ( not ( = ?auto_453494 ?auto_453502 ) ) ( not ( = ?auto_453494 ?auto_453503 ) ) ( not ( = ?auto_453495 ?auto_453496 ) ) ( not ( = ?auto_453495 ?auto_453497 ) ) ( not ( = ?auto_453495 ?auto_453498 ) ) ( not ( = ?auto_453495 ?auto_453499 ) ) ( not ( = ?auto_453495 ?auto_453500 ) ) ( not ( = ?auto_453495 ?auto_453501 ) ) ( not ( = ?auto_453495 ?auto_453502 ) ) ( not ( = ?auto_453495 ?auto_453503 ) ) ( not ( = ?auto_453496 ?auto_453497 ) ) ( not ( = ?auto_453496 ?auto_453498 ) ) ( not ( = ?auto_453496 ?auto_453499 ) ) ( not ( = ?auto_453496 ?auto_453500 ) ) ( not ( = ?auto_453496 ?auto_453501 ) ) ( not ( = ?auto_453496 ?auto_453502 ) ) ( not ( = ?auto_453496 ?auto_453503 ) ) ( not ( = ?auto_453497 ?auto_453498 ) ) ( not ( = ?auto_453497 ?auto_453499 ) ) ( not ( = ?auto_453497 ?auto_453500 ) ) ( not ( = ?auto_453497 ?auto_453501 ) ) ( not ( = ?auto_453497 ?auto_453502 ) ) ( not ( = ?auto_453497 ?auto_453503 ) ) ( not ( = ?auto_453498 ?auto_453499 ) ) ( not ( = ?auto_453498 ?auto_453500 ) ) ( not ( = ?auto_453498 ?auto_453501 ) ) ( not ( = ?auto_453498 ?auto_453502 ) ) ( not ( = ?auto_453498 ?auto_453503 ) ) ( not ( = ?auto_453499 ?auto_453500 ) ) ( not ( = ?auto_453499 ?auto_453501 ) ) ( not ( = ?auto_453499 ?auto_453502 ) ) ( not ( = ?auto_453499 ?auto_453503 ) ) ( not ( = ?auto_453500 ?auto_453501 ) ) ( not ( = ?auto_453500 ?auto_453502 ) ) ( not ( = ?auto_453500 ?auto_453503 ) ) ( not ( = ?auto_453501 ?auto_453502 ) ) ( not ( = ?auto_453501 ?auto_453503 ) ) ( not ( = ?auto_453502 ?auto_453503 ) ) ( ON ?auto_453501 ?auto_453502 ) ( ON ?auto_453500 ?auto_453501 ) ( ON ?auto_453499 ?auto_453500 ) ( ON ?auto_453498 ?auto_453499 ) ( ON ?auto_453497 ?auto_453498 ) ( ON ?auto_453496 ?auto_453497 ) ( ON ?auto_453495 ?auto_453496 ) ( ON ?auto_453494 ?auto_453495 ) ( ON ?auto_453493 ?auto_453494 ) ( ON ?auto_453492 ?auto_453493 ) ( ON ?auto_453491 ?auto_453492 ) ( CLEAR ?auto_453489 ) ( ON ?auto_453490 ?auto_453491 ) ( CLEAR ?auto_453490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_453489 ?auto_453490 )
      ( MAKE-14PILE ?auto_453489 ?auto_453490 ?auto_453491 ?auto_453492 ?auto_453493 ?auto_453494 ?auto_453495 ?auto_453496 ?auto_453497 ?auto_453498 ?auto_453499 ?auto_453500 ?auto_453501 ?auto_453502 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453518 - BLOCK
      ?auto_453519 - BLOCK
      ?auto_453520 - BLOCK
      ?auto_453521 - BLOCK
      ?auto_453522 - BLOCK
      ?auto_453523 - BLOCK
      ?auto_453524 - BLOCK
      ?auto_453525 - BLOCK
      ?auto_453526 - BLOCK
      ?auto_453527 - BLOCK
      ?auto_453528 - BLOCK
      ?auto_453529 - BLOCK
      ?auto_453530 - BLOCK
      ?auto_453531 - BLOCK
    )
    :vars
    (
      ?auto_453532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453531 ?auto_453532 ) ( not ( = ?auto_453518 ?auto_453519 ) ) ( not ( = ?auto_453518 ?auto_453520 ) ) ( not ( = ?auto_453518 ?auto_453521 ) ) ( not ( = ?auto_453518 ?auto_453522 ) ) ( not ( = ?auto_453518 ?auto_453523 ) ) ( not ( = ?auto_453518 ?auto_453524 ) ) ( not ( = ?auto_453518 ?auto_453525 ) ) ( not ( = ?auto_453518 ?auto_453526 ) ) ( not ( = ?auto_453518 ?auto_453527 ) ) ( not ( = ?auto_453518 ?auto_453528 ) ) ( not ( = ?auto_453518 ?auto_453529 ) ) ( not ( = ?auto_453518 ?auto_453530 ) ) ( not ( = ?auto_453518 ?auto_453531 ) ) ( not ( = ?auto_453518 ?auto_453532 ) ) ( not ( = ?auto_453519 ?auto_453520 ) ) ( not ( = ?auto_453519 ?auto_453521 ) ) ( not ( = ?auto_453519 ?auto_453522 ) ) ( not ( = ?auto_453519 ?auto_453523 ) ) ( not ( = ?auto_453519 ?auto_453524 ) ) ( not ( = ?auto_453519 ?auto_453525 ) ) ( not ( = ?auto_453519 ?auto_453526 ) ) ( not ( = ?auto_453519 ?auto_453527 ) ) ( not ( = ?auto_453519 ?auto_453528 ) ) ( not ( = ?auto_453519 ?auto_453529 ) ) ( not ( = ?auto_453519 ?auto_453530 ) ) ( not ( = ?auto_453519 ?auto_453531 ) ) ( not ( = ?auto_453519 ?auto_453532 ) ) ( not ( = ?auto_453520 ?auto_453521 ) ) ( not ( = ?auto_453520 ?auto_453522 ) ) ( not ( = ?auto_453520 ?auto_453523 ) ) ( not ( = ?auto_453520 ?auto_453524 ) ) ( not ( = ?auto_453520 ?auto_453525 ) ) ( not ( = ?auto_453520 ?auto_453526 ) ) ( not ( = ?auto_453520 ?auto_453527 ) ) ( not ( = ?auto_453520 ?auto_453528 ) ) ( not ( = ?auto_453520 ?auto_453529 ) ) ( not ( = ?auto_453520 ?auto_453530 ) ) ( not ( = ?auto_453520 ?auto_453531 ) ) ( not ( = ?auto_453520 ?auto_453532 ) ) ( not ( = ?auto_453521 ?auto_453522 ) ) ( not ( = ?auto_453521 ?auto_453523 ) ) ( not ( = ?auto_453521 ?auto_453524 ) ) ( not ( = ?auto_453521 ?auto_453525 ) ) ( not ( = ?auto_453521 ?auto_453526 ) ) ( not ( = ?auto_453521 ?auto_453527 ) ) ( not ( = ?auto_453521 ?auto_453528 ) ) ( not ( = ?auto_453521 ?auto_453529 ) ) ( not ( = ?auto_453521 ?auto_453530 ) ) ( not ( = ?auto_453521 ?auto_453531 ) ) ( not ( = ?auto_453521 ?auto_453532 ) ) ( not ( = ?auto_453522 ?auto_453523 ) ) ( not ( = ?auto_453522 ?auto_453524 ) ) ( not ( = ?auto_453522 ?auto_453525 ) ) ( not ( = ?auto_453522 ?auto_453526 ) ) ( not ( = ?auto_453522 ?auto_453527 ) ) ( not ( = ?auto_453522 ?auto_453528 ) ) ( not ( = ?auto_453522 ?auto_453529 ) ) ( not ( = ?auto_453522 ?auto_453530 ) ) ( not ( = ?auto_453522 ?auto_453531 ) ) ( not ( = ?auto_453522 ?auto_453532 ) ) ( not ( = ?auto_453523 ?auto_453524 ) ) ( not ( = ?auto_453523 ?auto_453525 ) ) ( not ( = ?auto_453523 ?auto_453526 ) ) ( not ( = ?auto_453523 ?auto_453527 ) ) ( not ( = ?auto_453523 ?auto_453528 ) ) ( not ( = ?auto_453523 ?auto_453529 ) ) ( not ( = ?auto_453523 ?auto_453530 ) ) ( not ( = ?auto_453523 ?auto_453531 ) ) ( not ( = ?auto_453523 ?auto_453532 ) ) ( not ( = ?auto_453524 ?auto_453525 ) ) ( not ( = ?auto_453524 ?auto_453526 ) ) ( not ( = ?auto_453524 ?auto_453527 ) ) ( not ( = ?auto_453524 ?auto_453528 ) ) ( not ( = ?auto_453524 ?auto_453529 ) ) ( not ( = ?auto_453524 ?auto_453530 ) ) ( not ( = ?auto_453524 ?auto_453531 ) ) ( not ( = ?auto_453524 ?auto_453532 ) ) ( not ( = ?auto_453525 ?auto_453526 ) ) ( not ( = ?auto_453525 ?auto_453527 ) ) ( not ( = ?auto_453525 ?auto_453528 ) ) ( not ( = ?auto_453525 ?auto_453529 ) ) ( not ( = ?auto_453525 ?auto_453530 ) ) ( not ( = ?auto_453525 ?auto_453531 ) ) ( not ( = ?auto_453525 ?auto_453532 ) ) ( not ( = ?auto_453526 ?auto_453527 ) ) ( not ( = ?auto_453526 ?auto_453528 ) ) ( not ( = ?auto_453526 ?auto_453529 ) ) ( not ( = ?auto_453526 ?auto_453530 ) ) ( not ( = ?auto_453526 ?auto_453531 ) ) ( not ( = ?auto_453526 ?auto_453532 ) ) ( not ( = ?auto_453527 ?auto_453528 ) ) ( not ( = ?auto_453527 ?auto_453529 ) ) ( not ( = ?auto_453527 ?auto_453530 ) ) ( not ( = ?auto_453527 ?auto_453531 ) ) ( not ( = ?auto_453527 ?auto_453532 ) ) ( not ( = ?auto_453528 ?auto_453529 ) ) ( not ( = ?auto_453528 ?auto_453530 ) ) ( not ( = ?auto_453528 ?auto_453531 ) ) ( not ( = ?auto_453528 ?auto_453532 ) ) ( not ( = ?auto_453529 ?auto_453530 ) ) ( not ( = ?auto_453529 ?auto_453531 ) ) ( not ( = ?auto_453529 ?auto_453532 ) ) ( not ( = ?auto_453530 ?auto_453531 ) ) ( not ( = ?auto_453530 ?auto_453532 ) ) ( not ( = ?auto_453531 ?auto_453532 ) ) ( ON ?auto_453530 ?auto_453531 ) ( ON ?auto_453529 ?auto_453530 ) ( ON ?auto_453528 ?auto_453529 ) ( ON ?auto_453527 ?auto_453528 ) ( ON ?auto_453526 ?auto_453527 ) ( ON ?auto_453525 ?auto_453526 ) ( ON ?auto_453524 ?auto_453525 ) ( ON ?auto_453523 ?auto_453524 ) ( ON ?auto_453522 ?auto_453523 ) ( ON ?auto_453521 ?auto_453522 ) ( ON ?auto_453520 ?auto_453521 ) ( ON ?auto_453519 ?auto_453520 ) ( ON ?auto_453518 ?auto_453519 ) ( CLEAR ?auto_453518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_453518 )
      ( MAKE-14PILE ?auto_453518 ?auto_453519 ?auto_453520 ?auto_453521 ?auto_453522 ?auto_453523 ?auto_453524 ?auto_453525 ?auto_453526 ?auto_453527 ?auto_453528 ?auto_453529 ?auto_453530 ?auto_453531 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_453547 - BLOCK
      ?auto_453548 - BLOCK
      ?auto_453549 - BLOCK
      ?auto_453550 - BLOCK
      ?auto_453551 - BLOCK
      ?auto_453552 - BLOCK
      ?auto_453553 - BLOCK
      ?auto_453554 - BLOCK
      ?auto_453555 - BLOCK
      ?auto_453556 - BLOCK
      ?auto_453557 - BLOCK
      ?auto_453558 - BLOCK
      ?auto_453559 - BLOCK
      ?auto_453560 - BLOCK
    )
    :vars
    (
      ?auto_453561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453560 ?auto_453561 ) ( not ( = ?auto_453547 ?auto_453548 ) ) ( not ( = ?auto_453547 ?auto_453549 ) ) ( not ( = ?auto_453547 ?auto_453550 ) ) ( not ( = ?auto_453547 ?auto_453551 ) ) ( not ( = ?auto_453547 ?auto_453552 ) ) ( not ( = ?auto_453547 ?auto_453553 ) ) ( not ( = ?auto_453547 ?auto_453554 ) ) ( not ( = ?auto_453547 ?auto_453555 ) ) ( not ( = ?auto_453547 ?auto_453556 ) ) ( not ( = ?auto_453547 ?auto_453557 ) ) ( not ( = ?auto_453547 ?auto_453558 ) ) ( not ( = ?auto_453547 ?auto_453559 ) ) ( not ( = ?auto_453547 ?auto_453560 ) ) ( not ( = ?auto_453547 ?auto_453561 ) ) ( not ( = ?auto_453548 ?auto_453549 ) ) ( not ( = ?auto_453548 ?auto_453550 ) ) ( not ( = ?auto_453548 ?auto_453551 ) ) ( not ( = ?auto_453548 ?auto_453552 ) ) ( not ( = ?auto_453548 ?auto_453553 ) ) ( not ( = ?auto_453548 ?auto_453554 ) ) ( not ( = ?auto_453548 ?auto_453555 ) ) ( not ( = ?auto_453548 ?auto_453556 ) ) ( not ( = ?auto_453548 ?auto_453557 ) ) ( not ( = ?auto_453548 ?auto_453558 ) ) ( not ( = ?auto_453548 ?auto_453559 ) ) ( not ( = ?auto_453548 ?auto_453560 ) ) ( not ( = ?auto_453548 ?auto_453561 ) ) ( not ( = ?auto_453549 ?auto_453550 ) ) ( not ( = ?auto_453549 ?auto_453551 ) ) ( not ( = ?auto_453549 ?auto_453552 ) ) ( not ( = ?auto_453549 ?auto_453553 ) ) ( not ( = ?auto_453549 ?auto_453554 ) ) ( not ( = ?auto_453549 ?auto_453555 ) ) ( not ( = ?auto_453549 ?auto_453556 ) ) ( not ( = ?auto_453549 ?auto_453557 ) ) ( not ( = ?auto_453549 ?auto_453558 ) ) ( not ( = ?auto_453549 ?auto_453559 ) ) ( not ( = ?auto_453549 ?auto_453560 ) ) ( not ( = ?auto_453549 ?auto_453561 ) ) ( not ( = ?auto_453550 ?auto_453551 ) ) ( not ( = ?auto_453550 ?auto_453552 ) ) ( not ( = ?auto_453550 ?auto_453553 ) ) ( not ( = ?auto_453550 ?auto_453554 ) ) ( not ( = ?auto_453550 ?auto_453555 ) ) ( not ( = ?auto_453550 ?auto_453556 ) ) ( not ( = ?auto_453550 ?auto_453557 ) ) ( not ( = ?auto_453550 ?auto_453558 ) ) ( not ( = ?auto_453550 ?auto_453559 ) ) ( not ( = ?auto_453550 ?auto_453560 ) ) ( not ( = ?auto_453550 ?auto_453561 ) ) ( not ( = ?auto_453551 ?auto_453552 ) ) ( not ( = ?auto_453551 ?auto_453553 ) ) ( not ( = ?auto_453551 ?auto_453554 ) ) ( not ( = ?auto_453551 ?auto_453555 ) ) ( not ( = ?auto_453551 ?auto_453556 ) ) ( not ( = ?auto_453551 ?auto_453557 ) ) ( not ( = ?auto_453551 ?auto_453558 ) ) ( not ( = ?auto_453551 ?auto_453559 ) ) ( not ( = ?auto_453551 ?auto_453560 ) ) ( not ( = ?auto_453551 ?auto_453561 ) ) ( not ( = ?auto_453552 ?auto_453553 ) ) ( not ( = ?auto_453552 ?auto_453554 ) ) ( not ( = ?auto_453552 ?auto_453555 ) ) ( not ( = ?auto_453552 ?auto_453556 ) ) ( not ( = ?auto_453552 ?auto_453557 ) ) ( not ( = ?auto_453552 ?auto_453558 ) ) ( not ( = ?auto_453552 ?auto_453559 ) ) ( not ( = ?auto_453552 ?auto_453560 ) ) ( not ( = ?auto_453552 ?auto_453561 ) ) ( not ( = ?auto_453553 ?auto_453554 ) ) ( not ( = ?auto_453553 ?auto_453555 ) ) ( not ( = ?auto_453553 ?auto_453556 ) ) ( not ( = ?auto_453553 ?auto_453557 ) ) ( not ( = ?auto_453553 ?auto_453558 ) ) ( not ( = ?auto_453553 ?auto_453559 ) ) ( not ( = ?auto_453553 ?auto_453560 ) ) ( not ( = ?auto_453553 ?auto_453561 ) ) ( not ( = ?auto_453554 ?auto_453555 ) ) ( not ( = ?auto_453554 ?auto_453556 ) ) ( not ( = ?auto_453554 ?auto_453557 ) ) ( not ( = ?auto_453554 ?auto_453558 ) ) ( not ( = ?auto_453554 ?auto_453559 ) ) ( not ( = ?auto_453554 ?auto_453560 ) ) ( not ( = ?auto_453554 ?auto_453561 ) ) ( not ( = ?auto_453555 ?auto_453556 ) ) ( not ( = ?auto_453555 ?auto_453557 ) ) ( not ( = ?auto_453555 ?auto_453558 ) ) ( not ( = ?auto_453555 ?auto_453559 ) ) ( not ( = ?auto_453555 ?auto_453560 ) ) ( not ( = ?auto_453555 ?auto_453561 ) ) ( not ( = ?auto_453556 ?auto_453557 ) ) ( not ( = ?auto_453556 ?auto_453558 ) ) ( not ( = ?auto_453556 ?auto_453559 ) ) ( not ( = ?auto_453556 ?auto_453560 ) ) ( not ( = ?auto_453556 ?auto_453561 ) ) ( not ( = ?auto_453557 ?auto_453558 ) ) ( not ( = ?auto_453557 ?auto_453559 ) ) ( not ( = ?auto_453557 ?auto_453560 ) ) ( not ( = ?auto_453557 ?auto_453561 ) ) ( not ( = ?auto_453558 ?auto_453559 ) ) ( not ( = ?auto_453558 ?auto_453560 ) ) ( not ( = ?auto_453558 ?auto_453561 ) ) ( not ( = ?auto_453559 ?auto_453560 ) ) ( not ( = ?auto_453559 ?auto_453561 ) ) ( not ( = ?auto_453560 ?auto_453561 ) ) ( ON ?auto_453559 ?auto_453560 ) ( ON ?auto_453558 ?auto_453559 ) ( ON ?auto_453557 ?auto_453558 ) ( ON ?auto_453556 ?auto_453557 ) ( ON ?auto_453555 ?auto_453556 ) ( ON ?auto_453554 ?auto_453555 ) ( ON ?auto_453553 ?auto_453554 ) ( ON ?auto_453552 ?auto_453553 ) ( ON ?auto_453551 ?auto_453552 ) ( ON ?auto_453550 ?auto_453551 ) ( ON ?auto_453549 ?auto_453550 ) ( ON ?auto_453548 ?auto_453549 ) ( ON ?auto_453547 ?auto_453548 ) ( CLEAR ?auto_453547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_453547 )
      ( MAKE-14PILE ?auto_453547 ?auto_453548 ?auto_453549 ?auto_453550 ?auto_453551 ?auto_453552 ?auto_453553 ?auto_453554 ?auto_453555 ?auto_453556 ?auto_453557 ?auto_453558 ?auto_453559 ?auto_453560 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453577 - BLOCK
      ?auto_453578 - BLOCK
      ?auto_453579 - BLOCK
      ?auto_453580 - BLOCK
      ?auto_453581 - BLOCK
      ?auto_453582 - BLOCK
      ?auto_453583 - BLOCK
      ?auto_453584 - BLOCK
      ?auto_453585 - BLOCK
      ?auto_453586 - BLOCK
      ?auto_453587 - BLOCK
      ?auto_453588 - BLOCK
      ?auto_453589 - BLOCK
      ?auto_453590 - BLOCK
      ?auto_453591 - BLOCK
    )
    :vars
    (
      ?auto_453592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_453590 ) ( ON ?auto_453591 ?auto_453592 ) ( CLEAR ?auto_453591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_453577 ) ( ON ?auto_453578 ?auto_453577 ) ( ON ?auto_453579 ?auto_453578 ) ( ON ?auto_453580 ?auto_453579 ) ( ON ?auto_453581 ?auto_453580 ) ( ON ?auto_453582 ?auto_453581 ) ( ON ?auto_453583 ?auto_453582 ) ( ON ?auto_453584 ?auto_453583 ) ( ON ?auto_453585 ?auto_453584 ) ( ON ?auto_453586 ?auto_453585 ) ( ON ?auto_453587 ?auto_453586 ) ( ON ?auto_453588 ?auto_453587 ) ( ON ?auto_453589 ?auto_453588 ) ( ON ?auto_453590 ?auto_453589 ) ( not ( = ?auto_453577 ?auto_453578 ) ) ( not ( = ?auto_453577 ?auto_453579 ) ) ( not ( = ?auto_453577 ?auto_453580 ) ) ( not ( = ?auto_453577 ?auto_453581 ) ) ( not ( = ?auto_453577 ?auto_453582 ) ) ( not ( = ?auto_453577 ?auto_453583 ) ) ( not ( = ?auto_453577 ?auto_453584 ) ) ( not ( = ?auto_453577 ?auto_453585 ) ) ( not ( = ?auto_453577 ?auto_453586 ) ) ( not ( = ?auto_453577 ?auto_453587 ) ) ( not ( = ?auto_453577 ?auto_453588 ) ) ( not ( = ?auto_453577 ?auto_453589 ) ) ( not ( = ?auto_453577 ?auto_453590 ) ) ( not ( = ?auto_453577 ?auto_453591 ) ) ( not ( = ?auto_453577 ?auto_453592 ) ) ( not ( = ?auto_453578 ?auto_453579 ) ) ( not ( = ?auto_453578 ?auto_453580 ) ) ( not ( = ?auto_453578 ?auto_453581 ) ) ( not ( = ?auto_453578 ?auto_453582 ) ) ( not ( = ?auto_453578 ?auto_453583 ) ) ( not ( = ?auto_453578 ?auto_453584 ) ) ( not ( = ?auto_453578 ?auto_453585 ) ) ( not ( = ?auto_453578 ?auto_453586 ) ) ( not ( = ?auto_453578 ?auto_453587 ) ) ( not ( = ?auto_453578 ?auto_453588 ) ) ( not ( = ?auto_453578 ?auto_453589 ) ) ( not ( = ?auto_453578 ?auto_453590 ) ) ( not ( = ?auto_453578 ?auto_453591 ) ) ( not ( = ?auto_453578 ?auto_453592 ) ) ( not ( = ?auto_453579 ?auto_453580 ) ) ( not ( = ?auto_453579 ?auto_453581 ) ) ( not ( = ?auto_453579 ?auto_453582 ) ) ( not ( = ?auto_453579 ?auto_453583 ) ) ( not ( = ?auto_453579 ?auto_453584 ) ) ( not ( = ?auto_453579 ?auto_453585 ) ) ( not ( = ?auto_453579 ?auto_453586 ) ) ( not ( = ?auto_453579 ?auto_453587 ) ) ( not ( = ?auto_453579 ?auto_453588 ) ) ( not ( = ?auto_453579 ?auto_453589 ) ) ( not ( = ?auto_453579 ?auto_453590 ) ) ( not ( = ?auto_453579 ?auto_453591 ) ) ( not ( = ?auto_453579 ?auto_453592 ) ) ( not ( = ?auto_453580 ?auto_453581 ) ) ( not ( = ?auto_453580 ?auto_453582 ) ) ( not ( = ?auto_453580 ?auto_453583 ) ) ( not ( = ?auto_453580 ?auto_453584 ) ) ( not ( = ?auto_453580 ?auto_453585 ) ) ( not ( = ?auto_453580 ?auto_453586 ) ) ( not ( = ?auto_453580 ?auto_453587 ) ) ( not ( = ?auto_453580 ?auto_453588 ) ) ( not ( = ?auto_453580 ?auto_453589 ) ) ( not ( = ?auto_453580 ?auto_453590 ) ) ( not ( = ?auto_453580 ?auto_453591 ) ) ( not ( = ?auto_453580 ?auto_453592 ) ) ( not ( = ?auto_453581 ?auto_453582 ) ) ( not ( = ?auto_453581 ?auto_453583 ) ) ( not ( = ?auto_453581 ?auto_453584 ) ) ( not ( = ?auto_453581 ?auto_453585 ) ) ( not ( = ?auto_453581 ?auto_453586 ) ) ( not ( = ?auto_453581 ?auto_453587 ) ) ( not ( = ?auto_453581 ?auto_453588 ) ) ( not ( = ?auto_453581 ?auto_453589 ) ) ( not ( = ?auto_453581 ?auto_453590 ) ) ( not ( = ?auto_453581 ?auto_453591 ) ) ( not ( = ?auto_453581 ?auto_453592 ) ) ( not ( = ?auto_453582 ?auto_453583 ) ) ( not ( = ?auto_453582 ?auto_453584 ) ) ( not ( = ?auto_453582 ?auto_453585 ) ) ( not ( = ?auto_453582 ?auto_453586 ) ) ( not ( = ?auto_453582 ?auto_453587 ) ) ( not ( = ?auto_453582 ?auto_453588 ) ) ( not ( = ?auto_453582 ?auto_453589 ) ) ( not ( = ?auto_453582 ?auto_453590 ) ) ( not ( = ?auto_453582 ?auto_453591 ) ) ( not ( = ?auto_453582 ?auto_453592 ) ) ( not ( = ?auto_453583 ?auto_453584 ) ) ( not ( = ?auto_453583 ?auto_453585 ) ) ( not ( = ?auto_453583 ?auto_453586 ) ) ( not ( = ?auto_453583 ?auto_453587 ) ) ( not ( = ?auto_453583 ?auto_453588 ) ) ( not ( = ?auto_453583 ?auto_453589 ) ) ( not ( = ?auto_453583 ?auto_453590 ) ) ( not ( = ?auto_453583 ?auto_453591 ) ) ( not ( = ?auto_453583 ?auto_453592 ) ) ( not ( = ?auto_453584 ?auto_453585 ) ) ( not ( = ?auto_453584 ?auto_453586 ) ) ( not ( = ?auto_453584 ?auto_453587 ) ) ( not ( = ?auto_453584 ?auto_453588 ) ) ( not ( = ?auto_453584 ?auto_453589 ) ) ( not ( = ?auto_453584 ?auto_453590 ) ) ( not ( = ?auto_453584 ?auto_453591 ) ) ( not ( = ?auto_453584 ?auto_453592 ) ) ( not ( = ?auto_453585 ?auto_453586 ) ) ( not ( = ?auto_453585 ?auto_453587 ) ) ( not ( = ?auto_453585 ?auto_453588 ) ) ( not ( = ?auto_453585 ?auto_453589 ) ) ( not ( = ?auto_453585 ?auto_453590 ) ) ( not ( = ?auto_453585 ?auto_453591 ) ) ( not ( = ?auto_453585 ?auto_453592 ) ) ( not ( = ?auto_453586 ?auto_453587 ) ) ( not ( = ?auto_453586 ?auto_453588 ) ) ( not ( = ?auto_453586 ?auto_453589 ) ) ( not ( = ?auto_453586 ?auto_453590 ) ) ( not ( = ?auto_453586 ?auto_453591 ) ) ( not ( = ?auto_453586 ?auto_453592 ) ) ( not ( = ?auto_453587 ?auto_453588 ) ) ( not ( = ?auto_453587 ?auto_453589 ) ) ( not ( = ?auto_453587 ?auto_453590 ) ) ( not ( = ?auto_453587 ?auto_453591 ) ) ( not ( = ?auto_453587 ?auto_453592 ) ) ( not ( = ?auto_453588 ?auto_453589 ) ) ( not ( = ?auto_453588 ?auto_453590 ) ) ( not ( = ?auto_453588 ?auto_453591 ) ) ( not ( = ?auto_453588 ?auto_453592 ) ) ( not ( = ?auto_453589 ?auto_453590 ) ) ( not ( = ?auto_453589 ?auto_453591 ) ) ( not ( = ?auto_453589 ?auto_453592 ) ) ( not ( = ?auto_453590 ?auto_453591 ) ) ( not ( = ?auto_453590 ?auto_453592 ) ) ( not ( = ?auto_453591 ?auto_453592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_453591 ?auto_453592 )
      ( !STACK ?auto_453591 ?auto_453590 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453608 - BLOCK
      ?auto_453609 - BLOCK
      ?auto_453610 - BLOCK
      ?auto_453611 - BLOCK
      ?auto_453612 - BLOCK
      ?auto_453613 - BLOCK
      ?auto_453614 - BLOCK
      ?auto_453615 - BLOCK
      ?auto_453616 - BLOCK
      ?auto_453617 - BLOCK
      ?auto_453618 - BLOCK
      ?auto_453619 - BLOCK
      ?auto_453620 - BLOCK
      ?auto_453621 - BLOCK
      ?auto_453622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_453621 ) ( ON-TABLE ?auto_453622 ) ( CLEAR ?auto_453622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_453608 ) ( ON ?auto_453609 ?auto_453608 ) ( ON ?auto_453610 ?auto_453609 ) ( ON ?auto_453611 ?auto_453610 ) ( ON ?auto_453612 ?auto_453611 ) ( ON ?auto_453613 ?auto_453612 ) ( ON ?auto_453614 ?auto_453613 ) ( ON ?auto_453615 ?auto_453614 ) ( ON ?auto_453616 ?auto_453615 ) ( ON ?auto_453617 ?auto_453616 ) ( ON ?auto_453618 ?auto_453617 ) ( ON ?auto_453619 ?auto_453618 ) ( ON ?auto_453620 ?auto_453619 ) ( ON ?auto_453621 ?auto_453620 ) ( not ( = ?auto_453608 ?auto_453609 ) ) ( not ( = ?auto_453608 ?auto_453610 ) ) ( not ( = ?auto_453608 ?auto_453611 ) ) ( not ( = ?auto_453608 ?auto_453612 ) ) ( not ( = ?auto_453608 ?auto_453613 ) ) ( not ( = ?auto_453608 ?auto_453614 ) ) ( not ( = ?auto_453608 ?auto_453615 ) ) ( not ( = ?auto_453608 ?auto_453616 ) ) ( not ( = ?auto_453608 ?auto_453617 ) ) ( not ( = ?auto_453608 ?auto_453618 ) ) ( not ( = ?auto_453608 ?auto_453619 ) ) ( not ( = ?auto_453608 ?auto_453620 ) ) ( not ( = ?auto_453608 ?auto_453621 ) ) ( not ( = ?auto_453608 ?auto_453622 ) ) ( not ( = ?auto_453609 ?auto_453610 ) ) ( not ( = ?auto_453609 ?auto_453611 ) ) ( not ( = ?auto_453609 ?auto_453612 ) ) ( not ( = ?auto_453609 ?auto_453613 ) ) ( not ( = ?auto_453609 ?auto_453614 ) ) ( not ( = ?auto_453609 ?auto_453615 ) ) ( not ( = ?auto_453609 ?auto_453616 ) ) ( not ( = ?auto_453609 ?auto_453617 ) ) ( not ( = ?auto_453609 ?auto_453618 ) ) ( not ( = ?auto_453609 ?auto_453619 ) ) ( not ( = ?auto_453609 ?auto_453620 ) ) ( not ( = ?auto_453609 ?auto_453621 ) ) ( not ( = ?auto_453609 ?auto_453622 ) ) ( not ( = ?auto_453610 ?auto_453611 ) ) ( not ( = ?auto_453610 ?auto_453612 ) ) ( not ( = ?auto_453610 ?auto_453613 ) ) ( not ( = ?auto_453610 ?auto_453614 ) ) ( not ( = ?auto_453610 ?auto_453615 ) ) ( not ( = ?auto_453610 ?auto_453616 ) ) ( not ( = ?auto_453610 ?auto_453617 ) ) ( not ( = ?auto_453610 ?auto_453618 ) ) ( not ( = ?auto_453610 ?auto_453619 ) ) ( not ( = ?auto_453610 ?auto_453620 ) ) ( not ( = ?auto_453610 ?auto_453621 ) ) ( not ( = ?auto_453610 ?auto_453622 ) ) ( not ( = ?auto_453611 ?auto_453612 ) ) ( not ( = ?auto_453611 ?auto_453613 ) ) ( not ( = ?auto_453611 ?auto_453614 ) ) ( not ( = ?auto_453611 ?auto_453615 ) ) ( not ( = ?auto_453611 ?auto_453616 ) ) ( not ( = ?auto_453611 ?auto_453617 ) ) ( not ( = ?auto_453611 ?auto_453618 ) ) ( not ( = ?auto_453611 ?auto_453619 ) ) ( not ( = ?auto_453611 ?auto_453620 ) ) ( not ( = ?auto_453611 ?auto_453621 ) ) ( not ( = ?auto_453611 ?auto_453622 ) ) ( not ( = ?auto_453612 ?auto_453613 ) ) ( not ( = ?auto_453612 ?auto_453614 ) ) ( not ( = ?auto_453612 ?auto_453615 ) ) ( not ( = ?auto_453612 ?auto_453616 ) ) ( not ( = ?auto_453612 ?auto_453617 ) ) ( not ( = ?auto_453612 ?auto_453618 ) ) ( not ( = ?auto_453612 ?auto_453619 ) ) ( not ( = ?auto_453612 ?auto_453620 ) ) ( not ( = ?auto_453612 ?auto_453621 ) ) ( not ( = ?auto_453612 ?auto_453622 ) ) ( not ( = ?auto_453613 ?auto_453614 ) ) ( not ( = ?auto_453613 ?auto_453615 ) ) ( not ( = ?auto_453613 ?auto_453616 ) ) ( not ( = ?auto_453613 ?auto_453617 ) ) ( not ( = ?auto_453613 ?auto_453618 ) ) ( not ( = ?auto_453613 ?auto_453619 ) ) ( not ( = ?auto_453613 ?auto_453620 ) ) ( not ( = ?auto_453613 ?auto_453621 ) ) ( not ( = ?auto_453613 ?auto_453622 ) ) ( not ( = ?auto_453614 ?auto_453615 ) ) ( not ( = ?auto_453614 ?auto_453616 ) ) ( not ( = ?auto_453614 ?auto_453617 ) ) ( not ( = ?auto_453614 ?auto_453618 ) ) ( not ( = ?auto_453614 ?auto_453619 ) ) ( not ( = ?auto_453614 ?auto_453620 ) ) ( not ( = ?auto_453614 ?auto_453621 ) ) ( not ( = ?auto_453614 ?auto_453622 ) ) ( not ( = ?auto_453615 ?auto_453616 ) ) ( not ( = ?auto_453615 ?auto_453617 ) ) ( not ( = ?auto_453615 ?auto_453618 ) ) ( not ( = ?auto_453615 ?auto_453619 ) ) ( not ( = ?auto_453615 ?auto_453620 ) ) ( not ( = ?auto_453615 ?auto_453621 ) ) ( not ( = ?auto_453615 ?auto_453622 ) ) ( not ( = ?auto_453616 ?auto_453617 ) ) ( not ( = ?auto_453616 ?auto_453618 ) ) ( not ( = ?auto_453616 ?auto_453619 ) ) ( not ( = ?auto_453616 ?auto_453620 ) ) ( not ( = ?auto_453616 ?auto_453621 ) ) ( not ( = ?auto_453616 ?auto_453622 ) ) ( not ( = ?auto_453617 ?auto_453618 ) ) ( not ( = ?auto_453617 ?auto_453619 ) ) ( not ( = ?auto_453617 ?auto_453620 ) ) ( not ( = ?auto_453617 ?auto_453621 ) ) ( not ( = ?auto_453617 ?auto_453622 ) ) ( not ( = ?auto_453618 ?auto_453619 ) ) ( not ( = ?auto_453618 ?auto_453620 ) ) ( not ( = ?auto_453618 ?auto_453621 ) ) ( not ( = ?auto_453618 ?auto_453622 ) ) ( not ( = ?auto_453619 ?auto_453620 ) ) ( not ( = ?auto_453619 ?auto_453621 ) ) ( not ( = ?auto_453619 ?auto_453622 ) ) ( not ( = ?auto_453620 ?auto_453621 ) ) ( not ( = ?auto_453620 ?auto_453622 ) ) ( not ( = ?auto_453621 ?auto_453622 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_453622 )
      ( !STACK ?auto_453622 ?auto_453621 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453638 - BLOCK
      ?auto_453639 - BLOCK
      ?auto_453640 - BLOCK
      ?auto_453641 - BLOCK
      ?auto_453642 - BLOCK
      ?auto_453643 - BLOCK
      ?auto_453644 - BLOCK
      ?auto_453645 - BLOCK
      ?auto_453646 - BLOCK
      ?auto_453647 - BLOCK
      ?auto_453648 - BLOCK
      ?auto_453649 - BLOCK
      ?auto_453650 - BLOCK
      ?auto_453651 - BLOCK
      ?auto_453652 - BLOCK
    )
    :vars
    (
      ?auto_453653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453652 ?auto_453653 ) ( ON-TABLE ?auto_453638 ) ( ON ?auto_453639 ?auto_453638 ) ( ON ?auto_453640 ?auto_453639 ) ( ON ?auto_453641 ?auto_453640 ) ( ON ?auto_453642 ?auto_453641 ) ( ON ?auto_453643 ?auto_453642 ) ( ON ?auto_453644 ?auto_453643 ) ( ON ?auto_453645 ?auto_453644 ) ( ON ?auto_453646 ?auto_453645 ) ( ON ?auto_453647 ?auto_453646 ) ( ON ?auto_453648 ?auto_453647 ) ( ON ?auto_453649 ?auto_453648 ) ( ON ?auto_453650 ?auto_453649 ) ( not ( = ?auto_453638 ?auto_453639 ) ) ( not ( = ?auto_453638 ?auto_453640 ) ) ( not ( = ?auto_453638 ?auto_453641 ) ) ( not ( = ?auto_453638 ?auto_453642 ) ) ( not ( = ?auto_453638 ?auto_453643 ) ) ( not ( = ?auto_453638 ?auto_453644 ) ) ( not ( = ?auto_453638 ?auto_453645 ) ) ( not ( = ?auto_453638 ?auto_453646 ) ) ( not ( = ?auto_453638 ?auto_453647 ) ) ( not ( = ?auto_453638 ?auto_453648 ) ) ( not ( = ?auto_453638 ?auto_453649 ) ) ( not ( = ?auto_453638 ?auto_453650 ) ) ( not ( = ?auto_453638 ?auto_453651 ) ) ( not ( = ?auto_453638 ?auto_453652 ) ) ( not ( = ?auto_453638 ?auto_453653 ) ) ( not ( = ?auto_453639 ?auto_453640 ) ) ( not ( = ?auto_453639 ?auto_453641 ) ) ( not ( = ?auto_453639 ?auto_453642 ) ) ( not ( = ?auto_453639 ?auto_453643 ) ) ( not ( = ?auto_453639 ?auto_453644 ) ) ( not ( = ?auto_453639 ?auto_453645 ) ) ( not ( = ?auto_453639 ?auto_453646 ) ) ( not ( = ?auto_453639 ?auto_453647 ) ) ( not ( = ?auto_453639 ?auto_453648 ) ) ( not ( = ?auto_453639 ?auto_453649 ) ) ( not ( = ?auto_453639 ?auto_453650 ) ) ( not ( = ?auto_453639 ?auto_453651 ) ) ( not ( = ?auto_453639 ?auto_453652 ) ) ( not ( = ?auto_453639 ?auto_453653 ) ) ( not ( = ?auto_453640 ?auto_453641 ) ) ( not ( = ?auto_453640 ?auto_453642 ) ) ( not ( = ?auto_453640 ?auto_453643 ) ) ( not ( = ?auto_453640 ?auto_453644 ) ) ( not ( = ?auto_453640 ?auto_453645 ) ) ( not ( = ?auto_453640 ?auto_453646 ) ) ( not ( = ?auto_453640 ?auto_453647 ) ) ( not ( = ?auto_453640 ?auto_453648 ) ) ( not ( = ?auto_453640 ?auto_453649 ) ) ( not ( = ?auto_453640 ?auto_453650 ) ) ( not ( = ?auto_453640 ?auto_453651 ) ) ( not ( = ?auto_453640 ?auto_453652 ) ) ( not ( = ?auto_453640 ?auto_453653 ) ) ( not ( = ?auto_453641 ?auto_453642 ) ) ( not ( = ?auto_453641 ?auto_453643 ) ) ( not ( = ?auto_453641 ?auto_453644 ) ) ( not ( = ?auto_453641 ?auto_453645 ) ) ( not ( = ?auto_453641 ?auto_453646 ) ) ( not ( = ?auto_453641 ?auto_453647 ) ) ( not ( = ?auto_453641 ?auto_453648 ) ) ( not ( = ?auto_453641 ?auto_453649 ) ) ( not ( = ?auto_453641 ?auto_453650 ) ) ( not ( = ?auto_453641 ?auto_453651 ) ) ( not ( = ?auto_453641 ?auto_453652 ) ) ( not ( = ?auto_453641 ?auto_453653 ) ) ( not ( = ?auto_453642 ?auto_453643 ) ) ( not ( = ?auto_453642 ?auto_453644 ) ) ( not ( = ?auto_453642 ?auto_453645 ) ) ( not ( = ?auto_453642 ?auto_453646 ) ) ( not ( = ?auto_453642 ?auto_453647 ) ) ( not ( = ?auto_453642 ?auto_453648 ) ) ( not ( = ?auto_453642 ?auto_453649 ) ) ( not ( = ?auto_453642 ?auto_453650 ) ) ( not ( = ?auto_453642 ?auto_453651 ) ) ( not ( = ?auto_453642 ?auto_453652 ) ) ( not ( = ?auto_453642 ?auto_453653 ) ) ( not ( = ?auto_453643 ?auto_453644 ) ) ( not ( = ?auto_453643 ?auto_453645 ) ) ( not ( = ?auto_453643 ?auto_453646 ) ) ( not ( = ?auto_453643 ?auto_453647 ) ) ( not ( = ?auto_453643 ?auto_453648 ) ) ( not ( = ?auto_453643 ?auto_453649 ) ) ( not ( = ?auto_453643 ?auto_453650 ) ) ( not ( = ?auto_453643 ?auto_453651 ) ) ( not ( = ?auto_453643 ?auto_453652 ) ) ( not ( = ?auto_453643 ?auto_453653 ) ) ( not ( = ?auto_453644 ?auto_453645 ) ) ( not ( = ?auto_453644 ?auto_453646 ) ) ( not ( = ?auto_453644 ?auto_453647 ) ) ( not ( = ?auto_453644 ?auto_453648 ) ) ( not ( = ?auto_453644 ?auto_453649 ) ) ( not ( = ?auto_453644 ?auto_453650 ) ) ( not ( = ?auto_453644 ?auto_453651 ) ) ( not ( = ?auto_453644 ?auto_453652 ) ) ( not ( = ?auto_453644 ?auto_453653 ) ) ( not ( = ?auto_453645 ?auto_453646 ) ) ( not ( = ?auto_453645 ?auto_453647 ) ) ( not ( = ?auto_453645 ?auto_453648 ) ) ( not ( = ?auto_453645 ?auto_453649 ) ) ( not ( = ?auto_453645 ?auto_453650 ) ) ( not ( = ?auto_453645 ?auto_453651 ) ) ( not ( = ?auto_453645 ?auto_453652 ) ) ( not ( = ?auto_453645 ?auto_453653 ) ) ( not ( = ?auto_453646 ?auto_453647 ) ) ( not ( = ?auto_453646 ?auto_453648 ) ) ( not ( = ?auto_453646 ?auto_453649 ) ) ( not ( = ?auto_453646 ?auto_453650 ) ) ( not ( = ?auto_453646 ?auto_453651 ) ) ( not ( = ?auto_453646 ?auto_453652 ) ) ( not ( = ?auto_453646 ?auto_453653 ) ) ( not ( = ?auto_453647 ?auto_453648 ) ) ( not ( = ?auto_453647 ?auto_453649 ) ) ( not ( = ?auto_453647 ?auto_453650 ) ) ( not ( = ?auto_453647 ?auto_453651 ) ) ( not ( = ?auto_453647 ?auto_453652 ) ) ( not ( = ?auto_453647 ?auto_453653 ) ) ( not ( = ?auto_453648 ?auto_453649 ) ) ( not ( = ?auto_453648 ?auto_453650 ) ) ( not ( = ?auto_453648 ?auto_453651 ) ) ( not ( = ?auto_453648 ?auto_453652 ) ) ( not ( = ?auto_453648 ?auto_453653 ) ) ( not ( = ?auto_453649 ?auto_453650 ) ) ( not ( = ?auto_453649 ?auto_453651 ) ) ( not ( = ?auto_453649 ?auto_453652 ) ) ( not ( = ?auto_453649 ?auto_453653 ) ) ( not ( = ?auto_453650 ?auto_453651 ) ) ( not ( = ?auto_453650 ?auto_453652 ) ) ( not ( = ?auto_453650 ?auto_453653 ) ) ( not ( = ?auto_453651 ?auto_453652 ) ) ( not ( = ?auto_453651 ?auto_453653 ) ) ( not ( = ?auto_453652 ?auto_453653 ) ) ( CLEAR ?auto_453650 ) ( ON ?auto_453651 ?auto_453652 ) ( CLEAR ?auto_453651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_453638 ?auto_453639 ?auto_453640 ?auto_453641 ?auto_453642 ?auto_453643 ?auto_453644 ?auto_453645 ?auto_453646 ?auto_453647 ?auto_453648 ?auto_453649 ?auto_453650 ?auto_453651 )
      ( MAKE-15PILE ?auto_453638 ?auto_453639 ?auto_453640 ?auto_453641 ?auto_453642 ?auto_453643 ?auto_453644 ?auto_453645 ?auto_453646 ?auto_453647 ?auto_453648 ?auto_453649 ?auto_453650 ?auto_453651 ?auto_453652 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453669 - BLOCK
      ?auto_453670 - BLOCK
      ?auto_453671 - BLOCK
      ?auto_453672 - BLOCK
      ?auto_453673 - BLOCK
      ?auto_453674 - BLOCK
      ?auto_453675 - BLOCK
      ?auto_453676 - BLOCK
      ?auto_453677 - BLOCK
      ?auto_453678 - BLOCK
      ?auto_453679 - BLOCK
      ?auto_453680 - BLOCK
      ?auto_453681 - BLOCK
      ?auto_453682 - BLOCK
      ?auto_453683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453683 ) ( ON-TABLE ?auto_453669 ) ( ON ?auto_453670 ?auto_453669 ) ( ON ?auto_453671 ?auto_453670 ) ( ON ?auto_453672 ?auto_453671 ) ( ON ?auto_453673 ?auto_453672 ) ( ON ?auto_453674 ?auto_453673 ) ( ON ?auto_453675 ?auto_453674 ) ( ON ?auto_453676 ?auto_453675 ) ( ON ?auto_453677 ?auto_453676 ) ( ON ?auto_453678 ?auto_453677 ) ( ON ?auto_453679 ?auto_453678 ) ( ON ?auto_453680 ?auto_453679 ) ( ON ?auto_453681 ?auto_453680 ) ( not ( = ?auto_453669 ?auto_453670 ) ) ( not ( = ?auto_453669 ?auto_453671 ) ) ( not ( = ?auto_453669 ?auto_453672 ) ) ( not ( = ?auto_453669 ?auto_453673 ) ) ( not ( = ?auto_453669 ?auto_453674 ) ) ( not ( = ?auto_453669 ?auto_453675 ) ) ( not ( = ?auto_453669 ?auto_453676 ) ) ( not ( = ?auto_453669 ?auto_453677 ) ) ( not ( = ?auto_453669 ?auto_453678 ) ) ( not ( = ?auto_453669 ?auto_453679 ) ) ( not ( = ?auto_453669 ?auto_453680 ) ) ( not ( = ?auto_453669 ?auto_453681 ) ) ( not ( = ?auto_453669 ?auto_453682 ) ) ( not ( = ?auto_453669 ?auto_453683 ) ) ( not ( = ?auto_453670 ?auto_453671 ) ) ( not ( = ?auto_453670 ?auto_453672 ) ) ( not ( = ?auto_453670 ?auto_453673 ) ) ( not ( = ?auto_453670 ?auto_453674 ) ) ( not ( = ?auto_453670 ?auto_453675 ) ) ( not ( = ?auto_453670 ?auto_453676 ) ) ( not ( = ?auto_453670 ?auto_453677 ) ) ( not ( = ?auto_453670 ?auto_453678 ) ) ( not ( = ?auto_453670 ?auto_453679 ) ) ( not ( = ?auto_453670 ?auto_453680 ) ) ( not ( = ?auto_453670 ?auto_453681 ) ) ( not ( = ?auto_453670 ?auto_453682 ) ) ( not ( = ?auto_453670 ?auto_453683 ) ) ( not ( = ?auto_453671 ?auto_453672 ) ) ( not ( = ?auto_453671 ?auto_453673 ) ) ( not ( = ?auto_453671 ?auto_453674 ) ) ( not ( = ?auto_453671 ?auto_453675 ) ) ( not ( = ?auto_453671 ?auto_453676 ) ) ( not ( = ?auto_453671 ?auto_453677 ) ) ( not ( = ?auto_453671 ?auto_453678 ) ) ( not ( = ?auto_453671 ?auto_453679 ) ) ( not ( = ?auto_453671 ?auto_453680 ) ) ( not ( = ?auto_453671 ?auto_453681 ) ) ( not ( = ?auto_453671 ?auto_453682 ) ) ( not ( = ?auto_453671 ?auto_453683 ) ) ( not ( = ?auto_453672 ?auto_453673 ) ) ( not ( = ?auto_453672 ?auto_453674 ) ) ( not ( = ?auto_453672 ?auto_453675 ) ) ( not ( = ?auto_453672 ?auto_453676 ) ) ( not ( = ?auto_453672 ?auto_453677 ) ) ( not ( = ?auto_453672 ?auto_453678 ) ) ( not ( = ?auto_453672 ?auto_453679 ) ) ( not ( = ?auto_453672 ?auto_453680 ) ) ( not ( = ?auto_453672 ?auto_453681 ) ) ( not ( = ?auto_453672 ?auto_453682 ) ) ( not ( = ?auto_453672 ?auto_453683 ) ) ( not ( = ?auto_453673 ?auto_453674 ) ) ( not ( = ?auto_453673 ?auto_453675 ) ) ( not ( = ?auto_453673 ?auto_453676 ) ) ( not ( = ?auto_453673 ?auto_453677 ) ) ( not ( = ?auto_453673 ?auto_453678 ) ) ( not ( = ?auto_453673 ?auto_453679 ) ) ( not ( = ?auto_453673 ?auto_453680 ) ) ( not ( = ?auto_453673 ?auto_453681 ) ) ( not ( = ?auto_453673 ?auto_453682 ) ) ( not ( = ?auto_453673 ?auto_453683 ) ) ( not ( = ?auto_453674 ?auto_453675 ) ) ( not ( = ?auto_453674 ?auto_453676 ) ) ( not ( = ?auto_453674 ?auto_453677 ) ) ( not ( = ?auto_453674 ?auto_453678 ) ) ( not ( = ?auto_453674 ?auto_453679 ) ) ( not ( = ?auto_453674 ?auto_453680 ) ) ( not ( = ?auto_453674 ?auto_453681 ) ) ( not ( = ?auto_453674 ?auto_453682 ) ) ( not ( = ?auto_453674 ?auto_453683 ) ) ( not ( = ?auto_453675 ?auto_453676 ) ) ( not ( = ?auto_453675 ?auto_453677 ) ) ( not ( = ?auto_453675 ?auto_453678 ) ) ( not ( = ?auto_453675 ?auto_453679 ) ) ( not ( = ?auto_453675 ?auto_453680 ) ) ( not ( = ?auto_453675 ?auto_453681 ) ) ( not ( = ?auto_453675 ?auto_453682 ) ) ( not ( = ?auto_453675 ?auto_453683 ) ) ( not ( = ?auto_453676 ?auto_453677 ) ) ( not ( = ?auto_453676 ?auto_453678 ) ) ( not ( = ?auto_453676 ?auto_453679 ) ) ( not ( = ?auto_453676 ?auto_453680 ) ) ( not ( = ?auto_453676 ?auto_453681 ) ) ( not ( = ?auto_453676 ?auto_453682 ) ) ( not ( = ?auto_453676 ?auto_453683 ) ) ( not ( = ?auto_453677 ?auto_453678 ) ) ( not ( = ?auto_453677 ?auto_453679 ) ) ( not ( = ?auto_453677 ?auto_453680 ) ) ( not ( = ?auto_453677 ?auto_453681 ) ) ( not ( = ?auto_453677 ?auto_453682 ) ) ( not ( = ?auto_453677 ?auto_453683 ) ) ( not ( = ?auto_453678 ?auto_453679 ) ) ( not ( = ?auto_453678 ?auto_453680 ) ) ( not ( = ?auto_453678 ?auto_453681 ) ) ( not ( = ?auto_453678 ?auto_453682 ) ) ( not ( = ?auto_453678 ?auto_453683 ) ) ( not ( = ?auto_453679 ?auto_453680 ) ) ( not ( = ?auto_453679 ?auto_453681 ) ) ( not ( = ?auto_453679 ?auto_453682 ) ) ( not ( = ?auto_453679 ?auto_453683 ) ) ( not ( = ?auto_453680 ?auto_453681 ) ) ( not ( = ?auto_453680 ?auto_453682 ) ) ( not ( = ?auto_453680 ?auto_453683 ) ) ( not ( = ?auto_453681 ?auto_453682 ) ) ( not ( = ?auto_453681 ?auto_453683 ) ) ( not ( = ?auto_453682 ?auto_453683 ) ) ( CLEAR ?auto_453681 ) ( ON ?auto_453682 ?auto_453683 ) ( CLEAR ?auto_453682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_453669 ?auto_453670 ?auto_453671 ?auto_453672 ?auto_453673 ?auto_453674 ?auto_453675 ?auto_453676 ?auto_453677 ?auto_453678 ?auto_453679 ?auto_453680 ?auto_453681 ?auto_453682 )
      ( MAKE-15PILE ?auto_453669 ?auto_453670 ?auto_453671 ?auto_453672 ?auto_453673 ?auto_453674 ?auto_453675 ?auto_453676 ?auto_453677 ?auto_453678 ?auto_453679 ?auto_453680 ?auto_453681 ?auto_453682 ?auto_453683 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453699 - BLOCK
      ?auto_453700 - BLOCK
      ?auto_453701 - BLOCK
      ?auto_453702 - BLOCK
      ?auto_453703 - BLOCK
      ?auto_453704 - BLOCK
      ?auto_453705 - BLOCK
      ?auto_453706 - BLOCK
      ?auto_453707 - BLOCK
      ?auto_453708 - BLOCK
      ?auto_453709 - BLOCK
      ?auto_453710 - BLOCK
      ?auto_453711 - BLOCK
      ?auto_453712 - BLOCK
      ?auto_453713 - BLOCK
    )
    :vars
    (
      ?auto_453714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453713 ?auto_453714 ) ( ON-TABLE ?auto_453699 ) ( ON ?auto_453700 ?auto_453699 ) ( ON ?auto_453701 ?auto_453700 ) ( ON ?auto_453702 ?auto_453701 ) ( ON ?auto_453703 ?auto_453702 ) ( ON ?auto_453704 ?auto_453703 ) ( ON ?auto_453705 ?auto_453704 ) ( ON ?auto_453706 ?auto_453705 ) ( ON ?auto_453707 ?auto_453706 ) ( ON ?auto_453708 ?auto_453707 ) ( ON ?auto_453709 ?auto_453708 ) ( ON ?auto_453710 ?auto_453709 ) ( not ( = ?auto_453699 ?auto_453700 ) ) ( not ( = ?auto_453699 ?auto_453701 ) ) ( not ( = ?auto_453699 ?auto_453702 ) ) ( not ( = ?auto_453699 ?auto_453703 ) ) ( not ( = ?auto_453699 ?auto_453704 ) ) ( not ( = ?auto_453699 ?auto_453705 ) ) ( not ( = ?auto_453699 ?auto_453706 ) ) ( not ( = ?auto_453699 ?auto_453707 ) ) ( not ( = ?auto_453699 ?auto_453708 ) ) ( not ( = ?auto_453699 ?auto_453709 ) ) ( not ( = ?auto_453699 ?auto_453710 ) ) ( not ( = ?auto_453699 ?auto_453711 ) ) ( not ( = ?auto_453699 ?auto_453712 ) ) ( not ( = ?auto_453699 ?auto_453713 ) ) ( not ( = ?auto_453699 ?auto_453714 ) ) ( not ( = ?auto_453700 ?auto_453701 ) ) ( not ( = ?auto_453700 ?auto_453702 ) ) ( not ( = ?auto_453700 ?auto_453703 ) ) ( not ( = ?auto_453700 ?auto_453704 ) ) ( not ( = ?auto_453700 ?auto_453705 ) ) ( not ( = ?auto_453700 ?auto_453706 ) ) ( not ( = ?auto_453700 ?auto_453707 ) ) ( not ( = ?auto_453700 ?auto_453708 ) ) ( not ( = ?auto_453700 ?auto_453709 ) ) ( not ( = ?auto_453700 ?auto_453710 ) ) ( not ( = ?auto_453700 ?auto_453711 ) ) ( not ( = ?auto_453700 ?auto_453712 ) ) ( not ( = ?auto_453700 ?auto_453713 ) ) ( not ( = ?auto_453700 ?auto_453714 ) ) ( not ( = ?auto_453701 ?auto_453702 ) ) ( not ( = ?auto_453701 ?auto_453703 ) ) ( not ( = ?auto_453701 ?auto_453704 ) ) ( not ( = ?auto_453701 ?auto_453705 ) ) ( not ( = ?auto_453701 ?auto_453706 ) ) ( not ( = ?auto_453701 ?auto_453707 ) ) ( not ( = ?auto_453701 ?auto_453708 ) ) ( not ( = ?auto_453701 ?auto_453709 ) ) ( not ( = ?auto_453701 ?auto_453710 ) ) ( not ( = ?auto_453701 ?auto_453711 ) ) ( not ( = ?auto_453701 ?auto_453712 ) ) ( not ( = ?auto_453701 ?auto_453713 ) ) ( not ( = ?auto_453701 ?auto_453714 ) ) ( not ( = ?auto_453702 ?auto_453703 ) ) ( not ( = ?auto_453702 ?auto_453704 ) ) ( not ( = ?auto_453702 ?auto_453705 ) ) ( not ( = ?auto_453702 ?auto_453706 ) ) ( not ( = ?auto_453702 ?auto_453707 ) ) ( not ( = ?auto_453702 ?auto_453708 ) ) ( not ( = ?auto_453702 ?auto_453709 ) ) ( not ( = ?auto_453702 ?auto_453710 ) ) ( not ( = ?auto_453702 ?auto_453711 ) ) ( not ( = ?auto_453702 ?auto_453712 ) ) ( not ( = ?auto_453702 ?auto_453713 ) ) ( not ( = ?auto_453702 ?auto_453714 ) ) ( not ( = ?auto_453703 ?auto_453704 ) ) ( not ( = ?auto_453703 ?auto_453705 ) ) ( not ( = ?auto_453703 ?auto_453706 ) ) ( not ( = ?auto_453703 ?auto_453707 ) ) ( not ( = ?auto_453703 ?auto_453708 ) ) ( not ( = ?auto_453703 ?auto_453709 ) ) ( not ( = ?auto_453703 ?auto_453710 ) ) ( not ( = ?auto_453703 ?auto_453711 ) ) ( not ( = ?auto_453703 ?auto_453712 ) ) ( not ( = ?auto_453703 ?auto_453713 ) ) ( not ( = ?auto_453703 ?auto_453714 ) ) ( not ( = ?auto_453704 ?auto_453705 ) ) ( not ( = ?auto_453704 ?auto_453706 ) ) ( not ( = ?auto_453704 ?auto_453707 ) ) ( not ( = ?auto_453704 ?auto_453708 ) ) ( not ( = ?auto_453704 ?auto_453709 ) ) ( not ( = ?auto_453704 ?auto_453710 ) ) ( not ( = ?auto_453704 ?auto_453711 ) ) ( not ( = ?auto_453704 ?auto_453712 ) ) ( not ( = ?auto_453704 ?auto_453713 ) ) ( not ( = ?auto_453704 ?auto_453714 ) ) ( not ( = ?auto_453705 ?auto_453706 ) ) ( not ( = ?auto_453705 ?auto_453707 ) ) ( not ( = ?auto_453705 ?auto_453708 ) ) ( not ( = ?auto_453705 ?auto_453709 ) ) ( not ( = ?auto_453705 ?auto_453710 ) ) ( not ( = ?auto_453705 ?auto_453711 ) ) ( not ( = ?auto_453705 ?auto_453712 ) ) ( not ( = ?auto_453705 ?auto_453713 ) ) ( not ( = ?auto_453705 ?auto_453714 ) ) ( not ( = ?auto_453706 ?auto_453707 ) ) ( not ( = ?auto_453706 ?auto_453708 ) ) ( not ( = ?auto_453706 ?auto_453709 ) ) ( not ( = ?auto_453706 ?auto_453710 ) ) ( not ( = ?auto_453706 ?auto_453711 ) ) ( not ( = ?auto_453706 ?auto_453712 ) ) ( not ( = ?auto_453706 ?auto_453713 ) ) ( not ( = ?auto_453706 ?auto_453714 ) ) ( not ( = ?auto_453707 ?auto_453708 ) ) ( not ( = ?auto_453707 ?auto_453709 ) ) ( not ( = ?auto_453707 ?auto_453710 ) ) ( not ( = ?auto_453707 ?auto_453711 ) ) ( not ( = ?auto_453707 ?auto_453712 ) ) ( not ( = ?auto_453707 ?auto_453713 ) ) ( not ( = ?auto_453707 ?auto_453714 ) ) ( not ( = ?auto_453708 ?auto_453709 ) ) ( not ( = ?auto_453708 ?auto_453710 ) ) ( not ( = ?auto_453708 ?auto_453711 ) ) ( not ( = ?auto_453708 ?auto_453712 ) ) ( not ( = ?auto_453708 ?auto_453713 ) ) ( not ( = ?auto_453708 ?auto_453714 ) ) ( not ( = ?auto_453709 ?auto_453710 ) ) ( not ( = ?auto_453709 ?auto_453711 ) ) ( not ( = ?auto_453709 ?auto_453712 ) ) ( not ( = ?auto_453709 ?auto_453713 ) ) ( not ( = ?auto_453709 ?auto_453714 ) ) ( not ( = ?auto_453710 ?auto_453711 ) ) ( not ( = ?auto_453710 ?auto_453712 ) ) ( not ( = ?auto_453710 ?auto_453713 ) ) ( not ( = ?auto_453710 ?auto_453714 ) ) ( not ( = ?auto_453711 ?auto_453712 ) ) ( not ( = ?auto_453711 ?auto_453713 ) ) ( not ( = ?auto_453711 ?auto_453714 ) ) ( not ( = ?auto_453712 ?auto_453713 ) ) ( not ( = ?auto_453712 ?auto_453714 ) ) ( not ( = ?auto_453713 ?auto_453714 ) ) ( ON ?auto_453712 ?auto_453713 ) ( CLEAR ?auto_453710 ) ( ON ?auto_453711 ?auto_453712 ) ( CLEAR ?auto_453711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_453699 ?auto_453700 ?auto_453701 ?auto_453702 ?auto_453703 ?auto_453704 ?auto_453705 ?auto_453706 ?auto_453707 ?auto_453708 ?auto_453709 ?auto_453710 ?auto_453711 )
      ( MAKE-15PILE ?auto_453699 ?auto_453700 ?auto_453701 ?auto_453702 ?auto_453703 ?auto_453704 ?auto_453705 ?auto_453706 ?auto_453707 ?auto_453708 ?auto_453709 ?auto_453710 ?auto_453711 ?auto_453712 ?auto_453713 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453730 - BLOCK
      ?auto_453731 - BLOCK
      ?auto_453732 - BLOCK
      ?auto_453733 - BLOCK
      ?auto_453734 - BLOCK
      ?auto_453735 - BLOCK
      ?auto_453736 - BLOCK
      ?auto_453737 - BLOCK
      ?auto_453738 - BLOCK
      ?auto_453739 - BLOCK
      ?auto_453740 - BLOCK
      ?auto_453741 - BLOCK
      ?auto_453742 - BLOCK
      ?auto_453743 - BLOCK
      ?auto_453744 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453744 ) ( ON-TABLE ?auto_453730 ) ( ON ?auto_453731 ?auto_453730 ) ( ON ?auto_453732 ?auto_453731 ) ( ON ?auto_453733 ?auto_453732 ) ( ON ?auto_453734 ?auto_453733 ) ( ON ?auto_453735 ?auto_453734 ) ( ON ?auto_453736 ?auto_453735 ) ( ON ?auto_453737 ?auto_453736 ) ( ON ?auto_453738 ?auto_453737 ) ( ON ?auto_453739 ?auto_453738 ) ( ON ?auto_453740 ?auto_453739 ) ( ON ?auto_453741 ?auto_453740 ) ( not ( = ?auto_453730 ?auto_453731 ) ) ( not ( = ?auto_453730 ?auto_453732 ) ) ( not ( = ?auto_453730 ?auto_453733 ) ) ( not ( = ?auto_453730 ?auto_453734 ) ) ( not ( = ?auto_453730 ?auto_453735 ) ) ( not ( = ?auto_453730 ?auto_453736 ) ) ( not ( = ?auto_453730 ?auto_453737 ) ) ( not ( = ?auto_453730 ?auto_453738 ) ) ( not ( = ?auto_453730 ?auto_453739 ) ) ( not ( = ?auto_453730 ?auto_453740 ) ) ( not ( = ?auto_453730 ?auto_453741 ) ) ( not ( = ?auto_453730 ?auto_453742 ) ) ( not ( = ?auto_453730 ?auto_453743 ) ) ( not ( = ?auto_453730 ?auto_453744 ) ) ( not ( = ?auto_453731 ?auto_453732 ) ) ( not ( = ?auto_453731 ?auto_453733 ) ) ( not ( = ?auto_453731 ?auto_453734 ) ) ( not ( = ?auto_453731 ?auto_453735 ) ) ( not ( = ?auto_453731 ?auto_453736 ) ) ( not ( = ?auto_453731 ?auto_453737 ) ) ( not ( = ?auto_453731 ?auto_453738 ) ) ( not ( = ?auto_453731 ?auto_453739 ) ) ( not ( = ?auto_453731 ?auto_453740 ) ) ( not ( = ?auto_453731 ?auto_453741 ) ) ( not ( = ?auto_453731 ?auto_453742 ) ) ( not ( = ?auto_453731 ?auto_453743 ) ) ( not ( = ?auto_453731 ?auto_453744 ) ) ( not ( = ?auto_453732 ?auto_453733 ) ) ( not ( = ?auto_453732 ?auto_453734 ) ) ( not ( = ?auto_453732 ?auto_453735 ) ) ( not ( = ?auto_453732 ?auto_453736 ) ) ( not ( = ?auto_453732 ?auto_453737 ) ) ( not ( = ?auto_453732 ?auto_453738 ) ) ( not ( = ?auto_453732 ?auto_453739 ) ) ( not ( = ?auto_453732 ?auto_453740 ) ) ( not ( = ?auto_453732 ?auto_453741 ) ) ( not ( = ?auto_453732 ?auto_453742 ) ) ( not ( = ?auto_453732 ?auto_453743 ) ) ( not ( = ?auto_453732 ?auto_453744 ) ) ( not ( = ?auto_453733 ?auto_453734 ) ) ( not ( = ?auto_453733 ?auto_453735 ) ) ( not ( = ?auto_453733 ?auto_453736 ) ) ( not ( = ?auto_453733 ?auto_453737 ) ) ( not ( = ?auto_453733 ?auto_453738 ) ) ( not ( = ?auto_453733 ?auto_453739 ) ) ( not ( = ?auto_453733 ?auto_453740 ) ) ( not ( = ?auto_453733 ?auto_453741 ) ) ( not ( = ?auto_453733 ?auto_453742 ) ) ( not ( = ?auto_453733 ?auto_453743 ) ) ( not ( = ?auto_453733 ?auto_453744 ) ) ( not ( = ?auto_453734 ?auto_453735 ) ) ( not ( = ?auto_453734 ?auto_453736 ) ) ( not ( = ?auto_453734 ?auto_453737 ) ) ( not ( = ?auto_453734 ?auto_453738 ) ) ( not ( = ?auto_453734 ?auto_453739 ) ) ( not ( = ?auto_453734 ?auto_453740 ) ) ( not ( = ?auto_453734 ?auto_453741 ) ) ( not ( = ?auto_453734 ?auto_453742 ) ) ( not ( = ?auto_453734 ?auto_453743 ) ) ( not ( = ?auto_453734 ?auto_453744 ) ) ( not ( = ?auto_453735 ?auto_453736 ) ) ( not ( = ?auto_453735 ?auto_453737 ) ) ( not ( = ?auto_453735 ?auto_453738 ) ) ( not ( = ?auto_453735 ?auto_453739 ) ) ( not ( = ?auto_453735 ?auto_453740 ) ) ( not ( = ?auto_453735 ?auto_453741 ) ) ( not ( = ?auto_453735 ?auto_453742 ) ) ( not ( = ?auto_453735 ?auto_453743 ) ) ( not ( = ?auto_453735 ?auto_453744 ) ) ( not ( = ?auto_453736 ?auto_453737 ) ) ( not ( = ?auto_453736 ?auto_453738 ) ) ( not ( = ?auto_453736 ?auto_453739 ) ) ( not ( = ?auto_453736 ?auto_453740 ) ) ( not ( = ?auto_453736 ?auto_453741 ) ) ( not ( = ?auto_453736 ?auto_453742 ) ) ( not ( = ?auto_453736 ?auto_453743 ) ) ( not ( = ?auto_453736 ?auto_453744 ) ) ( not ( = ?auto_453737 ?auto_453738 ) ) ( not ( = ?auto_453737 ?auto_453739 ) ) ( not ( = ?auto_453737 ?auto_453740 ) ) ( not ( = ?auto_453737 ?auto_453741 ) ) ( not ( = ?auto_453737 ?auto_453742 ) ) ( not ( = ?auto_453737 ?auto_453743 ) ) ( not ( = ?auto_453737 ?auto_453744 ) ) ( not ( = ?auto_453738 ?auto_453739 ) ) ( not ( = ?auto_453738 ?auto_453740 ) ) ( not ( = ?auto_453738 ?auto_453741 ) ) ( not ( = ?auto_453738 ?auto_453742 ) ) ( not ( = ?auto_453738 ?auto_453743 ) ) ( not ( = ?auto_453738 ?auto_453744 ) ) ( not ( = ?auto_453739 ?auto_453740 ) ) ( not ( = ?auto_453739 ?auto_453741 ) ) ( not ( = ?auto_453739 ?auto_453742 ) ) ( not ( = ?auto_453739 ?auto_453743 ) ) ( not ( = ?auto_453739 ?auto_453744 ) ) ( not ( = ?auto_453740 ?auto_453741 ) ) ( not ( = ?auto_453740 ?auto_453742 ) ) ( not ( = ?auto_453740 ?auto_453743 ) ) ( not ( = ?auto_453740 ?auto_453744 ) ) ( not ( = ?auto_453741 ?auto_453742 ) ) ( not ( = ?auto_453741 ?auto_453743 ) ) ( not ( = ?auto_453741 ?auto_453744 ) ) ( not ( = ?auto_453742 ?auto_453743 ) ) ( not ( = ?auto_453742 ?auto_453744 ) ) ( not ( = ?auto_453743 ?auto_453744 ) ) ( ON ?auto_453743 ?auto_453744 ) ( CLEAR ?auto_453741 ) ( ON ?auto_453742 ?auto_453743 ) ( CLEAR ?auto_453742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_453730 ?auto_453731 ?auto_453732 ?auto_453733 ?auto_453734 ?auto_453735 ?auto_453736 ?auto_453737 ?auto_453738 ?auto_453739 ?auto_453740 ?auto_453741 ?auto_453742 )
      ( MAKE-15PILE ?auto_453730 ?auto_453731 ?auto_453732 ?auto_453733 ?auto_453734 ?auto_453735 ?auto_453736 ?auto_453737 ?auto_453738 ?auto_453739 ?auto_453740 ?auto_453741 ?auto_453742 ?auto_453743 ?auto_453744 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453760 - BLOCK
      ?auto_453761 - BLOCK
      ?auto_453762 - BLOCK
      ?auto_453763 - BLOCK
      ?auto_453764 - BLOCK
      ?auto_453765 - BLOCK
      ?auto_453766 - BLOCK
      ?auto_453767 - BLOCK
      ?auto_453768 - BLOCK
      ?auto_453769 - BLOCK
      ?auto_453770 - BLOCK
      ?auto_453771 - BLOCK
      ?auto_453772 - BLOCK
      ?auto_453773 - BLOCK
      ?auto_453774 - BLOCK
    )
    :vars
    (
      ?auto_453775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453774 ?auto_453775 ) ( ON-TABLE ?auto_453760 ) ( ON ?auto_453761 ?auto_453760 ) ( ON ?auto_453762 ?auto_453761 ) ( ON ?auto_453763 ?auto_453762 ) ( ON ?auto_453764 ?auto_453763 ) ( ON ?auto_453765 ?auto_453764 ) ( ON ?auto_453766 ?auto_453765 ) ( ON ?auto_453767 ?auto_453766 ) ( ON ?auto_453768 ?auto_453767 ) ( ON ?auto_453769 ?auto_453768 ) ( ON ?auto_453770 ?auto_453769 ) ( not ( = ?auto_453760 ?auto_453761 ) ) ( not ( = ?auto_453760 ?auto_453762 ) ) ( not ( = ?auto_453760 ?auto_453763 ) ) ( not ( = ?auto_453760 ?auto_453764 ) ) ( not ( = ?auto_453760 ?auto_453765 ) ) ( not ( = ?auto_453760 ?auto_453766 ) ) ( not ( = ?auto_453760 ?auto_453767 ) ) ( not ( = ?auto_453760 ?auto_453768 ) ) ( not ( = ?auto_453760 ?auto_453769 ) ) ( not ( = ?auto_453760 ?auto_453770 ) ) ( not ( = ?auto_453760 ?auto_453771 ) ) ( not ( = ?auto_453760 ?auto_453772 ) ) ( not ( = ?auto_453760 ?auto_453773 ) ) ( not ( = ?auto_453760 ?auto_453774 ) ) ( not ( = ?auto_453760 ?auto_453775 ) ) ( not ( = ?auto_453761 ?auto_453762 ) ) ( not ( = ?auto_453761 ?auto_453763 ) ) ( not ( = ?auto_453761 ?auto_453764 ) ) ( not ( = ?auto_453761 ?auto_453765 ) ) ( not ( = ?auto_453761 ?auto_453766 ) ) ( not ( = ?auto_453761 ?auto_453767 ) ) ( not ( = ?auto_453761 ?auto_453768 ) ) ( not ( = ?auto_453761 ?auto_453769 ) ) ( not ( = ?auto_453761 ?auto_453770 ) ) ( not ( = ?auto_453761 ?auto_453771 ) ) ( not ( = ?auto_453761 ?auto_453772 ) ) ( not ( = ?auto_453761 ?auto_453773 ) ) ( not ( = ?auto_453761 ?auto_453774 ) ) ( not ( = ?auto_453761 ?auto_453775 ) ) ( not ( = ?auto_453762 ?auto_453763 ) ) ( not ( = ?auto_453762 ?auto_453764 ) ) ( not ( = ?auto_453762 ?auto_453765 ) ) ( not ( = ?auto_453762 ?auto_453766 ) ) ( not ( = ?auto_453762 ?auto_453767 ) ) ( not ( = ?auto_453762 ?auto_453768 ) ) ( not ( = ?auto_453762 ?auto_453769 ) ) ( not ( = ?auto_453762 ?auto_453770 ) ) ( not ( = ?auto_453762 ?auto_453771 ) ) ( not ( = ?auto_453762 ?auto_453772 ) ) ( not ( = ?auto_453762 ?auto_453773 ) ) ( not ( = ?auto_453762 ?auto_453774 ) ) ( not ( = ?auto_453762 ?auto_453775 ) ) ( not ( = ?auto_453763 ?auto_453764 ) ) ( not ( = ?auto_453763 ?auto_453765 ) ) ( not ( = ?auto_453763 ?auto_453766 ) ) ( not ( = ?auto_453763 ?auto_453767 ) ) ( not ( = ?auto_453763 ?auto_453768 ) ) ( not ( = ?auto_453763 ?auto_453769 ) ) ( not ( = ?auto_453763 ?auto_453770 ) ) ( not ( = ?auto_453763 ?auto_453771 ) ) ( not ( = ?auto_453763 ?auto_453772 ) ) ( not ( = ?auto_453763 ?auto_453773 ) ) ( not ( = ?auto_453763 ?auto_453774 ) ) ( not ( = ?auto_453763 ?auto_453775 ) ) ( not ( = ?auto_453764 ?auto_453765 ) ) ( not ( = ?auto_453764 ?auto_453766 ) ) ( not ( = ?auto_453764 ?auto_453767 ) ) ( not ( = ?auto_453764 ?auto_453768 ) ) ( not ( = ?auto_453764 ?auto_453769 ) ) ( not ( = ?auto_453764 ?auto_453770 ) ) ( not ( = ?auto_453764 ?auto_453771 ) ) ( not ( = ?auto_453764 ?auto_453772 ) ) ( not ( = ?auto_453764 ?auto_453773 ) ) ( not ( = ?auto_453764 ?auto_453774 ) ) ( not ( = ?auto_453764 ?auto_453775 ) ) ( not ( = ?auto_453765 ?auto_453766 ) ) ( not ( = ?auto_453765 ?auto_453767 ) ) ( not ( = ?auto_453765 ?auto_453768 ) ) ( not ( = ?auto_453765 ?auto_453769 ) ) ( not ( = ?auto_453765 ?auto_453770 ) ) ( not ( = ?auto_453765 ?auto_453771 ) ) ( not ( = ?auto_453765 ?auto_453772 ) ) ( not ( = ?auto_453765 ?auto_453773 ) ) ( not ( = ?auto_453765 ?auto_453774 ) ) ( not ( = ?auto_453765 ?auto_453775 ) ) ( not ( = ?auto_453766 ?auto_453767 ) ) ( not ( = ?auto_453766 ?auto_453768 ) ) ( not ( = ?auto_453766 ?auto_453769 ) ) ( not ( = ?auto_453766 ?auto_453770 ) ) ( not ( = ?auto_453766 ?auto_453771 ) ) ( not ( = ?auto_453766 ?auto_453772 ) ) ( not ( = ?auto_453766 ?auto_453773 ) ) ( not ( = ?auto_453766 ?auto_453774 ) ) ( not ( = ?auto_453766 ?auto_453775 ) ) ( not ( = ?auto_453767 ?auto_453768 ) ) ( not ( = ?auto_453767 ?auto_453769 ) ) ( not ( = ?auto_453767 ?auto_453770 ) ) ( not ( = ?auto_453767 ?auto_453771 ) ) ( not ( = ?auto_453767 ?auto_453772 ) ) ( not ( = ?auto_453767 ?auto_453773 ) ) ( not ( = ?auto_453767 ?auto_453774 ) ) ( not ( = ?auto_453767 ?auto_453775 ) ) ( not ( = ?auto_453768 ?auto_453769 ) ) ( not ( = ?auto_453768 ?auto_453770 ) ) ( not ( = ?auto_453768 ?auto_453771 ) ) ( not ( = ?auto_453768 ?auto_453772 ) ) ( not ( = ?auto_453768 ?auto_453773 ) ) ( not ( = ?auto_453768 ?auto_453774 ) ) ( not ( = ?auto_453768 ?auto_453775 ) ) ( not ( = ?auto_453769 ?auto_453770 ) ) ( not ( = ?auto_453769 ?auto_453771 ) ) ( not ( = ?auto_453769 ?auto_453772 ) ) ( not ( = ?auto_453769 ?auto_453773 ) ) ( not ( = ?auto_453769 ?auto_453774 ) ) ( not ( = ?auto_453769 ?auto_453775 ) ) ( not ( = ?auto_453770 ?auto_453771 ) ) ( not ( = ?auto_453770 ?auto_453772 ) ) ( not ( = ?auto_453770 ?auto_453773 ) ) ( not ( = ?auto_453770 ?auto_453774 ) ) ( not ( = ?auto_453770 ?auto_453775 ) ) ( not ( = ?auto_453771 ?auto_453772 ) ) ( not ( = ?auto_453771 ?auto_453773 ) ) ( not ( = ?auto_453771 ?auto_453774 ) ) ( not ( = ?auto_453771 ?auto_453775 ) ) ( not ( = ?auto_453772 ?auto_453773 ) ) ( not ( = ?auto_453772 ?auto_453774 ) ) ( not ( = ?auto_453772 ?auto_453775 ) ) ( not ( = ?auto_453773 ?auto_453774 ) ) ( not ( = ?auto_453773 ?auto_453775 ) ) ( not ( = ?auto_453774 ?auto_453775 ) ) ( ON ?auto_453773 ?auto_453774 ) ( ON ?auto_453772 ?auto_453773 ) ( CLEAR ?auto_453770 ) ( ON ?auto_453771 ?auto_453772 ) ( CLEAR ?auto_453771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_453760 ?auto_453761 ?auto_453762 ?auto_453763 ?auto_453764 ?auto_453765 ?auto_453766 ?auto_453767 ?auto_453768 ?auto_453769 ?auto_453770 ?auto_453771 )
      ( MAKE-15PILE ?auto_453760 ?auto_453761 ?auto_453762 ?auto_453763 ?auto_453764 ?auto_453765 ?auto_453766 ?auto_453767 ?auto_453768 ?auto_453769 ?auto_453770 ?auto_453771 ?auto_453772 ?auto_453773 ?auto_453774 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453791 - BLOCK
      ?auto_453792 - BLOCK
      ?auto_453793 - BLOCK
      ?auto_453794 - BLOCK
      ?auto_453795 - BLOCK
      ?auto_453796 - BLOCK
      ?auto_453797 - BLOCK
      ?auto_453798 - BLOCK
      ?auto_453799 - BLOCK
      ?auto_453800 - BLOCK
      ?auto_453801 - BLOCK
      ?auto_453802 - BLOCK
      ?auto_453803 - BLOCK
      ?auto_453804 - BLOCK
      ?auto_453805 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453805 ) ( ON-TABLE ?auto_453791 ) ( ON ?auto_453792 ?auto_453791 ) ( ON ?auto_453793 ?auto_453792 ) ( ON ?auto_453794 ?auto_453793 ) ( ON ?auto_453795 ?auto_453794 ) ( ON ?auto_453796 ?auto_453795 ) ( ON ?auto_453797 ?auto_453796 ) ( ON ?auto_453798 ?auto_453797 ) ( ON ?auto_453799 ?auto_453798 ) ( ON ?auto_453800 ?auto_453799 ) ( ON ?auto_453801 ?auto_453800 ) ( not ( = ?auto_453791 ?auto_453792 ) ) ( not ( = ?auto_453791 ?auto_453793 ) ) ( not ( = ?auto_453791 ?auto_453794 ) ) ( not ( = ?auto_453791 ?auto_453795 ) ) ( not ( = ?auto_453791 ?auto_453796 ) ) ( not ( = ?auto_453791 ?auto_453797 ) ) ( not ( = ?auto_453791 ?auto_453798 ) ) ( not ( = ?auto_453791 ?auto_453799 ) ) ( not ( = ?auto_453791 ?auto_453800 ) ) ( not ( = ?auto_453791 ?auto_453801 ) ) ( not ( = ?auto_453791 ?auto_453802 ) ) ( not ( = ?auto_453791 ?auto_453803 ) ) ( not ( = ?auto_453791 ?auto_453804 ) ) ( not ( = ?auto_453791 ?auto_453805 ) ) ( not ( = ?auto_453792 ?auto_453793 ) ) ( not ( = ?auto_453792 ?auto_453794 ) ) ( not ( = ?auto_453792 ?auto_453795 ) ) ( not ( = ?auto_453792 ?auto_453796 ) ) ( not ( = ?auto_453792 ?auto_453797 ) ) ( not ( = ?auto_453792 ?auto_453798 ) ) ( not ( = ?auto_453792 ?auto_453799 ) ) ( not ( = ?auto_453792 ?auto_453800 ) ) ( not ( = ?auto_453792 ?auto_453801 ) ) ( not ( = ?auto_453792 ?auto_453802 ) ) ( not ( = ?auto_453792 ?auto_453803 ) ) ( not ( = ?auto_453792 ?auto_453804 ) ) ( not ( = ?auto_453792 ?auto_453805 ) ) ( not ( = ?auto_453793 ?auto_453794 ) ) ( not ( = ?auto_453793 ?auto_453795 ) ) ( not ( = ?auto_453793 ?auto_453796 ) ) ( not ( = ?auto_453793 ?auto_453797 ) ) ( not ( = ?auto_453793 ?auto_453798 ) ) ( not ( = ?auto_453793 ?auto_453799 ) ) ( not ( = ?auto_453793 ?auto_453800 ) ) ( not ( = ?auto_453793 ?auto_453801 ) ) ( not ( = ?auto_453793 ?auto_453802 ) ) ( not ( = ?auto_453793 ?auto_453803 ) ) ( not ( = ?auto_453793 ?auto_453804 ) ) ( not ( = ?auto_453793 ?auto_453805 ) ) ( not ( = ?auto_453794 ?auto_453795 ) ) ( not ( = ?auto_453794 ?auto_453796 ) ) ( not ( = ?auto_453794 ?auto_453797 ) ) ( not ( = ?auto_453794 ?auto_453798 ) ) ( not ( = ?auto_453794 ?auto_453799 ) ) ( not ( = ?auto_453794 ?auto_453800 ) ) ( not ( = ?auto_453794 ?auto_453801 ) ) ( not ( = ?auto_453794 ?auto_453802 ) ) ( not ( = ?auto_453794 ?auto_453803 ) ) ( not ( = ?auto_453794 ?auto_453804 ) ) ( not ( = ?auto_453794 ?auto_453805 ) ) ( not ( = ?auto_453795 ?auto_453796 ) ) ( not ( = ?auto_453795 ?auto_453797 ) ) ( not ( = ?auto_453795 ?auto_453798 ) ) ( not ( = ?auto_453795 ?auto_453799 ) ) ( not ( = ?auto_453795 ?auto_453800 ) ) ( not ( = ?auto_453795 ?auto_453801 ) ) ( not ( = ?auto_453795 ?auto_453802 ) ) ( not ( = ?auto_453795 ?auto_453803 ) ) ( not ( = ?auto_453795 ?auto_453804 ) ) ( not ( = ?auto_453795 ?auto_453805 ) ) ( not ( = ?auto_453796 ?auto_453797 ) ) ( not ( = ?auto_453796 ?auto_453798 ) ) ( not ( = ?auto_453796 ?auto_453799 ) ) ( not ( = ?auto_453796 ?auto_453800 ) ) ( not ( = ?auto_453796 ?auto_453801 ) ) ( not ( = ?auto_453796 ?auto_453802 ) ) ( not ( = ?auto_453796 ?auto_453803 ) ) ( not ( = ?auto_453796 ?auto_453804 ) ) ( not ( = ?auto_453796 ?auto_453805 ) ) ( not ( = ?auto_453797 ?auto_453798 ) ) ( not ( = ?auto_453797 ?auto_453799 ) ) ( not ( = ?auto_453797 ?auto_453800 ) ) ( not ( = ?auto_453797 ?auto_453801 ) ) ( not ( = ?auto_453797 ?auto_453802 ) ) ( not ( = ?auto_453797 ?auto_453803 ) ) ( not ( = ?auto_453797 ?auto_453804 ) ) ( not ( = ?auto_453797 ?auto_453805 ) ) ( not ( = ?auto_453798 ?auto_453799 ) ) ( not ( = ?auto_453798 ?auto_453800 ) ) ( not ( = ?auto_453798 ?auto_453801 ) ) ( not ( = ?auto_453798 ?auto_453802 ) ) ( not ( = ?auto_453798 ?auto_453803 ) ) ( not ( = ?auto_453798 ?auto_453804 ) ) ( not ( = ?auto_453798 ?auto_453805 ) ) ( not ( = ?auto_453799 ?auto_453800 ) ) ( not ( = ?auto_453799 ?auto_453801 ) ) ( not ( = ?auto_453799 ?auto_453802 ) ) ( not ( = ?auto_453799 ?auto_453803 ) ) ( not ( = ?auto_453799 ?auto_453804 ) ) ( not ( = ?auto_453799 ?auto_453805 ) ) ( not ( = ?auto_453800 ?auto_453801 ) ) ( not ( = ?auto_453800 ?auto_453802 ) ) ( not ( = ?auto_453800 ?auto_453803 ) ) ( not ( = ?auto_453800 ?auto_453804 ) ) ( not ( = ?auto_453800 ?auto_453805 ) ) ( not ( = ?auto_453801 ?auto_453802 ) ) ( not ( = ?auto_453801 ?auto_453803 ) ) ( not ( = ?auto_453801 ?auto_453804 ) ) ( not ( = ?auto_453801 ?auto_453805 ) ) ( not ( = ?auto_453802 ?auto_453803 ) ) ( not ( = ?auto_453802 ?auto_453804 ) ) ( not ( = ?auto_453802 ?auto_453805 ) ) ( not ( = ?auto_453803 ?auto_453804 ) ) ( not ( = ?auto_453803 ?auto_453805 ) ) ( not ( = ?auto_453804 ?auto_453805 ) ) ( ON ?auto_453804 ?auto_453805 ) ( ON ?auto_453803 ?auto_453804 ) ( CLEAR ?auto_453801 ) ( ON ?auto_453802 ?auto_453803 ) ( CLEAR ?auto_453802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_453791 ?auto_453792 ?auto_453793 ?auto_453794 ?auto_453795 ?auto_453796 ?auto_453797 ?auto_453798 ?auto_453799 ?auto_453800 ?auto_453801 ?auto_453802 )
      ( MAKE-15PILE ?auto_453791 ?auto_453792 ?auto_453793 ?auto_453794 ?auto_453795 ?auto_453796 ?auto_453797 ?auto_453798 ?auto_453799 ?auto_453800 ?auto_453801 ?auto_453802 ?auto_453803 ?auto_453804 ?auto_453805 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453821 - BLOCK
      ?auto_453822 - BLOCK
      ?auto_453823 - BLOCK
      ?auto_453824 - BLOCK
      ?auto_453825 - BLOCK
      ?auto_453826 - BLOCK
      ?auto_453827 - BLOCK
      ?auto_453828 - BLOCK
      ?auto_453829 - BLOCK
      ?auto_453830 - BLOCK
      ?auto_453831 - BLOCK
      ?auto_453832 - BLOCK
      ?auto_453833 - BLOCK
      ?auto_453834 - BLOCK
      ?auto_453835 - BLOCK
    )
    :vars
    (
      ?auto_453836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453835 ?auto_453836 ) ( ON-TABLE ?auto_453821 ) ( ON ?auto_453822 ?auto_453821 ) ( ON ?auto_453823 ?auto_453822 ) ( ON ?auto_453824 ?auto_453823 ) ( ON ?auto_453825 ?auto_453824 ) ( ON ?auto_453826 ?auto_453825 ) ( ON ?auto_453827 ?auto_453826 ) ( ON ?auto_453828 ?auto_453827 ) ( ON ?auto_453829 ?auto_453828 ) ( ON ?auto_453830 ?auto_453829 ) ( not ( = ?auto_453821 ?auto_453822 ) ) ( not ( = ?auto_453821 ?auto_453823 ) ) ( not ( = ?auto_453821 ?auto_453824 ) ) ( not ( = ?auto_453821 ?auto_453825 ) ) ( not ( = ?auto_453821 ?auto_453826 ) ) ( not ( = ?auto_453821 ?auto_453827 ) ) ( not ( = ?auto_453821 ?auto_453828 ) ) ( not ( = ?auto_453821 ?auto_453829 ) ) ( not ( = ?auto_453821 ?auto_453830 ) ) ( not ( = ?auto_453821 ?auto_453831 ) ) ( not ( = ?auto_453821 ?auto_453832 ) ) ( not ( = ?auto_453821 ?auto_453833 ) ) ( not ( = ?auto_453821 ?auto_453834 ) ) ( not ( = ?auto_453821 ?auto_453835 ) ) ( not ( = ?auto_453821 ?auto_453836 ) ) ( not ( = ?auto_453822 ?auto_453823 ) ) ( not ( = ?auto_453822 ?auto_453824 ) ) ( not ( = ?auto_453822 ?auto_453825 ) ) ( not ( = ?auto_453822 ?auto_453826 ) ) ( not ( = ?auto_453822 ?auto_453827 ) ) ( not ( = ?auto_453822 ?auto_453828 ) ) ( not ( = ?auto_453822 ?auto_453829 ) ) ( not ( = ?auto_453822 ?auto_453830 ) ) ( not ( = ?auto_453822 ?auto_453831 ) ) ( not ( = ?auto_453822 ?auto_453832 ) ) ( not ( = ?auto_453822 ?auto_453833 ) ) ( not ( = ?auto_453822 ?auto_453834 ) ) ( not ( = ?auto_453822 ?auto_453835 ) ) ( not ( = ?auto_453822 ?auto_453836 ) ) ( not ( = ?auto_453823 ?auto_453824 ) ) ( not ( = ?auto_453823 ?auto_453825 ) ) ( not ( = ?auto_453823 ?auto_453826 ) ) ( not ( = ?auto_453823 ?auto_453827 ) ) ( not ( = ?auto_453823 ?auto_453828 ) ) ( not ( = ?auto_453823 ?auto_453829 ) ) ( not ( = ?auto_453823 ?auto_453830 ) ) ( not ( = ?auto_453823 ?auto_453831 ) ) ( not ( = ?auto_453823 ?auto_453832 ) ) ( not ( = ?auto_453823 ?auto_453833 ) ) ( not ( = ?auto_453823 ?auto_453834 ) ) ( not ( = ?auto_453823 ?auto_453835 ) ) ( not ( = ?auto_453823 ?auto_453836 ) ) ( not ( = ?auto_453824 ?auto_453825 ) ) ( not ( = ?auto_453824 ?auto_453826 ) ) ( not ( = ?auto_453824 ?auto_453827 ) ) ( not ( = ?auto_453824 ?auto_453828 ) ) ( not ( = ?auto_453824 ?auto_453829 ) ) ( not ( = ?auto_453824 ?auto_453830 ) ) ( not ( = ?auto_453824 ?auto_453831 ) ) ( not ( = ?auto_453824 ?auto_453832 ) ) ( not ( = ?auto_453824 ?auto_453833 ) ) ( not ( = ?auto_453824 ?auto_453834 ) ) ( not ( = ?auto_453824 ?auto_453835 ) ) ( not ( = ?auto_453824 ?auto_453836 ) ) ( not ( = ?auto_453825 ?auto_453826 ) ) ( not ( = ?auto_453825 ?auto_453827 ) ) ( not ( = ?auto_453825 ?auto_453828 ) ) ( not ( = ?auto_453825 ?auto_453829 ) ) ( not ( = ?auto_453825 ?auto_453830 ) ) ( not ( = ?auto_453825 ?auto_453831 ) ) ( not ( = ?auto_453825 ?auto_453832 ) ) ( not ( = ?auto_453825 ?auto_453833 ) ) ( not ( = ?auto_453825 ?auto_453834 ) ) ( not ( = ?auto_453825 ?auto_453835 ) ) ( not ( = ?auto_453825 ?auto_453836 ) ) ( not ( = ?auto_453826 ?auto_453827 ) ) ( not ( = ?auto_453826 ?auto_453828 ) ) ( not ( = ?auto_453826 ?auto_453829 ) ) ( not ( = ?auto_453826 ?auto_453830 ) ) ( not ( = ?auto_453826 ?auto_453831 ) ) ( not ( = ?auto_453826 ?auto_453832 ) ) ( not ( = ?auto_453826 ?auto_453833 ) ) ( not ( = ?auto_453826 ?auto_453834 ) ) ( not ( = ?auto_453826 ?auto_453835 ) ) ( not ( = ?auto_453826 ?auto_453836 ) ) ( not ( = ?auto_453827 ?auto_453828 ) ) ( not ( = ?auto_453827 ?auto_453829 ) ) ( not ( = ?auto_453827 ?auto_453830 ) ) ( not ( = ?auto_453827 ?auto_453831 ) ) ( not ( = ?auto_453827 ?auto_453832 ) ) ( not ( = ?auto_453827 ?auto_453833 ) ) ( not ( = ?auto_453827 ?auto_453834 ) ) ( not ( = ?auto_453827 ?auto_453835 ) ) ( not ( = ?auto_453827 ?auto_453836 ) ) ( not ( = ?auto_453828 ?auto_453829 ) ) ( not ( = ?auto_453828 ?auto_453830 ) ) ( not ( = ?auto_453828 ?auto_453831 ) ) ( not ( = ?auto_453828 ?auto_453832 ) ) ( not ( = ?auto_453828 ?auto_453833 ) ) ( not ( = ?auto_453828 ?auto_453834 ) ) ( not ( = ?auto_453828 ?auto_453835 ) ) ( not ( = ?auto_453828 ?auto_453836 ) ) ( not ( = ?auto_453829 ?auto_453830 ) ) ( not ( = ?auto_453829 ?auto_453831 ) ) ( not ( = ?auto_453829 ?auto_453832 ) ) ( not ( = ?auto_453829 ?auto_453833 ) ) ( not ( = ?auto_453829 ?auto_453834 ) ) ( not ( = ?auto_453829 ?auto_453835 ) ) ( not ( = ?auto_453829 ?auto_453836 ) ) ( not ( = ?auto_453830 ?auto_453831 ) ) ( not ( = ?auto_453830 ?auto_453832 ) ) ( not ( = ?auto_453830 ?auto_453833 ) ) ( not ( = ?auto_453830 ?auto_453834 ) ) ( not ( = ?auto_453830 ?auto_453835 ) ) ( not ( = ?auto_453830 ?auto_453836 ) ) ( not ( = ?auto_453831 ?auto_453832 ) ) ( not ( = ?auto_453831 ?auto_453833 ) ) ( not ( = ?auto_453831 ?auto_453834 ) ) ( not ( = ?auto_453831 ?auto_453835 ) ) ( not ( = ?auto_453831 ?auto_453836 ) ) ( not ( = ?auto_453832 ?auto_453833 ) ) ( not ( = ?auto_453832 ?auto_453834 ) ) ( not ( = ?auto_453832 ?auto_453835 ) ) ( not ( = ?auto_453832 ?auto_453836 ) ) ( not ( = ?auto_453833 ?auto_453834 ) ) ( not ( = ?auto_453833 ?auto_453835 ) ) ( not ( = ?auto_453833 ?auto_453836 ) ) ( not ( = ?auto_453834 ?auto_453835 ) ) ( not ( = ?auto_453834 ?auto_453836 ) ) ( not ( = ?auto_453835 ?auto_453836 ) ) ( ON ?auto_453834 ?auto_453835 ) ( ON ?auto_453833 ?auto_453834 ) ( ON ?auto_453832 ?auto_453833 ) ( CLEAR ?auto_453830 ) ( ON ?auto_453831 ?auto_453832 ) ( CLEAR ?auto_453831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_453821 ?auto_453822 ?auto_453823 ?auto_453824 ?auto_453825 ?auto_453826 ?auto_453827 ?auto_453828 ?auto_453829 ?auto_453830 ?auto_453831 )
      ( MAKE-15PILE ?auto_453821 ?auto_453822 ?auto_453823 ?auto_453824 ?auto_453825 ?auto_453826 ?auto_453827 ?auto_453828 ?auto_453829 ?auto_453830 ?auto_453831 ?auto_453832 ?auto_453833 ?auto_453834 ?auto_453835 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453852 - BLOCK
      ?auto_453853 - BLOCK
      ?auto_453854 - BLOCK
      ?auto_453855 - BLOCK
      ?auto_453856 - BLOCK
      ?auto_453857 - BLOCK
      ?auto_453858 - BLOCK
      ?auto_453859 - BLOCK
      ?auto_453860 - BLOCK
      ?auto_453861 - BLOCK
      ?auto_453862 - BLOCK
      ?auto_453863 - BLOCK
      ?auto_453864 - BLOCK
      ?auto_453865 - BLOCK
      ?auto_453866 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453866 ) ( ON-TABLE ?auto_453852 ) ( ON ?auto_453853 ?auto_453852 ) ( ON ?auto_453854 ?auto_453853 ) ( ON ?auto_453855 ?auto_453854 ) ( ON ?auto_453856 ?auto_453855 ) ( ON ?auto_453857 ?auto_453856 ) ( ON ?auto_453858 ?auto_453857 ) ( ON ?auto_453859 ?auto_453858 ) ( ON ?auto_453860 ?auto_453859 ) ( ON ?auto_453861 ?auto_453860 ) ( not ( = ?auto_453852 ?auto_453853 ) ) ( not ( = ?auto_453852 ?auto_453854 ) ) ( not ( = ?auto_453852 ?auto_453855 ) ) ( not ( = ?auto_453852 ?auto_453856 ) ) ( not ( = ?auto_453852 ?auto_453857 ) ) ( not ( = ?auto_453852 ?auto_453858 ) ) ( not ( = ?auto_453852 ?auto_453859 ) ) ( not ( = ?auto_453852 ?auto_453860 ) ) ( not ( = ?auto_453852 ?auto_453861 ) ) ( not ( = ?auto_453852 ?auto_453862 ) ) ( not ( = ?auto_453852 ?auto_453863 ) ) ( not ( = ?auto_453852 ?auto_453864 ) ) ( not ( = ?auto_453852 ?auto_453865 ) ) ( not ( = ?auto_453852 ?auto_453866 ) ) ( not ( = ?auto_453853 ?auto_453854 ) ) ( not ( = ?auto_453853 ?auto_453855 ) ) ( not ( = ?auto_453853 ?auto_453856 ) ) ( not ( = ?auto_453853 ?auto_453857 ) ) ( not ( = ?auto_453853 ?auto_453858 ) ) ( not ( = ?auto_453853 ?auto_453859 ) ) ( not ( = ?auto_453853 ?auto_453860 ) ) ( not ( = ?auto_453853 ?auto_453861 ) ) ( not ( = ?auto_453853 ?auto_453862 ) ) ( not ( = ?auto_453853 ?auto_453863 ) ) ( not ( = ?auto_453853 ?auto_453864 ) ) ( not ( = ?auto_453853 ?auto_453865 ) ) ( not ( = ?auto_453853 ?auto_453866 ) ) ( not ( = ?auto_453854 ?auto_453855 ) ) ( not ( = ?auto_453854 ?auto_453856 ) ) ( not ( = ?auto_453854 ?auto_453857 ) ) ( not ( = ?auto_453854 ?auto_453858 ) ) ( not ( = ?auto_453854 ?auto_453859 ) ) ( not ( = ?auto_453854 ?auto_453860 ) ) ( not ( = ?auto_453854 ?auto_453861 ) ) ( not ( = ?auto_453854 ?auto_453862 ) ) ( not ( = ?auto_453854 ?auto_453863 ) ) ( not ( = ?auto_453854 ?auto_453864 ) ) ( not ( = ?auto_453854 ?auto_453865 ) ) ( not ( = ?auto_453854 ?auto_453866 ) ) ( not ( = ?auto_453855 ?auto_453856 ) ) ( not ( = ?auto_453855 ?auto_453857 ) ) ( not ( = ?auto_453855 ?auto_453858 ) ) ( not ( = ?auto_453855 ?auto_453859 ) ) ( not ( = ?auto_453855 ?auto_453860 ) ) ( not ( = ?auto_453855 ?auto_453861 ) ) ( not ( = ?auto_453855 ?auto_453862 ) ) ( not ( = ?auto_453855 ?auto_453863 ) ) ( not ( = ?auto_453855 ?auto_453864 ) ) ( not ( = ?auto_453855 ?auto_453865 ) ) ( not ( = ?auto_453855 ?auto_453866 ) ) ( not ( = ?auto_453856 ?auto_453857 ) ) ( not ( = ?auto_453856 ?auto_453858 ) ) ( not ( = ?auto_453856 ?auto_453859 ) ) ( not ( = ?auto_453856 ?auto_453860 ) ) ( not ( = ?auto_453856 ?auto_453861 ) ) ( not ( = ?auto_453856 ?auto_453862 ) ) ( not ( = ?auto_453856 ?auto_453863 ) ) ( not ( = ?auto_453856 ?auto_453864 ) ) ( not ( = ?auto_453856 ?auto_453865 ) ) ( not ( = ?auto_453856 ?auto_453866 ) ) ( not ( = ?auto_453857 ?auto_453858 ) ) ( not ( = ?auto_453857 ?auto_453859 ) ) ( not ( = ?auto_453857 ?auto_453860 ) ) ( not ( = ?auto_453857 ?auto_453861 ) ) ( not ( = ?auto_453857 ?auto_453862 ) ) ( not ( = ?auto_453857 ?auto_453863 ) ) ( not ( = ?auto_453857 ?auto_453864 ) ) ( not ( = ?auto_453857 ?auto_453865 ) ) ( not ( = ?auto_453857 ?auto_453866 ) ) ( not ( = ?auto_453858 ?auto_453859 ) ) ( not ( = ?auto_453858 ?auto_453860 ) ) ( not ( = ?auto_453858 ?auto_453861 ) ) ( not ( = ?auto_453858 ?auto_453862 ) ) ( not ( = ?auto_453858 ?auto_453863 ) ) ( not ( = ?auto_453858 ?auto_453864 ) ) ( not ( = ?auto_453858 ?auto_453865 ) ) ( not ( = ?auto_453858 ?auto_453866 ) ) ( not ( = ?auto_453859 ?auto_453860 ) ) ( not ( = ?auto_453859 ?auto_453861 ) ) ( not ( = ?auto_453859 ?auto_453862 ) ) ( not ( = ?auto_453859 ?auto_453863 ) ) ( not ( = ?auto_453859 ?auto_453864 ) ) ( not ( = ?auto_453859 ?auto_453865 ) ) ( not ( = ?auto_453859 ?auto_453866 ) ) ( not ( = ?auto_453860 ?auto_453861 ) ) ( not ( = ?auto_453860 ?auto_453862 ) ) ( not ( = ?auto_453860 ?auto_453863 ) ) ( not ( = ?auto_453860 ?auto_453864 ) ) ( not ( = ?auto_453860 ?auto_453865 ) ) ( not ( = ?auto_453860 ?auto_453866 ) ) ( not ( = ?auto_453861 ?auto_453862 ) ) ( not ( = ?auto_453861 ?auto_453863 ) ) ( not ( = ?auto_453861 ?auto_453864 ) ) ( not ( = ?auto_453861 ?auto_453865 ) ) ( not ( = ?auto_453861 ?auto_453866 ) ) ( not ( = ?auto_453862 ?auto_453863 ) ) ( not ( = ?auto_453862 ?auto_453864 ) ) ( not ( = ?auto_453862 ?auto_453865 ) ) ( not ( = ?auto_453862 ?auto_453866 ) ) ( not ( = ?auto_453863 ?auto_453864 ) ) ( not ( = ?auto_453863 ?auto_453865 ) ) ( not ( = ?auto_453863 ?auto_453866 ) ) ( not ( = ?auto_453864 ?auto_453865 ) ) ( not ( = ?auto_453864 ?auto_453866 ) ) ( not ( = ?auto_453865 ?auto_453866 ) ) ( ON ?auto_453865 ?auto_453866 ) ( ON ?auto_453864 ?auto_453865 ) ( ON ?auto_453863 ?auto_453864 ) ( CLEAR ?auto_453861 ) ( ON ?auto_453862 ?auto_453863 ) ( CLEAR ?auto_453862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_453852 ?auto_453853 ?auto_453854 ?auto_453855 ?auto_453856 ?auto_453857 ?auto_453858 ?auto_453859 ?auto_453860 ?auto_453861 ?auto_453862 )
      ( MAKE-15PILE ?auto_453852 ?auto_453853 ?auto_453854 ?auto_453855 ?auto_453856 ?auto_453857 ?auto_453858 ?auto_453859 ?auto_453860 ?auto_453861 ?auto_453862 ?auto_453863 ?auto_453864 ?auto_453865 ?auto_453866 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453882 - BLOCK
      ?auto_453883 - BLOCK
      ?auto_453884 - BLOCK
      ?auto_453885 - BLOCK
      ?auto_453886 - BLOCK
      ?auto_453887 - BLOCK
      ?auto_453888 - BLOCK
      ?auto_453889 - BLOCK
      ?auto_453890 - BLOCK
      ?auto_453891 - BLOCK
      ?auto_453892 - BLOCK
      ?auto_453893 - BLOCK
      ?auto_453894 - BLOCK
      ?auto_453895 - BLOCK
      ?auto_453896 - BLOCK
    )
    :vars
    (
      ?auto_453897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453896 ?auto_453897 ) ( ON-TABLE ?auto_453882 ) ( ON ?auto_453883 ?auto_453882 ) ( ON ?auto_453884 ?auto_453883 ) ( ON ?auto_453885 ?auto_453884 ) ( ON ?auto_453886 ?auto_453885 ) ( ON ?auto_453887 ?auto_453886 ) ( ON ?auto_453888 ?auto_453887 ) ( ON ?auto_453889 ?auto_453888 ) ( ON ?auto_453890 ?auto_453889 ) ( not ( = ?auto_453882 ?auto_453883 ) ) ( not ( = ?auto_453882 ?auto_453884 ) ) ( not ( = ?auto_453882 ?auto_453885 ) ) ( not ( = ?auto_453882 ?auto_453886 ) ) ( not ( = ?auto_453882 ?auto_453887 ) ) ( not ( = ?auto_453882 ?auto_453888 ) ) ( not ( = ?auto_453882 ?auto_453889 ) ) ( not ( = ?auto_453882 ?auto_453890 ) ) ( not ( = ?auto_453882 ?auto_453891 ) ) ( not ( = ?auto_453882 ?auto_453892 ) ) ( not ( = ?auto_453882 ?auto_453893 ) ) ( not ( = ?auto_453882 ?auto_453894 ) ) ( not ( = ?auto_453882 ?auto_453895 ) ) ( not ( = ?auto_453882 ?auto_453896 ) ) ( not ( = ?auto_453882 ?auto_453897 ) ) ( not ( = ?auto_453883 ?auto_453884 ) ) ( not ( = ?auto_453883 ?auto_453885 ) ) ( not ( = ?auto_453883 ?auto_453886 ) ) ( not ( = ?auto_453883 ?auto_453887 ) ) ( not ( = ?auto_453883 ?auto_453888 ) ) ( not ( = ?auto_453883 ?auto_453889 ) ) ( not ( = ?auto_453883 ?auto_453890 ) ) ( not ( = ?auto_453883 ?auto_453891 ) ) ( not ( = ?auto_453883 ?auto_453892 ) ) ( not ( = ?auto_453883 ?auto_453893 ) ) ( not ( = ?auto_453883 ?auto_453894 ) ) ( not ( = ?auto_453883 ?auto_453895 ) ) ( not ( = ?auto_453883 ?auto_453896 ) ) ( not ( = ?auto_453883 ?auto_453897 ) ) ( not ( = ?auto_453884 ?auto_453885 ) ) ( not ( = ?auto_453884 ?auto_453886 ) ) ( not ( = ?auto_453884 ?auto_453887 ) ) ( not ( = ?auto_453884 ?auto_453888 ) ) ( not ( = ?auto_453884 ?auto_453889 ) ) ( not ( = ?auto_453884 ?auto_453890 ) ) ( not ( = ?auto_453884 ?auto_453891 ) ) ( not ( = ?auto_453884 ?auto_453892 ) ) ( not ( = ?auto_453884 ?auto_453893 ) ) ( not ( = ?auto_453884 ?auto_453894 ) ) ( not ( = ?auto_453884 ?auto_453895 ) ) ( not ( = ?auto_453884 ?auto_453896 ) ) ( not ( = ?auto_453884 ?auto_453897 ) ) ( not ( = ?auto_453885 ?auto_453886 ) ) ( not ( = ?auto_453885 ?auto_453887 ) ) ( not ( = ?auto_453885 ?auto_453888 ) ) ( not ( = ?auto_453885 ?auto_453889 ) ) ( not ( = ?auto_453885 ?auto_453890 ) ) ( not ( = ?auto_453885 ?auto_453891 ) ) ( not ( = ?auto_453885 ?auto_453892 ) ) ( not ( = ?auto_453885 ?auto_453893 ) ) ( not ( = ?auto_453885 ?auto_453894 ) ) ( not ( = ?auto_453885 ?auto_453895 ) ) ( not ( = ?auto_453885 ?auto_453896 ) ) ( not ( = ?auto_453885 ?auto_453897 ) ) ( not ( = ?auto_453886 ?auto_453887 ) ) ( not ( = ?auto_453886 ?auto_453888 ) ) ( not ( = ?auto_453886 ?auto_453889 ) ) ( not ( = ?auto_453886 ?auto_453890 ) ) ( not ( = ?auto_453886 ?auto_453891 ) ) ( not ( = ?auto_453886 ?auto_453892 ) ) ( not ( = ?auto_453886 ?auto_453893 ) ) ( not ( = ?auto_453886 ?auto_453894 ) ) ( not ( = ?auto_453886 ?auto_453895 ) ) ( not ( = ?auto_453886 ?auto_453896 ) ) ( not ( = ?auto_453886 ?auto_453897 ) ) ( not ( = ?auto_453887 ?auto_453888 ) ) ( not ( = ?auto_453887 ?auto_453889 ) ) ( not ( = ?auto_453887 ?auto_453890 ) ) ( not ( = ?auto_453887 ?auto_453891 ) ) ( not ( = ?auto_453887 ?auto_453892 ) ) ( not ( = ?auto_453887 ?auto_453893 ) ) ( not ( = ?auto_453887 ?auto_453894 ) ) ( not ( = ?auto_453887 ?auto_453895 ) ) ( not ( = ?auto_453887 ?auto_453896 ) ) ( not ( = ?auto_453887 ?auto_453897 ) ) ( not ( = ?auto_453888 ?auto_453889 ) ) ( not ( = ?auto_453888 ?auto_453890 ) ) ( not ( = ?auto_453888 ?auto_453891 ) ) ( not ( = ?auto_453888 ?auto_453892 ) ) ( not ( = ?auto_453888 ?auto_453893 ) ) ( not ( = ?auto_453888 ?auto_453894 ) ) ( not ( = ?auto_453888 ?auto_453895 ) ) ( not ( = ?auto_453888 ?auto_453896 ) ) ( not ( = ?auto_453888 ?auto_453897 ) ) ( not ( = ?auto_453889 ?auto_453890 ) ) ( not ( = ?auto_453889 ?auto_453891 ) ) ( not ( = ?auto_453889 ?auto_453892 ) ) ( not ( = ?auto_453889 ?auto_453893 ) ) ( not ( = ?auto_453889 ?auto_453894 ) ) ( not ( = ?auto_453889 ?auto_453895 ) ) ( not ( = ?auto_453889 ?auto_453896 ) ) ( not ( = ?auto_453889 ?auto_453897 ) ) ( not ( = ?auto_453890 ?auto_453891 ) ) ( not ( = ?auto_453890 ?auto_453892 ) ) ( not ( = ?auto_453890 ?auto_453893 ) ) ( not ( = ?auto_453890 ?auto_453894 ) ) ( not ( = ?auto_453890 ?auto_453895 ) ) ( not ( = ?auto_453890 ?auto_453896 ) ) ( not ( = ?auto_453890 ?auto_453897 ) ) ( not ( = ?auto_453891 ?auto_453892 ) ) ( not ( = ?auto_453891 ?auto_453893 ) ) ( not ( = ?auto_453891 ?auto_453894 ) ) ( not ( = ?auto_453891 ?auto_453895 ) ) ( not ( = ?auto_453891 ?auto_453896 ) ) ( not ( = ?auto_453891 ?auto_453897 ) ) ( not ( = ?auto_453892 ?auto_453893 ) ) ( not ( = ?auto_453892 ?auto_453894 ) ) ( not ( = ?auto_453892 ?auto_453895 ) ) ( not ( = ?auto_453892 ?auto_453896 ) ) ( not ( = ?auto_453892 ?auto_453897 ) ) ( not ( = ?auto_453893 ?auto_453894 ) ) ( not ( = ?auto_453893 ?auto_453895 ) ) ( not ( = ?auto_453893 ?auto_453896 ) ) ( not ( = ?auto_453893 ?auto_453897 ) ) ( not ( = ?auto_453894 ?auto_453895 ) ) ( not ( = ?auto_453894 ?auto_453896 ) ) ( not ( = ?auto_453894 ?auto_453897 ) ) ( not ( = ?auto_453895 ?auto_453896 ) ) ( not ( = ?auto_453895 ?auto_453897 ) ) ( not ( = ?auto_453896 ?auto_453897 ) ) ( ON ?auto_453895 ?auto_453896 ) ( ON ?auto_453894 ?auto_453895 ) ( ON ?auto_453893 ?auto_453894 ) ( ON ?auto_453892 ?auto_453893 ) ( CLEAR ?auto_453890 ) ( ON ?auto_453891 ?auto_453892 ) ( CLEAR ?auto_453891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_453882 ?auto_453883 ?auto_453884 ?auto_453885 ?auto_453886 ?auto_453887 ?auto_453888 ?auto_453889 ?auto_453890 ?auto_453891 )
      ( MAKE-15PILE ?auto_453882 ?auto_453883 ?auto_453884 ?auto_453885 ?auto_453886 ?auto_453887 ?auto_453888 ?auto_453889 ?auto_453890 ?auto_453891 ?auto_453892 ?auto_453893 ?auto_453894 ?auto_453895 ?auto_453896 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453913 - BLOCK
      ?auto_453914 - BLOCK
      ?auto_453915 - BLOCK
      ?auto_453916 - BLOCK
      ?auto_453917 - BLOCK
      ?auto_453918 - BLOCK
      ?auto_453919 - BLOCK
      ?auto_453920 - BLOCK
      ?auto_453921 - BLOCK
      ?auto_453922 - BLOCK
      ?auto_453923 - BLOCK
      ?auto_453924 - BLOCK
      ?auto_453925 - BLOCK
      ?auto_453926 - BLOCK
      ?auto_453927 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453927 ) ( ON-TABLE ?auto_453913 ) ( ON ?auto_453914 ?auto_453913 ) ( ON ?auto_453915 ?auto_453914 ) ( ON ?auto_453916 ?auto_453915 ) ( ON ?auto_453917 ?auto_453916 ) ( ON ?auto_453918 ?auto_453917 ) ( ON ?auto_453919 ?auto_453918 ) ( ON ?auto_453920 ?auto_453919 ) ( ON ?auto_453921 ?auto_453920 ) ( not ( = ?auto_453913 ?auto_453914 ) ) ( not ( = ?auto_453913 ?auto_453915 ) ) ( not ( = ?auto_453913 ?auto_453916 ) ) ( not ( = ?auto_453913 ?auto_453917 ) ) ( not ( = ?auto_453913 ?auto_453918 ) ) ( not ( = ?auto_453913 ?auto_453919 ) ) ( not ( = ?auto_453913 ?auto_453920 ) ) ( not ( = ?auto_453913 ?auto_453921 ) ) ( not ( = ?auto_453913 ?auto_453922 ) ) ( not ( = ?auto_453913 ?auto_453923 ) ) ( not ( = ?auto_453913 ?auto_453924 ) ) ( not ( = ?auto_453913 ?auto_453925 ) ) ( not ( = ?auto_453913 ?auto_453926 ) ) ( not ( = ?auto_453913 ?auto_453927 ) ) ( not ( = ?auto_453914 ?auto_453915 ) ) ( not ( = ?auto_453914 ?auto_453916 ) ) ( not ( = ?auto_453914 ?auto_453917 ) ) ( not ( = ?auto_453914 ?auto_453918 ) ) ( not ( = ?auto_453914 ?auto_453919 ) ) ( not ( = ?auto_453914 ?auto_453920 ) ) ( not ( = ?auto_453914 ?auto_453921 ) ) ( not ( = ?auto_453914 ?auto_453922 ) ) ( not ( = ?auto_453914 ?auto_453923 ) ) ( not ( = ?auto_453914 ?auto_453924 ) ) ( not ( = ?auto_453914 ?auto_453925 ) ) ( not ( = ?auto_453914 ?auto_453926 ) ) ( not ( = ?auto_453914 ?auto_453927 ) ) ( not ( = ?auto_453915 ?auto_453916 ) ) ( not ( = ?auto_453915 ?auto_453917 ) ) ( not ( = ?auto_453915 ?auto_453918 ) ) ( not ( = ?auto_453915 ?auto_453919 ) ) ( not ( = ?auto_453915 ?auto_453920 ) ) ( not ( = ?auto_453915 ?auto_453921 ) ) ( not ( = ?auto_453915 ?auto_453922 ) ) ( not ( = ?auto_453915 ?auto_453923 ) ) ( not ( = ?auto_453915 ?auto_453924 ) ) ( not ( = ?auto_453915 ?auto_453925 ) ) ( not ( = ?auto_453915 ?auto_453926 ) ) ( not ( = ?auto_453915 ?auto_453927 ) ) ( not ( = ?auto_453916 ?auto_453917 ) ) ( not ( = ?auto_453916 ?auto_453918 ) ) ( not ( = ?auto_453916 ?auto_453919 ) ) ( not ( = ?auto_453916 ?auto_453920 ) ) ( not ( = ?auto_453916 ?auto_453921 ) ) ( not ( = ?auto_453916 ?auto_453922 ) ) ( not ( = ?auto_453916 ?auto_453923 ) ) ( not ( = ?auto_453916 ?auto_453924 ) ) ( not ( = ?auto_453916 ?auto_453925 ) ) ( not ( = ?auto_453916 ?auto_453926 ) ) ( not ( = ?auto_453916 ?auto_453927 ) ) ( not ( = ?auto_453917 ?auto_453918 ) ) ( not ( = ?auto_453917 ?auto_453919 ) ) ( not ( = ?auto_453917 ?auto_453920 ) ) ( not ( = ?auto_453917 ?auto_453921 ) ) ( not ( = ?auto_453917 ?auto_453922 ) ) ( not ( = ?auto_453917 ?auto_453923 ) ) ( not ( = ?auto_453917 ?auto_453924 ) ) ( not ( = ?auto_453917 ?auto_453925 ) ) ( not ( = ?auto_453917 ?auto_453926 ) ) ( not ( = ?auto_453917 ?auto_453927 ) ) ( not ( = ?auto_453918 ?auto_453919 ) ) ( not ( = ?auto_453918 ?auto_453920 ) ) ( not ( = ?auto_453918 ?auto_453921 ) ) ( not ( = ?auto_453918 ?auto_453922 ) ) ( not ( = ?auto_453918 ?auto_453923 ) ) ( not ( = ?auto_453918 ?auto_453924 ) ) ( not ( = ?auto_453918 ?auto_453925 ) ) ( not ( = ?auto_453918 ?auto_453926 ) ) ( not ( = ?auto_453918 ?auto_453927 ) ) ( not ( = ?auto_453919 ?auto_453920 ) ) ( not ( = ?auto_453919 ?auto_453921 ) ) ( not ( = ?auto_453919 ?auto_453922 ) ) ( not ( = ?auto_453919 ?auto_453923 ) ) ( not ( = ?auto_453919 ?auto_453924 ) ) ( not ( = ?auto_453919 ?auto_453925 ) ) ( not ( = ?auto_453919 ?auto_453926 ) ) ( not ( = ?auto_453919 ?auto_453927 ) ) ( not ( = ?auto_453920 ?auto_453921 ) ) ( not ( = ?auto_453920 ?auto_453922 ) ) ( not ( = ?auto_453920 ?auto_453923 ) ) ( not ( = ?auto_453920 ?auto_453924 ) ) ( not ( = ?auto_453920 ?auto_453925 ) ) ( not ( = ?auto_453920 ?auto_453926 ) ) ( not ( = ?auto_453920 ?auto_453927 ) ) ( not ( = ?auto_453921 ?auto_453922 ) ) ( not ( = ?auto_453921 ?auto_453923 ) ) ( not ( = ?auto_453921 ?auto_453924 ) ) ( not ( = ?auto_453921 ?auto_453925 ) ) ( not ( = ?auto_453921 ?auto_453926 ) ) ( not ( = ?auto_453921 ?auto_453927 ) ) ( not ( = ?auto_453922 ?auto_453923 ) ) ( not ( = ?auto_453922 ?auto_453924 ) ) ( not ( = ?auto_453922 ?auto_453925 ) ) ( not ( = ?auto_453922 ?auto_453926 ) ) ( not ( = ?auto_453922 ?auto_453927 ) ) ( not ( = ?auto_453923 ?auto_453924 ) ) ( not ( = ?auto_453923 ?auto_453925 ) ) ( not ( = ?auto_453923 ?auto_453926 ) ) ( not ( = ?auto_453923 ?auto_453927 ) ) ( not ( = ?auto_453924 ?auto_453925 ) ) ( not ( = ?auto_453924 ?auto_453926 ) ) ( not ( = ?auto_453924 ?auto_453927 ) ) ( not ( = ?auto_453925 ?auto_453926 ) ) ( not ( = ?auto_453925 ?auto_453927 ) ) ( not ( = ?auto_453926 ?auto_453927 ) ) ( ON ?auto_453926 ?auto_453927 ) ( ON ?auto_453925 ?auto_453926 ) ( ON ?auto_453924 ?auto_453925 ) ( ON ?auto_453923 ?auto_453924 ) ( CLEAR ?auto_453921 ) ( ON ?auto_453922 ?auto_453923 ) ( CLEAR ?auto_453922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_453913 ?auto_453914 ?auto_453915 ?auto_453916 ?auto_453917 ?auto_453918 ?auto_453919 ?auto_453920 ?auto_453921 ?auto_453922 )
      ( MAKE-15PILE ?auto_453913 ?auto_453914 ?auto_453915 ?auto_453916 ?auto_453917 ?auto_453918 ?auto_453919 ?auto_453920 ?auto_453921 ?auto_453922 ?auto_453923 ?auto_453924 ?auto_453925 ?auto_453926 ?auto_453927 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453943 - BLOCK
      ?auto_453944 - BLOCK
      ?auto_453945 - BLOCK
      ?auto_453946 - BLOCK
      ?auto_453947 - BLOCK
      ?auto_453948 - BLOCK
      ?auto_453949 - BLOCK
      ?auto_453950 - BLOCK
      ?auto_453951 - BLOCK
      ?auto_453952 - BLOCK
      ?auto_453953 - BLOCK
      ?auto_453954 - BLOCK
      ?auto_453955 - BLOCK
      ?auto_453956 - BLOCK
      ?auto_453957 - BLOCK
    )
    :vars
    (
      ?auto_453958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_453957 ?auto_453958 ) ( ON-TABLE ?auto_453943 ) ( ON ?auto_453944 ?auto_453943 ) ( ON ?auto_453945 ?auto_453944 ) ( ON ?auto_453946 ?auto_453945 ) ( ON ?auto_453947 ?auto_453946 ) ( ON ?auto_453948 ?auto_453947 ) ( ON ?auto_453949 ?auto_453948 ) ( ON ?auto_453950 ?auto_453949 ) ( not ( = ?auto_453943 ?auto_453944 ) ) ( not ( = ?auto_453943 ?auto_453945 ) ) ( not ( = ?auto_453943 ?auto_453946 ) ) ( not ( = ?auto_453943 ?auto_453947 ) ) ( not ( = ?auto_453943 ?auto_453948 ) ) ( not ( = ?auto_453943 ?auto_453949 ) ) ( not ( = ?auto_453943 ?auto_453950 ) ) ( not ( = ?auto_453943 ?auto_453951 ) ) ( not ( = ?auto_453943 ?auto_453952 ) ) ( not ( = ?auto_453943 ?auto_453953 ) ) ( not ( = ?auto_453943 ?auto_453954 ) ) ( not ( = ?auto_453943 ?auto_453955 ) ) ( not ( = ?auto_453943 ?auto_453956 ) ) ( not ( = ?auto_453943 ?auto_453957 ) ) ( not ( = ?auto_453943 ?auto_453958 ) ) ( not ( = ?auto_453944 ?auto_453945 ) ) ( not ( = ?auto_453944 ?auto_453946 ) ) ( not ( = ?auto_453944 ?auto_453947 ) ) ( not ( = ?auto_453944 ?auto_453948 ) ) ( not ( = ?auto_453944 ?auto_453949 ) ) ( not ( = ?auto_453944 ?auto_453950 ) ) ( not ( = ?auto_453944 ?auto_453951 ) ) ( not ( = ?auto_453944 ?auto_453952 ) ) ( not ( = ?auto_453944 ?auto_453953 ) ) ( not ( = ?auto_453944 ?auto_453954 ) ) ( not ( = ?auto_453944 ?auto_453955 ) ) ( not ( = ?auto_453944 ?auto_453956 ) ) ( not ( = ?auto_453944 ?auto_453957 ) ) ( not ( = ?auto_453944 ?auto_453958 ) ) ( not ( = ?auto_453945 ?auto_453946 ) ) ( not ( = ?auto_453945 ?auto_453947 ) ) ( not ( = ?auto_453945 ?auto_453948 ) ) ( not ( = ?auto_453945 ?auto_453949 ) ) ( not ( = ?auto_453945 ?auto_453950 ) ) ( not ( = ?auto_453945 ?auto_453951 ) ) ( not ( = ?auto_453945 ?auto_453952 ) ) ( not ( = ?auto_453945 ?auto_453953 ) ) ( not ( = ?auto_453945 ?auto_453954 ) ) ( not ( = ?auto_453945 ?auto_453955 ) ) ( not ( = ?auto_453945 ?auto_453956 ) ) ( not ( = ?auto_453945 ?auto_453957 ) ) ( not ( = ?auto_453945 ?auto_453958 ) ) ( not ( = ?auto_453946 ?auto_453947 ) ) ( not ( = ?auto_453946 ?auto_453948 ) ) ( not ( = ?auto_453946 ?auto_453949 ) ) ( not ( = ?auto_453946 ?auto_453950 ) ) ( not ( = ?auto_453946 ?auto_453951 ) ) ( not ( = ?auto_453946 ?auto_453952 ) ) ( not ( = ?auto_453946 ?auto_453953 ) ) ( not ( = ?auto_453946 ?auto_453954 ) ) ( not ( = ?auto_453946 ?auto_453955 ) ) ( not ( = ?auto_453946 ?auto_453956 ) ) ( not ( = ?auto_453946 ?auto_453957 ) ) ( not ( = ?auto_453946 ?auto_453958 ) ) ( not ( = ?auto_453947 ?auto_453948 ) ) ( not ( = ?auto_453947 ?auto_453949 ) ) ( not ( = ?auto_453947 ?auto_453950 ) ) ( not ( = ?auto_453947 ?auto_453951 ) ) ( not ( = ?auto_453947 ?auto_453952 ) ) ( not ( = ?auto_453947 ?auto_453953 ) ) ( not ( = ?auto_453947 ?auto_453954 ) ) ( not ( = ?auto_453947 ?auto_453955 ) ) ( not ( = ?auto_453947 ?auto_453956 ) ) ( not ( = ?auto_453947 ?auto_453957 ) ) ( not ( = ?auto_453947 ?auto_453958 ) ) ( not ( = ?auto_453948 ?auto_453949 ) ) ( not ( = ?auto_453948 ?auto_453950 ) ) ( not ( = ?auto_453948 ?auto_453951 ) ) ( not ( = ?auto_453948 ?auto_453952 ) ) ( not ( = ?auto_453948 ?auto_453953 ) ) ( not ( = ?auto_453948 ?auto_453954 ) ) ( not ( = ?auto_453948 ?auto_453955 ) ) ( not ( = ?auto_453948 ?auto_453956 ) ) ( not ( = ?auto_453948 ?auto_453957 ) ) ( not ( = ?auto_453948 ?auto_453958 ) ) ( not ( = ?auto_453949 ?auto_453950 ) ) ( not ( = ?auto_453949 ?auto_453951 ) ) ( not ( = ?auto_453949 ?auto_453952 ) ) ( not ( = ?auto_453949 ?auto_453953 ) ) ( not ( = ?auto_453949 ?auto_453954 ) ) ( not ( = ?auto_453949 ?auto_453955 ) ) ( not ( = ?auto_453949 ?auto_453956 ) ) ( not ( = ?auto_453949 ?auto_453957 ) ) ( not ( = ?auto_453949 ?auto_453958 ) ) ( not ( = ?auto_453950 ?auto_453951 ) ) ( not ( = ?auto_453950 ?auto_453952 ) ) ( not ( = ?auto_453950 ?auto_453953 ) ) ( not ( = ?auto_453950 ?auto_453954 ) ) ( not ( = ?auto_453950 ?auto_453955 ) ) ( not ( = ?auto_453950 ?auto_453956 ) ) ( not ( = ?auto_453950 ?auto_453957 ) ) ( not ( = ?auto_453950 ?auto_453958 ) ) ( not ( = ?auto_453951 ?auto_453952 ) ) ( not ( = ?auto_453951 ?auto_453953 ) ) ( not ( = ?auto_453951 ?auto_453954 ) ) ( not ( = ?auto_453951 ?auto_453955 ) ) ( not ( = ?auto_453951 ?auto_453956 ) ) ( not ( = ?auto_453951 ?auto_453957 ) ) ( not ( = ?auto_453951 ?auto_453958 ) ) ( not ( = ?auto_453952 ?auto_453953 ) ) ( not ( = ?auto_453952 ?auto_453954 ) ) ( not ( = ?auto_453952 ?auto_453955 ) ) ( not ( = ?auto_453952 ?auto_453956 ) ) ( not ( = ?auto_453952 ?auto_453957 ) ) ( not ( = ?auto_453952 ?auto_453958 ) ) ( not ( = ?auto_453953 ?auto_453954 ) ) ( not ( = ?auto_453953 ?auto_453955 ) ) ( not ( = ?auto_453953 ?auto_453956 ) ) ( not ( = ?auto_453953 ?auto_453957 ) ) ( not ( = ?auto_453953 ?auto_453958 ) ) ( not ( = ?auto_453954 ?auto_453955 ) ) ( not ( = ?auto_453954 ?auto_453956 ) ) ( not ( = ?auto_453954 ?auto_453957 ) ) ( not ( = ?auto_453954 ?auto_453958 ) ) ( not ( = ?auto_453955 ?auto_453956 ) ) ( not ( = ?auto_453955 ?auto_453957 ) ) ( not ( = ?auto_453955 ?auto_453958 ) ) ( not ( = ?auto_453956 ?auto_453957 ) ) ( not ( = ?auto_453956 ?auto_453958 ) ) ( not ( = ?auto_453957 ?auto_453958 ) ) ( ON ?auto_453956 ?auto_453957 ) ( ON ?auto_453955 ?auto_453956 ) ( ON ?auto_453954 ?auto_453955 ) ( ON ?auto_453953 ?auto_453954 ) ( ON ?auto_453952 ?auto_453953 ) ( CLEAR ?auto_453950 ) ( ON ?auto_453951 ?auto_453952 ) ( CLEAR ?auto_453951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_453943 ?auto_453944 ?auto_453945 ?auto_453946 ?auto_453947 ?auto_453948 ?auto_453949 ?auto_453950 ?auto_453951 )
      ( MAKE-15PILE ?auto_453943 ?auto_453944 ?auto_453945 ?auto_453946 ?auto_453947 ?auto_453948 ?auto_453949 ?auto_453950 ?auto_453951 ?auto_453952 ?auto_453953 ?auto_453954 ?auto_453955 ?auto_453956 ?auto_453957 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_453974 - BLOCK
      ?auto_453975 - BLOCK
      ?auto_453976 - BLOCK
      ?auto_453977 - BLOCK
      ?auto_453978 - BLOCK
      ?auto_453979 - BLOCK
      ?auto_453980 - BLOCK
      ?auto_453981 - BLOCK
      ?auto_453982 - BLOCK
      ?auto_453983 - BLOCK
      ?auto_453984 - BLOCK
      ?auto_453985 - BLOCK
      ?auto_453986 - BLOCK
      ?auto_453987 - BLOCK
      ?auto_453988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_453988 ) ( ON-TABLE ?auto_453974 ) ( ON ?auto_453975 ?auto_453974 ) ( ON ?auto_453976 ?auto_453975 ) ( ON ?auto_453977 ?auto_453976 ) ( ON ?auto_453978 ?auto_453977 ) ( ON ?auto_453979 ?auto_453978 ) ( ON ?auto_453980 ?auto_453979 ) ( ON ?auto_453981 ?auto_453980 ) ( not ( = ?auto_453974 ?auto_453975 ) ) ( not ( = ?auto_453974 ?auto_453976 ) ) ( not ( = ?auto_453974 ?auto_453977 ) ) ( not ( = ?auto_453974 ?auto_453978 ) ) ( not ( = ?auto_453974 ?auto_453979 ) ) ( not ( = ?auto_453974 ?auto_453980 ) ) ( not ( = ?auto_453974 ?auto_453981 ) ) ( not ( = ?auto_453974 ?auto_453982 ) ) ( not ( = ?auto_453974 ?auto_453983 ) ) ( not ( = ?auto_453974 ?auto_453984 ) ) ( not ( = ?auto_453974 ?auto_453985 ) ) ( not ( = ?auto_453974 ?auto_453986 ) ) ( not ( = ?auto_453974 ?auto_453987 ) ) ( not ( = ?auto_453974 ?auto_453988 ) ) ( not ( = ?auto_453975 ?auto_453976 ) ) ( not ( = ?auto_453975 ?auto_453977 ) ) ( not ( = ?auto_453975 ?auto_453978 ) ) ( not ( = ?auto_453975 ?auto_453979 ) ) ( not ( = ?auto_453975 ?auto_453980 ) ) ( not ( = ?auto_453975 ?auto_453981 ) ) ( not ( = ?auto_453975 ?auto_453982 ) ) ( not ( = ?auto_453975 ?auto_453983 ) ) ( not ( = ?auto_453975 ?auto_453984 ) ) ( not ( = ?auto_453975 ?auto_453985 ) ) ( not ( = ?auto_453975 ?auto_453986 ) ) ( not ( = ?auto_453975 ?auto_453987 ) ) ( not ( = ?auto_453975 ?auto_453988 ) ) ( not ( = ?auto_453976 ?auto_453977 ) ) ( not ( = ?auto_453976 ?auto_453978 ) ) ( not ( = ?auto_453976 ?auto_453979 ) ) ( not ( = ?auto_453976 ?auto_453980 ) ) ( not ( = ?auto_453976 ?auto_453981 ) ) ( not ( = ?auto_453976 ?auto_453982 ) ) ( not ( = ?auto_453976 ?auto_453983 ) ) ( not ( = ?auto_453976 ?auto_453984 ) ) ( not ( = ?auto_453976 ?auto_453985 ) ) ( not ( = ?auto_453976 ?auto_453986 ) ) ( not ( = ?auto_453976 ?auto_453987 ) ) ( not ( = ?auto_453976 ?auto_453988 ) ) ( not ( = ?auto_453977 ?auto_453978 ) ) ( not ( = ?auto_453977 ?auto_453979 ) ) ( not ( = ?auto_453977 ?auto_453980 ) ) ( not ( = ?auto_453977 ?auto_453981 ) ) ( not ( = ?auto_453977 ?auto_453982 ) ) ( not ( = ?auto_453977 ?auto_453983 ) ) ( not ( = ?auto_453977 ?auto_453984 ) ) ( not ( = ?auto_453977 ?auto_453985 ) ) ( not ( = ?auto_453977 ?auto_453986 ) ) ( not ( = ?auto_453977 ?auto_453987 ) ) ( not ( = ?auto_453977 ?auto_453988 ) ) ( not ( = ?auto_453978 ?auto_453979 ) ) ( not ( = ?auto_453978 ?auto_453980 ) ) ( not ( = ?auto_453978 ?auto_453981 ) ) ( not ( = ?auto_453978 ?auto_453982 ) ) ( not ( = ?auto_453978 ?auto_453983 ) ) ( not ( = ?auto_453978 ?auto_453984 ) ) ( not ( = ?auto_453978 ?auto_453985 ) ) ( not ( = ?auto_453978 ?auto_453986 ) ) ( not ( = ?auto_453978 ?auto_453987 ) ) ( not ( = ?auto_453978 ?auto_453988 ) ) ( not ( = ?auto_453979 ?auto_453980 ) ) ( not ( = ?auto_453979 ?auto_453981 ) ) ( not ( = ?auto_453979 ?auto_453982 ) ) ( not ( = ?auto_453979 ?auto_453983 ) ) ( not ( = ?auto_453979 ?auto_453984 ) ) ( not ( = ?auto_453979 ?auto_453985 ) ) ( not ( = ?auto_453979 ?auto_453986 ) ) ( not ( = ?auto_453979 ?auto_453987 ) ) ( not ( = ?auto_453979 ?auto_453988 ) ) ( not ( = ?auto_453980 ?auto_453981 ) ) ( not ( = ?auto_453980 ?auto_453982 ) ) ( not ( = ?auto_453980 ?auto_453983 ) ) ( not ( = ?auto_453980 ?auto_453984 ) ) ( not ( = ?auto_453980 ?auto_453985 ) ) ( not ( = ?auto_453980 ?auto_453986 ) ) ( not ( = ?auto_453980 ?auto_453987 ) ) ( not ( = ?auto_453980 ?auto_453988 ) ) ( not ( = ?auto_453981 ?auto_453982 ) ) ( not ( = ?auto_453981 ?auto_453983 ) ) ( not ( = ?auto_453981 ?auto_453984 ) ) ( not ( = ?auto_453981 ?auto_453985 ) ) ( not ( = ?auto_453981 ?auto_453986 ) ) ( not ( = ?auto_453981 ?auto_453987 ) ) ( not ( = ?auto_453981 ?auto_453988 ) ) ( not ( = ?auto_453982 ?auto_453983 ) ) ( not ( = ?auto_453982 ?auto_453984 ) ) ( not ( = ?auto_453982 ?auto_453985 ) ) ( not ( = ?auto_453982 ?auto_453986 ) ) ( not ( = ?auto_453982 ?auto_453987 ) ) ( not ( = ?auto_453982 ?auto_453988 ) ) ( not ( = ?auto_453983 ?auto_453984 ) ) ( not ( = ?auto_453983 ?auto_453985 ) ) ( not ( = ?auto_453983 ?auto_453986 ) ) ( not ( = ?auto_453983 ?auto_453987 ) ) ( not ( = ?auto_453983 ?auto_453988 ) ) ( not ( = ?auto_453984 ?auto_453985 ) ) ( not ( = ?auto_453984 ?auto_453986 ) ) ( not ( = ?auto_453984 ?auto_453987 ) ) ( not ( = ?auto_453984 ?auto_453988 ) ) ( not ( = ?auto_453985 ?auto_453986 ) ) ( not ( = ?auto_453985 ?auto_453987 ) ) ( not ( = ?auto_453985 ?auto_453988 ) ) ( not ( = ?auto_453986 ?auto_453987 ) ) ( not ( = ?auto_453986 ?auto_453988 ) ) ( not ( = ?auto_453987 ?auto_453988 ) ) ( ON ?auto_453987 ?auto_453988 ) ( ON ?auto_453986 ?auto_453987 ) ( ON ?auto_453985 ?auto_453986 ) ( ON ?auto_453984 ?auto_453985 ) ( ON ?auto_453983 ?auto_453984 ) ( CLEAR ?auto_453981 ) ( ON ?auto_453982 ?auto_453983 ) ( CLEAR ?auto_453982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_453974 ?auto_453975 ?auto_453976 ?auto_453977 ?auto_453978 ?auto_453979 ?auto_453980 ?auto_453981 ?auto_453982 )
      ( MAKE-15PILE ?auto_453974 ?auto_453975 ?auto_453976 ?auto_453977 ?auto_453978 ?auto_453979 ?auto_453980 ?auto_453981 ?auto_453982 ?auto_453983 ?auto_453984 ?auto_453985 ?auto_453986 ?auto_453987 ?auto_453988 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454004 - BLOCK
      ?auto_454005 - BLOCK
      ?auto_454006 - BLOCK
      ?auto_454007 - BLOCK
      ?auto_454008 - BLOCK
      ?auto_454009 - BLOCK
      ?auto_454010 - BLOCK
      ?auto_454011 - BLOCK
      ?auto_454012 - BLOCK
      ?auto_454013 - BLOCK
      ?auto_454014 - BLOCK
      ?auto_454015 - BLOCK
      ?auto_454016 - BLOCK
      ?auto_454017 - BLOCK
      ?auto_454018 - BLOCK
    )
    :vars
    (
      ?auto_454019 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454018 ?auto_454019 ) ( ON-TABLE ?auto_454004 ) ( ON ?auto_454005 ?auto_454004 ) ( ON ?auto_454006 ?auto_454005 ) ( ON ?auto_454007 ?auto_454006 ) ( ON ?auto_454008 ?auto_454007 ) ( ON ?auto_454009 ?auto_454008 ) ( ON ?auto_454010 ?auto_454009 ) ( not ( = ?auto_454004 ?auto_454005 ) ) ( not ( = ?auto_454004 ?auto_454006 ) ) ( not ( = ?auto_454004 ?auto_454007 ) ) ( not ( = ?auto_454004 ?auto_454008 ) ) ( not ( = ?auto_454004 ?auto_454009 ) ) ( not ( = ?auto_454004 ?auto_454010 ) ) ( not ( = ?auto_454004 ?auto_454011 ) ) ( not ( = ?auto_454004 ?auto_454012 ) ) ( not ( = ?auto_454004 ?auto_454013 ) ) ( not ( = ?auto_454004 ?auto_454014 ) ) ( not ( = ?auto_454004 ?auto_454015 ) ) ( not ( = ?auto_454004 ?auto_454016 ) ) ( not ( = ?auto_454004 ?auto_454017 ) ) ( not ( = ?auto_454004 ?auto_454018 ) ) ( not ( = ?auto_454004 ?auto_454019 ) ) ( not ( = ?auto_454005 ?auto_454006 ) ) ( not ( = ?auto_454005 ?auto_454007 ) ) ( not ( = ?auto_454005 ?auto_454008 ) ) ( not ( = ?auto_454005 ?auto_454009 ) ) ( not ( = ?auto_454005 ?auto_454010 ) ) ( not ( = ?auto_454005 ?auto_454011 ) ) ( not ( = ?auto_454005 ?auto_454012 ) ) ( not ( = ?auto_454005 ?auto_454013 ) ) ( not ( = ?auto_454005 ?auto_454014 ) ) ( not ( = ?auto_454005 ?auto_454015 ) ) ( not ( = ?auto_454005 ?auto_454016 ) ) ( not ( = ?auto_454005 ?auto_454017 ) ) ( not ( = ?auto_454005 ?auto_454018 ) ) ( not ( = ?auto_454005 ?auto_454019 ) ) ( not ( = ?auto_454006 ?auto_454007 ) ) ( not ( = ?auto_454006 ?auto_454008 ) ) ( not ( = ?auto_454006 ?auto_454009 ) ) ( not ( = ?auto_454006 ?auto_454010 ) ) ( not ( = ?auto_454006 ?auto_454011 ) ) ( not ( = ?auto_454006 ?auto_454012 ) ) ( not ( = ?auto_454006 ?auto_454013 ) ) ( not ( = ?auto_454006 ?auto_454014 ) ) ( not ( = ?auto_454006 ?auto_454015 ) ) ( not ( = ?auto_454006 ?auto_454016 ) ) ( not ( = ?auto_454006 ?auto_454017 ) ) ( not ( = ?auto_454006 ?auto_454018 ) ) ( not ( = ?auto_454006 ?auto_454019 ) ) ( not ( = ?auto_454007 ?auto_454008 ) ) ( not ( = ?auto_454007 ?auto_454009 ) ) ( not ( = ?auto_454007 ?auto_454010 ) ) ( not ( = ?auto_454007 ?auto_454011 ) ) ( not ( = ?auto_454007 ?auto_454012 ) ) ( not ( = ?auto_454007 ?auto_454013 ) ) ( not ( = ?auto_454007 ?auto_454014 ) ) ( not ( = ?auto_454007 ?auto_454015 ) ) ( not ( = ?auto_454007 ?auto_454016 ) ) ( not ( = ?auto_454007 ?auto_454017 ) ) ( not ( = ?auto_454007 ?auto_454018 ) ) ( not ( = ?auto_454007 ?auto_454019 ) ) ( not ( = ?auto_454008 ?auto_454009 ) ) ( not ( = ?auto_454008 ?auto_454010 ) ) ( not ( = ?auto_454008 ?auto_454011 ) ) ( not ( = ?auto_454008 ?auto_454012 ) ) ( not ( = ?auto_454008 ?auto_454013 ) ) ( not ( = ?auto_454008 ?auto_454014 ) ) ( not ( = ?auto_454008 ?auto_454015 ) ) ( not ( = ?auto_454008 ?auto_454016 ) ) ( not ( = ?auto_454008 ?auto_454017 ) ) ( not ( = ?auto_454008 ?auto_454018 ) ) ( not ( = ?auto_454008 ?auto_454019 ) ) ( not ( = ?auto_454009 ?auto_454010 ) ) ( not ( = ?auto_454009 ?auto_454011 ) ) ( not ( = ?auto_454009 ?auto_454012 ) ) ( not ( = ?auto_454009 ?auto_454013 ) ) ( not ( = ?auto_454009 ?auto_454014 ) ) ( not ( = ?auto_454009 ?auto_454015 ) ) ( not ( = ?auto_454009 ?auto_454016 ) ) ( not ( = ?auto_454009 ?auto_454017 ) ) ( not ( = ?auto_454009 ?auto_454018 ) ) ( not ( = ?auto_454009 ?auto_454019 ) ) ( not ( = ?auto_454010 ?auto_454011 ) ) ( not ( = ?auto_454010 ?auto_454012 ) ) ( not ( = ?auto_454010 ?auto_454013 ) ) ( not ( = ?auto_454010 ?auto_454014 ) ) ( not ( = ?auto_454010 ?auto_454015 ) ) ( not ( = ?auto_454010 ?auto_454016 ) ) ( not ( = ?auto_454010 ?auto_454017 ) ) ( not ( = ?auto_454010 ?auto_454018 ) ) ( not ( = ?auto_454010 ?auto_454019 ) ) ( not ( = ?auto_454011 ?auto_454012 ) ) ( not ( = ?auto_454011 ?auto_454013 ) ) ( not ( = ?auto_454011 ?auto_454014 ) ) ( not ( = ?auto_454011 ?auto_454015 ) ) ( not ( = ?auto_454011 ?auto_454016 ) ) ( not ( = ?auto_454011 ?auto_454017 ) ) ( not ( = ?auto_454011 ?auto_454018 ) ) ( not ( = ?auto_454011 ?auto_454019 ) ) ( not ( = ?auto_454012 ?auto_454013 ) ) ( not ( = ?auto_454012 ?auto_454014 ) ) ( not ( = ?auto_454012 ?auto_454015 ) ) ( not ( = ?auto_454012 ?auto_454016 ) ) ( not ( = ?auto_454012 ?auto_454017 ) ) ( not ( = ?auto_454012 ?auto_454018 ) ) ( not ( = ?auto_454012 ?auto_454019 ) ) ( not ( = ?auto_454013 ?auto_454014 ) ) ( not ( = ?auto_454013 ?auto_454015 ) ) ( not ( = ?auto_454013 ?auto_454016 ) ) ( not ( = ?auto_454013 ?auto_454017 ) ) ( not ( = ?auto_454013 ?auto_454018 ) ) ( not ( = ?auto_454013 ?auto_454019 ) ) ( not ( = ?auto_454014 ?auto_454015 ) ) ( not ( = ?auto_454014 ?auto_454016 ) ) ( not ( = ?auto_454014 ?auto_454017 ) ) ( not ( = ?auto_454014 ?auto_454018 ) ) ( not ( = ?auto_454014 ?auto_454019 ) ) ( not ( = ?auto_454015 ?auto_454016 ) ) ( not ( = ?auto_454015 ?auto_454017 ) ) ( not ( = ?auto_454015 ?auto_454018 ) ) ( not ( = ?auto_454015 ?auto_454019 ) ) ( not ( = ?auto_454016 ?auto_454017 ) ) ( not ( = ?auto_454016 ?auto_454018 ) ) ( not ( = ?auto_454016 ?auto_454019 ) ) ( not ( = ?auto_454017 ?auto_454018 ) ) ( not ( = ?auto_454017 ?auto_454019 ) ) ( not ( = ?auto_454018 ?auto_454019 ) ) ( ON ?auto_454017 ?auto_454018 ) ( ON ?auto_454016 ?auto_454017 ) ( ON ?auto_454015 ?auto_454016 ) ( ON ?auto_454014 ?auto_454015 ) ( ON ?auto_454013 ?auto_454014 ) ( ON ?auto_454012 ?auto_454013 ) ( CLEAR ?auto_454010 ) ( ON ?auto_454011 ?auto_454012 ) ( CLEAR ?auto_454011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_454004 ?auto_454005 ?auto_454006 ?auto_454007 ?auto_454008 ?auto_454009 ?auto_454010 ?auto_454011 )
      ( MAKE-15PILE ?auto_454004 ?auto_454005 ?auto_454006 ?auto_454007 ?auto_454008 ?auto_454009 ?auto_454010 ?auto_454011 ?auto_454012 ?auto_454013 ?auto_454014 ?auto_454015 ?auto_454016 ?auto_454017 ?auto_454018 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454035 - BLOCK
      ?auto_454036 - BLOCK
      ?auto_454037 - BLOCK
      ?auto_454038 - BLOCK
      ?auto_454039 - BLOCK
      ?auto_454040 - BLOCK
      ?auto_454041 - BLOCK
      ?auto_454042 - BLOCK
      ?auto_454043 - BLOCK
      ?auto_454044 - BLOCK
      ?auto_454045 - BLOCK
      ?auto_454046 - BLOCK
      ?auto_454047 - BLOCK
      ?auto_454048 - BLOCK
      ?auto_454049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454049 ) ( ON-TABLE ?auto_454035 ) ( ON ?auto_454036 ?auto_454035 ) ( ON ?auto_454037 ?auto_454036 ) ( ON ?auto_454038 ?auto_454037 ) ( ON ?auto_454039 ?auto_454038 ) ( ON ?auto_454040 ?auto_454039 ) ( ON ?auto_454041 ?auto_454040 ) ( not ( = ?auto_454035 ?auto_454036 ) ) ( not ( = ?auto_454035 ?auto_454037 ) ) ( not ( = ?auto_454035 ?auto_454038 ) ) ( not ( = ?auto_454035 ?auto_454039 ) ) ( not ( = ?auto_454035 ?auto_454040 ) ) ( not ( = ?auto_454035 ?auto_454041 ) ) ( not ( = ?auto_454035 ?auto_454042 ) ) ( not ( = ?auto_454035 ?auto_454043 ) ) ( not ( = ?auto_454035 ?auto_454044 ) ) ( not ( = ?auto_454035 ?auto_454045 ) ) ( not ( = ?auto_454035 ?auto_454046 ) ) ( not ( = ?auto_454035 ?auto_454047 ) ) ( not ( = ?auto_454035 ?auto_454048 ) ) ( not ( = ?auto_454035 ?auto_454049 ) ) ( not ( = ?auto_454036 ?auto_454037 ) ) ( not ( = ?auto_454036 ?auto_454038 ) ) ( not ( = ?auto_454036 ?auto_454039 ) ) ( not ( = ?auto_454036 ?auto_454040 ) ) ( not ( = ?auto_454036 ?auto_454041 ) ) ( not ( = ?auto_454036 ?auto_454042 ) ) ( not ( = ?auto_454036 ?auto_454043 ) ) ( not ( = ?auto_454036 ?auto_454044 ) ) ( not ( = ?auto_454036 ?auto_454045 ) ) ( not ( = ?auto_454036 ?auto_454046 ) ) ( not ( = ?auto_454036 ?auto_454047 ) ) ( not ( = ?auto_454036 ?auto_454048 ) ) ( not ( = ?auto_454036 ?auto_454049 ) ) ( not ( = ?auto_454037 ?auto_454038 ) ) ( not ( = ?auto_454037 ?auto_454039 ) ) ( not ( = ?auto_454037 ?auto_454040 ) ) ( not ( = ?auto_454037 ?auto_454041 ) ) ( not ( = ?auto_454037 ?auto_454042 ) ) ( not ( = ?auto_454037 ?auto_454043 ) ) ( not ( = ?auto_454037 ?auto_454044 ) ) ( not ( = ?auto_454037 ?auto_454045 ) ) ( not ( = ?auto_454037 ?auto_454046 ) ) ( not ( = ?auto_454037 ?auto_454047 ) ) ( not ( = ?auto_454037 ?auto_454048 ) ) ( not ( = ?auto_454037 ?auto_454049 ) ) ( not ( = ?auto_454038 ?auto_454039 ) ) ( not ( = ?auto_454038 ?auto_454040 ) ) ( not ( = ?auto_454038 ?auto_454041 ) ) ( not ( = ?auto_454038 ?auto_454042 ) ) ( not ( = ?auto_454038 ?auto_454043 ) ) ( not ( = ?auto_454038 ?auto_454044 ) ) ( not ( = ?auto_454038 ?auto_454045 ) ) ( not ( = ?auto_454038 ?auto_454046 ) ) ( not ( = ?auto_454038 ?auto_454047 ) ) ( not ( = ?auto_454038 ?auto_454048 ) ) ( not ( = ?auto_454038 ?auto_454049 ) ) ( not ( = ?auto_454039 ?auto_454040 ) ) ( not ( = ?auto_454039 ?auto_454041 ) ) ( not ( = ?auto_454039 ?auto_454042 ) ) ( not ( = ?auto_454039 ?auto_454043 ) ) ( not ( = ?auto_454039 ?auto_454044 ) ) ( not ( = ?auto_454039 ?auto_454045 ) ) ( not ( = ?auto_454039 ?auto_454046 ) ) ( not ( = ?auto_454039 ?auto_454047 ) ) ( not ( = ?auto_454039 ?auto_454048 ) ) ( not ( = ?auto_454039 ?auto_454049 ) ) ( not ( = ?auto_454040 ?auto_454041 ) ) ( not ( = ?auto_454040 ?auto_454042 ) ) ( not ( = ?auto_454040 ?auto_454043 ) ) ( not ( = ?auto_454040 ?auto_454044 ) ) ( not ( = ?auto_454040 ?auto_454045 ) ) ( not ( = ?auto_454040 ?auto_454046 ) ) ( not ( = ?auto_454040 ?auto_454047 ) ) ( not ( = ?auto_454040 ?auto_454048 ) ) ( not ( = ?auto_454040 ?auto_454049 ) ) ( not ( = ?auto_454041 ?auto_454042 ) ) ( not ( = ?auto_454041 ?auto_454043 ) ) ( not ( = ?auto_454041 ?auto_454044 ) ) ( not ( = ?auto_454041 ?auto_454045 ) ) ( not ( = ?auto_454041 ?auto_454046 ) ) ( not ( = ?auto_454041 ?auto_454047 ) ) ( not ( = ?auto_454041 ?auto_454048 ) ) ( not ( = ?auto_454041 ?auto_454049 ) ) ( not ( = ?auto_454042 ?auto_454043 ) ) ( not ( = ?auto_454042 ?auto_454044 ) ) ( not ( = ?auto_454042 ?auto_454045 ) ) ( not ( = ?auto_454042 ?auto_454046 ) ) ( not ( = ?auto_454042 ?auto_454047 ) ) ( not ( = ?auto_454042 ?auto_454048 ) ) ( not ( = ?auto_454042 ?auto_454049 ) ) ( not ( = ?auto_454043 ?auto_454044 ) ) ( not ( = ?auto_454043 ?auto_454045 ) ) ( not ( = ?auto_454043 ?auto_454046 ) ) ( not ( = ?auto_454043 ?auto_454047 ) ) ( not ( = ?auto_454043 ?auto_454048 ) ) ( not ( = ?auto_454043 ?auto_454049 ) ) ( not ( = ?auto_454044 ?auto_454045 ) ) ( not ( = ?auto_454044 ?auto_454046 ) ) ( not ( = ?auto_454044 ?auto_454047 ) ) ( not ( = ?auto_454044 ?auto_454048 ) ) ( not ( = ?auto_454044 ?auto_454049 ) ) ( not ( = ?auto_454045 ?auto_454046 ) ) ( not ( = ?auto_454045 ?auto_454047 ) ) ( not ( = ?auto_454045 ?auto_454048 ) ) ( not ( = ?auto_454045 ?auto_454049 ) ) ( not ( = ?auto_454046 ?auto_454047 ) ) ( not ( = ?auto_454046 ?auto_454048 ) ) ( not ( = ?auto_454046 ?auto_454049 ) ) ( not ( = ?auto_454047 ?auto_454048 ) ) ( not ( = ?auto_454047 ?auto_454049 ) ) ( not ( = ?auto_454048 ?auto_454049 ) ) ( ON ?auto_454048 ?auto_454049 ) ( ON ?auto_454047 ?auto_454048 ) ( ON ?auto_454046 ?auto_454047 ) ( ON ?auto_454045 ?auto_454046 ) ( ON ?auto_454044 ?auto_454045 ) ( ON ?auto_454043 ?auto_454044 ) ( CLEAR ?auto_454041 ) ( ON ?auto_454042 ?auto_454043 ) ( CLEAR ?auto_454042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_454035 ?auto_454036 ?auto_454037 ?auto_454038 ?auto_454039 ?auto_454040 ?auto_454041 ?auto_454042 )
      ( MAKE-15PILE ?auto_454035 ?auto_454036 ?auto_454037 ?auto_454038 ?auto_454039 ?auto_454040 ?auto_454041 ?auto_454042 ?auto_454043 ?auto_454044 ?auto_454045 ?auto_454046 ?auto_454047 ?auto_454048 ?auto_454049 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454065 - BLOCK
      ?auto_454066 - BLOCK
      ?auto_454067 - BLOCK
      ?auto_454068 - BLOCK
      ?auto_454069 - BLOCK
      ?auto_454070 - BLOCK
      ?auto_454071 - BLOCK
      ?auto_454072 - BLOCK
      ?auto_454073 - BLOCK
      ?auto_454074 - BLOCK
      ?auto_454075 - BLOCK
      ?auto_454076 - BLOCK
      ?auto_454077 - BLOCK
      ?auto_454078 - BLOCK
      ?auto_454079 - BLOCK
    )
    :vars
    (
      ?auto_454080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454079 ?auto_454080 ) ( ON-TABLE ?auto_454065 ) ( ON ?auto_454066 ?auto_454065 ) ( ON ?auto_454067 ?auto_454066 ) ( ON ?auto_454068 ?auto_454067 ) ( ON ?auto_454069 ?auto_454068 ) ( ON ?auto_454070 ?auto_454069 ) ( not ( = ?auto_454065 ?auto_454066 ) ) ( not ( = ?auto_454065 ?auto_454067 ) ) ( not ( = ?auto_454065 ?auto_454068 ) ) ( not ( = ?auto_454065 ?auto_454069 ) ) ( not ( = ?auto_454065 ?auto_454070 ) ) ( not ( = ?auto_454065 ?auto_454071 ) ) ( not ( = ?auto_454065 ?auto_454072 ) ) ( not ( = ?auto_454065 ?auto_454073 ) ) ( not ( = ?auto_454065 ?auto_454074 ) ) ( not ( = ?auto_454065 ?auto_454075 ) ) ( not ( = ?auto_454065 ?auto_454076 ) ) ( not ( = ?auto_454065 ?auto_454077 ) ) ( not ( = ?auto_454065 ?auto_454078 ) ) ( not ( = ?auto_454065 ?auto_454079 ) ) ( not ( = ?auto_454065 ?auto_454080 ) ) ( not ( = ?auto_454066 ?auto_454067 ) ) ( not ( = ?auto_454066 ?auto_454068 ) ) ( not ( = ?auto_454066 ?auto_454069 ) ) ( not ( = ?auto_454066 ?auto_454070 ) ) ( not ( = ?auto_454066 ?auto_454071 ) ) ( not ( = ?auto_454066 ?auto_454072 ) ) ( not ( = ?auto_454066 ?auto_454073 ) ) ( not ( = ?auto_454066 ?auto_454074 ) ) ( not ( = ?auto_454066 ?auto_454075 ) ) ( not ( = ?auto_454066 ?auto_454076 ) ) ( not ( = ?auto_454066 ?auto_454077 ) ) ( not ( = ?auto_454066 ?auto_454078 ) ) ( not ( = ?auto_454066 ?auto_454079 ) ) ( not ( = ?auto_454066 ?auto_454080 ) ) ( not ( = ?auto_454067 ?auto_454068 ) ) ( not ( = ?auto_454067 ?auto_454069 ) ) ( not ( = ?auto_454067 ?auto_454070 ) ) ( not ( = ?auto_454067 ?auto_454071 ) ) ( not ( = ?auto_454067 ?auto_454072 ) ) ( not ( = ?auto_454067 ?auto_454073 ) ) ( not ( = ?auto_454067 ?auto_454074 ) ) ( not ( = ?auto_454067 ?auto_454075 ) ) ( not ( = ?auto_454067 ?auto_454076 ) ) ( not ( = ?auto_454067 ?auto_454077 ) ) ( not ( = ?auto_454067 ?auto_454078 ) ) ( not ( = ?auto_454067 ?auto_454079 ) ) ( not ( = ?auto_454067 ?auto_454080 ) ) ( not ( = ?auto_454068 ?auto_454069 ) ) ( not ( = ?auto_454068 ?auto_454070 ) ) ( not ( = ?auto_454068 ?auto_454071 ) ) ( not ( = ?auto_454068 ?auto_454072 ) ) ( not ( = ?auto_454068 ?auto_454073 ) ) ( not ( = ?auto_454068 ?auto_454074 ) ) ( not ( = ?auto_454068 ?auto_454075 ) ) ( not ( = ?auto_454068 ?auto_454076 ) ) ( not ( = ?auto_454068 ?auto_454077 ) ) ( not ( = ?auto_454068 ?auto_454078 ) ) ( not ( = ?auto_454068 ?auto_454079 ) ) ( not ( = ?auto_454068 ?auto_454080 ) ) ( not ( = ?auto_454069 ?auto_454070 ) ) ( not ( = ?auto_454069 ?auto_454071 ) ) ( not ( = ?auto_454069 ?auto_454072 ) ) ( not ( = ?auto_454069 ?auto_454073 ) ) ( not ( = ?auto_454069 ?auto_454074 ) ) ( not ( = ?auto_454069 ?auto_454075 ) ) ( not ( = ?auto_454069 ?auto_454076 ) ) ( not ( = ?auto_454069 ?auto_454077 ) ) ( not ( = ?auto_454069 ?auto_454078 ) ) ( not ( = ?auto_454069 ?auto_454079 ) ) ( not ( = ?auto_454069 ?auto_454080 ) ) ( not ( = ?auto_454070 ?auto_454071 ) ) ( not ( = ?auto_454070 ?auto_454072 ) ) ( not ( = ?auto_454070 ?auto_454073 ) ) ( not ( = ?auto_454070 ?auto_454074 ) ) ( not ( = ?auto_454070 ?auto_454075 ) ) ( not ( = ?auto_454070 ?auto_454076 ) ) ( not ( = ?auto_454070 ?auto_454077 ) ) ( not ( = ?auto_454070 ?auto_454078 ) ) ( not ( = ?auto_454070 ?auto_454079 ) ) ( not ( = ?auto_454070 ?auto_454080 ) ) ( not ( = ?auto_454071 ?auto_454072 ) ) ( not ( = ?auto_454071 ?auto_454073 ) ) ( not ( = ?auto_454071 ?auto_454074 ) ) ( not ( = ?auto_454071 ?auto_454075 ) ) ( not ( = ?auto_454071 ?auto_454076 ) ) ( not ( = ?auto_454071 ?auto_454077 ) ) ( not ( = ?auto_454071 ?auto_454078 ) ) ( not ( = ?auto_454071 ?auto_454079 ) ) ( not ( = ?auto_454071 ?auto_454080 ) ) ( not ( = ?auto_454072 ?auto_454073 ) ) ( not ( = ?auto_454072 ?auto_454074 ) ) ( not ( = ?auto_454072 ?auto_454075 ) ) ( not ( = ?auto_454072 ?auto_454076 ) ) ( not ( = ?auto_454072 ?auto_454077 ) ) ( not ( = ?auto_454072 ?auto_454078 ) ) ( not ( = ?auto_454072 ?auto_454079 ) ) ( not ( = ?auto_454072 ?auto_454080 ) ) ( not ( = ?auto_454073 ?auto_454074 ) ) ( not ( = ?auto_454073 ?auto_454075 ) ) ( not ( = ?auto_454073 ?auto_454076 ) ) ( not ( = ?auto_454073 ?auto_454077 ) ) ( not ( = ?auto_454073 ?auto_454078 ) ) ( not ( = ?auto_454073 ?auto_454079 ) ) ( not ( = ?auto_454073 ?auto_454080 ) ) ( not ( = ?auto_454074 ?auto_454075 ) ) ( not ( = ?auto_454074 ?auto_454076 ) ) ( not ( = ?auto_454074 ?auto_454077 ) ) ( not ( = ?auto_454074 ?auto_454078 ) ) ( not ( = ?auto_454074 ?auto_454079 ) ) ( not ( = ?auto_454074 ?auto_454080 ) ) ( not ( = ?auto_454075 ?auto_454076 ) ) ( not ( = ?auto_454075 ?auto_454077 ) ) ( not ( = ?auto_454075 ?auto_454078 ) ) ( not ( = ?auto_454075 ?auto_454079 ) ) ( not ( = ?auto_454075 ?auto_454080 ) ) ( not ( = ?auto_454076 ?auto_454077 ) ) ( not ( = ?auto_454076 ?auto_454078 ) ) ( not ( = ?auto_454076 ?auto_454079 ) ) ( not ( = ?auto_454076 ?auto_454080 ) ) ( not ( = ?auto_454077 ?auto_454078 ) ) ( not ( = ?auto_454077 ?auto_454079 ) ) ( not ( = ?auto_454077 ?auto_454080 ) ) ( not ( = ?auto_454078 ?auto_454079 ) ) ( not ( = ?auto_454078 ?auto_454080 ) ) ( not ( = ?auto_454079 ?auto_454080 ) ) ( ON ?auto_454078 ?auto_454079 ) ( ON ?auto_454077 ?auto_454078 ) ( ON ?auto_454076 ?auto_454077 ) ( ON ?auto_454075 ?auto_454076 ) ( ON ?auto_454074 ?auto_454075 ) ( ON ?auto_454073 ?auto_454074 ) ( ON ?auto_454072 ?auto_454073 ) ( CLEAR ?auto_454070 ) ( ON ?auto_454071 ?auto_454072 ) ( CLEAR ?auto_454071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_454065 ?auto_454066 ?auto_454067 ?auto_454068 ?auto_454069 ?auto_454070 ?auto_454071 )
      ( MAKE-15PILE ?auto_454065 ?auto_454066 ?auto_454067 ?auto_454068 ?auto_454069 ?auto_454070 ?auto_454071 ?auto_454072 ?auto_454073 ?auto_454074 ?auto_454075 ?auto_454076 ?auto_454077 ?auto_454078 ?auto_454079 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454096 - BLOCK
      ?auto_454097 - BLOCK
      ?auto_454098 - BLOCK
      ?auto_454099 - BLOCK
      ?auto_454100 - BLOCK
      ?auto_454101 - BLOCK
      ?auto_454102 - BLOCK
      ?auto_454103 - BLOCK
      ?auto_454104 - BLOCK
      ?auto_454105 - BLOCK
      ?auto_454106 - BLOCK
      ?auto_454107 - BLOCK
      ?auto_454108 - BLOCK
      ?auto_454109 - BLOCK
      ?auto_454110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454110 ) ( ON-TABLE ?auto_454096 ) ( ON ?auto_454097 ?auto_454096 ) ( ON ?auto_454098 ?auto_454097 ) ( ON ?auto_454099 ?auto_454098 ) ( ON ?auto_454100 ?auto_454099 ) ( ON ?auto_454101 ?auto_454100 ) ( not ( = ?auto_454096 ?auto_454097 ) ) ( not ( = ?auto_454096 ?auto_454098 ) ) ( not ( = ?auto_454096 ?auto_454099 ) ) ( not ( = ?auto_454096 ?auto_454100 ) ) ( not ( = ?auto_454096 ?auto_454101 ) ) ( not ( = ?auto_454096 ?auto_454102 ) ) ( not ( = ?auto_454096 ?auto_454103 ) ) ( not ( = ?auto_454096 ?auto_454104 ) ) ( not ( = ?auto_454096 ?auto_454105 ) ) ( not ( = ?auto_454096 ?auto_454106 ) ) ( not ( = ?auto_454096 ?auto_454107 ) ) ( not ( = ?auto_454096 ?auto_454108 ) ) ( not ( = ?auto_454096 ?auto_454109 ) ) ( not ( = ?auto_454096 ?auto_454110 ) ) ( not ( = ?auto_454097 ?auto_454098 ) ) ( not ( = ?auto_454097 ?auto_454099 ) ) ( not ( = ?auto_454097 ?auto_454100 ) ) ( not ( = ?auto_454097 ?auto_454101 ) ) ( not ( = ?auto_454097 ?auto_454102 ) ) ( not ( = ?auto_454097 ?auto_454103 ) ) ( not ( = ?auto_454097 ?auto_454104 ) ) ( not ( = ?auto_454097 ?auto_454105 ) ) ( not ( = ?auto_454097 ?auto_454106 ) ) ( not ( = ?auto_454097 ?auto_454107 ) ) ( not ( = ?auto_454097 ?auto_454108 ) ) ( not ( = ?auto_454097 ?auto_454109 ) ) ( not ( = ?auto_454097 ?auto_454110 ) ) ( not ( = ?auto_454098 ?auto_454099 ) ) ( not ( = ?auto_454098 ?auto_454100 ) ) ( not ( = ?auto_454098 ?auto_454101 ) ) ( not ( = ?auto_454098 ?auto_454102 ) ) ( not ( = ?auto_454098 ?auto_454103 ) ) ( not ( = ?auto_454098 ?auto_454104 ) ) ( not ( = ?auto_454098 ?auto_454105 ) ) ( not ( = ?auto_454098 ?auto_454106 ) ) ( not ( = ?auto_454098 ?auto_454107 ) ) ( not ( = ?auto_454098 ?auto_454108 ) ) ( not ( = ?auto_454098 ?auto_454109 ) ) ( not ( = ?auto_454098 ?auto_454110 ) ) ( not ( = ?auto_454099 ?auto_454100 ) ) ( not ( = ?auto_454099 ?auto_454101 ) ) ( not ( = ?auto_454099 ?auto_454102 ) ) ( not ( = ?auto_454099 ?auto_454103 ) ) ( not ( = ?auto_454099 ?auto_454104 ) ) ( not ( = ?auto_454099 ?auto_454105 ) ) ( not ( = ?auto_454099 ?auto_454106 ) ) ( not ( = ?auto_454099 ?auto_454107 ) ) ( not ( = ?auto_454099 ?auto_454108 ) ) ( not ( = ?auto_454099 ?auto_454109 ) ) ( not ( = ?auto_454099 ?auto_454110 ) ) ( not ( = ?auto_454100 ?auto_454101 ) ) ( not ( = ?auto_454100 ?auto_454102 ) ) ( not ( = ?auto_454100 ?auto_454103 ) ) ( not ( = ?auto_454100 ?auto_454104 ) ) ( not ( = ?auto_454100 ?auto_454105 ) ) ( not ( = ?auto_454100 ?auto_454106 ) ) ( not ( = ?auto_454100 ?auto_454107 ) ) ( not ( = ?auto_454100 ?auto_454108 ) ) ( not ( = ?auto_454100 ?auto_454109 ) ) ( not ( = ?auto_454100 ?auto_454110 ) ) ( not ( = ?auto_454101 ?auto_454102 ) ) ( not ( = ?auto_454101 ?auto_454103 ) ) ( not ( = ?auto_454101 ?auto_454104 ) ) ( not ( = ?auto_454101 ?auto_454105 ) ) ( not ( = ?auto_454101 ?auto_454106 ) ) ( not ( = ?auto_454101 ?auto_454107 ) ) ( not ( = ?auto_454101 ?auto_454108 ) ) ( not ( = ?auto_454101 ?auto_454109 ) ) ( not ( = ?auto_454101 ?auto_454110 ) ) ( not ( = ?auto_454102 ?auto_454103 ) ) ( not ( = ?auto_454102 ?auto_454104 ) ) ( not ( = ?auto_454102 ?auto_454105 ) ) ( not ( = ?auto_454102 ?auto_454106 ) ) ( not ( = ?auto_454102 ?auto_454107 ) ) ( not ( = ?auto_454102 ?auto_454108 ) ) ( not ( = ?auto_454102 ?auto_454109 ) ) ( not ( = ?auto_454102 ?auto_454110 ) ) ( not ( = ?auto_454103 ?auto_454104 ) ) ( not ( = ?auto_454103 ?auto_454105 ) ) ( not ( = ?auto_454103 ?auto_454106 ) ) ( not ( = ?auto_454103 ?auto_454107 ) ) ( not ( = ?auto_454103 ?auto_454108 ) ) ( not ( = ?auto_454103 ?auto_454109 ) ) ( not ( = ?auto_454103 ?auto_454110 ) ) ( not ( = ?auto_454104 ?auto_454105 ) ) ( not ( = ?auto_454104 ?auto_454106 ) ) ( not ( = ?auto_454104 ?auto_454107 ) ) ( not ( = ?auto_454104 ?auto_454108 ) ) ( not ( = ?auto_454104 ?auto_454109 ) ) ( not ( = ?auto_454104 ?auto_454110 ) ) ( not ( = ?auto_454105 ?auto_454106 ) ) ( not ( = ?auto_454105 ?auto_454107 ) ) ( not ( = ?auto_454105 ?auto_454108 ) ) ( not ( = ?auto_454105 ?auto_454109 ) ) ( not ( = ?auto_454105 ?auto_454110 ) ) ( not ( = ?auto_454106 ?auto_454107 ) ) ( not ( = ?auto_454106 ?auto_454108 ) ) ( not ( = ?auto_454106 ?auto_454109 ) ) ( not ( = ?auto_454106 ?auto_454110 ) ) ( not ( = ?auto_454107 ?auto_454108 ) ) ( not ( = ?auto_454107 ?auto_454109 ) ) ( not ( = ?auto_454107 ?auto_454110 ) ) ( not ( = ?auto_454108 ?auto_454109 ) ) ( not ( = ?auto_454108 ?auto_454110 ) ) ( not ( = ?auto_454109 ?auto_454110 ) ) ( ON ?auto_454109 ?auto_454110 ) ( ON ?auto_454108 ?auto_454109 ) ( ON ?auto_454107 ?auto_454108 ) ( ON ?auto_454106 ?auto_454107 ) ( ON ?auto_454105 ?auto_454106 ) ( ON ?auto_454104 ?auto_454105 ) ( ON ?auto_454103 ?auto_454104 ) ( CLEAR ?auto_454101 ) ( ON ?auto_454102 ?auto_454103 ) ( CLEAR ?auto_454102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_454096 ?auto_454097 ?auto_454098 ?auto_454099 ?auto_454100 ?auto_454101 ?auto_454102 )
      ( MAKE-15PILE ?auto_454096 ?auto_454097 ?auto_454098 ?auto_454099 ?auto_454100 ?auto_454101 ?auto_454102 ?auto_454103 ?auto_454104 ?auto_454105 ?auto_454106 ?auto_454107 ?auto_454108 ?auto_454109 ?auto_454110 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454126 - BLOCK
      ?auto_454127 - BLOCK
      ?auto_454128 - BLOCK
      ?auto_454129 - BLOCK
      ?auto_454130 - BLOCK
      ?auto_454131 - BLOCK
      ?auto_454132 - BLOCK
      ?auto_454133 - BLOCK
      ?auto_454134 - BLOCK
      ?auto_454135 - BLOCK
      ?auto_454136 - BLOCK
      ?auto_454137 - BLOCK
      ?auto_454138 - BLOCK
      ?auto_454139 - BLOCK
      ?auto_454140 - BLOCK
    )
    :vars
    (
      ?auto_454141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454140 ?auto_454141 ) ( ON-TABLE ?auto_454126 ) ( ON ?auto_454127 ?auto_454126 ) ( ON ?auto_454128 ?auto_454127 ) ( ON ?auto_454129 ?auto_454128 ) ( ON ?auto_454130 ?auto_454129 ) ( not ( = ?auto_454126 ?auto_454127 ) ) ( not ( = ?auto_454126 ?auto_454128 ) ) ( not ( = ?auto_454126 ?auto_454129 ) ) ( not ( = ?auto_454126 ?auto_454130 ) ) ( not ( = ?auto_454126 ?auto_454131 ) ) ( not ( = ?auto_454126 ?auto_454132 ) ) ( not ( = ?auto_454126 ?auto_454133 ) ) ( not ( = ?auto_454126 ?auto_454134 ) ) ( not ( = ?auto_454126 ?auto_454135 ) ) ( not ( = ?auto_454126 ?auto_454136 ) ) ( not ( = ?auto_454126 ?auto_454137 ) ) ( not ( = ?auto_454126 ?auto_454138 ) ) ( not ( = ?auto_454126 ?auto_454139 ) ) ( not ( = ?auto_454126 ?auto_454140 ) ) ( not ( = ?auto_454126 ?auto_454141 ) ) ( not ( = ?auto_454127 ?auto_454128 ) ) ( not ( = ?auto_454127 ?auto_454129 ) ) ( not ( = ?auto_454127 ?auto_454130 ) ) ( not ( = ?auto_454127 ?auto_454131 ) ) ( not ( = ?auto_454127 ?auto_454132 ) ) ( not ( = ?auto_454127 ?auto_454133 ) ) ( not ( = ?auto_454127 ?auto_454134 ) ) ( not ( = ?auto_454127 ?auto_454135 ) ) ( not ( = ?auto_454127 ?auto_454136 ) ) ( not ( = ?auto_454127 ?auto_454137 ) ) ( not ( = ?auto_454127 ?auto_454138 ) ) ( not ( = ?auto_454127 ?auto_454139 ) ) ( not ( = ?auto_454127 ?auto_454140 ) ) ( not ( = ?auto_454127 ?auto_454141 ) ) ( not ( = ?auto_454128 ?auto_454129 ) ) ( not ( = ?auto_454128 ?auto_454130 ) ) ( not ( = ?auto_454128 ?auto_454131 ) ) ( not ( = ?auto_454128 ?auto_454132 ) ) ( not ( = ?auto_454128 ?auto_454133 ) ) ( not ( = ?auto_454128 ?auto_454134 ) ) ( not ( = ?auto_454128 ?auto_454135 ) ) ( not ( = ?auto_454128 ?auto_454136 ) ) ( not ( = ?auto_454128 ?auto_454137 ) ) ( not ( = ?auto_454128 ?auto_454138 ) ) ( not ( = ?auto_454128 ?auto_454139 ) ) ( not ( = ?auto_454128 ?auto_454140 ) ) ( not ( = ?auto_454128 ?auto_454141 ) ) ( not ( = ?auto_454129 ?auto_454130 ) ) ( not ( = ?auto_454129 ?auto_454131 ) ) ( not ( = ?auto_454129 ?auto_454132 ) ) ( not ( = ?auto_454129 ?auto_454133 ) ) ( not ( = ?auto_454129 ?auto_454134 ) ) ( not ( = ?auto_454129 ?auto_454135 ) ) ( not ( = ?auto_454129 ?auto_454136 ) ) ( not ( = ?auto_454129 ?auto_454137 ) ) ( not ( = ?auto_454129 ?auto_454138 ) ) ( not ( = ?auto_454129 ?auto_454139 ) ) ( not ( = ?auto_454129 ?auto_454140 ) ) ( not ( = ?auto_454129 ?auto_454141 ) ) ( not ( = ?auto_454130 ?auto_454131 ) ) ( not ( = ?auto_454130 ?auto_454132 ) ) ( not ( = ?auto_454130 ?auto_454133 ) ) ( not ( = ?auto_454130 ?auto_454134 ) ) ( not ( = ?auto_454130 ?auto_454135 ) ) ( not ( = ?auto_454130 ?auto_454136 ) ) ( not ( = ?auto_454130 ?auto_454137 ) ) ( not ( = ?auto_454130 ?auto_454138 ) ) ( not ( = ?auto_454130 ?auto_454139 ) ) ( not ( = ?auto_454130 ?auto_454140 ) ) ( not ( = ?auto_454130 ?auto_454141 ) ) ( not ( = ?auto_454131 ?auto_454132 ) ) ( not ( = ?auto_454131 ?auto_454133 ) ) ( not ( = ?auto_454131 ?auto_454134 ) ) ( not ( = ?auto_454131 ?auto_454135 ) ) ( not ( = ?auto_454131 ?auto_454136 ) ) ( not ( = ?auto_454131 ?auto_454137 ) ) ( not ( = ?auto_454131 ?auto_454138 ) ) ( not ( = ?auto_454131 ?auto_454139 ) ) ( not ( = ?auto_454131 ?auto_454140 ) ) ( not ( = ?auto_454131 ?auto_454141 ) ) ( not ( = ?auto_454132 ?auto_454133 ) ) ( not ( = ?auto_454132 ?auto_454134 ) ) ( not ( = ?auto_454132 ?auto_454135 ) ) ( not ( = ?auto_454132 ?auto_454136 ) ) ( not ( = ?auto_454132 ?auto_454137 ) ) ( not ( = ?auto_454132 ?auto_454138 ) ) ( not ( = ?auto_454132 ?auto_454139 ) ) ( not ( = ?auto_454132 ?auto_454140 ) ) ( not ( = ?auto_454132 ?auto_454141 ) ) ( not ( = ?auto_454133 ?auto_454134 ) ) ( not ( = ?auto_454133 ?auto_454135 ) ) ( not ( = ?auto_454133 ?auto_454136 ) ) ( not ( = ?auto_454133 ?auto_454137 ) ) ( not ( = ?auto_454133 ?auto_454138 ) ) ( not ( = ?auto_454133 ?auto_454139 ) ) ( not ( = ?auto_454133 ?auto_454140 ) ) ( not ( = ?auto_454133 ?auto_454141 ) ) ( not ( = ?auto_454134 ?auto_454135 ) ) ( not ( = ?auto_454134 ?auto_454136 ) ) ( not ( = ?auto_454134 ?auto_454137 ) ) ( not ( = ?auto_454134 ?auto_454138 ) ) ( not ( = ?auto_454134 ?auto_454139 ) ) ( not ( = ?auto_454134 ?auto_454140 ) ) ( not ( = ?auto_454134 ?auto_454141 ) ) ( not ( = ?auto_454135 ?auto_454136 ) ) ( not ( = ?auto_454135 ?auto_454137 ) ) ( not ( = ?auto_454135 ?auto_454138 ) ) ( not ( = ?auto_454135 ?auto_454139 ) ) ( not ( = ?auto_454135 ?auto_454140 ) ) ( not ( = ?auto_454135 ?auto_454141 ) ) ( not ( = ?auto_454136 ?auto_454137 ) ) ( not ( = ?auto_454136 ?auto_454138 ) ) ( not ( = ?auto_454136 ?auto_454139 ) ) ( not ( = ?auto_454136 ?auto_454140 ) ) ( not ( = ?auto_454136 ?auto_454141 ) ) ( not ( = ?auto_454137 ?auto_454138 ) ) ( not ( = ?auto_454137 ?auto_454139 ) ) ( not ( = ?auto_454137 ?auto_454140 ) ) ( not ( = ?auto_454137 ?auto_454141 ) ) ( not ( = ?auto_454138 ?auto_454139 ) ) ( not ( = ?auto_454138 ?auto_454140 ) ) ( not ( = ?auto_454138 ?auto_454141 ) ) ( not ( = ?auto_454139 ?auto_454140 ) ) ( not ( = ?auto_454139 ?auto_454141 ) ) ( not ( = ?auto_454140 ?auto_454141 ) ) ( ON ?auto_454139 ?auto_454140 ) ( ON ?auto_454138 ?auto_454139 ) ( ON ?auto_454137 ?auto_454138 ) ( ON ?auto_454136 ?auto_454137 ) ( ON ?auto_454135 ?auto_454136 ) ( ON ?auto_454134 ?auto_454135 ) ( ON ?auto_454133 ?auto_454134 ) ( ON ?auto_454132 ?auto_454133 ) ( CLEAR ?auto_454130 ) ( ON ?auto_454131 ?auto_454132 ) ( CLEAR ?auto_454131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_454126 ?auto_454127 ?auto_454128 ?auto_454129 ?auto_454130 ?auto_454131 )
      ( MAKE-15PILE ?auto_454126 ?auto_454127 ?auto_454128 ?auto_454129 ?auto_454130 ?auto_454131 ?auto_454132 ?auto_454133 ?auto_454134 ?auto_454135 ?auto_454136 ?auto_454137 ?auto_454138 ?auto_454139 ?auto_454140 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454157 - BLOCK
      ?auto_454158 - BLOCK
      ?auto_454159 - BLOCK
      ?auto_454160 - BLOCK
      ?auto_454161 - BLOCK
      ?auto_454162 - BLOCK
      ?auto_454163 - BLOCK
      ?auto_454164 - BLOCK
      ?auto_454165 - BLOCK
      ?auto_454166 - BLOCK
      ?auto_454167 - BLOCK
      ?auto_454168 - BLOCK
      ?auto_454169 - BLOCK
      ?auto_454170 - BLOCK
      ?auto_454171 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454171 ) ( ON-TABLE ?auto_454157 ) ( ON ?auto_454158 ?auto_454157 ) ( ON ?auto_454159 ?auto_454158 ) ( ON ?auto_454160 ?auto_454159 ) ( ON ?auto_454161 ?auto_454160 ) ( not ( = ?auto_454157 ?auto_454158 ) ) ( not ( = ?auto_454157 ?auto_454159 ) ) ( not ( = ?auto_454157 ?auto_454160 ) ) ( not ( = ?auto_454157 ?auto_454161 ) ) ( not ( = ?auto_454157 ?auto_454162 ) ) ( not ( = ?auto_454157 ?auto_454163 ) ) ( not ( = ?auto_454157 ?auto_454164 ) ) ( not ( = ?auto_454157 ?auto_454165 ) ) ( not ( = ?auto_454157 ?auto_454166 ) ) ( not ( = ?auto_454157 ?auto_454167 ) ) ( not ( = ?auto_454157 ?auto_454168 ) ) ( not ( = ?auto_454157 ?auto_454169 ) ) ( not ( = ?auto_454157 ?auto_454170 ) ) ( not ( = ?auto_454157 ?auto_454171 ) ) ( not ( = ?auto_454158 ?auto_454159 ) ) ( not ( = ?auto_454158 ?auto_454160 ) ) ( not ( = ?auto_454158 ?auto_454161 ) ) ( not ( = ?auto_454158 ?auto_454162 ) ) ( not ( = ?auto_454158 ?auto_454163 ) ) ( not ( = ?auto_454158 ?auto_454164 ) ) ( not ( = ?auto_454158 ?auto_454165 ) ) ( not ( = ?auto_454158 ?auto_454166 ) ) ( not ( = ?auto_454158 ?auto_454167 ) ) ( not ( = ?auto_454158 ?auto_454168 ) ) ( not ( = ?auto_454158 ?auto_454169 ) ) ( not ( = ?auto_454158 ?auto_454170 ) ) ( not ( = ?auto_454158 ?auto_454171 ) ) ( not ( = ?auto_454159 ?auto_454160 ) ) ( not ( = ?auto_454159 ?auto_454161 ) ) ( not ( = ?auto_454159 ?auto_454162 ) ) ( not ( = ?auto_454159 ?auto_454163 ) ) ( not ( = ?auto_454159 ?auto_454164 ) ) ( not ( = ?auto_454159 ?auto_454165 ) ) ( not ( = ?auto_454159 ?auto_454166 ) ) ( not ( = ?auto_454159 ?auto_454167 ) ) ( not ( = ?auto_454159 ?auto_454168 ) ) ( not ( = ?auto_454159 ?auto_454169 ) ) ( not ( = ?auto_454159 ?auto_454170 ) ) ( not ( = ?auto_454159 ?auto_454171 ) ) ( not ( = ?auto_454160 ?auto_454161 ) ) ( not ( = ?auto_454160 ?auto_454162 ) ) ( not ( = ?auto_454160 ?auto_454163 ) ) ( not ( = ?auto_454160 ?auto_454164 ) ) ( not ( = ?auto_454160 ?auto_454165 ) ) ( not ( = ?auto_454160 ?auto_454166 ) ) ( not ( = ?auto_454160 ?auto_454167 ) ) ( not ( = ?auto_454160 ?auto_454168 ) ) ( not ( = ?auto_454160 ?auto_454169 ) ) ( not ( = ?auto_454160 ?auto_454170 ) ) ( not ( = ?auto_454160 ?auto_454171 ) ) ( not ( = ?auto_454161 ?auto_454162 ) ) ( not ( = ?auto_454161 ?auto_454163 ) ) ( not ( = ?auto_454161 ?auto_454164 ) ) ( not ( = ?auto_454161 ?auto_454165 ) ) ( not ( = ?auto_454161 ?auto_454166 ) ) ( not ( = ?auto_454161 ?auto_454167 ) ) ( not ( = ?auto_454161 ?auto_454168 ) ) ( not ( = ?auto_454161 ?auto_454169 ) ) ( not ( = ?auto_454161 ?auto_454170 ) ) ( not ( = ?auto_454161 ?auto_454171 ) ) ( not ( = ?auto_454162 ?auto_454163 ) ) ( not ( = ?auto_454162 ?auto_454164 ) ) ( not ( = ?auto_454162 ?auto_454165 ) ) ( not ( = ?auto_454162 ?auto_454166 ) ) ( not ( = ?auto_454162 ?auto_454167 ) ) ( not ( = ?auto_454162 ?auto_454168 ) ) ( not ( = ?auto_454162 ?auto_454169 ) ) ( not ( = ?auto_454162 ?auto_454170 ) ) ( not ( = ?auto_454162 ?auto_454171 ) ) ( not ( = ?auto_454163 ?auto_454164 ) ) ( not ( = ?auto_454163 ?auto_454165 ) ) ( not ( = ?auto_454163 ?auto_454166 ) ) ( not ( = ?auto_454163 ?auto_454167 ) ) ( not ( = ?auto_454163 ?auto_454168 ) ) ( not ( = ?auto_454163 ?auto_454169 ) ) ( not ( = ?auto_454163 ?auto_454170 ) ) ( not ( = ?auto_454163 ?auto_454171 ) ) ( not ( = ?auto_454164 ?auto_454165 ) ) ( not ( = ?auto_454164 ?auto_454166 ) ) ( not ( = ?auto_454164 ?auto_454167 ) ) ( not ( = ?auto_454164 ?auto_454168 ) ) ( not ( = ?auto_454164 ?auto_454169 ) ) ( not ( = ?auto_454164 ?auto_454170 ) ) ( not ( = ?auto_454164 ?auto_454171 ) ) ( not ( = ?auto_454165 ?auto_454166 ) ) ( not ( = ?auto_454165 ?auto_454167 ) ) ( not ( = ?auto_454165 ?auto_454168 ) ) ( not ( = ?auto_454165 ?auto_454169 ) ) ( not ( = ?auto_454165 ?auto_454170 ) ) ( not ( = ?auto_454165 ?auto_454171 ) ) ( not ( = ?auto_454166 ?auto_454167 ) ) ( not ( = ?auto_454166 ?auto_454168 ) ) ( not ( = ?auto_454166 ?auto_454169 ) ) ( not ( = ?auto_454166 ?auto_454170 ) ) ( not ( = ?auto_454166 ?auto_454171 ) ) ( not ( = ?auto_454167 ?auto_454168 ) ) ( not ( = ?auto_454167 ?auto_454169 ) ) ( not ( = ?auto_454167 ?auto_454170 ) ) ( not ( = ?auto_454167 ?auto_454171 ) ) ( not ( = ?auto_454168 ?auto_454169 ) ) ( not ( = ?auto_454168 ?auto_454170 ) ) ( not ( = ?auto_454168 ?auto_454171 ) ) ( not ( = ?auto_454169 ?auto_454170 ) ) ( not ( = ?auto_454169 ?auto_454171 ) ) ( not ( = ?auto_454170 ?auto_454171 ) ) ( ON ?auto_454170 ?auto_454171 ) ( ON ?auto_454169 ?auto_454170 ) ( ON ?auto_454168 ?auto_454169 ) ( ON ?auto_454167 ?auto_454168 ) ( ON ?auto_454166 ?auto_454167 ) ( ON ?auto_454165 ?auto_454166 ) ( ON ?auto_454164 ?auto_454165 ) ( ON ?auto_454163 ?auto_454164 ) ( CLEAR ?auto_454161 ) ( ON ?auto_454162 ?auto_454163 ) ( CLEAR ?auto_454162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_454157 ?auto_454158 ?auto_454159 ?auto_454160 ?auto_454161 ?auto_454162 )
      ( MAKE-15PILE ?auto_454157 ?auto_454158 ?auto_454159 ?auto_454160 ?auto_454161 ?auto_454162 ?auto_454163 ?auto_454164 ?auto_454165 ?auto_454166 ?auto_454167 ?auto_454168 ?auto_454169 ?auto_454170 ?auto_454171 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454187 - BLOCK
      ?auto_454188 - BLOCK
      ?auto_454189 - BLOCK
      ?auto_454190 - BLOCK
      ?auto_454191 - BLOCK
      ?auto_454192 - BLOCK
      ?auto_454193 - BLOCK
      ?auto_454194 - BLOCK
      ?auto_454195 - BLOCK
      ?auto_454196 - BLOCK
      ?auto_454197 - BLOCK
      ?auto_454198 - BLOCK
      ?auto_454199 - BLOCK
      ?auto_454200 - BLOCK
      ?auto_454201 - BLOCK
    )
    :vars
    (
      ?auto_454202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454201 ?auto_454202 ) ( ON-TABLE ?auto_454187 ) ( ON ?auto_454188 ?auto_454187 ) ( ON ?auto_454189 ?auto_454188 ) ( ON ?auto_454190 ?auto_454189 ) ( not ( = ?auto_454187 ?auto_454188 ) ) ( not ( = ?auto_454187 ?auto_454189 ) ) ( not ( = ?auto_454187 ?auto_454190 ) ) ( not ( = ?auto_454187 ?auto_454191 ) ) ( not ( = ?auto_454187 ?auto_454192 ) ) ( not ( = ?auto_454187 ?auto_454193 ) ) ( not ( = ?auto_454187 ?auto_454194 ) ) ( not ( = ?auto_454187 ?auto_454195 ) ) ( not ( = ?auto_454187 ?auto_454196 ) ) ( not ( = ?auto_454187 ?auto_454197 ) ) ( not ( = ?auto_454187 ?auto_454198 ) ) ( not ( = ?auto_454187 ?auto_454199 ) ) ( not ( = ?auto_454187 ?auto_454200 ) ) ( not ( = ?auto_454187 ?auto_454201 ) ) ( not ( = ?auto_454187 ?auto_454202 ) ) ( not ( = ?auto_454188 ?auto_454189 ) ) ( not ( = ?auto_454188 ?auto_454190 ) ) ( not ( = ?auto_454188 ?auto_454191 ) ) ( not ( = ?auto_454188 ?auto_454192 ) ) ( not ( = ?auto_454188 ?auto_454193 ) ) ( not ( = ?auto_454188 ?auto_454194 ) ) ( not ( = ?auto_454188 ?auto_454195 ) ) ( not ( = ?auto_454188 ?auto_454196 ) ) ( not ( = ?auto_454188 ?auto_454197 ) ) ( not ( = ?auto_454188 ?auto_454198 ) ) ( not ( = ?auto_454188 ?auto_454199 ) ) ( not ( = ?auto_454188 ?auto_454200 ) ) ( not ( = ?auto_454188 ?auto_454201 ) ) ( not ( = ?auto_454188 ?auto_454202 ) ) ( not ( = ?auto_454189 ?auto_454190 ) ) ( not ( = ?auto_454189 ?auto_454191 ) ) ( not ( = ?auto_454189 ?auto_454192 ) ) ( not ( = ?auto_454189 ?auto_454193 ) ) ( not ( = ?auto_454189 ?auto_454194 ) ) ( not ( = ?auto_454189 ?auto_454195 ) ) ( not ( = ?auto_454189 ?auto_454196 ) ) ( not ( = ?auto_454189 ?auto_454197 ) ) ( not ( = ?auto_454189 ?auto_454198 ) ) ( not ( = ?auto_454189 ?auto_454199 ) ) ( not ( = ?auto_454189 ?auto_454200 ) ) ( not ( = ?auto_454189 ?auto_454201 ) ) ( not ( = ?auto_454189 ?auto_454202 ) ) ( not ( = ?auto_454190 ?auto_454191 ) ) ( not ( = ?auto_454190 ?auto_454192 ) ) ( not ( = ?auto_454190 ?auto_454193 ) ) ( not ( = ?auto_454190 ?auto_454194 ) ) ( not ( = ?auto_454190 ?auto_454195 ) ) ( not ( = ?auto_454190 ?auto_454196 ) ) ( not ( = ?auto_454190 ?auto_454197 ) ) ( not ( = ?auto_454190 ?auto_454198 ) ) ( not ( = ?auto_454190 ?auto_454199 ) ) ( not ( = ?auto_454190 ?auto_454200 ) ) ( not ( = ?auto_454190 ?auto_454201 ) ) ( not ( = ?auto_454190 ?auto_454202 ) ) ( not ( = ?auto_454191 ?auto_454192 ) ) ( not ( = ?auto_454191 ?auto_454193 ) ) ( not ( = ?auto_454191 ?auto_454194 ) ) ( not ( = ?auto_454191 ?auto_454195 ) ) ( not ( = ?auto_454191 ?auto_454196 ) ) ( not ( = ?auto_454191 ?auto_454197 ) ) ( not ( = ?auto_454191 ?auto_454198 ) ) ( not ( = ?auto_454191 ?auto_454199 ) ) ( not ( = ?auto_454191 ?auto_454200 ) ) ( not ( = ?auto_454191 ?auto_454201 ) ) ( not ( = ?auto_454191 ?auto_454202 ) ) ( not ( = ?auto_454192 ?auto_454193 ) ) ( not ( = ?auto_454192 ?auto_454194 ) ) ( not ( = ?auto_454192 ?auto_454195 ) ) ( not ( = ?auto_454192 ?auto_454196 ) ) ( not ( = ?auto_454192 ?auto_454197 ) ) ( not ( = ?auto_454192 ?auto_454198 ) ) ( not ( = ?auto_454192 ?auto_454199 ) ) ( not ( = ?auto_454192 ?auto_454200 ) ) ( not ( = ?auto_454192 ?auto_454201 ) ) ( not ( = ?auto_454192 ?auto_454202 ) ) ( not ( = ?auto_454193 ?auto_454194 ) ) ( not ( = ?auto_454193 ?auto_454195 ) ) ( not ( = ?auto_454193 ?auto_454196 ) ) ( not ( = ?auto_454193 ?auto_454197 ) ) ( not ( = ?auto_454193 ?auto_454198 ) ) ( not ( = ?auto_454193 ?auto_454199 ) ) ( not ( = ?auto_454193 ?auto_454200 ) ) ( not ( = ?auto_454193 ?auto_454201 ) ) ( not ( = ?auto_454193 ?auto_454202 ) ) ( not ( = ?auto_454194 ?auto_454195 ) ) ( not ( = ?auto_454194 ?auto_454196 ) ) ( not ( = ?auto_454194 ?auto_454197 ) ) ( not ( = ?auto_454194 ?auto_454198 ) ) ( not ( = ?auto_454194 ?auto_454199 ) ) ( not ( = ?auto_454194 ?auto_454200 ) ) ( not ( = ?auto_454194 ?auto_454201 ) ) ( not ( = ?auto_454194 ?auto_454202 ) ) ( not ( = ?auto_454195 ?auto_454196 ) ) ( not ( = ?auto_454195 ?auto_454197 ) ) ( not ( = ?auto_454195 ?auto_454198 ) ) ( not ( = ?auto_454195 ?auto_454199 ) ) ( not ( = ?auto_454195 ?auto_454200 ) ) ( not ( = ?auto_454195 ?auto_454201 ) ) ( not ( = ?auto_454195 ?auto_454202 ) ) ( not ( = ?auto_454196 ?auto_454197 ) ) ( not ( = ?auto_454196 ?auto_454198 ) ) ( not ( = ?auto_454196 ?auto_454199 ) ) ( not ( = ?auto_454196 ?auto_454200 ) ) ( not ( = ?auto_454196 ?auto_454201 ) ) ( not ( = ?auto_454196 ?auto_454202 ) ) ( not ( = ?auto_454197 ?auto_454198 ) ) ( not ( = ?auto_454197 ?auto_454199 ) ) ( not ( = ?auto_454197 ?auto_454200 ) ) ( not ( = ?auto_454197 ?auto_454201 ) ) ( not ( = ?auto_454197 ?auto_454202 ) ) ( not ( = ?auto_454198 ?auto_454199 ) ) ( not ( = ?auto_454198 ?auto_454200 ) ) ( not ( = ?auto_454198 ?auto_454201 ) ) ( not ( = ?auto_454198 ?auto_454202 ) ) ( not ( = ?auto_454199 ?auto_454200 ) ) ( not ( = ?auto_454199 ?auto_454201 ) ) ( not ( = ?auto_454199 ?auto_454202 ) ) ( not ( = ?auto_454200 ?auto_454201 ) ) ( not ( = ?auto_454200 ?auto_454202 ) ) ( not ( = ?auto_454201 ?auto_454202 ) ) ( ON ?auto_454200 ?auto_454201 ) ( ON ?auto_454199 ?auto_454200 ) ( ON ?auto_454198 ?auto_454199 ) ( ON ?auto_454197 ?auto_454198 ) ( ON ?auto_454196 ?auto_454197 ) ( ON ?auto_454195 ?auto_454196 ) ( ON ?auto_454194 ?auto_454195 ) ( ON ?auto_454193 ?auto_454194 ) ( ON ?auto_454192 ?auto_454193 ) ( CLEAR ?auto_454190 ) ( ON ?auto_454191 ?auto_454192 ) ( CLEAR ?auto_454191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_454187 ?auto_454188 ?auto_454189 ?auto_454190 ?auto_454191 )
      ( MAKE-15PILE ?auto_454187 ?auto_454188 ?auto_454189 ?auto_454190 ?auto_454191 ?auto_454192 ?auto_454193 ?auto_454194 ?auto_454195 ?auto_454196 ?auto_454197 ?auto_454198 ?auto_454199 ?auto_454200 ?auto_454201 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454218 - BLOCK
      ?auto_454219 - BLOCK
      ?auto_454220 - BLOCK
      ?auto_454221 - BLOCK
      ?auto_454222 - BLOCK
      ?auto_454223 - BLOCK
      ?auto_454224 - BLOCK
      ?auto_454225 - BLOCK
      ?auto_454226 - BLOCK
      ?auto_454227 - BLOCK
      ?auto_454228 - BLOCK
      ?auto_454229 - BLOCK
      ?auto_454230 - BLOCK
      ?auto_454231 - BLOCK
      ?auto_454232 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454232 ) ( ON-TABLE ?auto_454218 ) ( ON ?auto_454219 ?auto_454218 ) ( ON ?auto_454220 ?auto_454219 ) ( ON ?auto_454221 ?auto_454220 ) ( not ( = ?auto_454218 ?auto_454219 ) ) ( not ( = ?auto_454218 ?auto_454220 ) ) ( not ( = ?auto_454218 ?auto_454221 ) ) ( not ( = ?auto_454218 ?auto_454222 ) ) ( not ( = ?auto_454218 ?auto_454223 ) ) ( not ( = ?auto_454218 ?auto_454224 ) ) ( not ( = ?auto_454218 ?auto_454225 ) ) ( not ( = ?auto_454218 ?auto_454226 ) ) ( not ( = ?auto_454218 ?auto_454227 ) ) ( not ( = ?auto_454218 ?auto_454228 ) ) ( not ( = ?auto_454218 ?auto_454229 ) ) ( not ( = ?auto_454218 ?auto_454230 ) ) ( not ( = ?auto_454218 ?auto_454231 ) ) ( not ( = ?auto_454218 ?auto_454232 ) ) ( not ( = ?auto_454219 ?auto_454220 ) ) ( not ( = ?auto_454219 ?auto_454221 ) ) ( not ( = ?auto_454219 ?auto_454222 ) ) ( not ( = ?auto_454219 ?auto_454223 ) ) ( not ( = ?auto_454219 ?auto_454224 ) ) ( not ( = ?auto_454219 ?auto_454225 ) ) ( not ( = ?auto_454219 ?auto_454226 ) ) ( not ( = ?auto_454219 ?auto_454227 ) ) ( not ( = ?auto_454219 ?auto_454228 ) ) ( not ( = ?auto_454219 ?auto_454229 ) ) ( not ( = ?auto_454219 ?auto_454230 ) ) ( not ( = ?auto_454219 ?auto_454231 ) ) ( not ( = ?auto_454219 ?auto_454232 ) ) ( not ( = ?auto_454220 ?auto_454221 ) ) ( not ( = ?auto_454220 ?auto_454222 ) ) ( not ( = ?auto_454220 ?auto_454223 ) ) ( not ( = ?auto_454220 ?auto_454224 ) ) ( not ( = ?auto_454220 ?auto_454225 ) ) ( not ( = ?auto_454220 ?auto_454226 ) ) ( not ( = ?auto_454220 ?auto_454227 ) ) ( not ( = ?auto_454220 ?auto_454228 ) ) ( not ( = ?auto_454220 ?auto_454229 ) ) ( not ( = ?auto_454220 ?auto_454230 ) ) ( not ( = ?auto_454220 ?auto_454231 ) ) ( not ( = ?auto_454220 ?auto_454232 ) ) ( not ( = ?auto_454221 ?auto_454222 ) ) ( not ( = ?auto_454221 ?auto_454223 ) ) ( not ( = ?auto_454221 ?auto_454224 ) ) ( not ( = ?auto_454221 ?auto_454225 ) ) ( not ( = ?auto_454221 ?auto_454226 ) ) ( not ( = ?auto_454221 ?auto_454227 ) ) ( not ( = ?auto_454221 ?auto_454228 ) ) ( not ( = ?auto_454221 ?auto_454229 ) ) ( not ( = ?auto_454221 ?auto_454230 ) ) ( not ( = ?auto_454221 ?auto_454231 ) ) ( not ( = ?auto_454221 ?auto_454232 ) ) ( not ( = ?auto_454222 ?auto_454223 ) ) ( not ( = ?auto_454222 ?auto_454224 ) ) ( not ( = ?auto_454222 ?auto_454225 ) ) ( not ( = ?auto_454222 ?auto_454226 ) ) ( not ( = ?auto_454222 ?auto_454227 ) ) ( not ( = ?auto_454222 ?auto_454228 ) ) ( not ( = ?auto_454222 ?auto_454229 ) ) ( not ( = ?auto_454222 ?auto_454230 ) ) ( not ( = ?auto_454222 ?auto_454231 ) ) ( not ( = ?auto_454222 ?auto_454232 ) ) ( not ( = ?auto_454223 ?auto_454224 ) ) ( not ( = ?auto_454223 ?auto_454225 ) ) ( not ( = ?auto_454223 ?auto_454226 ) ) ( not ( = ?auto_454223 ?auto_454227 ) ) ( not ( = ?auto_454223 ?auto_454228 ) ) ( not ( = ?auto_454223 ?auto_454229 ) ) ( not ( = ?auto_454223 ?auto_454230 ) ) ( not ( = ?auto_454223 ?auto_454231 ) ) ( not ( = ?auto_454223 ?auto_454232 ) ) ( not ( = ?auto_454224 ?auto_454225 ) ) ( not ( = ?auto_454224 ?auto_454226 ) ) ( not ( = ?auto_454224 ?auto_454227 ) ) ( not ( = ?auto_454224 ?auto_454228 ) ) ( not ( = ?auto_454224 ?auto_454229 ) ) ( not ( = ?auto_454224 ?auto_454230 ) ) ( not ( = ?auto_454224 ?auto_454231 ) ) ( not ( = ?auto_454224 ?auto_454232 ) ) ( not ( = ?auto_454225 ?auto_454226 ) ) ( not ( = ?auto_454225 ?auto_454227 ) ) ( not ( = ?auto_454225 ?auto_454228 ) ) ( not ( = ?auto_454225 ?auto_454229 ) ) ( not ( = ?auto_454225 ?auto_454230 ) ) ( not ( = ?auto_454225 ?auto_454231 ) ) ( not ( = ?auto_454225 ?auto_454232 ) ) ( not ( = ?auto_454226 ?auto_454227 ) ) ( not ( = ?auto_454226 ?auto_454228 ) ) ( not ( = ?auto_454226 ?auto_454229 ) ) ( not ( = ?auto_454226 ?auto_454230 ) ) ( not ( = ?auto_454226 ?auto_454231 ) ) ( not ( = ?auto_454226 ?auto_454232 ) ) ( not ( = ?auto_454227 ?auto_454228 ) ) ( not ( = ?auto_454227 ?auto_454229 ) ) ( not ( = ?auto_454227 ?auto_454230 ) ) ( not ( = ?auto_454227 ?auto_454231 ) ) ( not ( = ?auto_454227 ?auto_454232 ) ) ( not ( = ?auto_454228 ?auto_454229 ) ) ( not ( = ?auto_454228 ?auto_454230 ) ) ( not ( = ?auto_454228 ?auto_454231 ) ) ( not ( = ?auto_454228 ?auto_454232 ) ) ( not ( = ?auto_454229 ?auto_454230 ) ) ( not ( = ?auto_454229 ?auto_454231 ) ) ( not ( = ?auto_454229 ?auto_454232 ) ) ( not ( = ?auto_454230 ?auto_454231 ) ) ( not ( = ?auto_454230 ?auto_454232 ) ) ( not ( = ?auto_454231 ?auto_454232 ) ) ( ON ?auto_454231 ?auto_454232 ) ( ON ?auto_454230 ?auto_454231 ) ( ON ?auto_454229 ?auto_454230 ) ( ON ?auto_454228 ?auto_454229 ) ( ON ?auto_454227 ?auto_454228 ) ( ON ?auto_454226 ?auto_454227 ) ( ON ?auto_454225 ?auto_454226 ) ( ON ?auto_454224 ?auto_454225 ) ( ON ?auto_454223 ?auto_454224 ) ( CLEAR ?auto_454221 ) ( ON ?auto_454222 ?auto_454223 ) ( CLEAR ?auto_454222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_454218 ?auto_454219 ?auto_454220 ?auto_454221 ?auto_454222 )
      ( MAKE-15PILE ?auto_454218 ?auto_454219 ?auto_454220 ?auto_454221 ?auto_454222 ?auto_454223 ?auto_454224 ?auto_454225 ?auto_454226 ?auto_454227 ?auto_454228 ?auto_454229 ?auto_454230 ?auto_454231 ?auto_454232 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454248 - BLOCK
      ?auto_454249 - BLOCK
      ?auto_454250 - BLOCK
      ?auto_454251 - BLOCK
      ?auto_454252 - BLOCK
      ?auto_454253 - BLOCK
      ?auto_454254 - BLOCK
      ?auto_454255 - BLOCK
      ?auto_454256 - BLOCK
      ?auto_454257 - BLOCK
      ?auto_454258 - BLOCK
      ?auto_454259 - BLOCK
      ?auto_454260 - BLOCK
      ?auto_454261 - BLOCK
      ?auto_454262 - BLOCK
    )
    :vars
    (
      ?auto_454263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454262 ?auto_454263 ) ( ON-TABLE ?auto_454248 ) ( ON ?auto_454249 ?auto_454248 ) ( ON ?auto_454250 ?auto_454249 ) ( not ( = ?auto_454248 ?auto_454249 ) ) ( not ( = ?auto_454248 ?auto_454250 ) ) ( not ( = ?auto_454248 ?auto_454251 ) ) ( not ( = ?auto_454248 ?auto_454252 ) ) ( not ( = ?auto_454248 ?auto_454253 ) ) ( not ( = ?auto_454248 ?auto_454254 ) ) ( not ( = ?auto_454248 ?auto_454255 ) ) ( not ( = ?auto_454248 ?auto_454256 ) ) ( not ( = ?auto_454248 ?auto_454257 ) ) ( not ( = ?auto_454248 ?auto_454258 ) ) ( not ( = ?auto_454248 ?auto_454259 ) ) ( not ( = ?auto_454248 ?auto_454260 ) ) ( not ( = ?auto_454248 ?auto_454261 ) ) ( not ( = ?auto_454248 ?auto_454262 ) ) ( not ( = ?auto_454248 ?auto_454263 ) ) ( not ( = ?auto_454249 ?auto_454250 ) ) ( not ( = ?auto_454249 ?auto_454251 ) ) ( not ( = ?auto_454249 ?auto_454252 ) ) ( not ( = ?auto_454249 ?auto_454253 ) ) ( not ( = ?auto_454249 ?auto_454254 ) ) ( not ( = ?auto_454249 ?auto_454255 ) ) ( not ( = ?auto_454249 ?auto_454256 ) ) ( not ( = ?auto_454249 ?auto_454257 ) ) ( not ( = ?auto_454249 ?auto_454258 ) ) ( not ( = ?auto_454249 ?auto_454259 ) ) ( not ( = ?auto_454249 ?auto_454260 ) ) ( not ( = ?auto_454249 ?auto_454261 ) ) ( not ( = ?auto_454249 ?auto_454262 ) ) ( not ( = ?auto_454249 ?auto_454263 ) ) ( not ( = ?auto_454250 ?auto_454251 ) ) ( not ( = ?auto_454250 ?auto_454252 ) ) ( not ( = ?auto_454250 ?auto_454253 ) ) ( not ( = ?auto_454250 ?auto_454254 ) ) ( not ( = ?auto_454250 ?auto_454255 ) ) ( not ( = ?auto_454250 ?auto_454256 ) ) ( not ( = ?auto_454250 ?auto_454257 ) ) ( not ( = ?auto_454250 ?auto_454258 ) ) ( not ( = ?auto_454250 ?auto_454259 ) ) ( not ( = ?auto_454250 ?auto_454260 ) ) ( not ( = ?auto_454250 ?auto_454261 ) ) ( not ( = ?auto_454250 ?auto_454262 ) ) ( not ( = ?auto_454250 ?auto_454263 ) ) ( not ( = ?auto_454251 ?auto_454252 ) ) ( not ( = ?auto_454251 ?auto_454253 ) ) ( not ( = ?auto_454251 ?auto_454254 ) ) ( not ( = ?auto_454251 ?auto_454255 ) ) ( not ( = ?auto_454251 ?auto_454256 ) ) ( not ( = ?auto_454251 ?auto_454257 ) ) ( not ( = ?auto_454251 ?auto_454258 ) ) ( not ( = ?auto_454251 ?auto_454259 ) ) ( not ( = ?auto_454251 ?auto_454260 ) ) ( not ( = ?auto_454251 ?auto_454261 ) ) ( not ( = ?auto_454251 ?auto_454262 ) ) ( not ( = ?auto_454251 ?auto_454263 ) ) ( not ( = ?auto_454252 ?auto_454253 ) ) ( not ( = ?auto_454252 ?auto_454254 ) ) ( not ( = ?auto_454252 ?auto_454255 ) ) ( not ( = ?auto_454252 ?auto_454256 ) ) ( not ( = ?auto_454252 ?auto_454257 ) ) ( not ( = ?auto_454252 ?auto_454258 ) ) ( not ( = ?auto_454252 ?auto_454259 ) ) ( not ( = ?auto_454252 ?auto_454260 ) ) ( not ( = ?auto_454252 ?auto_454261 ) ) ( not ( = ?auto_454252 ?auto_454262 ) ) ( not ( = ?auto_454252 ?auto_454263 ) ) ( not ( = ?auto_454253 ?auto_454254 ) ) ( not ( = ?auto_454253 ?auto_454255 ) ) ( not ( = ?auto_454253 ?auto_454256 ) ) ( not ( = ?auto_454253 ?auto_454257 ) ) ( not ( = ?auto_454253 ?auto_454258 ) ) ( not ( = ?auto_454253 ?auto_454259 ) ) ( not ( = ?auto_454253 ?auto_454260 ) ) ( not ( = ?auto_454253 ?auto_454261 ) ) ( not ( = ?auto_454253 ?auto_454262 ) ) ( not ( = ?auto_454253 ?auto_454263 ) ) ( not ( = ?auto_454254 ?auto_454255 ) ) ( not ( = ?auto_454254 ?auto_454256 ) ) ( not ( = ?auto_454254 ?auto_454257 ) ) ( not ( = ?auto_454254 ?auto_454258 ) ) ( not ( = ?auto_454254 ?auto_454259 ) ) ( not ( = ?auto_454254 ?auto_454260 ) ) ( not ( = ?auto_454254 ?auto_454261 ) ) ( not ( = ?auto_454254 ?auto_454262 ) ) ( not ( = ?auto_454254 ?auto_454263 ) ) ( not ( = ?auto_454255 ?auto_454256 ) ) ( not ( = ?auto_454255 ?auto_454257 ) ) ( not ( = ?auto_454255 ?auto_454258 ) ) ( not ( = ?auto_454255 ?auto_454259 ) ) ( not ( = ?auto_454255 ?auto_454260 ) ) ( not ( = ?auto_454255 ?auto_454261 ) ) ( not ( = ?auto_454255 ?auto_454262 ) ) ( not ( = ?auto_454255 ?auto_454263 ) ) ( not ( = ?auto_454256 ?auto_454257 ) ) ( not ( = ?auto_454256 ?auto_454258 ) ) ( not ( = ?auto_454256 ?auto_454259 ) ) ( not ( = ?auto_454256 ?auto_454260 ) ) ( not ( = ?auto_454256 ?auto_454261 ) ) ( not ( = ?auto_454256 ?auto_454262 ) ) ( not ( = ?auto_454256 ?auto_454263 ) ) ( not ( = ?auto_454257 ?auto_454258 ) ) ( not ( = ?auto_454257 ?auto_454259 ) ) ( not ( = ?auto_454257 ?auto_454260 ) ) ( not ( = ?auto_454257 ?auto_454261 ) ) ( not ( = ?auto_454257 ?auto_454262 ) ) ( not ( = ?auto_454257 ?auto_454263 ) ) ( not ( = ?auto_454258 ?auto_454259 ) ) ( not ( = ?auto_454258 ?auto_454260 ) ) ( not ( = ?auto_454258 ?auto_454261 ) ) ( not ( = ?auto_454258 ?auto_454262 ) ) ( not ( = ?auto_454258 ?auto_454263 ) ) ( not ( = ?auto_454259 ?auto_454260 ) ) ( not ( = ?auto_454259 ?auto_454261 ) ) ( not ( = ?auto_454259 ?auto_454262 ) ) ( not ( = ?auto_454259 ?auto_454263 ) ) ( not ( = ?auto_454260 ?auto_454261 ) ) ( not ( = ?auto_454260 ?auto_454262 ) ) ( not ( = ?auto_454260 ?auto_454263 ) ) ( not ( = ?auto_454261 ?auto_454262 ) ) ( not ( = ?auto_454261 ?auto_454263 ) ) ( not ( = ?auto_454262 ?auto_454263 ) ) ( ON ?auto_454261 ?auto_454262 ) ( ON ?auto_454260 ?auto_454261 ) ( ON ?auto_454259 ?auto_454260 ) ( ON ?auto_454258 ?auto_454259 ) ( ON ?auto_454257 ?auto_454258 ) ( ON ?auto_454256 ?auto_454257 ) ( ON ?auto_454255 ?auto_454256 ) ( ON ?auto_454254 ?auto_454255 ) ( ON ?auto_454253 ?auto_454254 ) ( ON ?auto_454252 ?auto_454253 ) ( CLEAR ?auto_454250 ) ( ON ?auto_454251 ?auto_454252 ) ( CLEAR ?auto_454251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_454248 ?auto_454249 ?auto_454250 ?auto_454251 )
      ( MAKE-15PILE ?auto_454248 ?auto_454249 ?auto_454250 ?auto_454251 ?auto_454252 ?auto_454253 ?auto_454254 ?auto_454255 ?auto_454256 ?auto_454257 ?auto_454258 ?auto_454259 ?auto_454260 ?auto_454261 ?auto_454262 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454279 - BLOCK
      ?auto_454280 - BLOCK
      ?auto_454281 - BLOCK
      ?auto_454282 - BLOCK
      ?auto_454283 - BLOCK
      ?auto_454284 - BLOCK
      ?auto_454285 - BLOCK
      ?auto_454286 - BLOCK
      ?auto_454287 - BLOCK
      ?auto_454288 - BLOCK
      ?auto_454289 - BLOCK
      ?auto_454290 - BLOCK
      ?auto_454291 - BLOCK
      ?auto_454292 - BLOCK
      ?auto_454293 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454293 ) ( ON-TABLE ?auto_454279 ) ( ON ?auto_454280 ?auto_454279 ) ( ON ?auto_454281 ?auto_454280 ) ( not ( = ?auto_454279 ?auto_454280 ) ) ( not ( = ?auto_454279 ?auto_454281 ) ) ( not ( = ?auto_454279 ?auto_454282 ) ) ( not ( = ?auto_454279 ?auto_454283 ) ) ( not ( = ?auto_454279 ?auto_454284 ) ) ( not ( = ?auto_454279 ?auto_454285 ) ) ( not ( = ?auto_454279 ?auto_454286 ) ) ( not ( = ?auto_454279 ?auto_454287 ) ) ( not ( = ?auto_454279 ?auto_454288 ) ) ( not ( = ?auto_454279 ?auto_454289 ) ) ( not ( = ?auto_454279 ?auto_454290 ) ) ( not ( = ?auto_454279 ?auto_454291 ) ) ( not ( = ?auto_454279 ?auto_454292 ) ) ( not ( = ?auto_454279 ?auto_454293 ) ) ( not ( = ?auto_454280 ?auto_454281 ) ) ( not ( = ?auto_454280 ?auto_454282 ) ) ( not ( = ?auto_454280 ?auto_454283 ) ) ( not ( = ?auto_454280 ?auto_454284 ) ) ( not ( = ?auto_454280 ?auto_454285 ) ) ( not ( = ?auto_454280 ?auto_454286 ) ) ( not ( = ?auto_454280 ?auto_454287 ) ) ( not ( = ?auto_454280 ?auto_454288 ) ) ( not ( = ?auto_454280 ?auto_454289 ) ) ( not ( = ?auto_454280 ?auto_454290 ) ) ( not ( = ?auto_454280 ?auto_454291 ) ) ( not ( = ?auto_454280 ?auto_454292 ) ) ( not ( = ?auto_454280 ?auto_454293 ) ) ( not ( = ?auto_454281 ?auto_454282 ) ) ( not ( = ?auto_454281 ?auto_454283 ) ) ( not ( = ?auto_454281 ?auto_454284 ) ) ( not ( = ?auto_454281 ?auto_454285 ) ) ( not ( = ?auto_454281 ?auto_454286 ) ) ( not ( = ?auto_454281 ?auto_454287 ) ) ( not ( = ?auto_454281 ?auto_454288 ) ) ( not ( = ?auto_454281 ?auto_454289 ) ) ( not ( = ?auto_454281 ?auto_454290 ) ) ( not ( = ?auto_454281 ?auto_454291 ) ) ( not ( = ?auto_454281 ?auto_454292 ) ) ( not ( = ?auto_454281 ?auto_454293 ) ) ( not ( = ?auto_454282 ?auto_454283 ) ) ( not ( = ?auto_454282 ?auto_454284 ) ) ( not ( = ?auto_454282 ?auto_454285 ) ) ( not ( = ?auto_454282 ?auto_454286 ) ) ( not ( = ?auto_454282 ?auto_454287 ) ) ( not ( = ?auto_454282 ?auto_454288 ) ) ( not ( = ?auto_454282 ?auto_454289 ) ) ( not ( = ?auto_454282 ?auto_454290 ) ) ( not ( = ?auto_454282 ?auto_454291 ) ) ( not ( = ?auto_454282 ?auto_454292 ) ) ( not ( = ?auto_454282 ?auto_454293 ) ) ( not ( = ?auto_454283 ?auto_454284 ) ) ( not ( = ?auto_454283 ?auto_454285 ) ) ( not ( = ?auto_454283 ?auto_454286 ) ) ( not ( = ?auto_454283 ?auto_454287 ) ) ( not ( = ?auto_454283 ?auto_454288 ) ) ( not ( = ?auto_454283 ?auto_454289 ) ) ( not ( = ?auto_454283 ?auto_454290 ) ) ( not ( = ?auto_454283 ?auto_454291 ) ) ( not ( = ?auto_454283 ?auto_454292 ) ) ( not ( = ?auto_454283 ?auto_454293 ) ) ( not ( = ?auto_454284 ?auto_454285 ) ) ( not ( = ?auto_454284 ?auto_454286 ) ) ( not ( = ?auto_454284 ?auto_454287 ) ) ( not ( = ?auto_454284 ?auto_454288 ) ) ( not ( = ?auto_454284 ?auto_454289 ) ) ( not ( = ?auto_454284 ?auto_454290 ) ) ( not ( = ?auto_454284 ?auto_454291 ) ) ( not ( = ?auto_454284 ?auto_454292 ) ) ( not ( = ?auto_454284 ?auto_454293 ) ) ( not ( = ?auto_454285 ?auto_454286 ) ) ( not ( = ?auto_454285 ?auto_454287 ) ) ( not ( = ?auto_454285 ?auto_454288 ) ) ( not ( = ?auto_454285 ?auto_454289 ) ) ( not ( = ?auto_454285 ?auto_454290 ) ) ( not ( = ?auto_454285 ?auto_454291 ) ) ( not ( = ?auto_454285 ?auto_454292 ) ) ( not ( = ?auto_454285 ?auto_454293 ) ) ( not ( = ?auto_454286 ?auto_454287 ) ) ( not ( = ?auto_454286 ?auto_454288 ) ) ( not ( = ?auto_454286 ?auto_454289 ) ) ( not ( = ?auto_454286 ?auto_454290 ) ) ( not ( = ?auto_454286 ?auto_454291 ) ) ( not ( = ?auto_454286 ?auto_454292 ) ) ( not ( = ?auto_454286 ?auto_454293 ) ) ( not ( = ?auto_454287 ?auto_454288 ) ) ( not ( = ?auto_454287 ?auto_454289 ) ) ( not ( = ?auto_454287 ?auto_454290 ) ) ( not ( = ?auto_454287 ?auto_454291 ) ) ( not ( = ?auto_454287 ?auto_454292 ) ) ( not ( = ?auto_454287 ?auto_454293 ) ) ( not ( = ?auto_454288 ?auto_454289 ) ) ( not ( = ?auto_454288 ?auto_454290 ) ) ( not ( = ?auto_454288 ?auto_454291 ) ) ( not ( = ?auto_454288 ?auto_454292 ) ) ( not ( = ?auto_454288 ?auto_454293 ) ) ( not ( = ?auto_454289 ?auto_454290 ) ) ( not ( = ?auto_454289 ?auto_454291 ) ) ( not ( = ?auto_454289 ?auto_454292 ) ) ( not ( = ?auto_454289 ?auto_454293 ) ) ( not ( = ?auto_454290 ?auto_454291 ) ) ( not ( = ?auto_454290 ?auto_454292 ) ) ( not ( = ?auto_454290 ?auto_454293 ) ) ( not ( = ?auto_454291 ?auto_454292 ) ) ( not ( = ?auto_454291 ?auto_454293 ) ) ( not ( = ?auto_454292 ?auto_454293 ) ) ( ON ?auto_454292 ?auto_454293 ) ( ON ?auto_454291 ?auto_454292 ) ( ON ?auto_454290 ?auto_454291 ) ( ON ?auto_454289 ?auto_454290 ) ( ON ?auto_454288 ?auto_454289 ) ( ON ?auto_454287 ?auto_454288 ) ( ON ?auto_454286 ?auto_454287 ) ( ON ?auto_454285 ?auto_454286 ) ( ON ?auto_454284 ?auto_454285 ) ( ON ?auto_454283 ?auto_454284 ) ( CLEAR ?auto_454281 ) ( ON ?auto_454282 ?auto_454283 ) ( CLEAR ?auto_454282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_454279 ?auto_454280 ?auto_454281 ?auto_454282 )
      ( MAKE-15PILE ?auto_454279 ?auto_454280 ?auto_454281 ?auto_454282 ?auto_454283 ?auto_454284 ?auto_454285 ?auto_454286 ?auto_454287 ?auto_454288 ?auto_454289 ?auto_454290 ?auto_454291 ?auto_454292 ?auto_454293 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454309 - BLOCK
      ?auto_454310 - BLOCK
      ?auto_454311 - BLOCK
      ?auto_454312 - BLOCK
      ?auto_454313 - BLOCK
      ?auto_454314 - BLOCK
      ?auto_454315 - BLOCK
      ?auto_454316 - BLOCK
      ?auto_454317 - BLOCK
      ?auto_454318 - BLOCK
      ?auto_454319 - BLOCK
      ?auto_454320 - BLOCK
      ?auto_454321 - BLOCK
      ?auto_454322 - BLOCK
      ?auto_454323 - BLOCK
    )
    :vars
    (
      ?auto_454324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454323 ?auto_454324 ) ( ON-TABLE ?auto_454309 ) ( ON ?auto_454310 ?auto_454309 ) ( not ( = ?auto_454309 ?auto_454310 ) ) ( not ( = ?auto_454309 ?auto_454311 ) ) ( not ( = ?auto_454309 ?auto_454312 ) ) ( not ( = ?auto_454309 ?auto_454313 ) ) ( not ( = ?auto_454309 ?auto_454314 ) ) ( not ( = ?auto_454309 ?auto_454315 ) ) ( not ( = ?auto_454309 ?auto_454316 ) ) ( not ( = ?auto_454309 ?auto_454317 ) ) ( not ( = ?auto_454309 ?auto_454318 ) ) ( not ( = ?auto_454309 ?auto_454319 ) ) ( not ( = ?auto_454309 ?auto_454320 ) ) ( not ( = ?auto_454309 ?auto_454321 ) ) ( not ( = ?auto_454309 ?auto_454322 ) ) ( not ( = ?auto_454309 ?auto_454323 ) ) ( not ( = ?auto_454309 ?auto_454324 ) ) ( not ( = ?auto_454310 ?auto_454311 ) ) ( not ( = ?auto_454310 ?auto_454312 ) ) ( not ( = ?auto_454310 ?auto_454313 ) ) ( not ( = ?auto_454310 ?auto_454314 ) ) ( not ( = ?auto_454310 ?auto_454315 ) ) ( not ( = ?auto_454310 ?auto_454316 ) ) ( not ( = ?auto_454310 ?auto_454317 ) ) ( not ( = ?auto_454310 ?auto_454318 ) ) ( not ( = ?auto_454310 ?auto_454319 ) ) ( not ( = ?auto_454310 ?auto_454320 ) ) ( not ( = ?auto_454310 ?auto_454321 ) ) ( not ( = ?auto_454310 ?auto_454322 ) ) ( not ( = ?auto_454310 ?auto_454323 ) ) ( not ( = ?auto_454310 ?auto_454324 ) ) ( not ( = ?auto_454311 ?auto_454312 ) ) ( not ( = ?auto_454311 ?auto_454313 ) ) ( not ( = ?auto_454311 ?auto_454314 ) ) ( not ( = ?auto_454311 ?auto_454315 ) ) ( not ( = ?auto_454311 ?auto_454316 ) ) ( not ( = ?auto_454311 ?auto_454317 ) ) ( not ( = ?auto_454311 ?auto_454318 ) ) ( not ( = ?auto_454311 ?auto_454319 ) ) ( not ( = ?auto_454311 ?auto_454320 ) ) ( not ( = ?auto_454311 ?auto_454321 ) ) ( not ( = ?auto_454311 ?auto_454322 ) ) ( not ( = ?auto_454311 ?auto_454323 ) ) ( not ( = ?auto_454311 ?auto_454324 ) ) ( not ( = ?auto_454312 ?auto_454313 ) ) ( not ( = ?auto_454312 ?auto_454314 ) ) ( not ( = ?auto_454312 ?auto_454315 ) ) ( not ( = ?auto_454312 ?auto_454316 ) ) ( not ( = ?auto_454312 ?auto_454317 ) ) ( not ( = ?auto_454312 ?auto_454318 ) ) ( not ( = ?auto_454312 ?auto_454319 ) ) ( not ( = ?auto_454312 ?auto_454320 ) ) ( not ( = ?auto_454312 ?auto_454321 ) ) ( not ( = ?auto_454312 ?auto_454322 ) ) ( not ( = ?auto_454312 ?auto_454323 ) ) ( not ( = ?auto_454312 ?auto_454324 ) ) ( not ( = ?auto_454313 ?auto_454314 ) ) ( not ( = ?auto_454313 ?auto_454315 ) ) ( not ( = ?auto_454313 ?auto_454316 ) ) ( not ( = ?auto_454313 ?auto_454317 ) ) ( not ( = ?auto_454313 ?auto_454318 ) ) ( not ( = ?auto_454313 ?auto_454319 ) ) ( not ( = ?auto_454313 ?auto_454320 ) ) ( not ( = ?auto_454313 ?auto_454321 ) ) ( not ( = ?auto_454313 ?auto_454322 ) ) ( not ( = ?auto_454313 ?auto_454323 ) ) ( not ( = ?auto_454313 ?auto_454324 ) ) ( not ( = ?auto_454314 ?auto_454315 ) ) ( not ( = ?auto_454314 ?auto_454316 ) ) ( not ( = ?auto_454314 ?auto_454317 ) ) ( not ( = ?auto_454314 ?auto_454318 ) ) ( not ( = ?auto_454314 ?auto_454319 ) ) ( not ( = ?auto_454314 ?auto_454320 ) ) ( not ( = ?auto_454314 ?auto_454321 ) ) ( not ( = ?auto_454314 ?auto_454322 ) ) ( not ( = ?auto_454314 ?auto_454323 ) ) ( not ( = ?auto_454314 ?auto_454324 ) ) ( not ( = ?auto_454315 ?auto_454316 ) ) ( not ( = ?auto_454315 ?auto_454317 ) ) ( not ( = ?auto_454315 ?auto_454318 ) ) ( not ( = ?auto_454315 ?auto_454319 ) ) ( not ( = ?auto_454315 ?auto_454320 ) ) ( not ( = ?auto_454315 ?auto_454321 ) ) ( not ( = ?auto_454315 ?auto_454322 ) ) ( not ( = ?auto_454315 ?auto_454323 ) ) ( not ( = ?auto_454315 ?auto_454324 ) ) ( not ( = ?auto_454316 ?auto_454317 ) ) ( not ( = ?auto_454316 ?auto_454318 ) ) ( not ( = ?auto_454316 ?auto_454319 ) ) ( not ( = ?auto_454316 ?auto_454320 ) ) ( not ( = ?auto_454316 ?auto_454321 ) ) ( not ( = ?auto_454316 ?auto_454322 ) ) ( not ( = ?auto_454316 ?auto_454323 ) ) ( not ( = ?auto_454316 ?auto_454324 ) ) ( not ( = ?auto_454317 ?auto_454318 ) ) ( not ( = ?auto_454317 ?auto_454319 ) ) ( not ( = ?auto_454317 ?auto_454320 ) ) ( not ( = ?auto_454317 ?auto_454321 ) ) ( not ( = ?auto_454317 ?auto_454322 ) ) ( not ( = ?auto_454317 ?auto_454323 ) ) ( not ( = ?auto_454317 ?auto_454324 ) ) ( not ( = ?auto_454318 ?auto_454319 ) ) ( not ( = ?auto_454318 ?auto_454320 ) ) ( not ( = ?auto_454318 ?auto_454321 ) ) ( not ( = ?auto_454318 ?auto_454322 ) ) ( not ( = ?auto_454318 ?auto_454323 ) ) ( not ( = ?auto_454318 ?auto_454324 ) ) ( not ( = ?auto_454319 ?auto_454320 ) ) ( not ( = ?auto_454319 ?auto_454321 ) ) ( not ( = ?auto_454319 ?auto_454322 ) ) ( not ( = ?auto_454319 ?auto_454323 ) ) ( not ( = ?auto_454319 ?auto_454324 ) ) ( not ( = ?auto_454320 ?auto_454321 ) ) ( not ( = ?auto_454320 ?auto_454322 ) ) ( not ( = ?auto_454320 ?auto_454323 ) ) ( not ( = ?auto_454320 ?auto_454324 ) ) ( not ( = ?auto_454321 ?auto_454322 ) ) ( not ( = ?auto_454321 ?auto_454323 ) ) ( not ( = ?auto_454321 ?auto_454324 ) ) ( not ( = ?auto_454322 ?auto_454323 ) ) ( not ( = ?auto_454322 ?auto_454324 ) ) ( not ( = ?auto_454323 ?auto_454324 ) ) ( ON ?auto_454322 ?auto_454323 ) ( ON ?auto_454321 ?auto_454322 ) ( ON ?auto_454320 ?auto_454321 ) ( ON ?auto_454319 ?auto_454320 ) ( ON ?auto_454318 ?auto_454319 ) ( ON ?auto_454317 ?auto_454318 ) ( ON ?auto_454316 ?auto_454317 ) ( ON ?auto_454315 ?auto_454316 ) ( ON ?auto_454314 ?auto_454315 ) ( ON ?auto_454313 ?auto_454314 ) ( ON ?auto_454312 ?auto_454313 ) ( CLEAR ?auto_454310 ) ( ON ?auto_454311 ?auto_454312 ) ( CLEAR ?auto_454311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_454309 ?auto_454310 ?auto_454311 )
      ( MAKE-15PILE ?auto_454309 ?auto_454310 ?auto_454311 ?auto_454312 ?auto_454313 ?auto_454314 ?auto_454315 ?auto_454316 ?auto_454317 ?auto_454318 ?auto_454319 ?auto_454320 ?auto_454321 ?auto_454322 ?auto_454323 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454340 - BLOCK
      ?auto_454341 - BLOCK
      ?auto_454342 - BLOCK
      ?auto_454343 - BLOCK
      ?auto_454344 - BLOCK
      ?auto_454345 - BLOCK
      ?auto_454346 - BLOCK
      ?auto_454347 - BLOCK
      ?auto_454348 - BLOCK
      ?auto_454349 - BLOCK
      ?auto_454350 - BLOCK
      ?auto_454351 - BLOCK
      ?auto_454352 - BLOCK
      ?auto_454353 - BLOCK
      ?auto_454354 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454354 ) ( ON-TABLE ?auto_454340 ) ( ON ?auto_454341 ?auto_454340 ) ( not ( = ?auto_454340 ?auto_454341 ) ) ( not ( = ?auto_454340 ?auto_454342 ) ) ( not ( = ?auto_454340 ?auto_454343 ) ) ( not ( = ?auto_454340 ?auto_454344 ) ) ( not ( = ?auto_454340 ?auto_454345 ) ) ( not ( = ?auto_454340 ?auto_454346 ) ) ( not ( = ?auto_454340 ?auto_454347 ) ) ( not ( = ?auto_454340 ?auto_454348 ) ) ( not ( = ?auto_454340 ?auto_454349 ) ) ( not ( = ?auto_454340 ?auto_454350 ) ) ( not ( = ?auto_454340 ?auto_454351 ) ) ( not ( = ?auto_454340 ?auto_454352 ) ) ( not ( = ?auto_454340 ?auto_454353 ) ) ( not ( = ?auto_454340 ?auto_454354 ) ) ( not ( = ?auto_454341 ?auto_454342 ) ) ( not ( = ?auto_454341 ?auto_454343 ) ) ( not ( = ?auto_454341 ?auto_454344 ) ) ( not ( = ?auto_454341 ?auto_454345 ) ) ( not ( = ?auto_454341 ?auto_454346 ) ) ( not ( = ?auto_454341 ?auto_454347 ) ) ( not ( = ?auto_454341 ?auto_454348 ) ) ( not ( = ?auto_454341 ?auto_454349 ) ) ( not ( = ?auto_454341 ?auto_454350 ) ) ( not ( = ?auto_454341 ?auto_454351 ) ) ( not ( = ?auto_454341 ?auto_454352 ) ) ( not ( = ?auto_454341 ?auto_454353 ) ) ( not ( = ?auto_454341 ?auto_454354 ) ) ( not ( = ?auto_454342 ?auto_454343 ) ) ( not ( = ?auto_454342 ?auto_454344 ) ) ( not ( = ?auto_454342 ?auto_454345 ) ) ( not ( = ?auto_454342 ?auto_454346 ) ) ( not ( = ?auto_454342 ?auto_454347 ) ) ( not ( = ?auto_454342 ?auto_454348 ) ) ( not ( = ?auto_454342 ?auto_454349 ) ) ( not ( = ?auto_454342 ?auto_454350 ) ) ( not ( = ?auto_454342 ?auto_454351 ) ) ( not ( = ?auto_454342 ?auto_454352 ) ) ( not ( = ?auto_454342 ?auto_454353 ) ) ( not ( = ?auto_454342 ?auto_454354 ) ) ( not ( = ?auto_454343 ?auto_454344 ) ) ( not ( = ?auto_454343 ?auto_454345 ) ) ( not ( = ?auto_454343 ?auto_454346 ) ) ( not ( = ?auto_454343 ?auto_454347 ) ) ( not ( = ?auto_454343 ?auto_454348 ) ) ( not ( = ?auto_454343 ?auto_454349 ) ) ( not ( = ?auto_454343 ?auto_454350 ) ) ( not ( = ?auto_454343 ?auto_454351 ) ) ( not ( = ?auto_454343 ?auto_454352 ) ) ( not ( = ?auto_454343 ?auto_454353 ) ) ( not ( = ?auto_454343 ?auto_454354 ) ) ( not ( = ?auto_454344 ?auto_454345 ) ) ( not ( = ?auto_454344 ?auto_454346 ) ) ( not ( = ?auto_454344 ?auto_454347 ) ) ( not ( = ?auto_454344 ?auto_454348 ) ) ( not ( = ?auto_454344 ?auto_454349 ) ) ( not ( = ?auto_454344 ?auto_454350 ) ) ( not ( = ?auto_454344 ?auto_454351 ) ) ( not ( = ?auto_454344 ?auto_454352 ) ) ( not ( = ?auto_454344 ?auto_454353 ) ) ( not ( = ?auto_454344 ?auto_454354 ) ) ( not ( = ?auto_454345 ?auto_454346 ) ) ( not ( = ?auto_454345 ?auto_454347 ) ) ( not ( = ?auto_454345 ?auto_454348 ) ) ( not ( = ?auto_454345 ?auto_454349 ) ) ( not ( = ?auto_454345 ?auto_454350 ) ) ( not ( = ?auto_454345 ?auto_454351 ) ) ( not ( = ?auto_454345 ?auto_454352 ) ) ( not ( = ?auto_454345 ?auto_454353 ) ) ( not ( = ?auto_454345 ?auto_454354 ) ) ( not ( = ?auto_454346 ?auto_454347 ) ) ( not ( = ?auto_454346 ?auto_454348 ) ) ( not ( = ?auto_454346 ?auto_454349 ) ) ( not ( = ?auto_454346 ?auto_454350 ) ) ( not ( = ?auto_454346 ?auto_454351 ) ) ( not ( = ?auto_454346 ?auto_454352 ) ) ( not ( = ?auto_454346 ?auto_454353 ) ) ( not ( = ?auto_454346 ?auto_454354 ) ) ( not ( = ?auto_454347 ?auto_454348 ) ) ( not ( = ?auto_454347 ?auto_454349 ) ) ( not ( = ?auto_454347 ?auto_454350 ) ) ( not ( = ?auto_454347 ?auto_454351 ) ) ( not ( = ?auto_454347 ?auto_454352 ) ) ( not ( = ?auto_454347 ?auto_454353 ) ) ( not ( = ?auto_454347 ?auto_454354 ) ) ( not ( = ?auto_454348 ?auto_454349 ) ) ( not ( = ?auto_454348 ?auto_454350 ) ) ( not ( = ?auto_454348 ?auto_454351 ) ) ( not ( = ?auto_454348 ?auto_454352 ) ) ( not ( = ?auto_454348 ?auto_454353 ) ) ( not ( = ?auto_454348 ?auto_454354 ) ) ( not ( = ?auto_454349 ?auto_454350 ) ) ( not ( = ?auto_454349 ?auto_454351 ) ) ( not ( = ?auto_454349 ?auto_454352 ) ) ( not ( = ?auto_454349 ?auto_454353 ) ) ( not ( = ?auto_454349 ?auto_454354 ) ) ( not ( = ?auto_454350 ?auto_454351 ) ) ( not ( = ?auto_454350 ?auto_454352 ) ) ( not ( = ?auto_454350 ?auto_454353 ) ) ( not ( = ?auto_454350 ?auto_454354 ) ) ( not ( = ?auto_454351 ?auto_454352 ) ) ( not ( = ?auto_454351 ?auto_454353 ) ) ( not ( = ?auto_454351 ?auto_454354 ) ) ( not ( = ?auto_454352 ?auto_454353 ) ) ( not ( = ?auto_454352 ?auto_454354 ) ) ( not ( = ?auto_454353 ?auto_454354 ) ) ( ON ?auto_454353 ?auto_454354 ) ( ON ?auto_454352 ?auto_454353 ) ( ON ?auto_454351 ?auto_454352 ) ( ON ?auto_454350 ?auto_454351 ) ( ON ?auto_454349 ?auto_454350 ) ( ON ?auto_454348 ?auto_454349 ) ( ON ?auto_454347 ?auto_454348 ) ( ON ?auto_454346 ?auto_454347 ) ( ON ?auto_454345 ?auto_454346 ) ( ON ?auto_454344 ?auto_454345 ) ( ON ?auto_454343 ?auto_454344 ) ( CLEAR ?auto_454341 ) ( ON ?auto_454342 ?auto_454343 ) ( CLEAR ?auto_454342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_454340 ?auto_454341 ?auto_454342 )
      ( MAKE-15PILE ?auto_454340 ?auto_454341 ?auto_454342 ?auto_454343 ?auto_454344 ?auto_454345 ?auto_454346 ?auto_454347 ?auto_454348 ?auto_454349 ?auto_454350 ?auto_454351 ?auto_454352 ?auto_454353 ?auto_454354 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454370 - BLOCK
      ?auto_454371 - BLOCK
      ?auto_454372 - BLOCK
      ?auto_454373 - BLOCK
      ?auto_454374 - BLOCK
      ?auto_454375 - BLOCK
      ?auto_454376 - BLOCK
      ?auto_454377 - BLOCK
      ?auto_454378 - BLOCK
      ?auto_454379 - BLOCK
      ?auto_454380 - BLOCK
      ?auto_454381 - BLOCK
      ?auto_454382 - BLOCK
      ?auto_454383 - BLOCK
      ?auto_454384 - BLOCK
    )
    :vars
    (
      ?auto_454385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454384 ?auto_454385 ) ( ON-TABLE ?auto_454370 ) ( not ( = ?auto_454370 ?auto_454371 ) ) ( not ( = ?auto_454370 ?auto_454372 ) ) ( not ( = ?auto_454370 ?auto_454373 ) ) ( not ( = ?auto_454370 ?auto_454374 ) ) ( not ( = ?auto_454370 ?auto_454375 ) ) ( not ( = ?auto_454370 ?auto_454376 ) ) ( not ( = ?auto_454370 ?auto_454377 ) ) ( not ( = ?auto_454370 ?auto_454378 ) ) ( not ( = ?auto_454370 ?auto_454379 ) ) ( not ( = ?auto_454370 ?auto_454380 ) ) ( not ( = ?auto_454370 ?auto_454381 ) ) ( not ( = ?auto_454370 ?auto_454382 ) ) ( not ( = ?auto_454370 ?auto_454383 ) ) ( not ( = ?auto_454370 ?auto_454384 ) ) ( not ( = ?auto_454370 ?auto_454385 ) ) ( not ( = ?auto_454371 ?auto_454372 ) ) ( not ( = ?auto_454371 ?auto_454373 ) ) ( not ( = ?auto_454371 ?auto_454374 ) ) ( not ( = ?auto_454371 ?auto_454375 ) ) ( not ( = ?auto_454371 ?auto_454376 ) ) ( not ( = ?auto_454371 ?auto_454377 ) ) ( not ( = ?auto_454371 ?auto_454378 ) ) ( not ( = ?auto_454371 ?auto_454379 ) ) ( not ( = ?auto_454371 ?auto_454380 ) ) ( not ( = ?auto_454371 ?auto_454381 ) ) ( not ( = ?auto_454371 ?auto_454382 ) ) ( not ( = ?auto_454371 ?auto_454383 ) ) ( not ( = ?auto_454371 ?auto_454384 ) ) ( not ( = ?auto_454371 ?auto_454385 ) ) ( not ( = ?auto_454372 ?auto_454373 ) ) ( not ( = ?auto_454372 ?auto_454374 ) ) ( not ( = ?auto_454372 ?auto_454375 ) ) ( not ( = ?auto_454372 ?auto_454376 ) ) ( not ( = ?auto_454372 ?auto_454377 ) ) ( not ( = ?auto_454372 ?auto_454378 ) ) ( not ( = ?auto_454372 ?auto_454379 ) ) ( not ( = ?auto_454372 ?auto_454380 ) ) ( not ( = ?auto_454372 ?auto_454381 ) ) ( not ( = ?auto_454372 ?auto_454382 ) ) ( not ( = ?auto_454372 ?auto_454383 ) ) ( not ( = ?auto_454372 ?auto_454384 ) ) ( not ( = ?auto_454372 ?auto_454385 ) ) ( not ( = ?auto_454373 ?auto_454374 ) ) ( not ( = ?auto_454373 ?auto_454375 ) ) ( not ( = ?auto_454373 ?auto_454376 ) ) ( not ( = ?auto_454373 ?auto_454377 ) ) ( not ( = ?auto_454373 ?auto_454378 ) ) ( not ( = ?auto_454373 ?auto_454379 ) ) ( not ( = ?auto_454373 ?auto_454380 ) ) ( not ( = ?auto_454373 ?auto_454381 ) ) ( not ( = ?auto_454373 ?auto_454382 ) ) ( not ( = ?auto_454373 ?auto_454383 ) ) ( not ( = ?auto_454373 ?auto_454384 ) ) ( not ( = ?auto_454373 ?auto_454385 ) ) ( not ( = ?auto_454374 ?auto_454375 ) ) ( not ( = ?auto_454374 ?auto_454376 ) ) ( not ( = ?auto_454374 ?auto_454377 ) ) ( not ( = ?auto_454374 ?auto_454378 ) ) ( not ( = ?auto_454374 ?auto_454379 ) ) ( not ( = ?auto_454374 ?auto_454380 ) ) ( not ( = ?auto_454374 ?auto_454381 ) ) ( not ( = ?auto_454374 ?auto_454382 ) ) ( not ( = ?auto_454374 ?auto_454383 ) ) ( not ( = ?auto_454374 ?auto_454384 ) ) ( not ( = ?auto_454374 ?auto_454385 ) ) ( not ( = ?auto_454375 ?auto_454376 ) ) ( not ( = ?auto_454375 ?auto_454377 ) ) ( not ( = ?auto_454375 ?auto_454378 ) ) ( not ( = ?auto_454375 ?auto_454379 ) ) ( not ( = ?auto_454375 ?auto_454380 ) ) ( not ( = ?auto_454375 ?auto_454381 ) ) ( not ( = ?auto_454375 ?auto_454382 ) ) ( not ( = ?auto_454375 ?auto_454383 ) ) ( not ( = ?auto_454375 ?auto_454384 ) ) ( not ( = ?auto_454375 ?auto_454385 ) ) ( not ( = ?auto_454376 ?auto_454377 ) ) ( not ( = ?auto_454376 ?auto_454378 ) ) ( not ( = ?auto_454376 ?auto_454379 ) ) ( not ( = ?auto_454376 ?auto_454380 ) ) ( not ( = ?auto_454376 ?auto_454381 ) ) ( not ( = ?auto_454376 ?auto_454382 ) ) ( not ( = ?auto_454376 ?auto_454383 ) ) ( not ( = ?auto_454376 ?auto_454384 ) ) ( not ( = ?auto_454376 ?auto_454385 ) ) ( not ( = ?auto_454377 ?auto_454378 ) ) ( not ( = ?auto_454377 ?auto_454379 ) ) ( not ( = ?auto_454377 ?auto_454380 ) ) ( not ( = ?auto_454377 ?auto_454381 ) ) ( not ( = ?auto_454377 ?auto_454382 ) ) ( not ( = ?auto_454377 ?auto_454383 ) ) ( not ( = ?auto_454377 ?auto_454384 ) ) ( not ( = ?auto_454377 ?auto_454385 ) ) ( not ( = ?auto_454378 ?auto_454379 ) ) ( not ( = ?auto_454378 ?auto_454380 ) ) ( not ( = ?auto_454378 ?auto_454381 ) ) ( not ( = ?auto_454378 ?auto_454382 ) ) ( not ( = ?auto_454378 ?auto_454383 ) ) ( not ( = ?auto_454378 ?auto_454384 ) ) ( not ( = ?auto_454378 ?auto_454385 ) ) ( not ( = ?auto_454379 ?auto_454380 ) ) ( not ( = ?auto_454379 ?auto_454381 ) ) ( not ( = ?auto_454379 ?auto_454382 ) ) ( not ( = ?auto_454379 ?auto_454383 ) ) ( not ( = ?auto_454379 ?auto_454384 ) ) ( not ( = ?auto_454379 ?auto_454385 ) ) ( not ( = ?auto_454380 ?auto_454381 ) ) ( not ( = ?auto_454380 ?auto_454382 ) ) ( not ( = ?auto_454380 ?auto_454383 ) ) ( not ( = ?auto_454380 ?auto_454384 ) ) ( not ( = ?auto_454380 ?auto_454385 ) ) ( not ( = ?auto_454381 ?auto_454382 ) ) ( not ( = ?auto_454381 ?auto_454383 ) ) ( not ( = ?auto_454381 ?auto_454384 ) ) ( not ( = ?auto_454381 ?auto_454385 ) ) ( not ( = ?auto_454382 ?auto_454383 ) ) ( not ( = ?auto_454382 ?auto_454384 ) ) ( not ( = ?auto_454382 ?auto_454385 ) ) ( not ( = ?auto_454383 ?auto_454384 ) ) ( not ( = ?auto_454383 ?auto_454385 ) ) ( not ( = ?auto_454384 ?auto_454385 ) ) ( ON ?auto_454383 ?auto_454384 ) ( ON ?auto_454382 ?auto_454383 ) ( ON ?auto_454381 ?auto_454382 ) ( ON ?auto_454380 ?auto_454381 ) ( ON ?auto_454379 ?auto_454380 ) ( ON ?auto_454378 ?auto_454379 ) ( ON ?auto_454377 ?auto_454378 ) ( ON ?auto_454376 ?auto_454377 ) ( ON ?auto_454375 ?auto_454376 ) ( ON ?auto_454374 ?auto_454375 ) ( ON ?auto_454373 ?auto_454374 ) ( ON ?auto_454372 ?auto_454373 ) ( CLEAR ?auto_454370 ) ( ON ?auto_454371 ?auto_454372 ) ( CLEAR ?auto_454371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454370 ?auto_454371 )
      ( MAKE-15PILE ?auto_454370 ?auto_454371 ?auto_454372 ?auto_454373 ?auto_454374 ?auto_454375 ?auto_454376 ?auto_454377 ?auto_454378 ?auto_454379 ?auto_454380 ?auto_454381 ?auto_454382 ?auto_454383 ?auto_454384 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454401 - BLOCK
      ?auto_454402 - BLOCK
      ?auto_454403 - BLOCK
      ?auto_454404 - BLOCK
      ?auto_454405 - BLOCK
      ?auto_454406 - BLOCK
      ?auto_454407 - BLOCK
      ?auto_454408 - BLOCK
      ?auto_454409 - BLOCK
      ?auto_454410 - BLOCK
      ?auto_454411 - BLOCK
      ?auto_454412 - BLOCK
      ?auto_454413 - BLOCK
      ?auto_454414 - BLOCK
      ?auto_454415 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454415 ) ( ON-TABLE ?auto_454401 ) ( not ( = ?auto_454401 ?auto_454402 ) ) ( not ( = ?auto_454401 ?auto_454403 ) ) ( not ( = ?auto_454401 ?auto_454404 ) ) ( not ( = ?auto_454401 ?auto_454405 ) ) ( not ( = ?auto_454401 ?auto_454406 ) ) ( not ( = ?auto_454401 ?auto_454407 ) ) ( not ( = ?auto_454401 ?auto_454408 ) ) ( not ( = ?auto_454401 ?auto_454409 ) ) ( not ( = ?auto_454401 ?auto_454410 ) ) ( not ( = ?auto_454401 ?auto_454411 ) ) ( not ( = ?auto_454401 ?auto_454412 ) ) ( not ( = ?auto_454401 ?auto_454413 ) ) ( not ( = ?auto_454401 ?auto_454414 ) ) ( not ( = ?auto_454401 ?auto_454415 ) ) ( not ( = ?auto_454402 ?auto_454403 ) ) ( not ( = ?auto_454402 ?auto_454404 ) ) ( not ( = ?auto_454402 ?auto_454405 ) ) ( not ( = ?auto_454402 ?auto_454406 ) ) ( not ( = ?auto_454402 ?auto_454407 ) ) ( not ( = ?auto_454402 ?auto_454408 ) ) ( not ( = ?auto_454402 ?auto_454409 ) ) ( not ( = ?auto_454402 ?auto_454410 ) ) ( not ( = ?auto_454402 ?auto_454411 ) ) ( not ( = ?auto_454402 ?auto_454412 ) ) ( not ( = ?auto_454402 ?auto_454413 ) ) ( not ( = ?auto_454402 ?auto_454414 ) ) ( not ( = ?auto_454402 ?auto_454415 ) ) ( not ( = ?auto_454403 ?auto_454404 ) ) ( not ( = ?auto_454403 ?auto_454405 ) ) ( not ( = ?auto_454403 ?auto_454406 ) ) ( not ( = ?auto_454403 ?auto_454407 ) ) ( not ( = ?auto_454403 ?auto_454408 ) ) ( not ( = ?auto_454403 ?auto_454409 ) ) ( not ( = ?auto_454403 ?auto_454410 ) ) ( not ( = ?auto_454403 ?auto_454411 ) ) ( not ( = ?auto_454403 ?auto_454412 ) ) ( not ( = ?auto_454403 ?auto_454413 ) ) ( not ( = ?auto_454403 ?auto_454414 ) ) ( not ( = ?auto_454403 ?auto_454415 ) ) ( not ( = ?auto_454404 ?auto_454405 ) ) ( not ( = ?auto_454404 ?auto_454406 ) ) ( not ( = ?auto_454404 ?auto_454407 ) ) ( not ( = ?auto_454404 ?auto_454408 ) ) ( not ( = ?auto_454404 ?auto_454409 ) ) ( not ( = ?auto_454404 ?auto_454410 ) ) ( not ( = ?auto_454404 ?auto_454411 ) ) ( not ( = ?auto_454404 ?auto_454412 ) ) ( not ( = ?auto_454404 ?auto_454413 ) ) ( not ( = ?auto_454404 ?auto_454414 ) ) ( not ( = ?auto_454404 ?auto_454415 ) ) ( not ( = ?auto_454405 ?auto_454406 ) ) ( not ( = ?auto_454405 ?auto_454407 ) ) ( not ( = ?auto_454405 ?auto_454408 ) ) ( not ( = ?auto_454405 ?auto_454409 ) ) ( not ( = ?auto_454405 ?auto_454410 ) ) ( not ( = ?auto_454405 ?auto_454411 ) ) ( not ( = ?auto_454405 ?auto_454412 ) ) ( not ( = ?auto_454405 ?auto_454413 ) ) ( not ( = ?auto_454405 ?auto_454414 ) ) ( not ( = ?auto_454405 ?auto_454415 ) ) ( not ( = ?auto_454406 ?auto_454407 ) ) ( not ( = ?auto_454406 ?auto_454408 ) ) ( not ( = ?auto_454406 ?auto_454409 ) ) ( not ( = ?auto_454406 ?auto_454410 ) ) ( not ( = ?auto_454406 ?auto_454411 ) ) ( not ( = ?auto_454406 ?auto_454412 ) ) ( not ( = ?auto_454406 ?auto_454413 ) ) ( not ( = ?auto_454406 ?auto_454414 ) ) ( not ( = ?auto_454406 ?auto_454415 ) ) ( not ( = ?auto_454407 ?auto_454408 ) ) ( not ( = ?auto_454407 ?auto_454409 ) ) ( not ( = ?auto_454407 ?auto_454410 ) ) ( not ( = ?auto_454407 ?auto_454411 ) ) ( not ( = ?auto_454407 ?auto_454412 ) ) ( not ( = ?auto_454407 ?auto_454413 ) ) ( not ( = ?auto_454407 ?auto_454414 ) ) ( not ( = ?auto_454407 ?auto_454415 ) ) ( not ( = ?auto_454408 ?auto_454409 ) ) ( not ( = ?auto_454408 ?auto_454410 ) ) ( not ( = ?auto_454408 ?auto_454411 ) ) ( not ( = ?auto_454408 ?auto_454412 ) ) ( not ( = ?auto_454408 ?auto_454413 ) ) ( not ( = ?auto_454408 ?auto_454414 ) ) ( not ( = ?auto_454408 ?auto_454415 ) ) ( not ( = ?auto_454409 ?auto_454410 ) ) ( not ( = ?auto_454409 ?auto_454411 ) ) ( not ( = ?auto_454409 ?auto_454412 ) ) ( not ( = ?auto_454409 ?auto_454413 ) ) ( not ( = ?auto_454409 ?auto_454414 ) ) ( not ( = ?auto_454409 ?auto_454415 ) ) ( not ( = ?auto_454410 ?auto_454411 ) ) ( not ( = ?auto_454410 ?auto_454412 ) ) ( not ( = ?auto_454410 ?auto_454413 ) ) ( not ( = ?auto_454410 ?auto_454414 ) ) ( not ( = ?auto_454410 ?auto_454415 ) ) ( not ( = ?auto_454411 ?auto_454412 ) ) ( not ( = ?auto_454411 ?auto_454413 ) ) ( not ( = ?auto_454411 ?auto_454414 ) ) ( not ( = ?auto_454411 ?auto_454415 ) ) ( not ( = ?auto_454412 ?auto_454413 ) ) ( not ( = ?auto_454412 ?auto_454414 ) ) ( not ( = ?auto_454412 ?auto_454415 ) ) ( not ( = ?auto_454413 ?auto_454414 ) ) ( not ( = ?auto_454413 ?auto_454415 ) ) ( not ( = ?auto_454414 ?auto_454415 ) ) ( ON ?auto_454414 ?auto_454415 ) ( ON ?auto_454413 ?auto_454414 ) ( ON ?auto_454412 ?auto_454413 ) ( ON ?auto_454411 ?auto_454412 ) ( ON ?auto_454410 ?auto_454411 ) ( ON ?auto_454409 ?auto_454410 ) ( ON ?auto_454408 ?auto_454409 ) ( ON ?auto_454407 ?auto_454408 ) ( ON ?auto_454406 ?auto_454407 ) ( ON ?auto_454405 ?auto_454406 ) ( ON ?auto_454404 ?auto_454405 ) ( ON ?auto_454403 ?auto_454404 ) ( CLEAR ?auto_454401 ) ( ON ?auto_454402 ?auto_454403 ) ( CLEAR ?auto_454402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_454401 ?auto_454402 )
      ( MAKE-15PILE ?auto_454401 ?auto_454402 ?auto_454403 ?auto_454404 ?auto_454405 ?auto_454406 ?auto_454407 ?auto_454408 ?auto_454409 ?auto_454410 ?auto_454411 ?auto_454412 ?auto_454413 ?auto_454414 ?auto_454415 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454431 - BLOCK
      ?auto_454432 - BLOCK
      ?auto_454433 - BLOCK
      ?auto_454434 - BLOCK
      ?auto_454435 - BLOCK
      ?auto_454436 - BLOCK
      ?auto_454437 - BLOCK
      ?auto_454438 - BLOCK
      ?auto_454439 - BLOCK
      ?auto_454440 - BLOCK
      ?auto_454441 - BLOCK
      ?auto_454442 - BLOCK
      ?auto_454443 - BLOCK
      ?auto_454444 - BLOCK
      ?auto_454445 - BLOCK
    )
    :vars
    (
      ?auto_454446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_454445 ?auto_454446 ) ( not ( = ?auto_454431 ?auto_454432 ) ) ( not ( = ?auto_454431 ?auto_454433 ) ) ( not ( = ?auto_454431 ?auto_454434 ) ) ( not ( = ?auto_454431 ?auto_454435 ) ) ( not ( = ?auto_454431 ?auto_454436 ) ) ( not ( = ?auto_454431 ?auto_454437 ) ) ( not ( = ?auto_454431 ?auto_454438 ) ) ( not ( = ?auto_454431 ?auto_454439 ) ) ( not ( = ?auto_454431 ?auto_454440 ) ) ( not ( = ?auto_454431 ?auto_454441 ) ) ( not ( = ?auto_454431 ?auto_454442 ) ) ( not ( = ?auto_454431 ?auto_454443 ) ) ( not ( = ?auto_454431 ?auto_454444 ) ) ( not ( = ?auto_454431 ?auto_454445 ) ) ( not ( = ?auto_454431 ?auto_454446 ) ) ( not ( = ?auto_454432 ?auto_454433 ) ) ( not ( = ?auto_454432 ?auto_454434 ) ) ( not ( = ?auto_454432 ?auto_454435 ) ) ( not ( = ?auto_454432 ?auto_454436 ) ) ( not ( = ?auto_454432 ?auto_454437 ) ) ( not ( = ?auto_454432 ?auto_454438 ) ) ( not ( = ?auto_454432 ?auto_454439 ) ) ( not ( = ?auto_454432 ?auto_454440 ) ) ( not ( = ?auto_454432 ?auto_454441 ) ) ( not ( = ?auto_454432 ?auto_454442 ) ) ( not ( = ?auto_454432 ?auto_454443 ) ) ( not ( = ?auto_454432 ?auto_454444 ) ) ( not ( = ?auto_454432 ?auto_454445 ) ) ( not ( = ?auto_454432 ?auto_454446 ) ) ( not ( = ?auto_454433 ?auto_454434 ) ) ( not ( = ?auto_454433 ?auto_454435 ) ) ( not ( = ?auto_454433 ?auto_454436 ) ) ( not ( = ?auto_454433 ?auto_454437 ) ) ( not ( = ?auto_454433 ?auto_454438 ) ) ( not ( = ?auto_454433 ?auto_454439 ) ) ( not ( = ?auto_454433 ?auto_454440 ) ) ( not ( = ?auto_454433 ?auto_454441 ) ) ( not ( = ?auto_454433 ?auto_454442 ) ) ( not ( = ?auto_454433 ?auto_454443 ) ) ( not ( = ?auto_454433 ?auto_454444 ) ) ( not ( = ?auto_454433 ?auto_454445 ) ) ( not ( = ?auto_454433 ?auto_454446 ) ) ( not ( = ?auto_454434 ?auto_454435 ) ) ( not ( = ?auto_454434 ?auto_454436 ) ) ( not ( = ?auto_454434 ?auto_454437 ) ) ( not ( = ?auto_454434 ?auto_454438 ) ) ( not ( = ?auto_454434 ?auto_454439 ) ) ( not ( = ?auto_454434 ?auto_454440 ) ) ( not ( = ?auto_454434 ?auto_454441 ) ) ( not ( = ?auto_454434 ?auto_454442 ) ) ( not ( = ?auto_454434 ?auto_454443 ) ) ( not ( = ?auto_454434 ?auto_454444 ) ) ( not ( = ?auto_454434 ?auto_454445 ) ) ( not ( = ?auto_454434 ?auto_454446 ) ) ( not ( = ?auto_454435 ?auto_454436 ) ) ( not ( = ?auto_454435 ?auto_454437 ) ) ( not ( = ?auto_454435 ?auto_454438 ) ) ( not ( = ?auto_454435 ?auto_454439 ) ) ( not ( = ?auto_454435 ?auto_454440 ) ) ( not ( = ?auto_454435 ?auto_454441 ) ) ( not ( = ?auto_454435 ?auto_454442 ) ) ( not ( = ?auto_454435 ?auto_454443 ) ) ( not ( = ?auto_454435 ?auto_454444 ) ) ( not ( = ?auto_454435 ?auto_454445 ) ) ( not ( = ?auto_454435 ?auto_454446 ) ) ( not ( = ?auto_454436 ?auto_454437 ) ) ( not ( = ?auto_454436 ?auto_454438 ) ) ( not ( = ?auto_454436 ?auto_454439 ) ) ( not ( = ?auto_454436 ?auto_454440 ) ) ( not ( = ?auto_454436 ?auto_454441 ) ) ( not ( = ?auto_454436 ?auto_454442 ) ) ( not ( = ?auto_454436 ?auto_454443 ) ) ( not ( = ?auto_454436 ?auto_454444 ) ) ( not ( = ?auto_454436 ?auto_454445 ) ) ( not ( = ?auto_454436 ?auto_454446 ) ) ( not ( = ?auto_454437 ?auto_454438 ) ) ( not ( = ?auto_454437 ?auto_454439 ) ) ( not ( = ?auto_454437 ?auto_454440 ) ) ( not ( = ?auto_454437 ?auto_454441 ) ) ( not ( = ?auto_454437 ?auto_454442 ) ) ( not ( = ?auto_454437 ?auto_454443 ) ) ( not ( = ?auto_454437 ?auto_454444 ) ) ( not ( = ?auto_454437 ?auto_454445 ) ) ( not ( = ?auto_454437 ?auto_454446 ) ) ( not ( = ?auto_454438 ?auto_454439 ) ) ( not ( = ?auto_454438 ?auto_454440 ) ) ( not ( = ?auto_454438 ?auto_454441 ) ) ( not ( = ?auto_454438 ?auto_454442 ) ) ( not ( = ?auto_454438 ?auto_454443 ) ) ( not ( = ?auto_454438 ?auto_454444 ) ) ( not ( = ?auto_454438 ?auto_454445 ) ) ( not ( = ?auto_454438 ?auto_454446 ) ) ( not ( = ?auto_454439 ?auto_454440 ) ) ( not ( = ?auto_454439 ?auto_454441 ) ) ( not ( = ?auto_454439 ?auto_454442 ) ) ( not ( = ?auto_454439 ?auto_454443 ) ) ( not ( = ?auto_454439 ?auto_454444 ) ) ( not ( = ?auto_454439 ?auto_454445 ) ) ( not ( = ?auto_454439 ?auto_454446 ) ) ( not ( = ?auto_454440 ?auto_454441 ) ) ( not ( = ?auto_454440 ?auto_454442 ) ) ( not ( = ?auto_454440 ?auto_454443 ) ) ( not ( = ?auto_454440 ?auto_454444 ) ) ( not ( = ?auto_454440 ?auto_454445 ) ) ( not ( = ?auto_454440 ?auto_454446 ) ) ( not ( = ?auto_454441 ?auto_454442 ) ) ( not ( = ?auto_454441 ?auto_454443 ) ) ( not ( = ?auto_454441 ?auto_454444 ) ) ( not ( = ?auto_454441 ?auto_454445 ) ) ( not ( = ?auto_454441 ?auto_454446 ) ) ( not ( = ?auto_454442 ?auto_454443 ) ) ( not ( = ?auto_454442 ?auto_454444 ) ) ( not ( = ?auto_454442 ?auto_454445 ) ) ( not ( = ?auto_454442 ?auto_454446 ) ) ( not ( = ?auto_454443 ?auto_454444 ) ) ( not ( = ?auto_454443 ?auto_454445 ) ) ( not ( = ?auto_454443 ?auto_454446 ) ) ( not ( = ?auto_454444 ?auto_454445 ) ) ( not ( = ?auto_454444 ?auto_454446 ) ) ( not ( = ?auto_454445 ?auto_454446 ) ) ( ON ?auto_454444 ?auto_454445 ) ( ON ?auto_454443 ?auto_454444 ) ( ON ?auto_454442 ?auto_454443 ) ( ON ?auto_454441 ?auto_454442 ) ( ON ?auto_454440 ?auto_454441 ) ( ON ?auto_454439 ?auto_454440 ) ( ON ?auto_454438 ?auto_454439 ) ( ON ?auto_454437 ?auto_454438 ) ( ON ?auto_454436 ?auto_454437 ) ( ON ?auto_454435 ?auto_454436 ) ( ON ?auto_454434 ?auto_454435 ) ( ON ?auto_454433 ?auto_454434 ) ( ON ?auto_454432 ?auto_454433 ) ( ON ?auto_454431 ?auto_454432 ) ( CLEAR ?auto_454431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454431 )
      ( MAKE-15PILE ?auto_454431 ?auto_454432 ?auto_454433 ?auto_454434 ?auto_454435 ?auto_454436 ?auto_454437 ?auto_454438 ?auto_454439 ?auto_454440 ?auto_454441 ?auto_454442 ?auto_454443 ?auto_454444 ?auto_454445 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454462 - BLOCK
      ?auto_454463 - BLOCK
      ?auto_454464 - BLOCK
      ?auto_454465 - BLOCK
      ?auto_454466 - BLOCK
      ?auto_454467 - BLOCK
      ?auto_454468 - BLOCK
      ?auto_454469 - BLOCK
      ?auto_454470 - BLOCK
      ?auto_454471 - BLOCK
      ?auto_454472 - BLOCK
      ?auto_454473 - BLOCK
      ?auto_454474 - BLOCK
      ?auto_454475 - BLOCK
      ?auto_454476 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_454476 ) ( not ( = ?auto_454462 ?auto_454463 ) ) ( not ( = ?auto_454462 ?auto_454464 ) ) ( not ( = ?auto_454462 ?auto_454465 ) ) ( not ( = ?auto_454462 ?auto_454466 ) ) ( not ( = ?auto_454462 ?auto_454467 ) ) ( not ( = ?auto_454462 ?auto_454468 ) ) ( not ( = ?auto_454462 ?auto_454469 ) ) ( not ( = ?auto_454462 ?auto_454470 ) ) ( not ( = ?auto_454462 ?auto_454471 ) ) ( not ( = ?auto_454462 ?auto_454472 ) ) ( not ( = ?auto_454462 ?auto_454473 ) ) ( not ( = ?auto_454462 ?auto_454474 ) ) ( not ( = ?auto_454462 ?auto_454475 ) ) ( not ( = ?auto_454462 ?auto_454476 ) ) ( not ( = ?auto_454463 ?auto_454464 ) ) ( not ( = ?auto_454463 ?auto_454465 ) ) ( not ( = ?auto_454463 ?auto_454466 ) ) ( not ( = ?auto_454463 ?auto_454467 ) ) ( not ( = ?auto_454463 ?auto_454468 ) ) ( not ( = ?auto_454463 ?auto_454469 ) ) ( not ( = ?auto_454463 ?auto_454470 ) ) ( not ( = ?auto_454463 ?auto_454471 ) ) ( not ( = ?auto_454463 ?auto_454472 ) ) ( not ( = ?auto_454463 ?auto_454473 ) ) ( not ( = ?auto_454463 ?auto_454474 ) ) ( not ( = ?auto_454463 ?auto_454475 ) ) ( not ( = ?auto_454463 ?auto_454476 ) ) ( not ( = ?auto_454464 ?auto_454465 ) ) ( not ( = ?auto_454464 ?auto_454466 ) ) ( not ( = ?auto_454464 ?auto_454467 ) ) ( not ( = ?auto_454464 ?auto_454468 ) ) ( not ( = ?auto_454464 ?auto_454469 ) ) ( not ( = ?auto_454464 ?auto_454470 ) ) ( not ( = ?auto_454464 ?auto_454471 ) ) ( not ( = ?auto_454464 ?auto_454472 ) ) ( not ( = ?auto_454464 ?auto_454473 ) ) ( not ( = ?auto_454464 ?auto_454474 ) ) ( not ( = ?auto_454464 ?auto_454475 ) ) ( not ( = ?auto_454464 ?auto_454476 ) ) ( not ( = ?auto_454465 ?auto_454466 ) ) ( not ( = ?auto_454465 ?auto_454467 ) ) ( not ( = ?auto_454465 ?auto_454468 ) ) ( not ( = ?auto_454465 ?auto_454469 ) ) ( not ( = ?auto_454465 ?auto_454470 ) ) ( not ( = ?auto_454465 ?auto_454471 ) ) ( not ( = ?auto_454465 ?auto_454472 ) ) ( not ( = ?auto_454465 ?auto_454473 ) ) ( not ( = ?auto_454465 ?auto_454474 ) ) ( not ( = ?auto_454465 ?auto_454475 ) ) ( not ( = ?auto_454465 ?auto_454476 ) ) ( not ( = ?auto_454466 ?auto_454467 ) ) ( not ( = ?auto_454466 ?auto_454468 ) ) ( not ( = ?auto_454466 ?auto_454469 ) ) ( not ( = ?auto_454466 ?auto_454470 ) ) ( not ( = ?auto_454466 ?auto_454471 ) ) ( not ( = ?auto_454466 ?auto_454472 ) ) ( not ( = ?auto_454466 ?auto_454473 ) ) ( not ( = ?auto_454466 ?auto_454474 ) ) ( not ( = ?auto_454466 ?auto_454475 ) ) ( not ( = ?auto_454466 ?auto_454476 ) ) ( not ( = ?auto_454467 ?auto_454468 ) ) ( not ( = ?auto_454467 ?auto_454469 ) ) ( not ( = ?auto_454467 ?auto_454470 ) ) ( not ( = ?auto_454467 ?auto_454471 ) ) ( not ( = ?auto_454467 ?auto_454472 ) ) ( not ( = ?auto_454467 ?auto_454473 ) ) ( not ( = ?auto_454467 ?auto_454474 ) ) ( not ( = ?auto_454467 ?auto_454475 ) ) ( not ( = ?auto_454467 ?auto_454476 ) ) ( not ( = ?auto_454468 ?auto_454469 ) ) ( not ( = ?auto_454468 ?auto_454470 ) ) ( not ( = ?auto_454468 ?auto_454471 ) ) ( not ( = ?auto_454468 ?auto_454472 ) ) ( not ( = ?auto_454468 ?auto_454473 ) ) ( not ( = ?auto_454468 ?auto_454474 ) ) ( not ( = ?auto_454468 ?auto_454475 ) ) ( not ( = ?auto_454468 ?auto_454476 ) ) ( not ( = ?auto_454469 ?auto_454470 ) ) ( not ( = ?auto_454469 ?auto_454471 ) ) ( not ( = ?auto_454469 ?auto_454472 ) ) ( not ( = ?auto_454469 ?auto_454473 ) ) ( not ( = ?auto_454469 ?auto_454474 ) ) ( not ( = ?auto_454469 ?auto_454475 ) ) ( not ( = ?auto_454469 ?auto_454476 ) ) ( not ( = ?auto_454470 ?auto_454471 ) ) ( not ( = ?auto_454470 ?auto_454472 ) ) ( not ( = ?auto_454470 ?auto_454473 ) ) ( not ( = ?auto_454470 ?auto_454474 ) ) ( not ( = ?auto_454470 ?auto_454475 ) ) ( not ( = ?auto_454470 ?auto_454476 ) ) ( not ( = ?auto_454471 ?auto_454472 ) ) ( not ( = ?auto_454471 ?auto_454473 ) ) ( not ( = ?auto_454471 ?auto_454474 ) ) ( not ( = ?auto_454471 ?auto_454475 ) ) ( not ( = ?auto_454471 ?auto_454476 ) ) ( not ( = ?auto_454472 ?auto_454473 ) ) ( not ( = ?auto_454472 ?auto_454474 ) ) ( not ( = ?auto_454472 ?auto_454475 ) ) ( not ( = ?auto_454472 ?auto_454476 ) ) ( not ( = ?auto_454473 ?auto_454474 ) ) ( not ( = ?auto_454473 ?auto_454475 ) ) ( not ( = ?auto_454473 ?auto_454476 ) ) ( not ( = ?auto_454474 ?auto_454475 ) ) ( not ( = ?auto_454474 ?auto_454476 ) ) ( not ( = ?auto_454475 ?auto_454476 ) ) ( ON ?auto_454475 ?auto_454476 ) ( ON ?auto_454474 ?auto_454475 ) ( ON ?auto_454473 ?auto_454474 ) ( ON ?auto_454472 ?auto_454473 ) ( ON ?auto_454471 ?auto_454472 ) ( ON ?auto_454470 ?auto_454471 ) ( ON ?auto_454469 ?auto_454470 ) ( ON ?auto_454468 ?auto_454469 ) ( ON ?auto_454467 ?auto_454468 ) ( ON ?auto_454466 ?auto_454467 ) ( ON ?auto_454465 ?auto_454466 ) ( ON ?auto_454464 ?auto_454465 ) ( ON ?auto_454463 ?auto_454464 ) ( ON ?auto_454462 ?auto_454463 ) ( CLEAR ?auto_454462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_454462 )
      ( MAKE-15PILE ?auto_454462 ?auto_454463 ?auto_454464 ?auto_454465 ?auto_454466 ?auto_454467 ?auto_454468 ?auto_454469 ?auto_454470 ?auto_454471 ?auto_454472 ?auto_454473 ?auto_454474 ?auto_454475 ?auto_454476 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_454492 - BLOCK
      ?auto_454493 - BLOCK
      ?auto_454494 - BLOCK
      ?auto_454495 - BLOCK
      ?auto_454496 - BLOCK
      ?auto_454497 - BLOCK
      ?auto_454498 - BLOCK
      ?auto_454499 - BLOCK
      ?auto_454500 - BLOCK
      ?auto_454501 - BLOCK
      ?auto_454502 - BLOCK
      ?auto_454503 - BLOCK
      ?auto_454504 - BLOCK
      ?auto_454505 - BLOCK
      ?auto_454506 - BLOCK
    )
    :vars
    (
      ?auto_454507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_454492 ?auto_454493 ) ) ( not ( = ?auto_454492 ?auto_454494 ) ) ( not ( = ?auto_454492 ?auto_454495 ) ) ( not ( = ?auto_454492 ?auto_454496 ) ) ( not ( = ?auto_454492 ?auto_454497 ) ) ( not ( = ?auto_454492 ?auto_454498 ) ) ( not ( = ?auto_454492 ?auto_454499 ) ) ( not ( = ?auto_454492 ?auto_454500 ) ) ( not ( = ?auto_454492 ?auto_454501 ) ) ( not ( = ?auto_454492 ?auto_454502 ) ) ( not ( = ?auto_454492 ?auto_454503 ) ) ( not ( = ?auto_454492 ?auto_454504 ) ) ( not ( = ?auto_454492 ?auto_454505 ) ) ( not ( = ?auto_454492 ?auto_454506 ) ) ( not ( = ?auto_454493 ?auto_454494 ) ) ( not ( = ?auto_454493 ?auto_454495 ) ) ( not ( = ?auto_454493 ?auto_454496 ) ) ( not ( = ?auto_454493 ?auto_454497 ) ) ( not ( = ?auto_454493 ?auto_454498 ) ) ( not ( = ?auto_454493 ?auto_454499 ) ) ( not ( = ?auto_454493 ?auto_454500 ) ) ( not ( = ?auto_454493 ?auto_454501 ) ) ( not ( = ?auto_454493 ?auto_454502 ) ) ( not ( = ?auto_454493 ?auto_454503 ) ) ( not ( = ?auto_454493 ?auto_454504 ) ) ( not ( = ?auto_454493 ?auto_454505 ) ) ( not ( = ?auto_454493 ?auto_454506 ) ) ( not ( = ?auto_454494 ?auto_454495 ) ) ( not ( = ?auto_454494 ?auto_454496 ) ) ( not ( = ?auto_454494 ?auto_454497 ) ) ( not ( = ?auto_454494 ?auto_454498 ) ) ( not ( = ?auto_454494 ?auto_454499 ) ) ( not ( = ?auto_454494 ?auto_454500 ) ) ( not ( = ?auto_454494 ?auto_454501 ) ) ( not ( = ?auto_454494 ?auto_454502 ) ) ( not ( = ?auto_454494 ?auto_454503 ) ) ( not ( = ?auto_454494 ?auto_454504 ) ) ( not ( = ?auto_454494 ?auto_454505 ) ) ( not ( = ?auto_454494 ?auto_454506 ) ) ( not ( = ?auto_454495 ?auto_454496 ) ) ( not ( = ?auto_454495 ?auto_454497 ) ) ( not ( = ?auto_454495 ?auto_454498 ) ) ( not ( = ?auto_454495 ?auto_454499 ) ) ( not ( = ?auto_454495 ?auto_454500 ) ) ( not ( = ?auto_454495 ?auto_454501 ) ) ( not ( = ?auto_454495 ?auto_454502 ) ) ( not ( = ?auto_454495 ?auto_454503 ) ) ( not ( = ?auto_454495 ?auto_454504 ) ) ( not ( = ?auto_454495 ?auto_454505 ) ) ( not ( = ?auto_454495 ?auto_454506 ) ) ( not ( = ?auto_454496 ?auto_454497 ) ) ( not ( = ?auto_454496 ?auto_454498 ) ) ( not ( = ?auto_454496 ?auto_454499 ) ) ( not ( = ?auto_454496 ?auto_454500 ) ) ( not ( = ?auto_454496 ?auto_454501 ) ) ( not ( = ?auto_454496 ?auto_454502 ) ) ( not ( = ?auto_454496 ?auto_454503 ) ) ( not ( = ?auto_454496 ?auto_454504 ) ) ( not ( = ?auto_454496 ?auto_454505 ) ) ( not ( = ?auto_454496 ?auto_454506 ) ) ( not ( = ?auto_454497 ?auto_454498 ) ) ( not ( = ?auto_454497 ?auto_454499 ) ) ( not ( = ?auto_454497 ?auto_454500 ) ) ( not ( = ?auto_454497 ?auto_454501 ) ) ( not ( = ?auto_454497 ?auto_454502 ) ) ( not ( = ?auto_454497 ?auto_454503 ) ) ( not ( = ?auto_454497 ?auto_454504 ) ) ( not ( = ?auto_454497 ?auto_454505 ) ) ( not ( = ?auto_454497 ?auto_454506 ) ) ( not ( = ?auto_454498 ?auto_454499 ) ) ( not ( = ?auto_454498 ?auto_454500 ) ) ( not ( = ?auto_454498 ?auto_454501 ) ) ( not ( = ?auto_454498 ?auto_454502 ) ) ( not ( = ?auto_454498 ?auto_454503 ) ) ( not ( = ?auto_454498 ?auto_454504 ) ) ( not ( = ?auto_454498 ?auto_454505 ) ) ( not ( = ?auto_454498 ?auto_454506 ) ) ( not ( = ?auto_454499 ?auto_454500 ) ) ( not ( = ?auto_454499 ?auto_454501 ) ) ( not ( = ?auto_454499 ?auto_454502 ) ) ( not ( = ?auto_454499 ?auto_454503 ) ) ( not ( = ?auto_454499 ?auto_454504 ) ) ( not ( = ?auto_454499 ?auto_454505 ) ) ( not ( = ?auto_454499 ?auto_454506 ) ) ( not ( = ?auto_454500 ?auto_454501 ) ) ( not ( = ?auto_454500 ?auto_454502 ) ) ( not ( = ?auto_454500 ?auto_454503 ) ) ( not ( = ?auto_454500 ?auto_454504 ) ) ( not ( = ?auto_454500 ?auto_454505 ) ) ( not ( = ?auto_454500 ?auto_454506 ) ) ( not ( = ?auto_454501 ?auto_454502 ) ) ( not ( = ?auto_454501 ?auto_454503 ) ) ( not ( = ?auto_454501 ?auto_454504 ) ) ( not ( = ?auto_454501 ?auto_454505 ) ) ( not ( = ?auto_454501 ?auto_454506 ) ) ( not ( = ?auto_454502 ?auto_454503 ) ) ( not ( = ?auto_454502 ?auto_454504 ) ) ( not ( = ?auto_454502 ?auto_454505 ) ) ( not ( = ?auto_454502 ?auto_454506 ) ) ( not ( = ?auto_454503 ?auto_454504 ) ) ( not ( = ?auto_454503 ?auto_454505 ) ) ( not ( = ?auto_454503 ?auto_454506 ) ) ( not ( = ?auto_454504 ?auto_454505 ) ) ( not ( = ?auto_454504 ?auto_454506 ) ) ( not ( = ?auto_454505 ?auto_454506 ) ) ( ON ?auto_454492 ?auto_454507 ) ( not ( = ?auto_454506 ?auto_454507 ) ) ( not ( = ?auto_454505 ?auto_454507 ) ) ( not ( = ?auto_454504 ?auto_454507 ) ) ( not ( = ?auto_454503 ?auto_454507 ) ) ( not ( = ?auto_454502 ?auto_454507 ) ) ( not ( = ?auto_454501 ?auto_454507 ) ) ( not ( = ?auto_454500 ?auto_454507 ) ) ( not ( = ?auto_454499 ?auto_454507 ) ) ( not ( = ?auto_454498 ?auto_454507 ) ) ( not ( = ?auto_454497 ?auto_454507 ) ) ( not ( = ?auto_454496 ?auto_454507 ) ) ( not ( = ?auto_454495 ?auto_454507 ) ) ( not ( = ?auto_454494 ?auto_454507 ) ) ( not ( = ?auto_454493 ?auto_454507 ) ) ( not ( = ?auto_454492 ?auto_454507 ) ) ( ON ?auto_454493 ?auto_454492 ) ( ON ?auto_454494 ?auto_454493 ) ( ON ?auto_454495 ?auto_454494 ) ( ON ?auto_454496 ?auto_454495 ) ( ON ?auto_454497 ?auto_454496 ) ( ON ?auto_454498 ?auto_454497 ) ( ON ?auto_454499 ?auto_454498 ) ( ON ?auto_454500 ?auto_454499 ) ( ON ?auto_454501 ?auto_454500 ) ( ON ?auto_454502 ?auto_454501 ) ( ON ?auto_454503 ?auto_454502 ) ( ON ?auto_454504 ?auto_454503 ) ( ON ?auto_454505 ?auto_454504 ) ( ON ?auto_454506 ?auto_454505 ) ( CLEAR ?auto_454506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_454506 ?auto_454505 ?auto_454504 ?auto_454503 ?auto_454502 ?auto_454501 ?auto_454500 ?auto_454499 ?auto_454498 ?auto_454497 ?auto_454496 ?auto_454495 ?auto_454494 ?auto_454493 ?auto_454492 )
      ( MAKE-15PILE ?auto_454492 ?auto_454493 ?auto_454494 ?auto_454495 ?auto_454496 ?auto_454497 ?auto_454498 ?auto_454499 ?auto_454500 ?auto_454501 ?auto_454502 ?auto_454503 ?auto_454504 ?auto_454505 ?auto_454506 ) )
  )

)

