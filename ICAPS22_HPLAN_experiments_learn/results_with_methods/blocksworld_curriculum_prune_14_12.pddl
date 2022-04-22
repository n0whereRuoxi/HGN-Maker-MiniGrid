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
      ?auto_326341 - BLOCK
    )
    :vars
    (
      ?auto_326342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326341 ?auto_326342 ) ( CLEAR ?auto_326341 ) ( HAND-EMPTY ) ( not ( = ?auto_326341 ?auto_326342 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326341 ?auto_326342 )
      ( !PUTDOWN ?auto_326341 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_326348 - BLOCK
      ?auto_326349 - BLOCK
    )
    :vars
    (
      ?auto_326350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326348 ) ( ON ?auto_326349 ?auto_326350 ) ( CLEAR ?auto_326349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326348 ) ( not ( = ?auto_326348 ?auto_326349 ) ) ( not ( = ?auto_326348 ?auto_326350 ) ) ( not ( = ?auto_326349 ?auto_326350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326349 ?auto_326350 )
      ( !STACK ?auto_326349 ?auto_326348 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_326358 - BLOCK
      ?auto_326359 - BLOCK
    )
    :vars
    (
      ?auto_326360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326359 ?auto_326360 ) ( not ( = ?auto_326358 ?auto_326359 ) ) ( not ( = ?auto_326358 ?auto_326360 ) ) ( not ( = ?auto_326359 ?auto_326360 ) ) ( ON ?auto_326358 ?auto_326359 ) ( CLEAR ?auto_326358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326358 )
      ( MAKE-2PILE ?auto_326358 ?auto_326359 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_326369 - BLOCK
      ?auto_326370 - BLOCK
      ?auto_326371 - BLOCK
    )
    :vars
    (
      ?auto_326372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326370 ) ( ON ?auto_326371 ?auto_326372 ) ( CLEAR ?auto_326371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326369 ) ( ON ?auto_326370 ?auto_326369 ) ( not ( = ?auto_326369 ?auto_326370 ) ) ( not ( = ?auto_326369 ?auto_326371 ) ) ( not ( = ?auto_326369 ?auto_326372 ) ) ( not ( = ?auto_326370 ?auto_326371 ) ) ( not ( = ?auto_326370 ?auto_326372 ) ) ( not ( = ?auto_326371 ?auto_326372 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326371 ?auto_326372 )
      ( !STACK ?auto_326371 ?auto_326370 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_326383 - BLOCK
      ?auto_326384 - BLOCK
      ?auto_326385 - BLOCK
    )
    :vars
    (
      ?auto_326386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326385 ?auto_326386 ) ( ON-TABLE ?auto_326383 ) ( not ( = ?auto_326383 ?auto_326384 ) ) ( not ( = ?auto_326383 ?auto_326385 ) ) ( not ( = ?auto_326383 ?auto_326386 ) ) ( not ( = ?auto_326384 ?auto_326385 ) ) ( not ( = ?auto_326384 ?auto_326386 ) ) ( not ( = ?auto_326385 ?auto_326386 ) ) ( CLEAR ?auto_326383 ) ( ON ?auto_326384 ?auto_326385 ) ( CLEAR ?auto_326384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326383 ?auto_326384 )
      ( MAKE-3PILE ?auto_326383 ?auto_326384 ?auto_326385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_326397 - BLOCK
      ?auto_326398 - BLOCK
      ?auto_326399 - BLOCK
    )
    :vars
    (
      ?auto_326400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326399 ?auto_326400 ) ( not ( = ?auto_326397 ?auto_326398 ) ) ( not ( = ?auto_326397 ?auto_326399 ) ) ( not ( = ?auto_326397 ?auto_326400 ) ) ( not ( = ?auto_326398 ?auto_326399 ) ) ( not ( = ?auto_326398 ?auto_326400 ) ) ( not ( = ?auto_326399 ?auto_326400 ) ) ( ON ?auto_326398 ?auto_326399 ) ( ON ?auto_326397 ?auto_326398 ) ( CLEAR ?auto_326397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326397 )
      ( MAKE-3PILE ?auto_326397 ?auto_326398 ?auto_326399 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_326412 - BLOCK
      ?auto_326413 - BLOCK
      ?auto_326414 - BLOCK
      ?auto_326415 - BLOCK
    )
    :vars
    (
      ?auto_326416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326414 ) ( ON ?auto_326415 ?auto_326416 ) ( CLEAR ?auto_326415 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326412 ) ( ON ?auto_326413 ?auto_326412 ) ( ON ?auto_326414 ?auto_326413 ) ( not ( = ?auto_326412 ?auto_326413 ) ) ( not ( = ?auto_326412 ?auto_326414 ) ) ( not ( = ?auto_326412 ?auto_326415 ) ) ( not ( = ?auto_326412 ?auto_326416 ) ) ( not ( = ?auto_326413 ?auto_326414 ) ) ( not ( = ?auto_326413 ?auto_326415 ) ) ( not ( = ?auto_326413 ?auto_326416 ) ) ( not ( = ?auto_326414 ?auto_326415 ) ) ( not ( = ?auto_326414 ?auto_326416 ) ) ( not ( = ?auto_326415 ?auto_326416 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326415 ?auto_326416 )
      ( !STACK ?auto_326415 ?auto_326414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_326430 - BLOCK
      ?auto_326431 - BLOCK
      ?auto_326432 - BLOCK
      ?auto_326433 - BLOCK
    )
    :vars
    (
      ?auto_326434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326433 ?auto_326434 ) ( ON-TABLE ?auto_326430 ) ( ON ?auto_326431 ?auto_326430 ) ( not ( = ?auto_326430 ?auto_326431 ) ) ( not ( = ?auto_326430 ?auto_326432 ) ) ( not ( = ?auto_326430 ?auto_326433 ) ) ( not ( = ?auto_326430 ?auto_326434 ) ) ( not ( = ?auto_326431 ?auto_326432 ) ) ( not ( = ?auto_326431 ?auto_326433 ) ) ( not ( = ?auto_326431 ?auto_326434 ) ) ( not ( = ?auto_326432 ?auto_326433 ) ) ( not ( = ?auto_326432 ?auto_326434 ) ) ( not ( = ?auto_326433 ?auto_326434 ) ) ( CLEAR ?auto_326431 ) ( ON ?auto_326432 ?auto_326433 ) ( CLEAR ?auto_326432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326430 ?auto_326431 ?auto_326432 )
      ( MAKE-4PILE ?auto_326430 ?auto_326431 ?auto_326432 ?auto_326433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_326448 - BLOCK
      ?auto_326449 - BLOCK
      ?auto_326450 - BLOCK
      ?auto_326451 - BLOCK
    )
    :vars
    (
      ?auto_326452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326451 ?auto_326452 ) ( ON-TABLE ?auto_326448 ) ( not ( = ?auto_326448 ?auto_326449 ) ) ( not ( = ?auto_326448 ?auto_326450 ) ) ( not ( = ?auto_326448 ?auto_326451 ) ) ( not ( = ?auto_326448 ?auto_326452 ) ) ( not ( = ?auto_326449 ?auto_326450 ) ) ( not ( = ?auto_326449 ?auto_326451 ) ) ( not ( = ?auto_326449 ?auto_326452 ) ) ( not ( = ?auto_326450 ?auto_326451 ) ) ( not ( = ?auto_326450 ?auto_326452 ) ) ( not ( = ?auto_326451 ?auto_326452 ) ) ( ON ?auto_326450 ?auto_326451 ) ( CLEAR ?auto_326448 ) ( ON ?auto_326449 ?auto_326450 ) ( CLEAR ?auto_326449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326448 ?auto_326449 )
      ( MAKE-4PILE ?auto_326448 ?auto_326449 ?auto_326450 ?auto_326451 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_326466 - BLOCK
      ?auto_326467 - BLOCK
      ?auto_326468 - BLOCK
      ?auto_326469 - BLOCK
    )
    :vars
    (
      ?auto_326470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326469 ?auto_326470 ) ( not ( = ?auto_326466 ?auto_326467 ) ) ( not ( = ?auto_326466 ?auto_326468 ) ) ( not ( = ?auto_326466 ?auto_326469 ) ) ( not ( = ?auto_326466 ?auto_326470 ) ) ( not ( = ?auto_326467 ?auto_326468 ) ) ( not ( = ?auto_326467 ?auto_326469 ) ) ( not ( = ?auto_326467 ?auto_326470 ) ) ( not ( = ?auto_326468 ?auto_326469 ) ) ( not ( = ?auto_326468 ?auto_326470 ) ) ( not ( = ?auto_326469 ?auto_326470 ) ) ( ON ?auto_326468 ?auto_326469 ) ( ON ?auto_326467 ?auto_326468 ) ( ON ?auto_326466 ?auto_326467 ) ( CLEAR ?auto_326466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326466 )
      ( MAKE-4PILE ?auto_326466 ?auto_326467 ?auto_326468 ?auto_326469 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_326485 - BLOCK
      ?auto_326486 - BLOCK
      ?auto_326487 - BLOCK
      ?auto_326488 - BLOCK
      ?auto_326489 - BLOCK
    )
    :vars
    (
      ?auto_326490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326488 ) ( ON ?auto_326489 ?auto_326490 ) ( CLEAR ?auto_326489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326485 ) ( ON ?auto_326486 ?auto_326485 ) ( ON ?auto_326487 ?auto_326486 ) ( ON ?auto_326488 ?auto_326487 ) ( not ( = ?auto_326485 ?auto_326486 ) ) ( not ( = ?auto_326485 ?auto_326487 ) ) ( not ( = ?auto_326485 ?auto_326488 ) ) ( not ( = ?auto_326485 ?auto_326489 ) ) ( not ( = ?auto_326485 ?auto_326490 ) ) ( not ( = ?auto_326486 ?auto_326487 ) ) ( not ( = ?auto_326486 ?auto_326488 ) ) ( not ( = ?auto_326486 ?auto_326489 ) ) ( not ( = ?auto_326486 ?auto_326490 ) ) ( not ( = ?auto_326487 ?auto_326488 ) ) ( not ( = ?auto_326487 ?auto_326489 ) ) ( not ( = ?auto_326487 ?auto_326490 ) ) ( not ( = ?auto_326488 ?auto_326489 ) ) ( not ( = ?auto_326488 ?auto_326490 ) ) ( not ( = ?auto_326489 ?auto_326490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326489 ?auto_326490 )
      ( !STACK ?auto_326489 ?auto_326488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_326507 - BLOCK
      ?auto_326508 - BLOCK
      ?auto_326509 - BLOCK
      ?auto_326510 - BLOCK
      ?auto_326511 - BLOCK
    )
    :vars
    (
      ?auto_326512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326511 ?auto_326512 ) ( ON-TABLE ?auto_326507 ) ( ON ?auto_326508 ?auto_326507 ) ( ON ?auto_326509 ?auto_326508 ) ( not ( = ?auto_326507 ?auto_326508 ) ) ( not ( = ?auto_326507 ?auto_326509 ) ) ( not ( = ?auto_326507 ?auto_326510 ) ) ( not ( = ?auto_326507 ?auto_326511 ) ) ( not ( = ?auto_326507 ?auto_326512 ) ) ( not ( = ?auto_326508 ?auto_326509 ) ) ( not ( = ?auto_326508 ?auto_326510 ) ) ( not ( = ?auto_326508 ?auto_326511 ) ) ( not ( = ?auto_326508 ?auto_326512 ) ) ( not ( = ?auto_326509 ?auto_326510 ) ) ( not ( = ?auto_326509 ?auto_326511 ) ) ( not ( = ?auto_326509 ?auto_326512 ) ) ( not ( = ?auto_326510 ?auto_326511 ) ) ( not ( = ?auto_326510 ?auto_326512 ) ) ( not ( = ?auto_326511 ?auto_326512 ) ) ( CLEAR ?auto_326509 ) ( ON ?auto_326510 ?auto_326511 ) ( CLEAR ?auto_326510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_326507 ?auto_326508 ?auto_326509 ?auto_326510 )
      ( MAKE-5PILE ?auto_326507 ?auto_326508 ?auto_326509 ?auto_326510 ?auto_326511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_326529 - BLOCK
      ?auto_326530 - BLOCK
      ?auto_326531 - BLOCK
      ?auto_326532 - BLOCK
      ?auto_326533 - BLOCK
    )
    :vars
    (
      ?auto_326534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326533 ?auto_326534 ) ( ON-TABLE ?auto_326529 ) ( ON ?auto_326530 ?auto_326529 ) ( not ( = ?auto_326529 ?auto_326530 ) ) ( not ( = ?auto_326529 ?auto_326531 ) ) ( not ( = ?auto_326529 ?auto_326532 ) ) ( not ( = ?auto_326529 ?auto_326533 ) ) ( not ( = ?auto_326529 ?auto_326534 ) ) ( not ( = ?auto_326530 ?auto_326531 ) ) ( not ( = ?auto_326530 ?auto_326532 ) ) ( not ( = ?auto_326530 ?auto_326533 ) ) ( not ( = ?auto_326530 ?auto_326534 ) ) ( not ( = ?auto_326531 ?auto_326532 ) ) ( not ( = ?auto_326531 ?auto_326533 ) ) ( not ( = ?auto_326531 ?auto_326534 ) ) ( not ( = ?auto_326532 ?auto_326533 ) ) ( not ( = ?auto_326532 ?auto_326534 ) ) ( not ( = ?auto_326533 ?auto_326534 ) ) ( ON ?auto_326532 ?auto_326533 ) ( CLEAR ?auto_326530 ) ( ON ?auto_326531 ?auto_326532 ) ( CLEAR ?auto_326531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326529 ?auto_326530 ?auto_326531 )
      ( MAKE-5PILE ?auto_326529 ?auto_326530 ?auto_326531 ?auto_326532 ?auto_326533 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_326551 - BLOCK
      ?auto_326552 - BLOCK
      ?auto_326553 - BLOCK
      ?auto_326554 - BLOCK
      ?auto_326555 - BLOCK
    )
    :vars
    (
      ?auto_326556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326555 ?auto_326556 ) ( ON-TABLE ?auto_326551 ) ( not ( = ?auto_326551 ?auto_326552 ) ) ( not ( = ?auto_326551 ?auto_326553 ) ) ( not ( = ?auto_326551 ?auto_326554 ) ) ( not ( = ?auto_326551 ?auto_326555 ) ) ( not ( = ?auto_326551 ?auto_326556 ) ) ( not ( = ?auto_326552 ?auto_326553 ) ) ( not ( = ?auto_326552 ?auto_326554 ) ) ( not ( = ?auto_326552 ?auto_326555 ) ) ( not ( = ?auto_326552 ?auto_326556 ) ) ( not ( = ?auto_326553 ?auto_326554 ) ) ( not ( = ?auto_326553 ?auto_326555 ) ) ( not ( = ?auto_326553 ?auto_326556 ) ) ( not ( = ?auto_326554 ?auto_326555 ) ) ( not ( = ?auto_326554 ?auto_326556 ) ) ( not ( = ?auto_326555 ?auto_326556 ) ) ( ON ?auto_326554 ?auto_326555 ) ( ON ?auto_326553 ?auto_326554 ) ( CLEAR ?auto_326551 ) ( ON ?auto_326552 ?auto_326553 ) ( CLEAR ?auto_326552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326551 ?auto_326552 )
      ( MAKE-5PILE ?auto_326551 ?auto_326552 ?auto_326553 ?auto_326554 ?auto_326555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_326573 - BLOCK
      ?auto_326574 - BLOCK
      ?auto_326575 - BLOCK
      ?auto_326576 - BLOCK
      ?auto_326577 - BLOCK
    )
    :vars
    (
      ?auto_326578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326577 ?auto_326578 ) ( not ( = ?auto_326573 ?auto_326574 ) ) ( not ( = ?auto_326573 ?auto_326575 ) ) ( not ( = ?auto_326573 ?auto_326576 ) ) ( not ( = ?auto_326573 ?auto_326577 ) ) ( not ( = ?auto_326573 ?auto_326578 ) ) ( not ( = ?auto_326574 ?auto_326575 ) ) ( not ( = ?auto_326574 ?auto_326576 ) ) ( not ( = ?auto_326574 ?auto_326577 ) ) ( not ( = ?auto_326574 ?auto_326578 ) ) ( not ( = ?auto_326575 ?auto_326576 ) ) ( not ( = ?auto_326575 ?auto_326577 ) ) ( not ( = ?auto_326575 ?auto_326578 ) ) ( not ( = ?auto_326576 ?auto_326577 ) ) ( not ( = ?auto_326576 ?auto_326578 ) ) ( not ( = ?auto_326577 ?auto_326578 ) ) ( ON ?auto_326576 ?auto_326577 ) ( ON ?auto_326575 ?auto_326576 ) ( ON ?auto_326574 ?auto_326575 ) ( ON ?auto_326573 ?auto_326574 ) ( CLEAR ?auto_326573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326573 )
      ( MAKE-5PILE ?auto_326573 ?auto_326574 ?auto_326575 ?auto_326576 ?auto_326577 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326596 - BLOCK
      ?auto_326597 - BLOCK
      ?auto_326598 - BLOCK
      ?auto_326599 - BLOCK
      ?auto_326600 - BLOCK
      ?auto_326601 - BLOCK
    )
    :vars
    (
      ?auto_326602 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326600 ) ( ON ?auto_326601 ?auto_326602 ) ( CLEAR ?auto_326601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326596 ) ( ON ?auto_326597 ?auto_326596 ) ( ON ?auto_326598 ?auto_326597 ) ( ON ?auto_326599 ?auto_326598 ) ( ON ?auto_326600 ?auto_326599 ) ( not ( = ?auto_326596 ?auto_326597 ) ) ( not ( = ?auto_326596 ?auto_326598 ) ) ( not ( = ?auto_326596 ?auto_326599 ) ) ( not ( = ?auto_326596 ?auto_326600 ) ) ( not ( = ?auto_326596 ?auto_326601 ) ) ( not ( = ?auto_326596 ?auto_326602 ) ) ( not ( = ?auto_326597 ?auto_326598 ) ) ( not ( = ?auto_326597 ?auto_326599 ) ) ( not ( = ?auto_326597 ?auto_326600 ) ) ( not ( = ?auto_326597 ?auto_326601 ) ) ( not ( = ?auto_326597 ?auto_326602 ) ) ( not ( = ?auto_326598 ?auto_326599 ) ) ( not ( = ?auto_326598 ?auto_326600 ) ) ( not ( = ?auto_326598 ?auto_326601 ) ) ( not ( = ?auto_326598 ?auto_326602 ) ) ( not ( = ?auto_326599 ?auto_326600 ) ) ( not ( = ?auto_326599 ?auto_326601 ) ) ( not ( = ?auto_326599 ?auto_326602 ) ) ( not ( = ?auto_326600 ?auto_326601 ) ) ( not ( = ?auto_326600 ?auto_326602 ) ) ( not ( = ?auto_326601 ?auto_326602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326601 ?auto_326602 )
      ( !STACK ?auto_326601 ?auto_326600 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326622 - BLOCK
      ?auto_326623 - BLOCK
      ?auto_326624 - BLOCK
      ?auto_326625 - BLOCK
      ?auto_326626 - BLOCK
      ?auto_326627 - BLOCK
    )
    :vars
    (
      ?auto_326628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326627 ?auto_326628 ) ( ON-TABLE ?auto_326622 ) ( ON ?auto_326623 ?auto_326622 ) ( ON ?auto_326624 ?auto_326623 ) ( ON ?auto_326625 ?auto_326624 ) ( not ( = ?auto_326622 ?auto_326623 ) ) ( not ( = ?auto_326622 ?auto_326624 ) ) ( not ( = ?auto_326622 ?auto_326625 ) ) ( not ( = ?auto_326622 ?auto_326626 ) ) ( not ( = ?auto_326622 ?auto_326627 ) ) ( not ( = ?auto_326622 ?auto_326628 ) ) ( not ( = ?auto_326623 ?auto_326624 ) ) ( not ( = ?auto_326623 ?auto_326625 ) ) ( not ( = ?auto_326623 ?auto_326626 ) ) ( not ( = ?auto_326623 ?auto_326627 ) ) ( not ( = ?auto_326623 ?auto_326628 ) ) ( not ( = ?auto_326624 ?auto_326625 ) ) ( not ( = ?auto_326624 ?auto_326626 ) ) ( not ( = ?auto_326624 ?auto_326627 ) ) ( not ( = ?auto_326624 ?auto_326628 ) ) ( not ( = ?auto_326625 ?auto_326626 ) ) ( not ( = ?auto_326625 ?auto_326627 ) ) ( not ( = ?auto_326625 ?auto_326628 ) ) ( not ( = ?auto_326626 ?auto_326627 ) ) ( not ( = ?auto_326626 ?auto_326628 ) ) ( not ( = ?auto_326627 ?auto_326628 ) ) ( CLEAR ?auto_326625 ) ( ON ?auto_326626 ?auto_326627 ) ( CLEAR ?auto_326626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_326622 ?auto_326623 ?auto_326624 ?auto_326625 ?auto_326626 )
      ( MAKE-6PILE ?auto_326622 ?auto_326623 ?auto_326624 ?auto_326625 ?auto_326626 ?auto_326627 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326648 - BLOCK
      ?auto_326649 - BLOCK
      ?auto_326650 - BLOCK
      ?auto_326651 - BLOCK
      ?auto_326652 - BLOCK
      ?auto_326653 - BLOCK
    )
    :vars
    (
      ?auto_326654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326653 ?auto_326654 ) ( ON-TABLE ?auto_326648 ) ( ON ?auto_326649 ?auto_326648 ) ( ON ?auto_326650 ?auto_326649 ) ( not ( = ?auto_326648 ?auto_326649 ) ) ( not ( = ?auto_326648 ?auto_326650 ) ) ( not ( = ?auto_326648 ?auto_326651 ) ) ( not ( = ?auto_326648 ?auto_326652 ) ) ( not ( = ?auto_326648 ?auto_326653 ) ) ( not ( = ?auto_326648 ?auto_326654 ) ) ( not ( = ?auto_326649 ?auto_326650 ) ) ( not ( = ?auto_326649 ?auto_326651 ) ) ( not ( = ?auto_326649 ?auto_326652 ) ) ( not ( = ?auto_326649 ?auto_326653 ) ) ( not ( = ?auto_326649 ?auto_326654 ) ) ( not ( = ?auto_326650 ?auto_326651 ) ) ( not ( = ?auto_326650 ?auto_326652 ) ) ( not ( = ?auto_326650 ?auto_326653 ) ) ( not ( = ?auto_326650 ?auto_326654 ) ) ( not ( = ?auto_326651 ?auto_326652 ) ) ( not ( = ?auto_326651 ?auto_326653 ) ) ( not ( = ?auto_326651 ?auto_326654 ) ) ( not ( = ?auto_326652 ?auto_326653 ) ) ( not ( = ?auto_326652 ?auto_326654 ) ) ( not ( = ?auto_326653 ?auto_326654 ) ) ( ON ?auto_326652 ?auto_326653 ) ( CLEAR ?auto_326650 ) ( ON ?auto_326651 ?auto_326652 ) ( CLEAR ?auto_326651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_326648 ?auto_326649 ?auto_326650 ?auto_326651 )
      ( MAKE-6PILE ?auto_326648 ?auto_326649 ?auto_326650 ?auto_326651 ?auto_326652 ?auto_326653 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326674 - BLOCK
      ?auto_326675 - BLOCK
      ?auto_326676 - BLOCK
      ?auto_326677 - BLOCK
      ?auto_326678 - BLOCK
      ?auto_326679 - BLOCK
    )
    :vars
    (
      ?auto_326680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326679 ?auto_326680 ) ( ON-TABLE ?auto_326674 ) ( ON ?auto_326675 ?auto_326674 ) ( not ( = ?auto_326674 ?auto_326675 ) ) ( not ( = ?auto_326674 ?auto_326676 ) ) ( not ( = ?auto_326674 ?auto_326677 ) ) ( not ( = ?auto_326674 ?auto_326678 ) ) ( not ( = ?auto_326674 ?auto_326679 ) ) ( not ( = ?auto_326674 ?auto_326680 ) ) ( not ( = ?auto_326675 ?auto_326676 ) ) ( not ( = ?auto_326675 ?auto_326677 ) ) ( not ( = ?auto_326675 ?auto_326678 ) ) ( not ( = ?auto_326675 ?auto_326679 ) ) ( not ( = ?auto_326675 ?auto_326680 ) ) ( not ( = ?auto_326676 ?auto_326677 ) ) ( not ( = ?auto_326676 ?auto_326678 ) ) ( not ( = ?auto_326676 ?auto_326679 ) ) ( not ( = ?auto_326676 ?auto_326680 ) ) ( not ( = ?auto_326677 ?auto_326678 ) ) ( not ( = ?auto_326677 ?auto_326679 ) ) ( not ( = ?auto_326677 ?auto_326680 ) ) ( not ( = ?auto_326678 ?auto_326679 ) ) ( not ( = ?auto_326678 ?auto_326680 ) ) ( not ( = ?auto_326679 ?auto_326680 ) ) ( ON ?auto_326678 ?auto_326679 ) ( ON ?auto_326677 ?auto_326678 ) ( CLEAR ?auto_326675 ) ( ON ?auto_326676 ?auto_326677 ) ( CLEAR ?auto_326676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326674 ?auto_326675 ?auto_326676 )
      ( MAKE-6PILE ?auto_326674 ?auto_326675 ?auto_326676 ?auto_326677 ?auto_326678 ?auto_326679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326700 - BLOCK
      ?auto_326701 - BLOCK
      ?auto_326702 - BLOCK
      ?auto_326703 - BLOCK
      ?auto_326704 - BLOCK
      ?auto_326705 - BLOCK
    )
    :vars
    (
      ?auto_326706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326705 ?auto_326706 ) ( ON-TABLE ?auto_326700 ) ( not ( = ?auto_326700 ?auto_326701 ) ) ( not ( = ?auto_326700 ?auto_326702 ) ) ( not ( = ?auto_326700 ?auto_326703 ) ) ( not ( = ?auto_326700 ?auto_326704 ) ) ( not ( = ?auto_326700 ?auto_326705 ) ) ( not ( = ?auto_326700 ?auto_326706 ) ) ( not ( = ?auto_326701 ?auto_326702 ) ) ( not ( = ?auto_326701 ?auto_326703 ) ) ( not ( = ?auto_326701 ?auto_326704 ) ) ( not ( = ?auto_326701 ?auto_326705 ) ) ( not ( = ?auto_326701 ?auto_326706 ) ) ( not ( = ?auto_326702 ?auto_326703 ) ) ( not ( = ?auto_326702 ?auto_326704 ) ) ( not ( = ?auto_326702 ?auto_326705 ) ) ( not ( = ?auto_326702 ?auto_326706 ) ) ( not ( = ?auto_326703 ?auto_326704 ) ) ( not ( = ?auto_326703 ?auto_326705 ) ) ( not ( = ?auto_326703 ?auto_326706 ) ) ( not ( = ?auto_326704 ?auto_326705 ) ) ( not ( = ?auto_326704 ?auto_326706 ) ) ( not ( = ?auto_326705 ?auto_326706 ) ) ( ON ?auto_326704 ?auto_326705 ) ( ON ?auto_326703 ?auto_326704 ) ( ON ?auto_326702 ?auto_326703 ) ( CLEAR ?auto_326700 ) ( ON ?auto_326701 ?auto_326702 ) ( CLEAR ?auto_326701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326700 ?auto_326701 )
      ( MAKE-6PILE ?auto_326700 ?auto_326701 ?auto_326702 ?auto_326703 ?auto_326704 ?auto_326705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_326726 - BLOCK
      ?auto_326727 - BLOCK
      ?auto_326728 - BLOCK
      ?auto_326729 - BLOCK
      ?auto_326730 - BLOCK
      ?auto_326731 - BLOCK
    )
    :vars
    (
      ?auto_326732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326731 ?auto_326732 ) ( not ( = ?auto_326726 ?auto_326727 ) ) ( not ( = ?auto_326726 ?auto_326728 ) ) ( not ( = ?auto_326726 ?auto_326729 ) ) ( not ( = ?auto_326726 ?auto_326730 ) ) ( not ( = ?auto_326726 ?auto_326731 ) ) ( not ( = ?auto_326726 ?auto_326732 ) ) ( not ( = ?auto_326727 ?auto_326728 ) ) ( not ( = ?auto_326727 ?auto_326729 ) ) ( not ( = ?auto_326727 ?auto_326730 ) ) ( not ( = ?auto_326727 ?auto_326731 ) ) ( not ( = ?auto_326727 ?auto_326732 ) ) ( not ( = ?auto_326728 ?auto_326729 ) ) ( not ( = ?auto_326728 ?auto_326730 ) ) ( not ( = ?auto_326728 ?auto_326731 ) ) ( not ( = ?auto_326728 ?auto_326732 ) ) ( not ( = ?auto_326729 ?auto_326730 ) ) ( not ( = ?auto_326729 ?auto_326731 ) ) ( not ( = ?auto_326729 ?auto_326732 ) ) ( not ( = ?auto_326730 ?auto_326731 ) ) ( not ( = ?auto_326730 ?auto_326732 ) ) ( not ( = ?auto_326731 ?auto_326732 ) ) ( ON ?auto_326730 ?auto_326731 ) ( ON ?auto_326729 ?auto_326730 ) ( ON ?auto_326728 ?auto_326729 ) ( ON ?auto_326727 ?auto_326728 ) ( ON ?auto_326726 ?auto_326727 ) ( CLEAR ?auto_326726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326726 )
      ( MAKE-6PILE ?auto_326726 ?auto_326727 ?auto_326728 ?auto_326729 ?auto_326730 ?auto_326731 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326753 - BLOCK
      ?auto_326754 - BLOCK
      ?auto_326755 - BLOCK
      ?auto_326756 - BLOCK
      ?auto_326757 - BLOCK
      ?auto_326758 - BLOCK
      ?auto_326759 - BLOCK
    )
    :vars
    (
      ?auto_326760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326758 ) ( ON ?auto_326759 ?auto_326760 ) ( CLEAR ?auto_326759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326753 ) ( ON ?auto_326754 ?auto_326753 ) ( ON ?auto_326755 ?auto_326754 ) ( ON ?auto_326756 ?auto_326755 ) ( ON ?auto_326757 ?auto_326756 ) ( ON ?auto_326758 ?auto_326757 ) ( not ( = ?auto_326753 ?auto_326754 ) ) ( not ( = ?auto_326753 ?auto_326755 ) ) ( not ( = ?auto_326753 ?auto_326756 ) ) ( not ( = ?auto_326753 ?auto_326757 ) ) ( not ( = ?auto_326753 ?auto_326758 ) ) ( not ( = ?auto_326753 ?auto_326759 ) ) ( not ( = ?auto_326753 ?auto_326760 ) ) ( not ( = ?auto_326754 ?auto_326755 ) ) ( not ( = ?auto_326754 ?auto_326756 ) ) ( not ( = ?auto_326754 ?auto_326757 ) ) ( not ( = ?auto_326754 ?auto_326758 ) ) ( not ( = ?auto_326754 ?auto_326759 ) ) ( not ( = ?auto_326754 ?auto_326760 ) ) ( not ( = ?auto_326755 ?auto_326756 ) ) ( not ( = ?auto_326755 ?auto_326757 ) ) ( not ( = ?auto_326755 ?auto_326758 ) ) ( not ( = ?auto_326755 ?auto_326759 ) ) ( not ( = ?auto_326755 ?auto_326760 ) ) ( not ( = ?auto_326756 ?auto_326757 ) ) ( not ( = ?auto_326756 ?auto_326758 ) ) ( not ( = ?auto_326756 ?auto_326759 ) ) ( not ( = ?auto_326756 ?auto_326760 ) ) ( not ( = ?auto_326757 ?auto_326758 ) ) ( not ( = ?auto_326757 ?auto_326759 ) ) ( not ( = ?auto_326757 ?auto_326760 ) ) ( not ( = ?auto_326758 ?auto_326759 ) ) ( not ( = ?auto_326758 ?auto_326760 ) ) ( not ( = ?auto_326759 ?auto_326760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326759 ?auto_326760 )
      ( !STACK ?auto_326759 ?auto_326758 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326783 - BLOCK
      ?auto_326784 - BLOCK
      ?auto_326785 - BLOCK
      ?auto_326786 - BLOCK
      ?auto_326787 - BLOCK
      ?auto_326788 - BLOCK
      ?auto_326789 - BLOCK
    )
    :vars
    (
      ?auto_326790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326789 ?auto_326790 ) ( ON-TABLE ?auto_326783 ) ( ON ?auto_326784 ?auto_326783 ) ( ON ?auto_326785 ?auto_326784 ) ( ON ?auto_326786 ?auto_326785 ) ( ON ?auto_326787 ?auto_326786 ) ( not ( = ?auto_326783 ?auto_326784 ) ) ( not ( = ?auto_326783 ?auto_326785 ) ) ( not ( = ?auto_326783 ?auto_326786 ) ) ( not ( = ?auto_326783 ?auto_326787 ) ) ( not ( = ?auto_326783 ?auto_326788 ) ) ( not ( = ?auto_326783 ?auto_326789 ) ) ( not ( = ?auto_326783 ?auto_326790 ) ) ( not ( = ?auto_326784 ?auto_326785 ) ) ( not ( = ?auto_326784 ?auto_326786 ) ) ( not ( = ?auto_326784 ?auto_326787 ) ) ( not ( = ?auto_326784 ?auto_326788 ) ) ( not ( = ?auto_326784 ?auto_326789 ) ) ( not ( = ?auto_326784 ?auto_326790 ) ) ( not ( = ?auto_326785 ?auto_326786 ) ) ( not ( = ?auto_326785 ?auto_326787 ) ) ( not ( = ?auto_326785 ?auto_326788 ) ) ( not ( = ?auto_326785 ?auto_326789 ) ) ( not ( = ?auto_326785 ?auto_326790 ) ) ( not ( = ?auto_326786 ?auto_326787 ) ) ( not ( = ?auto_326786 ?auto_326788 ) ) ( not ( = ?auto_326786 ?auto_326789 ) ) ( not ( = ?auto_326786 ?auto_326790 ) ) ( not ( = ?auto_326787 ?auto_326788 ) ) ( not ( = ?auto_326787 ?auto_326789 ) ) ( not ( = ?auto_326787 ?auto_326790 ) ) ( not ( = ?auto_326788 ?auto_326789 ) ) ( not ( = ?auto_326788 ?auto_326790 ) ) ( not ( = ?auto_326789 ?auto_326790 ) ) ( CLEAR ?auto_326787 ) ( ON ?auto_326788 ?auto_326789 ) ( CLEAR ?auto_326788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_326783 ?auto_326784 ?auto_326785 ?auto_326786 ?auto_326787 ?auto_326788 )
      ( MAKE-7PILE ?auto_326783 ?auto_326784 ?auto_326785 ?auto_326786 ?auto_326787 ?auto_326788 ?auto_326789 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326813 - BLOCK
      ?auto_326814 - BLOCK
      ?auto_326815 - BLOCK
      ?auto_326816 - BLOCK
      ?auto_326817 - BLOCK
      ?auto_326818 - BLOCK
      ?auto_326819 - BLOCK
    )
    :vars
    (
      ?auto_326820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326819 ?auto_326820 ) ( ON-TABLE ?auto_326813 ) ( ON ?auto_326814 ?auto_326813 ) ( ON ?auto_326815 ?auto_326814 ) ( ON ?auto_326816 ?auto_326815 ) ( not ( = ?auto_326813 ?auto_326814 ) ) ( not ( = ?auto_326813 ?auto_326815 ) ) ( not ( = ?auto_326813 ?auto_326816 ) ) ( not ( = ?auto_326813 ?auto_326817 ) ) ( not ( = ?auto_326813 ?auto_326818 ) ) ( not ( = ?auto_326813 ?auto_326819 ) ) ( not ( = ?auto_326813 ?auto_326820 ) ) ( not ( = ?auto_326814 ?auto_326815 ) ) ( not ( = ?auto_326814 ?auto_326816 ) ) ( not ( = ?auto_326814 ?auto_326817 ) ) ( not ( = ?auto_326814 ?auto_326818 ) ) ( not ( = ?auto_326814 ?auto_326819 ) ) ( not ( = ?auto_326814 ?auto_326820 ) ) ( not ( = ?auto_326815 ?auto_326816 ) ) ( not ( = ?auto_326815 ?auto_326817 ) ) ( not ( = ?auto_326815 ?auto_326818 ) ) ( not ( = ?auto_326815 ?auto_326819 ) ) ( not ( = ?auto_326815 ?auto_326820 ) ) ( not ( = ?auto_326816 ?auto_326817 ) ) ( not ( = ?auto_326816 ?auto_326818 ) ) ( not ( = ?auto_326816 ?auto_326819 ) ) ( not ( = ?auto_326816 ?auto_326820 ) ) ( not ( = ?auto_326817 ?auto_326818 ) ) ( not ( = ?auto_326817 ?auto_326819 ) ) ( not ( = ?auto_326817 ?auto_326820 ) ) ( not ( = ?auto_326818 ?auto_326819 ) ) ( not ( = ?auto_326818 ?auto_326820 ) ) ( not ( = ?auto_326819 ?auto_326820 ) ) ( ON ?auto_326818 ?auto_326819 ) ( CLEAR ?auto_326816 ) ( ON ?auto_326817 ?auto_326818 ) ( CLEAR ?auto_326817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_326813 ?auto_326814 ?auto_326815 ?auto_326816 ?auto_326817 )
      ( MAKE-7PILE ?auto_326813 ?auto_326814 ?auto_326815 ?auto_326816 ?auto_326817 ?auto_326818 ?auto_326819 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326843 - BLOCK
      ?auto_326844 - BLOCK
      ?auto_326845 - BLOCK
      ?auto_326846 - BLOCK
      ?auto_326847 - BLOCK
      ?auto_326848 - BLOCK
      ?auto_326849 - BLOCK
    )
    :vars
    (
      ?auto_326850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326849 ?auto_326850 ) ( ON-TABLE ?auto_326843 ) ( ON ?auto_326844 ?auto_326843 ) ( ON ?auto_326845 ?auto_326844 ) ( not ( = ?auto_326843 ?auto_326844 ) ) ( not ( = ?auto_326843 ?auto_326845 ) ) ( not ( = ?auto_326843 ?auto_326846 ) ) ( not ( = ?auto_326843 ?auto_326847 ) ) ( not ( = ?auto_326843 ?auto_326848 ) ) ( not ( = ?auto_326843 ?auto_326849 ) ) ( not ( = ?auto_326843 ?auto_326850 ) ) ( not ( = ?auto_326844 ?auto_326845 ) ) ( not ( = ?auto_326844 ?auto_326846 ) ) ( not ( = ?auto_326844 ?auto_326847 ) ) ( not ( = ?auto_326844 ?auto_326848 ) ) ( not ( = ?auto_326844 ?auto_326849 ) ) ( not ( = ?auto_326844 ?auto_326850 ) ) ( not ( = ?auto_326845 ?auto_326846 ) ) ( not ( = ?auto_326845 ?auto_326847 ) ) ( not ( = ?auto_326845 ?auto_326848 ) ) ( not ( = ?auto_326845 ?auto_326849 ) ) ( not ( = ?auto_326845 ?auto_326850 ) ) ( not ( = ?auto_326846 ?auto_326847 ) ) ( not ( = ?auto_326846 ?auto_326848 ) ) ( not ( = ?auto_326846 ?auto_326849 ) ) ( not ( = ?auto_326846 ?auto_326850 ) ) ( not ( = ?auto_326847 ?auto_326848 ) ) ( not ( = ?auto_326847 ?auto_326849 ) ) ( not ( = ?auto_326847 ?auto_326850 ) ) ( not ( = ?auto_326848 ?auto_326849 ) ) ( not ( = ?auto_326848 ?auto_326850 ) ) ( not ( = ?auto_326849 ?auto_326850 ) ) ( ON ?auto_326848 ?auto_326849 ) ( ON ?auto_326847 ?auto_326848 ) ( CLEAR ?auto_326845 ) ( ON ?auto_326846 ?auto_326847 ) ( CLEAR ?auto_326846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_326843 ?auto_326844 ?auto_326845 ?auto_326846 )
      ( MAKE-7PILE ?auto_326843 ?auto_326844 ?auto_326845 ?auto_326846 ?auto_326847 ?auto_326848 ?auto_326849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326873 - BLOCK
      ?auto_326874 - BLOCK
      ?auto_326875 - BLOCK
      ?auto_326876 - BLOCK
      ?auto_326877 - BLOCK
      ?auto_326878 - BLOCK
      ?auto_326879 - BLOCK
    )
    :vars
    (
      ?auto_326880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326879 ?auto_326880 ) ( ON-TABLE ?auto_326873 ) ( ON ?auto_326874 ?auto_326873 ) ( not ( = ?auto_326873 ?auto_326874 ) ) ( not ( = ?auto_326873 ?auto_326875 ) ) ( not ( = ?auto_326873 ?auto_326876 ) ) ( not ( = ?auto_326873 ?auto_326877 ) ) ( not ( = ?auto_326873 ?auto_326878 ) ) ( not ( = ?auto_326873 ?auto_326879 ) ) ( not ( = ?auto_326873 ?auto_326880 ) ) ( not ( = ?auto_326874 ?auto_326875 ) ) ( not ( = ?auto_326874 ?auto_326876 ) ) ( not ( = ?auto_326874 ?auto_326877 ) ) ( not ( = ?auto_326874 ?auto_326878 ) ) ( not ( = ?auto_326874 ?auto_326879 ) ) ( not ( = ?auto_326874 ?auto_326880 ) ) ( not ( = ?auto_326875 ?auto_326876 ) ) ( not ( = ?auto_326875 ?auto_326877 ) ) ( not ( = ?auto_326875 ?auto_326878 ) ) ( not ( = ?auto_326875 ?auto_326879 ) ) ( not ( = ?auto_326875 ?auto_326880 ) ) ( not ( = ?auto_326876 ?auto_326877 ) ) ( not ( = ?auto_326876 ?auto_326878 ) ) ( not ( = ?auto_326876 ?auto_326879 ) ) ( not ( = ?auto_326876 ?auto_326880 ) ) ( not ( = ?auto_326877 ?auto_326878 ) ) ( not ( = ?auto_326877 ?auto_326879 ) ) ( not ( = ?auto_326877 ?auto_326880 ) ) ( not ( = ?auto_326878 ?auto_326879 ) ) ( not ( = ?auto_326878 ?auto_326880 ) ) ( not ( = ?auto_326879 ?auto_326880 ) ) ( ON ?auto_326878 ?auto_326879 ) ( ON ?auto_326877 ?auto_326878 ) ( ON ?auto_326876 ?auto_326877 ) ( CLEAR ?auto_326874 ) ( ON ?auto_326875 ?auto_326876 ) ( CLEAR ?auto_326875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_326873 ?auto_326874 ?auto_326875 )
      ( MAKE-7PILE ?auto_326873 ?auto_326874 ?auto_326875 ?auto_326876 ?auto_326877 ?auto_326878 ?auto_326879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326903 - BLOCK
      ?auto_326904 - BLOCK
      ?auto_326905 - BLOCK
      ?auto_326906 - BLOCK
      ?auto_326907 - BLOCK
      ?auto_326908 - BLOCK
      ?auto_326909 - BLOCK
    )
    :vars
    (
      ?auto_326910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326909 ?auto_326910 ) ( ON-TABLE ?auto_326903 ) ( not ( = ?auto_326903 ?auto_326904 ) ) ( not ( = ?auto_326903 ?auto_326905 ) ) ( not ( = ?auto_326903 ?auto_326906 ) ) ( not ( = ?auto_326903 ?auto_326907 ) ) ( not ( = ?auto_326903 ?auto_326908 ) ) ( not ( = ?auto_326903 ?auto_326909 ) ) ( not ( = ?auto_326903 ?auto_326910 ) ) ( not ( = ?auto_326904 ?auto_326905 ) ) ( not ( = ?auto_326904 ?auto_326906 ) ) ( not ( = ?auto_326904 ?auto_326907 ) ) ( not ( = ?auto_326904 ?auto_326908 ) ) ( not ( = ?auto_326904 ?auto_326909 ) ) ( not ( = ?auto_326904 ?auto_326910 ) ) ( not ( = ?auto_326905 ?auto_326906 ) ) ( not ( = ?auto_326905 ?auto_326907 ) ) ( not ( = ?auto_326905 ?auto_326908 ) ) ( not ( = ?auto_326905 ?auto_326909 ) ) ( not ( = ?auto_326905 ?auto_326910 ) ) ( not ( = ?auto_326906 ?auto_326907 ) ) ( not ( = ?auto_326906 ?auto_326908 ) ) ( not ( = ?auto_326906 ?auto_326909 ) ) ( not ( = ?auto_326906 ?auto_326910 ) ) ( not ( = ?auto_326907 ?auto_326908 ) ) ( not ( = ?auto_326907 ?auto_326909 ) ) ( not ( = ?auto_326907 ?auto_326910 ) ) ( not ( = ?auto_326908 ?auto_326909 ) ) ( not ( = ?auto_326908 ?auto_326910 ) ) ( not ( = ?auto_326909 ?auto_326910 ) ) ( ON ?auto_326908 ?auto_326909 ) ( ON ?auto_326907 ?auto_326908 ) ( ON ?auto_326906 ?auto_326907 ) ( ON ?auto_326905 ?auto_326906 ) ( CLEAR ?auto_326903 ) ( ON ?auto_326904 ?auto_326905 ) ( CLEAR ?auto_326904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_326903 ?auto_326904 )
      ( MAKE-7PILE ?auto_326903 ?auto_326904 ?auto_326905 ?auto_326906 ?auto_326907 ?auto_326908 ?auto_326909 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_326933 - BLOCK
      ?auto_326934 - BLOCK
      ?auto_326935 - BLOCK
      ?auto_326936 - BLOCK
      ?auto_326937 - BLOCK
      ?auto_326938 - BLOCK
      ?auto_326939 - BLOCK
    )
    :vars
    (
      ?auto_326940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_326939 ?auto_326940 ) ( not ( = ?auto_326933 ?auto_326934 ) ) ( not ( = ?auto_326933 ?auto_326935 ) ) ( not ( = ?auto_326933 ?auto_326936 ) ) ( not ( = ?auto_326933 ?auto_326937 ) ) ( not ( = ?auto_326933 ?auto_326938 ) ) ( not ( = ?auto_326933 ?auto_326939 ) ) ( not ( = ?auto_326933 ?auto_326940 ) ) ( not ( = ?auto_326934 ?auto_326935 ) ) ( not ( = ?auto_326934 ?auto_326936 ) ) ( not ( = ?auto_326934 ?auto_326937 ) ) ( not ( = ?auto_326934 ?auto_326938 ) ) ( not ( = ?auto_326934 ?auto_326939 ) ) ( not ( = ?auto_326934 ?auto_326940 ) ) ( not ( = ?auto_326935 ?auto_326936 ) ) ( not ( = ?auto_326935 ?auto_326937 ) ) ( not ( = ?auto_326935 ?auto_326938 ) ) ( not ( = ?auto_326935 ?auto_326939 ) ) ( not ( = ?auto_326935 ?auto_326940 ) ) ( not ( = ?auto_326936 ?auto_326937 ) ) ( not ( = ?auto_326936 ?auto_326938 ) ) ( not ( = ?auto_326936 ?auto_326939 ) ) ( not ( = ?auto_326936 ?auto_326940 ) ) ( not ( = ?auto_326937 ?auto_326938 ) ) ( not ( = ?auto_326937 ?auto_326939 ) ) ( not ( = ?auto_326937 ?auto_326940 ) ) ( not ( = ?auto_326938 ?auto_326939 ) ) ( not ( = ?auto_326938 ?auto_326940 ) ) ( not ( = ?auto_326939 ?auto_326940 ) ) ( ON ?auto_326938 ?auto_326939 ) ( ON ?auto_326937 ?auto_326938 ) ( ON ?auto_326936 ?auto_326937 ) ( ON ?auto_326935 ?auto_326936 ) ( ON ?auto_326934 ?auto_326935 ) ( ON ?auto_326933 ?auto_326934 ) ( CLEAR ?auto_326933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_326933 )
      ( MAKE-7PILE ?auto_326933 ?auto_326934 ?auto_326935 ?auto_326936 ?auto_326937 ?auto_326938 ?auto_326939 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_326964 - BLOCK
      ?auto_326965 - BLOCK
      ?auto_326966 - BLOCK
      ?auto_326967 - BLOCK
      ?auto_326968 - BLOCK
      ?auto_326969 - BLOCK
      ?auto_326970 - BLOCK
      ?auto_326971 - BLOCK
    )
    :vars
    (
      ?auto_326972 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_326970 ) ( ON ?auto_326971 ?auto_326972 ) ( CLEAR ?auto_326971 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_326964 ) ( ON ?auto_326965 ?auto_326964 ) ( ON ?auto_326966 ?auto_326965 ) ( ON ?auto_326967 ?auto_326966 ) ( ON ?auto_326968 ?auto_326967 ) ( ON ?auto_326969 ?auto_326968 ) ( ON ?auto_326970 ?auto_326969 ) ( not ( = ?auto_326964 ?auto_326965 ) ) ( not ( = ?auto_326964 ?auto_326966 ) ) ( not ( = ?auto_326964 ?auto_326967 ) ) ( not ( = ?auto_326964 ?auto_326968 ) ) ( not ( = ?auto_326964 ?auto_326969 ) ) ( not ( = ?auto_326964 ?auto_326970 ) ) ( not ( = ?auto_326964 ?auto_326971 ) ) ( not ( = ?auto_326964 ?auto_326972 ) ) ( not ( = ?auto_326965 ?auto_326966 ) ) ( not ( = ?auto_326965 ?auto_326967 ) ) ( not ( = ?auto_326965 ?auto_326968 ) ) ( not ( = ?auto_326965 ?auto_326969 ) ) ( not ( = ?auto_326965 ?auto_326970 ) ) ( not ( = ?auto_326965 ?auto_326971 ) ) ( not ( = ?auto_326965 ?auto_326972 ) ) ( not ( = ?auto_326966 ?auto_326967 ) ) ( not ( = ?auto_326966 ?auto_326968 ) ) ( not ( = ?auto_326966 ?auto_326969 ) ) ( not ( = ?auto_326966 ?auto_326970 ) ) ( not ( = ?auto_326966 ?auto_326971 ) ) ( not ( = ?auto_326966 ?auto_326972 ) ) ( not ( = ?auto_326967 ?auto_326968 ) ) ( not ( = ?auto_326967 ?auto_326969 ) ) ( not ( = ?auto_326967 ?auto_326970 ) ) ( not ( = ?auto_326967 ?auto_326971 ) ) ( not ( = ?auto_326967 ?auto_326972 ) ) ( not ( = ?auto_326968 ?auto_326969 ) ) ( not ( = ?auto_326968 ?auto_326970 ) ) ( not ( = ?auto_326968 ?auto_326971 ) ) ( not ( = ?auto_326968 ?auto_326972 ) ) ( not ( = ?auto_326969 ?auto_326970 ) ) ( not ( = ?auto_326969 ?auto_326971 ) ) ( not ( = ?auto_326969 ?auto_326972 ) ) ( not ( = ?auto_326970 ?auto_326971 ) ) ( not ( = ?auto_326970 ?auto_326972 ) ) ( not ( = ?auto_326971 ?auto_326972 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_326971 ?auto_326972 )
      ( !STACK ?auto_326971 ?auto_326970 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_326998 - BLOCK
      ?auto_326999 - BLOCK
      ?auto_327000 - BLOCK
      ?auto_327001 - BLOCK
      ?auto_327002 - BLOCK
      ?auto_327003 - BLOCK
      ?auto_327004 - BLOCK
      ?auto_327005 - BLOCK
    )
    :vars
    (
      ?auto_327006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327005 ?auto_327006 ) ( ON-TABLE ?auto_326998 ) ( ON ?auto_326999 ?auto_326998 ) ( ON ?auto_327000 ?auto_326999 ) ( ON ?auto_327001 ?auto_327000 ) ( ON ?auto_327002 ?auto_327001 ) ( ON ?auto_327003 ?auto_327002 ) ( not ( = ?auto_326998 ?auto_326999 ) ) ( not ( = ?auto_326998 ?auto_327000 ) ) ( not ( = ?auto_326998 ?auto_327001 ) ) ( not ( = ?auto_326998 ?auto_327002 ) ) ( not ( = ?auto_326998 ?auto_327003 ) ) ( not ( = ?auto_326998 ?auto_327004 ) ) ( not ( = ?auto_326998 ?auto_327005 ) ) ( not ( = ?auto_326998 ?auto_327006 ) ) ( not ( = ?auto_326999 ?auto_327000 ) ) ( not ( = ?auto_326999 ?auto_327001 ) ) ( not ( = ?auto_326999 ?auto_327002 ) ) ( not ( = ?auto_326999 ?auto_327003 ) ) ( not ( = ?auto_326999 ?auto_327004 ) ) ( not ( = ?auto_326999 ?auto_327005 ) ) ( not ( = ?auto_326999 ?auto_327006 ) ) ( not ( = ?auto_327000 ?auto_327001 ) ) ( not ( = ?auto_327000 ?auto_327002 ) ) ( not ( = ?auto_327000 ?auto_327003 ) ) ( not ( = ?auto_327000 ?auto_327004 ) ) ( not ( = ?auto_327000 ?auto_327005 ) ) ( not ( = ?auto_327000 ?auto_327006 ) ) ( not ( = ?auto_327001 ?auto_327002 ) ) ( not ( = ?auto_327001 ?auto_327003 ) ) ( not ( = ?auto_327001 ?auto_327004 ) ) ( not ( = ?auto_327001 ?auto_327005 ) ) ( not ( = ?auto_327001 ?auto_327006 ) ) ( not ( = ?auto_327002 ?auto_327003 ) ) ( not ( = ?auto_327002 ?auto_327004 ) ) ( not ( = ?auto_327002 ?auto_327005 ) ) ( not ( = ?auto_327002 ?auto_327006 ) ) ( not ( = ?auto_327003 ?auto_327004 ) ) ( not ( = ?auto_327003 ?auto_327005 ) ) ( not ( = ?auto_327003 ?auto_327006 ) ) ( not ( = ?auto_327004 ?auto_327005 ) ) ( not ( = ?auto_327004 ?auto_327006 ) ) ( not ( = ?auto_327005 ?auto_327006 ) ) ( CLEAR ?auto_327003 ) ( ON ?auto_327004 ?auto_327005 ) ( CLEAR ?auto_327004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_326998 ?auto_326999 ?auto_327000 ?auto_327001 ?auto_327002 ?auto_327003 ?auto_327004 )
      ( MAKE-8PILE ?auto_326998 ?auto_326999 ?auto_327000 ?auto_327001 ?auto_327002 ?auto_327003 ?auto_327004 ?auto_327005 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327032 - BLOCK
      ?auto_327033 - BLOCK
      ?auto_327034 - BLOCK
      ?auto_327035 - BLOCK
      ?auto_327036 - BLOCK
      ?auto_327037 - BLOCK
      ?auto_327038 - BLOCK
      ?auto_327039 - BLOCK
    )
    :vars
    (
      ?auto_327040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327039 ?auto_327040 ) ( ON-TABLE ?auto_327032 ) ( ON ?auto_327033 ?auto_327032 ) ( ON ?auto_327034 ?auto_327033 ) ( ON ?auto_327035 ?auto_327034 ) ( ON ?auto_327036 ?auto_327035 ) ( not ( = ?auto_327032 ?auto_327033 ) ) ( not ( = ?auto_327032 ?auto_327034 ) ) ( not ( = ?auto_327032 ?auto_327035 ) ) ( not ( = ?auto_327032 ?auto_327036 ) ) ( not ( = ?auto_327032 ?auto_327037 ) ) ( not ( = ?auto_327032 ?auto_327038 ) ) ( not ( = ?auto_327032 ?auto_327039 ) ) ( not ( = ?auto_327032 ?auto_327040 ) ) ( not ( = ?auto_327033 ?auto_327034 ) ) ( not ( = ?auto_327033 ?auto_327035 ) ) ( not ( = ?auto_327033 ?auto_327036 ) ) ( not ( = ?auto_327033 ?auto_327037 ) ) ( not ( = ?auto_327033 ?auto_327038 ) ) ( not ( = ?auto_327033 ?auto_327039 ) ) ( not ( = ?auto_327033 ?auto_327040 ) ) ( not ( = ?auto_327034 ?auto_327035 ) ) ( not ( = ?auto_327034 ?auto_327036 ) ) ( not ( = ?auto_327034 ?auto_327037 ) ) ( not ( = ?auto_327034 ?auto_327038 ) ) ( not ( = ?auto_327034 ?auto_327039 ) ) ( not ( = ?auto_327034 ?auto_327040 ) ) ( not ( = ?auto_327035 ?auto_327036 ) ) ( not ( = ?auto_327035 ?auto_327037 ) ) ( not ( = ?auto_327035 ?auto_327038 ) ) ( not ( = ?auto_327035 ?auto_327039 ) ) ( not ( = ?auto_327035 ?auto_327040 ) ) ( not ( = ?auto_327036 ?auto_327037 ) ) ( not ( = ?auto_327036 ?auto_327038 ) ) ( not ( = ?auto_327036 ?auto_327039 ) ) ( not ( = ?auto_327036 ?auto_327040 ) ) ( not ( = ?auto_327037 ?auto_327038 ) ) ( not ( = ?auto_327037 ?auto_327039 ) ) ( not ( = ?auto_327037 ?auto_327040 ) ) ( not ( = ?auto_327038 ?auto_327039 ) ) ( not ( = ?auto_327038 ?auto_327040 ) ) ( not ( = ?auto_327039 ?auto_327040 ) ) ( ON ?auto_327038 ?auto_327039 ) ( CLEAR ?auto_327036 ) ( ON ?auto_327037 ?auto_327038 ) ( CLEAR ?auto_327037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_327032 ?auto_327033 ?auto_327034 ?auto_327035 ?auto_327036 ?auto_327037 )
      ( MAKE-8PILE ?auto_327032 ?auto_327033 ?auto_327034 ?auto_327035 ?auto_327036 ?auto_327037 ?auto_327038 ?auto_327039 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327066 - BLOCK
      ?auto_327067 - BLOCK
      ?auto_327068 - BLOCK
      ?auto_327069 - BLOCK
      ?auto_327070 - BLOCK
      ?auto_327071 - BLOCK
      ?auto_327072 - BLOCK
      ?auto_327073 - BLOCK
    )
    :vars
    (
      ?auto_327074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327073 ?auto_327074 ) ( ON-TABLE ?auto_327066 ) ( ON ?auto_327067 ?auto_327066 ) ( ON ?auto_327068 ?auto_327067 ) ( ON ?auto_327069 ?auto_327068 ) ( not ( = ?auto_327066 ?auto_327067 ) ) ( not ( = ?auto_327066 ?auto_327068 ) ) ( not ( = ?auto_327066 ?auto_327069 ) ) ( not ( = ?auto_327066 ?auto_327070 ) ) ( not ( = ?auto_327066 ?auto_327071 ) ) ( not ( = ?auto_327066 ?auto_327072 ) ) ( not ( = ?auto_327066 ?auto_327073 ) ) ( not ( = ?auto_327066 ?auto_327074 ) ) ( not ( = ?auto_327067 ?auto_327068 ) ) ( not ( = ?auto_327067 ?auto_327069 ) ) ( not ( = ?auto_327067 ?auto_327070 ) ) ( not ( = ?auto_327067 ?auto_327071 ) ) ( not ( = ?auto_327067 ?auto_327072 ) ) ( not ( = ?auto_327067 ?auto_327073 ) ) ( not ( = ?auto_327067 ?auto_327074 ) ) ( not ( = ?auto_327068 ?auto_327069 ) ) ( not ( = ?auto_327068 ?auto_327070 ) ) ( not ( = ?auto_327068 ?auto_327071 ) ) ( not ( = ?auto_327068 ?auto_327072 ) ) ( not ( = ?auto_327068 ?auto_327073 ) ) ( not ( = ?auto_327068 ?auto_327074 ) ) ( not ( = ?auto_327069 ?auto_327070 ) ) ( not ( = ?auto_327069 ?auto_327071 ) ) ( not ( = ?auto_327069 ?auto_327072 ) ) ( not ( = ?auto_327069 ?auto_327073 ) ) ( not ( = ?auto_327069 ?auto_327074 ) ) ( not ( = ?auto_327070 ?auto_327071 ) ) ( not ( = ?auto_327070 ?auto_327072 ) ) ( not ( = ?auto_327070 ?auto_327073 ) ) ( not ( = ?auto_327070 ?auto_327074 ) ) ( not ( = ?auto_327071 ?auto_327072 ) ) ( not ( = ?auto_327071 ?auto_327073 ) ) ( not ( = ?auto_327071 ?auto_327074 ) ) ( not ( = ?auto_327072 ?auto_327073 ) ) ( not ( = ?auto_327072 ?auto_327074 ) ) ( not ( = ?auto_327073 ?auto_327074 ) ) ( ON ?auto_327072 ?auto_327073 ) ( ON ?auto_327071 ?auto_327072 ) ( CLEAR ?auto_327069 ) ( ON ?auto_327070 ?auto_327071 ) ( CLEAR ?auto_327070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_327066 ?auto_327067 ?auto_327068 ?auto_327069 ?auto_327070 )
      ( MAKE-8PILE ?auto_327066 ?auto_327067 ?auto_327068 ?auto_327069 ?auto_327070 ?auto_327071 ?auto_327072 ?auto_327073 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327100 - BLOCK
      ?auto_327101 - BLOCK
      ?auto_327102 - BLOCK
      ?auto_327103 - BLOCK
      ?auto_327104 - BLOCK
      ?auto_327105 - BLOCK
      ?auto_327106 - BLOCK
      ?auto_327107 - BLOCK
    )
    :vars
    (
      ?auto_327108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327107 ?auto_327108 ) ( ON-TABLE ?auto_327100 ) ( ON ?auto_327101 ?auto_327100 ) ( ON ?auto_327102 ?auto_327101 ) ( not ( = ?auto_327100 ?auto_327101 ) ) ( not ( = ?auto_327100 ?auto_327102 ) ) ( not ( = ?auto_327100 ?auto_327103 ) ) ( not ( = ?auto_327100 ?auto_327104 ) ) ( not ( = ?auto_327100 ?auto_327105 ) ) ( not ( = ?auto_327100 ?auto_327106 ) ) ( not ( = ?auto_327100 ?auto_327107 ) ) ( not ( = ?auto_327100 ?auto_327108 ) ) ( not ( = ?auto_327101 ?auto_327102 ) ) ( not ( = ?auto_327101 ?auto_327103 ) ) ( not ( = ?auto_327101 ?auto_327104 ) ) ( not ( = ?auto_327101 ?auto_327105 ) ) ( not ( = ?auto_327101 ?auto_327106 ) ) ( not ( = ?auto_327101 ?auto_327107 ) ) ( not ( = ?auto_327101 ?auto_327108 ) ) ( not ( = ?auto_327102 ?auto_327103 ) ) ( not ( = ?auto_327102 ?auto_327104 ) ) ( not ( = ?auto_327102 ?auto_327105 ) ) ( not ( = ?auto_327102 ?auto_327106 ) ) ( not ( = ?auto_327102 ?auto_327107 ) ) ( not ( = ?auto_327102 ?auto_327108 ) ) ( not ( = ?auto_327103 ?auto_327104 ) ) ( not ( = ?auto_327103 ?auto_327105 ) ) ( not ( = ?auto_327103 ?auto_327106 ) ) ( not ( = ?auto_327103 ?auto_327107 ) ) ( not ( = ?auto_327103 ?auto_327108 ) ) ( not ( = ?auto_327104 ?auto_327105 ) ) ( not ( = ?auto_327104 ?auto_327106 ) ) ( not ( = ?auto_327104 ?auto_327107 ) ) ( not ( = ?auto_327104 ?auto_327108 ) ) ( not ( = ?auto_327105 ?auto_327106 ) ) ( not ( = ?auto_327105 ?auto_327107 ) ) ( not ( = ?auto_327105 ?auto_327108 ) ) ( not ( = ?auto_327106 ?auto_327107 ) ) ( not ( = ?auto_327106 ?auto_327108 ) ) ( not ( = ?auto_327107 ?auto_327108 ) ) ( ON ?auto_327106 ?auto_327107 ) ( ON ?auto_327105 ?auto_327106 ) ( ON ?auto_327104 ?auto_327105 ) ( CLEAR ?auto_327102 ) ( ON ?auto_327103 ?auto_327104 ) ( CLEAR ?auto_327103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_327100 ?auto_327101 ?auto_327102 ?auto_327103 )
      ( MAKE-8PILE ?auto_327100 ?auto_327101 ?auto_327102 ?auto_327103 ?auto_327104 ?auto_327105 ?auto_327106 ?auto_327107 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327134 - BLOCK
      ?auto_327135 - BLOCK
      ?auto_327136 - BLOCK
      ?auto_327137 - BLOCK
      ?auto_327138 - BLOCK
      ?auto_327139 - BLOCK
      ?auto_327140 - BLOCK
      ?auto_327141 - BLOCK
    )
    :vars
    (
      ?auto_327142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327141 ?auto_327142 ) ( ON-TABLE ?auto_327134 ) ( ON ?auto_327135 ?auto_327134 ) ( not ( = ?auto_327134 ?auto_327135 ) ) ( not ( = ?auto_327134 ?auto_327136 ) ) ( not ( = ?auto_327134 ?auto_327137 ) ) ( not ( = ?auto_327134 ?auto_327138 ) ) ( not ( = ?auto_327134 ?auto_327139 ) ) ( not ( = ?auto_327134 ?auto_327140 ) ) ( not ( = ?auto_327134 ?auto_327141 ) ) ( not ( = ?auto_327134 ?auto_327142 ) ) ( not ( = ?auto_327135 ?auto_327136 ) ) ( not ( = ?auto_327135 ?auto_327137 ) ) ( not ( = ?auto_327135 ?auto_327138 ) ) ( not ( = ?auto_327135 ?auto_327139 ) ) ( not ( = ?auto_327135 ?auto_327140 ) ) ( not ( = ?auto_327135 ?auto_327141 ) ) ( not ( = ?auto_327135 ?auto_327142 ) ) ( not ( = ?auto_327136 ?auto_327137 ) ) ( not ( = ?auto_327136 ?auto_327138 ) ) ( not ( = ?auto_327136 ?auto_327139 ) ) ( not ( = ?auto_327136 ?auto_327140 ) ) ( not ( = ?auto_327136 ?auto_327141 ) ) ( not ( = ?auto_327136 ?auto_327142 ) ) ( not ( = ?auto_327137 ?auto_327138 ) ) ( not ( = ?auto_327137 ?auto_327139 ) ) ( not ( = ?auto_327137 ?auto_327140 ) ) ( not ( = ?auto_327137 ?auto_327141 ) ) ( not ( = ?auto_327137 ?auto_327142 ) ) ( not ( = ?auto_327138 ?auto_327139 ) ) ( not ( = ?auto_327138 ?auto_327140 ) ) ( not ( = ?auto_327138 ?auto_327141 ) ) ( not ( = ?auto_327138 ?auto_327142 ) ) ( not ( = ?auto_327139 ?auto_327140 ) ) ( not ( = ?auto_327139 ?auto_327141 ) ) ( not ( = ?auto_327139 ?auto_327142 ) ) ( not ( = ?auto_327140 ?auto_327141 ) ) ( not ( = ?auto_327140 ?auto_327142 ) ) ( not ( = ?auto_327141 ?auto_327142 ) ) ( ON ?auto_327140 ?auto_327141 ) ( ON ?auto_327139 ?auto_327140 ) ( ON ?auto_327138 ?auto_327139 ) ( ON ?auto_327137 ?auto_327138 ) ( CLEAR ?auto_327135 ) ( ON ?auto_327136 ?auto_327137 ) ( CLEAR ?auto_327136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_327134 ?auto_327135 ?auto_327136 )
      ( MAKE-8PILE ?auto_327134 ?auto_327135 ?auto_327136 ?auto_327137 ?auto_327138 ?auto_327139 ?auto_327140 ?auto_327141 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327168 - BLOCK
      ?auto_327169 - BLOCK
      ?auto_327170 - BLOCK
      ?auto_327171 - BLOCK
      ?auto_327172 - BLOCK
      ?auto_327173 - BLOCK
      ?auto_327174 - BLOCK
      ?auto_327175 - BLOCK
    )
    :vars
    (
      ?auto_327176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327175 ?auto_327176 ) ( ON-TABLE ?auto_327168 ) ( not ( = ?auto_327168 ?auto_327169 ) ) ( not ( = ?auto_327168 ?auto_327170 ) ) ( not ( = ?auto_327168 ?auto_327171 ) ) ( not ( = ?auto_327168 ?auto_327172 ) ) ( not ( = ?auto_327168 ?auto_327173 ) ) ( not ( = ?auto_327168 ?auto_327174 ) ) ( not ( = ?auto_327168 ?auto_327175 ) ) ( not ( = ?auto_327168 ?auto_327176 ) ) ( not ( = ?auto_327169 ?auto_327170 ) ) ( not ( = ?auto_327169 ?auto_327171 ) ) ( not ( = ?auto_327169 ?auto_327172 ) ) ( not ( = ?auto_327169 ?auto_327173 ) ) ( not ( = ?auto_327169 ?auto_327174 ) ) ( not ( = ?auto_327169 ?auto_327175 ) ) ( not ( = ?auto_327169 ?auto_327176 ) ) ( not ( = ?auto_327170 ?auto_327171 ) ) ( not ( = ?auto_327170 ?auto_327172 ) ) ( not ( = ?auto_327170 ?auto_327173 ) ) ( not ( = ?auto_327170 ?auto_327174 ) ) ( not ( = ?auto_327170 ?auto_327175 ) ) ( not ( = ?auto_327170 ?auto_327176 ) ) ( not ( = ?auto_327171 ?auto_327172 ) ) ( not ( = ?auto_327171 ?auto_327173 ) ) ( not ( = ?auto_327171 ?auto_327174 ) ) ( not ( = ?auto_327171 ?auto_327175 ) ) ( not ( = ?auto_327171 ?auto_327176 ) ) ( not ( = ?auto_327172 ?auto_327173 ) ) ( not ( = ?auto_327172 ?auto_327174 ) ) ( not ( = ?auto_327172 ?auto_327175 ) ) ( not ( = ?auto_327172 ?auto_327176 ) ) ( not ( = ?auto_327173 ?auto_327174 ) ) ( not ( = ?auto_327173 ?auto_327175 ) ) ( not ( = ?auto_327173 ?auto_327176 ) ) ( not ( = ?auto_327174 ?auto_327175 ) ) ( not ( = ?auto_327174 ?auto_327176 ) ) ( not ( = ?auto_327175 ?auto_327176 ) ) ( ON ?auto_327174 ?auto_327175 ) ( ON ?auto_327173 ?auto_327174 ) ( ON ?auto_327172 ?auto_327173 ) ( ON ?auto_327171 ?auto_327172 ) ( ON ?auto_327170 ?auto_327171 ) ( CLEAR ?auto_327168 ) ( ON ?auto_327169 ?auto_327170 ) ( CLEAR ?auto_327169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_327168 ?auto_327169 )
      ( MAKE-8PILE ?auto_327168 ?auto_327169 ?auto_327170 ?auto_327171 ?auto_327172 ?auto_327173 ?auto_327174 ?auto_327175 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_327202 - BLOCK
      ?auto_327203 - BLOCK
      ?auto_327204 - BLOCK
      ?auto_327205 - BLOCK
      ?auto_327206 - BLOCK
      ?auto_327207 - BLOCK
      ?auto_327208 - BLOCK
      ?auto_327209 - BLOCK
    )
    :vars
    (
      ?auto_327210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327209 ?auto_327210 ) ( not ( = ?auto_327202 ?auto_327203 ) ) ( not ( = ?auto_327202 ?auto_327204 ) ) ( not ( = ?auto_327202 ?auto_327205 ) ) ( not ( = ?auto_327202 ?auto_327206 ) ) ( not ( = ?auto_327202 ?auto_327207 ) ) ( not ( = ?auto_327202 ?auto_327208 ) ) ( not ( = ?auto_327202 ?auto_327209 ) ) ( not ( = ?auto_327202 ?auto_327210 ) ) ( not ( = ?auto_327203 ?auto_327204 ) ) ( not ( = ?auto_327203 ?auto_327205 ) ) ( not ( = ?auto_327203 ?auto_327206 ) ) ( not ( = ?auto_327203 ?auto_327207 ) ) ( not ( = ?auto_327203 ?auto_327208 ) ) ( not ( = ?auto_327203 ?auto_327209 ) ) ( not ( = ?auto_327203 ?auto_327210 ) ) ( not ( = ?auto_327204 ?auto_327205 ) ) ( not ( = ?auto_327204 ?auto_327206 ) ) ( not ( = ?auto_327204 ?auto_327207 ) ) ( not ( = ?auto_327204 ?auto_327208 ) ) ( not ( = ?auto_327204 ?auto_327209 ) ) ( not ( = ?auto_327204 ?auto_327210 ) ) ( not ( = ?auto_327205 ?auto_327206 ) ) ( not ( = ?auto_327205 ?auto_327207 ) ) ( not ( = ?auto_327205 ?auto_327208 ) ) ( not ( = ?auto_327205 ?auto_327209 ) ) ( not ( = ?auto_327205 ?auto_327210 ) ) ( not ( = ?auto_327206 ?auto_327207 ) ) ( not ( = ?auto_327206 ?auto_327208 ) ) ( not ( = ?auto_327206 ?auto_327209 ) ) ( not ( = ?auto_327206 ?auto_327210 ) ) ( not ( = ?auto_327207 ?auto_327208 ) ) ( not ( = ?auto_327207 ?auto_327209 ) ) ( not ( = ?auto_327207 ?auto_327210 ) ) ( not ( = ?auto_327208 ?auto_327209 ) ) ( not ( = ?auto_327208 ?auto_327210 ) ) ( not ( = ?auto_327209 ?auto_327210 ) ) ( ON ?auto_327208 ?auto_327209 ) ( ON ?auto_327207 ?auto_327208 ) ( ON ?auto_327206 ?auto_327207 ) ( ON ?auto_327205 ?auto_327206 ) ( ON ?auto_327204 ?auto_327205 ) ( ON ?auto_327203 ?auto_327204 ) ( ON ?auto_327202 ?auto_327203 ) ( CLEAR ?auto_327202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_327202 )
      ( MAKE-8PILE ?auto_327202 ?auto_327203 ?auto_327204 ?auto_327205 ?auto_327206 ?auto_327207 ?auto_327208 ?auto_327209 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327237 - BLOCK
      ?auto_327238 - BLOCK
      ?auto_327239 - BLOCK
      ?auto_327240 - BLOCK
      ?auto_327241 - BLOCK
      ?auto_327242 - BLOCK
      ?auto_327243 - BLOCK
      ?auto_327244 - BLOCK
      ?auto_327245 - BLOCK
    )
    :vars
    (
      ?auto_327246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_327244 ) ( ON ?auto_327245 ?auto_327246 ) ( CLEAR ?auto_327245 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_327237 ) ( ON ?auto_327238 ?auto_327237 ) ( ON ?auto_327239 ?auto_327238 ) ( ON ?auto_327240 ?auto_327239 ) ( ON ?auto_327241 ?auto_327240 ) ( ON ?auto_327242 ?auto_327241 ) ( ON ?auto_327243 ?auto_327242 ) ( ON ?auto_327244 ?auto_327243 ) ( not ( = ?auto_327237 ?auto_327238 ) ) ( not ( = ?auto_327237 ?auto_327239 ) ) ( not ( = ?auto_327237 ?auto_327240 ) ) ( not ( = ?auto_327237 ?auto_327241 ) ) ( not ( = ?auto_327237 ?auto_327242 ) ) ( not ( = ?auto_327237 ?auto_327243 ) ) ( not ( = ?auto_327237 ?auto_327244 ) ) ( not ( = ?auto_327237 ?auto_327245 ) ) ( not ( = ?auto_327237 ?auto_327246 ) ) ( not ( = ?auto_327238 ?auto_327239 ) ) ( not ( = ?auto_327238 ?auto_327240 ) ) ( not ( = ?auto_327238 ?auto_327241 ) ) ( not ( = ?auto_327238 ?auto_327242 ) ) ( not ( = ?auto_327238 ?auto_327243 ) ) ( not ( = ?auto_327238 ?auto_327244 ) ) ( not ( = ?auto_327238 ?auto_327245 ) ) ( not ( = ?auto_327238 ?auto_327246 ) ) ( not ( = ?auto_327239 ?auto_327240 ) ) ( not ( = ?auto_327239 ?auto_327241 ) ) ( not ( = ?auto_327239 ?auto_327242 ) ) ( not ( = ?auto_327239 ?auto_327243 ) ) ( not ( = ?auto_327239 ?auto_327244 ) ) ( not ( = ?auto_327239 ?auto_327245 ) ) ( not ( = ?auto_327239 ?auto_327246 ) ) ( not ( = ?auto_327240 ?auto_327241 ) ) ( not ( = ?auto_327240 ?auto_327242 ) ) ( not ( = ?auto_327240 ?auto_327243 ) ) ( not ( = ?auto_327240 ?auto_327244 ) ) ( not ( = ?auto_327240 ?auto_327245 ) ) ( not ( = ?auto_327240 ?auto_327246 ) ) ( not ( = ?auto_327241 ?auto_327242 ) ) ( not ( = ?auto_327241 ?auto_327243 ) ) ( not ( = ?auto_327241 ?auto_327244 ) ) ( not ( = ?auto_327241 ?auto_327245 ) ) ( not ( = ?auto_327241 ?auto_327246 ) ) ( not ( = ?auto_327242 ?auto_327243 ) ) ( not ( = ?auto_327242 ?auto_327244 ) ) ( not ( = ?auto_327242 ?auto_327245 ) ) ( not ( = ?auto_327242 ?auto_327246 ) ) ( not ( = ?auto_327243 ?auto_327244 ) ) ( not ( = ?auto_327243 ?auto_327245 ) ) ( not ( = ?auto_327243 ?auto_327246 ) ) ( not ( = ?auto_327244 ?auto_327245 ) ) ( not ( = ?auto_327244 ?auto_327246 ) ) ( not ( = ?auto_327245 ?auto_327246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_327245 ?auto_327246 )
      ( !STACK ?auto_327245 ?auto_327244 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327275 - BLOCK
      ?auto_327276 - BLOCK
      ?auto_327277 - BLOCK
      ?auto_327278 - BLOCK
      ?auto_327279 - BLOCK
      ?auto_327280 - BLOCK
      ?auto_327281 - BLOCK
      ?auto_327282 - BLOCK
      ?auto_327283 - BLOCK
    )
    :vars
    (
      ?auto_327284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327283 ?auto_327284 ) ( ON-TABLE ?auto_327275 ) ( ON ?auto_327276 ?auto_327275 ) ( ON ?auto_327277 ?auto_327276 ) ( ON ?auto_327278 ?auto_327277 ) ( ON ?auto_327279 ?auto_327278 ) ( ON ?auto_327280 ?auto_327279 ) ( ON ?auto_327281 ?auto_327280 ) ( not ( = ?auto_327275 ?auto_327276 ) ) ( not ( = ?auto_327275 ?auto_327277 ) ) ( not ( = ?auto_327275 ?auto_327278 ) ) ( not ( = ?auto_327275 ?auto_327279 ) ) ( not ( = ?auto_327275 ?auto_327280 ) ) ( not ( = ?auto_327275 ?auto_327281 ) ) ( not ( = ?auto_327275 ?auto_327282 ) ) ( not ( = ?auto_327275 ?auto_327283 ) ) ( not ( = ?auto_327275 ?auto_327284 ) ) ( not ( = ?auto_327276 ?auto_327277 ) ) ( not ( = ?auto_327276 ?auto_327278 ) ) ( not ( = ?auto_327276 ?auto_327279 ) ) ( not ( = ?auto_327276 ?auto_327280 ) ) ( not ( = ?auto_327276 ?auto_327281 ) ) ( not ( = ?auto_327276 ?auto_327282 ) ) ( not ( = ?auto_327276 ?auto_327283 ) ) ( not ( = ?auto_327276 ?auto_327284 ) ) ( not ( = ?auto_327277 ?auto_327278 ) ) ( not ( = ?auto_327277 ?auto_327279 ) ) ( not ( = ?auto_327277 ?auto_327280 ) ) ( not ( = ?auto_327277 ?auto_327281 ) ) ( not ( = ?auto_327277 ?auto_327282 ) ) ( not ( = ?auto_327277 ?auto_327283 ) ) ( not ( = ?auto_327277 ?auto_327284 ) ) ( not ( = ?auto_327278 ?auto_327279 ) ) ( not ( = ?auto_327278 ?auto_327280 ) ) ( not ( = ?auto_327278 ?auto_327281 ) ) ( not ( = ?auto_327278 ?auto_327282 ) ) ( not ( = ?auto_327278 ?auto_327283 ) ) ( not ( = ?auto_327278 ?auto_327284 ) ) ( not ( = ?auto_327279 ?auto_327280 ) ) ( not ( = ?auto_327279 ?auto_327281 ) ) ( not ( = ?auto_327279 ?auto_327282 ) ) ( not ( = ?auto_327279 ?auto_327283 ) ) ( not ( = ?auto_327279 ?auto_327284 ) ) ( not ( = ?auto_327280 ?auto_327281 ) ) ( not ( = ?auto_327280 ?auto_327282 ) ) ( not ( = ?auto_327280 ?auto_327283 ) ) ( not ( = ?auto_327280 ?auto_327284 ) ) ( not ( = ?auto_327281 ?auto_327282 ) ) ( not ( = ?auto_327281 ?auto_327283 ) ) ( not ( = ?auto_327281 ?auto_327284 ) ) ( not ( = ?auto_327282 ?auto_327283 ) ) ( not ( = ?auto_327282 ?auto_327284 ) ) ( not ( = ?auto_327283 ?auto_327284 ) ) ( CLEAR ?auto_327281 ) ( ON ?auto_327282 ?auto_327283 ) ( CLEAR ?auto_327282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_327275 ?auto_327276 ?auto_327277 ?auto_327278 ?auto_327279 ?auto_327280 ?auto_327281 ?auto_327282 )
      ( MAKE-9PILE ?auto_327275 ?auto_327276 ?auto_327277 ?auto_327278 ?auto_327279 ?auto_327280 ?auto_327281 ?auto_327282 ?auto_327283 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327313 - BLOCK
      ?auto_327314 - BLOCK
      ?auto_327315 - BLOCK
      ?auto_327316 - BLOCK
      ?auto_327317 - BLOCK
      ?auto_327318 - BLOCK
      ?auto_327319 - BLOCK
      ?auto_327320 - BLOCK
      ?auto_327321 - BLOCK
    )
    :vars
    (
      ?auto_327322 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327321 ?auto_327322 ) ( ON-TABLE ?auto_327313 ) ( ON ?auto_327314 ?auto_327313 ) ( ON ?auto_327315 ?auto_327314 ) ( ON ?auto_327316 ?auto_327315 ) ( ON ?auto_327317 ?auto_327316 ) ( ON ?auto_327318 ?auto_327317 ) ( not ( = ?auto_327313 ?auto_327314 ) ) ( not ( = ?auto_327313 ?auto_327315 ) ) ( not ( = ?auto_327313 ?auto_327316 ) ) ( not ( = ?auto_327313 ?auto_327317 ) ) ( not ( = ?auto_327313 ?auto_327318 ) ) ( not ( = ?auto_327313 ?auto_327319 ) ) ( not ( = ?auto_327313 ?auto_327320 ) ) ( not ( = ?auto_327313 ?auto_327321 ) ) ( not ( = ?auto_327313 ?auto_327322 ) ) ( not ( = ?auto_327314 ?auto_327315 ) ) ( not ( = ?auto_327314 ?auto_327316 ) ) ( not ( = ?auto_327314 ?auto_327317 ) ) ( not ( = ?auto_327314 ?auto_327318 ) ) ( not ( = ?auto_327314 ?auto_327319 ) ) ( not ( = ?auto_327314 ?auto_327320 ) ) ( not ( = ?auto_327314 ?auto_327321 ) ) ( not ( = ?auto_327314 ?auto_327322 ) ) ( not ( = ?auto_327315 ?auto_327316 ) ) ( not ( = ?auto_327315 ?auto_327317 ) ) ( not ( = ?auto_327315 ?auto_327318 ) ) ( not ( = ?auto_327315 ?auto_327319 ) ) ( not ( = ?auto_327315 ?auto_327320 ) ) ( not ( = ?auto_327315 ?auto_327321 ) ) ( not ( = ?auto_327315 ?auto_327322 ) ) ( not ( = ?auto_327316 ?auto_327317 ) ) ( not ( = ?auto_327316 ?auto_327318 ) ) ( not ( = ?auto_327316 ?auto_327319 ) ) ( not ( = ?auto_327316 ?auto_327320 ) ) ( not ( = ?auto_327316 ?auto_327321 ) ) ( not ( = ?auto_327316 ?auto_327322 ) ) ( not ( = ?auto_327317 ?auto_327318 ) ) ( not ( = ?auto_327317 ?auto_327319 ) ) ( not ( = ?auto_327317 ?auto_327320 ) ) ( not ( = ?auto_327317 ?auto_327321 ) ) ( not ( = ?auto_327317 ?auto_327322 ) ) ( not ( = ?auto_327318 ?auto_327319 ) ) ( not ( = ?auto_327318 ?auto_327320 ) ) ( not ( = ?auto_327318 ?auto_327321 ) ) ( not ( = ?auto_327318 ?auto_327322 ) ) ( not ( = ?auto_327319 ?auto_327320 ) ) ( not ( = ?auto_327319 ?auto_327321 ) ) ( not ( = ?auto_327319 ?auto_327322 ) ) ( not ( = ?auto_327320 ?auto_327321 ) ) ( not ( = ?auto_327320 ?auto_327322 ) ) ( not ( = ?auto_327321 ?auto_327322 ) ) ( ON ?auto_327320 ?auto_327321 ) ( CLEAR ?auto_327318 ) ( ON ?auto_327319 ?auto_327320 ) ( CLEAR ?auto_327319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_327313 ?auto_327314 ?auto_327315 ?auto_327316 ?auto_327317 ?auto_327318 ?auto_327319 )
      ( MAKE-9PILE ?auto_327313 ?auto_327314 ?auto_327315 ?auto_327316 ?auto_327317 ?auto_327318 ?auto_327319 ?auto_327320 ?auto_327321 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327351 - BLOCK
      ?auto_327352 - BLOCK
      ?auto_327353 - BLOCK
      ?auto_327354 - BLOCK
      ?auto_327355 - BLOCK
      ?auto_327356 - BLOCK
      ?auto_327357 - BLOCK
      ?auto_327358 - BLOCK
      ?auto_327359 - BLOCK
    )
    :vars
    (
      ?auto_327360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327359 ?auto_327360 ) ( ON-TABLE ?auto_327351 ) ( ON ?auto_327352 ?auto_327351 ) ( ON ?auto_327353 ?auto_327352 ) ( ON ?auto_327354 ?auto_327353 ) ( ON ?auto_327355 ?auto_327354 ) ( not ( = ?auto_327351 ?auto_327352 ) ) ( not ( = ?auto_327351 ?auto_327353 ) ) ( not ( = ?auto_327351 ?auto_327354 ) ) ( not ( = ?auto_327351 ?auto_327355 ) ) ( not ( = ?auto_327351 ?auto_327356 ) ) ( not ( = ?auto_327351 ?auto_327357 ) ) ( not ( = ?auto_327351 ?auto_327358 ) ) ( not ( = ?auto_327351 ?auto_327359 ) ) ( not ( = ?auto_327351 ?auto_327360 ) ) ( not ( = ?auto_327352 ?auto_327353 ) ) ( not ( = ?auto_327352 ?auto_327354 ) ) ( not ( = ?auto_327352 ?auto_327355 ) ) ( not ( = ?auto_327352 ?auto_327356 ) ) ( not ( = ?auto_327352 ?auto_327357 ) ) ( not ( = ?auto_327352 ?auto_327358 ) ) ( not ( = ?auto_327352 ?auto_327359 ) ) ( not ( = ?auto_327352 ?auto_327360 ) ) ( not ( = ?auto_327353 ?auto_327354 ) ) ( not ( = ?auto_327353 ?auto_327355 ) ) ( not ( = ?auto_327353 ?auto_327356 ) ) ( not ( = ?auto_327353 ?auto_327357 ) ) ( not ( = ?auto_327353 ?auto_327358 ) ) ( not ( = ?auto_327353 ?auto_327359 ) ) ( not ( = ?auto_327353 ?auto_327360 ) ) ( not ( = ?auto_327354 ?auto_327355 ) ) ( not ( = ?auto_327354 ?auto_327356 ) ) ( not ( = ?auto_327354 ?auto_327357 ) ) ( not ( = ?auto_327354 ?auto_327358 ) ) ( not ( = ?auto_327354 ?auto_327359 ) ) ( not ( = ?auto_327354 ?auto_327360 ) ) ( not ( = ?auto_327355 ?auto_327356 ) ) ( not ( = ?auto_327355 ?auto_327357 ) ) ( not ( = ?auto_327355 ?auto_327358 ) ) ( not ( = ?auto_327355 ?auto_327359 ) ) ( not ( = ?auto_327355 ?auto_327360 ) ) ( not ( = ?auto_327356 ?auto_327357 ) ) ( not ( = ?auto_327356 ?auto_327358 ) ) ( not ( = ?auto_327356 ?auto_327359 ) ) ( not ( = ?auto_327356 ?auto_327360 ) ) ( not ( = ?auto_327357 ?auto_327358 ) ) ( not ( = ?auto_327357 ?auto_327359 ) ) ( not ( = ?auto_327357 ?auto_327360 ) ) ( not ( = ?auto_327358 ?auto_327359 ) ) ( not ( = ?auto_327358 ?auto_327360 ) ) ( not ( = ?auto_327359 ?auto_327360 ) ) ( ON ?auto_327358 ?auto_327359 ) ( ON ?auto_327357 ?auto_327358 ) ( CLEAR ?auto_327355 ) ( ON ?auto_327356 ?auto_327357 ) ( CLEAR ?auto_327356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_327351 ?auto_327352 ?auto_327353 ?auto_327354 ?auto_327355 ?auto_327356 )
      ( MAKE-9PILE ?auto_327351 ?auto_327352 ?auto_327353 ?auto_327354 ?auto_327355 ?auto_327356 ?auto_327357 ?auto_327358 ?auto_327359 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327389 - BLOCK
      ?auto_327390 - BLOCK
      ?auto_327391 - BLOCK
      ?auto_327392 - BLOCK
      ?auto_327393 - BLOCK
      ?auto_327394 - BLOCK
      ?auto_327395 - BLOCK
      ?auto_327396 - BLOCK
      ?auto_327397 - BLOCK
    )
    :vars
    (
      ?auto_327398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327397 ?auto_327398 ) ( ON-TABLE ?auto_327389 ) ( ON ?auto_327390 ?auto_327389 ) ( ON ?auto_327391 ?auto_327390 ) ( ON ?auto_327392 ?auto_327391 ) ( not ( = ?auto_327389 ?auto_327390 ) ) ( not ( = ?auto_327389 ?auto_327391 ) ) ( not ( = ?auto_327389 ?auto_327392 ) ) ( not ( = ?auto_327389 ?auto_327393 ) ) ( not ( = ?auto_327389 ?auto_327394 ) ) ( not ( = ?auto_327389 ?auto_327395 ) ) ( not ( = ?auto_327389 ?auto_327396 ) ) ( not ( = ?auto_327389 ?auto_327397 ) ) ( not ( = ?auto_327389 ?auto_327398 ) ) ( not ( = ?auto_327390 ?auto_327391 ) ) ( not ( = ?auto_327390 ?auto_327392 ) ) ( not ( = ?auto_327390 ?auto_327393 ) ) ( not ( = ?auto_327390 ?auto_327394 ) ) ( not ( = ?auto_327390 ?auto_327395 ) ) ( not ( = ?auto_327390 ?auto_327396 ) ) ( not ( = ?auto_327390 ?auto_327397 ) ) ( not ( = ?auto_327390 ?auto_327398 ) ) ( not ( = ?auto_327391 ?auto_327392 ) ) ( not ( = ?auto_327391 ?auto_327393 ) ) ( not ( = ?auto_327391 ?auto_327394 ) ) ( not ( = ?auto_327391 ?auto_327395 ) ) ( not ( = ?auto_327391 ?auto_327396 ) ) ( not ( = ?auto_327391 ?auto_327397 ) ) ( not ( = ?auto_327391 ?auto_327398 ) ) ( not ( = ?auto_327392 ?auto_327393 ) ) ( not ( = ?auto_327392 ?auto_327394 ) ) ( not ( = ?auto_327392 ?auto_327395 ) ) ( not ( = ?auto_327392 ?auto_327396 ) ) ( not ( = ?auto_327392 ?auto_327397 ) ) ( not ( = ?auto_327392 ?auto_327398 ) ) ( not ( = ?auto_327393 ?auto_327394 ) ) ( not ( = ?auto_327393 ?auto_327395 ) ) ( not ( = ?auto_327393 ?auto_327396 ) ) ( not ( = ?auto_327393 ?auto_327397 ) ) ( not ( = ?auto_327393 ?auto_327398 ) ) ( not ( = ?auto_327394 ?auto_327395 ) ) ( not ( = ?auto_327394 ?auto_327396 ) ) ( not ( = ?auto_327394 ?auto_327397 ) ) ( not ( = ?auto_327394 ?auto_327398 ) ) ( not ( = ?auto_327395 ?auto_327396 ) ) ( not ( = ?auto_327395 ?auto_327397 ) ) ( not ( = ?auto_327395 ?auto_327398 ) ) ( not ( = ?auto_327396 ?auto_327397 ) ) ( not ( = ?auto_327396 ?auto_327398 ) ) ( not ( = ?auto_327397 ?auto_327398 ) ) ( ON ?auto_327396 ?auto_327397 ) ( ON ?auto_327395 ?auto_327396 ) ( ON ?auto_327394 ?auto_327395 ) ( CLEAR ?auto_327392 ) ( ON ?auto_327393 ?auto_327394 ) ( CLEAR ?auto_327393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_327389 ?auto_327390 ?auto_327391 ?auto_327392 ?auto_327393 )
      ( MAKE-9PILE ?auto_327389 ?auto_327390 ?auto_327391 ?auto_327392 ?auto_327393 ?auto_327394 ?auto_327395 ?auto_327396 ?auto_327397 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327427 - BLOCK
      ?auto_327428 - BLOCK
      ?auto_327429 - BLOCK
      ?auto_327430 - BLOCK
      ?auto_327431 - BLOCK
      ?auto_327432 - BLOCK
      ?auto_327433 - BLOCK
      ?auto_327434 - BLOCK
      ?auto_327435 - BLOCK
    )
    :vars
    (
      ?auto_327436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327435 ?auto_327436 ) ( ON-TABLE ?auto_327427 ) ( ON ?auto_327428 ?auto_327427 ) ( ON ?auto_327429 ?auto_327428 ) ( not ( = ?auto_327427 ?auto_327428 ) ) ( not ( = ?auto_327427 ?auto_327429 ) ) ( not ( = ?auto_327427 ?auto_327430 ) ) ( not ( = ?auto_327427 ?auto_327431 ) ) ( not ( = ?auto_327427 ?auto_327432 ) ) ( not ( = ?auto_327427 ?auto_327433 ) ) ( not ( = ?auto_327427 ?auto_327434 ) ) ( not ( = ?auto_327427 ?auto_327435 ) ) ( not ( = ?auto_327427 ?auto_327436 ) ) ( not ( = ?auto_327428 ?auto_327429 ) ) ( not ( = ?auto_327428 ?auto_327430 ) ) ( not ( = ?auto_327428 ?auto_327431 ) ) ( not ( = ?auto_327428 ?auto_327432 ) ) ( not ( = ?auto_327428 ?auto_327433 ) ) ( not ( = ?auto_327428 ?auto_327434 ) ) ( not ( = ?auto_327428 ?auto_327435 ) ) ( not ( = ?auto_327428 ?auto_327436 ) ) ( not ( = ?auto_327429 ?auto_327430 ) ) ( not ( = ?auto_327429 ?auto_327431 ) ) ( not ( = ?auto_327429 ?auto_327432 ) ) ( not ( = ?auto_327429 ?auto_327433 ) ) ( not ( = ?auto_327429 ?auto_327434 ) ) ( not ( = ?auto_327429 ?auto_327435 ) ) ( not ( = ?auto_327429 ?auto_327436 ) ) ( not ( = ?auto_327430 ?auto_327431 ) ) ( not ( = ?auto_327430 ?auto_327432 ) ) ( not ( = ?auto_327430 ?auto_327433 ) ) ( not ( = ?auto_327430 ?auto_327434 ) ) ( not ( = ?auto_327430 ?auto_327435 ) ) ( not ( = ?auto_327430 ?auto_327436 ) ) ( not ( = ?auto_327431 ?auto_327432 ) ) ( not ( = ?auto_327431 ?auto_327433 ) ) ( not ( = ?auto_327431 ?auto_327434 ) ) ( not ( = ?auto_327431 ?auto_327435 ) ) ( not ( = ?auto_327431 ?auto_327436 ) ) ( not ( = ?auto_327432 ?auto_327433 ) ) ( not ( = ?auto_327432 ?auto_327434 ) ) ( not ( = ?auto_327432 ?auto_327435 ) ) ( not ( = ?auto_327432 ?auto_327436 ) ) ( not ( = ?auto_327433 ?auto_327434 ) ) ( not ( = ?auto_327433 ?auto_327435 ) ) ( not ( = ?auto_327433 ?auto_327436 ) ) ( not ( = ?auto_327434 ?auto_327435 ) ) ( not ( = ?auto_327434 ?auto_327436 ) ) ( not ( = ?auto_327435 ?auto_327436 ) ) ( ON ?auto_327434 ?auto_327435 ) ( ON ?auto_327433 ?auto_327434 ) ( ON ?auto_327432 ?auto_327433 ) ( ON ?auto_327431 ?auto_327432 ) ( CLEAR ?auto_327429 ) ( ON ?auto_327430 ?auto_327431 ) ( CLEAR ?auto_327430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_327427 ?auto_327428 ?auto_327429 ?auto_327430 )
      ( MAKE-9PILE ?auto_327427 ?auto_327428 ?auto_327429 ?auto_327430 ?auto_327431 ?auto_327432 ?auto_327433 ?auto_327434 ?auto_327435 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327465 - BLOCK
      ?auto_327466 - BLOCK
      ?auto_327467 - BLOCK
      ?auto_327468 - BLOCK
      ?auto_327469 - BLOCK
      ?auto_327470 - BLOCK
      ?auto_327471 - BLOCK
      ?auto_327472 - BLOCK
      ?auto_327473 - BLOCK
    )
    :vars
    (
      ?auto_327474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327473 ?auto_327474 ) ( ON-TABLE ?auto_327465 ) ( ON ?auto_327466 ?auto_327465 ) ( not ( = ?auto_327465 ?auto_327466 ) ) ( not ( = ?auto_327465 ?auto_327467 ) ) ( not ( = ?auto_327465 ?auto_327468 ) ) ( not ( = ?auto_327465 ?auto_327469 ) ) ( not ( = ?auto_327465 ?auto_327470 ) ) ( not ( = ?auto_327465 ?auto_327471 ) ) ( not ( = ?auto_327465 ?auto_327472 ) ) ( not ( = ?auto_327465 ?auto_327473 ) ) ( not ( = ?auto_327465 ?auto_327474 ) ) ( not ( = ?auto_327466 ?auto_327467 ) ) ( not ( = ?auto_327466 ?auto_327468 ) ) ( not ( = ?auto_327466 ?auto_327469 ) ) ( not ( = ?auto_327466 ?auto_327470 ) ) ( not ( = ?auto_327466 ?auto_327471 ) ) ( not ( = ?auto_327466 ?auto_327472 ) ) ( not ( = ?auto_327466 ?auto_327473 ) ) ( not ( = ?auto_327466 ?auto_327474 ) ) ( not ( = ?auto_327467 ?auto_327468 ) ) ( not ( = ?auto_327467 ?auto_327469 ) ) ( not ( = ?auto_327467 ?auto_327470 ) ) ( not ( = ?auto_327467 ?auto_327471 ) ) ( not ( = ?auto_327467 ?auto_327472 ) ) ( not ( = ?auto_327467 ?auto_327473 ) ) ( not ( = ?auto_327467 ?auto_327474 ) ) ( not ( = ?auto_327468 ?auto_327469 ) ) ( not ( = ?auto_327468 ?auto_327470 ) ) ( not ( = ?auto_327468 ?auto_327471 ) ) ( not ( = ?auto_327468 ?auto_327472 ) ) ( not ( = ?auto_327468 ?auto_327473 ) ) ( not ( = ?auto_327468 ?auto_327474 ) ) ( not ( = ?auto_327469 ?auto_327470 ) ) ( not ( = ?auto_327469 ?auto_327471 ) ) ( not ( = ?auto_327469 ?auto_327472 ) ) ( not ( = ?auto_327469 ?auto_327473 ) ) ( not ( = ?auto_327469 ?auto_327474 ) ) ( not ( = ?auto_327470 ?auto_327471 ) ) ( not ( = ?auto_327470 ?auto_327472 ) ) ( not ( = ?auto_327470 ?auto_327473 ) ) ( not ( = ?auto_327470 ?auto_327474 ) ) ( not ( = ?auto_327471 ?auto_327472 ) ) ( not ( = ?auto_327471 ?auto_327473 ) ) ( not ( = ?auto_327471 ?auto_327474 ) ) ( not ( = ?auto_327472 ?auto_327473 ) ) ( not ( = ?auto_327472 ?auto_327474 ) ) ( not ( = ?auto_327473 ?auto_327474 ) ) ( ON ?auto_327472 ?auto_327473 ) ( ON ?auto_327471 ?auto_327472 ) ( ON ?auto_327470 ?auto_327471 ) ( ON ?auto_327469 ?auto_327470 ) ( ON ?auto_327468 ?auto_327469 ) ( CLEAR ?auto_327466 ) ( ON ?auto_327467 ?auto_327468 ) ( CLEAR ?auto_327467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_327465 ?auto_327466 ?auto_327467 )
      ( MAKE-9PILE ?auto_327465 ?auto_327466 ?auto_327467 ?auto_327468 ?auto_327469 ?auto_327470 ?auto_327471 ?auto_327472 ?auto_327473 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327503 - BLOCK
      ?auto_327504 - BLOCK
      ?auto_327505 - BLOCK
      ?auto_327506 - BLOCK
      ?auto_327507 - BLOCK
      ?auto_327508 - BLOCK
      ?auto_327509 - BLOCK
      ?auto_327510 - BLOCK
      ?auto_327511 - BLOCK
    )
    :vars
    (
      ?auto_327512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327511 ?auto_327512 ) ( ON-TABLE ?auto_327503 ) ( not ( = ?auto_327503 ?auto_327504 ) ) ( not ( = ?auto_327503 ?auto_327505 ) ) ( not ( = ?auto_327503 ?auto_327506 ) ) ( not ( = ?auto_327503 ?auto_327507 ) ) ( not ( = ?auto_327503 ?auto_327508 ) ) ( not ( = ?auto_327503 ?auto_327509 ) ) ( not ( = ?auto_327503 ?auto_327510 ) ) ( not ( = ?auto_327503 ?auto_327511 ) ) ( not ( = ?auto_327503 ?auto_327512 ) ) ( not ( = ?auto_327504 ?auto_327505 ) ) ( not ( = ?auto_327504 ?auto_327506 ) ) ( not ( = ?auto_327504 ?auto_327507 ) ) ( not ( = ?auto_327504 ?auto_327508 ) ) ( not ( = ?auto_327504 ?auto_327509 ) ) ( not ( = ?auto_327504 ?auto_327510 ) ) ( not ( = ?auto_327504 ?auto_327511 ) ) ( not ( = ?auto_327504 ?auto_327512 ) ) ( not ( = ?auto_327505 ?auto_327506 ) ) ( not ( = ?auto_327505 ?auto_327507 ) ) ( not ( = ?auto_327505 ?auto_327508 ) ) ( not ( = ?auto_327505 ?auto_327509 ) ) ( not ( = ?auto_327505 ?auto_327510 ) ) ( not ( = ?auto_327505 ?auto_327511 ) ) ( not ( = ?auto_327505 ?auto_327512 ) ) ( not ( = ?auto_327506 ?auto_327507 ) ) ( not ( = ?auto_327506 ?auto_327508 ) ) ( not ( = ?auto_327506 ?auto_327509 ) ) ( not ( = ?auto_327506 ?auto_327510 ) ) ( not ( = ?auto_327506 ?auto_327511 ) ) ( not ( = ?auto_327506 ?auto_327512 ) ) ( not ( = ?auto_327507 ?auto_327508 ) ) ( not ( = ?auto_327507 ?auto_327509 ) ) ( not ( = ?auto_327507 ?auto_327510 ) ) ( not ( = ?auto_327507 ?auto_327511 ) ) ( not ( = ?auto_327507 ?auto_327512 ) ) ( not ( = ?auto_327508 ?auto_327509 ) ) ( not ( = ?auto_327508 ?auto_327510 ) ) ( not ( = ?auto_327508 ?auto_327511 ) ) ( not ( = ?auto_327508 ?auto_327512 ) ) ( not ( = ?auto_327509 ?auto_327510 ) ) ( not ( = ?auto_327509 ?auto_327511 ) ) ( not ( = ?auto_327509 ?auto_327512 ) ) ( not ( = ?auto_327510 ?auto_327511 ) ) ( not ( = ?auto_327510 ?auto_327512 ) ) ( not ( = ?auto_327511 ?auto_327512 ) ) ( ON ?auto_327510 ?auto_327511 ) ( ON ?auto_327509 ?auto_327510 ) ( ON ?auto_327508 ?auto_327509 ) ( ON ?auto_327507 ?auto_327508 ) ( ON ?auto_327506 ?auto_327507 ) ( ON ?auto_327505 ?auto_327506 ) ( CLEAR ?auto_327503 ) ( ON ?auto_327504 ?auto_327505 ) ( CLEAR ?auto_327504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_327503 ?auto_327504 )
      ( MAKE-9PILE ?auto_327503 ?auto_327504 ?auto_327505 ?auto_327506 ?auto_327507 ?auto_327508 ?auto_327509 ?auto_327510 ?auto_327511 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_327541 - BLOCK
      ?auto_327542 - BLOCK
      ?auto_327543 - BLOCK
      ?auto_327544 - BLOCK
      ?auto_327545 - BLOCK
      ?auto_327546 - BLOCK
      ?auto_327547 - BLOCK
      ?auto_327548 - BLOCK
      ?auto_327549 - BLOCK
    )
    :vars
    (
      ?auto_327550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327549 ?auto_327550 ) ( not ( = ?auto_327541 ?auto_327542 ) ) ( not ( = ?auto_327541 ?auto_327543 ) ) ( not ( = ?auto_327541 ?auto_327544 ) ) ( not ( = ?auto_327541 ?auto_327545 ) ) ( not ( = ?auto_327541 ?auto_327546 ) ) ( not ( = ?auto_327541 ?auto_327547 ) ) ( not ( = ?auto_327541 ?auto_327548 ) ) ( not ( = ?auto_327541 ?auto_327549 ) ) ( not ( = ?auto_327541 ?auto_327550 ) ) ( not ( = ?auto_327542 ?auto_327543 ) ) ( not ( = ?auto_327542 ?auto_327544 ) ) ( not ( = ?auto_327542 ?auto_327545 ) ) ( not ( = ?auto_327542 ?auto_327546 ) ) ( not ( = ?auto_327542 ?auto_327547 ) ) ( not ( = ?auto_327542 ?auto_327548 ) ) ( not ( = ?auto_327542 ?auto_327549 ) ) ( not ( = ?auto_327542 ?auto_327550 ) ) ( not ( = ?auto_327543 ?auto_327544 ) ) ( not ( = ?auto_327543 ?auto_327545 ) ) ( not ( = ?auto_327543 ?auto_327546 ) ) ( not ( = ?auto_327543 ?auto_327547 ) ) ( not ( = ?auto_327543 ?auto_327548 ) ) ( not ( = ?auto_327543 ?auto_327549 ) ) ( not ( = ?auto_327543 ?auto_327550 ) ) ( not ( = ?auto_327544 ?auto_327545 ) ) ( not ( = ?auto_327544 ?auto_327546 ) ) ( not ( = ?auto_327544 ?auto_327547 ) ) ( not ( = ?auto_327544 ?auto_327548 ) ) ( not ( = ?auto_327544 ?auto_327549 ) ) ( not ( = ?auto_327544 ?auto_327550 ) ) ( not ( = ?auto_327545 ?auto_327546 ) ) ( not ( = ?auto_327545 ?auto_327547 ) ) ( not ( = ?auto_327545 ?auto_327548 ) ) ( not ( = ?auto_327545 ?auto_327549 ) ) ( not ( = ?auto_327545 ?auto_327550 ) ) ( not ( = ?auto_327546 ?auto_327547 ) ) ( not ( = ?auto_327546 ?auto_327548 ) ) ( not ( = ?auto_327546 ?auto_327549 ) ) ( not ( = ?auto_327546 ?auto_327550 ) ) ( not ( = ?auto_327547 ?auto_327548 ) ) ( not ( = ?auto_327547 ?auto_327549 ) ) ( not ( = ?auto_327547 ?auto_327550 ) ) ( not ( = ?auto_327548 ?auto_327549 ) ) ( not ( = ?auto_327548 ?auto_327550 ) ) ( not ( = ?auto_327549 ?auto_327550 ) ) ( ON ?auto_327548 ?auto_327549 ) ( ON ?auto_327547 ?auto_327548 ) ( ON ?auto_327546 ?auto_327547 ) ( ON ?auto_327545 ?auto_327546 ) ( ON ?auto_327544 ?auto_327545 ) ( ON ?auto_327543 ?auto_327544 ) ( ON ?auto_327542 ?auto_327543 ) ( ON ?auto_327541 ?auto_327542 ) ( CLEAR ?auto_327541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_327541 )
      ( MAKE-9PILE ?auto_327541 ?auto_327542 ?auto_327543 ?auto_327544 ?auto_327545 ?auto_327546 ?auto_327547 ?auto_327548 ?auto_327549 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327580 - BLOCK
      ?auto_327581 - BLOCK
      ?auto_327582 - BLOCK
      ?auto_327583 - BLOCK
      ?auto_327584 - BLOCK
      ?auto_327585 - BLOCK
      ?auto_327586 - BLOCK
      ?auto_327587 - BLOCK
      ?auto_327588 - BLOCK
      ?auto_327589 - BLOCK
    )
    :vars
    (
      ?auto_327590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_327588 ) ( ON ?auto_327589 ?auto_327590 ) ( CLEAR ?auto_327589 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_327580 ) ( ON ?auto_327581 ?auto_327580 ) ( ON ?auto_327582 ?auto_327581 ) ( ON ?auto_327583 ?auto_327582 ) ( ON ?auto_327584 ?auto_327583 ) ( ON ?auto_327585 ?auto_327584 ) ( ON ?auto_327586 ?auto_327585 ) ( ON ?auto_327587 ?auto_327586 ) ( ON ?auto_327588 ?auto_327587 ) ( not ( = ?auto_327580 ?auto_327581 ) ) ( not ( = ?auto_327580 ?auto_327582 ) ) ( not ( = ?auto_327580 ?auto_327583 ) ) ( not ( = ?auto_327580 ?auto_327584 ) ) ( not ( = ?auto_327580 ?auto_327585 ) ) ( not ( = ?auto_327580 ?auto_327586 ) ) ( not ( = ?auto_327580 ?auto_327587 ) ) ( not ( = ?auto_327580 ?auto_327588 ) ) ( not ( = ?auto_327580 ?auto_327589 ) ) ( not ( = ?auto_327580 ?auto_327590 ) ) ( not ( = ?auto_327581 ?auto_327582 ) ) ( not ( = ?auto_327581 ?auto_327583 ) ) ( not ( = ?auto_327581 ?auto_327584 ) ) ( not ( = ?auto_327581 ?auto_327585 ) ) ( not ( = ?auto_327581 ?auto_327586 ) ) ( not ( = ?auto_327581 ?auto_327587 ) ) ( not ( = ?auto_327581 ?auto_327588 ) ) ( not ( = ?auto_327581 ?auto_327589 ) ) ( not ( = ?auto_327581 ?auto_327590 ) ) ( not ( = ?auto_327582 ?auto_327583 ) ) ( not ( = ?auto_327582 ?auto_327584 ) ) ( not ( = ?auto_327582 ?auto_327585 ) ) ( not ( = ?auto_327582 ?auto_327586 ) ) ( not ( = ?auto_327582 ?auto_327587 ) ) ( not ( = ?auto_327582 ?auto_327588 ) ) ( not ( = ?auto_327582 ?auto_327589 ) ) ( not ( = ?auto_327582 ?auto_327590 ) ) ( not ( = ?auto_327583 ?auto_327584 ) ) ( not ( = ?auto_327583 ?auto_327585 ) ) ( not ( = ?auto_327583 ?auto_327586 ) ) ( not ( = ?auto_327583 ?auto_327587 ) ) ( not ( = ?auto_327583 ?auto_327588 ) ) ( not ( = ?auto_327583 ?auto_327589 ) ) ( not ( = ?auto_327583 ?auto_327590 ) ) ( not ( = ?auto_327584 ?auto_327585 ) ) ( not ( = ?auto_327584 ?auto_327586 ) ) ( not ( = ?auto_327584 ?auto_327587 ) ) ( not ( = ?auto_327584 ?auto_327588 ) ) ( not ( = ?auto_327584 ?auto_327589 ) ) ( not ( = ?auto_327584 ?auto_327590 ) ) ( not ( = ?auto_327585 ?auto_327586 ) ) ( not ( = ?auto_327585 ?auto_327587 ) ) ( not ( = ?auto_327585 ?auto_327588 ) ) ( not ( = ?auto_327585 ?auto_327589 ) ) ( not ( = ?auto_327585 ?auto_327590 ) ) ( not ( = ?auto_327586 ?auto_327587 ) ) ( not ( = ?auto_327586 ?auto_327588 ) ) ( not ( = ?auto_327586 ?auto_327589 ) ) ( not ( = ?auto_327586 ?auto_327590 ) ) ( not ( = ?auto_327587 ?auto_327588 ) ) ( not ( = ?auto_327587 ?auto_327589 ) ) ( not ( = ?auto_327587 ?auto_327590 ) ) ( not ( = ?auto_327588 ?auto_327589 ) ) ( not ( = ?auto_327588 ?auto_327590 ) ) ( not ( = ?auto_327589 ?auto_327590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_327589 ?auto_327590 )
      ( !STACK ?auto_327589 ?auto_327588 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327622 - BLOCK
      ?auto_327623 - BLOCK
      ?auto_327624 - BLOCK
      ?auto_327625 - BLOCK
      ?auto_327626 - BLOCK
      ?auto_327627 - BLOCK
      ?auto_327628 - BLOCK
      ?auto_327629 - BLOCK
      ?auto_327630 - BLOCK
      ?auto_327631 - BLOCK
    )
    :vars
    (
      ?auto_327632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327631 ?auto_327632 ) ( ON-TABLE ?auto_327622 ) ( ON ?auto_327623 ?auto_327622 ) ( ON ?auto_327624 ?auto_327623 ) ( ON ?auto_327625 ?auto_327624 ) ( ON ?auto_327626 ?auto_327625 ) ( ON ?auto_327627 ?auto_327626 ) ( ON ?auto_327628 ?auto_327627 ) ( ON ?auto_327629 ?auto_327628 ) ( not ( = ?auto_327622 ?auto_327623 ) ) ( not ( = ?auto_327622 ?auto_327624 ) ) ( not ( = ?auto_327622 ?auto_327625 ) ) ( not ( = ?auto_327622 ?auto_327626 ) ) ( not ( = ?auto_327622 ?auto_327627 ) ) ( not ( = ?auto_327622 ?auto_327628 ) ) ( not ( = ?auto_327622 ?auto_327629 ) ) ( not ( = ?auto_327622 ?auto_327630 ) ) ( not ( = ?auto_327622 ?auto_327631 ) ) ( not ( = ?auto_327622 ?auto_327632 ) ) ( not ( = ?auto_327623 ?auto_327624 ) ) ( not ( = ?auto_327623 ?auto_327625 ) ) ( not ( = ?auto_327623 ?auto_327626 ) ) ( not ( = ?auto_327623 ?auto_327627 ) ) ( not ( = ?auto_327623 ?auto_327628 ) ) ( not ( = ?auto_327623 ?auto_327629 ) ) ( not ( = ?auto_327623 ?auto_327630 ) ) ( not ( = ?auto_327623 ?auto_327631 ) ) ( not ( = ?auto_327623 ?auto_327632 ) ) ( not ( = ?auto_327624 ?auto_327625 ) ) ( not ( = ?auto_327624 ?auto_327626 ) ) ( not ( = ?auto_327624 ?auto_327627 ) ) ( not ( = ?auto_327624 ?auto_327628 ) ) ( not ( = ?auto_327624 ?auto_327629 ) ) ( not ( = ?auto_327624 ?auto_327630 ) ) ( not ( = ?auto_327624 ?auto_327631 ) ) ( not ( = ?auto_327624 ?auto_327632 ) ) ( not ( = ?auto_327625 ?auto_327626 ) ) ( not ( = ?auto_327625 ?auto_327627 ) ) ( not ( = ?auto_327625 ?auto_327628 ) ) ( not ( = ?auto_327625 ?auto_327629 ) ) ( not ( = ?auto_327625 ?auto_327630 ) ) ( not ( = ?auto_327625 ?auto_327631 ) ) ( not ( = ?auto_327625 ?auto_327632 ) ) ( not ( = ?auto_327626 ?auto_327627 ) ) ( not ( = ?auto_327626 ?auto_327628 ) ) ( not ( = ?auto_327626 ?auto_327629 ) ) ( not ( = ?auto_327626 ?auto_327630 ) ) ( not ( = ?auto_327626 ?auto_327631 ) ) ( not ( = ?auto_327626 ?auto_327632 ) ) ( not ( = ?auto_327627 ?auto_327628 ) ) ( not ( = ?auto_327627 ?auto_327629 ) ) ( not ( = ?auto_327627 ?auto_327630 ) ) ( not ( = ?auto_327627 ?auto_327631 ) ) ( not ( = ?auto_327627 ?auto_327632 ) ) ( not ( = ?auto_327628 ?auto_327629 ) ) ( not ( = ?auto_327628 ?auto_327630 ) ) ( not ( = ?auto_327628 ?auto_327631 ) ) ( not ( = ?auto_327628 ?auto_327632 ) ) ( not ( = ?auto_327629 ?auto_327630 ) ) ( not ( = ?auto_327629 ?auto_327631 ) ) ( not ( = ?auto_327629 ?auto_327632 ) ) ( not ( = ?auto_327630 ?auto_327631 ) ) ( not ( = ?auto_327630 ?auto_327632 ) ) ( not ( = ?auto_327631 ?auto_327632 ) ) ( CLEAR ?auto_327629 ) ( ON ?auto_327630 ?auto_327631 ) ( CLEAR ?auto_327630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_327622 ?auto_327623 ?auto_327624 ?auto_327625 ?auto_327626 ?auto_327627 ?auto_327628 ?auto_327629 ?auto_327630 )
      ( MAKE-10PILE ?auto_327622 ?auto_327623 ?auto_327624 ?auto_327625 ?auto_327626 ?auto_327627 ?auto_327628 ?auto_327629 ?auto_327630 ?auto_327631 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327664 - BLOCK
      ?auto_327665 - BLOCK
      ?auto_327666 - BLOCK
      ?auto_327667 - BLOCK
      ?auto_327668 - BLOCK
      ?auto_327669 - BLOCK
      ?auto_327670 - BLOCK
      ?auto_327671 - BLOCK
      ?auto_327672 - BLOCK
      ?auto_327673 - BLOCK
    )
    :vars
    (
      ?auto_327674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327673 ?auto_327674 ) ( ON-TABLE ?auto_327664 ) ( ON ?auto_327665 ?auto_327664 ) ( ON ?auto_327666 ?auto_327665 ) ( ON ?auto_327667 ?auto_327666 ) ( ON ?auto_327668 ?auto_327667 ) ( ON ?auto_327669 ?auto_327668 ) ( ON ?auto_327670 ?auto_327669 ) ( not ( = ?auto_327664 ?auto_327665 ) ) ( not ( = ?auto_327664 ?auto_327666 ) ) ( not ( = ?auto_327664 ?auto_327667 ) ) ( not ( = ?auto_327664 ?auto_327668 ) ) ( not ( = ?auto_327664 ?auto_327669 ) ) ( not ( = ?auto_327664 ?auto_327670 ) ) ( not ( = ?auto_327664 ?auto_327671 ) ) ( not ( = ?auto_327664 ?auto_327672 ) ) ( not ( = ?auto_327664 ?auto_327673 ) ) ( not ( = ?auto_327664 ?auto_327674 ) ) ( not ( = ?auto_327665 ?auto_327666 ) ) ( not ( = ?auto_327665 ?auto_327667 ) ) ( not ( = ?auto_327665 ?auto_327668 ) ) ( not ( = ?auto_327665 ?auto_327669 ) ) ( not ( = ?auto_327665 ?auto_327670 ) ) ( not ( = ?auto_327665 ?auto_327671 ) ) ( not ( = ?auto_327665 ?auto_327672 ) ) ( not ( = ?auto_327665 ?auto_327673 ) ) ( not ( = ?auto_327665 ?auto_327674 ) ) ( not ( = ?auto_327666 ?auto_327667 ) ) ( not ( = ?auto_327666 ?auto_327668 ) ) ( not ( = ?auto_327666 ?auto_327669 ) ) ( not ( = ?auto_327666 ?auto_327670 ) ) ( not ( = ?auto_327666 ?auto_327671 ) ) ( not ( = ?auto_327666 ?auto_327672 ) ) ( not ( = ?auto_327666 ?auto_327673 ) ) ( not ( = ?auto_327666 ?auto_327674 ) ) ( not ( = ?auto_327667 ?auto_327668 ) ) ( not ( = ?auto_327667 ?auto_327669 ) ) ( not ( = ?auto_327667 ?auto_327670 ) ) ( not ( = ?auto_327667 ?auto_327671 ) ) ( not ( = ?auto_327667 ?auto_327672 ) ) ( not ( = ?auto_327667 ?auto_327673 ) ) ( not ( = ?auto_327667 ?auto_327674 ) ) ( not ( = ?auto_327668 ?auto_327669 ) ) ( not ( = ?auto_327668 ?auto_327670 ) ) ( not ( = ?auto_327668 ?auto_327671 ) ) ( not ( = ?auto_327668 ?auto_327672 ) ) ( not ( = ?auto_327668 ?auto_327673 ) ) ( not ( = ?auto_327668 ?auto_327674 ) ) ( not ( = ?auto_327669 ?auto_327670 ) ) ( not ( = ?auto_327669 ?auto_327671 ) ) ( not ( = ?auto_327669 ?auto_327672 ) ) ( not ( = ?auto_327669 ?auto_327673 ) ) ( not ( = ?auto_327669 ?auto_327674 ) ) ( not ( = ?auto_327670 ?auto_327671 ) ) ( not ( = ?auto_327670 ?auto_327672 ) ) ( not ( = ?auto_327670 ?auto_327673 ) ) ( not ( = ?auto_327670 ?auto_327674 ) ) ( not ( = ?auto_327671 ?auto_327672 ) ) ( not ( = ?auto_327671 ?auto_327673 ) ) ( not ( = ?auto_327671 ?auto_327674 ) ) ( not ( = ?auto_327672 ?auto_327673 ) ) ( not ( = ?auto_327672 ?auto_327674 ) ) ( not ( = ?auto_327673 ?auto_327674 ) ) ( ON ?auto_327672 ?auto_327673 ) ( CLEAR ?auto_327670 ) ( ON ?auto_327671 ?auto_327672 ) ( CLEAR ?auto_327671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_327664 ?auto_327665 ?auto_327666 ?auto_327667 ?auto_327668 ?auto_327669 ?auto_327670 ?auto_327671 )
      ( MAKE-10PILE ?auto_327664 ?auto_327665 ?auto_327666 ?auto_327667 ?auto_327668 ?auto_327669 ?auto_327670 ?auto_327671 ?auto_327672 ?auto_327673 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327706 - BLOCK
      ?auto_327707 - BLOCK
      ?auto_327708 - BLOCK
      ?auto_327709 - BLOCK
      ?auto_327710 - BLOCK
      ?auto_327711 - BLOCK
      ?auto_327712 - BLOCK
      ?auto_327713 - BLOCK
      ?auto_327714 - BLOCK
      ?auto_327715 - BLOCK
    )
    :vars
    (
      ?auto_327716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327715 ?auto_327716 ) ( ON-TABLE ?auto_327706 ) ( ON ?auto_327707 ?auto_327706 ) ( ON ?auto_327708 ?auto_327707 ) ( ON ?auto_327709 ?auto_327708 ) ( ON ?auto_327710 ?auto_327709 ) ( ON ?auto_327711 ?auto_327710 ) ( not ( = ?auto_327706 ?auto_327707 ) ) ( not ( = ?auto_327706 ?auto_327708 ) ) ( not ( = ?auto_327706 ?auto_327709 ) ) ( not ( = ?auto_327706 ?auto_327710 ) ) ( not ( = ?auto_327706 ?auto_327711 ) ) ( not ( = ?auto_327706 ?auto_327712 ) ) ( not ( = ?auto_327706 ?auto_327713 ) ) ( not ( = ?auto_327706 ?auto_327714 ) ) ( not ( = ?auto_327706 ?auto_327715 ) ) ( not ( = ?auto_327706 ?auto_327716 ) ) ( not ( = ?auto_327707 ?auto_327708 ) ) ( not ( = ?auto_327707 ?auto_327709 ) ) ( not ( = ?auto_327707 ?auto_327710 ) ) ( not ( = ?auto_327707 ?auto_327711 ) ) ( not ( = ?auto_327707 ?auto_327712 ) ) ( not ( = ?auto_327707 ?auto_327713 ) ) ( not ( = ?auto_327707 ?auto_327714 ) ) ( not ( = ?auto_327707 ?auto_327715 ) ) ( not ( = ?auto_327707 ?auto_327716 ) ) ( not ( = ?auto_327708 ?auto_327709 ) ) ( not ( = ?auto_327708 ?auto_327710 ) ) ( not ( = ?auto_327708 ?auto_327711 ) ) ( not ( = ?auto_327708 ?auto_327712 ) ) ( not ( = ?auto_327708 ?auto_327713 ) ) ( not ( = ?auto_327708 ?auto_327714 ) ) ( not ( = ?auto_327708 ?auto_327715 ) ) ( not ( = ?auto_327708 ?auto_327716 ) ) ( not ( = ?auto_327709 ?auto_327710 ) ) ( not ( = ?auto_327709 ?auto_327711 ) ) ( not ( = ?auto_327709 ?auto_327712 ) ) ( not ( = ?auto_327709 ?auto_327713 ) ) ( not ( = ?auto_327709 ?auto_327714 ) ) ( not ( = ?auto_327709 ?auto_327715 ) ) ( not ( = ?auto_327709 ?auto_327716 ) ) ( not ( = ?auto_327710 ?auto_327711 ) ) ( not ( = ?auto_327710 ?auto_327712 ) ) ( not ( = ?auto_327710 ?auto_327713 ) ) ( not ( = ?auto_327710 ?auto_327714 ) ) ( not ( = ?auto_327710 ?auto_327715 ) ) ( not ( = ?auto_327710 ?auto_327716 ) ) ( not ( = ?auto_327711 ?auto_327712 ) ) ( not ( = ?auto_327711 ?auto_327713 ) ) ( not ( = ?auto_327711 ?auto_327714 ) ) ( not ( = ?auto_327711 ?auto_327715 ) ) ( not ( = ?auto_327711 ?auto_327716 ) ) ( not ( = ?auto_327712 ?auto_327713 ) ) ( not ( = ?auto_327712 ?auto_327714 ) ) ( not ( = ?auto_327712 ?auto_327715 ) ) ( not ( = ?auto_327712 ?auto_327716 ) ) ( not ( = ?auto_327713 ?auto_327714 ) ) ( not ( = ?auto_327713 ?auto_327715 ) ) ( not ( = ?auto_327713 ?auto_327716 ) ) ( not ( = ?auto_327714 ?auto_327715 ) ) ( not ( = ?auto_327714 ?auto_327716 ) ) ( not ( = ?auto_327715 ?auto_327716 ) ) ( ON ?auto_327714 ?auto_327715 ) ( ON ?auto_327713 ?auto_327714 ) ( CLEAR ?auto_327711 ) ( ON ?auto_327712 ?auto_327713 ) ( CLEAR ?auto_327712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_327706 ?auto_327707 ?auto_327708 ?auto_327709 ?auto_327710 ?auto_327711 ?auto_327712 )
      ( MAKE-10PILE ?auto_327706 ?auto_327707 ?auto_327708 ?auto_327709 ?auto_327710 ?auto_327711 ?auto_327712 ?auto_327713 ?auto_327714 ?auto_327715 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327748 - BLOCK
      ?auto_327749 - BLOCK
      ?auto_327750 - BLOCK
      ?auto_327751 - BLOCK
      ?auto_327752 - BLOCK
      ?auto_327753 - BLOCK
      ?auto_327754 - BLOCK
      ?auto_327755 - BLOCK
      ?auto_327756 - BLOCK
      ?auto_327757 - BLOCK
    )
    :vars
    (
      ?auto_327758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327757 ?auto_327758 ) ( ON-TABLE ?auto_327748 ) ( ON ?auto_327749 ?auto_327748 ) ( ON ?auto_327750 ?auto_327749 ) ( ON ?auto_327751 ?auto_327750 ) ( ON ?auto_327752 ?auto_327751 ) ( not ( = ?auto_327748 ?auto_327749 ) ) ( not ( = ?auto_327748 ?auto_327750 ) ) ( not ( = ?auto_327748 ?auto_327751 ) ) ( not ( = ?auto_327748 ?auto_327752 ) ) ( not ( = ?auto_327748 ?auto_327753 ) ) ( not ( = ?auto_327748 ?auto_327754 ) ) ( not ( = ?auto_327748 ?auto_327755 ) ) ( not ( = ?auto_327748 ?auto_327756 ) ) ( not ( = ?auto_327748 ?auto_327757 ) ) ( not ( = ?auto_327748 ?auto_327758 ) ) ( not ( = ?auto_327749 ?auto_327750 ) ) ( not ( = ?auto_327749 ?auto_327751 ) ) ( not ( = ?auto_327749 ?auto_327752 ) ) ( not ( = ?auto_327749 ?auto_327753 ) ) ( not ( = ?auto_327749 ?auto_327754 ) ) ( not ( = ?auto_327749 ?auto_327755 ) ) ( not ( = ?auto_327749 ?auto_327756 ) ) ( not ( = ?auto_327749 ?auto_327757 ) ) ( not ( = ?auto_327749 ?auto_327758 ) ) ( not ( = ?auto_327750 ?auto_327751 ) ) ( not ( = ?auto_327750 ?auto_327752 ) ) ( not ( = ?auto_327750 ?auto_327753 ) ) ( not ( = ?auto_327750 ?auto_327754 ) ) ( not ( = ?auto_327750 ?auto_327755 ) ) ( not ( = ?auto_327750 ?auto_327756 ) ) ( not ( = ?auto_327750 ?auto_327757 ) ) ( not ( = ?auto_327750 ?auto_327758 ) ) ( not ( = ?auto_327751 ?auto_327752 ) ) ( not ( = ?auto_327751 ?auto_327753 ) ) ( not ( = ?auto_327751 ?auto_327754 ) ) ( not ( = ?auto_327751 ?auto_327755 ) ) ( not ( = ?auto_327751 ?auto_327756 ) ) ( not ( = ?auto_327751 ?auto_327757 ) ) ( not ( = ?auto_327751 ?auto_327758 ) ) ( not ( = ?auto_327752 ?auto_327753 ) ) ( not ( = ?auto_327752 ?auto_327754 ) ) ( not ( = ?auto_327752 ?auto_327755 ) ) ( not ( = ?auto_327752 ?auto_327756 ) ) ( not ( = ?auto_327752 ?auto_327757 ) ) ( not ( = ?auto_327752 ?auto_327758 ) ) ( not ( = ?auto_327753 ?auto_327754 ) ) ( not ( = ?auto_327753 ?auto_327755 ) ) ( not ( = ?auto_327753 ?auto_327756 ) ) ( not ( = ?auto_327753 ?auto_327757 ) ) ( not ( = ?auto_327753 ?auto_327758 ) ) ( not ( = ?auto_327754 ?auto_327755 ) ) ( not ( = ?auto_327754 ?auto_327756 ) ) ( not ( = ?auto_327754 ?auto_327757 ) ) ( not ( = ?auto_327754 ?auto_327758 ) ) ( not ( = ?auto_327755 ?auto_327756 ) ) ( not ( = ?auto_327755 ?auto_327757 ) ) ( not ( = ?auto_327755 ?auto_327758 ) ) ( not ( = ?auto_327756 ?auto_327757 ) ) ( not ( = ?auto_327756 ?auto_327758 ) ) ( not ( = ?auto_327757 ?auto_327758 ) ) ( ON ?auto_327756 ?auto_327757 ) ( ON ?auto_327755 ?auto_327756 ) ( ON ?auto_327754 ?auto_327755 ) ( CLEAR ?auto_327752 ) ( ON ?auto_327753 ?auto_327754 ) ( CLEAR ?auto_327753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_327748 ?auto_327749 ?auto_327750 ?auto_327751 ?auto_327752 ?auto_327753 )
      ( MAKE-10PILE ?auto_327748 ?auto_327749 ?auto_327750 ?auto_327751 ?auto_327752 ?auto_327753 ?auto_327754 ?auto_327755 ?auto_327756 ?auto_327757 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327790 - BLOCK
      ?auto_327791 - BLOCK
      ?auto_327792 - BLOCK
      ?auto_327793 - BLOCK
      ?auto_327794 - BLOCK
      ?auto_327795 - BLOCK
      ?auto_327796 - BLOCK
      ?auto_327797 - BLOCK
      ?auto_327798 - BLOCK
      ?auto_327799 - BLOCK
    )
    :vars
    (
      ?auto_327800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327799 ?auto_327800 ) ( ON-TABLE ?auto_327790 ) ( ON ?auto_327791 ?auto_327790 ) ( ON ?auto_327792 ?auto_327791 ) ( ON ?auto_327793 ?auto_327792 ) ( not ( = ?auto_327790 ?auto_327791 ) ) ( not ( = ?auto_327790 ?auto_327792 ) ) ( not ( = ?auto_327790 ?auto_327793 ) ) ( not ( = ?auto_327790 ?auto_327794 ) ) ( not ( = ?auto_327790 ?auto_327795 ) ) ( not ( = ?auto_327790 ?auto_327796 ) ) ( not ( = ?auto_327790 ?auto_327797 ) ) ( not ( = ?auto_327790 ?auto_327798 ) ) ( not ( = ?auto_327790 ?auto_327799 ) ) ( not ( = ?auto_327790 ?auto_327800 ) ) ( not ( = ?auto_327791 ?auto_327792 ) ) ( not ( = ?auto_327791 ?auto_327793 ) ) ( not ( = ?auto_327791 ?auto_327794 ) ) ( not ( = ?auto_327791 ?auto_327795 ) ) ( not ( = ?auto_327791 ?auto_327796 ) ) ( not ( = ?auto_327791 ?auto_327797 ) ) ( not ( = ?auto_327791 ?auto_327798 ) ) ( not ( = ?auto_327791 ?auto_327799 ) ) ( not ( = ?auto_327791 ?auto_327800 ) ) ( not ( = ?auto_327792 ?auto_327793 ) ) ( not ( = ?auto_327792 ?auto_327794 ) ) ( not ( = ?auto_327792 ?auto_327795 ) ) ( not ( = ?auto_327792 ?auto_327796 ) ) ( not ( = ?auto_327792 ?auto_327797 ) ) ( not ( = ?auto_327792 ?auto_327798 ) ) ( not ( = ?auto_327792 ?auto_327799 ) ) ( not ( = ?auto_327792 ?auto_327800 ) ) ( not ( = ?auto_327793 ?auto_327794 ) ) ( not ( = ?auto_327793 ?auto_327795 ) ) ( not ( = ?auto_327793 ?auto_327796 ) ) ( not ( = ?auto_327793 ?auto_327797 ) ) ( not ( = ?auto_327793 ?auto_327798 ) ) ( not ( = ?auto_327793 ?auto_327799 ) ) ( not ( = ?auto_327793 ?auto_327800 ) ) ( not ( = ?auto_327794 ?auto_327795 ) ) ( not ( = ?auto_327794 ?auto_327796 ) ) ( not ( = ?auto_327794 ?auto_327797 ) ) ( not ( = ?auto_327794 ?auto_327798 ) ) ( not ( = ?auto_327794 ?auto_327799 ) ) ( not ( = ?auto_327794 ?auto_327800 ) ) ( not ( = ?auto_327795 ?auto_327796 ) ) ( not ( = ?auto_327795 ?auto_327797 ) ) ( not ( = ?auto_327795 ?auto_327798 ) ) ( not ( = ?auto_327795 ?auto_327799 ) ) ( not ( = ?auto_327795 ?auto_327800 ) ) ( not ( = ?auto_327796 ?auto_327797 ) ) ( not ( = ?auto_327796 ?auto_327798 ) ) ( not ( = ?auto_327796 ?auto_327799 ) ) ( not ( = ?auto_327796 ?auto_327800 ) ) ( not ( = ?auto_327797 ?auto_327798 ) ) ( not ( = ?auto_327797 ?auto_327799 ) ) ( not ( = ?auto_327797 ?auto_327800 ) ) ( not ( = ?auto_327798 ?auto_327799 ) ) ( not ( = ?auto_327798 ?auto_327800 ) ) ( not ( = ?auto_327799 ?auto_327800 ) ) ( ON ?auto_327798 ?auto_327799 ) ( ON ?auto_327797 ?auto_327798 ) ( ON ?auto_327796 ?auto_327797 ) ( ON ?auto_327795 ?auto_327796 ) ( CLEAR ?auto_327793 ) ( ON ?auto_327794 ?auto_327795 ) ( CLEAR ?auto_327794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_327790 ?auto_327791 ?auto_327792 ?auto_327793 ?auto_327794 )
      ( MAKE-10PILE ?auto_327790 ?auto_327791 ?auto_327792 ?auto_327793 ?auto_327794 ?auto_327795 ?auto_327796 ?auto_327797 ?auto_327798 ?auto_327799 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327832 - BLOCK
      ?auto_327833 - BLOCK
      ?auto_327834 - BLOCK
      ?auto_327835 - BLOCK
      ?auto_327836 - BLOCK
      ?auto_327837 - BLOCK
      ?auto_327838 - BLOCK
      ?auto_327839 - BLOCK
      ?auto_327840 - BLOCK
      ?auto_327841 - BLOCK
    )
    :vars
    (
      ?auto_327842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327841 ?auto_327842 ) ( ON-TABLE ?auto_327832 ) ( ON ?auto_327833 ?auto_327832 ) ( ON ?auto_327834 ?auto_327833 ) ( not ( = ?auto_327832 ?auto_327833 ) ) ( not ( = ?auto_327832 ?auto_327834 ) ) ( not ( = ?auto_327832 ?auto_327835 ) ) ( not ( = ?auto_327832 ?auto_327836 ) ) ( not ( = ?auto_327832 ?auto_327837 ) ) ( not ( = ?auto_327832 ?auto_327838 ) ) ( not ( = ?auto_327832 ?auto_327839 ) ) ( not ( = ?auto_327832 ?auto_327840 ) ) ( not ( = ?auto_327832 ?auto_327841 ) ) ( not ( = ?auto_327832 ?auto_327842 ) ) ( not ( = ?auto_327833 ?auto_327834 ) ) ( not ( = ?auto_327833 ?auto_327835 ) ) ( not ( = ?auto_327833 ?auto_327836 ) ) ( not ( = ?auto_327833 ?auto_327837 ) ) ( not ( = ?auto_327833 ?auto_327838 ) ) ( not ( = ?auto_327833 ?auto_327839 ) ) ( not ( = ?auto_327833 ?auto_327840 ) ) ( not ( = ?auto_327833 ?auto_327841 ) ) ( not ( = ?auto_327833 ?auto_327842 ) ) ( not ( = ?auto_327834 ?auto_327835 ) ) ( not ( = ?auto_327834 ?auto_327836 ) ) ( not ( = ?auto_327834 ?auto_327837 ) ) ( not ( = ?auto_327834 ?auto_327838 ) ) ( not ( = ?auto_327834 ?auto_327839 ) ) ( not ( = ?auto_327834 ?auto_327840 ) ) ( not ( = ?auto_327834 ?auto_327841 ) ) ( not ( = ?auto_327834 ?auto_327842 ) ) ( not ( = ?auto_327835 ?auto_327836 ) ) ( not ( = ?auto_327835 ?auto_327837 ) ) ( not ( = ?auto_327835 ?auto_327838 ) ) ( not ( = ?auto_327835 ?auto_327839 ) ) ( not ( = ?auto_327835 ?auto_327840 ) ) ( not ( = ?auto_327835 ?auto_327841 ) ) ( not ( = ?auto_327835 ?auto_327842 ) ) ( not ( = ?auto_327836 ?auto_327837 ) ) ( not ( = ?auto_327836 ?auto_327838 ) ) ( not ( = ?auto_327836 ?auto_327839 ) ) ( not ( = ?auto_327836 ?auto_327840 ) ) ( not ( = ?auto_327836 ?auto_327841 ) ) ( not ( = ?auto_327836 ?auto_327842 ) ) ( not ( = ?auto_327837 ?auto_327838 ) ) ( not ( = ?auto_327837 ?auto_327839 ) ) ( not ( = ?auto_327837 ?auto_327840 ) ) ( not ( = ?auto_327837 ?auto_327841 ) ) ( not ( = ?auto_327837 ?auto_327842 ) ) ( not ( = ?auto_327838 ?auto_327839 ) ) ( not ( = ?auto_327838 ?auto_327840 ) ) ( not ( = ?auto_327838 ?auto_327841 ) ) ( not ( = ?auto_327838 ?auto_327842 ) ) ( not ( = ?auto_327839 ?auto_327840 ) ) ( not ( = ?auto_327839 ?auto_327841 ) ) ( not ( = ?auto_327839 ?auto_327842 ) ) ( not ( = ?auto_327840 ?auto_327841 ) ) ( not ( = ?auto_327840 ?auto_327842 ) ) ( not ( = ?auto_327841 ?auto_327842 ) ) ( ON ?auto_327840 ?auto_327841 ) ( ON ?auto_327839 ?auto_327840 ) ( ON ?auto_327838 ?auto_327839 ) ( ON ?auto_327837 ?auto_327838 ) ( ON ?auto_327836 ?auto_327837 ) ( CLEAR ?auto_327834 ) ( ON ?auto_327835 ?auto_327836 ) ( CLEAR ?auto_327835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_327832 ?auto_327833 ?auto_327834 ?auto_327835 )
      ( MAKE-10PILE ?auto_327832 ?auto_327833 ?auto_327834 ?auto_327835 ?auto_327836 ?auto_327837 ?auto_327838 ?auto_327839 ?auto_327840 ?auto_327841 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327874 - BLOCK
      ?auto_327875 - BLOCK
      ?auto_327876 - BLOCK
      ?auto_327877 - BLOCK
      ?auto_327878 - BLOCK
      ?auto_327879 - BLOCK
      ?auto_327880 - BLOCK
      ?auto_327881 - BLOCK
      ?auto_327882 - BLOCK
      ?auto_327883 - BLOCK
    )
    :vars
    (
      ?auto_327884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327883 ?auto_327884 ) ( ON-TABLE ?auto_327874 ) ( ON ?auto_327875 ?auto_327874 ) ( not ( = ?auto_327874 ?auto_327875 ) ) ( not ( = ?auto_327874 ?auto_327876 ) ) ( not ( = ?auto_327874 ?auto_327877 ) ) ( not ( = ?auto_327874 ?auto_327878 ) ) ( not ( = ?auto_327874 ?auto_327879 ) ) ( not ( = ?auto_327874 ?auto_327880 ) ) ( not ( = ?auto_327874 ?auto_327881 ) ) ( not ( = ?auto_327874 ?auto_327882 ) ) ( not ( = ?auto_327874 ?auto_327883 ) ) ( not ( = ?auto_327874 ?auto_327884 ) ) ( not ( = ?auto_327875 ?auto_327876 ) ) ( not ( = ?auto_327875 ?auto_327877 ) ) ( not ( = ?auto_327875 ?auto_327878 ) ) ( not ( = ?auto_327875 ?auto_327879 ) ) ( not ( = ?auto_327875 ?auto_327880 ) ) ( not ( = ?auto_327875 ?auto_327881 ) ) ( not ( = ?auto_327875 ?auto_327882 ) ) ( not ( = ?auto_327875 ?auto_327883 ) ) ( not ( = ?auto_327875 ?auto_327884 ) ) ( not ( = ?auto_327876 ?auto_327877 ) ) ( not ( = ?auto_327876 ?auto_327878 ) ) ( not ( = ?auto_327876 ?auto_327879 ) ) ( not ( = ?auto_327876 ?auto_327880 ) ) ( not ( = ?auto_327876 ?auto_327881 ) ) ( not ( = ?auto_327876 ?auto_327882 ) ) ( not ( = ?auto_327876 ?auto_327883 ) ) ( not ( = ?auto_327876 ?auto_327884 ) ) ( not ( = ?auto_327877 ?auto_327878 ) ) ( not ( = ?auto_327877 ?auto_327879 ) ) ( not ( = ?auto_327877 ?auto_327880 ) ) ( not ( = ?auto_327877 ?auto_327881 ) ) ( not ( = ?auto_327877 ?auto_327882 ) ) ( not ( = ?auto_327877 ?auto_327883 ) ) ( not ( = ?auto_327877 ?auto_327884 ) ) ( not ( = ?auto_327878 ?auto_327879 ) ) ( not ( = ?auto_327878 ?auto_327880 ) ) ( not ( = ?auto_327878 ?auto_327881 ) ) ( not ( = ?auto_327878 ?auto_327882 ) ) ( not ( = ?auto_327878 ?auto_327883 ) ) ( not ( = ?auto_327878 ?auto_327884 ) ) ( not ( = ?auto_327879 ?auto_327880 ) ) ( not ( = ?auto_327879 ?auto_327881 ) ) ( not ( = ?auto_327879 ?auto_327882 ) ) ( not ( = ?auto_327879 ?auto_327883 ) ) ( not ( = ?auto_327879 ?auto_327884 ) ) ( not ( = ?auto_327880 ?auto_327881 ) ) ( not ( = ?auto_327880 ?auto_327882 ) ) ( not ( = ?auto_327880 ?auto_327883 ) ) ( not ( = ?auto_327880 ?auto_327884 ) ) ( not ( = ?auto_327881 ?auto_327882 ) ) ( not ( = ?auto_327881 ?auto_327883 ) ) ( not ( = ?auto_327881 ?auto_327884 ) ) ( not ( = ?auto_327882 ?auto_327883 ) ) ( not ( = ?auto_327882 ?auto_327884 ) ) ( not ( = ?auto_327883 ?auto_327884 ) ) ( ON ?auto_327882 ?auto_327883 ) ( ON ?auto_327881 ?auto_327882 ) ( ON ?auto_327880 ?auto_327881 ) ( ON ?auto_327879 ?auto_327880 ) ( ON ?auto_327878 ?auto_327879 ) ( ON ?auto_327877 ?auto_327878 ) ( CLEAR ?auto_327875 ) ( ON ?auto_327876 ?auto_327877 ) ( CLEAR ?auto_327876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_327874 ?auto_327875 ?auto_327876 )
      ( MAKE-10PILE ?auto_327874 ?auto_327875 ?auto_327876 ?auto_327877 ?auto_327878 ?auto_327879 ?auto_327880 ?auto_327881 ?auto_327882 ?auto_327883 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327916 - BLOCK
      ?auto_327917 - BLOCK
      ?auto_327918 - BLOCK
      ?auto_327919 - BLOCK
      ?auto_327920 - BLOCK
      ?auto_327921 - BLOCK
      ?auto_327922 - BLOCK
      ?auto_327923 - BLOCK
      ?auto_327924 - BLOCK
      ?auto_327925 - BLOCK
    )
    :vars
    (
      ?auto_327926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327925 ?auto_327926 ) ( ON-TABLE ?auto_327916 ) ( not ( = ?auto_327916 ?auto_327917 ) ) ( not ( = ?auto_327916 ?auto_327918 ) ) ( not ( = ?auto_327916 ?auto_327919 ) ) ( not ( = ?auto_327916 ?auto_327920 ) ) ( not ( = ?auto_327916 ?auto_327921 ) ) ( not ( = ?auto_327916 ?auto_327922 ) ) ( not ( = ?auto_327916 ?auto_327923 ) ) ( not ( = ?auto_327916 ?auto_327924 ) ) ( not ( = ?auto_327916 ?auto_327925 ) ) ( not ( = ?auto_327916 ?auto_327926 ) ) ( not ( = ?auto_327917 ?auto_327918 ) ) ( not ( = ?auto_327917 ?auto_327919 ) ) ( not ( = ?auto_327917 ?auto_327920 ) ) ( not ( = ?auto_327917 ?auto_327921 ) ) ( not ( = ?auto_327917 ?auto_327922 ) ) ( not ( = ?auto_327917 ?auto_327923 ) ) ( not ( = ?auto_327917 ?auto_327924 ) ) ( not ( = ?auto_327917 ?auto_327925 ) ) ( not ( = ?auto_327917 ?auto_327926 ) ) ( not ( = ?auto_327918 ?auto_327919 ) ) ( not ( = ?auto_327918 ?auto_327920 ) ) ( not ( = ?auto_327918 ?auto_327921 ) ) ( not ( = ?auto_327918 ?auto_327922 ) ) ( not ( = ?auto_327918 ?auto_327923 ) ) ( not ( = ?auto_327918 ?auto_327924 ) ) ( not ( = ?auto_327918 ?auto_327925 ) ) ( not ( = ?auto_327918 ?auto_327926 ) ) ( not ( = ?auto_327919 ?auto_327920 ) ) ( not ( = ?auto_327919 ?auto_327921 ) ) ( not ( = ?auto_327919 ?auto_327922 ) ) ( not ( = ?auto_327919 ?auto_327923 ) ) ( not ( = ?auto_327919 ?auto_327924 ) ) ( not ( = ?auto_327919 ?auto_327925 ) ) ( not ( = ?auto_327919 ?auto_327926 ) ) ( not ( = ?auto_327920 ?auto_327921 ) ) ( not ( = ?auto_327920 ?auto_327922 ) ) ( not ( = ?auto_327920 ?auto_327923 ) ) ( not ( = ?auto_327920 ?auto_327924 ) ) ( not ( = ?auto_327920 ?auto_327925 ) ) ( not ( = ?auto_327920 ?auto_327926 ) ) ( not ( = ?auto_327921 ?auto_327922 ) ) ( not ( = ?auto_327921 ?auto_327923 ) ) ( not ( = ?auto_327921 ?auto_327924 ) ) ( not ( = ?auto_327921 ?auto_327925 ) ) ( not ( = ?auto_327921 ?auto_327926 ) ) ( not ( = ?auto_327922 ?auto_327923 ) ) ( not ( = ?auto_327922 ?auto_327924 ) ) ( not ( = ?auto_327922 ?auto_327925 ) ) ( not ( = ?auto_327922 ?auto_327926 ) ) ( not ( = ?auto_327923 ?auto_327924 ) ) ( not ( = ?auto_327923 ?auto_327925 ) ) ( not ( = ?auto_327923 ?auto_327926 ) ) ( not ( = ?auto_327924 ?auto_327925 ) ) ( not ( = ?auto_327924 ?auto_327926 ) ) ( not ( = ?auto_327925 ?auto_327926 ) ) ( ON ?auto_327924 ?auto_327925 ) ( ON ?auto_327923 ?auto_327924 ) ( ON ?auto_327922 ?auto_327923 ) ( ON ?auto_327921 ?auto_327922 ) ( ON ?auto_327920 ?auto_327921 ) ( ON ?auto_327919 ?auto_327920 ) ( ON ?auto_327918 ?auto_327919 ) ( CLEAR ?auto_327916 ) ( ON ?auto_327917 ?auto_327918 ) ( CLEAR ?auto_327917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_327916 ?auto_327917 )
      ( MAKE-10PILE ?auto_327916 ?auto_327917 ?auto_327918 ?auto_327919 ?auto_327920 ?auto_327921 ?auto_327922 ?auto_327923 ?auto_327924 ?auto_327925 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_327958 - BLOCK
      ?auto_327959 - BLOCK
      ?auto_327960 - BLOCK
      ?auto_327961 - BLOCK
      ?auto_327962 - BLOCK
      ?auto_327963 - BLOCK
      ?auto_327964 - BLOCK
      ?auto_327965 - BLOCK
      ?auto_327966 - BLOCK
      ?auto_327967 - BLOCK
    )
    :vars
    (
      ?auto_327968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_327967 ?auto_327968 ) ( not ( = ?auto_327958 ?auto_327959 ) ) ( not ( = ?auto_327958 ?auto_327960 ) ) ( not ( = ?auto_327958 ?auto_327961 ) ) ( not ( = ?auto_327958 ?auto_327962 ) ) ( not ( = ?auto_327958 ?auto_327963 ) ) ( not ( = ?auto_327958 ?auto_327964 ) ) ( not ( = ?auto_327958 ?auto_327965 ) ) ( not ( = ?auto_327958 ?auto_327966 ) ) ( not ( = ?auto_327958 ?auto_327967 ) ) ( not ( = ?auto_327958 ?auto_327968 ) ) ( not ( = ?auto_327959 ?auto_327960 ) ) ( not ( = ?auto_327959 ?auto_327961 ) ) ( not ( = ?auto_327959 ?auto_327962 ) ) ( not ( = ?auto_327959 ?auto_327963 ) ) ( not ( = ?auto_327959 ?auto_327964 ) ) ( not ( = ?auto_327959 ?auto_327965 ) ) ( not ( = ?auto_327959 ?auto_327966 ) ) ( not ( = ?auto_327959 ?auto_327967 ) ) ( not ( = ?auto_327959 ?auto_327968 ) ) ( not ( = ?auto_327960 ?auto_327961 ) ) ( not ( = ?auto_327960 ?auto_327962 ) ) ( not ( = ?auto_327960 ?auto_327963 ) ) ( not ( = ?auto_327960 ?auto_327964 ) ) ( not ( = ?auto_327960 ?auto_327965 ) ) ( not ( = ?auto_327960 ?auto_327966 ) ) ( not ( = ?auto_327960 ?auto_327967 ) ) ( not ( = ?auto_327960 ?auto_327968 ) ) ( not ( = ?auto_327961 ?auto_327962 ) ) ( not ( = ?auto_327961 ?auto_327963 ) ) ( not ( = ?auto_327961 ?auto_327964 ) ) ( not ( = ?auto_327961 ?auto_327965 ) ) ( not ( = ?auto_327961 ?auto_327966 ) ) ( not ( = ?auto_327961 ?auto_327967 ) ) ( not ( = ?auto_327961 ?auto_327968 ) ) ( not ( = ?auto_327962 ?auto_327963 ) ) ( not ( = ?auto_327962 ?auto_327964 ) ) ( not ( = ?auto_327962 ?auto_327965 ) ) ( not ( = ?auto_327962 ?auto_327966 ) ) ( not ( = ?auto_327962 ?auto_327967 ) ) ( not ( = ?auto_327962 ?auto_327968 ) ) ( not ( = ?auto_327963 ?auto_327964 ) ) ( not ( = ?auto_327963 ?auto_327965 ) ) ( not ( = ?auto_327963 ?auto_327966 ) ) ( not ( = ?auto_327963 ?auto_327967 ) ) ( not ( = ?auto_327963 ?auto_327968 ) ) ( not ( = ?auto_327964 ?auto_327965 ) ) ( not ( = ?auto_327964 ?auto_327966 ) ) ( not ( = ?auto_327964 ?auto_327967 ) ) ( not ( = ?auto_327964 ?auto_327968 ) ) ( not ( = ?auto_327965 ?auto_327966 ) ) ( not ( = ?auto_327965 ?auto_327967 ) ) ( not ( = ?auto_327965 ?auto_327968 ) ) ( not ( = ?auto_327966 ?auto_327967 ) ) ( not ( = ?auto_327966 ?auto_327968 ) ) ( not ( = ?auto_327967 ?auto_327968 ) ) ( ON ?auto_327966 ?auto_327967 ) ( ON ?auto_327965 ?auto_327966 ) ( ON ?auto_327964 ?auto_327965 ) ( ON ?auto_327963 ?auto_327964 ) ( ON ?auto_327962 ?auto_327963 ) ( ON ?auto_327961 ?auto_327962 ) ( ON ?auto_327960 ?auto_327961 ) ( ON ?auto_327959 ?auto_327960 ) ( ON ?auto_327958 ?auto_327959 ) ( CLEAR ?auto_327958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_327958 )
      ( MAKE-10PILE ?auto_327958 ?auto_327959 ?auto_327960 ?auto_327961 ?auto_327962 ?auto_327963 ?auto_327964 ?auto_327965 ?auto_327966 ?auto_327967 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328001 - BLOCK
      ?auto_328002 - BLOCK
      ?auto_328003 - BLOCK
      ?auto_328004 - BLOCK
      ?auto_328005 - BLOCK
      ?auto_328006 - BLOCK
      ?auto_328007 - BLOCK
      ?auto_328008 - BLOCK
      ?auto_328009 - BLOCK
      ?auto_328010 - BLOCK
      ?auto_328011 - BLOCK
    )
    :vars
    (
      ?auto_328012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_328010 ) ( ON ?auto_328011 ?auto_328012 ) ( CLEAR ?auto_328011 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_328001 ) ( ON ?auto_328002 ?auto_328001 ) ( ON ?auto_328003 ?auto_328002 ) ( ON ?auto_328004 ?auto_328003 ) ( ON ?auto_328005 ?auto_328004 ) ( ON ?auto_328006 ?auto_328005 ) ( ON ?auto_328007 ?auto_328006 ) ( ON ?auto_328008 ?auto_328007 ) ( ON ?auto_328009 ?auto_328008 ) ( ON ?auto_328010 ?auto_328009 ) ( not ( = ?auto_328001 ?auto_328002 ) ) ( not ( = ?auto_328001 ?auto_328003 ) ) ( not ( = ?auto_328001 ?auto_328004 ) ) ( not ( = ?auto_328001 ?auto_328005 ) ) ( not ( = ?auto_328001 ?auto_328006 ) ) ( not ( = ?auto_328001 ?auto_328007 ) ) ( not ( = ?auto_328001 ?auto_328008 ) ) ( not ( = ?auto_328001 ?auto_328009 ) ) ( not ( = ?auto_328001 ?auto_328010 ) ) ( not ( = ?auto_328001 ?auto_328011 ) ) ( not ( = ?auto_328001 ?auto_328012 ) ) ( not ( = ?auto_328002 ?auto_328003 ) ) ( not ( = ?auto_328002 ?auto_328004 ) ) ( not ( = ?auto_328002 ?auto_328005 ) ) ( not ( = ?auto_328002 ?auto_328006 ) ) ( not ( = ?auto_328002 ?auto_328007 ) ) ( not ( = ?auto_328002 ?auto_328008 ) ) ( not ( = ?auto_328002 ?auto_328009 ) ) ( not ( = ?auto_328002 ?auto_328010 ) ) ( not ( = ?auto_328002 ?auto_328011 ) ) ( not ( = ?auto_328002 ?auto_328012 ) ) ( not ( = ?auto_328003 ?auto_328004 ) ) ( not ( = ?auto_328003 ?auto_328005 ) ) ( not ( = ?auto_328003 ?auto_328006 ) ) ( not ( = ?auto_328003 ?auto_328007 ) ) ( not ( = ?auto_328003 ?auto_328008 ) ) ( not ( = ?auto_328003 ?auto_328009 ) ) ( not ( = ?auto_328003 ?auto_328010 ) ) ( not ( = ?auto_328003 ?auto_328011 ) ) ( not ( = ?auto_328003 ?auto_328012 ) ) ( not ( = ?auto_328004 ?auto_328005 ) ) ( not ( = ?auto_328004 ?auto_328006 ) ) ( not ( = ?auto_328004 ?auto_328007 ) ) ( not ( = ?auto_328004 ?auto_328008 ) ) ( not ( = ?auto_328004 ?auto_328009 ) ) ( not ( = ?auto_328004 ?auto_328010 ) ) ( not ( = ?auto_328004 ?auto_328011 ) ) ( not ( = ?auto_328004 ?auto_328012 ) ) ( not ( = ?auto_328005 ?auto_328006 ) ) ( not ( = ?auto_328005 ?auto_328007 ) ) ( not ( = ?auto_328005 ?auto_328008 ) ) ( not ( = ?auto_328005 ?auto_328009 ) ) ( not ( = ?auto_328005 ?auto_328010 ) ) ( not ( = ?auto_328005 ?auto_328011 ) ) ( not ( = ?auto_328005 ?auto_328012 ) ) ( not ( = ?auto_328006 ?auto_328007 ) ) ( not ( = ?auto_328006 ?auto_328008 ) ) ( not ( = ?auto_328006 ?auto_328009 ) ) ( not ( = ?auto_328006 ?auto_328010 ) ) ( not ( = ?auto_328006 ?auto_328011 ) ) ( not ( = ?auto_328006 ?auto_328012 ) ) ( not ( = ?auto_328007 ?auto_328008 ) ) ( not ( = ?auto_328007 ?auto_328009 ) ) ( not ( = ?auto_328007 ?auto_328010 ) ) ( not ( = ?auto_328007 ?auto_328011 ) ) ( not ( = ?auto_328007 ?auto_328012 ) ) ( not ( = ?auto_328008 ?auto_328009 ) ) ( not ( = ?auto_328008 ?auto_328010 ) ) ( not ( = ?auto_328008 ?auto_328011 ) ) ( not ( = ?auto_328008 ?auto_328012 ) ) ( not ( = ?auto_328009 ?auto_328010 ) ) ( not ( = ?auto_328009 ?auto_328011 ) ) ( not ( = ?auto_328009 ?auto_328012 ) ) ( not ( = ?auto_328010 ?auto_328011 ) ) ( not ( = ?auto_328010 ?auto_328012 ) ) ( not ( = ?auto_328011 ?auto_328012 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_328011 ?auto_328012 )
      ( !STACK ?auto_328011 ?auto_328010 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328047 - BLOCK
      ?auto_328048 - BLOCK
      ?auto_328049 - BLOCK
      ?auto_328050 - BLOCK
      ?auto_328051 - BLOCK
      ?auto_328052 - BLOCK
      ?auto_328053 - BLOCK
      ?auto_328054 - BLOCK
      ?auto_328055 - BLOCK
      ?auto_328056 - BLOCK
      ?auto_328057 - BLOCK
    )
    :vars
    (
      ?auto_328058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328057 ?auto_328058 ) ( ON-TABLE ?auto_328047 ) ( ON ?auto_328048 ?auto_328047 ) ( ON ?auto_328049 ?auto_328048 ) ( ON ?auto_328050 ?auto_328049 ) ( ON ?auto_328051 ?auto_328050 ) ( ON ?auto_328052 ?auto_328051 ) ( ON ?auto_328053 ?auto_328052 ) ( ON ?auto_328054 ?auto_328053 ) ( ON ?auto_328055 ?auto_328054 ) ( not ( = ?auto_328047 ?auto_328048 ) ) ( not ( = ?auto_328047 ?auto_328049 ) ) ( not ( = ?auto_328047 ?auto_328050 ) ) ( not ( = ?auto_328047 ?auto_328051 ) ) ( not ( = ?auto_328047 ?auto_328052 ) ) ( not ( = ?auto_328047 ?auto_328053 ) ) ( not ( = ?auto_328047 ?auto_328054 ) ) ( not ( = ?auto_328047 ?auto_328055 ) ) ( not ( = ?auto_328047 ?auto_328056 ) ) ( not ( = ?auto_328047 ?auto_328057 ) ) ( not ( = ?auto_328047 ?auto_328058 ) ) ( not ( = ?auto_328048 ?auto_328049 ) ) ( not ( = ?auto_328048 ?auto_328050 ) ) ( not ( = ?auto_328048 ?auto_328051 ) ) ( not ( = ?auto_328048 ?auto_328052 ) ) ( not ( = ?auto_328048 ?auto_328053 ) ) ( not ( = ?auto_328048 ?auto_328054 ) ) ( not ( = ?auto_328048 ?auto_328055 ) ) ( not ( = ?auto_328048 ?auto_328056 ) ) ( not ( = ?auto_328048 ?auto_328057 ) ) ( not ( = ?auto_328048 ?auto_328058 ) ) ( not ( = ?auto_328049 ?auto_328050 ) ) ( not ( = ?auto_328049 ?auto_328051 ) ) ( not ( = ?auto_328049 ?auto_328052 ) ) ( not ( = ?auto_328049 ?auto_328053 ) ) ( not ( = ?auto_328049 ?auto_328054 ) ) ( not ( = ?auto_328049 ?auto_328055 ) ) ( not ( = ?auto_328049 ?auto_328056 ) ) ( not ( = ?auto_328049 ?auto_328057 ) ) ( not ( = ?auto_328049 ?auto_328058 ) ) ( not ( = ?auto_328050 ?auto_328051 ) ) ( not ( = ?auto_328050 ?auto_328052 ) ) ( not ( = ?auto_328050 ?auto_328053 ) ) ( not ( = ?auto_328050 ?auto_328054 ) ) ( not ( = ?auto_328050 ?auto_328055 ) ) ( not ( = ?auto_328050 ?auto_328056 ) ) ( not ( = ?auto_328050 ?auto_328057 ) ) ( not ( = ?auto_328050 ?auto_328058 ) ) ( not ( = ?auto_328051 ?auto_328052 ) ) ( not ( = ?auto_328051 ?auto_328053 ) ) ( not ( = ?auto_328051 ?auto_328054 ) ) ( not ( = ?auto_328051 ?auto_328055 ) ) ( not ( = ?auto_328051 ?auto_328056 ) ) ( not ( = ?auto_328051 ?auto_328057 ) ) ( not ( = ?auto_328051 ?auto_328058 ) ) ( not ( = ?auto_328052 ?auto_328053 ) ) ( not ( = ?auto_328052 ?auto_328054 ) ) ( not ( = ?auto_328052 ?auto_328055 ) ) ( not ( = ?auto_328052 ?auto_328056 ) ) ( not ( = ?auto_328052 ?auto_328057 ) ) ( not ( = ?auto_328052 ?auto_328058 ) ) ( not ( = ?auto_328053 ?auto_328054 ) ) ( not ( = ?auto_328053 ?auto_328055 ) ) ( not ( = ?auto_328053 ?auto_328056 ) ) ( not ( = ?auto_328053 ?auto_328057 ) ) ( not ( = ?auto_328053 ?auto_328058 ) ) ( not ( = ?auto_328054 ?auto_328055 ) ) ( not ( = ?auto_328054 ?auto_328056 ) ) ( not ( = ?auto_328054 ?auto_328057 ) ) ( not ( = ?auto_328054 ?auto_328058 ) ) ( not ( = ?auto_328055 ?auto_328056 ) ) ( not ( = ?auto_328055 ?auto_328057 ) ) ( not ( = ?auto_328055 ?auto_328058 ) ) ( not ( = ?auto_328056 ?auto_328057 ) ) ( not ( = ?auto_328056 ?auto_328058 ) ) ( not ( = ?auto_328057 ?auto_328058 ) ) ( CLEAR ?auto_328055 ) ( ON ?auto_328056 ?auto_328057 ) ( CLEAR ?auto_328056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_328047 ?auto_328048 ?auto_328049 ?auto_328050 ?auto_328051 ?auto_328052 ?auto_328053 ?auto_328054 ?auto_328055 ?auto_328056 )
      ( MAKE-11PILE ?auto_328047 ?auto_328048 ?auto_328049 ?auto_328050 ?auto_328051 ?auto_328052 ?auto_328053 ?auto_328054 ?auto_328055 ?auto_328056 ?auto_328057 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328093 - BLOCK
      ?auto_328094 - BLOCK
      ?auto_328095 - BLOCK
      ?auto_328096 - BLOCK
      ?auto_328097 - BLOCK
      ?auto_328098 - BLOCK
      ?auto_328099 - BLOCK
      ?auto_328100 - BLOCK
      ?auto_328101 - BLOCK
      ?auto_328102 - BLOCK
      ?auto_328103 - BLOCK
    )
    :vars
    (
      ?auto_328104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328103 ?auto_328104 ) ( ON-TABLE ?auto_328093 ) ( ON ?auto_328094 ?auto_328093 ) ( ON ?auto_328095 ?auto_328094 ) ( ON ?auto_328096 ?auto_328095 ) ( ON ?auto_328097 ?auto_328096 ) ( ON ?auto_328098 ?auto_328097 ) ( ON ?auto_328099 ?auto_328098 ) ( ON ?auto_328100 ?auto_328099 ) ( not ( = ?auto_328093 ?auto_328094 ) ) ( not ( = ?auto_328093 ?auto_328095 ) ) ( not ( = ?auto_328093 ?auto_328096 ) ) ( not ( = ?auto_328093 ?auto_328097 ) ) ( not ( = ?auto_328093 ?auto_328098 ) ) ( not ( = ?auto_328093 ?auto_328099 ) ) ( not ( = ?auto_328093 ?auto_328100 ) ) ( not ( = ?auto_328093 ?auto_328101 ) ) ( not ( = ?auto_328093 ?auto_328102 ) ) ( not ( = ?auto_328093 ?auto_328103 ) ) ( not ( = ?auto_328093 ?auto_328104 ) ) ( not ( = ?auto_328094 ?auto_328095 ) ) ( not ( = ?auto_328094 ?auto_328096 ) ) ( not ( = ?auto_328094 ?auto_328097 ) ) ( not ( = ?auto_328094 ?auto_328098 ) ) ( not ( = ?auto_328094 ?auto_328099 ) ) ( not ( = ?auto_328094 ?auto_328100 ) ) ( not ( = ?auto_328094 ?auto_328101 ) ) ( not ( = ?auto_328094 ?auto_328102 ) ) ( not ( = ?auto_328094 ?auto_328103 ) ) ( not ( = ?auto_328094 ?auto_328104 ) ) ( not ( = ?auto_328095 ?auto_328096 ) ) ( not ( = ?auto_328095 ?auto_328097 ) ) ( not ( = ?auto_328095 ?auto_328098 ) ) ( not ( = ?auto_328095 ?auto_328099 ) ) ( not ( = ?auto_328095 ?auto_328100 ) ) ( not ( = ?auto_328095 ?auto_328101 ) ) ( not ( = ?auto_328095 ?auto_328102 ) ) ( not ( = ?auto_328095 ?auto_328103 ) ) ( not ( = ?auto_328095 ?auto_328104 ) ) ( not ( = ?auto_328096 ?auto_328097 ) ) ( not ( = ?auto_328096 ?auto_328098 ) ) ( not ( = ?auto_328096 ?auto_328099 ) ) ( not ( = ?auto_328096 ?auto_328100 ) ) ( not ( = ?auto_328096 ?auto_328101 ) ) ( not ( = ?auto_328096 ?auto_328102 ) ) ( not ( = ?auto_328096 ?auto_328103 ) ) ( not ( = ?auto_328096 ?auto_328104 ) ) ( not ( = ?auto_328097 ?auto_328098 ) ) ( not ( = ?auto_328097 ?auto_328099 ) ) ( not ( = ?auto_328097 ?auto_328100 ) ) ( not ( = ?auto_328097 ?auto_328101 ) ) ( not ( = ?auto_328097 ?auto_328102 ) ) ( not ( = ?auto_328097 ?auto_328103 ) ) ( not ( = ?auto_328097 ?auto_328104 ) ) ( not ( = ?auto_328098 ?auto_328099 ) ) ( not ( = ?auto_328098 ?auto_328100 ) ) ( not ( = ?auto_328098 ?auto_328101 ) ) ( not ( = ?auto_328098 ?auto_328102 ) ) ( not ( = ?auto_328098 ?auto_328103 ) ) ( not ( = ?auto_328098 ?auto_328104 ) ) ( not ( = ?auto_328099 ?auto_328100 ) ) ( not ( = ?auto_328099 ?auto_328101 ) ) ( not ( = ?auto_328099 ?auto_328102 ) ) ( not ( = ?auto_328099 ?auto_328103 ) ) ( not ( = ?auto_328099 ?auto_328104 ) ) ( not ( = ?auto_328100 ?auto_328101 ) ) ( not ( = ?auto_328100 ?auto_328102 ) ) ( not ( = ?auto_328100 ?auto_328103 ) ) ( not ( = ?auto_328100 ?auto_328104 ) ) ( not ( = ?auto_328101 ?auto_328102 ) ) ( not ( = ?auto_328101 ?auto_328103 ) ) ( not ( = ?auto_328101 ?auto_328104 ) ) ( not ( = ?auto_328102 ?auto_328103 ) ) ( not ( = ?auto_328102 ?auto_328104 ) ) ( not ( = ?auto_328103 ?auto_328104 ) ) ( ON ?auto_328102 ?auto_328103 ) ( CLEAR ?auto_328100 ) ( ON ?auto_328101 ?auto_328102 ) ( CLEAR ?auto_328101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_328093 ?auto_328094 ?auto_328095 ?auto_328096 ?auto_328097 ?auto_328098 ?auto_328099 ?auto_328100 ?auto_328101 )
      ( MAKE-11PILE ?auto_328093 ?auto_328094 ?auto_328095 ?auto_328096 ?auto_328097 ?auto_328098 ?auto_328099 ?auto_328100 ?auto_328101 ?auto_328102 ?auto_328103 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328139 - BLOCK
      ?auto_328140 - BLOCK
      ?auto_328141 - BLOCK
      ?auto_328142 - BLOCK
      ?auto_328143 - BLOCK
      ?auto_328144 - BLOCK
      ?auto_328145 - BLOCK
      ?auto_328146 - BLOCK
      ?auto_328147 - BLOCK
      ?auto_328148 - BLOCK
      ?auto_328149 - BLOCK
    )
    :vars
    (
      ?auto_328150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328149 ?auto_328150 ) ( ON-TABLE ?auto_328139 ) ( ON ?auto_328140 ?auto_328139 ) ( ON ?auto_328141 ?auto_328140 ) ( ON ?auto_328142 ?auto_328141 ) ( ON ?auto_328143 ?auto_328142 ) ( ON ?auto_328144 ?auto_328143 ) ( ON ?auto_328145 ?auto_328144 ) ( not ( = ?auto_328139 ?auto_328140 ) ) ( not ( = ?auto_328139 ?auto_328141 ) ) ( not ( = ?auto_328139 ?auto_328142 ) ) ( not ( = ?auto_328139 ?auto_328143 ) ) ( not ( = ?auto_328139 ?auto_328144 ) ) ( not ( = ?auto_328139 ?auto_328145 ) ) ( not ( = ?auto_328139 ?auto_328146 ) ) ( not ( = ?auto_328139 ?auto_328147 ) ) ( not ( = ?auto_328139 ?auto_328148 ) ) ( not ( = ?auto_328139 ?auto_328149 ) ) ( not ( = ?auto_328139 ?auto_328150 ) ) ( not ( = ?auto_328140 ?auto_328141 ) ) ( not ( = ?auto_328140 ?auto_328142 ) ) ( not ( = ?auto_328140 ?auto_328143 ) ) ( not ( = ?auto_328140 ?auto_328144 ) ) ( not ( = ?auto_328140 ?auto_328145 ) ) ( not ( = ?auto_328140 ?auto_328146 ) ) ( not ( = ?auto_328140 ?auto_328147 ) ) ( not ( = ?auto_328140 ?auto_328148 ) ) ( not ( = ?auto_328140 ?auto_328149 ) ) ( not ( = ?auto_328140 ?auto_328150 ) ) ( not ( = ?auto_328141 ?auto_328142 ) ) ( not ( = ?auto_328141 ?auto_328143 ) ) ( not ( = ?auto_328141 ?auto_328144 ) ) ( not ( = ?auto_328141 ?auto_328145 ) ) ( not ( = ?auto_328141 ?auto_328146 ) ) ( not ( = ?auto_328141 ?auto_328147 ) ) ( not ( = ?auto_328141 ?auto_328148 ) ) ( not ( = ?auto_328141 ?auto_328149 ) ) ( not ( = ?auto_328141 ?auto_328150 ) ) ( not ( = ?auto_328142 ?auto_328143 ) ) ( not ( = ?auto_328142 ?auto_328144 ) ) ( not ( = ?auto_328142 ?auto_328145 ) ) ( not ( = ?auto_328142 ?auto_328146 ) ) ( not ( = ?auto_328142 ?auto_328147 ) ) ( not ( = ?auto_328142 ?auto_328148 ) ) ( not ( = ?auto_328142 ?auto_328149 ) ) ( not ( = ?auto_328142 ?auto_328150 ) ) ( not ( = ?auto_328143 ?auto_328144 ) ) ( not ( = ?auto_328143 ?auto_328145 ) ) ( not ( = ?auto_328143 ?auto_328146 ) ) ( not ( = ?auto_328143 ?auto_328147 ) ) ( not ( = ?auto_328143 ?auto_328148 ) ) ( not ( = ?auto_328143 ?auto_328149 ) ) ( not ( = ?auto_328143 ?auto_328150 ) ) ( not ( = ?auto_328144 ?auto_328145 ) ) ( not ( = ?auto_328144 ?auto_328146 ) ) ( not ( = ?auto_328144 ?auto_328147 ) ) ( not ( = ?auto_328144 ?auto_328148 ) ) ( not ( = ?auto_328144 ?auto_328149 ) ) ( not ( = ?auto_328144 ?auto_328150 ) ) ( not ( = ?auto_328145 ?auto_328146 ) ) ( not ( = ?auto_328145 ?auto_328147 ) ) ( not ( = ?auto_328145 ?auto_328148 ) ) ( not ( = ?auto_328145 ?auto_328149 ) ) ( not ( = ?auto_328145 ?auto_328150 ) ) ( not ( = ?auto_328146 ?auto_328147 ) ) ( not ( = ?auto_328146 ?auto_328148 ) ) ( not ( = ?auto_328146 ?auto_328149 ) ) ( not ( = ?auto_328146 ?auto_328150 ) ) ( not ( = ?auto_328147 ?auto_328148 ) ) ( not ( = ?auto_328147 ?auto_328149 ) ) ( not ( = ?auto_328147 ?auto_328150 ) ) ( not ( = ?auto_328148 ?auto_328149 ) ) ( not ( = ?auto_328148 ?auto_328150 ) ) ( not ( = ?auto_328149 ?auto_328150 ) ) ( ON ?auto_328148 ?auto_328149 ) ( ON ?auto_328147 ?auto_328148 ) ( CLEAR ?auto_328145 ) ( ON ?auto_328146 ?auto_328147 ) ( CLEAR ?auto_328146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_328139 ?auto_328140 ?auto_328141 ?auto_328142 ?auto_328143 ?auto_328144 ?auto_328145 ?auto_328146 )
      ( MAKE-11PILE ?auto_328139 ?auto_328140 ?auto_328141 ?auto_328142 ?auto_328143 ?auto_328144 ?auto_328145 ?auto_328146 ?auto_328147 ?auto_328148 ?auto_328149 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328185 - BLOCK
      ?auto_328186 - BLOCK
      ?auto_328187 - BLOCK
      ?auto_328188 - BLOCK
      ?auto_328189 - BLOCK
      ?auto_328190 - BLOCK
      ?auto_328191 - BLOCK
      ?auto_328192 - BLOCK
      ?auto_328193 - BLOCK
      ?auto_328194 - BLOCK
      ?auto_328195 - BLOCK
    )
    :vars
    (
      ?auto_328196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328195 ?auto_328196 ) ( ON-TABLE ?auto_328185 ) ( ON ?auto_328186 ?auto_328185 ) ( ON ?auto_328187 ?auto_328186 ) ( ON ?auto_328188 ?auto_328187 ) ( ON ?auto_328189 ?auto_328188 ) ( ON ?auto_328190 ?auto_328189 ) ( not ( = ?auto_328185 ?auto_328186 ) ) ( not ( = ?auto_328185 ?auto_328187 ) ) ( not ( = ?auto_328185 ?auto_328188 ) ) ( not ( = ?auto_328185 ?auto_328189 ) ) ( not ( = ?auto_328185 ?auto_328190 ) ) ( not ( = ?auto_328185 ?auto_328191 ) ) ( not ( = ?auto_328185 ?auto_328192 ) ) ( not ( = ?auto_328185 ?auto_328193 ) ) ( not ( = ?auto_328185 ?auto_328194 ) ) ( not ( = ?auto_328185 ?auto_328195 ) ) ( not ( = ?auto_328185 ?auto_328196 ) ) ( not ( = ?auto_328186 ?auto_328187 ) ) ( not ( = ?auto_328186 ?auto_328188 ) ) ( not ( = ?auto_328186 ?auto_328189 ) ) ( not ( = ?auto_328186 ?auto_328190 ) ) ( not ( = ?auto_328186 ?auto_328191 ) ) ( not ( = ?auto_328186 ?auto_328192 ) ) ( not ( = ?auto_328186 ?auto_328193 ) ) ( not ( = ?auto_328186 ?auto_328194 ) ) ( not ( = ?auto_328186 ?auto_328195 ) ) ( not ( = ?auto_328186 ?auto_328196 ) ) ( not ( = ?auto_328187 ?auto_328188 ) ) ( not ( = ?auto_328187 ?auto_328189 ) ) ( not ( = ?auto_328187 ?auto_328190 ) ) ( not ( = ?auto_328187 ?auto_328191 ) ) ( not ( = ?auto_328187 ?auto_328192 ) ) ( not ( = ?auto_328187 ?auto_328193 ) ) ( not ( = ?auto_328187 ?auto_328194 ) ) ( not ( = ?auto_328187 ?auto_328195 ) ) ( not ( = ?auto_328187 ?auto_328196 ) ) ( not ( = ?auto_328188 ?auto_328189 ) ) ( not ( = ?auto_328188 ?auto_328190 ) ) ( not ( = ?auto_328188 ?auto_328191 ) ) ( not ( = ?auto_328188 ?auto_328192 ) ) ( not ( = ?auto_328188 ?auto_328193 ) ) ( not ( = ?auto_328188 ?auto_328194 ) ) ( not ( = ?auto_328188 ?auto_328195 ) ) ( not ( = ?auto_328188 ?auto_328196 ) ) ( not ( = ?auto_328189 ?auto_328190 ) ) ( not ( = ?auto_328189 ?auto_328191 ) ) ( not ( = ?auto_328189 ?auto_328192 ) ) ( not ( = ?auto_328189 ?auto_328193 ) ) ( not ( = ?auto_328189 ?auto_328194 ) ) ( not ( = ?auto_328189 ?auto_328195 ) ) ( not ( = ?auto_328189 ?auto_328196 ) ) ( not ( = ?auto_328190 ?auto_328191 ) ) ( not ( = ?auto_328190 ?auto_328192 ) ) ( not ( = ?auto_328190 ?auto_328193 ) ) ( not ( = ?auto_328190 ?auto_328194 ) ) ( not ( = ?auto_328190 ?auto_328195 ) ) ( not ( = ?auto_328190 ?auto_328196 ) ) ( not ( = ?auto_328191 ?auto_328192 ) ) ( not ( = ?auto_328191 ?auto_328193 ) ) ( not ( = ?auto_328191 ?auto_328194 ) ) ( not ( = ?auto_328191 ?auto_328195 ) ) ( not ( = ?auto_328191 ?auto_328196 ) ) ( not ( = ?auto_328192 ?auto_328193 ) ) ( not ( = ?auto_328192 ?auto_328194 ) ) ( not ( = ?auto_328192 ?auto_328195 ) ) ( not ( = ?auto_328192 ?auto_328196 ) ) ( not ( = ?auto_328193 ?auto_328194 ) ) ( not ( = ?auto_328193 ?auto_328195 ) ) ( not ( = ?auto_328193 ?auto_328196 ) ) ( not ( = ?auto_328194 ?auto_328195 ) ) ( not ( = ?auto_328194 ?auto_328196 ) ) ( not ( = ?auto_328195 ?auto_328196 ) ) ( ON ?auto_328194 ?auto_328195 ) ( ON ?auto_328193 ?auto_328194 ) ( ON ?auto_328192 ?auto_328193 ) ( CLEAR ?auto_328190 ) ( ON ?auto_328191 ?auto_328192 ) ( CLEAR ?auto_328191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_328185 ?auto_328186 ?auto_328187 ?auto_328188 ?auto_328189 ?auto_328190 ?auto_328191 )
      ( MAKE-11PILE ?auto_328185 ?auto_328186 ?auto_328187 ?auto_328188 ?auto_328189 ?auto_328190 ?auto_328191 ?auto_328192 ?auto_328193 ?auto_328194 ?auto_328195 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328231 - BLOCK
      ?auto_328232 - BLOCK
      ?auto_328233 - BLOCK
      ?auto_328234 - BLOCK
      ?auto_328235 - BLOCK
      ?auto_328236 - BLOCK
      ?auto_328237 - BLOCK
      ?auto_328238 - BLOCK
      ?auto_328239 - BLOCK
      ?auto_328240 - BLOCK
      ?auto_328241 - BLOCK
    )
    :vars
    (
      ?auto_328242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328241 ?auto_328242 ) ( ON-TABLE ?auto_328231 ) ( ON ?auto_328232 ?auto_328231 ) ( ON ?auto_328233 ?auto_328232 ) ( ON ?auto_328234 ?auto_328233 ) ( ON ?auto_328235 ?auto_328234 ) ( not ( = ?auto_328231 ?auto_328232 ) ) ( not ( = ?auto_328231 ?auto_328233 ) ) ( not ( = ?auto_328231 ?auto_328234 ) ) ( not ( = ?auto_328231 ?auto_328235 ) ) ( not ( = ?auto_328231 ?auto_328236 ) ) ( not ( = ?auto_328231 ?auto_328237 ) ) ( not ( = ?auto_328231 ?auto_328238 ) ) ( not ( = ?auto_328231 ?auto_328239 ) ) ( not ( = ?auto_328231 ?auto_328240 ) ) ( not ( = ?auto_328231 ?auto_328241 ) ) ( not ( = ?auto_328231 ?auto_328242 ) ) ( not ( = ?auto_328232 ?auto_328233 ) ) ( not ( = ?auto_328232 ?auto_328234 ) ) ( not ( = ?auto_328232 ?auto_328235 ) ) ( not ( = ?auto_328232 ?auto_328236 ) ) ( not ( = ?auto_328232 ?auto_328237 ) ) ( not ( = ?auto_328232 ?auto_328238 ) ) ( not ( = ?auto_328232 ?auto_328239 ) ) ( not ( = ?auto_328232 ?auto_328240 ) ) ( not ( = ?auto_328232 ?auto_328241 ) ) ( not ( = ?auto_328232 ?auto_328242 ) ) ( not ( = ?auto_328233 ?auto_328234 ) ) ( not ( = ?auto_328233 ?auto_328235 ) ) ( not ( = ?auto_328233 ?auto_328236 ) ) ( not ( = ?auto_328233 ?auto_328237 ) ) ( not ( = ?auto_328233 ?auto_328238 ) ) ( not ( = ?auto_328233 ?auto_328239 ) ) ( not ( = ?auto_328233 ?auto_328240 ) ) ( not ( = ?auto_328233 ?auto_328241 ) ) ( not ( = ?auto_328233 ?auto_328242 ) ) ( not ( = ?auto_328234 ?auto_328235 ) ) ( not ( = ?auto_328234 ?auto_328236 ) ) ( not ( = ?auto_328234 ?auto_328237 ) ) ( not ( = ?auto_328234 ?auto_328238 ) ) ( not ( = ?auto_328234 ?auto_328239 ) ) ( not ( = ?auto_328234 ?auto_328240 ) ) ( not ( = ?auto_328234 ?auto_328241 ) ) ( not ( = ?auto_328234 ?auto_328242 ) ) ( not ( = ?auto_328235 ?auto_328236 ) ) ( not ( = ?auto_328235 ?auto_328237 ) ) ( not ( = ?auto_328235 ?auto_328238 ) ) ( not ( = ?auto_328235 ?auto_328239 ) ) ( not ( = ?auto_328235 ?auto_328240 ) ) ( not ( = ?auto_328235 ?auto_328241 ) ) ( not ( = ?auto_328235 ?auto_328242 ) ) ( not ( = ?auto_328236 ?auto_328237 ) ) ( not ( = ?auto_328236 ?auto_328238 ) ) ( not ( = ?auto_328236 ?auto_328239 ) ) ( not ( = ?auto_328236 ?auto_328240 ) ) ( not ( = ?auto_328236 ?auto_328241 ) ) ( not ( = ?auto_328236 ?auto_328242 ) ) ( not ( = ?auto_328237 ?auto_328238 ) ) ( not ( = ?auto_328237 ?auto_328239 ) ) ( not ( = ?auto_328237 ?auto_328240 ) ) ( not ( = ?auto_328237 ?auto_328241 ) ) ( not ( = ?auto_328237 ?auto_328242 ) ) ( not ( = ?auto_328238 ?auto_328239 ) ) ( not ( = ?auto_328238 ?auto_328240 ) ) ( not ( = ?auto_328238 ?auto_328241 ) ) ( not ( = ?auto_328238 ?auto_328242 ) ) ( not ( = ?auto_328239 ?auto_328240 ) ) ( not ( = ?auto_328239 ?auto_328241 ) ) ( not ( = ?auto_328239 ?auto_328242 ) ) ( not ( = ?auto_328240 ?auto_328241 ) ) ( not ( = ?auto_328240 ?auto_328242 ) ) ( not ( = ?auto_328241 ?auto_328242 ) ) ( ON ?auto_328240 ?auto_328241 ) ( ON ?auto_328239 ?auto_328240 ) ( ON ?auto_328238 ?auto_328239 ) ( ON ?auto_328237 ?auto_328238 ) ( CLEAR ?auto_328235 ) ( ON ?auto_328236 ?auto_328237 ) ( CLEAR ?auto_328236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_328231 ?auto_328232 ?auto_328233 ?auto_328234 ?auto_328235 ?auto_328236 )
      ( MAKE-11PILE ?auto_328231 ?auto_328232 ?auto_328233 ?auto_328234 ?auto_328235 ?auto_328236 ?auto_328237 ?auto_328238 ?auto_328239 ?auto_328240 ?auto_328241 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328277 - BLOCK
      ?auto_328278 - BLOCK
      ?auto_328279 - BLOCK
      ?auto_328280 - BLOCK
      ?auto_328281 - BLOCK
      ?auto_328282 - BLOCK
      ?auto_328283 - BLOCK
      ?auto_328284 - BLOCK
      ?auto_328285 - BLOCK
      ?auto_328286 - BLOCK
      ?auto_328287 - BLOCK
    )
    :vars
    (
      ?auto_328288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328287 ?auto_328288 ) ( ON-TABLE ?auto_328277 ) ( ON ?auto_328278 ?auto_328277 ) ( ON ?auto_328279 ?auto_328278 ) ( ON ?auto_328280 ?auto_328279 ) ( not ( = ?auto_328277 ?auto_328278 ) ) ( not ( = ?auto_328277 ?auto_328279 ) ) ( not ( = ?auto_328277 ?auto_328280 ) ) ( not ( = ?auto_328277 ?auto_328281 ) ) ( not ( = ?auto_328277 ?auto_328282 ) ) ( not ( = ?auto_328277 ?auto_328283 ) ) ( not ( = ?auto_328277 ?auto_328284 ) ) ( not ( = ?auto_328277 ?auto_328285 ) ) ( not ( = ?auto_328277 ?auto_328286 ) ) ( not ( = ?auto_328277 ?auto_328287 ) ) ( not ( = ?auto_328277 ?auto_328288 ) ) ( not ( = ?auto_328278 ?auto_328279 ) ) ( not ( = ?auto_328278 ?auto_328280 ) ) ( not ( = ?auto_328278 ?auto_328281 ) ) ( not ( = ?auto_328278 ?auto_328282 ) ) ( not ( = ?auto_328278 ?auto_328283 ) ) ( not ( = ?auto_328278 ?auto_328284 ) ) ( not ( = ?auto_328278 ?auto_328285 ) ) ( not ( = ?auto_328278 ?auto_328286 ) ) ( not ( = ?auto_328278 ?auto_328287 ) ) ( not ( = ?auto_328278 ?auto_328288 ) ) ( not ( = ?auto_328279 ?auto_328280 ) ) ( not ( = ?auto_328279 ?auto_328281 ) ) ( not ( = ?auto_328279 ?auto_328282 ) ) ( not ( = ?auto_328279 ?auto_328283 ) ) ( not ( = ?auto_328279 ?auto_328284 ) ) ( not ( = ?auto_328279 ?auto_328285 ) ) ( not ( = ?auto_328279 ?auto_328286 ) ) ( not ( = ?auto_328279 ?auto_328287 ) ) ( not ( = ?auto_328279 ?auto_328288 ) ) ( not ( = ?auto_328280 ?auto_328281 ) ) ( not ( = ?auto_328280 ?auto_328282 ) ) ( not ( = ?auto_328280 ?auto_328283 ) ) ( not ( = ?auto_328280 ?auto_328284 ) ) ( not ( = ?auto_328280 ?auto_328285 ) ) ( not ( = ?auto_328280 ?auto_328286 ) ) ( not ( = ?auto_328280 ?auto_328287 ) ) ( not ( = ?auto_328280 ?auto_328288 ) ) ( not ( = ?auto_328281 ?auto_328282 ) ) ( not ( = ?auto_328281 ?auto_328283 ) ) ( not ( = ?auto_328281 ?auto_328284 ) ) ( not ( = ?auto_328281 ?auto_328285 ) ) ( not ( = ?auto_328281 ?auto_328286 ) ) ( not ( = ?auto_328281 ?auto_328287 ) ) ( not ( = ?auto_328281 ?auto_328288 ) ) ( not ( = ?auto_328282 ?auto_328283 ) ) ( not ( = ?auto_328282 ?auto_328284 ) ) ( not ( = ?auto_328282 ?auto_328285 ) ) ( not ( = ?auto_328282 ?auto_328286 ) ) ( not ( = ?auto_328282 ?auto_328287 ) ) ( not ( = ?auto_328282 ?auto_328288 ) ) ( not ( = ?auto_328283 ?auto_328284 ) ) ( not ( = ?auto_328283 ?auto_328285 ) ) ( not ( = ?auto_328283 ?auto_328286 ) ) ( not ( = ?auto_328283 ?auto_328287 ) ) ( not ( = ?auto_328283 ?auto_328288 ) ) ( not ( = ?auto_328284 ?auto_328285 ) ) ( not ( = ?auto_328284 ?auto_328286 ) ) ( not ( = ?auto_328284 ?auto_328287 ) ) ( not ( = ?auto_328284 ?auto_328288 ) ) ( not ( = ?auto_328285 ?auto_328286 ) ) ( not ( = ?auto_328285 ?auto_328287 ) ) ( not ( = ?auto_328285 ?auto_328288 ) ) ( not ( = ?auto_328286 ?auto_328287 ) ) ( not ( = ?auto_328286 ?auto_328288 ) ) ( not ( = ?auto_328287 ?auto_328288 ) ) ( ON ?auto_328286 ?auto_328287 ) ( ON ?auto_328285 ?auto_328286 ) ( ON ?auto_328284 ?auto_328285 ) ( ON ?auto_328283 ?auto_328284 ) ( ON ?auto_328282 ?auto_328283 ) ( CLEAR ?auto_328280 ) ( ON ?auto_328281 ?auto_328282 ) ( CLEAR ?auto_328281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_328277 ?auto_328278 ?auto_328279 ?auto_328280 ?auto_328281 )
      ( MAKE-11PILE ?auto_328277 ?auto_328278 ?auto_328279 ?auto_328280 ?auto_328281 ?auto_328282 ?auto_328283 ?auto_328284 ?auto_328285 ?auto_328286 ?auto_328287 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328323 - BLOCK
      ?auto_328324 - BLOCK
      ?auto_328325 - BLOCK
      ?auto_328326 - BLOCK
      ?auto_328327 - BLOCK
      ?auto_328328 - BLOCK
      ?auto_328329 - BLOCK
      ?auto_328330 - BLOCK
      ?auto_328331 - BLOCK
      ?auto_328332 - BLOCK
      ?auto_328333 - BLOCK
    )
    :vars
    (
      ?auto_328334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328333 ?auto_328334 ) ( ON-TABLE ?auto_328323 ) ( ON ?auto_328324 ?auto_328323 ) ( ON ?auto_328325 ?auto_328324 ) ( not ( = ?auto_328323 ?auto_328324 ) ) ( not ( = ?auto_328323 ?auto_328325 ) ) ( not ( = ?auto_328323 ?auto_328326 ) ) ( not ( = ?auto_328323 ?auto_328327 ) ) ( not ( = ?auto_328323 ?auto_328328 ) ) ( not ( = ?auto_328323 ?auto_328329 ) ) ( not ( = ?auto_328323 ?auto_328330 ) ) ( not ( = ?auto_328323 ?auto_328331 ) ) ( not ( = ?auto_328323 ?auto_328332 ) ) ( not ( = ?auto_328323 ?auto_328333 ) ) ( not ( = ?auto_328323 ?auto_328334 ) ) ( not ( = ?auto_328324 ?auto_328325 ) ) ( not ( = ?auto_328324 ?auto_328326 ) ) ( not ( = ?auto_328324 ?auto_328327 ) ) ( not ( = ?auto_328324 ?auto_328328 ) ) ( not ( = ?auto_328324 ?auto_328329 ) ) ( not ( = ?auto_328324 ?auto_328330 ) ) ( not ( = ?auto_328324 ?auto_328331 ) ) ( not ( = ?auto_328324 ?auto_328332 ) ) ( not ( = ?auto_328324 ?auto_328333 ) ) ( not ( = ?auto_328324 ?auto_328334 ) ) ( not ( = ?auto_328325 ?auto_328326 ) ) ( not ( = ?auto_328325 ?auto_328327 ) ) ( not ( = ?auto_328325 ?auto_328328 ) ) ( not ( = ?auto_328325 ?auto_328329 ) ) ( not ( = ?auto_328325 ?auto_328330 ) ) ( not ( = ?auto_328325 ?auto_328331 ) ) ( not ( = ?auto_328325 ?auto_328332 ) ) ( not ( = ?auto_328325 ?auto_328333 ) ) ( not ( = ?auto_328325 ?auto_328334 ) ) ( not ( = ?auto_328326 ?auto_328327 ) ) ( not ( = ?auto_328326 ?auto_328328 ) ) ( not ( = ?auto_328326 ?auto_328329 ) ) ( not ( = ?auto_328326 ?auto_328330 ) ) ( not ( = ?auto_328326 ?auto_328331 ) ) ( not ( = ?auto_328326 ?auto_328332 ) ) ( not ( = ?auto_328326 ?auto_328333 ) ) ( not ( = ?auto_328326 ?auto_328334 ) ) ( not ( = ?auto_328327 ?auto_328328 ) ) ( not ( = ?auto_328327 ?auto_328329 ) ) ( not ( = ?auto_328327 ?auto_328330 ) ) ( not ( = ?auto_328327 ?auto_328331 ) ) ( not ( = ?auto_328327 ?auto_328332 ) ) ( not ( = ?auto_328327 ?auto_328333 ) ) ( not ( = ?auto_328327 ?auto_328334 ) ) ( not ( = ?auto_328328 ?auto_328329 ) ) ( not ( = ?auto_328328 ?auto_328330 ) ) ( not ( = ?auto_328328 ?auto_328331 ) ) ( not ( = ?auto_328328 ?auto_328332 ) ) ( not ( = ?auto_328328 ?auto_328333 ) ) ( not ( = ?auto_328328 ?auto_328334 ) ) ( not ( = ?auto_328329 ?auto_328330 ) ) ( not ( = ?auto_328329 ?auto_328331 ) ) ( not ( = ?auto_328329 ?auto_328332 ) ) ( not ( = ?auto_328329 ?auto_328333 ) ) ( not ( = ?auto_328329 ?auto_328334 ) ) ( not ( = ?auto_328330 ?auto_328331 ) ) ( not ( = ?auto_328330 ?auto_328332 ) ) ( not ( = ?auto_328330 ?auto_328333 ) ) ( not ( = ?auto_328330 ?auto_328334 ) ) ( not ( = ?auto_328331 ?auto_328332 ) ) ( not ( = ?auto_328331 ?auto_328333 ) ) ( not ( = ?auto_328331 ?auto_328334 ) ) ( not ( = ?auto_328332 ?auto_328333 ) ) ( not ( = ?auto_328332 ?auto_328334 ) ) ( not ( = ?auto_328333 ?auto_328334 ) ) ( ON ?auto_328332 ?auto_328333 ) ( ON ?auto_328331 ?auto_328332 ) ( ON ?auto_328330 ?auto_328331 ) ( ON ?auto_328329 ?auto_328330 ) ( ON ?auto_328328 ?auto_328329 ) ( ON ?auto_328327 ?auto_328328 ) ( CLEAR ?auto_328325 ) ( ON ?auto_328326 ?auto_328327 ) ( CLEAR ?auto_328326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_328323 ?auto_328324 ?auto_328325 ?auto_328326 )
      ( MAKE-11PILE ?auto_328323 ?auto_328324 ?auto_328325 ?auto_328326 ?auto_328327 ?auto_328328 ?auto_328329 ?auto_328330 ?auto_328331 ?auto_328332 ?auto_328333 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328369 - BLOCK
      ?auto_328370 - BLOCK
      ?auto_328371 - BLOCK
      ?auto_328372 - BLOCK
      ?auto_328373 - BLOCK
      ?auto_328374 - BLOCK
      ?auto_328375 - BLOCK
      ?auto_328376 - BLOCK
      ?auto_328377 - BLOCK
      ?auto_328378 - BLOCK
      ?auto_328379 - BLOCK
    )
    :vars
    (
      ?auto_328380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328379 ?auto_328380 ) ( ON-TABLE ?auto_328369 ) ( ON ?auto_328370 ?auto_328369 ) ( not ( = ?auto_328369 ?auto_328370 ) ) ( not ( = ?auto_328369 ?auto_328371 ) ) ( not ( = ?auto_328369 ?auto_328372 ) ) ( not ( = ?auto_328369 ?auto_328373 ) ) ( not ( = ?auto_328369 ?auto_328374 ) ) ( not ( = ?auto_328369 ?auto_328375 ) ) ( not ( = ?auto_328369 ?auto_328376 ) ) ( not ( = ?auto_328369 ?auto_328377 ) ) ( not ( = ?auto_328369 ?auto_328378 ) ) ( not ( = ?auto_328369 ?auto_328379 ) ) ( not ( = ?auto_328369 ?auto_328380 ) ) ( not ( = ?auto_328370 ?auto_328371 ) ) ( not ( = ?auto_328370 ?auto_328372 ) ) ( not ( = ?auto_328370 ?auto_328373 ) ) ( not ( = ?auto_328370 ?auto_328374 ) ) ( not ( = ?auto_328370 ?auto_328375 ) ) ( not ( = ?auto_328370 ?auto_328376 ) ) ( not ( = ?auto_328370 ?auto_328377 ) ) ( not ( = ?auto_328370 ?auto_328378 ) ) ( not ( = ?auto_328370 ?auto_328379 ) ) ( not ( = ?auto_328370 ?auto_328380 ) ) ( not ( = ?auto_328371 ?auto_328372 ) ) ( not ( = ?auto_328371 ?auto_328373 ) ) ( not ( = ?auto_328371 ?auto_328374 ) ) ( not ( = ?auto_328371 ?auto_328375 ) ) ( not ( = ?auto_328371 ?auto_328376 ) ) ( not ( = ?auto_328371 ?auto_328377 ) ) ( not ( = ?auto_328371 ?auto_328378 ) ) ( not ( = ?auto_328371 ?auto_328379 ) ) ( not ( = ?auto_328371 ?auto_328380 ) ) ( not ( = ?auto_328372 ?auto_328373 ) ) ( not ( = ?auto_328372 ?auto_328374 ) ) ( not ( = ?auto_328372 ?auto_328375 ) ) ( not ( = ?auto_328372 ?auto_328376 ) ) ( not ( = ?auto_328372 ?auto_328377 ) ) ( not ( = ?auto_328372 ?auto_328378 ) ) ( not ( = ?auto_328372 ?auto_328379 ) ) ( not ( = ?auto_328372 ?auto_328380 ) ) ( not ( = ?auto_328373 ?auto_328374 ) ) ( not ( = ?auto_328373 ?auto_328375 ) ) ( not ( = ?auto_328373 ?auto_328376 ) ) ( not ( = ?auto_328373 ?auto_328377 ) ) ( not ( = ?auto_328373 ?auto_328378 ) ) ( not ( = ?auto_328373 ?auto_328379 ) ) ( not ( = ?auto_328373 ?auto_328380 ) ) ( not ( = ?auto_328374 ?auto_328375 ) ) ( not ( = ?auto_328374 ?auto_328376 ) ) ( not ( = ?auto_328374 ?auto_328377 ) ) ( not ( = ?auto_328374 ?auto_328378 ) ) ( not ( = ?auto_328374 ?auto_328379 ) ) ( not ( = ?auto_328374 ?auto_328380 ) ) ( not ( = ?auto_328375 ?auto_328376 ) ) ( not ( = ?auto_328375 ?auto_328377 ) ) ( not ( = ?auto_328375 ?auto_328378 ) ) ( not ( = ?auto_328375 ?auto_328379 ) ) ( not ( = ?auto_328375 ?auto_328380 ) ) ( not ( = ?auto_328376 ?auto_328377 ) ) ( not ( = ?auto_328376 ?auto_328378 ) ) ( not ( = ?auto_328376 ?auto_328379 ) ) ( not ( = ?auto_328376 ?auto_328380 ) ) ( not ( = ?auto_328377 ?auto_328378 ) ) ( not ( = ?auto_328377 ?auto_328379 ) ) ( not ( = ?auto_328377 ?auto_328380 ) ) ( not ( = ?auto_328378 ?auto_328379 ) ) ( not ( = ?auto_328378 ?auto_328380 ) ) ( not ( = ?auto_328379 ?auto_328380 ) ) ( ON ?auto_328378 ?auto_328379 ) ( ON ?auto_328377 ?auto_328378 ) ( ON ?auto_328376 ?auto_328377 ) ( ON ?auto_328375 ?auto_328376 ) ( ON ?auto_328374 ?auto_328375 ) ( ON ?auto_328373 ?auto_328374 ) ( ON ?auto_328372 ?auto_328373 ) ( CLEAR ?auto_328370 ) ( ON ?auto_328371 ?auto_328372 ) ( CLEAR ?auto_328371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_328369 ?auto_328370 ?auto_328371 )
      ( MAKE-11PILE ?auto_328369 ?auto_328370 ?auto_328371 ?auto_328372 ?auto_328373 ?auto_328374 ?auto_328375 ?auto_328376 ?auto_328377 ?auto_328378 ?auto_328379 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328415 - BLOCK
      ?auto_328416 - BLOCK
      ?auto_328417 - BLOCK
      ?auto_328418 - BLOCK
      ?auto_328419 - BLOCK
      ?auto_328420 - BLOCK
      ?auto_328421 - BLOCK
      ?auto_328422 - BLOCK
      ?auto_328423 - BLOCK
      ?auto_328424 - BLOCK
      ?auto_328425 - BLOCK
    )
    :vars
    (
      ?auto_328426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328425 ?auto_328426 ) ( ON-TABLE ?auto_328415 ) ( not ( = ?auto_328415 ?auto_328416 ) ) ( not ( = ?auto_328415 ?auto_328417 ) ) ( not ( = ?auto_328415 ?auto_328418 ) ) ( not ( = ?auto_328415 ?auto_328419 ) ) ( not ( = ?auto_328415 ?auto_328420 ) ) ( not ( = ?auto_328415 ?auto_328421 ) ) ( not ( = ?auto_328415 ?auto_328422 ) ) ( not ( = ?auto_328415 ?auto_328423 ) ) ( not ( = ?auto_328415 ?auto_328424 ) ) ( not ( = ?auto_328415 ?auto_328425 ) ) ( not ( = ?auto_328415 ?auto_328426 ) ) ( not ( = ?auto_328416 ?auto_328417 ) ) ( not ( = ?auto_328416 ?auto_328418 ) ) ( not ( = ?auto_328416 ?auto_328419 ) ) ( not ( = ?auto_328416 ?auto_328420 ) ) ( not ( = ?auto_328416 ?auto_328421 ) ) ( not ( = ?auto_328416 ?auto_328422 ) ) ( not ( = ?auto_328416 ?auto_328423 ) ) ( not ( = ?auto_328416 ?auto_328424 ) ) ( not ( = ?auto_328416 ?auto_328425 ) ) ( not ( = ?auto_328416 ?auto_328426 ) ) ( not ( = ?auto_328417 ?auto_328418 ) ) ( not ( = ?auto_328417 ?auto_328419 ) ) ( not ( = ?auto_328417 ?auto_328420 ) ) ( not ( = ?auto_328417 ?auto_328421 ) ) ( not ( = ?auto_328417 ?auto_328422 ) ) ( not ( = ?auto_328417 ?auto_328423 ) ) ( not ( = ?auto_328417 ?auto_328424 ) ) ( not ( = ?auto_328417 ?auto_328425 ) ) ( not ( = ?auto_328417 ?auto_328426 ) ) ( not ( = ?auto_328418 ?auto_328419 ) ) ( not ( = ?auto_328418 ?auto_328420 ) ) ( not ( = ?auto_328418 ?auto_328421 ) ) ( not ( = ?auto_328418 ?auto_328422 ) ) ( not ( = ?auto_328418 ?auto_328423 ) ) ( not ( = ?auto_328418 ?auto_328424 ) ) ( not ( = ?auto_328418 ?auto_328425 ) ) ( not ( = ?auto_328418 ?auto_328426 ) ) ( not ( = ?auto_328419 ?auto_328420 ) ) ( not ( = ?auto_328419 ?auto_328421 ) ) ( not ( = ?auto_328419 ?auto_328422 ) ) ( not ( = ?auto_328419 ?auto_328423 ) ) ( not ( = ?auto_328419 ?auto_328424 ) ) ( not ( = ?auto_328419 ?auto_328425 ) ) ( not ( = ?auto_328419 ?auto_328426 ) ) ( not ( = ?auto_328420 ?auto_328421 ) ) ( not ( = ?auto_328420 ?auto_328422 ) ) ( not ( = ?auto_328420 ?auto_328423 ) ) ( not ( = ?auto_328420 ?auto_328424 ) ) ( not ( = ?auto_328420 ?auto_328425 ) ) ( not ( = ?auto_328420 ?auto_328426 ) ) ( not ( = ?auto_328421 ?auto_328422 ) ) ( not ( = ?auto_328421 ?auto_328423 ) ) ( not ( = ?auto_328421 ?auto_328424 ) ) ( not ( = ?auto_328421 ?auto_328425 ) ) ( not ( = ?auto_328421 ?auto_328426 ) ) ( not ( = ?auto_328422 ?auto_328423 ) ) ( not ( = ?auto_328422 ?auto_328424 ) ) ( not ( = ?auto_328422 ?auto_328425 ) ) ( not ( = ?auto_328422 ?auto_328426 ) ) ( not ( = ?auto_328423 ?auto_328424 ) ) ( not ( = ?auto_328423 ?auto_328425 ) ) ( not ( = ?auto_328423 ?auto_328426 ) ) ( not ( = ?auto_328424 ?auto_328425 ) ) ( not ( = ?auto_328424 ?auto_328426 ) ) ( not ( = ?auto_328425 ?auto_328426 ) ) ( ON ?auto_328424 ?auto_328425 ) ( ON ?auto_328423 ?auto_328424 ) ( ON ?auto_328422 ?auto_328423 ) ( ON ?auto_328421 ?auto_328422 ) ( ON ?auto_328420 ?auto_328421 ) ( ON ?auto_328419 ?auto_328420 ) ( ON ?auto_328418 ?auto_328419 ) ( ON ?auto_328417 ?auto_328418 ) ( CLEAR ?auto_328415 ) ( ON ?auto_328416 ?auto_328417 ) ( CLEAR ?auto_328416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_328415 ?auto_328416 )
      ( MAKE-11PILE ?auto_328415 ?auto_328416 ?auto_328417 ?auto_328418 ?auto_328419 ?auto_328420 ?auto_328421 ?auto_328422 ?auto_328423 ?auto_328424 ?auto_328425 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_328461 - BLOCK
      ?auto_328462 - BLOCK
      ?auto_328463 - BLOCK
      ?auto_328464 - BLOCK
      ?auto_328465 - BLOCK
      ?auto_328466 - BLOCK
      ?auto_328467 - BLOCK
      ?auto_328468 - BLOCK
      ?auto_328469 - BLOCK
      ?auto_328470 - BLOCK
      ?auto_328471 - BLOCK
    )
    :vars
    (
      ?auto_328472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328471 ?auto_328472 ) ( not ( = ?auto_328461 ?auto_328462 ) ) ( not ( = ?auto_328461 ?auto_328463 ) ) ( not ( = ?auto_328461 ?auto_328464 ) ) ( not ( = ?auto_328461 ?auto_328465 ) ) ( not ( = ?auto_328461 ?auto_328466 ) ) ( not ( = ?auto_328461 ?auto_328467 ) ) ( not ( = ?auto_328461 ?auto_328468 ) ) ( not ( = ?auto_328461 ?auto_328469 ) ) ( not ( = ?auto_328461 ?auto_328470 ) ) ( not ( = ?auto_328461 ?auto_328471 ) ) ( not ( = ?auto_328461 ?auto_328472 ) ) ( not ( = ?auto_328462 ?auto_328463 ) ) ( not ( = ?auto_328462 ?auto_328464 ) ) ( not ( = ?auto_328462 ?auto_328465 ) ) ( not ( = ?auto_328462 ?auto_328466 ) ) ( not ( = ?auto_328462 ?auto_328467 ) ) ( not ( = ?auto_328462 ?auto_328468 ) ) ( not ( = ?auto_328462 ?auto_328469 ) ) ( not ( = ?auto_328462 ?auto_328470 ) ) ( not ( = ?auto_328462 ?auto_328471 ) ) ( not ( = ?auto_328462 ?auto_328472 ) ) ( not ( = ?auto_328463 ?auto_328464 ) ) ( not ( = ?auto_328463 ?auto_328465 ) ) ( not ( = ?auto_328463 ?auto_328466 ) ) ( not ( = ?auto_328463 ?auto_328467 ) ) ( not ( = ?auto_328463 ?auto_328468 ) ) ( not ( = ?auto_328463 ?auto_328469 ) ) ( not ( = ?auto_328463 ?auto_328470 ) ) ( not ( = ?auto_328463 ?auto_328471 ) ) ( not ( = ?auto_328463 ?auto_328472 ) ) ( not ( = ?auto_328464 ?auto_328465 ) ) ( not ( = ?auto_328464 ?auto_328466 ) ) ( not ( = ?auto_328464 ?auto_328467 ) ) ( not ( = ?auto_328464 ?auto_328468 ) ) ( not ( = ?auto_328464 ?auto_328469 ) ) ( not ( = ?auto_328464 ?auto_328470 ) ) ( not ( = ?auto_328464 ?auto_328471 ) ) ( not ( = ?auto_328464 ?auto_328472 ) ) ( not ( = ?auto_328465 ?auto_328466 ) ) ( not ( = ?auto_328465 ?auto_328467 ) ) ( not ( = ?auto_328465 ?auto_328468 ) ) ( not ( = ?auto_328465 ?auto_328469 ) ) ( not ( = ?auto_328465 ?auto_328470 ) ) ( not ( = ?auto_328465 ?auto_328471 ) ) ( not ( = ?auto_328465 ?auto_328472 ) ) ( not ( = ?auto_328466 ?auto_328467 ) ) ( not ( = ?auto_328466 ?auto_328468 ) ) ( not ( = ?auto_328466 ?auto_328469 ) ) ( not ( = ?auto_328466 ?auto_328470 ) ) ( not ( = ?auto_328466 ?auto_328471 ) ) ( not ( = ?auto_328466 ?auto_328472 ) ) ( not ( = ?auto_328467 ?auto_328468 ) ) ( not ( = ?auto_328467 ?auto_328469 ) ) ( not ( = ?auto_328467 ?auto_328470 ) ) ( not ( = ?auto_328467 ?auto_328471 ) ) ( not ( = ?auto_328467 ?auto_328472 ) ) ( not ( = ?auto_328468 ?auto_328469 ) ) ( not ( = ?auto_328468 ?auto_328470 ) ) ( not ( = ?auto_328468 ?auto_328471 ) ) ( not ( = ?auto_328468 ?auto_328472 ) ) ( not ( = ?auto_328469 ?auto_328470 ) ) ( not ( = ?auto_328469 ?auto_328471 ) ) ( not ( = ?auto_328469 ?auto_328472 ) ) ( not ( = ?auto_328470 ?auto_328471 ) ) ( not ( = ?auto_328470 ?auto_328472 ) ) ( not ( = ?auto_328471 ?auto_328472 ) ) ( ON ?auto_328470 ?auto_328471 ) ( ON ?auto_328469 ?auto_328470 ) ( ON ?auto_328468 ?auto_328469 ) ( ON ?auto_328467 ?auto_328468 ) ( ON ?auto_328466 ?auto_328467 ) ( ON ?auto_328465 ?auto_328466 ) ( ON ?auto_328464 ?auto_328465 ) ( ON ?auto_328463 ?auto_328464 ) ( ON ?auto_328462 ?auto_328463 ) ( ON ?auto_328461 ?auto_328462 ) ( CLEAR ?auto_328461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_328461 )
      ( MAKE-11PILE ?auto_328461 ?auto_328462 ?auto_328463 ?auto_328464 ?auto_328465 ?auto_328466 ?auto_328467 ?auto_328468 ?auto_328469 ?auto_328470 ?auto_328471 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328508 - BLOCK
      ?auto_328509 - BLOCK
      ?auto_328510 - BLOCK
      ?auto_328511 - BLOCK
      ?auto_328512 - BLOCK
      ?auto_328513 - BLOCK
      ?auto_328514 - BLOCK
      ?auto_328515 - BLOCK
      ?auto_328516 - BLOCK
      ?auto_328517 - BLOCK
      ?auto_328518 - BLOCK
      ?auto_328519 - BLOCK
    )
    :vars
    (
      ?auto_328520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_328518 ) ( ON ?auto_328519 ?auto_328520 ) ( CLEAR ?auto_328519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_328508 ) ( ON ?auto_328509 ?auto_328508 ) ( ON ?auto_328510 ?auto_328509 ) ( ON ?auto_328511 ?auto_328510 ) ( ON ?auto_328512 ?auto_328511 ) ( ON ?auto_328513 ?auto_328512 ) ( ON ?auto_328514 ?auto_328513 ) ( ON ?auto_328515 ?auto_328514 ) ( ON ?auto_328516 ?auto_328515 ) ( ON ?auto_328517 ?auto_328516 ) ( ON ?auto_328518 ?auto_328517 ) ( not ( = ?auto_328508 ?auto_328509 ) ) ( not ( = ?auto_328508 ?auto_328510 ) ) ( not ( = ?auto_328508 ?auto_328511 ) ) ( not ( = ?auto_328508 ?auto_328512 ) ) ( not ( = ?auto_328508 ?auto_328513 ) ) ( not ( = ?auto_328508 ?auto_328514 ) ) ( not ( = ?auto_328508 ?auto_328515 ) ) ( not ( = ?auto_328508 ?auto_328516 ) ) ( not ( = ?auto_328508 ?auto_328517 ) ) ( not ( = ?auto_328508 ?auto_328518 ) ) ( not ( = ?auto_328508 ?auto_328519 ) ) ( not ( = ?auto_328508 ?auto_328520 ) ) ( not ( = ?auto_328509 ?auto_328510 ) ) ( not ( = ?auto_328509 ?auto_328511 ) ) ( not ( = ?auto_328509 ?auto_328512 ) ) ( not ( = ?auto_328509 ?auto_328513 ) ) ( not ( = ?auto_328509 ?auto_328514 ) ) ( not ( = ?auto_328509 ?auto_328515 ) ) ( not ( = ?auto_328509 ?auto_328516 ) ) ( not ( = ?auto_328509 ?auto_328517 ) ) ( not ( = ?auto_328509 ?auto_328518 ) ) ( not ( = ?auto_328509 ?auto_328519 ) ) ( not ( = ?auto_328509 ?auto_328520 ) ) ( not ( = ?auto_328510 ?auto_328511 ) ) ( not ( = ?auto_328510 ?auto_328512 ) ) ( not ( = ?auto_328510 ?auto_328513 ) ) ( not ( = ?auto_328510 ?auto_328514 ) ) ( not ( = ?auto_328510 ?auto_328515 ) ) ( not ( = ?auto_328510 ?auto_328516 ) ) ( not ( = ?auto_328510 ?auto_328517 ) ) ( not ( = ?auto_328510 ?auto_328518 ) ) ( not ( = ?auto_328510 ?auto_328519 ) ) ( not ( = ?auto_328510 ?auto_328520 ) ) ( not ( = ?auto_328511 ?auto_328512 ) ) ( not ( = ?auto_328511 ?auto_328513 ) ) ( not ( = ?auto_328511 ?auto_328514 ) ) ( not ( = ?auto_328511 ?auto_328515 ) ) ( not ( = ?auto_328511 ?auto_328516 ) ) ( not ( = ?auto_328511 ?auto_328517 ) ) ( not ( = ?auto_328511 ?auto_328518 ) ) ( not ( = ?auto_328511 ?auto_328519 ) ) ( not ( = ?auto_328511 ?auto_328520 ) ) ( not ( = ?auto_328512 ?auto_328513 ) ) ( not ( = ?auto_328512 ?auto_328514 ) ) ( not ( = ?auto_328512 ?auto_328515 ) ) ( not ( = ?auto_328512 ?auto_328516 ) ) ( not ( = ?auto_328512 ?auto_328517 ) ) ( not ( = ?auto_328512 ?auto_328518 ) ) ( not ( = ?auto_328512 ?auto_328519 ) ) ( not ( = ?auto_328512 ?auto_328520 ) ) ( not ( = ?auto_328513 ?auto_328514 ) ) ( not ( = ?auto_328513 ?auto_328515 ) ) ( not ( = ?auto_328513 ?auto_328516 ) ) ( not ( = ?auto_328513 ?auto_328517 ) ) ( not ( = ?auto_328513 ?auto_328518 ) ) ( not ( = ?auto_328513 ?auto_328519 ) ) ( not ( = ?auto_328513 ?auto_328520 ) ) ( not ( = ?auto_328514 ?auto_328515 ) ) ( not ( = ?auto_328514 ?auto_328516 ) ) ( not ( = ?auto_328514 ?auto_328517 ) ) ( not ( = ?auto_328514 ?auto_328518 ) ) ( not ( = ?auto_328514 ?auto_328519 ) ) ( not ( = ?auto_328514 ?auto_328520 ) ) ( not ( = ?auto_328515 ?auto_328516 ) ) ( not ( = ?auto_328515 ?auto_328517 ) ) ( not ( = ?auto_328515 ?auto_328518 ) ) ( not ( = ?auto_328515 ?auto_328519 ) ) ( not ( = ?auto_328515 ?auto_328520 ) ) ( not ( = ?auto_328516 ?auto_328517 ) ) ( not ( = ?auto_328516 ?auto_328518 ) ) ( not ( = ?auto_328516 ?auto_328519 ) ) ( not ( = ?auto_328516 ?auto_328520 ) ) ( not ( = ?auto_328517 ?auto_328518 ) ) ( not ( = ?auto_328517 ?auto_328519 ) ) ( not ( = ?auto_328517 ?auto_328520 ) ) ( not ( = ?auto_328518 ?auto_328519 ) ) ( not ( = ?auto_328518 ?auto_328520 ) ) ( not ( = ?auto_328519 ?auto_328520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_328519 ?auto_328520 )
      ( !STACK ?auto_328519 ?auto_328518 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328558 - BLOCK
      ?auto_328559 - BLOCK
      ?auto_328560 - BLOCK
      ?auto_328561 - BLOCK
      ?auto_328562 - BLOCK
      ?auto_328563 - BLOCK
      ?auto_328564 - BLOCK
      ?auto_328565 - BLOCK
      ?auto_328566 - BLOCK
      ?auto_328567 - BLOCK
      ?auto_328568 - BLOCK
      ?auto_328569 - BLOCK
    )
    :vars
    (
      ?auto_328570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328569 ?auto_328570 ) ( ON-TABLE ?auto_328558 ) ( ON ?auto_328559 ?auto_328558 ) ( ON ?auto_328560 ?auto_328559 ) ( ON ?auto_328561 ?auto_328560 ) ( ON ?auto_328562 ?auto_328561 ) ( ON ?auto_328563 ?auto_328562 ) ( ON ?auto_328564 ?auto_328563 ) ( ON ?auto_328565 ?auto_328564 ) ( ON ?auto_328566 ?auto_328565 ) ( ON ?auto_328567 ?auto_328566 ) ( not ( = ?auto_328558 ?auto_328559 ) ) ( not ( = ?auto_328558 ?auto_328560 ) ) ( not ( = ?auto_328558 ?auto_328561 ) ) ( not ( = ?auto_328558 ?auto_328562 ) ) ( not ( = ?auto_328558 ?auto_328563 ) ) ( not ( = ?auto_328558 ?auto_328564 ) ) ( not ( = ?auto_328558 ?auto_328565 ) ) ( not ( = ?auto_328558 ?auto_328566 ) ) ( not ( = ?auto_328558 ?auto_328567 ) ) ( not ( = ?auto_328558 ?auto_328568 ) ) ( not ( = ?auto_328558 ?auto_328569 ) ) ( not ( = ?auto_328558 ?auto_328570 ) ) ( not ( = ?auto_328559 ?auto_328560 ) ) ( not ( = ?auto_328559 ?auto_328561 ) ) ( not ( = ?auto_328559 ?auto_328562 ) ) ( not ( = ?auto_328559 ?auto_328563 ) ) ( not ( = ?auto_328559 ?auto_328564 ) ) ( not ( = ?auto_328559 ?auto_328565 ) ) ( not ( = ?auto_328559 ?auto_328566 ) ) ( not ( = ?auto_328559 ?auto_328567 ) ) ( not ( = ?auto_328559 ?auto_328568 ) ) ( not ( = ?auto_328559 ?auto_328569 ) ) ( not ( = ?auto_328559 ?auto_328570 ) ) ( not ( = ?auto_328560 ?auto_328561 ) ) ( not ( = ?auto_328560 ?auto_328562 ) ) ( not ( = ?auto_328560 ?auto_328563 ) ) ( not ( = ?auto_328560 ?auto_328564 ) ) ( not ( = ?auto_328560 ?auto_328565 ) ) ( not ( = ?auto_328560 ?auto_328566 ) ) ( not ( = ?auto_328560 ?auto_328567 ) ) ( not ( = ?auto_328560 ?auto_328568 ) ) ( not ( = ?auto_328560 ?auto_328569 ) ) ( not ( = ?auto_328560 ?auto_328570 ) ) ( not ( = ?auto_328561 ?auto_328562 ) ) ( not ( = ?auto_328561 ?auto_328563 ) ) ( not ( = ?auto_328561 ?auto_328564 ) ) ( not ( = ?auto_328561 ?auto_328565 ) ) ( not ( = ?auto_328561 ?auto_328566 ) ) ( not ( = ?auto_328561 ?auto_328567 ) ) ( not ( = ?auto_328561 ?auto_328568 ) ) ( not ( = ?auto_328561 ?auto_328569 ) ) ( not ( = ?auto_328561 ?auto_328570 ) ) ( not ( = ?auto_328562 ?auto_328563 ) ) ( not ( = ?auto_328562 ?auto_328564 ) ) ( not ( = ?auto_328562 ?auto_328565 ) ) ( not ( = ?auto_328562 ?auto_328566 ) ) ( not ( = ?auto_328562 ?auto_328567 ) ) ( not ( = ?auto_328562 ?auto_328568 ) ) ( not ( = ?auto_328562 ?auto_328569 ) ) ( not ( = ?auto_328562 ?auto_328570 ) ) ( not ( = ?auto_328563 ?auto_328564 ) ) ( not ( = ?auto_328563 ?auto_328565 ) ) ( not ( = ?auto_328563 ?auto_328566 ) ) ( not ( = ?auto_328563 ?auto_328567 ) ) ( not ( = ?auto_328563 ?auto_328568 ) ) ( not ( = ?auto_328563 ?auto_328569 ) ) ( not ( = ?auto_328563 ?auto_328570 ) ) ( not ( = ?auto_328564 ?auto_328565 ) ) ( not ( = ?auto_328564 ?auto_328566 ) ) ( not ( = ?auto_328564 ?auto_328567 ) ) ( not ( = ?auto_328564 ?auto_328568 ) ) ( not ( = ?auto_328564 ?auto_328569 ) ) ( not ( = ?auto_328564 ?auto_328570 ) ) ( not ( = ?auto_328565 ?auto_328566 ) ) ( not ( = ?auto_328565 ?auto_328567 ) ) ( not ( = ?auto_328565 ?auto_328568 ) ) ( not ( = ?auto_328565 ?auto_328569 ) ) ( not ( = ?auto_328565 ?auto_328570 ) ) ( not ( = ?auto_328566 ?auto_328567 ) ) ( not ( = ?auto_328566 ?auto_328568 ) ) ( not ( = ?auto_328566 ?auto_328569 ) ) ( not ( = ?auto_328566 ?auto_328570 ) ) ( not ( = ?auto_328567 ?auto_328568 ) ) ( not ( = ?auto_328567 ?auto_328569 ) ) ( not ( = ?auto_328567 ?auto_328570 ) ) ( not ( = ?auto_328568 ?auto_328569 ) ) ( not ( = ?auto_328568 ?auto_328570 ) ) ( not ( = ?auto_328569 ?auto_328570 ) ) ( CLEAR ?auto_328567 ) ( ON ?auto_328568 ?auto_328569 ) ( CLEAR ?auto_328568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_328558 ?auto_328559 ?auto_328560 ?auto_328561 ?auto_328562 ?auto_328563 ?auto_328564 ?auto_328565 ?auto_328566 ?auto_328567 ?auto_328568 )
      ( MAKE-12PILE ?auto_328558 ?auto_328559 ?auto_328560 ?auto_328561 ?auto_328562 ?auto_328563 ?auto_328564 ?auto_328565 ?auto_328566 ?auto_328567 ?auto_328568 ?auto_328569 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328608 - BLOCK
      ?auto_328609 - BLOCK
      ?auto_328610 - BLOCK
      ?auto_328611 - BLOCK
      ?auto_328612 - BLOCK
      ?auto_328613 - BLOCK
      ?auto_328614 - BLOCK
      ?auto_328615 - BLOCK
      ?auto_328616 - BLOCK
      ?auto_328617 - BLOCK
      ?auto_328618 - BLOCK
      ?auto_328619 - BLOCK
    )
    :vars
    (
      ?auto_328620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328619 ?auto_328620 ) ( ON-TABLE ?auto_328608 ) ( ON ?auto_328609 ?auto_328608 ) ( ON ?auto_328610 ?auto_328609 ) ( ON ?auto_328611 ?auto_328610 ) ( ON ?auto_328612 ?auto_328611 ) ( ON ?auto_328613 ?auto_328612 ) ( ON ?auto_328614 ?auto_328613 ) ( ON ?auto_328615 ?auto_328614 ) ( ON ?auto_328616 ?auto_328615 ) ( not ( = ?auto_328608 ?auto_328609 ) ) ( not ( = ?auto_328608 ?auto_328610 ) ) ( not ( = ?auto_328608 ?auto_328611 ) ) ( not ( = ?auto_328608 ?auto_328612 ) ) ( not ( = ?auto_328608 ?auto_328613 ) ) ( not ( = ?auto_328608 ?auto_328614 ) ) ( not ( = ?auto_328608 ?auto_328615 ) ) ( not ( = ?auto_328608 ?auto_328616 ) ) ( not ( = ?auto_328608 ?auto_328617 ) ) ( not ( = ?auto_328608 ?auto_328618 ) ) ( not ( = ?auto_328608 ?auto_328619 ) ) ( not ( = ?auto_328608 ?auto_328620 ) ) ( not ( = ?auto_328609 ?auto_328610 ) ) ( not ( = ?auto_328609 ?auto_328611 ) ) ( not ( = ?auto_328609 ?auto_328612 ) ) ( not ( = ?auto_328609 ?auto_328613 ) ) ( not ( = ?auto_328609 ?auto_328614 ) ) ( not ( = ?auto_328609 ?auto_328615 ) ) ( not ( = ?auto_328609 ?auto_328616 ) ) ( not ( = ?auto_328609 ?auto_328617 ) ) ( not ( = ?auto_328609 ?auto_328618 ) ) ( not ( = ?auto_328609 ?auto_328619 ) ) ( not ( = ?auto_328609 ?auto_328620 ) ) ( not ( = ?auto_328610 ?auto_328611 ) ) ( not ( = ?auto_328610 ?auto_328612 ) ) ( not ( = ?auto_328610 ?auto_328613 ) ) ( not ( = ?auto_328610 ?auto_328614 ) ) ( not ( = ?auto_328610 ?auto_328615 ) ) ( not ( = ?auto_328610 ?auto_328616 ) ) ( not ( = ?auto_328610 ?auto_328617 ) ) ( not ( = ?auto_328610 ?auto_328618 ) ) ( not ( = ?auto_328610 ?auto_328619 ) ) ( not ( = ?auto_328610 ?auto_328620 ) ) ( not ( = ?auto_328611 ?auto_328612 ) ) ( not ( = ?auto_328611 ?auto_328613 ) ) ( not ( = ?auto_328611 ?auto_328614 ) ) ( not ( = ?auto_328611 ?auto_328615 ) ) ( not ( = ?auto_328611 ?auto_328616 ) ) ( not ( = ?auto_328611 ?auto_328617 ) ) ( not ( = ?auto_328611 ?auto_328618 ) ) ( not ( = ?auto_328611 ?auto_328619 ) ) ( not ( = ?auto_328611 ?auto_328620 ) ) ( not ( = ?auto_328612 ?auto_328613 ) ) ( not ( = ?auto_328612 ?auto_328614 ) ) ( not ( = ?auto_328612 ?auto_328615 ) ) ( not ( = ?auto_328612 ?auto_328616 ) ) ( not ( = ?auto_328612 ?auto_328617 ) ) ( not ( = ?auto_328612 ?auto_328618 ) ) ( not ( = ?auto_328612 ?auto_328619 ) ) ( not ( = ?auto_328612 ?auto_328620 ) ) ( not ( = ?auto_328613 ?auto_328614 ) ) ( not ( = ?auto_328613 ?auto_328615 ) ) ( not ( = ?auto_328613 ?auto_328616 ) ) ( not ( = ?auto_328613 ?auto_328617 ) ) ( not ( = ?auto_328613 ?auto_328618 ) ) ( not ( = ?auto_328613 ?auto_328619 ) ) ( not ( = ?auto_328613 ?auto_328620 ) ) ( not ( = ?auto_328614 ?auto_328615 ) ) ( not ( = ?auto_328614 ?auto_328616 ) ) ( not ( = ?auto_328614 ?auto_328617 ) ) ( not ( = ?auto_328614 ?auto_328618 ) ) ( not ( = ?auto_328614 ?auto_328619 ) ) ( not ( = ?auto_328614 ?auto_328620 ) ) ( not ( = ?auto_328615 ?auto_328616 ) ) ( not ( = ?auto_328615 ?auto_328617 ) ) ( not ( = ?auto_328615 ?auto_328618 ) ) ( not ( = ?auto_328615 ?auto_328619 ) ) ( not ( = ?auto_328615 ?auto_328620 ) ) ( not ( = ?auto_328616 ?auto_328617 ) ) ( not ( = ?auto_328616 ?auto_328618 ) ) ( not ( = ?auto_328616 ?auto_328619 ) ) ( not ( = ?auto_328616 ?auto_328620 ) ) ( not ( = ?auto_328617 ?auto_328618 ) ) ( not ( = ?auto_328617 ?auto_328619 ) ) ( not ( = ?auto_328617 ?auto_328620 ) ) ( not ( = ?auto_328618 ?auto_328619 ) ) ( not ( = ?auto_328618 ?auto_328620 ) ) ( not ( = ?auto_328619 ?auto_328620 ) ) ( ON ?auto_328618 ?auto_328619 ) ( CLEAR ?auto_328616 ) ( ON ?auto_328617 ?auto_328618 ) ( CLEAR ?auto_328617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_328608 ?auto_328609 ?auto_328610 ?auto_328611 ?auto_328612 ?auto_328613 ?auto_328614 ?auto_328615 ?auto_328616 ?auto_328617 )
      ( MAKE-12PILE ?auto_328608 ?auto_328609 ?auto_328610 ?auto_328611 ?auto_328612 ?auto_328613 ?auto_328614 ?auto_328615 ?auto_328616 ?auto_328617 ?auto_328618 ?auto_328619 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328658 - BLOCK
      ?auto_328659 - BLOCK
      ?auto_328660 - BLOCK
      ?auto_328661 - BLOCK
      ?auto_328662 - BLOCK
      ?auto_328663 - BLOCK
      ?auto_328664 - BLOCK
      ?auto_328665 - BLOCK
      ?auto_328666 - BLOCK
      ?auto_328667 - BLOCK
      ?auto_328668 - BLOCK
      ?auto_328669 - BLOCK
    )
    :vars
    (
      ?auto_328670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328669 ?auto_328670 ) ( ON-TABLE ?auto_328658 ) ( ON ?auto_328659 ?auto_328658 ) ( ON ?auto_328660 ?auto_328659 ) ( ON ?auto_328661 ?auto_328660 ) ( ON ?auto_328662 ?auto_328661 ) ( ON ?auto_328663 ?auto_328662 ) ( ON ?auto_328664 ?auto_328663 ) ( ON ?auto_328665 ?auto_328664 ) ( not ( = ?auto_328658 ?auto_328659 ) ) ( not ( = ?auto_328658 ?auto_328660 ) ) ( not ( = ?auto_328658 ?auto_328661 ) ) ( not ( = ?auto_328658 ?auto_328662 ) ) ( not ( = ?auto_328658 ?auto_328663 ) ) ( not ( = ?auto_328658 ?auto_328664 ) ) ( not ( = ?auto_328658 ?auto_328665 ) ) ( not ( = ?auto_328658 ?auto_328666 ) ) ( not ( = ?auto_328658 ?auto_328667 ) ) ( not ( = ?auto_328658 ?auto_328668 ) ) ( not ( = ?auto_328658 ?auto_328669 ) ) ( not ( = ?auto_328658 ?auto_328670 ) ) ( not ( = ?auto_328659 ?auto_328660 ) ) ( not ( = ?auto_328659 ?auto_328661 ) ) ( not ( = ?auto_328659 ?auto_328662 ) ) ( not ( = ?auto_328659 ?auto_328663 ) ) ( not ( = ?auto_328659 ?auto_328664 ) ) ( not ( = ?auto_328659 ?auto_328665 ) ) ( not ( = ?auto_328659 ?auto_328666 ) ) ( not ( = ?auto_328659 ?auto_328667 ) ) ( not ( = ?auto_328659 ?auto_328668 ) ) ( not ( = ?auto_328659 ?auto_328669 ) ) ( not ( = ?auto_328659 ?auto_328670 ) ) ( not ( = ?auto_328660 ?auto_328661 ) ) ( not ( = ?auto_328660 ?auto_328662 ) ) ( not ( = ?auto_328660 ?auto_328663 ) ) ( not ( = ?auto_328660 ?auto_328664 ) ) ( not ( = ?auto_328660 ?auto_328665 ) ) ( not ( = ?auto_328660 ?auto_328666 ) ) ( not ( = ?auto_328660 ?auto_328667 ) ) ( not ( = ?auto_328660 ?auto_328668 ) ) ( not ( = ?auto_328660 ?auto_328669 ) ) ( not ( = ?auto_328660 ?auto_328670 ) ) ( not ( = ?auto_328661 ?auto_328662 ) ) ( not ( = ?auto_328661 ?auto_328663 ) ) ( not ( = ?auto_328661 ?auto_328664 ) ) ( not ( = ?auto_328661 ?auto_328665 ) ) ( not ( = ?auto_328661 ?auto_328666 ) ) ( not ( = ?auto_328661 ?auto_328667 ) ) ( not ( = ?auto_328661 ?auto_328668 ) ) ( not ( = ?auto_328661 ?auto_328669 ) ) ( not ( = ?auto_328661 ?auto_328670 ) ) ( not ( = ?auto_328662 ?auto_328663 ) ) ( not ( = ?auto_328662 ?auto_328664 ) ) ( not ( = ?auto_328662 ?auto_328665 ) ) ( not ( = ?auto_328662 ?auto_328666 ) ) ( not ( = ?auto_328662 ?auto_328667 ) ) ( not ( = ?auto_328662 ?auto_328668 ) ) ( not ( = ?auto_328662 ?auto_328669 ) ) ( not ( = ?auto_328662 ?auto_328670 ) ) ( not ( = ?auto_328663 ?auto_328664 ) ) ( not ( = ?auto_328663 ?auto_328665 ) ) ( not ( = ?auto_328663 ?auto_328666 ) ) ( not ( = ?auto_328663 ?auto_328667 ) ) ( not ( = ?auto_328663 ?auto_328668 ) ) ( not ( = ?auto_328663 ?auto_328669 ) ) ( not ( = ?auto_328663 ?auto_328670 ) ) ( not ( = ?auto_328664 ?auto_328665 ) ) ( not ( = ?auto_328664 ?auto_328666 ) ) ( not ( = ?auto_328664 ?auto_328667 ) ) ( not ( = ?auto_328664 ?auto_328668 ) ) ( not ( = ?auto_328664 ?auto_328669 ) ) ( not ( = ?auto_328664 ?auto_328670 ) ) ( not ( = ?auto_328665 ?auto_328666 ) ) ( not ( = ?auto_328665 ?auto_328667 ) ) ( not ( = ?auto_328665 ?auto_328668 ) ) ( not ( = ?auto_328665 ?auto_328669 ) ) ( not ( = ?auto_328665 ?auto_328670 ) ) ( not ( = ?auto_328666 ?auto_328667 ) ) ( not ( = ?auto_328666 ?auto_328668 ) ) ( not ( = ?auto_328666 ?auto_328669 ) ) ( not ( = ?auto_328666 ?auto_328670 ) ) ( not ( = ?auto_328667 ?auto_328668 ) ) ( not ( = ?auto_328667 ?auto_328669 ) ) ( not ( = ?auto_328667 ?auto_328670 ) ) ( not ( = ?auto_328668 ?auto_328669 ) ) ( not ( = ?auto_328668 ?auto_328670 ) ) ( not ( = ?auto_328669 ?auto_328670 ) ) ( ON ?auto_328668 ?auto_328669 ) ( ON ?auto_328667 ?auto_328668 ) ( CLEAR ?auto_328665 ) ( ON ?auto_328666 ?auto_328667 ) ( CLEAR ?auto_328666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_328658 ?auto_328659 ?auto_328660 ?auto_328661 ?auto_328662 ?auto_328663 ?auto_328664 ?auto_328665 ?auto_328666 )
      ( MAKE-12PILE ?auto_328658 ?auto_328659 ?auto_328660 ?auto_328661 ?auto_328662 ?auto_328663 ?auto_328664 ?auto_328665 ?auto_328666 ?auto_328667 ?auto_328668 ?auto_328669 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328708 - BLOCK
      ?auto_328709 - BLOCK
      ?auto_328710 - BLOCK
      ?auto_328711 - BLOCK
      ?auto_328712 - BLOCK
      ?auto_328713 - BLOCK
      ?auto_328714 - BLOCK
      ?auto_328715 - BLOCK
      ?auto_328716 - BLOCK
      ?auto_328717 - BLOCK
      ?auto_328718 - BLOCK
      ?auto_328719 - BLOCK
    )
    :vars
    (
      ?auto_328720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328719 ?auto_328720 ) ( ON-TABLE ?auto_328708 ) ( ON ?auto_328709 ?auto_328708 ) ( ON ?auto_328710 ?auto_328709 ) ( ON ?auto_328711 ?auto_328710 ) ( ON ?auto_328712 ?auto_328711 ) ( ON ?auto_328713 ?auto_328712 ) ( ON ?auto_328714 ?auto_328713 ) ( not ( = ?auto_328708 ?auto_328709 ) ) ( not ( = ?auto_328708 ?auto_328710 ) ) ( not ( = ?auto_328708 ?auto_328711 ) ) ( not ( = ?auto_328708 ?auto_328712 ) ) ( not ( = ?auto_328708 ?auto_328713 ) ) ( not ( = ?auto_328708 ?auto_328714 ) ) ( not ( = ?auto_328708 ?auto_328715 ) ) ( not ( = ?auto_328708 ?auto_328716 ) ) ( not ( = ?auto_328708 ?auto_328717 ) ) ( not ( = ?auto_328708 ?auto_328718 ) ) ( not ( = ?auto_328708 ?auto_328719 ) ) ( not ( = ?auto_328708 ?auto_328720 ) ) ( not ( = ?auto_328709 ?auto_328710 ) ) ( not ( = ?auto_328709 ?auto_328711 ) ) ( not ( = ?auto_328709 ?auto_328712 ) ) ( not ( = ?auto_328709 ?auto_328713 ) ) ( not ( = ?auto_328709 ?auto_328714 ) ) ( not ( = ?auto_328709 ?auto_328715 ) ) ( not ( = ?auto_328709 ?auto_328716 ) ) ( not ( = ?auto_328709 ?auto_328717 ) ) ( not ( = ?auto_328709 ?auto_328718 ) ) ( not ( = ?auto_328709 ?auto_328719 ) ) ( not ( = ?auto_328709 ?auto_328720 ) ) ( not ( = ?auto_328710 ?auto_328711 ) ) ( not ( = ?auto_328710 ?auto_328712 ) ) ( not ( = ?auto_328710 ?auto_328713 ) ) ( not ( = ?auto_328710 ?auto_328714 ) ) ( not ( = ?auto_328710 ?auto_328715 ) ) ( not ( = ?auto_328710 ?auto_328716 ) ) ( not ( = ?auto_328710 ?auto_328717 ) ) ( not ( = ?auto_328710 ?auto_328718 ) ) ( not ( = ?auto_328710 ?auto_328719 ) ) ( not ( = ?auto_328710 ?auto_328720 ) ) ( not ( = ?auto_328711 ?auto_328712 ) ) ( not ( = ?auto_328711 ?auto_328713 ) ) ( not ( = ?auto_328711 ?auto_328714 ) ) ( not ( = ?auto_328711 ?auto_328715 ) ) ( not ( = ?auto_328711 ?auto_328716 ) ) ( not ( = ?auto_328711 ?auto_328717 ) ) ( not ( = ?auto_328711 ?auto_328718 ) ) ( not ( = ?auto_328711 ?auto_328719 ) ) ( not ( = ?auto_328711 ?auto_328720 ) ) ( not ( = ?auto_328712 ?auto_328713 ) ) ( not ( = ?auto_328712 ?auto_328714 ) ) ( not ( = ?auto_328712 ?auto_328715 ) ) ( not ( = ?auto_328712 ?auto_328716 ) ) ( not ( = ?auto_328712 ?auto_328717 ) ) ( not ( = ?auto_328712 ?auto_328718 ) ) ( not ( = ?auto_328712 ?auto_328719 ) ) ( not ( = ?auto_328712 ?auto_328720 ) ) ( not ( = ?auto_328713 ?auto_328714 ) ) ( not ( = ?auto_328713 ?auto_328715 ) ) ( not ( = ?auto_328713 ?auto_328716 ) ) ( not ( = ?auto_328713 ?auto_328717 ) ) ( not ( = ?auto_328713 ?auto_328718 ) ) ( not ( = ?auto_328713 ?auto_328719 ) ) ( not ( = ?auto_328713 ?auto_328720 ) ) ( not ( = ?auto_328714 ?auto_328715 ) ) ( not ( = ?auto_328714 ?auto_328716 ) ) ( not ( = ?auto_328714 ?auto_328717 ) ) ( not ( = ?auto_328714 ?auto_328718 ) ) ( not ( = ?auto_328714 ?auto_328719 ) ) ( not ( = ?auto_328714 ?auto_328720 ) ) ( not ( = ?auto_328715 ?auto_328716 ) ) ( not ( = ?auto_328715 ?auto_328717 ) ) ( not ( = ?auto_328715 ?auto_328718 ) ) ( not ( = ?auto_328715 ?auto_328719 ) ) ( not ( = ?auto_328715 ?auto_328720 ) ) ( not ( = ?auto_328716 ?auto_328717 ) ) ( not ( = ?auto_328716 ?auto_328718 ) ) ( not ( = ?auto_328716 ?auto_328719 ) ) ( not ( = ?auto_328716 ?auto_328720 ) ) ( not ( = ?auto_328717 ?auto_328718 ) ) ( not ( = ?auto_328717 ?auto_328719 ) ) ( not ( = ?auto_328717 ?auto_328720 ) ) ( not ( = ?auto_328718 ?auto_328719 ) ) ( not ( = ?auto_328718 ?auto_328720 ) ) ( not ( = ?auto_328719 ?auto_328720 ) ) ( ON ?auto_328718 ?auto_328719 ) ( ON ?auto_328717 ?auto_328718 ) ( ON ?auto_328716 ?auto_328717 ) ( CLEAR ?auto_328714 ) ( ON ?auto_328715 ?auto_328716 ) ( CLEAR ?auto_328715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_328708 ?auto_328709 ?auto_328710 ?auto_328711 ?auto_328712 ?auto_328713 ?auto_328714 ?auto_328715 )
      ( MAKE-12PILE ?auto_328708 ?auto_328709 ?auto_328710 ?auto_328711 ?auto_328712 ?auto_328713 ?auto_328714 ?auto_328715 ?auto_328716 ?auto_328717 ?auto_328718 ?auto_328719 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328758 - BLOCK
      ?auto_328759 - BLOCK
      ?auto_328760 - BLOCK
      ?auto_328761 - BLOCK
      ?auto_328762 - BLOCK
      ?auto_328763 - BLOCK
      ?auto_328764 - BLOCK
      ?auto_328765 - BLOCK
      ?auto_328766 - BLOCK
      ?auto_328767 - BLOCK
      ?auto_328768 - BLOCK
      ?auto_328769 - BLOCK
    )
    :vars
    (
      ?auto_328770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328769 ?auto_328770 ) ( ON-TABLE ?auto_328758 ) ( ON ?auto_328759 ?auto_328758 ) ( ON ?auto_328760 ?auto_328759 ) ( ON ?auto_328761 ?auto_328760 ) ( ON ?auto_328762 ?auto_328761 ) ( ON ?auto_328763 ?auto_328762 ) ( not ( = ?auto_328758 ?auto_328759 ) ) ( not ( = ?auto_328758 ?auto_328760 ) ) ( not ( = ?auto_328758 ?auto_328761 ) ) ( not ( = ?auto_328758 ?auto_328762 ) ) ( not ( = ?auto_328758 ?auto_328763 ) ) ( not ( = ?auto_328758 ?auto_328764 ) ) ( not ( = ?auto_328758 ?auto_328765 ) ) ( not ( = ?auto_328758 ?auto_328766 ) ) ( not ( = ?auto_328758 ?auto_328767 ) ) ( not ( = ?auto_328758 ?auto_328768 ) ) ( not ( = ?auto_328758 ?auto_328769 ) ) ( not ( = ?auto_328758 ?auto_328770 ) ) ( not ( = ?auto_328759 ?auto_328760 ) ) ( not ( = ?auto_328759 ?auto_328761 ) ) ( not ( = ?auto_328759 ?auto_328762 ) ) ( not ( = ?auto_328759 ?auto_328763 ) ) ( not ( = ?auto_328759 ?auto_328764 ) ) ( not ( = ?auto_328759 ?auto_328765 ) ) ( not ( = ?auto_328759 ?auto_328766 ) ) ( not ( = ?auto_328759 ?auto_328767 ) ) ( not ( = ?auto_328759 ?auto_328768 ) ) ( not ( = ?auto_328759 ?auto_328769 ) ) ( not ( = ?auto_328759 ?auto_328770 ) ) ( not ( = ?auto_328760 ?auto_328761 ) ) ( not ( = ?auto_328760 ?auto_328762 ) ) ( not ( = ?auto_328760 ?auto_328763 ) ) ( not ( = ?auto_328760 ?auto_328764 ) ) ( not ( = ?auto_328760 ?auto_328765 ) ) ( not ( = ?auto_328760 ?auto_328766 ) ) ( not ( = ?auto_328760 ?auto_328767 ) ) ( not ( = ?auto_328760 ?auto_328768 ) ) ( not ( = ?auto_328760 ?auto_328769 ) ) ( not ( = ?auto_328760 ?auto_328770 ) ) ( not ( = ?auto_328761 ?auto_328762 ) ) ( not ( = ?auto_328761 ?auto_328763 ) ) ( not ( = ?auto_328761 ?auto_328764 ) ) ( not ( = ?auto_328761 ?auto_328765 ) ) ( not ( = ?auto_328761 ?auto_328766 ) ) ( not ( = ?auto_328761 ?auto_328767 ) ) ( not ( = ?auto_328761 ?auto_328768 ) ) ( not ( = ?auto_328761 ?auto_328769 ) ) ( not ( = ?auto_328761 ?auto_328770 ) ) ( not ( = ?auto_328762 ?auto_328763 ) ) ( not ( = ?auto_328762 ?auto_328764 ) ) ( not ( = ?auto_328762 ?auto_328765 ) ) ( not ( = ?auto_328762 ?auto_328766 ) ) ( not ( = ?auto_328762 ?auto_328767 ) ) ( not ( = ?auto_328762 ?auto_328768 ) ) ( not ( = ?auto_328762 ?auto_328769 ) ) ( not ( = ?auto_328762 ?auto_328770 ) ) ( not ( = ?auto_328763 ?auto_328764 ) ) ( not ( = ?auto_328763 ?auto_328765 ) ) ( not ( = ?auto_328763 ?auto_328766 ) ) ( not ( = ?auto_328763 ?auto_328767 ) ) ( not ( = ?auto_328763 ?auto_328768 ) ) ( not ( = ?auto_328763 ?auto_328769 ) ) ( not ( = ?auto_328763 ?auto_328770 ) ) ( not ( = ?auto_328764 ?auto_328765 ) ) ( not ( = ?auto_328764 ?auto_328766 ) ) ( not ( = ?auto_328764 ?auto_328767 ) ) ( not ( = ?auto_328764 ?auto_328768 ) ) ( not ( = ?auto_328764 ?auto_328769 ) ) ( not ( = ?auto_328764 ?auto_328770 ) ) ( not ( = ?auto_328765 ?auto_328766 ) ) ( not ( = ?auto_328765 ?auto_328767 ) ) ( not ( = ?auto_328765 ?auto_328768 ) ) ( not ( = ?auto_328765 ?auto_328769 ) ) ( not ( = ?auto_328765 ?auto_328770 ) ) ( not ( = ?auto_328766 ?auto_328767 ) ) ( not ( = ?auto_328766 ?auto_328768 ) ) ( not ( = ?auto_328766 ?auto_328769 ) ) ( not ( = ?auto_328766 ?auto_328770 ) ) ( not ( = ?auto_328767 ?auto_328768 ) ) ( not ( = ?auto_328767 ?auto_328769 ) ) ( not ( = ?auto_328767 ?auto_328770 ) ) ( not ( = ?auto_328768 ?auto_328769 ) ) ( not ( = ?auto_328768 ?auto_328770 ) ) ( not ( = ?auto_328769 ?auto_328770 ) ) ( ON ?auto_328768 ?auto_328769 ) ( ON ?auto_328767 ?auto_328768 ) ( ON ?auto_328766 ?auto_328767 ) ( ON ?auto_328765 ?auto_328766 ) ( CLEAR ?auto_328763 ) ( ON ?auto_328764 ?auto_328765 ) ( CLEAR ?auto_328764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_328758 ?auto_328759 ?auto_328760 ?auto_328761 ?auto_328762 ?auto_328763 ?auto_328764 )
      ( MAKE-12PILE ?auto_328758 ?auto_328759 ?auto_328760 ?auto_328761 ?auto_328762 ?auto_328763 ?auto_328764 ?auto_328765 ?auto_328766 ?auto_328767 ?auto_328768 ?auto_328769 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328808 - BLOCK
      ?auto_328809 - BLOCK
      ?auto_328810 - BLOCK
      ?auto_328811 - BLOCK
      ?auto_328812 - BLOCK
      ?auto_328813 - BLOCK
      ?auto_328814 - BLOCK
      ?auto_328815 - BLOCK
      ?auto_328816 - BLOCK
      ?auto_328817 - BLOCK
      ?auto_328818 - BLOCK
      ?auto_328819 - BLOCK
    )
    :vars
    (
      ?auto_328820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328819 ?auto_328820 ) ( ON-TABLE ?auto_328808 ) ( ON ?auto_328809 ?auto_328808 ) ( ON ?auto_328810 ?auto_328809 ) ( ON ?auto_328811 ?auto_328810 ) ( ON ?auto_328812 ?auto_328811 ) ( not ( = ?auto_328808 ?auto_328809 ) ) ( not ( = ?auto_328808 ?auto_328810 ) ) ( not ( = ?auto_328808 ?auto_328811 ) ) ( not ( = ?auto_328808 ?auto_328812 ) ) ( not ( = ?auto_328808 ?auto_328813 ) ) ( not ( = ?auto_328808 ?auto_328814 ) ) ( not ( = ?auto_328808 ?auto_328815 ) ) ( not ( = ?auto_328808 ?auto_328816 ) ) ( not ( = ?auto_328808 ?auto_328817 ) ) ( not ( = ?auto_328808 ?auto_328818 ) ) ( not ( = ?auto_328808 ?auto_328819 ) ) ( not ( = ?auto_328808 ?auto_328820 ) ) ( not ( = ?auto_328809 ?auto_328810 ) ) ( not ( = ?auto_328809 ?auto_328811 ) ) ( not ( = ?auto_328809 ?auto_328812 ) ) ( not ( = ?auto_328809 ?auto_328813 ) ) ( not ( = ?auto_328809 ?auto_328814 ) ) ( not ( = ?auto_328809 ?auto_328815 ) ) ( not ( = ?auto_328809 ?auto_328816 ) ) ( not ( = ?auto_328809 ?auto_328817 ) ) ( not ( = ?auto_328809 ?auto_328818 ) ) ( not ( = ?auto_328809 ?auto_328819 ) ) ( not ( = ?auto_328809 ?auto_328820 ) ) ( not ( = ?auto_328810 ?auto_328811 ) ) ( not ( = ?auto_328810 ?auto_328812 ) ) ( not ( = ?auto_328810 ?auto_328813 ) ) ( not ( = ?auto_328810 ?auto_328814 ) ) ( not ( = ?auto_328810 ?auto_328815 ) ) ( not ( = ?auto_328810 ?auto_328816 ) ) ( not ( = ?auto_328810 ?auto_328817 ) ) ( not ( = ?auto_328810 ?auto_328818 ) ) ( not ( = ?auto_328810 ?auto_328819 ) ) ( not ( = ?auto_328810 ?auto_328820 ) ) ( not ( = ?auto_328811 ?auto_328812 ) ) ( not ( = ?auto_328811 ?auto_328813 ) ) ( not ( = ?auto_328811 ?auto_328814 ) ) ( not ( = ?auto_328811 ?auto_328815 ) ) ( not ( = ?auto_328811 ?auto_328816 ) ) ( not ( = ?auto_328811 ?auto_328817 ) ) ( not ( = ?auto_328811 ?auto_328818 ) ) ( not ( = ?auto_328811 ?auto_328819 ) ) ( not ( = ?auto_328811 ?auto_328820 ) ) ( not ( = ?auto_328812 ?auto_328813 ) ) ( not ( = ?auto_328812 ?auto_328814 ) ) ( not ( = ?auto_328812 ?auto_328815 ) ) ( not ( = ?auto_328812 ?auto_328816 ) ) ( not ( = ?auto_328812 ?auto_328817 ) ) ( not ( = ?auto_328812 ?auto_328818 ) ) ( not ( = ?auto_328812 ?auto_328819 ) ) ( not ( = ?auto_328812 ?auto_328820 ) ) ( not ( = ?auto_328813 ?auto_328814 ) ) ( not ( = ?auto_328813 ?auto_328815 ) ) ( not ( = ?auto_328813 ?auto_328816 ) ) ( not ( = ?auto_328813 ?auto_328817 ) ) ( not ( = ?auto_328813 ?auto_328818 ) ) ( not ( = ?auto_328813 ?auto_328819 ) ) ( not ( = ?auto_328813 ?auto_328820 ) ) ( not ( = ?auto_328814 ?auto_328815 ) ) ( not ( = ?auto_328814 ?auto_328816 ) ) ( not ( = ?auto_328814 ?auto_328817 ) ) ( not ( = ?auto_328814 ?auto_328818 ) ) ( not ( = ?auto_328814 ?auto_328819 ) ) ( not ( = ?auto_328814 ?auto_328820 ) ) ( not ( = ?auto_328815 ?auto_328816 ) ) ( not ( = ?auto_328815 ?auto_328817 ) ) ( not ( = ?auto_328815 ?auto_328818 ) ) ( not ( = ?auto_328815 ?auto_328819 ) ) ( not ( = ?auto_328815 ?auto_328820 ) ) ( not ( = ?auto_328816 ?auto_328817 ) ) ( not ( = ?auto_328816 ?auto_328818 ) ) ( not ( = ?auto_328816 ?auto_328819 ) ) ( not ( = ?auto_328816 ?auto_328820 ) ) ( not ( = ?auto_328817 ?auto_328818 ) ) ( not ( = ?auto_328817 ?auto_328819 ) ) ( not ( = ?auto_328817 ?auto_328820 ) ) ( not ( = ?auto_328818 ?auto_328819 ) ) ( not ( = ?auto_328818 ?auto_328820 ) ) ( not ( = ?auto_328819 ?auto_328820 ) ) ( ON ?auto_328818 ?auto_328819 ) ( ON ?auto_328817 ?auto_328818 ) ( ON ?auto_328816 ?auto_328817 ) ( ON ?auto_328815 ?auto_328816 ) ( ON ?auto_328814 ?auto_328815 ) ( CLEAR ?auto_328812 ) ( ON ?auto_328813 ?auto_328814 ) ( CLEAR ?auto_328813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_328808 ?auto_328809 ?auto_328810 ?auto_328811 ?auto_328812 ?auto_328813 )
      ( MAKE-12PILE ?auto_328808 ?auto_328809 ?auto_328810 ?auto_328811 ?auto_328812 ?auto_328813 ?auto_328814 ?auto_328815 ?auto_328816 ?auto_328817 ?auto_328818 ?auto_328819 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328858 - BLOCK
      ?auto_328859 - BLOCK
      ?auto_328860 - BLOCK
      ?auto_328861 - BLOCK
      ?auto_328862 - BLOCK
      ?auto_328863 - BLOCK
      ?auto_328864 - BLOCK
      ?auto_328865 - BLOCK
      ?auto_328866 - BLOCK
      ?auto_328867 - BLOCK
      ?auto_328868 - BLOCK
      ?auto_328869 - BLOCK
    )
    :vars
    (
      ?auto_328870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328869 ?auto_328870 ) ( ON-TABLE ?auto_328858 ) ( ON ?auto_328859 ?auto_328858 ) ( ON ?auto_328860 ?auto_328859 ) ( ON ?auto_328861 ?auto_328860 ) ( not ( = ?auto_328858 ?auto_328859 ) ) ( not ( = ?auto_328858 ?auto_328860 ) ) ( not ( = ?auto_328858 ?auto_328861 ) ) ( not ( = ?auto_328858 ?auto_328862 ) ) ( not ( = ?auto_328858 ?auto_328863 ) ) ( not ( = ?auto_328858 ?auto_328864 ) ) ( not ( = ?auto_328858 ?auto_328865 ) ) ( not ( = ?auto_328858 ?auto_328866 ) ) ( not ( = ?auto_328858 ?auto_328867 ) ) ( not ( = ?auto_328858 ?auto_328868 ) ) ( not ( = ?auto_328858 ?auto_328869 ) ) ( not ( = ?auto_328858 ?auto_328870 ) ) ( not ( = ?auto_328859 ?auto_328860 ) ) ( not ( = ?auto_328859 ?auto_328861 ) ) ( not ( = ?auto_328859 ?auto_328862 ) ) ( not ( = ?auto_328859 ?auto_328863 ) ) ( not ( = ?auto_328859 ?auto_328864 ) ) ( not ( = ?auto_328859 ?auto_328865 ) ) ( not ( = ?auto_328859 ?auto_328866 ) ) ( not ( = ?auto_328859 ?auto_328867 ) ) ( not ( = ?auto_328859 ?auto_328868 ) ) ( not ( = ?auto_328859 ?auto_328869 ) ) ( not ( = ?auto_328859 ?auto_328870 ) ) ( not ( = ?auto_328860 ?auto_328861 ) ) ( not ( = ?auto_328860 ?auto_328862 ) ) ( not ( = ?auto_328860 ?auto_328863 ) ) ( not ( = ?auto_328860 ?auto_328864 ) ) ( not ( = ?auto_328860 ?auto_328865 ) ) ( not ( = ?auto_328860 ?auto_328866 ) ) ( not ( = ?auto_328860 ?auto_328867 ) ) ( not ( = ?auto_328860 ?auto_328868 ) ) ( not ( = ?auto_328860 ?auto_328869 ) ) ( not ( = ?auto_328860 ?auto_328870 ) ) ( not ( = ?auto_328861 ?auto_328862 ) ) ( not ( = ?auto_328861 ?auto_328863 ) ) ( not ( = ?auto_328861 ?auto_328864 ) ) ( not ( = ?auto_328861 ?auto_328865 ) ) ( not ( = ?auto_328861 ?auto_328866 ) ) ( not ( = ?auto_328861 ?auto_328867 ) ) ( not ( = ?auto_328861 ?auto_328868 ) ) ( not ( = ?auto_328861 ?auto_328869 ) ) ( not ( = ?auto_328861 ?auto_328870 ) ) ( not ( = ?auto_328862 ?auto_328863 ) ) ( not ( = ?auto_328862 ?auto_328864 ) ) ( not ( = ?auto_328862 ?auto_328865 ) ) ( not ( = ?auto_328862 ?auto_328866 ) ) ( not ( = ?auto_328862 ?auto_328867 ) ) ( not ( = ?auto_328862 ?auto_328868 ) ) ( not ( = ?auto_328862 ?auto_328869 ) ) ( not ( = ?auto_328862 ?auto_328870 ) ) ( not ( = ?auto_328863 ?auto_328864 ) ) ( not ( = ?auto_328863 ?auto_328865 ) ) ( not ( = ?auto_328863 ?auto_328866 ) ) ( not ( = ?auto_328863 ?auto_328867 ) ) ( not ( = ?auto_328863 ?auto_328868 ) ) ( not ( = ?auto_328863 ?auto_328869 ) ) ( not ( = ?auto_328863 ?auto_328870 ) ) ( not ( = ?auto_328864 ?auto_328865 ) ) ( not ( = ?auto_328864 ?auto_328866 ) ) ( not ( = ?auto_328864 ?auto_328867 ) ) ( not ( = ?auto_328864 ?auto_328868 ) ) ( not ( = ?auto_328864 ?auto_328869 ) ) ( not ( = ?auto_328864 ?auto_328870 ) ) ( not ( = ?auto_328865 ?auto_328866 ) ) ( not ( = ?auto_328865 ?auto_328867 ) ) ( not ( = ?auto_328865 ?auto_328868 ) ) ( not ( = ?auto_328865 ?auto_328869 ) ) ( not ( = ?auto_328865 ?auto_328870 ) ) ( not ( = ?auto_328866 ?auto_328867 ) ) ( not ( = ?auto_328866 ?auto_328868 ) ) ( not ( = ?auto_328866 ?auto_328869 ) ) ( not ( = ?auto_328866 ?auto_328870 ) ) ( not ( = ?auto_328867 ?auto_328868 ) ) ( not ( = ?auto_328867 ?auto_328869 ) ) ( not ( = ?auto_328867 ?auto_328870 ) ) ( not ( = ?auto_328868 ?auto_328869 ) ) ( not ( = ?auto_328868 ?auto_328870 ) ) ( not ( = ?auto_328869 ?auto_328870 ) ) ( ON ?auto_328868 ?auto_328869 ) ( ON ?auto_328867 ?auto_328868 ) ( ON ?auto_328866 ?auto_328867 ) ( ON ?auto_328865 ?auto_328866 ) ( ON ?auto_328864 ?auto_328865 ) ( ON ?auto_328863 ?auto_328864 ) ( CLEAR ?auto_328861 ) ( ON ?auto_328862 ?auto_328863 ) ( CLEAR ?auto_328862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_328858 ?auto_328859 ?auto_328860 ?auto_328861 ?auto_328862 )
      ( MAKE-12PILE ?auto_328858 ?auto_328859 ?auto_328860 ?auto_328861 ?auto_328862 ?auto_328863 ?auto_328864 ?auto_328865 ?auto_328866 ?auto_328867 ?auto_328868 ?auto_328869 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328908 - BLOCK
      ?auto_328909 - BLOCK
      ?auto_328910 - BLOCK
      ?auto_328911 - BLOCK
      ?auto_328912 - BLOCK
      ?auto_328913 - BLOCK
      ?auto_328914 - BLOCK
      ?auto_328915 - BLOCK
      ?auto_328916 - BLOCK
      ?auto_328917 - BLOCK
      ?auto_328918 - BLOCK
      ?auto_328919 - BLOCK
    )
    :vars
    (
      ?auto_328920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328919 ?auto_328920 ) ( ON-TABLE ?auto_328908 ) ( ON ?auto_328909 ?auto_328908 ) ( ON ?auto_328910 ?auto_328909 ) ( not ( = ?auto_328908 ?auto_328909 ) ) ( not ( = ?auto_328908 ?auto_328910 ) ) ( not ( = ?auto_328908 ?auto_328911 ) ) ( not ( = ?auto_328908 ?auto_328912 ) ) ( not ( = ?auto_328908 ?auto_328913 ) ) ( not ( = ?auto_328908 ?auto_328914 ) ) ( not ( = ?auto_328908 ?auto_328915 ) ) ( not ( = ?auto_328908 ?auto_328916 ) ) ( not ( = ?auto_328908 ?auto_328917 ) ) ( not ( = ?auto_328908 ?auto_328918 ) ) ( not ( = ?auto_328908 ?auto_328919 ) ) ( not ( = ?auto_328908 ?auto_328920 ) ) ( not ( = ?auto_328909 ?auto_328910 ) ) ( not ( = ?auto_328909 ?auto_328911 ) ) ( not ( = ?auto_328909 ?auto_328912 ) ) ( not ( = ?auto_328909 ?auto_328913 ) ) ( not ( = ?auto_328909 ?auto_328914 ) ) ( not ( = ?auto_328909 ?auto_328915 ) ) ( not ( = ?auto_328909 ?auto_328916 ) ) ( not ( = ?auto_328909 ?auto_328917 ) ) ( not ( = ?auto_328909 ?auto_328918 ) ) ( not ( = ?auto_328909 ?auto_328919 ) ) ( not ( = ?auto_328909 ?auto_328920 ) ) ( not ( = ?auto_328910 ?auto_328911 ) ) ( not ( = ?auto_328910 ?auto_328912 ) ) ( not ( = ?auto_328910 ?auto_328913 ) ) ( not ( = ?auto_328910 ?auto_328914 ) ) ( not ( = ?auto_328910 ?auto_328915 ) ) ( not ( = ?auto_328910 ?auto_328916 ) ) ( not ( = ?auto_328910 ?auto_328917 ) ) ( not ( = ?auto_328910 ?auto_328918 ) ) ( not ( = ?auto_328910 ?auto_328919 ) ) ( not ( = ?auto_328910 ?auto_328920 ) ) ( not ( = ?auto_328911 ?auto_328912 ) ) ( not ( = ?auto_328911 ?auto_328913 ) ) ( not ( = ?auto_328911 ?auto_328914 ) ) ( not ( = ?auto_328911 ?auto_328915 ) ) ( not ( = ?auto_328911 ?auto_328916 ) ) ( not ( = ?auto_328911 ?auto_328917 ) ) ( not ( = ?auto_328911 ?auto_328918 ) ) ( not ( = ?auto_328911 ?auto_328919 ) ) ( not ( = ?auto_328911 ?auto_328920 ) ) ( not ( = ?auto_328912 ?auto_328913 ) ) ( not ( = ?auto_328912 ?auto_328914 ) ) ( not ( = ?auto_328912 ?auto_328915 ) ) ( not ( = ?auto_328912 ?auto_328916 ) ) ( not ( = ?auto_328912 ?auto_328917 ) ) ( not ( = ?auto_328912 ?auto_328918 ) ) ( not ( = ?auto_328912 ?auto_328919 ) ) ( not ( = ?auto_328912 ?auto_328920 ) ) ( not ( = ?auto_328913 ?auto_328914 ) ) ( not ( = ?auto_328913 ?auto_328915 ) ) ( not ( = ?auto_328913 ?auto_328916 ) ) ( not ( = ?auto_328913 ?auto_328917 ) ) ( not ( = ?auto_328913 ?auto_328918 ) ) ( not ( = ?auto_328913 ?auto_328919 ) ) ( not ( = ?auto_328913 ?auto_328920 ) ) ( not ( = ?auto_328914 ?auto_328915 ) ) ( not ( = ?auto_328914 ?auto_328916 ) ) ( not ( = ?auto_328914 ?auto_328917 ) ) ( not ( = ?auto_328914 ?auto_328918 ) ) ( not ( = ?auto_328914 ?auto_328919 ) ) ( not ( = ?auto_328914 ?auto_328920 ) ) ( not ( = ?auto_328915 ?auto_328916 ) ) ( not ( = ?auto_328915 ?auto_328917 ) ) ( not ( = ?auto_328915 ?auto_328918 ) ) ( not ( = ?auto_328915 ?auto_328919 ) ) ( not ( = ?auto_328915 ?auto_328920 ) ) ( not ( = ?auto_328916 ?auto_328917 ) ) ( not ( = ?auto_328916 ?auto_328918 ) ) ( not ( = ?auto_328916 ?auto_328919 ) ) ( not ( = ?auto_328916 ?auto_328920 ) ) ( not ( = ?auto_328917 ?auto_328918 ) ) ( not ( = ?auto_328917 ?auto_328919 ) ) ( not ( = ?auto_328917 ?auto_328920 ) ) ( not ( = ?auto_328918 ?auto_328919 ) ) ( not ( = ?auto_328918 ?auto_328920 ) ) ( not ( = ?auto_328919 ?auto_328920 ) ) ( ON ?auto_328918 ?auto_328919 ) ( ON ?auto_328917 ?auto_328918 ) ( ON ?auto_328916 ?auto_328917 ) ( ON ?auto_328915 ?auto_328916 ) ( ON ?auto_328914 ?auto_328915 ) ( ON ?auto_328913 ?auto_328914 ) ( ON ?auto_328912 ?auto_328913 ) ( CLEAR ?auto_328910 ) ( ON ?auto_328911 ?auto_328912 ) ( CLEAR ?auto_328911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_328908 ?auto_328909 ?auto_328910 ?auto_328911 )
      ( MAKE-12PILE ?auto_328908 ?auto_328909 ?auto_328910 ?auto_328911 ?auto_328912 ?auto_328913 ?auto_328914 ?auto_328915 ?auto_328916 ?auto_328917 ?auto_328918 ?auto_328919 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_328958 - BLOCK
      ?auto_328959 - BLOCK
      ?auto_328960 - BLOCK
      ?auto_328961 - BLOCK
      ?auto_328962 - BLOCK
      ?auto_328963 - BLOCK
      ?auto_328964 - BLOCK
      ?auto_328965 - BLOCK
      ?auto_328966 - BLOCK
      ?auto_328967 - BLOCK
      ?auto_328968 - BLOCK
      ?auto_328969 - BLOCK
    )
    :vars
    (
      ?auto_328970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_328969 ?auto_328970 ) ( ON-TABLE ?auto_328958 ) ( ON ?auto_328959 ?auto_328958 ) ( not ( = ?auto_328958 ?auto_328959 ) ) ( not ( = ?auto_328958 ?auto_328960 ) ) ( not ( = ?auto_328958 ?auto_328961 ) ) ( not ( = ?auto_328958 ?auto_328962 ) ) ( not ( = ?auto_328958 ?auto_328963 ) ) ( not ( = ?auto_328958 ?auto_328964 ) ) ( not ( = ?auto_328958 ?auto_328965 ) ) ( not ( = ?auto_328958 ?auto_328966 ) ) ( not ( = ?auto_328958 ?auto_328967 ) ) ( not ( = ?auto_328958 ?auto_328968 ) ) ( not ( = ?auto_328958 ?auto_328969 ) ) ( not ( = ?auto_328958 ?auto_328970 ) ) ( not ( = ?auto_328959 ?auto_328960 ) ) ( not ( = ?auto_328959 ?auto_328961 ) ) ( not ( = ?auto_328959 ?auto_328962 ) ) ( not ( = ?auto_328959 ?auto_328963 ) ) ( not ( = ?auto_328959 ?auto_328964 ) ) ( not ( = ?auto_328959 ?auto_328965 ) ) ( not ( = ?auto_328959 ?auto_328966 ) ) ( not ( = ?auto_328959 ?auto_328967 ) ) ( not ( = ?auto_328959 ?auto_328968 ) ) ( not ( = ?auto_328959 ?auto_328969 ) ) ( not ( = ?auto_328959 ?auto_328970 ) ) ( not ( = ?auto_328960 ?auto_328961 ) ) ( not ( = ?auto_328960 ?auto_328962 ) ) ( not ( = ?auto_328960 ?auto_328963 ) ) ( not ( = ?auto_328960 ?auto_328964 ) ) ( not ( = ?auto_328960 ?auto_328965 ) ) ( not ( = ?auto_328960 ?auto_328966 ) ) ( not ( = ?auto_328960 ?auto_328967 ) ) ( not ( = ?auto_328960 ?auto_328968 ) ) ( not ( = ?auto_328960 ?auto_328969 ) ) ( not ( = ?auto_328960 ?auto_328970 ) ) ( not ( = ?auto_328961 ?auto_328962 ) ) ( not ( = ?auto_328961 ?auto_328963 ) ) ( not ( = ?auto_328961 ?auto_328964 ) ) ( not ( = ?auto_328961 ?auto_328965 ) ) ( not ( = ?auto_328961 ?auto_328966 ) ) ( not ( = ?auto_328961 ?auto_328967 ) ) ( not ( = ?auto_328961 ?auto_328968 ) ) ( not ( = ?auto_328961 ?auto_328969 ) ) ( not ( = ?auto_328961 ?auto_328970 ) ) ( not ( = ?auto_328962 ?auto_328963 ) ) ( not ( = ?auto_328962 ?auto_328964 ) ) ( not ( = ?auto_328962 ?auto_328965 ) ) ( not ( = ?auto_328962 ?auto_328966 ) ) ( not ( = ?auto_328962 ?auto_328967 ) ) ( not ( = ?auto_328962 ?auto_328968 ) ) ( not ( = ?auto_328962 ?auto_328969 ) ) ( not ( = ?auto_328962 ?auto_328970 ) ) ( not ( = ?auto_328963 ?auto_328964 ) ) ( not ( = ?auto_328963 ?auto_328965 ) ) ( not ( = ?auto_328963 ?auto_328966 ) ) ( not ( = ?auto_328963 ?auto_328967 ) ) ( not ( = ?auto_328963 ?auto_328968 ) ) ( not ( = ?auto_328963 ?auto_328969 ) ) ( not ( = ?auto_328963 ?auto_328970 ) ) ( not ( = ?auto_328964 ?auto_328965 ) ) ( not ( = ?auto_328964 ?auto_328966 ) ) ( not ( = ?auto_328964 ?auto_328967 ) ) ( not ( = ?auto_328964 ?auto_328968 ) ) ( not ( = ?auto_328964 ?auto_328969 ) ) ( not ( = ?auto_328964 ?auto_328970 ) ) ( not ( = ?auto_328965 ?auto_328966 ) ) ( not ( = ?auto_328965 ?auto_328967 ) ) ( not ( = ?auto_328965 ?auto_328968 ) ) ( not ( = ?auto_328965 ?auto_328969 ) ) ( not ( = ?auto_328965 ?auto_328970 ) ) ( not ( = ?auto_328966 ?auto_328967 ) ) ( not ( = ?auto_328966 ?auto_328968 ) ) ( not ( = ?auto_328966 ?auto_328969 ) ) ( not ( = ?auto_328966 ?auto_328970 ) ) ( not ( = ?auto_328967 ?auto_328968 ) ) ( not ( = ?auto_328967 ?auto_328969 ) ) ( not ( = ?auto_328967 ?auto_328970 ) ) ( not ( = ?auto_328968 ?auto_328969 ) ) ( not ( = ?auto_328968 ?auto_328970 ) ) ( not ( = ?auto_328969 ?auto_328970 ) ) ( ON ?auto_328968 ?auto_328969 ) ( ON ?auto_328967 ?auto_328968 ) ( ON ?auto_328966 ?auto_328967 ) ( ON ?auto_328965 ?auto_328966 ) ( ON ?auto_328964 ?auto_328965 ) ( ON ?auto_328963 ?auto_328964 ) ( ON ?auto_328962 ?auto_328963 ) ( ON ?auto_328961 ?auto_328962 ) ( CLEAR ?auto_328959 ) ( ON ?auto_328960 ?auto_328961 ) ( CLEAR ?auto_328960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_328958 ?auto_328959 ?auto_328960 )
      ( MAKE-12PILE ?auto_328958 ?auto_328959 ?auto_328960 ?auto_328961 ?auto_328962 ?auto_328963 ?auto_328964 ?auto_328965 ?auto_328966 ?auto_328967 ?auto_328968 ?auto_328969 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_329008 - BLOCK
      ?auto_329009 - BLOCK
      ?auto_329010 - BLOCK
      ?auto_329011 - BLOCK
      ?auto_329012 - BLOCK
      ?auto_329013 - BLOCK
      ?auto_329014 - BLOCK
      ?auto_329015 - BLOCK
      ?auto_329016 - BLOCK
      ?auto_329017 - BLOCK
      ?auto_329018 - BLOCK
      ?auto_329019 - BLOCK
    )
    :vars
    (
      ?auto_329020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329019 ?auto_329020 ) ( ON-TABLE ?auto_329008 ) ( not ( = ?auto_329008 ?auto_329009 ) ) ( not ( = ?auto_329008 ?auto_329010 ) ) ( not ( = ?auto_329008 ?auto_329011 ) ) ( not ( = ?auto_329008 ?auto_329012 ) ) ( not ( = ?auto_329008 ?auto_329013 ) ) ( not ( = ?auto_329008 ?auto_329014 ) ) ( not ( = ?auto_329008 ?auto_329015 ) ) ( not ( = ?auto_329008 ?auto_329016 ) ) ( not ( = ?auto_329008 ?auto_329017 ) ) ( not ( = ?auto_329008 ?auto_329018 ) ) ( not ( = ?auto_329008 ?auto_329019 ) ) ( not ( = ?auto_329008 ?auto_329020 ) ) ( not ( = ?auto_329009 ?auto_329010 ) ) ( not ( = ?auto_329009 ?auto_329011 ) ) ( not ( = ?auto_329009 ?auto_329012 ) ) ( not ( = ?auto_329009 ?auto_329013 ) ) ( not ( = ?auto_329009 ?auto_329014 ) ) ( not ( = ?auto_329009 ?auto_329015 ) ) ( not ( = ?auto_329009 ?auto_329016 ) ) ( not ( = ?auto_329009 ?auto_329017 ) ) ( not ( = ?auto_329009 ?auto_329018 ) ) ( not ( = ?auto_329009 ?auto_329019 ) ) ( not ( = ?auto_329009 ?auto_329020 ) ) ( not ( = ?auto_329010 ?auto_329011 ) ) ( not ( = ?auto_329010 ?auto_329012 ) ) ( not ( = ?auto_329010 ?auto_329013 ) ) ( not ( = ?auto_329010 ?auto_329014 ) ) ( not ( = ?auto_329010 ?auto_329015 ) ) ( not ( = ?auto_329010 ?auto_329016 ) ) ( not ( = ?auto_329010 ?auto_329017 ) ) ( not ( = ?auto_329010 ?auto_329018 ) ) ( not ( = ?auto_329010 ?auto_329019 ) ) ( not ( = ?auto_329010 ?auto_329020 ) ) ( not ( = ?auto_329011 ?auto_329012 ) ) ( not ( = ?auto_329011 ?auto_329013 ) ) ( not ( = ?auto_329011 ?auto_329014 ) ) ( not ( = ?auto_329011 ?auto_329015 ) ) ( not ( = ?auto_329011 ?auto_329016 ) ) ( not ( = ?auto_329011 ?auto_329017 ) ) ( not ( = ?auto_329011 ?auto_329018 ) ) ( not ( = ?auto_329011 ?auto_329019 ) ) ( not ( = ?auto_329011 ?auto_329020 ) ) ( not ( = ?auto_329012 ?auto_329013 ) ) ( not ( = ?auto_329012 ?auto_329014 ) ) ( not ( = ?auto_329012 ?auto_329015 ) ) ( not ( = ?auto_329012 ?auto_329016 ) ) ( not ( = ?auto_329012 ?auto_329017 ) ) ( not ( = ?auto_329012 ?auto_329018 ) ) ( not ( = ?auto_329012 ?auto_329019 ) ) ( not ( = ?auto_329012 ?auto_329020 ) ) ( not ( = ?auto_329013 ?auto_329014 ) ) ( not ( = ?auto_329013 ?auto_329015 ) ) ( not ( = ?auto_329013 ?auto_329016 ) ) ( not ( = ?auto_329013 ?auto_329017 ) ) ( not ( = ?auto_329013 ?auto_329018 ) ) ( not ( = ?auto_329013 ?auto_329019 ) ) ( not ( = ?auto_329013 ?auto_329020 ) ) ( not ( = ?auto_329014 ?auto_329015 ) ) ( not ( = ?auto_329014 ?auto_329016 ) ) ( not ( = ?auto_329014 ?auto_329017 ) ) ( not ( = ?auto_329014 ?auto_329018 ) ) ( not ( = ?auto_329014 ?auto_329019 ) ) ( not ( = ?auto_329014 ?auto_329020 ) ) ( not ( = ?auto_329015 ?auto_329016 ) ) ( not ( = ?auto_329015 ?auto_329017 ) ) ( not ( = ?auto_329015 ?auto_329018 ) ) ( not ( = ?auto_329015 ?auto_329019 ) ) ( not ( = ?auto_329015 ?auto_329020 ) ) ( not ( = ?auto_329016 ?auto_329017 ) ) ( not ( = ?auto_329016 ?auto_329018 ) ) ( not ( = ?auto_329016 ?auto_329019 ) ) ( not ( = ?auto_329016 ?auto_329020 ) ) ( not ( = ?auto_329017 ?auto_329018 ) ) ( not ( = ?auto_329017 ?auto_329019 ) ) ( not ( = ?auto_329017 ?auto_329020 ) ) ( not ( = ?auto_329018 ?auto_329019 ) ) ( not ( = ?auto_329018 ?auto_329020 ) ) ( not ( = ?auto_329019 ?auto_329020 ) ) ( ON ?auto_329018 ?auto_329019 ) ( ON ?auto_329017 ?auto_329018 ) ( ON ?auto_329016 ?auto_329017 ) ( ON ?auto_329015 ?auto_329016 ) ( ON ?auto_329014 ?auto_329015 ) ( ON ?auto_329013 ?auto_329014 ) ( ON ?auto_329012 ?auto_329013 ) ( ON ?auto_329011 ?auto_329012 ) ( ON ?auto_329010 ?auto_329011 ) ( CLEAR ?auto_329008 ) ( ON ?auto_329009 ?auto_329010 ) ( CLEAR ?auto_329009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_329008 ?auto_329009 )
      ( MAKE-12PILE ?auto_329008 ?auto_329009 ?auto_329010 ?auto_329011 ?auto_329012 ?auto_329013 ?auto_329014 ?auto_329015 ?auto_329016 ?auto_329017 ?auto_329018 ?auto_329019 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_329058 - BLOCK
      ?auto_329059 - BLOCK
      ?auto_329060 - BLOCK
      ?auto_329061 - BLOCK
      ?auto_329062 - BLOCK
      ?auto_329063 - BLOCK
      ?auto_329064 - BLOCK
      ?auto_329065 - BLOCK
      ?auto_329066 - BLOCK
      ?auto_329067 - BLOCK
      ?auto_329068 - BLOCK
      ?auto_329069 - BLOCK
    )
    :vars
    (
      ?auto_329070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329069 ?auto_329070 ) ( not ( = ?auto_329058 ?auto_329059 ) ) ( not ( = ?auto_329058 ?auto_329060 ) ) ( not ( = ?auto_329058 ?auto_329061 ) ) ( not ( = ?auto_329058 ?auto_329062 ) ) ( not ( = ?auto_329058 ?auto_329063 ) ) ( not ( = ?auto_329058 ?auto_329064 ) ) ( not ( = ?auto_329058 ?auto_329065 ) ) ( not ( = ?auto_329058 ?auto_329066 ) ) ( not ( = ?auto_329058 ?auto_329067 ) ) ( not ( = ?auto_329058 ?auto_329068 ) ) ( not ( = ?auto_329058 ?auto_329069 ) ) ( not ( = ?auto_329058 ?auto_329070 ) ) ( not ( = ?auto_329059 ?auto_329060 ) ) ( not ( = ?auto_329059 ?auto_329061 ) ) ( not ( = ?auto_329059 ?auto_329062 ) ) ( not ( = ?auto_329059 ?auto_329063 ) ) ( not ( = ?auto_329059 ?auto_329064 ) ) ( not ( = ?auto_329059 ?auto_329065 ) ) ( not ( = ?auto_329059 ?auto_329066 ) ) ( not ( = ?auto_329059 ?auto_329067 ) ) ( not ( = ?auto_329059 ?auto_329068 ) ) ( not ( = ?auto_329059 ?auto_329069 ) ) ( not ( = ?auto_329059 ?auto_329070 ) ) ( not ( = ?auto_329060 ?auto_329061 ) ) ( not ( = ?auto_329060 ?auto_329062 ) ) ( not ( = ?auto_329060 ?auto_329063 ) ) ( not ( = ?auto_329060 ?auto_329064 ) ) ( not ( = ?auto_329060 ?auto_329065 ) ) ( not ( = ?auto_329060 ?auto_329066 ) ) ( not ( = ?auto_329060 ?auto_329067 ) ) ( not ( = ?auto_329060 ?auto_329068 ) ) ( not ( = ?auto_329060 ?auto_329069 ) ) ( not ( = ?auto_329060 ?auto_329070 ) ) ( not ( = ?auto_329061 ?auto_329062 ) ) ( not ( = ?auto_329061 ?auto_329063 ) ) ( not ( = ?auto_329061 ?auto_329064 ) ) ( not ( = ?auto_329061 ?auto_329065 ) ) ( not ( = ?auto_329061 ?auto_329066 ) ) ( not ( = ?auto_329061 ?auto_329067 ) ) ( not ( = ?auto_329061 ?auto_329068 ) ) ( not ( = ?auto_329061 ?auto_329069 ) ) ( not ( = ?auto_329061 ?auto_329070 ) ) ( not ( = ?auto_329062 ?auto_329063 ) ) ( not ( = ?auto_329062 ?auto_329064 ) ) ( not ( = ?auto_329062 ?auto_329065 ) ) ( not ( = ?auto_329062 ?auto_329066 ) ) ( not ( = ?auto_329062 ?auto_329067 ) ) ( not ( = ?auto_329062 ?auto_329068 ) ) ( not ( = ?auto_329062 ?auto_329069 ) ) ( not ( = ?auto_329062 ?auto_329070 ) ) ( not ( = ?auto_329063 ?auto_329064 ) ) ( not ( = ?auto_329063 ?auto_329065 ) ) ( not ( = ?auto_329063 ?auto_329066 ) ) ( not ( = ?auto_329063 ?auto_329067 ) ) ( not ( = ?auto_329063 ?auto_329068 ) ) ( not ( = ?auto_329063 ?auto_329069 ) ) ( not ( = ?auto_329063 ?auto_329070 ) ) ( not ( = ?auto_329064 ?auto_329065 ) ) ( not ( = ?auto_329064 ?auto_329066 ) ) ( not ( = ?auto_329064 ?auto_329067 ) ) ( not ( = ?auto_329064 ?auto_329068 ) ) ( not ( = ?auto_329064 ?auto_329069 ) ) ( not ( = ?auto_329064 ?auto_329070 ) ) ( not ( = ?auto_329065 ?auto_329066 ) ) ( not ( = ?auto_329065 ?auto_329067 ) ) ( not ( = ?auto_329065 ?auto_329068 ) ) ( not ( = ?auto_329065 ?auto_329069 ) ) ( not ( = ?auto_329065 ?auto_329070 ) ) ( not ( = ?auto_329066 ?auto_329067 ) ) ( not ( = ?auto_329066 ?auto_329068 ) ) ( not ( = ?auto_329066 ?auto_329069 ) ) ( not ( = ?auto_329066 ?auto_329070 ) ) ( not ( = ?auto_329067 ?auto_329068 ) ) ( not ( = ?auto_329067 ?auto_329069 ) ) ( not ( = ?auto_329067 ?auto_329070 ) ) ( not ( = ?auto_329068 ?auto_329069 ) ) ( not ( = ?auto_329068 ?auto_329070 ) ) ( not ( = ?auto_329069 ?auto_329070 ) ) ( ON ?auto_329068 ?auto_329069 ) ( ON ?auto_329067 ?auto_329068 ) ( ON ?auto_329066 ?auto_329067 ) ( ON ?auto_329065 ?auto_329066 ) ( ON ?auto_329064 ?auto_329065 ) ( ON ?auto_329063 ?auto_329064 ) ( ON ?auto_329062 ?auto_329063 ) ( ON ?auto_329061 ?auto_329062 ) ( ON ?auto_329060 ?auto_329061 ) ( ON ?auto_329059 ?auto_329060 ) ( ON ?auto_329058 ?auto_329059 ) ( CLEAR ?auto_329058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_329058 )
      ( MAKE-12PILE ?auto_329058 ?auto_329059 ?auto_329060 ?auto_329061 ?auto_329062 ?auto_329063 ?auto_329064 ?auto_329065 ?auto_329066 ?auto_329067 ?auto_329068 ?auto_329069 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329109 - BLOCK
      ?auto_329110 - BLOCK
      ?auto_329111 - BLOCK
      ?auto_329112 - BLOCK
      ?auto_329113 - BLOCK
      ?auto_329114 - BLOCK
      ?auto_329115 - BLOCK
      ?auto_329116 - BLOCK
      ?auto_329117 - BLOCK
      ?auto_329118 - BLOCK
      ?auto_329119 - BLOCK
      ?auto_329120 - BLOCK
      ?auto_329121 - BLOCK
    )
    :vars
    (
      ?auto_329122 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_329120 ) ( ON ?auto_329121 ?auto_329122 ) ( CLEAR ?auto_329121 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_329109 ) ( ON ?auto_329110 ?auto_329109 ) ( ON ?auto_329111 ?auto_329110 ) ( ON ?auto_329112 ?auto_329111 ) ( ON ?auto_329113 ?auto_329112 ) ( ON ?auto_329114 ?auto_329113 ) ( ON ?auto_329115 ?auto_329114 ) ( ON ?auto_329116 ?auto_329115 ) ( ON ?auto_329117 ?auto_329116 ) ( ON ?auto_329118 ?auto_329117 ) ( ON ?auto_329119 ?auto_329118 ) ( ON ?auto_329120 ?auto_329119 ) ( not ( = ?auto_329109 ?auto_329110 ) ) ( not ( = ?auto_329109 ?auto_329111 ) ) ( not ( = ?auto_329109 ?auto_329112 ) ) ( not ( = ?auto_329109 ?auto_329113 ) ) ( not ( = ?auto_329109 ?auto_329114 ) ) ( not ( = ?auto_329109 ?auto_329115 ) ) ( not ( = ?auto_329109 ?auto_329116 ) ) ( not ( = ?auto_329109 ?auto_329117 ) ) ( not ( = ?auto_329109 ?auto_329118 ) ) ( not ( = ?auto_329109 ?auto_329119 ) ) ( not ( = ?auto_329109 ?auto_329120 ) ) ( not ( = ?auto_329109 ?auto_329121 ) ) ( not ( = ?auto_329109 ?auto_329122 ) ) ( not ( = ?auto_329110 ?auto_329111 ) ) ( not ( = ?auto_329110 ?auto_329112 ) ) ( not ( = ?auto_329110 ?auto_329113 ) ) ( not ( = ?auto_329110 ?auto_329114 ) ) ( not ( = ?auto_329110 ?auto_329115 ) ) ( not ( = ?auto_329110 ?auto_329116 ) ) ( not ( = ?auto_329110 ?auto_329117 ) ) ( not ( = ?auto_329110 ?auto_329118 ) ) ( not ( = ?auto_329110 ?auto_329119 ) ) ( not ( = ?auto_329110 ?auto_329120 ) ) ( not ( = ?auto_329110 ?auto_329121 ) ) ( not ( = ?auto_329110 ?auto_329122 ) ) ( not ( = ?auto_329111 ?auto_329112 ) ) ( not ( = ?auto_329111 ?auto_329113 ) ) ( not ( = ?auto_329111 ?auto_329114 ) ) ( not ( = ?auto_329111 ?auto_329115 ) ) ( not ( = ?auto_329111 ?auto_329116 ) ) ( not ( = ?auto_329111 ?auto_329117 ) ) ( not ( = ?auto_329111 ?auto_329118 ) ) ( not ( = ?auto_329111 ?auto_329119 ) ) ( not ( = ?auto_329111 ?auto_329120 ) ) ( not ( = ?auto_329111 ?auto_329121 ) ) ( not ( = ?auto_329111 ?auto_329122 ) ) ( not ( = ?auto_329112 ?auto_329113 ) ) ( not ( = ?auto_329112 ?auto_329114 ) ) ( not ( = ?auto_329112 ?auto_329115 ) ) ( not ( = ?auto_329112 ?auto_329116 ) ) ( not ( = ?auto_329112 ?auto_329117 ) ) ( not ( = ?auto_329112 ?auto_329118 ) ) ( not ( = ?auto_329112 ?auto_329119 ) ) ( not ( = ?auto_329112 ?auto_329120 ) ) ( not ( = ?auto_329112 ?auto_329121 ) ) ( not ( = ?auto_329112 ?auto_329122 ) ) ( not ( = ?auto_329113 ?auto_329114 ) ) ( not ( = ?auto_329113 ?auto_329115 ) ) ( not ( = ?auto_329113 ?auto_329116 ) ) ( not ( = ?auto_329113 ?auto_329117 ) ) ( not ( = ?auto_329113 ?auto_329118 ) ) ( not ( = ?auto_329113 ?auto_329119 ) ) ( not ( = ?auto_329113 ?auto_329120 ) ) ( not ( = ?auto_329113 ?auto_329121 ) ) ( not ( = ?auto_329113 ?auto_329122 ) ) ( not ( = ?auto_329114 ?auto_329115 ) ) ( not ( = ?auto_329114 ?auto_329116 ) ) ( not ( = ?auto_329114 ?auto_329117 ) ) ( not ( = ?auto_329114 ?auto_329118 ) ) ( not ( = ?auto_329114 ?auto_329119 ) ) ( not ( = ?auto_329114 ?auto_329120 ) ) ( not ( = ?auto_329114 ?auto_329121 ) ) ( not ( = ?auto_329114 ?auto_329122 ) ) ( not ( = ?auto_329115 ?auto_329116 ) ) ( not ( = ?auto_329115 ?auto_329117 ) ) ( not ( = ?auto_329115 ?auto_329118 ) ) ( not ( = ?auto_329115 ?auto_329119 ) ) ( not ( = ?auto_329115 ?auto_329120 ) ) ( not ( = ?auto_329115 ?auto_329121 ) ) ( not ( = ?auto_329115 ?auto_329122 ) ) ( not ( = ?auto_329116 ?auto_329117 ) ) ( not ( = ?auto_329116 ?auto_329118 ) ) ( not ( = ?auto_329116 ?auto_329119 ) ) ( not ( = ?auto_329116 ?auto_329120 ) ) ( not ( = ?auto_329116 ?auto_329121 ) ) ( not ( = ?auto_329116 ?auto_329122 ) ) ( not ( = ?auto_329117 ?auto_329118 ) ) ( not ( = ?auto_329117 ?auto_329119 ) ) ( not ( = ?auto_329117 ?auto_329120 ) ) ( not ( = ?auto_329117 ?auto_329121 ) ) ( not ( = ?auto_329117 ?auto_329122 ) ) ( not ( = ?auto_329118 ?auto_329119 ) ) ( not ( = ?auto_329118 ?auto_329120 ) ) ( not ( = ?auto_329118 ?auto_329121 ) ) ( not ( = ?auto_329118 ?auto_329122 ) ) ( not ( = ?auto_329119 ?auto_329120 ) ) ( not ( = ?auto_329119 ?auto_329121 ) ) ( not ( = ?auto_329119 ?auto_329122 ) ) ( not ( = ?auto_329120 ?auto_329121 ) ) ( not ( = ?auto_329120 ?auto_329122 ) ) ( not ( = ?auto_329121 ?auto_329122 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_329121 ?auto_329122 )
      ( !STACK ?auto_329121 ?auto_329120 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329163 - BLOCK
      ?auto_329164 - BLOCK
      ?auto_329165 - BLOCK
      ?auto_329166 - BLOCK
      ?auto_329167 - BLOCK
      ?auto_329168 - BLOCK
      ?auto_329169 - BLOCK
      ?auto_329170 - BLOCK
      ?auto_329171 - BLOCK
      ?auto_329172 - BLOCK
      ?auto_329173 - BLOCK
      ?auto_329174 - BLOCK
      ?auto_329175 - BLOCK
    )
    :vars
    (
      ?auto_329176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329175 ?auto_329176 ) ( ON-TABLE ?auto_329163 ) ( ON ?auto_329164 ?auto_329163 ) ( ON ?auto_329165 ?auto_329164 ) ( ON ?auto_329166 ?auto_329165 ) ( ON ?auto_329167 ?auto_329166 ) ( ON ?auto_329168 ?auto_329167 ) ( ON ?auto_329169 ?auto_329168 ) ( ON ?auto_329170 ?auto_329169 ) ( ON ?auto_329171 ?auto_329170 ) ( ON ?auto_329172 ?auto_329171 ) ( ON ?auto_329173 ?auto_329172 ) ( not ( = ?auto_329163 ?auto_329164 ) ) ( not ( = ?auto_329163 ?auto_329165 ) ) ( not ( = ?auto_329163 ?auto_329166 ) ) ( not ( = ?auto_329163 ?auto_329167 ) ) ( not ( = ?auto_329163 ?auto_329168 ) ) ( not ( = ?auto_329163 ?auto_329169 ) ) ( not ( = ?auto_329163 ?auto_329170 ) ) ( not ( = ?auto_329163 ?auto_329171 ) ) ( not ( = ?auto_329163 ?auto_329172 ) ) ( not ( = ?auto_329163 ?auto_329173 ) ) ( not ( = ?auto_329163 ?auto_329174 ) ) ( not ( = ?auto_329163 ?auto_329175 ) ) ( not ( = ?auto_329163 ?auto_329176 ) ) ( not ( = ?auto_329164 ?auto_329165 ) ) ( not ( = ?auto_329164 ?auto_329166 ) ) ( not ( = ?auto_329164 ?auto_329167 ) ) ( not ( = ?auto_329164 ?auto_329168 ) ) ( not ( = ?auto_329164 ?auto_329169 ) ) ( not ( = ?auto_329164 ?auto_329170 ) ) ( not ( = ?auto_329164 ?auto_329171 ) ) ( not ( = ?auto_329164 ?auto_329172 ) ) ( not ( = ?auto_329164 ?auto_329173 ) ) ( not ( = ?auto_329164 ?auto_329174 ) ) ( not ( = ?auto_329164 ?auto_329175 ) ) ( not ( = ?auto_329164 ?auto_329176 ) ) ( not ( = ?auto_329165 ?auto_329166 ) ) ( not ( = ?auto_329165 ?auto_329167 ) ) ( not ( = ?auto_329165 ?auto_329168 ) ) ( not ( = ?auto_329165 ?auto_329169 ) ) ( not ( = ?auto_329165 ?auto_329170 ) ) ( not ( = ?auto_329165 ?auto_329171 ) ) ( not ( = ?auto_329165 ?auto_329172 ) ) ( not ( = ?auto_329165 ?auto_329173 ) ) ( not ( = ?auto_329165 ?auto_329174 ) ) ( not ( = ?auto_329165 ?auto_329175 ) ) ( not ( = ?auto_329165 ?auto_329176 ) ) ( not ( = ?auto_329166 ?auto_329167 ) ) ( not ( = ?auto_329166 ?auto_329168 ) ) ( not ( = ?auto_329166 ?auto_329169 ) ) ( not ( = ?auto_329166 ?auto_329170 ) ) ( not ( = ?auto_329166 ?auto_329171 ) ) ( not ( = ?auto_329166 ?auto_329172 ) ) ( not ( = ?auto_329166 ?auto_329173 ) ) ( not ( = ?auto_329166 ?auto_329174 ) ) ( not ( = ?auto_329166 ?auto_329175 ) ) ( not ( = ?auto_329166 ?auto_329176 ) ) ( not ( = ?auto_329167 ?auto_329168 ) ) ( not ( = ?auto_329167 ?auto_329169 ) ) ( not ( = ?auto_329167 ?auto_329170 ) ) ( not ( = ?auto_329167 ?auto_329171 ) ) ( not ( = ?auto_329167 ?auto_329172 ) ) ( not ( = ?auto_329167 ?auto_329173 ) ) ( not ( = ?auto_329167 ?auto_329174 ) ) ( not ( = ?auto_329167 ?auto_329175 ) ) ( not ( = ?auto_329167 ?auto_329176 ) ) ( not ( = ?auto_329168 ?auto_329169 ) ) ( not ( = ?auto_329168 ?auto_329170 ) ) ( not ( = ?auto_329168 ?auto_329171 ) ) ( not ( = ?auto_329168 ?auto_329172 ) ) ( not ( = ?auto_329168 ?auto_329173 ) ) ( not ( = ?auto_329168 ?auto_329174 ) ) ( not ( = ?auto_329168 ?auto_329175 ) ) ( not ( = ?auto_329168 ?auto_329176 ) ) ( not ( = ?auto_329169 ?auto_329170 ) ) ( not ( = ?auto_329169 ?auto_329171 ) ) ( not ( = ?auto_329169 ?auto_329172 ) ) ( not ( = ?auto_329169 ?auto_329173 ) ) ( not ( = ?auto_329169 ?auto_329174 ) ) ( not ( = ?auto_329169 ?auto_329175 ) ) ( not ( = ?auto_329169 ?auto_329176 ) ) ( not ( = ?auto_329170 ?auto_329171 ) ) ( not ( = ?auto_329170 ?auto_329172 ) ) ( not ( = ?auto_329170 ?auto_329173 ) ) ( not ( = ?auto_329170 ?auto_329174 ) ) ( not ( = ?auto_329170 ?auto_329175 ) ) ( not ( = ?auto_329170 ?auto_329176 ) ) ( not ( = ?auto_329171 ?auto_329172 ) ) ( not ( = ?auto_329171 ?auto_329173 ) ) ( not ( = ?auto_329171 ?auto_329174 ) ) ( not ( = ?auto_329171 ?auto_329175 ) ) ( not ( = ?auto_329171 ?auto_329176 ) ) ( not ( = ?auto_329172 ?auto_329173 ) ) ( not ( = ?auto_329172 ?auto_329174 ) ) ( not ( = ?auto_329172 ?auto_329175 ) ) ( not ( = ?auto_329172 ?auto_329176 ) ) ( not ( = ?auto_329173 ?auto_329174 ) ) ( not ( = ?auto_329173 ?auto_329175 ) ) ( not ( = ?auto_329173 ?auto_329176 ) ) ( not ( = ?auto_329174 ?auto_329175 ) ) ( not ( = ?auto_329174 ?auto_329176 ) ) ( not ( = ?auto_329175 ?auto_329176 ) ) ( CLEAR ?auto_329173 ) ( ON ?auto_329174 ?auto_329175 ) ( CLEAR ?auto_329174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_329163 ?auto_329164 ?auto_329165 ?auto_329166 ?auto_329167 ?auto_329168 ?auto_329169 ?auto_329170 ?auto_329171 ?auto_329172 ?auto_329173 ?auto_329174 )
      ( MAKE-13PILE ?auto_329163 ?auto_329164 ?auto_329165 ?auto_329166 ?auto_329167 ?auto_329168 ?auto_329169 ?auto_329170 ?auto_329171 ?auto_329172 ?auto_329173 ?auto_329174 ?auto_329175 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329217 - BLOCK
      ?auto_329218 - BLOCK
      ?auto_329219 - BLOCK
      ?auto_329220 - BLOCK
      ?auto_329221 - BLOCK
      ?auto_329222 - BLOCK
      ?auto_329223 - BLOCK
      ?auto_329224 - BLOCK
      ?auto_329225 - BLOCK
      ?auto_329226 - BLOCK
      ?auto_329227 - BLOCK
      ?auto_329228 - BLOCK
      ?auto_329229 - BLOCK
    )
    :vars
    (
      ?auto_329230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329229 ?auto_329230 ) ( ON-TABLE ?auto_329217 ) ( ON ?auto_329218 ?auto_329217 ) ( ON ?auto_329219 ?auto_329218 ) ( ON ?auto_329220 ?auto_329219 ) ( ON ?auto_329221 ?auto_329220 ) ( ON ?auto_329222 ?auto_329221 ) ( ON ?auto_329223 ?auto_329222 ) ( ON ?auto_329224 ?auto_329223 ) ( ON ?auto_329225 ?auto_329224 ) ( ON ?auto_329226 ?auto_329225 ) ( not ( = ?auto_329217 ?auto_329218 ) ) ( not ( = ?auto_329217 ?auto_329219 ) ) ( not ( = ?auto_329217 ?auto_329220 ) ) ( not ( = ?auto_329217 ?auto_329221 ) ) ( not ( = ?auto_329217 ?auto_329222 ) ) ( not ( = ?auto_329217 ?auto_329223 ) ) ( not ( = ?auto_329217 ?auto_329224 ) ) ( not ( = ?auto_329217 ?auto_329225 ) ) ( not ( = ?auto_329217 ?auto_329226 ) ) ( not ( = ?auto_329217 ?auto_329227 ) ) ( not ( = ?auto_329217 ?auto_329228 ) ) ( not ( = ?auto_329217 ?auto_329229 ) ) ( not ( = ?auto_329217 ?auto_329230 ) ) ( not ( = ?auto_329218 ?auto_329219 ) ) ( not ( = ?auto_329218 ?auto_329220 ) ) ( not ( = ?auto_329218 ?auto_329221 ) ) ( not ( = ?auto_329218 ?auto_329222 ) ) ( not ( = ?auto_329218 ?auto_329223 ) ) ( not ( = ?auto_329218 ?auto_329224 ) ) ( not ( = ?auto_329218 ?auto_329225 ) ) ( not ( = ?auto_329218 ?auto_329226 ) ) ( not ( = ?auto_329218 ?auto_329227 ) ) ( not ( = ?auto_329218 ?auto_329228 ) ) ( not ( = ?auto_329218 ?auto_329229 ) ) ( not ( = ?auto_329218 ?auto_329230 ) ) ( not ( = ?auto_329219 ?auto_329220 ) ) ( not ( = ?auto_329219 ?auto_329221 ) ) ( not ( = ?auto_329219 ?auto_329222 ) ) ( not ( = ?auto_329219 ?auto_329223 ) ) ( not ( = ?auto_329219 ?auto_329224 ) ) ( not ( = ?auto_329219 ?auto_329225 ) ) ( not ( = ?auto_329219 ?auto_329226 ) ) ( not ( = ?auto_329219 ?auto_329227 ) ) ( not ( = ?auto_329219 ?auto_329228 ) ) ( not ( = ?auto_329219 ?auto_329229 ) ) ( not ( = ?auto_329219 ?auto_329230 ) ) ( not ( = ?auto_329220 ?auto_329221 ) ) ( not ( = ?auto_329220 ?auto_329222 ) ) ( not ( = ?auto_329220 ?auto_329223 ) ) ( not ( = ?auto_329220 ?auto_329224 ) ) ( not ( = ?auto_329220 ?auto_329225 ) ) ( not ( = ?auto_329220 ?auto_329226 ) ) ( not ( = ?auto_329220 ?auto_329227 ) ) ( not ( = ?auto_329220 ?auto_329228 ) ) ( not ( = ?auto_329220 ?auto_329229 ) ) ( not ( = ?auto_329220 ?auto_329230 ) ) ( not ( = ?auto_329221 ?auto_329222 ) ) ( not ( = ?auto_329221 ?auto_329223 ) ) ( not ( = ?auto_329221 ?auto_329224 ) ) ( not ( = ?auto_329221 ?auto_329225 ) ) ( not ( = ?auto_329221 ?auto_329226 ) ) ( not ( = ?auto_329221 ?auto_329227 ) ) ( not ( = ?auto_329221 ?auto_329228 ) ) ( not ( = ?auto_329221 ?auto_329229 ) ) ( not ( = ?auto_329221 ?auto_329230 ) ) ( not ( = ?auto_329222 ?auto_329223 ) ) ( not ( = ?auto_329222 ?auto_329224 ) ) ( not ( = ?auto_329222 ?auto_329225 ) ) ( not ( = ?auto_329222 ?auto_329226 ) ) ( not ( = ?auto_329222 ?auto_329227 ) ) ( not ( = ?auto_329222 ?auto_329228 ) ) ( not ( = ?auto_329222 ?auto_329229 ) ) ( not ( = ?auto_329222 ?auto_329230 ) ) ( not ( = ?auto_329223 ?auto_329224 ) ) ( not ( = ?auto_329223 ?auto_329225 ) ) ( not ( = ?auto_329223 ?auto_329226 ) ) ( not ( = ?auto_329223 ?auto_329227 ) ) ( not ( = ?auto_329223 ?auto_329228 ) ) ( not ( = ?auto_329223 ?auto_329229 ) ) ( not ( = ?auto_329223 ?auto_329230 ) ) ( not ( = ?auto_329224 ?auto_329225 ) ) ( not ( = ?auto_329224 ?auto_329226 ) ) ( not ( = ?auto_329224 ?auto_329227 ) ) ( not ( = ?auto_329224 ?auto_329228 ) ) ( not ( = ?auto_329224 ?auto_329229 ) ) ( not ( = ?auto_329224 ?auto_329230 ) ) ( not ( = ?auto_329225 ?auto_329226 ) ) ( not ( = ?auto_329225 ?auto_329227 ) ) ( not ( = ?auto_329225 ?auto_329228 ) ) ( not ( = ?auto_329225 ?auto_329229 ) ) ( not ( = ?auto_329225 ?auto_329230 ) ) ( not ( = ?auto_329226 ?auto_329227 ) ) ( not ( = ?auto_329226 ?auto_329228 ) ) ( not ( = ?auto_329226 ?auto_329229 ) ) ( not ( = ?auto_329226 ?auto_329230 ) ) ( not ( = ?auto_329227 ?auto_329228 ) ) ( not ( = ?auto_329227 ?auto_329229 ) ) ( not ( = ?auto_329227 ?auto_329230 ) ) ( not ( = ?auto_329228 ?auto_329229 ) ) ( not ( = ?auto_329228 ?auto_329230 ) ) ( not ( = ?auto_329229 ?auto_329230 ) ) ( ON ?auto_329228 ?auto_329229 ) ( CLEAR ?auto_329226 ) ( ON ?auto_329227 ?auto_329228 ) ( CLEAR ?auto_329227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_329217 ?auto_329218 ?auto_329219 ?auto_329220 ?auto_329221 ?auto_329222 ?auto_329223 ?auto_329224 ?auto_329225 ?auto_329226 ?auto_329227 )
      ( MAKE-13PILE ?auto_329217 ?auto_329218 ?auto_329219 ?auto_329220 ?auto_329221 ?auto_329222 ?auto_329223 ?auto_329224 ?auto_329225 ?auto_329226 ?auto_329227 ?auto_329228 ?auto_329229 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329271 - BLOCK
      ?auto_329272 - BLOCK
      ?auto_329273 - BLOCK
      ?auto_329274 - BLOCK
      ?auto_329275 - BLOCK
      ?auto_329276 - BLOCK
      ?auto_329277 - BLOCK
      ?auto_329278 - BLOCK
      ?auto_329279 - BLOCK
      ?auto_329280 - BLOCK
      ?auto_329281 - BLOCK
      ?auto_329282 - BLOCK
      ?auto_329283 - BLOCK
    )
    :vars
    (
      ?auto_329284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329283 ?auto_329284 ) ( ON-TABLE ?auto_329271 ) ( ON ?auto_329272 ?auto_329271 ) ( ON ?auto_329273 ?auto_329272 ) ( ON ?auto_329274 ?auto_329273 ) ( ON ?auto_329275 ?auto_329274 ) ( ON ?auto_329276 ?auto_329275 ) ( ON ?auto_329277 ?auto_329276 ) ( ON ?auto_329278 ?auto_329277 ) ( ON ?auto_329279 ?auto_329278 ) ( not ( = ?auto_329271 ?auto_329272 ) ) ( not ( = ?auto_329271 ?auto_329273 ) ) ( not ( = ?auto_329271 ?auto_329274 ) ) ( not ( = ?auto_329271 ?auto_329275 ) ) ( not ( = ?auto_329271 ?auto_329276 ) ) ( not ( = ?auto_329271 ?auto_329277 ) ) ( not ( = ?auto_329271 ?auto_329278 ) ) ( not ( = ?auto_329271 ?auto_329279 ) ) ( not ( = ?auto_329271 ?auto_329280 ) ) ( not ( = ?auto_329271 ?auto_329281 ) ) ( not ( = ?auto_329271 ?auto_329282 ) ) ( not ( = ?auto_329271 ?auto_329283 ) ) ( not ( = ?auto_329271 ?auto_329284 ) ) ( not ( = ?auto_329272 ?auto_329273 ) ) ( not ( = ?auto_329272 ?auto_329274 ) ) ( not ( = ?auto_329272 ?auto_329275 ) ) ( not ( = ?auto_329272 ?auto_329276 ) ) ( not ( = ?auto_329272 ?auto_329277 ) ) ( not ( = ?auto_329272 ?auto_329278 ) ) ( not ( = ?auto_329272 ?auto_329279 ) ) ( not ( = ?auto_329272 ?auto_329280 ) ) ( not ( = ?auto_329272 ?auto_329281 ) ) ( not ( = ?auto_329272 ?auto_329282 ) ) ( not ( = ?auto_329272 ?auto_329283 ) ) ( not ( = ?auto_329272 ?auto_329284 ) ) ( not ( = ?auto_329273 ?auto_329274 ) ) ( not ( = ?auto_329273 ?auto_329275 ) ) ( not ( = ?auto_329273 ?auto_329276 ) ) ( not ( = ?auto_329273 ?auto_329277 ) ) ( not ( = ?auto_329273 ?auto_329278 ) ) ( not ( = ?auto_329273 ?auto_329279 ) ) ( not ( = ?auto_329273 ?auto_329280 ) ) ( not ( = ?auto_329273 ?auto_329281 ) ) ( not ( = ?auto_329273 ?auto_329282 ) ) ( not ( = ?auto_329273 ?auto_329283 ) ) ( not ( = ?auto_329273 ?auto_329284 ) ) ( not ( = ?auto_329274 ?auto_329275 ) ) ( not ( = ?auto_329274 ?auto_329276 ) ) ( not ( = ?auto_329274 ?auto_329277 ) ) ( not ( = ?auto_329274 ?auto_329278 ) ) ( not ( = ?auto_329274 ?auto_329279 ) ) ( not ( = ?auto_329274 ?auto_329280 ) ) ( not ( = ?auto_329274 ?auto_329281 ) ) ( not ( = ?auto_329274 ?auto_329282 ) ) ( not ( = ?auto_329274 ?auto_329283 ) ) ( not ( = ?auto_329274 ?auto_329284 ) ) ( not ( = ?auto_329275 ?auto_329276 ) ) ( not ( = ?auto_329275 ?auto_329277 ) ) ( not ( = ?auto_329275 ?auto_329278 ) ) ( not ( = ?auto_329275 ?auto_329279 ) ) ( not ( = ?auto_329275 ?auto_329280 ) ) ( not ( = ?auto_329275 ?auto_329281 ) ) ( not ( = ?auto_329275 ?auto_329282 ) ) ( not ( = ?auto_329275 ?auto_329283 ) ) ( not ( = ?auto_329275 ?auto_329284 ) ) ( not ( = ?auto_329276 ?auto_329277 ) ) ( not ( = ?auto_329276 ?auto_329278 ) ) ( not ( = ?auto_329276 ?auto_329279 ) ) ( not ( = ?auto_329276 ?auto_329280 ) ) ( not ( = ?auto_329276 ?auto_329281 ) ) ( not ( = ?auto_329276 ?auto_329282 ) ) ( not ( = ?auto_329276 ?auto_329283 ) ) ( not ( = ?auto_329276 ?auto_329284 ) ) ( not ( = ?auto_329277 ?auto_329278 ) ) ( not ( = ?auto_329277 ?auto_329279 ) ) ( not ( = ?auto_329277 ?auto_329280 ) ) ( not ( = ?auto_329277 ?auto_329281 ) ) ( not ( = ?auto_329277 ?auto_329282 ) ) ( not ( = ?auto_329277 ?auto_329283 ) ) ( not ( = ?auto_329277 ?auto_329284 ) ) ( not ( = ?auto_329278 ?auto_329279 ) ) ( not ( = ?auto_329278 ?auto_329280 ) ) ( not ( = ?auto_329278 ?auto_329281 ) ) ( not ( = ?auto_329278 ?auto_329282 ) ) ( not ( = ?auto_329278 ?auto_329283 ) ) ( not ( = ?auto_329278 ?auto_329284 ) ) ( not ( = ?auto_329279 ?auto_329280 ) ) ( not ( = ?auto_329279 ?auto_329281 ) ) ( not ( = ?auto_329279 ?auto_329282 ) ) ( not ( = ?auto_329279 ?auto_329283 ) ) ( not ( = ?auto_329279 ?auto_329284 ) ) ( not ( = ?auto_329280 ?auto_329281 ) ) ( not ( = ?auto_329280 ?auto_329282 ) ) ( not ( = ?auto_329280 ?auto_329283 ) ) ( not ( = ?auto_329280 ?auto_329284 ) ) ( not ( = ?auto_329281 ?auto_329282 ) ) ( not ( = ?auto_329281 ?auto_329283 ) ) ( not ( = ?auto_329281 ?auto_329284 ) ) ( not ( = ?auto_329282 ?auto_329283 ) ) ( not ( = ?auto_329282 ?auto_329284 ) ) ( not ( = ?auto_329283 ?auto_329284 ) ) ( ON ?auto_329282 ?auto_329283 ) ( ON ?auto_329281 ?auto_329282 ) ( CLEAR ?auto_329279 ) ( ON ?auto_329280 ?auto_329281 ) ( CLEAR ?auto_329280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_329271 ?auto_329272 ?auto_329273 ?auto_329274 ?auto_329275 ?auto_329276 ?auto_329277 ?auto_329278 ?auto_329279 ?auto_329280 )
      ( MAKE-13PILE ?auto_329271 ?auto_329272 ?auto_329273 ?auto_329274 ?auto_329275 ?auto_329276 ?auto_329277 ?auto_329278 ?auto_329279 ?auto_329280 ?auto_329281 ?auto_329282 ?auto_329283 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329325 - BLOCK
      ?auto_329326 - BLOCK
      ?auto_329327 - BLOCK
      ?auto_329328 - BLOCK
      ?auto_329329 - BLOCK
      ?auto_329330 - BLOCK
      ?auto_329331 - BLOCK
      ?auto_329332 - BLOCK
      ?auto_329333 - BLOCK
      ?auto_329334 - BLOCK
      ?auto_329335 - BLOCK
      ?auto_329336 - BLOCK
      ?auto_329337 - BLOCK
    )
    :vars
    (
      ?auto_329338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329337 ?auto_329338 ) ( ON-TABLE ?auto_329325 ) ( ON ?auto_329326 ?auto_329325 ) ( ON ?auto_329327 ?auto_329326 ) ( ON ?auto_329328 ?auto_329327 ) ( ON ?auto_329329 ?auto_329328 ) ( ON ?auto_329330 ?auto_329329 ) ( ON ?auto_329331 ?auto_329330 ) ( ON ?auto_329332 ?auto_329331 ) ( not ( = ?auto_329325 ?auto_329326 ) ) ( not ( = ?auto_329325 ?auto_329327 ) ) ( not ( = ?auto_329325 ?auto_329328 ) ) ( not ( = ?auto_329325 ?auto_329329 ) ) ( not ( = ?auto_329325 ?auto_329330 ) ) ( not ( = ?auto_329325 ?auto_329331 ) ) ( not ( = ?auto_329325 ?auto_329332 ) ) ( not ( = ?auto_329325 ?auto_329333 ) ) ( not ( = ?auto_329325 ?auto_329334 ) ) ( not ( = ?auto_329325 ?auto_329335 ) ) ( not ( = ?auto_329325 ?auto_329336 ) ) ( not ( = ?auto_329325 ?auto_329337 ) ) ( not ( = ?auto_329325 ?auto_329338 ) ) ( not ( = ?auto_329326 ?auto_329327 ) ) ( not ( = ?auto_329326 ?auto_329328 ) ) ( not ( = ?auto_329326 ?auto_329329 ) ) ( not ( = ?auto_329326 ?auto_329330 ) ) ( not ( = ?auto_329326 ?auto_329331 ) ) ( not ( = ?auto_329326 ?auto_329332 ) ) ( not ( = ?auto_329326 ?auto_329333 ) ) ( not ( = ?auto_329326 ?auto_329334 ) ) ( not ( = ?auto_329326 ?auto_329335 ) ) ( not ( = ?auto_329326 ?auto_329336 ) ) ( not ( = ?auto_329326 ?auto_329337 ) ) ( not ( = ?auto_329326 ?auto_329338 ) ) ( not ( = ?auto_329327 ?auto_329328 ) ) ( not ( = ?auto_329327 ?auto_329329 ) ) ( not ( = ?auto_329327 ?auto_329330 ) ) ( not ( = ?auto_329327 ?auto_329331 ) ) ( not ( = ?auto_329327 ?auto_329332 ) ) ( not ( = ?auto_329327 ?auto_329333 ) ) ( not ( = ?auto_329327 ?auto_329334 ) ) ( not ( = ?auto_329327 ?auto_329335 ) ) ( not ( = ?auto_329327 ?auto_329336 ) ) ( not ( = ?auto_329327 ?auto_329337 ) ) ( not ( = ?auto_329327 ?auto_329338 ) ) ( not ( = ?auto_329328 ?auto_329329 ) ) ( not ( = ?auto_329328 ?auto_329330 ) ) ( not ( = ?auto_329328 ?auto_329331 ) ) ( not ( = ?auto_329328 ?auto_329332 ) ) ( not ( = ?auto_329328 ?auto_329333 ) ) ( not ( = ?auto_329328 ?auto_329334 ) ) ( not ( = ?auto_329328 ?auto_329335 ) ) ( not ( = ?auto_329328 ?auto_329336 ) ) ( not ( = ?auto_329328 ?auto_329337 ) ) ( not ( = ?auto_329328 ?auto_329338 ) ) ( not ( = ?auto_329329 ?auto_329330 ) ) ( not ( = ?auto_329329 ?auto_329331 ) ) ( not ( = ?auto_329329 ?auto_329332 ) ) ( not ( = ?auto_329329 ?auto_329333 ) ) ( not ( = ?auto_329329 ?auto_329334 ) ) ( not ( = ?auto_329329 ?auto_329335 ) ) ( not ( = ?auto_329329 ?auto_329336 ) ) ( not ( = ?auto_329329 ?auto_329337 ) ) ( not ( = ?auto_329329 ?auto_329338 ) ) ( not ( = ?auto_329330 ?auto_329331 ) ) ( not ( = ?auto_329330 ?auto_329332 ) ) ( not ( = ?auto_329330 ?auto_329333 ) ) ( not ( = ?auto_329330 ?auto_329334 ) ) ( not ( = ?auto_329330 ?auto_329335 ) ) ( not ( = ?auto_329330 ?auto_329336 ) ) ( not ( = ?auto_329330 ?auto_329337 ) ) ( not ( = ?auto_329330 ?auto_329338 ) ) ( not ( = ?auto_329331 ?auto_329332 ) ) ( not ( = ?auto_329331 ?auto_329333 ) ) ( not ( = ?auto_329331 ?auto_329334 ) ) ( not ( = ?auto_329331 ?auto_329335 ) ) ( not ( = ?auto_329331 ?auto_329336 ) ) ( not ( = ?auto_329331 ?auto_329337 ) ) ( not ( = ?auto_329331 ?auto_329338 ) ) ( not ( = ?auto_329332 ?auto_329333 ) ) ( not ( = ?auto_329332 ?auto_329334 ) ) ( not ( = ?auto_329332 ?auto_329335 ) ) ( not ( = ?auto_329332 ?auto_329336 ) ) ( not ( = ?auto_329332 ?auto_329337 ) ) ( not ( = ?auto_329332 ?auto_329338 ) ) ( not ( = ?auto_329333 ?auto_329334 ) ) ( not ( = ?auto_329333 ?auto_329335 ) ) ( not ( = ?auto_329333 ?auto_329336 ) ) ( not ( = ?auto_329333 ?auto_329337 ) ) ( not ( = ?auto_329333 ?auto_329338 ) ) ( not ( = ?auto_329334 ?auto_329335 ) ) ( not ( = ?auto_329334 ?auto_329336 ) ) ( not ( = ?auto_329334 ?auto_329337 ) ) ( not ( = ?auto_329334 ?auto_329338 ) ) ( not ( = ?auto_329335 ?auto_329336 ) ) ( not ( = ?auto_329335 ?auto_329337 ) ) ( not ( = ?auto_329335 ?auto_329338 ) ) ( not ( = ?auto_329336 ?auto_329337 ) ) ( not ( = ?auto_329336 ?auto_329338 ) ) ( not ( = ?auto_329337 ?auto_329338 ) ) ( ON ?auto_329336 ?auto_329337 ) ( ON ?auto_329335 ?auto_329336 ) ( ON ?auto_329334 ?auto_329335 ) ( CLEAR ?auto_329332 ) ( ON ?auto_329333 ?auto_329334 ) ( CLEAR ?auto_329333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_329325 ?auto_329326 ?auto_329327 ?auto_329328 ?auto_329329 ?auto_329330 ?auto_329331 ?auto_329332 ?auto_329333 )
      ( MAKE-13PILE ?auto_329325 ?auto_329326 ?auto_329327 ?auto_329328 ?auto_329329 ?auto_329330 ?auto_329331 ?auto_329332 ?auto_329333 ?auto_329334 ?auto_329335 ?auto_329336 ?auto_329337 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329379 - BLOCK
      ?auto_329380 - BLOCK
      ?auto_329381 - BLOCK
      ?auto_329382 - BLOCK
      ?auto_329383 - BLOCK
      ?auto_329384 - BLOCK
      ?auto_329385 - BLOCK
      ?auto_329386 - BLOCK
      ?auto_329387 - BLOCK
      ?auto_329388 - BLOCK
      ?auto_329389 - BLOCK
      ?auto_329390 - BLOCK
      ?auto_329391 - BLOCK
    )
    :vars
    (
      ?auto_329392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329391 ?auto_329392 ) ( ON-TABLE ?auto_329379 ) ( ON ?auto_329380 ?auto_329379 ) ( ON ?auto_329381 ?auto_329380 ) ( ON ?auto_329382 ?auto_329381 ) ( ON ?auto_329383 ?auto_329382 ) ( ON ?auto_329384 ?auto_329383 ) ( ON ?auto_329385 ?auto_329384 ) ( not ( = ?auto_329379 ?auto_329380 ) ) ( not ( = ?auto_329379 ?auto_329381 ) ) ( not ( = ?auto_329379 ?auto_329382 ) ) ( not ( = ?auto_329379 ?auto_329383 ) ) ( not ( = ?auto_329379 ?auto_329384 ) ) ( not ( = ?auto_329379 ?auto_329385 ) ) ( not ( = ?auto_329379 ?auto_329386 ) ) ( not ( = ?auto_329379 ?auto_329387 ) ) ( not ( = ?auto_329379 ?auto_329388 ) ) ( not ( = ?auto_329379 ?auto_329389 ) ) ( not ( = ?auto_329379 ?auto_329390 ) ) ( not ( = ?auto_329379 ?auto_329391 ) ) ( not ( = ?auto_329379 ?auto_329392 ) ) ( not ( = ?auto_329380 ?auto_329381 ) ) ( not ( = ?auto_329380 ?auto_329382 ) ) ( not ( = ?auto_329380 ?auto_329383 ) ) ( not ( = ?auto_329380 ?auto_329384 ) ) ( not ( = ?auto_329380 ?auto_329385 ) ) ( not ( = ?auto_329380 ?auto_329386 ) ) ( not ( = ?auto_329380 ?auto_329387 ) ) ( not ( = ?auto_329380 ?auto_329388 ) ) ( not ( = ?auto_329380 ?auto_329389 ) ) ( not ( = ?auto_329380 ?auto_329390 ) ) ( not ( = ?auto_329380 ?auto_329391 ) ) ( not ( = ?auto_329380 ?auto_329392 ) ) ( not ( = ?auto_329381 ?auto_329382 ) ) ( not ( = ?auto_329381 ?auto_329383 ) ) ( not ( = ?auto_329381 ?auto_329384 ) ) ( not ( = ?auto_329381 ?auto_329385 ) ) ( not ( = ?auto_329381 ?auto_329386 ) ) ( not ( = ?auto_329381 ?auto_329387 ) ) ( not ( = ?auto_329381 ?auto_329388 ) ) ( not ( = ?auto_329381 ?auto_329389 ) ) ( not ( = ?auto_329381 ?auto_329390 ) ) ( not ( = ?auto_329381 ?auto_329391 ) ) ( not ( = ?auto_329381 ?auto_329392 ) ) ( not ( = ?auto_329382 ?auto_329383 ) ) ( not ( = ?auto_329382 ?auto_329384 ) ) ( not ( = ?auto_329382 ?auto_329385 ) ) ( not ( = ?auto_329382 ?auto_329386 ) ) ( not ( = ?auto_329382 ?auto_329387 ) ) ( not ( = ?auto_329382 ?auto_329388 ) ) ( not ( = ?auto_329382 ?auto_329389 ) ) ( not ( = ?auto_329382 ?auto_329390 ) ) ( not ( = ?auto_329382 ?auto_329391 ) ) ( not ( = ?auto_329382 ?auto_329392 ) ) ( not ( = ?auto_329383 ?auto_329384 ) ) ( not ( = ?auto_329383 ?auto_329385 ) ) ( not ( = ?auto_329383 ?auto_329386 ) ) ( not ( = ?auto_329383 ?auto_329387 ) ) ( not ( = ?auto_329383 ?auto_329388 ) ) ( not ( = ?auto_329383 ?auto_329389 ) ) ( not ( = ?auto_329383 ?auto_329390 ) ) ( not ( = ?auto_329383 ?auto_329391 ) ) ( not ( = ?auto_329383 ?auto_329392 ) ) ( not ( = ?auto_329384 ?auto_329385 ) ) ( not ( = ?auto_329384 ?auto_329386 ) ) ( not ( = ?auto_329384 ?auto_329387 ) ) ( not ( = ?auto_329384 ?auto_329388 ) ) ( not ( = ?auto_329384 ?auto_329389 ) ) ( not ( = ?auto_329384 ?auto_329390 ) ) ( not ( = ?auto_329384 ?auto_329391 ) ) ( not ( = ?auto_329384 ?auto_329392 ) ) ( not ( = ?auto_329385 ?auto_329386 ) ) ( not ( = ?auto_329385 ?auto_329387 ) ) ( not ( = ?auto_329385 ?auto_329388 ) ) ( not ( = ?auto_329385 ?auto_329389 ) ) ( not ( = ?auto_329385 ?auto_329390 ) ) ( not ( = ?auto_329385 ?auto_329391 ) ) ( not ( = ?auto_329385 ?auto_329392 ) ) ( not ( = ?auto_329386 ?auto_329387 ) ) ( not ( = ?auto_329386 ?auto_329388 ) ) ( not ( = ?auto_329386 ?auto_329389 ) ) ( not ( = ?auto_329386 ?auto_329390 ) ) ( not ( = ?auto_329386 ?auto_329391 ) ) ( not ( = ?auto_329386 ?auto_329392 ) ) ( not ( = ?auto_329387 ?auto_329388 ) ) ( not ( = ?auto_329387 ?auto_329389 ) ) ( not ( = ?auto_329387 ?auto_329390 ) ) ( not ( = ?auto_329387 ?auto_329391 ) ) ( not ( = ?auto_329387 ?auto_329392 ) ) ( not ( = ?auto_329388 ?auto_329389 ) ) ( not ( = ?auto_329388 ?auto_329390 ) ) ( not ( = ?auto_329388 ?auto_329391 ) ) ( not ( = ?auto_329388 ?auto_329392 ) ) ( not ( = ?auto_329389 ?auto_329390 ) ) ( not ( = ?auto_329389 ?auto_329391 ) ) ( not ( = ?auto_329389 ?auto_329392 ) ) ( not ( = ?auto_329390 ?auto_329391 ) ) ( not ( = ?auto_329390 ?auto_329392 ) ) ( not ( = ?auto_329391 ?auto_329392 ) ) ( ON ?auto_329390 ?auto_329391 ) ( ON ?auto_329389 ?auto_329390 ) ( ON ?auto_329388 ?auto_329389 ) ( ON ?auto_329387 ?auto_329388 ) ( CLEAR ?auto_329385 ) ( ON ?auto_329386 ?auto_329387 ) ( CLEAR ?auto_329386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_329379 ?auto_329380 ?auto_329381 ?auto_329382 ?auto_329383 ?auto_329384 ?auto_329385 ?auto_329386 )
      ( MAKE-13PILE ?auto_329379 ?auto_329380 ?auto_329381 ?auto_329382 ?auto_329383 ?auto_329384 ?auto_329385 ?auto_329386 ?auto_329387 ?auto_329388 ?auto_329389 ?auto_329390 ?auto_329391 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329433 - BLOCK
      ?auto_329434 - BLOCK
      ?auto_329435 - BLOCK
      ?auto_329436 - BLOCK
      ?auto_329437 - BLOCK
      ?auto_329438 - BLOCK
      ?auto_329439 - BLOCK
      ?auto_329440 - BLOCK
      ?auto_329441 - BLOCK
      ?auto_329442 - BLOCK
      ?auto_329443 - BLOCK
      ?auto_329444 - BLOCK
      ?auto_329445 - BLOCK
    )
    :vars
    (
      ?auto_329446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329445 ?auto_329446 ) ( ON-TABLE ?auto_329433 ) ( ON ?auto_329434 ?auto_329433 ) ( ON ?auto_329435 ?auto_329434 ) ( ON ?auto_329436 ?auto_329435 ) ( ON ?auto_329437 ?auto_329436 ) ( ON ?auto_329438 ?auto_329437 ) ( not ( = ?auto_329433 ?auto_329434 ) ) ( not ( = ?auto_329433 ?auto_329435 ) ) ( not ( = ?auto_329433 ?auto_329436 ) ) ( not ( = ?auto_329433 ?auto_329437 ) ) ( not ( = ?auto_329433 ?auto_329438 ) ) ( not ( = ?auto_329433 ?auto_329439 ) ) ( not ( = ?auto_329433 ?auto_329440 ) ) ( not ( = ?auto_329433 ?auto_329441 ) ) ( not ( = ?auto_329433 ?auto_329442 ) ) ( not ( = ?auto_329433 ?auto_329443 ) ) ( not ( = ?auto_329433 ?auto_329444 ) ) ( not ( = ?auto_329433 ?auto_329445 ) ) ( not ( = ?auto_329433 ?auto_329446 ) ) ( not ( = ?auto_329434 ?auto_329435 ) ) ( not ( = ?auto_329434 ?auto_329436 ) ) ( not ( = ?auto_329434 ?auto_329437 ) ) ( not ( = ?auto_329434 ?auto_329438 ) ) ( not ( = ?auto_329434 ?auto_329439 ) ) ( not ( = ?auto_329434 ?auto_329440 ) ) ( not ( = ?auto_329434 ?auto_329441 ) ) ( not ( = ?auto_329434 ?auto_329442 ) ) ( not ( = ?auto_329434 ?auto_329443 ) ) ( not ( = ?auto_329434 ?auto_329444 ) ) ( not ( = ?auto_329434 ?auto_329445 ) ) ( not ( = ?auto_329434 ?auto_329446 ) ) ( not ( = ?auto_329435 ?auto_329436 ) ) ( not ( = ?auto_329435 ?auto_329437 ) ) ( not ( = ?auto_329435 ?auto_329438 ) ) ( not ( = ?auto_329435 ?auto_329439 ) ) ( not ( = ?auto_329435 ?auto_329440 ) ) ( not ( = ?auto_329435 ?auto_329441 ) ) ( not ( = ?auto_329435 ?auto_329442 ) ) ( not ( = ?auto_329435 ?auto_329443 ) ) ( not ( = ?auto_329435 ?auto_329444 ) ) ( not ( = ?auto_329435 ?auto_329445 ) ) ( not ( = ?auto_329435 ?auto_329446 ) ) ( not ( = ?auto_329436 ?auto_329437 ) ) ( not ( = ?auto_329436 ?auto_329438 ) ) ( not ( = ?auto_329436 ?auto_329439 ) ) ( not ( = ?auto_329436 ?auto_329440 ) ) ( not ( = ?auto_329436 ?auto_329441 ) ) ( not ( = ?auto_329436 ?auto_329442 ) ) ( not ( = ?auto_329436 ?auto_329443 ) ) ( not ( = ?auto_329436 ?auto_329444 ) ) ( not ( = ?auto_329436 ?auto_329445 ) ) ( not ( = ?auto_329436 ?auto_329446 ) ) ( not ( = ?auto_329437 ?auto_329438 ) ) ( not ( = ?auto_329437 ?auto_329439 ) ) ( not ( = ?auto_329437 ?auto_329440 ) ) ( not ( = ?auto_329437 ?auto_329441 ) ) ( not ( = ?auto_329437 ?auto_329442 ) ) ( not ( = ?auto_329437 ?auto_329443 ) ) ( not ( = ?auto_329437 ?auto_329444 ) ) ( not ( = ?auto_329437 ?auto_329445 ) ) ( not ( = ?auto_329437 ?auto_329446 ) ) ( not ( = ?auto_329438 ?auto_329439 ) ) ( not ( = ?auto_329438 ?auto_329440 ) ) ( not ( = ?auto_329438 ?auto_329441 ) ) ( not ( = ?auto_329438 ?auto_329442 ) ) ( not ( = ?auto_329438 ?auto_329443 ) ) ( not ( = ?auto_329438 ?auto_329444 ) ) ( not ( = ?auto_329438 ?auto_329445 ) ) ( not ( = ?auto_329438 ?auto_329446 ) ) ( not ( = ?auto_329439 ?auto_329440 ) ) ( not ( = ?auto_329439 ?auto_329441 ) ) ( not ( = ?auto_329439 ?auto_329442 ) ) ( not ( = ?auto_329439 ?auto_329443 ) ) ( not ( = ?auto_329439 ?auto_329444 ) ) ( not ( = ?auto_329439 ?auto_329445 ) ) ( not ( = ?auto_329439 ?auto_329446 ) ) ( not ( = ?auto_329440 ?auto_329441 ) ) ( not ( = ?auto_329440 ?auto_329442 ) ) ( not ( = ?auto_329440 ?auto_329443 ) ) ( not ( = ?auto_329440 ?auto_329444 ) ) ( not ( = ?auto_329440 ?auto_329445 ) ) ( not ( = ?auto_329440 ?auto_329446 ) ) ( not ( = ?auto_329441 ?auto_329442 ) ) ( not ( = ?auto_329441 ?auto_329443 ) ) ( not ( = ?auto_329441 ?auto_329444 ) ) ( not ( = ?auto_329441 ?auto_329445 ) ) ( not ( = ?auto_329441 ?auto_329446 ) ) ( not ( = ?auto_329442 ?auto_329443 ) ) ( not ( = ?auto_329442 ?auto_329444 ) ) ( not ( = ?auto_329442 ?auto_329445 ) ) ( not ( = ?auto_329442 ?auto_329446 ) ) ( not ( = ?auto_329443 ?auto_329444 ) ) ( not ( = ?auto_329443 ?auto_329445 ) ) ( not ( = ?auto_329443 ?auto_329446 ) ) ( not ( = ?auto_329444 ?auto_329445 ) ) ( not ( = ?auto_329444 ?auto_329446 ) ) ( not ( = ?auto_329445 ?auto_329446 ) ) ( ON ?auto_329444 ?auto_329445 ) ( ON ?auto_329443 ?auto_329444 ) ( ON ?auto_329442 ?auto_329443 ) ( ON ?auto_329441 ?auto_329442 ) ( ON ?auto_329440 ?auto_329441 ) ( CLEAR ?auto_329438 ) ( ON ?auto_329439 ?auto_329440 ) ( CLEAR ?auto_329439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_329433 ?auto_329434 ?auto_329435 ?auto_329436 ?auto_329437 ?auto_329438 ?auto_329439 )
      ( MAKE-13PILE ?auto_329433 ?auto_329434 ?auto_329435 ?auto_329436 ?auto_329437 ?auto_329438 ?auto_329439 ?auto_329440 ?auto_329441 ?auto_329442 ?auto_329443 ?auto_329444 ?auto_329445 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329487 - BLOCK
      ?auto_329488 - BLOCK
      ?auto_329489 - BLOCK
      ?auto_329490 - BLOCK
      ?auto_329491 - BLOCK
      ?auto_329492 - BLOCK
      ?auto_329493 - BLOCK
      ?auto_329494 - BLOCK
      ?auto_329495 - BLOCK
      ?auto_329496 - BLOCK
      ?auto_329497 - BLOCK
      ?auto_329498 - BLOCK
      ?auto_329499 - BLOCK
    )
    :vars
    (
      ?auto_329500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329499 ?auto_329500 ) ( ON-TABLE ?auto_329487 ) ( ON ?auto_329488 ?auto_329487 ) ( ON ?auto_329489 ?auto_329488 ) ( ON ?auto_329490 ?auto_329489 ) ( ON ?auto_329491 ?auto_329490 ) ( not ( = ?auto_329487 ?auto_329488 ) ) ( not ( = ?auto_329487 ?auto_329489 ) ) ( not ( = ?auto_329487 ?auto_329490 ) ) ( not ( = ?auto_329487 ?auto_329491 ) ) ( not ( = ?auto_329487 ?auto_329492 ) ) ( not ( = ?auto_329487 ?auto_329493 ) ) ( not ( = ?auto_329487 ?auto_329494 ) ) ( not ( = ?auto_329487 ?auto_329495 ) ) ( not ( = ?auto_329487 ?auto_329496 ) ) ( not ( = ?auto_329487 ?auto_329497 ) ) ( not ( = ?auto_329487 ?auto_329498 ) ) ( not ( = ?auto_329487 ?auto_329499 ) ) ( not ( = ?auto_329487 ?auto_329500 ) ) ( not ( = ?auto_329488 ?auto_329489 ) ) ( not ( = ?auto_329488 ?auto_329490 ) ) ( not ( = ?auto_329488 ?auto_329491 ) ) ( not ( = ?auto_329488 ?auto_329492 ) ) ( not ( = ?auto_329488 ?auto_329493 ) ) ( not ( = ?auto_329488 ?auto_329494 ) ) ( not ( = ?auto_329488 ?auto_329495 ) ) ( not ( = ?auto_329488 ?auto_329496 ) ) ( not ( = ?auto_329488 ?auto_329497 ) ) ( not ( = ?auto_329488 ?auto_329498 ) ) ( not ( = ?auto_329488 ?auto_329499 ) ) ( not ( = ?auto_329488 ?auto_329500 ) ) ( not ( = ?auto_329489 ?auto_329490 ) ) ( not ( = ?auto_329489 ?auto_329491 ) ) ( not ( = ?auto_329489 ?auto_329492 ) ) ( not ( = ?auto_329489 ?auto_329493 ) ) ( not ( = ?auto_329489 ?auto_329494 ) ) ( not ( = ?auto_329489 ?auto_329495 ) ) ( not ( = ?auto_329489 ?auto_329496 ) ) ( not ( = ?auto_329489 ?auto_329497 ) ) ( not ( = ?auto_329489 ?auto_329498 ) ) ( not ( = ?auto_329489 ?auto_329499 ) ) ( not ( = ?auto_329489 ?auto_329500 ) ) ( not ( = ?auto_329490 ?auto_329491 ) ) ( not ( = ?auto_329490 ?auto_329492 ) ) ( not ( = ?auto_329490 ?auto_329493 ) ) ( not ( = ?auto_329490 ?auto_329494 ) ) ( not ( = ?auto_329490 ?auto_329495 ) ) ( not ( = ?auto_329490 ?auto_329496 ) ) ( not ( = ?auto_329490 ?auto_329497 ) ) ( not ( = ?auto_329490 ?auto_329498 ) ) ( not ( = ?auto_329490 ?auto_329499 ) ) ( not ( = ?auto_329490 ?auto_329500 ) ) ( not ( = ?auto_329491 ?auto_329492 ) ) ( not ( = ?auto_329491 ?auto_329493 ) ) ( not ( = ?auto_329491 ?auto_329494 ) ) ( not ( = ?auto_329491 ?auto_329495 ) ) ( not ( = ?auto_329491 ?auto_329496 ) ) ( not ( = ?auto_329491 ?auto_329497 ) ) ( not ( = ?auto_329491 ?auto_329498 ) ) ( not ( = ?auto_329491 ?auto_329499 ) ) ( not ( = ?auto_329491 ?auto_329500 ) ) ( not ( = ?auto_329492 ?auto_329493 ) ) ( not ( = ?auto_329492 ?auto_329494 ) ) ( not ( = ?auto_329492 ?auto_329495 ) ) ( not ( = ?auto_329492 ?auto_329496 ) ) ( not ( = ?auto_329492 ?auto_329497 ) ) ( not ( = ?auto_329492 ?auto_329498 ) ) ( not ( = ?auto_329492 ?auto_329499 ) ) ( not ( = ?auto_329492 ?auto_329500 ) ) ( not ( = ?auto_329493 ?auto_329494 ) ) ( not ( = ?auto_329493 ?auto_329495 ) ) ( not ( = ?auto_329493 ?auto_329496 ) ) ( not ( = ?auto_329493 ?auto_329497 ) ) ( not ( = ?auto_329493 ?auto_329498 ) ) ( not ( = ?auto_329493 ?auto_329499 ) ) ( not ( = ?auto_329493 ?auto_329500 ) ) ( not ( = ?auto_329494 ?auto_329495 ) ) ( not ( = ?auto_329494 ?auto_329496 ) ) ( not ( = ?auto_329494 ?auto_329497 ) ) ( not ( = ?auto_329494 ?auto_329498 ) ) ( not ( = ?auto_329494 ?auto_329499 ) ) ( not ( = ?auto_329494 ?auto_329500 ) ) ( not ( = ?auto_329495 ?auto_329496 ) ) ( not ( = ?auto_329495 ?auto_329497 ) ) ( not ( = ?auto_329495 ?auto_329498 ) ) ( not ( = ?auto_329495 ?auto_329499 ) ) ( not ( = ?auto_329495 ?auto_329500 ) ) ( not ( = ?auto_329496 ?auto_329497 ) ) ( not ( = ?auto_329496 ?auto_329498 ) ) ( not ( = ?auto_329496 ?auto_329499 ) ) ( not ( = ?auto_329496 ?auto_329500 ) ) ( not ( = ?auto_329497 ?auto_329498 ) ) ( not ( = ?auto_329497 ?auto_329499 ) ) ( not ( = ?auto_329497 ?auto_329500 ) ) ( not ( = ?auto_329498 ?auto_329499 ) ) ( not ( = ?auto_329498 ?auto_329500 ) ) ( not ( = ?auto_329499 ?auto_329500 ) ) ( ON ?auto_329498 ?auto_329499 ) ( ON ?auto_329497 ?auto_329498 ) ( ON ?auto_329496 ?auto_329497 ) ( ON ?auto_329495 ?auto_329496 ) ( ON ?auto_329494 ?auto_329495 ) ( ON ?auto_329493 ?auto_329494 ) ( CLEAR ?auto_329491 ) ( ON ?auto_329492 ?auto_329493 ) ( CLEAR ?auto_329492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_329487 ?auto_329488 ?auto_329489 ?auto_329490 ?auto_329491 ?auto_329492 )
      ( MAKE-13PILE ?auto_329487 ?auto_329488 ?auto_329489 ?auto_329490 ?auto_329491 ?auto_329492 ?auto_329493 ?auto_329494 ?auto_329495 ?auto_329496 ?auto_329497 ?auto_329498 ?auto_329499 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329541 - BLOCK
      ?auto_329542 - BLOCK
      ?auto_329543 - BLOCK
      ?auto_329544 - BLOCK
      ?auto_329545 - BLOCK
      ?auto_329546 - BLOCK
      ?auto_329547 - BLOCK
      ?auto_329548 - BLOCK
      ?auto_329549 - BLOCK
      ?auto_329550 - BLOCK
      ?auto_329551 - BLOCK
      ?auto_329552 - BLOCK
      ?auto_329553 - BLOCK
    )
    :vars
    (
      ?auto_329554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329553 ?auto_329554 ) ( ON-TABLE ?auto_329541 ) ( ON ?auto_329542 ?auto_329541 ) ( ON ?auto_329543 ?auto_329542 ) ( ON ?auto_329544 ?auto_329543 ) ( not ( = ?auto_329541 ?auto_329542 ) ) ( not ( = ?auto_329541 ?auto_329543 ) ) ( not ( = ?auto_329541 ?auto_329544 ) ) ( not ( = ?auto_329541 ?auto_329545 ) ) ( not ( = ?auto_329541 ?auto_329546 ) ) ( not ( = ?auto_329541 ?auto_329547 ) ) ( not ( = ?auto_329541 ?auto_329548 ) ) ( not ( = ?auto_329541 ?auto_329549 ) ) ( not ( = ?auto_329541 ?auto_329550 ) ) ( not ( = ?auto_329541 ?auto_329551 ) ) ( not ( = ?auto_329541 ?auto_329552 ) ) ( not ( = ?auto_329541 ?auto_329553 ) ) ( not ( = ?auto_329541 ?auto_329554 ) ) ( not ( = ?auto_329542 ?auto_329543 ) ) ( not ( = ?auto_329542 ?auto_329544 ) ) ( not ( = ?auto_329542 ?auto_329545 ) ) ( not ( = ?auto_329542 ?auto_329546 ) ) ( not ( = ?auto_329542 ?auto_329547 ) ) ( not ( = ?auto_329542 ?auto_329548 ) ) ( not ( = ?auto_329542 ?auto_329549 ) ) ( not ( = ?auto_329542 ?auto_329550 ) ) ( not ( = ?auto_329542 ?auto_329551 ) ) ( not ( = ?auto_329542 ?auto_329552 ) ) ( not ( = ?auto_329542 ?auto_329553 ) ) ( not ( = ?auto_329542 ?auto_329554 ) ) ( not ( = ?auto_329543 ?auto_329544 ) ) ( not ( = ?auto_329543 ?auto_329545 ) ) ( not ( = ?auto_329543 ?auto_329546 ) ) ( not ( = ?auto_329543 ?auto_329547 ) ) ( not ( = ?auto_329543 ?auto_329548 ) ) ( not ( = ?auto_329543 ?auto_329549 ) ) ( not ( = ?auto_329543 ?auto_329550 ) ) ( not ( = ?auto_329543 ?auto_329551 ) ) ( not ( = ?auto_329543 ?auto_329552 ) ) ( not ( = ?auto_329543 ?auto_329553 ) ) ( not ( = ?auto_329543 ?auto_329554 ) ) ( not ( = ?auto_329544 ?auto_329545 ) ) ( not ( = ?auto_329544 ?auto_329546 ) ) ( not ( = ?auto_329544 ?auto_329547 ) ) ( not ( = ?auto_329544 ?auto_329548 ) ) ( not ( = ?auto_329544 ?auto_329549 ) ) ( not ( = ?auto_329544 ?auto_329550 ) ) ( not ( = ?auto_329544 ?auto_329551 ) ) ( not ( = ?auto_329544 ?auto_329552 ) ) ( not ( = ?auto_329544 ?auto_329553 ) ) ( not ( = ?auto_329544 ?auto_329554 ) ) ( not ( = ?auto_329545 ?auto_329546 ) ) ( not ( = ?auto_329545 ?auto_329547 ) ) ( not ( = ?auto_329545 ?auto_329548 ) ) ( not ( = ?auto_329545 ?auto_329549 ) ) ( not ( = ?auto_329545 ?auto_329550 ) ) ( not ( = ?auto_329545 ?auto_329551 ) ) ( not ( = ?auto_329545 ?auto_329552 ) ) ( not ( = ?auto_329545 ?auto_329553 ) ) ( not ( = ?auto_329545 ?auto_329554 ) ) ( not ( = ?auto_329546 ?auto_329547 ) ) ( not ( = ?auto_329546 ?auto_329548 ) ) ( not ( = ?auto_329546 ?auto_329549 ) ) ( not ( = ?auto_329546 ?auto_329550 ) ) ( not ( = ?auto_329546 ?auto_329551 ) ) ( not ( = ?auto_329546 ?auto_329552 ) ) ( not ( = ?auto_329546 ?auto_329553 ) ) ( not ( = ?auto_329546 ?auto_329554 ) ) ( not ( = ?auto_329547 ?auto_329548 ) ) ( not ( = ?auto_329547 ?auto_329549 ) ) ( not ( = ?auto_329547 ?auto_329550 ) ) ( not ( = ?auto_329547 ?auto_329551 ) ) ( not ( = ?auto_329547 ?auto_329552 ) ) ( not ( = ?auto_329547 ?auto_329553 ) ) ( not ( = ?auto_329547 ?auto_329554 ) ) ( not ( = ?auto_329548 ?auto_329549 ) ) ( not ( = ?auto_329548 ?auto_329550 ) ) ( not ( = ?auto_329548 ?auto_329551 ) ) ( not ( = ?auto_329548 ?auto_329552 ) ) ( not ( = ?auto_329548 ?auto_329553 ) ) ( not ( = ?auto_329548 ?auto_329554 ) ) ( not ( = ?auto_329549 ?auto_329550 ) ) ( not ( = ?auto_329549 ?auto_329551 ) ) ( not ( = ?auto_329549 ?auto_329552 ) ) ( not ( = ?auto_329549 ?auto_329553 ) ) ( not ( = ?auto_329549 ?auto_329554 ) ) ( not ( = ?auto_329550 ?auto_329551 ) ) ( not ( = ?auto_329550 ?auto_329552 ) ) ( not ( = ?auto_329550 ?auto_329553 ) ) ( not ( = ?auto_329550 ?auto_329554 ) ) ( not ( = ?auto_329551 ?auto_329552 ) ) ( not ( = ?auto_329551 ?auto_329553 ) ) ( not ( = ?auto_329551 ?auto_329554 ) ) ( not ( = ?auto_329552 ?auto_329553 ) ) ( not ( = ?auto_329552 ?auto_329554 ) ) ( not ( = ?auto_329553 ?auto_329554 ) ) ( ON ?auto_329552 ?auto_329553 ) ( ON ?auto_329551 ?auto_329552 ) ( ON ?auto_329550 ?auto_329551 ) ( ON ?auto_329549 ?auto_329550 ) ( ON ?auto_329548 ?auto_329549 ) ( ON ?auto_329547 ?auto_329548 ) ( ON ?auto_329546 ?auto_329547 ) ( CLEAR ?auto_329544 ) ( ON ?auto_329545 ?auto_329546 ) ( CLEAR ?auto_329545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_329541 ?auto_329542 ?auto_329543 ?auto_329544 ?auto_329545 )
      ( MAKE-13PILE ?auto_329541 ?auto_329542 ?auto_329543 ?auto_329544 ?auto_329545 ?auto_329546 ?auto_329547 ?auto_329548 ?auto_329549 ?auto_329550 ?auto_329551 ?auto_329552 ?auto_329553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329595 - BLOCK
      ?auto_329596 - BLOCK
      ?auto_329597 - BLOCK
      ?auto_329598 - BLOCK
      ?auto_329599 - BLOCK
      ?auto_329600 - BLOCK
      ?auto_329601 - BLOCK
      ?auto_329602 - BLOCK
      ?auto_329603 - BLOCK
      ?auto_329604 - BLOCK
      ?auto_329605 - BLOCK
      ?auto_329606 - BLOCK
      ?auto_329607 - BLOCK
    )
    :vars
    (
      ?auto_329608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329607 ?auto_329608 ) ( ON-TABLE ?auto_329595 ) ( ON ?auto_329596 ?auto_329595 ) ( ON ?auto_329597 ?auto_329596 ) ( not ( = ?auto_329595 ?auto_329596 ) ) ( not ( = ?auto_329595 ?auto_329597 ) ) ( not ( = ?auto_329595 ?auto_329598 ) ) ( not ( = ?auto_329595 ?auto_329599 ) ) ( not ( = ?auto_329595 ?auto_329600 ) ) ( not ( = ?auto_329595 ?auto_329601 ) ) ( not ( = ?auto_329595 ?auto_329602 ) ) ( not ( = ?auto_329595 ?auto_329603 ) ) ( not ( = ?auto_329595 ?auto_329604 ) ) ( not ( = ?auto_329595 ?auto_329605 ) ) ( not ( = ?auto_329595 ?auto_329606 ) ) ( not ( = ?auto_329595 ?auto_329607 ) ) ( not ( = ?auto_329595 ?auto_329608 ) ) ( not ( = ?auto_329596 ?auto_329597 ) ) ( not ( = ?auto_329596 ?auto_329598 ) ) ( not ( = ?auto_329596 ?auto_329599 ) ) ( not ( = ?auto_329596 ?auto_329600 ) ) ( not ( = ?auto_329596 ?auto_329601 ) ) ( not ( = ?auto_329596 ?auto_329602 ) ) ( not ( = ?auto_329596 ?auto_329603 ) ) ( not ( = ?auto_329596 ?auto_329604 ) ) ( not ( = ?auto_329596 ?auto_329605 ) ) ( not ( = ?auto_329596 ?auto_329606 ) ) ( not ( = ?auto_329596 ?auto_329607 ) ) ( not ( = ?auto_329596 ?auto_329608 ) ) ( not ( = ?auto_329597 ?auto_329598 ) ) ( not ( = ?auto_329597 ?auto_329599 ) ) ( not ( = ?auto_329597 ?auto_329600 ) ) ( not ( = ?auto_329597 ?auto_329601 ) ) ( not ( = ?auto_329597 ?auto_329602 ) ) ( not ( = ?auto_329597 ?auto_329603 ) ) ( not ( = ?auto_329597 ?auto_329604 ) ) ( not ( = ?auto_329597 ?auto_329605 ) ) ( not ( = ?auto_329597 ?auto_329606 ) ) ( not ( = ?auto_329597 ?auto_329607 ) ) ( not ( = ?auto_329597 ?auto_329608 ) ) ( not ( = ?auto_329598 ?auto_329599 ) ) ( not ( = ?auto_329598 ?auto_329600 ) ) ( not ( = ?auto_329598 ?auto_329601 ) ) ( not ( = ?auto_329598 ?auto_329602 ) ) ( not ( = ?auto_329598 ?auto_329603 ) ) ( not ( = ?auto_329598 ?auto_329604 ) ) ( not ( = ?auto_329598 ?auto_329605 ) ) ( not ( = ?auto_329598 ?auto_329606 ) ) ( not ( = ?auto_329598 ?auto_329607 ) ) ( not ( = ?auto_329598 ?auto_329608 ) ) ( not ( = ?auto_329599 ?auto_329600 ) ) ( not ( = ?auto_329599 ?auto_329601 ) ) ( not ( = ?auto_329599 ?auto_329602 ) ) ( not ( = ?auto_329599 ?auto_329603 ) ) ( not ( = ?auto_329599 ?auto_329604 ) ) ( not ( = ?auto_329599 ?auto_329605 ) ) ( not ( = ?auto_329599 ?auto_329606 ) ) ( not ( = ?auto_329599 ?auto_329607 ) ) ( not ( = ?auto_329599 ?auto_329608 ) ) ( not ( = ?auto_329600 ?auto_329601 ) ) ( not ( = ?auto_329600 ?auto_329602 ) ) ( not ( = ?auto_329600 ?auto_329603 ) ) ( not ( = ?auto_329600 ?auto_329604 ) ) ( not ( = ?auto_329600 ?auto_329605 ) ) ( not ( = ?auto_329600 ?auto_329606 ) ) ( not ( = ?auto_329600 ?auto_329607 ) ) ( not ( = ?auto_329600 ?auto_329608 ) ) ( not ( = ?auto_329601 ?auto_329602 ) ) ( not ( = ?auto_329601 ?auto_329603 ) ) ( not ( = ?auto_329601 ?auto_329604 ) ) ( not ( = ?auto_329601 ?auto_329605 ) ) ( not ( = ?auto_329601 ?auto_329606 ) ) ( not ( = ?auto_329601 ?auto_329607 ) ) ( not ( = ?auto_329601 ?auto_329608 ) ) ( not ( = ?auto_329602 ?auto_329603 ) ) ( not ( = ?auto_329602 ?auto_329604 ) ) ( not ( = ?auto_329602 ?auto_329605 ) ) ( not ( = ?auto_329602 ?auto_329606 ) ) ( not ( = ?auto_329602 ?auto_329607 ) ) ( not ( = ?auto_329602 ?auto_329608 ) ) ( not ( = ?auto_329603 ?auto_329604 ) ) ( not ( = ?auto_329603 ?auto_329605 ) ) ( not ( = ?auto_329603 ?auto_329606 ) ) ( not ( = ?auto_329603 ?auto_329607 ) ) ( not ( = ?auto_329603 ?auto_329608 ) ) ( not ( = ?auto_329604 ?auto_329605 ) ) ( not ( = ?auto_329604 ?auto_329606 ) ) ( not ( = ?auto_329604 ?auto_329607 ) ) ( not ( = ?auto_329604 ?auto_329608 ) ) ( not ( = ?auto_329605 ?auto_329606 ) ) ( not ( = ?auto_329605 ?auto_329607 ) ) ( not ( = ?auto_329605 ?auto_329608 ) ) ( not ( = ?auto_329606 ?auto_329607 ) ) ( not ( = ?auto_329606 ?auto_329608 ) ) ( not ( = ?auto_329607 ?auto_329608 ) ) ( ON ?auto_329606 ?auto_329607 ) ( ON ?auto_329605 ?auto_329606 ) ( ON ?auto_329604 ?auto_329605 ) ( ON ?auto_329603 ?auto_329604 ) ( ON ?auto_329602 ?auto_329603 ) ( ON ?auto_329601 ?auto_329602 ) ( ON ?auto_329600 ?auto_329601 ) ( ON ?auto_329599 ?auto_329600 ) ( CLEAR ?auto_329597 ) ( ON ?auto_329598 ?auto_329599 ) ( CLEAR ?auto_329598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_329595 ?auto_329596 ?auto_329597 ?auto_329598 )
      ( MAKE-13PILE ?auto_329595 ?auto_329596 ?auto_329597 ?auto_329598 ?auto_329599 ?auto_329600 ?auto_329601 ?auto_329602 ?auto_329603 ?auto_329604 ?auto_329605 ?auto_329606 ?auto_329607 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329649 - BLOCK
      ?auto_329650 - BLOCK
      ?auto_329651 - BLOCK
      ?auto_329652 - BLOCK
      ?auto_329653 - BLOCK
      ?auto_329654 - BLOCK
      ?auto_329655 - BLOCK
      ?auto_329656 - BLOCK
      ?auto_329657 - BLOCK
      ?auto_329658 - BLOCK
      ?auto_329659 - BLOCK
      ?auto_329660 - BLOCK
      ?auto_329661 - BLOCK
    )
    :vars
    (
      ?auto_329662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329661 ?auto_329662 ) ( ON-TABLE ?auto_329649 ) ( ON ?auto_329650 ?auto_329649 ) ( not ( = ?auto_329649 ?auto_329650 ) ) ( not ( = ?auto_329649 ?auto_329651 ) ) ( not ( = ?auto_329649 ?auto_329652 ) ) ( not ( = ?auto_329649 ?auto_329653 ) ) ( not ( = ?auto_329649 ?auto_329654 ) ) ( not ( = ?auto_329649 ?auto_329655 ) ) ( not ( = ?auto_329649 ?auto_329656 ) ) ( not ( = ?auto_329649 ?auto_329657 ) ) ( not ( = ?auto_329649 ?auto_329658 ) ) ( not ( = ?auto_329649 ?auto_329659 ) ) ( not ( = ?auto_329649 ?auto_329660 ) ) ( not ( = ?auto_329649 ?auto_329661 ) ) ( not ( = ?auto_329649 ?auto_329662 ) ) ( not ( = ?auto_329650 ?auto_329651 ) ) ( not ( = ?auto_329650 ?auto_329652 ) ) ( not ( = ?auto_329650 ?auto_329653 ) ) ( not ( = ?auto_329650 ?auto_329654 ) ) ( not ( = ?auto_329650 ?auto_329655 ) ) ( not ( = ?auto_329650 ?auto_329656 ) ) ( not ( = ?auto_329650 ?auto_329657 ) ) ( not ( = ?auto_329650 ?auto_329658 ) ) ( not ( = ?auto_329650 ?auto_329659 ) ) ( not ( = ?auto_329650 ?auto_329660 ) ) ( not ( = ?auto_329650 ?auto_329661 ) ) ( not ( = ?auto_329650 ?auto_329662 ) ) ( not ( = ?auto_329651 ?auto_329652 ) ) ( not ( = ?auto_329651 ?auto_329653 ) ) ( not ( = ?auto_329651 ?auto_329654 ) ) ( not ( = ?auto_329651 ?auto_329655 ) ) ( not ( = ?auto_329651 ?auto_329656 ) ) ( not ( = ?auto_329651 ?auto_329657 ) ) ( not ( = ?auto_329651 ?auto_329658 ) ) ( not ( = ?auto_329651 ?auto_329659 ) ) ( not ( = ?auto_329651 ?auto_329660 ) ) ( not ( = ?auto_329651 ?auto_329661 ) ) ( not ( = ?auto_329651 ?auto_329662 ) ) ( not ( = ?auto_329652 ?auto_329653 ) ) ( not ( = ?auto_329652 ?auto_329654 ) ) ( not ( = ?auto_329652 ?auto_329655 ) ) ( not ( = ?auto_329652 ?auto_329656 ) ) ( not ( = ?auto_329652 ?auto_329657 ) ) ( not ( = ?auto_329652 ?auto_329658 ) ) ( not ( = ?auto_329652 ?auto_329659 ) ) ( not ( = ?auto_329652 ?auto_329660 ) ) ( not ( = ?auto_329652 ?auto_329661 ) ) ( not ( = ?auto_329652 ?auto_329662 ) ) ( not ( = ?auto_329653 ?auto_329654 ) ) ( not ( = ?auto_329653 ?auto_329655 ) ) ( not ( = ?auto_329653 ?auto_329656 ) ) ( not ( = ?auto_329653 ?auto_329657 ) ) ( not ( = ?auto_329653 ?auto_329658 ) ) ( not ( = ?auto_329653 ?auto_329659 ) ) ( not ( = ?auto_329653 ?auto_329660 ) ) ( not ( = ?auto_329653 ?auto_329661 ) ) ( not ( = ?auto_329653 ?auto_329662 ) ) ( not ( = ?auto_329654 ?auto_329655 ) ) ( not ( = ?auto_329654 ?auto_329656 ) ) ( not ( = ?auto_329654 ?auto_329657 ) ) ( not ( = ?auto_329654 ?auto_329658 ) ) ( not ( = ?auto_329654 ?auto_329659 ) ) ( not ( = ?auto_329654 ?auto_329660 ) ) ( not ( = ?auto_329654 ?auto_329661 ) ) ( not ( = ?auto_329654 ?auto_329662 ) ) ( not ( = ?auto_329655 ?auto_329656 ) ) ( not ( = ?auto_329655 ?auto_329657 ) ) ( not ( = ?auto_329655 ?auto_329658 ) ) ( not ( = ?auto_329655 ?auto_329659 ) ) ( not ( = ?auto_329655 ?auto_329660 ) ) ( not ( = ?auto_329655 ?auto_329661 ) ) ( not ( = ?auto_329655 ?auto_329662 ) ) ( not ( = ?auto_329656 ?auto_329657 ) ) ( not ( = ?auto_329656 ?auto_329658 ) ) ( not ( = ?auto_329656 ?auto_329659 ) ) ( not ( = ?auto_329656 ?auto_329660 ) ) ( not ( = ?auto_329656 ?auto_329661 ) ) ( not ( = ?auto_329656 ?auto_329662 ) ) ( not ( = ?auto_329657 ?auto_329658 ) ) ( not ( = ?auto_329657 ?auto_329659 ) ) ( not ( = ?auto_329657 ?auto_329660 ) ) ( not ( = ?auto_329657 ?auto_329661 ) ) ( not ( = ?auto_329657 ?auto_329662 ) ) ( not ( = ?auto_329658 ?auto_329659 ) ) ( not ( = ?auto_329658 ?auto_329660 ) ) ( not ( = ?auto_329658 ?auto_329661 ) ) ( not ( = ?auto_329658 ?auto_329662 ) ) ( not ( = ?auto_329659 ?auto_329660 ) ) ( not ( = ?auto_329659 ?auto_329661 ) ) ( not ( = ?auto_329659 ?auto_329662 ) ) ( not ( = ?auto_329660 ?auto_329661 ) ) ( not ( = ?auto_329660 ?auto_329662 ) ) ( not ( = ?auto_329661 ?auto_329662 ) ) ( ON ?auto_329660 ?auto_329661 ) ( ON ?auto_329659 ?auto_329660 ) ( ON ?auto_329658 ?auto_329659 ) ( ON ?auto_329657 ?auto_329658 ) ( ON ?auto_329656 ?auto_329657 ) ( ON ?auto_329655 ?auto_329656 ) ( ON ?auto_329654 ?auto_329655 ) ( ON ?auto_329653 ?auto_329654 ) ( ON ?auto_329652 ?auto_329653 ) ( CLEAR ?auto_329650 ) ( ON ?auto_329651 ?auto_329652 ) ( CLEAR ?auto_329651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_329649 ?auto_329650 ?auto_329651 )
      ( MAKE-13PILE ?auto_329649 ?auto_329650 ?auto_329651 ?auto_329652 ?auto_329653 ?auto_329654 ?auto_329655 ?auto_329656 ?auto_329657 ?auto_329658 ?auto_329659 ?auto_329660 ?auto_329661 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329703 - BLOCK
      ?auto_329704 - BLOCK
      ?auto_329705 - BLOCK
      ?auto_329706 - BLOCK
      ?auto_329707 - BLOCK
      ?auto_329708 - BLOCK
      ?auto_329709 - BLOCK
      ?auto_329710 - BLOCK
      ?auto_329711 - BLOCK
      ?auto_329712 - BLOCK
      ?auto_329713 - BLOCK
      ?auto_329714 - BLOCK
      ?auto_329715 - BLOCK
    )
    :vars
    (
      ?auto_329716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329715 ?auto_329716 ) ( ON-TABLE ?auto_329703 ) ( not ( = ?auto_329703 ?auto_329704 ) ) ( not ( = ?auto_329703 ?auto_329705 ) ) ( not ( = ?auto_329703 ?auto_329706 ) ) ( not ( = ?auto_329703 ?auto_329707 ) ) ( not ( = ?auto_329703 ?auto_329708 ) ) ( not ( = ?auto_329703 ?auto_329709 ) ) ( not ( = ?auto_329703 ?auto_329710 ) ) ( not ( = ?auto_329703 ?auto_329711 ) ) ( not ( = ?auto_329703 ?auto_329712 ) ) ( not ( = ?auto_329703 ?auto_329713 ) ) ( not ( = ?auto_329703 ?auto_329714 ) ) ( not ( = ?auto_329703 ?auto_329715 ) ) ( not ( = ?auto_329703 ?auto_329716 ) ) ( not ( = ?auto_329704 ?auto_329705 ) ) ( not ( = ?auto_329704 ?auto_329706 ) ) ( not ( = ?auto_329704 ?auto_329707 ) ) ( not ( = ?auto_329704 ?auto_329708 ) ) ( not ( = ?auto_329704 ?auto_329709 ) ) ( not ( = ?auto_329704 ?auto_329710 ) ) ( not ( = ?auto_329704 ?auto_329711 ) ) ( not ( = ?auto_329704 ?auto_329712 ) ) ( not ( = ?auto_329704 ?auto_329713 ) ) ( not ( = ?auto_329704 ?auto_329714 ) ) ( not ( = ?auto_329704 ?auto_329715 ) ) ( not ( = ?auto_329704 ?auto_329716 ) ) ( not ( = ?auto_329705 ?auto_329706 ) ) ( not ( = ?auto_329705 ?auto_329707 ) ) ( not ( = ?auto_329705 ?auto_329708 ) ) ( not ( = ?auto_329705 ?auto_329709 ) ) ( not ( = ?auto_329705 ?auto_329710 ) ) ( not ( = ?auto_329705 ?auto_329711 ) ) ( not ( = ?auto_329705 ?auto_329712 ) ) ( not ( = ?auto_329705 ?auto_329713 ) ) ( not ( = ?auto_329705 ?auto_329714 ) ) ( not ( = ?auto_329705 ?auto_329715 ) ) ( not ( = ?auto_329705 ?auto_329716 ) ) ( not ( = ?auto_329706 ?auto_329707 ) ) ( not ( = ?auto_329706 ?auto_329708 ) ) ( not ( = ?auto_329706 ?auto_329709 ) ) ( not ( = ?auto_329706 ?auto_329710 ) ) ( not ( = ?auto_329706 ?auto_329711 ) ) ( not ( = ?auto_329706 ?auto_329712 ) ) ( not ( = ?auto_329706 ?auto_329713 ) ) ( not ( = ?auto_329706 ?auto_329714 ) ) ( not ( = ?auto_329706 ?auto_329715 ) ) ( not ( = ?auto_329706 ?auto_329716 ) ) ( not ( = ?auto_329707 ?auto_329708 ) ) ( not ( = ?auto_329707 ?auto_329709 ) ) ( not ( = ?auto_329707 ?auto_329710 ) ) ( not ( = ?auto_329707 ?auto_329711 ) ) ( not ( = ?auto_329707 ?auto_329712 ) ) ( not ( = ?auto_329707 ?auto_329713 ) ) ( not ( = ?auto_329707 ?auto_329714 ) ) ( not ( = ?auto_329707 ?auto_329715 ) ) ( not ( = ?auto_329707 ?auto_329716 ) ) ( not ( = ?auto_329708 ?auto_329709 ) ) ( not ( = ?auto_329708 ?auto_329710 ) ) ( not ( = ?auto_329708 ?auto_329711 ) ) ( not ( = ?auto_329708 ?auto_329712 ) ) ( not ( = ?auto_329708 ?auto_329713 ) ) ( not ( = ?auto_329708 ?auto_329714 ) ) ( not ( = ?auto_329708 ?auto_329715 ) ) ( not ( = ?auto_329708 ?auto_329716 ) ) ( not ( = ?auto_329709 ?auto_329710 ) ) ( not ( = ?auto_329709 ?auto_329711 ) ) ( not ( = ?auto_329709 ?auto_329712 ) ) ( not ( = ?auto_329709 ?auto_329713 ) ) ( not ( = ?auto_329709 ?auto_329714 ) ) ( not ( = ?auto_329709 ?auto_329715 ) ) ( not ( = ?auto_329709 ?auto_329716 ) ) ( not ( = ?auto_329710 ?auto_329711 ) ) ( not ( = ?auto_329710 ?auto_329712 ) ) ( not ( = ?auto_329710 ?auto_329713 ) ) ( not ( = ?auto_329710 ?auto_329714 ) ) ( not ( = ?auto_329710 ?auto_329715 ) ) ( not ( = ?auto_329710 ?auto_329716 ) ) ( not ( = ?auto_329711 ?auto_329712 ) ) ( not ( = ?auto_329711 ?auto_329713 ) ) ( not ( = ?auto_329711 ?auto_329714 ) ) ( not ( = ?auto_329711 ?auto_329715 ) ) ( not ( = ?auto_329711 ?auto_329716 ) ) ( not ( = ?auto_329712 ?auto_329713 ) ) ( not ( = ?auto_329712 ?auto_329714 ) ) ( not ( = ?auto_329712 ?auto_329715 ) ) ( not ( = ?auto_329712 ?auto_329716 ) ) ( not ( = ?auto_329713 ?auto_329714 ) ) ( not ( = ?auto_329713 ?auto_329715 ) ) ( not ( = ?auto_329713 ?auto_329716 ) ) ( not ( = ?auto_329714 ?auto_329715 ) ) ( not ( = ?auto_329714 ?auto_329716 ) ) ( not ( = ?auto_329715 ?auto_329716 ) ) ( ON ?auto_329714 ?auto_329715 ) ( ON ?auto_329713 ?auto_329714 ) ( ON ?auto_329712 ?auto_329713 ) ( ON ?auto_329711 ?auto_329712 ) ( ON ?auto_329710 ?auto_329711 ) ( ON ?auto_329709 ?auto_329710 ) ( ON ?auto_329708 ?auto_329709 ) ( ON ?auto_329707 ?auto_329708 ) ( ON ?auto_329706 ?auto_329707 ) ( ON ?auto_329705 ?auto_329706 ) ( CLEAR ?auto_329703 ) ( ON ?auto_329704 ?auto_329705 ) ( CLEAR ?auto_329704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_329703 ?auto_329704 )
      ( MAKE-13PILE ?auto_329703 ?auto_329704 ?auto_329705 ?auto_329706 ?auto_329707 ?auto_329708 ?auto_329709 ?auto_329710 ?auto_329711 ?auto_329712 ?auto_329713 ?auto_329714 ?auto_329715 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_329757 - BLOCK
      ?auto_329758 - BLOCK
      ?auto_329759 - BLOCK
      ?auto_329760 - BLOCK
      ?auto_329761 - BLOCK
      ?auto_329762 - BLOCK
      ?auto_329763 - BLOCK
      ?auto_329764 - BLOCK
      ?auto_329765 - BLOCK
      ?auto_329766 - BLOCK
      ?auto_329767 - BLOCK
      ?auto_329768 - BLOCK
      ?auto_329769 - BLOCK
    )
    :vars
    (
      ?auto_329770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329769 ?auto_329770 ) ( not ( = ?auto_329757 ?auto_329758 ) ) ( not ( = ?auto_329757 ?auto_329759 ) ) ( not ( = ?auto_329757 ?auto_329760 ) ) ( not ( = ?auto_329757 ?auto_329761 ) ) ( not ( = ?auto_329757 ?auto_329762 ) ) ( not ( = ?auto_329757 ?auto_329763 ) ) ( not ( = ?auto_329757 ?auto_329764 ) ) ( not ( = ?auto_329757 ?auto_329765 ) ) ( not ( = ?auto_329757 ?auto_329766 ) ) ( not ( = ?auto_329757 ?auto_329767 ) ) ( not ( = ?auto_329757 ?auto_329768 ) ) ( not ( = ?auto_329757 ?auto_329769 ) ) ( not ( = ?auto_329757 ?auto_329770 ) ) ( not ( = ?auto_329758 ?auto_329759 ) ) ( not ( = ?auto_329758 ?auto_329760 ) ) ( not ( = ?auto_329758 ?auto_329761 ) ) ( not ( = ?auto_329758 ?auto_329762 ) ) ( not ( = ?auto_329758 ?auto_329763 ) ) ( not ( = ?auto_329758 ?auto_329764 ) ) ( not ( = ?auto_329758 ?auto_329765 ) ) ( not ( = ?auto_329758 ?auto_329766 ) ) ( not ( = ?auto_329758 ?auto_329767 ) ) ( not ( = ?auto_329758 ?auto_329768 ) ) ( not ( = ?auto_329758 ?auto_329769 ) ) ( not ( = ?auto_329758 ?auto_329770 ) ) ( not ( = ?auto_329759 ?auto_329760 ) ) ( not ( = ?auto_329759 ?auto_329761 ) ) ( not ( = ?auto_329759 ?auto_329762 ) ) ( not ( = ?auto_329759 ?auto_329763 ) ) ( not ( = ?auto_329759 ?auto_329764 ) ) ( not ( = ?auto_329759 ?auto_329765 ) ) ( not ( = ?auto_329759 ?auto_329766 ) ) ( not ( = ?auto_329759 ?auto_329767 ) ) ( not ( = ?auto_329759 ?auto_329768 ) ) ( not ( = ?auto_329759 ?auto_329769 ) ) ( not ( = ?auto_329759 ?auto_329770 ) ) ( not ( = ?auto_329760 ?auto_329761 ) ) ( not ( = ?auto_329760 ?auto_329762 ) ) ( not ( = ?auto_329760 ?auto_329763 ) ) ( not ( = ?auto_329760 ?auto_329764 ) ) ( not ( = ?auto_329760 ?auto_329765 ) ) ( not ( = ?auto_329760 ?auto_329766 ) ) ( not ( = ?auto_329760 ?auto_329767 ) ) ( not ( = ?auto_329760 ?auto_329768 ) ) ( not ( = ?auto_329760 ?auto_329769 ) ) ( not ( = ?auto_329760 ?auto_329770 ) ) ( not ( = ?auto_329761 ?auto_329762 ) ) ( not ( = ?auto_329761 ?auto_329763 ) ) ( not ( = ?auto_329761 ?auto_329764 ) ) ( not ( = ?auto_329761 ?auto_329765 ) ) ( not ( = ?auto_329761 ?auto_329766 ) ) ( not ( = ?auto_329761 ?auto_329767 ) ) ( not ( = ?auto_329761 ?auto_329768 ) ) ( not ( = ?auto_329761 ?auto_329769 ) ) ( not ( = ?auto_329761 ?auto_329770 ) ) ( not ( = ?auto_329762 ?auto_329763 ) ) ( not ( = ?auto_329762 ?auto_329764 ) ) ( not ( = ?auto_329762 ?auto_329765 ) ) ( not ( = ?auto_329762 ?auto_329766 ) ) ( not ( = ?auto_329762 ?auto_329767 ) ) ( not ( = ?auto_329762 ?auto_329768 ) ) ( not ( = ?auto_329762 ?auto_329769 ) ) ( not ( = ?auto_329762 ?auto_329770 ) ) ( not ( = ?auto_329763 ?auto_329764 ) ) ( not ( = ?auto_329763 ?auto_329765 ) ) ( not ( = ?auto_329763 ?auto_329766 ) ) ( not ( = ?auto_329763 ?auto_329767 ) ) ( not ( = ?auto_329763 ?auto_329768 ) ) ( not ( = ?auto_329763 ?auto_329769 ) ) ( not ( = ?auto_329763 ?auto_329770 ) ) ( not ( = ?auto_329764 ?auto_329765 ) ) ( not ( = ?auto_329764 ?auto_329766 ) ) ( not ( = ?auto_329764 ?auto_329767 ) ) ( not ( = ?auto_329764 ?auto_329768 ) ) ( not ( = ?auto_329764 ?auto_329769 ) ) ( not ( = ?auto_329764 ?auto_329770 ) ) ( not ( = ?auto_329765 ?auto_329766 ) ) ( not ( = ?auto_329765 ?auto_329767 ) ) ( not ( = ?auto_329765 ?auto_329768 ) ) ( not ( = ?auto_329765 ?auto_329769 ) ) ( not ( = ?auto_329765 ?auto_329770 ) ) ( not ( = ?auto_329766 ?auto_329767 ) ) ( not ( = ?auto_329766 ?auto_329768 ) ) ( not ( = ?auto_329766 ?auto_329769 ) ) ( not ( = ?auto_329766 ?auto_329770 ) ) ( not ( = ?auto_329767 ?auto_329768 ) ) ( not ( = ?auto_329767 ?auto_329769 ) ) ( not ( = ?auto_329767 ?auto_329770 ) ) ( not ( = ?auto_329768 ?auto_329769 ) ) ( not ( = ?auto_329768 ?auto_329770 ) ) ( not ( = ?auto_329769 ?auto_329770 ) ) ( ON ?auto_329768 ?auto_329769 ) ( ON ?auto_329767 ?auto_329768 ) ( ON ?auto_329766 ?auto_329767 ) ( ON ?auto_329765 ?auto_329766 ) ( ON ?auto_329764 ?auto_329765 ) ( ON ?auto_329763 ?auto_329764 ) ( ON ?auto_329762 ?auto_329763 ) ( ON ?auto_329761 ?auto_329762 ) ( ON ?auto_329760 ?auto_329761 ) ( ON ?auto_329759 ?auto_329760 ) ( ON ?auto_329758 ?auto_329759 ) ( ON ?auto_329757 ?auto_329758 ) ( CLEAR ?auto_329757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_329757 )
      ( MAKE-13PILE ?auto_329757 ?auto_329758 ?auto_329759 ?auto_329760 ?auto_329761 ?auto_329762 ?auto_329763 ?auto_329764 ?auto_329765 ?auto_329766 ?auto_329767 ?auto_329768 ?auto_329769 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329812 - BLOCK
      ?auto_329813 - BLOCK
      ?auto_329814 - BLOCK
      ?auto_329815 - BLOCK
      ?auto_329816 - BLOCK
      ?auto_329817 - BLOCK
      ?auto_329818 - BLOCK
      ?auto_329819 - BLOCK
      ?auto_329820 - BLOCK
      ?auto_329821 - BLOCK
      ?auto_329822 - BLOCK
      ?auto_329823 - BLOCK
      ?auto_329824 - BLOCK
      ?auto_329825 - BLOCK
    )
    :vars
    (
      ?auto_329826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_329824 ) ( ON ?auto_329825 ?auto_329826 ) ( CLEAR ?auto_329825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_329812 ) ( ON ?auto_329813 ?auto_329812 ) ( ON ?auto_329814 ?auto_329813 ) ( ON ?auto_329815 ?auto_329814 ) ( ON ?auto_329816 ?auto_329815 ) ( ON ?auto_329817 ?auto_329816 ) ( ON ?auto_329818 ?auto_329817 ) ( ON ?auto_329819 ?auto_329818 ) ( ON ?auto_329820 ?auto_329819 ) ( ON ?auto_329821 ?auto_329820 ) ( ON ?auto_329822 ?auto_329821 ) ( ON ?auto_329823 ?auto_329822 ) ( ON ?auto_329824 ?auto_329823 ) ( not ( = ?auto_329812 ?auto_329813 ) ) ( not ( = ?auto_329812 ?auto_329814 ) ) ( not ( = ?auto_329812 ?auto_329815 ) ) ( not ( = ?auto_329812 ?auto_329816 ) ) ( not ( = ?auto_329812 ?auto_329817 ) ) ( not ( = ?auto_329812 ?auto_329818 ) ) ( not ( = ?auto_329812 ?auto_329819 ) ) ( not ( = ?auto_329812 ?auto_329820 ) ) ( not ( = ?auto_329812 ?auto_329821 ) ) ( not ( = ?auto_329812 ?auto_329822 ) ) ( not ( = ?auto_329812 ?auto_329823 ) ) ( not ( = ?auto_329812 ?auto_329824 ) ) ( not ( = ?auto_329812 ?auto_329825 ) ) ( not ( = ?auto_329812 ?auto_329826 ) ) ( not ( = ?auto_329813 ?auto_329814 ) ) ( not ( = ?auto_329813 ?auto_329815 ) ) ( not ( = ?auto_329813 ?auto_329816 ) ) ( not ( = ?auto_329813 ?auto_329817 ) ) ( not ( = ?auto_329813 ?auto_329818 ) ) ( not ( = ?auto_329813 ?auto_329819 ) ) ( not ( = ?auto_329813 ?auto_329820 ) ) ( not ( = ?auto_329813 ?auto_329821 ) ) ( not ( = ?auto_329813 ?auto_329822 ) ) ( not ( = ?auto_329813 ?auto_329823 ) ) ( not ( = ?auto_329813 ?auto_329824 ) ) ( not ( = ?auto_329813 ?auto_329825 ) ) ( not ( = ?auto_329813 ?auto_329826 ) ) ( not ( = ?auto_329814 ?auto_329815 ) ) ( not ( = ?auto_329814 ?auto_329816 ) ) ( not ( = ?auto_329814 ?auto_329817 ) ) ( not ( = ?auto_329814 ?auto_329818 ) ) ( not ( = ?auto_329814 ?auto_329819 ) ) ( not ( = ?auto_329814 ?auto_329820 ) ) ( not ( = ?auto_329814 ?auto_329821 ) ) ( not ( = ?auto_329814 ?auto_329822 ) ) ( not ( = ?auto_329814 ?auto_329823 ) ) ( not ( = ?auto_329814 ?auto_329824 ) ) ( not ( = ?auto_329814 ?auto_329825 ) ) ( not ( = ?auto_329814 ?auto_329826 ) ) ( not ( = ?auto_329815 ?auto_329816 ) ) ( not ( = ?auto_329815 ?auto_329817 ) ) ( not ( = ?auto_329815 ?auto_329818 ) ) ( not ( = ?auto_329815 ?auto_329819 ) ) ( not ( = ?auto_329815 ?auto_329820 ) ) ( not ( = ?auto_329815 ?auto_329821 ) ) ( not ( = ?auto_329815 ?auto_329822 ) ) ( not ( = ?auto_329815 ?auto_329823 ) ) ( not ( = ?auto_329815 ?auto_329824 ) ) ( not ( = ?auto_329815 ?auto_329825 ) ) ( not ( = ?auto_329815 ?auto_329826 ) ) ( not ( = ?auto_329816 ?auto_329817 ) ) ( not ( = ?auto_329816 ?auto_329818 ) ) ( not ( = ?auto_329816 ?auto_329819 ) ) ( not ( = ?auto_329816 ?auto_329820 ) ) ( not ( = ?auto_329816 ?auto_329821 ) ) ( not ( = ?auto_329816 ?auto_329822 ) ) ( not ( = ?auto_329816 ?auto_329823 ) ) ( not ( = ?auto_329816 ?auto_329824 ) ) ( not ( = ?auto_329816 ?auto_329825 ) ) ( not ( = ?auto_329816 ?auto_329826 ) ) ( not ( = ?auto_329817 ?auto_329818 ) ) ( not ( = ?auto_329817 ?auto_329819 ) ) ( not ( = ?auto_329817 ?auto_329820 ) ) ( not ( = ?auto_329817 ?auto_329821 ) ) ( not ( = ?auto_329817 ?auto_329822 ) ) ( not ( = ?auto_329817 ?auto_329823 ) ) ( not ( = ?auto_329817 ?auto_329824 ) ) ( not ( = ?auto_329817 ?auto_329825 ) ) ( not ( = ?auto_329817 ?auto_329826 ) ) ( not ( = ?auto_329818 ?auto_329819 ) ) ( not ( = ?auto_329818 ?auto_329820 ) ) ( not ( = ?auto_329818 ?auto_329821 ) ) ( not ( = ?auto_329818 ?auto_329822 ) ) ( not ( = ?auto_329818 ?auto_329823 ) ) ( not ( = ?auto_329818 ?auto_329824 ) ) ( not ( = ?auto_329818 ?auto_329825 ) ) ( not ( = ?auto_329818 ?auto_329826 ) ) ( not ( = ?auto_329819 ?auto_329820 ) ) ( not ( = ?auto_329819 ?auto_329821 ) ) ( not ( = ?auto_329819 ?auto_329822 ) ) ( not ( = ?auto_329819 ?auto_329823 ) ) ( not ( = ?auto_329819 ?auto_329824 ) ) ( not ( = ?auto_329819 ?auto_329825 ) ) ( not ( = ?auto_329819 ?auto_329826 ) ) ( not ( = ?auto_329820 ?auto_329821 ) ) ( not ( = ?auto_329820 ?auto_329822 ) ) ( not ( = ?auto_329820 ?auto_329823 ) ) ( not ( = ?auto_329820 ?auto_329824 ) ) ( not ( = ?auto_329820 ?auto_329825 ) ) ( not ( = ?auto_329820 ?auto_329826 ) ) ( not ( = ?auto_329821 ?auto_329822 ) ) ( not ( = ?auto_329821 ?auto_329823 ) ) ( not ( = ?auto_329821 ?auto_329824 ) ) ( not ( = ?auto_329821 ?auto_329825 ) ) ( not ( = ?auto_329821 ?auto_329826 ) ) ( not ( = ?auto_329822 ?auto_329823 ) ) ( not ( = ?auto_329822 ?auto_329824 ) ) ( not ( = ?auto_329822 ?auto_329825 ) ) ( not ( = ?auto_329822 ?auto_329826 ) ) ( not ( = ?auto_329823 ?auto_329824 ) ) ( not ( = ?auto_329823 ?auto_329825 ) ) ( not ( = ?auto_329823 ?auto_329826 ) ) ( not ( = ?auto_329824 ?auto_329825 ) ) ( not ( = ?auto_329824 ?auto_329826 ) ) ( not ( = ?auto_329825 ?auto_329826 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_329825 ?auto_329826 )
      ( !STACK ?auto_329825 ?auto_329824 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329841 - BLOCK
      ?auto_329842 - BLOCK
      ?auto_329843 - BLOCK
      ?auto_329844 - BLOCK
      ?auto_329845 - BLOCK
      ?auto_329846 - BLOCK
      ?auto_329847 - BLOCK
      ?auto_329848 - BLOCK
      ?auto_329849 - BLOCK
      ?auto_329850 - BLOCK
      ?auto_329851 - BLOCK
      ?auto_329852 - BLOCK
      ?auto_329853 - BLOCK
      ?auto_329854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_329853 ) ( ON-TABLE ?auto_329854 ) ( CLEAR ?auto_329854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_329841 ) ( ON ?auto_329842 ?auto_329841 ) ( ON ?auto_329843 ?auto_329842 ) ( ON ?auto_329844 ?auto_329843 ) ( ON ?auto_329845 ?auto_329844 ) ( ON ?auto_329846 ?auto_329845 ) ( ON ?auto_329847 ?auto_329846 ) ( ON ?auto_329848 ?auto_329847 ) ( ON ?auto_329849 ?auto_329848 ) ( ON ?auto_329850 ?auto_329849 ) ( ON ?auto_329851 ?auto_329850 ) ( ON ?auto_329852 ?auto_329851 ) ( ON ?auto_329853 ?auto_329852 ) ( not ( = ?auto_329841 ?auto_329842 ) ) ( not ( = ?auto_329841 ?auto_329843 ) ) ( not ( = ?auto_329841 ?auto_329844 ) ) ( not ( = ?auto_329841 ?auto_329845 ) ) ( not ( = ?auto_329841 ?auto_329846 ) ) ( not ( = ?auto_329841 ?auto_329847 ) ) ( not ( = ?auto_329841 ?auto_329848 ) ) ( not ( = ?auto_329841 ?auto_329849 ) ) ( not ( = ?auto_329841 ?auto_329850 ) ) ( not ( = ?auto_329841 ?auto_329851 ) ) ( not ( = ?auto_329841 ?auto_329852 ) ) ( not ( = ?auto_329841 ?auto_329853 ) ) ( not ( = ?auto_329841 ?auto_329854 ) ) ( not ( = ?auto_329842 ?auto_329843 ) ) ( not ( = ?auto_329842 ?auto_329844 ) ) ( not ( = ?auto_329842 ?auto_329845 ) ) ( not ( = ?auto_329842 ?auto_329846 ) ) ( not ( = ?auto_329842 ?auto_329847 ) ) ( not ( = ?auto_329842 ?auto_329848 ) ) ( not ( = ?auto_329842 ?auto_329849 ) ) ( not ( = ?auto_329842 ?auto_329850 ) ) ( not ( = ?auto_329842 ?auto_329851 ) ) ( not ( = ?auto_329842 ?auto_329852 ) ) ( not ( = ?auto_329842 ?auto_329853 ) ) ( not ( = ?auto_329842 ?auto_329854 ) ) ( not ( = ?auto_329843 ?auto_329844 ) ) ( not ( = ?auto_329843 ?auto_329845 ) ) ( not ( = ?auto_329843 ?auto_329846 ) ) ( not ( = ?auto_329843 ?auto_329847 ) ) ( not ( = ?auto_329843 ?auto_329848 ) ) ( not ( = ?auto_329843 ?auto_329849 ) ) ( not ( = ?auto_329843 ?auto_329850 ) ) ( not ( = ?auto_329843 ?auto_329851 ) ) ( not ( = ?auto_329843 ?auto_329852 ) ) ( not ( = ?auto_329843 ?auto_329853 ) ) ( not ( = ?auto_329843 ?auto_329854 ) ) ( not ( = ?auto_329844 ?auto_329845 ) ) ( not ( = ?auto_329844 ?auto_329846 ) ) ( not ( = ?auto_329844 ?auto_329847 ) ) ( not ( = ?auto_329844 ?auto_329848 ) ) ( not ( = ?auto_329844 ?auto_329849 ) ) ( not ( = ?auto_329844 ?auto_329850 ) ) ( not ( = ?auto_329844 ?auto_329851 ) ) ( not ( = ?auto_329844 ?auto_329852 ) ) ( not ( = ?auto_329844 ?auto_329853 ) ) ( not ( = ?auto_329844 ?auto_329854 ) ) ( not ( = ?auto_329845 ?auto_329846 ) ) ( not ( = ?auto_329845 ?auto_329847 ) ) ( not ( = ?auto_329845 ?auto_329848 ) ) ( not ( = ?auto_329845 ?auto_329849 ) ) ( not ( = ?auto_329845 ?auto_329850 ) ) ( not ( = ?auto_329845 ?auto_329851 ) ) ( not ( = ?auto_329845 ?auto_329852 ) ) ( not ( = ?auto_329845 ?auto_329853 ) ) ( not ( = ?auto_329845 ?auto_329854 ) ) ( not ( = ?auto_329846 ?auto_329847 ) ) ( not ( = ?auto_329846 ?auto_329848 ) ) ( not ( = ?auto_329846 ?auto_329849 ) ) ( not ( = ?auto_329846 ?auto_329850 ) ) ( not ( = ?auto_329846 ?auto_329851 ) ) ( not ( = ?auto_329846 ?auto_329852 ) ) ( not ( = ?auto_329846 ?auto_329853 ) ) ( not ( = ?auto_329846 ?auto_329854 ) ) ( not ( = ?auto_329847 ?auto_329848 ) ) ( not ( = ?auto_329847 ?auto_329849 ) ) ( not ( = ?auto_329847 ?auto_329850 ) ) ( not ( = ?auto_329847 ?auto_329851 ) ) ( not ( = ?auto_329847 ?auto_329852 ) ) ( not ( = ?auto_329847 ?auto_329853 ) ) ( not ( = ?auto_329847 ?auto_329854 ) ) ( not ( = ?auto_329848 ?auto_329849 ) ) ( not ( = ?auto_329848 ?auto_329850 ) ) ( not ( = ?auto_329848 ?auto_329851 ) ) ( not ( = ?auto_329848 ?auto_329852 ) ) ( not ( = ?auto_329848 ?auto_329853 ) ) ( not ( = ?auto_329848 ?auto_329854 ) ) ( not ( = ?auto_329849 ?auto_329850 ) ) ( not ( = ?auto_329849 ?auto_329851 ) ) ( not ( = ?auto_329849 ?auto_329852 ) ) ( not ( = ?auto_329849 ?auto_329853 ) ) ( not ( = ?auto_329849 ?auto_329854 ) ) ( not ( = ?auto_329850 ?auto_329851 ) ) ( not ( = ?auto_329850 ?auto_329852 ) ) ( not ( = ?auto_329850 ?auto_329853 ) ) ( not ( = ?auto_329850 ?auto_329854 ) ) ( not ( = ?auto_329851 ?auto_329852 ) ) ( not ( = ?auto_329851 ?auto_329853 ) ) ( not ( = ?auto_329851 ?auto_329854 ) ) ( not ( = ?auto_329852 ?auto_329853 ) ) ( not ( = ?auto_329852 ?auto_329854 ) ) ( not ( = ?auto_329853 ?auto_329854 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_329854 )
      ( !STACK ?auto_329854 ?auto_329853 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329869 - BLOCK
      ?auto_329870 - BLOCK
      ?auto_329871 - BLOCK
      ?auto_329872 - BLOCK
      ?auto_329873 - BLOCK
      ?auto_329874 - BLOCK
      ?auto_329875 - BLOCK
      ?auto_329876 - BLOCK
      ?auto_329877 - BLOCK
      ?auto_329878 - BLOCK
      ?auto_329879 - BLOCK
      ?auto_329880 - BLOCK
      ?auto_329881 - BLOCK
      ?auto_329882 - BLOCK
    )
    :vars
    (
      ?auto_329883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329882 ?auto_329883 ) ( ON-TABLE ?auto_329869 ) ( ON ?auto_329870 ?auto_329869 ) ( ON ?auto_329871 ?auto_329870 ) ( ON ?auto_329872 ?auto_329871 ) ( ON ?auto_329873 ?auto_329872 ) ( ON ?auto_329874 ?auto_329873 ) ( ON ?auto_329875 ?auto_329874 ) ( ON ?auto_329876 ?auto_329875 ) ( ON ?auto_329877 ?auto_329876 ) ( ON ?auto_329878 ?auto_329877 ) ( ON ?auto_329879 ?auto_329878 ) ( ON ?auto_329880 ?auto_329879 ) ( not ( = ?auto_329869 ?auto_329870 ) ) ( not ( = ?auto_329869 ?auto_329871 ) ) ( not ( = ?auto_329869 ?auto_329872 ) ) ( not ( = ?auto_329869 ?auto_329873 ) ) ( not ( = ?auto_329869 ?auto_329874 ) ) ( not ( = ?auto_329869 ?auto_329875 ) ) ( not ( = ?auto_329869 ?auto_329876 ) ) ( not ( = ?auto_329869 ?auto_329877 ) ) ( not ( = ?auto_329869 ?auto_329878 ) ) ( not ( = ?auto_329869 ?auto_329879 ) ) ( not ( = ?auto_329869 ?auto_329880 ) ) ( not ( = ?auto_329869 ?auto_329881 ) ) ( not ( = ?auto_329869 ?auto_329882 ) ) ( not ( = ?auto_329869 ?auto_329883 ) ) ( not ( = ?auto_329870 ?auto_329871 ) ) ( not ( = ?auto_329870 ?auto_329872 ) ) ( not ( = ?auto_329870 ?auto_329873 ) ) ( not ( = ?auto_329870 ?auto_329874 ) ) ( not ( = ?auto_329870 ?auto_329875 ) ) ( not ( = ?auto_329870 ?auto_329876 ) ) ( not ( = ?auto_329870 ?auto_329877 ) ) ( not ( = ?auto_329870 ?auto_329878 ) ) ( not ( = ?auto_329870 ?auto_329879 ) ) ( not ( = ?auto_329870 ?auto_329880 ) ) ( not ( = ?auto_329870 ?auto_329881 ) ) ( not ( = ?auto_329870 ?auto_329882 ) ) ( not ( = ?auto_329870 ?auto_329883 ) ) ( not ( = ?auto_329871 ?auto_329872 ) ) ( not ( = ?auto_329871 ?auto_329873 ) ) ( not ( = ?auto_329871 ?auto_329874 ) ) ( not ( = ?auto_329871 ?auto_329875 ) ) ( not ( = ?auto_329871 ?auto_329876 ) ) ( not ( = ?auto_329871 ?auto_329877 ) ) ( not ( = ?auto_329871 ?auto_329878 ) ) ( not ( = ?auto_329871 ?auto_329879 ) ) ( not ( = ?auto_329871 ?auto_329880 ) ) ( not ( = ?auto_329871 ?auto_329881 ) ) ( not ( = ?auto_329871 ?auto_329882 ) ) ( not ( = ?auto_329871 ?auto_329883 ) ) ( not ( = ?auto_329872 ?auto_329873 ) ) ( not ( = ?auto_329872 ?auto_329874 ) ) ( not ( = ?auto_329872 ?auto_329875 ) ) ( not ( = ?auto_329872 ?auto_329876 ) ) ( not ( = ?auto_329872 ?auto_329877 ) ) ( not ( = ?auto_329872 ?auto_329878 ) ) ( not ( = ?auto_329872 ?auto_329879 ) ) ( not ( = ?auto_329872 ?auto_329880 ) ) ( not ( = ?auto_329872 ?auto_329881 ) ) ( not ( = ?auto_329872 ?auto_329882 ) ) ( not ( = ?auto_329872 ?auto_329883 ) ) ( not ( = ?auto_329873 ?auto_329874 ) ) ( not ( = ?auto_329873 ?auto_329875 ) ) ( not ( = ?auto_329873 ?auto_329876 ) ) ( not ( = ?auto_329873 ?auto_329877 ) ) ( not ( = ?auto_329873 ?auto_329878 ) ) ( not ( = ?auto_329873 ?auto_329879 ) ) ( not ( = ?auto_329873 ?auto_329880 ) ) ( not ( = ?auto_329873 ?auto_329881 ) ) ( not ( = ?auto_329873 ?auto_329882 ) ) ( not ( = ?auto_329873 ?auto_329883 ) ) ( not ( = ?auto_329874 ?auto_329875 ) ) ( not ( = ?auto_329874 ?auto_329876 ) ) ( not ( = ?auto_329874 ?auto_329877 ) ) ( not ( = ?auto_329874 ?auto_329878 ) ) ( not ( = ?auto_329874 ?auto_329879 ) ) ( not ( = ?auto_329874 ?auto_329880 ) ) ( not ( = ?auto_329874 ?auto_329881 ) ) ( not ( = ?auto_329874 ?auto_329882 ) ) ( not ( = ?auto_329874 ?auto_329883 ) ) ( not ( = ?auto_329875 ?auto_329876 ) ) ( not ( = ?auto_329875 ?auto_329877 ) ) ( not ( = ?auto_329875 ?auto_329878 ) ) ( not ( = ?auto_329875 ?auto_329879 ) ) ( not ( = ?auto_329875 ?auto_329880 ) ) ( not ( = ?auto_329875 ?auto_329881 ) ) ( not ( = ?auto_329875 ?auto_329882 ) ) ( not ( = ?auto_329875 ?auto_329883 ) ) ( not ( = ?auto_329876 ?auto_329877 ) ) ( not ( = ?auto_329876 ?auto_329878 ) ) ( not ( = ?auto_329876 ?auto_329879 ) ) ( not ( = ?auto_329876 ?auto_329880 ) ) ( not ( = ?auto_329876 ?auto_329881 ) ) ( not ( = ?auto_329876 ?auto_329882 ) ) ( not ( = ?auto_329876 ?auto_329883 ) ) ( not ( = ?auto_329877 ?auto_329878 ) ) ( not ( = ?auto_329877 ?auto_329879 ) ) ( not ( = ?auto_329877 ?auto_329880 ) ) ( not ( = ?auto_329877 ?auto_329881 ) ) ( not ( = ?auto_329877 ?auto_329882 ) ) ( not ( = ?auto_329877 ?auto_329883 ) ) ( not ( = ?auto_329878 ?auto_329879 ) ) ( not ( = ?auto_329878 ?auto_329880 ) ) ( not ( = ?auto_329878 ?auto_329881 ) ) ( not ( = ?auto_329878 ?auto_329882 ) ) ( not ( = ?auto_329878 ?auto_329883 ) ) ( not ( = ?auto_329879 ?auto_329880 ) ) ( not ( = ?auto_329879 ?auto_329881 ) ) ( not ( = ?auto_329879 ?auto_329882 ) ) ( not ( = ?auto_329879 ?auto_329883 ) ) ( not ( = ?auto_329880 ?auto_329881 ) ) ( not ( = ?auto_329880 ?auto_329882 ) ) ( not ( = ?auto_329880 ?auto_329883 ) ) ( not ( = ?auto_329881 ?auto_329882 ) ) ( not ( = ?auto_329881 ?auto_329883 ) ) ( not ( = ?auto_329882 ?auto_329883 ) ) ( CLEAR ?auto_329880 ) ( ON ?auto_329881 ?auto_329882 ) ( CLEAR ?auto_329881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_329869 ?auto_329870 ?auto_329871 ?auto_329872 ?auto_329873 ?auto_329874 ?auto_329875 ?auto_329876 ?auto_329877 ?auto_329878 ?auto_329879 ?auto_329880 ?auto_329881 )
      ( MAKE-14PILE ?auto_329869 ?auto_329870 ?auto_329871 ?auto_329872 ?auto_329873 ?auto_329874 ?auto_329875 ?auto_329876 ?auto_329877 ?auto_329878 ?auto_329879 ?auto_329880 ?auto_329881 ?auto_329882 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329898 - BLOCK
      ?auto_329899 - BLOCK
      ?auto_329900 - BLOCK
      ?auto_329901 - BLOCK
      ?auto_329902 - BLOCK
      ?auto_329903 - BLOCK
      ?auto_329904 - BLOCK
      ?auto_329905 - BLOCK
      ?auto_329906 - BLOCK
      ?auto_329907 - BLOCK
      ?auto_329908 - BLOCK
      ?auto_329909 - BLOCK
      ?auto_329910 - BLOCK
      ?auto_329911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_329911 ) ( ON-TABLE ?auto_329898 ) ( ON ?auto_329899 ?auto_329898 ) ( ON ?auto_329900 ?auto_329899 ) ( ON ?auto_329901 ?auto_329900 ) ( ON ?auto_329902 ?auto_329901 ) ( ON ?auto_329903 ?auto_329902 ) ( ON ?auto_329904 ?auto_329903 ) ( ON ?auto_329905 ?auto_329904 ) ( ON ?auto_329906 ?auto_329905 ) ( ON ?auto_329907 ?auto_329906 ) ( ON ?auto_329908 ?auto_329907 ) ( ON ?auto_329909 ?auto_329908 ) ( not ( = ?auto_329898 ?auto_329899 ) ) ( not ( = ?auto_329898 ?auto_329900 ) ) ( not ( = ?auto_329898 ?auto_329901 ) ) ( not ( = ?auto_329898 ?auto_329902 ) ) ( not ( = ?auto_329898 ?auto_329903 ) ) ( not ( = ?auto_329898 ?auto_329904 ) ) ( not ( = ?auto_329898 ?auto_329905 ) ) ( not ( = ?auto_329898 ?auto_329906 ) ) ( not ( = ?auto_329898 ?auto_329907 ) ) ( not ( = ?auto_329898 ?auto_329908 ) ) ( not ( = ?auto_329898 ?auto_329909 ) ) ( not ( = ?auto_329898 ?auto_329910 ) ) ( not ( = ?auto_329898 ?auto_329911 ) ) ( not ( = ?auto_329899 ?auto_329900 ) ) ( not ( = ?auto_329899 ?auto_329901 ) ) ( not ( = ?auto_329899 ?auto_329902 ) ) ( not ( = ?auto_329899 ?auto_329903 ) ) ( not ( = ?auto_329899 ?auto_329904 ) ) ( not ( = ?auto_329899 ?auto_329905 ) ) ( not ( = ?auto_329899 ?auto_329906 ) ) ( not ( = ?auto_329899 ?auto_329907 ) ) ( not ( = ?auto_329899 ?auto_329908 ) ) ( not ( = ?auto_329899 ?auto_329909 ) ) ( not ( = ?auto_329899 ?auto_329910 ) ) ( not ( = ?auto_329899 ?auto_329911 ) ) ( not ( = ?auto_329900 ?auto_329901 ) ) ( not ( = ?auto_329900 ?auto_329902 ) ) ( not ( = ?auto_329900 ?auto_329903 ) ) ( not ( = ?auto_329900 ?auto_329904 ) ) ( not ( = ?auto_329900 ?auto_329905 ) ) ( not ( = ?auto_329900 ?auto_329906 ) ) ( not ( = ?auto_329900 ?auto_329907 ) ) ( not ( = ?auto_329900 ?auto_329908 ) ) ( not ( = ?auto_329900 ?auto_329909 ) ) ( not ( = ?auto_329900 ?auto_329910 ) ) ( not ( = ?auto_329900 ?auto_329911 ) ) ( not ( = ?auto_329901 ?auto_329902 ) ) ( not ( = ?auto_329901 ?auto_329903 ) ) ( not ( = ?auto_329901 ?auto_329904 ) ) ( not ( = ?auto_329901 ?auto_329905 ) ) ( not ( = ?auto_329901 ?auto_329906 ) ) ( not ( = ?auto_329901 ?auto_329907 ) ) ( not ( = ?auto_329901 ?auto_329908 ) ) ( not ( = ?auto_329901 ?auto_329909 ) ) ( not ( = ?auto_329901 ?auto_329910 ) ) ( not ( = ?auto_329901 ?auto_329911 ) ) ( not ( = ?auto_329902 ?auto_329903 ) ) ( not ( = ?auto_329902 ?auto_329904 ) ) ( not ( = ?auto_329902 ?auto_329905 ) ) ( not ( = ?auto_329902 ?auto_329906 ) ) ( not ( = ?auto_329902 ?auto_329907 ) ) ( not ( = ?auto_329902 ?auto_329908 ) ) ( not ( = ?auto_329902 ?auto_329909 ) ) ( not ( = ?auto_329902 ?auto_329910 ) ) ( not ( = ?auto_329902 ?auto_329911 ) ) ( not ( = ?auto_329903 ?auto_329904 ) ) ( not ( = ?auto_329903 ?auto_329905 ) ) ( not ( = ?auto_329903 ?auto_329906 ) ) ( not ( = ?auto_329903 ?auto_329907 ) ) ( not ( = ?auto_329903 ?auto_329908 ) ) ( not ( = ?auto_329903 ?auto_329909 ) ) ( not ( = ?auto_329903 ?auto_329910 ) ) ( not ( = ?auto_329903 ?auto_329911 ) ) ( not ( = ?auto_329904 ?auto_329905 ) ) ( not ( = ?auto_329904 ?auto_329906 ) ) ( not ( = ?auto_329904 ?auto_329907 ) ) ( not ( = ?auto_329904 ?auto_329908 ) ) ( not ( = ?auto_329904 ?auto_329909 ) ) ( not ( = ?auto_329904 ?auto_329910 ) ) ( not ( = ?auto_329904 ?auto_329911 ) ) ( not ( = ?auto_329905 ?auto_329906 ) ) ( not ( = ?auto_329905 ?auto_329907 ) ) ( not ( = ?auto_329905 ?auto_329908 ) ) ( not ( = ?auto_329905 ?auto_329909 ) ) ( not ( = ?auto_329905 ?auto_329910 ) ) ( not ( = ?auto_329905 ?auto_329911 ) ) ( not ( = ?auto_329906 ?auto_329907 ) ) ( not ( = ?auto_329906 ?auto_329908 ) ) ( not ( = ?auto_329906 ?auto_329909 ) ) ( not ( = ?auto_329906 ?auto_329910 ) ) ( not ( = ?auto_329906 ?auto_329911 ) ) ( not ( = ?auto_329907 ?auto_329908 ) ) ( not ( = ?auto_329907 ?auto_329909 ) ) ( not ( = ?auto_329907 ?auto_329910 ) ) ( not ( = ?auto_329907 ?auto_329911 ) ) ( not ( = ?auto_329908 ?auto_329909 ) ) ( not ( = ?auto_329908 ?auto_329910 ) ) ( not ( = ?auto_329908 ?auto_329911 ) ) ( not ( = ?auto_329909 ?auto_329910 ) ) ( not ( = ?auto_329909 ?auto_329911 ) ) ( not ( = ?auto_329910 ?auto_329911 ) ) ( CLEAR ?auto_329909 ) ( ON ?auto_329910 ?auto_329911 ) ( CLEAR ?auto_329910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_329898 ?auto_329899 ?auto_329900 ?auto_329901 ?auto_329902 ?auto_329903 ?auto_329904 ?auto_329905 ?auto_329906 ?auto_329907 ?auto_329908 ?auto_329909 ?auto_329910 )
      ( MAKE-14PILE ?auto_329898 ?auto_329899 ?auto_329900 ?auto_329901 ?auto_329902 ?auto_329903 ?auto_329904 ?auto_329905 ?auto_329906 ?auto_329907 ?auto_329908 ?auto_329909 ?auto_329910 ?auto_329911 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329926 - BLOCK
      ?auto_329927 - BLOCK
      ?auto_329928 - BLOCK
      ?auto_329929 - BLOCK
      ?auto_329930 - BLOCK
      ?auto_329931 - BLOCK
      ?auto_329932 - BLOCK
      ?auto_329933 - BLOCK
      ?auto_329934 - BLOCK
      ?auto_329935 - BLOCK
      ?auto_329936 - BLOCK
      ?auto_329937 - BLOCK
      ?auto_329938 - BLOCK
      ?auto_329939 - BLOCK
    )
    :vars
    (
      ?auto_329940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329939 ?auto_329940 ) ( ON-TABLE ?auto_329926 ) ( ON ?auto_329927 ?auto_329926 ) ( ON ?auto_329928 ?auto_329927 ) ( ON ?auto_329929 ?auto_329928 ) ( ON ?auto_329930 ?auto_329929 ) ( ON ?auto_329931 ?auto_329930 ) ( ON ?auto_329932 ?auto_329931 ) ( ON ?auto_329933 ?auto_329932 ) ( ON ?auto_329934 ?auto_329933 ) ( ON ?auto_329935 ?auto_329934 ) ( ON ?auto_329936 ?auto_329935 ) ( not ( = ?auto_329926 ?auto_329927 ) ) ( not ( = ?auto_329926 ?auto_329928 ) ) ( not ( = ?auto_329926 ?auto_329929 ) ) ( not ( = ?auto_329926 ?auto_329930 ) ) ( not ( = ?auto_329926 ?auto_329931 ) ) ( not ( = ?auto_329926 ?auto_329932 ) ) ( not ( = ?auto_329926 ?auto_329933 ) ) ( not ( = ?auto_329926 ?auto_329934 ) ) ( not ( = ?auto_329926 ?auto_329935 ) ) ( not ( = ?auto_329926 ?auto_329936 ) ) ( not ( = ?auto_329926 ?auto_329937 ) ) ( not ( = ?auto_329926 ?auto_329938 ) ) ( not ( = ?auto_329926 ?auto_329939 ) ) ( not ( = ?auto_329926 ?auto_329940 ) ) ( not ( = ?auto_329927 ?auto_329928 ) ) ( not ( = ?auto_329927 ?auto_329929 ) ) ( not ( = ?auto_329927 ?auto_329930 ) ) ( not ( = ?auto_329927 ?auto_329931 ) ) ( not ( = ?auto_329927 ?auto_329932 ) ) ( not ( = ?auto_329927 ?auto_329933 ) ) ( not ( = ?auto_329927 ?auto_329934 ) ) ( not ( = ?auto_329927 ?auto_329935 ) ) ( not ( = ?auto_329927 ?auto_329936 ) ) ( not ( = ?auto_329927 ?auto_329937 ) ) ( not ( = ?auto_329927 ?auto_329938 ) ) ( not ( = ?auto_329927 ?auto_329939 ) ) ( not ( = ?auto_329927 ?auto_329940 ) ) ( not ( = ?auto_329928 ?auto_329929 ) ) ( not ( = ?auto_329928 ?auto_329930 ) ) ( not ( = ?auto_329928 ?auto_329931 ) ) ( not ( = ?auto_329928 ?auto_329932 ) ) ( not ( = ?auto_329928 ?auto_329933 ) ) ( not ( = ?auto_329928 ?auto_329934 ) ) ( not ( = ?auto_329928 ?auto_329935 ) ) ( not ( = ?auto_329928 ?auto_329936 ) ) ( not ( = ?auto_329928 ?auto_329937 ) ) ( not ( = ?auto_329928 ?auto_329938 ) ) ( not ( = ?auto_329928 ?auto_329939 ) ) ( not ( = ?auto_329928 ?auto_329940 ) ) ( not ( = ?auto_329929 ?auto_329930 ) ) ( not ( = ?auto_329929 ?auto_329931 ) ) ( not ( = ?auto_329929 ?auto_329932 ) ) ( not ( = ?auto_329929 ?auto_329933 ) ) ( not ( = ?auto_329929 ?auto_329934 ) ) ( not ( = ?auto_329929 ?auto_329935 ) ) ( not ( = ?auto_329929 ?auto_329936 ) ) ( not ( = ?auto_329929 ?auto_329937 ) ) ( not ( = ?auto_329929 ?auto_329938 ) ) ( not ( = ?auto_329929 ?auto_329939 ) ) ( not ( = ?auto_329929 ?auto_329940 ) ) ( not ( = ?auto_329930 ?auto_329931 ) ) ( not ( = ?auto_329930 ?auto_329932 ) ) ( not ( = ?auto_329930 ?auto_329933 ) ) ( not ( = ?auto_329930 ?auto_329934 ) ) ( not ( = ?auto_329930 ?auto_329935 ) ) ( not ( = ?auto_329930 ?auto_329936 ) ) ( not ( = ?auto_329930 ?auto_329937 ) ) ( not ( = ?auto_329930 ?auto_329938 ) ) ( not ( = ?auto_329930 ?auto_329939 ) ) ( not ( = ?auto_329930 ?auto_329940 ) ) ( not ( = ?auto_329931 ?auto_329932 ) ) ( not ( = ?auto_329931 ?auto_329933 ) ) ( not ( = ?auto_329931 ?auto_329934 ) ) ( not ( = ?auto_329931 ?auto_329935 ) ) ( not ( = ?auto_329931 ?auto_329936 ) ) ( not ( = ?auto_329931 ?auto_329937 ) ) ( not ( = ?auto_329931 ?auto_329938 ) ) ( not ( = ?auto_329931 ?auto_329939 ) ) ( not ( = ?auto_329931 ?auto_329940 ) ) ( not ( = ?auto_329932 ?auto_329933 ) ) ( not ( = ?auto_329932 ?auto_329934 ) ) ( not ( = ?auto_329932 ?auto_329935 ) ) ( not ( = ?auto_329932 ?auto_329936 ) ) ( not ( = ?auto_329932 ?auto_329937 ) ) ( not ( = ?auto_329932 ?auto_329938 ) ) ( not ( = ?auto_329932 ?auto_329939 ) ) ( not ( = ?auto_329932 ?auto_329940 ) ) ( not ( = ?auto_329933 ?auto_329934 ) ) ( not ( = ?auto_329933 ?auto_329935 ) ) ( not ( = ?auto_329933 ?auto_329936 ) ) ( not ( = ?auto_329933 ?auto_329937 ) ) ( not ( = ?auto_329933 ?auto_329938 ) ) ( not ( = ?auto_329933 ?auto_329939 ) ) ( not ( = ?auto_329933 ?auto_329940 ) ) ( not ( = ?auto_329934 ?auto_329935 ) ) ( not ( = ?auto_329934 ?auto_329936 ) ) ( not ( = ?auto_329934 ?auto_329937 ) ) ( not ( = ?auto_329934 ?auto_329938 ) ) ( not ( = ?auto_329934 ?auto_329939 ) ) ( not ( = ?auto_329934 ?auto_329940 ) ) ( not ( = ?auto_329935 ?auto_329936 ) ) ( not ( = ?auto_329935 ?auto_329937 ) ) ( not ( = ?auto_329935 ?auto_329938 ) ) ( not ( = ?auto_329935 ?auto_329939 ) ) ( not ( = ?auto_329935 ?auto_329940 ) ) ( not ( = ?auto_329936 ?auto_329937 ) ) ( not ( = ?auto_329936 ?auto_329938 ) ) ( not ( = ?auto_329936 ?auto_329939 ) ) ( not ( = ?auto_329936 ?auto_329940 ) ) ( not ( = ?auto_329937 ?auto_329938 ) ) ( not ( = ?auto_329937 ?auto_329939 ) ) ( not ( = ?auto_329937 ?auto_329940 ) ) ( not ( = ?auto_329938 ?auto_329939 ) ) ( not ( = ?auto_329938 ?auto_329940 ) ) ( not ( = ?auto_329939 ?auto_329940 ) ) ( ON ?auto_329938 ?auto_329939 ) ( CLEAR ?auto_329936 ) ( ON ?auto_329937 ?auto_329938 ) ( CLEAR ?auto_329937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_329926 ?auto_329927 ?auto_329928 ?auto_329929 ?auto_329930 ?auto_329931 ?auto_329932 ?auto_329933 ?auto_329934 ?auto_329935 ?auto_329936 ?auto_329937 )
      ( MAKE-14PILE ?auto_329926 ?auto_329927 ?auto_329928 ?auto_329929 ?auto_329930 ?auto_329931 ?auto_329932 ?auto_329933 ?auto_329934 ?auto_329935 ?auto_329936 ?auto_329937 ?auto_329938 ?auto_329939 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329955 - BLOCK
      ?auto_329956 - BLOCK
      ?auto_329957 - BLOCK
      ?auto_329958 - BLOCK
      ?auto_329959 - BLOCK
      ?auto_329960 - BLOCK
      ?auto_329961 - BLOCK
      ?auto_329962 - BLOCK
      ?auto_329963 - BLOCK
      ?auto_329964 - BLOCK
      ?auto_329965 - BLOCK
      ?auto_329966 - BLOCK
      ?auto_329967 - BLOCK
      ?auto_329968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_329968 ) ( ON-TABLE ?auto_329955 ) ( ON ?auto_329956 ?auto_329955 ) ( ON ?auto_329957 ?auto_329956 ) ( ON ?auto_329958 ?auto_329957 ) ( ON ?auto_329959 ?auto_329958 ) ( ON ?auto_329960 ?auto_329959 ) ( ON ?auto_329961 ?auto_329960 ) ( ON ?auto_329962 ?auto_329961 ) ( ON ?auto_329963 ?auto_329962 ) ( ON ?auto_329964 ?auto_329963 ) ( ON ?auto_329965 ?auto_329964 ) ( not ( = ?auto_329955 ?auto_329956 ) ) ( not ( = ?auto_329955 ?auto_329957 ) ) ( not ( = ?auto_329955 ?auto_329958 ) ) ( not ( = ?auto_329955 ?auto_329959 ) ) ( not ( = ?auto_329955 ?auto_329960 ) ) ( not ( = ?auto_329955 ?auto_329961 ) ) ( not ( = ?auto_329955 ?auto_329962 ) ) ( not ( = ?auto_329955 ?auto_329963 ) ) ( not ( = ?auto_329955 ?auto_329964 ) ) ( not ( = ?auto_329955 ?auto_329965 ) ) ( not ( = ?auto_329955 ?auto_329966 ) ) ( not ( = ?auto_329955 ?auto_329967 ) ) ( not ( = ?auto_329955 ?auto_329968 ) ) ( not ( = ?auto_329956 ?auto_329957 ) ) ( not ( = ?auto_329956 ?auto_329958 ) ) ( not ( = ?auto_329956 ?auto_329959 ) ) ( not ( = ?auto_329956 ?auto_329960 ) ) ( not ( = ?auto_329956 ?auto_329961 ) ) ( not ( = ?auto_329956 ?auto_329962 ) ) ( not ( = ?auto_329956 ?auto_329963 ) ) ( not ( = ?auto_329956 ?auto_329964 ) ) ( not ( = ?auto_329956 ?auto_329965 ) ) ( not ( = ?auto_329956 ?auto_329966 ) ) ( not ( = ?auto_329956 ?auto_329967 ) ) ( not ( = ?auto_329956 ?auto_329968 ) ) ( not ( = ?auto_329957 ?auto_329958 ) ) ( not ( = ?auto_329957 ?auto_329959 ) ) ( not ( = ?auto_329957 ?auto_329960 ) ) ( not ( = ?auto_329957 ?auto_329961 ) ) ( not ( = ?auto_329957 ?auto_329962 ) ) ( not ( = ?auto_329957 ?auto_329963 ) ) ( not ( = ?auto_329957 ?auto_329964 ) ) ( not ( = ?auto_329957 ?auto_329965 ) ) ( not ( = ?auto_329957 ?auto_329966 ) ) ( not ( = ?auto_329957 ?auto_329967 ) ) ( not ( = ?auto_329957 ?auto_329968 ) ) ( not ( = ?auto_329958 ?auto_329959 ) ) ( not ( = ?auto_329958 ?auto_329960 ) ) ( not ( = ?auto_329958 ?auto_329961 ) ) ( not ( = ?auto_329958 ?auto_329962 ) ) ( not ( = ?auto_329958 ?auto_329963 ) ) ( not ( = ?auto_329958 ?auto_329964 ) ) ( not ( = ?auto_329958 ?auto_329965 ) ) ( not ( = ?auto_329958 ?auto_329966 ) ) ( not ( = ?auto_329958 ?auto_329967 ) ) ( not ( = ?auto_329958 ?auto_329968 ) ) ( not ( = ?auto_329959 ?auto_329960 ) ) ( not ( = ?auto_329959 ?auto_329961 ) ) ( not ( = ?auto_329959 ?auto_329962 ) ) ( not ( = ?auto_329959 ?auto_329963 ) ) ( not ( = ?auto_329959 ?auto_329964 ) ) ( not ( = ?auto_329959 ?auto_329965 ) ) ( not ( = ?auto_329959 ?auto_329966 ) ) ( not ( = ?auto_329959 ?auto_329967 ) ) ( not ( = ?auto_329959 ?auto_329968 ) ) ( not ( = ?auto_329960 ?auto_329961 ) ) ( not ( = ?auto_329960 ?auto_329962 ) ) ( not ( = ?auto_329960 ?auto_329963 ) ) ( not ( = ?auto_329960 ?auto_329964 ) ) ( not ( = ?auto_329960 ?auto_329965 ) ) ( not ( = ?auto_329960 ?auto_329966 ) ) ( not ( = ?auto_329960 ?auto_329967 ) ) ( not ( = ?auto_329960 ?auto_329968 ) ) ( not ( = ?auto_329961 ?auto_329962 ) ) ( not ( = ?auto_329961 ?auto_329963 ) ) ( not ( = ?auto_329961 ?auto_329964 ) ) ( not ( = ?auto_329961 ?auto_329965 ) ) ( not ( = ?auto_329961 ?auto_329966 ) ) ( not ( = ?auto_329961 ?auto_329967 ) ) ( not ( = ?auto_329961 ?auto_329968 ) ) ( not ( = ?auto_329962 ?auto_329963 ) ) ( not ( = ?auto_329962 ?auto_329964 ) ) ( not ( = ?auto_329962 ?auto_329965 ) ) ( not ( = ?auto_329962 ?auto_329966 ) ) ( not ( = ?auto_329962 ?auto_329967 ) ) ( not ( = ?auto_329962 ?auto_329968 ) ) ( not ( = ?auto_329963 ?auto_329964 ) ) ( not ( = ?auto_329963 ?auto_329965 ) ) ( not ( = ?auto_329963 ?auto_329966 ) ) ( not ( = ?auto_329963 ?auto_329967 ) ) ( not ( = ?auto_329963 ?auto_329968 ) ) ( not ( = ?auto_329964 ?auto_329965 ) ) ( not ( = ?auto_329964 ?auto_329966 ) ) ( not ( = ?auto_329964 ?auto_329967 ) ) ( not ( = ?auto_329964 ?auto_329968 ) ) ( not ( = ?auto_329965 ?auto_329966 ) ) ( not ( = ?auto_329965 ?auto_329967 ) ) ( not ( = ?auto_329965 ?auto_329968 ) ) ( not ( = ?auto_329966 ?auto_329967 ) ) ( not ( = ?auto_329966 ?auto_329968 ) ) ( not ( = ?auto_329967 ?auto_329968 ) ) ( ON ?auto_329967 ?auto_329968 ) ( CLEAR ?auto_329965 ) ( ON ?auto_329966 ?auto_329967 ) ( CLEAR ?auto_329966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_329955 ?auto_329956 ?auto_329957 ?auto_329958 ?auto_329959 ?auto_329960 ?auto_329961 ?auto_329962 ?auto_329963 ?auto_329964 ?auto_329965 ?auto_329966 )
      ( MAKE-14PILE ?auto_329955 ?auto_329956 ?auto_329957 ?auto_329958 ?auto_329959 ?auto_329960 ?auto_329961 ?auto_329962 ?auto_329963 ?auto_329964 ?auto_329965 ?auto_329966 ?auto_329967 ?auto_329968 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_329983 - BLOCK
      ?auto_329984 - BLOCK
      ?auto_329985 - BLOCK
      ?auto_329986 - BLOCK
      ?auto_329987 - BLOCK
      ?auto_329988 - BLOCK
      ?auto_329989 - BLOCK
      ?auto_329990 - BLOCK
      ?auto_329991 - BLOCK
      ?auto_329992 - BLOCK
      ?auto_329993 - BLOCK
      ?auto_329994 - BLOCK
      ?auto_329995 - BLOCK
      ?auto_329996 - BLOCK
    )
    :vars
    (
      ?auto_329997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_329996 ?auto_329997 ) ( ON-TABLE ?auto_329983 ) ( ON ?auto_329984 ?auto_329983 ) ( ON ?auto_329985 ?auto_329984 ) ( ON ?auto_329986 ?auto_329985 ) ( ON ?auto_329987 ?auto_329986 ) ( ON ?auto_329988 ?auto_329987 ) ( ON ?auto_329989 ?auto_329988 ) ( ON ?auto_329990 ?auto_329989 ) ( ON ?auto_329991 ?auto_329990 ) ( ON ?auto_329992 ?auto_329991 ) ( not ( = ?auto_329983 ?auto_329984 ) ) ( not ( = ?auto_329983 ?auto_329985 ) ) ( not ( = ?auto_329983 ?auto_329986 ) ) ( not ( = ?auto_329983 ?auto_329987 ) ) ( not ( = ?auto_329983 ?auto_329988 ) ) ( not ( = ?auto_329983 ?auto_329989 ) ) ( not ( = ?auto_329983 ?auto_329990 ) ) ( not ( = ?auto_329983 ?auto_329991 ) ) ( not ( = ?auto_329983 ?auto_329992 ) ) ( not ( = ?auto_329983 ?auto_329993 ) ) ( not ( = ?auto_329983 ?auto_329994 ) ) ( not ( = ?auto_329983 ?auto_329995 ) ) ( not ( = ?auto_329983 ?auto_329996 ) ) ( not ( = ?auto_329983 ?auto_329997 ) ) ( not ( = ?auto_329984 ?auto_329985 ) ) ( not ( = ?auto_329984 ?auto_329986 ) ) ( not ( = ?auto_329984 ?auto_329987 ) ) ( not ( = ?auto_329984 ?auto_329988 ) ) ( not ( = ?auto_329984 ?auto_329989 ) ) ( not ( = ?auto_329984 ?auto_329990 ) ) ( not ( = ?auto_329984 ?auto_329991 ) ) ( not ( = ?auto_329984 ?auto_329992 ) ) ( not ( = ?auto_329984 ?auto_329993 ) ) ( not ( = ?auto_329984 ?auto_329994 ) ) ( not ( = ?auto_329984 ?auto_329995 ) ) ( not ( = ?auto_329984 ?auto_329996 ) ) ( not ( = ?auto_329984 ?auto_329997 ) ) ( not ( = ?auto_329985 ?auto_329986 ) ) ( not ( = ?auto_329985 ?auto_329987 ) ) ( not ( = ?auto_329985 ?auto_329988 ) ) ( not ( = ?auto_329985 ?auto_329989 ) ) ( not ( = ?auto_329985 ?auto_329990 ) ) ( not ( = ?auto_329985 ?auto_329991 ) ) ( not ( = ?auto_329985 ?auto_329992 ) ) ( not ( = ?auto_329985 ?auto_329993 ) ) ( not ( = ?auto_329985 ?auto_329994 ) ) ( not ( = ?auto_329985 ?auto_329995 ) ) ( not ( = ?auto_329985 ?auto_329996 ) ) ( not ( = ?auto_329985 ?auto_329997 ) ) ( not ( = ?auto_329986 ?auto_329987 ) ) ( not ( = ?auto_329986 ?auto_329988 ) ) ( not ( = ?auto_329986 ?auto_329989 ) ) ( not ( = ?auto_329986 ?auto_329990 ) ) ( not ( = ?auto_329986 ?auto_329991 ) ) ( not ( = ?auto_329986 ?auto_329992 ) ) ( not ( = ?auto_329986 ?auto_329993 ) ) ( not ( = ?auto_329986 ?auto_329994 ) ) ( not ( = ?auto_329986 ?auto_329995 ) ) ( not ( = ?auto_329986 ?auto_329996 ) ) ( not ( = ?auto_329986 ?auto_329997 ) ) ( not ( = ?auto_329987 ?auto_329988 ) ) ( not ( = ?auto_329987 ?auto_329989 ) ) ( not ( = ?auto_329987 ?auto_329990 ) ) ( not ( = ?auto_329987 ?auto_329991 ) ) ( not ( = ?auto_329987 ?auto_329992 ) ) ( not ( = ?auto_329987 ?auto_329993 ) ) ( not ( = ?auto_329987 ?auto_329994 ) ) ( not ( = ?auto_329987 ?auto_329995 ) ) ( not ( = ?auto_329987 ?auto_329996 ) ) ( not ( = ?auto_329987 ?auto_329997 ) ) ( not ( = ?auto_329988 ?auto_329989 ) ) ( not ( = ?auto_329988 ?auto_329990 ) ) ( not ( = ?auto_329988 ?auto_329991 ) ) ( not ( = ?auto_329988 ?auto_329992 ) ) ( not ( = ?auto_329988 ?auto_329993 ) ) ( not ( = ?auto_329988 ?auto_329994 ) ) ( not ( = ?auto_329988 ?auto_329995 ) ) ( not ( = ?auto_329988 ?auto_329996 ) ) ( not ( = ?auto_329988 ?auto_329997 ) ) ( not ( = ?auto_329989 ?auto_329990 ) ) ( not ( = ?auto_329989 ?auto_329991 ) ) ( not ( = ?auto_329989 ?auto_329992 ) ) ( not ( = ?auto_329989 ?auto_329993 ) ) ( not ( = ?auto_329989 ?auto_329994 ) ) ( not ( = ?auto_329989 ?auto_329995 ) ) ( not ( = ?auto_329989 ?auto_329996 ) ) ( not ( = ?auto_329989 ?auto_329997 ) ) ( not ( = ?auto_329990 ?auto_329991 ) ) ( not ( = ?auto_329990 ?auto_329992 ) ) ( not ( = ?auto_329990 ?auto_329993 ) ) ( not ( = ?auto_329990 ?auto_329994 ) ) ( not ( = ?auto_329990 ?auto_329995 ) ) ( not ( = ?auto_329990 ?auto_329996 ) ) ( not ( = ?auto_329990 ?auto_329997 ) ) ( not ( = ?auto_329991 ?auto_329992 ) ) ( not ( = ?auto_329991 ?auto_329993 ) ) ( not ( = ?auto_329991 ?auto_329994 ) ) ( not ( = ?auto_329991 ?auto_329995 ) ) ( not ( = ?auto_329991 ?auto_329996 ) ) ( not ( = ?auto_329991 ?auto_329997 ) ) ( not ( = ?auto_329992 ?auto_329993 ) ) ( not ( = ?auto_329992 ?auto_329994 ) ) ( not ( = ?auto_329992 ?auto_329995 ) ) ( not ( = ?auto_329992 ?auto_329996 ) ) ( not ( = ?auto_329992 ?auto_329997 ) ) ( not ( = ?auto_329993 ?auto_329994 ) ) ( not ( = ?auto_329993 ?auto_329995 ) ) ( not ( = ?auto_329993 ?auto_329996 ) ) ( not ( = ?auto_329993 ?auto_329997 ) ) ( not ( = ?auto_329994 ?auto_329995 ) ) ( not ( = ?auto_329994 ?auto_329996 ) ) ( not ( = ?auto_329994 ?auto_329997 ) ) ( not ( = ?auto_329995 ?auto_329996 ) ) ( not ( = ?auto_329995 ?auto_329997 ) ) ( not ( = ?auto_329996 ?auto_329997 ) ) ( ON ?auto_329995 ?auto_329996 ) ( ON ?auto_329994 ?auto_329995 ) ( CLEAR ?auto_329992 ) ( ON ?auto_329993 ?auto_329994 ) ( CLEAR ?auto_329993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_329983 ?auto_329984 ?auto_329985 ?auto_329986 ?auto_329987 ?auto_329988 ?auto_329989 ?auto_329990 ?auto_329991 ?auto_329992 ?auto_329993 )
      ( MAKE-14PILE ?auto_329983 ?auto_329984 ?auto_329985 ?auto_329986 ?auto_329987 ?auto_329988 ?auto_329989 ?auto_329990 ?auto_329991 ?auto_329992 ?auto_329993 ?auto_329994 ?auto_329995 ?auto_329996 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330012 - BLOCK
      ?auto_330013 - BLOCK
      ?auto_330014 - BLOCK
      ?auto_330015 - BLOCK
      ?auto_330016 - BLOCK
      ?auto_330017 - BLOCK
      ?auto_330018 - BLOCK
      ?auto_330019 - BLOCK
      ?auto_330020 - BLOCK
      ?auto_330021 - BLOCK
      ?auto_330022 - BLOCK
      ?auto_330023 - BLOCK
      ?auto_330024 - BLOCK
      ?auto_330025 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330025 ) ( ON-TABLE ?auto_330012 ) ( ON ?auto_330013 ?auto_330012 ) ( ON ?auto_330014 ?auto_330013 ) ( ON ?auto_330015 ?auto_330014 ) ( ON ?auto_330016 ?auto_330015 ) ( ON ?auto_330017 ?auto_330016 ) ( ON ?auto_330018 ?auto_330017 ) ( ON ?auto_330019 ?auto_330018 ) ( ON ?auto_330020 ?auto_330019 ) ( ON ?auto_330021 ?auto_330020 ) ( not ( = ?auto_330012 ?auto_330013 ) ) ( not ( = ?auto_330012 ?auto_330014 ) ) ( not ( = ?auto_330012 ?auto_330015 ) ) ( not ( = ?auto_330012 ?auto_330016 ) ) ( not ( = ?auto_330012 ?auto_330017 ) ) ( not ( = ?auto_330012 ?auto_330018 ) ) ( not ( = ?auto_330012 ?auto_330019 ) ) ( not ( = ?auto_330012 ?auto_330020 ) ) ( not ( = ?auto_330012 ?auto_330021 ) ) ( not ( = ?auto_330012 ?auto_330022 ) ) ( not ( = ?auto_330012 ?auto_330023 ) ) ( not ( = ?auto_330012 ?auto_330024 ) ) ( not ( = ?auto_330012 ?auto_330025 ) ) ( not ( = ?auto_330013 ?auto_330014 ) ) ( not ( = ?auto_330013 ?auto_330015 ) ) ( not ( = ?auto_330013 ?auto_330016 ) ) ( not ( = ?auto_330013 ?auto_330017 ) ) ( not ( = ?auto_330013 ?auto_330018 ) ) ( not ( = ?auto_330013 ?auto_330019 ) ) ( not ( = ?auto_330013 ?auto_330020 ) ) ( not ( = ?auto_330013 ?auto_330021 ) ) ( not ( = ?auto_330013 ?auto_330022 ) ) ( not ( = ?auto_330013 ?auto_330023 ) ) ( not ( = ?auto_330013 ?auto_330024 ) ) ( not ( = ?auto_330013 ?auto_330025 ) ) ( not ( = ?auto_330014 ?auto_330015 ) ) ( not ( = ?auto_330014 ?auto_330016 ) ) ( not ( = ?auto_330014 ?auto_330017 ) ) ( not ( = ?auto_330014 ?auto_330018 ) ) ( not ( = ?auto_330014 ?auto_330019 ) ) ( not ( = ?auto_330014 ?auto_330020 ) ) ( not ( = ?auto_330014 ?auto_330021 ) ) ( not ( = ?auto_330014 ?auto_330022 ) ) ( not ( = ?auto_330014 ?auto_330023 ) ) ( not ( = ?auto_330014 ?auto_330024 ) ) ( not ( = ?auto_330014 ?auto_330025 ) ) ( not ( = ?auto_330015 ?auto_330016 ) ) ( not ( = ?auto_330015 ?auto_330017 ) ) ( not ( = ?auto_330015 ?auto_330018 ) ) ( not ( = ?auto_330015 ?auto_330019 ) ) ( not ( = ?auto_330015 ?auto_330020 ) ) ( not ( = ?auto_330015 ?auto_330021 ) ) ( not ( = ?auto_330015 ?auto_330022 ) ) ( not ( = ?auto_330015 ?auto_330023 ) ) ( not ( = ?auto_330015 ?auto_330024 ) ) ( not ( = ?auto_330015 ?auto_330025 ) ) ( not ( = ?auto_330016 ?auto_330017 ) ) ( not ( = ?auto_330016 ?auto_330018 ) ) ( not ( = ?auto_330016 ?auto_330019 ) ) ( not ( = ?auto_330016 ?auto_330020 ) ) ( not ( = ?auto_330016 ?auto_330021 ) ) ( not ( = ?auto_330016 ?auto_330022 ) ) ( not ( = ?auto_330016 ?auto_330023 ) ) ( not ( = ?auto_330016 ?auto_330024 ) ) ( not ( = ?auto_330016 ?auto_330025 ) ) ( not ( = ?auto_330017 ?auto_330018 ) ) ( not ( = ?auto_330017 ?auto_330019 ) ) ( not ( = ?auto_330017 ?auto_330020 ) ) ( not ( = ?auto_330017 ?auto_330021 ) ) ( not ( = ?auto_330017 ?auto_330022 ) ) ( not ( = ?auto_330017 ?auto_330023 ) ) ( not ( = ?auto_330017 ?auto_330024 ) ) ( not ( = ?auto_330017 ?auto_330025 ) ) ( not ( = ?auto_330018 ?auto_330019 ) ) ( not ( = ?auto_330018 ?auto_330020 ) ) ( not ( = ?auto_330018 ?auto_330021 ) ) ( not ( = ?auto_330018 ?auto_330022 ) ) ( not ( = ?auto_330018 ?auto_330023 ) ) ( not ( = ?auto_330018 ?auto_330024 ) ) ( not ( = ?auto_330018 ?auto_330025 ) ) ( not ( = ?auto_330019 ?auto_330020 ) ) ( not ( = ?auto_330019 ?auto_330021 ) ) ( not ( = ?auto_330019 ?auto_330022 ) ) ( not ( = ?auto_330019 ?auto_330023 ) ) ( not ( = ?auto_330019 ?auto_330024 ) ) ( not ( = ?auto_330019 ?auto_330025 ) ) ( not ( = ?auto_330020 ?auto_330021 ) ) ( not ( = ?auto_330020 ?auto_330022 ) ) ( not ( = ?auto_330020 ?auto_330023 ) ) ( not ( = ?auto_330020 ?auto_330024 ) ) ( not ( = ?auto_330020 ?auto_330025 ) ) ( not ( = ?auto_330021 ?auto_330022 ) ) ( not ( = ?auto_330021 ?auto_330023 ) ) ( not ( = ?auto_330021 ?auto_330024 ) ) ( not ( = ?auto_330021 ?auto_330025 ) ) ( not ( = ?auto_330022 ?auto_330023 ) ) ( not ( = ?auto_330022 ?auto_330024 ) ) ( not ( = ?auto_330022 ?auto_330025 ) ) ( not ( = ?auto_330023 ?auto_330024 ) ) ( not ( = ?auto_330023 ?auto_330025 ) ) ( not ( = ?auto_330024 ?auto_330025 ) ) ( ON ?auto_330024 ?auto_330025 ) ( ON ?auto_330023 ?auto_330024 ) ( CLEAR ?auto_330021 ) ( ON ?auto_330022 ?auto_330023 ) ( CLEAR ?auto_330022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_330012 ?auto_330013 ?auto_330014 ?auto_330015 ?auto_330016 ?auto_330017 ?auto_330018 ?auto_330019 ?auto_330020 ?auto_330021 ?auto_330022 )
      ( MAKE-14PILE ?auto_330012 ?auto_330013 ?auto_330014 ?auto_330015 ?auto_330016 ?auto_330017 ?auto_330018 ?auto_330019 ?auto_330020 ?auto_330021 ?auto_330022 ?auto_330023 ?auto_330024 ?auto_330025 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330040 - BLOCK
      ?auto_330041 - BLOCK
      ?auto_330042 - BLOCK
      ?auto_330043 - BLOCK
      ?auto_330044 - BLOCK
      ?auto_330045 - BLOCK
      ?auto_330046 - BLOCK
      ?auto_330047 - BLOCK
      ?auto_330048 - BLOCK
      ?auto_330049 - BLOCK
      ?auto_330050 - BLOCK
      ?auto_330051 - BLOCK
      ?auto_330052 - BLOCK
      ?auto_330053 - BLOCK
    )
    :vars
    (
      ?auto_330054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330053 ?auto_330054 ) ( ON-TABLE ?auto_330040 ) ( ON ?auto_330041 ?auto_330040 ) ( ON ?auto_330042 ?auto_330041 ) ( ON ?auto_330043 ?auto_330042 ) ( ON ?auto_330044 ?auto_330043 ) ( ON ?auto_330045 ?auto_330044 ) ( ON ?auto_330046 ?auto_330045 ) ( ON ?auto_330047 ?auto_330046 ) ( ON ?auto_330048 ?auto_330047 ) ( not ( = ?auto_330040 ?auto_330041 ) ) ( not ( = ?auto_330040 ?auto_330042 ) ) ( not ( = ?auto_330040 ?auto_330043 ) ) ( not ( = ?auto_330040 ?auto_330044 ) ) ( not ( = ?auto_330040 ?auto_330045 ) ) ( not ( = ?auto_330040 ?auto_330046 ) ) ( not ( = ?auto_330040 ?auto_330047 ) ) ( not ( = ?auto_330040 ?auto_330048 ) ) ( not ( = ?auto_330040 ?auto_330049 ) ) ( not ( = ?auto_330040 ?auto_330050 ) ) ( not ( = ?auto_330040 ?auto_330051 ) ) ( not ( = ?auto_330040 ?auto_330052 ) ) ( not ( = ?auto_330040 ?auto_330053 ) ) ( not ( = ?auto_330040 ?auto_330054 ) ) ( not ( = ?auto_330041 ?auto_330042 ) ) ( not ( = ?auto_330041 ?auto_330043 ) ) ( not ( = ?auto_330041 ?auto_330044 ) ) ( not ( = ?auto_330041 ?auto_330045 ) ) ( not ( = ?auto_330041 ?auto_330046 ) ) ( not ( = ?auto_330041 ?auto_330047 ) ) ( not ( = ?auto_330041 ?auto_330048 ) ) ( not ( = ?auto_330041 ?auto_330049 ) ) ( not ( = ?auto_330041 ?auto_330050 ) ) ( not ( = ?auto_330041 ?auto_330051 ) ) ( not ( = ?auto_330041 ?auto_330052 ) ) ( not ( = ?auto_330041 ?auto_330053 ) ) ( not ( = ?auto_330041 ?auto_330054 ) ) ( not ( = ?auto_330042 ?auto_330043 ) ) ( not ( = ?auto_330042 ?auto_330044 ) ) ( not ( = ?auto_330042 ?auto_330045 ) ) ( not ( = ?auto_330042 ?auto_330046 ) ) ( not ( = ?auto_330042 ?auto_330047 ) ) ( not ( = ?auto_330042 ?auto_330048 ) ) ( not ( = ?auto_330042 ?auto_330049 ) ) ( not ( = ?auto_330042 ?auto_330050 ) ) ( not ( = ?auto_330042 ?auto_330051 ) ) ( not ( = ?auto_330042 ?auto_330052 ) ) ( not ( = ?auto_330042 ?auto_330053 ) ) ( not ( = ?auto_330042 ?auto_330054 ) ) ( not ( = ?auto_330043 ?auto_330044 ) ) ( not ( = ?auto_330043 ?auto_330045 ) ) ( not ( = ?auto_330043 ?auto_330046 ) ) ( not ( = ?auto_330043 ?auto_330047 ) ) ( not ( = ?auto_330043 ?auto_330048 ) ) ( not ( = ?auto_330043 ?auto_330049 ) ) ( not ( = ?auto_330043 ?auto_330050 ) ) ( not ( = ?auto_330043 ?auto_330051 ) ) ( not ( = ?auto_330043 ?auto_330052 ) ) ( not ( = ?auto_330043 ?auto_330053 ) ) ( not ( = ?auto_330043 ?auto_330054 ) ) ( not ( = ?auto_330044 ?auto_330045 ) ) ( not ( = ?auto_330044 ?auto_330046 ) ) ( not ( = ?auto_330044 ?auto_330047 ) ) ( not ( = ?auto_330044 ?auto_330048 ) ) ( not ( = ?auto_330044 ?auto_330049 ) ) ( not ( = ?auto_330044 ?auto_330050 ) ) ( not ( = ?auto_330044 ?auto_330051 ) ) ( not ( = ?auto_330044 ?auto_330052 ) ) ( not ( = ?auto_330044 ?auto_330053 ) ) ( not ( = ?auto_330044 ?auto_330054 ) ) ( not ( = ?auto_330045 ?auto_330046 ) ) ( not ( = ?auto_330045 ?auto_330047 ) ) ( not ( = ?auto_330045 ?auto_330048 ) ) ( not ( = ?auto_330045 ?auto_330049 ) ) ( not ( = ?auto_330045 ?auto_330050 ) ) ( not ( = ?auto_330045 ?auto_330051 ) ) ( not ( = ?auto_330045 ?auto_330052 ) ) ( not ( = ?auto_330045 ?auto_330053 ) ) ( not ( = ?auto_330045 ?auto_330054 ) ) ( not ( = ?auto_330046 ?auto_330047 ) ) ( not ( = ?auto_330046 ?auto_330048 ) ) ( not ( = ?auto_330046 ?auto_330049 ) ) ( not ( = ?auto_330046 ?auto_330050 ) ) ( not ( = ?auto_330046 ?auto_330051 ) ) ( not ( = ?auto_330046 ?auto_330052 ) ) ( not ( = ?auto_330046 ?auto_330053 ) ) ( not ( = ?auto_330046 ?auto_330054 ) ) ( not ( = ?auto_330047 ?auto_330048 ) ) ( not ( = ?auto_330047 ?auto_330049 ) ) ( not ( = ?auto_330047 ?auto_330050 ) ) ( not ( = ?auto_330047 ?auto_330051 ) ) ( not ( = ?auto_330047 ?auto_330052 ) ) ( not ( = ?auto_330047 ?auto_330053 ) ) ( not ( = ?auto_330047 ?auto_330054 ) ) ( not ( = ?auto_330048 ?auto_330049 ) ) ( not ( = ?auto_330048 ?auto_330050 ) ) ( not ( = ?auto_330048 ?auto_330051 ) ) ( not ( = ?auto_330048 ?auto_330052 ) ) ( not ( = ?auto_330048 ?auto_330053 ) ) ( not ( = ?auto_330048 ?auto_330054 ) ) ( not ( = ?auto_330049 ?auto_330050 ) ) ( not ( = ?auto_330049 ?auto_330051 ) ) ( not ( = ?auto_330049 ?auto_330052 ) ) ( not ( = ?auto_330049 ?auto_330053 ) ) ( not ( = ?auto_330049 ?auto_330054 ) ) ( not ( = ?auto_330050 ?auto_330051 ) ) ( not ( = ?auto_330050 ?auto_330052 ) ) ( not ( = ?auto_330050 ?auto_330053 ) ) ( not ( = ?auto_330050 ?auto_330054 ) ) ( not ( = ?auto_330051 ?auto_330052 ) ) ( not ( = ?auto_330051 ?auto_330053 ) ) ( not ( = ?auto_330051 ?auto_330054 ) ) ( not ( = ?auto_330052 ?auto_330053 ) ) ( not ( = ?auto_330052 ?auto_330054 ) ) ( not ( = ?auto_330053 ?auto_330054 ) ) ( ON ?auto_330052 ?auto_330053 ) ( ON ?auto_330051 ?auto_330052 ) ( ON ?auto_330050 ?auto_330051 ) ( CLEAR ?auto_330048 ) ( ON ?auto_330049 ?auto_330050 ) ( CLEAR ?auto_330049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_330040 ?auto_330041 ?auto_330042 ?auto_330043 ?auto_330044 ?auto_330045 ?auto_330046 ?auto_330047 ?auto_330048 ?auto_330049 )
      ( MAKE-14PILE ?auto_330040 ?auto_330041 ?auto_330042 ?auto_330043 ?auto_330044 ?auto_330045 ?auto_330046 ?auto_330047 ?auto_330048 ?auto_330049 ?auto_330050 ?auto_330051 ?auto_330052 ?auto_330053 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330069 - BLOCK
      ?auto_330070 - BLOCK
      ?auto_330071 - BLOCK
      ?auto_330072 - BLOCK
      ?auto_330073 - BLOCK
      ?auto_330074 - BLOCK
      ?auto_330075 - BLOCK
      ?auto_330076 - BLOCK
      ?auto_330077 - BLOCK
      ?auto_330078 - BLOCK
      ?auto_330079 - BLOCK
      ?auto_330080 - BLOCK
      ?auto_330081 - BLOCK
      ?auto_330082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330082 ) ( ON-TABLE ?auto_330069 ) ( ON ?auto_330070 ?auto_330069 ) ( ON ?auto_330071 ?auto_330070 ) ( ON ?auto_330072 ?auto_330071 ) ( ON ?auto_330073 ?auto_330072 ) ( ON ?auto_330074 ?auto_330073 ) ( ON ?auto_330075 ?auto_330074 ) ( ON ?auto_330076 ?auto_330075 ) ( ON ?auto_330077 ?auto_330076 ) ( not ( = ?auto_330069 ?auto_330070 ) ) ( not ( = ?auto_330069 ?auto_330071 ) ) ( not ( = ?auto_330069 ?auto_330072 ) ) ( not ( = ?auto_330069 ?auto_330073 ) ) ( not ( = ?auto_330069 ?auto_330074 ) ) ( not ( = ?auto_330069 ?auto_330075 ) ) ( not ( = ?auto_330069 ?auto_330076 ) ) ( not ( = ?auto_330069 ?auto_330077 ) ) ( not ( = ?auto_330069 ?auto_330078 ) ) ( not ( = ?auto_330069 ?auto_330079 ) ) ( not ( = ?auto_330069 ?auto_330080 ) ) ( not ( = ?auto_330069 ?auto_330081 ) ) ( not ( = ?auto_330069 ?auto_330082 ) ) ( not ( = ?auto_330070 ?auto_330071 ) ) ( not ( = ?auto_330070 ?auto_330072 ) ) ( not ( = ?auto_330070 ?auto_330073 ) ) ( not ( = ?auto_330070 ?auto_330074 ) ) ( not ( = ?auto_330070 ?auto_330075 ) ) ( not ( = ?auto_330070 ?auto_330076 ) ) ( not ( = ?auto_330070 ?auto_330077 ) ) ( not ( = ?auto_330070 ?auto_330078 ) ) ( not ( = ?auto_330070 ?auto_330079 ) ) ( not ( = ?auto_330070 ?auto_330080 ) ) ( not ( = ?auto_330070 ?auto_330081 ) ) ( not ( = ?auto_330070 ?auto_330082 ) ) ( not ( = ?auto_330071 ?auto_330072 ) ) ( not ( = ?auto_330071 ?auto_330073 ) ) ( not ( = ?auto_330071 ?auto_330074 ) ) ( not ( = ?auto_330071 ?auto_330075 ) ) ( not ( = ?auto_330071 ?auto_330076 ) ) ( not ( = ?auto_330071 ?auto_330077 ) ) ( not ( = ?auto_330071 ?auto_330078 ) ) ( not ( = ?auto_330071 ?auto_330079 ) ) ( not ( = ?auto_330071 ?auto_330080 ) ) ( not ( = ?auto_330071 ?auto_330081 ) ) ( not ( = ?auto_330071 ?auto_330082 ) ) ( not ( = ?auto_330072 ?auto_330073 ) ) ( not ( = ?auto_330072 ?auto_330074 ) ) ( not ( = ?auto_330072 ?auto_330075 ) ) ( not ( = ?auto_330072 ?auto_330076 ) ) ( not ( = ?auto_330072 ?auto_330077 ) ) ( not ( = ?auto_330072 ?auto_330078 ) ) ( not ( = ?auto_330072 ?auto_330079 ) ) ( not ( = ?auto_330072 ?auto_330080 ) ) ( not ( = ?auto_330072 ?auto_330081 ) ) ( not ( = ?auto_330072 ?auto_330082 ) ) ( not ( = ?auto_330073 ?auto_330074 ) ) ( not ( = ?auto_330073 ?auto_330075 ) ) ( not ( = ?auto_330073 ?auto_330076 ) ) ( not ( = ?auto_330073 ?auto_330077 ) ) ( not ( = ?auto_330073 ?auto_330078 ) ) ( not ( = ?auto_330073 ?auto_330079 ) ) ( not ( = ?auto_330073 ?auto_330080 ) ) ( not ( = ?auto_330073 ?auto_330081 ) ) ( not ( = ?auto_330073 ?auto_330082 ) ) ( not ( = ?auto_330074 ?auto_330075 ) ) ( not ( = ?auto_330074 ?auto_330076 ) ) ( not ( = ?auto_330074 ?auto_330077 ) ) ( not ( = ?auto_330074 ?auto_330078 ) ) ( not ( = ?auto_330074 ?auto_330079 ) ) ( not ( = ?auto_330074 ?auto_330080 ) ) ( not ( = ?auto_330074 ?auto_330081 ) ) ( not ( = ?auto_330074 ?auto_330082 ) ) ( not ( = ?auto_330075 ?auto_330076 ) ) ( not ( = ?auto_330075 ?auto_330077 ) ) ( not ( = ?auto_330075 ?auto_330078 ) ) ( not ( = ?auto_330075 ?auto_330079 ) ) ( not ( = ?auto_330075 ?auto_330080 ) ) ( not ( = ?auto_330075 ?auto_330081 ) ) ( not ( = ?auto_330075 ?auto_330082 ) ) ( not ( = ?auto_330076 ?auto_330077 ) ) ( not ( = ?auto_330076 ?auto_330078 ) ) ( not ( = ?auto_330076 ?auto_330079 ) ) ( not ( = ?auto_330076 ?auto_330080 ) ) ( not ( = ?auto_330076 ?auto_330081 ) ) ( not ( = ?auto_330076 ?auto_330082 ) ) ( not ( = ?auto_330077 ?auto_330078 ) ) ( not ( = ?auto_330077 ?auto_330079 ) ) ( not ( = ?auto_330077 ?auto_330080 ) ) ( not ( = ?auto_330077 ?auto_330081 ) ) ( not ( = ?auto_330077 ?auto_330082 ) ) ( not ( = ?auto_330078 ?auto_330079 ) ) ( not ( = ?auto_330078 ?auto_330080 ) ) ( not ( = ?auto_330078 ?auto_330081 ) ) ( not ( = ?auto_330078 ?auto_330082 ) ) ( not ( = ?auto_330079 ?auto_330080 ) ) ( not ( = ?auto_330079 ?auto_330081 ) ) ( not ( = ?auto_330079 ?auto_330082 ) ) ( not ( = ?auto_330080 ?auto_330081 ) ) ( not ( = ?auto_330080 ?auto_330082 ) ) ( not ( = ?auto_330081 ?auto_330082 ) ) ( ON ?auto_330081 ?auto_330082 ) ( ON ?auto_330080 ?auto_330081 ) ( ON ?auto_330079 ?auto_330080 ) ( CLEAR ?auto_330077 ) ( ON ?auto_330078 ?auto_330079 ) ( CLEAR ?auto_330078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_330069 ?auto_330070 ?auto_330071 ?auto_330072 ?auto_330073 ?auto_330074 ?auto_330075 ?auto_330076 ?auto_330077 ?auto_330078 )
      ( MAKE-14PILE ?auto_330069 ?auto_330070 ?auto_330071 ?auto_330072 ?auto_330073 ?auto_330074 ?auto_330075 ?auto_330076 ?auto_330077 ?auto_330078 ?auto_330079 ?auto_330080 ?auto_330081 ?auto_330082 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330097 - BLOCK
      ?auto_330098 - BLOCK
      ?auto_330099 - BLOCK
      ?auto_330100 - BLOCK
      ?auto_330101 - BLOCK
      ?auto_330102 - BLOCK
      ?auto_330103 - BLOCK
      ?auto_330104 - BLOCK
      ?auto_330105 - BLOCK
      ?auto_330106 - BLOCK
      ?auto_330107 - BLOCK
      ?auto_330108 - BLOCK
      ?auto_330109 - BLOCK
      ?auto_330110 - BLOCK
    )
    :vars
    (
      ?auto_330111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330110 ?auto_330111 ) ( ON-TABLE ?auto_330097 ) ( ON ?auto_330098 ?auto_330097 ) ( ON ?auto_330099 ?auto_330098 ) ( ON ?auto_330100 ?auto_330099 ) ( ON ?auto_330101 ?auto_330100 ) ( ON ?auto_330102 ?auto_330101 ) ( ON ?auto_330103 ?auto_330102 ) ( ON ?auto_330104 ?auto_330103 ) ( not ( = ?auto_330097 ?auto_330098 ) ) ( not ( = ?auto_330097 ?auto_330099 ) ) ( not ( = ?auto_330097 ?auto_330100 ) ) ( not ( = ?auto_330097 ?auto_330101 ) ) ( not ( = ?auto_330097 ?auto_330102 ) ) ( not ( = ?auto_330097 ?auto_330103 ) ) ( not ( = ?auto_330097 ?auto_330104 ) ) ( not ( = ?auto_330097 ?auto_330105 ) ) ( not ( = ?auto_330097 ?auto_330106 ) ) ( not ( = ?auto_330097 ?auto_330107 ) ) ( not ( = ?auto_330097 ?auto_330108 ) ) ( not ( = ?auto_330097 ?auto_330109 ) ) ( not ( = ?auto_330097 ?auto_330110 ) ) ( not ( = ?auto_330097 ?auto_330111 ) ) ( not ( = ?auto_330098 ?auto_330099 ) ) ( not ( = ?auto_330098 ?auto_330100 ) ) ( not ( = ?auto_330098 ?auto_330101 ) ) ( not ( = ?auto_330098 ?auto_330102 ) ) ( not ( = ?auto_330098 ?auto_330103 ) ) ( not ( = ?auto_330098 ?auto_330104 ) ) ( not ( = ?auto_330098 ?auto_330105 ) ) ( not ( = ?auto_330098 ?auto_330106 ) ) ( not ( = ?auto_330098 ?auto_330107 ) ) ( not ( = ?auto_330098 ?auto_330108 ) ) ( not ( = ?auto_330098 ?auto_330109 ) ) ( not ( = ?auto_330098 ?auto_330110 ) ) ( not ( = ?auto_330098 ?auto_330111 ) ) ( not ( = ?auto_330099 ?auto_330100 ) ) ( not ( = ?auto_330099 ?auto_330101 ) ) ( not ( = ?auto_330099 ?auto_330102 ) ) ( not ( = ?auto_330099 ?auto_330103 ) ) ( not ( = ?auto_330099 ?auto_330104 ) ) ( not ( = ?auto_330099 ?auto_330105 ) ) ( not ( = ?auto_330099 ?auto_330106 ) ) ( not ( = ?auto_330099 ?auto_330107 ) ) ( not ( = ?auto_330099 ?auto_330108 ) ) ( not ( = ?auto_330099 ?auto_330109 ) ) ( not ( = ?auto_330099 ?auto_330110 ) ) ( not ( = ?auto_330099 ?auto_330111 ) ) ( not ( = ?auto_330100 ?auto_330101 ) ) ( not ( = ?auto_330100 ?auto_330102 ) ) ( not ( = ?auto_330100 ?auto_330103 ) ) ( not ( = ?auto_330100 ?auto_330104 ) ) ( not ( = ?auto_330100 ?auto_330105 ) ) ( not ( = ?auto_330100 ?auto_330106 ) ) ( not ( = ?auto_330100 ?auto_330107 ) ) ( not ( = ?auto_330100 ?auto_330108 ) ) ( not ( = ?auto_330100 ?auto_330109 ) ) ( not ( = ?auto_330100 ?auto_330110 ) ) ( not ( = ?auto_330100 ?auto_330111 ) ) ( not ( = ?auto_330101 ?auto_330102 ) ) ( not ( = ?auto_330101 ?auto_330103 ) ) ( not ( = ?auto_330101 ?auto_330104 ) ) ( not ( = ?auto_330101 ?auto_330105 ) ) ( not ( = ?auto_330101 ?auto_330106 ) ) ( not ( = ?auto_330101 ?auto_330107 ) ) ( not ( = ?auto_330101 ?auto_330108 ) ) ( not ( = ?auto_330101 ?auto_330109 ) ) ( not ( = ?auto_330101 ?auto_330110 ) ) ( not ( = ?auto_330101 ?auto_330111 ) ) ( not ( = ?auto_330102 ?auto_330103 ) ) ( not ( = ?auto_330102 ?auto_330104 ) ) ( not ( = ?auto_330102 ?auto_330105 ) ) ( not ( = ?auto_330102 ?auto_330106 ) ) ( not ( = ?auto_330102 ?auto_330107 ) ) ( not ( = ?auto_330102 ?auto_330108 ) ) ( not ( = ?auto_330102 ?auto_330109 ) ) ( not ( = ?auto_330102 ?auto_330110 ) ) ( not ( = ?auto_330102 ?auto_330111 ) ) ( not ( = ?auto_330103 ?auto_330104 ) ) ( not ( = ?auto_330103 ?auto_330105 ) ) ( not ( = ?auto_330103 ?auto_330106 ) ) ( not ( = ?auto_330103 ?auto_330107 ) ) ( not ( = ?auto_330103 ?auto_330108 ) ) ( not ( = ?auto_330103 ?auto_330109 ) ) ( not ( = ?auto_330103 ?auto_330110 ) ) ( not ( = ?auto_330103 ?auto_330111 ) ) ( not ( = ?auto_330104 ?auto_330105 ) ) ( not ( = ?auto_330104 ?auto_330106 ) ) ( not ( = ?auto_330104 ?auto_330107 ) ) ( not ( = ?auto_330104 ?auto_330108 ) ) ( not ( = ?auto_330104 ?auto_330109 ) ) ( not ( = ?auto_330104 ?auto_330110 ) ) ( not ( = ?auto_330104 ?auto_330111 ) ) ( not ( = ?auto_330105 ?auto_330106 ) ) ( not ( = ?auto_330105 ?auto_330107 ) ) ( not ( = ?auto_330105 ?auto_330108 ) ) ( not ( = ?auto_330105 ?auto_330109 ) ) ( not ( = ?auto_330105 ?auto_330110 ) ) ( not ( = ?auto_330105 ?auto_330111 ) ) ( not ( = ?auto_330106 ?auto_330107 ) ) ( not ( = ?auto_330106 ?auto_330108 ) ) ( not ( = ?auto_330106 ?auto_330109 ) ) ( not ( = ?auto_330106 ?auto_330110 ) ) ( not ( = ?auto_330106 ?auto_330111 ) ) ( not ( = ?auto_330107 ?auto_330108 ) ) ( not ( = ?auto_330107 ?auto_330109 ) ) ( not ( = ?auto_330107 ?auto_330110 ) ) ( not ( = ?auto_330107 ?auto_330111 ) ) ( not ( = ?auto_330108 ?auto_330109 ) ) ( not ( = ?auto_330108 ?auto_330110 ) ) ( not ( = ?auto_330108 ?auto_330111 ) ) ( not ( = ?auto_330109 ?auto_330110 ) ) ( not ( = ?auto_330109 ?auto_330111 ) ) ( not ( = ?auto_330110 ?auto_330111 ) ) ( ON ?auto_330109 ?auto_330110 ) ( ON ?auto_330108 ?auto_330109 ) ( ON ?auto_330107 ?auto_330108 ) ( ON ?auto_330106 ?auto_330107 ) ( CLEAR ?auto_330104 ) ( ON ?auto_330105 ?auto_330106 ) ( CLEAR ?auto_330105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_330097 ?auto_330098 ?auto_330099 ?auto_330100 ?auto_330101 ?auto_330102 ?auto_330103 ?auto_330104 ?auto_330105 )
      ( MAKE-14PILE ?auto_330097 ?auto_330098 ?auto_330099 ?auto_330100 ?auto_330101 ?auto_330102 ?auto_330103 ?auto_330104 ?auto_330105 ?auto_330106 ?auto_330107 ?auto_330108 ?auto_330109 ?auto_330110 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330126 - BLOCK
      ?auto_330127 - BLOCK
      ?auto_330128 - BLOCK
      ?auto_330129 - BLOCK
      ?auto_330130 - BLOCK
      ?auto_330131 - BLOCK
      ?auto_330132 - BLOCK
      ?auto_330133 - BLOCK
      ?auto_330134 - BLOCK
      ?auto_330135 - BLOCK
      ?auto_330136 - BLOCK
      ?auto_330137 - BLOCK
      ?auto_330138 - BLOCK
      ?auto_330139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330139 ) ( ON-TABLE ?auto_330126 ) ( ON ?auto_330127 ?auto_330126 ) ( ON ?auto_330128 ?auto_330127 ) ( ON ?auto_330129 ?auto_330128 ) ( ON ?auto_330130 ?auto_330129 ) ( ON ?auto_330131 ?auto_330130 ) ( ON ?auto_330132 ?auto_330131 ) ( ON ?auto_330133 ?auto_330132 ) ( not ( = ?auto_330126 ?auto_330127 ) ) ( not ( = ?auto_330126 ?auto_330128 ) ) ( not ( = ?auto_330126 ?auto_330129 ) ) ( not ( = ?auto_330126 ?auto_330130 ) ) ( not ( = ?auto_330126 ?auto_330131 ) ) ( not ( = ?auto_330126 ?auto_330132 ) ) ( not ( = ?auto_330126 ?auto_330133 ) ) ( not ( = ?auto_330126 ?auto_330134 ) ) ( not ( = ?auto_330126 ?auto_330135 ) ) ( not ( = ?auto_330126 ?auto_330136 ) ) ( not ( = ?auto_330126 ?auto_330137 ) ) ( not ( = ?auto_330126 ?auto_330138 ) ) ( not ( = ?auto_330126 ?auto_330139 ) ) ( not ( = ?auto_330127 ?auto_330128 ) ) ( not ( = ?auto_330127 ?auto_330129 ) ) ( not ( = ?auto_330127 ?auto_330130 ) ) ( not ( = ?auto_330127 ?auto_330131 ) ) ( not ( = ?auto_330127 ?auto_330132 ) ) ( not ( = ?auto_330127 ?auto_330133 ) ) ( not ( = ?auto_330127 ?auto_330134 ) ) ( not ( = ?auto_330127 ?auto_330135 ) ) ( not ( = ?auto_330127 ?auto_330136 ) ) ( not ( = ?auto_330127 ?auto_330137 ) ) ( not ( = ?auto_330127 ?auto_330138 ) ) ( not ( = ?auto_330127 ?auto_330139 ) ) ( not ( = ?auto_330128 ?auto_330129 ) ) ( not ( = ?auto_330128 ?auto_330130 ) ) ( not ( = ?auto_330128 ?auto_330131 ) ) ( not ( = ?auto_330128 ?auto_330132 ) ) ( not ( = ?auto_330128 ?auto_330133 ) ) ( not ( = ?auto_330128 ?auto_330134 ) ) ( not ( = ?auto_330128 ?auto_330135 ) ) ( not ( = ?auto_330128 ?auto_330136 ) ) ( not ( = ?auto_330128 ?auto_330137 ) ) ( not ( = ?auto_330128 ?auto_330138 ) ) ( not ( = ?auto_330128 ?auto_330139 ) ) ( not ( = ?auto_330129 ?auto_330130 ) ) ( not ( = ?auto_330129 ?auto_330131 ) ) ( not ( = ?auto_330129 ?auto_330132 ) ) ( not ( = ?auto_330129 ?auto_330133 ) ) ( not ( = ?auto_330129 ?auto_330134 ) ) ( not ( = ?auto_330129 ?auto_330135 ) ) ( not ( = ?auto_330129 ?auto_330136 ) ) ( not ( = ?auto_330129 ?auto_330137 ) ) ( not ( = ?auto_330129 ?auto_330138 ) ) ( not ( = ?auto_330129 ?auto_330139 ) ) ( not ( = ?auto_330130 ?auto_330131 ) ) ( not ( = ?auto_330130 ?auto_330132 ) ) ( not ( = ?auto_330130 ?auto_330133 ) ) ( not ( = ?auto_330130 ?auto_330134 ) ) ( not ( = ?auto_330130 ?auto_330135 ) ) ( not ( = ?auto_330130 ?auto_330136 ) ) ( not ( = ?auto_330130 ?auto_330137 ) ) ( not ( = ?auto_330130 ?auto_330138 ) ) ( not ( = ?auto_330130 ?auto_330139 ) ) ( not ( = ?auto_330131 ?auto_330132 ) ) ( not ( = ?auto_330131 ?auto_330133 ) ) ( not ( = ?auto_330131 ?auto_330134 ) ) ( not ( = ?auto_330131 ?auto_330135 ) ) ( not ( = ?auto_330131 ?auto_330136 ) ) ( not ( = ?auto_330131 ?auto_330137 ) ) ( not ( = ?auto_330131 ?auto_330138 ) ) ( not ( = ?auto_330131 ?auto_330139 ) ) ( not ( = ?auto_330132 ?auto_330133 ) ) ( not ( = ?auto_330132 ?auto_330134 ) ) ( not ( = ?auto_330132 ?auto_330135 ) ) ( not ( = ?auto_330132 ?auto_330136 ) ) ( not ( = ?auto_330132 ?auto_330137 ) ) ( not ( = ?auto_330132 ?auto_330138 ) ) ( not ( = ?auto_330132 ?auto_330139 ) ) ( not ( = ?auto_330133 ?auto_330134 ) ) ( not ( = ?auto_330133 ?auto_330135 ) ) ( not ( = ?auto_330133 ?auto_330136 ) ) ( not ( = ?auto_330133 ?auto_330137 ) ) ( not ( = ?auto_330133 ?auto_330138 ) ) ( not ( = ?auto_330133 ?auto_330139 ) ) ( not ( = ?auto_330134 ?auto_330135 ) ) ( not ( = ?auto_330134 ?auto_330136 ) ) ( not ( = ?auto_330134 ?auto_330137 ) ) ( not ( = ?auto_330134 ?auto_330138 ) ) ( not ( = ?auto_330134 ?auto_330139 ) ) ( not ( = ?auto_330135 ?auto_330136 ) ) ( not ( = ?auto_330135 ?auto_330137 ) ) ( not ( = ?auto_330135 ?auto_330138 ) ) ( not ( = ?auto_330135 ?auto_330139 ) ) ( not ( = ?auto_330136 ?auto_330137 ) ) ( not ( = ?auto_330136 ?auto_330138 ) ) ( not ( = ?auto_330136 ?auto_330139 ) ) ( not ( = ?auto_330137 ?auto_330138 ) ) ( not ( = ?auto_330137 ?auto_330139 ) ) ( not ( = ?auto_330138 ?auto_330139 ) ) ( ON ?auto_330138 ?auto_330139 ) ( ON ?auto_330137 ?auto_330138 ) ( ON ?auto_330136 ?auto_330137 ) ( ON ?auto_330135 ?auto_330136 ) ( CLEAR ?auto_330133 ) ( ON ?auto_330134 ?auto_330135 ) ( CLEAR ?auto_330134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_330126 ?auto_330127 ?auto_330128 ?auto_330129 ?auto_330130 ?auto_330131 ?auto_330132 ?auto_330133 ?auto_330134 )
      ( MAKE-14PILE ?auto_330126 ?auto_330127 ?auto_330128 ?auto_330129 ?auto_330130 ?auto_330131 ?auto_330132 ?auto_330133 ?auto_330134 ?auto_330135 ?auto_330136 ?auto_330137 ?auto_330138 ?auto_330139 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330154 - BLOCK
      ?auto_330155 - BLOCK
      ?auto_330156 - BLOCK
      ?auto_330157 - BLOCK
      ?auto_330158 - BLOCK
      ?auto_330159 - BLOCK
      ?auto_330160 - BLOCK
      ?auto_330161 - BLOCK
      ?auto_330162 - BLOCK
      ?auto_330163 - BLOCK
      ?auto_330164 - BLOCK
      ?auto_330165 - BLOCK
      ?auto_330166 - BLOCK
      ?auto_330167 - BLOCK
    )
    :vars
    (
      ?auto_330168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330167 ?auto_330168 ) ( ON-TABLE ?auto_330154 ) ( ON ?auto_330155 ?auto_330154 ) ( ON ?auto_330156 ?auto_330155 ) ( ON ?auto_330157 ?auto_330156 ) ( ON ?auto_330158 ?auto_330157 ) ( ON ?auto_330159 ?auto_330158 ) ( ON ?auto_330160 ?auto_330159 ) ( not ( = ?auto_330154 ?auto_330155 ) ) ( not ( = ?auto_330154 ?auto_330156 ) ) ( not ( = ?auto_330154 ?auto_330157 ) ) ( not ( = ?auto_330154 ?auto_330158 ) ) ( not ( = ?auto_330154 ?auto_330159 ) ) ( not ( = ?auto_330154 ?auto_330160 ) ) ( not ( = ?auto_330154 ?auto_330161 ) ) ( not ( = ?auto_330154 ?auto_330162 ) ) ( not ( = ?auto_330154 ?auto_330163 ) ) ( not ( = ?auto_330154 ?auto_330164 ) ) ( not ( = ?auto_330154 ?auto_330165 ) ) ( not ( = ?auto_330154 ?auto_330166 ) ) ( not ( = ?auto_330154 ?auto_330167 ) ) ( not ( = ?auto_330154 ?auto_330168 ) ) ( not ( = ?auto_330155 ?auto_330156 ) ) ( not ( = ?auto_330155 ?auto_330157 ) ) ( not ( = ?auto_330155 ?auto_330158 ) ) ( not ( = ?auto_330155 ?auto_330159 ) ) ( not ( = ?auto_330155 ?auto_330160 ) ) ( not ( = ?auto_330155 ?auto_330161 ) ) ( not ( = ?auto_330155 ?auto_330162 ) ) ( not ( = ?auto_330155 ?auto_330163 ) ) ( not ( = ?auto_330155 ?auto_330164 ) ) ( not ( = ?auto_330155 ?auto_330165 ) ) ( not ( = ?auto_330155 ?auto_330166 ) ) ( not ( = ?auto_330155 ?auto_330167 ) ) ( not ( = ?auto_330155 ?auto_330168 ) ) ( not ( = ?auto_330156 ?auto_330157 ) ) ( not ( = ?auto_330156 ?auto_330158 ) ) ( not ( = ?auto_330156 ?auto_330159 ) ) ( not ( = ?auto_330156 ?auto_330160 ) ) ( not ( = ?auto_330156 ?auto_330161 ) ) ( not ( = ?auto_330156 ?auto_330162 ) ) ( not ( = ?auto_330156 ?auto_330163 ) ) ( not ( = ?auto_330156 ?auto_330164 ) ) ( not ( = ?auto_330156 ?auto_330165 ) ) ( not ( = ?auto_330156 ?auto_330166 ) ) ( not ( = ?auto_330156 ?auto_330167 ) ) ( not ( = ?auto_330156 ?auto_330168 ) ) ( not ( = ?auto_330157 ?auto_330158 ) ) ( not ( = ?auto_330157 ?auto_330159 ) ) ( not ( = ?auto_330157 ?auto_330160 ) ) ( not ( = ?auto_330157 ?auto_330161 ) ) ( not ( = ?auto_330157 ?auto_330162 ) ) ( not ( = ?auto_330157 ?auto_330163 ) ) ( not ( = ?auto_330157 ?auto_330164 ) ) ( not ( = ?auto_330157 ?auto_330165 ) ) ( not ( = ?auto_330157 ?auto_330166 ) ) ( not ( = ?auto_330157 ?auto_330167 ) ) ( not ( = ?auto_330157 ?auto_330168 ) ) ( not ( = ?auto_330158 ?auto_330159 ) ) ( not ( = ?auto_330158 ?auto_330160 ) ) ( not ( = ?auto_330158 ?auto_330161 ) ) ( not ( = ?auto_330158 ?auto_330162 ) ) ( not ( = ?auto_330158 ?auto_330163 ) ) ( not ( = ?auto_330158 ?auto_330164 ) ) ( not ( = ?auto_330158 ?auto_330165 ) ) ( not ( = ?auto_330158 ?auto_330166 ) ) ( not ( = ?auto_330158 ?auto_330167 ) ) ( not ( = ?auto_330158 ?auto_330168 ) ) ( not ( = ?auto_330159 ?auto_330160 ) ) ( not ( = ?auto_330159 ?auto_330161 ) ) ( not ( = ?auto_330159 ?auto_330162 ) ) ( not ( = ?auto_330159 ?auto_330163 ) ) ( not ( = ?auto_330159 ?auto_330164 ) ) ( not ( = ?auto_330159 ?auto_330165 ) ) ( not ( = ?auto_330159 ?auto_330166 ) ) ( not ( = ?auto_330159 ?auto_330167 ) ) ( not ( = ?auto_330159 ?auto_330168 ) ) ( not ( = ?auto_330160 ?auto_330161 ) ) ( not ( = ?auto_330160 ?auto_330162 ) ) ( not ( = ?auto_330160 ?auto_330163 ) ) ( not ( = ?auto_330160 ?auto_330164 ) ) ( not ( = ?auto_330160 ?auto_330165 ) ) ( not ( = ?auto_330160 ?auto_330166 ) ) ( not ( = ?auto_330160 ?auto_330167 ) ) ( not ( = ?auto_330160 ?auto_330168 ) ) ( not ( = ?auto_330161 ?auto_330162 ) ) ( not ( = ?auto_330161 ?auto_330163 ) ) ( not ( = ?auto_330161 ?auto_330164 ) ) ( not ( = ?auto_330161 ?auto_330165 ) ) ( not ( = ?auto_330161 ?auto_330166 ) ) ( not ( = ?auto_330161 ?auto_330167 ) ) ( not ( = ?auto_330161 ?auto_330168 ) ) ( not ( = ?auto_330162 ?auto_330163 ) ) ( not ( = ?auto_330162 ?auto_330164 ) ) ( not ( = ?auto_330162 ?auto_330165 ) ) ( not ( = ?auto_330162 ?auto_330166 ) ) ( not ( = ?auto_330162 ?auto_330167 ) ) ( not ( = ?auto_330162 ?auto_330168 ) ) ( not ( = ?auto_330163 ?auto_330164 ) ) ( not ( = ?auto_330163 ?auto_330165 ) ) ( not ( = ?auto_330163 ?auto_330166 ) ) ( not ( = ?auto_330163 ?auto_330167 ) ) ( not ( = ?auto_330163 ?auto_330168 ) ) ( not ( = ?auto_330164 ?auto_330165 ) ) ( not ( = ?auto_330164 ?auto_330166 ) ) ( not ( = ?auto_330164 ?auto_330167 ) ) ( not ( = ?auto_330164 ?auto_330168 ) ) ( not ( = ?auto_330165 ?auto_330166 ) ) ( not ( = ?auto_330165 ?auto_330167 ) ) ( not ( = ?auto_330165 ?auto_330168 ) ) ( not ( = ?auto_330166 ?auto_330167 ) ) ( not ( = ?auto_330166 ?auto_330168 ) ) ( not ( = ?auto_330167 ?auto_330168 ) ) ( ON ?auto_330166 ?auto_330167 ) ( ON ?auto_330165 ?auto_330166 ) ( ON ?auto_330164 ?auto_330165 ) ( ON ?auto_330163 ?auto_330164 ) ( ON ?auto_330162 ?auto_330163 ) ( CLEAR ?auto_330160 ) ( ON ?auto_330161 ?auto_330162 ) ( CLEAR ?auto_330161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_330154 ?auto_330155 ?auto_330156 ?auto_330157 ?auto_330158 ?auto_330159 ?auto_330160 ?auto_330161 )
      ( MAKE-14PILE ?auto_330154 ?auto_330155 ?auto_330156 ?auto_330157 ?auto_330158 ?auto_330159 ?auto_330160 ?auto_330161 ?auto_330162 ?auto_330163 ?auto_330164 ?auto_330165 ?auto_330166 ?auto_330167 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330183 - BLOCK
      ?auto_330184 - BLOCK
      ?auto_330185 - BLOCK
      ?auto_330186 - BLOCK
      ?auto_330187 - BLOCK
      ?auto_330188 - BLOCK
      ?auto_330189 - BLOCK
      ?auto_330190 - BLOCK
      ?auto_330191 - BLOCK
      ?auto_330192 - BLOCK
      ?auto_330193 - BLOCK
      ?auto_330194 - BLOCK
      ?auto_330195 - BLOCK
      ?auto_330196 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330196 ) ( ON-TABLE ?auto_330183 ) ( ON ?auto_330184 ?auto_330183 ) ( ON ?auto_330185 ?auto_330184 ) ( ON ?auto_330186 ?auto_330185 ) ( ON ?auto_330187 ?auto_330186 ) ( ON ?auto_330188 ?auto_330187 ) ( ON ?auto_330189 ?auto_330188 ) ( not ( = ?auto_330183 ?auto_330184 ) ) ( not ( = ?auto_330183 ?auto_330185 ) ) ( not ( = ?auto_330183 ?auto_330186 ) ) ( not ( = ?auto_330183 ?auto_330187 ) ) ( not ( = ?auto_330183 ?auto_330188 ) ) ( not ( = ?auto_330183 ?auto_330189 ) ) ( not ( = ?auto_330183 ?auto_330190 ) ) ( not ( = ?auto_330183 ?auto_330191 ) ) ( not ( = ?auto_330183 ?auto_330192 ) ) ( not ( = ?auto_330183 ?auto_330193 ) ) ( not ( = ?auto_330183 ?auto_330194 ) ) ( not ( = ?auto_330183 ?auto_330195 ) ) ( not ( = ?auto_330183 ?auto_330196 ) ) ( not ( = ?auto_330184 ?auto_330185 ) ) ( not ( = ?auto_330184 ?auto_330186 ) ) ( not ( = ?auto_330184 ?auto_330187 ) ) ( not ( = ?auto_330184 ?auto_330188 ) ) ( not ( = ?auto_330184 ?auto_330189 ) ) ( not ( = ?auto_330184 ?auto_330190 ) ) ( not ( = ?auto_330184 ?auto_330191 ) ) ( not ( = ?auto_330184 ?auto_330192 ) ) ( not ( = ?auto_330184 ?auto_330193 ) ) ( not ( = ?auto_330184 ?auto_330194 ) ) ( not ( = ?auto_330184 ?auto_330195 ) ) ( not ( = ?auto_330184 ?auto_330196 ) ) ( not ( = ?auto_330185 ?auto_330186 ) ) ( not ( = ?auto_330185 ?auto_330187 ) ) ( not ( = ?auto_330185 ?auto_330188 ) ) ( not ( = ?auto_330185 ?auto_330189 ) ) ( not ( = ?auto_330185 ?auto_330190 ) ) ( not ( = ?auto_330185 ?auto_330191 ) ) ( not ( = ?auto_330185 ?auto_330192 ) ) ( not ( = ?auto_330185 ?auto_330193 ) ) ( not ( = ?auto_330185 ?auto_330194 ) ) ( not ( = ?auto_330185 ?auto_330195 ) ) ( not ( = ?auto_330185 ?auto_330196 ) ) ( not ( = ?auto_330186 ?auto_330187 ) ) ( not ( = ?auto_330186 ?auto_330188 ) ) ( not ( = ?auto_330186 ?auto_330189 ) ) ( not ( = ?auto_330186 ?auto_330190 ) ) ( not ( = ?auto_330186 ?auto_330191 ) ) ( not ( = ?auto_330186 ?auto_330192 ) ) ( not ( = ?auto_330186 ?auto_330193 ) ) ( not ( = ?auto_330186 ?auto_330194 ) ) ( not ( = ?auto_330186 ?auto_330195 ) ) ( not ( = ?auto_330186 ?auto_330196 ) ) ( not ( = ?auto_330187 ?auto_330188 ) ) ( not ( = ?auto_330187 ?auto_330189 ) ) ( not ( = ?auto_330187 ?auto_330190 ) ) ( not ( = ?auto_330187 ?auto_330191 ) ) ( not ( = ?auto_330187 ?auto_330192 ) ) ( not ( = ?auto_330187 ?auto_330193 ) ) ( not ( = ?auto_330187 ?auto_330194 ) ) ( not ( = ?auto_330187 ?auto_330195 ) ) ( not ( = ?auto_330187 ?auto_330196 ) ) ( not ( = ?auto_330188 ?auto_330189 ) ) ( not ( = ?auto_330188 ?auto_330190 ) ) ( not ( = ?auto_330188 ?auto_330191 ) ) ( not ( = ?auto_330188 ?auto_330192 ) ) ( not ( = ?auto_330188 ?auto_330193 ) ) ( not ( = ?auto_330188 ?auto_330194 ) ) ( not ( = ?auto_330188 ?auto_330195 ) ) ( not ( = ?auto_330188 ?auto_330196 ) ) ( not ( = ?auto_330189 ?auto_330190 ) ) ( not ( = ?auto_330189 ?auto_330191 ) ) ( not ( = ?auto_330189 ?auto_330192 ) ) ( not ( = ?auto_330189 ?auto_330193 ) ) ( not ( = ?auto_330189 ?auto_330194 ) ) ( not ( = ?auto_330189 ?auto_330195 ) ) ( not ( = ?auto_330189 ?auto_330196 ) ) ( not ( = ?auto_330190 ?auto_330191 ) ) ( not ( = ?auto_330190 ?auto_330192 ) ) ( not ( = ?auto_330190 ?auto_330193 ) ) ( not ( = ?auto_330190 ?auto_330194 ) ) ( not ( = ?auto_330190 ?auto_330195 ) ) ( not ( = ?auto_330190 ?auto_330196 ) ) ( not ( = ?auto_330191 ?auto_330192 ) ) ( not ( = ?auto_330191 ?auto_330193 ) ) ( not ( = ?auto_330191 ?auto_330194 ) ) ( not ( = ?auto_330191 ?auto_330195 ) ) ( not ( = ?auto_330191 ?auto_330196 ) ) ( not ( = ?auto_330192 ?auto_330193 ) ) ( not ( = ?auto_330192 ?auto_330194 ) ) ( not ( = ?auto_330192 ?auto_330195 ) ) ( not ( = ?auto_330192 ?auto_330196 ) ) ( not ( = ?auto_330193 ?auto_330194 ) ) ( not ( = ?auto_330193 ?auto_330195 ) ) ( not ( = ?auto_330193 ?auto_330196 ) ) ( not ( = ?auto_330194 ?auto_330195 ) ) ( not ( = ?auto_330194 ?auto_330196 ) ) ( not ( = ?auto_330195 ?auto_330196 ) ) ( ON ?auto_330195 ?auto_330196 ) ( ON ?auto_330194 ?auto_330195 ) ( ON ?auto_330193 ?auto_330194 ) ( ON ?auto_330192 ?auto_330193 ) ( ON ?auto_330191 ?auto_330192 ) ( CLEAR ?auto_330189 ) ( ON ?auto_330190 ?auto_330191 ) ( CLEAR ?auto_330190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_330183 ?auto_330184 ?auto_330185 ?auto_330186 ?auto_330187 ?auto_330188 ?auto_330189 ?auto_330190 )
      ( MAKE-14PILE ?auto_330183 ?auto_330184 ?auto_330185 ?auto_330186 ?auto_330187 ?auto_330188 ?auto_330189 ?auto_330190 ?auto_330191 ?auto_330192 ?auto_330193 ?auto_330194 ?auto_330195 ?auto_330196 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330211 - BLOCK
      ?auto_330212 - BLOCK
      ?auto_330213 - BLOCK
      ?auto_330214 - BLOCK
      ?auto_330215 - BLOCK
      ?auto_330216 - BLOCK
      ?auto_330217 - BLOCK
      ?auto_330218 - BLOCK
      ?auto_330219 - BLOCK
      ?auto_330220 - BLOCK
      ?auto_330221 - BLOCK
      ?auto_330222 - BLOCK
      ?auto_330223 - BLOCK
      ?auto_330224 - BLOCK
    )
    :vars
    (
      ?auto_330225 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330224 ?auto_330225 ) ( ON-TABLE ?auto_330211 ) ( ON ?auto_330212 ?auto_330211 ) ( ON ?auto_330213 ?auto_330212 ) ( ON ?auto_330214 ?auto_330213 ) ( ON ?auto_330215 ?auto_330214 ) ( ON ?auto_330216 ?auto_330215 ) ( not ( = ?auto_330211 ?auto_330212 ) ) ( not ( = ?auto_330211 ?auto_330213 ) ) ( not ( = ?auto_330211 ?auto_330214 ) ) ( not ( = ?auto_330211 ?auto_330215 ) ) ( not ( = ?auto_330211 ?auto_330216 ) ) ( not ( = ?auto_330211 ?auto_330217 ) ) ( not ( = ?auto_330211 ?auto_330218 ) ) ( not ( = ?auto_330211 ?auto_330219 ) ) ( not ( = ?auto_330211 ?auto_330220 ) ) ( not ( = ?auto_330211 ?auto_330221 ) ) ( not ( = ?auto_330211 ?auto_330222 ) ) ( not ( = ?auto_330211 ?auto_330223 ) ) ( not ( = ?auto_330211 ?auto_330224 ) ) ( not ( = ?auto_330211 ?auto_330225 ) ) ( not ( = ?auto_330212 ?auto_330213 ) ) ( not ( = ?auto_330212 ?auto_330214 ) ) ( not ( = ?auto_330212 ?auto_330215 ) ) ( not ( = ?auto_330212 ?auto_330216 ) ) ( not ( = ?auto_330212 ?auto_330217 ) ) ( not ( = ?auto_330212 ?auto_330218 ) ) ( not ( = ?auto_330212 ?auto_330219 ) ) ( not ( = ?auto_330212 ?auto_330220 ) ) ( not ( = ?auto_330212 ?auto_330221 ) ) ( not ( = ?auto_330212 ?auto_330222 ) ) ( not ( = ?auto_330212 ?auto_330223 ) ) ( not ( = ?auto_330212 ?auto_330224 ) ) ( not ( = ?auto_330212 ?auto_330225 ) ) ( not ( = ?auto_330213 ?auto_330214 ) ) ( not ( = ?auto_330213 ?auto_330215 ) ) ( not ( = ?auto_330213 ?auto_330216 ) ) ( not ( = ?auto_330213 ?auto_330217 ) ) ( not ( = ?auto_330213 ?auto_330218 ) ) ( not ( = ?auto_330213 ?auto_330219 ) ) ( not ( = ?auto_330213 ?auto_330220 ) ) ( not ( = ?auto_330213 ?auto_330221 ) ) ( not ( = ?auto_330213 ?auto_330222 ) ) ( not ( = ?auto_330213 ?auto_330223 ) ) ( not ( = ?auto_330213 ?auto_330224 ) ) ( not ( = ?auto_330213 ?auto_330225 ) ) ( not ( = ?auto_330214 ?auto_330215 ) ) ( not ( = ?auto_330214 ?auto_330216 ) ) ( not ( = ?auto_330214 ?auto_330217 ) ) ( not ( = ?auto_330214 ?auto_330218 ) ) ( not ( = ?auto_330214 ?auto_330219 ) ) ( not ( = ?auto_330214 ?auto_330220 ) ) ( not ( = ?auto_330214 ?auto_330221 ) ) ( not ( = ?auto_330214 ?auto_330222 ) ) ( not ( = ?auto_330214 ?auto_330223 ) ) ( not ( = ?auto_330214 ?auto_330224 ) ) ( not ( = ?auto_330214 ?auto_330225 ) ) ( not ( = ?auto_330215 ?auto_330216 ) ) ( not ( = ?auto_330215 ?auto_330217 ) ) ( not ( = ?auto_330215 ?auto_330218 ) ) ( not ( = ?auto_330215 ?auto_330219 ) ) ( not ( = ?auto_330215 ?auto_330220 ) ) ( not ( = ?auto_330215 ?auto_330221 ) ) ( not ( = ?auto_330215 ?auto_330222 ) ) ( not ( = ?auto_330215 ?auto_330223 ) ) ( not ( = ?auto_330215 ?auto_330224 ) ) ( not ( = ?auto_330215 ?auto_330225 ) ) ( not ( = ?auto_330216 ?auto_330217 ) ) ( not ( = ?auto_330216 ?auto_330218 ) ) ( not ( = ?auto_330216 ?auto_330219 ) ) ( not ( = ?auto_330216 ?auto_330220 ) ) ( not ( = ?auto_330216 ?auto_330221 ) ) ( not ( = ?auto_330216 ?auto_330222 ) ) ( not ( = ?auto_330216 ?auto_330223 ) ) ( not ( = ?auto_330216 ?auto_330224 ) ) ( not ( = ?auto_330216 ?auto_330225 ) ) ( not ( = ?auto_330217 ?auto_330218 ) ) ( not ( = ?auto_330217 ?auto_330219 ) ) ( not ( = ?auto_330217 ?auto_330220 ) ) ( not ( = ?auto_330217 ?auto_330221 ) ) ( not ( = ?auto_330217 ?auto_330222 ) ) ( not ( = ?auto_330217 ?auto_330223 ) ) ( not ( = ?auto_330217 ?auto_330224 ) ) ( not ( = ?auto_330217 ?auto_330225 ) ) ( not ( = ?auto_330218 ?auto_330219 ) ) ( not ( = ?auto_330218 ?auto_330220 ) ) ( not ( = ?auto_330218 ?auto_330221 ) ) ( not ( = ?auto_330218 ?auto_330222 ) ) ( not ( = ?auto_330218 ?auto_330223 ) ) ( not ( = ?auto_330218 ?auto_330224 ) ) ( not ( = ?auto_330218 ?auto_330225 ) ) ( not ( = ?auto_330219 ?auto_330220 ) ) ( not ( = ?auto_330219 ?auto_330221 ) ) ( not ( = ?auto_330219 ?auto_330222 ) ) ( not ( = ?auto_330219 ?auto_330223 ) ) ( not ( = ?auto_330219 ?auto_330224 ) ) ( not ( = ?auto_330219 ?auto_330225 ) ) ( not ( = ?auto_330220 ?auto_330221 ) ) ( not ( = ?auto_330220 ?auto_330222 ) ) ( not ( = ?auto_330220 ?auto_330223 ) ) ( not ( = ?auto_330220 ?auto_330224 ) ) ( not ( = ?auto_330220 ?auto_330225 ) ) ( not ( = ?auto_330221 ?auto_330222 ) ) ( not ( = ?auto_330221 ?auto_330223 ) ) ( not ( = ?auto_330221 ?auto_330224 ) ) ( not ( = ?auto_330221 ?auto_330225 ) ) ( not ( = ?auto_330222 ?auto_330223 ) ) ( not ( = ?auto_330222 ?auto_330224 ) ) ( not ( = ?auto_330222 ?auto_330225 ) ) ( not ( = ?auto_330223 ?auto_330224 ) ) ( not ( = ?auto_330223 ?auto_330225 ) ) ( not ( = ?auto_330224 ?auto_330225 ) ) ( ON ?auto_330223 ?auto_330224 ) ( ON ?auto_330222 ?auto_330223 ) ( ON ?auto_330221 ?auto_330222 ) ( ON ?auto_330220 ?auto_330221 ) ( ON ?auto_330219 ?auto_330220 ) ( ON ?auto_330218 ?auto_330219 ) ( CLEAR ?auto_330216 ) ( ON ?auto_330217 ?auto_330218 ) ( CLEAR ?auto_330217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_330211 ?auto_330212 ?auto_330213 ?auto_330214 ?auto_330215 ?auto_330216 ?auto_330217 )
      ( MAKE-14PILE ?auto_330211 ?auto_330212 ?auto_330213 ?auto_330214 ?auto_330215 ?auto_330216 ?auto_330217 ?auto_330218 ?auto_330219 ?auto_330220 ?auto_330221 ?auto_330222 ?auto_330223 ?auto_330224 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330240 - BLOCK
      ?auto_330241 - BLOCK
      ?auto_330242 - BLOCK
      ?auto_330243 - BLOCK
      ?auto_330244 - BLOCK
      ?auto_330245 - BLOCK
      ?auto_330246 - BLOCK
      ?auto_330247 - BLOCK
      ?auto_330248 - BLOCK
      ?auto_330249 - BLOCK
      ?auto_330250 - BLOCK
      ?auto_330251 - BLOCK
      ?auto_330252 - BLOCK
      ?auto_330253 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330253 ) ( ON-TABLE ?auto_330240 ) ( ON ?auto_330241 ?auto_330240 ) ( ON ?auto_330242 ?auto_330241 ) ( ON ?auto_330243 ?auto_330242 ) ( ON ?auto_330244 ?auto_330243 ) ( ON ?auto_330245 ?auto_330244 ) ( not ( = ?auto_330240 ?auto_330241 ) ) ( not ( = ?auto_330240 ?auto_330242 ) ) ( not ( = ?auto_330240 ?auto_330243 ) ) ( not ( = ?auto_330240 ?auto_330244 ) ) ( not ( = ?auto_330240 ?auto_330245 ) ) ( not ( = ?auto_330240 ?auto_330246 ) ) ( not ( = ?auto_330240 ?auto_330247 ) ) ( not ( = ?auto_330240 ?auto_330248 ) ) ( not ( = ?auto_330240 ?auto_330249 ) ) ( not ( = ?auto_330240 ?auto_330250 ) ) ( not ( = ?auto_330240 ?auto_330251 ) ) ( not ( = ?auto_330240 ?auto_330252 ) ) ( not ( = ?auto_330240 ?auto_330253 ) ) ( not ( = ?auto_330241 ?auto_330242 ) ) ( not ( = ?auto_330241 ?auto_330243 ) ) ( not ( = ?auto_330241 ?auto_330244 ) ) ( not ( = ?auto_330241 ?auto_330245 ) ) ( not ( = ?auto_330241 ?auto_330246 ) ) ( not ( = ?auto_330241 ?auto_330247 ) ) ( not ( = ?auto_330241 ?auto_330248 ) ) ( not ( = ?auto_330241 ?auto_330249 ) ) ( not ( = ?auto_330241 ?auto_330250 ) ) ( not ( = ?auto_330241 ?auto_330251 ) ) ( not ( = ?auto_330241 ?auto_330252 ) ) ( not ( = ?auto_330241 ?auto_330253 ) ) ( not ( = ?auto_330242 ?auto_330243 ) ) ( not ( = ?auto_330242 ?auto_330244 ) ) ( not ( = ?auto_330242 ?auto_330245 ) ) ( not ( = ?auto_330242 ?auto_330246 ) ) ( not ( = ?auto_330242 ?auto_330247 ) ) ( not ( = ?auto_330242 ?auto_330248 ) ) ( not ( = ?auto_330242 ?auto_330249 ) ) ( not ( = ?auto_330242 ?auto_330250 ) ) ( not ( = ?auto_330242 ?auto_330251 ) ) ( not ( = ?auto_330242 ?auto_330252 ) ) ( not ( = ?auto_330242 ?auto_330253 ) ) ( not ( = ?auto_330243 ?auto_330244 ) ) ( not ( = ?auto_330243 ?auto_330245 ) ) ( not ( = ?auto_330243 ?auto_330246 ) ) ( not ( = ?auto_330243 ?auto_330247 ) ) ( not ( = ?auto_330243 ?auto_330248 ) ) ( not ( = ?auto_330243 ?auto_330249 ) ) ( not ( = ?auto_330243 ?auto_330250 ) ) ( not ( = ?auto_330243 ?auto_330251 ) ) ( not ( = ?auto_330243 ?auto_330252 ) ) ( not ( = ?auto_330243 ?auto_330253 ) ) ( not ( = ?auto_330244 ?auto_330245 ) ) ( not ( = ?auto_330244 ?auto_330246 ) ) ( not ( = ?auto_330244 ?auto_330247 ) ) ( not ( = ?auto_330244 ?auto_330248 ) ) ( not ( = ?auto_330244 ?auto_330249 ) ) ( not ( = ?auto_330244 ?auto_330250 ) ) ( not ( = ?auto_330244 ?auto_330251 ) ) ( not ( = ?auto_330244 ?auto_330252 ) ) ( not ( = ?auto_330244 ?auto_330253 ) ) ( not ( = ?auto_330245 ?auto_330246 ) ) ( not ( = ?auto_330245 ?auto_330247 ) ) ( not ( = ?auto_330245 ?auto_330248 ) ) ( not ( = ?auto_330245 ?auto_330249 ) ) ( not ( = ?auto_330245 ?auto_330250 ) ) ( not ( = ?auto_330245 ?auto_330251 ) ) ( not ( = ?auto_330245 ?auto_330252 ) ) ( not ( = ?auto_330245 ?auto_330253 ) ) ( not ( = ?auto_330246 ?auto_330247 ) ) ( not ( = ?auto_330246 ?auto_330248 ) ) ( not ( = ?auto_330246 ?auto_330249 ) ) ( not ( = ?auto_330246 ?auto_330250 ) ) ( not ( = ?auto_330246 ?auto_330251 ) ) ( not ( = ?auto_330246 ?auto_330252 ) ) ( not ( = ?auto_330246 ?auto_330253 ) ) ( not ( = ?auto_330247 ?auto_330248 ) ) ( not ( = ?auto_330247 ?auto_330249 ) ) ( not ( = ?auto_330247 ?auto_330250 ) ) ( not ( = ?auto_330247 ?auto_330251 ) ) ( not ( = ?auto_330247 ?auto_330252 ) ) ( not ( = ?auto_330247 ?auto_330253 ) ) ( not ( = ?auto_330248 ?auto_330249 ) ) ( not ( = ?auto_330248 ?auto_330250 ) ) ( not ( = ?auto_330248 ?auto_330251 ) ) ( not ( = ?auto_330248 ?auto_330252 ) ) ( not ( = ?auto_330248 ?auto_330253 ) ) ( not ( = ?auto_330249 ?auto_330250 ) ) ( not ( = ?auto_330249 ?auto_330251 ) ) ( not ( = ?auto_330249 ?auto_330252 ) ) ( not ( = ?auto_330249 ?auto_330253 ) ) ( not ( = ?auto_330250 ?auto_330251 ) ) ( not ( = ?auto_330250 ?auto_330252 ) ) ( not ( = ?auto_330250 ?auto_330253 ) ) ( not ( = ?auto_330251 ?auto_330252 ) ) ( not ( = ?auto_330251 ?auto_330253 ) ) ( not ( = ?auto_330252 ?auto_330253 ) ) ( ON ?auto_330252 ?auto_330253 ) ( ON ?auto_330251 ?auto_330252 ) ( ON ?auto_330250 ?auto_330251 ) ( ON ?auto_330249 ?auto_330250 ) ( ON ?auto_330248 ?auto_330249 ) ( ON ?auto_330247 ?auto_330248 ) ( CLEAR ?auto_330245 ) ( ON ?auto_330246 ?auto_330247 ) ( CLEAR ?auto_330246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_330240 ?auto_330241 ?auto_330242 ?auto_330243 ?auto_330244 ?auto_330245 ?auto_330246 )
      ( MAKE-14PILE ?auto_330240 ?auto_330241 ?auto_330242 ?auto_330243 ?auto_330244 ?auto_330245 ?auto_330246 ?auto_330247 ?auto_330248 ?auto_330249 ?auto_330250 ?auto_330251 ?auto_330252 ?auto_330253 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330268 - BLOCK
      ?auto_330269 - BLOCK
      ?auto_330270 - BLOCK
      ?auto_330271 - BLOCK
      ?auto_330272 - BLOCK
      ?auto_330273 - BLOCK
      ?auto_330274 - BLOCK
      ?auto_330275 - BLOCK
      ?auto_330276 - BLOCK
      ?auto_330277 - BLOCK
      ?auto_330278 - BLOCK
      ?auto_330279 - BLOCK
      ?auto_330280 - BLOCK
      ?auto_330281 - BLOCK
    )
    :vars
    (
      ?auto_330282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330281 ?auto_330282 ) ( ON-TABLE ?auto_330268 ) ( ON ?auto_330269 ?auto_330268 ) ( ON ?auto_330270 ?auto_330269 ) ( ON ?auto_330271 ?auto_330270 ) ( ON ?auto_330272 ?auto_330271 ) ( not ( = ?auto_330268 ?auto_330269 ) ) ( not ( = ?auto_330268 ?auto_330270 ) ) ( not ( = ?auto_330268 ?auto_330271 ) ) ( not ( = ?auto_330268 ?auto_330272 ) ) ( not ( = ?auto_330268 ?auto_330273 ) ) ( not ( = ?auto_330268 ?auto_330274 ) ) ( not ( = ?auto_330268 ?auto_330275 ) ) ( not ( = ?auto_330268 ?auto_330276 ) ) ( not ( = ?auto_330268 ?auto_330277 ) ) ( not ( = ?auto_330268 ?auto_330278 ) ) ( not ( = ?auto_330268 ?auto_330279 ) ) ( not ( = ?auto_330268 ?auto_330280 ) ) ( not ( = ?auto_330268 ?auto_330281 ) ) ( not ( = ?auto_330268 ?auto_330282 ) ) ( not ( = ?auto_330269 ?auto_330270 ) ) ( not ( = ?auto_330269 ?auto_330271 ) ) ( not ( = ?auto_330269 ?auto_330272 ) ) ( not ( = ?auto_330269 ?auto_330273 ) ) ( not ( = ?auto_330269 ?auto_330274 ) ) ( not ( = ?auto_330269 ?auto_330275 ) ) ( not ( = ?auto_330269 ?auto_330276 ) ) ( not ( = ?auto_330269 ?auto_330277 ) ) ( not ( = ?auto_330269 ?auto_330278 ) ) ( not ( = ?auto_330269 ?auto_330279 ) ) ( not ( = ?auto_330269 ?auto_330280 ) ) ( not ( = ?auto_330269 ?auto_330281 ) ) ( not ( = ?auto_330269 ?auto_330282 ) ) ( not ( = ?auto_330270 ?auto_330271 ) ) ( not ( = ?auto_330270 ?auto_330272 ) ) ( not ( = ?auto_330270 ?auto_330273 ) ) ( not ( = ?auto_330270 ?auto_330274 ) ) ( not ( = ?auto_330270 ?auto_330275 ) ) ( not ( = ?auto_330270 ?auto_330276 ) ) ( not ( = ?auto_330270 ?auto_330277 ) ) ( not ( = ?auto_330270 ?auto_330278 ) ) ( not ( = ?auto_330270 ?auto_330279 ) ) ( not ( = ?auto_330270 ?auto_330280 ) ) ( not ( = ?auto_330270 ?auto_330281 ) ) ( not ( = ?auto_330270 ?auto_330282 ) ) ( not ( = ?auto_330271 ?auto_330272 ) ) ( not ( = ?auto_330271 ?auto_330273 ) ) ( not ( = ?auto_330271 ?auto_330274 ) ) ( not ( = ?auto_330271 ?auto_330275 ) ) ( not ( = ?auto_330271 ?auto_330276 ) ) ( not ( = ?auto_330271 ?auto_330277 ) ) ( not ( = ?auto_330271 ?auto_330278 ) ) ( not ( = ?auto_330271 ?auto_330279 ) ) ( not ( = ?auto_330271 ?auto_330280 ) ) ( not ( = ?auto_330271 ?auto_330281 ) ) ( not ( = ?auto_330271 ?auto_330282 ) ) ( not ( = ?auto_330272 ?auto_330273 ) ) ( not ( = ?auto_330272 ?auto_330274 ) ) ( not ( = ?auto_330272 ?auto_330275 ) ) ( not ( = ?auto_330272 ?auto_330276 ) ) ( not ( = ?auto_330272 ?auto_330277 ) ) ( not ( = ?auto_330272 ?auto_330278 ) ) ( not ( = ?auto_330272 ?auto_330279 ) ) ( not ( = ?auto_330272 ?auto_330280 ) ) ( not ( = ?auto_330272 ?auto_330281 ) ) ( not ( = ?auto_330272 ?auto_330282 ) ) ( not ( = ?auto_330273 ?auto_330274 ) ) ( not ( = ?auto_330273 ?auto_330275 ) ) ( not ( = ?auto_330273 ?auto_330276 ) ) ( not ( = ?auto_330273 ?auto_330277 ) ) ( not ( = ?auto_330273 ?auto_330278 ) ) ( not ( = ?auto_330273 ?auto_330279 ) ) ( not ( = ?auto_330273 ?auto_330280 ) ) ( not ( = ?auto_330273 ?auto_330281 ) ) ( not ( = ?auto_330273 ?auto_330282 ) ) ( not ( = ?auto_330274 ?auto_330275 ) ) ( not ( = ?auto_330274 ?auto_330276 ) ) ( not ( = ?auto_330274 ?auto_330277 ) ) ( not ( = ?auto_330274 ?auto_330278 ) ) ( not ( = ?auto_330274 ?auto_330279 ) ) ( not ( = ?auto_330274 ?auto_330280 ) ) ( not ( = ?auto_330274 ?auto_330281 ) ) ( not ( = ?auto_330274 ?auto_330282 ) ) ( not ( = ?auto_330275 ?auto_330276 ) ) ( not ( = ?auto_330275 ?auto_330277 ) ) ( not ( = ?auto_330275 ?auto_330278 ) ) ( not ( = ?auto_330275 ?auto_330279 ) ) ( not ( = ?auto_330275 ?auto_330280 ) ) ( not ( = ?auto_330275 ?auto_330281 ) ) ( not ( = ?auto_330275 ?auto_330282 ) ) ( not ( = ?auto_330276 ?auto_330277 ) ) ( not ( = ?auto_330276 ?auto_330278 ) ) ( not ( = ?auto_330276 ?auto_330279 ) ) ( not ( = ?auto_330276 ?auto_330280 ) ) ( not ( = ?auto_330276 ?auto_330281 ) ) ( not ( = ?auto_330276 ?auto_330282 ) ) ( not ( = ?auto_330277 ?auto_330278 ) ) ( not ( = ?auto_330277 ?auto_330279 ) ) ( not ( = ?auto_330277 ?auto_330280 ) ) ( not ( = ?auto_330277 ?auto_330281 ) ) ( not ( = ?auto_330277 ?auto_330282 ) ) ( not ( = ?auto_330278 ?auto_330279 ) ) ( not ( = ?auto_330278 ?auto_330280 ) ) ( not ( = ?auto_330278 ?auto_330281 ) ) ( not ( = ?auto_330278 ?auto_330282 ) ) ( not ( = ?auto_330279 ?auto_330280 ) ) ( not ( = ?auto_330279 ?auto_330281 ) ) ( not ( = ?auto_330279 ?auto_330282 ) ) ( not ( = ?auto_330280 ?auto_330281 ) ) ( not ( = ?auto_330280 ?auto_330282 ) ) ( not ( = ?auto_330281 ?auto_330282 ) ) ( ON ?auto_330280 ?auto_330281 ) ( ON ?auto_330279 ?auto_330280 ) ( ON ?auto_330278 ?auto_330279 ) ( ON ?auto_330277 ?auto_330278 ) ( ON ?auto_330276 ?auto_330277 ) ( ON ?auto_330275 ?auto_330276 ) ( ON ?auto_330274 ?auto_330275 ) ( CLEAR ?auto_330272 ) ( ON ?auto_330273 ?auto_330274 ) ( CLEAR ?auto_330273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_330268 ?auto_330269 ?auto_330270 ?auto_330271 ?auto_330272 ?auto_330273 )
      ( MAKE-14PILE ?auto_330268 ?auto_330269 ?auto_330270 ?auto_330271 ?auto_330272 ?auto_330273 ?auto_330274 ?auto_330275 ?auto_330276 ?auto_330277 ?auto_330278 ?auto_330279 ?auto_330280 ?auto_330281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330297 - BLOCK
      ?auto_330298 - BLOCK
      ?auto_330299 - BLOCK
      ?auto_330300 - BLOCK
      ?auto_330301 - BLOCK
      ?auto_330302 - BLOCK
      ?auto_330303 - BLOCK
      ?auto_330304 - BLOCK
      ?auto_330305 - BLOCK
      ?auto_330306 - BLOCK
      ?auto_330307 - BLOCK
      ?auto_330308 - BLOCK
      ?auto_330309 - BLOCK
      ?auto_330310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330310 ) ( ON-TABLE ?auto_330297 ) ( ON ?auto_330298 ?auto_330297 ) ( ON ?auto_330299 ?auto_330298 ) ( ON ?auto_330300 ?auto_330299 ) ( ON ?auto_330301 ?auto_330300 ) ( not ( = ?auto_330297 ?auto_330298 ) ) ( not ( = ?auto_330297 ?auto_330299 ) ) ( not ( = ?auto_330297 ?auto_330300 ) ) ( not ( = ?auto_330297 ?auto_330301 ) ) ( not ( = ?auto_330297 ?auto_330302 ) ) ( not ( = ?auto_330297 ?auto_330303 ) ) ( not ( = ?auto_330297 ?auto_330304 ) ) ( not ( = ?auto_330297 ?auto_330305 ) ) ( not ( = ?auto_330297 ?auto_330306 ) ) ( not ( = ?auto_330297 ?auto_330307 ) ) ( not ( = ?auto_330297 ?auto_330308 ) ) ( not ( = ?auto_330297 ?auto_330309 ) ) ( not ( = ?auto_330297 ?auto_330310 ) ) ( not ( = ?auto_330298 ?auto_330299 ) ) ( not ( = ?auto_330298 ?auto_330300 ) ) ( not ( = ?auto_330298 ?auto_330301 ) ) ( not ( = ?auto_330298 ?auto_330302 ) ) ( not ( = ?auto_330298 ?auto_330303 ) ) ( not ( = ?auto_330298 ?auto_330304 ) ) ( not ( = ?auto_330298 ?auto_330305 ) ) ( not ( = ?auto_330298 ?auto_330306 ) ) ( not ( = ?auto_330298 ?auto_330307 ) ) ( not ( = ?auto_330298 ?auto_330308 ) ) ( not ( = ?auto_330298 ?auto_330309 ) ) ( not ( = ?auto_330298 ?auto_330310 ) ) ( not ( = ?auto_330299 ?auto_330300 ) ) ( not ( = ?auto_330299 ?auto_330301 ) ) ( not ( = ?auto_330299 ?auto_330302 ) ) ( not ( = ?auto_330299 ?auto_330303 ) ) ( not ( = ?auto_330299 ?auto_330304 ) ) ( not ( = ?auto_330299 ?auto_330305 ) ) ( not ( = ?auto_330299 ?auto_330306 ) ) ( not ( = ?auto_330299 ?auto_330307 ) ) ( not ( = ?auto_330299 ?auto_330308 ) ) ( not ( = ?auto_330299 ?auto_330309 ) ) ( not ( = ?auto_330299 ?auto_330310 ) ) ( not ( = ?auto_330300 ?auto_330301 ) ) ( not ( = ?auto_330300 ?auto_330302 ) ) ( not ( = ?auto_330300 ?auto_330303 ) ) ( not ( = ?auto_330300 ?auto_330304 ) ) ( not ( = ?auto_330300 ?auto_330305 ) ) ( not ( = ?auto_330300 ?auto_330306 ) ) ( not ( = ?auto_330300 ?auto_330307 ) ) ( not ( = ?auto_330300 ?auto_330308 ) ) ( not ( = ?auto_330300 ?auto_330309 ) ) ( not ( = ?auto_330300 ?auto_330310 ) ) ( not ( = ?auto_330301 ?auto_330302 ) ) ( not ( = ?auto_330301 ?auto_330303 ) ) ( not ( = ?auto_330301 ?auto_330304 ) ) ( not ( = ?auto_330301 ?auto_330305 ) ) ( not ( = ?auto_330301 ?auto_330306 ) ) ( not ( = ?auto_330301 ?auto_330307 ) ) ( not ( = ?auto_330301 ?auto_330308 ) ) ( not ( = ?auto_330301 ?auto_330309 ) ) ( not ( = ?auto_330301 ?auto_330310 ) ) ( not ( = ?auto_330302 ?auto_330303 ) ) ( not ( = ?auto_330302 ?auto_330304 ) ) ( not ( = ?auto_330302 ?auto_330305 ) ) ( not ( = ?auto_330302 ?auto_330306 ) ) ( not ( = ?auto_330302 ?auto_330307 ) ) ( not ( = ?auto_330302 ?auto_330308 ) ) ( not ( = ?auto_330302 ?auto_330309 ) ) ( not ( = ?auto_330302 ?auto_330310 ) ) ( not ( = ?auto_330303 ?auto_330304 ) ) ( not ( = ?auto_330303 ?auto_330305 ) ) ( not ( = ?auto_330303 ?auto_330306 ) ) ( not ( = ?auto_330303 ?auto_330307 ) ) ( not ( = ?auto_330303 ?auto_330308 ) ) ( not ( = ?auto_330303 ?auto_330309 ) ) ( not ( = ?auto_330303 ?auto_330310 ) ) ( not ( = ?auto_330304 ?auto_330305 ) ) ( not ( = ?auto_330304 ?auto_330306 ) ) ( not ( = ?auto_330304 ?auto_330307 ) ) ( not ( = ?auto_330304 ?auto_330308 ) ) ( not ( = ?auto_330304 ?auto_330309 ) ) ( not ( = ?auto_330304 ?auto_330310 ) ) ( not ( = ?auto_330305 ?auto_330306 ) ) ( not ( = ?auto_330305 ?auto_330307 ) ) ( not ( = ?auto_330305 ?auto_330308 ) ) ( not ( = ?auto_330305 ?auto_330309 ) ) ( not ( = ?auto_330305 ?auto_330310 ) ) ( not ( = ?auto_330306 ?auto_330307 ) ) ( not ( = ?auto_330306 ?auto_330308 ) ) ( not ( = ?auto_330306 ?auto_330309 ) ) ( not ( = ?auto_330306 ?auto_330310 ) ) ( not ( = ?auto_330307 ?auto_330308 ) ) ( not ( = ?auto_330307 ?auto_330309 ) ) ( not ( = ?auto_330307 ?auto_330310 ) ) ( not ( = ?auto_330308 ?auto_330309 ) ) ( not ( = ?auto_330308 ?auto_330310 ) ) ( not ( = ?auto_330309 ?auto_330310 ) ) ( ON ?auto_330309 ?auto_330310 ) ( ON ?auto_330308 ?auto_330309 ) ( ON ?auto_330307 ?auto_330308 ) ( ON ?auto_330306 ?auto_330307 ) ( ON ?auto_330305 ?auto_330306 ) ( ON ?auto_330304 ?auto_330305 ) ( ON ?auto_330303 ?auto_330304 ) ( CLEAR ?auto_330301 ) ( ON ?auto_330302 ?auto_330303 ) ( CLEAR ?auto_330302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_330297 ?auto_330298 ?auto_330299 ?auto_330300 ?auto_330301 ?auto_330302 )
      ( MAKE-14PILE ?auto_330297 ?auto_330298 ?auto_330299 ?auto_330300 ?auto_330301 ?auto_330302 ?auto_330303 ?auto_330304 ?auto_330305 ?auto_330306 ?auto_330307 ?auto_330308 ?auto_330309 ?auto_330310 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330325 - BLOCK
      ?auto_330326 - BLOCK
      ?auto_330327 - BLOCK
      ?auto_330328 - BLOCK
      ?auto_330329 - BLOCK
      ?auto_330330 - BLOCK
      ?auto_330331 - BLOCK
      ?auto_330332 - BLOCK
      ?auto_330333 - BLOCK
      ?auto_330334 - BLOCK
      ?auto_330335 - BLOCK
      ?auto_330336 - BLOCK
      ?auto_330337 - BLOCK
      ?auto_330338 - BLOCK
    )
    :vars
    (
      ?auto_330339 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330338 ?auto_330339 ) ( ON-TABLE ?auto_330325 ) ( ON ?auto_330326 ?auto_330325 ) ( ON ?auto_330327 ?auto_330326 ) ( ON ?auto_330328 ?auto_330327 ) ( not ( = ?auto_330325 ?auto_330326 ) ) ( not ( = ?auto_330325 ?auto_330327 ) ) ( not ( = ?auto_330325 ?auto_330328 ) ) ( not ( = ?auto_330325 ?auto_330329 ) ) ( not ( = ?auto_330325 ?auto_330330 ) ) ( not ( = ?auto_330325 ?auto_330331 ) ) ( not ( = ?auto_330325 ?auto_330332 ) ) ( not ( = ?auto_330325 ?auto_330333 ) ) ( not ( = ?auto_330325 ?auto_330334 ) ) ( not ( = ?auto_330325 ?auto_330335 ) ) ( not ( = ?auto_330325 ?auto_330336 ) ) ( not ( = ?auto_330325 ?auto_330337 ) ) ( not ( = ?auto_330325 ?auto_330338 ) ) ( not ( = ?auto_330325 ?auto_330339 ) ) ( not ( = ?auto_330326 ?auto_330327 ) ) ( not ( = ?auto_330326 ?auto_330328 ) ) ( not ( = ?auto_330326 ?auto_330329 ) ) ( not ( = ?auto_330326 ?auto_330330 ) ) ( not ( = ?auto_330326 ?auto_330331 ) ) ( not ( = ?auto_330326 ?auto_330332 ) ) ( not ( = ?auto_330326 ?auto_330333 ) ) ( not ( = ?auto_330326 ?auto_330334 ) ) ( not ( = ?auto_330326 ?auto_330335 ) ) ( not ( = ?auto_330326 ?auto_330336 ) ) ( not ( = ?auto_330326 ?auto_330337 ) ) ( not ( = ?auto_330326 ?auto_330338 ) ) ( not ( = ?auto_330326 ?auto_330339 ) ) ( not ( = ?auto_330327 ?auto_330328 ) ) ( not ( = ?auto_330327 ?auto_330329 ) ) ( not ( = ?auto_330327 ?auto_330330 ) ) ( not ( = ?auto_330327 ?auto_330331 ) ) ( not ( = ?auto_330327 ?auto_330332 ) ) ( not ( = ?auto_330327 ?auto_330333 ) ) ( not ( = ?auto_330327 ?auto_330334 ) ) ( not ( = ?auto_330327 ?auto_330335 ) ) ( not ( = ?auto_330327 ?auto_330336 ) ) ( not ( = ?auto_330327 ?auto_330337 ) ) ( not ( = ?auto_330327 ?auto_330338 ) ) ( not ( = ?auto_330327 ?auto_330339 ) ) ( not ( = ?auto_330328 ?auto_330329 ) ) ( not ( = ?auto_330328 ?auto_330330 ) ) ( not ( = ?auto_330328 ?auto_330331 ) ) ( not ( = ?auto_330328 ?auto_330332 ) ) ( not ( = ?auto_330328 ?auto_330333 ) ) ( not ( = ?auto_330328 ?auto_330334 ) ) ( not ( = ?auto_330328 ?auto_330335 ) ) ( not ( = ?auto_330328 ?auto_330336 ) ) ( not ( = ?auto_330328 ?auto_330337 ) ) ( not ( = ?auto_330328 ?auto_330338 ) ) ( not ( = ?auto_330328 ?auto_330339 ) ) ( not ( = ?auto_330329 ?auto_330330 ) ) ( not ( = ?auto_330329 ?auto_330331 ) ) ( not ( = ?auto_330329 ?auto_330332 ) ) ( not ( = ?auto_330329 ?auto_330333 ) ) ( not ( = ?auto_330329 ?auto_330334 ) ) ( not ( = ?auto_330329 ?auto_330335 ) ) ( not ( = ?auto_330329 ?auto_330336 ) ) ( not ( = ?auto_330329 ?auto_330337 ) ) ( not ( = ?auto_330329 ?auto_330338 ) ) ( not ( = ?auto_330329 ?auto_330339 ) ) ( not ( = ?auto_330330 ?auto_330331 ) ) ( not ( = ?auto_330330 ?auto_330332 ) ) ( not ( = ?auto_330330 ?auto_330333 ) ) ( not ( = ?auto_330330 ?auto_330334 ) ) ( not ( = ?auto_330330 ?auto_330335 ) ) ( not ( = ?auto_330330 ?auto_330336 ) ) ( not ( = ?auto_330330 ?auto_330337 ) ) ( not ( = ?auto_330330 ?auto_330338 ) ) ( not ( = ?auto_330330 ?auto_330339 ) ) ( not ( = ?auto_330331 ?auto_330332 ) ) ( not ( = ?auto_330331 ?auto_330333 ) ) ( not ( = ?auto_330331 ?auto_330334 ) ) ( not ( = ?auto_330331 ?auto_330335 ) ) ( not ( = ?auto_330331 ?auto_330336 ) ) ( not ( = ?auto_330331 ?auto_330337 ) ) ( not ( = ?auto_330331 ?auto_330338 ) ) ( not ( = ?auto_330331 ?auto_330339 ) ) ( not ( = ?auto_330332 ?auto_330333 ) ) ( not ( = ?auto_330332 ?auto_330334 ) ) ( not ( = ?auto_330332 ?auto_330335 ) ) ( not ( = ?auto_330332 ?auto_330336 ) ) ( not ( = ?auto_330332 ?auto_330337 ) ) ( not ( = ?auto_330332 ?auto_330338 ) ) ( not ( = ?auto_330332 ?auto_330339 ) ) ( not ( = ?auto_330333 ?auto_330334 ) ) ( not ( = ?auto_330333 ?auto_330335 ) ) ( not ( = ?auto_330333 ?auto_330336 ) ) ( not ( = ?auto_330333 ?auto_330337 ) ) ( not ( = ?auto_330333 ?auto_330338 ) ) ( not ( = ?auto_330333 ?auto_330339 ) ) ( not ( = ?auto_330334 ?auto_330335 ) ) ( not ( = ?auto_330334 ?auto_330336 ) ) ( not ( = ?auto_330334 ?auto_330337 ) ) ( not ( = ?auto_330334 ?auto_330338 ) ) ( not ( = ?auto_330334 ?auto_330339 ) ) ( not ( = ?auto_330335 ?auto_330336 ) ) ( not ( = ?auto_330335 ?auto_330337 ) ) ( not ( = ?auto_330335 ?auto_330338 ) ) ( not ( = ?auto_330335 ?auto_330339 ) ) ( not ( = ?auto_330336 ?auto_330337 ) ) ( not ( = ?auto_330336 ?auto_330338 ) ) ( not ( = ?auto_330336 ?auto_330339 ) ) ( not ( = ?auto_330337 ?auto_330338 ) ) ( not ( = ?auto_330337 ?auto_330339 ) ) ( not ( = ?auto_330338 ?auto_330339 ) ) ( ON ?auto_330337 ?auto_330338 ) ( ON ?auto_330336 ?auto_330337 ) ( ON ?auto_330335 ?auto_330336 ) ( ON ?auto_330334 ?auto_330335 ) ( ON ?auto_330333 ?auto_330334 ) ( ON ?auto_330332 ?auto_330333 ) ( ON ?auto_330331 ?auto_330332 ) ( ON ?auto_330330 ?auto_330331 ) ( CLEAR ?auto_330328 ) ( ON ?auto_330329 ?auto_330330 ) ( CLEAR ?auto_330329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_330325 ?auto_330326 ?auto_330327 ?auto_330328 ?auto_330329 )
      ( MAKE-14PILE ?auto_330325 ?auto_330326 ?auto_330327 ?auto_330328 ?auto_330329 ?auto_330330 ?auto_330331 ?auto_330332 ?auto_330333 ?auto_330334 ?auto_330335 ?auto_330336 ?auto_330337 ?auto_330338 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330354 - BLOCK
      ?auto_330355 - BLOCK
      ?auto_330356 - BLOCK
      ?auto_330357 - BLOCK
      ?auto_330358 - BLOCK
      ?auto_330359 - BLOCK
      ?auto_330360 - BLOCK
      ?auto_330361 - BLOCK
      ?auto_330362 - BLOCK
      ?auto_330363 - BLOCK
      ?auto_330364 - BLOCK
      ?auto_330365 - BLOCK
      ?auto_330366 - BLOCK
      ?auto_330367 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330367 ) ( ON-TABLE ?auto_330354 ) ( ON ?auto_330355 ?auto_330354 ) ( ON ?auto_330356 ?auto_330355 ) ( ON ?auto_330357 ?auto_330356 ) ( not ( = ?auto_330354 ?auto_330355 ) ) ( not ( = ?auto_330354 ?auto_330356 ) ) ( not ( = ?auto_330354 ?auto_330357 ) ) ( not ( = ?auto_330354 ?auto_330358 ) ) ( not ( = ?auto_330354 ?auto_330359 ) ) ( not ( = ?auto_330354 ?auto_330360 ) ) ( not ( = ?auto_330354 ?auto_330361 ) ) ( not ( = ?auto_330354 ?auto_330362 ) ) ( not ( = ?auto_330354 ?auto_330363 ) ) ( not ( = ?auto_330354 ?auto_330364 ) ) ( not ( = ?auto_330354 ?auto_330365 ) ) ( not ( = ?auto_330354 ?auto_330366 ) ) ( not ( = ?auto_330354 ?auto_330367 ) ) ( not ( = ?auto_330355 ?auto_330356 ) ) ( not ( = ?auto_330355 ?auto_330357 ) ) ( not ( = ?auto_330355 ?auto_330358 ) ) ( not ( = ?auto_330355 ?auto_330359 ) ) ( not ( = ?auto_330355 ?auto_330360 ) ) ( not ( = ?auto_330355 ?auto_330361 ) ) ( not ( = ?auto_330355 ?auto_330362 ) ) ( not ( = ?auto_330355 ?auto_330363 ) ) ( not ( = ?auto_330355 ?auto_330364 ) ) ( not ( = ?auto_330355 ?auto_330365 ) ) ( not ( = ?auto_330355 ?auto_330366 ) ) ( not ( = ?auto_330355 ?auto_330367 ) ) ( not ( = ?auto_330356 ?auto_330357 ) ) ( not ( = ?auto_330356 ?auto_330358 ) ) ( not ( = ?auto_330356 ?auto_330359 ) ) ( not ( = ?auto_330356 ?auto_330360 ) ) ( not ( = ?auto_330356 ?auto_330361 ) ) ( not ( = ?auto_330356 ?auto_330362 ) ) ( not ( = ?auto_330356 ?auto_330363 ) ) ( not ( = ?auto_330356 ?auto_330364 ) ) ( not ( = ?auto_330356 ?auto_330365 ) ) ( not ( = ?auto_330356 ?auto_330366 ) ) ( not ( = ?auto_330356 ?auto_330367 ) ) ( not ( = ?auto_330357 ?auto_330358 ) ) ( not ( = ?auto_330357 ?auto_330359 ) ) ( not ( = ?auto_330357 ?auto_330360 ) ) ( not ( = ?auto_330357 ?auto_330361 ) ) ( not ( = ?auto_330357 ?auto_330362 ) ) ( not ( = ?auto_330357 ?auto_330363 ) ) ( not ( = ?auto_330357 ?auto_330364 ) ) ( not ( = ?auto_330357 ?auto_330365 ) ) ( not ( = ?auto_330357 ?auto_330366 ) ) ( not ( = ?auto_330357 ?auto_330367 ) ) ( not ( = ?auto_330358 ?auto_330359 ) ) ( not ( = ?auto_330358 ?auto_330360 ) ) ( not ( = ?auto_330358 ?auto_330361 ) ) ( not ( = ?auto_330358 ?auto_330362 ) ) ( not ( = ?auto_330358 ?auto_330363 ) ) ( not ( = ?auto_330358 ?auto_330364 ) ) ( not ( = ?auto_330358 ?auto_330365 ) ) ( not ( = ?auto_330358 ?auto_330366 ) ) ( not ( = ?auto_330358 ?auto_330367 ) ) ( not ( = ?auto_330359 ?auto_330360 ) ) ( not ( = ?auto_330359 ?auto_330361 ) ) ( not ( = ?auto_330359 ?auto_330362 ) ) ( not ( = ?auto_330359 ?auto_330363 ) ) ( not ( = ?auto_330359 ?auto_330364 ) ) ( not ( = ?auto_330359 ?auto_330365 ) ) ( not ( = ?auto_330359 ?auto_330366 ) ) ( not ( = ?auto_330359 ?auto_330367 ) ) ( not ( = ?auto_330360 ?auto_330361 ) ) ( not ( = ?auto_330360 ?auto_330362 ) ) ( not ( = ?auto_330360 ?auto_330363 ) ) ( not ( = ?auto_330360 ?auto_330364 ) ) ( not ( = ?auto_330360 ?auto_330365 ) ) ( not ( = ?auto_330360 ?auto_330366 ) ) ( not ( = ?auto_330360 ?auto_330367 ) ) ( not ( = ?auto_330361 ?auto_330362 ) ) ( not ( = ?auto_330361 ?auto_330363 ) ) ( not ( = ?auto_330361 ?auto_330364 ) ) ( not ( = ?auto_330361 ?auto_330365 ) ) ( not ( = ?auto_330361 ?auto_330366 ) ) ( not ( = ?auto_330361 ?auto_330367 ) ) ( not ( = ?auto_330362 ?auto_330363 ) ) ( not ( = ?auto_330362 ?auto_330364 ) ) ( not ( = ?auto_330362 ?auto_330365 ) ) ( not ( = ?auto_330362 ?auto_330366 ) ) ( not ( = ?auto_330362 ?auto_330367 ) ) ( not ( = ?auto_330363 ?auto_330364 ) ) ( not ( = ?auto_330363 ?auto_330365 ) ) ( not ( = ?auto_330363 ?auto_330366 ) ) ( not ( = ?auto_330363 ?auto_330367 ) ) ( not ( = ?auto_330364 ?auto_330365 ) ) ( not ( = ?auto_330364 ?auto_330366 ) ) ( not ( = ?auto_330364 ?auto_330367 ) ) ( not ( = ?auto_330365 ?auto_330366 ) ) ( not ( = ?auto_330365 ?auto_330367 ) ) ( not ( = ?auto_330366 ?auto_330367 ) ) ( ON ?auto_330366 ?auto_330367 ) ( ON ?auto_330365 ?auto_330366 ) ( ON ?auto_330364 ?auto_330365 ) ( ON ?auto_330363 ?auto_330364 ) ( ON ?auto_330362 ?auto_330363 ) ( ON ?auto_330361 ?auto_330362 ) ( ON ?auto_330360 ?auto_330361 ) ( ON ?auto_330359 ?auto_330360 ) ( CLEAR ?auto_330357 ) ( ON ?auto_330358 ?auto_330359 ) ( CLEAR ?auto_330358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_330354 ?auto_330355 ?auto_330356 ?auto_330357 ?auto_330358 )
      ( MAKE-14PILE ?auto_330354 ?auto_330355 ?auto_330356 ?auto_330357 ?auto_330358 ?auto_330359 ?auto_330360 ?auto_330361 ?auto_330362 ?auto_330363 ?auto_330364 ?auto_330365 ?auto_330366 ?auto_330367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330382 - BLOCK
      ?auto_330383 - BLOCK
      ?auto_330384 - BLOCK
      ?auto_330385 - BLOCK
      ?auto_330386 - BLOCK
      ?auto_330387 - BLOCK
      ?auto_330388 - BLOCK
      ?auto_330389 - BLOCK
      ?auto_330390 - BLOCK
      ?auto_330391 - BLOCK
      ?auto_330392 - BLOCK
      ?auto_330393 - BLOCK
      ?auto_330394 - BLOCK
      ?auto_330395 - BLOCK
    )
    :vars
    (
      ?auto_330396 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330395 ?auto_330396 ) ( ON-TABLE ?auto_330382 ) ( ON ?auto_330383 ?auto_330382 ) ( ON ?auto_330384 ?auto_330383 ) ( not ( = ?auto_330382 ?auto_330383 ) ) ( not ( = ?auto_330382 ?auto_330384 ) ) ( not ( = ?auto_330382 ?auto_330385 ) ) ( not ( = ?auto_330382 ?auto_330386 ) ) ( not ( = ?auto_330382 ?auto_330387 ) ) ( not ( = ?auto_330382 ?auto_330388 ) ) ( not ( = ?auto_330382 ?auto_330389 ) ) ( not ( = ?auto_330382 ?auto_330390 ) ) ( not ( = ?auto_330382 ?auto_330391 ) ) ( not ( = ?auto_330382 ?auto_330392 ) ) ( not ( = ?auto_330382 ?auto_330393 ) ) ( not ( = ?auto_330382 ?auto_330394 ) ) ( not ( = ?auto_330382 ?auto_330395 ) ) ( not ( = ?auto_330382 ?auto_330396 ) ) ( not ( = ?auto_330383 ?auto_330384 ) ) ( not ( = ?auto_330383 ?auto_330385 ) ) ( not ( = ?auto_330383 ?auto_330386 ) ) ( not ( = ?auto_330383 ?auto_330387 ) ) ( not ( = ?auto_330383 ?auto_330388 ) ) ( not ( = ?auto_330383 ?auto_330389 ) ) ( not ( = ?auto_330383 ?auto_330390 ) ) ( not ( = ?auto_330383 ?auto_330391 ) ) ( not ( = ?auto_330383 ?auto_330392 ) ) ( not ( = ?auto_330383 ?auto_330393 ) ) ( not ( = ?auto_330383 ?auto_330394 ) ) ( not ( = ?auto_330383 ?auto_330395 ) ) ( not ( = ?auto_330383 ?auto_330396 ) ) ( not ( = ?auto_330384 ?auto_330385 ) ) ( not ( = ?auto_330384 ?auto_330386 ) ) ( not ( = ?auto_330384 ?auto_330387 ) ) ( not ( = ?auto_330384 ?auto_330388 ) ) ( not ( = ?auto_330384 ?auto_330389 ) ) ( not ( = ?auto_330384 ?auto_330390 ) ) ( not ( = ?auto_330384 ?auto_330391 ) ) ( not ( = ?auto_330384 ?auto_330392 ) ) ( not ( = ?auto_330384 ?auto_330393 ) ) ( not ( = ?auto_330384 ?auto_330394 ) ) ( not ( = ?auto_330384 ?auto_330395 ) ) ( not ( = ?auto_330384 ?auto_330396 ) ) ( not ( = ?auto_330385 ?auto_330386 ) ) ( not ( = ?auto_330385 ?auto_330387 ) ) ( not ( = ?auto_330385 ?auto_330388 ) ) ( not ( = ?auto_330385 ?auto_330389 ) ) ( not ( = ?auto_330385 ?auto_330390 ) ) ( not ( = ?auto_330385 ?auto_330391 ) ) ( not ( = ?auto_330385 ?auto_330392 ) ) ( not ( = ?auto_330385 ?auto_330393 ) ) ( not ( = ?auto_330385 ?auto_330394 ) ) ( not ( = ?auto_330385 ?auto_330395 ) ) ( not ( = ?auto_330385 ?auto_330396 ) ) ( not ( = ?auto_330386 ?auto_330387 ) ) ( not ( = ?auto_330386 ?auto_330388 ) ) ( not ( = ?auto_330386 ?auto_330389 ) ) ( not ( = ?auto_330386 ?auto_330390 ) ) ( not ( = ?auto_330386 ?auto_330391 ) ) ( not ( = ?auto_330386 ?auto_330392 ) ) ( not ( = ?auto_330386 ?auto_330393 ) ) ( not ( = ?auto_330386 ?auto_330394 ) ) ( not ( = ?auto_330386 ?auto_330395 ) ) ( not ( = ?auto_330386 ?auto_330396 ) ) ( not ( = ?auto_330387 ?auto_330388 ) ) ( not ( = ?auto_330387 ?auto_330389 ) ) ( not ( = ?auto_330387 ?auto_330390 ) ) ( not ( = ?auto_330387 ?auto_330391 ) ) ( not ( = ?auto_330387 ?auto_330392 ) ) ( not ( = ?auto_330387 ?auto_330393 ) ) ( not ( = ?auto_330387 ?auto_330394 ) ) ( not ( = ?auto_330387 ?auto_330395 ) ) ( not ( = ?auto_330387 ?auto_330396 ) ) ( not ( = ?auto_330388 ?auto_330389 ) ) ( not ( = ?auto_330388 ?auto_330390 ) ) ( not ( = ?auto_330388 ?auto_330391 ) ) ( not ( = ?auto_330388 ?auto_330392 ) ) ( not ( = ?auto_330388 ?auto_330393 ) ) ( not ( = ?auto_330388 ?auto_330394 ) ) ( not ( = ?auto_330388 ?auto_330395 ) ) ( not ( = ?auto_330388 ?auto_330396 ) ) ( not ( = ?auto_330389 ?auto_330390 ) ) ( not ( = ?auto_330389 ?auto_330391 ) ) ( not ( = ?auto_330389 ?auto_330392 ) ) ( not ( = ?auto_330389 ?auto_330393 ) ) ( not ( = ?auto_330389 ?auto_330394 ) ) ( not ( = ?auto_330389 ?auto_330395 ) ) ( not ( = ?auto_330389 ?auto_330396 ) ) ( not ( = ?auto_330390 ?auto_330391 ) ) ( not ( = ?auto_330390 ?auto_330392 ) ) ( not ( = ?auto_330390 ?auto_330393 ) ) ( not ( = ?auto_330390 ?auto_330394 ) ) ( not ( = ?auto_330390 ?auto_330395 ) ) ( not ( = ?auto_330390 ?auto_330396 ) ) ( not ( = ?auto_330391 ?auto_330392 ) ) ( not ( = ?auto_330391 ?auto_330393 ) ) ( not ( = ?auto_330391 ?auto_330394 ) ) ( not ( = ?auto_330391 ?auto_330395 ) ) ( not ( = ?auto_330391 ?auto_330396 ) ) ( not ( = ?auto_330392 ?auto_330393 ) ) ( not ( = ?auto_330392 ?auto_330394 ) ) ( not ( = ?auto_330392 ?auto_330395 ) ) ( not ( = ?auto_330392 ?auto_330396 ) ) ( not ( = ?auto_330393 ?auto_330394 ) ) ( not ( = ?auto_330393 ?auto_330395 ) ) ( not ( = ?auto_330393 ?auto_330396 ) ) ( not ( = ?auto_330394 ?auto_330395 ) ) ( not ( = ?auto_330394 ?auto_330396 ) ) ( not ( = ?auto_330395 ?auto_330396 ) ) ( ON ?auto_330394 ?auto_330395 ) ( ON ?auto_330393 ?auto_330394 ) ( ON ?auto_330392 ?auto_330393 ) ( ON ?auto_330391 ?auto_330392 ) ( ON ?auto_330390 ?auto_330391 ) ( ON ?auto_330389 ?auto_330390 ) ( ON ?auto_330388 ?auto_330389 ) ( ON ?auto_330387 ?auto_330388 ) ( ON ?auto_330386 ?auto_330387 ) ( CLEAR ?auto_330384 ) ( ON ?auto_330385 ?auto_330386 ) ( CLEAR ?auto_330385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330382 ?auto_330383 ?auto_330384 ?auto_330385 )
      ( MAKE-14PILE ?auto_330382 ?auto_330383 ?auto_330384 ?auto_330385 ?auto_330386 ?auto_330387 ?auto_330388 ?auto_330389 ?auto_330390 ?auto_330391 ?auto_330392 ?auto_330393 ?auto_330394 ?auto_330395 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330411 - BLOCK
      ?auto_330412 - BLOCK
      ?auto_330413 - BLOCK
      ?auto_330414 - BLOCK
      ?auto_330415 - BLOCK
      ?auto_330416 - BLOCK
      ?auto_330417 - BLOCK
      ?auto_330418 - BLOCK
      ?auto_330419 - BLOCK
      ?auto_330420 - BLOCK
      ?auto_330421 - BLOCK
      ?auto_330422 - BLOCK
      ?auto_330423 - BLOCK
      ?auto_330424 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330424 ) ( ON-TABLE ?auto_330411 ) ( ON ?auto_330412 ?auto_330411 ) ( ON ?auto_330413 ?auto_330412 ) ( not ( = ?auto_330411 ?auto_330412 ) ) ( not ( = ?auto_330411 ?auto_330413 ) ) ( not ( = ?auto_330411 ?auto_330414 ) ) ( not ( = ?auto_330411 ?auto_330415 ) ) ( not ( = ?auto_330411 ?auto_330416 ) ) ( not ( = ?auto_330411 ?auto_330417 ) ) ( not ( = ?auto_330411 ?auto_330418 ) ) ( not ( = ?auto_330411 ?auto_330419 ) ) ( not ( = ?auto_330411 ?auto_330420 ) ) ( not ( = ?auto_330411 ?auto_330421 ) ) ( not ( = ?auto_330411 ?auto_330422 ) ) ( not ( = ?auto_330411 ?auto_330423 ) ) ( not ( = ?auto_330411 ?auto_330424 ) ) ( not ( = ?auto_330412 ?auto_330413 ) ) ( not ( = ?auto_330412 ?auto_330414 ) ) ( not ( = ?auto_330412 ?auto_330415 ) ) ( not ( = ?auto_330412 ?auto_330416 ) ) ( not ( = ?auto_330412 ?auto_330417 ) ) ( not ( = ?auto_330412 ?auto_330418 ) ) ( not ( = ?auto_330412 ?auto_330419 ) ) ( not ( = ?auto_330412 ?auto_330420 ) ) ( not ( = ?auto_330412 ?auto_330421 ) ) ( not ( = ?auto_330412 ?auto_330422 ) ) ( not ( = ?auto_330412 ?auto_330423 ) ) ( not ( = ?auto_330412 ?auto_330424 ) ) ( not ( = ?auto_330413 ?auto_330414 ) ) ( not ( = ?auto_330413 ?auto_330415 ) ) ( not ( = ?auto_330413 ?auto_330416 ) ) ( not ( = ?auto_330413 ?auto_330417 ) ) ( not ( = ?auto_330413 ?auto_330418 ) ) ( not ( = ?auto_330413 ?auto_330419 ) ) ( not ( = ?auto_330413 ?auto_330420 ) ) ( not ( = ?auto_330413 ?auto_330421 ) ) ( not ( = ?auto_330413 ?auto_330422 ) ) ( not ( = ?auto_330413 ?auto_330423 ) ) ( not ( = ?auto_330413 ?auto_330424 ) ) ( not ( = ?auto_330414 ?auto_330415 ) ) ( not ( = ?auto_330414 ?auto_330416 ) ) ( not ( = ?auto_330414 ?auto_330417 ) ) ( not ( = ?auto_330414 ?auto_330418 ) ) ( not ( = ?auto_330414 ?auto_330419 ) ) ( not ( = ?auto_330414 ?auto_330420 ) ) ( not ( = ?auto_330414 ?auto_330421 ) ) ( not ( = ?auto_330414 ?auto_330422 ) ) ( not ( = ?auto_330414 ?auto_330423 ) ) ( not ( = ?auto_330414 ?auto_330424 ) ) ( not ( = ?auto_330415 ?auto_330416 ) ) ( not ( = ?auto_330415 ?auto_330417 ) ) ( not ( = ?auto_330415 ?auto_330418 ) ) ( not ( = ?auto_330415 ?auto_330419 ) ) ( not ( = ?auto_330415 ?auto_330420 ) ) ( not ( = ?auto_330415 ?auto_330421 ) ) ( not ( = ?auto_330415 ?auto_330422 ) ) ( not ( = ?auto_330415 ?auto_330423 ) ) ( not ( = ?auto_330415 ?auto_330424 ) ) ( not ( = ?auto_330416 ?auto_330417 ) ) ( not ( = ?auto_330416 ?auto_330418 ) ) ( not ( = ?auto_330416 ?auto_330419 ) ) ( not ( = ?auto_330416 ?auto_330420 ) ) ( not ( = ?auto_330416 ?auto_330421 ) ) ( not ( = ?auto_330416 ?auto_330422 ) ) ( not ( = ?auto_330416 ?auto_330423 ) ) ( not ( = ?auto_330416 ?auto_330424 ) ) ( not ( = ?auto_330417 ?auto_330418 ) ) ( not ( = ?auto_330417 ?auto_330419 ) ) ( not ( = ?auto_330417 ?auto_330420 ) ) ( not ( = ?auto_330417 ?auto_330421 ) ) ( not ( = ?auto_330417 ?auto_330422 ) ) ( not ( = ?auto_330417 ?auto_330423 ) ) ( not ( = ?auto_330417 ?auto_330424 ) ) ( not ( = ?auto_330418 ?auto_330419 ) ) ( not ( = ?auto_330418 ?auto_330420 ) ) ( not ( = ?auto_330418 ?auto_330421 ) ) ( not ( = ?auto_330418 ?auto_330422 ) ) ( not ( = ?auto_330418 ?auto_330423 ) ) ( not ( = ?auto_330418 ?auto_330424 ) ) ( not ( = ?auto_330419 ?auto_330420 ) ) ( not ( = ?auto_330419 ?auto_330421 ) ) ( not ( = ?auto_330419 ?auto_330422 ) ) ( not ( = ?auto_330419 ?auto_330423 ) ) ( not ( = ?auto_330419 ?auto_330424 ) ) ( not ( = ?auto_330420 ?auto_330421 ) ) ( not ( = ?auto_330420 ?auto_330422 ) ) ( not ( = ?auto_330420 ?auto_330423 ) ) ( not ( = ?auto_330420 ?auto_330424 ) ) ( not ( = ?auto_330421 ?auto_330422 ) ) ( not ( = ?auto_330421 ?auto_330423 ) ) ( not ( = ?auto_330421 ?auto_330424 ) ) ( not ( = ?auto_330422 ?auto_330423 ) ) ( not ( = ?auto_330422 ?auto_330424 ) ) ( not ( = ?auto_330423 ?auto_330424 ) ) ( ON ?auto_330423 ?auto_330424 ) ( ON ?auto_330422 ?auto_330423 ) ( ON ?auto_330421 ?auto_330422 ) ( ON ?auto_330420 ?auto_330421 ) ( ON ?auto_330419 ?auto_330420 ) ( ON ?auto_330418 ?auto_330419 ) ( ON ?auto_330417 ?auto_330418 ) ( ON ?auto_330416 ?auto_330417 ) ( ON ?auto_330415 ?auto_330416 ) ( CLEAR ?auto_330413 ) ( ON ?auto_330414 ?auto_330415 ) ( CLEAR ?auto_330414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_330411 ?auto_330412 ?auto_330413 ?auto_330414 )
      ( MAKE-14PILE ?auto_330411 ?auto_330412 ?auto_330413 ?auto_330414 ?auto_330415 ?auto_330416 ?auto_330417 ?auto_330418 ?auto_330419 ?auto_330420 ?auto_330421 ?auto_330422 ?auto_330423 ?auto_330424 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330439 - BLOCK
      ?auto_330440 - BLOCK
      ?auto_330441 - BLOCK
      ?auto_330442 - BLOCK
      ?auto_330443 - BLOCK
      ?auto_330444 - BLOCK
      ?auto_330445 - BLOCK
      ?auto_330446 - BLOCK
      ?auto_330447 - BLOCK
      ?auto_330448 - BLOCK
      ?auto_330449 - BLOCK
      ?auto_330450 - BLOCK
      ?auto_330451 - BLOCK
      ?auto_330452 - BLOCK
    )
    :vars
    (
      ?auto_330453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330452 ?auto_330453 ) ( ON-TABLE ?auto_330439 ) ( ON ?auto_330440 ?auto_330439 ) ( not ( = ?auto_330439 ?auto_330440 ) ) ( not ( = ?auto_330439 ?auto_330441 ) ) ( not ( = ?auto_330439 ?auto_330442 ) ) ( not ( = ?auto_330439 ?auto_330443 ) ) ( not ( = ?auto_330439 ?auto_330444 ) ) ( not ( = ?auto_330439 ?auto_330445 ) ) ( not ( = ?auto_330439 ?auto_330446 ) ) ( not ( = ?auto_330439 ?auto_330447 ) ) ( not ( = ?auto_330439 ?auto_330448 ) ) ( not ( = ?auto_330439 ?auto_330449 ) ) ( not ( = ?auto_330439 ?auto_330450 ) ) ( not ( = ?auto_330439 ?auto_330451 ) ) ( not ( = ?auto_330439 ?auto_330452 ) ) ( not ( = ?auto_330439 ?auto_330453 ) ) ( not ( = ?auto_330440 ?auto_330441 ) ) ( not ( = ?auto_330440 ?auto_330442 ) ) ( not ( = ?auto_330440 ?auto_330443 ) ) ( not ( = ?auto_330440 ?auto_330444 ) ) ( not ( = ?auto_330440 ?auto_330445 ) ) ( not ( = ?auto_330440 ?auto_330446 ) ) ( not ( = ?auto_330440 ?auto_330447 ) ) ( not ( = ?auto_330440 ?auto_330448 ) ) ( not ( = ?auto_330440 ?auto_330449 ) ) ( not ( = ?auto_330440 ?auto_330450 ) ) ( not ( = ?auto_330440 ?auto_330451 ) ) ( not ( = ?auto_330440 ?auto_330452 ) ) ( not ( = ?auto_330440 ?auto_330453 ) ) ( not ( = ?auto_330441 ?auto_330442 ) ) ( not ( = ?auto_330441 ?auto_330443 ) ) ( not ( = ?auto_330441 ?auto_330444 ) ) ( not ( = ?auto_330441 ?auto_330445 ) ) ( not ( = ?auto_330441 ?auto_330446 ) ) ( not ( = ?auto_330441 ?auto_330447 ) ) ( not ( = ?auto_330441 ?auto_330448 ) ) ( not ( = ?auto_330441 ?auto_330449 ) ) ( not ( = ?auto_330441 ?auto_330450 ) ) ( not ( = ?auto_330441 ?auto_330451 ) ) ( not ( = ?auto_330441 ?auto_330452 ) ) ( not ( = ?auto_330441 ?auto_330453 ) ) ( not ( = ?auto_330442 ?auto_330443 ) ) ( not ( = ?auto_330442 ?auto_330444 ) ) ( not ( = ?auto_330442 ?auto_330445 ) ) ( not ( = ?auto_330442 ?auto_330446 ) ) ( not ( = ?auto_330442 ?auto_330447 ) ) ( not ( = ?auto_330442 ?auto_330448 ) ) ( not ( = ?auto_330442 ?auto_330449 ) ) ( not ( = ?auto_330442 ?auto_330450 ) ) ( not ( = ?auto_330442 ?auto_330451 ) ) ( not ( = ?auto_330442 ?auto_330452 ) ) ( not ( = ?auto_330442 ?auto_330453 ) ) ( not ( = ?auto_330443 ?auto_330444 ) ) ( not ( = ?auto_330443 ?auto_330445 ) ) ( not ( = ?auto_330443 ?auto_330446 ) ) ( not ( = ?auto_330443 ?auto_330447 ) ) ( not ( = ?auto_330443 ?auto_330448 ) ) ( not ( = ?auto_330443 ?auto_330449 ) ) ( not ( = ?auto_330443 ?auto_330450 ) ) ( not ( = ?auto_330443 ?auto_330451 ) ) ( not ( = ?auto_330443 ?auto_330452 ) ) ( not ( = ?auto_330443 ?auto_330453 ) ) ( not ( = ?auto_330444 ?auto_330445 ) ) ( not ( = ?auto_330444 ?auto_330446 ) ) ( not ( = ?auto_330444 ?auto_330447 ) ) ( not ( = ?auto_330444 ?auto_330448 ) ) ( not ( = ?auto_330444 ?auto_330449 ) ) ( not ( = ?auto_330444 ?auto_330450 ) ) ( not ( = ?auto_330444 ?auto_330451 ) ) ( not ( = ?auto_330444 ?auto_330452 ) ) ( not ( = ?auto_330444 ?auto_330453 ) ) ( not ( = ?auto_330445 ?auto_330446 ) ) ( not ( = ?auto_330445 ?auto_330447 ) ) ( not ( = ?auto_330445 ?auto_330448 ) ) ( not ( = ?auto_330445 ?auto_330449 ) ) ( not ( = ?auto_330445 ?auto_330450 ) ) ( not ( = ?auto_330445 ?auto_330451 ) ) ( not ( = ?auto_330445 ?auto_330452 ) ) ( not ( = ?auto_330445 ?auto_330453 ) ) ( not ( = ?auto_330446 ?auto_330447 ) ) ( not ( = ?auto_330446 ?auto_330448 ) ) ( not ( = ?auto_330446 ?auto_330449 ) ) ( not ( = ?auto_330446 ?auto_330450 ) ) ( not ( = ?auto_330446 ?auto_330451 ) ) ( not ( = ?auto_330446 ?auto_330452 ) ) ( not ( = ?auto_330446 ?auto_330453 ) ) ( not ( = ?auto_330447 ?auto_330448 ) ) ( not ( = ?auto_330447 ?auto_330449 ) ) ( not ( = ?auto_330447 ?auto_330450 ) ) ( not ( = ?auto_330447 ?auto_330451 ) ) ( not ( = ?auto_330447 ?auto_330452 ) ) ( not ( = ?auto_330447 ?auto_330453 ) ) ( not ( = ?auto_330448 ?auto_330449 ) ) ( not ( = ?auto_330448 ?auto_330450 ) ) ( not ( = ?auto_330448 ?auto_330451 ) ) ( not ( = ?auto_330448 ?auto_330452 ) ) ( not ( = ?auto_330448 ?auto_330453 ) ) ( not ( = ?auto_330449 ?auto_330450 ) ) ( not ( = ?auto_330449 ?auto_330451 ) ) ( not ( = ?auto_330449 ?auto_330452 ) ) ( not ( = ?auto_330449 ?auto_330453 ) ) ( not ( = ?auto_330450 ?auto_330451 ) ) ( not ( = ?auto_330450 ?auto_330452 ) ) ( not ( = ?auto_330450 ?auto_330453 ) ) ( not ( = ?auto_330451 ?auto_330452 ) ) ( not ( = ?auto_330451 ?auto_330453 ) ) ( not ( = ?auto_330452 ?auto_330453 ) ) ( ON ?auto_330451 ?auto_330452 ) ( ON ?auto_330450 ?auto_330451 ) ( ON ?auto_330449 ?auto_330450 ) ( ON ?auto_330448 ?auto_330449 ) ( ON ?auto_330447 ?auto_330448 ) ( ON ?auto_330446 ?auto_330447 ) ( ON ?auto_330445 ?auto_330446 ) ( ON ?auto_330444 ?auto_330445 ) ( ON ?auto_330443 ?auto_330444 ) ( ON ?auto_330442 ?auto_330443 ) ( CLEAR ?auto_330440 ) ( ON ?auto_330441 ?auto_330442 ) ( CLEAR ?auto_330441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330439 ?auto_330440 ?auto_330441 )
      ( MAKE-14PILE ?auto_330439 ?auto_330440 ?auto_330441 ?auto_330442 ?auto_330443 ?auto_330444 ?auto_330445 ?auto_330446 ?auto_330447 ?auto_330448 ?auto_330449 ?auto_330450 ?auto_330451 ?auto_330452 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330468 - BLOCK
      ?auto_330469 - BLOCK
      ?auto_330470 - BLOCK
      ?auto_330471 - BLOCK
      ?auto_330472 - BLOCK
      ?auto_330473 - BLOCK
      ?auto_330474 - BLOCK
      ?auto_330475 - BLOCK
      ?auto_330476 - BLOCK
      ?auto_330477 - BLOCK
      ?auto_330478 - BLOCK
      ?auto_330479 - BLOCK
      ?auto_330480 - BLOCK
      ?auto_330481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330481 ) ( ON-TABLE ?auto_330468 ) ( ON ?auto_330469 ?auto_330468 ) ( not ( = ?auto_330468 ?auto_330469 ) ) ( not ( = ?auto_330468 ?auto_330470 ) ) ( not ( = ?auto_330468 ?auto_330471 ) ) ( not ( = ?auto_330468 ?auto_330472 ) ) ( not ( = ?auto_330468 ?auto_330473 ) ) ( not ( = ?auto_330468 ?auto_330474 ) ) ( not ( = ?auto_330468 ?auto_330475 ) ) ( not ( = ?auto_330468 ?auto_330476 ) ) ( not ( = ?auto_330468 ?auto_330477 ) ) ( not ( = ?auto_330468 ?auto_330478 ) ) ( not ( = ?auto_330468 ?auto_330479 ) ) ( not ( = ?auto_330468 ?auto_330480 ) ) ( not ( = ?auto_330468 ?auto_330481 ) ) ( not ( = ?auto_330469 ?auto_330470 ) ) ( not ( = ?auto_330469 ?auto_330471 ) ) ( not ( = ?auto_330469 ?auto_330472 ) ) ( not ( = ?auto_330469 ?auto_330473 ) ) ( not ( = ?auto_330469 ?auto_330474 ) ) ( not ( = ?auto_330469 ?auto_330475 ) ) ( not ( = ?auto_330469 ?auto_330476 ) ) ( not ( = ?auto_330469 ?auto_330477 ) ) ( not ( = ?auto_330469 ?auto_330478 ) ) ( not ( = ?auto_330469 ?auto_330479 ) ) ( not ( = ?auto_330469 ?auto_330480 ) ) ( not ( = ?auto_330469 ?auto_330481 ) ) ( not ( = ?auto_330470 ?auto_330471 ) ) ( not ( = ?auto_330470 ?auto_330472 ) ) ( not ( = ?auto_330470 ?auto_330473 ) ) ( not ( = ?auto_330470 ?auto_330474 ) ) ( not ( = ?auto_330470 ?auto_330475 ) ) ( not ( = ?auto_330470 ?auto_330476 ) ) ( not ( = ?auto_330470 ?auto_330477 ) ) ( not ( = ?auto_330470 ?auto_330478 ) ) ( not ( = ?auto_330470 ?auto_330479 ) ) ( not ( = ?auto_330470 ?auto_330480 ) ) ( not ( = ?auto_330470 ?auto_330481 ) ) ( not ( = ?auto_330471 ?auto_330472 ) ) ( not ( = ?auto_330471 ?auto_330473 ) ) ( not ( = ?auto_330471 ?auto_330474 ) ) ( not ( = ?auto_330471 ?auto_330475 ) ) ( not ( = ?auto_330471 ?auto_330476 ) ) ( not ( = ?auto_330471 ?auto_330477 ) ) ( not ( = ?auto_330471 ?auto_330478 ) ) ( not ( = ?auto_330471 ?auto_330479 ) ) ( not ( = ?auto_330471 ?auto_330480 ) ) ( not ( = ?auto_330471 ?auto_330481 ) ) ( not ( = ?auto_330472 ?auto_330473 ) ) ( not ( = ?auto_330472 ?auto_330474 ) ) ( not ( = ?auto_330472 ?auto_330475 ) ) ( not ( = ?auto_330472 ?auto_330476 ) ) ( not ( = ?auto_330472 ?auto_330477 ) ) ( not ( = ?auto_330472 ?auto_330478 ) ) ( not ( = ?auto_330472 ?auto_330479 ) ) ( not ( = ?auto_330472 ?auto_330480 ) ) ( not ( = ?auto_330472 ?auto_330481 ) ) ( not ( = ?auto_330473 ?auto_330474 ) ) ( not ( = ?auto_330473 ?auto_330475 ) ) ( not ( = ?auto_330473 ?auto_330476 ) ) ( not ( = ?auto_330473 ?auto_330477 ) ) ( not ( = ?auto_330473 ?auto_330478 ) ) ( not ( = ?auto_330473 ?auto_330479 ) ) ( not ( = ?auto_330473 ?auto_330480 ) ) ( not ( = ?auto_330473 ?auto_330481 ) ) ( not ( = ?auto_330474 ?auto_330475 ) ) ( not ( = ?auto_330474 ?auto_330476 ) ) ( not ( = ?auto_330474 ?auto_330477 ) ) ( not ( = ?auto_330474 ?auto_330478 ) ) ( not ( = ?auto_330474 ?auto_330479 ) ) ( not ( = ?auto_330474 ?auto_330480 ) ) ( not ( = ?auto_330474 ?auto_330481 ) ) ( not ( = ?auto_330475 ?auto_330476 ) ) ( not ( = ?auto_330475 ?auto_330477 ) ) ( not ( = ?auto_330475 ?auto_330478 ) ) ( not ( = ?auto_330475 ?auto_330479 ) ) ( not ( = ?auto_330475 ?auto_330480 ) ) ( not ( = ?auto_330475 ?auto_330481 ) ) ( not ( = ?auto_330476 ?auto_330477 ) ) ( not ( = ?auto_330476 ?auto_330478 ) ) ( not ( = ?auto_330476 ?auto_330479 ) ) ( not ( = ?auto_330476 ?auto_330480 ) ) ( not ( = ?auto_330476 ?auto_330481 ) ) ( not ( = ?auto_330477 ?auto_330478 ) ) ( not ( = ?auto_330477 ?auto_330479 ) ) ( not ( = ?auto_330477 ?auto_330480 ) ) ( not ( = ?auto_330477 ?auto_330481 ) ) ( not ( = ?auto_330478 ?auto_330479 ) ) ( not ( = ?auto_330478 ?auto_330480 ) ) ( not ( = ?auto_330478 ?auto_330481 ) ) ( not ( = ?auto_330479 ?auto_330480 ) ) ( not ( = ?auto_330479 ?auto_330481 ) ) ( not ( = ?auto_330480 ?auto_330481 ) ) ( ON ?auto_330480 ?auto_330481 ) ( ON ?auto_330479 ?auto_330480 ) ( ON ?auto_330478 ?auto_330479 ) ( ON ?auto_330477 ?auto_330478 ) ( ON ?auto_330476 ?auto_330477 ) ( ON ?auto_330475 ?auto_330476 ) ( ON ?auto_330474 ?auto_330475 ) ( ON ?auto_330473 ?auto_330474 ) ( ON ?auto_330472 ?auto_330473 ) ( ON ?auto_330471 ?auto_330472 ) ( CLEAR ?auto_330469 ) ( ON ?auto_330470 ?auto_330471 ) ( CLEAR ?auto_330470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_330468 ?auto_330469 ?auto_330470 )
      ( MAKE-14PILE ?auto_330468 ?auto_330469 ?auto_330470 ?auto_330471 ?auto_330472 ?auto_330473 ?auto_330474 ?auto_330475 ?auto_330476 ?auto_330477 ?auto_330478 ?auto_330479 ?auto_330480 ?auto_330481 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330496 - BLOCK
      ?auto_330497 - BLOCK
      ?auto_330498 - BLOCK
      ?auto_330499 - BLOCK
      ?auto_330500 - BLOCK
      ?auto_330501 - BLOCK
      ?auto_330502 - BLOCK
      ?auto_330503 - BLOCK
      ?auto_330504 - BLOCK
      ?auto_330505 - BLOCK
      ?auto_330506 - BLOCK
      ?auto_330507 - BLOCK
      ?auto_330508 - BLOCK
      ?auto_330509 - BLOCK
    )
    :vars
    (
      ?auto_330510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330509 ?auto_330510 ) ( ON-TABLE ?auto_330496 ) ( not ( = ?auto_330496 ?auto_330497 ) ) ( not ( = ?auto_330496 ?auto_330498 ) ) ( not ( = ?auto_330496 ?auto_330499 ) ) ( not ( = ?auto_330496 ?auto_330500 ) ) ( not ( = ?auto_330496 ?auto_330501 ) ) ( not ( = ?auto_330496 ?auto_330502 ) ) ( not ( = ?auto_330496 ?auto_330503 ) ) ( not ( = ?auto_330496 ?auto_330504 ) ) ( not ( = ?auto_330496 ?auto_330505 ) ) ( not ( = ?auto_330496 ?auto_330506 ) ) ( not ( = ?auto_330496 ?auto_330507 ) ) ( not ( = ?auto_330496 ?auto_330508 ) ) ( not ( = ?auto_330496 ?auto_330509 ) ) ( not ( = ?auto_330496 ?auto_330510 ) ) ( not ( = ?auto_330497 ?auto_330498 ) ) ( not ( = ?auto_330497 ?auto_330499 ) ) ( not ( = ?auto_330497 ?auto_330500 ) ) ( not ( = ?auto_330497 ?auto_330501 ) ) ( not ( = ?auto_330497 ?auto_330502 ) ) ( not ( = ?auto_330497 ?auto_330503 ) ) ( not ( = ?auto_330497 ?auto_330504 ) ) ( not ( = ?auto_330497 ?auto_330505 ) ) ( not ( = ?auto_330497 ?auto_330506 ) ) ( not ( = ?auto_330497 ?auto_330507 ) ) ( not ( = ?auto_330497 ?auto_330508 ) ) ( not ( = ?auto_330497 ?auto_330509 ) ) ( not ( = ?auto_330497 ?auto_330510 ) ) ( not ( = ?auto_330498 ?auto_330499 ) ) ( not ( = ?auto_330498 ?auto_330500 ) ) ( not ( = ?auto_330498 ?auto_330501 ) ) ( not ( = ?auto_330498 ?auto_330502 ) ) ( not ( = ?auto_330498 ?auto_330503 ) ) ( not ( = ?auto_330498 ?auto_330504 ) ) ( not ( = ?auto_330498 ?auto_330505 ) ) ( not ( = ?auto_330498 ?auto_330506 ) ) ( not ( = ?auto_330498 ?auto_330507 ) ) ( not ( = ?auto_330498 ?auto_330508 ) ) ( not ( = ?auto_330498 ?auto_330509 ) ) ( not ( = ?auto_330498 ?auto_330510 ) ) ( not ( = ?auto_330499 ?auto_330500 ) ) ( not ( = ?auto_330499 ?auto_330501 ) ) ( not ( = ?auto_330499 ?auto_330502 ) ) ( not ( = ?auto_330499 ?auto_330503 ) ) ( not ( = ?auto_330499 ?auto_330504 ) ) ( not ( = ?auto_330499 ?auto_330505 ) ) ( not ( = ?auto_330499 ?auto_330506 ) ) ( not ( = ?auto_330499 ?auto_330507 ) ) ( not ( = ?auto_330499 ?auto_330508 ) ) ( not ( = ?auto_330499 ?auto_330509 ) ) ( not ( = ?auto_330499 ?auto_330510 ) ) ( not ( = ?auto_330500 ?auto_330501 ) ) ( not ( = ?auto_330500 ?auto_330502 ) ) ( not ( = ?auto_330500 ?auto_330503 ) ) ( not ( = ?auto_330500 ?auto_330504 ) ) ( not ( = ?auto_330500 ?auto_330505 ) ) ( not ( = ?auto_330500 ?auto_330506 ) ) ( not ( = ?auto_330500 ?auto_330507 ) ) ( not ( = ?auto_330500 ?auto_330508 ) ) ( not ( = ?auto_330500 ?auto_330509 ) ) ( not ( = ?auto_330500 ?auto_330510 ) ) ( not ( = ?auto_330501 ?auto_330502 ) ) ( not ( = ?auto_330501 ?auto_330503 ) ) ( not ( = ?auto_330501 ?auto_330504 ) ) ( not ( = ?auto_330501 ?auto_330505 ) ) ( not ( = ?auto_330501 ?auto_330506 ) ) ( not ( = ?auto_330501 ?auto_330507 ) ) ( not ( = ?auto_330501 ?auto_330508 ) ) ( not ( = ?auto_330501 ?auto_330509 ) ) ( not ( = ?auto_330501 ?auto_330510 ) ) ( not ( = ?auto_330502 ?auto_330503 ) ) ( not ( = ?auto_330502 ?auto_330504 ) ) ( not ( = ?auto_330502 ?auto_330505 ) ) ( not ( = ?auto_330502 ?auto_330506 ) ) ( not ( = ?auto_330502 ?auto_330507 ) ) ( not ( = ?auto_330502 ?auto_330508 ) ) ( not ( = ?auto_330502 ?auto_330509 ) ) ( not ( = ?auto_330502 ?auto_330510 ) ) ( not ( = ?auto_330503 ?auto_330504 ) ) ( not ( = ?auto_330503 ?auto_330505 ) ) ( not ( = ?auto_330503 ?auto_330506 ) ) ( not ( = ?auto_330503 ?auto_330507 ) ) ( not ( = ?auto_330503 ?auto_330508 ) ) ( not ( = ?auto_330503 ?auto_330509 ) ) ( not ( = ?auto_330503 ?auto_330510 ) ) ( not ( = ?auto_330504 ?auto_330505 ) ) ( not ( = ?auto_330504 ?auto_330506 ) ) ( not ( = ?auto_330504 ?auto_330507 ) ) ( not ( = ?auto_330504 ?auto_330508 ) ) ( not ( = ?auto_330504 ?auto_330509 ) ) ( not ( = ?auto_330504 ?auto_330510 ) ) ( not ( = ?auto_330505 ?auto_330506 ) ) ( not ( = ?auto_330505 ?auto_330507 ) ) ( not ( = ?auto_330505 ?auto_330508 ) ) ( not ( = ?auto_330505 ?auto_330509 ) ) ( not ( = ?auto_330505 ?auto_330510 ) ) ( not ( = ?auto_330506 ?auto_330507 ) ) ( not ( = ?auto_330506 ?auto_330508 ) ) ( not ( = ?auto_330506 ?auto_330509 ) ) ( not ( = ?auto_330506 ?auto_330510 ) ) ( not ( = ?auto_330507 ?auto_330508 ) ) ( not ( = ?auto_330507 ?auto_330509 ) ) ( not ( = ?auto_330507 ?auto_330510 ) ) ( not ( = ?auto_330508 ?auto_330509 ) ) ( not ( = ?auto_330508 ?auto_330510 ) ) ( not ( = ?auto_330509 ?auto_330510 ) ) ( ON ?auto_330508 ?auto_330509 ) ( ON ?auto_330507 ?auto_330508 ) ( ON ?auto_330506 ?auto_330507 ) ( ON ?auto_330505 ?auto_330506 ) ( ON ?auto_330504 ?auto_330505 ) ( ON ?auto_330503 ?auto_330504 ) ( ON ?auto_330502 ?auto_330503 ) ( ON ?auto_330501 ?auto_330502 ) ( ON ?auto_330500 ?auto_330501 ) ( ON ?auto_330499 ?auto_330500 ) ( ON ?auto_330498 ?auto_330499 ) ( CLEAR ?auto_330496 ) ( ON ?auto_330497 ?auto_330498 ) ( CLEAR ?auto_330497 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330496 ?auto_330497 )
      ( MAKE-14PILE ?auto_330496 ?auto_330497 ?auto_330498 ?auto_330499 ?auto_330500 ?auto_330501 ?auto_330502 ?auto_330503 ?auto_330504 ?auto_330505 ?auto_330506 ?auto_330507 ?auto_330508 ?auto_330509 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330525 - BLOCK
      ?auto_330526 - BLOCK
      ?auto_330527 - BLOCK
      ?auto_330528 - BLOCK
      ?auto_330529 - BLOCK
      ?auto_330530 - BLOCK
      ?auto_330531 - BLOCK
      ?auto_330532 - BLOCK
      ?auto_330533 - BLOCK
      ?auto_330534 - BLOCK
      ?auto_330535 - BLOCK
      ?auto_330536 - BLOCK
      ?auto_330537 - BLOCK
      ?auto_330538 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330538 ) ( ON-TABLE ?auto_330525 ) ( not ( = ?auto_330525 ?auto_330526 ) ) ( not ( = ?auto_330525 ?auto_330527 ) ) ( not ( = ?auto_330525 ?auto_330528 ) ) ( not ( = ?auto_330525 ?auto_330529 ) ) ( not ( = ?auto_330525 ?auto_330530 ) ) ( not ( = ?auto_330525 ?auto_330531 ) ) ( not ( = ?auto_330525 ?auto_330532 ) ) ( not ( = ?auto_330525 ?auto_330533 ) ) ( not ( = ?auto_330525 ?auto_330534 ) ) ( not ( = ?auto_330525 ?auto_330535 ) ) ( not ( = ?auto_330525 ?auto_330536 ) ) ( not ( = ?auto_330525 ?auto_330537 ) ) ( not ( = ?auto_330525 ?auto_330538 ) ) ( not ( = ?auto_330526 ?auto_330527 ) ) ( not ( = ?auto_330526 ?auto_330528 ) ) ( not ( = ?auto_330526 ?auto_330529 ) ) ( not ( = ?auto_330526 ?auto_330530 ) ) ( not ( = ?auto_330526 ?auto_330531 ) ) ( not ( = ?auto_330526 ?auto_330532 ) ) ( not ( = ?auto_330526 ?auto_330533 ) ) ( not ( = ?auto_330526 ?auto_330534 ) ) ( not ( = ?auto_330526 ?auto_330535 ) ) ( not ( = ?auto_330526 ?auto_330536 ) ) ( not ( = ?auto_330526 ?auto_330537 ) ) ( not ( = ?auto_330526 ?auto_330538 ) ) ( not ( = ?auto_330527 ?auto_330528 ) ) ( not ( = ?auto_330527 ?auto_330529 ) ) ( not ( = ?auto_330527 ?auto_330530 ) ) ( not ( = ?auto_330527 ?auto_330531 ) ) ( not ( = ?auto_330527 ?auto_330532 ) ) ( not ( = ?auto_330527 ?auto_330533 ) ) ( not ( = ?auto_330527 ?auto_330534 ) ) ( not ( = ?auto_330527 ?auto_330535 ) ) ( not ( = ?auto_330527 ?auto_330536 ) ) ( not ( = ?auto_330527 ?auto_330537 ) ) ( not ( = ?auto_330527 ?auto_330538 ) ) ( not ( = ?auto_330528 ?auto_330529 ) ) ( not ( = ?auto_330528 ?auto_330530 ) ) ( not ( = ?auto_330528 ?auto_330531 ) ) ( not ( = ?auto_330528 ?auto_330532 ) ) ( not ( = ?auto_330528 ?auto_330533 ) ) ( not ( = ?auto_330528 ?auto_330534 ) ) ( not ( = ?auto_330528 ?auto_330535 ) ) ( not ( = ?auto_330528 ?auto_330536 ) ) ( not ( = ?auto_330528 ?auto_330537 ) ) ( not ( = ?auto_330528 ?auto_330538 ) ) ( not ( = ?auto_330529 ?auto_330530 ) ) ( not ( = ?auto_330529 ?auto_330531 ) ) ( not ( = ?auto_330529 ?auto_330532 ) ) ( not ( = ?auto_330529 ?auto_330533 ) ) ( not ( = ?auto_330529 ?auto_330534 ) ) ( not ( = ?auto_330529 ?auto_330535 ) ) ( not ( = ?auto_330529 ?auto_330536 ) ) ( not ( = ?auto_330529 ?auto_330537 ) ) ( not ( = ?auto_330529 ?auto_330538 ) ) ( not ( = ?auto_330530 ?auto_330531 ) ) ( not ( = ?auto_330530 ?auto_330532 ) ) ( not ( = ?auto_330530 ?auto_330533 ) ) ( not ( = ?auto_330530 ?auto_330534 ) ) ( not ( = ?auto_330530 ?auto_330535 ) ) ( not ( = ?auto_330530 ?auto_330536 ) ) ( not ( = ?auto_330530 ?auto_330537 ) ) ( not ( = ?auto_330530 ?auto_330538 ) ) ( not ( = ?auto_330531 ?auto_330532 ) ) ( not ( = ?auto_330531 ?auto_330533 ) ) ( not ( = ?auto_330531 ?auto_330534 ) ) ( not ( = ?auto_330531 ?auto_330535 ) ) ( not ( = ?auto_330531 ?auto_330536 ) ) ( not ( = ?auto_330531 ?auto_330537 ) ) ( not ( = ?auto_330531 ?auto_330538 ) ) ( not ( = ?auto_330532 ?auto_330533 ) ) ( not ( = ?auto_330532 ?auto_330534 ) ) ( not ( = ?auto_330532 ?auto_330535 ) ) ( not ( = ?auto_330532 ?auto_330536 ) ) ( not ( = ?auto_330532 ?auto_330537 ) ) ( not ( = ?auto_330532 ?auto_330538 ) ) ( not ( = ?auto_330533 ?auto_330534 ) ) ( not ( = ?auto_330533 ?auto_330535 ) ) ( not ( = ?auto_330533 ?auto_330536 ) ) ( not ( = ?auto_330533 ?auto_330537 ) ) ( not ( = ?auto_330533 ?auto_330538 ) ) ( not ( = ?auto_330534 ?auto_330535 ) ) ( not ( = ?auto_330534 ?auto_330536 ) ) ( not ( = ?auto_330534 ?auto_330537 ) ) ( not ( = ?auto_330534 ?auto_330538 ) ) ( not ( = ?auto_330535 ?auto_330536 ) ) ( not ( = ?auto_330535 ?auto_330537 ) ) ( not ( = ?auto_330535 ?auto_330538 ) ) ( not ( = ?auto_330536 ?auto_330537 ) ) ( not ( = ?auto_330536 ?auto_330538 ) ) ( not ( = ?auto_330537 ?auto_330538 ) ) ( ON ?auto_330537 ?auto_330538 ) ( ON ?auto_330536 ?auto_330537 ) ( ON ?auto_330535 ?auto_330536 ) ( ON ?auto_330534 ?auto_330535 ) ( ON ?auto_330533 ?auto_330534 ) ( ON ?auto_330532 ?auto_330533 ) ( ON ?auto_330531 ?auto_330532 ) ( ON ?auto_330530 ?auto_330531 ) ( ON ?auto_330529 ?auto_330530 ) ( ON ?auto_330528 ?auto_330529 ) ( ON ?auto_330527 ?auto_330528 ) ( CLEAR ?auto_330525 ) ( ON ?auto_330526 ?auto_330527 ) ( CLEAR ?auto_330526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_330525 ?auto_330526 )
      ( MAKE-14PILE ?auto_330525 ?auto_330526 ?auto_330527 ?auto_330528 ?auto_330529 ?auto_330530 ?auto_330531 ?auto_330532 ?auto_330533 ?auto_330534 ?auto_330535 ?auto_330536 ?auto_330537 ?auto_330538 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330553 - BLOCK
      ?auto_330554 - BLOCK
      ?auto_330555 - BLOCK
      ?auto_330556 - BLOCK
      ?auto_330557 - BLOCK
      ?auto_330558 - BLOCK
      ?auto_330559 - BLOCK
      ?auto_330560 - BLOCK
      ?auto_330561 - BLOCK
      ?auto_330562 - BLOCK
      ?auto_330563 - BLOCK
      ?auto_330564 - BLOCK
      ?auto_330565 - BLOCK
      ?auto_330566 - BLOCK
    )
    :vars
    (
      ?auto_330567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_330566 ?auto_330567 ) ( not ( = ?auto_330553 ?auto_330554 ) ) ( not ( = ?auto_330553 ?auto_330555 ) ) ( not ( = ?auto_330553 ?auto_330556 ) ) ( not ( = ?auto_330553 ?auto_330557 ) ) ( not ( = ?auto_330553 ?auto_330558 ) ) ( not ( = ?auto_330553 ?auto_330559 ) ) ( not ( = ?auto_330553 ?auto_330560 ) ) ( not ( = ?auto_330553 ?auto_330561 ) ) ( not ( = ?auto_330553 ?auto_330562 ) ) ( not ( = ?auto_330553 ?auto_330563 ) ) ( not ( = ?auto_330553 ?auto_330564 ) ) ( not ( = ?auto_330553 ?auto_330565 ) ) ( not ( = ?auto_330553 ?auto_330566 ) ) ( not ( = ?auto_330553 ?auto_330567 ) ) ( not ( = ?auto_330554 ?auto_330555 ) ) ( not ( = ?auto_330554 ?auto_330556 ) ) ( not ( = ?auto_330554 ?auto_330557 ) ) ( not ( = ?auto_330554 ?auto_330558 ) ) ( not ( = ?auto_330554 ?auto_330559 ) ) ( not ( = ?auto_330554 ?auto_330560 ) ) ( not ( = ?auto_330554 ?auto_330561 ) ) ( not ( = ?auto_330554 ?auto_330562 ) ) ( not ( = ?auto_330554 ?auto_330563 ) ) ( not ( = ?auto_330554 ?auto_330564 ) ) ( not ( = ?auto_330554 ?auto_330565 ) ) ( not ( = ?auto_330554 ?auto_330566 ) ) ( not ( = ?auto_330554 ?auto_330567 ) ) ( not ( = ?auto_330555 ?auto_330556 ) ) ( not ( = ?auto_330555 ?auto_330557 ) ) ( not ( = ?auto_330555 ?auto_330558 ) ) ( not ( = ?auto_330555 ?auto_330559 ) ) ( not ( = ?auto_330555 ?auto_330560 ) ) ( not ( = ?auto_330555 ?auto_330561 ) ) ( not ( = ?auto_330555 ?auto_330562 ) ) ( not ( = ?auto_330555 ?auto_330563 ) ) ( not ( = ?auto_330555 ?auto_330564 ) ) ( not ( = ?auto_330555 ?auto_330565 ) ) ( not ( = ?auto_330555 ?auto_330566 ) ) ( not ( = ?auto_330555 ?auto_330567 ) ) ( not ( = ?auto_330556 ?auto_330557 ) ) ( not ( = ?auto_330556 ?auto_330558 ) ) ( not ( = ?auto_330556 ?auto_330559 ) ) ( not ( = ?auto_330556 ?auto_330560 ) ) ( not ( = ?auto_330556 ?auto_330561 ) ) ( not ( = ?auto_330556 ?auto_330562 ) ) ( not ( = ?auto_330556 ?auto_330563 ) ) ( not ( = ?auto_330556 ?auto_330564 ) ) ( not ( = ?auto_330556 ?auto_330565 ) ) ( not ( = ?auto_330556 ?auto_330566 ) ) ( not ( = ?auto_330556 ?auto_330567 ) ) ( not ( = ?auto_330557 ?auto_330558 ) ) ( not ( = ?auto_330557 ?auto_330559 ) ) ( not ( = ?auto_330557 ?auto_330560 ) ) ( not ( = ?auto_330557 ?auto_330561 ) ) ( not ( = ?auto_330557 ?auto_330562 ) ) ( not ( = ?auto_330557 ?auto_330563 ) ) ( not ( = ?auto_330557 ?auto_330564 ) ) ( not ( = ?auto_330557 ?auto_330565 ) ) ( not ( = ?auto_330557 ?auto_330566 ) ) ( not ( = ?auto_330557 ?auto_330567 ) ) ( not ( = ?auto_330558 ?auto_330559 ) ) ( not ( = ?auto_330558 ?auto_330560 ) ) ( not ( = ?auto_330558 ?auto_330561 ) ) ( not ( = ?auto_330558 ?auto_330562 ) ) ( not ( = ?auto_330558 ?auto_330563 ) ) ( not ( = ?auto_330558 ?auto_330564 ) ) ( not ( = ?auto_330558 ?auto_330565 ) ) ( not ( = ?auto_330558 ?auto_330566 ) ) ( not ( = ?auto_330558 ?auto_330567 ) ) ( not ( = ?auto_330559 ?auto_330560 ) ) ( not ( = ?auto_330559 ?auto_330561 ) ) ( not ( = ?auto_330559 ?auto_330562 ) ) ( not ( = ?auto_330559 ?auto_330563 ) ) ( not ( = ?auto_330559 ?auto_330564 ) ) ( not ( = ?auto_330559 ?auto_330565 ) ) ( not ( = ?auto_330559 ?auto_330566 ) ) ( not ( = ?auto_330559 ?auto_330567 ) ) ( not ( = ?auto_330560 ?auto_330561 ) ) ( not ( = ?auto_330560 ?auto_330562 ) ) ( not ( = ?auto_330560 ?auto_330563 ) ) ( not ( = ?auto_330560 ?auto_330564 ) ) ( not ( = ?auto_330560 ?auto_330565 ) ) ( not ( = ?auto_330560 ?auto_330566 ) ) ( not ( = ?auto_330560 ?auto_330567 ) ) ( not ( = ?auto_330561 ?auto_330562 ) ) ( not ( = ?auto_330561 ?auto_330563 ) ) ( not ( = ?auto_330561 ?auto_330564 ) ) ( not ( = ?auto_330561 ?auto_330565 ) ) ( not ( = ?auto_330561 ?auto_330566 ) ) ( not ( = ?auto_330561 ?auto_330567 ) ) ( not ( = ?auto_330562 ?auto_330563 ) ) ( not ( = ?auto_330562 ?auto_330564 ) ) ( not ( = ?auto_330562 ?auto_330565 ) ) ( not ( = ?auto_330562 ?auto_330566 ) ) ( not ( = ?auto_330562 ?auto_330567 ) ) ( not ( = ?auto_330563 ?auto_330564 ) ) ( not ( = ?auto_330563 ?auto_330565 ) ) ( not ( = ?auto_330563 ?auto_330566 ) ) ( not ( = ?auto_330563 ?auto_330567 ) ) ( not ( = ?auto_330564 ?auto_330565 ) ) ( not ( = ?auto_330564 ?auto_330566 ) ) ( not ( = ?auto_330564 ?auto_330567 ) ) ( not ( = ?auto_330565 ?auto_330566 ) ) ( not ( = ?auto_330565 ?auto_330567 ) ) ( not ( = ?auto_330566 ?auto_330567 ) ) ( ON ?auto_330565 ?auto_330566 ) ( ON ?auto_330564 ?auto_330565 ) ( ON ?auto_330563 ?auto_330564 ) ( ON ?auto_330562 ?auto_330563 ) ( ON ?auto_330561 ?auto_330562 ) ( ON ?auto_330560 ?auto_330561 ) ( ON ?auto_330559 ?auto_330560 ) ( ON ?auto_330558 ?auto_330559 ) ( ON ?auto_330557 ?auto_330558 ) ( ON ?auto_330556 ?auto_330557 ) ( ON ?auto_330555 ?auto_330556 ) ( ON ?auto_330554 ?auto_330555 ) ( ON ?auto_330553 ?auto_330554 ) ( CLEAR ?auto_330553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330553 )
      ( MAKE-14PILE ?auto_330553 ?auto_330554 ?auto_330555 ?auto_330556 ?auto_330557 ?auto_330558 ?auto_330559 ?auto_330560 ?auto_330561 ?auto_330562 ?auto_330563 ?auto_330564 ?auto_330565 ?auto_330566 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330582 - BLOCK
      ?auto_330583 - BLOCK
      ?auto_330584 - BLOCK
      ?auto_330585 - BLOCK
      ?auto_330586 - BLOCK
      ?auto_330587 - BLOCK
      ?auto_330588 - BLOCK
      ?auto_330589 - BLOCK
      ?auto_330590 - BLOCK
      ?auto_330591 - BLOCK
      ?auto_330592 - BLOCK
      ?auto_330593 - BLOCK
      ?auto_330594 - BLOCK
      ?auto_330595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_330595 ) ( not ( = ?auto_330582 ?auto_330583 ) ) ( not ( = ?auto_330582 ?auto_330584 ) ) ( not ( = ?auto_330582 ?auto_330585 ) ) ( not ( = ?auto_330582 ?auto_330586 ) ) ( not ( = ?auto_330582 ?auto_330587 ) ) ( not ( = ?auto_330582 ?auto_330588 ) ) ( not ( = ?auto_330582 ?auto_330589 ) ) ( not ( = ?auto_330582 ?auto_330590 ) ) ( not ( = ?auto_330582 ?auto_330591 ) ) ( not ( = ?auto_330582 ?auto_330592 ) ) ( not ( = ?auto_330582 ?auto_330593 ) ) ( not ( = ?auto_330582 ?auto_330594 ) ) ( not ( = ?auto_330582 ?auto_330595 ) ) ( not ( = ?auto_330583 ?auto_330584 ) ) ( not ( = ?auto_330583 ?auto_330585 ) ) ( not ( = ?auto_330583 ?auto_330586 ) ) ( not ( = ?auto_330583 ?auto_330587 ) ) ( not ( = ?auto_330583 ?auto_330588 ) ) ( not ( = ?auto_330583 ?auto_330589 ) ) ( not ( = ?auto_330583 ?auto_330590 ) ) ( not ( = ?auto_330583 ?auto_330591 ) ) ( not ( = ?auto_330583 ?auto_330592 ) ) ( not ( = ?auto_330583 ?auto_330593 ) ) ( not ( = ?auto_330583 ?auto_330594 ) ) ( not ( = ?auto_330583 ?auto_330595 ) ) ( not ( = ?auto_330584 ?auto_330585 ) ) ( not ( = ?auto_330584 ?auto_330586 ) ) ( not ( = ?auto_330584 ?auto_330587 ) ) ( not ( = ?auto_330584 ?auto_330588 ) ) ( not ( = ?auto_330584 ?auto_330589 ) ) ( not ( = ?auto_330584 ?auto_330590 ) ) ( not ( = ?auto_330584 ?auto_330591 ) ) ( not ( = ?auto_330584 ?auto_330592 ) ) ( not ( = ?auto_330584 ?auto_330593 ) ) ( not ( = ?auto_330584 ?auto_330594 ) ) ( not ( = ?auto_330584 ?auto_330595 ) ) ( not ( = ?auto_330585 ?auto_330586 ) ) ( not ( = ?auto_330585 ?auto_330587 ) ) ( not ( = ?auto_330585 ?auto_330588 ) ) ( not ( = ?auto_330585 ?auto_330589 ) ) ( not ( = ?auto_330585 ?auto_330590 ) ) ( not ( = ?auto_330585 ?auto_330591 ) ) ( not ( = ?auto_330585 ?auto_330592 ) ) ( not ( = ?auto_330585 ?auto_330593 ) ) ( not ( = ?auto_330585 ?auto_330594 ) ) ( not ( = ?auto_330585 ?auto_330595 ) ) ( not ( = ?auto_330586 ?auto_330587 ) ) ( not ( = ?auto_330586 ?auto_330588 ) ) ( not ( = ?auto_330586 ?auto_330589 ) ) ( not ( = ?auto_330586 ?auto_330590 ) ) ( not ( = ?auto_330586 ?auto_330591 ) ) ( not ( = ?auto_330586 ?auto_330592 ) ) ( not ( = ?auto_330586 ?auto_330593 ) ) ( not ( = ?auto_330586 ?auto_330594 ) ) ( not ( = ?auto_330586 ?auto_330595 ) ) ( not ( = ?auto_330587 ?auto_330588 ) ) ( not ( = ?auto_330587 ?auto_330589 ) ) ( not ( = ?auto_330587 ?auto_330590 ) ) ( not ( = ?auto_330587 ?auto_330591 ) ) ( not ( = ?auto_330587 ?auto_330592 ) ) ( not ( = ?auto_330587 ?auto_330593 ) ) ( not ( = ?auto_330587 ?auto_330594 ) ) ( not ( = ?auto_330587 ?auto_330595 ) ) ( not ( = ?auto_330588 ?auto_330589 ) ) ( not ( = ?auto_330588 ?auto_330590 ) ) ( not ( = ?auto_330588 ?auto_330591 ) ) ( not ( = ?auto_330588 ?auto_330592 ) ) ( not ( = ?auto_330588 ?auto_330593 ) ) ( not ( = ?auto_330588 ?auto_330594 ) ) ( not ( = ?auto_330588 ?auto_330595 ) ) ( not ( = ?auto_330589 ?auto_330590 ) ) ( not ( = ?auto_330589 ?auto_330591 ) ) ( not ( = ?auto_330589 ?auto_330592 ) ) ( not ( = ?auto_330589 ?auto_330593 ) ) ( not ( = ?auto_330589 ?auto_330594 ) ) ( not ( = ?auto_330589 ?auto_330595 ) ) ( not ( = ?auto_330590 ?auto_330591 ) ) ( not ( = ?auto_330590 ?auto_330592 ) ) ( not ( = ?auto_330590 ?auto_330593 ) ) ( not ( = ?auto_330590 ?auto_330594 ) ) ( not ( = ?auto_330590 ?auto_330595 ) ) ( not ( = ?auto_330591 ?auto_330592 ) ) ( not ( = ?auto_330591 ?auto_330593 ) ) ( not ( = ?auto_330591 ?auto_330594 ) ) ( not ( = ?auto_330591 ?auto_330595 ) ) ( not ( = ?auto_330592 ?auto_330593 ) ) ( not ( = ?auto_330592 ?auto_330594 ) ) ( not ( = ?auto_330592 ?auto_330595 ) ) ( not ( = ?auto_330593 ?auto_330594 ) ) ( not ( = ?auto_330593 ?auto_330595 ) ) ( not ( = ?auto_330594 ?auto_330595 ) ) ( ON ?auto_330594 ?auto_330595 ) ( ON ?auto_330593 ?auto_330594 ) ( ON ?auto_330592 ?auto_330593 ) ( ON ?auto_330591 ?auto_330592 ) ( ON ?auto_330590 ?auto_330591 ) ( ON ?auto_330589 ?auto_330590 ) ( ON ?auto_330588 ?auto_330589 ) ( ON ?auto_330587 ?auto_330588 ) ( ON ?auto_330586 ?auto_330587 ) ( ON ?auto_330585 ?auto_330586 ) ( ON ?auto_330584 ?auto_330585 ) ( ON ?auto_330583 ?auto_330584 ) ( ON ?auto_330582 ?auto_330583 ) ( CLEAR ?auto_330582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_330582 )
      ( MAKE-14PILE ?auto_330582 ?auto_330583 ?auto_330584 ?auto_330585 ?auto_330586 ?auto_330587 ?auto_330588 ?auto_330589 ?auto_330590 ?auto_330591 ?auto_330592 ?auto_330593 ?auto_330594 ?auto_330595 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_330610 - BLOCK
      ?auto_330611 - BLOCK
      ?auto_330612 - BLOCK
      ?auto_330613 - BLOCK
      ?auto_330614 - BLOCK
      ?auto_330615 - BLOCK
      ?auto_330616 - BLOCK
      ?auto_330617 - BLOCK
      ?auto_330618 - BLOCK
      ?auto_330619 - BLOCK
      ?auto_330620 - BLOCK
      ?auto_330621 - BLOCK
      ?auto_330622 - BLOCK
      ?auto_330623 - BLOCK
    )
    :vars
    (
      ?auto_330624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_330610 ?auto_330611 ) ) ( not ( = ?auto_330610 ?auto_330612 ) ) ( not ( = ?auto_330610 ?auto_330613 ) ) ( not ( = ?auto_330610 ?auto_330614 ) ) ( not ( = ?auto_330610 ?auto_330615 ) ) ( not ( = ?auto_330610 ?auto_330616 ) ) ( not ( = ?auto_330610 ?auto_330617 ) ) ( not ( = ?auto_330610 ?auto_330618 ) ) ( not ( = ?auto_330610 ?auto_330619 ) ) ( not ( = ?auto_330610 ?auto_330620 ) ) ( not ( = ?auto_330610 ?auto_330621 ) ) ( not ( = ?auto_330610 ?auto_330622 ) ) ( not ( = ?auto_330610 ?auto_330623 ) ) ( not ( = ?auto_330611 ?auto_330612 ) ) ( not ( = ?auto_330611 ?auto_330613 ) ) ( not ( = ?auto_330611 ?auto_330614 ) ) ( not ( = ?auto_330611 ?auto_330615 ) ) ( not ( = ?auto_330611 ?auto_330616 ) ) ( not ( = ?auto_330611 ?auto_330617 ) ) ( not ( = ?auto_330611 ?auto_330618 ) ) ( not ( = ?auto_330611 ?auto_330619 ) ) ( not ( = ?auto_330611 ?auto_330620 ) ) ( not ( = ?auto_330611 ?auto_330621 ) ) ( not ( = ?auto_330611 ?auto_330622 ) ) ( not ( = ?auto_330611 ?auto_330623 ) ) ( not ( = ?auto_330612 ?auto_330613 ) ) ( not ( = ?auto_330612 ?auto_330614 ) ) ( not ( = ?auto_330612 ?auto_330615 ) ) ( not ( = ?auto_330612 ?auto_330616 ) ) ( not ( = ?auto_330612 ?auto_330617 ) ) ( not ( = ?auto_330612 ?auto_330618 ) ) ( not ( = ?auto_330612 ?auto_330619 ) ) ( not ( = ?auto_330612 ?auto_330620 ) ) ( not ( = ?auto_330612 ?auto_330621 ) ) ( not ( = ?auto_330612 ?auto_330622 ) ) ( not ( = ?auto_330612 ?auto_330623 ) ) ( not ( = ?auto_330613 ?auto_330614 ) ) ( not ( = ?auto_330613 ?auto_330615 ) ) ( not ( = ?auto_330613 ?auto_330616 ) ) ( not ( = ?auto_330613 ?auto_330617 ) ) ( not ( = ?auto_330613 ?auto_330618 ) ) ( not ( = ?auto_330613 ?auto_330619 ) ) ( not ( = ?auto_330613 ?auto_330620 ) ) ( not ( = ?auto_330613 ?auto_330621 ) ) ( not ( = ?auto_330613 ?auto_330622 ) ) ( not ( = ?auto_330613 ?auto_330623 ) ) ( not ( = ?auto_330614 ?auto_330615 ) ) ( not ( = ?auto_330614 ?auto_330616 ) ) ( not ( = ?auto_330614 ?auto_330617 ) ) ( not ( = ?auto_330614 ?auto_330618 ) ) ( not ( = ?auto_330614 ?auto_330619 ) ) ( not ( = ?auto_330614 ?auto_330620 ) ) ( not ( = ?auto_330614 ?auto_330621 ) ) ( not ( = ?auto_330614 ?auto_330622 ) ) ( not ( = ?auto_330614 ?auto_330623 ) ) ( not ( = ?auto_330615 ?auto_330616 ) ) ( not ( = ?auto_330615 ?auto_330617 ) ) ( not ( = ?auto_330615 ?auto_330618 ) ) ( not ( = ?auto_330615 ?auto_330619 ) ) ( not ( = ?auto_330615 ?auto_330620 ) ) ( not ( = ?auto_330615 ?auto_330621 ) ) ( not ( = ?auto_330615 ?auto_330622 ) ) ( not ( = ?auto_330615 ?auto_330623 ) ) ( not ( = ?auto_330616 ?auto_330617 ) ) ( not ( = ?auto_330616 ?auto_330618 ) ) ( not ( = ?auto_330616 ?auto_330619 ) ) ( not ( = ?auto_330616 ?auto_330620 ) ) ( not ( = ?auto_330616 ?auto_330621 ) ) ( not ( = ?auto_330616 ?auto_330622 ) ) ( not ( = ?auto_330616 ?auto_330623 ) ) ( not ( = ?auto_330617 ?auto_330618 ) ) ( not ( = ?auto_330617 ?auto_330619 ) ) ( not ( = ?auto_330617 ?auto_330620 ) ) ( not ( = ?auto_330617 ?auto_330621 ) ) ( not ( = ?auto_330617 ?auto_330622 ) ) ( not ( = ?auto_330617 ?auto_330623 ) ) ( not ( = ?auto_330618 ?auto_330619 ) ) ( not ( = ?auto_330618 ?auto_330620 ) ) ( not ( = ?auto_330618 ?auto_330621 ) ) ( not ( = ?auto_330618 ?auto_330622 ) ) ( not ( = ?auto_330618 ?auto_330623 ) ) ( not ( = ?auto_330619 ?auto_330620 ) ) ( not ( = ?auto_330619 ?auto_330621 ) ) ( not ( = ?auto_330619 ?auto_330622 ) ) ( not ( = ?auto_330619 ?auto_330623 ) ) ( not ( = ?auto_330620 ?auto_330621 ) ) ( not ( = ?auto_330620 ?auto_330622 ) ) ( not ( = ?auto_330620 ?auto_330623 ) ) ( not ( = ?auto_330621 ?auto_330622 ) ) ( not ( = ?auto_330621 ?auto_330623 ) ) ( not ( = ?auto_330622 ?auto_330623 ) ) ( ON ?auto_330610 ?auto_330624 ) ( not ( = ?auto_330623 ?auto_330624 ) ) ( not ( = ?auto_330622 ?auto_330624 ) ) ( not ( = ?auto_330621 ?auto_330624 ) ) ( not ( = ?auto_330620 ?auto_330624 ) ) ( not ( = ?auto_330619 ?auto_330624 ) ) ( not ( = ?auto_330618 ?auto_330624 ) ) ( not ( = ?auto_330617 ?auto_330624 ) ) ( not ( = ?auto_330616 ?auto_330624 ) ) ( not ( = ?auto_330615 ?auto_330624 ) ) ( not ( = ?auto_330614 ?auto_330624 ) ) ( not ( = ?auto_330613 ?auto_330624 ) ) ( not ( = ?auto_330612 ?auto_330624 ) ) ( not ( = ?auto_330611 ?auto_330624 ) ) ( not ( = ?auto_330610 ?auto_330624 ) ) ( ON ?auto_330611 ?auto_330610 ) ( ON ?auto_330612 ?auto_330611 ) ( ON ?auto_330613 ?auto_330612 ) ( ON ?auto_330614 ?auto_330613 ) ( ON ?auto_330615 ?auto_330614 ) ( ON ?auto_330616 ?auto_330615 ) ( ON ?auto_330617 ?auto_330616 ) ( ON ?auto_330618 ?auto_330617 ) ( ON ?auto_330619 ?auto_330618 ) ( ON ?auto_330620 ?auto_330619 ) ( ON ?auto_330621 ?auto_330620 ) ( ON ?auto_330622 ?auto_330621 ) ( ON ?auto_330623 ?auto_330622 ) ( CLEAR ?auto_330623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_330623 ?auto_330622 ?auto_330621 ?auto_330620 ?auto_330619 ?auto_330618 ?auto_330617 ?auto_330616 ?auto_330615 ?auto_330614 ?auto_330613 ?auto_330612 ?auto_330611 ?auto_330610 )
      ( MAKE-14PILE ?auto_330610 ?auto_330611 ?auto_330612 ?auto_330613 ?auto_330614 ?auto_330615 ?auto_330616 ?auto_330617 ?auto_330618 ?auto_330619 ?auto_330620 ?auto_330621 ?auto_330622 ?auto_330623 ) )
  )

)

