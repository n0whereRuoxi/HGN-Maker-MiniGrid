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

