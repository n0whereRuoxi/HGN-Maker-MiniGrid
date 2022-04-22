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
      ?auto_42491 - BLOCK
      ?auto_42492 - BLOCK
      ?auto_42493 - BLOCK
      ?auto_42494 - BLOCK
      ?auto_42495 - BLOCK
      ?auto_42496 - BLOCK
    )
    :vars
    (
      ?auto_42497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42497 ?auto_42496 ) ( CLEAR ?auto_42497 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42491 ) ( ON ?auto_42492 ?auto_42491 ) ( ON ?auto_42493 ?auto_42492 ) ( ON ?auto_42494 ?auto_42493 ) ( ON ?auto_42495 ?auto_42494 ) ( ON ?auto_42496 ?auto_42495 ) ( not ( = ?auto_42491 ?auto_42492 ) ) ( not ( = ?auto_42491 ?auto_42493 ) ) ( not ( = ?auto_42491 ?auto_42494 ) ) ( not ( = ?auto_42491 ?auto_42495 ) ) ( not ( = ?auto_42491 ?auto_42496 ) ) ( not ( = ?auto_42491 ?auto_42497 ) ) ( not ( = ?auto_42492 ?auto_42493 ) ) ( not ( = ?auto_42492 ?auto_42494 ) ) ( not ( = ?auto_42492 ?auto_42495 ) ) ( not ( = ?auto_42492 ?auto_42496 ) ) ( not ( = ?auto_42492 ?auto_42497 ) ) ( not ( = ?auto_42493 ?auto_42494 ) ) ( not ( = ?auto_42493 ?auto_42495 ) ) ( not ( = ?auto_42493 ?auto_42496 ) ) ( not ( = ?auto_42493 ?auto_42497 ) ) ( not ( = ?auto_42494 ?auto_42495 ) ) ( not ( = ?auto_42494 ?auto_42496 ) ) ( not ( = ?auto_42494 ?auto_42497 ) ) ( not ( = ?auto_42495 ?auto_42496 ) ) ( not ( = ?auto_42495 ?auto_42497 ) ) ( not ( = ?auto_42496 ?auto_42497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42497 ?auto_42496 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42499 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42499 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_42499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42500 - BLOCK
    )
    :vars
    (
      ?auto_42501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42500 ?auto_42501 ) ( CLEAR ?auto_42500 ) ( HAND-EMPTY ) ( not ( = ?auto_42500 ?auto_42501 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42500 ?auto_42501 )
      ( MAKE-1PILE ?auto_42500 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42507 - BLOCK
      ?auto_42508 - BLOCK
      ?auto_42509 - BLOCK
      ?auto_42510 - BLOCK
      ?auto_42511 - BLOCK
    )
    :vars
    (
      ?auto_42512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42512 ?auto_42511 ) ( CLEAR ?auto_42512 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42507 ) ( ON ?auto_42508 ?auto_42507 ) ( ON ?auto_42509 ?auto_42508 ) ( ON ?auto_42510 ?auto_42509 ) ( ON ?auto_42511 ?auto_42510 ) ( not ( = ?auto_42507 ?auto_42508 ) ) ( not ( = ?auto_42507 ?auto_42509 ) ) ( not ( = ?auto_42507 ?auto_42510 ) ) ( not ( = ?auto_42507 ?auto_42511 ) ) ( not ( = ?auto_42507 ?auto_42512 ) ) ( not ( = ?auto_42508 ?auto_42509 ) ) ( not ( = ?auto_42508 ?auto_42510 ) ) ( not ( = ?auto_42508 ?auto_42511 ) ) ( not ( = ?auto_42508 ?auto_42512 ) ) ( not ( = ?auto_42509 ?auto_42510 ) ) ( not ( = ?auto_42509 ?auto_42511 ) ) ( not ( = ?auto_42509 ?auto_42512 ) ) ( not ( = ?auto_42510 ?auto_42511 ) ) ( not ( = ?auto_42510 ?auto_42512 ) ) ( not ( = ?auto_42511 ?auto_42512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42512 ?auto_42511 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42513 - BLOCK
      ?auto_42514 - BLOCK
      ?auto_42515 - BLOCK
      ?auto_42516 - BLOCK
      ?auto_42517 - BLOCK
    )
    :vars
    (
      ?auto_42518 - BLOCK
      ?auto_42519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42518 ?auto_42517 ) ( CLEAR ?auto_42518 ) ( ON-TABLE ?auto_42513 ) ( ON ?auto_42514 ?auto_42513 ) ( ON ?auto_42515 ?auto_42514 ) ( ON ?auto_42516 ?auto_42515 ) ( ON ?auto_42517 ?auto_42516 ) ( not ( = ?auto_42513 ?auto_42514 ) ) ( not ( = ?auto_42513 ?auto_42515 ) ) ( not ( = ?auto_42513 ?auto_42516 ) ) ( not ( = ?auto_42513 ?auto_42517 ) ) ( not ( = ?auto_42513 ?auto_42518 ) ) ( not ( = ?auto_42514 ?auto_42515 ) ) ( not ( = ?auto_42514 ?auto_42516 ) ) ( not ( = ?auto_42514 ?auto_42517 ) ) ( not ( = ?auto_42514 ?auto_42518 ) ) ( not ( = ?auto_42515 ?auto_42516 ) ) ( not ( = ?auto_42515 ?auto_42517 ) ) ( not ( = ?auto_42515 ?auto_42518 ) ) ( not ( = ?auto_42516 ?auto_42517 ) ) ( not ( = ?auto_42516 ?auto_42518 ) ) ( not ( = ?auto_42517 ?auto_42518 ) ) ( HOLDING ?auto_42519 ) ( not ( = ?auto_42513 ?auto_42519 ) ) ( not ( = ?auto_42514 ?auto_42519 ) ) ( not ( = ?auto_42515 ?auto_42519 ) ) ( not ( = ?auto_42516 ?auto_42519 ) ) ( not ( = ?auto_42517 ?auto_42519 ) ) ( not ( = ?auto_42518 ?auto_42519 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_42519 )
      ( MAKE-5PILE ?auto_42513 ?auto_42514 ?auto_42515 ?auto_42516 ?auto_42517 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42520 - BLOCK
      ?auto_42521 - BLOCK
      ?auto_42522 - BLOCK
      ?auto_42523 - BLOCK
      ?auto_42524 - BLOCK
    )
    :vars
    (
      ?auto_42525 - BLOCK
      ?auto_42526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42525 ?auto_42524 ) ( ON-TABLE ?auto_42520 ) ( ON ?auto_42521 ?auto_42520 ) ( ON ?auto_42522 ?auto_42521 ) ( ON ?auto_42523 ?auto_42522 ) ( ON ?auto_42524 ?auto_42523 ) ( not ( = ?auto_42520 ?auto_42521 ) ) ( not ( = ?auto_42520 ?auto_42522 ) ) ( not ( = ?auto_42520 ?auto_42523 ) ) ( not ( = ?auto_42520 ?auto_42524 ) ) ( not ( = ?auto_42520 ?auto_42525 ) ) ( not ( = ?auto_42521 ?auto_42522 ) ) ( not ( = ?auto_42521 ?auto_42523 ) ) ( not ( = ?auto_42521 ?auto_42524 ) ) ( not ( = ?auto_42521 ?auto_42525 ) ) ( not ( = ?auto_42522 ?auto_42523 ) ) ( not ( = ?auto_42522 ?auto_42524 ) ) ( not ( = ?auto_42522 ?auto_42525 ) ) ( not ( = ?auto_42523 ?auto_42524 ) ) ( not ( = ?auto_42523 ?auto_42525 ) ) ( not ( = ?auto_42524 ?auto_42525 ) ) ( not ( = ?auto_42520 ?auto_42526 ) ) ( not ( = ?auto_42521 ?auto_42526 ) ) ( not ( = ?auto_42522 ?auto_42526 ) ) ( not ( = ?auto_42523 ?auto_42526 ) ) ( not ( = ?auto_42524 ?auto_42526 ) ) ( not ( = ?auto_42525 ?auto_42526 ) ) ( ON ?auto_42526 ?auto_42525 ) ( CLEAR ?auto_42526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42520 ?auto_42521 ?auto_42522 ?auto_42523 ?auto_42524 ?auto_42525 )
      ( MAKE-5PILE ?auto_42520 ?auto_42521 ?auto_42522 ?auto_42523 ?auto_42524 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42529 - BLOCK
      ?auto_42530 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42530 ) ( CLEAR ?auto_42529 ) ( ON-TABLE ?auto_42529 ) ( not ( = ?auto_42529 ?auto_42530 ) ) )
    :subtasks
    ( ( !STACK ?auto_42530 ?auto_42529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42531 - BLOCK
      ?auto_42532 - BLOCK
    )
    :vars
    (
      ?auto_42533 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42531 ) ( ON-TABLE ?auto_42531 ) ( not ( = ?auto_42531 ?auto_42532 ) ) ( ON ?auto_42532 ?auto_42533 ) ( CLEAR ?auto_42532 ) ( HAND-EMPTY ) ( not ( = ?auto_42531 ?auto_42533 ) ) ( not ( = ?auto_42532 ?auto_42533 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42532 ?auto_42533 )
      ( MAKE-2PILE ?auto_42531 ?auto_42532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42534 - BLOCK
      ?auto_42535 - BLOCK
    )
    :vars
    (
      ?auto_42536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42534 ?auto_42535 ) ) ( ON ?auto_42535 ?auto_42536 ) ( CLEAR ?auto_42535 ) ( not ( = ?auto_42534 ?auto_42536 ) ) ( not ( = ?auto_42535 ?auto_42536 ) ) ( HOLDING ?auto_42534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42534 )
      ( MAKE-2PILE ?auto_42534 ?auto_42535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42537 - BLOCK
      ?auto_42538 - BLOCK
    )
    :vars
    (
      ?auto_42539 - BLOCK
      ?auto_42540 - BLOCK
      ?auto_42542 - BLOCK
      ?auto_42543 - BLOCK
      ?auto_42541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42537 ?auto_42538 ) ) ( ON ?auto_42538 ?auto_42539 ) ( not ( = ?auto_42537 ?auto_42539 ) ) ( not ( = ?auto_42538 ?auto_42539 ) ) ( ON ?auto_42537 ?auto_42538 ) ( CLEAR ?auto_42537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42540 ) ( ON ?auto_42542 ?auto_42540 ) ( ON ?auto_42543 ?auto_42542 ) ( ON ?auto_42541 ?auto_42543 ) ( ON ?auto_42539 ?auto_42541 ) ( not ( = ?auto_42540 ?auto_42542 ) ) ( not ( = ?auto_42540 ?auto_42543 ) ) ( not ( = ?auto_42540 ?auto_42541 ) ) ( not ( = ?auto_42540 ?auto_42539 ) ) ( not ( = ?auto_42540 ?auto_42538 ) ) ( not ( = ?auto_42540 ?auto_42537 ) ) ( not ( = ?auto_42542 ?auto_42543 ) ) ( not ( = ?auto_42542 ?auto_42541 ) ) ( not ( = ?auto_42542 ?auto_42539 ) ) ( not ( = ?auto_42542 ?auto_42538 ) ) ( not ( = ?auto_42542 ?auto_42537 ) ) ( not ( = ?auto_42543 ?auto_42541 ) ) ( not ( = ?auto_42543 ?auto_42539 ) ) ( not ( = ?auto_42543 ?auto_42538 ) ) ( not ( = ?auto_42543 ?auto_42537 ) ) ( not ( = ?auto_42541 ?auto_42539 ) ) ( not ( = ?auto_42541 ?auto_42538 ) ) ( not ( = ?auto_42541 ?auto_42537 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42540 ?auto_42542 ?auto_42543 ?auto_42541 ?auto_42539 ?auto_42538 )
      ( MAKE-2PILE ?auto_42537 ?auto_42538 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42548 - BLOCK
      ?auto_42549 - BLOCK
      ?auto_42550 - BLOCK
      ?auto_42551 - BLOCK
    )
    :vars
    (
      ?auto_42552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42552 ?auto_42551 ) ( CLEAR ?auto_42552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42548 ) ( ON ?auto_42549 ?auto_42548 ) ( ON ?auto_42550 ?auto_42549 ) ( ON ?auto_42551 ?auto_42550 ) ( not ( = ?auto_42548 ?auto_42549 ) ) ( not ( = ?auto_42548 ?auto_42550 ) ) ( not ( = ?auto_42548 ?auto_42551 ) ) ( not ( = ?auto_42548 ?auto_42552 ) ) ( not ( = ?auto_42549 ?auto_42550 ) ) ( not ( = ?auto_42549 ?auto_42551 ) ) ( not ( = ?auto_42549 ?auto_42552 ) ) ( not ( = ?auto_42550 ?auto_42551 ) ) ( not ( = ?auto_42550 ?auto_42552 ) ) ( not ( = ?auto_42551 ?auto_42552 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42552 ?auto_42551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42553 - BLOCK
      ?auto_42554 - BLOCK
      ?auto_42555 - BLOCK
      ?auto_42556 - BLOCK
    )
    :vars
    (
      ?auto_42557 - BLOCK
      ?auto_42558 - BLOCK
      ?auto_42559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42557 ?auto_42556 ) ( CLEAR ?auto_42557 ) ( ON-TABLE ?auto_42553 ) ( ON ?auto_42554 ?auto_42553 ) ( ON ?auto_42555 ?auto_42554 ) ( ON ?auto_42556 ?auto_42555 ) ( not ( = ?auto_42553 ?auto_42554 ) ) ( not ( = ?auto_42553 ?auto_42555 ) ) ( not ( = ?auto_42553 ?auto_42556 ) ) ( not ( = ?auto_42553 ?auto_42557 ) ) ( not ( = ?auto_42554 ?auto_42555 ) ) ( not ( = ?auto_42554 ?auto_42556 ) ) ( not ( = ?auto_42554 ?auto_42557 ) ) ( not ( = ?auto_42555 ?auto_42556 ) ) ( not ( = ?auto_42555 ?auto_42557 ) ) ( not ( = ?auto_42556 ?auto_42557 ) ) ( HOLDING ?auto_42558 ) ( CLEAR ?auto_42559 ) ( not ( = ?auto_42553 ?auto_42558 ) ) ( not ( = ?auto_42553 ?auto_42559 ) ) ( not ( = ?auto_42554 ?auto_42558 ) ) ( not ( = ?auto_42554 ?auto_42559 ) ) ( not ( = ?auto_42555 ?auto_42558 ) ) ( not ( = ?auto_42555 ?auto_42559 ) ) ( not ( = ?auto_42556 ?auto_42558 ) ) ( not ( = ?auto_42556 ?auto_42559 ) ) ( not ( = ?auto_42557 ?auto_42558 ) ) ( not ( = ?auto_42557 ?auto_42559 ) ) ( not ( = ?auto_42558 ?auto_42559 ) ) )
    :subtasks
    ( ( !STACK ?auto_42558 ?auto_42559 )
      ( MAKE-4PILE ?auto_42553 ?auto_42554 ?auto_42555 ?auto_42556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43159 - BLOCK
      ?auto_43160 - BLOCK
      ?auto_43161 - BLOCK
      ?auto_43162 - BLOCK
    )
    :vars
    (
      ?auto_43164 - BLOCK
      ?auto_43163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43164 ?auto_43162 ) ( ON-TABLE ?auto_43159 ) ( ON ?auto_43160 ?auto_43159 ) ( ON ?auto_43161 ?auto_43160 ) ( ON ?auto_43162 ?auto_43161 ) ( not ( = ?auto_43159 ?auto_43160 ) ) ( not ( = ?auto_43159 ?auto_43161 ) ) ( not ( = ?auto_43159 ?auto_43162 ) ) ( not ( = ?auto_43159 ?auto_43164 ) ) ( not ( = ?auto_43160 ?auto_43161 ) ) ( not ( = ?auto_43160 ?auto_43162 ) ) ( not ( = ?auto_43160 ?auto_43164 ) ) ( not ( = ?auto_43161 ?auto_43162 ) ) ( not ( = ?auto_43161 ?auto_43164 ) ) ( not ( = ?auto_43162 ?auto_43164 ) ) ( not ( = ?auto_43159 ?auto_43163 ) ) ( not ( = ?auto_43160 ?auto_43163 ) ) ( not ( = ?auto_43161 ?auto_43163 ) ) ( not ( = ?auto_43162 ?auto_43163 ) ) ( not ( = ?auto_43164 ?auto_43163 ) ) ( ON ?auto_43163 ?auto_43164 ) ( CLEAR ?auto_43163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43159 ?auto_43160 ?auto_43161 ?auto_43162 ?auto_43164 )
      ( MAKE-4PILE ?auto_43159 ?auto_43160 ?auto_43161 ?auto_43162 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42567 - BLOCK
      ?auto_42568 - BLOCK
      ?auto_42569 - BLOCK
      ?auto_42570 - BLOCK
    )
    :vars
    (
      ?auto_42571 - BLOCK
      ?auto_42573 - BLOCK
      ?auto_42572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42571 ?auto_42570 ) ( ON-TABLE ?auto_42567 ) ( ON ?auto_42568 ?auto_42567 ) ( ON ?auto_42569 ?auto_42568 ) ( ON ?auto_42570 ?auto_42569 ) ( not ( = ?auto_42567 ?auto_42568 ) ) ( not ( = ?auto_42567 ?auto_42569 ) ) ( not ( = ?auto_42567 ?auto_42570 ) ) ( not ( = ?auto_42567 ?auto_42571 ) ) ( not ( = ?auto_42568 ?auto_42569 ) ) ( not ( = ?auto_42568 ?auto_42570 ) ) ( not ( = ?auto_42568 ?auto_42571 ) ) ( not ( = ?auto_42569 ?auto_42570 ) ) ( not ( = ?auto_42569 ?auto_42571 ) ) ( not ( = ?auto_42570 ?auto_42571 ) ) ( not ( = ?auto_42567 ?auto_42573 ) ) ( not ( = ?auto_42567 ?auto_42572 ) ) ( not ( = ?auto_42568 ?auto_42573 ) ) ( not ( = ?auto_42568 ?auto_42572 ) ) ( not ( = ?auto_42569 ?auto_42573 ) ) ( not ( = ?auto_42569 ?auto_42572 ) ) ( not ( = ?auto_42570 ?auto_42573 ) ) ( not ( = ?auto_42570 ?auto_42572 ) ) ( not ( = ?auto_42571 ?auto_42573 ) ) ( not ( = ?auto_42571 ?auto_42572 ) ) ( not ( = ?auto_42573 ?auto_42572 ) ) ( ON ?auto_42573 ?auto_42571 ) ( CLEAR ?auto_42573 ) ( HOLDING ?auto_42572 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42572 )
      ( MAKE-4PILE ?auto_42567 ?auto_42568 ?auto_42569 ?auto_42570 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42574 - BLOCK
      ?auto_42575 - BLOCK
      ?auto_42576 - BLOCK
      ?auto_42577 - BLOCK
    )
    :vars
    (
      ?auto_42578 - BLOCK
      ?auto_42579 - BLOCK
      ?auto_42580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42578 ?auto_42577 ) ( ON-TABLE ?auto_42574 ) ( ON ?auto_42575 ?auto_42574 ) ( ON ?auto_42576 ?auto_42575 ) ( ON ?auto_42577 ?auto_42576 ) ( not ( = ?auto_42574 ?auto_42575 ) ) ( not ( = ?auto_42574 ?auto_42576 ) ) ( not ( = ?auto_42574 ?auto_42577 ) ) ( not ( = ?auto_42574 ?auto_42578 ) ) ( not ( = ?auto_42575 ?auto_42576 ) ) ( not ( = ?auto_42575 ?auto_42577 ) ) ( not ( = ?auto_42575 ?auto_42578 ) ) ( not ( = ?auto_42576 ?auto_42577 ) ) ( not ( = ?auto_42576 ?auto_42578 ) ) ( not ( = ?auto_42577 ?auto_42578 ) ) ( not ( = ?auto_42574 ?auto_42579 ) ) ( not ( = ?auto_42574 ?auto_42580 ) ) ( not ( = ?auto_42575 ?auto_42579 ) ) ( not ( = ?auto_42575 ?auto_42580 ) ) ( not ( = ?auto_42576 ?auto_42579 ) ) ( not ( = ?auto_42576 ?auto_42580 ) ) ( not ( = ?auto_42577 ?auto_42579 ) ) ( not ( = ?auto_42577 ?auto_42580 ) ) ( not ( = ?auto_42578 ?auto_42579 ) ) ( not ( = ?auto_42578 ?auto_42580 ) ) ( not ( = ?auto_42579 ?auto_42580 ) ) ( ON ?auto_42579 ?auto_42578 ) ( ON ?auto_42580 ?auto_42579 ) ( CLEAR ?auto_42580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42574 ?auto_42575 ?auto_42576 ?auto_42577 ?auto_42578 ?auto_42579 )
      ( MAKE-4PILE ?auto_42574 ?auto_42575 ?auto_42576 ?auto_42577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42584 - BLOCK
      ?auto_42585 - BLOCK
      ?auto_42586 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42586 ) ( CLEAR ?auto_42585 ) ( ON-TABLE ?auto_42584 ) ( ON ?auto_42585 ?auto_42584 ) ( not ( = ?auto_42584 ?auto_42585 ) ) ( not ( = ?auto_42584 ?auto_42586 ) ) ( not ( = ?auto_42585 ?auto_42586 ) ) )
    :subtasks
    ( ( !STACK ?auto_42586 ?auto_42585 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42587 - BLOCK
      ?auto_42588 - BLOCK
      ?auto_42589 - BLOCK
    )
    :vars
    (
      ?auto_42590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42588 ) ( ON-TABLE ?auto_42587 ) ( ON ?auto_42588 ?auto_42587 ) ( not ( = ?auto_42587 ?auto_42588 ) ) ( not ( = ?auto_42587 ?auto_42589 ) ) ( not ( = ?auto_42588 ?auto_42589 ) ) ( ON ?auto_42589 ?auto_42590 ) ( CLEAR ?auto_42589 ) ( HAND-EMPTY ) ( not ( = ?auto_42587 ?auto_42590 ) ) ( not ( = ?auto_42588 ?auto_42590 ) ) ( not ( = ?auto_42589 ?auto_42590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42589 ?auto_42590 )
      ( MAKE-3PILE ?auto_42587 ?auto_42588 ?auto_42589 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42591 - BLOCK
      ?auto_42592 - BLOCK
      ?auto_42593 - BLOCK
    )
    :vars
    (
      ?auto_42594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42591 ) ( not ( = ?auto_42591 ?auto_42592 ) ) ( not ( = ?auto_42591 ?auto_42593 ) ) ( not ( = ?auto_42592 ?auto_42593 ) ) ( ON ?auto_42593 ?auto_42594 ) ( CLEAR ?auto_42593 ) ( not ( = ?auto_42591 ?auto_42594 ) ) ( not ( = ?auto_42592 ?auto_42594 ) ) ( not ( = ?auto_42593 ?auto_42594 ) ) ( HOLDING ?auto_42592 ) ( CLEAR ?auto_42591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42591 ?auto_42592 )
      ( MAKE-3PILE ?auto_42591 ?auto_42592 ?auto_42593 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42595 - BLOCK
      ?auto_42596 - BLOCK
      ?auto_42597 - BLOCK
    )
    :vars
    (
      ?auto_42598 - BLOCK
      ?auto_42601 - BLOCK
      ?auto_42600 - BLOCK
      ?auto_42599 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42595 ) ( not ( = ?auto_42595 ?auto_42596 ) ) ( not ( = ?auto_42595 ?auto_42597 ) ) ( not ( = ?auto_42596 ?auto_42597 ) ) ( ON ?auto_42597 ?auto_42598 ) ( not ( = ?auto_42595 ?auto_42598 ) ) ( not ( = ?auto_42596 ?auto_42598 ) ) ( not ( = ?auto_42597 ?auto_42598 ) ) ( CLEAR ?auto_42595 ) ( ON ?auto_42596 ?auto_42597 ) ( CLEAR ?auto_42596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42601 ) ( ON ?auto_42600 ?auto_42601 ) ( ON ?auto_42599 ?auto_42600 ) ( ON ?auto_42598 ?auto_42599 ) ( not ( = ?auto_42601 ?auto_42600 ) ) ( not ( = ?auto_42601 ?auto_42599 ) ) ( not ( = ?auto_42601 ?auto_42598 ) ) ( not ( = ?auto_42601 ?auto_42597 ) ) ( not ( = ?auto_42601 ?auto_42596 ) ) ( not ( = ?auto_42600 ?auto_42599 ) ) ( not ( = ?auto_42600 ?auto_42598 ) ) ( not ( = ?auto_42600 ?auto_42597 ) ) ( not ( = ?auto_42600 ?auto_42596 ) ) ( not ( = ?auto_42599 ?auto_42598 ) ) ( not ( = ?auto_42599 ?auto_42597 ) ) ( not ( = ?auto_42599 ?auto_42596 ) ) ( not ( = ?auto_42595 ?auto_42601 ) ) ( not ( = ?auto_42595 ?auto_42600 ) ) ( not ( = ?auto_42595 ?auto_42599 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42601 ?auto_42600 ?auto_42599 ?auto_42598 ?auto_42597 )
      ( MAKE-3PILE ?auto_42595 ?auto_42596 ?auto_42597 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42602 - BLOCK
      ?auto_42603 - BLOCK
      ?auto_42604 - BLOCK
    )
    :vars
    (
      ?auto_42607 - BLOCK
      ?auto_42608 - BLOCK
      ?auto_42605 - BLOCK
      ?auto_42606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42602 ?auto_42603 ) ) ( not ( = ?auto_42602 ?auto_42604 ) ) ( not ( = ?auto_42603 ?auto_42604 ) ) ( ON ?auto_42604 ?auto_42607 ) ( not ( = ?auto_42602 ?auto_42607 ) ) ( not ( = ?auto_42603 ?auto_42607 ) ) ( not ( = ?auto_42604 ?auto_42607 ) ) ( ON ?auto_42603 ?auto_42604 ) ( CLEAR ?auto_42603 ) ( ON-TABLE ?auto_42608 ) ( ON ?auto_42605 ?auto_42608 ) ( ON ?auto_42606 ?auto_42605 ) ( ON ?auto_42607 ?auto_42606 ) ( not ( = ?auto_42608 ?auto_42605 ) ) ( not ( = ?auto_42608 ?auto_42606 ) ) ( not ( = ?auto_42608 ?auto_42607 ) ) ( not ( = ?auto_42608 ?auto_42604 ) ) ( not ( = ?auto_42608 ?auto_42603 ) ) ( not ( = ?auto_42605 ?auto_42606 ) ) ( not ( = ?auto_42605 ?auto_42607 ) ) ( not ( = ?auto_42605 ?auto_42604 ) ) ( not ( = ?auto_42605 ?auto_42603 ) ) ( not ( = ?auto_42606 ?auto_42607 ) ) ( not ( = ?auto_42606 ?auto_42604 ) ) ( not ( = ?auto_42606 ?auto_42603 ) ) ( not ( = ?auto_42602 ?auto_42608 ) ) ( not ( = ?auto_42602 ?auto_42605 ) ) ( not ( = ?auto_42602 ?auto_42606 ) ) ( HOLDING ?auto_42602 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42602 )
      ( MAKE-3PILE ?auto_42602 ?auto_42603 ?auto_42604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42609 - BLOCK
      ?auto_42610 - BLOCK
      ?auto_42611 - BLOCK
    )
    :vars
    (
      ?auto_42614 - BLOCK
      ?auto_42615 - BLOCK
      ?auto_42613 - BLOCK
      ?auto_42612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42609 ?auto_42610 ) ) ( not ( = ?auto_42609 ?auto_42611 ) ) ( not ( = ?auto_42610 ?auto_42611 ) ) ( ON ?auto_42611 ?auto_42614 ) ( not ( = ?auto_42609 ?auto_42614 ) ) ( not ( = ?auto_42610 ?auto_42614 ) ) ( not ( = ?auto_42611 ?auto_42614 ) ) ( ON ?auto_42610 ?auto_42611 ) ( ON-TABLE ?auto_42615 ) ( ON ?auto_42613 ?auto_42615 ) ( ON ?auto_42612 ?auto_42613 ) ( ON ?auto_42614 ?auto_42612 ) ( not ( = ?auto_42615 ?auto_42613 ) ) ( not ( = ?auto_42615 ?auto_42612 ) ) ( not ( = ?auto_42615 ?auto_42614 ) ) ( not ( = ?auto_42615 ?auto_42611 ) ) ( not ( = ?auto_42615 ?auto_42610 ) ) ( not ( = ?auto_42613 ?auto_42612 ) ) ( not ( = ?auto_42613 ?auto_42614 ) ) ( not ( = ?auto_42613 ?auto_42611 ) ) ( not ( = ?auto_42613 ?auto_42610 ) ) ( not ( = ?auto_42612 ?auto_42614 ) ) ( not ( = ?auto_42612 ?auto_42611 ) ) ( not ( = ?auto_42612 ?auto_42610 ) ) ( not ( = ?auto_42609 ?auto_42615 ) ) ( not ( = ?auto_42609 ?auto_42613 ) ) ( not ( = ?auto_42609 ?auto_42612 ) ) ( ON ?auto_42609 ?auto_42610 ) ( CLEAR ?auto_42609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42615 ?auto_42613 ?auto_42612 ?auto_42614 ?auto_42611 ?auto_42610 )
      ( MAKE-3PILE ?auto_42609 ?auto_42610 ?auto_42611 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42619 - BLOCK
      ?auto_42620 - BLOCK
      ?auto_42621 - BLOCK
    )
    :vars
    (
      ?auto_42622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42622 ?auto_42621 ) ( CLEAR ?auto_42622 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42619 ) ( ON ?auto_42620 ?auto_42619 ) ( ON ?auto_42621 ?auto_42620 ) ( not ( = ?auto_42619 ?auto_42620 ) ) ( not ( = ?auto_42619 ?auto_42621 ) ) ( not ( = ?auto_42619 ?auto_42622 ) ) ( not ( = ?auto_42620 ?auto_42621 ) ) ( not ( = ?auto_42620 ?auto_42622 ) ) ( not ( = ?auto_42621 ?auto_42622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42622 ?auto_42621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42623 - BLOCK
      ?auto_42624 - BLOCK
      ?auto_42625 - BLOCK
    )
    :vars
    (
      ?auto_42626 - BLOCK
      ?auto_42627 - BLOCK
      ?auto_42628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42626 ?auto_42625 ) ( CLEAR ?auto_42626 ) ( ON-TABLE ?auto_42623 ) ( ON ?auto_42624 ?auto_42623 ) ( ON ?auto_42625 ?auto_42624 ) ( not ( = ?auto_42623 ?auto_42624 ) ) ( not ( = ?auto_42623 ?auto_42625 ) ) ( not ( = ?auto_42623 ?auto_42626 ) ) ( not ( = ?auto_42624 ?auto_42625 ) ) ( not ( = ?auto_42624 ?auto_42626 ) ) ( not ( = ?auto_42625 ?auto_42626 ) ) ( HOLDING ?auto_42627 ) ( CLEAR ?auto_42628 ) ( not ( = ?auto_42623 ?auto_42627 ) ) ( not ( = ?auto_42623 ?auto_42628 ) ) ( not ( = ?auto_42624 ?auto_42627 ) ) ( not ( = ?auto_42624 ?auto_42628 ) ) ( not ( = ?auto_42625 ?auto_42627 ) ) ( not ( = ?auto_42625 ?auto_42628 ) ) ( not ( = ?auto_42626 ?auto_42627 ) ) ( not ( = ?auto_42626 ?auto_42628 ) ) ( not ( = ?auto_42627 ?auto_42628 ) ) )
    :subtasks
    ( ( !STACK ?auto_42627 ?auto_42628 )
      ( MAKE-3PILE ?auto_42623 ?auto_42624 ?auto_42625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42629 - BLOCK
      ?auto_42630 - BLOCK
      ?auto_42631 - BLOCK
    )
    :vars
    (
      ?auto_42633 - BLOCK
      ?auto_42634 - BLOCK
      ?auto_42632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42633 ?auto_42631 ) ( ON-TABLE ?auto_42629 ) ( ON ?auto_42630 ?auto_42629 ) ( ON ?auto_42631 ?auto_42630 ) ( not ( = ?auto_42629 ?auto_42630 ) ) ( not ( = ?auto_42629 ?auto_42631 ) ) ( not ( = ?auto_42629 ?auto_42633 ) ) ( not ( = ?auto_42630 ?auto_42631 ) ) ( not ( = ?auto_42630 ?auto_42633 ) ) ( not ( = ?auto_42631 ?auto_42633 ) ) ( CLEAR ?auto_42634 ) ( not ( = ?auto_42629 ?auto_42632 ) ) ( not ( = ?auto_42629 ?auto_42634 ) ) ( not ( = ?auto_42630 ?auto_42632 ) ) ( not ( = ?auto_42630 ?auto_42634 ) ) ( not ( = ?auto_42631 ?auto_42632 ) ) ( not ( = ?auto_42631 ?auto_42634 ) ) ( not ( = ?auto_42633 ?auto_42632 ) ) ( not ( = ?auto_42633 ?auto_42634 ) ) ( not ( = ?auto_42632 ?auto_42634 ) ) ( ON ?auto_42632 ?auto_42633 ) ( CLEAR ?auto_42632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42629 ?auto_42630 ?auto_42631 ?auto_42633 )
      ( MAKE-3PILE ?auto_42629 ?auto_42630 ?auto_42631 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42635 - BLOCK
      ?auto_42636 - BLOCK
      ?auto_42637 - BLOCK
    )
    :vars
    (
      ?auto_42639 - BLOCK
      ?auto_42640 - BLOCK
      ?auto_42638 - BLOCK
      ?auto_42641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42639 ?auto_42637 ) ( ON-TABLE ?auto_42635 ) ( ON ?auto_42636 ?auto_42635 ) ( ON ?auto_42637 ?auto_42636 ) ( not ( = ?auto_42635 ?auto_42636 ) ) ( not ( = ?auto_42635 ?auto_42637 ) ) ( not ( = ?auto_42635 ?auto_42639 ) ) ( not ( = ?auto_42636 ?auto_42637 ) ) ( not ( = ?auto_42636 ?auto_42639 ) ) ( not ( = ?auto_42637 ?auto_42639 ) ) ( not ( = ?auto_42635 ?auto_42640 ) ) ( not ( = ?auto_42635 ?auto_42638 ) ) ( not ( = ?auto_42636 ?auto_42640 ) ) ( not ( = ?auto_42636 ?auto_42638 ) ) ( not ( = ?auto_42637 ?auto_42640 ) ) ( not ( = ?auto_42637 ?auto_42638 ) ) ( not ( = ?auto_42639 ?auto_42640 ) ) ( not ( = ?auto_42639 ?auto_42638 ) ) ( not ( = ?auto_42640 ?auto_42638 ) ) ( ON ?auto_42640 ?auto_42639 ) ( CLEAR ?auto_42640 ) ( HOLDING ?auto_42638 ) ( CLEAR ?auto_42641 ) ( ON-TABLE ?auto_42641 ) ( not ( = ?auto_42641 ?auto_42638 ) ) ( not ( = ?auto_42635 ?auto_42641 ) ) ( not ( = ?auto_42636 ?auto_42641 ) ) ( not ( = ?auto_42637 ?auto_42641 ) ) ( not ( = ?auto_42639 ?auto_42641 ) ) ( not ( = ?auto_42640 ?auto_42641 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42641 ?auto_42638 )
      ( MAKE-3PILE ?auto_42635 ?auto_42636 ?auto_42637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43333 - BLOCK
      ?auto_43334 - BLOCK
      ?auto_43335 - BLOCK
    )
    :vars
    (
      ?auto_43338 - BLOCK
      ?auto_43337 - BLOCK
      ?auto_43336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43338 ?auto_43335 ) ( ON-TABLE ?auto_43333 ) ( ON ?auto_43334 ?auto_43333 ) ( ON ?auto_43335 ?auto_43334 ) ( not ( = ?auto_43333 ?auto_43334 ) ) ( not ( = ?auto_43333 ?auto_43335 ) ) ( not ( = ?auto_43333 ?auto_43338 ) ) ( not ( = ?auto_43334 ?auto_43335 ) ) ( not ( = ?auto_43334 ?auto_43338 ) ) ( not ( = ?auto_43335 ?auto_43338 ) ) ( not ( = ?auto_43333 ?auto_43337 ) ) ( not ( = ?auto_43333 ?auto_43336 ) ) ( not ( = ?auto_43334 ?auto_43337 ) ) ( not ( = ?auto_43334 ?auto_43336 ) ) ( not ( = ?auto_43335 ?auto_43337 ) ) ( not ( = ?auto_43335 ?auto_43336 ) ) ( not ( = ?auto_43338 ?auto_43337 ) ) ( not ( = ?auto_43338 ?auto_43336 ) ) ( not ( = ?auto_43337 ?auto_43336 ) ) ( ON ?auto_43337 ?auto_43338 ) ( ON ?auto_43336 ?auto_43337 ) ( CLEAR ?auto_43336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43333 ?auto_43334 ?auto_43335 ?auto_43338 ?auto_43337 )
      ( MAKE-3PILE ?auto_43333 ?auto_43334 ?auto_43335 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42649 - BLOCK
      ?auto_42650 - BLOCK
      ?auto_42651 - BLOCK
    )
    :vars
    (
      ?auto_42654 - BLOCK
      ?auto_42652 - BLOCK
      ?auto_42653 - BLOCK
      ?auto_42655 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42654 ?auto_42651 ) ( ON-TABLE ?auto_42649 ) ( ON ?auto_42650 ?auto_42649 ) ( ON ?auto_42651 ?auto_42650 ) ( not ( = ?auto_42649 ?auto_42650 ) ) ( not ( = ?auto_42649 ?auto_42651 ) ) ( not ( = ?auto_42649 ?auto_42654 ) ) ( not ( = ?auto_42650 ?auto_42651 ) ) ( not ( = ?auto_42650 ?auto_42654 ) ) ( not ( = ?auto_42651 ?auto_42654 ) ) ( not ( = ?auto_42649 ?auto_42652 ) ) ( not ( = ?auto_42649 ?auto_42653 ) ) ( not ( = ?auto_42650 ?auto_42652 ) ) ( not ( = ?auto_42650 ?auto_42653 ) ) ( not ( = ?auto_42651 ?auto_42652 ) ) ( not ( = ?auto_42651 ?auto_42653 ) ) ( not ( = ?auto_42654 ?auto_42652 ) ) ( not ( = ?auto_42654 ?auto_42653 ) ) ( not ( = ?auto_42652 ?auto_42653 ) ) ( ON ?auto_42652 ?auto_42654 ) ( not ( = ?auto_42655 ?auto_42653 ) ) ( not ( = ?auto_42649 ?auto_42655 ) ) ( not ( = ?auto_42650 ?auto_42655 ) ) ( not ( = ?auto_42651 ?auto_42655 ) ) ( not ( = ?auto_42654 ?auto_42655 ) ) ( not ( = ?auto_42652 ?auto_42655 ) ) ( ON ?auto_42653 ?auto_42652 ) ( CLEAR ?auto_42653 ) ( HOLDING ?auto_42655 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42655 )
      ( MAKE-3PILE ?auto_42649 ?auto_42650 ?auto_42651 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_42656 - BLOCK
      ?auto_42657 - BLOCK
      ?auto_42658 - BLOCK
    )
    :vars
    (
      ?auto_42662 - BLOCK
      ?auto_42659 - BLOCK
      ?auto_42661 - BLOCK
      ?auto_42660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42662 ?auto_42658 ) ( ON-TABLE ?auto_42656 ) ( ON ?auto_42657 ?auto_42656 ) ( ON ?auto_42658 ?auto_42657 ) ( not ( = ?auto_42656 ?auto_42657 ) ) ( not ( = ?auto_42656 ?auto_42658 ) ) ( not ( = ?auto_42656 ?auto_42662 ) ) ( not ( = ?auto_42657 ?auto_42658 ) ) ( not ( = ?auto_42657 ?auto_42662 ) ) ( not ( = ?auto_42658 ?auto_42662 ) ) ( not ( = ?auto_42656 ?auto_42659 ) ) ( not ( = ?auto_42656 ?auto_42661 ) ) ( not ( = ?auto_42657 ?auto_42659 ) ) ( not ( = ?auto_42657 ?auto_42661 ) ) ( not ( = ?auto_42658 ?auto_42659 ) ) ( not ( = ?auto_42658 ?auto_42661 ) ) ( not ( = ?auto_42662 ?auto_42659 ) ) ( not ( = ?auto_42662 ?auto_42661 ) ) ( not ( = ?auto_42659 ?auto_42661 ) ) ( ON ?auto_42659 ?auto_42662 ) ( not ( = ?auto_42660 ?auto_42661 ) ) ( not ( = ?auto_42656 ?auto_42660 ) ) ( not ( = ?auto_42657 ?auto_42660 ) ) ( not ( = ?auto_42658 ?auto_42660 ) ) ( not ( = ?auto_42662 ?auto_42660 ) ) ( not ( = ?auto_42659 ?auto_42660 ) ) ( ON ?auto_42661 ?auto_42659 ) ( ON ?auto_42660 ?auto_42661 ) ( CLEAR ?auto_42660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42656 ?auto_42657 ?auto_42658 ?auto_42662 ?auto_42659 ?auto_42661 )
      ( MAKE-3PILE ?auto_42656 ?auto_42657 ?auto_42658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42667 - BLOCK
      ?auto_42668 - BLOCK
      ?auto_42669 - BLOCK
      ?auto_42670 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42670 ) ( CLEAR ?auto_42669 ) ( ON-TABLE ?auto_42667 ) ( ON ?auto_42668 ?auto_42667 ) ( ON ?auto_42669 ?auto_42668 ) ( not ( = ?auto_42667 ?auto_42668 ) ) ( not ( = ?auto_42667 ?auto_42669 ) ) ( not ( = ?auto_42667 ?auto_42670 ) ) ( not ( = ?auto_42668 ?auto_42669 ) ) ( not ( = ?auto_42668 ?auto_42670 ) ) ( not ( = ?auto_42669 ?auto_42670 ) ) )
    :subtasks
    ( ( !STACK ?auto_42670 ?auto_42669 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42671 - BLOCK
      ?auto_42672 - BLOCK
      ?auto_42673 - BLOCK
      ?auto_42674 - BLOCK
    )
    :vars
    (
      ?auto_42675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42673 ) ( ON-TABLE ?auto_42671 ) ( ON ?auto_42672 ?auto_42671 ) ( ON ?auto_42673 ?auto_42672 ) ( not ( = ?auto_42671 ?auto_42672 ) ) ( not ( = ?auto_42671 ?auto_42673 ) ) ( not ( = ?auto_42671 ?auto_42674 ) ) ( not ( = ?auto_42672 ?auto_42673 ) ) ( not ( = ?auto_42672 ?auto_42674 ) ) ( not ( = ?auto_42673 ?auto_42674 ) ) ( ON ?auto_42674 ?auto_42675 ) ( CLEAR ?auto_42674 ) ( HAND-EMPTY ) ( not ( = ?auto_42671 ?auto_42675 ) ) ( not ( = ?auto_42672 ?auto_42675 ) ) ( not ( = ?auto_42673 ?auto_42675 ) ) ( not ( = ?auto_42674 ?auto_42675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42674 ?auto_42675 )
      ( MAKE-4PILE ?auto_42671 ?auto_42672 ?auto_42673 ?auto_42674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42676 - BLOCK
      ?auto_42677 - BLOCK
      ?auto_42678 - BLOCK
      ?auto_42679 - BLOCK
    )
    :vars
    (
      ?auto_42680 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42676 ) ( ON ?auto_42677 ?auto_42676 ) ( not ( = ?auto_42676 ?auto_42677 ) ) ( not ( = ?auto_42676 ?auto_42678 ) ) ( not ( = ?auto_42676 ?auto_42679 ) ) ( not ( = ?auto_42677 ?auto_42678 ) ) ( not ( = ?auto_42677 ?auto_42679 ) ) ( not ( = ?auto_42678 ?auto_42679 ) ) ( ON ?auto_42679 ?auto_42680 ) ( CLEAR ?auto_42679 ) ( not ( = ?auto_42676 ?auto_42680 ) ) ( not ( = ?auto_42677 ?auto_42680 ) ) ( not ( = ?auto_42678 ?auto_42680 ) ) ( not ( = ?auto_42679 ?auto_42680 ) ) ( HOLDING ?auto_42678 ) ( CLEAR ?auto_42677 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42676 ?auto_42677 ?auto_42678 )
      ( MAKE-4PILE ?auto_42676 ?auto_42677 ?auto_42678 ?auto_42679 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42681 - BLOCK
      ?auto_42682 - BLOCK
      ?auto_42683 - BLOCK
      ?auto_42684 - BLOCK
    )
    :vars
    (
      ?auto_42685 - BLOCK
      ?auto_42687 - BLOCK
      ?auto_42686 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42681 ) ( ON ?auto_42682 ?auto_42681 ) ( not ( = ?auto_42681 ?auto_42682 ) ) ( not ( = ?auto_42681 ?auto_42683 ) ) ( not ( = ?auto_42681 ?auto_42684 ) ) ( not ( = ?auto_42682 ?auto_42683 ) ) ( not ( = ?auto_42682 ?auto_42684 ) ) ( not ( = ?auto_42683 ?auto_42684 ) ) ( ON ?auto_42684 ?auto_42685 ) ( not ( = ?auto_42681 ?auto_42685 ) ) ( not ( = ?auto_42682 ?auto_42685 ) ) ( not ( = ?auto_42683 ?auto_42685 ) ) ( not ( = ?auto_42684 ?auto_42685 ) ) ( CLEAR ?auto_42682 ) ( ON ?auto_42683 ?auto_42684 ) ( CLEAR ?auto_42683 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42687 ) ( ON ?auto_42686 ?auto_42687 ) ( ON ?auto_42685 ?auto_42686 ) ( not ( = ?auto_42687 ?auto_42686 ) ) ( not ( = ?auto_42687 ?auto_42685 ) ) ( not ( = ?auto_42687 ?auto_42684 ) ) ( not ( = ?auto_42687 ?auto_42683 ) ) ( not ( = ?auto_42686 ?auto_42685 ) ) ( not ( = ?auto_42686 ?auto_42684 ) ) ( not ( = ?auto_42686 ?auto_42683 ) ) ( not ( = ?auto_42681 ?auto_42687 ) ) ( not ( = ?auto_42681 ?auto_42686 ) ) ( not ( = ?auto_42682 ?auto_42687 ) ) ( not ( = ?auto_42682 ?auto_42686 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42687 ?auto_42686 ?auto_42685 ?auto_42684 )
      ( MAKE-4PILE ?auto_42681 ?auto_42682 ?auto_42683 ?auto_42684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42688 - BLOCK
      ?auto_42689 - BLOCK
      ?auto_42690 - BLOCK
      ?auto_42691 - BLOCK
    )
    :vars
    (
      ?auto_42694 - BLOCK
      ?auto_42692 - BLOCK
      ?auto_42693 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42688 ) ( not ( = ?auto_42688 ?auto_42689 ) ) ( not ( = ?auto_42688 ?auto_42690 ) ) ( not ( = ?auto_42688 ?auto_42691 ) ) ( not ( = ?auto_42689 ?auto_42690 ) ) ( not ( = ?auto_42689 ?auto_42691 ) ) ( not ( = ?auto_42690 ?auto_42691 ) ) ( ON ?auto_42691 ?auto_42694 ) ( not ( = ?auto_42688 ?auto_42694 ) ) ( not ( = ?auto_42689 ?auto_42694 ) ) ( not ( = ?auto_42690 ?auto_42694 ) ) ( not ( = ?auto_42691 ?auto_42694 ) ) ( ON ?auto_42690 ?auto_42691 ) ( CLEAR ?auto_42690 ) ( ON-TABLE ?auto_42692 ) ( ON ?auto_42693 ?auto_42692 ) ( ON ?auto_42694 ?auto_42693 ) ( not ( = ?auto_42692 ?auto_42693 ) ) ( not ( = ?auto_42692 ?auto_42694 ) ) ( not ( = ?auto_42692 ?auto_42691 ) ) ( not ( = ?auto_42692 ?auto_42690 ) ) ( not ( = ?auto_42693 ?auto_42694 ) ) ( not ( = ?auto_42693 ?auto_42691 ) ) ( not ( = ?auto_42693 ?auto_42690 ) ) ( not ( = ?auto_42688 ?auto_42692 ) ) ( not ( = ?auto_42688 ?auto_42693 ) ) ( not ( = ?auto_42689 ?auto_42692 ) ) ( not ( = ?auto_42689 ?auto_42693 ) ) ( HOLDING ?auto_42689 ) ( CLEAR ?auto_42688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42688 ?auto_42689 )
      ( MAKE-4PILE ?auto_42688 ?auto_42689 ?auto_42690 ?auto_42691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42695 - BLOCK
      ?auto_42696 - BLOCK
      ?auto_42697 - BLOCK
      ?auto_42698 - BLOCK
    )
    :vars
    (
      ?auto_42701 - BLOCK
      ?auto_42700 - BLOCK
      ?auto_42699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42695 ) ( not ( = ?auto_42695 ?auto_42696 ) ) ( not ( = ?auto_42695 ?auto_42697 ) ) ( not ( = ?auto_42695 ?auto_42698 ) ) ( not ( = ?auto_42696 ?auto_42697 ) ) ( not ( = ?auto_42696 ?auto_42698 ) ) ( not ( = ?auto_42697 ?auto_42698 ) ) ( ON ?auto_42698 ?auto_42701 ) ( not ( = ?auto_42695 ?auto_42701 ) ) ( not ( = ?auto_42696 ?auto_42701 ) ) ( not ( = ?auto_42697 ?auto_42701 ) ) ( not ( = ?auto_42698 ?auto_42701 ) ) ( ON ?auto_42697 ?auto_42698 ) ( ON-TABLE ?auto_42700 ) ( ON ?auto_42699 ?auto_42700 ) ( ON ?auto_42701 ?auto_42699 ) ( not ( = ?auto_42700 ?auto_42699 ) ) ( not ( = ?auto_42700 ?auto_42701 ) ) ( not ( = ?auto_42700 ?auto_42698 ) ) ( not ( = ?auto_42700 ?auto_42697 ) ) ( not ( = ?auto_42699 ?auto_42701 ) ) ( not ( = ?auto_42699 ?auto_42698 ) ) ( not ( = ?auto_42699 ?auto_42697 ) ) ( not ( = ?auto_42695 ?auto_42700 ) ) ( not ( = ?auto_42695 ?auto_42699 ) ) ( not ( = ?auto_42696 ?auto_42700 ) ) ( not ( = ?auto_42696 ?auto_42699 ) ) ( CLEAR ?auto_42695 ) ( ON ?auto_42696 ?auto_42697 ) ( CLEAR ?auto_42696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42700 ?auto_42699 ?auto_42701 ?auto_42698 ?auto_42697 )
      ( MAKE-4PILE ?auto_42695 ?auto_42696 ?auto_42697 ?auto_42698 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42702 - BLOCK
      ?auto_42703 - BLOCK
      ?auto_42704 - BLOCK
      ?auto_42705 - BLOCK
    )
    :vars
    (
      ?auto_42706 - BLOCK
      ?auto_42707 - BLOCK
      ?auto_42708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42702 ?auto_42703 ) ) ( not ( = ?auto_42702 ?auto_42704 ) ) ( not ( = ?auto_42702 ?auto_42705 ) ) ( not ( = ?auto_42703 ?auto_42704 ) ) ( not ( = ?auto_42703 ?auto_42705 ) ) ( not ( = ?auto_42704 ?auto_42705 ) ) ( ON ?auto_42705 ?auto_42706 ) ( not ( = ?auto_42702 ?auto_42706 ) ) ( not ( = ?auto_42703 ?auto_42706 ) ) ( not ( = ?auto_42704 ?auto_42706 ) ) ( not ( = ?auto_42705 ?auto_42706 ) ) ( ON ?auto_42704 ?auto_42705 ) ( ON-TABLE ?auto_42707 ) ( ON ?auto_42708 ?auto_42707 ) ( ON ?auto_42706 ?auto_42708 ) ( not ( = ?auto_42707 ?auto_42708 ) ) ( not ( = ?auto_42707 ?auto_42706 ) ) ( not ( = ?auto_42707 ?auto_42705 ) ) ( not ( = ?auto_42707 ?auto_42704 ) ) ( not ( = ?auto_42708 ?auto_42706 ) ) ( not ( = ?auto_42708 ?auto_42705 ) ) ( not ( = ?auto_42708 ?auto_42704 ) ) ( not ( = ?auto_42702 ?auto_42707 ) ) ( not ( = ?auto_42702 ?auto_42708 ) ) ( not ( = ?auto_42703 ?auto_42707 ) ) ( not ( = ?auto_42703 ?auto_42708 ) ) ( ON ?auto_42703 ?auto_42704 ) ( CLEAR ?auto_42703 ) ( HOLDING ?auto_42702 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42702 )
      ( MAKE-4PILE ?auto_42702 ?auto_42703 ?auto_42704 ?auto_42705 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_42709 - BLOCK
      ?auto_42710 - BLOCK
      ?auto_42711 - BLOCK
      ?auto_42712 - BLOCK
    )
    :vars
    (
      ?auto_42715 - BLOCK
      ?auto_42713 - BLOCK
      ?auto_42714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42709 ?auto_42710 ) ) ( not ( = ?auto_42709 ?auto_42711 ) ) ( not ( = ?auto_42709 ?auto_42712 ) ) ( not ( = ?auto_42710 ?auto_42711 ) ) ( not ( = ?auto_42710 ?auto_42712 ) ) ( not ( = ?auto_42711 ?auto_42712 ) ) ( ON ?auto_42712 ?auto_42715 ) ( not ( = ?auto_42709 ?auto_42715 ) ) ( not ( = ?auto_42710 ?auto_42715 ) ) ( not ( = ?auto_42711 ?auto_42715 ) ) ( not ( = ?auto_42712 ?auto_42715 ) ) ( ON ?auto_42711 ?auto_42712 ) ( ON-TABLE ?auto_42713 ) ( ON ?auto_42714 ?auto_42713 ) ( ON ?auto_42715 ?auto_42714 ) ( not ( = ?auto_42713 ?auto_42714 ) ) ( not ( = ?auto_42713 ?auto_42715 ) ) ( not ( = ?auto_42713 ?auto_42712 ) ) ( not ( = ?auto_42713 ?auto_42711 ) ) ( not ( = ?auto_42714 ?auto_42715 ) ) ( not ( = ?auto_42714 ?auto_42712 ) ) ( not ( = ?auto_42714 ?auto_42711 ) ) ( not ( = ?auto_42709 ?auto_42713 ) ) ( not ( = ?auto_42709 ?auto_42714 ) ) ( not ( = ?auto_42710 ?auto_42713 ) ) ( not ( = ?auto_42710 ?auto_42714 ) ) ( ON ?auto_42710 ?auto_42711 ) ( ON ?auto_42709 ?auto_42710 ) ( CLEAR ?auto_42709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42713 ?auto_42714 ?auto_42715 ?auto_42712 ?auto_42711 ?auto_42710 )
      ( MAKE-4PILE ?auto_42709 ?auto_42710 ?auto_42711 ?auto_42712 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42718 - BLOCK
      ?auto_42719 - BLOCK
    )
    :vars
    (
      ?auto_42720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42720 ?auto_42719 ) ( CLEAR ?auto_42720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42718 ) ( ON ?auto_42719 ?auto_42718 ) ( not ( = ?auto_42718 ?auto_42719 ) ) ( not ( = ?auto_42718 ?auto_42720 ) ) ( not ( = ?auto_42719 ?auto_42720 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42720 ?auto_42719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42721 - BLOCK
      ?auto_42722 - BLOCK
    )
    :vars
    (
      ?auto_42723 - BLOCK
      ?auto_42724 - BLOCK
      ?auto_42725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42723 ?auto_42722 ) ( CLEAR ?auto_42723 ) ( ON-TABLE ?auto_42721 ) ( ON ?auto_42722 ?auto_42721 ) ( not ( = ?auto_42721 ?auto_42722 ) ) ( not ( = ?auto_42721 ?auto_42723 ) ) ( not ( = ?auto_42722 ?auto_42723 ) ) ( HOLDING ?auto_42724 ) ( CLEAR ?auto_42725 ) ( not ( = ?auto_42721 ?auto_42724 ) ) ( not ( = ?auto_42721 ?auto_42725 ) ) ( not ( = ?auto_42722 ?auto_42724 ) ) ( not ( = ?auto_42722 ?auto_42725 ) ) ( not ( = ?auto_42723 ?auto_42724 ) ) ( not ( = ?auto_42723 ?auto_42725 ) ) ( not ( = ?auto_42724 ?auto_42725 ) ) )
    :subtasks
    ( ( !STACK ?auto_42724 ?auto_42725 )
      ( MAKE-2PILE ?auto_42721 ?auto_42722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42726 - BLOCK
      ?auto_42727 - BLOCK
    )
    :vars
    (
      ?auto_42728 - BLOCK
      ?auto_42730 - BLOCK
      ?auto_42729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42728 ?auto_42727 ) ( ON-TABLE ?auto_42726 ) ( ON ?auto_42727 ?auto_42726 ) ( not ( = ?auto_42726 ?auto_42727 ) ) ( not ( = ?auto_42726 ?auto_42728 ) ) ( not ( = ?auto_42727 ?auto_42728 ) ) ( CLEAR ?auto_42730 ) ( not ( = ?auto_42726 ?auto_42729 ) ) ( not ( = ?auto_42726 ?auto_42730 ) ) ( not ( = ?auto_42727 ?auto_42729 ) ) ( not ( = ?auto_42727 ?auto_42730 ) ) ( not ( = ?auto_42728 ?auto_42729 ) ) ( not ( = ?auto_42728 ?auto_42730 ) ) ( not ( = ?auto_42729 ?auto_42730 ) ) ( ON ?auto_42729 ?auto_42728 ) ( CLEAR ?auto_42729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42726 ?auto_42727 ?auto_42728 )
      ( MAKE-2PILE ?auto_42726 ?auto_42727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42731 - BLOCK
      ?auto_42732 - BLOCK
    )
    :vars
    (
      ?auto_42733 - BLOCK
      ?auto_42735 - BLOCK
      ?auto_42734 - BLOCK
      ?auto_42737 - BLOCK
      ?auto_42736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42733 ?auto_42732 ) ( ON-TABLE ?auto_42731 ) ( ON ?auto_42732 ?auto_42731 ) ( not ( = ?auto_42731 ?auto_42732 ) ) ( not ( = ?auto_42731 ?auto_42733 ) ) ( not ( = ?auto_42732 ?auto_42733 ) ) ( not ( = ?auto_42731 ?auto_42735 ) ) ( not ( = ?auto_42731 ?auto_42734 ) ) ( not ( = ?auto_42732 ?auto_42735 ) ) ( not ( = ?auto_42732 ?auto_42734 ) ) ( not ( = ?auto_42733 ?auto_42735 ) ) ( not ( = ?auto_42733 ?auto_42734 ) ) ( not ( = ?auto_42735 ?auto_42734 ) ) ( ON ?auto_42735 ?auto_42733 ) ( CLEAR ?auto_42735 ) ( HOLDING ?auto_42734 ) ( CLEAR ?auto_42737 ) ( ON-TABLE ?auto_42736 ) ( ON ?auto_42737 ?auto_42736 ) ( not ( = ?auto_42736 ?auto_42737 ) ) ( not ( = ?auto_42736 ?auto_42734 ) ) ( not ( = ?auto_42737 ?auto_42734 ) ) ( not ( = ?auto_42731 ?auto_42737 ) ) ( not ( = ?auto_42731 ?auto_42736 ) ) ( not ( = ?auto_42732 ?auto_42737 ) ) ( not ( = ?auto_42732 ?auto_42736 ) ) ( not ( = ?auto_42733 ?auto_42737 ) ) ( not ( = ?auto_42733 ?auto_42736 ) ) ( not ( = ?auto_42735 ?auto_42737 ) ) ( not ( = ?auto_42735 ?auto_42736 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42736 ?auto_42737 ?auto_42734 )
      ( MAKE-2PILE ?auto_42731 ?auto_42732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42738 - BLOCK
      ?auto_42739 - BLOCK
    )
    :vars
    (
      ?auto_42744 - BLOCK
      ?auto_42743 - BLOCK
      ?auto_42740 - BLOCK
      ?auto_42741 - BLOCK
      ?auto_42742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42744 ?auto_42739 ) ( ON-TABLE ?auto_42738 ) ( ON ?auto_42739 ?auto_42738 ) ( not ( = ?auto_42738 ?auto_42739 ) ) ( not ( = ?auto_42738 ?auto_42744 ) ) ( not ( = ?auto_42739 ?auto_42744 ) ) ( not ( = ?auto_42738 ?auto_42743 ) ) ( not ( = ?auto_42738 ?auto_42740 ) ) ( not ( = ?auto_42739 ?auto_42743 ) ) ( not ( = ?auto_42739 ?auto_42740 ) ) ( not ( = ?auto_42744 ?auto_42743 ) ) ( not ( = ?auto_42744 ?auto_42740 ) ) ( not ( = ?auto_42743 ?auto_42740 ) ) ( ON ?auto_42743 ?auto_42744 ) ( CLEAR ?auto_42741 ) ( ON-TABLE ?auto_42742 ) ( ON ?auto_42741 ?auto_42742 ) ( not ( = ?auto_42742 ?auto_42741 ) ) ( not ( = ?auto_42742 ?auto_42740 ) ) ( not ( = ?auto_42741 ?auto_42740 ) ) ( not ( = ?auto_42738 ?auto_42741 ) ) ( not ( = ?auto_42738 ?auto_42742 ) ) ( not ( = ?auto_42739 ?auto_42741 ) ) ( not ( = ?auto_42739 ?auto_42742 ) ) ( not ( = ?auto_42744 ?auto_42741 ) ) ( not ( = ?auto_42744 ?auto_42742 ) ) ( not ( = ?auto_42743 ?auto_42741 ) ) ( not ( = ?auto_42743 ?auto_42742 ) ) ( ON ?auto_42740 ?auto_42743 ) ( CLEAR ?auto_42740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42738 ?auto_42739 ?auto_42744 ?auto_42743 )
      ( MAKE-2PILE ?auto_42738 ?auto_42739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42745 - BLOCK
      ?auto_42746 - BLOCK
    )
    :vars
    (
      ?auto_42750 - BLOCK
      ?auto_42748 - BLOCK
      ?auto_42747 - BLOCK
      ?auto_42749 - BLOCK
      ?auto_42751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42750 ?auto_42746 ) ( ON-TABLE ?auto_42745 ) ( ON ?auto_42746 ?auto_42745 ) ( not ( = ?auto_42745 ?auto_42746 ) ) ( not ( = ?auto_42745 ?auto_42750 ) ) ( not ( = ?auto_42746 ?auto_42750 ) ) ( not ( = ?auto_42745 ?auto_42748 ) ) ( not ( = ?auto_42745 ?auto_42747 ) ) ( not ( = ?auto_42746 ?auto_42748 ) ) ( not ( = ?auto_42746 ?auto_42747 ) ) ( not ( = ?auto_42750 ?auto_42748 ) ) ( not ( = ?auto_42750 ?auto_42747 ) ) ( not ( = ?auto_42748 ?auto_42747 ) ) ( ON ?auto_42748 ?auto_42750 ) ( ON-TABLE ?auto_42749 ) ( not ( = ?auto_42749 ?auto_42751 ) ) ( not ( = ?auto_42749 ?auto_42747 ) ) ( not ( = ?auto_42751 ?auto_42747 ) ) ( not ( = ?auto_42745 ?auto_42751 ) ) ( not ( = ?auto_42745 ?auto_42749 ) ) ( not ( = ?auto_42746 ?auto_42751 ) ) ( not ( = ?auto_42746 ?auto_42749 ) ) ( not ( = ?auto_42750 ?auto_42751 ) ) ( not ( = ?auto_42750 ?auto_42749 ) ) ( not ( = ?auto_42748 ?auto_42751 ) ) ( not ( = ?auto_42748 ?auto_42749 ) ) ( ON ?auto_42747 ?auto_42748 ) ( CLEAR ?auto_42747 ) ( HOLDING ?auto_42751 ) ( CLEAR ?auto_42749 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42749 ?auto_42751 )
      ( MAKE-2PILE ?auto_42745 ?auto_42746 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43523 - BLOCK
      ?auto_43524 - BLOCK
    )
    :vars
    (
      ?auto_43527 - BLOCK
      ?auto_43526 - BLOCK
      ?auto_43525 - BLOCK
      ?auto_43528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43527 ?auto_43524 ) ( ON-TABLE ?auto_43523 ) ( ON ?auto_43524 ?auto_43523 ) ( not ( = ?auto_43523 ?auto_43524 ) ) ( not ( = ?auto_43523 ?auto_43527 ) ) ( not ( = ?auto_43524 ?auto_43527 ) ) ( not ( = ?auto_43523 ?auto_43526 ) ) ( not ( = ?auto_43523 ?auto_43525 ) ) ( not ( = ?auto_43524 ?auto_43526 ) ) ( not ( = ?auto_43524 ?auto_43525 ) ) ( not ( = ?auto_43527 ?auto_43526 ) ) ( not ( = ?auto_43527 ?auto_43525 ) ) ( not ( = ?auto_43526 ?auto_43525 ) ) ( ON ?auto_43526 ?auto_43527 ) ( not ( = ?auto_43528 ?auto_43525 ) ) ( not ( = ?auto_43523 ?auto_43528 ) ) ( not ( = ?auto_43524 ?auto_43528 ) ) ( not ( = ?auto_43527 ?auto_43528 ) ) ( not ( = ?auto_43526 ?auto_43528 ) ) ( ON ?auto_43525 ?auto_43526 ) ( ON ?auto_43528 ?auto_43525 ) ( CLEAR ?auto_43528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43523 ?auto_43524 ?auto_43527 ?auto_43526 ?auto_43525 )
      ( MAKE-2PILE ?auto_43523 ?auto_43524 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42759 - BLOCK
      ?auto_42760 - BLOCK
    )
    :vars
    (
      ?auto_42764 - BLOCK
      ?auto_42763 - BLOCK
      ?auto_42761 - BLOCK
      ?auto_42762 - BLOCK
      ?auto_42765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42764 ?auto_42760 ) ( ON-TABLE ?auto_42759 ) ( ON ?auto_42760 ?auto_42759 ) ( not ( = ?auto_42759 ?auto_42760 ) ) ( not ( = ?auto_42759 ?auto_42764 ) ) ( not ( = ?auto_42760 ?auto_42764 ) ) ( not ( = ?auto_42759 ?auto_42763 ) ) ( not ( = ?auto_42759 ?auto_42761 ) ) ( not ( = ?auto_42760 ?auto_42763 ) ) ( not ( = ?auto_42760 ?auto_42761 ) ) ( not ( = ?auto_42764 ?auto_42763 ) ) ( not ( = ?auto_42764 ?auto_42761 ) ) ( not ( = ?auto_42763 ?auto_42761 ) ) ( ON ?auto_42763 ?auto_42764 ) ( not ( = ?auto_42762 ?auto_42765 ) ) ( not ( = ?auto_42762 ?auto_42761 ) ) ( not ( = ?auto_42765 ?auto_42761 ) ) ( not ( = ?auto_42759 ?auto_42765 ) ) ( not ( = ?auto_42759 ?auto_42762 ) ) ( not ( = ?auto_42760 ?auto_42765 ) ) ( not ( = ?auto_42760 ?auto_42762 ) ) ( not ( = ?auto_42764 ?auto_42765 ) ) ( not ( = ?auto_42764 ?auto_42762 ) ) ( not ( = ?auto_42763 ?auto_42765 ) ) ( not ( = ?auto_42763 ?auto_42762 ) ) ( ON ?auto_42761 ?auto_42763 ) ( ON ?auto_42765 ?auto_42761 ) ( CLEAR ?auto_42765 ) ( HOLDING ?auto_42762 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42762 )
      ( MAKE-2PILE ?auto_42759 ?auto_42760 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42766 - BLOCK
      ?auto_42767 - BLOCK
    )
    :vars
    (
      ?auto_42769 - BLOCK
      ?auto_42772 - BLOCK
      ?auto_42768 - BLOCK
      ?auto_42771 - BLOCK
      ?auto_42770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42769 ?auto_42767 ) ( ON-TABLE ?auto_42766 ) ( ON ?auto_42767 ?auto_42766 ) ( not ( = ?auto_42766 ?auto_42767 ) ) ( not ( = ?auto_42766 ?auto_42769 ) ) ( not ( = ?auto_42767 ?auto_42769 ) ) ( not ( = ?auto_42766 ?auto_42772 ) ) ( not ( = ?auto_42766 ?auto_42768 ) ) ( not ( = ?auto_42767 ?auto_42772 ) ) ( not ( = ?auto_42767 ?auto_42768 ) ) ( not ( = ?auto_42769 ?auto_42772 ) ) ( not ( = ?auto_42769 ?auto_42768 ) ) ( not ( = ?auto_42772 ?auto_42768 ) ) ( ON ?auto_42772 ?auto_42769 ) ( not ( = ?auto_42771 ?auto_42770 ) ) ( not ( = ?auto_42771 ?auto_42768 ) ) ( not ( = ?auto_42770 ?auto_42768 ) ) ( not ( = ?auto_42766 ?auto_42770 ) ) ( not ( = ?auto_42766 ?auto_42771 ) ) ( not ( = ?auto_42767 ?auto_42770 ) ) ( not ( = ?auto_42767 ?auto_42771 ) ) ( not ( = ?auto_42769 ?auto_42770 ) ) ( not ( = ?auto_42769 ?auto_42771 ) ) ( not ( = ?auto_42772 ?auto_42770 ) ) ( not ( = ?auto_42772 ?auto_42771 ) ) ( ON ?auto_42768 ?auto_42772 ) ( ON ?auto_42770 ?auto_42768 ) ( ON ?auto_42771 ?auto_42770 ) ( CLEAR ?auto_42771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42766 ?auto_42767 ?auto_42769 ?auto_42772 ?auto_42768 ?auto_42770 )
      ( MAKE-2PILE ?auto_42766 ?auto_42767 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42778 - BLOCK
      ?auto_42779 - BLOCK
      ?auto_42780 - BLOCK
      ?auto_42781 - BLOCK
      ?auto_42782 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42782 ) ( CLEAR ?auto_42781 ) ( ON-TABLE ?auto_42778 ) ( ON ?auto_42779 ?auto_42778 ) ( ON ?auto_42780 ?auto_42779 ) ( ON ?auto_42781 ?auto_42780 ) ( not ( = ?auto_42778 ?auto_42779 ) ) ( not ( = ?auto_42778 ?auto_42780 ) ) ( not ( = ?auto_42778 ?auto_42781 ) ) ( not ( = ?auto_42778 ?auto_42782 ) ) ( not ( = ?auto_42779 ?auto_42780 ) ) ( not ( = ?auto_42779 ?auto_42781 ) ) ( not ( = ?auto_42779 ?auto_42782 ) ) ( not ( = ?auto_42780 ?auto_42781 ) ) ( not ( = ?auto_42780 ?auto_42782 ) ) ( not ( = ?auto_42781 ?auto_42782 ) ) )
    :subtasks
    ( ( !STACK ?auto_42782 ?auto_42781 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42783 - BLOCK
      ?auto_42784 - BLOCK
      ?auto_42785 - BLOCK
      ?auto_42786 - BLOCK
      ?auto_42787 - BLOCK
    )
    :vars
    (
      ?auto_42788 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42786 ) ( ON-TABLE ?auto_42783 ) ( ON ?auto_42784 ?auto_42783 ) ( ON ?auto_42785 ?auto_42784 ) ( ON ?auto_42786 ?auto_42785 ) ( not ( = ?auto_42783 ?auto_42784 ) ) ( not ( = ?auto_42783 ?auto_42785 ) ) ( not ( = ?auto_42783 ?auto_42786 ) ) ( not ( = ?auto_42783 ?auto_42787 ) ) ( not ( = ?auto_42784 ?auto_42785 ) ) ( not ( = ?auto_42784 ?auto_42786 ) ) ( not ( = ?auto_42784 ?auto_42787 ) ) ( not ( = ?auto_42785 ?auto_42786 ) ) ( not ( = ?auto_42785 ?auto_42787 ) ) ( not ( = ?auto_42786 ?auto_42787 ) ) ( ON ?auto_42787 ?auto_42788 ) ( CLEAR ?auto_42787 ) ( HAND-EMPTY ) ( not ( = ?auto_42783 ?auto_42788 ) ) ( not ( = ?auto_42784 ?auto_42788 ) ) ( not ( = ?auto_42785 ?auto_42788 ) ) ( not ( = ?auto_42786 ?auto_42788 ) ) ( not ( = ?auto_42787 ?auto_42788 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42787 ?auto_42788 )
      ( MAKE-5PILE ?auto_42783 ?auto_42784 ?auto_42785 ?auto_42786 ?auto_42787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42789 - BLOCK
      ?auto_42790 - BLOCK
      ?auto_42791 - BLOCK
      ?auto_42792 - BLOCK
      ?auto_42793 - BLOCK
    )
    :vars
    (
      ?auto_42794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42789 ) ( ON ?auto_42790 ?auto_42789 ) ( ON ?auto_42791 ?auto_42790 ) ( not ( = ?auto_42789 ?auto_42790 ) ) ( not ( = ?auto_42789 ?auto_42791 ) ) ( not ( = ?auto_42789 ?auto_42792 ) ) ( not ( = ?auto_42789 ?auto_42793 ) ) ( not ( = ?auto_42790 ?auto_42791 ) ) ( not ( = ?auto_42790 ?auto_42792 ) ) ( not ( = ?auto_42790 ?auto_42793 ) ) ( not ( = ?auto_42791 ?auto_42792 ) ) ( not ( = ?auto_42791 ?auto_42793 ) ) ( not ( = ?auto_42792 ?auto_42793 ) ) ( ON ?auto_42793 ?auto_42794 ) ( CLEAR ?auto_42793 ) ( not ( = ?auto_42789 ?auto_42794 ) ) ( not ( = ?auto_42790 ?auto_42794 ) ) ( not ( = ?auto_42791 ?auto_42794 ) ) ( not ( = ?auto_42792 ?auto_42794 ) ) ( not ( = ?auto_42793 ?auto_42794 ) ) ( HOLDING ?auto_42792 ) ( CLEAR ?auto_42791 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42789 ?auto_42790 ?auto_42791 ?auto_42792 )
      ( MAKE-5PILE ?auto_42789 ?auto_42790 ?auto_42791 ?auto_42792 ?auto_42793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42795 - BLOCK
      ?auto_42796 - BLOCK
      ?auto_42797 - BLOCK
      ?auto_42798 - BLOCK
      ?auto_42799 - BLOCK
    )
    :vars
    (
      ?auto_42800 - BLOCK
      ?auto_42801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42795 ) ( ON ?auto_42796 ?auto_42795 ) ( ON ?auto_42797 ?auto_42796 ) ( not ( = ?auto_42795 ?auto_42796 ) ) ( not ( = ?auto_42795 ?auto_42797 ) ) ( not ( = ?auto_42795 ?auto_42798 ) ) ( not ( = ?auto_42795 ?auto_42799 ) ) ( not ( = ?auto_42796 ?auto_42797 ) ) ( not ( = ?auto_42796 ?auto_42798 ) ) ( not ( = ?auto_42796 ?auto_42799 ) ) ( not ( = ?auto_42797 ?auto_42798 ) ) ( not ( = ?auto_42797 ?auto_42799 ) ) ( not ( = ?auto_42798 ?auto_42799 ) ) ( ON ?auto_42799 ?auto_42800 ) ( not ( = ?auto_42795 ?auto_42800 ) ) ( not ( = ?auto_42796 ?auto_42800 ) ) ( not ( = ?auto_42797 ?auto_42800 ) ) ( not ( = ?auto_42798 ?auto_42800 ) ) ( not ( = ?auto_42799 ?auto_42800 ) ) ( CLEAR ?auto_42797 ) ( ON ?auto_42798 ?auto_42799 ) ( CLEAR ?auto_42798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42801 ) ( ON ?auto_42800 ?auto_42801 ) ( not ( = ?auto_42801 ?auto_42800 ) ) ( not ( = ?auto_42801 ?auto_42799 ) ) ( not ( = ?auto_42801 ?auto_42798 ) ) ( not ( = ?auto_42795 ?auto_42801 ) ) ( not ( = ?auto_42796 ?auto_42801 ) ) ( not ( = ?auto_42797 ?auto_42801 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42801 ?auto_42800 ?auto_42799 )
      ( MAKE-5PILE ?auto_42795 ?auto_42796 ?auto_42797 ?auto_42798 ?auto_42799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42802 - BLOCK
      ?auto_42803 - BLOCK
      ?auto_42804 - BLOCK
      ?auto_42805 - BLOCK
      ?auto_42806 - BLOCK
    )
    :vars
    (
      ?auto_42808 - BLOCK
      ?auto_42807 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42802 ) ( ON ?auto_42803 ?auto_42802 ) ( not ( = ?auto_42802 ?auto_42803 ) ) ( not ( = ?auto_42802 ?auto_42804 ) ) ( not ( = ?auto_42802 ?auto_42805 ) ) ( not ( = ?auto_42802 ?auto_42806 ) ) ( not ( = ?auto_42803 ?auto_42804 ) ) ( not ( = ?auto_42803 ?auto_42805 ) ) ( not ( = ?auto_42803 ?auto_42806 ) ) ( not ( = ?auto_42804 ?auto_42805 ) ) ( not ( = ?auto_42804 ?auto_42806 ) ) ( not ( = ?auto_42805 ?auto_42806 ) ) ( ON ?auto_42806 ?auto_42808 ) ( not ( = ?auto_42802 ?auto_42808 ) ) ( not ( = ?auto_42803 ?auto_42808 ) ) ( not ( = ?auto_42804 ?auto_42808 ) ) ( not ( = ?auto_42805 ?auto_42808 ) ) ( not ( = ?auto_42806 ?auto_42808 ) ) ( ON ?auto_42805 ?auto_42806 ) ( CLEAR ?auto_42805 ) ( ON-TABLE ?auto_42807 ) ( ON ?auto_42808 ?auto_42807 ) ( not ( = ?auto_42807 ?auto_42808 ) ) ( not ( = ?auto_42807 ?auto_42806 ) ) ( not ( = ?auto_42807 ?auto_42805 ) ) ( not ( = ?auto_42802 ?auto_42807 ) ) ( not ( = ?auto_42803 ?auto_42807 ) ) ( not ( = ?auto_42804 ?auto_42807 ) ) ( HOLDING ?auto_42804 ) ( CLEAR ?auto_42803 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42802 ?auto_42803 ?auto_42804 )
      ( MAKE-5PILE ?auto_42802 ?auto_42803 ?auto_42804 ?auto_42805 ?auto_42806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42809 - BLOCK
      ?auto_42810 - BLOCK
      ?auto_42811 - BLOCK
      ?auto_42812 - BLOCK
      ?auto_42813 - BLOCK
    )
    :vars
    (
      ?auto_42814 - BLOCK
      ?auto_42815 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42809 ) ( ON ?auto_42810 ?auto_42809 ) ( not ( = ?auto_42809 ?auto_42810 ) ) ( not ( = ?auto_42809 ?auto_42811 ) ) ( not ( = ?auto_42809 ?auto_42812 ) ) ( not ( = ?auto_42809 ?auto_42813 ) ) ( not ( = ?auto_42810 ?auto_42811 ) ) ( not ( = ?auto_42810 ?auto_42812 ) ) ( not ( = ?auto_42810 ?auto_42813 ) ) ( not ( = ?auto_42811 ?auto_42812 ) ) ( not ( = ?auto_42811 ?auto_42813 ) ) ( not ( = ?auto_42812 ?auto_42813 ) ) ( ON ?auto_42813 ?auto_42814 ) ( not ( = ?auto_42809 ?auto_42814 ) ) ( not ( = ?auto_42810 ?auto_42814 ) ) ( not ( = ?auto_42811 ?auto_42814 ) ) ( not ( = ?auto_42812 ?auto_42814 ) ) ( not ( = ?auto_42813 ?auto_42814 ) ) ( ON ?auto_42812 ?auto_42813 ) ( ON-TABLE ?auto_42815 ) ( ON ?auto_42814 ?auto_42815 ) ( not ( = ?auto_42815 ?auto_42814 ) ) ( not ( = ?auto_42815 ?auto_42813 ) ) ( not ( = ?auto_42815 ?auto_42812 ) ) ( not ( = ?auto_42809 ?auto_42815 ) ) ( not ( = ?auto_42810 ?auto_42815 ) ) ( not ( = ?auto_42811 ?auto_42815 ) ) ( CLEAR ?auto_42810 ) ( ON ?auto_42811 ?auto_42812 ) ( CLEAR ?auto_42811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42815 ?auto_42814 ?auto_42813 ?auto_42812 )
      ( MAKE-5PILE ?auto_42809 ?auto_42810 ?auto_42811 ?auto_42812 ?auto_42813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42816 - BLOCK
      ?auto_42817 - BLOCK
      ?auto_42818 - BLOCK
      ?auto_42819 - BLOCK
      ?auto_42820 - BLOCK
    )
    :vars
    (
      ?auto_42821 - BLOCK
      ?auto_42822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42816 ) ( not ( = ?auto_42816 ?auto_42817 ) ) ( not ( = ?auto_42816 ?auto_42818 ) ) ( not ( = ?auto_42816 ?auto_42819 ) ) ( not ( = ?auto_42816 ?auto_42820 ) ) ( not ( = ?auto_42817 ?auto_42818 ) ) ( not ( = ?auto_42817 ?auto_42819 ) ) ( not ( = ?auto_42817 ?auto_42820 ) ) ( not ( = ?auto_42818 ?auto_42819 ) ) ( not ( = ?auto_42818 ?auto_42820 ) ) ( not ( = ?auto_42819 ?auto_42820 ) ) ( ON ?auto_42820 ?auto_42821 ) ( not ( = ?auto_42816 ?auto_42821 ) ) ( not ( = ?auto_42817 ?auto_42821 ) ) ( not ( = ?auto_42818 ?auto_42821 ) ) ( not ( = ?auto_42819 ?auto_42821 ) ) ( not ( = ?auto_42820 ?auto_42821 ) ) ( ON ?auto_42819 ?auto_42820 ) ( ON-TABLE ?auto_42822 ) ( ON ?auto_42821 ?auto_42822 ) ( not ( = ?auto_42822 ?auto_42821 ) ) ( not ( = ?auto_42822 ?auto_42820 ) ) ( not ( = ?auto_42822 ?auto_42819 ) ) ( not ( = ?auto_42816 ?auto_42822 ) ) ( not ( = ?auto_42817 ?auto_42822 ) ) ( not ( = ?auto_42818 ?auto_42822 ) ) ( ON ?auto_42818 ?auto_42819 ) ( CLEAR ?auto_42818 ) ( HOLDING ?auto_42817 ) ( CLEAR ?auto_42816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42816 ?auto_42817 )
      ( MAKE-5PILE ?auto_42816 ?auto_42817 ?auto_42818 ?auto_42819 ?auto_42820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42823 - BLOCK
      ?auto_42824 - BLOCK
      ?auto_42825 - BLOCK
      ?auto_42826 - BLOCK
      ?auto_42827 - BLOCK
    )
    :vars
    (
      ?auto_42828 - BLOCK
      ?auto_42829 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42823 ) ( not ( = ?auto_42823 ?auto_42824 ) ) ( not ( = ?auto_42823 ?auto_42825 ) ) ( not ( = ?auto_42823 ?auto_42826 ) ) ( not ( = ?auto_42823 ?auto_42827 ) ) ( not ( = ?auto_42824 ?auto_42825 ) ) ( not ( = ?auto_42824 ?auto_42826 ) ) ( not ( = ?auto_42824 ?auto_42827 ) ) ( not ( = ?auto_42825 ?auto_42826 ) ) ( not ( = ?auto_42825 ?auto_42827 ) ) ( not ( = ?auto_42826 ?auto_42827 ) ) ( ON ?auto_42827 ?auto_42828 ) ( not ( = ?auto_42823 ?auto_42828 ) ) ( not ( = ?auto_42824 ?auto_42828 ) ) ( not ( = ?auto_42825 ?auto_42828 ) ) ( not ( = ?auto_42826 ?auto_42828 ) ) ( not ( = ?auto_42827 ?auto_42828 ) ) ( ON ?auto_42826 ?auto_42827 ) ( ON-TABLE ?auto_42829 ) ( ON ?auto_42828 ?auto_42829 ) ( not ( = ?auto_42829 ?auto_42828 ) ) ( not ( = ?auto_42829 ?auto_42827 ) ) ( not ( = ?auto_42829 ?auto_42826 ) ) ( not ( = ?auto_42823 ?auto_42829 ) ) ( not ( = ?auto_42824 ?auto_42829 ) ) ( not ( = ?auto_42825 ?auto_42829 ) ) ( ON ?auto_42825 ?auto_42826 ) ( CLEAR ?auto_42823 ) ( ON ?auto_42824 ?auto_42825 ) ( CLEAR ?auto_42824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42829 ?auto_42828 ?auto_42827 ?auto_42826 ?auto_42825 )
      ( MAKE-5PILE ?auto_42823 ?auto_42824 ?auto_42825 ?auto_42826 ?auto_42827 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42830 - BLOCK
      ?auto_42831 - BLOCK
      ?auto_42832 - BLOCK
      ?auto_42833 - BLOCK
      ?auto_42834 - BLOCK
    )
    :vars
    (
      ?auto_42836 - BLOCK
      ?auto_42835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42830 ?auto_42831 ) ) ( not ( = ?auto_42830 ?auto_42832 ) ) ( not ( = ?auto_42830 ?auto_42833 ) ) ( not ( = ?auto_42830 ?auto_42834 ) ) ( not ( = ?auto_42831 ?auto_42832 ) ) ( not ( = ?auto_42831 ?auto_42833 ) ) ( not ( = ?auto_42831 ?auto_42834 ) ) ( not ( = ?auto_42832 ?auto_42833 ) ) ( not ( = ?auto_42832 ?auto_42834 ) ) ( not ( = ?auto_42833 ?auto_42834 ) ) ( ON ?auto_42834 ?auto_42836 ) ( not ( = ?auto_42830 ?auto_42836 ) ) ( not ( = ?auto_42831 ?auto_42836 ) ) ( not ( = ?auto_42832 ?auto_42836 ) ) ( not ( = ?auto_42833 ?auto_42836 ) ) ( not ( = ?auto_42834 ?auto_42836 ) ) ( ON ?auto_42833 ?auto_42834 ) ( ON-TABLE ?auto_42835 ) ( ON ?auto_42836 ?auto_42835 ) ( not ( = ?auto_42835 ?auto_42836 ) ) ( not ( = ?auto_42835 ?auto_42834 ) ) ( not ( = ?auto_42835 ?auto_42833 ) ) ( not ( = ?auto_42830 ?auto_42835 ) ) ( not ( = ?auto_42831 ?auto_42835 ) ) ( not ( = ?auto_42832 ?auto_42835 ) ) ( ON ?auto_42832 ?auto_42833 ) ( ON ?auto_42831 ?auto_42832 ) ( CLEAR ?auto_42831 ) ( HOLDING ?auto_42830 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42830 )
      ( MAKE-5PILE ?auto_42830 ?auto_42831 ?auto_42832 ?auto_42833 ?auto_42834 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_42837 - BLOCK
      ?auto_42838 - BLOCK
      ?auto_42839 - BLOCK
      ?auto_42840 - BLOCK
      ?auto_42841 - BLOCK
    )
    :vars
    (
      ?auto_42843 - BLOCK
      ?auto_42842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42837 ?auto_42838 ) ) ( not ( = ?auto_42837 ?auto_42839 ) ) ( not ( = ?auto_42837 ?auto_42840 ) ) ( not ( = ?auto_42837 ?auto_42841 ) ) ( not ( = ?auto_42838 ?auto_42839 ) ) ( not ( = ?auto_42838 ?auto_42840 ) ) ( not ( = ?auto_42838 ?auto_42841 ) ) ( not ( = ?auto_42839 ?auto_42840 ) ) ( not ( = ?auto_42839 ?auto_42841 ) ) ( not ( = ?auto_42840 ?auto_42841 ) ) ( ON ?auto_42841 ?auto_42843 ) ( not ( = ?auto_42837 ?auto_42843 ) ) ( not ( = ?auto_42838 ?auto_42843 ) ) ( not ( = ?auto_42839 ?auto_42843 ) ) ( not ( = ?auto_42840 ?auto_42843 ) ) ( not ( = ?auto_42841 ?auto_42843 ) ) ( ON ?auto_42840 ?auto_42841 ) ( ON-TABLE ?auto_42842 ) ( ON ?auto_42843 ?auto_42842 ) ( not ( = ?auto_42842 ?auto_42843 ) ) ( not ( = ?auto_42842 ?auto_42841 ) ) ( not ( = ?auto_42842 ?auto_42840 ) ) ( not ( = ?auto_42837 ?auto_42842 ) ) ( not ( = ?auto_42838 ?auto_42842 ) ) ( not ( = ?auto_42839 ?auto_42842 ) ) ( ON ?auto_42839 ?auto_42840 ) ( ON ?auto_42838 ?auto_42839 ) ( ON ?auto_42837 ?auto_42838 ) ( CLEAR ?auto_42837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42842 ?auto_42843 ?auto_42841 ?auto_42840 ?auto_42839 ?auto_42838 )
      ( MAKE-5PILE ?auto_42837 ?auto_42838 ?auto_42839 ?auto_42840 ?auto_42841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42845 - BLOCK
    )
    :vars
    (
      ?auto_42846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42846 ?auto_42845 ) ( CLEAR ?auto_42846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42845 ) ( not ( = ?auto_42845 ?auto_42846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42846 ?auto_42845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42847 - BLOCK
    )
    :vars
    (
      ?auto_42848 - BLOCK
      ?auto_42849 - BLOCK
      ?auto_42850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42848 ?auto_42847 ) ( CLEAR ?auto_42848 ) ( ON-TABLE ?auto_42847 ) ( not ( = ?auto_42847 ?auto_42848 ) ) ( HOLDING ?auto_42849 ) ( CLEAR ?auto_42850 ) ( not ( = ?auto_42847 ?auto_42849 ) ) ( not ( = ?auto_42847 ?auto_42850 ) ) ( not ( = ?auto_42848 ?auto_42849 ) ) ( not ( = ?auto_42848 ?auto_42850 ) ) ( not ( = ?auto_42849 ?auto_42850 ) ) )
    :subtasks
    ( ( !STACK ?auto_42849 ?auto_42850 )
      ( MAKE-1PILE ?auto_42847 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42851 - BLOCK
    )
    :vars
    (
      ?auto_42854 - BLOCK
      ?auto_42853 - BLOCK
      ?auto_42852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42854 ?auto_42851 ) ( ON-TABLE ?auto_42851 ) ( not ( = ?auto_42851 ?auto_42854 ) ) ( CLEAR ?auto_42853 ) ( not ( = ?auto_42851 ?auto_42852 ) ) ( not ( = ?auto_42851 ?auto_42853 ) ) ( not ( = ?auto_42854 ?auto_42852 ) ) ( not ( = ?auto_42854 ?auto_42853 ) ) ( not ( = ?auto_42852 ?auto_42853 ) ) ( ON ?auto_42852 ?auto_42854 ) ( CLEAR ?auto_42852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42851 ?auto_42854 )
      ( MAKE-1PILE ?auto_42851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42855 - BLOCK
    )
    :vars
    (
      ?auto_42858 - BLOCK
      ?auto_42857 - BLOCK
      ?auto_42856 - BLOCK
      ?auto_42860 - BLOCK
      ?auto_42861 - BLOCK
      ?auto_42859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42858 ?auto_42855 ) ( ON-TABLE ?auto_42855 ) ( not ( = ?auto_42855 ?auto_42858 ) ) ( not ( = ?auto_42855 ?auto_42857 ) ) ( not ( = ?auto_42855 ?auto_42856 ) ) ( not ( = ?auto_42858 ?auto_42857 ) ) ( not ( = ?auto_42858 ?auto_42856 ) ) ( not ( = ?auto_42857 ?auto_42856 ) ) ( ON ?auto_42857 ?auto_42858 ) ( CLEAR ?auto_42857 ) ( HOLDING ?auto_42856 ) ( CLEAR ?auto_42860 ) ( ON-TABLE ?auto_42861 ) ( ON ?auto_42859 ?auto_42861 ) ( ON ?auto_42860 ?auto_42859 ) ( not ( = ?auto_42861 ?auto_42859 ) ) ( not ( = ?auto_42861 ?auto_42860 ) ) ( not ( = ?auto_42861 ?auto_42856 ) ) ( not ( = ?auto_42859 ?auto_42860 ) ) ( not ( = ?auto_42859 ?auto_42856 ) ) ( not ( = ?auto_42860 ?auto_42856 ) ) ( not ( = ?auto_42855 ?auto_42860 ) ) ( not ( = ?auto_42855 ?auto_42861 ) ) ( not ( = ?auto_42855 ?auto_42859 ) ) ( not ( = ?auto_42858 ?auto_42860 ) ) ( not ( = ?auto_42858 ?auto_42861 ) ) ( not ( = ?auto_42858 ?auto_42859 ) ) ( not ( = ?auto_42857 ?auto_42860 ) ) ( not ( = ?auto_42857 ?auto_42861 ) ) ( not ( = ?auto_42857 ?auto_42859 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42861 ?auto_42859 ?auto_42860 ?auto_42856 )
      ( MAKE-1PILE ?auto_42855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42862 - BLOCK
    )
    :vars
    (
      ?auto_42866 - BLOCK
      ?auto_42867 - BLOCK
      ?auto_42865 - BLOCK
      ?auto_42864 - BLOCK
      ?auto_42863 - BLOCK
      ?auto_42868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42866 ?auto_42862 ) ( ON-TABLE ?auto_42862 ) ( not ( = ?auto_42862 ?auto_42866 ) ) ( not ( = ?auto_42862 ?auto_42867 ) ) ( not ( = ?auto_42862 ?auto_42865 ) ) ( not ( = ?auto_42866 ?auto_42867 ) ) ( not ( = ?auto_42866 ?auto_42865 ) ) ( not ( = ?auto_42867 ?auto_42865 ) ) ( ON ?auto_42867 ?auto_42866 ) ( CLEAR ?auto_42864 ) ( ON-TABLE ?auto_42863 ) ( ON ?auto_42868 ?auto_42863 ) ( ON ?auto_42864 ?auto_42868 ) ( not ( = ?auto_42863 ?auto_42868 ) ) ( not ( = ?auto_42863 ?auto_42864 ) ) ( not ( = ?auto_42863 ?auto_42865 ) ) ( not ( = ?auto_42868 ?auto_42864 ) ) ( not ( = ?auto_42868 ?auto_42865 ) ) ( not ( = ?auto_42864 ?auto_42865 ) ) ( not ( = ?auto_42862 ?auto_42864 ) ) ( not ( = ?auto_42862 ?auto_42863 ) ) ( not ( = ?auto_42862 ?auto_42868 ) ) ( not ( = ?auto_42866 ?auto_42864 ) ) ( not ( = ?auto_42866 ?auto_42863 ) ) ( not ( = ?auto_42866 ?auto_42868 ) ) ( not ( = ?auto_42867 ?auto_42864 ) ) ( not ( = ?auto_42867 ?auto_42863 ) ) ( not ( = ?auto_42867 ?auto_42868 ) ) ( ON ?auto_42865 ?auto_42867 ) ( CLEAR ?auto_42865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42862 ?auto_42866 ?auto_42867 )
      ( MAKE-1PILE ?auto_42862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42869 - BLOCK
    )
    :vars
    (
      ?auto_42873 - BLOCK
      ?auto_42875 - BLOCK
      ?auto_42872 - BLOCK
      ?auto_42870 - BLOCK
      ?auto_42874 - BLOCK
      ?auto_42871 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42873 ?auto_42869 ) ( ON-TABLE ?auto_42869 ) ( not ( = ?auto_42869 ?auto_42873 ) ) ( not ( = ?auto_42869 ?auto_42875 ) ) ( not ( = ?auto_42869 ?auto_42872 ) ) ( not ( = ?auto_42873 ?auto_42875 ) ) ( not ( = ?auto_42873 ?auto_42872 ) ) ( not ( = ?auto_42875 ?auto_42872 ) ) ( ON ?auto_42875 ?auto_42873 ) ( ON-TABLE ?auto_42870 ) ( ON ?auto_42874 ?auto_42870 ) ( not ( = ?auto_42870 ?auto_42874 ) ) ( not ( = ?auto_42870 ?auto_42871 ) ) ( not ( = ?auto_42870 ?auto_42872 ) ) ( not ( = ?auto_42874 ?auto_42871 ) ) ( not ( = ?auto_42874 ?auto_42872 ) ) ( not ( = ?auto_42871 ?auto_42872 ) ) ( not ( = ?auto_42869 ?auto_42871 ) ) ( not ( = ?auto_42869 ?auto_42870 ) ) ( not ( = ?auto_42869 ?auto_42874 ) ) ( not ( = ?auto_42873 ?auto_42871 ) ) ( not ( = ?auto_42873 ?auto_42870 ) ) ( not ( = ?auto_42873 ?auto_42874 ) ) ( not ( = ?auto_42875 ?auto_42871 ) ) ( not ( = ?auto_42875 ?auto_42870 ) ) ( not ( = ?auto_42875 ?auto_42874 ) ) ( ON ?auto_42872 ?auto_42875 ) ( CLEAR ?auto_42872 ) ( HOLDING ?auto_42871 ) ( CLEAR ?auto_42874 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42870 ?auto_42874 ?auto_42871 )
      ( MAKE-1PILE ?auto_42869 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42876 - BLOCK
    )
    :vars
    (
      ?auto_42882 - BLOCK
      ?auto_42881 - BLOCK
      ?auto_42880 - BLOCK
      ?auto_42877 - BLOCK
      ?auto_42878 - BLOCK
      ?auto_42879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42882 ?auto_42876 ) ( ON-TABLE ?auto_42876 ) ( not ( = ?auto_42876 ?auto_42882 ) ) ( not ( = ?auto_42876 ?auto_42881 ) ) ( not ( = ?auto_42876 ?auto_42880 ) ) ( not ( = ?auto_42882 ?auto_42881 ) ) ( not ( = ?auto_42882 ?auto_42880 ) ) ( not ( = ?auto_42881 ?auto_42880 ) ) ( ON ?auto_42881 ?auto_42882 ) ( ON-TABLE ?auto_42877 ) ( ON ?auto_42878 ?auto_42877 ) ( not ( = ?auto_42877 ?auto_42878 ) ) ( not ( = ?auto_42877 ?auto_42879 ) ) ( not ( = ?auto_42877 ?auto_42880 ) ) ( not ( = ?auto_42878 ?auto_42879 ) ) ( not ( = ?auto_42878 ?auto_42880 ) ) ( not ( = ?auto_42879 ?auto_42880 ) ) ( not ( = ?auto_42876 ?auto_42879 ) ) ( not ( = ?auto_42876 ?auto_42877 ) ) ( not ( = ?auto_42876 ?auto_42878 ) ) ( not ( = ?auto_42882 ?auto_42879 ) ) ( not ( = ?auto_42882 ?auto_42877 ) ) ( not ( = ?auto_42882 ?auto_42878 ) ) ( not ( = ?auto_42881 ?auto_42879 ) ) ( not ( = ?auto_42881 ?auto_42877 ) ) ( not ( = ?auto_42881 ?auto_42878 ) ) ( ON ?auto_42880 ?auto_42881 ) ( CLEAR ?auto_42878 ) ( ON ?auto_42879 ?auto_42880 ) ( CLEAR ?auto_42879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42876 ?auto_42882 ?auto_42881 ?auto_42880 )
      ( MAKE-1PILE ?auto_42876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42883 - BLOCK
    )
    :vars
    (
      ?auto_42889 - BLOCK
      ?auto_42888 - BLOCK
      ?auto_42884 - BLOCK
      ?auto_42885 - BLOCK
      ?auto_42886 - BLOCK
      ?auto_42887 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42889 ?auto_42883 ) ( ON-TABLE ?auto_42883 ) ( not ( = ?auto_42883 ?auto_42889 ) ) ( not ( = ?auto_42883 ?auto_42888 ) ) ( not ( = ?auto_42883 ?auto_42884 ) ) ( not ( = ?auto_42889 ?auto_42888 ) ) ( not ( = ?auto_42889 ?auto_42884 ) ) ( not ( = ?auto_42888 ?auto_42884 ) ) ( ON ?auto_42888 ?auto_42889 ) ( ON-TABLE ?auto_42885 ) ( not ( = ?auto_42885 ?auto_42886 ) ) ( not ( = ?auto_42885 ?auto_42887 ) ) ( not ( = ?auto_42885 ?auto_42884 ) ) ( not ( = ?auto_42886 ?auto_42887 ) ) ( not ( = ?auto_42886 ?auto_42884 ) ) ( not ( = ?auto_42887 ?auto_42884 ) ) ( not ( = ?auto_42883 ?auto_42887 ) ) ( not ( = ?auto_42883 ?auto_42885 ) ) ( not ( = ?auto_42883 ?auto_42886 ) ) ( not ( = ?auto_42889 ?auto_42887 ) ) ( not ( = ?auto_42889 ?auto_42885 ) ) ( not ( = ?auto_42889 ?auto_42886 ) ) ( not ( = ?auto_42888 ?auto_42887 ) ) ( not ( = ?auto_42888 ?auto_42885 ) ) ( not ( = ?auto_42888 ?auto_42886 ) ) ( ON ?auto_42884 ?auto_42888 ) ( ON ?auto_42887 ?auto_42884 ) ( CLEAR ?auto_42887 ) ( HOLDING ?auto_42886 ) ( CLEAR ?auto_42885 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42885 ?auto_42886 )
      ( MAKE-1PILE ?auto_42883 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43736 - BLOCK
    )
    :vars
    (
      ?auto_43740 - BLOCK
      ?auto_43737 - BLOCK
      ?auto_43739 - BLOCK
      ?auto_43738 - BLOCK
      ?auto_43741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43740 ?auto_43736 ) ( ON-TABLE ?auto_43736 ) ( not ( = ?auto_43736 ?auto_43740 ) ) ( not ( = ?auto_43736 ?auto_43737 ) ) ( not ( = ?auto_43736 ?auto_43739 ) ) ( not ( = ?auto_43740 ?auto_43737 ) ) ( not ( = ?auto_43740 ?auto_43739 ) ) ( not ( = ?auto_43737 ?auto_43739 ) ) ( ON ?auto_43737 ?auto_43740 ) ( not ( = ?auto_43738 ?auto_43741 ) ) ( not ( = ?auto_43738 ?auto_43739 ) ) ( not ( = ?auto_43741 ?auto_43739 ) ) ( not ( = ?auto_43736 ?auto_43741 ) ) ( not ( = ?auto_43736 ?auto_43738 ) ) ( not ( = ?auto_43740 ?auto_43741 ) ) ( not ( = ?auto_43740 ?auto_43738 ) ) ( not ( = ?auto_43737 ?auto_43741 ) ) ( not ( = ?auto_43737 ?auto_43738 ) ) ( ON ?auto_43739 ?auto_43737 ) ( ON ?auto_43741 ?auto_43739 ) ( ON ?auto_43738 ?auto_43741 ) ( CLEAR ?auto_43738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43736 ?auto_43740 ?auto_43737 ?auto_43739 ?auto_43741 )
      ( MAKE-1PILE ?auto_43736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42897 - BLOCK
    )
    :vars
    (
      ?auto_42900 - BLOCK
      ?auto_42898 - BLOCK
      ?auto_42902 - BLOCK
      ?auto_42903 - BLOCK
      ?auto_42899 - BLOCK
      ?auto_42901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42900 ?auto_42897 ) ( ON-TABLE ?auto_42897 ) ( not ( = ?auto_42897 ?auto_42900 ) ) ( not ( = ?auto_42897 ?auto_42898 ) ) ( not ( = ?auto_42897 ?auto_42902 ) ) ( not ( = ?auto_42900 ?auto_42898 ) ) ( not ( = ?auto_42900 ?auto_42902 ) ) ( not ( = ?auto_42898 ?auto_42902 ) ) ( ON ?auto_42898 ?auto_42900 ) ( not ( = ?auto_42903 ?auto_42899 ) ) ( not ( = ?auto_42903 ?auto_42901 ) ) ( not ( = ?auto_42903 ?auto_42902 ) ) ( not ( = ?auto_42899 ?auto_42901 ) ) ( not ( = ?auto_42899 ?auto_42902 ) ) ( not ( = ?auto_42901 ?auto_42902 ) ) ( not ( = ?auto_42897 ?auto_42901 ) ) ( not ( = ?auto_42897 ?auto_42903 ) ) ( not ( = ?auto_42897 ?auto_42899 ) ) ( not ( = ?auto_42900 ?auto_42901 ) ) ( not ( = ?auto_42900 ?auto_42903 ) ) ( not ( = ?auto_42900 ?auto_42899 ) ) ( not ( = ?auto_42898 ?auto_42901 ) ) ( not ( = ?auto_42898 ?auto_42903 ) ) ( not ( = ?auto_42898 ?auto_42899 ) ) ( ON ?auto_42902 ?auto_42898 ) ( ON ?auto_42901 ?auto_42902 ) ( ON ?auto_42899 ?auto_42901 ) ( CLEAR ?auto_42899 ) ( HOLDING ?auto_42903 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42903 )
      ( MAKE-1PILE ?auto_42897 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42904 - BLOCK
    )
    :vars
    (
      ?auto_42909 - BLOCK
      ?auto_42906 - BLOCK
      ?auto_42908 - BLOCK
      ?auto_42907 - BLOCK
      ?auto_42910 - BLOCK
      ?auto_42905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42909 ?auto_42904 ) ( ON-TABLE ?auto_42904 ) ( not ( = ?auto_42904 ?auto_42909 ) ) ( not ( = ?auto_42904 ?auto_42906 ) ) ( not ( = ?auto_42904 ?auto_42908 ) ) ( not ( = ?auto_42909 ?auto_42906 ) ) ( not ( = ?auto_42909 ?auto_42908 ) ) ( not ( = ?auto_42906 ?auto_42908 ) ) ( ON ?auto_42906 ?auto_42909 ) ( not ( = ?auto_42907 ?auto_42910 ) ) ( not ( = ?auto_42907 ?auto_42905 ) ) ( not ( = ?auto_42907 ?auto_42908 ) ) ( not ( = ?auto_42910 ?auto_42905 ) ) ( not ( = ?auto_42910 ?auto_42908 ) ) ( not ( = ?auto_42905 ?auto_42908 ) ) ( not ( = ?auto_42904 ?auto_42905 ) ) ( not ( = ?auto_42904 ?auto_42907 ) ) ( not ( = ?auto_42904 ?auto_42910 ) ) ( not ( = ?auto_42909 ?auto_42905 ) ) ( not ( = ?auto_42909 ?auto_42907 ) ) ( not ( = ?auto_42909 ?auto_42910 ) ) ( not ( = ?auto_42906 ?auto_42905 ) ) ( not ( = ?auto_42906 ?auto_42907 ) ) ( not ( = ?auto_42906 ?auto_42910 ) ) ( ON ?auto_42908 ?auto_42906 ) ( ON ?auto_42905 ?auto_42908 ) ( ON ?auto_42910 ?auto_42905 ) ( ON ?auto_42907 ?auto_42910 ) ( CLEAR ?auto_42907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42904 ?auto_42909 ?auto_42906 ?auto_42908 ?auto_42905 ?auto_42910 )
      ( MAKE-1PILE ?auto_42904 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42917 - BLOCK
      ?auto_42918 - BLOCK
      ?auto_42919 - BLOCK
      ?auto_42920 - BLOCK
      ?auto_42921 - BLOCK
      ?auto_42922 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_42922 ) ( CLEAR ?auto_42921 ) ( ON-TABLE ?auto_42917 ) ( ON ?auto_42918 ?auto_42917 ) ( ON ?auto_42919 ?auto_42918 ) ( ON ?auto_42920 ?auto_42919 ) ( ON ?auto_42921 ?auto_42920 ) ( not ( = ?auto_42917 ?auto_42918 ) ) ( not ( = ?auto_42917 ?auto_42919 ) ) ( not ( = ?auto_42917 ?auto_42920 ) ) ( not ( = ?auto_42917 ?auto_42921 ) ) ( not ( = ?auto_42917 ?auto_42922 ) ) ( not ( = ?auto_42918 ?auto_42919 ) ) ( not ( = ?auto_42918 ?auto_42920 ) ) ( not ( = ?auto_42918 ?auto_42921 ) ) ( not ( = ?auto_42918 ?auto_42922 ) ) ( not ( = ?auto_42919 ?auto_42920 ) ) ( not ( = ?auto_42919 ?auto_42921 ) ) ( not ( = ?auto_42919 ?auto_42922 ) ) ( not ( = ?auto_42920 ?auto_42921 ) ) ( not ( = ?auto_42920 ?auto_42922 ) ) ( not ( = ?auto_42921 ?auto_42922 ) ) )
    :subtasks
    ( ( !STACK ?auto_42922 ?auto_42921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42923 - BLOCK
      ?auto_42924 - BLOCK
      ?auto_42925 - BLOCK
      ?auto_42926 - BLOCK
      ?auto_42927 - BLOCK
      ?auto_42928 - BLOCK
    )
    :vars
    (
      ?auto_42929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42927 ) ( ON-TABLE ?auto_42923 ) ( ON ?auto_42924 ?auto_42923 ) ( ON ?auto_42925 ?auto_42924 ) ( ON ?auto_42926 ?auto_42925 ) ( ON ?auto_42927 ?auto_42926 ) ( not ( = ?auto_42923 ?auto_42924 ) ) ( not ( = ?auto_42923 ?auto_42925 ) ) ( not ( = ?auto_42923 ?auto_42926 ) ) ( not ( = ?auto_42923 ?auto_42927 ) ) ( not ( = ?auto_42923 ?auto_42928 ) ) ( not ( = ?auto_42924 ?auto_42925 ) ) ( not ( = ?auto_42924 ?auto_42926 ) ) ( not ( = ?auto_42924 ?auto_42927 ) ) ( not ( = ?auto_42924 ?auto_42928 ) ) ( not ( = ?auto_42925 ?auto_42926 ) ) ( not ( = ?auto_42925 ?auto_42927 ) ) ( not ( = ?auto_42925 ?auto_42928 ) ) ( not ( = ?auto_42926 ?auto_42927 ) ) ( not ( = ?auto_42926 ?auto_42928 ) ) ( not ( = ?auto_42927 ?auto_42928 ) ) ( ON ?auto_42928 ?auto_42929 ) ( CLEAR ?auto_42928 ) ( HAND-EMPTY ) ( not ( = ?auto_42923 ?auto_42929 ) ) ( not ( = ?auto_42924 ?auto_42929 ) ) ( not ( = ?auto_42925 ?auto_42929 ) ) ( not ( = ?auto_42926 ?auto_42929 ) ) ( not ( = ?auto_42927 ?auto_42929 ) ) ( not ( = ?auto_42928 ?auto_42929 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_42928 ?auto_42929 )
      ( MAKE-6PILE ?auto_42923 ?auto_42924 ?auto_42925 ?auto_42926 ?auto_42927 ?auto_42928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42930 - BLOCK
      ?auto_42931 - BLOCK
      ?auto_42932 - BLOCK
      ?auto_42933 - BLOCK
      ?auto_42934 - BLOCK
      ?auto_42935 - BLOCK
    )
    :vars
    (
      ?auto_42936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42930 ) ( ON ?auto_42931 ?auto_42930 ) ( ON ?auto_42932 ?auto_42931 ) ( ON ?auto_42933 ?auto_42932 ) ( not ( = ?auto_42930 ?auto_42931 ) ) ( not ( = ?auto_42930 ?auto_42932 ) ) ( not ( = ?auto_42930 ?auto_42933 ) ) ( not ( = ?auto_42930 ?auto_42934 ) ) ( not ( = ?auto_42930 ?auto_42935 ) ) ( not ( = ?auto_42931 ?auto_42932 ) ) ( not ( = ?auto_42931 ?auto_42933 ) ) ( not ( = ?auto_42931 ?auto_42934 ) ) ( not ( = ?auto_42931 ?auto_42935 ) ) ( not ( = ?auto_42932 ?auto_42933 ) ) ( not ( = ?auto_42932 ?auto_42934 ) ) ( not ( = ?auto_42932 ?auto_42935 ) ) ( not ( = ?auto_42933 ?auto_42934 ) ) ( not ( = ?auto_42933 ?auto_42935 ) ) ( not ( = ?auto_42934 ?auto_42935 ) ) ( ON ?auto_42935 ?auto_42936 ) ( CLEAR ?auto_42935 ) ( not ( = ?auto_42930 ?auto_42936 ) ) ( not ( = ?auto_42931 ?auto_42936 ) ) ( not ( = ?auto_42932 ?auto_42936 ) ) ( not ( = ?auto_42933 ?auto_42936 ) ) ( not ( = ?auto_42934 ?auto_42936 ) ) ( not ( = ?auto_42935 ?auto_42936 ) ) ( HOLDING ?auto_42934 ) ( CLEAR ?auto_42933 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42930 ?auto_42931 ?auto_42932 ?auto_42933 ?auto_42934 )
      ( MAKE-6PILE ?auto_42930 ?auto_42931 ?auto_42932 ?auto_42933 ?auto_42934 ?auto_42935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42937 - BLOCK
      ?auto_42938 - BLOCK
      ?auto_42939 - BLOCK
      ?auto_42940 - BLOCK
      ?auto_42941 - BLOCK
      ?auto_42942 - BLOCK
    )
    :vars
    (
      ?auto_42943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42937 ) ( ON ?auto_42938 ?auto_42937 ) ( ON ?auto_42939 ?auto_42938 ) ( ON ?auto_42940 ?auto_42939 ) ( not ( = ?auto_42937 ?auto_42938 ) ) ( not ( = ?auto_42937 ?auto_42939 ) ) ( not ( = ?auto_42937 ?auto_42940 ) ) ( not ( = ?auto_42937 ?auto_42941 ) ) ( not ( = ?auto_42937 ?auto_42942 ) ) ( not ( = ?auto_42938 ?auto_42939 ) ) ( not ( = ?auto_42938 ?auto_42940 ) ) ( not ( = ?auto_42938 ?auto_42941 ) ) ( not ( = ?auto_42938 ?auto_42942 ) ) ( not ( = ?auto_42939 ?auto_42940 ) ) ( not ( = ?auto_42939 ?auto_42941 ) ) ( not ( = ?auto_42939 ?auto_42942 ) ) ( not ( = ?auto_42940 ?auto_42941 ) ) ( not ( = ?auto_42940 ?auto_42942 ) ) ( not ( = ?auto_42941 ?auto_42942 ) ) ( ON ?auto_42942 ?auto_42943 ) ( not ( = ?auto_42937 ?auto_42943 ) ) ( not ( = ?auto_42938 ?auto_42943 ) ) ( not ( = ?auto_42939 ?auto_42943 ) ) ( not ( = ?auto_42940 ?auto_42943 ) ) ( not ( = ?auto_42941 ?auto_42943 ) ) ( not ( = ?auto_42942 ?auto_42943 ) ) ( CLEAR ?auto_42940 ) ( ON ?auto_42941 ?auto_42942 ) ( CLEAR ?auto_42941 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42943 ?auto_42942 )
      ( MAKE-6PILE ?auto_42937 ?auto_42938 ?auto_42939 ?auto_42940 ?auto_42941 ?auto_42942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42944 - BLOCK
      ?auto_42945 - BLOCK
      ?auto_42946 - BLOCK
      ?auto_42947 - BLOCK
      ?auto_42948 - BLOCK
      ?auto_42949 - BLOCK
    )
    :vars
    (
      ?auto_42950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42944 ) ( ON ?auto_42945 ?auto_42944 ) ( ON ?auto_42946 ?auto_42945 ) ( not ( = ?auto_42944 ?auto_42945 ) ) ( not ( = ?auto_42944 ?auto_42946 ) ) ( not ( = ?auto_42944 ?auto_42947 ) ) ( not ( = ?auto_42944 ?auto_42948 ) ) ( not ( = ?auto_42944 ?auto_42949 ) ) ( not ( = ?auto_42945 ?auto_42946 ) ) ( not ( = ?auto_42945 ?auto_42947 ) ) ( not ( = ?auto_42945 ?auto_42948 ) ) ( not ( = ?auto_42945 ?auto_42949 ) ) ( not ( = ?auto_42946 ?auto_42947 ) ) ( not ( = ?auto_42946 ?auto_42948 ) ) ( not ( = ?auto_42946 ?auto_42949 ) ) ( not ( = ?auto_42947 ?auto_42948 ) ) ( not ( = ?auto_42947 ?auto_42949 ) ) ( not ( = ?auto_42948 ?auto_42949 ) ) ( ON ?auto_42949 ?auto_42950 ) ( not ( = ?auto_42944 ?auto_42950 ) ) ( not ( = ?auto_42945 ?auto_42950 ) ) ( not ( = ?auto_42946 ?auto_42950 ) ) ( not ( = ?auto_42947 ?auto_42950 ) ) ( not ( = ?auto_42948 ?auto_42950 ) ) ( not ( = ?auto_42949 ?auto_42950 ) ) ( ON ?auto_42948 ?auto_42949 ) ( CLEAR ?auto_42948 ) ( ON-TABLE ?auto_42950 ) ( HOLDING ?auto_42947 ) ( CLEAR ?auto_42946 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42944 ?auto_42945 ?auto_42946 ?auto_42947 )
      ( MAKE-6PILE ?auto_42944 ?auto_42945 ?auto_42946 ?auto_42947 ?auto_42948 ?auto_42949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42951 - BLOCK
      ?auto_42952 - BLOCK
      ?auto_42953 - BLOCK
      ?auto_42954 - BLOCK
      ?auto_42955 - BLOCK
      ?auto_42956 - BLOCK
    )
    :vars
    (
      ?auto_42957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42951 ) ( ON ?auto_42952 ?auto_42951 ) ( ON ?auto_42953 ?auto_42952 ) ( not ( = ?auto_42951 ?auto_42952 ) ) ( not ( = ?auto_42951 ?auto_42953 ) ) ( not ( = ?auto_42951 ?auto_42954 ) ) ( not ( = ?auto_42951 ?auto_42955 ) ) ( not ( = ?auto_42951 ?auto_42956 ) ) ( not ( = ?auto_42952 ?auto_42953 ) ) ( not ( = ?auto_42952 ?auto_42954 ) ) ( not ( = ?auto_42952 ?auto_42955 ) ) ( not ( = ?auto_42952 ?auto_42956 ) ) ( not ( = ?auto_42953 ?auto_42954 ) ) ( not ( = ?auto_42953 ?auto_42955 ) ) ( not ( = ?auto_42953 ?auto_42956 ) ) ( not ( = ?auto_42954 ?auto_42955 ) ) ( not ( = ?auto_42954 ?auto_42956 ) ) ( not ( = ?auto_42955 ?auto_42956 ) ) ( ON ?auto_42956 ?auto_42957 ) ( not ( = ?auto_42951 ?auto_42957 ) ) ( not ( = ?auto_42952 ?auto_42957 ) ) ( not ( = ?auto_42953 ?auto_42957 ) ) ( not ( = ?auto_42954 ?auto_42957 ) ) ( not ( = ?auto_42955 ?auto_42957 ) ) ( not ( = ?auto_42956 ?auto_42957 ) ) ( ON ?auto_42955 ?auto_42956 ) ( ON-TABLE ?auto_42957 ) ( CLEAR ?auto_42953 ) ( ON ?auto_42954 ?auto_42955 ) ( CLEAR ?auto_42954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42957 ?auto_42956 ?auto_42955 )
      ( MAKE-6PILE ?auto_42951 ?auto_42952 ?auto_42953 ?auto_42954 ?auto_42955 ?auto_42956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42958 - BLOCK
      ?auto_42959 - BLOCK
      ?auto_42960 - BLOCK
      ?auto_42961 - BLOCK
      ?auto_42962 - BLOCK
      ?auto_42963 - BLOCK
    )
    :vars
    (
      ?auto_42964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42958 ) ( ON ?auto_42959 ?auto_42958 ) ( not ( = ?auto_42958 ?auto_42959 ) ) ( not ( = ?auto_42958 ?auto_42960 ) ) ( not ( = ?auto_42958 ?auto_42961 ) ) ( not ( = ?auto_42958 ?auto_42962 ) ) ( not ( = ?auto_42958 ?auto_42963 ) ) ( not ( = ?auto_42959 ?auto_42960 ) ) ( not ( = ?auto_42959 ?auto_42961 ) ) ( not ( = ?auto_42959 ?auto_42962 ) ) ( not ( = ?auto_42959 ?auto_42963 ) ) ( not ( = ?auto_42960 ?auto_42961 ) ) ( not ( = ?auto_42960 ?auto_42962 ) ) ( not ( = ?auto_42960 ?auto_42963 ) ) ( not ( = ?auto_42961 ?auto_42962 ) ) ( not ( = ?auto_42961 ?auto_42963 ) ) ( not ( = ?auto_42962 ?auto_42963 ) ) ( ON ?auto_42963 ?auto_42964 ) ( not ( = ?auto_42958 ?auto_42964 ) ) ( not ( = ?auto_42959 ?auto_42964 ) ) ( not ( = ?auto_42960 ?auto_42964 ) ) ( not ( = ?auto_42961 ?auto_42964 ) ) ( not ( = ?auto_42962 ?auto_42964 ) ) ( not ( = ?auto_42963 ?auto_42964 ) ) ( ON ?auto_42962 ?auto_42963 ) ( ON-TABLE ?auto_42964 ) ( ON ?auto_42961 ?auto_42962 ) ( CLEAR ?auto_42961 ) ( HOLDING ?auto_42960 ) ( CLEAR ?auto_42959 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_42958 ?auto_42959 ?auto_42960 )
      ( MAKE-6PILE ?auto_42958 ?auto_42959 ?auto_42960 ?auto_42961 ?auto_42962 ?auto_42963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42965 - BLOCK
      ?auto_42966 - BLOCK
      ?auto_42967 - BLOCK
      ?auto_42968 - BLOCK
      ?auto_42969 - BLOCK
      ?auto_42970 - BLOCK
    )
    :vars
    (
      ?auto_42971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42965 ) ( ON ?auto_42966 ?auto_42965 ) ( not ( = ?auto_42965 ?auto_42966 ) ) ( not ( = ?auto_42965 ?auto_42967 ) ) ( not ( = ?auto_42965 ?auto_42968 ) ) ( not ( = ?auto_42965 ?auto_42969 ) ) ( not ( = ?auto_42965 ?auto_42970 ) ) ( not ( = ?auto_42966 ?auto_42967 ) ) ( not ( = ?auto_42966 ?auto_42968 ) ) ( not ( = ?auto_42966 ?auto_42969 ) ) ( not ( = ?auto_42966 ?auto_42970 ) ) ( not ( = ?auto_42967 ?auto_42968 ) ) ( not ( = ?auto_42967 ?auto_42969 ) ) ( not ( = ?auto_42967 ?auto_42970 ) ) ( not ( = ?auto_42968 ?auto_42969 ) ) ( not ( = ?auto_42968 ?auto_42970 ) ) ( not ( = ?auto_42969 ?auto_42970 ) ) ( ON ?auto_42970 ?auto_42971 ) ( not ( = ?auto_42965 ?auto_42971 ) ) ( not ( = ?auto_42966 ?auto_42971 ) ) ( not ( = ?auto_42967 ?auto_42971 ) ) ( not ( = ?auto_42968 ?auto_42971 ) ) ( not ( = ?auto_42969 ?auto_42971 ) ) ( not ( = ?auto_42970 ?auto_42971 ) ) ( ON ?auto_42969 ?auto_42970 ) ( ON-TABLE ?auto_42971 ) ( ON ?auto_42968 ?auto_42969 ) ( CLEAR ?auto_42966 ) ( ON ?auto_42967 ?auto_42968 ) ( CLEAR ?auto_42967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_42971 ?auto_42970 ?auto_42969 ?auto_42968 )
      ( MAKE-6PILE ?auto_42965 ?auto_42966 ?auto_42967 ?auto_42968 ?auto_42969 ?auto_42970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42972 - BLOCK
      ?auto_42973 - BLOCK
      ?auto_42974 - BLOCK
      ?auto_42975 - BLOCK
      ?auto_42976 - BLOCK
      ?auto_42977 - BLOCK
    )
    :vars
    (
      ?auto_42978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42972 ) ( not ( = ?auto_42972 ?auto_42973 ) ) ( not ( = ?auto_42972 ?auto_42974 ) ) ( not ( = ?auto_42972 ?auto_42975 ) ) ( not ( = ?auto_42972 ?auto_42976 ) ) ( not ( = ?auto_42972 ?auto_42977 ) ) ( not ( = ?auto_42973 ?auto_42974 ) ) ( not ( = ?auto_42973 ?auto_42975 ) ) ( not ( = ?auto_42973 ?auto_42976 ) ) ( not ( = ?auto_42973 ?auto_42977 ) ) ( not ( = ?auto_42974 ?auto_42975 ) ) ( not ( = ?auto_42974 ?auto_42976 ) ) ( not ( = ?auto_42974 ?auto_42977 ) ) ( not ( = ?auto_42975 ?auto_42976 ) ) ( not ( = ?auto_42975 ?auto_42977 ) ) ( not ( = ?auto_42976 ?auto_42977 ) ) ( ON ?auto_42977 ?auto_42978 ) ( not ( = ?auto_42972 ?auto_42978 ) ) ( not ( = ?auto_42973 ?auto_42978 ) ) ( not ( = ?auto_42974 ?auto_42978 ) ) ( not ( = ?auto_42975 ?auto_42978 ) ) ( not ( = ?auto_42976 ?auto_42978 ) ) ( not ( = ?auto_42977 ?auto_42978 ) ) ( ON ?auto_42976 ?auto_42977 ) ( ON-TABLE ?auto_42978 ) ( ON ?auto_42975 ?auto_42976 ) ( ON ?auto_42974 ?auto_42975 ) ( CLEAR ?auto_42974 ) ( HOLDING ?auto_42973 ) ( CLEAR ?auto_42972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_42972 ?auto_42973 )
      ( MAKE-6PILE ?auto_42972 ?auto_42973 ?auto_42974 ?auto_42975 ?auto_42976 ?auto_42977 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42979 - BLOCK
      ?auto_42980 - BLOCK
      ?auto_42981 - BLOCK
      ?auto_42982 - BLOCK
      ?auto_42983 - BLOCK
      ?auto_42984 - BLOCK
    )
    :vars
    (
      ?auto_42985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_42979 ) ( not ( = ?auto_42979 ?auto_42980 ) ) ( not ( = ?auto_42979 ?auto_42981 ) ) ( not ( = ?auto_42979 ?auto_42982 ) ) ( not ( = ?auto_42979 ?auto_42983 ) ) ( not ( = ?auto_42979 ?auto_42984 ) ) ( not ( = ?auto_42980 ?auto_42981 ) ) ( not ( = ?auto_42980 ?auto_42982 ) ) ( not ( = ?auto_42980 ?auto_42983 ) ) ( not ( = ?auto_42980 ?auto_42984 ) ) ( not ( = ?auto_42981 ?auto_42982 ) ) ( not ( = ?auto_42981 ?auto_42983 ) ) ( not ( = ?auto_42981 ?auto_42984 ) ) ( not ( = ?auto_42982 ?auto_42983 ) ) ( not ( = ?auto_42982 ?auto_42984 ) ) ( not ( = ?auto_42983 ?auto_42984 ) ) ( ON ?auto_42984 ?auto_42985 ) ( not ( = ?auto_42979 ?auto_42985 ) ) ( not ( = ?auto_42980 ?auto_42985 ) ) ( not ( = ?auto_42981 ?auto_42985 ) ) ( not ( = ?auto_42982 ?auto_42985 ) ) ( not ( = ?auto_42983 ?auto_42985 ) ) ( not ( = ?auto_42984 ?auto_42985 ) ) ( ON ?auto_42983 ?auto_42984 ) ( ON-TABLE ?auto_42985 ) ( ON ?auto_42982 ?auto_42983 ) ( ON ?auto_42981 ?auto_42982 ) ( CLEAR ?auto_42979 ) ( ON ?auto_42980 ?auto_42981 ) ( CLEAR ?auto_42980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_42985 ?auto_42984 ?auto_42983 ?auto_42982 ?auto_42981 )
      ( MAKE-6PILE ?auto_42979 ?auto_42980 ?auto_42981 ?auto_42982 ?auto_42983 ?auto_42984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42986 - BLOCK
      ?auto_42987 - BLOCK
      ?auto_42988 - BLOCK
      ?auto_42989 - BLOCK
      ?auto_42990 - BLOCK
      ?auto_42991 - BLOCK
    )
    :vars
    (
      ?auto_42992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42986 ?auto_42987 ) ) ( not ( = ?auto_42986 ?auto_42988 ) ) ( not ( = ?auto_42986 ?auto_42989 ) ) ( not ( = ?auto_42986 ?auto_42990 ) ) ( not ( = ?auto_42986 ?auto_42991 ) ) ( not ( = ?auto_42987 ?auto_42988 ) ) ( not ( = ?auto_42987 ?auto_42989 ) ) ( not ( = ?auto_42987 ?auto_42990 ) ) ( not ( = ?auto_42987 ?auto_42991 ) ) ( not ( = ?auto_42988 ?auto_42989 ) ) ( not ( = ?auto_42988 ?auto_42990 ) ) ( not ( = ?auto_42988 ?auto_42991 ) ) ( not ( = ?auto_42989 ?auto_42990 ) ) ( not ( = ?auto_42989 ?auto_42991 ) ) ( not ( = ?auto_42990 ?auto_42991 ) ) ( ON ?auto_42991 ?auto_42992 ) ( not ( = ?auto_42986 ?auto_42992 ) ) ( not ( = ?auto_42987 ?auto_42992 ) ) ( not ( = ?auto_42988 ?auto_42992 ) ) ( not ( = ?auto_42989 ?auto_42992 ) ) ( not ( = ?auto_42990 ?auto_42992 ) ) ( not ( = ?auto_42991 ?auto_42992 ) ) ( ON ?auto_42990 ?auto_42991 ) ( ON-TABLE ?auto_42992 ) ( ON ?auto_42989 ?auto_42990 ) ( ON ?auto_42988 ?auto_42989 ) ( ON ?auto_42987 ?auto_42988 ) ( CLEAR ?auto_42987 ) ( HOLDING ?auto_42986 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_42986 )
      ( MAKE-6PILE ?auto_42986 ?auto_42987 ?auto_42988 ?auto_42989 ?auto_42990 ?auto_42991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_42993 - BLOCK
      ?auto_42994 - BLOCK
      ?auto_42995 - BLOCK
      ?auto_42996 - BLOCK
      ?auto_42997 - BLOCK
      ?auto_42998 - BLOCK
    )
    :vars
    (
      ?auto_42999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42993 ?auto_42994 ) ) ( not ( = ?auto_42993 ?auto_42995 ) ) ( not ( = ?auto_42993 ?auto_42996 ) ) ( not ( = ?auto_42993 ?auto_42997 ) ) ( not ( = ?auto_42993 ?auto_42998 ) ) ( not ( = ?auto_42994 ?auto_42995 ) ) ( not ( = ?auto_42994 ?auto_42996 ) ) ( not ( = ?auto_42994 ?auto_42997 ) ) ( not ( = ?auto_42994 ?auto_42998 ) ) ( not ( = ?auto_42995 ?auto_42996 ) ) ( not ( = ?auto_42995 ?auto_42997 ) ) ( not ( = ?auto_42995 ?auto_42998 ) ) ( not ( = ?auto_42996 ?auto_42997 ) ) ( not ( = ?auto_42996 ?auto_42998 ) ) ( not ( = ?auto_42997 ?auto_42998 ) ) ( ON ?auto_42998 ?auto_42999 ) ( not ( = ?auto_42993 ?auto_42999 ) ) ( not ( = ?auto_42994 ?auto_42999 ) ) ( not ( = ?auto_42995 ?auto_42999 ) ) ( not ( = ?auto_42996 ?auto_42999 ) ) ( not ( = ?auto_42997 ?auto_42999 ) ) ( not ( = ?auto_42998 ?auto_42999 ) ) ( ON ?auto_42997 ?auto_42998 ) ( ON-TABLE ?auto_42999 ) ( ON ?auto_42996 ?auto_42997 ) ( ON ?auto_42995 ?auto_42996 ) ( ON ?auto_42994 ?auto_42995 ) ( ON ?auto_42993 ?auto_42994 ) ( CLEAR ?auto_42993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_42999 ?auto_42998 ?auto_42997 ?auto_42996 ?auto_42995 ?auto_42994 )
      ( MAKE-6PILE ?auto_42993 ?auto_42994 ?auto_42995 ?auto_42996 ?auto_42997 ?auto_42998 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43080 - BLOCK
    )
    :vars
    (
      ?auto_43081 - BLOCK
      ?auto_43082 - BLOCK
      ?auto_43083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43080 ?auto_43081 ) ( CLEAR ?auto_43080 ) ( not ( = ?auto_43080 ?auto_43081 ) ) ( HOLDING ?auto_43082 ) ( CLEAR ?auto_43083 ) ( not ( = ?auto_43080 ?auto_43082 ) ) ( not ( = ?auto_43080 ?auto_43083 ) ) ( not ( = ?auto_43081 ?auto_43082 ) ) ( not ( = ?auto_43081 ?auto_43083 ) ) ( not ( = ?auto_43082 ?auto_43083 ) ) )
    :subtasks
    ( ( !STACK ?auto_43082 ?auto_43083 )
      ( MAKE-1PILE ?auto_43080 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43084 - BLOCK
    )
    :vars
    (
      ?auto_43086 - BLOCK
      ?auto_43087 - BLOCK
      ?auto_43085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43084 ?auto_43086 ) ( not ( = ?auto_43084 ?auto_43086 ) ) ( CLEAR ?auto_43087 ) ( not ( = ?auto_43084 ?auto_43085 ) ) ( not ( = ?auto_43084 ?auto_43087 ) ) ( not ( = ?auto_43086 ?auto_43085 ) ) ( not ( = ?auto_43086 ?auto_43087 ) ) ( not ( = ?auto_43085 ?auto_43087 ) ) ( ON ?auto_43085 ?auto_43084 ) ( CLEAR ?auto_43085 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43086 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43086 ?auto_43084 )
      ( MAKE-1PILE ?auto_43084 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43088 - BLOCK
    )
    :vars
    (
      ?auto_43091 - BLOCK
      ?auto_43089 - BLOCK
      ?auto_43090 - BLOCK
      ?auto_43093 - BLOCK
      ?auto_43094 - BLOCK
      ?auto_43092 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43088 ?auto_43091 ) ( not ( = ?auto_43088 ?auto_43091 ) ) ( not ( = ?auto_43088 ?auto_43089 ) ) ( not ( = ?auto_43088 ?auto_43090 ) ) ( not ( = ?auto_43091 ?auto_43089 ) ) ( not ( = ?auto_43091 ?auto_43090 ) ) ( not ( = ?auto_43089 ?auto_43090 ) ) ( ON ?auto_43089 ?auto_43088 ) ( CLEAR ?auto_43089 ) ( ON-TABLE ?auto_43091 ) ( HOLDING ?auto_43090 ) ( CLEAR ?auto_43093 ) ( ON-TABLE ?auto_43094 ) ( ON ?auto_43092 ?auto_43094 ) ( ON ?auto_43093 ?auto_43092 ) ( not ( = ?auto_43094 ?auto_43092 ) ) ( not ( = ?auto_43094 ?auto_43093 ) ) ( not ( = ?auto_43094 ?auto_43090 ) ) ( not ( = ?auto_43092 ?auto_43093 ) ) ( not ( = ?auto_43092 ?auto_43090 ) ) ( not ( = ?auto_43093 ?auto_43090 ) ) ( not ( = ?auto_43088 ?auto_43093 ) ) ( not ( = ?auto_43088 ?auto_43094 ) ) ( not ( = ?auto_43088 ?auto_43092 ) ) ( not ( = ?auto_43091 ?auto_43093 ) ) ( not ( = ?auto_43091 ?auto_43094 ) ) ( not ( = ?auto_43091 ?auto_43092 ) ) ( not ( = ?auto_43089 ?auto_43093 ) ) ( not ( = ?auto_43089 ?auto_43094 ) ) ( not ( = ?auto_43089 ?auto_43092 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43094 ?auto_43092 ?auto_43093 ?auto_43090 )
      ( MAKE-1PILE ?auto_43088 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43095 - BLOCK
    )
    :vars
    (
      ?auto_43096 - BLOCK
      ?auto_43100 - BLOCK
      ?auto_43099 - BLOCK
      ?auto_43101 - BLOCK
      ?auto_43097 - BLOCK
      ?auto_43098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43095 ?auto_43096 ) ( not ( = ?auto_43095 ?auto_43096 ) ) ( not ( = ?auto_43095 ?auto_43100 ) ) ( not ( = ?auto_43095 ?auto_43099 ) ) ( not ( = ?auto_43096 ?auto_43100 ) ) ( not ( = ?auto_43096 ?auto_43099 ) ) ( not ( = ?auto_43100 ?auto_43099 ) ) ( ON ?auto_43100 ?auto_43095 ) ( ON-TABLE ?auto_43096 ) ( CLEAR ?auto_43101 ) ( ON-TABLE ?auto_43097 ) ( ON ?auto_43098 ?auto_43097 ) ( ON ?auto_43101 ?auto_43098 ) ( not ( = ?auto_43097 ?auto_43098 ) ) ( not ( = ?auto_43097 ?auto_43101 ) ) ( not ( = ?auto_43097 ?auto_43099 ) ) ( not ( = ?auto_43098 ?auto_43101 ) ) ( not ( = ?auto_43098 ?auto_43099 ) ) ( not ( = ?auto_43101 ?auto_43099 ) ) ( not ( = ?auto_43095 ?auto_43101 ) ) ( not ( = ?auto_43095 ?auto_43097 ) ) ( not ( = ?auto_43095 ?auto_43098 ) ) ( not ( = ?auto_43096 ?auto_43101 ) ) ( not ( = ?auto_43096 ?auto_43097 ) ) ( not ( = ?auto_43096 ?auto_43098 ) ) ( not ( = ?auto_43100 ?auto_43101 ) ) ( not ( = ?auto_43100 ?auto_43097 ) ) ( not ( = ?auto_43100 ?auto_43098 ) ) ( ON ?auto_43099 ?auto_43100 ) ( CLEAR ?auto_43099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43096 ?auto_43095 ?auto_43100 )
      ( MAKE-1PILE ?auto_43095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43102 - BLOCK
    )
    :vars
    (
      ?auto_43103 - BLOCK
      ?auto_43105 - BLOCK
      ?auto_43107 - BLOCK
      ?auto_43108 - BLOCK
      ?auto_43106 - BLOCK
      ?auto_43104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43102 ?auto_43103 ) ( not ( = ?auto_43102 ?auto_43103 ) ) ( not ( = ?auto_43102 ?auto_43105 ) ) ( not ( = ?auto_43102 ?auto_43107 ) ) ( not ( = ?auto_43103 ?auto_43105 ) ) ( not ( = ?auto_43103 ?auto_43107 ) ) ( not ( = ?auto_43105 ?auto_43107 ) ) ( ON ?auto_43105 ?auto_43102 ) ( ON-TABLE ?auto_43103 ) ( ON-TABLE ?auto_43108 ) ( ON ?auto_43106 ?auto_43108 ) ( not ( = ?auto_43108 ?auto_43106 ) ) ( not ( = ?auto_43108 ?auto_43104 ) ) ( not ( = ?auto_43108 ?auto_43107 ) ) ( not ( = ?auto_43106 ?auto_43104 ) ) ( not ( = ?auto_43106 ?auto_43107 ) ) ( not ( = ?auto_43104 ?auto_43107 ) ) ( not ( = ?auto_43102 ?auto_43104 ) ) ( not ( = ?auto_43102 ?auto_43108 ) ) ( not ( = ?auto_43102 ?auto_43106 ) ) ( not ( = ?auto_43103 ?auto_43104 ) ) ( not ( = ?auto_43103 ?auto_43108 ) ) ( not ( = ?auto_43103 ?auto_43106 ) ) ( not ( = ?auto_43105 ?auto_43104 ) ) ( not ( = ?auto_43105 ?auto_43108 ) ) ( not ( = ?auto_43105 ?auto_43106 ) ) ( ON ?auto_43107 ?auto_43105 ) ( CLEAR ?auto_43107 ) ( HOLDING ?auto_43104 ) ( CLEAR ?auto_43106 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43108 ?auto_43106 ?auto_43104 )
      ( MAKE-1PILE ?auto_43102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43109 - BLOCK
    )
    :vars
    (
      ?auto_43110 - BLOCK
      ?auto_43112 - BLOCK
      ?auto_43115 - BLOCK
      ?auto_43111 - BLOCK
      ?auto_43113 - BLOCK
      ?auto_43114 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43109 ?auto_43110 ) ( not ( = ?auto_43109 ?auto_43110 ) ) ( not ( = ?auto_43109 ?auto_43112 ) ) ( not ( = ?auto_43109 ?auto_43115 ) ) ( not ( = ?auto_43110 ?auto_43112 ) ) ( not ( = ?auto_43110 ?auto_43115 ) ) ( not ( = ?auto_43112 ?auto_43115 ) ) ( ON ?auto_43112 ?auto_43109 ) ( ON-TABLE ?auto_43110 ) ( ON-TABLE ?auto_43111 ) ( ON ?auto_43113 ?auto_43111 ) ( not ( = ?auto_43111 ?auto_43113 ) ) ( not ( = ?auto_43111 ?auto_43114 ) ) ( not ( = ?auto_43111 ?auto_43115 ) ) ( not ( = ?auto_43113 ?auto_43114 ) ) ( not ( = ?auto_43113 ?auto_43115 ) ) ( not ( = ?auto_43114 ?auto_43115 ) ) ( not ( = ?auto_43109 ?auto_43114 ) ) ( not ( = ?auto_43109 ?auto_43111 ) ) ( not ( = ?auto_43109 ?auto_43113 ) ) ( not ( = ?auto_43110 ?auto_43114 ) ) ( not ( = ?auto_43110 ?auto_43111 ) ) ( not ( = ?auto_43110 ?auto_43113 ) ) ( not ( = ?auto_43112 ?auto_43114 ) ) ( not ( = ?auto_43112 ?auto_43111 ) ) ( not ( = ?auto_43112 ?auto_43113 ) ) ( ON ?auto_43115 ?auto_43112 ) ( CLEAR ?auto_43113 ) ( ON ?auto_43114 ?auto_43115 ) ( CLEAR ?auto_43114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43110 ?auto_43109 ?auto_43112 ?auto_43115 )
      ( MAKE-1PILE ?auto_43109 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43116 - BLOCK
    )
    :vars
    (
      ?auto_43118 - BLOCK
      ?auto_43120 - BLOCK
      ?auto_43122 - BLOCK
      ?auto_43121 - BLOCK
      ?auto_43119 - BLOCK
      ?auto_43117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43116 ?auto_43118 ) ( not ( = ?auto_43116 ?auto_43118 ) ) ( not ( = ?auto_43116 ?auto_43120 ) ) ( not ( = ?auto_43116 ?auto_43122 ) ) ( not ( = ?auto_43118 ?auto_43120 ) ) ( not ( = ?auto_43118 ?auto_43122 ) ) ( not ( = ?auto_43120 ?auto_43122 ) ) ( ON ?auto_43120 ?auto_43116 ) ( ON-TABLE ?auto_43118 ) ( ON-TABLE ?auto_43121 ) ( not ( = ?auto_43121 ?auto_43119 ) ) ( not ( = ?auto_43121 ?auto_43117 ) ) ( not ( = ?auto_43121 ?auto_43122 ) ) ( not ( = ?auto_43119 ?auto_43117 ) ) ( not ( = ?auto_43119 ?auto_43122 ) ) ( not ( = ?auto_43117 ?auto_43122 ) ) ( not ( = ?auto_43116 ?auto_43117 ) ) ( not ( = ?auto_43116 ?auto_43121 ) ) ( not ( = ?auto_43116 ?auto_43119 ) ) ( not ( = ?auto_43118 ?auto_43117 ) ) ( not ( = ?auto_43118 ?auto_43121 ) ) ( not ( = ?auto_43118 ?auto_43119 ) ) ( not ( = ?auto_43120 ?auto_43117 ) ) ( not ( = ?auto_43120 ?auto_43121 ) ) ( not ( = ?auto_43120 ?auto_43119 ) ) ( ON ?auto_43122 ?auto_43120 ) ( ON ?auto_43117 ?auto_43122 ) ( CLEAR ?auto_43117 ) ( HOLDING ?auto_43119 ) ( CLEAR ?auto_43121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43121 ?auto_43119 )
      ( MAKE-1PILE ?auto_43116 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43123 - BLOCK
    )
    :vars
    (
      ?auto_43129 - BLOCK
      ?auto_43125 - BLOCK
      ?auto_43127 - BLOCK
      ?auto_43124 - BLOCK
      ?auto_43126 - BLOCK
      ?auto_43128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43123 ?auto_43129 ) ( not ( = ?auto_43123 ?auto_43129 ) ) ( not ( = ?auto_43123 ?auto_43125 ) ) ( not ( = ?auto_43123 ?auto_43127 ) ) ( not ( = ?auto_43129 ?auto_43125 ) ) ( not ( = ?auto_43129 ?auto_43127 ) ) ( not ( = ?auto_43125 ?auto_43127 ) ) ( ON ?auto_43125 ?auto_43123 ) ( ON-TABLE ?auto_43129 ) ( ON-TABLE ?auto_43124 ) ( not ( = ?auto_43124 ?auto_43126 ) ) ( not ( = ?auto_43124 ?auto_43128 ) ) ( not ( = ?auto_43124 ?auto_43127 ) ) ( not ( = ?auto_43126 ?auto_43128 ) ) ( not ( = ?auto_43126 ?auto_43127 ) ) ( not ( = ?auto_43128 ?auto_43127 ) ) ( not ( = ?auto_43123 ?auto_43128 ) ) ( not ( = ?auto_43123 ?auto_43124 ) ) ( not ( = ?auto_43123 ?auto_43126 ) ) ( not ( = ?auto_43129 ?auto_43128 ) ) ( not ( = ?auto_43129 ?auto_43124 ) ) ( not ( = ?auto_43129 ?auto_43126 ) ) ( not ( = ?auto_43125 ?auto_43128 ) ) ( not ( = ?auto_43125 ?auto_43124 ) ) ( not ( = ?auto_43125 ?auto_43126 ) ) ( ON ?auto_43127 ?auto_43125 ) ( ON ?auto_43128 ?auto_43127 ) ( CLEAR ?auto_43124 ) ( ON ?auto_43126 ?auto_43128 ) ( CLEAR ?auto_43126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43129 ?auto_43123 ?auto_43125 ?auto_43127 ?auto_43128 )
      ( MAKE-1PILE ?auto_43123 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43130 - BLOCK
    )
    :vars
    (
      ?auto_43133 - BLOCK
      ?auto_43134 - BLOCK
      ?auto_43135 - BLOCK
      ?auto_43132 - BLOCK
      ?auto_43136 - BLOCK
      ?auto_43131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43130 ?auto_43133 ) ( not ( = ?auto_43130 ?auto_43133 ) ) ( not ( = ?auto_43130 ?auto_43134 ) ) ( not ( = ?auto_43130 ?auto_43135 ) ) ( not ( = ?auto_43133 ?auto_43134 ) ) ( not ( = ?auto_43133 ?auto_43135 ) ) ( not ( = ?auto_43134 ?auto_43135 ) ) ( ON ?auto_43134 ?auto_43130 ) ( ON-TABLE ?auto_43133 ) ( not ( = ?auto_43132 ?auto_43136 ) ) ( not ( = ?auto_43132 ?auto_43131 ) ) ( not ( = ?auto_43132 ?auto_43135 ) ) ( not ( = ?auto_43136 ?auto_43131 ) ) ( not ( = ?auto_43136 ?auto_43135 ) ) ( not ( = ?auto_43131 ?auto_43135 ) ) ( not ( = ?auto_43130 ?auto_43131 ) ) ( not ( = ?auto_43130 ?auto_43132 ) ) ( not ( = ?auto_43130 ?auto_43136 ) ) ( not ( = ?auto_43133 ?auto_43131 ) ) ( not ( = ?auto_43133 ?auto_43132 ) ) ( not ( = ?auto_43133 ?auto_43136 ) ) ( not ( = ?auto_43134 ?auto_43131 ) ) ( not ( = ?auto_43134 ?auto_43132 ) ) ( not ( = ?auto_43134 ?auto_43136 ) ) ( ON ?auto_43135 ?auto_43134 ) ( ON ?auto_43131 ?auto_43135 ) ( ON ?auto_43136 ?auto_43131 ) ( CLEAR ?auto_43136 ) ( HOLDING ?auto_43132 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43132 )
      ( MAKE-1PILE ?auto_43130 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43137 - BLOCK
    )
    :vars
    (
      ?auto_43138 - BLOCK
      ?auto_43139 - BLOCK
      ?auto_43142 - BLOCK
      ?auto_43141 - BLOCK
      ?auto_43143 - BLOCK
      ?auto_43140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43137 ?auto_43138 ) ( not ( = ?auto_43137 ?auto_43138 ) ) ( not ( = ?auto_43137 ?auto_43139 ) ) ( not ( = ?auto_43137 ?auto_43142 ) ) ( not ( = ?auto_43138 ?auto_43139 ) ) ( not ( = ?auto_43138 ?auto_43142 ) ) ( not ( = ?auto_43139 ?auto_43142 ) ) ( ON ?auto_43139 ?auto_43137 ) ( ON-TABLE ?auto_43138 ) ( not ( = ?auto_43141 ?auto_43143 ) ) ( not ( = ?auto_43141 ?auto_43140 ) ) ( not ( = ?auto_43141 ?auto_43142 ) ) ( not ( = ?auto_43143 ?auto_43140 ) ) ( not ( = ?auto_43143 ?auto_43142 ) ) ( not ( = ?auto_43140 ?auto_43142 ) ) ( not ( = ?auto_43137 ?auto_43140 ) ) ( not ( = ?auto_43137 ?auto_43141 ) ) ( not ( = ?auto_43137 ?auto_43143 ) ) ( not ( = ?auto_43138 ?auto_43140 ) ) ( not ( = ?auto_43138 ?auto_43141 ) ) ( not ( = ?auto_43138 ?auto_43143 ) ) ( not ( = ?auto_43139 ?auto_43140 ) ) ( not ( = ?auto_43139 ?auto_43141 ) ) ( not ( = ?auto_43139 ?auto_43143 ) ) ( ON ?auto_43142 ?auto_43139 ) ( ON ?auto_43140 ?auto_43142 ) ( ON ?auto_43143 ?auto_43140 ) ( ON ?auto_43141 ?auto_43143 ) ( CLEAR ?auto_43141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43138 ?auto_43137 ?auto_43139 ?auto_43142 ?auto_43140 ?auto_43143 )
      ( MAKE-1PILE ?auto_43137 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43153 - BLOCK
      ?auto_43154 - BLOCK
      ?auto_43155 - BLOCK
      ?auto_43156 - BLOCK
    )
    :vars
    (
      ?auto_43157 - BLOCK
      ?auto_43158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43157 ?auto_43156 ) ( CLEAR ?auto_43157 ) ( ON-TABLE ?auto_43153 ) ( ON ?auto_43154 ?auto_43153 ) ( ON ?auto_43155 ?auto_43154 ) ( ON ?auto_43156 ?auto_43155 ) ( not ( = ?auto_43153 ?auto_43154 ) ) ( not ( = ?auto_43153 ?auto_43155 ) ) ( not ( = ?auto_43153 ?auto_43156 ) ) ( not ( = ?auto_43153 ?auto_43157 ) ) ( not ( = ?auto_43154 ?auto_43155 ) ) ( not ( = ?auto_43154 ?auto_43156 ) ) ( not ( = ?auto_43154 ?auto_43157 ) ) ( not ( = ?auto_43155 ?auto_43156 ) ) ( not ( = ?auto_43155 ?auto_43157 ) ) ( not ( = ?auto_43156 ?auto_43157 ) ) ( HOLDING ?auto_43158 ) ( not ( = ?auto_43153 ?auto_43158 ) ) ( not ( = ?auto_43154 ?auto_43158 ) ) ( not ( = ?auto_43155 ?auto_43158 ) ) ( not ( = ?auto_43156 ?auto_43158 ) ) ( not ( = ?auto_43157 ?auto_43158 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_43158 )
      ( MAKE-4PILE ?auto_43153 ?auto_43154 ?auto_43155 ?auto_43156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43226 - BLOCK
      ?auto_43227 - BLOCK
    )
    :vars
    (
      ?auto_43228 - BLOCK
      ?auto_43231 - BLOCK
      ?auto_43229 - BLOCK
      ?auto_43230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43226 ?auto_43227 ) ) ( ON ?auto_43227 ?auto_43228 ) ( not ( = ?auto_43226 ?auto_43228 ) ) ( not ( = ?auto_43227 ?auto_43228 ) ) ( ON ?auto_43226 ?auto_43227 ) ( CLEAR ?auto_43226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43231 ) ( ON ?auto_43229 ?auto_43231 ) ( ON ?auto_43230 ?auto_43229 ) ( ON ?auto_43228 ?auto_43230 ) ( not ( = ?auto_43231 ?auto_43229 ) ) ( not ( = ?auto_43231 ?auto_43230 ) ) ( not ( = ?auto_43231 ?auto_43228 ) ) ( not ( = ?auto_43231 ?auto_43227 ) ) ( not ( = ?auto_43231 ?auto_43226 ) ) ( not ( = ?auto_43229 ?auto_43230 ) ) ( not ( = ?auto_43229 ?auto_43228 ) ) ( not ( = ?auto_43229 ?auto_43227 ) ) ( not ( = ?auto_43229 ?auto_43226 ) ) ( not ( = ?auto_43230 ?auto_43228 ) ) ( not ( = ?auto_43230 ?auto_43227 ) ) ( not ( = ?auto_43230 ?auto_43226 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43231 ?auto_43229 ?auto_43230 ?auto_43228 ?auto_43227 )
      ( MAKE-2PILE ?auto_43226 ?auto_43227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43234 - BLOCK
      ?auto_43235 - BLOCK
    )
    :vars
    (
      ?auto_43236 - BLOCK
      ?auto_43237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43234 ?auto_43235 ) ) ( ON ?auto_43235 ?auto_43236 ) ( CLEAR ?auto_43235 ) ( not ( = ?auto_43234 ?auto_43236 ) ) ( not ( = ?auto_43235 ?auto_43236 ) ) ( ON ?auto_43234 ?auto_43237 ) ( CLEAR ?auto_43234 ) ( HAND-EMPTY ) ( not ( = ?auto_43234 ?auto_43237 ) ) ( not ( = ?auto_43235 ?auto_43237 ) ) ( not ( = ?auto_43236 ?auto_43237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43234 ?auto_43237 )
      ( MAKE-2PILE ?auto_43234 ?auto_43235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43238 - BLOCK
      ?auto_43239 - BLOCK
    )
    :vars
    (
      ?auto_43241 - BLOCK
      ?auto_43240 - BLOCK
      ?auto_43242 - BLOCK
      ?auto_43243 - BLOCK
      ?auto_43244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43238 ?auto_43239 ) ) ( not ( = ?auto_43238 ?auto_43241 ) ) ( not ( = ?auto_43239 ?auto_43241 ) ) ( ON ?auto_43238 ?auto_43240 ) ( CLEAR ?auto_43238 ) ( not ( = ?auto_43238 ?auto_43240 ) ) ( not ( = ?auto_43239 ?auto_43240 ) ) ( not ( = ?auto_43241 ?auto_43240 ) ) ( HOLDING ?auto_43239 ) ( CLEAR ?auto_43241 ) ( ON-TABLE ?auto_43242 ) ( ON ?auto_43243 ?auto_43242 ) ( ON ?auto_43244 ?auto_43243 ) ( ON ?auto_43241 ?auto_43244 ) ( not ( = ?auto_43242 ?auto_43243 ) ) ( not ( = ?auto_43242 ?auto_43244 ) ) ( not ( = ?auto_43242 ?auto_43241 ) ) ( not ( = ?auto_43242 ?auto_43239 ) ) ( not ( = ?auto_43243 ?auto_43244 ) ) ( not ( = ?auto_43243 ?auto_43241 ) ) ( not ( = ?auto_43243 ?auto_43239 ) ) ( not ( = ?auto_43244 ?auto_43241 ) ) ( not ( = ?auto_43244 ?auto_43239 ) ) ( not ( = ?auto_43238 ?auto_43242 ) ) ( not ( = ?auto_43238 ?auto_43243 ) ) ( not ( = ?auto_43238 ?auto_43244 ) ) ( not ( = ?auto_43240 ?auto_43242 ) ) ( not ( = ?auto_43240 ?auto_43243 ) ) ( not ( = ?auto_43240 ?auto_43244 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43242 ?auto_43243 ?auto_43244 ?auto_43241 ?auto_43239 )
      ( MAKE-2PILE ?auto_43238 ?auto_43239 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43245 - BLOCK
      ?auto_43246 - BLOCK
    )
    :vars
    (
      ?auto_43247 - BLOCK
      ?auto_43250 - BLOCK
      ?auto_43251 - BLOCK
      ?auto_43249 - BLOCK
      ?auto_43248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43245 ?auto_43246 ) ) ( not ( = ?auto_43245 ?auto_43247 ) ) ( not ( = ?auto_43246 ?auto_43247 ) ) ( ON ?auto_43245 ?auto_43250 ) ( not ( = ?auto_43245 ?auto_43250 ) ) ( not ( = ?auto_43246 ?auto_43250 ) ) ( not ( = ?auto_43247 ?auto_43250 ) ) ( CLEAR ?auto_43247 ) ( ON-TABLE ?auto_43251 ) ( ON ?auto_43249 ?auto_43251 ) ( ON ?auto_43248 ?auto_43249 ) ( ON ?auto_43247 ?auto_43248 ) ( not ( = ?auto_43251 ?auto_43249 ) ) ( not ( = ?auto_43251 ?auto_43248 ) ) ( not ( = ?auto_43251 ?auto_43247 ) ) ( not ( = ?auto_43251 ?auto_43246 ) ) ( not ( = ?auto_43249 ?auto_43248 ) ) ( not ( = ?auto_43249 ?auto_43247 ) ) ( not ( = ?auto_43249 ?auto_43246 ) ) ( not ( = ?auto_43248 ?auto_43247 ) ) ( not ( = ?auto_43248 ?auto_43246 ) ) ( not ( = ?auto_43245 ?auto_43251 ) ) ( not ( = ?auto_43245 ?auto_43249 ) ) ( not ( = ?auto_43245 ?auto_43248 ) ) ( not ( = ?auto_43250 ?auto_43251 ) ) ( not ( = ?auto_43250 ?auto_43249 ) ) ( not ( = ?auto_43250 ?auto_43248 ) ) ( ON ?auto_43246 ?auto_43245 ) ( CLEAR ?auto_43246 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43250 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43250 ?auto_43245 )
      ( MAKE-2PILE ?auto_43245 ?auto_43246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43252 - BLOCK
      ?auto_43253 - BLOCK
    )
    :vars
    (
      ?auto_43257 - BLOCK
      ?auto_43254 - BLOCK
      ?auto_43256 - BLOCK
      ?auto_43258 - BLOCK
      ?auto_43255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43252 ?auto_43253 ) ) ( not ( = ?auto_43252 ?auto_43257 ) ) ( not ( = ?auto_43253 ?auto_43257 ) ) ( ON ?auto_43252 ?auto_43254 ) ( not ( = ?auto_43252 ?auto_43254 ) ) ( not ( = ?auto_43253 ?auto_43254 ) ) ( not ( = ?auto_43257 ?auto_43254 ) ) ( ON-TABLE ?auto_43256 ) ( ON ?auto_43258 ?auto_43256 ) ( ON ?auto_43255 ?auto_43258 ) ( not ( = ?auto_43256 ?auto_43258 ) ) ( not ( = ?auto_43256 ?auto_43255 ) ) ( not ( = ?auto_43256 ?auto_43257 ) ) ( not ( = ?auto_43256 ?auto_43253 ) ) ( not ( = ?auto_43258 ?auto_43255 ) ) ( not ( = ?auto_43258 ?auto_43257 ) ) ( not ( = ?auto_43258 ?auto_43253 ) ) ( not ( = ?auto_43255 ?auto_43257 ) ) ( not ( = ?auto_43255 ?auto_43253 ) ) ( not ( = ?auto_43252 ?auto_43256 ) ) ( not ( = ?auto_43252 ?auto_43258 ) ) ( not ( = ?auto_43252 ?auto_43255 ) ) ( not ( = ?auto_43254 ?auto_43256 ) ) ( not ( = ?auto_43254 ?auto_43258 ) ) ( not ( = ?auto_43254 ?auto_43255 ) ) ( ON ?auto_43253 ?auto_43252 ) ( CLEAR ?auto_43253 ) ( ON-TABLE ?auto_43254 ) ( HOLDING ?auto_43257 ) ( CLEAR ?auto_43255 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43256 ?auto_43258 ?auto_43255 ?auto_43257 )
      ( MAKE-2PILE ?auto_43252 ?auto_43253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43259 - BLOCK
      ?auto_43260 - BLOCK
    )
    :vars
    (
      ?auto_43263 - BLOCK
      ?auto_43265 - BLOCK
      ?auto_43261 - BLOCK
      ?auto_43264 - BLOCK
      ?auto_43262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43259 ?auto_43260 ) ) ( not ( = ?auto_43259 ?auto_43263 ) ) ( not ( = ?auto_43260 ?auto_43263 ) ) ( ON ?auto_43259 ?auto_43265 ) ( not ( = ?auto_43259 ?auto_43265 ) ) ( not ( = ?auto_43260 ?auto_43265 ) ) ( not ( = ?auto_43263 ?auto_43265 ) ) ( ON-TABLE ?auto_43261 ) ( ON ?auto_43264 ?auto_43261 ) ( ON ?auto_43262 ?auto_43264 ) ( not ( = ?auto_43261 ?auto_43264 ) ) ( not ( = ?auto_43261 ?auto_43262 ) ) ( not ( = ?auto_43261 ?auto_43263 ) ) ( not ( = ?auto_43261 ?auto_43260 ) ) ( not ( = ?auto_43264 ?auto_43262 ) ) ( not ( = ?auto_43264 ?auto_43263 ) ) ( not ( = ?auto_43264 ?auto_43260 ) ) ( not ( = ?auto_43262 ?auto_43263 ) ) ( not ( = ?auto_43262 ?auto_43260 ) ) ( not ( = ?auto_43259 ?auto_43261 ) ) ( not ( = ?auto_43259 ?auto_43264 ) ) ( not ( = ?auto_43259 ?auto_43262 ) ) ( not ( = ?auto_43265 ?auto_43261 ) ) ( not ( = ?auto_43265 ?auto_43264 ) ) ( not ( = ?auto_43265 ?auto_43262 ) ) ( ON ?auto_43260 ?auto_43259 ) ( ON-TABLE ?auto_43265 ) ( CLEAR ?auto_43262 ) ( ON ?auto_43263 ?auto_43260 ) ( CLEAR ?auto_43263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43265 ?auto_43259 ?auto_43260 )
      ( MAKE-2PILE ?auto_43259 ?auto_43260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43266 - BLOCK
      ?auto_43267 - BLOCK
    )
    :vars
    (
      ?auto_43269 - BLOCK
      ?auto_43272 - BLOCK
      ?auto_43270 - BLOCK
      ?auto_43268 - BLOCK
      ?auto_43271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43266 ?auto_43267 ) ) ( not ( = ?auto_43266 ?auto_43269 ) ) ( not ( = ?auto_43267 ?auto_43269 ) ) ( ON ?auto_43266 ?auto_43272 ) ( not ( = ?auto_43266 ?auto_43272 ) ) ( not ( = ?auto_43267 ?auto_43272 ) ) ( not ( = ?auto_43269 ?auto_43272 ) ) ( ON-TABLE ?auto_43270 ) ( ON ?auto_43268 ?auto_43270 ) ( not ( = ?auto_43270 ?auto_43268 ) ) ( not ( = ?auto_43270 ?auto_43271 ) ) ( not ( = ?auto_43270 ?auto_43269 ) ) ( not ( = ?auto_43270 ?auto_43267 ) ) ( not ( = ?auto_43268 ?auto_43271 ) ) ( not ( = ?auto_43268 ?auto_43269 ) ) ( not ( = ?auto_43268 ?auto_43267 ) ) ( not ( = ?auto_43271 ?auto_43269 ) ) ( not ( = ?auto_43271 ?auto_43267 ) ) ( not ( = ?auto_43266 ?auto_43270 ) ) ( not ( = ?auto_43266 ?auto_43268 ) ) ( not ( = ?auto_43266 ?auto_43271 ) ) ( not ( = ?auto_43272 ?auto_43270 ) ) ( not ( = ?auto_43272 ?auto_43268 ) ) ( not ( = ?auto_43272 ?auto_43271 ) ) ( ON ?auto_43267 ?auto_43266 ) ( ON-TABLE ?auto_43272 ) ( ON ?auto_43269 ?auto_43267 ) ( CLEAR ?auto_43269 ) ( HOLDING ?auto_43271 ) ( CLEAR ?auto_43268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43270 ?auto_43268 ?auto_43271 )
      ( MAKE-2PILE ?auto_43266 ?auto_43267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43273 - BLOCK
      ?auto_43274 - BLOCK
    )
    :vars
    (
      ?auto_43276 - BLOCK
      ?auto_43275 - BLOCK
      ?auto_43277 - BLOCK
      ?auto_43278 - BLOCK
      ?auto_43279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43273 ?auto_43274 ) ) ( not ( = ?auto_43273 ?auto_43276 ) ) ( not ( = ?auto_43274 ?auto_43276 ) ) ( ON ?auto_43273 ?auto_43275 ) ( not ( = ?auto_43273 ?auto_43275 ) ) ( not ( = ?auto_43274 ?auto_43275 ) ) ( not ( = ?auto_43276 ?auto_43275 ) ) ( ON-TABLE ?auto_43277 ) ( ON ?auto_43278 ?auto_43277 ) ( not ( = ?auto_43277 ?auto_43278 ) ) ( not ( = ?auto_43277 ?auto_43279 ) ) ( not ( = ?auto_43277 ?auto_43276 ) ) ( not ( = ?auto_43277 ?auto_43274 ) ) ( not ( = ?auto_43278 ?auto_43279 ) ) ( not ( = ?auto_43278 ?auto_43276 ) ) ( not ( = ?auto_43278 ?auto_43274 ) ) ( not ( = ?auto_43279 ?auto_43276 ) ) ( not ( = ?auto_43279 ?auto_43274 ) ) ( not ( = ?auto_43273 ?auto_43277 ) ) ( not ( = ?auto_43273 ?auto_43278 ) ) ( not ( = ?auto_43273 ?auto_43279 ) ) ( not ( = ?auto_43275 ?auto_43277 ) ) ( not ( = ?auto_43275 ?auto_43278 ) ) ( not ( = ?auto_43275 ?auto_43279 ) ) ( ON ?auto_43274 ?auto_43273 ) ( ON-TABLE ?auto_43275 ) ( ON ?auto_43276 ?auto_43274 ) ( CLEAR ?auto_43278 ) ( ON ?auto_43279 ?auto_43276 ) ( CLEAR ?auto_43279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43275 ?auto_43273 ?auto_43274 ?auto_43276 )
      ( MAKE-2PILE ?auto_43273 ?auto_43274 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43280 - BLOCK
      ?auto_43281 - BLOCK
    )
    :vars
    (
      ?auto_43282 - BLOCK
      ?auto_43283 - BLOCK
      ?auto_43286 - BLOCK
      ?auto_43285 - BLOCK
      ?auto_43284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43280 ?auto_43281 ) ) ( not ( = ?auto_43280 ?auto_43282 ) ) ( not ( = ?auto_43281 ?auto_43282 ) ) ( ON ?auto_43280 ?auto_43283 ) ( not ( = ?auto_43280 ?auto_43283 ) ) ( not ( = ?auto_43281 ?auto_43283 ) ) ( not ( = ?auto_43282 ?auto_43283 ) ) ( ON-TABLE ?auto_43286 ) ( not ( = ?auto_43286 ?auto_43285 ) ) ( not ( = ?auto_43286 ?auto_43284 ) ) ( not ( = ?auto_43286 ?auto_43282 ) ) ( not ( = ?auto_43286 ?auto_43281 ) ) ( not ( = ?auto_43285 ?auto_43284 ) ) ( not ( = ?auto_43285 ?auto_43282 ) ) ( not ( = ?auto_43285 ?auto_43281 ) ) ( not ( = ?auto_43284 ?auto_43282 ) ) ( not ( = ?auto_43284 ?auto_43281 ) ) ( not ( = ?auto_43280 ?auto_43286 ) ) ( not ( = ?auto_43280 ?auto_43285 ) ) ( not ( = ?auto_43280 ?auto_43284 ) ) ( not ( = ?auto_43283 ?auto_43286 ) ) ( not ( = ?auto_43283 ?auto_43285 ) ) ( not ( = ?auto_43283 ?auto_43284 ) ) ( ON ?auto_43281 ?auto_43280 ) ( ON-TABLE ?auto_43283 ) ( ON ?auto_43282 ?auto_43281 ) ( ON ?auto_43284 ?auto_43282 ) ( CLEAR ?auto_43284 ) ( HOLDING ?auto_43285 ) ( CLEAR ?auto_43286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43286 ?auto_43285 )
      ( MAKE-2PILE ?auto_43280 ?auto_43281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43287 - BLOCK
      ?auto_43288 - BLOCK
    )
    :vars
    (
      ?auto_43289 - BLOCK
      ?auto_43292 - BLOCK
      ?auto_43293 - BLOCK
      ?auto_43290 - BLOCK
      ?auto_43291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43287 ?auto_43288 ) ) ( not ( = ?auto_43287 ?auto_43289 ) ) ( not ( = ?auto_43288 ?auto_43289 ) ) ( ON ?auto_43287 ?auto_43292 ) ( not ( = ?auto_43287 ?auto_43292 ) ) ( not ( = ?auto_43288 ?auto_43292 ) ) ( not ( = ?auto_43289 ?auto_43292 ) ) ( ON-TABLE ?auto_43293 ) ( not ( = ?auto_43293 ?auto_43290 ) ) ( not ( = ?auto_43293 ?auto_43291 ) ) ( not ( = ?auto_43293 ?auto_43289 ) ) ( not ( = ?auto_43293 ?auto_43288 ) ) ( not ( = ?auto_43290 ?auto_43291 ) ) ( not ( = ?auto_43290 ?auto_43289 ) ) ( not ( = ?auto_43290 ?auto_43288 ) ) ( not ( = ?auto_43291 ?auto_43289 ) ) ( not ( = ?auto_43291 ?auto_43288 ) ) ( not ( = ?auto_43287 ?auto_43293 ) ) ( not ( = ?auto_43287 ?auto_43290 ) ) ( not ( = ?auto_43287 ?auto_43291 ) ) ( not ( = ?auto_43292 ?auto_43293 ) ) ( not ( = ?auto_43292 ?auto_43290 ) ) ( not ( = ?auto_43292 ?auto_43291 ) ) ( ON ?auto_43288 ?auto_43287 ) ( ON-TABLE ?auto_43292 ) ( ON ?auto_43289 ?auto_43288 ) ( ON ?auto_43291 ?auto_43289 ) ( CLEAR ?auto_43293 ) ( ON ?auto_43290 ?auto_43291 ) ( CLEAR ?auto_43290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43292 ?auto_43287 ?auto_43288 ?auto_43289 ?auto_43291 )
      ( MAKE-2PILE ?auto_43287 ?auto_43288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43294 - BLOCK
      ?auto_43295 - BLOCK
    )
    :vars
    (
      ?auto_43296 - BLOCK
      ?auto_43297 - BLOCK
      ?auto_43300 - BLOCK
      ?auto_43299 - BLOCK
      ?auto_43298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43294 ?auto_43295 ) ) ( not ( = ?auto_43294 ?auto_43296 ) ) ( not ( = ?auto_43295 ?auto_43296 ) ) ( ON ?auto_43294 ?auto_43297 ) ( not ( = ?auto_43294 ?auto_43297 ) ) ( not ( = ?auto_43295 ?auto_43297 ) ) ( not ( = ?auto_43296 ?auto_43297 ) ) ( not ( = ?auto_43300 ?auto_43299 ) ) ( not ( = ?auto_43300 ?auto_43298 ) ) ( not ( = ?auto_43300 ?auto_43296 ) ) ( not ( = ?auto_43300 ?auto_43295 ) ) ( not ( = ?auto_43299 ?auto_43298 ) ) ( not ( = ?auto_43299 ?auto_43296 ) ) ( not ( = ?auto_43299 ?auto_43295 ) ) ( not ( = ?auto_43298 ?auto_43296 ) ) ( not ( = ?auto_43298 ?auto_43295 ) ) ( not ( = ?auto_43294 ?auto_43300 ) ) ( not ( = ?auto_43294 ?auto_43299 ) ) ( not ( = ?auto_43294 ?auto_43298 ) ) ( not ( = ?auto_43297 ?auto_43300 ) ) ( not ( = ?auto_43297 ?auto_43299 ) ) ( not ( = ?auto_43297 ?auto_43298 ) ) ( ON ?auto_43295 ?auto_43294 ) ( ON-TABLE ?auto_43297 ) ( ON ?auto_43296 ?auto_43295 ) ( ON ?auto_43298 ?auto_43296 ) ( ON ?auto_43299 ?auto_43298 ) ( CLEAR ?auto_43299 ) ( HOLDING ?auto_43300 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43300 )
      ( MAKE-2PILE ?auto_43294 ?auto_43295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43301 - BLOCK
      ?auto_43302 - BLOCK
    )
    :vars
    (
      ?auto_43306 - BLOCK
      ?auto_43305 - BLOCK
      ?auto_43304 - BLOCK
      ?auto_43303 - BLOCK
      ?auto_43307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43301 ?auto_43302 ) ) ( not ( = ?auto_43301 ?auto_43306 ) ) ( not ( = ?auto_43302 ?auto_43306 ) ) ( ON ?auto_43301 ?auto_43305 ) ( not ( = ?auto_43301 ?auto_43305 ) ) ( not ( = ?auto_43302 ?auto_43305 ) ) ( not ( = ?auto_43306 ?auto_43305 ) ) ( not ( = ?auto_43304 ?auto_43303 ) ) ( not ( = ?auto_43304 ?auto_43307 ) ) ( not ( = ?auto_43304 ?auto_43306 ) ) ( not ( = ?auto_43304 ?auto_43302 ) ) ( not ( = ?auto_43303 ?auto_43307 ) ) ( not ( = ?auto_43303 ?auto_43306 ) ) ( not ( = ?auto_43303 ?auto_43302 ) ) ( not ( = ?auto_43307 ?auto_43306 ) ) ( not ( = ?auto_43307 ?auto_43302 ) ) ( not ( = ?auto_43301 ?auto_43304 ) ) ( not ( = ?auto_43301 ?auto_43303 ) ) ( not ( = ?auto_43301 ?auto_43307 ) ) ( not ( = ?auto_43305 ?auto_43304 ) ) ( not ( = ?auto_43305 ?auto_43303 ) ) ( not ( = ?auto_43305 ?auto_43307 ) ) ( ON ?auto_43302 ?auto_43301 ) ( ON-TABLE ?auto_43305 ) ( ON ?auto_43306 ?auto_43302 ) ( ON ?auto_43307 ?auto_43306 ) ( ON ?auto_43303 ?auto_43307 ) ( ON ?auto_43304 ?auto_43303 ) ( CLEAR ?auto_43304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43305 ?auto_43301 ?auto_43302 ?auto_43306 ?auto_43307 ?auto_43303 )
      ( MAKE-2PILE ?auto_43301 ?auto_43302 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43327 - BLOCK
      ?auto_43328 - BLOCK
      ?auto_43329 - BLOCK
    )
    :vars
    (
      ?auto_43331 - BLOCK
      ?auto_43330 - BLOCK
      ?auto_43332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43331 ?auto_43329 ) ( ON-TABLE ?auto_43327 ) ( ON ?auto_43328 ?auto_43327 ) ( ON ?auto_43329 ?auto_43328 ) ( not ( = ?auto_43327 ?auto_43328 ) ) ( not ( = ?auto_43327 ?auto_43329 ) ) ( not ( = ?auto_43327 ?auto_43331 ) ) ( not ( = ?auto_43328 ?auto_43329 ) ) ( not ( = ?auto_43328 ?auto_43331 ) ) ( not ( = ?auto_43329 ?auto_43331 ) ) ( not ( = ?auto_43327 ?auto_43330 ) ) ( not ( = ?auto_43327 ?auto_43332 ) ) ( not ( = ?auto_43328 ?auto_43330 ) ) ( not ( = ?auto_43328 ?auto_43332 ) ) ( not ( = ?auto_43329 ?auto_43330 ) ) ( not ( = ?auto_43329 ?auto_43332 ) ) ( not ( = ?auto_43331 ?auto_43330 ) ) ( not ( = ?auto_43331 ?auto_43332 ) ) ( not ( = ?auto_43330 ?auto_43332 ) ) ( ON ?auto_43330 ?auto_43331 ) ( CLEAR ?auto_43330 ) ( HOLDING ?auto_43332 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43332 )
      ( MAKE-3PILE ?auto_43327 ?auto_43328 ?auto_43329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43392 - BLOCK
      ?auto_43393 - BLOCK
      ?auto_43394 - BLOCK
    )
    :vars
    (
      ?auto_43395 - BLOCK
      ?auto_43397 - BLOCK
      ?auto_43396 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43392 ) ( not ( = ?auto_43392 ?auto_43393 ) ) ( not ( = ?auto_43392 ?auto_43394 ) ) ( not ( = ?auto_43393 ?auto_43394 ) ) ( ON ?auto_43394 ?auto_43395 ) ( not ( = ?auto_43392 ?auto_43395 ) ) ( not ( = ?auto_43393 ?auto_43395 ) ) ( not ( = ?auto_43394 ?auto_43395 ) ) ( CLEAR ?auto_43392 ) ( ON ?auto_43393 ?auto_43394 ) ( CLEAR ?auto_43393 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43397 ) ( ON ?auto_43396 ?auto_43397 ) ( ON ?auto_43395 ?auto_43396 ) ( not ( = ?auto_43397 ?auto_43396 ) ) ( not ( = ?auto_43397 ?auto_43395 ) ) ( not ( = ?auto_43397 ?auto_43394 ) ) ( not ( = ?auto_43397 ?auto_43393 ) ) ( not ( = ?auto_43396 ?auto_43395 ) ) ( not ( = ?auto_43396 ?auto_43394 ) ) ( not ( = ?auto_43396 ?auto_43393 ) ) ( not ( = ?auto_43392 ?auto_43397 ) ) ( not ( = ?auto_43392 ?auto_43396 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43397 ?auto_43396 ?auto_43395 ?auto_43394 )
      ( MAKE-3PILE ?auto_43392 ?auto_43393 ?auto_43394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43398 - BLOCK
      ?auto_43399 - BLOCK
      ?auto_43400 - BLOCK
    )
    :vars
    (
      ?auto_43401 - BLOCK
      ?auto_43403 - BLOCK
      ?auto_43402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43398 ?auto_43399 ) ) ( not ( = ?auto_43398 ?auto_43400 ) ) ( not ( = ?auto_43399 ?auto_43400 ) ) ( ON ?auto_43400 ?auto_43401 ) ( not ( = ?auto_43398 ?auto_43401 ) ) ( not ( = ?auto_43399 ?auto_43401 ) ) ( not ( = ?auto_43400 ?auto_43401 ) ) ( ON ?auto_43399 ?auto_43400 ) ( CLEAR ?auto_43399 ) ( ON-TABLE ?auto_43403 ) ( ON ?auto_43402 ?auto_43403 ) ( ON ?auto_43401 ?auto_43402 ) ( not ( = ?auto_43403 ?auto_43402 ) ) ( not ( = ?auto_43403 ?auto_43401 ) ) ( not ( = ?auto_43403 ?auto_43400 ) ) ( not ( = ?auto_43403 ?auto_43399 ) ) ( not ( = ?auto_43402 ?auto_43401 ) ) ( not ( = ?auto_43402 ?auto_43400 ) ) ( not ( = ?auto_43402 ?auto_43399 ) ) ( not ( = ?auto_43398 ?auto_43403 ) ) ( not ( = ?auto_43398 ?auto_43402 ) ) ( HOLDING ?auto_43398 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43398 )
      ( MAKE-3PILE ?auto_43398 ?auto_43399 ?auto_43400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43404 - BLOCK
      ?auto_43405 - BLOCK
      ?auto_43406 - BLOCK
    )
    :vars
    (
      ?auto_43409 - BLOCK
      ?auto_43408 - BLOCK
      ?auto_43407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43404 ?auto_43405 ) ) ( not ( = ?auto_43404 ?auto_43406 ) ) ( not ( = ?auto_43405 ?auto_43406 ) ) ( ON ?auto_43406 ?auto_43409 ) ( not ( = ?auto_43404 ?auto_43409 ) ) ( not ( = ?auto_43405 ?auto_43409 ) ) ( not ( = ?auto_43406 ?auto_43409 ) ) ( ON ?auto_43405 ?auto_43406 ) ( ON-TABLE ?auto_43408 ) ( ON ?auto_43407 ?auto_43408 ) ( ON ?auto_43409 ?auto_43407 ) ( not ( = ?auto_43408 ?auto_43407 ) ) ( not ( = ?auto_43408 ?auto_43409 ) ) ( not ( = ?auto_43408 ?auto_43406 ) ) ( not ( = ?auto_43408 ?auto_43405 ) ) ( not ( = ?auto_43407 ?auto_43409 ) ) ( not ( = ?auto_43407 ?auto_43406 ) ) ( not ( = ?auto_43407 ?auto_43405 ) ) ( not ( = ?auto_43404 ?auto_43408 ) ) ( not ( = ?auto_43404 ?auto_43407 ) ) ( ON ?auto_43404 ?auto_43405 ) ( CLEAR ?auto_43404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43408 ?auto_43407 ?auto_43409 ?auto_43406 ?auto_43405 )
      ( MAKE-3PILE ?auto_43404 ?auto_43405 ?auto_43406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43413 - BLOCK
      ?auto_43414 - BLOCK
      ?auto_43415 - BLOCK
    )
    :vars
    (
      ?auto_43417 - BLOCK
      ?auto_43418 - BLOCK
      ?auto_43416 - BLOCK
      ?auto_43419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43413 ?auto_43414 ) ) ( not ( = ?auto_43413 ?auto_43415 ) ) ( not ( = ?auto_43414 ?auto_43415 ) ) ( ON ?auto_43415 ?auto_43417 ) ( not ( = ?auto_43413 ?auto_43417 ) ) ( not ( = ?auto_43414 ?auto_43417 ) ) ( not ( = ?auto_43415 ?auto_43417 ) ) ( ON ?auto_43414 ?auto_43415 ) ( CLEAR ?auto_43414 ) ( ON-TABLE ?auto_43418 ) ( ON ?auto_43416 ?auto_43418 ) ( ON ?auto_43417 ?auto_43416 ) ( not ( = ?auto_43418 ?auto_43416 ) ) ( not ( = ?auto_43418 ?auto_43417 ) ) ( not ( = ?auto_43418 ?auto_43415 ) ) ( not ( = ?auto_43418 ?auto_43414 ) ) ( not ( = ?auto_43416 ?auto_43417 ) ) ( not ( = ?auto_43416 ?auto_43415 ) ) ( not ( = ?auto_43416 ?auto_43414 ) ) ( not ( = ?auto_43413 ?auto_43418 ) ) ( not ( = ?auto_43413 ?auto_43416 ) ) ( ON ?auto_43413 ?auto_43419 ) ( CLEAR ?auto_43413 ) ( HAND-EMPTY ) ( not ( = ?auto_43413 ?auto_43419 ) ) ( not ( = ?auto_43414 ?auto_43419 ) ) ( not ( = ?auto_43415 ?auto_43419 ) ) ( not ( = ?auto_43417 ?auto_43419 ) ) ( not ( = ?auto_43418 ?auto_43419 ) ) ( not ( = ?auto_43416 ?auto_43419 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43413 ?auto_43419 )
      ( MAKE-3PILE ?auto_43413 ?auto_43414 ?auto_43415 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43420 - BLOCK
      ?auto_43421 - BLOCK
      ?auto_43422 - BLOCK
    )
    :vars
    (
      ?auto_43426 - BLOCK
      ?auto_43424 - BLOCK
      ?auto_43423 - BLOCK
      ?auto_43425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43420 ?auto_43421 ) ) ( not ( = ?auto_43420 ?auto_43422 ) ) ( not ( = ?auto_43421 ?auto_43422 ) ) ( ON ?auto_43422 ?auto_43426 ) ( not ( = ?auto_43420 ?auto_43426 ) ) ( not ( = ?auto_43421 ?auto_43426 ) ) ( not ( = ?auto_43422 ?auto_43426 ) ) ( ON-TABLE ?auto_43424 ) ( ON ?auto_43423 ?auto_43424 ) ( ON ?auto_43426 ?auto_43423 ) ( not ( = ?auto_43424 ?auto_43423 ) ) ( not ( = ?auto_43424 ?auto_43426 ) ) ( not ( = ?auto_43424 ?auto_43422 ) ) ( not ( = ?auto_43424 ?auto_43421 ) ) ( not ( = ?auto_43423 ?auto_43426 ) ) ( not ( = ?auto_43423 ?auto_43422 ) ) ( not ( = ?auto_43423 ?auto_43421 ) ) ( not ( = ?auto_43420 ?auto_43424 ) ) ( not ( = ?auto_43420 ?auto_43423 ) ) ( ON ?auto_43420 ?auto_43425 ) ( CLEAR ?auto_43420 ) ( not ( = ?auto_43420 ?auto_43425 ) ) ( not ( = ?auto_43421 ?auto_43425 ) ) ( not ( = ?auto_43422 ?auto_43425 ) ) ( not ( = ?auto_43426 ?auto_43425 ) ) ( not ( = ?auto_43424 ?auto_43425 ) ) ( not ( = ?auto_43423 ?auto_43425 ) ) ( HOLDING ?auto_43421 ) ( CLEAR ?auto_43422 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43424 ?auto_43423 ?auto_43426 ?auto_43422 ?auto_43421 )
      ( MAKE-3PILE ?auto_43420 ?auto_43421 ?auto_43422 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43427 - BLOCK
      ?auto_43428 - BLOCK
      ?auto_43429 - BLOCK
    )
    :vars
    (
      ?auto_43433 - BLOCK
      ?auto_43432 - BLOCK
      ?auto_43430 - BLOCK
      ?auto_43431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43427 ?auto_43428 ) ) ( not ( = ?auto_43427 ?auto_43429 ) ) ( not ( = ?auto_43428 ?auto_43429 ) ) ( ON ?auto_43429 ?auto_43433 ) ( not ( = ?auto_43427 ?auto_43433 ) ) ( not ( = ?auto_43428 ?auto_43433 ) ) ( not ( = ?auto_43429 ?auto_43433 ) ) ( ON-TABLE ?auto_43432 ) ( ON ?auto_43430 ?auto_43432 ) ( ON ?auto_43433 ?auto_43430 ) ( not ( = ?auto_43432 ?auto_43430 ) ) ( not ( = ?auto_43432 ?auto_43433 ) ) ( not ( = ?auto_43432 ?auto_43429 ) ) ( not ( = ?auto_43432 ?auto_43428 ) ) ( not ( = ?auto_43430 ?auto_43433 ) ) ( not ( = ?auto_43430 ?auto_43429 ) ) ( not ( = ?auto_43430 ?auto_43428 ) ) ( not ( = ?auto_43427 ?auto_43432 ) ) ( not ( = ?auto_43427 ?auto_43430 ) ) ( ON ?auto_43427 ?auto_43431 ) ( not ( = ?auto_43427 ?auto_43431 ) ) ( not ( = ?auto_43428 ?auto_43431 ) ) ( not ( = ?auto_43429 ?auto_43431 ) ) ( not ( = ?auto_43433 ?auto_43431 ) ) ( not ( = ?auto_43432 ?auto_43431 ) ) ( not ( = ?auto_43430 ?auto_43431 ) ) ( CLEAR ?auto_43429 ) ( ON ?auto_43428 ?auto_43427 ) ( CLEAR ?auto_43428 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43431 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43431 ?auto_43427 )
      ( MAKE-3PILE ?auto_43427 ?auto_43428 ?auto_43429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43434 - BLOCK
      ?auto_43435 - BLOCK
      ?auto_43436 - BLOCK
    )
    :vars
    (
      ?auto_43439 - BLOCK
      ?auto_43440 - BLOCK
      ?auto_43437 - BLOCK
      ?auto_43438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43434 ?auto_43435 ) ) ( not ( = ?auto_43434 ?auto_43436 ) ) ( not ( = ?auto_43435 ?auto_43436 ) ) ( not ( = ?auto_43434 ?auto_43439 ) ) ( not ( = ?auto_43435 ?auto_43439 ) ) ( not ( = ?auto_43436 ?auto_43439 ) ) ( ON-TABLE ?auto_43440 ) ( ON ?auto_43437 ?auto_43440 ) ( ON ?auto_43439 ?auto_43437 ) ( not ( = ?auto_43440 ?auto_43437 ) ) ( not ( = ?auto_43440 ?auto_43439 ) ) ( not ( = ?auto_43440 ?auto_43436 ) ) ( not ( = ?auto_43440 ?auto_43435 ) ) ( not ( = ?auto_43437 ?auto_43439 ) ) ( not ( = ?auto_43437 ?auto_43436 ) ) ( not ( = ?auto_43437 ?auto_43435 ) ) ( not ( = ?auto_43434 ?auto_43440 ) ) ( not ( = ?auto_43434 ?auto_43437 ) ) ( ON ?auto_43434 ?auto_43438 ) ( not ( = ?auto_43434 ?auto_43438 ) ) ( not ( = ?auto_43435 ?auto_43438 ) ) ( not ( = ?auto_43436 ?auto_43438 ) ) ( not ( = ?auto_43439 ?auto_43438 ) ) ( not ( = ?auto_43440 ?auto_43438 ) ) ( not ( = ?auto_43437 ?auto_43438 ) ) ( ON ?auto_43435 ?auto_43434 ) ( CLEAR ?auto_43435 ) ( ON-TABLE ?auto_43438 ) ( HOLDING ?auto_43436 ) ( CLEAR ?auto_43439 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43440 ?auto_43437 ?auto_43439 ?auto_43436 )
      ( MAKE-3PILE ?auto_43434 ?auto_43435 ?auto_43436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43441 - BLOCK
      ?auto_43442 - BLOCK
      ?auto_43443 - BLOCK
    )
    :vars
    (
      ?auto_43444 - BLOCK
      ?auto_43446 - BLOCK
      ?auto_43445 - BLOCK
      ?auto_43447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43441 ?auto_43442 ) ) ( not ( = ?auto_43441 ?auto_43443 ) ) ( not ( = ?auto_43442 ?auto_43443 ) ) ( not ( = ?auto_43441 ?auto_43444 ) ) ( not ( = ?auto_43442 ?auto_43444 ) ) ( not ( = ?auto_43443 ?auto_43444 ) ) ( ON-TABLE ?auto_43446 ) ( ON ?auto_43445 ?auto_43446 ) ( ON ?auto_43444 ?auto_43445 ) ( not ( = ?auto_43446 ?auto_43445 ) ) ( not ( = ?auto_43446 ?auto_43444 ) ) ( not ( = ?auto_43446 ?auto_43443 ) ) ( not ( = ?auto_43446 ?auto_43442 ) ) ( not ( = ?auto_43445 ?auto_43444 ) ) ( not ( = ?auto_43445 ?auto_43443 ) ) ( not ( = ?auto_43445 ?auto_43442 ) ) ( not ( = ?auto_43441 ?auto_43446 ) ) ( not ( = ?auto_43441 ?auto_43445 ) ) ( ON ?auto_43441 ?auto_43447 ) ( not ( = ?auto_43441 ?auto_43447 ) ) ( not ( = ?auto_43442 ?auto_43447 ) ) ( not ( = ?auto_43443 ?auto_43447 ) ) ( not ( = ?auto_43444 ?auto_43447 ) ) ( not ( = ?auto_43446 ?auto_43447 ) ) ( not ( = ?auto_43445 ?auto_43447 ) ) ( ON ?auto_43442 ?auto_43441 ) ( ON-TABLE ?auto_43447 ) ( CLEAR ?auto_43444 ) ( ON ?auto_43443 ?auto_43442 ) ( CLEAR ?auto_43443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43447 ?auto_43441 ?auto_43442 )
      ( MAKE-3PILE ?auto_43441 ?auto_43442 ?auto_43443 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43448 - BLOCK
      ?auto_43449 - BLOCK
      ?auto_43450 - BLOCK
    )
    :vars
    (
      ?auto_43452 - BLOCK
      ?auto_43451 - BLOCK
      ?auto_43454 - BLOCK
      ?auto_43453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43448 ?auto_43449 ) ) ( not ( = ?auto_43448 ?auto_43450 ) ) ( not ( = ?auto_43449 ?auto_43450 ) ) ( not ( = ?auto_43448 ?auto_43452 ) ) ( not ( = ?auto_43449 ?auto_43452 ) ) ( not ( = ?auto_43450 ?auto_43452 ) ) ( ON-TABLE ?auto_43451 ) ( ON ?auto_43454 ?auto_43451 ) ( not ( = ?auto_43451 ?auto_43454 ) ) ( not ( = ?auto_43451 ?auto_43452 ) ) ( not ( = ?auto_43451 ?auto_43450 ) ) ( not ( = ?auto_43451 ?auto_43449 ) ) ( not ( = ?auto_43454 ?auto_43452 ) ) ( not ( = ?auto_43454 ?auto_43450 ) ) ( not ( = ?auto_43454 ?auto_43449 ) ) ( not ( = ?auto_43448 ?auto_43451 ) ) ( not ( = ?auto_43448 ?auto_43454 ) ) ( ON ?auto_43448 ?auto_43453 ) ( not ( = ?auto_43448 ?auto_43453 ) ) ( not ( = ?auto_43449 ?auto_43453 ) ) ( not ( = ?auto_43450 ?auto_43453 ) ) ( not ( = ?auto_43452 ?auto_43453 ) ) ( not ( = ?auto_43451 ?auto_43453 ) ) ( not ( = ?auto_43454 ?auto_43453 ) ) ( ON ?auto_43449 ?auto_43448 ) ( ON-TABLE ?auto_43453 ) ( ON ?auto_43450 ?auto_43449 ) ( CLEAR ?auto_43450 ) ( HOLDING ?auto_43452 ) ( CLEAR ?auto_43454 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43451 ?auto_43454 ?auto_43452 )
      ( MAKE-3PILE ?auto_43448 ?auto_43449 ?auto_43450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43455 - BLOCK
      ?auto_43456 - BLOCK
      ?auto_43457 - BLOCK
    )
    :vars
    (
      ?auto_43458 - BLOCK
      ?auto_43461 - BLOCK
      ?auto_43460 - BLOCK
      ?auto_43459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43455 ?auto_43456 ) ) ( not ( = ?auto_43455 ?auto_43457 ) ) ( not ( = ?auto_43456 ?auto_43457 ) ) ( not ( = ?auto_43455 ?auto_43458 ) ) ( not ( = ?auto_43456 ?auto_43458 ) ) ( not ( = ?auto_43457 ?auto_43458 ) ) ( ON-TABLE ?auto_43461 ) ( ON ?auto_43460 ?auto_43461 ) ( not ( = ?auto_43461 ?auto_43460 ) ) ( not ( = ?auto_43461 ?auto_43458 ) ) ( not ( = ?auto_43461 ?auto_43457 ) ) ( not ( = ?auto_43461 ?auto_43456 ) ) ( not ( = ?auto_43460 ?auto_43458 ) ) ( not ( = ?auto_43460 ?auto_43457 ) ) ( not ( = ?auto_43460 ?auto_43456 ) ) ( not ( = ?auto_43455 ?auto_43461 ) ) ( not ( = ?auto_43455 ?auto_43460 ) ) ( ON ?auto_43455 ?auto_43459 ) ( not ( = ?auto_43455 ?auto_43459 ) ) ( not ( = ?auto_43456 ?auto_43459 ) ) ( not ( = ?auto_43457 ?auto_43459 ) ) ( not ( = ?auto_43458 ?auto_43459 ) ) ( not ( = ?auto_43461 ?auto_43459 ) ) ( not ( = ?auto_43460 ?auto_43459 ) ) ( ON ?auto_43456 ?auto_43455 ) ( ON-TABLE ?auto_43459 ) ( ON ?auto_43457 ?auto_43456 ) ( CLEAR ?auto_43460 ) ( ON ?auto_43458 ?auto_43457 ) ( CLEAR ?auto_43458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43459 ?auto_43455 ?auto_43456 ?auto_43457 )
      ( MAKE-3PILE ?auto_43455 ?auto_43456 ?auto_43457 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43462 - BLOCK
      ?auto_43463 - BLOCK
      ?auto_43464 - BLOCK
    )
    :vars
    (
      ?auto_43465 - BLOCK
      ?auto_43466 - BLOCK
      ?auto_43468 - BLOCK
      ?auto_43467 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43462 ?auto_43463 ) ) ( not ( = ?auto_43462 ?auto_43464 ) ) ( not ( = ?auto_43463 ?auto_43464 ) ) ( not ( = ?auto_43462 ?auto_43465 ) ) ( not ( = ?auto_43463 ?auto_43465 ) ) ( not ( = ?auto_43464 ?auto_43465 ) ) ( ON-TABLE ?auto_43466 ) ( not ( = ?auto_43466 ?auto_43468 ) ) ( not ( = ?auto_43466 ?auto_43465 ) ) ( not ( = ?auto_43466 ?auto_43464 ) ) ( not ( = ?auto_43466 ?auto_43463 ) ) ( not ( = ?auto_43468 ?auto_43465 ) ) ( not ( = ?auto_43468 ?auto_43464 ) ) ( not ( = ?auto_43468 ?auto_43463 ) ) ( not ( = ?auto_43462 ?auto_43466 ) ) ( not ( = ?auto_43462 ?auto_43468 ) ) ( ON ?auto_43462 ?auto_43467 ) ( not ( = ?auto_43462 ?auto_43467 ) ) ( not ( = ?auto_43463 ?auto_43467 ) ) ( not ( = ?auto_43464 ?auto_43467 ) ) ( not ( = ?auto_43465 ?auto_43467 ) ) ( not ( = ?auto_43466 ?auto_43467 ) ) ( not ( = ?auto_43468 ?auto_43467 ) ) ( ON ?auto_43463 ?auto_43462 ) ( ON-TABLE ?auto_43467 ) ( ON ?auto_43464 ?auto_43463 ) ( ON ?auto_43465 ?auto_43464 ) ( CLEAR ?auto_43465 ) ( HOLDING ?auto_43468 ) ( CLEAR ?auto_43466 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43466 ?auto_43468 )
      ( MAKE-3PILE ?auto_43462 ?auto_43463 ?auto_43464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43469 - BLOCK
      ?auto_43470 - BLOCK
      ?auto_43471 - BLOCK
    )
    :vars
    (
      ?auto_43475 - BLOCK
      ?auto_43472 - BLOCK
      ?auto_43473 - BLOCK
      ?auto_43474 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43469 ?auto_43470 ) ) ( not ( = ?auto_43469 ?auto_43471 ) ) ( not ( = ?auto_43470 ?auto_43471 ) ) ( not ( = ?auto_43469 ?auto_43475 ) ) ( not ( = ?auto_43470 ?auto_43475 ) ) ( not ( = ?auto_43471 ?auto_43475 ) ) ( ON-TABLE ?auto_43472 ) ( not ( = ?auto_43472 ?auto_43473 ) ) ( not ( = ?auto_43472 ?auto_43475 ) ) ( not ( = ?auto_43472 ?auto_43471 ) ) ( not ( = ?auto_43472 ?auto_43470 ) ) ( not ( = ?auto_43473 ?auto_43475 ) ) ( not ( = ?auto_43473 ?auto_43471 ) ) ( not ( = ?auto_43473 ?auto_43470 ) ) ( not ( = ?auto_43469 ?auto_43472 ) ) ( not ( = ?auto_43469 ?auto_43473 ) ) ( ON ?auto_43469 ?auto_43474 ) ( not ( = ?auto_43469 ?auto_43474 ) ) ( not ( = ?auto_43470 ?auto_43474 ) ) ( not ( = ?auto_43471 ?auto_43474 ) ) ( not ( = ?auto_43475 ?auto_43474 ) ) ( not ( = ?auto_43472 ?auto_43474 ) ) ( not ( = ?auto_43473 ?auto_43474 ) ) ( ON ?auto_43470 ?auto_43469 ) ( ON-TABLE ?auto_43474 ) ( ON ?auto_43471 ?auto_43470 ) ( ON ?auto_43475 ?auto_43471 ) ( CLEAR ?auto_43472 ) ( ON ?auto_43473 ?auto_43475 ) ( CLEAR ?auto_43473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43474 ?auto_43469 ?auto_43470 ?auto_43471 ?auto_43475 )
      ( MAKE-3PILE ?auto_43469 ?auto_43470 ?auto_43471 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43476 - BLOCK
      ?auto_43477 - BLOCK
      ?auto_43478 - BLOCK
    )
    :vars
    (
      ?auto_43480 - BLOCK
      ?auto_43481 - BLOCK
      ?auto_43482 - BLOCK
      ?auto_43479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43476 ?auto_43477 ) ) ( not ( = ?auto_43476 ?auto_43478 ) ) ( not ( = ?auto_43477 ?auto_43478 ) ) ( not ( = ?auto_43476 ?auto_43480 ) ) ( not ( = ?auto_43477 ?auto_43480 ) ) ( not ( = ?auto_43478 ?auto_43480 ) ) ( not ( = ?auto_43481 ?auto_43482 ) ) ( not ( = ?auto_43481 ?auto_43480 ) ) ( not ( = ?auto_43481 ?auto_43478 ) ) ( not ( = ?auto_43481 ?auto_43477 ) ) ( not ( = ?auto_43482 ?auto_43480 ) ) ( not ( = ?auto_43482 ?auto_43478 ) ) ( not ( = ?auto_43482 ?auto_43477 ) ) ( not ( = ?auto_43476 ?auto_43481 ) ) ( not ( = ?auto_43476 ?auto_43482 ) ) ( ON ?auto_43476 ?auto_43479 ) ( not ( = ?auto_43476 ?auto_43479 ) ) ( not ( = ?auto_43477 ?auto_43479 ) ) ( not ( = ?auto_43478 ?auto_43479 ) ) ( not ( = ?auto_43480 ?auto_43479 ) ) ( not ( = ?auto_43481 ?auto_43479 ) ) ( not ( = ?auto_43482 ?auto_43479 ) ) ( ON ?auto_43477 ?auto_43476 ) ( ON-TABLE ?auto_43479 ) ( ON ?auto_43478 ?auto_43477 ) ( ON ?auto_43480 ?auto_43478 ) ( ON ?auto_43482 ?auto_43480 ) ( CLEAR ?auto_43482 ) ( HOLDING ?auto_43481 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43481 )
      ( MAKE-3PILE ?auto_43476 ?auto_43477 ?auto_43478 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_43483 - BLOCK
      ?auto_43484 - BLOCK
      ?auto_43485 - BLOCK
    )
    :vars
    (
      ?auto_43489 - BLOCK
      ?auto_43487 - BLOCK
      ?auto_43488 - BLOCK
      ?auto_43486 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43483 ?auto_43484 ) ) ( not ( = ?auto_43483 ?auto_43485 ) ) ( not ( = ?auto_43484 ?auto_43485 ) ) ( not ( = ?auto_43483 ?auto_43489 ) ) ( not ( = ?auto_43484 ?auto_43489 ) ) ( not ( = ?auto_43485 ?auto_43489 ) ) ( not ( = ?auto_43487 ?auto_43488 ) ) ( not ( = ?auto_43487 ?auto_43489 ) ) ( not ( = ?auto_43487 ?auto_43485 ) ) ( not ( = ?auto_43487 ?auto_43484 ) ) ( not ( = ?auto_43488 ?auto_43489 ) ) ( not ( = ?auto_43488 ?auto_43485 ) ) ( not ( = ?auto_43488 ?auto_43484 ) ) ( not ( = ?auto_43483 ?auto_43487 ) ) ( not ( = ?auto_43483 ?auto_43488 ) ) ( ON ?auto_43483 ?auto_43486 ) ( not ( = ?auto_43483 ?auto_43486 ) ) ( not ( = ?auto_43484 ?auto_43486 ) ) ( not ( = ?auto_43485 ?auto_43486 ) ) ( not ( = ?auto_43489 ?auto_43486 ) ) ( not ( = ?auto_43487 ?auto_43486 ) ) ( not ( = ?auto_43488 ?auto_43486 ) ) ( ON ?auto_43484 ?auto_43483 ) ( ON-TABLE ?auto_43486 ) ( ON ?auto_43485 ?auto_43484 ) ( ON ?auto_43489 ?auto_43485 ) ( ON ?auto_43488 ?auto_43489 ) ( ON ?auto_43487 ?auto_43488 ) ( CLEAR ?auto_43487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43486 ?auto_43483 ?auto_43484 ?auto_43485 ?auto_43489 ?auto_43488 )
      ( MAKE-3PILE ?auto_43483 ?auto_43484 ?auto_43485 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43505 - BLOCK
      ?auto_43506 - BLOCK
    )
    :vars
    (
      ?auto_43508 - BLOCK
      ?auto_43509 - BLOCK
      ?auto_43507 - BLOCK
      ?auto_43510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43508 ?auto_43506 ) ( ON-TABLE ?auto_43505 ) ( ON ?auto_43506 ?auto_43505 ) ( not ( = ?auto_43505 ?auto_43506 ) ) ( not ( = ?auto_43505 ?auto_43508 ) ) ( not ( = ?auto_43506 ?auto_43508 ) ) ( not ( = ?auto_43505 ?auto_43509 ) ) ( not ( = ?auto_43505 ?auto_43507 ) ) ( not ( = ?auto_43506 ?auto_43509 ) ) ( not ( = ?auto_43506 ?auto_43507 ) ) ( not ( = ?auto_43508 ?auto_43509 ) ) ( not ( = ?auto_43508 ?auto_43507 ) ) ( not ( = ?auto_43509 ?auto_43507 ) ) ( ON ?auto_43509 ?auto_43508 ) ( CLEAR ?auto_43509 ) ( HOLDING ?auto_43507 ) ( CLEAR ?auto_43510 ) ( ON-TABLE ?auto_43510 ) ( not ( = ?auto_43510 ?auto_43507 ) ) ( not ( = ?auto_43505 ?auto_43510 ) ) ( not ( = ?auto_43506 ?auto_43510 ) ) ( not ( = ?auto_43508 ?auto_43510 ) ) ( not ( = ?auto_43509 ?auto_43510 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43510 ?auto_43507 )
      ( MAKE-2PILE ?auto_43505 ?auto_43506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43511 - BLOCK
      ?auto_43512 - BLOCK
    )
    :vars
    (
      ?auto_43514 - BLOCK
      ?auto_43516 - BLOCK
      ?auto_43515 - BLOCK
      ?auto_43513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43514 ?auto_43512 ) ( ON-TABLE ?auto_43511 ) ( ON ?auto_43512 ?auto_43511 ) ( not ( = ?auto_43511 ?auto_43512 ) ) ( not ( = ?auto_43511 ?auto_43514 ) ) ( not ( = ?auto_43512 ?auto_43514 ) ) ( not ( = ?auto_43511 ?auto_43516 ) ) ( not ( = ?auto_43511 ?auto_43515 ) ) ( not ( = ?auto_43512 ?auto_43516 ) ) ( not ( = ?auto_43512 ?auto_43515 ) ) ( not ( = ?auto_43514 ?auto_43516 ) ) ( not ( = ?auto_43514 ?auto_43515 ) ) ( not ( = ?auto_43516 ?auto_43515 ) ) ( ON ?auto_43516 ?auto_43514 ) ( CLEAR ?auto_43513 ) ( ON-TABLE ?auto_43513 ) ( not ( = ?auto_43513 ?auto_43515 ) ) ( not ( = ?auto_43511 ?auto_43513 ) ) ( not ( = ?auto_43512 ?auto_43513 ) ) ( not ( = ?auto_43514 ?auto_43513 ) ) ( not ( = ?auto_43516 ?auto_43513 ) ) ( ON ?auto_43515 ?auto_43516 ) ( CLEAR ?auto_43515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43511 ?auto_43512 ?auto_43514 ?auto_43516 )
      ( MAKE-2PILE ?auto_43511 ?auto_43512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43517 - BLOCK
      ?auto_43518 - BLOCK
    )
    :vars
    (
      ?auto_43519 - BLOCK
      ?auto_43522 - BLOCK
      ?auto_43521 - BLOCK
      ?auto_43520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43519 ?auto_43518 ) ( ON-TABLE ?auto_43517 ) ( ON ?auto_43518 ?auto_43517 ) ( not ( = ?auto_43517 ?auto_43518 ) ) ( not ( = ?auto_43517 ?auto_43519 ) ) ( not ( = ?auto_43518 ?auto_43519 ) ) ( not ( = ?auto_43517 ?auto_43522 ) ) ( not ( = ?auto_43517 ?auto_43521 ) ) ( not ( = ?auto_43518 ?auto_43522 ) ) ( not ( = ?auto_43518 ?auto_43521 ) ) ( not ( = ?auto_43519 ?auto_43522 ) ) ( not ( = ?auto_43519 ?auto_43521 ) ) ( not ( = ?auto_43522 ?auto_43521 ) ) ( ON ?auto_43522 ?auto_43519 ) ( not ( = ?auto_43520 ?auto_43521 ) ) ( not ( = ?auto_43517 ?auto_43520 ) ) ( not ( = ?auto_43518 ?auto_43520 ) ) ( not ( = ?auto_43519 ?auto_43520 ) ) ( not ( = ?auto_43522 ?auto_43520 ) ) ( ON ?auto_43521 ?auto_43522 ) ( CLEAR ?auto_43521 ) ( HOLDING ?auto_43520 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43520 )
      ( MAKE-2PILE ?auto_43517 ?auto_43518 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43531 - BLOCK
      ?auto_43532 - BLOCK
    )
    :vars
    (
      ?auto_43534 - BLOCK
      ?auto_43536 - BLOCK
      ?auto_43533 - BLOCK
      ?auto_43535 - BLOCK
      ?auto_43537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43534 ?auto_43532 ) ( ON-TABLE ?auto_43531 ) ( ON ?auto_43532 ?auto_43531 ) ( not ( = ?auto_43531 ?auto_43532 ) ) ( not ( = ?auto_43531 ?auto_43534 ) ) ( not ( = ?auto_43532 ?auto_43534 ) ) ( not ( = ?auto_43531 ?auto_43536 ) ) ( not ( = ?auto_43531 ?auto_43533 ) ) ( not ( = ?auto_43532 ?auto_43536 ) ) ( not ( = ?auto_43532 ?auto_43533 ) ) ( not ( = ?auto_43534 ?auto_43536 ) ) ( not ( = ?auto_43534 ?auto_43533 ) ) ( not ( = ?auto_43536 ?auto_43533 ) ) ( ON ?auto_43536 ?auto_43534 ) ( not ( = ?auto_43535 ?auto_43533 ) ) ( not ( = ?auto_43531 ?auto_43535 ) ) ( not ( = ?auto_43532 ?auto_43535 ) ) ( not ( = ?auto_43534 ?auto_43535 ) ) ( not ( = ?auto_43536 ?auto_43535 ) ) ( ON ?auto_43533 ?auto_43536 ) ( CLEAR ?auto_43533 ) ( ON ?auto_43535 ?auto_43537 ) ( CLEAR ?auto_43535 ) ( HAND-EMPTY ) ( not ( = ?auto_43531 ?auto_43537 ) ) ( not ( = ?auto_43532 ?auto_43537 ) ) ( not ( = ?auto_43534 ?auto_43537 ) ) ( not ( = ?auto_43536 ?auto_43537 ) ) ( not ( = ?auto_43533 ?auto_43537 ) ) ( not ( = ?auto_43535 ?auto_43537 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43535 ?auto_43537 )
      ( MAKE-2PILE ?auto_43531 ?auto_43532 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_43538 - BLOCK
      ?auto_43539 - BLOCK
    )
    :vars
    (
      ?auto_43540 - BLOCK
      ?auto_43541 - BLOCK
      ?auto_43544 - BLOCK
      ?auto_43542 - BLOCK
      ?auto_43543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43540 ?auto_43539 ) ( ON-TABLE ?auto_43538 ) ( ON ?auto_43539 ?auto_43538 ) ( not ( = ?auto_43538 ?auto_43539 ) ) ( not ( = ?auto_43538 ?auto_43540 ) ) ( not ( = ?auto_43539 ?auto_43540 ) ) ( not ( = ?auto_43538 ?auto_43541 ) ) ( not ( = ?auto_43538 ?auto_43544 ) ) ( not ( = ?auto_43539 ?auto_43541 ) ) ( not ( = ?auto_43539 ?auto_43544 ) ) ( not ( = ?auto_43540 ?auto_43541 ) ) ( not ( = ?auto_43540 ?auto_43544 ) ) ( not ( = ?auto_43541 ?auto_43544 ) ) ( ON ?auto_43541 ?auto_43540 ) ( not ( = ?auto_43542 ?auto_43544 ) ) ( not ( = ?auto_43538 ?auto_43542 ) ) ( not ( = ?auto_43539 ?auto_43542 ) ) ( not ( = ?auto_43540 ?auto_43542 ) ) ( not ( = ?auto_43541 ?auto_43542 ) ) ( ON ?auto_43542 ?auto_43543 ) ( CLEAR ?auto_43542 ) ( not ( = ?auto_43538 ?auto_43543 ) ) ( not ( = ?auto_43539 ?auto_43543 ) ) ( not ( = ?auto_43540 ?auto_43543 ) ) ( not ( = ?auto_43541 ?auto_43543 ) ) ( not ( = ?auto_43544 ?auto_43543 ) ) ( not ( = ?auto_43542 ?auto_43543 ) ) ( HOLDING ?auto_43544 ) ( CLEAR ?auto_43541 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43538 ?auto_43539 ?auto_43540 ?auto_43541 ?auto_43544 )
      ( MAKE-2PILE ?auto_43538 ?auto_43539 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43584 - BLOCK
      ?auto_43585 - BLOCK
      ?auto_43586 - BLOCK
      ?auto_43587 - BLOCK
    )
    :vars
    (
      ?auto_43588 - BLOCK
      ?auto_43589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43584 ) ( ON ?auto_43585 ?auto_43584 ) ( not ( = ?auto_43584 ?auto_43585 ) ) ( not ( = ?auto_43584 ?auto_43586 ) ) ( not ( = ?auto_43584 ?auto_43587 ) ) ( not ( = ?auto_43585 ?auto_43586 ) ) ( not ( = ?auto_43585 ?auto_43587 ) ) ( not ( = ?auto_43586 ?auto_43587 ) ) ( ON ?auto_43587 ?auto_43588 ) ( not ( = ?auto_43584 ?auto_43588 ) ) ( not ( = ?auto_43585 ?auto_43588 ) ) ( not ( = ?auto_43586 ?auto_43588 ) ) ( not ( = ?auto_43587 ?auto_43588 ) ) ( CLEAR ?auto_43585 ) ( ON ?auto_43586 ?auto_43587 ) ( CLEAR ?auto_43586 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43589 ) ( ON ?auto_43588 ?auto_43589 ) ( not ( = ?auto_43589 ?auto_43588 ) ) ( not ( = ?auto_43589 ?auto_43587 ) ) ( not ( = ?auto_43589 ?auto_43586 ) ) ( not ( = ?auto_43584 ?auto_43589 ) ) ( not ( = ?auto_43585 ?auto_43589 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43589 ?auto_43588 ?auto_43587 )
      ( MAKE-4PILE ?auto_43584 ?auto_43585 ?auto_43586 ?auto_43587 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43590 - BLOCK
      ?auto_43591 - BLOCK
      ?auto_43592 - BLOCK
      ?auto_43593 - BLOCK
    )
    :vars
    (
      ?auto_43595 - BLOCK
      ?auto_43594 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43590 ) ( not ( = ?auto_43590 ?auto_43591 ) ) ( not ( = ?auto_43590 ?auto_43592 ) ) ( not ( = ?auto_43590 ?auto_43593 ) ) ( not ( = ?auto_43591 ?auto_43592 ) ) ( not ( = ?auto_43591 ?auto_43593 ) ) ( not ( = ?auto_43592 ?auto_43593 ) ) ( ON ?auto_43593 ?auto_43595 ) ( not ( = ?auto_43590 ?auto_43595 ) ) ( not ( = ?auto_43591 ?auto_43595 ) ) ( not ( = ?auto_43592 ?auto_43595 ) ) ( not ( = ?auto_43593 ?auto_43595 ) ) ( ON ?auto_43592 ?auto_43593 ) ( CLEAR ?auto_43592 ) ( ON-TABLE ?auto_43594 ) ( ON ?auto_43595 ?auto_43594 ) ( not ( = ?auto_43594 ?auto_43595 ) ) ( not ( = ?auto_43594 ?auto_43593 ) ) ( not ( = ?auto_43594 ?auto_43592 ) ) ( not ( = ?auto_43590 ?auto_43594 ) ) ( not ( = ?auto_43591 ?auto_43594 ) ) ( HOLDING ?auto_43591 ) ( CLEAR ?auto_43590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43590 ?auto_43591 )
      ( MAKE-4PILE ?auto_43590 ?auto_43591 ?auto_43592 ?auto_43593 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43596 - BLOCK
      ?auto_43597 - BLOCK
      ?auto_43598 - BLOCK
      ?auto_43599 - BLOCK
    )
    :vars
    (
      ?auto_43601 - BLOCK
      ?auto_43600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43596 ) ( not ( = ?auto_43596 ?auto_43597 ) ) ( not ( = ?auto_43596 ?auto_43598 ) ) ( not ( = ?auto_43596 ?auto_43599 ) ) ( not ( = ?auto_43597 ?auto_43598 ) ) ( not ( = ?auto_43597 ?auto_43599 ) ) ( not ( = ?auto_43598 ?auto_43599 ) ) ( ON ?auto_43599 ?auto_43601 ) ( not ( = ?auto_43596 ?auto_43601 ) ) ( not ( = ?auto_43597 ?auto_43601 ) ) ( not ( = ?auto_43598 ?auto_43601 ) ) ( not ( = ?auto_43599 ?auto_43601 ) ) ( ON ?auto_43598 ?auto_43599 ) ( ON-TABLE ?auto_43600 ) ( ON ?auto_43601 ?auto_43600 ) ( not ( = ?auto_43600 ?auto_43601 ) ) ( not ( = ?auto_43600 ?auto_43599 ) ) ( not ( = ?auto_43600 ?auto_43598 ) ) ( not ( = ?auto_43596 ?auto_43600 ) ) ( not ( = ?auto_43597 ?auto_43600 ) ) ( CLEAR ?auto_43596 ) ( ON ?auto_43597 ?auto_43598 ) ( CLEAR ?auto_43597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43600 ?auto_43601 ?auto_43599 ?auto_43598 )
      ( MAKE-4PILE ?auto_43596 ?auto_43597 ?auto_43598 ?auto_43599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43602 - BLOCK
      ?auto_43603 - BLOCK
      ?auto_43604 - BLOCK
      ?auto_43605 - BLOCK
    )
    :vars
    (
      ?auto_43607 - BLOCK
      ?auto_43606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43602 ?auto_43603 ) ) ( not ( = ?auto_43602 ?auto_43604 ) ) ( not ( = ?auto_43602 ?auto_43605 ) ) ( not ( = ?auto_43603 ?auto_43604 ) ) ( not ( = ?auto_43603 ?auto_43605 ) ) ( not ( = ?auto_43604 ?auto_43605 ) ) ( ON ?auto_43605 ?auto_43607 ) ( not ( = ?auto_43602 ?auto_43607 ) ) ( not ( = ?auto_43603 ?auto_43607 ) ) ( not ( = ?auto_43604 ?auto_43607 ) ) ( not ( = ?auto_43605 ?auto_43607 ) ) ( ON ?auto_43604 ?auto_43605 ) ( ON-TABLE ?auto_43606 ) ( ON ?auto_43607 ?auto_43606 ) ( not ( = ?auto_43606 ?auto_43607 ) ) ( not ( = ?auto_43606 ?auto_43605 ) ) ( not ( = ?auto_43606 ?auto_43604 ) ) ( not ( = ?auto_43602 ?auto_43606 ) ) ( not ( = ?auto_43603 ?auto_43606 ) ) ( ON ?auto_43603 ?auto_43604 ) ( CLEAR ?auto_43603 ) ( HOLDING ?auto_43602 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43602 )
      ( MAKE-4PILE ?auto_43602 ?auto_43603 ?auto_43604 ?auto_43605 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43608 - BLOCK
      ?auto_43609 - BLOCK
      ?auto_43610 - BLOCK
      ?auto_43611 - BLOCK
    )
    :vars
    (
      ?auto_43612 - BLOCK
      ?auto_43613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43608 ?auto_43609 ) ) ( not ( = ?auto_43608 ?auto_43610 ) ) ( not ( = ?auto_43608 ?auto_43611 ) ) ( not ( = ?auto_43609 ?auto_43610 ) ) ( not ( = ?auto_43609 ?auto_43611 ) ) ( not ( = ?auto_43610 ?auto_43611 ) ) ( ON ?auto_43611 ?auto_43612 ) ( not ( = ?auto_43608 ?auto_43612 ) ) ( not ( = ?auto_43609 ?auto_43612 ) ) ( not ( = ?auto_43610 ?auto_43612 ) ) ( not ( = ?auto_43611 ?auto_43612 ) ) ( ON ?auto_43610 ?auto_43611 ) ( ON-TABLE ?auto_43613 ) ( ON ?auto_43612 ?auto_43613 ) ( not ( = ?auto_43613 ?auto_43612 ) ) ( not ( = ?auto_43613 ?auto_43611 ) ) ( not ( = ?auto_43613 ?auto_43610 ) ) ( not ( = ?auto_43608 ?auto_43613 ) ) ( not ( = ?auto_43609 ?auto_43613 ) ) ( ON ?auto_43609 ?auto_43610 ) ( ON ?auto_43608 ?auto_43609 ) ( CLEAR ?auto_43608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43613 ?auto_43612 ?auto_43611 ?auto_43610 ?auto_43609 )
      ( MAKE-4PILE ?auto_43608 ?auto_43609 ?auto_43610 ?auto_43611 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43618 - BLOCK
      ?auto_43619 - BLOCK
      ?auto_43620 - BLOCK
      ?auto_43621 - BLOCK
    )
    :vars
    (
      ?auto_43622 - BLOCK
      ?auto_43623 - BLOCK
      ?auto_43624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43618 ?auto_43619 ) ) ( not ( = ?auto_43618 ?auto_43620 ) ) ( not ( = ?auto_43618 ?auto_43621 ) ) ( not ( = ?auto_43619 ?auto_43620 ) ) ( not ( = ?auto_43619 ?auto_43621 ) ) ( not ( = ?auto_43620 ?auto_43621 ) ) ( ON ?auto_43621 ?auto_43622 ) ( not ( = ?auto_43618 ?auto_43622 ) ) ( not ( = ?auto_43619 ?auto_43622 ) ) ( not ( = ?auto_43620 ?auto_43622 ) ) ( not ( = ?auto_43621 ?auto_43622 ) ) ( ON ?auto_43620 ?auto_43621 ) ( ON-TABLE ?auto_43623 ) ( ON ?auto_43622 ?auto_43623 ) ( not ( = ?auto_43623 ?auto_43622 ) ) ( not ( = ?auto_43623 ?auto_43621 ) ) ( not ( = ?auto_43623 ?auto_43620 ) ) ( not ( = ?auto_43618 ?auto_43623 ) ) ( not ( = ?auto_43619 ?auto_43623 ) ) ( ON ?auto_43619 ?auto_43620 ) ( CLEAR ?auto_43619 ) ( ON ?auto_43618 ?auto_43624 ) ( CLEAR ?auto_43618 ) ( HAND-EMPTY ) ( not ( = ?auto_43618 ?auto_43624 ) ) ( not ( = ?auto_43619 ?auto_43624 ) ) ( not ( = ?auto_43620 ?auto_43624 ) ) ( not ( = ?auto_43621 ?auto_43624 ) ) ( not ( = ?auto_43622 ?auto_43624 ) ) ( not ( = ?auto_43623 ?auto_43624 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43618 ?auto_43624 )
      ( MAKE-4PILE ?auto_43618 ?auto_43619 ?auto_43620 ?auto_43621 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43625 - BLOCK
      ?auto_43626 - BLOCK
      ?auto_43627 - BLOCK
      ?auto_43628 - BLOCK
    )
    :vars
    (
      ?auto_43629 - BLOCK
      ?auto_43630 - BLOCK
      ?auto_43631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43625 ?auto_43626 ) ) ( not ( = ?auto_43625 ?auto_43627 ) ) ( not ( = ?auto_43625 ?auto_43628 ) ) ( not ( = ?auto_43626 ?auto_43627 ) ) ( not ( = ?auto_43626 ?auto_43628 ) ) ( not ( = ?auto_43627 ?auto_43628 ) ) ( ON ?auto_43628 ?auto_43629 ) ( not ( = ?auto_43625 ?auto_43629 ) ) ( not ( = ?auto_43626 ?auto_43629 ) ) ( not ( = ?auto_43627 ?auto_43629 ) ) ( not ( = ?auto_43628 ?auto_43629 ) ) ( ON ?auto_43627 ?auto_43628 ) ( ON-TABLE ?auto_43630 ) ( ON ?auto_43629 ?auto_43630 ) ( not ( = ?auto_43630 ?auto_43629 ) ) ( not ( = ?auto_43630 ?auto_43628 ) ) ( not ( = ?auto_43630 ?auto_43627 ) ) ( not ( = ?auto_43625 ?auto_43630 ) ) ( not ( = ?auto_43626 ?auto_43630 ) ) ( ON ?auto_43625 ?auto_43631 ) ( CLEAR ?auto_43625 ) ( not ( = ?auto_43625 ?auto_43631 ) ) ( not ( = ?auto_43626 ?auto_43631 ) ) ( not ( = ?auto_43627 ?auto_43631 ) ) ( not ( = ?auto_43628 ?auto_43631 ) ) ( not ( = ?auto_43629 ?auto_43631 ) ) ( not ( = ?auto_43630 ?auto_43631 ) ) ( HOLDING ?auto_43626 ) ( CLEAR ?auto_43627 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43630 ?auto_43629 ?auto_43628 ?auto_43627 ?auto_43626 )
      ( MAKE-4PILE ?auto_43625 ?auto_43626 ?auto_43627 ?auto_43628 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43632 - BLOCK
      ?auto_43633 - BLOCK
      ?auto_43634 - BLOCK
      ?auto_43635 - BLOCK
    )
    :vars
    (
      ?auto_43636 - BLOCK
      ?auto_43638 - BLOCK
      ?auto_43637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43632 ?auto_43633 ) ) ( not ( = ?auto_43632 ?auto_43634 ) ) ( not ( = ?auto_43632 ?auto_43635 ) ) ( not ( = ?auto_43633 ?auto_43634 ) ) ( not ( = ?auto_43633 ?auto_43635 ) ) ( not ( = ?auto_43634 ?auto_43635 ) ) ( ON ?auto_43635 ?auto_43636 ) ( not ( = ?auto_43632 ?auto_43636 ) ) ( not ( = ?auto_43633 ?auto_43636 ) ) ( not ( = ?auto_43634 ?auto_43636 ) ) ( not ( = ?auto_43635 ?auto_43636 ) ) ( ON ?auto_43634 ?auto_43635 ) ( ON-TABLE ?auto_43638 ) ( ON ?auto_43636 ?auto_43638 ) ( not ( = ?auto_43638 ?auto_43636 ) ) ( not ( = ?auto_43638 ?auto_43635 ) ) ( not ( = ?auto_43638 ?auto_43634 ) ) ( not ( = ?auto_43632 ?auto_43638 ) ) ( not ( = ?auto_43633 ?auto_43638 ) ) ( ON ?auto_43632 ?auto_43637 ) ( not ( = ?auto_43632 ?auto_43637 ) ) ( not ( = ?auto_43633 ?auto_43637 ) ) ( not ( = ?auto_43634 ?auto_43637 ) ) ( not ( = ?auto_43635 ?auto_43637 ) ) ( not ( = ?auto_43636 ?auto_43637 ) ) ( not ( = ?auto_43638 ?auto_43637 ) ) ( CLEAR ?auto_43634 ) ( ON ?auto_43633 ?auto_43632 ) ( CLEAR ?auto_43633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43637 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43637 ?auto_43632 )
      ( MAKE-4PILE ?auto_43632 ?auto_43633 ?auto_43634 ?auto_43635 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43639 - BLOCK
      ?auto_43640 - BLOCK
      ?auto_43641 - BLOCK
      ?auto_43642 - BLOCK
    )
    :vars
    (
      ?auto_43645 - BLOCK
      ?auto_43644 - BLOCK
      ?auto_43643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43639 ?auto_43640 ) ) ( not ( = ?auto_43639 ?auto_43641 ) ) ( not ( = ?auto_43639 ?auto_43642 ) ) ( not ( = ?auto_43640 ?auto_43641 ) ) ( not ( = ?auto_43640 ?auto_43642 ) ) ( not ( = ?auto_43641 ?auto_43642 ) ) ( ON ?auto_43642 ?auto_43645 ) ( not ( = ?auto_43639 ?auto_43645 ) ) ( not ( = ?auto_43640 ?auto_43645 ) ) ( not ( = ?auto_43641 ?auto_43645 ) ) ( not ( = ?auto_43642 ?auto_43645 ) ) ( ON-TABLE ?auto_43644 ) ( ON ?auto_43645 ?auto_43644 ) ( not ( = ?auto_43644 ?auto_43645 ) ) ( not ( = ?auto_43644 ?auto_43642 ) ) ( not ( = ?auto_43644 ?auto_43641 ) ) ( not ( = ?auto_43639 ?auto_43644 ) ) ( not ( = ?auto_43640 ?auto_43644 ) ) ( ON ?auto_43639 ?auto_43643 ) ( not ( = ?auto_43639 ?auto_43643 ) ) ( not ( = ?auto_43640 ?auto_43643 ) ) ( not ( = ?auto_43641 ?auto_43643 ) ) ( not ( = ?auto_43642 ?auto_43643 ) ) ( not ( = ?auto_43645 ?auto_43643 ) ) ( not ( = ?auto_43644 ?auto_43643 ) ) ( ON ?auto_43640 ?auto_43639 ) ( CLEAR ?auto_43640 ) ( ON-TABLE ?auto_43643 ) ( HOLDING ?auto_43641 ) ( CLEAR ?auto_43642 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43644 ?auto_43645 ?auto_43642 ?auto_43641 )
      ( MAKE-4PILE ?auto_43639 ?auto_43640 ?auto_43641 ?auto_43642 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43646 - BLOCK
      ?auto_43647 - BLOCK
      ?auto_43648 - BLOCK
      ?auto_43649 - BLOCK
    )
    :vars
    (
      ?auto_43652 - BLOCK
      ?auto_43650 - BLOCK
      ?auto_43651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43646 ?auto_43647 ) ) ( not ( = ?auto_43646 ?auto_43648 ) ) ( not ( = ?auto_43646 ?auto_43649 ) ) ( not ( = ?auto_43647 ?auto_43648 ) ) ( not ( = ?auto_43647 ?auto_43649 ) ) ( not ( = ?auto_43648 ?auto_43649 ) ) ( ON ?auto_43649 ?auto_43652 ) ( not ( = ?auto_43646 ?auto_43652 ) ) ( not ( = ?auto_43647 ?auto_43652 ) ) ( not ( = ?auto_43648 ?auto_43652 ) ) ( not ( = ?auto_43649 ?auto_43652 ) ) ( ON-TABLE ?auto_43650 ) ( ON ?auto_43652 ?auto_43650 ) ( not ( = ?auto_43650 ?auto_43652 ) ) ( not ( = ?auto_43650 ?auto_43649 ) ) ( not ( = ?auto_43650 ?auto_43648 ) ) ( not ( = ?auto_43646 ?auto_43650 ) ) ( not ( = ?auto_43647 ?auto_43650 ) ) ( ON ?auto_43646 ?auto_43651 ) ( not ( = ?auto_43646 ?auto_43651 ) ) ( not ( = ?auto_43647 ?auto_43651 ) ) ( not ( = ?auto_43648 ?auto_43651 ) ) ( not ( = ?auto_43649 ?auto_43651 ) ) ( not ( = ?auto_43652 ?auto_43651 ) ) ( not ( = ?auto_43650 ?auto_43651 ) ) ( ON ?auto_43647 ?auto_43646 ) ( ON-TABLE ?auto_43651 ) ( CLEAR ?auto_43649 ) ( ON ?auto_43648 ?auto_43647 ) ( CLEAR ?auto_43648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43651 ?auto_43646 ?auto_43647 )
      ( MAKE-4PILE ?auto_43646 ?auto_43647 ?auto_43648 ?auto_43649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43653 - BLOCK
      ?auto_43654 - BLOCK
      ?auto_43655 - BLOCK
      ?auto_43656 - BLOCK
    )
    :vars
    (
      ?auto_43659 - BLOCK
      ?auto_43657 - BLOCK
      ?auto_43658 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43653 ?auto_43654 ) ) ( not ( = ?auto_43653 ?auto_43655 ) ) ( not ( = ?auto_43653 ?auto_43656 ) ) ( not ( = ?auto_43654 ?auto_43655 ) ) ( not ( = ?auto_43654 ?auto_43656 ) ) ( not ( = ?auto_43655 ?auto_43656 ) ) ( not ( = ?auto_43653 ?auto_43659 ) ) ( not ( = ?auto_43654 ?auto_43659 ) ) ( not ( = ?auto_43655 ?auto_43659 ) ) ( not ( = ?auto_43656 ?auto_43659 ) ) ( ON-TABLE ?auto_43657 ) ( ON ?auto_43659 ?auto_43657 ) ( not ( = ?auto_43657 ?auto_43659 ) ) ( not ( = ?auto_43657 ?auto_43656 ) ) ( not ( = ?auto_43657 ?auto_43655 ) ) ( not ( = ?auto_43653 ?auto_43657 ) ) ( not ( = ?auto_43654 ?auto_43657 ) ) ( ON ?auto_43653 ?auto_43658 ) ( not ( = ?auto_43653 ?auto_43658 ) ) ( not ( = ?auto_43654 ?auto_43658 ) ) ( not ( = ?auto_43655 ?auto_43658 ) ) ( not ( = ?auto_43656 ?auto_43658 ) ) ( not ( = ?auto_43659 ?auto_43658 ) ) ( not ( = ?auto_43657 ?auto_43658 ) ) ( ON ?auto_43654 ?auto_43653 ) ( ON-TABLE ?auto_43658 ) ( ON ?auto_43655 ?auto_43654 ) ( CLEAR ?auto_43655 ) ( HOLDING ?auto_43656 ) ( CLEAR ?auto_43659 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43657 ?auto_43659 ?auto_43656 )
      ( MAKE-4PILE ?auto_43653 ?auto_43654 ?auto_43655 ?auto_43656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43660 - BLOCK
      ?auto_43661 - BLOCK
      ?auto_43662 - BLOCK
      ?auto_43663 - BLOCK
    )
    :vars
    (
      ?auto_43665 - BLOCK
      ?auto_43664 - BLOCK
      ?auto_43666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43660 ?auto_43661 ) ) ( not ( = ?auto_43660 ?auto_43662 ) ) ( not ( = ?auto_43660 ?auto_43663 ) ) ( not ( = ?auto_43661 ?auto_43662 ) ) ( not ( = ?auto_43661 ?auto_43663 ) ) ( not ( = ?auto_43662 ?auto_43663 ) ) ( not ( = ?auto_43660 ?auto_43665 ) ) ( not ( = ?auto_43661 ?auto_43665 ) ) ( not ( = ?auto_43662 ?auto_43665 ) ) ( not ( = ?auto_43663 ?auto_43665 ) ) ( ON-TABLE ?auto_43664 ) ( ON ?auto_43665 ?auto_43664 ) ( not ( = ?auto_43664 ?auto_43665 ) ) ( not ( = ?auto_43664 ?auto_43663 ) ) ( not ( = ?auto_43664 ?auto_43662 ) ) ( not ( = ?auto_43660 ?auto_43664 ) ) ( not ( = ?auto_43661 ?auto_43664 ) ) ( ON ?auto_43660 ?auto_43666 ) ( not ( = ?auto_43660 ?auto_43666 ) ) ( not ( = ?auto_43661 ?auto_43666 ) ) ( not ( = ?auto_43662 ?auto_43666 ) ) ( not ( = ?auto_43663 ?auto_43666 ) ) ( not ( = ?auto_43665 ?auto_43666 ) ) ( not ( = ?auto_43664 ?auto_43666 ) ) ( ON ?auto_43661 ?auto_43660 ) ( ON-TABLE ?auto_43666 ) ( ON ?auto_43662 ?auto_43661 ) ( CLEAR ?auto_43665 ) ( ON ?auto_43663 ?auto_43662 ) ( CLEAR ?auto_43663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43666 ?auto_43660 ?auto_43661 ?auto_43662 )
      ( MAKE-4PILE ?auto_43660 ?auto_43661 ?auto_43662 ?auto_43663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43667 - BLOCK
      ?auto_43668 - BLOCK
      ?auto_43669 - BLOCK
      ?auto_43670 - BLOCK
    )
    :vars
    (
      ?auto_43672 - BLOCK
      ?auto_43673 - BLOCK
      ?auto_43671 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43667 ?auto_43668 ) ) ( not ( = ?auto_43667 ?auto_43669 ) ) ( not ( = ?auto_43667 ?auto_43670 ) ) ( not ( = ?auto_43668 ?auto_43669 ) ) ( not ( = ?auto_43668 ?auto_43670 ) ) ( not ( = ?auto_43669 ?auto_43670 ) ) ( not ( = ?auto_43667 ?auto_43672 ) ) ( not ( = ?auto_43668 ?auto_43672 ) ) ( not ( = ?auto_43669 ?auto_43672 ) ) ( not ( = ?auto_43670 ?auto_43672 ) ) ( ON-TABLE ?auto_43673 ) ( not ( = ?auto_43673 ?auto_43672 ) ) ( not ( = ?auto_43673 ?auto_43670 ) ) ( not ( = ?auto_43673 ?auto_43669 ) ) ( not ( = ?auto_43667 ?auto_43673 ) ) ( not ( = ?auto_43668 ?auto_43673 ) ) ( ON ?auto_43667 ?auto_43671 ) ( not ( = ?auto_43667 ?auto_43671 ) ) ( not ( = ?auto_43668 ?auto_43671 ) ) ( not ( = ?auto_43669 ?auto_43671 ) ) ( not ( = ?auto_43670 ?auto_43671 ) ) ( not ( = ?auto_43672 ?auto_43671 ) ) ( not ( = ?auto_43673 ?auto_43671 ) ) ( ON ?auto_43668 ?auto_43667 ) ( ON-TABLE ?auto_43671 ) ( ON ?auto_43669 ?auto_43668 ) ( ON ?auto_43670 ?auto_43669 ) ( CLEAR ?auto_43670 ) ( HOLDING ?auto_43672 ) ( CLEAR ?auto_43673 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43673 ?auto_43672 )
      ( MAKE-4PILE ?auto_43667 ?auto_43668 ?auto_43669 ?auto_43670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43674 - BLOCK
      ?auto_43675 - BLOCK
      ?auto_43676 - BLOCK
      ?auto_43677 - BLOCK
    )
    :vars
    (
      ?auto_43680 - BLOCK
      ?auto_43679 - BLOCK
      ?auto_43678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43674 ?auto_43675 ) ) ( not ( = ?auto_43674 ?auto_43676 ) ) ( not ( = ?auto_43674 ?auto_43677 ) ) ( not ( = ?auto_43675 ?auto_43676 ) ) ( not ( = ?auto_43675 ?auto_43677 ) ) ( not ( = ?auto_43676 ?auto_43677 ) ) ( not ( = ?auto_43674 ?auto_43680 ) ) ( not ( = ?auto_43675 ?auto_43680 ) ) ( not ( = ?auto_43676 ?auto_43680 ) ) ( not ( = ?auto_43677 ?auto_43680 ) ) ( ON-TABLE ?auto_43679 ) ( not ( = ?auto_43679 ?auto_43680 ) ) ( not ( = ?auto_43679 ?auto_43677 ) ) ( not ( = ?auto_43679 ?auto_43676 ) ) ( not ( = ?auto_43674 ?auto_43679 ) ) ( not ( = ?auto_43675 ?auto_43679 ) ) ( ON ?auto_43674 ?auto_43678 ) ( not ( = ?auto_43674 ?auto_43678 ) ) ( not ( = ?auto_43675 ?auto_43678 ) ) ( not ( = ?auto_43676 ?auto_43678 ) ) ( not ( = ?auto_43677 ?auto_43678 ) ) ( not ( = ?auto_43680 ?auto_43678 ) ) ( not ( = ?auto_43679 ?auto_43678 ) ) ( ON ?auto_43675 ?auto_43674 ) ( ON-TABLE ?auto_43678 ) ( ON ?auto_43676 ?auto_43675 ) ( ON ?auto_43677 ?auto_43676 ) ( CLEAR ?auto_43679 ) ( ON ?auto_43680 ?auto_43677 ) ( CLEAR ?auto_43680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43678 ?auto_43674 ?auto_43675 ?auto_43676 ?auto_43677 )
      ( MAKE-4PILE ?auto_43674 ?auto_43675 ?auto_43676 ?auto_43677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43681 - BLOCK
      ?auto_43682 - BLOCK
      ?auto_43683 - BLOCK
      ?auto_43684 - BLOCK
    )
    :vars
    (
      ?auto_43687 - BLOCK
      ?auto_43685 - BLOCK
      ?auto_43686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43681 ?auto_43682 ) ) ( not ( = ?auto_43681 ?auto_43683 ) ) ( not ( = ?auto_43681 ?auto_43684 ) ) ( not ( = ?auto_43682 ?auto_43683 ) ) ( not ( = ?auto_43682 ?auto_43684 ) ) ( not ( = ?auto_43683 ?auto_43684 ) ) ( not ( = ?auto_43681 ?auto_43687 ) ) ( not ( = ?auto_43682 ?auto_43687 ) ) ( not ( = ?auto_43683 ?auto_43687 ) ) ( not ( = ?auto_43684 ?auto_43687 ) ) ( not ( = ?auto_43685 ?auto_43687 ) ) ( not ( = ?auto_43685 ?auto_43684 ) ) ( not ( = ?auto_43685 ?auto_43683 ) ) ( not ( = ?auto_43681 ?auto_43685 ) ) ( not ( = ?auto_43682 ?auto_43685 ) ) ( ON ?auto_43681 ?auto_43686 ) ( not ( = ?auto_43681 ?auto_43686 ) ) ( not ( = ?auto_43682 ?auto_43686 ) ) ( not ( = ?auto_43683 ?auto_43686 ) ) ( not ( = ?auto_43684 ?auto_43686 ) ) ( not ( = ?auto_43687 ?auto_43686 ) ) ( not ( = ?auto_43685 ?auto_43686 ) ) ( ON ?auto_43682 ?auto_43681 ) ( ON-TABLE ?auto_43686 ) ( ON ?auto_43683 ?auto_43682 ) ( ON ?auto_43684 ?auto_43683 ) ( ON ?auto_43687 ?auto_43684 ) ( CLEAR ?auto_43687 ) ( HOLDING ?auto_43685 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43685 )
      ( MAKE-4PILE ?auto_43681 ?auto_43682 ?auto_43683 ?auto_43684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_43688 - BLOCK
      ?auto_43689 - BLOCK
      ?auto_43690 - BLOCK
      ?auto_43691 - BLOCK
    )
    :vars
    (
      ?auto_43694 - BLOCK
      ?auto_43693 - BLOCK
      ?auto_43692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43688 ?auto_43689 ) ) ( not ( = ?auto_43688 ?auto_43690 ) ) ( not ( = ?auto_43688 ?auto_43691 ) ) ( not ( = ?auto_43689 ?auto_43690 ) ) ( not ( = ?auto_43689 ?auto_43691 ) ) ( not ( = ?auto_43690 ?auto_43691 ) ) ( not ( = ?auto_43688 ?auto_43694 ) ) ( not ( = ?auto_43689 ?auto_43694 ) ) ( not ( = ?auto_43690 ?auto_43694 ) ) ( not ( = ?auto_43691 ?auto_43694 ) ) ( not ( = ?auto_43693 ?auto_43694 ) ) ( not ( = ?auto_43693 ?auto_43691 ) ) ( not ( = ?auto_43693 ?auto_43690 ) ) ( not ( = ?auto_43688 ?auto_43693 ) ) ( not ( = ?auto_43689 ?auto_43693 ) ) ( ON ?auto_43688 ?auto_43692 ) ( not ( = ?auto_43688 ?auto_43692 ) ) ( not ( = ?auto_43689 ?auto_43692 ) ) ( not ( = ?auto_43690 ?auto_43692 ) ) ( not ( = ?auto_43691 ?auto_43692 ) ) ( not ( = ?auto_43694 ?auto_43692 ) ) ( not ( = ?auto_43693 ?auto_43692 ) ) ( ON ?auto_43689 ?auto_43688 ) ( ON-TABLE ?auto_43692 ) ( ON ?auto_43690 ?auto_43689 ) ( ON ?auto_43691 ?auto_43690 ) ( ON ?auto_43694 ?auto_43691 ) ( ON ?auto_43693 ?auto_43694 ) ( CLEAR ?auto_43693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43692 ?auto_43688 ?auto_43689 ?auto_43690 ?auto_43691 ?auto_43694 )
      ( MAKE-4PILE ?auto_43688 ?auto_43689 ?auto_43690 ?auto_43691 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43706 - BLOCK
    )
    :vars
    (
      ?auto_43708 - BLOCK
      ?auto_43707 - BLOCK
      ?auto_43709 - BLOCK
      ?auto_43711 - BLOCK
      ?auto_43710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43708 ?auto_43706 ) ( ON-TABLE ?auto_43706 ) ( not ( = ?auto_43706 ?auto_43708 ) ) ( not ( = ?auto_43706 ?auto_43707 ) ) ( not ( = ?auto_43706 ?auto_43709 ) ) ( not ( = ?auto_43708 ?auto_43707 ) ) ( not ( = ?auto_43708 ?auto_43709 ) ) ( not ( = ?auto_43707 ?auto_43709 ) ) ( ON ?auto_43707 ?auto_43708 ) ( CLEAR ?auto_43707 ) ( HOLDING ?auto_43709 ) ( CLEAR ?auto_43711 ) ( ON-TABLE ?auto_43710 ) ( ON ?auto_43711 ?auto_43710 ) ( not ( = ?auto_43710 ?auto_43711 ) ) ( not ( = ?auto_43710 ?auto_43709 ) ) ( not ( = ?auto_43711 ?auto_43709 ) ) ( not ( = ?auto_43706 ?auto_43711 ) ) ( not ( = ?auto_43706 ?auto_43710 ) ) ( not ( = ?auto_43708 ?auto_43711 ) ) ( not ( = ?auto_43708 ?auto_43710 ) ) ( not ( = ?auto_43707 ?auto_43711 ) ) ( not ( = ?auto_43707 ?auto_43710 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43710 ?auto_43711 ?auto_43709 )
      ( MAKE-1PILE ?auto_43706 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43712 - BLOCK
    )
    :vars
    (
      ?auto_43714 - BLOCK
      ?auto_43713 - BLOCK
      ?auto_43715 - BLOCK
      ?auto_43717 - BLOCK
      ?auto_43716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43714 ?auto_43712 ) ( ON-TABLE ?auto_43712 ) ( not ( = ?auto_43712 ?auto_43714 ) ) ( not ( = ?auto_43712 ?auto_43713 ) ) ( not ( = ?auto_43712 ?auto_43715 ) ) ( not ( = ?auto_43714 ?auto_43713 ) ) ( not ( = ?auto_43714 ?auto_43715 ) ) ( not ( = ?auto_43713 ?auto_43715 ) ) ( ON ?auto_43713 ?auto_43714 ) ( CLEAR ?auto_43717 ) ( ON-TABLE ?auto_43716 ) ( ON ?auto_43717 ?auto_43716 ) ( not ( = ?auto_43716 ?auto_43717 ) ) ( not ( = ?auto_43716 ?auto_43715 ) ) ( not ( = ?auto_43717 ?auto_43715 ) ) ( not ( = ?auto_43712 ?auto_43717 ) ) ( not ( = ?auto_43712 ?auto_43716 ) ) ( not ( = ?auto_43714 ?auto_43717 ) ) ( not ( = ?auto_43714 ?auto_43716 ) ) ( not ( = ?auto_43713 ?auto_43717 ) ) ( not ( = ?auto_43713 ?auto_43716 ) ) ( ON ?auto_43715 ?auto_43713 ) ( CLEAR ?auto_43715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43712 ?auto_43714 ?auto_43713 )
      ( MAKE-1PILE ?auto_43712 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43718 - BLOCK
    )
    :vars
    (
      ?auto_43719 - BLOCK
      ?auto_43720 - BLOCK
      ?auto_43721 - BLOCK
      ?auto_43722 - BLOCK
      ?auto_43723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43719 ?auto_43718 ) ( ON-TABLE ?auto_43718 ) ( not ( = ?auto_43718 ?auto_43719 ) ) ( not ( = ?auto_43718 ?auto_43720 ) ) ( not ( = ?auto_43718 ?auto_43721 ) ) ( not ( = ?auto_43719 ?auto_43720 ) ) ( not ( = ?auto_43719 ?auto_43721 ) ) ( not ( = ?auto_43720 ?auto_43721 ) ) ( ON ?auto_43720 ?auto_43719 ) ( ON-TABLE ?auto_43722 ) ( not ( = ?auto_43722 ?auto_43723 ) ) ( not ( = ?auto_43722 ?auto_43721 ) ) ( not ( = ?auto_43723 ?auto_43721 ) ) ( not ( = ?auto_43718 ?auto_43723 ) ) ( not ( = ?auto_43718 ?auto_43722 ) ) ( not ( = ?auto_43719 ?auto_43723 ) ) ( not ( = ?auto_43719 ?auto_43722 ) ) ( not ( = ?auto_43720 ?auto_43723 ) ) ( not ( = ?auto_43720 ?auto_43722 ) ) ( ON ?auto_43721 ?auto_43720 ) ( CLEAR ?auto_43721 ) ( HOLDING ?auto_43723 ) ( CLEAR ?auto_43722 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43722 ?auto_43723 )
      ( MAKE-1PILE ?auto_43718 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43724 - BLOCK
    )
    :vars
    (
      ?auto_43728 - BLOCK
      ?auto_43729 - BLOCK
      ?auto_43726 - BLOCK
      ?auto_43725 - BLOCK
      ?auto_43727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43728 ?auto_43724 ) ( ON-TABLE ?auto_43724 ) ( not ( = ?auto_43724 ?auto_43728 ) ) ( not ( = ?auto_43724 ?auto_43729 ) ) ( not ( = ?auto_43724 ?auto_43726 ) ) ( not ( = ?auto_43728 ?auto_43729 ) ) ( not ( = ?auto_43728 ?auto_43726 ) ) ( not ( = ?auto_43729 ?auto_43726 ) ) ( ON ?auto_43729 ?auto_43728 ) ( ON-TABLE ?auto_43725 ) ( not ( = ?auto_43725 ?auto_43727 ) ) ( not ( = ?auto_43725 ?auto_43726 ) ) ( not ( = ?auto_43727 ?auto_43726 ) ) ( not ( = ?auto_43724 ?auto_43727 ) ) ( not ( = ?auto_43724 ?auto_43725 ) ) ( not ( = ?auto_43728 ?auto_43727 ) ) ( not ( = ?auto_43728 ?auto_43725 ) ) ( not ( = ?auto_43729 ?auto_43727 ) ) ( not ( = ?auto_43729 ?auto_43725 ) ) ( ON ?auto_43726 ?auto_43729 ) ( CLEAR ?auto_43725 ) ( ON ?auto_43727 ?auto_43726 ) ( CLEAR ?auto_43727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43724 ?auto_43728 ?auto_43729 ?auto_43726 )
      ( MAKE-1PILE ?auto_43724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43730 - BLOCK
    )
    :vars
    (
      ?auto_43734 - BLOCK
      ?auto_43732 - BLOCK
      ?auto_43731 - BLOCK
      ?auto_43733 - BLOCK
      ?auto_43735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43734 ?auto_43730 ) ( ON-TABLE ?auto_43730 ) ( not ( = ?auto_43730 ?auto_43734 ) ) ( not ( = ?auto_43730 ?auto_43732 ) ) ( not ( = ?auto_43730 ?auto_43731 ) ) ( not ( = ?auto_43734 ?auto_43732 ) ) ( not ( = ?auto_43734 ?auto_43731 ) ) ( not ( = ?auto_43732 ?auto_43731 ) ) ( ON ?auto_43732 ?auto_43734 ) ( not ( = ?auto_43733 ?auto_43735 ) ) ( not ( = ?auto_43733 ?auto_43731 ) ) ( not ( = ?auto_43735 ?auto_43731 ) ) ( not ( = ?auto_43730 ?auto_43735 ) ) ( not ( = ?auto_43730 ?auto_43733 ) ) ( not ( = ?auto_43734 ?auto_43735 ) ) ( not ( = ?auto_43734 ?auto_43733 ) ) ( not ( = ?auto_43732 ?auto_43735 ) ) ( not ( = ?auto_43732 ?auto_43733 ) ) ( ON ?auto_43731 ?auto_43732 ) ( ON ?auto_43735 ?auto_43731 ) ( CLEAR ?auto_43735 ) ( HOLDING ?auto_43733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43733 )
      ( MAKE-1PILE ?auto_43730 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43743 - BLOCK
    )
    :vars
    (
      ?auto_43747 - BLOCK
      ?auto_43744 - BLOCK
      ?auto_43748 - BLOCK
      ?auto_43746 - BLOCK
      ?auto_43745 - BLOCK
      ?auto_43749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43747 ?auto_43743 ) ( ON-TABLE ?auto_43743 ) ( not ( = ?auto_43743 ?auto_43747 ) ) ( not ( = ?auto_43743 ?auto_43744 ) ) ( not ( = ?auto_43743 ?auto_43748 ) ) ( not ( = ?auto_43747 ?auto_43744 ) ) ( not ( = ?auto_43747 ?auto_43748 ) ) ( not ( = ?auto_43744 ?auto_43748 ) ) ( ON ?auto_43744 ?auto_43747 ) ( not ( = ?auto_43746 ?auto_43745 ) ) ( not ( = ?auto_43746 ?auto_43748 ) ) ( not ( = ?auto_43745 ?auto_43748 ) ) ( not ( = ?auto_43743 ?auto_43745 ) ) ( not ( = ?auto_43743 ?auto_43746 ) ) ( not ( = ?auto_43747 ?auto_43745 ) ) ( not ( = ?auto_43747 ?auto_43746 ) ) ( not ( = ?auto_43744 ?auto_43745 ) ) ( not ( = ?auto_43744 ?auto_43746 ) ) ( ON ?auto_43748 ?auto_43744 ) ( ON ?auto_43745 ?auto_43748 ) ( CLEAR ?auto_43745 ) ( ON ?auto_43746 ?auto_43749 ) ( CLEAR ?auto_43746 ) ( HAND-EMPTY ) ( not ( = ?auto_43743 ?auto_43749 ) ) ( not ( = ?auto_43747 ?auto_43749 ) ) ( not ( = ?auto_43744 ?auto_43749 ) ) ( not ( = ?auto_43748 ?auto_43749 ) ) ( not ( = ?auto_43746 ?auto_43749 ) ) ( not ( = ?auto_43745 ?auto_43749 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43746 ?auto_43749 )
      ( MAKE-1PILE ?auto_43743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43750 - BLOCK
    )
    :vars
    (
      ?auto_43756 - BLOCK
      ?auto_43752 - BLOCK
      ?auto_43754 - BLOCK
      ?auto_43753 - BLOCK
      ?auto_43755 - BLOCK
      ?auto_43751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43756 ?auto_43750 ) ( ON-TABLE ?auto_43750 ) ( not ( = ?auto_43750 ?auto_43756 ) ) ( not ( = ?auto_43750 ?auto_43752 ) ) ( not ( = ?auto_43750 ?auto_43754 ) ) ( not ( = ?auto_43756 ?auto_43752 ) ) ( not ( = ?auto_43756 ?auto_43754 ) ) ( not ( = ?auto_43752 ?auto_43754 ) ) ( ON ?auto_43752 ?auto_43756 ) ( not ( = ?auto_43753 ?auto_43755 ) ) ( not ( = ?auto_43753 ?auto_43754 ) ) ( not ( = ?auto_43755 ?auto_43754 ) ) ( not ( = ?auto_43750 ?auto_43755 ) ) ( not ( = ?auto_43750 ?auto_43753 ) ) ( not ( = ?auto_43756 ?auto_43755 ) ) ( not ( = ?auto_43756 ?auto_43753 ) ) ( not ( = ?auto_43752 ?auto_43755 ) ) ( not ( = ?auto_43752 ?auto_43753 ) ) ( ON ?auto_43754 ?auto_43752 ) ( ON ?auto_43753 ?auto_43751 ) ( CLEAR ?auto_43753 ) ( not ( = ?auto_43750 ?auto_43751 ) ) ( not ( = ?auto_43756 ?auto_43751 ) ) ( not ( = ?auto_43752 ?auto_43751 ) ) ( not ( = ?auto_43754 ?auto_43751 ) ) ( not ( = ?auto_43753 ?auto_43751 ) ) ( not ( = ?auto_43755 ?auto_43751 ) ) ( HOLDING ?auto_43755 ) ( CLEAR ?auto_43754 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43750 ?auto_43756 ?auto_43752 ?auto_43754 ?auto_43755 )
      ( MAKE-1PILE ?auto_43750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_43757 - BLOCK
    )
    :vars
    (
      ?auto_43759 - BLOCK
      ?auto_43762 - BLOCK
      ?auto_43760 - BLOCK
      ?auto_43758 - BLOCK
      ?auto_43763 - BLOCK
      ?auto_43761 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_43759 ?auto_43757 ) ( ON-TABLE ?auto_43757 ) ( not ( = ?auto_43757 ?auto_43759 ) ) ( not ( = ?auto_43757 ?auto_43762 ) ) ( not ( = ?auto_43757 ?auto_43760 ) ) ( not ( = ?auto_43759 ?auto_43762 ) ) ( not ( = ?auto_43759 ?auto_43760 ) ) ( not ( = ?auto_43762 ?auto_43760 ) ) ( ON ?auto_43762 ?auto_43759 ) ( not ( = ?auto_43758 ?auto_43763 ) ) ( not ( = ?auto_43758 ?auto_43760 ) ) ( not ( = ?auto_43763 ?auto_43760 ) ) ( not ( = ?auto_43757 ?auto_43763 ) ) ( not ( = ?auto_43757 ?auto_43758 ) ) ( not ( = ?auto_43759 ?auto_43763 ) ) ( not ( = ?auto_43759 ?auto_43758 ) ) ( not ( = ?auto_43762 ?auto_43763 ) ) ( not ( = ?auto_43762 ?auto_43758 ) ) ( ON ?auto_43760 ?auto_43762 ) ( ON ?auto_43758 ?auto_43761 ) ( not ( = ?auto_43757 ?auto_43761 ) ) ( not ( = ?auto_43759 ?auto_43761 ) ) ( not ( = ?auto_43762 ?auto_43761 ) ) ( not ( = ?auto_43760 ?auto_43761 ) ) ( not ( = ?auto_43758 ?auto_43761 ) ) ( not ( = ?auto_43763 ?auto_43761 ) ) ( CLEAR ?auto_43760 ) ( ON ?auto_43763 ?auto_43758 ) ( CLEAR ?auto_43763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43761 ?auto_43758 )
      ( MAKE-1PILE ?auto_43757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43797 - BLOCK
      ?auto_43798 - BLOCK
      ?auto_43799 - BLOCK
      ?auto_43800 - BLOCK
      ?auto_43801 - BLOCK
    )
    :vars
    (
      ?auto_43802 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43797 ) ( ON ?auto_43798 ?auto_43797 ) ( ON ?auto_43799 ?auto_43798 ) ( not ( = ?auto_43797 ?auto_43798 ) ) ( not ( = ?auto_43797 ?auto_43799 ) ) ( not ( = ?auto_43797 ?auto_43800 ) ) ( not ( = ?auto_43797 ?auto_43801 ) ) ( not ( = ?auto_43798 ?auto_43799 ) ) ( not ( = ?auto_43798 ?auto_43800 ) ) ( not ( = ?auto_43798 ?auto_43801 ) ) ( not ( = ?auto_43799 ?auto_43800 ) ) ( not ( = ?auto_43799 ?auto_43801 ) ) ( not ( = ?auto_43800 ?auto_43801 ) ) ( ON ?auto_43801 ?auto_43802 ) ( not ( = ?auto_43797 ?auto_43802 ) ) ( not ( = ?auto_43798 ?auto_43802 ) ) ( not ( = ?auto_43799 ?auto_43802 ) ) ( not ( = ?auto_43800 ?auto_43802 ) ) ( not ( = ?auto_43801 ?auto_43802 ) ) ( CLEAR ?auto_43799 ) ( ON ?auto_43800 ?auto_43801 ) ( CLEAR ?auto_43800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43802 ?auto_43801 )
      ( MAKE-5PILE ?auto_43797 ?auto_43798 ?auto_43799 ?auto_43800 ?auto_43801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43803 - BLOCK
      ?auto_43804 - BLOCK
      ?auto_43805 - BLOCK
      ?auto_43806 - BLOCK
      ?auto_43807 - BLOCK
    )
    :vars
    (
      ?auto_43808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43803 ) ( ON ?auto_43804 ?auto_43803 ) ( not ( = ?auto_43803 ?auto_43804 ) ) ( not ( = ?auto_43803 ?auto_43805 ) ) ( not ( = ?auto_43803 ?auto_43806 ) ) ( not ( = ?auto_43803 ?auto_43807 ) ) ( not ( = ?auto_43804 ?auto_43805 ) ) ( not ( = ?auto_43804 ?auto_43806 ) ) ( not ( = ?auto_43804 ?auto_43807 ) ) ( not ( = ?auto_43805 ?auto_43806 ) ) ( not ( = ?auto_43805 ?auto_43807 ) ) ( not ( = ?auto_43806 ?auto_43807 ) ) ( ON ?auto_43807 ?auto_43808 ) ( not ( = ?auto_43803 ?auto_43808 ) ) ( not ( = ?auto_43804 ?auto_43808 ) ) ( not ( = ?auto_43805 ?auto_43808 ) ) ( not ( = ?auto_43806 ?auto_43808 ) ) ( not ( = ?auto_43807 ?auto_43808 ) ) ( ON ?auto_43806 ?auto_43807 ) ( CLEAR ?auto_43806 ) ( ON-TABLE ?auto_43808 ) ( HOLDING ?auto_43805 ) ( CLEAR ?auto_43804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43803 ?auto_43804 ?auto_43805 )
      ( MAKE-5PILE ?auto_43803 ?auto_43804 ?auto_43805 ?auto_43806 ?auto_43807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43809 - BLOCK
      ?auto_43810 - BLOCK
      ?auto_43811 - BLOCK
      ?auto_43812 - BLOCK
      ?auto_43813 - BLOCK
    )
    :vars
    (
      ?auto_43814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43809 ) ( ON ?auto_43810 ?auto_43809 ) ( not ( = ?auto_43809 ?auto_43810 ) ) ( not ( = ?auto_43809 ?auto_43811 ) ) ( not ( = ?auto_43809 ?auto_43812 ) ) ( not ( = ?auto_43809 ?auto_43813 ) ) ( not ( = ?auto_43810 ?auto_43811 ) ) ( not ( = ?auto_43810 ?auto_43812 ) ) ( not ( = ?auto_43810 ?auto_43813 ) ) ( not ( = ?auto_43811 ?auto_43812 ) ) ( not ( = ?auto_43811 ?auto_43813 ) ) ( not ( = ?auto_43812 ?auto_43813 ) ) ( ON ?auto_43813 ?auto_43814 ) ( not ( = ?auto_43809 ?auto_43814 ) ) ( not ( = ?auto_43810 ?auto_43814 ) ) ( not ( = ?auto_43811 ?auto_43814 ) ) ( not ( = ?auto_43812 ?auto_43814 ) ) ( not ( = ?auto_43813 ?auto_43814 ) ) ( ON ?auto_43812 ?auto_43813 ) ( ON-TABLE ?auto_43814 ) ( CLEAR ?auto_43810 ) ( ON ?auto_43811 ?auto_43812 ) ( CLEAR ?auto_43811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43814 ?auto_43813 ?auto_43812 )
      ( MAKE-5PILE ?auto_43809 ?auto_43810 ?auto_43811 ?auto_43812 ?auto_43813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43815 - BLOCK
      ?auto_43816 - BLOCK
      ?auto_43817 - BLOCK
      ?auto_43818 - BLOCK
      ?auto_43819 - BLOCK
    )
    :vars
    (
      ?auto_43820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43815 ) ( not ( = ?auto_43815 ?auto_43816 ) ) ( not ( = ?auto_43815 ?auto_43817 ) ) ( not ( = ?auto_43815 ?auto_43818 ) ) ( not ( = ?auto_43815 ?auto_43819 ) ) ( not ( = ?auto_43816 ?auto_43817 ) ) ( not ( = ?auto_43816 ?auto_43818 ) ) ( not ( = ?auto_43816 ?auto_43819 ) ) ( not ( = ?auto_43817 ?auto_43818 ) ) ( not ( = ?auto_43817 ?auto_43819 ) ) ( not ( = ?auto_43818 ?auto_43819 ) ) ( ON ?auto_43819 ?auto_43820 ) ( not ( = ?auto_43815 ?auto_43820 ) ) ( not ( = ?auto_43816 ?auto_43820 ) ) ( not ( = ?auto_43817 ?auto_43820 ) ) ( not ( = ?auto_43818 ?auto_43820 ) ) ( not ( = ?auto_43819 ?auto_43820 ) ) ( ON ?auto_43818 ?auto_43819 ) ( ON-TABLE ?auto_43820 ) ( ON ?auto_43817 ?auto_43818 ) ( CLEAR ?auto_43817 ) ( HOLDING ?auto_43816 ) ( CLEAR ?auto_43815 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43815 ?auto_43816 )
      ( MAKE-5PILE ?auto_43815 ?auto_43816 ?auto_43817 ?auto_43818 ?auto_43819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43821 - BLOCK
      ?auto_43822 - BLOCK
      ?auto_43823 - BLOCK
      ?auto_43824 - BLOCK
      ?auto_43825 - BLOCK
    )
    :vars
    (
      ?auto_43826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43821 ) ( not ( = ?auto_43821 ?auto_43822 ) ) ( not ( = ?auto_43821 ?auto_43823 ) ) ( not ( = ?auto_43821 ?auto_43824 ) ) ( not ( = ?auto_43821 ?auto_43825 ) ) ( not ( = ?auto_43822 ?auto_43823 ) ) ( not ( = ?auto_43822 ?auto_43824 ) ) ( not ( = ?auto_43822 ?auto_43825 ) ) ( not ( = ?auto_43823 ?auto_43824 ) ) ( not ( = ?auto_43823 ?auto_43825 ) ) ( not ( = ?auto_43824 ?auto_43825 ) ) ( ON ?auto_43825 ?auto_43826 ) ( not ( = ?auto_43821 ?auto_43826 ) ) ( not ( = ?auto_43822 ?auto_43826 ) ) ( not ( = ?auto_43823 ?auto_43826 ) ) ( not ( = ?auto_43824 ?auto_43826 ) ) ( not ( = ?auto_43825 ?auto_43826 ) ) ( ON ?auto_43824 ?auto_43825 ) ( ON-TABLE ?auto_43826 ) ( ON ?auto_43823 ?auto_43824 ) ( CLEAR ?auto_43821 ) ( ON ?auto_43822 ?auto_43823 ) ( CLEAR ?auto_43822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43826 ?auto_43825 ?auto_43824 ?auto_43823 )
      ( MAKE-5PILE ?auto_43821 ?auto_43822 ?auto_43823 ?auto_43824 ?auto_43825 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43827 - BLOCK
      ?auto_43828 - BLOCK
      ?auto_43829 - BLOCK
      ?auto_43830 - BLOCK
      ?auto_43831 - BLOCK
    )
    :vars
    (
      ?auto_43832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43827 ?auto_43828 ) ) ( not ( = ?auto_43827 ?auto_43829 ) ) ( not ( = ?auto_43827 ?auto_43830 ) ) ( not ( = ?auto_43827 ?auto_43831 ) ) ( not ( = ?auto_43828 ?auto_43829 ) ) ( not ( = ?auto_43828 ?auto_43830 ) ) ( not ( = ?auto_43828 ?auto_43831 ) ) ( not ( = ?auto_43829 ?auto_43830 ) ) ( not ( = ?auto_43829 ?auto_43831 ) ) ( not ( = ?auto_43830 ?auto_43831 ) ) ( ON ?auto_43831 ?auto_43832 ) ( not ( = ?auto_43827 ?auto_43832 ) ) ( not ( = ?auto_43828 ?auto_43832 ) ) ( not ( = ?auto_43829 ?auto_43832 ) ) ( not ( = ?auto_43830 ?auto_43832 ) ) ( not ( = ?auto_43831 ?auto_43832 ) ) ( ON ?auto_43830 ?auto_43831 ) ( ON-TABLE ?auto_43832 ) ( ON ?auto_43829 ?auto_43830 ) ( ON ?auto_43828 ?auto_43829 ) ( CLEAR ?auto_43828 ) ( HOLDING ?auto_43827 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43827 )
      ( MAKE-5PILE ?auto_43827 ?auto_43828 ?auto_43829 ?auto_43830 ?auto_43831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43833 - BLOCK
      ?auto_43834 - BLOCK
      ?auto_43835 - BLOCK
      ?auto_43836 - BLOCK
      ?auto_43837 - BLOCK
    )
    :vars
    (
      ?auto_43838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43833 ?auto_43834 ) ) ( not ( = ?auto_43833 ?auto_43835 ) ) ( not ( = ?auto_43833 ?auto_43836 ) ) ( not ( = ?auto_43833 ?auto_43837 ) ) ( not ( = ?auto_43834 ?auto_43835 ) ) ( not ( = ?auto_43834 ?auto_43836 ) ) ( not ( = ?auto_43834 ?auto_43837 ) ) ( not ( = ?auto_43835 ?auto_43836 ) ) ( not ( = ?auto_43835 ?auto_43837 ) ) ( not ( = ?auto_43836 ?auto_43837 ) ) ( ON ?auto_43837 ?auto_43838 ) ( not ( = ?auto_43833 ?auto_43838 ) ) ( not ( = ?auto_43834 ?auto_43838 ) ) ( not ( = ?auto_43835 ?auto_43838 ) ) ( not ( = ?auto_43836 ?auto_43838 ) ) ( not ( = ?auto_43837 ?auto_43838 ) ) ( ON ?auto_43836 ?auto_43837 ) ( ON-TABLE ?auto_43838 ) ( ON ?auto_43835 ?auto_43836 ) ( ON ?auto_43834 ?auto_43835 ) ( ON ?auto_43833 ?auto_43834 ) ( CLEAR ?auto_43833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43838 ?auto_43837 ?auto_43836 ?auto_43835 ?auto_43834 )
      ( MAKE-5PILE ?auto_43833 ?auto_43834 ?auto_43835 ?auto_43836 ?auto_43837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43844 - BLOCK
      ?auto_43845 - BLOCK
      ?auto_43846 - BLOCK
      ?auto_43847 - BLOCK
      ?auto_43848 - BLOCK
    )
    :vars
    (
      ?auto_43849 - BLOCK
      ?auto_43850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43844 ?auto_43845 ) ) ( not ( = ?auto_43844 ?auto_43846 ) ) ( not ( = ?auto_43844 ?auto_43847 ) ) ( not ( = ?auto_43844 ?auto_43848 ) ) ( not ( = ?auto_43845 ?auto_43846 ) ) ( not ( = ?auto_43845 ?auto_43847 ) ) ( not ( = ?auto_43845 ?auto_43848 ) ) ( not ( = ?auto_43846 ?auto_43847 ) ) ( not ( = ?auto_43846 ?auto_43848 ) ) ( not ( = ?auto_43847 ?auto_43848 ) ) ( ON ?auto_43848 ?auto_43849 ) ( not ( = ?auto_43844 ?auto_43849 ) ) ( not ( = ?auto_43845 ?auto_43849 ) ) ( not ( = ?auto_43846 ?auto_43849 ) ) ( not ( = ?auto_43847 ?auto_43849 ) ) ( not ( = ?auto_43848 ?auto_43849 ) ) ( ON ?auto_43847 ?auto_43848 ) ( ON-TABLE ?auto_43849 ) ( ON ?auto_43846 ?auto_43847 ) ( ON ?auto_43845 ?auto_43846 ) ( CLEAR ?auto_43845 ) ( ON ?auto_43844 ?auto_43850 ) ( CLEAR ?auto_43844 ) ( HAND-EMPTY ) ( not ( = ?auto_43844 ?auto_43850 ) ) ( not ( = ?auto_43845 ?auto_43850 ) ) ( not ( = ?auto_43846 ?auto_43850 ) ) ( not ( = ?auto_43847 ?auto_43850 ) ) ( not ( = ?auto_43848 ?auto_43850 ) ) ( not ( = ?auto_43849 ?auto_43850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_43844 ?auto_43850 )
      ( MAKE-5PILE ?auto_43844 ?auto_43845 ?auto_43846 ?auto_43847 ?auto_43848 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43851 - BLOCK
      ?auto_43852 - BLOCK
      ?auto_43853 - BLOCK
      ?auto_43854 - BLOCK
      ?auto_43855 - BLOCK
    )
    :vars
    (
      ?auto_43857 - BLOCK
      ?auto_43856 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43851 ?auto_43852 ) ) ( not ( = ?auto_43851 ?auto_43853 ) ) ( not ( = ?auto_43851 ?auto_43854 ) ) ( not ( = ?auto_43851 ?auto_43855 ) ) ( not ( = ?auto_43852 ?auto_43853 ) ) ( not ( = ?auto_43852 ?auto_43854 ) ) ( not ( = ?auto_43852 ?auto_43855 ) ) ( not ( = ?auto_43853 ?auto_43854 ) ) ( not ( = ?auto_43853 ?auto_43855 ) ) ( not ( = ?auto_43854 ?auto_43855 ) ) ( ON ?auto_43855 ?auto_43857 ) ( not ( = ?auto_43851 ?auto_43857 ) ) ( not ( = ?auto_43852 ?auto_43857 ) ) ( not ( = ?auto_43853 ?auto_43857 ) ) ( not ( = ?auto_43854 ?auto_43857 ) ) ( not ( = ?auto_43855 ?auto_43857 ) ) ( ON ?auto_43854 ?auto_43855 ) ( ON-TABLE ?auto_43857 ) ( ON ?auto_43853 ?auto_43854 ) ( ON ?auto_43851 ?auto_43856 ) ( CLEAR ?auto_43851 ) ( not ( = ?auto_43851 ?auto_43856 ) ) ( not ( = ?auto_43852 ?auto_43856 ) ) ( not ( = ?auto_43853 ?auto_43856 ) ) ( not ( = ?auto_43854 ?auto_43856 ) ) ( not ( = ?auto_43855 ?auto_43856 ) ) ( not ( = ?auto_43857 ?auto_43856 ) ) ( HOLDING ?auto_43852 ) ( CLEAR ?auto_43853 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43857 ?auto_43855 ?auto_43854 ?auto_43853 ?auto_43852 )
      ( MAKE-5PILE ?auto_43851 ?auto_43852 ?auto_43853 ?auto_43854 ?auto_43855 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43858 - BLOCK
      ?auto_43859 - BLOCK
      ?auto_43860 - BLOCK
      ?auto_43861 - BLOCK
      ?auto_43862 - BLOCK
    )
    :vars
    (
      ?auto_43863 - BLOCK
      ?auto_43864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43858 ?auto_43859 ) ) ( not ( = ?auto_43858 ?auto_43860 ) ) ( not ( = ?auto_43858 ?auto_43861 ) ) ( not ( = ?auto_43858 ?auto_43862 ) ) ( not ( = ?auto_43859 ?auto_43860 ) ) ( not ( = ?auto_43859 ?auto_43861 ) ) ( not ( = ?auto_43859 ?auto_43862 ) ) ( not ( = ?auto_43860 ?auto_43861 ) ) ( not ( = ?auto_43860 ?auto_43862 ) ) ( not ( = ?auto_43861 ?auto_43862 ) ) ( ON ?auto_43862 ?auto_43863 ) ( not ( = ?auto_43858 ?auto_43863 ) ) ( not ( = ?auto_43859 ?auto_43863 ) ) ( not ( = ?auto_43860 ?auto_43863 ) ) ( not ( = ?auto_43861 ?auto_43863 ) ) ( not ( = ?auto_43862 ?auto_43863 ) ) ( ON ?auto_43861 ?auto_43862 ) ( ON-TABLE ?auto_43863 ) ( ON ?auto_43860 ?auto_43861 ) ( ON ?auto_43858 ?auto_43864 ) ( not ( = ?auto_43858 ?auto_43864 ) ) ( not ( = ?auto_43859 ?auto_43864 ) ) ( not ( = ?auto_43860 ?auto_43864 ) ) ( not ( = ?auto_43861 ?auto_43864 ) ) ( not ( = ?auto_43862 ?auto_43864 ) ) ( not ( = ?auto_43863 ?auto_43864 ) ) ( CLEAR ?auto_43860 ) ( ON ?auto_43859 ?auto_43858 ) ( CLEAR ?auto_43859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43864 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43864 ?auto_43858 )
      ( MAKE-5PILE ?auto_43858 ?auto_43859 ?auto_43860 ?auto_43861 ?auto_43862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43865 - BLOCK
      ?auto_43866 - BLOCK
      ?auto_43867 - BLOCK
      ?auto_43868 - BLOCK
      ?auto_43869 - BLOCK
    )
    :vars
    (
      ?auto_43870 - BLOCK
      ?auto_43871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43865 ?auto_43866 ) ) ( not ( = ?auto_43865 ?auto_43867 ) ) ( not ( = ?auto_43865 ?auto_43868 ) ) ( not ( = ?auto_43865 ?auto_43869 ) ) ( not ( = ?auto_43866 ?auto_43867 ) ) ( not ( = ?auto_43866 ?auto_43868 ) ) ( not ( = ?auto_43866 ?auto_43869 ) ) ( not ( = ?auto_43867 ?auto_43868 ) ) ( not ( = ?auto_43867 ?auto_43869 ) ) ( not ( = ?auto_43868 ?auto_43869 ) ) ( ON ?auto_43869 ?auto_43870 ) ( not ( = ?auto_43865 ?auto_43870 ) ) ( not ( = ?auto_43866 ?auto_43870 ) ) ( not ( = ?auto_43867 ?auto_43870 ) ) ( not ( = ?auto_43868 ?auto_43870 ) ) ( not ( = ?auto_43869 ?auto_43870 ) ) ( ON ?auto_43868 ?auto_43869 ) ( ON-TABLE ?auto_43870 ) ( ON ?auto_43865 ?auto_43871 ) ( not ( = ?auto_43865 ?auto_43871 ) ) ( not ( = ?auto_43866 ?auto_43871 ) ) ( not ( = ?auto_43867 ?auto_43871 ) ) ( not ( = ?auto_43868 ?auto_43871 ) ) ( not ( = ?auto_43869 ?auto_43871 ) ) ( not ( = ?auto_43870 ?auto_43871 ) ) ( ON ?auto_43866 ?auto_43865 ) ( CLEAR ?auto_43866 ) ( ON-TABLE ?auto_43871 ) ( HOLDING ?auto_43867 ) ( CLEAR ?auto_43868 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43870 ?auto_43869 ?auto_43868 ?auto_43867 )
      ( MAKE-5PILE ?auto_43865 ?auto_43866 ?auto_43867 ?auto_43868 ?auto_43869 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43872 - BLOCK
      ?auto_43873 - BLOCK
      ?auto_43874 - BLOCK
      ?auto_43875 - BLOCK
      ?auto_43876 - BLOCK
    )
    :vars
    (
      ?auto_43878 - BLOCK
      ?auto_43877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43872 ?auto_43873 ) ) ( not ( = ?auto_43872 ?auto_43874 ) ) ( not ( = ?auto_43872 ?auto_43875 ) ) ( not ( = ?auto_43872 ?auto_43876 ) ) ( not ( = ?auto_43873 ?auto_43874 ) ) ( not ( = ?auto_43873 ?auto_43875 ) ) ( not ( = ?auto_43873 ?auto_43876 ) ) ( not ( = ?auto_43874 ?auto_43875 ) ) ( not ( = ?auto_43874 ?auto_43876 ) ) ( not ( = ?auto_43875 ?auto_43876 ) ) ( ON ?auto_43876 ?auto_43878 ) ( not ( = ?auto_43872 ?auto_43878 ) ) ( not ( = ?auto_43873 ?auto_43878 ) ) ( not ( = ?auto_43874 ?auto_43878 ) ) ( not ( = ?auto_43875 ?auto_43878 ) ) ( not ( = ?auto_43876 ?auto_43878 ) ) ( ON ?auto_43875 ?auto_43876 ) ( ON-TABLE ?auto_43878 ) ( ON ?auto_43872 ?auto_43877 ) ( not ( = ?auto_43872 ?auto_43877 ) ) ( not ( = ?auto_43873 ?auto_43877 ) ) ( not ( = ?auto_43874 ?auto_43877 ) ) ( not ( = ?auto_43875 ?auto_43877 ) ) ( not ( = ?auto_43876 ?auto_43877 ) ) ( not ( = ?auto_43878 ?auto_43877 ) ) ( ON ?auto_43873 ?auto_43872 ) ( ON-TABLE ?auto_43877 ) ( CLEAR ?auto_43875 ) ( ON ?auto_43874 ?auto_43873 ) ( CLEAR ?auto_43874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43877 ?auto_43872 ?auto_43873 )
      ( MAKE-5PILE ?auto_43872 ?auto_43873 ?auto_43874 ?auto_43875 ?auto_43876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43879 - BLOCK
      ?auto_43880 - BLOCK
      ?auto_43881 - BLOCK
      ?auto_43882 - BLOCK
      ?auto_43883 - BLOCK
    )
    :vars
    (
      ?auto_43884 - BLOCK
      ?auto_43885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43879 ?auto_43880 ) ) ( not ( = ?auto_43879 ?auto_43881 ) ) ( not ( = ?auto_43879 ?auto_43882 ) ) ( not ( = ?auto_43879 ?auto_43883 ) ) ( not ( = ?auto_43880 ?auto_43881 ) ) ( not ( = ?auto_43880 ?auto_43882 ) ) ( not ( = ?auto_43880 ?auto_43883 ) ) ( not ( = ?auto_43881 ?auto_43882 ) ) ( not ( = ?auto_43881 ?auto_43883 ) ) ( not ( = ?auto_43882 ?auto_43883 ) ) ( ON ?auto_43883 ?auto_43884 ) ( not ( = ?auto_43879 ?auto_43884 ) ) ( not ( = ?auto_43880 ?auto_43884 ) ) ( not ( = ?auto_43881 ?auto_43884 ) ) ( not ( = ?auto_43882 ?auto_43884 ) ) ( not ( = ?auto_43883 ?auto_43884 ) ) ( ON-TABLE ?auto_43884 ) ( ON ?auto_43879 ?auto_43885 ) ( not ( = ?auto_43879 ?auto_43885 ) ) ( not ( = ?auto_43880 ?auto_43885 ) ) ( not ( = ?auto_43881 ?auto_43885 ) ) ( not ( = ?auto_43882 ?auto_43885 ) ) ( not ( = ?auto_43883 ?auto_43885 ) ) ( not ( = ?auto_43884 ?auto_43885 ) ) ( ON ?auto_43880 ?auto_43879 ) ( ON-TABLE ?auto_43885 ) ( ON ?auto_43881 ?auto_43880 ) ( CLEAR ?auto_43881 ) ( HOLDING ?auto_43882 ) ( CLEAR ?auto_43883 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43884 ?auto_43883 ?auto_43882 )
      ( MAKE-5PILE ?auto_43879 ?auto_43880 ?auto_43881 ?auto_43882 ?auto_43883 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43886 - BLOCK
      ?auto_43887 - BLOCK
      ?auto_43888 - BLOCK
      ?auto_43889 - BLOCK
      ?auto_43890 - BLOCK
    )
    :vars
    (
      ?auto_43891 - BLOCK
      ?auto_43892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43886 ?auto_43887 ) ) ( not ( = ?auto_43886 ?auto_43888 ) ) ( not ( = ?auto_43886 ?auto_43889 ) ) ( not ( = ?auto_43886 ?auto_43890 ) ) ( not ( = ?auto_43887 ?auto_43888 ) ) ( not ( = ?auto_43887 ?auto_43889 ) ) ( not ( = ?auto_43887 ?auto_43890 ) ) ( not ( = ?auto_43888 ?auto_43889 ) ) ( not ( = ?auto_43888 ?auto_43890 ) ) ( not ( = ?auto_43889 ?auto_43890 ) ) ( ON ?auto_43890 ?auto_43891 ) ( not ( = ?auto_43886 ?auto_43891 ) ) ( not ( = ?auto_43887 ?auto_43891 ) ) ( not ( = ?auto_43888 ?auto_43891 ) ) ( not ( = ?auto_43889 ?auto_43891 ) ) ( not ( = ?auto_43890 ?auto_43891 ) ) ( ON-TABLE ?auto_43891 ) ( ON ?auto_43886 ?auto_43892 ) ( not ( = ?auto_43886 ?auto_43892 ) ) ( not ( = ?auto_43887 ?auto_43892 ) ) ( not ( = ?auto_43888 ?auto_43892 ) ) ( not ( = ?auto_43889 ?auto_43892 ) ) ( not ( = ?auto_43890 ?auto_43892 ) ) ( not ( = ?auto_43891 ?auto_43892 ) ) ( ON ?auto_43887 ?auto_43886 ) ( ON-TABLE ?auto_43892 ) ( ON ?auto_43888 ?auto_43887 ) ( CLEAR ?auto_43890 ) ( ON ?auto_43889 ?auto_43888 ) ( CLEAR ?auto_43889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43892 ?auto_43886 ?auto_43887 ?auto_43888 )
      ( MAKE-5PILE ?auto_43886 ?auto_43887 ?auto_43888 ?auto_43889 ?auto_43890 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43893 - BLOCK
      ?auto_43894 - BLOCK
      ?auto_43895 - BLOCK
      ?auto_43896 - BLOCK
      ?auto_43897 - BLOCK
    )
    :vars
    (
      ?auto_43899 - BLOCK
      ?auto_43898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43893 ?auto_43894 ) ) ( not ( = ?auto_43893 ?auto_43895 ) ) ( not ( = ?auto_43893 ?auto_43896 ) ) ( not ( = ?auto_43893 ?auto_43897 ) ) ( not ( = ?auto_43894 ?auto_43895 ) ) ( not ( = ?auto_43894 ?auto_43896 ) ) ( not ( = ?auto_43894 ?auto_43897 ) ) ( not ( = ?auto_43895 ?auto_43896 ) ) ( not ( = ?auto_43895 ?auto_43897 ) ) ( not ( = ?auto_43896 ?auto_43897 ) ) ( not ( = ?auto_43893 ?auto_43899 ) ) ( not ( = ?auto_43894 ?auto_43899 ) ) ( not ( = ?auto_43895 ?auto_43899 ) ) ( not ( = ?auto_43896 ?auto_43899 ) ) ( not ( = ?auto_43897 ?auto_43899 ) ) ( ON-TABLE ?auto_43899 ) ( ON ?auto_43893 ?auto_43898 ) ( not ( = ?auto_43893 ?auto_43898 ) ) ( not ( = ?auto_43894 ?auto_43898 ) ) ( not ( = ?auto_43895 ?auto_43898 ) ) ( not ( = ?auto_43896 ?auto_43898 ) ) ( not ( = ?auto_43897 ?auto_43898 ) ) ( not ( = ?auto_43899 ?auto_43898 ) ) ( ON ?auto_43894 ?auto_43893 ) ( ON-TABLE ?auto_43898 ) ( ON ?auto_43895 ?auto_43894 ) ( ON ?auto_43896 ?auto_43895 ) ( CLEAR ?auto_43896 ) ( HOLDING ?auto_43897 ) ( CLEAR ?auto_43899 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43899 ?auto_43897 )
      ( MAKE-5PILE ?auto_43893 ?auto_43894 ?auto_43895 ?auto_43896 ?auto_43897 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43900 - BLOCK
      ?auto_43901 - BLOCK
      ?auto_43902 - BLOCK
      ?auto_43903 - BLOCK
      ?auto_43904 - BLOCK
    )
    :vars
    (
      ?auto_43905 - BLOCK
      ?auto_43906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43900 ?auto_43901 ) ) ( not ( = ?auto_43900 ?auto_43902 ) ) ( not ( = ?auto_43900 ?auto_43903 ) ) ( not ( = ?auto_43900 ?auto_43904 ) ) ( not ( = ?auto_43901 ?auto_43902 ) ) ( not ( = ?auto_43901 ?auto_43903 ) ) ( not ( = ?auto_43901 ?auto_43904 ) ) ( not ( = ?auto_43902 ?auto_43903 ) ) ( not ( = ?auto_43902 ?auto_43904 ) ) ( not ( = ?auto_43903 ?auto_43904 ) ) ( not ( = ?auto_43900 ?auto_43905 ) ) ( not ( = ?auto_43901 ?auto_43905 ) ) ( not ( = ?auto_43902 ?auto_43905 ) ) ( not ( = ?auto_43903 ?auto_43905 ) ) ( not ( = ?auto_43904 ?auto_43905 ) ) ( ON-TABLE ?auto_43905 ) ( ON ?auto_43900 ?auto_43906 ) ( not ( = ?auto_43900 ?auto_43906 ) ) ( not ( = ?auto_43901 ?auto_43906 ) ) ( not ( = ?auto_43902 ?auto_43906 ) ) ( not ( = ?auto_43903 ?auto_43906 ) ) ( not ( = ?auto_43904 ?auto_43906 ) ) ( not ( = ?auto_43905 ?auto_43906 ) ) ( ON ?auto_43901 ?auto_43900 ) ( ON-TABLE ?auto_43906 ) ( ON ?auto_43902 ?auto_43901 ) ( ON ?auto_43903 ?auto_43902 ) ( CLEAR ?auto_43905 ) ( ON ?auto_43904 ?auto_43903 ) ( CLEAR ?auto_43904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43906 ?auto_43900 ?auto_43901 ?auto_43902 ?auto_43903 )
      ( MAKE-5PILE ?auto_43900 ?auto_43901 ?auto_43902 ?auto_43903 ?auto_43904 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43907 - BLOCK
      ?auto_43908 - BLOCK
      ?auto_43909 - BLOCK
      ?auto_43910 - BLOCK
      ?auto_43911 - BLOCK
    )
    :vars
    (
      ?auto_43912 - BLOCK
      ?auto_43913 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43907 ?auto_43908 ) ) ( not ( = ?auto_43907 ?auto_43909 ) ) ( not ( = ?auto_43907 ?auto_43910 ) ) ( not ( = ?auto_43907 ?auto_43911 ) ) ( not ( = ?auto_43908 ?auto_43909 ) ) ( not ( = ?auto_43908 ?auto_43910 ) ) ( not ( = ?auto_43908 ?auto_43911 ) ) ( not ( = ?auto_43909 ?auto_43910 ) ) ( not ( = ?auto_43909 ?auto_43911 ) ) ( not ( = ?auto_43910 ?auto_43911 ) ) ( not ( = ?auto_43907 ?auto_43912 ) ) ( not ( = ?auto_43908 ?auto_43912 ) ) ( not ( = ?auto_43909 ?auto_43912 ) ) ( not ( = ?auto_43910 ?auto_43912 ) ) ( not ( = ?auto_43911 ?auto_43912 ) ) ( ON ?auto_43907 ?auto_43913 ) ( not ( = ?auto_43907 ?auto_43913 ) ) ( not ( = ?auto_43908 ?auto_43913 ) ) ( not ( = ?auto_43909 ?auto_43913 ) ) ( not ( = ?auto_43910 ?auto_43913 ) ) ( not ( = ?auto_43911 ?auto_43913 ) ) ( not ( = ?auto_43912 ?auto_43913 ) ) ( ON ?auto_43908 ?auto_43907 ) ( ON-TABLE ?auto_43913 ) ( ON ?auto_43909 ?auto_43908 ) ( ON ?auto_43910 ?auto_43909 ) ( ON ?auto_43911 ?auto_43910 ) ( CLEAR ?auto_43911 ) ( HOLDING ?auto_43912 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43912 )
      ( MAKE-5PILE ?auto_43907 ?auto_43908 ?auto_43909 ?auto_43910 ?auto_43911 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_43914 - BLOCK
      ?auto_43915 - BLOCK
      ?auto_43916 - BLOCK
      ?auto_43917 - BLOCK
      ?auto_43918 - BLOCK
    )
    :vars
    (
      ?auto_43919 - BLOCK
      ?auto_43920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43914 ?auto_43915 ) ) ( not ( = ?auto_43914 ?auto_43916 ) ) ( not ( = ?auto_43914 ?auto_43917 ) ) ( not ( = ?auto_43914 ?auto_43918 ) ) ( not ( = ?auto_43915 ?auto_43916 ) ) ( not ( = ?auto_43915 ?auto_43917 ) ) ( not ( = ?auto_43915 ?auto_43918 ) ) ( not ( = ?auto_43916 ?auto_43917 ) ) ( not ( = ?auto_43916 ?auto_43918 ) ) ( not ( = ?auto_43917 ?auto_43918 ) ) ( not ( = ?auto_43914 ?auto_43919 ) ) ( not ( = ?auto_43915 ?auto_43919 ) ) ( not ( = ?auto_43916 ?auto_43919 ) ) ( not ( = ?auto_43917 ?auto_43919 ) ) ( not ( = ?auto_43918 ?auto_43919 ) ) ( ON ?auto_43914 ?auto_43920 ) ( not ( = ?auto_43914 ?auto_43920 ) ) ( not ( = ?auto_43915 ?auto_43920 ) ) ( not ( = ?auto_43916 ?auto_43920 ) ) ( not ( = ?auto_43917 ?auto_43920 ) ) ( not ( = ?auto_43918 ?auto_43920 ) ) ( not ( = ?auto_43919 ?auto_43920 ) ) ( ON ?auto_43915 ?auto_43914 ) ( ON-TABLE ?auto_43920 ) ( ON ?auto_43916 ?auto_43915 ) ( ON ?auto_43917 ?auto_43916 ) ( ON ?auto_43918 ?auto_43917 ) ( ON ?auto_43919 ?auto_43918 ) ( CLEAR ?auto_43919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_43920 ?auto_43914 ?auto_43915 ?auto_43916 ?auto_43917 ?auto_43918 )
      ( MAKE-5PILE ?auto_43914 ?auto_43915 ?auto_43916 ?auto_43917 ?auto_43918 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43933 - BLOCK
      ?auto_43934 - BLOCK
      ?auto_43935 - BLOCK
      ?auto_43936 - BLOCK
      ?auto_43937 - BLOCK
      ?auto_43938 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_43937 ) ( ON-TABLE ?auto_43933 ) ( ON ?auto_43934 ?auto_43933 ) ( ON ?auto_43935 ?auto_43934 ) ( ON ?auto_43936 ?auto_43935 ) ( ON ?auto_43937 ?auto_43936 ) ( not ( = ?auto_43933 ?auto_43934 ) ) ( not ( = ?auto_43933 ?auto_43935 ) ) ( not ( = ?auto_43933 ?auto_43936 ) ) ( not ( = ?auto_43933 ?auto_43937 ) ) ( not ( = ?auto_43933 ?auto_43938 ) ) ( not ( = ?auto_43934 ?auto_43935 ) ) ( not ( = ?auto_43934 ?auto_43936 ) ) ( not ( = ?auto_43934 ?auto_43937 ) ) ( not ( = ?auto_43934 ?auto_43938 ) ) ( not ( = ?auto_43935 ?auto_43936 ) ) ( not ( = ?auto_43935 ?auto_43937 ) ) ( not ( = ?auto_43935 ?auto_43938 ) ) ( not ( = ?auto_43936 ?auto_43937 ) ) ( not ( = ?auto_43936 ?auto_43938 ) ) ( not ( = ?auto_43937 ?auto_43938 ) ) ( ON-TABLE ?auto_43938 ) ( CLEAR ?auto_43938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_43938 )
      ( MAKE-6PILE ?auto_43933 ?auto_43934 ?auto_43935 ?auto_43936 ?auto_43937 ?auto_43938 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43939 - BLOCK
      ?auto_43940 - BLOCK
      ?auto_43941 - BLOCK
      ?auto_43942 - BLOCK
      ?auto_43943 - BLOCK
      ?auto_43944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43939 ) ( ON ?auto_43940 ?auto_43939 ) ( ON ?auto_43941 ?auto_43940 ) ( ON ?auto_43942 ?auto_43941 ) ( not ( = ?auto_43939 ?auto_43940 ) ) ( not ( = ?auto_43939 ?auto_43941 ) ) ( not ( = ?auto_43939 ?auto_43942 ) ) ( not ( = ?auto_43939 ?auto_43943 ) ) ( not ( = ?auto_43939 ?auto_43944 ) ) ( not ( = ?auto_43940 ?auto_43941 ) ) ( not ( = ?auto_43940 ?auto_43942 ) ) ( not ( = ?auto_43940 ?auto_43943 ) ) ( not ( = ?auto_43940 ?auto_43944 ) ) ( not ( = ?auto_43941 ?auto_43942 ) ) ( not ( = ?auto_43941 ?auto_43943 ) ) ( not ( = ?auto_43941 ?auto_43944 ) ) ( not ( = ?auto_43942 ?auto_43943 ) ) ( not ( = ?auto_43942 ?auto_43944 ) ) ( not ( = ?auto_43943 ?auto_43944 ) ) ( ON-TABLE ?auto_43944 ) ( CLEAR ?auto_43944 ) ( HOLDING ?auto_43943 ) ( CLEAR ?auto_43942 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43939 ?auto_43940 ?auto_43941 ?auto_43942 ?auto_43943 )
      ( MAKE-6PILE ?auto_43939 ?auto_43940 ?auto_43941 ?auto_43942 ?auto_43943 ?auto_43944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43945 - BLOCK
      ?auto_43946 - BLOCK
      ?auto_43947 - BLOCK
      ?auto_43948 - BLOCK
      ?auto_43949 - BLOCK
      ?auto_43950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43945 ) ( ON ?auto_43946 ?auto_43945 ) ( ON ?auto_43947 ?auto_43946 ) ( ON ?auto_43948 ?auto_43947 ) ( not ( = ?auto_43945 ?auto_43946 ) ) ( not ( = ?auto_43945 ?auto_43947 ) ) ( not ( = ?auto_43945 ?auto_43948 ) ) ( not ( = ?auto_43945 ?auto_43949 ) ) ( not ( = ?auto_43945 ?auto_43950 ) ) ( not ( = ?auto_43946 ?auto_43947 ) ) ( not ( = ?auto_43946 ?auto_43948 ) ) ( not ( = ?auto_43946 ?auto_43949 ) ) ( not ( = ?auto_43946 ?auto_43950 ) ) ( not ( = ?auto_43947 ?auto_43948 ) ) ( not ( = ?auto_43947 ?auto_43949 ) ) ( not ( = ?auto_43947 ?auto_43950 ) ) ( not ( = ?auto_43948 ?auto_43949 ) ) ( not ( = ?auto_43948 ?auto_43950 ) ) ( not ( = ?auto_43949 ?auto_43950 ) ) ( ON-TABLE ?auto_43950 ) ( CLEAR ?auto_43948 ) ( ON ?auto_43949 ?auto_43950 ) ( CLEAR ?auto_43949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43950 )
      ( MAKE-6PILE ?auto_43945 ?auto_43946 ?auto_43947 ?auto_43948 ?auto_43949 ?auto_43950 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43951 - BLOCK
      ?auto_43952 - BLOCK
      ?auto_43953 - BLOCK
      ?auto_43954 - BLOCK
      ?auto_43955 - BLOCK
      ?auto_43956 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43951 ) ( ON ?auto_43952 ?auto_43951 ) ( ON ?auto_43953 ?auto_43952 ) ( not ( = ?auto_43951 ?auto_43952 ) ) ( not ( = ?auto_43951 ?auto_43953 ) ) ( not ( = ?auto_43951 ?auto_43954 ) ) ( not ( = ?auto_43951 ?auto_43955 ) ) ( not ( = ?auto_43951 ?auto_43956 ) ) ( not ( = ?auto_43952 ?auto_43953 ) ) ( not ( = ?auto_43952 ?auto_43954 ) ) ( not ( = ?auto_43952 ?auto_43955 ) ) ( not ( = ?auto_43952 ?auto_43956 ) ) ( not ( = ?auto_43953 ?auto_43954 ) ) ( not ( = ?auto_43953 ?auto_43955 ) ) ( not ( = ?auto_43953 ?auto_43956 ) ) ( not ( = ?auto_43954 ?auto_43955 ) ) ( not ( = ?auto_43954 ?auto_43956 ) ) ( not ( = ?auto_43955 ?auto_43956 ) ) ( ON-TABLE ?auto_43956 ) ( ON ?auto_43955 ?auto_43956 ) ( CLEAR ?auto_43955 ) ( HOLDING ?auto_43954 ) ( CLEAR ?auto_43953 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43951 ?auto_43952 ?auto_43953 ?auto_43954 )
      ( MAKE-6PILE ?auto_43951 ?auto_43952 ?auto_43953 ?auto_43954 ?auto_43955 ?auto_43956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43957 - BLOCK
      ?auto_43958 - BLOCK
      ?auto_43959 - BLOCK
      ?auto_43960 - BLOCK
      ?auto_43961 - BLOCK
      ?auto_43962 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43957 ) ( ON ?auto_43958 ?auto_43957 ) ( ON ?auto_43959 ?auto_43958 ) ( not ( = ?auto_43957 ?auto_43958 ) ) ( not ( = ?auto_43957 ?auto_43959 ) ) ( not ( = ?auto_43957 ?auto_43960 ) ) ( not ( = ?auto_43957 ?auto_43961 ) ) ( not ( = ?auto_43957 ?auto_43962 ) ) ( not ( = ?auto_43958 ?auto_43959 ) ) ( not ( = ?auto_43958 ?auto_43960 ) ) ( not ( = ?auto_43958 ?auto_43961 ) ) ( not ( = ?auto_43958 ?auto_43962 ) ) ( not ( = ?auto_43959 ?auto_43960 ) ) ( not ( = ?auto_43959 ?auto_43961 ) ) ( not ( = ?auto_43959 ?auto_43962 ) ) ( not ( = ?auto_43960 ?auto_43961 ) ) ( not ( = ?auto_43960 ?auto_43962 ) ) ( not ( = ?auto_43961 ?auto_43962 ) ) ( ON-TABLE ?auto_43962 ) ( ON ?auto_43961 ?auto_43962 ) ( CLEAR ?auto_43959 ) ( ON ?auto_43960 ?auto_43961 ) ( CLEAR ?auto_43960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43962 ?auto_43961 )
      ( MAKE-6PILE ?auto_43957 ?auto_43958 ?auto_43959 ?auto_43960 ?auto_43961 ?auto_43962 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43963 - BLOCK
      ?auto_43964 - BLOCK
      ?auto_43965 - BLOCK
      ?auto_43966 - BLOCK
      ?auto_43967 - BLOCK
      ?auto_43968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43963 ) ( ON ?auto_43964 ?auto_43963 ) ( not ( = ?auto_43963 ?auto_43964 ) ) ( not ( = ?auto_43963 ?auto_43965 ) ) ( not ( = ?auto_43963 ?auto_43966 ) ) ( not ( = ?auto_43963 ?auto_43967 ) ) ( not ( = ?auto_43963 ?auto_43968 ) ) ( not ( = ?auto_43964 ?auto_43965 ) ) ( not ( = ?auto_43964 ?auto_43966 ) ) ( not ( = ?auto_43964 ?auto_43967 ) ) ( not ( = ?auto_43964 ?auto_43968 ) ) ( not ( = ?auto_43965 ?auto_43966 ) ) ( not ( = ?auto_43965 ?auto_43967 ) ) ( not ( = ?auto_43965 ?auto_43968 ) ) ( not ( = ?auto_43966 ?auto_43967 ) ) ( not ( = ?auto_43966 ?auto_43968 ) ) ( not ( = ?auto_43967 ?auto_43968 ) ) ( ON-TABLE ?auto_43968 ) ( ON ?auto_43967 ?auto_43968 ) ( ON ?auto_43966 ?auto_43967 ) ( CLEAR ?auto_43966 ) ( HOLDING ?auto_43965 ) ( CLEAR ?auto_43964 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43963 ?auto_43964 ?auto_43965 )
      ( MAKE-6PILE ?auto_43963 ?auto_43964 ?auto_43965 ?auto_43966 ?auto_43967 ?auto_43968 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43969 - BLOCK
      ?auto_43970 - BLOCK
      ?auto_43971 - BLOCK
      ?auto_43972 - BLOCK
      ?auto_43973 - BLOCK
      ?auto_43974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43969 ) ( ON ?auto_43970 ?auto_43969 ) ( not ( = ?auto_43969 ?auto_43970 ) ) ( not ( = ?auto_43969 ?auto_43971 ) ) ( not ( = ?auto_43969 ?auto_43972 ) ) ( not ( = ?auto_43969 ?auto_43973 ) ) ( not ( = ?auto_43969 ?auto_43974 ) ) ( not ( = ?auto_43970 ?auto_43971 ) ) ( not ( = ?auto_43970 ?auto_43972 ) ) ( not ( = ?auto_43970 ?auto_43973 ) ) ( not ( = ?auto_43970 ?auto_43974 ) ) ( not ( = ?auto_43971 ?auto_43972 ) ) ( not ( = ?auto_43971 ?auto_43973 ) ) ( not ( = ?auto_43971 ?auto_43974 ) ) ( not ( = ?auto_43972 ?auto_43973 ) ) ( not ( = ?auto_43972 ?auto_43974 ) ) ( not ( = ?auto_43973 ?auto_43974 ) ) ( ON-TABLE ?auto_43974 ) ( ON ?auto_43973 ?auto_43974 ) ( ON ?auto_43972 ?auto_43973 ) ( CLEAR ?auto_43970 ) ( ON ?auto_43971 ?auto_43972 ) ( CLEAR ?auto_43971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_43974 ?auto_43973 ?auto_43972 )
      ( MAKE-6PILE ?auto_43969 ?auto_43970 ?auto_43971 ?auto_43972 ?auto_43973 ?auto_43974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43975 - BLOCK
      ?auto_43976 - BLOCK
      ?auto_43977 - BLOCK
      ?auto_43978 - BLOCK
      ?auto_43979 - BLOCK
      ?auto_43980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43975 ) ( not ( = ?auto_43975 ?auto_43976 ) ) ( not ( = ?auto_43975 ?auto_43977 ) ) ( not ( = ?auto_43975 ?auto_43978 ) ) ( not ( = ?auto_43975 ?auto_43979 ) ) ( not ( = ?auto_43975 ?auto_43980 ) ) ( not ( = ?auto_43976 ?auto_43977 ) ) ( not ( = ?auto_43976 ?auto_43978 ) ) ( not ( = ?auto_43976 ?auto_43979 ) ) ( not ( = ?auto_43976 ?auto_43980 ) ) ( not ( = ?auto_43977 ?auto_43978 ) ) ( not ( = ?auto_43977 ?auto_43979 ) ) ( not ( = ?auto_43977 ?auto_43980 ) ) ( not ( = ?auto_43978 ?auto_43979 ) ) ( not ( = ?auto_43978 ?auto_43980 ) ) ( not ( = ?auto_43979 ?auto_43980 ) ) ( ON-TABLE ?auto_43980 ) ( ON ?auto_43979 ?auto_43980 ) ( ON ?auto_43978 ?auto_43979 ) ( ON ?auto_43977 ?auto_43978 ) ( CLEAR ?auto_43977 ) ( HOLDING ?auto_43976 ) ( CLEAR ?auto_43975 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43975 ?auto_43976 )
      ( MAKE-6PILE ?auto_43975 ?auto_43976 ?auto_43977 ?auto_43978 ?auto_43979 ?auto_43980 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43981 - BLOCK
      ?auto_43982 - BLOCK
      ?auto_43983 - BLOCK
      ?auto_43984 - BLOCK
      ?auto_43985 - BLOCK
      ?auto_43986 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_43981 ) ( not ( = ?auto_43981 ?auto_43982 ) ) ( not ( = ?auto_43981 ?auto_43983 ) ) ( not ( = ?auto_43981 ?auto_43984 ) ) ( not ( = ?auto_43981 ?auto_43985 ) ) ( not ( = ?auto_43981 ?auto_43986 ) ) ( not ( = ?auto_43982 ?auto_43983 ) ) ( not ( = ?auto_43982 ?auto_43984 ) ) ( not ( = ?auto_43982 ?auto_43985 ) ) ( not ( = ?auto_43982 ?auto_43986 ) ) ( not ( = ?auto_43983 ?auto_43984 ) ) ( not ( = ?auto_43983 ?auto_43985 ) ) ( not ( = ?auto_43983 ?auto_43986 ) ) ( not ( = ?auto_43984 ?auto_43985 ) ) ( not ( = ?auto_43984 ?auto_43986 ) ) ( not ( = ?auto_43985 ?auto_43986 ) ) ( ON-TABLE ?auto_43986 ) ( ON ?auto_43985 ?auto_43986 ) ( ON ?auto_43984 ?auto_43985 ) ( ON ?auto_43983 ?auto_43984 ) ( CLEAR ?auto_43981 ) ( ON ?auto_43982 ?auto_43983 ) ( CLEAR ?auto_43982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_43986 ?auto_43985 ?auto_43984 ?auto_43983 )
      ( MAKE-6PILE ?auto_43981 ?auto_43982 ?auto_43983 ?auto_43984 ?auto_43985 ?auto_43986 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43987 - BLOCK
      ?auto_43988 - BLOCK
      ?auto_43989 - BLOCK
      ?auto_43990 - BLOCK
      ?auto_43991 - BLOCK
      ?auto_43992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43987 ?auto_43988 ) ) ( not ( = ?auto_43987 ?auto_43989 ) ) ( not ( = ?auto_43987 ?auto_43990 ) ) ( not ( = ?auto_43987 ?auto_43991 ) ) ( not ( = ?auto_43987 ?auto_43992 ) ) ( not ( = ?auto_43988 ?auto_43989 ) ) ( not ( = ?auto_43988 ?auto_43990 ) ) ( not ( = ?auto_43988 ?auto_43991 ) ) ( not ( = ?auto_43988 ?auto_43992 ) ) ( not ( = ?auto_43989 ?auto_43990 ) ) ( not ( = ?auto_43989 ?auto_43991 ) ) ( not ( = ?auto_43989 ?auto_43992 ) ) ( not ( = ?auto_43990 ?auto_43991 ) ) ( not ( = ?auto_43990 ?auto_43992 ) ) ( not ( = ?auto_43991 ?auto_43992 ) ) ( ON-TABLE ?auto_43992 ) ( ON ?auto_43991 ?auto_43992 ) ( ON ?auto_43990 ?auto_43991 ) ( ON ?auto_43989 ?auto_43990 ) ( ON ?auto_43988 ?auto_43989 ) ( CLEAR ?auto_43988 ) ( HOLDING ?auto_43987 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_43987 )
      ( MAKE-6PILE ?auto_43987 ?auto_43988 ?auto_43989 ?auto_43990 ?auto_43991 ?auto_43992 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_43993 - BLOCK
      ?auto_43994 - BLOCK
      ?auto_43995 - BLOCK
      ?auto_43996 - BLOCK
      ?auto_43997 - BLOCK
      ?auto_43998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_43993 ?auto_43994 ) ) ( not ( = ?auto_43993 ?auto_43995 ) ) ( not ( = ?auto_43993 ?auto_43996 ) ) ( not ( = ?auto_43993 ?auto_43997 ) ) ( not ( = ?auto_43993 ?auto_43998 ) ) ( not ( = ?auto_43994 ?auto_43995 ) ) ( not ( = ?auto_43994 ?auto_43996 ) ) ( not ( = ?auto_43994 ?auto_43997 ) ) ( not ( = ?auto_43994 ?auto_43998 ) ) ( not ( = ?auto_43995 ?auto_43996 ) ) ( not ( = ?auto_43995 ?auto_43997 ) ) ( not ( = ?auto_43995 ?auto_43998 ) ) ( not ( = ?auto_43996 ?auto_43997 ) ) ( not ( = ?auto_43996 ?auto_43998 ) ) ( not ( = ?auto_43997 ?auto_43998 ) ) ( ON-TABLE ?auto_43998 ) ( ON ?auto_43997 ?auto_43998 ) ( ON ?auto_43996 ?auto_43997 ) ( ON ?auto_43995 ?auto_43996 ) ( ON ?auto_43994 ?auto_43995 ) ( ON ?auto_43993 ?auto_43994 ) ( CLEAR ?auto_43993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_43998 ?auto_43997 ?auto_43996 ?auto_43995 ?auto_43994 )
      ( MAKE-6PILE ?auto_43993 ?auto_43994 ?auto_43995 ?auto_43996 ?auto_43997 ?auto_43998 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44005 - BLOCK
      ?auto_44006 - BLOCK
      ?auto_44007 - BLOCK
      ?auto_44008 - BLOCK
      ?auto_44009 - BLOCK
      ?auto_44010 - BLOCK
    )
    :vars
    (
      ?auto_44011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44005 ?auto_44006 ) ) ( not ( = ?auto_44005 ?auto_44007 ) ) ( not ( = ?auto_44005 ?auto_44008 ) ) ( not ( = ?auto_44005 ?auto_44009 ) ) ( not ( = ?auto_44005 ?auto_44010 ) ) ( not ( = ?auto_44006 ?auto_44007 ) ) ( not ( = ?auto_44006 ?auto_44008 ) ) ( not ( = ?auto_44006 ?auto_44009 ) ) ( not ( = ?auto_44006 ?auto_44010 ) ) ( not ( = ?auto_44007 ?auto_44008 ) ) ( not ( = ?auto_44007 ?auto_44009 ) ) ( not ( = ?auto_44007 ?auto_44010 ) ) ( not ( = ?auto_44008 ?auto_44009 ) ) ( not ( = ?auto_44008 ?auto_44010 ) ) ( not ( = ?auto_44009 ?auto_44010 ) ) ( ON-TABLE ?auto_44010 ) ( ON ?auto_44009 ?auto_44010 ) ( ON ?auto_44008 ?auto_44009 ) ( ON ?auto_44007 ?auto_44008 ) ( ON ?auto_44006 ?auto_44007 ) ( CLEAR ?auto_44006 ) ( ON ?auto_44005 ?auto_44011 ) ( CLEAR ?auto_44005 ) ( HAND-EMPTY ) ( not ( = ?auto_44005 ?auto_44011 ) ) ( not ( = ?auto_44006 ?auto_44011 ) ) ( not ( = ?auto_44007 ?auto_44011 ) ) ( not ( = ?auto_44008 ?auto_44011 ) ) ( not ( = ?auto_44009 ?auto_44011 ) ) ( not ( = ?auto_44010 ?auto_44011 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_44005 ?auto_44011 )
      ( MAKE-6PILE ?auto_44005 ?auto_44006 ?auto_44007 ?auto_44008 ?auto_44009 ?auto_44010 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44012 - BLOCK
      ?auto_44013 - BLOCK
      ?auto_44014 - BLOCK
      ?auto_44015 - BLOCK
      ?auto_44016 - BLOCK
      ?auto_44017 - BLOCK
    )
    :vars
    (
      ?auto_44018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44012 ?auto_44013 ) ) ( not ( = ?auto_44012 ?auto_44014 ) ) ( not ( = ?auto_44012 ?auto_44015 ) ) ( not ( = ?auto_44012 ?auto_44016 ) ) ( not ( = ?auto_44012 ?auto_44017 ) ) ( not ( = ?auto_44013 ?auto_44014 ) ) ( not ( = ?auto_44013 ?auto_44015 ) ) ( not ( = ?auto_44013 ?auto_44016 ) ) ( not ( = ?auto_44013 ?auto_44017 ) ) ( not ( = ?auto_44014 ?auto_44015 ) ) ( not ( = ?auto_44014 ?auto_44016 ) ) ( not ( = ?auto_44014 ?auto_44017 ) ) ( not ( = ?auto_44015 ?auto_44016 ) ) ( not ( = ?auto_44015 ?auto_44017 ) ) ( not ( = ?auto_44016 ?auto_44017 ) ) ( ON-TABLE ?auto_44017 ) ( ON ?auto_44016 ?auto_44017 ) ( ON ?auto_44015 ?auto_44016 ) ( ON ?auto_44014 ?auto_44015 ) ( ON ?auto_44012 ?auto_44018 ) ( CLEAR ?auto_44012 ) ( not ( = ?auto_44012 ?auto_44018 ) ) ( not ( = ?auto_44013 ?auto_44018 ) ) ( not ( = ?auto_44014 ?auto_44018 ) ) ( not ( = ?auto_44015 ?auto_44018 ) ) ( not ( = ?auto_44016 ?auto_44018 ) ) ( not ( = ?auto_44017 ?auto_44018 ) ) ( HOLDING ?auto_44013 ) ( CLEAR ?auto_44014 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44017 ?auto_44016 ?auto_44015 ?auto_44014 ?auto_44013 )
      ( MAKE-6PILE ?auto_44012 ?auto_44013 ?auto_44014 ?auto_44015 ?auto_44016 ?auto_44017 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44019 - BLOCK
      ?auto_44020 - BLOCK
      ?auto_44021 - BLOCK
      ?auto_44022 - BLOCK
      ?auto_44023 - BLOCK
      ?auto_44024 - BLOCK
    )
    :vars
    (
      ?auto_44025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44019 ?auto_44020 ) ) ( not ( = ?auto_44019 ?auto_44021 ) ) ( not ( = ?auto_44019 ?auto_44022 ) ) ( not ( = ?auto_44019 ?auto_44023 ) ) ( not ( = ?auto_44019 ?auto_44024 ) ) ( not ( = ?auto_44020 ?auto_44021 ) ) ( not ( = ?auto_44020 ?auto_44022 ) ) ( not ( = ?auto_44020 ?auto_44023 ) ) ( not ( = ?auto_44020 ?auto_44024 ) ) ( not ( = ?auto_44021 ?auto_44022 ) ) ( not ( = ?auto_44021 ?auto_44023 ) ) ( not ( = ?auto_44021 ?auto_44024 ) ) ( not ( = ?auto_44022 ?auto_44023 ) ) ( not ( = ?auto_44022 ?auto_44024 ) ) ( not ( = ?auto_44023 ?auto_44024 ) ) ( ON-TABLE ?auto_44024 ) ( ON ?auto_44023 ?auto_44024 ) ( ON ?auto_44022 ?auto_44023 ) ( ON ?auto_44021 ?auto_44022 ) ( ON ?auto_44019 ?auto_44025 ) ( not ( = ?auto_44019 ?auto_44025 ) ) ( not ( = ?auto_44020 ?auto_44025 ) ) ( not ( = ?auto_44021 ?auto_44025 ) ) ( not ( = ?auto_44022 ?auto_44025 ) ) ( not ( = ?auto_44023 ?auto_44025 ) ) ( not ( = ?auto_44024 ?auto_44025 ) ) ( CLEAR ?auto_44021 ) ( ON ?auto_44020 ?auto_44019 ) ( CLEAR ?auto_44020 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_44025 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44025 ?auto_44019 )
      ( MAKE-6PILE ?auto_44019 ?auto_44020 ?auto_44021 ?auto_44022 ?auto_44023 ?auto_44024 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44026 - BLOCK
      ?auto_44027 - BLOCK
      ?auto_44028 - BLOCK
      ?auto_44029 - BLOCK
      ?auto_44030 - BLOCK
      ?auto_44031 - BLOCK
    )
    :vars
    (
      ?auto_44032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44026 ?auto_44027 ) ) ( not ( = ?auto_44026 ?auto_44028 ) ) ( not ( = ?auto_44026 ?auto_44029 ) ) ( not ( = ?auto_44026 ?auto_44030 ) ) ( not ( = ?auto_44026 ?auto_44031 ) ) ( not ( = ?auto_44027 ?auto_44028 ) ) ( not ( = ?auto_44027 ?auto_44029 ) ) ( not ( = ?auto_44027 ?auto_44030 ) ) ( not ( = ?auto_44027 ?auto_44031 ) ) ( not ( = ?auto_44028 ?auto_44029 ) ) ( not ( = ?auto_44028 ?auto_44030 ) ) ( not ( = ?auto_44028 ?auto_44031 ) ) ( not ( = ?auto_44029 ?auto_44030 ) ) ( not ( = ?auto_44029 ?auto_44031 ) ) ( not ( = ?auto_44030 ?auto_44031 ) ) ( ON-TABLE ?auto_44031 ) ( ON ?auto_44030 ?auto_44031 ) ( ON ?auto_44029 ?auto_44030 ) ( ON ?auto_44026 ?auto_44032 ) ( not ( = ?auto_44026 ?auto_44032 ) ) ( not ( = ?auto_44027 ?auto_44032 ) ) ( not ( = ?auto_44028 ?auto_44032 ) ) ( not ( = ?auto_44029 ?auto_44032 ) ) ( not ( = ?auto_44030 ?auto_44032 ) ) ( not ( = ?auto_44031 ?auto_44032 ) ) ( ON ?auto_44027 ?auto_44026 ) ( CLEAR ?auto_44027 ) ( ON-TABLE ?auto_44032 ) ( HOLDING ?auto_44028 ) ( CLEAR ?auto_44029 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44031 ?auto_44030 ?auto_44029 ?auto_44028 )
      ( MAKE-6PILE ?auto_44026 ?auto_44027 ?auto_44028 ?auto_44029 ?auto_44030 ?auto_44031 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44033 - BLOCK
      ?auto_44034 - BLOCK
      ?auto_44035 - BLOCK
      ?auto_44036 - BLOCK
      ?auto_44037 - BLOCK
      ?auto_44038 - BLOCK
    )
    :vars
    (
      ?auto_44039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44033 ?auto_44034 ) ) ( not ( = ?auto_44033 ?auto_44035 ) ) ( not ( = ?auto_44033 ?auto_44036 ) ) ( not ( = ?auto_44033 ?auto_44037 ) ) ( not ( = ?auto_44033 ?auto_44038 ) ) ( not ( = ?auto_44034 ?auto_44035 ) ) ( not ( = ?auto_44034 ?auto_44036 ) ) ( not ( = ?auto_44034 ?auto_44037 ) ) ( not ( = ?auto_44034 ?auto_44038 ) ) ( not ( = ?auto_44035 ?auto_44036 ) ) ( not ( = ?auto_44035 ?auto_44037 ) ) ( not ( = ?auto_44035 ?auto_44038 ) ) ( not ( = ?auto_44036 ?auto_44037 ) ) ( not ( = ?auto_44036 ?auto_44038 ) ) ( not ( = ?auto_44037 ?auto_44038 ) ) ( ON-TABLE ?auto_44038 ) ( ON ?auto_44037 ?auto_44038 ) ( ON ?auto_44036 ?auto_44037 ) ( ON ?auto_44033 ?auto_44039 ) ( not ( = ?auto_44033 ?auto_44039 ) ) ( not ( = ?auto_44034 ?auto_44039 ) ) ( not ( = ?auto_44035 ?auto_44039 ) ) ( not ( = ?auto_44036 ?auto_44039 ) ) ( not ( = ?auto_44037 ?auto_44039 ) ) ( not ( = ?auto_44038 ?auto_44039 ) ) ( ON ?auto_44034 ?auto_44033 ) ( ON-TABLE ?auto_44039 ) ( CLEAR ?auto_44036 ) ( ON ?auto_44035 ?auto_44034 ) ( CLEAR ?auto_44035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44039 ?auto_44033 ?auto_44034 )
      ( MAKE-6PILE ?auto_44033 ?auto_44034 ?auto_44035 ?auto_44036 ?auto_44037 ?auto_44038 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44040 - BLOCK
      ?auto_44041 - BLOCK
      ?auto_44042 - BLOCK
      ?auto_44043 - BLOCK
      ?auto_44044 - BLOCK
      ?auto_44045 - BLOCK
    )
    :vars
    (
      ?auto_44046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44040 ?auto_44041 ) ) ( not ( = ?auto_44040 ?auto_44042 ) ) ( not ( = ?auto_44040 ?auto_44043 ) ) ( not ( = ?auto_44040 ?auto_44044 ) ) ( not ( = ?auto_44040 ?auto_44045 ) ) ( not ( = ?auto_44041 ?auto_44042 ) ) ( not ( = ?auto_44041 ?auto_44043 ) ) ( not ( = ?auto_44041 ?auto_44044 ) ) ( not ( = ?auto_44041 ?auto_44045 ) ) ( not ( = ?auto_44042 ?auto_44043 ) ) ( not ( = ?auto_44042 ?auto_44044 ) ) ( not ( = ?auto_44042 ?auto_44045 ) ) ( not ( = ?auto_44043 ?auto_44044 ) ) ( not ( = ?auto_44043 ?auto_44045 ) ) ( not ( = ?auto_44044 ?auto_44045 ) ) ( ON-TABLE ?auto_44045 ) ( ON ?auto_44044 ?auto_44045 ) ( ON ?auto_44040 ?auto_44046 ) ( not ( = ?auto_44040 ?auto_44046 ) ) ( not ( = ?auto_44041 ?auto_44046 ) ) ( not ( = ?auto_44042 ?auto_44046 ) ) ( not ( = ?auto_44043 ?auto_44046 ) ) ( not ( = ?auto_44044 ?auto_44046 ) ) ( not ( = ?auto_44045 ?auto_44046 ) ) ( ON ?auto_44041 ?auto_44040 ) ( ON-TABLE ?auto_44046 ) ( ON ?auto_44042 ?auto_44041 ) ( CLEAR ?auto_44042 ) ( HOLDING ?auto_44043 ) ( CLEAR ?auto_44044 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_44045 ?auto_44044 ?auto_44043 )
      ( MAKE-6PILE ?auto_44040 ?auto_44041 ?auto_44042 ?auto_44043 ?auto_44044 ?auto_44045 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44047 - BLOCK
      ?auto_44048 - BLOCK
      ?auto_44049 - BLOCK
      ?auto_44050 - BLOCK
      ?auto_44051 - BLOCK
      ?auto_44052 - BLOCK
    )
    :vars
    (
      ?auto_44053 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44047 ?auto_44048 ) ) ( not ( = ?auto_44047 ?auto_44049 ) ) ( not ( = ?auto_44047 ?auto_44050 ) ) ( not ( = ?auto_44047 ?auto_44051 ) ) ( not ( = ?auto_44047 ?auto_44052 ) ) ( not ( = ?auto_44048 ?auto_44049 ) ) ( not ( = ?auto_44048 ?auto_44050 ) ) ( not ( = ?auto_44048 ?auto_44051 ) ) ( not ( = ?auto_44048 ?auto_44052 ) ) ( not ( = ?auto_44049 ?auto_44050 ) ) ( not ( = ?auto_44049 ?auto_44051 ) ) ( not ( = ?auto_44049 ?auto_44052 ) ) ( not ( = ?auto_44050 ?auto_44051 ) ) ( not ( = ?auto_44050 ?auto_44052 ) ) ( not ( = ?auto_44051 ?auto_44052 ) ) ( ON-TABLE ?auto_44052 ) ( ON ?auto_44051 ?auto_44052 ) ( ON ?auto_44047 ?auto_44053 ) ( not ( = ?auto_44047 ?auto_44053 ) ) ( not ( = ?auto_44048 ?auto_44053 ) ) ( not ( = ?auto_44049 ?auto_44053 ) ) ( not ( = ?auto_44050 ?auto_44053 ) ) ( not ( = ?auto_44051 ?auto_44053 ) ) ( not ( = ?auto_44052 ?auto_44053 ) ) ( ON ?auto_44048 ?auto_44047 ) ( ON-TABLE ?auto_44053 ) ( ON ?auto_44049 ?auto_44048 ) ( CLEAR ?auto_44051 ) ( ON ?auto_44050 ?auto_44049 ) ( CLEAR ?auto_44050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_44053 ?auto_44047 ?auto_44048 ?auto_44049 )
      ( MAKE-6PILE ?auto_44047 ?auto_44048 ?auto_44049 ?auto_44050 ?auto_44051 ?auto_44052 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44054 - BLOCK
      ?auto_44055 - BLOCK
      ?auto_44056 - BLOCK
      ?auto_44057 - BLOCK
      ?auto_44058 - BLOCK
      ?auto_44059 - BLOCK
    )
    :vars
    (
      ?auto_44060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44054 ?auto_44055 ) ) ( not ( = ?auto_44054 ?auto_44056 ) ) ( not ( = ?auto_44054 ?auto_44057 ) ) ( not ( = ?auto_44054 ?auto_44058 ) ) ( not ( = ?auto_44054 ?auto_44059 ) ) ( not ( = ?auto_44055 ?auto_44056 ) ) ( not ( = ?auto_44055 ?auto_44057 ) ) ( not ( = ?auto_44055 ?auto_44058 ) ) ( not ( = ?auto_44055 ?auto_44059 ) ) ( not ( = ?auto_44056 ?auto_44057 ) ) ( not ( = ?auto_44056 ?auto_44058 ) ) ( not ( = ?auto_44056 ?auto_44059 ) ) ( not ( = ?auto_44057 ?auto_44058 ) ) ( not ( = ?auto_44057 ?auto_44059 ) ) ( not ( = ?auto_44058 ?auto_44059 ) ) ( ON-TABLE ?auto_44059 ) ( ON ?auto_44054 ?auto_44060 ) ( not ( = ?auto_44054 ?auto_44060 ) ) ( not ( = ?auto_44055 ?auto_44060 ) ) ( not ( = ?auto_44056 ?auto_44060 ) ) ( not ( = ?auto_44057 ?auto_44060 ) ) ( not ( = ?auto_44058 ?auto_44060 ) ) ( not ( = ?auto_44059 ?auto_44060 ) ) ( ON ?auto_44055 ?auto_44054 ) ( ON-TABLE ?auto_44060 ) ( ON ?auto_44056 ?auto_44055 ) ( ON ?auto_44057 ?auto_44056 ) ( CLEAR ?auto_44057 ) ( HOLDING ?auto_44058 ) ( CLEAR ?auto_44059 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_44059 ?auto_44058 )
      ( MAKE-6PILE ?auto_44054 ?auto_44055 ?auto_44056 ?auto_44057 ?auto_44058 ?auto_44059 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44061 - BLOCK
      ?auto_44062 - BLOCK
      ?auto_44063 - BLOCK
      ?auto_44064 - BLOCK
      ?auto_44065 - BLOCK
      ?auto_44066 - BLOCK
    )
    :vars
    (
      ?auto_44067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44061 ?auto_44062 ) ) ( not ( = ?auto_44061 ?auto_44063 ) ) ( not ( = ?auto_44061 ?auto_44064 ) ) ( not ( = ?auto_44061 ?auto_44065 ) ) ( not ( = ?auto_44061 ?auto_44066 ) ) ( not ( = ?auto_44062 ?auto_44063 ) ) ( not ( = ?auto_44062 ?auto_44064 ) ) ( not ( = ?auto_44062 ?auto_44065 ) ) ( not ( = ?auto_44062 ?auto_44066 ) ) ( not ( = ?auto_44063 ?auto_44064 ) ) ( not ( = ?auto_44063 ?auto_44065 ) ) ( not ( = ?auto_44063 ?auto_44066 ) ) ( not ( = ?auto_44064 ?auto_44065 ) ) ( not ( = ?auto_44064 ?auto_44066 ) ) ( not ( = ?auto_44065 ?auto_44066 ) ) ( ON-TABLE ?auto_44066 ) ( ON ?auto_44061 ?auto_44067 ) ( not ( = ?auto_44061 ?auto_44067 ) ) ( not ( = ?auto_44062 ?auto_44067 ) ) ( not ( = ?auto_44063 ?auto_44067 ) ) ( not ( = ?auto_44064 ?auto_44067 ) ) ( not ( = ?auto_44065 ?auto_44067 ) ) ( not ( = ?auto_44066 ?auto_44067 ) ) ( ON ?auto_44062 ?auto_44061 ) ( ON-TABLE ?auto_44067 ) ( ON ?auto_44063 ?auto_44062 ) ( ON ?auto_44064 ?auto_44063 ) ( CLEAR ?auto_44066 ) ( ON ?auto_44065 ?auto_44064 ) ( CLEAR ?auto_44065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_44067 ?auto_44061 ?auto_44062 ?auto_44063 ?auto_44064 )
      ( MAKE-6PILE ?auto_44061 ?auto_44062 ?auto_44063 ?auto_44064 ?auto_44065 ?auto_44066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44068 - BLOCK
      ?auto_44069 - BLOCK
      ?auto_44070 - BLOCK
      ?auto_44071 - BLOCK
      ?auto_44072 - BLOCK
      ?auto_44073 - BLOCK
    )
    :vars
    (
      ?auto_44074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44068 ?auto_44069 ) ) ( not ( = ?auto_44068 ?auto_44070 ) ) ( not ( = ?auto_44068 ?auto_44071 ) ) ( not ( = ?auto_44068 ?auto_44072 ) ) ( not ( = ?auto_44068 ?auto_44073 ) ) ( not ( = ?auto_44069 ?auto_44070 ) ) ( not ( = ?auto_44069 ?auto_44071 ) ) ( not ( = ?auto_44069 ?auto_44072 ) ) ( not ( = ?auto_44069 ?auto_44073 ) ) ( not ( = ?auto_44070 ?auto_44071 ) ) ( not ( = ?auto_44070 ?auto_44072 ) ) ( not ( = ?auto_44070 ?auto_44073 ) ) ( not ( = ?auto_44071 ?auto_44072 ) ) ( not ( = ?auto_44071 ?auto_44073 ) ) ( not ( = ?auto_44072 ?auto_44073 ) ) ( ON ?auto_44068 ?auto_44074 ) ( not ( = ?auto_44068 ?auto_44074 ) ) ( not ( = ?auto_44069 ?auto_44074 ) ) ( not ( = ?auto_44070 ?auto_44074 ) ) ( not ( = ?auto_44071 ?auto_44074 ) ) ( not ( = ?auto_44072 ?auto_44074 ) ) ( not ( = ?auto_44073 ?auto_44074 ) ) ( ON ?auto_44069 ?auto_44068 ) ( ON-TABLE ?auto_44074 ) ( ON ?auto_44070 ?auto_44069 ) ( ON ?auto_44071 ?auto_44070 ) ( ON ?auto_44072 ?auto_44071 ) ( CLEAR ?auto_44072 ) ( HOLDING ?auto_44073 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_44073 )
      ( MAKE-6PILE ?auto_44068 ?auto_44069 ?auto_44070 ?auto_44071 ?auto_44072 ?auto_44073 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_44075 - BLOCK
      ?auto_44076 - BLOCK
      ?auto_44077 - BLOCK
      ?auto_44078 - BLOCK
      ?auto_44079 - BLOCK
      ?auto_44080 - BLOCK
    )
    :vars
    (
      ?auto_44081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_44075 ?auto_44076 ) ) ( not ( = ?auto_44075 ?auto_44077 ) ) ( not ( = ?auto_44075 ?auto_44078 ) ) ( not ( = ?auto_44075 ?auto_44079 ) ) ( not ( = ?auto_44075 ?auto_44080 ) ) ( not ( = ?auto_44076 ?auto_44077 ) ) ( not ( = ?auto_44076 ?auto_44078 ) ) ( not ( = ?auto_44076 ?auto_44079 ) ) ( not ( = ?auto_44076 ?auto_44080 ) ) ( not ( = ?auto_44077 ?auto_44078 ) ) ( not ( = ?auto_44077 ?auto_44079 ) ) ( not ( = ?auto_44077 ?auto_44080 ) ) ( not ( = ?auto_44078 ?auto_44079 ) ) ( not ( = ?auto_44078 ?auto_44080 ) ) ( not ( = ?auto_44079 ?auto_44080 ) ) ( ON ?auto_44075 ?auto_44081 ) ( not ( = ?auto_44075 ?auto_44081 ) ) ( not ( = ?auto_44076 ?auto_44081 ) ) ( not ( = ?auto_44077 ?auto_44081 ) ) ( not ( = ?auto_44078 ?auto_44081 ) ) ( not ( = ?auto_44079 ?auto_44081 ) ) ( not ( = ?auto_44080 ?auto_44081 ) ) ( ON ?auto_44076 ?auto_44075 ) ( ON-TABLE ?auto_44081 ) ( ON ?auto_44077 ?auto_44076 ) ( ON ?auto_44078 ?auto_44077 ) ( ON ?auto_44079 ?auto_44078 ) ( ON ?auto_44080 ?auto_44079 ) ( CLEAR ?auto_44080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_44081 ?auto_44075 ?auto_44076 ?auto_44077 ?auto_44078 ?auto_44079 )
      ( MAKE-6PILE ?auto_44075 ?auto_44076 ?auto_44077 ?auto_44078 ?auto_44079 ?auto_44080 ) )
  )

)

