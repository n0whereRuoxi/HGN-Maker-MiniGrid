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

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_169402 - BLOCK
      ?auto_169403 - BLOCK
      ?auto_169404 - BLOCK
      ?auto_169405 - BLOCK
      ?auto_169406 - BLOCK
      ?auto_169407 - BLOCK
      ?auto_169408 - BLOCK
      ?auto_169409 - BLOCK
    )
    :vars
    (
      ?auto_169410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169410 ?auto_169409 ) ( CLEAR ?auto_169410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169402 ) ( ON ?auto_169403 ?auto_169402 ) ( ON ?auto_169404 ?auto_169403 ) ( ON ?auto_169405 ?auto_169404 ) ( ON ?auto_169406 ?auto_169405 ) ( ON ?auto_169407 ?auto_169406 ) ( ON ?auto_169408 ?auto_169407 ) ( ON ?auto_169409 ?auto_169408 ) ( not ( = ?auto_169402 ?auto_169403 ) ) ( not ( = ?auto_169402 ?auto_169404 ) ) ( not ( = ?auto_169402 ?auto_169405 ) ) ( not ( = ?auto_169402 ?auto_169406 ) ) ( not ( = ?auto_169402 ?auto_169407 ) ) ( not ( = ?auto_169402 ?auto_169408 ) ) ( not ( = ?auto_169402 ?auto_169409 ) ) ( not ( = ?auto_169402 ?auto_169410 ) ) ( not ( = ?auto_169403 ?auto_169404 ) ) ( not ( = ?auto_169403 ?auto_169405 ) ) ( not ( = ?auto_169403 ?auto_169406 ) ) ( not ( = ?auto_169403 ?auto_169407 ) ) ( not ( = ?auto_169403 ?auto_169408 ) ) ( not ( = ?auto_169403 ?auto_169409 ) ) ( not ( = ?auto_169403 ?auto_169410 ) ) ( not ( = ?auto_169404 ?auto_169405 ) ) ( not ( = ?auto_169404 ?auto_169406 ) ) ( not ( = ?auto_169404 ?auto_169407 ) ) ( not ( = ?auto_169404 ?auto_169408 ) ) ( not ( = ?auto_169404 ?auto_169409 ) ) ( not ( = ?auto_169404 ?auto_169410 ) ) ( not ( = ?auto_169405 ?auto_169406 ) ) ( not ( = ?auto_169405 ?auto_169407 ) ) ( not ( = ?auto_169405 ?auto_169408 ) ) ( not ( = ?auto_169405 ?auto_169409 ) ) ( not ( = ?auto_169405 ?auto_169410 ) ) ( not ( = ?auto_169406 ?auto_169407 ) ) ( not ( = ?auto_169406 ?auto_169408 ) ) ( not ( = ?auto_169406 ?auto_169409 ) ) ( not ( = ?auto_169406 ?auto_169410 ) ) ( not ( = ?auto_169407 ?auto_169408 ) ) ( not ( = ?auto_169407 ?auto_169409 ) ) ( not ( = ?auto_169407 ?auto_169410 ) ) ( not ( = ?auto_169408 ?auto_169409 ) ) ( not ( = ?auto_169408 ?auto_169410 ) ) ( not ( = ?auto_169409 ?auto_169410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169410 ?auto_169409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_169412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169412 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_169412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_169413 - BLOCK
    )
    :vars
    (
      ?auto_169414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169413 ?auto_169414 ) ( CLEAR ?auto_169413 ) ( HAND-EMPTY ) ( not ( = ?auto_169413 ?auto_169414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169413 ?auto_169414 )
      ( MAKE-1PILE ?auto_169413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169422 - BLOCK
      ?auto_169423 - BLOCK
      ?auto_169424 - BLOCK
      ?auto_169425 - BLOCK
      ?auto_169426 - BLOCK
      ?auto_169427 - BLOCK
      ?auto_169428 - BLOCK
    )
    :vars
    (
      ?auto_169429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169429 ?auto_169428 ) ( CLEAR ?auto_169429 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169422 ) ( ON ?auto_169423 ?auto_169422 ) ( ON ?auto_169424 ?auto_169423 ) ( ON ?auto_169425 ?auto_169424 ) ( ON ?auto_169426 ?auto_169425 ) ( ON ?auto_169427 ?auto_169426 ) ( ON ?auto_169428 ?auto_169427 ) ( not ( = ?auto_169422 ?auto_169423 ) ) ( not ( = ?auto_169422 ?auto_169424 ) ) ( not ( = ?auto_169422 ?auto_169425 ) ) ( not ( = ?auto_169422 ?auto_169426 ) ) ( not ( = ?auto_169422 ?auto_169427 ) ) ( not ( = ?auto_169422 ?auto_169428 ) ) ( not ( = ?auto_169422 ?auto_169429 ) ) ( not ( = ?auto_169423 ?auto_169424 ) ) ( not ( = ?auto_169423 ?auto_169425 ) ) ( not ( = ?auto_169423 ?auto_169426 ) ) ( not ( = ?auto_169423 ?auto_169427 ) ) ( not ( = ?auto_169423 ?auto_169428 ) ) ( not ( = ?auto_169423 ?auto_169429 ) ) ( not ( = ?auto_169424 ?auto_169425 ) ) ( not ( = ?auto_169424 ?auto_169426 ) ) ( not ( = ?auto_169424 ?auto_169427 ) ) ( not ( = ?auto_169424 ?auto_169428 ) ) ( not ( = ?auto_169424 ?auto_169429 ) ) ( not ( = ?auto_169425 ?auto_169426 ) ) ( not ( = ?auto_169425 ?auto_169427 ) ) ( not ( = ?auto_169425 ?auto_169428 ) ) ( not ( = ?auto_169425 ?auto_169429 ) ) ( not ( = ?auto_169426 ?auto_169427 ) ) ( not ( = ?auto_169426 ?auto_169428 ) ) ( not ( = ?auto_169426 ?auto_169429 ) ) ( not ( = ?auto_169427 ?auto_169428 ) ) ( not ( = ?auto_169427 ?auto_169429 ) ) ( not ( = ?auto_169428 ?auto_169429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169429 ?auto_169428 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169430 - BLOCK
      ?auto_169431 - BLOCK
      ?auto_169432 - BLOCK
      ?auto_169433 - BLOCK
      ?auto_169434 - BLOCK
      ?auto_169435 - BLOCK
      ?auto_169436 - BLOCK
    )
    :vars
    (
      ?auto_169437 - BLOCK
      ?auto_169438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169437 ?auto_169436 ) ( CLEAR ?auto_169437 ) ( ON-TABLE ?auto_169430 ) ( ON ?auto_169431 ?auto_169430 ) ( ON ?auto_169432 ?auto_169431 ) ( ON ?auto_169433 ?auto_169432 ) ( ON ?auto_169434 ?auto_169433 ) ( ON ?auto_169435 ?auto_169434 ) ( ON ?auto_169436 ?auto_169435 ) ( not ( = ?auto_169430 ?auto_169431 ) ) ( not ( = ?auto_169430 ?auto_169432 ) ) ( not ( = ?auto_169430 ?auto_169433 ) ) ( not ( = ?auto_169430 ?auto_169434 ) ) ( not ( = ?auto_169430 ?auto_169435 ) ) ( not ( = ?auto_169430 ?auto_169436 ) ) ( not ( = ?auto_169430 ?auto_169437 ) ) ( not ( = ?auto_169431 ?auto_169432 ) ) ( not ( = ?auto_169431 ?auto_169433 ) ) ( not ( = ?auto_169431 ?auto_169434 ) ) ( not ( = ?auto_169431 ?auto_169435 ) ) ( not ( = ?auto_169431 ?auto_169436 ) ) ( not ( = ?auto_169431 ?auto_169437 ) ) ( not ( = ?auto_169432 ?auto_169433 ) ) ( not ( = ?auto_169432 ?auto_169434 ) ) ( not ( = ?auto_169432 ?auto_169435 ) ) ( not ( = ?auto_169432 ?auto_169436 ) ) ( not ( = ?auto_169432 ?auto_169437 ) ) ( not ( = ?auto_169433 ?auto_169434 ) ) ( not ( = ?auto_169433 ?auto_169435 ) ) ( not ( = ?auto_169433 ?auto_169436 ) ) ( not ( = ?auto_169433 ?auto_169437 ) ) ( not ( = ?auto_169434 ?auto_169435 ) ) ( not ( = ?auto_169434 ?auto_169436 ) ) ( not ( = ?auto_169434 ?auto_169437 ) ) ( not ( = ?auto_169435 ?auto_169436 ) ) ( not ( = ?auto_169435 ?auto_169437 ) ) ( not ( = ?auto_169436 ?auto_169437 ) ) ( HOLDING ?auto_169438 ) ( not ( = ?auto_169430 ?auto_169438 ) ) ( not ( = ?auto_169431 ?auto_169438 ) ) ( not ( = ?auto_169432 ?auto_169438 ) ) ( not ( = ?auto_169433 ?auto_169438 ) ) ( not ( = ?auto_169434 ?auto_169438 ) ) ( not ( = ?auto_169435 ?auto_169438 ) ) ( not ( = ?auto_169436 ?auto_169438 ) ) ( not ( = ?auto_169437 ?auto_169438 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_169438 )
      ( MAKE-7PILE ?auto_169430 ?auto_169431 ?auto_169432 ?auto_169433 ?auto_169434 ?auto_169435 ?auto_169436 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_169439 - BLOCK
      ?auto_169440 - BLOCK
      ?auto_169441 - BLOCK
      ?auto_169442 - BLOCK
      ?auto_169443 - BLOCK
      ?auto_169444 - BLOCK
      ?auto_169445 - BLOCK
    )
    :vars
    (
      ?auto_169446 - BLOCK
      ?auto_169447 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169446 ?auto_169445 ) ( ON-TABLE ?auto_169439 ) ( ON ?auto_169440 ?auto_169439 ) ( ON ?auto_169441 ?auto_169440 ) ( ON ?auto_169442 ?auto_169441 ) ( ON ?auto_169443 ?auto_169442 ) ( ON ?auto_169444 ?auto_169443 ) ( ON ?auto_169445 ?auto_169444 ) ( not ( = ?auto_169439 ?auto_169440 ) ) ( not ( = ?auto_169439 ?auto_169441 ) ) ( not ( = ?auto_169439 ?auto_169442 ) ) ( not ( = ?auto_169439 ?auto_169443 ) ) ( not ( = ?auto_169439 ?auto_169444 ) ) ( not ( = ?auto_169439 ?auto_169445 ) ) ( not ( = ?auto_169439 ?auto_169446 ) ) ( not ( = ?auto_169440 ?auto_169441 ) ) ( not ( = ?auto_169440 ?auto_169442 ) ) ( not ( = ?auto_169440 ?auto_169443 ) ) ( not ( = ?auto_169440 ?auto_169444 ) ) ( not ( = ?auto_169440 ?auto_169445 ) ) ( not ( = ?auto_169440 ?auto_169446 ) ) ( not ( = ?auto_169441 ?auto_169442 ) ) ( not ( = ?auto_169441 ?auto_169443 ) ) ( not ( = ?auto_169441 ?auto_169444 ) ) ( not ( = ?auto_169441 ?auto_169445 ) ) ( not ( = ?auto_169441 ?auto_169446 ) ) ( not ( = ?auto_169442 ?auto_169443 ) ) ( not ( = ?auto_169442 ?auto_169444 ) ) ( not ( = ?auto_169442 ?auto_169445 ) ) ( not ( = ?auto_169442 ?auto_169446 ) ) ( not ( = ?auto_169443 ?auto_169444 ) ) ( not ( = ?auto_169443 ?auto_169445 ) ) ( not ( = ?auto_169443 ?auto_169446 ) ) ( not ( = ?auto_169444 ?auto_169445 ) ) ( not ( = ?auto_169444 ?auto_169446 ) ) ( not ( = ?auto_169445 ?auto_169446 ) ) ( not ( = ?auto_169439 ?auto_169447 ) ) ( not ( = ?auto_169440 ?auto_169447 ) ) ( not ( = ?auto_169441 ?auto_169447 ) ) ( not ( = ?auto_169442 ?auto_169447 ) ) ( not ( = ?auto_169443 ?auto_169447 ) ) ( not ( = ?auto_169444 ?auto_169447 ) ) ( not ( = ?auto_169445 ?auto_169447 ) ) ( not ( = ?auto_169446 ?auto_169447 ) ) ( ON ?auto_169447 ?auto_169446 ) ( CLEAR ?auto_169447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169439 ?auto_169440 ?auto_169441 ?auto_169442 ?auto_169443 ?auto_169444 ?auto_169445 ?auto_169446 )
      ( MAKE-7PILE ?auto_169439 ?auto_169440 ?auto_169441 ?auto_169442 ?auto_169443 ?auto_169444 ?auto_169445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169450 - BLOCK
      ?auto_169451 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169451 ) ( CLEAR ?auto_169450 ) ( ON-TABLE ?auto_169450 ) ( not ( = ?auto_169450 ?auto_169451 ) ) )
    :subtasks
    ( ( !STACK ?auto_169451 ?auto_169450 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169452 - BLOCK
      ?auto_169453 - BLOCK
    )
    :vars
    (
      ?auto_169454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169452 ) ( ON-TABLE ?auto_169452 ) ( not ( = ?auto_169452 ?auto_169453 ) ) ( ON ?auto_169453 ?auto_169454 ) ( CLEAR ?auto_169453 ) ( HAND-EMPTY ) ( not ( = ?auto_169452 ?auto_169454 ) ) ( not ( = ?auto_169453 ?auto_169454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169453 ?auto_169454 )
      ( MAKE-2PILE ?auto_169452 ?auto_169453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169455 - BLOCK
      ?auto_169456 - BLOCK
    )
    :vars
    (
      ?auto_169457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169455 ?auto_169456 ) ) ( ON ?auto_169456 ?auto_169457 ) ( CLEAR ?auto_169456 ) ( not ( = ?auto_169455 ?auto_169457 ) ) ( not ( = ?auto_169456 ?auto_169457 ) ) ( HOLDING ?auto_169455 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169455 )
      ( MAKE-2PILE ?auto_169455 ?auto_169456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_169458 - BLOCK
      ?auto_169459 - BLOCK
    )
    :vars
    (
      ?auto_169460 - BLOCK
      ?auto_169461 - BLOCK
      ?auto_169462 - BLOCK
      ?auto_169465 - BLOCK
      ?auto_169463 - BLOCK
      ?auto_169466 - BLOCK
      ?auto_169464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169458 ?auto_169459 ) ) ( ON ?auto_169459 ?auto_169460 ) ( not ( = ?auto_169458 ?auto_169460 ) ) ( not ( = ?auto_169459 ?auto_169460 ) ) ( ON ?auto_169458 ?auto_169459 ) ( CLEAR ?auto_169458 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169461 ) ( ON ?auto_169462 ?auto_169461 ) ( ON ?auto_169465 ?auto_169462 ) ( ON ?auto_169463 ?auto_169465 ) ( ON ?auto_169466 ?auto_169463 ) ( ON ?auto_169464 ?auto_169466 ) ( ON ?auto_169460 ?auto_169464 ) ( not ( = ?auto_169461 ?auto_169462 ) ) ( not ( = ?auto_169461 ?auto_169465 ) ) ( not ( = ?auto_169461 ?auto_169463 ) ) ( not ( = ?auto_169461 ?auto_169466 ) ) ( not ( = ?auto_169461 ?auto_169464 ) ) ( not ( = ?auto_169461 ?auto_169460 ) ) ( not ( = ?auto_169461 ?auto_169459 ) ) ( not ( = ?auto_169461 ?auto_169458 ) ) ( not ( = ?auto_169462 ?auto_169465 ) ) ( not ( = ?auto_169462 ?auto_169463 ) ) ( not ( = ?auto_169462 ?auto_169466 ) ) ( not ( = ?auto_169462 ?auto_169464 ) ) ( not ( = ?auto_169462 ?auto_169460 ) ) ( not ( = ?auto_169462 ?auto_169459 ) ) ( not ( = ?auto_169462 ?auto_169458 ) ) ( not ( = ?auto_169465 ?auto_169463 ) ) ( not ( = ?auto_169465 ?auto_169466 ) ) ( not ( = ?auto_169465 ?auto_169464 ) ) ( not ( = ?auto_169465 ?auto_169460 ) ) ( not ( = ?auto_169465 ?auto_169459 ) ) ( not ( = ?auto_169465 ?auto_169458 ) ) ( not ( = ?auto_169463 ?auto_169466 ) ) ( not ( = ?auto_169463 ?auto_169464 ) ) ( not ( = ?auto_169463 ?auto_169460 ) ) ( not ( = ?auto_169463 ?auto_169459 ) ) ( not ( = ?auto_169463 ?auto_169458 ) ) ( not ( = ?auto_169466 ?auto_169464 ) ) ( not ( = ?auto_169466 ?auto_169460 ) ) ( not ( = ?auto_169466 ?auto_169459 ) ) ( not ( = ?auto_169466 ?auto_169458 ) ) ( not ( = ?auto_169464 ?auto_169460 ) ) ( not ( = ?auto_169464 ?auto_169459 ) ) ( not ( = ?auto_169464 ?auto_169458 ) ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169461 ?auto_169462 ?auto_169465 ?auto_169463 ?auto_169466 ?auto_169464 ?auto_169460 ?auto_169459 )
      ( MAKE-2PILE ?auto_169458 ?auto_169459 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169473 - BLOCK
      ?auto_169474 - BLOCK
      ?auto_169475 - BLOCK
      ?auto_169476 - BLOCK
      ?auto_169477 - BLOCK
      ?auto_169478 - BLOCK
    )
    :vars
    (
      ?auto_169479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169479 ?auto_169478 ) ( CLEAR ?auto_169479 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169473 ) ( ON ?auto_169474 ?auto_169473 ) ( ON ?auto_169475 ?auto_169474 ) ( ON ?auto_169476 ?auto_169475 ) ( ON ?auto_169477 ?auto_169476 ) ( ON ?auto_169478 ?auto_169477 ) ( not ( = ?auto_169473 ?auto_169474 ) ) ( not ( = ?auto_169473 ?auto_169475 ) ) ( not ( = ?auto_169473 ?auto_169476 ) ) ( not ( = ?auto_169473 ?auto_169477 ) ) ( not ( = ?auto_169473 ?auto_169478 ) ) ( not ( = ?auto_169473 ?auto_169479 ) ) ( not ( = ?auto_169474 ?auto_169475 ) ) ( not ( = ?auto_169474 ?auto_169476 ) ) ( not ( = ?auto_169474 ?auto_169477 ) ) ( not ( = ?auto_169474 ?auto_169478 ) ) ( not ( = ?auto_169474 ?auto_169479 ) ) ( not ( = ?auto_169475 ?auto_169476 ) ) ( not ( = ?auto_169475 ?auto_169477 ) ) ( not ( = ?auto_169475 ?auto_169478 ) ) ( not ( = ?auto_169475 ?auto_169479 ) ) ( not ( = ?auto_169476 ?auto_169477 ) ) ( not ( = ?auto_169476 ?auto_169478 ) ) ( not ( = ?auto_169476 ?auto_169479 ) ) ( not ( = ?auto_169477 ?auto_169478 ) ) ( not ( = ?auto_169477 ?auto_169479 ) ) ( not ( = ?auto_169478 ?auto_169479 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169479 ?auto_169478 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169480 - BLOCK
      ?auto_169481 - BLOCK
      ?auto_169482 - BLOCK
      ?auto_169483 - BLOCK
      ?auto_169484 - BLOCK
      ?auto_169485 - BLOCK
    )
    :vars
    (
      ?auto_169486 - BLOCK
      ?auto_169487 - BLOCK
      ?auto_169488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169486 ?auto_169485 ) ( CLEAR ?auto_169486 ) ( ON-TABLE ?auto_169480 ) ( ON ?auto_169481 ?auto_169480 ) ( ON ?auto_169482 ?auto_169481 ) ( ON ?auto_169483 ?auto_169482 ) ( ON ?auto_169484 ?auto_169483 ) ( ON ?auto_169485 ?auto_169484 ) ( not ( = ?auto_169480 ?auto_169481 ) ) ( not ( = ?auto_169480 ?auto_169482 ) ) ( not ( = ?auto_169480 ?auto_169483 ) ) ( not ( = ?auto_169480 ?auto_169484 ) ) ( not ( = ?auto_169480 ?auto_169485 ) ) ( not ( = ?auto_169480 ?auto_169486 ) ) ( not ( = ?auto_169481 ?auto_169482 ) ) ( not ( = ?auto_169481 ?auto_169483 ) ) ( not ( = ?auto_169481 ?auto_169484 ) ) ( not ( = ?auto_169481 ?auto_169485 ) ) ( not ( = ?auto_169481 ?auto_169486 ) ) ( not ( = ?auto_169482 ?auto_169483 ) ) ( not ( = ?auto_169482 ?auto_169484 ) ) ( not ( = ?auto_169482 ?auto_169485 ) ) ( not ( = ?auto_169482 ?auto_169486 ) ) ( not ( = ?auto_169483 ?auto_169484 ) ) ( not ( = ?auto_169483 ?auto_169485 ) ) ( not ( = ?auto_169483 ?auto_169486 ) ) ( not ( = ?auto_169484 ?auto_169485 ) ) ( not ( = ?auto_169484 ?auto_169486 ) ) ( not ( = ?auto_169485 ?auto_169486 ) ) ( HOLDING ?auto_169487 ) ( CLEAR ?auto_169488 ) ( not ( = ?auto_169480 ?auto_169487 ) ) ( not ( = ?auto_169480 ?auto_169488 ) ) ( not ( = ?auto_169481 ?auto_169487 ) ) ( not ( = ?auto_169481 ?auto_169488 ) ) ( not ( = ?auto_169482 ?auto_169487 ) ) ( not ( = ?auto_169482 ?auto_169488 ) ) ( not ( = ?auto_169483 ?auto_169487 ) ) ( not ( = ?auto_169483 ?auto_169488 ) ) ( not ( = ?auto_169484 ?auto_169487 ) ) ( not ( = ?auto_169484 ?auto_169488 ) ) ( not ( = ?auto_169485 ?auto_169487 ) ) ( not ( = ?auto_169485 ?auto_169488 ) ) ( not ( = ?auto_169486 ?auto_169487 ) ) ( not ( = ?auto_169486 ?auto_169488 ) ) ( not ( = ?auto_169487 ?auto_169488 ) ) )
    :subtasks
    ( ( !STACK ?auto_169487 ?auto_169488 )
      ( MAKE-6PILE ?auto_169480 ?auto_169481 ?auto_169482 ?auto_169483 ?auto_169484 ?auto_169485 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170820 - BLOCK
      ?auto_170821 - BLOCK
      ?auto_170822 - BLOCK
      ?auto_170823 - BLOCK
      ?auto_170824 - BLOCK
      ?auto_170825 - BLOCK
    )
    :vars
    (
      ?auto_170827 - BLOCK
      ?auto_170826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170827 ?auto_170825 ) ( ON-TABLE ?auto_170820 ) ( ON ?auto_170821 ?auto_170820 ) ( ON ?auto_170822 ?auto_170821 ) ( ON ?auto_170823 ?auto_170822 ) ( ON ?auto_170824 ?auto_170823 ) ( ON ?auto_170825 ?auto_170824 ) ( not ( = ?auto_170820 ?auto_170821 ) ) ( not ( = ?auto_170820 ?auto_170822 ) ) ( not ( = ?auto_170820 ?auto_170823 ) ) ( not ( = ?auto_170820 ?auto_170824 ) ) ( not ( = ?auto_170820 ?auto_170825 ) ) ( not ( = ?auto_170820 ?auto_170827 ) ) ( not ( = ?auto_170821 ?auto_170822 ) ) ( not ( = ?auto_170821 ?auto_170823 ) ) ( not ( = ?auto_170821 ?auto_170824 ) ) ( not ( = ?auto_170821 ?auto_170825 ) ) ( not ( = ?auto_170821 ?auto_170827 ) ) ( not ( = ?auto_170822 ?auto_170823 ) ) ( not ( = ?auto_170822 ?auto_170824 ) ) ( not ( = ?auto_170822 ?auto_170825 ) ) ( not ( = ?auto_170822 ?auto_170827 ) ) ( not ( = ?auto_170823 ?auto_170824 ) ) ( not ( = ?auto_170823 ?auto_170825 ) ) ( not ( = ?auto_170823 ?auto_170827 ) ) ( not ( = ?auto_170824 ?auto_170825 ) ) ( not ( = ?auto_170824 ?auto_170827 ) ) ( not ( = ?auto_170825 ?auto_170827 ) ) ( not ( = ?auto_170820 ?auto_170826 ) ) ( not ( = ?auto_170821 ?auto_170826 ) ) ( not ( = ?auto_170822 ?auto_170826 ) ) ( not ( = ?auto_170823 ?auto_170826 ) ) ( not ( = ?auto_170824 ?auto_170826 ) ) ( not ( = ?auto_170825 ?auto_170826 ) ) ( not ( = ?auto_170827 ?auto_170826 ) ) ( ON ?auto_170826 ?auto_170827 ) ( CLEAR ?auto_170826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170820 ?auto_170821 ?auto_170822 ?auto_170823 ?auto_170824 ?auto_170825 ?auto_170827 )
      ( MAKE-6PILE ?auto_170820 ?auto_170821 ?auto_170822 ?auto_170823 ?auto_170824 ?auto_170825 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169498 - BLOCK
      ?auto_169499 - BLOCK
      ?auto_169500 - BLOCK
      ?auto_169501 - BLOCK
      ?auto_169502 - BLOCK
      ?auto_169503 - BLOCK
    )
    :vars
    (
      ?auto_169504 - BLOCK
      ?auto_169505 - BLOCK
      ?auto_169506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169504 ?auto_169503 ) ( ON-TABLE ?auto_169498 ) ( ON ?auto_169499 ?auto_169498 ) ( ON ?auto_169500 ?auto_169499 ) ( ON ?auto_169501 ?auto_169500 ) ( ON ?auto_169502 ?auto_169501 ) ( ON ?auto_169503 ?auto_169502 ) ( not ( = ?auto_169498 ?auto_169499 ) ) ( not ( = ?auto_169498 ?auto_169500 ) ) ( not ( = ?auto_169498 ?auto_169501 ) ) ( not ( = ?auto_169498 ?auto_169502 ) ) ( not ( = ?auto_169498 ?auto_169503 ) ) ( not ( = ?auto_169498 ?auto_169504 ) ) ( not ( = ?auto_169499 ?auto_169500 ) ) ( not ( = ?auto_169499 ?auto_169501 ) ) ( not ( = ?auto_169499 ?auto_169502 ) ) ( not ( = ?auto_169499 ?auto_169503 ) ) ( not ( = ?auto_169499 ?auto_169504 ) ) ( not ( = ?auto_169500 ?auto_169501 ) ) ( not ( = ?auto_169500 ?auto_169502 ) ) ( not ( = ?auto_169500 ?auto_169503 ) ) ( not ( = ?auto_169500 ?auto_169504 ) ) ( not ( = ?auto_169501 ?auto_169502 ) ) ( not ( = ?auto_169501 ?auto_169503 ) ) ( not ( = ?auto_169501 ?auto_169504 ) ) ( not ( = ?auto_169502 ?auto_169503 ) ) ( not ( = ?auto_169502 ?auto_169504 ) ) ( not ( = ?auto_169503 ?auto_169504 ) ) ( not ( = ?auto_169498 ?auto_169505 ) ) ( not ( = ?auto_169498 ?auto_169506 ) ) ( not ( = ?auto_169499 ?auto_169505 ) ) ( not ( = ?auto_169499 ?auto_169506 ) ) ( not ( = ?auto_169500 ?auto_169505 ) ) ( not ( = ?auto_169500 ?auto_169506 ) ) ( not ( = ?auto_169501 ?auto_169505 ) ) ( not ( = ?auto_169501 ?auto_169506 ) ) ( not ( = ?auto_169502 ?auto_169505 ) ) ( not ( = ?auto_169502 ?auto_169506 ) ) ( not ( = ?auto_169503 ?auto_169505 ) ) ( not ( = ?auto_169503 ?auto_169506 ) ) ( not ( = ?auto_169504 ?auto_169505 ) ) ( not ( = ?auto_169504 ?auto_169506 ) ) ( not ( = ?auto_169505 ?auto_169506 ) ) ( ON ?auto_169505 ?auto_169504 ) ( CLEAR ?auto_169505 ) ( HOLDING ?auto_169506 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169506 )
      ( MAKE-6PILE ?auto_169498 ?auto_169499 ?auto_169500 ?auto_169501 ?auto_169502 ?auto_169503 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169507 - BLOCK
      ?auto_169508 - BLOCK
      ?auto_169509 - BLOCK
      ?auto_169510 - BLOCK
      ?auto_169511 - BLOCK
      ?auto_169512 - BLOCK
    )
    :vars
    (
      ?auto_169514 - BLOCK
      ?auto_169513 - BLOCK
      ?auto_169515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169514 ?auto_169512 ) ( ON-TABLE ?auto_169507 ) ( ON ?auto_169508 ?auto_169507 ) ( ON ?auto_169509 ?auto_169508 ) ( ON ?auto_169510 ?auto_169509 ) ( ON ?auto_169511 ?auto_169510 ) ( ON ?auto_169512 ?auto_169511 ) ( not ( = ?auto_169507 ?auto_169508 ) ) ( not ( = ?auto_169507 ?auto_169509 ) ) ( not ( = ?auto_169507 ?auto_169510 ) ) ( not ( = ?auto_169507 ?auto_169511 ) ) ( not ( = ?auto_169507 ?auto_169512 ) ) ( not ( = ?auto_169507 ?auto_169514 ) ) ( not ( = ?auto_169508 ?auto_169509 ) ) ( not ( = ?auto_169508 ?auto_169510 ) ) ( not ( = ?auto_169508 ?auto_169511 ) ) ( not ( = ?auto_169508 ?auto_169512 ) ) ( not ( = ?auto_169508 ?auto_169514 ) ) ( not ( = ?auto_169509 ?auto_169510 ) ) ( not ( = ?auto_169509 ?auto_169511 ) ) ( not ( = ?auto_169509 ?auto_169512 ) ) ( not ( = ?auto_169509 ?auto_169514 ) ) ( not ( = ?auto_169510 ?auto_169511 ) ) ( not ( = ?auto_169510 ?auto_169512 ) ) ( not ( = ?auto_169510 ?auto_169514 ) ) ( not ( = ?auto_169511 ?auto_169512 ) ) ( not ( = ?auto_169511 ?auto_169514 ) ) ( not ( = ?auto_169512 ?auto_169514 ) ) ( not ( = ?auto_169507 ?auto_169513 ) ) ( not ( = ?auto_169507 ?auto_169515 ) ) ( not ( = ?auto_169508 ?auto_169513 ) ) ( not ( = ?auto_169508 ?auto_169515 ) ) ( not ( = ?auto_169509 ?auto_169513 ) ) ( not ( = ?auto_169509 ?auto_169515 ) ) ( not ( = ?auto_169510 ?auto_169513 ) ) ( not ( = ?auto_169510 ?auto_169515 ) ) ( not ( = ?auto_169511 ?auto_169513 ) ) ( not ( = ?auto_169511 ?auto_169515 ) ) ( not ( = ?auto_169512 ?auto_169513 ) ) ( not ( = ?auto_169512 ?auto_169515 ) ) ( not ( = ?auto_169514 ?auto_169513 ) ) ( not ( = ?auto_169514 ?auto_169515 ) ) ( not ( = ?auto_169513 ?auto_169515 ) ) ( ON ?auto_169513 ?auto_169514 ) ( ON ?auto_169515 ?auto_169513 ) ( CLEAR ?auto_169515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169507 ?auto_169508 ?auto_169509 ?auto_169510 ?auto_169511 ?auto_169512 ?auto_169514 ?auto_169513 )
      ( MAKE-6PILE ?auto_169507 ?auto_169508 ?auto_169509 ?auto_169510 ?auto_169511 ?auto_169512 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169519 - BLOCK
      ?auto_169520 - BLOCK
      ?auto_169521 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169521 ) ( CLEAR ?auto_169520 ) ( ON-TABLE ?auto_169519 ) ( ON ?auto_169520 ?auto_169519 ) ( not ( = ?auto_169519 ?auto_169520 ) ) ( not ( = ?auto_169519 ?auto_169521 ) ) ( not ( = ?auto_169520 ?auto_169521 ) ) )
    :subtasks
    ( ( !STACK ?auto_169521 ?auto_169520 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169522 - BLOCK
      ?auto_169523 - BLOCK
      ?auto_169524 - BLOCK
    )
    :vars
    (
      ?auto_169525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169523 ) ( ON-TABLE ?auto_169522 ) ( ON ?auto_169523 ?auto_169522 ) ( not ( = ?auto_169522 ?auto_169523 ) ) ( not ( = ?auto_169522 ?auto_169524 ) ) ( not ( = ?auto_169523 ?auto_169524 ) ) ( ON ?auto_169524 ?auto_169525 ) ( CLEAR ?auto_169524 ) ( HAND-EMPTY ) ( not ( = ?auto_169522 ?auto_169525 ) ) ( not ( = ?auto_169523 ?auto_169525 ) ) ( not ( = ?auto_169524 ?auto_169525 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169524 ?auto_169525 )
      ( MAKE-3PILE ?auto_169522 ?auto_169523 ?auto_169524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169526 - BLOCK
      ?auto_169527 - BLOCK
      ?auto_169528 - BLOCK
    )
    :vars
    (
      ?auto_169529 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169526 ) ( not ( = ?auto_169526 ?auto_169527 ) ) ( not ( = ?auto_169526 ?auto_169528 ) ) ( not ( = ?auto_169527 ?auto_169528 ) ) ( ON ?auto_169528 ?auto_169529 ) ( CLEAR ?auto_169528 ) ( not ( = ?auto_169526 ?auto_169529 ) ) ( not ( = ?auto_169527 ?auto_169529 ) ) ( not ( = ?auto_169528 ?auto_169529 ) ) ( HOLDING ?auto_169527 ) ( CLEAR ?auto_169526 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169526 ?auto_169527 )
      ( MAKE-3PILE ?auto_169526 ?auto_169527 ?auto_169528 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169530 - BLOCK
      ?auto_169531 - BLOCK
      ?auto_169532 - BLOCK
    )
    :vars
    (
      ?auto_169533 - BLOCK
      ?auto_169536 - BLOCK
      ?auto_169535 - BLOCK
      ?auto_169538 - BLOCK
      ?auto_169537 - BLOCK
      ?auto_169534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169530 ) ( not ( = ?auto_169530 ?auto_169531 ) ) ( not ( = ?auto_169530 ?auto_169532 ) ) ( not ( = ?auto_169531 ?auto_169532 ) ) ( ON ?auto_169532 ?auto_169533 ) ( not ( = ?auto_169530 ?auto_169533 ) ) ( not ( = ?auto_169531 ?auto_169533 ) ) ( not ( = ?auto_169532 ?auto_169533 ) ) ( CLEAR ?auto_169530 ) ( ON ?auto_169531 ?auto_169532 ) ( CLEAR ?auto_169531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169536 ) ( ON ?auto_169535 ?auto_169536 ) ( ON ?auto_169538 ?auto_169535 ) ( ON ?auto_169537 ?auto_169538 ) ( ON ?auto_169534 ?auto_169537 ) ( ON ?auto_169533 ?auto_169534 ) ( not ( = ?auto_169536 ?auto_169535 ) ) ( not ( = ?auto_169536 ?auto_169538 ) ) ( not ( = ?auto_169536 ?auto_169537 ) ) ( not ( = ?auto_169536 ?auto_169534 ) ) ( not ( = ?auto_169536 ?auto_169533 ) ) ( not ( = ?auto_169536 ?auto_169532 ) ) ( not ( = ?auto_169536 ?auto_169531 ) ) ( not ( = ?auto_169535 ?auto_169538 ) ) ( not ( = ?auto_169535 ?auto_169537 ) ) ( not ( = ?auto_169535 ?auto_169534 ) ) ( not ( = ?auto_169535 ?auto_169533 ) ) ( not ( = ?auto_169535 ?auto_169532 ) ) ( not ( = ?auto_169535 ?auto_169531 ) ) ( not ( = ?auto_169538 ?auto_169537 ) ) ( not ( = ?auto_169538 ?auto_169534 ) ) ( not ( = ?auto_169538 ?auto_169533 ) ) ( not ( = ?auto_169538 ?auto_169532 ) ) ( not ( = ?auto_169538 ?auto_169531 ) ) ( not ( = ?auto_169537 ?auto_169534 ) ) ( not ( = ?auto_169537 ?auto_169533 ) ) ( not ( = ?auto_169537 ?auto_169532 ) ) ( not ( = ?auto_169537 ?auto_169531 ) ) ( not ( = ?auto_169534 ?auto_169533 ) ) ( not ( = ?auto_169534 ?auto_169532 ) ) ( not ( = ?auto_169534 ?auto_169531 ) ) ( not ( = ?auto_169530 ?auto_169536 ) ) ( not ( = ?auto_169530 ?auto_169535 ) ) ( not ( = ?auto_169530 ?auto_169538 ) ) ( not ( = ?auto_169530 ?auto_169537 ) ) ( not ( = ?auto_169530 ?auto_169534 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169536 ?auto_169535 ?auto_169538 ?auto_169537 ?auto_169534 ?auto_169533 ?auto_169532 )
      ( MAKE-3PILE ?auto_169530 ?auto_169531 ?auto_169532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169539 - BLOCK
      ?auto_169540 - BLOCK
      ?auto_169541 - BLOCK
    )
    :vars
    (
      ?auto_169543 - BLOCK
      ?auto_169547 - BLOCK
      ?auto_169546 - BLOCK
      ?auto_169544 - BLOCK
      ?auto_169545 - BLOCK
      ?auto_169542 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169539 ?auto_169540 ) ) ( not ( = ?auto_169539 ?auto_169541 ) ) ( not ( = ?auto_169540 ?auto_169541 ) ) ( ON ?auto_169541 ?auto_169543 ) ( not ( = ?auto_169539 ?auto_169543 ) ) ( not ( = ?auto_169540 ?auto_169543 ) ) ( not ( = ?auto_169541 ?auto_169543 ) ) ( ON ?auto_169540 ?auto_169541 ) ( CLEAR ?auto_169540 ) ( ON-TABLE ?auto_169547 ) ( ON ?auto_169546 ?auto_169547 ) ( ON ?auto_169544 ?auto_169546 ) ( ON ?auto_169545 ?auto_169544 ) ( ON ?auto_169542 ?auto_169545 ) ( ON ?auto_169543 ?auto_169542 ) ( not ( = ?auto_169547 ?auto_169546 ) ) ( not ( = ?auto_169547 ?auto_169544 ) ) ( not ( = ?auto_169547 ?auto_169545 ) ) ( not ( = ?auto_169547 ?auto_169542 ) ) ( not ( = ?auto_169547 ?auto_169543 ) ) ( not ( = ?auto_169547 ?auto_169541 ) ) ( not ( = ?auto_169547 ?auto_169540 ) ) ( not ( = ?auto_169546 ?auto_169544 ) ) ( not ( = ?auto_169546 ?auto_169545 ) ) ( not ( = ?auto_169546 ?auto_169542 ) ) ( not ( = ?auto_169546 ?auto_169543 ) ) ( not ( = ?auto_169546 ?auto_169541 ) ) ( not ( = ?auto_169546 ?auto_169540 ) ) ( not ( = ?auto_169544 ?auto_169545 ) ) ( not ( = ?auto_169544 ?auto_169542 ) ) ( not ( = ?auto_169544 ?auto_169543 ) ) ( not ( = ?auto_169544 ?auto_169541 ) ) ( not ( = ?auto_169544 ?auto_169540 ) ) ( not ( = ?auto_169545 ?auto_169542 ) ) ( not ( = ?auto_169545 ?auto_169543 ) ) ( not ( = ?auto_169545 ?auto_169541 ) ) ( not ( = ?auto_169545 ?auto_169540 ) ) ( not ( = ?auto_169542 ?auto_169543 ) ) ( not ( = ?auto_169542 ?auto_169541 ) ) ( not ( = ?auto_169542 ?auto_169540 ) ) ( not ( = ?auto_169539 ?auto_169547 ) ) ( not ( = ?auto_169539 ?auto_169546 ) ) ( not ( = ?auto_169539 ?auto_169544 ) ) ( not ( = ?auto_169539 ?auto_169545 ) ) ( not ( = ?auto_169539 ?auto_169542 ) ) ( HOLDING ?auto_169539 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169539 )
      ( MAKE-3PILE ?auto_169539 ?auto_169540 ?auto_169541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169548 - BLOCK
      ?auto_169549 - BLOCK
      ?auto_169550 - BLOCK
    )
    :vars
    (
      ?auto_169555 - BLOCK
      ?auto_169554 - BLOCK
      ?auto_169553 - BLOCK
      ?auto_169551 - BLOCK
      ?auto_169552 - BLOCK
      ?auto_169556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169548 ?auto_169549 ) ) ( not ( = ?auto_169548 ?auto_169550 ) ) ( not ( = ?auto_169549 ?auto_169550 ) ) ( ON ?auto_169550 ?auto_169555 ) ( not ( = ?auto_169548 ?auto_169555 ) ) ( not ( = ?auto_169549 ?auto_169555 ) ) ( not ( = ?auto_169550 ?auto_169555 ) ) ( ON ?auto_169549 ?auto_169550 ) ( ON-TABLE ?auto_169554 ) ( ON ?auto_169553 ?auto_169554 ) ( ON ?auto_169551 ?auto_169553 ) ( ON ?auto_169552 ?auto_169551 ) ( ON ?auto_169556 ?auto_169552 ) ( ON ?auto_169555 ?auto_169556 ) ( not ( = ?auto_169554 ?auto_169553 ) ) ( not ( = ?auto_169554 ?auto_169551 ) ) ( not ( = ?auto_169554 ?auto_169552 ) ) ( not ( = ?auto_169554 ?auto_169556 ) ) ( not ( = ?auto_169554 ?auto_169555 ) ) ( not ( = ?auto_169554 ?auto_169550 ) ) ( not ( = ?auto_169554 ?auto_169549 ) ) ( not ( = ?auto_169553 ?auto_169551 ) ) ( not ( = ?auto_169553 ?auto_169552 ) ) ( not ( = ?auto_169553 ?auto_169556 ) ) ( not ( = ?auto_169553 ?auto_169555 ) ) ( not ( = ?auto_169553 ?auto_169550 ) ) ( not ( = ?auto_169553 ?auto_169549 ) ) ( not ( = ?auto_169551 ?auto_169552 ) ) ( not ( = ?auto_169551 ?auto_169556 ) ) ( not ( = ?auto_169551 ?auto_169555 ) ) ( not ( = ?auto_169551 ?auto_169550 ) ) ( not ( = ?auto_169551 ?auto_169549 ) ) ( not ( = ?auto_169552 ?auto_169556 ) ) ( not ( = ?auto_169552 ?auto_169555 ) ) ( not ( = ?auto_169552 ?auto_169550 ) ) ( not ( = ?auto_169552 ?auto_169549 ) ) ( not ( = ?auto_169556 ?auto_169555 ) ) ( not ( = ?auto_169556 ?auto_169550 ) ) ( not ( = ?auto_169556 ?auto_169549 ) ) ( not ( = ?auto_169548 ?auto_169554 ) ) ( not ( = ?auto_169548 ?auto_169553 ) ) ( not ( = ?auto_169548 ?auto_169551 ) ) ( not ( = ?auto_169548 ?auto_169552 ) ) ( not ( = ?auto_169548 ?auto_169556 ) ) ( ON ?auto_169548 ?auto_169549 ) ( CLEAR ?auto_169548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169554 ?auto_169553 ?auto_169551 ?auto_169552 ?auto_169556 ?auto_169555 ?auto_169550 ?auto_169549 )
      ( MAKE-3PILE ?auto_169548 ?auto_169549 ?auto_169550 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169562 - BLOCK
      ?auto_169563 - BLOCK
      ?auto_169564 - BLOCK
      ?auto_169565 - BLOCK
      ?auto_169566 - BLOCK
    )
    :vars
    (
      ?auto_169567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169567 ?auto_169566 ) ( CLEAR ?auto_169567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169562 ) ( ON ?auto_169563 ?auto_169562 ) ( ON ?auto_169564 ?auto_169563 ) ( ON ?auto_169565 ?auto_169564 ) ( ON ?auto_169566 ?auto_169565 ) ( not ( = ?auto_169562 ?auto_169563 ) ) ( not ( = ?auto_169562 ?auto_169564 ) ) ( not ( = ?auto_169562 ?auto_169565 ) ) ( not ( = ?auto_169562 ?auto_169566 ) ) ( not ( = ?auto_169562 ?auto_169567 ) ) ( not ( = ?auto_169563 ?auto_169564 ) ) ( not ( = ?auto_169563 ?auto_169565 ) ) ( not ( = ?auto_169563 ?auto_169566 ) ) ( not ( = ?auto_169563 ?auto_169567 ) ) ( not ( = ?auto_169564 ?auto_169565 ) ) ( not ( = ?auto_169564 ?auto_169566 ) ) ( not ( = ?auto_169564 ?auto_169567 ) ) ( not ( = ?auto_169565 ?auto_169566 ) ) ( not ( = ?auto_169565 ?auto_169567 ) ) ( not ( = ?auto_169566 ?auto_169567 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169567 ?auto_169566 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169568 - BLOCK
      ?auto_169569 - BLOCK
      ?auto_169570 - BLOCK
      ?auto_169571 - BLOCK
      ?auto_169572 - BLOCK
    )
    :vars
    (
      ?auto_169573 - BLOCK
      ?auto_169574 - BLOCK
      ?auto_169575 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169573 ?auto_169572 ) ( CLEAR ?auto_169573 ) ( ON-TABLE ?auto_169568 ) ( ON ?auto_169569 ?auto_169568 ) ( ON ?auto_169570 ?auto_169569 ) ( ON ?auto_169571 ?auto_169570 ) ( ON ?auto_169572 ?auto_169571 ) ( not ( = ?auto_169568 ?auto_169569 ) ) ( not ( = ?auto_169568 ?auto_169570 ) ) ( not ( = ?auto_169568 ?auto_169571 ) ) ( not ( = ?auto_169568 ?auto_169572 ) ) ( not ( = ?auto_169568 ?auto_169573 ) ) ( not ( = ?auto_169569 ?auto_169570 ) ) ( not ( = ?auto_169569 ?auto_169571 ) ) ( not ( = ?auto_169569 ?auto_169572 ) ) ( not ( = ?auto_169569 ?auto_169573 ) ) ( not ( = ?auto_169570 ?auto_169571 ) ) ( not ( = ?auto_169570 ?auto_169572 ) ) ( not ( = ?auto_169570 ?auto_169573 ) ) ( not ( = ?auto_169571 ?auto_169572 ) ) ( not ( = ?auto_169571 ?auto_169573 ) ) ( not ( = ?auto_169572 ?auto_169573 ) ) ( HOLDING ?auto_169574 ) ( CLEAR ?auto_169575 ) ( not ( = ?auto_169568 ?auto_169574 ) ) ( not ( = ?auto_169568 ?auto_169575 ) ) ( not ( = ?auto_169569 ?auto_169574 ) ) ( not ( = ?auto_169569 ?auto_169575 ) ) ( not ( = ?auto_169570 ?auto_169574 ) ) ( not ( = ?auto_169570 ?auto_169575 ) ) ( not ( = ?auto_169571 ?auto_169574 ) ) ( not ( = ?auto_169571 ?auto_169575 ) ) ( not ( = ?auto_169572 ?auto_169574 ) ) ( not ( = ?auto_169572 ?auto_169575 ) ) ( not ( = ?auto_169573 ?auto_169574 ) ) ( not ( = ?auto_169573 ?auto_169575 ) ) ( not ( = ?auto_169574 ?auto_169575 ) ) )
    :subtasks
    ( ( !STACK ?auto_169574 ?auto_169575 )
      ( MAKE-5PILE ?auto_169568 ?auto_169569 ?auto_169570 ?auto_169571 ?auto_169572 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169576 - BLOCK
      ?auto_169577 - BLOCK
      ?auto_169578 - BLOCK
      ?auto_169579 - BLOCK
      ?auto_169580 - BLOCK
    )
    :vars
    (
      ?auto_169583 - BLOCK
      ?auto_169581 - BLOCK
      ?auto_169582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169583 ?auto_169580 ) ( ON-TABLE ?auto_169576 ) ( ON ?auto_169577 ?auto_169576 ) ( ON ?auto_169578 ?auto_169577 ) ( ON ?auto_169579 ?auto_169578 ) ( ON ?auto_169580 ?auto_169579 ) ( not ( = ?auto_169576 ?auto_169577 ) ) ( not ( = ?auto_169576 ?auto_169578 ) ) ( not ( = ?auto_169576 ?auto_169579 ) ) ( not ( = ?auto_169576 ?auto_169580 ) ) ( not ( = ?auto_169576 ?auto_169583 ) ) ( not ( = ?auto_169577 ?auto_169578 ) ) ( not ( = ?auto_169577 ?auto_169579 ) ) ( not ( = ?auto_169577 ?auto_169580 ) ) ( not ( = ?auto_169577 ?auto_169583 ) ) ( not ( = ?auto_169578 ?auto_169579 ) ) ( not ( = ?auto_169578 ?auto_169580 ) ) ( not ( = ?auto_169578 ?auto_169583 ) ) ( not ( = ?auto_169579 ?auto_169580 ) ) ( not ( = ?auto_169579 ?auto_169583 ) ) ( not ( = ?auto_169580 ?auto_169583 ) ) ( CLEAR ?auto_169581 ) ( not ( = ?auto_169576 ?auto_169582 ) ) ( not ( = ?auto_169576 ?auto_169581 ) ) ( not ( = ?auto_169577 ?auto_169582 ) ) ( not ( = ?auto_169577 ?auto_169581 ) ) ( not ( = ?auto_169578 ?auto_169582 ) ) ( not ( = ?auto_169578 ?auto_169581 ) ) ( not ( = ?auto_169579 ?auto_169582 ) ) ( not ( = ?auto_169579 ?auto_169581 ) ) ( not ( = ?auto_169580 ?auto_169582 ) ) ( not ( = ?auto_169580 ?auto_169581 ) ) ( not ( = ?auto_169583 ?auto_169582 ) ) ( not ( = ?auto_169583 ?auto_169581 ) ) ( not ( = ?auto_169582 ?auto_169581 ) ) ( ON ?auto_169582 ?auto_169583 ) ( CLEAR ?auto_169582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169576 ?auto_169577 ?auto_169578 ?auto_169579 ?auto_169580 ?auto_169583 )
      ( MAKE-5PILE ?auto_169576 ?auto_169577 ?auto_169578 ?auto_169579 ?auto_169580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169584 - BLOCK
      ?auto_169585 - BLOCK
      ?auto_169586 - BLOCK
      ?auto_169587 - BLOCK
      ?auto_169588 - BLOCK
    )
    :vars
    (
      ?auto_169590 - BLOCK
      ?auto_169591 - BLOCK
      ?auto_169589 - BLOCK
      ?auto_169592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169590 ?auto_169588 ) ( ON-TABLE ?auto_169584 ) ( ON ?auto_169585 ?auto_169584 ) ( ON ?auto_169586 ?auto_169585 ) ( ON ?auto_169587 ?auto_169586 ) ( ON ?auto_169588 ?auto_169587 ) ( not ( = ?auto_169584 ?auto_169585 ) ) ( not ( = ?auto_169584 ?auto_169586 ) ) ( not ( = ?auto_169584 ?auto_169587 ) ) ( not ( = ?auto_169584 ?auto_169588 ) ) ( not ( = ?auto_169584 ?auto_169590 ) ) ( not ( = ?auto_169585 ?auto_169586 ) ) ( not ( = ?auto_169585 ?auto_169587 ) ) ( not ( = ?auto_169585 ?auto_169588 ) ) ( not ( = ?auto_169585 ?auto_169590 ) ) ( not ( = ?auto_169586 ?auto_169587 ) ) ( not ( = ?auto_169586 ?auto_169588 ) ) ( not ( = ?auto_169586 ?auto_169590 ) ) ( not ( = ?auto_169587 ?auto_169588 ) ) ( not ( = ?auto_169587 ?auto_169590 ) ) ( not ( = ?auto_169588 ?auto_169590 ) ) ( not ( = ?auto_169584 ?auto_169591 ) ) ( not ( = ?auto_169584 ?auto_169589 ) ) ( not ( = ?auto_169585 ?auto_169591 ) ) ( not ( = ?auto_169585 ?auto_169589 ) ) ( not ( = ?auto_169586 ?auto_169591 ) ) ( not ( = ?auto_169586 ?auto_169589 ) ) ( not ( = ?auto_169587 ?auto_169591 ) ) ( not ( = ?auto_169587 ?auto_169589 ) ) ( not ( = ?auto_169588 ?auto_169591 ) ) ( not ( = ?auto_169588 ?auto_169589 ) ) ( not ( = ?auto_169590 ?auto_169591 ) ) ( not ( = ?auto_169590 ?auto_169589 ) ) ( not ( = ?auto_169591 ?auto_169589 ) ) ( ON ?auto_169591 ?auto_169590 ) ( CLEAR ?auto_169591 ) ( HOLDING ?auto_169589 ) ( CLEAR ?auto_169592 ) ( ON-TABLE ?auto_169592 ) ( not ( = ?auto_169592 ?auto_169589 ) ) ( not ( = ?auto_169584 ?auto_169592 ) ) ( not ( = ?auto_169585 ?auto_169592 ) ) ( not ( = ?auto_169586 ?auto_169592 ) ) ( not ( = ?auto_169587 ?auto_169592 ) ) ( not ( = ?auto_169588 ?auto_169592 ) ) ( not ( = ?auto_169590 ?auto_169592 ) ) ( not ( = ?auto_169591 ?auto_169592 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169592 ?auto_169589 )
      ( MAKE-5PILE ?auto_169584 ?auto_169585 ?auto_169586 ?auto_169587 ?auto_169588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171112 - BLOCK
      ?auto_171113 - BLOCK
      ?auto_171114 - BLOCK
      ?auto_171115 - BLOCK
      ?auto_171116 - BLOCK
    )
    :vars
    (
      ?auto_171119 - BLOCK
      ?auto_171117 - BLOCK
      ?auto_171118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171119 ?auto_171116 ) ( ON-TABLE ?auto_171112 ) ( ON ?auto_171113 ?auto_171112 ) ( ON ?auto_171114 ?auto_171113 ) ( ON ?auto_171115 ?auto_171114 ) ( ON ?auto_171116 ?auto_171115 ) ( not ( = ?auto_171112 ?auto_171113 ) ) ( not ( = ?auto_171112 ?auto_171114 ) ) ( not ( = ?auto_171112 ?auto_171115 ) ) ( not ( = ?auto_171112 ?auto_171116 ) ) ( not ( = ?auto_171112 ?auto_171119 ) ) ( not ( = ?auto_171113 ?auto_171114 ) ) ( not ( = ?auto_171113 ?auto_171115 ) ) ( not ( = ?auto_171113 ?auto_171116 ) ) ( not ( = ?auto_171113 ?auto_171119 ) ) ( not ( = ?auto_171114 ?auto_171115 ) ) ( not ( = ?auto_171114 ?auto_171116 ) ) ( not ( = ?auto_171114 ?auto_171119 ) ) ( not ( = ?auto_171115 ?auto_171116 ) ) ( not ( = ?auto_171115 ?auto_171119 ) ) ( not ( = ?auto_171116 ?auto_171119 ) ) ( not ( = ?auto_171112 ?auto_171117 ) ) ( not ( = ?auto_171112 ?auto_171118 ) ) ( not ( = ?auto_171113 ?auto_171117 ) ) ( not ( = ?auto_171113 ?auto_171118 ) ) ( not ( = ?auto_171114 ?auto_171117 ) ) ( not ( = ?auto_171114 ?auto_171118 ) ) ( not ( = ?auto_171115 ?auto_171117 ) ) ( not ( = ?auto_171115 ?auto_171118 ) ) ( not ( = ?auto_171116 ?auto_171117 ) ) ( not ( = ?auto_171116 ?auto_171118 ) ) ( not ( = ?auto_171119 ?auto_171117 ) ) ( not ( = ?auto_171119 ?auto_171118 ) ) ( not ( = ?auto_171117 ?auto_171118 ) ) ( ON ?auto_171117 ?auto_171119 ) ( ON ?auto_171118 ?auto_171117 ) ( CLEAR ?auto_171118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171112 ?auto_171113 ?auto_171114 ?auto_171115 ?auto_171116 ?auto_171119 ?auto_171117 )
      ( MAKE-5PILE ?auto_171112 ?auto_171113 ?auto_171114 ?auto_171115 ?auto_171116 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169602 - BLOCK
      ?auto_169603 - BLOCK
      ?auto_169604 - BLOCK
      ?auto_169605 - BLOCK
      ?auto_169606 - BLOCK
    )
    :vars
    (
      ?auto_169608 - BLOCK
      ?auto_169607 - BLOCK
      ?auto_169610 - BLOCK
      ?auto_169609 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169608 ?auto_169606 ) ( ON-TABLE ?auto_169602 ) ( ON ?auto_169603 ?auto_169602 ) ( ON ?auto_169604 ?auto_169603 ) ( ON ?auto_169605 ?auto_169604 ) ( ON ?auto_169606 ?auto_169605 ) ( not ( = ?auto_169602 ?auto_169603 ) ) ( not ( = ?auto_169602 ?auto_169604 ) ) ( not ( = ?auto_169602 ?auto_169605 ) ) ( not ( = ?auto_169602 ?auto_169606 ) ) ( not ( = ?auto_169602 ?auto_169608 ) ) ( not ( = ?auto_169603 ?auto_169604 ) ) ( not ( = ?auto_169603 ?auto_169605 ) ) ( not ( = ?auto_169603 ?auto_169606 ) ) ( not ( = ?auto_169603 ?auto_169608 ) ) ( not ( = ?auto_169604 ?auto_169605 ) ) ( not ( = ?auto_169604 ?auto_169606 ) ) ( not ( = ?auto_169604 ?auto_169608 ) ) ( not ( = ?auto_169605 ?auto_169606 ) ) ( not ( = ?auto_169605 ?auto_169608 ) ) ( not ( = ?auto_169606 ?auto_169608 ) ) ( not ( = ?auto_169602 ?auto_169607 ) ) ( not ( = ?auto_169602 ?auto_169610 ) ) ( not ( = ?auto_169603 ?auto_169607 ) ) ( not ( = ?auto_169603 ?auto_169610 ) ) ( not ( = ?auto_169604 ?auto_169607 ) ) ( not ( = ?auto_169604 ?auto_169610 ) ) ( not ( = ?auto_169605 ?auto_169607 ) ) ( not ( = ?auto_169605 ?auto_169610 ) ) ( not ( = ?auto_169606 ?auto_169607 ) ) ( not ( = ?auto_169606 ?auto_169610 ) ) ( not ( = ?auto_169608 ?auto_169607 ) ) ( not ( = ?auto_169608 ?auto_169610 ) ) ( not ( = ?auto_169607 ?auto_169610 ) ) ( ON ?auto_169607 ?auto_169608 ) ( not ( = ?auto_169609 ?auto_169610 ) ) ( not ( = ?auto_169602 ?auto_169609 ) ) ( not ( = ?auto_169603 ?auto_169609 ) ) ( not ( = ?auto_169604 ?auto_169609 ) ) ( not ( = ?auto_169605 ?auto_169609 ) ) ( not ( = ?auto_169606 ?auto_169609 ) ) ( not ( = ?auto_169608 ?auto_169609 ) ) ( not ( = ?auto_169607 ?auto_169609 ) ) ( ON ?auto_169610 ?auto_169607 ) ( CLEAR ?auto_169610 ) ( HOLDING ?auto_169609 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169609 )
      ( MAKE-5PILE ?auto_169602 ?auto_169603 ?auto_169604 ?auto_169605 ?auto_169606 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169611 - BLOCK
      ?auto_169612 - BLOCK
      ?auto_169613 - BLOCK
      ?auto_169614 - BLOCK
      ?auto_169615 - BLOCK
    )
    :vars
    (
      ?auto_169617 - BLOCK
      ?auto_169619 - BLOCK
      ?auto_169616 - BLOCK
      ?auto_169618 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169617 ?auto_169615 ) ( ON-TABLE ?auto_169611 ) ( ON ?auto_169612 ?auto_169611 ) ( ON ?auto_169613 ?auto_169612 ) ( ON ?auto_169614 ?auto_169613 ) ( ON ?auto_169615 ?auto_169614 ) ( not ( = ?auto_169611 ?auto_169612 ) ) ( not ( = ?auto_169611 ?auto_169613 ) ) ( not ( = ?auto_169611 ?auto_169614 ) ) ( not ( = ?auto_169611 ?auto_169615 ) ) ( not ( = ?auto_169611 ?auto_169617 ) ) ( not ( = ?auto_169612 ?auto_169613 ) ) ( not ( = ?auto_169612 ?auto_169614 ) ) ( not ( = ?auto_169612 ?auto_169615 ) ) ( not ( = ?auto_169612 ?auto_169617 ) ) ( not ( = ?auto_169613 ?auto_169614 ) ) ( not ( = ?auto_169613 ?auto_169615 ) ) ( not ( = ?auto_169613 ?auto_169617 ) ) ( not ( = ?auto_169614 ?auto_169615 ) ) ( not ( = ?auto_169614 ?auto_169617 ) ) ( not ( = ?auto_169615 ?auto_169617 ) ) ( not ( = ?auto_169611 ?auto_169619 ) ) ( not ( = ?auto_169611 ?auto_169616 ) ) ( not ( = ?auto_169612 ?auto_169619 ) ) ( not ( = ?auto_169612 ?auto_169616 ) ) ( not ( = ?auto_169613 ?auto_169619 ) ) ( not ( = ?auto_169613 ?auto_169616 ) ) ( not ( = ?auto_169614 ?auto_169619 ) ) ( not ( = ?auto_169614 ?auto_169616 ) ) ( not ( = ?auto_169615 ?auto_169619 ) ) ( not ( = ?auto_169615 ?auto_169616 ) ) ( not ( = ?auto_169617 ?auto_169619 ) ) ( not ( = ?auto_169617 ?auto_169616 ) ) ( not ( = ?auto_169619 ?auto_169616 ) ) ( ON ?auto_169619 ?auto_169617 ) ( not ( = ?auto_169618 ?auto_169616 ) ) ( not ( = ?auto_169611 ?auto_169618 ) ) ( not ( = ?auto_169612 ?auto_169618 ) ) ( not ( = ?auto_169613 ?auto_169618 ) ) ( not ( = ?auto_169614 ?auto_169618 ) ) ( not ( = ?auto_169615 ?auto_169618 ) ) ( not ( = ?auto_169617 ?auto_169618 ) ) ( not ( = ?auto_169619 ?auto_169618 ) ) ( ON ?auto_169616 ?auto_169619 ) ( ON ?auto_169618 ?auto_169616 ) ( CLEAR ?auto_169618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169611 ?auto_169612 ?auto_169613 ?auto_169614 ?auto_169615 ?auto_169617 ?auto_169619 ?auto_169616 )
      ( MAKE-5PILE ?auto_169611 ?auto_169612 ?auto_169613 ?auto_169614 ?auto_169615 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169624 - BLOCK
      ?auto_169625 - BLOCK
      ?auto_169626 - BLOCK
      ?auto_169627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169627 ) ( CLEAR ?auto_169626 ) ( ON-TABLE ?auto_169624 ) ( ON ?auto_169625 ?auto_169624 ) ( ON ?auto_169626 ?auto_169625 ) ( not ( = ?auto_169624 ?auto_169625 ) ) ( not ( = ?auto_169624 ?auto_169626 ) ) ( not ( = ?auto_169624 ?auto_169627 ) ) ( not ( = ?auto_169625 ?auto_169626 ) ) ( not ( = ?auto_169625 ?auto_169627 ) ) ( not ( = ?auto_169626 ?auto_169627 ) ) )
    :subtasks
    ( ( !STACK ?auto_169627 ?auto_169626 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169628 - BLOCK
      ?auto_169629 - BLOCK
      ?auto_169630 - BLOCK
      ?auto_169631 - BLOCK
    )
    :vars
    (
      ?auto_169632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169630 ) ( ON-TABLE ?auto_169628 ) ( ON ?auto_169629 ?auto_169628 ) ( ON ?auto_169630 ?auto_169629 ) ( not ( = ?auto_169628 ?auto_169629 ) ) ( not ( = ?auto_169628 ?auto_169630 ) ) ( not ( = ?auto_169628 ?auto_169631 ) ) ( not ( = ?auto_169629 ?auto_169630 ) ) ( not ( = ?auto_169629 ?auto_169631 ) ) ( not ( = ?auto_169630 ?auto_169631 ) ) ( ON ?auto_169631 ?auto_169632 ) ( CLEAR ?auto_169631 ) ( HAND-EMPTY ) ( not ( = ?auto_169628 ?auto_169632 ) ) ( not ( = ?auto_169629 ?auto_169632 ) ) ( not ( = ?auto_169630 ?auto_169632 ) ) ( not ( = ?auto_169631 ?auto_169632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169631 ?auto_169632 )
      ( MAKE-4PILE ?auto_169628 ?auto_169629 ?auto_169630 ?auto_169631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169633 - BLOCK
      ?auto_169634 - BLOCK
      ?auto_169635 - BLOCK
      ?auto_169636 - BLOCK
    )
    :vars
    (
      ?auto_169637 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169633 ) ( ON ?auto_169634 ?auto_169633 ) ( not ( = ?auto_169633 ?auto_169634 ) ) ( not ( = ?auto_169633 ?auto_169635 ) ) ( not ( = ?auto_169633 ?auto_169636 ) ) ( not ( = ?auto_169634 ?auto_169635 ) ) ( not ( = ?auto_169634 ?auto_169636 ) ) ( not ( = ?auto_169635 ?auto_169636 ) ) ( ON ?auto_169636 ?auto_169637 ) ( CLEAR ?auto_169636 ) ( not ( = ?auto_169633 ?auto_169637 ) ) ( not ( = ?auto_169634 ?auto_169637 ) ) ( not ( = ?auto_169635 ?auto_169637 ) ) ( not ( = ?auto_169636 ?auto_169637 ) ) ( HOLDING ?auto_169635 ) ( CLEAR ?auto_169634 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169633 ?auto_169634 ?auto_169635 )
      ( MAKE-4PILE ?auto_169633 ?auto_169634 ?auto_169635 ?auto_169636 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169638 - BLOCK
      ?auto_169639 - BLOCK
      ?auto_169640 - BLOCK
      ?auto_169641 - BLOCK
    )
    :vars
    (
      ?auto_169642 - BLOCK
      ?auto_169644 - BLOCK
      ?auto_169646 - BLOCK
      ?auto_169643 - BLOCK
      ?auto_169645 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169638 ) ( ON ?auto_169639 ?auto_169638 ) ( not ( = ?auto_169638 ?auto_169639 ) ) ( not ( = ?auto_169638 ?auto_169640 ) ) ( not ( = ?auto_169638 ?auto_169641 ) ) ( not ( = ?auto_169639 ?auto_169640 ) ) ( not ( = ?auto_169639 ?auto_169641 ) ) ( not ( = ?auto_169640 ?auto_169641 ) ) ( ON ?auto_169641 ?auto_169642 ) ( not ( = ?auto_169638 ?auto_169642 ) ) ( not ( = ?auto_169639 ?auto_169642 ) ) ( not ( = ?auto_169640 ?auto_169642 ) ) ( not ( = ?auto_169641 ?auto_169642 ) ) ( CLEAR ?auto_169639 ) ( ON ?auto_169640 ?auto_169641 ) ( CLEAR ?auto_169640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169644 ) ( ON ?auto_169646 ?auto_169644 ) ( ON ?auto_169643 ?auto_169646 ) ( ON ?auto_169645 ?auto_169643 ) ( ON ?auto_169642 ?auto_169645 ) ( not ( = ?auto_169644 ?auto_169646 ) ) ( not ( = ?auto_169644 ?auto_169643 ) ) ( not ( = ?auto_169644 ?auto_169645 ) ) ( not ( = ?auto_169644 ?auto_169642 ) ) ( not ( = ?auto_169644 ?auto_169641 ) ) ( not ( = ?auto_169644 ?auto_169640 ) ) ( not ( = ?auto_169646 ?auto_169643 ) ) ( not ( = ?auto_169646 ?auto_169645 ) ) ( not ( = ?auto_169646 ?auto_169642 ) ) ( not ( = ?auto_169646 ?auto_169641 ) ) ( not ( = ?auto_169646 ?auto_169640 ) ) ( not ( = ?auto_169643 ?auto_169645 ) ) ( not ( = ?auto_169643 ?auto_169642 ) ) ( not ( = ?auto_169643 ?auto_169641 ) ) ( not ( = ?auto_169643 ?auto_169640 ) ) ( not ( = ?auto_169645 ?auto_169642 ) ) ( not ( = ?auto_169645 ?auto_169641 ) ) ( not ( = ?auto_169645 ?auto_169640 ) ) ( not ( = ?auto_169638 ?auto_169644 ) ) ( not ( = ?auto_169638 ?auto_169646 ) ) ( not ( = ?auto_169638 ?auto_169643 ) ) ( not ( = ?auto_169638 ?auto_169645 ) ) ( not ( = ?auto_169639 ?auto_169644 ) ) ( not ( = ?auto_169639 ?auto_169646 ) ) ( not ( = ?auto_169639 ?auto_169643 ) ) ( not ( = ?auto_169639 ?auto_169645 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169644 ?auto_169646 ?auto_169643 ?auto_169645 ?auto_169642 ?auto_169641 )
      ( MAKE-4PILE ?auto_169638 ?auto_169639 ?auto_169640 ?auto_169641 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169647 - BLOCK
      ?auto_169648 - BLOCK
      ?auto_169649 - BLOCK
      ?auto_169650 - BLOCK
    )
    :vars
    (
      ?auto_169651 - BLOCK
      ?auto_169653 - BLOCK
      ?auto_169655 - BLOCK
      ?auto_169654 - BLOCK
      ?auto_169652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169647 ) ( not ( = ?auto_169647 ?auto_169648 ) ) ( not ( = ?auto_169647 ?auto_169649 ) ) ( not ( = ?auto_169647 ?auto_169650 ) ) ( not ( = ?auto_169648 ?auto_169649 ) ) ( not ( = ?auto_169648 ?auto_169650 ) ) ( not ( = ?auto_169649 ?auto_169650 ) ) ( ON ?auto_169650 ?auto_169651 ) ( not ( = ?auto_169647 ?auto_169651 ) ) ( not ( = ?auto_169648 ?auto_169651 ) ) ( not ( = ?auto_169649 ?auto_169651 ) ) ( not ( = ?auto_169650 ?auto_169651 ) ) ( ON ?auto_169649 ?auto_169650 ) ( CLEAR ?auto_169649 ) ( ON-TABLE ?auto_169653 ) ( ON ?auto_169655 ?auto_169653 ) ( ON ?auto_169654 ?auto_169655 ) ( ON ?auto_169652 ?auto_169654 ) ( ON ?auto_169651 ?auto_169652 ) ( not ( = ?auto_169653 ?auto_169655 ) ) ( not ( = ?auto_169653 ?auto_169654 ) ) ( not ( = ?auto_169653 ?auto_169652 ) ) ( not ( = ?auto_169653 ?auto_169651 ) ) ( not ( = ?auto_169653 ?auto_169650 ) ) ( not ( = ?auto_169653 ?auto_169649 ) ) ( not ( = ?auto_169655 ?auto_169654 ) ) ( not ( = ?auto_169655 ?auto_169652 ) ) ( not ( = ?auto_169655 ?auto_169651 ) ) ( not ( = ?auto_169655 ?auto_169650 ) ) ( not ( = ?auto_169655 ?auto_169649 ) ) ( not ( = ?auto_169654 ?auto_169652 ) ) ( not ( = ?auto_169654 ?auto_169651 ) ) ( not ( = ?auto_169654 ?auto_169650 ) ) ( not ( = ?auto_169654 ?auto_169649 ) ) ( not ( = ?auto_169652 ?auto_169651 ) ) ( not ( = ?auto_169652 ?auto_169650 ) ) ( not ( = ?auto_169652 ?auto_169649 ) ) ( not ( = ?auto_169647 ?auto_169653 ) ) ( not ( = ?auto_169647 ?auto_169655 ) ) ( not ( = ?auto_169647 ?auto_169654 ) ) ( not ( = ?auto_169647 ?auto_169652 ) ) ( not ( = ?auto_169648 ?auto_169653 ) ) ( not ( = ?auto_169648 ?auto_169655 ) ) ( not ( = ?auto_169648 ?auto_169654 ) ) ( not ( = ?auto_169648 ?auto_169652 ) ) ( HOLDING ?auto_169648 ) ( CLEAR ?auto_169647 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169647 ?auto_169648 )
      ( MAKE-4PILE ?auto_169647 ?auto_169648 ?auto_169649 ?auto_169650 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169656 - BLOCK
      ?auto_169657 - BLOCK
      ?auto_169658 - BLOCK
      ?auto_169659 - BLOCK
    )
    :vars
    (
      ?auto_169662 - BLOCK
      ?auto_169664 - BLOCK
      ?auto_169663 - BLOCK
      ?auto_169660 - BLOCK
      ?auto_169661 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169656 ) ( not ( = ?auto_169656 ?auto_169657 ) ) ( not ( = ?auto_169656 ?auto_169658 ) ) ( not ( = ?auto_169656 ?auto_169659 ) ) ( not ( = ?auto_169657 ?auto_169658 ) ) ( not ( = ?auto_169657 ?auto_169659 ) ) ( not ( = ?auto_169658 ?auto_169659 ) ) ( ON ?auto_169659 ?auto_169662 ) ( not ( = ?auto_169656 ?auto_169662 ) ) ( not ( = ?auto_169657 ?auto_169662 ) ) ( not ( = ?auto_169658 ?auto_169662 ) ) ( not ( = ?auto_169659 ?auto_169662 ) ) ( ON ?auto_169658 ?auto_169659 ) ( ON-TABLE ?auto_169664 ) ( ON ?auto_169663 ?auto_169664 ) ( ON ?auto_169660 ?auto_169663 ) ( ON ?auto_169661 ?auto_169660 ) ( ON ?auto_169662 ?auto_169661 ) ( not ( = ?auto_169664 ?auto_169663 ) ) ( not ( = ?auto_169664 ?auto_169660 ) ) ( not ( = ?auto_169664 ?auto_169661 ) ) ( not ( = ?auto_169664 ?auto_169662 ) ) ( not ( = ?auto_169664 ?auto_169659 ) ) ( not ( = ?auto_169664 ?auto_169658 ) ) ( not ( = ?auto_169663 ?auto_169660 ) ) ( not ( = ?auto_169663 ?auto_169661 ) ) ( not ( = ?auto_169663 ?auto_169662 ) ) ( not ( = ?auto_169663 ?auto_169659 ) ) ( not ( = ?auto_169663 ?auto_169658 ) ) ( not ( = ?auto_169660 ?auto_169661 ) ) ( not ( = ?auto_169660 ?auto_169662 ) ) ( not ( = ?auto_169660 ?auto_169659 ) ) ( not ( = ?auto_169660 ?auto_169658 ) ) ( not ( = ?auto_169661 ?auto_169662 ) ) ( not ( = ?auto_169661 ?auto_169659 ) ) ( not ( = ?auto_169661 ?auto_169658 ) ) ( not ( = ?auto_169656 ?auto_169664 ) ) ( not ( = ?auto_169656 ?auto_169663 ) ) ( not ( = ?auto_169656 ?auto_169660 ) ) ( not ( = ?auto_169656 ?auto_169661 ) ) ( not ( = ?auto_169657 ?auto_169664 ) ) ( not ( = ?auto_169657 ?auto_169663 ) ) ( not ( = ?auto_169657 ?auto_169660 ) ) ( not ( = ?auto_169657 ?auto_169661 ) ) ( CLEAR ?auto_169656 ) ( ON ?auto_169657 ?auto_169658 ) ( CLEAR ?auto_169657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169664 ?auto_169663 ?auto_169660 ?auto_169661 ?auto_169662 ?auto_169659 ?auto_169658 )
      ( MAKE-4PILE ?auto_169656 ?auto_169657 ?auto_169658 ?auto_169659 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169665 - BLOCK
      ?auto_169666 - BLOCK
      ?auto_169667 - BLOCK
      ?auto_169668 - BLOCK
    )
    :vars
    (
      ?auto_169671 - BLOCK
      ?auto_169673 - BLOCK
      ?auto_169669 - BLOCK
      ?auto_169670 - BLOCK
      ?auto_169672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169665 ?auto_169666 ) ) ( not ( = ?auto_169665 ?auto_169667 ) ) ( not ( = ?auto_169665 ?auto_169668 ) ) ( not ( = ?auto_169666 ?auto_169667 ) ) ( not ( = ?auto_169666 ?auto_169668 ) ) ( not ( = ?auto_169667 ?auto_169668 ) ) ( ON ?auto_169668 ?auto_169671 ) ( not ( = ?auto_169665 ?auto_169671 ) ) ( not ( = ?auto_169666 ?auto_169671 ) ) ( not ( = ?auto_169667 ?auto_169671 ) ) ( not ( = ?auto_169668 ?auto_169671 ) ) ( ON ?auto_169667 ?auto_169668 ) ( ON-TABLE ?auto_169673 ) ( ON ?auto_169669 ?auto_169673 ) ( ON ?auto_169670 ?auto_169669 ) ( ON ?auto_169672 ?auto_169670 ) ( ON ?auto_169671 ?auto_169672 ) ( not ( = ?auto_169673 ?auto_169669 ) ) ( not ( = ?auto_169673 ?auto_169670 ) ) ( not ( = ?auto_169673 ?auto_169672 ) ) ( not ( = ?auto_169673 ?auto_169671 ) ) ( not ( = ?auto_169673 ?auto_169668 ) ) ( not ( = ?auto_169673 ?auto_169667 ) ) ( not ( = ?auto_169669 ?auto_169670 ) ) ( not ( = ?auto_169669 ?auto_169672 ) ) ( not ( = ?auto_169669 ?auto_169671 ) ) ( not ( = ?auto_169669 ?auto_169668 ) ) ( not ( = ?auto_169669 ?auto_169667 ) ) ( not ( = ?auto_169670 ?auto_169672 ) ) ( not ( = ?auto_169670 ?auto_169671 ) ) ( not ( = ?auto_169670 ?auto_169668 ) ) ( not ( = ?auto_169670 ?auto_169667 ) ) ( not ( = ?auto_169672 ?auto_169671 ) ) ( not ( = ?auto_169672 ?auto_169668 ) ) ( not ( = ?auto_169672 ?auto_169667 ) ) ( not ( = ?auto_169665 ?auto_169673 ) ) ( not ( = ?auto_169665 ?auto_169669 ) ) ( not ( = ?auto_169665 ?auto_169670 ) ) ( not ( = ?auto_169665 ?auto_169672 ) ) ( not ( = ?auto_169666 ?auto_169673 ) ) ( not ( = ?auto_169666 ?auto_169669 ) ) ( not ( = ?auto_169666 ?auto_169670 ) ) ( not ( = ?auto_169666 ?auto_169672 ) ) ( ON ?auto_169666 ?auto_169667 ) ( CLEAR ?auto_169666 ) ( HOLDING ?auto_169665 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169665 )
      ( MAKE-4PILE ?auto_169665 ?auto_169666 ?auto_169667 ?auto_169668 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169674 - BLOCK
      ?auto_169675 - BLOCK
      ?auto_169676 - BLOCK
      ?auto_169677 - BLOCK
    )
    :vars
    (
      ?auto_169679 - BLOCK
      ?auto_169681 - BLOCK
      ?auto_169680 - BLOCK
      ?auto_169678 - BLOCK
      ?auto_169682 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169674 ?auto_169675 ) ) ( not ( = ?auto_169674 ?auto_169676 ) ) ( not ( = ?auto_169674 ?auto_169677 ) ) ( not ( = ?auto_169675 ?auto_169676 ) ) ( not ( = ?auto_169675 ?auto_169677 ) ) ( not ( = ?auto_169676 ?auto_169677 ) ) ( ON ?auto_169677 ?auto_169679 ) ( not ( = ?auto_169674 ?auto_169679 ) ) ( not ( = ?auto_169675 ?auto_169679 ) ) ( not ( = ?auto_169676 ?auto_169679 ) ) ( not ( = ?auto_169677 ?auto_169679 ) ) ( ON ?auto_169676 ?auto_169677 ) ( ON-TABLE ?auto_169681 ) ( ON ?auto_169680 ?auto_169681 ) ( ON ?auto_169678 ?auto_169680 ) ( ON ?auto_169682 ?auto_169678 ) ( ON ?auto_169679 ?auto_169682 ) ( not ( = ?auto_169681 ?auto_169680 ) ) ( not ( = ?auto_169681 ?auto_169678 ) ) ( not ( = ?auto_169681 ?auto_169682 ) ) ( not ( = ?auto_169681 ?auto_169679 ) ) ( not ( = ?auto_169681 ?auto_169677 ) ) ( not ( = ?auto_169681 ?auto_169676 ) ) ( not ( = ?auto_169680 ?auto_169678 ) ) ( not ( = ?auto_169680 ?auto_169682 ) ) ( not ( = ?auto_169680 ?auto_169679 ) ) ( not ( = ?auto_169680 ?auto_169677 ) ) ( not ( = ?auto_169680 ?auto_169676 ) ) ( not ( = ?auto_169678 ?auto_169682 ) ) ( not ( = ?auto_169678 ?auto_169679 ) ) ( not ( = ?auto_169678 ?auto_169677 ) ) ( not ( = ?auto_169678 ?auto_169676 ) ) ( not ( = ?auto_169682 ?auto_169679 ) ) ( not ( = ?auto_169682 ?auto_169677 ) ) ( not ( = ?auto_169682 ?auto_169676 ) ) ( not ( = ?auto_169674 ?auto_169681 ) ) ( not ( = ?auto_169674 ?auto_169680 ) ) ( not ( = ?auto_169674 ?auto_169678 ) ) ( not ( = ?auto_169674 ?auto_169682 ) ) ( not ( = ?auto_169675 ?auto_169681 ) ) ( not ( = ?auto_169675 ?auto_169680 ) ) ( not ( = ?auto_169675 ?auto_169678 ) ) ( not ( = ?auto_169675 ?auto_169682 ) ) ( ON ?auto_169675 ?auto_169676 ) ( ON ?auto_169674 ?auto_169675 ) ( CLEAR ?auto_169674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169681 ?auto_169680 ?auto_169678 ?auto_169682 ?auto_169679 ?auto_169677 ?auto_169676 ?auto_169675 )
      ( MAKE-4PILE ?auto_169674 ?auto_169675 ?auto_169676 ?auto_169677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169687 - BLOCK
      ?auto_169688 - BLOCK
      ?auto_169689 - BLOCK
      ?auto_169690 - BLOCK
    )
    :vars
    (
      ?auto_169691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169691 ?auto_169690 ) ( CLEAR ?auto_169691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169687 ) ( ON ?auto_169688 ?auto_169687 ) ( ON ?auto_169689 ?auto_169688 ) ( ON ?auto_169690 ?auto_169689 ) ( not ( = ?auto_169687 ?auto_169688 ) ) ( not ( = ?auto_169687 ?auto_169689 ) ) ( not ( = ?auto_169687 ?auto_169690 ) ) ( not ( = ?auto_169687 ?auto_169691 ) ) ( not ( = ?auto_169688 ?auto_169689 ) ) ( not ( = ?auto_169688 ?auto_169690 ) ) ( not ( = ?auto_169688 ?auto_169691 ) ) ( not ( = ?auto_169689 ?auto_169690 ) ) ( not ( = ?auto_169689 ?auto_169691 ) ) ( not ( = ?auto_169690 ?auto_169691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169691 ?auto_169690 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169692 - BLOCK
      ?auto_169693 - BLOCK
      ?auto_169694 - BLOCK
      ?auto_169695 - BLOCK
    )
    :vars
    (
      ?auto_169696 - BLOCK
      ?auto_169697 - BLOCK
      ?auto_169698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169696 ?auto_169695 ) ( CLEAR ?auto_169696 ) ( ON-TABLE ?auto_169692 ) ( ON ?auto_169693 ?auto_169692 ) ( ON ?auto_169694 ?auto_169693 ) ( ON ?auto_169695 ?auto_169694 ) ( not ( = ?auto_169692 ?auto_169693 ) ) ( not ( = ?auto_169692 ?auto_169694 ) ) ( not ( = ?auto_169692 ?auto_169695 ) ) ( not ( = ?auto_169692 ?auto_169696 ) ) ( not ( = ?auto_169693 ?auto_169694 ) ) ( not ( = ?auto_169693 ?auto_169695 ) ) ( not ( = ?auto_169693 ?auto_169696 ) ) ( not ( = ?auto_169694 ?auto_169695 ) ) ( not ( = ?auto_169694 ?auto_169696 ) ) ( not ( = ?auto_169695 ?auto_169696 ) ) ( HOLDING ?auto_169697 ) ( CLEAR ?auto_169698 ) ( not ( = ?auto_169692 ?auto_169697 ) ) ( not ( = ?auto_169692 ?auto_169698 ) ) ( not ( = ?auto_169693 ?auto_169697 ) ) ( not ( = ?auto_169693 ?auto_169698 ) ) ( not ( = ?auto_169694 ?auto_169697 ) ) ( not ( = ?auto_169694 ?auto_169698 ) ) ( not ( = ?auto_169695 ?auto_169697 ) ) ( not ( = ?auto_169695 ?auto_169698 ) ) ( not ( = ?auto_169696 ?auto_169697 ) ) ( not ( = ?auto_169696 ?auto_169698 ) ) ( not ( = ?auto_169697 ?auto_169698 ) ) )
    :subtasks
    ( ( !STACK ?auto_169697 ?auto_169698 )
      ( MAKE-4PILE ?auto_169692 ?auto_169693 ?auto_169694 ?auto_169695 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169699 - BLOCK
      ?auto_169700 - BLOCK
      ?auto_169701 - BLOCK
      ?auto_169702 - BLOCK
    )
    :vars
    (
      ?auto_169703 - BLOCK
      ?auto_169705 - BLOCK
      ?auto_169704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169703 ?auto_169702 ) ( ON-TABLE ?auto_169699 ) ( ON ?auto_169700 ?auto_169699 ) ( ON ?auto_169701 ?auto_169700 ) ( ON ?auto_169702 ?auto_169701 ) ( not ( = ?auto_169699 ?auto_169700 ) ) ( not ( = ?auto_169699 ?auto_169701 ) ) ( not ( = ?auto_169699 ?auto_169702 ) ) ( not ( = ?auto_169699 ?auto_169703 ) ) ( not ( = ?auto_169700 ?auto_169701 ) ) ( not ( = ?auto_169700 ?auto_169702 ) ) ( not ( = ?auto_169700 ?auto_169703 ) ) ( not ( = ?auto_169701 ?auto_169702 ) ) ( not ( = ?auto_169701 ?auto_169703 ) ) ( not ( = ?auto_169702 ?auto_169703 ) ) ( CLEAR ?auto_169705 ) ( not ( = ?auto_169699 ?auto_169704 ) ) ( not ( = ?auto_169699 ?auto_169705 ) ) ( not ( = ?auto_169700 ?auto_169704 ) ) ( not ( = ?auto_169700 ?auto_169705 ) ) ( not ( = ?auto_169701 ?auto_169704 ) ) ( not ( = ?auto_169701 ?auto_169705 ) ) ( not ( = ?auto_169702 ?auto_169704 ) ) ( not ( = ?auto_169702 ?auto_169705 ) ) ( not ( = ?auto_169703 ?auto_169704 ) ) ( not ( = ?auto_169703 ?auto_169705 ) ) ( not ( = ?auto_169704 ?auto_169705 ) ) ( ON ?auto_169704 ?auto_169703 ) ( CLEAR ?auto_169704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169699 ?auto_169700 ?auto_169701 ?auto_169702 ?auto_169703 )
      ( MAKE-4PILE ?auto_169699 ?auto_169700 ?auto_169701 ?auto_169702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169706 - BLOCK
      ?auto_169707 - BLOCK
      ?auto_169708 - BLOCK
      ?auto_169709 - BLOCK
    )
    :vars
    (
      ?auto_169710 - BLOCK
      ?auto_169711 - BLOCK
      ?auto_169712 - BLOCK
      ?auto_169714 - BLOCK
      ?auto_169713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169710 ?auto_169709 ) ( ON-TABLE ?auto_169706 ) ( ON ?auto_169707 ?auto_169706 ) ( ON ?auto_169708 ?auto_169707 ) ( ON ?auto_169709 ?auto_169708 ) ( not ( = ?auto_169706 ?auto_169707 ) ) ( not ( = ?auto_169706 ?auto_169708 ) ) ( not ( = ?auto_169706 ?auto_169709 ) ) ( not ( = ?auto_169706 ?auto_169710 ) ) ( not ( = ?auto_169707 ?auto_169708 ) ) ( not ( = ?auto_169707 ?auto_169709 ) ) ( not ( = ?auto_169707 ?auto_169710 ) ) ( not ( = ?auto_169708 ?auto_169709 ) ) ( not ( = ?auto_169708 ?auto_169710 ) ) ( not ( = ?auto_169709 ?auto_169710 ) ) ( not ( = ?auto_169706 ?auto_169711 ) ) ( not ( = ?auto_169706 ?auto_169712 ) ) ( not ( = ?auto_169707 ?auto_169711 ) ) ( not ( = ?auto_169707 ?auto_169712 ) ) ( not ( = ?auto_169708 ?auto_169711 ) ) ( not ( = ?auto_169708 ?auto_169712 ) ) ( not ( = ?auto_169709 ?auto_169711 ) ) ( not ( = ?auto_169709 ?auto_169712 ) ) ( not ( = ?auto_169710 ?auto_169711 ) ) ( not ( = ?auto_169710 ?auto_169712 ) ) ( not ( = ?auto_169711 ?auto_169712 ) ) ( ON ?auto_169711 ?auto_169710 ) ( CLEAR ?auto_169711 ) ( HOLDING ?auto_169712 ) ( CLEAR ?auto_169714 ) ( ON-TABLE ?auto_169713 ) ( ON ?auto_169714 ?auto_169713 ) ( not ( = ?auto_169713 ?auto_169714 ) ) ( not ( = ?auto_169713 ?auto_169712 ) ) ( not ( = ?auto_169714 ?auto_169712 ) ) ( not ( = ?auto_169706 ?auto_169714 ) ) ( not ( = ?auto_169706 ?auto_169713 ) ) ( not ( = ?auto_169707 ?auto_169714 ) ) ( not ( = ?auto_169707 ?auto_169713 ) ) ( not ( = ?auto_169708 ?auto_169714 ) ) ( not ( = ?auto_169708 ?auto_169713 ) ) ( not ( = ?auto_169709 ?auto_169714 ) ) ( not ( = ?auto_169709 ?auto_169713 ) ) ( not ( = ?auto_169710 ?auto_169714 ) ) ( not ( = ?auto_169710 ?auto_169713 ) ) ( not ( = ?auto_169711 ?auto_169714 ) ) ( not ( = ?auto_169711 ?auto_169713 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169713 ?auto_169714 ?auto_169712 )
      ( MAKE-4PILE ?auto_169706 ?auto_169707 ?auto_169708 ?auto_169709 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169715 - BLOCK
      ?auto_169716 - BLOCK
      ?auto_169717 - BLOCK
      ?auto_169718 - BLOCK
    )
    :vars
    (
      ?auto_169719 - BLOCK
      ?auto_169722 - BLOCK
      ?auto_169721 - BLOCK
      ?auto_169723 - BLOCK
      ?auto_169720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169719 ?auto_169718 ) ( ON-TABLE ?auto_169715 ) ( ON ?auto_169716 ?auto_169715 ) ( ON ?auto_169717 ?auto_169716 ) ( ON ?auto_169718 ?auto_169717 ) ( not ( = ?auto_169715 ?auto_169716 ) ) ( not ( = ?auto_169715 ?auto_169717 ) ) ( not ( = ?auto_169715 ?auto_169718 ) ) ( not ( = ?auto_169715 ?auto_169719 ) ) ( not ( = ?auto_169716 ?auto_169717 ) ) ( not ( = ?auto_169716 ?auto_169718 ) ) ( not ( = ?auto_169716 ?auto_169719 ) ) ( not ( = ?auto_169717 ?auto_169718 ) ) ( not ( = ?auto_169717 ?auto_169719 ) ) ( not ( = ?auto_169718 ?auto_169719 ) ) ( not ( = ?auto_169715 ?auto_169722 ) ) ( not ( = ?auto_169715 ?auto_169721 ) ) ( not ( = ?auto_169716 ?auto_169722 ) ) ( not ( = ?auto_169716 ?auto_169721 ) ) ( not ( = ?auto_169717 ?auto_169722 ) ) ( not ( = ?auto_169717 ?auto_169721 ) ) ( not ( = ?auto_169718 ?auto_169722 ) ) ( not ( = ?auto_169718 ?auto_169721 ) ) ( not ( = ?auto_169719 ?auto_169722 ) ) ( not ( = ?auto_169719 ?auto_169721 ) ) ( not ( = ?auto_169722 ?auto_169721 ) ) ( ON ?auto_169722 ?auto_169719 ) ( CLEAR ?auto_169723 ) ( ON-TABLE ?auto_169720 ) ( ON ?auto_169723 ?auto_169720 ) ( not ( = ?auto_169720 ?auto_169723 ) ) ( not ( = ?auto_169720 ?auto_169721 ) ) ( not ( = ?auto_169723 ?auto_169721 ) ) ( not ( = ?auto_169715 ?auto_169723 ) ) ( not ( = ?auto_169715 ?auto_169720 ) ) ( not ( = ?auto_169716 ?auto_169723 ) ) ( not ( = ?auto_169716 ?auto_169720 ) ) ( not ( = ?auto_169717 ?auto_169723 ) ) ( not ( = ?auto_169717 ?auto_169720 ) ) ( not ( = ?auto_169718 ?auto_169723 ) ) ( not ( = ?auto_169718 ?auto_169720 ) ) ( not ( = ?auto_169719 ?auto_169723 ) ) ( not ( = ?auto_169719 ?auto_169720 ) ) ( not ( = ?auto_169722 ?auto_169723 ) ) ( not ( = ?auto_169722 ?auto_169720 ) ) ( ON ?auto_169721 ?auto_169722 ) ( CLEAR ?auto_169721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169715 ?auto_169716 ?auto_169717 ?auto_169718 ?auto_169719 ?auto_169722 )
      ( MAKE-4PILE ?auto_169715 ?auto_169716 ?auto_169717 ?auto_169718 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169724 - BLOCK
      ?auto_169725 - BLOCK
      ?auto_169726 - BLOCK
      ?auto_169727 - BLOCK
    )
    :vars
    (
      ?auto_169729 - BLOCK
      ?auto_169731 - BLOCK
      ?auto_169732 - BLOCK
      ?auto_169728 - BLOCK
      ?auto_169730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169729 ?auto_169727 ) ( ON-TABLE ?auto_169724 ) ( ON ?auto_169725 ?auto_169724 ) ( ON ?auto_169726 ?auto_169725 ) ( ON ?auto_169727 ?auto_169726 ) ( not ( = ?auto_169724 ?auto_169725 ) ) ( not ( = ?auto_169724 ?auto_169726 ) ) ( not ( = ?auto_169724 ?auto_169727 ) ) ( not ( = ?auto_169724 ?auto_169729 ) ) ( not ( = ?auto_169725 ?auto_169726 ) ) ( not ( = ?auto_169725 ?auto_169727 ) ) ( not ( = ?auto_169725 ?auto_169729 ) ) ( not ( = ?auto_169726 ?auto_169727 ) ) ( not ( = ?auto_169726 ?auto_169729 ) ) ( not ( = ?auto_169727 ?auto_169729 ) ) ( not ( = ?auto_169724 ?auto_169731 ) ) ( not ( = ?auto_169724 ?auto_169732 ) ) ( not ( = ?auto_169725 ?auto_169731 ) ) ( not ( = ?auto_169725 ?auto_169732 ) ) ( not ( = ?auto_169726 ?auto_169731 ) ) ( not ( = ?auto_169726 ?auto_169732 ) ) ( not ( = ?auto_169727 ?auto_169731 ) ) ( not ( = ?auto_169727 ?auto_169732 ) ) ( not ( = ?auto_169729 ?auto_169731 ) ) ( not ( = ?auto_169729 ?auto_169732 ) ) ( not ( = ?auto_169731 ?auto_169732 ) ) ( ON ?auto_169731 ?auto_169729 ) ( ON-TABLE ?auto_169728 ) ( not ( = ?auto_169728 ?auto_169730 ) ) ( not ( = ?auto_169728 ?auto_169732 ) ) ( not ( = ?auto_169730 ?auto_169732 ) ) ( not ( = ?auto_169724 ?auto_169730 ) ) ( not ( = ?auto_169724 ?auto_169728 ) ) ( not ( = ?auto_169725 ?auto_169730 ) ) ( not ( = ?auto_169725 ?auto_169728 ) ) ( not ( = ?auto_169726 ?auto_169730 ) ) ( not ( = ?auto_169726 ?auto_169728 ) ) ( not ( = ?auto_169727 ?auto_169730 ) ) ( not ( = ?auto_169727 ?auto_169728 ) ) ( not ( = ?auto_169729 ?auto_169730 ) ) ( not ( = ?auto_169729 ?auto_169728 ) ) ( not ( = ?auto_169731 ?auto_169730 ) ) ( not ( = ?auto_169731 ?auto_169728 ) ) ( ON ?auto_169732 ?auto_169731 ) ( CLEAR ?auto_169732 ) ( HOLDING ?auto_169730 ) ( CLEAR ?auto_169728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169728 ?auto_169730 )
      ( MAKE-4PILE ?auto_169724 ?auto_169725 ?auto_169726 ?auto_169727 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171426 - BLOCK
      ?auto_171427 - BLOCK
      ?auto_171428 - BLOCK
      ?auto_171429 - BLOCK
    )
    :vars
    (
      ?auto_171431 - BLOCK
      ?auto_171430 - BLOCK
      ?auto_171432 - BLOCK
      ?auto_171433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171431 ?auto_171429 ) ( ON-TABLE ?auto_171426 ) ( ON ?auto_171427 ?auto_171426 ) ( ON ?auto_171428 ?auto_171427 ) ( ON ?auto_171429 ?auto_171428 ) ( not ( = ?auto_171426 ?auto_171427 ) ) ( not ( = ?auto_171426 ?auto_171428 ) ) ( not ( = ?auto_171426 ?auto_171429 ) ) ( not ( = ?auto_171426 ?auto_171431 ) ) ( not ( = ?auto_171427 ?auto_171428 ) ) ( not ( = ?auto_171427 ?auto_171429 ) ) ( not ( = ?auto_171427 ?auto_171431 ) ) ( not ( = ?auto_171428 ?auto_171429 ) ) ( not ( = ?auto_171428 ?auto_171431 ) ) ( not ( = ?auto_171429 ?auto_171431 ) ) ( not ( = ?auto_171426 ?auto_171430 ) ) ( not ( = ?auto_171426 ?auto_171432 ) ) ( not ( = ?auto_171427 ?auto_171430 ) ) ( not ( = ?auto_171427 ?auto_171432 ) ) ( not ( = ?auto_171428 ?auto_171430 ) ) ( not ( = ?auto_171428 ?auto_171432 ) ) ( not ( = ?auto_171429 ?auto_171430 ) ) ( not ( = ?auto_171429 ?auto_171432 ) ) ( not ( = ?auto_171431 ?auto_171430 ) ) ( not ( = ?auto_171431 ?auto_171432 ) ) ( not ( = ?auto_171430 ?auto_171432 ) ) ( ON ?auto_171430 ?auto_171431 ) ( not ( = ?auto_171433 ?auto_171432 ) ) ( not ( = ?auto_171426 ?auto_171433 ) ) ( not ( = ?auto_171427 ?auto_171433 ) ) ( not ( = ?auto_171428 ?auto_171433 ) ) ( not ( = ?auto_171429 ?auto_171433 ) ) ( not ( = ?auto_171431 ?auto_171433 ) ) ( not ( = ?auto_171430 ?auto_171433 ) ) ( ON ?auto_171432 ?auto_171430 ) ( ON ?auto_171433 ?auto_171432 ) ( CLEAR ?auto_171433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171426 ?auto_171427 ?auto_171428 ?auto_171429 ?auto_171431 ?auto_171430 ?auto_171432 )
      ( MAKE-4PILE ?auto_171426 ?auto_171427 ?auto_171428 ?auto_171429 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169742 - BLOCK
      ?auto_169743 - BLOCK
      ?auto_169744 - BLOCK
      ?auto_169745 - BLOCK
    )
    :vars
    (
      ?auto_169750 - BLOCK
      ?auto_169746 - BLOCK
      ?auto_169747 - BLOCK
      ?auto_169749 - BLOCK
      ?auto_169748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169750 ?auto_169745 ) ( ON-TABLE ?auto_169742 ) ( ON ?auto_169743 ?auto_169742 ) ( ON ?auto_169744 ?auto_169743 ) ( ON ?auto_169745 ?auto_169744 ) ( not ( = ?auto_169742 ?auto_169743 ) ) ( not ( = ?auto_169742 ?auto_169744 ) ) ( not ( = ?auto_169742 ?auto_169745 ) ) ( not ( = ?auto_169742 ?auto_169750 ) ) ( not ( = ?auto_169743 ?auto_169744 ) ) ( not ( = ?auto_169743 ?auto_169745 ) ) ( not ( = ?auto_169743 ?auto_169750 ) ) ( not ( = ?auto_169744 ?auto_169745 ) ) ( not ( = ?auto_169744 ?auto_169750 ) ) ( not ( = ?auto_169745 ?auto_169750 ) ) ( not ( = ?auto_169742 ?auto_169746 ) ) ( not ( = ?auto_169742 ?auto_169747 ) ) ( not ( = ?auto_169743 ?auto_169746 ) ) ( not ( = ?auto_169743 ?auto_169747 ) ) ( not ( = ?auto_169744 ?auto_169746 ) ) ( not ( = ?auto_169744 ?auto_169747 ) ) ( not ( = ?auto_169745 ?auto_169746 ) ) ( not ( = ?auto_169745 ?auto_169747 ) ) ( not ( = ?auto_169750 ?auto_169746 ) ) ( not ( = ?auto_169750 ?auto_169747 ) ) ( not ( = ?auto_169746 ?auto_169747 ) ) ( ON ?auto_169746 ?auto_169750 ) ( not ( = ?auto_169749 ?auto_169748 ) ) ( not ( = ?auto_169749 ?auto_169747 ) ) ( not ( = ?auto_169748 ?auto_169747 ) ) ( not ( = ?auto_169742 ?auto_169748 ) ) ( not ( = ?auto_169742 ?auto_169749 ) ) ( not ( = ?auto_169743 ?auto_169748 ) ) ( not ( = ?auto_169743 ?auto_169749 ) ) ( not ( = ?auto_169744 ?auto_169748 ) ) ( not ( = ?auto_169744 ?auto_169749 ) ) ( not ( = ?auto_169745 ?auto_169748 ) ) ( not ( = ?auto_169745 ?auto_169749 ) ) ( not ( = ?auto_169750 ?auto_169748 ) ) ( not ( = ?auto_169750 ?auto_169749 ) ) ( not ( = ?auto_169746 ?auto_169748 ) ) ( not ( = ?auto_169746 ?auto_169749 ) ) ( ON ?auto_169747 ?auto_169746 ) ( ON ?auto_169748 ?auto_169747 ) ( CLEAR ?auto_169748 ) ( HOLDING ?auto_169749 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169749 )
      ( MAKE-4PILE ?auto_169742 ?auto_169743 ?auto_169744 ?auto_169745 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_169751 - BLOCK
      ?auto_169752 - BLOCK
      ?auto_169753 - BLOCK
      ?auto_169754 - BLOCK
    )
    :vars
    (
      ?auto_169756 - BLOCK
      ?auto_169755 - BLOCK
      ?auto_169759 - BLOCK
      ?auto_169757 - BLOCK
      ?auto_169758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169756 ?auto_169754 ) ( ON-TABLE ?auto_169751 ) ( ON ?auto_169752 ?auto_169751 ) ( ON ?auto_169753 ?auto_169752 ) ( ON ?auto_169754 ?auto_169753 ) ( not ( = ?auto_169751 ?auto_169752 ) ) ( not ( = ?auto_169751 ?auto_169753 ) ) ( not ( = ?auto_169751 ?auto_169754 ) ) ( not ( = ?auto_169751 ?auto_169756 ) ) ( not ( = ?auto_169752 ?auto_169753 ) ) ( not ( = ?auto_169752 ?auto_169754 ) ) ( not ( = ?auto_169752 ?auto_169756 ) ) ( not ( = ?auto_169753 ?auto_169754 ) ) ( not ( = ?auto_169753 ?auto_169756 ) ) ( not ( = ?auto_169754 ?auto_169756 ) ) ( not ( = ?auto_169751 ?auto_169755 ) ) ( not ( = ?auto_169751 ?auto_169759 ) ) ( not ( = ?auto_169752 ?auto_169755 ) ) ( not ( = ?auto_169752 ?auto_169759 ) ) ( not ( = ?auto_169753 ?auto_169755 ) ) ( not ( = ?auto_169753 ?auto_169759 ) ) ( not ( = ?auto_169754 ?auto_169755 ) ) ( not ( = ?auto_169754 ?auto_169759 ) ) ( not ( = ?auto_169756 ?auto_169755 ) ) ( not ( = ?auto_169756 ?auto_169759 ) ) ( not ( = ?auto_169755 ?auto_169759 ) ) ( ON ?auto_169755 ?auto_169756 ) ( not ( = ?auto_169757 ?auto_169758 ) ) ( not ( = ?auto_169757 ?auto_169759 ) ) ( not ( = ?auto_169758 ?auto_169759 ) ) ( not ( = ?auto_169751 ?auto_169758 ) ) ( not ( = ?auto_169751 ?auto_169757 ) ) ( not ( = ?auto_169752 ?auto_169758 ) ) ( not ( = ?auto_169752 ?auto_169757 ) ) ( not ( = ?auto_169753 ?auto_169758 ) ) ( not ( = ?auto_169753 ?auto_169757 ) ) ( not ( = ?auto_169754 ?auto_169758 ) ) ( not ( = ?auto_169754 ?auto_169757 ) ) ( not ( = ?auto_169756 ?auto_169758 ) ) ( not ( = ?auto_169756 ?auto_169757 ) ) ( not ( = ?auto_169755 ?auto_169758 ) ) ( not ( = ?auto_169755 ?auto_169757 ) ) ( ON ?auto_169759 ?auto_169755 ) ( ON ?auto_169758 ?auto_169759 ) ( ON ?auto_169757 ?auto_169758 ) ( CLEAR ?auto_169757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169751 ?auto_169752 ?auto_169753 ?auto_169754 ?auto_169756 ?auto_169755 ?auto_169759 ?auto_169758 )
      ( MAKE-4PILE ?auto_169751 ?auto_169752 ?auto_169753 ?auto_169754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169765 - BLOCK
      ?auto_169766 - BLOCK
      ?auto_169767 - BLOCK
      ?auto_169768 - BLOCK
      ?auto_169769 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169769 ) ( CLEAR ?auto_169768 ) ( ON-TABLE ?auto_169765 ) ( ON ?auto_169766 ?auto_169765 ) ( ON ?auto_169767 ?auto_169766 ) ( ON ?auto_169768 ?auto_169767 ) ( not ( = ?auto_169765 ?auto_169766 ) ) ( not ( = ?auto_169765 ?auto_169767 ) ) ( not ( = ?auto_169765 ?auto_169768 ) ) ( not ( = ?auto_169765 ?auto_169769 ) ) ( not ( = ?auto_169766 ?auto_169767 ) ) ( not ( = ?auto_169766 ?auto_169768 ) ) ( not ( = ?auto_169766 ?auto_169769 ) ) ( not ( = ?auto_169767 ?auto_169768 ) ) ( not ( = ?auto_169767 ?auto_169769 ) ) ( not ( = ?auto_169768 ?auto_169769 ) ) )
    :subtasks
    ( ( !STACK ?auto_169769 ?auto_169768 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169770 - BLOCK
      ?auto_169771 - BLOCK
      ?auto_169772 - BLOCK
      ?auto_169773 - BLOCK
      ?auto_169774 - BLOCK
    )
    :vars
    (
      ?auto_169775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169773 ) ( ON-TABLE ?auto_169770 ) ( ON ?auto_169771 ?auto_169770 ) ( ON ?auto_169772 ?auto_169771 ) ( ON ?auto_169773 ?auto_169772 ) ( not ( = ?auto_169770 ?auto_169771 ) ) ( not ( = ?auto_169770 ?auto_169772 ) ) ( not ( = ?auto_169770 ?auto_169773 ) ) ( not ( = ?auto_169770 ?auto_169774 ) ) ( not ( = ?auto_169771 ?auto_169772 ) ) ( not ( = ?auto_169771 ?auto_169773 ) ) ( not ( = ?auto_169771 ?auto_169774 ) ) ( not ( = ?auto_169772 ?auto_169773 ) ) ( not ( = ?auto_169772 ?auto_169774 ) ) ( not ( = ?auto_169773 ?auto_169774 ) ) ( ON ?auto_169774 ?auto_169775 ) ( CLEAR ?auto_169774 ) ( HAND-EMPTY ) ( not ( = ?auto_169770 ?auto_169775 ) ) ( not ( = ?auto_169771 ?auto_169775 ) ) ( not ( = ?auto_169772 ?auto_169775 ) ) ( not ( = ?auto_169773 ?auto_169775 ) ) ( not ( = ?auto_169774 ?auto_169775 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169774 ?auto_169775 )
      ( MAKE-5PILE ?auto_169770 ?auto_169771 ?auto_169772 ?auto_169773 ?auto_169774 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169776 - BLOCK
      ?auto_169777 - BLOCK
      ?auto_169778 - BLOCK
      ?auto_169779 - BLOCK
      ?auto_169780 - BLOCK
    )
    :vars
    (
      ?auto_169781 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169776 ) ( ON ?auto_169777 ?auto_169776 ) ( ON ?auto_169778 ?auto_169777 ) ( not ( = ?auto_169776 ?auto_169777 ) ) ( not ( = ?auto_169776 ?auto_169778 ) ) ( not ( = ?auto_169776 ?auto_169779 ) ) ( not ( = ?auto_169776 ?auto_169780 ) ) ( not ( = ?auto_169777 ?auto_169778 ) ) ( not ( = ?auto_169777 ?auto_169779 ) ) ( not ( = ?auto_169777 ?auto_169780 ) ) ( not ( = ?auto_169778 ?auto_169779 ) ) ( not ( = ?auto_169778 ?auto_169780 ) ) ( not ( = ?auto_169779 ?auto_169780 ) ) ( ON ?auto_169780 ?auto_169781 ) ( CLEAR ?auto_169780 ) ( not ( = ?auto_169776 ?auto_169781 ) ) ( not ( = ?auto_169777 ?auto_169781 ) ) ( not ( = ?auto_169778 ?auto_169781 ) ) ( not ( = ?auto_169779 ?auto_169781 ) ) ( not ( = ?auto_169780 ?auto_169781 ) ) ( HOLDING ?auto_169779 ) ( CLEAR ?auto_169778 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169776 ?auto_169777 ?auto_169778 ?auto_169779 )
      ( MAKE-5PILE ?auto_169776 ?auto_169777 ?auto_169778 ?auto_169779 ?auto_169780 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169782 - BLOCK
      ?auto_169783 - BLOCK
      ?auto_169784 - BLOCK
      ?auto_169785 - BLOCK
      ?auto_169786 - BLOCK
    )
    :vars
    (
      ?auto_169787 - BLOCK
      ?auto_169790 - BLOCK
      ?auto_169788 - BLOCK
      ?auto_169789 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169782 ) ( ON ?auto_169783 ?auto_169782 ) ( ON ?auto_169784 ?auto_169783 ) ( not ( = ?auto_169782 ?auto_169783 ) ) ( not ( = ?auto_169782 ?auto_169784 ) ) ( not ( = ?auto_169782 ?auto_169785 ) ) ( not ( = ?auto_169782 ?auto_169786 ) ) ( not ( = ?auto_169783 ?auto_169784 ) ) ( not ( = ?auto_169783 ?auto_169785 ) ) ( not ( = ?auto_169783 ?auto_169786 ) ) ( not ( = ?auto_169784 ?auto_169785 ) ) ( not ( = ?auto_169784 ?auto_169786 ) ) ( not ( = ?auto_169785 ?auto_169786 ) ) ( ON ?auto_169786 ?auto_169787 ) ( not ( = ?auto_169782 ?auto_169787 ) ) ( not ( = ?auto_169783 ?auto_169787 ) ) ( not ( = ?auto_169784 ?auto_169787 ) ) ( not ( = ?auto_169785 ?auto_169787 ) ) ( not ( = ?auto_169786 ?auto_169787 ) ) ( CLEAR ?auto_169784 ) ( ON ?auto_169785 ?auto_169786 ) ( CLEAR ?auto_169785 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169790 ) ( ON ?auto_169788 ?auto_169790 ) ( ON ?auto_169789 ?auto_169788 ) ( ON ?auto_169787 ?auto_169789 ) ( not ( = ?auto_169790 ?auto_169788 ) ) ( not ( = ?auto_169790 ?auto_169789 ) ) ( not ( = ?auto_169790 ?auto_169787 ) ) ( not ( = ?auto_169790 ?auto_169786 ) ) ( not ( = ?auto_169790 ?auto_169785 ) ) ( not ( = ?auto_169788 ?auto_169789 ) ) ( not ( = ?auto_169788 ?auto_169787 ) ) ( not ( = ?auto_169788 ?auto_169786 ) ) ( not ( = ?auto_169788 ?auto_169785 ) ) ( not ( = ?auto_169789 ?auto_169787 ) ) ( not ( = ?auto_169789 ?auto_169786 ) ) ( not ( = ?auto_169789 ?auto_169785 ) ) ( not ( = ?auto_169782 ?auto_169790 ) ) ( not ( = ?auto_169782 ?auto_169788 ) ) ( not ( = ?auto_169782 ?auto_169789 ) ) ( not ( = ?auto_169783 ?auto_169790 ) ) ( not ( = ?auto_169783 ?auto_169788 ) ) ( not ( = ?auto_169783 ?auto_169789 ) ) ( not ( = ?auto_169784 ?auto_169790 ) ) ( not ( = ?auto_169784 ?auto_169788 ) ) ( not ( = ?auto_169784 ?auto_169789 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169790 ?auto_169788 ?auto_169789 ?auto_169787 ?auto_169786 )
      ( MAKE-5PILE ?auto_169782 ?auto_169783 ?auto_169784 ?auto_169785 ?auto_169786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169791 - BLOCK
      ?auto_169792 - BLOCK
      ?auto_169793 - BLOCK
      ?auto_169794 - BLOCK
      ?auto_169795 - BLOCK
    )
    :vars
    (
      ?auto_169797 - BLOCK
      ?auto_169798 - BLOCK
      ?auto_169796 - BLOCK
      ?auto_169799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169791 ) ( ON ?auto_169792 ?auto_169791 ) ( not ( = ?auto_169791 ?auto_169792 ) ) ( not ( = ?auto_169791 ?auto_169793 ) ) ( not ( = ?auto_169791 ?auto_169794 ) ) ( not ( = ?auto_169791 ?auto_169795 ) ) ( not ( = ?auto_169792 ?auto_169793 ) ) ( not ( = ?auto_169792 ?auto_169794 ) ) ( not ( = ?auto_169792 ?auto_169795 ) ) ( not ( = ?auto_169793 ?auto_169794 ) ) ( not ( = ?auto_169793 ?auto_169795 ) ) ( not ( = ?auto_169794 ?auto_169795 ) ) ( ON ?auto_169795 ?auto_169797 ) ( not ( = ?auto_169791 ?auto_169797 ) ) ( not ( = ?auto_169792 ?auto_169797 ) ) ( not ( = ?auto_169793 ?auto_169797 ) ) ( not ( = ?auto_169794 ?auto_169797 ) ) ( not ( = ?auto_169795 ?auto_169797 ) ) ( ON ?auto_169794 ?auto_169795 ) ( CLEAR ?auto_169794 ) ( ON-TABLE ?auto_169798 ) ( ON ?auto_169796 ?auto_169798 ) ( ON ?auto_169799 ?auto_169796 ) ( ON ?auto_169797 ?auto_169799 ) ( not ( = ?auto_169798 ?auto_169796 ) ) ( not ( = ?auto_169798 ?auto_169799 ) ) ( not ( = ?auto_169798 ?auto_169797 ) ) ( not ( = ?auto_169798 ?auto_169795 ) ) ( not ( = ?auto_169798 ?auto_169794 ) ) ( not ( = ?auto_169796 ?auto_169799 ) ) ( not ( = ?auto_169796 ?auto_169797 ) ) ( not ( = ?auto_169796 ?auto_169795 ) ) ( not ( = ?auto_169796 ?auto_169794 ) ) ( not ( = ?auto_169799 ?auto_169797 ) ) ( not ( = ?auto_169799 ?auto_169795 ) ) ( not ( = ?auto_169799 ?auto_169794 ) ) ( not ( = ?auto_169791 ?auto_169798 ) ) ( not ( = ?auto_169791 ?auto_169796 ) ) ( not ( = ?auto_169791 ?auto_169799 ) ) ( not ( = ?auto_169792 ?auto_169798 ) ) ( not ( = ?auto_169792 ?auto_169796 ) ) ( not ( = ?auto_169792 ?auto_169799 ) ) ( not ( = ?auto_169793 ?auto_169798 ) ) ( not ( = ?auto_169793 ?auto_169796 ) ) ( not ( = ?auto_169793 ?auto_169799 ) ) ( HOLDING ?auto_169793 ) ( CLEAR ?auto_169792 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169791 ?auto_169792 ?auto_169793 )
      ( MAKE-5PILE ?auto_169791 ?auto_169792 ?auto_169793 ?auto_169794 ?auto_169795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169800 - BLOCK
      ?auto_169801 - BLOCK
      ?auto_169802 - BLOCK
      ?auto_169803 - BLOCK
      ?auto_169804 - BLOCK
    )
    :vars
    (
      ?auto_169805 - BLOCK
      ?auto_169808 - BLOCK
      ?auto_169807 - BLOCK
      ?auto_169806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169800 ) ( ON ?auto_169801 ?auto_169800 ) ( not ( = ?auto_169800 ?auto_169801 ) ) ( not ( = ?auto_169800 ?auto_169802 ) ) ( not ( = ?auto_169800 ?auto_169803 ) ) ( not ( = ?auto_169800 ?auto_169804 ) ) ( not ( = ?auto_169801 ?auto_169802 ) ) ( not ( = ?auto_169801 ?auto_169803 ) ) ( not ( = ?auto_169801 ?auto_169804 ) ) ( not ( = ?auto_169802 ?auto_169803 ) ) ( not ( = ?auto_169802 ?auto_169804 ) ) ( not ( = ?auto_169803 ?auto_169804 ) ) ( ON ?auto_169804 ?auto_169805 ) ( not ( = ?auto_169800 ?auto_169805 ) ) ( not ( = ?auto_169801 ?auto_169805 ) ) ( not ( = ?auto_169802 ?auto_169805 ) ) ( not ( = ?auto_169803 ?auto_169805 ) ) ( not ( = ?auto_169804 ?auto_169805 ) ) ( ON ?auto_169803 ?auto_169804 ) ( ON-TABLE ?auto_169808 ) ( ON ?auto_169807 ?auto_169808 ) ( ON ?auto_169806 ?auto_169807 ) ( ON ?auto_169805 ?auto_169806 ) ( not ( = ?auto_169808 ?auto_169807 ) ) ( not ( = ?auto_169808 ?auto_169806 ) ) ( not ( = ?auto_169808 ?auto_169805 ) ) ( not ( = ?auto_169808 ?auto_169804 ) ) ( not ( = ?auto_169808 ?auto_169803 ) ) ( not ( = ?auto_169807 ?auto_169806 ) ) ( not ( = ?auto_169807 ?auto_169805 ) ) ( not ( = ?auto_169807 ?auto_169804 ) ) ( not ( = ?auto_169807 ?auto_169803 ) ) ( not ( = ?auto_169806 ?auto_169805 ) ) ( not ( = ?auto_169806 ?auto_169804 ) ) ( not ( = ?auto_169806 ?auto_169803 ) ) ( not ( = ?auto_169800 ?auto_169808 ) ) ( not ( = ?auto_169800 ?auto_169807 ) ) ( not ( = ?auto_169800 ?auto_169806 ) ) ( not ( = ?auto_169801 ?auto_169808 ) ) ( not ( = ?auto_169801 ?auto_169807 ) ) ( not ( = ?auto_169801 ?auto_169806 ) ) ( not ( = ?auto_169802 ?auto_169808 ) ) ( not ( = ?auto_169802 ?auto_169807 ) ) ( not ( = ?auto_169802 ?auto_169806 ) ) ( CLEAR ?auto_169801 ) ( ON ?auto_169802 ?auto_169803 ) ( CLEAR ?auto_169802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169808 ?auto_169807 ?auto_169806 ?auto_169805 ?auto_169804 ?auto_169803 )
      ( MAKE-5PILE ?auto_169800 ?auto_169801 ?auto_169802 ?auto_169803 ?auto_169804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169809 - BLOCK
      ?auto_169810 - BLOCK
      ?auto_169811 - BLOCK
      ?auto_169812 - BLOCK
      ?auto_169813 - BLOCK
    )
    :vars
    (
      ?auto_169814 - BLOCK
      ?auto_169815 - BLOCK
      ?auto_169816 - BLOCK
      ?auto_169817 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169809 ) ( not ( = ?auto_169809 ?auto_169810 ) ) ( not ( = ?auto_169809 ?auto_169811 ) ) ( not ( = ?auto_169809 ?auto_169812 ) ) ( not ( = ?auto_169809 ?auto_169813 ) ) ( not ( = ?auto_169810 ?auto_169811 ) ) ( not ( = ?auto_169810 ?auto_169812 ) ) ( not ( = ?auto_169810 ?auto_169813 ) ) ( not ( = ?auto_169811 ?auto_169812 ) ) ( not ( = ?auto_169811 ?auto_169813 ) ) ( not ( = ?auto_169812 ?auto_169813 ) ) ( ON ?auto_169813 ?auto_169814 ) ( not ( = ?auto_169809 ?auto_169814 ) ) ( not ( = ?auto_169810 ?auto_169814 ) ) ( not ( = ?auto_169811 ?auto_169814 ) ) ( not ( = ?auto_169812 ?auto_169814 ) ) ( not ( = ?auto_169813 ?auto_169814 ) ) ( ON ?auto_169812 ?auto_169813 ) ( ON-TABLE ?auto_169815 ) ( ON ?auto_169816 ?auto_169815 ) ( ON ?auto_169817 ?auto_169816 ) ( ON ?auto_169814 ?auto_169817 ) ( not ( = ?auto_169815 ?auto_169816 ) ) ( not ( = ?auto_169815 ?auto_169817 ) ) ( not ( = ?auto_169815 ?auto_169814 ) ) ( not ( = ?auto_169815 ?auto_169813 ) ) ( not ( = ?auto_169815 ?auto_169812 ) ) ( not ( = ?auto_169816 ?auto_169817 ) ) ( not ( = ?auto_169816 ?auto_169814 ) ) ( not ( = ?auto_169816 ?auto_169813 ) ) ( not ( = ?auto_169816 ?auto_169812 ) ) ( not ( = ?auto_169817 ?auto_169814 ) ) ( not ( = ?auto_169817 ?auto_169813 ) ) ( not ( = ?auto_169817 ?auto_169812 ) ) ( not ( = ?auto_169809 ?auto_169815 ) ) ( not ( = ?auto_169809 ?auto_169816 ) ) ( not ( = ?auto_169809 ?auto_169817 ) ) ( not ( = ?auto_169810 ?auto_169815 ) ) ( not ( = ?auto_169810 ?auto_169816 ) ) ( not ( = ?auto_169810 ?auto_169817 ) ) ( not ( = ?auto_169811 ?auto_169815 ) ) ( not ( = ?auto_169811 ?auto_169816 ) ) ( not ( = ?auto_169811 ?auto_169817 ) ) ( ON ?auto_169811 ?auto_169812 ) ( CLEAR ?auto_169811 ) ( HOLDING ?auto_169810 ) ( CLEAR ?auto_169809 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169809 ?auto_169810 )
      ( MAKE-5PILE ?auto_169809 ?auto_169810 ?auto_169811 ?auto_169812 ?auto_169813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169818 - BLOCK
      ?auto_169819 - BLOCK
      ?auto_169820 - BLOCK
      ?auto_169821 - BLOCK
      ?auto_169822 - BLOCK
    )
    :vars
    (
      ?auto_169826 - BLOCK
      ?auto_169824 - BLOCK
      ?auto_169825 - BLOCK
      ?auto_169823 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169818 ) ( not ( = ?auto_169818 ?auto_169819 ) ) ( not ( = ?auto_169818 ?auto_169820 ) ) ( not ( = ?auto_169818 ?auto_169821 ) ) ( not ( = ?auto_169818 ?auto_169822 ) ) ( not ( = ?auto_169819 ?auto_169820 ) ) ( not ( = ?auto_169819 ?auto_169821 ) ) ( not ( = ?auto_169819 ?auto_169822 ) ) ( not ( = ?auto_169820 ?auto_169821 ) ) ( not ( = ?auto_169820 ?auto_169822 ) ) ( not ( = ?auto_169821 ?auto_169822 ) ) ( ON ?auto_169822 ?auto_169826 ) ( not ( = ?auto_169818 ?auto_169826 ) ) ( not ( = ?auto_169819 ?auto_169826 ) ) ( not ( = ?auto_169820 ?auto_169826 ) ) ( not ( = ?auto_169821 ?auto_169826 ) ) ( not ( = ?auto_169822 ?auto_169826 ) ) ( ON ?auto_169821 ?auto_169822 ) ( ON-TABLE ?auto_169824 ) ( ON ?auto_169825 ?auto_169824 ) ( ON ?auto_169823 ?auto_169825 ) ( ON ?auto_169826 ?auto_169823 ) ( not ( = ?auto_169824 ?auto_169825 ) ) ( not ( = ?auto_169824 ?auto_169823 ) ) ( not ( = ?auto_169824 ?auto_169826 ) ) ( not ( = ?auto_169824 ?auto_169822 ) ) ( not ( = ?auto_169824 ?auto_169821 ) ) ( not ( = ?auto_169825 ?auto_169823 ) ) ( not ( = ?auto_169825 ?auto_169826 ) ) ( not ( = ?auto_169825 ?auto_169822 ) ) ( not ( = ?auto_169825 ?auto_169821 ) ) ( not ( = ?auto_169823 ?auto_169826 ) ) ( not ( = ?auto_169823 ?auto_169822 ) ) ( not ( = ?auto_169823 ?auto_169821 ) ) ( not ( = ?auto_169818 ?auto_169824 ) ) ( not ( = ?auto_169818 ?auto_169825 ) ) ( not ( = ?auto_169818 ?auto_169823 ) ) ( not ( = ?auto_169819 ?auto_169824 ) ) ( not ( = ?auto_169819 ?auto_169825 ) ) ( not ( = ?auto_169819 ?auto_169823 ) ) ( not ( = ?auto_169820 ?auto_169824 ) ) ( not ( = ?auto_169820 ?auto_169825 ) ) ( not ( = ?auto_169820 ?auto_169823 ) ) ( ON ?auto_169820 ?auto_169821 ) ( CLEAR ?auto_169818 ) ( ON ?auto_169819 ?auto_169820 ) ( CLEAR ?auto_169819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169824 ?auto_169825 ?auto_169823 ?auto_169826 ?auto_169822 ?auto_169821 ?auto_169820 )
      ( MAKE-5PILE ?auto_169818 ?auto_169819 ?auto_169820 ?auto_169821 ?auto_169822 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169827 - BLOCK
      ?auto_169828 - BLOCK
      ?auto_169829 - BLOCK
      ?auto_169830 - BLOCK
      ?auto_169831 - BLOCK
    )
    :vars
    (
      ?auto_169833 - BLOCK
      ?auto_169834 - BLOCK
      ?auto_169832 - BLOCK
      ?auto_169835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169827 ?auto_169828 ) ) ( not ( = ?auto_169827 ?auto_169829 ) ) ( not ( = ?auto_169827 ?auto_169830 ) ) ( not ( = ?auto_169827 ?auto_169831 ) ) ( not ( = ?auto_169828 ?auto_169829 ) ) ( not ( = ?auto_169828 ?auto_169830 ) ) ( not ( = ?auto_169828 ?auto_169831 ) ) ( not ( = ?auto_169829 ?auto_169830 ) ) ( not ( = ?auto_169829 ?auto_169831 ) ) ( not ( = ?auto_169830 ?auto_169831 ) ) ( ON ?auto_169831 ?auto_169833 ) ( not ( = ?auto_169827 ?auto_169833 ) ) ( not ( = ?auto_169828 ?auto_169833 ) ) ( not ( = ?auto_169829 ?auto_169833 ) ) ( not ( = ?auto_169830 ?auto_169833 ) ) ( not ( = ?auto_169831 ?auto_169833 ) ) ( ON ?auto_169830 ?auto_169831 ) ( ON-TABLE ?auto_169834 ) ( ON ?auto_169832 ?auto_169834 ) ( ON ?auto_169835 ?auto_169832 ) ( ON ?auto_169833 ?auto_169835 ) ( not ( = ?auto_169834 ?auto_169832 ) ) ( not ( = ?auto_169834 ?auto_169835 ) ) ( not ( = ?auto_169834 ?auto_169833 ) ) ( not ( = ?auto_169834 ?auto_169831 ) ) ( not ( = ?auto_169834 ?auto_169830 ) ) ( not ( = ?auto_169832 ?auto_169835 ) ) ( not ( = ?auto_169832 ?auto_169833 ) ) ( not ( = ?auto_169832 ?auto_169831 ) ) ( not ( = ?auto_169832 ?auto_169830 ) ) ( not ( = ?auto_169835 ?auto_169833 ) ) ( not ( = ?auto_169835 ?auto_169831 ) ) ( not ( = ?auto_169835 ?auto_169830 ) ) ( not ( = ?auto_169827 ?auto_169834 ) ) ( not ( = ?auto_169827 ?auto_169832 ) ) ( not ( = ?auto_169827 ?auto_169835 ) ) ( not ( = ?auto_169828 ?auto_169834 ) ) ( not ( = ?auto_169828 ?auto_169832 ) ) ( not ( = ?auto_169828 ?auto_169835 ) ) ( not ( = ?auto_169829 ?auto_169834 ) ) ( not ( = ?auto_169829 ?auto_169832 ) ) ( not ( = ?auto_169829 ?auto_169835 ) ) ( ON ?auto_169829 ?auto_169830 ) ( ON ?auto_169828 ?auto_169829 ) ( CLEAR ?auto_169828 ) ( HOLDING ?auto_169827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169827 )
      ( MAKE-5PILE ?auto_169827 ?auto_169828 ?auto_169829 ?auto_169830 ?auto_169831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_169836 - BLOCK
      ?auto_169837 - BLOCK
      ?auto_169838 - BLOCK
      ?auto_169839 - BLOCK
      ?auto_169840 - BLOCK
    )
    :vars
    (
      ?auto_169842 - BLOCK
      ?auto_169843 - BLOCK
      ?auto_169841 - BLOCK
      ?auto_169844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169836 ?auto_169837 ) ) ( not ( = ?auto_169836 ?auto_169838 ) ) ( not ( = ?auto_169836 ?auto_169839 ) ) ( not ( = ?auto_169836 ?auto_169840 ) ) ( not ( = ?auto_169837 ?auto_169838 ) ) ( not ( = ?auto_169837 ?auto_169839 ) ) ( not ( = ?auto_169837 ?auto_169840 ) ) ( not ( = ?auto_169838 ?auto_169839 ) ) ( not ( = ?auto_169838 ?auto_169840 ) ) ( not ( = ?auto_169839 ?auto_169840 ) ) ( ON ?auto_169840 ?auto_169842 ) ( not ( = ?auto_169836 ?auto_169842 ) ) ( not ( = ?auto_169837 ?auto_169842 ) ) ( not ( = ?auto_169838 ?auto_169842 ) ) ( not ( = ?auto_169839 ?auto_169842 ) ) ( not ( = ?auto_169840 ?auto_169842 ) ) ( ON ?auto_169839 ?auto_169840 ) ( ON-TABLE ?auto_169843 ) ( ON ?auto_169841 ?auto_169843 ) ( ON ?auto_169844 ?auto_169841 ) ( ON ?auto_169842 ?auto_169844 ) ( not ( = ?auto_169843 ?auto_169841 ) ) ( not ( = ?auto_169843 ?auto_169844 ) ) ( not ( = ?auto_169843 ?auto_169842 ) ) ( not ( = ?auto_169843 ?auto_169840 ) ) ( not ( = ?auto_169843 ?auto_169839 ) ) ( not ( = ?auto_169841 ?auto_169844 ) ) ( not ( = ?auto_169841 ?auto_169842 ) ) ( not ( = ?auto_169841 ?auto_169840 ) ) ( not ( = ?auto_169841 ?auto_169839 ) ) ( not ( = ?auto_169844 ?auto_169842 ) ) ( not ( = ?auto_169844 ?auto_169840 ) ) ( not ( = ?auto_169844 ?auto_169839 ) ) ( not ( = ?auto_169836 ?auto_169843 ) ) ( not ( = ?auto_169836 ?auto_169841 ) ) ( not ( = ?auto_169836 ?auto_169844 ) ) ( not ( = ?auto_169837 ?auto_169843 ) ) ( not ( = ?auto_169837 ?auto_169841 ) ) ( not ( = ?auto_169837 ?auto_169844 ) ) ( not ( = ?auto_169838 ?auto_169843 ) ) ( not ( = ?auto_169838 ?auto_169841 ) ) ( not ( = ?auto_169838 ?auto_169844 ) ) ( ON ?auto_169838 ?auto_169839 ) ( ON ?auto_169837 ?auto_169838 ) ( ON ?auto_169836 ?auto_169837 ) ( CLEAR ?auto_169836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169843 ?auto_169841 ?auto_169844 ?auto_169842 ?auto_169840 ?auto_169839 ?auto_169838 ?auto_169837 )
      ( MAKE-5PILE ?auto_169836 ?auto_169837 ?auto_169838 ?auto_169839 ?auto_169840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169848 - BLOCK
      ?auto_169849 - BLOCK
      ?auto_169850 - BLOCK
    )
    :vars
    (
      ?auto_169851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169851 ?auto_169850 ) ( CLEAR ?auto_169851 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169848 ) ( ON ?auto_169849 ?auto_169848 ) ( ON ?auto_169850 ?auto_169849 ) ( not ( = ?auto_169848 ?auto_169849 ) ) ( not ( = ?auto_169848 ?auto_169850 ) ) ( not ( = ?auto_169848 ?auto_169851 ) ) ( not ( = ?auto_169849 ?auto_169850 ) ) ( not ( = ?auto_169849 ?auto_169851 ) ) ( not ( = ?auto_169850 ?auto_169851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169851 ?auto_169850 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169852 - BLOCK
      ?auto_169853 - BLOCK
      ?auto_169854 - BLOCK
    )
    :vars
    (
      ?auto_169855 - BLOCK
      ?auto_169856 - BLOCK
      ?auto_169857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169855 ?auto_169854 ) ( CLEAR ?auto_169855 ) ( ON-TABLE ?auto_169852 ) ( ON ?auto_169853 ?auto_169852 ) ( ON ?auto_169854 ?auto_169853 ) ( not ( = ?auto_169852 ?auto_169853 ) ) ( not ( = ?auto_169852 ?auto_169854 ) ) ( not ( = ?auto_169852 ?auto_169855 ) ) ( not ( = ?auto_169853 ?auto_169854 ) ) ( not ( = ?auto_169853 ?auto_169855 ) ) ( not ( = ?auto_169854 ?auto_169855 ) ) ( HOLDING ?auto_169856 ) ( CLEAR ?auto_169857 ) ( not ( = ?auto_169852 ?auto_169856 ) ) ( not ( = ?auto_169852 ?auto_169857 ) ) ( not ( = ?auto_169853 ?auto_169856 ) ) ( not ( = ?auto_169853 ?auto_169857 ) ) ( not ( = ?auto_169854 ?auto_169856 ) ) ( not ( = ?auto_169854 ?auto_169857 ) ) ( not ( = ?auto_169855 ?auto_169856 ) ) ( not ( = ?auto_169855 ?auto_169857 ) ) ( not ( = ?auto_169856 ?auto_169857 ) ) )
    :subtasks
    ( ( !STACK ?auto_169856 ?auto_169857 )
      ( MAKE-3PILE ?auto_169852 ?auto_169853 ?auto_169854 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169858 - BLOCK
      ?auto_169859 - BLOCK
      ?auto_169860 - BLOCK
    )
    :vars
    (
      ?auto_169863 - BLOCK
      ?auto_169861 - BLOCK
      ?auto_169862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169863 ?auto_169860 ) ( ON-TABLE ?auto_169858 ) ( ON ?auto_169859 ?auto_169858 ) ( ON ?auto_169860 ?auto_169859 ) ( not ( = ?auto_169858 ?auto_169859 ) ) ( not ( = ?auto_169858 ?auto_169860 ) ) ( not ( = ?auto_169858 ?auto_169863 ) ) ( not ( = ?auto_169859 ?auto_169860 ) ) ( not ( = ?auto_169859 ?auto_169863 ) ) ( not ( = ?auto_169860 ?auto_169863 ) ) ( CLEAR ?auto_169861 ) ( not ( = ?auto_169858 ?auto_169862 ) ) ( not ( = ?auto_169858 ?auto_169861 ) ) ( not ( = ?auto_169859 ?auto_169862 ) ) ( not ( = ?auto_169859 ?auto_169861 ) ) ( not ( = ?auto_169860 ?auto_169862 ) ) ( not ( = ?auto_169860 ?auto_169861 ) ) ( not ( = ?auto_169863 ?auto_169862 ) ) ( not ( = ?auto_169863 ?auto_169861 ) ) ( not ( = ?auto_169862 ?auto_169861 ) ) ( ON ?auto_169862 ?auto_169863 ) ( CLEAR ?auto_169862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169858 ?auto_169859 ?auto_169860 ?auto_169863 )
      ( MAKE-3PILE ?auto_169858 ?auto_169859 ?auto_169860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169864 - BLOCK
      ?auto_169865 - BLOCK
      ?auto_169866 - BLOCK
    )
    :vars
    (
      ?auto_169869 - BLOCK
      ?auto_169868 - BLOCK
      ?auto_169867 - BLOCK
      ?auto_169872 - BLOCK
      ?auto_169870 - BLOCK
      ?auto_169871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169869 ?auto_169866 ) ( ON-TABLE ?auto_169864 ) ( ON ?auto_169865 ?auto_169864 ) ( ON ?auto_169866 ?auto_169865 ) ( not ( = ?auto_169864 ?auto_169865 ) ) ( not ( = ?auto_169864 ?auto_169866 ) ) ( not ( = ?auto_169864 ?auto_169869 ) ) ( not ( = ?auto_169865 ?auto_169866 ) ) ( not ( = ?auto_169865 ?auto_169869 ) ) ( not ( = ?auto_169866 ?auto_169869 ) ) ( not ( = ?auto_169864 ?auto_169868 ) ) ( not ( = ?auto_169864 ?auto_169867 ) ) ( not ( = ?auto_169865 ?auto_169868 ) ) ( not ( = ?auto_169865 ?auto_169867 ) ) ( not ( = ?auto_169866 ?auto_169868 ) ) ( not ( = ?auto_169866 ?auto_169867 ) ) ( not ( = ?auto_169869 ?auto_169868 ) ) ( not ( = ?auto_169869 ?auto_169867 ) ) ( not ( = ?auto_169868 ?auto_169867 ) ) ( ON ?auto_169868 ?auto_169869 ) ( CLEAR ?auto_169868 ) ( HOLDING ?auto_169867 ) ( CLEAR ?auto_169872 ) ( ON-TABLE ?auto_169870 ) ( ON ?auto_169871 ?auto_169870 ) ( ON ?auto_169872 ?auto_169871 ) ( not ( = ?auto_169870 ?auto_169871 ) ) ( not ( = ?auto_169870 ?auto_169872 ) ) ( not ( = ?auto_169870 ?auto_169867 ) ) ( not ( = ?auto_169871 ?auto_169872 ) ) ( not ( = ?auto_169871 ?auto_169867 ) ) ( not ( = ?auto_169872 ?auto_169867 ) ) ( not ( = ?auto_169864 ?auto_169872 ) ) ( not ( = ?auto_169864 ?auto_169870 ) ) ( not ( = ?auto_169864 ?auto_169871 ) ) ( not ( = ?auto_169865 ?auto_169872 ) ) ( not ( = ?auto_169865 ?auto_169870 ) ) ( not ( = ?auto_169865 ?auto_169871 ) ) ( not ( = ?auto_169866 ?auto_169872 ) ) ( not ( = ?auto_169866 ?auto_169870 ) ) ( not ( = ?auto_169866 ?auto_169871 ) ) ( not ( = ?auto_169869 ?auto_169872 ) ) ( not ( = ?auto_169869 ?auto_169870 ) ) ( not ( = ?auto_169869 ?auto_169871 ) ) ( not ( = ?auto_169868 ?auto_169872 ) ) ( not ( = ?auto_169868 ?auto_169870 ) ) ( not ( = ?auto_169868 ?auto_169871 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169870 ?auto_169871 ?auto_169872 ?auto_169867 )
      ( MAKE-3PILE ?auto_169864 ?auto_169865 ?auto_169866 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169873 - BLOCK
      ?auto_169874 - BLOCK
      ?auto_169875 - BLOCK
    )
    :vars
    (
      ?auto_169879 - BLOCK
      ?auto_169881 - BLOCK
      ?auto_169876 - BLOCK
      ?auto_169880 - BLOCK
      ?auto_169877 - BLOCK
      ?auto_169878 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169879 ?auto_169875 ) ( ON-TABLE ?auto_169873 ) ( ON ?auto_169874 ?auto_169873 ) ( ON ?auto_169875 ?auto_169874 ) ( not ( = ?auto_169873 ?auto_169874 ) ) ( not ( = ?auto_169873 ?auto_169875 ) ) ( not ( = ?auto_169873 ?auto_169879 ) ) ( not ( = ?auto_169874 ?auto_169875 ) ) ( not ( = ?auto_169874 ?auto_169879 ) ) ( not ( = ?auto_169875 ?auto_169879 ) ) ( not ( = ?auto_169873 ?auto_169881 ) ) ( not ( = ?auto_169873 ?auto_169876 ) ) ( not ( = ?auto_169874 ?auto_169881 ) ) ( not ( = ?auto_169874 ?auto_169876 ) ) ( not ( = ?auto_169875 ?auto_169881 ) ) ( not ( = ?auto_169875 ?auto_169876 ) ) ( not ( = ?auto_169879 ?auto_169881 ) ) ( not ( = ?auto_169879 ?auto_169876 ) ) ( not ( = ?auto_169881 ?auto_169876 ) ) ( ON ?auto_169881 ?auto_169879 ) ( CLEAR ?auto_169880 ) ( ON-TABLE ?auto_169877 ) ( ON ?auto_169878 ?auto_169877 ) ( ON ?auto_169880 ?auto_169878 ) ( not ( = ?auto_169877 ?auto_169878 ) ) ( not ( = ?auto_169877 ?auto_169880 ) ) ( not ( = ?auto_169877 ?auto_169876 ) ) ( not ( = ?auto_169878 ?auto_169880 ) ) ( not ( = ?auto_169878 ?auto_169876 ) ) ( not ( = ?auto_169880 ?auto_169876 ) ) ( not ( = ?auto_169873 ?auto_169880 ) ) ( not ( = ?auto_169873 ?auto_169877 ) ) ( not ( = ?auto_169873 ?auto_169878 ) ) ( not ( = ?auto_169874 ?auto_169880 ) ) ( not ( = ?auto_169874 ?auto_169877 ) ) ( not ( = ?auto_169874 ?auto_169878 ) ) ( not ( = ?auto_169875 ?auto_169880 ) ) ( not ( = ?auto_169875 ?auto_169877 ) ) ( not ( = ?auto_169875 ?auto_169878 ) ) ( not ( = ?auto_169879 ?auto_169880 ) ) ( not ( = ?auto_169879 ?auto_169877 ) ) ( not ( = ?auto_169879 ?auto_169878 ) ) ( not ( = ?auto_169881 ?auto_169880 ) ) ( not ( = ?auto_169881 ?auto_169877 ) ) ( not ( = ?auto_169881 ?auto_169878 ) ) ( ON ?auto_169876 ?auto_169881 ) ( CLEAR ?auto_169876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169873 ?auto_169874 ?auto_169875 ?auto_169879 ?auto_169881 )
      ( MAKE-3PILE ?auto_169873 ?auto_169874 ?auto_169875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169882 - BLOCK
      ?auto_169883 - BLOCK
      ?auto_169884 - BLOCK
    )
    :vars
    (
      ?auto_169885 - BLOCK
      ?auto_169890 - BLOCK
      ?auto_169886 - BLOCK
      ?auto_169887 - BLOCK
      ?auto_169888 - BLOCK
      ?auto_169889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169885 ?auto_169884 ) ( ON-TABLE ?auto_169882 ) ( ON ?auto_169883 ?auto_169882 ) ( ON ?auto_169884 ?auto_169883 ) ( not ( = ?auto_169882 ?auto_169883 ) ) ( not ( = ?auto_169882 ?auto_169884 ) ) ( not ( = ?auto_169882 ?auto_169885 ) ) ( not ( = ?auto_169883 ?auto_169884 ) ) ( not ( = ?auto_169883 ?auto_169885 ) ) ( not ( = ?auto_169884 ?auto_169885 ) ) ( not ( = ?auto_169882 ?auto_169890 ) ) ( not ( = ?auto_169882 ?auto_169886 ) ) ( not ( = ?auto_169883 ?auto_169890 ) ) ( not ( = ?auto_169883 ?auto_169886 ) ) ( not ( = ?auto_169884 ?auto_169890 ) ) ( not ( = ?auto_169884 ?auto_169886 ) ) ( not ( = ?auto_169885 ?auto_169890 ) ) ( not ( = ?auto_169885 ?auto_169886 ) ) ( not ( = ?auto_169890 ?auto_169886 ) ) ( ON ?auto_169890 ?auto_169885 ) ( ON-TABLE ?auto_169887 ) ( ON ?auto_169888 ?auto_169887 ) ( not ( = ?auto_169887 ?auto_169888 ) ) ( not ( = ?auto_169887 ?auto_169889 ) ) ( not ( = ?auto_169887 ?auto_169886 ) ) ( not ( = ?auto_169888 ?auto_169889 ) ) ( not ( = ?auto_169888 ?auto_169886 ) ) ( not ( = ?auto_169889 ?auto_169886 ) ) ( not ( = ?auto_169882 ?auto_169889 ) ) ( not ( = ?auto_169882 ?auto_169887 ) ) ( not ( = ?auto_169882 ?auto_169888 ) ) ( not ( = ?auto_169883 ?auto_169889 ) ) ( not ( = ?auto_169883 ?auto_169887 ) ) ( not ( = ?auto_169883 ?auto_169888 ) ) ( not ( = ?auto_169884 ?auto_169889 ) ) ( not ( = ?auto_169884 ?auto_169887 ) ) ( not ( = ?auto_169884 ?auto_169888 ) ) ( not ( = ?auto_169885 ?auto_169889 ) ) ( not ( = ?auto_169885 ?auto_169887 ) ) ( not ( = ?auto_169885 ?auto_169888 ) ) ( not ( = ?auto_169890 ?auto_169889 ) ) ( not ( = ?auto_169890 ?auto_169887 ) ) ( not ( = ?auto_169890 ?auto_169888 ) ) ( ON ?auto_169886 ?auto_169890 ) ( CLEAR ?auto_169886 ) ( HOLDING ?auto_169889 ) ( CLEAR ?auto_169888 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169887 ?auto_169888 ?auto_169889 )
      ( MAKE-3PILE ?auto_169882 ?auto_169883 ?auto_169884 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169891 - BLOCK
      ?auto_169892 - BLOCK
      ?auto_169893 - BLOCK
    )
    :vars
    (
      ?auto_169899 - BLOCK
      ?auto_169894 - BLOCK
      ?auto_169898 - BLOCK
      ?auto_169897 - BLOCK
      ?auto_169895 - BLOCK
      ?auto_169896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169899 ?auto_169893 ) ( ON-TABLE ?auto_169891 ) ( ON ?auto_169892 ?auto_169891 ) ( ON ?auto_169893 ?auto_169892 ) ( not ( = ?auto_169891 ?auto_169892 ) ) ( not ( = ?auto_169891 ?auto_169893 ) ) ( not ( = ?auto_169891 ?auto_169899 ) ) ( not ( = ?auto_169892 ?auto_169893 ) ) ( not ( = ?auto_169892 ?auto_169899 ) ) ( not ( = ?auto_169893 ?auto_169899 ) ) ( not ( = ?auto_169891 ?auto_169894 ) ) ( not ( = ?auto_169891 ?auto_169898 ) ) ( not ( = ?auto_169892 ?auto_169894 ) ) ( not ( = ?auto_169892 ?auto_169898 ) ) ( not ( = ?auto_169893 ?auto_169894 ) ) ( not ( = ?auto_169893 ?auto_169898 ) ) ( not ( = ?auto_169899 ?auto_169894 ) ) ( not ( = ?auto_169899 ?auto_169898 ) ) ( not ( = ?auto_169894 ?auto_169898 ) ) ( ON ?auto_169894 ?auto_169899 ) ( ON-TABLE ?auto_169897 ) ( ON ?auto_169895 ?auto_169897 ) ( not ( = ?auto_169897 ?auto_169895 ) ) ( not ( = ?auto_169897 ?auto_169896 ) ) ( not ( = ?auto_169897 ?auto_169898 ) ) ( not ( = ?auto_169895 ?auto_169896 ) ) ( not ( = ?auto_169895 ?auto_169898 ) ) ( not ( = ?auto_169896 ?auto_169898 ) ) ( not ( = ?auto_169891 ?auto_169896 ) ) ( not ( = ?auto_169891 ?auto_169897 ) ) ( not ( = ?auto_169891 ?auto_169895 ) ) ( not ( = ?auto_169892 ?auto_169896 ) ) ( not ( = ?auto_169892 ?auto_169897 ) ) ( not ( = ?auto_169892 ?auto_169895 ) ) ( not ( = ?auto_169893 ?auto_169896 ) ) ( not ( = ?auto_169893 ?auto_169897 ) ) ( not ( = ?auto_169893 ?auto_169895 ) ) ( not ( = ?auto_169899 ?auto_169896 ) ) ( not ( = ?auto_169899 ?auto_169897 ) ) ( not ( = ?auto_169899 ?auto_169895 ) ) ( not ( = ?auto_169894 ?auto_169896 ) ) ( not ( = ?auto_169894 ?auto_169897 ) ) ( not ( = ?auto_169894 ?auto_169895 ) ) ( ON ?auto_169898 ?auto_169894 ) ( CLEAR ?auto_169895 ) ( ON ?auto_169896 ?auto_169898 ) ( CLEAR ?auto_169896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169891 ?auto_169892 ?auto_169893 ?auto_169899 ?auto_169894 ?auto_169898 )
      ( MAKE-3PILE ?auto_169891 ?auto_169892 ?auto_169893 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169900 - BLOCK
      ?auto_169901 - BLOCK
      ?auto_169902 - BLOCK
    )
    :vars
    (
      ?auto_169907 - BLOCK
      ?auto_169903 - BLOCK
      ?auto_169908 - BLOCK
      ?auto_169905 - BLOCK
      ?auto_169904 - BLOCK
      ?auto_169906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169907 ?auto_169902 ) ( ON-TABLE ?auto_169900 ) ( ON ?auto_169901 ?auto_169900 ) ( ON ?auto_169902 ?auto_169901 ) ( not ( = ?auto_169900 ?auto_169901 ) ) ( not ( = ?auto_169900 ?auto_169902 ) ) ( not ( = ?auto_169900 ?auto_169907 ) ) ( not ( = ?auto_169901 ?auto_169902 ) ) ( not ( = ?auto_169901 ?auto_169907 ) ) ( not ( = ?auto_169902 ?auto_169907 ) ) ( not ( = ?auto_169900 ?auto_169903 ) ) ( not ( = ?auto_169900 ?auto_169908 ) ) ( not ( = ?auto_169901 ?auto_169903 ) ) ( not ( = ?auto_169901 ?auto_169908 ) ) ( not ( = ?auto_169902 ?auto_169903 ) ) ( not ( = ?auto_169902 ?auto_169908 ) ) ( not ( = ?auto_169907 ?auto_169903 ) ) ( not ( = ?auto_169907 ?auto_169908 ) ) ( not ( = ?auto_169903 ?auto_169908 ) ) ( ON ?auto_169903 ?auto_169907 ) ( ON-TABLE ?auto_169905 ) ( not ( = ?auto_169905 ?auto_169904 ) ) ( not ( = ?auto_169905 ?auto_169906 ) ) ( not ( = ?auto_169905 ?auto_169908 ) ) ( not ( = ?auto_169904 ?auto_169906 ) ) ( not ( = ?auto_169904 ?auto_169908 ) ) ( not ( = ?auto_169906 ?auto_169908 ) ) ( not ( = ?auto_169900 ?auto_169906 ) ) ( not ( = ?auto_169900 ?auto_169905 ) ) ( not ( = ?auto_169900 ?auto_169904 ) ) ( not ( = ?auto_169901 ?auto_169906 ) ) ( not ( = ?auto_169901 ?auto_169905 ) ) ( not ( = ?auto_169901 ?auto_169904 ) ) ( not ( = ?auto_169902 ?auto_169906 ) ) ( not ( = ?auto_169902 ?auto_169905 ) ) ( not ( = ?auto_169902 ?auto_169904 ) ) ( not ( = ?auto_169907 ?auto_169906 ) ) ( not ( = ?auto_169907 ?auto_169905 ) ) ( not ( = ?auto_169907 ?auto_169904 ) ) ( not ( = ?auto_169903 ?auto_169906 ) ) ( not ( = ?auto_169903 ?auto_169905 ) ) ( not ( = ?auto_169903 ?auto_169904 ) ) ( ON ?auto_169908 ?auto_169903 ) ( ON ?auto_169906 ?auto_169908 ) ( CLEAR ?auto_169906 ) ( HOLDING ?auto_169904 ) ( CLEAR ?auto_169905 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169905 ?auto_169904 )
      ( MAKE-3PILE ?auto_169900 ?auto_169901 ?auto_169902 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171767 - BLOCK
      ?auto_171768 - BLOCK
      ?auto_171769 - BLOCK
    )
    :vars
    (
      ?auto_171772 - BLOCK
      ?auto_171773 - BLOCK
      ?auto_171771 - BLOCK
      ?auto_171770 - BLOCK
      ?auto_171774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171772 ?auto_171769 ) ( ON-TABLE ?auto_171767 ) ( ON ?auto_171768 ?auto_171767 ) ( ON ?auto_171769 ?auto_171768 ) ( not ( = ?auto_171767 ?auto_171768 ) ) ( not ( = ?auto_171767 ?auto_171769 ) ) ( not ( = ?auto_171767 ?auto_171772 ) ) ( not ( = ?auto_171768 ?auto_171769 ) ) ( not ( = ?auto_171768 ?auto_171772 ) ) ( not ( = ?auto_171769 ?auto_171772 ) ) ( not ( = ?auto_171767 ?auto_171773 ) ) ( not ( = ?auto_171767 ?auto_171771 ) ) ( not ( = ?auto_171768 ?auto_171773 ) ) ( not ( = ?auto_171768 ?auto_171771 ) ) ( not ( = ?auto_171769 ?auto_171773 ) ) ( not ( = ?auto_171769 ?auto_171771 ) ) ( not ( = ?auto_171772 ?auto_171773 ) ) ( not ( = ?auto_171772 ?auto_171771 ) ) ( not ( = ?auto_171773 ?auto_171771 ) ) ( ON ?auto_171773 ?auto_171772 ) ( not ( = ?auto_171770 ?auto_171774 ) ) ( not ( = ?auto_171770 ?auto_171771 ) ) ( not ( = ?auto_171774 ?auto_171771 ) ) ( not ( = ?auto_171767 ?auto_171774 ) ) ( not ( = ?auto_171767 ?auto_171770 ) ) ( not ( = ?auto_171768 ?auto_171774 ) ) ( not ( = ?auto_171768 ?auto_171770 ) ) ( not ( = ?auto_171769 ?auto_171774 ) ) ( not ( = ?auto_171769 ?auto_171770 ) ) ( not ( = ?auto_171772 ?auto_171774 ) ) ( not ( = ?auto_171772 ?auto_171770 ) ) ( not ( = ?auto_171773 ?auto_171774 ) ) ( not ( = ?auto_171773 ?auto_171770 ) ) ( ON ?auto_171771 ?auto_171773 ) ( ON ?auto_171774 ?auto_171771 ) ( ON ?auto_171770 ?auto_171774 ) ( CLEAR ?auto_171770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171767 ?auto_171768 ?auto_171769 ?auto_171772 ?auto_171773 ?auto_171771 ?auto_171774 )
      ( MAKE-3PILE ?auto_171767 ?auto_171768 ?auto_171769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169918 - BLOCK
      ?auto_169919 - BLOCK
      ?auto_169920 - BLOCK
    )
    :vars
    (
      ?auto_169924 - BLOCK
      ?auto_169923 - BLOCK
      ?auto_169921 - BLOCK
      ?auto_169922 - BLOCK
      ?auto_169926 - BLOCK
      ?auto_169925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169924 ?auto_169920 ) ( ON-TABLE ?auto_169918 ) ( ON ?auto_169919 ?auto_169918 ) ( ON ?auto_169920 ?auto_169919 ) ( not ( = ?auto_169918 ?auto_169919 ) ) ( not ( = ?auto_169918 ?auto_169920 ) ) ( not ( = ?auto_169918 ?auto_169924 ) ) ( not ( = ?auto_169919 ?auto_169920 ) ) ( not ( = ?auto_169919 ?auto_169924 ) ) ( not ( = ?auto_169920 ?auto_169924 ) ) ( not ( = ?auto_169918 ?auto_169923 ) ) ( not ( = ?auto_169918 ?auto_169921 ) ) ( not ( = ?auto_169919 ?auto_169923 ) ) ( not ( = ?auto_169919 ?auto_169921 ) ) ( not ( = ?auto_169920 ?auto_169923 ) ) ( not ( = ?auto_169920 ?auto_169921 ) ) ( not ( = ?auto_169924 ?auto_169923 ) ) ( not ( = ?auto_169924 ?auto_169921 ) ) ( not ( = ?auto_169923 ?auto_169921 ) ) ( ON ?auto_169923 ?auto_169924 ) ( not ( = ?auto_169922 ?auto_169926 ) ) ( not ( = ?auto_169922 ?auto_169925 ) ) ( not ( = ?auto_169922 ?auto_169921 ) ) ( not ( = ?auto_169926 ?auto_169925 ) ) ( not ( = ?auto_169926 ?auto_169921 ) ) ( not ( = ?auto_169925 ?auto_169921 ) ) ( not ( = ?auto_169918 ?auto_169925 ) ) ( not ( = ?auto_169918 ?auto_169922 ) ) ( not ( = ?auto_169918 ?auto_169926 ) ) ( not ( = ?auto_169919 ?auto_169925 ) ) ( not ( = ?auto_169919 ?auto_169922 ) ) ( not ( = ?auto_169919 ?auto_169926 ) ) ( not ( = ?auto_169920 ?auto_169925 ) ) ( not ( = ?auto_169920 ?auto_169922 ) ) ( not ( = ?auto_169920 ?auto_169926 ) ) ( not ( = ?auto_169924 ?auto_169925 ) ) ( not ( = ?auto_169924 ?auto_169922 ) ) ( not ( = ?auto_169924 ?auto_169926 ) ) ( not ( = ?auto_169923 ?auto_169925 ) ) ( not ( = ?auto_169923 ?auto_169922 ) ) ( not ( = ?auto_169923 ?auto_169926 ) ) ( ON ?auto_169921 ?auto_169923 ) ( ON ?auto_169925 ?auto_169921 ) ( ON ?auto_169926 ?auto_169925 ) ( CLEAR ?auto_169926 ) ( HOLDING ?auto_169922 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169922 )
      ( MAKE-3PILE ?auto_169918 ?auto_169919 ?auto_169920 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_169927 - BLOCK
      ?auto_169928 - BLOCK
      ?auto_169929 - BLOCK
    )
    :vars
    (
      ?auto_169934 - BLOCK
      ?auto_169933 - BLOCK
      ?auto_169932 - BLOCK
      ?auto_169935 - BLOCK
      ?auto_169930 - BLOCK
      ?auto_169931 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169934 ?auto_169929 ) ( ON-TABLE ?auto_169927 ) ( ON ?auto_169928 ?auto_169927 ) ( ON ?auto_169929 ?auto_169928 ) ( not ( = ?auto_169927 ?auto_169928 ) ) ( not ( = ?auto_169927 ?auto_169929 ) ) ( not ( = ?auto_169927 ?auto_169934 ) ) ( not ( = ?auto_169928 ?auto_169929 ) ) ( not ( = ?auto_169928 ?auto_169934 ) ) ( not ( = ?auto_169929 ?auto_169934 ) ) ( not ( = ?auto_169927 ?auto_169933 ) ) ( not ( = ?auto_169927 ?auto_169932 ) ) ( not ( = ?auto_169928 ?auto_169933 ) ) ( not ( = ?auto_169928 ?auto_169932 ) ) ( not ( = ?auto_169929 ?auto_169933 ) ) ( not ( = ?auto_169929 ?auto_169932 ) ) ( not ( = ?auto_169934 ?auto_169933 ) ) ( not ( = ?auto_169934 ?auto_169932 ) ) ( not ( = ?auto_169933 ?auto_169932 ) ) ( ON ?auto_169933 ?auto_169934 ) ( not ( = ?auto_169935 ?auto_169930 ) ) ( not ( = ?auto_169935 ?auto_169931 ) ) ( not ( = ?auto_169935 ?auto_169932 ) ) ( not ( = ?auto_169930 ?auto_169931 ) ) ( not ( = ?auto_169930 ?auto_169932 ) ) ( not ( = ?auto_169931 ?auto_169932 ) ) ( not ( = ?auto_169927 ?auto_169931 ) ) ( not ( = ?auto_169927 ?auto_169935 ) ) ( not ( = ?auto_169927 ?auto_169930 ) ) ( not ( = ?auto_169928 ?auto_169931 ) ) ( not ( = ?auto_169928 ?auto_169935 ) ) ( not ( = ?auto_169928 ?auto_169930 ) ) ( not ( = ?auto_169929 ?auto_169931 ) ) ( not ( = ?auto_169929 ?auto_169935 ) ) ( not ( = ?auto_169929 ?auto_169930 ) ) ( not ( = ?auto_169934 ?auto_169931 ) ) ( not ( = ?auto_169934 ?auto_169935 ) ) ( not ( = ?auto_169934 ?auto_169930 ) ) ( not ( = ?auto_169933 ?auto_169931 ) ) ( not ( = ?auto_169933 ?auto_169935 ) ) ( not ( = ?auto_169933 ?auto_169930 ) ) ( ON ?auto_169932 ?auto_169933 ) ( ON ?auto_169931 ?auto_169932 ) ( ON ?auto_169930 ?auto_169931 ) ( ON ?auto_169935 ?auto_169930 ) ( CLEAR ?auto_169935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169927 ?auto_169928 ?auto_169929 ?auto_169934 ?auto_169933 ?auto_169932 ?auto_169931 ?auto_169930 )
      ( MAKE-3PILE ?auto_169927 ?auto_169928 ?auto_169929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169942 - BLOCK
      ?auto_169943 - BLOCK
      ?auto_169944 - BLOCK
      ?auto_169945 - BLOCK
      ?auto_169946 - BLOCK
      ?auto_169947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_169947 ) ( CLEAR ?auto_169946 ) ( ON-TABLE ?auto_169942 ) ( ON ?auto_169943 ?auto_169942 ) ( ON ?auto_169944 ?auto_169943 ) ( ON ?auto_169945 ?auto_169944 ) ( ON ?auto_169946 ?auto_169945 ) ( not ( = ?auto_169942 ?auto_169943 ) ) ( not ( = ?auto_169942 ?auto_169944 ) ) ( not ( = ?auto_169942 ?auto_169945 ) ) ( not ( = ?auto_169942 ?auto_169946 ) ) ( not ( = ?auto_169942 ?auto_169947 ) ) ( not ( = ?auto_169943 ?auto_169944 ) ) ( not ( = ?auto_169943 ?auto_169945 ) ) ( not ( = ?auto_169943 ?auto_169946 ) ) ( not ( = ?auto_169943 ?auto_169947 ) ) ( not ( = ?auto_169944 ?auto_169945 ) ) ( not ( = ?auto_169944 ?auto_169946 ) ) ( not ( = ?auto_169944 ?auto_169947 ) ) ( not ( = ?auto_169945 ?auto_169946 ) ) ( not ( = ?auto_169945 ?auto_169947 ) ) ( not ( = ?auto_169946 ?auto_169947 ) ) )
    :subtasks
    ( ( !STACK ?auto_169947 ?auto_169946 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169948 - BLOCK
      ?auto_169949 - BLOCK
      ?auto_169950 - BLOCK
      ?auto_169951 - BLOCK
      ?auto_169952 - BLOCK
      ?auto_169953 - BLOCK
    )
    :vars
    (
      ?auto_169954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_169952 ) ( ON-TABLE ?auto_169948 ) ( ON ?auto_169949 ?auto_169948 ) ( ON ?auto_169950 ?auto_169949 ) ( ON ?auto_169951 ?auto_169950 ) ( ON ?auto_169952 ?auto_169951 ) ( not ( = ?auto_169948 ?auto_169949 ) ) ( not ( = ?auto_169948 ?auto_169950 ) ) ( not ( = ?auto_169948 ?auto_169951 ) ) ( not ( = ?auto_169948 ?auto_169952 ) ) ( not ( = ?auto_169948 ?auto_169953 ) ) ( not ( = ?auto_169949 ?auto_169950 ) ) ( not ( = ?auto_169949 ?auto_169951 ) ) ( not ( = ?auto_169949 ?auto_169952 ) ) ( not ( = ?auto_169949 ?auto_169953 ) ) ( not ( = ?auto_169950 ?auto_169951 ) ) ( not ( = ?auto_169950 ?auto_169952 ) ) ( not ( = ?auto_169950 ?auto_169953 ) ) ( not ( = ?auto_169951 ?auto_169952 ) ) ( not ( = ?auto_169951 ?auto_169953 ) ) ( not ( = ?auto_169952 ?auto_169953 ) ) ( ON ?auto_169953 ?auto_169954 ) ( CLEAR ?auto_169953 ) ( HAND-EMPTY ) ( not ( = ?auto_169948 ?auto_169954 ) ) ( not ( = ?auto_169949 ?auto_169954 ) ) ( not ( = ?auto_169950 ?auto_169954 ) ) ( not ( = ?auto_169951 ?auto_169954 ) ) ( not ( = ?auto_169952 ?auto_169954 ) ) ( not ( = ?auto_169953 ?auto_169954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169953 ?auto_169954 )
      ( MAKE-6PILE ?auto_169948 ?auto_169949 ?auto_169950 ?auto_169951 ?auto_169952 ?auto_169953 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169955 - BLOCK
      ?auto_169956 - BLOCK
      ?auto_169957 - BLOCK
      ?auto_169958 - BLOCK
      ?auto_169959 - BLOCK
      ?auto_169960 - BLOCK
    )
    :vars
    (
      ?auto_169961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169955 ) ( ON ?auto_169956 ?auto_169955 ) ( ON ?auto_169957 ?auto_169956 ) ( ON ?auto_169958 ?auto_169957 ) ( not ( = ?auto_169955 ?auto_169956 ) ) ( not ( = ?auto_169955 ?auto_169957 ) ) ( not ( = ?auto_169955 ?auto_169958 ) ) ( not ( = ?auto_169955 ?auto_169959 ) ) ( not ( = ?auto_169955 ?auto_169960 ) ) ( not ( = ?auto_169956 ?auto_169957 ) ) ( not ( = ?auto_169956 ?auto_169958 ) ) ( not ( = ?auto_169956 ?auto_169959 ) ) ( not ( = ?auto_169956 ?auto_169960 ) ) ( not ( = ?auto_169957 ?auto_169958 ) ) ( not ( = ?auto_169957 ?auto_169959 ) ) ( not ( = ?auto_169957 ?auto_169960 ) ) ( not ( = ?auto_169958 ?auto_169959 ) ) ( not ( = ?auto_169958 ?auto_169960 ) ) ( not ( = ?auto_169959 ?auto_169960 ) ) ( ON ?auto_169960 ?auto_169961 ) ( CLEAR ?auto_169960 ) ( not ( = ?auto_169955 ?auto_169961 ) ) ( not ( = ?auto_169956 ?auto_169961 ) ) ( not ( = ?auto_169957 ?auto_169961 ) ) ( not ( = ?auto_169958 ?auto_169961 ) ) ( not ( = ?auto_169959 ?auto_169961 ) ) ( not ( = ?auto_169960 ?auto_169961 ) ) ( HOLDING ?auto_169959 ) ( CLEAR ?auto_169958 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169955 ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 )
      ( MAKE-6PILE ?auto_169955 ?auto_169956 ?auto_169957 ?auto_169958 ?auto_169959 ?auto_169960 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169962 - BLOCK
      ?auto_169963 - BLOCK
      ?auto_169964 - BLOCK
      ?auto_169965 - BLOCK
      ?auto_169966 - BLOCK
      ?auto_169967 - BLOCK
    )
    :vars
    (
      ?auto_169968 - BLOCK
      ?auto_169970 - BLOCK
      ?auto_169969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169962 ) ( ON ?auto_169963 ?auto_169962 ) ( ON ?auto_169964 ?auto_169963 ) ( ON ?auto_169965 ?auto_169964 ) ( not ( = ?auto_169962 ?auto_169963 ) ) ( not ( = ?auto_169962 ?auto_169964 ) ) ( not ( = ?auto_169962 ?auto_169965 ) ) ( not ( = ?auto_169962 ?auto_169966 ) ) ( not ( = ?auto_169962 ?auto_169967 ) ) ( not ( = ?auto_169963 ?auto_169964 ) ) ( not ( = ?auto_169963 ?auto_169965 ) ) ( not ( = ?auto_169963 ?auto_169966 ) ) ( not ( = ?auto_169963 ?auto_169967 ) ) ( not ( = ?auto_169964 ?auto_169965 ) ) ( not ( = ?auto_169964 ?auto_169966 ) ) ( not ( = ?auto_169964 ?auto_169967 ) ) ( not ( = ?auto_169965 ?auto_169966 ) ) ( not ( = ?auto_169965 ?auto_169967 ) ) ( not ( = ?auto_169966 ?auto_169967 ) ) ( ON ?auto_169967 ?auto_169968 ) ( not ( = ?auto_169962 ?auto_169968 ) ) ( not ( = ?auto_169963 ?auto_169968 ) ) ( not ( = ?auto_169964 ?auto_169968 ) ) ( not ( = ?auto_169965 ?auto_169968 ) ) ( not ( = ?auto_169966 ?auto_169968 ) ) ( not ( = ?auto_169967 ?auto_169968 ) ) ( CLEAR ?auto_169965 ) ( ON ?auto_169966 ?auto_169967 ) ( CLEAR ?auto_169966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_169970 ) ( ON ?auto_169969 ?auto_169970 ) ( ON ?auto_169968 ?auto_169969 ) ( not ( = ?auto_169970 ?auto_169969 ) ) ( not ( = ?auto_169970 ?auto_169968 ) ) ( not ( = ?auto_169970 ?auto_169967 ) ) ( not ( = ?auto_169970 ?auto_169966 ) ) ( not ( = ?auto_169969 ?auto_169968 ) ) ( not ( = ?auto_169969 ?auto_169967 ) ) ( not ( = ?auto_169969 ?auto_169966 ) ) ( not ( = ?auto_169962 ?auto_169970 ) ) ( not ( = ?auto_169962 ?auto_169969 ) ) ( not ( = ?auto_169963 ?auto_169970 ) ) ( not ( = ?auto_169963 ?auto_169969 ) ) ( not ( = ?auto_169964 ?auto_169970 ) ) ( not ( = ?auto_169964 ?auto_169969 ) ) ( not ( = ?auto_169965 ?auto_169970 ) ) ( not ( = ?auto_169965 ?auto_169969 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169970 ?auto_169969 ?auto_169968 ?auto_169967 )
      ( MAKE-6PILE ?auto_169962 ?auto_169963 ?auto_169964 ?auto_169965 ?auto_169966 ?auto_169967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169971 - BLOCK
      ?auto_169972 - BLOCK
      ?auto_169973 - BLOCK
      ?auto_169974 - BLOCK
      ?auto_169975 - BLOCK
      ?auto_169976 - BLOCK
    )
    :vars
    (
      ?auto_169977 - BLOCK
      ?auto_169978 - BLOCK
      ?auto_169979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169971 ) ( ON ?auto_169972 ?auto_169971 ) ( ON ?auto_169973 ?auto_169972 ) ( not ( = ?auto_169971 ?auto_169972 ) ) ( not ( = ?auto_169971 ?auto_169973 ) ) ( not ( = ?auto_169971 ?auto_169974 ) ) ( not ( = ?auto_169971 ?auto_169975 ) ) ( not ( = ?auto_169971 ?auto_169976 ) ) ( not ( = ?auto_169972 ?auto_169973 ) ) ( not ( = ?auto_169972 ?auto_169974 ) ) ( not ( = ?auto_169972 ?auto_169975 ) ) ( not ( = ?auto_169972 ?auto_169976 ) ) ( not ( = ?auto_169973 ?auto_169974 ) ) ( not ( = ?auto_169973 ?auto_169975 ) ) ( not ( = ?auto_169973 ?auto_169976 ) ) ( not ( = ?auto_169974 ?auto_169975 ) ) ( not ( = ?auto_169974 ?auto_169976 ) ) ( not ( = ?auto_169975 ?auto_169976 ) ) ( ON ?auto_169976 ?auto_169977 ) ( not ( = ?auto_169971 ?auto_169977 ) ) ( not ( = ?auto_169972 ?auto_169977 ) ) ( not ( = ?auto_169973 ?auto_169977 ) ) ( not ( = ?auto_169974 ?auto_169977 ) ) ( not ( = ?auto_169975 ?auto_169977 ) ) ( not ( = ?auto_169976 ?auto_169977 ) ) ( ON ?auto_169975 ?auto_169976 ) ( CLEAR ?auto_169975 ) ( ON-TABLE ?auto_169978 ) ( ON ?auto_169979 ?auto_169978 ) ( ON ?auto_169977 ?auto_169979 ) ( not ( = ?auto_169978 ?auto_169979 ) ) ( not ( = ?auto_169978 ?auto_169977 ) ) ( not ( = ?auto_169978 ?auto_169976 ) ) ( not ( = ?auto_169978 ?auto_169975 ) ) ( not ( = ?auto_169979 ?auto_169977 ) ) ( not ( = ?auto_169979 ?auto_169976 ) ) ( not ( = ?auto_169979 ?auto_169975 ) ) ( not ( = ?auto_169971 ?auto_169978 ) ) ( not ( = ?auto_169971 ?auto_169979 ) ) ( not ( = ?auto_169972 ?auto_169978 ) ) ( not ( = ?auto_169972 ?auto_169979 ) ) ( not ( = ?auto_169973 ?auto_169978 ) ) ( not ( = ?auto_169973 ?auto_169979 ) ) ( not ( = ?auto_169974 ?auto_169978 ) ) ( not ( = ?auto_169974 ?auto_169979 ) ) ( HOLDING ?auto_169974 ) ( CLEAR ?auto_169973 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169971 ?auto_169972 ?auto_169973 ?auto_169974 )
      ( MAKE-6PILE ?auto_169971 ?auto_169972 ?auto_169973 ?auto_169974 ?auto_169975 ?auto_169976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169980 - BLOCK
      ?auto_169981 - BLOCK
      ?auto_169982 - BLOCK
      ?auto_169983 - BLOCK
      ?auto_169984 - BLOCK
      ?auto_169985 - BLOCK
    )
    :vars
    (
      ?auto_169988 - BLOCK
      ?auto_169986 - BLOCK
      ?auto_169987 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169980 ) ( ON ?auto_169981 ?auto_169980 ) ( ON ?auto_169982 ?auto_169981 ) ( not ( = ?auto_169980 ?auto_169981 ) ) ( not ( = ?auto_169980 ?auto_169982 ) ) ( not ( = ?auto_169980 ?auto_169983 ) ) ( not ( = ?auto_169980 ?auto_169984 ) ) ( not ( = ?auto_169980 ?auto_169985 ) ) ( not ( = ?auto_169981 ?auto_169982 ) ) ( not ( = ?auto_169981 ?auto_169983 ) ) ( not ( = ?auto_169981 ?auto_169984 ) ) ( not ( = ?auto_169981 ?auto_169985 ) ) ( not ( = ?auto_169982 ?auto_169983 ) ) ( not ( = ?auto_169982 ?auto_169984 ) ) ( not ( = ?auto_169982 ?auto_169985 ) ) ( not ( = ?auto_169983 ?auto_169984 ) ) ( not ( = ?auto_169983 ?auto_169985 ) ) ( not ( = ?auto_169984 ?auto_169985 ) ) ( ON ?auto_169985 ?auto_169988 ) ( not ( = ?auto_169980 ?auto_169988 ) ) ( not ( = ?auto_169981 ?auto_169988 ) ) ( not ( = ?auto_169982 ?auto_169988 ) ) ( not ( = ?auto_169983 ?auto_169988 ) ) ( not ( = ?auto_169984 ?auto_169988 ) ) ( not ( = ?auto_169985 ?auto_169988 ) ) ( ON ?auto_169984 ?auto_169985 ) ( ON-TABLE ?auto_169986 ) ( ON ?auto_169987 ?auto_169986 ) ( ON ?auto_169988 ?auto_169987 ) ( not ( = ?auto_169986 ?auto_169987 ) ) ( not ( = ?auto_169986 ?auto_169988 ) ) ( not ( = ?auto_169986 ?auto_169985 ) ) ( not ( = ?auto_169986 ?auto_169984 ) ) ( not ( = ?auto_169987 ?auto_169988 ) ) ( not ( = ?auto_169987 ?auto_169985 ) ) ( not ( = ?auto_169987 ?auto_169984 ) ) ( not ( = ?auto_169980 ?auto_169986 ) ) ( not ( = ?auto_169980 ?auto_169987 ) ) ( not ( = ?auto_169981 ?auto_169986 ) ) ( not ( = ?auto_169981 ?auto_169987 ) ) ( not ( = ?auto_169982 ?auto_169986 ) ) ( not ( = ?auto_169982 ?auto_169987 ) ) ( not ( = ?auto_169983 ?auto_169986 ) ) ( not ( = ?auto_169983 ?auto_169987 ) ) ( CLEAR ?auto_169982 ) ( ON ?auto_169983 ?auto_169984 ) ( CLEAR ?auto_169983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169986 ?auto_169987 ?auto_169988 ?auto_169985 ?auto_169984 )
      ( MAKE-6PILE ?auto_169980 ?auto_169981 ?auto_169982 ?auto_169983 ?auto_169984 ?auto_169985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169989 - BLOCK
      ?auto_169990 - BLOCK
      ?auto_169991 - BLOCK
      ?auto_169992 - BLOCK
      ?auto_169993 - BLOCK
      ?auto_169994 - BLOCK
    )
    :vars
    (
      ?auto_169996 - BLOCK
      ?auto_169995 - BLOCK
      ?auto_169997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169989 ) ( ON ?auto_169990 ?auto_169989 ) ( not ( = ?auto_169989 ?auto_169990 ) ) ( not ( = ?auto_169989 ?auto_169991 ) ) ( not ( = ?auto_169989 ?auto_169992 ) ) ( not ( = ?auto_169989 ?auto_169993 ) ) ( not ( = ?auto_169989 ?auto_169994 ) ) ( not ( = ?auto_169990 ?auto_169991 ) ) ( not ( = ?auto_169990 ?auto_169992 ) ) ( not ( = ?auto_169990 ?auto_169993 ) ) ( not ( = ?auto_169990 ?auto_169994 ) ) ( not ( = ?auto_169991 ?auto_169992 ) ) ( not ( = ?auto_169991 ?auto_169993 ) ) ( not ( = ?auto_169991 ?auto_169994 ) ) ( not ( = ?auto_169992 ?auto_169993 ) ) ( not ( = ?auto_169992 ?auto_169994 ) ) ( not ( = ?auto_169993 ?auto_169994 ) ) ( ON ?auto_169994 ?auto_169996 ) ( not ( = ?auto_169989 ?auto_169996 ) ) ( not ( = ?auto_169990 ?auto_169996 ) ) ( not ( = ?auto_169991 ?auto_169996 ) ) ( not ( = ?auto_169992 ?auto_169996 ) ) ( not ( = ?auto_169993 ?auto_169996 ) ) ( not ( = ?auto_169994 ?auto_169996 ) ) ( ON ?auto_169993 ?auto_169994 ) ( ON-TABLE ?auto_169995 ) ( ON ?auto_169997 ?auto_169995 ) ( ON ?auto_169996 ?auto_169997 ) ( not ( = ?auto_169995 ?auto_169997 ) ) ( not ( = ?auto_169995 ?auto_169996 ) ) ( not ( = ?auto_169995 ?auto_169994 ) ) ( not ( = ?auto_169995 ?auto_169993 ) ) ( not ( = ?auto_169997 ?auto_169996 ) ) ( not ( = ?auto_169997 ?auto_169994 ) ) ( not ( = ?auto_169997 ?auto_169993 ) ) ( not ( = ?auto_169989 ?auto_169995 ) ) ( not ( = ?auto_169989 ?auto_169997 ) ) ( not ( = ?auto_169990 ?auto_169995 ) ) ( not ( = ?auto_169990 ?auto_169997 ) ) ( not ( = ?auto_169991 ?auto_169995 ) ) ( not ( = ?auto_169991 ?auto_169997 ) ) ( not ( = ?auto_169992 ?auto_169995 ) ) ( not ( = ?auto_169992 ?auto_169997 ) ) ( ON ?auto_169992 ?auto_169993 ) ( CLEAR ?auto_169992 ) ( HOLDING ?auto_169991 ) ( CLEAR ?auto_169990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169989 ?auto_169990 ?auto_169991 )
      ( MAKE-6PILE ?auto_169989 ?auto_169990 ?auto_169991 ?auto_169992 ?auto_169993 ?auto_169994 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_169998 - BLOCK
      ?auto_169999 - BLOCK
      ?auto_170000 - BLOCK
      ?auto_170001 - BLOCK
      ?auto_170002 - BLOCK
      ?auto_170003 - BLOCK
    )
    :vars
    (
      ?auto_170004 - BLOCK
      ?auto_170005 - BLOCK
      ?auto_170006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169998 ) ( ON ?auto_169999 ?auto_169998 ) ( not ( = ?auto_169998 ?auto_169999 ) ) ( not ( = ?auto_169998 ?auto_170000 ) ) ( not ( = ?auto_169998 ?auto_170001 ) ) ( not ( = ?auto_169998 ?auto_170002 ) ) ( not ( = ?auto_169998 ?auto_170003 ) ) ( not ( = ?auto_169999 ?auto_170000 ) ) ( not ( = ?auto_169999 ?auto_170001 ) ) ( not ( = ?auto_169999 ?auto_170002 ) ) ( not ( = ?auto_169999 ?auto_170003 ) ) ( not ( = ?auto_170000 ?auto_170001 ) ) ( not ( = ?auto_170000 ?auto_170002 ) ) ( not ( = ?auto_170000 ?auto_170003 ) ) ( not ( = ?auto_170001 ?auto_170002 ) ) ( not ( = ?auto_170001 ?auto_170003 ) ) ( not ( = ?auto_170002 ?auto_170003 ) ) ( ON ?auto_170003 ?auto_170004 ) ( not ( = ?auto_169998 ?auto_170004 ) ) ( not ( = ?auto_169999 ?auto_170004 ) ) ( not ( = ?auto_170000 ?auto_170004 ) ) ( not ( = ?auto_170001 ?auto_170004 ) ) ( not ( = ?auto_170002 ?auto_170004 ) ) ( not ( = ?auto_170003 ?auto_170004 ) ) ( ON ?auto_170002 ?auto_170003 ) ( ON-TABLE ?auto_170005 ) ( ON ?auto_170006 ?auto_170005 ) ( ON ?auto_170004 ?auto_170006 ) ( not ( = ?auto_170005 ?auto_170006 ) ) ( not ( = ?auto_170005 ?auto_170004 ) ) ( not ( = ?auto_170005 ?auto_170003 ) ) ( not ( = ?auto_170005 ?auto_170002 ) ) ( not ( = ?auto_170006 ?auto_170004 ) ) ( not ( = ?auto_170006 ?auto_170003 ) ) ( not ( = ?auto_170006 ?auto_170002 ) ) ( not ( = ?auto_169998 ?auto_170005 ) ) ( not ( = ?auto_169998 ?auto_170006 ) ) ( not ( = ?auto_169999 ?auto_170005 ) ) ( not ( = ?auto_169999 ?auto_170006 ) ) ( not ( = ?auto_170000 ?auto_170005 ) ) ( not ( = ?auto_170000 ?auto_170006 ) ) ( not ( = ?auto_170001 ?auto_170005 ) ) ( not ( = ?auto_170001 ?auto_170006 ) ) ( ON ?auto_170001 ?auto_170002 ) ( CLEAR ?auto_169999 ) ( ON ?auto_170000 ?auto_170001 ) ( CLEAR ?auto_170000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170005 ?auto_170006 ?auto_170004 ?auto_170003 ?auto_170002 ?auto_170001 )
      ( MAKE-6PILE ?auto_169998 ?auto_169999 ?auto_170000 ?auto_170001 ?auto_170002 ?auto_170003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170007 - BLOCK
      ?auto_170008 - BLOCK
      ?auto_170009 - BLOCK
      ?auto_170010 - BLOCK
      ?auto_170011 - BLOCK
      ?auto_170012 - BLOCK
    )
    :vars
    (
      ?auto_170015 - BLOCK
      ?auto_170013 - BLOCK
      ?auto_170014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170007 ) ( not ( = ?auto_170007 ?auto_170008 ) ) ( not ( = ?auto_170007 ?auto_170009 ) ) ( not ( = ?auto_170007 ?auto_170010 ) ) ( not ( = ?auto_170007 ?auto_170011 ) ) ( not ( = ?auto_170007 ?auto_170012 ) ) ( not ( = ?auto_170008 ?auto_170009 ) ) ( not ( = ?auto_170008 ?auto_170010 ) ) ( not ( = ?auto_170008 ?auto_170011 ) ) ( not ( = ?auto_170008 ?auto_170012 ) ) ( not ( = ?auto_170009 ?auto_170010 ) ) ( not ( = ?auto_170009 ?auto_170011 ) ) ( not ( = ?auto_170009 ?auto_170012 ) ) ( not ( = ?auto_170010 ?auto_170011 ) ) ( not ( = ?auto_170010 ?auto_170012 ) ) ( not ( = ?auto_170011 ?auto_170012 ) ) ( ON ?auto_170012 ?auto_170015 ) ( not ( = ?auto_170007 ?auto_170015 ) ) ( not ( = ?auto_170008 ?auto_170015 ) ) ( not ( = ?auto_170009 ?auto_170015 ) ) ( not ( = ?auto_170010 ?auto_170015 ) ) ( not ( = ?auto_170011 ?auto_170015 ) ) ( not ( = ?auto_170012 ?auto_170015 ) ) ( ON ?auto_170011 ?auto_170012 ) ( ON-TABLE ?auto_170013 ) ( ON ?auto_170014 ?auto_170013 ) ( ON ?auto_170015 ?auto_170014 ) ( not ( = ?auto_170013 ?auto_170014 ) ) ( not ( = ?auto_170013 ?auto_170015 ) ) ( not ( = ?auto_170013 ?auto_170012 ) ) ( not ( = ?auto_170013 ?auto_170011 ) ) ( not ( = ?auto_170014 ?auto_170015 ) ) ( not ( = ?auto_170014 ?auto_170012 ) ) ( not ( = ?auto_170014 ?auto_170011 ) ) ( not ( = ?auto_170007 ?auto_170013 ) ) ( not ( = ?auto_170007 ?auto_170014 ) ) ( not ( = ?auto_170008 ?auto_170013 ) ) ( not ( = ?auto_170008 ?auto_170014 ) ) ( not ( = ?auto_170009 ?auto_170013 ) ) ( not ( = ?auto_170009 ?auto_170014 ) ) ( not ( = ?auto_170010 ?auto_170013 ) ) ( not ( = ?auto_170010 ?auto_170014 ) ) ( ON ?auto_170010 ?auto_170011 ) ( ON ?auto_170009 ?auto_170010 ) ( CLEAR ?auto_170009 ) ( HOLDING ?auto_170008 ) ( CLEAR ?auto_170007 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170007 ?auto_170008 )
      ( MAKE-6PILE ?auto_170007 ?auto_170008 ?auto_170009 ?auto_170010 ?auto_170011 ?auto_170012 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170016 - BLOCK
      ?auto_170017 - BLOCK
      ?auto_170018 - BLOCK
      ?auto_170019 - BLOCK
      ?auto_170020 - BLOCK
      ?auto_170021 - BLOCK
    )
    :vars
    (
      ?auto_170024 - BLOCK
      ?auto_170023 - BLOCK
      ?auto_170022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170016 ) ( not ( = ?auto_170016 ?auto_170017 ) ) ( not ( = ?auto_170016 ?auto_170018 ) ) ( not ( = ?auto_170016 ?auto_170019 ) ) ( not ( = ?auto_170016 ?auto_170020 ) ) ( not ( = ?auto_170016 ?auto_170021 ) ) ( not ( = ?auto_170017 ?auto_170018 ) ) ( not ( = ?auto_170017 ?auto_170019 ) ) ( not ( = ?auto_170017 ?auto_170020 ) ) ( not ( = ?auto_170017 ?auto_170021 ) ) ( not ( = ?auto_170018 ?auto_170019 ) ) ( not ( = ?auto_170018 ?auto_170020 ) ) ( not ( = ?auto_170018 ?auto_170021 ) ) ( not ( = ?auto_170019 ?auto_170020 ) ) ( not ( = ?auto_170019 ?auto_170021 ) ) ( not ( = ?auto_170020 ?auto_170021 ) ) ( ON ?auto_170021 ?auto_170024 ) ( not ( = ?auto_170016 ?auto_170024 ) ) ( not ( = ?auto_170017 ?auto_170024 ) ) ( not ( = ?auto_170018 ?auto_170024 ) ) ( not ( = ?auto_170019 ?auto_170024 ) ) ( not ( = ?auto_170020 ?auto_170024 ) ) ( not ( = ?auto_170021 ?auto_170024 ) ) ( ON ?auto_170020 ?auto_170021 ) ( ON-TABLE ?auto_170023 ) ( ON ?auto_170022 ?auto_170023 ) ( ON ?auto_170024 ?auto_170022 ) ( not ( = ?auto_170023 ?auto_170022 ) ) ( not ( = ?auto_170023 ?auto_170024 ) ) ( not ( = ?auto_170023 ?auto_170021 ) ) ( not ( = ?auto_170023 ?auto_170020 ) ) ( not ( = ?auto_170022 ?auto_170024 ) ) ( not ( = ?auto_170022 ?auto_170021 ) ) ( not ( = ?auto_170022 ?auto_170020 ) ) ( not ( = ?auto_170016 ?auto_170023 ) ) ( not ( = ?auto_170016 ?auto_170022 ) ) ( not ( = ?auto_170017 ?auto_170023 ) ) ( not ( = ?auto_170017 ?auto_170022 ) ) ( not ( = ?auto_170018 ?auto_170023 ) ) ( not ( = ?auto_170018 ?auto_170022 ) ) ( not ( = ?auto_170019 ?auto_170023 ) ) ( not ( = ?auto_170019 ?auto_170022 ) ) ( ON ?auto_170019 ?auto_170020 ) ( ON ?auto_170018 ?auto_170019 ) ( CLEAR ?auto_170016 ) ( ON ?auto_170017 ?auto_170018 ) ( CLEAR ?auto_170017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170023 ?auto_170022 ?auto_170024 ?auto_170021 ?auto_170020 ?auto_170019 ?auto_170018 )
      ( MAKE-6PILE ?auto_170016 ?auto_170017 ?auto_170018 ?auto_170019 ?auto_170020 ?auto_170021 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170025 - BLOCK
      ?auto_170026 - BLOCK
      ?auto_170027 - BLOCK
      ?auto_170028 - BLOCK
      ?auto_170029 - BLOCK
      ?auto_170030 - BLOCK
    )
    :vars
    (
      ?auto_170032 - BLOCK
      ?auto_170033 - BLOCK
      ?auto_170031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170025 ?auto_170026 ) ) ( not ( = ?auto_170025 ?auto_170027 ) ) ( not ( = ?auto_170025 ?auto_170028 ) ) ( not ( = ?auto_170025 ?auto_170029 ) ) ( not ( = ?auto_170025 ?auto_170030 ) ) ( not ( = ?auto_170026 ?auto_170027 ) ) ( not ( = ?auto_170026 ?auto_170028 ) ) ( not ( = ?auto_170026 ?auto_170029 ) ) ( not ( = ?auto_170026 ?auto_170030 ) ) ( not ( = ?auto_170027 ?auto_170028 ) ) ( not ( = ?auto_170027 ?auto_170029 ) ) ( not ( = ?auto_170027 ?auto_170030 ) ) ( not ( = ?auto_170028 ?auto_170029 ) ) ( not ( = ?auto_170028 ?auto_170030 ) ) ( not ( = ?auto_170029 ?auto_170030 ) ) ( ON ?auto_170030 ?auto_170032 ) ( not ( = ?auto_170025 ?auto_170032 ) ) ( not ( = ?auto_170026 ?auto_170032 ) ) ( not ( = ?auto_170027 ?auto_170032 ) ) ( not ( = ?auto_170028 ?auto_170032 ) ) ( not ( = ?auto_170029 ?auto_170032 ) ) ( not ( = ?auto_170030 ?auto_170032 ) ) ( ON ?auto_170029 ?auto_170030 ) ( ON-TABLE ?auto_170033 ) ( ON ?auto_170031 ?auto_170033 ) ( ON ?auto_170032 ?auto_170031 ) ( not ( = ?auto_170033 ?auto_170031 ) ) ( not ( = ?auto_170033 ?auto_170032 ) ) ( not ( = ?auto_170033 ?auto_170030 ) ) ( not ( = ?auto_170033 ?auto_170029 ) ) ( not ( = ?auto_170031 ?auto_170032 ) ) ( not ( = ?auto_170031 ?auto_170030 ) ) ( not ( = ?auto_170031 ?auto_170029 ) ) ( not ( = ?auto_170025 ?auto_170033 ) ) ( not ( = ?auto_170025 ?auto_170031 ) ) ( not ( = ?auto_170026 ?auto_170033 ) ) ( not ( = ?auto_170026 ?auto_170031 ) ) ( not ( = ?auto_170027 ?auto_170033 ) ) ( not ( = ?auto_170027 ?auto_170031 ) ) ( not ( = ?auto_170028 ?auto_170033 ) ) ( not ( = ?auto_170028 ?auto_170031 ) ) ( ON ?auto_170028 ?auto_170029 ) ( ON ?auto_170027 ?auto_170028 ) ( ON ?auto_170026 ?auto_170027 ) ( CLEAR ?auto_170026 ) ( HOLDING ?auto_170025 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170025 )
      ( MAKE-6PILE ?auto_170025 ?auto_170026 ?auto_170027 ?auto_170028 ?auto_170029 ?auto_170030 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170034 - BLOCK
      ?auto_170035 - BLOCK
      ?auto_170036 - BLOCK
      ?auto_170037 - BLOCK
      ?auto_170038 - BLOCK
      ?auto_170039 - BLOCK
    )
    :vars
    (
      ?auto_170042 - BLOCK
      ?auto_170040 - BLOCK
      ?auto_170041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170034 ?auto_170035 ) ) ( not ( = ?auto_170034 ?auto_170036 ) ) ( not ( = ?auto_170034 ?auto_170037 ) ) ( not ( = ?auto_170034 ?auto_170038 ) ) ( not ( = ?auto_170034 ?auto_170039 ) ) ( not ( = ?auto_170035 ?auto_170036 ) ) ( not ( = ?auto_170035 ?auto_170037 ) ) ( not ( = ?auto_170035 ?auto_170038 ) ) ( not ( = ?auto_170035 ?auto_170039 ) ) ( not ( = ?auto_170036 ?auto_170037 ) ) ( not ( = ?auto_170036 ?auto_170038 ) ) ( not ( = ?auto_170036 ?auto_170039 ) ) ( not ( = ?auto_170037 ?auto_170038 ) ) ( not ( = ?auto_170037 ?auto_170039 ) ) ( not ( = ?auto_170038 ?auto_170039 ) ) ( ON ?auto_170039 ?auto_170042 ) ( not ( = ?auto_170034 ?auto_170042 ) ) ( not ( = ?auto_170035 ?auto_170042 ) ) ( not ( = ?auto_170036 ?auto_170042 ) ) ( not ( = ?auto_170037 ?auto_170042 ) ) ( not ( = ?auto_170038 ?auto_170042 ) ) ( not ( = ?auto_170039 ?auto_170042 ) ) ( ON ?auto_170038 ?auto_170039 ) ( ON-TABLE ?auto_170040 ) ( ON ?auto_170041 ?auto_170040 ) ( ON ?auto_170042 ?auto_170041 ) ( not ( = ?auto_170040 ?auto_170041 ) ) ( not ( = ?auto_170040 ?auto_170042 ) ) ( not ( = ?auto_170040 ?auto_170039 ) ) ( not ( = ?auto_170040 ?auto_170038 ) ) ( not ( = ?auto_170041 ?auto_170042 ) ) ( not ( = ?auto_170041 ?auto_170039 ) ) ( not ( = ?auto_170041 ?auto_170038 ) ) ( not ( = ?auto_170034 ?auto_170040 ) ) ( not ( = ?auto_170034 ?auto_170041 ) ) ( not ( = ?auto_170035 ?auto_170040 ) ) ( not ( = ?auto_170035 ?auto_170041 ) ) ( not ( = ?auto_170036 ?auto_170040 ) ) ( not ( = ?auto_170036 ?auto_170041 ) ) ( not ( = ?auto_170037 ?auto_170040 ) ) ( not ( = ?auto_170037 ?auto_170041 ) ) ( ON ?auto_170037 ?auto_170038 ) ( ON ?auto_170036 ?auto_170037 ) ( ON ?auto_170035 ?auto_170036 ) ( ON ?auto_170034 ?auto_170035 ) ( CLEAR ?auto_170034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170040 ?auto_170041 ?auto_170042 ?auto_170039 ?auto_170038 ?auto_170037 ?auto_170036 ?auto_170035 )
      ( MAKE-6PILE ?auto_170034 ?auto_170035 ?auto_170036 ?auto_170037 ?auto_170038 ?auto_170039 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170045 - BLOCK
      ?auto_170046 - BLOCK
    )
    :vars
    (
      ?auto_170047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170047 ?auto_170046 ) ( CLEAR ?auto_170047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170045 ) ( ON ?auto_170046 ?auto_170045 ) ( not ( = ?auto_170045 ?auto_170046 ) ) ( not ( = ?auto_170045 ?auto_170047 ) ) ( not ( = ?auto_170046 ?auto_170047 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170047 ?auto_170046 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170048 - BLOCK
      ?auto_170049 - BLOCK
    )
    :vars
    (
      ?auto_170050 - BLOCK
      ?auto_170051 - BLOCK
      ?auto_170052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170050 ?auto_170049 ) ( CLEAR ?auto_170050 ) ( ON-TABLE ?auto_170048 ) ( ON ?auto_170049 ?auto_170048 ) ( not ( = ?auto_170048 ?auto_170049 ) ) ( not ( = ?auto_170048 ?auto_170050 ) ) ( not ( = ?auto_170049 ?auto_170050 ) ) ( HOLDING ?auto_170051 ) ( CLEAR ?auto_170052 ) ( not ( = ?auto_170048 ?auto_170051 ) ) ( not ( = ?auto_170048 ?auto_170052 ) ) ( not ( = ?auto_170049 ?auto_170051 ) ) ( not ( = ?auto_170049 ?auto_170052 ) ) ( not ( = ?auto_170050 ?auto_170051 ) ) ( not ( = ?auto_170050 ?auto_170052 ) ) ( not ( = ?auto_170051 ?auto_170052 ) ) )
    :subtasks
    ( ( !STACK ?auto_170051 ?auto_170052 )
      ( MAKE-2PILE ?auto_170048 ?auto_170049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170053 - BLOCK
      ?auto_170054 - BLOCK
    )
    :vars
    (
      ?auto_170057 - BLOCK
      ?auto_170055 - BLOCK
      ?auto_170056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170057 ?auto_170054 ) ( ON-TABLE ?auto_170053 ) ( ON ?auto_170054 ?auto_170053 ) ( not ( = ?auto_170053 ?auto_170054 ) ) ( not ( = ?auto_170053 ?auto_170057 ) ) ( not ( = ?auto_170054 ?auto_170057 ) ) ( CLEAR ?auto_170055 ) ( not ( = ?auto_170053 ?auto_170056 ) ) ( not ( = ?auto_170053 ?auto_170055 ) ) ( not ( = ?auto_170054 ?auto_170056 ) ) ( not ( = ?auto_170054 ?auto_170055 ) ) ( not ( = ?auto_170057 ?auto_170056 ) ) ( not ( = ?auto_170057 ?auto_170055 ) ) ( not ( = ?auto_170056 ?auto_170055 ) ) ( ON ?auto_170056 ?auto_170057 ) ( CLEAR ?auto_170056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170053 ?auto_170054 ?auto_170057 )
      ( MAKE-2PILE ?auto_170053 ?auto_170054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170058 - BLOCK
      ?auto_170059 - BLOCK
    )
    :vars
    (
      ?auto_170062 - BLOCK
      ?auto_170061 - BLOCK
      ?auto_170060 - BLOCK
      ?auto_170066 - BLOCK
      ?auto_170065 - BLOCK
      ?auto_170064 - BLOCK
      ?auto_170063 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170062 ?auto_170059 ) ( ON-TABLE ?auto_170058 ) ( ON ?auto_170059 ?auto_170058 ) ( not ( = ?auto_170058 ?auto_170059 ) ) ( not ( = ?auto_170058 ?auto_170062 ) ) ( not ( = ?auto_170059 ?auto_170062 ) ) ( not ( = ?auto_170058 ?auto_170061 ) ) ( not ( = ?auto_170058 ?auto_170060 ) ) ( not ( = ?auto_170059 ?auto_170061 ) ) ( not ( = ?auto_170059 ?auto_170060 ) ) ( not ( = ?auto_170062 ?auto_170061 ) ) ( not ( = ?auto_170062 ?auto_170060 ) ) ( not ( = ?auto_170061 ?auto_170060 ) ) ( ON ?auto_170061 ?auto_170062 ) ( CLEAR ?auto_170061 ) ( HOLDING ?auto_170060 ) ( CLEAR ?auto_170066 ) ( ON-TABLE ?auto_170065 ) ( ON ?auto_170064 ?auto_170065 ) ( ON ?auto_170063 ?auto_170064 ) ( ON ?auto_170066 ?auto_170063 ) ( not ( = ?auto_170065 ?auto_170064 ) ) ( not ( = ?auto_170065 ?auto_170063 ) ) ( not ( = ?auto_170065 ?auto_170066 ) ) ( not ( = ?auto_170065 ?auto_170060 ) ) ( not ( = ?auto_170064 ?auto_170063 ) ) ( not ( = ?auto_170064 ?auto_170066 ) ) ( not ( = ?auto_170064 ?auto_170060 ) ) ( not ( = ?auto_170063 ?auto_170066 ) ) ( not ( = ?auto_170063 ?auto_170060 ) ) ( not ( = ?auto_170066 ?auto_170060 ) ) ( not ( = ?auto_170058 ?auto_170066 ) ) ( not ( = ?auto_170058 ?auto_170065 ) ) ( not ( = ?auto_170058 ?auto_170064 ) ) ( not ( = ?auto_170058 ?auto_170063 ) ) ( not ( = ?auto_170059 ?auto_170066 ) ) ( not ( = ?auto_170059 ?auto_170065 ) ) ( not ( = ?auto_170059 ?auto_170064 ) ) ( not ( = ?auto_170059 ?auto_170063 ) ) ( not ( = ?auto_170062 ?auto_170066 ) ) ( not ( = ?auto_170062 ?auto_170065 ) ) ( not ( = ?auto_170062 ?auto_170064 ) ) ( not ( = ?auto_170062 ?auto_170063 ) ) ( not ( = ?auto_170061 ?auto_170066 ) ) ( not ( = ?auto_170061 ?auto_170065 ) ) ( not ( = ?auto_170061 ?auto_170064 ) ) ( not ( = ?auto_170061 ?auto_170063 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170065 ?auto_170064 ?auto_170063 ?auto_170066 ?auto_170060 )
      ( MAKE-2PILE ?auto_170058 ?auto_170059 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170067 - BLOCK
      ?auto_170068 - BLOCK
    )
    :vars
    (
      ?auto_170070 - BLOCK
      ?auto_170074 - BLOCK
      ?auto_170072 - BLOCK
      ?auto_170075 - BLOCK
      ?auto_170073 - BLOCK
      ?auto_170071 - BLOCK
      ?auto_170069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170070 ?auto_170068 ) ( ON-TABLE ?auto_170067 ) ( ON ?auto_170068 ?auto_170067 ) ( not ( = ?auto_170067 ?auto_170068 ) ) ( not ( = ?auto_170067 ?auto_170070 ) ) ( not ( = ?auto_170068 ?auto_170070 ) ) ( not ( = ?auto_170067 ?auto_170074 ) ) ( not ( = ?auto_170067 ?auto_170072 ) ) ( not ( = ?auto_170068 ?auto_170074 ) ) ( not ( = ?auto_170068 ?auto_170072 ) ) ( not ( = ?auto_170070 ?auto_170074 ) ) ( not ( = ?auto_170070 ?auto_170072 ) ) ( not ( = ?auto_170074 ?auto_170072 ) ) ( ON ?auto_170074 ?auto_170070 ) ( CLEAR ?auto_170075 ) ( ON-TABLE ?auto_170073 ) ( ON ?auto_170071 ?auto_170073 ) ( ON ?auto_170069 ?auto_170071 ) ( ON ?auto_170075 ?auto_170069 ) ( not ( = ?auto_170073 ?auto_170071 ) ) ( not ( = ?auto_170073 ?auto_170069 ) ) ( not ( = ?auto_170073 ?auto_170075 ) ) ( not ( = ?auto_170073 ?auto_170072 ) ) ( not ( = ?auto_170071 ?auto_170069 ) ) ( not ( = ?auto_170071 ?auto_170075 ) ) ( not ( = ?auto_170071 ?auto_170072 ) ) ( not ( = ?auto_170069 ?auto_170075 ) ) ( not ( = ?auto_170069 ?auto_170072 ) ) ( not ( = ?auto_170075 ?auto_170072 ) ) ( not ( = ?auto_170067 ?auto_170075 ) ) ( not ( = ?auto_170067 ?auto_170073 ) ) ( not ( = ?auto_170067 ?auto_170071 ) ) ( not ( = ?auto_170067 ?auto_170069 ) ) ( not ( = ?auto_170068 ?auto_170075 ) ) ( not ( = ?auto_170068 ?auto_170073 ) ) ( not ( = ?auto_170068 ?auto_170071 ) ) ( not ( = ?auto_170068 ?auto_170069 ) ) ( not ( = ?auto_170070 ?auto_170075 ) ) ( not ( = ?auto_170070 ?auto_170073 ) ) ( not ( = ?auto_170070 ?auto_170071 ) ) ( not ( = ?auto_170070 ?auto_170069 ) ) ( not ( = ?auto_170074 ?auto_170075 ) ) ( not ( = ?auto_170074 ?auto_170073 ) ) ( not ( = ?auto_170074 ?auto_170071 ) ) ( not ( = ?auto_170074 ?auto_170069 ) ) ( ON ?auto_170072 ?auto_170074 ) ( CLEAR ?auto_170072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170067 ?auto_170068 ?auto_170070 ?auto_170074 )
      ( MAKE-2PILE ?auto_170067 ?auto_170068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170076 - BLOCK
      ?auto_170077 - BLOCK
    )
    :vars
    (
      ?auto_170080 - BLOCK
      ?auto_170079 - BLOCK
      ?auto_170083 - BLOCK
      ?auto_170084 - BLOCK
      ?auto_170081 - BLOCK
      ?auto_170078 - BLOCK
      ?auto_170082 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170080 ?auto_170077 ) ( ON-TABLE ?auto_170076 ) ( ON ?auto_170077 ?auto_170076 ) ( not ( = ?auto_170076 ?auto_170077 ) ) ( not ( = ?auto_170076 ?auto_170080 ) ) ( not ( = ?auto_170077 ?auto_170080 ) ) ( not ( = ?auto_170076 ?auto_170079 ) ) ( not ( = ?auto_170076 ?auto_170083 ) ) ( not ( = ?auto_170077 ?auto_170079 ) ) ( not ( = ?auto_170077 ?auto_170083 ) ) ( not ( = ?auto_170080 ?auto_170079 ) ) ( not ( = ?auto_170080 ?auto_170083 ) ) ( not ( = ?auto_170079 ?auto_170083 ) ) ( ON ?auto_170079 ?auto_170080 ) ( ON-TABLE ?auto_170084 ) ( ON ?auto_170081 ?auto_170084 ) ( ON ?auto_170078 ?auto_170081 ) ( not ( = ?auto_170084 ?auto_170081 ) ) ( not ( = ?auto_170084 ?auto_170078 ) ) ( not ( = ?auto_170084 ?auto_170082 ) ) ( not ( = ?auto_170084 ?auto_170083 ) ) ( not ( = ?auto_170081 ?auto_170078 ) ) ( not ( = ?auto_170081 ?auto_170082 ) ) ( not ( = ?auto_170081 ?auto_170083 ) ) ( not ( = ?auto_170078 ?auto_170082 ) ) ( not ( = ?auto_170078 ?auto_170083 ) ) ( not ( = ?auto_170082 ?auto_170083 ) ) ( not ( = ?auto_170076 ?auto_170082 ) ) ( not ( = ?auto_170076 ?auto_170084 ) ) ( not ( = ?auto_170076 ?auto_170081 ) ) ( not ( = ?auto_170076 ?auto_170078 ) ) ( not ( = ?auto_170077 ?auto_170082 ) ) ( not ( = ?auto_170077 ?auto_170084 ) ) ( not ( = ?auto_170077 ?auto_170081 ) ) ( not ( = ?auto_170077 ?auto_170078 ) ) ( not ( = ?auto_170080 ?auto_170082 ) ) ( not ( = ?auto_170080 ?auto_170084 ) ) ( not ( = ?auto_170080 ?auto_170081 ) ) ( not ( = ?auto_170080 ?auto_170078 ) ) ( not ( = ?auto_170079 ?auto_170082 ) ) ( not ( = ?auto_170079 ?auto_170084 ) ) ( not ( = ?auto_170079 ?auto_170081 ) ) ( not ( = ?auto_170079 ?auto_170078 ) ) ( ON ?auto_170083 ?auto_170079 ) ( CLEAR ?auto_170083 ) ( HOLDING ?auto_170082 ) ( CLEAR ?auto_170078 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170084 ?auto_170081 ?auto_170078 ?auto_170082 )
      ( MAKE-2PILE ?auto_170076 ?auto_170077 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170085 - BLOCK
      ?auto_170086 - BLOCK
    )
    :vars
    (
      ?auto_170092 - BLOCK
      ?auto_170087 - BLOCK
      ?auto_170089 - BLOCK
      ?auto_170090 - BLOCK
      ?auto_170091 - BLOCK
      ?auto_170093 - BLOCK
      ?auto_170088 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170092 ?auto_170086 ) ( ON-TABLE ?auto_170085 ) ( ON ?auto_170086 ?auto_170085 ) ( not ( = ?auto_170085 ?auto_170086 ) ) ( not ( = ?auto_170085 ?auto_170092 ) ) ( not ( = ?auto_170086 ?auto_170092 ) ) ( not ( = ?auto_170085 ?auto_170087 ) ) ( not ( = ?auto_170085 ?auto_170089 ) ) ( not ( = ?auto_170086 ?auto_170087 ) ) ( not ( = ?auto_170086 ?auto_170089 ) ) ( not ( = ?auto_170092 ?auto_170087 ) ) ( not ( = ?auto_170092 ?auto_170089 ) ) ( not ( = ?auto_170087 ?auto_170089 ) ) ( ON ?auto_170087 ?auto_170092 ) ( ON-TABLE ?auto_170090 ) ( ON ?auto_170091 ?auto_170090 ) ( ON ?auto_170093 ?auto_170091 ) ( not ( = ?auto_170090 ?auto_170091 ) ) ( not ( = ?auto_170090 ?auto_170093 ) ) ( not ( = ?auto_170090 ?auto_170088 ) ) ( not ( = ?auto_170090 ?auto_170089 ) ) ( not ( = ?auto_170091 ?auto_170093 ) ) ( not ( = ?auto_170091 ?auto_170088 ) ) ( not ( = ?auto_170091 ?auto_170089 ) ) ( not ( = ?auto_170093 ?auto_170088 ) ) ( not ( = ?auto_170093 ?auto_170089 ) ) ( not ( = ?auto_170088 ?auto_170089 ) ) ( not ( = ?auto_170085 ?auto_170088 ) ) ( not ( = ?auto_170085 ?auto_170090 ) ) ( not ( = ?auto_170085 ?auto_170091 ) ) ( not ( = ?auto_170085 ?auto_170093 ) ) ( not ( = ?auto_170086 ?auto_170088 ) ) ( not ( = ?auto_170086 ?auto_170090 ) ) ( not ( = ?auto_170086 ?auto_170091 ) ) ( not ( = ?auto_170086 ?auto_170093 ) ) ( not ( = ?auto_170092 ?auto_170088 ) ) ( not ( = ?auto_170092 ?auto_170090 ) ) ( not ( = ?auto_170092 ?auto_170091 ) ) ( not ( = ?auto_170092 ?auto_170093 ) ) ( not ( = ?auto_170087 ?auto_170088 ) ) ( not ( = ?auto_170087 ?auto_170090 ) ) ( not ( = ?auto_170087 ?auto_170091 ) ) ( not ( = ?auto_170087 ?auto_170093 ) ) ( ON ?auto_170089 ?auto_170087 ) ( CLEAR ?auto_170093 ) ( ON ?auto_170088 ?auto_170089 ) ( CLEAR ?auto_170088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170085 ?auto_170086 ?auto_170092 ?auto_170087 ?auto_170089 )
      ( MAKE-2PILE ?auto_170085 ?auto_170086 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170094 - BLOCK
      ?auto_170095 - BLOCK
    )
    :vars
    (
      ?auto_170102 - BLOCK
      ?auto_170098 - BLOCK
      ?auto_170100 - BLOCK
      ?auto_170099 - BLOCK
      ?auto_170097 - BLOCK
      ?auto_170101 - BLOCK
      ?auto_170096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170102 ?auto_170095 ) ( ON-TABLE ?auto_170094 ) ( ON ?auto_170095 ?auto_170094 ) ( not ( = ?auto_170094 ?auto_170095 ) ) ( not ( = ?auto_170094 ?auto_170102 ) ) ( not ( = ?auto_170095 ?auto_170102 ) ) ( not ( = ?auto_170094 ?auto_170098 ) ) ( not ( = ?auto_170094 ?auto_170100 ) ) ( not ( = ?auto_170095 ?auto_170098 ) ) ( not ( = ?auto_170095 ?auto_170100 ) ) ( not ( = ?auto_170102 ?auto_170098 ) ) ( not ( = ?auto_170102 ?auto_170100 ) ) ( not ( = ?auto_170098 ?auto_170100 ) ) ( ON ?auto_170098 ?auto_170102 ) ( ON-TABLE ?auto_170099 ) ( ON ?auto_170097 ?auto_170099 ) ( not ( = ?auto_170099 ?auto_170097 ) ) ( not ( = ?auto_170099 ?auto_170101 ) ) ( not ( = ?auto_170099 ?auto_170096 ) ) ( not ( = ?auto_170099 ?auto_170100 ) ) ( not ( = ?auto_170097 ?auto_170101 ) ) ( not ( = ?auto_170097 ?auto_170096 ) ) ( not ( = ?auto_170097 ?auto_170100 ) ) ( not ( = ?auto_170101 ?auto_170096 ) ) ( not ( = ?auto_170101 ?auto_170100 ) ) ( not ( = ?auto_170096 ?auto_170100 ) ) ( not ( = ?auto_170094 ?auto_170096 ) ) ( not ( = ?auto_170094 ?auto_170099 ) ) ( not ( = ?auto_170094 ?auto_170097 ) ) ( not ( = ?auto_170094 ?auto_170101 ) ) ( not ( = ?auto_170095 ?auto_170096 ) ) ( not ( = ?auto_170095 ?auto_170099 ) ) ( not ( = ?auto_170095 ?auto_170097 ) ) ( not ( = ?auto_170095 ?auto_170101 ) ) ( not ( = ?auto_170102 ?auto_170096 ) ) ( not ( = ?auto_170102 ?auto_170099 ) ) ( not ( = ?auto_170102 ?auto_170097 ) ) ( not ( = ?auto_170102 ?auto_170101 ) ) ( not ( = ?auto_170098 ?auto_170096 ) ) ( not ( = ?auto_170098 ?auto_170099 ) ) ( not ( = ?auto_170098 ?auto_170097 ) ) ( not ( = ?auto_170098 ?auto_170101 ) ) ( ON ?auto_170100 ?auto_170098 ) ( ON ?auto_170096 ?auto_170100 ) ( CLEAR ?auto_170096 ) ( HOLDING ?auto_170101 ) ( CLEAR ?auto_170097 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170099 ?auto_170097 ?auto_170101 )
      ( MAKE-2PILE ?auto_170094 ?auto_170095 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170103 - BLOCK
      ?auto_170104 - BLOCK
    )
    :vars
    (
      ?auto_170107 - BLOCK
      ?auto_170108 - BLOCK
      ?auto_170105 - BLOCK
      ?auto_170110 - BLOCK
      ?auto_170109 - BLOCK
      ?auto_170111 - BLOCK
      ?auto_170106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170107 ?auto_170104 ) ( ON-TABLE ?auto_170103 ) ( ON ?auto_170104 ?auto_170103 ) ( not ( = ?auto_170103 ?auto_170104 ) ) ( not ( = ?auto_170103 ?auto_170107 ) ) ( not ( = ?auto_170104 ?auto_170107 ) ) ( not ( = ?auto_170103 ?auto_170108 ) ) ( not ( = ?auto_170103 ?auto_170105 ) ) ( not ( = ?auto_170104 ?auto_170108 ) ) ( not ( = ?auto_170104 ?auto_170105 ) ) ( not ( = ?auto_170107 ?auto_170108 ) ) ( not ( = ?auto_170107 ?auto_170105 ) ) ( not ( = ?auto_170108 ?auto_170105 ) ) ( ON ?auto_170108 ?auto_170107 ) ( ON-TABLE ?auto_170110 ) ( ON ?auto_170109 ?auto_170110 ) ( not ( = ?auto_170110 ?auto_170109 ) ) ( not ( = ?auto_170110 ?auto_170111 ) ) ( not ( = ?auto_170110 ?auto_170106 ) ) ( not ( = ?auto_170110 ?auto_170105 ) ) ( not ( = ?auto_170109 ?auto_170111 ) ) ( not ( = ?auto_170109 ?auto_170106 ) ) ( not ( = ?auto_170109 ?auto_170105 ) ) ( not ( = ?auto_170111 ?auto_170106 ) ) ( not ( = ?auto_170111 ?auto_170105 ) ) ( not ( = ?auto_170106 ?auto_170105 ) ) ( not ( = ?auto_170103 ?auto_170106 ) ) ( not ( = ?auto_170103 ?auto_170110 ) ) ( not ( = ?auto_170103 ?auto_170109 ) ) ( not ( = ?auto_170103 ?auto_170111 ) ) ( not ( = ?auto_170104 ?auto_170106 ) ) ( not ( = ?auto_170104 ?auto_170110 ) ) ( not ( = ?auto_170104 ?auto_170109 ) ) ( not ( = ?auto_170104 ?auto_170111 ) ) ( not ( = ?auto_170107 ?auto_170106 ) ) ( not ( = ?auto_170107 ?auto_170110 ) ) ( not ( = ?auto_170107 ?auto_170109 ) ) ( not ( = ?auto_170107 ?auto_170111 ) ) ( not ( = ?auto_170108 ?auto_170106 ) ) ( not ( = ?auto_170108 ?auto_170110 ) ) ( not ( = ?auto_170108 ?auto_170109 ) ) ( not ( = ?auto_170108 ?auto_170111 ) ) ( ON ?auto_170105 ?auto_170108 ) ( ON ?auto_170106 ?auto_170105 ) ( CLEAR ?auto_170109 ) ( ON ?auto_170111 ?auto_170106 ) ( CLEAR ?auto_170111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170103 ?auto_170104 ?auto_170107 ?auto_170108 ?auto_170105 ?auto_170106 )
      ( MAKE-2PILE ?auto_170103 ?auto_170104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170112 - BLOCK
      ?auto_170113 - BLOCK
    )
    :vars
    (
      ?auto_170118 - BLOCK
      ?auto_170120 - BLOCK
      ?auto_170114 - BLOCK
      ?auto_170119 - BLOCK
      ?auto_170117 - BLOCK
      ?auto_170116 - BLOCK
      ?auto_170115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170118 ?auto_170113 ) ( ON-TABLE ?auto_170112 ) ( ON ?auto_170113 ?auto_170112 ) ( not ( = ?auto_170112 ?auto_170113 ) ) ( not ( = ?auto_170112 ?auto_170118 ) ) ( not ( = ?auto_170113 ?auto_170118 ) ) ( not ( = ?auto_170112 ?auto_170120 ) ) ( not ( = ?auto_170112 ?auto_170114 ) ) ( not ( = ?auto_170113 ?auto_170120 ) ) ( not ( = ?auto_170113 ?auto_170114 ) ) ( not ( = ?auto_170118 ?auto_170120 ) ) ( not ( = ?auto_170118 ?auto_170114 ) ) ( not ( = ?auto_170120 ?auto_170114 ) ) ( ON ?auto_170120 ?auto_170118 ) ( ON-TABLE ?auto_170119 ) ( not ( = ?auto_170119 ?auto_170117 ) ) ( not ( = ?auto_170119 ?auto_170116 ) ) ( not ( = ?auto_170119 ?auto_170115 ) ) ( not ( = ?auto_170119 ?auto_170114 ) ) ( not ( = ?auto_170117 ?auto_170116 ) ) ( not ( = ?auto_170117 ?auto_170115 ) ) ( not ( = ?auto_170117 ?auto_170114 ) ) ( not ( = ?auto_170116 ?auto_170115 ) ) ( not ( = ?auto_170116 ?auto_170114 ) ) ( not ( = ?auto_170115 ?auto_170114 ) ) ( not ( = ?auto_170112 ?auto_170115 ) ) ( not ( = ?auto_170112 ?auto_170119 ) ) ( not ( = ?auto_170112 ?auto_170117 ) ) ( not ( = ?auto_170112 ?auto_170116 ) ) ( not ( = ?auto_170113 ?auto_170115 ) ) ( not ( = ?auto_170113 ?auto_170119 ) ) ( not ( = ?auto_170113 ?auto_170117 ) ) ( not ( = ?auto_170113 ?auto_170116 ) ) ( not ( = ?auto_170118 ?auto_170115 ) ) ( not ( = ?auto_170118 ?auto_170119 ) ) ( not ( = ?auto_170118 ?auto_170117 ) ) ( not ( = ?auto_170118 ?auto_170116 ) ) ( not ( = ?auto_170120 ?auto_170115 ) ) ( not ( = ?auto_170120 ?auto_170119 ) ) ( not ( = ?auto_170120 ?auto_170117 ) ) ( not ( = ?auto_170120 ?auto_170116 ) ) ( ON ?auto_170114 ?auto_170120 ) ( ON ?auto_170115 ?auto_170114 ) ( ON ?auto_170116 ?auto_170115 ) ( CLEAR ?auto_170116 ) ( HOLDING ?auto_170117 ) ( CLEAR ?auto_170119 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170119 ?auto_170117 )
      ( MAKE-2PILE ?auto_170112 ?auto_170113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172139 - BLOCK
      ?auto_172140 - BLOCK
    )
    :vars
    (
      ?auto_172145 - BLOCK
      ?auto_172143 - BLOCK
      ?auto_172146 - BLOCK
      ?auto_172144 - BLOCK
      ?auto_172142 - BLOCK
      ?auto_172141 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172145 ?auto_172140 ) ( ON-TABLE ?auto_172139 ) ( ON ?auto_172140 ?auto_172139 ) ( not ( = ?auto_172139 ?auto_172140 ) ) ( not ( = ?auto_172139 ?auto_172145 ) ) ( not ( = ?auto_172140 ?auto_172145 ) ) ( not ( = ?auto_172139 ?auto_172143 ) ) ( not ( = ?auto_172139 ?auto_172146 ) ) ( not ( = ?auto_172140 ?auto_172143 ) ) ( not ( = ?auto_172140 ?auto_172146 ) ) ( not ( = ?auto_172145 ?auto_172143 ) ) ( not ( = ?auto_172145 ?auto_172146 ) ) ( not ( = ?auto_172143 ?auto_172146 ) ) ( ON ?auto_172143 ?auto_172145 ) ( not ( = ?auto_172144 ?auto_172142 ) ) ( not ( = ?auto_172144 ?auto_172141 ) ) ( not ( = ?auto_172144 ?auto_172146 ) ) ( not ( = ?auto_172142 ?auto_172141 ) ) ( not ( = ?auto_172142 ?auto_172146 ) ) ( not ( = ?auto_172141 ?auto_172146 ) ) ( not ( = ?auto_172139 ?auto_172141 ) ) ( not ( = ?auto_172139 ?auto_172144 ) ) ( not ( = ?auto_172139 ?auto_172142 ) ) ( not ( = ?auto_172140 ?auto_172141 ) ) ( not ( = ?auto_172140 ?auto_172144 ) ) ( not ( = ?auto_172140 ?auto_172142 ) ) ( not ( = ?auto_172145 ?auto_172141 ) ) ( not ( = ?auto_172145 ?auto_172144 ) ) ( not ( = ?auto_172145 ?auto_172142 ) ) ( not ( = ?auto_172143 ?auto_172141 ) ) ( not ( = ?auto_172143 ?auto_172144 ) ) ( not ( = ?auto_172143 ?auto_172142 ) ) ( ON ?auto_172146 ?auto_172143 ) ( ON ?auto_172141 ?auto_172146 ) ( ON ?auto_172142 ?auto_172141 ) ( ON ?auto_172144 ?auto_172142 ) ( CLEAR ?auto_172144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172139 ?auto_172140 ?auto_172145 ?auto_172143 ?auto_172146 ?auto_172141 ?auto_172142 )
      ( MAKE-2PILE ?auto_172139 ?auto_172140 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170130 - BLOCK
      ?auto_170131 - BLOCK
    )
    :vars
    (
      ?auto_170136 - BLOCK
      ?auto_170135 - BLOCK
      ?auto_170137 - BLOCK
      ?auto_170138 - BLOCK
      ?auto_170134 - BLOCK
      ?auto_170132 - BLOCK
      ?auto_170133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170136 ?auto_170131 ) ( ON-TABLE ?auto_170130 ) ( ON ?auto_170131 ?auto_170130 ) ( not ( = ?auto_170130 ?auto_170131 ) ) ( not ( = ?auto_170130 ?auto_170136 ) ) ( not ( = ?auto_170131 ?auto_170136 ) ) ( not ( = ?auto_170130 ?auto_170135 ) ) ( not ( = ?auto_170130 ?auto_170137 ) ) ( not ( = ?auto_170131 ?auto_170135 ) ) ( not ( = ?auto_170131 ?auto_170137 ) ) ( not ( = ?auto_170136 ?auto_170135 ) ) ( not ( = ?auto_170136 ?auto_170137 ) ) ( not ( = ?auto_170135 ?auto_170137 ) ) ( ON ?auto_170135 ?auto_170136 ) ( not ( = ?auto_170138 ?auto_170134 ) ) ( not ( = ?auto_170138 ?auto_170132 ) ) ( not ( = ?auto_170138 ?auto_170133 ) ) ( not ( = ?auto_170138 ?auto_170137 ) ) ( not ( = ?auto_170134 ?auto_170132 ) ) ( not ( = ?auto_170134 ?auto_170133 ) ) ( not ( = ?auto_170134 ?auto_170137 ) ) ( not ( = ?auto_170132 ?auto_170133 ) ) ( not ( = ?auto_170132 ?auto_170137 ) ) ( not ( = ?auto_170133 ?auto_170137 ) ) ( not ( = ?auto_170130 ?auto_170133 ) ) ( not ( = ?auto_170130 ?auto_170138 ) ) ( not ( = ?auto_170130 ?auto_170134 ) ) ( not ( = ?auto_170130 ?auto_170132 ) ) ( not ( = ?auto_170131 ?auto_170133 ) ) ( not ( = ?auto_170131 ?auto_170138 ) ) ( not ( = ?auto_170131 ?auto_170134 ) ) ( not ( = ?auto_170131 ?auto_170132 ) ) ( not ( = ?auto_170136 ?auto_170133 ) ) ( not ( = ?auto_170136 ?auto_170138 ) ) ( not ( = ?auto_170136 ?auto_170134 ) ) ( not ( = ?auto_170136 ?auto_170132 ) ) ( not ( = ?auto_170135 ?auto_170133 ) ) ( not ( = ?auto_170135 ?auto_170138 ) ) ( not ( = ?auto_170135 ?auto_170134 ) ) ( not ( = ?auto_170135 ?auto_170132 ) ) ( ON ?auto_170137 ?auto_170135 ) ( ON ?auto_170133 ?auto_170137 ) ( ON ?auto_170132 ?auto_170133 ) ( ON ?auto_170134 ?auto_170132 ) ( CLEAR ?auto_170134 ) ( HOLDING ?auto_170138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170138 )
      ( MAKE-2PILE ?auto_170130 ?auto_170131 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170139 - BLOCK
      ?auto_170140 - BLOCK
    )
    :vars
    (
      ?auto_170142 - BLOCK
      ?auto_170147 - BLOCK
      ?auto_170141 - BLOCK
      ?auto_170145 - BLOCK
      ?auto_170144 - BLOCK
      ?auto_170143 - BLOCK
      ?auto_170146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170142 ?auto_170140 ) ( ON-TABLE ?auto_170139 ) ( ON ?auto_170140 ?auto_170139 ) ( not ( = ?auto_170139 ?auto_170140 ) ) ( not ( = ?auto_170139 ?auto_170142 ) ) ( not ( = ?auto_170140 ?auto_170142 ) ) ( not ( = ?auto_170139 ?auto_170147 ) ) ( not ( = ?auto_170139 ?auto_170141 ) ) ( not ( = ?auto_170140 ?auto_170147 ) ) ( not ( = ?auto_170140 ?auto_170141 ) ) ( not ( = ?auto_170142 ?auto_170147 ) ) ( not ( = ?auto_170142 ?auto_170141 ) ) ( not ( = ?auto_170147 ?auto_170141 ) ) ( ON ?auto_170147 ?auto_170142 ) ( not ( = ?auto_170145 ?auto_170144 ) ) ( not ( = ?auto_170145 ?auto_170143 ) ) ( not ( = ?auto_170145 ?auto_170146 ) ) ( not ( = ?auto_170145 ?auto_170141 ) ) ( not ( = ?auto_170144 ?auto_170143 ) ) ( not ( = ?auto_170144 ?auto_170146 ) ) ( not ( = ?auto_170144 ?auto_170141 ) ) ( not ( = ?auto_170143 ?auto_170146 ) ) ( not ( = ?auto_170143 ?auto_170141 ) ) ( not ( = ?auto_170146 ?auto_170141 ) ) ( not ( = ?auto_170139 ?auto_170146 ) ) ( not ( = ?auto_170139 ?auto_170145 ) ) ( not ( = ?auto_170139 ?auto_170144 ) ) ( not ( = ?auto_170139 ?auto_170143 ) ) ( not ( = ?auto_170140 ?auto_170146 ) ) ( not ( = ?auto_170140 ?auto_170145 ) ) ( not ( = ?auto_170140 ?auto_170144 ) ) ( not ( = ?auto_170140 ?auto_170143 ) ) ( not ( = ?auto_170142 ?auto_170146 ) ) ( not ( = ?auto_170142 ?auto_170145 ) ) ( not ( = ?auto_170142 ?auto_170144 ) ) ( not ( = ?auto_170142 ?auto_170143 ) ) ( not ( = ?auto_170147 ?auto_170146 ) ) ( not ( = ?auto_170147 ?auto_170145 ) ) ( not ( = ?auto_170147 ?auto_170144 ) ) ( not ( = ?auto_170147 ?auto_170143 ) ) ( ON ?auto_170141 ?auto_170147 ) ( ON ?auto_170146 ?auto_170141 ) ( ON ?auto_170143 ?auto_170146 ) ( ON ?auto_170144 ?auto_170143 ) ( ON ?auto_170145 ?auto_170144 ) ( CLEAR ?auto_170145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170139 ?auto_170140 ?auto_170142 ?auto_170147 ?auto_170141 ?auto_170146 ?auto_170143 ?auto_170144 )
      ( MAKE-2PILE ?auto_170139 ?auto_170140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170155 - BLOCK
      ?auto_170156 - BLOCK
      ?auto_170157 - BLOCK
      ?auto_170158 - BLOCK
      ?auto_170159 - BLOCK
      ?auto_170160 - BLOCK
      ?auto_170161 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170161 ) ( CLEAR ?auto_170160 ) ( ON-TABLE ?auto_170155 ) ( ON ?auto_170156 ?auto_170155 ) ( ON ?auto_170157 ?auto_170156 ) ( ON ?auto_170158 ?auto_170157 ) ( ON ?auto_170159 ?auto_170158 ) ( ON ?auto_170160 ?auto_170159 ) ( not ( = ?auto_170155 ?auto_170156 ) ) ( not ( = ?auto_170155 ?auto_170157 ) ) ( not ( = ?auto_170155 ?auto_170158 ) ) ( not ( = ?auto_170155 ?auto_170159 ) ) ( not ( = ?auto_170155 ?auto_170160 ) ) ( not ( = ?auto_170155 ?auto_170161 ) ) ( not ( = ?auto_170156 ?auto_170157 ) ) ( not ( = ?auto_170156 ?auto_170158 ) ) ( not ( = ?auto_170156 ?auto_170159 ) ) ( not ( = ?auto_170156 ?auto_170160 ) ) ( not ( = ?auto_170156 ?auto_170161 ) ) ( not ( = ?auto_170157 ?auto_170158 ) ) ( not ( = ?auto_170157 ?auto_170159 ) ) ( not ( = ?auto_170157 ?auto_170160 ) ) ( not ( = ?auto_170157 ?auto_170161 ) ) ( not ( = ?auto_170158 ?auto_170159 ) ) ( not ( = ?auto_170158 ?auto_170160 ) ) ( not ( = ?auto_170158 ?auto_170161 ) ) ( not ( = ?auto_170159 ?auto_170160 ) ) ( not ( = ?auto_170159 ?auto_170161 ) ) ( not ( = ?auto_170160 ?auto_170161 ) ) )
    :subtasks
    ( ( !STACK ?auto_170161 ?auto_170160 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170162 - BLOCK
      ?auto_170163 - BLOCK
      ?auto_170164 - BLOCK
      ?auto_170165 - BLOCK
      ?auto_170166 - BLOCK
      ?auto_170167 - BLOCK
      ?auto_170168 - BLOCK
    )
    :vars
    (
      ?auto_170169 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170167 ) ( ON-TABLE ?auto_170162 ) ( ON ?auto_170163 ?auto_170162 ) ( ON ?auto_170164 ?auto_170163 ) ( ON ?auto_170165 ?auto_170164 ) ( ON ?auto_170166 ?auto_170165 ) ( ON ?auto_170167 ?auto_170166 ) ( not ( = ?auto_170162 ?auto_170163 ) ) ( not ( = ?auto_170162 ?auto_170164 ) ) ( not ( = ?auto_170162 ?auto_170165 ) ) ( not ( = ?auto_170162 ?auto_170166 ) ) ( not ( = ?auto_170162 ?auto_170167 ) ) ( not ( = ?auto_170162 ?auto_170168 ) ) ( not ( = ?auto_170163 ?auto_170164 ) ) ( not ( = ?auto_170163 ?auto_170165 ) ) ( not ( = ?auto_170163 ?auto_170166 ) ) ( not ( = ?auto_170163 ?auto_170167 ) ) ( not ( = ?auto_170163 ?auto_170168 ) ) ( not ( = ?auto_170164 ?auto_170165 ) ) ( not ( = ?auto_170164 ?auto_170166 ) ) ( not ( = ?auto_170164 ?auto_170167 ) ) ( not ( = ?auto_170164 ?auto_170168 ) ) ( not ( = ?auto_170165 ?auto_170166 ) ) ( not ( = ?auto_170165 ?auto_170167 ) ) ( not ( = ?auto_170165 ?auto_170168 ) ) ( not ( = ?auto_170166 ?auto_170167 ) ) ( not ( = ?auto_170166 ?auto_170168 ) ) ( not ( = ?auto_170167 ?auto_170168 ) ) ( ON ?auto_170168 ?auto_170169 ) ( CLEAR ?auto_170168 ) ( HAND-EMPTY ) ( not ( = ?auto_170162 ?auto_170169 ) ) ( not ( = ?auto_170163 ?auto_170169 ) ) ( not ( = ?auto_170164 ?auto_170169 ) ) ( not ( = ?auto_170165 ?auto_170169 ) ) ( not ( = ?auto_170166 ?auto_170169 ) ) ( not ( = ?auto_170167 ?auto_170169 ) ) ( not ( = ?auto_170168 ?auto_170169 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170168 ?auto_170169 )
      ( MAKE-7PILE ?auto_170162 ?auto_170163 ?auto_170164 ?auto_170165 ?auto_170166 ?auto_170167 ?auto_170168 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170170 - BLOCK
      ?auto_170171 - BLOCK
      ?auto_170172 - BLOCK
      ?auto_170173 - BLOCK
      ?auto_170174 - BLOCK
      ?auto_170175 - BLOCK
      ?auto_170176 - BLOCK
    )
    :vars
    (
      ?auto_170177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170170 ) ( ON ?auto_170171 ?auto_170170 ) ( ON ?auto_170172 ?auto_170171 ) ( ON ?auto_170173 ?auto_170172 ) ( ON ?auto_170174 ?auto_170173 ) ( not ( = ?auto_170170 ?auto_170171 ) ) ( not ( = ?auto_170170 ?auto_170172 ) ) ( not ( = ?auto_170170 ?auto_170173 ) ) ( not ( = ?auto_170170 ?auto_170174 ) ) ( not ( = ?auto_170170 ?auto_170175 ) ) ( not ( = ?auto_170170 ?auto_170176 ) ) ( not ( = ?auto_170171 ?auto_170172 ) ) ( not ( = ?auto_170171 ?auto_170173 ) ) ( not ( = ?auto_170171 ?auto_170174 ) ) ( not ( = ?auto_170171 ?auto_170175 ) ) ( not ( = ?auto_170171 ?auto_170176 ) ) ( not ( = ?auto_170172 ?auto_170173 ) ) ( not ( = ?auto_170172 ?auto_170174 ) ) ( not ( = ?auto_170172 ?auto_170175 ) ) ( not ( = ?auto_170172 ?auto_170176 ) ) ( not ( = ?auto_170173 ?auto_170174 ) ) ( not ( = ?auto_170173 ?auto_170175 ) ) ( not ( = ?auto_170173 ?auto_170176 ) ) ( not ( = ?auto_170174 ?auto_170175 ) ) ( not ( = ?auto_170174 ?auto_170176 ) ) ( not ( = ?auto_170175 ?auto_170176 ) ) ( ON ?auto_170176 ?auto_170177 ) ( CLEAR ?auto_170176 ) ( not ( = ?auto_170170 ?auto_170177 ) ) ( not ( = ?auto_170171 ?auto_170177 ) ) ( not ( = ?auto_170172 ?auto_170177 ) ) ( not ( = ?auto_170173 ?auto_170177 ) ) ( not ( = ?auto_170174 ?auto_170177 ) ) ( not ( = ?auto_170175 ?auto_170177 ) ) ( not ( = ?auto_170176 ?auto_170177 ) ) ( HOLDING ?auto_170175 ) ( CLEAR ?auto_170174 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170170 ?auto_170171 ?auto_170172 ?auto_170173 ?auto_170174 ?auto_170175 )
      ( MAKE-7PILE ?auto_170170 ?auto_170171 ?auto_170172 ?auto_170173 ?auto_170174 ?auto_170175 ?auto_170176 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170178 - BLOCK
      ?auto_170179 - BLOCK
      ?auto_170180 - BLOCK
      ?auto_170181 - BLOCK
      ?auto_170182 - BLOCK
      ?auto_170183 - BLOCK
      ?auto_170184 - BLOCK
    )
    :vars
    (
      ?auto_170185 - BLOCK
      ?auto_170186 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170178 ) ( ON ?auto_170179 ?auto_170178 ) ( ON ?auto_170180 ?auto_170179 ) ( ON ?auto_170181 ?auto_170180 ) ( ON ?auto_170182 ?auto_170181 ) ( not ( = ?auto_170178 ?auto_170179 ) ) ( not ( = ?auto_170178 ?auto_170180 ) ) ( not ( = ?auto_170178 ?auto_170181 ) ) ( not ( = ?auto_170178 ?auto_170182 ) ) ( not ( = ?auto_170178 ?auto_170183 ) ) ( not ( = ?auto_170178 ?auto_170184 ) ) ( not ( = ?auto_170179 ?auto_170180 ) ) ( not ( = ?auto_170179 ?auto_170181 ) ) ( not ( = ?auto_170179 ?auto_170182 ) ) ( not ( = ?auto_170179 ?auto_170183 ) ) ( not ( = ?auto_170179 ?auto_170184 ) ) ( not ( = ?auto_170180 ?auto_170181 ) ) ( not ( = ?auto_170180 ?auto_170182 ) ) ( not ( = ?auto_170180 ?auto_170183 ) ) ( not ( = ?auto_170180 ?auto_170184 ) ) ( not ( = ?auto_170181 ?auto_170182 ) ) ( not ( = ?auto_170181 ?auto_170183 ) ) ( not ( = ?auto_170181 ?auto_170184 ) ) ( not ( = ?auto_170182 ?auto_170183 ) ) ( not ( = ?auto_170182 ?auto_170184 ) ) ( not ( = ?auto_170183 ?auto_170184 ) ) ( ON ?auto_170184 ?auto_170185 ) ( not ( = ?auto_170178 ?auto_170185 ) ) ( not ( = ?auto_170179 ?auto_170185 ) ) ( not ( = ?auto_170180 ?auto_170185 ) ) ( not ( = ?auto_170181 ?auto_170185 ) ) ( not ( = ?auto_170182 ?auto_170185 ) ) ( not ( = ?auto_170183 ?auto_170185 ) ) ( not ( = ?auto_170184 ?auto_170185 ) ) ( CLEAR ?auto_170182 ) ( ON ?auto_170183 ?auto_170184 ) ( CLEAR ?auto_170183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170186 ) ( ON ?auto_170185 ?auto_170186 ) ( not ( = ?auto_170186 ?auto_170185 ) ) ( not ( = ?auto_170186 ?auto_170184 ) ) ( not ( = ?auto_170186 ?auto_170183 ) ) ( not ( = ?auto_170178 ?auto_170186 ) ) ( not ( = ?auto_170179 ?auto_170186 ) ) ( not ( = ?auto_170180 ?auto_170186 ) ) ( not ( = ?auto_170181 ?auto_170186 ) ) ( not ( = ?auto_170182 ?auto_170186 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170186 ?auto_170185 ?auto_170184 )
      ( MAKE-7PILE ?auto_170178 ?auto_170179 ?auto_170180 ?auto_170181 ?auto_170182 ?auto_170183 ?auto_170184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170187 - BLOCK
      ?auto_170188 - BLOCK
      ?auto_170189 - BLOCK
      ?auto_170190 - BLOCK
      ?auto_170191 - BLOCK
      ?auto_170192 - BLOCK
      ?auto_170193 - BLOCK
    )
    :vars
    (
      ?auto_170195 - BLOCK
      ?auto_170194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170187 ) ( ON ?auto_170188 ?auto_170187 ) ( ON ?auto_170189 ?auto_170188 ) ( ON ?auto_170190 ?auto_170189 ) ( not ( = ?auto_170187 ?auto_170188 ) ) ( not ( = ?auto_170187 ?auto_170189 ) ) ( not ( = ?auto_170187 ?auto_170190 ) ) ( not ( = ?auto_170187 ?auto_170191 ) ) ( not ( = ?auto_170187 ?auto_170192 ) ) ( not ( = ?auto_170187 ?auto_170193 ) ) ( not ( = ?auto_170188 ?auto_170189 ) ) ( not ( = ?auto_170188 ?auto_170190 ) ) ( not ( = ?auto_170188 ?auto_170191 ) ) ( not ( = ?auto_170188 ?auto_170192 ) ) ( not ( = ?auto_170188 ?auto_170193 ) ) ( not ( = ?auto_170189 ?auto_170190 ) ) ( not ( = ?auto_170189 ?auto_170191 ) ) ( not ( = ?auto_170189 ?auto_170192 ) ) ( not ( = ?auto_170189 ?auto_170193 ) ) ( not ( = ?auto_170190 ?auto_170191 ) ) ( not ( = ?auto_170190 ?auto_170192 ) ) ( not ( = ?auto_170190 ?auto_170193 ) ) ( not ( = ?auto_170191 ?auto_170192 ) ) ( not ( = ?auto_170191 ?auto_170193 ) ) ( not ( = ?auto_170192 ?auto_170193 ) ) ( ON ?auto_170193 ?auto_170195 ) ( not ( = ?auto_170187 ?auto_170195 ) ) ( not ( = ?auto_170188 ?auto_170195 ) ) ( not ( = ?auto_170189 ?auto_170195 ) ) ( not ( = ?auto_170190 ?auto_170195 ) ) ( not ( = ?auto_170191 ?auto_170195 ) ) ( not ( = ?auto_170192 ?auto_170195 ) ) ( not ( = ?auto_170193 ?auto_170195 ) ) ( ON ?auto_170192 ?auto_170193 ) ( CLEAR ?auto_170192 ) ( ON-TABLE ?auto_170194 ) ( ON ?auto_170195 ?auto_170194 ) ( not ( = ?auto_170194 ?auto_170195 ) ) ( not ( = ?auto_170194 ?auto_170193 ) ) ( not ( = ?auto_170194 ?auto_170192 ) ) ( not ( = ?auto_170187 ?auto_170194 ) ) ( not ( = ?auto_170188 ?auto_170194 ) ) ( not ( = ?auto_170189 ?auto_170194 ) ) ( not ( = ?auto_170190 ?auto_170194 ) ) ( not ( = ?auto_170191 ?auto_170194 ) ) ( HOLDING ?auto_170191 ) ( CLEAR ?auto_170190 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170187 ?auto_170188 ?auto_170189 ?auto_170190 ?auto_170191 )
      ( MAKE-7PILE ?auto_170187 ?auto_170188 ?auto_170189 ?auto_170190 ?auto_170191 ?auto_170192 ?auto_170193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170196 - BLOCK
      ?auto_170197 - BLOCK
      ?auto_170198 - BLOCK
      ?auto_170199 - BLOCK
      ?auto_170200 - BLOCK
      ?auto_170201 - BLOCK
      ?auto_170202 - BLOCK
    )
    :vars
    (
      ?auto_170203 - BLOCK
      ?auto_170204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170196 ) ( ON ?auto_170197 ?auto_170196 ) ( ON ?auto_170198 ?auto_170197 ) ( ON ?auto_170199 ?auto_170198 ) ( not ( = ?auto_170196 ?auto_170197 ) ) ( not ( = ?auto_170196 ?auto_170198 ) ) ( not ( = ?auto_170196 ?auto_170199 ) ) ( not ( = ?auto_170196 ?auto_170200 ) ) ( not ( = ?auto_170196 ?auto_170201 ) ) ( not ( = ?auto_170196 ?auto_170202 ) ) ( not ( = ?auto_170197 ?auto_170198 ) ) ( not ( = ?auto_170197 ?auto_170199 ) ) ( not ( = ?auto_170197 ?auto_170200 ) ) ( not ( = ?auto_170197 ?auto_170201 ) ) ( not ( = ?auto_170197 ?auto_170202 ) ) ( not ( = ?auto_170198 ?auto_170199 ) ) ( not ( = ?auto_170198 ?auto_170200 ) ) ( not ( = ?auto_170198 ?auto_170201 ) ) ( not ( = ?auto_170198 ?auto_170202 ) ) ( not ( = ?auto_170199 ?auto_170200 ) ) ( not ( = ?auto_170199 ?auto_170201 ) ) ( not ( = ?auto_170199 ?auto_170202 ) ) ( not ( = ?auto_170200 ?auto_170201 ) ) ( not ( = ?auto_170200 ?auto_170202 ) ) ( not ( = ?auto_170201 ?auto_170202 ) ) ( ON ?auto_170202 ?auto_170203 ) ( not ( = ?auto_170196 ?auto_170203 ) ) ( not ( = ?auto_170197 ?auto_170203 ) ) ( not ( = ?auto_170198 ?auto_170203 ) ) ( not ( = ?auto_170199 ?auto_170203 ) ) ( not ( = ?auto_170200 ?auto_170203 ) ) ( not ( = ?auto_170201 ?auto_170203 ) ) ( not ( = ?auto_170202 ?auto_170203 ) ) ( ON ?auto_170201 ?auto_170202 ) ( ON-TABLE ?auto_170204 ) ( ON ?auto_170203 ?auto_170204 ) ( not ( = ?auto_170204 ?auto_170203 ) ) ( not ( = ?auto_170204 ?auto_170202 ) ) ( not ( = ?auto_170204 ?auto_170201 ) ) ( not ( = ?auto_170196 ?auto_170204 ) ) ( not ( = ?auto_170197 ?auto_170204 ) ) ( not ( = ?auto_170198 ?auto_170204 ) ) ( not ( = ?auto_170199 ?auto_170204 ) ) ( not ( = ?auto_170200 ?auto_170204 ) ) ( CLEAR ?auto_170199 ) ( ON ?auto_170200 ?auto_170201 ) ( CLEAR ?auto_170200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170204 ?auto_170203 ?auto_170202 ?auto_170201 )
      ( MAKE-7PILE ?auto_170196 ?auto_170197 ?auto_170198 ?auto_170199 ?auto_170200 ?auto_170201 ?auto_170202 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170205 - BLOCK
      ?auto_170206 - BLOCK
      ?auto_170207 - BLOCK
      ?auto_170208 - BLOCK
      ?auto_170209 - BLOCK
      ?auto_170210 - BLOCK
      ?auto_170211 - BLOCK
    )
    :vars
    (
      ?auto_170213 - BLOCK
      ?auto_170212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170205 ) ( ON ?auto_170206 ?auto_170205 ) ( ON ?auto_170207 ?auto_170206 ) ( not ( = ?auto_170205 ?auto_170206 ) ) ( not ( = ?auto_170205 ?auto_170207 ) ) ( not ( = ?auto_170205 ?auto_170208 ) ) ( not ( = ?auto_170205 ?auto_170209 ) ) ( not ( = ?auto_170205 ?auto_170210 ) ) ( not ( = ?auto_170205 ?auto_170211 ) ) ( not ( = ?auto_170206 ?auto_170207 ) ) ( not ( = ?auto_170206 ?auto_170208 ) ) ( not ( = ?auto_170206 ?auto_170209 ) ) ( not ( = ?auto_170206 ?auto_170210 ) ) ( not ( = ?auto_170206 ?auto_170211 ) ) ( not ( = ?auto_170207 ?auto_170208 ) ) ( not ( = ?auto_170207 ?auto_170209 ) ) ( not ( = ?auto_170207 ?auto_170210 ) ) ( not ( = ?auto_170207 ?auto_170211 ) ) ( not ( = ?auto_170208 ?auto_170209 ) ) ( not ( = ?auto_170208 ?auto_170210 ) ) ( not ( = ?auto_170208 ?auto_170211 ) ) ( not ( = ?auto_170209 ?auto_170210 ) ) ( not ( = ?auto_170209 ?auto_170211 ) ) ( not ( = ?auto_170210 ?auto_170211 ) ) ( ON ?auto_170211 ?auto_170213 ) ( not ( = ?auto_170205 ?auto_170213 ) ) ( not ( = ?auto_170206 ?auto_170213 ) ) ( not ( = ?auto_170207 ?auto_170213 ) ) ( not ( = ?auto_170208 ?auto_170213 ) ) ( not ( = ?auto_170209 ?auto_170213 ) ) ( not ( = ?auto_170210 ?auto_170213 ) ) ( not ( = ?auto_170211 ?auto_170213 ) ) ( ON ?auto_170210 ?auto_170211 ) ( ON-TABLE ?auto_170212 ) ( ON ?auto_170213 ?auto_170212 ) ( not ( = ?auto_170212 ?auto_170213 ) ) ( not ( = ?auto_170212 ?auto_170211 ) ) ( not ( = ?auto_170212 ?auto_170210 ) ) ( not ( = ?auto_170205 ?auto_170212 ) ) ( not ( = ?auto_170206 ?auto_170212 ) ) ( not ( = ?auto_170207 ?auto_170212 ) ) ( not ( = ?auto_170208 ?auto_170212 ) ) ( not ( = ?auto_170209 ?auto_170212 ) ) ( ON ?auto_170209 ?auto_170210 ) ( CLEAR ?auto_170209 ) ( HOLDING ?auto_170208 ) ( CLEAR ?auto_170207 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170205 ?auto_170206 ?auto_170207 ?auto_170208 )
      ( MAKE-7PILE ?auto_170205 ?auto_170206 ?auto_170207 ?auto_170208 ?auto_170209 ?auto_170210 ?auto_170211 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170214 - BLOCK
      ?auto_170215 - BLOCK
      ?auto_170216 - BLOCK
      ?auto_170217 - BLOCK
      ?auto_170218 - BLOCK
      ?auto_170219 - BLOCK
      ?auto_170220 - BLOCK
    )
    :vars
    (
      ?auto_170221 - BLOCK
      ?auto_170222 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170214 ) ( ON ?auto_170215 ?auto_170214 ) ( ON ?auto_170216 ?auto_170215 ) ( not ( = ?auto_170214 ?auto_170215 ) ) ( not ( = ?auto_170214 ?auto_170216 ) ) ( not ( = ?auto_170214 ?auto_170217 ) ) ( not ( = ?auto_170214 ?auto_170218 ) ) ( not ( = ?auto_170214 ?auto_170219 ) ) ( not ( = ?auto_170214 ?auto_170220 ) ) ( not ( = ?auto_170215 ?auto_170216 ) ) ( not ( = ?auto_170215 ?auto_170217 ) ) ( not ( = ?auto_170215 ?auto_170218 ) ) ( not ( = ?auto_170215 ?auto_170219 ) ) ( not ( = ?auto_170215 ?auto_170220 ) ) ( not ( = ?auto_170216 ?auto_170217 ) ) ( not ( = ?auto_170216 ?auto_170218 ) ) ( not ( = ?auto_170216 ?auto_170219 ) ) ( not ( = ?auto_170216 ?auto_170220 ) ) ( not ( = ?auto_170217 ?auto_170218 ) ) ( not ( = ?auto_170217 ?auto_170219 ) ) ( not ( = ?auto_170217 ?auto_170220 ) ) ( not ( = ?auto_170218 ?auto_170219 ) ) ( not ( = ?auto_170218 ?auto_170220 ) ) ( not ( = ?auto_170219 ?auto_170220 ) ) ( ON ?auto_170220 ?auto_170221 ) ( not ( = ?auto_170214 ?auto_170221 ) ) ( not ( = ?auto_170215 ?auto_170221 ) ) ( not ( = ?auto_170216 ?auto_170221 ) ) ( not ( = ?auto_170217 ?auto_170221 ) ) ( not ( = ?auto_170218 ?auto_170221 ) ) ( not ( = ?auto_170219 ?auto_170221 ) ) ( not ( = ?auto_170220 ?auto_170221 ) ) ( ON ?auto_170219 ?auto_170220 ) ( ON-TABLE ?auto_170222 ) ( ON ?auto_170221 ?auto_170222 ) ( not ( = ?auto_170222 ?auto_170221 ) ) ( not ( = ?auto_170222 ?auto_170220 ) ) ( not ( = ?auto_170222 ?auto_170219 ) ) ( not ( = ?auto_170214 ?auto_170222 ) ) ( not ( = ?auto_170215 ?auto_170222 ) ) ( not ( = ?auto_170216 ?auto_170222 ) ) ( not ( = ?auto_170217 ?auto_170222 ) ) ( not ( = ?auto_170218 ?auto_170222 ) ) ( ON ?auto_170218 ?auto_170219 ) ( CLEAR ?auto_170216 ) ( ON ?auto_170217 ?auto_170218 ) ( CLEAR ?auto_170217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170222 ?auto_170221 ?auto_170220 ?auto_170219 ?auto_170218 )
      ( MAKE-7PILE ?auto_170214 ?auto_170215 ?auto_170216 ?auto_170217 ?auto_170218 ?auto_170219 ?auto_170220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170223 - BLOCK
      ?auto_170224 - BLOCK
      ?auto_170225 - BLOCK
      ?auto_170226 - BLOCK
      ?auto_170227 - BLOCK
      ?auto_170228 - BLOCK
      ?auto_170229 - BLOCK
    )
    :vars
    (
      ?auto_170230 - BLOCK
      ?auto_170231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170223 ) ( ON ?auto_170224 ?auto_170223 ) ( not ( = ?auto_170223 ?auto_170224 ) ) ( not ( = ?auto_170223 ?auto_170225 ) ) ( not ( = ?auto_170223 ?auto_170226 ) ) ( not ( = ?auto_170223 ?auto_170227 ) ) ( not ( = ?auto_170223 ?auto_170228 ) ) ( not ( = ?auto_170223 ?auto_170229 ) ) ( not ( = ?auto_170224 ?auto_170225 ) ) ( not ( = ?auto_170224 ?auto_170226 ) ) ( not ( = ?auto_170224 ?auto_170227 ) ) ( not ( = ?auto_170224 ?auto_170228 ) ) ( not ( = ?auto_170224 ?auto_170229 ) ) ( not ( = ?auto_170225 ?auto_170226 ) ) ( not ( = ?auto_170225 ?auto_170227 ) ) ( not ( = ?auto_170225 ?auto_170228 ) ) ( not ( = ?auto_170225 ?auto_170229 ) ) ( not ( = ?auto_170226 ?auto_170227 ) ) ( not ( = ?auto_170226 ?auto_170228 ) ) ( not ( = ?auto_170226 ?auto_170229 ) ) ( not ( = ?auto_170227 ?auto_170228 ) ) ( not ( = ?auto_170227 ?auto_170229 ) ) ( not ( = ?auto_170228 ?auto_170229 ) ) ( ON ?auto_170229 ?auto_170230 ) ( not ( = ?auto_170223 ?auto_170230 ) ) ( not ( = ?auto_170224 ?auto_170230 ) ) ( not ( = ?auto_170225 ?auto_170230 ) ) ( not ( = ?auto_170226 ?auto_170230 ) ) ( not ( = ?auto_170227 ?auto_170230 ) ) ( not ( = ?auto_170228 ?auto_170230 ) ) ( not ( = ?auto_170229 ?auto_170230 ) ) ( ON ?auto_170228 ?auto_170229 ) ( ON-TABLE ?auto_170231 ) ( ON ?auto_170230 ?auto_170231 ) ( not ( = ?auto_170231 ?auto_170230 ) ) ( not ( = ?auto_170231 ?auto_170229 ) ) ( not ( = ?auto_170231 ?auto_170228 ) ) ( not ( = ?auto_170223 ?auto_170231 ) ) ( not ( = ?auto_170224 ?auto_170231 ) ) ( not ( = ?auto_170225 ?auto_170231 ) ) ( not ( = ?auto_170226 ?auto_170231 ) ) ( not ( = ?auto_170227 ?auto_170231 ) ) ( ON ?auto_170227 ?auto_170228 ) ( ON ?auto_170226 ?auto_170227 ) ( CLEAR ?auto_170226 ) ( HOLDING ?auto_170225 ) ( CLEAR ?auto_170224 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170223 ?auto_170224 ?auto_170225 )
      ( MAKE-7PILE ?auto_170223 ?auto_170224 ?auto_170225 ?auto_170226 ?auto_170227 ?auto_170228 ?auto_170229 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170232 - BLOCK
      ?auto_170233 - BLOCK
      ?auto_170234 - BLOCK
      ?auto_170235 - BLOCK
      ?auto_170236 - BLOCK
      ?auto_170237 - BLOCK
      ?auto_170238 - BLOCK
    )
    :vars
    (
      ?auto_170239 - BLOCK
      ?auto_170240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170232 ) ( ON ?auto_170233 ?auto_170232 ) ( not ( = ?auto_170232 ?auto_170233 ) ) ( not ( = ?auto_170232 ?auto_170234 ) ) ( not ( = ?auto_170232 ?auto_170235 ) ) ( not ( = ?auto_170232 ?auto_170236 ) ) ( not ( = ?auto_170232 ?auto_170237 ) ) ( not ( = ?auto_170232 ?auto_170238 ) ) ( not ( = ?auto_170233 ?auto_170234 ) ) ( not ( = ?auto_170233 ?auto_170235 ) ) ( not ( = ?auto_170233 ?auto_170236 ) ) ( not ( = ?auto_170233 ?auto_170237 ) ) ( not ( = ?auto_170233 ?auto_170238 ) ) ( not ( = ?auto_170234 ?auto_170235 ) ) ( not ( = ?auto_170234 ?auto_170236 ) ) ( not ( = ?auto_170234 ?auto_170237 ) ) ( not ( = ?auto_170234 ?auto_170238 ) ) ( not ( = ?auto_170235 ?auto_170236 ) ) ( not ( = ?auto_170235 ?auto_170237 ) ) ( not ( = ?auto_170235 ?auto_170238 ) ) ( not ( = ?auto_170236 ?auto_170237 ) ) ( not ( = ?auto_170236 ?auto_170238 ) ) ( not ( = ?auto_170237 ?auto_170238 ) ) ( ON ?auto_170238 ?auto_170239 ) ( not ( = ?auto_170232 ?auto_170239 ) ) ( not ( = ?auto_170233 ?auto_170239 ) ) ( not ( = ?auto_170234 ?auto_170239 ) ) ( not ( = ?auto_170235 ?auto_170239 ) ) ( not ( = ?auto_170236 ?auto_170239 ) ) ( not ( = ?auto_170237 ?auto_170239 ) ) ( not ( = ?auto_170238 ?auto_170239 ) ) ( ON ?auto_170237 ?auto_170238 ) ( ON-TABLE ?auto_170240 ) ( ON ?auto_170239 ?auto_170240 ) ( not ( = ?auto_170240 ?auto_170239 ) ) ( not ( = ?auto_170240 ?auto_170238 ) ) ( not ( = ?auto_170240 ?auto_170237 ) ) ( not ( = ?auto_170232 ?auto_170240 ) ) ( not ( = ?auto_170233 ?auto_170240 ) ) ( not ( = ?auto_170234 ?auto_170240 ) ) ( not ( = ?auto_170235 ?auto_170240 ) ) ( not ( = ?auto_170236 ?auto_170240 ) ) ( ON ?auto_170236 ?auto_170237 ) ( ON ?auto_170235 ?auto_170236 ) ( CLEAR ?auto_170233 ) ( ON ?auto_170234 ?auto_170235 ) ( CLEAR ?auto_170234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170240 ?auto_170239 ?auto_170238 ?auto_170237 ?auto_170236 ?auto_170235 )
      ( MAKE-7PILE ?auto_170232 ?auto_170233 ?auto_170234 ?auto_170235 ?auto_170236 ?auto_170237 ?auto_170238 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170241 - BLOCK
      ?auto_170242 - BLOCK
      ?auto_170243 - BLOCK
      ?auto_170244 - BLOCK
      ?auto_170245 - BLOCK
      ?auto_170246 - BLOCK
      ?auto_170247 - BLOCK
    )
    :vars
    (
      ?auto_170249 - BLOCK
      ?auto_170248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170241 ) ( not ( = ?auto_170241 ?auto_170242 ) ) ( not ( = ?auto_170241 ?auto_170243 ) ) ( not ( = ?auto_170241 ?auto_170244 ) ) ( not ( = ?auto_170241 ?auto_170245 ) ) ( not ( = ?auto_170241 ?auto_170246 ) ) ( not ( = ?auto_170241 ?auto_170247 ) ) ( not ( = ?auto_170242 ?auto_170243 ) ) ( not ( = ?auto_170242 ?auto_170244 ) ) ( not ( = ?auto_170242 ?auto_170245 ) ) ( not ( = ?auto_170242 ?auto_170246 ) ) ( not ( = ?auto_170242 ?auto_170247 ) ) ( not ( = ?auto_170243 ?auto_170244 ) ) ( not ( = ?auto_170243 ?auto_170245 ) ) ( not ( = ?auto_170243 ?auto_170246 ) ) ( not ( = ?auto_170243 ?auto_170247 ) ) ( not ( = ?auto_170244 ?auto_170245 ) ) ( not ( = ?auto_170244 ?auto_170246 ) ) ( not ( = ?auto_170244 ?auto_170247 ) ) ( not ( = ?auto_170245 ?auto_170246 ) ) ( not ( = ?auto_170245 ?auto_170247 ) ) ( not ( = ?auto_170246 ?auto_170247 ) ) ( ON ?auto_170247 ?auto_170249 ) ( not ( = ?auto_170241 ?auto_170249 ) ) ( not ( = ?auto_170242 ?auto_170249 ) ) ( not ( = ?auto_170243 ?auto_170249 ) ) ( not ( = ?auto_170244 ?auto_170249 ) ) ( not ( = ?auto_170245 ?auto_170249 ) ) ( not ( = ?auto_170246 ?auto_170249 ) ) ( not ( = ?auto_170247 ?auto_170249 ) ) ( ON ?auto_170246 ?auto_170247 ) ( ON-TABLE ?auto_170248 ) ( ON ?auto_170249 ?auto_170248 ) ( not ( = ?auto_170248 ?auto_170249 ) ) ( not ( = ?auto_170248 ?auto_170247 ) ) ( not ( = ?auto_170248 ?auto_170246 ) ) ( not ( = ?auto_170241 ?auto_170248 ) ) ( not ( = ?auto_170242 ?auto_170248 ) ) ( not ( = ?auto_170243 ?auto_170248 ) ) ( not ( = ?auto_170244 ?auto_170248 ) ) ( not ( = ?auto_170245 ?auto_170248 ) ) ( ON ?auto_170245 ?auto_170246 ) ( ON ?auto_170244 ?auto_170245 ) ( ON ?auto_170243 ?auto_170244 ) ( CLEAR ?auto_170243 ) ( HOLDING ?auto_170242 ) ( CLEAR ?auto_170241 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170241 ?auto_170242 )
      ( MAKE-7PILE ?auto_170241 ?auto_170242 ?auto_170243 ?auto_170244 ?auto_170245 ?auto_170246 ?auto_170247 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170250 - BLOCK
      ?auto_170251 - BLOCK
      ?auto_170252 - BLOCK
      ?auto_170253 - BLOCK
      ?auto_170254 - BLOCK
      ?auto_170255 - BLOCK
      ?auto_170256 - BLOCK
    )
    :vars
    (
      ?auto_170258 - BLOCK
      ?auto_170257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170250 ) ( not ( = ?auto_170250 ?auto_170251 ) ) ( not ( = ?auto_170250 ?auto_170252 ) ) ( not ( = ?auto_170250 ?auto_170253 ) ) ( not ( = ?auto_170250 ?auto_170254 ) ) ( not ( = ?auto_170250 ?auto_170255 ) ) ( not ( = ?auto_170250 ?auto_170256 ) ) ( not ( = ?auto_170251 ?auto_170252 ) ) ( not ( = ?auto_170251 ?auto_170253 ) ) ( not ( = ?auto_170251 ?auto_170254 ) ) ( not ( = ?auto_170251 ?auto_170255 ) ) ( not ( = ?auto_170251 ?auto_170256 ) ) ( not ( = ?auto_170252 ?auto_170253 ) ) ( not ( = ?auto_170252 ?auto_170254 ) ) ( not ( = ?auto_170252 ?auto_170255 ) ) ( not ( = ?auto_170252 ?auto_170256 ) ) ( not ( = ?auto_170253 ?auto_170254 ) ) ( not ( = ?auto_170253 ?auto_170255 ) ) ( not ( = ?auto_170253 ?auto_170256 ) ) ( not ( = ?auto_170254 ?auto_170255 ) ) ( not ( = ?auto_170254 ?auto_170256 ) ) ( not ( = ?auto_170255 ?auto_170256 ) ) ( ON ?auto_170256 ?auto_170258 ) ( not ( = ?auto_170250 ?auto_170258 ) ) ( not ( = ?auto_170251 ?auto_170258 ) ) ( not ( = ?auto_170252 ?auto_170258 ) ) ( not ( = ?auto_170253 ?auto_170258 ) ) ( not ( = ?auto_170254 ?auto_170258 ) ) ( not ( = ?auto_170255 ?auto_170258 ) ) ( not ( = ?auto_170256 ?auto_170258 ) ) ( ON ?auto_170255 ?auto_170256 ) ( ON-TABLE ?auto_170257 ) ( ON ?auto_170258 ?auto_170257 ) ( not ( = ?auto_170257 ?auto_170258 ) ) ( not ( = ?auto_170257 ?auto_170256 ) ) ( not ( = ?auto_170257 ?auto_170255 ) ) ( not ( = ?auto_170250 ?auto_170257 ) ) ( not ( = ?auto_170251 ?auto_170257 ) ) ( not ( = ?auto_170252 ?auto_170257 ) ) ( not ( = ?auto_170253 ?auto_170257 ) ) ( not ( = ?auto_170254 ?auto_170257 ) ) ( ON ?auto_170254 ?auto_170255 ) ( ON ?auto_170253 ?auto_170254 ) ( ON ?auto_170252 ?auto_170253 ) ( CLEAR ?auto_170250 ) ( ON ?auto_170251 ?auto_170252 ) ( CLEAR ?auto_170251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170257 ?auto_170258 ?auto_170256 ?auto_170255 ?auto_170254 ?auto_170253 ?auto_170252 )
      ( MAKE-7PILE ?auto_170250 ?auto_170251 ?auto_170252 ?auto_170253 ?auto_170254 ?auto_170255 ?auto_170256 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170259 - BLOCK
      ?auto_170260 - BLOCK
      ?auto_170261 - BLOCK
      ?auto_170262 - BLOCK
      ?auto_170263 - BLOCK
      ?auto_170264 - BLOCK
      ?auto_170265 - BLOCK
    )
    :vars
    (
      ?auto_170266 - BLOCK
      ?auto_170267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170259 ?auto_170260 ) ) ( not ( = ?auto_170259 ?auto_170261 ) ) ( not ( = ?auto_170259 ?auto_170262 ) ) ( not ( = ?auto_170259 ?auto_170263 ) ) ( not ( = ?auto_170259 ?auto_170264 ) ) ( not ( = ?auto_170259 ?auto_170265 ) ) ( not ( = ?auto_170260 ?auto_170261 ) ) ( not ( = ?auto_170260 ?auto_170262 ) ) ( not ( = ?auto_170260 ?auto_170263 ) ) ( not ( = ?auto_170260 ?auto_170264 ) ) ( not ( = ?auto_170260 ?auto_170265 ) ) ( not ( = ?auto_170261 ?auto_170262 ) ) ( not ( = ?auto_170261 ?auto_170263 ) ) ( not ( = ?auto_170261 ?auto_170264 ) ) ( not ( = ?auto_170261 ?auto_170265 ) ) ( not ( = ?auto_170262 ?auto_170263 ) ) ( not ( = ?auto_170262 ?auto_170264 ) ) ( not ( = ?auto_170262 ?auto_170265 ) ) ( not ( = ?auto_170263 ?auto_170264 ) ) ( not ( = ?auto_170263 ?auto_170265 ) ) ( not ( = ?auto_170264 ?auto_170265 ) ) ( ON ?auto_170265 ?auto_170266 ) ( not ( = ?auto_170259 ?auto_170266 ) ) ( not ( = ?auto_170260 ?auto_170266 ) ) ( not ( = ?auto_170261 ?auto_170266 ) ) ( not ( = ?auto_170262 ?auto_170266 ) ) ( not ( = ?auto_170263 ?auto_170266 ) ) ( not ( = ?auto_170264 ?auto_170266 ) ) ( not ( = ?auto_170265 ?auto_170266 ) ) ( ON ?auto_170264 ?auto_170265 ) ( ON-TABLE ?auto_170267 ) ( ON ?auto_170266 ?auto_170267 ) ( not ( = ?auto_170267 ?auto_170266 ) ) ( not ( = ?auto_170267 ?auto_170265 ) ) ( not ( = ?auto_170267 ?auto_170264 ) ) ( not ( = ?auto_170259 ?auto_170267 ) ) ( not ( = ?auto_170260 ?auto_170267 ) ) ( not ( = ?auto_170261 ?auto_170267 ) ) ( not ( = ?auto_170262 ?auto_170267 ) ) ( not ( = ?auto_170263 ?auto_170267 ) ) ( ON ?auto_170263 ?auto_170264 ) ( ON ?auto_170262 ?auto_170263 ) ( ON ?auto_170261 ?auto_170262 ) ( ON ?auto_170260 ?auto_170261 ) ( CLEAR ?auto_170260 ) ( HOLDING ?auto_170259 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170259 )
      ( MAKE-7PILE ?auto_170259 ?auto_170260 ?auto_170261 ?auto_170262 ?auto_170263 ?auto_170264 ?auto_170265 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_170268 - BLOCK
      ?auto_170269 - BLOCK
      ?auto_170270 - BLOCK
      ?auto_170271 - BLOCK
      ?auto_170272 - BLOCK
      ?auto_170273 - BLOCK
      ?auto_170274 - BLOCK
    )
    :vars
    (
      ?auto_170276 - BLOCK
      ?auto_170275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170268 ?auto_170269 ) ) ( not ( = ?auto_170268 ?auto_170270 ) ) ( not ( = ?auto_170268 ?auto_170271 ) ) ( not ( = ?auto_170268 ?auto_170272 ) ) ( not ( = ?auto_170268 ?auto_170273 ) ) ( not ( = ?auto_170268 ?auto_170274 ) ) ( not ( = ?auto_170269 ?auto_170270 ) ) ( not ( = ?auto_170269 ?auto_170271 ) ) ( not ( = ?auto_170269 ?auto_170272 ) ) ( not ( = ?auto_170269 ?auto_170273 ) ) ( not ( = ?auto_170269 ?auto_170274 ) ) ( not ( = ?auto_170270 ?auto_170271 ) ) ( not ( = ?auto_170270 ?auto_170272 ) ) ( not ( = ?auto_170270 ?auto_170273 ) ) ( not ( = ?auto_170270 ?auto_170274 ) ) ( not ( = ?auto_170271 ?auto_170272 ) ) ( not ( = ?auto_170271 ?auto_170273 ) ) ( not ( = ?auto_170271 ?auto_170274 ) ) ( not ( = ?auto_170272 ?auto_170273 ) ) ( not ( = ?auto_170272 ?auto_170274 ) ) ( not ( = ?auto_170273 ?auto_170274 ) ) ( ON ?auto_170274 ?auto_170276 ) ( not ( = ?auto_170268 ?auto_170276 ) ) ( not ( = ?auto_170269 ?auto_170276 ) ) ( not ( = ?auto_170270 ?auto_170276 ) ) ( not ( = ?auto_170271 ?auto_170276 ) ) ( not ( = ?auto_170272 ?auto_170276 ) ) ( not ( = ?auto_170273 ?auto_170276 ) ) ( not ( = ?auto_170274 ?auto_170276 ) ) ( ON ?auto_170273 ?auto_170274 ) ( ON-TABLE ?auto_170275 ) ( ON ?auto_170276 ?auto_170275 ) ( not ( = ?auto_170275 ?auto_170276 ) ) ( not ( = ?auto_170275 ?auto_170274 ) ) ( not ( = ?auto_170275 ?auto_170273 ) ) ( not ( = ?auto_170268 ?auto_170275 ) ) ( not ( = ?auto_170269 ?auto_170275 ) ) ( not ( = ?auto_170270 ?auto_170275 ) ) ( not ( = ?auto_170271 ?auto_170275 ) ) ( not ( = ?auto_170272 ?auto_170275 ) ) ( ON ?auto_170272 ?auto_170273 ) ( ON ?auto_170271 ?auto_170272 ) ( ON ?auto_170270 ?auto_170271 ) ( ON ?auto_170269 ?auto_170270 ) ( ON ?auto_170268 ?auto_170269 ) ( CLEAR ?auto_170268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170275 ?auto_170276 ?auto_170274 ?auto_170273 ?auto_170272 ?auto_170271 ?auto_170270 ?auto_170269 )
      ( MAKE-7PILE ?auto_170268 ?auto_170269 ?auto_170270 ?auto_170271 ?auto_170272 ?auto_170273 ?auto_170274 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170278 - BLOCK
    )
    :vars
    (
      ?auto_170279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170279 ?auto_170278 ) ( CLEAR ?auto_170279 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170278 ) ( not ( = ?auto_170278 ?auto_170279 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170279 ?auto_170278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170280 - BLOCK
    )
    :vars
    (
      ?auto_170281 - BLOCK
      ?auto_170282 - BLOCK
      ?auto_170283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170281 ?auto_170280 ) ( CLEAR ?auto_170281 ) ( ON-TABLE ?auto_170280 ) ( not ( = ?auto_170280 ?auto_170281 ) ) ( HOLDING ?auto_170282 ) ( CLEAR ?auto_170283 ) ( not ( = ?auto_170280 ?auto_170282 ) ) ( not ( = ?auto_170280 ?auto_170283 ) ) ( not ( = ?auto_170281 ?auto_170282 ) ) ( not ( = ?auto_170281 ?auto_170283 ) ) ( not ( = ?auto_170282 ?auto_170283 ) ) )
    :subtasks
    ( ( !STACK ?auto_170282 ?auto_170283 )
      ( MAKE-1PILE ?auto_170280 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170284 - BLOCK
    )
    :vars
    (
      ?auto_170285 - BLOCK
      ?auto_170286 - BLOCK
      ?auto_170287 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170285 ?auto_170284 ) ( ON-TABLE ?auto_170284 ) ( not ( = ?auto_170284 ?auto_170285 ) ) ( CLEAR ?auto_170286 ) ( not ( = ?auto_170284 ?auto_170287 ) ) ( not ( = ?auto_170284 ?auto_170286 ) ) ( not ( = ?auto_170285 ?auto_170287 ) ) ( not ( = ?auto_170285 ?auto_170286 ) ) ( not ( = ?auto_170287 ?auto_170286 ) ) ( ON ?auto_170287 ?auto_170285 ) ( CLEAR ?auto_170287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170284 ?auto_170285 )
      ( MAKE-1PILE ?auto_170284 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170288 - BLOCK
    )
    :vars
    (
      ?auto_170289 - BLOCK
      ?auto_170291 - BLOCK
      ?auto_170290 - BLOCK
      ?auto_170292 - BLOCK
      ?auto_170296 - BLOCK
      ?auto_170293 - BLOCK
      ?auto_170295 - BLOCK
      ?auto_170294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170289 ?auto_170288 ) ( ON-TABLE ?auto_170288 ) ( not ( = ?auto_170288 ?auto_170289 ) ) ( not ( = ?auto_170288 ?auto_170291 ) ) ( not ( = ?auto_170288 ?auto_170290 ) ) ( not ( = ?auto_170289 ?auto_170291 ) ) ( not ( = ?auto_170289 ?auto_170290 ) ) ( not ( = ?auto_170291 ?auto_170290 ) ) ( ON ?auto_170291 ?auto_170289 ) ( CLEAR ?auto_170291 ) ( HOLDING ?auto_170290 ) ( CLEAR ?auto_170292 ) ( ON-TABLE ?auto_170296 ) ( ON ?auto_170293 ?auto_170296 ) ( ON ?auto_170295 ?auto_170293 ) ( ON ?auto_170294 ?auto_170295 ) ( ON ?auto_170292 ?auto_170294 ) ( not ( = ?auto_170296 ?auto_170293 ) ) ( not ( = ?auto_170296 ?auto_170295 ) ) ( not ( = ?auto_170296 ?auto_170294 ) ) ( not ( = ?auto_170296 ?auto_170292 ) ) ( not ( = ?auto_170296 ?auto_170290 ) ) ( not ( = ?auto_170293 ?auto_170295 ) ) ( not ( = ?auto_170293 ?auto_170294 ) ) ( not ( = ?auto_170293 ?auto_170292 ) ) ( not ( = ?auto_170293 ?auto_170290 ) ) ( not ( = ?auto_170295 ?auto_170294 ) ) ( not ( = ?auto_170295 ?auto_170292 ) ) ( not ( = ?auto_170295 ?auto_170290 ) ) ( not ( = ?auto_170294 ?auto_170292 ) ) ( not ( = ?auto_170294 ?auto_170290 ) ) ( not ( = ?auto_170292 ?auto_170290 ) ) ( not ( = ?auto_170288 ?auto_170292 ) ) ( not ( = ?auto_170288 ?auto_170296 ) ) ( not ( = ?auto_170288 ?auto_170293 ) ) ( not ( = ?auto_170288 ?auto_170295 ) ) ( not ( = ?auto_170288 ?auto_170294 ) ) ( not ( = ?auto_170289 ?auto_170292 ) ) ( not ( = ?auto_170289 ?auto_170296 ) ) ( not ( = ?auto_170289 ?auto_170293 ) ) ( not ( = ?auto_170289 ?auto_170295 ) ) ( not ( = ?auto_170289 ?auto_170294 ) ) ( not ( = ?auto_170291 ?auto_170292 ) ) ( not ( = ?auto_170291 ?auto_170296 ) ) ( not ( = ?auto_170291 ?auto_170293 ) ) ( not ( = ?auto_170291 ?auto_170295 ) ) ( not ( = ?auto_170291 ?auto_170294 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170296 ?auto_170293 ?auto_170295 ?auto_170294 ?auto_170292 ?auto_170290 )
      ( MAKE-1PILE ?auto_170288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170297 - BLOCK
    )
    :vars
    (
      ?auto_170300 - BLOCK
      ?auto_170305 - BLOCK
      ?auto_170304 - BLOCK
      ?auto_170302 - BLOCK
      ?auto_170298 - BLOCK
      ?auto_170301 - BLOCK
      ?auto_170303 - BLOCK
      ?auto_170299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170300 ?auto_170297 ) ( ON-TABLE ?auto_170297 ) ( not ( = ?auto_170297 ?auto_170300 ) ) ( not ( = ?auto_170297 ?auto_170305 ) ) ( not ( = ?auto_170297 ?auto_170304 ) ) ( not ( = ?auto_170300 ?auto_170305 ) ) ( not ( = ?auto_170300 ?auto_170304 ) ) ( not ( = ?auto_170305 ?auto_170304 ) ) ( ON ?auto_170305 ?auto_170300 ) ( CLEAR ?auto_170302 ) ( ON-TABLE ?auto_170298 ) ( ON ?auto_170301 ?auto_170298 ) ( ON ?auto_170303 ?auto_170301 ) ( ON ?auto_170299 ?auto_170303 ) ( ON ?auto_170302 ?auto_170299 ) ( not ( = ?auto_170298 ?auto_170301 ) ) ( not ( = ?auto_170298 ?auto_170303 ) ) ( not ( = ?auto_170298 ?auto_170299 ) ) ( not ( = ?auto_170298 ?auto_170302 ) ) ( not ( = ?auto_170298 ?auto_170304 ) ) ( not ( = ?auto_170301 ?auto_170303 ) ) ( not ( = ?auto_170301 ?auto_170299 ) ) ( not ( = ?auto_170301 ?auto_170302 ) ) ( not ( = ?auto_170301 ?auto_170304 ) ) ( not ( = ?auto_170303 ?auto_170299 ) ) ( not ( = ?auto_170303 ?auto_170302 ) ) ( not ( = ?auto_170303 ?auto_170304 ) ) ( not ( = ?auto_170299 ?auto_170302 ) ) ( not ( = ?auto_170299 ?auto_170304 ) ) ( not ( = ?auto_170302 ?auto_170304 ) ) ( not ( = ?auto_170297 ?auto_170302 ) ) ( not ( = ?auto_170297 ?auto_170298 ) ) ( not ( = ?auto_170297 ?auto_170301 ) ) ( not ( = ?auto_170297 ?auto_170303 ) ) ( not ( = ?auto_170297 ?auto_170299 ) ) ( not ( = ?auto_170300 ?auto_170302 ) ) ( not ( = ?auto_170300 ?auto_170298 ) ) ( not ( = ?auto_170300 ?auto_170301 ) ) ( not ( = ?auto_170300 ?auto_170303 ) ) ( not ( = ?auto_170300 ?auto_170299 ) ) ( not ( = ?auto_170305 ?auto_170302 ) ) ( not ( = ?auto_170305 ?auto_170298 ) ) ( not ( = ?auto_170305 ?auto_170301 ) ) ( not ( = ?auto_170305 ?auto_170303 ) ) ( not ( = ?auto_170305 ?auto_170299 ) ) ( ON ?auto_170304 ?auto_170305 ) ( CLEAR ?auto_170304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170297 ?auto_170300 ?auto_170305 )
      ( MAKE-1PILE ?auto_170297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170306 - BLOCK
    )
    :vars
    (
      ?auto_170309 - BLOCK
      ?auto_170314 - BLOCK
      ?auto_170311 - BLOCK
      ?auto_170313 - BLOCK
      ?auto_170307 - BLOCK
      ?auto_170310 - BLOCK
      ?auto_170308 - BLOCK
      ?auto_170312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170309 ?auto_170306 ) ( ON-TABLE ?auto_170306 ) ( not ( = ?auto_170306 ?auto_170309 ) ) ( not ( = ?auto_170306 ?auto_170314 ) ) ( not ( = ?auto_170306 ?auto_170311 ) ) ( not ( = ?auto_170309 ?auto_170314 ) ) ( not ( = ?auto_170309 ?auto_170311 ) ) ( not ( = ?auto_170314 ?auto_170311 ) ) ( ON ?auto_170314 ?auto_170309 ) ( ON-TABLE ?auto_170313 ) ( ON ?auto_170307 ?auto_170313 ) ( ON ?auto_170310 ?auto_170307 ) ( ON ?auto_170308 ?auto_170310 ) ( not ( = ?auto_170313 ?auto_170307 ) ) ( not ( = ?auto_170313 ?auto_170310 ) ) ( not ( = ?auto_170313 ?auto_170308 ) ) ( not ( = ?auto_170313 ?auto_170312 ) ) ( not ( = ?auto_170313 ?auto_170311 ) ) ( not ( = ?auto_170307 ?auto_170310 ) ) ( not ( = ?auto_170307 ?auto_170308 ) ) ( not ( = ?auto_170307 ?auto_170312 ) ) ( not ( = ?auto_170307 ?auto_170311 ) ) ( not ( = ?auto_170310 ?auto_170308 ) ) ( not ( = ?auto_170310 ?auto_170312 ) ) ( not ( = ?auto_170310 ?auto_170311 ) ) ( not ( = ?auto_170308 ?auto_170312 ) ) ( not ( = ?auto_170308 ?auto_170311 ) ) ( not ( = ?auto_170312 ?auto_170311 ) ) ( not ( = ?auto_170306 ?auto_170312 ) ) ( not ( = ?auto_170306 ?auto_170313 ) ) ( not ( = ?auto_170306 ?auto_170307 ) ) ( not ( = ?auto_170306 ?auto_170310 ) ) ( not ( = ?auto_170306 ?auto_170308 ) ) ( not ( = ?auto_170309 ?auto_170312 ) ) ( not ( = ?auto_170309 ?auto_170313 ) ) ( not ( = ?auto_170309 ?auto_170307 ) ) ( not ( = ?auto_170309 ?auto_170310 ) ) ( not ( = ?auto_170309 ?auto_170308 ) ) ( not ( = ?auto_170314 ?auto_170312 ) ) ( not ( = ?auto_170314 ?auto_170313 ) ) ( not ( = ?auto_170314 ?auto_170307 ) ) ( not ( = ?auto_170314 ?auto_170310 ) ) ( not ( = ?auto_170314 ?auto_170308 ) ) ( ON ?auto_170311 ?auto_170314 ) ( CLEAR ?auto_170311 ) ( HOLDING ?auto_170312 ) ( CLEAR ?auto_170308 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170313 ?auto_170307 ?auto_170310 ?auto_170308 ?auto_170312 )
      ( MAKE-1PILE ?auto_170306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170315 - BLOCK
    )
    :vars
    (
      ?auto_170322 - BLOCK
      ?auto_170317 - BLOCK
      ?auto_170316 - BLOCK
      ?auto_170318 - BLOCK
      ?auto_170319 - BLOCK
      ?auto_170320 - BLOCK
      ?auto_170321 - BLOCK
      ?auto_170323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170322 ?auto_170315 ) ( ON-TABLE ?auto_170315 ) ( not ( = ?auto_170315 ?auto_170322 ) ) ( not ( = ?auto_170315 ?auto_170317 ) ) ( not ( = ?auto_170315 ?auto_170316 ) ) ( not ( = ?auto_170322 ?auto_170317 ) ) ( not ( = ?auto_170322 ?auto_170316 ) ) ( not ( = ?auto_170317 ?auto_170316 ) ) ( ON ?auto_170317 ?auto_170322 ) ( ON-TABLE ?auto_170318 ) ( ON ?auto_170319 ?auto_170318 ) ( ON ?auto_170320 ?auto_170319 ) ( ON ?auto_170321 ?auto_170320 ) ( not ( = ?auto_170318 ?auto_170319 ) ) ( not ( = ?auto_170318 ?auto_170320 ) ) ( not ( = ?auto_170318 ?auto_170321 ) ) ( not ( = ?auto_170318 ?auto_170323 ) ) ( not ( = ?auto_170318 ?auto_170316 ) ) ( not ( = ?auto_170319 ?auto_170320 ) ) ( not ( = ?auto_170319 ?auto_170321 ) ) ( not ( = ?auto_170319 ?auto_170323 ) ) ( not ( = ?auto_170319 ?auto_170316 ) ) ( not ( = ?auto_170320 ?auto_170321 ) ) ( not ( = ?auto_170320 ?auto_170323 ) ) ( not ( = ?auto_170320 ?auto_170316 ) ) ( not ( = ?auto_170321 ?auto_170323 ) ) ( not ( = ?auto_170321 ?auto_170316 ) ) ( not ( = ?auto_170323 ?auto_170316 ) ) ( not ( = ?auto_170315 ?auto_170323 ) ) ( not ( = ?auto_170315 ?auto_170318 ) ) ( not ( = ?auto_170315 ?auto_170319 ) ) ( not ( = ?auto_170315 ?auto_170320 ) ) ( not ( = ?auto_170315 ?auto_170321 ) ) ( not ( = ?auto_170322 ?auto_170323 ) ) ( not ( = ?auto_170322 ?auto_170318 ) ) ( not ( = ?auto_170322 ?auto_170319 ) ) ( not ( = ?auto_170322 ?auto_170320 ) ) ( not ( = ?auto_170322 ?auto_170321 ) ) ( not ( = ?auto_170317 ?auto_170323 ) ) ( not ( = ?auto_170317 ?auto_170318 ) ) ( not ( = ?auto_170317 ?auto_170319 ) ) ( not ( = ?auto_170317 ?auto_170320 ) ) ( not ( = ?auto_170317 ?auto_170321 ) ) ( ON ?auto_170316 ?auto_170317 ) ( CLEAR ?auto_170321 ) ( ON ?auto_170323 ?auto_170316 ) ( CLEAR ?auto_170323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170315 ?auto_170322 ?auto_170317 ?auto_170316 )
      ( MAKE-1PILE ?auto_170315 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170324 - BLOCK
    )
    :vars
    (
      ?auto_170325 - BLOCK
      ?auto_170328 - BLOCK
      ?auto_170329 - BLOCK
      ?auto_170327 - BLOCK
      ?auto_170330 - BLOCK
      ?auto_170331 - BLOCK
      ?auto_170332 - BLOCK
      ?auto_170326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170325 ?auto_170324 ) ( ON-TABLE ?auto_170324 ) ( not ( = ?auto_170324 ?auto_170325 ) ) ( not ( = ?auto_170324 ?auto_170328 ) ) ( not ( = ?auto_170324 ?auto_170329 ) ) ( not ( = ?auto_170325 ?auto_170328 ) ) ( not ( = ?auto_170325 ?auto_170329 ) ) ( not ( = ?auto_170328 ?auto_170329 ) ) ( ON ?auto_170328 ?auto_170325 ) ( ON-TABLE ?auto_170327 ) ( ON ?auto_170330 ?auto_170327 ) ( ON ?auto_170331 ?auto_170330 ) ( not ( = ?auto_170327 ?auto_170330 ) ) ( not ( = ?auto_170327 ?auto_170331 ) ) ( not ( = ?auto_170327 ?auto_170332 ) ) ( not ( = ?auto_170327 ?auto_170326 ) ) ( not ( = ?auto_170327 ?auto_170329 ) ) ( not ( = ?auto_170330 ?auto_170331 ) ) ( not ( = ?auto_170330 ?auto_170332 ) ) ( not ( = ?auto_170330 ?auto_170326 ) ) ( not ( = ?auto_170330 ?auto_170329 ) ) ( not ( = ?auto_170331 ?auto_170332 ) ) ( not ( = ?auto_170331 ?auto_170326 ) ) ( not ( = ?auto_170331 ?auto_170329 ) ) ( not ( = ?auto_170332 ?auto_170326 ) ) ( not ( = ?auto_170332 ?auto_170329 ) ) ( not ( = ?auto_170326 ?auto_170329 ) ) ( not ( = ?auto_170324 ?auto_170326 ) ) ( not ( = ?auto_170324 ?auto_170327 ) ) ( not ( = ?auto_170324 ?auto_170330 ) ) ( not ( = ?auto_170324 ?auto_170331 ) ) ( not ( = ?auto_170324 ?auto_170332 ) ) ( not ( = ?auto_170325 ?auto_170326 ) ) ( not ( = ?auto_170325 ?auto_170327 ) ) ( not ( = ?auto_170325 ?auto_170330 ) ) ( not ( = ?auto_170325 ?auto_170331 ) ) ( not ( = ?auto_170325 ?auto_170332 ) ) ( not ( = ?auto_170328 ?auto_170326 ) ) ( not ( = ?auto_170328 ?auto_170327 ) ) ( not ( = ?auto_170328 ?auto_170330 ) ) ( not ( = ?auto_170328 ?auto_170331 ) ) ( not ( = ?auto_170328 ?auto_170332 ) ) ( ON ?auto_170329 ?auto_170328 ) ( ON ?auto_170326 ?auto_170329 ) ( CLEAR ?auto_170326 ) ( HOLDING ?auto_170332 ) ( CLEAR ?auto_170331 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170327 ?auto_170330 ?auto_170331 ?auto_170332 )
      ( MAKE-1PILE ?auto_170324 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170333 - BLOCK
    )
    :vars
    (
      ?auto_170336 - BLOCK
      ?auto_170341 - BLOCK
      ?auto_170335 - BLOCK
      ?auto_170338 - BLOCK
      ?auto_170334 - BLOCK
      ?auto_170337 - BLOCK
      ?auto_170339 - BLOCK
      ?auto_170340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170336 ?auto_170333 ) ( ON-TABLE ?auto_170333 ) ( not ( = ?auto_170333 ?auto_170336 ) ) ( not ( = ?auto_170333 ?auto_170341 ) ) ( not ( = ?auto_170333 ?auto_170335 ) ) ( not ( = ?auto_170336 ?auto_170341 ) ) ( not ( = ?auto_170336 ?auto_170335 ) ) ( not ( = ?auto_170341 ?auto_170335 ) ) ( ON ?auto_170341 ?auto_170336 ) ( ON-TABLE ?auto_170338 ) ( ON ?auto_170334 ?auto_170338 ) ( ON ?auto_170337 ?auto_170334 ) ( not ( = ?auto_170338 ?auto_170334 ) ) ( not ( = ?auto_170338 ?auto_170337 ) ) ( not ( = ?auto_170338 ?auto_170339 ) ) ( not ( = ?auto_170338 ?auto_170340 ) ) ( not ( = ?auto_170338 ?auto_170335 ) ) ( not ( = ?auto_170334 ?auto_170337 ) ) ( not ( = ?auto_170334 ?auto_170339 ) ) ( not ( = ?auto_170334 ?auto_170340 ) ) ( not ( = ?auto_170334 ?auto_170335 ) ) ( not ( = ?auto_170337 ?auto_170339 ) ) ( not ( = ?auto_170337 ?auto_170340 ) ) ( not ( = ?auto_170337 ?auto_170335 ) ) ( not ( = ?auto_170339 ?auto_170340 ) ) ( not ( = ?auto_170339 ?auto_170335 ) ) ( not ( = ?auto_170340 ?auto_170335 ) ) ( not ( = ?auto_170333 ?auto_170340 ) ) ( not ( = ?auto_170333 ?auto_170338 ) ) ( not ( = ?auto_170333 ?auto_170334 ) ) ( not ( = ?auto_170333 ?auto_170337 ) ) ( not ( = ?auto_170333 ?auto_170339 ) ) ( not ( = ?auto_170336 ?auto_170340 ) ) ( not ( = ?auto_170336 ?auto_170338 ) ) ( not ( = ?auto_170336 ?auto_170334 ) ) ( not ( = ?auto_170336 ?auto_170337 ) ) ( not ( = ?auto_170336 ?auto_170339 ) ) ( not ( = ?auto_170341 ?auto_170340 ) ) ( not ( = ?auto_170341 ?auto_170338 ) ) ( not ( = ?auto_170341 ?auto_170334 ) ) ( not ( = ?auto_170341 ?auto_170337 ) ) ( not ( = ?auto_170341 ?auto_170339 ) ) ( ON ?auto_170335 ?auto_170341 ) ( ON ?auto_170340 ?auto_170335 ) ( CLEAR ?auto_170337 ) ( ON ?auto_170339 ?auto_170340 ) ( CLEAR ?auto_170339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170333 ?auto_170336 ?auto_170341 ?auto_170335 ?auto_170340 )
      ( MAKE-1PILE ?auto_170333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170342 - BLOCK
    )
    :vars
    (
      ?auto_170349 - BLOCK
      ?auto_170345 - BLOCK
      ?auto_170344 - BLOCK
      ?auto_170346 - BLOCK
      ?auto_170348 - BLOCK
      ?auto_170343 - BLOCK
      ?auto_170347 - BLOCK
      ?auto_170350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170349 ?auto_170342 ) ( ON-TABLE ?auto_170342 ) ( not ( = ?auto_170342 ?auto_170349 ) ) ( not ( = ?auto_170342 ?auto_170345 ) ) ( not ( = ?auto_170342 ?auto_170344 ) ) ( not ( = ?auto_170349 ?auto_170345 ) ) ( not ( = ?auto_170349 ?auto_170344 ) ) ( not ( = ?auto_170345 ?auto_170344 ) ) ( ON ?auto_170345 ?auto_170349 ) ( ON-TABLE ?auto_170346 ) ( ON ?auto_170348 ?auto_170346 ) ( not ( = ?auto_170346 ?auto_170348 ) ) ( not ( = ?auto_170346 ?auto_170343 ) ) ( not ( = ?auto_170346 ?auto_170347 ) ) ( not ( = ?auto_170346 ?auto_170350 ) ) ( not ( = ?auto_170346 ?auto_170344 ) ) ( not ( = ?auto_170348 ?auto_170343 ) ) ( not ( = ?auto_170348 ?auto_170347 ) ) ( not ( = ?auto_170348 ?auto_170350 ) ) ( not ( = ?auto_170348 ?auto_170344 ) ) ( not ( = ?auto_170343 ?auto_170347 ) ) ( not ( = ?auto_170343 ?auto_170350 ) ) ( not ( = ?auto_170343 ?auto_170344 ) ) ( not ( = ?auto_170347 ?auto_170350 ) ) ( not ( = ?auto_170347 ?auto_170344 ) ) ( not ( = ?auto_170350 ?auto_170344 ) ) ( not ( = ?auto_170342 ?auto_170350 ) ) ( not ( = ?auto_170342 ?auto_170346 ) ) ( not ( = ?auto_170342 ?auto_170348 ) ) ( not ( = ?auto_170342 ?auto_170343 ) ) ( not ( = ?auto_170342 ?auto_170347 ) ) ( not ( = ?auto_170349 ?auto_170350 ) ) ( not ( = ?auto_170349 ?auto_170346 ) ) ( not ( = ?auto_170349 ?auto_170348 ) ) ( not ( = ?auto_170349 ?auto_170343 ) ) ( not ( = ?auto_170349 ?auto_170347 ) ) ( not ( = ?auto_170345 ?auto_170350 ) ) ( not ( = ?auto_170345 ?auto_170346 ) ) ( not ( = ?auto_170345 ?auto_170348 ) ) ( not ( = ?auto_170345 ?auto_170343 ) ) ( not ( = ?auto_170345 ?auto_170347 ) ) ( ON ?auto_170344 ?auto_170345 ) ( ON ?auto_170350 ?auto_170344 ) ( ON ?auto_170347 ?auto_170350 ) ( CLEAR ?auto_170347 ) ( HOLDING ?auto_170343 ) ( CLEAR ?auto_170348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170346 ?auto_170348 ?auto_170343 )
      ( MAKE-1PILE ?auto_170342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170351 - BLOCK
    )
    :vars
    (
      ?auto_170358 - BLOCK
      ?auto_170352 - BLOCK
      ?auto_170353 - BLOCK
      ?auto_170354 - BLOCK
      ?auto_170359 - BLOCK
      ?auto_170355 - BLOCK
      ?auto_170357 - BLOCK
      ?auto_170356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170358 ?auto_170351 ) ( ON-TABLE ?auto_170351 ) ( not ( = ?auto_170351 ?auto_170358 ) ) ( not ( = ?auto_170351 ?auto_170352 ) ) ( not ( = ?auto_170351 ?auto_170353 ) ) ( not ( = ?auto_170358 ?auto_170352 ) ) ( not ( = ?auto_170358 ?auto_170353 ) ) ( not ( = ?auto_170352 ?auto_170353 ) ) ( ON ?auto_170352 ?auto_170358 ) ( ON-TABLE ?auto_170354 ) ( ON ?auto_170359 ?auto_170354 ) ( not ( = ?auto_170354 ?auto_170359 ) ) ( not ( = ?auto_170354 ?auto_170355 ) ) ( not ( = ?auto_170354 ?auto_170357 ) ) ( not ( = ?auto_170354 ?auto_170356 ) ) ( not ( = ?auto_170354 ?auto_170353 ) ) ( not ( = ?auto_170359 ?auto_170355 ) ) ( not ( = ?auto_170359 ?auto_170357 ) ) ( not ( = ?auto_170359 ?auto_170356 ) ) ( not ( = ?auto_170359 ?auto_170353 ) ) ( not ( = ?auto_170355 ?auto_170357 ) ) ( not ( = ?auto_170355 ?auto_170356 ) ) ( not ( = ?auto_170355 ?auto_170353 ) ) ( not ( = ?auto_170357 ?auto_170356 ) ) ( not ( = ?auto_170357 ?auto_170353 ) ) ( not ( = ?auto_170356 ?auto_170353 ) ) ( not ( = ?auto_170351 ?auto_170356 ) ) ( not ( = ?auto_170351 ?auto_170354 ) ) ( not ( = ?auto_170351 ?auto_170359 ) ) ( not ( = ?auto_170351 ?auto_170355 ) ) ( not ( = ?auto_170351 ?auto_170357 ) ) ( not ( = ?auto_170358 ?auto_170356 ) ) ( not ( = ?auto_170358 ?auto_170354 ) ) ( not ( = ?auto_170358 ?auto_170359 ) ) ( not ( = ?auto_170358 ?auto_170355 ) ) ( not ( = ?auto_170358 ?auto_170357 ) ) ( not ( = ?auto_170352 ?auto_170356 ) ) ( not ( = ?auto_170352 ?auto_170354 ) ) ( not ( = ?auto_170352 ?auto_170359 ) ) ( not ( = ?auto_170352 ?auto_170355 ) ) ( not ( = ?auto_170352 ?auto_170357 ) ) ( ON ?auto_170353 ?auto_170352 ) ( ON ?auto_170356 ?auto_170353 ) ( ON ?auto_170357 ?auto_170356 ) ( CLEAR ?auto_170359 ) ( ON ?auto_170355 ?auto_170357 ) ( CLEAR ?auto_170355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170351 ?auto_170358 ?auto_170352 ?auto_170353 ?auto_170356 ?auto_170357 )
      ( MAKE-1PILE ?auto_170351 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170360 - BLOCK
    )
    :vars
    (
      ?auto_170364 - BLOCK
      ?auto_170361 - BLOCK
      ?auto_170366 - BLOCK
      ?auto_170363 - BLOCK
      ?auto_170362 - BLOCK
      ?auto_170367 - BLOCK
      ?auto_170368 - BLOCK
      ?auto_170365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170364 ?auto_170360 ) ( ON-TABLE ?auto_170360 ) ( not ( = ?auto_170360 ?auto_170364 ) ) ( not ( = ?auto_170360 ?auto_170361 ) ) ( not ( = ?auto_170360 ?auto_170366 ) ) ( not ( = ?auto_170364 ?auto_170361 ) ) ( not ( = ?auto_170364 ?auto_170366 ) ) ( not ( = ?auto_170361 ?auto_170366 ) ) ( ON ?auto_170361 ?auto_170364 ) ( ON-TABLE ?auto_170363 ) ( not ( = ?auto_170363 ?auto_170362 ) ) ( not ( = ?auto_170363 ?auto_170367 ) ) ( not ( = ?auto_170363 ?auto_170368 ) ) ( not ( = ?auto_170363 ?auto_170365 ) ) ( not ( = ?auto_170363 ?auto_170366 ) ) ( not ( = ?auto_170362 ?auto_170367 ) ) ( not ( = ?auto_170362 ?auto_170368 ) ) ( not ( = ?auto_170362 ?auto_170365 ) ) ( not ( = ?auto_170362 ?auto_170366 ) ) ( not ( = ?auto_170367 ?auto_170368 ) ) ( not ( = ?auto_170367 ?auto_170365 ) ) ( not ( = ?auto_170367 ?auto_170366 ) ) ( not ( = ?auto_170368 ?auto_170365 ) ) ( not ( = ?auto_170368 ?auto_170366 ) ) ( not ( = ?auto_170365 ?auto_170366 ) ) ( not ( = ?auto_170360 ?auto_170365 ) ) ( not ( = ?auto_170360 ?auto_170363 ) ) ( not ( = ?auto_170360 ?auto_170362 ) ) ( not ( = ?auto_170360 ?auto_170367 ) ) ( not ( = ?auto_170360 ?auto_170368 ) ) ( not ( = ?auto_170364 ?auto_170365 ) ) ( not ( = ?auto_170364 ?auto_170363 ) ) ( not ( = ?auto_170364 ?auto_170362 ) ) ( not ( = ?auto_170364 ?auto_170367 ) ) ( not ( = ?auto_170364 ?auto_170368 ) ) ( not ( = ?auto_170361 ?auto_170365 ) ) ( not ( = ?auto_170361 ?auto_170363 ) ) ( not ( = ?auto_170361 ?auto_170362 ) ) ( not ( = ?auto_170361 ?auto_170367 ) ) ( not ( = ?auto_170361 ?auto_170368 ) ) ( ON ?auto_170366 ?auto_170361 ) ( ON ?auto_170365 ?auto_170366 ) ( ON ?auto_170368 ?auto_170365 ) ( ON ?auto_170367 ?auto_170368 ) ( CLEAR ?auto_170367 ) ( HOLDING ?auto_170362 ) ( CLEAR ?auto_170363 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170363 ?auto_170362 )
      ( MAKE-1PILE ?auto_170360 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172539 - BLOCK
    )
    :vars
    (
      ?auto_172543 - BLOCK
      ?auto_172545 - BLOCK
      ?auto_172544 - BLOCK
      ?auto_172546 - BLOCK
      ?auto_172540 - BLOCK
      ?auto_172542 - BLOCK
      ?auto_172541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172543 ?auto_172539 ) ( ON-TABLE ?auto_172539 ) ( not ( = ?auto_172539 ?auto_172543 ) ) ( not ( = ?auto_172539 ?auto_172545 ) ) ( not ( = ?auto_172539 ?auto_172544 ) ) ( not ( = ?auto_172543 ?auto_172545 ) ) ( not ( = ?auto_172543 ?auto_172544 ) ) ( not ( = ?auto_172545 ?auto_172544 ) ) ( ON ?auto_172545 ?auto_172543 ) ( not ( = ?auto_172546 ?auto_172540 ) ) ( not ( = ?auto_172546 ?auto_172542 ) ) ( not ( = ?auto_172546 ?auto_172541 ) ) ( not ( = ?auto_172546 ?auto_172544 ) ) ( not ( = ?auto_172540 ?auto_172542 ) ) ( not ( = ?auto_172540 ?auto_172541 ) ) ( not ( = ?auto_172540 ?auto_172544 ) ) ( not ( = ?auto_172542 ?auto_172541 ) ) ( not ( = ?auto_172542 ?auto_172544 ) ) ( not ( = ?auto_172541 ?auto_172544 ) ) ( not ( = ?auto_172539 ?auto_172541 ) ) ( not ( = ?auto_172539 ?auto_172546 ) ) ( not ( = ?auto_172539 ?auto_172540 ) ) ( not ( = ?auto_172539 ?auto_172542 ) ) ( not ( = ?auto_172543 ?auto_172541 ) ) ( not ( = ?auto_172543 ?auto_172546 ) ) ( not ( = ?auto_172543 ?auto_172540 ) ) ( not ( = ?auto_172543 ?auto_172542 ) ) ( not ( = ?auto_172545 ?auto_172541 ) ) ( not ( = ?auto_172545 ?auto_172546 ) ) ( not ( = ?auto_172545 ?auto_172540 ) ) ( not ( = ?auto_172545 ?auto_172542 ) ) ( ON ?auto_172544 ?auto_172545 ) ( ON ?auto_172541 ?auto_172544 ) ( ON ?auto_172542 ?auto_172541 ) ( ON ?auto_172540 ?auto_172542 ) ( ON ?auto_172546 ?auto_172540 ) ( CLEAR ?auto_172546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172539 ?auto_172543 ?auto_172545 ?auto_172544 ?auto_172541 ?auto_172542 ?auto_172540 )
      ( MAKE-1PILE ?auto_172539 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170378 - BLOCK
    )
    :vars
    (
      ?auto_170386 - BLOCK
      ?auto_170379 - BLOCK
      ?auto_170382 - BLOCK
      ?auto_170383 - BLOCK
      ?auto_170380 - BLOCK
      ?auto_170381 - BLOCK
      ?auto_170385 - BLOCK
      ?auto_170384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170386 ?auto_170378 ) ( ON-TABLE ?auto_170378 ) ( not ( = ?auto_170378 ?auto_170386 ) ) ( not ( = ?auto_170378 ?auto_170379 ) ) ( not ( = ?auto_170378 ?auto_170382 ) ) ( not ( = ?auto_170386 ?auto_170379 ) ) ( not ( = ?auto_170386 ?auto_170382 ) ) ( not ( = ?auto_170379 ?auto_170382 ) ) ( ON ?auto_170379 ?auto_170386 ) ( not ( = ?auto_170383 ?auto_170380 ) ) ( not ( = ?auto_170383 ?auto_170381 ) ) ( not ( = ?auto_170383 ?auto_170385 ) ) ( not ( = ?auto_170383 ?auto_170384 ) ) ( not ( = ?auto_170383 ?auto_170382 ) ) ( not ( = ?auto_170380 ?auto_170381 ) ) ( not ( = ?auto_170380 ?auto_170385 ) ) ( not ( = ?auto_170380 ?auto_170384 ) ) ( not ( = ?auto_170380 ?auto_170382 ) ) ( not ( = ?auto_170381 ?auto_170385 ) ) ( not ( = ?auto_170381 ?auto_170384 ) ) ( not ( = ?auto_170381 ?auto_170382 ) ) ( not ( = ?auto_170385 ?auto_170384 ) ) ( not ( = ?auto_170385 ?auto_170382 ) ) ( not ( = ?auto_170384 ?auto_170382 ) ) ( not ( = ?auto_170378 ?auto_170384 ) ) ( not ( = ?auto_170378 ?auto_170383 ) ) ( not ( = ?auto_170378 ?auto_170380 ) ) ( not ( = ?auto_170378 ?auto_170381 ) ) ( not ( = ?auto_170378 ?auto_170385 ) ) ( not ( = ?auto_170386 ?auto_170384 ) ) ( not ( = ?auto_170386 ?auto_170383 ) ) ( not ( = ?auto_170386 ?auto_170380 ) ) ( not ( = ?auto_170386 ?auto_170381 ) ) ( not ( = ?auto_170386 ?auto_170385 ) ) ( not ( = ?auto_170379 ?auto_170384 ) ) ( not ( = ?auto_170379 ?auto_170383 ) ) ( not ( = ?auto_170379 ?auto_170380 ) ) ( not ( = ?auto_170379 ?auto_170381 ) ) ( not ( = ?auto_170379 ?auto_170385 ) ) ( ON ?auto_170382 ?auto_170379 ) ( ON ?auto_170384 ?auto_170382 ) ( ON ?auto_170385 ?auto_170384 ) ( ON ?auto_170381 ?auto_170385 ) ( ON ?auto_170380 ?auto_170381 ) ( CLEAR ?auto_170380 ) ( HOLDING ?auto_170383 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170383 )
      ( MAKE-1PILE ?auto_170378 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170387 - BLOCK
    )
    :vars
    (
      ?auto_170391 - BLOCK
      ?auto_170388 - BLOCK
      ?auto_170394 - BLOCK
      ?auto_170393 - BLOCK
      ?auto_170390 - BLOCK
      ?auto_170389 - BLOCK
      ?auto_170392 - BLOCK
      ?auto_170395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170391 ?auto_170387 ) ( ON-TABLE ?auto_170387 ) ( not ( = ?auto_170387 ?auto_170391 ) ) ( not ( = ?auto_170387 ?auto_170388 ) ) ( not ( = ?auto_170387 ?auto_170394 ) ) ( not ( = ?auto_170391 ?auto_170388 ) ) ( not ( = ?auto_170391 ?auto_170394 ) ) ( not ( = ?auto_170388 ?auto_170394 ) ) ( ON ?auto_170388 ?auto_170391 ) ( not ( = ?auto_170393 ?auto_170390 ) ) ( not ( = ?auto_170393 ?auto_170389 ) ) ( not ( = ?auto_170393 ?auto_170392 ) ) ( not ( = ?auto_170393 ?auto_170395 ) ) ( not ( = ?auto_170393 ?auto_170394 ) ) ( not ( = ?auto_170390 ?auto_170389 ) ) ( not ( = ?auto_170390 ?auto_170392 ) ) ( not ( = ?auto_170390 ?auto_170395 ) ) ( not ( = ?auto_170390 ?auto_170394 ) ) ( not ( = ?auto_170389 ?auto_170392 ) ) ( not ( = ?auto_170389 ?auto_170395 ) ) ( not ( = ?auto_170389 ?auto_170394 ) ) ( not ( = ?auto_170392 ?auto_170395 ) ) ( not ( = ?auto_170392 ?auto_170394 ) ) ( not ( = ?auto_170395 ?auto_170394 ) ) ( not ( = ?auto_170387 ?auto_170395 ) ) ( not ( = ?auto_170387 ?auto_170393 ) ) ( not ( = ?auto_170387 ?auto_170390 ) ) ( not ( = ?auto_170387 ?auto_170389 ) ) ( not ( = ?auto_170387 ?auto_170392 ) ) ( not ( = ?auto_170391 ?auto_170395 ) ) ( not ( = ?auto_170391 ?auto_170393 ) ) ( not ( = ?auto_170391 ?auto_170390 ) ) ( not ( = ?auto_170391 ?auto_170389 ) ) ( not ( = ?auto_170391 ?auto_170392 ) ) ( not ( = ?auto_170388 ?auto_170395 ) ) ( not ( = ?auto_170388 ?auto_170393 ) ) ( not ( = ?auto_170388 ?auto_170390 ) ) ( not ( = ?auto_170388 ?auto_170389 ) ) ( not ( = ?auto_170388 ?auto_170392 ) ) ( ON ?auto_170394 ?auto_170388 ) ( ON ?auto_170395 ?auto_170394 ) ( ON ?auto_170392 ?auto_170395 ) ( ON ?auto_170389 ?auto_170392 ) ( ON ?auto_170390 ?auto_170389 ) ( ON ?auto_170393 ?auto_170390 ) ( CLEAR ?auto_170393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170387 ?auto_170391 ?auto_170388 ?auto_170394 ?auto_170395 ?auto_170392 ?auto_170389 ?auto_170390 )
      ( MAKE-1PILE ?auto_170387 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170404 - BLOCK
      ?auto_170405 - BLOCK
      ?auto_170406 - BLOCK
      ?auto_170407 - BLOCK
      ?auto_170408 - BLOCK
      ?auto_170409 - BLOCK
      ?auto_170410 - BLOCK
      ?auto_170411 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_170411 ) ( CLEAR ?auto_170410 ) ( ON-TABLE ?auto_170404 ) ( ON ?auto_170405 ?auto_170404 ) ( ON ?auto_170406 ?auto_170405 ) ( ON ?auto_170407 ?auto_170406 ) ( ON ?auto_170408 ?auto_170407 ) ( ON ?auto_170409 ?auto_170408 ) ( ON ?auto_170410 ?auto_170409 ) ( not ( = ?auto_170404 ?auto_170405 ) ) ( not ( = ?auto_170404 ?auto_170406 ) ) ( not ( = ?auto_170404 ?auto_170407 ) ) ( not ( = ?auto_170404 ?auto_170408 ) ) ( not ( = ?auto_170404 ?auto_170409 ) ) ( not ( = ?auto_170404 ?auto_170410 ) ) ( not ( = ?auto_170404 ?auto_170411 ) ) ( not ( = ?auto_170405 ?auto_170406 ) ) ( not ( = ?auto_170405 ?auto_170407 ) ) ( not ( = ?auto_170405 ?auto_170408 ) ) ( not ( = ?auto_170405 ?auto_170409 ) ) ( not ( = ?auto_170405 ?auto_170410 ) ) ( not ( = ?auto_170405 ?auto_170411 ) ) ( not ( = ?auto_170406 ?auto_170407 ) ) ( not ( = ?auto_170406 ?auto_170408 ) ) ( not ( = ?auto_170406 ?auto_170409 ) ) ( not ( = ?auto_170406 ?auto_170410 ) ) ( not ( = ?auto_170406 ?auto_170411 ) ) ( not ( = ?auto_170407 ?auto_170408 ) ) ( not ( = ?auto_170407 ?auto_170409 ) ) ( not ( = ?auto_170407 ?auto_170410 ) ) ( not ( = ?auto_170407 ?auto_170411 ) ) ( not ( = ?auto_170408 ?auto_170409 ) ) ( not ( = ?auto_170408 ?auto_170410 ) ) ( not ( = ?auto_170408 ?auto_170411 ) ) ( not ( = ?auto_170409 ?auto_170410 ) ) ( not ( = ?auto_170409 ?auto_170411 ) ) ( not ( = ?auto_170410 ?auto_170411 ) ) )
    :subtasks
    ( ( !STACK ?auto_170411 ?auto_170410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170412 - BLOCK
      ?auto_170413 - BLOCK
      ?auto_170414 - BLOCK
      ?auto_170415 - BLOCK
      ?auto_170416 - BLOCK
      ?auto_170417 - BLOCK
      ?auto_170418 - BLOCK
      ?auto_170419 - BLOCK
    )
    :vars
    (
      ?auto_170420 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_170418 ) ( ON-TABLE ?auto_170412 ) ( ON ?auto_170413 ?auto_170412 ) ( ON ?auto_170414 ?auto_170413 ) ( ON ?auto_170415 ?auto_170414 ) ( ON ?auto_170416 ?auto_170415 ) ( ON ?auto_170417 ?auto_170416 ) ( ON ?auto_170418 ?auto_170417 ) ( not ( = ?auto_170412 ?auto_170413 ) ) ( not ( = ?auto_170412 ?auto_170414 ) ) ( not ( = ?auto_170412 ?auto_170415 ) ) ( not ( = ?auto_170412 ?auto_170416 ) ) ( not ( = ?auto_170412 ?auto_170417 ) ) ( not ( = ?auto_170412 ?auto_170418 ) ) ( not ( = ?auto_170412 ?auto_170419 ) ) ( not ( = ?auto_170413 ?auto_170414 ) ) ( not ( = ?auto_170413 ?auto_170415 ) ) ( not ( = ?auto_170413 ?auto_170416 ) ) ( not ( = ?auto_170413 ?auto_170417 ) ) ( not ( = ?auto_170413 ?auto_170418 ) ) ( not ( = ?auto_170413 ?auto_170419 ) ) ( not ( = ?auto_170414 ?auto_170415 ) ) ( not ( = ?auto_170414 ?auto_170416 ) ) ( not ( = ?auto_170414 ?auto_170417 ) ) ( not ( = ?auto_170414 ?auto_170418 ) ) ( not ( = ?auto_170414 ?auto_170419 ) ) ( not ( = ?auto_170415 ?auto_170416 ) ) ( not ( = ?auto_170415 ?auto_170417 ) ) ( not ( = ?auto_170415 ?auto_170418 ) ) ( not ( = ?auto_170415 ?auto_170419 ) ) ( not ( = ?auto_170416 ?auto_170417 ) ) ( not ( = ?auto_170416 ?auto_170418 ) ) ( not ( = ?auto_170416 ?auto_170419 ) ) ( not ( = ?auto_170417 ?auto_170418 ) ) ( not ( = ?auto_170417 ?auto_170419 ) ) ( not ( = ?auto_170418 ?auto_170419 ) ) ( ON ?auto_170419 ?auto_170420 ) ( CLEAR ?auto_170419 ) ( HAND-EMPTY ) ( not ( = ?auto_170412 ?auto_170420 ) ) ( not ( = ?auto_170413 ?auto_170420 ) ) ( not ( = ?auto_170414 ?auto_170420 ) ) ( not ( = ?auto_170415 ?auto_170420 ) ) ( not ( = ?auto_170416 ?auto_170420 ) ) ( not ( = ?auto_170417 ?auto_170420 ) ) ( not ( = ?auto_170418 ?auto_170420 ) ) ( not ( = ?auto_170419 ?auto_170420 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170419 ?auto_170420 )
      ( MAKE-8PILE ?auto_170412 ?auto_170413 ?auto_170414 ?auto_170415 ?auto_170416 ?auto_170417 ?auto_170418 ?auto_170419 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170421 - BLOCK
      ?auto_170422 - BLOCK
      ?auto_170423 - BLOCK
      ?auto_170424 - BLOCK
      ?auto_170425 - BLOCK
      ?auto_170426 - BLOCK
      ?auto_170427 - BLOCK
      ?auto_170428 - BLOCK
    )
    :vars
    (
      ?auto_170429 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170421 ) ( ON ?auto_170422 ?auto_170421 ) ( ON ?auto_170423 ?auto_170422 ) ( ON ?auto_170424 ?auto_170423 ) ( ON ?auto_170425 ?auto_170424 ) ( ON ?auto_170426 ?auto_170425 ) ( not ( = ?auto_170421 ?auto_170422 ) ) ( not ( = ?auto_170421 ?auto_170423 ) ) ( not ( = ?auto_170421 ?auto_170424 ) ) ( not ( = ?auto_170421 ?auto_170425 ) ) ( not ( = ?auto_170421 ?auto_170426 ) ) ( not ( = ?auto_170421 ?auto_170427 ) ) ( not ( = ?auto_170421 ?auto_170428 ) ) ( not ( = ?auto_170422 ?auto_170423 ) ) ( not ( = ?auto_170422 ?auto_170424 ) ) ( not ( = ?auto_170422 ?auto_170425 ) ) ( not ( = ?auto_170422 ?auto_170426 ) ) ( not ( = ?auto_170422 ?auto_170427 ) ) ( not ( = ?auto_170422 ?auto_170428 ) ) ( not ( = ?auto_170423 ?auto_170424 ) ) ( not ( = ?auto_170423 ?auto_170425 ) ) ( not ( = ?auto_170423 ?auto_170426 ) ) ( not ( = ?auto_170423 ?auto_170427 ) ) ( not ( = ?auto_170423 ?auto_170428 ) ) ( not ( = ?auto_170424 ?auto_170425 ) ) ( not ( = ?auto_170424 ?auto_170426 ) ) ( not ( = ?auto_170424 ?auto_170427 ) ) ( not ( = ?auto_170424 ?auto_170428 ) ) ( not ( = ?auto_170425 ?auto_170426 ) ) ( not ( = ?auto_170425 ?auto_170427 ) ) ( not ( = ?auto_170425 ?auto_170428 ) ) ( not ( = ?auto_170426 ?auto_170427 ) ) ( not ( = ?auto_170426 ?auto_170428 ) ) ( not ( = ?auto_170427 ?auto_170428 ) ) ( ON ?auto_170428 ?auto_170429 ) ( CLEAR ?auto_170428 ) ( not ( = ?auto_170421 ?auto_170429 ) ) ( not ( = ?auto_170422 ?auto_170429 ) ) ( not ( = ?auto_170423 ?auto_170429 ) ) ( not ( = ?auto_170424 ?auto_170429 ) ) ( not ( = ?auto_170425 ?auto_170429 ) ) ( not ( = ?auto_170426 ?auto_170429 ) ) ( not ( = ?auto_170427 ?auto_170429 ) ) ( not ( = ?auto_170428 ?auto_170429 ) ) ( HOLDING ?auto_170427 ) ( CLEAR ?auto_170426 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 ?auto_170426 ?auto_170427 )
      ( MAKE-8PILE ?auto_170421 ?auto_170422 ?auto_170423 ?auto_170424 ?auto_170425 ?auto_170426 ?auto_170427 ?auto_170428 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170430 - BLOCK
      ?auto_170431 - BLOCK
      ?auto_170432 - BLOCK
      ?auto_170433 - BLOCK
      ?auto_170434 - BLOCK
      ?auto_170435 - BLOCK
      ?auto_170436 - BLOCK
      ?auto_170437 - BLOCK
    )
    :vars
    (
      ?auto_170438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170430 ) ( ON ?auto_170431 ?auto_170430 ) ( ON ?auto_170432 ?auto_170431 ) ( ON ?auto_170433 ?auto_170432 ) ( ON ?auto_170434 ?auto_170433 ) ( ON ?auto_170435 ?auto_170434 ) ( not ( = ?auto_170430 ?auto_170431 ) ) ( not ( = ?auto_170430 ?auto_170432 ) ) ( not ( = ?auto_170430 ?auto_170433 ) ) ( not ( = ?auto_170430 ?auto_170434 ) ) ( not ( = ?auto_170430 ?auto_170435 ) ) ( not ( = ?auto_170430 ?auto_170436 ) ) ( not ( = ?auto_170430 ?auto_170437 ) ) ( not ( = ?auto_170431 ?auto_170432 ) ) ( not ( = ?auto_170431 ?auto_170433 ) ) ( not ( = ?auto_170431 ?auto_170434 ) ) ( not ( = ?auto_170431 ?auto_170435 ) ) ( not ( = ?auto_170431 ?auto_170436 ) ) ( not ( = ?auto_170431 ?auto_170437 ) ) ( not ( = ?auto_170432 ?auto_170433 ) ) ( not ( = ?auto_170432 ?auto_170434 ) ) ( not ( = ?auto_170432 ?auto_170435 ) ) ( not ( = ?auto_170432 ?auto_170436 ) ) ( not ( = ?auto_170432 ?auto_170437 ) ) ( not ( = ?auto_170433 ?auto_170434 ) ) ( not ( = ?auto_170433 ?auto_170435 ) ) ( not ( = ?auto_170433 ?auto_170436 ) ) ( not ( = ?auto_170433 ?auto_170437 ) ) ( not ( = ?auto_170434 ?auto_170435 ) ) ( not ( = ?auto_170434 ?auto_170436 ) ) ( not ( = ?auto_170434 ?auto_170437 ) ) ( not ( = ?auto_170435 ?auto_170436 ) ) ( not ( = ?auto_170435 ?auto_170437 ) ) ( not ( = ?auto_170436 ?auto_170437 ) ) ( ON ?auto_170437 ?auto_170438 ) ( not ( = ?auto_170430 ?auto_170438 ) ) ( not ( = ?auto_170431 ?auto_170438 ) ) ( not ( = ?auto_170432 ?auto_170438 ) ) ( not ( = ?auto_170433 ?auto_170438 ) ) ( not ( = ?auto_170434 ?auto_170438 ) ) ( not ( = ?auto_170435 ?auto_170438 ) ) ( not ( = ?auto_170436 ?auto_170438 ) ) ( not ( = ?auto_170437 ?auto_170438 ) ) ( CLEAR ?auto_170435 ) ( ON ?auto_170436 ?auto_170437 ) ( CLEAR ?auto_170436 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170438 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170438 ?auto_170437 )
      ( MAKE-8PILE ?auto_170430 ?auto_170431 ?auto_170432 ?auto_170433 ?auto_170434 ?auto_170435 ?auto_170436 ?auto_170437 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170439 - BLOCK
      ?auto_170440 - BLOCK
      ?auto_170441 - BLOCK
      ?auto_170442 - BLOCK
      ?auto_170443 - BLOCK
      ?auto_170444 - BLOCK
      ?auto_170445 - BLOCK
      ?auto_170446 - BLOCK
    )
    :vars
    (
      ?auto_170447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170439 ) ( ON ?auto_170440 ?auto_170439 ) ( ON ?auto_170441 ?auto_170440 ) ( ON ?auto_170442 ?auto_170441 ) ( ON ?auto_170443 ?auto_170442 ) ( not ( = ?auto_170439 ?auto_170440 ) ) ( not ( = ?auto_170439 ?auto_170441 ) ) ( not ( = ?auto_170439 ?auto_170442 ) ) ( not ( = ?auto_170439 ?auto_170443 ) ) ( not ( = ?auto_170439 ?auto_170444 ) ) ( not ( = ?auto_170439 ?auto_170445 ) ) ( not ( = ?auto_170439 ?auto_170446 ) ) ( not ( = ?auto_170440 ?auto_170441 ) ) ( not ( = ?auto_170440 ?auto_170442 ) ) ( not ( = ?auto_170440 ?auto_170443 ) ) ( not ( = ?auto_170440 ?auto_170444 ) ) ( not ( = ?auto_170440 ?auto_170445 ) ) ( not ( = ?auto_170440 ?auto_170446 ) ) ( not ( = ?auto_170441 ?auto_170442 ) ) ( not ( = ?auto_170441 ?auto_170443 ) ) ( not ( = ?auto_170441 ?auto_170444 ) ) ( not ( = ?auto_170441 ?auto_170445 ) ) ( not ( = ?auto_170441 ?auto_170446 ) ) ( not ( = ?auto_170442 ?auto_170443 ) ) ( not ( = ?auto_170442 ?auto_170444 ) ) ( not ( = ?auto_170442 ?auto_170445 ) ) ( not ( = ?auto_170442 ?auto_170446 ) ) ( not ( = ?auto_170443 ?auto_170444 ) ) ( not ( = ?auto_170443 ?auto_170445 ) ) ( not ( = ?auto_170443 ?auto_170446 ) ) ( not ( = ?auto_170444 ?auto_170445 ) ) ( not ( = ?auto_170444 ?auto_170446 ) ) ( not ( = ?auto_170445 ?auto_170446 ) ) ( ON ?auto_170446 ?auto_170447 ) ( not ( = ?auto_170439 ?auto_170447 ) ) ( not ( = ?auto_170440 ?auto_170447 ) ) ( not ( = ?auto_170441 ?auto_170447 ) ) ( not ( = ?auto_170442 ?auto_170447 ) ) ( not ( = ?auto_170443 ?auto_170447 ) ) ( not ( = ?auto_170444 ?auto_170447 ) ) ( not ( = ?auto_170445 ?auto_170447 ) ) ( not ( = ?auto_170446 ?auto_170447 ) ) ( ON ?auto_170445 ?auto_170446 ) ( CLEAR ?auto_170445 ) ( ON-TABLE ?auto_170447 ) ( HOLDING ?auto_170444 ) ( CLEAR ?auto_170443 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170439 ?auto_170440 ?auto_170441 ?auto_170442 ?auto_170443 ?auto_170444 )
      ( MAKE-8PILE ?auto_170439 ?auto_170440 ?auto_170441 ?auto_170442 ?auto_170443 ?auto_170444 ?auto_170445 ?auto_170446 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170448 - BLOCK
      ?auto_170449 - BLOCK
      ?auto_170450 - BLOCK
      ?auto_170451 - BLOCK
      ?auto_170452 - BLOCK
      ?auto_170453 - BLOCK
      ?auto_170454 - BLOCK
      ?auto_170455 - BLOCK
    )
    :vars
    (
      ?auto_170456 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170448 ) ( ON ?auto_170449 ?auto_170448 ) ( ON ?auto_170450 ?auto_170449 ) ( ON ?auto_170451 ?auto_170450 ) ( ON ?auto_170452 ?auto_170451 ) ( not ( = ?auto_170448 ?auto_170449 ) ) ( not ( = ?auto_170448 ?auto_170450 ) ) ( not ( = ?auto_170448 ?auto_170451 ) ) ( not ( = ?auto_170448 ?auto_170452 ) ) ( not ( = ?auto_170448 ?auto_170453 ) ) ( not ( = ?auto_170448 ?auto_170454 ) ) ( not ( = ?auto_170448 ?auto_170455 ) ) ( not ( = ?auto_170449 ?auto_170450 ) ) ( not ( = ?auto_170449 ?auto_170451 ) ) ( not ( = ?auto_170449 ?auto_170452 ) ) ( not ( = ?auto_170449 ?auto_170453 ) ) ( not ( = ?auto_170449 ?auto_170454 ) ) ( not ( = ?auto_170449 ?auto_170455 ) ) ( not ( = ?auto_170450 ?auto_170451 ) ) ( not ( = ?auto_170450 ?auto_170452 ) ) ( not ( = ?auto_170450 ?auto_170453 ) ) ( not ( = ?auto_170450 ?auto_170454 ) ) ( not ( = ?auto_170450 ?auto_170455 ) ) ( not ( = ?auto_170451 ?auto_170452 ) ) ( not ( = ?auto_170451 ?auto_170453 ) ) ( not ( = ?auto_170451 ?auto_170454 ) ) ( not ( = ?auto_170451 ?auto_170455 ) ) ( not ( = ?auto_170452 ?auto_170453 ) ) ( not ( = ?auto_170452 ?auto_170454 ) ) ( not ( = ?auto_170452 ?auto_170455 ) ) ( not ( = ?auto_170453 ?auto_170454 ) ) ( not ( = ?auto_170453 ?auto_170455 ) ) ( not ( = ?auto_170454 ?auto_170455 ) ) ( ON ?auto_170455 ?auto_170456 ) ( not ( = ?auto_170448 ?auto_170456 ) ) ( not ( = ?auto_170449 ?auto_170456 ) ) ( not ( = ?auto_170450 ?auto_170456 ) ) ( not ( = ?auto_170451 ?auto_170456 ) ) ( not ( = ?auto_170452 ?auto_170456 ) ) ( not ( = ?auto_170453 ?auto_170456 ) ) ( not ( = ?auto_170454 ?auto_170456 ) ) ( not ( = ?auto_170455 ?auto_170456 ) ) ( ON ?auto_170454 ?auto_170455 ) ( ON-TABLE ?auto_170456 ) ( CLEAR ?auto_170452 ) ( ON ?auto_170453 ?auto_170454 ) ( CLEAR ?auto_170453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170456 ?auto_170455 ?auto_170454 )
      ( MAKE-8PILE ?auto_170448 ?auto_170449 ?auto_170450 ?auto_170451 ?auto_170452 ?auto_170453 ?auto_170454 ?auto_170455 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170457 - BLOCK
      ?auto_170458 - BLOCK
      ?auto_170459 - BLOCK
      ?auto_170460 - BLOCK
      ?auto_170461 - BLOCK
      ?auto_170462 - BLOCK
      ?auto_170463 - BLOCK
      ?auto_170464 - BLOCK
    )
    :vars
    (
      ?auto_170465 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170457 ) ( ON ?auto_170458 ?auto_170457 ) ( ON ?auto_170459 ?auto_170458 ) ( ON ?auto_170460 ?auto_170459 ) ( not ( = ?auto_170457 ?auto_170458 ) ) ( not ( = ?auto_170457 ?auto_170459 ) ) ( not ( = ?auto_170457 ?auto_170460 ) ) ( not ( = ?auto_170457 ?auto_170461 ) ) ( not ( = ?auto_170457 ?auto_170462 ) ) ( not ( = ?auto_170457 ?auto_170463 ) ) ( not ( = ?auto_170457 ?auto_170464 ) ) ( not ( = ?auto_170458 ?auto_170459 ) ) ( not ( = ?auto_170458 ?auto_170460 ) ) ( not ( = ?auto_170458 ?auto_170461 ) ) ( not ( = ?auto_170458 ?auto_170462 ) ) ( not ( = ?auto_170458 ?auto_170463 ) ) ( not ( = ?auto_170458 ?auto_170464 ) ) ( not ( = ?auto_170459 ?auto_170460 ) ) ( not ( = ?auto_170459 ?auto_170461 ) ) ( not ( = ?auto_170459 ?auto_170462 ) ) ( not ( = ?auto_170459 ?auto_170463 ) ) ( not ( = ?auto_170459 ?auto_170464 ) ) ( not ( = ?auto_170460 ?auto_170461 ) ) ( not ( = ?auto_170460 ?auto_170462 ) ) ( not ( = ?auto_170460 ?auto_170463 ) ) ( not ( = ?auto_170460 ?auto_170464 ) ) ( not ( = ?auto_170461 ?auto_170462 ) ) ( not ( = ?auto_170461 ?auto_170463 ) ) ( not ( = ?auto_170461 ?auto_170464 ) ) ( not ( = ?auto_170462 ?auto_170463 ) ) ( not ( = ?auto_170462 ?auto_170464 ) ) ( not ( = ?auto_170463 ?auto_170464 ) ) ( ON ?auto_170464 ?auto_170465 ) ( not ( = ?auto_170457 ?auto_170465 ) ) ( not ( = ?auto_170458 ?auto_170465 ) ) ( not ( = ?auto_170459 ?auto_170465 ) ) ( not ( = ?auto_170460 ?auto_170465 ) ) ( not ( = ?auto_170461 ?auto_170465 ) ) ( not ( = ?auto_170462 ?auto_170465 ) ) ( not ( = ?auto_170463 ?auto_170465 ) ) ( not ( = ?auto_170464 ?auto_170465 ) ) ( ON ?auto_170463 ?auto_170464 ) ( ON-TABLE ?auto_170465 ) ( ON ?auto_170462 ?auto_170463 ) ( CLEAR ?auto_170462 ) ( HOLDING ?auto_170461 ) ( CLEAR ?auto_170460 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 )
      ( MAKE-8PILE ?auto_170457 ?auto_170458 ?auto_170459 ?auto_170460 ?auto_170461 ?auto_170462 ?auto_170463 ?auto_170464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170466 - BLOCK
      ?auto_170467 - BLOCK
      ?auto_170468 - BLOCK
      ?auto_170469 - BLOCK
      ?auto_170470 - BLOCK
      ?auto_170471 - BLOCK
      ?auto_170472 - BLOCK
      ?auto_170473 - BLOCK
    )
    :vars
    (
      ?auto_170474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170466 ) ( ON ?auto_170467 ?auto_170466 ) ( ON ?auto_170468 ?auto_170467 ) ( ON ?auto_170469 ?auto_170468 ) ( not ( = ?auto_170466 ?auto_170467 ) ) ( not ( = ?auto_170466 ?auto_170468 ) ) ( not ( = ?auto_170466 ?auto_170469 ) ) ( not ( = ?auto_170466 ?auto_170470 ) ) ( not ( = ?auto_170466 ?auto_170471 ) ) ( not ( = ?auto_170466 ?auto_170472 ) ) ( not ( = ?auto_170466 ?auto_170473 ) ) ( not ( = ?auto_170467 ?auto_170468 ) ) ( not ( = ?auto_170467 ?auto_170469 ) ) ( not ( = ?auto_170467 ?auto_170470 ) ) ( not ( = ?auto_170467 ?auto_170471 ) ) ( not ( = ?auto_170467 ?auto_170472 ) ) ( not ( = ?auto_170467 ?auto_170473 ) ) ( not ( = ?auto_170468 ?auto_170469 ) ) ( not ( = ?auto_170468 ?auto_170470 ) ) ( not ( = ?auto_170468 ?auto_170471 ) ) ( not ( = ?auto_170468 ?auto_170472 ) ) ( not ( = ?auto_170468 ?auto_170473 ) ) ( not ( = ?auto_170469 ?auto_170470 ) ) ( not ( = ?auto_170469 ?auto_170471 ) ) ( not ( = ?auto_170469 ?auto_170472 ) ) ( not ( = ?auto_170469 ?auto_170473 ) ) ( not ( = ?auto_170470 ?auto_170471 ) ) ( not ( = ?auto_170470 ?auto_170472 ) ) ( not ( = ?auto_170470 ?auto_170473 ) ) ( not ( = ?auto_170471 ?auto_170472 ) ) ( not ( = ?auto_170471 ?auto_170473 ) ) ( not ( = ?auto_170472 ?auto_170473 ) ) ( ON ?auto_170473 ?auto_170474 ) ( not ( = ?auto_170466 ?auto_170474 ) ) ( not ( = ?auto_170467 ?auto_170474 ) ) ( not ( = ?auto_170468 ?auto_170474 ) ) ( not ( = ?auto_170469 ?auto_170474 ) ) ( not ( = ?auto_170470 ?auto_170474 ) ) ( not ( = ?auto_170471 ?auto_170474 ) ) ( not ( = ?auto_170472 ?auto_170474 ) ) ( not ( = ?auto_170473 ?auto_170474 ) ) ( ON ?auto_170472 ?auto_170473 ) ( ON-TABLE ?auto_170474 ) ( ON ?auto_170471 ?auto_170472 ) ( CLEAR ?auto_170469 ) ( ON ?auto_170470 ?auto_170471 ) ( CLEAR ?auto_170470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170474 ?auto_170473 ?auto_170472 ?auto_170471 )
      ( MAKE-8PILE ?auto_170466 ?auto_170467 ?auto_170468 ?auto_170469 ?auto_170470 ?auto_170471 ?auto_170472 ?auto_170473 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170475 - BLOCK
      ?auto_170476 - BLOCK
      ?auto_170477 - BLOCK
      ?auto_170478 - BLOCK
      ?auto_170479 - BLOCK
      ?auto_170480 - BLOCK
      ?auto_170481 - BLOCK
      ?auto_170482 - BLOCK
    )
    :vars
    (
      ?auto_170483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170475 ) ( ON ?auto_170476 ?auto_170475 ) ( ON ?auto_170477 ?auto_170476 ) ( not ( = ?auto_170475 ?auto_170476 ) ) ( not ( = ?auto_170475 ?auto_170477 ) ) ( not ( = ?auto_170475 ?auto_170478 ) ) ( not ( = ?auto_170475 ?auto_170479 ) ) ( not ( = ?auto_170475 ?auto_170480 ) ) ( not ( = ?auto_170475 ?auto_170481 ) ) ( not ( = ?auto_170475 ?auto_170482 ) ) ( not ( = ?auto_170476 ?auto_170477 ) ) ( not ( = ?auto_170476 ?auto_170478 ) ) ( not ( = ?auto_170476 ?auto_170479 ) ) ( not ( = ?auto_170476 ?auto_170480 ) ) ( not ( = ?auto_170476 ?auto_170481 ) ) ( not ( = ?auto_170476 ?auto_170482 ) ) ( not ( = ?auto_170477 ?auto_170478 ) ) ( not ( = ?auto_170477 ?auto_170479 ) ) ( not ( = ?auto_170477 ?auto_170480 ) ) ( not ( = ?auto_170477 ?auto_170481 ) ) ( not ( = ?auto_170477 ?auto_170482 ) ) ( not ( = ?auto_170478 ?auto_170479 ) ) ( not ( = ?auto_170478 ?auto_170480 ) ) ( not ( = ?auto_170478 ?auto_170481 ) ) ( not ( = ?auto_170478 ?auto_170482 ) ) ( not ( = ?auto_170479 ?auto_170480 ) ) ( not ( = ?auto_170479 ?auto_170481 ) ) ( not ( = ?auto_170479 ?auto_170482 ) ) ( not ( = ?auto_170480 ?auto_170481 ) ) ( not ( = ?auto_170480 ?auto_170482 ) ) ( not ( = ?auto_170481 ?auto_170482 ) ) ( ON ?auto_170482 ?auto_170483 ) ( not ( = ?auto_170475 ?auto_170483 ) ) ( not ( = ?auto_170476 ?auto_170483 ) ) ( not ( = ?auto_170477 ?auto_170483 ) ) ( not ( = ?auto_170478 ?auto_170483 ) ) ( not ( = ?auto_170479 ?auto_170483 ) ) ( not ( = ?auto_170480 ?auto_170483 ) ) ( not ( = ?auto_170481 ?auto_170483 ) ) ( not ( = ?auto_170482 ?auto_170483 ) ) ( ON ?auto_170481 ?auto_170482 ) ( ON-TABLE ?auto_170483 ) ( ON ?auto_170480 ?auto_170481 ) ( ON ?auto_170479 ?auto_170480 ) ( CLEAR ?auto_170479 ) ( HOLDING ?auto_170478 ) ( CLEAR ?auto_170477 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170475 ?auto_170476 ?auto_170477 ?auto_170478 )
      ( MAKE-8PILE ?auto_170475 ?auto_170476 ?auto_170477 ?auto_170478 ?auto_170479 ?auto_170480 ?auto_170481 ?auto_170482 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170484 - BLOCK
      ?auto_170485 - BLOCK
      ?auto_170486 - BLOCK
      ?auto_170487 - BLOCK
      ?auto_170488 - BLOCK
      ?auto_170489 - BLOCK
      ?auto_170490 - BLOCK
      ?auto_170491 - BLOCK
    )
    :vars
    (
      ?auto_170492 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170484 ) ( ON ?auto_170485 ?auto_170484 ) ( ON ?auto_170486 ?auto_170485 ) ( not ( = ?auto_170484 ?auto_170485 ) ) ( not ( = ?auto_170484 ?auto_170486 ) ) ( not ( = ?auto_170484 ?auto_170487 ) ) ( not ( = ?auto_170484 ?auto_170488 ) ) ( not ( = ?auto_170484 ?auto_170489 ) ) ( not ( = ?auto_170484 ?auto_170490 ) ) ( not ( = ?auto_170484 ?auto_170491 ) ) ( not ( = ?auto_170485 ?auto_170486 ) ) ( not ( = ?auto_170485 ?auto_170487 ) ) ( not ( = ?auto_170485 ?auto_170488 ) ) ( not ( = ?auto_170485 ?auto_170489 ) ) ( not ( = ?auto_170485 ?auto_170490 ) ) ( not ( = ?auto_170485 ?auto_170491 ) ) ( not ( = ?auto_170486 ?auto_170487 ) ) ( not ( = ?auto_170486 ?auto_170488 ) ) ( not ( = ?auto_170486 ?auto_170489 ) ) ( not ( = ?auto_170486 ?auto_170490 ) ) ( not ( = ?auto_170486 ?auto_170491 ) ) ( not ( = ?auto_170487 ?auto_170488 ) ) ( not ( = ?auto_170487 ?auto_170489 ) ) ( not ( = ?auto_170487 ?auto_170490 ) ) ( not ( = ?auto_170487 ?auto_170491 ) ) ( not ( = ?auto_170488 ?auto_170489 ) ) ( not ( = ?auto_170488 ?auto_170490 ) ) ( not ( = ?auto_170488 ?auto_170491 ) ) ( not ( = ?auto_170489 ?auto_170490 ) ) ( not ( = ?auto_170489 ?auto_170491 ) ) ( not ( = ?auto_170490 ?auto_170491 ) ) ( ON ?auto_170491 ?auto_170492 ) ( not ( = ?auto_170484 ?auto_170492 ) ) ( not ( = ?auto_170485 ?auto_170492 ) ) ( not ( = ?auto_170486 ?auto_170492 ) ) ( not ( = ?auto_170487 ?auto_170492 ) ) ( not ( = ?auto_170488 ?auto_170492 ) ) ( not ( = ?auto_170489 ?auto_170492 ) ) ( not ( = ?auto_170490 ?auto_170492 ) ) ( not ( = ?auto_170491 ?auto_170492 ) ) ( ON ?auto_170490 ?auto_170491 ) ( ON-TABLE ?auto_170492 ) ( ON ?auto_170489 ?auto_170490 ) ( ON ?auto_170488 ?auto_170489 ) ( CLEAR ?auto_170486 ) ( ON ?auto_170487 ?auto_170488 ) ( CLEAR ?auto_170487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170492 ?auto_170491 ?auto_170490 ?auto_170489 ?auto_170488 )
      ( MAKE-8PILE ?auto_170484 ?auto_170485 ?auto_170486 ?auto_170487 ?auto_170488 ?auto_170489 ?auto_170490 ?auto_170491 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170493 - BLOCK
      ?auto_170494 - BLOCK
      ?auto_170495 - BLOCK
      ?auto_170496 - BLOCK
      ?auto_170497 - BLOCK
      ?auto_170498 - BLOCK
      ?auto_170499 - BLOCK
      ?auto_170500 - BLOCK
    )
    :vars
    (
      ?auto_170501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170493 ) ( ON ?auto_170494 ?auto_170493 ) ( not ( = ?auto_170493 ?auto_170494 ) ) ( not ( = ?auto_170493 ?auto_170495 ) ) ( not ( = ?auto_170493 ?auto_170496 ) ) ( not ( = ?auto_170493 ?auto_170497 ) ) ( not ( = ?auto_170493 ?auto_170498 ) ) ( not ( = ?auto_170493 ?auto_170499 ) ) ( not ( = ?auto_170493 ?auto_170500 ) ) ( not ( = ?auto_170494 ?auto_170495 ) ) ( not ( = ?auto_170494 ?auto_170496 ) ) ( not ( = ?auto_170494 ?auto_170497 ) ) ( not ( = ?auto_170494 ?auto_170498 ) ) ( not ( = ?auto_170494 ?auto_170499 ) ) ( not ( = ?auto_170494 ?auto_170500 ) ) ( not ( = ?auto_170495 ?auto_170496 ) ) ( not ( = ?auto_170495 ?auto_170497 ) ) ( not ( = ?auto_170495 ?auto_170498 ) ) ( not ( = ?auto_170495 ?auto_170499 ) ) ( not ( = ?auto_170495 ?auto_170500 ) ) ( not ( = ?auto_170496 ?auto_170497 ) ) ( not ( = ?auto_170496 ?auto_170498 ) ) ( not ( = ?auto_170496 ?auto_170499 ) ) ( not ( = ?auto_170496 ?auto_170500 ) ) ( not ( = ?auto_170497 ?auto_170498 ) ) ( not ( = ?auto_170497 ?auto_170499 ) ) ( not ( = ?auto_170497 ?auto_170500 ) ) ( not ( = ?auto_170498 ?auto_170499 ) ) ( not ( = ?auto_170498 ?auto_170500 ) ) ( not ( = ?auto_170499 ?auto_170500 ) ) ( ON ?auto_170500 ?auto_170501 ) ( not ( = ?auto_170493 ?auto_170501 ) ) ( not ( = ?auto_170494 ?auto_170501 ) ) ( not ( = ?auto_170495 ?auto_170501 ) ) ( not ( = ?auto_170496 ?auto_170501 ) ) ( not ( = ?auto_170497 ?auto_170501 ) ) ( not ( = ?auto_170498 ?auto_170501 ) ) ( not ( = ?auto_170499 ?auto_170501 ) ) ( not ( = ?auto_170500 ?auto_170501 ) ) ( ON ?auto_170499 ?auto_170500 ) ( ON-TABLE ?auto_170501 ) ( ON ?auto_170498 ?auto_170499 ) ( ON ?auto_170497 ?auto_170498 ) ( ON ?auto_170496 ?auto_170497 ) ( CLEAR ?auto_170496 ) ( HOLDING ?auto_170495 ) ( CLEAR ?auto_170494 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170493 ?auto_170494 ?auto_170495 )
      ( MAKE-8PILE ?auto_170493 ?auto_170494 ?auto_170495 ?auto_170496 ?auto_170497 ?auto_170498 ?auto_170499 ?auto_170500 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170502 - BLOCK
      ?auto_170503 - BLOCK
      ?auto_170504 - BLOCK
      ?auto_170505 - BLOCK
      ?auto_170506 - BLOCK
      ?auto_170507 - BLOCK
      ?auto_170508 - BLOCK
      ?auto_170509 - BLOCK
    )
    :vars
    (
      ?auto_170510 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170502 ) ( ON ?auto_170503 ?auto_170502 ) ( not ( = ?auto_170502 ?auto_170503 ) ) ( not ( = ?auto_170502 ?auto_170504 ) ) ( not ( = ?auto_170502 ?auto_170505 ) ) ( not ( = ?auto_170502 ?auto_170506 ) ) ( not ( = ?auto_170502 ?auto_170507 ) ) ( not ( = ?auto_170502 ?auto_170508 ) ) ( not ( = ?auto_170502 ?auto_170509 ) ) ( not ( = ?auto_170503 ?auto_170504 ) ) ( not ( = ?auto_170503 ?auto_170505 ) ) ( not ( = ?auto_170503 ?auto_170506 ) ) ( not ( = ?auto_170503 ?auto_170507 ) ) ( not ( = ?auto_170503 ?auto_170508 ) ) ( not ( = ?auto_170503 ?auto_170509 ) ) ( not ( = ?auto_170504 ?auto_170505 ) ) ( not ( = ?auto_170504 ?auto_170506 ) ) ( not ( = ?auto_170504 ?auto_170507 ) ) ( not ( = ?auto_170504 ?auto_170508 ) ) ( not ( = ?auto_170504 ?auto_170509 ) ) ( not ( = ?auto_170505 ?auto_170506 ) ) ( not ( = ?auto_170505 ?auto_170507 ) ) ( not ( = ?auto_170505 ?auto_170508 ) ) ( not ( = ?auto_170505 ?auto_170509 ) ) ( not ( = ?auto_170506 ?auto_170507 ) ) ( not ( = ?auto_170506 ?auto_170508 ) ) ( not ( = ?auto_170506 ?auto_170509 ) ) ( not ( = ?auto_170507 ?auto_170508 ) ) ( not ( = ?auto_170507 ?auto_170509 ) ) ( not ( = ?auto_170508 ?auto_170509 ) ) ( ON ?auto_170509 ?auto_170510 ) ( not ( = ?auto_170502 ?auto_170510 ) ) ( not ( = ?auto_170503 ?auto_170510 ) ) ( not ( = ?auto_170504 ?auto_170510 ) ) ( not ( = ?auto_170505 ?auto_170510 ) ) ( not ( = ?auto_170506 ?auto_170510 ) ) ( not ( = ?auto_170507 ?auto_170510 ) ) ( not ( = ?auto_170508 ?auto_170510 ) ) ( not ( = ?auto_170509 ?auto_170510 ) ) ( ON ?auto_170508 ?auto_170509 ) ( ON-TABLE ?auto_170510 ) ( ON ?auto_170507 ?auto_170508 ) ( ON ?auto_170506 ?auto_170507 ) ( ON ?auto_170505 ?auto_170506 ) ( CLEAR ?auto_170503 ) ( ON ?auto_170504 ?auto_170505 ) ( CLEAR ?auto_170504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170510 ?auto_170509 ?auto_170508 ?auto_170507 ?auto_170506 ?auto_170505 )
      ( MAKE-8PILE ?auto_170502 ?auto_170503 ?auto_170504 ?auto_170505 ?auto_170506 ?auto_170507 ?auto_170508 ?auto_170509 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170511 - BLOCK
      ?auto_170512 - BLOCK
      ?auto_170513 - BLOCK
      ?auto_170514 - BLOCK
      ?auto_170515 - BLOCK
      ?auto_170516 - BLOCK
      ?auto_170517 - BLOCK
      ?auto_170518 - BLOCK
    )
    :vars
    (
      ?auto_170519 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170511 ) ( not ( = ?auto_170511 ?auto_170512 ) ) ( not ( = ?auto_170511 ?auto_170513 ) ) ( not ( = ?auto_170511 ?auto_170514 ) ) ( not ( = ?auto_170511 ?auto_170515 ) ) ( not ( = ?auto_170511 ?auto_170516 ) ) ( not ( = ?auto_170511 ?auto_170517 ) ) ( not ( = ?auto_170511 ?auto_170518 ) ) ( not ( = ?auto_170512 ?auto_170513 ) ) ( not ( = ?auto_170512 ?auto_170514 ) ) ( not ( = ?auto_170512 ?auto_170515 ) ) ( not ( = ?auto_170512 ?auto_170516 ) ) ( not ( = ?auto_170512 ?auto_170517 ) ) ( not ( = ?auto_170512 ?auto_170518 ) ) ( not ( = ?auto_170513 ?auto_170514 ) ) ( not ( = ?auto_170513 ?auto_170515 ) ) ( not ( = ?auto_170513 ?auto_170516 ) ) ( not ( = ?auto_170513 ?auto_170517 ) ) ( not ( = ?auto_170513 ?auto_170518 ) ) ( not ( = ?auto_170514 ?auto_170515 ) ) ( not ( = ?auto_170514 ?auto_170516 ) ) ( not ( = ?auto_170514 ?auto_170517 ) ) ( not ( = ?auto_170514 ?auto_170518 ) ) ( not ( = ?auto_170515 ?auto_170516 ) ) ( not ( = ?auto_170515 ?auto_170517 ) ) ( not ( = ?auto_170515 ?auto_170518 ) ) ( not ( = ?auto_170516 ?auto_170517 ) ) ( not ( = ?auto_170516 ?auto_170518 ) ) ( not ( = ?auto_170517 ?auto_170518 ) ) ( ON ?auto_170518 ?auto_170519 ) ( not ( = ?auto_170511 ?auto_170519 ) ) ( not ( = ?auto_170512 ?auto_170519 ) ) ( not ( = ?auto_170513 ?auto_170519 ) ) ( not ( = ?auto_170514 ?auto_170519 ) ) ( not ( = ?auto_170515 ?auto_170519 ) ) ( not ( = ?auto_170516 ?auto_170519 ) ) ( not ( = ?auto_170517 ?auto_170519 ) ) ( not ( = ?auto_170518 ?auto_170519 ) ) ( ON ?auto_170517 ?auto_170518 ) ( ON-TABLE ?auto_170519 ) ( ON ?auto_170516 ?auto_170517 ) ( ON ?auto_170515 ?auto_170516 ) ( ON ?auto_170514 ?auto_170515 ) ( ON ?auto_170513 ?auto_170514 ) ( CLEAR ?auto_170513 ) ( HOLDING ?auto_170512 ) ( CLEAR ?auto_170511 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170511 ?auto_170512 )
      ( MAKE-8PILE ?auto_170511 ?auto_170512 ?auto_170513 ?auto_170514 ?auto_170515 ?auto_170516 ?auto_170517 ?auto_170518 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170520 - BLOCK
      ?auto_170521 - BLOCK
      ?auto_170522 - BLOCK
      ?auto_170523 - BLOCK
      ?auto_170524 - BLOCK
      ?auto_170525 - BLOCK
      ?auto_170526 - BLOCK
      ?auto_170527 - BLOCK
    )
    :vars
    (
      ?auto_170528 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_170520 ) ( not ( = ?auto_170520 ?auto_170521 ) ) ( not ( = ?auto_170520 ?auto_170522 ) ) ( not ( = ?auto_170520 ?auto_170523 ) ) ( not ( = ?auto_170520 ?auto_170524 ) ) ( not ( = ?auto_170520 ?auto_170525 ) ) ( not ( = ?auto_170520 ?auto_170526 ) ) ( not ( = ?auto_170520 ?auto_170527 ) ) ( not ( = ?auto_170521 ?auto_170522 ) ) ( not ( = ?auto_170521 ?auto_170523 ) ) ( not ( = ?auto_170521 ?auto_170524 ) ) ( not ( = ?auto_170521 ?auto_170525 ) ) ( not ( = ?auto_170521 ?auto_170526 ) ) ( not ( = ?auto_170521 ?auto_170527 ) ) ( not ( = ?auto_170522 ?auto_170523 ) ) ( not ( = ?auto_170522 ?auto_170524 ) ) ( not ( = ?auto_170522 ?auto_170525 ) ) ( not ( = ?auto_170522 ?auto_170526 ) ) ( not ( = ?auto_170522 ?auto_170527 ) ) ( not ( = ?auto_170523 ?auto_170524 ) ) ( not ( = ?auto_170523 ?auto_170525 ) ) ( not ( = ?auto_170523 ?auto_170526 ) ) ( not ( = ?auto_170523 ?auto_170527 ) ) ( not ( = ?auto_170524 ?auto_170525 ) ) ( not ( = ?auto_170524 ?auto_170526 ) ) ( not ( = ?auto_170524 ?auto_170527 ) ) ( not ( = ?auto_170525 ?auto_170526 ) ) ( not ( = ?auto_170525 ?auto_170527 ) ) ( not ( = ?auto_170526 ?auto_170527 ) ) ( ON ?auto_170527 ?auto_170528 ) ( not ( = ?auto_170520 ?auto_170528 ) ) ( not ( = ?auto_170521 ?auto_170528 ) ) ( not ( = ?auto_170522 ?auto_170528 ) ) ( not ( = ?auto_170523 ?auto_170528 ) ) ( not ( = ?auto_170524 ?auto_170528 ) ) ( not ( = ?auto_170525 ?auto_170528 ) ) ( not ( = ?auto_170526 ?auto_170528 ) ) ( not ( = ?auto_170527 ?auto_170528 ) ) ( ON ?auto_170526 ?auto_170527 ) ( ON-TABLE ?auto_170528 ) ( ON ?auto_170525 ?auto_170526 ) ( ON ?auto_170524 ?auto_170525 ) ( ON ?auto_170523 ?auto_170524 ) ( ON ?auto_170522 ?auto_170523 ) ( CLEAR ?auto_170520 ) ( ON ?auto_170521 ?auto_170522 ) ( CLEAR ?auto_170521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170528 ?auto_170527 ?auto_170526 ?auto_170525 ?auto_170524 ?auto_170523 ?auto_170522 )
      ( MAKE-8PILE ?auto_170520 ?auto_170521 ?auto_170522 ?auto_170523 ?auto_170524 ?auto_170525 ?auto_170526 ?auto_170527 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170529 - BLOCK
      ?auto_170530 - BLOCK
      ?auto_170531 - BLOCK
      ?auto_170532 - BLOCK
      ?auto_170533 - BLOCK
      ?auto_170534 - BLOCK
      ?auto_170535 - BLOCK
      ?auto_170536 - BLOCK
    )
    :vars
    (
      ?auto_170537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170529 ?auto_170530 ) ) ( not ( = ?auto_170529 ?auto_170531 ) ) ( not ( = ?auto_170529 ?auto_170532 ) ) ( not ( = ?auto_170529 ?auto_170533 ) ) ( not ( = ?auto_170529 ?auto_170534 ) ) ( not ( = ?auto_170529 ?auto_170535 ) ) ( not ( = ?auto_170529 ?auto_170536 ) ) ( not ( = ?auto_170530 ?auto_170531 ) ) ( not ( = ?auto_170530 ?auto_170532 ) ) ( not ( = ?auto_170530 ?auto_170533 ) ) ( not ( = ?auto_170530 ?auto_170534 ) ) ( not ( = ?auto_170530 ?auto_170535 ) ) ( not ( = ?auto_170530 ?auto_170536 ) ) ( not ( = ?auto_170531 ?auto_170532 ) ) ( not ( = ?auto_170531 ?auto_170533 ) ) ( not ( = ?auto_170531 ?auto_170534 ) ) ( not ( = ?auto_170531 ?auto_170535 ) ) ( not ( = ?auto_170531 ?auto_170536 ) ) ( not ( = ?auto_170532 ?auto_170533 ) ) ( not ( = ?auto_170532 ?auto_170534 ) ) ( not ( = ?auto_170532 ?auto_170535 ) ) ( not ( = ?auto_170532 ?auto_170536 ) ) ( not ( = ?auto_170533 ?auto_170534 ) ) ( not ( = ?auto_170533 ?auto_170535 ) ) ( not ( = ?auto_170533 ?auto_170536 ) ) ( not ( = ?auto_170534 ?auto_170535 ) ) ( not ( = ?auto_170534 ?auto_170536 ) ) ( not ( = ?auto_170535 ?auto_170536 ) ) ( ON ?auto_170536 ?auto_170537 ) ( not ( = ?auto_170529 ?auto_170537 ) ) ( not ( = ?auto_170530 ?auto_170537 ) ) ( not ( = ?auto_170531 ?auto_170537 ) ) ( not ( = ?auto_170532 ?auto_170537 ) ) ( not ( = ?auto_170533 ?auto_170537 ) ) ( not ( = ?auto_170534 ?auto_170537 ) ) ( not ( = ?auto_170535 ?auto_170537 ) ) ( not ( = ?auto_170536 ?auto_170537 ) ) ( ON ?auto_170535 ?auto_170536 ) ( ON-TABLE ?auto_170537 ) ( ON ?auto_170534 ?auto_170535 ) ( ON ?auto_170533 ?auto_170534 ) ( ON ?auto_170532 ?auto_170533 ) ( ON ?auto_170531 ?auto_170532 ) ( ON ?auto_170530 ?auto_170531 ) ( CLEAR ?auto_170530 ) ( HOLDING ?auto_170529 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170529 )
      ( MAKE-8PILE ?auto_170529 ?auto_170530 ?auto_170531 ?auto_170532 ?auto_170533 ?auto_170534 ?auto_170535 ?auto_170536 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_170538 - BLOCK
      ?auto_170539 - BLOCK
      ?auto_170540 - BLOCK
      ?auto_170541 - BLOCK
      ?auto_170542 - BLOCK
      ?auto_170543 - BLOCK
      ?auto_170544 - BLOCK
      ?auto_170545 - BLOCK
    )
    :vars
    (
      ?auto_170546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170538 ?auto_170539 ) ) ( not ( = ?auto_170538 ?auto_170540 ) ) ( not ( = ?auto_170538 ?auto_170541 ) ) ( not ( = ?auto_170538 ?auto_170542 ) ) ( not ( = ?auto_170538 ?auto_170543 ) ) ( not ( = ?auto_170538 ?auto_170544 ) ) ( not ( = ?auto_170538 ?auto_170545 ) ) ( not ( = ?auto_170539 ?auto_170540 ) ) ( not ( = ?auto_170539 ?auto_170541 ) ) ( not ( = ?auto_170539 ?auto_170542 ) ) ( not ( = ?auto_170539 ?auto_170543 ) ) ( not ( = ?auto_170539 ?auto_170544 ) ) ( not ( = ?auto_170539 ?auto_170545 ) ) ( not ( = ?auto_170540 ?auto_170541 ) ) ( not ( = ?auto_170540 ?auto_170542 ) ) ( not ( = ?auto_170540 ?auto_170543 ) ) ( not ( = ?auto_170540 ?auto_170544 ) ) ( not ( = ?auto_170540 ?auto_170545 ) ) ( not ( = ?auto_170541 ?auto_170542 ) ) ( not ( = ?auto_170541 ?auto_170543 ) ) ( not ( = ?auto_170541 ?auto_170544 ) ) ( not ( = ?auto_170541 ?auto_170545 ) ) ( not ( = ?auto_170542 ?auto_170543 ) ) ( not ( = ?auto_170542 ?auto_170544 ) ) ( not ( = ?auto_170542 ?auto_170545 ) ) ( not ( = ?auto_170543 ?auto_170544 ) ) ( not ( = ?auto_170543 ?auto_170545 ) ) ( not ( = ?auto_170544 ?auto_170545 ) ) ( ON ?auto_170545 ?auto_170546 ) ( not ( = ?auto_170538 ?auto_170546 ) ) ( not ( = ?auto_170539 ?auto_170546 ) ) ( not ( = ?auto_170540 ?auto_170546 ) ) ( not ( = ?auto_170541 ?auto_170546 ) ) ( not ( = ?auto_170542 ?auto_170546 ) ) ( not ( = ?auto_170543 ?auto_170546 ) ) ( not ( = ?auto_170544 ?auto_170546 ) ) ( not ( = ?auto_170545 ?auto_170546 ) ) ( ON ?auto_170544 ?auto_170545 ) ( ON-TABLE ?auto_170546 ) ( ON ?auto_170543 ?auto_170544 ) ( ON ?auto_170542 ?auto_170543 ) ( ON ?auto_170541 ?auto_170542 ) ( ON ?auto_170540 ?auto_170541 ) ( ON ?auto_170539 ?auto_170540 ) ( ON ?auto_170538 ?auto_170539 ) ( CLEAR ?auto_170538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170546 ?auto_170545 ?auto_170544 ?auto_170543 ?auto_170542 ?auto_170541 ?auto_170540 ?auto_170539 )
      ( MAKE-8PILE ?auto_170538 ?auto_170539 ?auto_170540 ?auto_170541 ?auto_170542 ?auto_170543 ?auto_170544 ?auto_170545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170683 - BLOCK
    )
    :vars
    (
      ?auto_170684 - BLOCK
      ?auto_170685 - BLOCK
      ?auto_170686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170683 ?auto_170684 ) ( CLEAR ?auto_170683 ) ( not ( = ?auto_170683 ?auto_170684 ) ) ( HOLDING ?auto_170685 ) ( CLEAR ?auto_170686 ) ( not ( = ?auto_170683 ?auto_170685 ) ) ( not ( = ?auto_170683 ?auto_170686 ) ) ( not ( = ?auto_170684 ?auto_170685 ) ) ( not ( = ?auto_170684 ?auto_170686 ) ) ( not ( = ?auto_170685 ?auto_170686 ) ) )
    :subtasks
    ( ( !STACK ?auto_170685 ?auto_170686 )
      ( MAKE-1PILE ?auto_170683 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170687 - BLOCK
    )
    :vars
    (
      ?auto_170689 - BLOCK
      ?auto_170690 - BLOCK
      ?auto_170688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170687 ?auto_170689 ) ( not ( = ?auto_170687 ?auto_170689 ) ) ( CLEAR ?auto_170690 ) ( not ( = ?auto_170687 ?auto_170688 ) ) ( not ( = ?auto_170687 ?auto_170690 ) ) ( not ( = ?auto_170689 ?auto_170688 ) ) ( not ( = ?auto_170689 ?auto_170690 ) ) ( not ( = ?auto_170688 ?auto_170690 ) ) ( ON ?auto_170688 ?auto_170687 ) ( CLEAR ?auto_170688 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170689 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170689 ?auto_170687 )
      ( MAKE-1PILE ?auto_170687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170691 - BLOCK
    )
    :vars
    (
      ?auto_170692 - BLOCK
      ?auto_170693 - BLOCK
      ?auto_170694 - BLOCK
      ?auto_170695 - BLOCK
      ?auto_170699 - BLOCK
      ?auto_170696 - BLOCK
      ?auto_170698 - BLOCK
      ?auto_170697 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170691 ?auto_170692 ) ( not ( = ?auto_170691 ?auto_170692 ) ) ( not ( = ?auto_170691 ?auto_170693 ) ) ( not ( = ?auto_170691 ?auto_170694 ) ) ( not ( = ?auto_170692 ?auto_170693 ) ) ( not ( = ?auto_170692 ?auto_170694 ) ) ( not ( = ?auto_170693 ?auto_170694 ) ) ( ON ?auto_170693 ?auto_170691 ) ( CLEAR ?auto_170693 ) ( ON-TABLE ?auto_170692 ) ( HOLDING ?auto_170694 ) ( CLEAR ?auto_170695 ) ( ON-TABLE ?auto_170699 ) ( ON ?auto_170696 ?auto_170699 ) ( ON ?auto_170698 ?auto_170696 ) ( ON ?auto_170697 ?auto_170698 ) ( ON ?auto_170695 ?auto_170697 ) ( not ( = ?auto_170699 ?auto_170696 ) ) ( not ( = ?auto_170699 ?auto_170698 ) ) ( not ( = ?auto_170699 ?auto_170697 ) ) ( not ( = ?auto_170699 ?auto_170695 ) ) ( not ( = ?auto_170699 ?auto_170694 ) ) ( not ( = ?auto_170696 ?auto_170698 ) ) ( not ( = ?auto_170696 ?auto_170697 ) ) ( not ( = ?auto_170696 ?auto_170695 ) ) ( not ( = ?auto_170696 ?auto_170694 ) ) ( not ( = ?auto_170698 ?auto_170697 ) ) ( not ( = ?auto_170698 ?auto_170695 ) ) ( not ( = ?auto_170698 ?auto_170694 ) ) ( not ( = ?auto_170697 ?auto_170695 ) ) ( not ( = ?auto_170697 ?auto_170694 ) ) ( not ( = ?auto_170695 ?auto_170694 ) ) ( not ( = ?auto_170691 ?auto_170695 ) ) ( not ( = ?auto_170691 ?auto_170699 ) ) ( not ( = ?auto_170691 ?auto_170696 ) ) ( not ( = ?auto_170691 ?auto_170698 ) ) ( not ( = ?auto_170691 ?auto_170697 ) ) ( not ( = ?auto_170692 ?auto_170695 ) ) ( not ( = ?auto_170692 ?auto_170699 ) ) ( not ( = ?auto_170692 ?auto_170696 ) ) ( not ( = ?auto_170692 ?auto_170698 ) ) ( not ( = ?auto_170692 ?auto_170697 ) ) ( not ( = ?auto_170693 ?auto_170695 ) ) ( not ( = ?auto_170693 ?auto_170699 ) ) ( not ( = ?auto_170693 ?auto_170696 ) ) ( not ( = ?auto_170693 ?auto_170698 ) ) ( not ( = ?auto_170693 ?auto_170697 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170699 ?auto_170696 ?auto_170698 ?auto_170697 ?auto_170695 ?auto_170694 )
      ( MAKE-1PILE ?auto_170691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170700 - BLOCK
    )
    :vars
    (
      ?auto_170706 - BLOCK
      ?auto_170701 - BLOCK
      ?auto_170705 - BLOCK
      ?auto_170704 - BLOCK
      ?auto_170703 - BLOCK
      ?auto_170708 - BLOCK
      ?auto_170702 - BLOCK
      ?auto_170707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170700 ?auto_170706 ) ( not ( = ?auto_170700 ?auto_170706 ) ) ( not ( = ?auto_170700 ?auto_170701 ) ) ( not ( = ?auto_170700 ?auto_170705 ) ) ( not ( = ?auto_170706 ?auto_170701 ) ) ( not ( = ?auto_170706 ?auto_170705 ) ) ( not ( = ?auto_170701 ?auto_170705 ) ) ( ON ?auto_170701 ?auto_170700 ) ( ON-TABLE ?auto_170706 ) ( CLEAR ?auto_170704 ) ( ON-TABLE ?auto_170703 ) ( ON ?auto_170708 ?auto_170703 ) ( ON ?auto_170702 ?auto_170708 ) ( ON ?auto_170707 ?auto_170702 ) ( ON ?auto_170704 ?auto_170707 ) ( not ( = ?auto_170703 ?auto_170708 ) ) ( not ( = ?auto_170703 ?auto_170702 ) ) ( not ( = ?auto_170703 ?auto_170707 ) ) ( not ( = ?auto_170703 ?auto_170704 ) ) ( not ( = ?auto_170703 ?auto_170705 ) ) ( not ( = ?auto_170708 ?auto_170702 ) ) ( not ( = ?auto_170708 ?auto_170707 ) ) ( not ( = ?auto_170708 ?auto_170704 ) ) ( not ( = ?auto_170708 ?auto_170705 ) ) ( not ( = ?auto_170702 ?auto_170707 ) ) ( not ( = ?auto_170702 ?auto_170704 ) ) ( not ( = ?auto_170702 ?auto_170705 ) ) ( not ( = ?auto_170707 ?auto_170704 ) ) ( not ( = ?auto_170707 ?auto_170705 ) ) ( not ( = ?auto_170704 ?auto_170705 ) ) ( not ( = ?auto_170700 ?auto_170704 ) ) ( not ( = ?auto_170700 ?auto_170703 ) ) ( not ( = ?auto_170700 ?auto_170708 ) ) ( not ( = ?auto_170700 ?auto_170702 ) ) ( not ( = ?auto_170700 ?auto_170707 ) ) ( not ( = ?auto_170706 ?auto_170704 ) ) ( not ( = ?auto_170706 ?auto_170703 ) ) ( not ( = ?auto_170706 ?auto_170708 ) ) ( not ( = ?auto_170706 ?auto_170702 ) ) ( not ( = ?auto_170706 ?auto_170707 ) ) ( not ( = ?auto_170701 ?auto_170704 ) ) ( not ( = ?auto_170701 ?auto_170703 ) ) ( not ( = ?auto_170701 ?auto_170708 ) ) ( not ( = ?auto_170701 ?auto_170702 ) ) ( not ( = ?auto_170701 ?auto_170707 ) ) ( ON ?auto_170705 ?auto_170701 ) ( CLEAR ?auto_170705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170706 ?auto_170700 ?auto_170701 )
      ( MAKE-1PILE ?auto_170700 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170709 - BLOCK
    )
    :vars
    (
      ?auto_170715 - BLOCK
      ?auto_170714 - BLOCK
      ?auto_170716 - BLOCK
      ?auto_170717 - BLOCK
      ?auto_170712 - BLOCK
      ?auto_170710 - BLOCK
      ?auto_170711 - BLOCK
      ?auto_170713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170709 ?auto_170715 ) ( not ( = ?auto_170709 ?auto_170715 ) ) ( not ( = ?auto_170709 ?auto_170714 ) ) ( not ( = ?auto_170709 ?auto_170716 ) ) ( not ( = ?auto_170715 ?auto_170714 ) ) ( not ( = ?auto_170715 ?auto_170716 ) ) ( not ( = ?auto_170714 ?auto_170716 ) ) ( ON ?auto_170714 ?auto_170709 ) ( ON-TABLE ?auto_170715 ) ( ON-TABLE ?auto_170717 ) ( ON ?auto_170712 ?auto_170717 ) ( ON ?auto_170710 ?auto_170712 ) ( ON ?auto_170711 ?auto_170710 ) ( not ( = ?auto_170717 ?auto_170712 ) ) ( not ( = ?auto_170717 ?auto_170710 ) ) ( not ( = ?auto_170717 ?auto_170711 ) ) ( not ( = ?auto_170717 ?auto_170713 ) ) ( not ( = ?auto_170717 ?auto_170716 ) ) ( not ( = ?auto_170712 ?auto_170710 ) ) ( not ( = ?auto_170712 ?auto_170711 ) ) ( not ( = ?auto_170712 ?auto_170713 ) ) ( not ( = ?auto_170712 ?auto_170716 ) ) ( not ( = ?auto_170710 ?auto_170711 ) ) ( not ( = ?auto_170710 ?auto_170713 ) ) ( not ( = ?auto_170710 ?auto_170716 ) ) ( not ( = ?auto_170711 ?auto_170713 ) ) ( not ( = ?auto_170711 ?auto_170716 ) ) ( not ( = ?auto_170713 ?auto_170716 ) ) ( not ( = ?auto_170709 ?auto_170713 ) ) ( not ( = ?auto_170709 ?auto_170717 ) ) ( not ( = ?auto_170709 ?auto_170712 ) ) ( not ( = ?auto_170709 ?auto_170710 ) ) ( not ( = ?auto_170709 ?auto_170711 ) ) ( not ( = ?auto_170715 ?auto_170713 ) ) ( not ( = ?auto_170715 ?auto_170717 ) ) ( not ( = ?auto_170715 ?auto_170712 ) ) ( not ( = ?auto_170715 ?auto_170710 ) ) ( not ( = ?auto_170715 ?auto_170711 ) ) ( not ( = ?auto_170714 ?auto_170713 ) ) ( not ( = ?auto_170714 ?auto_170717 ) ) ( not ( = ?auto_170714 ?auto_170712 ) ) ( not ( = ?auto_170714 ?auto_170710 ) ) ( not ( = ?auto_170714 ?auto_170711 ) ) ( ON ?auto_170716 ?auto_170714 ) ( CLEAR ?auto_170716 ) ( HOLDING ?auto_170713 ) ( CLEAR ?auto_170711 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170717 ?auto_170712 ?auto_170710 ?auto_170711 ?auto_170713 )
      ( MAKE-1PILE ?auto_170709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170718 - BLOCK
    )
    :vars
    (
      ?auto_170720 - BLOCK
      ?auto_170726 - BLOCK
      ?auto_170725 - BLOCK
      ?auto_170724 - BLOCK
      ?auto_170719 - BLOCK
      ?auto_170723 - BLOCK
      ?auto_170721 - BLOCK
      ?auto_170722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170718 ?auto_170720 ) ( not ( = ?auto_170718 ?auto_170720 ) ) ( not ( = ?auto_170718 ?auto_170726 ) ) ( not ( = ?auto_170718 ?auto_170725 ) ) ( not ( = ?auto_170720 ?auto_170726 ) ) ( not ( = ?auto_170720 ?auto_170725 ) ) ( not ( = ?auto_170726 ?auto_170725 ) ) ( ON ?auto_170726 ?auto_170718 ) ( ON-TABLE ?auto_170720 ) ( ON-TABLE ?auto_170724 ) ( ON ?auto_170719 ?auto_170724 ) ( ON ?auto_170723 ?auto_170719 ) ( ON ?auto_170721 ?auto_170723 ) ( not ( = ?auto_170724 ?auto_170719 ) ) ( not ( = ?auto_170724 ?auto_170723 ) ) ( not ( = ?auto_170724 ?auto_170721 ) ) ( not ( = ?auto_170724 ?auto_170722 ) ) ( not ( = ?auto_170724 ?auto_170725 ) ) ( not ( = ?auto_170719 ?auto_170723 ) ) ( not ( = ?auto_170719 ?auto_170721 ) ) ( not ( = ?auto_170719 ?auto_170722 ) ) ( not ( = ?auto_170719 ?auto_170725 ) ) ( not ( = ?auto_170723 ?auto_170721 ) ) ( not ( = ?auto_170723 ?auto_170722 ) ) ( not ( = ?auto_170723 ?auto_170725 ) ) ( not ( = ?auto_170721 ?auto_170722 ) ) ( not ( = ?auto_170721 ?auto_170725 ) ) ( not ( = ?auto_170722 ?auto_170725 ) ) ( not ( = ?auto_170718 ?auto_170722 ) ) ( not ( = ?auto_170718 ?auto_170724 ) ) ( not ( = ?auto_170718 ?auto_170719 ) ) ( not ( = ?auto_170718 ?auto_170723 ) ) ( not ( = ?auto_170718 ?auto_170721 ) ) ( not ( = ?auto_170720 ?auto_170722 ) ) ( not ( = ?auto_170720 ?auto_170724 ) ) ( not ( = ?auto_170720 ?auto_170719 ) ) ( not ( = ?auto_170720 ?auto_170723 ) ) ( not ( = ?auto_170720 ?auto_170721 ) ) ( not ( = ?auto_170726 ?auto_170722 ) ) ( not ( = ?auto_170726 ?auto_170724 ) ) ( not ( = ?auto_170726 ?auto_170719 ) ) ( not ( = ?auto_170726 ?auto_170723 ) ) ( not ( = ?auto_170726 ?auto_170721 ) ) ( ON ?auto_170725 ?auto_170726 ) ( CLEAR ?auto_170721 ) ( ON ?auto_170722 ?auto_170725 ) ( CLEAR ?auto_170722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170720 ?auto_170718 ?auto_170726 ?auto_170725 )
      ( MAKE-1PILE ?auto_170718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170727 - BLOCK
    )
    :vars
    (
      ?auto_170732 - BLOCK
      ?auto_170729 - BLOCK
      ?auto_170735 - BLOCK
      ?auto_170730 - BLOCK
      ?auto_170734 - BLOCK
      ?auto_170733 - BLOCK
      ?auto_170731 - BLOCK
      ?auto_170728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170727 ?auto_170732 ) ( not ( = ?auto_170727 ?auto_170732 ) ) ( not ( = ?auto_170727 ?auto_170729 ) ) ( not ( = ?auto_170727 ?auto_170735 ) ) ( not ( = ?auto_170732 ?auto_170729 ) ) ( not ( = ?auto_170732 ?auto_170735 ) ) ( not ( = ?auto_170729 ?auto_170735 ) ) ( ON ?auto_170729 ?auto_170727 ) ( ON-TABLE ?auto_170732 ) ( ON-TABLE ?auto_170730 ) ( ON ?auto_170734 ?auto_170730 ) ( ON ?auto_170733 ?auto_170734 ) ( not ( = ?auto_170730 ?auto_170734 ) ) ( not ( = ?auto_170730 ?auto_170733 ) ) ( not ( = ?auto_170730 ?auto_170731 ) ) ( not ( = ?auto_170730 ?auto_170728 ) ) ( not ( = ?auto_170730 ?auto_170735 ) ) ( not ( = ?auto_170734 ?auto_170733 ) ) ( not ( = ?auto_170734 ?auto_170731 ) ) ( not ( = ?auto_170734 ?auto_170728 ) ) ( not ( = ?auto_170734 ?auto_170735 ) ) ( not ( = ?auto_170733 ?auto_170731 ) ) ( not ( = ?auto_170733 ?auto_170728 ) ) ( not ( = ?auto_170733 ?auto_170735 ) ) ( not ( = ?auto_170731 ?auto_170728 ) ) ( not ( = ?auto_170731 ?auto_170735 ) ) ( not ( = ?auto_170728 ?auto_170735 ) ) ( not ( = ?auto_170727 ?auto_170728 ) ) ( not ( = ?auto_170727 ?auto_170730 ) ) ( not ( = ?auto_170727 ?auto_170734 ) ) ( not ( = ?auto_170727 ?auto_170733 ) ) ( not ( = ?auto_170727 ?auto_170731 ) ) ( not ( = ?auto_170732 ?auto_170728 ) ) ( not ( = ?auto_170732 ?auto_170730 ) ) ( not ( = ?auto_170732 ?auto_170734 ) ) ( not ( = ?auto_170732 ?auto_170733 ) ) ( not ( = ?auto_170732 ?auto_170731 ) ) ( not ( = ?auto_170729 ?auto_170728 ) ) ( not ( = ?auto_170729 ?auto_170730 ) ) ( not ( = ?auto_170729 ?auto_170734 ) ) ( not ( = ?auto_170729 ?auto_170733 ) ) ( not ( = ?auto_170729 ?auto_170731 ) ) ( ON ?auto_170735 ?auto_170729 ) ( ON ?auto_170728 ?auto_170735 ) ( CLEAR ?auto_170728 ) ( HOLDING ?auto_170731 ) ( CLEAR ?auto_170733 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_170730 ?auto_170734 ?auto_170733 ?auto_170731 )
      ( MAKE-1PILE ?auto_170727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170736 - BLOCK
    )
    :vars
    (
      ?auto_170739 - BLOCK
      ?auto_170740 - BLOCK
      ?auto_170738 - BLOCK
      ?auto_170743 - BLOCK
      ?auto_170742 - BLOCK
      ?auto_170744 - BLOCK
      ?auto_170741 - BLOCK
      ?auto_170737 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170736 ?auto_170739 ) ( not ( = ?auto_170736 ?auto_170739 ) ) ( not ( = ?auto_170736 ?auto_170740 ) ) ( not ( = ?auto_170736 ?auto_170738 ) ) ( not ( = ?auto_170739 ?auto_170740 ) ) ( not ( = ?auto_170739 ?auto_170738 ) ) ( not ( = ?auto_170740 ?auto_170738 ) ) ( ON ?auto_170740 ?auto_170736 ) ( ON-TABLE ?auto_170739 ) ( ON-TABLE ?auto_170743 ) ( ON ?auto_170742 ?auto_170743 ) ( ON ?auto_170744 ?auto_170742 ) ( not ( = ?auto_170743 ?auto_170742 ) ) ( not ( = ?auto_170743 ?auto_170744 ) ) ( not ( = ?auto_170743 ?auto_170741 ) ) ( not ( = ?auto_170743 ?auto_170737 ) ) ( not ( = ?auto_170743 ?auto_170738 ) ) ( not ( = ?auto_170742 ?auto_170744 ) ) ( not ( = ?auto_170742 ?auto_170741 ) ) ( not ( = ?auto_170742 ?auto_170737 ) ) ( not ( = ?auto_170742 ?auto_170738 ) ) ( not ( = ?auto_170744 ?auto_170741 ) ) ( not ( = ?auto_170744 ?auto_170737 ) ) ( not ( = ?auto_170744 ?auto_170738 ) ) ( not ( = ?auto_170741 ?auto_170737 ) ) ( not ( = ?auto_170741 ?auto_170738 ) ) ( not ( = ?auto_170737 ?auto_170738 ) ) ( not ( = ?auto_170736 ?auto_170737 ) ) ( not ( = ?auto_170736 ?auto_170743 ) ) ( not ( = ?auto_170736 ?auto_170742 ) ) ( not ( = ?auto_170736 ?auto_170744 ) ) ( not ( = ?auto_170736 ?auto_170741 ) ) ( not ( = ?auto_170739 ?auto_170737 ) ) ( not ( = ?auto_170739 ?auto_170743 ) ) ( not ( = ?auto_170739 ?auto_170742 ) ) ( not ( = ?auto_170739 ?auto_170744 ) ) ( not ( = ?auto_170739 ?auto_170741 ) ) ( not ( = ?auto_170740 ?auto_170737 ) ) ( not ( = ?auto_170740 ?auto_170743 ) ) ( not ( = ?auto_170740 ?auto_170742 ) ) ( not ( = ?auto_170740 ?auto_170744 ) ) ( not ( = ?auto_170740 ?auto_170741 ) ) ( ON ?auto_170738 ?auto_170740 ) ( ON ?auto_170737 ?auto_170738 ) ( CLEAR ?auto_170744 ) ( ON ?auto_170741 ?auto_170737 ) ( CLEAR ?auto_170741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170739 ?auto_170736 ?auto_170740 ?auto_170738 ?auto_170737 )
      ( MAKE-1PILE ?auto_170736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170745 - BLOCK
    )
    :vars
    (
      ?auto_170749 - BLOCK
      ?auto_170753 - BLOCK
      ?auto_170751 - BLOCK
      ?auto_170748 - BLOCK
      ?auto_170747 - BLOCK
      ?auto_170750 - BLOCK
      ?auto_170752 - BLOCK
      ?auto_170746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170745 ?auto_170749 ) ( not ( = ?auto_170745 ?auto_170749 ) ) ( not ( = ?auto_170745 ?auto_170753 ) ) ( not ( = ?auto_170745 ?auto_170751 ) ) ( not ( = ?auto_170749 ?auto_170753 ) ) ( not ( = ?auto_170749 ?auto_170751 ) ) ( not ( = ?auto_170753 ?auto_170751 ) ) ( ON ?auto_170753 ?auto_170745 ) ( ON-TABLE ?auto_170749 ) ( ON-TABLE ?auto_170748 ) ( ON ?auto_170747 ?auto_170748 ) ( not ( = ?auto_170748 ?auto_170747 ) ) ( not ( = ?auto_170748 ?auto_170750 ) ) ( not ( = ?auto_170748 ?auto_170752 ) ) ( not ( = ?auto_170748 ?auto_170746 ) ) ( not ( = ?auto_170748 ?auto_170751 ) ) ( not ( = ?auto_170747 ?auto_170750 ) ) ( not ( = ?auto_170747 ?auto_170752 ) ) ( not ( = ?auto_170747 ?auto_170746 ) ) ( not ( = ?auto_170747 ?auto_170751 ) ) ( not ( = ?auto_170750 ?auto_170752 ) ) ( not ( = ?auto_170750 ?auto_170746 ) ) ( not ( = ?auto_170750 ?auto_170751 ) ) ( not ( = ?auto_170752 ?auto_170746 ) ) ( not ( = ?auto_170752 ?auto_170751 ) ) ( not ( = ?auto_170746 ?auto_170751 ) ) ( not ( = ?auto_170745 ?auto_170746 ) ) ( not ( = ?auto_170745 ?auto_170748 ) ) ( not ( = ?auto_170745 ?auto_170747 ) ) ( not ( = ?auto_170745 ?auto_170750 ) ) ( not ( = ?auto_170745 ?auto_170752 ) ) ( not ( = ?auto_170749 ?auto_170746 ) ) ( not ( = ?auto_170749 ?auto_170748 ) ) ( not ( = ?auto_170749 ?auto_170747 ) ) ( not ( = ?auto_170749 ?auto_170750 ) ) ( not ( = ?auto_170749 ?auto_170752 ) ) ( not ( = ?auto_170753 ?auto_170746 ) ) ( not ( = ?auto_170753 ?auto_170748 ) ) ( not ( = ?auto_170753 ?auto_170747 ) ) ( not ( = ?auto_170753 ?auto_170750 ) ) ( not ( = ?auto_170753 ?auto_170752 ) ) ( ON ?auto_170751 ?auto_170753 ) ( ON ?auto_170746 ?auto_170751 ) ( ON ?auto_170752 ?auto_170746 ) ( CLEAR ?auto_170752 ) ( HOLDING ?auto_170750 ) ( CLEAR ?auto_170747 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170748 ?auto_170747 ?auto_170750 )
      ( MAKE-1PILE ?auto_170745 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170754 - BLOCK
    )
    :vars
    (
      ?auto_170762 - BLOCK
      ?auto_170759 - BLOCK
      ?auto_170758 - BLOCK
      ?auto_170755 - BLOCK
      ?auto_170756 - BLOCK
      ?auto_170760 - BLOCK
      ?auto_170757 - BLOCK
      ?auto_170761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170754 ?auto_170762 ) ( not ( = ?auto_170754 ?auto_170762 ) ) ( not ( = ?auto_170754 ?auto_170759 ) ) ( not ( = ?auto_170754 ?auto_170758 ) ) ( not ( = ?auto_170762 ?auto_170759 ) ) ( not ( = ?auto_170762 ?auto_170758 ) ) ( not ( = ?auto_170759 ?auto_170758 ) ) ( ON ?auto_170759 ?auto_170754 ) ( ON-TABLE ?auto_170762 ) ( ON-TABLE ?auto_170755 ) ( ON ?auto_170756 ?auto_170755 ) ( not ( = ?auto_170755 ?auto_170756 ) ) ( not ( = ?auto_170755 ?auto_170760 ) ) ( not ( = ?auto_170755 ?auto_170757 ) ) ( not ( = ?auto_170755 ?auto_170761 ) ) ( not ( = ?auto_170755 ?auto_170758 ) ) ( not ( = ?auto_170756 ?auto_170760 ) ) ( not ( = ?auto_170756 ?auto_170757 ) ) ( not ( = ?auto_170756 ?auto_170761 ) ) ( not ( = ?auto_170756 ?auto_170758 ) ) ( not ( = ?auto_170760 ?auto_170757 ) ) ( not ( = ?auto_170760 ?auto_170761 ) ) ( not ( = ?auto_170760 ?auto_170758 ) ) ( not ( = ?auto_170757 ?auto_170761 ) ) ( not ( = ?auto_170757 ?auto_170758 ) ) ( not ( = ?auto_170761 ?auto_170758 ) ) ( not ( = ?auto_170754 ?auto_170761 ) ) ( not ( = ?auto_170754 ?auto_170755 ) ) ( not ( = ?auto_170754 ?auto_170756 ) ) ( not ( = ?auto_170754 ?auto_170760 ) ) ( not ( = ?auto_170754 ?auto_170757 ) ) ( not ( = ?auto_170762 ?auto_170761 ) ) ( not ( = ?auto_170762 ?auto_170755 ) ) ( not ( = ?auto_170762 ?auto_170756 ) ) ( not ( = ?auto_170762 ?auto_170760 ) ) ( not ( = ?auto_170762 ?auto_170757 ) ) ( not ( = ?auto_170759 ?auto_170761 ) ) ( not ( = ?auto_170759 ?auto_170755 ) ) ( not ( = ?auto_170759 ?auto_170756 ) ) ( not ( = ?auto_170759 ?auto_170760 ) ) ( not ( = ?auto_170759 ?auto_170757 ) ) ( ON ?auto_170758 ?auto_170759 ) ( ON ?auto_170761 ?auto_170758 ) ( ON ?auto_170757 ?auto_170761 ) ( CLEAR ?auto_170756 ) ( ON ?auto_170760 ?auto_170757 ) ( CLEAR ?auto_170760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170762 ?auto_170754 ?auto_170759 ?auto_170758 ?auto_170761 ?auto_170757 )
      ( MAKE-1PILE ?auto_170754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170763 - BLOCK
    )
    :vars
    (
      ?auto_170769 - BLOCK
      ?auto_170767 - BLOCK
      ?auto_170765 - BLOCK
      ?auto_170771 - BLOCK
      ?auto_170770 - BLOCK
      ?auto_170766 - BLOCK
      ?auto_170768 - BLOCK
      ?auto_170764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170763 ?auto_170769 ) ( not ( = ?auto_170763 ?auto_170769 ) ) ( not ( = ?auto_170763 ?auto_170767 ) ) ( not ( = ?auto_170763 ?auto_170765 ) ) ( not ( = ?auto_170769 ?auto_170767 ) ) ( not ( = ?auto_170769 ?auto_170765 ) ) ( not ( = ?auto_170767 ?auto_170765 ) ) ( ON ?auto_170767 ?auto_170763 ) ( ON-TABLE ?auto_170769 ) ( ON-TABLE ?auto_170771 ) ( not ( = ?auto_170771 ?auto_170770 ) ) ( not ( = ?auto_170771 ?auto_170766 ) ) ( not ( = ?auto_170771 ?auto_170768 ) ) ( not ( = ?auto_170771 ?auto_170764 ) ) ( not ( = ?auto_170771 ?auto_170765 ) ) ( not ( = ?auto_170770 ?auto_170766 ) ) ( not ( = ?auto_170770 ?auto_170768 ) ) ( not ( = ?auto_170770 ?auto_170764 ) ) ( not ( = ?auto_170770 ?auto_170765 ) ) ( not ( = ?auto_170766 ?auto_170768 ) ) ( not ( = ?auto_170766 ?auto_170764 ) ) ( not ( = ?auto_170766 ?auto_170765 ) ) ( not ( = ?auto_170768 ?auto_170764 ) ) ( not ( = ?auto_170768 ?auto_170765 ) ) ( not ( = ?auto_170764 ?auto_170765 ) ) ( not ( = ?auto_170763 ?auto_170764 ) ) ( not ( = ?auto_170763 ?auto_170771 ) ) ( not ( = ?auto_170763 ?auto_170770 ) ) ( not ( = ?auto_170763 ?auto_170766 ) ) ( not ( = ?auto_170763 ?auto_170768 ) ) ( not ( = ?auto_170769 ?auto_170764 ) ) ( not ( = ?auto_170769 ?auto_170771 ) ) ( not ( = ?auto_170769 ?auto_170770 ) ) ( not ( = ?auto_170769 ?auto_170766 ) ) ( not ( = ?auto_170769 ?auto_170768 ) ) ( not ( = ?auto_170767 ?auto_170764 ) ) ( not ( = ?auto_170767 ?auto_170771 ) ) ( not ( = ?auto_170767 ?auto_170770 ) ) ( not ( = ?auto_170767 ?auto_170766 ) ) ( not ( = ?auto_170767 ?auto_170768 ) ) ( ON ?auto_170765 ?auto_170767 ) ( ON ?auto_170764 ?auto_170765 ) ( ON ?auto_170768 ?auto_170764 ) ( ON ?auto_170766 ?auto_170768 ) ( CLEAR ?auto_170766 ) ( HOLDING ?auto_170770 ) ( CLEAR ?auto_170771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170771 ?auto_170770 )
      ( MAKE-1PILE ?auto_170763 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170772 - BLOCK
    )
    :vars
    (
      ?auto_170780 - BLOCK
      ?auto_170774 - BLOCK
      ?auto_170773 - BLOCK
      ?auto_170776 - BLOCK
      ?auto_170775 - BLOCK
      ?auto_170778 - BLOCK
      ?auto_170779 - BLOCK
      ?auto_170777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170772 ?auto_170780 ) ( not ( = ?auto_170772 ?auto_170780 ) ) ( not ( = ?auto_170772 ?auto_170774 ) ) ( not ( = ?auto_170772 ?auto_170773 ) ) ( not ( = ?auto_170780 ?auto_170774 ) ) ( not ( = ?auto_170780 ?auto_170773 ) ) ( not ( = ?auto_170774 ?auto_170773 ) ) ( ON ?auto_170774 ?auto_170772 ) ( ON-TABLE ?auto_170780 ) ( ON-TABLE ?auto_170776 ) ( not ( = ?auto_170776 ?auto_170775 ) ) ( not ( = ?auto_170776 ?auto_170778 ) ) ( not ( = ?auto_170776 ?auto_170779 ) ) ( not ( = ?auto_170776 ?auto_170777 ) ) ( not ( = ?auto_170776 ?auto_170773 ) ) ( not ( = ?auto_170775 ?auto_170778 ) ) ( not ( = ?auto_170775 ?auto_170779 ) ) ( not ( = ?auto_170775 ?auto_170777 ) ) ( not ( = ?auto_170775 ?auto_170773 ) ) ( not ( = ?auto_170778 ?auto_170779 ) ) ( not ( = ?auto_170778 ?auto_170777 ) ) ( not ( = ?auto_170778 ?auto_170773 ) ) ( not ( = ?auto_170779 ?auto_170777 ) ) ( not ( = ?auto_170779 ?auto_170773 ) ) ( not ( = ?auto_170777 ?auto_170773 ) ) ( not ( = ?auto_170772 ?auto_170777 ) ) ( not ( = ?auto_170772 ?auto_170776 ) ) ( not ( = ?auto_170772 ?auto_170775 ) ) ( not ( = ?auto_170772 ?auto_170778 ) ) ( not ( = ?auto_170772 ?auto_170779 ) ) ( not ( = ?auto_170780 ?auto_170777 ) ) ( not ( = ?auto_170780 ?auto_170776 ) ) ( not ( = ?auto_170780 ?auto_170775 ) ) ( not ( = ?auto_170780 ?auto_170778 ) ) ( not ( = ?auto_170780 ?auto_170779 ) ) ( not ( = ?auto_170774 ?auto_170777 ) ) ( not ( = ?auto_170774 ?auto_170776 ) ) ( not ( = ?auto_170774 ?auto_170775 ) ) ( not ( = ?auto_170774 ?auto_170778 ) ) ( not ( = ?auto_170774 ?auto_170779 ) ) ( ON ?auto_170773 ?auto_170774 ) ( ON ?auto_170777 ?auto_170773 ) ( ON ?auto_170779 ?auto_170777 ) ( ON ?auto_170778 ?auto_170779 ) ( CLEAR ?auto_170776 ) ( ON ?auto_170775 ?auto_170778 ) ( CLEAR ?auto_170775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170780 ?auto_170772 ?auto_170774 ?auto_170773 ?auto_170777 ?auto_170779 ?auto_170778 )
      ( MAKE-1PILE ?auto_170772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170781 - BLOCK
    )
    :vars
    (
      ?auto_170787 - BLOCK
      ?auto_170782 - BLOCK
      ?auto_170783 - BLOCK
      ?auto_170785 - BLOCK
      ?auto_170788 - BLOCK
      ?auto_170786 - BLOCK
      ?auto_170784 - BLOCK
      ?auto_170789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170781 ?auto_170787 ) ( not ( = ?auto_170781 ?auto_170787 ) ) ( not ( = ?auto_170781 ?auto_170782 ) ) ( not ( = ?auto_170781 ?auto_170783 ) ) ( not ( = ?auto_170787 ?auto_170782 ) ) ( not ( = ?auto_170787 ?auto_170783 ) ) ( not ( = ?auto_170782 ?auto_170783 ) ) ( ON ?auto_170782 ?auto_170781 ) ( ON-TABLE ?auto_170787 ) ( not ( = ?auto_170785 ?auto_170788 ) ) ( not ( = ?auto_170785 ?auto_170786 ) ) ( not ( = ?auto_170785 ?auto_170784 ) ) ( not ( = ?auto_170785 ?auto_170789 ) ) ( not ( = ?auto_170785 ?auto_170783 ) ) ( not ( = ?auto_170788 ?auto_170786 ) ) ( not ( = ?auto_170788 ?auto_170784 ) ) ( not ( = ?auto_170788 ?auto_170789 ) ) ( not ( = ?auto_170788 ?auto_170783 ) ) ( not ( = ?auto_170786 ?auto_170784 ) ) ( not ( = ?auto_170786 ?auto_170789 ) ) ( not ( = ?auto_170786 ?auto_170783 ) ) ( not ( = ?auto_170784 ?auto_170789 ) ) ( not ( = ?auto_170784 ?auto_170783 ) ) ( not ( = ?auto_170789 ?auto_170783 ) ) ( not ( = ?auto_170781 ?auto_170789 ) ) ( not ( = ?auto_170781 ?auto_170785 ) ) ( not ( = ?auto_170781 ?auto_170788 ) ) ( not ( = ?auto_170781 ?auto_170786 ) ) ( not ( = ?auto_170781 ?auto_170784 ) ) ( not ( = ?auto_170787 ?auto_170789 ) ) ( not ( = ?auto_170787 ?auto_170785 ) ) ( not ( = ?auto_170787 ?auto_170788 ) ) ( not ( = ?auto_170787 ?auto_170786 ) ) ( not ( = ?auto_170787 ?auto_170784 ) ) ( not ( = ?auto_170782 ?auto_170789 ) ) ( not ( = ?auto_170782 ?auto_170785 ) ) ( not ( = ?auto_170782 ?auto_170788 ) ) ( not ( = ?auto_170782 ?auto_170786 ) ) ( not ( = ?auto_170782 ?auto_170784 ) ) ( ON ?auto_170783 ?auto_170782 ) ( ON ?auto_170789 ?auto_170783 ) ( ON ?auto_170784 ?auto_170789 ) ( ON ?auto_170786 ?auto_170784 ) ( ON ?auto_170788 ?auto_170786 ) ( CLEAR ?auto_170788 ) ( HOLDING ?auto_170785 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_170785 )
      ( MAKE-1PILE ?auto_170781 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_170790 - BLOCK
    )
    :vars
    (
      ?auto_170791 - BLOCK
      ?auto_170794 - BLOCK
      ?auto_170795 - BLOCK
      ?auto_170793 - BLOCK
      ?auto_170796 - BLOCK
      ?auto_170792 - BLOCK
      ?auto_170798 - BLOCK
      ?auto_170797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170790 ?auto_170791 ) ( not ( = ?auto_170790 ?auto_170791 ) ) ( not ( = ?auto_170790 ?auto_170794 ) ) ( not ( = ?auto_170790 ?auto_170795 ) ) ( not ( = ?auto_170791 ?auto_170794 ) ) ( not ( = ?auto_170791 ?auto_170795 ) ) ( not ( = ?auto_170794 ?auto_170795 ) ) ( ON ?auto_170794 ?auto_170790 ) ( ON-TABLE ?auto_170791 ) ( not ( = ?auto_170793 ?auto_170796 ) ) ( not ( = ?auto_170793 ?auto_170792 ) ) ( not ( = ?auto_170793 ?auto_170798 ) ) ( not ( = ?auto_170793 ?auto_170797 ) ) ( not ( = ?auto_170793 ?auto_170795 ) ) ( not ( = ?auto_170796 ?auto_170792 ) ) ( not ( = ?auto_170796 ?auto_170798 ) ) ( not ( = ?auto_170796 ?auto_170797 ) ) ( not ( = ?auto_170796 ?auto_170795 ) ) ( not ( = ?auto_170792 ?auto_170798 ) ) ( not ( = ?auto_170792 ?auto_170797 ) ) ( not ( = ?auto_170792 ?auto_170795 ) ) ( not ( = ?auto_170798 ?auto_170797 ) ) ( not ( = ?auto_170798 ?auto_170795 ) ) ( not ( = ?auto_170797 ?auto_170795 ) ) ( not ( = ?auto_170790 ?auto_170797 ) ) ( not ( = ?auto_170790 ?auto_170793 ) ) ( not ( = ?auto_170790 ?auto_170796 ) ) ( not ( = ?auto_170790 ?auto_170792 ) ) ( not ( = ?auto_170790 ?auto_170798 ) ) ( not ( = ?auto_170791 ?auto_170797 ) ) ( not ( = ?auto_170791 ?auto_170793 ) ) ( not ( = ?auto_170791 ?auto_170796 ) ) ( not ( = ?auto_170791 ?auto_170792 ) ) ( not ( = ?auto_170791 ?auto_170798 ) ) ( not ( = ?auto_170794 ?auto_170797 ) ) ( not ( = ?auto_170794 ?auto_170793 ) ) ( not ( = ?auto_170794 ?auto_170796 ) ) ( not ( = ?auto_170794 ?auto_170792 ) ) ( not ( = ?auto_170794 ?auto_170798 ) ) ( ON ?auto_170795 ?auto_170794 ) ( ON ?auto_170797 ?auto_170795 ) ( ON ?auto_170798 ?auto_170797 ) ( ON ?auto_170792 ?auto_170798 ) ( ON ?auto_170796 ?auto_170792 ) ( ON ?auto_170793 ?auto_170796 ) ( CLEAR ?auto_170793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_170791 ?auto_170790 ?auto_170794 ?auto_170795 ?auto_170797 ?auto_170798 ?auto_170792 ?auto_170796 )
      ( MAKE-1PILE ?auto_170790 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_170812 - BLOCK
      ?auto_170813 - BLOCK
      ?auto_170814 - BLOCK
      ?auto_170815 - BLOCK
      ?auto_170816 - BLOCK
      ?auto_170817 - BLOCK
    )
    :vars
    (
      ?auto_170818 - BLOCK
      ?auto_170819 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_170818 ?auto_170817 ) ( CLEAR ?auto_170818 ) ( ON-TABLE ?auto_170812 ) ( ON ?auto_170813 ?auto_170812 ) ( ON ?auto_170814 ?auto_170813 ) ( ON ?auto_170815 ?auto_170814 ) ( ON ?auto_170816 ?auto_170815 ) ( ON ?auto_170817 ?auto_170816 ) ( not ( = ?auto_170812 ?auto_170813 ) ) ( not ( = ?auto_170812 ?auto_170814 ) ) ( not ( = ?auto_170812 ?auto_170815 ) ) ( not ( = ?auto_170812 ?auto_170816 ) ) ( not ( = ?auto_170812 ?auto_170817 ) ) ( not ( = ?auto_170812 ?auto_170818 ) ) ( not ( = ?auto_170813 ?auto_170814 ) ) ( not ( = ?auto_170813 ?auto_170815 ) ) ( not ( = ?auto_170813 ?auto_170816 ) ) ( not ( = ?auto_170813 ?auto_170817 ) ) ( not ( = ?auto_170813 ?auto_170818 ) ) ( not ( = ?auto_170814 ?auto_170815 ) ) ( not ( = ?auto_170814 ?auto_170816 ) ) ( not ( = ?auto_170814 ?auto_170817 ) ) ( not ( = ?auto_170814 ?auto_170818 ) ) ( not ( = ?auto_170815 ?auto_170816 ) ) ( not ( = ?auto_170815 ?auto_170817 ) ) ( not ( = ?auto_170815 ?auto_170818 ) ) ( not ( = ?auto_170816 ?auto_170817 ) ) ( not ( = ?auto_170816 ?auto_170818 ) ) ( not ( = ?auto_170817 ?auto_170818 ) ) ( HOLDING ?auto_170819 ) ( not ( = ?auto_170812 ?auto_170819 ) ) ( not ( = ?auto_170813 ?auto_170819 ) ) ( not ( = ?auto_170814 ?auto_170819 ) ) ( not ( = ?auto_170815 ?auto_170819 ) ) ( not ( = ?auto_170816 ?auto_170819 ) ) ( not ( = ?auto_170817 ?auto_170819 ) ) ( not ( = ?auto_170818 ?auto_170819 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_170819 )
      ( MAKE-6PILE ?auto_170812 ?auto_170813 ?auto_170814 ?auto_170815 ?auto_170816 ?auto_170817 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170937 - BLOCK
      ?auto_170938 - BLOCK
    )
    :vars
    (
      ?auto_170939 - BLOCK
      ?auto_170943 - BLOCK
      ?auto_170941 - BLOCK
      ?auto_170944 - BLOCK
      ?auto_170942 - BLOCK
      ?auto_170940 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170937 ?auto_170938 ) ) ( ON ?auto_170938 ?auto_170939 ) ( not ( = ?auto_170937 ?auto_170939 ) ) ( not ( = ?auto_170938 ?auto_170939 ) ) ( ON ?auto_170937 ?auto_170938 ) ( CLEAR ?auto_170937 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170943 ) ( ON ?auto_170941 ?auto_170943 ) ( ON ?auto_170944 ?auto_170941 ) ( ON ?auto_170942 ?auto_170944 ) ( ON ?auto_170940 ?auto_170942 ) ( ON ?auto_170939 ?auto_170940 ) ( not ( = ?auto_170943 ?auto_170941 ) ) ( not ( = ?auto_170943 ?auto_170944 ) ) ( not ( = ?auto_170943 ?auto_170942 ) ) ( not ( = ?auto_170943 ?auto_170940 ) ) ( not ( = ?auto_170943 ?auto_170939 ) ) ( not ( = ?auto_170943 ?auto_170938 ) ) ( not ( = ?auto_170943 ?auto_170937 ) ) ( not ( = ?auto_170941 ?auto_170944 ) ) ( not ( = ?auto_170941 ?auto_170942 ) ) ( not ( = ?auto_170941 ?auto_170940 ) ) ( not ( = ?auto_170941 ?auto_170939 ) ) ( not ( = ?auto_170941 ?auto_170938 ) ) ( not ( = ?auto_170941 ?auto_170937 ) ) ( not ( = ?auto_170944 ?auto_170942 ) ) ( not ( = ?auto_170944 ?auto_170940 ) ) ( not ( = ?auto_170944 ?auto_170939 ) ) ( not ( = ?auto_170944 ?auto_170938 ) ) ( not ( = ?auto_170944 ?auto_170937 ) ) ( not ( = ?auto_170942 ?auto_170940 ) ) ( not ( = ?auto_170942 ?auto_170939 ) ) ( not ( = ?auto_170942 ?auto_170938 ) ) ( not ( = ?auto_170942 ?auto_170937 ) ) ( not ( = ?auto_170940 ?auto_170939 ) ) ( not ( = ?auto_170940 ?auto_170938 ) ) ( not ( = ?auto_170940 ?auto_170937 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170943 ?auto_170941 ?auto_170944 ?auto_170942 ?auto_170940 ?auto_170939 ?auto_170938 )
      ( MAKE-2PILE ?auto_170937 ?auto_170938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170947 - BLOCK
      ?auto_170948 - BLOCK
    )
    :vars
    (
      ?auto_170949 - BLOCK
      ?auto_170950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170947 ?auto_170948 ) ) ( ON ?auto_170948 ?auto_170949 ) ( CLEAR ?auto_170948 ) ( not ( = ?auto_170947 ?auto_170949 ) ) ( not ( = ?auto_170948 ?auto_170949 ) ) ( ON ?auto_170947 ?auto_170950 ) ( CLEAR ?auto_170947 ) ( HAND-EMPTY ) ( not ( = ?auto_170947 ?auto_170950 ) ) ( not ( = ?auto_170948 ?auto_170950 ) ) ( not ( = ?auto_170949 ?auto_170950 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_170947 ?auto_170950 )
      ( MAKE-2PILE ?auto_170947 ?auto_170948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170951 - BLOCK
      ?auto_170952 - BLOCK
    )
    :vars
    (
      ?auto_170954 - BLOCK
      ?auto_170953 - BLOCK
      ?auto_170958 - BLOCK
      ?auto_170959 - BLOCK
      ?auto_170955 - BLOCK
      ?auto_170956 - BLOCK
      ?auto_170957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170951 ?auto_170952 ) ) ( not ( = ?auto_170951 ?auto_170954 ) ) ( not ( = ?auto_170952 ?auto_170954 ) ) ( ON ?auto_170951 ?auto_170953 ) ( CLEAR ?auto_170951 ) ( not ( = ?auto_170951 ?auto_170953 ) ) ( not ( = ?auto_170952 ?auto_170953 ) ) ( not ( = ?auto_170954 ?auto_170953 ) ) ( HOLDING ?auto_170952 ) ( CLEAR ?auto_170954 ) ( ON-TABLE ?auto_170958 ) ( ON ?auto_170959 ?auto_170958 ) ( ON ?auto_170955 ?auto_170959 ) ( ON ?auto_170956 ?auto_170955 ) ( ON ?auto_170957 ?auto_170956 ) ( ON ?auto_170954 ?auto_170957 ) ( not ( = ?auto_170958 ?auto_170959 ) ) ( not ( = ?auto_170958 ?auto_170955 ) ) ( not ( = ?auto_170958 ?auto_170956 ) ) ( not ( = ?auto_170958 ?auto_170957 ) ) ( not ( = ?auto_170958 ?auto_170954 ) ) ( not ( = ?auto_170958 ?auto_170952 ) ) ( not ( = ?auto_170959 ?auto_170955 ) ) ( not ( = ?auto_170959 ?auto_170956 ) ) ( not ( = ?auto_170959 ?auto_170957 ) ) ( not ( = ?auto_170959 ?auto_170954 ) ) ( not ( = ?auto_170959 ?auto_170952 ) ) ( not ( = ?auto_170955 ?auto_170956 ) ) ( not ( = ?auto_170955 ?auto_170957 ) ) ( not ( = ?auto_170955 ?auto_170954 ) ) ( not ( = ?auto_170955 ?auto_170952 ) ) ( not ( = ?auto_170956 ?auto_170957 ) ) ( not ( = ?auto_170956 ?auto_170954 ) ) ( not ( = ?auto_170956 ?auto_170952 ) ) ( not ( = ?auto_170957 ?auto_170954 ) ) ( not ( = ?auto_170957 ?auto_170952 ) ) ( not ( = ?auto_170951 ?auto_170958 ) ) ( not ( = ?auto_170951 ?auto_170959 ) ) ( not ( = ?auto_170951 ?auto_170955 ) ) ( not ( = ?auto_170951 ?auto_170956 ) ) ( not ( = ?auto_170951 ?auto_170957 ) ) ( not ( = ?auto_170953 ?auto_170958 ) ) ( not ( = ?auto_170953 ?auto_170959 ) ) ( not ( = ?auto_170953 ?auto_170955 ) ) ( not ( = ?auto_170953 ?auto_170956 ) ) ( not ( = ?auto_170953 ?auto_170957 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_170958 ?auto_170959 ?auto_170955 ?auto_170956 ?auto_170957 ?auto_170954 ?auto_170952 )
      ( MAKE-2PILE ?auto_170951 ?auto_170952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170960 - BLOCK
      ?auto_170961 - BLOCK
    )
    :vars
    (
      ?auto_170963 - BLOCK
      ?auto_170962 - BLOCK
      ?auto_170968 - BLOCK
      ?auto_170967 - BLOCK
      ?auto_170965 - BLOCK
      ?auto_170964 - BLOCK
      ?auto_170966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170960 ?auto_170961 ) ) ( not ( = ?auto_170960 ?auto_170963 ) ) ( not ( = ?auto_170961 ?auto_170963 ) ) ( ON ?auto_170960 ?auto_170962 ) ( not ( = ?auto_170960 ?auto_170962 ) ) ( not ( = ?auto_170961 ?auto_170962 ) ) ( not ( = ?auto_170963 ?auto_170962 ) ) ( CLEAR ?auto_170963 ) ( ON-TABLE ?auto_170968 ) ( ON ?auto_170967 ?auto_170968 ) ( ON ?auto_170965 ?auto_170967 ) ( ON ?auto_170964 ?auto_170965 ) ( ON ?auto_170966 ?auto_170964 ) ( ON ?auto_170963 ?auto_170966 ) ( not ( = ?auto_170968 ?auto_170967 ) ) ( not ( = ?auto_170968 ?auto_170965 ) ) ( not ( = ?auto_170968 ?auto_170964 ) ) ( not ( = ?auto_170968 ?auto_170966 ) ) ( not ( = ?auto_170968 ?auto_170963 ) ) ( not ( = ?auto_170968 ?auto_170961 ) ) ( not ( = ?auto_170967 ?auto_170965 ) ) ( not ( = ?auto_170967 ?auto_170964 ) ) ( not ( = ?auto_170967 ?auto_170966 ) ) ( not ( = ?auto_170967 ?auto_170963 ) ) ( not ( = ?auto_170967 ?auto_170961 ) ) ( not ( = ?auto_170965 ?auto_170964 ) ) ( not ( = ?auto_170965 ?auto_170966 ) ) ( not ( = ?auto_170965 ?auto_170963 ) ) ( not ( = ?auto_170965 ?auto_170961 ) ) ( not ( = ?auto_170964 ?auto_170966 ) ) ( not ( = ?auto_170964 ?auto_170963 ) ) ( not ( = ?auto_170964 ?auto_170961 ) ) ( not ( = ?auto_170966 ?auto_170963 ) ) ( not ( = ?auto_170966 ?auto_170961 ) ) ( not ( = ?auto_170960 ?auto_170968 ) ) ( not ( = ?auto_170960 ?auto_170967 ) ) ( not ( = ?auto_170960 ?auto_170965 ) ) ( not ( = ?auto_170960 ?auto_170964 ) ) ( not ( = ?auto_170960 ?auto_170966 ) ) ( not ( = ?auto_170962 ?auto_170968 ) ) ( not ( = ?auto_170962 ?auto_170967 ) ) ( not ( = ?auto_170962 ?auto_170965 ) ) ( not ( = ?auto_170962 ?auto_170964 ) ) ( not ( = ?auto_170962 ?auto_170966 ) ) ( ON ?auto_170961 ?auto_170960 ) ( CLEAR ?auto_170961 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_170962 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_170962 ?auto_170960 )
      ( MAKE-2PILE ?auto_170960 ?auto_170961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170969 - BLOCK
      ?auto_170970 - BLOCK
    )
    :vars
    (
      ?auto_170972 - BLOCK
      ?auto_170971 - BLOCK
      ?auto_170977 - BLOCK
      ?auto_170976 - BLOCK
      ?auto_170974 - BLOCK
      ?auto_170975 - BLOCK
      ?auto_170973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170969 ?auto_170970 ) ) ( not ( = ?auto_170969 ?auto_170972 ) ) ( not ( = ?auto_170970 ?auto_170972 ) ) ( ON ?auto_170969 ?auto_170971 ) ( not ( = ?auto_170969 ?auto_170971 ) ) ( not ( = ?auto_170970 ?auto_170971 ) ) ( not ( = ?auto_170972 ?auto_170971 ) ) ( ON-TABLE ?auto_170977 ) ( ON ?auto_170976 ?auto_170977 ) ( ON ?auto_170974 ?auto_170976 ) ( ON ?auto_170975 ?auto_170974 ) ( ON ?auto_170973 ?auto_170975 ) ( not ( = ?auto_170977 ?auto_170976 ) ) ( not ( = ?auto_170977 ?auto_170974 ) ) ( not ( = ?auto_170977 ?auto_170975 ) ) ( not ( = ?auto_170977 ?auto_170973 ) ) ( not ( = ?auto_170977 ?auto_170972 ) ) ( not ( = ?auto_170977 ?auto_170970 ) ) ( not ( = ?auto_170976 ?auto_170974 ) ) ( not ( = ?auto_170976 ?auto_170975 ) ) ( not ( = ?auto_170976 ?auto_170973 ) ) ( not ( = ?auto_170976 ?auto_170972 ) ) ( not ( = ?auto_170976 ?auto_170970 ) ) ( not ( = ?auto_170974 ?auto_170975 ) ) ( not ( = ?auto_170974 ?auto_170973 ) ) ( not ( = ?auto_170974 ?auto_170972 ) ) ( not ( = ?auto_170974 ?auto_170970 ) ) ( not ( = ?auto_170975 ?auto_170973 ) ) ( not ( = ?auto_170975 ?auto_170972 ) ) ( not ( = ?auto_170975 ?auto_170970 ) ) ( not ( = ?auto_170973 ?auto_170972 ) ) ( not ( = ?auto_170973 ?auto_170970 ) ) ( not ( = ?auto_170969 ?auto_170977 ) ) ( not ( = ?auto_170969 ?auto_170976 ) ) ( not ( = ?auto_170969 ?auto_170974 ) ) ( not ( = ?auto_170969 ?auto_170975 ) ) ( not ( = ?auto_170969 ?auto_170973 ) ) ( not ( = ?auto_170971 ?auto_170977 ) ) ( not ( = ?auto_170971 ?auto_170976 ) ) ( not ( = ?auto_170971 ?auto_170974 ) ) ( not ( = ?auto_170971 ?auto_170975 ) ) ( not ( = ?auto_170971 ?auto_170973 ) ) ( ON ?auto_170970 ?auto_170969 ) ( CLEAR ?auto_170970 ) ( ON-TABLE ?auto_170971 ) ( HOLDING ?auto_170972 ) ( CLEAR ?auto_170973 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_170977 ?auto_170976 ?auto_170974 ?auto_170975 ?auto_170973 ?auto_170972 )
      ( MAKE-2PILE ?auto_170969 ?auto_170970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170978 - BLOCK
      ?auto_170979 - BLOCK
    )
    :vars
    (
      ?auto_170982 - BLOCK
      ?auto_170986 - BLOCK
      ?auto_170984 - BLOCK
      ?auto_170981 - BLOCK
      ?auto_170983 - BLOCK
      ?auto_170985 - BLOCK
      ?auto_170980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170978 ?auto_170979 ) ) ( not ( = ?auto_170978 ?auto_170982 ) ) ( not ( = ?auto_170979 ?auto_170982 ) ) ( ON ?auto_170978 ?auto_170986 ) ( not ( = ?auto_170978 ?auto_170986 ) ) ( not ( = ?auto_170979 ?auto_170986 ) ) ( not ( = ?auto_170982 ?auto_170986 ) ) ( ON-TABLE ?auto_170984 ) ( ON ?auto_170981 ?auto_170984 ) ( ON ?auto_170983 ?auto_170981 ) ( ON ?auto_170985 ?auto_170983 ) ( ON ?auto_170980 ?auto_170985 ) ( not ( = ?auto_170984 ?auto_170981 ) ) ( not ( = ?auto_170984 ?auto_170983 ) ) ( not ( = ?auto_170984 ?auto_170985 ) ) ( not ( = ?auto_170984 ?auto_170980 ) ) ( not ( = ?auto_170984 ?auto_170982 ) ) ( not ( = ?auto_170984 ?auto_170979 ) ) ( not ( = ?auto_170981 ?auto_170983 ) ) ( not ( = ?auto_170981 ?auto_170985 ) ) ( not ( = ?auto_170981 ?auto_170980 ) ) ( not ( = ?auto_170981 ?auto_170982 ) ) ( not ( = ?auto_170981 ?auto_170979 ) ) ( not ( = ?auto_170983 ?auto_170985 ) ) ( not ( = ?auto_170983 ?auto_170980 ) ) ( not ( = ?auto_170983 ?auto_170982 ) ) ( not ( = ?auto_170983 ?auto_170979 ) ) ( not ( = ?auto_170985 ?auto_170980 ) ) ( not ( = ?auto_170985 ?auto_170982 ) ) ( not ( = ?auto_170985 ?auto_170979 ) ) ( not ( = ?auto_170980 ?auto_170982 ) ) ( not ( = ?auto_170980 ?auto_170979 ) ) ( not ( = ?auto_170978 ?auto_170984 ) ) ( not ( = ?auto_170978 ?auto_170981 ) ) ( not ( = ?auto_170978 ?auto_170983 ) ) ( not ( = ?auto_170978 ?auto_170985 ) ) ( not ( = ?auto_170978 ?auto_170980 ) ) ( not ( = ?auto_170986 ?auto_170984 ) ) ( not ( = ?auto_170986 ?auto_170981 ) ) ( not ( = ?auto_170986 ?auto_170983 ) ) ( not ( = ?auto_170986 ?auto_170985 ) ) ( not ( = ?auto_170986 ?auto_170980 ) ) ( ON ?auto_170979 ?auto_170978 ) ( ON-TABLE ?auto_170986 ) ( CLEAR ?auto_170980 ) ( ON ?auto_170982 ?auto_170979 ) ( CLEAR ?auto_170982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_170986 ?auto_170978 ?auto_170979 )
      ( MAKE-2PILE ?auto_170978 ?auto_170979 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170987 - BLOCK
      ?auto_170988 - BLOCK
    )
    :vars
    (
      ?auto_170989 - BLOCK
      ?auto_170990 - BLOCK
      ?auto_170995 - BLOCK
      ?auto_170991 - BLOCK
      ?auto_170994 - BLOCK
      ?auto_170993 - BLOCK
      ?auto_170992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170987 ?auto_170988 ) ) ( not ( = ?auto_170987 ?auto_170989 ) ) ( not ( = ?auto_170988 ?auto_170989 ) ) ( ON ?auto_170987 ?auto_170990 ) ( not ( = ?auto_170987 ?auto_170990 ) ) ( not ( = ?auto_170988 ?auto_170990 ) ) ( not ( = ?auto_170989 ?auto_170990 ) ) ( ON-TABLE ?auto_170995 ) ( ON ?auto_170991 ?auto_170995 ) ( ON ?auto_170994 ?auto_170991 ) ( ON ?auto_170993 ?auto_170994 ) ( not ( = ?auto_170995 ?auto_170991 ) ) ( not ( = ?auto_170995 ?auto_170994 ) ) ( not ( = ?auto_170995 ?auto_170993 ) ) ( not ( = ?auto_170995 ?auto_170992 ) ) ( not ( = ?auto_170995 ?auto_170989 ) ) ( not ( = ?auto_170995 ?auto_170988 ) ) ( not ( = ?auto_170991 ?auto_170994 ) ) ( not ( = ?auto_170991 ?auto_170993 ) ) ( not ( = ?auto_170991 ?auto_170992 ) ) ( not ( = ?auto_170991 ?auto_170989 ) ) ( not ( = ?auto_170991 ?auto_170988 ) ) ( not ( = ?auto_170994 ?auto_170993 ) ) ( not ( = ?auto_170994 ?auto_170992 ) ) ( not ( = ?auto_170994 ?auto_170989 ) ) ( not ( = ?auto_170994 ?auto_170988 ) ) ( not ( = ?auto_170993 ?auto_170992 ) ) ( not ( = ?auto_170993 ?auto_170989 ) ) ( not ( = ?auto_170993 ?auto_170988 ) ) ( not ( = ?auto_170992 ?auto_170989 ) ) ( not ( = ?auto_170992 ?auto_170988 ) ) ( not ( = ?auto_170987 ?auto_170995 ) ) ( not ( = ?auto_170987 ?auto_170991 ) ) ( not ( = ?auto_170987 ?auto_170994 ) ) ( not ( = ?auto_170987 ?auto_170993 ) ) ( not ( = ?auto_170987 ?auto_170992 ) ) ( not ( = ?auto_170990 ?auto_170995 ) ) ( not ( = ?auto_170990 ?auto_170991 ) ) ( not ( = ?auto_170990 ?auto_170994 ) ) ( not ( = ?auto_170990 ?auto_170993 ) ) ( not ( = ?auto_170990 ?auto_170992 ) ) ( ON ?auto_170988 ?auto_170987 ) ( ON-TABLE ?auto_170990 ) ( ON ?auto_170989 ?auto_170988 ) ( CLEAR ?auto_170989 ) ( HOLDING ?auto_170992 ) ( CLEAR ?auto_170993 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_170995 ?auto_170991 ?auto_170994 ?auto_170993 ?auto_170992 )
      ( MAKE-2PILE ?auto_170987 ?auto_170988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_170996 - BLOCK
      ?auto_170997 - BLOCK
    )
    :vars
    (
      ?auto_170998 - BLOCK
      ?auto_171002 - BLOCK
      ?auto_171001 - BLOCK
      ?auto_170999 - BLOCK
      ?auto_171000 - BLOCK
      ?auto_171004 - BLOCK
      ?auto_171003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_170996 ?auto_170997 ) ) ( not ( = ?auto_170996 ?auto_170998 ) ) ( not ( = ?auto_170997 ?auto_170998 ) ) ( ON ?auto_170996 ?auto_171002 ) ( not ( = ?auto_170996 ?auto_171002 ) ) ( not ( = ?auto_170997 ?auto_171002 ) ) ( not ( = ?auto_170998 ?auto_171002 ) ) ( ON-TABLE ?auto_171001 ) ( ON ?auto_170999 ?auto_171001 ) ( ON ?auto_171000 ?auto_170999 ) ( ON ?auto_171004 ?auto_171000 ) ( not ( = ?auto_171001 ?auto_170999 ) ) ( not ( = ?auto_171001 ?auto_171000 ) ) ( not ( = ?auto_171001 ?auto_171004 ) ) ( not ( = ?auto_171001 ?auto_171003 ) ) ( not ( = ?auto_171001 ?auto_170998 ) ) ( not ( = ?auto_171001 ?auto_170997 ) ) ( not ( = ?auto_170999 ?auto_171000 ) ) ( not ( = ?auto_170999 ?auto_171004 ) ) ( not ( = ?auto_170999 ?auto_171003 ) ) ( not ( = ?auto_170999 ?auto_170998 ) ) ( not ( = ?auto_170999 ?auto_170997 ) ) ( not ( = ?auto_171000 ?auto_171004 ) ) ( not ( = ?auto_171000 ?auto_171003 ) ) ( not ( = ?auto_171000 ?auto_170998 ) ) ( not ( = ?auto_171000 ?auto_170997 ) ) ( not ( = ?auto_171004 ?auto_171003 ) ) ( not ( = ?auto_171004 ?auto_170998 ) ) ( not ( = ?auto_171004 ?auto_170997 ) ) ( not ( = ?auto_171003 ?auto_170998 ) ) ( not ( = ?auto_171003 ?auto_170997 ) ) ( not ( = ?auto_170996 ?auto_171001 ) ) ( not ( = ?auto_170996 ?auto_170999 ) ) ( not ( = ?auto_170996 ?auto_171000 ) ) ( not ( = ?auto_170996 ?auto_171004 ) ) ( not ( = ?auto_170996 ?auto_171003 ) ) ( not ( = ?auto_171002 ?auto_171001 ) ) ( not ( = ?auto_171002 ?auto_170999 ) ) ( not ( = ?auto_171002 ?auto_171000 ) ) ( not ( = ?auto_171002 ?auto_171004 ) ) ( not ( = ?auto_171002 ?auto_171003 ) ) ( ON ?auto_170997 ?auto_170996 ) ( ON-TABLE ?auto_171002 ) ( ON ?auto_170998 ?auto_170997 ) ( CLEAR ?auto_171004 ) ( ON ?auto_171003 ?auto_170998 ) ( CLEAR ?auto_171003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171002 ?auto_170996 ?auto_170997 ?auto_170998 )
      ( MAKE-2PILE ?auto_170996 ?auto_170997 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171005 - BLOCK
      ?auto_171006 - BLOCK
    )
    :vars
    (
      ?auto_171013 - BLOCK
      ?auto_171012 - BLOCK
      ?auto_171009 - BLOCK
      ?auto_171007 - BLOCK
      ?auto_171011 - BLOCK
      ?auto_171008 - BLOCK
      ?auto_171010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171005 ?auto_171006 ) ) ( not ( = ?auto_171005 ?auto_171013 ) ) ( not ( = ?auto_171006 ?auto_171013 ) ) ( ON ?auto_171005 ?auto_171012 ) ( not ( = ?auto_171005 ?auto_171012 ) ) ( not ( = ?auto_171006 ?auto_171012 ) ) ( not ( = ?auto_171013 ?auto_171012 ) ) ( ON-TABLE ?auto_171009 ) ( ON ?auto_171007 ?auto_171009 ) ( ON ?auto_171011 ?auto_171007 ) ( not ( = ?auto_171009 ?auto_171007 ) ) ( not ( = ?auto_171009 ?auto_171011 ) ) ( not ( = ?auto_171009 ?auto_171008 ) ) ( not ( = ?auto_171009 ?auto_171010 ) ) ( not ( = ?auto_171009 ?auto_171013 ) ) ( not ( = ?auto_171009 ?auto_171006 ) ) ( not ( = ?auto_171007 ?auto_171011 ) ) ( not ( = ?auto_171007 ?auto_171008 ) ) ( not ( = ?auto_171007 ?auto_171010 ) ) ( not ( = ?auto_171007 ?auto_171013 ) ) ( not ( = ?auto_171007 ?auto_171006 ) ) ( not ( = ?auto_171011 ?auto_171008 ) ) ( not ( = ?auto_171011 ?auto_171010 ) ) ( not ( = ?auto_171011 ?auto_171013 ) ) ( not ( = ?auto_171011 ?auto_171006 ) ) ( not ( = ?auto_171008 ?auto_171010 ) ) ( not ( = ?auto_171008 ?auto_171013 ) ) ( not ( = ?auto_171008 ?auto_171006 ) ) ( not ( = ?auto_171010 ?auto_171013 ) ) ( not ( = ?auto_171010 ?auto_171006 ) ) ( not ( = ?auto_171005 ?auto_171009 ) ) ( not ( = ?auto_171005 ?auto_171007 ) ) ( not ( = ?auto_171005 ?auto_171011 ) ) ( not ( = ?auto_171005 ?auto_171008 ) ) ( not ( = ?auto_171005 ?auto_171010 ) ) ( not ( = ?auto_171012 ?auto_171009 ) ) ( not ( = ?auto_171012 ?auto_171007 ) ) ( not ( = ?auto_171012 ?auto_171011 ) ) ( not ( = ?auto_171012 ?auto_171008 ) ) ( not ( = ?auto_171012 ?auto_171010 ) ) ( ON ?auto_171006 ?auto_171005 ) ( ON-TABLE ?auto_171012 ) ( ON ?auto_171013 ?auto_171006 ) ( ON ?auto_171010 ?auto_171013 ) ( CLEAR ?auto_171010 ) ( HOLDING ?auto_171008 ) ( CLEAR ?auto_171011 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171009 ?auto_171007 ?auto_171011 ?auto_171008 )
      ( MAKE-2PILE ?auto_171005 ?auto_171006 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171014 - BLOCK
      ?auto_171015 - BLOCK
    )
    :vars
    (
      ?auto_171016 - BLOCK
      ?auto_171019 - BLOCK
      ?auto_171020 - BLOCK
      ?auto_171022 - BLOCK
      ?auto_171021 - BLOCK
      ?auto_171017 - BLOCK
      ?auto_171018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171014 ?auto_171015 ) ) ( not ( = ?auto_171014 ?auto_171016 ) ) ( not ( = ?auto_171015 ?auto_171016 ) ) ( ON ?auto_171014 ?auto_171019 ) ( not ( = ?auto_171014 ?auto_171019 ) ) ( not ( = ?auto_171015 ?auto_171019 ) ) ( not ( = ?auto_171016 ?auto_171019 ) ) ( ON-TABLE ?auto_171020 ) ( ON ?auto_171022 ?auto_171020 ) ( ON ?auto_171021 ?auto_171022 ) ( not ( = ?auto_171020 ?auto_171022 ) ) ( not ( = ?auto_171020 ?auto_171021 ) ) ( not ( = ?auto_171020 ?auto_171017 ) ) ( not ( = ?auto_171020 ?auto_171018 ) ) ( not ( = ?auto_171020 ?auto_171016 ) ) ( not ( = ?auto_171020 ?auto_171015 ) ) ( not ( = ?auto_171022 ?auto_171021 ) ) ( not ( = ?auto_171022 ?auto_171017 ) ) ( not ( = ?auto_171022 ?auto_171018 ) ) ( not ( = ?auto_171022 ?auto_171016 ) ) ( not ( = ?auto_171022 ?auto_171015 ) ) ( not ( = ?auto_171021 ?auto_171017 ) ) ( not ( = ?auto_171021 ?auto_171018 ) ) ( not ( = ?auto_171021 ?auto_171016 ) ) ( not ( = ?auto_171021 ?auto_171015 ) ) ( not ( = ?auto_171017 ?auto_171018 ) ) ( not ( = ?auto_171017 ?auto_171016 ) ) ( not ( = ?auto_171017 ?auto_171015 ) ) ( not ( = ?auto_171018 ?auto_171016 ) ) ( not ( = ?auto_171018 ?auto_171015 ) ) ( not ( = ?auto_171014 ?auto_171020 ) ) ( not ( = ?auto_171014 ?auto_171022 ) ) ( not ( = ?auto_171014 ?auto_171021 ) ) ( not ( = ?auto_171014 ?auto_171017 ) ) ( not ( = ?auto_171014 ?auto_171018 ) ) ( not ( = ?auto_171019 ?auto_171020 ) ) ( not ( = ?auto_171019 ?auto_171022 ) ) ( not ( = ?auto_171019 ?auto_171021 ) ) ( not ( = ?auto_171019 ?auto_171017 ) ) ( not ( = ?auto_171019 ?auto_171018 ) ) ( ON ?auto_171015 ?auto_171014 ) ( ON-TABLE ?auto_171019 ) ( ON ?auto_171016 ?auto_171015 ) ( ON ?auto_171018 ?auto_171016 ) ( CLEAR ?auto_171021 ) ( ON ?auto_171017 ?auto_171018 ) ( CLEAR ?auto_171017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171019 ?auto_171014 ?auto_171015 ?auto_171016 ?auto_171018 )
      ( MAKE-2PILE ?auto_171014 ?auto_171015 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171023 - BLOCK
      ?auto_171024 - BLOCK
    )
    :vars
    (
      ?auto_171031 - BLOCK
      ?auto_171027 - BLOCK
      ?auto_171025 - BLOCK
      ?auto_171028 - BLOCK
      ?auto_171029 - BLOCK
      ?auto_171026 - BLOCK
      ?auto_171030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171023 ?auto_171024 ) ) ( not ( = ?auto_171023 ?auto_171031 ) ) ( not ( = ?auto_171024 ?auto_171031 ) ) ( ON ?auto_171023 ?auto_171027 ) ( not ( = ?auto_171023 ?auto_171027 ) ) ( not ( = ?auto_171024 ?auto_171027 ) ) ( not ( = ?auto_171031 ?auto_171027 ) ) ( ON-TABLE ?auto_171025 ) ( ON ?auto_171028 ?auto_171025 ) ( not ( = ?auto_171025 ?auto_171028 ) ) ( not ( = ?auto_171025 ?auto_171029 ) ) ( not ( = ?auto_171025 ?auto_171026 ) ) ( not ( = ?auto_171025 ?auto_171030 ) ) ( not ( = ?auto_171025 ?auto_171031 ) ) ( not ( = ?auto_171025 ?auto_171024 ) ) ( not ( = ?auto_171028 ?auto_171029 ) ) ( not ( = ?auto_171028 ?auto_171026 ) ) ( not ( = ?auto_171028 ?auto_171030 ) ) ( not ( = ?auto_171028 ?auto_171031 ) ) ( not ( = ?auto_171028 ?auto_171024 ) ) ( not ( = ?auto_171029 ?auto_171026 ) ) ( not ( = ?auto_171029 ?auto_171030 ) ) ( not ( = ?auto_171029 ?auto_171031 ) ) ( not ( = ?auto_171029 ?auto_171024 ) ) ( not ( = ?auto_171026 ?auto_171030 ) ) ( not ( = ?auto_171026 ?auto_171031 ) ) ( not ( = ?auto_171026 ?auto_171024 ) ) ( not ( = ?auto_171030 ?auto_171031 ) ) ( not ( = ?auto_171030 ?auto_171024 ) ) ( not ( = ?auto_171023 ?auto_171025 ) ) ( not ( = ?auto_171023 ?auto_171028 ) ) ( not ( = ?auto_171023 ?auto_171029 ) ) ( not ( = ?auto_171023 ?auto_171026 ) ) ( not ( = ?auto_171023 ?auto_171030 ) ) ( not ( = ?auto_171027 ?auto_171025 ) ) ( not ( = ?auto_171027 ?auto_171028 ) ) ( not ( = ?auto_171027 ?auto_171029 ) ) ( not ( = ?auto_171027 ?auto_171026 ) ) ( not ( = ?auto_171027 ?auto_171030 ) ) ( ON ?auto_171024 ?auto_171023 ) ( ON-TABLE ?auto_171027 ) ( ON ?auto_171031 ?auto_171024 ) ( ON ?auto_171030 ?auto_171031 ) ( ON ?auto_171026 ?auto_171030 ) ( CLEAR ?auto_171026 ) ( HOLDING ?auto_171029 ) ( CLEAR ?auto_171028 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171025 ?auto_171028 ?auto_171029 )
      ( MAKE-2PILE ?auto_171023 ?auto_171024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171032 - BLOCK
      ?auto_171033 - BLOCK
    )
    :vars
    (
      ?auto_171038 - BLOCK
      ?auto_171036 - BLOCK
      ?auto_171035 - BLOCK
      ?auto_171034 - BLOCK
      ?auto_171039 - BLOCK
      ?auto_171037 - BLOCK
      ?auto_171040 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171032 ?auto_171033 ) ) ( not ( = ?auto_171032 ?auto_171038 ) ) ( not ( = ?auto_171033 ?auto_171038 ) ) ( ON ?auto_171032 ?auto_171036 ) ( not ( = ?auto_171032 ?auto_171036 ) ) ( not ( = ?auto_171033 ?auto_171036 ) ) ( not ( = ?auto_171038 ?auto_171036 ) ) ( ON-TABLE ?auto_171035 ) ( ON ?auto_171034 ?auto_171035 ) ( not ( = ?auto_171035 ?auto_171034 ) ) ( not ( = ?auto_171035 ?auto_171039 ) ) ( not ( = ?auto_171035 ?auto_171037 ) ) ( not ( = ?auto_171035 ?auto_171040 ) ) ( not ( = ?auto_171035 ?auto_171038 ) ) ( not ( = ?auto_171035 ?auto_171033 ) ) ( not ( = ?auto_171034 ?auto_171039 ) ) ( not ( = ?auto_171034 ?auto_171037 ) ) ( not ( = ?auto_171034 ?auto_171040 ) ) ( not ( = ?auto_171034 ?auto_171038 ) ) ( not ( = ?auto_171034 ?auto_171033 ) ) ( not ( = ?auto_171039 ?auto_171037 ) ) ( not ( = ?auto_171039 ?auto_171040 ) ) ( not ( = ?auto_171039 ?auto_171038 ) ) ( not ( = ?auto_171039 ?auto_171033 ) ) ( not ( = ?auto_171037 ?auto_171040 ) ) ( not ( = ?auto_171037 ?auto_171038 ) ) ( not ( = ?auto_171037 ?auto_171033 ) ) ( not ( = ?auto_171040 ?auto_171038 ) ) ( not ( = ?auto_171040 ?auto_171033 ) ) ( not ( = ?auto_171032 ?auto_171035 ) ) ( not ( = ?auto_171032 ?auto_171034 ) ) ( not ( = ?auto_171032 ?auto_171039 ) ) ( not ( = ?auto_171032 ?auto_171037 ) ) ( not ( = ?auto_171032 ?auto_171040 ) ) ( not ( = ?auto_171036 ?auto_171035 ) ) ( not ( = ?auto_171036 ?auto_171034 ) ) ( not ( = ?auto_171036 ?auto_171039 ) ) ( not ( = ?auto_171036 ?auto_171037 ) ) ( not ( = ?auto_171036 ?auto_171040 ) ) ( ON ?auto_171033 ?auto_171032 ) ( ON-TABLE ?auto_171036 ) ( ON ?auto_171038 ?auto_171033 ) ( ON ?auto_171040 ?auto_171038 ) ( ON ?auto_171037 ?auto_171040 ) ( CLEAR ?auto_171034 ) ( ON ?auto_171039 ?auto_171037 ) ( CLEAR ?auto_171039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171036 ?auto_171032 ?auto_171033 ?auto_171038 ?auto_171040 ?auto_171037 )
      ( MAKE-2PILE ?auto_171032 ?auto_171033 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171041 - BLOCK
      ?auto_171042 - BLOCK
    )
    :vars
    (
      ?auto_171049 - BLOCK
      ?auto_171045 - BLOCK
      ?auto_171043 - BLOCK
      ?auto_171044 - BLOCK
      ?auto_171047 - BLOCK
      ?auto_171046 - BLOCK
      ?auto_171048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171041 ?auto_171042 ) ) ( not ( = ?auto_171041 ?auto_171049 ) ) ( not ( = ?auto_171042 ?auto_171049 ) ) ( ON ?auto_171041 ?auto_171045 ) ( not ( = ?auto_171041 ?auto_171045 ) ) ( not ( = ?auto_171042 ?auto_171045 ) ) ( not ( = ?auto_171049 ?auto_171045 ) ) ( ON-TABLE ?auto_171043 ) ( not ( = ?auto_171043 ?auto_171044 ) ) ( not ( = ?auto_171043 ?auto_171047 ) ) ( not ( = ?auto_171043 ?auto_171046 ) ) ( not ( = ?auto_171043 ?auto_171048 ) ) ( not ( = ?auto_171043 ?auto_171049 ) ) ( not ( = ?auto_171043 ?auto_171042 ) ) ( not ( = ?auto_171044 ?auto_171047 ) ) ( not ( = ?auto_171044 ?auto_171046 ) ) ( not ( = ?auto_171044 ?auto_171048 ) ) ( not ( = ?auto_171044 ?auto_171049 ) ) ( not ( = ?auto_171044 ?auto_171042 ) ) ( not ( = ?auto_171047 ?auto_171046 ) ) ( not ( = ?auto_171047 ?auto_171048 ) ) ( not ( = ?auto_171047 ?auto_171049 ) ) ( not ( = ?auto_171047 ?auto_171042 ) ) ( not ( = ?auto_171046 ?auto_171048 ) ) ( not ( = ?auto_171046 ?auto_171049 ) ) ( not ( = ?auto_171046 ?auto_171042 ) ) ( not ( = ?auto_171048 ?auto_171049 ) ) ( not ( = ?auto_171048 ?auto_171042 ) ) ( not ( = ?auto_171041 ?auto_171043 ) ) ( not ( = ?auto_171041 ?auto_171044 ) ) ( not ( = ?auto_171041 ?auto_171047 ) ) ( not ( = ?auto_171041 ?auto_171046 ) ) ( not ( = ?auto_171041 ?auto_171048 ) ) ( not ( = ?auto_171045 ?auto_171043 ) ) ( not ( = ?auto_171045 ?auto_171044 ) ) ( not ( = ?auto_171045 ?auto_171047 ) ) ( not ( = ?auto_171045 ?auto_171046 ) ) ( not ( = ?auto_171045 ?auto_171048 ) ) ( ON ?auto_171042 ?auto_171041 ) ( ON-TABLE ?auto_171045 ) ( ON ?auto_171049 ?auto_171042 ) ( ON ?auto_171048 ?auto_171049 ) ( ON ?auto_171046 ?auto_171048 ) ( ON ?auto_171047 ?auto_171046 ) ( CLEAR ?auto_171047 ) ( HOLDING ?auto_171044 ) ( CLEAR ?auto_171043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171043 ?auto_171044 )
      ( MAKE-2PILE ?auto_171041 ?auto_171042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171050 - BLOCK
      ?auto_171051 - BLOCK
    )
    :vars
    (
      ?auto_171054 - BLOCK
      ?auto_171055 - BLOCK
      ?auto_171057 - BLOCK
      ?auto_171053 - BLOCK
      ?auto_171052 - BLOCK
      ?auto_171058 - BLOCK
      ?auto_171056 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171050 ?auto_171051 ) ) ( not ( = ?auto_171050 ?auto_171054 ) ) ( not ( = ?auto_171051 ?auto_171054 ) ) ( ON ?auto_171050 ?auto_171055 ) ( not ( = ?auto_171050 ?auto_171055 ) ) ( not ( = ?auto_171051 ?auto_171055 ) ) ( not ( = ?auto_171054 ?auto_171055 ) ) ( ON-TABLE ?auto_171057 ) ( not ( = ?auto_171057 ?auto_171053 ) ) ( not ( = ?auto_171057 ?auto_171052 ) ) ( not ( = ?auto_171057 ?auto_171058 ) ) ( not ( = ?auto_171057 ?auto_171056 ) ) ( not ( = ?auto_171057 ?auto_171054 ) ) ( not ( = ?auto_171057 ?auto_171051 ) ) ( not ( = ?auto_171053 ?auto_171052 ) ) ( not ( = ?auto_171053 ?auto_171058 ) ) ( not ( = ?auto_171053 ?auto_171056 ) ) ( not ( = ?auto_171053 ?auto_171054 ) ) ( not ( = ?auto_171053 ?auto_171051 ) ) ( not ( = ?auto_171052 ?auto_171058 ) ) ( not ( = ?auto_171052 ?auto_171056 ) ) ( not ( = ?auto_171052 ?auto_171054 ) ) ( not ( = ?auto_171052 ?auto_171051 ) ) ( not ( = ?auto_171058 ?auto_171056 ) ) ( not ( = ?auto_171058 ?auto_171054 ) ) ( not ( = ?auto_171058 ?auto_171051 ) ) ( not ( = ?auto_171056 ?auto_171054 ) ) ( not ( = ?auto_171056 ?auto_171051 ) ) ( not ( = ?auto_171050 ?auto_171057 ) ) ( not ( = ?auto_171050 ?auto_171053 ) ) ( not ( = ?auto_171050 ?auto_171052 ) ) ( not ( = ?auto_171050 ?auto_171058 ) ) ( not ( = ?auto_171050 ?auto_171056 ) ) ( not ( = ?auto_171055 ?auto_171057 ) ) ( not ( = ?auto_171055 ?auto_171053 ) ) ( not ( = ?auto_171055 ?auto_171052 ) ) ( not ( = ?auto_171055 ?auto_171058 ) ) ( not ( = ?auto_171055 ?auto_171056 ) ) ( ON ?auto_171051 ?auto_171050 ) ( ON-TABLE ?auto_171055 ) ( ON ?auto_171054 ?auto_171051 ) ( ON ?auto_171056 ?auto_171054 ) ( ON ?auto_171058 ?auto_171056 ) ( ON ?auto_171052 ?auto_171058 ) ( CLEAR ?auto_171057 ) ( ON ?auto_171053 ?auto_171052 ) ( CLEAR ?auto_171053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171055 ?auto_171050 ?auto_171051 ?auto_171054 ?auto_171056 ?auto_171058 ?auto_171052 )
      ( MAKE-2PILE ?auto_171050 ?auto_171051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171059 - BLOCK
      ?auto_171060 - BLOCK
    )
    :vars
    (
      ?auto_171063 - BLOCK
      ?auto_171061 - BLOCK
      ?auto_171067 - BLOCK
      ?auto_171065 - BLOCK
      ?auto_171064 - BLOCK
      ?auto_171066 - BLOCK
      ?auto_171062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171059 ?auto_171060 ) ) ( not ( = ?auto_171059 ?auto_171063 ) ) ( not ( = ?auto_171060 ?auto_171063 ) ) ( ON ?auto_171059 ?auto_171061 ) ( not ( = ?auto_171059 ?auto_171061 ) ) ( not ( = ?auto_171060 ?auto_171061 ) ) ( not ( = ?auto_171063 ?auto_171061 ) ) ( not ( = ?auto_171067 ?auto_171065 ) ) ( not ( = ?auto_171067 ?auto_171064 ) ) ( not ( = ?auto_171067 ?auto_171066 ) ) ( not ( = ?auto_171067 ?auto_171062 ) ) ( not ( = ?auto_171067 ?auto_171063 ) ) ( not ( = ?auto_171067 ?auto_171060 ) ) ( not ( = ?auto_171065 ?auto_171064 ) ) ( not ( = ?auto_171065 ?auto_171066 ) ) ( not ( = ?auto_171065 ?auto_171062 ) ) ( not ( = ?auto_171065 ?auto_171063 ) ) ( not ( = ?auto_171065 ?auto_171060 ) ) ( not ( = ?auto_171064 ?auto_171066 ) ) ( not ( = ?auto_171064 ?auto_171062 ) ) ( not ( = ?auto_171064 ?auto_171063 ) ) ( not ( = ?auto_171064 ?auto_171060 ) ) ( not ( = ?auto_171066 ?auto_171062 ) ) ( not ( = ?auto_171066 ?auto_171063 ) ) ( not ( = ?auto_171066 ?auto_171060 ) ) ( not ( = ?auto_171062 ?auto_171063 ) ) ( not ( = ?auto_171062 ?auto_171060 ) ) ( not ( = ?auto_171059 ?auto_171067 ) ) ( not ( = ?auto_171059 ?auto_171065 ) ) ( not ( = ?auto_171059 ?auto_171064 ) ) ( not ( = ?auto_171059 ?auto_171066 ) ) ( not ( = ?auto_171059 ?auto_171062 ) ) ( not ( = ?auto_171061 ?auto_171067 ) ) ( not ( = ?auto_171061 ?auto_171065 ) ) ( not ( = ?auto_171061 ?auto_171064 ) ) ( not ( = ?auto_171061 ?auto_171066 ) ) ( not ( = ?auto_171061 ?auto_171062 ) ) ( ON ?auto_171060 ?auto_171059 ) ( ON-TABLE ?auto_171061 ) ( ON ?auto_171063 ?auto_171060 ) ( ON ?auto_171062 ?auto_171063 ) ( ON ?auto_171066 ?auto_171062 ) ( ON ?auto_171064 ?auto_171066 ) ( ON ?auto_171065 ?auto_171064 ) ( CLEAR ?auto_171065 ) ( HOLDING ?auto_171067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171067 )
      ( MAKE-2PILE ?auto_171059 ?auto_171060 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_171068 - BLOCK
      ?auto_171069 - BLOCK
    )
    :vars
    (
      ?auto_171070 - BLOCK
      ?auto_171071 - BLOCK
      ?auto_171075 - BLOCK
      ?auto_171073 - BLOCK
      ?auto_171076 - BLOCK
      ?auto_171072 - BLOCK
      ?auto_171074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171068 ?auto_171069 ) ) ( not ( = ?auto_171068 ?auto_171070 ) ) ( not ( = ?auto_171069 ?auto_171070 ) ) ( ON ?auto_171068 ?auto_171071 ) ( not ( = ?auto_171068 ?auto_171071 ) ) ( not ( = ?auto_171069 ?auto_171071 ) ) ( not ( = ?auto_171070 ?auto_171071 ) ) ( not ( = ?auto_171075 ?auto_171073 ) ) ( not ( = ?auto_171075 ?auto_171076 ) ) ( not ( = ?auto_171075 ?auto_171072 ) ) ( not ( = ?auto_171075 ?auto_171074 ) ) ( not ( = ?auto_171075 ?auto_171070 ) ) ( not ( = ?auto_171075 ?auto_171069 ) ) ( not ( = ?auto_171073 ?auto_171076 ) ) ( not ( = ?auto_171073 ?auto_171072 ) ) ( not ( = ?auto_171073 ?auto_171074 ) ) ( not ( = ?auto_171073 ?auto_171070 ) ) ( not ( = ?auto_171073 ?auto_171069 ) ) ( not ( = ?auto_171076 ?auto_171072 ) ) ( not ( = ?auto_171076 ?auto_171074 ) ) ( not ( = ?auto_171076 ?auto_171070 ) ) ( not ( = ?auto_171076 ?auto_171069 ) ) ( not ( = ?auto_171072 ?auto_171074 ) ) ( not ( = ?auto_171072 ?auto_171070 ) ) ( not ( = ?auto_171072 ?auto_171069 ) ) ( not ( = ?auto_171074 ?auto_171070 ) ) ( not ( = ?auto_171074 ?auto_171069 ) ) ( not ( = ?auto_171068 ?auto_171075 ) ) ( not ( = ?auto_171068 ?auto_171073 ) ) ( not ( = ?auto_171068 ?auto_171076 ) ) ( not ( = ?auto_171068 ?auto_171072 ) ) ( not ( = ?auto_171068 ?auto_171074 ) ) ( not ( = ?auto_171071 ?auto_171075 ) ) ( not ( = ?auto_171071 ?auto_171073 ) ) ( not ( = ?auto_171071 ?auto_171076 ) ) ( not ( = ?auto_171071 ?auto_171072 ) ) ( not ( = ?auto_171071 ?auto_171074 ) ) ( ON ?auto_171069 ?auto_171068 ) ( ON-TABLE ?auto_171071 ) ( ON ?auto_171070 ?auto_171069 ) ( ON ?auto_171074 ?auto_171070 ) ( ON ?auto_171072 ?auto_171074 ) ( ON ?auto_171076 ?auto_171072 ) ( ON ?auto_171073 ?auto_171076 ) ( ON ?auto_171075 ?auto_171073 ) ( CLEAR ?auto_171075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171071 ?auto_171068 ?auto_171069 ?auto_171070 ?auto_171074 ?auto_171072 ?auto_171076 ?auto_171073 )
      ( MAKE-2PILE ?auto_171068 ?auto_171069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171104 - BLOCK
      ?auto_171105 - BLOCK
      ?auto_171106 - BLOCK
      ?auto_171107 - BLOCK
      ?auto_171108 - BLOCK
    )
    :vars
    (
      ?auto_171109 - BLOCK
      ?auto_171111 - BLOCK
      ?auto_171110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171109 ?auto_171108 ) ( ON-TABLE ?auto_171104 ) ( ON ?auto_171105 ?auto_171104 ) ( ON ?auto_171106 ?auto_171105 ) ( ON ?auto_171107 ?auto_171106 ) ( ON ?auto_171108 ?auto_171107 ) ( not ( = ?auto_171104 ?auto_171105 ) ) ( not ( = ?auto_171104 ?auto_171106 ) ) ( not ( = ?auto_171104 ?auto_171107 ) ) ( not ( = ?auto_171104 ?auto_171108 ) ) ( not ( = ?auto_171104 ?auto_171109 ) ) ( not ( = ?auto_171105 ?auto_171106 ) ) ( not ( = ?auto_171105 ?auto_171107 ) ) ( not ( = ?auto_171105 ?auto_171108 ) ) ( not ( = ?auto_171105 ?auto_171109 ) ) ( not ( = ?auto_171106 ?auto_171107 ) ) ( not ( = ?auto_171106 ?auto_171108 ) ) ( not ( = ?auto_171106 ?auto_171109 ) ) ( not ( = ?auto_171107 ?auto_171108 ) ) ( not ( = ?auto_171107 ?auto_171109 ) ) ( not ( = ?auto_171108 ?auto_171109 ) ) ( not ( = ?auto_171104 ?auto_171111 ) ) ( not ( = ?auto_171104 ?auto_171110 ) ) ( not ( = ?auto_171105 ?auto_171111 ) ) ( not ( = ?auto_171105 ?auto_171110 ) ) ( not ( = ?auto_171106 ?auto_171111 ) ) ( not ( = ?auto_171106 ?auto_171110 ) ) ( not ( = ?auto_171107 ?auto_171111 ) ) ( not ( = ?auto_171107 ?auto_171110 ) ) ( not ( = ?auto_171108 ?auto_171111 ) ) ( not ( = ?auto_171108 ?auto_171110 ) ) ( not ( = ?auto_171109 ?auto_171111 ) ) ( not ( = ?auto_171109 ?auto_171110 ) ) ( not ( = ?auto_171111 ?auto_171110 ) ) ( ON ?auto_171111 ?auto_171109 ) ( CLEAR ?auto_171111 ) ( HOLDING ?auto_171110 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171110 )
      ( MAKE-5PILE ?auto_171104 ?auto_171105 ?auto_171106 ?auto_171107 ?auto_171108 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171217 - BLOCK
      ?auto_171218 - BLOCK
      ?auto_171219 - BLOCK
    )
    :vars
    (
      ?auto_171220 - BLOCK
      ?auto_171224 - BLOCK
      ?auto_171221 - BLOCK
      ?auto_171222 - BLOCK
      ?auto_171223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171217 ) ( not ( = ?auto_171217 ?auto_171218 ) ) ( not ( = ?auto_171217 ?auto_171219 ) ) ( not ( = ?auto_171218 ?auto_171219 ) ) ( ON ?auto_171219 ?auto_171220 ) ( not ( = ?auto_171217 ?auto_171220 ) ) ( not ( = ?auto_171218 ?auto_171220 ) ) ( not ( = ?auto_171219 ?auto_171220 ) ) ( CLEAR ?auto_171217 ) ( ON ?auto_171218 ?auto_171219 ) ( CLEAR ?auto_171218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171224 ) ( ON ?auto_171221 ?auto_171224 ) ( ON ?auto_171222 ?auto_171221 ) ( ON ?auto_171223 ?auto_171222 ) ( ON ?auto_171220 ?auto_171223 ) ( not ( = ?auto_171224 ?auto_171221 ) ) ( not ( = ?auto_171224 ?auto_171222 ) ) ( not ( = ?auto_171224 ?auto_171223 ) ) ( not ( = ?auto_171224 ?auto_171220 ) ) ( not ( = ?auto_171224 ?auto_171219 ) ) ( not ( = ?auto_171224 ?auto_171218 ) ) ( not ( = ?auto_171221 ?auto_171222 ) ) ( not ( = ?auto_171221 ?auto_171223 ) ) ( not ( = ?auto_171221 ?auto_171220 ) ) ( not ( = ?auto_171221 ?auto_171219 ) ) ( not ( = ?auto_171221 ?auto_171218 ) ) ( not ( = ?auto_171222 ?auto_171223 ) ) ( not ( = ?auto_171222 ?auto_171220 ) ) ( not ( = ?auto_171222 ?auto_171219 ) ) ( not ( = ?auto_171222 ?auto_171218 ) ) ( not ( = ?auto_171223 ?auto_171220 ) ) ( not ( = ?auto_171223 ?auto_171219 ) ) ( not ( = ?auto_171223 ?auto_171218 ) ) ( not ( = ?auto_171217 ?auto_171224 ) ) ( not ( = ?auto_171217 ?auto_171221 ) ) ( not ( = ?auto_171217 ?auto_171222 ) ) ( not ( = ?auto_171217 ?auto_171223 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171224 ?auto_171221 ?auto_171222 ?auto_171223 ?auto_171220 ?auto_171219 )
      ( MAKE-3PILE ?auto_171217 ?auto_171218 ?auto_171219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171225 - BLOCK
      ?auto_171226 - BLOCK
      ?auto_171227 - BLOCK
    )
    :vars
    (
      ?auto_171228 - BLOCK
      ?auto_171230 - BLOCK
      ?auto_171229 - BLOCK
      ?auto_171232 - BLOCK
      ?auto_171231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171225 ?auto_171226 ) ) ( not ( = ?auto_171225 ?auto_171227 ) ) ( not ( = ?auto_171226 ?auto_171227 ) ) ( ON ?auto_171227 ?auto_171228 ) ( not ( = ?auto_171225 ?auto_171228 ) ) ( not ( = ?auto_171226 ?auto_171228 ) ) ( not ( = ?auto_171227 ?auto_171228 ) ) ( ON ?auto_171226 ?auto_171227 ) ( CLEAR ?auto_171226 ) ( ON-TABLE ?auto_171230 ) ( ON ?auto_171229 ?auto_171230 ) ( ON ?auto_171232 ?auto_171229 ) ( ON ?auto_171231 ?auto_171232 ) ( ON ?auto_171228 ?auto_171231 ) ( not ( = ?auto_171230 ?auto_171229 ) ) ( not ( = ?auto_171230 ?auto_171232 ) ) ( not ( = ?auto_171230 ?auto_171231 ) ) ( not ( = ?auto_171230 ?auto_171228 ) ) ( not ( = ?auto_171230 ?auto_171227 ) ) ( not ( = ?auto_171230 ?auto_171226 ) ) ( not ( = ?auto_171229 ?auto_171232 ) ) ( not ( = ?auto_171229 ?auto_171231 ) ) ( not ( = ?auto_171229 ?auto_171228 ) ) ( not ( = ?auto_171229 ?auto_171227 ) ) ( not ( = ?auto_171229 ?auto_171226 ) ) ( not ( = ?auto_171232 ?auto_171231 ) ) ( not ( = ?auto_171232 ?auto_171228 ) ) ( not ( = ?auto_171232 ?auto_171227 ) ) ( not ( = ?auto_171232 ?auto_171226 ) ) ( not ( = ?auto_171231 ?auto_171228 ) ) ( not ( = ?auto_171231 ?auto_171227 ) ) ( not ( = ?auto_171231 ?auto_171226 ) ) ( not ( = ?auto_171225 ?auto_171230 ) ) ( not ( = ?auto_171225 ?auto_171229 ) ) ( not ( = ?auto_171225 ?auto_171232 ) ) ( not ( = ?auto_171225 ?auto_171231 ) ) ( HOLDING ?auto_171225 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171225 )
      ( MAKE-3PILE ?auto_171225 ?auto_171226 ?auto_171227 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171233 - BLOCK
      ?auto_171234 - BLOCK
      ?auto_171235 - BLOCK
    )
    :vars
    (
      ?auto_171238 - BLOCK
      ?auto_171236 - BLOCK
      ?auto_171239 - BLOCK
      ?auto_171240 - BLOCK
      ?auto_171237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171233 ?auto_171234 ) ) ( not ( = ?auto_171233 ?auto_171235 ) ) ( not ( = ?auto_171234 ?auto_171235 ) ) ( ON ?auto_171235 ?auto_171238 ) ( not ( = ?auto_171233 ?auto_171238 ) ) ( not ( = ?auto_171234 ?auto_171238 ) ) ( not ( = ?auto_171235 ?auto_171238 ) ) ( ON ?auto_171234 ?auto_171235 ) ( ON-TABLE ?auto_171236 ) ( ON ?auto_171239 ?auto_171236 ) ( ON ?auto_171240 ?auto_171239 ) ( ON ?auto_171237 ?auto_171240 ) ( ON ?auto_171238 ?auto_171237 ) ( not ( = ?auto_171236 ?auto_171239 ) ) ( not ( = ?auto_171236 ?auto_171240 ) ) ( not ( = ?auto_171236 ?auto_171237 ) ) ( not ( = ?auto_171236 ?auto_171238 ) ) ( not ( = ?auto_171236 ?auto_171235 ) ) ( not ( = ?auto_171236 ?auto_171234 ) ) ( not ( = ?auto_171239 ?auto_171240 ) ) ( not ( = ?auto_171239 ?auto_171237 ) ) ( not ( = ?auto_171239 ?auto_171238 ) ) ( not ( = ?auto_171239 ?auto_171235 ) ) ( not ( = ?auto_171239 ?auto_171234 ) ) ( not ( = ?auto_171240 ?auto_171237 ) ) ( not ( = ?auto_171240 ?auto_171238 ) ) ( not ( = ?auto_171240 ?auto_171235 ) ) ( not ( = ?auto_171240 ?auto_171234 ) ) ( not ( = ?auto_171237 ?auto_171238 ) ) ( not ( = ?auto_171237 ?auto_171235 ) ) ( not ( = ?auto_171237 ?auto_171234 ) ) ( not ( = ?auto_171233 ?auto_171236 ) ) ( not ( = ?auto_171233 ?auto_171239 ) ) ( not ( = ?auto_171233 ?auto_171240 ) ) ( not ( = ?auto_171233 ?auto_171237 ) ) ( ON ?auto_171233 ?auto_171234 ) ( CLEAR ?auto_171233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171236 ?auto_171239 ?auto_171240 ?auto_171237 ?auto_171238 ?auto_171235 ?auto_171234 )
      ( MAKE-3PILE ?auto_171233 ?auto_171234 ?auto_171235 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171244 - BLOCK
      ?auto_171245 - BLOCK
      ?auto_171246 - BLOCK
    )
    :vars
    (
      ?auto_171250 - BLOCK
      ?auto_171248 - BLOCK
      ?auto_171249 - BLOCK
      ?auto_171251 - BLOCK
      ?auto_171247 - BLOCK
      ?auto_171252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171244 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171246 ) ) ( not ( = ?auto_171245 ?auto_171246 ) ) ( ON ?auto_171246 ?auto_171250 ) ( not ( = ?auto_171244 ?auto_171250 ) ) ( not ( = ?auto_171245 ?auto_171250 ) ) ( not ( = ?auto_171246 ?auto_171250 ) ) ( ON ?auto_171245 ?auto_171246 ) ( CLEAR ?auto_171245 ) ( ON-TABLE ?auto_171248 ) ( ON ?auto_171249 ?auto_171248 ) ( ON ?auto_171251 ?auto_171249 ) ( ON ?auto_171247 ?auto_171251 ) ( ON ?auto_171250 ?auto_171247 ) ( not ( = ?auto_171248 ?auto_171249 ) ) ( not ( = ?auto_171248 ?auto_171251 ) ) ( not ( = ?auto_171248 ?auto_171247 ) ) ( not ( = ?auto_171248 ?auto_171250 ) ) ( not ( = ?auto_171248 ?auto_171246 ) ) ( not ( = ?auto_171248 ?auto_171245 ) ) ( not ( = ?auto_171249 ?auto_171251 ) ) ( not ( = ?auto_171249 ?auto_171247 ) ) ( not ( = ?auto_171249 ?auto_171250 ) ) ( not ( = ?auto_171249 ?auto_171246 ) ) ( not ( = ?auto_171249 ?auto_171245 ) ) ( not ( = ?auto_171251 ?auto_171247 ) ) ( not ( = ?auto_171251 ?auto_171250 ) ) ( not ( = ?auto_171251 ?auto_171246 ) ) ( not ( = ?auto_171251 ?auto_171245 ) ) ( not ( = ?auto_171247 ?auto_171250 ) ) ( not ( = ?auto_171247 ?auto_171246 ) ) ( not ( = ?auto_171247 ?auto_171245 ) ) ( not ( = ?auto_171244 ?auto_171248 ) ) ( not ( = ?auto_171244 ?auto_171249 ) ) ( not ( = ?auto_171244 ?auto_171251 ) ) ( not ( = ?auto_171244 ?auto_171247 ) ) ( ON ?auto_171244 ?auto_171252 ) ( CLEAR ?auto_171244 ) ( HAND-EMPTY ) ( not ( = ?auto_171244 ?auto_171252 ) ) ( not ( = ?auto_171245 ?auto_171252 ) ) ( not ( = ?auto_171246 ?auto_171252 ) ) ( not ( = ?auto_171250 ?auto_171252 ) ) ( not ( = ?auto_171248 ?auto_171252 ) ) ( not ( = ?auto_171249 ?auto_171252 ) ) ( not ( = ?auto_171251 ?auto_171252 ) ) ( not ( = ?auto_171247 ?auto_171252 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171244 ?auto_171252 )
      ( MAKE-3PILE ?auto_171244 ?auto_171245 ?auto_171246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171253 - BLOCK
      ?auto_171254 - BLOCK
      ?auto_171255 - BLOCK
    )
    :vars
    (
      ?auto_171260 - BLOCK
      ?auto_171259 - BLOCK
      ?auto_171257 - BLOCK
      ?auto_171261 - BLOCK
      ?auto_171256 - BLOCK
      ?auto_171258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171253 ?auto_171254 ) ) ( not ( = ?auto_171253 ?auto_171255 ) ) ( not ( = ?auto_171254 ?auto_171255 ) ) ( ON ?auto_171255 ?auto_171260 ) ( not ( = ?auto_171253 ?auto_171260 ) ) ( not ( = ?auto_171254 ?auto_171260 ) ) ( not ( = ?auto_171255 ?auto_171260 ) ) ( ON-TABLE ?auto_171259 ) ( ON ?auto_171257 ?auto_171259 ) ( ON ?auto_171261 ?auto_171257 ) ( ON ?auto_171256 ?auto_171261 ) ( ON ?auto_171260 ?auto_171256 ) ( not ( = ?auto_171259 ?auto_171257 ) ) ( not ( = ?auto_171259 ?auto_171261 ) ) ( not ( = ?auto_171259 ?auto_171256 ) ) ( not ( = ?auto_171259 ?auto_171260 ) ) ( not ( = ?auto_171259 ?auto_171255 ) ) ( not ( = ?auto_171259 ?auto_171254 ) ) ( not ( = ?auto_171257 ?auto_171261 ) ) ( not ( = ?auto_171257 ?auto_171256 ) ) ( not ( = ?auto_171257 ?auto_171260 ) ) ( not ( = ?auto_171257 ?auto_171255 ) ) ( not ( = ?auto_171257 ?auto_171254 ) ) ( not ( = ?auto_171261 ?auto_171256 ) ) ( not ( = ?auto_171261 ?auto_171260 ) ) ( not ( = ?auto_171261 ?auto_171255 ) ) ( not ( = ?auto_171261 ?auto_171254 ) ) ( not ( = ?auto_171256 ?auto_171260 ) ) ( not ( = ?auto_171256 ?auto_171255 ) ) ( not ( = ?auto_171256 ?auto_171254 ) ) ( not ( = ?auto_171253 ?auto_171259 ) ) ( not ( = ?auto_171253 ?auto_171257 ) ) ( not ( = ?auto_171253 ?auto_171261 ) ) ( not ( = ?auto_171253 ?auto_171256 ) ) ( ON ?auto_171253 ?auto_171258 ) ( CLEAR ?auto_171253 ) ( not ( = ?auto_171253 ?auto_171258 ) ) ( not ( = ?auto_171254 ?auto_171258 ) ) ( not ( = ?auto_171255 ?auto_171258 ) ) ( not ( = ?auto_171260 ?auto_171258 ) ) ( not ( = ?auto_171259 ?auto_171258 ) ) ( not ( = ?auto_171257 ?auto_171258 ) ) ( not ( = ?auto_171261 ?auto_171258 ) ) ( not ( = ?auto_171256 ?auto_171258 ) ) ( HOLDING ?auto_171254 ) ( CLEAR ?auto_171255 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171259 ?auto_171257 ?auto_171261 ?auto_171256 ?auto_171260 ?auto_171255 ?auto_171254 )
      ( MAKE-3PILE ?auto_171253 ?auto_171254 ?auto_171255 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171262 - BLOCK
      ?auto_171263 - BLOCK
      ?auto_171264 - BLOCK
    )
    :vars
    (
      ?auto_171268 - BLOCK
      ?auto_171270 - BLOCK
      ?auto_171267 - BLOCK
      ?auto_171269 - BLOCK
      ?auto_171266 - BLOCK
      ?auto_171265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171262 ?auto_171263 ) ) ( not ( = ?auto_171262 ?auto_171264 ) ) ( not ( = ?auto_171263 ?auto_171264 ) ) ( ON ?auto_171264 ?auto_171268 ) ( not ( = ?auto_171262 ?auto_171268 ) ) ( not ( = ?auto_171263 ?auto_171268 ) ) ( not ( = ?auto_171264 ?auto_171268 ) ) ( ON-TABLE ?auto_171270 ) ( ON ?auto_171267 ?auto_171270 ) ( ON ?auto_171269 ?auto_171267 ) ( ON ?auto_171266 ?auto_171269 ) ( ON ?auto_171268 ?auto_171266 ) ( not ( = ?auto_171270 ?auto_171267 ) ) ( not ( = ?auto_171270 ?auto_171269 ) ) ( not ( = ?auto_171270 ?auto_171266 ) ) ( not ( = ?auto_171270 ?auto_171268 ) ) ( not ( = ?auto_171270 ?auto_171264 ) ) ( not ( = ?auto_171270 ?auto_171263 ) ) ( not ( = ?auto_171267 ?auto_171269 ) ) ( not ( = ?auto_171267 ?auto_171266 ) ) ( not ( = ?auto_171267 ?auto_171268 ) ) ( not ( = ?auto_171267 ?auto_171264 ) ) ( not ( = ?auto_171267 ?auto_171263 ) ) ( not ( = ?auto_171269 ?auto_171266 ) ) ( not ( = ?auto_171269 ?auto_171268 ) ) ( not ( = ?auto_171269 ?auto_171264 ) ) ( not ( = ?auto_171269 ?auto_171263 ) ) ( not ( = ?auto_171266 ?auto_171268 ) ) ( not ( = ?auto_171266 ?auto_171264 ) ) ( not ( = ?auto_171266 ?auto_171263 ) ) ( not ( = ?auto_171262 ?auto_171270 ) ) ( not ( = ?auto_171262 ?auto_171267 ) ) ( not ( = ?auto_171262 ?auto_171269 ) ) ( not ( = ?auto_171262 ?auto_171266 ) ) ( ON ?auto_171262 ?auto_171265 ) ( not ( = ?auto_171262 ?auto_171265 ) ) ( not ( = ?auto_171263 ?auto_171265 ) ) ( not ( = ?auto_171264 ?auto_171265 ) ) ( not ( = ?auto_171268 ?auto_171265 ) ) ( not ( = ?auto_171270 ?auto_171265 ) ) ( not ( = ?auto_171267 ?auto_171265 ) ) ( not ( = ?auto_171269 ?auto_171265 ) ) ( not ( = ?auto_171266 ?auto_171265 ) ) ( CLEAR ?auto_171264 ) ( ON ?auto_171263 ?auto_171262 ) ( CLEAR ?auto_171263 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171265 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171265 ?auto_171262 )
      ( MAKE-3PILE ?auto_171262 ?auto_171263 ?auto_171264 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171271 - BLOCK
      ?auto_171272 - BLOCK
      ?auto_171273 - BLOCK
    )
    :vars
    (
      ?auto_171276 - BLOCK
      ?auto_171278 - BLOCK
      ?auto_171275 - BLOCK
      ?auto_171279 - BLOCK
      ?auto_171274 - BLOCK
      ?auto_171277 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171271 ?auto_171272 ) ) ( not ( = ?auto_171271 ?auto_171273 ) ) ( not ( = ?auto_171272 ?auto_171273 ) ) ( not ( = ?auto_171271 ?auto_171276 ) ) ( not ( = ?auto_171272 ?auto_171276 ) ) ( not ( = ?auto_171273 ?auto_171276 ) ) ( ON-TABLE ?auto_171278 ) ( ON ?auto_171275 ?auto_171278 ) ( ON ?auto_171279 ?auto_171275 ) ( ON ?auto_171274 ?auto_171279 ) ( ON ?auto_171276 ?auto_171274 ) ( not ( = ?auto_171278 ?auto_171275 ) ) ( not ( = ?auto_171278 ?auto_171279 ) ) ( not ( = ?auto_171278 ?auto_171274 ) ) ( not ( = ?auto_171278 ?auto_171276 ) ) ( not ( = ?auto_171278 ?auto_171273 ) ) ( not ( = ?auto_171278 ?auto_171272 ) ) ( not ( = ?auto_171275 ?auto_171279 ) ) ( not ( = ?auto_171275 ?auto_171274 ) ) ( not ( = ?auto_171275 ?auto_171276 ) ) ( not ( = ?auto_171275 ?auto_171273 ) ) ( not ( = ?auto_171275 ?auto_171272 ) ) ( not ( = ?auto_171279 ?auto_171274 ) ) ( not ( = ?auto_171279 ?auto_171276 ) ) ( not ( = ?auto_171279 ?auto_171273 ) ) ( not ( = ?auto_171279 ?auto_171272 ) ) ( not ( = ?auto_171274 ?auto_171276 ) ) ( not ( = ?auto_171274 ?auto_171273 ) ) ( not ( = ?auto_171274 ?auto_171272 ) ) ( not ( = ?auto_171271 ?auto_171278 ) ) ( not ( = ?auto_171271 ?auto_171275 ) ) ( not ( = ?auto_171271 ?auto_171279 ) ) ( not ( = ?auto_171271 ?auto_171274 ) ) ( ON ?auto_171271 ?auto_171277 ) ( not ( = ?auto_171271 ?auto_171277 ) ) ( not ( = ?auto_171272 ?auto_171277 ) ) ( not ( = ?auto_171273 ?auto_171277 ) ) ( not ( = ?auto_171276 ?auto_171277 ) ) ( not ( = ?auto_171278 ?auto_171277 ) ) ( not ( = ?auto_171275 ?auto_171277 ) ) ( not ( = ?auto_171279 ?auto_171277 ) ) ( not ( = ?auto_171274 ?auto_171277 ) ) ( ON ?auto_171272 ?auto_171271 ) ( CLEAR ?auto_171272 ) ( ON-TABLE ?auto_171277 ) ( HOLDING ?auto_171273 ) ( CLEAR ?auto_171276 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171278 ?auto_171275 ?auto_171279 ?auto_171274 ?auto_171276 ?auto_171273 )
      ( MAKE-3PILE ?auto_171271 ?auto_171272 ?auto_171273 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171280 - BLOCK
      ?auto_171281 - BLOCK
      ?auto_171282 - BLOCK
    )
    :vars
    (
      ?auto_171287 - BLOCK
      ?auto_171285 - BLOCK
      ?auto_171283 - BLOCK
      ?auto_171288 - BLOCK
      ?auto_171286 - BLOCK
      ?auto_171284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171280 ?auto_171281 ) ) ( not ( = ?auto_171280 ?auto_171282 ) ) ( not ( = ?auto_171281 ?auto_171282 ) ) ( not ( = ?auto_171280 ?auto_171287 ) ) ( not ( = ?auto_171281 ?auto_171287 ) ) ( not ( = ?auto_171282 ?auto_171287 ) ) ( ON-TABLE ?auto_171285 ) ( ON ?auto_171283 ?auto_171285 ) ( ON ?auto_171288 ?auto_171283 ) ( ON ?auto_171286 ?auto_171288 ) ( ON ?auto_171287 ?auto_171286 ) ( not ( = ?auto_171285 ?auto_171283 ) ) ( not ( = ?auto_171285 ?auto_171288 ) ) ( not ( = ?auto_171285 ?auto_171286 ) ) ( not ( = ?auto_171285 ?auto_171287 ) ) ( not ( = ?auto_171285 ?auto_171282 ) ) ( not ( = ?auto_171285 ?auto_171281 ) ) ( not ( = ?auto_171283 ?auto_171288 ) ) ( not ( = ?auto_171283 ?auto_171286 ) ) ( not ( = ?auto_171283 ?auto_171287 ) ) ( not ( = ?auto_171283 ?auto_171282 ) ) ( not ( = ?auto_171283 ?auto_171281 ) ) ( not ( = ?auto_171288 ?auto_171286 ) ) ( not ( = ?auto_171288 ?auto_171287 ) ) ( not ( = ?auto_171288 ?auto_171282 ) ) ( not ( = ?auto_171288 ?auto_171281 ) ) ( not ( = ?auto_171286 ?auto_171287 ) ) ( not ( = ?auto_171286 ?auto_171282 ) ) ( not ( = ?auto_171286 ?auto_171281 ) ) ( not ( = ?auto_171280 ?auto_171285 ) ) ( not ( = ?auto_171280 ?auto_171283 ) ) ( not ( = ?auto_171280 ?auto_171288 ) ) ( not ( = ?auto_171280 ?auto_171286 ) ) ( ON ?auto_171280 ?auto_171284 ) ( not ( = ?auto_171280 ?auto_171284 ) ) ( not ( = ?auto_171281 ?auto_171284 ) ) ( not ( = ?auto_171282 ?auto_171284 ) ) ( not ( = ?auto_171287 ?auto_171284 ) ) ( not ( = ?auto_171285 ?auto_171284 ) ) ( not ( = ?auto_171283 ?auto_171284 ) ) ( not ( = ?auto_171288 ?auto_171284 ) ) ( not ( = ?auto_171286 ?auto_171284 ) ) ( ON ?auto_171281 ?auto_171280 ) ( ON-TABLE ?auto_171284 ) ( CLEAR ?auto_171287 ) ( ON ?auto_171282 ?auto_171281 ) ( CLEAR ?auto_171282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171284 ?auto_171280 ?auto_171281 )
      ( MAKE-3PILE ?auto_171280 ?auto_171281 ?auto_171282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171289 - BLOCK
      ?auto_171290 - BLOCK
      ?auto_171291 - BLOCK
    )
    :vars
    (
      ?auto_171292 - BLOCK
      ?auto_171295 - BLOCK
      ?auto_171297 - BLOCK
      ?auto_171296 - BLOCK
      ?auto_171293 - BLOCK
      ?auto_171294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171289 ?auto_171290 ) ) ( not ( = ?auto_171289 ?auto_171291 ) ) ( not ( = ?auto_171290 ?auto_171291 ) ) ( not ( = ?auto_171289 ?auto_171292 ) ) ( not ( = ?auto_171290 ?auto_171292 ) ) ( not ( = ?auto_171291 ?auto_171292 ) ) ( ON-TABLE ?auto_171295 ) ( ON ?auto_171297 ?auto_171295 ) ( ON ?auto_171296 ?auto_171297 ) ( ON ?auto_171293 ?auto_171296 ) ( not ( = ?auto_171295 ?auto_171297 ) ) ( not ( = ?auto_171295 ?auto_171296 ) ) ( not ( = ?auto_171295 ?auto_171293 ) ) ( not ( = ?auto_171295 ?auto_171292 ) ) ( not ( = ?auto_171295 ?auto_171291 ) ) ( not ( = ?auto_171295 ?auto_171290 ) ) ( not ( = ?auto_171297 ?auto_171296 ) ) ( not ( = ?auto_171297 ?auto_171293 ) ) ( not ( = ?auto_171297 ?auto_171292 ) ) ( not ( = ?auto_171297 ?auto_171291 ) ) ( not ( = ?auto_171297 ?auto_171290 ) ) ( not ( = ?auto_171296 ?auto_171293 ) ) ( not ( = ?auto_171296 ?auto_171292 ) ) ( not ( = ?auto_171296 ?auto_171291 ) ) ( not ( = ?auto_171296 ?auto_171290 ) ) ( not ( = ?auto_171293 ?auto_171292 ) ) ( not ( = ?auto_171293 ?auto_171291 ) ) ( not ( = ?auto_171293 ?auto_171290 ) ) ( not ( = ?auto_171289 ?auto_171295 ) ) ( not ( = ?auto_171289 ?auto_171297 ) ) ( not ( = ?auto_171289 ?auto_171296 ) ) ( not ( = ?auto_171289 ?auto_171293 ) ) ( ON ?auto_171289 ?auto_171294 ) ( not ( = ?auto_171289 ?auto_171294 ) ) ( not ( = ?auto_171290 ?auto_171294 ) ) ( not ( = ?auto_171291 ?auto_171294 ) ) ( not ( = ?auto_171292 ?auto_171294 ) ) ( not ( = ?auto_171295 ?auto_171294 ) ) ( not ( = ?auto_171297 ?auto_171294 ) ) ( not ( = ?auto_171296 ?auto_171294 ) ) ( not ( = ?auto_171293 ?auto_171294 ) ) ( ON ?auto_171290 ?auto_171289 ) ( ON-TABLE ?auto_171294 ) ( ON ?auto_171291 ?auto_171290 ) ( CLEAR ?auto_171291 ) ( HOLDING ?auto_171292 ) ( CLEAR ?auto_171293 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171295 ?auto_171297 ?auto_171296 ?auto_171293 ?auto_171292 )
      ( MAKE-3PILE ?auto_171289 ?auto_171290 ?auto_171291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171298 - BLOCK
      ?auto_171299 - BLOCK
      ?auto_171300 - BLOCK
    )
    :vars
    (
      ?auto_171305 - BLOCK
      ?auto_171303 - BLOCK
      ?auto_171301 - BLOCK
      ?auto_171306 - BLOCK
      ?auto_171302 - BLOCK
      ?auto_171304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171298 ?auto_171299 ) ) ( not ( = ?auto_171298 ?auto_171300 ) ) ( not ( = ?auto_171299 ?auto_171300 ) ) ( not ( = ?auto_171298 ?auto_171305 ) ) ( not ( = ?auto_171299 ?auto_171305 ) ) ( not ( = ?auto_171300 ?auto_171305 ) ) ( ON-TABLE ?auto_171303 ) ( ON ?auto_171301 ?auto_171303 ) ( ON ?auto_171306 ?auto_171301 ) ( ON ?auto_171302 ?auto_171306 ) ( not ( = ?auto_171303 ?auto_171301 ) ) ( not ( = ?auto_171303 ?auto_171306 ) ) ( not ( = ?auto_171303 ?auto_171302 ) ) ( not ( = ?auto_171303 ?auto_171305 ) ) ( not ( = ?auto_171303 ?auto_171300 ) ) ( not ( = ?auto_171303 ?auto_171299 ) ) ( not ( = ?auto_171301 ?auto_171306 ) ) ( not ( = ?auto_171301 ?auto_171302 ) ) ( not ( = ?auto_171301 ?auto_171305 ) ) ( not ( = ?auto_171301 ?auto_171300 ) ) ( not ( = ?auto_171301 ?auto_171299 ) ) ( not ( = ?auto_171306 ?auto_171302 ) ) ( not ( = ?auto_171306 ?auto_171305 ) ) ( not ( = ?auto_171306 ?auto_171300 ) ) ( not ( = ?auto_171306 ?auto_171299 ) ) ( not ( = ?auto_171302 ?auto_171305 ) ) ( not ( = ?auto_171302 ?auto_171300 ) ) ( not ( = ?auto_171302 ?auto_171299 ) ) ( not ( = ?auto_171298 ?auto_171303 ) ) ( not ( = ?auto_171298 ?auto_171301 ) ) ( not ( = ?auto_171298 ?auto_171306 ) ) ( not ( = ?auto_171298 ?auto_171302 ) ) ( ON ?auto_171298 ?auto_171304 ) ( not ( = ?auto_171298 ?auto_171304 ) ) ( not ( = ?auto_171299 ?auto_171304 ) ) ( not ( = ?auto_171300 ?auto_171304 ) ) ( not ( = ?auto_171305 ?auto_171304 ) ) ( not ( = ?auto_171303 ?auto_171304 ) ) ( not ( = ?auto_171301 ?auto_171304 ) ) ( not ( = ?auto_171306 ?auto_171304 ) ) ( not ( = ?auto_171302 ?auto_171304 ) ) ( ON ?auto_171299 ?auto_171298 ) ( ON-TABLE ?auto_171304 ) ( ON ?auto_171300 ?auto_171299 ) ( CLEAR ?auto_171302 ) ( ON ?auto_171305 ?auto_171300 ) ( CLEAR ?auto_171305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171304 ?auto_171298 ?auto_171299 ?auto_171300 )
      ( MAKE-3PILE ?auto_171298 ?auto_171299 ?auto_171300 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171307 - BLOCK
      ?auto_171308 - BLOCK
      ?auto_171309 - BLOCK
    )
    :vars
    (
      ?auto_171315 - BLOCK
      ?auto_171313 - BLOCK
      ?auto_171314 - BLOCK
      ?auto_171310 - BLOCK
      ?auto_171312 - BLOCK
      ?auto_171311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171307 ?auto_171308 ) ) ( not ( = ?auto_171307 ?auto_171309 ) ) ( not ( = ?auto_171308 ?auto_171309 ) ) ( not ( = ?auto_171307 ?auto_171315 ) ) ( not ( = ?auto_171308 ?auto_171315 ) ) ( not ( = ?auto_171309 ?auto_171315 ) ) ( ON-TABLE ?auto_171313 ) ( ON ?auto_171314 ?auto_171313 ) ( ON ?auto_171310 ?auto_171314 ) ( not ( = ?auto_171313 ?auto_171314 ) ) ( not ( = ?auto_171313 ?auto_171310 ) ) ( not ( = ?auto_171313 ?auto_171312 ) ) ( not ( = ?auto_171313 ?auto_171315 ) ) ( not ( = ?auto_171313 ?auto_171309 ) ) ( not ( = ?auto_171313 ?auto_171308 ) ) ( not ( = ?auto_171314 ?auto_171310 ) ) ( not ( = ?auto_171314 ?auto_171312 ) ) ( not ( = ?auto_171314 ?auto_171315 ) ) ( not ( = ?auto_171314 ?auto_171309 ) ) ( not ( = ?auto_171314 ?auto_171308 ) ) ( not ( = ?auto_171310 ?auto_171312 ) ) ( not ( = ?auto_171310 ?auto_171315 ) ) ( not ( = ?auto_171310 ?auto_171309 ) ) ( not ( = ?auto_171310 ?auto_171308 ) ) ( not ( = ?auto_171312 ?auto_171315 ) ) ( not ( = ?auto_171312 ?auto_171309 ) ) ( not ( = ?auto_171312 ?auto_171308 ) ) ( not ( = ?auto_171307 ?auto_171313 ) ) ( not ( = ?auto_171307 ?auto_171314 ) ) ( not ( = ?auto_171307 ?auto_171310 ) ) ( not ( = ?auto_171307 ?auto_171312 ) ) ( ON ?auto_171307 ?auto_171311 ) ( not ( = ?auto_171307 ?auto_171311 ) ) ( not ( = ?auto_171308 ?auto_171311 ) ) ( not ( = ?auto_171309 ?auto_171311 ) ) ( not ( = ?auto_171315 ?auto_171311 ) ) ( not ( = ?auto_171313 ?auto_171311 ) ) ( not ( = ?auto_171314 ?auto_171311 ) ) ( not ( = ?auto_171310 ?auto_171311 ) ) ( not ( = ?auto_171312 ?auto_171311 ) ) ( ON ?auto_171308 ?auto_171307 ) ( ON-TABLE ?auto_171311 ) ( ON ?auto_171309 ?auto_171308 ) ( ON ?auto_171315 ?auto_171309 ) ( CLEAR ?auto_171315 ) ( HOLDING ?auto_171312 ) ( CLEAR ?auto_171310 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171313 ?auto_171314 ?auto_171310 ?auto_171312 )
      ( MAKE-3PILE ?auto_171307 ?auto_171308 ?auto_171309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171316 - BLOCK
      ?auto_171317 - BLOCK
      ?auto_171318 - BLOCK
    )
    :vars
    (
      ?auto_171323 - BLOCK
      ?auto_171322 - BLOCK
      ?auto_171324 - BLOCK
      ?auto_171319 - BLOCK
      ?auto_171321 - BLOCK
      ?auto_171320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171316 ?auto_171317 ) ) ( not ( = ?auto_171316 ?auto_171318 ) ) ( not ( = ?auto_171317 ?auto_171318 ) ) ( not ( = ?auto_171316 ?auto_171323 ) ) ( not ( = ?auto_171317 ?auto_171323 ) ) ( not ( = ?auto_171318 ?auto_171323 ) ) ( ON-TABLE ?auto_171322 ) ( ON ?auto_171324 ?auto_171322 ) ( ON ?auto_171319 ?auto_171324 ) ( not ( = ?auto_171322 ?auto_171324 ) ) ( not ( = ?auto_171322 ?auto_171319 ) ) ( not ( = ?auto_171322 ?auto_171321 ) ) ( not ( = ?auto_171322 ?auto_171323 ) ) ( not ( = ?auto_171322 ?auto_171318 ) ) ( not ( = ?auto_171322 ?auto_171317 ) ) ( not ( = ?auto_171324 ?auto_171319 ) ) ( not ( = ?auto_171324 ?auto_171321 ) ) ( not ( = ?auto_171324 ?auto_171323 ) ) ( not ( = ?auto_171324 ?auto_171318 ) ) ( not ( = ?auto_171324 ?auto_171317 ) ) ( not ( = ?auto_171319 ?auto_171321 ) ) ( not ( = ?auto_171319 ?auto_171323 ) ) ( not ( = ?auto_171319 ?auto_171318 ) ) ( not ( = ?auto_171319 ?auto_171317 ) ) ( not ( = ?auto_171321 ?auto_171323 ) ) ( not ( = ?auto_171321 ?auto_171318 ) ) ( not ( = ?auto_171321 ?auto_171317 ) ) ( not ( = ?auto_171316 ?auto_171322 ) ) ( not ( = ?auto_171316 ?auto_171324 ) ) ( not ( = ?auto_171316 ?auto_171319 ) ) ( not ( = ?auto_171316 ?auto_171321 ) ) ( ON ?auto_171316 ?auto_171320 ) ( not ( = ?auto_171316 ?auto_171320 ) ) ( not ( = ?auto_171317 ?auto_171320 ) ) ( not ( = ?auto_171318 ?auto_171320 ) ) ( not ( = ?auto_171323 ?auto_171320 ) ) ( not ( = ?auto_171322 ?auto_171320 ) ) ( not ( = ?auto_171324 ?auto_171320 ) ) ( not ( = ?auto_171319 ?auto_171320 ) ) ( not ( = ?auto_171321 ?auto_171320 ) ) ( ON ?auto_171317 ?auto_171316 ) ( ON-TABLE ?auto_171320 ) ( ON ?auto_171318 ?auto_171317 ) ( ON ?auto_171323 ?auto_171318 ) ( CLEAR ?auto_171319 ) ( ON ?auto_171321 ?auto_171323 ) ( CLEAR ?auto_171321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171320 ?auto_171316 ?auto_171317 ?auto_171318 ?auto_171323 )
      ( MAKE-3PILE ?auto_171316 ?auto_171317 ?auto_171318 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171325 - BLOCK
      ?auto_171326 - BLOCK
      ?auto_171327 - BLOCK
    )
    :vars
    (
      ?auto_171330 - BLOCK
      ?auto_171331 - BLOCK
      ?auto_171328 - BLOCK
      ?auto_171333 - BLOCK
      ?auto_171332 - BLOCK
      ?auto_171329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171325 ?auto_171326 ) ) ( not ( = ?auto_171325 ?auto_171327 ) ) ( not ( = ?auto_171326 ?auto_171327 ) ) ( not ( = ?auto_171325 ?auto_171330 ) ) ( not ( = ?auto_171326 ?auto_171330 ) ) ( not ( = ?auto_171327 ?auto_171330 ) ) ( ON-TABLE ?auto_171331 ) ( ON ?auto_171328 ?auto_171331 ) ( not ( = ?auto_171331 ?auto_171328 ) ) ( not ( = ?auto_171331 ?auto_171333 ) ) ( not ( = ?auto_171331 ?auto_171332 ) ) ( not ( = ?auto_171331 ?auto_171330 ) ) ( not ( = ?auto_171331 ?auto_171327 ) ) ( not ( = ?auto_171331 ?auto_171326 ) ) ( not ( = ?auto_171328 ?auto_171333 ) ) ( not ( = ?auto_171328 ?auto_171332 ) ) ( not ( = ?auto_171328 ?auto_171330 ) ) ( not ( = ?auto_171328 ?auto_171327 ) ) ( not ( = ?auto_171328 ?auto_171326 ) ) ( not ( = ?auto_171333 ?auto_171332 ) ) ( not ( = ?auto_171333 ?auto_171330 ) ) ( not ( = ?auto_171333 ?auto_171327 ) ) ( not ( = ?auto_171333 ?auto_171326 ) ) ( not ( = ?auto_171332 ?auto_171330 ) ) ( not ( = ?auto_171332 ?auto_171327 ) ) ( not ( = ?auto_171332 ?auto_171326 ) ) ( not ( = ?auto_171325 ?auto_171331 ) ) ( not ( = ?auto_171325 ?auto_171328 ) ) ( not ( = ?auto_171325 ?auto_171333 ) ) ( not ( = ?auto_171325 ?auto_171332 ) ) ( ON ?auto_171325 ?auto_171329 ) ( not ( = ?auto_171325 ?auto_171329 ) ) ( not ( = ?auto_171326 ?auto_171329 ) ) ( not ( = ?auto_171327 ?auto_171329 ) ) ( not ( = ?auto_171330 ?auto_171329 ) ) ( not ( = ?auto_171331 ?auto_171329 ) ) ( not ( = ?auto_171328 ?auto_171329 ) ) ( not ( = ?auto_171333 ?auto_171329 ) ) ( not ( = ?auto_171332 ?auto_171329 ) ) ( ON ?auto_171326 ?auto_171325 ) ( ON-TABLE ?auto_171329 ) ( ON ?auto_171327 ?auto_171326 ) ( ON ?auto_171330 ?auto_171327 ) ( ON ?auto_171332 ?auto_171330 ) ( CLEAR ?auto_171332 ) ( HOLDING ?auto_171333 ) ( CLEAR ?auto_171328 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171331 ?auto_171328 ?auto_171333 )
      ( MAKE-3PILE ?auto_171325 ?auto_171326 ?auto_171327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171334 - BLOCK
      ?auto_171335 - BLOCK
      ?auto_171336 - BLOCK
    )
    :vars
    (
      ?auto_171339 - BLOCK
      ?auto_171338 - BLOCK
      ?auto_171337 - BLOCK
      ?auto_171340 - BLOCK
      ?auto_171341 - BLOCK
      ?auto_171342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171334 ?auto_171335 ) ) ( not ( = ?auto_171334 ?auto_171336 ) ) ( not ( = ?auto_171335 ?auto_171336 ) ) ( not ( = ?auto_171334 ?auto_171339 ) ) ( not ( = ?auto_171335 ?auto_171339 ) ) ( not ( = ?auto_171336 ?auto_171339 ) ) ( ON-TABLE ?auto_171338 ) ( ON ?auto_171337 ?auto_171338 ) ( not ( = ?auto_171338 ?auto_171337 ) ) ( not ( = ?auto_171338 ?auto_171340 ) ) ( not ( = ?auto_171338 ?auto_171341 ) ) ( not ( = ?auto_171338 ?auto_171339 ) ) ( not ( = ?auto_171338 ?auto_171336 ) ) ( not ( = ?auto_171338 ?auto_171335 ) ) ( not ( = ?auto_171337 ?auto_171340 ) ) ( not ( = ?auto_171337 ?auto_171341 ) ) ( not ( = ?auto_171337 ?auto_171339 ) ) ( not ( = ?auto_171337 ?auto_171336 ) ) ( not ( = ?auto_171337 ?auto_171335 ) ) ( not ( = ?auto_171340 ?auto_171341 ) ) ( not ( = ?auto_171340 ?auto_171339 ) ) ( not ( = ?auto_171340 ?auto_171336 ) ) ( not ( = ?auto_171340 ?auto_171335 ) ) ( not ( = ?auto_171341 ?auto_171339 ) ) ( not ( = ?auto_171341 ?auto_171336 ) ) ( not ( = ?auto_171341 ?auto_171335 ) ) ( not ( = ?auto_171334 ?auto_171338 ) ) ( not ( = ?auto_171334 ?auto_171337 ) ) ( not ( = ?auto_171334 ?auto_171340 ) ) ( not ( = ?auto_171334 ?auto_171341 ) ) ( ON ?auto_171334 ?auto_171342 ) ( not ( = ?auto_171334 ?auto_171342 ) ) ( not ( = ?auto_171335 ?auto_171342 ) ) ( not ( = ?auto_171336 ?auto_171342 ) ) ( not ( = ?auto_171339 ?auto_171342 ) ) ( not ( = ?auto_171338 ?auto_171342 ) ) ( not ( = ?auto_171337 ?auto_171342 ) ) ( not ( = ?auto_171340 ?auto_171342 ) ) ( not ( = ?auto_171341 ?auto_171342 ) ) ( ON ?auto_171335 ?auto_171334 ) ( ON-TABLE ?auto_171342 ) ( ON ?auto_171336 ?auto_171335 ) ( ON ?auto_171339 ?auto_171336 ) ( ON ?auto_171341 ?auto_171339 ) ( CLEAR ?auto_171337 ) ( ON ?auto_171340 ?auto_171341 ) ( CLEAR ?auto_171340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171342 ?auto_171334 ?auto_171335 ?auto_171336 ?auto_171339 ?auto_171341 )
      ( MAKE-3PILE ?auto_171334 ?auto_171335 ?auto_171336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171343 - BLOCK
      ?auto_171344 - BLOCK
      ?auto_171345 - BLOCK
    )
    :vars
    (
      ?auto_171351 - BLOCK
      ?auto_171347 - BLOCK
      ?auto_171346 - BLOCK
      ?auto_171349 - BLOCK
      ?auto_171350 - BLOCK
      ?auto_171348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171343 ?auto_171344 ) ) ( not ( = ?auto_171343 ?auto_171345 ) ) ( not ( = ?auto_171344 ?auto_171345 ) ) ( not ( = ?auto_171343 ?auto_171351 ) ) ( not ( = ?auto_171344 ?auto_171351 ) ) ( not ( = ?auto_171345 ?auto_171351 ) ) ( ON-TABLE ?auto_171347 ) ( not ( = ?auto_171347 ?auto_171346 ) ) ( not ( = ?auto_171347 ?auto_171349 ) ) ( not ( = ?auto_171347 ?auto_171350 ) ) ( not ( = ?auto_171347 ?auto_171351 ) ) ( not ( = ?auto_171347 ?auto_171345 ) ) ( not ( = ?auto_171347 ?auto_171344 ) ) ( not ( = ?auto_171346 ?auto_171349 ) ) ( not ( = ?auto_171346 ?auto_171350 ) ) ( not ( = ?auto_171346 ?auto_171351 ) ) ( not ( = ?auto_171346 ?auto_171345 ) ) ( not ( = ?auto_171346 ?auto_171344 ) ) ( not ( = ?auto_171349 ?auto_171350 ) ) ( not ( = ?auto_171349 ?auto_171351 ) ) ( not ( = ?auto_171349 ?auto_171345 ) ) ( not ( = ?auto_171349 ?auto_171344 ) ) ( not ( = ?auto_171350 ?auto_171351 ) ) ( not ( = ?auto_171350 ?auto_171345 ) ) ( not ( = ?auto_171350 ?auto_171344 ) ) ( not ( = ?auto_171343 ?auto_171347 ) ) ( not ( = ?auto_171343 ?auto_171346 ) ) ( not ( = ?auto_171343 ?auto_171349 ) ) ( not ( = ?auto_171343 ?auto_171350 ) ) ( ON ?auto_171343 ?auto_171348 ) ( not ( = ?auto_171343 ?auto_171348 ) ) ( not ( = ?auto_171344 ?auto_171348 ) ) ( not ( = ?auto_171345 ?auto_171348 ) ) ( not ( = ?auto_171351 ?auto_171348 ) ) ( not ( = ?auto_171347 ?auto_171348 ) ) ( not ( = ?auto_171346 ?auto_171348 ) ) ( not ( = ?auto_171349 ?auto_171348 ) ) ( not ( = ?auto_171350 ?auto_171348 ) ) ( ON ?auto_171344 ?auto_171343 ) ( ON-TABLE ?auto_171348 ) ( ON ?auto_171345 ?auto_171344 ) ( ON ?auto_171351 ?auto_171345 ) ( ON ?auto_171350 ?auto_171351 ) ( ON ?auto_171349 ?auto_171350 ) ( CLEAR ?auto_171349 ) ( HOLDING ?auto_171346 ) ( CLEAR ?auto_171347 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171347 ?auto_171346 )
      ( MAKE-3PILE ?auto_171343 ?auto_171344 ?auto_171345 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171352 - BLOCK
      ?auto_171353 - BLOCK
      ?auto_171354 - BLOCK
    )
    :vars
    (
      ?auto_171357 - BLOCK
      ?auto_171355 - BLOCK
      ?auto_171356 - BLOCK
      ?auto_171359 - BLOCK
      ?auto_171358 - BLOCK
      ?auto_171360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171352 ?auto_171353 ) ) ( not ( = ?auto_171352 ?auto_171354 ) ) ( not ( = ?auto_171353 ?auto_171354 ) ) ( not ( = ?auto_171352 ?auto_171357 ) ) ( not ( = ?auto_171353 ?auto_171357 ) ) ( not ( = ?auto_171354 ?auto_171357 ) ) ( ON-TABLE ?auto_171355 ) ( not ( = ?auto_171355 ?auto_171356 ) ) ( not ( = ?auto_171355 ?auto_171359 ) ) ( not ( = ?auto_171355 ?auto_171358 ) ) ( not ( = ?auto_171355 ?auto_171357 ) ) ( not ( = ?auto_171355 ?auto_171354 ) ) ( not ( = ?auto_171355 ?auto_171353 ) ) ( not ( = ?auto_171356 ?auto_171359 ) ) ( not ( = ?auto_171356 ?auto_171358 ) ) ( not ( = ?auto_171356 ?auto_171357 ) ) ( not ( = ?auto_171356 ?auto_171354 ) ) ( not ( = ?auto_171356 ?auto_171353 ) ) ( not ( = ?auto_171359 ?auto_171358 ) ) ( not ( = ?auto_171359 ?auto_171357 ) ) ( not ( = ?auto_171359 ?auto_171354 ) ) ( not ( = ?auto_171359 ?auto_171353 ) ) ( not ( = ?auto_171358 ?auto_171357 ) ) ( not ( = ?auto_171358 ?auto_171354 ) ) ( not ( = ?auto_171358 ?auto_171353 ) ) ( not ( = ?auto_171352 ?auto_171355 ) ) ( not ( = ?auto_171352 ?auto_171356 ) ) ( not ( = ?auto_171352 ?auto_171359 ) ) ( not ( = ?auto_171352 ?auto_171358 ) ) ( ON ?auto_171352 ?auto_171360 ) ( not ( = ?auto_171352 ?auto_171360 ) ) ( not ( = ?auto_171353 ?auto_171360 ) ) ( not ( = ?auto_171354 ?auto_171360 ) ) ( not ( = ?auto_171357 ?auto_171360 ) ) ( not ( = ?auto_171355 ?auto_171360 ) ) ( not ( = ?auto_171356 ?auto_171360 ) ) ( not ( = ?auto_171359 ?auto_171360 ) ) ( not ( = ?auto_171358 ?auto_171360 ) ) ( ON ?auto_171353 ?auto_171352 ) ( ON-TABLE ?auto_171360 ) ( ON ?auto_171354 ?auto_171353 ) ( ON ?auto_171357 ?auto_171354 ) ( ON ?auto_171358 ?auto_171357 ) ( ON ?auto_171359 ?auto_171358 ) ( CLEAR ?auto_171355 ) ( ON ?auto_171356 ?auto_171359 ) ( CLEAR ?auto_171356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171360 ?auto_171352 ?auto_171353 ?auto_171354 ?auto_171357 ?auto_171358 ?auto_171359 )
      ( MAKE-3PILE ?auto_171352 ?auto_171353 ?auto_171354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171361 - BLOCK
      ?auto_171362 - BLOCK
      ?auto_171363 - BLOCK
    )
    :vars
    (
      ?auto_171368 - BLOCK
      ?auto_171365 - BLOCK
      ?auto_171364 - BLOCK
      ?auto_171367 - BLOCK
      ?auto_171366 - BLOCK
      ?auto_171369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171361 ?auto_171362 ) ) ( not ( = ?auto_171361 ?auto_171363 ) ) ( not ( = ?auto_171362 ?auto_171363 ) ) ( not ( = ?auto_171361 ?auto_171368 ) ) ( not ( = ?auto_171362 ?auto_171368 ) ) ( not ( = ?auto_171363 ?auto_171368 ) ) ( not ( = ?auto_171365 ?auto_171364 ) ) ( not ( = ?auto_171365 ?auto_171367 ) ) ( not ( = ?auto_171365 ?auto_171366 ) ) ( not ( = ?auto_171365 ?auto_171368 ) ) ( not ( = ?auto_171365 ?auto_171363 ) ) ( not ( = ?auto_171365 ?auto_171362 ) ) ( not ( = ?auto_171364 ?auto_171367 ) ) ( not ( = ?auto_171364 ?auto_171366 ) ) ( not ( = ?auto_171364 ?auto_171368 ) ) ( not ( = ?auto_171364 ?auto_171363 ) ) ( not ( = ?auto_171364 ?auto_171362 ) ) ( not ( = ?auto_171367 ?auto_171366 ) ) ( not ( = ?auto_171367 ?auto_171368 ) ) ( not ( = ?auto_171367 ?auto_171363 ) ) ( not ( = ?auto_171367 ?auto_171362 ) ) ( not ( = ?auto_171366 ?auto_171368 ) ) ( not ( = ?auto_171366 ?auto_171363 ) ) ( not ( = ?auto_171366 ?auto_171362 ) ) ( not ( = ?auto_171361 ?auto_171365 ) ) ( not ( = ?auto_171361 ?auto_171364 ) ) ( not ( = ?auto_171361 ?auto_171367 ) ) ( not ( = ?auto_171361 ?auto_171366 ) ) ( ON ?auto_171361 ?auto_171369 ) ( not ( = ?auto_171361 ?auto_171369 ) ) ( not ( = ?auto_171362 ?auto_171369 ) ) ( not ( = ?auto_171363 ?auto_171369 ) ) ( not ( = ?auto_171368 ?auto_171369 ) ) ( not ( = ?auto_171365 ?auto_171369 ) ) ( not ( = ?auto_171364 ?auto_171369 ) ) ( not ( = ?auto_171367 ?auto_171369 ) ) ( not ( = ?auto_171366 ?auto_171369 ) ) ( ON ?auto_171362 ?auto_171361 ) ( ON-TABLE ?auto_171369 ) ( ON ?auto_171363 ?auto_171362 ) ( ON ?auto_171368 ?auto_171363 ) ( ON ?auto_171366 ?auto_171368 ) ( ON ?auto_171367 ?auto_171366 ) ( ON ?auto_171364 ?auto_171367 ) ( CLEAR ?auto_171364 ) ( HOLDING ?auto_171365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171365 )
      ( MAKE-3PILE ?auto_171361 ?auto_171362 ?auto_171363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171370 - BLOCK
      ?auto_171371 - BLOCK
      ?auto_171372 - BLOCK
    )
    :vars
    (
      ?auto_171377 - BLOCK
      ?auto_171375 - BLOCK
      ?auto_171374 - BLOCK
      ?auto_171373 - BLOCK
      ?auto_171376 - BLOCK
      ?auto_171378 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171370 ?auto_171371 ) ) ( not ( = ?auto_171370 ?auto_171372 ) ) ( not ( = ?auto_171371 ?auto_171372 ) ) ( not ( = ?auto_171370 ?auto_171377 ) ) ( not ( = ?auto_171371 ?auto_171377 ) ) ( not ( = ?auto_171372 ?auto_171377 ) ) ( not ( = ?auto_171375 ?auto_171374 ) ) ( not ( = ?auto_171375 ?auto_171373 ) ) ( not ( = ?auto_171375 ?auto_171376 ) ) ( not ( = ?auto_171375 ?auto_171377 ) ) ( not ( = ?auto_171375 ?auto_171372 ) ) ( not ( = ?auto_171375 ?auto_171371 ) ) ( not ( = ?auto_171374 ?auto_171373 ) ) ( not ( = ?auto_171374 ?auto_171376 ) ) ( not ( = ?auto_171374 ?auto_171377 ) ) ( not ( = ?auto_171374 ?auto_171372 ) ) ( not ( = ?auto_171374 ?auto_171371 ) ) ( not ( = ?auto_171373 ?auto_171376 ) ) ( not ( = ?auto_171373 ?auto_171377 ) ) ( not ( = ?auto_171373 ?auto_171372 ) ) ( not ( = ?auto_171373 ?auto_171371 ) ) ( not ( = ?auto_171376 ?auto_171377 ) ) ( not ( = ?auto_171376 ?auto_171372 ) ) ( not ( = ?auto_171376 ?auto_171371 ) ) ( not ( = ?auto_171370 ?auto_171375 ) ) ( not ( = ?auto_171370 ?auto_171374 ) ) ( not ( = ?auto_171370 ?auto_171373 ) ) ( not ( = ?auto_171370 ?auto_171376 ) ) ( ON ?auto_171370 ?auto_171378 ) ( not ( = ?auto_171370 ?auto_171378 ) ) ( not ( = ?auto_171371 ?auto_171378 ) ) ( not ( = ?auto_171372 ?auto_171378 ) ) ( not ( = ?auto_171377 ?auto_171378 ) ) ( not ( = ?auto_171375 ?auto_171378 ) ) ( not ( = ?auto_171374 ?auto_171378 ) ) ( not ( = ?auto_171373 ?auto_171378 ) ) ( not ( = ?auto_171376 ?auto_171378 ) ) ( ON ?auto_171371 ?auto_171370 ) ( ON-TABLE ?auto_171378 ) ( ON ?auto_171372 ?auto_171371 ) ( ON ?auto_171377 ?auto_171372 ) ( ON ?auto_171376 ?auto_171377 ) ( ON ?auto_171373 ?auto_171376 ) ( ON ?auto_171374 ?auto_171373 ) ( ON ?auto_171375 ?auto_171374 ) ( CLEAR ?auto_171375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171378 ?auto_171370 ?auto_171371 ?auto_171372 ?auto_171377 ?auto_171376 ?auto_171373 ?auto_171374 )
      ( MAKE-3PILE ?auto_171370 ?auto_171371 ?auto_171372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171402 - BLOCK
      ?auto_171403 - BLOCK
      ?auto_171404 - BLOCK
      ?auto_171405 - BLOCK
    )
    :vars
    (
      ?auto_171408 - BLOCK
      ?auto_171406 - BLOCK
      ?auto_171407 - BLOCK
      ?auto_171409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171408 ?auto_171405 ) ( ON-TABLE ?auto_171402 ) ( ON ?auto_171403 ?auto_171402 ) ( ON ?auto_171404 ?auto_171403 ) ( ON ?auto_171405 ?auto_171404 ) ( not ( = ?auto_171402 ?auto_171403 ) ) ( not ( = ?auto_171402 ?auto_171404 ) ) ( not ( = ?auto_171402 ?auto_171405 ) ) ( not ( = ?auto_171402 ?auto_171408 ) ) ( not ( = ?auto_171403 ?auto_171404 ) ) ( not ( = ?auto_171403 ?auto_171405 ) ) ( not ( = ?auto_171403 ?auto_171408 ) ) ( not ( = ?auto_171404 ?auto_171405 ) ) ( not ( = ?auto_171404 ?auto_171408 ) ) ( not ( = ?auto_171405 ?auto_171408 ) ) ( not ( = ?auto_171402 ?auto_171406 ) ) ( not ( = ?auto_171402 ?auto_171407 ) ) ( not ( = ?auto_171403 ?auto_171406 ) ) ( not ( = ?auto_171403 ?auto_171407 ) ) ( not ( = ?auto_171404 ?auto_171406 ) ) ( not ( = ?auto_171404 ?auto_171407 ) ) ( not ( = ?auto_171405 ?auto_171406 ) ) ( not ( = ?auto_171405 ?auto_171407 ) ) ( not ( = ?auto_171408 ?auto_171406 ) ) ( not ( = ?auto_171408 ?auto_171407 ) ) ( not ( = ?auto_171406 ?auto_171407 ) ) ( ON ?auto_171406 ?auto_171408 ) ( CLEAR ?auto_171406 ) ( HOLDING ?auto_171407 ) ( CLEAR ?auto_171409 ) ( ON-TABLE ?auto_171409 ) ( not ( = ?auto_171409 ?auto_171407 ) ) ( not ( = ?auto_171402 ?auto_171409 ) ) ( not ( = ?auto_171403 ?auto_171409 ) ) ( not ( = ?auto_171404 ?auto_171409 ) ) ( not ( = ?auto_171405 ?auto_171409 ) ) ( not ( = ?auto_171408 ?auto_171409 ) ) ( not ( = ?auto_171406 ?auto_171409 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171409 ?auto_171407 )
      ( MAKE-4PILE ?auto_171402 ?auto_171403 ?auto_171404 ?auto_171405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171410 - BLOCK
      ?auto_171411 - BLOCK
      ?auto_171412 - BLOCK
      ?auto_171413 - BLOCK
    )
    :vars
    (
      ?auto_171415 - BLOCK
      ?auto_171414 - BLOCK
      ?auto_171417 - BLOCK
      ?auto_171416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171415 ?auto_171413 ) ( ON-TABLE ?auto_171410 ) ( ON ?auto_171411 ?auto_171410 ) ( ON ?auto_171412 ?auto_171411 ) ( ON ?auto_171413 ?auto_171412 ) ( not ( = ?auto_171410 ?auto_171411 ) ) ( not ( = ?auto_171410 ?auto_171412 ) ) ( not ( = ?auto_171410 ?auto_171413 ) ) ( not ( = ?auto_171410 ?auto_171415 ) ) ( not ( = ?auto_171411 ?auto_171412 ) ) ( not ( = ?auto_171411 ?auto_171413 ) ) ( not ( = ?auto_171411 ?auto_171415 ) ) ( not ( = ?auto_171412 ?auto_171413 ) ) ( not ( = ?auto_171412 ?auto_171415 ) ) ( not ( = ?auto_171413 ?auto_171415 ) ) ( not ( = ?auto_171410 ?auto_171414 ) ) ( not ( = ?auto_171410 ?auto_171417 ) ) ( not ( = ?auto_171411 ?auto_171414 ) ) ( not ( = ?auto_171411 ?auto_171417 ) ) ( not ( = ?auto_171412 ?auto_171414 ) ) ( not ( = ?auto_171412 ?auto_171417 ) ) ( not ( = ?auto_171413 ?auto_171414 ) ) ( not ( = ?auto_171413 ?auto_171417 ) ) ( not ( = ?auto_171415 ?auto_171414 ) ) ( not ( = ?auto_171415 ?auto_171417 ) ) ( not ( = ?auto_171414 ?auto_171417 ) ) ( ON ?auto_171414 ?auto_171415 ) ( CLEAR ?auto_171416 ) ( ON-TABLE ?auto_171416 ) ( not ( = ?auto_171416 ?auto_171417 ) ) ( not ( = ?auto_171410 ?auto_171416 ) ) ( not ( = ?auto_171411 ?auto_171416 ) ) ( not ( = ?auto_171412 ?auto_171416 ) ) ( not ( = ?auto_171413 ?auto_171416 ) ) ( not ( = ?auto_171415 ?auto_171416 ) ) ( not ( = ?auto_171414 ?auto_171416 ) ) ( ON ?auto_171417 ?auto_171414 ) ( CLEAR ?auto_171417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171410 ?auto_171411 ?auto_171412 ?auto_171413 ?auto_171415 ?auto_171414 )
      ( MAKE-4PILE ?auto_171410 ?auto_171411 ?auto_171412 ?auto_171413 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171418 - BLOCK
      ?auto_171419 - BLOCK
      ?auto_171420 - BLOCK
      ?auto_171421 - BLOCK
    )
    :vars
    (
      ?auto_171425 - BLOCK
      ?auto_171422 - BLOCK
      ?auto_171424 - BLOCK
      ?auto_171423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171425 ?auto_171421 ) ( ON-TABLE ?auto_171418 ) ( ON ?auto_171419 ?auto_171418 ) ( ON ?auto_171420 ?auto_171419 ) ( ON ?auto_171421 ?auto_171420 ) ( not ( = ?auto_171418 ?auto_171419 ) ) ( not ( = ?auto_171418 ?auto_171420 ) ) ( not ( = ?auto_171418 ?auto_171421 ) ) ( not ( = ?auto_171418 ?auto_171425 ) ) ( not ( = ?auto_171419 ?auto_171420 ) ) ( not ( = ?auto_171419 ?auto_171421 ) ) ( not ( = ?auto_171419 ?auto_171425 ) ) ( not ( = ?auto_171420 ?auto_171421 ) ) ( not ( = ?auto_171420 ?auto_171425 ) ) ( not ( = ?auto_171421 ?auto_171425 ) ) ( not ( = ?auto_171418 ?auto_171422 ) ) ( not ( = ?auto_171418 ?auto_171424 ) ) ( not ( = ?auto_171419 ?auto_171422 ) ) ( not ( = ?auto_171419 ?auto_171424 ) ) ( not ( = ?auto_171420 ?auto_171422 ) ) ( not ( = ?auto_171420 ?auto_171424 ) ) ( not ( = ?auto_171421 ?auto_171422 ) ) ( not ( = ?auto_171421 ?auto_171424 ) ) ( not ( = ?auto_171425 ?auto_171422 ) ) ( not ( = ?auto_171425 ?auto_171424 ) ) ( not ( = ?auto_171422 ?auto_171424 ) ) ( ON ?auto_171422 ?auto_171425 ) ( not ( = ?auto_171423 ?auto_171424 ) ) ( not ( = ?auto_171418 ?auto_171423 ) ) ( not ( = ?auto_171419 ?auto_171423 ) ) ( not ( = ?auto_171420 ?auto_171423 ) ) ( not ( = ?auto_171421 ?auto_171423 ) ) ( not ( = ?auto_171425 ?auto_171423 ) ) ( not ( = ?auto_171422 ?auto_171423 ) ) ( ON ?auto_171424 ?auto_171422 ) ( CLEAR ?auto_171424 ) ( HOLDING ?auto_171423 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171423 )
      ( MAKE-4PILE ?auto_171418 ?auto_171419 ?auto_171420 ?auto_171421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171438 - BLOCK
      ?auto_171439 - BLOCK
      ?auto_171440 - BLOCK
      ?auto_171441 - BLOCK
    )
    :vars
    (
      ?auto_171444 - BLOCK
      ?auto_171443 - BLOCK
      ?auto_171445 - BLOCK
      ?auto_171442 - BLOCK
      ?auto_171446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171444 ?auto_171441 ) ( ON-TABLE ?auto_171438 ) ( ON ?auto_171439 ?auto_171438 ) ( ON ?auto_171440 ?auto_171439 ) ( ON ?auto_171441 ?auto_171440 ) ( not ( = ?auto_171438 ?auto_171439 ) ) ( not ( = ?auto_171438 ?auto_171440 ) ) ( not ( = ?auto_171438 ?auto_171441 ) ) ( not ( = ?auto_171438 ?auto_171444 ) ) ( not ( = ?auto_171439 ?auto_171440 ) ) ( not ( = ?auto_171439 ?auto_171441 ) ) ( not ( = ?auto_171439 ?auto_171444 ) ) ( not ( = ?auto_171440 ?auto_171441 ) ) ( not ( = ?auto_171440 ?auto_171444 ) ) ( not ( = ?auto_171441 ?auto_171444 ) ) ( not ( = ?auto_171438 ?auto_171443 ) ) ( not ( = ?auto_171438 ?auto_171445 ) ) ( not ( = ?auto_171439 ?auto_171443 ) ) ( not ( = ?auto_171439 ?auto_171445 ) ) ( not ( = ?auto_171440 ?auto_171443 ) ) ( not ( = ?auto_171440 ?auto_171445 ) ) ( not ( = ?auto_171441 ?auto_171443 ) ) ( not ( = ?auto_171441 ?auto_171445 ) ) ( not ( = ?auto_171444 ?auto_171443 ) ) ( not ( = ?auto_171444 ?auto_171445 ) ) ( not ( = ?auto_171443 ?auto_171445 ) ) ( ON ?auto_171443 ?auto_171444 ) ( not ( = ?auto_171442 ?auto_171445 ) ) ( not ( = ?auto_171438 ?auto_171442 ) ) ( not ( = ?auto_171439 ?auto_171442 ) ) ( not ( = ?auto_171440 ?auto_171442 ) ) ( not ( = ?auto_171441 ?auto_171442 ) ) ( not ( = ?auto_171444 ?auto_171442 ) ) ( not ( = ?auto_171443 ?auto_171442 ) ) ( ON ?auto_171445 ?auto_171443 ) ( CLEAR ?auto_171445 ) ( ON ?auto_171442 ?auto_171446 ) ( CLEAR ?auto_171442 ) ( HAND-EMPTY ) ( not ( = ?auto_171438 ?auto_171446 ) ) ( not ( = ?auto_171439 ?auto_171446 ) ) ( not ( = ?auto_171440 ?auto_171446 ) ) ( not ( = ?auto_171441 ?auto_171446 ) ) ( not ( = ?auto_171444 ?auto_171446 ) ) ( not ( = ?auto_171443 ?auto_171446 ) ) ( not ( = ?auto_171445 ?auto_171446 ) ) ( not ( = ?auto_171442 ?auto_171446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171442 ?auto_171446 )
      ( MAKE-4PILE ?auto_171438 ?auto_171439 ?auto_171440 ?auto_171441 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171447 - BLOCK
      ?auto_171448 - BLOCK
      ?auto_171449 - BLOCK
      ?auto_171450 - BLOCK
    )
    :vars
    (
      ?auto_171455 - BLOCK
      ?auto_171451 - BLOCK
      ?auto_171454 - BLOCK
      ?auto_171452 - BLOCK
      ?auto_171453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171455 ?auto_171450 ) ( ON-TABLE ?auto_171447 ) ( ON ?auto_171448 ?auto_171447 ) ( ON ?auto_171449 ?auto_171448 ) ( ON ?auto_171450 ?auto_171449 ) ( not ( = ?auto_171447 ?auto_171448 ) ) ( not ( = ?auto_171447 ?auto_171449 ) ) ( not ( = ?auto_171447 ?auto_171450 ) ) ( not ( = ?auto_171447 ?auto_171455 ) ) ( not ( = ?auto_171448 ?auto_171449 ) ) ( not ( = ?auto_171448 ?auto_171450 ) ) ( not ( = ?auto_171448 ?auto_171455 ) ) ( not ( = ?auto_171449 ?auto_171450 ) ) ( not ( = ?auto_171449 ?auto_171455 ) ) ( not ( = ?auto_171450 ?auto_171455 ) ) ( not ( = ?auto_171447 ?auto_171451 ) ) ( not ( = ?auto_171447 ?auto_171454 ) ) ( not ( = ?auto_171448 ?auto_171451 ) ) ( not ( = ?auto_171448 ?auto_171454 ) ) ( not ( = ?auto_171449 ?auto_171451 ) ) ( not ( = ?auto_171449 ?auto_171454 ) ) ( not ( = ?auto_171450 ?auto_171451 ) ) ( not ( = ?auto_171450 ?auto_171454 ) ) ( not ( = ?auto_171455 ?auto_171451 ) ) ( not ( = ?auto_171455 ?auto_171454 ) ) ( not ( = ?auto_171451 ?auto_171454 ) ) ( ON ?auto_171451 ?auto_171455 ) ( not ( = ?auto_171452 ?auto_171454 ) ) ( not ( = ?auto_171447 ?auto_171452 ) ) ( not ( = ?auto_171448 ?auto_171452 ) ) ( not ( = ?auto_171449 ?auto_171452 ) ) ( not ( = ?auto_171450 ?auto_171452 ) ) ( not ( = ?auto_171455 ?auto_171452 ) ) ( not ( = ?auto_171451 ?auto_171452 ) ) ( ON ?auto_171452 ?auto_171453 ) ( CLEAR ?auto_171452 ) ( not ( = ?auto_171447 ?auto_171453 ) ) ( not ( = ?auto_171448 ?auto_171453 ) ) ( not ( = ?auto_171449 ?auto_171453 ) ) ( not ( = ?auto_171450 ?auto_171453 ) ) ( not ( = ?auto_171455 ?auto_171453 ) ) ( not ( = ?auto_171451 ?auto_171453 ) ) ( not ( = ?auto_171454 ?auto_171453 ) ) ( not ( = ?auto_171452 ?auto_171453 ) ) ( HOLDING ?auto_171454 ) ( CLEAR ?auto_171451 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171447 ?auto_171448 ?auto_171449 ?auto_171450 ?auto_171455 ?auto_171451 ?auto_171454 )
      ( MAKE-4PILE ?auto_171447 ?auto_171448 ?auto_171449 ?auto_171450 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171529 - BLOCK
      ?auto_171530 - BLOCK
      ?auto_171531 - BLOCK
      ?auto_171532 - BLOCK
    )
    :vars
    (
      ?auto_171533 - BLOCK
      ?auto_171534 - BLOCK
      ?auto_171535 - BLOCK
      ?auto_171536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171529 ) ( ON ?auto_171530 ?auto_171529 ) ( not ( = ?auto_171529 ?auto_171530 ) ) ( not ( = ?auto_171529 ?auto_171531 ) ) ( not ( = ?auto_171529 ?auto_171532 ) ) ( not ( = ?auto_171530 ?auto_171531 ) ) ( not ( = ?auto_171530 ?auto_171532 ) ) ( not ( = ?auto_171531 ?auto_171532 ) ) ( ON ?auto_171532 ?auto_171533 ) ( not ( = ?auto_171529 ?auto_171533 ) ) ( not ( = ?auto_171530 ?auto_171533 ) ) ( not ( = ?auto_171531 ?auto_171533 ) ) ( not ( = ?auto_171532 ?auto_171533 ) ) ( CLEAR ?auto_171530 ) ( ON ?auto_171531 ?auto_171532 ) ( CLEAR ?auto_171531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171534 ) ( ON ?auto_171535 ?auto_171534 ) ( ON ?auto_171536 ?auto_171535 ) ( ON ?auto_171533 ?auto_171536 ) ( not ( = ?auto_171534 ?auto_171535 ) ) ( not ( = ?auto_171534 ?auto_171536 ) ) ( not ( = ?auto_171534 ?auto_171533 ) ) ( not ( = ?auto_171534 ?auto_171532 ) ) ( not ( = ?auto_171534 ?auto_171531 ) ) ( not ( = ?auto_171535 ?auto_171536 ) ) ( not ( = ?auto_171535 ?auto_171533 ) ) ( not ( = ?auto_171535 ?auto_171532 ) ) ( not ( = ?auto_171535 ?auto_171531 ) ) ( not ( = ?auto_171536 ?auto_171533 ) ) ( not ( = ?auto_171536 ?auto_171532 ) ) ( not ( = ?auto_171536 ?auto_171531 ) ) ( not ( = ?auto_171529 ?auto_171534 ) ) ( not ( = ?auto_171529 ?auto_171535 ) ) ( not ( = ?auto_171529 ?auto_171536 ) ) ( not ( = ?auto_171530 ?auto_171534 ) ) ( not ( = ?auto_171530 ?auto_171535 ) ) ( not ( = ?auto_171530 ?auto_171536 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171534 ?auto_171535 ?auto_171536 ?auto_171533 ?auto_171532 )
      ( MAKE-4PILE ?auto_171529 ?auto_171530 ?auto_171531 ?auto_171532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171537 - BLOCK
      ?auto_171538 - BLOCK
      ?auto_171539 - BLOCK
      ?auto_171540 - BLOCK
    )
    :vars
    (
      ?auto_171543 - BLOCK
      ?auto_171542 - BLOCK
      ?auto_171541 - BLOCK
      ?auto_171544 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171537 ) ( not ( = ?auto_171537 ?auto_171538 ) ) ( not ( = ?auto_171537 ?auto_171539 ) ) ( not ( = ?auto_171537 ?auto_171540 ) ) ( not ( = ?auto_171538 ?auto_171539 ) ) ( not ( = ?auto_171538 ?auto_171540 ) ) ( not ( = ?auto_171539 ?auto_171540 ) ) ( ON ?auto_171540 ?auto_171543 ) ( not ( = ?auto_171537 ?auto_171543 ) ) ( not ( = ?auto_171538 ?auto_171543 ) ) ( not ( = ?auto_171539 ?auto_171543 ) ) ( not ( = ?auto_171540 ?auto_171543 ) ) ( ON ?auto_171539 ?auto_171540 ) ( CLEAR ?auto_171539 ) ( ON-TABLE ?auto_171542 ) ( ON ?auto_171541 ?auto_171542 ) ( ON ?auto_171544 ?auto_171541 ) ( ON ?auto_171543 ?auto_171544 ) ( not ( = ?auto_171542 ?auto_171541 ) ) ( not ( = ?auto_171542 ?auto_171544 ) ) ( not ( = ?auto_171542 ?auto_171543 ) ) ( not ( = ?auto_171542 ?auto_171540 ) ) ( not ( = ?auto_171542 ?auto_171539 ) ) ( not ( = ?auto_171541 ?auto_171544 ) ) ( not ( = ?auto_171541 ?auto_171543 ) ) ( not ( = ?auto_171541 ?auto_171540 ) ) ( not ( = ?auto_171541 ?auto_171539 ) ) ( not ( = ?auto_171544 ?auto_171543 ) ) ( not ( = ?auto_171544 ?auto_171540 ) ) ( not ( = ?auto_171544 ?auto_171539 ) ) ( not ( = ?auto_171537 ?auto_171542 ) ) ( not ( = ?auto_171537 ?auto_171541 ) ) ( not ( = ?auto_171537 ?auto_171544 ) ) ( not ( = ?auto_171538 ?auto_171542 ) ) ( not ( = ?auto_171538 ?auto_171541 ) ) ( not ( = ?auto_171538 ?auto_171544 ) ) ( HOLDING ?auto_171538 ) ( CLEAR ?auto_171537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171537 ?auto_171538 )
      ( MAKE-4PILE ?auto_171537 ?auto_171538 ?auto_171539 ?auto_171540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171545 - BLOCK
      ?auto_171546 - BLOCK
      ?auto_171547 - BLOCK
      ?auto_171548 - BLOCK
    )
    :vars
    (
      ?auto_171550 - BLOCK
      ?auto_171552 - BLOCK
      ?auto_171551 - BLOCK
      ?auto_171549 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171545 ) ( not ( = ?auto_171545 ?auto_171546 ) ) ( not ( = ?auto_171545 ?auto_171547 ) ) ( not ( = ?auto_171545 ?auto_171548 ) ) ( not ( = ?auto_171546 ?auto_171547 ) ) ( not ( = ?auto_171546 ?auto_171548 ) ) ( not ( = ?auto_171547 ?auto_171548 ) ) ( ON ?auto_171548 ?auto_171550 ) ( not ( = ?auto_171545 ?auto_171550 ) ) ( not ( = ?auto_171546 ?auto_171550 ) ) ( not ( = ?auto_171547 ?auto_171550 ) ) ( not ( = ?auto_171548 ?auto_171550 ) ) ( ON ?auto_171547 ?auto_171548 ) ( ON-TABLE ?auto_171552 ) ( ON ?auto_171551 ?auto_171552 ) ( ON ?auto_171549 ?auto_171551 ) ( ON ?auto_171550 ?auto_171549 ) ( not ( = ?auto_171552 ?auto_171551 ) ) ( not ( = ?auto_171552 ?auto_171549 ) ) ( not ( = ?auto_171552 ?auto_171550 ) ) ( not ( = ?auto_171552 ?auto_171548 ) ) ( not ( = ?auto_171552 ?auto_171547 ) ) ( not ( = ?auto_171551 ?auto_171549 ) ) ( not ( = ?auto_171551 ?auto_171550 ) ) ( not ( = ?auto_171551 ?auto_171548 ) ) ( not ( = ?auto_171551 ?auto_171547 ) ) ( not ( = ?auto_171549 ?auto_171550 ) ) ( not ( = ?auto_171549 ?auto_171548 ) ) ( not ( = ?auto_171549 ?auto_171547 ) ) ( not ( = ?auto_171545 ?auto_171552 ) ) ( not ( = ?auto_171545 ?auto_171551 ) ) ( not ( = ?auto_171545 ?auto_171549 ) ) ( not ( = ?auto_171546 ?auto_171552 ) ) ( not ( = ?auto_171546 ?auto_171551 ) ) ( not ( = ?auto_171546 ?auto_171549 ) ) ( CLEAR ?auto_171545 ) ( ON ?auto_171546 ?auto_171547 ) ( CLEAR ?auto_171546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171552 ?auto_171551 ?auto_171549 ?auto_171550 ?auto_171548 ?auto_171547 )
      ( MAKE-4PILE ?auto_171545 ?auto_171546 ?auto_171547 ?auto_171548 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171553 - BLOCK
      ?auto_171554 - BLOCK
      ?auto_171555 - BLOCK
      ?auto_171556 - BLOCK
    )
    :vars
    (
      ?auto_171557 - BLOCK
      ?auto_171558 - BLOCK
      ?auto_171559 - BLOCK
      ?auto_171560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171553 ?auto_171554 ) ) ( not ( = ?auto_171553 ?auto_171555 ) ) ( not ( = ?auto_171553 ?auto_171556 ) ) ( not ( = ?auto_171554 ?auto_171555 ) ) ( not ( = ?auto_171554 ?auto_171556 ) ) ( not ( = ?auto_171555 ?auto_171556 ) ) ( ON ?auto_171556 ?auto_171557 ) ( not ( = ?auto_171553 ?auto_171557 ) ) ( not ( = ?auto_171554 ?auto_171557 ) ) ( not ( = ?auto_171555 ?auto_171557 ) ) ( not ( = ?auto_171556 ?auto_171557 ) ) ( ON ?auto_171555 ?auto_171556 ) ( ON-TABLE ?auto_171558 ) ( ON ?auto_171559 ?auto_171558 ) ( ON ?auto_171560 ?auto_171559 ) ( ON ?auto_171557 ?auto_171560 ) ( not ( = ?auto_171558 ?auto_171559 ) ) ( not ( = ?auto_171558 ?auto_171560 ) ) ( not ( = ?auto_171558 ?auto_171557 ) ) ( not ( = ?auto_171558 ?auto_171556 ) ) ( not ( = ?auto_171558 ?auto_171555 ) ) ( not ( = ?auto_171559 ?auto_171560 ) ) ( not ( = ?auto_171559 ?auto_171557 ) ) ( not ( = ?auto_171559 ?auto_171556 ) ) ( not ( = ?auto_171559 ?auto_171555 ) ) ( not ( = ?auto_171560 ?auto_171557 ) ) ( not ( = ?auto_171560 ?auto_171556 ) ) ( not ( = ?auto_171560 ?auto_171555 ) ) ( not ( = ?auto_171553 ?auto_171558 ) ) ( not ( = ?auto_171553 ?auto_171559 ) ) ( not ( = ?auto_171553 ?auto_171560 ) ) ( not ( = ?auto_171554 ?auto_171558 ) ) ( not ( = ?auto_171554 ?auto_171559 ) ) ( not ( = ?auto_171554 ?auto_171560 ) ) ( ON ?auto_171554 ?auto_171555 ) ( CLEAR ?auto_171554 ) ( HOLDING ?auto_171553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171553 )
      ( MAKE-4PILE ?auto_171553 ?auto_171554 ?auto_171555 ?auto_171556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171561 - BLOCK
      ?auto_171562 - BLOCK
      ?auto_171563 - BLOCK
      ?auto_171564 - BLOCK
    )
    :vars
    (
      ?auto_171565 - BLOCK
      ?auto_171566 - BLOCK
      ?auto_171567 - BLOCK
      ?auto_171568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171561 ?auto_171562 ) ) ( not ( = ?auto_171561 ?auto_171563 ) ) ( not ( = ?auto_171561 ?auto_171564 ) ) ( not ( = ?auto_171562 ?auto_171563 ) ) ( not ( = ?auto_171562 ?auto_171564 ) ) ( not ( = ?auto_171563 ?auto_171564 ) ) ( ON ?auto_171564 ?auto_171565 ) ( not ( = ?auto_171561 ?auto_171565 ) ) ( not ( = ?auto_171562 ?auto_171565 ) ) ( not ( = ?auto_171563 ?auto_171565 ) ) ( not ( = ?auto_171564 ?auto_171565 ) ) ( ON ?auto_171563 ?auto_171564 ) ( ON-TABLE ?auto_171566 ) ( ON ?auto_171567 ?auto_171566 ) ( ON ?auto_171568 ?auto_171567 ) ( ON ?auto_171565 ?auto_171568 ) ( not ( = ?auto_171566 ?auto_171567 ) ) ( not ( = ?auto_171566 ?auto_171568 ) ) ( not ( = ?auto_171566 ?auto_171565 ) ) ( not ( = ?auto_171566 ?auto_171564 ) ) ( not ( = ?auto_171566 ?auto_171563 ) ) ( not ( = ?auto_171567 ?auto_171568 ) ) ( not ( = ?auto_171567 ?auto_171565 ) ) ( not ( = ?auto_171567 ?auto_171564 ) ) ( not ( = ?auto_171567 ?auto_171563 ) ) ( not ( = ?auto_171568 ?auto_171565 ) ) ( not ( = ?auto_171568 ?auto_171564 ) ) ( not ( = ?auto_171568 ?auto_171563 ) ) ( not ( = ?auto_171561 ?auto_171566 ) ) ( not ( = ?auto_171561 ?auto_171567 ) ) ( not ( = ?auto_171561 ?auto_171568 ) ) ( not ( = ?auto_171562 ?auto_171566 ) ) ( not ( = ?auto_171562 ?auto_171567 ) ) ( not ( = ?auto_171562 ?auto_171568 ) ) ( ON ?auto_171562 ?auto_171563 ) ( ON ?auto_171561 ?auto_171562 ) ( CLEAR ?auto_171561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171566 ?auto_171567 ?auto_171568 ?auto_171565 ?auto_171564 ?auto_171563 ?auto_171562 )
      ( MAKE-4PILE ?auto_171561 ?auto_171562 ?auto_171563 ?auto_171564 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171573 - BLOCK
      ?auto_171574 - BLOCK
      ?auto_171575 - BLOCK
      ?auto_171576 - BLOCK
    )
    :vars
    (
      ?auto_171580 - BLOCK
      ?auto_171579 - BLOCK
      ?auto_171578 - BLOCK
      ?auto_171577 - BLOCK
      ?auto_171581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171573 ?auto_171574 ) ) ( not ( = ?auto_171573 ?auto_171575 ) ) ( not ( = ?auto_171573 ?auto_171576 ) ) ( not ( = ?auto_171574 ?auto_171575 ) ) ( not ( = ?auto_171574 ?auto_171576 ) ) ( not ( = ?auto_171575 ?auto_171576 ) ) ( ON ?auto_171576 ?auto_171580 ) ( not ( = ?auto_171573 ?auto_171580 ) ) ( not ( = ?auto_171574 ?auto_171580 ) ) ( not ( = ?auto_171575 ?auto_171580 ) ) ( not ( = ?auto_171576 ?auto_171580 ) ) ( ON ?auto_171575 ?auto_171576 ) ( ON-TABLE ?auto_171579 ) ( ON ?auto_171578 ?auto_171579 ) ( ON ?auto_171577 ?auto_171578 ) ( ON ?auto_171580 ?auto_171577 ) ( not ( = ?auto_171579 ?auto_171578 ) ) ( not ( = ?auto_171579 ?auto_171577 ) ) ( not ( = ?auto_171579 ?auto_171580 ) ) ( not ( = ?auto_171579 ?auto_171576 ) ) ( not ( = ?auto_171579 ?auto_171575 ) ) ( not ( = ?auto_171578 ?auto_171577 ) ) ( not ( = ?auto_171578 ?auto_171580 ) ) ( not ( = ?auto_171578 ?auto_171576 ) ) ( not ( = ?auto_171578 ?auto_171575 ) ) ( not ( = ?auto_171577 ?auto_171580 ) ) ( not ( = ?auto_171577 ?auto_171576 ) ) ( not ( = ?auto_171577 ?auto_171575 ) ) ( not ( = ?auto_171573 ?auto_171579 ) ) ( not ( = ?auto_171573 ?auto_171578 ) ) ( not ( = ?auto_171573 ?auto_171577 ) ) ( not ( = ?auto_171574 ?auto_171579 ) ) ( not ( = ?auto_171574 ?auto_171578 ) ) ( not ( = ?auto_171574 ?auto_171577 ) ) ( ON ?auto_171574 ?auto_171575 ) ( CLEAR ?auto_171574 ) ( ON ?auto_171573 ?auto_171581 ) ( CLEAR ?auto_171573 ) ( HAND-EMPTY ) ( not ( = ?auto_171573 ?auto_171581 ) ) ( not ( = ?auto_171574 ?auto_171581 ) ) ( not ( = ?auto_171575 ?auto_171581 ) ) ( not ( = ?auto_171576 ?auto_171581 ) ) ( not ( = ?auto_171580 ?auto_171581 ) ) ( not ( = ?auto_171579 ?auto_171581 ) ) ( not ( = ?auto_171578 ?auto_171581 ) ) ( not ( = ?auto_171577 ?auto_171581 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171573 ?auto_171581 )
      ( MAKE-4PILE ?auto_171573 ?auto_171574 ?auto_171575 ?auto_171576 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171582 - BLOCK
      ?auto_171583 - BLOCK
      ?auto_171584 - BLOCK
      ?auto_171585 - BLOCK
    )
    :vars
    (
      ?auto_171589 - BLOCK
      ?auto_171590 - BLOCK
      ?auto_171586 - BLOCK
      ?auto_171588 - BLOCK
      ?auto_171587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171582 ?auto_171583 ) ) ( not ( = ?auto_171582 ?auto_171584 ) ) ( not ( = ?auto_171582 ?auto_171585 ) ) ( not ( = ?auto_171583 ?auto_171584 ) ) ( not ( = ?auto_171583 ?auto_171585 ) ) ( not ( = ?auto_171584 ?auto_171585 ) ) ( ON ?auto_171585 ?auto_171589 ) ( not ( = ?auto_171582 ?auto_171589 ) ) ( not ( = ?auto_171583 ?auto_171589 ) ) ( not ( = ?auto_171584 ?auto_171589 ) ) ( not ( = ?auto_171585 ?auto_171589 ) ) ( ON ?auto_171584 ?auto_171585 ) ( ON-TABLE ?auto_171590 ) ( ON ?auto_171586 ?auto_171590 ) ( ON ?auto_171588 ?auto_171586 ) ( ON ?auto_171589 ?auto_171588 ) ( not ( = ?auto_171590 ?auto_171586 ) ) ( not ( = ?auto_171590 ?auto_171588 ) ) ( not ( = ?auto_171590 ?auto_171589 ) ) ( not ( = ?auto_171590 ?auto_171585 ) ) ( not ( = ?auto_171590 ?auto_171584 ) ) ( not ( = ?auto_171586 ?auto_171588 ) ) ( not ( = ?auto_171586 ?auto_171589 ) ) ( not ( = ?auto_171586 ?auto_171585 ) ) ( not ( = ?auto_171586 ?auto_171584 ) ) ( not ( = ?auto_171588 ?auto_171589 ) ) ( not ( = ?auto_171588 ?auto_171585 ) ) ( not ( = ?auto_171588 ?auto_171584 ) ) ( not ( = ?auto_171582 ?auto_171590 ) ) ( not ( = ?auto_171582 ?auto_171586 ) ) ( not ( = ?auto_171582 ?auto_171588 ) ) ( not ( = ?auto_171583 ?auto_171590 ) ) ( not ( = ?auto_171583 ?auto_171586 ) ) ( not ( = ?auto_171583 ?auto_171588 ) ) ( ON ?auto_171582 ?auto_171587 ) ( CLEAR ?auto_171582 ) ( not ( = ?auto_171582 ?auto_171587 ) ) ( not ( = ?auto_171583 ?auto_171587 ) ) ( not ( = ?auto_171584 ?auto_171587 ) ) ( not ( = ?auto_171585 ?auto_171587 ) ) ( not ( = ?auto_171589 ?auto_171587 ) ) ( not ( = ?auto_171590 ?auto_171587 ) ) ( not ( = ?auto_171586 ?auto_171587 ) ) ( not ( = ?auto_171588 ?auto_171587 ) ) ( HOLDING ?auto_171583 ) ( CLEAR ?auto_171584 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171590 ?auto_171586 ?auto_171588 ?auto_171589 ?auto_171585 ?auto_171584 ?auto_171583 )
      ( MAKE-4PILE ?auto_171582 ?auto_171583 ?auto_171584 ?auto_171585 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171591 - BLOCK
      ?auto_171592 - BLOCK
      ?auto_171593 - BLOCK
      ?auto_171594 - BLOCK
    )
    :vars
    (
      ?auto_171595 - BLOCK
      ?auto_171597 - BLOCK
      ?auto_171598 - BLOCK
      ?auto_171596 - BLOCK
      ?auto_171599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171591 ?auto_171592 ) ) ( not ( = ?auto_171591 ?auto_171593 ) ) ( not ( = ?auto_171591 ?auto_171594 ) ) ( not ( = ?auto_171592 ?auto_171593 ) ) ( not ( = ?auto_171592 ?auto_171594 ) ) ( not ( = ?auto_171593 ?auto_171594 ) ) ( ON ?auto_171594 ?auto_171595 ) ( not ( = ?auto_171591 ?auto_171595 ) ) ( not ( = ?auto_171592 ?auto_171595 ) ) ( not ( = ?auto_171593 ?auto_171595 ) ) ( not ( = ?auto_171594 ?auto_171595 ) ) ( ON ?auto_171593 ?auto_171594 ) ( ON-TABLE ?auto_171597 ) ( ON ?auto_171598 ?auto_171597 ) ( ON ?auto_171596 ?auto_171598 ) ( ON ?auto_171595 ?auto_171596 ) ( not ( = ?auto_171597 ?auto_171598 ) ) ( not ( = ?auto_171597 ?auto_171596 ) ) ( not ( = ?auto_171597 ?auto_171595 ) ) ( not ( = ?auto_171597 ?auto_171594 ) ) ( not ( = ?auto_171597 ?auto_171593 ) ) ( not ( = ?auto_171598 ?auto_171596 ) ) ( not ( = ?auto_171598 ?auto_171595 ) ) ( not ( = ?auto_171598 ?auto_171594 ) ) ( not ( = ?auto_171598 ?auto_171593 ) ) ( not ( = ?auto_171596 ?auto_171595 ) ) ( not ( = ?auto_171596 ?auto_171594 ) ) ( not ( = ?auto_171596 ?auto_171593 ) ) ( not ( = ?auto_171591 ?auto_171597 ) ) ( not ( = ?auto_171591 ?auto_171598 ) ) ( not ( = ?auto_171591 ?auto_171596 ) ) ( not ( = ?auto_171592 ?auto_171597 ) ) ( not ( = ?auto_171592 ?auto_171598 ) ) ( not ( = ?auto_171592 ?auto_171596 ) ) ( ON ?auto_171591 ?auto_171599 ) ( not ( = ?auto_171591 ?auto_171599 ) ) ( not ( = ?auto_171592 ?auto_171599 ) ) ( not ( = ?auto_171593 ?auto_171599 ) ) ( not ( = ?auto_171594 ?auto_171599 ) ) ( not ( = ?auto_171595 ?auto_171599 ) ) ( not ( = ?auto_171597 ?auto_171599 ) ) ( not ( = ?auto_171598 ?auto_171599 ) ) ( not ( = ?auto_171596 ?auto_171599 ) ) ( CLEAR ?auto_171593 ) ( ON ?auto_171592 ?auto_171591 ) ( CLEAR ?auto_171592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171599 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171599 ?auto_171591 )
      ( MAKE-4PILE ?auto_171591 ?auto_171592 ?auto_171593 ?auto_171594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171600 - BLOCK
      ?auto_171601 - BLOCK
      ?auto_171602 - BLOCK
      ?auto_171603 - BLOCK
    )
    :vars
    (
      ?auto_171606 - BLOCK
      ?auto_171605 - BLOCK
      ?auto_171604 - BLOCK
      ?auto_171608 - BLOCK
      ?auto_171607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171600 ?auto_171601 ) ) ( not ( = ?auto_171600 ?auto_171602 ) ) ( not ( = ?auto_171600 ?auto_171603 ) ) ( not ( = ?auto_171601 ?auto_171602 ) ) ( not ( = ?auto_171601 ?auto_171603 ) ) ( not ( = ?auto_171602 ?auto_171603 ) ) ( ON ?auto_171603 ?auto_171606 ) ( not ( = ?auto_171600 ?auto_171606 ) ) ( not ( = ?auto_171601 ?auto_171606 ) ) ( not ( = ?auto_171602 ?auto_171606 ) ) ( not ( = ?auto_171603 ?auto_171606 ) ) ( ON-TABLE ?auto_171605 ) ( ON ?auto_171604 ?auto_171605 ) ( ON ?auto_171608 ?auto_171604 ) ( ON ?auto_171606 ?auto_171608 ) ( not ( = ?auto_171605 ?auto_171604 ) ) ( not ( = ?auto_171605 ?auto_171608 ) ) ( not ( = ?auto_171605 ?auto_171606 ) ) ( not ( = ?auto_171605 ?auto_171603 ) ) ( not ( = ?auto_171605 ?auto_171602 ) ) ( not ( = ?auto_171604 ?auto_171608 ) ) ( not ( = ?auto_171604 ?auto_171606 ) ) ( not ( = ?auto_171604 ?auto_171603 ) ) ( not ( = ?auto_171604 ?auto_171602 ) ) ( not ( = ?auto_171608 ?auto_171606 ) ) ( not ( = ?auto_171608 ?auto_171603 ) ) ( not ( = ?auto_171608 ?auto_171602 ) ) ( not ( = ?auto_171600 ?auto_171605 ) ) ( not ( = ?auto_171600 ?auto_171604 ) ) ( not ( = ?auto_171600 ?auto_171608 ) ) ( not ( = ?auto_171601 ?auto_171605 ) ) ( not ( = ?auto_171601 ?auto_171604 ) ) ( not ( = ?auto_171601 ?auto_171608 ) ) ( ON ?auto_171600 ?auto_171607 ) ( not ( = ?auto_171600 ?auto_171607 ) ) ( not ( = ?auto_171601 ?auto_171607 ) ) ( not ( = ?auto_171602 ?auto_171607 ) ) ( not ( = ?auto_171603 ?auto_171607 ) ) ( not ( = ?auto_171606 ?auto_171607 ) ) ( not ( = ?auto_171605 ?auto_171607 ) ) ( not ( = ?auto_171604 ?auto_171607 ) ) ( not ( = ?auto_171608 ?auto_171607 ) ) ( ON ?auto_171601 ?auto_171600 ) ( CLEAR ?auto_171601 ) ( ON-TABLE ?auto_171607 ) ( HOLDING ?auto_171602 ) ( CLEAR ?auto_171603 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171605 ?auto_171604 ?auto_171608 ?auto_171606 ?auto_171603 ?auto_171602 )
      ( MAKE-4PILE ?auto_171600 ?auto_171601 ?auto_171602 ?auto_171603 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171609 - BLOCK
      ?auto_171610 - BLOCK
      ?auto_171611 - BLOCK
      ?auto_171612 - BLOCK
    )
    :vars
    (
      ?auto_171613 - BLOCK
      ?auto_171617 - BLOCK
      ?auto_171616 - BLOCK
      ?auto_171614 - BLOCK
      ?auto_171615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171609 ?auto_171610 ) ) ( not ( = ?auto_171609 ?auto_171611 ) ) ( not ( = ?auto_171609 ?auto_171612 ) ) ( not ( = ?auto_171610 ?auto_171611 ) ) ( not ( = ?auto_171610 ?auto_171612 ) ) ( not ( = ?auto_171611 ?auto_171612 ) ) ( ON ?auto_171612 ?auto_171613 ) ( not ( = ?auto_171609 ?auto_171613 ) ) ( not ( = ?auto_171610 ?auto_171613 ) ) ( not ( = ?auto_171611 ?auto_171613 ) ) ( not ( = ?auto_171612 ?auto_171613 ) ) ( ON-TABLE ?auto_171617 ) ( ON ?auto_171616 ?auto_171617 ) ( ON ?auto_171614 ?auto_171616 ) ( ON ?auto_171613 ?auto_171614 ) ( not ( = ?auto_171617 ?auto_171616 ) ) ( not ( = ?auto_171617 ?auto_171614 ) ) ( not ( = ?auto_171617 ?auto_171613 ) ) ( not ( = ?auto_171617 ?auto_171612 ) ) ( not ( = ?auto_171617 ?auto_171611 ) ) ( not ( = ?auto_171616 ?auto_171614 ) ) ( not ( = ?auto_171616 ?auto_171613 ) ) ( not ( = ?auto_171616 ?auto_171612 ) ) ( not ( = ?auto_171616 ?auto_171611 ) ) ( not ( = ?auto_171614 ?auto_171613 ) ) ( not ( = ?auto_171614 ?auto_171612 ) ) ( not ( = ?auto_171614 ?auto_171611 ) ) ( not ( = ?auto_171609 ?auto_171617 ) ) ( not ( = ?auto_171609 ?auto_171616 ) ) ( not ( = ?auto_171609 ?auto_171614 ) ) ( not ( = ?auto_171610 ?auto_171617 ) ) ( not ( = ?auto_171610 ?auto_171616 ) ) ( not ( = ?auto_171610 ?auto_171614 ) ) ( ON ?auto_171609 ?auto_171615 ) ( not ( = ?auto_171609 ?auto_171615 ) ) ( not ( = ?auto_171610 ?auto_171615 ) ) ( not ( = ?auto_171611 ?auto_171615 ) ) ( not ( = ?auto_171612 ?auto_171615 ) ) ( not ( = ?auto_171613 ?auto_171615 ) ) ( not ( = ?auto_171617 ?auto_171615 ) ) ( not ( = ?auto_171616 ?auto_171615 ) ) ( not ( = ?auto_171614 ?auto_171615 ) ) ( ON ?auto_171610 ?auto_171609 ) ( ON-TABLE ?auto_171615 ) ( CLEAR ?auto_171612 ) ( ON ?auto_171611 ?auto_171610 ) ( CLEAR ?auto_171611 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171615 ?auto_171609 ?auto_171610 )
      ( MAKE-4PILE ?auto_171609 ?auto_171610 ?auto_171611 ?auto_171612 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171618 - BLOCK
      ?auto_171619 - BLOCK
      ?auto_171620 - BLOCK
      ?auto_171621 - BLOCK
    )
    :vars
    (
      ?auto_171626 - BLOCK
      ?auto_171622 - BLOCK
      ?auto_171623 - BLOCK
      ?auto_171625 - BLOCK
      ?auto_171624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171618 ?auto_171619 ) ) ( not ( = ?auto_171618 ?auto_171620 ) ) ( not ( = ?auto_171618 ?auto_171621 ) ) ( not ( = ?auto_171619 ?auto_171620 ) ) ( not ( = ?auto_171619 ?auto_171621 ) ) ( not ( = ?auto_171620 ?auto_171621 ) ) ( not ( = ?auto_171618 ?auto_171626 ) ) ( not ( = ?auto_171619 ?auto_171626 ) ) ( not ( = ?auto_171620 ?auto_171626 ) ) ( not ( = ?auto_171621 ?auto_171626 ) ) ( ON-TABLE ?auto_171622 ) ( ON ?auto_171623 ?auto_171622 ) ( ON ?auto_171625 ?auto_171623 ) ( ON ?auto_171626 ?auto_171625 ) ( not ( = ?auto_171622 ?auto_171623 ) ) ( not ( = ?auto_171622 ?auto_171625 ) ) ( not ( = ?auto_171622 ?auto_171626 ) ) ( not ( = ?auto_171622 ?auto_171621 ) ) ( not ( = ?auto_171622 ?auto_171620 ) ) ( not ( = ?auto_171623 ?auto_171625 ) ) ( not ( = ?auto_171623 ?auto_171626 ) ) ( not ( = ?auto_171623 ?auto_171621 ) ) ( not ( = ?auto_171623 ?auto_171620 ) ) ( not ( = ?auto_171625 ?auto_171626 ) ) ( not ( = ?auto_171625 ?auto_171621 ) ) ( not ( = ?auto_171625 ?auto_171620 ) ) ( not ( = ?auto_171618 ?auto_171622 ) ) ( not ( = ?auto_171618 ?auto_171623 ) ) ( not ( = ?auto_171618 ?auto_171625 ) ) ( not ( = ?auto_171619 ?auto_171622 ) ) ( not ( = ?auto_171619 ?auto_171623 ) ) ( not ( = ?auto_171619 ?auto_171625 ) ) ( ON ?auto_171618 ?auto_171624 ) ( not ( = ?auto_171618 ?auto_171624 ) ) ( not ( = ?auto_171619 ?auto_171624 ) ) ( not ( = ?auto_171620 ?auto_171624 ) ) ( not ( = ?auto_171621 ?auto_171624 ) ) ( not ( = ?auto_171626 ?auto_171624 ) ) ( not ( = ?auto_171622 ?auto_171624 ) ) ( not ( = ?auto_171623 ?auto_171624 ) ) ( not ( = ?auto_171625 ?auto_171624 ) ) ( ON ?auto_171619 ?auto_171618 ) ( ON-TABLE ?auto_171624 ) ( ON ?auto_171620 ?auto_171619 ) ( CLEAR ?auto_171620 ) ( HOLDING ?auto_171621 ) ( CLEAR ?auto_171626 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171622 ?auto_171623 ?auto_171625 ?auto_171626 ?auto_171621 )
      ( MAKE-4PILE ?auto_171618 ?auto_171619 ?auto_171620 ?auto_171621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171627 - BLOCK
      ?auto_171628 - BLOCK
      ?auto_171629 - BLOCK
      ?auto_171630 - BLOCK
    )
    :vars
    (
      ?auto_171634 - BLOCK
      ?auto_171632 - BLOCK
      ?auto_171635 - BLOCK
      ?auto_171631 - BLOCK
      ?auto_171633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171627 ?auto_171628 ) ) ( not ( = ?auto_171627 ?auto_171629 ) ) ( not ( = ?auto_171627 ?auto_171630 ) ) ( not ( = ?auto_171628 ?auto_171629 ) ) ( not ( = ?auto_171628 ?auto_171630 ) ) ( not ( = ?auto_171629 ?auto_171630 ) ) ( not ( = ?auto_171627 ?auto_171634 ) ) ( not ( = ?auto_171628 ?auto_171634 ) ) ( not ( = ?auto_171629 ?auto_171634 ) ) ( not ( = ?auto_171630 ?auto_171634 ) ) ( ON-TABLE ?auto_171632 ) ( ON ?auto_171635 ?auto_171632 ) ( ON ?auto_171631 ?auto_171635 ) ( ON ?auto_171634 ?auto_171631 ) ( not ( = ?auto_171632 ?auto_171635 ) ) ( not ( = ?auto_171632 ?auto_171631 ) ) ( not ( = ?auto_171632 ?auto_171634 ) ) ( not ( = ?auto_171632 ?auto_171630 ) ) ( not ( = ?auto_171632 ?auto_171629 ) ) ( not ( = ?auto_171635 ?auto_171631 ) ) ( not ( = ?auto_171635 ?auto_171634 ) ) ( not ( = ?auto_171635 ?auto_171630 ) ) ( not ( = ?auto_171635 ?auto_171629 ) ) ( not ( = ?auto_171631 ?auto_171634 ) ) ( not ( = ?auto_171631 ?auto_171630 ) ) ( not ( = ?auto_171631 ?auto_171629 ) ) ( not ( = ?auto_171627 ?auto_171632 ) ) ( not ( = ?auto_171627 ?auto_171635 ) ) ( not ( = ?auto_171627 ?auto_171631 ) ) ( not ( = ?auto_171628 ?auto_171632 ) ) ( not ( = ?auto_171628 ?auto_171635 ) ) ( not ( = ?auto_171628 ?auto_171631 ) ) ( ON ?auto_171627 ?auto_171633 ) ( not ( = ?auto_171627 ?auto_171633 ) ) ( not ( = ?auto_171628 ?auto_171633 ) ) ( not ( = ?auto_171629 ?auto_171633 ) ) ( not ( = ?auto_171630 ?auto_171633 ) ) ( not ( = ?auto_171634 ?auto_171633 ) ) ( not ( = ?auto_171632 ?auto_171633 ) ) ( not ( = ?auto_171635 ?auto_171633 ) ) ( not ( = ?auto_171631 ?auto_171633 ) ) ( ON ?auto_171628 ?auto_171627 ) ( ON-TABLE ?auto_171633 ) ( ON ?auto_171629 ?auto_171628 ) ( CLEAR ?auto_171634 ) ( ON ?auto_171630 ?auto_171629 ) ( CLEAR ?auto_171630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171633 ?auto_171627 ?auto_171628 ?auto_171629 )
      ( MAKE-4PILE ?auto_171627 ?auto_171628 ?auto_171629 ?auto_171630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171636 - BLOCK
      ?auto_171637 - BLOCK
      ?auto_171638 - BLOCK
      ?auto_171639 - BLOCK
    )
    :vars
    (
      ?auto_171643 - BLOCK
      ?auto_171644 - BLOCK
      ?auto_171641 - BLOCK
      ?auto_171640 - BLOCK
      ?auto_171642 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171636 ?auto_171637 ) ) ( not ( = ?auto_171636 ?auto_171638 ) ) ( not ( = ?auto_171636 ?auto_171639 ) ) ( not ( = ?auto_171637 ?auto_171638 ) ) ( not ( = ?auto_171637 ?auto_171639 ) ) ( not ( = ?auto_171638 ?auto_171639 ) ) ( not ( = ?auto_171636 ?auto_171643 ) ) ( not ( = ?auto_171637 ?auto_171643 ) ) ( not ( = ?auto_171638 ?auto_171643 ) ) ( not ( = ?auto_171639 ?auto_171643 ) ) ( ON-TABLE ?auto_171644 ) ( ON ?auto_171641 ?auto_171644 ) ( ON ?auto_171640 ?auto_171641 ) ( not ( = ?auto_171644 ?auto_171641 ) ) ( not ( = ?auto_171644 ?auto_171640 ) ) ( not ( = ?auto_171644 ?auto_171643 ) ) ( not ( = ?auto_171644 ?auto_171639 ) ) ( not ( = ?auto_171644 ?auto_171638 ) ) ( not ( = ?auto_171641 ?auto_171640 ) ) ( not ( = ?auto_171641 ?auto_171643 ) ) ( not ( = ?auto_171641 ?auto_171639 ) ) ( not ( = ?auto_171641 ?auto_171638 ) ) ( not ( = ?auto_171640 ?auto_171643 ) ) ( not ( = ?auto_171640 ?auto_171639 ) ) ( not ( = ?auto_171640 ?auto_171638 ) ) ( not ( = ?auto_171636 ?auto_171644 ) ) ( not ( = ?auto_171636 ?auto_171641 ) ) ( not ( = ?auto_171636 ?auto_171640 ) ) ( not ( = ?auto_171637 ?auto_171644 ) ) ( not ( = ?auto_171637 ?auto_171641 ) ) ( not ( = ?auto_171637 ?auto_171640 ) ) ( ON ?auto_171636 ?auto_171642 ) ( not ( = ?auto_171636 ?auto_171642 ) ) ( not ( = ?auto_171637 ?auto_171642 ) ) ( not ( = ?auto_171638 ?auto_171642 ) ) ( not ( = ?auto_171639 ?auto_171642 ) ) ( not ( = ?auto_171643 ?auto_171642 ) ) ( not ( = ?auto_171644 ?auto_171642 ) ) ( not ( = ?auto_171641 ?auto_171642 ) ) ( not ( = ?auto_171640 ?auto_171642 ) ) ( ON ?auto_171637 ?auto_171636 ) ( ON-TABLE ?auto_171642 ) ( ON ?auto_171638 ?auto_171637 ) ( ON ?auto_171639 ?auto_171638 ) ( CLEAR ?auto_171639 ) ( HOLDING ?auto_171643 ) ( CLEAR ?auto_171640 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171644 ?auto_171641 ?auto_171640 ?auto_171643 )
      ( MAKE-4PILE ?auto_171636 ?auto_171637 ?auto_171638 ?auto_171639 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171645 - BLOCK
      ?auto_171646 - BLOCK
      ?auto_171647 - BLOCK
      ?auto_171648 - BLOCK
    )
    :vars
    (
      ?auto_171652 - BLOCK
      ?auto_171653 - BLOCK
      ?auto_171651 - BLOCK
      ?auto_171650 - BLOCK
      ?auto_171649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171645 ?auto_171646 ) ) ( not ( = ?auto_171645 ?auto_171647 ) ) ( not ( = ?auto_171645 ?auto_171648 ) ) ( not ( = ?auto_171646 ?auto_171647 ) ) ( not ( = ?auto_171646 ?auto_171648 ) ) ( not ( = ?auto_171647 ?auto_171648 ) ) ( not ( = ?auto_171645 ?auto_171652 ) ) ( not ( = ?auto_171646 ?auto_171652 ) ) ( not ( = ?auto_171647 ?auto_171652 ) ) ( not ( = ?auto_171648 ?auto_171652 ) ) ( ON-TABLE ?auto_171653 ) ( ON ?auto_171651 ?auto_171653 ) ( ON ?auto_171650 ?auto_171651 ) ( not ( = ?auto_171653 ?auto_171651 ) ) ( not ( = ?auto_171653 ?auto_171650 ) ) ( not ( = ?auto_171653 ?auto_171652 ) ) ( not ( = ?auto_171653 ?auto_171648 ) ) ( not ( = ?auto_171653 ?auto_171647 ) ) ( not ( = ?auto_171651 ?auto_171650 ) ) ( not ( = ?auto_171651 ?auto_171652 ) ) ( not ( = ?auto_171651 ?auto_171648 ) ) ( not ( = ?auto_171651 ?auto_171647 ) ) ( not ( = ?auto_171650 ?auto_171652 ) ) ( not ( = ?auto_171650 ?auto_171648 ) ) ( not ( = ?auto_171650 ?auto_171647 ) ) ( not ( = ?auto_171645 ?auto_171653 ) ) ( not ( = ?auto_171645 ?auto_171651 ) ) ( not ( = ?auto_171645 ?auto_171650 ) ) ( not ( = ?auto_171646 ?auto_171653 ) ) ( not ( = ?auto_171646 ?auto_171651 ) ) ( not ( = ?auto_171646 ?auto_171650 ) ) ( ON ?auto_171645 ?auto_171649 ) ( not ( = ?auto_171645 ?auto_171649 ) ) ( not ( = ?auto_171646 ?auto_171649 ) ) ( not ( = ?auto_171647 ?auto_171649 ) ) ( not ( = ?auto_171648 ?auto_171649 ) ) ( not ( = ?auto_171652 ?auto_171649 ) ) ( not ( = ?auto_171653 ?auto_171649 ) ) ( not ( = ?auto_171651 ?auto_171649 ) ) ( not ( = ?auto_171650 ?auto_171649 ) ) ( ON ?auto_171646 ?auto_171645 ) ( ON-TABLE ?auto_171649 ) ( ON ?auto_171647 ?auto_171646 ) ( ON ?auto_171648 ?auto_171647 ) ( CLEAR ?auto_171650 ) ( ON ?auto_171652 ?auto_171648 ) ( CLEAR ?auto_171652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171649 ?auto_171645 ?auto_171646 ?auto_171647 ?auto_171648 )
      ( MAKE-4PILE ?auto_171645 ?auto_171646 ?auto_171647 ?auto_171648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171654 - BLOCK
      ?auto_171655 - BLOCK
      ?auto_171656 - BLOCK
      ?auto_171657 - BLOCK
    )
    :vars
    (
      ?auto_171660 - BLOCK
      ?auto_171662 - BLOCK
      ?auto_171658 - BLOCK
      ?auto_171661 - BLOCK
      ?auto_171659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171654 ?auto_171655 ) ) ( not ( = ?auto_171654 ?auto_171656 ) ) ( not ( = ?auto_171654 ?auto_171657 ) ) ( not ( = ?auto_171655 ?auto_171656 ) ) ( not ( = ?auto_171655 ?auto_171657 ) ) ( not ( = ?auto_171656 ?auto_171657 ) ) ( not ( = ?auto_171654 ?auto_171660 ) ) ( not ( = ?auto_171655 ?auto_171660 ) ) ( not ( = ?auto_171656 ?auto_171660 ) ) ( not ( = ?auto_171657 ?auto_171660 ) ) ( ON-TABLE ?auto_171662 ) ( ON ?auto_171658 ?auto_171662 ) ( not ( = ?auto_171662 ?auto_171658 ) ) ( not ( = ?auto_171662 ?auto_171661 ) ) ( not ( = ?auto_171662 ?auto_171660 ) ) ( not ( = ?auto_171662 ?auto_171657 ) ) ( not ( = ?auto_171662 ?auto_171656 ) ) ( not ( = ?auto_171658 ?auto_171661 ) ) ( not ( = ?auto_171658 ?auto_171660 ) ) ( not ( = ?auto_171658 ?auto_171657 ) ) ( not ( = ?auto_171658 ?auto_171656 ) ) ( not ( = ?auto_171661 ?auto_171660 ) ) ( not ( = ?auto_171661 ?auto_171657 ) ) ( not ( = ?auto_171661 ?auto_171656 ) ) ( not ( = ?auto_171654 ?auto_171662 ) ) ( not ( = ?auto_171654 ?auto_171658 ) ) ( not ( = ?auto_171654 ?auto_171661 ) ) ( not ( = ?auto_171655 ?auto_171662 ) ) ( not ( = ?auto_171655 ?auto_171658 ) ) ( not ( = ?auto_171655 ?auto_171661 ) ) ( ON ?auto_171654 ?auto_171659 ) ( not ( = ?auto_171654 ?auto_171659 ) ) ( not ( = ?auto_171655 ?auto_171659 ) ) ( not ( = ?auto_171656 ?auto_171659 ) ) ( not ( = ?auto_171657 ?auto_171659 ) ) ( not ( = ?auto_171660 ?auto_171659 ) ) ( not ( = ?auto_171662 ?auto_171659 ) ) ( not ( = ?auto_171658 ?auto_171659 ) ) ( not ( = ?auto_171661 ?auto_171659 ) ) ( ON ?auto_171655 ?auto_171654 ) ( ON-TABLE ?auto_171659 ) ( ON ?auto_171656 ?auto_171655 ) ( ON ?auto_171657 ?auto_171656 ) ( ON ?auto_171660 ?auto_171657 ) ( CLEAR ?auto_171660 ) ( HOLDING ?auto_171661 ) ( CLEAR ?auto_171658 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171662 ?auto_171658 ?auto_171661 )
      ( MAKE-4PILE ?auto_171654 ?auto_171655 ?auto_171656 ?auto_171657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171663 - BLOCK
      ?auto_171664 - BLOCK
      ?auto_171665 - BLOCK
      ?auto_171666 - BLOCK
    )
    :vars
    (
      ?auto_171671 - BLOCK
      ?auto_171669 - BLOCK
      ?auto_171670 - BLOCK
      ?auto_171668 - BLOCK
      ?auto_171667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171663 ?auto_171664 ) ) ( not ( = ?auto_171663 ?auto_171665 ) ) ( not ( = ?auto_171663 ?auto_171666 ) ) ( not ( = ?auto_171664 ?auto_171665 ) ) ( not ( = ?auto_171664 ?auto_171666 ) ) ( not ( = ?auto_171665 ?auto_171666 ) ) ( not ( = ?auto_171663 ?auto_171671 ) ) ( not ( = ?auto_171664 ?auto_171671 ) ) ( not ( = ?auto_171665 ?auto_171671 ) ) ( not ( = ?auto_171666 ?auto_171671 ) ) ( ON-TABLE ?auto_171669 ) ( ON ?auto_171670 ?auto_171669 ) ( not ( = ?auto_171669 ?auto_171670 ) ) ( not ( = ?auto_171669 ?auto_171668 ) ) ( not ( = ?auto_171669 ?auto_171671 ) ) ( not ( = ?auto_171669 ?auto_171666 ) ) ( not ( = ?auto_171669 ?auto_171665 ) ) ( not ( = ?auto_171670 ?auto_171668 ) ) ( not ( = ?auto_171670 ?auto_171671 ) ) ( not ( = ?auto_171670 ?auto_171666 ) ) ( not ( = ?auto_171670 ?auto_171665 ) ) ( not ( = ?auto_171668 ?auto_171671 ) ) ( not ( = ?auto_171668 ?auto_171666 ) ) ( not ( = ?auto_171668 ?auto_171665 ) ) ( not ( = ?auto_171663 ?auto_171669 ) ) ( not ( = ?auto_171663 ?auto_171670 ) ) ( not ( = ?auto_171663 ?auto_171668 ) ) ( not ( = ?auto_171664 ?auto_171669 ) ) ( not ( = ?auto_171664 ?auto_171670 ) ) ( not ( = ?auto_171664 ?auto_171668 ) ) ( ON ?auto_171663 ?auto_171667 ) ( not ( = ?auto_171663 ?auto_171667 ) ) ( not ( = ?auto_171664 ?auto_171667 ) ) ( not ( = ?auto_171665 ?auto_171667 ) ) ( not ( = ?auto_171666 ?auto_171667 ) ) ( not ( = ?auto_171671 ?auto_171667 ) ) ( not ( = ?auto_171669 ?auto_171667 ) ) ( not ( = ?auto_171670 ?auto_171667 ) ) ( not ( = ?auto_171668 ?auto_171667 ) ) ( ON ?auto_171664 ?auto_171663 ) ( ON-TABLE ?auto_171667 ) ( ON ?auto_171665 ?auto_171664 ) ( ON ?auto_171666 ?auto_171665 ) ( ON ?auto_171671 ?auto_171666 ) ( CLEAR ?auto_171670 ) ( ON ?auto_171668 ?auto_171671 ) ( CLEAR ?auto_171668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171667 ?auto_171663 ?auto_171664 ?auto_171665 ?auto_171666 ?auto_171671 )
      ( MAKE-4PILE ?auto_171663 ?auto_171664 ?auto_171665 ?auto_171666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171672 - BLOCK
      ?auto_171673 - BLOCK
      ?auto_171674 - BLOCK
      ?auto_171675 - BLOCK
    )
    :vars
    (
      ?auto_171680 - BLOCK
      ?auto_171676 - BLOCK
      ?auto_171678 - BLOCK
      ?auto_171677 - BLOCK
      ?auto_171679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171672 ?auto_171673 ) ) ( not ( = ?auto_171672 ?auto_171674 ) ) ( not ( = ?auto_171672 ?auto_171675 ) ) ( not ( = ?auto_171673 ?auto_171674 ) ) ( not ( = ?auto_171673 ?auto_171675 ) ) ( not ( = ?auto_171674 ?auto_171675 ) ) ( not ( = ?auto_171672 ?auto_171680 ) ) ( not ( = ?auto_171673 ?auto_171680 ) ) ( not ( = ?auto_171674 ?auto_171680 ) ) ( not ( = ?auto_171675 ?auto_171680 ) ) ( ON-TABLE ?auto_171676 ) ( not ( = ?auto_171676 ?auto_171678 ) ) ( not ( = ?auto_171676 ?auto_171677 ) ) ( not ( = ?auto_171676 ?auto_171680 ) ) ( not ( = ?auto_171676 ?auto_171675 ) ) ( not ( = ?auto_171676 ?auto_171674 ) ) ( not ( = ?auto_171678 ?auto_171677 ) ) ( not ( = ?auto_171678 ?auto_171680 ) ) ( not ( = ?auto_171678 ?auto_171675 ) ) ( not ( = ?auto_171678 ?auto_171674 ) ) ( not ( = ?auto_171677 ?auto_171680 ) ) ( not ( = ?auto_171677 ?auto_171675 ) ) ( not ( = ?auto_171677 ?auto_171674 ) ) ( not ( = ?auto_171672 ?auto_171676 ) ) ( not ( = ?auto_171672 ?auto_171678 ) ) ( not ( = ?auto_171672 ?auto_171677 ) ) ( not ( = ?auto_171673 ?auto_171676 ) ) ( not ( = ?auto_171673 ?auto_171678 ) ) ( not ( = ?auto_171673 ?auto_171677 ) ) ( ON ?auto_171672 ?auto_171679 ) ( not ( = ?auto_171672 ?auto_171679 ) ) ( not ( = ?auto_171673 ?auto_171679 ) ) ( not ( = ?auto_171674 ?auto_171679 ) ) ( not ( = ?auto_171675 ?auto_171679 ) ) ( not ( = ?auto_171680 ?auto_171679 ) ) ( not ( = ?auto_171676 ?auto_171679 ) ) ( not ( = ?auto_171678 ?auto_171679 ) ) ( not ( = ?auto_171677 ?auto_171679 ) ) ( ON ?auto_171673 ?auto_171672 ) ( ON-TABLE ?auto_171679 ) ( ON ?auto_171674 ?auto_171673 ) ( ON ?auto_171675 ?auto_171674 ) ( ON ?auto_171680 ?auto_171675 ) ( ON ?auto_171677 ?auto_171680 ) ( CLEAR ?auto_171677 ) ( HOLDING ?auto_171678 ) ( CLEAR ?auto_171676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171676 ?auto_171678 )
      ( MAKE-4PILE ?auto_171672 ?auto_171673 ?auto_171674 ?auto_171675 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171681 - BLOCK
      ?auto_171682 - BLOCK
      ?auto_171683 - BLOCK
      ?auto_171684 - BLOCK
    )
    :vars
    (
      ?auto_171687 - BLOCK
      ?auto_171686 - BLOCK
      ?auto_171689 - BLOCK
      ?auto_171688 - BLOCK
      ?auto_171685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171681 ?auto_171682 ) ) ( not ( = ?auto_171681 ?auto_171683 ) ) ( not ( = ?auto_171681 ?auto_171684 ) ) ( not ( = ?auto_171682 ?auto_171683 ) ) ( not ( = ?auto_171682 ?auto_171684 ) ) ( not ( = ?auto_171683 ?auto_171684 ) ) ( not ( = ?auto_171681 ?auto_171687 ) ) ( not ( = ?auto_171682 ?auto_171687 ) ) ( not ( = ?auto_171683 ?auto_171687 ) ) ( not ( = ?auto_171684 ?auto_171687 ) ) ( ON-TABLE ?auto_171686 ) ( not ( = ?auto_171686 ?auto_171689 ) ) ( not ( = ?auto_171686 ?auto_171688 ) ) ( not ( = ?auto_171686 ?auto_171687 ) ) ( not ( = ?auto_171686 ?auto_171684 ) ) ( not ( = ?auto_171686 ?auto_171683 ) ) ( not ( = ?auto_171689 ?auto_171688 ) ) ( not ( = ?auto_171689 ?auto_171687 ) ) ( not ( = ?auto_171689 ?auto_171684 ) ) ( not ( = ?auto_171689 ?auto_171683 ) ) ( not ( = ?auto_171688 ?auto_171687 ) ) ( not ( = ?auto_171688 ?auto_171684 ) ) ( not ( = ?auto_171688 ?auto_171683 ) ) ( not ( = ?auto_171681 ?auto_171686 ) ) ( not ( = ?auto_171681 ?auto_171689 ) ) ( not ( = ?auto_171681 ?auto_171688 ) ) ( not ( = ?auto_171682 ?auto_171686 ) ) ( not ( = ?auto_171682 ?auto_171689 ) ) ( not ( = ?auto_171682 ?auto_171688 ) ) ( ON ?auto_171681 ?auto_171685 ) ( not ( = ?auto_171681 ?auto_171685 ) ) ( not ( = ?auto_171682 ?auto_171685 ) ) ( not ( = ?auto_171683 ?auto_171685 ) ) ( not ( = ?auto_171684 ?auto_171685 ) ) ( not ( = ?auto_171687 ?auto_171685 ) ) ( not ( = ?auto_171686 ?auto_171685 ) ) ( not ( = ?auto_171689 ?auto_171685 ) ) ( not ( = ?auto_171688 ?auto_171685 ) ) ( ON ?auto_171682 ?auto_171681 ) ( ON-TABLE ?auto_171685 ) ( ON ?auto_171683 ?auto_171682 ) ( ON ?auto_171684 ?auto_171683 ) ( ON ?auto_171687 ?auto_171684 ) ( ON ?auto_171688 ?auto_171687 ) ( CLEAR ?auto_171686 ) ( ON ?auto_171689 ?auto_171688 ) ( CLEAR ?auto_171689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171685 ?auto_171681 ?auto_171682 ?auto_171683 ?auto_171684 ?auto_171687 ?auto_171688 )
      ( MAKE-4PILE ?auto_171681 ?auto_171682 ?auto_171683 ?auto_171684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171690 - BLOCK
      ?auto_171691 - BLOCK
      ?auto_171692 - BLOCK
      ?auto_171693 - BLOCK
    )
    :vars
    (
      ?auto_171697 - BLOCK
      ?auto_171696 - BLOCK
      ?auto_171695 - BLOCK
      ?auto_171694 - BLOCK
      ?auto_171698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171690 ?auto_171691 ) ) ( not ( = ?auto_171690 ?auto_171692 ) ) ( not ( = ?auto_171690 ?auto_171693 ) ) ( not ( = ?auto_171691 ?auto_171692 ) ) ( not ( = ?auto_171691 ?auto_171693 ) ) ( not ( = ?auto_171692 ?auto_171693 ) ) ( not ( = ?auto_171690 ?auto_171697 ) ) ( not ( = ?auto_171691 ?auto_171697 ) ) ( not ( = ?auto_171692 ?auto_171697 ) ) ( not ( = ?auto_171693 ?auto_171697 ) ) ( not ( = ?auto_171696 ?auto_171695 ) ) ( not ( = ?auto_171696 ?auto_171694 ) ) ( not ( = ?auto_171696 ?auto_171697 ) ) ( not ( = ?auto_171696 ?auto_171693 ) ) ( not ( = ?auto_171696 ?auto_171692 ) ) ( not ( = ?auto_171695 ?auto_171694 ) ) ( not ( = ?auto_171695 ?auto_171697 ) ) ( not ( = ?auto_171695 ?auto_171693 ) ) ( not ( = ?auto_171695 ?auto_171692 ) ) ( not ( = ?auto_171694 ?auto_171697 ) ) ( not ( = ?auto_171694 ?auto_171693 ) ) ( not ( = ?auto_171694 ?auto_171692 ) ) ( not ( = ?auto_171690 ?auto_171696 ) ) ( not ( = ?auto_171690 ?auto_171695 ) ) ( not ( = ?auto_171690 ?auto_171694 ) ) ( not ( = ?auto_171691 ?auto_171696 ) ) ( not ( = ?auto_171691 ?auto_171695 ) ) ( not ( = ?auto_171691 ?auto_171694 ) ) ( ON ?auto_171690 ?auto_171698 ) ( not ( = ?auto_171690 ?auto_171698 ) ) ( not ( = ?auto_171691 ?auto_171698 ) ) ( not ( = ?auto_171692 ?auto_171698 ) ) ( not ( = ?auto_171693 ?auto_171698 ) ) ( not ( = ?auto_171697 ?auto_171698 ) ) ( not ( = ?auto_171696 ?auto_171698 ) ) ( not ( = ?auto_171695 ?auto_171698 ) ) ( not ( = ?auto_171694 ?auto_171698 ) ) ( ON ?auto_171691 ?auto_171690 ) ( ON-TABLE ?auto_171698 ) ( ON ?auto_171692 ?auto_171691 ) ( ON ?auto_171693 ?auto_171692 ) ( ON ?auto_171697 ?auto_171693 ) ( ON ?auto_171694 ?auto_171697 ) ( ON ?auto_171695 ?auto_171694 ) ( CLEAR ?auto_171695 ) ( HOLDING ?auto_171696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171696 )
      ( MAKE-4PILE ?auto_171690 ?auto_171691 ?auto_171692 ?auto_171693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_171699 - BLOCK
      ?auto_171700 - BLOCK
      ?auto_171701 - BLOCK
      ?auto_171702 - BLOCK
    )
    :vars
    (
      ?auto_171707 - BLOCK
      ?auto_171705 - BLOCK
      ?auto_171706 - BLOCK
      ?auto_171704 - BLOCK
      ?auto_171703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171699 ?auto_171700 ) ) ( not ( = ?auto_171699 ?auto_171701 ) ) ( not ( = ?auto_171699 ?auto_171702 ) ) ( not ( = ?auto_171700 ?auto_171701 ) ) ( not ( = ?auto_171700 ?auto_171702 ) ) ( not ( = ?auto_171701 ?auto_171702 ) ) ( not ( = ?auto_171699 ?auto_171707 ) ) ( not ( = ?auto_171700 ?auto_171707 ) ) ( not ( = ?auto_171701 ?auto_171707 ) ) ( not ( = ?auto_171702 ?auto_171707 ) ) ( not ( = ?auto_171705 ?auto_171706 ) ) ( not ( = ?auto_171705 ?auto_171704 ) ) ( not ( = ?auto_171705 ?auto_171707 ) ) ( not ( = ?auto_171705 ?auto_171702 ) ) ( not ( = ?auto_171705 ?auto_171701 ) ) ( not ( = ?auto_171706 ?auto_171704 ) ) ( not ( = ?auto_171706 ?auto_171707 ) ) ( not ( = ?auto_171706 ?auto_171702 ) ) ( not ( = ?auto_171706 ?auto_171701 ) ) ( not ( = ?auto_171704 ?auto_171707 ) ) ( not ( = ?auto_171704 ?auto_171702 ) ) ( not ( = ?auto_171704 ?auto_171701 ) ) ( not ( = ?auto_171699 ?auto_171705 ) ) ( not ( = ?auto_171699 ?auto_171706 ) ) ( not ( = ?auto_171699 ?auto_171704 ) ) ( not ( = ?auto_171700 ?auto_171705 ) ) ( not ( = ?auto_171700 ?auto_171706 ) ) ( not ( = ?auto_171700 ?auto_171704 ) ) ( ON ?auto_171699 ?auto_171703 ) ( not ( = ?auto_171699 ?auto_171703 ) ) ( not ( = ?auto_171700 ?auto_171703 ) ) ( not ( = ?auto_171701 ?auto_171703 ) ) ( not ( = ?auto_171702 ?auto_171703 ) ) ( not ( = ?auto_171707 ?auto_171703 ) ) ( not ( = ?auto_171705 ?auto_171703 ) ) ( not ( = ?auto_171706 ?auto_171703 ) ) ( not ( = ?auto_171704 ?auto_171703 ) ) ( ON ?auto_171700 ?auto_171699 ) ( ON-TABLE ?auto_171703 ) ( ON ?auto_171701 ?auto_171700 ) ( ON ?auto_171702 ?auto_171701 ) ( ON ?auto_171707 ?auto_171702 ) ( ON ?auto_171704 ?auto_171707 ) ( ON ?auto_171706 ?auto_171704 ) ( ON ?auto_171705 ?auto_171706 ) ( CLEAR ?auto_171705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_171703 ?auto_171699 ?auto_171700 ?auto_171701 ?auto_171702 ?auto_171707 ?auto_171704 ?auto_171706 )
      ( MAKE-4PILE ?auto_171699 ?auto_171700 ?auto_171701 ?auto_171702 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171727 - BLOCK
      ?auto_171728 - BLOCK
      ?auto_171729 - BLOCK
    )
    :vars
    (
      ?auto_171730 - BLOCK
      ?auto_171732 - BLOCK
      ?auto_171731 - BLOCK
      ?auto_171733 - BLOCK
      ?auto_171734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171730 ?auto_171729 ) ( ON-TABLE ?auto_171727 ) ( ON ?auto_171728 ?auto_171727 ) ( ON ?auto_171729 ?auto_171728 ) ( not ( = ?auto_171727 ?auto_171728 ) ) ( not ( = ?auto_171727 ?auto_171729 ) ) ( not ( = ?auto_171727 ?auto_171730 ) ) ( not ( = ?auto_171728 ?auto_171729 ) ) ( not ( = ?auto_171728 ?auto_171730 ) ) ( not ( = ?auto_171729 ?auto_171730 ) ) ( not ( = ?auto_171727 ?auto_171732 ) ) ( not ( = ?auto_171727 ?auto_171731 ) ) ( not ( = ?auto_171728 ?auto_171732 ) ) ( not ( = ?auto_171728 ?auto_171731 ) ) ( not ( = ?auto_171729 ?auto_171732 ) ) ( not ( = ?auto_171729 ?auto_171731 ) ) ( not ( = ?auto_171730 ?auto_171732 ) ) ( not ( = ?auto_171730 ?auto_171731 ) ) ( not ( = ?auto_171732 ?auto_171731 ) ) ( ON ?auto_171732 ?auto_171730 ) ( CLEAR ?auto_171732 ) ( HOLDING ?auto_171731 ) ( CLEAR ?auto_171733 ) ( ON-TABLE ?auto_171734 ) ( ON ?auto_171733 ?auto_171734 ) ( not ( = ?auto_171734 ?auto_171733 ) ) ( not ( = ?auto_171734 ?auto_171731 ) ) ( not ( = ?auto_171733 ?auto_171731 ) ) ( not ( = ?auto_171727 ?auto_171733 ) ) ( not ( = ?auto_171727 ?auto_171734 ) ) ( not ( = ?auto_171728 ?auto_171733 ) ) ( not ( = ?auto_171728 ?auto_171734 ) ) ( not ( = ?auto_171729 ?auto_171733 ) ) ( not ( = ?auto_171729 ?auto_171734 ) ) ( not ( = ?auto_171730 ?auto_171733 ) ) ( not ( = ?auto_171730 ?auto_171734 ) ) ( not ( = ?auto_171732 ?auto_171733 ) ) ( not ( = ?auto_171732 ?auto_171734 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171734 ?auto_171733 ?auto_171731 )
      ( MAKE-3PILE ?auto_171727 ?auto_171728 ?auto_171729 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171735 - BLOCK
      ?auto_171736 - BLOCK
      ?auto_171737 - BLOCK
    )
    :vars
    (
      ?auto_171738 - BLOCK
      ?auto_171739 - BLOCK
      ?auto_171742 - BLOCK
      ?auto_171741 - BLOCK
      ?auto_171740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171738 ?auto_171737 ) ( ON-TABLE ?auto_171735 ) ( ON ?auto_171736 ?auto_171735 ) ( ON ?auto_171737 ?auto_171736 ) ( not ( = ?auto_171735 ?auto_171736 ) ) ( not ( = ?auto_171735 ?auto_171737 ) ) ( not ( = ?auto_171735 ?auto_171738 ) ) ( not ( = ?auto_171736 ?auto_171737 ) ) ( not ( = ?auto_171736 ?auto_171738 ) ) ( not ( = ?auto_171737 ?auto_171738 ) ) ( not ( = ?auto_171735 ?auto_171739 ) ) ( not ( = ?auto_171735 ?auto_171742 ) ) ( not ( = ?auto_171736 ?auto_171739 ) ) ( not ( = ?auto_171736 ?auto_171742 ) ) ( not ( = ?auto_171737 ?auto_171739 ) ) ( not ( = ?auto_171737 ?auto_171742 ) ) ( not ( = ?auto_171738 ?auto_171739 ) ) ( not ( = ?auto_171738 ?auto_171742 ) ) ( not ( = ?auto_171739 ?auto_171742 ) ) ( ON ?auto_171739 ?auto_171738 ) ( CLEAR ?auto_171741 ) ( ON-TABLE ?auto_171740 ) ( ON ?auto_171741 ?auto_171740 ) ( not ( = ?auto_171740 ?auto_171741 ) ) ( not ( = ?auto_171740 ?auto_171742 ) ) ( not ( = ?auto_171741 ?auto_171742 ) ) ( not ( = ?auto_171735 ?auto_171741 ) ) ( not ( = ?auto_171735 ?auto_171740 ) ) ( not ( = ?auto_171736 ?auto_171741 ) ) ( not ( = ?auto_171736 ?auto_171740 ) ) ( not ( = ?auto_171737 ?auto_171741 ) ) ( not ( = ?auto_171737 ?auto_171740 ) ) ( not ( = ?auto_171738 ?auto_171741 ) ) ( not ( = ?auto_171738 ?auto_171740 ) ) ( not ( = ?auto_171739 ?auto_171741 ) ) ( not ( = ?auto_171739 ?auto_171740 ) ) ( ON ?auto_171742 ?auto_171739 ) ( CLEAR ?auto_171742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171735 ?auto_171736 ?auto_171737 ?auto_171738 ?auto_171739 )
      ( MAKE-3PILE ?auto_171735 ?auto_171736 ?auto_171737 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171743 - BLOCK
      ?auto_171744 - BLOCK
      ?auto_171745 - BLOCK
    )
    :vars
    (
      ?auto_171750 - BLOCK
      ?auto_171746 - BLOCK
      ?auto_171748 - BLOCK
      ?auto_171747 - BLOCK
      ?auto_171749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171750 ?auto_171745 ) ( ON-TABLE ?auto_171743 ) ( ON ?auto_171744 ?auto_171743 ) ( ON ?auto_171745 ?auto_171744 ) ( not ( = ?auto_171743 ?auto_171744 ) ) ( not ( = ?auto_171743 ?auto_171745 ) ) ( not ( = ?auto_171743 ?auto_171750 ) ) ( not ( = ?auto_171744 ?auto_171745 ) ) ( not ( = ?auto_171744 ?auto_171750 ) ) ( not ( = ?auto_171745 ?auto_171750 ) ) ( not ( = ?auto_171743 ?auto_171746 ) ) ( not ( = ?auto_171743 ?auto_171748 ) ) ( not ( = ?auto_171744 ?auto_171746 ) ) ( not ( = ?auto_171744 ?auto_171748 ) ) ( not ( = ?auto_171745 ?auto_171746 ) ) ( not ( = ?auto_171745 ?auto_171748 ) ) ( not ( = ?auto_171750 ?auto_171746 ) ) ( not ( = ?auto_171750 ?auto_171748 ) ) ( not ( = ?auto_171746 ?auto_171748 ) ) ( ON ?auto_171746 ?auto_171750 ) ( ON-TABLE ?auto_171747 ) ( not ( = ?auto_171747 ?auto_171749 ) ) ( not ( = ?auto_171747 ?auto_171748 ) ) ( not ( = ?auto_171749 ?auto_171748 ) ) ( not ( = ?auto_171743 ?auto_171749 ) ) ( not ( = ?auto_171743 ?auto_171747 ) ) ( not ( = ?auto_171744 ?auto_171749 ) ) ( not ( = ?auto_171744 ?auto_171747 ) ) ( not ( = ?auto_171745 ?auto_171749 ) ) ( not ( = ?auto_171745 ?auto_171747 ) ) ( not ( = ?auto_171750 ?auto_171749 ) ) ( not ( = ?auto_171750 ?auto_171747 ) ) ( not ( = ?auto_171746 ?auto_171749 ) ) ( not ( = ?auto_171746 ?auto_171747 ) ) ( ON ?auto_171748 ?auto_171746 ) ( CLEAR ?auto_171748 ) ( HOLDING ?auto_171749 ) ( CLEAR ?auto_171747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171747 ?auto_171749 )
      ( MAKE-3PILE ?auto_171743 ?auto_171744 ?auto_171745 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171751 - BLOCK
      ?auto_171752 - BLOCK
      ?auto_171753 - BLOCK
    )
    :vars
    (
      ?auto_171755 - BLOCK
      ?auto_171754 - BLOCK
      ?auto_171757 - BLOCK
      ?auto_171758 - BLOCK
      ?auto_171756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171755 ?auto_171753 ) ( ON-TABLE ?auto_171751 ) ( ON ?auto_171752 ?auto_171751 ) ( ON ?auto_171753 ?auto_171752 ) ( not ( = ?auto_171751 ?auto_171752 ) ) ( not ( = ?auto_171751 ?auto_171753 ) ) ( not ( = ?auto_171751 ?auto_171755 ) ) ( not ( = ?auto_171752 ?auto_171753 ) ) ( not ( = ?auto_171752 ?auto_171755 ) ) ( not ( = ?auto_171753 ?auto_171755 ) ) ( not ( = ?auto_171751 ?auto_171754 ) ) ( not ( = ?auto_171751 ?auto_171757 ) ) ( not ( = ?auto_171752 ?auto_171754 ) ) ( not ( = ?auto_171752 ?auto_171757 ) ) ( not ( = ?auto_171753 ?auto_171754 ) ) ( not ( = ?auto_171753 ?auto_171757 ) ) ( not ( = ?auto_171755 ?auto_171754 ) ) ( not ( = ?auto_171755 ?auto_171757 ) ) ( not ( = ?auto_171754 ?auto_171757 ) ) ( ON ?auto_171754 ?auto_171755 ) ( ON-TABLE ?auto_171758 ) ( not ( = ?auto_171758 ?auto_171756 ) ) ( not ( = ?auto_171758 ?auto_171757 ) ) ( not ( = ?auto_171756 ?auto_171757 ) ) ( not ( = ?auto_171751 ?auto_171756 ) ) ( not ( = ?auto_171751 ?auto_171758 ) ) ( not ( = ?auto_171752 ?auto_171756 ) ) ( not ( = ?auto_171752 ?auto_171758 ) ) ( not ( = ?auto_171753 ?auto_171756 ) ) ( not ( = ?auto_171753 ?auto_171758 ) ) ( not ( = ?auto_171755 ?auto_171756 ) ) ( not ( = ?auto_171755 ?auto_171758 ) ) ( not ( = ?auto_171754 ?auto_171756 ) ) ( not ( = ?auto_171754 ?auto_171758 ) ) ( ON ?auto_171757 ?auto_171754 ) ( CLEAR ?auto_171758 ) ( ON ?auto_171756 ?auto_171757 ) ( CLEAR ?auto_171756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171751 ?auto_171752 ?auto_171753 ?auto_171755 ?auto_171754 ?auto_171757 )
      ( MAKE-3PILE ?auto_171751 ?auto_171752 ?auto_171753 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171759 - BLOCK
      ?auto_171760 - BLOCK
      ?auto_171761 - BLOCK
    )
    :vars
    (
      ?auto_171765 - BLOCK
      ?auto_171766 - BLOCK
      ?auto_171763 - BLOCK
      ?auto_171762 - BLOCK
      ?auto_171764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171765 ?auto_171761 ) ( ON-TABLE ?auto_171759 ) ( ON ?auto_171760 ?auto_171759 ) ( ON ?auto_171761 ?auto_171760 ) ( not ( = ?auto_171759 ?auto_171760 ) ) ( not ( = ?auto_171759 ?auto_171761 ) ) ( not ( = ?auto_171759 ?auto_171765 ) ) ( not ( = ?auto_171760 ?auto_171761 ) ) ( not ( = ?auto_171760 ?auto_171765 ) ) ( not ( = ?auto_171761 ?auto_171765 ) ) ( not ( = ?auto_171759 ?auto_171766 ) ) ( not ( = ?auto_171759 ?auto_171763 ) ) ( not ( = ?auto_171760 ?auto_171766 ) ) ( not ( = ?auto_171760 ?auto_171763 ) ) ( not ( = ?auto_171761 ?auto_171766 ) ) ( not ( = ?auto_171761 ?auto_171763 ) ) ( not ( = ?auto_171765 ?auto_171766 ) ) ( not ( = ?auto_171765 ?auto_171763 ) ) ( not ( = ?auto_171766 ?auto_171763 ) ) ( ON ?auto_171766 ?auto_171765 ) ( not ( = ?auto_171762 ?auto_171764 ) ) ( not ( = ?auto_171762 ?auto_171763 ) ) ( not ( = ?auto_171764 ?auto_171763 ) ) ( not ( = ?auto_171759 ?auto_171764 ) ) ( not ( = ?auto_171759 ?auto_171762 ) ) ( not ( = ?auto_171760 ?auto_171764 ) ) ( not ( = ?auto_171760 ?auto_171762 ) ) ( not ( = ?auto_171761 ?auto_171764 ) ) ( not ( = ?auto_171761 ?auto_171762 ) ) ( not ( = ?auto_171765 ?auto_171764 ) ) ( not ( = ?auto_171765 ?auto_171762 ) ) ( not ( = ?auto_171766 ?auto_171764 ) ) ( not ( = ?auto_171766 ?auto_171762 ) ) ( ON ?auto_171763 ?auto_171766 ) ( ON ?auto_171764 ?auto_171763 ) ( CLEAR ?auto_171764 ) ( HOLDING ?auto_171762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171762 )
      ( MAKE-3PILE ?auto_171759 ?auto_171760 ?auto_171761 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171778 - BLOCK
      ?auto_171779 - BLOCK
      ?auto_171780 - BLOCK
    )
    :vars
    (
      ?auto_171781 - BLOCK
      ?auto_171782 - BLOCK
      ?auto_171785 - BLOCK
      ?auto_171784 - BLOCK
      ?auto_171783 - BLOCK
      ?auto_171786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171781 ?auto_171780 ) ( ON-TABLE ?auto_171778 ) ( ON ?auto_171779 ?auto_171778 ) ( ON ?auto_171780 ?auto_171779 ) ( not ( = ?auto_171778 ?auto_171779 ) ) ( not ( = ?auto_171778 ?auto_171780 ) ) ( not ( = ?auto_171778 ?auto_171781 ) ) ( not ( = ?auto_171779 ?auto_171780 ) ) ( not ( = ?auto_171779 ?auto_171781 ) ) ( not ( = ?auto_171780 ?auto_171781 ) ) ( not ( = ?auto_171778 ?auto_171782 ) ) ( not ( = ?auto_171778 ?auto_171785 ) ) ( not ( = ?auto_171779 ?auto_171782 ) ) ( not ( = ?auto_171779 ?auto_171785 ) ) ( not ( = ?auto_171780 ?auto_171782 ) ) ( not ( = ?auto_171780 ?auto_171785 ) ) ( not ( = ?auto_171781 ?auto_171782 ) ) ( not ( = ?auto_171781 ?auto_171785 ) ) ( not ( = ?auto_171782 ?auto_171785 ) ) ( ON ?auto_171782 ?auto_171781 ) ( not ( = ?auto_171784 ?auto_171783 ) ) ( not ( = ?auto_171784 ?auto_171785 ) ) ( not ( = ?auto_171783 ?auto_171785 ) ) ( not ( = ?auto_171778 ?auto_171783 ) ) ( not ( = ?auto_171778 ?auto_171784 ) ) ( not ( = ?auto_171779 ?auto_171783 ) ) ( not ( = ?auto_171779 ?auto_171784 ) ) ( not ( = ?auto_171780 ?auto_171783 ) ) ( not ( = ?auto_171780 ?auto_171784 ) ) ( not ( = ?auto_171781 ?auto_171783 ) ) ( not ( = ?auto_171781 ?auto_171784 ) ) ( not ( = ?auto_171782 ?auto_171783 ) ) ( not ( = ?auto_171782 ?auto_171784 ) ) ( ON ?auto_171785 ?auto_171782 ) ( ON ?auto_171783 ?auto_171785 ) ( CLEAR ?auto_171783 ) ( ON ?auto_171784 ?auto_171786 ) ( CLEAR ?auto_171784 ) ( HAND-EMPTY ) ( not ( = ?auto_171778 ?auto_171786 ) ) ( not ( = ?auto_171779 ?auto_171786 ) ) ( not ( = ?auto_171780 ?auto_171786 ) ) ( not ( = ?auto_171781 ?auto_171786 ) ) ( not ( = ?auto_171782 ?auto_171786 ) ) ( not ( = ?auto_171785 ?auto_171786 ) ) ( not ( = ?auto_171784 ?auto_171786 ) ) ( not ( = ?auto_171783 ?auto_171786 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171784 ?auto_171786 )
      ( MAKE-3PILE ?auto_171778 ?auto_171779 ?auto_171780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171787 - BLOCK
      ?auto_171788 - BLOCK
      ?auto_171789 - BLOCK
    )
    :vars
    (
      ?auto_171794 - BLOCK
      ?auto_171792 - BLOCK
      ?auto_171793 - BLOCK
      ?auto_171795 - BLOCK
      ?auto_171790 - BLOCK
      ?auto_171791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171794 ?auto_171789 ) ( ON-TABLE ?auto_171787 ) ( ON ?auto_171788 ?auto_171787 ) ( ON ?auto_171789 ?auto_171788 ) ( not ( = ?auto_171787 ?auto_171788 ) ) ( not ( = ?auto_171787 ?auto_171789 ) ) ( not ( = ?auto_171787 ?auto_171794 ) ) ( not ( = ?auto_171788 ?auto_171789 ) ) ( not ( = ?auto_171788 ?auto_171794 ) ) ( not ( = ?auto_171789 ?auto_171794 ) ) ( not ( = ?auto_171787 ?auto_171792 ) ) ( not ( = ?auto_171787 ?auto_171793 ) ) ( not ( = ?auto_171788 ?auto_171792 ) ) ( not ( = ?auto_171788 ?auto_171793 ) ) ( not ( = ?auto_171789 ?auto_171792 ) ) ( not ( = ?auto_171789 ?auto_171793 ) ) ( not ( = ?auto_171794 ?auto_171792 ) ) ( not ( = ?auto_171794 ?auto_171793 ) ) ( not ( = ?auto_171792 ?auto_171793 ) ) ( ON ?auto_171792 ?auto_171794 ) ( not ( = ?auto_171795 ?auto_171790 ) ) ( not ( = ?auto_171795 ?auto_171793 ) ) ( not ( = ?auto_171790 ?auto_171793 ) ) ( not ( = ?auto_171787 ?auto_171790 ) ) ( not ( = ?auto_171787 ?auto_171795 ) ) ( not ( = ?auto_171788 ?auto_171790 ) ) ( not ( = ?auto_171788 ?auto_171795 ) ) ( not ( = ?auto_171789 ?auto_171790 ) ) ( not ( = ?auto_171789 ?auto_171795 ) ) ( not ( = ?auto_171794 ?auto_171790 ) ) ( not ( = ?auto_171794 ?auto_171795 ) ) ( not ( = ?auto_171792 ?auto_171790 ) ) ( not ( = ?auto_171792 ?auto_171795 ) ) ( ON ?auto_171793 ?auto_171792 ) ( ON ?auto_171795 ?auto_171791 ) ( CLEAR ?auto_171795 ) ( not ( = ?auto_171787 ?auto_171791 ) ) ( not ( = ?auto_171788 ?auto_171791 ) ) ( not ( = ?auto_171789 ?auto_171791 ) ) ( not ( = ?auto_171794 ?auto_171791 ) ) ( not ( = ?auto_171792 ?auto_171791 ) ) ( not ( = ?auto_171793 ?auto_171791 ) ) ( not ( = ?auto_171795 ?auto_171791 ) ) ( not ( = ?auto_171790 ?auto_171791 ) ) ( HOLDING ?auto_171790 ) ( CLEAR ?auto_171793 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171787 ?auto_171788 ?auto_171789 ?auto_171794 ?auto_171792 ?auto_171793 ?auto_171790 )
      ( MAKE-3PILE ?auto_171787 ?auto_171788 ?auto_171789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171796 - BLOCK
      ?auto_171797 - BLOCK
      ?auto_171798 - BLOCK
    )
    :vars
    (
      ?auto_171800 - BLOCK
      ?auto_171802 - BLOCK
      ?auto_171803 - BLOCK
      ?auto_171804 - BLOCK
      ?auto_171801 - BLOCK
      ?auto_171799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171800 ?auto_171798 ) ( ON-TABLE ?auto_171796 ) ( ON ?auto_171797 ?auto_171796 ) ( ON ?auto_171798 ?auto_171797 ) ( not ( = ?auto_171796 ?auto_171797 ) ) ( not ( = ?auto_171796 ?auto_171798 ) ) ( not ( = ?auto_171796 ?auto_171800 ) ) ( not ( = ?auto_171797 ?auto_171798 ) ) ( not ( = ?auto_171797 ?auto_171800 ) ) ( not ( = ?auto_171798 ?auto_171800 ) ) ( not ( = ?auto_171796 ?auto_171802 ) ) ( not ( = ?auto_171796 ?auto_171803 ) ) ( not ( = ?auto_171797 ?auto_171802 ) ) ( not ( = ?auto_171797 ?auto_171803 ) ) ( not ( = ?auto_171798 ?auto_171802 ) ) ( not ( = ?auto_171798 ?auto_171803 ) ) ( not ( = ?auto_171800 ?auto_171802 ) ) ( not ( = ?auto_171800 ?auto_171803 ) ) ( not ( = ?auto_171802 ?auto_171803 ) ) ( ON ?auto_171802 ?auto_171800 ) ( not ( = ?auto_171804 ?auto_171801 ) ) ( not ( = ?auto_171804 ?auto_171803 ) ) ( not ( = ?auto_171801 ?auto_171803 ) ) ( not ( = ?auto_171796 ?auto_171801 ) ) ( not ( = ?auto_171796 ?auto_171804 ) ) ( not ( = ?auto_171797 ?auto_171801 ) ) ( not ( = ?auto_171797 ?auto_171804 ) ) ( not ( = ?auto_171798 ?auto_171801 ) ) ( not ( = ?auto_171798 ?auto_171804 ) ) ( not ( = ?auto_171800 ?auto_171801 ) ) ( not ( = ?auto_171800 ?auto_171804 ) ) ( not ( = ?auto_171802 ?auto_171801 ) ) ( not ( = ?auto_171802 ?auto_171804 ) ) ( ON ?auto_171803 ?auto_171802 ) ( ON ?auto_171804 ?auto_171799 ) ( not ( = ?auto_171796 ?auto_171799 ) ) ( not ( = ?auto_171797 ?auto_171799 ) ) ( not ( = ?auto_171798 ?auto_171799 ) ) ( not ( = ?auto_171800 ?auto_171799 ) ) ( not ( = ?auto_171802 ?auto_171799 ) ) ( not ( = ?auto_171803 ?auto_171799 ) ) ( not ( = ?auto_171804 ?auto_171799 ) ) ( not ( = ?auto_171801 ?auto_171799 ) ) ( CLEAR ?auto_171803 ) ( ON ?auto_171801 ?auto_171804 ) ( CLEAR ?auto_171801 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171799 ?auto_171804 )
      ( MAKE-3PILE ?auto_171796 ?auto_171797 ?auto_171798 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_171805 - BLOCK
      ?auto_171806 - BLOCK
      ?auto_171807 - BLOCK
    )
    :vars
    (
      ?auto_171812 - BLOCK
      ?auto_171809 - BLOCK
      ?auto_171811 - BLOCK
      ?auto_171810 - BLOCK
      ?auto_171813 - BLOCK
      ?auto_171808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_171812 ?auto_171807 ) ( ON-TABLE ?auto_171805 ) ( ON ?auto_171806 ?auto_171805 ) ( ON ?auto_171807 ?auto_171806 ) ( not ( = ?auto_171805 ?auto_171806 ) ) ( not ( = ?auto_171805 ?auto_171807 ) ) ( not ( = ?auto_171805 ?auto_171812 ) ) ( not ( = ?auto_171806 ?auto_171807 ) ) ( not ( = ?auto_171806 ?auto_171812 ) ) ( not ( = ?auto_171807 ?auto_171812 ) ) ( not ( = ?auto_171805 ?auto_171809 ) ) ( not ( = ?auto_171805 ?auto_171811 ) ) ( not ( = ?auto_171806 ?auto_171809 ) ) ( not ( = ?auto_171806 ?auto_171811 ) ) ( not ( = ?auto_171807 ?auto_171809 ) ) ( not ( = ?auto_171807 ?auto_171811 ) ) ( not ( = ?auto_171812 ?auto_171809 ) ) ( not ( = ?auto_171812 ?auto_171811 ) ) ( not ( = ?auto_171809 ?auto_171811 ) ) ( ON ?auto_171809 ?auto_171812 ) ( not ( = ?auto_171810 ?auto_171813 ) ) ( not ( = ?auto_171810 ?auto_171811 ) ) ( not ( = ?auto_171813 ?auto_171811 ) ) ( not ( = ?auto_171805 ?auto_171813 ) ) ( not ( = ?auto_171805 ?auto_171810 ) ) ( not ( = ?auto_171806 ?auto_171813 ) ) ( not ( = ?auto_171806 ?auto_171810 ) ) ( not ( = ?auto_171807 ?auto_171813 ) ) ( not ( = ?auto_171807 ?auto_171810 ) ) ( not ( = ?auto_171812 ?auto_171813 ) ) ( not ( = ?auto_171812 ?auto_171810 ) ) ( not ( = ?auto_171809 ?auto_171813 ) ) ( not ( = ?auto_171809 ?auto_171810 ) ) ( ON ?auto_171810 ?auto_171808 ) ( not ( = ?auto_171805 ?auto_171808 ) ) ( not ( = ?auto_171806 ?auto_171808 ) ) ( not ( = ?auto_171807 ?auto_171808 ) ) ( not ( = ?auto_171812 ?auto_171808 ) ) ( not ( = ?auto_171809 ?auto_171808 ) ) ( not ( = ?auto_171811 ?auto_171808 ) ) ( not ( = ?auto_171810 ?auto_171808 ) ) ( not ( = ?auto_171813 ?auto_171808 ) ) ( ON ?auto_171813 ?auto_171810 ) ( CLEAR ?auto_171813 ) ( ON-TABLE ?auto_171808 ) ( HOLDING ?auto_171811 ) ( CLEAR ?auto_171809 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171805 ?auto_171806 ?auto_171807 ?auto_171812 ?auto_171809 ?auto_171811 )
      ( MAKE-3PILE ?auto_171805 ?auto_171806 ?auto_171807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171872 - BLOCK
      ?auto_171873 - BLOCK
      ?auto_171874 - BLOCK
      ?auto_171875 - BLOCK
      ?auto_171876 - BLOCK
    )
    :vars
    (
      ?auto_171877 - BLOCK
      ?auto_171878 - BLOCK
      ?auto_171879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171872 ) ( ON ?auto_171873 ?auto_171872 ) ( ON ?auto_171874 ?auto_171873 ) ( not ( = ?auto_171872 ?auto_171873 ) ) ( not ( = ?auto_171872 ?auto_171874 ) ) ( not ( = ?auto_171872 ?auto_171875 ) ) ( not ( = ?auto_171872 ?auto_171876 ) ) ( not ( = ?auto_171873 ?auto_171874 ) ) ( not ( = ?auto_171873 ?auto_171875 ) ) ( not ( = ?auto_171873 ?auto_171876 ) ) ( not ( = ?auto_171874 ?auto_171875 ) ) ( not ( = ?auto_171874 ?auto_171876 ) ) ( not ( = ?auto_171875 ?auto_171876 ) ) ( ON ?auto_171876 ?auto_171877 ) ( not ( = ?auto_171872 ?auto_171877 ) ) ( not ( = ?auto_171873 ?auto_171877 ) ) ( not ( = ?auto_171874 ?auto_171877 ) ) ( not ( = ?auto_171875 ?auto_171877 ) ) ( not ( = ?auto_171876 ?auto_171877 ) ) ( CLEAR ?auto_171874 ) ( ON ?auto_171875 ?auto_171876 ) ( CLEAR ?auto_171875 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171878 ) ( ON ?auto_171879 ?auto_171878 ) ( ON ?auto_171877 ?auto_171879 ) ( not ( = ?auto_171878 ?auto_171879 ) ) ( not ( = ?auto_171878 ?auto_171877 ) ) ( not ( = ?auto_171878 ?auto_171876 ) ) ( not ( = ?auto_171878 ?auto_171875 ) ) ( not ( = ?auto_171879 ?auto_171877 ) ) ( not ( = ?auto_171879 ?auto_171876 ) ) ( not ( = ?auto_171879 ?auto_171875 ) ) ( not ( = ?auto_171872 ?auto_171878 ) ) ( not ( = ?auto_171872 ?auto_171879 ) ) ( not ( = ?auto_171873 ?auto_171878 ) ) ( not ( = ?auto_171873 ?auto_171879 ) ) ( not ( = ?auto_171874 ?auto_171878 ) ) ( not ( = ?auto_171874 ?auto_171879 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171878 ?auto_171879 ?auto_171877 ?auto_171876 )
      ( MAKE-5PILE ?auto_171872 ?auto_171873 ?auto_171874 ?auto_171875 ?auto_171876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171880 - BLOCK
      ?auto_171881 - BLOCK
      ?auto_171882 - BLOCK
      ?auto_171883 - BLOCK
      ?auto_171884 - BLOCK
    )
    :vars
    (
      ?auto_171887 - BLOCK
      ?auto_171886 - BLOCK
      ?auto_171885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171880 ) ( ON ?auto_171881 ?auto_171880 ) ( not ( = ?auto_171880 ?auto_171881 ) ) ( not ( = ?auto_171880 ?auto_171882 ) ) ( not ( = ?auto_171880 ?auto_171883 ) ) ( not ( = ?auto_171880 ?auto_171884 ) ) ( not ( = ?auto_171881 ?auto_171882 ) ) ( not ( = ?auto_171881 ?auto_171883 ) ) ( not ( = ?auto_171881 ?auto_171884 ) ) ( not ( = ?auto_171882 ?auto_171883 ) ) ( not ( = ?auto_171882 ?auto_171884 ) ) ( not ( = ?auto_171883 ?auto_171884 ) ) ( ON ?auto_171884 ?auto_171887 ) ( not ( = ?auto_171880 ?auto_171887 ) ) ( not ( = ?auto_171881 ?auto_171887 ) ) ( not ( = ?auto_171882 ?auto_171887 ) ) ( not ( = ?auto_171883 ?auto_171887 ) ) ( not ( = ?auto_171884 ?auto_171887 ) ) ( ON ?auto_171883 ?auto_171884 ) ( CLEAR ?auto_171883 ) ( ON-TABLE ?auto_171886 ) ( ON ?auto_171885 ?auto_171886 ) ( ON ?auto_171887 ?auto_171885 ) ( not ( = ?auto_171886 ?auto_171885 ) ) ( not ( = ?auto_171886 ?auto_171887 ) ) ( not ( = ?auto_171886 ?auto_171884 ) ) ( not ( = ?auto_171886 ?auto_171883 ) ) ( not ( = ?auto_171885 ?auto_171887 ) ) ( not ( = ?auto_171885 ?auto_171884 ) ) ( not ( = ?auto_171885 ?auto_171883 ) ) ( not ( = ?auto_171880 ?auto_171886 ) ) ( not ( = ?auto_171880 ?auto_171885 ) ) ( not ( = ?auto_171881 ?auto_171886 ) ) ( not ( = ?auto_171881 ?auto_171885 ) ) ( not ( = ?auto_171882 ?auto_171886 ) ) ( not ( = ?auto_171882 ?auto_171885 ) ) ( HOLDING ?auto_171882 ) ( CLEAR ?auto_171881 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171880 ?auto_171881 ?auto_171882 )
      ( MAKE-5PILE ?auto_171880 ?auto_171881 ?auto_171882 ?auto_171883 ?auto_171884 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171888 - BLOCK
      ?auto_171889 - BLOCK
      ?auto_171890 - BLOCK
      ?auto_171891 - BLOCK
      ?auto_171892 - BLOCK
    )
    :vars
    (
      ?auto_171894 - BLOCK
      ?auto_171895 - BLOCK
      ?auto_171893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171888 ) ( ON ?auto_171889 ?auto_171888 ) ( not ( = ?auto_171888 ?auto_171889 ) ) ( not ( = ?auto_171888 ?auto_171890 ) ) ( not ( = ?auto_171888 ?auto_171891 ) ) ( not ( = ?auto_171888 ?auto_171892 ) ) ( not ( = ?auto_171889 ?auto_171890 ) ) ( not ( = ?auto_171889 ?auto_171891 ) ) ( not ( = ?auto_171889 ?auto_171892 ) ) ( not ( = ?auto_171890 ?auto_171891 ) ) ( not ( = ?auto_171890 ?auto_171892 ) ) ( not ( = ?auto_171891 ?auto_171892 ) ) ( ON ?auto_171892 ?auto_171894 ) ( not ( = ?auto_171888 ?auto_171894 ) ) ( not ( = ?auto_171889 ?auto_171894 ) ) ( not ( = ?auto_171890 ?auto_171894 ) ) ( not ( = ?auto_171891 ?auto_171894 ) ) ( not ( = ?auto_171892 ?auto_171894 ) ) ( ON ?auto_171891 ?auto_171892 ) ( ON-TABLE ?auto_171895 ) ( ON ?auto_171893 ?auto_171895 ) ( ON ?auto_171894 ?auto_171893 ) ( not ( = ?auto_171895 ?auto_171893 ) ) ( not ( = ?auto_171895 ?auto_171894 ) ) ( not ( = ?auto_171895 ?auto_171892 ) ) ( not ( = ?auto_171895 ?auto_171891 ) ) ( not ( = ?auto_171893 ?auto_171894 ) ) ( not ( = ?auto_171893 ?auto_171892 ) ) ( not ( = ?auto_171893 ?auto_171891 ) ) ( not ( = ?auto_171888 ?auto_171895 ) ) ( not ( = ?auto_171888 ?auto_171893 ) ) ( not ( = ?auto_171889 ?auto_171895 ) ) ( not ( = ?auto_171889 ?auto_171893 ) ) ( not ( = ?auto_171890 ?auto_171895 ) ) ( not ( = ?auto_171890 ?auto_171893 ) ) ( CLEAR ?auto_171889 ) ( ON ?auto_171890 ?auto_171891 ) ( CLEAR ?auto_171890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171895 ?auto_171893 ?auto_171894 ?auto_171892 ?auto_171891 )
      ( MAKE-5PILE ?auto_171888 ?auto_171889 ?auto_171890 ?auto_171891 ?auto_171892 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171896 - BLOCK
      ?auto_171897 - BLOCK
      ?auto_171898 - BLOCK
      ?auto_171899 - BLOCK
      ?auto_171900 - BLOCK
    )
    :vars
    (
      ?auto_171901 - BLOCK
      ?auto_171903 - BLOCK
      ?auto_171902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171896 ) ( not ( = ?auto_171896 ?auto_171897 ) ) ( not ( = ?auto_171896 ?auto_171898 ) ) ( not ( = ?auto_171896 ?auto_171899 ) ) ( not ( = ?auto_171896 ?auto_171900 ) ) ( not ( = ?auto_171897 ?auto_171898 ) ) ( not ( = ?auto_171897 ?auto_171899 ) ) ( not ( = ?auto_171897 ?auto_171900 ) ) ( not ( = ?auto_171898 ?auto_171899 ) ) ( not ( = ?auto_171898 ?auto_171900 ) ) ( not ( = ?auto_171899 ?auto_171900 ) ) ( ON ?auto_171900 ?auto_171901 ) ( not ( = ?auto_171896 ?auto_171901 ) ) ( not ( = ?auto_171897 ?auto_171901 ) ) ( not ( = ?auto_171898 ?auto_171901 ) ) ( not ( = ?auto_171899 ?auto_171901 ) ) ( not ( = ?auto_171900 ?auto_171901 ) ) ( ON ?auto_171899 ?auto_171900 ) ( ON-TABLE ?auto_171903 ) ( ON ?auto_171902 ?auto_171903 ) ( ON ?auto_171901 ?auto_171902 ) ( not ( = ?auto_171903 ?auto_171902 ) ) ( not ( = ?auto_171903 ?auto_171901 ) ) ( not ( = ?auto_171903 ?auto_171900 ) ) ( not ( = ?auto_171903 ?auto_171899 ) ) ( not ( = ?auto_171902 ?auto_171901 ) ) ( not ( = ?auto_171902 ?auto_171900 ) ) ( not ( = ?auto_171902 ?auto_171899 ) ) ( not ( = ?auto_171896 ?auto_171903 ) ) ( not ( = ?auto_171896 ?auto_171902 ) ) ( not ( = ?auto_171897 ?auto_171903 ) ) ( not ( = ?auto_171897 ?auto_171902 ) ) ( not ( = ?auto_171898 ?auto_171903 ) ) ( not ( = ?auto_171898 ?auto_171902 ) ) ( ON ?auto_171898 ?auto_171899 ) ( CLEAR ?auto_171898 ) ( HOLDING ?auto_171897 ) ( CLEAR ?auto_171896 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171896 ?auto_171897 )
      ( MAKE-5PILE ?auto_171896 ?auto_171897 ?auto_171898 ?auto_171899 ?auto_171900 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171904 - BLOCK
      ?auto_171905 - BLOCK
      ?auto_171906 - BLOCK
      ?auto_171907 - BLOCK
      ?auto_171908 - BLOCK
    )
    :vars
    (
      ?auto_171909 - BLOCK
      ?auto_171910 - BLOCK
      ?auto_171911 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_171904 ) ( not ( = ?auto_171904 ?auto_171905 ) ) ( not ( = ?auto_171904 ?auto_171906 ) ) ( not ( = ?auto_171904 ?auto_171907 ) ) ( not ( = ?auto_171904 ?auto_171908 ) ) ( not ( = ?auto_171905 ?auto_171906 ) ) ( not ( = ?auto_171905 ?auto_171907 ) ) ( not ( = ?auto_171905 ?auto_171908 ) ) ( not ( = ?auto_171906 ?auto_171907 ) ) ( not ( = ?auto_171906 ?auto_171908 ) ) ( not ( = ?auto_171907 ?auto_171908 ) ) ( ON ?auto_171908 ?auto_171909 ) ( not ( = ?auto_171904 ?auto_171909 ) ) ( not ( = ?auto_171905 ?auto_171909 ) ) ( not ( = ?auto_171906 ?auto_171909 ) ) ( not ( = ?auto_171907 ?auto_171909 ) ) ( not ( = ?auto_171908 ?auto_171909 ) ) ( ON ?auto_171907 ?auto_171908 ) ( ON-TABLE ?auto_171910 ) ( ON ?auto_171911 ?auto_171910 ) ( ON ?auto_171909 ?auto_171911 ) ( not ( = ?auto_171910 ?auto_171911 ) ) ( not ( = ?auto_171910 ?auto_171909 ) ) ( not ( = ?auto_171910 ?auto_171908 ) ) ( not ( = ?auto_171910 ?auto_171907 ) ) ( not ( = ?auto_171911 ?auto_171909 ) ) ( not ( = ?auto_171911 ?auto_171908 ) ) ( not ( = ?auto_171911 ?auto_171907 ) ) ( not ( = ?auto_171904 ?auto_171910 ) ) ( not ( = ?auto_171904 ?auto_171911 ) ) ( not ( = ?auto_171905 ?auto_171910 ) ) ( not ( = ?auto_171905 ?auto_171911 ) ) ( not ( = ?auto_171906 ?auto_171910 ) ) ( not ( = ?auto_171906 ?auto_171911 ) ) ( ON ?auto_171906 ?auto_171907 ) ( CLEAR ?auto_171904 ) ( ON ?auto_171905 ?auto_171906 ) ( CLEAR ?auto_171905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171910 ?auto_171911 ?auto_171909 ?auto_171908 ?auto_171907 ?auto_171906 )
      ( MAKE-5PILE ?auto_171904 ?auto_171905 ?auto_171906 ?auto_171907 ?auto_171908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171912 - BLOCK
      ?auto_171913 - BLOCK
      ?auto_171914 - BLOCK
      ?auto_171915 - BLOCK
      ?auto_171916 - BLOCK
    )
    :vars
    (
      ?auto_171919 - BLOCK
      ?auto_171918 - BLOCK
      ?auto_171917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171912 ?auto_171913 ) ) ( not ( = ?auto_171912 ?auto_171914 ) ) ( not ( = ?auto_171912 ?auto_171915 ) ) ( not ( = ?auto_171912 ?auto_171916 ) ) ( not ( = ?auto_171913 ?auto_171914 ) ) ( not ( = ?auto_171913 ?auto_171915 ) ) ( not ( = ?auto_171913 ?auto_171916 ) ) ( not ( = ?auto_171914 ?auto_171915 ) ) ( not ( = ?auto_171914 ?auto_171916 ) ) ( not ( = ?auto_171915 ?auto_171916 ) ) ( ON ?auto_171916 ?auto_171919 ) ( not ( = ?auto_171912 ?auto_171919 ) ) ( not ( = ?auto_171913 ?auto_171919 ) ) ( not ( = ?auto_171914 ?auto_171919 ) ) ( not ( = ?auto_171915 ?auto_171919 ) ) ( not ( = ?auto_171916 ?auto_171919 ) ) ( ON ?auto_171915 ?auto_171916 ) ( ON-TABLE ?auto_171918 ) ( ON ?auto_171917 ?auto_171918 ) ( ON ?auto_171919 ?auto_171917 ) ( not ( = ?auto_171918 ?auto_171917 ) ) ( not ( = ?auto_171918 ?auto_171919 ) ) ( not ( = ?auto_171918 ?auto_171916 ) ) ( not ( = ?auto_171918 ?auto_171915 ) ) ( not ( = ?auto_171917 ?auto_171919 ) ) ( not ( = ?auto_171917 ?auto_171916 ) ) ( not ( = ?auto_171917 ?auto_171915 ) ) ( not ( = ?auto_171912 ?auto_171918 ) ) ( not ( = ?auto_171912 ?auto_171917 ) ) ( not ( = ?auto_171913 ?auto_171918 ) ) ( not ( = ?auto_171913 ?auto_171917 ) ) ( not ( = ?auto_171914 ?auto_171918 ) ) ( not ( = ?auto_171914 ?auto_171917 ) ) ( ON ?auto_171914 ?auto_171915 ) ( ON ?auto_171913 ?auto_171914 ) ( CLEAR ?auto_171913 ) ( HOLDING ?auto_171912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_171912 )
      ( MAKE-5PILE ?auto_171912 ?auto_171913 ?auto_171914 ?auto_171915 ?auto_171916 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171920 - BLOCK
      ?auto_171921 - BLOCK
      ?auto_171922 - BLOCK
      ?auto_171923 - BLOCK
      ?auto_171924 - BLOCK
    )
    :vars
    (
      ?auto_171927 - BLOCK
      ?auto_171925 - BLOCK
      ?auto_171926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171920 ?auto_171921 ) ) ( not ( = ?auto_171920 ?auto_171922 ) ) ( not ( = ?auto_171920 ?auto_171923 ) ) ( not ( = ?auto_171920 ?auto_171924 ) ) ( not ( = ?auto_171921 ?auto_171922 ) ) ( not ( = ?auto_171921 ?auto_171923 ) ) ( not ( = ?auto_171921 ?auto_171924 ) ) ( not ( = ?auto_171922 ?auto_171923 ) ) ( not ( = ?auto_171922 ?auto_171924 ) ) ( not ( = ?auto_171923 ?auto_171924 ) ) ( ON ?auto_171924 ?auto_171927 ) ( not ( = ?auto_171920 ?auto_171927 ) ) ( not ( = ?auto_171921 ?auto_171927 ) ) ( not ( = ?auto_171922 ?auto_171927 ) ) ( not ( = ?auto_171923 ?auto_171927 ) ) ( not ( = ?auto_171924 ?auto_171927 ) ) ( ON ?auto_171923 ?auto_171924 ) ( ON-TABLE ?auto_171925 ) ( ON ?auto_171926 ?auto_171925 ) ( ON ?auto_171927 ?auto_171926 ) ( not ( = ?auto_171925 ?auto_171926 ) ) ( not ( = ?auto_171925 ?auto_171927 ) ) ( not ( = ?auto_171925 ?auto_171924 ) ) ( not ( = ?auto_171925 ?auto_171923 ) ) ( not ( = ?auto_171926 ?auto_171927 ) ) ( not ( = ?auto_171926 ?auto_171924 ) ) ( not ( = ?auto_171926 ?auto_171923 ) ) ( not ( = ?auto_171920 ?auto_171925 ) ) ( not ( = ?auto_171920 ?auto_171926 ) ) ( not ( = ?auto_171921 ?auto_171925 ) ) ( not ( = ?auto_171921 ?auto_171926 ) ) ( not ( = ?auto_171922 ?auto_171925 ) ) ( not ( = ?auto_171922 ?auto_171926 ) ) ( ON ?auto_171922 ?auto_171923 ) ( ON ?auto_171921 ?auto_171922 ) ( ON ?auto_171920 ?auto_171921 ) ( CLEAR ?auto_171920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171925 ?auto_171926 ?auto_171927 ?auto_171924 ?auto_171923 ?auto_171922 ?auto_171921 )
      ( MAKE-5PILE ?auto_171920 ?auto_171921 ?auto_171922 ?auto_171923 ?auto_171924 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171933 - BLOCK
      ?auto_171934 - BLOCK
      ?auto_171935 - BLOCK
      ?auto_171936 - BLOCK
      ?auto_171937 - BLOCK
    )
    :vars
    (
      ?auto_171938 - BLOCK
      ?auto_171939 - BLOCK
      ?auto_171940 - BLOCK
      ?auto_171941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171933 ?auto_171934 ) ) ( not ( = ?auto_171933 ?auto_171935 ) ) ( not ( = ?auto_171933 ?auto_171936 ) ) ( not ( = ?auto_171933 ?auto_171937 ) ) ( not ( = ?auto_171934 ?auto_171935 ) ) ( not ( = ?auto_171934 ?auto_171936 ) ) ( not ( = ?auto_171934 ?auto_171937 ) ) ( not ( = ?auto_171935 ?auto_171936 ) ) ( not ( = ?auto_171935 ?auto_171937 ) ) ( not ( = ?auto_171936 ?auto_171937 ) ) ( ON ?auto_171937 ?auto_171938 ) ( not ( = ?auto_171933 ?auto_171938 ) ) ( not ( = ?auto_171934 ?auto_171938 ) ) ( not ( = ?auto_171935 ?auto_171938 ) ) ( not ( = ?auto_171936 ?auto_171938 ) ) ( not ( = ?auto_171937 ?auto_171938 ) ) ( ON ?auto_171936 ?auto_171937 ) ( ON-TABLE ?auto_171939 ) ( ON ?auto_171940 ?auto_171939 ) ( ON ?auto_171938 ?auto_171940 ) ( not ( = ?auto_171939 ?auto_171940 ) ) ( not ( = ?auto_171939 ?auto_171938 ) ) ( not ( = ?auto_171939 ?auto_171937 ) ) ( not ( = ?auto_171939 ?auto_171936 ) ) ( not ( = ?auto_171940 ?auto_171938 ) ) ( not ( = ?auto_171940 ?auto_171937 ) ) ( not ( = ?auto_171940 ?auto_171936 ) ) ( not ( = ?auto_171933 ?auto_171939 ) ) ( not ( = ?auto_171933 ?auto_171940 ) ) ( not ( = ?auto_171934 ?auto_171939 ) ) ( not ( = ?auto_171934 ?auto_171940 ) ) ( not ( = ?auto_171935 ?auto_171939 ) ) ( not ( = ?auto_171935 ?auto_171940 ) ) ( ON ?auto_171935 ?auto_171936 ) ( ON ?auto_171934 ?auto_171935 ) ( CLEAR ?auto_171934 ) ( ON ?auto_171933 ?auto_171941 ) ( CLEAR ?auto_171933 ) ( HAND-EMPTY ) ( not ( = ?auto_171933 ?auto_171941 ) ) ( not ( = ?auto_171934 ?auto_171941 ) ) ( not ( = ?auto_171935 ?auto_171941 ) ) ( not ( = ?auto_171936 ?auto_171941 ) ) ( not ( = ?auto_171937 ?auto_171941 ) ) ( not ( = ?auto_171938 ?auto_171941 ) ) ( not ( = ?auto_171939 ?auto_171941 ) ) ( not ( = ?auto_171940 ?auto_171941 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_171933 ?auto_171941 )
      ( MAKE-5PILE ?auto_171933 ?auto_171934 ?auto_171935 ?auto_171936 ?auto_171937 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171942 - BLOCK
      ?auto_171943 - BLOCK
      ?auto_171944 - BLOCK
      ?auto_171945 - BLOCK
      ?auto_171946 - BLOCK
    )
    :vars
    (
      ?auto_171949 - BLOCK
      ?auto_171947 - BLOCK
      ?auto_171948 - BLOCK
      ?auto_171950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171942 ?auto_171943 ) ) ( not ( = ?auto_171942 ?auto_171944 ) ) ( not ( = ?auto_171942 ?auto_171945 ) ) ( not ( = ?auto_171942 ?auto_171946 ) ) ( not ( = ?auto_171943 ?auto_171944 ) ) ( not ( = ?auto_171943 ?auto_171945 ) ) ( not ( = ?auto_171943 ?auto_171946 ) ) ( not ( = ?auto_171944 ?auto_171945 ) ) ( not ( = ?auto_171944 ?auto_171946 ) ) ( not ( = ?auto_171945 ?auto_171946 ) ) ( ON ?auto_171946 ?auto_171949 ) ( not ( = ?auto_171942 ?auto_171949 ) ) ( not ( = ?auto_171943 ?auto_171949 ) ) ( not ( = ?auto_171944 ?auto_171949 ) ) ( not ( = ?auto_171945 ?auto_171949 ) ) ( not ( = ?auto_171946 ?auto_171949 ) ) ( ON ?auto_171945 ?auto_171946 ) ( ON-TABLE ?auto_171947 ) ( ON ?auto_171948 ?auto_171947 ) ( ON ?auto_171949 ?auto_171948 ) ( not ( = ?auto_171947 ?auto_171948 ) ) ( not ( = ?auto_171947 ?auto_171949 ) ) ( not ( = ?auto_171947 ?auto_171946 ) ) ( not ( = ?auto_171947 ?auto_171945 ) ) ( not ( = ?auto_171948 ?auto_171949 ) ) ( not ( = ?auto_171948 ?auto_171946 ) ) ( not ( = ?auto_171948 ?auto_171945 ) ) ( not ( = ?auto_171942 ?auto_171947 ) ) ( not ( = ?auto_171942 ?auto_171948 ) ) ( not ( = ?auto_171943 ?auto_171947 ) ) ( not ( = ?auto_171943 ?auto_171948 ) ) ( not ( = ?auto_171944 ?auto_171947 ) ) ( not ( = ?auto_171944 ?auto_171948 ) ) ( ON ?auto_171944 ?auto_171945 ) ( ON ?auto_171942 ?auto_171950 ) ( CLEAR ?auto_171942 ) ( not ( = ?auto_171942 ?auto_171950 ) ) ( not ( = ?auto_171943 ?auto_171950 ) ) ( not ( = ?auto_171944 ?auto_171950 ) ) ( not ( = ?auto_171945 ?auto_171950 ) ) ( not ( = ?auto_171946 ?auto_171950 ) ) ( not ( = ?auto_171949 ?auto_171950 ) ) ( not ( = ?auto_171947 ?auto_171950 ) ) ( not ( = ?auto_171948 ?auto_171950 ) ) ( HOLDING ?auto_171943 ) ( CLEAR ?auto_171944 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_171947 ?auto_171948 ?auto_171949 ?auto_171946 ?auto_171945 ?auto_171944 ?auto_171943 )
      ( MAKE-5PILE ?auto_171942 ?auto_171943 ?auto_171944 ?auto_171945 ?auto_171946 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171951 - BLOCK
      ?auto_171952 - BLOCK
      ?auto_171953 - BLOCK
      ?auto_171954 - BLOCK
      ?auto_171955 - BLOCK
    )
    :vars
    (
      ?auto_171956 - BLOCK
      ?auto_171957 - BLOCK
      ?auto_171958 - BLOCK
      ?auto_171959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171951 ?auto_171952 ) ) ( not ( = ?auto_171951 ?auto_171953 ) ) ( not ( = ?auto_171951 ?auto_171954 ) ) ( not ( = ?auto_171951 ?auto_171955 ) ) ( not ( = ?auto_171952 ?auto_171953 ) ) ( not ( = ?auto_171952 ?auto_171954 ) ) ( not ( = ?auto_171952 ?auto_171955 ) ) ( not ( = ?auto_171953 ?auto_171954 ) ) ( not ( = ?auto_171953 ?auto_171955 ) ) ( not ( = ?auto_171954 ?auto_171955 ) ) ( ON ?auto_171955 ?auto_171956 ) ( not ( = ?auto_171951 ?auto_171956 ) ) ( not ( = ?auto_171952 ?auto_171956 ) ) ( not ( = ?auto_171953 ?auto_171956 ) ) ( not ( = ?auto_171954 ?auto_171956 ) ) ( not ( = ?auto_171955 ?auto_171956 ) ) ( ON ?auto_171954 ?auto_171955 ) ( ON-TABLE ?auto_171957 ) ( ON ?auto_171958 ?auto_171957 ) ( ON ?auto_171956 ?auto_171958 ) ( not ( = ?auto_171957 ?auto_171958 ) ) ( not ( = ?auto_171957 ?auto_171956 ) ) ( not ( = ?auto_171957 ?auto_171955 ) ) ( not ( = ?auto_171957 ?auto_171954 ) ) ( not ( = ?auto_171958 ?auto_171956 ) ) ( not ( = ?auto_171958 ?auto_171955 ) ) ( not ( = ?auto_171958 ?auto_171954 ) ) ( not ( = ?auto_171951 ?auto_171957 ) ) ( not ( = ?auto_171951 ?auto_171958 ) ) ( not ( = ?auto_171952 ?auto_171957 ) ) ( not ( = ?auto_171952 ?auto_171958 ) ) ( not ( = ?auto_171953 ?auto_171957 ) ) ( not ( = ?auto_171953 ?auto_171958 ) ) ( ON ?auto_171953 ?auto_171954 ) ( ON ?auto_171951 ?auto_171959 ) ( not ( = ?auto_171951 ?auto_171959 ) ) ( not ( = ?auto_171952 ?auto_171959 ) ) ( not ( = ?auto_171953 ?auto_171959 ) ) ( not ( = ?auto_171954 ?auto_171959 ) ) ( not ( = ?auto_171955 ?auto_171959 ) ) ( not ( = ?auto_171956 ?auto_171959 ) ) ( not ( = ?auto_171957 ?auto_171959 ) ) ( not ( = ?auto_171958 ?auto_171959 ) ) ( CLEAR ?auto_171953 ) ( ON ?auto_171952 ?auto_171951 ) ( CLEAR ?auto_171952 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_171959 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_171959 ?auto_171951 )
      ( MAKE-5PILE ?auto_171951 ?auto_171952 ?auto_171953 ?auto_171954 ?auto_171955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171960 - BLOCK
      ?auto_171961 - BLOCK
      ?auto_171962 - BLOCK
      ?auto_171963 - BLOCK
      ?auto_171964 - BLOCK
    )
    :vars
    (
      ?auto_171965 - BLOCK
      ?auto_171968 - BLOCK
      ?auto_171966 - BLOCK
      ?auto_171967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171960 ?auto_171961 ) ) ( not ( = ?auto_171960 ?auto_171962 ) ) ( not ( = ?auto_171960 ?auto_171963 ) ) ( not ( = ?auto_171960 ?auto_171964 ) ) ( not ( = ?auto_171961 ?auto_171962 ) ) ( not ( = ?auto_171961 ?auto_171963 ) ) ( not ( = ?auto_171961 ?auto_171964 ) ) ( not ( = ?auto_171962 ?auto_171963 ) ) ( not ( = ?auto_171962 ?auto_171964 ) ) ( not ( = ?auto_171963 ?auto_171964 ) ) ( ON ?auto_171964 ?auto_171965 ) ( not ( = ?auto_171960 ?auto_171965 ) ) ( not ( = ?auto_171961 ?auto_171965 ) ) ( not ( = ?auto_171962 ?auto_171965 ) ) ( not ( = ?auto_171963 ?auto_171965 ) ) ( not ( = ?auto_171964 ?auto_171965 ) ) ( ON ?auto_171963 ?auto_171964 ) ( ON-TABLE ?auto_171968 ) ( ON ?auto_171966 ?auto_171968 ) ( ON ?auto_171965 ?auto_171966 ) ( not ( = ?auto_171968 ?auto_171966 ) ) ( not ( = ?auto_171968 ?auto_171965 ) ) ( not ( = ?auto_171968 ?auto_171964 ) ) ( not ( = ?auto_171968 ?auto_171963 ) ) ( not ( = ?auto_171966 ?auto_171965 ) ) ( not ( = ?auto_171966 ?auto_171964 ) ) ( not ( = ?auto_171966 ?auto_171963 ) ) ( not ( = ?auto_171960 ?auto_171968 ) ) ( not ( = ?auto_171960 ?auto_171966 ) ) ( not ( = ?auto_171961 ?auto_171968 ) ) ( not ( = ?auto_171961 ?auto_171966 ) ) ( not ( = ?auto_171962 ?auto_171968 ) ) ( not ( = ?auto_171962 ?auto_171966 ) ) ( ON ?auto_171960 ?auto_171967 ) ( not ( = ?auto_171960 ?auto_171967 ) ) ( not ( = ?auto_171961 ?auto_171967 ) ) ( not ( = ?auto_171962 ?auto_171967 ) ) ( not ( = ?auto_171963 ?auto_171967 ) ) ( not ( = ?auto_171964 ?auto_171967 ) ) ( not ( = ?auto_171965 ?auto_171967 ) ) ( not ( = ?auto_171968 ?auto_171967 ) ) ( not ( = ?auto_171966 ?auto_171967 ) ) ( ON ?auto_171961 ?auto_171960 ) ( CLEAR ?auto_171961 ) ( ON-TABLE ?auto_171967 ) ( HOLDING ?auto_171962 ) ( CLEAR ?auto_171963 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_171968 ?auto_171966 ?auto_171965 ?auto_171964 ?auto_171963 ?auto_171962 )
      ( MAKE-5PILE ?auto_171960 ?auto_171961 ?auto_171962 ?auto_171963 ?auto_171964 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171969 - BLOCK
      ?auto_171970 - BLOCK
      ?auto_171971 - BLOCK
      ?auto_171972 - BLOCK
      ?auto_171973 - BLOCK
    )
    :vars
    (
      ?auto_171975 - BLOCK
      ?auto_171974 - BLOCK
      ?auto_171976 - BLOCK
      ?auto_171977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171969 ?auto_171970 ) ) ( not ( = ?auto_171969 ?auto_171971 ) ) ( not ( = ?auto_171969 ?auto_171972 ) ) ( not ( = ?auto_171969 ?auto_171973 ) ) ( not ( = ?auto_171970 ?auto_171971 ) ) ( not ( = ?auto_171970 ?auto_171972 ) ) ( not ( = ?auto_171970 ?auto_171973 ) ) ( not ( = ?auto_171971 ?auto_171972 ) ) ( not ( = ?auto_171971 ?auto_171973 ) ) ( not ( = ?auto_171972 ?auto_171973 ) ) ( ON ?auto_171973 ?auto_171975 ) ( not ( = ?auto_171969 ?auto_171975 ) ) ( not ( = ?auto_171970 ?auto_171975 ) ) ( not ( = ?auto_171971 ?auto_171975 ) ) ( not ( = ?auto_171972 ?auto_171975 ) ) ( not ( = ?auto_171973 ?auto_171975 ) ) ( ON ?auto_171972 ?auto_171973 ) ( ON-TABLE ?auto_171974 ) ( ON ?auto_171976 ?auto_171974 ) ( ON ?auto_171975 ?auto_171976 ) ( not ( = ?auto_171974 ?auto_171976 ) ) ( not ( = ?auto_171974 ?auto_171975 ) ) ( not ( = ?auto_171974 ?auto_171973 ) ) ( not ( = ?auto_171974 ?auto_171972 ) ) ( not ( = ?auto_171976 ?auto_171975 ) ) ( not ( = ?auto_171976 ?auto_171973 ) ) ( not ( = ?auto_171976 ?auto_171972 ) ) ( not ( = ?auto_171969 ?auto_171974 ) ) ( not ( = ?auto_171969 ?auto_171976 ) ) ( not ( = ?auto_171970 ?auto_171974 ) ) ( not ( = ?auto_171970 ?auto_171976 ) ) ( not ( = ?auto_171971 ?auto_171974 ) ) ( not ( = ?auto_171971 ?auto_171976 ) ) ( ON ?auto_171969 ?auto_171977 ) ( not ( = ?auto_171969 ?auto_171977 ) ) ( not ( = ?auto_171970 ?auto_171977 ) ) ( not ( = ?auto_171971 ?auto_171977 ) ) ( not ( = ?auto_171972 ?auto_171977 ) ) ( not ( = ?auto_171973 ?auto_171977 ) ) ( not ( = ?auto_171975 ?auto_171977 ) ) ( not ( = ?auto_171974 ?auto_171977 ) ) ( not ( = ?auto_171976 ?auto_171977 ) ) ( ON ?auto_171970 ?auto_171969 ) ( ON-TABLE ?auto_171977 ) ( CLEAR ?auto_171972 ) ( ON ?auto_171971 ?auto_171970 ) ( CLEAR ?auto_171971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_171977 ?auto_171969 ?auto_171970 )
      ( MAKE-5PILE ?auto_171969 ?auto_171970 ?auto_171971 ?auto_171972 ?auto_171973 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171978 - BLOCK
      ?auto_171979 - BLOCK
      ?auto_171980 - BLOCK
      ?auto_171981 - BLOCK
      ?auto_171982 - BLOCK
    )
    :vars
    (
      ?auto_171986 - BLOCK
      ?auto_171985 - BLOCK
      ?auto_171984 - BLOCK
      ?auto_171983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171978 ?auto_171979 ) ) ( not ( = ?auto_171978 ?auto_171980 ) ) ( not ( = ?auto_171978 ?auto_171981 ) ) ( not ( = ?auto_171978 ?auto_171982 ) ) ( not ( = ?auto_171979 ?auto_171980 ) ) ( not ( = ?auto_171979 ?auto_171981 ) ) ( not ( = ?auto_171979 ?auto_171982 ) ) ( not ( = ?auto_171980 ?auto_171981 ) ) ( not ( = ?auto_171980 ?auto_171982 ) ) ( not ( = ?auto_171981 ?auto_171982 ) ) ( ON ?auto_171982 ?auto_171986 ) ( not ( = ?auto_171978 ?auto_171986 ) ) ( not ( = ?auto_171979 ?auto_171986 ) ) ( not ( = ?auto_171980 ?auto_171986 ) ) ( not ( = ?auto_171981 ?auto_171986 ) ) ( not ( = ?auto_171982 ?auto_171986 ) ) ( ON-TABLE ?auto_171985 ) ( ON ?auto_171984 ?auto_171985 ) ( ON ?auto_171986 ?auto_171984 ) ( not ( = ?auto_171985 ?auto_171984 ) ) ( not ( = ?auto_171985 ?auto_171986 ) ) ( not ( = ?auto_171985 ?auto_171982 ) ) ( not ( = ?auto_171985 ?auto_171981 ) ) ( not ( = ?auto_171984 ?auto_171986 ) ) ( not ( = ?auto_171984 ?auto_171982 ) ) ( not ( = ?auto_171984 ?auto_171981 ) ) ( not ( = ?auto_171978 ?auto_171985 ) ) ( not ( = ?auto_171978 ?auto_171984 ) ) ( not ( = ?auto_171979 ?auto_171985 ) ) ( not ( = ?auto_171979 ?auto_171984 ) ) ( not ( = ?auto_171980 ?auto_171985 ) ) ( not ( = ?auto_171980 ?auto_171984 ) ) ( ON ?auto_171978 ?auto_171983 ) ( not ( = ?auto_171978 ?auto_171983 ) ) ( not ( = ?auto_171979 ?auto_171983 ) ) ( not ( = ?auto_171980 ?auto_171983 ) ) ( not ( = ?auto_171981 ?auto_171983 ) ) ( not ( = ?auto_171982 ?auto_171983 ) ) ( not ( = ?auto_171986 ?auto_171983 ) ) ( not ( = ?auto_171985 ?auto_171983 ) ) ( not ( = ?auto_171984 ?auto_171983 ) ) ( ON ?auto_171979 ?auto_171978 ) ( ON-TABLE ?auto_171983 ) ( ON ?auto_171980 ?auto_171979 ) ( CLEAR ?auto_171980 ) ( HOLDING ?auto_171981 ) ( CLEAR ?auto_171982 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_171985 ?auto_171984 ?auto_171986 ?auto_171982 ?auto_171981 )
      ( MAKE-5PILE ?auto_171978 ?auto_171979 ?auto_171980 ?auto_171981 ?auto_171982 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171987 - BLOCK
      ?auto_171988 - BLOCK
      ?auto_171989 - BLOCK
      ?auto_171990 - BLOCK
      ?auto_171991 - BLOCK
    )
    :vars
    (
      ?auto_171993 - BLOCK
      ?auto_171994 - BLOCK
      ?auto_171992 - BLOCK
      ?auto_171995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171987 ?auto_171988 ) ) ( not ( = ?auto_171987 ?auto_171989 ) ) ( not ( = ?auto_171987 ?auto_171990 ) ) ( not ( = ?auto_171987 ?auto_171991 ) ) ( not ( = ?auto_171988 ?auto_171989 ) ) ( not ( = ?auto_171988 ?auto_171990 ) ) ( not ( = ?auto_171988 ?auto_171991 ) ) ( not ( = ?auto_171989 ?auto_171990 ) ) ( not ( = ?auto_171989 ?auto_171991 ) ) ( not ( = ?auto_171990 ?auto_171991 ) ) ( ON ?auto_171991 ?auto_171993 ) ( not ( = ?auto_171987 ?auto_171993 ) ) ( not ( = ?auto_171988 ?auto_171993 ) ) ( not ( = ?auto_171989 ?auto_171993 ) ) ( not ( = ?auto_171990 ?auto_171993 ) ) ( not ( = ?auto_171991 ?auto_171993 ) ) ( ON-TABLE ?auto_171994 ) ( ON ?auto_171992 ?auto_171994 ) ( ON ?auto_171993 ?auto_171992 ) ( not ( = ?auto_171994 ?auto_171992 ) ) ( not ( = ?auto_171994 ?auto_171993 ) ) ( not ( = ?auto_171994 ?auto_171991 ) ) ( not ( = ?auto_171994 ?auto_171990 ) ) ( not ( = ?auto_171992 ?auto_171993 ) ) ( not ( = ?auto_171992 ?auto_171991 ) ) ( not ( = ?auto_171992 ?auto_171990 ) ) ( not ( = ?auto_171987 ?auto_171994 ) ) ( not ( = ?auto_171987 ?auto_171992 ) ) ( not ( = ?auto_171988 ?auto_171994 ) ) ( not ( = ?auto_171988 ?auto_171992 ) ) ( not ( = ?auto_171989 ?auto_171994 ) ) ( not ( = ?auto_171989 ?auto_171992 ) ) ( ON ?auto_171987 ?auto_171995 ) ( not ( = ?auto_171987 ?auto_171995 ) ) ( not ( = ?auto_171988 ?auto_171995 ) ) ( not ( = ?auto_171989 ?auto_171995 ) ) ( not ( = ?auto_171990 ?auto_171995 ) ) ( not ( = ?auto_171991 ?auto_171995 ) ) ( not ( = ?auto_171993 ?auto_171995 ) ) ( not ( = ?auto_171994 ?auto_171995 ) ) ( not ( = ?auto_171992 ?auto_171995 ) ) ( ON ?auto_171988 ?auto_171987 ) ( ON-TABLE ?auto_171995 ) ( ON ?auto_171989 ?auto_171988 ) ( CLEAR ?auto_171991 ) ( ON ?auto_171990 ?auto_171989 ) ( CLEAR ?auto_171990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_171995 ?auto_171987 ?auto_171988 ?auto_171989 )
      ( MAKE-5PILE ?auto_171987 ?auto_171988 ?auto_171989 ?auto_171990 ?auto_171991 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_171996 - BLOCK
      ?auto_171997 - BLOCK
      ?auto_171998 - BLOCK
      ?auto_171999 - BLOCK
      ?auto_172000 - BLOCK
    )
    :vars
    (
      ?auto_172001 - BLOCK
      ?auto_172002 - BLOCK
      ?auto_172003 - BLOCK
      ?auto_172004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_171996 ?auto_171997 ) ) ( not ( = ?auto_171996 ?auto_171998 ) ) ( not ( = ?auto_171996 ?auto_171999 ) ) ( not ( = ?auto_171996 ?auto_172000 ) ) ( not ( = ?auto_171997 ?auto_171998 ) ) ( not ( = ?auto_171997 ?auto_171999 ) ) ( not ( = ?auto_171997 ?auto_172000 ) ) ( not ( = ?auto_171998 ?auto_171999 ) ) ( not ( = ?auto_171998 ?auto_172000 ) ) ( not ( = ?auto_171999 ?auto_172000 ) ) ( not ( = ?auto_171996 ?auto_172001 ) ) ( not ( = ?auto_171997 ?auto_172001 ) ) ( not ( = ?auto_171998 ?auto_172001 ) ) ( not ( = ?auto_171999 ?auto_172001 ) ) ( not ( = ?auto_172000 ?auto_172001 ) ) ( ON-TABLE ?auto_172002 ) ( ON ?auto_172003 ?auto_172002 ) ( ON ?auto_172001 ?auto_172003 ) ( not ( = ?auto_172002 ?auto_172003 ) ) ( not ( = ?auto_172002 ?auto_172001 ) ) ( not ( = ?auto_172002 ?auto_172000 ) ) ( not ( = ?auto_172002 ?auto_171999 ) ) ( not ( = ?auto_172003 ?auto_172001 ) ) ( not ( = ?auto_172003 ?auto_172000 ) ) ( not ( = ?auto_172003 ?auto_171999 ) ) ( not ( = ?auto_171996 ?auto_172002 ) ) ( not ( = ?auto_171996 ?auto_172003 ) ) ( not ( = ?auto_171997 ?auto_172002 ) ) ( not ( = ?auto_171997 ?auto_172003 ) ) ( not ( = ?auto_171998 ?auto_172002 ) ) ( not ( = ?auto_171998 ?auto_172003 ) ) ( ON ?auto_171996 ?auto_172004 ) ( not ( = ?auto_171996 ?auto_172004 ) ) ( not ( = ?auto_171997 ?auto_172004 ) ) ( not ( = ?auto_171998 ?auto_172004 ) ) ( not ( = ?auto_171999 ?auto_172004 ) ) ( not ( = ?auto_172000 ?auto_172004 ) ) ( not ( = ?auto_172001 ?auto_172004 ) ) ( not ( = ?auto_172002 ?auto_172004 ) ) ( not ( = ?auto_172003 ?auto_172004 ) ) ( ON ?auto_171997 ?auto_171996 ) ( ON-TABLE ?auto_172004 ) ( ON ?auto_171998 ?auto_171997 ) ( ON ?auto_171999 ?auto_171998 ) ( CLEAR ?auto_171999 ) ( HOLDING ?auto_172000 ) ( CLEAR ?auto_172001 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172002 ?auto_172003 ?auto_172001 ?auto_172000 )
      ( MAKE-5PILE ?auto_171996 ?auto_171997 ?auto_171998 ?auto_171999 ?auto_172000 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172005 - BLOCK
      ?auto_172006 - BLOCK
      ?auto_172007 - BLOCK
      ?auto_172008 - BLOCK
      ?auto_172009 - BLOCK
    )
    :vars
    (
      ?auto_172013 - BLOCK
      ?auto_172011 - BLOCK
      ?auto_172012 - BLOCK
      ?auto_172010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172005 ?auto_172006 ) ) ( not ( = ?auto_172005 ?auto_172007 ) ) ( not ( = ?auto_172005 ?auto_172008 ) ) ( not ( = ?auto_172005 ?auto_172009 ) ) ( not ( = ?auto_172006 ?auto_172007 ) ) ( not ( = ?auto_172006 ?auto_172008 ) ) ( not ( = ?auto_172006 ?auto_172009 ) ) ( not ( = ?auto_172007 ?auto_172008 ) ) ( not ( = ?auto_172007 ?auto_172009 ) ) ( not ( = ?auto_172008 ?auto_172009 ) ) ( not ( = ?auto_172005 ?auto_172013 ) ) ( not ( = ?auto_172006 ?auto_172013 ) ) ( not ( = ?auto_172007 ?auto_172013 ) ) ( not ( = ?auto_172008 ?auto_172013 ) ) ( not ( = ?auto_172009 ?auto_172013 ) ) ( ON-TABLE ?auto_172011 ) ( ON ?auto_172012 ?auto_172011 ) ( ON ?auto_172013 ?auto_172012 ) ( not ( = ?auto_172011 ?auto_172012 ) ) ( not ( = ?auto_172011 ?auto_172013 ) ) ( not ( = ?auto_172011 ?auto_172009 ) ) ( not ( = ?auto_172011 ?auto_172008 ) ) ( not ( = ?auto_172012 ?auto_172013 ) ) ( not ( = ?auto_172012 ?auto_172009 ) ) ( not ( = ?auto_172012 ?auto_172008 ) ) ( not ( = ?auto_172005 ?auto_172011 ) ) ( not ( = ?auto_172005 ?auto_172012 ) ) ( not ( = ?auto_172006 ?auto_172011 ) ) ( not ( = ?auto_172006 ?auto_172012 ) ) ( not ( = ?auto_172007 ?auto_172011 ) ) ( not ( = ?auto_172007 ?auto_172012 ) ) ( ON ?auto_172005 ?auto_172010 ) ( not ( = ?auto_172005 ?auto_172010 ) ) ( not ( = ?auto_172006 ?auto_172010 ) ) ( not ( = ?auto_172007 ?auto_172010 ) ) ( not ( = ?auto_172008 ?auto_172010 ) ) ( not ( = ?auto_172009 ?auto_172010 ) ) ( not ( = ?auto_172013 ?auto_172010 ) ) ( not ( = ?auto_172011 ?auto_172010 ) ) ( not ( = ?auto_172012 ?auto_172010 ) ) ( ON ?auto_172006 ?auto_172005 ) ( ON-TABLE ?auto_172010 ) ( ON ?auto_172007 ?auto_172006 ) ( ON ?auto_172008 ?auto_172007 ) ( CLEAR ?auto_172013 ) ( ON ?auto_172009 ?auto_172008 ) ( CLEAR ?auto_172009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172010 ?auto_172005 ?auto_172006 ?auto_172007 ?auto_172008 )
      ( MAKE-5PILE ?auto_172005 ?auto_172006 ?auto_172007 ?auto_172008 ?auto_172009 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172014 - BLOCK
      ?auto_172015 - BLOCK
      ?auto_172016 - BLOCK
      ?auto_172017 - BLOCK
      ?auto_172018 - BLOCK
    )
    :vars
    (
      ?auto_172020 - BLOCK
      ?auto_172022 - BLOCK
      ?auto_172021 - BLOCK
      ?auto_172019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172014 ?auto_172015 ) ) ( not ( = ?auto_172014 ?auto_172016 ) ) ( not ( = ?auto_172014 ?auto_172017 ) ) ( not ( = ?auto_172014 ?auto_172018 ) ) ( not ( = ?auto_172015 ?auto_172016 ) ) ( not ( = ?auto_172015 ?auto_172017 ) ) ( not ( = ?auto_172015 ?auto_172018 ) ) ( not ( = ?auto_172016 ?auto_172017 ) ) ( not ( = ?auto_172016 ?auto_172018 ) ) ( not ( = ?auto_172017 ?auto_172018 ) ) ( not ( = ?auto_172014 ?auto_172020 ) ) ( not ( = ?auto_172015 ?auto_172020 ) ) ( not ( = ?auto_172016 ?auto_172020 ) ) ( not ( = ?auto_172017 ?auto_172020 ) ) ( not ( = ?auto_172018 ?auto_172020 ) ) ( ON-TABLE ?auto_172022 ) ( ON ?auto_172021 ?auto_172022 ) ( not ( = ?auto_172022 ?auto_172021 ) ) ( not ( = ?auto_172022 ?auto_172020 ) ) ( not ( = ?auto_172022 ?auto_172018 ) ) ( not ( = ?auto_172022 ?auto_172017 ) ) ( not ( = ?auto_172021 ?auto_172020 ) ) ( not ( = ?auto_172021 ?auto_172018 ) ) ( not ( = ?auto_172021 ?auto_172017 ) ) ( not ( = ?auto_172014 ?auto_172022 ) ) ( not ( = ?auto_172014 ?auto_172021 ) ) ( not ( = ?auto_172015 ?auto_172022 ) ) ( not ( = ?auto_172015 ?auto_172021 ) ) ( not ( = ?auto_172016 ?auto_172022 ) ) ( not ( = ?auto_172016 ?auto_172021 ) ) ( ON ?auto_172014 ?auto_172019 ) ( not ( = ?auto_172014 ?auto_172019 ) ) ( not ( = ?auto_172015 ?auto_172019 ) ) ( not ( = ?auto_172016 ?auto_172019 ) ) ( not ( = ?auto_172017 ?auto_172019 ) ) ( not ( = ?auto_172018 ?auto_172019 ) ) ( not ( = ?auto_172020 ?auto_172019 ) ) ( not ( = ?auto_172022 ?auto_172019 ) ) ( not ( = ?auto_172021 ?auto_172019 ) ) ( ON ?auto_172015 ?auto_172014 ) ( ON-TABLE ?auto_172019 ) ( ON ?auto_172016 ?auto_172015 ) ( ON ?auto_172017 ?auto_172016 ) ( ON ?auto_172018 ?auto_172017 ) ( CLEAR ?auto_172018 ) ( HOLDING ?auto_172020 ) ( CLEAR ?auto_172021 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172022 ?auto_172021 ?auto_172020 )
      ( MAKE-5PILE ?auto_172014 ?auto_172015 ?auto_172016 ?auto_172017 ?auto_172018 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172023 - BLOCK
      ?auto_172024 - BLOCK
      ?auto_172025 - BLOCK
      ?auto_172026 - BLOCK
      ?auto_172027 - BLOCK
    )
    :vars
    (
      ?auto_172030 - BLOCK
      ?auto_172029 - BLOCK
      ?auto_172031 - BLOCK
      ?auto_172028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172023 ?auto_172024 ) ) ( not ( = ?auto_172023 ?auto_172025 ) ) ( not ( = ?auto_172023 ?auto_172026 ) ) ( not ( = ?auto_172023 ?auto_172027 ) ) ( not ( = ?auto_172024 ?auto_172025 ) ) ( not ( = ?auto_172024 ?auto_172026 ) ) ( not ( = ?auto_172024 ?auto_172027 ) ) ( not ( = ?auto_172025 ?auto_172026 ) ) ( not ( = ?auto_172025 ?auto_172027 ) ) ( not ( = ?auto_172026 ?auto_172027 ) ) ( not ( = ?auto_172023 ?auto_172030 ) ) ( not ( = ?auto_172024 ?auto_172030 ) ) ( not ( = ?auto_172025 ?auto_172030 ) ) ( not ( = ?auto_172026 ?auto_172030 ) ) ( not ( = ?auto_172027 ?auto_172030 ) ) ( ON-TABLE ?auto_172029 ) ( ON ?auto_172031 ?auto_172029 ) ( not ( = ?auto_172029 ?auto_172031 ) ) ( not ( = ?auto_172029 ?auto_172030 ) ) ( not ( = ?auto_172029 ?auto_172027 ) ) ( not ( = ?auto_172029 ?auto_172026 ) ) ( not ( = ?auto_172031 ?auto_172030 ) ) ( not ( = ?auto_172031 ?auto_172027 ) ) ( not ( = ?auto_172031 ?auto_172026 ) ) ( not ( = ?auto_172023 ?auto_172029 ) ) ( not ( = ?auto_172023 ?auto_172031 ) ) ( not ( = ?auto_172024 ?auto_172029 ) ) ( not ( = ?auto_172024 ?auto_172031 ) ) ( not ( = ?auto_172025 ?auto_172029 ) ) ( not ( = ?auto_172025 ?auto_172031 ) ) ( ON ?auto_172023 ?auto_172028 ) ( not ( = ?auto_172023 ?auto_172028 ) ) ( not ( = ?auto_172024 ?auto_172028 ) ) ( not ( = ?auto_172025 ?auto_172028 ) ) ( not ( = ?auto_172026 ?auto_172028 ) ) ( not ( = ?auto_172027 ?auto_172028 ) ) ( not ( = ?auto_172030 ?auto_172028 ) ) ( not ( = ?auto_172029 ?auto_172028 ) ) ( not ( = ?auto_172031 ?auto_172028 ) ) ( ON ?auto_172024 ?auto_172023 ) ( ON-TABLE ?auto_172028 ) ( ON ?auto_172025 ?auto_172024 ) ( ON ?auto_172026 ?auto_172025 ) ( ON ?auto_172027 ?auto_172026 ) ( CLEAR ?auto_172031 ) ( ON ?auto_172030 ?auto_172027 ) ( CLEAR ?auto_172030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172028 ?auto_172023 ?auto_172024 ?auto_172025 ?auto_172026 ?auto_172027 )
      ( MAKE-5PILE ?auto_172023 ?auto_172024 ?auto_172025 ?auto_172026 ?auto_172027 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172032 - BLOCK
      ?auto_172033 - BLOCK
      ?auto_172034 - BLOCK
      ?auto_172035 - BLOCK
      ?auto_172036 - BLOCK
    )
    :vars
    (
      ?auto_172039 - BLOCK
      ?auto_172040 - BLOCK
      ?auto_172038 - BLOCK
      ?auto_172037 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172032 ?auto_172033 ) ) ( not ( = ?auto_172032 ?auto_172034 ) ) ( not ( = ?auto_172032 ?auto_172035 ) ) ( not ( = ?auto_172032 ?auto_172036 ) ) ( not ( = ?auto_172033 ?auto_172034 ) ) ( not ( = ?auto_172033 ?auto_172035 ) ) ( not ( = ?auto_172033 ?auto_172036 ) ) ( not ( = ?auto_172034 ?auto_172035 ) ) ( not ( = ?auto_172034 ?auto_172036 ) ) ( not ( = ?auto_172035 ?auto_172036 ) ) ( not ( = ?auto_172032 ?auto_172039 ) ) ( not ( = ?auto_172033 ?auto_172039 ) ) ( not ( = ?auto_172034 ?auto_172039 ) ) ( not ( = ?auto_172035 ?auto_172039 ) ) ( not ( = ?auto_172036 ?auto_172039 ) ) ( ON-TABLE ?auto_172040 ) ( not ( = ?auto_172040 ?auto_172038 ) ) ( not ( = ?auto_172040 ?auto_172039 ) ) ( not ( = ?auto_172040 ?auto_172036 ) ) ( not ( = ?auto_172040 ?auto_172035 ) ) ( not ( = ?auto_172038 ?auto_172039 ) ) ( not ( = ?auto_172038 ?auto_172036 ) ) ( not ( = ?auto_172038 ?auto_172035 ) ) ( not ( = ?auto_172032 ?auto_172040 ) ) ( not ( = ?auto_172032 ?auto_172038 ) ) ( not ( = ?auto_172033 ?auto_172040 ) ) ( not ( = ?auto_172033 ?auto_172038 ) ) ( not ( = ?auto_172034 ?auto_172040 ) ) ( not ( = ?auto_172034 ?auto_172038 ) ) ( ON ?auto_172032 ?auto_172037 ) ( not ( = ?auto_172032 ?auto_172037 ) ) ( not ( = ?auto_172033 ?auto_172037 ) ) ( not ( = ?auto_172034 ?auto_172037 ) ) ( not ( = ?auto_172035 ?auto_172037 ) ) ( not ( = ?auto_172036 ?auto_172037 ) ) ( not ( = ?auto_172039 ?auto_172037 ) ) ( not ( = ?auto_172040 ?auto_172037 ) ) ( not ( = ?auto_172038 ?auto_172037 ) ) ( ON ?auto_172033 ?auto_172032 ) ( ON-TABLE ?auto_172037 ) ( ON ?auto_172034 ?auto_172033 ) ( ON ?auto_172035 ?auto_172034 ) ( ON ?auto_172036 ?auto_172035 ) ( ON ?auto_172039 ?auto_172036 ) ( CLEAR ?auto_172039 ) ( HOLDING ?auto_172038 ) ( CLEAR ?auto_172040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172040 ?auto_172038 )
      ( MAKE-5PILE ?auto_172032 ?auto_172033 ?auto_172034 ?auto_172035 ?auto_172036 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172041 - BLOCK
      ?auto_172042 - BLOCK
      ?auto_172043 - BLOCK
      ?auto_172044 - BLOCK
      ?auto_172045 - BLOCK
    )
    :vars
    (
      ?auto_172046 - BLOCK
      ?auto_172047 - BLOCK
      ?auto_172049 - BLOCK
      ?auto_172048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172041 ?auto_172042 ) ) ( not ( = ?auto_172041 ?auto_172043 ) ) ( not ( = ?auto_172041 ?auto_172044 ) ) ( not ( = ?auto_172041 ?auto_172045 ) ) ( not ( = ?auto_172042 ?auto_172043 ) ) ( not ( = ?auto_172042 ?auto_172044 ) ) ( not ( = ?auto_172042 ?auto_172045 ) ) ( not ( = ?auto_172043 ?auto_172044 ) ) ( not ( = ?auto_172043 ?auto_172045 ) ) ( not ( = ?auto_172044 ?auto_172045 ) ) ( not ( = ?auto_172041 ?auto_172046 ) ) ( not ( = ?auto_172042 ?auto_172046 ) ) ( not ( = ?auto_172043 ?auto_172046 ) ) ( not ( = ?auto_172044 ?auto_172046 ) ) ( not ( = ?auto_172045 ?auto_172046 ) ) ( ON-TABLE ?auto_172047 ) ( not ( = ?auto_172047 ?auto_172049 ) ) ( not ( = ?auto_172047 ?auto_172046 ) ) ( not ( = ?auto_172047 ?auto_172045 ) ) ( not ( = ?auto_172047 ?auto_172044 ) ) ( not ( = ?auto_172049 ?auto_172046 ) ) ( not ( = ?auto_172049 ?auto_172045 ) ) ( not ( = ?auto_172049 ?auto_172044 ) ) ( not ( = ?auto_172041 ?auto_172047 ) ) ( not ( = ?auto_172041 ?auto_172049 ) ) ( not ( = ?auto_172042 ?auto_172047 ) ) ( not ( = ?auto_172042 ?auto_172049 ) ) ( not ( = ?auto_172043 ?auto_172047 ) ) ( not ( = ?auto_172043 ?auto_172049 ) ) ( ON ?auto_172041 ?auto_172048 ) ( not ( = ?auto_172041 ?auto_172048 ) ) ( not ( = ?auto_172042 ?auto_172048 ) ) ( not ( = ?auto_172043 ?auto_172048 ) ) ( not ( = ?auto_172044 ?auto_172048 ) ) ( not ( = ?auto_172045 ?auto_172048 ) ) ( not ( = ?auto_172046 ?auto_172048 ) ) ( not ( = ?auto_172047 ?auto_172048 ) ) ( not ( = ?auto_172049 ?auto_172048 ) ) ( ON ?auto_172042 ?auto_172041 ) ( ON-TABLE ?auto_172048 ) ( ON ?auto_172043 ?auto_172042 ) ( ON ?auto_172044 ?auto_172043 ) ( ON ?auto_172045 ?auto_172044 ) ( ON ?auto_172046 ?auto_172045 ) ( CLEAR ?auto_172047 ) ( ON ?auto_172049 ?auto_172046 ) ( CLEAR ?auto_172049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172048 ?auto_172041 ?auto_172042 ?auto_172043 ?auto_172044 ?auto_172045 ?auto_172046 )
      ( MAKE-5PILE ?auto_172041 ?auto_172042 ?auto_172043 ?auto_172044 ?auto_172045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172050 - BLOCK
      ?auto_172051 - BLOCK
      ?auto_172052 - BLOCK
      ?auto_172053 - BLOCK
      ?auto_172054 - BLOCK
    )
    :vars
    (
      ?auto_172058 - BLOCK
      ?auto_172056 - BLOCK
      ?auto_172057 - BLOCK
      ?auto_172055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172050 ?auto_172051 ) ) ( not ( = ?auto_172050 ?auto_172052 ) ) ( not ( = ?auto_172050 ?auto_172053 ) ) ( not ( = ?auto_172050 ?auto_172054 ) ) ( not ( = ?auto_172051 ?auto_172052 ) ) ( not ( = ?auto_172051 ?auto_172053 ) ) ( not ( = ?auto_172051 ?auto_172054 ) ) ( not ( = ?auto_172052 ?auto_172053 ) ) ( not ( = ?auto_172052 ?auto_172054 ) ) ( not ( = ?auto_172053 ?auto_172054 ) ) ( not ( = ?auto_172050 ?auto_172058 ) ) ( not ( = ?auto_172051 ?auto_172058 ) ) ( not ( = ?auto_172052 ?auto_172058 ) ) ( not ( = ?auto_172053 ?auto_172058 ) ) ( not ( = ?auto_172054 ?auto_172058 ) ) ( not ( = ?auto_172056 ?auto_172057 ) ) ( not ( = ?auto_172056 ?auto_172058 ) ) ( not ( = ?auto_172056 ?auto_172054 ) ) ( not ( = ?auto_172056 ?auto_172053 ) ) ( not ( = ?auto_172057 ?auto_172058 ) ) ( not ( = ?auto_172057 ?auto_172054 ) ) ( not ( = ?auto_172057 ?auto_172053 ) ) ( not ( = ?auto_172050 ?auto_172056 ) ) ( not ( = ?auto_172050 ?auto_172057 ) ) ( not ( = ?auto_172051 ?auto_172056 ) ) ( not ( = ?auto_172051 ?auto_172057 ) ) ( not ( = ?auto_172052 ?auto_172056 ) ) ( not ( = ?auto_172052 ?auto_172057 ) ) ( ON ?auto_172050 ?auto_172055 ) ( not ( = ?auto_172050 ?auto_172055 ) ) ( not ( = ?auto_172051 ?auto_172055 ) ) ( not ( = ?auto_172052 ?auto_172055 ) ) ( not ( = ?auto_172053 ?auto_172055 ) ) ( not ( = ?auto_172054 ?auto_172055 ) ) ( not ( = ?auto_172058 ?auto_172055 ) ) ( not ( = ?auto_172056 ?auto_172055 ) ) ( not ( = ?auto_172057 ?auto_172055 ) ) ( ON ?auto_172051 ?auto_172050 ) ( ON-TABLE ?auto_172055 ) ( ON ?auto_172052 ?auto_172051 ) ( ON ?auto_172053 ?auto_172052 ) ( ON ?auto_172054 ?auto_172053 ) ( ON ?auto_172058 ?auto_172054 ) ( ON ?auto_172057 ?auto_172058 ) ( CLEAR ?auto_172057 ) ( HOLDING ?auto_172056 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172056 )
      ( MAKE-5PILE ?auto_172050 ?auto_172051 ?auto_172052 ?auto_172053 ?auto_172054 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_172059 - BLOCK
      ?auto_172060 - BLOCK
      ?auto_172061 - BLOCK
      ?auto_172062 - BLOCK
      ?auto_172063 - BLOCK
    )
    :vars
    (
      ?auto_172067 - BLOCK
      ?auto_172065 - BLOCK
      ?auto_172066 - BLOCK
      ?auto_172064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172059 ?auto_172060 ) ) ( not ( = ?auto_172059 ?auto_172061 ) ) ( not ( = ?auto_172059 ?auto_172062 ) ) ( not ( = ?auto_172059 ?auto_172063 ) ) ( not ( = ?auto_172060 ?auto_172061 ) ) ( not ( = ?auto_172060 ?auto_172062 ) ) ( not ( = ?auto_172060 ?auto_172063 ) ) ( not ( = ?auto_172061 ?auto_172062 ) ) ( not ( = ?auto_172061 ?auto_172063 ) ) ( not ( = ?auto_172062 ?auto_172063 ) ) ( not ( = ?auto_172059 ?auto_172067 ) ) ( not ( = ?auto_172060 ?auto_172067 ) ) ( not ( = ?auto_172061 ?auto_172067 ) ) ( not ( = ?auto_172062 ?auto_172067 ) ) ( not ( = ?auto_172063 ?auto_172067 ) ) ( not ( = ?auto_172065 ?auto_172066 ) ) ( not ( = ?auto_172065 ?auto_172067 ) ) ( not ( = ?auto_172065 ?auto_172063 ) ) ( not ( = ?auto_172065 ?auto_172062 ) ) ( not ( = ?auto_172066 ?auto_172067 ) ) ( not ( = ?auto_172066 ?auto_172063 ) ) ( not ( = ?auto_172066 ?auto_172062 ) ) ( not ( = ?auto_172059 ?auto_172065 ) ) ( not ( = ?auto_172059 ?auto_172066 ) ) ( not ( = ?auto_172060 ?auto_172065 ) ) ( not ( = ?auto_172060 ?auto_172066 ) ) ( not ( = ?auto_172061 ?auto_172065 ) ) ( not ( = ?auto_172061 ?auto_172066 ) ) ( ON ?auto_172059 ?auto_172064 ) ( not ( = ?auto_172059 ?auto_172064 ) ) ( not ( = ?auto_172060 ?auto_172064 ) ) ( not ( = ?auto_172061 ?auto_172064 ) ) ( not ( = ?auto_172062 ?auto_172064 ) ) ( not ( = ?auto_172063 ?auto_172064 ) ) ( not ( = ?auto_172067 ?auto_172064 ) ) ( not ( = ?auto_172065 ?auto_172064 ) ) ( not ( = ?auto_172066 ?auto_172064 ) ) ( ON ?auto_172060 ?auto_172059 ) ( ON-TABLE ?auto_172064 ) ( ON ?auto_172061 ?auto_172060 ) ( ON ?auto_172062 ?auto_172061 ) ( ON ?auto_172063 ?auto_172062 ) ( ON ?auto_172067 ?auto_172063 ) ( ON ?auto_172066 ?auto_172067 ) ( ON ?auto_172065 ?auto_172066 ) ( CLEAR ?auto_172065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172064 ?auto_172059 ?auto_172060 ?auto_172061 ?auto_172062 ?auto_172063 ?auto_172067 ?auto_172066 )
      ( MAKE-5PILE ?auto_172059 ?auto_172060 ?auto_172061 ?auto_172062 ?auto_172063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172083 - BLOCK
      ?auto_172084 - BLOCK
    )
    :vars
    (
      ?auto_172087 - BLOCK
      ?auto_172085 - BLOCK
      ?auto_172086 - BLOCK
      ?auto_172088 - BLOCK
      ?auto_172090 - BLOCK
      ?auto_172089 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172087 ?auto_172084 ) ( ON-TABLE ?auto_172083 ) ( ON ?auto_172084 ?auto_172083 ) ( not ( = ?auto_172083 ?auto_172084 ) ) ( not ( = ?auto_172083 ?auto_172087 ) ) ( not ( = ?auto_172084 ?auto_172087 ) ) ( not ( = ?auto_172083 ?auto_172085 ) ) ( not ( = ?auto_172083 ?auto_172086 ) ) ( not ( = ?auto_172084 ?auto_172085 ) ) ( not ( = ?auto_172084 ?auto_172086 ) ) ( not ( = ?auto_172087 ?auto_172085 ) ) ( not ( = ?auto_172087 ?auto_172086 ) ) ( not ( = ?auto_172085 ?auto_172086 ) ) ( ON ?auto_172085 ?auto_172087 ) ( CLEAR ?auto_172085 ) ( HOLDING ?auto_172086 ) ( CLEAR ?auto_172088 ) ( ON-TABLE ?auto_172090 ) ( ON ?auto_172089 ?auto_172090 ) ( ON ?auto_172088 ?auto_172089 ) ( not ( = ?auto_172090 ?auto_172089 ) ) ( not ( = ?auto_172090 ?auto_172088 ) ) ( not ( = ?auto_172090 ?auto_172086 ) ) ( not ( = ?auto_172089 ?auto_172088 ) ) ( not ( = ?auto_172089 ?auto_172086 ) ) ( not ( = ?auto_172088 ?auto_172086 ) ) ( not ( = ?auto_172083 ?auto_172088 ) ) ( not ( = ?auto_172083 ?auto_172090 ) ) ( not ( = ?auto_172083 ?auto_172089 ) ) ( not ( = ?auto_172084 ?auto_172088 ) ) ( not ( = ?auto_172084 ?auto_172090 ) ) ( not ( = ?auto_172084 ?auto_172089 ) ) ( not ( = ?auto_172087 ?auto_172088 ) ) ( not ( = ?auto_172087 ?auto_172090 ) ) ( not ( = ?auto_172087 ?auto_172089 ) ) ( not ( = ?auto_172085 ?auto_172088 ) ) ( not ( = ?auto_172085 ?auto_172090 ) ) ( not ( = ?auto_172085 ?auto_172089 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172090 ?auto_172089 ?auto_172088 ?auto_172086 )
      ( MAKE-2PILE ?auto_172083 ?auto_172084 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172091 - BLOCK
      ?auto_172092 - BLOCK
    )
    :vars
    (
      ?auto_172097 - BLOCK
      ?auto_172093 - BLOCK
      ?auto_172098 - BLOCK
      ?auto_172094 - BLOCK
      ?auto_172095 - BLOCK
      ?auto_172096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172097 ?auto_172092 ) ( ON-TABLE ?auto_172091 ) ( ON ?auto_172092 ?auto_172091 ) ( not ( = ?auto_172091 ?auto_172092 ) ) ( not ( = ?auto_172091 ?auto_172097 ) ) ( not ( = ?auto_172092 ?auto_172097 ) ) ( not ( = ?auto_172091 ?auto_172093 ) ) ( not ( = ?auto_172091 ?auto_172098 ) ) ( not ( = ?auto_172092 ?auto_172093 ) ) ( not ( = ?auto_172092 ?auto_172098 ) ) ( not ( = ?auto_172097 ?auto_172093 ) ) ( not ( = ?auto_172097 ?auto_172098 ) ) ( not ( = ?auto_172093 ?auto_172098 ) ) ( ON ?auto_172093 ?auto_172097 ) ( CLEAR ?auto_172094 ) ( ON-TABLE ?auto_172095 ) ( ON ?auto_172096 ?auto_172095 ) ( ON ?auto_172094 ?auto_172096 ) ( not ( = ?auto_172095 ?auto_172096 ) ) ( not ( = ?auto_172095 ?auto_172094 ) ) ( not ( = ?auto_172095 ?auto_172098 ) ) ( not ( = ?auto_172096 ?auto_172094 ) ) ( not ( = ?auto_172096 ?auto_172098 ) ) ( not ( = ?auto_172094 ?auto_172098 ) ) ( not ( = ?auto_172091 ?auto_172094 ) ) ( not ( = ?auto_172091 ?auto_172095 ) ) ( not ( = ?auto_172091 ?auto_172096 ) ) ( not ( = ?auto_172092 ?auto_172094 ) ) ( not ( = ?auto_172092 ?auto_172095 ) ) ( not ( = ?auto_172092 ?auto_172096 ) ) ( not ( = ?auto_172097 ?auto_172094 ) ) ( not ( = ?auto_172097 ?auto_172095 ) ) ( not ( = ?auto_172097 ?auto_172096 ) ) ( not ( = ?auto_172093 ?auto_172094 ) ) ( not ( = ?auto_172093 ?auto_172095 ) ) ( not ( = ?auto_172093 ?auto_172096 ) ) ( ON ?auto_172098 ?auto_172093 ) ( CLEAR ?auto_172098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172091 ?auto_172092 ?auto_172097 ?auto_172093 )
      ( MAKE-2PILE ?auto_172091 ?auto_172092 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172099 - BLOCK
      ?auto_172100 - BLOCK
    )
    :vars
    (
      ?auto_172105 - BLOCK
      ?auto_172101 - BLOCK
      ?auto_172103 - BLOCK
      ?auto_172106 - BLOCK
      ?auto_172104 - BLOCK
      ?auto_172102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172105 ?auto_172100 ) ( ON-TABLE ?auto_172099 ) ( ON ?auto_172100 ?auto_172099 ) ( not ( = ?auto_172099 ?auto_172100 ) ) ( not ( = ?auto_172099 ?auto_172105 ) ) ( not ( = ?auto_172100 ?auto_172105 ) ) ( not ( = ?auto_172099 ?auto_172101 ) ) ( not ( = ?auto_172099 ?auto_172103 ) ) ( not ( = ?auto_172100 ?auto_172101 ) ) ( not ( = ?auto_172100 ?auto_172103 ) ) ( not ( = ?auto_172105 ?auto_172101 ) ) ( not ( = ?auto_172105 ?auto_172103 ) ) ( not ( = ?auto_172101 ?auto_172103 ) ) ( ON ?auto_172101 ?auto_172105 ) ( ON-TABLE ?auto_172106 ) ( ON ?auto_172104 ?auto_172106 ) ( not ( = ?auto_172106 ?auto_172104 ) ) ( not ( = ?auto_172106 ?auto_172102 ) ) ( not ( = ?auto_172106 ?auto_172103 ) ) ( not ( = ?auto_172104 ?auto_172102 ) ) ( not ( = ?auto_172104 ?auto_172103 ) ) ( not ( = ?auto_172102 ?auto_172103 ) ) ( not ( = ?auto_172099 ?auto_172102 ) ) ( not ( = ?auto_172099 ?auto_172106 ) ) ( not ( = ?auto_172099 ?auto_172104 ) ) ( not ( = ?auto_172100 ?auto_172102 ) ) ( not ( = ?auto_172100 ?auto_172106 ) ) ( not ( = ?auto_172100 ?auto_172104 ) ) ( not ( = ?auto_172105 ?auto_172102 ) ) ( not ( = ?auto_172105 ?auto_172106 ) ) ( not ( = ?auto_172105 ?auto_172104 ) ) ( not ( = ?auto_172101 ?auto_172102 ) ) ( not ( = ?auto_172101 ?auto_172106 ) ) ( not ( = ?auto_172101 ?auto_172104 ) ) ( ON ?auto_172103 ?auto_172101 ) ( CLEAR ?auto_172103 ) ( HOLDING ?auto_172102 ) ( CLEAR ?auto_172104 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172106 ?auto_172104 ?auto_172102 )
      ( MAKE-2PILE ?auto_172099 ?auto_172100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172107 - BLOCK
      ?auto_172108 - BLOCK
    )
    :vars
    (
      ?auto_172110 - BLOCK
      ?auto_172112 - BLOCK
      ?auto_172113 - BLOCK
      ?auto_172109 - BLOCK
      ?auto_172114 - BLOCK
      ?auto_172111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172110 ?auto_172108 ) ( ON-TABLE ?auto_172107 ) ( ON ?auto_172108 ?auto_172107 ) ( not ( = ?auto_172107 ?auto_172108 ) ) ( not ( = ?auto_172107 ?auto_172110 ) ) ( not ( = ?auto_172108 ?auto_172110 ) ) ( not ( = ?auto_172107 ?auto_172112 ) ) ( not ( = ?auto_172107 ?auto_172113 ) ) ( not ( = ?auto_172108 ?auto_172112 ) ) ( not ( = ?auto_172108 ?auto_172113 ) ) ( not ( = ?auto_172110 ?auto_172112 ) ) ( not ( = ?auto_172110 ?auto_172113 ) ) ( not ( = ?auto_172112 ?auto_172113 ) ) ( ON ?auto_172112 ?auto_172110 ) ( ON-TABLE ?auto_172109 ) ( ON ?auto_172114 ?auto_172109 ) ( not ( = ?auto_172109 ?auto_172114 ) ) ( not ( = ?auto_172109 ?auto_172111 ) ) ( not ( = ?auto_172109 ?auto_172113 ) ) ( not ( = ?auto_172114 ?auto_172111 ) ) ( not ( = ?auto_172114 ?auto_172113 ) ) ( not ( = ?auto_172111 ?auto_172113 ) ) ( not ( = ?auto_172107 ?auto_172111 ) ) ( not ( = ?auto_172107 ?auto_172109 ) ) ( not ( = ?auto_172107 ?auto_172114 ) ) ( not ( = ?auto_172108 ?auto_172111 ) ) ( not ( = ?auto_172108 ?auto_172109 ) ) ( not ( = ?auto_172108 ?auto_172114 ) ) ( not ( = ?auto_172110 ?auto_172111 ) ) ( not ( = ?auto_172110 ?auto_172109 ) ) ( not ( = ?auto_172110 ?auto_172114 ) ) ( not ( = ?auto_172112 ?auto_172111 ) ) ( not ( = ?auto_172112 ?auto_172109 ) ) ( not ( = ?auto_172112 ?auto_172114 ) ) ( ON ?auto_172113 ?auto_172112 ) ( CLEAR ?auto_172114 ) ( ON ?auto_172111 ?auto_172113 ) ( CLEAR ?auto_172111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172107 ?auto_172108 ?auto_172110 ?auto_172112 ?auto_172113 )
      ( MAKE-2PILE ?auto_172107 ?auto_172108 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172115 - BLOCK
      ?auto_172116 - BLOCK
    )
    :vars
    (
      ?auto_172119 - BLOCK
      ?auto_172117 - BLOCK
      ?auto_172121 - BLOCK
      ?auto_172118 - BLOCK
      ?auto_172122 - BLOCK
      ?auto_172120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172119 ?auto_172116 ) ( ON-TABLE ?auto_172115 ) ( ON ?auto_172116 ?auto_172115 ) ( not ( = ?auto_172115 ?auto_172116 ) ) ( not ( = ?auto_172115 ?auto_172119 ) ) ( not ( = ?auto_172116 ?auto_172119 ) ) ( not ( = ?auto_172115 ?auto_172117 ) ) ( not ( = ?auto_172115 ?auto_172121 ) ) ( not ( = ?auto_172116 ?auto_172117 ) ) ( not ( = ?auto_172116 ?auto_172121 ) ) ( not ( = ?auto_172119 ?auto_172117 ) ) ( not ( = ?auto_172119 ?auto_172121 ) ) ( not ( = ?auto_172117 ?auto_172121 ) ) ( ON ?auto_172117 ?auto_172119 ) ( ON-TABLE ?auto_172118 ) ( not ( = ?auto_172118 ?auto_172122 ) ) ( not ( = ?auto_172118 ?auto_172120 ) ) ( not ( = ?auto_172118 ?auto_172121 ) ) ( not ( = ?auto_172122 ?auto_172120 ) ) ( not ( = ?auto_172122 ?auto_172121 ) ) ( not ( = ?auto_172120 ?auto_172121 ) ) ( not ( = ?auto_172115 ?auto_172120 ) ) ( not ( = ?auto_172115 ?auto_172118 ) ) ( not ( = ?auto_172115 ?auto_172122 ) ) ( not ( = ?auto_172116 ?auto_172120 ) ) ( not ( = ?auto_172116 ?auto_172118 ) ) ( not ( = ?auto_172116 ?auto_172122 ) ) ( not ( = ?auto_172119 ?auto_172120 ) ) ( not ( = ?auto_172119 ?auto_172118 ) ) ( not ( = ?auto_172119 ?auto_172122 ) ) ( not ( = ?auto_172117 ?auto_172120 ) ) ( not ( = ?auto_172117 ?auto_172118 ) ) ( not ( = ?auto_172117 ?auto_172122 ) ) ( ON ?auto_172121 ?auto_172117 ) ( ON ?auto_172120 ?auto_172121 ) ( CLEAR ?auto_172120 ) ( HOLDING ?auto_172122 ) ( CLEAR ?auto_172118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172118 ?auto_172122 )
      ( MAKE-2PILE ?auto_172115 ?auto_172116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172123 - BLOCK
      ?auto_172124 - BLOCK
    )
    :vars
    (
      ?auto_172126 - BLOCK
      ?auto_172129 - BLOCK
      ?auto_172127 - BLOCK
      ?auto_172130 - BLOCK
      ?auto_172128 - BLOCK
      ?auto_172125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172126 ?auto_172124 ) ( ON-TABLE ?auto_172123 ) ( ON ?auto_172124 ?auto_172123 ) ( not ( = ?auto_172123 ?auto_172124 ) ) ( not ( = ?auto_172123 ?auto_172126 ) ) ( not ( = ?auto_172124 ?auto_172126 ) ) ( not ( = ?auto_172123 ?auto_172129 ) ) ( not ( = ?auto_172123 ?auto_172127 ) ) ( not ( = ?auto_172124 ?auto_172129 ) ) ( not ( = ?auto_172124 ?auto_172127 ) ) ( not ( = ?auto_172126 ?auto_172129 ) ) ( not ( = ?auto_172126 ?auto_172127 ) ) ( not ( = ?auto_172129 ?auto_172127 ) ) ( ON ?auto_172129 ?auto_172126 ) ( ON-TABLE ?auto_172130 ) ( not ( = ?auto_172130 ?auto_172128 ) ) ( not ( = ?auto_172130 ?auto_172125 ) ) ( not ( = ?auto_172130 ?auto_172127 ) ) ( not ( = ?auto_172128 ?auto_172125 ) ) ( not ( = ?auto_172128 ?auto_172127 ) ) ( not ( = ?auto_172125 ?auto_172127 ) ) ( not ( = ?auto_172123 ?auto_172125 ) ) ( not ( = ?auto_172123 ?auto_172130 ) ) ( not ( = ?auto_172123 ?auto_172128 ) ) ( not ( = ?auto_172124 ?auto_172125 ) ) ( not ( = ?auto_172124 ?auto_172130 ) ) ( not ( = ?auto_172124 ?auto_172128 ) ) ( not ( = ?auto_172126 ?auto_172125 ) ) ( not ( = ?auto_172126 ?auto_172130 ) ) ( not ( = ?auto_172126 ?auto_172128 ) ) ( not ( = ?auto_172129 ?auto_172125 ) ) ( not ( = ?auto_172129 ?auto_172130 ) ) ( not ( = ?auto_172129 ?auto_172128 ) ) ( ON ?auto_172127 ?auto_172129 ) ( ON ?auto_172125 ?auto_172127 ) ( CLEAR ?auto_172130 ) ( ON ?auto_172128 ?auto_172125 ) ( CLEAR ?auto_172128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172123 ?auto_172124 ?auto_172126 ?auto_172129 ?auto_172127 ?auto_172125 )
      ( MAKE-2PILE ?auto_172123 ?auto_172124 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172131 - BLOCK
      ?auto_172132 - BLOCK
    )
    :vars
    (
      ?auto_172136 - BLOCK
      ?auto_172133 - BLOCK
      ?auto_172137 - BLOCK
      ?auto_172138 - BLOCK
      ?auto_172134 - BLOCK
      ?auto_172135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172136 ?auto_172132 ) ( ON-TABLE ?auto_172131 ) ( ON ?auto_172132 ?auto_172131 ) ( not ( = ?auto_172131 ?auto_172132 ) ) ( not ( = ?auto_172131 ?auto_172136 ) ) ( not ( = ?auto_172132 ?auto_172136 ) ) ( not ( = ?auto_172131 ?auto_172133 ) ) ( not ( = ?auto_172131 ?auto_172137 ) ) ( not ( = ?auto_172132 ?auto_172133 ) ) ( not ( = ?auto_172132 ?auto_172137 ) ) ( not ( = ?auto_172136 ?auto_172133 ) ) ( not ( = ?auto_172136 ?auto_172137 ) ) ( not ( = ?auto_172133 ?auto_172137 ) ) ( ON ?auto_172133 ?auto_172136 ) ( not ( = ?auto_172138 ?auto_172134 ) ) ( not ( = ?auto_172138 ?auto_172135 ) ) ( not ( = ?auto_172138 ?auto_172137 ) ) ( not ( = ?auto_172134 ?auto_172135 ) ) ( not ( = ?auto_172134 ?auto_172137 ) ) ( not ( = ?auto_172135 ?auto_172137 ) ) ( not ( = ?auto_172131 ?auto_172135 ) ) ( not ( = ?auto_172131 ?auto_172138 ) ) ( not ( = ?auto_172131 ?auto_172134 ) ) ( not ( = ?auto_172132 ?auto_172135 ) ) ( not ( = ?auto_172132 ?auto_172138 ) ) ( not ( = ?auto_172132 ?auto_172134 ) ) ( not ( = ?auto_172136 ?auto_172135 ) ) ( not ( = ?auto_172136 ?auto_172138 ) ) ( not ( = ?auto_172136 ?auto_172134 ) ) ( not ( = ?auto_172133 ?auto_172135 ) ) ( not ( = ?auto_172133 ?auto_172138 ) ) ( not ( = ?auto_172133 ?auto_172134 ) ) ( ON ?auto_172137 ?auto_172133 ) ( ON ?auto_172135 ?auto_172137 ) ( ON ?auto_172134 ?auto_172135 ) ( CLEAR ?auto_172134 ) ( HOLDING ?auto_172138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172138 )
      ( MAKE-2PILE ?auto_172131 ?auto_172132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172149 - BLOCK
      ?auto_172150 - BLOCK
    )
    :vars
    (
      ?auto_172155 - BLOCK
      ?auto_172153 - BLOCK
      ?auto_172151 - BLOCK
      ?auto_172154 - BLOCK
      ?auto_172152 - BLOCK
      ?auto_172156 - BLOCK
      ?auto_172157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172155 ?auto_172150 ) ( ON-TABLE ?auto_172149 ) ( ON ?auto_172150 ?auto_172149 ) ( not ( = ?auto_172149 ?auto_172150 ) ) ( not ( = ?auto_172149 ?auto_172155 ) ) ( not ( = ?auto_172150 ?auto_172155 ) ) ( not ( = ?auto_172149 ?auto_172153 ) ) ( not ( = ?auto_172149 ?auto_172151 ) ) ( not ( = ?auto_172150 ?auto_172153 ) ) ( not ( = ?auto_172150 ?auto_172151 ) ) ( not ( = ?auto_172155 ?auto_172153 ) ) ( not ( = ?auto_172155 ?auto_172151 ) ) ( not ( = ?auto_172153 ?auto_172151 ) ) ( ON ?auto_172153 ?auto_172155 ) ( not ( = ?auto_172154 ?auto_172152 ) ) ( not ( = ?auto_172154 ?auto_172156 ) ) ( not ( = ?auto_172154 ?auto_172151 ) ) ( not ( = ?auto_172152 ?auto_172156 ) ) ( not ( = ?auto_172152 ?auto_172151 ) ) ( not ( = ?auto_172156 ?auto_172151 ) ) ( not ( = ?auto_172149 ?auto_172156 ) ) ( not ( = ?auto_172149 ?auto_172154 ) ) ( not ( = ?auto_172149 ?auto_172152 ) ) ( not ( = ?auto_172150 ?auto_172156 ) ) ( not ( = ?auto_172150 ?auto_172154 ) ) ( not ( = ?auto_172150 ?auto_172152 ) ) ( not ( = ?auto_172155 ?auto_172156 ) ) ( not ( = ?auto_172155 ?auto_172154 ) ) ( not ( = ?auto_172155 ?auto_172152 ) ) ( not ( = ?auto_172153 ?auto_172156 ) ) ( not ( = ?auto_172153 ?auto_172154 ) ) ( not ( = ?auto_172153 ?auto_172152 ) ) ( ON ?auto_172151 ?auto_172153 ) ( ON ?auto_172156 ?auto_172151 ) ( ON ?auto_172152 ?auto_172156 ) ( CLEAR ?auto_172152 ) ( ON ?auto_172154 ?auto_172157 ) ( CLEAR ?auto_172154 ) ( HAND-EMPTY ) ( not ( = ?auto_172149 ?auto_172157 ) ) ( not ( = ?auto_172150 ?auto_172157 ) ) ( not ( = ?auto_172155 ?auto_172157 ) ) ( not ( = ?auto_172153 ?auto_172157 ) ) ( not ( = ?auto_172151 ?auto_172157 ) ) ( not ( = ?auto_172154 ?auto_172157 ) ) ( not ( = ?auto_172152 ?auto_172157 ) ) ( not ( = ?auto_172156 ?auto_172157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172154 ?auto_172157 )
      ( MAKE-2PILE ?auto_172149 ?auto_172150 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172158 - BLOCK
      ?auto_172159 - BLOCK
    )
    :vars
    (
      ?auto_172166 - BLOCK
      ?auto_172160 - BLOCK
      ?auto_172162 - BLOCK
      ?auto_172163 - BLOCK
      ?auto_172161 - BLOCK
      ?auto_172165 - BLOCK
      ?auto_172164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172166 ?auto_172159 ) ( ON-TABLE ?auto_172158 ) ( ON ?auto_172159 ?auto_172158 ) ( not ( = ?auto_172158 ?auto_172159 ) ) ( not ( = ?auto_172158 ?auto_172166 ) ) ( not ( = ?auto_172159 ?auto_172166 ) ) ( not ( = ?auto_172158 ?auto_172160 ) ) ( not ( = ?auto_172158 ?auto_172162 ) ) ( not ( = ?auto_172159 ?auto_172160 ) ) ( not ( = ?auto_172159 ?auto_172162 ) ) ( not ( = ?auto_172166 ?auto_172160 ) ) ( not ( = ?auto_172166 ?auto_172162 ) ) ( not ( = ?auto_172160 ?auto_172162 ) ) ( ON ?auto_172160 ?auto_172166 ) ( not ( = ?auto_172163 ?auto_172161 ) ) ( not ( = ?auto_172163 ?auto_172165 ) ) ( not ( = ?auto_172163 ?auto_172162 ) ) ( not ( = ?auto_172161 ?auto_172165 ) ) ( not ( = ?auto_172161 ?auto_172162 ) ) ( not ( = ?auto_172165 ?auto_172162 ) ) ( not ( = ?auto_172158 ?auto_172165 ) ) ( not ( = ?auto_172158 ?auto_172163 ) ) ( not ( = ?auto_172158 ?auto_172161 ) ) ( not ( = ?auto_172159 ?auto_172165 ) ) ( not ( = ?auto_172159 ?auto_172163 ) ) ( not ( = ?auto_172159 ?auto_172161 ) ) ( not ( = ?auto_172166 ?auto_172165 ) ) ( not ( = ?auto_172166 ?auto_172163 ) ) ( not ( = ?auto_172166 ?auto_172161 ) ) ( not ( = ?auto_172160 ?auto_172165 ) ) ( not ( = ?auto_172160 ?auto_172163 ) ) ( not ( = ?auto_172160 ?auto_172161 ) ) ( ON ?auto_172162 ?auto_172160 ) ( ON ?auto_172165 ?auto_172162 ) ( ON ?auto_172163 ?auto_172164 ) ( CLEAR ?auto_172163 ) ( not ( = ?auto_172158 ?auto_172164 ) ) ( not ( = ?auto_172159 ?auto_172164 ) ) ( not ( = ?auto_172166 ?auto_172164 ) ) ( not ( = ?auto_172160 ?auto_172164 ) ) ( not ( = ?auto_172162 ?auto_172164 ) ) ( not ( = ?auto_172163 ?auto_172164 ) ) ( not ( = ?auto_172161 ?auto_172164 ) ) ( not ( = ?auto_172165 ?auto_172164 ) ) ( HOLDING ?auto_172161 ) ( CLEAR ?auto_172165 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172158 ?auto_172159 ?auto_172166 ?auto_172160 ?auto_172162 ?auto_172165 ?auto_172161 )
      ( MAKE-2PILE ?auto_172158 ?auto_172159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172167 - BLOCK
      ?auto_172168 - BLOCK
    )
    :vars
    (
      ?auto_172170 - BLOCK
      ?auto_172169 - BLOCK
      ?auto_172171 - BLOCK
      ?auto_172173 - BLOCK
      ?auto_172175 - BLOCK
      ?auto_172174 - BLOCK
      ?auto_172172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172170 ?auto_172168 ) ( ON-TABLE ?auto_172167 ) ( ON ?auto_172168 ?auto_172167 ) ( not ( = ?auto_172167 ?auto_172168 ) ) ( not ( = ?auto_172167 ?auto_172170 ) ) ( not ( = ?auto_172168 ?auto_172170 ) ) ( not ( = ?auto_172167 ?auto_172169 ) ) ( not ( = ?auto_172167 ?auto_172171 ) ) ( not ( = ?auto_172168 ?auto_172169 ) ) ( not ( = ?auto_172168 ?auto_172171 ) ) ( not ( = ?auto_172170 ?auto_172169 ) ) ( not ( = ?auto_172170 ?auto_172171 ) ) ( not ( = ?auto_172169 ?auto_172171 ) ) ( ON ?auto_172169 ?auto_172170 ) ( not ( = ?auto_172173 ?auto_172175 ) ) ( not ( = ?auto_172173 ?auto_172174 ) ) ( not ( = ?auto_172173 ?auto_172171 ) ) ( not ( = ?auto_172175 ?auto_172174 ) ) ( not ( = ?auto_172175 ?auto_172171 ) ) ( not ( = ?auto_172174 ?auto_172171 ) ) ( not ( = ?auto_172167 ?auto_172174 ) ) ( not ( = ?auto_172167 ?auto_172173 ) ) ( not ( = ?auto_172167 ?auto_172175 ) ) ( not ( = ?auto_172168 ?auto_172174 ) ) ( not ( = ?auto_172168 ?auto_172173 ) ) ( not ( = ?auto_172168 ?auto_172175 ) ) ( not ( = ?auto_172170 ?auto_172174 ) ) ( not ( = ?auto_172170 ?auto_172173 ) ) ( not ( = ?auto_172170 ?auto_172175 ) ) ( not ( = ?auto_172169 ?auto_172174 ) ) ( not ( = ?auto_172169 ?auto_172173 ) ) ( not ( = ?auto_172169 ?auto_172175 ) ) ( ON ?auto_172171 ?auto_172169 ) ( ON ?auto_172174 ?auto_172171 ) ( ON ?auto_172173 ?auto_172172 ) ( not ( = ?auto_172167 ?auto_172172 ) ) ( not ( = ?auto_172168 ?auto_172172 ) ) ( not ( = ?auto_172170 ?auto_172172 ) ) ( not ( = ?auto_172169 ?auto_172172 ) ) ( not ( = ?auto_172171 ?auto_172172 ) ) ( not ( = ?auto_172173 ?auto_172172 ) ) ( not ( = ?auto_172175 ?auto_172172 ) ) ( not ( = ?auto_172174 ?auto_172172 ) ) ( CLEAR ?auto_172174 ) ( ON ?auto_172175 ?auto_172173 ) ( CLEAR ?auto_172175 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172172 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172172 ?auto_172173 )
      ( MAKE-2PILE ?auto_172167 ?auto_172168 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172176 - BLOCK
      ?auto_172177 - BLOCK
    )
    :vars
    (
      ?auto_172183 - BLOCK
      ?auto_172180 - BLOCK
      ?auto_172179 - BLOCK
      ?auto_172184 - BLOCK
      ?auto_172182 - BLOCK
      ?auto_172178 - BLOCK
      ?auto_172181 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172183 ?auto_172177 ) ( ON-TABLE ?auto_172176 ) ( ON ?auto_172177 ?auto_172176 ) ( not ( = ?auto_172176 ?auto_172177 ) ) ( not ( = ?auto_172176 ?auto_172183 ) ) ( not ( = ?auto_172177 ?auto_172183 ) ) ( not ( = ?auto_172176 ?auto_172180 ) ) ( not ( = ?auto_172176 ?auto_172179 ) ) ( not ( = ?auto_172177 ?auto_172180 ) ) ( not ( = ?auto_172177 ?auto_172179 ) ) ( not ( = ?auto_172183 ?auto_172180 ) ) ( not ( = ?auto_172183 ?auto_172179 ) ) ( not ( = ?auto_172180 ?auto_172179 ) ) ( ON ?auto_172180 ?auto_172183 ) ( not ( = ?auto_172184 ?auto_172182 ) ) ( not ( = ?auto_172184 ?auto_172178 ) ) ( not ( = ?auto_172184 ?auto_172179 ) ) ( not ( = ?auto_172182 ?auto_172178 ) ) ( not ( = ?auto_172182 ?auto_172179 ) ) ( not ( = ?auto_172178 ?auto_172179 ) ) ( not ( = ?auto_172176 ?auto_172178 ) ) ( not ( = ?auto_172176 ?auto_172184 ) ) ( not ( = ?auto_172176 ?auto_172182 ) ) ( not ( = ?auto_172177 ?auto_172178 ) ) ( not ( = ?auto_172177 ?auto_172184 ) ) ( not ( = ?auto_172177 ?auto_172182 ) ) ( not ( = ?auto_172183 ?auto_172178 ) ) ( not ( = ?auto_172183 ?auto_172184 ) ) ( not ( = ?auto_172183 ?auto_172182 ) ) ( not ( = ?auto_172180 ?auto_172178 ) ) ( not ( = ?auto_172180 ?auto_172184 ) ) ( not ( = ?auto_172180 ?auto_172182 ) ) ( ON ?auto_172179 ?auto_172180 ) ( ON ?auto_172184 ?auto_172181 ) ( not ( = ?auto_172176 ?auto_172181 ) ) ( not ( = ?auto_172177 ?auto_172181 ) ) ( not ( = ?auto_172183 ?auto_172181 ) ) ( not ( = ?auto_172180 ?auto_172181 ) ) ( not ( = ?auto_172179 ?auto_172181 ) ) ( not ( = ?auto_172184 ?auto_172181 ) ) ( not ( = ?auto_172182 ?auto_172181 ) ) ( not ( = ?auto_172178 ?auto_172181 ) ) ( ON ?auto_172182 ?auto_172184 ) ( CLEAR ?auto_172182 ) ( ON-TABLE ?auto_172181 ) ( HOLDING ?auto_172178 ) ( CLEAR ?auto_172179 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172176 ?auto_172177 ?auto_172183 ?auto_172180 ?auto_172179 ?auto_172178 )
      ( MAKE-2PILE ?auto_172176 ?auto_172177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_172185 - BLOCK
      ?auto_172186 - BLOCK
    )
    :vars
    (
      ?auto_172192 - BLOCK
      ?auto_172191 - BLOCK
      ?auto_172189 - BLOCK
      ?auto_172187 - BLOCK
      ?auto_172190 - BLOCK
      ?auto_172188 - BLOCK
      ?auto_172193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172192 ?auto_172186 ) ( ON-TABLE ?auto_172185 ) ( ON ?auto_172186 ?auto_172185 ) ( not ( = ?auto_172185 ?auto_172186 ) ) ( not ( = ?auto_172185 ?auto_172192 ) ) ( not ( = ?auto_172186 ?auto_172192 ) ) ( not ( = ?auto_172185 ?auto_172191 ) ) ( not ( = ?auto_172185 ?auto_172189 ) ) ( not ( = ?auto_172186 ?auto_172191 ) ) ( not ( = ?auto_172186 ?auto_172189 ) ) ( not ( = ?auto_172192 ?auto_172191 ) ) ( not ( = ?auto_172192 ?auto_172189 ) ) ( not ( = ?auto_172191 ?auto_172189 ) ) ( ON ?auto_172191 ?auto_172192 ) ( not ( = ?auto_172187 ?auto_172190 ) ) ( not ( = ?auto_172187 ?auto_172188 ) ) ( not ( = ?auto_172187 ?auto_172189 ) ) ( not ( = ?auto_172190 ?auto_172188 ) ) ( not ( = ?auto_172190 ?auto_172189 ) ) ( not ( = ?auto_172188 ?auto_172189 ) ) ( not ( = ?auto_172185 ?auto_172188 ) ) ( not ( = ?auto_172185 ?auto_172187 ) ) ( not ( = ?auto_172185 ?auto_172190 ) ) ( not ( = ?auto_172186 ?auto_172188 ) ) ( not ( = ?auto_172186 ?auto_172187 ) ) ( not ( = ?auto_172186 ?auto_172190 ) ) ( not ( = ?auto_172192 ?auto_172188 ) ) ( not ( = ?auto_172192 ?auto_172187 ) ) ( not ( = ?auto_172192 ?auto_172190 ) ) ( not ( = ?auto_172191 ?auto_172188 ) ) ( not ( = ?auto_172191 ?auto_172187 ) ) ( not ( = ?auto_172191 ?auto_172190 ) ) ( ON ?auto_172189 ?auto_172191 ) ( ON ?auto_172187 ?auto_172193 ) ( not ( = ?auto_172185 ?auto_172193 ) ) ( not ( = ?auto_172186 ?auto_172193 ) ) ( not ( = ?auto_172192 ?auto_172193 ) ) ( not ( = ?auto_172191 ?auto_172193 ) ) ( not ( = ?auto_172189 ?auto_172193 ) ) ( not ( = ?auto_172187 ?auto_172193 ) ) ( not ( = ?auto_172190 ?auto_172193 ) ) ( not ( = ?auto_172188 ?auto_172193 ) ) ( ON ?auto_172190 ?auto_172187 ) ( ON-TABLE ?auto_172193 ) ( CLEAR ?auto_172189 ) ( ON ?auto_172188 ?auto_172190 ) ( CLEAR ?auto_172188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172193 ?auto_172187 ?auto_172190 )
      ( MAKE-2PILE ?auto_172185 ?auto_172186 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172243 - BLOCK
      ?auto_172244 - BLOCK
      ?auto_172245 - BLOCK
      ?auto_172246 - BLOCK
      ?auto_172247 - BLOCK
      ?auto_172248 - BLOCK
    )
    :vars
    (
      ?auto_172249 - BLOCK
      ?auto_172250 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172243 ) ( ON ?auto_172244 ?auto_172243 ) ( ON ?auto_172245 ?auto_172244 ) ( ON ?auto_172246 ?auto_172245 ) ( not ( = ?auto_172243 ?auto_172244 ) ) ( not ( = ?auto_172243 ?auto_172245 ) ) ( not ( = ?auto_172243 ?auto_172246 ) ) ( not ( = ?auto_172243 ?auto_172247 ) ) ( not ( = ?auto_172243 ?auto_172248 ) ) ( not ( = ?auto_172244 ?auto_172245 ) ) ( not ( = ?auto_172244 ?auto_172246 ) ) ( not ( = ?auto_172244 ?auto_172247 ) ) ( not ( = ?auto_172244 ?auto_172248 ) ) ( not ( = ?auto_172245 ?auto_172246 ) ) ( not ( = ?auto_172245 ?auto_172247 ) ) ( not ( = ?auto_172245 ?auto_172248 ) ) ( not ( = ?auto_172246 ?auto_172247 ) ) ( not ( = ?auto_172246 ?auto_172248 ) ) ( not ( = ?auto_172247 ?auto_172248 ) ) ( ON ?auto_172248 ?auto_172249 ) ( not ( = ?auto_172243 ?auto_172249 ) ) ( not ( = ?auto_172244 ?auto_172249 ) ) ( not ( = ?auto_172245 ?auto_172249 ) ) ( not ( = ?auto_172246 ?auto_172249 ) ) ( not ( = ?auto_172247 ?auto_172249 ) ) ( not ( = ?auto_172248 ?auto_172249 ) ) ( CLEAR ?auto_172246 ) ( ON ?auto_172247 ?auto_172248 ) ( CLEAR ?auto_172247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172250 ) ( ON ?auto_172249 ?auto_172250 ) ( not ( = ?auto_172250 ?auto_172249 ) ) ( not ( = ?auto_172250 ?auto_172248 ) ) ( not ( = ?auto_172250 ?auto_172247 ) ) ( not ( = ?auto_172243 ?auto_172250 ) ) ( not ( = ?auto_172244 ?auto_172250 ) ) ( not ( = ?auto_172245 ?auto_172250 ) ) ( not ( = ?auto_172246 ?auto_172250 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172250 ?auto_172249 ?auto_172248 )
      ( MAKE-6PILE ?auto_172243 ?auto_172244 ?auto_172245 ?auto_172246 ?auto_172247 ?auto_172248 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172251 - BLOCK
      ?auto_172252 - BLOCK
      ?auto_172253 - BLOCK
      ?auto_172254 - BLOCK
      ?auto_172255 - BLOCK
      ?auto_172256 - BLOCK
    )
    :vars
    (
      ?auto_172258 - BLOCK
      ?auto_172257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172251 ) ( ON ?auto_172252 ?auto_172251 ) ( ON ?auto_172253 ?auto_172252 ) ( not ( = ?auto_172251 ?auto_172252 ) ) ( not ( = ?auto_172251 ?auto_172253 ) ) ( not ( = ?auto_172251 ?auto_172254 ) ) ( not ( = ?auto_172251 ?auto_172255 ) ) ( not ( = ?auto_172251 ?auto_172256 ) ) ( not ( = ?auto_172252 ?auto_172253 ) ) ( not ( = ?auto_172252 ?auto_172254 ) ) ( not ( = ?auto_172252 ?auto_172255 ) ) ( not ( = ?auto_172252 ?auto_172256 ) ) ( not ( = ?auto_172253 ?auto_172254 ) ) ( not ( = ?auto_172253 ?auto_172255 ) ) ( not ( = ?auto_172253 ?auto_172256 ) ) ( not ( = ?auto_172254 ?auto_172255 ) ) ( not ( = ?auto_172254 ?auto_172256 ) ) ( not ( = ?auto_172255 ?auto_172256 ) ) ( ON ?auto_172256 ?auto_172258 ) ( not ( = ?auto_172251 ?auto_172258 ) ) ( not ( = ?auto_172252 ?auto_172258 ) ) ( not ( = ?auto_172253 ?auto_172258 ) ) ( not ( = ?auto_172254 ?auto_172258 ) ) ( not ( = ?auto_172255 ?auto_172258 ) ) ( not ( = ?auto_172256 ?auto_172258 ) ) ( ON ?auto_172255 ?auto_172256 ) ( CLEAR ?auto_172255 ) ( ON-TABLE ?auto_172257 ) ( ON ?auto_172258 ?auto_172257 ) ( not ( = ?auto_172257 ?auto_172258 ) ) ( not ( = ?auto_172257 ?auto_172256 ) ) ( not ( = ?auto_172257 ?auto_172255 ) ) ( not ( = ?auto_172251 ?auto_172257 ) ) ( not ( = ?auto_172252 ?auto_172257 ) ) ( not ( = ?auto_172253 ?auto_172257 ) ) ( not ( = ?auto_172254 ?auto_172257 ) ) ( HOLDING ?auto_172254 ) ( CLEAR ?auto_172253 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172251 ?auto_172252 ?auto_172253 ?auto_172254 )
      ( MAKE-6PILE ?auto_172251 ?auto_172252 ?auto_172253 ?auto_172254 ?auto_172255 ?auto_172256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172259 - BLOCK
      ?auto_172260 - BLOCK
      ?auto_172261 - BLOCK
      ?auto_172262 - BLOCK
      ?auto_172263 - BLOCK
      ?auto_172264 - BLOCK
    )
    :vars
    (
      ?auto_172265 - BLOCK
      ?auto_172266 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172259 ) ( ON ?auto_172260 ?auto_172259 ) ( ON ?auto_172261 ?auto_172260 ) ( not ( = ?auto_172259 ?auto_172260 ) ) ( not ( = ?auto_172259 ?auto_172261 ) ) ( not ( = ?auto_172259 ?auto_172262 ) ) ( not ( = ?auto_172259 ?auto_172263 ) ) ( not ( = ?auto_172259 ?auto_172264 ) ) ( not ( = ?auto_172260 ?auto_172261 ) ) ( not ( = ?auto_172260 ?auto_172262 ) ) ( not ( = ?auto_172260 ?auto_172263 ) ) ( not ( = ?auto_172260 ?auto_172264 ) ) ( not ( = ?auto_172261 ?auto_172262 ) ) ( not ( = ?auto_172261 ?auto_172263 ) ) ( not ( = ?auto_172261 ?auto_172264 ) ) ( not ( = ?auto_172262 ?auto_172263 ) ) ( not ( = ?auto_172262 ?auto_172264 ) ) ( not ( = ?auto_172263 ?auto_172264 ) ) ( ON ?auto_172264 ?auto_172265 ) ( not ( = ?auto_172259 ?auto_172265 ) ) ( not ( = ?auto_172260 ?auto_172265 ) ) ( not ( = ?auto_172261 ?auto_172265 ) ) ( not ( = ?auto_172262 ?auto_172265 ) ) ( not ( = ?auto_172263 ?auto_172265 ) ) ( not ( = ?auto_172264 ?auto_172265 ) ) ( ON ?auto_172263 ?auto_172264 ) ( ON-TABLE ?auto_172266 ) ( ON ?auto_172265 ?auto_172266 ) ( not ( = ?auto_172266 ?auto_172265 ) ) ( not ( = ?auto_172266 ?auto_172264 ) ) ( not ( = ?auto_172266 ?auto_172263 ) ) ( not ( = ?auto_172259 ?auto_172266 ) ) ( not ( = ?auto_172260 ?auto_172266 ) ) ( not ( = ?auto_172261 ?auto_172266 ) ) ( not ( = ?auto_172262 ?auto_172266 ) ) ( CLEAR ?auto_172261 ) ( ON ?auto_172262 ?auto_172263 ) ( CLEAR ?auto_172262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172266 ?auto_172265 ?auto_172264 ?auto_172263 )
      ( MAKE-6PILE ?auto_172259 ?auto_172260 ?auto_172261 ?auto_172262 ?auto_172263 ?auto_172264 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172267 - BLOCK
      ?auto_172268 - BLOCK
      ?auto_172269 - BLOCK
      ?auto_172270 - BLOCK
      ?auto_172271 - BLOCK
      ?auto_172272 - BLOCK
    )
    :vars
    (
      ?auto_172274 - BLOCK
      ?auto_172273 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172267 ) ( ON ?auto_172268 ?auto_172267 ) ( not ( = ?auto_172267 ?auto_172268 ) ) ( not ( = ?auto_172267 ?auto_172269 ) ) ( not ( = ?auto_172267 ?auto_172270 ) ) ( not ( = ?auto_172267 ?auto_172271 ) ) ( not ( = ?auto_172267 ?auto_172272 ) ) ( not ( = ?auto_172268 ?auto_172269 ) ) ( not ( = ?auto_172268 ?auto_172270 ) ) ( not ( = ?auto_172268 ?auto_172271 ) ) ( not ( = ?auto_172268 ?auto_172272 ) ) ( not ( = ?auto_172269 ?auto_172270 ) ) ( not ( = ?auto_172269 ?auto_172271 ) ) ( not ( = ?auto_172269 ?auto_172272 ) ) ( not ( = ?auto_172270 ?auto_172271 ) ) ( not ( = ?auto_172270 ?auto_172272 ) ) ( not ( = ?auto_172271 ?auto_172272 ) ) ( ON ?auto_172272 ?auto_172274 ) ( not ( = ?auto_172267 ?auto_172274 ) ) ( not ( = ?auto_172268 ?auto_172274 ) ) ( not ( = ?auto_172269 ?auto_172274 ) ) ( not ( = ?auto_172270 ?auto_172274 ) ) ( not ( = ?auto_172271 ?auto_172274 ) ) ( not ( = ?auto_172272 ?auto_172274 ) ) ( ON ?auto_172271 ?auto_172272 ) ( ON-TABLE ?auto_172273 ) ( ON ?auto_172274 ?auto_172273 ) ( not ( = ?auto_172273 ?auto_172274 ) ) ( not ( = ?auto_172273 ?auto_172272 ) ) ( not ( = ?auto_172273 ?auto_172271 ) ) ( not ( = ?auto_172267 ?auto_172273 ) ) ( not ( = ?auto_172268 ?auto_172273 ) ) ( not ( = ?auto_172269 ?auto_172273 ) ) ( not ( = ?auto_172270 ?auto_172273 ) ) ( ON ?auto_172270 ?auto_172271 ) ( CLEAR ?auto_172270 ) ( HOLDING ?auto_172269 ) ( CLEAR ?auto_172268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172267 ?auto_172268 ?auto_172269 )
      ( MAKE-6PILE ?auto_172267 ?auto_172268 ?auto_172269 ?auto_172270 ?auto_172271 ?auto_172272 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172275 - BLOCK
      ?auto_172276 - BLOCK
      ?auto_172277 - BLOCK
      ?auto_172278 - BLOCK
      ?auto_172279 - BLOCK
      ?auto_172280 - BLOCK
    )
    :vars
    (
      ?auto_172282 - BLOCK
      ?auto_172281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172275 ) ( ON ?auto_172276 ?auto_172275 ) ( not ( = ?auto_172275 ?auto_172276 ) ) ( not ( = ?auto_172275 ?auto_172277 ) ) ( not ( = ?auto_172275 ?auto_172278 ) ) ( not ( = ?auto_172275 ?auto_172279 ) ) ( not ( = ?auto_172275 ?auto_172280 ) ) ( not ( = ?auto_172276 ?auto_172277 ) ) ( not ( = ?auto_172276 ?auto_172278 ) ) ( not ( = ?auto_172276 ?auto_172279 ) ) ( not ( = ?auto_172276 ?auto_172280 ) ) ( not ( = ?auto_172277 ?auto_172278 ) ) ( not ( = ?auto_172277 ?auto_172279 ) ) ( not ( = ?auto_172277 ?auto_172280 ) ) ( not ( = ?auto_172278 ?auto_172279 ) ) ( not ( = ?auto_172278 ?auto_172280 ) ) ( not ( = ?auto_172279 ?auto_172280 ) ) ( ON ?auto_172280 ?auto_172282 ) ( not ( = ?auto_172275 ?auto_172282 ) ) ( not ( = ?auto_172276 ?auto_172282 ) ) ( not ( = ?auto_172277 ?auto_172282 ) ) ( not ( = ?auto_172278 ?auto_172282 ) ) ( not ( = ?auto_172279 ?auto_172282 ) ) ( not ( = ?auto_172280 ?auto_172282 ) ) ( ON ?auto_172279 ?auto_172280 ) ( ON-TABLE ?auto_172281 ) ( ON ?auto_172282 ?auto_172281 ) ( not ( = ?auto_172281 ?auto_172282 ) ) ( not ( = ?auto_172281 ?auto_172280 ) ) ( not ( = ?auto_172281 ?auto_172279 ) ) ( not ( = ?auto_172275 ?auto_172281 ) ) ( not ( = ?auto_172276 ?auto_172281 ) ) ( not ( = ?auto_172277 ?auto_172281 ) ) ( not ( = ?auto_172278 ?auto_172281 ) ) ( ON ?auto_172278 ?auto_172279 ) ( CLEAR ?auto_172276 ) ( ON ?auto_172277 ?auto_172278 ) ( CLEAR ?auto_172277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172281 ?auto_172282 ?auto_172280 ?auto_172279 ?auto_172278 )
      ( MAKE-6PILE ?auto_172275 ?auto_172276 ?auto_172277 ?auto_172278 ?auto_172279 ?auto_172280 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172283 - BLOCK
      ?auto_172284 - BLOCK
      ?auto_172285 - BLOCK
      ?auto_172286 - BLOCK
      ?auto_172287 - BLOCK
      ?auto_172288 - BLOCK
    )
    :vars
    (
      ?auto_172290 - BLOCK
      ?auto_172289 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172283 ) ( not ( = ?auto_172283 ?auto_172284 ) ) ( not ( = ?auto_172283 ?auto_172285 ) ) ( not ( = ?auto_172283 ?auto_172286 ) ) ( not ( = ?auto_172283 ?auto_172287 ) ) ( not ( = ?auto_172283 ?auto_172288 ) ) ( not ( = ?auto_172284 ?auto_172285 ) ) ( not ( = ?auto_172284 ?auto_172286 ) ) ( not ( = ?auto_172284 ?auto_172287 ) ) ( not ( = ?auto_172284 ?auto_172288 ) ) ( not ( = ?auto_172285 ?auto_172286 ) ) ( not ( = ?auto_172285 ?auto_172287 ) ) ( not ( = ?auto_172285 ?auto_172288 ) ) ( not ( = ?auto_172286 ?auto_172287 ) ) ( not ( = ?auto_172286 ?auto_172288 ) ) ( not ( = ?auto_172287 ?auto_172288 ) ) ( ON ?auto_172288 ?auto_172290 ) ( not ( = ?auto_172283 ?auto_172290 ) ) ( not ( = ?auto_172284 ?auto_172290 ) ) ( not ( = ?auto_172285 ?auto_172290 ) ) ( not ( = ?auto_172286 ?auto_172290 ) ) ( not ( = ?auto_172287 ?auto_172290 ) ) ( not ( = ?auto_172288 ?auto_172290 ) ) ( ON ?auto_172287 ?auto_172288 ) ( ON-TABLE ?auto_172289 ) ( ON ?auto_172290 ?auto_172289 ) ( not ( = ?auto_172289 ?auto_172290 ) ) ( not ( = ?auto_172289 ?auto_172288 ) ) ( not ( = ?auto_172289 ?auto_172287 ) ) ( not ( = ?auto_172283 ?auto_172289 ) ) ( not ( = ?auto_172284 ?auto_172289 ) ) ( not ( = ?auto_172285 ?auto_172289 ) ) ( not ( = ?auto_172286 ?auto_172289 ) ) ( ON ?auto_172286 ?auto_172287 ) ( ON ?auto_172285 ?auto_172286 ) ( CLEAR ?auto_172285 ) ( HOLDING ?auto_172284 ) ( CLEAR ?auto_172283 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172283 ?auto_172284 )
      ( MAKE-6PILE ?auto_172283 ?auto_172284 ?auto_172285 ?auto_172286 ?auto_172287 ?auto_172288 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172291 - BLOCK
      ?auto_172292 - BLOCK
      ?auto_172293 - BLOCK
      ?auto_172294 - BLOCK
      ?auto_172295 - BLOCK
      ?auto_172296 - BLOCK
    )
    :vars
    (
      ?auto_172298 - BLOCK
      ?auto_172297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172291 ) ( not ( = ?auto_172291 ?auto_172292 ) ) ( not ( = ?auto_172291 ?auto_172293 ) ) ( not ( = ?auto_172291 ?auto_172294 ) ) ( not ( = ?auto_172291 ?auto_172295 ) ) ( not ( = ?auto_172291 ?auto_172296 ) ) ( not ( = ?auto_172292 ?auto_172293 ) ) ( not ( = ?auto_172292 ?auto_172294 ) ) ( not ( = ?auto_172292 ?auto_172295 ) ) ( not ( = ?auto_172292 ?auto_172296 ) ) ( not ( = ?auto_172293 ?auto_172294 ) ) ( not ( = ?auto_172293 ?auto_172295 ) ) ( not ( = ?auto_172293 ?auto_172296 ) ) ( not ( = ?auto_172294 ?auto_172295 ) ) ( not ( = ?auto_172294 ?auto_172296 ) ) ( not ( = ?auto_172295 ?auto_172296 ) ) ( ON ?auto_172296 ?auto_172298 ) ( not ( = ?auto_172291 ?auto_172298 ) ) ( not ( = ?auto_172292 ?auto_172298 ) ) ( not ( = ?auto_172293 ?auto_172298 ) ) ( not ( = ?auto_172294 ?auto_172298 ) ) ( not ( = ?auto_172295 ?auto_172298 ) ) ( not ( = ?auto_172296 ?auto_172298 ) ) ( ON ?auto_172295 ?auto_172296 ) ( ON-TABLE ?auto_172297 ) ( ON ?auto_172298 ?auto_172297 ) ( not ( = ?auto_172297 ?auto_172298 ) ) ( not ( = ?auto_172297 ?auto_172296 ) ) ( not ( = ?auto_172297 ?auto_172295 ) ) ( not ( = ?auto_172291 ?auto_172297 ) ) ( not ( = ?auto_172292 ?auto_172297 ) ) ( not ( = ?auto_172293 ?auto_172297 ) ) ( not ( = ?auto_172294 ?auto_172297 ) ) ( ON ?auto_172294 ?auto_172295 ) ( ON ?auto_172293 ?auto_172294 ) ( CLEAR ?auto_172291 ) ( ON ?auto_172292 ?auto_172293 ) ( CLEAR ?auto_172292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172297 ?auto_172298 ?auto_172296 ?auto_172295 ?auto_172294 ?auto_172293 )
      ( MAKE-6PILE ?auto_172291 ?auto_172292 ?auto_172293 ?auto_172294 ?auto_172295 ?auto_172296 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172299 - BLOCK
      ?auto_172300 - BLOCK
      ?auto_172301 - BLOCK
      ?auto_172302 - BLOCK
      ?auto_172303 - BLOCK
      ?auto_172304 - BLOCK
    )
    :vars
    (
      ?auto_172305 - BLOCK
      ?auto_172306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172299 ?auto_172300 ) ) ( not ( = ?auto_172299 ?auto_172301 ) ) ( not ( = ?auto_172299 ?auto_172302 ) ) ( not ( = ?auto_172299 ?auto_172303 ) ) ( not ( = ?auto_172299 ?auto_172304 ) ) ( not ( = ?auto_172300 ?auto_172301 ) ) ( not ( = ?auto_172300 ?auto_172302 ) ) ( not ( = ?auto_172300 ?auto_172303 ) ) ( not ( = ?auto_172300 ?auto_172304 ) ) ( not ( = ?auto_172301 ?auto_172302 ) ) ( not ( = ?auto_172301 ?auto_172303 ) ) ( not ( = ?auto_172301 ?auto_172304 ) ) ( not ( = ?auto_172302 ?auto_172303 ) ) ( not ( = ?auto_172302 ?auto_172304 ) ) ( not ( = ?auto_172303 ?auto_172304 ) ) ( ON ?auto_172304 ?auto_172305 ) ( not ( = ?auto_172299 ?auto_172305 ) ) ( not ( = ?auto_172300 ?auto_172305 ) ) ( not ( = ?auto_172301 ?auto_172305 ) ) ( not ( = ?auto_172302 ?auto_172305 ) ) ( not ( = ?auto_172303 ?auto_172305 ) ) ( not ( = ?auto_172304 ?auto_172305 ) ) ( ON ?auto_172303 ?auto_172304 ) ( ON-TABLE ?auto_172306 ) ( ON ?auto_172305 ?auto_172306 ) ( not ( = ?auto_172306 ?auto_172305 ) ) ( not ( = ?auto_172306 ?auto_172304 ) ) ( not ( = ?auto_172306 ?auto_172303 ) ) ( not ( = ?auto_172299 ?auto_172306 ) ) ( not ( = ?auto_172300 ?auto_172306 ) ) ( not ( = ?auto_172301 ?auto_172306 ) ) ( not ( = ?auto_172302 ?auto_172306 ) ) ( ON ?auto_172302 ?auto_172303 ) ( ON ?auto_172301 ?auto_172302 ) ( ON ?auto_172300 ?auto_172301 ) ( CLEAR ?auto_172300 ) ( HOLDING ?auto_172299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172299 )
      ( MAKE-6PILE ?auto_172299 ?auto_172300 ?auto_172301 ?auto_172302 ?auto_172303 ?auto_172304 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172307 - BLOCK
      ?auto_172308 - BLOCK
      ?auto_172309 - BLOCK
      ?auto_172310 - BLOCK
      ?auto_172311 - BLOCK
      ?auto_172312 - BLOCK
    )
    :vars
    (
      ?auto_172313 - BLOCK
      ?auto_172314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172307 ?auto_172308 ) ) ( not ( = ?auto_172307 ?auto_172309 ) ) ( not ( = ?auto_172307 ?auto_172310 ) ) ( not ( = ?auto_172307 ?auto_172311 ) ) ( not ( = ?auto_172307 ?auto_172312 ) ) ( not ( = ?auto_172308 ?auto_172309 ) ) ( not ( = ?auto_172308 ?auto_172310 ) ) ( not ( = ?auto_172308 ?auto_172311 ) ) ( not ( = ?auto_172308 ?auto_172312 ) ) ( not ( = ?auto_172309 ?auto_172310 ) ) ( not ( = ?auto_172309 ?auto_172311 ) ) ( not ( = ?auto_172309 ?auto_172312 ) ) ( not ( = ?auto_172310 ?auto_172311 ) ) ( not ( = ?auto_172310 ?auto_172312 ) ) ( not ( = ?auto_172311 ?auto_172312 ) ) ( ON ?auto_172312 ?auto_172313 ) ( not ( = ?auto_172307 ?auto_172313 ) ) ( not ( = ?auto_172308 ?auto_172313 ) ) ( not ( = ?auto_172309 ?auto_172313 ) ) ( not ( = ?auto_172310 ?auto_172313 ) ) ( not ( = ?auto_172311 ?auto_172313 ) ) ( not ( = ?auto_172312 ?auto_172313 ) ) ( ON ?auto_172311 ?auto_172312 ) ( ON-TABLE ?auto_172314 ) ( ON ?auto_172313 ?auto_172314 ) ( not ( = ?auto_172314 ?auto_172313 ) ) ( not ( = ?auto_172314 ?auto_172312 ) ) ( not ( = ?auto_172314 ?auto_172311 ) ) ( not ( = ?auto_172307 ?auto_172314 ) ) ( not ( = ?auto_172308 ?auto_172314 ) ) ( not ( = ?auto_172309 ?auto_172314 ) ) ( not ( = ?auto_172310 ?auto_172314 ) ) ( ON ?auto_172310 ?auto_172311 ) ( ON ?auto_172309 ?auto_172310 ) ( ON ?auto_172308 ?auto_172309 ) ( ON ?auto_172307 ?auto_172308 ) ( CLEAR ?auto_172307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172314 ?auto_172313 ?auto_172312 ?auto_172311 ?auto_172310 ?auto_172309 ?auto_172308 )
      ( MAKE-6PILE ?auto_172307 ?auto_172308 ?auto_172309 ?auto_172310 ?auto_172311 ?auto_172312 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172321 - BLOCK
      ?auto_172322 - BLOCK
      ?auto_172323 - BLOCK
      ?auto_172324 - BLOCK
      ?auto_172325 - BLOCK
      ?auto_172326 - BLOCK
    )
    :vars
    (
      ?auto_172327 - BLOCK
      ?auto_172328 - BLOCK
      ?auto_172329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172321 ?auto_172322 ) ) ( not ( = ?auto_172321 ?auto_172323 ) ) ( not ( = ?auto_172321 ?auto_172324 ) ) ( not ( = ?auto_172321 ?auto_172325 ) ) ( not ( = ?auto_172321 ?auto_172326 ) ) ( not ( = ?auto_172322 ?auto_172323 ) ) ( not ( = ?auto_172322 ?auto_172324 ) ) ( not ( = ?auto_172322 ?auto_172325 ) ) ( not ( = ?auto_172322 ?auto_172326 ) ) ( not ( = ?auto_172323 ?auto_172324 ) ) ( not ( = ?auto_172323 ?auto_172325 ) ) ( not ( = ?auto_172323 ?auto_172326 ) ) ( not ( = ?auto_172324 ?auto_172325 ) ) ( not ( = ?auto_172324 ?auto_172326 ) ) ( not ( = ?auto_172325 ?auto_172326 ) ) ( ON ?auto_172326 ?auto_172327 ) ( not ( = ?auto_172321 ?auto_172327 ) ) ( not ( = ?auto_172322 ?auto_172327 ) ) ( not ( = ?auto_172323 ?auto_172327 ) ) ( not ( = ?auto_172324 ?auto_172327 ) ) ( not ( = ?auto_172325 ?auto_172327 ) ) ( not ( = ?auto_172326 ?auto_172327 ) ) ( ON ?auto_172325 ?auto_172326 ) ( ON-TABLE ?auto_172328 ) ( ON ?auto_172327 ?auto_172328 ) ( not ( = ?auto_172328 ?auto_172327 ) ) ( not ( = ?auto_172328 ?auto_172326 ) ) ( not ( = ?auto_172328 ?auto_172325 ) ) ( not ( = ?auto_172321 ?auto_172328 ) ) ( not ( = ?auto_172322 ?auto_172328 ) ) ( not ( = ?auto_172323 ?auto_172328 ) ) ( not ( = ?auto_172324 ?auto_172328 ) ) ( ON ?auto_172324 ?auto_172325 ) ( ON ?auto_172323 ?auto_172324 ) ( ON ?auto_172322 ?auto_172323 ) ( CLEAR ?auto_172322 ) ( ON ?auto_172321 ?auto_172329 ) ( CLEAR ?auto_172321 ) ( HAND-EMPTY ) ( not ( = ?auto_172321 ?auto_172329 ) ) ( not ( = ?auto_172322 ?auto_172329 ) ) ( not ( = ?auto_172323 ?auto_172329 ) ) ( not ( = ?auto_172324 ?auto_172329 ) ) ( not ( = ?auto_172325 ?auto_172329 ) ) ( not ( = ?auto_172326 ?auto_172329 ) ) ( not ( = ?auto_172327 ?auto_172329 ) ) ( not ( = ?auto_172328 ?auto_172329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172321 ?auto_172329 )
      ( MAKE-6PILE ?auto_172321 ?auto_172322 ?auto_172323 ?auto_172324 ?auto_172325 ?auto_172326 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172330 - BLOCK
      ?auto_172331 - BLOCK
      ?auto_172332 - BLOCK
      ?auto_172333 - BLOCK
      ?auto_172334 - BLOCK
      ?auto_172335 - BLOCK
    )
    :vars
    (
      ?auto_172336 - BLOCK
      ?auto_172337 - BLOCK
      ?auto_172338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172330 ?auto_172331 ) ) ( not ( = ?auto_172330 ?auto_172332 ) ) ( not ( = ?auto_172330 ?auto_172333 ) ) ( not ( = ?auto_172330 ?auto_172334 ) ) ( not ( = ?auto_172330 ?auto_172335 ) ) ( not ( = ?auto_172331 ?auto_172332 ) ) ( not ( = ?auto_172331 ?auto_172333 ) ) ( not ( = ?auto_172331 ?auto_172334 ) ) ( not ( = ?auto_172331 ?auto_172335 ) ) ( not ( = ?auto_172332 ?auto_172333 ) ) ( not ( = ?auto_172332 ?auto_172334 ) ) ( not ( = ?auto_172332 ?auto_172335 ) ) ( not ( = ?auto_172333 ?auto_172334 ) ) ( not ( = ?auto_172333 ?auto_172335 ) ) ( not ( = ?auto_172334 ?auto_172335 ) ) ( ON ?auto_172335 ?auto_172336 ) ( not ( = ?auto_172330 ?auto_172336 ) ) ( not ( = ?auto_172331 ?auto_172336 ) ) ( not ( = ?auto_172332 ?auto_172336 ) ) ( not ( = ?auto_172333 ?auto_172336 ) ) ( not ( = ?auto_172334 ?auto_172336 ) ) ( not ( = ?auto_172335 ?auto_172336 ) ) ( ON ?auto_172334 ?auto_172335 ) ( ON-TABLE ?auto_172337 ) ( ON ?auto_172336 ?auto_172337 ) ( not ( = ?auto_172337 ?auto_172336 ) ) ( not ( = ?auto_172337 ?auto_172335 ) ) ( not ( = ?auto_172337 ?auto_172334 ) ) ( not ( = ?auto_172330 ?auto_172337 ) ) ( not ( = ?auto_172331 ?auto_172337 ) ) ( not ( = ?auto_172332 ?auto_172337 ) ) ( not ( = ?auto_172333 ?auto_172337 ) ) ( ON ?auto_172333 ?auto_172334 ) ( ON ?auto_172332 ?auto_172333 ) ( ON ?auto_172330 ?auto_172338 ) ( CLEAR ?auto_172330 ) ( not ( = ?auto_172330 ?auto_172338 ) ) ( not ( = ?auto_172331 ?auto_172338 ) ) ( not ( = ?auto_172332 ?auto_172338 ) ) ( not ( = ?auto_172333 ?auto_172338 ) ) ( not ( = ?auto_172334 ?auto_172338 ) ) ( not ( = ?auto_172335 ?auto_172338 ) ) ( not ( = ?auto_172336 ?auto_172338 ) ) ( not ( = ?auto_172337 ?auto_172338 ) ) ( HOLDING ?auto_172331 ) ( CLEAR ?auto_172332 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172337 ?auto_172336 ?auto_172335 ?auto_172334 ?auto_172333 ?auto_172332 ?auto_172331 )
      ( MAKE-6PILE ?auto_172330 ?auto_172331 ?auto_172332 ?auto_172333 ?auto_172334 ?auto_172335 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172339 - BLOCK
      ?auto_172340 - BLOCK
      ?auto_172341 - BLOCK
      ?auto_172342 - BLOCK
      ?auto_172343 - BLOCK
      ?auto_172344 - BLOCK
    )
    :vars
    (
      ?auto_172347 - BLOCK
      ?auto_172346 - BLOCK
      ?auto_172345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172339 ?auto_172340 ) ) ( not ( = ?auto_172339 ?auto_172341 ) ) ( not ( = ?auto_172339 ?auto_172342 ) ) ( not ( = ?auto_172339 ?auto_172343 ) ) ( not ( = ?auto_172339 ?auto_172344 ) ) ( not ( = ?auto_172340 ?auto_172341 ) ) ( not ( = ?auto_172340 ?auto_172342 ) ) ( not ( = ?auto_172340 ?auto_172343 ) ) ( not ( = ?auto_172340 ?auto_172344 ) ) ( not ( = ?auto_172341 ?auto_172342 ) ) ( not ( = ?auto_172341 ?auto_172343 ) ) ( not ( = ?auto_172341 ?auto_172344 ) ) ( not ( = ?auto_172342 ?auto_172343 ) ) ( not ( = ?auto_172342 ?auto_172344 ) ) ( not ( = ?auto_172343 ?auto_172344 ) ) ( ON ?auto_172344 ?auto_172347 ) ( not ( = ?auto_172339 ?auto_172347 ) ) ( not ( = ?auto_172340 ?auto_172347 ) ) ( not ( = ?auto_172341 ?auto_172347 ) ) ( not ( = ?auto_172342 ?auto_172347 ) ) ( not ( = ?auto_172343 ?auto_172347 ) ) ( not ( = ?auto_172344 ?auto_172347 ) ) ( ON ?auto_172343 ?auto_172344 ) ( ON-TABLE ?auto_172346 ) ( ON ?auto_172347 ?auto_172346 ) ( not ( = ?auto_172346 ?auto_172347 ) ) ( not ( = ?auto_172346 ?auto_172344 ) ) ( not ( = ?auto_172346 ?auto_172343 ) ) ( not ( = ?auto_172339 ?auto_172346 ) ) ( not ( = ?auto_172340 ?auto_172346 ) ) ( not ( = ?auto_172341 ?auto_172346 ) ) ( not ( = ?auto_172342 ?auto_172346 ) ) ( ON ?auto_172342 ?auto_172343 ) ( ON ?auto_172341 ?auto_172342 ) ( ON ?auto_172339 ?auto_172345 ) ( not ( = ?auto_172339 ?auto_172345 ) ) ( not ( = ?auto_172340 ?auto_172345 ) ) ( not ( = ?auto_172341 ?auto_172345 ) ) ( not ( = ?auto_172342 ?auto_172345 ) ) ( not ( = ?auto_172343 ?auto_172345 ) ) ( not ( = ?auto_172344 ?auto_172345 ) ) ( not ( = ?auto_172347 ?auto_172345 ) ) ( not ( = ?auto_172346 ?auto_172345 ) ) ( CLEAR ?auto_172341 ) ( ON ?auto_172340 ?auto_172339 ) ( CLEAR ?auto_172340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172345 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172345 ?auto_172339 )
      ( MAKE-6PILE ?auto_172339 ?auto_172340 ?auto_172341 ?auto_172342 ?auto_172343 ?auto_172344 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172348 - BLOCK
      ?auto_172349 - BLOCK
      ?auto_172350 - BLOCK
      ?auto_172351 - BLOCK
      ?auto_172352 - BLOCK
      ?auto_172353 - BLOCK
    )
    :vars
    (
      ?auto_172354 - BLOCK
      ?auto_172356 - BLOCK
      ?auto_172355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172348 ?auto_172349 ) ) ( not ( = ?auto_172348 ?auto_172350 ) ) ( not ( = ?auto_172348 ?auto_172351 ) ) ( not ( = ?auto_172348 ?auto_172352 ) ) ( not ( = ?auto_172348 ?auto_172353 ) ) ( not ( = ?auto_172349 ?auto_172350 ) ) ( not ( = ?auto_172349 ?auto_172351 ) ) ( not ( = ?auto_172349 ?auto_172352 ) ) ( not ( = ?auto_172349 ?auto_172353 ) ) ( not ( = ?auto_172350 ?auto_172351 ) ) ( not ( = ?auto_172350 ?auto_172352 ) ) ( not ( = ?auto_172350 ?auto_172353 ) ) ( not ( = ?auto_172351 ?auto_172352 ) ) ( not ( = ?auto_172351 ?auto_172353 ) ) ( not ( = ?auto_172352 ?auto_172353 ) ) ( ON ?auto_172353 ?auto_172354 ) ( not ( = ?auto_172348 ?auto_172354 ) ) ( not ( = ?auto_172349 ?auto_172354 ) ) ( not ( = ?auto_172350 ?auto_172354 ) ) ( not ( = ?auto_172351 ?auto_172354 ) ) ( not ( = ?auto_172352 ?auto_172354 ) ) ( not ( = ?auto_172353 ?auto_172354 ) ) ( ON ?auto_172352 ?auto_172353 ) ( ON-TABLE ?auto_172356 ) ( ON ?auto_172354 ?auto_172356 ) ( not ( = ?auto_172356 ?auto_172354 ) ) ( not ( = ?auto_172356 ?auto_172353 ) ) ( not ( = ?auto_172356 ?auto_172352 ) ) ( not ( = ?auto_172348 ?auto_172356 ) ) ( not ( = ?auto_172349 ?auto_172356 ) ) ( not ( = ?auto_172350 ?auto_172356 ) ) ( not ( = ?auto_172351 ?auto_172356 ) ) ( ON ?auto_172351 ?auto_172352 ) ( ON ?auto_172348 ?auto_172355 ) ( not ( = ?auto_172348 ?auto_172355 ) ) ( not ( = ?auto_172349 ?auto_172355 ) ) ( not ( = ?auto_172350 ?auto_172355 ) ) ( not ( = ?auto_172351 ?auto_172355 ) ) ( not ( = ?auto_172352 ?auto_172355 ) ) ( not ( = ?auto_172353 ?auto_172355 ) ) ( not ( = ?auto_172354 ?auto_172355 ) ) ( not ( = ?auto_172356 ?auto_172355 ) ) ( ON ?auto_172349 ?auto_172348 ) ( CLEAR ?auto_172349 ) ( ON-TABLE ?auto_172355 ) ( HOLDING ?auto_172350 ) ( CLEAR ?auto_172351 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172356 ?auto_172354 ?auto_172353 ?auto_172352 ?auto_172351 ?auto_172350 )
      ( MAKE-6PILE ?auto_172348 ?auto_172349 ?auto_172350 ?auto_172351 ?auto_172352 ?auto_172353 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172357 - BLOCK
      ?auto_172358 - BLOCK
      ?auto_172359 - BLOCK
      ?auto_172360 - BLOCK
      ?auto_172361 - BLOCK
      ?auto_172362 - BLOCK
    )
    :vars
    (
      ?auto_172365 - BLOCK
      ?auto_172363 - BLOCK
      ?auto_172364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172357 ?auto_172358 ) ) ( not ( = ?auto_172357 ?auto_172359 ) ) ( not ( = ?auto_172357 ?auto_172360 ) ) ( not ( = ?auto_172357 ?auto_172361 ) ) ( not ( = ?auto_172357 ?auto_172362 ) ) ( not ( = ?auto_172358 ?auto_172359 ) ) ( not ( = ?auto_172358 ?auto_172360 ) ) ( not ( = ?auto_172358 ?auto_172361 ) ) ( not ( = ?auto_172358 ?auto_172362 ) ) ( not ( = ?auto_172359 ?auto_172360 ) ) ( not ( = ?auto_172359 ?auto_172361 ) ) ( not ( = ?auto_172359 ?auto_172362 ) ) ( not ( = ?auto_172360 ?auto_172361 ) ) ( not ( = ?auto_172360 ?auto_172362 ) ) ( not ( = ?auto_172361 ?auto_172362 ) ) ( ON ?auto_172362 ?auto_172365 ) ( not ( = ?auto_172357 ?auto_172365 ) ) ( not ( = ?auto_172358 ?auto_172365 ) ) ( not ( = ?auto_172359 ?auto_172365 ) ) ( not ( = ?auto_172360 ?auto_172365 ) ) ( not ( = ?auto_172361 ?auto_172365 ) ) ( not ( = ?auto_172362 ?auto_172365 ) ) ( ON ?auto_172361 ?auto_172362 ) ( ON-TABLE ?auto_172363 ) ( ON ?auto_172365 ?auto_172363 ) ( not ( = ?auto_172363 ?auto_172365 ) ) ( not ( = ?auto_172363 ?auto_172362 ) ) ( not ( = ?auto_172363 ?auto_172361 ) ) ( not ( = ?auto_172357 ?auto_172363 ) ) ( not ( = ?auto_172358 ?auto_172363 ) ) ( not ( = ?auto_172359 ?auto_172363 ) ) ( not ( = ?auto_172360 ?auto_172363 ) ) ( ON ?auto_172360 ?auto_172361 ) ( ON ?auto_172357 ?auto_172364 ) ( not ( = ?auto_172357 ?auto_172364 ) ) ( not ( = ?auto_172358 ?auto_172364 ) ) ( not ( = ?auto_172359 ?auto_172364 ) ) ( not ( = ?auto_172360 ?auto_172364 ) ) ( not ( = ?auto_172361 ?auto_172364 ) ) ( not ( = ?auto_172362 ?auto_172364 ) ) ( not ( = ?auto_172365 ?auto_172364 ) ) ( not ( = ?auto_172363 ?auto_172364 ) ) ( ON ?auto_172358 ?auto_172357 ) ( ON-TABLE ?auto_172364 ) ( CLEAR ?auto_172360 ) ( ON ?auto_172359 ?auto_172358 ) ( CLEAR ?auto_172359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172364 ?auto_172357 ?auto_172358 )
      ( MAKE-6PILE ?auto_172357 ?auto_172358 ?auto_172359 ?auto_172360 ?auto_172361 ?auto_172362 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172366 - BLOCK
      ?auto_172367 - BLOCK
      ?auto_172368 - BLOCK
      ?auto_172369 - BLOCK
      ?auto_172370 - BLOCK
      ?auto_172371 - BLOCK
    )
    :vars
    (
      ?auto_172373 - BLOCK
      ?auto_172374 - BLOCK
      ?auto_172372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172366 ?auto_172367 ) ) ( not ( = ?auto_172366 ?auto_172368 ) ) ( not ( = ?auto_172366 ?auto_172369 ) ) ( not ( = ?auto_172366 ?auto_172370 ) ) ( not ( = ?auto_172366 ?auto_172371 ) ) ( not ( = ?auto_172367 ?auto_172368 ) ) ( not ( = ?auto_172367 ?auto_172369 ) ) ( not ( = ?auto_172367 ?auto_172370 ) ) ( not ( = ?auto_172367 ?auto_172371 ) ) ( not ( = ?auto_172368 ?auto_172369 ) ) ( not ( = ?auto_172368 ?auto_172370 ) ) ( not ( = ?auto_172368 ?auto_172371 ) ) ( not ( = ?auto_172369 ?auto_172370 ) ) ( not ( = ?auto_172369 ?auto_172371 ) ) ( not ( = ?auto_172370 ?auto_172371 ) ) ( ON ?auto_172371 ?auto_172373 ) ( not ( = ?auto_172366 ?auto_172373 ) ) ( not ( = ?auto_172367 ?auto_172373 ) ) ( not ( = ?auto_172368 ?auto_172373 ) ) ( not ( = ?auto_172369 ?auto_172373 ) ) ( not ( = ?auto_172370 ?auto_172373 ) ) ( not ( = ?auto_172371 ?auto_172373 ) ) ( ON ?auto_172370 ?auto_172371 ) ( ON-TABLE ?auto_172374 ) ( ON ?auto_172373 ?auto_172374 ) ( not ( = ?auto_172374 ?auto_172373 ) ) ( not ( = ?auto_172374 ?auto_172371 ) ) ( not ( = ?auto_172374 ?auto_172370 ) ) ( not ( = ?auto_172366 ?auto_172374 ) ) ( not ( = ?auto_172367 ?auto_172374 ) ) ( not ( = ?auto_172368 ?auto_172374 ) ) ( not ( = ?auto_172369 ?auto_172374 ) ) ( ON ?auto_172366 ?auto_172372 ) ( not ( = ?auto_172366 ?auto_172372 ) ) ( not ( = ?auto_172367 ?auto_172372 ) ) ( not ( = ?auto_172368 ?auto_172372 ) ) ( not ( = ?auto_172369 ?auto_172372 ) ) ( not ( = ?auto_172370 ?auto_172372 ) ) ( not ( = ?auto_172371 ?auto_172372 ) ) ( not ( = ?auto_172373 ?auto_172372 ) ) ( not ( = ?auto_172374 ?auto_172372 ) ) ( ON ?auto_172367 ?auto_172366 ) ( ON-TABLE ?auto_172372 ) ( ON ?auto_172368 ?auto_172367 ) ( CLEAR ?auto_172368 ) ( HOLDING ?auto_172369 ) ( CLEAR ?auto_172370 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172374 ?auto_172373 ?auto_172371 ?auto_172370 ?auto_172369 )
      ( MAKE-6PILE ?auto_172366 ?auto_172367 ?auto_172368 ?auto_172369 ?auto_172370 ?auto_172371 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172375 - BLOCK
      ?auto_172376 - BLOCK
      ?auto_172377 - BLOCK
      ?auto_172378 - BLOCK
      ?auto_172379 - BLOCK
      ?auto_172380 - BLOCK
    )
    :vars
    (
      ?auto_172383 - BLOCK
      ?auto_172382 - BLOCK
      ?auto_172381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172375 ?auto_172376 ) ) ( not ( = ?auto_172375 ?auto_172377 ) ) ( not ( = ?auto_172375 ?auto_172378 ) ) ( not ( = ?auto_172375 ?auto_172379 ) ) ( not ( = ?auto_172375 ?auto_172380 ) ) ( not ( = ?auto_172376 ?auto_172377 ) ) ( not ( = ?auto_172376 ?auto_172378 ) ) ( not ( = ?auto_172376 ?auto_172379 ) ) ( not ( = ?auto_172376 ?auto_172380 ) ) ( not ( = ?auto_172377 ?auto_172378 ) ) ( not ( = ?auto_172377 ?auto_172379 ) ) ( not ( = ?auto_172377 ?auto_172380 ) ) ( not ( = ?auto_172378 ?auto_172379 ) ) ( not ( = ?auto_172378 ?auto_172380 ) ) ( not ( = ?auto_172379 ?auto_172380 ) ) ( ON ?auto_172380 ?auto_172383 ) ( not ( = ?auto_172375 ?auto_172383 ) ) ( not ( = ?auto_172376 ?auto_172383 ) ) ( not ( = ?auto_172377 ?auto_172383 ) ) ( not ( = ?auto_172378 ?auto_172383 ) ) ( not ( = ?auto_172379 ?auto_172383 ) ) ( not ( = ?auto_172380 ?auto_172383 ) ) ( ON ?auto_172379 ?auto_172380 ) ( ON-TABLE ?auto_172382 ) ( ON ?auto_172383 ?auto_172382 ) ( not ( = ?auto_172382 ?auto_172383 ) ) ( not ( = ?auto_172382 ?auto_172380 ) ) ( not ( = ?auto_172382 ?auto_172379 ) ) ( not ( = ?auto_172375 ?auto_172382 ) ) ( not ( = ?auto_172376 ?auto_172382 ) ) ( not ( = ?auto_172377 ?auto_172382 ) ) ( not ( = ?auto_172378 ?auto_172382 ) ) ( ON ?auto_172375 ?auto_172381 ) ( not ( = ?auto_172375 ?auto_172381 ) ) ( not ( = ?auto_172376 ?auto_172381 ) ) ( not ( = ?auto_172377 ?auto_172381 ) ) ( not ( = ?auto_172378 ?auto_172381 ) ) ( not ( = ?auto_172379 ?auto_172381 ) ) ( not ( = ?auto_172380 ?auto_172381 ) ) ( not ( = ?auto_172383 ?auto_172381 ) ) ( not ( = ?auto_172382 ?auto_172381 ) ) ( ON ?auto_172376 ?auto_172375 ) ( ON-TABLE ?auto_172381 ) ( ON ?auto_172377 ?auto_172376 ) ( CLEAR ?auto_172379 ) ( ON ?auto_172378 ?auto_172377 ) ( CLEAR ?auto_172378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172381 ?auto_172375 ?auto_172376 ?auto_172377 )
      ( MAKE-6PILE ?auto_172375 ?auto_172376 ?auto_172377 ?auto_172378 ?auto_172379 ?auto_172380 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172384 - BLOCK
      ?auto_172385 - BLOCK
      ?auto_172386 - BLOCK
      ?auto_172387 - BLOCK
      ?auto_172388 - BLOCK
      ?auto_172389 - BLOCK
    )
    :vars
    (
      ?auto_172390 - BLOCK
      ?auto_172392 - BLOCK
      ?auto_172391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172384 ?auto_172385 ) ) ( not ( = ?auto_172384 ?auto_172386 ) ) ( not ( = ?auto_172384 ?auto_172387 ) ) ( not ( = ?auto_172384 ?auto_172388 ) ) ( not ( = ?auto_172384 ?auto_172389 ) ) ( not ( = ?auto_172385 ?auto_172386 ) ) ( not ( = ?auto_172385 ?auto_172387 ) ) ( not ( = ?auto_172385 ?auto_172388 ) ) ( not ( = ?auto_172385 ?auto_172389 ) ) ( not ( = ?auto_172386 ?auto_172387 ) ) ( not ( = ?auto_172386 ?auto_172388 ) ) ( not ( = ?auto_172386 ?auto_172389 ) ) ( not ( = ?auto_172387 ?auto_172388 ) ) ( not ( = ?auto_172387 ?auto_172389 ) ) ( not ( = ?auto_172388 ?auto_172389 ) ) ( ON ?auto_172389 ?auto_172390 ) ( not ( = ?auto_172384 ?auto_172390 ) ) ( not ( = ?auto_172385 ?auto_172390 ) ) ( not ( = ?auto_172386 ?auto_172390 ) ) ( not ( = ?auto_172387 ?auto_172390 ) ) ( not ( = ?auto_172388 ?auto_172390 ) ) ( not ( = ?auto_172389 ?auto_172390 ) ) ( ON-TABLE ?auto_172392 ) ( ON ?auto_172390 ?auto_172392 ) ( not ( = ?auto_172392 ?auto_172390 ) ) ( not ( = ?auto_172392 ?auto_172389 ) ) ( not ( = ?auto_172392 ?auto_172388 ) ) ( not ( = ?auto_172384 ?auto_172392 ) ) ( not ( = ?auto_172385 ?auto_172392 ) ) ( not ( = ?auto_172386 ?auto_172392 ) ) ( not ( = ?auto_172387 ?auto_172392 ) ) ( ON ?auto_172384 ?auto_172391 ) ( not ( = ?auto_172384 ?auto_172391 ) ) ( not ( = ?auto_172385 ?auto_172391 ) ) ( not ( = ?auto_172386 ?auto_172391 ) ) ( not ( = ?auto_172387 ?auto_172391 ) ) ( not ( = ?auto_172388 ?auto_172391 ) ) ( not ( = ?auto_172389 ?auto_172391 ) ) ( not ( = ?auto_172390 ?auto_172391 ) ) ( not ( = ?auto_172392 ?auto_172391 ) ) ( ON ?auto_172385 ?auto_172384 ) ( ON-TABLE ?auto_172391 ) ( ON ?auto_172386 ?auto_172385 ) ( ON ?auto_172387 ?auto_172386 ) ( CLEAR ?auto_172387 ) ( HOLDING ?auto_172388 ) ( CLEAR ?auto_172389 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172392 ?auto_172390 ?auto_172389 ?auto_172388 )
      ( MAKE-6PILE ?auto_172384 ?auto_172385 ?auto_172386 ?auto_172387 ?auto_172388 ?auto_172389 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172393 - BLOCK
      ?auto_172394 - BLOCK
      ?auto_172395 - BLOCK
      ?auto_172396 - BLOCK
      ?auto_172397 - BLOCK
      ?auto_172398 - BLOCK
    )
    :vars
    (
      ?auto_172399 - BLOCK
      ?auto_172401 - BLOCK
      ?auto_172400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172393 ?auto_172394 ) ) ( not ( = ?auto_172393 ?auto_172395 ) ) ( not ( = ?auto_172393 ?auto_172396 ) ) ( not ( = ?auto_172393 ?auto_172397 ) ) ( not ( = ?auto_172393 ?auto_172398 ) ) ( not ( = ?auto_172394 ?auto_172395 ) ) ( not ( = ?auto_172394 ?auto_172396 ) ) ( not ( = ?auto_172394 ?auto_172397 ) ) ( not ( = ?auto_172394 ?auto_172398 ) ) ( not ( = ?auto_172395 ?auto_172396 ) ) ( not ( = ?auto_172395 ?auto_172397 ) ) ( not ( = ?auto_172395 ?auto_172398 ) ) ( not ( = ?auto_172396 ?auto_172397 ) ) ( not ( = ?auto_172396 ?auto_172398 ) ) ( not ( = ?auto_172397 ?auto_172398 ) ) ( ON ?auto_172398 ?auto_172399 ) ( not ( = ?auto_172393 ?auto_172399 ) ) ( not ( = ?auto_172394 ?auto_172399 ) ) ( not ( = ?auto_172395 ?auto_172399 ) ) ( not ( = ?auto_172396 ?auto_172399 ) ) ( not ( = ?auto_172397 ?auto_172399 ) ) ( not ( = ?auto_172398 ?auto_172399 ) ) ( ON-TABLE ?auto_172401 ) ( ON ?auto_172399 ?auto_172401 ) ( not ( = ?auto_172401 ?auto_172399 ) ) ( not ( = ?auto_172401 ?auto_172398 ) ) ( not ( = ?auto_172401 ?auto_172397 ) ) ( not ( = ?auto_172393 ?auto_172401 ) ) ( not ( = ?auto_172394 ?auto_172401 ) ) ( not ( = ?auto_172395 ?auto_172401 ) ) ( not ( = ?auto_172396 ?auto_172401 ) ) ( ON ?auto_172393 ?auto_172400 ) ( not ( = ?auto_172393 ?auto_172400 ) ) ( not ( = ?auto_172394 ?auto_172400 ) ) ( not ( = ?auto_172395 ?auto_172400 ) ) ( not ( = ?auto_172396 ?auto_172400 ) ) ( not ( = ?auto_172397 ?auto_172400 ) ) ( not ( = ?auto_172398 ?auto_172400 ) ) ( not ( = ?auto_172399 ?auto_172400 ) ) ( not ( = ?auto_172401 ?auto_172400 ) ) ( ON ?auto_172394 ?auto_172393 ) ( ON-TABLE ?auto_172400 ) ( ON ?auto_172395 ?auto_172394 ) ( ON ?auto_172396 ?auto_172395 ) ( CLEAR ?auto_172398 ) ( ON ?auto_172397 ?auto_172396 ) ( CLEAR ?auto_172397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172400 ?auto_172393 ?auto_172394 ?auto_172395 ?auto_172396 )
      ( MAKE-6PILE ?auto_172393 ?auto_172394 ?auto_172395 ?auto_172396 ?auto_172397 ?auto_172398 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172402 - BLOCK
      ?auto_172403 - BLOCK
      ?auto_172404 - BLOCK
      ?auto_172405 - BLOCK
      ?auto_172406 - BLOCK
      ?auto_172407 - BLOCK
    )
    :vars
    (
      ?auto_172410 - BLOCK
      ?auto_172409 - BLOCK
      ?auto_172408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172402 ?auto_172403 ) ) ( not ( = ?auto_172402 ?auto_172404 ) ) ( not ( = ?auto_172402 ?auto_172405 ) ) ( not ( = ?auto_172402 ?auto_172406 ) ) ( not ( = ?auto_172402 ?auto_172407 ) ) ( not ( = ?auto_172403 ?auto_172404 ) ) ( not ( = ?auto_172403 ?auto_172405 ) ) ( not ( = ?auto_172403 ?auto_172406 ) ) ( not ( = ?auto_172403 ?auto_172407 ) ) ( not ( = ?auto_172404 ?auto_172405 ) ) ( not ( = ?auto_172404 ?auto_172406 ) ) ( not ( = ?auto_172404 ?auto_172407 ) ) ( not ( = ?auto_172405 ?auto_172406 ) ) ( not ( = ?auto_172405 ?auto_172407 ) ) ( not ( = ?auto_172406 ?auto_172407 ) ) ( not ( = ?auto_172402 ?auto_172410 ) ) ( not ( = ?auto_172403 ?auto_172410 ) ) ( not ( = ?auto_172404 ?auto_172410 ) ) ( not ( = ?auto_172405 ?auto_172410 ) ) ( not ( = ?auto_172406 ?auto_172410 ) ) ( not ( = ?auto_172407 ?auto_172410 ) ) ( ON-TABLE ?auto_172409 ) ( ON ?auto_172410 ?auto_172409 ) ( not ( = ?auto_172409 ?auto_172410 ) ) ( not ( = ?auto_172409 ?auto_172407 ) ) ( not ( = ?auto_172409 ?auto_172406 ) ) ( not ( = ?auto_172402 ?auto_172409 ) ) ( not ( = ?auto_172403 ?auto_172409 ) ) ( not ( = ?auto_172404 ?auto_172409 ) ) ( not ( = ?auto_172405 ?auto_172409 ) ) ( ON ?auto_172402 ?auto_172408 ) ( not ( = ?auto_172402 ?auto_172408 ) ) ( not ( = ?auto_172403 ?auto_172408 ) ) ( not ( = ?auto_172404 ?auto_172408 ) ) ( not ( = ?auto_172405 ?auto_172408 ) ) ( not ( = ?auto_172406 ?auto_172408 ) ) ( not ( = ?auto_172407 ?auto_172408 ) ) ( not ( = ?auto_172410 ?auto_172408 ) ) ( not ( = ?auto_172409 ?auto_172408 ) ) ( ON ?auto_172403 ?auto_172402 ) ( ON-TABLE ?auto_172408 ) ( ON ?auto_172404 ?auto_172403 ) ( ON ?auto_172405 ?auto_172404 ) ( ON ?auto_172406 ?auto_172405 ) ( CLEAR ?auto_172406 ) ( HOLDING ?auto_172407 ) ( CLEAR ?auto_172410 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172409 ?auto_172410 ?auto_172407 )
      ( MAKE-6PILE ?auto_172402 ?auto_172403 ?auto_172404 ?auto_172405 ?auto_172406 ?auto_172407 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172411 - BLOCK
      ?auto_172412 - BLOCK
      ?auto_172413 - BLOCK
      ?auto_172414 - BLOCK
      ?auto_172415 - BLOCK
      ?auto_172416 - BLOCK
    )
    :vars
    (
      ?auto_172417 - BLOCK
      ?auto_172419 - BLOCK
      ?auto_172418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172411 ?auto_172412 ) ) ( not ( = ?auto_172411 ?auto_172413 ) ) ( not ( = ?auto_172411 ?auto_172414 ) ) ( not ( = ?auto_172411 ?auto_172415 ) ) ( not ( = ?auto_172411 ?auto_172416 ) ) ( not ( = ?auto_172412 ?auto_172413 ) ) ( not ( = ?auto_172412 ?auto_172414 ) ) ( not ( = ?auto_172412 ?auto_172415 ) ) ( not ( = ?auto_172412 ?auto_172416 ) ) ( not ( = ?auto_172413 ?auto_172414 ) ) ( not ( = ?auto_172413 ?auto_172415 ) ) ( not ( = ?auto_172413 ?auto_172416 ) ) ( not ( = ?auto_172414 ?auto_172415 ) ) ( not ( = ?auto_172414 ?auto_172416 ) ) ( not ( = ?auto_172415 ?auto_172416 ) ) ( not ( = ?auto_172411 ?auto_172417 ) ) ( not ( = ?auto_172412 ?auto_172417 ) ) ( not ( = ?auto_172413 ?auto_172417 ) ) ( not ( = ?auto_172414 ?auto_172417 ) ) ( not ( = ?auto_172415 ?auto_172417 ) ) ( not ( = ?auto_172416 ?auto_172417 ) ) ( ON-TABLE ?auto_172419 ) ( ON ?auto_172417 ?auto_172419 ) ( not ( = ?auto_172419 ?auto_172417 ) ) ( not ( = ?auto_172419 ?auto_172416 ) ) ( not ( = ?auto_172419 ?auto_172415 ) ) ( not ( = ?auto_172411 ?auto_172419 ) ) ( not ( = ?auto_172412 ?auto_172419 ) ) ( not ( = ?auto_172413 ?auto_172419 ) ) ( not ( = ?auto_172414 ?auto_172419 ) ) ( ON ?auto_172411 ?auto_172418 ) ( not ( = ?auto_172411 ?auto_172418 ) ) ( not ( = ?auto_172412 ?auto_172418 ) ) ( not ( = ?auto_172413 ?auto_172418 ) ) ( not ( = ?auto_172414 ?auto_172418 ) ) ( not ( = ?auto_172415 ?auto_172418 ) ) ( not ( = ?auto_172416 ?auto_172418 ) ) ( not ( = ?auto_172417 ?auto_172418 ) ) ( not ( = ?auto_172419 ?auto_172418 ) ) ( ON ?auto_172412 ?auto_172411 ) ( ON-TABLE ?auto_172418 ) ( ON ?auto_172413 ?auto_172412 ) ( ON ?auto_172414 ?auto_172413 ) ( ON ?auto_172415 ?auto_172414 ) ( CLEAR ?auto_172417 ) ( ON ?auto_172416 ?auto_172415 ) ( CLEAR ?auto_172416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172418 ?auto_172411 ?auto_172412 ?auto_172413 ?auto_172414 ?auto_172415 )
      ( MAKE-6PILE ?auto_172411 ?auto_172412 ?auto_172413 ?auto_172414 ?auto_172415 ?auto_172416 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172420 - BLOCK
      ?auto_172421 - BLOCK
      ?auto_172422 - BLOCK
      ?auto_172423 - BLOCK
      ?auto_172424 - BLOCK
      ?auto_172425 - BLOCK
    )
    :vars
    (
      ?auto_172427 - BLOCK
      ?auto_172428 - BLOCK
      ?auto_172426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172420 ?auto_172421 ) ) ( not ( = ?auto_172420 ?auto_172422 ) ) ( not ( = ?auto_172420 ?auto_172423 ) ) ( not ( = ?auto_172420 ?auto_172424 ) ) ( not ( = ?auto_172420 ?auto_172425 ) ) ( not ( = ?auto_172421 ?auto_172422 ) ) ( not ( = ?auto_172421 ?auto_172423 ) ) ( not ( = ?auto_172421 ?auto_172424 ) ) ( not ( = ?auto_172421 ?auto_172425 ) ) ( not ( = ?auto_172422 ?auto_172423 ) ) ( not ( = ?auto_172422 ?auto_172424 ) ) ( not ( = ?auto_172422 ?auto_172425 ) ) ( not ( = ?auto_172423 ?auto_172424 ) ) ( not ( = ?auto_172423 ?auto_172425 ) ) ( not ( = ?auto_172424 ?auto_172425 ) ) ( not ( = ?auto_172420 ?auto_172427 ) ) ( not ( = ?auto_172421 ?auto_172427 ) ) ( not ( = ?auto_172422 ?auto_172427 ) ) ( not ( = ?auto_172423 ?auto_172427 ) ) ( not ( = ?auto_172424 ?auto_172427 ) ) ( not ( = ?auto_172425 ?auto_172427 ) ) ( ON-TABLE ?auto_172428 ) ( not ( = ?auto_172428 ?auto_172427 ) ) ( not ( = ?auto_172428 ?auto_172425 ) ) ( not ( = ?auto_172428 ?auto_172424 ) ) ( not ( = ?auto_172420 ?auto_172428 ) ) ( not ( = ?auto_172421 ?auto_172428 ) ) ( not ( = ?auto_172422 ?auto_172428 ) ) ( not ( = ?auto_172423 ?auto_172428 ) ) ( ON ?auto_172420 ?auto_172426 ) ( not ( = ?auto_172420 ?auto_172426 ) ) ( not ( = ?auto_172421 ?auto_172426 ) ) ( not ( = ?auto_172422 ?auto_172426 ) ) ( not ( = ?auto_172423 ?auto_172426 ) ) ( not ( = ?auto_172424 ?auto_172426 ) ) ( not ( = ?auto_172425 ?auto_172426 ) ) ( not ( = ?auto_172427 ?auto_172426 ) ) ( not ( = ?auto_172428 ?auto_172426 ) ) ( ON ?auto_172421 ?auto_172420 ) ( ON-TABLE ?auto_172426 ) ( ON ?auto_172422 ?auto_172421 ) ( ON ?auto_172423 ?auto_172422 ) ( ON ?auto_172424 ?auto_172423 ) ( ON ?auto_172425 ?auto_172424 ) ( CLEAR ?auto_172425 ) ( HOLDING ?auto_172427 ) ( CLEAR ?auto_172428 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172428 ?auto_172427 )
      ( MAKE-6PILE ?auto_172420 ?auto_172421 ?auto_172422 ?auto_172423 ?auto_172424 ?auto_172425 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172429 - BLOCK
      ?auto_172430 - BLOCK
      ?auto_172431 - BLOCK
      ?auto_172432 - BLOCK
      ?auto_172433 - BLOCK
      ?auto_172434 - BLOCK
    )
    :vars
    (
      ?auto_172437 - BLOCK
      ?auto_172436 - BLOCK
      ?auto_172435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172429 ?auto_172430 ) ) ( not ( = ?auto_172429 ?auto_172431 ) ) ( not ( = ?auto_172429 ?auto_172432 ) ) ( not ( = ?auto_172429 ?auto_172433 ) ) ( not ( = ?auto_172429 ?auto_172434 ) ) ( not ( = ?auto_172430 ?auto_172431 ) ) ( not ( = ?auto_172430 ?auto_172432 ) ) ( not ( = ?auto_172430 ?auto_172433 ) ) ( not ( = ?auto_172430 ?auto_172434 ) ) ( not ( = ?auto_172431 ?auto_172432 ) ) ( not ( = ?auto_172431 ?auto_172433 ) ) ( not ( = ?auto_172431 ?auto_172434 ) ) ( not ( = ?auto_172432 ?auto_172433 ) ) ( not ( = ?auto_172432 ?auto_172434 ) ) ( not ( = ?auto_172433 ?auto_172434 ) ) ( not ( = ?auto_172429 ?auto_172437 ) ) ( not ( = ?auto_172430 ?auto_172437 ) ) ( not ( = ?auto_172431 ?auto_172437 ) ) ( not ( = ?auto_172432 ?auto_172437 ) ) ( not ( = ?auto_172433 ?auto_172437 ) ) ( not ( = ?auto_172434 ?auto_172437 ) ) ( ON-TABLE ?auto_172436 ) ( not ( = ?auto_172436 ?auto_172437 ) ) ( not ( = ?auto_172436 ?auto_172434 ) ) ( not ( = ?auto_172436 ?auto_172433 ) ) ( not ( = ?auto_172429 ?auto_172436 ) ) ( not ( = ?auto_172430 ?auto_172436 ) ) ( not ( = ?auto_172431 ?auto_172436 ) ) ( not ( = ?auto_172432 ?auto_172436 ) ) ( ON ?auto_172429 ?auto_172435 ) ( not ( = ?auto_172429 ?auto_172435 ) ) ( not ( = ?auto_172430 ?auto_172435 ) ) ( not ( = ?auto_172431 ?auto_172435 ) ) ( not ( = ?auto_172432 ?auto_172435 ) ) ( not ( = ?auto_172433 ?auto_172435 ) ) ( not ( = ?auto_172434 ?auto_172435 ) ) ( not ( = ?auto_172437 ?auto_172435 ) ) ( not ( = ?auto_172436 ?auto_172435 ) ) ( ON ?auto_172430 ?auto_172429 ) ( ON-TABLE ?auto_172435 ) ( ON ?auto_172431 ?auto_172430 ) ( ON ?auto_172432 ?auto_172431 ) ( ON ?auto_172433 ?auto_172432 ) ( ON ?auto_172434 ?auto_172433 ) ( CLEAR ?auto_172436 ) ( ON ?auto_172437 ?auto_172434 ) ( CLEAR ?auto_172437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172435 ?auto_172429 ?auto_172430 ?auto_172431 ?auto_172432 ?auto_172433 ?auto_172434 )
      ( MAKE-6PILE ?auto_172429 ?auto_172430 ?auto_172431 ?auto_172432 ?auto_172433 ?auto_172434 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172438 - BLOCK
      ?auto_172439 - BLOCK
      ?auto_172440 - BLOCK
      ?auto_172441 - BLOCK
      ?auto_172442 - BLOCK
      ?auto_172443 - BLOCK
    )
    :vars
    (
      ?auto_172444 - BLOCK
      ?auto_172445 - BLOCK
      ?auto_172446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172438 ?auto_172439 ) ) ( not ( = ?auto_172438 ?auto_172440 ) ) ( not ( = ?auto_172438 ?auto_172441 ) ) ( not ( = ?auto_172438 ?auto_172442 ) ) ( not ( = ?auto_172438 ?auto_172443 ) ) ( not ( = ?auto_172439 ?auto_172440 ) ) ( not ( = ?auto_172439 ?auto_172441 ) ) ( not ( = ?auto_172439 ?auto_172442 ) ) ( not ( = ?auto_172439 ?auto_172443 ) ) ( not ( = ?auto_172440 ?auto_172441 ) ) ( not ( = ?auto_172440 ?auto_172442 ) ) ( not ( = ?auto_172440 ?auto_172443 ) ) ( not ( = ?auto_172441 ?auto_172442 ) ) ( not ( = ?auto_172441 ?auto_172443 ) ) ( not ( = ?auto_172442 ?auto_172443 ) ) ( not ( = ?auto_172438 ?auto_172444 ) ) ( not ( = ?auto_172439 ?auto_172444 ) ) ( not ( = ?auto_172440 ?auto_172444 ) ) ( not ( = ?auto_172441 ?auto_172444 ) ) ( not ( = ?auto_172442 ?auto_172444 ) ) ( not ( = ?auto_172443 ?auto_172444 ) ) ( not ( = ?auto_172445 ?auto_172444 ) ) ( not ( = ?auto_172445 ?auto_172443 ) ) ( not ( = ?auto_172445 ?auto_172442 ) ) ( not ( = ?auto_172438 ?auto_172445 ) ) ( not ( = ?auto_172439 ?auto_172445 ) ) ( not ( = ?auto_172440 ?auto_172445 ) ) ( not ( = ?auto_172441 ?auto_172445 ) ) ( ON ?auto_172438 ?auto_172446 ) ( not ( = ?auto_172438 ?auto_172446 ) ) ( not ( = ?auto_172439 ?auto_172446 ) ) ( not ( = ?auto_172440 ?auto_172446 ) ) ( not ( = ?auto_172441 ?auto_172446 ) ) ( not ( = ?auto_172442 ?auto_172446 ) ) ( not ( = ?auto_172443 ?auto_172446 ) ) ( not ( = ?auto_172444 ?auto_172446 ) ) ( not ( = ?auto_172445 ?auto_172446 ) ) ( ON ?auto_172439 ?auto_172438 ) ( ON-TABLE ?auto_172446 ) ( ON ?auto_172440 ?auto_172439 ) ( ON ?auto_172441 ?auto_172440 ) ( ON ?auto_172442 ?auto_172441 ) ( ON ?auto_172443 ?auto_172442 ) ( ON ?auto_172444 ?auto_172443 ) ( CLEAR ?auto_172444 ) ( HOLDING ?auto_172445 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172445 )
      ( MAKE-6PILE ?auto_172438 ?auto_172439 ?auto_172440 ?auto_172441 ?auto_172442 ?auto_172443 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_172447 - BLOCK
      ?auto_172448 - BLOCK
      ?auto_172449 - BLOCK
      ?auto_172450 - BLOCK
      ?auto_172451 - BLOCK
      ?auto_172452 - BLOCK
    )
    :vars
    (
      ?auto_172453 - BLOCK
      ?auto_172455 - BLOCK
      ?auto_172454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172447 ?auto_172448 ) ) ( not ( = ?auto_172447 ?auto_172449 ) ) ( not ( = ?auto_172447 ?auto_172450 ) ) ( not ( = ?auto_172447 ?auto_172451 ) ) ( not ( = ?auto_172447 ?auto_172452 ) ) ( not ( = ?auto_172448 ?auto_172449 ) ) ( not ( = ?auto_172448 ?auto_172450 ) ) ( not ( = ?auto_172448 ?auto_172451 ) ) ( not ( = ?auto_172448 ?auto_172452 ) ) ( not ( = ?auto_172449 ?auto_172450 ) ) ( not ( = ?auto_172449 ?auto_172451 ) ) ( not ( = ?auto_172449 ?auto_172452 ) ) ( not ( = ?auto_172450 ?auto_172451 ) ) ( not ( = ?auto_172450 ?auto_172452 ) ) ( not ( = ?auto_172451 ?auto_172452 ) ) ( not ( = ?auto_172447 ?auto_172453 ) ) ( not ( = ?auto_172448 ?auto_172453 ) ) ( not ( = ?auto_172449 ?auto_172453 ) ) ( not ( = ?auto_172450 ?auto_172453 ) ) ( not ( = ?auto_172451 ?auto_172453 ) ) ( not ( = ?auto_172452 ?auto_172453 ) ) ( not ( = ?auto_172455 ?auto_172453 ) ) ( not ( = ?auto_172455 ?auto_172452 ) ) ( not ( = ?auto_172455 ?auto_172451 ) ) ( not ( = ?auto_172447 ?auto_172455 ) ) ( not ( = ?auto_172448 ?auto_172455 ) ) ( not ( = ?auto_172449 ?auto_172455 ) ) ( not ( = ?auto_172450 ?auto_172455 ) ) ( ON ?auto_172447 ?auto_172454 ) ( not ( = ?auto_172447 ?auto_172454 ) ) ( not ( = ?auto_172448 ?auto_172454 ) ) ( not ( = ?auto_172449 ?auto_172454 ) ) ( not ( = ?auto_172450 ?auto_172454 ) ) ( not ( = ?auto_172451 ?auto_172454 ) ) ( not ( = ?auto_172452 ?auto_172454 ) ) ( not ( = ?auto_172453 ?auto_172454 ) ) ( not ( = ?auto_172455 ?auto_172454 ) ) ( ON ?auto_172448 ?auto_172447 ) ( ON-TABLE ?auto_172454 ) ( ON ?auto_172449 ?auto_172448 ) ( ON ?auto_172450 ?auto_172449 ) ( ON ?auto_172451 ?auto_172450 ) ( ON ?auto_172452 ?auto_172451 ) ( ON ?auto_172453 ?auto_172452 ) ( ON ?auto_172455 ?auto_172453 ) ( CLEAR ?auto_172455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172454 ?auto_172447 ?auto_172448 ?auto_172449 ?auto_172450 ?auto_172451 ?auto_172452 ?auto_172453 )
      ( MAKE-6PILE ?auto_172447 ?auto_172448 ?auto_172449 ?auto_172450 ?auto_172451 ?auto_172452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172467 - BLOCK
    )
    :vars
    (
      ?auto_172468 - BLOCK
      ?auto_172470 - BLOCK
      ?auto_172469 - BLOCK
      ?auto_172472 - BLOCK
      ?auto_172474 - BLOCK
      ?auto_172473 - BLOCK
      ?auto_172471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172468 ?auto_172467 ) ( ON-TABLE ?auto_172467 ) ( not ( = ?auto_172467 ?auto_172468 ) ) ( not ( = ?auto_172467 ?auto_172470 ) ) ( not ( = ?auto_172467 ?auto_172469 ) ) ( not ( = ?auto_172468 ?auto_172470 ) ) ( not ( = ?auto_172468 ?auto_172469 ) ) ( not ( = ?auto_172470 ?auto_172469 ) ) ( ON ?auto_172470 ?auto_172468 ) ( CLEAR ?auto_172470 ) ( HOLDING ?auto_172469 ) ( CLEAR ?auto_172472 ) ( ON-TABLE ?auto_172474 ) ( ON ?auto_172473 ?auto_172474 ) ( ON ?auto_172471 ?auto_172473 ) ( ON ?auto_172472 ?auto_172471 ) ( not ( = ?auto_172474 ?auto_172473 ) ) ( not ( = ?auto_172474 ?auto_172471 ) ) ( not ( = ?auto_172474 ?auto_172472 ) ) ( not ( = ?auto_172474 ?auto_172469 ) ) ( not ( = ?auto_172473 ?auto_172471 ) ) ( not ( = ?auto_172473 ?auto_172472 ) ) ( not ( = ?auto_172473 ?auto_172469 ) ) ( not ( = ?auto_172471 ?auto_172472 ) ) ( not ( = ?auto_172471 ?auto_172469 ) ) ( not ( = ?auto_172472 ?auto_172469 ) ) ( not ( = ?auto_172467 ?auto_172472 ) ) ( not ( = ?auto_172467 ?auto_172474 ) ) ( not ( = ?auto_172467 ?auto_172473 ) ) ( not ( = ?auto_172467 ?auto_172471 ) ) ( not ( = ?auto_172468 ?auto_172472 ) ) ( not ( = ?auto_172468 ?auto_172474 ) ) ( not ( = ?auto_172468 ?auto_172473 ) ) ( not ( = ?auto_172468 ?auto_172471 ) ) ( not ( = ?auto_172470 ?auto_172472 ) ) ( not ( = ?auto_172470 ?auto_172474 ) ) ( not ( = ?auto_172470 ?auto_172473 ) ) ( not ( = ?auto_172470 ?auto_172471 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172474 ?auto_172473 ?auto_172471 ?auto_172472 ?auto_172469 )
      ( MAKE-1PILE ?auto_172467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172475 - BLOCK
    )
    :vars
    (
      ?auto_172477 - BLOCK
      ?auto_172478 - BLOCK
      ?auto_172480 - BLOCK
      ?auto_172482 - BLOCK
      ?auto_172479 - BLOCK
      ?auto_172476 - BLOCK
      ?auto_172481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172477 ?auto_172475 ) ( ON-TABLE ?auto_172475 ) ( not ( = ?auto_172475 ?auto_172477 ) ) ( not ( = ?auto_172475 ?auto_172478 ) ) ( not ( = ?auto_172475 ?auto_172480 ) ) ( not ( = ?auto_172477 ?auto_172478 ) ) ( not ( = ?auto_172477 ?auto_172480 ) ) ( not ( = ?auto_172478 ?auto_172480 ) ) ( ON ?auto_172478 ?auto_172477 ) ( CLEAR ?auto_172482 ) ( ON-TABLE ?auto_172479 ) ( ON ?auto_172476 ?auto_172479 ) ( ON ?auto_172481 ?auto_172476 ) ( ON ?auto_172482 ?auto_172481 ) ( not ( = ?auto_172479 ?auto_172476 ) ) ( not ( = ?auto_172479 ?auto_172481 ) ) ( not ( = ?auto_172479 ?auto_172482 ) ) ( not ( = ?auto_172479 ?auto_172480 ) ) ( not ( = ?auto_172476 ?auto_172481 ) ) ( not ( = ?auto_172476 ?auto_172482 ) ) ( not ( = ?auto_172476 ?auto_172480 ) ) ( not ( = ?auto_172481 ?auto_172482 ) ) ( not ( = ?auto_172481 ?auto_172480 ) ) ( not ( = ?auto_172482 ?auto_172480 ) ) ( not ( = ?auto_172475 ?auto_172482 ) ) ( not ( = ?auto_172475 ?auto_172479 ) ) ( not ( = ?auto_172475 ?auto_172476 ) ) ( not ( = ?auto_172475 ?auto_172481 ) ) ( not ( = ?auto_172477 ?auto_172482 ) ) ( not ( = ?auto_172477 ?auto_172479 ) ) ( not ( = ?auto_172477 ?auto_172476 ) ) ( not ( = ?auto_172477 ?auto_172481 ) ) ( not ( = ?auto_172478 ?auto_172482 ) ) ( not ( = ?auto_172478 ?auto_172479 ) ) ( not ( = ?auto_172478 ?auto_172476 ) ) ( not ( = ?auto_172478 ?auto_172481 ) ) ( ON ?auto_172480 ?auto_172478 ) ( CLEAR ?auto_172480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172475 ?auto_172477 ?auto_172478 )
      ( MAKE-1PILE ?auto_172475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172483 - BLOCK
    )
    :vars
    (
      ?auto_172490 - BLOCK
      ?auto_172485 - BLOCK
      ?auto_172486 - BLOCK
      ?auto_172484 - BLOCK
      ?auto_172488 - BLOCK
      ?auto_172489 - BLOCK
      ?auto_172487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172490 ?auto_172483 ) ( ON-TABLE ?auto_172483 ) ( not ( = ?auto_172483 ?auto_172490 ) ) ( not ( = ?auto_172483 ?auto_172485 ) ) ( not ( = ?auto_172483 ?auto_172486 ) ) ( not ( = ?auto_172490 ?auto_172485 ) ) ( not ( = ?auto_172490 ?auto_172486 ) ) ( not ( = ?auto_172485 ?auto_172486 ) ) ( ON ?auto_172485 ?auto_172490 ) ( ON-TABLE ?auto_172484 ) ( ON ?auto_172488 ?auto_172484 ) ( ON ?auto_172489 ?auto_172488 ) ( not ( = ?auto_172484 ?auto_172488 ) ) ( not ( = ?auto_172484 ?auto_172489 ) ) ( not ( = ?auto_172484 ?auto_172487 ) ) ( not ( = ?auto_172484 ?auto_172486 ) ) ( not ( = ?auto_172488 ?auto_172489 ) ) ( not ( = ?auto_172488 ?auto_172487 ) ) ( not ( = ?auto_172488 ?auto_172486 ) ) ( not ( = ?auto_172489 ?auto_172487 ) ) ( not ( = ?auto_172489 ?auto_172486 ) ) ( not ( = ?auto_172487 ?auto_172486 ) ) ( not ( = ?auto_172483 ?auto_172487 ) ) ( not ( = ?auto_172483 ?auto_172484 ) ) ( not ( = ?auto_172483 ?auto_172488 ) ) ( not ( = ?auto_172483 ?auto_172489 ) ) ( not ( = ?auto_172490 ?auto_172487 ) ) ( not ( = ?auto_172490 ?auto_172484 ) ) ( not ( = ?auto_172490 ?auto_172488 ) ) ( not ( = ?auto_172490 ?auto_172489 ) ) ( not ( = ?auto_172485 ?auto_172487 ) ) ( not ( = ?auto_172485 ?auto_172484 ) ) ( not ( = ?auto_172485 ?auto_172488 ) ) ( not ( = ?auto_172485 ?auto_172489 ) ) ( ON ?auto_172486 ?auto_172485 ) ( CLEAR ?auto_172486 ) ( HOLDING ?auto_172487 ) ( CLEAR ?auto_172489 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172484 ?auto_172488 ?auto_172489 ?auto_172487 )
      ( MAKE-1PILE ?auto_172483 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172491 - BLOCK
    )
    :vars
    (
      ?auto_172495 - BLOCK
      ?auto_172493 - BLOCK
      ?auto_172492 - BLOCK
      ?auto_172494 - BLOCK
      ?auto_172498 - BLOCK
      ?auto_172497 - BLOCK
      ?auto_172496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172495 ?auto_172491 ) ( ON-TABLE ?auto_172491 ) ( not ( = ?auto_172491 ?auto_172495 ) ) ( not ( = ?auto_172491 ?auto_172493 ) ) ( not ( = ?auto_172491 ?auto_172492 ) ) ( not ( = ?auto_172495 ?auto_172493 ) ) ( not ( = ?auto_172495 ?auto_172492 ) ) ( not ( = ?auto_172493 ?auto_172492 ) ) ( ON ?auto_172493 ?auto_172495 ) ( ON-TABLE ?auto_172494 ) ( ON ?auto_172498 ?auto_172494 ) ( ON ?auto_172497 ?auto_172498 ) ( not ( = ?auto_172494 ?auto_172498 ) ) ( not ( = ?auto_172494 ?auto_172497 ) ) ( not ( = ?auto_172494 ?auto_172496 ) ) ( not ( = ?auto_172494 ?auto_172492 ) ) ( not ( = ?auto_172498 ?auto_172497 ) ) ( not ( = ?auto_172498 ?auto_172496 ) ) ( not ( = ?auto_172498 ?auto_172492 ) ) ( not ( = ?auto_172497 ?auto_172496 ) ) ( not ( = ?auto_172497 ?auto_172492 ) ) ( not ( = ?auto_172496 ?auto_172492 ) ) ( not ( = ?auto_172491 ?auto_172496 ) ) ( not ( = ?auto_172491 ?auto_172494 ) ) ( not ( = ?auto_172491 ?auto_172498 ) ) ( not ( = ?auto_172491 ?auto_172497 ) ) ( not ( = ?auto_172495 ?auto_172496 ) ) ( not ( = ?auto_172495 ?auto_172494 ) ) ( not ( = ?auto_172495 ?auto_172498 ) ) ( not ( = ?auto_172495 ?auto_172497 ) ) ( not ( = ?auto_172493 ?auto_172496 ) ) ( not ( = ?auto_172493 ?auto_172494 ) ) ( not ( = ?auto_172493 ?auto_172498 ) ) ( not ( = ?auto_172493 ?auto_172497 ) ) ( ON ?auto_172492 ?auto_172493 ) ( CLEAR ?auto_172497 ) ( ON ?auto_172496 ?auto_172492 ) ( CLEAR ?auto_172496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172491 ?auto_172495 ?auto_172493 ?auto_172492 )
      ( MAKE-1PILE ?auto_172491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172499 - BLOCK
    )
    :vars
    (
      ?auto_172503 - BLOCK
      ?auto_172502 - BLOCK
      ?auto_172501 - BLOCK
      ?auto_172504 - BLOCK
      ?auto_172500 - BLOCK
      ?auto_172505 - BLOCK
      ?auto_172506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172503 ?auto_172499 ) ( ON-TABLE ?auto_172499 ) ( not ( = ?auto_172499 ?auto_172503 ) ) ( not ( = ?auto_172499 ?auto_172502 ) ) ( not ( = ?auto_172499 ?auto_172501 ) ) ( not ( = ?auto_172503 ?auto_172502 ) ) ( not ( = ?auto_172503 ?auto_172501 ) ) ( not ( = ?auto_172502 ?auto_172501 ) ) ( ON ?auto_172502 ?auto_172503 ) ( ON-TABLE ?auto_172504 ) ( ON ?auto_172500 ?auto_172504 ) ( not ( = ?auto_172504 ?auto_172500 ) ) ( not ( = ?auto_172504 ?auto_172505 ) ) ( not ( = ?auto_172504 ?auto_172506 ) ) ( not ( = ?auto_172504 ?auto_172501 ) ) ( not ( = ?auto_172500 ?auto_172505 ) ) ( not ( = ?auto_172500 ?auto_172506 ) ) ( not ( = ?auto_172500 ?auto_172501 ) ) ( not ( = ?auto_172505 ?auto_172506 ) ) ( not ( = ?auto_172505 ?auto_172501 ) ) ( not ( = ?auto_172506 ?auto_172501 ) ) ( not ( = ?auto_172499 ?auto_172506 ) ) ( not ( = ?auto_172499 ?auto_172504 ) ) ( not ( = ?auto_172499 ?auto_172500 ) ) ( not ( = ?auto_172499 ?auto_172505 ) ) ( not ( = ?auto_172503 ?auto_172506 ) ) ( not ( = ?auto_172503 ?auto_172504 ) ) ( not ( = ?auto_172503 ?auto_172500 ) ) ( not ( = ?auto_172503 ?auto_172505 ) ) ( not ( = ?auto_172502 ?auto_172506 ) ) ( not ( = ?auto_172502 ?auto_172504 ) ) ( not ( = ?auto_172502 ?auto_172500 ) ) ( not ( = ?auto_172502 ?auto_172505 ) ) ( ON ?auto_172501 ?auto_172502 ) ( ON ?auto_172506 ?auto_172501 ) ( CLEAR ?auto_172506 ) ( HOLDING ?auto_172505 ) ( CLEAR ?auto_172500 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172504 ?auto_172500 ?auto_172505 )
      ( MAKE-1PILE ?auto_172499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172507 - BLOCK
    )
    :vars
    (
      ?auto_172513 - BLOCK
      ?auto_172510 - BLOCK
      ?auto_172508 - BLOCK
      ?auto_172511 - BLOCK
      ?auto_172512 - BLOCK
      ?auto_172514 - BLOCK
      ?auto_172509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172513 ?auto_172507 ) ( ON-TABLE ?auto_172507 ) ( not ( = ?auto_172507 ?auto_172513 ) ) ( not ( = ?auto_172507 ?auto_172510 ) ) ( not ( = ?auto_172507 ?auto_172508 ) ) ( not ( = ?auto_172513 ?auto_172510 ) ) ( not ( = ?auto_172513 ?auto_172508 ) ) ( not ( = ?auto_172510 ?auto_172508 ) ) ( ON ?auto_172510 ?auto_172513 ) ( ON-TABLE ?auto_172511 ) ( ON ?auto_172512 ?auto_172511 ) ( not ( = ?auto_172511 ?auto_172512 ) ) ( not ( = ?auto_172511 ?auto_172514 ) ) ( not ( = ?auto_172511 ?auto_172509 ) ) ( not ( = ?auto_172511 ?auto_172508 ) ) ( not ( = ?auto_172512 ?auto_172514 ) ) ( not ( = ?auto_172512 ?auto_172509 ) ) ( not ( = ?auto_172512 ?auto_172508 ) ) ( not ( = ?auto_172514 ?auto_172509 ) ) ( not ( = ?auto_172514 ?auto_172508 ) ) ( not ( = ?auto_172509 ?auto_172508 ) ) ( not ( = ?auto_172507 ?auto_172509 ) ) ( not ( = ?auto_172507 ?auto_172511 ) ) ( not ( = ?auto_172507 ?auto_172512 ) ) ( not ( = ?auto_172507 ?auto_172514 ) ) ( not ( = ?auto_172513 ?auto_172509 ) ) ( not ( = ?auto_172513 ?auto_172511 ) ) ( not ( = ?auto_172513 ?auto_172512 ) ) ( not ( = ?auto_172513 ?auto_172514 ) ) ( not ( = ?auto_172510 ?auto_172509 ) ) ( not ( = ?auto_172510 ?auto_172511 ) ) ( not ( = ?auto_172510 ?auto_172512 ) ) ( not ( = ?auto_172510 ?auto_172514 ) ) ( ON ?auto_172508 ?auto_172510 ) ( ON ?auto_172509 ?auto_172508 ) ( CLEAR ?auto_172512 ) ( ON ?auto_172514 ?auto_172509 ) ( CLEAR ?auto_172514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172507 ?auto_172513 ?auto_172510 ?auto_172508 ?auto_172509 )
      ( MAKE-1PILE ?auto_172507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172515 - BLOCK
    )
    :vars
    (
      ?auto_172520 - BLOCK
      ?auto_172516 - BLOCK
      ?auto_172521 - BLOCK
      ?auto_172517 - BLOCK
      ?auto_172518 - BLOCK
      ?auto_172519 - BLOCK
      ?auto_172522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172520 ?auto_172515 ) ( ON-TABLE ?auto_172515 ) ( not ( = ?auto_172515 ?auto_172520 ) ) ( not ( = ?auto_172515 ?auto_172516 ) ) ( not ( = ?auto_172515 ?auto_172521 ) ) ( not ( = ?auto_172520 ?auto_172516 ) ) ( not ( = ?auto_172520 ?auto_172521 ) ) ( not ( = ?auto_172516 ?auto_172521 ) ) ( ON ?auto_172516 ?auto_172520 ) ( ON-TABLE ?auto_172517 ) ( not ( = ?auto_172517 ?auto_172518 ) ) ( not ( = ?auto_172517 ?auto_172519 ) ) ( not ( = ?auto_172517 ?auto_172522 ) ) ( not ( = ?auto_172517 ?auto_172521 ) ) ( not ( = ?auto_172518 ?auto_172519 ) ) ( not ( = ?auto_172518 ?auto_172522 ) ) ( not ( = ?auto_172518 ?auto_172521 ) ) ( not ( = ?auto_172519 ?auto_172522 ) ) ( not ( = ?auto_172519 ?auto_172521 ) ) ( not ( = ?auto_172522 ?auto_172521 ) ) ( not ( = ?auto_172515 ?auto_172522 ) ) ( not ( = ?auto_172515 ?auto_172517 ) ) ( not ( = ?auto_172515 ?auto_172518 ) ) ( not ( = ?auto_172515 ?auto_172519 ) ) ( not ( = ?auto_172520 ?auto_172522 ) ) ( not ( = ?auto_172520 ?auto_172517 ) ) ( not ( = ?auto_172520 ?auto_172518 ) ) ( not ( = ?auto_172520 ?auto_172519 ) ) ( not ( = ?auto_172516 ?auto_172522 ) ) ( not ( = ?auto_172516 ?auto_172517 ) ) ( not ( = ?auto_172516 ?auto_172518 ) ) ( not ( = ?auto_172516 ?auto_172519 ) ) ( ON ?auto_172521 ?auto_172516 ) ( ON ?auto_172522 ?auto_172521 ) ( ON ?auto_172519 ?auto_172522 ) ( CLEAR ?auto_172519 ) ( HOLDING ?auto_172518 ) ( CLEAR ?auto_172517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172517 ?auto_172518 )
      ( MAKE-1PILE ?auto_172515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172523 - BLOCK
    )
    :vars
    (
      ?auto_172530 - BLOCK
      ?auto_172529 - BLOCK
      ?auto_172527 - BLOCK
      ?auto_172528 - BLOCK
      ?auto_172524 - BLOCK
      ?auto_172525 - BLOCK
      ?auto_172526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172530 ?auto_172523 ) ( ON-TABLE ?auto_172523 ) ( not ( = ?auto_172523 ?auto_172530 ) ) ( not ( = ?auto_172523 ?auto_172529 ) ) ( not ( = ?auto_172523 ?auto_172527 ) ) ( not ( = ?auto_172530 ?auto_172529 ) ) ( not ( = ?auto_172530 ?auto_172527 ) ) ( not ( = ?auto_172529 ?auto_172527 ) ) ( ON ?auto_172529 ?auto_172530 ) ( ON-TABLE ?auto_172528 ) ( not ( = ?auto_172528 ?auto_172524 ) ) ( not ( = ?auto_172528 ?auto_172525 ) ) ( not ( = ?auto_172528 ?auto_172526 ) ) ( not ( = ?auto_172528 ?auto_172527 ) ) ( not ( = ?auto_172524 ?auto_172525 ) ) ( not ( = ?auto_172524 ?auto_172526 ) ) ( not ( = ?auto_172524 ?auto_172527 ) ) ( not ( = ?auto_172525 ?auto_172526 ) ) ( not ( = ?auto_172525 ?auto_172527 ) ) ( not ( = ?auto_172526 ?auto_172527 ) ) ( not ( = ?auto_172523 ?auto_172526 ) ) ( not ( = ?auto_172523 ?auto_172528 ) ) ( not ( = ?auto_172523 ?auto_172524 ) ) ( not ( = ?auto_172523 ?auto_172525 ) ) ( not ( = ?auto_172530 ?auto_172526 ) ) ( not ( = ?auto_172530 ?auto_172528 ) ) ( not ( = ?auto_172530 ?auto_172524 ) ) ( not ( = ?auto_172530 ?auto_172525 ) ) ( not ( = ?auto_172529 ?auto_172526 ) ) ( not ( = ?auto_172529 ?auto_172528 ) ) ( not ( = ?auto_172529 ?auto_172524 ) ) ( not ( = ?auto_172529 ?auto_172525 ) ) ( ON ?auto_172527 ?auto_172529 ) ( ON ?auto_172526 ?auto_172527 ) ( ON ?auto_172525 ?auto_172526 ) ( CLEAR ?auto_172528 ) ( ON ?auto_172524 ?auto_172525 ) ( CLEAR ?auto_172524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172523 ?auto_172530 ?auto_172529 ?auto_172527 ?auto_172526 ?auto_172525 )
      ( MAKE-1PILE ?auto_172523 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172531 - BLOCK
    )
    :vars
    (
      ?auto_172536 - BLOCK
      ?auto_172534 - BLOCK
      ?auto_172538 - BLOCK
      ?auto_172535 - BLOCK
      ?auto_172533 - BLOCK
      ?auto_172532 - BLOCK
      ?auto_172537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172536 ?auto_172531 ) ( ON-TABLE ?auto_172531 ) ( not ( = ?auto_172531 ?auto_172536 ) ) ( not ( = ?auto_172531 ?auto_172534 ) ) ( not ( = ?auto_172531 ?auto_172538 ) ) ( not ( = ?auto_172536 ?auto_172534 ) ) ( not ( = ?auto_172536 ?auto_172538 ) ) ( not ( = ?auto_172534 ?auto_172538 ) ) ( ON ?auto_172534 ?auto_172536 ) ( not ( = ?auto_172535 ?auto_172533 ) ) ( not ( = ?auto_172535 ?auto_172532 ) ) ( not ( = ?auto_172535 ?auto_172537 ) ) ( not ( = ?auto_172535 ?auto_172538 ) ) ( not ( = ?auto_172533 ?auto_172532 ) ) ( not ( = ?auto_172533 ?auto_172537 ) ) ( not ( = ?auto_172533 ?auto_172538 ) ) ( not ( = ?auto_172532 ?auto_172537 ) ) ( not ( = ?auto_172532 ?auto_172538 ) ) ( not ( = ?auto_172537 ?auto_172538 ) ) ( not ( = ?auto_172531 ?auto_172537 ) ) ( not ( = ?auto_172531 ?auto_172535 ) ) ( not ( = ?auto_172531 ?auto_172533 ) ) ( not ( = ?auto_172531 ?auto_172532 ) ) ( not ( = ?auto_172536 ?auto_172537 ) ) ( not ( = ?auto_172536 ?auto_172535 ) ) ( not ( = ?auto_172536 ?auto_172533 ) ) ( not ( = ?auto_172536 ?auto_172532 ) ) ( not ( = ?auto_172534 ?auto_172537 ) ) ( not ( = ?auto_172534 ?auto_172535 ) ) ( not ( = ?auto_172534 ?auto_172533 ) ) ( not ( = ?auto_172534 ?auto_172532 ) ) ( ON ?auto_172538 ?auto_172534 ) ( ON ?auto_172537 ?auto_172538 ) ( ON ?auto_172532 ?auto_172537 ) ( ON ?auto_172533 ?auto_172532 ) ( CLEAR ?auto_172533 ) ( HOLDING ?auto_172535 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172535 )
      ( MAKE-1PILE ?auto_172531 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172548 - BLOCK
    )
    :vars
    (
      ?auto_172551 - BLOCK
      ?auto_172555 - BLOCK
      ?auto_172552 - BLOCK
      ?auto_172549 - BLOCK
      ?auto_172553 - BLOCK
      ?auto_172554 - BLOCK
      ?auto_172550 - BLOCK
      ?auto_172556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172551 ?auto_172548 ) ( ON-TABLE ?auto_172548 ) ( not ( = ?auto_172548 ?auto_172551 ) ) ( not ( = ?auto_172548 ?auto_172555 ) ) ( not ( = ?auto_172548 ?auto_172552 ) ) ( not ( = ?auto_172551 ?auto_172555 ) ) ( not ( = ?auto_172551 ?auto_172552 ) ) ( not ( = ?auto_172555 ?auto_172552 ) ) ( ON ?auto_172555 ?auto_172551 ) ( not ( = ?auto_172549 ?auto_172553 ) ) ( not ( = ?auto_172549 ?auto_172554 ) ) ( not ( = ?auto_172549 ?auto_172550 ) ) ( not ( = ?auto_172549 ?auto_172552 ) ) ( not ( = ?auto_172553 ?auto_172554 ) ) ( not ( = ?auto_172553 ?auto_172550 ) ) ( not ( = ?auto_172553 ?auto_172552 ) ) ( not ( = ?auto_172554 ?auto_172550 ) ) ( not ( = ?auto_172554 ?auto_172552 ) ) ( not ( = ?auto_172550 ?auto_172552 ) ) ( not ( = ?auto_172548 ?auto_172550 ) ) ( not ( = ?auto_172548 ?auto_172549 ) ) ( not ( = ?auto_172548 ?auto_172553 ) ) ( not ( = ?auto_172548 ?auto_172554 ) ) ( not ( = ?auto_172551 ?auto_172550 ) ) ( not ( = ?auto_172551 ?auto_172549 ) ) ( not ( = ?auto_172551 ?auto_172553 ) ) ( not ( = ?auto_172551 ?auto_172554 ) ) ( not ( = ?auto_172555 ?auto_172550 ) ) ( not ( = ?auto_172555 ?auto_172549 ) ) ( not ( = ?auto_172555 ?auto_172553 ) ) ( not ( = ?auto_172555 ?auto_172554 ) ) ( ON ?auto_172552 ?auto_172555 ) ( ON ?auto_172550 ?auto_172552 ) ( ON ?auto_172554 ?auto_172550 ) ( ON ?auto_172553 ?auto_172554 ) ( CLEAR ?auto_172553 ) ( ON ?auto_172549 ?auto_172556 ) ( CLEAR ?auto_172549 ) ( HAND-EMPTY ) ( not ( = ?auto_172548 ?auto_172556 ) ) ( not ( = ?auto_172551 ?auto_172556 ) ) ( not ( = ?auto_172555 ?auto_172556 ) ) ( not ( = ?auto_172552 ?auto_172556 ) ) ( not ( = ?auto_172549 ?auto_172556 ) ) ( not ( = ?auto_172553 ?auto_172556 ) ) ( not ( = ?auto_172554 ?auto_172556 ) ) ( not ( = ?auto_172550 ?auto_172556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172549 ?auto_172556 )
      ( MAKE-1PILE ?auto_172548 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172557 - BLOCK
    )
    :vars
    (
      ?auto_172559 - BLOCK
      ?auto_172561 - BLOCK
      ?auto_172565 - BLOCK
      ?auto_172564 - BLOCK
      ?auto_172560 - BLOCK
      ?auto_172558 - BLOCK
      ?auto_172563 - BLOCK
      ?auto_172562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172559 ?auto_172557 ) ( ON-TABLE ?auto_172557 ) ( not ( = ?auto_172557 ?auto_172559 ) ) ( not ( = ?auto_172557 ?auto_172561 ) ) ( not ( = ?auto_172557 ?auto_172565 ) ) ( not ( = ?auto_172559 ?auto_172561 ) ) ( not ( = ?auto_172559 ?auto_172565 ) ) ( not ( = ?auto_172561 ?auto_172565 ) ) ( ON ?auto_172561 ?auto_172559 ) ( not ( = ?auto_172564 ?auto_172560 ) ) ( not ( = ?auto_172564 ?auto_172558 ) ) ( not ( = ?auto_172564 ?auto_172563 ) ) ( not ( = ?auto_172564 ?auto_172565 ) ) ( not ( = ?auto_172560 ?auto_172558 ) ) ( not ( = ?auto_172560 ?auto_172563 ) ) ( not ( = ?auto_172560 ?auto_172565 ) ) ( not ( = ?auto_172558 ?auto_172563 ) ) ( not ( = ?auto_172558 ?auto_172565 ) ) ( not ( = ?auto_172563 ?auto_172565 ) ) ( not ( = ?auto_172557 ?auto_172563 ) ) ( not ( = ?auto_172557 ?auto_172564 ) ) ( not ( = ?auto_172557 ?auto_172560 ) ) ( not ( = ?auto_172557 ?auto_172558 ) ) ( not ( = ?auto_172559 ?auto_172563 ) ) ( not ( = ?auto_172559 ?auto_172564 ) ) ( not ( = ?auto_172559 ?auto_172560 ) ) ( not ( = ?auto_172559 ?auto_172558 ) ) ( not ( = ?auto_172561 ?auto_172563 ) ) ( not ( = ?auto_172561 ?auto_172564 ) ) ( not ( = ?auto_172561 ?auto_172560 ) ) ( not ( = ?auto_172561 ?auto_172558 ) ) ( ON ?auto_172565 ?auto_172561 ) ( ON ?auto_172563 ?auto_172565 ) ( ON ?auto_172558 ?auto_172563 ) ( ON ?auto_172564 ?auto_172562 ) ( CLEAR ?auto_172564 ) ( not ( = ?auto_172557 ?auto_172562 ) ) ( not ( = ?auto_172559 ?auto_172562 ) ) ( not ( = ?auto_172561 ?auto_172562 ) ) ( not ( = ?auto_172565 ?auto_172562 ) ) ( not ( = ?auto_172564 ?auto_172562 ) ) ( not ( = ?auto_172560 ?auto_172562 ) ) ( not ( = ?auto_172558 ?auto_172562 ) ) ( not ( = ?auto_172563 ?auto_172562 ) ) ( HOLDING ?auto_172560 ) ( CLEAR ?auto_172558 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172557 ?auto_172559 ?auto_172561 ?auto_172565 ?auto_172563 ?auto_172558 ?auto_172560 )
      ( MAKE-1PILE ?auto_172557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172566 - BLOCK
    )
    :vars
    (
      ?auto_172572 - BLOCK
      ?auto_172574 - BLOCK
      ?auto_172571 - BLOCK
      ?auto_172568 - BLOCK
      ?auto_172567 - BLOCK
      ?auto_172570 - BLOCK
      ?auto_172573 - BLOCK
      ?auto_172569 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172572 ?auto_172566 ) ( ON-TABLE ?auto_172566 ) ( not ( = ?auto_172566 ?auto_172572 ) ) ( not ( = ?auto_172566 ?auto_172574 ) ) ( not ( = ?auto_172566 ?auto_172571 ) ) ( not ( = ?auto_172572 ?auto_172574 ) ) ( not ( = ?auto_172572 ?auto_172571 ) ) ( not ( = ?auto_172574 ?auto_172571 ) ) ( ON ?auto_172574 ?auto_172572 ) ( not ( = ?auto_172568 ?auto_172567 ) ) ( not ( = ?auto_172568 ?auto_172570 ) ) ( not ( = ?auto_172568 ?auto_172573 ) ) ( not ( = ?auto_172568 ?auto_172571 ) ) ( not ( = ?auto_172567 ?auto_172570 ) ) ( not ( = ?auto_172567 ?auto_172573 ) ) ( not ( = ?auto_172567 ?auto_172571 ) ) ( not ( = ?auto_172570 ?auto_172573 ) ) ( not ( = ?auto_172570 ?auto_172571 ) ) ( not ( = ?auto_172573 ?auto_172571 ) ) ( not ( = ?auto_172566 ?auto_172573 ) ) ( not ( = ?auto_172566 ?auto_172568 ) ) ( not ( = ?auto_172566 ?auto_172567 ) ) ( not ( = ?auto_172566 ?auto_172570 ) ) ( not ( = ?auto_172572 ?auto_172573 ) ) ( not ( = ?auto_172572 ?auto_172568 ) ) ( not ( = ?auto_172572 ?auto_172567 ) ) ( not ( = ?auto_172572 ?auto_172570 ) ) ( not ( = ?auto_172574 ?auto_172573 ) ) ( not ( = ?auto_172574 ?auto_172568 ) ) ( not ( = ?auto_172574 ?auto_172567 ) ) ( not ( = ?auto_172574 ?auto_172570 ) ) ( ON ?auto_172571 ?auto_172574 ) ( ON ?auto_172573 ?auto_172571 ) ( ON ?auto_172570 ?auto_172573 ) ( ON ?auto_172568 ?auto_172569 ) ( not ( = ?auto_172566 ?auto_172569 ) ) ( not ( = ?auto_172572 ?auto_172569 ) ) ( not ( = ?auto_172574 ?auto_172569 ) ) ( not ( = ?auto_172571 ?auto_172569 ) ) ( not ( = ?auto_172568 ?auto_172569 ) ) ( not ( = ?auto_172567 ?auto_172569 ) ) ( not ( = ?auto_172570 ?auto_172569 ) ) ( not ( = ?auto_172573 ?auto_172569 ) ) ( CLEAR ?auto_172570 ) ( ON ?auto_172567 ?auto_172568 ) ( CLEAR ?auto_172567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172569 ?auto_172568 )
      ( MAKE-1PILE ?auto_172566 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172575 - BLOCK
    )
    :vars
    (
      ?auto_172577 - BLOCK
      ?auto_172581 - BLOCK
      ?auto_172579 - BLOCK
      ?auto_172580 - BLOCK
      ?auto_172582 - BLOCK
      ?auto_172578 - BLOCK
      ?auto_172576 - BLOCK
      ?auto_172583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172577 ?auto_172575 ) ( ON-TABLE ?auto_172575 ) ( not ( = ?auto_172575 ?auto_172577 ) ) ( not ( = ?auto_172575 ?auto_172581 ) ) ( not ( = ?auto_172575 ?auto_172579 ) ) ( not ( = ?auto_172577 ?auto_172581 ) ) ( not ( = ?auto_172577 ?auto_172579 ) ) ( not ( = ?auto_172581 ?auto_172579 ) ) ( ON ?auto_172581 ?auto_172577 ) ( not ( = ?auto_172580 ?auto_172582 ) ) ( not ( = ?auto_172580 ?auto_172578 ) ) ( not ( = ?auto_172580 ?auto_172576 ) ) ( not ( = ?auto_172580 ?auto_172579 ) ) ( not ( = ?auto_172582 ?auto_172578 ) ) ( not ( = ?auto_172582 ?auto_172576 ) ) ( not ( = ?auto_172582 ?auto_172579 ) ) ( not ( = ?auto_172578 ?auto_172576 ) ) ( not ( = ?auto_172578 ?auto_172579 ) ) ( not ( = ?auto_172576 ?auto_172579 ) ) ( not ( = ?auto_172575 ?auto_172576 ) ) ( not ( = ?auto_172575 ?auto_172580 ) ) ( not ( = ?auto_172575 ?auto_172582 ) ) ( not ( = ?auto_172575 ?auto_172578 ) ) ( not ( = ?auto_172577 ?auto_172576 ) ) ( not ( = ?auto_172577 ?auto_172580 ) ) ( not ( = ?auto_172577 ?auto_172582 ) ) ( not ( = ?auto_172577 ?auto_172578 ) ) ( not ( = ?auto_172581 ?auto_172576 ) ) ( not ( = ?auto_172581 ?auto_172580 ) ) ( not ( = ?auto_172581 ?auto_172582 ) ) ( not ( = ?auto_172581 ?auto_172578 ) ) ( ON ?auto_172579 ?auto_172581 ) ( ON ?auto_172576 ?auto_172579 ) ( ON ?auto_172580 ?auto_172583 ) ( not ( = ?auto_172575 ?auto_172583 ) ) ( not ( = ?auto_172577 ?auto_172583 ) ) ( not ( = ?auto_172581 ?auto_172583 ) ) ( not ( = ?auto_172579 ?auto_172583 ) ) ( not ( = ?auto_172580 ?auto_172583 ) ) ( not ( = ?auto_172582 ?auto_172583 ) ) ( not ( = ?auto_172578 ?auto_172583 ) ) ( not ( = ?auto_172576 ?auto_172583 ) ) ( ON ?auto_172582 ?auto_172580 ) ( CLEAR ?auto_172582 ) ( ON-TABLE ?auto_172583 ) ( HOLDING ?auto_172578 ) ( CLEAR ?auto_172576 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172575 ?auto_172577 ?auto_172581 ?auto_172579 ?auto_172576 ?auto_172578 )
      ( MAKE-1PILE ?auto_172575 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172584 - BLOCK
    )
    :vars
    (
      ?auto_172585 - BLOCK
      ?auto_172588 - BLOCK
      ?auto_172586 - BLOCK
      ?auto_172587 - BLOCK
      ?auto_172592 - BLOCK
      ?auto_172589 - BLOCK
      ?auto_172590 - BLOCK
      ?auto_172591 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_172585 ?auto_172584 ) ( ON-TABLE ?auto_172584 ) ( not ( = ?auto_172584 ?auto_172585 ) ) ( not ( = ?auto_172584 ?auto_172588 ) ) ( not ( = ?auto_172584 ?auto_172586 ) ) ( not ( = ?auto_172585 ?auto_172588 ) ) ( not ( = ?auto_172585 ?auto_172586 ) ) ( not ( = ?auto_172588 ?auto_172586 ) ) ( ON ?auto_172588 ?auto_172585 ) ( not ( = ?auto_172587 ?auto_172592 ) ) ( not ( = ?auto_172587 ?auto_172589 ) ) ( not ( = ?auto_172587 ?auto_172590 ) ) ( not ( = ?auto_172587 ?auto_172586 ) ) ( not ( = ?auto_172592 ?auto_172589 ) ) ( not ( = ?auto_172592 ?auto_172590 ) ) ( not ( = ?auto_172592 ?auto_172586 ) ) ( not ( = ?auto_172589 ?auto_172590 ) ) ( not ( = ?auto_172589 ?auto_172586 ) ) ( not ( = ?auto_172590 ?auto_172586 ) ) ( not ( = ?auto_172584 ?auto_172590 ) ) ( not ( = ?auto_172584 ?auto_172587 ) ) ( not ( = ?auto_172584 ?auto_172592 ) ) ( not ( = ?auto_172584 ?auto_172589 ) ) ( not ( = ?auto_172585 ?auto_172590 ) ) ( not ( = ?auto_172585 ?auto_172587 ) ) ( not ( = ?auto_172585 ?auto_172592 ) ) ( not ( = ?auto_172585 ?auto_172589 ) ) ( not ( = ?auto_172588 ?auto_172590 ) ) ( not ( = ?auto_172588 ?auto_172587 ) ) ( not ( = ?auto_172588 ?auto_172592 ) ) ( not ( = ?auto_172588 ?auto_172589 ) ) ( ON ?auto_172586 ?auto_172588 ) ( ON ?auto_172590 ?auto_172586 ) ( ON ?auto_172587 ?auto_172591 ) ( not ( = ?auto_172584 ?auto_172591 ) ) ( not ( = ?auto_172585 ?auto_172591 ) ) ( not ( = ?auto_172588 ?auto_172591 ) ) ( not ( = ?auto_172586 ?auto_172591 ) ) ( not ( = ?auto_172587 ?auto_172591 ) ) ( not ( = ?auto_172592 ?auto_172591 ) ) ( not ( = ?auto_172589 ?auto_172591 ) ) ( not ( = ?auto_172590 ?auto_172591 ) ) ( ON ?auto_172592 ?auto_172587 ) ( ON-TABLE ?auto_172591 ) ( CLEAR ?auto_172590 ) ( ON ?auto_172589 ?auto_172592 ) ( CLEAR ?auto_172589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172591 ?auto_172587 ?auto_172592 )
      ( MAKE-1PILE ?auto_172584 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172636 - BLOCK
      ?auto_172637 - BLOCK
      ?auto_172638 - BLOCK
      ?auto_172639 - BLOCK
      ?auto_172640 - BLOCK
      ?auto_172641 - BLOCK
      ?auto_172642 - BLOCK
    )
    :vars
    (
      ?auto_172643 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172636 ) ( ON ?auto_172637 ?auto_172636 ) ( ON ?auto_172638 ?auto_172637 ) ( ON ?auto_172639 ?auto_172638 ) ( ON ?auto_172640 ?auto_172639 ) ( not ( = ?auto_172636 ?auto_172637 ) ) ( not ( = ?auto_172636 ?auto_172638 ) ) ( not ( = ?auto_172636 ?auto_172639 ) ) ( not ( = ?auto_172636 ?auto_172640 ) ) ( not ( = ?auto_172636 ?auto_172641 ) ) ( not ( = ?auto_172636 ?auto_172642 ) ) ( not ( = ?auto_172637 ?auto_172638 ) ) ( not ( = ?auto_172637 ?auto_172639 ) ) ( not ( = ?auto_172637 ?auto_172640 ) ) ( not ( = ?auto_172637 ?auto_172641 ) ) ( not ( = ?auto_172637 ?auto_172642 ) ) ( not ( = ?auto_172638 ?auto_172639 ) ) ( not ( = ?auto_172638 ?auto_172640 ) ) ( not ( = ?auto_172638 ?auto_172641 ) ) ( not ( = ?auto_172638 ?auto_172642 ) ) ( not ( = ?auto_172639 ?auto_172640 ) ) ( not ( = ?auto_172639 ?auto_172641 ) ) ( not ( = ?auto_172639 ?auto_172642 ) ) ( not ( = ?auto_172640 ?auto_172641 ) ) ( not ( = ?auto_172640 ?auto_172642 ) ) ( not ( = ?auto_172641 ?auto_172642 ) ) ( ON ?auto_172642 ?auto_172643 ) ( not ( = ?auto_172636 ?auto_172643 ) ) ( not ( = ?auto_172637 ?auto_172643 ) ) ( not ( = ?auto_172638 ?auto_172643 ) ) ( not ( = ?auto_172639 ?auto_172643 ) ) ( not ( = ?auto_172640 ?auto_172643 ) ) ( not ( = ?auto_172641 ?auto_172643 ) ) ( not ( = ?auto_172642 ?auto_172643 ) ) ( CLEAR ?auto_172640 ) ( ON ?auto_172641 ?auto_172642 ) ( CLEAR ?auto_172641 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172643 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172643 ?auto_172642 )
      ( MAKE-7PILE ?auto_172636 ?auto_172637 ?auto_172638 ?auto_172639 ?auto_172640 ?auto_172641 ?auto_172642 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172644 - BLOCK
      ?auto_172645 - BLOCK
      ?auto_172646 - BLOCK
      ?auto_172647 - BLOCK
      ?auto_172648 - BLOCK
      ?auto_172649 - BLOCK
      ?auto_172650 - BLOCK
    )
    :vars
    (
      ?auto_172651 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172644 ) ( ON ?auto_172645 ?auto_172644 ) ( ON ?auto_172646 ?auto_172645 ) ( ON ?auto_172647 ?auto_172646 ) ( not ( = ?auto_172644 ?auto_172645 ) ) ( not ( = ?auto_172644 ?auto_172646 ) ) ( not ( = ?auto_172644 ?auto_172647 ) ) ( not ( = ?auto_172644 ?auto_172648 ) ) ( not ( = ?auto_172644 ?auto_172649 ) ) ( not ( = ?auto_172644 ?auto_172650 ) ) ( not ( = ?auto_172645 ?auto_172646 ) ) ( not ( = ?auto_172645 ?auto_172647 ) ) ( not ( = ?auto_172645 ?auto_172648 ) ) ( not ( = ?auto_172645 ?auto_172649 ) ) ( not ( = ?auto_172645 ?auto_172650 ) ) ( not ( = ?auto_172646 ?auto_172647 ) ) ( not ( = ?auto_172646 ?auto_172648 ) ) ( not ( = ?auto_172646 ?auto_172649 ) ) ( not ( = ?auto_172646 ?auto_172650 ) ) ( not ( = ?auto_172647 ?auto_172648 ) ) ( not ( = ?auto_172647 ?auto_172649 ) ) ( not ( = ?auto_172647 ?auto_172650 ) ) ( not ( = ?auto_172648 ?auto_172649 ) ) ( not ( = ?auto_172648 ?auto_172650 ) ) ( not ( = ?auto_172649 ?auto_172650 ) ) ( ON ?auto_172650 ?auto_172651 ) ( not ( = ?auto_172644 ?auto_172651 ) ) ( not ( = ?auto_172645 ?auto_172651 ) ) ( not ( = ?auto_172646 ?auto_172651 ) ) ( not ( = ?auto_172647 ?auto_172651 ) ) ( not ( = ?auto_172648 ?auto_172651 ) ) ( not ( = ?auto_172649 ?auto_172651 ) ) ( not ( = ?auto_172650 ?auto_172651 ) ) ( ON ?auto_172649 ?auto_172650 ) ( CLEAR ?auto_172649 ) ( ON-TABLE ?auto_172651 ) ( HOLDING ?auto_172648 ) ( CLEAR ?auto_172647 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172644 ?auto_172645 ?auto_172646 ?auto_172647 ?auto_172648 )
      ( MAKE-7PILE ?auto_172644 ?auto_172645 ?auto_172646 ?auto_172647 ?auto_172648 ?auto_172649 ?auto_172650 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172652 - BLOCK
      ?auto_172653 - BLOCK
      ?auto_172654 - BLOCK
      ?auto_172655 - BLOCK
      ?auto_172656 - BLOCK
      ?auto_172657 - BLOCK
      ?auto_172658 - BLOCK
    )
    :vars
    (
      ?auto_172659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172652 ) ( ON ?auto_172653 ?auto_172652 ) ( ON ?auto_172654 ?auto_172653 ) ( ON ?auto_172655 ?auto_172654 ) ( not ( = ?auto_172652 ?auto_172653 ) ) ( not ( = ?auto_172652 ?auto_172654 ) ) ( not ( = ?auto_172652 ?auto_172655 ) ) ( not ( = ?auto_172652 ?auto_172656 ) ) ( not ( = ?auto_172652 ?auto_172657 ) ) ( not ( = ?auto_172652 ?auto_172658 ) ) ( not ( = ?auto_172653 ?auto_172654 ) ) ( not ( = ?auto_172653 ?auto_172655 ) ) ( not ( = ?auto_172653 ?auto_172656 ) ) ( not ( = ?auto_172653 ?auto_172657 ) ) ( not ( = ?auto_172653 ?auto_172658 ) ) ( not ( = ?auto_172654 ?auto_172655 ) ) ( not ( = ?auto_172654 ?auto_172656 ) ) ( not ( = ?auto_172654 ?auto_172657 ) ) ( not ( = ?auto_172654 ?auto_172658 ) ) ( not ( = ?auto_172655 ?auto_172656 ) ) ( not ( = ?auto_172655 ?auto_172657 ) ) ( not ( = ?auto_172655 ?auto_172658 ) ) ( not ( = ?auto_172656 ?auto_172657 ) ) ( not ( = ?auto_172656 ?auto_172658 ) ) ( not ( = ?auto_172657 ?auto_172658 ) ) ( ON ?auto_172658 ?auto_172659 ) ( not ( = ?auto_172652 ?auto_172659 ) ) ( not ( = ?auto_172653 ?auto_172659 ) ) ( not ( = ?auto_172654 ?auto_172659 ) ) ( not ( = ?auto_172655 ?auto_172659 ) ) ( not ( = ?auto_172656 ?auto_172659 ) ) ( not ( = ?auto_172657 ?auto_172659 ) ) ( not ( = ?auto_172658 ?auto_172659 ) ) ( ON ?auto_172657 ?auto_172658 ) ( ON-TABLE ?auto_172659 ) ( CLEAR ?auto_172655 ) ( ON ?auto_172656 ?auto_172657 ) ( CLEAR ?auto_172656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172659 ?auto_172658 ?auto_172657 )
      ( MAKE-7PILE ?auto_172652 ?auto_172653 ?auto_172654 ?auto_172655 ?auto_172656 ?auto_172657 ?auto_172658 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172660 - BLOCK
      ?auto_172661 - BLOCK
      ?auto_172662 - BLOCK
      ?auto_172663 - BLOCK
      ?auto_172664 - BLOCK
      ?auto_172665 - BLOCK
      ?auto_172666 - BLOCK
    )
    :vars
    (
      ?auto_172667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172660 ) ( ON ?auto_172661 ?auto_172660 ) ( ON ?auto_172662 ?auto_172661 ) ( not ( = ?auto_172660 ?auto_172661 ) ) ( not ( = ?auto_172660 ?auto_172662 ) ) ( not ( = ?auto_172660 ?auto_172663 ) ) ( not ( = ?auto_172660 ?auto_172664 ) ) ( not ( = ?auto_172660 ?auto_172665 ) ) ( not ( = ?auto_172660 ?auto_172666 ) ) ( not ( = ?auto_172661 ?auto_172662 ) ) ( not ( = ?auto_172661 ?auto_172663 ) ) ( not ( = ?auto_172661 ?auto_172664 ) ) ( not ( = ?auto_172661 ?auto_172665 ) ) ( not ( = ?auto_172661 ?auto_172666 ) ) ( not ( = ?auto_172662 ?auto_172663 ) ) ( not ( = ?auto_172662 ?auto_172664 ) ) ( not ( = ?auto_172662 ?auto_172665 ) ) ( not ( = ?auto_172662 ?auto_172666 ) ) ( not ( = ?auto_172663 ?auto_172664 ) ) ( not ( = ?auto_172663 ?auto_172665 ) ) ( not ( = ?auto_172663 ?auto_172666 ) ) ( not ( = ?auto_172664 ?auto_172665 ) ) ( not ( = ?auto_172664 ?auto_172666 ) ) ( not ( = ?auto_172665 ?auto_172666 ) ) ( ON ?auto_172666 ?auto_172667 ) ( not ( = ?auto_172660 ?auto_172667 ) ) ( not ( = ?auto_172661 ?auto_172667 ) ) ( not ( = ?auto_172662 ?auto_172667 ) ) ( not ( = ?auto_172663 ?auto_172667 ) ) ( not ( = ?auto_172664 ?auto_172667 ) ) ( not ( = ?auto_172665 ?auto_172667 ) ) ( not ( = ?auto_172666 ?auto_172667 ) ) ( ON ?auto_172665 ?auto_172666 ) ( ON-TABLE ?auto_172667 ) ( ON ?auto_172664 ?auto_172665 ) ( CLEAR ?auto_172664 ) ( HOLDING ?auto_172663 ) ( CLEAR ?auto_172662 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172660 ?auto_172661 ?auto_172662 ?auto_172663 )
      ( MAKE-7PILE ?auto_172660 ?auto_172661 ?auto_172662 ?auto_172663 ?auto_172664 ?auto_172665 ?auto_172666 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172668 - BLOCK
      ?auto_172669 - BLOCK
      ?auto_172670 - BLOCK
      ?auto_172671 - BLOCK
      ?auto_172672 - BLOCK
      ?auto_172673 - BLOCK
      ?auto_172674 - BLOCK
    )
    :vars
    (
      ?auto_172675 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172668 ) ( ON ?auto_172669 ?auto_172668 ) ( ON ?auto_172670 ?auto_172669 ) ( not ( = ?auto_172668 ?auto_172669 ) ) ( not ( = ?auto_172668 ?auto_172670 ) ) ( not ( = ?auto_172668 ?auto_172671 ) ) ( not ( = ?auto_172668 ?auto_172672 ) ) ( not ( = ?auto_172668 ?auto_172673 ) ) ( not ( = ?auto_172668 ?auto_172674 ) ) ( not ( = ?auto_172669 ?auto_172670 ) ) ( not ( = ?auto_172669 ?auto_172671 ) ) ( not ( = ?auto_172669 ?auto_172672 ) ) ( not ( = ?auto_172669 ?auto_172673 ) ) ( not ( = ?auto_172669 ?auto_172674 ) ) ( not ( = ?auto_172670 ?auto_172671 ) ) ( not ( = ?auto_172670 ?auto_172672 ) ) ( not ( = ?auto_172670 ?auto_172673 ) ) ( not ( = ?auto_172670 ?auto_172674 ) ) ( not ( = ?auto_172671 ?auto_172672 ) ) ( not ( = ?auto_172671 ?auto_172673 ) ) ( not ( = ?auto_172671 ?auto_172674 ) ) ( not ( = ?auto_172672 ?auto_172673 ) ) ( not ( = ?auto_172672 ?auto_172674 ) ) ( not ( = ?auto_172673 ?auto_172674 ) ) ( ON ?auto_172674 ?auto_172675 ) ( not ( = ?auto_172668 ?auto_172675 ) ) ( not ( = ?auto_172669 ?auto_172675 ) ) ( not ( = ?auto_172670 ?auto_172675 ) ) ( not ( = ?auto_172671 ?auto_172675 ) ) ( not ( = ?auto_172672 ?auto_172675 ) ) ( not ( = ?auto_172673 ?auto_172675 ) ) ( not ( = ?auto_172674 ?auto_172675 ) ) ( ON ?auto_172673 ?auto_172674 ) ( ON-TABLE ?auto_172675 ) ( ON ?auto_172672 ?auto_172673 ) ( CLEAR ?auto_172670 ) ( ON ?auto_172671 ?auto_172672 ) ( CLEAR ?auto_172671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172675 ?auto_172674 ?auto_172673 ?auto_172672 )
      ( MAKE-7PILE ?auto_172668 ?auto_172669 ?auto_172670 ?auto_172671 ?auto_172672 ?auto_172673 ?auto_172674 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172676 - BLOCK
      ?auto_172677 - BLOCK
      ?auto_172678 - BLOCK
      ?auto_172679 - BLOCK
      ?auto_172680 - BLOCK
      ?auto_172681 - BLOCK
      ?auto_172682 - BLOCK
    )
    :vars
    (
      ?auto_172683 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172676 ) ( ON ?auto_172677 ?auto_172676 ) ( not ( = ?auto_172676 ?auto_172677 ) ) ( not ( = ?auto_172676 ?auto_172678 ) ) ( not ( = ?auto_172676 ?auto_172679 ) ) ( not ( = ?auto_172676 ?auto_172680 ) ) ( not ( = ?auto_172676 ?auto_172681 ) ) ( not ( = ?auto_172676 ?auto_172682 ) ) ( not ( = ?auto_172677 ?auto_172678 ) ) ( not ( = ?auto_172677 ?auto_172679 ) ) ( not ( = ?auto_172677 ?auto_172680 ) ) ( not ( = ?auto_172677 ?auto_172681 ) ) ( not ( = ?auto_172677 ?auto_172682 ) ) ( not ( = ?auto_172678 ?auto_172679 ) ) ( not ( = ?auto_172678 ?auto_172680 ) ) ( not ( = ?auto_172678 ?auto_172681 ) ) ( not ( = ?auto_172678 ?auto_172682 ) ) ( not ( = ?auto_172679 ?auto_172680 ) ) ( not ( = ?auto_172679 ?auto_172681 ) ) ( not ( = ?auto_172679 ?auto_172682 ) ) ( not ( = ?auto_172680 ?auto_172681 ) ) ( not ( = ?auto_172680 ?auto_172682 ) ) ( not ( = ?auto_172681 ?auto_172682 ) ) ( ON ?auto_172682 ?auto_172683 ) ( not ( = ?auto_172676 ?auto_172683 ) ) ( not ( = ?auto_172677 ?auto_172683 ) ) ( not ( = ?auto_172678 ?auto_172683 ) ) ( not ( = ?auto_172679 ?auto_172683 ) ) ( not ( = ?auto_172680 ?auto_172683 ) ) ( not ( = ?auto_172681 ?auto_172683 ) ) ( not ( = ?auto_172682 ?auto_172683 ) ) ( ON ?auto_172681 ?auto_172682 ) ( ON-TABLE ?auto_172683 ) ( ON ?auto_172680 ?auto_172681 ) ( ON ?auto_172679 ?auto_172680 ) ( CLEAR ?auto_172679 ) ( HOLDING ?auto_172678 ) ( CLEAR ?auto_172677 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172676 ?auto_172677 ?auto_172678 )
      ( MAKE-7PILE ?auto_172676 ?auto_172677 ?auto_172678 ?auto_172679 ?auto_172680 ?auto_172681 ?auto_172682 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172684 - BLOCK
      ?auto_172685 - BLOCK
      ?auto_172686 - BLOCK
      ?auto_172687 - BLOCK
      ?auto_172688 - BLOCK
      ?auto_172689 - BLOCK
      ?auto_172690 - BLOCK
    )
    :vars
    (
      ?auto_172691 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172684 ) ( ON ?auto_172685 ?auto_172684 ) ( not ( = ?auto_172684 ?auto_172685 ) ) ( not ( = ?auto_172684 ?auto_172686 ) ) ( not ( = ?auto_172684 ?auto_172687 ) ) ( not ( = ?auto_172684 ?auto_172688 ) ) ( not ( = ?auto_172684 ?auto_172689 ) ) ( not ( = ?auto_172684 ?auto_172690 ) ) ( not ( = ?auto_172685 ?auto_172686 ) ) ( not ( = ?auto_172685 ?auto_172687 ) ) ( not ( = ?auto_172685 ?auto_172688 ) ) ( not ( = ?auto_172685 ?auto_172689 ) ) ( not ( = ?auto_172685 ?auto_172690 ) ) ( not ( = ?auto_172686 ?auto_172687 ) ) ( not ( = ?auto_172686 ?auto_172688 ) ) ( not ( = ?auto_172686 ?auto_172689 ) ) ( not ( = ?auto_172686 ?auto_172690 ) ) ( not ( = ?auto_172687 ?auto_172688 ) ) ( not ( = ?auto_172687 ?auto_172689 ) ) ( not ( = ?auto_172687 ?auto_172690 ) ) ( not ( = ?auto_172688 ?auto_172689 ) ) ( not ( = ?auto_172688 ?auto_172690 ) ) ( not ( = ?auto_172689 ?auto_172690 ) ) ( ON ?auto_172690 ?auto_172691 ) ( not ( = ?auto_172684 ?auto_172691 ) ) ( not ( = ?auto_172685 ?auto_172691 ) ) ( not ( = ?auto_172686 ?auto_172691 ) ) ( not ( = ?auto_172687 ?auto_172691 ) ) ( not ( = ?auto_172688 ?auto_172691 ) ) ( not ( = ?auto_172689 ?auto_172691 ) ) ( not ( = ?auto_172690 ?auto_172691 ) ) ( ON ?auto_172689 ?auto_172690 ) ( ON-TABLE ?auto_172691 ) ( ON ?auto_172688 ?auto_172689 ) ( ON ?auto_172687 ?auto_172688 ) ( CLEAR ?auto_172685 ) ( ON ?auto_172686 ?auto_172687 ) ( CLEAR ?auto_172686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172691 ?auto_172690 ?auto_172689 ?auto_172688 ?auto_172687 )
      ( MAKE-7PILE ?auto_172684 ?auto_172685 ?auto_172686 ?auto_172687 ?auto_172688 ?auto_172689 ?auto_172690 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172692 - BLOCK
      ?auto_172693 - BLOCK
      ?auto_172694 - BLOCK
      ?auto_172695 - BLOCK
      ?auto_172696 - BLOCK
      ?auto_172697 - BLOCK
      ?auto_172698 - BLOCK
    )
    :vars
    (
      ?auto_172699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172692 ) ( not ( = ?auto_172692 ?auto_172693 ) ) ( not ( = ?auto_172692 ?auto_172694 ) ) ( not ( = ?auto_172692 ?auto_172695 ) ) ( not ( = ?auto_172692 ?auto_172696 ) ) ( not ( = ?auto_172692 ?auto_172697 ) ) ( not ( = ?auto_172692 ?auto_172698 ) ) ( not ( = ?auto_172693 ?auto_172694 ) ) ( not ( = ?auto_172693 ?auto_172695 ) ) ( not ( = ?auto_172693 ?auto_172696 ) ) ( not ( = ?auto_172693 ?auto_172697 ) ) ( not ( = ?auto_172693 ?auto_172698 ) ) ( not ( = ?auto_172694 ?auto_172695 ) ) ( not ( = ?auto_172694 ?auto_172696 ) ) ( not ( = ?auto_172694 ?auto_172697 ) ) ( not ( = ?auto_172694 ?auto_172698 ) ) ( not ( = ?auto_172695 ?auto_172696 ) ) ( not ( = ?auto_172695 ?auto_172697 ) ) ( not ( = ?auto_172695 ?auto_172698 ) ) ( not ( = ?auto_172696 ?auto_172697 ) ) ( not ( = ?auto_172696 ?auto_172698 ) ) ( not ( = ?auto_172697 ?auto_172698 ) ) ( ON ?auto_172698 ?auto_172699 ) ( not ( = ?auto_172692 ?auto_172699 ) ) ( not ( = ?auto_172693 ?auto_172699 ) ) ( not ( = ?auto_172694 ?auto_172699 ) ) ( not ( = ?auto_172695 ?auto_172699 ) ) ( not ( = ?auto_172696 ?auto_172699 ) ) ( not ( = ?auto_172697 ?auto_172699 ) ) ( not ( = ?auto_172698 ?auto_172699 ) ) ( ON ?auto_172697 ?auto_172698 ) ( ON-TABLE ?auto_172699 ) ( ON ?auto_172696 ?auto_172697 ) ( ON ?auto_172695 ?auto_172696 ) ( ON ?auto_172694 ?auto_172695 ) ( CLEAR ?auto_172694 ) ( HOLDING ?auto_172693 ) ( CLEAR ?auto_172692 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172692 ?auto_172693 )
      ( MAKE-7PILE ?auto_172692 ?auto_172693 ?auto_172694 ?auto_172695 ?auto_172696 ?auto_172697 ?auto_172698 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172700 - BLOCK
      ?auto_172701 - BLOCK
      ?auto_172702 - BLOCK
      ?auto_172703 - BLOCK
      ?auto_172704 - BLOCK
      ?auto_172705 - BLOCK
      ?auto_172706 - BLOCK
    )
    :vars
    (
      ?auto_172707 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172700 ) ( not ( = ?auto_172700 ?auto_172701 ) ) ( not ( = ?auto_172700 ?auto_172702 ) ) ( not ( = ?auto_172700 ?auto_172703 ) ) ( not ( = ?auto_172700 ?auto_172704 ) ) ( not ( = ?auto_172700 ?auto_172705 ) ) ( not ( = ?auto_172700 ?auto_172706 ) ) ( not ( = ?auto_172701 ?auto_172702 ) ) ( not ( = ?auto_172701 ?auto_172703 ) ) ( not ( = ?auto_172701 ?auto_172704 ) ) ( not ( = ?auto_172701 ?auto_172705 ) ) ( not ( = ?auto_172701 ?auto_172706 ) ) ( not ( = ?auto_172702 ?auto_172703 ) ) ( not ( = ?auto_172702 ?auto_172704 ) ) ( not ( = ?auto_172702 ?auto_172705 ) ) ( not ( = ?auto_172702 ?auto_172706 ) ) ( not ( = ?auto_172703 ?auto_172704 ) ) ( not ( = ?auto_172703 ?auto_172705 ) ) ( not ( = ?auto_172703 ?auto_172706 ) ) ( not ( = ?auto_172704 ?auto_172705 ) ) ( not ( = ?auto_172704 ?auto_172706 ) ) ( not ( = ?auto_172705 ?auto_172706 ) ) ( ON ?auto_172706 ?auto_172707 ) ( not ( = ?auto_172700 ?auto_172707 ) ) ( not ( = ?auto_172701 ?auto_172707 ) ) ( not ( = ?auto_172702 ?auto_172707 ) ) ( not ( = ?auto_172703 ?auto_172707 ) ) ( not ( = ?auto_172704 ?auto_172707 ) ) ( not ( = ?auto_172705 ?auto_172707 ) ) ( not ( = ?auto_172706 ?auto_172707 ) ) ( ON ?auto_172705 ?auto_172706 ) ( ON-TABLE ?auto_172707 ) ( ON ?auto_172704 ?auto_172705 ) ( ON ?auto_172703 ?auto_172704 ) ( ON ?auto_172702 ?auto_172703 ) ( CLEAR ?auto_172700 ) ( ON ?auto_172701 ?auto_172702 ) ( CLEAR ?auto_172701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172707 ?auto_172706 ?auto_172705 ?auto_172704 ?auto_172703 ?auto_172702 )
      ( MAKE-7PILE ?auto_172700 ?auto_172701 ?auto_172702 ?auto_172703 ?auto_172704 ?auto_172705 ?auto_172706 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172708 - BLOCK
      ?auto_172709 - BLOCK
      ?auto_172710 - BLOCK
      ?auto_172711 - BLOCK
      ?auto_172712 - BLOCK
      ?auto_172713 - BLOCK
      ?auto_172714 - BLOCK
    )
    :vars
    (
      ?auto_172715 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172708 ?auto_172709 ) ) ( not ( = ?auto_172708 ?auto_172710 ) ) ( not ( = ?auto_172708 ?auto_172711 ) ) ( not ( = ?auto_172708 ?auto_172712 ) ) ( not ( = ?auto_172708 ?auto_172713 ) ) ( not ( = ?auto_172708 ?auto_172714 ) ) ( not ( = ?auto_172709 ?auto_172710 ) ) ( not ( = ?auto_172709 ?auto_172711 ) ) ( not ( = ?auto_172709 ?auto_172712 ) ) ( not ( = ?auto_172709 ?auto_172713 ) ) ( not ( = ?auto_172709 ?auto_172714 ) ) ( not ( = ?auto_172710 ?auto_172711 ) ) ( not ( = ?auto_172710 ?auto_172712 ) ) ( not ( = ?auto_172710 ?auto_172713 ) ) ( not ( = ?auto_172710 ?auto_172714 ) ) ( not ( = ?auto_172711 ?auto_172712 ) ) ( not ( = ?auto_172711 ?auto_172713 ) ) ( not ( = ?auto_172711 ?auto_172714 ) ) ( not ( = ?auto_172712 ?auto_172713 ) ) ( not ( = ?auto_172712 ?auto_172714 ) ) ( not ( = ?auto_172713 ?auto_172714 ) ) ( ON ?auto_172714 ?auto_172715 ) ( not ( = ?auto_172708 ?auto_172715 ) ) ( not ( = ?auto_172709 ?auto_172715 ) ) ( not ( = ?auto_172710 ?auto_172715 ) ) ( not ( = ?auto_172711 ?auto_172715 ) ) ( not ( = ?auto_172712 ?auto_172715 ) ) ( not ( = ?auto_172713 ?auto_172715 ) ) ( not ( = ?auto_172714 ?auto_172715 ) ) ( ON ?auto_172713 ?auto_172714 ) ( ON-TABLE ?auto_172715 ) ( ON ?auto_172712 ?auto_172713 ) ( ON ?auto_172711 ?auto_172712 ) ( ON ?auto_172710 ?auto_172711 ) ( ON ?auto_172709 ?auto_172710 ) ( CLEAR ?auto_172709 ) ( HOLDING ?auto_172708 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172708 )
      ( MAKE-7PILE ?auto_172708 ?auto_172709 ?auto_172710 ?auto_172711 ?auto_172712 ?auto_172713 ?auto_172714 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172716 - BLOCK
      ?auto_172717 - BLOCK
      ?auto_172718 - BLOCK
      ?auto_172719 - BLOCK
      ?auto_172720 - BLOCK
      ?auto_172721 - BLOCK
      ?auto_172722 - BLOCK
    )
    :vars
    (
      ?auto_172723 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172716 ?auto_172717 ) ) ( not ( = ?auto_172716 ?auto_172718 ) ) ( not ( = ?auto_172716 ?auto_172719 ) ) ( not ( = ?auto_172716 ?auto_172720 ) ) ( not ( = ?auto_172716 ?auto_172721 ) ) ( not ( = ?auto_172716 ?auto_172722 ) ) ( not ( = ?auto_172717 ?auto_172718 ) ) ( not ( = ?auto_172717 ?auto_172719 ) ) ( not ( = ?auto_172717 ?auto_172720 ) ) ( not ( = ?auto_172717 ?auto_172721 ) ) ( not ( = ?auto_172717 ?auto_172722 ) ) ( not ( = ?auto_172718 ?auto_172719 ) ) ( not ( = ?auto_172718 ?auto_172720 ) ) ( not ( = ?auto_172718 ?auto_172721 ) ) ( not ( = ?auto_172718 ?auto_172722 ) ) ( not ( = ?auto_172719 ?auto_172720 ) ) ( not ( = ?auto_172719 ?auto_172721 ) ) ( not ( = ?auto_172719 ?auto_172722 ) ) ( not ( = ?auto_172720 ?auto_172721 ) ) ( not ( = ?auto_172720 ?auto_172722 ) ) ( not ( = ?auto_172721 ?auto_172722 ) ) ( ON ?auto_172722 ?auto_172723 ) ( not ( = ?auto_172716 ?auto_172723 ) ) ( not ( = ?auto_172717 ?auto_172723 ) ) ( not ( = ?auto_172718 ?auto_172723 ) ) ( not ( = ?auto_172719 ?auto_172723 ) ) ( not ( = ?auto_172720 ?auto_172723 ) ) ( not ( = ?auto_172721 ?auto_172723 ) ) ( not ( = ?auto_172722 ?auto_172723 ) ) ( ON ?auto_172721 ?auto_172722 ) ( ON-TABLE ?auto_172723 ) ( ON ?auto_172720 ?auto_172721 ) ( ON ?auto_172719 ?auto_172720 ) ( ON ?auto_172718 ?auto_172719 ) ( ON ?auto_172717 ?auto_172718 ) ( ON ?auto_172716 ?auto_172717 ) ( CLEAR ?auto_172716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172723 ?auto_172722 ?auto_172721 ?auto_172720 ?auto_172719 ?auto_172718 ?auto_172717 )
      ( MAKE-7PILE ?auto_172716 ?auto_172717 ?auto_172718 ?auto_172719 ?auto_172720 ?auto_172721 ?auto_172722 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172731 - BLOCK
      ?auto_172732 - BLOCK
      ?auto_172733 - BLOCK
      ?auto_172734 - BLOCK
      ?auto_172735 - BLOCK
      ?auto_172736 - BLOCK
      ?auto_172737 - BLOCK
    )
    :vars
    (
      ?auto_172738 - BLOCK
      ?auto_172739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172731 ?auto_172732 ) ) ( not ( = ?auto_172731 ?auto_172733 ) ) ( not ( = ?auto_172731 ?auto_172734 ) ) ( not ( = ?auto_172731 ?auto_172735 ) ) ( not ( = ?auto_172731 ?auto_172736 ) ) ( not ( = ?auto_172731 ?auto_172737 ) ) ( not ( = ?auto_172732 ?auto_172733 ) ) ( not ( = ?auto_172732 ?auto_172734 ) ) ( not ( = ?auto_172732 ?auto_172735 ) ) ( not ( = ?auto_172732 ?auto_172736 ) ) ( not ( = ?auto_172732 ?auto_172737 ) ) ( not ( = ?auto_172733 ?auto_172734 ) ) ( not ( = ?auto_172733 ?auto_172735 ) ) ( not ( = ?auto_172733 ?auto_172736 ) ) ( not ( = ?auto_172733 ?auto_172737 ) ) ( not ( = ?auto_172734 ?auto_172735 ) ) ( not ( = ?auto_172734 ?auto_172736 ) ) ( not ( = ?auto_172734 ?auto_172737 ) ) ( not ( = ?auto_172735 ?auto_172736 ) ) ( not ( = ?auto_172735 ?auto_172737 ) ) ( not ( = ?auto_172736 ?auto_172737 ) ) ( ON ?auto_172737 ?auto_172738 ) ( not ( = ?auto_172731 ?auto_172738 ) ) ( not ( = ?auto_172732 ?auto_172738 ) ) ( not ( = ?auto_172733 ?auto_172738 ) ) ( not ( = ?auto_172734 ?auto_172738 ) ) ( not ( = ?auto_172735 ?auto_172738 ) ) ( not ( = ?auto_172736 ?auto_172738 ) ) ( not ( = ?auto_172737 ?auto_172738 ) ) ( ON ?auto_172736 ?auto_172737 ) ( ON-TABLE ?auto_172738 ) ( ON ?auto_172735 ?auto_172736 ) ( ON ?auto_172734 ?auto_172735 ) ( ON ?auto_172733 ?auto_172734 ) ( ON ?auto_172732 ?auto_172733 ) ( CLEAR ?auto_172732 ) ( ON ?auto_172731 ?auto_172739 ) ( CLEAR ?auto_172731 ) ( HAND-EMPTY ) ( not ( = ?auto_172731 ?auto_172739 ) ) ( not ( = ?auto_172732 ?auto_172739 ) ) ( not ( = ?auto_172733 ?auto_172739 ) ) ( not ( = ?auto_172734 ?auto_172739 ) ) ( not ( = ?auto_172735 ?auto_172739 ) ) ( not ( = ?auto_172736 ?auto_172739 ) ) ( not ( = ?auto_172737 ?auto_172739 ) ) ( not ( = ?auto_172738 ?auto_172739 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_172731 ?auto_172739 )
      ( MAKE-7PILE ?auto_172731 ?auto_172732 ?auto_172733 ?auto_172734 ?auto_172735 ?auto_172736 ?auto_172737 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172740 - BLOCK
      ?auto_172741 - BLOCK
      ?auto_172742 - BLOCK
      ?auto_172743 - BLOCK
      ?auto_172744 - BLOCK
      ?auto_172745 - BLOCK
      ?auto_172746 - BLOCK
    )
    :vars
    (
      ?auto_172747 - BLOCK
      ?auto_172748 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172740 ?auto_172741 ) ) ( not ( = ?auto_172740 ?auto_172742 ) ) ( not ( = ?auto_172740 ?auto_172743 ) ) ( not ( = ?auto_172740 ?auto_172744 ) ) ( not ( = ?auto_172740 ?auto_172745 ) ) ( not ( = ?auto_172740 ?auto_172746 ) ) ( not ( = ?auto_172741 ?auto_172742 ) ) ( not ( = ?auto_172741 ?auto_172743 ) ) ( not ( = ?auto_172741 ?auto_172744 ) ) ( not ( = ?auto_172741 ?auto_172745 ) ) ( not ( = ?auto_172741 ?auto_172746 ) ) ( not ( = ?auto_172742 ?auto_172743 ) ) ( not ( = ?auto_172742 ?auto_172744 ) ) ( not ( = ?auto_172742 ?auto_172745 ) ) ( not ( = ?auto_172742 ?auto_172746 ) ) ( not ( = ?auto_172743 ?auto_172744 ) ) ( not ( = ?auto_172743 ?auto_172745 ) ) ( not ( = ?auto_172743 ?auto_172746 ) ) ( not ( = ?auto_172744 ?auto_172745 ) ) ( not ( = ?auto_172744 ?auto_172746 ) ) ( not ( = ?auto_172745 ?auto_172746 ) ) ( ON ?auto_172746 ?auto_172747 ) ( not ( = ?auto_172740 ?auto_172747 ) ) ( not ( = ?auto_172741 ?auto_172747 ) ) ( not ( = ?auto_172742 ?auto_172747 ) ) ( not ( = ?auto_172743 ?auto_172747 ) ) ( not ( = ?auto_172744 ?auto_172747 ) ) ( not ( = ?auto_172745 ?auto_172747 ) ) ( not ( = ?auto_172746 ?auto_172747 ) ) ( ON ?auto_172745 ?auto_172746 ) ( ON-TABLE ?auto_172747 ) ( ON ?auto_172744 ?auto_172745 ) ( ON ?auto_172743 ?auto_172744 ) ( ON ?auto_172742 ?auto_172743 ) ( ON ?auto_172740 ?auto_172748 ) ( CLEAR ?auto_172740 ) ( not ( = ?auto_172740 ?auto_172748 ) ) ( not ( = ?auto_172741 ?auto_172748 ) ) ( not ( = ?auto_172742 ?auto_172748 ) ) ( not ( = ?auto_172743 ?auto_172748 ) ) ( not ( = ?auto_172744 ?auto_172748 ) ) ( not ( = ?auto_172745 ?auto_172748 ) ) ( not ( = ?auto_172746 ?auto_172748 ) ) ( not ( = ?auto_172747 ?auto_172748 ) ) ( HOLDING ?auto_172741 ) ( CLEAR ?auto_172742 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172747 ?auto_172746 ?auto_172745 ?auto_172744 ?auto_172743 ?auto_172742 ?auto_172741 )
      ( MAKE-7PILE ?auto_172740 ?auto_172741 ?auto_172742 ?auto_172743 ?auto_172744 ?auto_172745 ?auto_172746 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172749 - BLOCK
      ?auto_172750 - BLOCK
      ?auto_172751 - BLOCK
      ?auto_172752 - BLOCK
      ?auto_172753 - BLOCK
      ?auto_172754 - BLOCK
      ?auto_172755 - BLOCK
    )
    :vars
    (
      ?auto_172756 - BLOCK
      ?auto_172757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172749 ?auto_172750 ) ) ( not ( = ?auto_172749 ?auto_172751 ) ) ( not ( = ?auto_172749 ?auto_172752 ) ) ( not ( = ?auto_172749 ?auto_172753 ) ) ( not ( = ?auto_172749 ?auto_172754 ) ) ( not ( = ?auto_172749 ?auto_172755 ) ) ( not ( = ?auto_172750 ?auto_172751 ) ) ( not ( = ?auto_172750 ?auto_172752 ) ) ( not ( = ?auto_172750 ?auto_172753 ) ) ( not ( = ?auto_172750 ?auto_172754 ) ) ( not ( = ?auto_172750 ?auto_172755 ) ) ( not ( = ?auto_172751 ?auto_172752 ) ) ( not ( = ?auto_172751 ?auto_172753 ) ) ( not ( = ?auto_172751 ?auto_172754 ) ) ( not ( = ?auto_172751 ?auto_172755 ) ) ( not ( = ?auto_172752 ?auto_172753 ) ) ( not ( = ?auto_172752 ?auto_172754 ) ) ( not ( = ?auto_172752 ?auto_172755 ) ) ( not ( = ?auto_172753 ?auto_172754 ) ) ( not ( = ?auto_172753 ?auto_172755 ) ) ( not ( = ?auto_172754 ?auto_172755 ) ) ( ON ?auto_172755 ?auto_172756 ) ( not ( = ?auto_172749 ?auto_172756 ) ) ( not ( = ?auto_172750 ?auto_172756 ) ) ( not ( = ?auto_172751 ?auto_172756 ) ) ( not ( = ?auto_172752 ?auto_172756 ) ) ( not ( = ?auto_172753 ?auto_172756 ) ) ( not ( = ?auto_172754 ?auto_172756 ) ) ( not ( = ?auto_172755 ?auto_172756 ) ) ( ON ?auto_172754 ?auto_172755 ) ( ON-TABLE ?auto_172756 ) ( ON ?auto_172753 ?auto_172754 ) ( ON ?auto_172752 ?auto_172753 ) ( ON ?auto_172751 ?auto_172752 ) ( ON ?auto_172749 ?auto_172757 ) ( not ( = ?auto_172749 ?auto_172757 ) ) ( not ( = ?auto_172750 ?auto_172757 ) ) ( not ( = ?auto_172751 ?auto_172757 ) ) ( not ( = ?auto_172752 ?auto_172757 ) ) ( not ( = ?auto_172753 ?auto_172757 ) ) ( not ( = ?auto_172754 ?auto_172757 ) ) ( not ( = ?auto_172755 ?auto_172757 ) ) ( not ( = ?auto_172756 ?auto_172757 ) ) ( CLEAR ?auto_172751 ) ( ON ?auto_172750 ?auto_172749 ) ( CLEAR ?auto_172750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172757 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172757 ?auto_172749 )
      ( MAKE-7PILE ?auto_172749 ?auto_172750 ?auto_172751 ?auto_172752 ?auto_172753 ?auto_172754 ?auto_172755 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172758 - BLOCK
      ?auto_172759 - BLOCK
      ?auto_172760 - BLOCK
      ?auto_172761 - BLOCK
      ?auto_172762 - BLOCK
      ?auto_172763 - BLOCK
      ?auto_172764 - BLOCK
    )
    :vars
    (
      ?auto_172765 - BLOCK
      ?auto_172766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172758 ?auto_172759 ) ) ( not ( = ?auto_172758 ?auto_172760 ) ) ( not ( = ?auto_172758 ?auto_172761 ) ) ( not ( = ?auto_172758 ?auto_172762 ) ) ( not ( = ?auto_172758 ?auto_172763 ) ) ( not ( = ?auto_172758 ?auto_172764 ) ) ( not ( = ?auto_172759 ?auto_172760 ) ) ( not ( = ?auto_172759 ?auto_172761 ) ) ( not ( = ?auto_172759 ?auto_172762 ) ) ( not ( = ?auto_172759 ?auto_172763 ) ) ( not ( = ?auto_172759 ?auto_172764 ) ) ( not ( = ?auto_172760 ?auto_172761 ) ) ( not ( = ?auto_172760 ?auto_172762 ) ) ( not ( = ?auto_172760 ?auto_172763 ) ) ( not ( = ?auto_172760 ?auto_172764 ) ) ( not ( = ?auto_172761 ?auto_172762 ) ) ( not ( = ?auto_172761 ?auto_172763 ) ) ( not ( = ?auto_172761 ?auto_172764 ) ) ( not ( = ?auto_172762 ?auto_172763 ) ) ( not ( = ?auto_172762 ?auto_172764 ) ) ( not ( = ?auto_172763 ?auto_172764 ) ) ( ON ?auto_172764 ?auto_172765 ) ( not ( = ?auto_172758 ?auto_172765 ) ) ( not ( = ?auto_172759 ?auto_172765 ) ) ( not ( = ?auto_172760 ?auto_172765 ) ) ( not ( = ?auto_172761 ?auto_172765 ) ) ( not ( = ?auto_172762 ?auto_172765 ) ) ( not ( = ?auto_172763 ?auto_172765 ) ) ( not ( = ?auto_172764 ?auto_172765 ) ) ( ON ?auto_172763 ?auto_172764 ) ( ON-TABLE ?auto_172765 ) ( ON ?auto_172762 ?auto_172763 ) ( ON ?auto_172761 ?auto_172762 ) ( ON ?auto_172758 ?auto_172766 ) ( not ( = ?auto_172758 ?auto_172766 ) ) ( not ( = ?auto_172759 ?auto_172766 ) ) ( not ( = ?auto_172760 ?auto_172766 ) ) ( not ( = ?auto_172761 ?auto_172766 ) ) ( not ( = ?auto_172762 ?auto_172766 ) ) ( not ( = ?auto_172763 ?auto_172766 ) ) ( not ( = ?auto_172764 ?auto_172766 ) ) ( not ( = ?auto_172765 ?auto_172766 ) ) ( ON ?auto_172759 ?auto_172758 ) ( CLEAR ?auto_172759 ) ( ON-TABLE ?auto_172766 ) ( HOLDING ?auto_172760 ) ( CLEAR ?auto_172761 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172765 ?auto_172764 ?auto_172763 ?auto_172762 ?auto_172761 ?auto_172760 )
      ( MAKE-7PILE ?auto_172758 ?auto_172759 ?auto_172760 ?auto_172761 ?auto_172762 ?auto_172763 ?auto_172764 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172767 - BLOCK
      ?auto_172768 - BLOCK
      ?auto_172769 - BLOCK
      ?auto_172770 - BLOCK
      ?auto_172771 - BLOCK
      ?auto_172772 - BLOCK
      ?auto_172773 - BLOCK
    )
    :vars
    (
      ?auto_172774 - BLOCK
      ?auto_172775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172767 ?auto_172768 ) ) ( not ( = ?auto_172767 ?auto_172769 ) ) ( not ( = ?auto_172767 ?auto_172770 ) ) ( not ( = ?auto_172767 ?auto_172771 ) ) ( not ( = ?auto_172767 ?auto_172772 ) ) ( not ( = ?auto_172767 ?auto_172773 ) ) ( not ( = ?auto_172768 ?auto_172769 ) ) ( not ( = ?auto_172768 ?auto_172770 ) ) ( not ( = ?auto_172768 ?auto_172771 ) ) ( not ( = ?auto_172768 ?auto_172772 ) ) ( not ( = ?auto_172768 ?auto_172773 ) ) ( not ( = ?auto_172769 ?auto_172770 ) ) ( not ( = ?auto_172769 ?auto_172771 ) ) ( not ( = ?auto_172769 ?auto_172772 ) ) ( not ( = ?auto_172769 ?auto_172773 ) ) ( not ( = ?auto_172770 ?auto_172771 ) ) ( not ( = ?auto_172770 ?auto_172772 ) ) ( not ( = ?auto_172770 ?auto_172773 ) ) ( not ( = ?auto_172771 ?auto_172772 ) ) ( not ( = ?auto_172771 ?auto_172773 ) ) ( not ( = ?auto_172772 ?auto_172773 ) ) ( ON ?auto_172773 ?auto_172774 ) ( not ( = ?auto_172767 ?auto_172774 ) ) ( not ( = ?auto_172768 ?auto_172774 ) ) ( not ( = ?auto_172769 ?auto_172774 ) ) ( not ( = ?auto_172770 ?auto_172774 ) ) ( not ( = ?auto_172771 ?auto_172774 ) ) ( not ( = ?auto_172772 ?auto_172774 ) ) ( not ( = ?auto_172773 ?auto_172774 ) ) ( ON ?auto_172772 ?auto_172773 ) ( ON-TABLE ?auto_172774 ) ( ON ?auto_172771 ?auto_172772 ) ( ON ?auto_172770 ?auto_172771 ) ( ON ?auto_172767 ?auto_172775 ) ( not ( = ?auto_172767 ?auto_172775 ) ) ( not ( = ?auto_172768 ?auto_172775 ) ) ( not ( = ?auto_172769 ?auto_172775 ) ) ( not ( = ?auto_172770 ?auto_172775 ) ) ( not ( = ?auto_172771 ?auto_172775 ) ) ( not ( = ?auto_172772 ?auto_172775 ) ) ( not ( = ?auto_172773 ?auto_172775 ) ) ( not ( = ?auto_172774 ?auto_172775 ) ) ( ON ?auto_172768 ?auto_172767 ) ( ON-TABLE ?auto_172775 ) ( CLEAR ?auto_172770 ) ( ON ?auto_172769 ?auto_172768 ) ( CLEAR ?auto_172769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172775 ?auto_172767 ?auto_172768 )
      ( MAKE-7PILE ?auto_172767 ?auto_172768 ?auto_172769 ?auto_172770 ?auto_172771 ?auto_172772 ?auto_172773 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172776 - BLOCK
      ?auto_172777 - BLOCK
      ?auto_172778 - BLOCK
      ?auto_172779 - BLOCK
      ?auto_172780 - BLOCK
      ?auto_172781 - BLOCK
      ?auto_172782 - BLOCK
    )
    :vars
    (
      ?auto_172783 - BLOCK
      ?auto_172784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172776 ?auto_172777 ) ) ( not ( = ?auto_172776 ?auto_172778 ) ) ( not ( = ?auto_172776 ?auto_172779 ) ) ( not ( = ?auto_172776 ?auto_172780 ) ) ( not ( = ?auto_172776 ?auto_172781 ) ) ( not ( = ?auto_172776 ?auto_172782 ) ) ( not ( = ?auto_172777 ?auto_172778 ) ) ( not ( = ?auto_172777 ?auto_172779 ) ) ( not ( = ?auto_172777 ?auto_172780 ) ) ( not ( = ?auto_172777 ?auto_172781 ) ) ( not ( = ?auto_172777 ?auto_172782 ) ) ( not ( = ?auto_172778 ?auto_172779 ) ) ( not ( = ?auto_172778 ?auto_172780 ) ) ( not ( = ?auto_172778 ?auto_172781 ) ) ( not ( = ?auto_172778 ?auto_172782 ) ) ( not ( = ?auto_172779 ?auto_172780 ) ) ( not ( = ?auto_172779 ?auto_172781 ) ) ( not ( = ?auto_172779 ?auto_172782 ) ) ( not ( = ?auto_172780 ?auto_172781 ) ) ( not ( = ?auto_172780 ?auto_172782 ) ) ( not ( = ?auto_172781 ?auto_172782 ) ) ( ON ?auto_172782 ?auto_172783 ) ( not ( = ?auto_172776 ?auto_172783 ) ) ( not ( = ?auto_172777 ?auto_172783 ) ) ( not ( = ?auto_172778 ?auto_172783 ) ) ( not ( = ?auto_172779 ?auto_172783 ) ) ( not ( = ?auto_172780 ?auto_172783 ) ) ( not ( = ?auto_172781 ?auto_172783 ) ) ( not ( = ?auto_172782 ?auto_172783 ) ) ( ON ?auto_172781 ?auto_172782 ) ( ON-TABLE ?auto_172783 ) ( ON ?auto_172780 ?auto_172781 ) ( ON ?auto_172776 ?auto_172784 ) ( not ( = ?auto_172776 ?auto_172784 ) ) ( not ( = ?auto_172777 ?auto_172784 ) ) ( not ( = ?auto_172778 ?auto_172784 ) ) ( not ( = ?auto_172779 ?auto_172784 ) ) ( not ( = ?auto_172780 ?auto_172784 ) ) ( not ( = ?auto_172781 ?auto_172784 ) ) ( not ( = ?auto_172782 ?auto_172784 ) ) ( not ( = ?auto_172783 ?auto_172784 ) ) ( ON ?auto_172777 ?auto_172776 ) ( ON-TABLE ?auto_172784 ) ( ON ?auto_172778 ?auto_172777 ) ( CLEAR ?auto_172778 ) ( HOLDING ?auto_172779 ) ( CLEAR ?auto_172780 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172783 ?auto_172782 ?auto_172781 ?auto_172780 ?auto_172779 )
      ( MAKE-7PILE ?auto_172776 ?auto_172777 ?auto_172778 ?auto_172779 ?auto_172780 ?auto_172781 ?auto_172782 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172785 - BLOCK
      ?auto_172786 - BLOCK
      ?auto_172787 - BLOCK
      ?auto_172788 - BLOCK
      ?auto_172789 - BLOCK
      ?auto_172790 - BLOCK
      ?auto_172791 - BLOCK
    )
    :vars
    (
      ?auto_172792 - BLOCK
      ?auto_172793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172785 ?auto_172786 ) ) ( not ( = ?auto_172785 ?auto_172787 ) ) ( not ( = ?auto_172785 ?auto_172788 ) ) ( not ( = ?auto_172785 ?auto_172789 ) ) ( not ( = ?auto_172785 ?auto_172790 ) ) ( not ( = ?auto_172785 ?auto_172791 ) ) ( not ( = ?auto_172786 ?auto_172787 ) ) ( not ( = ?auto_172786 ?auto_172788 ) ) ( not ( = ?auto_172786 ?auto_172789 ) ) ( not ( = ?auto_172786 ?auto_172790 ) ) ( not ( = ?auto_172786 ?auto_172791 ) ) ( not ( = ?auto_172787 ?auto_172788 ) ) ( not ( = ?auto_172787 ?auto_172789 ) ) ( not ( = ?auto_172787 ?auto_172790 ) ) ( not ( = ?auto_172787 ?auto_172791 ) ) ( not ( = ?auto_172788 ?auto_172789 ) ) ( not ( = ?auto_172788 ?auto_172790 ) ) ( not ( = ?auto_172788 ?auto_172791 ) ) ( not ( = ?auto_172789 ?auto_172790 ) ) ( not ( = ?auto_172789 ?auto_172791 ) ) ( not ( = ?auto_172790 ?auto_172791 ) ) ( ON ?auto_172791 ?auto_172792 ) ( not ( = ?auto_172785 ?auto_172792 ) ) ( not ( = ?auto_172786 ?auto_172792 ) ) ( not ( = ?auto_172787 ?auto_172792 ) ) ( not ( = ?auto_172788 ?auto_172792 ) ) ( not ( = ?auto_172789 ?auto_172792 ) ) ( not ( = ?auto_172790 ?auto_172792 ) ) ( not ( = ?auto_172791 ?auto_172792 ) ) ( ON ?auto_172790 ?auto_172791 ) ( ON-TABLE ?auto_172792 ) ( ON ?auto_172789 ?auto_172790 ) ( ON ?auto_172785 ?auto_172793 ) ( not ( = ?auto_172785 ?auto_172793 ) ) ( not ( = ?auto_172786 ?auto_172793 ) ) ( not ( = ?auto_172787 ?auto_172793 ) ) ( not ( = ?auto_172788 ?auto_172793 ) ) ( not ( = ?auto_172789 ?auto_172793 ) ) ( not ( = ?auto_172790 ?auto_172793 ) ) ( not ( = ?auto_172791 ?auto_172793 ) ) ( not ( = ?auto_172792 ?auto_172793 ) ) ( ON ?auto_172786 ?auto_172785 ) ( ON-TABLE ?auto_172793 ) ( ON ?auto_172787 ?auto_172786 ) ( CLEAR ?auto_172789 ) ( ON ?auto_172788 ?auto_172787 ) ( CLEAR ?auto_172788 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172793 ?auto_172785 ?auto_172786 ?auto_172787 )
      ( MAKE-7PILE ?auto_172785 ?auto_172786 ?auto_172787 ?auto_172788 ?auto_172789 ?auto_172790 ?auto_172791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172794 - BLOCK
      ?auto_172795 - BLOCK
      ?auto_172796 - BLOCK
      ?auto_172797 - BLOCK
      ?auto_172798 - BLOCK
      ?auto_172799 - BLOCK
      ?auto_172800 - BLOCK
    )
    :vars
    (
      ?auto_172802 - BLOCK
      ?auto_172801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172794 ?auto_172795 ) ) ( not ( = ?auto_172794 ?auto_172796 ) ) ( not ( = ?auto_172794 ?auto_172797 ) ) ( not ( = ?auto_172794 ?auto_172798 ) ) ( not ( = ?auto_172794 ?auto_172799 ) ) ( not ( = ?auto_172794 ?auto_172800 ) ) ( not ( = ?auto_172795 ?auto_172796 ) ) ( not ( = ?auto_172795 ?auto_172797 ) ) ( not ( = ?auto_172795 ?auto_172798 ) ) ( not ( = ?auto_172795 ?auto_172799 ) ) ( not ( = ?auto_172795 ?auto_172800 ) ) ( not ( = ?auto_172796 ?auto_172797 ) ) ( not ( = ?auto_172796 ?auto_172798 ) ) ( not ( = ?auto_172796 ?auto_172799 ) ) ( not ( = ?auto_172796 ?auto_172800 ) ) ( not ( = ?auto_172797 ?auto_172798 ) ) ( not ( = ?auto_172797 ?auto_172799 ) ) ( not ( = ?auto_172797 ?auto_172800 ) ) ( not ( = ?auto_172798 ?auto_172799 ) ) ( not ( = ?auto_172798 ?auto_172800 ) ) ( not ( = ?auto_172799 ?auto_172800 ) ) ( ON ?auto_172800 ?auto_172802 ) ( not ( = ?auto_172794 ?auto_172802 ) ) ( not ( = ?auto_172795 ?auto_172802 ) ) ( not ( = ?auto_172796 ?auto_172802 ) ) ( not ( = ?auto_172797 ?auto_172802 ) ) ( not ( = ?auto_172798 ?auto_172802 ) ) ( not ( = ?auto_172799 ?auto_172802 ) ) ( not ( = ?auto_172800 ?auto_172802 ) ) ( ON ?auto_172799 ?auto_172800 ) ( ON-TABLE ?auto_172802 ) ( ON ?auto_172794 ?auto_172801 ) ( not ( = ?auto_172794 ?auto_172801 ) ) ( not ( = ?auto_172795 ?auto_172801 ) ) ( not ( = ?auto_172796 ?auto_172801 ) ) ( not ( = ?auto_172797 ?auto_172801 ) ) ( not ( = ?auto_172798 ?auto_172801 ) ) ( not ( = ?auto_172799 ?auto_172801 ) ) ( not ( = ?auto_172800 ?auto_172801 ) ) ( not ( = ?auto_172802 ?auto_172801 ) ) ( ON ?auto_172795 ?auto_172794 ) ( ON-TABLE ?auto_172801 ) ( ON ?auto_172796 ?auto_172795 ) ( ON ?auto_172797 ?auto_172796 ) ( CLEAR ?auto_172797 ) ( HOLDING ?auto_172798 ) ( CLEAR ?auto_172799 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172802 ?auto_172800 ?auto_172799 ?auto_172798 )
      ( MAKE-7PILE ?auto_172794 ?auto_172795 ?auto_172796 ?auto_172797 ?auto_172798 ?auto_172799 ?auto_172800 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172803 - BLOCK
      ?auto_172804 - BLOCK
      ?auto_172805 - BLOCK
      ?auto_172806 - BLOCK
      ?auto_172807 - BLOCK
      ?auto_172808 - BLOCK
      ?auto_172809 - BLOCK
    )
    :vars
    (
      ?auto_172810 - BLOCK
      ?auto_172811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172803 ?auto_172804 ) ) ( not ( = ?auto_172803 ?auto_172805 ) ) ( not ( = ?auto_172803 ?auto_172806 ) ) ( not ( = ?auto_172803 ?auto_172807 ) ) ( not ( = ?auto_172803 ?auto_172808 ) ) ( not ( = ?auto_172803 ?auto_172809 ) ) ( not ( = ?auto_172804 ?auto_172805 ) ) ( not ( = ?auto_172804 ?auto_172806 ) ) ( not ( = ?auto_172804 ?auto_172807 ) ) ( not ( = ?auto_172804 ?auto_172808 ) ) ( not ( = ?auto_172804 ?auto_172809 ) ) ( not ( = ?auto_172805 ?auto_172806 ) ) ( not ( = ?auto_172805 ?auto_172807 ) ) ( not ( = ?auto_172805 ?auto_172808 ) ) ( not ( = ?auto_172805 ?auto_172809 ) ) ( not ( = ?auto_172806 ?auto_172807 ) ) ( not ( = ?auto_172806 ?auto_172808 ) ) ( not ( = ?auto_172806 ?auto_172809 ) ) ( not ( = ?auto_172807 ?auto_172808 ) ) ( not ( = ?auto_172807 ?auto_172809 ) ) ( not ( = ?auto_172808 ?auto_172809 ) ) ( ON ?auto_172809 ?auto_172810 ) ( not ( = ?auto_172803 ?auto_172810 ) ) ( not ( = ?auto_172804 ?auto_172810 ) ) ( not ( = ?auto_172805 ?auto_172810 ) ) ( not ( = ?auto_172806 ?auto_172810 ) ) ( not ( = ?auto_172807 ?auto_172810 ) ) ( not ( = ?auto_172808 ?auto_172810 ) ) ( not ( = ?auto_172809 ?auto_172810 ) ) ( ON ?auto_172808 ?auto_172809 ) ( ON-TABLE ?auto_172810 ) ( ON ?auto_172803 ?auto_172811 ) ( not ( = ?auto_172803 ?auto_172811 ) ) ( not ( = ?auto_172804 ?auto_172811 ) ) ( not ( = ?auto_172805 ?auto_172811 ) ) ( not ( = ?auto_172806 ?auto_172811 ) ) ( not ( = ?auto_172807 ?auto_172811 ) ) ( not ( = ?auto_172808 ?auto_172811 ) ) ( not ( = ?auto_172809 ?auto_172811 ) ) ( not ( = ?auto_172810 ?auto_172811 ) ) ( ON ?auto_172804 ?auto_172803 ) ( ON-TABLE ?auto_172811 ) ( ON ?auto_172805 ?auto_172804 ) ( ON ?auto_172806 ?auto_172805 ) ( CLEAR ?auto_172808 ) ( ON ?auto_172807 ?auto_172806 ) ( CLEAR ?auto_172807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172811 ?auto_172803 ?auto_172804 ?auto_172805 ?auto_172806 )
      ( MAKE-7PILE ?auto_172803 ?auto_172804 ?auto_172805 ?auto_172806 ?auto_172807 ?auto_172808 ?auto_172809 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172812 - BLOCK
      ?auto_172813 - BLOCK
      ?auto_172814 - BLOCK
      ?auto_172815 - BLOCK
      ?auto_172816 - BLOCK
      ?auto_172817 - BLOCK
      ?auto_172818 - BLOCK
    )
    :vars
    (
      ?auto_172820 - BLOCK
      ?auto_172819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172812 ?auto_172813 ) ) ( not ( = ?auto_172812 ?auto_172814 ) ) ( not ( = ?auto_172812 ?auto_172815 ) ) ( not ( = ?auto_172812 ?auto_172816 ) ) ( not ( = ?auto_172812 ?auto_172817 ) ) ( not ( = ?auto_172812 ?auto_172818 ) ) ( not ( = ?auto_172813 ?auto_172814 ) ) ( not ( = ?auto_172813 ?auto_172815 ) ) ( not ( = ?auto_172813 ?auto_172816 ) ) ( not ( = ?auto_172813 ?auto_172817 ) ) ( not ( = ?auto_172813 ?auto_172818 ) ) ( not ( = ?auto_172814 ?auto_172815 ) ) ( not ( = ?auto_172814 ?auto_172816 ) ) ( not ( = ?auto_172814 ?auto_172817 ) ) ( not ( = ?auto_172814 ?auto_172818 ) ) ( not ( = ?auto_172815 ?auto_172816 ) ) ( not ( = ?auto_172815 ?auto_172817 ) ) ( not ( = ?auto_172815 ?auto_172818 ) ) ( not ( = ?auto_172816 ?auto_172817 ) ) ( not ( = ?auto_172816 ?auto_172818 ) ) ( not ( = ?auto_172817 ?auto_172818 ) ) ( ON ?auto_172818 ?auto_172820 ) ( not ( = ?auto_172812 ?auto_172820 ) ) ( not ( = ?auto_172813 ?auto_172820 ) ) ( not ( = ?auto_172814 ?auto_172820 ) ) ( not ( = ?auto_172815 ?auto_172820 ) ) ( not ( = ?auto_172816 ?auto_172820 ) ) ( not ( = ?auto_172817 ?auto_172820 ) ) ( not ( = ?auto_172818 ?auto_172820 ) ) ( ON-TABLE ?auto_172820 ) ( ON ?auto_172812 ?auto_172819 ) ( not ( = ?auto_172812 ?auto_172819 ) ) ( not ( = ?auto_172813 ?auto_172819 ) ) ( not ( = ?auto_172814 ?auto_172819 ) ) ( not ( = ?auto_172815 ?auto_172819 ) ) ( not ( = ?auto_172816 ?auto_172819 ) ) ( not ( = ?auto_172817 ?auto_172819 ) ) ( not ( = ?auto_172818 ?auto_172819 ) ) ( not ( = ?auto_172820 ?auto_172819 ) ) ( ON ?auto_172813 ?auto_172812 ) ( ON-TABLE ?auto_172819 ) ( ON ?auto_172814 ?auto_172813 ) ( ON ?auto_172815 ?auto_172814 ) ( ON ?auto_172816 ?auto_172815 ) ( CLEAR ?auto_172816 ) ( HOLDING ?auto_172817 ) ( CLEAR ?auto_172818 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172820 ?auto_172818 ?auto_172817 )
      ( MAKE-7PILE ?auto_172812 ?auto_172813 ?auto_172814 ?auto_172815 ?auto_172816 ?auto_172817 ?auto_172818 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172821 - BLOCK
      ?auto_172822 - BLOCK
      ?auto_172823 - BLOCK
      ?auto_172824 - BLOCK
      ?auto_172825 - BLOCK
      ?auto_172826 - BLOCK
      ?auto_172827 - BLOCK
    )
    :vars
    (
      ?auto_172828 - BLOCK
      ?auto_172829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172821 ?auto_172822 ) ) ( not ( = ?auto_172821 ?auto_172823 ) ) ( not ( = ?auto_172821 ?auto_172824 ) ) ( not ( = ?auto_172821 ?auto_172825 ) ) ( not ( = ?auto_172821 ?auto_172826 ) ) ( not ( = ?auto_172821 ?auto_172827 ) ) ( not ( = ?auto_172822 ?auto_172823 ) ) ( not ( = ?auto_172822 ?auto_172824 ) ) ( not ( = ?auto_172822 ?auto_172825 ) ) ( not ( = ?auto_172822 ?auto_172826 ) ) ( not ( = ?auto_172822 ?auto_172827 ) ) ( not ( = ?auto_172823 ?auto_172824 ) ) ( not ( = ?auto_172823 ?auto_172825 ) ) ( not ( = ?auto_172823 ?auto_172826 ) ) ( not ( = ?auto_172823 ?auto_172827 ) ) ( not ( = ?auto_172824 ?auto_172825 ) ) ( not ( = ?auto_172824 ?auto_172826 ) ) ( not ( = ?auto_172824 ?auto_172827 ) ) ( not ( = ?auto_172825 ?auto_172826 ) ) ( not ( = ?auto_172825 ?auto_172827 ) ) ( not ( = ?auto_172826 ?auto_172827 ) ) ( ON ?auto_172827 ?auto_172828 ) ( not ( = ?auto_172821 ?auto_172828 ) ) ( not ( = ?auto_172822 ?auto_172828 ) ) ( not ( = ?auto_172823 ?auto_172828 ) ) ( not ( = ?auto_172824 ?auto_172828 ) ) ( not ( = ?auto_172825 ?auto_172828 ) ) ( not ( = ?auto_172826 ?auto_172828 ) ) ( not ( = ?auto_172827 ?auto_172828 ) ) ( ON-TABLE ?auto_172828 ) ( ON ?auto_172821 ?auto_172829 ) ( not ( = ?auto_172821 ?auto_172829 ) ) ( not ( = ?auto_172822 ?auto_172829 ) ) ( not ( = ?auto_172823 ?auto_172829 ) ) ( not ( = ?auto_172824 ?auto_172829 ) ) ( not ( = ?auto_172825 ?auto_172829 ) ) ( not ( = ?auto_172826 ?auto_172829 ) ) ( not ( = ?auto_172827 ?auto_172829 ) ) ( not ( = ?auto_172828 ?auto_172829 ) ) ( ON ?auto_172822 ?auto_172821 ) ( ON-TABLE ?auto_172829 ) ( ON ?auto_172823 ?auto_172822 ) ( ON ?auto_172824 ?auto_172823 ) ( ON ?auto_172825 ?auto_172824 ) ( CLEAR ?auto_172827 ) ( ON ?auto_172826 ?auto_172825 ) ( CLEAR ?auto_172826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172829 ?auto_172821 ?auto_172822 ?auto_172823 ?auto_172824 ?auto_172825 )
      ( MAKE-7PILE ?auto_172821 ?auto_172822 ?auto_172823 ?auto_172824 ?auto_172825 ?auto_172826 ?auto_172827 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172830 - BLOCK
      ?auto_172831 - BLOCK
      ?auto_172832 - BLOCK
      ?auto_172833 - BLOCK
      ?auto_172834 - BLOCK
      ?auto_172835 - BLOCK
      ?auto_172836 - BLOCK
    )
    :vars
    (
      ?auto_172837 - BLOCK
      ?auto_172838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172830 ?auto_172831 ) ) ( not ( = ?auto_172830 ?auto_172832 ) ) ( not ( = ?auto_172830 ?auto_172833 ) ) ( not ( = ?auto_172830 ?auto_172834 ) ) ( not ( = ?auto_172830 ?auto_172835 ) ) ( not ( = ?auto_172830 ?auto_172836 ) ) ( not ( = ?auto_172831 ?auto_172832 ) ) ( not ( = ?auto_172831 ?auto_172833 ) ) ( not ( = ?auto_172831 ?auto_172834 ) ) ( not ( = ?auto_172831 ?auto_172835 ) ) ( not ( = ?auto_172831 ?auto_172836 ) ) ( not ( = ?auto_172832 ?auto_172833 ) ) ( not ( = ?auto_172832 ?auto_172834 ) ) ( not ( = ?auto_172832 ?auto_172835 ) ) ( not ( = ?auto_172832 ?auto_172836 ) ) ( not ( = ?auto_172833 ?auto_172834 ) ) ( not ( = ?auto_172833 ?auto_172835 ) ) ( not ( = ?auto_172833 ?auto_172836 ) ) ( not ( = ?auto_172834 ?auto_172835 ) ) ( not ( = ?auto_172834 ?auto_172836 ) ) ( not ( = ?auto_172835 ?auto_172836 ) ) ( not ( = ?auto_172830 ?auto_172837 ) ) ( not ( = ?auto_172831 ?auto_172837 ) ) ( not ( = ?auto_172832 ?auto_172837 ) ) ( not ( = ?auto_172833 ?auto_172837 ) ) ( not ( = ?auto_172834 ?auto_172837 ) ) ( not ( = ?auto_172835 ?auto_172837 ) ) ( not ( = ?auto_172836 ?auto_172837 ) ) ( ON-TABLE ?auto_172837 ) ( ON ?auto_172830 ?auto_172838 ) ( not ( = ?auto_172830 ?auto_172838 ) ) ( not ( = ?auto_172831 ?auto_172838 ) ) ( not ( = ?auto_172832 ?auto_172838 ) ) ( not ( = ?auto_172833 ?auto_172838 ) ) ( not ( = ?auto_172834 ?auto_172838 ) ) ( not ( = ?auto_172835 ?auto_172838 ) ) ( not ( = ?auto_172836 ?auto_172838 ) ) ( not ( = ?auto_172837 ?auto_172838 ) ) ( ON ?auto_172831 ?auto_172830 ) ( ON-TABLE ?auto_172838 ) ( ON ?auto_172832 ?auto_172831 ) ( ON ?auto_172833 ?auto_172832 ) ( ON ?auto_172834 ?auto_172833 ) ( ON ?auto_172835 ?auto_172834 ) ( CLEAR ?auto_172835 ) ( HOLDING ?auto_172836 ) ( CLEAR ?auto_172837 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172837 ?auto_172836 )
      ( MAKE-7PILE ?auto_172830 ?auto_172831 ?auto_172832 ?auto_172833 ?auto_172834 ?auto_172835 ?auto_172836 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172839 - BLOCK
      ?auto_172840 - BLOCK
      ?auto_172841 - BLOCK
      ?auto_172842 - BLOCK
      ?auto_172843 - BLOCK
      ?auto_172844 - BLOCK
      ?auto_172845 - BLOCK
    )
    :vars
    (
      ?auto_172846 - BLOCK
      ?auto_172847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172839 ?auto_172840 ) ) ( not ( = ?auto_172839 ?auto_172841 ) ) ( not ( = ?auto_172839 ?auto_172842 ) ) ( not ( = ?auto_172839 ?auto_172843 ) ) ( not ( = ?auto_172839 ?auto_172844 ) ) ( not ( = ?auto_172839 ?auto_172845 ) ) ( not ( = ?auto_172840 ?auto_172841 ) ) ( not ( = ?auto_172840 ?auto_172842 ) ) ( not ( = ?auto_172840 ?auto_172843 ) ) ( not ( = ?auto_172840 ?auto_172844 ) ) ( not ( = ?auto_172840 ?auto_172845 ) ) ( not ( = ?auto_172841 ?auto_172842 ) ) ( not ( = ?auto_172841 ?auto_172843 ) ) ( not ( = ?auto_172841 ?auto_172844 ) ) ( not ( = ?auto_172841 ?auto_172845 ) ) ( not ( = ?auto_172842 ?auto_172843 ) ) ( not ( = ?auto_172842 ?auto_172844 ) ) ( not ( = ?auto_172842 ?auto_172845 ) ) ( not ( = ?auto_172843 ?auto_172844 ) ) ( not ( = ?auto_172843 ?auto_172845 ) ) ( not ( = ?auto_172844 ?auto_172845 ) ) ( not ( = ?auto_172839 ?auto_172846 ) ) ( not ( = ?auto_172840 ?auto_172846 ) ) ( not ( = ?auto_172841 ?auto_172846 ) ) ( not ( = ?auto_172842 ?auto_172846 ) ) ( not ( = ?auto_172843 ?auto_172846 ) ) ( not ( = ?auto_172844 ?auto_172846 ) ) ( not ( = ?auto_172845 ?auto_172846 ) ) ( ON-TABLE ?auto_172846 ) ( ON ?auto_172839 ?auto_172847 ) ( not ( = ?auto_172839 ?auto_172847 ) ) ( not ( = ?auto_172840 ?auto_172847 ) ) ( not ( = ?auto_172841 ?auto_172847 ) ) ( not ( = ?auto_172842 ?auto_172847 ) ) ( not ( = ?auto_172843 ?auto_172847 ) ) ( not ( = ?auto_172844 ?auto_172847 ) ) ( not ( = ?auto_172845 ?auto_172847 ) ) ( not ( = ?auto_172846 ?auto_172847 ) ) ( ON ?auto_172840 ?auto_172839 ) ( ON-TABLE ?auto_172847 ) ( ON ?auto_172841 ?auto_172840 ) ( ON ?auto_172842 ?auto_172841 ) ( ON ?auto_172843 ?auto_172842 ) ( ON ?auto_172844 ?auto_172843 ) ( CLEAR ?auto_172846 ) ( ON ?auto_172845 ?auto_172844 ) ( CLEAR ?auto_172845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172847 ?auto_172839 ?auto_172840 ?auto_172841 ?auto_172842 ?auto_172843 ?auto_172844 )
      ( MAKE-7PILE ?auto_172839 ?auto_172840 ?auto_172841 ?auto_172842 ?auto_172843 ?auto_172844 ?auto_172845 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172848 - BLOCK
      ?auto_172849 - BLOCK
      ?auto_172850 - BLOCK
      ?auto_172851 - BLOCK
      ?auto_172852 - BLOCK
      ?auto_172853 - BLOCK
      ?auto_172854 - BLOCK
    )
    :vars
    (
      ?auto_172856 - BLOCK
      ?auto_172855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172848 ?auto_172849 ) ) ( not ( = ?auto_172848 ?auto_172850 ) ) ( not ( = ?auto_172848 ?auto_172851 ) ) ( not ( = ?auto_172848 ?auto_172852 ) ) ( not ( = ?auto_172848 ?auto_172853 ) ) ( not ( = ?auto_172848 ?auto_172854 ) ) ( not ( = ?auto_172849 ?auto_172850 ) ) ( not ( = ?auto_172849 ?auto_172851 ) ) ( not ( = ?auto_172849 ?auto_172852 ) ) ( not ( = ?auto_172849 ?auto_172853 ) ) ( not ( = ?auto_172849 ?auto_172854 ) ) ( not ( = ?auto_172850 ?auto_172851 ) ) ( not ( = ?auto_172850 ?auto_172852 ) ) ( not ( = ?auto_172850 ?auto_172853 ) ) ( not ( = ?auto_172850 ?auto_172854 ) ) ( not ( = ?auto_172851 ?auto_172852 ) ) ( not ( = ?auto_172851 ?auto_172853 ) ) ( not ( = ?auto_172851 ?auto_172854 ) ) ( not ( = ?auto_172852 ?auto_172853 ) ) ( not ( = ?auto_172852 ?auto_172854 ) ) ( not ( = ?auto_172853 ?auto_172854 ) ) ( not ( = ?auto_172848 ?auto_172856 ) ) ( not ( = ?auto_172849 ?auto_172856 ) ) ( not ( = ?auto_172850 ?auto_172856 ) ) ( not ( = ?auto_172851 ?auto_172856 ) ) ( not ( = ?auto_172852 ?auto_172856 ) ) ( not ( = ?auto_172853 ?auto_172856 ) ) ( not ( = ?auto_172854 ?auto_172856 ) ) ( ON ?auto_172848 ?auto_172855 ) ( not ( = ?auto_172848 ?auto_172855 ) ) ( not ( = ?auto_172849 ?auto_172855 ) ) ( not ( = ?auto_172850 ?auto_172855 ) ) ( not ( = ?auto_172851 ?auto_172855 ) ) ( not ( = ?auto_172852 ?auto_172855 ) ) ( not ( = ?auto_172853 ?auto_172855 ) ) ( not ( = ?auto_172854 ?auto_172855 ) ) ( not ( = ?auto_172856 ?auto_172855 ) ) ( ON ?auto_172849 ?auto_172848 ) ( ON-TABLE ?auto_172855 ) ( ON ?auto_172850 ?auto_172849 ) ( ON ?auto_172851 ?auto_172850 ) ( ON ?auto_172852 ?auto_172851 ) ( ON ?auto_172853 ?auto_172852 ) ( ON ?auto_172854 ?auto_172853 ) ( CLEAR ?auto_172854 ) ( HOLDING ?auto_172856 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172856 )
      ( MAKE-7PILE ?auto_172848 ?auto_172849 ?auto_172850 ?auto_172851 ?auto_172852 ?auto_172853 ?auto_172854 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_172857 - BLOCK
      ?auto_172858 - BLOCK
      ?auto_172859 - BLOCK
      ?auto_172860 - BLOCK
      ?auto_172861 - BLOCK
      ?auto_172862 - BLOCK
      ?auto_172863 - BLOCK
    )
    :vars
    (
      ?auto_172865 - BLOCK
      ?auto_172864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172857 ?auto_172858 ) ) ( not ( = ?auto_172857 ?auto_172859 ) ) ( not ( = ?auto_172857 ?auto_172860 ) ) ( not ( = ?auto_172857 ?auto_172861 ) ) ( not ( = ?auto_172857 ?auto_172862 ) ) ( not ( = ?auto_172857 ?auto_172863 ) ) ( not ( = ?auto_172858 ?auto_172859 ) ) ( not ( = ?auto_172858 ?auto_172860 ) ) ( not ( = ?auto_172858 ?auto_172861 ) ) ( not ( = ?auto_172858 ?auto_172862 ) ) ( not ( = ?auto_172858 ?auto_172863 ) ) ( not ( = ?auto_172859 ?auto_172860 ) ) ( not ( = ?auto_172859 ?auto_172861 ) ) ( not ( = ?auto_172859 ?auto_172862 ) ) ( not ( = ?auto_172859 ?auto_172863 ) ) ( not ( = ?auto_172860 ?auto_172861 ) ) ( not ( = ?auto_172860 ?auto_172862 ) ) ( not ( = ?auto_172860 ?auto_172863 ) ) ( not ( = ?auto_172861 ?auto_172862 ) ) ( not ( = ?auto_172861 ?auto_172863 ) ) ( not ( = ?auto_172862 ?auto_172863 ) ) ( not ( = ?auto_172857 ?auto_172865 ) ) ( not ( = ?auto_172858 ?auto_172865 ) ) ( not ( = ?auto_172859 ?auto_172865 ) ) ( not ( = ?auto_172860 ?auto_172865 ) ) ( not ( = ?auto_172861 ?auto_172865 ) ) ( not ( = ?auto_172862 ?auto_172865 ) ) ( not ( = ?auto_172863 ?auto_172865 ) ) ( ON ?auto_172857 ?auto_172864 ) ( not ( = ?auto_172857 ?auto_172864 ) ) ( not ( = ?auto_172858 ?auto_172864 ) ) ( not ( = ?auto_172859 ?auto_172864 ) ) ( not ( = ?auto_172860 ?auto_172864 ) ) ( not ( = ?auto_172861 ?auto_172864 ) ) ( not ( = ?auto_172862 ?auto_172864 ) ) ( not ( = ?auto_172863 ?auto_172864 ) ) ( not ( = ?auto_172865 ?auto_172864 ) ) ( ON ?auto_172858 ?auto_172857 ) ( ON-TABLE ?auto_172864 ) ( ON ?auto_172859 ?auto_172858 ) ( ON ?auto_172860 ?auto_172859 ) ( ON ?auto_172861 ?auto_172860 ) ( ON ?auto_172862 ?auto_172861 ) ( ON ?auto_172863 ?auto_172862 ) ( ON ?auto_172865 ?auto_172863 ) ( CLEAR ?auto_172865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_172864 ?auto_172857 ?auto_172858 ?auto_172859 ?auto_172860 ?auto_172861 ?auto_172862 ?auto_172863 )
      ( MAKE-7PILE ?auto_172857 ?auto_172858 ?auto_172859 ?auto_172860 ?auto_172861 ?auto_172862 ?auto_172863 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172882 - BLOCK
      ?auto_172883 - BLOCK
      ?auto_172884 - BLOCK
      ?auto_172885 - BLOCK
      ?auto_172886 - BLOCK
      ?auto_172887 - BLOCK
      ?auto_172888 - BLOCK
      ?auto_172889 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_172888 ) ( ON-TABLE ?auto_172882 ) ( ON ?auto_172883 ?auto_172882 ) ( ON ?auto_172884 ?auto_172883 ) ( ON ?auto_172885 ?auto_172884 ) ( ON ?auto_172886 ?auto_172885 ) ( ON ?auto_172887 ?auto_172886 ) ( ON ?auto_172888 ?auto_172887 ) ( not ( = ?auto_172882 ?auto_172883 ) ) ( not ( = ?auto_172882 ?auto_172884 ) ) ( not ( = ?auto_172882 ?auto_172885 ) ) ( not ( = ?auto_172882 ?auto_172886 ) ) ( not ( = ?auto_172882 ?auto_172887 ) ) ( not ( = ?auto_172882 ?auto_172888 ) ) ( not ( = ?auto_172882 ?auto_172889 ) ) ( not ( = ?auto_172883 ?auto_172884 ) ) ( not ( = ?auto_172883 ?auto_172885 ) ) ( not ( = ?auto_172883 ?auto_172886 ) ) ( not ( = ?auto_172883 ?auto_172887 ) ) ( not ( = ?auto_172883 ?auto_172888 ) ) ( not ( = ?auto_172883 ?auto_172889 ) ) ( not ( = ?auto_172884 ?auto_172885 ) ) ( not ( = ?auto_172884 ?auto_172886 ) ) ( not ( = ?auto_172884 ?auto_172887 ) ) ( not ( = ?auto_172884 ?auto_172888 ) ) ( not ( = ?auto_172884 ?auto_172889 ) ) ( not ( = ?auto_172885 ?auto_172886 ) ) ( not ( = ?auto_172885 ?auto_172887 ) ) ( not ( = ?auto_172885 ?auto_172888 ) ) ( not ( = ?auto_172885 ?auto_172889 ) ) ( not ( = ?auto_172886 ?auto_172887 ) ) ( not ( = ?auto_172886 ?auto_172888 ) ) ( not ( = ?auto_172886 ?auto_172889 ) ) ( not ( = ?auto_172887 ?auto_172888 ) ) ( not ( = ?auto_172887 ?auto_172889 ) ) ( not ( = ?auto_172888 ?auto_172889 ) ) ( ON-TABLE ?auto_172889 ) ( CLEAR ?auto_172889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_172889 )
      ( MAKE-8PILE ?auto_172882 ?auto_172883 ?auto_172884 ?auto_172885 ?auto_172886 ?auto_172887 ?auto_172888 ?auto_172889 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172890 - BLOCK
      ?auto_172891 - BLOCK
      ?auto_172892 - BLOCK
      ?auto_172893 - BLOCK
      ?auto_172894 - BLOCK
      ?auto_172895 - BLOCK
      ?auto_172896 - BLOCK
      ?auto_172897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172890 ) ( ON ?auto_172891 ?auto_172890 ) ( ON ?auto_172892 ?auto_172891 ) ( ON ?auto_172893 ?auto_172892 ) ( ON ?auto_172894 ?auto_172893 ) ( ON ?auto_172895 ?auto_172894 ) ( not ( = ?auto_172890 ?auto_172891 ) ) ( not ( = ?auto_172890 ?auto_172892 ) ) ( not ( = ?auto_172890 ?auto_172893 ) ) ( not ( = ?auto_172890 ?auto_172894 ) ) ( not ( = ?auto_172890 ?auto_172895 ) ) ( not ( = ?auto_172890 ?auto_172896 ) ) ( not ( = ?auto_172890 ?auto_172897 ) ) ( not ( = ?auto_172891 ?auto_172892 ) ) ( not ( = ?auto_172891 ?auto_172893 ) ) ( not ( = ?auto_172891 ?auto_172894 ) ) ( not ( = ?auto_172891 ?auto_172895 ) ) ( not ( = ?auto_172891 ?auto_172896 ) ) ( not ( = ?auto_172891 ?auto_172897 ) ) ( not ( = ?auto_172892 ?auto_172893 ) ) ( not ( = ?auto_172892 ?auto_172894 ) ) ( not ( = ?auto_172892 ?auto_172895 ) ) ( not ( = ?auto_172892 ?auto_172896 ) ) ( not ( = ?auto_172892 ?auto_172897 ) ) ( not ( = ?auto_172893 ?auto_172894 ) ) ( not ( = ?auto_172893 ?auto_172895 ) ) ( not ( = ?auto_172893 ?auto_172896 ) ) ( not ( = ?auto_172893 ?auto_172897 ) ) ( not ( = ?auto_172894 ?auto_172895 ) ) ( not ( = ?auto_172894 ?auto_172896 ) ) ( not ( = ?auto_172894 ?auto_172897 ) ) ( not ( = ?auto_172895 ?auto_172896 ) ) ( not ( = ?auto_172895 ?auto_172897 ) ) ( not ( = ?auto_172896 ?auto_172897 ) ) ( ON-TABLE ?auto_172897 ) ( CLEAR ?auto_172897 ) ( HOLDING ?auto_172896 ) ( CLEAR ?auto_172895 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_172890 ?auto_172891 ?auto_172892 ?auto_172893 ?auto_172894 ?auto_172895 ?auto_172896 )
      ( MAKE-8PILE ?auto_172890 ?auto_172891 ?auto_172892 ?auto_172893 ?auto_172894 ?auto_172895 ?auto_172896 ?auto_172897 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172898 - BLOCK
      ?auto_172899 - BLOCK
      ?auto_172900 - BLOCK
      ?auto_172901 - BLOCK
      ?auto_172902 - BLOCK
      ?auto_172903 - BLOCK
      ?auto_172904 - BLOCK
      ?auto_172905 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172898 ) ( ON ?auto_172899 ?auto_172898 ) ( ON ?auto_172900 ?auto_172899 ) ( ON ?auto_172901 ?auto_172900 ) ( ON ?auto_172902 ?auto_172901 ) ( ON ?auto_172903 ?auto_172902 ) ( not ( = ?auto_172898 ?auto_172899 ) ) ( not ( = ?auto_172898 ?auto_172900 ) ) ( not ( = ?auto_172898 ?auto_172901 ) ) ( not ( = ?auto_172898 ?auto_172902 ) ) ( not ( = ?auto_172898 ?auto_172903 ) ) ( not ( = ?auto_172898 ?auto_172904 ) ) ( not ( = ?auto_172898 ?auto_172905 ) ) ( not ( = ?auto_172899 ?auto_172900 ) ) ( not ( = ?auto_172899 ?auto_172901 ) ) ( not ( = ?auto_172899 ?auto_172902 ) ) ( not ( = ?auto_172899 ?auto_172903 ) ) ( not ( = ?auto_172899 ?auto_172904 ) ) ( not ( = ?auto_172899 ?auto_172905 ) ) ( not ( = ?auto_172900 ?auto_172901 ) ) ( not ( = ?auto_172900 ?auto_172902 ) ) ( not ( = ?auto_172900 ?auto_172903 ) ) ( not ( = ?auto_172900 ?auto_172904 ) ) ( not ( = ?auto_172900 ?auto_172905 ) ) ( not ( = ?auto_172901 ?auto_172902 ) ) ( not ( = ?auto_172901 ?auto_172903 ) ) ( not ( = ?auto_172901 ?auto_172904 ) ) ( not ( = ?auto_172901 ?auto_172905 ) ) ( not ( = ?auto_172902 ?auto_172903 ) ) ( not ( = ?auto_172902 ?auto_172904 ) ) ( not ( = ?auto_172902 ?auto_172905 ) ) ( not ( = ?auto_172903 ?auto_172904 ) ) ( not ( = ?auto_172903 ?auto_172905 ) ) ( not ( = ?auto_172904 ?auto_172905 ) ) ( ON-TABLE ?auto_172905 ) ( CLEAR ?auto_172903 ) ( ON ?auto_172904 ?auto_172905 ) ( CLEAR ?auto_172904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172905 )
      ( MAKE-8PILE ?auto_172898 ?auto_172899 ?auto_172900 ?auto_172901 ?auto_172902 ?auto_172903 ?auto_172904 ?auto_172905 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172906 - BLOCK
      ?auto_172907 - BLOCK
      ?auto_172908 - BLOCK
      ?auto_172909 - BLOCK
      ?auto_172910 - BLOCK
      ?auto_172911 - BLOCK
      ?auto_172912 - BLOCK
      ?auto_172913 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172906 ) ( ON ?auto_172907 ?auto_172906 ) ( ON ?auto_172908 ?auto_172907 ) ( ON ?auto_172909 ?auto_172908 ) ( ON ?auto_172910 ?auto_172909 ) ( not ( = ?auto_172906 ?auto_172907 ) ) ( not ( = ?auto_172906 ?auto_172908 ) ) ( not ( = ?auto_172906 ?auto_172909 ) ) ( not ( = ?auto_172906 ?auto_172910 ) ) ( not ( = ?auto_172906 ?auto_172911 ) ) ( not ( = ?auto_172906 ?auto_172912 ) ) ( not ( = ?auto_172906 ?auto_172913 ) ) ( not ( = ?auto_172907 ?auto_172908 ) ) ( not ( = ?auto_172907 ?auto_172909 ) ) ( not ( = ?auto_172907 ?auto_172910 ) ) ( not ( = ?auto_172907 ?auto_172911 ) ) ( not ( = ?auto_172907 ?auto_172912 ) ) ( not ( = ?auto_172907 ?auto_172913 ) ) ( not ( = ?auto_172908 ?auto_172909 ) ) ( not ( = ?auto_172908 ?auto_172910 ) ) ( not ( = ?auto_172908 ?auto_172911 ) ) ( not ( = ?auto_172908 ?auto_172912 ) ) ( not ( = ?auto_172908 ?auto_172913 ) ) ( not ( = ?auto_172909 ?auto_172910 ) ) ( not ( = ?auto_172909 ?auto_172911 ) ) ( not ( = ?auto_172909 ?auto_172912 ) ) ( not ( = ?auto_172909 ?auto_172913 ) ) ( not ( = ?auto_172910 ?auto_172911 ) ) ( not ( = ?auto_172910 ?auto_172912 ) ) ( not ( = ?auto_172910 ?auto_172913 ) ) ( not ( = ?auto_172911 ?auto_172912 ) ) ( not ( = ?auto_172911 ?auto_172913 ) ) ( not ( = ?auto_172912 ?auto_172913 ) ) ( ON-TABLE ?auto_172913 ) ( ON ?auto_172912 ?auto_172913 ) ( CLEAR ?auto_172912 ) ( HOLDING ?auto_172911 ) ( CLEAR ?auto_172910 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172906 ?auto_172907 ?auto_172908 ?auto_172909 ?auto_172910 ?auto_172911 )
      ( MAKE-8PILE ?auto_172906 ?auto_172907 ?auto_172908 ?auto_172909 ?auto_172910 ?auto_172911 ?auto_172912 ?auto_172913 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172914 - BLOCK
      ?auto_172915 - BLOCK
      ?auto_172916 - BLOCK
      ?auto_172917 - BLOCK
      ?auto_172918 - BLOCK
      ?auto_172919 - BLOCK
      ?auto_172920 - BLOCK
      ?auto_172921 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172914 ) ( ON ?auto_172915 ?auto_172914 ) ( ON ?auto_172916 ?auto_172915 ) ( ON ?auto_172917 ?auto_172916 ) ( ON ?auto_172918 ?auto_172917 ) ( not ( = ?auto_172914 ?auto_172915 ) ) ( not ( = ?auto_172914 ?auto_172916 ) ) ( not ( = ?auto_172914 ?auto_172917 ) ) ( not ( = ?auto_172914 ?auto_172918 ) ) ( not ( = ?auto_172914 ?auto_172919 ) ) ( not ( = ?auto_172914 ?auto_172920 ) ) ( not ( = ?auto_172914 ?auto_172921 ) ) ( not ( = ?auto_172915 ?auto_172916 ) ) ( not ( = ?auto_172915 ?auto_172917 ) ) ( not ( = ?auto_172915 ?auto_172918 ) ) ( not ( = ?auto_172915 ?auto_172919 ) ) ( not ( = ?auto_172915 ?auto_172920 ) ) ( not ( = ?auto_172915 ?auto_172921 ) ) ( not ( = ?auto_172916 ?auto_172917 ) ) ( not ( = ?auto_172916 ?auto_172918 ) ) ( not ( = ?auto_172916 ?auto_172919 ) ) ( not ( = ?auto_172916 ?auto_172920 ) ) ( not ( = ?auto_172916 ?auto_172921 ) ) ( not ( = ?auto_172917 ?auto_172918 ) ) ( not ( = ?auto_172917 ?auto_172919 ) ) ( not ( = ?auto_172917 ?auto_172920 ) ) ( not ( = ?auto_172917 ?auto_172921 ) ) ( not ( = ?auto_172918 ?auto_172919 ) ) ( not ( = ?auto_172918 ?auto_172920 ) ) ( not ( = ?auto_172918 ?auto_172921 ) ) ( not ( = ?auto_172919 ?auto_172920 ) ) ( not ( = ?auto_172919 ?auto_172921 ) ) ( not ( = ?auto_172920 ?auto_172921 ) ) ( ON-TABLE ?auto_172921 ) ( ON ?auto_172920 ?auto_172921 ) ( CLEAR ?auto_172918 ) ( ON ?auto_172919 ?auto_172920 ) ( CLEAR ?auto_172919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172921 ?auto_172920 )
      ( MAKE-8PILE ?auto_172914 ?auto_172915 ?auto_172916 ?auto_172917 ?auto_172918 ?auto_172919 ?auto_172920 ?auto_172921 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172922 - BLOCK
      ?auto_172923 - BLOCK
      ?auto_172924 - BLOCK
      ?auto_172925 - BLOCK
      ?auto_172926 - BLOCK
      ?auto_172927 - BLOCK
      ?auto_172928 - BLOCK
      ?auto_172929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172922 ) ( ON ?auto_172923 ?auto_172922 ) ( ON ?auto_172924 ?auto_172923 ) ( ON ?auto_172925 ?auto_172924 ) ( not ( = ?auto_172922 ?auto_172923 ) ) ( not ( = ?auto_172922 ?auto_172924 ) ) ( not ( = ?auto_172922 ?auto_172925 ) ) ( not ( = ?auto_172922 ?auto_172926 ) ) ( not ( = ?auto_172922 ?auto_172927 ) ) ( not ( = ?auto_172922 ?auto_172928 ) ) ( not ( = ?auto_172922 ?auto_172929 ) ) ( not ( = ?auto_172923 ?auto_172924 ) ) ( not ( = ?auto_172923 ?auto_172925 ) ) ( not ( = ?auto_172923 ?auto_172926 ) ) ( not ( = ?auto_172923 ?auto_172927 ) ) ( not ( = ?auto_172923 ?auto_172928 ) ) ( not ( = ?auto_172923 ?auto_172929 ) ) ( not ( = ?auto_172924 ?auto_172925 ) ) ( not ( = ?auto_172924 ?auto_172926 ) ) ( not ( = ?auto_172924 ?auto_172927 ) ) ( not ( = ?auto_172924 ?auto_172928 ) ) ( not ( = ?auto_172924 ?auto_172929 ) ) ( not ( = ?auto_172925 ?auto_172926 ) ) ( not ( = ?auto_172925 ?auto_172927 ) ) ( not ( = ?auto_172925 ?auto_172928 ) ) ( not ( = ?auto_172925 ?auto_172929 ) ) ( not ( = ?auto_172926 ?auto_172927 ) ) ( not ( = ?auto_172926 ?auto_172928 ) ) ( not ( = ?auto_172926 ?auto_172929 ) ) ( not ( = ?auto_172927 ?auto_172928 ) ) ( not ( = ?auto_172927 ?auto_172929 ) ) ( not ( = ?auto_172928 ?auto_172929 ) ) ( ON-TABLE ?auto_172929 ) ( ON ?auto_172928 ?auto_172929 ) ( ON ?auto_172927 ?auto_172928 ) ( CLEAR ?auto_172927 ) ( HOLDING ?auto_172926 ) ( CLEAR ?auto_172925 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172922 ?auto_172923 ?auto_172924 ?auto_172925 ?auto_172926 )
      ( MAKE-8PILE ?auto_172922 ?auto_172923 ?auto_172924 ?auto_172925 ?auto_172926 ?auto_172927 ?auto_172928 ?auto_172929 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172930 - BLOCK
      ?auto_172931 - BLOCK
      ?auto_172932 - BLOCK
      ?auto_172933 - BLOCK
      ?auto_172934 - BLOCK
      ?auto_172935 - BLOCK
      ?auto_172936 - BLOCK
      ?auto_172937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172930 ) ( ON ?auto_172931 ?auto_172930 ) ( ON ?auto_172932 ?auto_172931 ) ( ON ?auto_172933 ?auto_172932 ) ( not ( = ?auto_172930 ?auto_172931 ) ) ( not ( = ?auto_172930 ?auto_172932 ) ) ( not ( = ?auto_172930 ?auto_172933 ) ) ( not ( = ?auto_172930 ?auto_172934 ) ) ( not ( = ?auto_172930 ?auto_172935 ) ) ( not ( = ?auto_172930 ?auto_172936 ) ) ( not ( = ?auto_172930 ?auto_172937 ) ) ( not ( = ?auto_172931 ?auto_172932 ) ) ( not ( = ?auto_172931 ?auto_172933 ) ) ( not ( = ?auto_172931 ?auto_172934 ) ) ( not ( = ?auto_172931 ?auto_172935 ) ) ( not ( = ?auto_172931 ?auto_172936 ) ) ( not ( = ?auto_172931 ?auto_172937 ) ) ( not ( = ?auto_172932 ?auto_172933 ) ) ( not ( = ?auto_172932 ?auto_172934 ) ) ( not ( = ?auto_172932 ?auto_172935 ) ) ( not ( = ?auto_172932 ?auto_172936 ) ) ( not ( = ?auto_172932 ?auto_172937 ) ) ( not ( = ?auto_172933 ?auto_172934 ) ) ( not ( = ?auto_172933 ?auto_172935 ) ) ( not ( = ?auto_172933 ?auto_172936 ) ) ( not ( = ?auto_172933 ?auto_172937 ) ) ( not ( = ?auto_172934 ?auto_172935 ) ) ( not ( = ?auto_172934 ?auto_172936 ) ) ( not ( = ?auto_172934 ?auto_172937 ) ) ( not ( = ?auto_172935 ?auto_172936 ) ) ( not ( = ?auto_172935 ?auto_172937 ) ) ( not ( = ?auto_172936 ?auto_172937 ) ) ( ON-TABLE ?auto_172937 ) ( ON ?auto_172936 ?auto_172937 ) ( ON ?auto_172935 ?auto_172936 ) ( CLEAR ?auto_172933 ) ( ON ?auto_172934 ?auto_172935 ) ( CLEAR ?auto_172934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172937 ?auto_172936 ?auto_172935 )
      ( MAKE-8PILE ?auto_172930 ?auto_172931 ?auto_172932 ?auto_172933 ?auto_172934 ?auto_172935 ?auto_172936 ?auto_172937 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172938 - BLOCK
      ?auto_172939 - BLOCK
      ?auto_172940 - BLOCK
      ?auto_172941 - BLOCK
      ?auto_172942 - BLOCK
      ?auto_172943 - BLOCK
      ?auto_172944 - BLOCK
      ?auto_172945 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172938 ) ( ON ?auto_172939 ?auto_172938 ) ( ON ?auto_172940 ?auto_172939 ) ( not ( = ?auto_172938 ?auto_172939 ) ) ( not ( = ?auto_172938 ?auto_172940 ) ) ( not ( = ?auto_172938 ?auto_172941 ) ) ( not ( = ?auto_172938 ?auto_172942 ) ) ( not ( = ?auto_172938 ?auto_172943 ) ) ( not ( = ?auto_172938 ?auto_172944 ) ) ( not ( = ?auto_172938 ?auto_172945 ) ) ( not ( = ?auto_172939 ?auto_172940 ) ) ( not ( = ?auto_172939 ?auto_172941 ) ) ( not ( = ?auto_172939 ?auto_172942 ) ) ( not ( = ?auto_172939 ?auto_172943 ) ) ( not ( = ?auto_172939 ?auto_172944 ) ) ( not ( = ?auto_172939 ?auto_172945 ) ) ( not ( = ?auto_172940 ?auto_172941 ) ) ( not ( = ?auto_172940 ?auto_172942 ) ) ( not ( = ?auto_172940 ?auto_172943 ) ) ( not ( = ?auto_172940 ?auto_172944 ) ) ( not ( = ?auto_172940 ?auto_172945 ) ) ( not ( = ?auto_172941 ?auto_172942 ) ) ( not ( = ?auto_172941 ?auto_172943 ) ) ( not ( = ?auto_172941 ?auto_172944 ) ) ( not ( = ?auto_172941 ?auto_172945 ) ) ( not ( = ?auto_172942 ?auto_172943 ) ) ( not ( = ?auto_172942 ?auto_172944 ) ) ( not ( = ?auto_172942 ?auto_172945 ) ) ( not ( = ?auto_172943 ?auto_172944 ) ) ( not ( = ?auto_172943 ?auto_172945 ) ) ( not ( = ?auto_172944 ?auto_172945 ) ) ( ON-TABLE ?auto_172945 ) ( ON ?auto_172944 ?auto_172945 ) ( ON ?auto_172943 ?auto_172944 ) ( ON ?auto_172942 ?auto_172943 ) ( CLEAR ?auto_172942 ) ( HOLDING ?auto_172941 ) ( CLEAR ?auto_172940 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172938 ?auto_172939 ?auto_172940 ?auto_172941 )
      ( MAKE-8PILE ?auto_172938 ?auto_172939 ?auto_172940 ?auto_172941 ?auto_172942 ?auto_172943 ?auto_172944 ?auto_172945 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172946 - BLOCK
      ?auto_172947 - BLOCK
      ?auto_172948 - BLOCK
      ?auto_172949 - BLOCK
      ?auto_172950 - BLOCK
      ?auto_172951 - BLOCK
      ?auto_172952 - BLOCK
      ?auto_172953 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172946 ) ( ON ?auto_172947 ?auto_172946 ) ( ON ?auto_172948 ?auto_172947 ) ( not ( = ?auto_172946 ?auto_172947 ) ) ( not ( = ?auto_172946 ?auto_172948 ) ) ( not ( = ?auto_172946 ?auto_172949 ) ) ( not ( = ?auto_172946 ?auto_172950 ) ) ( not ( = ?auto_172946 ?auto_172951 ) ) ( not ( = ?auto_172946 ?auto_172952 ) ) ( not ( = ?auto_172946 ?auto_172953 ) ) ( not ( = ?auto_172947 ?auto_172948 ) ) ( not ( = ?auto_172947 ?auto_172949 ) ) ( not ( = ?auto_172947 ?auto_172950 ) ) ( not ( = ?auto_172947 ?auto_172951 ) ) ( not ( = ?auto_172947 ?auto_172952 ) ) ( not ( = ?auto_172947 ?auto_172953 ) ) ( not ( = ?auto_172948 ?auto_172949 ) ) ( not ( = ?auto_172948 ?auto_172950 ) ) ( not ( = ?auto_172948 ?auto_172951 ) ) ( not ( = ?auto_172948 ?auto_172952 ) ) ( not ( = ?auto_172948 ?auto_172953 ) ) ( not ( = ?auto_172949 ?auto_172950 ) ) ( not ( = ?auto_172949 ?auto_172951 ) ) ( not ( = ?auto_172949 ?auto_172952 ) ) ( not ( = ?auto_172949 ?auto_172953 ) ) ( not ( = ?auto_172950 ?auto_172951 ) ) ( not ( = ?auto_172950 ?auto_172952 ) ) ( not ( = ?auto_172950 ?auto_172953 ) ) ( not ( = ?auto_172951 ?auto_172952 ) ) ( not ( = ?auto_172951 ?auto_172953 ) ) ( not ( = ?auto_172952 ?auto_172953 ) ) ( ON-TABLE ?auto_172953 ) ( ON ?auto_172952 ?auto_172953 ) ( ON ?auto_172951 ?auto_172952 ) ( ON ?auto_172950 ?auto_172951 ) ( CLEAR ?auto_172948 ) ( ON ?auto_172949 ?auto_172950 ) ( CLEAR ?auto_172949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_172953 ?auto_172952 ?auto_172951 ?auto_172950 )
      ( MAKE-8PILE ?auto_172946 ?auto_172947 ?auto_172948 ?auto_172949 ?auto_172950 ?auto_172951 ?auto_172952 ?auto_172953 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172954 - BLOCK
      ?auto_172955 - BLOCK
      ?auto_172956 - BLOCK
      ?auto_172957 - BLOCK
      ?auto_172958 - BLOCK
      ?auto_172959 - BLOCK
      ?auto_172960 - BLOCK
      ?auto_172961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172954 ) ( ON ?auto_172955 ?auto_172954 ) ( not ( = ?auto_172954 ?auto_172955 ) ) ( not ( = ?auto_172954 ?auto_172956 ) ) ( not ( = ?auto_172954 ?auto_172957 ) ) ( not ( = ?auto_172954 ?auto_172958 ) ) ( not ( = ?auto_172954 ?auto_172959 ) ) ( not ( = ?auto_172954 ?auto_172960 ) ) ( not ( = ?auto_172954 ?auto_172961 ) ) ( not ( = ?auto_172955 ?auto_172956 ) ) ( not ( = ?auto_172955 ?auto_172957 ) ) ( not ( = ?auto_172955 ?auto_172958 ) ) ( not ( = ?auto_172955 ?auto_172959 ) ) ( not ( = ?auto_172955 ?auto_172960 ) ) ( not ( = ?auto_172955 ?auto_172961 ) ) ( not ( = ?auto_172956 ?auto_172957 ) ) ( not ( = ?auto_172956 ?auto_172958 ) ) ( not ( = ?auto_172956 ?auto_172959 ) ) ( not ( = ?auto_172956 ?auto_172960 ) ) ( not ( = ?auto_172956 ?auto_172961 ) ) ( not ( = ?auto_172957 ?auto_172958 ) ) ( not ( = ?auto_172957 ?auto_172959 ) ) ( not ( = ?auto_172957 ?auto_172960 ) ) ( not ( = ?auto_172957 ?auto_172961 ) ) ( not ( = ?auto_172958 ?auto_172959 ) ) ( not ( = ?auto_172958 ?auto_172960 ) ) ( not ( = ?auto_172958 ?auto_172961 ) ) ( not ( = ?auto_172959 ?auto_172960 ) ) ( not ( = ?auto_172959 ?auto_172961 ) ) ( not ( = ?auto_172960 ?auto_172961 ) ) ( ON-TABLE ?auto_172961 ) ( ON ?auto_172960 ?auto_172961 ) ( ON ?auto_172959 ?auto_172960 ) ( ON ?auto_172958 ?auto_172959 ) ( ON ?auto_172957 ?auto_172958 ) ( CLEAR ?auto_172957 ) ( HOLDING ?auto_172956 ) ( CLEAR ?auto_172955 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_172954 ?auto_172955 ?auto_172956 )
      ( MAKE-8PILE ?auto_172954 ?auto_172955 ?auto_172956 ?auto_172957 ?auto_172958 ?auto_172959 ?auto_172960 ?auto_172961 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172962 - BLOCK
      ?auto_172963 - BLOCK
      ?auto_172964 - BLOCK
      ?auto_172965 - BLOCK
      ?auto_172966 - BLOCK
      ?auto_172967 - BLOCK
      ?auto_172968 - BLOCK
      ?auto_172969 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172962 ) ( ON ?auto_172963 ?auto_172962 ) ( not ( = ?auto_172962 ?auto_172963 ) ) ( not ( = ?auto_172962 ?auto_172964 ) ) ( not ( = ?auto_172962 ?auto_172965 ) ) ( not ( = ?auto_172962 ?auto_172966 ) ) ( not ( = ?auto_172962 ?auto_172967 ) ) ( not ( = ?auto_172962 ?auto_172968 ) ) ( not ( = ?auto_172962 ?auto_172969 ) ) ( not ( = ?auto_172963 ?auto_172964 ) ) ( not ( = ?auto_172963 ?auto_172965 ) ) ( not ( = ?auto_172963 ?auto_172966 ) ) ( not ( = ?auto_172963 ?auto_172967 ) ) ( not ( = ?auto_172963 ?auto_172968 ) ) ( not ( = ?auto_172963 ?auto_172969 ) ) ( not ( = ?auto_172964 ?auto_172965 ) ) ( not ( = ?auto_172964 ?auto_172966 ) ) ( not ( = ?auto_172964 ?auto_172967 ) ) ( not ( = ?auto_172964 ?auto_172968 ) ) ( not ( = ?auto_172964 ?auto_172969 ) ) ( not ( = ?auto_172965 ?auto_172966 ) ) ( not ( = ?auto_172965 ?auto_172967 ) ) ( not ( = ?auto_172965 ?auto_172968 ) ) ( not ( = ?auto_172965 ?auto_172969 ) ) ( not ( = ?auto_172966 ?auto_172967 ) ) ( not ( = ?auto_172966 ?auto_172968 ) ) ( not ( = ?auto_172966 ?auto_172969 ) ) ( not ( = ?auto_172967 ?auto_172968 ) ) ( not ( = ?auto_172967 ?auto_172969 ) ) ( not ( = ?auto_172968 ?auto_172969 ) ) ( ON-TABLE ?auto_172969 ) ( ON ?auto_172968 ?auto_172969 ) ( ON ?auto_172967 ?auto_172968 ) ( ON ?auto_172966 ?auto_172967 ) ( ON ?auto_172965 ?auto_172966 ) ( CLEAR ?auto_172963 ) ( ON ?auto_172964 ?auto_172965 ) ( CLEAR ?auto_172964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_172969 ?auto_172968 ?auto_172967 ?auto_172966 ?auto_172965 )
      ( MAKE-8PILE ?auto_172962 ?auto_172963 ?auto_172964 ?auto_172965 ?auto_172966 ?auto_172967 ?auto_172968 ?auto_172969 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172970 - BLOCK
      ?auto_172971 - BLOCK
      ?auto_172972 - BLOCK
      ?auto_172973 - BLOCK
      ?auto_172974 - BLOCK
      ?auto_172975 - BLOCK
      ?auto_172976 - BLOCK
      ?auto_172977 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172970 ) ( not ( = ?auto_172970 ?auto_172971 ) ) ( not ( = ?auto_172970 ?auto_172972 ) ) ( not ( = ?auto_172970 ?auto_172973 ) ) ( not ( = ?auto_172970 ?auto_172974 ) ) ( not ( = ?auto_172970 ?auto_172975 ) ) ( not ( = ?auto_172970 ?auto_172976 ) ) ( not ( = ?auto_172970 ?auto_172977 ) ) ( not ( = ?auto_172971 ?auto_172972 ) ) ( not ( = ?auto_172971 ?auto_172973 ) ) ( not ( = ?auto_172971 ?auto_172974 ) ) ( not ( = ?auto_172971 ?auto_172975 ) ) ( not ( = ?auto_172971 ?auto_172976 ) ) ( not ( = ?auto_172971 ?auto_172977 ) ) ( not ( = ?auto_172972 ?auto_172973 ) ) ( not ( = ?auto_172972 ?auto_172974 ) ) ( not ( = ?auto_172972 ?auto_172975 ) ) ( not ( = ?auto_172972 ?auto_172976 ) ) ( not ( = ?auto_172972 ?auto_172977 ) ) ( not ( = ?auto_172973 ?auto_172974 ) ) ( not ( = ?auto_172973 ?auto_172975 ) ) ( not ( = ?auto_172973 ?auto_172976 ) ) ( not ( = ?auto_172973 ?auto_172977 ) ) ( not ( = ?auto_172974 ?auto_172975 ) ) ( not ( = ?auto_172974 ?auto_172976 ) ) ( not ( = ?auto_172974 ?auto_172977 ) ) ( not ( = ?auto_172975 ?auto_172976 ) ) ( not ( = ?auto_172975 ?auto_172977 ) ) ( not ( = ?auto_172976 ?auto_172977 ) ) ( ON-TABLE ?auto_172977 ) ( ON ?auto_172976 ?auto_172977 ) ( ON ?auto_172975 ?auto_172976 ) ( ON ?auto_172974 ?auto_172975 ) ( ON ?auto_172973 ?auto_172974 ) ( ON ?auto_172972 ?auto_172973 ) ( CLEAR ?auto_172972 ) ( HOLDING ?auto_172971 ) ( CLEAR ?auto_172970 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_172970 ?auto_172971 )
      ( MAKE-8PILE ?auto_172970 ?auto_172971 ?auto_172972 ?auto_172973 ?auto_172974 ?auto_172975 ?auto_172976 ?auto_172977 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172978 - BLOCK
      ?auto_172979 - BLOCK
      ?auto_172980 - BLOCK
      ?auto_172981 - BLOCK
      ?auto_172982 - BLOCK
      ?auto_172983 - BLOCK
      ?auto_172984 - BLOCK
      ?auto_172985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_172978 ) ( not ( = ?auto_172978 ?auto_172979 ) ) ( not ( = ?auto_172978 ?auto_172980 ) ) ( not ( = ?auto_172978 ?auto_172981 ) ) ( not ( = ?auto_172978 ?auto_172982 ) ) ( not ( = ?auto_172978 ?auto_172983 ) ) ( not ( = ?auto_172978 ?auto_172984 ) ) ( not ( = ?auto_172978 ?auto_172985 ) ) ( not ( = ?auto_172979 ?auto_172980 ) ) ( not ( = ?auto_172979 ?auto_172981 ) ) ( not ( = ?auto_172979 ?auto_172982 ) ) ( not ( = ?auto_172979 ?auto_172983 ) ) ( not ( = ?auto_172979 ?auto_172984 ) ) ( not ( = ?auto_172979 ?auto_172985 ) ) ( not ( = ?auto_172980 ?auto_172981 ) ) ( not ( = ?auto_172980 ?auto_172982 ) ) ( not ( = ?auto_172980 ?auto_172983 ) ) ( not ( = ?auto_172980 ?auto_172984 ) ) ( not ( = ?auto_172980 ?auto_172985 ) ) ( not ( = ?auto_172981 ?auto_172982 ) ) ( not ( = ?auto_172981 ?auto_172983 ) ) ( not ( = ?auto_172981 ?auto_172984 ) ) ( not ( = ?auto_172981 ?auto_172985 ) ) ( not ( = ?auto_172982 ?auto_172983 ) ) ( not ( = ?auto_172982 ?auto_172984 ) ) ( not ( = ?auto_172982 ?auto_172985 ) ) ( not ( = ?auto_172983 ?auto_172984 ) ) ( not ( = ?auto_172983 ?auto_172985 ) ) ( not ( = ?auto_172984 ?auto_172985 ) ) ( ON-TABLE ?auto_172985 ) ( ON ?auto_172984 ?auto_172985 ) ( ON ?auto_172983 ?auto_172984 ) ( ON ?auto_172982 ?auto_172983 ) ( ON ?auto_172981 ?auto_172982 ) ( ON ?auto_172980 ?auto_172981 ) ( CLEAR ?auto_172978 ) ( ON ?auto_172979 ?auto_172980 ) ( CLEAR ?auto_172979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_172985 ?auto_172984 ?auto_172983 ?auto_172982 ?auto_172981 ?auto_172980 )
      ( MAKE-8PILE ?auto_172978 ?auto_172979 ?auto_172980 ?auto_172981 ?auto_172982 ?auto_172983 ?auto_172984 ?auto_172985 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172986 - BLOCK
      ?auto_172987 - BLOCK
      ?auto_172988 - BLOCK
      ?auto_172989 - BLOCK
      ?auto_172990 - BLOCK
      ?auto_172991 - BLOCK
      ?auto_172992 - BLOCK
      ?auto_172993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172986 ?auto_172987 ) ) ( not ( = ?auto_172986 ?auto_172988 ) ) ( not ( = ?auto_172986 ?auto_172989 ) ) ( not ( = ?auto_172986 ?auto_172990 ) ) ( not ( = ?auto_172986 ?auto_172991 ) ) ( not ( = ?auto_172986 ?auto_172992 ) ) ( not ( = ?auto_172986 ?auto_172993 ) ) ( not ( = ?auto_172987 ?auto_172988 ) ) ( not ( = ?auto_172987 ?auto_172989 ) ) ( not ( = ?auto_172987 ?auto_172990 ) ) ( not ( = ?auto_172987 ?auto_172991 ) ) ( not ( = ?auto_172987 ?auto_172992 ) ) ( not ( = ?auto_172987 ?auto_172993 ) ) ( not ( = ?auto_172988 ?auto_172989 ) ) ( not ( = ?auto_172988 ?auto_172990 ) ) ( not ( = ?auto_172988 ?auto_172991 ) ) ( not ( = ?auto_172988 ?auto_172992 ) ) ( not ( = ?auto_172988 ?auto_172993 ) ) ( not ( = ?auto_172989 ?auto_172990 ) ) ( not ( = ?auto_172989 ?auto_172991 ) ) ( not ( = ?auto_172989 ?auto_172992 ) ) ( not ( = ?auto_172989 ?auto_172993 ) ) ( not ( = ?auto_172990 ?auto_172991 ) ) ( not ( = ?auto_172990 ?auto_172992 ) ) ( not ( = ?auto_172990 ?auto_172993 ) ) ( not ( = ?auto_172991 ?auto_172992 ) ) ( not ( = ?auto_172991 ?auto_172993 ) ) ( not ( = ?auto_172992 ?auto_172993 ) ) ( ON-TABLE ?auto_172993 ) ( ON ?auto_172992 ?auto_172993 ) ( ON ?auto_172991 ?auto_172992 ) ( ON ?auto_172990 ?auto_172991 ) ( ON ?auto_172989 ?auto_172990 ) ( ON ?auto_172988 ?auto_172989 ) ( ON ?auto_172987 ?auto_172988 ) ( CLEAR ?auto_172987 ) ( HOLDING ?auto_172986 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_172986 )
      ( MAKE-8PILE ?auto_172986 ?auto_172987 ?auto_172988 ?auto_172989 ?auto_172990 ?auto_172991 ?auto_172992 ?auto_172993 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_172994 - BLOCK
      ?auto_172995 - BLOCK
      ?auto_172996 - BLOCK
      ?auto_172997 - BLOCK
      ?auto_172998 - BLOCK
      ?auto_172999 - BLOCK
      ?auto_173000 - BLOCK
      ?auto_173001 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_172994 ?auto_172995 ) ) ( not ( = ?auto_172994 ?auto_172996 ) ) ( not ( = ?auto_172994 ?auto_172997 ) ) ( not ( = ?auto_172994 ?auto_172998 ) ) ( not ( = ?auto_172994 ?auto_172999 ) ) ( not ( = ?auto_172994 ?auto_173000 ) ) ( not ( = ?auto_172994 ?auto_173001 ) ) ( not ( = ?auto_172995 ?auto_172996 ) ) ( not ( = ?auto_172995 ?auto_172997 ) ) ( not ( = ?auto_172995 ?auto_172998 ) ) ( not ( = ?auto_172995 ?auto_172999 ) ) ( not ( = ?auto_172995 ?auto_173000 ) ) ( not ( = ?auto_172995 ?auto_173001 ) ) ( not ( = ?auto_172996 ?auto_172997 ) ) ( not ( = ?auto_172996 ?auto_172998 ) ) ( not ( = ?auto_172996 ?auto_172999 ) ) ( not ( = ?auto_172996 ?auto_173000 ) ) ( not ( = ?auto_172996 ?auto_173001 ) ) ( not ( = ?auto_172997 ?auto_172998 ) ) ( not ( = ?auto_172997 ?auto_172999 ) ) ( not ( = ?auto_172997 ?auto_173000 ) ) ( not ( = ?auto_172997 ?auto_173001 ) ) ( not ( = ?auto_172998 ?auto_172999 ) ) ( not ( = ?auto_172998 ?auto_173000 ) ) ( not ( = ?auto_172998 ?auto_173001 ) ) ( not ( = ?auto_172999 ?auto_173000 ) ) ( not ( = ?auto_172999 ?auto_173001 ) ) ( not ( = ?auto_173000 ?auto_173001 ) ) ( ON-TABLE ?auto_173001 ) ( ON ?auto_173000 ?auto_173001 ) ( ON ?auto_172999 ?auto_173000 ) ( ON ?auto_172998 ?auto_172999 ) ( ON ?auto_172997 ?auto_172998 ) ( ON ?auto_172996 ?auto_172997 ) ( ON ?auto_172995 ?auto_172996 ) ( ON ?auto_172994 ?auto_172995 ) ( CLEAR ?auto_172994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173001 ?auto_173000 ?auto_172999 ?auto_172998 ?auto_172997 ?auto_172996 ?auto_172995 )
      ( MAKE-8PILE ?auto_172994 ?auto_172995 ?auto_172996 ?auto_172997 ?auto_172998 ?auto_172999 ?auto_173000 ?auto_173001 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173010 - BLOCK
      ?auto_173011 - BLOCK
      ?auto_173012 - BLOCK
      ?auto_173013 - BLOCK
      ?auto_173014 - BLOCK
      ?auto_173015 - BLOCK
      ?auto_173016 - BLOCK
      ?auto_173017 - BLOCK
    )
    :vars
    (
      ?auto_173018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173010 ?auto_173011 ) ) ( not ( = ?auto_173010 ?auto_173012 ) ) ( not ( = ?auto_173010 ?auto_173013 ) ) ( not ( = ?auto_173010 ?auto_173014 ) ) ( not ( = ?auto_173010 ?auto_173015 ) ) ( not ( = ?auto_173010 ?auto_173016 ) ) ( not ( = ?auto_173010 ?auto_173017 ) ) ( not ( = ?auto_173011 ?auto_173012 ) ) ( not ( = ?auto_173011 ?auto_173013 ) ) ( not ( = ?auto_173011 ?auto_173014 ) ) ( not ( = ?auto_173011 ?auto_173015 ) ) ( not ( = ?auto_173011 ?auto_173016 ) ) ( not ( = ?auto_173011 ?auto_173017 ) ) ( not ( = ?auto_173012 ?auto_173013 ) ) ( not ( = ?auto_173012 ?auto_173014 ) ) ( not ( = ?auto_173012 ?auto_173015 ) ) ( not ( = ?auto_173012 ?auto_173016 ) ) ( not ( = ?auto_173012 ?auto_173017 ) ) ( not ( = ?auto_173013 ?auto_173014 ) ) ( not ( = ?auto_173013 ?auto_173015 ) ) ( not ( = ?auto_173013 ?auto_173016 ) ) ( not ( = ?auto_173013 ?auto_173017 ) ) ( not ( = ?auto_173014 ?auto_173015 ) ) ( not ( = ?auto_173014 ?auto_173016 ) ) ( not ( = ?auto_173014 ?auto_173017 ) ) ( not ( = ?auto_173015 ?auto_173016 ) ) ( not ( = ?auto_173015 ?auto_173017 ) ) ( not ( = ?auto_173016 ?auto_173017 ) ) ( ON-TABLE ?auto_173017 ) ( ON ?auto_173016 ?auto_173017 ) ( ON ?auto_173015 ?auto_173016 ) ( ON ?auto_173014 ?auto_173015 ) ( ON ?auto_173013 ?auto_173014 ) ( ON ?auto_173012 ?auto_173013 ) ( ON ?auto_173011 ?auto_173012 ) ( CLEAR ?auto_173011 ) ( ON ?auto_173010 ?auto_173018 ) ( CLEAR ?auto_173010 ) ( HAND-EMPTY ) ( not ( = ?auto_173010 ?auto_173018 ) ) ( not ( = ?auto_173011 ?auto_173018 ) ) ( not ( = ?auto_173012 ?auto_173018 ) ) ( not ( = ?auto_173013 ?auto_173018 ) ) ( not ( = ?auto_173014 ?auto_173018 ) ) ( not ( = ?auto_173015 ?auto_173018 ) ) ( not ( = ?auto_173016 ?auto_173018 ) ) ( not ( = ?auto_173017 ?auto_173018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173010 ?auto_173018 )
      ( MAKE-8PILE ?auto_173010 ?auto_173011 ?auto_173012 ?auto_173013 ?auto_173014 ?auto_173015 ?auto_173016 ?auto_173017 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173019 - BLOCK
      ?auto_173020 - BLOCK
      ?auto_173021 - BLOCK
      ?auto_173022 - BLOCK
      ?auto_173023 - BLOCK
      ?auto_173024 - BLOCK
      ?auto_173025 - BLOCK
      ?auto_173026 - BLOCK
    )
    :vars
    (
      ?auto_173027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173019 ?auto_173020 ) ) ( not ( = ?auto_173019 ?auto_173021 ) ) ( not ( = ?auto_173019 ?auto_173022 ) ) ( not ( = ?auto_173019 ?auto_173023 ) ) ( not ( = ?auto_173019 ?auto_173024 ) ) ( not ( = ?auto_173019 ?auto_173025 ) ) ( not ( = ?auto_173019 ?auto_173026 ) ) ( not ( = ?auto_173020 ?auto_173021 ) ) ( not ( = ?auto_173020 ?auto_173022 ) ) ( not ( = ?auto_173020 ?auto_173023 ) ) ( not ( = ?auto_173020 ?auto_173024 ) ) ( not ( = ?auto_173020 ?auto_173025 ) ) ( not ( = ?auto_173020 ?auto_173026 ) ) ( not ( = ?auto_173021 ?auto_173022 ) ) ( not ( = ?auto_173021 ?auto_173023 ) ) ( not ( = ?auto_173021 ?auto_173024 ) ) ( not ( = ?auto_173021 ?auto_173025 ) ) ( not ( = ?auto_173021 ?auto_173026 ) ) ( not ( = ?auto_173022 ?auto_173023 ) ) ( not ( = ?auto_173022 ?auto_173024 ) ) ( not ( = ?auto_173022 ?auto_173025 ) ) ( not ( = ?auto_173022 ?auto_173026 ) ) ( not ( = ?auto_173023 ?auto_173024 ) ) ( not ( = ?auto_173023 ?auto_173025 ) ) ( not ( = ?auto_173023 ?auto_173026 ) ) ( not ( = ?auto_173024 ?auto_173025 ) ) ( not ( = ?auto_173024 ?auto_173026 ) ) ( not ( = ?auto_173025 ?auto_173026 ) ) ( ON-TABLE ?auto_173026 ) ( ON ?auto_173025 ?auto_173026 ) ( ON ?auto_173024 ?auto_173025 ) ( ON ?auto_173023 ?auto_173024 ) ( ON ?auto_173022 ?auto_173023 ) ( ON ?auto_173021 ?auto_173022 ) ( ON ?auto_173019 ?auto_173027 ) ( CLEAR ?auto_173019 ) ( not ( = ?auto_173019 ?auto_173027 ) ) ( not ( = ?auto_173020 ?auto_173027 ) ) ( not ( = ?auto_173021 ?auto_173027 ) ) ( not ( = ?auto_173022 ?auto_173027 ) ) ( not ( = ?auto_173023 ?auto_173027 ) ) ( not ( = ?auto_173024 ?auto_173027 ) ) ( not ( = ?auto_173025 ?auto_173027 ) ) ( not ( = ?auto_173026 ?auto_173027 ) ) ( HOLDING ?auto_173020 ) ( CLEAR ?auto_173021 ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173026 ?auto_173025 ?auto_173024 ?auto_173023 ?auto_173022 ?auto_173021 ?auto_173020 )
      ( MAKE-8PILE ?auto_173019 ?auto_173020 ?auto_173021 ?auto_173022 ?auto_173023 ?auto_173024 ?auto_173025 ?auto_173026 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173028 - BLOCK
      ?auto_173029 - BLOCK
      ?auto_173030 - BLOCK
      ?auto_173031 - BLOCK
      ?auto_173032 - BLOCK
      ?auto_173033 - BLOCK
      ?auto_173034 - BLOCK
      ?auto_173035 - BLOCK
    )
    :vars
    (
      ?auto_173036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173028 ?auto_173029 ) ) ( not ( = ?auto_173028 ?auto_173030 ) ) ( not ( = ?auto_173028 ?auto_173031 ) ) ( not ( = ?auto_173028 ?auto_173032 ) ) ( not ( = ?auto_173028 ?auto_173033 ) ) ( not ( = ?auto_173028 ?auto_173034 ) ) ( not ( = ?auto_173028 ?auto_173035 ) ) ( not ( = ?auto_173029 ?auto_173030 ) ) ( not ( = ?auto_173029 ?auto_173031 ) ) ( not ( = ?auto_173029 ?auto_173032 ) ) ( not ( = ?auto_173029 ?auto_173033 ) ) ( not ( = ?auto_173029 ?auto_173034 ) ) ( not ( = ?auto_173029 ?auto_173035 ) ) ( not ( = ?auto_173030 ?auto_173031 ) ) ( not ( = ?auto_173030 ?auto_173032 ) ) ( not ( = ?auto_173030 ?auto_173033 ) ) ( not ( = ?auto_173030 ?auto_173034 ) ) ( not ( = ?auto_173030 ?auto_173035 ) ) ( not ( = ?auto_173031 ?auto_173032 ) ) ( not ( = ?auto_173031 ?auto_173033 ) ) ( not ( = ?auto_173031 ?auto_173034 ) ) ( not ( = ?auto_173031 ?auto_173035 ) ) ( not ( = ?auto_173032 ?auto_173033 ) ) ( not ( = ?auto_173032 ?auto_173034 ) ) ( not ( = ?auto_173032 ?auto_173035 ) ) ( not ( = ?auto_173033 ?auto_173034 ) ) ( not ( = ?auto_173033 ?auto_173035 ) ) ( not ( = ?auto_173034 ?auto_173035 ) ) ( ON-TABLE ?auto_173035 ) ( ON ?auto_173034 ?auto_173035 ) ( ON ?auto_173033 ?auto_173034 ) ( ON ?auto_173032 ?auto_173033 ) ( ON ?auto_173031 ?auto_173032 ) ( ON ?auto_173030 ?auto_173031 ) ( ON ?auto_173028 ?auto_173036 ) ( not ( = ?auto_173028 ?auto_173036 ) ) ( not ( = ?auto_173029 ?auto_173036 ) ) ( not ( = ?auto_173030 ?auto_173036 ) ) ( not ( = ?auto_173031 ?auto_173036 ) ) ( not ( = ?auto_173032 ?auto_173036 ) ) ( not ( = ?auto_173033 ?auto_173036 ) ) ( not ( = ?auto_173034 ?auto_173036 ) ) ( not ( = ?auto_173035 ?auto_173036 ) ) ( CLEAR ?auto_173030 ) ( ON ?auto_173029 ?auto_173028 ) ( CLEAR ?auto_173029 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_173036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173036 ?auto_173028 )
      ( MAKE-8PILE ?auto_173028 ?auto_173029 ?auto_173030 ?auto_173031 ?auto_173032 ?auto_173033 ?auto_173034 ?auto_173035 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173037 - BLOCK
      ?auto_173038 - BLOCK
      ?auto_173039 - BLOCK
      ?auto_173040 - BLOCK
      ?auto_173041 - BLOCK
      ?auto_173042 - BLOCK
      ?auto_173043 - BLOCK
      ?auto_173044 - BLOCK
    )
    :vars
    (
      ?auto_173045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173037 ?auto_173038 ) ) ( not ( = ?auto_173037 ?auto_173039 ) ) ( not ( = ?auto_173037 ?auto_173040 ) ) ( not ( = ?auto_173037 ?auto_173041 ) ) ( not ( = ?auto_173037 ?auto_173042 ) ) ( not ( = ?auto_173037 ?auto_173043 ) ) ( not ( = ?auto_173037 ?auto_173044 ) ) ( not ( = ?auto_173038 ?auto_173039 ) ) ( not ( = ?auto_173038 ?auto_173040 ) ) ( not ( = ?auto_173038 ?auto_173041 ) ) ( not ( = ?auto_173038 ?auto_173042 ) ) ( not ( = ?auto_173038 ?auto_173043 ) ) ( not ( = ?auto_173038 ?auto_173044 ) ) ( not ( = ?auto_173039 ?auto_173040 ) ) ( not ( = ?auto_173039 ?auto_173041 ) ) ( not ( = ?auto_173039 ?auto_173042 ) ) ( not ( = ?auto_173039 ?auto_173043 ) ) ( not ( = ?auto_173039 ?auto_173044 ) ) ( not ( = ?auto_173040 ?auto_173041 ) ) ( not ( = ?auto_173040 ?auto_173042 ) ) ( not ( = ?auto_173040 ?auto_173043 ) ) ( not ( = ?auto_173040 ?auto_173044 ) ) ( not ( = ?auto_173041 ?auto_173042 ) ) ( not ( = ?auto_173041 ?auto_173043 ) ) ( not ( = ?auto_173041 ?auto_173044 ) ) ( not ( = ?auto_173042 ?auto_173043 ) ) ( not ( = ?auto_173042 ?auto_173044 ) ) ( not ( = ?auto_173043 ?auto_173044 ) ) ( ON-TABLE ?auto_173044 ) ( ON ?auto_173043 ?auto_173044 ) ( ON ?auto_173042 ?auto_173043 ) ( ON ?auto_173041 ?auto_173042 ) ( ON ?auto_173040 ?auto_173041 ) ( ON ?auto_173037 ?auto_173045 ) ( not ( = ?auto_173037 ?auto_173045 ) ) ( not ( = ?auto_173038 ?auto_173045 ) ) ( not ( = ?auto_173039 ?auto_173045 ) ) ( not ( = ?auto_173040 ?auto_173045 ) ) ( not ( = ?auto_173041 ?auto_173045 ) ) ( not ( = ?auto_173042 ?auto_173045 ) ) ( not ( = ?auto_173043 ?auto_173045 ) ) ( not ( = ?auto_173044 ?auto_173045 ) ) ( ON ?auto_173038 ?auto_173037 ) ( CLEAR ?auto_173038 ) ( ON-TABLE ?auto_173045 ) ( HOLDING ?auto_173039 ) ( CLEAR ?auto_173040 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173044 ?auto_173043 ?auto_173042 ?auto_173041 ?auto_173040 ?auto_173039 )
      ( MAKE-8PILE ?auto_173037 ?auto_173038 ?auto_173039 ?auto_173040 ?auto_173041 ?auto_173042 ?auto_173043 ?auto_173044 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173046 - BLOCK
      ?auto_173047 - BLOCK
      ?auto_173048 - BLOCK
      ?auto_173049 - BLOCK
      ?auto_173050 - BLOCK
      ?auto_173051 - BLOCK
      ?auto_173052 - BLOCK
      ?auto_173053 - BLOCK
    )
    :vars
    (
      ?auto_173054 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173046 ?auto_173047 ) ) ( not ( = ?auto_173046 ?auto_173048 ) ) ( not ( = ?auto_173046 ?auto_173049 ) ) ( not ( = ?auto_173046 ?auto_173050 ) ) ( not ( = ?auto_173046 ?auto_173051 ) ) ( not ( = ?auto_173046 ?auto_173052 ) ) ( not ( = ?auto_173046 ?auto_173053 ) ) ( not ( = ?auto_173047 ?auto_173048 ) ) ( not ( = ?auto_173047 ?auto_173049 ) ) ( not ( = ?auto_173047 ?auto_173050 ) ) ( not ( = ?auto_173047 ?auto_173051 ) ) ( not ( = ?auto_173047 ?auto_173052 ) ) ( not ( = ?auto_173047 ?auto_173053 ) ) ( not ( = ?auto_173048 ?auto_173049 ) ) ( not ( = ?auto_173048 ?auto_173050 ) ) ( not ( = ?auto_173048 ?auto_173051 ) ) ( not ( = ?auto_173048 ?auto_173052 ) ) ( not ( = ?auto_173048 ?auto_173053 ) ) ( not ( = ?auto_173049 ?auto_173050 ) ) ( not ( = ?auto_173049 ?auto_173051 ) ) ( not ( = ?auto_173049 ?auto_173052 ) ) ( not ( = ?auto_173049 ?auto_173053 ) ) ( not ( = ?auto_173050 ?auto_173051 ) ) ( not ( = ?auto_173050 ?auto_173052 ) ) ( not ( = ?auto_173050 ?auto_173053 ) ) ( not ( = ?auto_173051 ?auto_173052 ) ) ( not ( = ?auto_173051 ?auto_173053 ) ) ( not ( = ?auto_173052 ?auto_173053 ) ) ( ON-TABLE ?auto_173053 ) ( ON ?auto_173052 ?auto_173053 ) ( ON ?auto_173051 ?auto_173052 ) ( ON ?auto_173050 ?auto_173051 ) ( ON ?auto_173049 ?auto_173050 ) ( ON ?auto_173046 ?auto_173054 ) ( not ( = ?auto_173046 ?auto_173054 ) ) ( not ( = ?auto_173047 ?auto_173054 ) ) ( not ( = ?auto_173048 ?auto_173054 ) ) ( not ( = ?auto_173049 ?auto_173054 ) ) ( not ( = ?auto_173050 ?auto_173054 ) ) ( not ( = ?auto_173051 ?auto_173054 ) ) ( not ( = ?auto_173052 ?auto_173054 ) ) ( not ( = ?auto_173053 ?auto_173054 ) ) ( ON ?auto_173047 ?auto_173046 ) ( ON-TABLE ?auto_173054 ) ( CLEAR ?auto_173049 ) ( ON ?auto_173048 ?auto_173047 ) ( CLEAR ?auto_173048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173054 ?auto_173046 ?auto_173047 )
      ( MAKE-8PILE ?auto_173046 ?auto_173047 ?auto_173048 ?auto_173049 ?auto_173050 ?auto_173051 ?auto_173052 ?auto_173053 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173055 - BLOCK
      ?auto_173056 - BLOCK
      ?auto_173057 - BLOCK
      ?auto_173058 - BLOCK
      ?auto_173059 - BLOCK
      ?auto_173060 - BLOCK
      ?auto_173061 - BLOCK
      ?auto_173062 - BLOCK
    )
    :vars
    (
      ?auto_173063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173055 ?auto_173056 ) ) ( not ( = ?auto_173055 ?auto_173057 ) ) ( not ( = ?auto_173055 ?auto_173058 ) ) ( not ( = ?auto_173055 ?auto_173059 ) ) ( not ( = ?auto_173055 ?auto_173060 ) ) ( not ( = ?auto_173055 ?auto_173061 ) ) ( not ( = ?auto_173055 ?auto_173062 ) ) ( not ( = ?auto_173056 ?auto_173057 ) ) ( not ( = ?auto_173056 ?auto_173058 ) ) ( not ( = ?auto_173056 ?auto_173059 ) ) ( not ( = ?auto_173056 ?auto_173060 ) ) ( not ( = ?auto_173056 ?auto_173061 ) ) ( not ( = ?auto_173056 ?auto_173062 ) ) ( not ( = ?auto_173057 ?auto_173058 ) ) ( not ( = ?auto_173057 ?auto_173059 ) ) ( not ( = ?auto_173057 ?auto_173060 ) ) ( not ( = ?auto_173057 ?auto_173061 ) ) ( not ( = ?auto_173057 ?auto_173062 ) ) ( not ( = ?auto_173058 ?auto_173059 ) ) ( not ( = ?auto_173058 ?auto_173060 ) ) ( not ( = ?auto_173058 ?auto_173061 ) ) ( not ( = ?auto_173058 ?auto_173062 ) ) ( not ( = ?auto_173059 ?auto_173060 ) ) ( not ( = ?auto_173059 ?auto_173061 ) ) ( not ( = ?auto_173059 ?auto_173062 ) ) ( not ( = ?auto_173060 ?auto_173061 ) ) ( not ( = ?auto_173060 ?auto_173062 ) ) ( not ( = ?auto_173061 ?auto_173062 ) ) ( ON-TABLE ?auto_173062 ) ( ON ?auto_173061 ?auto_173062 ) ( ON ?auto_173060 ?auto_173061 ) ( ON ?auto_173059 ?auto_173060 ) ( ON ?auto_173055 ?auto_173063 ) ( not ( = ?auto_173055 ?auto_173063 ) ) ( not ( = ?auto_173056 ?auto_173063 ) ) ( not ( = ?auto_173057 ?auto_173063 ) ) ( not ( = ?auto_173058 ?auto_173063 ) ) ( not ( = ?auto_173059 ?auto_173063 ) ) ( not ( = ?auto_173060 ?auto_173063 ) ) ( not ( = ?auto_173061 ?auto_173063 ) ) ( not ( = ?auto_173062 ?auto_173063 ) ) ( ON ?auto_173056 ?auto_173055 ) ( ON-TABLE ?auto_173063 ) ( ON ?auto_173057 ?auto_173056 ) ( CLEAR ?auto_173057 ) ( HOLDING ?auto_173058 ) ( CLEAR ?auto_173059 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173062 ?auto_173061 ?auto_173060 ?auto_173059 ?auto_173058 )
      ( MAKE-8PILE ?auto_173055 ?auto_173056 ?auto_173057 ?auto_173058 ?auto_173059 ?auto_173060 ?auto_173061 ?auto_173062 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173064 - BLOCK
      ?auto_173065 - BLOCK
      ?auto_173066 - BLOCK
      ?auto_173067 - BLOCK
      ?auto_173068 - BLOCK
      ?auto_173069 - BLOCK
      ?auto_173070 - BLOCK
      ?auto_173071 - BLOCK
    )
    :vars
    (
      ?auto_173072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173064 ?auto_173065 ) ) ( not ( = ?auto_173064 ?auto_173066 ) ) ( not ( = ?auto_173064 ?auto_173067 ) ) ( not ( = ?auto_173064 ?auto_173068 ) ) ( not ( = ?auto_173064 ?auto_173069 ) ) ( not ( = ?auto_173064 ?auto_173070 ) ) ( not ( = ?auto_173064 ?auto_173071 ) ) ( not ( = ?auto_173065 ?auto_173066 ) ) ( not ( = ?auto_173065 ?auto_173067 ) ) ( not ( = ?auto_173065 ?auto_173068 ) ) ( not ( = ?auto_173065 ?auto_173069 ) ) ( not ( = ?auto_173065 ?auto_173070 ) ) ( not ( = ?auto_173065 ?auto_173071 ) ) ( not ( = ?auto_173066 ?auto_173067 ) ) ( not ( = ?auto_173066 ?auto_173068 ) ) ( not ( = ?auto_173066 ?auto_173069 ) ) ( not ( = ?auto_173066 ?auto_173070 ) ) ( not ( = ?auto_173066 ?auto_173071 ) ) ( not ( = ?auto_173067 ?auto_173068 ) ) ( not ( = ?auto_173067 ?auto_173069 ) ) ( not ( = ?auto_173067 ?auto_173070 ) ) ( not ( = ?auto_173067 ?auto_173071 ) ) ( not ( = ?auto_173068 ?auto_173069 ) ) ( not ( = ?auto_173068 ?auto_173070 ) ) ( not ( = ?auto_173068 ?auto_173071 ) ) ( not ( = ?auto_173069 ?auto_173070 ) ) ( not ( = ?auto_173069 ?auto_173071 ) ) ( not ( = ?auto_173070 ?auto_173071 ) ) ( ON-TABLE ?auto_173071 ) ( ON ?auto_173070 ?auto_173071 ) ( ON ?auto_173069 ?auto_173070 ) ( ON ?auto_173068 ?auto_173069 ) ( ON ?auto_173064 ?auto_173072 ) ( not ( = ?auto_173064 ?auto_173072 ) ) ( not ( = ?auto_173065 ?auto_173072 ) ) ( not ( = ?auto_173066 ?auto_173072 ) ) ( not ( = ?auto_173067 ?auto_173072 ) ) ( not ( = ?auto_173068 ?auto_173072 ) ) ( not ( = ?auto_173069 ?auto_173072 ) ) ( not ( = ?auto_173070 ?auto_173072 ) ) ( not ( = ?auto_173071 ?auto_173072 ) ) ( ON ?auto_173065 ?auto_173064 ) ( ON-TABLE ?auto_173072 ) ( ON ?auto_173066 ?auto_173065 ) ( CLEAR ?auto_173068 ) ( ON ?auto_173067 ?auto_173066 ) ( CLEAR ?auto_173067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173072 ?auto_173064 ?auto_173065 ?auto_173066 )
      ( MAKE-8PILE ?auto_173064 ?auto_173065 ?auto_173066 ?auto_173067 ?auto_173068 ?auto_173069 ?auto_173070 ?auto_173071 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173073 - BLOCK
      ?auto_173074 - BLOCK
      ?auto_173075 - BLOCK
      ?auto_173076 - BLOCK
      ?auto_173077 - BLOCK
      ?auto_173078 - BLOCK
      ?auto_173079 - BLOCK
      ?auto_173080 - BLOCK
    )
    :vars
    (
      ?auto_173081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173073 ?auto_173074 ) ) ( not ( = ?auto_173073 ?auto_173075 ) ) ( not ( = ?auto_173073 ?auto_173076 ) ) ( not ( = ?auto_173073 ?auto_173077 ) ) ( not ( = ?auto_173073 ?auto_173078 ) ) ( not ( = ?auto_173073 ?auto_173079 ) ) ( not ( = ?auto_173073 ?auto_173080 ) ) ( not ( = ?auto_173074 ?auto_173075 ) ) ( not ( = ?auto_173074 ?auto_173076 ) ) ( not ( = ?auto_173074 ?auto_173077 ) ) ( not ( = ?auto_173074 ?auto_173078 ) ) ( not ( = ?auto_173074 ?auto_173079 ) ) ( not ( = ?auto_173074 ?auto_173080 ) ) ( not ( = ?auto_173075 ?auto_173076 ) ) ( not ( = ?auto_173075 ?auto_173077 ) ) ( not ( = ?auto_173075 ?auto_173078 ) ) ( not ( = ?auto_173075 ?auto_173079 ) ) ( not ( = ?auto_173075 ?auto_173080 ) ) ( not ( = ?auto_173076 ?auto_173077 ) ) ( not ( = ?auto_173076 ?auto_173078 ) ) ( not ( = ?auto_173076 ?auto_173079 ) ) ( not ( = ?auto_173076 ?auto_173080 ) ) ( not ( = ?auto_173077 ?auto_173078 ) ) ( not ( = ?auto_173077 ?auto_173079 ) ) ( not ( = ?auto_173077 ?auto_173080 ) ) ( not ( = ?auto_173078 ?auto_173079 ) ) ( not ( = ?auto_173078 ?auto_173080 ) ) ( not ( = ?auto_173079 ?auto_173080 ) ) ( ON-TABLE ?auto_173080 ) ( ON ?auto_173079 ?auto_173080 ) ( ON ?auto_173078 ?auto_173079 ) ( ON ?auto_173073 ?auto_173081 ) ( not ( = ?auto_173073 ?auto_173081 ) ) ( not ( = ?auto_173074 ?auto_173081 ) ) ( not ( = ?auto_173075 ?auto_173081 ) ) ( not ( = ?auto_173076 ?auto_173081 ) ) ( not ( = ?auto_173077 ?auto_173081 ) ) ( not ( = ?auto_173078 ?auto_173081 ) ) ( not ( = ?auto_173079 ?auto_173081 ) ) ( not ( = ?auto_173080 ?auto_173081 ) ) ( ON ?auto_173074 ?auto_173073 ) ( ON-TABLE ?auto_173081 ) ( ON ?auto_173075 ?auto_173074 ) ( ON ?auto_173076 ?auto_173075 ) ( CLEAR ?auto_173076 ) ( HOLDING ?auto_173077 ) ( CLEAR ?auto_173078 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_173080 ?auto_173079 ?auto_173078 ?auto_173077 )
      ( MAKE-8PILE ?auto_173073 ?auto_173074 ?auto_173075 ?auto_173076 ?auto_173077 ?auto_173078 ?auto_173079 ?auto_173080 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173082 - BLOCK
      ?auto_173083 - BLOCK
      ?auto_173084 - BLOCK
      ?auto_173085 - BLOCK
      ?auto_173086 - BLOCK
      ?auto_173087 - BLOCK
      ?auto_173088 - BLOCK
      ?auto_173089 - BLOCK
    )
    :vars
    (
      ?auto_173090 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173082 ?auto_173083 ) ) ( not ( = ?auto_173082 ?auto_173084 ) ) ( not ( = ?auto_173082 ?auto_173085 ) ) ( not ( = ?auto_173082 ?auto_173086 ) ) ( not ( = ?auto_173082 ?auto_173087 ) ) ( not ( = ?auto_173082 ?auto_173088 ) ) ( not ( = ?auto_173082 ?auto_173089 ) ) ( not ( = ?auto_173083 ?auto_173084 ) ) ( not ( = ?auto_173083 ?auto_173085 ) ) ( not ( = ?auto_173083 ?auto_173086 ) ) ( not ( = ?auto_173083 ?auto_173087 ) ) ( not ( = ?auto_173083 ?auto_173088 ) ) ( not ( = ?auto_173083 ?auto_173089 ) ) ( not ( = ?auto_173084 ?auto_173085 ) ) ( not ( = ?auto_173084 ?auto_173086 ) ) ( not ( = ?auto_173084 ?auto_173087 ) ) ( not ( = ?auto_173084 ?auto_173088 ) ) ( not ( = ?auto_173084 ?auto_173089 ) ) ( not ( = ?auto_173085 ?auto_173086 ) ) ( not ( = ?auto_173085 ?auto_173087 ) ) ( not ( = ?auto_173085 ?auto_173088 ) ) ( not ( = ?auto_173085 ?auto_173089 ) ) ( not ( = ?auto_173086 ?auto_173087 ) ) ( not ( = ?auto_173086 ?auto_173088 ) ) ( not ( = ?auto_173086 ?auto_173089 ) ) ( not ( = ?auto_173087 ?auto_173088 ) ) ( not ( = ?auto_173087 ?auto_173089 ) ) ( not ( = ?auto_173088 ?auto_173089 ) ) ( ON-TABLE ?auto_173089 ) ( ON ?auto_173088 ?auto_173089 ) ( ON ?auto_173087 ?auto_173088 ) ( ON ?auto_173082 ?auto_173090 ) ( not ( = ?auto_173082 ?auto_173090 ) ) ( not ( = ?auto_173083 ?auto_173090 ) ) ( not ( = ?auto_173084 ?auto_173090 ) ) ( not ( = ?auto_173085 ?auto_173090 ) ) ( not ( = ?auto_173086 ?auto_173090 ) ) ( not ( = ?auto_173087 ?auto_173090 ) ) ( not ( = ?auto_173088 ?auto_173090 ) ) ( not ( = ?auto_173089 ?auto_173090 ) ) ( ON ?auto_173083 ?auto_173082 ) ( ON-TABLE ?auto_173090 ) ( ON ?auto_173084 ?auto_173083 ) ( ON ?auto_173085 ?auto_173084 ) ( CLEAR ?auto_173087 ) ( ON ?auto_173086 ?auto_173085 ) ( CLEAR ?auto_173086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_173090 ?auto_173082 ?auto_173083 ?auto_173084 ?auto_173085 )
      ( MAKE-8PILE ?auto_173082 ?auto_173083 ?auto_173084 ?auto_173085 ?auto_173086 ?auto_173087 ?auto_173088 ?auto_173089 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173091 - BLOCK
      ?auto_173092 - BLOCK
      ?auto_173093 - BLOCK
      ?auto_173094 - BLOCK
      ?auto_173095 - BLOCK
      ?auto_173096 - BLOCK
      ?auto_173097 - BLOCK
      ?auto_173098 - BLOCK
    )
    :vars
    (
      ?auto_173099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173091 ?auto_173092 ) ) ( not ( = ?auto_173091 ?auto_173093 ) ) ( not ( = ?auto_173091 ?auto_173094 ) ) ( not ( = ?auto_173091 ?auto_173095 ) ) ( not ( = ?auto_173091 ?auto_173096 ) ) ( not ( = ?auto_173091 ?auto_173097 ) ) ( not ( = ?auto_173091 ?auto_173098 ) ) ( not ( = ?auto_173092 ?auto_173093 ) ) ( not ( = ?auto_173092 ?auto_173094 ) ) ( not ( = ?auto_173092 ?auto_173095 ) ) ( not ( = ?auto_173092 ?auto_173096 ) ) ( not ( = ?auto_173092 ?auto_173097 ) ) ( not ( = ?auto_173092 ?auto_173098 ) ) ( not ( = ?auto_173093 ?auto_173094 ) ) ( not ( = ?auto_173093 ?auto_173095 ) ) ( not ( = ?auto_173093 ?auto_173096 ) ) ( not ( = ?auto_173093 ?auto_173097 ) ) ( not ( = ?auto_173093 ?auto_173098 ) ) ( not ( = ?auto_173094 ?auto_173095 ) ) ( not ( = ?auto_173094 ?auto_173096 ) ) ( not ( = ?auto_173094 ?auto_173097 ) ) ( not ( = ?auto_173094 ?auto_173098 ) ) ( not ( = ?auto_173095 ?auto_173096 ) ) ( not ( = ?auto_173095 ?auto_173097 ) ) ( not ( = ?auto_173095 ?auto_173098 ) ) ( not ( = ?auto_173096 ?auto_173097 ) ) ( not ( = ?auto_173096 ?auto_173098 ) ) ( not ( = ?auto_173097 ?auto_173098 ) ) ( ON-TABLE ?auto_173098 ) ( ON ?auto_173097 ?auto_173098 ) ( ON ?auto_173091 ?auto_173099 ) ( not ( = ?auto_173091 ?auto_173099 ) ) ( not ( = ?auto_173092 ?auto_173099 ) ) ( not ( = ?auto_173093 ?auto_173099 ) ) ( not ( = ?auto_173094 ?auto_173099 ) ) ( not ( = ?auto_173095 ?auto_173099 ) ) ( not ( = ?auto_173096 ?auto_173099 ) ) ( not ( = ?auto_173097 ?auto_173099 ) ) ( not ( = ?auto_173098 ?auto_173099 ) ) ( ON ?auto_173092 ?auto_173091 ) ( ON-TABLE ?auto_173099 ) ( ON ?auto_173093 ?auto_173092 ) ( ON ?auto_173094 ?auto_173093 ) ( ON ?auto_173095 ?auto_173094 ) ( CLEAR ?auto_173095 ) ( HOLDING ?auto_173096 ) ( CLEAR ?auto_173097 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_173098 ?auto_173097 ?auto_173096 )
      ( MAKE-8PILE ?auto_173091 ?auto_173092 ?auto_173093 ?auto_173094 ?auto_173095 ?auto_173096 ?auto_173097 ?auto_173098 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173100 - BLOCK
      ?auto_173101 - BLOCK
      ?auto_173102 - BLOCK
      ?auto_173103 - BLOCK
      ?auto_173104 - BLOCK
      ?auto_173105 - BLOCK
      ?auto_173106 - BLOCK
      ?auto_173107 - BLOCK
    )
    :vars
    (
      ?auto_173108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173100 ?auto_173101 ) ) ( not ( = ?auto_173100 ?auto_173102 ) ) ( not ( = ?auto_173100 ?auto_173103 ) ) ( not ( = ?auto_173100 ?auto_173104 ) ) ( not ( = ?auto_173100 ?auto_173105 ) ) ( not ( = ?auto_173100 ?auto_173106 ) ) ( not ( = ?auto_173100 ?auto_173107 ) ) ( not ( = ?auto_173101 ?auto_173102 ) ) ( not ( = ?auto_173101 ?auto_173103 ) ) ( not ( = ?auto_173101 ?auto_173104 ) ) ( not ( = ?auto_173101 ?auto_173105 ) ) ( not ( = ?auto_173101 ?auto_173106 ) ) ( not ( = ?auto_173101 ?auto_173107 ) ) ( not ( = ?auto_173102 ?auto_173103 ) ) ( not ( = ?auto_173102 ?auto_173104 ) ) ( not ( = ?auto_173102 ?auto_173105 ) ) ( not ( = ?auto_173102 ?auto_173106 ) ) ( not ( = ?auto_173102 ?auto_173107 ) ) ( not ( = ?auto_173103 ?auto_173104 ) ) ( not ( = ?auto_173103 ?auto_173105 ) ) ( not ( = ?auto_173103 ?auto_173106 ) ) ( not ( = ?auto_173103 ?auto_173107 ) ) ( not ( = ?auto_173104 ?auto_173105 ) ) ( not ( = ?auto_173104 ?auto_173106 ) ) ( not ( = ?auto_173104 ?auto_173107 ) ) ( not ( = ?auto_173105 ?auto_173106 ) ) ( not ( = ?auto_173105 ?auto_173107 ) ) ( not ( = ?auto_173106 ?auto_173107 ) ) ( ON-TABLE ?auto_173107 ) ( ON ?auto_173106 ?auto_173107 ) ( ON ?auto_173100 ?auto_173108 ) ( not ( = ?auto_173100 ?auto_173108 ) ) ( not ( = ?auto_173101 ?auto_173108 ) ) ( not ( = ?auto_173102 ?auto_173108 ) ) ( not ( = ?auto_173103 ?auto_173108 ) ) ( not ( = ?auto_173104 ?auto_173108 ) ) ( not ( = ?auto_173105 ?auto_173108 ) ) ( not ( = ?auto_173106 ?auto_173108 ) ) ( not ( = ?auto_173107 ?auto_173108 ) ) ( ON ?auto_173101 ?auto_173100 ) ( ON-TABLE ?auto_173108 ) ( ON ?auto_173102 ?auto_173101 ) ( ON ?auto_173103 ?auto_173102 ) ( ON ?auto_173104 ?auto_173103 ) ( CLEAR ?auto_173106 ) ( ON ?auto_173105 ?auto_173104 ) ( CLEAR ?auto_173105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_173108 ?auto_173100 ?auto_173101 ?auto_173102 ?auto_173103 ?auto_173104 )
      ( MAKE-8PILE ?auto_173100 ?auto_173101 ?auto_173102 ?auto_173103 ?auto_173104 ?auto_173105 ?auto_173106 ?auto_173107 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173109 - BLOCK
      ?auto_173110 - BLOCK
      ?auto_173111 - BLOCK
      ?auto_173112 - BLOCK
      ?auto_173113 - BLOCK
      ?auto_173114 - BLOCK
      ?auto_173115 - BLOCK
      ?auto_173116 - BLOCK
    )
    :vars
    (
      ?auto_173117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173109 ?auto_173110 ) ) ( not ( = ?auto_173109 ?auto_173111 ) ) ( not ( = ?auto_173109 ?auto_173112 ) ) ( not ( = ?auto_173109 ?auto_173113 ) ) ( not ( = ?auto_173109 ?auto_173114 ) ) ( not ( = ?auto_173109 ?auto_173115 ) ) ( not ( = ?auto_173109 ?auto_173116 ) ) ( not ( = ?auto_173110 ?auto_173111 ) ) ( not ( = ?auto_173110 ?auto_173112 ) ) ( not ( = ?auto_173110 ?auto_173113 ) ) ( not ( = ?auto_173110 ?auto_173114 ) ) ( not ( = ?auto_173110 ?auto_173115 ) ) ( not ( = ?auto_173110 ?auto_173116 ) ) ( not ( = ?auto_173111 ?auto_173112 ) ) ( not ( = ?auto_173111 ?auto_173113 ) ) ( not ( = ?auto_173111 ?auto_173114 ) ) ( not ( = ?auto_173111 ?auto_173115 ) ) ( not ( = ?auto_173111 ?auto_173116 ) ) ( not ( = ?auto_173112 ?auto_173113 ) ) ( not ( = ?auto_173112 ?auto_173114 ) ) ( not ( = ?auto_173112 ?auto_173115 ) ) ( not ( = ?auto_173112 ?auto_173116 ) ) ( not ( = ?auto_173113 ?auto_173114 ) ) ( not ( = ?auto_173113 ?auto_173115 ) ) ( not ( = ?auto_173113 ?auto_173116 ) ) ( not ( = ?auto_173114 ?auto_173115 ) ) ( not ( = ?auto_173114 ?auto_173116 ) ) ( not ( = ?auto_173115 ?auto_173116 ) ) ( ON-TABLE ?auto_173116 ) ( ON ?auto_173109 ?auto_173117 ) ( not ( = ?auto_173109 ?auto_173117 ) ) ( not ( = ?auto_173110 ?auto_173117 ) ) ( not ( = ?auto_173111 ?auto_173117 ) ) ( not ( = ?auto_173112 ?auto_173117 ) ) ( not ( = ?auto_173113 ?auto_173117 ) ) ( not ( = ?auto_173114 ?auto_173117 ) ) ( not ( = ?auto_173115 ?auto_173117 ) ) ( not ( = ?auto_173116 ?auto_173117 ) ) ( ON ?auto_173110 ?auto_173109 ) ( ON-TABLE ?auto_173117 ) ( ON ?auto_173111 ?auto_173110 ) ( ON ?auto_173112 ?auto_173111 ) ( ON ?auto_173113 ?auto_173112 ) ( ON ?auto_173114 ?auto_173113 ) ( CLEAR ?auto_173114 ) ( HOLDING ?auto_173115 ) ( CLEAR ?auto_173116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_173116 ?auto_173115 )
      ( MAKE-8PILE ?auto_173109 ?auto_173110 ?auto_173111 ?auto_173112 ?auto_173113 ?auto_173114 ?auto_173115 ?auto_173116 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173118 - BLOCK
      ?auto_173119 - BLOCK
      ?auto_173120 - BLOCK
      ?auto_173121 - BLOCK
      ?auto_173122 - BLOCK
      ?auto_173123 - BLOCK
      ?auto_173124 - BLOCK
      ?auto_173125 - BLOCK
    )
    :vars
    (
      ?auto_173126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173118 ?auto_173119 ) ) ( not ( = ?auto_173118 ?auto_173120 ) ) ( not ( = ?auto_173118 ?auto_173121 ) ) ( not ( = ?auto_173118 ?auto_173122 ) ) ( not ( = ?auto_173118 ?auto_173123 ) ) ( not ( = ?auto_173118 ?auto_173124 ) ) ( not ( = ?auto_173118 ?auto_173125 ) ) ( not ( = ?auto_173119 ?auto_173120 ) ) ( not ( = ?auto_173119 ?auto_173121 ) ) ( not ( = ?auto_173119 ?auto_173122 ) ) ( not ( = ?auto_173119 ?auto_173123 ) ) ( not ( = ?auto_173119 ?auto_173124 ) ) ( not ( = ?auto_173119 ?auto_173125 ) ) ( not ( = ?auto_173120 ?auto_173121 ) ) ( not ( = ?auto_173120 ?auto_173122 ) ) ( not ( = ?auto_173120 ?auto_173123 ) ) ( not ( = ?auto_173120 ?auto_173124 ) ) ( not ( = ?auto_173120 ?auto_173125 ) ) ( not ( = ?auto_173121 ?auto_173122 ) ) ( not ( = ?auto_173121 ?auto_173123 ) ) ( not ( = ?auto_173121 ?auto_173124 ) ) ( not ( = ?auto_173121 ?auto_173125 ) ) ( not ( = ?auto_173122 ?auto_173123 ) ) ( not ( = ?auto_173122 ?auto_173124 ) ) ( not ( = ?auto_173122 ?auto_173125 ) ) ( not ( = ?auto_173123 ?auto_173124 ) ) ( not ( = ?auto_173123 ?auto_173125 ) ) ( not ( = ?auto_173124 ?auto_173125 ) ) ( ON-TABLE ?auto_173125 ) ( ON ?auto_173118 ?auto_173126 ) ( not ( = ?auto_173118 ?auto_173126 ) ) ( not ( = ?auto_173119 ?auto_173126 ) ) ( not ( = ?auto_173120 ?auto_173126 ) ) ( not ( = ?auto_173121 ?auto_173126 ) ) ( not ( = ?auto_173122 ?auto_173126 ) ) ( not ( = ?auto_173123 ?auto_173126 ) ) ( not ( = ?auto_173124 ?auto_173126 ) ) ( not ( = ?auto_173125 ?auto_173126 ) ) ( ON ?auto_173119 ?auto_173118 ) ( ON-TABLE ?auto_173126 ) ( ON ?auto_173120 ?auto_173119 ) ( ON ?auto_173121 ?auto_173120 ) ( ON ?auto_173122 ?auto_173121 ) ( ON ?auto_173123 ?auto_173122 ) ( CLEAR ?auto_173125 ) ( ON ?auto_173124 ?auto_173123 ) ( CLEAR ?auto_173124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_173126 ?auto_173118 ?auto_173119 ?auto_173120 ?auto_173121 ?auto_173122 ?auto_173123 )
      ( MAKE-8PILE ?auto_173118 ?auto_173119 ?auto_173120 ?auto_173121 ?auto_173122 ?auto_173123 ?auto_173124 ?auto_173125 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173127 - BLOCK
      ?auto_173128 - BLOCK
      ?auto_173129 - BLOCK
      ?auto_173130 - BLOCK
      ?auto_173131 - BLOCK
      ?auto_173132 - BLOCK
      ?auto_173133 - BLOCK
      ?auto_173134 - BLOCK
    )
    :vars
    (
      ?auto_173135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173127 ?auto_173128 ) ) ( not ( = ?auto_173127 ?auto_173129 ) ) ( not ( = ?auto_173127 ?auto_173130 ) ) ( not ( = ?auto_173127 ?auto_173131 ) ) ( not ( = ?auto_173127 ?auto_173132 ) ) ( not ( = ?auto_173127 ?auto_173133 ) ) ( not ( = ?auto_173127 ?auto_173134 ) ) ( not ( = ?auto_173128 ?auto_173129 ) ) ( not ( = ?auto_173128 ?auto_173130 ) ) ( not ( = ?auto_173128 ?auto_173131 ) ) ( not ( = ?auto_173128 ?auto_173132 ) ) ( not ( = ?auto_173128 ?auto_173133 ) ) ( not ( = ?auto_173128 ?auto_173134 ) ) ( not ( = ?auto_173129 ?auto_173130 ) ) ( not ( = ?auto_173129 ?auto_173131 ) ) ( not ( = ?auto_173129 ?auto_173132 ) ) ( not ( = ?auto_173129 ?auto_173133 ) ) ( not ( = ?auto_173129 ?auto_173134 ) ) ( not ( = ?auto_173130 ?auto_173131 ) ) ( not ( = ?auto_173130 ?auto_173132 ) ) ( not ( = ?auto_173130 ?auto_173133 ) ) ( not ( = ?auto_173130 ?auto_173134 ) ) ( not ( = ?auto_173131 ?auto_173132 ) ) ( not ( = ?auto_173131 ?auto_173133 ) ) ( not ( = ?auto_173131 ?auto_173134 ) ) ( not ( = ?auto_173132 ?auto_173133 ) ) ( not ( = ?auto_173132 ?auto_173134 ) ) ( not ( = ?auto_173133 ?auto_173134 ) ) ( ON ?auto_173127 ?auto_173135 ) ( not ( = ?auto_173127 ?auto_173135 ) ) ( not ( = ?auto_173128 ?auto_173135 ) ) ( not ( = ?auto_173129 ?auto_173135 ) ) ( not ( = ?auto_173130 ?auto_173135 ) ) ( not ( = ?auto_173131 ?auto_173135 ) ) ( not ( = ?auto_173132 ?auto_173135 ) ) ( not ( = ?auto_173133 ?auto_173135 ) ) ( not ( = ?auto_173134 ?auto_173135 ) ) ( ON ?auto_173128 ?auto_173127 ) ( ON-TABLE ?auto_173135 ) ( ON ?auto_173129 ?auto_173128 ) ( ON ?auto_173130 ?auto_173129 ) ( ON ?auto_173131 ?auto_173130 ) ( ON ?auto_173132 ?auto_173131 ) ( ON ?auto_173133 ?auto_173132 ) ( CLEAR ?auto_173133 ) ( HOLDING ?auto_173134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_173134 )
      ( MAKE-8PILE ?auto_173127 ?auto_173128 ?auto_173129 ?auto_173130 ?auto_173131 ?auto_173132 ?auto_173133 ?auto_173134 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_173136 - BLOCK
      ?auto_173137 - BLOCK
      ?auto_173138 - BLOCK
      ?auto_173139 - BLOCK
      ?auto_173140 - BLOCK
      ?auto_173141 - BLOCK
      ?auto_173142 - BLOCK
      ?auto_173143 - BLOCK
    )
    :vars
    (
      ?auto_173144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_173136 ?auto_173137 ) ) ( not ( = ?auto_173136 ?auto_173138 ) ) ( not ( = ?auto_173136 ?auto_173139 ) ) ( not ( = ?auto_173136 ?auto_173140 ) ) ( not ( = ?auto_173136 ?auto_173141 ) ) ( not ( = ?auto_173136 ?auto_173142 ) ) ( not ( = ?auto_173136 ?auto_173143 ) ) ( not ( = ?auto_173137 ?auto_173138 ) ) ( not ( = ?auto_173137 ?auto_173139 ) ) ( not ( = ?auto_173137 ?auto_173140 ) ) ( not ( = ?auto_173137 ?auto_173141 ) ) ( not ( = ?auto_173137 ?auto_173142 ) ) ( not ( = ?auto_173137 ?auto_173143 ) ) ( not ( = ?auto_173138 ?auto_173139 ) ) ( not ( = ?auto_173138 ?auto_173140 ) ) ( not ( = ?auto_173138 ?auto_173141 ) ) ( not ( = ?auto_173138 ?auto_173142 ) ) ( not ( = ?auto_173138 ?auto_173143 ) ) ( not ( = ?auto_173139 ?auto_173140 ) ) ( not ( = ?auto_173139 ?auto_173141 ) ) ( not ( = ?auto_173139 ?auto_173142 ) ) ( not ( = ?auto_173139 ?auto_173143 ) ) ( not ( = ?auto_173140 ?auto_173141 ) ) ( not ( = ?auto_173140 ?auto_173142 ) ) ( not ( = ?auto_173140 ?auto_173143 ) ) ( not ( = ?auto_173141 ?auto_173142 ) ) ( not ( = ?auto_173141 ?auto_173143 ) ) ( not ( = ?auto_173142 ?auto_173143 ) ) ( ON ?auto_173136 ?auto_173144 ) ( not ( = ?auto_173136 ?auto_173144 ) ) ( not ( = ?auto_173137 ?auto_173144 ) ) ( not ( = ?auto_173138 ?auto_173144 ) ) ( not ( = ?auto_173139 ?auto_173144 ) ) ( not ( = ?auto_173140 ?auto_173144 ) ) ( not ( = ?auto_173141 ?auto_173144 ) ) ( not ( = ?auto_173142 ?auto_173144 ) ) ( not ( = ?auto_173143 ?auto_173144 ) ) ( ON ?auto_173137 ?auto_173136 ) ( ON-TABLE ?auto_173144 ) ( ON ?auto_173138 ?auto_173137 ) ( ON ?auto_173139 ?auto_173138 ) ( ON ?auto_173140 ?auto_173139 ) ( ON ?auto_173141 ?auto_173140 ) ( ON ?auto_173142 ?auto_173141 ) ( ON ?auto_173143 ?auto_173142 ) ( CLEAR ?auto_173143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_173144 ?auto_173136 ?auto_173137 ?auto_173138 ?auto_173139 ?auto_173140 ?auto_173141 ?auto_173142 )
      ( MAKE-8PILE ?auto_173136 ?auto_173137 ?auto_173138 ?auto_173139 ?auto_173140 ?auto_173141 ?auto_173142 ?auto_173143 ) )
  )

)

