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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26501 - BLOCK
      ?auto_26502 - BLOCK
      ?auto_26503 - BLOCK
      ?auto_26504 - BLOCK
      ?auto_26505 - BLOCK
    )
    :vars
    (
      ?auto_26506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26506 ?auto_26505 ) ( CLEAR ?auto_26506 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26501 ) ( ON ?auto_26502 ?auto_26501 ) ( ON ?auto_26503 ?auto_26502 ) ( ON ?auto_26504 ?auto_26503 ) ( ON ?auto_26505 ?auto_26504 ) ( not ( = ?auto_26501 ?auto_26502 ) ) ( not ( = ?auto_26501 ?auto_26503 ) ) ( not ( = ?auto_26501 ?auto_26504 ) ) ( not ( = ?auto_26501 ?auto_26505 ) ) ( not ( = ?auto_26501 ?auto_26506 ) ) ( not ( = ?auto_26502 ?auto_26503 ) ) ( not ( = ?auto_26502 ?auto_26504 ) ) ( not ( = ?auto_26502 ?auto_26505 ) ) ( not ( = ?auto_26502 ?auto_26506 ) ) ( not ( = ?auto_26503 ?auto_26504 ) ) ( not ( = ?auto_26503 ?auto_26505 ) ) ( not ( = ?auto_26503 ?auto_26506 ) ) ( not ( = ?auto_26504 ?auto_26505 ) ) ( not ( = ?auto_26504 ?auto_26506 ) ) ( not ( = ?auto_26505 ?auto_26506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26506 ?auto_26505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26508 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26508 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26509 - BLOCK
    )
    :vars
    (
      ?auto_26510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26509 ?auto_26510 ) ( CLEAR ?auto_26509 ) ( HAND-EMPTY ) ( not ( = ?auto_26509 ?auto_26510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26509 ?auto_26510 )
      ( MAKE-1PILE ?auto_26509 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26515 - BLOCK
      ?auto_26516 - BLOCK
      ?auto_26517 - BLOCK
      ?auto_26518 - BLOCK
    )
    :vars
    (
      ?auto_26519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26519 ?auto_26518 ) ( CLEAR ?auto_26519 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26515 ) ( ON ?auto_26516 ?auto_26515 ) ( ON ?auto_26517 ?auto_26516 ) ( ON ?auto_26518 ?auto_26517 ) ( not ( = ?auto_26515 ?auto_26516 ) ) ( not ( = ?auto_26515 ?auto_26517 ) ) ( not ( = ?auto_26515 ?auto_26518 ) ) ( not ( = ?auto_26515 ?auto_26519 ) ) ( not ( = ?auto_26516 ?auto_26517 ) ) ( not ( = ?auto_26516 ?auto_26518 ) ) ( not ( = ?auto_26516 ?auto_26519 ) ) ( not ( = ?auto_26517 ?auto_26518 ) ) ( not ( = ?auto_26517 ?auto_26519 ) ) ( not ( = ?auto_26518 ?auto_26519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26519 ?auto_26518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26520 - BLOCK
      ?auto_26521 - BLOCK
      ?auto_26522 - BLOCK
      ?auto_26523 - BLOCK
    )
    :vars
    (
      ?auto_26524 - BLOCK
      ?auto_26525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26524 ?auto_26523 ) ( CLEAR ?auto_26524 ) ( ON-TABLE ?auto_26520 ) ( ON ?auto_26521 ?auto_26520 ) ( ON ?auto_26522 ?auto_26521 ) ( ON ?auto_26523 ?auto_26522 ) ( not ( = ?auto_26520 ?auto_26521 ) ) ( not ( = ?auto_26520 ?auto_26522 ) ) ( not ( = ?auto_26520 ?auto_26523 ) ) ( not ( = ?auto_26520 ?auto_26524 ) ) ( not ( = ?auto_26521 ?auto_26522 ) ) ( not ( = ?auto_26521 ?auto_26523 ) ) ( not ( = ?auto_26521 ?auto_26524 ) ) ( not ( = ?auto_26522 ?auto_26523 ) ) ( not ( = ?auto_26522 ?auto_26524 ) ) ( not ( = ?auto_26523 ?auto_26524 ) ) ( HOLDING ?auto_26525 ) ( not ( = ?auto_26520 ?auto_26525 ) ) ( not ( = ?auto_26521 ?auto_26525 ) ) ( not ( = ?auto_26522 ?auto_26525 ) ) ( not ( = ?auto_26523 ?auto_26525 ) ) ( not ( = ?auto_26524 ?auto_26525 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26525 )
      ( MAKE-4PILE ?auto_26520 ?auto_26521 ?auto_26522 ?auto_26523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26526 - BLOCK
      ?auto_26527 - BLOCK
      ?auto_26528 - BLOCK
      ?auto_26529 - BLOCK
    )
    :vars
    (
      ?auto_26530 - BLOCK
      ?auto_26531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26530 ?auto_26529 ) ( ON-TABLE ?auto_26526 ) ( ON ?auto_26527 ?auto_26526 ) ( ON ?auto_26528 ?auto_26527 ) ( ON ?auto_26529 ?auto_26528 ) ( not ( = ?auto_26526 ?auto_26527 ) ) ( not ( = ?auto_26526 ?auto_26528 ) ) ( not ( = ?auto_26526 ?auto_26529 ) ) ( not ( = ?auto_26526 ?auto_26530 ) ) ( not ( = ?auto_26527 ?auto_26528 ) ) ( not ( = ?auto_26527 ?auto_26529 ) ) ( not ( = ?auto_26527 ?auto_26530 ) ) ( not ( = ?auto_26528 ?auto_26529 ) ) ( not ( = ?auto_26528 ?auto_26530 ) ) ( not ( = ?auto_26529 ?auto_26530 ) ) ( not ( = ?auto_26526 ?auto_26531 ) ) ( not ( = ?auto_26527 ?auto_26531 ) ) ( not ( = ?auto_26528 ?auto_26531 ) ) ( not ( = ?auto_26529 ?auto_26531 ) ) ( not ( = ?auto_26530 ?auto_26531 ) ) ( ON ?auto_26531 ?auto_26530 ) ( CLEAR ?auto_26531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26526 ?auto_26527 ?auto_26528 ?auto_26529 ?auto_26530 )
      ( MAKE-4PILE ?auto_26526 ?auto_26527 ?auto_26528 ?auto_26529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26534 - BLOCK
      ?auto_26535 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26535 ) ( CLEAR ?auto_26534 ) ( ON-TABLE ?auto_26534 ) ( not ( = ?auto_26534 ?auto_26535 ) ) )
    :subtasks
    ( ( !STACK ?auto_26535 ?auto_26534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26536 - BLOCK
      ?auto_26537 - BLOCK
    )
    :vars
    (
      ?auto_26538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26536 ) ( ON-TABLE ?auto_26536 ) ( not ( = ?auto_26536 ?auto_26537 ) ) ( ON ?auto_26537 ?auto_26538 ) ( CLEAR ?auto_26537 ) ( HAND-EMPTY ) ( not ( = ?auto_26536 ?auto_26538 ) ) ( not ( = ?auto_26537 ?auto_26538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26537 ?auto_26538 )
      ( MAKE-2PILE ?auto_26536 ?auto_26537 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26539 - BLOCK
      ?auto_26540 - BLOCK
    )
    :vars
    (
      ?auto_26541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26539 ?auto_26540 ) ) ( ON ?auto_26540 ?auto_26541 ) ( CLEAR ?auto_26540 ) ( not ( = ?auto_26539 ?auto_26541 ) ) ( not ( = ?auto_26540 ?auto_26541 ) ) ( HOLDING ?auto_26539 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26539 )
      ( MAKE-2PILE ?auto_26539 ?auto_26540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26542 - BLOCK
      ?auto_26543 - BLOCK
    )
    :vars
    (
      ?auto_26544 - BLOCK
      ?auto_26546 - BLOCK
      ?auto_26547 - BLOCK
      ?auto_26545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26542 ?auto_26543 ) ) ( ON ?auto_26543 ?auto_26544 ) ( not ( = ?auto_26542 ?auto_26544 ) ) ( not ( = ?auto_26543 ?auto_26544 ) ) ( ON ?auto_26542 ?auto_26543 ) ( CLEAR ?auto_26542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26546 ) ( ON ?auto_26547 ?auto_26546 ) ( ON ?auto_26545 ?auto_26547 ) ( ON ?auto_26544 ?auto_26545 ) ( not ( = ?auto_26546 ?auto_26547 ) ) ( not ( = ?auto_26546 ?auto_26545 ) ) ( not ( = ?auto_26546 ?auto_26544 ) ) ( not ( = ?auto_26546 ?auto_26543 ) ) ( not ( = ?auto_26546 ?auto_26542 ) ) ( not ( = ?auto_26547 ?auto_26545 ) ) ( not ( = ?auto_26547 ?auto_26544 ) ) ( not ( = ?auto_26547 ?auto_26543 ) ) ( not ( = ?auto_26547 ?auto_26542 ) ) ( not ( = ?auto_26545 ?auto_26544 ) ) ( not ( = ?auto_26545 ?auto_26543 ) ) ( not ( = ?auto_26545 ?auto_26542 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26546 ?auto_26547 ?auto_26545 ?auto_26544 ?auto_26543 )
      ( MAKE-2PILE ?auto_26542 ?auto_26543 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26551 - BLOCK
      ?auto_26552 - BLOCK
      ?auto_26553 - BLOCK
    )
    :vars
    (
      ?auto_26554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26554 ?auto_26553 ) ( CLEAR ?auto_26554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26551 ) ( ON ?auto_26552 ?auto_26551 ) ( ON ?auto_26553 ?auto_26552 ) ( not ( = ?auto_26551 ?auto_26552 ) ) ( not ( = ?auto_26551 ?auto_26553 ) ) ( not ( = ?auto_26551 ?auto_26554 ) ) ( not ( = ?auto_26552 ?auto_26553 ) ) ( not ( = ?auto_26552 ?auto_26554 ) ) ( not ( = ?auto_26553 ?auto_26554 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26554 ?auto_26553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26555 - BLOCK
      ?auto_26556 - BLOCK
      ?auto_26557 - BLOCK
    )
    :vars
    (
      ?auto_26558 - BLOCK
      ?auto_26559 - BLOCK
      ?auto_26560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26558 ?auto_26557 ) ( CLEAR ?auto_26558 ) ( ON-TABLE ?auto_26555 ) ( ON ?auto_26556 ?auto_26555 ) ( ON ?auto_26557 ?auto_26556 ) ( not ( = ?auto_26555 ?auto_26556 ) ) ( not ( = ?auto_26555 ?auto_26557 ) ) ( not ( = ?auto_26555 ?auto_26558 ) ) ( not ( = ?auto_26556 ?auto_26557 ) ) ( not ( = ?auto_26556 ?auto_26558 ) ) ( not ( = ?auto_26557 ?auto_26558 ) ) ( HOLDING ?auto_26559 ) ( CLEAR ?auto_26560 ) ( not ( = ?auto_26555 ?auto_26559 ) ) ( not ( = ?auto_26555 ?auto_26560 ) ) ( not ( = ?auto_26556 ?auto_26559 ) ) ( not ( = ?auto_26556 ?auto_26560 ) ) ( not ( = ?auto_26557 ?auto_26559 ) ) ( not ( = ?auto_26557 ?auto_26560 ) ) ( not ( = ?auto_26558 ?auto_26559 ) ) ( not ( = ?auto_26558 ?auto_26560 ) ) ( not ( = ?auto_26559 ?auto_26560 ) ) )
    :subtasks
    ( ( !STACK ?auto_26559 ?auto_26560 )
      ( MAKE-3PILE ?auto_26555 ?auto_26556 ?auto_26557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26561 - BLOCK
      ?auto_26562 - BLOCK
      ?auto_26563 - BLOCK
    )
    :vars
    (
      ?auto_26566 - BLOCK
      ?auto_26565 - BLOCK
      ?auto_26564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26566 ?auto_26563 ) ( ON-TABLE ?auto_26561 ) ( ON ?auto_26562 ?auto_26561 ) ( ON ?auto_26563 ?auto_26562 ) ( not ( = ?auto_26561 ?auto_26562 ) ) ( not ( = ?auto_26561 ?auto_26563 ) ) ( not ( = ?auto_26561 ?auto_26566 ) ) ( not ( = ?auto_26562 ?auto_26563 ) ) ( not ( = ?auto_26562 ?auto_26566 ) ) ( not ( = ?auto_26563 ?auto_26566 ) ) ( CLEAR ?auto_26565 ) ( not ( = ?auto_26561 ?auto_26564 ) ) ( not ( = ?auto_26561 ?auto_26565 ) ) ( not ( = ?auto_26562 ?auto_26564 ) ) ( not ( = ?auto_26562 ?auto_26565 ) ) ( not ( = ?auto_26563 ?auto_26564 ) ) ( not ( = ?auto_26563 ?auto_26565 ) ) ( not ( = ?auto_26566 ?auto_26564 ) ) ( not ( = ?auto_26566 ?auto_26565 ) ) ( not ( = ?auto_26564 ?auto_26565 ) ) ( ON ?auto_26564 ?auto_26566 ) ( CLEAR ?auto_26564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26561 ?auto_26562 ?auto_26563 ?auto_26566 )
      ( MAKE-3PILE ?auto_26561 ?auto_26562 ?auto_26563 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26567 - BLOCK
      ?auto_26568 - BLOCK
      ?auto_26569 - BLOCK
    )
    :vars
    (
      ?auto_26572 - BLOCK
      ?auto_26571 - BLOCK
      ?auto_26570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26572 ?auto_26569 ) ( ON-TABLE ?auto_26567 ) ( ON ?auto_26568 ?auto_26567 ) ( ON ?auto_26569 ?auto_26568 ) ( not ( = ?auto_26567 ?auto_26568 ) ) ( not ( = ?auto_26567 ?auto_26569 ) ) ( not ( = ?auto_26567 ?auto_26572 ) ) ( not ( = ?auto_26568 ?auto_26569 ) ) ( not ( = ?auto_26568 ?auto_26572 ) ) ( not ( = ?auto_26569 ?auto_26572 ) ) ( not ( = ?auto_26567 ?auto_26571 ) ) ( not ( = ?auto_26567 ?auto_26570 ) ) ( not ( = ?auto_26568 ?auto_26571 ) ) ( not ( = ?auto_26568 ?auto_26570 ) ) ( not ( = ?auto_26569 ?auto_26571 ) ) ( not ( = ?auto_26569 ?auto_26570 ) ) ( not ( = ?auto_26572 ?auto_26571 ) ) ( not ( = ?auto_26572 ?auto_26570 ) ) ( not ( = ?auto_26571 ?auto_26570 ) ) ( ON ?auto_26571 ?auto_26572 ) ( CLEAR ?auto_26571 ) ( HOLDING ?auto_26570 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26570 )
      ( MAKE-3PILE ?auto_26567 ?auto_26568 ?auto_26569 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26573 - BLOCK
      ?auto_26574 - BLOCK
      ?auto_26575 - BLOCK
    )
    :vars
    (
      ?auto_26577 - BLOCK
      ?auto_26578 - BLOCK
      ?auto_26576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26577 ?auto_26575 ) ( ON-TABLE ?auto_26573 ) ( ON ?auto_26574 ?auto_26573 ) ( ON ?auto_26575 ?auto_26574 ) ( not ( = ?auto_26573 ?auto_26574 ) ) ( not ( = ?auto_26573 ?auto_26575 ) ) ( not ( = ?auto_26573 ?auto_26577 ) ) ( not ( = ?auto_26574 ?auto_26575 ) ) ( not ( = ?auto_26574 ?auto_26577 ) ) ( not ( = ?auto_26575 ?auto_26577 ) ) ( not ( = ?auto_26573 ?auto_26578 ) ) ( not ( = ?auto_26573 ?auto_26576 ) ) ( not ( = ?auto_26574 ?auto_26578 ) ) ( not ( = ?auto_26574 ?auto_26576 ) ) ( not ( = ?auto_26575 ?auto_26578 ) ) ( not ( = ?auto_26575 ?auto_26576 ) ) ( not ( = ?auto_26577 ?auto_26578 ) ) ( not ( = ?auto_26577 ?auto_26576 ) ) ( not ( = ?auto_26578 ?auto_26576 ) ) ( ON ?auto_26578 ?auto_26577 ) ( ON ?auto_26576 ?auto_26578 ) ( CLEAR ?auto_26576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26573 ?auto_26574 ?auto_26575 ?auto_26577 ?auto_26578 )
      ( MAKE-3PILE ?auto_26573 ?auto_26574 ?auto_26575 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26582 - BLOCK
      ?auto_26583 - BLOCK
      ?auto_26584 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26584 ) ( CLEAR ?auto_26583 ) ( ON-TABLE ?auto_26582 ) ( ON ?auto_26583 ?auto_26582 ) ( not ( = ?auto_26582 ?auto_26583 ) ) ( not ( = ?auto_26582 ?auto_26584 ) ) ( not ( = ?auto_26583 ?auto_26584 ) ) )
    :subtasks
    ( ( !STACK ?auto_26584 ?auto_26583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26585 - BLOCK
      ?auto_26586 - BLOCK
      ?auto_26587 - BLOCK
    )
    :vars
    (
      ?auto_26588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26586 ) ( ON-TABLE ?auto_26585 ) ( ON ?auto_26586 ?auto_26585 ) ( not ( = ?auto_26585 ?auto_26586 ) ) ( not ( = ?auto_26585 ?auto_26587 ) ) ( not ( = ?auto_26586 ?auto_26587 ) ) ( ON ?auto_26587 ?auto_26588 ) ( CLEAR ?auto_26587 ) ( HAND-EMPTY ) ( not ( = ?auto_26585 ?auto_26588 ) ) ( not ( = ?auto_26586 ?auto_26588 ) ) ( not ( = ?auto_26587 ?auto_26588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26587 ?auto_26588 )
      ( MAKE-3PILE ?auto_26585 ?auto_26586 ?auto_26587 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26589 - BLOCK
      ?auto_26590 - BLOCK
      ?auto_26591 - BLOCK
    )
    :vars
    (
      ?auto_26592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26589 ) ( not ( = ?auto_26589 ?auto_26590 ) ) ( not ( = ?auto_26589 ?auto_26591 ) ) ( not ( = ?auto_26590 ?auto_26591 ) ) ( ON ?auto_26591 ?auto_26592 ) ( CLEAR ?auto_26591 ) ( not ( = ?auto_26589 ?auto_26592 ) ) ( not ( = ?auto_26590 ?auto_26592 ) ) ( not ( = ?auto_26591 ?auto_26592 ) ) ( HOLDING ?auto_26590 ) ( CLEAR ?auto_26589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26589 ?auto_26590 )
      ( MAKE-3PILE ?auto_26589 ?auto_26590 ?auto_26591 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26593 - BLOCK
      ?auto_26594 - BLOCK
      ?auto_26595 - BLOCK
    )
    :vars
    (
      ?auto_26596 - BLOCK
      ?auto_26597 - BLOCK
      ?auto_26598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26593 ) ( not ( = ?auto_26593 ?auto_26594 ) ) ( not ( = ?auto_26593 ?auto_26595 ) ) ( not ( = ?auto_26594 ?auto_26595 ) ) ( ON ?auto_26595 ?auto_26596 ) ( not ( = ?auto_26593 ?auto_26596 ) ) ( not ( = ?auto_26594 ?auto_26596 ) ) ( not ( = ?auto_26595 ?auto_26596 ) ) ( CLEAR ?auto_26593 ) ( ON ?auto_26594 ?auto_26595 ) ( CLEAR ?auto_26594 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26597 ) ( ON ?auto_26598 ?auto_26597 ) ( ON ?auto_26596 ?auto_26598 ) ( not ( = ?auto_26597 ?auto_26598 ) ) ( not ( = ?auto_26597 ?auto_26596 ) ) ( not ( = ?auto_26597 ?auto_26595 ) ) ( not ( = ?auto_26597 ?auto_26594 ) ) ( not ( = ?auto_26598 ?auto_26596 ) ) ( not ( = ?auto_26598 ?auto_26595 ) ) ( not ( = ?auto_26598 ?auto_26594 ) ) ( not ( = ?auto_26593 ?auto_26597 ) ) ( not ( = ?auto_26593 ?auto_26598 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26597 ?auto_26598 ?auto_26596 ?auto_26595 )
      ( MAKE-3PILE ?auto_26593 ?auto_26594 ?auto_26595 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26599 - BLOCK
      ?auto_26600 - BLOCK
      ?auto_26601 - BLOCK
    )
    :vars
    (
      ?auto_26604 - BLOCK
      ?auto_26603 - BLOCK
      ?auto_26602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26599 ?auto_26600 ) ) ( not ( = ?auto_26599 ?auto_26601 ) ) ( not ( = ?auto_26600 ?auto_26601 ) ) ( ON ?auto_26601 ?auto_26604 ) ( not ( = ?auto_26599 ?auto_26604 ) ) ( not ( = ?auto_26600 ?auto_26604 ) ) ( not ( = ?auto_26601 ?auto_26604 ) ) ( ON ?auto_26600 ?auto_26601 ) ( CLEAR ?auto_26600 ) ( ON-TABLE ?auto_26603 ) ( ON ?auto_26602 ?auto_26603 ) ( ON ?auto_26604 ?auto_26602 ) ( not ( = ?auto_26603 ?auto_26602 ) ) ( not ( = ?auto_26603 ?auto_26604 ) ) ( not ( = ?auto_26603 ?auto_26601 ) ) ( not ( = ?auto_26603 ?auto_26600 ) ) ( not ( = ?auto_26602 ?auto_26604 ) ) ( not ( = ?auto_26602 ?auto_26601 ) ) ( not ( = ?auto_26602 ?auto_26600 ) ) ( not ( = ?auto_26599 ?auto_26603 ) ) ( not ( = ?auto_26599 ?auto_26602 ) ) ( HOLDING ?auto_26599 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26599 )
      ( MAKE-3PILE ?auto_26599 ?auto_26600 ?auto_26601 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26605 - BLOCK
      ?auto_26606 - BLOCK
      ?auto_26607 - BLOCK
    )
    :vars
    (
      ?auto_26608 - BLOCK
      ?auto_26609 - BLOCK
      ?auto_26610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26605 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26607 ) ) ( not ( = ?auto_26606 ?auto_26607 ) ) ( ON ?auto_26607 ?auto_26608 ) ( not ( = ?auto_26605 ?auto_26608 ) ) ( not ( = ?auto_26606 ?auto_26608 ) ) ( not ( = ?auto_26607 ?auto_26608 ) ) ( ON ?auto_26606 ?auto_26607 ) ( ON-TABLE ?auto_26609 ) ( ON ?auto_26610 ?auto_26609 ) ( ON ?auto_26608 ?auto_26610 ) ( not ( = ?auto_26609 ?auto_26610 ) ) ( not ( = ?auto_26609 ?auto_26608 ) ) ( not ( = ?auto_26609 ?auto_26607 ) ) ( not ( = ?auto_26609 ?auto_26606 ) ) ( not ( = ?auto_26610 ?auto_26608 ) ) ( not ( = ?auto_26610 ?auto_26607 ) ) ( not ( = ?auto_26610 ?auto_26606 ) ) ( not ( = ?auto_26605 ?auto_26609 ) ) ( not ( = ?auto_26605 ?auto_26610 ) ) ( ON ?auto_26605 ?auto_26606 ) ( CLEAR ?auto_26605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26609 ?auto_26610 ?auto_26608 ?auto_26607 ?auto_26606 )
      ( MAKE-3PILE ?auto_26605 ?auto_26606 ?auto_26607 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26613 - BLOCK
      ?auto_26614 - BLOCK
    )
    :vars
    (
      ?auto_26615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26615 ?auto_26614 ) ( CLEAR ?auto_26615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26613 ) ( ON ?auto_26614 ?auto_26613 ) ( not ( = ?auto_26613 ?auto_26614 ) ) ( not ( = ?auto_26613 ?auto_26615 ) ) ( not ( = ?auto_26614 ?auto_26615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26615 ?auto_26614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26616 - BLOCK
      ?auto_26617 - BLOCK
    )
    :vars
    (
      ?auto_26618 - BLOCK
      ?auto_26619 - BLOCK
      ?auto_26620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26618 ?auto_26617 ) ( CLEAR ?auto_26618 ) ( ON-TABLE ?auto_26616 ) ( ON ?auto_26617 ?auto_26616 ) ( not ( = ?auto_26616 ?auto_26617 ) ) ( not ( = ?auto_26616 ?auto_26618 ) ) ( not ( = ?auto_26617 ?auto_26618 ) ) ( HOLDING ?auto_26619 ) ( CLEAR ?auto_26620 ) ( not ( = ?auto_26616 ?auto_26619 ) ) ( not ( = ?auto_26616 ?auto_26620 ) ) ( not ( = ?auto_26617 ?auto_26619 ) ) ( not ( = ?auto_26617 ?auto_26620 ) ) ( not ( = ?auto_26618 ?auto_26619 ) ) ( not ( = ?auto_26618 ?auto_26620 ) ) ( not ( = ?auto_26619 ?auto_26620 ) ) )
    :subtasks
    ( ( !STACK ?auto_26619 ?auto_26620 )
      ( MAKE-2PILE ?auto_26616 ?auto_26617 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26621 - BLOCK
      ?auto_26622 - BLOCK
    )
    :vars
    (
      ?auto_26625 - BLOCK
      ?auto_26623 - BLOCK
      ?auto_26624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26625 ?auto_26622 ) ( ON-TABLE ?auto_26621 ) ( ON ?auto_26622 ?auto_26621 ) ( not ( = ?auto_26621 ?auto_26622 ) ) ( not ( = ?auto_26621 ?auto_26625 ) ) ( not ( = ?auto_26622 ?auto_26625 ) ) ( CLEAR ?auto_26623 ) ( not ( = ?auto_26621 ?auto_26624 ) ) ( not ( = ?auto_26621 ?auto_26623 ) ) ( not ( = ?auto_26622 ?auto_26624 ) ) ( not ( = ?auto_26622 ?auto_26623 ) ) ( not ( = ?auto_26625 ?auto_26624 ) ) ( not ( = ?auto_26625 ?auto_26623 ) ) ( not ( = ?auto_26624 ?auto_26623 ) ) ( ON ?auto_26624 ?auto_26625 ) ( CLEAR ?auto_26624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26621 ?auto_26622 ?auto_26625 )
      ( MAKE-2PILE ?auto_26621 ?auto_26622 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26626 - BLOCK
      ?auto_26627 - BLOCK
    )
    :vars
    (
      ?auto_26630 - BLOCK
      ?auto_26628 - BLOCK
      ?auto_26629 - BLOCK
      ?auto_26631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26630 ?auto_26627 ) ( ON-TABLE ?auto_26626 ) ( ON ?auto_26627 ?auto_26626 ) ( not ( = ?auto_26626 ?auto_26627 ) ) ( not ( = ?auto_26626 ?auto_26630 ) ) ( not ( = ?auto_26627 ?auto_26630 ) ) ( not ( = ?auto_26626 ?auto_26628 ) ) ( not ( = ?auto_26626 ?auto_26629 ) ) ( not ( = ?auto_26627 ?auto_26628 ) ) ( not ( = ?auto_26627 ?auto_26629 ) ) ( not ( = ?auto_26630 ?auto_26628 ) ) ( not ( = ?auto_26630 ?auto_26629 ) ) ( not ( = ?auto_26628 ?auto_26629 ) ) ( ON ?auto_26628 ?auto_26630 ) ( CLEAR ?auto_26628 ) ( HOLDING ?auto_26629 ) ( CLEAR ?auto_26631 ) ( ON-TABLE ?auto_26631 ) ( not ( = ?auto_26631 ?auto_26629 ) ) ( not ( = ?auto_26626 ?auto_26631 ) ) ( not ( = ?auto_26627 ?auto_26631 ) ) ( not ( = ?auto_26630 ?auto_26631 ) ) ( not ( = ?auto_26628 ?auto_26631 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26631 ?auto_26629 )
      ( MAKE-2PILE ?auto_26626 ?auto_26627 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26632 - BLOCK
      ?auto_26633 - BLOCK
    )
    :vars
    (
      ?auto_26634 - BLOCK
      ?auto_26635 - BLOCK
      ?auto_26637 - BLOCK
      ?auto_26636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26634 ?auto_26633 ) ( ON-TABLE ?auto_26632 ) ( ON ?auto_26633 ?auto_26632 ) ( not ( = ?auto_26632 ?auto_26633 ) ) ( not ( = ?auto_26632 ?auto_26634 ) ) ( not ( = ?auto_26633 ?auto_26634 ) ) ( not ( = ?auto_26632 ?auto_26635 ) ) ( not ( = ?auto_26632 ?auto_26637 ) ) ( not ( = ?auto_26633 ?auto_26635 ) ) ( not ( = ?auto_26633 ?auto_26637 ) ) ( not ( = ?auto_26634 ?auto_26635 ) ) ( not ( = ?auto_26634 ?auto_26637 ) ) ( not ( = ?auto_26635 ?auto_26637 ) ) ( ON ?auto_26635 ?auto_26634 ) ( CLEAR ?auto_26636 ) ( ON-TABLE ?auto_26636 ) ( not ( = ?auto_26636 ?auto_26637 ) ) ( not ( = ?auto_26632 ?auto_26636 ) ) ( not ( = ?auto_26633 ?auto_26636 ) ) ( not ( = ?auto_26634 ?auto_26636 ) ) ( not ( = ?auto_26635 ?auto_26636 ) ) ( ON ?auto_26637 ?auto_26635 ) ( CLEAR ?auto_26637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26632 ?auto_26633 ?auto_26634 ?auto_26635 )
      ( MAKE-2PILE ?auto_26632 ?auto_26633 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26638 - BLOCK
      ?auto_26639 - BLOCK
    )
    :vars
    (
      ?auto_26642 - BLOCK
      ?auto_26641 - BLOCK
      ?auto_26640 - BLOCK
      ?auto_26643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26642 ?auto_26639 ) ( ON-TABLE ?auto_26638 ) ( ON ?auto_26639 ?auto_26638 ) ( not ( = ?auto_26638 ?auto_26639 ) ) ( not ( = ?auto_26638 ?auto_26642 ) ) ( not ( = ?auto_26639 ?auto_26642 ) ) ( not ( = ?auto_26638 ?auto_26641 ) ) ( not ( = ?auto_26638 ?auto_26640 ) ) ( not ( = ?auto_26639 ?auto_26641 ) ) ( not ( = ?auto_26639 ?auto_26640 ) ) ( not ( = ?auto_26642 ?auto_26641 ) ) ( not ( = ?auto_26642 ?auto_26640 ) ) ( not ( = ?auto_26641 ?auto_26640 ) ) ( ON ?auto_26641 ?auto_26642 ) ( not ( = ?auto_26643 ?auto_26640 ) ) ( not ( = ?auto_26638 ?auto_26643 ) ) ( not ( = ?auto_26639 ?auto_26643 ) ) ( not ( = ?auto_26642 ?auto_26643 ) ) ( not ( = ?auto_26641 ?auto_26643 ) ) ( ON ?auto_26640 ?auto_26641 ) ( CLEAR ?auto_26640 ) ( HOLDING ?auto_26643 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26643 )
      ( MAKE-2PILE ?auto_26638 ?auto_26639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26644 - BLOCK
      ?auto_26645 - BLOCK
    )
    :vars
    (
      ?auto_26649 - BLOCK
      ?auto_26646 - BLOCK
      ?auto_26647 - BLOCK
      ?auto_26648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26649 ?auto_26645 ) ( ON-TABLE ?auto_26644 ) ( ON ?auto_26645 ?auto_26644 ) ( not ( = ?auto_26644 ?auto_26645 ) ) ( not ( = ?auto_26644 ?auto_26649 ) ) ( not ( = ?auto_26645 ?auto_26649 ) ) ( not ( = ?auto_26644 ?auto_26646 ) ) ( not ( = ?auto_26644 ?auto_26647 ) ) ( not ( = ?auto_26645 ?auto_26646 ) ) ( not ( = ?auto_26645 ?auto_26647 ) ) ( not ( = ?auto_26649 ?auto_26646 ) ) ( not ( = ?auto_26649 ?auto_26647 ) ) ( not ( = ?auto_26646 ?auto_26647 ) ) ( ON ?auto_26646 ?auto_26649 ) ( not ( = ?auto_26648 ?auto_26647 ) ) ( not ( = ?auto_26644 ?auto_26648 ) ) ( not ( = ?auto_26645 ?auto_26648 ) ) ( not ( = ?auto_26649 ?auto_26648 ) ) ( not ( = ?auto_26646 ?auto_26648 ) ) ( ON ?auto_26647 ?auto_26646 ) ( ON ?auto_26648 ?auto_26647 ) ( CLEAR ?auto_26648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26644 ?auto_26645 ?auto_26649 ?auto_26646 ?auto_26647 )
      ( MAKE-2PILE ?auto_26644 ?auto_26645 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26654 - BLOCK
      ?auto_26655 - BLOCK
      ?auto_26656 - BLOCK
      ?auto_26657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26657 ) ( CLEAR ?auto_26656 ) ( ON-TABLE ?auto_26654 ) ( ON ?auto_26655 ?auto_26654 ) ( ON ?auto_26656 ?auto_26655 ) ( not ( = ?auto_26654 ?auto_26655 ) ) ( not ( = ?auto_26654 ?auto_26656 ) ) ( not ( = ?auto_26654 ?auto_26657 ) ) ( not ( = ?auto_26655 ?auto_26656 ) ) ( not ( = ?auto_26655 ?auto_26657 ) ) ( not ( = ?auto_26656 ?auto_26657 ) ) )
    :subtasks
    ( ( !STACK ?auto_26657 ?auto_26656 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26658 - BLOCK
      ?auto_26659 - BLOCK
      ?auto_26660 - BLOCK
      ?auto_26661 - BLOCK
    )
    :vars
    (
      ?auto_26662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26660 ) ( ON-TABLE ?auto_26658 ) ( ON ?auto_26659 ?auto_26658 ) ( ON ?auto_26660 ?auto_26659 ) ( not ( = ?auto_26658 ?auto_26659 ) ) ( not ( = ?auto_26658 ?auto_26660 ) ) ( not ( = ?auto_26658 ?auto_26661 ) ) ( not ( = ?auto_26659 ?auto_26660 ) ) ( not ( = ?auto_26659 ?auto_26661 ) ) ( not ( = ?auto_26660 ?auto_26661 ) ) ( ON ?auto_26661 ?auto_26662 ) ( CLEAR ?auto_26661 ) ( HAND-EMPTY ) ( not ( = ?auto_26658 ?auto_26662 ) ) ( not ( = ?auto_26659 ?auto_26662 ) ) ( not ( = ?auto_26660 ?auto_26662 ) ) ( not ( = ?auto_26661 ?auto_26662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26661 ?auto_26662 )
      ( MAKE-4PILE ?auto_26658 ?auto_26659 ?auto_26660 ?auto_26661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26663 - BLOCK
      ?auto_26664 - BLOCK
      ?auto_26665 - BLOCK
      ?auto_26666 - BLOCK
    )
    :vars
    (
      ?auto_26667 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26663 ) ( ON ?auto_26664 ?auto_26663 ) ( not ( = ?auto_26663 ?auto_26664 ) ) ( not ( = ?auto_26663 ?auto_26665 ) ) ( not ( = ?auto_26663 ?auto_26666 ) ) ( not ( = ?auto_26664 ?auto_26665 ) ) ( not ( = ?auto_26664 ?auto_26666 ) ) ( not ( = ?auto_26665 ?auto_26666 ) ) ( ON ?auto_26666 ?auto_26667 ) ( CLEAR ?auto_26666 ) ( not ( = ?auto_26663 ?auto_26667 ) ) ( not ( = ?auto_26664 ?auto_26667 ) ) ( not ( = ?auto_26665 ?auto_26667 ) ) ( not ( = ?auto_26666 ?auto_26667 ) ) ( HOLDING ?auto_26665 ) ( CLEAR ?auto_26664 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26663 ?auto_26664 ?auto_26665 )
      ( MAKE-4PILE ?auto_26663 ?auto_26664 ?auto_26665 ?auto_26666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26668 - BLOCK
      ?auto_26669 - BLOCK
      ?auto_26670 - BLOCK
      ?auto_26671 - BLOCK
    )
    :vars
    (
      ?auto_26672 - BLOCK
      ?auto_26673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26668 ) ( ON ?auto_26669 ?auto_26668 ) ( not ( = ?auto_26668 ?auto_26669 ) ) ( not ( = ?auto_26668 ?auto_26670 ) ) ( not ( = ?auto_26668 ?auto_26671 ) ) ( not ( = ?auto_26669 ?auto_26670 ) ) ( not ( = ?auto_26669 ?auto_26671 ) ) ( not ( = ?auto_26670 ?auto_26671 ) ) ( ON ?auto_26671 ?auto_26672 ) ( not ( = ?auto_26668 ?auto_26672 ) ) ( not ( = ?auto_26669 ?auto_26672 ) ) ( not ( = ?auto_26670 ?auto_26672 ) ) ( not ( = ?auto_26671 ?auto_26672 ) ) ( CLEAR ?auto_26669 ) ( ON ?auto_26670 ?auto_26671 ) ( CLEAR ?auto_26670 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26673 ) ( ON ?auto_26672 ?auto_26673 ) ( not ( = ?auto_26673 ?auto_26672 ) ) ( not ( = ?auto_26673 ?auto_26671 ) ) ( not ( = ?auto_26673 ?auto_26670 ) ) ( not ( = ?auto_26668 ?auto_26673 ) ) ( not ( = ?auto_26669 ?auto_26673 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26673 ?auto_26672 ?auto_26671 )
      ( MAKE-4PILE ?auto_26668 ?auto_26669 ?auto_26670 ?auto_26671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26674 - BLOCK
      ?auto_26675 - BLOCK
      ?auto_26676 - BLOCK
      ?auto_26677 - BLOCK
    )
    :vars
    (
      ?auto_26678 - BLOCK
      ?auto_26679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26674 ) ( not ( = ?auto_26674 ?auto_26675 ) ) ( not ( = ?auto_26674 ?auto_26676 ) ) ( not ( = ?auto_26674 ?auto_26677 ) ) ( not ( = ?auto_26675 ?auto_26676 ) ) ( not ( = ?auto_26675 ?auto_26677 ) ) ( not ( = ?auto_26676 ?auto_26677 ) ) ( ON ?auto_26677 ?auto_26678 ) ( not ( = ?auto_26674 ?auto_26678 ) ) ( not ( = ?auto_26675 ?auto_26678 ) ) ( not ( = ?auto_26676 ?auto_26678 ) ) ( not ( = ?auto_26677 ?auto_26678 ) ) ( ON ?auto_26676 ?auto_26677 ) ( CLEAR ?auto_26676 ) ( ON-TABLE ?auto_26679 ) ( ON ?auto_26678 ?auto_26679 ) ( not ( = ?auto_26679 ?auto_26678 ) ) ( not ( = ?auto_26679 ?auto_26677 ) ) ( not ( = ?auto_26679 ?auto_26676 ) ) ( not ( = ?auto_26674 ?auto_26679 ) ) ( not ( = ?auto_26675 ?auto_26679 ) ) ( HOLDING ?auto_26675 ) ( CLEAR ?auto_26674 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26674 ?auto_26675 )
      ( MAKE-4PILE ?auto_26674 ?auto_26675 ?auto_26676 ?auto_26677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26680 - BLOCK
      ?auto_26681 - BLOCK
      ?auto_26682 - BLOCK
      ?auto_26683 - BLOCK
    )
    :vars
    (
      ?auto_26684 - BLOCK
      ?auto_26685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26680 ) ( not ( = ?auto_26680 ?auto_26681 ) ) ( not ( = ?auto_26680 ?auto_26682 ) ) ( not ( = ?auto_26680 ?auto_26683 ) ) ( not ( = ?auto_26681 ?auto_26682 ) ) ( not ( = ?auto_26681 ?auto_26683 ) ) ( not ( = ?auto_26682 ?auto_26683 ) ) ( ON ?auto_26683 ?auto_26684 ) ( not ( = ?auto_26680 ?auto_26684 ) ) ( not ( = ?auto_26681 ?auto_26684 ) ) ( not ( = ?auto_26682 ?auto_26684 ) ) ( not ( = ?auto_26683 ?auto_26684 ) ) ( ON ?auto_26682 ?auto_26683 ) ( ON-TABLE ?auto_26685 ) ( ON ?auto_26684 ?auto_26685 ) ( not ( = ?auto_26685 ?auto_26684 ) ) ( not ( = ?auto_26685 ?auto_26683 ) ) ( not ( = ?auto_26685 ?auto_26682 ) ) ( not ( = ?auto_26680 ?auto_26685 ) ) ( not ( = ?auto_26681 ?auto_26685 ) ) ( CLEAR ?auto_26680 ) ( ON ?auto_26681 ?auto_26682 ) ( CLEAR ?auto_26681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26685 ?auto_26684 ?auto_26683 ?auto_26682 )
      ( MAKE-4PILE ?auto_26680 ?auto_26681 ?auto_26682 ?auto_26683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26686 - BLOCK
      ?auto_26687 - BLOCK
      ?auto_26688 - BLOCK
      ?auto_26689 - BLOCK
    )
    :vars
    (
      ?auto_26691 - BLOCK
      ?auto_26690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26686 ?auto_26687 ) ) ( not ( = ?auto_26686 ?auto_26688 ) ) ( not ( = ?auto_26686 ?auto_26689 ) ) ( not ( = ?auto_26687 ?auto_26688 ) ) ( not ( = ?auto_26687 ?auto_26689 ) ) ( not ( = ?auto_26688 ?auto_26689 ) ) ( ON ?auto_26689 ?auto_26691 ) ( not ( = ?auto_26686 ?auto_26691 ) ) ( not ( = ?auto_26687 ?auto_26691 ) ) ( not ( = ?auto_26688 ?auto_26691 ) ) ( not ( = ?auto_26689 ?auto_26691 ) ) ( ON ?auto_26688 ?auto_26689 ) ( ON-TABLE ?auto_26690 ) ( ON ?auto_26691 ?auto_26690 ) ( not ( = ?auto_26690 ?auto_26691 ) ) ( not ( = ?auto_26690 ?auto_26689 ) ) ( not ( = ?auto_26690 ?auto_26688 ) ) ( not ( = ?auto_26686 ?auto_26690 ) ) ( not ( = ?auto_26687 ?auto_26690 ) ) ( ON ?auto_26687 ?auto_26688 ) ( CLEAR ?auto_26687 ) ( HOLDING ?auto_26686 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26686 )
      ( MAKE-4PILE ?auto_26686 ?auto_26687 ?auto_26688 ?auto_26689 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26692 - BLOCK
      ?auto_26693 - BLOCK
      ?auto_26694 - BLOCK
      ?auto_26695 - BLOCK
    )
    :vars
    (
      ?auto_26696 - BLOCK
      ?auto_26697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26692 ?auto_26693 ) ) ( not ( = ?auto_26692 ?auto_26694 ) ) ( not ( = ?auto_26692 ?auto_26695 ) ) ( not ( = ?auto_26693 ?auto_26694 ) ) ( not ( = ?auto_26693 ?auto_26695 ) ) ( not ( = ?auto_26694 ?auto_26695 ) ) ( ON ?auto_26695 ?auto_26696 ) ( not ( = ?auto_26692 ?auto_26696 ) ) ( not ( = ?auto_26693 ?auto_26696 ) ) ( not ( = ?auto_26694 ?auto_26696 ) ) ( not ( = ?auto_26695 ?auto_26696 ) ) ( ON ?auto_26694 ?auto_26695 ) ( ON-TABLE ?auto_26697 ) ( ON ?auto_26696 ?auto_26697 ) ( not ( = ?auto_26697 ?auto_26696 ) ) ( not ( = ?auto_26697 ?auto_26695 ) ) ( not ( = ?auto_26697 ?auto_26694 ) ) ( not ( = ?auto_26692 ?auto_26697 ) ) ( not ( = ?auto_26693 ?auto_26697 ) ) ( ON ?auto_26693 ?auto_26694 ) ( ON ?auto_26692 ?auto_26693 ) ( CLEAR ?auto_26692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26697 ?auto_26696 ?auto_26695 ?auto_26694 ?auto_26693 )
      ( MAKE-4PILE ?auto_26692 ?auto_26693 ?auto_26694 ?auto_26695 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26699 - BLOCK
    )
    :vars
    (
      ?auto_26700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26700 ?auto_26699 ) ( CLEAR ?auto_26700 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26699 ) ( not ( = ?auto_26699 ?auto_26700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26700 ?auto_26699 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26701 - BLOCK
    )
    :vars
    (
      ?auto_26702 - BLOCK
      ?auto_26703 - BLOCK
      ?auto_26704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26702 ?auto_26701 ) ( CLEAR ?auto_26702 ) ( ON-TABLE ?auto_26701 ) ( not ( = ?auto_26701 ?auto_26702 ) ) ( HOLDING ?auto_26703 ) ( CLEAR ?auto_26704 ) ( not ( = ?auto_26701 ?auto_26703 ) ) ( not ( = ?auto_26701 ?auto_26704 ) ) ( not ( = ?auto_26702 ?auto_26703 ) ) ( not ( = ?auto_26702 ?auto_26704 ) ) ( not ( = ?auto_26703 ?auto_26704 ) ) )
    :subtasks
    ( ( !STACK ?auto_26703 ?auto_26704 )
      ( MAKE-1PILE ?auto_26701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26705 - BLOCK
    )
    :vars
    (
      ?auto_26707 - BLOCK
      ?auto_26708 - BLOCK
      ?auto_26706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26707 ?auto_26705 ) ( ON-TABLE ?auto_26705 ) ( not ( = ?auto_26705 ?auto_26707 ) ) ( CLEAR ?auto_26708 ) ( not ( = ?auto_26705 ?auto_26706 ) ) ( not ( = ?auto_26705 ?auto_26708 ) ) ( not ( = ?auto_26707 ?auto_26706 ) ) ( not ( = ?auto_26707 ?auto_26708 ) ) ( not ( = ?auto_26706 ?auto_26708 ) ) ( ON ?auto_26706 ?auto_26707 ) ( CLEAR ?auto_26706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26705 ?auto_26707 )
      ( MAKE-1PILE ?auto_26705 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26709 - BLOCK
    )
    :vars
    (
      ?auto_26711 - BLOCK
      ?auto_26710 - BLOCK
      ?auto_26712 - BLOCK
      ?auto_26713 - BLOCK
      ?auto_26714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26711 ?auto_26709 ) ( ON-TABLE ?auto_26709 ) ( not ( = ?auto_26709 ?auto_26711 ) ) ( not ( = ?auto_26709 ?auto_26710 ) ) ( not ( = ?auto_26709 ?auto_26712 ) ) ( not ( = ?auto_26711 ?auto_26710 ) ) ( not ( = ?auto_26711 ?auto_26712 ) ) ( not ( = ?auto_26710 ?auto_26712 ) ) ( ON ?auto_26710 ?auto_26711 ) ( CLEAR ?auto_26710 ) ( HOLDING ?auto_26712 ) ( CLEAR ?auto_26713 ) ( ON-TABLE ?auto_26714 ) ( ON ?auto_26713 ?auto_26714 ) ( not ( = ?auto_26714 ?auto_26713 ) ) ( not ( = ?auto_26714 ?auto_26712 ) ) ( not ( = ?auto_26713 ?auto_26712 ) ) ( not ( = ?auto_26709 ?auto_26713 ) ) ( not ( = ?auto_26709 ?auto_26714 ) ) ( not ( = ?auto_26711 ?auto_26713 ) ) ( not ( = ?auto_26711 ?auto_26714 ) ) ( not ( = ?auto_26710 ?auto_26713 ) ) ( not ( = ?auto_26710 ?auto_26714 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26714 ?auto_26713 ?auto_26712 )
      ( MAKE-1PILE ?auto_26709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26715 - BLOCK
    )
    :vars
    (
      ?auto_26720 - BLOCK
      ?auto_26716 - BLOCK
      ?auto_26719 - BLOCK
      ?auto_26717 - BLOCK
      ?auto_26718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26720 ?auto_26715 ) ( ON-TABLE ?auto_26715 ) ( not ( = ?auto_26715 ?auto_26720 ) ) ( not ( = ?auto_26715 ?auto_26716 ) ) ( not ( = ?auto_26715 ?auto_26719 ) ) ( not ( = ?auto_26720 ?auto_26716 ) ) ( not ( = ?auto_26720 ?auto_26719 ) ) ( not ( = ?auto_26716 ?auto_26719 ) ) ( ON ?auto_26716 ?auto_26720 ) ( CLEAR ?auto_26717 ) ( ON-TABLE ?auto_26718 ) ( ON ?auto_26717 ?auto_26718 ) ( not ( = ?auto_26718 ?auto_26717 ) ) ( not ( = ?auto_26718 ?auto_26719 ) ) ( not ( = ?auto_26717 ?auto_26719 ) ) ( not ( = ?auto_26715 ?auto_26717 ) ) ( not ( = ?auto_26715 ?auto_26718 ) ) ( not ( = ?auto_26720 ?auto_26717 ) ) ( not ( = ?auto_26720 ?auto_26718 ) ) ( not ( = ?auto_26716 ?auto_26717 ) ) ( not ( = ?auto_26716 ?auto_26718 ) ) ( ON ?auto_26719 ?auto_26716 ) ( CLEAR ?auto_26719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26715 ?auto_26720 ?auto_26716 )
      ( MAKE-1PILE ?auto_26715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26721 - BLOCK
    )
    :vars
    (
      ?auto_26722 - BLOCK
      ?auto_26724 - BLOCK
      ?auto_26726 - BLOCK
      ?auto_26725 - BLOCK
      ?auto_26723 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26722 ?auto_26721 ) ( ON-TABLE ?auto_26721 ) ( not ( = ?auto_26721 ?auto_26722 ) ) ( not ( = ?auto_26721 ?auto_26724 ) ) ( not ( = ?auto_26721 ?auto_26726 ) ) ( not ( = ?auto_26722 ?auto_26724 ) ) ( not ( = ?auto_26722 ?auto_26726 ) ) ( not ( = ?auto_26724 ?auto_26726 ) ) ( ON ?auto_26724 ?auto_26722 ) ( ON-TABLE ?auto_26725 ) ( not ( = ?auto_26725 ?auto_26723 ) ) ( not ( = ?auto_26725 ?auto_26726 ) ) ( not ( = ?auto_26723 ?auto_26726 ) ) ( not ( = ?auto_26721 ?auto_26723 ) ) ( not ( = ?auto_26721 ?auto_26725 ) ) ( not ( = ?auto_26722 ?auto_26723 ) ) ( not ( = ?auto_26722 ?auto_26725 ) ) ( not ( = ?auto_26724 ?auto_26723 ) ) ( not ( = ?auto_26724 ?auto_26725 ) ) ( ON ?auto_26726 ?auto_26724 ) ( CLEAR ?auto_26726 ) ( HOLDING ?auto_26723 ) ( CLEAR ?auto_26725 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26725 ?auto_26723 )
      ( MAKE-1PILE ?auto_26721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26727 - BLOCK
    )
    :vars
    (
      ?auto_26728 - BLOCK
      ?auto_26730 - BLOCK
      ?auto_26729 - BLOCK
      ?auto_26732 - BLOCK
      ?auto_26731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26728 ?auto_26727 ) ( ON-TABLE ?auto_26727 ) ( not ( = ?auto_26727 ?auto_26728 ) ) ( not ( = ?auto_26727 ?auto_26730 ) ) ( not ( = ?auto_26727 ?auto_26729 ) ) ( not ( = ?auto_26728 ?auto_26730 ) ) ( not ( = ?auto_26728 ?auto_26729 ) ) ( not ( = ?auto_26730 ?auto_26729 ) ) ( ON ?auto_26730 ?auto_26728 ) ( ON-TABLE ?auto_26732 ) ( not ( = ?auto_26732 ?auto_26731 ) ) ( not ( = ?auto_26732 ?auto_26729 ) ) ( not ( = ?auto_26731 ?auto_26729 ) ) ( not ( = ?auto_26727 ?auto_26731 ) ) ( not ( = ?auto_26727 ?auto_26732 ) ) ( not ( = ?auto_26728 ?auto_26731 ) ) ( not ( = ?auto_26728 ?auto_26732 ) ) ( not ( = ?auto_26730 ?auto_26731 ) ) ( not ( = ?auto_26730 ?auto_26732 ) ) ( ON ?auto_26729 ?auto_26730 ) ( CLEAR ?auto_26732 ) ( ON ?auto_26731 ?auto_26729 ) ( CLEAR ?auto_26731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26727 ?auto_26728 ?auto_26730 ?auto_26729 )
      ( MAKE-1PILE ?auto_26727 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26733 - BLOCK
    )
    :vars
    (
      ?auto_26738 - BLOCK
      ?auto_26737 - BLOCK
      ?auto_26734 - BLOCK
      ?auto_26735 - BLOCK
      ?auto_26736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26738 ?auto_26733 ) ( ON-TABLE ?auto_26733 ) ( not ( = ?auto_26733 ?auto_26738 ) ) ( not ( = ?auto_26733 ?auto_26737 ) ) ( not ( = ?auto_26733 ?auto_26734 ) ) ( not ( = ?auto_26738 ?auto_26737 ) ) ( not ( = ?auto_26738 ?auto_26734 ) ) ( not ( = ?auto_26737 ?auto_26734 ) ) ( ON ?auto_26737 ?auto_26738 ) ( not ( = ?auto_26735 ?auto_26736 ) ) ( not ( = ?auto_26735 ?auto_26734 ) ) ( not ( = ?auto_26736 ?auto_26734 ) ) ( not ( = ?auto_26733 ?auto_26736 ) ) ( not ( = ?auto_26733 ?auto_26735 ) ) ( not ( = ?auto_26738 ?auto_26736 ) ) ( not ( = ?auto_26738 ?auto_26735 ) ) ( not ( = ?auto_26737 ?auto_26736 ) ) ( not ( = ?auto_26737 ?auto_26735 ) ) ( ON ?auto_26734 ?auto_26737 ) ( ON ?auto_26736 ?auto_26734 ) ( CLEAR ?auto_26736 ) ( HOLDING ?auto_26735 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26735 )
      ( MAKE-1PILE ?auto_26733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26739 - BLOCK
    )
    :vars
    (
      ?auto_26744 - BLOCK
      ?auto_26743 - BLOCK
      ?auto_26741 - BLOCK
      ?auto_26740 - BLOCK
      ?auto_26742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26744 ?auto_26739 ) ( ON-TABLE ?auto_26739 ) ( not ( = ?auto_26739 ?auto_26744 ) ) ( not ( = ?auto_26739 ?auto_26743 ) ) ( not ( = ?auto_26739 ?auto_26741 ) ) ( not ( = ?auto_26744 ?auto_26743 ) ) ( not ( = ?auto_26744 ?auto_26741 ) ) ( not ( = ?auto_26743 ?auto_26741 ) ) ( ON ?auto_26743 ?auto_26744 ) ( not ( = ?auto_26740 ?auto_26742 ) ) ( not ( = ?auto_26740 ?auto_26741 ) ) ( not ( = ?auto_26742 ?auto_26741 ) ) ( not ( = ?auto_26739 ?auto_26742 ) ) ( not ( = ?auto_26739 ?auto_26740 ) ) ( not ( = ?auto_26744 ?auto_26742 ) ) ( not ( = ?auto_26744 ?auto_26740 ) ) ( not ( = ?auto_26743 ?auto_26742 ) ) ( not ( = ?auto_26743 ?auto_26740 ) ) ( ON ?auto_26741 ?auto_26743 ) ( ON ?auto_26742 ?auto_26741 ) ( ON ?auto_26740 ?auto_26742 ) ( CLEAR ?auto_26740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26739 ?auto_26744 ?auto_26743 ?auto_26741 ?auto_26742 )
      ( MAKE-1PILE ?auto_26739 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26750 - BLOCK
      ?auto_26751 - BLOCK
      ?auto_26752 - BLOCK
      ?auto_26753 - BLOCK
      ?auto_26754 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26754 ) ( CLEAR ?auto_26753 ) ( ON-TABLE ?auto_26750 ) ( ON ?auto_26751 ?auto_26750 ) ( ON ?auto_26752 ?auto_26751 ) ( ON ?auto_26753 ?auto_26752 ) ( not ( = ?auto_26750 ?auto_26751 ) ) ( not ( = ?auto_26750 ?auto_26752 ) ) ( not ( = ?auto_26750 ?auto_26753 ) ) ( not ( = ?auto_26750 ?auto_26754 ) ) ( not ( = ?auto_26751 ?auto_26752 ) ) ( not ( = ?auto_26751 ?auto_26753 ) ) ( not ( = ?auto_26751 ?auto_26754 ) ) ( not ( = ?auto_26752 ?auto_26753 ) ) ( not ( = ?auto_26752 ?auto_26754 ) ) ( not ( = ?auto_26753 ?auto_26754 ) ) )
    :subtasks
    ( ( !STACK ?auto_26754 ?auto_26753 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26755 - BLOCK
      ?auto_26756 - BLOCK
      ?auto_26757 - BLOCK
      ?auto_26758 - BLOCK
      ?auto_26759 - BLOCK
    )
    :vars
    (
      ?auto_26760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_26758 ) ( ON-TABLE ?auto_26755 ) ( ON ?auto_26756 ?auto_26755 ) ( ON ?auto_26757 ?auto_26756 ) ( ON ?auto_26758 ?auto_26757 ) ( not ( = ?auto_26755 ?auto_26756 ) ) ( not ( = ?auto_26755 ?auto_26757 ) ) ( not ( = ?auto_26755 ?auto_26758 ) ) ( not ( = ?auto_26755 ?auto_26759 ) ) ( not ( = ?auto_26756 ?auto_26757 ) ) ( not ( = ?auto_26756 ?auto_26758 ) ) ( not ( = ?auto_26756 ?auto_26759 ) ) ( not ( = ?auto_26757 ?auto_26758 ) ) ( not ( = ?auto_26757 ?auto_26759 ) ) ( not ( = ?auto_26758 ?auto_26759 ) ) ( ON ?auto_26759 ?auto_26760 ) ( CLEAR ?auto_26759 ) ( HAND-EMPTY ) ( not ( = ?auto_26755 ?auto_26760 ) ) ( not ( = ?auto_26756 ?auto_26760 ) ) ( not ( = ?auto_26757 ?auto_26760 ) ) ( not ( = ?auto_26758 ?auto_26760 ) ) ( not ( = ?auto_26759 ?auto_26760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26759 ?auto_26760 )
      ( MAKE-5PILE ?auto_26755 ?auto_26756 ?auto_26757 ?auto_26758 ?auto_26759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26761 - BLOCK
      ?auto_26762 - BLOCK
      ?auto_26763 - BLOCK
      ?auto_26764 - BLOCK
      ?auto_26765 - BLOCK
    )
    :vars
    (
      ?auto_26766 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26761 ) ( ON ?auto_26762 ?auto_26761 ) ( ON ?auto_26763 ?auto_26762 ) ( not ( = ?auto_26761 ?auto_26762 ) ) ( not ( = ?auto_26761 ?auto_26763 ) ) ( not ( = ?auto_26761 ?auto_26764 ) ) ( not ( = ?auto_26761 ?auto_26765 ) ) ( not ( = ?auto_26762 ?auto_26763 ) ) ( not ( = ?auto_26762 ?auto_26764 ) ) ( not ( = ?auto_26762 ?auto_26765 ) ) ( not ( = ?auto_26763 ?auto_26764 ) ) ( not ( = ?auto_26763 ?auto_26765 ) ) ( not ( = ?auto_26764 ?auto_26765 ) ) ( ON ?auto_26765 ?auto_26766 ) ( CLEAR ?auto_26765 ) ( not ( = ?auto_26761 ?auto_26766 ) ) ( not ( = ?auto_26762 ?auto_26766 ) ) ( not ( = ?auto_26763 ?auto_26766 ) ) ( not ( = ?auto_26764 ?auto_26766 ) ) ( not ( = ?auto_26765 ?auto_26766 ) ) ( HOLDING ?auto_26764 ) ( CLEAR ?auto_26763 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26764 )
      ( MAKE-5PILE ?auto_26761 ?auto_26762 ?auto_26763 ?auto_26764 ?auto_26765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26767 - BLOCK
      ?auto_26768 - BLOCK
      ?auto_26769 - BLOCK
      ?auto_26770 - BLOCK
      ?auto_26771 - BLOCK
    )
    :vars
    (
      ?auto_26772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26767 ) ( ON ?auto_26768 ?auto_26767 ) ( ON ?auto_26769 ?auto_26768 ) ( not ( = ?auto_26767 ?auto_26768 ) ) ( not ( = ?auto_26767 ?auto_26769 ) ) ( not ( = ?auto_26767 ?auto_26770 ) ) ( not ( = ?auto_26767 ?auto_26771 ) ) ( not ( = ?auto_26768 ?auto_26769 ) ) ( not ( = ?auto_26768 ?auto_26770 ) ) ( not ( = ?auto_26768 ?auto_26771 ) ) ( not ( = ?auto_26769 ?auto_26770 ) ) ( not ( = ?auto_26769 ?auto_26771 ) ) ( not ( = ?auto_26770 ?auto_26771 ) ) ( ON ?auto_26771 ?auto_26772 ) ( not ( = ?auto_26767 ?auto_26772 ) ) ( not ( = ?auto_26768 ?auto_26772 ) ) ( not ( = ?auto_26769 ?auto_26772 ) ) ( not ( = ?auto_26770 ?auto_26772 ) ) ( not ( = ?auto_26771 ?auto_26772 ) ) ( CLEAR ?auto_26769 ) ( ON ?auto_26770 ?auto_26771 ) ( CLEAR ?auto_26770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26772 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26772 ?auto_26771 )
      ( MAKE-5PILE ?auto_26767 ?auto_26768 ?auto_26769 ?auto_26770 ?auto_26771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26773 - BLOCK
      ?auto_26774 - BLOCK
      ?auto_26775 - BLOCK
      ?auto_26776 - BLOCK
      ?auto_26777 - BLOCK
    )
    :vars
    (
      ?auto_26778 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26773 ) ( ON ?auto_26774 ?auto_26773 ) ( not ( = ?auto_26773 ?auto_26774 ) ) ( not ( = ?auto_26773 ?auto_26775 ) ) ( not ( = ?auto_26773 ?auto_26776 ) ) ( not ( = ?auto_26773 ?auto_26777 ) ) ( not ( = ?auto_26774 ?auto_26775 ) ) ( not ( = ?auto_26774 ?auto_26776 ) ) ( not ( = ?auto_26774 ?auto_26777 ) ) ( not ( = ?auto_26775 ?auto_26776 ) ) ( not ( = ?auto_26775 ?auto_26777 ) ) ( not ( = ?auto_26776 ?auto_26777 ) ) ( ON ?auto_26777 ?auto_26778 ) ( not ( = ?auto_26773 ?auto_26778 ) ) ( not ( = ?auto_26774 ?auto_26778 ) ) ( not ( = ?auto_26775 ?auto_26778 ) ) ( not ( = ?auto_26776 ?auto_26778 ) ) ( not ( = ?auto_26777 ?auto_26778 ) ) ( ON ?auto_26776 ?auto_26777 ) ( CLEAR ?auto_26776 ) ( ON-TABLE ?auto_26778 ) ( HOLDING ?auto_26775 ) ( CLEAR ?auto_26774 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26773 ?auto_26774 ?auto_26775 )
      ( MAKE-5PILE ?auto_26773 ?auto_26774 ?auto_26775 ?auto_26776 ?auto_26777 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26779 - BLOCK
      ?auto_26780 - BLOCK
      ?auto_26781 - BLOCK
      ?auto_26782 - BLOCK
      ?auto_26783 - BLOCK
    )
    :vars
    (
      ?auto_26784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26779 ) ( ON ?auto_26780 ?auto_26779 ) ( not ( = ?auto_26779 ?auto_26780 ) ) ( not ( = ?auto_26779 ?auto_26781 ) ) ( not ( = ?auto_26779 ?auto_26782 ) ) ( not ( = ?auto_26779 ?auto_26783 ) ) ( not ( = ?auto_26780 ?auto_26781 ) ) ( not ( = ?auto_26780 ?auto_26782 ) ) ( not ( = ?auto_26780 ?auto_26783 ) ) ( not ( = ?auto_26781 ?auto_26782 ) ) ( not ( = ?auto_26781 ?auto_26783 ) ) ( not ( = ?auto_26782 ?auto_26783 ) ) ( ON ?auto_26783 ?auto_26784 ) ( not ( = ?auto_26779 ?auto_26784 ) ) ( not ( = ?auto_26780 ?auto_26784 ) ) ( not ( = ?auto_26781 ?auto_26784 ) ) ( not ( = ?auto_26782 ?auto_26784 ) ) ( not ( = ?auto_26783 ?auto_26784 ) ) ( ON ?auto_26782 ?auto_26783 ) ( ON-TABLE ?auto_26784 ) ( CLEAR ?auto_26780 ) ( ON ?auto_26781 ?auto_26782 ) ( CLEAR ?auto_26781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26784 ?auto_26783 ?auto_26782 )
      ( MAKE-5PILE ?auto_26779 ?auto_26780 ?auto_26781 ?auto_26782 ?auto_26783 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26785 - BLOCK
      ?auto_26786 - BLOCK
      ?auto_26787 - BLOCK
      ?auto_26788 - BLOCK
      ?auto_26789 - BLOCK
    )
    :vars
    (
      ?auto_26790 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26785 ) ( not ( = ?auto_26785 ?auto_26786 ) ) ( not ( = ?auto_26785 ?auto_26787 ) ) ( not ( = ?auto_26785 ?auto_26788 ) ) ( not ( = ?auto_26785 ?auto_26789 ) ) ( not ( = ?auto_26786 ?auto_26787 ) ) ( not ( = ?auto_26786 ?auto_26788 ) ) ( not ( = ?auto_26786 ?auto_26789 ) ) ( not ( = ?auto_26787 ?auto_26788 ) ) ( not ( = ?auto_26787 ?auto_26789 ) ) ( not ( = ?auto_26788 ?auto_26789 ) ) ( ON ?auto_26789 ?auto_26790 ) ( not ( = ?auto_26785 ?auto_26790 ) ) ( not ( = ?auto_26786 ?auto_26790 ) ) ( not ( = ?auto_26787 ?auto_26790 ) ) ( not ( = ?auto_26788 ?auto_26790 ) ) ( not ( = ?auto_26789 ?auto_26790 ) ) ( ON ?auto_26788 ?auto_26789 ) ( ON-TABLE ?auto_26790 ) ( ON ?auto_26787 ?auto_26788 ) ( CLEAR ?auto_26787 ) ( HOLDING ?auto_26786 ) ( CLEAR ?auto_26785 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26785 ?auto_26786 )
      ( MAKE-5PILE ?auto_26785 ?auto_26786 ?auto_26787 ?auto_26788 ?auto_26789 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26791 - BLOCK
      ?auto_26792 - BLOCK
      ?auto_26793 - BLOCK
      ?auto_26794 - BLOCK
      ?auto_26795 - BLOCK
    )
    :vars
    (
      ?auto_26796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26791 ) ( not ( = ?auto_26791 ?auto_26792 ) ) ( not ( = ?auto_26791 ?auto_26793 ) ) ( not ( = ?auto_26791 ?auto_26794 ) ) ( not ( = ?auto_26791 ?auto_26795 ) ) ( not ( = ?auto_26792 ?auto_26793 ) ) ( not ( = ?auto_26792 ?auto_26794 ) ) ( not ( = ?auto_26792 ?auto_26795 ) ) ( not ( = ?auto_26793 ?auto_26794 ) ) ( not ( = ?auto_26793 ?auto_26795 ) ) ( not ( = ?auto_26794 ?auto_26795 ) ) ( ON ?auto_26795 ?auto_26796 ) ( not ( = ?auto_26791 ?auto_26796 ) ) ( not ( = ?auto_26792 ?auto_26796 ) ) ( not ( = ?auto_26793 ?auto_26796 ) ) ( not ( = ?auto_26794 ?auto_26796 ) ) ( not ( = ?auto_26795 ?auto_26796 ) ) ( ON ?auto_26794 ?auto_26795 ) ( ON-TABLE ?auto_26796 ) ( ON ?auto_26793 ?auto_26794 ) ( CLEAR ?auto_26791 ) ( ON ?auto_26792 ?auto_26793 ) ( CLEAR ?auto_26792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26796 ?auto_26795 ?auto_26794 ?auto_26793 )
      ( MAKE-5PILE ?auto_26791 ?auto_26792 ?auto_26793 ?auto_26794 ?auto_26795 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26797 - BLOCK
      ?auto_26798 - BLOCK
      ?auto_26799 - BLOCK
      ?auto_26800 - BLOCK
      ?auto_26801 - BLOCK
    )
    :vars
    (
      ?auto_26802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26797 ?auto_26798 ) ) ( not ( = ?auto_26797 ?auto_26799 ) ) ( not ( = ?auto_26797 ?auto_26800 ) ) ( not ( = ?auto_26797 ?auto_26801 ) ) ( not ( = ?auto_26798 ?auto_26799 ) ) ( not ( = ?auto_26798 ?auto_26800 ) ) ( not ( = ?auto_26798 ?auto_26801 ) ) ( not ( = ?auto_26799 ?auto_26800 ) ) ( not ( = ?auto_26799 ?auto_26801 ) ) ( not ( = ?auto_26800 ?auto_26801 ) ) ( ON ?auto_26801 ?auto_26802 ) ( not ( = ?auto_26797 ?auto_26802 ) ) ( not ( = ?auto_26798 ?auto_26802 ) ) ( not ( = ?auto_26799 ?auto_26802 ) ) ( not ( = ?auto_26800 ?auto_26802 ) ) ( not ( = ?auto_26801 ?auto_26802 ) ) ( ON ?auto_26800 ?auto_26801 ) ( ON-TABLE ?auto_26802 ) ( ON ?auto_26799 ?auto_26800 ) ( ON ?auto_26798 ?auto_26799 ) ( CLEAR ?auto_26798 ) ( HOLDING ?auto_26797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26797 )
      ( MAKE-5PILE ?auto_26797 ?auto_26798 ?auto_26799 ?auto_26800 ?auto_26801 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_26803 - BLOCK
      ?auto_26804 - BLOCK
      ?auto_26805 - BLOCK
      ?auto_26806 - BLOCK
      ?auto_26807 - BLOCK
    )
    :vars
    (
      ?auto_26808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26803 ?auto_26804 ) ) ( not ( = ?auto_26803 ?auto_26805 ) ) ( not ( = ?auto_26803 ?auto_26806 ) ) ( not ( = ?auto_26803 ?auto_26807 ) ) ( not ( = ?auto_26804 ?auto_26805 ) ) ( not ( = ?auto_26804 ?auto_26806 ) ) ( not ( = ?auto_26804 ?auto_26807 ) ) ( not ( = ?auto_26805 ?auto_26806 ) ) ( not ( = ?auto_26805 ?auto_26807 ) ) ( not ( = ?auto_26806 ?auto_26807 ) ) ( ON ?auto_26807 ?auto_26808 ) ( not ( = ?auto_26803 ?auto_26808 ) ) ( not ( = ?auto_26804 ?auto_26808 ) ) ( not ( = ?auto_26805 ?auto_26808 ) ) ( not ( = ?auto_26806 ?auto_26808 ) ) ( not ( = ?auto_26807 ?auto_26808 ) ) ( ON ?auto_26806 ?auto_26807 ) ( ON-TABLE ?auto_26808 ) ( ON ?auto_26805 ?auto_26806 ) ( ON ?auto_26804 ?auto_26805 ) ( ON ?auto_26803 ?auto_26804 ) ( CLEAR ?auto_26803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26808 ?auto_26807 ?auto_26806 ?auto_26805 ?auto_26804 )
      ( MAKE-5PILE ?auto_26803 ?auto_26804 ?auto_26805 ?auto_26806 ?auto_26807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26813 - BLOCK
      ?auto_26814 - BLOCK
      ?auto_26815 - BLOCK
      ?auto_26816 - BLOCK
    )
    :vars
    (
      ?auto_26817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26817 ?auto_26816 ) ( CLEAR ?auto_26817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26813 ) ( ON ?auto_26814 ?auto_26813 ) ( ON ?auto_26815 ?auto_26814 ) ( ON ?auto_26816 ?auto_26815 ) ( not ( = ?auto_26813 ?auto_26814 ) ) ( not ( = ?auto_26813 ?auto_26815 ) ) ( not ( = ?auto_26813 ?auto_26816 ) ) ( not ( = ?auto_26813 ?auto_26817 ) ) ( not ( = ?auto_26814 ?auto_26815 ) ) ( not ( = ?auto_26814 ?auto_26816 ) ) ( not ( = ?auto_26814 ?auto_26817 ) ) ( not ( = ?auto_26815 ?auto_26816 ) ) ( not ( = ?auto_26815 ?auto_26817 ) ) ( not ( = ?auto_26816 ?auto_26817 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26817 ?auto_26816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26829 - BLOCK
      ?auto_26830 - BLOCK
      ?auto_26831 - BLOCK
      ?auto_26832 - BLOCK
    )
    :vars
    (
      ?auto_26833 - BLOCK
      ?auto_26834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26829 ) ( ON ?auto_26830 ?auto_26829 ) ( ON ?auto_26831 ?auto_26830 ) ( not ( = ?auto_26829 ?auto_26830 ) ) ( not ( = ?auto_26829 ?auto_26831 ) ) ( not ( = ?auto_26829 ?auto_26832 ) ) ( not ( = ?auto_26829 ?auto_26833 ) ) ( not ( = ?auto_26830 ?auto_26831 ) ) ( not ( = ?auto_26830 ?auto_26832 ) ) ( not ( = ?auto_26830 ?auto_26833 ) ) ( not ( = ?auto_26831 ?auto_26832 ) ) ( not ( = ?auto_26831 ?auto_26833 ) ) ( not ( = ?auto_26832 ?auto_26833 ) ) ( ON ?auto_26833 ?auto_26834 ) ( CLEAR ?auto_26833 ) ( not ( = ?auto_26829 ?auto_26834 ) ) ( not ( = ?auto_26830 ?auto_26834 ) ) ( not ( = ?auto_26831 ?auto_26834 ) ) ( not ( = ?auto_26832 ?auto_26834 ) ) ( not ( = ?auto_26833 ?auto_26834 ) ) ( HOLDING ?auto_26832 ) ( CLEAR ?auto_26831 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26829 ?auto_26830 ?auto_26831 ?auto_26832 ?auto_26833 )
      ( MAKE-4PILE ?auto_26829 ?auto_26830 ?auto_26831 ?auto_26832 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26835 - BLOCK
      ?auto_26836 - BLOCK
      ?auto_26837 - BLOCK
      ?auto_26838 - BLOCK
    )
    :vars
    (
      ?auto_26839 - BLOCK
      ?auto_26840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26835 ) ( ON ?auto_26836 ?auto_26835 ) ( ON ?auto_26837 ?auto_26836 ) ( not ( = ?auto_26835 ?auto_26836 ) ) ( not ( = ?auto_26835 ?auto_26837 ) ) ( not ( = ?auto_26835 ?auto_26838 ) ) ( not ( = ?auto_26835 ?auto_26839 ) ) ( not ( = ?auto_26836 ?auto_26837 ) ) ( not ( = ?auto_26836 ?auto_26838 ) ) ( not ( = ?auto_26836 ?auto_26839 ) ) ( not ( = ?auto_26837 ?auto_26838 ) ) ( not ( = ?auto_26837 ?auto_26839 ) ) ( not ( = ?auto_26838 ?auto_26839 ) ) ( ON ?auto_26839 ?auto_26840 ) ( not ( = ?auto_26835 ?auto_26840 ) ) ( not ( = ?auto_26836 ?auto_26840 ) ) ( not ( = ?auto_26837 ?auto_26840 ) ) ( not ( = ?auto_26838 ?auto_26840 ) ) ( not ( = ?auto_26839 ?auto_26840 ) ) ( CLEAR ?auto_26837 ) ( ON ?auto_26838 ?auto_26839 ) ( CLEAR ?auto_26838 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26840 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26840 ?auto_26839 )
      ( MAKE-4PILE ?auto_26835 ?auto_26836 ?auto_26837 ?auto_26838 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26841 - BLOCK
      ?auto_26842 - BLOCK
      ?auto_26843 - BLOCK
      ?auto_26844 - BLOCK
    )
    :vars
    (
      ?auto_26845 - BLOCK
      ?auto_26846 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26841 ) ( ON ?auto_26842 ?auto_26841 ) ( not ( = ?auto_26841 ?auto_26842 ) ) ( not ( = ?auto_26841 ?auto_26843 ) ) ( not ( = ?auto_26841 ?auto_26844 ) ) ( not ( = ?auto_26841 ?auto_26845 ) ) ( not ( = ?auto_26842 ?auto_26843 ) ) ( not ( = ?auto_26842 ?auto_26844 ) ) ( not ( = ?auto_26842 ?auto_26845 ) ) ( not ( = ?auto_26843 ?auto_26844 ) ) ( not ( = ?auto_26843 ?auto_26845 ) ) ( not ( = ?auto_26844 ?auto_26845 ) ) ( ON ?auto_26845 ?auto_26846 ) ( not ( = ?auto_26841 ?auto_26846 ) ) ( not ( = ?auto_26842 ?auto_26846 ) ) ( not ( = ?auto_26843 ?auto_26846 ) ) ( not ( = ?auto_26844 ?auto_26846 ) ) ( not ( = ?auto_26845 ?auto_26846 ) ) ( ON ?auto_26844 ?auto_26845 ) ( CLEAR ?auto_26844 ) ( ON-TABLE ?auto_26846 ) ( HOLDING ?auto_26843 ) ( CLEAR ?auto_26842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26841 ?auto_26842 ?auto_26843 )
      ( MAKE-4PILE ?auto_26841 ?auto_26842 ?auto_26843 ?auto_26844 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26847 - BLOCK
      ?auto_26848 - BLOCK
      ?auto_26849 - BLOCK
      ?auto_26850 - BLOCK
    )
    :vars
    (
      ?auto_26852 - BLOCK
      ?auto_26851 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26847 ) ( ON ?auto_26848 ?auto_26847 ) ( not ( = ?auto_26847 ?auto_26848 ) ) ( not ( = ?auto_26847 ?auto_26849 ) ) ( not ( = ?auto_26847 ?auto_26850 ) ) ( not ( = ?auto_26847 ?auto_26852 ) ) ( not ( = ?auto_26848 ?auto_26849 ) ) ( not ( = ?auto_26848 ?auto_26850 ) ) ( not ( = ?auto_26848 ?auto_26852 ) ) ( not ( = ?auto_26849 ?auto_26850 ) ) ( not ( = ?auto_26849 ?auto_26852 ) ) ( not ( = ?auto_26850 ?auto_26852 ) ) ( ON ?auto_26852 ?auto_26851 ) ( not ( = ?auto_26847 ?auto_26851 ) ) ( not ( = ?auto_26848 ?auto_26851 ) ) ( not ( = ?auto_26849 ?auto_26851 ) ) ( not ( = ?auto_26850 ?auto_26851 ) ) ( not ( = ?auto_26852 ?auto_26851 ) ) ( ON ?auto_26850 ?auto_26852 ) ( ON-TABLE ?auto_26851 ) ( CLEAR ?auto_26848 ) ( ON ?auto_26849 ?auto_26850 ) ( CLEAR ?auto_26849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26851 ?auto_26852 ?auto_26850 )
      ( MAKE-4PILE ?auto_26847 ?auto_26848 ?auto_26849 ?auto_26850 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26853 - BLOCK
      ?auto_26854 - BLOCK
      ?auto_26855 - BLOCK
      ?auto_26856 - BLOCK
    )
    :vars
    (
      ?auto_26858 - BLOCK
      ?auto_26857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26853 ) ( not ( = ?auto_26853 ?auto_26854 ) ) ( not ( = ?auto_26853 ?auto_26855 ) ) ( not ( = ?auto_26853 ?auto_26856 ) ) ( not ( = ?auto_26853 ?auto_26858 ) ) ( not ( = ?auto_26854 ?auto_26855 ) ) ( not ( = ?auto_26854 ?auto_26856 ) ) ( not ( = ?auto_26854 ?auto_26858 ) ) ( not ( = ?auto_26855 ?auto_26856 ) ) ( not ( = ?auto_26855 ?auto_26858 ) ) ( not ( = ?auto_26856 ?auto_26858 ) ) ( ON ?auto_26858 ?auto_26857 ) ( not ( = ?auto_26853 ?auto_26857 ) ) ( not ( = ?auto_26854 ?auto_26857 ) ) ( not ( = ?auto_26855 ?auto_26857 ) ) ( not ( = ?auto_26856 ?auto_26857 ) ) ( not ( = ?auto_26858 ?auto_26857 ) ) ( ON ?auto_26856 ?auto_26858 ) ( ON-TABLE ?auto_26857 ) ( ON ?auto_26855 ?auto_26856 ) ( CLEAR ?auto_26855 ) ( HOLDING ?auto_26854 ) ( CLEAR ?auto_26853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26853 ?auto_26854 )
      ( MAKE-4PILE ?auto_26853 ?auto_26854 ?auto_26855 ?auto_26856 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26859 - BLOCK
      ?auto_26860 - BLOCK
      ?auto_26861 - BLOCK
      ?auto_26862 - BLOCK
    )
    :vars
    (
      ?auto_26864 - BLOCK
      ?auto_26863 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26859 ) ( not ( = ?auto_26859 ?auto_26860 ) ) ( not ( = ?auto_26859 ?auto_26861 ) ) ( not ( = ?auto_26859 ?auto_26862 ) ) ( not ( = ?auto_26859 ?auto_26864 ) ) ( not ( = ?auto_26860 ?auto_26861 ) ) ( not ( = ?auto_26860 ?auto_26862 ) ) ( not ( = ?auto_26860 ?auto_26864 ) ) ( not ( = ?auto_26861 ?auto_26862 ) ) ( not ( = ?auto_26861 ?auto_26864 ) ) ( not ( = ?auto_26862 ?auto_26864 ) ) ( ON ?auto_26864 ?auto_26863 ) ( not ( = ?auto_26859 ?auto_26863 ) ) ( not ( = ?auto_26860 ?auto_26863 ) ) ( not ( = ?auto_26861 ?auto_26863 ) ) ( not ( = ?auto_26862 ?auto_26863 ) ) ( not ( = ?auto_26864 ?auto_26863 ) ) ( ON ?auto_26862 ?auto_26864 ) ( ON-TABLE ?auto_26863 ) ( ON ?auto_26861 ?auto_26862 ) ( CLEAR ?auto_26859 ) ( ON ?auto_26860 ?auto_26861 ) ( CLEAR ?auto_26860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26863 ?auto_26864 ?auto_26862 ?auto_26861 )
      ( MAKE-4PILE ?auto_26859 ?auto_26860 ?auto_26861 ?auto_26862 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26865 - BLOCK
      ?auto_26866 - BLOCK
      ?auto_26867 - BLOCK
      ?auto_26868 - BLOCK
    )
    :vars
    (
      ?auto_26869 - BLOCK
      ?auto_26870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26865 ?auto_26866 ) ) ( not ( = ?auto_26865 ?auto_26867 ) ) ( not ( = ?auto_26865 ?auto_26868 ) ) ( not ( = ?auto_26865 ?auto_26869 ) ) ( not ( = ?auto_26866 ?auto_26867 ) ) ( not ( = ?auto_26866 ?auto_26868 ) ) ( not ( = ?auto_26866 ?auto_26869 ) ) ( not ( = ?auto_26867 ?auto_26868 ) ) ( not ( = ?auto_26867 ?auto_26869 ) ) ( not ( = ?auto_26868 ?auto_26869 ) ) ( ON ?auto_26869 ?auto_26870 ) ( not ( = ?auto_26865 ?auto_26870 ) ) ( not ( = ?auto_26866 ?auto_26870 ) ) ( not ( = ?auto_26867 ?auto_26870 ) ) ( not ( = ?auto_26868 ?auto_26870 ) ) ( not ( = ?auto_26869 ?auto_26870 ) ) ( ON ?auto_26868 ?auto_26869 ) ( ON-TABLE ?auto_26870 ) ( ON ?auto_26867 ?auto_26868 ) ( ON ?auto_26866 ?auto_26867 ) ( CLEAR ?auto_26866 ) ( HOLDING ?auto_26865 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26865 )
      ( MAKE-4PILE ?auto_26865 ?auto_26866 ?auto_26867 ?auto_26868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_26871 - BLOCK
      ?auto_26872 - BLOCK
      ?auto_26873 - BLOCK
      ?auto_26874 - BLOCK
    )
    :vars
    (
      ?auto_26876 - BLOCK
      ?auto_26875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26871 ?auto_26872 ) ) ( not ( = ?auto_26871 ?auto_26873 ) ) ( not ( = ?auto_26871 ?auto_26874 ) ) ( not ( = ?auto_26871 ?auto_26876 ) ) ( not ( = ?auto_26872 ?auto_26873 ) ) ( not ( = ?auto_26872 ?auto_26874 ) ) ( not ( = ?auto_26872 ?auto_26876 ) ) ( not ( = ?auto_26873 ?auto_26874 ) ) ( not ( = ?auto_26873 ?auto_26876 ) ) ( not ( = ?auto_26874 ?auto_26876 ) ) ( ON ?auto_26876 ?auto_26875 ) ( not ( = ?auto_26871 ?auto_26875 ) ) ( not ( = ?auto_26872 ?auto_26875 ) ) ( not ( = ?auto_26873 ?auto_26875 ) ) ( not ( = ?auto_26874 ?auto_26875 ) ) ( not ( = ?auto_26876 ?auto_26875 ) ) ( ON ?auto_26874 ?auto_26876 ) ( ON-TABLE ?auto_26875 ) ( ON ?auto_26873 ?auto_26874 ) ( ON ?auto_26872 ?auto_26873 ) ( ON ?auto_26871 ?auto_26872 ) ( CLEAR ?auto_26871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26875 ?auto_26876 ?auto_26874 ?auto_26873 ?auto_26872 )
      ( MAKE-4PILE ?auto_26871 ?auto_26872 ?auto_26873 ?auto_26874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26879 - BLOCK
    )
    :vars
    (
      ?auto_26880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26879 ?auto_26880 ) ( CLEAR ?auto_26879 ) ( HAND-EMPTY ) ( not ( = ?auto_26879 ?auto_26880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26879 ?auto_26880 )
      ( MAKE-1PILE ?auto_26879 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26881 - BLOCK
    )
    :vars
    (
      ?auto_26882 - BLOCK
      ?auto_26884 - BLOCK
      ?auto_26883 - BLOCK
      ?auto_26885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26881 ?auto_26882 ) ) ( HOLDING ?auto_26881 ) ( CLEAR ?auto_26882 ) ( ON-TABLE ?auto_26884 ) ( ON ?auto_26883 ?auto_26884 ) ( ON ?auto_26885 ?auto_26883 ) ( ON ?auto_26882 ?auto_26885 ) ( not ( = ?auto_26884 ?auto_26883 ) ) ( not ( = ?auto_26884 ?auto_26885 ) ) ( not ( = ?auto_26884 ?auto_26882 ) ) ( not ( = ?auto_26884 ?auto_26881 ) ) ( not ( = ?auto_26883 ?auto_26885 ) ) ( not ( = ?auto_26883 ?auto_26882 ) ) ( not ( = ?auto_26883 ?auto_26881 ) ) ( not ( = ?auto_26885 ?auto_26882 ) ) ( not ( = ?auto_26885 ?auto_26881 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26884 ?auto_26883 ?auto_26885 ?auto_26882 ?auto_26881 )
      ( MAKE-1PILE ?auto_26881 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26886 - BLOCK
    )
    :vars
    (
      ?auto_26889 - BLOCK
      ?auto_26890 - BLOCK
      ?auto_26888 - BLOCK
      ?auto_26887 - BLOCK
      ?auto_26891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26886 ?auto_26889 ) ) ( CLEAR ?auto_26889 ) ( ON-TABLE ?auto_26890 ) ( ON ?auto_26888 ?auto_26890 ) ( ON ?auto_26887 ?auto_26888 ) ( ON ?auto_26889 ?auto_26887 ) ( not ( = ?auto_26890 ?auto_26888 ) ) ( not ( = ?auto_26890 ?auto_26887 ) ) ( not ( = ?auto_26890 ?auto_26889 ) ) ( not ( = ?auto_26890 ?auto_26886 ) ) ( not ( = ?auto_26888 ?auto_26887 ) ) ( not ( = ?auto_26888 ?auto_26889 ) ) ( not ( = ?auto_26888 ?auto_26886 ) ) ( not ( = ?auto_26887 ?auto_26889 ) ) ( not ( = ?auto_26887 ?auto_26886 ) ) ( ON ?auto_26886 ?auto_26891 ) ( CLEAR ?auto_26886 ) ( HAND-EMPTY ) ( not ( = ?auto_26886 ?auto_26891 ) ) ( not ( = ?auto_26889 ?auto_26891 ) ) ( not ( = ?auto_26890 ?auto_26891 ) ) ( not ( = ?auto_26888 ?auto_26891 ) ) ( not ( = ?auto_26887 ?auto_26891 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26886 ?auto_26891 )
      ( MAKE-1PILE ?auto_26886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26892 - BLOCK
    )
    :vars
    (
      ?auto_26896 - BLOCK
      ?auto_26897 - BLOCK
      ?auto_26895 - BLOCK
      ?auto_26893 - BLOCK
      ?auto_26894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26892 ?auto_26896 ) ) ( ON-TABLE ?auto_26897 ) ( ON ?auto_26895 ?auto_26897 ) ( ON ?auto_26893 ?auto_26895 ) ( not ( = ?auto_26897 ?auto_26895 ) ) ( not ( = ?auto_26897 ?auto_26893 ) ) ( not ( = ?auto_26897 ?auto_26896 ) ) ( not ( = ?auto_26897 ?auto_26892 ) ) ( not ( = ?auto_26895 ?auto_26893 ) ) ( not ( = ?auto_26895 ?auto_26896 ) ) ( not ( = ?auto_26895 ?auto_26892 ) ) ( not ( = ?auto_26893 ?auto_26896 ) ) ( not ( = ?auto_26893 ?auto_26892 ) ) ( ON ?auto_26892 ?auto_26894 ) ( CLEAR ?auto_26892 ) ( not ( = ?auto_26892 ?auto_26894 ) ) ( not ( = ?auto_26896 ?auto_26894 ) ) ( not ( = ?auto_26897 ?auto_26894 ) ) ( not ( = ?auto_26895 ?auto_26894 ) ) ( not ( = ?auto_26893 ?auto_26894 ) ) ( HOLDING ?auto_26896 ) ( CLEAR ?auto_26893 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26897 ?auto_26895 ?auto_26893 ?auto_26896 )
      ( MAKE-1PILE ?auto_26892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26898 - BLOCK
    )
    :vars
    (
      ?auto_26903 - BLOCK
      ?auto_26900 - BLOCK
      ?auto_26902 - BLOCK
      ?auto_26901 - BLOCK
      ?auto_26899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26898 ?auto_26903 ) ) ( ON-TABLE ?auto_26900 ) ( ON ?auto_26902 ?auto_26900 ) ( ON ?auto_26901 ?auto_26902 ) ( not ( = ?auto_26900 ?auto_26902 ) ) ( not ( = ?auto_26900 ?auto_26901 ) ) ( not ( = ?auto_26900 ?auto_26903 ) ) ( not ( = ?auto_26900 ?auto_26898 ) ) ( not ( = ?auto_26902 ?auto_26901 ) ) ( not ( = ?auto_26902 ?auto_26903 ) ) ( not ( = ?auto_26902 ?auto_26898 ) ) ( not ( = ?auto_26901 ?auto_26903 ) ) ( not ( = ?auto_26901 ?auto_26898 ) ) ( ON ?auto_26898 ?auto_26899 ) ( not ( = ?auto_26898 ?auto_26899 ) ) ( not ( = ?auto_26903 ?auto_26899 ) ) ( not ( = ?auto_26900 ?auto_26899 ) ) ( not ( = ?auto_26902 ?auto_26899 ) ) ( not ( = ?auto_26901 ?auto_26899 ) ) ( CLEAR ?auto_26901 ) ( ON ?auto_26903 ?auto_26898 ) ( CLEAR ?auto_26903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26899 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26899 ?auto_26898 )
      ( MAKE-1PILE ?auto_26898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26904 - BLOCK
    )
    :vars
    (
      ?auto_26907 - BLOCK
      ?auto_26908 - BLOCK
      ?auto_26905 - BLOCK
      ?auto_26909 - BLOCK
      ?auto_26906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26904 ?auto_26907 ) ) ( ON-TABLE ?auto_26908 ) ( ON ?auto_26905 ?auto_26908 ) ( not ( = ?auto_26908 ?auto_26905 ) ) ( not ( = ?auto_26908 ?auto_26909 ) ) ( not ( = ?auto_26908 ?auto_26907 ) ) ( not ( = ?auto_26908 ?auto_26904 ) ) ( not ( = ?auto_26905 ?auto_26909 ) ) ( not ( = ?auto_26905 ?auto_26907 ) ) ( not ( = ?auto_26905 ?auto_26904 ) ) ( not ( = ?auto_26909 ?auto_26907 ) ) ( not ( = ?auto_26909 ?auto_26904 ) ) ( ON ?auto_26904 ?auto_26906 ) ( not ( = ?auto_26904 ?auto_26906 ) ) ( not ( = ?auto_26907 ?auto_26906 ) ) ( not ( = ?auto_26908 ?auto_26906 ) ) ( not ( = ?auto_26905 ?auto_26906 ) ) ( not ( = ?auto_26909 ?auto_26906 ) ) ( ON ?auto_26907 ?auto_26904 ) ( CLEAR ?auto_26907 ) ( ON-TABLE ?auto_26906 ) ( HOLDING ?auto_26909 ) ( CLEAR ?auto_26905 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26908 ?auto_26905 ?auto_26909 )
      ( MAKE-1PILE ?auto_26904 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26910 - BLOCK
    )
    :vars
    (
      ?auto_26915 - BLOCK
      ?auto_26913 - BLOCK
      ?auto_26911 - BLOCK
      ?auto_26914 - BLOCK
      ?auto_26912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26910 ?auto_26915 ) ) ( ON-TABLE ?auto_26913 ) ( ON ?auto_26911 ?auto_26913 ) ( not ( = ?auto_26913 ?auto_26911 ) ) ( not ( = ?auto_26913 ?auto_26914 ) ) ( not ( = ?auto_26913 ?auto_26915 ) ) ( not ( = ?auto_26913 ?auto_26910 ) ) ( not ( = ?auto_26911 ?auto_26914 ) ) ( not ( = ?auto_26911 ?auto_26915 ) ) ( not ( = ?auto_26911 ?auto_26910 ) ) ( not ( = ?auto_26914 ?auto_26915 ) ) ( not ( = ?auto_26914 ?auto_26910 ) ) ( ON ?auto_26910 ?auto_26912 ) ( not ( = ?auto_26910 ?auto_26912 ) ) ( not ( = ?auto_26915 ?auto_26912 ) ) ( not ( = ?auto_26913 ?auto_26912 ) ) ( not ( = ?auto_26911 ?auto_26912 ) ) ( not ( = ?auto_26914 ?auto_26912 ) ) ( ON ?auto_26915 ?auto_26910 ) ( ON-TABLE ?auto_26912 ) ( CLEAR ?auto_26911 ) ( ON ?auto_26914 ?auto_26915 ) ( CLEAR ?auto_26914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26912 ?auto_26910 ?auto_26915 )
      ( MAKE-1PILE ?auto_26910 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26916 - BLOCK
    )
    :vars
    (
      ?auto_26919 - BLOCK
      ?auto_26921 - BLOCK
      ?auto_26917 - BLOCK
      ?auto_26918 - BLOCK
      ?auto_26920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26916 ?auto_26919 ) ) ( ON-TABLE ?auto_26921 ) ( not ( = ?auto_26921 ?auto_26917 ) ) ( not ( = ?auto_26921 ?auto_26918 ) ) ( not ( = ?auto_26921 ?auto_26919 ) ) ( not ( = ?auto_26921 ?auto_26916 ) ) ( not ( = ?auto_26917 ?auto_26918 ) ) ( not ( = ?auto_26917 ?auto_26919 ) ) ( not ( = ?auto_26917 ?auto_26916 ) ) ( not ( = ?auto_26918 ?auto_26919 ) ) ( not ( = ?auto_26918 ?auto_26916 ) ) ( ON ?auto_26916 ?auto_26920 ) ( not ( = ?auto_26916 ?auto_26920 ) ) ( not ( = ?auto_26919 ?auto_26920 ) ) ( not ( = ?auto_26921 ?auto_26920 ) ) ( not ( = ?auto_26917 ?auto_26920 ) ) ( not ( = ?auto_26918 ?auto_26920 ) ) ( ON ?auto_26919 ?auto_26916 ) ( ON-TABLE ?auto_26920 ) ( ON ?auto_26918 ?auto_26919 ) ( CLEAR ?auto_26918 ) ( HOLDING ?auto_26917 ) ( CLEAR ?auto_26921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26921 ?auto_26917 )
      ( MAKE-1PILE ?auto_26916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26922 - BLOCK
    )
    :vars
    (
      ?auto_26925 - BLOCK
      ?auto_26926 - BLOCK
      ?auto_26924 - BLOCK
      ?auto_26923 - BLOCK
      ?auto_26927 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26922 ?auto_26925 ) ) ( ON-TABLE ?auto_26926 ) ( not ( = ?auto_26926 ?auto_26924 ) ) ( not ( = ?auto_26926 ?auto_26923 ) ) ( not ( = ?auto_26926 ?auto_26925 ) ) ( not ( = ?auto_26926 ?auto_26922 ) ) ( not ( = ?auto_26924 ?auto_26923 ) ) ( not ( = ?auto_26924 ?auto_26925 ) ) ( not ( = ?auto_26924 ?auto_26922 ) ) ( not ( = ?auto_26923 ?auto_26925 ) ) ( not ( = ?auto_26923 ?auto_26922 ) ) ( ON ?auto_26922 ?auto_26927 ) ( not ( = ?auto_26922 ?auto_26927 ) ) ( not ( = ?auto_26925 ?auto_26927 ) ) ( not ( = ?auto_26926 ?auto_26927 ) ) ( not ( = ?auto_26924 ?auto_26927 ) ) ( not ( = ?auto_26923 ?auto_26927 ) ) ( ON ?auto_26925 ?auto_26922 ) ( ON-TABLE ?auto_26927 ) ( ON ?auto_26923 ?auto_26925 ) ( CLEAR ?auto_26926 ) ( ON ?auto_26924 ?auto_26923 ) ( CLEAR ?auto_26924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26927 ?auto_26922 ?auto_26925 ?auto_26923 )
      ( MAKE-1PILE ?auto_26922 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26928 - BLOCK
    )
    :vars
    (
      ?auto_26933 - BLOCK
      ?auto_26929 - BLOCK
      ?auto_26930 - BLOCK
      ?auto_26931 - BLOCK
      ?auto_26932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26928 ?auto_26933 ) ) ( not ( = ?auto_26929 ?auto_26930 ) ) ( not ( = ?auto_26929 ?auto_26931 ) ) ( not ( = ?auto_26929 ?auto_26933 ) ) ( not ( = ?auto_26929 ?auto_26928 ) ) ( not ( = ?auto_26930 ?auto_26931 ) ) ( not ( = ?auto_26930 ?auto_26933 ) ) ( not ( = ?auto_26930 ?auto_26928 ) ) ( not ( = ?auto_26931 ?auto_26933 ) ) ( not ( = ?auto_26931 ?auto_26928 ) ) ( ON ?auto_26928 ?auto_26932 ) ( not ( = ?auto_26928 ?auto_26932 ) ) ( not ( = ?auto_26933 ?auto_26932 ) ) ( not ( = ?auto_26929 ?auto_26932 ) ) ( not ( = ?auto_26930 ?auto_26932 ) ) ( not ( = ?auto_26931 ?auto_26932 ) ) ( ON ?auto_26933 ?auto_26928 ) ( ON-TABLE ?auto_26932 ) ( ON ?auto_26931 ?auto_26933 ) ( ON ?auto_26930 ?auto_26931 ) ( CLEAR ?auto_26930 ) ( HOLDING ?auto_26929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_26929 )
      ( MAKE-1PILE ?auto_26928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_26934 - BLOCK
    )
    :vars
    (
      ?auto_26936 - BLOCK
      ?auto_26937 - BLOCK
      ?auto_26938 - BLOCK
      ?auto_26939 - BLOCK
      ?auto_26935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26934 ?auto_26936 ) ) ( not ( = ?auto_26937 ?auto_26938 ) ) ( not ( = ?auto_26937 ?auto_26939 ) ) ( not ( = ?auto_26937 ?auto_26936 ) ) ( not ( = ?auto_26937 ?auto_26934 ) ) ( not ( = ?auto_26938 ?auto_26939 ) ) ( not ( = ?auto_26938 ?auto_26936 ) ) ( not ( = ?auto_26938 ?auto_26934 ) ) ( not ( = ?auto_26939 ?auto_26936 ) ) ( not ( = ?auto_26939 ?auto_26934 ) ) ( ON ?auto_26934 ?auto_26935 ) ( not ( = ?auto_26934 ?auto_26935 ) ) ( not ( = ?auto_26936 ?auto_26935 ) ) ( not ( = ?auto_26937 ?auto_26935 ) ) ( not ( = ?auto_26938 ?auto_26935 ) ) ( not ( = ?auto_26939 ?auto_26935 ) ) ( ON ?auto_26936 ?auto_26934 ) ( ON-TABLE ?auto_26935 ) ( ON ?auto_26939 ?auto_26936 ) ( ON ?auto_26938 ?auto_26939 ) ( ON ?auto_26937 ?auto_26938 ) ( CLEAR ?auto_26937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26935 ?auto_26934 ?auto_26936 ?auto_26939 ?auto_26938 )
      ( MAKE-1PILE ?auto_26934 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26943 - BLOCK
      ?auto_26944 - BLOCK
      ?auto_26945 - BLOCK
    )
    :vars
    (
      ?auto_26946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26946 ?auto_26945 ) ( CLEAR ?auto_26946 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26943 ) ( ON ?auto_26944 ?auto_26943 ) ( ON ?auto_26945 ?auto_26944 ) ( not ( = ?auto_26943 ?auto_26944 ) ) ( not ( = ?auto_26943 ?auto_26945 ) ) ( not ( = ?auto_26943 ?auto_26946 ) ) ( not ( = ?auto_26944 ?auto_26945 ) ) ( not ( = ?auto_26944 ?auto_26946 ) ) ( not ( = ?auto_26945 ?auto_26946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26946 ?auto_26945 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26947 - BLOCK
      ?auto_26948 - BLOCK
      ?auto_26949 - BLOCK
    )
    :vars
    (
      ?auto_26950 - BLOCK
      ?auto_26951 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26950 ?auto_26949 ) ( CLEAR ?auto_26950 ) ( ON-TABLE ?auto_26947 ) ( ON ?auto_26948 ?auto_26947 ) ( ON ?auto_26949 ?auto_26948 ) ( not ( = ?auto_26947 ?auto_26948 ) ) ( not ( = ?auto_26947 ?auto_26949 ) ) ( not ( = ?auto_26947 ?auto_26950 ) ) ( not ( = ?auto_26948 ?auto_26949 ) ) ( not ( = ?auto_26948 ?auto_26950 ) ) ( not ( = ?auto_26949 ?auto_26950 ) ) ( HOLDING ?auto_26951 ) ( not ( = ?auto_26947 ?auto_26951 ) ) ( not ( = ?auto_26948 ?auto_26951 ) ) ( not ( = ?auto_26949 ?auto_26951 ) ) ( not ( = ?auto_26950 ?auto_26951 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_26951 )
      ( MAKE-3PILE ?auto_26947 ?auto_26948 ?auto_26949 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26952 - BLOCK
      ?auto_26953 - BLOCK
      ?auto_26954 - BLOCK
    )
    :vars
    (
      ?auto_26955 - BLOCK
      ?auto_26956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26955 ?auto_26954 ) ( ON-TABLE ?auto_26952 ) ( ON ?auto_26953 ?auto_26952 ) ( ON ?auto_26954 ?auto_26953 ) ( not ( = ?auto_26952 ?auto_26953 ) ) ( not ( = ?auto_26952 ?auto_26954 ) ) ( not ( = ?auto_26952 ?auto_26955 ) ) ( not ( = ?auto_26953 ?auto_26954 ) ) ( not ( = ?auto_26953 ?auto_26955 ) ) ( not ( = ?auto_26954 ?auto_26955 ) ) ( not ( = ?auto_26952 ?auto_26956 ) ) ( not ( = ?auto_26953 ?auto_26956 ) ) ( not ( = ?auto_26954 ?auto_26956 ) ) ( not ( = ?auto_26955 ?auto_26956 ) ) ( ON ?auto_26956 ?auto_26955 ) ( CLEAR ?auto_26956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26952 ?auto_26953 ?auto_26954 ?auto_26955 )
      ( MAKE-3PILE ?auto_26952 ?auto_26953 ?auto_26954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26957 - BLOCK
      ?auto_26958 - BLOCK
      ?auto_26959 - BLOCK
    )
    :vars
    (
      ?auto_26961 - BLOCK
      ?auto_26960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26961 ?auto_26959 ) ( ON-TABLE ?auto_26957 ) ( ON ?auto_26958 ?auto_26957 ) ( ON ?auto_26959 ?auto_26958 ) ( not ( = ?auto_26957 ?auto_26958 ) ) ( not ( = ?auto_26957 ?auto_26959 ) ) ( not ( = ?auto_26957 ?auto_26961 ) ) ( not ( = ?auto_26958 ?auto_26959 ) ) ( not ( = ?auto_26958 ?auto_26961 ) ) ( not ( = ?auto_26959 ?auto_26961 ) ) ( not ( = ?auto_26957 ?auto_26960 ) ) ( not ( = ?auto_26958 ?auto_26960 ) ) ( not ( = ?auto_26959 ?auto_26960 ) ) ( not ( = ?auto_26961 ?auto_26960 ) ) ( HOLDING ?auto_26960 ) ( CLEAR ?auto_26961 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_26957 ?auto_26958 ?auto_26959 ?auto_26961 ?auto_26960 )
      ( MAKE-3PILE ?auto_26957 ?auto_26958 ?auto_26959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26962 - BLOCK
      ?auto_26963 - BLOCK
      ?auto_26964 - BLOCK
    )
    :vars
    (
      ?auto_26965 - BLOCK
      ?auto_26966 - BLOCK
      ?auto_26967 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_26965 ?auto_26964 ) ( ON-TABLE ?auto_26962 ) ( ON ?auto_26963 ?auto_26962 ) ( ON ?auto_26964 ?auto_26963 ) ( not ( = ?auto_26962 ?auto_26963 ) ) ( not ( = ?auto_26962 ?auto_26964 ) ) ( not ( = ?auto_26962 ?auto_26965 ) ) ( not ( = ?auto_26963 ?auto_26964 ) ) ( not ( = ?auto_26963 ?auto_26965 ) ) ( not ( = ?auto_26964 ?auto_26965 ) ) ( not ( = ?auto_26962 ?auto_26966 ) ) ( not ( = ?auto_26963 ?auto_26966 ) ) ( not ( = ?auto_26964 ?auto_26966 ) ) ( not ( = ?auto_26965 ?auto_26966 ) ) ( CLEAR ?auto_26965 ) ( ON ?auto_26966 ?auto_26967 ) ( CLEAR ?auto_26966 ) ( HAND-EMPTY ) ( not ( = ?auto_26962 ?auto_26967 ) ) ( not ( = ?auto_26963 ?auto_26967 ) ) ( not ( = ?auto_26964 ?auto_26967 ) ) ( not ( = ?auto_26965 ?auto_26967 ) ) ( not ( = ?auto_26966 ?auto_26967 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_26966 ?auto_26967 )
      ( MAKE-3PILE ?auto_26962 ?auto_26963 ?auto_26964 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26980 - BLOCK
      ?auto_26981 - BLOCK
      ?auto_26982 - BLOCK
    )
    :vars
    (
      ?auto_26983 - BLOCK
      ?auto_26984 - BLOCK
      ?auto_26985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26980 ) ( ON ?auto_26981 ?auto_26980 ) ( not ( = ?auto_26980 ?auto_26981 ) ) ( not ( = ?auto_26980 ?auto_26982 ) ) ( not ( = ?auto_26980 ?auto_26983 ) ) ( not ( = ?auto_26981 ?auto_26982 ) ) ( not ( = ?auto_26981 ?auto_26983 ) ) ( not ( = ?auto_26982 ?auto_26983 ) ) ( not ( = ?auto_26980 ?auto_26984 ) ) ( not ( = ?auto_26981 ?auto_26984 ) ) ( not ( = ?auto_26982 ?auto_26984 ) ) ( not ( = ?auto_26983 ?auto_26984 ) ) ( ON ?auto_26984 ?auto_26985 ) ( not ( = ?auto_26980 ?auto_26985 ) ) ( not ( = ?auto_26981 ?auto_26985 ) ) ( not ( = ?auto_26982 ?auto_26985 ) ) ( not ( = ?auto_26983 ?auto_26985 ) ) ( not ( = ?auto_26984 ?auto_26985 ) ) ( ON ?auto_26983 ?auto_26984 ) ( CLEAR ?auto_26983 ) ( HOLDING ?auto_26982 ) ( CLEAR ?auto_26981 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_26980 ?auto_26981 ?auto_26982 ?auto_26983 )
      ( MAKE-3PILE ?auto_26980 ?auto_26981 ?auto_26982 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26986 - BLOCK
      ?auto_26987 - BLOCK
      ?auto_26988 - BLOCK
    )
    :vars
    (
      ?auto_26989 - BLOCK
      ?auto_26991 - BLOCK
      ?auto_26990 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26986 ) ( ON ?auto_26987 ?auto_26986 ) ( not ( = ?auto_26986 ?auto_26987 ) ) ( not ( = ?auto_26986 ?auto_26988 ) ) ( not ( = ?auto_26986 ?auto_26989 ) ) ( not ( = ?auto_26987 ?auto_26988 ) ) ( not ( = ?auto_26987 ?auto_26989 ) ) ( not ( = ?auto_26988 ?auto_26989 ) ) ( not ( = ?auto_26986 ?auto_26991 ) ) ( not ( = ?auto_26987 ?auto_26991 ) ) ( not ( = ?auto_26988 ?auto_26991 ) ) ( not ( = ?auto_26989 ?auto_26991 ) ) ( ON ?auto_26991 ?auto_26990 ) ( not ( = ?auto_26986 ?auto_26990 ) ) ( not ( = ?auto_26987 ?auto_26990 ) ) ( not ( = ?auto_26988 ?auto_26990 ) ) ( not ( = ?auto_26989 ?auto_26990 ) ) ( not ( = ?auto_26991 ?auto_26990 ) ) ( ON ?auto_26989 ?auto_26991 ) ( CLEAR ?auto_26987 ) ( ON ?auto_26988 ?auto_26989 ) ( CLEAR ?auto_26988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_26990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_26990 ?auto_26991 ?auto_26989 )
      ( MAKE-3PILE ?auto_26986 ?auto_26987 ?auto_26988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26992 - BLOCK
      ?auto_26993 - BLOCK
      ?auto_26994 - BLOCK
    )
    :vars
    (
      ?auto_26996 - BLOCK
      ?auto_26995 - BLOCK
      ?auto_26997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26992 ) ( not ( = ?auto_26992 ?auto_26993 ) ) ( not ( = ?auto_26992 ?auto_26994 ) ) ( not ( = ?auto_26992 ?auto_26996 ) ) ( not ( = ?auto_26993 ?auto_26994 ) ) ( not ( = ?auto_26993 ?auto_26996 ) ) ( not ( = ?auto_26994 ?auto_26996 ) ) ( not ( = ?auto_26992 ?auto_26995 ) ) ( not ( = ?auto_26993 ?auto_26995 ) ) ( not ( = ?auto_26994 ?auto_26995 ) ) ( not ( = ?auto_26996 ?auto_26995 ) ) ( ON ?auto_26995 ?auto_26997 ) ( not ( = ?auto_26992 ?auto_26997 ) ) ( not ( = ?auto_26993 ?auto_26997 ) ) ( not ( = ?auto_26994 ?auto_26997 ) ) ( not ( = ?auto_26996 ?auto_26997 ) ) ( not ( = ?auto_26995 ?auto_26997 ) ) ( ON ?auto_26996 ?auto_26995 ) ( ON ?auto_26994 ?auto_26996 ) ( CLEAR ?auto_26994 ) ( ON-TABLE ?auto_26997 ) ( HOLDING ?auto_26993 ) ( CLEAR ?auto_26992 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_26992 ?auto_26993 )
      ( MAKE-3PILE ?auto_26992 ?auto_26993 ?auto_26994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_26998 - BLOCK
      ?auto_26999 - BLOCK
      ?auto_27000 - BLOCK
    )
    :vars
    (
      ?auto_27001 - BLOCK
      ?auto_27002 - BLOCK
      ?auto_27003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_26998 ) ( not ( = ?auto_26998 ?auto_26999 ) ) ( not ( = ?auto_26998 ?auto_27000 ) ) ( not ( = ?auto_26998 ?auto_27001 ) ) ( not ( = ?auto_26999 ?auto_27000 ) ) ( not ( = ?auto_26999 ?auto_27001 ) ) ( not ( = ?auto_27000 ?auto_27001 ) ) ( not ( = ?auto_26998 ?auto_27002 ) ) ( not ( = ?auto_26999 ?auto_27002 ) ) ( not ( = ?auto_27000 ?auto_27002 ) ) ( not ( = ?auto_27001 ?auto_27002 ) ) ( ON ?auto_27002 ?auto_27003 ) ( not ( = ?auto_26998 ?auto_27003 ) ) ( not ( = ?auto_26999 ?auto_27003 ) ) ( not ( = ?auto_27000 ?auto_27003 ) ) ( not ( = ?auto_27001 ?auto_27003 ) ) ( not ( = ?auto_27002 ?auto_27003 ) ) ( ON ?auto_27001 ?auto_27002 ) ( ON ?auto_27000 ?auto_27001 ) ( ON-TABLE ?auto_27003 ) ( CLEAR ?auto_26998 ) ( ON ?auto_26999 ?auto_27000 ) ( CLEAR ?auto_26999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27003 ?auto_27002 ?auto_27001 ?auto_27000 )
      ( MAKE-3PILE ?auto_26998 ?auto_26999 ?auto_27000 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27004 - BLOCK
      ?auto_27005 - BLOCK
      ?auto_27006 - BLOCK
    )
    :vars
    (
      ?auto_27008 - BLOCK
      ?auto_27009 - BLOCK
      ?auto_27007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27004 ?auto_27005 ) ) ( not ( = ?auto_27004 ?auto_27006 ) ) ( not ( = ?auto_27004 ?auto_27008 ) ) ( not ( = ?auto_27005 ?auto_27006 ) ) ( not ( = ?auto_27005 ?auto_27008 ) ) ( not ( = ?auto_27006 ?auto_27008 ) ) ( not ( = ?auto_27004 ?auto_27009 ) ) ( not ( = ?auto_27005 ?auto_27009 ) ) ( not ( = ?auto_27006 ?auto_27009 ) ) ( not ( = ?auto_27008 ?auto_27009 ) ) ( ON ?auto_27009 ?auto_27007 ) ( not ( = ?auto_27004 ?auto_27007 ) ) ( not ( = ?auto_27005 ?auto_27007 ) ) ( not ( = ?auto_27006 ?auto_27007 ) ) ( not ( = ?auto_27008 ?auto_27007 ) ) ( not ( = ?auto_27009 ?auto_27007 ) ) ( ON ?auto_27008 ?auto_27009 ) ( ON ?auto_27006 ?auto_27008 ) ( ON-TABLE ?auto_27007 ) ( ON ?auto_27005 ?auto_27006 ) ( CLEAR ?auto_27005 ) ( HOLDING ?auto_27004 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27004 )
      ( MAKE-3PILE ?auto_27004 ?auto_27005 ?auto_27006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27010 - BLOCK
      ?auto_27011 - BLOCK
      ?auto_27012 - BLOCK
    )
    :vars
    (
      ?auto_27015 - BLOCK
      ?auto_27014 - BLOCK
      ?auto_27013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27010 ?auto_27011 ) ) ( not ( = ?auto_27010 ?auto_27012 ) ) ( not ( = ?auto_27010 ?auto_27015 ) ) ( not ( = ?auto_27011 ?auto_27012 ) ) ( not ( = ?auto_27011 ?auto_27015 ) ) ( not ( = ?auto_27012 ?auto_27015 ) ) ( not ( = ?auto_27010 ?auto_27014 ) ) ( not ( = ?auto_27011 ?auto_27014 ) ) ( not ( = ?auto_27012 ?auto_27014 ) ) ( not ( = ?auto_27015 ?auto_27014 ) ) ( ON ?auto_27014 ?auto_27013 ) ( not ( = ?auto_27010 ?auto_27013 ) ) ( not ( = ?auto_27011 ?auto_27013 ) ) ( not ( = ?auto_27012 ?auto_27013 ) ) ( not ( = ?auto_27015 ?auto_27013 ) ) ( not ( = ?auto_27014 ?auto_27013 ) ) ( ON ?auto_27015 ?auto_27014 ) ( ON ?auto_27012 ?auto_27015 ) ( ON-TABLE ?auto_27013 ) ( ON ?auto_27011 ?auto_27012 ) ( ON ?auto_27010 ?auto_27011 ) ( CLEAR ?auto_27010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27013 ?auto_27014 ?auto_27015 ?auto_27012 ?auto_27011 )
      ( MAKE-3PILE ?auto_27010 ?auto_27011 ?auto_27012 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27018 - BLOCK
      ?auto_27019 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27019 ) ( CLEAR ?auto_27018 ) ( ON-TABLE ?auto_27018 ) ( not ( = ?auto_27018 ?auto_27019 ) ) )
    :subtasks
    ( ( !STACK ?auto_27019 ?auto_27018 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27020 - BLOCK
      ?auto_27021 - BLOCK
    )
    :vars
    (
      ?auto_27022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27020 ) ( ON-TABLE ?auto_27020 ) ( not ( = ?auto_27020 ?auto_27021 ) ) ( ON ?auto_27021 ?auto_27022 ) ( CLEAR ?auto_27021 ) ( HAND-EMPTY ) ( not ( = ?auto_27020 ?auto_27022 ) ) ( not ( = ?auto_27021 ?auto_27022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27021 ?auto_27022 )
      ( MAKE-2PILE ?auto_27020 ?auto_27021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27023 - BLOCK
      ?auto_27024 - BLOCK
    )
    :vars
    (
      ?auto_27025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27023 ?auto_27024 ) ) ( ON ?auto_27024 ?auto_27025 ) ( CLEAR ?auto_27024 ) ( not ( = ?auto_27023 ?auto_27025 ) ) ( not ( = ?auto_27024 ?auto_27025 ) ) ( HOLDING ?auto_27023 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27023 )
      ( MAKE-2PILE ?auto_27023 ?auto_27024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27026 - BLOCK
      ?auto_27027 - BLOCK
    )
    :vars
    (
      ?auto_27028 - BLOCK
      ?auto_27029 - BLOCK
      ?auto_27030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27026 ?auto_27027 ) ) ( ON ?auto_27027 ?auto_27028 ) ( not ( = ?auto_27026 ?auto_27028 ) ) ( not ( = ?auto_27027 ?auto_27028 ) ) ( ON ?auto_27026 ?auto_27027 ) ( CLEAR ?auto_27026 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27029 ) ( ON ?auto_27030 ?auto_27029 ) ( ON ?auto_27028 ?auto_27030 ) ( not ( = ?auto_27029 ?auto_27030 ) ) ( not ( = ?auto_27029 ?auto_27028 ) ) ( not ( = ?auto_27029 ?auto_27027 ) ) ( not ( = ?auto_27029 ?auto_27026 ) ) ( not ( = ?auto_27030 ?auto_27028 ) ) ( not ( = ?auto_27030 ?auto_27027 ) ) ( not ( = ?auto_27030 ?auto_27026 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27029 ?auto_27030 ?auto_27028 ?auto_27027 )
      ( MAKE-2PILE ?auto_27026 ?auto_27027 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27031 - BLOCK
      ?auto_27032 - BLOCK
    )
    :vars
    (
      ?auto_27033 - BLOCK
      ?auto_27034 - BLOCK
      ?auto_27035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27031 ?auto_27032 ) ) ( ON ?auto_27032 ?auto_27033 ) ( not ( = ?auto_27031 ?auto_27033 ) ) ( not ( = ?auto_27032 ?auto_27033 ) ) ( ON-TABLE ?auto_27034 ) ( ON ?auto_27035 ?auto_27034 ) ( ON ?auto_27033 ?auto_27035 ) ( not ( = ?auto_27034 ?auto_27035 ) ) ( not ( = ?auto_27034 ?auto_27033 ) ) ( not ( = ?auto_27034 ?auto_27032 ) ) ( not ( = ?auto_27034 ?auto_27031 ) ) ( not ( = ?auto_27035 ?auto_27033 ) ) ( not ( = ?auto_27035 ?auto_27032 ) ) ( not ( = ?auto_27035 ?auto_27031 ) ) ( HOLDING ?auto_27031 ) ( CLEAR ?auto_27032 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27034 ?auto_27035 ?auto_27033 ?auto_27032 ?auto_27031 )
      ( MAKE-2PILE ?auto_27031 ?auto_27032 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27036 - BLOCK
      ?auto_27037 - BLOCK
    )
    :vars
    (
      ?auto_27039 - BLOCK
      ?auto_27038 - BLOCK
      ?auto_27040 - BLOCK
      ?auto_27041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27036 ?auto_27037 ) ) ( ON ?auto_27037 ?auto_27039 ) ( not ( = ?auto_27036 ?auto_27039 ) ) ( not ( = ?auto_27037 ?auto_27039 ) ) ( ON-TABLE ?auto_27038 ) ( ON ?auto_27040 ?auto_27038 ) ( ON ?auto_27039 ?auto_27040 ) ( not ( = ?auto_27038 ?auto_27040 ) ) ( not ( = ?auto_27038 ?auto_27039 ) ) ( not ( = ?auto_27038 ?auto_27037 ) ) ( not ( = ?auto_27038 ?auto_27036 ) ) ( not ( = ?auto_27040 ?auto_27039 ) ) ( not ( = ?auto_27040 ?auto_27037 ) ) ( not ( = ?auto_27040 ?auto_27036 ) ) ( CLEAR ?auto_27037 ) ( ON ?auto_27036 ?auto_27041 ) ( CLEAR ?auto_27036 ) ( HAND-EMPTY ) ( not ( = ?auto_27036 ?auto_27041 ) ) ( not ( = ?auto_27037 ?auto_27041 ) ) ( not ( = ?auto_27039 ?auto_27041 ) ) ( not ( = ?auto_27038 ?auto_27041 ) ) ( not ( = ?auto_27040 ?auto_27041 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27036 ?auto_27041 )
      ( MAKE-2PILE ?auto_27036 ?auto_27037 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27042 - BLOCK
      ?auto_27043 - BLOCK
    )
    :vars
    (
      ?auto_27044 - BLOCK
      ?auto_27045 - BLOCK
      ?auto_27046 - BLOCK
      ?auto_27047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27042 ?auto_27043 ) ) ( not ( = ?auto_27042 ?auto_27044 ) ) ( not ( = ?auto_27043 ?auto_27044 ) ) ( ON-TABLE ?auto_27045 ) ( ON ?auto_27046 ?auto_27045 ) ( ON ?auto_27044 ?auto_27046 ) ( not ( = ?auto_27045 ?auto_27046 ) ) ( not ( = ?auto_27045 ?auto_27044 ) ) ( not ( = ?auto_27045 ?auto_27043 ) ) ( not ( = ?auto_27045 ?auto_27042 ) ) ( not ( = ?auto_27046 ?auto_27044 ) ) ( not ( = ?auto_27046 ?auto_27043 ) ) ( not ( = ?auto_27046 ?auto_27042 ) ) ( ON ?auto_27042 ?auto_27047 ) ( CLEAR ?auto_27042 ) ( not ( = ?auto_27042 ?auto_27047 ) ) ( not ( = ?auto_27043 ?auto_27047 ) ) ( not ( = ?auto_27044 ?auto_27047 ) ) ( not ( = ?auto_27045 ?auto_27047 ) ) ( not ( = ?auto_27046 ?auto_27047 ) ) ( HOLDING ?auto_27043 ) ( CLEAR ?auto_27044 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27045 ?auto_27046 ?auto_27044 ?auto_27043 )
      ( MAKE-2PILE ?auto_27042 ?auto_27043 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27048 - BLOCK
      ?auto_27049 - BLOCK
    )
    :vars
    (
      ?auto_27051 - BLOCK
      ?auto_27050 - BLOCK
      ?auto_27053 - BLOCK
      ?auto_27052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27048 ?auto_27049 ) ) ( not ( = ?auto_27048 ?auto_27051 ) ) ( not ( = ?auto_27049 ?auto_27051 ) ) ( ON-TABLE ?auto_27050 ) ( ON ?auto_27053 ?auto_27050 ) ( ON ?auto_27051 ?auto_27053 ) ( not ( = ?auto_27050 ?auto_27053 ) ) ( not ( = ?auto_27050 ?auto_27051 ) ) ( not ( = ?auto_27050 ?auto_27049 ) ) ( not ( = ?auto_27050 ?auto_27048 ) ) ( not ( = ?auto_27053 ?auto_27051 ) ) ( not ( = ?auto_27053 ?auto_27049 ) ) ( not ( = ?auto_27053 ?auto_27048 ) ) ( ON ?auto_27048 ?auto_27052 ) ( not ( = ?auto_27048 ?auto_27052 ) ) ( not ( = ?auto_27049 ?auto_27052 ) ) ( not ( = ?auto_27051 ?auto_27052 ) ) ( not ( = ?auto_27050 ?auto_27052 ) ) ( not ( = ?auto_27053 ?auto_27052 ) ) ( CLEAR ?auto_27051 ) ( ON ?auto_27049 ?auto_27048 ) ( CLEAR ?auto_27049 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27052 ?auto_27048 )
      ( MAKE-2PILE ?auto_27048 ?auto_27049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27054 - BLOCK
      ?auto_27055 - BLOCK
    )
    :vars
    (
      ?auto_27056 - BLOCK
      ?auto_27058 - BLOCK
      ?auto_27057 - BLOCK
      ?auto_27059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27054 ?auto_27055 ) ) ( not ( = ?auto_27054 ?auto_27056 ) ) ( not ( = ?auto_27055 ?auto_27056 ) ) ( ON-TABLE ?auto_27058 ) ( ON ?auto_27057 ?auto_27058 ) ( not ( = ?auto_27058 ?auto_27057 ) ) ( not ( = ?auto_27058 ?auto_27056 ) ) ( not ( = ?auto_27058 ?auto_27055 ) ) ( not ( = ?auto_27058 ?auto_27054 ) ) ( not ( = ?auto_27057 ?auto_27056 ) ) ( not ( = ?auto_27057 ?auto_27055 ) ) ( not ( = ?auto_27057 ?auto_27054 ) ) ( ON ?auto_27054 ?auto_27059 ) ( not ( = ?auto_27054 ?auto_27059 ) ) ( not ( = ?auto_27055 ?auto_27059 ) ) ( not ( = ?auto_27056 ?auto_27059 ) ) ( not ( = ?auto_27058 ?auto_27059 ) ) ( not ( = ?auto_27057 ?auto_27059 ) ) ( ON ?auto_27055 ?auto_27054 ) ( CLEAR ?auto_27055 ) ( ON-TABLE ?auto_27059 ) ( HOLDING ?auto_27056 ) ( CLEAR ?auto_27057 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27058 ?auto_27057 ?auto_27056 )
      ( MAKE-2PILE ?auto_27054 ?auto_27055 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27060 - BLOCK
      ?auto_27061 - BLOCK
    )
    :vars
    (
      ?auto_27065 - BLOCK
      ?auto_27064 - BLOCK
      ?auto_27063 - BLOCK
      ?auto_27062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27060 ?auto_27061 ) ) ( not ( = ?auto_27060 ?auto_27065 ) ) ( not ( = ?auto_27061 ?auto_27065 ) ) ( ON-TABLE ?auto_27064 ) ( ON ?auto_27063 ?auto_27064 ) ( not ( = ?auto_27064 ?auto_27063 ) ) ( not ( = ?auto_27064 ?auto_27065 ) ) ( not ( = ?auto_27064 ?auto_27061 ) ) ( not ( = ?auto_27064 ?auto_27060 ) ) ( not ( = ?auto_27063 ?auto_27065 ) ) ( not ( = ?auto_27063 ?auto_27061 ) ) ( not ( = ?auto_27063 ?auto_27060 ) ) ( ON ?auto_27060 ?auto_27062 ) ( not ( = ?auto_27060 ?auto_27062 ) ) ( not ( = ?auto_27061 ?auto_27062 ) ) ( not ( = ?auto_27065 ?auto_27062 ) ) ( not ( = ?auto_27064 ?auto_27062 ) ) ( not ( = ?auto_27063 ?auto_27062 ) ) ( ON ?auto_27061 ?auto_27060 ) ( ON-TABLE ?auto_27062 ) ( CLEAR ?auto_27063 ) ( ON ?auto_27065 ?auto_27061 ) ( CLEAR ?auto_27065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27062 ?auto_27060 ?auto_27061 )
      ( MAKE-2PILE ?auto_27060 ?auto_27061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27066 - BLOCK
      ?auto_27067 - BLOCK
    )
    :vars
    (
      ?auto_27071 - BLOCK
      ?auto_27068 - BLOCK
      ?auto_27069 - BLOCK
      ?auto_27070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27066 ?auto_27067 ) ) ( not ( = ?auto_27066 ?auto_27071 ) ) ( not ( = ?auto_27067 ?auto_27071 ) ) ( ON-TABLE ?auto_27068 ) ( not ( = ?auto_27068 ?auto_27069 ) ) ( not ( = ?auto_27068 ?auto_27071 ) ) ( not ( = ?auto_27068 ?auto_27067 ) ) ( not ( = ?auto_27068 ?auto_27066 ) ) ( not ( = ?auto_27069 ?auto_27071 ) ) ( not ( = ?auto_27069 ?auto_27067 ) ) ( not ( = ?auto_27069 ?auto_27066 ) ) ( ON ?auto_27066 ?auto_27070 ) ( not ( = ?auto_27066 ?auto_27070 ) ) ( not ( = ?auto_27067 ?auto_27070 ) ) ( not ( = ?auto_27071 ?auto_27070 ) ) ( not ( = ?auto_27068 ?auto_27070 ) ) ( not ( = ?auto_27069 ?auto_27070 ) ) ( ON ?auto_27067 ?auto_27066 ) ( ON-TABLE ?auto_27070 ) ( ON ?auto_27071 ?auto_27067 ) ( CLEAR ?auto_27071 ) ( HOLDING ?auto_27069 ) ( CLEAR ?auto_27068 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27068 ?auto_27069 )
      ( MAKE-2PILE ?auto_27066 ?auto_27067 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27072 - BLOCK
      ?auto_27073 - BLOCK
    )
    :vars
    (
      ?auto_27077 - BLOCK
      ?auto_27076 - BLOCK
      ?auto_27075 - BLOCK
      ?auto_27074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27072 ?auto_27073 ) ) ( not ( = ?auto_27072 ?auto_27077 ) ) ( not ( = ?auto_27073 ?auto_27077 ) ) ( ON-TABLE ?auto_27076 ) ( not ( = ?auto_27076 ?auto_27075 ) ) ( not ( = ?auto_27076 ?auto_27077 ) ) ( not ( = ?auto_27076 ?auto_27073 ) ) ( not ( = ?auto_27076 ?auto_27072 ) ) ( not ( = ?auto_27075 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27073 ) ) ( not ( = ?auto_27075 ?auto_27072 ) ) ( ON ?auto_27072 ?auto_27074 ) ( not ( = ?auto_27072 ?auto_27074 ) ) ( not ( = ?auto_27073 ?auto_27074 ) ) ( not ( = ?auto_27077 ?auto_27074 ) ) ( not ( = ?auto_27076 ?auto_27074 ) ) ( not ( = ?auto_27075 ?auto_27074 ) ) ( ON ?auto_27073 ?auto_27072 ) ( ON-TABLE ?auto_27074 ) ( ON ?auto_27077 ?auto_27073 ) ( CLEAR ?auto_27076 ) ( ON ?auto_27075 ?auto_27077 ) ( CLEAR ?auto_27075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27074 ?auto_27072 ?auto_27073 ?auto_27077 )
      ( MAKE-2PILE ?auto_27072 ?auto_27073 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27078 - BLOCK
      ?auto_27079 - BLOCK
    )
    :vars
    (
      ?auto_27082 - BLOCK
      ?auto_27080 - BLOCK
      ?auto_27083 - BLOCK
      ?auto_27081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27078 ?auto_27079 ) ) ( not ( = ?auto_27078 ?auto_27082 ) ) ( not ( = ?auto_27079 ?auto_27082 ) ) ( not ( = ?auto_27080 ?auto_27083 ) ) ( not ( = ?auto_27080 ?auto_27082 ) ) ( not ( = ?auto_27080 ?auto_27079 ) ) ( not ( = ?auto_27080 ?auto_27078 ) ) ( not ( = ?auto_27083 ?auto_27082 ) ) ( not ( = ?auto_27083 ?auto_27079 ) ) ( not ( = ?auto_27083 ?auto_27078 ) ) ( ON ?auto_27078 ?auto_27081 ) ( not ( = ?auto_27078 ?auto_27081 ) ) ( not ( = ?auto_27079 ?auto_27081 ) ) ( not ( = ?auto_27082 ?auto_27081 ) ) ( not ( = ?auto_27080 ?auto_27081 ) ) ( not ( = ?auto_27083 ?auto_27081 ) ) ( ON ?auto_27079 ?auto_27078 ) ( ON-TABLE ?auto_27081 ) ( ON ?auto_27082 ?auto_27079 ) ( ON ?auto_27083 ?auto_27082 ) ( CLEAR ?auto_27083 ) ( HOLDING ?auto_27080 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27080 )
      ( MAKE-2PILE ?auto_27078 ?auto_27079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27084 - BLOCK
      ?auto_27085 - BLOCK
    )
    :vars
    (
      ?auto_27088 - BLOCK
      ?auto_27086 - BLOCK
      ?auto_27087 - BLOCK
      ?auto_27089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27084 ?auto_27085 ) ) ( not ( = ?auto_27084 ?auto_27088 ) ) ( not ( = ?auto_27085 ?auto_27088 ) ) ( not ( = ?auto_27086 ?auto_27087 ) ) ( not ( = ?auto_27086 ?auto_27088 ) ) ( not ( = ?auto_27086 ?auto_27085 ) ) ( not ( = ?auto_27086 ?auto_27084 ) ) ( not ( = ?auto_27087 ?auto_27088 ) ) ( not ( = ?auto_27087 ?auto_27085 ) ) ( not ( = ?auto_27087 ?auto_27084 ) ) ( ON ?auto_27084 ?auto_27089 ) ( not ( = ?auto_27084 ?auto_27089 ) ) ( not ( = ?auto_27085 ?auto_27089 ) ) ( not ( = ?auto_27088 ?auto_27089 ) ) ( not ( = ?auto_27086 ?auto_27089 ) ) ( not ( = ?auto_27087 ?auto_27089 ) ) ( ON ?auto_27085 ?auto_27084 ) ( ON-TABLE ?auto_27089 ) ( ON ?auto_27088 ?auto_27085 ) ( ON ?auto_27087 ?auto_27088 ) ( ON ?auto_27086 ?auto_27087 ) ( CLEAR ?auto_27086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27089 ?auto_27084 ?auto_27085 ?auto_27088 ?auto_27087 )
      ( MAKE-2PILE ?auto_27084 ?auto_27085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27092 - BLOCK
      ?auto_27093 - BLOCK
    )
    :vars
    (
      ?auto_27094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27094 ?auto_27093 ) ( CLEAR ?auto_27094 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27092 ) ( ON ?auto_27093 ?auto_27092 ) ( not ( = ?auto_27092 ?auto_27093 ) ) ( not ( = ?auto_27092 ?auto_27094 ) ) ( not ( = ?auto_27093 ?auto_27094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27094 ?auto_27093 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27095 - BLOCK
      ?auto_27096 - BLOCK
    )
    :vars
    (
      ?auto_27097 - BLOCK
      ?auto_27098 - BLOCK
      ?auto_27099 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27097 ?auto_27096 ) ( CLEAR ?auto_27097 ) ( ON-TABLE ?auto_27095 ) ( ON ?auto_27096 ?auto_27095 ) ( not ( = ?auto_27095 ?auto_27096 ) ) ( not ( = ?auto_27095 ?auto_27097 ) ) ( not ( = ?auto_27096 ?auto_27097 ) ) ( HOLDING ?auto_27098 ) ( CLEAR ?auto_27099 ) ( not ( = ?auto_27095 ?auto_27098 ) ) ( not ( = ?auto_27095 ?auto_27099 ) ) ( not ( = ?auto_27096 ?auto_27098 ) ) ( not ( = ?auto_27096 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27098 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27099 ) ) )
    :subtasks
    ( ( !STACK ?auto_27098 ?auto_27099 )
      ( MAKE-2PILE ?auto_27095 ?auto_27096 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27100 - BLOCK
      ?auto_27101 - BLOCK
    )
    :vars
    (
      ?auto_27104 - BLOCK
      ?auto_27103 - BLOCK
      ?auto_27102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27104 ?auto_27101 ) ( ON-TABLE ?auto_27100 ) ( ON ?auto_27101 ?auto_27100 ) ( not ( = ?auto_27100 ?auto_27101 ) ) ( not ( = ?auto_27100 ?auto_27104 ) ) ( not ( = ?auto_27101 ?auto_27104 ) ) ( CLEAR ?auto_27103 ) ( not ( = ?auto_27100 ?auto_27102 ) ) ( not ( = ?auto_27100 ?auto_27103 ) ) ( not ( = ?auto_27101 ?auto_27102 ) ) ( not ( = ?auto_27101 ?auto_27103 ) ) ( not ( = ?auto_27104 ?auto_27102 ) ) ( not ( = ?auto_27104 ?auto_27103 ) ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( ON ?auto_27102 ?auto_27104 ) ( CLEAR ?auto_27102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27100 ?auto_27101 ?auto_27104 )
      ( MAKE-2PILE ?auto_27100 ?auto_27101 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27105 - BLOCK
      ?auto_27106 - BLOCK
    )
    :vars
    (
      ?auto_27108 - BLOCK
      ?auto_27107 - BLOCK
      ?auto_27109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27108 ?auto_27106 ) ( ON-TABLE ?auto_27105 ) ( ON ?auto_27106 ?auto_27105 ) ( not ( = ?auto_27105 ?auto_27106 ) ) ( not ( = ?auto_27105 ?auto_27108 ) ) ( not ( = ?auto_27106 ?auto_27108 ) ) ( not ( = ?auto_27105 ?auto_27107 ) ) ( not ( = ?auto_27105 ?auto_27109 ) ) ( not ( = ?auto_27106 ?auto_27107 ) ) ( not ( = ?auto_27106 ?auto_27109 ) ) ( not ( = ?auto_27108 ?auto_27107 ) ) ( not ( = ?auto_27108 ?auto_27109 ) ) ( not ( = ?auto_27107 ?auto_27109 ) ) ( ON ?auto_27107 ?auto_27108 ) ( CLEAR ?auto_27107 ) ( HOLDING ?auto_27109 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27109 )
      ( MAKE-2PILE ?auto_27105 ?auto_27106 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27110 - BLOCK
      ?auto_27111 - BLOCK
    )
    :vars
    (
      ?auto_27114 - BLOCK
      ?auto_27112 - BLOCK
      ?auto_27113 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27114 ?auto_27111 ) ( ON-TABLE ?auto_27110 ) ( ON ?auto_27111 ?auto_27110 ) ( not ( = ?auto_27110 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27114 ) ) ( not ( = ?auto_27111 ?auto_27114 ) ) ( not ( = ?auto_27110 ?auto_27112 ) ) ( not ( = ?auto_27110 ?auto_27113 ) ) ( not ( = ?auto_27111 ?auto_27112 ) ) ( not ( = ?auto_27111 ?auto_27113 ) ) ( not ( = ?auto_27114 ?auto_27112 ) ) ( not ( = ?auto_27114 ?auto_27113 ) ) ( not ( = ?auto_27112 ?auto_27113 ) ) ( ON ?auto_27112 ?auto_27114 ) ( ON ?auto_27113 ?auto_27112 ) ( CLEAR ?auto_27113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27110 ?auto_27111 ?auto_27114 ?auto_27112 )
      ( MAKE-2PILE ?auto_27110 ?auto_27111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27115 - BLOCK
      ?auto_27116 - BLOCK
    )
    :vars
    (
      ?auto_27118 - BLOCK
      ?auto_27117 - BLOCK
      ?auto_27119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27118 ?auto_27116 ) ( ON-TABLE ?auto_27115 ) ( ON ?auto_27116 ?auto_27115 ) ( not ( = ?auto_27115 ?auto_27116 ) ) ( not ( = ?auto_27115 ?auto_27118 ) ) ( not ( = ?auto_27116 ?auto_27118 ) ) ( not ( = ?auto_27115 ?auto_27117 ) ) ( not ( = ?auto_27115 ?auto_27119 ) ) ( not ( = ?auto_27116 ?auto_27117 ) ) ( not ( = ?auto_27116 ?auto_27119 ) ) ( not ( = ?auto_27118 ?auto_27117 ) ) ( not ( = ?auto_27118 ?auto_27119 ) ) ( not ( = ?auto_27117 ?auto_27119 ) ) ( ON ?auto_27117 ?auto_27118 ) ( HOLDING ?auto_27119 ) ( CLEAR ?auto_27117 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27115 ?auto_27116 ?auto_27118 ?auto_27117 ?auto_27119 )
      ( MAKE-2PILE ?auto_27115 ?auto_27116 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27120 - BLOCK
      ?auto_27121 - BLOCK
    )
    :vars
    (
      ?auto_27122 - BLOCK
      ?auto_27124 - BLOCK
      ?auto_27123 - BLOCK
      ?auto_27125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27122 ?auto_27121 ) ( ON-TABLE ?auto_27120 ) ( ON ?auto_27121 ?auto_27120 ) ( not ( = ?auto_27120 ?auto_27121 ) ) ( not ( = ?auto_27120 ?auto_27122 ) ) ( not ( = ?auto_27121 ?auto_27122 ) ) ( not ( = ?auto_27120 ?auto_27124 ) ) ( not ( = ?auto_27120 ?auto_27123 ) ) ( not ( = ?auto_27121 ?auto_27124 ) ) ( not ( = ?auto_27121 ?auto_27123 ) ) ( not ( = ?auto_27122 ?auto_27124 ) ) ( not ( = ?auto_27122 ?auto_27123 ) ) ( not ( = ?auto_27124 ?auto_27123 ) ) ( ON ?auto_27124 ?auto_27122 ) ( CLEAR ?auto_27124 ) ( ON ?auto_27123 ?auto_27125 ) ( CLEAR ?auto_27123 ) ( HAND-EMPTY ) ( not ( = ?auto_27120 ?auto_27125 ) ) ( not ( = ?auto_27121 ?auto_27125 ) ) ( not ( = ?auto_27122 ?auto_27125 ) ) ( not ( = ?auto_27124 ?auto_27125 ) ) ( not ( = ?auto_27123 ?auto_27125 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27123 ?auto_27125 )
      ( MAKE-2PILE ?auto_27120 ?auto_27121 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27126 - BLOCK
      ?auto_27127 - BLOCK
    )
    :vars
    (
      ?auto_27128 - BLOCK
      ?auto_27129 - BLOCK
      ?auto_27130 - BLOCK
      ?auto_27131 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27128 ?auto_27127 ) ( ON-TABLE ?auto_27126 ) ( ON ?auto_27127 ?auto_27126 ) ( not ( = ?auto_27126 ?auto_27127 ) ) ( not ( = ?auto_27126 ?auto_27128 ) ) ( not ( = ?auto_27127 ?auto_27128 ) ) ( not ( = ?auto_27126 ?auto_27129 ) ) ( not ( = ?auto_27126 ?auto_27130 ) ) ( not ( = ?auto_27127 ?auto_27129 ) ) ( not ( = ?auto_27127 ?auto_27130 ) ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( ON ?auto_27130 ?auto_27131 ) ( CLEAR ?auto_27130 ) ( not ( = ?auto_27126 ?auto_27131 ) ) ( not ( = ?auto_27127 ?auto_27131 ) ) ( not ( = ?auto_27128 ?auto_27131 ) ) ( not ( = ?auto_27129 ?auto_27131 ) ) ( not ( = ?auto_27130 ?auto_27131 ) ) ( HOLDING ?auto_27129 ) ( CLEAR ?auto_27128 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27126 ?auto_27127 ?auto_27128 ?auto_27129 )
      ( MAKE-2PILE ?auto_27126 ?auto_27127 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27132 - BLOCK
      ?auto_27133 - BLOCK
    )
    :vars
    (
      ?auto_27136 - BLOCK
      ?auto_27135 - BLOCK
      ?auto_27134 - BLOCK
      ?auto_27137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27136 ?auto_27133 ) ( ON-TABLE ?auto_27132 ) ( ON ?auto_27133 ?auto_27132 ) ( not ( = ?auto_27132 ?auto_27133 ) ) ( not ( = ?auto_27132 ?auto_27136 ) ) ( not ( = ?auto_27133 ?auto_27136 ) ) ( not ( = ?auto_27132 ?auto_27135 ) ) ( not ( = ?auto_27132 ?auto_27134 ) ) ( not ( = ?auto_27133 ?auto_27135 ) ) ( not ( = ?auto_27133 ?auto_27134 ) ) ( not ( = ?auto_27136 ?auto_27135 ) ) ( not ( = ?auto_27136 ?auto_27134 ) ) ( not ( = ?auto_27135 ?auto_27134 ) ) ( ON ?auto_27134 ?auto_27137 ) ( not ( = ?auto_27132 ?auto_27137 ) ) ( not ( = ?auto_27133 ?auto_27137 ) ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( not ( = ?auto_27135 ?auto_27137 ) ) ( not ( = ?auto_27134 ?auto_27137 ) ) ( CLEAR ?auto_27136 ) ( ON ?auto_27135 ?auto_27134 ) ( CLEAR ?auto_27135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27137 ?auto_27134 )
      ( MAKE-2PILE ?auto_27132 ?auto_27133 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27150 - BLOCK
      ?auto_27151 - BLOCK
    )
    :vars
    (
      ?auto_27152 - BLOCK
      ?auto_27155 - BLOCK
      ?auto_27154 - BLOCK
      ?auto_27153 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27150 ) ( not ( = ?auto_27150 ?auto_27151 ) ) ( not ( = ?auto_27150 ?auto_27152 ) ) ( not ( = ?auto_27151 ?auto_27152 ) ) ( not ( = ?auto_27150 ?auto_27155 ) ) ( not ( = ?auto_27150 ?auto_27154 ) ) ( not ( = ?auto_27151 ?auto_27155 ) ) ( not ( = ?auto_27151 ?auto_27154 ) ) ( not ( = ?auto_27152 ?auto_27155 ) ) ( not ( = ?auto_27152 ?auto_27154 ) ) ( not ( = ?auto_27155 ?auto_27154 ) ) ( ON ?auto_27154 ?auto_27153 ) ( not ( = ?auto_27150 ?auto_27153 ) ) ( not ( = ?auto_27151 ?auto_27153 ) ) ( not ( = ?auto_27152 ?auto_27153 ) ) ( not ( = ?auto_27155 ?auto_27153 ) ) ( not ( = ?auto_27154 ?auto_27153 ) ) ( ON ?auto_27155 ?auto_27154 ) ( ON-TABLE ?auto_27153 ) ( ON ?auto_27152 ?auto_27155 ) ( CLEAR ?auto_27152 ) ( HOLDING ?auto_27151 ) ( CLEAR ?auto_27150 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27150 ?auto_27151 ?auto_27152 )
      ( MAKE-2PILE ?auto_27150 ?auto_27151 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27156 - BLOCK
      ?auto_27157 - BLOCK
    )
    :vars
    (
      ?auto_27160 - BLOCK
      ?auto_27161 - BLOCK
      ?auto_27158 - BLOCK
      ?auto_27159 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27156 ) ( not ( = ?auto_27156 ?auto_27157 ) ) ( not ( = ?auto_27156 ?auto_27160 ) ) ( not ( = ?auto_27157 ?auto_27160 ) ) ( not ( = ?auto_27156 ?auto_27161 ) ) ( not ( = ?auto_27156 ?auto_27158 ) ) ( not ( = ?auto_27157 ?auto_27161 ) ) ( not ( = ?auto_27157 ?auto_27158 ) ) ( not ( = ?auto_27160 ?auto_27161 ) ) ( not ( = ?auto_27160 ?auto_27158 ) ) ( not ( = ?auto_27161 ?auto_27158 ) ) ( ON ?auto_27158 ?auto_27159 ) ( not ( = ?auto_27156 ?auto_27159 ) ) ( not ( = ?auto_27157 ?auto_27159 ) ) ( not ( = ?auto_27160 ?auto_27159 ) ) ( not ( = ?auto_27161 ?auto_27159 ) ) ( not ( = ?auto_27158 ?auto_27159 ) ) ( ON ?auto_27161 ?auto_27158 ) ( ON-TABLE ?auto_27159 ) ( ON ?auto_27160 ?auto_27161 ) ( CLEAR ?auto_27156 ) ( ON ?auto_27157 ?auto_27160 ) ( CLEAR ?auto_27157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27159 ?auto_27158 ?auto_27161 ?auto_27160 )
      ( MAKE-2PILE ?auto_27156 ?auto_27157 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27162 - BLOCK
      ?auto_27163 - BLOCK
    )
    :vars
    (
      ?auto_27165 - BLOCK
      ?auto_27164 - BLOCK
      ?auto_27166 - BLOCK
      ?auto_27167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27162 ?auto_27163 ) ) ( not ( = ?auto_27162 ?auto_27165 ) ) ( not ( = ?auto_27163 ?auto_27165 ) ) ( not ( = ?auto_27162 ?auto_27164 ) ) ( not ( = ?auto_27162 ?auto_27166 ) ) ( not ( = ?auto_27163 ?auto_27164 ) ) ( not ( = ?auto_27163 ?auto_27166 ) ) ( not ( = ?auto_27165 ?auto_27164 ) ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( not ( = ?auto_27164 ?auto_27166 ) ) ( ON ?auto_27166 ?auto_27167 ) ( not ( = ?auto_27162 ?auto_27167 ) ) ( not ( = ?auto_27163 ?auto_27167 ) ) ( not ( = ?auto_27165 ?auto_27167 ) ) ( not ( = ?auto_27164 ?auto_27167 ) ) ( not ( = ?auto_27166 ?auto_27167 ) ) ( ON ?auto_27164 ?auto_27166 ) ( ON-TABLE ?auto_27167 ) ( ON ?auto_27165 ?auto_27164 ) ( ON ?auto_27163 ?auto_27165 ) ( CLEAR ?auto_27163 ) ( HOLDING ?auto_27162 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27162 )
      ( MAKE-2PILE ?auto_27162 ?auto_27163 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_27168 - BLOCK
      ?auto_27169 - BLOCK
    )
    :vars
    (
      ?auto_27171 - BLOCK
      ?auto_27173 - BLOCK
      ?auto_27172 - BLOCK
      ?auto_27170 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27168 ?auto_27173 ) ) ( not ( = ?auto_27168 ?auto_27172 ) ) ( not ( = ?auto_27169 ?auto_27173 ) ) ( not ( = ?auto_27169 ?auto_27172 ) ) ( not ( = ?auto_27171 ?auto_27173 ) ) ( not ( = ?auto_27171 ?auto_27172 ) ) ( not ( = ?auto_27173 ?auto_27172 ) ) ( ON ?auto_27172 ?auto_27170 ) ( not ( = ?auto_27168 ?auto_27170 ) ) ( not ( = ?auto_27169 ?auto_27170 ) ) ( not ( = ?auto_27171 ?auto_27170 ) ) ( not ( = ?auto_27173 ?auto_27170 ) ) ( not ( = ?auto_27172 ?auto_27170 ) ) ( ON ?auto_27173 ?auto_27172 ) ( ON-TABLE ?auto_27170 ) ( ON ?auto_27171 ?auto_27173 ) ( ON ?auto_27169 ?auto_27171 ) ( ON ?auto_27168 ?auto_27169 ) ( CLEAR ?auto_27168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27170 ?auto_27172 ?auto_27173 ?auto_27171 ?auto_27169 )
      ( MAKE-2PILE ?auto_27168 ?auto_27169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27177 - BLOCK
      ?auto_27178 - BLOCK
      ?auto_27179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27179 ) ( CLEAR ?auto_27178 ) ( ON-TABLE ?auto_27177 ) ( ON ?auto_27178 ?auto_27177 ) ( not ( = ?auto_27177 ?auto_27178 ) ) ( not ( = ?auto_27177 ?auto_27179 ) ) ( not ( = ?auto_27178 ?auto_27179 ) ) )
    :subtasks
    ( ( !STACK ?auto_27179 ?auto_27178 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27180 - BLOCK
      ?auto_27181 - BLOCK
      ?auto_27182 - BLOCK
    )
    :vars
    (
      ?auto_27183 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27181 ) ( ON-TABLE ?auto_27180 ) ( ON ?auto_27181 ?auto_27180 ) ( not ( = ?auto_27180 ?auto_27181 ) ) ( not ( = ?auto_27180 ?auto_27182 ) ) ( not ( = ?auto_27181 ?auto_27182 ) ) ( ON ?auto_27182 ?auto_27183 ) ( CLEAR ?auto_27182 ) ( HAND-EMPTY ) ( not ( = ?auto_27180 ?auto_27183 ) ) ( not ( = ?auto_27181 ?auto_27183 ) ) ( not ( = ?auto_27182 ?auto_27183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27182 ?auto_27183 )
      ( MAKE-3PILE ?auto_27180 ?auto_27181 ?auto_27182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27184 - BLOCK
      ?auto_27185 - BLOCK
      ?auto_27186 - BLOCK
    )
    :vars
    (
      ?auto_27187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27184 ) ( not ( = ?auto_27184 ?auto_27185 ) ) ( not ( = ?auto_27184 ?auto_27186 ) ) ( not ( = ?auto_27185 ?auto_27186 ) ) ( ON ?auto_27186 ?auto_27187 ) ( CLEAR ?auto_27186 ) ( not ( = ?auto_27184 ?auto_27187 ) ) ( not ( = ?auto_27185 ?auto_27187 ) ) ( not ( = ?auto_27186 ?auto_27187 ) ) ( HOLDING ?auto_27185 ) ( CLEAR ?auto_27184 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27184 ?auto_27185 )
      ( MAKE-3PILE ?auto_27184 ?auto_27185 ?auto_27186 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27188 - BLOCK
      ?auto_27189 - BLOCK
      ?auto_27190 - BLOCK
    )
    :vars
    (
      ?auto_27191 - BLOCK
      ?auto_27192 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27188 ) ( not ( = ?auto_27188 ?auto_27189 ) ) ( not ( = ?auto_27188 ?auto_27190 ) ) ( not ( = ?auto_27189 ?auto_27190 ) ) ( ON ?auto_27190 ?auto_27191 ) ( not ( = ?auto_27188 ?auto_27191 ) ) ( not ( = ?auto_27189 ?auto_27191 ) ) ( not ( = ?auto_27190 ?auto_27191 ) ) ( CLEAR ?auto_27188 ) ( ON ?auto_27189 ?auto_27190 ) ( CLEAR ?auto_27189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27192 ) ( ON ?auto_27191 ?auto_27192 ) ( not ( = ?auto_27192 ?auto_27191 ) ) ( not ( = ?auto_27192 ?auto_27190 ) ) ( not ( = ?auto_27192 ?auto_27189 ) ) ( not ( = ?auto_27188 ?auto_27192 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27192 ?auto_27191 ?auto_27190 )
      ( MAKE-3PILE ?auto_27188 ?auto_27189 ?auto_27190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27193 - BLOCK
      ?auto_27194 - BLOCK
      ?auto_27195 - BLOCK
    )
    :vars
    (
      ?auto_27196 - BLOCK
      ?auto_27197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27193 ?auto_27194 ) ) ( not ( = ?auto_27193 ?auto_27195 ) ) ( not ( = ?auto_27194 ?auto_27195 ) ) ( ON ?auto_27195 ?auto_27196 ) ( not ( = ?auto_27193 ?auto_27196 ) ) ( not ( = ?auto_27194 ?auto_27196 ) ) ( not ( = ?auto_27195 ?auto_27196 ) ) ( ON ?auto_27194 ?auto_27195 ) ( CLEAR ?auto_27194 ) ( ON-TABLE ?auto_27197 ) ( ON ?auto_27196 ?auto_27197 ) ( not ( = ?auto_27197 ?auto_27196 ) ) ( not ( = ?auto_27197 ?auto_27195 ) ) ( not ( = ?auto_27197 ?auto_27194 ) ) ( not ( = ?auto_27193 ?auto_27197 ) ) ( HOLDING ?auto_27193 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27193 )
      ( MAKE-3PILE ?auto_27193 ?auto_27194 ?auto_27195 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27198 - BLOCK
      ?auto_27199 - BLOCK
      ?auto_27200 - BLOCK
    )
    :vars
    (
      ?auto_27202 - BLOCK
      ?auto_27201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27198 ?auto_27199 ) ) ( not ( = ?auto_27198 ?auto_27200 ) ) ( not ( = ?auto_27199 ?auto_27200 ) ) ( ON ?auto_27200 ?auto_27202 ) ( not ( = ?auto_27198 ?auto_27202 ) ) ( not ( = ?auto_27199 ?auto_27202 ) ) ( not ( = ?auto_27200 ?auto_27202 ) ) ( ON ?auto_27199 ?auto_27200 ) ( ON-TABLE ?auto_27201 ) ( ON ?auto_27202 ?auto_27201 ) ( not ( = ?auto_27201 ?auto_27202 ) ) ( not ( = ?auto_27201 ?auto_27200 ) ) ( not ( = ?auto_27201 ?auto_27199 ) ) ( not ( = ?auto_27198 ?auto_27201 ) ) ( ON ?auto_27198 ?auto_27199 ) ( CLEAR ?auto_27198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27201 ?auto_27202 ?auto_27200 ?auto_27199 )
      ( MAKE-3PILE ?auto_27198 ?auto_27199 ?auto_27200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27203 - BLOCK
      ?auto_27204 - BLOCK
      ?auto_27205 - BLOCK
    )
    :vars
    (
      ?auto_27207 - BLOCK
      ?auto_27206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27203 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( ON ?auto_27205 ?auto_27207 ) ( not ( = ?auto_27203 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( ON ?auto_27204 ?auto_27205 ) ( ON-TABLE ?auto_27206 ) ( ON ?auto_27207 ?auto_27206 ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27205 ) ) ( not ( = ?auto_27206 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27206 ) ) ( HOLDING ?auto_27203 ) ( CLEAR ?auto_27204 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27206 ?auto_27207 ?auto_27205 ?auto_27204 ?auto_27203 )
      ( MAKE-3PILE ?auto_27203 ?auto_27204 ?auto_27205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27208 - BLOCK
      ?auto_27209 - BLOCK
      ?auto_27210 - BLOCK
    )
    :vars
    (
      ?auto_27211 - BLOCK
      ?auto_27212 - BLOCK
      ?auto_27213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27208 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27210 ) ) ( not ( = ?auto_27209 ?auto_27210 ) ) ( ON ?auto_27210 ?auto_27211 ) ( not ( = ?auto_27208 ?auto_27211 ) ) ( not ( = ?auto_27209 ?auto_27211 ) ) ( not ( = ?auto_27210 ?auto_27211 ) ) ( ON ?auto_27209 ?auto_27210 ) ( ON-TABLE ?auto_27212 ) ( ON ?auto_27211 ?auto_27212 ) ( not ( = ?auto_27212 ?auto_27211 ) ) ( not ( = ?auto_27212 ?auto_27210 ) ) ( not ( = ?auto_27212 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27212 ) ) ( CLEAR ?auto_27209 ) ( ON ?auto_27208 ?auto_27213 ) ( CLEAR ?auto_27208 ) ( HAND-EMPTY ) ( not ( = ?auto_27208 ?auto_27213 ) ) ( not ( = ?auto_27209 ?auto_27213 ) ) ( not ( = ?auto_27210 ?auto_27213 ) ) ( not ( = ?auto_27211 ?auto_27213 ) ) ( not ( = ?auto_27212 ?auto_27213 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27208 ?auto_27213 )
      ( MAKE-3PILE ?auto_27208 ?auto_27209 ?auto_27210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27214 - BLOCK
      ?auto_27215 - BLOCK
      ?auto_27216 - BLOCK
    )
    :vars
    (
      ?auto_27218 - BLOCK
      ?auto_27217 - BLOCK
      ?auto_27219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27214 ?auto_27215 ) ) ( not ( = ?auto_27214 ?auto_27216 ) ) ( not ( = ?auto_27215 ?auto_27216 ) ) ( ON ?auto_27216 ?auto_27218 ) ( not ( = ?auto_27214 ?auto_27218 ) ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27216 ?auto_27218 ) ) ( ON-TABLE ?auto_27217 ) ( ON ?auto_27218 ?auto_27217 ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( not ( = ?auto_27217 ?auto_27216 ) ) ( not ( = ?auto_27217 ?auto_27215 ) ) ( not ( = ?auto_27214 ?auto_27217 ) ) ( ON ?auto_27214 ?auto_27219 ) ( CLEAR ?auto_27214 ) ( not ( = ?auto_27214 ?auto_27219 ) ) ( not ( = ?auto_27215 ?auto_27219 ) ) ( not ( = ?auto_27216 ?auto_27219 ) ) ( not ( = ?auto_27218 ?auto_27219 ) ) ( not ( = ?auto_27217 ?auto_27219 ) ) ( HOLDING ?auto_27215 ) ( CLEAR ?auto_27216 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27217 ?auto_27218 ?auto_27216 ?auto_27215 )
      ( MAKE-3PILE ?auto_27214 ?auto_27215 ?auto_27216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27220 - BLOCK
      ?auto_27221 - BLOCK
      ?auto_27222 - BLOCK
    )
    :vars
    (
      ?auto_27225 - BLOCK
      ?auto_27223 - BLOCK
      ?auto_27224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27220 ?auto_27221 ) ) ( not ( = ?auto_27220 ?auto_27222 ) ) ( not ( = ?auto_27221 ?auto_27222 ) ) ( ON ?auto_27222 ?auto_27225 ) ( not ( = ?auto_27220 ?auto_27225 ) ) ( not ( = ?auto_27221 ?auto_27225 ) ) ( not ( = ?auto_27222 ?auto_27225 ) ) ( ON-TABLE ?auto_27223 ) ( ON ?auto_27225 ?auto_27223 ) ( not ( = ?auto_27223 ?auto_27225 ) ) ( not ( = ?auto_27223 ?auto_27222 ) ) ( not ( = ?auto_27223 ?auto_27221 ) ) ( not ( = ?auto_27220 ?auto_27223 ) ) ( ON ?auto_27220 ?auto_27224 ) ( not ( = ?auto_27220 ?auto_27224 ) ) ( not ( = ?auto_27221 ?auto_27224 ) ) ( not ( = ?auto_27222 ?auto_27224 ) ) ( not ( = ?auto_27225 ?auto_27224 ) ) ( not ( = ?auto_27223 ?auto_27224 ) ) ( CLEAR ?auto_27222 ) ( ON ?auto_27221 ?auto_27220 ) ( CLEAR ?auto_27221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27224 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27224 ?auto_27220 )
      ( MAKE-3PILE ?auto_27220 ?auto_27221 ?auto_27222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27226 - BLOCK
      ?auto_27227 - BLOCK
      ?auto_27228 - BLOCK
    )
    :vars
    (
      ?auto_27231 - BLOCK
      ?auto_27229 - BLOCK
      ?auto_27230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27226 ?auto_27227 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27227 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27231 ) ) ( not ( = ?auto_27227 ?auto_27231 ) ) ( not ( = ?auto_27228 ?auto_27231 ) ) ( ON-TABLE ?auto_27229 ) ( ON ?auto_27231 ?auto_27229 ) ( not ( = ?auto_27229 ?auto_27231 ) ) ( not ( = ?auto_27229 ?auto_27228 ) ) ( not ( = ?auto_27229 ?auto_27227 ) ) ( not ( = ?auto_27226 ?auto_27229 ) ) ( ON ?auto_27226 ?auto_27230 ) ( not ( = ?auto_27226 ?auto_27230 ) ) ( not ( = ?auto_27227 ?auto_27230 ) ) ( not ( = ?auto_27228 ?auto_27230 ) ) ( not ( = ?auto_27231 ?auto_27230 ) ) ( not ( = ?auto_27229 ?auto_27230 ) ) ( ON ?auto_27227 ?auto_27226 ) ( CLEAR ?auto_27227 ) ( ON-TABLE ?auto_27230 ) ( HOLDING ?auto_27228 ) ( CLEAR ?auto_27231 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27229 ?auto_27231 ?auto_27228 )
      ( MAKE-3PILE ?auto_27226 ?auto_27227 ?auto_27228 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27232 - BLOCK
      ?auto_27233 - BLOCK
      ?auto_27234 - BLOCK
    )
    :vars
    (
      ?auto_27237 - BLOCK
      ?auto_27236 - BLOCK
      ?auto_27235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27232 ?auto_27233 ) ) ( not ( = ?auto_27232 ?auto_27234 ) ) ( not ( = ?auto_27233 ?auto_27234 ) ) ( not ( = ?auto_27232 ?auto_27237 ) ) ( not ( = ?auto_27233 ?auto_27237 ) ) ( not ( = ?auto_27234 ?auto_27237 ) ) ( ON-TABLE ?auto_27236 ) ( ON ?auto_27237 ?auto_27236 ) ( not ( = ?auto_27236 ?auto_27237 ) ) ( not ( = ?auto_27236 ?auto_27234 ) ) ( not ( = ?auto_27236 ?auto_27233 ) ) ( not ( = ?auto_27232 ?auto_27236 ) ) ( ON ?auto_27232 ?auto_27235 ) ( not ( = ?auto_27232 ?auto_27235 ) ) ( not ( = ?auto_27233 ?auto_27235 ) ) ( not ( = ?auto_27234 ?auto_27235 ) ) ( not ( = ?auto_27237 ?auto_27235 ) ) ( not ( = ?auto_27236 ?auto_27235 ) ) ( ON ?auto_27233 ?auto_27232 ) ( ON-TABLE ?auto_27235 ) ( CLEAR ?auto_27237 ) ( ON ?auto_27234 ?auto_27233 ) ( CLEAR ?auto_27234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27235 ?auto_27232 ?auto_27233 )
      ( MAKE-3PILE ?auto_27232 ?auto_27233 ?auto_27234 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27238 - BLOCK
      ?auto_27239 - BLOCK
      ?auto_27240 - BLOCK
    )
    :vars
    (
      ?auto_27243 - BLOCK
      ?auto_27242 - BLOCK
      ?auto_27241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27238 ?auto_27239 ) ) ( not ( = ?auto_27238 ?auto_27240 ) ) ( not ( = ?auto_27239 ?auto_27240 ) ) ( not ( = ?auto_27238 ?auto_27243 ) ) ( not ( = ?auto_27239 ?auto_27243 ) ) ( not ( = ?auto_27240 ?auto_27243 ) ) ( ON-TABLE ?auto_27242 ) ( not ( = ?auto_27242 ?auto_27243 ) ) ( not ( = ?auto_27242 ?auto_27240 ) ) ( not ( = ?auto_27242 ?auto_27239 ) ) ( not ( = ?auto_27238 ?auto_27242 ) ) ( ON ?auto_27238 ?auto_27241 ) ( not ( = ?auto_27238 ?auto_27241 ) ) ( not ( = ?auto_27239 ?auto_27241 ) ) ( not ( = ?auto_27240 ?auto_27241 ) ) ( not ( = ?auto_27243 ?auto_27241 ) ) ( not ( = ?auto_27242 ?auto_27241 ) ) ( ON ?auto_27239 ?auto_27238 ) ( ON-TABLE ?auto_27241 ) ( ON ?auto_27240 ?auto_27239 ) ( CLEAR ?auto_27240 ) ( HOLDING ?auto_27243 ) ( CLEAR ?auto_27242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27242 ?auto_27243 )
      ( MAKE-3PILE ?auto_27238 ?auto_27239 ?auto_27240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27244 - BLOCK
      ?auto_27245 - BLOCK
      ?auto_27246 - BLOCK
    )
    :vars
    (
      ?auto_27248 - BLOCK
      ?auto_27249 - BLOCK
      ?auto_27247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27244 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27246 ) ) ( not ( = ?auto_27245 ?auto_27246 ) ) ( not ( = ?auto_27244 ?auto_27248 ) ) ( not ( = ?auto_27245 ?auto_27248 ) ) ( not ( = ?auto_27246 ?auto_27248 ) ) ( ON-TABLE ?auto_27249 ) ( not ( = ?auto_27249 ?auto_27248 ) ) ( not ( = ?auto_27249 ?auto_27246 ) ) ( not ( = ?auto_27249 ?auto_27245 ) ) ( not ( = ?auto_27244 ?auto_27249 ) ) ( ON ?auto_27244 ?auto_27247 ) ( not ( = ?auto_27244 ?auto_27247 ) ) ( not ( = ?auto_27245 ?auto_27247 ) ) ( not ( = ?auto_27246 ?auto_27247 ) ) ( not ( = ?auto_27248 ?auto_27247 ) ) ( not ( = ?auto_27249 ?auto_27247 ) ) ( ON ?auto_27245 ?auto_27244 ) ( ON-TABLE ?auto_27247 ) ( ON ?auto_27246 ?auto_27245 ) ( CLEAR ?auto_27249 ) ( ON ?auto_27248 ?auto_27246 ) ( CLEAR ?auto_27248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27247 ?auto_27244 ?auto_27245 ?auto_27246 )
      ( MAKE-3PILE ?auto_27244 ?auto_27245 ?auto_27246 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27250 - BLOCK
      ?auto_27251 - BLOCK
      ?auto_27252 - BLOCK
    )
    :vars
    (
      ?auto_27255 - BLOCK
      ?auto_27254 - BLOCK
      ?auto_27253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27252 ) ) ( not ( = ?auto_27251 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27255 ) ) ( not ( = ?auto_27251 ?auto_27255 ) ) ( not ( = ?auto_27252 ?auto_27255 ) ) ( not ( = ?auto_27254 ?auto_27255 ) ) ( not ( = ?auto_27254 ?auto_27252 ) ) ( not ( = ?auto_27254 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27254 ) ) ( ON ?auto_27250 ?auto_27253 ) ( not ( = ?auto_27250 ?auto_27253 ) ) ( not ( = ?auto_27251 ?auto_27253 ) ) ( not ( = ?auto_27252 ?auto_27253 ) ) ( not ( = ?auto_27255 ?auto_27253 ) ) ( not ( = ?auto_27254 ?auto_27253 ) ) ( ON ?auto_27251 ?auto_27250 ) ( ON-TABLE ?auto_27253 ) ( ON ?auto_27252 ?auto_27251 ) ( ON ?auto_27255 ?auto_27252 ) ( CLEAR ?auto_27255 ) ( HOLDING ?auto_27254 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27254 )
      ( MAKE-3PILE ?auto_27250 ?auto_27251 ?auto_27252 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_27256 - BLOCK
      ?auto_27257 - BLOCK
      ?auto_27258 - BLOCK
    )
    :vars
    (
      ?auto_27261 - BLOCK
      ?auto_27259 - BLOCK
      ?auto_27260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27256 ?auto_27257 ) ) ( not ( = ?auto_27256 ?auto_27258 ) ) ( not ( = ?auto_27257 ?auto_27258 ) ) ( not ( = ?auto_27256 ?auto_27261 ) ) ( not ( = ?auto_27257 ?auto_27261 ) ) ( not ( = ?auto_27258 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27258 ) ) ( not ( = ?auto_27259 ?auto_27257 ) ) ( not ( = ?auto_27256 ?auto_27259 ) ) ( ON ?auto_27256 ?auto_27260 ) ( not ( = ?auto_27256 ?auto_27260 ) ) ( not ( = ?auto_27257 ?auto_27260 ) ) ( not ( = ?auto_27258 ?auto_27260 ) ) ( not ( = ?auto_27261 ?auto_27260 ) ) ( not ( = ?auto_27259 ?auto_27260 ) ) ( ON ?auto_27257 ?auto_27256 ) ( ON-TABLE ?auto_27260 ) ( ON ?auto_27258 ?auto_27257 ) ( ON ?auto_27261 ?auto_27258 ) ( ON ?auto_27259 ?auto_27261 ) ( CLEAR ?auto_27259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27260 ?auto_27256 ?auto_27257 ?auto_27258 ?auto_27261 )
      ( MAKE-3PILE ?auto_27256 ?auto_27257 ?auto_27258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27263 - BLOCK
    )
    :vars
    (
      ?auto_27264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27264 ?auto_27263 ) ( CLEAR ?auto_27264 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27263 ) ( not ( = ?auto_27263 ?auto_27264 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27264 ?auto_27263 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27265 - BLOCK
    )
    :vars
    (
      ?auto_27266 - BLOCK
      ?auto_27267 - BLOCK
      ?auto_27268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27266 ?auto_27265 ) ( CLEAR ?auto_27266 ) ( ON-TABLE ?auto_27265 ) ( not ( = ?auto_27265 ?auto_27266 ) ) ( HOLDING ?auto_27267 ) ( CLEAR ?auto_27268 ) ( not ( = ?auto_27265 ?auto_27267 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27266 ?auto_27267 ) ) ( not ( = ?auto_27266 ?auto_27268 ) ) ( not ( = ?auto_27267 ?auto_27268 ) ) )
    :subtasks
    ( ( !STACK ?auto_27267 ?auto_27268 )
      ( MAKE-1PILE ?auto_27265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27269 - BLOCK
    )
    :vars
    (
      ?auto_27271 - BLOCK
      ?auto_27272 - BLOCK
      ?auto_27270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27271 ?auto_27269 ) ( ON-TABLE ?auto_27269 ) ( not ( = ?auto_27269 ?auto_27271 ) ) ( CLEAR ?auto_27272 ) ( not ( = ?auto_27269 ?auto_27270 ) ) ( not ( = ?auto_27269 ?auto_27272 ) ) ( not ( = ?auto_27271 ?auto_27270 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27270 ?auto_27272 ) ) ( ON ?auto_27270 ?auto_27271 ) ( CLEAR ?auto_27270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27269 ?auto_27271 )
      ( MAKE-1PILE ?auto_27269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27273 - BLOCK
    )
    :vars
    (
      ?auto_27274 - BLOCK
      ?auto_27276 - BLOCK
      ?auto_27275 - BLOCK
      ?auto_27277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27274 ?auto_27273 ) ( ON-TABLE ?auto_27273 ) ( not ( = ?auto_27273 ?auto_27274 ) ) ( not ( = ?auto_27273 ?auto_27276 ) ) ( not ( = ?auto_27273 ?auto_27275 ) ) ( not ( = ?auto_27274 ?auto_27276 ) ) ( not ( = ?auto_27274 ?auto_27275 ) ) ( not ( = ?auto_27276 ?auto_27275 ) ) ( ON ?auto_27276 ?auto_27274 ) ( CLEAR ?auto_27276 ) ( HOLDING ?auto_27275 ) ( CLEAR ?auto_27277 ) ( ON-TABLE ?auto_27277 ) ( not ( = ?auto_27277 ?auto_27275 ) ) ( not ( = ?auto_27273 ?auto_27277 ) ) ( not ( = ?auto_27274 ?auto_27277 ) ) ( not ( = ?auto_27276 ?auto_27277 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27277 ?auto_27275 )
      ( MAKE-1PILE ?auto_27273 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27278 - BLOCK
    )
    :vars
    (
      ?auto_27281 - BLOCK
      ?auto_27280 - BLOCK
      ?auto_27279 - BLOCK
      ?auto_27282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27281 ?auto_27278 ) ( ON-TABLE ?auto_27278 ) ( not ( = ?auto_27278 ?auto_27281 ) ) ( not ( = ?auto_27278 ?auto_27280 ) ) ( not ( = ?auto_27278 ?auto_27279 ) ) ( not ( = ?auto_27281 ?auto_27280 ) ) ( not ( = ?auto_27281 ?auto_27279 ) ) ( not ( = ?auto_27280 ?auto_27279 ) ) ( ON ?auto_27280 ?auto_27281 ) ( CLEAR ?auto_27282 ) ( ON-TABLE ?auto_27282 ) ( not ( = ?auto_27282 ?auto_27279 ) ) ( not ( = ?auto_27278 ?auto_27282 ) ) ( not ( = ?auto_27281 ?auto_27282 ) ) ( not ( = ?auto_27280 ?auto_27282 ) ) ( ON ?auto_27279 ?auto_27280 ) ( CLEAR ?auto_27279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27278 ?auto_27281 ?auto_27280 )
      ( MAKE-1PILE ?auto_27278 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27283 - BLOCK
    )
    :vars
    (
      ?auto_27287 - BLOCK
      ?auto_27286 - BLOCK
      ?auto_27285 - BLOCK
      ?auto_27284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27287 ?auto_27283 ) ( ON-TABLE ?auto_27283 ) ( not ( = ?auto_27283 ?auto_27287 ) ) ( not ( = ?auto_27283 ?auto_27286 ) ) ( not ( = ?auto_27283 ?auto_27285 ) ) ( not ( = ?auto_27287 ?auto_27286 ) ) ( not ( = ?auto_27287 ?auto_27285 ) ) ( not ( = ?auto_27286 ?auto_27285 ) ) ( ON ?auto_27286 ?auto_27287 ) ( not ( = ?auto_27284 ?auto_27285 ) ) ( not ( = ?auto_27283 ?auto_27284 ) ) ( not ( = ?auto_27287 ?auto_27284 ) ) ( not ( = ?auto_27286 ?auto_27284 ) ) ( ON ?auto_27285 ?auto_27286 ) ( CLEAR ?auto_27285 ) ( HOLDING ?auto_27284 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27284 )
      ( MAKE-1PILE ?auto_27283 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27288 - BLOCK
    )
    :vars
    (
      ?auto_27291 - BLOCK
      ?auto_27290 - BLOCK
      ?auto_27289 - BLOCK
      ?auto_27292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27291 ?auto_27288 ) ( ON-TABLE ?auto_27288 ) ( not ( = ?auto_27288 ?auto_27291 ) ) ( not ( = ?auto_27288 ?auto_27290 ) ) ( not ( = ?auto_27288 ?auto_27289 ) ) ( not ( = ?auto_27291 ?auto_27290 ) ) ( not ( = ?auto_27291 ?auto_27289 ) ) ( not ( = ?auto_27290 ?auto_27289 ) ) ( ON ?auto_27290 ?auto_27291 ) ( not ( = ?auto_27292 ?auto_27289 ) ) ( not ( = ?auto_27288 ?auto_27292 ) ) ( not ( = ?auto_27291 ?auto_27292 ) ) ( not ( = ?auto_27290 ?auto_27292 ) ) ( ON ?auto_27289 ?auto_27290 ) ( ON ?auto_27292 ?auto_27289 ) ( CLEAR ?auto_27292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27288 ?auto_27291 ?auto_27290 ?auto_27289 )
      ( MAKE-1PILE ?auto_27288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27293 - BLOCK
    )
    :vars
    (
      ?auto_27295 - BLOCK
      ?auto_27297 - BLOCK
      ?auto_27296 - BLOCK
      ?auto_27294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27295 ?auto_27293 ) ( ON-TABLE ?auto_27293 ) ( not ( = ?auto_27293 ?auto_27295 ) ) ( not ( = ?auto_27293 ?auto_27297 ) ) ( not ( = ?auto_27293 ?auto_27296 ) ) ( not ( = ?auto_27295 ?auto_27297 ) ) ( not ( = ?auto_27295 ?auto_27296 ) ) ( not ( = ?auto_27297 ?auto_27296 ) ) ( ON ?auto_27297 ?auto_27295 ) ( not ( = ?auto_27294 ?auto_27296 ) ) ( not ( = ?auto_27293 ?auto_27294 ) ) ( not ( = ?auto_27295 ?auto_27294 ) ) ( not ( = ?auto_27297 ?auto_27294 ) ) ( ON ?auto_27296 ?auto_27297 ) ( HOLDING ?auto_27294 ) ( CLEAR ?auto_27296 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27293 ?auto_27295 ?auto_27297 ?auto_27296 ?auto_27294 )
      ( MAKE-1PILE ?auto_27293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27298 - BLOCK
    )
    :vars
    (
      ?auto_27302 - BLOCK
      ?auto_27300 - BLOCK
      ?auto_27301 - BLOCK
      ?auto_27299 - BLOCK
      ?auto_27303 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27302 ?auto_27298 ) ( ON-TABLE ?auto_27298 ) ( not ( = ?auto_27298 ?auto_27302 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27301 ) ) ( not ( = ?auto_27302 ?auto_27300 ) ) ( not ( = ?auto_27302 ?auto_27301 ) ) ( not ( = ?auto_27300 ?auto_27301 ) ) ( ON ?auto_27300 ?auto_27302 ) ( not ( = ?auto_27299 ?auto_27301 ) ) ( not ( = ?auto_27298 ?auto_27299 ) ) ( not ( = ?auto_27302 ?auto_27299 ) ) ( not ( = ?auto_27300 ?auto_27299 ) ) ( ON ?auto_27301 ?auto_27300 ) ( CLEAR ?auto_27301 ) ( ON ?auto_27299 ?auto_27303 ) ( CLEAR ?auto_27299 ) ( HAND-EMPTY ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( not ( = ?auto_27302 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27299 ?auto_27303 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27299 ?auto_27303 )
      ( MAKE-1PILE ?auto_27298 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27304 - BLOCK
    )
    :vars
    (
      ?auto_27308 - BLOCK
      ?auto_27309 - BLOCK
      ?auto_27307 - BLOCK
      ?auto_27305 - BLOCK
      ?auto_27306 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27308 ?auto_27304 ) ( ON-TABLE ?auto_27304 ) ( not ( = ?auto_27304 ?auto_27308 ) ) ( not ( = ?auto_27304 ?auto_27309 ) ) ( not ( = ?auto_27304 ?auto_27307 ) ) ( not ( = ?auto_27308 ?auto_27309 ) ) ( not ( = ?auto_27308 ?auto_27307 ) ) ( not ( = ?auto_27309 ?auto_27307 ) ) ( ON ?auto_27309 ?auto_27308 ) ( not ( = ?auto_27305 ?auto_27307 ) ) ( not ( = ?auto_27304 ?auto_27305 ) ) ( not ( = ?auto_27308 ?auto_27305 ) ) ( not ( = ?auto_27309 ?auto_27305 ) ) ( ON ?auto_27305 ?auto_27306 ) ( CLEAR ?auto_27305 ) ( not ( = ?auto_27304 ?auto_27306 ) ) ( not ( = ?auto_27308 ?auto_27306 ) ) ( not ( = ?auto_27309 ?auto_27306 ) ) ( not ( = ?auto_27307 ?auto_27306 ) ) ( not ( = ?auto_27305 ?auto_27306 ) ) ( HOLDING ?auto_27307 ) ( CLEAR ?auto_27309 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27304 ?auto_27308 ?auto_27309 ?auto_27307 )
      ( MAKE-1PILE ?auto_27304 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27310 - BLOCK
    )
    :vars
    (
      ?auto_27314 - BLOCK
      ?auto_27315 - BLOCK
      ?auto_27313 - BLOCK
      ?auto_27311 - BLOCK
      ?auto_27312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27314 ?auto_27310 ) ( ON-TABLE ?auto_27310 ) ( not ( = ?auto_27310 ?auto_27314 ) ) ( not ( = ?auto_27310 ?auto_27315 ) ) ( not ( = ?auto_27310 ?auto_27313 ) ) ( not ( = ?auto_27314 ?auto_27315 ) ) ( not ( = ?auto_27314 ?auto_27313 ) ) ( not ( = ?auto_27315 ?auto_27313 ) ) ( ON ?auto_27315 ?auto_27314 ) ( not ( = ?auto_27311 ?auto_27313 ) ) ( not ( = ?auto_27310 ?auto_27311 ) ) ( not ( = ?auto_27314 ?auto_27311 ) ) ( not ( = ?auto_27315 ?auto_27311 ) ) ( ON ?auto_27311 ?auto_27312 ) ( not ( = ?auto_27310 ?auto_27312 ) ) ( not ( = ?auto_27314 ?auto_27312 ) ) ( not ( = ?auto_27315 ?auto_27312 ) ) ( not ( = ?auto_27313 ?auto_27312 ) ) ( not ( = ?auto_27311 ?auto_27312 ) ) ( CLEAR ?auto_27315 ) ( ON ?auto_27313 ?auto_27311 ) ( CLEAR ?auto_27313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27312 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27312 ?auto_27311 )
      ( MAKE-1PILE ?auto_27310 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27316 - BLOCK
    )
    :vars
    (
      ?auto_27317 - BLOCK
      ?auto_27321 - BLOCK
      ?auto_27318 - BLOCK
      ?auto_27320 - BLOCK
      ?auto_27319 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27317 ?auto_27316 ) ( ON-TABLE ?auto_27316 ) ( not ( = ?auto_27316 ?auto_27317 ) ) ( not ( = ?auto_27316 ?auto_27321 ) ) ( not ( = ?auto_27316 ?auto_27318 ) ) ( not ( = ?auto_27317 ?auto_27321 ) ) ( not ( = ?auto_27317 ?auto_27318 ) ) ( not ( = ?auto_27321 ?auto_27318 ) ) ( not ( = ?auto_27320 ?auto_27318 ) ) ( not ( = ?auto_27316 ?auto_27320 ) ) ( not ( = ?auto_27317 ?auto_27320 ) ) ( not ( = ?auto_27321 ?auto_27320 ) ) ( ON ?auto_27320 ?auto_27319 ) ( not ( = ?auto_27316 ?auto_27319 ) ) ( not ( = ?auto_27317 ?auto_27319 ) ) ( not ( = ?auto_27321 ?auto_27319 ) ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( not ( = ?auto_27320 ?auto_27319 ) ) ( ON ?auto_27318 ?auto_27320 ) ( CLEAR ?auto_27318 ) ( ON-TABLE ?auto_27319 ) ( HOLDING ?auto_27321 ) ( CLEAR ?auto_27317 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27316 ?auto_27317 ?auto_27321 )
      ( MAKE-1PILE ?auto_27316 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27322 - BLOCK
    )
    :vars
    (
      ?auto_27323 - BLOCK
      ?auto_27327 - BLOCK
      ?auto_27325 - BLOCK
      ?auto_27324 - BLOCK
      ?auto_27326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_27323 ?auto_27322 ) ( ON-TABLE ?auto_27322 ) ( not ( = ?auto_27322 ?auto_27323 ) ) ( not ( = ?auto_27322 ?auto_27327 ) ) ( not ( = ?auto_27322 ?auto_27325 ) ) ( not ( = ?auto_27323 ?auto_27327 ) ) ( not ( = ?auto_27323 ?auto_27325 ) ) ( not ( = ?auto_27327 ?auto_27325 ) ) ( not ( = ?auto_27324 ?auto_27325 ) ) ( not ( = ?auto_27322 ?auto_27324 ) ) ( not ( = ?auto_27323 ?auto_27324 ) ) ( not ( = ?auto_27327 ?auto_27324 ) ) ( ON ?auto_27324 ?auto_27326 ) ( not ( = ?auto_27322 ?auto_27326 ) ) ( not ( = ?auto_27323 ?auto_27326 ) ) ( not ( = ?auto_27327 ?auto_27326 ) ) ( not ( = ?auto_27325 ?auto_27326 ) ) ( not ( = ?auto_27324 ?auto_27326 ) ) ( ON ?auto_27325 ?auto_27324 ) ( ON-TABLE ?auto_27326 ) ( CLEAR ?auto_27323 ) ( ON ?auto_27327 ?auto_27325 ) ( CLEAR ?auto_27327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27326 ?auto_27324 ?auto_27325 )
      ( MAKE-1PILE ?auto_27322 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27340 - BLOCK
    )
    :vars
    (
      ?auto_27343 - BLOCK
      ?auto_27342 - BLOCK
      ?auto_27341 - BLOCK
      ?auto_27344 - BLOCK
      ?auto_27345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27340 ?auto_27343 ) ) ( not ( = ?auto_27340 ?auto_27342 ) ) ( not ( = ?auto_27340 ?auto_27341 ) ) ( not ( = ?auto_27343 ?auto_27342 ) ) ( not ( = ?auto_27343 ?auto_27341 ) ) ( not ( = ?auto_27342 ?auto_27341 ) ) ( not ( = ?auto_27344 ?auto_27341 ) ) ( not ( = ?auto_27340 ?auto_27344 ) ) ( not ( = ?auto_27343 ?auto_27344 ) ) ( not ( = ?auto_27342 ?auto_27344 ) ) ( ON ?auto_27344 ?auto_27345 ) ( not ( = ?auto_27340 ?auto_27345 ) ) ( not ( = ?auto_27343 ?auto_27345 ) ) ( not ( = ?auto_27342 ?auto_27345 ) ) ( not ( = ?auto_27341 ?auto_27345 ) ) ( not ( = ?auto_27344 ?auto_27345 ) ) ( ON ?auto_27341 ?auto_27344 ) ( ON-TABLE ?auto_27345 ) ( ON ?auto_27342 ?auto_27341 ) ( ON ?auto_27343 ?auto_27342 ) ( CLEAR ?auto_27343 ) ( HOLDING ?auto_27340 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27340 ?auto_27343 )
      ( MAKE-1PILE ?auto_27340 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_27346 - BLOCK
    )
    :vars
    (
      ?auto_27350 - BLOCK
      ?auto_27347 - BLOCK
      ?auto_27351 - BLOCK
      ?auto_27349 - BLOCK
      ?auto_27348 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27346 ?auto_27350 ) ) ( not ( = ?auto_27346 ?auto_27347 ) ) ( not ( = ?auto_27346 ?auto_27351 ) ) ( not ( = ?auto_27350 ?auto_27347 ) ) ( not ( = ?auto_27350 ?auto_27351 ) ) ( not ( = ?auto_27347 ?auto_27351 ) ) ( not ( = ?auto_27349 ?auto_27351 ) ) ( not ( = ?auto_27346 ?auto_27349 ) ) ( not ( = ?auto_27350 ?auto_27349 ) ) ( not ( = ?auto_27347 ?auto_27349 ) ) ( ON ?auto_27349 ?auto_27348 ) ( not ( = ?auto_27346 ?auto_27348 ) ) ( not ( = ?auto_27350 ?auto_27348 ) ) ( not ( = ?auto_27347 ?auto_27348 ) ) ( not ( = ?auto_27351 ?auto_27348 ) ) ( not ( = ?auto_27349 ?auto_27348 ) ) ( ON ?auto_27351 ?auto_27349 ) ( ON-TABLE ?auto_27348 ) ( ON ?auto_27347 ?auto_27351 ) ( ON ?auto_27350 ?auto_27347 ) ( ON ?auto_27346 ?auto_27350 ) ( CLEAR ?auto_27346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27348 ?auto_27349 ?auto_27351 ?auto_27347 ?auto_27350 )
      ( MAKE-1PILE ?auto_27346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27356 - BLOCK
      ?auto_27357 - BLOCK
      ?auto_27358 - BLOCK
      ?auto_27359 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27359 ) ( CLEAR ?auto_27358 ) ( ON-TABLE ?auto_27356 ) ( ON ?auto_27357 ?auto_27356 ) ( ON ?auto_27358 ?auto_27357 ) ( not ( = ?auto_27356 ?auto_27357 ) ) ( not ( = ?auto_27356 ?auto_27358 ) ) ( not ( = ?auto_27356 ?auto_27359 ) ) ( not ( = ?auto_27357 ?auto_27358 ) ) ( not ( = ?auto_27357 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27359 ) ) )
    :subtasks
    ( ( !STACK ?auto_27359 ?auto_27358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27360 - BLOCK
      ?auto_27361 - BLOCK
      ?auto_27362 - BLOCK
      ?auto_27363 - BLOCK
    )
    :vars
    (
      ?auto_27364 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27362 ) ( ON-TABLE ?auto_27360 ) ( ON ?auto_27361 ?auto_27360 ) ( ON ?auto_27362 ?auto_27361 ) ( not ( = ?auto_27360 ?auto_27361 ) ) ( not ( = ?auto_27360 ?auto_27362 ) ) ( not ( = ?auto_27360 ?auto_27363 ) ) ( not ( = ?auto_27361 ?auto_27362 ) ) ( not ( = ?auto_27361 ?auto_27363 ) ) ( not ( = ?auto_27362 ?auto_27363 ) ) ( ON ?auto_27363 ?auto_27364 ) ( CLEAR ?auto_27363 ) ( HAND-EMPTY ) ( not ( = ?auto_27360 ?auto_27364 ) ) ( not ( = ?auto_27361 ?auto_27364 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( not ( = ?auto_27363 ?auto_27364 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27363 ?auto_27364 )
      ( MAKE-4PILE ?auto_27360 ?auto_27361 ?auto_27362 ?auto_27363 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27365 - BLOCK
      ?auto_27366 - BLOCK
      ?auto_27367 - BLOCK
      ?auto_27368 - BLOCK
    )
    :vars
    (
      ?auto_27369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27365 ) ( ON ?auto_27366 ?auto_27365 ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27365 ?auto_27368 ) ) ( not ( = ?auto_27366 ?auto_27367 ) ) ( not ( = ?auto_27366 ?auto_27368 ) ) ( not ( = ?auto_27367 ?auto_27368 ) ) ( ON ?auto_27368 ?auto_27369 ) ( CLEAR ?auto_27368 ) ( not ( = ?auto_27365 ?auto_27369 ) ) ( not ( = ?auto_27366 ?auto_27369 ) ) ( not ( = ?auto_27367 ?auto_27369 ) ) ( not ( = ?auto_27368 ?auto_27369 ) ) ( HOLDING ?auto_27367 ) ( CLEAR ?auto_27366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27365 ?auto_27366 ?auto_27367 )
      ( MAKE-4PILE ?auto_27365 ?auto_27366 ?auto_27367 ?auto_27368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27370 - BLOCK
      ?auto_27371 - BLOCK
      ?auto_27372 - BLOCK
      ?auto_27373 - BLOCK
    )
    :vars
    (
      ?auto_27374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27370 ) ( ON ?auto_27371 ?auto_27370 ) ( not ( = ?auto_27370 ?auto_27371 ) ) ( not ( = ?auto_27370 ?auto_27372 ) ) ( not ( = ?auto_27370 ?auto_27373 ) ) ( not ( = ?auto_27371 ?auto_27372 ) ) ( not ( = ?auto_27371 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27373 ) ) ( ON ?auto_27373 ?auto_27374 ) ( not ( = ?auto_27370 ?auto_27374 ) ) ( not ( = ?auto_27371 ?auto_27374 ) ) ( not ( = ?auto_27372 ?auto_27374 ) ) ( not ( = ?auto_27373 ?auto_27374 ) ) ( CLEAR ?auto_27371 ) ( ON ?auto_27372 ?auto_27373 ) ( CLEAR ?auto_27372 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27374 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27374 ?auto_27373 )
      ( MAKE-4PILE ?auto_27370 ?auto_27371 ?auto_27372 ?auto_27373 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27375 - BLOCK
      ?auto_27376 - BLOCK
      ?auto_27377 - BLOCK
      ?auto_27378 - BLOCK
    )
    :vars
    (
      ?auto_27379 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27375 ) ( not ( = ?auto_27375 ?auto_27376 ) ) ( not ( = ?auto_27375 ?auto_27377 ) ) ( not ( = ?auto_27375 ?auto_27378 ) ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27378 ) ) ( not ( = ?auto_27377 ?auto_27378 ) ) ( ON ?auto_27378 ?auto_27379 ) ( not ( = ?auto_27375 ?auto_27379 ) ) ( not ( = ?auto_27376 ?auto_27379 ) ) ( not ( = ?auto_27377 ?auto_27379 ) ) ( not ( = ?auto_27378 ?auto_27379 ) ) ( ON ?auto_27377 ?auto_27378 ) ( CLEAR ?auto_27377 ) ( ON-TABLE ?auto_27379 ) ( HOLDING ?auto_27376 ) ( CLEAR ?auto_27375 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27375 ?auto_27376 )
      ( MAKE-4PILE ?auto_27375 ?auto_27376 ?auto_27377 ?auto_27378 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27380 - BLOCK
      ?auto_27381 - BLOCK
      ?auto_27382 - BLOCK
      ?auto_27383 - BLOCK
    )
    :vars
    (
      ?auto_27384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27380 ) ( not ( = ?auto_27380 ?auto_27381 ) ) ( not ( = ?auto_27380 ?auto_27382 ) ) ( not ( = ?auto_27380 ?auto_27383 ) ) ( not ( = ?auto_27381 ?auto_27382 ) ) ( not ( = ?auto_27381 ?auto_27383 ) ) ( not ( = ?auto_27382 ?auto_27383 ) ) ( ON ?auto_27383 ?auto_27384 ) ( not ( = ?auto_27380 ?auto_27384 ) ) ( not ( = ?auto_27381 ?auto_27384 ) ) ( not ( = ?auto_27382 ?auto_27384 ) ) ( not ( = ?auto_27383 ?auto_27384 ) ) ( ON ?auto_27382 ?auto_27383 ) ( ON-TABLE ?auto_27384 ) ( CLEAR ?auto_27380 ) ( ON ?auto_27381 ?auto_27382 ) ( CLEAR ?auto_27381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27384 ?auto_27383 ?auto_27382 )
      ( MAKE-4PILE ?auto_27380 ?auto_27381 ?auto_27382 ?auto_27383 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27385 - BLOCK
      ?auto_27386 - BLOCK
      ?auto_27387 - BLOCK
      ?auto_27388 - BLOCK
    )
    :vars
    (
      ?auto_27389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27385 ?auto_27386 ) ) ( not ( = ?auto_27385 ?auto_27387 ) ) ( not ( = ?auto_27385 ?auto_27388 ) ) ( not ( = ?auto_27386 ?auto_27387 ) ) ( not ( = ?auto_27386 ?auto_27388 ) ) ( not ( = ?auto_27387 ?auto_27388 ) ) ( ON ?auto_27388 ?auto_27389 ) ( not ( = ?auto_27385 ?auto_27389 ) ) ( not ( = ?auto_27386 ?auto_27389 ) ) ( not ( = ?auto_27387 ?auto_27389 ) ) ( not ( = ?auto_27388 ?auto_27389 ) ) ( ON ?auto_27387 ?auto_27388 ) ( ON-TABLE ?auto_27389 ) ( ON ?auto_27386 ?auto_27387 ) ( CLEAR ?auto_27386 ) ( HOLDING ?auto_27385 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27385 )
      ( MAKE-4PILE ?auto_27385 ?auto_27386 ?auto_27387 ?auto_27388 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27390 - BLOCK
      ?auto_27391 - BLOCK
      ?auto_27392 - BLOCK
      ?auto_27393 - BLOCK
    )
    :vars
    (
      ?auto_27394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27390 ?auto_27392 ) ) ( not ( = ?auto_27390 ?auto_27393 ) ) ( not ( = ?auto_27391 ?auto_27392 ) ) ( not ( = ?auto_27391 ?auto_27393 ) ) ( not ( = ?auto_27392 ?auto_27393 ) ) ( ON ?auto_27393 ?auto_27394 ) ( not ( = ?auto_27390 ?auto_27394 ) ) ( not ( = ?auto_27391 ?auto_27394 ) ) ( not ( = ?auto_27392 ?auto_27394 ) ) ( not ( = ?auto_27393 ?auto_27394 ) ) ( ON ?auto_27392 ?auto_27393 ) ( ON-TABLE ?auto_27394 ) ( ON ?auto_27391 ?auto_27392 ) ( ON ?auto_27390 ?auto_27391 ) ( CLEAR ?auto_27390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27394 ?auto_27393 ?auto_27392 ?auto_27391 )
      ( MAKE-4PILE ?auto_27390 ?auto_27391 ?auto_27392 ?auto_27393 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27395 - BLOCK
      ?auto_27396 - BLOCK
      ?auto_27397 - BLOCK
      ?auto_27398 - BLOCK
    )
    :vars
    (
      ?auto_27399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27395 ?auto_27396 ) ) ( not ( = ?auto_27395 ?auto_27397 ) ) ( not ( = ?auto_27395 ?auto_27398 ) ) ( not ( = ?auto_27396 ?auto_27397 ) ) ( not ( = ?auto_27396 ?auto_27398 ) ) ( not ( = ?auto_27397 ?auto_27398 ) ) ( ON ?auto_27398 ?auto_27399 ) ( not ( = ?auto_27395 ?auto_27399 ) ) ( not ( = ?auto_27396 ?auto_27399 ) ) ( not ( = ?auto_27397 ?auto_27399 ) ) ( not ( = ?auto_27398 ?auto_27399 ) ) ( ON ?auto_27397 ?auto_27398 ) ( ON-TABLE ?auto_27399 ) ( ON ?auto_27396 ?auto_27397 ) ( HOLDING ?auto_27395 ) ( CLEAR ?auto_27396 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27399 ?auto_27398 ?auto_27397 ?auto_27396 ?auto_27395 )
      ( MAKE-4PILE ?auto_27395 ?auto_27396 ?auto_27397 ?auto_27398 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27400 - BLOCK
      ?auto_27401 - BLOCK
      ?auto_27402 - BLOCK
      ?auto_27403 - BLOCK
    )
    :vars
    (
      ?auto_27404 - BLOCK
      ?auto_27405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27400 ?auto_27401 ) ) ( not ( = ?auto_27400 ?auto_27402 ) ) ( not ( = ?auto_27400 ?auto_27403 ) ) ( not ( = ?auto_27401 ?auto_27402 ) ) ( not ( = ?auto_27401 ?auto_27403 ) ) ( not ( = ?auto_27402 ?auto_27403 ) ) ( ON ?auto_27403 ?auto_27404 ) ( not ( = ?auto_27400 ?auto_27404 ) ) ( not ( = ?auto_27401 ?auto_27404 ) ) ( not ( = ?auto_27402 ?auto_27404 ) ) ( not ( = ?auto_27403 ?auto_27404 ) ) ( ON ?auto_27402 ?auto_27403 ) ( ON-TABLE ?auto_27404 ) ( ON ?auto_27401 ?auto_27402 ) ( CLEAR ?auto_27401 ) ( ON ?auto_27400 ?auto_27405 ) ( CLEAR ?auto_27400 ) ( HAND-EMPTY ) ( not ( = ?auto_27400 ?auto_27405 ) ) ( not ( = ?auto_27401 ?auto_27405 ) ) ( not ( = ?auto_27402 ?auto_27405 ) ) ( not ( = ?auto_27403 ?auto_27405 ) ) ( not ( = ?auto_27404 ?auto_27405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27400 ?auto_27405 )
      ( MAKE-4PILE ?auto_27400 ?auto_27401 ?auto_27402 ?auto_27403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27406 - BLOCK
      ?auto_27407 - BLOCK
      ?auto_27408 - BLOCK
      ?auto_27409 - BLOCK
    )
    :vars
    (
      ?auto_27411 - BLOCK
      ?auto_27410 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27406 ?auto_27407 ) ) ( not ( = ?auto_27406 ?auto_27408 ) ) ( not ( = ?auto_27406 ?auto_27409 ) ) ( not ( = ?auto_27407 ?auto_27408 ) ) ( not ( = ?auto_27407 ?auto_27409 ) ) ( not ( = ?auto_27408 ?auto_27409 ) ) ( ON ?auto_27409 ?auto_27411 ) ( not ( = ?auto_27406 ?auto_27411 ) ) ( not ( = ?auto_27407 ?auto_27411 ) ) ( not ( = ?auto_27408 ?auto_27411 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( ON ?auto_27408 ?auto_27409 ) ( ON-TABLE ?auto_27411 ) ( ON ?auto_27406 ?auto_27410 ) ( CLEAR ?auto_27406 ) ( not ( = ?auto_27406 ?auto_27410 ) ) ( not ( = ?auto_27407 ?auto_27410 ) ) ( not ( = ?auto_27408 ?auto_27410 ) ) ( not ( = ?auto_27409 ?auto_27410 ) ) ( not ( = ?auto_27411 ?auto_27410 ) ) ( HOLDING ?auto_27407 ) ( CLEAR ?auto_27408 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27411 ?auto_27409 ?auto_27408 ?auto_27407 )
      ( MAKE-4PILE ?auto_27406 ?auto_27407 ?auto_27408 ?auto_27409 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27412 - BLOCK
      ?auto_27413 - BLOCK
      ?auto_27414 - BLOCK
      ?auto_27415 - BLOCK
    )
    :vars
    (
      ?auto_27417 - BLOCK
      ?auto_27416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27412 ?auto_27413 ) ) ( not ( = ?auto_27412 ?auto_27414 ) ) ( not ( = ?auto_27412 ?auto_27415 ) ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27415 ) ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( ON ?auto_27415 ?auto_27417 ) ( not ( = ?auto_27412 ?auto_27417 ) ) ( not ( = ?auto_27413 ?auto_27417 ) ) ( not ( = ?auto_27414 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( ON ?auto_27414 ?auto_27415 ) ( ON-TABLE ?auto_27417 ) ( ON ?auto_27412 ?auto_27416 ) ( not ( = ?auto_27412 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27414 ?auto_27416 ) ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27417 ?auto_27416 ) ) ( CLEAR ?auto_27414 ) ( ON ?auto_27413 ?auto_27412 ) ( CLEAR ?auto_27413 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27416 ?auto_27412 )
      ( MAKE-4PILE ?auto_27412 ?auto_27413 ?auto_27414 ?auto_27415 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27418 - BLOCK
      ?auto_27419 - BLOCK
      ?auto_27420 - BLOCK
      ?auto_27421 - BLOCK
    )
    :vars
    (
      ?auto_27422 - BLOCK
      ?auto_27423 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27420 ) ) ( not ( = ?auto_27418 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27420 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27420 ?auto_27421 ) ) ( ON ?auto_27421 ?auto_27422 ) ( not ( = ?auto_27418 ?auto_27422 ) ) ( not ( = ?auto_27419 ?auto_27422 ) ) ( not ( = ?auto_27420 ?auto_27422 ) ) ( not ( = ?auto_27421 ?auto_27422 ) ) ( ON-TABLE ?auto_27422 ) ( ON ?auto_27418 ?auto_27423 ) ( not ( = ?auto_27418 ?auto_27423 ) ) ( not ( = ?auto_27419 ?auto_27423 ) ) ( not ( = ?auto_27420 ?auto_27423 ) ) ( not ( = ?auto_27421 ?auto_27423 ) ) ( not ( = ?auto_27422 ?auto_27423 ) ) ( ON ?auto_27419 ?auto_27418 ) ( CLEAR ?auto_27419 ) ( ON-TABLE ?auto_27423 ) ( HOLDING ?auto_27420 ) ( CLEAR ?auto_27421 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27422 ?auto_27421 ?auto_27420 )
      ( MAKE-4PILE ?auto_27418 ?auto_27419 ?auto_27420 ?auto_27421 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27424 - BLOCK
      ?auto_27425 - BLOCK
      ?auto_27426 - BLOCK
      ?auto_27427 - BLOCK
    )
    :vars
    (
      ?auto_27428 - BLOCK
      ?auto_27429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27424 ?auto_27425 ) ) ( not ( = ?auto_27424 ?auto_27426 ) ) ( not ( = ?auto_27424 ?auto_27427 ) ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27427 ) ) ( not ( = ?auto_27426 ?auto_27427 ) ) ( ON ?auto_27427 ?auto_27428 ) ( not ( = ?auto_27424 ?auto_27428 ) ) ( not ( = ?auto_27425 ?auto_27428 ) ) ( not ( = ?auto_27426 ?auto_27428 ) ) ( not ( = ?auto_27427 ?auto_27428 ) ) ( ON-TABLE ?auto_27428 ) ( ON ?auto_27424 ?auto_27429 ) ( not ( = ?auto_27424 ?auto_27429 ) ) ( not ( = ?auto_27425 ?auto_27429 ) ) ( not ( = ?auto_27426 ?auto_27429 ) ) ( not ( = ?auto_27427 ?auto_27429 ) ) ( not ( = ?auto_27428 ?auto_27429 ) ) ( ON ?auto_27425 ?auto_27424 ) ( ON-TABLE ?auto_27429 ) ( CLEAR ?auto_27427 ) ( ON ?auto_27426 ?auto_27425 ) ( CLEAR ?auto_27426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27429 ?auto_27424 ?auto_27425 )
      ( MAKE-4PILE ?auto_27424 ?auto_27425 ?auto_27426 ?auto_27427 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27430 - BLOCK
      ?auto_27431 - BLOCK
      ?auto_27432 - BLOCK
      ?auto_27433 - BLOCK
    )
    :vars
    (
      ?auto_27435 - BLOCK
      ?auto_27434 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27430 ?auto_27431 ) ) ( not ( = ?auto_27430 ?auto_27432 ) ) ( not ( = ?auto_27430 ?auto_27433 ) ) ( not ( = ?auto_27431 ?auto_27432 ) ) ( not ( = ?auto_27431 ?auto_27433 ) ) ( not ( = ?auto_27432 ?auto_27433 ) ) ( not ( = ?auto_27430 ?auto_27435 ) ) ( not ( = ?auto_27431 ?auto_27435 ) ) ( not ( = ?auto_27432 ?auto_27435 ) ) ( not ( = ?auto_27433 ?auto_27435 ) ) ( ON-TABLE ?auto_27435 ) ( ON ?auto_27430 ?auto_27434 ) ( not ( = ?auto_27430 ?auto_27434 ) ) ( not ( = ?auto_27431 ?auto_27434 ) ) ( not ( = ?auto_27432 ?auto_27434 ) ) ( not ( = ?auto_27433 ?auto_27434 ) ) ( not ( = ?auto_27435 ?auto_27434 ) ) ( ON ?auto_27431 ?auto_27430 ) ( ON-TABLE ?auto_27434 ) ( ON ?auto_27432 ?auto_27431 ) ( CLEAR ?auto_27432 ) ( HOLDING ?auto_27433 ) ( CLEAR ?auto_27435 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27435 ?auto_27433 )
      ( MAKE-4PILE ?auto_27430 ?auto_27431 ?auto_27432 ?auto_27433 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27436 - BLOCK
      ?auto_27437 - BLOCK
      ?auto_27438 - BLOCK
      ?auto_27439 - BLOCK
    )
    :vars
    (
      ?auto_27441 - BLOCK
      ?auto_27440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27436 ?auto_27437 ) ) ( not ( = ?auto_27436 ?auto_27438 ) ) ( not ( = ?auto_27436 ?auto_27439 ) ) ( not ( = ?auto_27437 ?auto_27438 ) ) ( not ( = ?auto_27437 ?auto_27439 ) ) ( not ( = ?auto_27438 ?auto_27439 ) ) ( not ( = ?auto_27436 ?auto_27441 ) ) ( not ( = ?auto_27437 ?auto_27441 ) ) ( not ( = ?auto_27438 ?auto_27441 ) ) ( not ( = ?auto_27439 ?auto_27441 ) ) ( ON-TABLE ?auto_27441 ) ( ON ?auto_27436 ?auto_27440 ) ( not ( = ?auto_27436 ?auto_27440 ) ) ( not ( = ?auto_27437 ?auto_27440 ) ) ( not ( = ?auto_27438 ?auto_27440 ) ) ( not ( = ?auto_27439 ?auto_27440 ) ) ( not ( = ?auto_27441 ?auto_27440 ) ) ( ON ?auto_27437 ?auto_27436 ) ( ON-TABLE ?auto_27440 ) ( ON ?auto_27438 ?auto_27437 ) ( CLEAR ?auto_27441 ) ( ON ?auto_27439 ?auto_27438 ) ( CLEAR ?auto_27439 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27440 ?auto_27436 ?auto_27437 ?auto_27438 )
      ( MAKE-4PILE ?auto_27436 ?auto_27437 ?auto_27438 ?auto_27439 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27442 - BLOCK
      ?auto_27443 - BLOCK
      ?auto_27444 - BLOCK
      ?auto_27445 - BLOCK
    )
    :vars
    (
      ?auto_27447 - BLOCK
      ?auto_27446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27442 ?auto_27443 ) ) ( not ( = ?auto_27442 ?auto_27444 ) ) ( not ( = ?auto_27442 ?auto_27445 ) ) ( not ( = ?auto_27443 ?auto_27444 ) ) ( not ( = ?auto_27443 ?auto_27445 ) ) ( not ( = ?auto_27444 ?auto_27445 ) ) ( not ( = ?auto_27442 ?auto_27447 ) ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27447 ) ) ( not ( = ?auto_27445 ?auto_27447 ) ) ( ON ?auto_27442 ?auto_27446 ) ( not ( = ?auto_27442 ?auto_27446 ) ) ( not ( = ?auto_27443 ?auto_27446 ) ) ( not ( = ?auto_27444 ?auto_27446 ) ) ( not ( = ?auto_27445 ?auto_27446 ) ) ( not ( = ?auto_27447 ?auto_27446 ) ) ( ON ?auto_27443 ?auto_27442 ) ( ON-TABLE ?auto_27446 ) ( ON ?auto_27444 ?auto_27443 ) ( ON ?auto_27445 ?auto_27444 ) ( CLEAR ?auto_27445 ) ( HOLDING ?auto_27447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27447 )
      ( MAKE-4PILE ?auto_27442 ?auto_27443 ?auto_27444 ?auto_27445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_27448 - BLOCK
      ?auto_27449 - BLOCK
      ?auto_27450 - BLOCK
      ?auto_27451 - BLOCK
    )
    :vars
    (
      ?auto_27453 - BLOCK
      ?auto_27452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27448 ?auto_27449 ) ) ( not ( = ?auto_27448 ?auto_27450 ) ) ( not ( = ?auto_27448 ?auto_27451 ) ) ( not ( = ?auto_27449 ?auto_27450 ) ) ( not ( = ?auto_27449 ?auto_27451 ) ) ( not ( = ?auto_27450 ?auto_27451 ) ) ( not ( = ?auto_27448 ?auto_27453 ) ) ( not ( = ?auto_27449 ?auto_27453 ) ) ( not ( = ?auto_27450 ?auto_27453 ) ) ( not ( = ?auto_27451 ?auto_27453 ) ) ( ON ?auto_27448 ?auto_27452 ) ( not ( = ?auto_27448 ?auto_27452 ) ) ( not ( = ?auto_27449 ?auto_27452 ) ) ( not ( = ?auto_27450 ?auto_27452 ) ) ( not ( = ?auto_27451 ?auto_27452 ) ) ( not ( = ?auto_27453 ?auto_27452 ) ) ( ON ?auto_27449 ?auto_27448 ) ( ON-TABLE ?auto_27452 ) ( ON ?auto_27450 ?auto_27449 ) ( ON ?auto_27451 ?auto_27450 ) ( ON ?auto_27453 ?auto_27451 ) ( CLEAR ?auto_27453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27452 ?auto_27448 ?auto_27449 ?auto_27450 ?auto_27451 )
      ( MAKE-4PILE ?auto_27448 ?auto_27449 ?auto_27450 ?auto_27451 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27459 - BLOCK
      ?auto_27460 - BLOCK
      ?auto_27461 - BLOCK
      ?auto_27462 - BLOCK
      ?auto_27463 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_27463 ) ( CLEAR ?auto_27462 ) ( ON-TABLE ?auto_27459 ) ( ON ?auto_27460 ?auto_27459 ) ( ON ?auto_27461 ?auto_27460 ) ( ON ?auto_27462 ?auto_27461 ) ( not ( = ?auto_27459 ?auto_27460 ) ) ( not ( = ?auto_27459 ?auto_27461 ) ) ( not ( = ?auto_27459 ?auto_27462 ) ) ( not ( = ?auto_27459 ?auto_27463 ) ) ( not ( = ?auto_27460 ?auto_27461 ) ) ( not ( = ?auto_27460 ?auto_27462 ) ) ( not ( = ?auto_27460 ?auto_27463 ) ) ( not ( = ?auto_27461 ?auto_27462 ) ) ( not ( = ?auto_27461 ?auto_27463 ) ) ( not ( = ?auto_27462 ?auto_27463 ) ) )
    :subtasks
    ( ( !STACK ?auto_27463 ?auto_27462 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27464 - BLOCK
      ?auto_27465 - BLOCK
      ?auto_27466 - BLOCK
      ?auto_27467 - BLOCK
      ?auto_27468 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_27467 ) ( ON-TABLE ?auto_27464 ) ( ON ?auto_27465 ?auto_27464 ) ( ON ?auto_27466 ?auto_27465 ) ( ON ?auto_27467 ?auto_27466 ) ( not ( = ?auto_27464 ?auto_27465 ) ) ( not ( = ?auto_27464 ?auto_27466 ) ) ( not ( = ?auto_27464 ?auto_27467 ) ) ( not ( = ?auto_27464 ?auto_27468 ) ) ( not ( = ?auto_27465 ?auto_27466 ) ) ( not ( = ?auto_27465 ?auto_27467 ) ) ( not ( = ?auto_27465 ?auto_27468 ) ) ( not ( = ?auto_27466 ?auto_27467 ) ) ( not ( = ?auto_27466 ?auto_27468 ) ) ( not ( = ?auto_27467 ?auto_27468 ) ) ( ON-TABLE ?auto_27468 ) ( CLEAR ?auto_27468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_27468 )
      ( MAKE-5PILE ?auto_27464 ?auto_27465 ?auto_27466 ?auto_27467 ?auto_27468 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27469 - BLOCK
      ?auto_27470 - BLOCK
      ?auto_27471 - BLOCK
      ?auto_27472 - BLOCK
      ?auto_27473 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27469 ) ( ON ?auto_27470 ?auto_27469 ) ( ON ?auto_27471 ?auto_27470 ) ( not ( = ?auto_27469 ?auto_27470 ) ) ( not ( = ?auto_27469 ?auto_27471 ) ) ( not ( = ?auto_27469 ?auto_27472 ) ) ( not ( = ?auto_27469 ?auto_27473 ) ) ( not ( = ?auto_27470 ?auto_27471 ) ) ( not ( = ?auto_27470 ?auto_27472 ) ) ( not ( = ?auto_27470 ?auto_27473 ) ) ( not ( = ?auto_27471 ?auto_27472 ) ) ( not ( = ?auto_27471 ?auto_27473 ) ) ( not ( = ?auto_27472 ?auto_27473 ) ) ( ON-TABLE ?auto_27473 ) ( CLEAR ?auto_27473 ) ( HOLDING ?auto_27472 ) ( CLEAR ?auto_27471 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27469 ?auto_27470 ?auto_27471 ?auto_27472 )
      ( MAKE-5PILE ?auto_27469 ?auto_27470 ?auto_27471 ?auto_27472 ?auto_27473 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27474 - BLOCK
      ?auto_27475 - BLOCK
      ?auto_27476 - BLOCK
      ?auto_27477 - BLOCK
      ?auto_27478 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27474 ) ( ON ?auto_27475 ?auto_27474 ) ( ON ?auto_27476 ?auto_27475 ) ( not ( = ?auto_27474 ?auto_27475 ) ) ( not ( = ?auto_27474 ?auto_27476 ) ) ( not ( = ?auto_27474 ?auto_27477 ) ) ( not ( = ?auto_27474 ?auto_27478 ) ) ( not ( = ?auto_27475 ?auto_27476 ) ) ( not ( = ?auto_27475 ?auto_27477 ) ) ( not ( = ?auto_27475 ?auto_27478 ) ) ( not ( = ?auto_27476 ?auto_27477 ) ) ( not ( = ?auto_27476 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( ON-TABLE ?auto_27478 ) ( CLEAR ?auto_27476 ) ( ON ?auto_27477 ?auto_27478 ) ( CLEAR ?auto_27477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27478 )
      ( MAKE-5PILE ?auto_27474 ?auto_27475 ?auto_27476 ?auto_27477 ?auto_27478 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27479 - BLOCK
      ?auto_27480 - BLOCK
      ?auto_27481 - BLOCK
      ?auto_27482 - BLOCK
      ?auto_27483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27479 ) ( ON ?auto_27480 ?auto_27479 ) ( not ( = ?auto_27479 ?auto_27480 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( ON-TABLE ?auto_27483 ) ( ON ?auto_27482 ?auto_27483 ) ( CLEAR ?auto_27482 ) ( HOLDING ?auto_27481 ) ( CLEAR ?auto_27480 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27479 ?auto_27480 ?auto_27481 )
      ( MAKE-5PILE ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27484 - BLOCK
      ?auto_27485 - BLOCK
      ?auto_27486 - BLOCK
      ?auto_27487 - BLOCK
      ?auto_27488 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27484 ) ( ON ?auto_27485 ?auto_27484 ) ( not ( = ?auto_27484 ?auto_27485 ) ) ( not ( = ?auto_27484 ?auto_27486 ) ) ( not ( = ?auto_27484 ?auto_27487 ) ) ( not ( = ?auto_27484 ?auto_27488 ) ) ( not ( = ?auto_27485 ?auto_27486 ) ) ( not ( = ?auto_27485 ?auto_27487 ) ) ( not ( = ?auto_27485 ?auto_27488 ) ) ( not ( = ?auto_27486 ?auto_27487 ) ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( not ( = ?auto_27487 ?auto_27488 ) ) ( ON-TABLE ?auto_27488 ) ( ON ?auto_27487 ?auto_27488 ) ( CLEAR ?auto_27485 ) ( ON ?auto_27486 ?auto_27487 ) ( CLEAR ?auto_27486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27488 ?auto_27487 )
      ( MAKE-5PILE ?auto_27484 ?auto_27485 ?auto_27486 ?auto_27487 ?auto_27488 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27489 - BLOCK
      ?auto_27490 - BLOCK
      ?auto_27491 - BLOCK
      ?auto_27492 - BLOCK
      ?auto_27493 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27489 ) ( not ( = ?auto_27489 ?auto_27490 ) ) ( not ( = ?auto_27489 ?auto_27491 ) ) ( not ( = ?auto_27489 ?auto_27492 ) ) ( not ( = ?auto_27489 ?auto_27493 ) ) ( not ( = ?auto_27490 ?auto_27491 ) ) ( not ( = ?auto_27490 ?auto_27492 ) ) ( not ( = ?auto_27490 ?auto_27493 ) ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( not ( = ?auto_27491 ?auto_27493 ) ) ( not ( = ?auto_27492 ?auto_27493 ) ) ( ON-TABLE ?auto_27493 ) ( ON ?auto_27492 ?auto_27493 ) ( ON ?auto_27491 ?auto_27492 ) ( CLEAR ?auto_27491 ) ( HOLDING ?auto_27490 ) ( CLEAR ?auto_27489 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27489 ?auto_27490 )
      ( MAKE-5PILE ?auto_27489 ?auto_27490 ?auto_27491 ?auto_27492 ?auto_27493 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27494 - BLOCK
      ?auto_27495 - BLOCK
      ?auto_27496 - BLOCK
      ?auto_27497 - BLOCK
      ?auto_27498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_27494 ) ( not ( = ?auto_27494 ?auto_27495 ) ) ( not ( = ?auto_27494 ?auto_27496 ) ) ( not ( = ?auto_27494 ?auto_27497 ) ) ( not ( = ?auto_27494 ?auto_27498 ) ) ( not ( = ?auto_27495 ?auto_27496 ) ) ( not ( = ?auto_27495 ?auto_27497 ) ) ( not ( = ?auto_27495 ?auto_27498 ) ) ( not ( = ?auto_27496 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27498 ) ) ( not ( = ?auto_27497 ?auto_27498 ) ) ( ON-TABLE ?auto_27498 ) ( ON ?auto_27497 ?auto_27498 ) ( ON ?auto_27496 ?auto_27497 ) ( CLEAR ?auto_27494 ) ( ON ?auto_27495 ?auto_27496 ) ( CLEAR ?auto_27495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27498 ?auto_27497 ?auto_27496 )
      ( MAKE-5PILE ?auto_27494 ?auto_27495 ?auto_27496 ?auto_27497 ?auto_27498 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27499 - BLOCK
      ?auto_27500 - BLOCK
      ?auto_27501 - BLOCK
      ?auto_27502 - BLOCK
      ?auto_27503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27499 ?auto_27500 ) ) ( not ( = ?auto_27499 ?auto_27501 ) ) ( not ( = ?auto_27499 ?auto_27502 ) ) ( not ( = ?auto_27499 ?auto_27503 ) ) ( not ( = ?auto_27500 ?auto_27501 ) ) ( not ( = ?auto_27500 ?auto_27502 ) ) ( not ( = ?auto_27500 ?auto_27503 ) ) ( not ( = ?auto_27501 ?auto_27502 ) ) ( not ( = ?auto_27501 ?auto_27503 ) ) ( not ( = ?auto_27502 ?auto_27503 ) ) ( ON-TABLE ?auto_27503 ) ( ON ?auto_27502 ?auto_27503 ) ( ON ?auto_27501 ?auto_27502 ) ( ON ?auto_27500 ?auto_27501 ) ( CLEAR ?auto_27500 ) ( HOLDING ?auto_27499 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27499 )
      ( MAKE-5PILE ?auto_27499 ?auto_27500 ?auto_27501 ?auto_27502 ?auto_27503 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27504 - BLOCK
      ?auto_27505 - BLOCK
      ?auto_27506 - BLOCK
      ?auto_27507 - BLOCK
      ?auto_27508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27504 ?auto_27505 ) ) ( not ( = ?auto_27504 ?auto_27506 ) ) ( not ( = ?auto_27504 ?auto_27507 ) ) ( not ( = ?auto_27504 ?auto_27508 ) ) ( not ( = ?auto_27505 ?auto_27506 ) ) ( not ( = ?auto_27505 ?auto_27507 ) ) ( not ( = ?auto_27505 ?auto_27508 ) ) ( not ( = ?auto_27506 ?auto_27507 ) ) ( not ( = ?auto_27506 ?auto_27508 ) ) ( not ( = ?auto_27507 ?auto_27508 ) ) ( ON-TABLE ?auto_27508 ) ( ON ?auto_27507 ?auto_27508 ) ( ON ?auto_27506 ?auto_27507 ) ( ON ?auto_27505 ?auto_27506 ) ( ON ?auto_27504 ?auto_27505 ) ( CLEAR ?auto_27504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27508 ?auto_27507 ?auto_27506 ?auto_27505 )
      ( MAKE-5PILE ?auto_27504 ?auto_27505 ?auto_27506 ?auto_27507 ?auto_27508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27509 - BLOCK
      ?auto_27510 - BLOCK
      ?auto_27511 - BLOCK
      ?auto_27512 - BLOCK
      ?auto_27513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27509 ?auto_27510 ) ) ( not ( = ?auto_27509 ?auto_27511 ) ) ( not ( = ?auto_27509 ?auto_27512 ) ) ( not ( = ?auto_27509 ?auto_27513 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27512 ) ) ( not ( = ?auto_27510 ?auto_27513 ) ) ( not ( = ?auto_27511 ?auto_27512 ) ) ( not ( = ?auto_27511 ?auto_27513 ) ) ( not ( = ?auto_27512 ?auto_27513 ) ) ( ON-TABLE ?auto_27513 ) ( ON ?auto_27512 ?auto_27513 ) ( ON ?auto_27511 ?auto_27512 ) ( ON ?auto_27510 ?auto_27511 ) ( HOLDING ?auto_27509 ) ( CLEAR ?auto_27510 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27513 ?auto_27512 ?auto_27511 ?auto_27510 ?auto_27509 )
      ( MAKE-5PILE ?auto_27509 ?auto_27510 ?auto_27511 ?auto_27512 ?auto_27513 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27514 - BLOCK
      ?auto_27515 - BLOCK
      ?auto_27516 - BLOCK
      ?auto_27517 - BLOCK
      ?auto_27518 - BLOCK
    )
    :vars
    (
      ?auto_27519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27514 ?auto_27515 ) ) ( not ( = ?auto_27514 ?auto_27516 ) ) ( not ( = ?auto_27514 ?auto_27517 ) ) ( not ( = ?auto_27514 ?auto_27518 ) ) ( not ( = ?auto_27515 ?auto_27516 ) ) ( not ( = ?auto_27515 ?auto_27517 ) ) ( not ( = ?auto_27515 ?auto_27518 ) ) ( not ( = ?auto_27516 ?auto_27517 ) ) ( not ( = ?auto_27516 ?auto_27518 ) ) ( not ( = ?auto_27517 ?auto_27518 ) ) ( ON-TABLE ?auto_27518 ) ( ON ?auto_27517 ?auto_27518 ) ( ON ?auto_27516 ?auto_27517 ) ( ON ?auto_27515 ?auto_27516 ) ( CLEAR ?auto_27515 ) ( ON ?auto_27514 ?auto_27519 ) ( CLEAR ?auto_27514 ) ( HAND-EMPTY ) ( not ( = ?auto_27514 ?auto_27519 ) ) ( not ( = ?auto_27515 ?auto_27519 ) ) ( not ( = ?auto_27516 ?auto_27519 ) ) ( not ( = ?auto_27517 ?auto_27519 ) ) ( not ( = ?auto_27518 ?auto_27519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_27514 ?auto_27519 )
      ( MAKE-5PILE ?auto_27514 ?auto_27515 ?auto_27516 ?auto_27517 ?auto_27518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27520 - BLOCK
      ?auto_27521 - BLOCK
      ?auto_27522 - BLOCK
      ?auto_27523 - BLOCK
      ?auto_27524 - BLOCK
    )
    :vars
    (
      ?auto_27525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27520 ?auto_27521 ) ) ( not ( = ?auto_27520 ?auto_27522 ) ) ( not ( = ?auto_27520 ?auto_27523 ) ) ( not ( = ?auto_27520 ?auto_27524 ) ) ( not ( = ?auto_27521 ?auto_27522 ) ) ( not ( = ?auto_27521 ?auto_27523 ) ) ( not ( = ?auto_27521 ?auto_27524 ) ) ( not ( = ?auto_27522 ?auto_27523 ) ) ( not ( = ?auto_27522 ?auto_27524 ) ) ( not ( = ?auto_27523 ?auto_27524 ) ) ( ON-TABLE ?auto_27524 ) ( ON ?auto_27523 ?auto_27524 ) ( ON ?auto_27522 ?auto_27523 ) ( ON ?auto_27520 ?auto_27525 ) ( CLEAR ?auto_27520 ) ( not ( = ?auto_27520 ?auto_27525 ) ) ( not ( = ?auto_27521 ?auto_27525 ) ) ( not ( = ?auto_27522 ?auto_27525 ) ) ( not ( = ?auto_27523 ?auto_27525 ) ) ( not ( = ?auto_27524 ?auto_27525 ) ) ( HOLDING ?auto_27521 ) ( CLEAR ?auto_27522 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27524 ?auto_27523 ?auto_27522 ?auto_27521 )
      ( MAKE-5PILE ?auto_27520 ?auto_27521 ?auto_27522 ?auto_27523 ?auto_27524 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27526 - BLOCK
      ?auto_27527 - BLOCK
      ?auto_27528 - BLOCK
      ?auto_27529 - BLOCK
      ?auto_27530 - BLOCK
    )
    :vars
    (
      ?auto_27531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27526 ?auto_27527 ) ) ( not ( = ?auto_27526 ?auto_27528 ) ) ( not ( = ?auto_27526 ?auto_27529 ) ) ( not ( = ?auto_27526 ?auto_27530 ) ) ( not ( = ?auto_27527 ?auto_27528 ) ) ( not ( = ?auto_27527 ?auto_27529 ) ) ( not ( = ?auto_27527 ?auto_27530 ) ) ( not ( = ?auto_27528 ?auto_27529 ) ) ( not ( = ?auto_27528 ?auto_27530 ) ) ( not ( = ?auto_27529 ?auto_27530 ) ) ( ON-TABLE ?auto_27530 ) ( ON ?auto_27529 ?auto_27530 ) ( ON ?auto_27528 ?auto_27529 ) ( ON ?auto_27526 ?auto_27531 ) ( not ( = ?auto_27526 ?auto_27531 ) ) ( not ( = ?auto_27527 ?auto_27531 ) ) ( not ( = ?auto_27528 ?auto_27531 ) ) ( not ( = ?auto_27529 ?auto_27531 ) ) ( not ( = ?auto_27530 ?auto_27531 ) ) ( CLEAR ?auto_27528 ) ( ON ?auto_27527 ?auto_27526 ) ( CLEAR ?auto_27527 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_27531 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27531 ?auto_27526 )
      ( MAKE-5PILE ?auto_27526 ?auto_27527 ?auto_27528 ?auto_27529 ?auto_27530 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27532 - BLOCK
      ?auto_27533 - BLOCK
      ?auto_27534 - BLOCK
      ?auto_27535 - BLOCK
      ?auto_27536 - BLOCK
    )
    :vars
    (
      ?auto_27537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27532 ?auto_27533 ) ) ( not ( = ?auto_27532 ?auto_27534 ) ) ( not ( = ?auto_27532 ?auto_27535 ) ) ( not ( = ?auto_27532 ?auto_27536 ) ) ( not ( = ?auto_27533 ?auto_27534 ) ) ( not ( = ?auto_27533 ?auto_27535 ) ) ( not ( = ?auto_27533 ?auto_27536 ) ) ( not ( = ?auto_27534 ?auto_27535 ) ) ( not ( = ?auto_27534 ?auto_27536 ) ) ( not ( = ?auto_27535 ?auto_27536 ) ) ( ON-TABLE ?auto_27536 ) ( ON ?auto_27535 ?auto_27536 ) ( ON ?auto_27532 ?auto_27537 ) ( not ( = ?auto_27532 ?auto_27537 ) ) ( not ( = ?auto_27533 ?auto_27537 ) ) ( not ( = ?auto_27534 ?auto_27537 ) ) ( not ( = ?auto_27535 ?auto_27537 ) ) ( not ( = ?auto_27536 ?auto_27537 ) ) ( ON ?auto_27533 ?auto_27532 ) ( CLEAR ?auto_27533 ) ( ON-TABLE ?auto_27537 ) ( HOLDING ?auto_27534 ) ( CLEAR ?auto_27535 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27536 ?auto_27535 ?auto_27534 )
      ( MAKE-5PILE ?auto_27532 ?auto_27533 ?auto_27534 ?auto_27535 ?auto_27536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27538 - BLOCK
      ?auto_27539 - BLOCK
      ?auto_27540 - BLOCK
      ?auto_27541 - BLOCK
      ?auto_27542 - BLOCK
    )
    :vars
    (
      ?auto_27543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27538 ?auto_27539 ) ) ( not ( = ?auto_27538 ?auto_27540 ) ) ( not ( = ?auto_27538 ?auto_27541 ) ) ( not ( = ?auto_27538 ?auto_27542 ) ) ( not ( = ?auto_27539 ?auto_27540 ) ) ( not ( = ?auto_27539 ?auto_27541 ) ) ( not ( = ?auto_27539 ?auto_27542 ) ) ( not ( = ?auto_27540 ?auto_27541 ) ) ( not ( = ?auto_27540 ?auto_27542 ) ) ( not ( = ?auto_27541 ?auto_27542 ) ) ( ON-TABLE ?auto_27542 ) ( ON ?auto_27541 ?auto_27542 ) ( ON ?auto_27538 ?auto_27543 ) ( not ( = ?auto_27538 ?auto_27543 ) ) ( not ( = ?auto_27539 ?auto_27543 ) ) ( not ( = ?auto_27540 ?auto_27543 ) ) ( not ( = ?auto_27541 ?auto_27543 ) ) ( not ( = ?auto_27542 ?auto_27543 ) ) ( ON ?auto_27539 ?auto_27538 ) ( ON-TABLE ?auto_27543 ) ( CLEAR ?auto_27541 ) ( ON ?auto_27540 ?auto_27539 ) ( CLEAR ?auto_27540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_27543 ?auto_27538 ?auto_27539 )
      ( MAKE-5PILE ?auto_27538 ?auto_27539 ?auto_27540 ?auto_27541 ?auto_27542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27544 - BLOCK
      ?auto_27545 - BLOCK
      ?auto_27546 - BLOCK
      ?auto_27547 - BLOCK
      ?auto_27548 - BLOCK
    )
    :vars
    (
      ?auto_27549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27548 ) ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27548 ) ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27548 ) ) ( not ( = ?auto_27547 ?auto_27548 ) ) ( ON-TABLE ?auto_27548 ) ( ON ?auto_27544 ?auto_27549 ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27548 ?auto_27549 ) ) ( ON ?auto_27545 ?auto_27544 ) ( ON-TABLE ?auto_27549 ) ( ON ?auto_27546 ?auto_27545 ) ( CLEAR ?auto_27546 ) ( HOLDING ?auto_27547 ) ( CLEAR ?auto_27548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27548 ?auto_27547 )
      ( MAKE-5PILE ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27550 - BLOCK
      ?auto_27551 - BLOCK
      ?auto_27552 - BLOCK
      ?auto_27553 - BLOCK
      ?auto_27554 - BLOCK
    )
    :vars
    (
      ?auto_27555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27550 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27553 ) ) ( not ( = ?auto_27550 ?auto_27554 ) ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27553 ) ) ( not ( = ?auto_27551 ?auto_27554 ) ) ( not ( = ?auto_27552 ?auto_27553 ) ) ( not ( = ?auto_27552 ?auto_27554 ) ) ( not ( = ?auto_27553 ?auto_27554 ) ) ( ON-TABLE ?auto_27554 ) ( ON ?auto_27550 ?auto_27555 ) ( not ( = ?auto_27550 ?auto_27555 ) ) ( not ( = ?auto_27551 ?auto_27555 ) ) ( not ( = ?auto_27552 ?auto_27555 ) ) ( not ( = ?auto_27553 ?auto_27555 ) ) ( not ( = ?auto_27554 ?auto_27555 ) ) ( ON ?auto_27551 ?auto_27550 ) ( ON-TABLE ?auto_27555 ) ( ON ?auto_27552 ?auto_27551 ) ( CLEAR ?auto_27554 ) ( ON ?auto_27553 ?auto_27552 ) ( CLEAR ?auto_27553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_27555 ?auto_27550 ?auto_27551 ?auto_27552 )
      ( MAKE-5PILE ?auto_27550 ?auto_27551 ?auto_27552 ?auto_27553 ?auto_27554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27556 - BLOCK
      ?auto_27557 - BLOCK
      ?auto_27558 - BLOCK
      ?auto_27559 - BLOCK
      ?auto_27560 - BLOCK
    )
    :vars
    (
      ?auto_27561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27556 ?auto_27557 ) ) ( not ( = ?auto_27556 ?auto_27558 ) ) ( not ( = ?auto_27556 ?auto_27559 ) ) ( not ( = ?auto_27556 ?auto_27560 ) ) ( not ( = ?auto_27557 ?auto_27558 ) ) ( not ( = ?auto_27557 ?auto_27559 ) ) ( not ( = ?auto_27557 ?auto_27560 ) ) ( not ( = ?auto_27558 ?auto_27559 ) ) ( not ( = ?auto_27558 ?auto_27560 ) ) ( not ( = ?auto_27559 ?auto_27560 ) ) ( ON ?auto_27556 ?auto_27561 ) ( not ( = ?auto_27556 ?auto_27561 ) ) ( not ( = ?auto_27557 ?auto_27561 ) ) ( not ( = ?auto_27558 ?auto_27561 ) ) ( not ( = ?auto_27559 ?auto_27561 ) ) ( not ( = ?auto_27560 ?auto_27561 ) ) ( ON ?auto_27557 ?auto_27556 ) ( ON-TABLE ?auto_27561 ) ( ON ?auto_27558 ?auto_27557 ) ( ON ?auto_27559 ?auto_27558 ) ( CLEAR ?auto_27559 ) ( HOLDING ?auto_27560 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_27560 )
      ( MAKE-5PILE ?auto_27556 ?auto_27557 ?auto_27558 ?auto_27559 ?auto_27560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_27562 - BLOCK
      ?auto_27563 - BLOCK
      ?auto_27564 - BLOCK
      ?auto_27565 - BLOCK
      ?auto_27566 - BLOCK
    )
    :vars
    (
      ?auto_27567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_27562 ?auto_27563 ) ) ( not ( = ?auto_27562 ?auto_27564 ) ) ( not ( = ?auto_27562 ?auto_27565 ) ) ( not ( = ?auto_27562 ?auto_27566 ) ) ( not ( = ?auto_27563 ?auto_27564 ) ) ( not ( = ?auto_27563 ?auto_27565 ) ) ( not ( = ?auto_27563 ?auto_27566 ) ) ( not ( = ?auto_27564 ?auto_27565 ) ) ( not ( = ?auto_27564 ?auto_27566 ) ) ( not ( = ?auto_27565 ?auto_27566 ) ) ( ON ?auto_27562 ?auto_27567 ) ( not ( = ?auto_27562 ?auto_27567 ) ) ( not ( = ?auto_27563 ?auto_27567 ) ) ( not ( = ?auto_27564 ?auto_27567 ) ) ( not ( = ?auto_27565 ?auto_27567 ) ) ( not ( = ?auto_27566 ?auto_27567 ) ) ( ON ?auto_27563 ?auto_27562 ) ( ON-TABLE ?auto_27567 ) ( ON ?auto_27564 ?auto_27563 ) ( ON ?auto_27565 ?auto_27564 ) ( ON ?auto_27566 ?auto_27565 ) ( CLEAR ?auto_27566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_27567 ?auto_27562 ?auto_27563 ?auto_27564 ?auto_27565 )
      ( MAKE-5PILE ?auto_27562 ?auto_27563 ?auto_27564 ?auto_27565 ?auto_27566 ) )
  )

)

