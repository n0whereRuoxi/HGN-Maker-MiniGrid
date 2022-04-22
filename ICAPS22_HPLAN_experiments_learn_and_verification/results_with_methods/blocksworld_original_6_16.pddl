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
      ?auto_68470 - BLOCK
      ?auto_68471 - BLOCK
      ?auto_68472 - BLOCK
      ?auto_68473 - BLOCK
      ?auto_68474 - BLOCK
      ?auto_68475 - BLOCK
    )
    :vars
    (
      ?auto_68476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68476 ?auto_68475 ) ( CLEAR ?auto_68476 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68470 ) ( ON ?auto_68471 ?auto_68470 ) ( ON ?auto_68472 ?auto_68471 ) ( ON ?auto_68473 ?auto_68472 ) ( ON ?auto_68474 ?auto_68473 ) ( ON ?auto_68475 ?auto_68474 ) ( not ( = ?auto_68470 ?auto_68471 ) ) ( not ( = ?auto_68470 ?auto_68472 ) ) ( not ( = ?auto_68470 ?auto_68473 ) ) ( not ( = ?auto_68470 ?auto_68474 ) ) ( not ( = ?auto_68470 ?auto_68475 ) ) ( not ( = ?auto_68470 ?auto_68476 ) ) ( not ( = ?auto_68471 ?auto_68472 ) ) ( not ( = ?auto_68471 ?auto_68473 ) ) ( not ( = ?auto_68471 ?auto_68474 ) ) ( not ( = ?auto_68471 ?auto_68475 ) ) ( not ( = ?auto_68471 ?auto_68476 ) ) ( not ( = ?auto_68472 ?auto_68473 ) ) ( not ( = ?auto_68472 ?auto_68474 ) ) ( not ( = ?auto_68472 ?auto_68475 ) ) ( not ( = ?auto_68472 ?auto_68476 ) ) ( not ( = ?auto_68473 ?auto_68474 ) ) ( not ( = ?auto_68473 ?auto_68475 ) ) ( not ( = ?auto_68473 ?auto_68476 ) ) ( not ( = ?auto_68474 ?auto_68475 ) ) ( not ( = ?auto_68474 ?auto_68476 ) ) ( not ( = ?auto_68475 ?auto_68476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68476 ?auto_68475 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68478 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68478 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_68478 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68479 - BLOCK
    )
    :vars
    (
      ?auto_68480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68479 ?auto_68480 ) ( CLEAR ?auto_68479 ) ( HAND-EMPTY ) ( not ( = ?auto_68479 ?auto_68480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68479 ?auto_68480 )
      ( MAKE-1PILE ?auto_68479 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68486 - BLOCK
      ?auto_68487 - BLOCK
      ?auto_68488 - BLOCK
      ?auto_68489 - BLOCK
      ?auto_68490 - BLOCK
    )
    :vars
    (
      ?auto_68491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68491 ?auto_68490 ) ( CLEAR ?auto_68491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68486 ) ( ON ?auto_68487 ?auto_68486 ) ( ON ?auto_68488 ?auto_68487 ) ( ON ?auto_68489 ?auto_68488 ) ( ON ?auto_68490 ?auto_68489 ) ( not ( = ?auto_68486 ?auto_68487 ) ) ( not ( = ?auto_68486 ?auto_68488 ) ) ( not ( = ?auto_68486 ?auto_68489 ) ) ( not ( = ?auto_68486 ?auto_68490 ) ) ( not ( = ?auto_68486 ?auto_68491 ) ) ( not ( = ?auto_68487 ?auto_68488 ) ) ( not ( = ?auto_68487 ?auto_68489 ) ) ( not ( = ?auto_68487 ?auto_68490 ) ) ( not ( = ?auto_68487 ?auto_68491 ) ) ( not ( = ?auto_68488 ?auto_68489 ) ) ( not ( = ?auto_68488 ?auto_68490 ) ) ( not ( = ?auto_68488 ?auto_68491 ) ) ( not ( = ?auto_68489 ?auto_68490 ) ) ( not ( = ?auto_68489 ?auto_68491 ) ) ( not ( = ?auto_68490 ?auto_68491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68491 ?auto_68490 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68492 - BLOCK
      ?auto_68493 - BLOCK
      ?auto_68494 - BLOCK
      ?auto_68495 - BLOCK
      ?auto_68496 - BLOCK
    )
    :vars
    (
      ?auto_68497 - BLOCK
      ?auto_68498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68497 ?auto_68496 ) ( CLEAR ?auto_68497 ) ( ON-TABLE ?auto_68492 ) ( ON ?auto_68493 ?auto_68492 ) ( ON ?auto_68494 ?auto_68493 ) ( ON ?auto_68495 ?auto_68494 ) ( ON ?auto_68496 ?auto_68495 ) ( not ( = ?auto_68492 ?auto_68493 ) ) ( not ( = ?auto_68492 ?auto_68494 ) ) ( not ( = ?auto_68492 ?auto_68495 ) ) ( not ( = ?auto_68492 ?auto_68496 ) ) ( not ( = ?auto_68492 ?auto_68497 ) ) ( not ( = ?auto_68493 ?auto_68494 ) ) ( not ( = ?auto_68493 ?auto_68495 ) ) ( not ( = ?auto_68493 ?auto_68496 ) ) ( not ( = ?auto_68493 ?auto_68497 ) ) ( not ( = ?auto_68494 ?auto_68495 ) ) ( not ( = ?auto_68494 ?auto_68496 ) ) ( not ( = ?auto_68494 ?auto_68497 ) ) ( not ( = ?auto_68495 ?auto_68496 ) ) ( not ( = ?auto_68495 ?auto_68497 ) ) ( not ( = ?auto_68496 ?auto_68497 ) ) ( HOLDING ?auto_68498 ) ( not ( = ?auto_68492 ?auto_68498 ) ) ( not ( = ?auto_68493 ?auto_68498 ) ) ( not ( = ?auto_68494 ?auto_68498 ) ) ( not ( = ?auto_68495 ?auto_68498 ) ) ( not ( = ?auto_68496 ?auto_68498 ) ) ( not ( = ?auto_68497 ?auto_68498 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_68498 )
      ( MAKE-5PILE ?auto_68492 ?auto_68493 ?auto_68494 ?auto_68495 ?auto_68496 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68499 - BLOCK
      ?auto_68500 - BLOCK
      ?auto_68501 - BLOCK
      ?auto_68502 - BLOCK
      ?auto_68503 - BLOCK
    )
    :vars
    (
      ?auto_68505 - BLOCK
      ?auto_68504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68505 ?auto_68503 ) ( ON-TABLE ?auto_68499 ) ( ON ?auto_68500 ?auto_68499 ) ( ON ?auto_68501 ?auto_68500 ) ( ON ?auto_68502 ?auto_68501 ) ( ON ?auto_68503 ?auto_68502 ) ( not ( = ?auto_68499 ?auto_68500 ) ) ( not ( = ?auto_68499 ?auto_68501 ) ) ( not ( = ?auto_68499 ?auto_68502 ) ) ( not ( = ?auto_68499 ?auto_68503 ) ) ( not ( = ?auto_68499 ?auto_68505 ) ) ( not ( = ?auto_68500 ?auto_68501 ) ) ( not ( = ?auto_68500 ?auto_68502 ) ) ( not ( = ?auto_68500 ?auto_68503 ) ) ( not ( = ?auto_68500 ?auto_68505 ) ) ( not ( = ?auto_68501 ?auto_68502 ) ) ( not ( = ?auto_68501 ?auto_68503 ) ) ( not ( = ?auto_68501 ?auto_68505 ) ) ( not ( = ?auto_68502 ?auto_68503 ) ) ( not ( = ?auto_68502 ?auto_68505 ) ) ( not ( = ?auto_68503 ?auto_68505 ) ) ( not ( = ?auto_68499 ?auto_68504 ) ) ( not ( = ?auto_68500 ?auto_68504 ) ) ( not ( = ?auto_68501 ?auto_68504 ) ) ( not ( = ?auto_68502 ?auto_68504 ) ) ( not ( = ?auto_68503 ?auto_68504 ) ) ( not ( = ?auto_68505 ?auto_68504 ) ) ( ON ?auto_68504 ?auto_68505 ) ( CLEAR ?auto_68504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68499 ?auto_68500 ?auto_68501 ?auto_68502 ?auto_68503 ?auto_68505 )
      ( MAKE-5PILE ?auto_68499 ?auto_68500 ?auto_68501 ?auto_68502 ?auto_68503 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68508 - BLOCK
      ?auto_68509 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68509 ) ( CLEAR ?auto_68508 ) ( ON-TABLE ?auto_68508 ) ( not ( = ?auto_68508 ?auto_68509 ) ) )
    :subtasks
    ( ( !STACK ?auto_68509 ?auto_68508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68510 - BLOCK
      ?auto_68511 - BLOCK
    )
    :vars
    (
      ?auto_68512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68510 ) ( ON-TABLE ?auto_68510 ) ( not ( = ?auto_68510 ?auto_68511 ) ) ( ON ?auto_68511 ?auto_68512 ) ( CLEAR ?auto_68511 ) ( HAND-EMPTY ) ( not ( = ?auto_68510 ?auto_68512 ) ) ( not ( = ?auto_68511 ?auto_68512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68511 ?auto_68512 )
      ( MAKE-2PILE ?auto_68510 ?auto_68511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68513 - BLOCK
      ?auto_68514 - BLOCK
    )
    :vars
    (
      ?auto_68515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68513 ?auto_68514 ) ) ( ON ?auto_68514 ?auto_68515 ) ( CLEAR ?auto_68514 ) ( not ( = ?auto_68513 ?auto_68515 ) ) ( not ( = ?auto_68514 ?auto_68515 ) ) ( HOLDING ?auto_68513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68513 )
      ( MAKE-2PILE ?auto_68513 ?auto_68514 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68516 - BLOCK
      ?auto_68517 - BLOCK
    )
    :vars
    (
      ?auto_68518 - BLOCK
      ?auto_68522 - BLOCK
      ?auto_68521 - BLOCK
      ?auto_68520 - BLOCK
      ?auto_68519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68516 ?auto_68517 ) ) ( ON ?auto_68517 ?auto_68518 ) ( not ( = ?auto_68516 ?auto_68518 ) ) ( not ( = ?auto_68517 ?auto_68518 ) ) ( ON ?auto_68516 ?auto_68517 ) ( CLEAR ?auto_68516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68522 ) ( ON ?auto_68521 ?auto_68522 ) ( ON ?auto_68520 ?auto_68521 ) ( ON ?auto_68519 ?auto_68520 ) ( ON ?auto_68518 ?auto_68519 ) ( not ( = ?auto_68522 ?auto_68521 ) ) ( not ( = ?auto_68522 ?auto_68520 ) ) ( not ( = ?auto_68522 ?auto_68519 ) ) ( not ( = ?auto_68522 ?auto_68518 ) ) ( not ( = ?auto_68522 ?auto_68517 ) ) ( not ( = ?auto_68522 ?auto_68516 ) ) ( not ( = ?auto_68521 ?auto_68520 ) ) ( not ( = ?auto_68521 ?auto_68519 ) ) ( not ( = ?auto_68521 ?auto_68518 ) ) ( not ( = ?auto_68521 ?auto_68517 ) ) ( not ( = ?auto_68521 ?auto_68516 ) ) ( not ( = ?auto_68520 ?auto_68519 ) ) ( not ( = ?auto_68520 ?auto_68518 ) ) ( not ( = ?auto_68520 ?auto_68517 ) ) ( not ( = ?auto_68520 ?auto_68516 ) ) ( not ( = ?auto_68519 ?auto_68518 ) ) ( not ( = ?auto_68519 ?auto_68517 ) ) ( not ( = ?auto_68519 ?auto_68516 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68522 ?auto_68521 ?auto_68520 ?auto_68519 ?auto_68518 ?auto_68517 )
      ( MAKE-2PILE ?auto_68516 ?auto_68517 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68527 - BLOCK
      ?auto_68528 - BLOCK
      ?auto_68529 - BLOCK
      ?auto_68530 - BLOCK
    )
    :vars
    (
      ?auto_68531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68531 ?auto_68530 ) ( CLEAR ?auto_68531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68527 ) ( ON ?auto_68528 ?auto_68527 ) ( ON ?auto_68529 ?auto_68528 ) ( ON ?auto_68530 ?auto_68529 ) ( not ( = ?auto_68527 ?auto_68528 ) ) ( not ( = ?auto_68527 ?auto_68529 ) ) ( not ( = ?auto_68527 ?auto_68530 ) ) ( not ( = ?auto_68527 ?auto_68531 ) ) ( not ( = ?auto_68528 ?auto_68529 ) ) ( not ( = ?auto_68528 ?auto_68530 ) ) ( not ( = ?auto_68528 ?auto_68531 ) ) ( not ( = ?auto_68529 ?auto_68530 ) ) ( not ( = ?auto_68529 ?auto_68531 ) ) ( not ( = ?auto_68530 ?auto_68531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68531 ?auto_68530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68532 - BLOCK
      ?auto_68533 - BLOCK
      ?auto_68534 - BLOCK
      ?auto_68535 - BLOCK
    )
    :vars
    (
      ?auto_68536 - BLOCK
      ?auto_68537 - BLOCK
      ?auto_68538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68536 ?auto_68535 ) ( CLEAR ?auto_68536 ) ( ON-TABLE ?auto_68532 ) ( ON ?auto_68533 ?auto_68532 ) ( ON ?auto_68534 ?auto_68533 ) ( ON ?auto_68535 ?auto_68534 ) ( not ( = ?auto_68532 ?auto_68533 ) ) ( not ( = ?auto_68532 ?auto_68534 ) ) ( not ( = ?auto_68532 ?auto_68535 ) ) ( not ( = ?auto_68532 ?auto_68536 ) ) ( not ( = ?auto_68533 ?auto_68534 ) ) ( not ( = ?auto_68533 ?auto_68535 ) ) ( not ( = ?auto_68533 ?auto_68536 ) ) ( not ( = ?auto_68534 ?auto_68535 ) ) ( not ( = ?auto_68534 ?auto_68536 ) ) ( not ( = ?auto_68535 ?auto_68536 ) ) ( HOLDING ?auto_68537 ) ( CLEAR ?auto_68538 ) ( not ( = ?auto_68532 ?auto_68537 ) ) ( not ( = ?auto_68532 ?auto_68538 ) ) ( not ( = ?auto_68533 ?auto_68537 ) ) ( not ( = ?auto_68533 ?auto_68538 ) ) ( not ( = ?auto_68534 ?auto_68537 ) ) ( not ( = ?auto_68534 ?auto_68538 ) ) ( not ( = ?auto_68535 ?auto_68537 ) ) ( not ( = ?auto_68535 ?auto_68538 ) ) ( not ( = ?auto_68536 ?auto_68537 ) ) ( not ( = ?auto_68536 ?auto_68538 ) ) ( not ( = ?auto_68537 ?auto_68538 ) ) )
    :subtasks
    ( ( !STACK ?auto_68537 ?auto_68538 )
      ( MAKE-4PILE ?auto_68532 ?auto_68533 ?auto_68534 ?auto_68535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68539 - BLOCK
      ?auto_68540 - BLOCK
      ?auto_68541 - BLOCK
      ?auto_68542 - BLOCK
    )
    :vars
    (
      ?auto_68544 - BLOCK
      ?auto_68543 - BLOCK
      ?auto_68545 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68544 ?auto_68542 ) ( ON-TABLE ?auto_68539 ) ( ON ?auto_68540 ?auto_68539 ) ( ON ?auto_68541 ?auto_68540 ) ( ON ?auto_68542 ?auto_68541 ) ( not ( = ?auto_68539 ?auto_68540 ) ) ( not ( = ?auto_68539 ?auto_68541 ) ) ( not ( = ?auto_68539 ?auto_68542 ) ) ( not ( = ?auto_68539 ?auto_68544 ) ) ( not ( = ?auto_68540 ?auto_68541 ) ) ( not ( = ?auto_68540 ?auto_68542 ) ) ( not ( = ?auto_68540 ?auto_68544 ) ) ( not ( = ?auto_68541 ?auto_68542 ) ) ( not ( = ?auto_68541 ?auto_68544 ) ) ( not ( = ?auto_68542 ?auto_68544 ) ) ( CLEAR ?auto_68543 ) ( not ( = ?auto_68539 ?auto_68545 ) ) ( not ( = ?auto_68539 ?auto_68543 ) ) ( not ( = ?auto_68540 ?auto_68545 ) ) ( not ( = ?auto_68540 ?auto_68543 ) ) ( not ( = ?auto_68541 ?auto_68545 ) ) ( not ( = ?auto_68541 ?auto_68543 ) ) ( not ( = ?auto_68542 ?auto_68545 ) ) ( not ( = ?auto_68542 ?auto_68543 ) ) ( not ( = ?auto_68544 ?auto_68545 ) ) ( not ( = ?auto_68544 ?auto_68543 ) ) ( not ( = ?auto_68545 ?auto_68543 ) ) ( ON ?auto_68545 ?auto_68544 ) ( CLEAR ?auto_68545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68539 ?auto_68540 ?auto_68541 ?auto_68542 ?auto_68544 )
      ( MAKE-4PILE ?auto_68539 ?auto_68540 ?auto_68541 ?auto_68542 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68546 - BLOCK
      ?auto_68547 - BLOCK
      ?auto_68548 - BLOCK
      ?auto_68549 - BLOCK
    )
    :vars
    (
      ?auto_68551 - BLOCK
      ?auto_68550 - BLOCK
      ?auto_68552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68551 ?auto_68549 ) ( ON-TABLE ?auto_68546 ) ( ON ?auto_68547 ?auto_68546 ) ( ON ?auto_68548 ?auto_68547 ) ( ON ?auto_68549 ?auto_68548 ) ( not ( = ?auto_68546 ?auto_68547 ) ) ( not ( = ?auto_68546 ?auto_68548 ) ) ( not ( = ?auto_68546 ?auto_68549 ) ) ( not ( = ?auto_68546 ?auto_68551 ) ) ( not ( = ?auto_68547 ?auto_68548 ) ) ( not ( = ?auto_68547 ?auto_68549 ) ) ( not ( = ?auto_68547 ?auto_68551 ) ) ( not ( = ?auto_68548 ?auto_68549 ) ) ( not ( = ?auto_68548 ?auto_68551 ) ) ( not ( = ?auto_68549 ?auto_68551 ) ) ( not ( = ?auto_68546 ?auto_68550 ) ) ( not ( = ?auto_68546 ?auto_68552 ) ) ( not ( = ?auto_68547 ?auto_68550 ) ) ( not ( = ?auto_68547 ?auto_68552 ) ) ( not ( = ?auto_68548 ?auto_68550 ) ) ( not ( = ?auto_68548 ?auto_68552 ) ) ( not ( = ?auto_68549 ?auto_68550 ) ) ( not ( = ?auto_68549 ?auto_68552 ) ) ( not ( = ?auto_68551 ?auto_68550 ) ) ( not ( = ?auto_68551 ?auto_68552 ) ) ( not ( = ?auto_68550 ?auto_68552 ) ) ( ON ?auto_68550 ?auto_68551 ) ( CLEAR ?auto_68550 ) ( HOLDING ?auto_68552 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68552 )
      ( MAKE-4PILE ?auto_68546 ?auto_68547 ?auto_68548 ?auto_68549 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68553 - BLOCK
      ?auto_68554 - BLOCK
      ?auto_68555 - BLOCK
      ?auto_68556 - BLOCK
    )
    :vars
    (
      ?auto_68559 - BLOCK
      ?auto_68558 - BLOCK
      ?auto_68557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68559 ?auto_68556 ) ( ON-TABLE ?auto_68553 ) ( ON ?auto_68554 ?auto_68553 ) ( ON ?auto_68555 ?auto_68554 ) ( ON ?auto_68556 ?auto_68555 ) ( not ( = ?auto_68553 ?auto_68554 ) ) ( not ( = ?auto_68553 ?auto_68555 ) ) ( not ( = ?auto_68553 ?auto_68556 ) ) ( not ( = ?auto_68553 ?auto_68559 ) ) ( not ( = ?auto_68554 ?auto_68555 ) ) ( not ( = ?auto_68554 ?auto_68556 ) ) ( not ( = ?auto_68554 ?auto_68559 ) ) ( not ( = ?auto_68555 ?auto_68556 ) ) ( not ( = ?auto_68555 ?auto_68559 ) ) ( not ( = ?auto_68556 ?auto_68559 ) ) ( not ( = ?auto_68553 ?auto_68558 ) ) ( not ( = ?auto_68553 ?auto_68557 ) ) ( not ( = ?auto_68554 ?auto_68558 ) ) ( not ( = ?auto_68554 ?auto_68557 ) ) ( not ( = ?auto_68555 ?auto_68558 ) ) ( not ( = ?auto_68555 ?auto_68557 ) ) ( not ( = ?auto_68556 ?auto_68558 ) ) ( not ( = ?auto_68556 ?auto_68557 ) ) ( not ( = ?auto_68559 ?auto_68558 ) ) ( not ( = ?auto_68559 ?auto_68557 ) ) ( not ( = ?auto_68558 ?auto_68557 ) ) ( ON ?auto_68558 ?auto_68559 ) ( ON ?auto_68557 ?auto_68558 ) ( CLEAR ?auto_68557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68553 ?auto_68554 ?auto_68555 ?auto_68556 ?auto_68559 ?auto_68558 )
      ( MAKE-4PILE ?auto_68553 ?auto_68554 ?auto_68555 ?auto_68556 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68563 - BLOCK
      ?auto_68564 - BLOCK
      ?auto_68565 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68565 ) ( CLEAR ?auto_68564 ) ( ON-TABLE ?auto_68563 ) ( ON ?auto_68564 ?auto_68563 ) ( not ( = ?auto_68563 ?auto_68564 ) ) ( not ( = ?auto_68563 ?auto_68565 ) ) ( not ( = ?auto_68564 ?auto_68565 ) ) )
    :subtasks
    ( ( !STACK ?auto_68565 ?auto_68564 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68566 - BLOCK
      ?auto_68567 - BLOCK
      ?auto_68568 - BLOCK
    )
    :vars
    (
      ?auto_68569 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68567 ) ( ON-TABLE ?auto_68566 ) ( ON ?auto_68567 ?auto_68566 ) ( not ( = ?auto_68566 ?auto_68567 ) ) ( not ( = ?auto_68566 ?auto_68568 ) ) ( not ( = ?auto_68567 ?auto_68568 ) ) ( ON ?auto_68568 ?auto_68569 ) ( CLEAR ?auto_68568 ) ( HAND-EMPTY ) ( not ( = ?auto_68566 ?auto_68569 ) ) ( not ( = ?auto_68567 ?auto_68569 ) ) ( not ( = ?auto_68568 ?auto_68569 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68568 ?auto_68569 )
      ( MAKE-3PILE ?auto_68566 ?auto_68567 ?auto_68568 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68570 - BLOCK
      ?auto_68571 - BLOCK
      ?auto_68572 - BLOCK
    )
    :vars
    (
      ?auto_68573 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68570 ) ( not ( = ?auto_68570 ?auto_68571 ) ) ( not ( = ?auto_68570 ?auto_68572 ) ) ( not ( = ?auto_68571 ?auto_68572 ) ) ( ON ?auto_68572 ?auto_68573 ) ( CLEAR ?auto_68572 ) ( not ( = ?auto_68570 ?auto_68573 ) ) ( not ( = ?auto_68571 ?auto_68573 ) ) ( not ( = ?auto_68572 ?auto_68573 ) ) ( HOLDING ?auto_68571 ) ( CLEAR ?auto_68570 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68570 ?auto_68571 )
      ( MAKE-3PILE ?auto_68570 ?auto_68571 ?auto_68572 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68574 - BLOCK
      ?auto_68575 - BLOCK
      ?auto_68576 - BLOCK
    )
    :vars
    (
      ?auto_68577 - BLOCK
      ?auto_68578 - BLOCK
      ?auto_68580 - BLOCK
      ?auto_68579 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68574 ) ( not ( = ?auto_68574 ?auto_68575 ) ) ( not ( = ?auto_68574 ?auto_68576 ) ) ( not ( = ?auto_68575 ?auto_68576 ) ) ( ON ?auto_68576 ?auto_68577 ) ( not ( = ?auto_68574 ?auto_68577 ) ) ( not ( = ?auto_68575 ?auto_68577 ) ) ( not ( = ?auto_68576 ?auto_68577 ) ) ( CLEAR ?auto_68574 ) ( ON ?auto_68575 ?auto_68576 ) ( CLEAR ?auto_68575 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68578 ) ( ON ?auto_68580 ?auto_68578 ) ( ON ?auto_68579 ?auto_68580 ) ( ON ?auto_68577 ?auto_68579 ) ( not ( = ?auto_68578 ?auto_68580 ) ) ( not ( = ?auto_68578 ?auto_68579 ) ) ( not ( = ?auto_68578 ?auto_68577 ) ) ( not ( = ?auto_68578 ?auto_68576 ) ) ( not ( = ?auto_68578 ?auto_68575 ) ) ( not ( = ?auto_68580 ?auto_68579 ) ) ( not ( = ?auto_68580 ?auto_68577 ) ) ( not ( = ?auto_68580 ?auto_68576 ) ) ( not ( = ?auto_68580 ?auto_68575 ) ) ( not ( = ?auto_68579 ?auto_68577 ) ) ( not ( = ?auto_68579 ?auto_68576 ) ) ( not ( = ?auto_68579 ?auto_68575 ) ) ( not ( = ?auto_68574 ?auto_68578 ) ) ( not ( = ?auto_68574 ?auto_68580 ) ) ( not ( = ?auto_68574 ?auto_68579 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68578 ?auto_68580 ?auto_68579 ?auto_68577 ?auto_68576 )
      ( MAKE-3PILE ?auto_68574 ?auto_68575 ?auto_68576 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68581 - BLOCK
      ?auto_68582 - BLOCK
      ?auto_68583 - BLOCK
    )
    :vars
    (
      ?auto_68585 - BLOCK
      ?auto_68587 - BLOCK
      ?auto_68584 - BLOCK
      ?auto_68586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68581 ?auto_68582 ) ) ( not ( = ?auto_68581 ?auto_68583 ) ) ( not ( = ?auto_68582 ?auto_68583 ) ) ( ON ?auto_68583 ?auto_68585 ) ( not ( = ?auto_68581 ?auto_68585 ) ) ( not ( = ?auto_68582 ?auto_68585 ) ) ( not ( = ?auto_68583 ?auto_68585 ) ) ( ON ?auto_68582 ?auto_68583 ) ( CLEAR ?auto_68582 ) ( ON-TABLE ?auto_68587 ) ( ON ?auto_68584 ?auto_68587 ) ( ON ?auto_68586 ?auto_68584 ) ( ON ?auto_68585 ?auto_68586 ) ( not ( = ?auto_68587 ?auto_68584 ) ) ( not ( = ?auto_68587 ?auto_68586 ) ) ( not ( = ?auto_68587 ?auto_68585 ) ) ( not ( = ?auto_68587 ?auto_68583 ) ) ( not ( = ?auto_68587 ?auto_68582 ) ) ( not ( = ?auto_68584 ?auto_68586 ) ) ( not ( = ?auto_68584 ?auto_68585 ) ) ( not ( = ?auto_68584 ?auto_68583 ) ) ( not ( = ?auto_68584 ?auto_68582 ) ) ( not ( = ?auto_68586 ?auto_68585 ) ) ( not ( = ?auto_68586 ?auto_68583 ) ) ( not ( = ?auto_68586 ?auto_68582 ) ) ( not ( = ?auto_68581 ?auto_68587 ) ) ( not ( = ?auto_68581 ?auto_68584 ) ) ( not ( = ?auto_68581 ?auto_68586 ) ) ( HOLDING ?auto_68581 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68581 )
      ( MAKE-3PILE ?auto_68581 ?auto_68582 ?auto_68583 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68588 - BLOCK
      ?auto_68589 - BLOCK
      ?auto_68590 - BLOCK
    )
    :vars
    (
      ?auto_68592 - BLOCK
      ?auto_68591 - BLOCK
      ?auto_68593 - BLOCK
      ?auto_68594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68588 ?auto_68589 ) ) ( not ( = ?auto_68588 ?auto_68590 ) ) ( not ( = ?auto_68589 ?auto_68590 ) ) ( ON ?auto_68590 ?auto_68592 ) ( not ( = ?auto_68588 ?auto_68592 ) ) ( not ( = ?auto_68589 ?auto_68592 ) ) ( not ( = ?auto_68590 ?auto_68592 ) ) ( ON ?auto_68589 ?auto_68590 ) ( ON-TABLE ?auto_68591 ) ( ON ?auto_68593 ?auto_68591 ) ( ON ?auto_68594 ?auto_68593 ) ( ON ?auto_68592 ?auto_68594 ) ( not ( = ?auto_68591 ?auto_68593 ) ) ( not ( = ?auto_68591 ?auto_68594 ) ) ( not ( = ?auto_68591 ?auto_68592 ) ) ( not ( = ?auto_68591 ?auto_68590 ) ) ( not ( = ?auto_68591 ?auto_68589 ) ) ( not ( = ?auto_68593 ?auto_68594 ) ) ( not ( = ?auto_68593 ?auto_68592 ) ) ( not ( = ?auto_68593 ?auto_68590 ) ) ( not ( = ?auto_68593 ?auto_68589 ) ) ( not ( = ?auto_68594 ?auto_68592 ) ) ( not ( = ?auto_68594 ?auto_68590 ) ) ( not ( = ?auto_68594 ?auto_68589 ) ) ( not ( = ?auto_68588 ?auto_68591 ) ) ( not ( = ?auto_68588 ?auto_68593 ) ) ( not ( = ?auto_68588 ?auto_68594 ) ) ( ON ?auto_68588 ?auto_68589 ) ( CLEAR ?auto_68588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68591 ?auto_68593 ?auto_68594 ?auto_68592 ?auto_68590 ?auto_68589 )
      ( MAKE-3PILE ?auto_68588 ?auto_68589 ?auto_68590 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68598 - BLOCK
      ?auto_68599 - BLOCK
      ?auto_68600 - BLOCK
    )
    :vars
    (
      ?auto_68601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68601 ?auto_68600 ) ( CLEAR ?auto_68601 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68598 ) ( ON ?auto_68599 ?auto_68598 ) ( ON ?auto_68600 ?auto_68599 ) ( not ( = ?auto_68598 ?auto_68599 ) ) ( not ( = ?auto_68598 ?auto_68600 ) ) ( not ( = ?auto_68598 ?auto_68601 ) ) ( not ( = ?auto_68599 ?auto_68600 ) ) ( not ( = ?auto_68599 ?auto_68601 ) ) ( not ( = ?auto_68600 ?auto_68601 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68601 ?auto_68600 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68602 - BLOCK
      ?auto_68603 - BLOCK
      ?auto_68604 - BLOCK
    )
    :vars
    (
      ?auto_68605 - BLOCK
      ?auto_68606 - BLOCK
      ?auto_68607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68605 ?auto_68604 ) ( CLEAR ?auto_68605 ) ( ON-TABLE ?auto_68602 ) ( ON ?auto_68603 ?auto_68602 ) ( ON ?auto_68604 ?auto_68603 ) ( not ( = ?auto_68602 ?auto_68603 ) ) ( not ( = ?auto_68602 ?auto_68604 ) ) ( not ( = ?auto_68602 ?auto_68605 ) ) ( not ( = ?auto_68603 ?auto_68604 ) ) ( not ( = ?auto_68603 ?auto_68605 ) ) ( not ( = ?auto_68604 ?auto_68605 ) ) ( HOLDING ?auto_68606 ) ( CLEAR ?auto_68607 ) ( not ( = ?auto_68602 ?auto_68606 ) ) ( not ( = ?auto_68602 ?auto_68607 ) ) ( not ( = ?auto_68603 ?auto_68606 ) ) ( not ( = ?auto_68603 ?auto_68607 ) ) ( not ( = ?auto_68604 ?auto_68606 ) ) ( not ( = ?auto_68604 ?auto_68607 ) ) ( not ( = ?auto_68605 ?auto_68606 ) ) ( not ( = ?auto_68605 ?auto_68607 ) ) ( not ( = ?auto_68606 ?auto_68607 ) ) )
    :subtasks
    ( ( !STACK ?auto_68606 ?auto_68607 )
      ( MAKE-3PILE ?auto_68602 ?auto_68603 ?auto_68604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68608 - BLOCK
      ?auto_68609 - BLOCK
      ?auto_68610 - BLOCK
    )
    :vars
    (
      ?auto_68612 - BLOCK
      ?auto_68611 - BLOCK
      ?auto_68613 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68612 ?auto_68610 ) ( ON-TABLE ?auto_68608 ) ( ON ?auto_68609 ?auto_68608 ) ( ON ?auto_68610 ?auto_68609 ) ( not ( = ?auto_68608 ?auto_68609 ) ) ( not ( = ?auto_68608 ?auto_68610 ) ) ( not ( = ?auto_68608 ?auto_68612 ) ) ( not ( = ?auto_68609 ?auto_68610 ) ) ( not ( = ?auto_68609 ?auto_68612 ) ) ( not ( = ?auto_68610 ?auto_68612 ) ) ( CLEAR ?auto_68611 ) ( not ( = ?auto_68608 ?auto_68613 ) ) ( not ( = ?auto_68608 ?auto_68611 ) ) ( not ( = ?auto_68609 ?auto_68613 ) ) ( not ( = ?auto_68609 ?auto_68611 ) ) ( not ( = ?auto_68610 ?auto_68613 ) ) ( not ( = ?auto_68610 ?auto_68611 ) ) ( not ( = ?auto_68612 ?auto_68613 ) ) ( not ( = ?auto_68612 ?auto_68611 ) ) ( not ( = ?auto_68613 ?auto_68611 ) ) ( ON ?auto_68613 ?auto_68612 ) ( CLEAR ?auto_68613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68608 ?auto_68609 ?auto_68610 ?auto_68612 )
      ( MAKE-3PILE ?auto_68608 ?auto_68609 ?auto_68610 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68614 - BLOCK
      ?auto_68615 - BLOCK
      ?auto_68616 - BLOCK
    )
    :vars
    (
      ?auto_68617 - BLOCK
      ?auto_68619 - BLOCK
      ?auto_68618 - BLOCK
      ?auto_68620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68617 ?auto_68616 ) ( ON-TABLE ?auto_68614 ) ( ON ?auto_68615 ?auto_68614 ) ( ON ?auto_68616 ?auto_68615 ) ( not ( = ?auto_68614 ?auto_68615 ) ) ( not ( = ?auto_68614 ?auto_68616 ) ) ( not ( = ?auto_68614 ?auto_68617 ) ) ( not ( = ?auto_68615 ?auto_68616 ) ) ( not ( = ?auto_68615 ?auto_68617 ) ) ( not ( = ?auto_68616 ?auto_68617 ) ) ( not ( = ?auto_68614 ?auto_68619 ) ) ( not ( = ?auto_68614 ?auto_68618 ) ) ( not ( = ?auto_68615 ?auto_68619 ) ) ( not ( = ?auto_68615 ?auto_68618 ) ) ( not ( = ?auto_68616 ?auto_68619 ) ) ( not ( = ?auto_68616 ?auto_68618 ) ) ( not ( = ?auto_68617 ?auto_68619 ) ) ( not ( = ?auto_68617 ?auto_68618 ) ) ( not ( = ?auto_68619 ?auto_68618 ) ) ( ON ?auto_68619 ?auto_68617 ) ( CLEAR ?auto_68619 ) ( HOLDING ?auto_68618 ) ( CLEAR ?auto_68620 ) ( ON-TABLE ?auto_68620 ) ( not ( = ?auto_68620 ?auto_68618 ) ) ( not ( = ?auto_68614 ?auto_68620 ) ) ( not ( = ?auto_68615 ?auto_68620 ) ) ( not ( = ?auto_68616 ?auto_68620 ) ) ( not ( = ?auto_68617 ?auto_68620 ) ) ( not ( = ?auto_68619 ?auto_68620 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68620 ?auto_68618 )
      ( MAKE-3PILE ?auto_68614 ?auto_68615 ?auto_68616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68621 - BLOCK
      ?auto_68622 - BLOCK
      ?auto_68623 - BLOCK
    )
    :vars
    (
      ?auto_68624 - BLOCK
      ?auto_68626 - BLOCK
      ?auto_68625 - BLOCK
      ?auto_68627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68624 ?auto_68623 ) ( ON-TABLE ?auto_68621 ) ( ON ?auto_68622 ?auto_68621 ) ( ON ?auto_68623 ?auto_68622 ) ( not ( = ?auto_68621 ?auto_68622 ) ) ( not ( = ?auto_68621 ?auto_68623 ) ) ( not ( = ?auto_68621 ?auto_68624 ) ) ( not ( = ?auto_68622 ?auto_68623 ) ) ( not ( = ?auto_68622 ?auto_68624 ) ) ( not ( = ?auto_68623 ?auto_68624 ) ) ( not ( = ?auto_68621 ?auto_68626 ) ) ( not ( = ?auto_68621 ?auto_68625 ) ) ( not ( = ?auto_68622 ?auto_68626 ) ) ( not ( = ?auto_68622 ?auto_68625 ) ) ( not ( = ?auto_68623 ?auto_68626 ) ) ( not ( = ?auto_68623 ?auto_68625 ) ) ( not ( = ?auto_68624 ?auto_68626 ) ) ( not ( = ?auto_68624 ?auto_68625 ) ) ( not ( = ?auto_68626 ?auto_68625 ) ) ( ON ?auto_68626 ?auto_68624 ) ( CLEAR ?auto_68627 ) ( ON-TABLE ?auto_68627 ) ( not ( = ?auto_68627 ?auto_68625 ) ) ( not ( = ?auto_68621 ?auto_68627 ) ) ( not ( = ?auto_68622 ?auto_68627 ) ) ( not ( = ?auto_68623 ?auto_68627 ) ) ( not ( = ?auto_68624 ?auto_68627 ) ) ( not ( = ?auto_68626 ?auto_68627 ) ) ( ON ?auto_68625 ?auto_68626 ) ( CLEAR ?auto_68625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68621 ?auto_68622 ?auto_68623 ?auto_68624 ?auto_68626 )
      ( MAKE-3PILE ?auto_68621 ?auto_68622 ?auto_68623 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68628 - BLOCK
      ?auto_68629 - BLOCK
      ?auto_68630 - BLOCK
    )
    :vars
    (
      ?auto_68633 - BLOCK
      ?auto_68631 - BLOCK
      ?auto_68634 - BLOCK
      ?auto_68632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68633 ?auto_68630 ) ( ON-TABLE ?auto_68628 ) ( ON ?auto_68629 ?auto_68628 ) ( ON ?auto_68630 ?auto_68629 ) ( not ( = ?auto_68628 ?auto_68629 ) ) ( not ( = ?auto_68628 ?auto_68630 ) ) ( not ( = ?auto_68628 ?auto_68633 ) ) ( not ( = ?auto_68629 ?auto_68630 ) ) ( not ( = ?auto_68629 ?auto_68633 ) ) ( not ( = ?auto_68630 ?auto_68633 ) ) ( not ( = ?auto_68628 ?auto_68631 ) ) ( not ( = ?auto_68628 ?auto_68634 ) ) ( not ( = ?auto_68629 ?auto_68631 ) ) ( not ( = ?auto_68629 ?auto_68634 ) ) ( not ( = ?auto_68630 ?auto_68631 ) ) ( not ( = ?auto_68630 ?auto_68634 ) ) ( not ( = ?auto_68633 ?auto_68631 ) ) ( not ( = ?auto_68633 ?auto_68634 ) ) ( not ( = ?auto_68631 ?auto_68634 ) ) ( ON ?auto_68631 ?auto_68633 ) ( not ( = ?auto_68632 ?auto_68634 ) ) ( not ( = ?auto_68628 ?auto_68632 ) ) ( not ( = ?auto_68629 ?auto_68632 ) ) ( not ( = ?auto_68630 ?auto_68632 ) ) ( not ( = ?auto_68633 ?auto_68632 ) ) ( not ( = ?auto_68631 ?auto_68632 ) ) ( ON ?auto_68634 ?auto_68631 ) ( CLEAR ?auto_68634 ) ( HOLDING ?auto_68632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68632 )
      ( MAKE-3PILE ?auto_68628 ?auto_68629 ?auto_68630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_68635 - BLOCK
      ?auto_68636 - BLOCK
      ?auto_68637 - BLOCK
    )
    :vars
    (
      ?auto_68640 - BLOCK
      ?auto_68638 - BLOCK
      ?auto_68641 - BLOCK
      ?auto_68639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68640 ?auto_68637 ) ( ON-TABLE ?auto_68635 ) ( ON ?auto_68636 ?auto_68635 ) ( ON ?auto_68637 ?auto_68636 ) ( not ( = ?auto_68635 ?auto_68636 ) ) ( not ( = ?auto_68635 ?auto_68637 ) ) ( not ( = ?auto_68635 ?auto_68640 ) ) ( not ( = ?auto_68636 ?auto_68637 ) ) ( not ( = ?auto_68636 ?auto_68640 ) ) ( not ( = ?auto_68637 ?auto_68640 ) ) ( not ( = ?auto_68635 ?auto_68638 ) ) ( not ( = ?auto_68635 ?auto_68641 ) ) ( not ( = ?auto_68636 ?auto_68638 ) ) ( not ( = ?auto_68636 ?auto_68641 ) ) ( not ( = ?auto_68637 ?auto_68638 ) ) ( not ( = ?auto_68637 ?auto_68641 ) ) ( not ( = ?auto_68640 ?auto_68638 ) ) ( not ( = ?auto_68640 ?auto_68641 ) ) ( not ( = ?auto_68638 ?auto_68641 ) ) ( ON ?auto_68638 ?auto_68640 ) ( not ( = ?auto_68639 ?auto_68641 ) ) ( not ( = ?auto_68635 ?auto_68639 ) ) ( not ( = ?auto_68636 ?auto_68639 ) ) ( not ( = ?auto_68637 ?auto_68639 ) ) ( not ( = ?auto_68640 ?auto_68639 ) ) ( not ( = ?auto_68638 ?auto_68639 ) ) ( ON ?auto_68641 ?auto_68638 ) ( ON ?auto_68639 ?auto_68641 ) ( CLEAR ?auto_68639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68635 ?auto_68636 ?auto_68637 ?auto_68640 ?auto_68638 ?auto_68641 )
      ( MAKE-3PILE ?auto_68635 ?auto_68636 ?auto_68637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68646 - BLOCK
      ?auto_68647 - BLOCK
      ?auto_68648 - BLOCK
      ?auto_68649 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68649 ) ( CLEAR ?auto_68648 ) ( ON-TABLE ?auto_68646 ) ( ON ?auto_68647 ?auto_68646 ) ( ON ?auto_68648 ?auto_68647 ) ( not ( = ?auto_68646 ?auto_68647 ) ) ( not ( = ?auto_68646 ?auto_68648 ) ) ( not ( = ?auto_68646 ?auto_68649 ) ) ( not ( = ?auto_68647 ?auto_68648 ) ) ( not ( = ?auto_68647 ?auto_68649 ) ) ( not ( = ?auto_68648 ?auto_68649 ) ) )
    :subtasks
    ( ( !STACK ?auto_68649 ?auto_68648 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68650 - BLOCK
      ?auto_68651 - BLOCK
      ?auto_68652 - BLOCK
      ?auto_68653 - BLOCK
    )
    :vars
    (
      ?auto_68654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68652 ) ( ON-TABLE ?auto_68650 ) ( ON ?auto_68651 ?auto_68650 ) ( ON ?auto_68652 ?auto_68651 ) ( not ( = ?auto_68650 ?auto_68651 ) ) ( not ( = ?auto_68650 ?auto_68652 ) ) ( not ( = ?auto_68650 ?auto_68653 ) ) ( not ( = ?auto_68651 ?auto_68652 ) ) ( not ( = ?auto_68651 ?auto_68653 ) ) ( not ( = ?auto_68652 ?auto_68653 ) ) ( ON ?auto_68653 ?auto_68654 ) ( CLEAR ?auto_68653 ) ( HAND-EMPTY ) ( not ( = ?auto_68650 ?auto_68654 ) ) ( not ( = ?auto_68651 ?auto_68654 ) ) ( not ( = ?auto_68652 ?auto_68654 ) ) ( not ( = ?auto_68653 ?auto_68654 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68653 ?auto_68654 )
      ( MAKE-4PILE ?auto_68650 ?auto_68651 ?auto_68652 ?auto_68653 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68655 - BLOCK
      ?auto_68656 - BLOCK
      ?auto_68657 - BLOCK
      ?auto_68658 - BLOCK
    )
    :vars
    (
      ?auto_68659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68655 ) ( ON ?auto_68656 ?auto_68655 ) ( not ( = ?auto_68655 ?auto_68656 ) ) ( not ( = ?auto_68655 ?auto_68657 ) ) ( not ( = ?auto_68655 ?auto_68658 ) ) ( not ( = ?auto_68656 ?auto_68657 ) ) ( not ( = ?auto_68656 ?auto_68658 ) ) ( not ( = ?auto_68657 ?auto_68658 ) ) ( ON ?auto_68658 ?auto_68659 ) ( CLEAR ?auto_68658 ) ( not ( = ?auto_68655 ?auto_68659 ) ) ( not ( = ?auto_68656 ?auto_68659 ) ) ( not ( = ?auto_68657 ?auto_68659 ) ) ( not ( = ?auto_68658 ?auto_68659 ) ) ( HOLDING ?auto_68657 ) ( CLEAR ?auto_68656 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68655 ?auto_68656 ?auto_68657 )
      ( MAKE-4PILE ?auto_68655 ?auto_68656 ?auto_68657 ?auto_68658 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68660 - BLOCK
      ?auto_68661 - BLOCK
      ?auto_68662 - BLOCK
      ?auto_68663 - BLOCK
    )
    :vars
    (
      ?auto_68664 - BLOCK
      ?auto_68665 - BLOCK
      ?auto_68666 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68660 ) ( ON ?auto_68661 ?auto_68660 ) ( not ( = ?auto_68660 ?auto_68661 ) ) ( not ( = ?auto_68660 ?auto_68662 ) ) ( not ( = ?auto_68660 ?auto_68663 ) ) ( not ( = ?auto_68661 ?auto_68662 ) ) ( not ( = ?auto_68661 ?auto_68663 ) ) ( not ( = ?auto_68662 ?auto_68663 ) ) ( ON ?auto_68663 ?auto_68664 ) ( not ( = ?auto_68660 ?auto_68664 ) ) ( not ( = ?auto_68661 ?auto_68664 ) ) ( not ( = ?auto_68662 ?auto_68664 ) ) ( not ( = ?auto_68663 ?auto_68664 ) ) ( CLEAR ?auto_68661 ) ( ON ?auto_68662 ?auto_68663 ) ( CLEAR ?auto_68662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68665 ) ( ON ?auto_68666 ?auto_68665 ) ( ON ?auto_68664 ?auto_68666 ) ( not ( = ?auto_68665 ?auto_68666 ) ) ( not ( = ?auto_68665 ?auto_68664 ) ) ( not ( = ?auto_68665 ?auto_68663 ) ) ( not ( = ?auto_68665 ?auto_68662 ) ) ( not ( = ?auto_68666 ?auto_68664 ) ) ( not ( = ?auto_68666 ?auto_68663 ) ) ( not ( = ?auto_68666 ?auto_68662 ) ) ( not ( = ?auto_68660 ?auto_68665 ) ) ( not ( = ?auto_68660 ?auto_68666 ) ) ( not ( = ?auto_68661 ?auto_68665 ) ) ( not ( = ?auto_68661 ?auto_68666 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68665 ?auto_68666 ?auto_68664 ?auto_68663 )
      ( MAKE-4PILE ?auto_68660 ?auto_68661 ?auto_68662 ?auto_68663 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68667 - BLOCK
      ?auto_68668 - BLOCK
      ?auto_68669 - BLOCK
      ?auto_68670 - BLOCK
    )
    :vars
    (
      ?auto_68671 - BLOCK
      ?auto_68673 - BLOCK
      ?auto_68672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68667 ) ( not ( = ?auto_68667 ?auto_68668 ) ) ( not ( = ?auto_68667 ?auto_68669 ) ) ( not ( = ?auto_68667 ?auto_68670 ) ) ( not ( = ?auto_68668 ?auto_68669 ) ) ( not ( = ?auto_68668 ?auto_68670 ) ) ( not ( = ?auto_68669 ?auto_68670 ) ) ( ON ?auto_68670 ?auto_68671 ) ( not ( = ?auto_68667 ?auto_68671 ) ) ( not ( = ?auto_68668 ?auto_68671 ) ) ( not ( = ?auto_68669 ?auto_68671 ) ) ( not ( = ?auto_68670 ?auto_68671 ) ) ( ON ?auto_68669 ?auto_68670 ) ( CLEAR ?auto_68669 ) ( ON-TABLE ?auto_68673 ) ( ON ?auto_68672 ?auto_68673 ) ( ON ?auto_68671 ?auto_68672 ) ( not ( = ?auto_68673 ?auto_68672 ) ) ( not ( = ?auto_68673 ?auto_68671 ) ) ( not ( = ?auto_68673 ?auto_68670 ) ) ( not ( = ?auto_68673 ?auto_68669 ) ) ( not ( = ?auto_68672 ?auto_68671 ) ) ( not ( = ?auto_68672 ?auto_68670 ) ) ( not ( = ?auto_68672 ?auto_68669 ) ) ( not ( = ?auto_68667 ?auto_68673 ) ) ( not ( = ?auto_68667 ?auto_68672 ) ) ( not ( = ?auto_68668 ?auto_68673 ) ) ( not ( = ?auto_68668 ?auto_68672 ) ) ( HOLDING ?auto_68668 ) ( CLEAR ?auto_68667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68667 ?auto_68668 )
      ( MAKE-4PILE ?auto_68667 ?auto_68668 ?auto_68669 ?auto_68670 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68674 - BLOCK
      ?auto_68675 - BLOCK
      ?auto_68676 - BLOCK
      ?auto_68677 - BLOCK
    )
    :vars
    (
      ?auto_68678 - BLOCK
      ?auto_68680 - BLOCK
      ?auto_68679 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68674 ) ( not ( = ?auto_68674 ?auto_68675 ) ) ( not ( = ?auto_68674 ?auto_68676 ) ) ( not ( = ?auto_68674 ?auto_68677 ) ) ( not ( = ?auto_68675 ?auto_68676 ) ) ( not ( = ?auto_68675 ?auto_68677 ) ) ( not ( = ?auto_68676 ?auto_68677 ) ) ( ON ?auto_68677 ?auto_68678 ) ( not ( = ?auto_68674 ?auto_68678 ) ) ( not ( = ?auto_68675 ?auto_68678 ) ) ( not ( = ?auto_68676 ?auto_68678 ) ) ( not ( = ?auto_68677 ?auto_68678 ) ) ( ON ?auto_68676 ?auto_68677 ) ( ON-TABLE ?auto_68680 ) ( ON ?auto_68679 ?auto_68680 ) ( ON ?auto_68678 ?auto_68679 ) ( not ( = ?auto_68680 ?auto_68679 ) ) ( not ( = ?auto_68680 ?auto_68678 ) ) ( not ( = ?auto_68680 ?auto_68677 ) ) ( not ( = ?auto_68680 ?auto_68676 ) ) ( not ( = ?auto_68679 ?auto_68678 ) ) ( not ( = ?auto_68679 ?auto_68677 ) ) ( not ( = ?auto_68679 ?auto_68676 ) ) ( not ( = ?auto_68674 ?auto_68680 ) ) ( not ( = ?auto_68674 ?auto_68679 ) ) ( not ( = ?auto_68675 ?auto_68680 ) ) ( not ( = ?auto_68675 ?auto_68679 ) ) ( CLEAR ?auto_68674 ) ( ON ?auto_68675 ?auto_68676 ) ( CLEAR ?auto_68675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68680 ?auto_68679 ?auto_68678 ?auto_68677 ?auto_68676 )
      ( MAKE-4PILE ?auto_68674 ?auto_68675 ?auto_68676 ?auto_68677 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68681 - BLOCK
      ?auto_68682 - BLOCK
      ?auto_68683 - BLOCK
      ?auto_68684 - BLOCK
    )
    :vars
    (
      ?auto_68686 - BLOCK
      ?auto_68687 - BLOCK
      ?auto_68685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68681 ?auto_68682 ) ) ( not ( = ?auto_68681 ?auto_68683 ) ) ( not ( = ?auto_68681 ?auto_68684 ) ) ( not ( = ?auto_68682 ?auto_68683 ) ) ( not ( = ?auto_68682 ?auto_68684 ) ) ( not ( = ?auto_68683 ?auto_68684 ) ) ( ON ?auto_68684 ?auto_68686 ) ( not ( = ?auto_68681 ?auto_68686 ) ) ( not ( = ?auto_68682 ?auto_68686 ) ) ( not ( = ?auto_68683 ?auto_68686 ) ) ( not ( = ?auto_68684 ?auto_68686 ) ) ( ON ?auto_68683 ?auto_68684 ) ( ON-TABLE ?auto_68687 ) ( ON ?auto_68685 ?auto_68687 ) ( ON ?auto_68686 ?auto_68685 ) ( not ( = ?auto_68687 ?auto_68685 ) ) ( not ( = ?auto_68687 ?auto_68686 ) ) ( not ( = ?auto_68687 ?auto_68684 ) ) ( not ( = ?auto_68687 ?auto_68683 ) ) ( not ( = ?auto_68685 ?auto_68686 ) ) ( not ( = ?auto_68685 ?auto_68684 ) ) ( not ( = ?auto_68685 ?auto_68683 ) ) ( not ( = ?auto_68681 ?auto_68687 ) ) ( not ( = ?auto_68681 ?auto_68685 ) ) ( not ( = ?auto_68682 ?auto_68687 ) ) ( not ( = ?auto_68682 ?auto_68685 ) ) ( ON ?auto_68682 ?auto_68683 ) ( CLEAR ?auto_68682 ) ( HOLDING ?auto_68681 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68681 )
      ( MAKE-4PILE ?auto_68681 ?auto_68682 ?auto_68683 ?auto_68684 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_68688 - BLOCK
      ?auto_68689 - BLOCK
      ?auto_68690 - BLOCK
      ?auto_68691 - BLOCK
    )
    :vars
    (
      ?auto_68694 - BLOCK
      ?auto_68693 - BLOCK
      ?auto_68692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68688 ?auto_68689 ) ) ( not ( = ?auto_68688 ?auto_68690 ) ) ( not ( = ?auto_68688 ?auto_68691 ) ) ( not ( = ?auto_68689 ?auto_68690 ) ) ( not ( = ?auto_68689 ?auto_68691 ) ) ( not ( = ?auto_68690 ?auto_68691 ) ) ( ON ?auto_68691 ?auto_68694 ) ( not ( = ?auto_68688 ?auto_68694 ) ) ( not ( = ?auto_68689 ?auto_68694 ) ) ( not ( = ?auto_68690 ?auto_68694 ) ) ( not ( = ?auto_68691 ?auto_68694 ) ) ( ON ?auto_68690 ?auto_68691 ) ( ON-TABLE ?auto_68693 ) ( ON ?auto_68692 ?auto_68693 ) ( ON ?auto_68694 ?auto_68692 ) ( not ( = ?auto_68693 ?auto_68692 ) ) ( not ( = ?auto_68693 ?auto_68694 ) ) ( not ( = ?auto_68693 ?auto_68691 ) ) ( not ( = ?auto_68693 ?auto_68690 ) ) ( not ( = ?auto_68692 ?auto_68694 ) ) ( not ( = ?auto_68692 ?auto_68691 ) ) ( not ( = ?auto_68692 ?auto_68690 ) ) ( not ( = ?auto_68688 ?auto_68693 ) ) ( not ( = ?auto_68688 ?auto_68692 ) ) ( not ( = ?auto_68689 ?auto_68693 ) ) ( not ( = ?auto_68689 ?auto_68692 ) ) ( ON ?auto_68689 ?auto_68690 ) ( ON ?auto_68688 ?auto_68689 ) ( CLEAR ?auto_68688 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68693 ?auto_68692 ?auto_68694 ?auto_68691 ?auto_68690 ?auto_68689 )
      ( MAKE-4PILE ?auto_68688 ?auto_68689 ?auto_68690 ?auto_68691 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68697 - BLOCK
      ?auto_68698 - BLOCK
    )
    :vars
    (
      ?auto_68699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68699 ?auto_68698 ) ( CLEAR ?auto_68699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68697 ) ( ON ?auto_68698 ?auto_68697 ) ( not ( = ?auto_68697 ?auto_68698 ) ) ( not ( = ?auto_68697 ?auto_68699 ) ) ( not ( = ?auto_68698 ?auto_68699 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68699 ?auto_68698 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68700 - BLOCK
      ?auto_68701 - BLOCK
    )
    :vars
    (
      ?auto_68702 - BLOCK
      ?auto_68703 - BLOCK
      ?auto_68704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68702 ?auto_68701 ) ( CLEAR ?auto_68702 ) ( ON-TABLE ?auto_68700 ) ( ON ?auto_68701 ?auto_68700 ) ( not ( = ?auto_68700 ?auto_68701 ) ) ( not ( = ?auto_68700 ?auto_68702 ) ) ( not ( = ?auto_68701 ?auto_68702 ) ) ( HOLDING ?auto_68703 ) ( CLEAR ?auto_68704 ) ( not ( = ?auto_68700 ?auto_68703 ) ) ( not ( = ?auto_68700 ?auto_68704 ) ) ( not ( = ?auto_68701 ?auto_68703 ) ) ( not ( = ?auto_68701 ?auto_68704 ) ) ( not ( = ?auto_68702 ?auto_68703 ) ) ( not ( = ?auto_68702 ?auto_68704 ) ) ( not ( = ?auto_68703 ?auto_68704 ) ) )
    :subtasks
    ( ( !STACK ?auto_68703 ?auto_68704 )
      ( MAKE-2PILE ?auto_68700 ?auto_68701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68705 - BLOCK
      ?auto_68706 - BLOCK
    )
    :vars
    (
      ?auto_68709 - BLOCK
      ?auto_68707 - BLOCK
      ?auto_68708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68709 ?auto_68706 ) ( ON-TABLE ?auto_68705 ) ( ON ?auto_68706 ?auto_68705 ) ( not ( = ?auto_68705 ?auto_68706 ) ) ( not ( = ?auto_68705 ?auto_68709 ) ) ( not ( = ?auto_68706 ?auto_68709 ) ) ( CLEAR ?auto_68707 ) ( not ( = ?auto_68705 ?auto_68708 ) ) ( not ( = ?auto_68705 ?auto_68707 ) ) ( not ( = ?auto_68706 ?auto_68708 ) ) ( not ( = ?auto_68706 ?auto_68707 ) ) ( not ( = ?auto_68709 ?auto_68708 ) ) ( not ( = ?auto_68709 ?auto_68707 ) ) ( not ( = ?auto_68708 ?auto_68707 ) ) ( ON ?auto_68708 ?auto_68709 ) ( CLEAR ?auto_68708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68705 ?auto_68706 ?auto_68709 )
      ( MAKE-2PILE ?auto_68705 ?auto_68706 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68710 - BLOCK
      ?auto_68711 - BLOCK
    )
    :vars
    (
      ?auto_68713 - BLOCK
      ?auto_68712 - BLOCK
      ?auto_68714 - BLOCK
      ?auto_68715 - BLOCK
      ?auto_68716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68713 ?auto_68711 ) ( ON-TABLE ?auto_68710 ) ( ON ?auto_68711 ?auto_68710 ) ( not ( = ?auto_68710 ?auto_68711 ) ) ( not ( = ?auto_68710 ?auto_68713 ) ) ( not ( = ?auto_68711 ?auto_68713 ) ) ( not ( = ?auto_68710 ?auto_68712 ) ) ( not ( = ?auto_68710 ?auto_68714 ) ) ( not ( = ?auto_68711 ?auto_68712 ) ) ( not ( = ?auto_68711 ?auto_68714 ) ) ( not ( = ?auto_68713 ?auto_68712 ) ) ( not ( = ?auto_68713 ?auto_68714 ) ) ( not ( = ?auto_68712 ?auto_68714 ) ) ( ON ?auto_68712 ?auto_68713 ) ( CLEAR ?auto_68712 ) ( HOLDING ?auto_68714 ) ( CLEAR ?auto_68715 ) ( ON-TABLE ?auto_68716 ) ( ON ?auto_68715 ?auto_68716 ) ( not ( = ?auto_68716 ?auto_68715 ) ) ( not ( = ?auto_68716 ?auto_68714 ) ) ( not ( = ?auto_68715 ?auto_68714 ) ) ( not ( = ?auto_68710 ?auto_68715 ) ) ( not ( = ?auto_68710 ?auto_68716 ) ) ( not ( = ?auto_68711 ?auto_68715 ) ) ( not ( = ?auto_68711 ?auto_68716 ) ) ( not ( = ?auto_68713 ?auto_68715 ) ) ( not ( = ?auto_68713 ?auto_68716 ) ) ( not ( = ?auto_68712 ?auto_68715 ) ) ( not ( = ?auto_68712 ?auto_68716 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68716 ?auto_68715 ?auto_68714 )
      ( MAKE-2PILE ?auto_68710 ?auto_68711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68717 - BLOCK
      ?auto_68718 - BLOCK
    )
    :vars
    (
      ?auto_68723 - BLOCK
      ?auto_68722 - BLOCK
      ?auto_68719 - BLOCK
      ?auto_68721 - BLOCK
      ?auto_68720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68723 ?auto_68718 ) ( ON-TABLE ?auto_68717 ) ( ON ?auto_68718 ?auto_68717 ) ( not ( = ?auto_68717 ?auto_68718 ) ) ( not ( = ?auto_68717 ?auto_68723 ) ) ( not ( = ?auto_68718 ?auto_68723 ) ) ( not ( = ?auto_68717 ?auto_68722 ) ) ( not ( = ?auto_68717 ?auto_68719 ) ) ( not ( = ?auto_68718 ?auto_68722 ) ) ( not ( = ?auto_68718 ?auto_68719 ) ) ( not ( = ?auto_68723 ?auto_68722 ) ) ( not ( = ?auto_68723 ?auto_68719 ) ) ( not ( = ?auto_68722 ?auto_68719 ) ) ( ON ?auto_68722 ?auto_68723 ) ( CLEAR ?auto_68721 ) ( ON-TABLE ?auto_68720 ) ( ON ?auto_68721 ?auto_68720 ) ( not ( = ?auto_68720 ?auto_68721 ) ) ( not ( = ?auto_68720 ?auto_68719 ) ) ( not ( = ?auto_68721 ?auto_68719 ) ) ( not ( = ?auto_68717 ?auto_68721 ) ) ( not ( = ?auto_68717 ?auto_68720 ) ) ( not ( = ?auto_68718 ?auto_68721 ) ) ( not ( = ?auto_68718 ?auto_68720 ) ) ( not ( = ?auto_68723 ?auto_68721 ) ) ( not ( = ?auto_68723 ?auto_68720 ) ) ( not ( = ?auto_68722 ?auto_68721 ) ) ( not ( = ?auto_68722 ?auto_68720 ) ) ( ON ?auto_68719 ?auto_68722 ) ( CLEAR ?auto_68719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68717 ?auto_68718 ?auto_68723 ?auto_68722 )
      ( MAKE-2PILE ?auto_68717 ?auto_68718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68724 - BLOCK
      ?auto_68725 - BLOCK
    )
    :vars
    (
      ?auto_68728 - BLOCK
      ?auto_68730 - BLOCK
      ?auto_68726 - BLOCK
      ?auto_68729 - BLOCK
      ?auto_68727 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68728 ?auto_68725 ) ( ON-TABLE ?auto_68724 ) ( ON ?auto_68725 ?auto_68724 ) ( not ( = ?auto_68724 ?auto_68725 ) ) ( not ( = ?auto_68724 ?auto_68728 ) ) ( not ( = ?auto_68725 ?auto_68728 ) ) ( not ( = ?auto_68724 ?auto_68730 ) ) ( not ( = ?auto_68724 ?auto_68726 ) ) ( not ( = ?auto_68725 ?auto_68730 ) ) ( not ( = ?auto_68725 ?auto_68726 ) ) ( not ( = ?auto_68728 ?auto_68730 ) ) ( not ( = ?auto_68728 ?auto_68726 ) ) ( not ( = ?auto_68730 ?auto_68726 ) ) ( ON ?auto_68730 ?auto_68728 ) ( ON-TABLE ?auto_68729 ) ( not ( = ?auto_68729 ?auto_68727 ) ) ( not ( = ?auto_68729 ?auto_68726 ) ) ( not ( = ?auto_68727 ?auto_68726 ) ) ( not ( = ?auto_68724 ?auto_68727 ) ) ( not ( = ?auto_68724 ?auto_68729 ) ) ( not ( = ?auto_68725 ?auto_68727 ) ) ( not ( = ?auto_68725 ?auto_68729 ) ) ( not ( = ?auto_68728 ?auto_68727 ) ) ( not ( = ?auto_68728 ?auto_68729 ) ) ( not ( = ?auto_68730 ?auto_68727 ) ) ( not ( = ?auto_68730 ?auto_68729 ) ) ( ON ?auto_68726 ?auto_68730 ) ( CLEAR ?auto_68726 ) ( HOLDING ?auto_68727 ) ( CLEAR ?auto_68729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68729 ?auto_68727 )
      ( MAKE-2PILE ?auto_68724 ?auto_68725 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68731 - BLOCK
      ?auto_68732 - BLOCK
    )
    :vars
    (
      ?auto_68735 - BLOCK
      ?auto_68736 - BLOCK
      ?auto_68733 - BLOCK
      ?auto_68737 - BLOCK
      ?auto_68734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68735 ?auto_68732 ) ( ON-TABLE ?auto_68731 ) ( ON ?auto_68732 ?auto_68731 ) ( not ( = ?auto_68731 ?auto_68732 ) ) ( not ( = ?auto_68731 ?auto_68735 ) ) ( not ( = ?auto_68732 ?auto_68735 ) ) ( not ( = ?auto_68731 ?auto_68736 ) ) ( not ( = ?auto_68731 ?auto_68733 ) ) ( not ( = ?auto_68732 ?auto_68736 ) ) ( not ( = ?auto_68732 ?auto_68733 ) ) ( not ( = ?auto_68735 ?auto_68736 ) ) ( not ( = ?auto_68735 ?auto_68733 ) ) ( not ( = ?auto_68736 ?auto_68733 ) ) ( ON ?auto_68736 ?auto_68735 ) ( ON-TABLE ?auto_68737 ) ( not ( = ?auto_68737 ?auto_68734 ) ) ( not ( = ?auto_68737 ?auto_68733 ) ) ( not ( = ?auto_68734 ?auto_68733 ) ) ( not ( = ?auto_68731 ?auto_68734 ) ) ( not ( = ?auto_68731 ?auto_68737 ) ) ( not ( = ?auto_68732 ?auto_68734 ) ) ( not ( = ?auto_68732 ?auto_68737 ) ) ( not ( = ?auto_68735 ?auto_68734 ) ) ( not ( = ?auto_68735 ?auto_68737 ) ) ( not ( = ?auto_68736 ?auto_68734 ) ) ( not ( = ?auto_68736 ?auto_68737 ) ) ( ON ?auto_68733 ?auto_68736 ) ( CLEAR ?auto_68737 ) ( ON ?auto_68734 ?auto_68733 ) ( CLEAR ?auto_68734 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68731 ?auto_68732 ?auto_68735 ?auto_68736 ?auto_68733 )
      ( MAKE-2PILE ?auto_68731 ?auto_68732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68738 - BLOCK
      ?auto_68739 - BLOCK
    )
    :vars
    (
      ?auto_68741 - BLOCK
      ?auto_68742 - BLOCK
      ?auto_68744 - BLOCK
      ?auto_68740 - BLOCK
      ?auto_68743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68741 ?auto_68739 ) ( ON-TABLE ?auto_68738 ) ( ON ?auto_68739 ?auto_68738 ) ( not ( = ?auto_68738 ?auto_68739 ) ) ( not ( = ?auto_68738 ?auto_68741 ) ) ( not ( = ?auto_68739 ?auto_68741 ) ) ( not ( = ?auto_68738 ?auto_68742 ) ) ( not ( = ?auto_68738 ?auto_68744 ) ) ( not ( = ?auto_68739 ?auto_68742 ) ) ( not ( = ?auto_68739 ?auto_68744 ) ) ( not ( = ?auto_68741 ?auto_68742 ) ) ( not ( = ?auto_68741 ?auto_68744 ) ) ( not ( = ?auto_68742 ?auto_68744 ) ) ( ON ?auto_68742 ?auto_68741 ) ( not ( = ?auto_68740 ?auto_68743 ) ) ( not ( = ?auto_68740 ?auto_68744 ) ) ( not ( = ?auto_68743 ?auto_68744 ) ) ( not ( = ?auto_68738 ?auto_68743 ) ) ( not ( = ?auto_68738 ?auto_68740 ) ) ( not ( = ?auto_68739 ?auto_68743 ) ) ( not ( = ?auto_68739 ?auto_68740 ) ) ( not ( = ?auto_68741 ?auto_68743 ) ) ( not ( = ?auto_68741 ?auto_68740 ) ) ( not ( = ?auto_68742 ?auto_68743 ) ) ( not ( = ?auto_68742 ?auto_68740 ) ) ( ON ?auto_68744 ?auto_68742 ) ( ON ?auto_68743 ?auto_68744 ) ( CLEAR ?auto_68743 ) ( HOLDING ?auto_68740 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68740 )
      ( MAKE-2PILE ?auto_68738 ?auto_68739 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68745 - BLOCK
      ?auto_68746 - BLOCK
    )
    :vars
    (
      ?auto_68750 - BLOCK
      ?auto_68748 - BLOCK
      ?auto_68747 - BLOCK
      ?auto_68751 - BLOCK
      ?auto_68749 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68750 ?auto_68746 ) ( ON-TABLE ?auto_68745 ) ( ON ?auto_68746 ?auto_68745 ) ( not ( = ?auto_68745 ?auto_68746 ) ) ( not ( = ?auto_68745 ?auto_68750 ) ) ( not ( = ?auto_68746 ?auto_68750 ) ) ( not ( = ?auto_68745 ?auto_68748 ) ) ( not ( = ?auto_68745 ?auto_68747 ) ) ( not ( = ?auto_68746 ?auto_68748 ) ) ( not ( = ?auto_68746 ?auto_68747 ) ) ( not ( = ?auto_68750 ?auto_68748 ) ) ( not ( = ?auto_68750 ?auto_68747 ) ) ( not ( = ?auto_68748 ?auto_68747 ) ) ( ON ?auto_68748 ?auto_68750 ) ( not ( = ?auto_68751 ?auto_68749 ) ) ( not ( = ?auto_68751 ?auto_68747 ) ) ( not ( = ?auto_68749 ?auto_68747 ) ) ( not ( = ?auto_68745 ?auto_68749 ) ) ( not ( = ?auto_68745 ?auto_68751 ) ) ( not ( = ?auto_68746 ?auto_68749 ) ) ( not ( = ?auto_68746 ?auto_68751 ) ) ( not ( = ?auto_68750 ?auto_68749 ) ) ( not ( = ?auto_68750 ?auto_68751 ) ) ( not ( = ?auto_68748 ?auto_68749 ) ) ( not ( = ?auto_68748 ?auto_68751 ) ) ( ON ?auto_68747 ?auto_68748 ) ( ON ?auto_68749 ?auto_68747 ) ( ON ?auto_68751 ?auto_68749 ) ( CLEAR ?auto_68751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68745 ?auto_68746 ?auto_68750 ?auto_68748 ?auto_68747 ?auto_68749 )
      ( MAKE-2PILE ?auto_68745 ?auto_68746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68757 - BLOCK
      ?auto_68758 - BLOCK
      ?auto_68759 - BLOCK
      ?auto_68760 - BLOCK
      ?auto_68761 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68761 ) ( CLEAR ?auto_68760 ) ( ON-TABLE ?auto_68757 ) ( ON ?auto_68758 ?auto_68757 ) ( ON ?auto_68759 ?auto_68758 ) ( ON ?auto_68760 ?auto_68759 ) ( not ( = ?auto_68757 ?auto_68758 ) ) ( not ( = ?auto_68757 ?auto_68759 ) ) ( not ( = ?auto_68757 ?auto_68760 ) ) ( not ( = ?auto_68757 ?auto_68761 ) ) ( not ( = ?auto_68758 ?auto_68759 ) ) ( not ( = ?auto_68758 ?auto_68760 ) ) ( not ( = ?auto_68758 ?auto_68761 ) ) ( not ( = ?auto_68759 ?auto_68760 ) ) ( not ( = ?auto_68759 ?auto_68761 ) ) ( not ( = ?auto_68760 ?auto_68761 ) ) )
    :subtasks
    ( ( !STACK ?auto_68761 ?auto_68760 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68762 - BLOCK
      ?auto_68763 - BLOCK
      ?auto_68764 - BLOCK
      ?auto_68765 - BLOCK
      ?auto_68766 - BLOCK
    )
    :vars
    (
      ?auto_68767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68765 ) ( ON-TABLE ?auto_68762 ) ( ON ?auto_68763 ?auto_68762 ) ( ON ?auto_68764 ?auto_68763 ) ( ON ?auto_68765 ?auto_68764 ) ( not ( = ?auto_68762 ?auto_68763 ) ) ( not ( = ?auto_68762 ?auto_68764 ) ) ( not ( = ?auto_68762 ?auto_68765 ) ) ( not ( = ?auto_68762 ?auto_68766 ) ) ( not ( = ?auto_68763 ?auto_68764 ) ) ( not ( = ?auto_68763 ?auto_68765 ) ) ( not ( = ?auto_68763 ?auto_68766 ) ) ( not ( = ?auto_68764 ?auto_68765 ) ) ( not ( = ?auto_68764 ?auto_68766 ) ) ( not ( = ?auto_68765 ?auto_68766 ) ) ( ON ?auto_68766 ?auto_68767 ) ( CLEAR ?auto_68766 ) ( HAND-EMPTY ) ( not ( = ?auto_68762 ?auto_68767 ) ) ( not ( = ?auto_68763 ?auto_68767 ) ) ( not ( = ?auto_68764 ?auto_68767 ) ) ( not ( = ?auto_68765 ?auto_68767 ) ) ( not ( = ?auto_68766 ?auto_68767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68766 ?auto_68767 )
      ( MAKE-5PILE ?auto_68762 ?auto_68763 ?auto_68764 ?auto_68765 ?auto_68766 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68768 - BLOCK
      ?auto_68769 - BLOCK
      ?auto_68770 - BLOCK
      ?auto_68771 - BLOCK
      ?auto_68772 - BLOCK
    )
    :vars
    (
      ?auto_68773 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68768 ) ( ON ?auto_68769 ?auto_68768 ) ( ON ?auto_68770 ?auto_68769 ) ( not ( = ?auto_68768 ?auto_68769 ) ) ( not ( = ?auto_68768 ?auto_68770 ) ) ( not ( = ?auto_68768 ?auto_68771 ) ) ( not ( = ?auto_68768 ?auto_68772 ) ) ( not ( = ?auto_68769 ?auto_68770 ) ) ( not ( = ?auto_68769 ?auto_68771 ) ) ( not ( = ?auto_68769 ?auto_68772 ) ) ( not ( = ?auto_68770 ?auto_68771 ) ) ( not ( = ?auto_68770 ?auto_68772 ) ) ( not ( = ?auto_68771 ?auto_68772 ) ) ( ON ?auto_68772 ?auto_68773 ) ( CLEAR ?auto_68772 ) ( not ( = ?auto_68768 ?auto_68773 ) ) ( not ( = ?auto_68769 ?auto_68773 ) ) ( not ( = ?auto_68770 ?auto_68773 ) ) ( not ( = ?auto_68771 ?auto_68773 ) ) ( not ( = ?auto_68772 ?auto_68773 ) ) ( HOLDING ?auto_68771 ) ( CLEAR ?auto_68770 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68768 ?auto_68769 ?auto_68770 ?auto_68771 )
      ( MAKE-5PILE ?auto_68768 ?auto_68769 ?auto_68770 ?auto_68771 ?auto_68772 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68774 - BLOCK
      ?auto_68775 - BLOCK
      ?auto_68776 - BLOCK
      ?auto_68777 - BLOCK
      ?auto_68778 - BLOCK
    )
    :vars
    (
      ?auto_68779 - BLOCK
      ?auto_68780 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68774 ) ( ON ?auto_68775 ?auto_68774 ) ( ON ?auto_68776 ?auto_68775 ) ( not ( = ?auto_68774 ?auto_68775 ) ) ( not ( = ?auto_68774 ?auto_68776 ) ) ( not ( = ?auto_68774 ?auto_68777 ) ) ( not ( = ?auto_68774 ?auto_68778 ) ) ( not ( = ?auto_68775 ?auto_68776 ) ) ( not ( = ?auto_68775 ?auto_68777 ) ) ( not ( = ?auto_68775 ?auto_68778 ) ) ( not ( = ?auto_68776 ?auto_68777 ) ) ( not ( = ?auto_68776 ?auto_68778 ) ) ( not ( = ?auto_68777 ?auto_68778 ) ) ( ON ?auto_68778 ?auto_68779 ) ( not ( = ?auto_68774 ?auto_68779 ) ) ( not ( = ?auto_68775 ?auto_68779 ) ) ( not ( = ?auto_68776 ?auto_68779 ) ) ( not ( = ?auto_68777 ?auto_68779 ) ) ( not ( = ?auto_68778 ?auto_68779 ) ) ( CLEAR ?auto_68776 ) ( ON ?auto_68777 ?auto_68778 ) ( CLEAR ?auto_68777 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68780 ) ( ON ?auto_68779 ?auto_68780 ) ( not ( = ?auto_68780 ?auto_68779 ) ) ( not ( = ?auto_68780 ?auto_68778 ) ) ( not ( = ?auto_68780 ?auto_68777 ) ) ( not ( = ?auto_68774 ?auto_68780 ) ) ( not ( = ?auto_68775 ?auto_68780 ) ) ( not ( = ?auto_68776 ?auto_68780 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68780 ?auto_68779 ?auto_68778 )
      ( MAKE-5PILE ?auto_68774 ?auto_68775 ?auto_68776 ?auto_68777 ?auto_68778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68781 - BLOCK
      ?auto_68782 - BLOCK
      ?auto_68783 - BLOCK
      ?auto_68784 - BLOCK
      ?auto_68785 - BLOCK
    )
    :vars
    (
      ?auto_68786 - BLOCK
      ?auto_68787 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68781 ) ( ON ?auto_68782 ?auto_68781 ) ( not ( = ?auto_68781 ?auto_68782 ) ) ( not ( = ?auto_68781 ?auto_68783 ) ) ( not ( = ?auto_68781 ?auto_68784 ) ) ( not ( = ?auto_68781 ?auto_68785 ) ) ( not ( = ?auto_68782 ?auto_68783 ) ) ( not ( = ?auto_68782 ?auto_68784 ) ) ( not ( = ?auto_68782 ?auto_68785 ) ) ( not ( = ?auto_68783 ?auto_68784 ) ) ( not ( = ?auto_68783 ?auto_68785 ) ) ( not ( = ?auto_68784 ?auto_68785 ) ) ( ON ?auto_68785 ?auto_68786 ) ( not ( = ?auto_68781 ?auto_68786 ) ) ( not ( = ?auto_68782 ?auto_68786 ) ) ( not ( = ?auto_68783 ?auto_68786 ) ) ( not ( = ?auto_68784 ?auto_68786 ) ) ( not ( = ?auto_68785 ?auto_68786 ) ) ( ON ?auto_68784 ?auto_68785 ) ( CLEAR ?auto_68784 ) ( ON-TABLE ?auto_68787 ) ( ON ?auto_68786 ?auto_68787 ) ( not ( = ?auto_68787 ?auto_68786 ) ) ( not ( = ?auto_68787 ?auto_68785 ) ) ( not ( = ?auto_68787 ?auto_68784 ) ) ( not ( = ?auto_68781 ?auto_68787 ) ) ( not ( = ?auto_68782 ?auto_68787 ) ) ( not ( = ?auto_68783 ?auto_68787 ) ) ( HOLDING ?auto_68783 ) ( CLEAR ?auto_68782 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68781 ?auto_68782 ?auto_68783 )
      ( MAKE-5PILE ?auto_68781 ?auto_68782 ?auto_68783 ?auto_68784 ?auto_68785 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68788 - BLOCK
      ?auto_68789 - BLOCK
      ?auto_68790 - BLOCK
      ?auto_68791 - BLOCK
      ?auto_68792 - BLOCK
    )
    :vars
    (
      ?auto_68793 - BLOCK
      ?auto_68794 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68788 ) ( ON ?auto_68789 ?auto_68788 ) ( not ( = ?auto_68788 ?auto_68789 ) ) ( not ( = ?auto_68788 ?auto_68790 ) ) ( not ( = ?auto_68788 ?auto_68791 ) ) ( not ( = ?auto_68788 ?auto_68792 ) ) ( not ( = ?auto_68789 ?auto_68790 ) ) ( not ( = ?auto_68789 ?auto_68791 ) ) ( not ( = ?auto_68789 ?auto_68792 ) ) ( not ( = ?auto_68790 ?auto_68791 ) ) ( not ( = ?auto_68790 ?auto_68792 ) ) ( not ( = ?auto_68791 ?auto_68792 ) ) ( ON ?auto_68792 ?auto_68793 ) ( not ( = ?auto_68788 ?auto_68793 ) ) ( not ( = ?auto_68789 ?auto_68793 ) ) ( not ( = ?auto_68790 ?auto_68793 ) ) ( not ( = ?auto_68791 ?auto_68793 ) ) ( not ( = ?auto_68792 ?auto_68793 ) ) ( ON ?auto_68791 ?auto_68792 ) ( ON-TABLE ?auto_68794 ) ( ON ?auto_68793 ?auto_68794 ) ( not ( = ?auto_68794 ?auto_68793 ) ) ( not ( = ?auto_68794 ?auto_68792 ) ) ( not ( = ?auto_68794 ?auto_68791 ) ) ( not ( = ?auto_68788 ?auto_68794 ) ) ( not ( = ?auto_68789 ?auto_68794 ) ) ( not ( = ?auto_68790 ?auto_68794 ) ) ( CLEAR ?auto_68789 ) ( ON ?auto_68790 ?auto_68791 ) ( CLEAR ?auto_68790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68794 ?auto_68793 ?auto_68792 ?auto_68791 )
      ( MAKE-5PILE ?auto_68788 ?auto_68789 ?auto_68790 ?auto_68791 ?auto_68792 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68795 - BLOCK
      ?auto_68796 - BLOCK
      ?auto_68797 - BLOCK
      ?auto_68798 - BLOCK
      ?auto_68799 - BLOCK
    )
    :vars
    (
      ?auto_68801 - BLOCK
      ?auto_68800 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68795 ) ( not ( = ?auto_68795 ?auto_68796 ) ) ( not ( = ?auto_68795 ?auto_68797 ) ) ( not ( = ?auto_68795 ?auto_68798 ) ) ( not ( = ?auto_68795 ?auto_68799 ) ) ( not ( = ?auto_68796 ?auto_68797 ) ) ( not ( = ?auto_68796 ?auto_68798 ) ) ( not ( = ?auto_68796 ?auto_68799 ) ) ( not ( = ?auto_68797 ?auto_68798 ) ) ( not ( = ?auto_68797 ?auto_68799 ) ) ( not ( = ?auto_68798 ?auto_68799 ) ) ( ON ?auto_68799 ?auto_68801 ) ( not ( = ?auto_68795 ?auto_68801 ) ) ( not ( = ?auto_68796 ?auto_68801 ) ) ( not ( = ?auto_68797 ?auto_68801 ) ) ( not ( = ?auto_68798 ?auto_68801 ) ) ( not ( = ?auto_68799 ?auto_68801 ) ) ( ON ?auto_68798 ?auto_68799 ) ( ON-TABLE ?auto_68800 ) ( ON ?auto_68801 ?auto_68800 ) ( not ( = ?auto_68800 ?auto_68801 ) ) ( not ( = ?auto_68800 ?auto_68799 ) ) ( not ( = ?auto_68800 ?auto_68798 ) ) ( not ( = ?auto_68795 ?auto_68800 ) ) ( not ( = ?auto_68796 ?auto_68800 ) ) ( not ( = ?auto_68797 ?auto_68800 ) ) ( ON ?auto_68797 ?auto_68798 ) ( CLEAR ?auto_68797 ) ( HOLDING ?auto_68796 ) ( CLEAR ?auto_68795 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68795 ?auto_68796 )
      ( MAKE-5PILE ?auto_68795 ?auto_68796 ?auto_68797 ?auto_68798 ?auto_68799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68802 - BLOCK
      ?auto_68803 - BLOCK
      ?auto_68804 - BLOCK
      ?auto_68805 - BLOCK
      ?auto_68806 - BLOCK
    )
    :vars
    (
      ?auto_68807 - BLOCK
      ?auto_68808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68802 ) ( not ( = ?auto_68802 ?auto_68803 ) ) ( not ( = ?auto_68802 ?auto_68804 ) ) ( not ( = ?auto_68802 ?auto_68805 ) ) ( not ( = ?auto_68802 ?auto_68806 ) ) ( not ( = ?auto_68803 ?auto_68804 ) ) ( not ( = ?auto_68803 ?auto_68805 ) ) ( not ( = ?auto_68803 ?auto_68806 ) ) ( not ( = ?auto_68804 ?auto_68805 ) ) ( not ( = ?auto_68804 ?auto_68806 ) ) ( not ( = ?auto_68805 ?auto_68806 ) ) ( ON ?auto_68806 ?auto_68807 ) ( not ( = ?auto_68802 ?auto_68807 ) ) ( not ( = ?auto_68803 ?auto_68807 ) ) ( not ( = ?auto_68804 ?auto_68807 ) ) ( not ( = ?auto_68805 ?auto_68807 ) ) ( not ( = ?auto_68806 ?auto_68807 ) ) ( ON ?auto_68805 ?auto_68806 ) ( ON-TABLE ?auto_68808 ) ( ON ?auto_68807 ?auto_68808 ) ( not ( = ?auto_68808 ?auto_68807 ) ) ( not ( = ?auto_68808 ?auto_68806 ) ) ( not ( = ?auto_68808 ?auto_68805 ) ) ( not ( = ?auto_68802 ?auto_68808 ) ) ( not ( = ?auto_68803 ?auto_68808 ) ) ( not ( = ?auto_68804 ?auto_68808 ) ) ( ON ?auto_68804 ?auto_68805 ) ( CLEAR ?auto_68802 ) ( ON ?auto_68803 ?auto_68804 ) ( CLEAR ?auto_68803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68808 ?auto_68807 ?auto_68806 ?auto_68805 ?auto_68804 )
      ( MAKE-5PILE ?auto_68802 ?auto_68803 ?auto_68804 ?auto_68805 ?auto_68806 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68809 - BLOCK
      ?auto_68810 - BLOCK
      ?auto_68811 - BLOCK
      ?auto_68812 - BLOCK
      ?auto_68813 - BLOCK
    )
    :vars
    (
      ?auto_68814 - BLOCK
      ?auto_68815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68809 ?auto_68810 ) ) ( not ( = ?auto_68809 ?auto_68811 ) ) ( not ( = ?auto_68809 ?auto_68812 ) ) ( not ( = ?auto_68809 ?auto_68813 ) ) ( not ( = ?auto_68810 ?auto_68811 ) ) ( not ( = ?auto_68810 ?auto_68812 ) ) ( not ( = ?auto_68810 ?auto_68813 ) ) ( not ( = ?auto_68811 ?auto_68812 ) ) ( not ( = ?auto_68811 ?auto_68813 ) ) ( not ( = ?auto_68812 ?auto_68813 ) ) ( ON ?auto_68813 ?auto_68814 ) ( not ( = ?auto_68809 ?auto_68814 ) ) ( not ( = ?auto_68810 ?auto_68814 ) ) ( not ( = ?auto_68811 ?auto_68814 ) ) ( not ( = ?auto_68812 ?auto_68814 ) ) ( not ( = ?auto_68813 ?auto_68814 ) ) ( ON ?auto_68812 ?auto_68813 ) ( ON-TABLE ?auto_68815 ) ( ON ?auto_68814 ?auto_68815 ) ( not ( = ?auto_68815 ?auto_68814 ) ) ( not ( = ?auto_68815 ?auto_68813 ) ) ( not ( = ?auto_68815 ?auto_68812 ) ) ( not ( = ?auto_68809 ?auto_68815 ) ) ( not ( = ?auto_68810 ?auto_68815 ) ) ( not ( = ?auto_68811 ?auto_68815 ) ) ( ON ?auto_68811 ?auto_68812 ) ( ON ?auto_68810 ?auto_68811 ) ( CLEAR ?auto_68810 ) ( HOLDING ?auto_68809 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68809 )
      ( MAKE-5PILE ?auto_68809 ?auto_68810 ?auto_68811 ?auto_68812 ?auto_68813 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68816 - BLOCK
      ?auto_68817 - BLOCK
      ?auto_68818 - BLOCK
      ?auto_68819 - BLOCK
      ?auto_68820 - BLOCK
    )
    :vars
    (
      ?auto_68822 - BLOCK
      ?auto_68821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68816 ?auto_68817 ) ) ( not ( = ?auto_68816 ?auto_68818 ) ) ( not ( = ?auto_68816 ?auto_68819 ) ) ( not ( = ?auto_68816 ?auto_68820 ) ) ( not ( = ?auto_68817 ?auto_68818 ) ) ( not ( = ?auto_68817 ?auto_68819 ) ) ( not ( = ?auto_68817 ?auto_68820 ) ) ( not ( = ?auto_68818 ?auto_68819 ) ) ( not ( = ?auto_68818 ?auto_68820 ) ) ( not ( = ?auto_68819 ?auto_68820 ) ) ( ON ?auto_68820 ?auto_68822 ) ( not ( = ?auto_68816 ?auto_68822 ) ) ( not ( = ?auto_68817 ?auto_68822 ) ) ( not ( = ?auto_68818 ?auto_68822 ) ) ( not ( = ?auto_68819 ?auto_68822 ) ) ( not ( = ?auto_68820 ?auto_68822 ) ) ( ON ?auto_68819 ?auto_68820 ) ( ON-TABLE ?auto_68821 ) ( ON ?auto_68822 ?auto_68821 ) ( not ( = ?auto_68821 ?auto_68822 ) ) ( not ( = ?auto_68821 ?auto_68820 ) ) ( not ( = ?auto_68821 ?auto_68819 ) ) ( not ( = ?auto_68816 ?auto_68821 ) ) ( not ( = ?auto_68817 ?auto_68821 ) ) ( not ( = ?auto_68818 ?auto_68821 ) ) ( ON ?auto_68818 ?auto_68819 ) ( ON ?auto_68817 ?auto_68818 ) ( ON ?auto_68816 ?auto_68817 ) ( CLEAR ?auto_68816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68821 ?auto_68822 ?auto_68820 ?auto_68819 ?auto_68818 ?auto_68817 )
      ( MAKE-5PILE ?auto_68816 ?auto_68817 ?auto_68818 ?auto_68819 ?auto_68820 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68824 - BLOCK
    )
    :vars
    (
      ?auto_68825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68825 ?auto_68824 ) ( CLEAR ?auto_68825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68824 ) ( not ( = ?auto_68824 ?auto_68825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68825 ?auto_68824 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68826 - BLOCK
    )
    :vars
    (
      ?auto_68827 - BLOCK
      ?auto_68828 - BLOCK
      ?auto_68829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68827 ?auto_68826 ) ( CLEAR ?auto_68827 ) ( ON-TABLE ?auto_68826 ) ( not ( = ?auto_68826 ?auto_68827 ) ) ( HOLDING ?auto_68828 ) ( CLEAR ?auto_68829 ) ( not ( = ?auto_68826 ?auto_68828 ) ) ( not ( = ?auto_68826 ?auto_68829 ) ) ( not ( = ?auto_68827 ?auto_68828 ) ) ( not ( = ?auto_68827 ?auto_68829 ) ) ( not ( = ?auto_68828 ?auto_68829 ) ) )
    :subtasks
    ( ( !STACK ?auto_68828 ?auto_68829 )
      ( MAKE-1PILE ?auto_68826 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68830 - BLOCK
    )
    :vars
    (
      ?auto_68831 - BLOCK
      ?auto_68832 - BLOCK
      ?auto_68833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68831 ?auto_68830 ) ( ON-TABLE ?auto_68830 ) ( not ( = ?auto_68830 ?auto_68831 ) ) ( CLEAR ?auto_68832 ) ( not ( = ?auto_68830 ?auto_68833 ) ) ( not ( = ?auto_68830 ?auto_68832 ) ) ( not ( = ?auto_68831 ?auto_68833 ) ) ( not ( = ?auto_68831 ?auto_68832 ) ) ( not ( = ?auto_68833 ?auto_68832 ) ) ( ON ?auto_68833 ?auto_68831 ) ( CLEAR ?auto_68833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68830 ?auto_68831 )
      ( MAKE-1PILE ?auto_68830 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68834 - BLOCK
    )
    :vars
    (
      ?auto_68837 - BLOCK
      ?auto_68836 - BLOCK
      ?auto_68835 - BLOCK
      ?auto_68839 - BLOCK
      ?auto_68840 - BLOCK
      ?auto_68838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68837 ?auto_68834 ) ( ON-TABLE ?auto_68834 ) ( not ( = ?auto_68834 ?auto_68837 ) ) ( not ( = ?auto_68834 ?auto_68836 ) ) ( not ( = ?auto_68834 ?auto_68835 ) ) ( not ( = ?auto_68837 ?auto_68836 ) ) ( not ( = ?auto_68837 ?auto_68835 ) ) ( not ( = ?auto_68836 ?auto_68835 ) ) ( ON ?auto_68836 ?auto_68837 ) ( CLEAR ?auto_68836 ) ( HOLDING ?auto_68835 ) ( CLEAR ?auto_68839 ) ( ON-TABLE ?auto_68840 ) ( ON ?auto_68838 ?auto_68840 ) ( ON ?auto_68839 ?auto_68838 ) ( not ( = ?auto_68840 ?auto_68838 ) ) ( not ( = ?auto_68840 ?auto_68839 ) ) ( not ( = ?auto_68840 ?auto_68835 ) ) ( not ( = ?auto_68838 ?auto_68839 ) ) ( not ( = ?auto_68838 ?auto_68835 ) ) ( not ( = ?auto_68839 ?auto_68835 ) ) ( not ( = ?auto_68834 ?auto_68839 ) ) ( not ( = ?auto_68834 ?auto_68840 ) ) ( not ( = ?auto_68834 ?auto_68838 ) ) ( not ( = ?auto_68837 ?auto_68839 ) ) ( not ( = ?auto_68837 ?auto_68840 ) ) ( not ( = ?auto_68837 ?auto_68838 ) ) ( not ( = ?auto_68836 ?auto_68839 ) ) ( not ( = ?auto_68836 ?auto_68840 ) ) ( not ( = ?auto_68836 ?auto_68838 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68840 ?auto_68838 ?auto_68839 ?auto_68835 )
      ( MAKE-1PILE ?auto_68834 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68841 - BLOCK
    )
    :vars
    (
      ?auto_68845 - BLOCK
      ?auto_68843 - BLOCK
      ?auto_68847 - BLOCK
      ?auto_68844 - BLOCK
      ?auto_68846 - BLOCK
      ?auto_68842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68845 ?auto_68841 ) ( ON-TABLE ?auto_68841 ) ( not ( = ?auto_68841 ?auto_68845 ) ) ( not ( = ?auto_68841 ?auto_68843 ) ) ( not ( = ?auto_68841 ?auto_68847 ) ) ( not ( = ?auto_68845 ?auto_68843 ) ) ( not ( = ?auto_68845 ?auto_68847 ) ) ( not ( = ?auto_68843 ?auto_68847 ) ) ( ON ?auto_68843 ?auto_68845 ) ( CLEAR ?auto_68844 ) ( ON-TABLE ?auto_68846 ) ( ON ?auto_68842 ?auto_68846 ) ( ON ?auto_68844 ?auto_68842 ) ( not ( = ?auto_68846 ?auto_68842 ) ) ( not ( = ?auto_68846 ?auto_68844 ) ) ( not ( = ?auto_68846 ?auto_68847 ) ) ( not ( = ?auto_68842 ?auto_68844 ) ) ( not ( = ?auto_68842 ?auto_68847 ) ) ( not ( = ?auto_68844 ?auto_68847 ) ) ( not ( = ?auto_68841 ?auto_68844 ) ) ( not ( = ?auto_68841 ?auto_68846 ) ) ( not ( = ?auto_68841 ?auto_68842 ) ) ( not ( = ?auto_68845 ?auto_68844 ) ) ( not ( = ?auto_68845 ?auto_68846 ) ) ( not ( = ?auto_68845 ?auto_68842 ) ) ( not ( = ?auto_68843 ?auto_68844 ) ) ( not ( = ?auto_68843 ?auto_68846 ) ) ( not ( = ?auto_68843 ?auto_68842 ) ) ( ON ?auto_68847 ?auto_68843 ) ( CLEAR ?auto_68847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68841 ?auto_68845 ?auto_68843 )
      ( MAKE-1PILE ?auto_68841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68848 - BLOCK
    )
    :vars
    (
      ?auto_68851 - BLOCK
      ?auto_68849 - BLOCK
      ?auto_68853 - BLOCK
      ?auto_68850 - BLOCK
      ?auto_68854 - BLOCK
      ?auto_68852 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68851 ?auto_68848 ) ( ON-TABLE ?auto_68848 ) ( not ( = ?auto_68848 ?auto_68851 ) ) ( not ( = ?auto_68848 ?auto_68849 ) ) ( not ( = ?auto_68848 ?auto_68853 ) ) ( not ( = ?auto_68851 ?auto_68849 ) ) ( not ( = ?auto_68851 ?auto_68853 ) ) ( not ( = ?auto_68849 ?auto_68853 ) ) ( ON ?auto_68849 ?auto_68851 ) ( ON-TABLE ?auto_68850 ) ( ON ?auto_68854 ?auto_68850 ) ( not ( = ?auto_68850 ?auto_68854 ) ) ( not ( = ?auto_68850 ?auto_68852 ) ) ( not ( = ?auto_68850 ?auto_68853 ) ) ( not ( = ?auto_68854 ?auto_68852 ) ) ( not ( = ?auto_68854 ?auto_68853 ) ) ( not ( = ?auto_68852 ?auto_68853 ) ) ( not ( = ?auto_68848 ?auto_68852 ) ) ( not ( = ?auto_68848 ?auto_68850 ) ) ( not ( = ?auto_68848 ?auto_68854 ) ) ( not ( = ?auto_68851 ?auto_68852 ) ) ( not ( = ?auto_68851 ?auto_68850 ) ) ( not ( = ?auto_68851 ?auto_68854 ) ) ( not ( = ?auto_68849 ?auto_68852 ) ) ( not ( = ?auto_68849 ?auto_68850 ) ) ( not ( = ?auto_68849 ?auto_68854 ) ) ( ON ?auto_68853 ?auto_68849 ) ( CLEAR ?auto_68853 ) ( HOLDING ?auto_68852 ) ( CLEAR ?auto_68854 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68850 ?auto_68854 ?auto_68852 )
      ( MAKE-1PILE ?auto_68848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68855 - BLOCK
    )
    :vars
    (
      ?auto_68861 - BLOCK
      ?auto_68856 - BLOCK
      ?auto_68860 - BLOCK
      ?auto_68859 - BLOCK
      ?auto_68858 - BLOCK
      ?auto_68857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68861 ?auto_68855 ) ( ON-TABLE ?auto_68855 ) ( not ( = ?auto_68855 ?auto_68861 ) ) ( not ( = ?auto_68855 ?auto_68856 ) ) ( not ( = ?auto_68855 ?auto_68860 ) ) ( not ( = ?auto_68861 ?auto_68856 ) ) ( not ( = ?auto_68861 ?auto_68860 ) ) ( not ( = ?auto_68856 ?auto_68860 ) ) ( ON ?auto_68856 ?auto_68861 ) ( ON-TABLE ?auto_68859 ) ( ON ?auto_68858 ?auto_68859 ) ( not ( = ?auto_68859 ?auto_68858 ) ) ( not ( = ?auto_68859 ?auto_68857 ) ) ( not ( = ?auto_68859 ?auto_68860 ) ) ( not ( = ?auto_68858 ?auto_68857 ) ) ( not ( = ?auto_68858 ?auto_68860 ) ) ( not ( = ?auto_68857 ?auto_68860 ) ) ( not ( = ?auto_68855 ?auto_68857 ) ) ( not ( = ?auto_68855 ?auto_68859 ) ) ( not ( = ?auto_68855 ?auto_68858 ) ) ( not ( = ?auto_68861 ?auto_68857 ) ) ( not ( = ?auto_68861 ?auto_68859 ) ) ( not ( = ?auto_68861 ?auto_68858 ) ) ( not ( = ?auto_68856 ?auto_68857 ) ) ( not ( = ?auto_68856 ?auto_68859 ) ) ( not ( = ?auto_68856 ?auto_68858 ) ) ( ON ?auto_68860 ?auto_68856 ) ( CLEAR ?auto_68858 ) ( ON ?auto_68857 ?auto_68860 ) ( CLEAR ?auto_68857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68855 ?auto_68861 ?auto_68856 ?auto_68860 )
      ( MAKE-1PILE ?auto_68855 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68862 - BLOCK
    )
    :vars
    (
      ?auto_68867 - BLOCK
      ?auto_68865 - BLOCK
      ?auto_68864 - BLOCK
      ?auto_68863 - BLOCK
      ?auto_68868 - BLOCK
      ?auto_68866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68867 ?auto_68862 ) ( ON-TABLE ?auto_68862 ) ( not ( = ?auto_68862 ?auto_68867 ) ) ( not ( = ?auto_68862 ?auto_68865 ) ) ( not ( = ?auto_68862 ?auto_68864 ) ) ( not ( = ?auto_68867 ?auto_68865 ) ) ( not ( = ?auto_68867 ?auto_68864 ) ) ( not ( = ?auto_68865 ?auto_68864 ) ) ( ON ?auto_68865 ?auto_68867 ) ( ON-TABLE ?auto_68863 ) ( not ( = ?auto_68863 ?auto_68868 ) ) ( not ( = ?auto_68863 ?auto_68866 ) ) ( not ( = ?auto_68863 ?auto_68864 ) ) ( not ( = ?auto_68868 ?auto_68866 ) ) ( not ( = ?auto_68868 ?auto_68864 ) ) ( not ( = ?auto_68866 ?auto_68864 ) ) ( not ( = ?auto_68862 ?auto_68866 ) ) ( not ( = ?auto_68862 ?auto_68863 ) ) ( not ( = ?auto_68862 ?auto_68868 ) ) ( not ( = ?auto_68867 ?auto_68866 ) ) ( not ( = ?auto_68867 ?auto_68863 ) ) ( not ( = ?auto_68867 ?auto_68868 ) ) ( not ( = ?auto_68865 ?auto_68866 ) ) ( not ( = ?auto_68865 ?auto_68863 ) ) ( not ( = ?auto_68865 ?auto_68868 ) ) ( ON ?auto_68864 ?auto_68865 ) ( ON ?auto_68866 ?auto_68864 ) ( CLEAR ?auto_68866 ) ( HOLDING ?auto_68868 ) ( CLEAR ?auto_68863 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68863 ?auto_68868 )
      ( MAKE-1PILE ?auto_68862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68869 - BLOCK
    )
    :vars
    (
      ?auto_68873 - BLOCK
      ?auto_68871 - BLOCK
      ?auto_68872 - BLOCK
      ?auto_68875 - BLOCK
      ?auto_68870 - BLOCK
      ?auto_68874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68873 ?auto_68869 ) ( ON-TABLE ?auto_68869 ) ( not ( = ?auto_68869 ?auto_68873 ) ) ( not ( = ?auto_68869 ?auto_68871 ) ) ( not ( = ?auto_68869 ?auto_68872 ) ) ( not ( = ?auto_68873 ?auto_68871 ) ) ( not ( = ?auto_68873 ?auto_68872 ) ) ( not ( = ?auto_68871 ?auto_68872 ) ) ( ON ?auto_68871 ?auto_68873 ) ( ON-TABLE ?auto_68875 ) ( not ( = ?auto_68875 ?auto_68870 ) ) ( not ( = ?auto_68875 ?auto_68874 ) ) ( not ( = ?auto_68875 ?auto_68872 ) ) ( not ( = ?auto_68870 ?auto_68874 ) ) ( not ( = ?auto_68870 ?auto_68872 ) ) ( not ( = ?auto_68874 ?auto_68872 ) ) ( not ( = ?auto_68869 ?auto_68874 ) ) ( not ( = ?auto_68869 ?auto_68875 ) ) ( not ( = ?auto_68869 ?auto_68870 ) ) ( not ( = ?auto_68873 ?auto_68874 ) ) ( not ( = ?auto_68873 ?auto_68875 ) ) ( not ( = ?auto_68873 ?auto_68870 ) ) ( not ( = ?auto_68871 ?auto_68874 ) ) ( not ( = ?auto_68871 ?auto_68875 ) ) ( not ( = ?auto_68871 ?auto_68870 ) ) ( ON ?auto_68872 ?auto_68871 ) ( ON ?auto_68874 ?auto_68872 ) ( CLEAR ?auto_68875 ) ( ON ?auto_68870 ?auto_68874 ) ( CLEAR ?auto_68870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68869 ?auto_68873 ?auto_68871 ?auto_68872 ?auto_68874 )
      ( MAKE-1PILE ?auto_68869 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68876 - BLOCK
    )
    :vars
    (
      ?auto_68880 - BLOCK
      ?auto_68877 - BLOCK
      ?auto_68881 - BLOCK
      ?auto_68878 - BLOCK
      ?auto_68882 - BLOCK
      ?auto_68879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68880 ?auto_68876 ) ( ON-TABLE ?auto_68876 ) ( not ( = ?auto_68876 ?auto_68880 ) ) ( not ( = ?auto_68876 ?auto_68877 ) ) ( not ( = ?auto_68876 ?auto_68881 ) ) ( not ( = ?auto_68880 ?auto_68877 ) ) ( not ( = ?auto_68880 ?auto_68881 ) ) ( not ( = ?auto_68877 ?auto_68881 ) ) ( ON ?auto_68877 ?auto_68880 ) ( not ( = ?auto_68878 ?auto_68882 ) ) ( not ( = ?auto_68878 ?auto_68879 ) ) ( not ( = ?auto_68878 ?auto_68881 ) ) ( not ( = ?auto_68882 ?auto_68879 ) ) ( not ( = ?auto_68882 ?auto_68881 ) ) ( not ( = ?auto_68879 ?auto_68881 ) ) ( not ( = ?auto_68876 ?auto_68879 ) ) ( not ( = ?auto_68876 ?auto_68878 ) ) ( not ( = ?auto_68876 ?auto_68882 ) ) ( not ( = ?auto_68880 ?auto_68879 ) ) ( not ( = ?auto_68880 ?auto_68878 ) ) ( not ( = ?auto_68880 ?auto_68882 ) ) ( not ( = ?auto_68877 ?auto_68879 ) ) ( not ( = ?auto_68877 ?auto_68878 ) ) ( not ( = ?auto_68877 ?auto_68882 ) ) ( ON ?auto_68881 ?auto_68877 ) ( ON ?auto_68879 ?auto_68881 ) ( ON ?auto_68882 ?auto_68879 ) ( CLEAR ?auto_68882 ) ( HOLDING ?auto_68878 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68878 )
      ( MAKE-1PILE ?auto_68876 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_68883 - BLOCK
    )
    :vars
    (
      ?auto_68888 - BLOCK
      ?auto_68889 - BLOCK
      ?auto_68884 - BLOCK
      ?auto_68885 - BLOCK
      ?auto_68887 - BLOCK
      ?auto_68886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68888 ?auto_68883 ) ( ON-TABLE ?auto_68883 ) ( not ( = ?auto_68883 ?auto_68888 ) ) ( not ( = ?auto_68883 ?auto_68889 ) ) ( not ( = ?auto_68883 ?auto_68884 ) ) ( not ( = ?auto_68888 ?auto_68889 ) ) ( not ( = ?auto_68888 ?auto_68884 ) ) ( not ( = ?auto_68889 ?auto_68884 ) ) ( ON ?auto_68889 ?auto_68888 ) ( not ( = ?auto_68885 ?auto_68887 ) ) ( not ( = ?auto_68885 ?auto_68886 ) ) ( not ( = ?auto_68885 ?auto_68884 ) ) ( not ( = ?auto_68887 ?auto_68886 ) ) ( not ( = ?auto_68887 ?auto_68884 ) ) ( not ( = ?auto_68886 ?auto_68884 ) ) ( not ( = ?auto_68883 ?auto_68886 ) ) ( not ( = ?auto_68883 ?auto_68885 ) ) ( not ( = ?auto_68883 ?auto_68887 ) ) ( not ( = ?auto_68888 ?auto_68886 ) ) ( not ( = ?auto_68888 ?auto_68885 ) ) ( not ( = ?auto_68888 ?auto_68887 ) ) ( not ( = ?auto_68889 ?auto_68886 ) ) ( not ( = ?auto_68889 ?auto_68885 ) ) ( not ( = ?auto_68889 ?auto_68887 ) ) ( ON ?auto_68884 ?auto_68889 ) ( ON ?auto_68886 ?auto_68884 ) ( ON ?auto_68887 ?auto_68886 ) ( ON ?auto_68885 ?auto_68887 ) ( CLEAR ?auto_68885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68883 ?auto_68888 ?auto_68889 ?auto_68884 ?auto_68886 ?auto_68887 )
      ( MAKE-1PILE ?auto_68883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68896 - BLOCK
      ?auto_68897 - BLOCK
      ?auto_68898 - BLOCK
      ?auto_68899 - BLOCK
      ?auto_68900 - BLOCK
      ?auto_68901 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_68901 ) ( CLEAR ?auto_68900 ) ( ON-TABLE ?auto_68896 ) ( ON ?auto_68897 ?auto_68896 ) ( ON ?auto_68898 ?auto_68897 ) ( ON ?auto_68899 ?auto_68898 ) ( ON ?auto_68900 ?auto_68899 ) ( not ( = ?auto_68896 ?auto_68897 ) ) ( not ( = ?auto_68896 ?auto_68898 ) ) ( not ( = ?auto_68896 ?auto_68899 ) ) ( not ( = ?auto_68896 ?auto_68900 ) ) ( not ( = ?auto_68896 ?auto_68901 ) ) ( not ( = ?auto_68897 ?auto_68898 ) ) ( not ( = ?auto_68897 ?auto_68899 ) ) ( not ( = ?auto_68897 ?auto_68900 ) ) ( not ( = ?auto_68897 ?auto_68901 ) ) ( not ( = ?auto_68898 ?auto_68899 ) ) ( not ( = ?auto_68898 ?auto_68900 ) ) ( not ( = ?auto_68898 ?auto_68901 ) ) ( not ( = ?auto_68899 ?auto_68900 ) ) ( not ( = ?auto_68899 ?auto_68901 ) ) ( not ( = ?auto_68900 ?auto_68901 ) ) )
    :subtasks
    ( ( !STACK ?auto_68901 ?auto_68900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68902 - BLOCK
      ?auto_68903 - BLOCK
      ?auto_68904 - BLOCK
      ?auto_68905 - BLOCK
      ?auto_68906 - BLOCK
      ?auto_68907 - BLOCK
    )
    :vars
    (
      ?auto_68908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_68906 ) ( ON-TABLE ?auto_68902 ) ( ON ?auto_68903 ?auto_68902 ) ( ON ?auto_68904 ?auto_68903 ) ( ON ?auto_68905 ?auto_68904 ) ( ON ?auto_68906 ?auto_68905 ) ( not ( = ?auto_68902 ?auto_68903 ) ) ( not ( = ?auto_68902 ?auto_68904 ) ) ( not ( = ?auto_68902 ?auto_68905 ) ) ( not ( = ?auto_68902 ?auto_68906 ) ) ( not ( = ?auto_68902 ?auto_68907 ) ) ( not ( = ?auto_68903 ?auto_68904 ) ) ( not ( = ?auto_68903 ?auto_68905 ) ) ( not ( = ?auto_68903 ?auto_68906 ) ) ( not ( = ?auto_68903 ?auto_68907 ) ) ( not ( = ?auto_68904 ?auto_68905 ) ) ( not ( = ?auto_68904 ?auto_68906 ) ) ( not ( = ?auto_68904 ?auto_68907 ) ) ( not ( = ?auto_68905 ?auto_68906 ) ) ( not ( = ?auto_68905 ?auto_68907 ) ) ( not ( = ?auto_68906 ?auto_68907 ) ) ( ON ?auto_68907 ?auto_68908 ) ( CLEAR ?auto_68907 ) ( HAND-EMPTY ) ( not ( = ?auto_68902 ?auto_68908 ) ) ( not ( = ?auto_68903 ?auto_68908 ) ) ( not ( = ?auto_68904 ?auto_68908 ) ) ( not ( = ?auto_68905 ?auto_68908 ) ) ( not ( = ?auto_68906 ?auto_68908 ) ) ( not ( = ?auto_68907 ?auto_68908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68907 ?auto_68908 )
      ( MAKE-6PILE ?auto_68902 ?auto_68903 ?auto_68904 ?auto_68905 ?auto_68906 ?auto_68907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68909 - BLOCK
      ?auto_68910 - BLOCK
      ?auto_68911 - BLOCK
      ?auto_68912 - BLOCK
      ?auto_68913 - BLOCK
      ?auto_68914 - BLOCK
    )
    :vars
    (
      ?auto_68915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68909 ) ( ON ?auto_68910 ?auto_68909 ) ( ON ?auto_68911 ?auto_68910 ) ( ON ?auto_68912 ?auto_68911 ) ( not ( = ?auto_68909 ?auto_68910 ) ) ( not ( = ?auto_68909 ?auto_68911 ) ) ( not ( = ?auto_68909 ?auto_68912 ) ) ( not ( = ?auto_68909 ?auto_68913 ) ) ( not ( = ?auto_68909 ?auto_68914 ) ) ( not ( = ?auto_68910 ?auto_68911 ) ) ( not ( = ?auto_68910 ?auto_68912 ) ) ( not ( = ?auto_68910 ?auto_68913 ) ) ( not ( = ?auto_68910 ?auto_68914 ) ) ( not ( = ?auto_68911 ?auto_68912 ) ) ( not ( = ?auto_68911 ?auto_68913 ) ) ( not ( = ?auto_68911 ?auto_68914 ) ) ( not ( = ?auto_68912 ?auto_68913 ) ) ( not ( = ?auto_68912 ?auto_68914 ) ) ( not ( = ?auto_68913 ?auto_68914 ) ) ( ON ?auto_68914 ?auto_68915 ) ( CLEAR ?auto_68914 ) ( not ( = ?auto_68909 ?auto_68915 ) ) ( not ( = ?auto_68910 ?auto_68915 ) ) ( not ( = ?auto_68911 ?auto_68915 ) ) ( not ( = ?auto_68912 ?auto_68915 ) ) ( not ( = ?auto_68913 ?auto_68915 ) ) ( not ( = ?auto_68914 ?auto_68915 ) ) ( HOLDING ?auto_68913 ) ( CLEAR ?auto_68912 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68909 ?auto_68910 ?auto_68911 ?auto_68912 ?auto_68913 )
      ( MAKE-6PILE ?auto_68909 ?auto_68910 ?auto_68911 ?auto_68912 ?auto_68913 ?auto_68914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68916 - BLOCK
      ?auto_68917 - BLOCK
      ?auto_68918 - BLOCK
      ?auto_68919 - BLOCK
      ?auto_68920 - BLOCK
      ?auto_68921 - BLOCK
    )
    :vars
    (
      ?auto_68922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68916 ) ( ON ?auto_68917 ?auto_68916 ) ( ON ?auto_68918 ?auto_68917 ) ( ON ?auto_68919 ?auto_68918 ) ( not ( = ?auto_68916 ?auto_68917 ) ) ( not ( = ?auto_68916 ?auto_68918 ) ) ( not ( = ?auto_68916 ?auto_68919 ) ) ( not ( = ?auto_68916 ?auto_68920 ) ) ( not ( = ?auto_68916 ?auto_68921 ) ) ( not ( = ?auto_68917 ?auto_68918 ) ) ( not ( = ?auto_68917 ?auto_68919 ) ) ( not ( = ?auto_68917 ?auto_68920 ) ) ( not ( = ?auto_68917 ?auto_68921 ) ) ( not ( = ?auto_68918 ?auto_68919 ) ) ( not ( = ?auto_68918 ?auto_68920 ) ) ( not ( = ?auto_68918 ?auto_68921 ) ) ( not ( = ?auto_68919 ?auto_68920 ) ) ( not ( = ?auto_68919 ?auto_68921 ) ) ( not ( = ?auto_68920 ?auto_68921 ) ) ( ON ?auto_68921 ?auto_68922 ) ( not ( = ?auto_68916 ?auto_68922 ) ) ( not ( = ?auto_68917 ?auto_68922 ) ) ( not ( = ?auto_68918 ?auto_68922 ) ) ( not ( = ?auto_68919 ?auto_68922 ) ) ( not ( = ?auto_68920 ?auto_68922 ) ) ( not ( = ?auto_68921 ?auto_68922 ) ) ( CLEAR ?auto_68919 ) ( ON ?auto_68920 ?auto_68921 ) ( CLEAR ?auto_68920 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68922 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68922 ?auto_68921 )
      ( MAKE-6PILE ?auto_68916 ?auto_68917 ?auto_68918 ?auto_68919 ?auto_68920 ?auto_68921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68923 - BLOCK
      ?auto_68924 - BLOCK
      ?auto_68925 - BLOCK
      ?auto_68926 - BLOCK
      ?auto_68927 - BLOCK
      ?auto_68928 - BLOCK
    )
    :vars
    (
      ?auto_68929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68923 ) ( ON ?auto_68924 ?auto_68923 ) ( ON ?auto_68925 ?auto_68924 ) ( not ( = ?auto_68923 ?auto_68924 ) ) ( not ( = ?auto_68923 ?auto_68925 ) ) ( not ( = ?auto_68923 ?auto_68926 ) ) ( not ( = ?auto_68923 ?auto_68927 ) ) ( not ( = ?auto_68923 ?auto_68928 ) ) ( not ( = ?auto_68924 ?auto_68925 ) ) ( not ( = ?auto_68924 ?auto_68926 ) ) ( not ( = ?auto_68924 ?auto_68927 ) ) ( not ( = ?auto_68924 ?auto_68928 ) ) ( not ( = ?auto_68925 ?auto_68926 ) ) ( not ( = ?auto_68925 ?auto_68927 ) ) ( not ( = ?auto_68925 ?auto_68928 ) ) ( not ( = ?auto_68926 ?auto_68927 ) ) ( not ( = ?auto_68926 ?auto_68928 ) ) ( not ( = ?auto_68927 ?auto_68928 ) ) ( ON ?auto_68928 ?auto_68929 ) ( not ( = ?auto_68923 ?auto_68929 ) ) ( not ( = ?auto_68924 ?auto_68929 ) ) ( not ( = ?auto_68925 ?auto_68929 ) ) ( not ( = ?auto_68926 ?auto_68929 ) ) ( not ( = ?auto_68927 ?auto_68929 ) ) ( not ( = ?auto_68928 ?auto_68929 ) ) ( ON ?auto_68927 ?auto_68928 ) ( CLEAR ?auto_68927 ) ( ON-TABLE ?auto_68929 ) ( HOLDING ?auto_68926 ) ( CLEAR ?auto_68925 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68923 ?auto_68924 ?auto_68925 ?auto_68926 )
      ( MAKE-6PILE ?auto_68923 ?auto_68924 ?auto_68925 ?auto_68926 ?auto_68927 ?auto_68928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68930 - BLOCK
      ?auto_68931 - BLOCK
      ?auto_68932 - BLOCK
      ?auto_68933 - BLOCK
      ?auto_68934 - BLOCK
      ?auto_68935 - BLOCK
    )
    :vars
    (
      ?auto_68936 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68930 ) ( ON ?auto_68931 ?auto_68930 ) ( ON ?auto_68932 ?auto_68931 ) ( not ( = ?auto_68930 ?auto_68931 ) ) ( not ( = ?auto_68930 ?auto_68932 ) ) ( not ( = ?auto_68930 ?auto_68933 ) ) ( not ( = ?auto_68930 ?auto_68934 ) ) ( not ( = ?auto_68930 ?auto_68935 ) ) ( not ( = ?auto_68931 ?auto_68932 ) ) ( not ( = ?auto_68931 ?auto_68933 ) ) ( not ( = ?auto_68931 ?auto_68934 ) ) ( not ( = ?auto_68931 ?auto_68935 ) ) ( not ( = ?auto_68932 ?auto_68933 ) ) ( not ( = ?auto_68932 ?auto_68934 ) ) ( not ( = ?auto_68932 ?auto_68935 ) ) ( not ( = ?auto_68933 ?auto_68934 ) ) ( not ( = ?auto_68933 ?auto_68935 ) ) ( not ( = ?auto_68934 ?auto_68935 ) ) ( ON ?auto_68935 ?auto_68936 ) ( not ( = ?auto_68930 ?auto_68936 ) ) ( not ( = ?auto_68931 ?auto_68936 ) ) ( not ( = ?auto_68932 ?auto_68936 ) ) ( not ( = ?auto_68933 ?auto_68936 ) ) ( not ( = ?auto_68934 ?auto_68936 ) ) ( not ( = ?auto_68935 ?auto_68936 ) ) ( ON ?auto_68934 ?auto_68935 ) ( ON-TABLE ?auto_68936 ) ( CLEAR ?auto_68932 ) ( ON ?auto_68933 ?auto_68934 ) ( CLEAR ?auto_68933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68936 ?auto_68935 ?auto_68934 )
      ( MAKE-6PILE ?auto_68930 ?auto_68931 ?auto_68932 ?auto_68933 ?auto_68934 ?auto_68935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68937 - BLOCK
      ?auto_68938 - BLOCK
      ?auto_68939 - BLOCK
      ?auto_68940 - BLOCK
      ?auto_68941 - BLOCK
      ?auto_68942 - BLOCK
    )
    :vars
    (
      ?auto_68943 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68937 ) ( ON ?auto_68938 ?auto_68937 ) ( not ( = ?auto_68937 ?auto_68938 ) ) ( not ( = ?auto_68937 ?auto_68939 ) ) ( not ( = ?auto_68937 ?auto_68940 ) ) ( not ( = ?auto_68937 ?auto_68941 ) ) ( not ( = ?auto_68937 ?auto_68942 ) ) ( not ( = ?auto_68938 ?auto_68939 ) ) ( not ( = ?auto_68938 ?auto_68940 ) ) ( not ( = ?auto_68938 ?auto_68941 ) ) ( not ( = ?auto_68938 ?auto_68942 ) ) ( not ( = ?auto_68939 ?auto_68940 ) ) ( not ( = ?auto_68939 ?auto_68941 ) ) ( not ( = ?auto_68939 ?auto_68942 ) ) ( not ( = ?auto_68940 ?auto_68941 ) ) ( not ( = ?auto_68940 ?auto_68942 ) ) ( not ( = ?auto_68941 ?auto_68942 ) ) ( ON ?auto_68942 ?auto_68943 ) ( not ( = ?auto_68937 ?auto_68943 ) ) ( not ( = ?auto_68938 ?auto_68943 ) ) ( not ( = ?auto_68939 ?auto_68943 ) ) ( not ( = ?auto_68940 ?auto_68943 ) ) ( not ( = ?auto_68941 ?auto_68943 ) ) ( not ( = ?auto_68942 ?auto_68943 ) ) ( ON ?auto_68941 ?auto_68942 ) ( ON-TABLE ?auto_68943 ) ( ON ?auto_68940 ?auto_68941 ) ( CLEAR ?auto_68940 ) ( HOLDING ?auto_68939 ) ( CLEAR ?auto_68938 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_68937 ?auto_68938 ?auto_68939 )
      ( MAKE-6PILE ?auto_68937 ?auto_68938 ?auto_68939 ?auto_68940 ?auto_68941 ?auto_68942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68944 - BLOCK
      ?auto_68945 - BLOCK
      ?auto_68946 - BLOCK
      ?auto_68947 - BLOCK
      ?auto_68948 - BLOCK
      ?auto_68949 - BLOCK
    )
    :vars
    (
      ?auto_68950 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68944 ) ( ON ?auto_68945 ?auto_68944 ) ( not ( = ?auto_68944 ?auto_68945 ) ) ( not ( = ?auto_68944 ?auto_68946 ) ) ( not ( = ?auto_68944 ?auto_68947 ) ) ( not ( = ?auto_68944 ?auto_68948 ) ) ( not ( = ?auto_68944 ?auto_68949 ) ) ( not ( = ?auto_68945 ?auto_68946 ) ) ( not ( = ?auto_68945 ?auto_68947 ) ) ( not ( = ?auto_68945 ?auto_68948 ) ) ( not ( = ?auto_68945 ?auto_68949 ) ) ( not ( = ?auto_68946 ?auto_68947 ) ) ( not ( = ?auto_68946 ?auto_68948 ) ) ( not ( = ?auto_68946 ?auto_68949 ) ) ( not ( = ?auto_68947 ?auto_68948 ) ) ( not ( = ?auto_68947 ?auto_68949 ) ) ( not ( = ?auto_68948 ?auto_68949 ) ) ( ON ?auto_68949 ?auto_68950 ) ( not ( = ?auto_68944 ?auto_68950 ) ) ( not ( = ?auto_68945 ?auto_68950 ) ) ( not ( = ?auto_68946 ?auto_68950 ) ) ( not ( = ?auto_68947 ?auto_68950 ) ) ( not ( = ?auto_68948 ?auto_68950 ) ) ( not ( = ?auto_68949 ?auto_68950 ) ) ( ON ?auto_68948 ?auto_68949 ) ( ON-TABLE ?auto_68950 ) ( ON ?auto_68947 ?auto_68948 ) ( CLEAR ?auto_68945 ) ( ON ?auto_68946 ?auto_68947 ) ( CLEAR ?auto_68946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_68950 ?auto_68949 ?auto_68948 ?auto_68947 )
      ( MAKE-6PILE ?auto_68944 ?auto_68945 ?auto_68946 ?auto_68947 ?auto_68948 ?auto_68949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68951 - BLOCK
      ?auto_68952 - BLOCK
      ?auto_68953 - BLOCK
      ?auto_68954 - BLOCK
      ?auto_68955 - BLOCK
      ?auto_68956 - BLOCK
    )
    :vars
    (
      ?auto_68957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68951 ) ( not ( = ?auto_68951 ?auto_68952 ) ) ( not ( = ?auto_68951 ?auto_68953 ) ) ( not ( = ?auto_68951 ?auto_68954 ) ) ( not ( = ?auto_68951 ?auto_68955 ) ) ( not ( = ?auto_68951 ?auto_68956 ) ) ( not ( = ?auto_68952 ?auto_68953 ) ) ( not ( = ?auto_68952 ?auto_68954 ) ) ( not ( = ?auto_68952 ?auto_68955 ) ) ( not ( = ?auto_68952 ?auto_68956 ) ) ( not ( = ?auto_68953 ?auto_68954 ) ) ( not ( = ?auto_68953 ?auto_68955 ) ) ( not ( = ?auto_68953 ?auto_68956 ) ) ( not ( = ?auto_68954 ?auto_68955 ) ) ( not ( = ?auto_68954 ?auto_68956 ) ) ( not ( = ?auto_68955 ?auto_68956 ) ) ( ON ?auto_68956 ?auto_68957 ) ( not ( = ?auto_68951 ?auto_68957 ) ) ( not ( = ?auto_68952 ?auto_68957 ) ) ( not ( = ?auto_68953 ?auto_68957 ) ) ( not ( = ?auto_68954 ?auto_68957 ) ) ( not ( = ?auto_68955 ?auto_68957 ) ) ( not ( = ?auto_68956 ?auto_68957 ) ) ( ON ?auto_68955 ?auto_68956 ) ( ON-TABLE ?auto_68957 ) ( ON ?auto_68954 ?auto_68955 ) ( ON ?auto_68953 ?auto_68954 ) ( CLEAR ?auto_68953 ) ( HOLDING ?auto_68952 ) ( CLEAR ?auto_68951 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_68951 ?auto_68952 )
      ( MAKE-6PILE ?auto_68951 ?auto_68952 ?auto_68953 ?auto_68954 ?auto_68955 ?auto_68956 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68958 - BLOCK
      ?auto_68959 - BLOCK
      ?auto_68960 - BLOCK
      ?auto_68961 - BLOCK
      ?auto_68962 - BLOCK
      ?auto_68963 - BLOCK
    )
    :vars
    (
      ?auto_68964 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_68958 ) ( not ( = ?auto_68958 ?auto_68959 ) ) ( not ( = ?auto_68958 ?auto_68960 ) ) ( not ( = ?auto_68958 ?auto_68961 ) ) ( not ( = ?auto_68958 ?auto_68962 ) ) ( not ( = ?auto_68958 ?auto_68963 ) ) ( not ( = ?auto_68959 ?auto_68960 ) ) ( not ( = ?auto_68959 ?auto_68961 ) ) ( not ( = ?auto_68959 ?auto_68962 ) ) ( not ( = ?auto_68959 ?auto_68963 ) ) ( not ( = ?auto_68960 ?auto_68961 ) ) ( not ( = ?auto_68960 ?auto_68962 ) ) ( not ( = ?auto_68960 ?auto_68963 ) ) ( not ( = ?auto_68961 ?auto_68962 ) ) ( not ( = ?auto_68961 ?auto_68963 ) ) ( not ( = ?auto_68962 ?auto_68963 ) ) ( ON ?auto_68963 ?auto_68964 ) ( not ( = ?auto_68958 ?auto_68964 ) ) ( not ( = ?auto_68959 ?auto_68964 ) ) ( not ( = ?auto_68960 ?auto_68964 ) ) ( not ( = ?auto_68961 ?auto_68964 ) ) ( not ( = ?auto_68962 ?auto_68964 ) ) ( not ( = ?auto_68963 ?auto_68964 ) ) ( ON ?auto_68962 ?auto_68963 ) ( ON-TABLE ?auto_68964 ) ( ON ?auto_68961 ?auto_68962 ) ( ON ?auto_68960 ?auto_68961 ) ( CLEAR ?auto_68958 ) ( ON ?auto_68959 ?auto_68960 ) ( CLEAR ?auto_68959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_68964 ?auto_68963 ?auto_68962 ?auto_68961 ?auto_68960 )
      ( MAKE-6PILE ?auto_68958 ?auto_68959 ?auto_68960 ?auto_68961 ?auto_68962 ?auto_68963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68965 - BLOCK
      ?auto_68966 - BLOCK
      ?auto_68967 - BLOCK
      ?auto_68968 - BLOCK
      ?auto_68969 - BLOCK
      ?auto_68970 - BLOCK
    )
    :vars
    (
      ?auto_68971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68965 ?auto_68966 ) ) ( not ( = ?auto_68965 ?auto_68967 ) ) ( not ( = ?auto_68965 ?auto_68968 ) ) ( not ( = ?auto_68965 ?auto_68969 ) ) ( not ( = ?auto_68965 ?auto_68970 ) ) ( not ( = ?auto_68966 ?auto_68967 ) ) ( not ( = ?auto_68966 ?auto_68968 ) ) ( not ( = ?auto_68966 ?auto_68969 ) ) ( not ( = ?auto_68966 ?auto_68970 ) ) ( not ( = ?auto_68967 ?auto_68968 ) ) ( not ( = ?auto_68967 ?auto_68969 ) ) ( not ( = ?auto_68967 ?auto_68970 ) ) ( not ( = ?auto_68968 ?auto_68969 ) ) ( not ( = ?auto_68968 ?auto_68970 ) ) ( not ( = ?auto_68969 ?auto_68970 ) ) ( ON ?auto_68970 ?auto_68971 ) ( not ( = ?auto_68965 ?auto_68971 ) ) ( not ( = ?auto_68966 ?auto_68971 ) ) ( not ( = ?auto_68967 ?auto_68971 ) ) ( not ( = ?auto_68968 ?auto_68971 ) ) ( not ( = ?auto_68969 ?auto_68971 ) ) ( not ( = ?auto_68970 ?auto_68971 ) ) ( ON ?auto_68969 ?auto_68970 ) ( ON-TABLE ?auto_68971 ) ( ON ?auto_68968 ?auto_68969 ) ( ON ?auto_68967 ?auto_68968 ) ( ON ?auto_68966 ?auto_68967 ) ( CLEAR ?auto_68966 ) ( HOLDING ?auto_68965 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_68965 )
      ( MAKE-6PILE ?auto_68965 ?auto_68966 ?auto_68967 ?auto_68968 ?auto_68969 ?auto_68970 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_68972 - BLOCK
      ?auto_68973 - BLOCK
      ?auto_68974 - BLOCK
      ?auto_68975 - BLOCK
      ?auto_68976 - BLOCK
      ?auto_68977 - BLOCK
    )
    :vars
    (
      ?auto_68978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68972 ?auto_68973 ) ) ( not ( = ?auto_68972 ?auto_68974 ) ) ( not ( = ?auto_68972 ?auto_68975 ) ) ( not ( = ?auto_68972 ?auto_68976 ) ) ( not ( = ?auto_68972 ?auto_68977 ) ) ( not ( = ?auto_68973 ?auto_68974 ) ) ( not ( = ?auto_68973 ?auto_68975 ) ) ( not ( = ?auto_68973 ?auto_68976 ) ) ( not ( = ?auto_68973 ?auto_68977 ) ) ( not ( = ?auto_68974 ?auto_68975 ) ) ( not ( = ?auto_68974 ?auto_68976 ) ) ( not ( = ?auto_68974 ?auto_68977 ) ) ( not ( = ?auto_68975 ?auto_68976 ) ) ( not ( = ?auto_68975 ?auto_68977 ) ) ( not ( = ?auto_68976 ?auto_68977 ) ) ( ON ?auto_68977 ?auto_68978 ) ( not ( = ?auto_68972 ?auto_68978 ) ) ( not ( = ?auto_68973 ?auto_68978 ) ) ( not ( = ?auto_68974 ?auto_68978 ) ) ( not ( = ?auto_68975 ?auto_68978 ) ) ( not ( = ?auto_68976 ?auto_68978 ) ) ( not ( = ?auto_68977 ?auto_68978 ) ) ( ON ?auto_68976 ?auto_68977 ) ( ON-TABLE ?auto_68978 ) ( ON ?auto_68975 ?auto_68976 ) ( ON ?auto_68974 ?auto_68975 ) ( ON ?auto_68973 ?auto_68974 ) ( ON ?auto_68972 ?auto_68973 ) ( CLEAR ?auto_68972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_68978 ?auto_68977 ?auto_68976 ?auto_68975 ?auto_68974 ?auto_68973 )
      ( MAKE-6PILE ?auto_68972 ?auto_68973 ?auto_68974 ?auto_68975 ?auto_68976 ?auto_68977 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_68984 - BLOCK
      ?auto_68985 - BLOCK
      ?auto_68986 - BLOCK
      ?auto_68987 - BLOCK
      ?auto_68988 - BLOCK
    )
    :vars
    (
      ?auto_68989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_68989 ?auto_68988 ) ( CLEAR ?auto_68989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_68984 ) ( ON ?auto_68985 ?auto_68984 ) ( ON ?auto_68986 ?auto_68985 ) ( ON ?auto_68987 ?auto_68986 ) ( ON ?auto_68988 ?auto_68987 ) ( not ( = ?auto_68984 ?auto_68985 ) ) ( not ( = ?auto_68984 ?auto_68986 ) ) ( not ( = ?auto_68984 ?auto_68987 ) ) ( not ( = ?auto_68984 ?auto_68988 ) ) ( not ( = ?auto_68984 ?auto_68989 ) ) ( not ( = ?auto_68985 ?auto_68986 ) ) ( not ( = ?auto_68985 ?auto_68987 ) ) ( not ( = ?auto_68985 ?auto_68988 ) ) ( not ( = ?auto_68985 ?auto_68989 ) ) ( not ( = ?auto_68986 ?auto_68987 ) ) ( not ( = ?auto_68986 ?auto_68988 ) ) ( not ( = ?auto_68986 ?auto_68989 ) ) ( not ( = ?auto_68987 ?auto_68988 ) ) ( not ( = ?auto_68987 ?auto_68989 ) ) ( not ( = ?auto_68988 ?auto_68989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_68989 ?auto_68988 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69003 - BLOCK
      ?auto_69004 - BLOCK
      ?auto_69005 - BLOCK
      ?auto_69006 - BLOCK
      ?auto_69007 - BLOCK
    )
    :vars
    (
      ?auto_69008 - BLOCK
      ?auto_69009 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69003 ) ( ON ?auto_69004 ?auto_69003 ) ( ON ?auto_69005 ?auto_69004 ) ( ON ?auto_69006 ?auto_69005 ) ( not ( = ?auto_69003 ?auto_69004 ) ) ( not ( = ?auto_69003 ?auto_69005 ) ) ( not ( = ?auto_69003 ?auto_69006 ) ) ( not ( = ?auto_69003 ?auto_69007 ) ) ( not ( = ?auto_69003 ?auto_69008 ) ) ( not ( = ?auto_69004 ?auto_69005 ) ) ( not ( = ?auto_69004 ?auto_69006 ) ) ( not ( = ?auto_69004 ?auto_69007 ) ) ( not ( = ?auto_69004 ?auto_69008 ) ) ( not ( = ?auto_69005 ?auto_69006 ) ) ( not ( = ?auto_69005 ?auto_69007 ) ) ( not ( = ?auto_69005 ?auto_69008 ) ) ( not ( = ?auto_69006 ?auto_69007 ) ) ( not ( = ?auto_69006 ?auto_69008 ) ) ( not ( = ?auto_69007 ?auto_69008 ) ) ( ON ?auto_69008 ?auto_69009 ) ( CLEAR ?auto_69008 ) ( not ( = ?auto_69003 ?auto_69009 ) ) ( not ( = ?auto_69004 ?auto_69009 ) ) ( not ( = ?auto_69005 ?auto_69009 ) ) ( not ( = ?auto_69006 ?auto_69009 ) ) ( not ( = ?auto_69007 ?auto_69009 ) ) ( not ( = ?auto_69008 ?auto_69009 ) ) ( HOLDING ?auto_69007 ) ( CLEAR ?auto_69006 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ?auto_69008 )
      ( MAKE-5PILE ?auto_69003 ?auto_69004 ?auto_69005 ?auto_69006 ?auto_69007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69010 - BLOCK
      ?auto_69011 - BLOCK
      ?auto_69012 - BLOCK
      ?auto_69013 - BLOCK
      ?auto_69014 - BLOCK
    )
    :vars
    (
      ?auto_69015 - BLOCK
      ?auto_69016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69010 ) ( ON ?auto_69011 ?auto_69010 ) ( ON ?auto_69012 ?auto_69011 ) ( ON ?auto_69013 ?auto_69012 ) ( not ( = ?auto_69010 ?auto_69011 ) ) ( not ( = ?auto_69010 ?auto_69012 ) ) ( not ( = ?auto_69010 ?auto_69013 ) ) ( not ( = ?auto_69010 ?auto_69014 ) ) ( not ( = ?auto_69010 ?auto_69015 ) ) ( not ( = ?auto_69011 ?auto_69012 ) ) ( not ( = ?auto_69011 ?auto_69013 ) ) ( not ( = ?auto_69011 ?auto_69014 ) ) ( not ( = ?auto_69011 ?auto_69015 ) ) ( not ( = ?auto_69012 ?auto_69013 ) ) ( not ( = ?auto_69012 ?auto_69014 ) ) ( not ( = ?auto_69012 ?auto_69015 ) ) ( not ( = ?auto_69013 ?auto_69014 ) ) ( not ( = ?auto_69013 ?auto_69015 ) ) ( not ( = ?auto_69014 ?auto_69015 ) ) ( ON ?auto_69015 ?auto_69016 ) ( not ( = ?auto_69010 ?auto_69016 ) ) ( not ( = ?auto_69011 ?auto_69016 ) ) ( not ( = ?auto_69012 ?auto_69016 ) ) ( not ( = ?auto_69013 ?auto_69016 ) ) ( not ( = ?auto_69014 ?auto_69016 ) ) ( not ( = ?auto_69015 ?auto_69016 ) ) ( CLEAR ?auto_69013 ) ( ON ?auto_69014 ?auto_69015 ) ( CLEAR ?auto_69014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69016 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69016 ?auto_69015 )
      ( MAKE-5PILE ?auto_69010 ?auto_69011 ?auto_69012 ?auto_69013 ?auto_69014 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69017 - BLOCK
      ?auto_69018 - BLOCK
      ?auto_69019 - BLOCK
      ?auto_69020 - BLOCK
      ?auto_69021 - BLOCK
    )
    :vars
    (
      ?auto_69022 - BLOCK
      ?auto_69023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69017 ) ( ON ?auto_69018 ?auto_69017 ) ( ON ?auto_69019 ?auto_69018 ) ( not ( = ?auto_69017 ?auto_69018 ) ) ( not ( = ?auto_69017 ?auto_69019 ) ) ( not ( = ?auto_69017 ?auto_69020 ) ) ( not ( = ?auto_69017 ?auto_69021 ) ) ( not ( = ?auto_69017 ?auto_69022 ) ) ( not ( = ?auto_69018 ?auto_69019 ) ) ( not ( = ?auto_69018 ?auto_69020 ) ) ( not ( = ?auto_69018 ?auto_69021 ) ) ( not ( = ?auto_69018 ?auto_69022 ) ) ( not ( = ?auto_69019 ?auto_69020 ) ) ( not ( = ?auto_69019 ?auto_69021 ) ) ( not ( = ?auto_69019 ?auto_69022 ) ) ( not ( = ?auto_69020 ?auto_69021 ) ) ( not ( = ?auto_69020 ?auto_69022 ) ) ( not ( = ?auto_69021 ?auto_69022 ) ) ( ON ?auto_69022 ?auto_69023 ) ( not ( = ?auto_69017 ?auto_69023 ) ) ( not ( = ?auto_69018 ?auto_69023 ) ) ( not ( = ?auto_69019 ?auto_69023 ) ) ( not ( = ?auto_69020 ?auto_69023 ) ) ( not ( = ?auto_69021 ?auto_69023 ) ) ( not ( = ?auto_69022 ?auto_69023 ) ) ( ON ?auto_69021 ?auto_69022 ) ( CLEAR ?auto_69021 ) ( ON-TABLE ?auto_69023 ) ( HOLDING ?auto_69020 ) ( CLEAR ?auto_69019 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69017 ?auto_69018 ?auto_69019 ?auto_69020 )
      ( MAKE-5PILE ?auto_69017 ?auto_69018 ?auto_69019 ?auto_69020 ?auto_69021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69024 - BLOCK
      ?auto_69025 - BLOCK
      ?auto_69026 - BLOCK
      ?auto_69027 - BLOCK
      ?auto_69028 - BLOCK
    )
    :vars
    (
      ?auto_69030 - BLOCK
      ?auto_69029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69024 ) ( ON ?auto_69025 ?auto_69024 ) ( ON ?auto_69026 ?auto_69025 ) ( not ( = ?auto_69024 ?auto_69025 ) ) ( not ( = ?auto_69024 ?auto_69026 ) ) ( not ( = ?auto_69024 ?auto_69027 ) ) ( not ( = ?auto_69024 ?auto_69028 ) ) ( not ( = ?auto_69024 ?auto_69030 ) ) ( not ( = ?auto_69025 ?auto_69026 ) ) ( not ( = ?auto_69025 ?auto_69027 ) ) ( not ( = ?auto_69025 ?auto_69028 ) ) ( not ( = ?auto_69025 ?auto_69030 ) ) ( not ( = ?auto_69026 ?auto_69027 ) ) ( not ( = ?auto_69026 ?auto_69028 ) ) ( not ( = ?auto_69026 ?auto_69030 ) ) ( not ( = ?auto_69027 ?auto_69028 ) ) ( not ( = ?auto_69027 ?auto_69030 ) ) ( not ( = ?auto_69028 ?auto_69030 ) ) ( ON ?auto_69030 ?auto_69029 ) ( not ( = ?auto_69024 ?auto_69029 ) ) ( not ( = ?auto_69025 ?auto_69029 ) ) ( not ( = ?auto_69026 ?auto_69029 ) ) ( not ( = ?auto_69027 ?auto_69029 ) ) ( not ( = ?auto_69028 ?auto_69029 ) ) ( not ( = ?auto_69030 ?auto_69029 ) ) ( ON ?auto_69028 ?auto_69030 ) ( ON-TABLE ?auto_69029 ) ( CLEAR ?auto_69026 ) ( ON ?auto_69027 ?auto_69028 ) ( CLEAR ?auto_69027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69029 ?auto_69030 ?auto_69028 )
      ( MAKE-5PILE ?auto_69024 ?auto_69025 ?auto_69026 ?auto_69027 ?auto_69028 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69031 - BLOCK
      ?auto_69032 - BLOCK
      ?auto_69033 - BLOCK
      ?auto_69034 - BLOCK
      ?auto_69035 - BLOCK
    )
    :vars
    (
      ?auto_69037 - BLOCK
      ?auto_69036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69031 ) ( ON ?auto_69032 ?auto_69031 ) ( not ( = ?auto_69031 ?auto_69032 ) ) ( not ( = ?auto_69031 ?auto_69033 ) ) ( not ( = ?auto_69031 ?auto_69034 ) ) ( not ( = ?auto_69031 ?auto_69035 ) ) ( not ( = ?auto_69031 ?auto_69037 ) ) ( not ( = ?auto_69032 ?auto_69033 ) ) ( not ( = ?auto_69032 ?auto_69034 ) ) ( not ( = ?auto_69032 ?auto_69035 ) ) ( not ( = ?auto_69032 ?auto_69037 ) ) ( not ( = ?auto_69033 ?auto_69034 ) ) ( not ( = ?auto_69033 ?auto_69035 ) ) ( not ( = ?auto_69033 ?auto_69037 ) ) ( not ( = ?auto_69034 ?auto_69035 ) ) ( not ( = ?auto_69034 ?auto_69037 ) ) ( not ( = ?auto_69035 ?auto_69037 ) ) ( ON ?auto_69037 ?auto_69036 ) ( not ( = ?auto_69031 ?auto_69036 ) ) ( not ( = ?auto_69032 ?auto_69036 ) ) ( not ( = ?auto_69033 ?auto_69036 ) ) ( not ( = ?auto_69034 ?auto_69036 ) ) ( not ( = ?auto_69035 ?auto_69036 ) ) ( not ( = ?auto_69037 ?auto_69036 ) ) ( ON ?auto_69035 ?auto_69037 ) ( ON-TABLE ?auto_69036 ) ( ON ?auto_69034 ?auto_69035 ) ( CLEAR ?auto_69034 ) ( HOLDING ?auto_69033 ) ( CLEAR ?auto_69032 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69031 ?auto_69032 ?auto_69033 )
      ( MAKE-5PILE ?auto_69031 ?auto_69032 ?auto_69033 ?auto_69034 ?auto_69035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69038 - BLOCK
      ?auto_69039 - BLOCK
      ?auto_69040 - BLOCK
      ?auto_69041 - BLOCK
      ?auto_69042 - BLOCK
    )
    :vars
    (
      ?auto_69043 - BLOCK
      ?auto_69044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69038 ) ( ON ?auto_69039 ?auto_69038 ) ( not ( = ?auto_69038 ?auto_69039 ) ) ( not ( = ?auto_69038 ?auto_69040 ) ) ( not ( = ?auto_69038 ?auto_69041 ) ) ( not ( = ?auto_69038 ?auto_69042 ) ) ( not ( = ?auto_69038 ?auto_69043 ) ) ( not ( = ?auto_69039 ?auto_69040 ) ) ( not ( = ?auto_69039 ?auto_69041 ) ) ( not ( = ?auto_69039 ?auto_69042 ) ) ( not ( = ?auto_69039 ?auto_69043 ) ) ( not ( = ?auto_69040 ?auto_69041 ) ) ( not ( = ?auto_69040 ?auto_69042 ) ) ( not ( = ?auto_69040 ?auto_69043 ) ) ( not ( = ?auto_69041 ?auto_69042 ) ) ( not ( = ?auto_69041 ?auto_69043 ) ) ( not ( = ?auto_69042 ?auto_69043 ) ) ( ON ?auto_69043 ?auto_69044 ) ( not ( = ?auto_69038 ?auto_69044 ) ) ( not ( = ?auto_69039 ?auto_69044 ) ) ( not ( = ?auto_69040 ?auto_69044 ) ) ( not ( = ?auto_69041 ?auto_69044 ) ) ( not ( = ?auto_69042 ?auto_69044 ) ) ( not ( = ?auto_69043 ?auto_69044 ) ) ( ON ?auto_69042 ?auto_69043 ) ( ON-TABLE ?auto_69044 ) ( ON ?auto_69041 ?auto_69042 ) ( CLEAR ?auto_69039 ) ( ON ?auto_69040 ?auto_69041 ) ( CLEAR ?auto_69040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69044 ?auto_69043 ?auto_69042 ?auto_69041 )
      ( MAKE-5PILE ?auto_69038 ?auto_69039 ?auto_69040 ?auto_69041 ?auto_69042 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69045 - BLOCK
      ?auto_69046 - BLOCK
      ?auto_69047 - BLOCK
      ?auto_69048 - BLOCK
      ?auto_69049 - BLOCK
    )
    :vars
    (
      ?auto_69051 - BLOCK
      ?auto_69050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69045 ) ( not ( = ?auto_69045 ?auto_69046 ) ) ( not ( = ?auto_69045 ?auto_69047 ) ) ( not ( = ?auto_69045 ?auto_69048 ) ) ( not ( = ?auto_69045 ?auto_69049 ) ) ( not ( = ?auto_69045 ?auto_69051 ) ) ( not ( = ?auto_69046 ?auto_69047 ) ) ( not ( = ?auto_69046 ?auto_69048 ) ) ( not ( = ?auto_69046 ?auto_69049 ) ) ( not ( = ?auto_69046 ?auto_69051 ) ) ( not ( = ?auto_69047 ?auto_69048 ) ) ( not ( = ?auto_69047 ?auto_69049 ) ) ( not ( = ?auto_69047 ?auto_69051 ) ) ( not ( = ?auto_69048 ?auto_69049 ) ) ( not ( = ?auto_69048 ?auto_69051 ) ) ( not ( = ?auto_69049 ?auto_69051 ) ) ( ON ?auto_69051 ?auto_69050 ) ( not ( = ?auto_69045 ?auto_69050 ) ) ( not ( = ?auto_69046 ?auto_69050 ) ) ( not ( = ?auto_69047 ?auto_69050 ) ) ( not ( = ?auto_69048 ?auto_69050 ) ) ( not ( = ?auto_69049 ?auto_69050 ) ) ( not ( = ?auto_69051 ?auto_69050 ) ) ( ON ?auto_69049 ?auto_69051 ) ( ON-TABLE ?auto_69050 ) ( ON ?auto_69048 ?auto_69049 ) ( ON ?auto_69047 ?auto_69048 ) ( CLEAR ?auto_69047 ) ( HOLDING ?auto_69046 ) ( CLEAR ?auto_69045 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69045 ?auto_69046 )
      ( MAKE-5PILE ?auto_69045 ?auto_69046 ?auto_69047 ?auto_69048 ?auto_69049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69052 - BLOCK
      ?auto_69053 - BLOCK
      ?auto_69054 - BLOCK
      ?auto_69055 - BLOCK
      ?auto_69056 - BLOCK
    )
    :vars
    (
      ?auto_69058 - BLOCK
      ?auto_69057 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69052 ) ( not ( = ?auto_69052 ?auto_69053 ) ) ( not ( = ?auto_69052 ?auto_69054 ) ) ( not ( = ?auto_69052 ?auto_69055 ) ) ( not ( = ?auto_69052 ?auto_69056 ) ) ( not ( = ?auto_69052 ?auto_69058 ) ) ( not ( = ?auto_69053 ?auto_69054 ) ) ( not ( = ?auto_69053 ?auto_69055 ) ) ( not ( = ?auto_69053 ?auto_69056 ) ) ( not ( = ?auto_69053 ?auto_69058 ) ) ( not ( = ?auto_69054 ?auto_69055 ) ) ( not ( = ?auto_69054 ?auto_69056 ) ) ( not ( = ?auto_69054 ?auto_69058 ) ) ( not ( = ?auto_69055 ?auto_69056 ) ) ( not ( = ?auto_69055 ?auto_69058 ) ) ( not ( = ?auto_69056 ?auto_69058 ) ) ( ON ?auto_69058 ?auto_69057 ) ( not ( = ?auto_69052 ?auto_69057 ) ) ( not ( = ?auto_69053 ?auto_69057 ) ) ( not ( = ?auto_69054 ?auto_69057 ) ) ( not ( = ?auto_69055 ?auto_69057 ) ) ( not ( = ?auto_69056 ?auto_69057 ) ) ( not ( = ?auto_69058 ?auto_69057 ) ) ( ON ?auto_69056 ?auto_69058 ) ( ON-TABLE ?auto_69057 ) ( ON ?auto_69055 ?auto_69056 ) ( ON ?auto_69054 ?auto_69055 ) ( CLEAR ?auto_69052 ) ( ON ?auto_69053 ?auto_69054 ) ( CLEAR ?auto_69053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69057 ?auto_69058 ?auto_69056 ?auto_69055 ?auto_69054 )
      ( MAKE-5PILE ?auto_69052 ?auto_69053 ?auto_69054 ?auto_69055 ?auto_69056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69059 - BLOCK
      ?auto_69060 - BLOCK
      ?auto_69061 - BLOCK
      ?auto_69062 - BLOCK
      ?auto_69063 - BLOCK
    )
    :vars
    (
      ?auto_69064 - BLOCK
      ?auto_69065 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69059 ?auto_69060 ) ) ( not ( = ?auto_69059 ?auto_69061 ) ) ( not ( = ?auto_69059 ?auto_69062 ) ) ( not ( = ?auto_69059 ?auto_69063 ) ) ( not ( = ?auto_69059 ?auto_69064 ) ) ( not ( = ?auto_69060 ?auto_69061 ) ) ( not ( = ?auto_69060 ?auto_69062 ) ) ( not ( = ?auto_69060 ?auto_69063 ) ) ( not ( = ?auto_69060 ?auto_69064 ) ) ( not ( = ?auto_69061 ?auto_69062 ) ) ( not ( = ?auto_69061 ?auto_69063 ) ) ( not ( = ?auto_69061 ?auto_69064 ) ) ( not ( = ?auto_69062 ?auto_69063 ) ) ( not ( = ?auto_69062 ?auto_69064 ) ) ( not ( = ?auto_69063 ?auto_69064 ) ) ( ON ?auto_69064 ?auto_69065 ) ( not ( = ?auto_69059 ?auto_69065 ) ) ( not ( = ?auto_69060 ?auto_69065 ) ) ( not ( = ?auto_69061 ?auto_69065 ) ) ( not ( = ?auto_69062 ?auto_69065 ) ) ( not ( = ?auto_69063 ?auto_69065 ) ) ( not ( = ?auto_69064 ?auto_69065 ) ) ( ON ?auto_69063 ?auto_69064 ) ( ON-TABLE ?auto_69065 ) ( ON ?auto_69062 ?auto_69063 ) ( ON ?auto_69061 ?auto_69062 ) ( ON ?auto_69060 ?auto_69061 ) ( CLEAR ?auto_69060 ) ( HOLDING ?auto_69059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69059 )
      ( MAKE-5PILE ?auto_69059 ?auto_69060 ?auto_69061 ?auto_69062 ?auto_69063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69066 - BLOCK
      ?auto_69067 - BLOCK
      ?auto_69068 - BLOCK
      ?auto_69069 - BLOCK
      ?auto_69070 - BLOCK
    )
    :vars
    (
      ?auto_69071 - BLOCK
      ?auto_69072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69066 ?auto_69067 ) ) ( not ( = ?auto_69066 ?auto_69068 ) ) ( not ( = ?auto_69066 ?auto_69069 ) ) ( not ( = ?auto_69066 ?auto_69070 ) ) ( not ( = ?auto_69066 ?auto_69071 ) ) ( not ( = ?auto_69067 ?auto_69068 ) ) ( not ( = ?auto_69067 ?auto_69069 ) ) ( not ( = ?auto_69067 ?auto_69070 ) ) ( not ( = ?auto_69067 ?auto_69071 ) ) ( not ( = ?auto_69068 ?auto_69069 ) ) ( not ( = ?auto_69068 ?auto_69070 ) ) ( not ( = ?auto_69068 ?auto_69071 ) ) ( not ( = ?auto_69069 ?auto_69070 ) ) ( not ( = ?auto_69069 ?auto_69071 ) ) ( not ( = ?auto_69070 ?auto_69071 ) ) ( ON ?auto_69071 ?auto_69072 ) ( not ( = ?auto_69066 ?auto_69072 ) ) ( not ( = ?auto_69067 ?auto_69072 ) ) ( not ( = ?auto_69068 ?auto_69072 ) ) ( not ( = ?auto_69069 ?auto_69072 ) ) ( not ( = ?auto_69070 ?auto_69072 ) ) ( not ( = ?auto_69071 ?auto_69072 ) ) ( ON ?auto_69070 ?auto_69071 ) ( ON-TABLE ?auto_69072 ) ( ON ?auto_69069 ?auto_69070 ) ( ON ?auto_69068 ?auto_69069 ) ( ON ?auto_69067 ?auto_69068 ) ( ON ?auto_69066 ?auto_69067 ) ( CLEAR ?auto_69066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69072 ?auto_69071 ?auto_69070 ?auto_69069 ?auto_69068 ?auto_69067 )
      ( MAKE-5PILE ?auto_69066 ?auto_69067 ?auto_69068 ?auto_69069 ?auto_69070 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69074 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_69074 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69075 - BLOCK
    )
    :vars
    (
      ?auto_69076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69075 ?auto_69076 ) ( CLEAR ?auto_69075 ) ( HAND-EMPTY ) ( not ( = ?auto_69075 ?auto_69076 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69075 ?auto_69076 )
      ( MAKE-1PILE ?auto_69075 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69077 - BLOCK
    )
    :vars
    (
      ?auto_69078 - BLOCK
      ?auto_69081 - BLOCK
      ?auto_69079 - BLOCK
      ?auto_69082 - BLOCK
      ?auto_69080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69077 ?auto_69078 ) ) ( HOLDING ?auto_69077 ) ( CLEAR ?auto_69078 ) ( ON-TABLE ?auto_69081 ) ( ON ?auto_69079 ?auto_69081 ) ( ON ?auto_69082 ?auto_69079 ) ( ON ?auto_69080 ?auto_69082 ) ( ON ?auto_69078 ?auto_69080 ) ( not ( = ?auto_69081 ?auto_69079 ) ) ( not ( = ?auto_69081 ?auto_69082 ) ) ( not ( = ?auto_69081 ?auto_69080 ) ) ( not ( = ?auto_69081 ?auto_69078 ) ) ( not ( = ?auto_69081 ?auto_69077 ) ) ( not ( = ?auto_69079 ?auto_69082 ) ) ( not ( = ?auto_69079 ?auto_69080 ) ) ( not ( = ?auto_69079 ?auto_69078 ) ) ( not ( = ?auto_69079 ?auto_69077 ) ) ( not ( = ?auto_69082 ?auto_69080 ) ) ( not ( = ?auto_69082 ?auto_69078 ) ) ( not ( = ?auto_69082 ?auto_69077 ) ) ( not ( = ?auto_69080 ?auto_69078 ) ) ( not ( = ?auto_69080 ?auto_69077 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69081 ?auto_69079 ?auto_69082 ?auto_69080 ?auto_69078 ?auto_69077 )
      ( MAKE-1PILE ?auto_69077 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69083 - BLOCK
    )
    :vars
    (
      ?auto_69085 - BLOCK
      ?auto_69086 - BLOCK
      ?auto_69088 - BLOCK
      ?auto_69084 - BLOCK
      ?auto_69087 - BLOCK
      ?auto_69089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69083 ?auto_69085 ) ) ( CLEAR ?auto_69085 ) ( ON-TABLE ?auto_69086 ) ( ON ?auto_69088 ?auto_69086 ) ( ON ?auto_69084 ?auto_69088 ) ( ON ?auto_69087 ?auto_69084 ) ( ON ?auto_69085 ?auto_69087 ) ( not ( = ?auto_69086 ?auto_69088 ) ) ( not ( = ?auto_69086 ?auto_69084 ) ) ( not ( = ?auto_69086 ?auto_69087 ) ) ( not ( = ?auto_69086 ?auto_69085 ) ) ( not ( = ?auto_69086 ?auto_69083 ) ) ( not ( = ?auto_69088 ?auto_69084 ) ) ( not ( = ?auto_69088 ?auto_69087 ) ) ( not ( = ?auto_69088 ?auto_69085 ) ) ( not ( = ?auto_69088 ?auto_69083 ) ) ( not ( = ?auto_69084 ?auto_69087 ) ) ( not ( = ?auto_69084 ?auto_69085 ) ) ( not ( = ?auto_69084 ?auto_69083 ) ) ( not ( = ?auto_69087 ?auto_69085 ) ) ( not ( = ?auto_69087 ?auto_69083 ) ) ( ON ?auto_69083 ?auto_69089 ) ( CLEAR ?auto_69083 ) ( HAND-EMPTY ) ( not ( = ?auto_69083 ?auto_69089 ) ) ( not ( = ?auto_69085 ?auto_69089 ) ) ( not ( = ?auto_69086 ?auto_69089 ) ) ( not ( = ?auto_69088 ?auto_69089 ) ) ( not ( = ?auto_69084 ?auto_69089 ) ) ( not ( = ?auto_69087 ?auto_69089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69083 ?auto_69089 )
      ( MAKE-1PILE ?auto_69083 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69090 - BLOCK
    )
    :vars
    (
      ?auto_69094 - BLOCK
      ?auto_69092 - BLOCK
      ?auto_69096 - BLOCK
      ?auto_69095 - BLOCK
      ?auto_69093 - BLOCK
      ?auto_69091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69090 ?auto_69094 ) ) ( ON-TABLE ?auto_69092 ) ( ON ?auto_69096 ?auto_69092 ) ( ON ?auto_69095 ?auto_69096 ) ( ON ?auto_69093 ?auto_69095 ) ( not ( = ?auto_69092 ?auto_69096 ) ) ( not ( = ?auto_69092 ?auto_69095 ) ) ( not ( = ?auto_69092 ?auto_69093 ) ) ( not ( = ?auto_69092 ?auto_69094 ) ) ( not ( = ?auto_69092 ?auto_69090 ) ) ( not ( = ?auto_69096 ?auto_69095 ) ) ( not ( = ?auto_69096 ?auto_69093 ) ) ( not ( = ?auto_69096 ?auto_69094 ) ) ( not ( = ?auto_69096 ?auto_69090 ) ) ( not ( = ?auto_69095 ?auto_69093 ) ) ( not ( = ?auto_69095 ?auto_69094 ) ) ( not ( = ?auto_69095 ?auto_69090 ) ) ( not ( = ?auto_69093 ?auto_69094 ) ) ( not ( = ?auto_69093 ?auto_69090 ) ) ( ON ?auto_69090 ?auto_69091 ) ( CLEAR ?auto_69090 ) ( not ( = ?auto_69090 ?auto_69091 ) ) ( not ( = ?auto_69094 ?auto_69091 ) ) ( not ( = ?auto_69092 ?auto_69091 ) ) ( not ( = ?auto_69096 ?auto_69091 ) ) ( not ( = ?auto_69095 ?auto_69091 ) ) ( not ( = ?auto_69093 ?auto_69091 ) ) ( HOLDING ?auto_69094 ) ( CLEAR ?auto_69093 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69092 ?auto_69096 ?auto_69095 ?auto_69093 ?auto_69094 )
      ( MAKE-1PILE ?auto_69090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69097 - BLOCK
    )
    :vars
    (
      ?auto_69101 - BLOCK
      ?auto_69099 - BLOCK
      ?auto_69098 - BLOCK
      ?auto_69102 - BLOCK
      ?auto_69103 - BLOCK
      ?auto_69100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69097 ?auto_69101 ) ) ( ON-TABLE ?auto_69099 ) ( ON ?auto_69098 ?auto_69099 ) ( ON ?auto_69102 ?auto_69098 ) ( ON ?auto_69103 ?auto_69102 ) ( not ( = ?auto_69099 ?auto_69098 ) ) ( not ( = ?auto_69099 ?auto_69102 ) ) ( not ( = ?auto_69099 ?auto_69103 ) ) ( not ( = ?auto_69099 ?auto_69101 ) ) ( not ( = ?auto_69099 ?auto_69097 ) ) ( not ( = ?auto_69098 ?auto_69102 ) ) ( not ( = ?auto_69098 ?auto_69103 ) ) ( not ( = ?auto_69098 ?auto_69101 ) ) ( not ( = ?auto_69098 ?auto_69097 ) ) ( not ( = ?auto_69102 ?auto_69103 ) ) ( not ( = ?auto_69102 ?auto_69101 ) ) ( not ( = ?auto_69102 ?auto_69097 ) ) ( not ( = ?auto_69103 ?auto_69101 ) ) ( not ( = ?auto_69103 ?auto_69097 ) ) ( ON ?auto_69097 ?auto_69100 ) ( not ( = ?auto_69097 ?auto_69100 ) ) ( not ( = ?auto_69101 ?auto_69100 ) ) ( not ( = ?auto_69099 ?auto_69100 ) ) ( not ( = ?auto_69098 ?auto_69100 ) ) ( not ( = ?auto_69102 ?auto_69100 ) ) ( not ( = ?auto_69103 ?auto_69100 ) ) ( CLEAR ?auto_69103 ) ( ON ?auto_69101 ?auto_69097 ) ( CLEAR ?auto_69101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69100 ?auto_69097 )
      ( MAKE-1PILE ?auto_69097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69104 - BLOCK
    )
    :vars
    (
      ?auto_69108 - BLOCK
      ?auto_69105 - BLOCK
      ?auto_69110 - BLOCK
      ?auto_69109 - BLOCK
      ?auto_69107 - BLOCK
      ?auto_69106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69104 ?auto_69108 ) ) ( ON-TABLE ?auto_69105 ) ( ON ?auto_69110 ?auto_69105 ) ( ON ?auto_69109 ?auto_69110 ) ( not ( = ?auto_69105 ?auto_69110 ) ) ( not ( = ?auto_69105 ?auto_69109 ) ) ( not ( = ?auto_69105 ?auto_69107 ) ) ( not ( = ?auto_69105 ?auto_69108 ) ) ( not ( = ?auto_69105 ?auto_69104 ) ) ( not ( = ?auto_69110 ?auto_69109 ) ) ( not ( = ?auto_69110 ?auto_69107 ) ) ( not ( = ?auto_69110 ?auto_69108 ) ) ( not ( = ?auto_69110 ?auto_69104 ) ) ( not ( = ?auto_69109 ?auto_69107 ) ) ( not ( = ?auto_69109 ?auto_69108 ) ) ( not ( = ?auto_69109 ?auto_69104 ) ) ( not ( = ?auto_69107 ?auto_69108 ) ) ( not ( = ?auto_69107 ?auto_69104 ) ) ( ON ?auto_69104 ?auto_69106 ) ( not ( = ?auto_69104 ?auto_69106 ) ) ( not ( = ?auto_69108 ?auto_69106 ) ) ( not ( = ?auto_69105 ?auto_69106 ) ) ( not ( = ?auto_69110 ?auto_69106 ) ) ( not ( = ?auto_69109 ?auto_69106 ) ) ( not ( = ?auto_69107 ?auto_69106 ) ) ( ON ?auto_69108 ?auto_69104 ) ( CLEAR ?auto_69108 ) ( ON-TABLE ?auto_69106 ) ( HOLDING ?auto_69107 ) ( CLEAR ?auto_69109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69105 ?auto_69110 ?auto_69109 ?auto_69107 )
      ( MAKE-1PILE ?auto_69104 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69111 - BLOCK
    )
    :vars
    (
      ?auto_69116 - BLOCK
      ?auto_69112 - BLOCK
      ?auto_69114 - BLOCK
      ?auto_69117 - BLOCK
      ?auto_69115 - BLOCK
      ?auto_69113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69111 ?auto_69116 ) ) ( ON-TABLE ?auto_69112 ) ( ON ?auto_69114 ?auto_69112 ) ( ON ?auto_69117 ?auto_69114 ) ( not ( = ?auto_69112 ?auto_69114 ) ) ( not ( = ?auto_69112 ?auto_69117 ) ) ( not ( = ?auto_69112 ?auto_69115 ) ) ( not ( = ?auto_69112 ?auto_69116 ) ) ( not ( = ?auto_69112 ?auto_69111 ) ) ( not ( = ?auto_69114 ?auto_69117 ) ) ( not ( = ?auto_69114 ?auto_69115 ) ) ( not ( = ?auto_69114 ?auto_69116 ) ) ( not ( = ?auto_69114 ?auto_69111 ) ) ( not ( = ?auto_69117 ?auto_69115 ) ) ( not ( = ?auto_69117 ?auto_69116 ) ) ( not ( = ?auto_69117 ?auto_69111 ) ) ( not ( = ?auto_69115 ?auto_69116 ) ) ( not ( = ?auto_69115 ?auto_69111 ) ) ( ON ?auto_69111 ?auto_69113 ) ( not ( = ?auto_69111 ?auto_69113 ) ) ( not ( = ?auto_69116 ?auto_69113 ) ) ( not ( = ?auto_69112 ?auto_69113 ) ) ( not ( = ?auto_69114 ?auto_69113 ) ) ( not ( = ?auto_69117 ?auto_69113 ) ) ( not ( = ?auto_69115 ?auto_69113 ) ) ( ON ?auto_69116 ?auto_69111 ) ( ON-TABLE ?auto_69113 ) ( CLEAR ?auto_69117 ) ( ON ?auto_69115 ?auto_69116 ) ( CLEAR ?auto_69115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69113 ?auto_69111 ?auto_69116 )
      ( MAKE-1PILE ?auto_69111 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69118 - BLOCK
    )
    :vars
    (
      ?auto_69122 - BLOCK
      ?auto_69124 - BLOCK
      ?auto_69119 - BLOCK
      ?auto_69123 - BLOCK
      ?auto_69120 - BLOCK
      ?auto_69121 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69118 ?auto_69122 ) ) ( ON-TABLE ?auto_69124 ) ( ON ?auto_69119 ?auto_69124 ) ( not ( = ?auto_69124 ?auto_69119 ) ) ( not ( = ?auto_69124 ?auto_69123 ) ) ( not ( = ?auto_69124 ?auto_69120 ) ) ( not ( = ?auto_69124 ?auto_69122 ) ) ( not ( = ?auto_69124 ?auto_69118 ) ) ( not ( = ?auto_69119 ?auto_69123 ) ) ( not ( = ?auto_69119 ?auto_69120 ) ) ( not ( = ?auto_69119 ?auto_69122 ) ) ( not ( = ?auto_69119 ?auto_69118 ) ) ( not ( = ?auto_69123 ?auto_69120 ) ) ( not ( = ?auto_69123 ?auto_69122 ) ) ( not ( = ?auto_69123 ?auto_69118 ) ) ( not ( = ?auto_69120 ?auto_69122 ) ) ( not ( = ?auto_69120 ?auto_69118 ) ) ( ON ?auto_69118 ?auto_69121 ) ( not ( = ?auto_69118 ?auto_69121 ) ) ( not ( = ?auto_69122 ?auto_69121 ) ) ( not ( = ?auto_69124 ?auto_69121 ) ) ( not ( = ?auto_69119 ?auto_69121 ) ) ( not ( = ?auto_69123 ?auto_69121 ) ) ( not ( = ?auto_69120 ?auto_69121 ) ) ( ON ?auto_69122 ?auto_69118 ) ( ON-TABLE ?auto_69121 ) ( ON ?auto_69120 ?auto_69122 ) ( CLEAR ?auto_69120 ) ( HOLDING ?auto_69123 ) ( CLEAR ?auto_69119 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69124 ?auto_69119 ?auto_69123 )
      ( MAKE-1PILE ?auto_69118 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69125 - BLOCK
    )
    :vars
    (
      ?auto_69129 - BLOCK
      ?auto_69127 - BLOCK
      ?auto_69128 - BLOCK
      ?auto_69131 - BLOCK
      ?auto_69130 - BLOCK
      ?auto_69126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69125 ?auto_69129 ) ) ( ON-TABLE ?auto_69127 ) ( ON ?auto_69128 ?auto_69127 ) ( not ( = ?auto_69127 ?auto_69128 ) ) ( not ( = ?auto_69127 ?auto_69131 ) ) ( not ( = ?auto_69127 ?auto_69130 ) ) ( not ( = ?auto_69127 ?auto_69129 ) ) ( not ( = ?auto_69127 ?auto_69125 ) ) ( not ( = ?auto_69128 ?auto_69131 ) ) ( not ( = ?auto_69128 ?auto_69130 ) ) ( not ( = ?auto_69128 ?auto_69129 ) ) ( not ( = ?auto_69128 ?auto_69125 ) ) ( not ( = ?auto_69131 ?auto_69130 ) ) ( not ( = ?auto_69131 ?auto_69129 ) ) ( not ( = ?auto_69131 ?auto_69125 ) ) ( not ( = ?auto_69130 ?auto_69129 ) ) ( not ( = ?auto_69130 ?auto_69125 ) ) ( ON ?auto_69125 ?auto_69126 ) ( not ( = ?auto_69125 ?auto_69126 ) ) ( not ( = ?auto_69129 ?auto_69126 ) ) ( not ( = ?auto_69127 ?auto_69126 ) ) ( not ( = ?auto_69128 ?auto_69126 ) ) ( not ( = ?auto_69131 ?auto_69126 ) ) ( not ( = ?auto_69130 ?auto_69126 ) ) ( ON ?auto_69129 ?auto_69125 ) ( ON-TABLE ?auto_69126 ) ( ON ?auto_69130 ?auto_69129 ) ( CLEAR ?auto_69128 ) ( ON ?auto_69131 ?auto_69130 ) ( CLEAR ?auto_69131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69126 ?auto_69125 ?auto_69129 ?auto_69130 )
      ( MAKE-1PILE ?auto_69125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69132 - BLOCK
    )
    :vars
    (
      ?auto_69136 - BLOCK
      ?auto_69135 - BLOCK
      ?auto_69133 - BLOCK
      ?auto_69137 - BLOCK
      ?auto_69138 - BLOCK
      ?auto_69134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69132 ?auto_69136 ) ) ( ON-TABLE ?auto_69135 ) ( not ( = ?auto_69135 ?auto_69133 ) ) ( not ( = ?auto_69135 ?auto_69137 ) ) ( not ( = ?auto_69135 ?auto_69138 ) ) ( not ( = ?auto_69135 ?auto_69136 ) ) ( not ( = ?auto_69135 ?auto_69132 ) ) ( not ( = ?auto_69133 ?auto_69137 ) ) ( not ( = ?auto_69133 ?auto_69138 ) ) ( not ( = ?auto_69133 ?auto_69136 ) ) ( not ( = ?auto_69133 ?auto_69132 ) ) ( not ( = ?auto_69137 ?auto_69138 ) ) ( not ( = ?auto_69137 ?auto_69136 ) ) ( not ( = ?auto_69137 ?auto_69132 ) ) ( not ( = ?auto_69138 ?auto_69136 ) ) ( not ( = ?auto_69138 ?auto_69132 ) ) ( ON ?auto_69132 ?auto_69134 ) ( not ( = ?auto_69132 ?auto_69134 ) ) ( not ( = ?auto_69136 ?auto_69134 ) ) ( not ( = ?auto_69135 ?auto_69134 ) ) ( not ( = ?auto_69133 ?auto_69134 ) ) ( not ( = ?auto_69137 ?auto_69134 ) ) ( not ( = ?auto_69138 ?auto_69134 ) ) ( ON ?auto_69136 ?auto_69132 ) ( ON-TABLE ?auto_69134 ) ( ON ?auto_69138 ?auto_69136 ) ( ON ?auto_69137 ?auto_69138 ) ( CLEAR ?auto_69137 ) ( HOLDING ?auto_69133 ) ( CLEAR ?auto_69135 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69135 ?auto_69133 )
      ( MAKE-1PILE ?auto_69132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69139 - BLOCK
    )
    :vars
    (
      ?auto_69143 - BLOCK
      ?auto_69141 - BLOCK
      ?auto_69142 - BLOCK
      ?auto_69145 - BLOCK
      ?auto_69144 - BLOCK
      ?auto_69140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69139 ?auto_69143 ) ) ( ON-TABLE ?auto_69141 ) ( not ( = ?auto_69141 ?auto_69142 ) ) ( not ( = ?auto_69141 ?auto_69145 ) ) ( not ( = ?auto_69141 ?auto_69144 ) ) ( not ( = ?auto_69141 ?auto_69143 ) ) ( not ( = ?auto_69141 ?auto_69139 ) ) ( not ( = ?auto_69142 ?auto_69145 ) ) ( not ( = ?auto_69142 ?auto_69144 ) ) ( not ( = ?auto_69142 ?auto_69143 ) ) ( not ( = ?auto_69142 ?auto_69139 ) ) ( not ( = ?auto_69145 ?auto_69144 ) ) ( not ( = ?auto_69145 ?auto_69143 ) ) ( not ( = ?auto_69145 ?auto_69139 ) ) ( not ( = ?auto_69144 ?auto_69143 ) ) ( not ( = ?auto_69144 ?auto_69139 ) ) ( ON ?auto_69139 ?auto_69140 ) ( not ( = ?auto_69139 ?auto_69140 ) ) ( not ( = ?auto_69143 ?auto_69140 ) ) ( not ( = ?auto_69141 ?auto_69140 ) ) ( not ( = ?auto_69142 ?auto_69140 ) ) ( not ( = ?auto_69145 ?auto_69140 ) ) ( not ( = ?auto_69144 ?auto_69140 ) ) ( ON ?auto_69143 ?auto_69139 ) ( ON-TABLE ?auto_69140 ) ( ON ?auto_69144 ?auto_69143 ) ( ON ?auto_69145 ?auto_69144 ) ( CLEAR ?auto_69141 ) ( ON ?auto_69142 ?auto_69145 ) ( CLEAR ?auto_69142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69140 ?auto_69139 ?auto_69143 ?auto_69144 ?auto_69145 )
      ( MAKE-1PILE ?auto_69139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69146 - BLOCK
    )
    :vars
    (
      ?auto_69152 - BLOCK
      ?auto_69147 - BLOCK
      ?auto_69148 - BLOCK
      ?auto_69149 - BLOCK
      ?auto_69150 - BLOCK
      ?auto_69151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69146 ?auto_69152 ) ) ( not ( = ?auto_69147 ?auto_69148 ) ) ( not ( = ?auto_69147 ?auto_69149 ) ) ( not ( = ?auto_69147 ?auto_69150 ) ) ( not ( = ?auto_69147 ?auto_69152 ) ) ( not ( = ?auto_69147 ?auto_69146 ) ) ( not ( = ?auto_69148 ?auto_69149 ) ) ( not ( = ?auto_69148 ?auto_69150 ) ) ( not ( = ?auto_69148 ?auto_69152 ) ) ( not ( = ?auto_69148 ?auto_69146 ) ) ( not ( = ?auto_69149 ?auto_69150 ) ) ( not ( = ?auto_69149 ?auto_69152 ) ) ( not ( = ?auto_69149 ?auto_69146 ) ) ( not ( = ?auto_69150 ?auto_69152 ) ) ( not ( = ?auto_69150 ?auto_69146 ) ) ( ON ?auto_69146 ?auto_69151 ) ( not ( = ?auto_69146 ?auto_69151 ) ) ( not ( = ?auto_69152 ?auto_69151 ) ) ( not ( = ?auto_69147 ?auto_69151 ) ) ( not ( = ?auto_69148 ?auto_69151 ) ) ( not ( = ?auto_69149 ?auto_69151 ) ) ( not ( = ?auto_69150 ?auto_69151 ) ) ( ON ?auto_69152 ?auto_69146 ) ( ON-TABLE ?auto_69151 ) ( ON ?auto_69150 ?auto_69152 ) ( ON ?auto_69149 ?auto_69150 ) ( ON ?auto_69148 ?auto_69149 ) ( CLEAR ?auto_69148 ) ( HOLDING ?auto_69147 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69147 )
      ( MAKE-1PILE ?auto_69146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69153 - BLOCK
    )
    :vars
    (
      ?auto_69157 - BLOCK
      ?auto_69158 - BLOCK
      ?auto_69155 - BLOCK
      ?auto_69154 - BLOCK
      ?auto_69159 - BLOCK
      ?auto_69156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69153 ?auto_69157 ) ) ( not ( = ?auto_69158 ?auto_69155 ) ) ( not ( = ?auto_69158 ?auto_69154 ) ) ( not ( = ?auto_69158 ?auto_69159 ) ) ( not ( = ?auto_69158 ?auto_69157 ) ) ( not ( = ?auto_69158 ?auto_69153 ) ) ( not ( = ?auto_69155 ?auto_69154 ) ) ( not ( = ?auto_69155 ?auto_69159 ) ) ( not ( = ?auto_69155 ?auto_69157 ) ) ( not ( = ?auto_69155 ?auto_69153 ) ) ( not ( = ?auto_69154 ?auto_69159 ) ) ( not ( = ?auto_69154 ?auto_69157 ) ) ( not ( = ?auto_69154 ?auto_69153 ) ) ( not ( = ?auto_69159 ?auto_69157 ) ) ( not ( = ?auto_69159 ?auto_69153 ) ) ( ON ?auto_69153 ?auto_69156 ) ( not ( = ?auto_69153 ?auto_69156 ) ) ( not ( = ?auto_69157 ?auto_69156 ) ) ( not ( = ?auto_69158 ?auto_69156 ) ) ( not ( = ?auto_69155 ?auto_69156 ) ) ( not ( = ?auto_69154 ?auto_69156 ) ) ( not ( = ?auto_69159 ?auto_69156 ) ) ( ON ?auto_69157 ?auto_69153 ) ( ON-TABLE ?auto_69156 ) ( ON ?auto_69159 ?auto_69157 ) ( ON ?auto_69154 ?auto_69159 ) ( ON ?auto_69155 ?auto_69154 ) ( ON ?auto_69158 ?auto_69155 ) ( CLEAR ?auto_69158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69156 ?auto_69153 ?auto_69157 ?auto_69159 ?auto_69154 ?auto_69155 )
      ( MAKE-1PILE ?auto_69153 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69164 - BLOCK
      ?auto_69165 - BLOCK
      ?auto_69166 - BLOCK
      ?auto_69167 - BLOCK
    )
    :vars
    (
      ?auto_69168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69168 ?auto_69167 ) ( CLEAR ?auto_69168 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69164 ) ( ON ?auto_69165 ?auto_69164 ) ( ON ?auto_69166 ?auto_69165 ) ( ON ?auto_69167 ?auto_69166 ) ( not ( = ?auto_69164 ?auto_69165 ) ) ( not ( = ?auto_69164 ?auto_69166 ) ) ( not ( = ?auto_69164 ?auto_69167 ) ) ( not ( = ?auto_69164 ?auto_69168 ) ) ( not ( = ?auto_69165 ?auto_69166 ) ) ( not ( = ?auto_69165 ?auto_69167 ) ) ( not ( = ?auto_69165 ?auto_69168 ) ) ( not ( = ?auto_69166 ?auto_69167 ) ) ( not ( = ?auto_69166 ?auto_69168 ) ) ( not ( = ?auto_69167 ?auto_69168 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69168 ?auto_69167 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69169 - BLOCK
      ?auto_69170 - BLOCK
      ?auto_69171 - BLOCK
      ?auto_69172 - BLOCK
    )
    :vars
    (
      ?auto_69173 - BLOCK
      ?auto_69174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69173 ?auto_69172 ) ( CLEAR ?auto_69173 ) ( ON-TABLE ?auto_69169 ) ( ON ?auto_69170 ?auto_69169 ) ( ON ?auto_69171 ?auto_69170 ) ( ON ?auto_69172 ?auto_69171 ) ( not ( = ?auto_69169 ?auto_69170 ) ) ( not ( = ?auto_69169 ?auto_69171 ) ) ( not ( = ?auto_69169 ?auto_69172 ) ) ( not ( = ?auto_69169 ?auto_69173 ) ) ( not ( = ?auto_69170 ?auto_69171 ) ) ( not ( = ?auto_69170 ?auto_69172 ) ) ( not ( = ?auto_69170 ?auto_69173 ) ) ( not ( = ?auto_69171 ?auto_69172 ) ) ( not ( = ?auto_69171 ?auto_69173 ) ) ( not ( = ?auto_69172 ?auto_69173 ) ) ( HOLDING ?auto_69174 ) ( not ( = ?auto_69169 ?auto_69174 ) ) ( not ( = ?auto_69170 ?auto_69174 ) ) ( not ( = ?auto_69171 ?auto_69174 ) ) ( not ( = ?auto_69172 ?auto_69174 ) ) ( not ( = ?auto_69173 ?auto_69174 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_69174 )
      ( MAKE-4PILE ?auto_69169 ?auto_69170 ?auto_69171 ?auto_69172 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69175 - BLOCK
      ?auto_69176 - BLOCK
      ?auto_69177 - BLOCK
      ?auto_69178 - BLOCK
    )
    :vars
    (
      ?auto_69179 - BLOCK
      ?auto_69180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69179 ?auto_69178 ) ( ON-TABLE ?auto_69175 ) ( ON ?auto_69176 ?auto_69175 ) ( ON ?auto_69177 ?auto_69176 ) ( ON ?auto_69178 ?auto_69177 ) ( not ( = ?auto_69175 ?auto_69176 ) ) ( not ( = ?auto_69175 ?auto_69177 ) ) ( not ( = ?auto_69175 ?auto_69178 ) ) ( not ( = ?auto_69175 ?auto_69179 ) ) ( not ( = ?auto_69176 ?auto_69177 ) ) ( not ( = ?auto_69176 ?auto_69178 ) ) ( not ( = ?auto_69176 ?auto_69179 ) ) ( not ( = ?auto_69177 ?auto_69178 ) ) ( not ( = ?auto_69177 ?auto_69179 ) ) ( not ( = ?auto_69178 ?auto_69179 ) ) ( not ( = ?auto_69175 ?auto_69180 ) ) ( not ( = ?auto_69176 ?auto_69180 ) ) ( not ( = ?auto_69177 ?auto_69180 ) ) ( not ( = ?auto_69178 ?auto_69180 ) ) ( not ( = ?auto_69179 ?auto_69180 ) ) ( ON ?auto_69180 ?auto_69179 ) ( CLEAR ?auto_69180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69175 ?auto_69176 ?auto_69177 ?auto_69178 ?auto_69179 )
      ( MAKE-4PILE ?auto_69175 ?auto_69176 ?auto_69177 ?auto_69178 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69181 - BLOCK
      ?auto_69182 - BLOCK
      ?auto_69183 - BLOCK
      ?auto_69184 - BLOCK
    )
    :vars
    (
      ?auto_69185 - BLOCK
      ?auto_69186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69185 ?auto_69184 ) ( ON-TABLE ?auto_69181 ) ( ON ?auto_69182 ?auto_69181 ) ( ON ?auto_69183 ?auto_69182 ) ( ON ?auto_69184 ?auto_69183 ) ( not ( = ?auto_69181 ?auto_69182 ) ) ( not ( = ?auto_69181 ?auto_69183 ) ) ( not ( = ?auto_69181 ?auto_69184 ) ) ( not ( = ?auto_69181 ?auto_69185 ) ) ( not ( = ?auto_69182 ?auto_69183 ) ) ( not ( = ?auto_69182 ?auto_69184 ) ) ( not ( = ?auto_69182 ?auto_69185 ) ) ( not ( = ?auto_69183 ?auto_69184 ) ) ( not ( = ?auto_69183 ?auto_69185 ) ) ( not ( = ?auto_69184 ?auto_69185 ) ) ( not ( = ?auto_69181 ?auto_69186 ) ) ( not ( = ?auto_69182 ?auto_69186 ) ) ( not ( = ?auto_69183 ?auto_69186 ) ) ( not ( = ?auto_69184 ?auto_69186 ) ) ( not ( = ?auto_69185 ?auto_69186 ) ) ( HOLDING ?auto_69186 ) ( CLEAR ?auto_69185 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69181 ?auto_69182 ?auto_69183 ?auto_69184 ?auto_69185 ?auto_69186 )
      ( MAKE-4PILE ?auto_69181 ?auto_69182 ?auto_69183 ?auto_69184 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69187 - BLOCK
      ?auto_69188 - BLOCK
      ?auto_69189 - BLOCK
      ?auto_69190 - BLOCK
    )
    :vars
    (
      ?auto_69192 - BLOCK
      ?auto_69191 - BLOCK
      ?auto_69193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69192 ?auto_69190 ) ( ON-TABLE ?auto_69187 ) ( ON ?auto_69188 ?auto_69187 ) ( ON ?auto_69189 ?auto_69188 ) ( ON ?auto_69190 ?auto_69189 ) ( not ( = ?auto_69187 ?auto_69188 ) ) ( not ( = ?auto_69187 ?auto_69189 ) ) ( not ( = ?auto_69187 ?auto_69190 ) ) ( not ( = ?auto_69187 ?auto_69192 ) ) ( not ( = ?auto_69188 ?auto_69189 ) ) ( not ( = ?auto_69188 ?auto_69190 ) ) ( not ( = ?auto_69188 ?auto_69192 ) ) ( not ( = ?auto_69189 ?auto_69190 ) ) ( not ( = ?auto_69189 ?auto_69192 ) ) ( not ( = ?auto_69190 ?auto_69192 ) ) ( not ( = ?auto_69187 ?auto_69191 ) ) ( not ( = ?auto_69188 ?auto_69191 ) ) ( not ( = ?auto_69189 ?auto_69191 ) ) ( not ( = ?auto_69190 ?auto_69191 ) ) ( not ( = ?auto_69192 ?auto_69191 ) ) ( CLEAR ?auto_69192 ) ( ON ?auto_69191 ?auto_69193 ) ( CLEAR ?auto_69191 ) ( HAND-EMPTY ) ( not ( = ?auto_69187 ?auto_69193 ) ) ( not ( = ?auto_69188 ?auto_69193 ) ) ( not ( = ?auto_69189 ?auto_69193 ) ) ( not ( = ?auto_69190 ?auto_69193 ) ) ( not ( = ?auto_69192 ?auto_69193 ) ) ( not ( = ?auto_69191 ?auto_69193 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69191 ?auto_69193 )
      ( MAKE-4PILE ?auto_69187 ?auto_69188 ?auto_69189 ?auto_69190 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69208 - BLOCK
      ?auto_69209 - BLOCK
      ?auto_69210 - BLOCK
      ?auto_69211 - BLOCK
    )
    :vars
    (
      ?auto_69212 - BLOCK
      ?auto_69214 - BLOCK
      ?auto_69213 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69208 ) ( ON ?auto_69209 ?auto_69208 ) ( ON ?auto_69210 ?auto_69209 ) ( not ( = ?auto_69208 ?auto_69209 ) ) ( not ( = ?auto_69208 ?auto_69210 ) ) ( not ( = ?auto_69208 ?auto_69211 ) ) ( not ( = ?auto_69208 ?auto_69212 ) ) ( not ( = ?auto_69209 ?auto_69210 ) ) ( not ( = ?auto_69209 ?auto_69211 ) ) ( not ( = ?auto_69209 ?auto_69212 ) ) ( not ( = ?auto_69210 ?auto_69211 ) ) ( not ( = ?auto_69210 ?auto_69212 ) ) ( not ( = ?auto_69211 ?auto_69212 ) ) ( not ( = ?auto_69208 ?auto_69214 ) ) ( not ( = ?auto_69209 ?auto_69214 ) ) ( not ( = ?auto_69210 ?auto_69214 ) ) ( not ( = ?auto_69211 ?auto_69214 ) ) ( not ( = ?auto_69212 ?auto_69214 ) ) ( ON ?auto_69214 ?auto_69213 ) ( not ( = ?auto_69208 ?auto_69213 ) ) ( not ( = ?auto_69209 ?auto_69213 ) ) ( not ( = ?auto_69210 ?auto_69213 ) ) ( not ( = ?auto_69211 ?auto_69213 ) ) ( not ( = ?auto_69212 ?auto_69213 ) ) ( not ( = ?auto_69214 ?auto_69213 ) ) ( ON ?auto_69212 ?auto_69214 ) ( CLEAR ?auto_69212 ) ( HOLDING ?auto_69211 ) ( CLEAR ?auto_69210 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69208 ?auto_69209 ?auto_69210 ?auto_69211 ?auto_69212 )
      ( MAKE-4PILE ?auto_69208 ?auto_69209 ?auto_69210 ?auto_69211 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69215 - BLOCK
      ?auto_69216 - BLOCK
      ?auto_69217 - BLOCK
      ?auto_69218 - BLOCK
    )
    :vars
    (
      ?auto_69219 - BLOCK
      ?auto_69220 - BLOCK
      ?auto_69221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69215 ) ( ON ?auto_69216 ?auto_69215 ) ( ON ?auto_69217 ?auto_69216 ) ( not ( = ?auto_69215 ?auto_69216 ) ) ( not ( = ?auto_69215 ?auto_69217 ) ) ( not ( = ?auto_69215 ?auto_69218 ) ) ( not ( = ?auto_69215 ?auto_69219 ) ) ( not ( = ?auto_69216 ?auto_69217 ) ) ( not ( = ?auto_69216 ?auto_69218 ) ) ( not ( = ?auto_69216 ?auto_69219 ) ) ( not ( = ?auto_69217 ?auto_69218 ) ) ( not ( = ?auto_69217 ?auto_69219 ) ) ( not ( = ?auto_69218 ?auto_69219 ) ) ( not ( = ?auto_69215 ?auto_69220 ) ) ( not ( = ?auto_69216 ?auto_69220 ) ) ( not ( = ?auto_69217 ?auto_69220 ) ) ( not ( = ?auto_69218 ?auto_69220 ) ) ( not ( = ?auto_69219 ?auto_69220 ) ) ( ON ?auto_69220 ?auto_69221 ) ( not ( = ?auto_69215 ?auto_69221 ) ) ( not ( = ?auto_69216 ?auto_69221 ) ) ( not ( = ?auto_69217 ?auto_69221 ) ) ( not ( = ?auto_69218 ?auto_69221 ) ) ( not ( = ?auto_69219 ?auto_69221 ) ) ( not ( = ?auto_69220 ?auto_69221 ) ) ( ON ?auto_69219 ?auto_69220 ) ( CLEAR ?auto_69217 ) ( ON ?auto_69218 ?auto_69219 ) ( CLEAR ?auto_69218 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69221 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69221 ?auto_69220 ?auto_69219 )
      ( MAKE-4PILE ?auto_69215 ?auto_69216 ?auto_69217 ?auto_69218 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69222 - BLOCK
      ?auto_69223 - BLOCK
      ?auto_69224 - BLOCK
      ?auto_69225 - BLOCK
    )
    :vars
    (
      ?auto_69226 - BLOCK
      ?auto_69228 - BLOCK
      ?auto_69227 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69222 ) ( ON ?auto_69223 ?auto_69222 ) ( not ( = ?auto_69222 ?auto_69223 ) ) ( not ( = ?auto_69222 ?auto_69224 ) ) ( not ( = ?auto_69222 ?auto_69225 ) ) ( not ( = ?auto_69222 ?auto_69226 ) ) ( not ( = ?auto_69223 ?auto_69224 ) ) ( not ( = ?auto_69223 ?auto_69225 ) ) ( not ( = ?auto_69223 ?auto_69226 ) ) ( not ( = ?auto_69224 ?auto_69225 ) ) ( not ( = ?auto_69224 ?auto_69226 ) ) ( not ( = ?auto_69225 ?auto_69226 ) ) ( not ( = ?auto_69222 ?auto_69228 ) ) ( not ( = ?auto_69223 ?auto_69228 ) ) ( not ( = ?auto_69224 ?auto_69228 ) ) ( not ( = ?auto_69225 ?auto_69228 ) ) ( not ( = ?auto_69226 ?auto_69228 ) ) ( ON ?auto_69228 ?auto_69227 ) ( not ( = ?auto_69222 ?auto_69227 ) ) ( not ( = ?auto_69223 ?auto_69227 ) ) ( not ( = ?auto_69224 ?auto_69227 ) ) ( not ( = ?auto_69225 ?auto_69227 ) ) ( not ( = ?auto_69226 ?auto_69227 ) ) ( not ( = ?auto_69228 ?auto_69227 ) ) ( ON ?auto_69226 ?auto_69228 ) ( ON ?auto_69225 ?auto_69226 ) ( CLEAR ?auto_69225 ) ( ON-TABLE ?auto_69227 ) ( HOLDING ?auto_69224 ) ( CLEAR ?auto_69223 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69222 ?auto_69223 ?auto_69224 )
      ( MAKE-4PILE ?auto_69222 ?auto_69223 ?auto_69224 ?auto_69225 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69229 - BLOCK
      ?auto_69230 - BLOCK
      ?auto_69231 - BLOCK
      ?auto_69232 - BLOCK
    )
    :vars
    (
      ?auto_69234 - BLOCK
      ?auto_69233 - BLOCK
      ?auto_69235 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69229 ) ( ON ?auto_69230 ?auto_69229 ) ( not ( = ?auto_69229 ?auto_69230 ) ) ( not ( = ?auto_69229 ?auto_69231 ) ) ( not ( = ?auto_69229 ?auto_69232 ) ) ( not ( = ?auto_69229 ?auto_69234 ) ) ( not ( = ?auto_69230 ?auto_69231 ) ) ( not ( = ?auto_69230 ?auto_69232 ) ) ( not ( = ?auto_69230 ?auto_69234 ) ) ( not ( = ?auto_69231 ?auto_69232 ) ) ( not ( = ?auto_69231 ?auto_69234 ) ) ( not ( = ?auto_69232 ?auto_69234 ) ) ( not ( = ?auto_69229 ?auto_69233 ) ) ( not ( = ?auto_69230 ?auto_69233 ) ) ( not ( = ?auto_69231 ?auto_69233 ) ) ( not ( = ?auto_69232 ?auto_69233 ) ) ( not ( = ?auto_69234 ?auto_69233 ) ) ( ON ?auto_69233 ?auto_69235 ) ( not ( = ?auto_69229 ?auto_69235 ) ) ( not ( = ?auto_69230 ?auto_69235 ) ) ( not ( = ?auto_69231 ?auto_69235 ) ) ( not ( = ?auto_69232 ?auto_69235 ) ) ( not ( = ?auto_69234 ?auto_69235 ) ) ( not ( = ?auto_69233 ?auto_69235 ) ) ( ON ?auto_69234 ?auto_69233 ) ( ON ?auto_69232 ?auto_69234 ) ( ON-TABLE ?auto_69235 ) ( CLEAR ?auto_69230 ) ( ON ?auto_69231 ?auto_69232 ) ( CLEAR ?auto_69231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69235 ?auto_69233 ?auto_69234 ?auto_69232 )
      ( MAKE-4PILE ?auto_69229 ?auto_69230 ?auto_69231 ?auto_69232 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69236 - BLOCK
      ?auto_69237 - BLOCK
      ?auto_69238 - BLOCK
      ?auto_69239 - BLOCK
    )
    :vars
    (
      ?auto_69240 - BLOCK
      ?auto_69242 - BLOCK
      ?auto_69241 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69236 ) ( not ( = ?auto_69236 ?auto_69237 ) ) ( not ( = ?auto_69236 ?auto_69238 ) ) ( not ( = ?auto_69236 ?auto_69239 ) ) ( not ( = ?auto_69236 ?auto_69240 ) ) ( not ( = ?auto_69237 ?auto_69238 ) ) ( not ( = ?auto_69237 ?auto_69239 ) ) ( not ( = ?auto_69237 ?auto_69240 ) ) ( not ( = ?auto_69238 ?auto_69239 ) ) ( not ( = ?auto_69238 ?auto_69240 ) ) ( not ( = ?auto_69239 ?auto_69240 ) ) ( not ( = ?auto_69236 ?auto_69242 ) ) ( not ( = ?auto_69237 ?auto_69242 ) ) ( not ( = ?auto_69238 ?auto_69242 ) ) ( not ( = ?auto_69239 ?auto_69242 ) ) ( not ( = ?auto_69240 ?auto_69242 ) ) ( ON ?auto_69242 ?auto_69241 ) ( not ( = ?auto_69236 ?auto_69241 ) ) ( not ( = ?auto_69237 ?auto_69241 ) ) ( not ( = ?auto_69238 ?auto_69241 ) ) ( not ( = ?auto_69239 ?auto_69241 ) ) ( not ( = ?auto_69240 ?auto_69241 ) ) ( not ( = ?auto_69242 ?auto_69241 ) ) ( ON ?auto_69240 ?auto_69242 ) ( ON ?auto_69239 ?auto_69240 ) ( ON-TABLE ?auto_69241 ) ( ON ?auto_69238 ?auto_69239 ) ( CLEAR ?auto_69238 ) ( HOLDING ?auto_69237 ) ( CLEAR ?auto_69236 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69236 ?auto_69237 )
      ( MAKE-4PILE ?auto_69236 ?auto_69237 ?auto_69238 ?auto_69239 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69243 - BLOCK
      ?auto_69244 - BLOCK
      ?auto_69245 - BLOCK
      ?auto_69246 - BLOCK
    )
    :vars
    (
      ?auto_69249 - BLOCK
      ?auto_69248 - BLOCK
      ?auto_69247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69243 ) ( not ( = ?auto_69243 ?auto_69244 ) ) ( not ( = ?auto_69243 ?auto_69245 ) ) ( not ( = ?auto_69243 ?auto_69246 ) ) ( not ( = ?auto_69243 ?auto_69249 ) ) ( not ( = ?auto_69244 ?auto_69245 ) ) ( not ( = ?auto_69244 ?auto_69246 ) ) ( not ( = ?auto_69244 ?auto_69249 ) ) ( not ( = ?auto_69245 ?auto_69246 ) ) ( not ( = ?auto_69245 ?auto_69249 ) ) ( not ( = ?auto_69246 ?auto_69249 ) ) ( not ( = ?auto_69243 ?auto_69248 ) ) ( not ( = ?auto_69244 ?auto_69248 ) ) ( not ( = ?auto_69245 ?auto_69248 ) ) ( not ( = ?auto_69246 ?auto_69248 ) ) ( not ( = ?auto_69249 ?auto_69248 ) ) ( ON ?auto_69248 ?auto_69247 ) ( not ( = ?auto_69243 ?auto_69247 ) ) ( not ( = ?auto_69244 ?auto_69247 ) ) ( not ( = ?auto_69245 ?auto_69247 ) ) ( not ( = ?auto_69246 ?auto_69247 ) ) ( not ( = ?auto_69249 ?auto_69247 ) ) ( not ( = ?auto_69248 ?auto_69247 ) ) ( ON ?auto_69249 ?auto_69248 ) ( ON ?auto_69246 ?auto_69249 ) ( ON-TABLE ?auto_69247 ) ( ON ?auto_69245 ?auto_69246 ) ( CLEAR ?auto_69243 ) ( ON ?auto_69244 ?auto_69245 ) ( CLEAR ?auto_69244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69247 ?auto_69248 ?auto_69249 ?auto_69246 ?auto_69245 )
      ( MAKE-4PILE ?auto_69243 ?auto_69244 ?auto_69245 ?auto_69246 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69250 - BLOCK
      ?auto_69251 - BLOCK
      ?auto_69252 - BLOCK
      ?auto_69253 - BLOCK
    )
    :vars
    (
      ?auto_69255 - BLOCK
      ?auto_69256 - BLOCK
      ?auto_69254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69250 ?auto_69251 ) ) ( not ( = ?auto_69250 ?auto_69252 ) ) ( not ( = ?auto_69250 ?auto_69253 ) ) ( not ( = ?auto_69250 ?auto_69255 ) ) ( not ( = ?auto_69251 ?auto_69252 ) ) ( not ( = ?auto_69251 ?auto_69253 ) ) ( not ( = ?auto_69251 ?auto_69255 ) ) ( not ( = ?auto_69252 ?auto_69253 ) ) ( not ( = ?auto_69252 ?auto_69255 ) ) ( not ( = ?auto_69253 ?auto_69255 ) ) ( not ( = ?auto_69250 ?auto_69256 ) ) ( not ( = ?auto_69251 ?auto_69256 ) ) ( not ( = ?auto_69252 ?auto_69256 ) ) ( not ( = ?auto_69253 ?auto_69256 ) ) ( not ( = ?auto_69255 ?auto_69256 ) ) ( ON ?auto_69256 ?auto_69254 ) ( not ( = ?auto_69250 ?auto_69254 ) ) ( not ( = ?auto_69251 ?auto_69254 ) ) ( not ( = ?auto_69252 ?auto_69254 ) ) ( not ( = ?auto_69253 ?auto_69254 ) ) ( not ( = ?auto_69255 ?auto_69254 ) ) ( not ( = ?auto_69256 ?auto_69254 ) ) ( ON ?auto_69255 ?auto_69256 ) ( ON ?auto_69253 ?auto_69255 ) ( ON-TABLE ?auto_69254 ) ( ON ?auto_69252 ?auto_69253 ) ( ON ?auto_69251 ?auto_69252 ) ( CLEAR ?auto_69251 ) ( HOLDING ?auto_69250 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69250 )
      ( MAKE-4PILE ?auto_69250 ?auto_69251 ?auto_69252 ?auto_69253 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69257 - BLOCK
      ?auto_69258 - BLOCK
      ?auto_69259 - BLOCK
      ?auto_69260 - BLOCK
    )
    :vars
    (
      ?auto_69263 - BLOCK
      ?auto_69261 - BLOCK
      ?auto_69262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69257 ?auto_69258 ) ) ( not ( = ?auto_69257 ?auto_69259 ) ) ( not ( = ?auto_69257 ?auto_69260 ) ) ( not ( = ?auto_69257 ?auto_69263 ) ) ( not ( = ?auto_69258 ?auto_69259 ) ) ( not ( = ?auto_69258 ?auto_69260 ) ) ( not ( = ?auto_69258 ?auto_69263 ) ) ( not ( = ?auto_69259 ?auto_69260 ) ) ( not ( = ?auto_69259 ?auto_69263 ) ) ( not ( = ?auto_69260 ?auto_69263 ) ) ( not ( = ?auto_69257 ?auto_69261 ) ) ( not ( = ?auto_69258 ?auto_69261 ) ) ( not ( = ?auto_69259 ?auto_69261 ) ) ( not ( = ?auto_69260 ?auto_69261 ) ) ( not ( = ?auto_69263 ?auto_69261 ) ) ( ON ?auto_69261 ?auto_69262 ) ( not ( = ?auto_69257 ?auto_69262 ) ) ( not ( = ?auto_69258 ?auto_69262 ) ) ( not ( = ?auto_69259 ?auto_69262 ) ) ( not ( = ?auto_69260 ?auto_69262 ) ) ( not ( = ?auto_69263 ?auto_69262 ) ) ( not ( = ?auto_69261 ?auto_69262 ) ) ( ON ?auto_69263 ?auto_69261 ) ( ON ?auto_69260 ?auto_69263 ) ( ON-TABLE ?auto_69262 ) ( ON ?auto_69259 ?auto_69260 ) ( ON ?auto_69258 ?auto_69259 ) ( ON ?auto_69257 ?auto_69258 ) ( CLEAR ?auto_69257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69262 ?auto_69261 ?auto_69263 ?auto_69260 ?auto_69259 ?auto_69258 )
      ( MAKE-4PILE ?auto_69257 ?auto_69258 ?auto_69259 ?auto_69260 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69266 - BLOCK
      ?auto_69267 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69267 ) ( CLEAR ?auto_69266 ) ( ON-TABLE ?auto_69266 ) ( not ( = ?auto_69266 ?auto_69267 ) ) )
    :subtasks
    ( ( !STACK ?auto_69267 ?auto_69266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69268 - BLOCK
      ?auto_69269 - BLOCK
    )
    :vars
    (
      ?auto_69270 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69268 ) ( ON-TABLE ?auto_69268 ) ( not ( = ?auto_69268 ?auto_69269 ) ) ( ON ?auto_69269 ?auto_69270 ) ( CLEAR ?auto_69269 ) ( HAND-EMPTY ) ( not ( = ?auto_69268 ?auto_69270 ) ) ( not ( = ?auto_69269 ?auto_69270 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69269 ?auto_69270 )
      ( MAKE-2PILE ?auto_69268 ?auto_69269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69271 - BLOCK
      ?auto_69272 - BLOCK
    )
    :vars
    (
      ?auto_69273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69271 ?auto_69272 ) ) ( ON ?auto_69272 ?auto_69273 ) ( CLEAR ?auto_69272 ) ( not ( = ?auto_69271 ?auto_69273 ) ) ( not ( = ?auto_69272 ?auto_69273 ) ) ( HOLDING ?auto_69271 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69271 )
      ( MAKE-2PILE ?auto_69271 ?auto_69272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69274 - BLOCK
      ?auto_69275 - BLOCK
    )
    :vars
    (
      ?auto_69276 - BLOCK
      ?auto_69277 - BLOCK
      ?auto_69279 - BLOCK
      ?auto_69278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69274 ?auto_69275 ) ) ( ON ?auto_69275 ?auto_69276 ) ( not ( = ?auto_69274 ?auto_69276 ) ) ( not ( = ?auto_69275 ?auto_69276 ) ) ( ON ?auto_69274 ?auto_69275 ) ( CLEAR ?auto_69274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69277 ) ( ON ?auto_69279 ?auto_69277 ) ( ON ?auto_69278 ?auto_69279 ) ( ON ?auto_69276 ?auto_69278 ) ( not ( = ?auto_69277 ?auto_69279 ) ) ( not ( = ?auto_69277 ?auto_69278 ) ) ( not ( = ?auto_69277 ?auto_69276 ) ) ( not ( = ?auto_69277 ?auto_69275 ) ) ( not ( = ?auto_69277 ?auto_69274 ) ) ( not ( = ?auto_69279 ?auto_69278 ) ) ( not ( = ?auto_69279 ?auto_69276 ) ) ( not ( = ?auto_69279 ?auto_69275 ) ) ( not ( = ?auto_69279 ?auto_69274 ) ) ( not ( = ?auto_69278 ?auto_69276 ) ) ( not ( = ?auto_69278 ?auto_69275 ) ) ( not ( = ?auto_69278 ?auto_69274 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69277 ?auto_69279 ?auto_69278 ?auto_69276 ?auto_69275 )
      ( MAKE-2PILE ?auto_69274 ?auto_69275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69280 - BLOCK
      ?auto_69281 - BLOCK
    )
    :vars
    (
      ?auto_69285 - BLOCK
      ?auto_69283 - BLOCK
      ?auto_69282 - BLOCK
      ?auto_69284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69280 ?auto_69281 ) ) ( ON ?auto_69281 ?auto_69285 ) ( not ( = ?auto_69280 ?auto_69285 ) ) ( not ( = ?auto_69281 ?auto_69285 ) ) ( ON-TABLE ?auto_69283 ) ( ON ?auto_69282 ?auto_69283 ) ( ON ?auto_69284 ?auto_69282 ) ( ON ?auto_69285 ?auto_69284 ) ( not ( = ?auto_69283 ?auto_69282 ) ) ( not ( = ?auto_69283 ?auto_69284 ) ) ( not ( = ?auto_69283 ?auto_69285 ) ) ( not ( = ?auto_69283 ?auto_69281 ) ) ( not ( = ?auto_69283 ?auto_69280 ) ) ( not ( = ?auto_69282 ?auto_69284 ) ) ( not ( = ?auto_69282 ?auto_69285 ) ) ( not ( = ?auto_69282 ?auto_69281 ) ) ( not ( = ?auto_69282 ?auto_69280 ) ) ( not ( = ?auto_69284 ?auto_69285 ) ) ( not ( = ?auto_69284 ?auto_69281 ) ) ( not ( = ?auto_69284 ?auto_69280 ) ) ( HOLDING ?auto_69280 ) ( CLEAR ?auto_69281 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69283 ?auto_69282 ?auto_69284 ?auto_69285 ?auto_69281 ?auto_69280 )
      ( MAKE-2PILE ?auto_69280 ?auto_69281 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69286 - BLOCK
      ?auto_69287 - BLOCK
    )
    :vars
    (
      ?auto_69289 - BLOCK
      ?auto_69291 - BLOCK
      ?auto_69288 - BLOCK
      ?auto_69290 - BLOCK
      ?auto_69292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69286 ?auto_69287 ) ) ( ON ?auto_69287 ?auto_69289 ) ( not ( = ?auto_69286 ?auto_69289 ) ) ( not ( = ?auto_69287 ?auto_69289 ) ) ( ON-TABLE ?auto_69291 ) ( ON ?auto_69288 ?auto_69291 ) ( ON ?auto_69290 ?auto_69288 ) ( ON ?auto_69289 ?auto_69290 ) ( not ( = ?auto_69291 ?auto_69288 ) ) ( not ( = ?auto_69291 ?auto_69290 ) ) ( not ( = ?auto_69291 ?auto_69289 ) ) ( not ( = ?auto_69291 ?auto_69287 ) ) ( not ( = ?auto_69291 ?auto_69286 ) ) ( not ( = ?auto_69288 ?auto_69290 ) ) ( not ( = ?auto_69288 ?auto_69289 ) ) ( not ( = ?auto_69288 ?auto_69287 ) ) ( not ( = ?auto_69288 ?auto_69286 ) ) ( not ( = ?auto_69290 ?auto_69289 ) ) ( not ( = ?auto_69290 ?auto_69287 ) ) ( not ( = ?auto_69290 ?auto_69286 ) ) ( CLEAR ?auto_69287 ) ( ON ?auto_69286 ?auto_69292 ) ( CLEAR ?auto_69286 ) ( HAND-EMPTY ) ( not ( = ?auto_69286 ?auto_69292 ) ) ( not ( = ?auto_69287 ?auto_69292 ) ) ( not ( = ?auto_69289 ?auto_69292 ) ) ( not ( = ?auto_69291 ?auto_69292 ) ) ( not ( = ?auto_69288 ?auto_69292 ) ) ( not ( = ?auto_69290 ?auto_69292 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69286 ?auto_69292 )
      ( MAKE-2PILE ?auto_69286 ?auto_69287 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69293 - BLOCK
      ?auto_69294 - BLOCK
    )
    :vars
    (
      ?auto_69297 - BLOCK
      ?auto_69295 - BLOCK
      ?auto_69298 - BLOCK
      ?auto_69296 - BLOCK
      ?auto_69299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69293 ?auto_69294 ) ) ( not ( = ?auto_69293 ?auto_69297 ) ) ( not ( = ?auto_69294 ?auto_69297 ) ) ( ON-TABLE ?auto_69295 ) ( ON ?auto_69298 ?auto_69295 ) ( ON ?auto_69296 ?auto_69298 ) ( ON ?auto_69297 ?auto_69296 ) ( not ( = ?auto_69295 ?auto_69298 ) ) ( not ( = ?auto_69295 ?auto_69296 ) ) ( not ( = ?auto_69295 ?auto_69297 ) ) ( not ( = ?auto_69295 ?auto_69294 ) ) ( not ( = ?auto_69295 ?auto_69293 ) ) ( not ( = ?auto_69298 ?auto_69296 ) ) ( not ( = ?auto_69298 ?auto_69297 ) ) ( not ( = ?auto_69298 ?auto_69294 ) ) ( not ( = ?auto_69298 ?auto_69293 ) ) ( not ( = ?auto_69296 ?auto_69297 ) ) ( not ( = ?auto_69296 ?auto_69294 ) ) ( not ( = ?auto_69296 ?auto_69293 ) ) ( ON ?auto_69293 ?auto_69299 ) ( CLEAR ?auto_69293 ) ( not ( = ?auto_69293 ?auto_69299 ) ) ( not ( = ?auto_69294 ?auto_69299 ) ) ( not ( = ?auto_69297 ?auto_69299 ) ) ( not ( = ?auto_69295 ?auto_69299 ) ) ( not ( = ?auto_69298 ?auto_69299 ) ) ( not ( = ?auto_69296 ?auto_69299 ) ) ( HOLDING ?auto_69294 ) ( CLEAR ?auto_69297 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69295 ?auto_69298 ?auto_69296 ?auto_69297 ?auto_69294 )
      ( MAKE-2PILE ?auto_69293 ?auto_69294 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69300 - BLOCK
      ?auto_69301 - BLOCK
    )
    :vars
    (
      ?auto_69306 - BLOCK
      ?auto_69304 - BLOCK
      ?auto_69303 - BLOCK
      ?auto_69302 - BLOCK
      ?auto_69305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69300 ?auto_69301 ) ) ( not ( = ?auto_69300 ?auto_69306 ) ) ( not ( = ?auto_69301 ?auto_69306 ) ) ( ON-TABLE ?auto_69304 ) ( ON ?auto_69303 ?auto_69304 ) ( ON ?auto_69302 ?auto_69303 ) ( ON ?auto_69306 ?auto_69302 ) ( not ( = ?auto_69304 ?auto_69303 ) ) ( not ( = ?auto_69304 ?auto_69302 ) ) ( not ( = ?auto_69304 ?auto_69306 ) ) ( not ( = ?auto_69304 ?auto_69301 ) ) ( not ( = ?auto_69304 ?auto_69300 ) ) ( not ( = ?auto_69303 ?auto_69302 ) ) ( not ( = ?auto_69303 ?auto_69306 ) ) ( not ( = ?auto_69303 ?auto_69301 ) ) ( not ( = ?auto_69303 ?auto_69300 ) ) ( not ( = ?auto_69302 ?auto_69306 ) ) ( not ( = ?auto_69302 ?auto_69301 ) ) ( not ( = ?auto_69302 ?auto_69300 ) ) ( ON ?auto_69300 ?auto_69305 ) ( not ( = ?auto_69300 ?auto_69305 ) ) ( not ( = ?auto_69301 ?auto_69305 ) ) ( not ( = ?auto_69306 ?auto_69305 ) ) ( not ( = ?auto_69304 ?auto_69305 ) ) ( not ( = ?auto_69303 ?auto_69305 ) ) ( not ( = ?auto_69302 ?auto_69305 ) ) ( CLEAR ?auto_69306 ) ( ON ?auto_69301 ?auto_69300 ) ( CLEAR ?auto_69301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69305 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69305 ?auto_69300 )
      ( MAKE-2PILE ?auto_69300 ?auto_69301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69307 - BLOCK
      ?auto_69308 - BLOCK
    )
    :vars
    (
      ?auto_69310 - BLOCK
      ?auto_69309 - BLOCK
      ?auto_69312 - BLOCK
      ?auto_69311 - BLOCK
      ?auto_69313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69307 ?auto_69308 ) ) ( not ( = ?auto_69307 ?auto_69310 ) ) ( not ( = ?auto_69308 ?auto_69310 ) ) ( ON-TABLE ?auto_69309 ) ( ON ?auto_69312 ?auto_69309 ) ( ON ?auto_69311 ?auto_69312 ) ( not ( = ?auto_69309 ?auto_69312 ) ) ( not ( = ?auto_69309 ?auto_69311 ) ) ( not ( = ?auto_69309 ?auto_69310 ) ) ( not ( = ?auto_69309 ?auto_69308 ) ) ( not ( = ?auto_69309 ?auto_69307 ) ) ( not ( = ?auto_69312 ?auto_69311 ) ) ( not ( = ?auto_69312 ?auto_69310 ) ) ( not ( = ?auto_69312 ?auto_69308 ) ) ( not ( = ?auto_69312 ?auto_69307 ) ) ( not ( = ?auto_69311 ?auto_69310 ) ) ( not ( = ?auto_69311 ?auto_69308 ) ) ( not ( = ?auto_69311 ?auto_69307 ) ) ( ON ?auto_69307 ?auto_69313 ) ( not ( = ?auto_69307 ?auto_69313 ) ) ( not ( = ?auto_69308 ?auto_69313 ) ) ( not ( = ?auto_69310 ?auto_69313 ) ) ( not ( = ?auto_69309 ?auto_69313 ) ) ( not ( = ?auto_69312 ?auto_69313 ) ) ( not ( = ?auto_69311 ?auto_69313 ) ) ( ON ?auto_69308 ?auto_69307 ) ( CLEAR ?auto_69308 ) ( ON-TABLE ?auto_69313 ) ( HOLDING ?auto_69310 ) ( CLEAR ?auto_69311 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69309 ?auto_69312 ?auto_69311 ?auto_69310 )
      ( MAKE-2PILE ?auto_69307 ?auto_69308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69314 - BLOCK
      ?auto_69315 - BLOCK
    )
    :vars
    (
      ?auto_69318 - BLOCK
      ?auto_69317 - BLOCK
      ?auto_69319 - BLOCK
      ?auto_69316 - BLOCK
      ?auto_69320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69314 ?auto_69315 ) ) ( not ( = ?auto_69314 ?auto_69318 ) ) ( not ( = ?auto_69315 ?auto_69318 ) ) ( ON-TABLE ?auto_69317 ) ( ON ?auto_69319 ?auto_69317 ) ( ON ?auto_69316 ?auto_69319 ) ( not ( = ?auto_69317 ?auto_69319 ) ) ( not ( = ?auto_69317 ?auto_69316 ) ) ( not ( = ?auto_69317 ?auto_69318 ) ) ( not ( = ?auto_69317 ?auto_69315 ) ) ( not ( = ?auto_69317 ?auto_69314 ) ) ( not ( = ?auto_69319 ?auto_69316 ) ) ( not ( = ?auto_69319 ?auto_69318 ) ) ( not ( = ?auto_69319 ?auto_69315 ) ) ( not ( = ?auto_69319 ?auto_69314 ) ) ( not ( = ?auto_69316 ?auto_69318 ) ) ( not ( = ?auto_69316 ?auto_69315 ) ) ( not ( = ?auto_69316 ?auto_69314 ) ) ( ON ?auto_69314 ?auto_69320 ) ( not ( = ?auto_69314 ?auto_69320 ) ) ( not ( = ?auto_69315 ?auto_69320 ) ) ( not ( = ?auto_69318 ?auto_69320 ) ) ( not ( = ?auto_69317 ?auto_69320 ) ) ( not ( = ?auto_69319 ?auto_69320 ) ) ( not ( = ?auto_69316 ?auto_69320 ) ) ( ON ?auto_69315 ?auto_69314 ) ( ON-TABLE ?auto_69320 ) ( CLEAR ?auto_69316 ) ( ON ?auto_69318 ?auto_69315 ) ( CLEAR ?auto_69318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69320 ?auto_69314 ?auto_69315 )
      ( MAKE-2PILE ?auto_69314 ?auto_69315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69321 - BLOCK
      ?auto_69322 - BLOCK
    )
    :vars
    (
      ?auto_69326 - BLOCK
      ?auto_69324 - BLOCK
      ?auto_69327 - BLOCK
      ?auto_69323 - BLOCK
      ?auto_69325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69321 ?auto_69322 ) ) ( not ( = ?auto_69321 ?auto_69326 ) ) ( not ( = ?auto_69322 ?auto_69326 ) ) ( ON-TABLE ?auto_69324 ) ( ON ?auto_69327 ?auto_69324 ) ( not ( = ?auto_69324 ?auto_69327 ) ) ( not ( = ?auto_69324 ?auto_69323 ) ) ( not ( = ?auto_69324 ?auto_69326 ) ) ( not ( = ?auto_69324 ?auto_69322 ) ) ( not ( = ?auto_69324 ?auto_69321 ) ) ( not ( = ?auto_69327 ?auto_69323 ) ) ( not ( = ?auto_69327 ?auto_69326 ) ) ( not ( = ?auto_69327 ?auto_69322 ) ) ( not ( = ?auto_69327 ?auto_69321 ) ) ( not ( = ?auto_69323 ?auto_69326 ) ) ( not ( = ?auto_69323 ?auto_69322 ) ) ( not ( = ?auto_69323 ?auto_69321 ) ) ( ON ?auto_69321 ?auto_69325 ) ( not ( = ?auto_69321 ?auto_69325 ) ) ( not ( = ?auto_69322 ?auto_69325 ) ) ( not ( = ?auto_69326 ?auto_69325 ) ) ( not ( = ?auto_69324 ?auto_69325 ) ) ( not ( = ?auto_69327 ?auto_69325 ) ) ( not ( = ?auto_69323 ?auto_69325 ) ) ( ON ?auto_69322 ?auto_69321 ) ( ON-TABLE ?auto_69325 ) ( ON ?auto_69326 ?auto_69322 ) ( CLEAR ?auto_69326 ) ( HOLDING ?auto_69323 ) ( CLEAR ?auto_69327 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69324 ?auto_69327 ?auto_69323 )
      ( MAKE-2PILE ?auto_69321 ?auto_69322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69328 - BLOCK
      ?auto_69329 - BLOCK
    )
    :vars
    (
      ?auto_69334 - BLOCK
      ?auto_69331 - BLOCK
      ?auto_69330 - BLOCK
      ?auto_69332 - BLOCK
      ?auto_69333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69328 ?auto_69329 ) ) ( not ( = ?auto_69328 ?auto_69334 ) ) ( not ( = ?auto_69329 ?auto_69334 ) ) ( ON-TABLE ?auto_69331 ) ( ON ?auto_69330 ?auto_69331 ) ( not ( = ?auto_69331 ?auto_69330 ) ) ( not ( = ?auto_69331 ?auto_69332 ) ) ( not ( = ?auto_69331 ?auto_69334 ) ) ( not ( = ?auto_69331 ?auto_69329 ) ) ( not ( = ?auto_69331 ?auto_69328 ) ) ( not ( = ?auto_69330 ?auto_69332 ) ) ( not ( = ?auto_69330 ?auto_69334 ) ) ( not ( = ?auto_69330 ?auto_69329 ) ) ( not ( = ?auto_69330 ?auto_69328 ) ) ( not ( = ?auto_69332 ?auto_69334 ) ) ( not ( = ?auto_69332 ?auto_69329 ) ) ( not ( = ?auto_69332 ?auto_69328 ) ) ( ON ?auto_69328 ?auto_69333 ) ( not ( = ?auto_69328 ?auto_69333 ) ) ( not ( = ?auto_69329 ?auto_69333 ) ) ( not ( = ?auto_69334 ?auto_69333 ) ) ( not ( = ?auto_69331 ?auto_69333 ) ) ( not ( = ?auto_69330 ?auto_69333 ) ) ( not ( = ?auto_69332 ?auto_69333 ) ) ( ON ?auto_69329 ?auto_69328 ) ( ON-TABLE ?auto_69333 ) ( ON ?auto_69334 ?auto_69329 ) ( CLEAR ?auto_69330 ) ( ON ?auto_69332 ?auto_69334 ) ( CLEAR ?auto_69332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69333 ?auto_69328 ?auto_69329 ?auto_69334 )
      ( MAKE-2PILE ?auto_69328 ?auto_69329 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69335 - BLOCK
      ?auto_69336 - BLOCK
    )
    :vars
    (
      ?auto_69340 - BLOCK
      ?auto_69341 - BLOCK
      ?auto_69339 - BLOCK
      ?auto_69337 - BLOCK
      ?auto_69338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69335 ?auto_69336 ) ) ( not ( = ?auto_69335 ?auto_69340 ) ) ( not ( = ?auto_69336 ?auto_69340 ) ) ( ON-TABLE ?auto_69341 ) ( not ( = ?auto_69341 ?auto_69339 ) ) ( not ( = ?auto_69341 ?auto_69337 ) ) ( not ( = ?auto_69341 ?auto_69340 ) ) ( not ( = ?auto_69341 ?auto_69336 ) ) ( not ( = ?auto_69341 ?auto_69335 ) ) ( not ( = ?auto_69339 ?auto_69337 ) ) ( not ( = ?auto_69339 ?auto_69340 ) ) ( not ( = ?auto_69339 ?auto_69336 ) ) ( not ( = ?auto_69339 ?auto_69335 ) ) ( not ( = ?auto_69337 ?auto_69340 ) ) ( not ( = ?auto_69337 ?auto_69336 ) ) ( not ( = ?auto_69337 ?auto_69335 ) ) ( ON ?auto_69335 ?auto_69338 ) ( not ( = ?auto_69335 ?auto_69338 ) ) ( not ( = ?auto_69336 ?auto_69338 ) ) ( not ( = ?auto_69340 ?auto_69338 ) ) ( not ( = ?auto_69341 ?auto_69338 ) ) ( not ( = ?auto_69339 ?auto_69338 ) ) ( not ( = ?auto_69337 ?auto_69338 ) ) ( ON ?auto_69336 ?auto_69335 ) ( ON-TABLE ?auto_69338 ) ( ON ?auto_69340 ?auto_69336 ) ( ON ?auto_69337 ?auto_69340 ) ( CLEAR ?auto_69337 ) ( HOLDING ?auto_69339 ) ( CLEAR ?auto_69341 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69341 ?auto_69339 )
      ( MAKE-2PILE ?auto_69335 ?auto_69336 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69342 - BLOCK
      ?auto_69343 - BLOCK
    )
    :vars
    (
      ?auto_69348 - BLOCK
      ?auto_69344 - BLOCK
      ?auto_69345 - BLOCK
      ?auto_69347 - BLOCK
      ?auto_69346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69342 ?auto_69343 ) ) ( not ( = ?auto_69342 ?auto_69348 ) ) ( not ( = ?auto_69343 ?auto_69348 ) ) ( ON-TABLE ?auto_69344 ) ( not ( = ?auto_69344 ?auto_69345 ) ) ( not ( = ?auto_69344 ?auto_69347 ) ) ( not ( = ?auto_69344 ?auto_69348 ) ) ( not ( = ?auto_69344 ?auto_69343 ) ) ( not ( = ?auto_69344 ?auto_69342 ) ) ( not ( = ?auto_69345 ?auto_69347 ) ) ( not ( = ?auto_69345 ?auto_69348 ) ) ( not ( = ?auto_69345 ?auto_69343 ) ) ( not ( = ?auto_69345 ?auto_69342 ) ) ( not ( = ?auto_69347 ?auto_69348 ) ) ( not ( = ?auto_69347 ?auto_69343 ) ) ( not ( = ?auto_69347 ?auto_69342 ) ) ( ON ?auto_69342 ?auto_69346 ) ( not ( = ?auto_69342 ?auto_69346 ) ) ( not ( = ?auto_69343 ?auto_69346 ) ) ( not ( = ?auto_69348 ?auto_69346 ) ) ( not ( = ?auto_69344 ?auto_69346 ) ) ( not ( = ?auto_69345 ?auto_69346 ) ) ( not ( = ?auto_69347 ?auto_69346 ) ) ( ON ?auto_69343 ?auto_69342 ) ( ON-TABLE ?auto_69346 ) ( ON ?auto_69348 ?auto_69343 ) ( ON ?auto_69347 ?auto_69348 ) ( CLEAR ?auto_69344 ) ( ON ?auto_69345 ?auto_69347 ) ( CLEAR ?auto_69345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69346 ?auto_69342 ?auto_69343 ?auto_69348 ?auto_69347 )
      ( MAKE-2PILE ?auto_69342 ?auto_69343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69349 - BLOCK
      ?auto_69350 - BLOCK
    )
    :vars
    (
      ?auto_69351 - BLOCK
      ?auto_69353 - BLOCK
      ?auto_69355 - BLOCK
      ?auto_69352 - BLOCK
      ?auto_69354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69349 ?auto_69350 ) ) ( not ( = ?auto_69349 ?auto_69351 ) ) ( not ( = ?auto_69350 ?auto_69351 ) ) ( not ( = ?auto_69353 ?auto_69355 ) ) ( not ( = ?auto_69353 ?auto_69352 ) ) ( not ( = ?auto_69353 ?auto_69351 ) ) ( not ( = ?auto_69353 ?auto_69350 ) ) ( not ( = ?auto_69353 ?auto_69349 ) ) ( not ( = ?auto_69355 ?auto_69352 ) ) ( not ( = ?auto_69355 ?auto_69351 ) ) ( not ( = ?auto_69355 ?auto_69350 ) ) ( not ( = ?auto_69355 ?auto_69349 ) ) ( not ( = ?auto_69352 ?auto_69351 ) ) ( not ( = ?auto_69352 ?auto_69350 ) ) ( not ( = ?auto_69352 ?auto_69349 ) ) ( ON ?auto_69349 ?auto_69354 ) ( not ( = ?auto_69349 ?auto_69354 ) ) ( not ( = ?auto_69350 ?auto_69354 ) ) ( not ( = ?auto_69351 ?auto_69354 ) ) ( not ( = ?auto_69353 ?auto_69354 ) ) ( not ( = ?auto_69355 ?auto_69354 ) ) ( not ( = ?auto_69352 ?auto_69354 ) ) ( ON ?auto_69350 ?auto_69349 ) ( ON-TABLE ?auto_69354 ) ( ON ?auto_69351 ?auto_69350 ) ( ON ?auto_69352 ?auto_69351 ) ( ON ?auto_69355 ?auto_69352 ) ( CLEAR ?auto_69355 ) ( HOLDING ?auto_69353 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69353 )
      ( MAKE-2PILE ?auto_69349 ?auto_69350 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69356 - BLOCK
      ?auto_69357 - BLOCK
    )
    :vars
    (
      ?auto_69362 - BLOCK
      ?auto_69360 - BLOCK
      ?auto_69359 - BLOCK
      ?auto_69358 - BLOCK
      ?auto_69361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69356 ?auto_69357 ) ) ( not ( = ?auto_69356 ?auto_69362 ) ) ( not ( = ?auto_69357 ?auto_69362 ) ) ( not ( = ?auto_69360 ?auto_69359 ) ) ( not ( = ?auto_69360 ?auto_69358 ) ) ( not ( = ?auto_69360 ?auto_69362 ) ) ( not ( = ?auto_69360 ?auto_69357 ) ) ( not ( = ?auto_69360 ?auto_69356 ) ) ( not ( = ?auto_69359 ?auto_69358 ) ) ( not ( = ?auto_69359 ?auto_69362 ) ) ( not ( = ?auto_69359 ?auto_69357 ) ) ( not ( = ?auto_69359 ?auto_69356 ) ) ( not ( = ?auto_69358 ?auto_69362 ) ) ( not ( = ?auto_69358 ?auto_69357 ) ) ( not ( = ?auto_69358 ?auto_69356 ) ) ( ON ?auto_69356 ?auto_69361 ) ( not ( = ?auto_69356 ?auto_69361 ) ) ( not ( = ?auto_69357 ?auto_69361 ) ) ( not ( = ?auto_69362 ?auto_69361 ) ) ( not ( = ?auto_69360 ?auto_69361 ) ) ( not ( = ?auto_69359 ?auto_69361 ) ) ( not ( = ?auto_69358 ?auto_69361 ) ) ( ON ?auto_69357 ?auto_69356 ) ( ON-TABLE ?auto_69361 ) ( ON ?auto_69362 ?auto_69357 ) ( ON ?auto_69358 ?auto_69362 ) ( ON ?auto_69359 ?auto_69358 ) ( ON ?auto_69360 ?auto_69359 ) ( CLEAR ?auto_69360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69361 ?auto_69356 ?auto_69357 ?auto_69362 ?auto_69358 ?auto_69359 )
      ( MAKE-2PILE ?auto_69356 ?auto_69357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69366 - BLOCK
      ?auto_69367 - BLOCK
      ?auto_69368 - BLOCK
    )
    :vars
    (
      ?auto_69369 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69369 ?auto_69368 ) ( CLEAR ?auto_69369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69366 ) ( ON ?auto_69367 ?auto_69366 ) ( ON ?auto_69368 ?auto_69367 ) ( not ( = ?auto_69366 ?auto_69367 ) ) ( not ( = ?auto_69366 ?auto_69368 ) ) ( not ( = ?auto_69366 ?auto_69369 ) ) ( not ( = ?auto_69367 ?auto_69368 ) ) ( not ( = ?auto_69367 ?auto_69369 ) ) ( not ( = ?auto_69368 ?auto_69369 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69369 ?auto_69368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69370 - BLOCK
      ?auto_69371 - BLOCK
      ?auto_69372 - BLOCK
    )
    :vars
    (
      ?auto_69373 - BLOCK
      ?auto_69374 - BLOCK
      ?auto_69375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69373 ?auto_69372 ) ( CLEAR ?auto_69373 ) ( ON-TABLE ?auto_69370 ) ( ON ?auto_69371 ?auto_69370 ) ( ON ?auto_69372 ?auto_69371 ) ( not ( = ?auto_69370 ?auto_69371 ) ) ( not ( = ?auto_69370 ?auto_69372 ) ) ( not ( = ?auto_69370 ?auto_69373 ) ) ( not ( = ?auto_69371 ?auto_69372 ) ) ( not ( = ?auto_69371 ?auto_69373 ) ) ( not ( = ?auto_69372 ?auto_69373 ) ) ( HOLDING ?auto_69374 ) ( CLEAR ?auto_69375 ) ( not ( = ?auto_69370 ?auto_69374 ) ) ( not ( = ?auto_69370 ?auto_69375 ) ) ( not ( = ?auto_69371 ?auto_69374 ) ) ( not ( = ?auto_69371 ?auto_69375 ) ) ( not ( = ?auto_69372 ?auto_69374 ) ) ( not ( = ?auto_69372 ?auto_69375 ) ) ( not ( = ?auto_69373 ?auto_69374 ) ) ( not ( = ?auto_69373 ?auto_69375 ) ) ( not ( = ?auto_69374 ?auto_69375 ) ) )
    :subtasks
    ( ( !STACK ?auto_69374 ?auto_69375 )
      ( MAKE-3PILE ?auto_69370 ?auto_69371 ?auto_69372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69376 - BLOCK
      ?auto_69377 - BLOCK
      ?auto_69378 - BLOCK
    )
    :vars
    (
      ?auto_69381 - BLOCK
      ?auto_69379 - BLOCK
      ?auto_69380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69381 ?auto_69378 ) ( ON-TABLE ?auto_69376 ) ( ON ?auto_69377 ?auto_69376 ) ( ON ?auto_69378 ?auto_69377 ) ( not ( = ?auto_69376 ?auto_69377 ) ) ( not ( = ?auto_69376 ?auto_69378 ) ) ( not ( = ?auto_69376 ?auto_69381 ) ) ( not ( = ?auto_69377 ?auto_69378 ) ) ( not ( = ?auto_69377 ?auto_69381 ) ) ( not ( = ?auto_69378 ?auto_69381 ) ) ( CLEAR ?auto_69379 ) ( not ( = ?auto_69376 ?auto_69380 ) ) ( not ( = ?auto_69376 ?auto_69379 ) ) ( not ( = ?auto_69377 ?auto_69380 ) ) ( not ( = ?auto_69377 ?auto_69379 ) ) ( not ( = ?auto_69378 ?auto_69380 ) ) ( not ( = ?auto_69378 ?auto_69379 ) ) ( not ( = ?auto_69381 ?auto_69380 ) ) ( not ( = ?auto_69381 ?auto_69379 ) ) ( not ( = ?auto_69380 ?auto_69379 ) ) ( ON ?auto_69380 ?auto_69381 ) ( CLEAR ?auto_69380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69376 ?auto_69377 ?auto_69378 ?auto_69381 )
      ( MAKE-3PILE ?auto_69376 ?auto_69377 ?auto_69378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69382 - BLOCK
      ?auto_69383 - BLOCK
      ?auto_69384 - BLOCK
    )
    :vars
    (
      ?auto_69386 - BLOCK
      ?auto_69385 - BLOCK
      ?auto_69387 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69386 ?auto_69384 ) ( ON-TABLE ?auto_69382 ) ( ON ?auto_69383 ?auto_69382 ) ( ON ?auto_69384 ?auto_69383 ) ( not ( = ?auto_69382 ?auto_69383 ) ) ( not ( = ?auto_69382 ?auto_69384 ) ) ( not ( = ?auto_69382 ?auto_69386 ) ) ( not ( = ?auto_69383 ?auto_69384 ) ) ( not ( = ?auto_69383 ?auto_69386 ) ) ( not ( = ?auto_69384 ?auto_69386 ) ) ( not ( = ?auto_69382 ?auto_69385 ) ) ( not ( = ?auto_69382 ?auto_69387 ) ) ( not ( = ?auto_69383 ?auto_69385 ) ) ( not ( = ?auto_69383 ?auto_69387 ) ) ( not ( = ?auto_69384 ?auto_69385 ) ) ( not ( = ?auto_69384 ?auto_69387 ) ) ( not ( = ?auto_69386 ?auto_69385 ) ) ( not ( = ?auto_69386 ?auto_69387 ) ) ( not ( = ?auto_69385 ?auto_69387 ) ) ( ON ?auto_69385 ?auto_69386 ) ( CLEAR ?auto_69385 ) ( HOLDING ?auto_69387 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69387 )
      ( MAKE-3PILE ?auto_69382 ?auto_69383 ?auto_69384 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69388 - BLOCK
      ?auto_69389 - BLOCK
      ?auto_69390 - BLOCK
    )
    :vars
    (
      ?auto_69391 - BLOCK
      ?auto_69393 - BLOCK
      ?auto_69392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69391 ?auto_69390 ) ( ON-TABLE ?auto_69388 ) ( ON ?auto_69389 ?auto_69388 ) ( ON ?auto_69390 ?auto_69389 ) ( not ( = ?auto_69388 ?auto_69389 ) ) ( not ( = ?auto_69388 ?auto_69390 ) ) ( not ( = ?auto_69388 ?auto_69391 ) ) ( not ( = ?auto_69389 ?auto_69390 ) ) ( not ( = ?auto_69389 ?auto_69391 ) ) ( not ( = ?auto_69390 ?auto_69391 ) ) ( not ( = ?auto_69388 ?auto_69393 ) ) ( not ( = ?auto_69388 ?auto_69392 ) ) ( not ( = ?auto_69389 ?auto_69393 ) ) ( not ( = ?auto_69389 ?auto_69392 ) ) ( not ( = ?auto_69390 ?auto_69393 ) ) ( not ( = ?auto_69390 ?auto_69392 ) ) ( not ( = ?auto_69391 ?auto_69393 ) ) ( not ( = ?auto_69391 ?auto_69392 ) ) ( not ( = ?auto_69393 ?auto_69392 ) ) ( ON ?auto_69393 ?auto_69391 ) ( ON ?auto_69392 ?auto_69393 ) ( CLEAR ?auto_69392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69388 ?auto_69389 ?auto_69390 ?auto_69391 ?auto_69393 )
      ( MAKE-3PILE ?auto_69388 ?auto_69389 ?auto_69390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69394 - BLOCK
      ?auto_69395 - BLOCK
      ?auto_69396 - BLOCK
    )
    :vars
    (
      ?auto_69398 - BLOCK
      ?auto_69397 - BLOCK
      ?auto_69399 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69398 ?auto_69396 ) ( ON-TABLE ?auto_69394 ) ( ON ?auto_69395 ?auto_69394 ) ( ON ?auto_69396 ?auto_69395 ) ( not ( = ?auto_69394 ?auto_69395 ) ) ( not ( = ?auto_69394 ?auto_69396 ) ) ( not ( = ?auto_69394 ?auto_69398 ) ) ( not ( = ?auto_69395 ?auto_69396 ) ) ( not ( = ?auto_69395 ?auto_69398 ) ) ( not ( = ?auto_69396 ?auto_69398 ) ) ( not ( = ?auto_69394 ?auto_69397 ) ) ( not ( = ?auto_69394 ?auto_69399 ) ) ( not ( = ?auto_69395 ?auto_69397 ) ) ( not ( = ?auto_69395 ?auto_69399 ) ) ( not ( = ?auto_69396 ?auto_69397 ) ) ( not ( = ?auto_69396 ?auto_69399 ) ) ( not ( = ?auto_69398 ?auto_69397 ) ) ( not ( = ?auto_69398 ?auto_69399 ) ) ( not ( = ?auto_69397 ?auto_69399 ) ) ( ON ?auto_69397 ?auto_69398 ) ( HOLDING ?auto_69399 ) ( CLEAR ?auto_69397 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69394 ?auto_69395 ?auto_69396 ?auto_69398 ?auto_69397 ?auto_69399 )
      ( MAKE-3PILE ?auto_69394 ?auto_69395 ?auto_69396 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69400 - BLOCK
      ?auto_69401 - BLOCK
      ?auto_69402 - BLOCK
    )
    :vars
    (
      ?auto_69405 - BLOCK
      ?auto_69403 - BLOCK
      ?auto_69404 - BLOCK
      ?auto_69406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69405 ?auto_69402 ) ( ON-TABLE ?auto_69400 ) ( ON ?auto_69401 ?auto_69400 ) ( ON ?auto_69402 ?auto_69401 ) ( not ( = ?auto_69400 ?auto_69401 ) ) ( not ( = ?auto_69400 ?auto_69402 ) ) ( not ( = ?auto_69400 ?auto_69405 ) ) ( not ( = ?auto_69401 ?auto_69402 ) ) ( not ( = ?auto_69401 ?auto_69405 ) ) ( not ( = ?auto_69402 ?auto_69405 ) ) ( not ( = ?auto_69400 ?auto_69403 ) ) ( not ( = ?auto_69400 ?auto_69404 ) ) ( not ( = ?auto_69401 ?auto_69403 ) ) ( not ( = ?auto_69401 ?auto_69404 ) ) ( not ( = ?auto_69402 ?auto_69403 ) ) ( not ( = ?auto_69402 ?auto_69404 ) ) ( not ( = ?auto_69405 ?auto_69403 ) ) ( not ( = ?auto_69405 ?auto_69404 ) ) ( not ( = ?auto_69403 ?auto_69404 ) ) ( ON ?auto_69403 ?auto_69405 ) ( CLEAR ?auto_69403 ) ( ON ?auto_69404 ?auto_69406 ) ( CLEAR ?auto_69404 ) ( HAND-EMPTY ) ( not ( = ?auto_69400 ?auto_69406 ) ) ( not ( = ?auto_69401 ?auto_69406 ) ) ( not ( = ?auto_69402 ?auto_69406 ) ) ( not ( = ?auto_69405 ?auto_69406 ) ) ( not ( = ?auto_69403 ?auto_69406 ) ) ( not ( = ?auto_69404 ?auto_69406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69404 ?auto_69406 )
      ( MAKE-3PILE ?auto_69400 ?auto_69401 ?auto_69402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69407 - BLOCK
      ?auto_69408 - BLOCK
      ?auto_69409 - BLOCK
    )
    :vars
    (
      ?auto_69410 - BLOCK
      ?auto_69412 - BLOCK
      ?auto_69413 - BLOCK
      ?auto_69411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69410 ?auto_69409 ) ( ON-TABLE ?auto_69407 ) ( ON ?auto_69408 ?auto_69407 ) ( ON ?auto_69409 ?auto_69408 ) ( not ( = ?auto_69407 ?auto_69408 ) ) ( not ( = ?auto_69407 ?auto_69409 ) ) ( not ( = ?auto_69407 ?auto_69410 ) ) ( not ( = ?auto_69408 ?auto_69409 ) ) ( not ( = ?auto_69408 ?auto_69410 ) ) ( not ( = ?auto_69409 ?auto_69410 ) ) ( not ( = ?auto_69407 ?auto_69412 ) ) ( not ( = ?auto_69407 ?auto_69413 ) ) ( not ( = ?auto_69408 ?auto_69412 ) ) ( not ( = ?auto_69408 ?auto_69413 ) ) ( not ( = ?auto_69409 ?auto_69412 ) ) ( not ( = ?auto_69409 ?auto_69413 ) ) ( not ( = ?auto_69410 ?auto_69412 ) ) ( not ( = ?auto_69410 ?auto_69413 ) ) ( not ( = ?auto_69412 ?auto_69413 ) ) ( ON ?auto_69413 ?auto_69411 ) ( CLEAR ?auto_69413 ) ( not ( = ?auto_69407 ?auto_69411 ) ) ( not ( = ?auto_69408 ?auto_69411 ) ) ( not ( = ?auto_69409 ?auto_69411 ) ) ( not ( = ?auto_69410 ?auto_69411 ) ) ( not ( = ?auto_69412 ?auto_69411 ) ) ( not ( = ?auto_69413 ?auto_69411 ) ) ( HOLDING ?auto_69412 ) ( CLEAR ?auto_69410 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69407 ?auto_69408 ?auto_69409 ?auto_69410 ?auto_69412 )
      ( MAKE-3PILE ?auto_69407 ?auto_69408 ?auto_69409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69414 - BLOCK
      ?auto_69415 - BLOCK
      ?auto_69416 - BLOCK
    )
    :vars
    (
      ?auto_69418 - BLOCK
      ?auto_69419 - BLOCK
      ?auto_69417 - BLOCK
      ?auto_69420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69418 ?auto_69416 ) ( ON-TABLE ?auto_69414 ) ( ON ?auto_69415 ?auto_69414 ) ( ON ?auto_69416 ?auto_69415 ) ( not ( = ?auto_69414 ?auto_69415 ) ) ( not ( = ?auto_69414 ?auto_69416 ) ) ( not ( = ?auto_69414 ?auto_69418 ) ) ( not ( = ?auto_69415 ?auto_69416 ) ) ( not ( = ?auto_69415 ?auto_69418 ) ) ( not ( = ?auto_69416 ?auto_69418 ) ) ( not ( = ?auto_69414 ?auto_69419 ) ) ( not ( = ?auto_69414 ?auto_69417 ) ) ( not ( = ?auto_69415 ?auto_69419 ) ) ( not ( = ?auto_69415 ?auto_69417 ) ) ( not ( = ?auto_69416 ?auto_69419 ) ) ( not ( = ?auto_69416 ?auto_69417 ) ) ( not ( = ?auto_69418 ?auto_69419 ) ) ( not ( = ?auto_69418 ?auto_69417 ) ) ( not ( = ?auto_69419 ?auto_69417 ) ) ( ON ?auto_69417 ?auto_69420 ) ( not ( = ?auto_69414 ?auto_69420 ) ) ( not ( = ?auto_69415 ?auto_69420 ) ) ( not ( = ?auto_69416 ?auto_69420 ) ) ( not ( = ?auto_69418 ?auto_69420 ) ) ( not ( = ?auto_69419 ?auto_69420 ) ) ( not ( = ?auto_69417 ?auto_69420 ) ) ( CLEAR ?auto_69418 ) ( ON ?auto_69419 ?auto_69417 ) ( CLEAR ?auto_69419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69420 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69420 ?auto_69417 )
      ( MAKE-3PILE ?auto_69414 ?auto_69415 ?auto_69416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69435 - BLOCK
      ?auto_69436 - BLOCK
      ?auto_69437 - BLOCK
    )
    :vars
    (
      ?auto_69440 - BLOCK
      ?auto_69441 - BLOCK
      ?auto_69439 - BLOCK
      ?auto_69438 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69435 ) ( ON ?auto_69436 ?auto_69435 ) ( not ( = ?auto_69435 ?auto_69436 ) ) ( not ( = ?auto_69435 ?auto_69437 ) ) ( not ( = ?auto_69435 ?auto_69440 ) ) ( not ( = ?auto_69436 ?auto_69437 ) ) ( not ( = ?auto_69436 ?auto_69440 ) ) ( not ( = ?auto_69437 ?auto_69440 ) ) ( not ( = ?auto_69435 ?auto_69441 ) ) ( not ( = ?auto_69435 ?auto_69439 ) ) ( not ( = ?auto_69436 ?auto_69441 ) ) ( not ( = ?auto_69436 ?auto_69439 ) ) ( not ( = ?auto_69437 ?auto_69441 ) ) ( not ( = ?auto_69437 ?auto_69439 ) ) ( not ( = ?auto_69440 ?auto_69441 ) ) ( not ( = ?auto_69440 ?auto_69439 ) ) ( not ( = ?auto_69441 ?auto_69439 ) ) ( ON ?auto_69439 ?auto_69438 ) ( not ( = ?auto_69435 ?auto_69438 ) ) ( not ( = ?auto_69436 ?auto_69438 ) ) ( not ( = ?auto_69437 ?auto_69438 ) ) ( not ( = ?auto_69440 ?auto_69438 ) ) ( not ( = ?auto_69441 ?auto_69438 ) ) ( not ( = ?auto_69439 ?auto_69438 ) ) ( ON ?auto_69441 ?auto_69439 ) ( ON-TABLE ?auto_69438 ) ( ON ?auto_69440 ?auto_69441 ) ( CLEAR ?auto_69440 ) ( HOLDING ?auto_69437 ) ( CLEAR ?auto_69436 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69435 ?auto_69436 ?auto_69437 ?auto_69440 )
      ( MAKE-3PILE ?auto_69435 ?auto_69436 ?auto_69437 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69442 - BLOCK
      ?auto_69443 - BLOCK
      ?auto_69444 - BLOCK
    )
    :vars
    (
      ?auto_69446 - BLOCK
      ?auto_69445 - BLOCK
      ?auto_69448 - BLOCK
      ?auto_69447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69442 ) ( ON ?auto_69443 ?auto_69442 ) ( not ( = ?auto_69442 ?auto_69443 ) ) ( not ( = ?auto_69442 ?auto_69444 ) ) ( not ( = ?auto_69442 ?auto_69446 ) ) ( not ( = ?auto_69443 ?auto_69444 ) ) ( not ( = ?auto_69443 ?auto_69446 ) ) ( not ( = ?auto_69444 ?auto_69446 ) ) ( not ( = ?auto_69442 ?auto_69445 ) ) ( not ( = ?auto_69442 ?auto_69448 ) ) ( not ( = ?auto_69443 ?auto_69445 ) ) ( not ( = ?auto_69443 ?auto_69448 ) ) ( not ( = ?auto_69444 ?auto_69445 ) ) ( not ( = ?auto_69444 ?auto_69448 ) ) ( not ( = ?auto_69446 ?auto_69445 ) ) ( not ( = ?auto_69446 ?auto_69448 ) ) ( not ( = ?auto_69445 ?auto_69448 ) ) ( ON ?auto_69448 ?auto_69447 ) ( not ( = ?auto_69442 ?auto_69447 ) ) ( not ( = ?auto_69443 ?auto_69447 ) ) ( not ( = ?auto_69444 ?auto_69447 ) ) ( not ( = ?auto_69446 ?auto_69447 ) ) ( not ( = ?auto_69445 ?auto_69447 ) ) ( not ( = ?auto_69448 ?auto_69447 ) ) ( ON ?auto_69445 ?auto_69448 ) ( ON-TABLE ?auto_69447 ) ( ON ?auto_69446 ?auto_69445 ) ( CLEAR ?auto_69443 ) ( ON ?auto_69444 ?auto_69446 ) ( CLEAR ?auto_69444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69447 ?auto_69448 ?auto_69445 ?auto_69446 )
      ( MAKE-3PILE ?auto_69442 ?auto_69443 ?auto_69444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69449 - BLOCK
      ?auto_69450 - BLOCK
      ?auto_69451 - BLOCK
    )
    :vars
    (
      ?auto_69453 - BLOCK
      ?auto_69452 - BLOCK
      ?auto_69455 - BLOCK
      ?auto_69454 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69449 ) ( not ( = ?auto_69449 ?auto_69450 ) ) ( not ( = ?auto_69449 ?auto_69451 ) ) ( not ( = ?auto_69449 ?auto_69453 ) ) ( not ( = ?auto_69450 ?auto_69451 ) ) ( not ( = ?auto_69450 ?auto_69453 ) ) ( not ( = ?auto_69451 ?auto_69453 ) ) ( not ( = ?auto_69449 ?auto_69452 ) ) ( not ( = ?auto_69449 ?auto_69455 ) ) ( not ( = ?auto_69450 ?auto_69452 ) ) ( not ( = ?auto_69450 ?auto_69455 ) ) ( not ( = ?auto_69451 ?auto_69452 ) ) ( not ( = ?auto_69451 ?auto_69455 ) ) ( not ( = ?auto_69453 ?auto_69452 ) ) ( not ( = ?auto_69453 ?auto_69455 ) ) ( not ( = ?auto_69452 ?auto_69455 ) ) ( ON ?auto_69455 ?auto_69454 ) ( not ( = ?auto_69449 ?auto_69454 ) ) ( not ( = ?auto_69450 ?auto_69454 ) ) ( not ( = ?auto_69451 ?auto_69454 ) ) ( not ( = ?auto_69453 ?auto_69454 ) ) ( not ( = ?auto_69452 ?auto_69454 ) ) ( not ( = ?auto_69455 ?auto_69454 ) ) ( ON ?auto_69452 ?auto_69455 ) ( ON-TABLE ?auto_69454 ) ( ON ?auto_69453 ?auto_69452 ) ( ON ?auto_69451 ?auto_69453 ) ( CLEAR ?auto_69451 ) ( HOLDING ?auto_69450 ) ( CLEAR ?auto_69449 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69449 ?auto_69450 )
      ( MAKE-3PILE ?auto_69449 ?auto_69450 ?auto_69451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69456 - BLOCK
      ?auto_69457 - BLOCK
      ?auto_69458 - BLOCK
    )
    :vars
    (
      ?auto_69459 - BLOCK
      ?auto_69460 - BLOCK
      ?auto_69462 - BLOCK
      ?auto_69461 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69456 ) ( not ( = ?auto_69456 ?auto_69457 ) ) ( not ( = ?auto_69456 ?auto_69458 ) ) ( not ( = ?auto_69456 ?auto_69459 ) ) ( not ( = ?auto_69457 ?auto_69458 ) ) ( not ( = ?auto_69457 ?auto_69459 ) ) ( not ( = ?auto_69458 ?auto_69459 ) ) ( not ( = ?auto_69456 ?auto_69460 ) ) ( not ( = ?auto_69456 ?auto_69462 ) ) ( not ( = ?auto_69457 ?auto_69460 ) ) ( not ( = ?auto_69457 ?auto_69462 ) ) ( not ( = ?auto_69458 ?auto_69460 ) ) ( not ( = ?auto_69458 ?auto_69462 ) ) ( not ( = ?auto_69459 ?auto_69460 ) ) ( not ( = ?auto_69459 ?auto_69462 ) ) ( not ( = ?auto_69460 ?auto_69462 ) ) ( ON ?auto_69462 ?auto_69461 ) ( not ( = ?auto_69456 ?auto_69461 ) ) ( not ( = ?auto_69457 ?auto_69461 ) ) ( not ( = ?auto_69458 ?auto_69461 ) ) ( not ( = ?auto_69459 ?auto_69461 ) ) ( not ( = ?auto_69460 ?auto_69461 ) ) ( not ( = ?auto_69462 ?auto_69461 ) ) ( ON ?auto_69460 ?auto_69462 ) ( ON-TABLE ?auto_69461 ) ( ON ?auto_69459 ?auto_69460 ) ( ON ?auto_69458 ?auto_69459 ) ( CLEAR ?auto_69456 ) ( ON ?auto_69457 ?auto_69458 ) ( CLEAR ?auto_69457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69461 ?auto_69462 ?auto_69460 ?auto_69459 ?auto_69458 )
      ( MAKE-3PILE ?auto_69456 ?auto_69457 ?auto_69458 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69463 - BLOCK
      ?auto_69464 - BLOCK
      ?auto_69465 - BLOCK
    )
    :vars
    (
      ?auto_69469 - BLOCK
      ?auto_69467 - BLOCK
      ?auto_69468 - BLOCK
      ?auto_69466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69463 ?auto_69464 ) ) ( not ( = ?auto_69463 ?auto_69465 ) ) ( not ( = ?auto_69463 ?auto_69469 ) ) ( not ( = ?auto_69464 ?auto_69465 ) ) ( not ( = ?auto_69464 ?auto_69469 ) ) ( not ( = ?auto_69465 ?auto_69469 ) ) ( not ( = ?auto_69463 ?auto_69467 ) ) ( not ( = ?auto_69463 ?auto_69468 ) ) ( not ( = ?auto_69464 ?auto_69467 ) ) ( not ( = ?auto_69464 ?auto_69468 ) ) ( not ( = ?auto_69465 ?auto_69467 ) ) ( not ( = ?auto_69465 ?auto_69468 ) ) ( not ( = ?auto_69469 ?auto_69467 ) ) ( not ( = ?auto_69469 ?auto_69468 ) ) ( not ( = ?auto_69467 ?auto_69468 ) ) ( ON ?auto_69468 ?auto_69466 ) ( not ( = ?auto_69463 ?auto_69466 ) ) ( not ( = ?auto_69464 ?auto_69466 ) ) ( not ( = ?auto_69465 ?auto_69466 ) ) ( not ( = ?auto_69469 ?auto_69466 ) ) ( not ( = ?auto_69467 ?auto_69466 ) ) ( not ( = ?auto_69468 ?auto_69466 ) ) ( ON ?auto_69467 ?auto_69468 ) ( ON-TABLE ?auto_69466 ) ( ON ?auto_69469 ?auto_69467 ) ( ON ?auto_69465 ?auto_69469 ) ( ON ?auto_69464 ?auto_69465 ) ( CLEAR ?auto_69464 ) ( HOLDING ?auto_69463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69463 )
      ( MAKE-3PILE ?auto_69463 ?auto_69464 ?auto_69465 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69470 - BLOCK
      ?auto_69471 - BLOCK
      ?auto_69472 - BLOCK
    )
    :vars
    (
      ?auto_69476 - BLOCK
      ?auto_69475 - BLOCK
      ?auto_69474 - BLOCK
      ?auto_69473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69470 ?auto_69471 ) ) ( not ( = ?auto_69470 ?auto_69472 ) ) ( not ( = ?auto_69470 ?auto_69476 ) ) ( not ( = ?auto_69471 ?auto_69472 ) ) ( not ( = ?auto_69471 ?auto_69476 ) ) ( not ( = ?auto_69472 ?auto_69476 ) ) ( not ( = ?auto_69470 ?auto_69475 ) ) ( not ( = ?auto_69470 ?auto_69474 ) ) ( not ( = ?auto_69471 ?auto_69475 ) ) ( not ( = ?auto_69471 ?auto_69474 ) ) ( not ( = ?auto_69472 ?auto_69475 ) ) ( not ( = ?auto_69472 ?auto_69474 ) ) ( not ( = ?auto_69476 ?auto_69475 ) ) ( not ( = ?auto_69476 ?auto_69474 ) ) ( not ( = ?auto_69475 ?auto_69474 ) ) ( ON ?auto_69474 ?auto_69473 ) ( not ( = ?auto_69470 ?auto_69473 ) ) ( not ( = ?auto_69471 ?auto_69473 ) ) ( not ( = ?auto_69472 ?auto_69473 ) ) ( not ( = ?auto_69476 ?auto_69473 ) ) ( not ( = ?auto_69475 ?auto_69473 ) ) ( not ( = ?auto_69474 ?auto_69473 ) ) ( ON ?auto_69475 ?auto_69474 ) ( ON-TABLE ?auto_69473 ) ( ON ?auto_69476 ?auto_69475 ) ( ON ?auto_69472 ?auto_69476 ) ( ON ?auto_69471 ?auto_69472 ) ( ON ?auto_69470 ?auto_69471 ) ( CLEAR ?auto_69470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69473 ?auto_69474 ?auto_69475 ?auto_69476 ?auto_69472 ?auto_69471 )
      ( MAKE-3PILE ?auto_69470 ?auto_69471 ?auto_69472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69480 - BLOCK
      ?auto_69481 - BLOCK
      ?auto_69482 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69482 ) ( CLEAR ?auto_69481 ) ( ON-TABLE ?auto_69480 ) ( ON ?auto_69481 ?auto_69480 ) ( not ( = ?auto_69480 ?auto_69481 ) ) ( not ( = ?auto_69480 ?auto_69482 ) ) ( not ( = ?auto_69481 ?auto_69482 ) ) )
    :subtasks
    ( ( !STACK ?auto_69482 ?auto_69481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69483 - BLOCK
      ?auto_69484 - BLOCK
      ?auto_69485 - BLOCK
    )
    :vars
    (
      ?auto_69486 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69484 ) ( ON-TABLE ?auto_69483 ) ( ON ?auto_69484 ?auto_69483 ) ( not ( = ?auto_69483 ?auto_69484 ) ) ( not ( = ?auto_69483 ?auto_69485 ) ) ( not ( = ?auto_69484 ?auto_69485 ) ) ( ON ?auto_69485 ?auto_69486 ) ( CLEAR ?auto_69485 ) ( HAND-EMPTY ) ( not ( = ?auto_69483 ?auto_69486 ) ) ( not ( = ?auto_69484 ?auto_69486 ) ) ( not ( = ?auto_69485 ?auto_69486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69485 ?auto_69486 )
      ( MAKE-3PILE ?auto_69483 ?auto_69484 ?auto_69485 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69487 - BLOCK
      ?auto_69488 - BLOCK
      ?auto_69489 - BLOCK
    )
    :vars
    (
      ?auto_69490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69487 ) ( not ( = ?auto_69487 ?auto_69488 ) ) ( not ( = ?auto_69487 ?auto_69489 ) ) ( not ( = ?auto_69488 ?auto_69489 ) ) ( ON ?auto_69489 ?auto_69490 ) ( CLEAR ?auto_69489 ) ( not ( = ?auto_69487 ?auto_69490 ) ) ( not ( = ?auto_69488 ?auto_69490 ) ) ( not ( = ?auto_69489 ?auto_69490 ) ) ( HOLDING ?auto_69488 ) ( CLEAR ?auto_69487 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69487 ?auto_69488 )
      ( MAKE-3PILE ?auto_69487 ?auto_69488 ?auto_69489 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69491 - BLOCK
      ?auto_69492 - BLOCK
      ?auto_69493 - BLOCK
    )
    :vars
    (
      ?auto_69494 - BLOCK
      ?auto_69495 - BLOCK
      ?auto_69496 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69491 ) ( not ( = ?auto_69491 ?auto_69492 ) ) ( not ( = ?auto_69491 ?auto_69493 ) ) ( not ( = ?auto_69492 ?auto_69493 ) ) ( ON ?auto_69493 ?auto_69494 ) ( not ( = ?auto_69491 ?auto_69494 ) ) ( not ( = ?auto_69492 ?auto_69494 ) ) ( not ( = ?auto_69493 ?auto_69494 ) ) ( CLEAR ?auto_69491 ) ( ON ?auto_69492 ?auto_69493 ) ( CLEAR ?auto_69492 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69495 ) ( ON ?auto_69496 ?auto_69495 ) ( ON ?auto_69494 ?auto_69496 ) ( not ( = ?auto_69495 ?auto_69496 ) ) ( not ( = ?auto_69495 ?auto_69494 ) ) ( not ( = ?auto_69495 ?auto_69493 ) ) ( not ( = ?auto_69495 ?auto_69492 ) ) ( not ( = ?auto_69496 ?auto_69494 ) ) ( not ( = ?auto_69496 ?auto_69493 ) ) ( not ( = ?auto_69496 ?auto_69492 ) ) ( not ( = ?auto_69491 ?auto_69495 ) ) ( not ( = ?auto_69491 ?auto_69496 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69495 ?auto_69496 ?auto_69494 ?auto_69493 )
      ( MAKE-3PILE ?auto_69491 ?auto_69492 ?auto_69493 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69497 - BLOCK
      ?auto_69498 - BLOCK
      ?auto_69499 - BLOCK
    )
    :vars
    (
      ?auto_69502 - BLOCK
      ?auto_69501 - BLOCK
      ?auto_69500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69497 ?auto_69498 ) ) ( not ( = ?auto_69497 ?auto_69499 ) ) ( not ( = ?auto_69498 ?auto_69499 ) ) ( ON ?auto_69499 ?auto_69502 ) ( not ( = ?auto_69497 ?auto_69502 ) ) ( not ( = ?auto_69498 ?auto_69502 ) ) ( not ( = ?auto_69499 ?auto_69502 ) ) ( ON ?auto_69498 ?auto_69499 ) ( CLEAR ?auto_69498 ) ( ON-TABLE ?auto_69501 ) ( ON ?auto_69500 ?auto_69501 ) ( ON ?auto_69502 ?auto_69500 ) ( not ( = ?auto_69501 ?auto_69500 ) ) ( not ( = ?auto_69501 ?auto_69502 ) ) ( not ( = ?auto_69501 ?auto_69499 ) ) ( not ( = ?auto_69501 ?auto_69498 ) ) ( not ( = ?auto_69500 ?auto_69502 ) ) ( not ( = ?auto_69500 ?auto_69499 ) ) ( not ( = ?auto_69500 ?auto_69498 ) ) ( not ( = ?auto_69497 ?auto_69501 ) ) ( not ( = ?auto_69497 ?auto_69500 ) ) ( HOLDING ?auto_69497 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69497 )
      ( MAKE-3PILE ?auto_69497 ?auto_69498 ?auto_69499 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69503 - BLOCK
      ?auto_69504 - BLOCK
      ?auto_69505 - BLOCK
    )
    :vars
    (
      ?auto_69506 - BLOCK
      ?auto_69508 - BLOCK
      ?auto_69507 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69503 ?auto_69504 ) ) ( not ( = ?auto_69503 ?auto_69505 ) ) ( not ( = ?auto_69504 ?auto_69505 ) ) ( ON ?auto_69505 ?auto_69506 ) ( not ( = ?auto_69503 ?auto_69506 ) ) ( not ( = ?auto_69504 ?auto_69506 ) ) ( not ( = ?auto_69505 ?auto_69506 ) ) ( ON ?auto_69504 ?auto_69505 ) ( ON-TABLE ?auto_69508 ) ( ON ?auto_69507 ?auto_69508 ) ( ON ?auto_69506 ?auto_69507 ) ( not ( = ?auto_69508 ?auto_69507 ) ) ( not ( = ?auto_69508 ?auto_69506 ) ) ( not ( = ?auto_69508 ?auto_69505 ) ) ( not ( = ?auto_69508 ?auto_69504 ) ) ( not ( = ?auto_69507 ?auto_69506 ) ) ( not ( = ?auto_69507 ?auto_69505 ) ) ( not ( = ?auto_69507 ?auto_69504 ) ) ( not ( = ?auto_69503 ?auto_69508 ) ) ( not ( = ?auto_69503 ?auto_69507 ) ) ( ON ?auto_69503 ?auto_69504 ) ( CLEAR ?auto_69503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69508 ?auto_69507 ?auto_69506 ?auto_69505 ?auto_69504 )
      ( MAKE-3PILE ?auto_69503 ?auto_69504 ?auto_69505 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69509 - BLOCK
      ?auto_69510 - BLOCK
      ?auto_69511 - BLOCK
    )
    :vars
    (
      ?auto_69512 - BLOCK
      ?auto_69513 - BLOCK
      ?auto_69514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69509 ?auto_69510 ) ) ( not ( = ?auto_69509 ?auto_69511 ) ) ( not ( = ?auto_69510 ?auto_69511 ) ) ( ON ?auto_69511 ?auto_69512 ) ( not ( = ?auto_69509 ?auto_69512 ) ) ( not ( = ?auto_69510 ?auto_69512 ) ) ( not ( = ?auto_69511 ?auto_69512 ) ) ( ON ?auto_69510 ?auto_69511 ) ( ON-TABLE ?auto_69513 ) ( ON ?auto_69514 ?auto_69513 ) ( ON ?auto_69512 ?auto_69514 ) ( not ( = ?auto_69513 ?auto_69514 ) ) ( not ( = ?auto_69513 ?auto_69512 ) ) ( not ( = ?auto_69513 ?auto_69511 ) ) ( not ( = ?auto_69513 ?auto_69510 ) ) ( not ( = ?auto_69514 ?auto_69512 ) ) ( not ( = ?auto_69514 ?auto_69511 ) ) ( not ( = ?auto_69514 ?auto_69510 ) ) ( not ( = ?auto_69509 ?auto_69513 ) ) ( not ( = ?auto_69509 ?auto_69514 ) ) ( HOLDING ?auto_69509 ) ( CLEAR ?auto_69510 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69513 ?auto_69514 ?auto_69512 ?auto_69511 ?auto_69510 ?auto_69509 )
      ( MAKE-3PILE ?auto_69509 ?auto_69510 ?auto_69511 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69515 - BLOCK
      ?auto_69516 - BLOCK
      ?auto_69517 - BLOCK
    )
    :vars
    (
      ?auto_69519 - BLOCK
      ?auto_69520 - BLOCK
      ?auto_69518 - BLOCK
      ?auto_69521 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69515 ?auto_69516 ) ) ( not ( = ?auto_69515 ?auto_69517 ) ) ( not ( = ?auto_69516 ?auto_69517 ) ) ( ON ?auto_69517 ?auto_69519 ) ( not ( = ?auto_69515 ?auto_69519 ) ) ( not ( = ?auto_69516 ?auto_69519 ) ) ( not ( = ?auto_69517 ?auto_69519 ) ) ( ON ?auto_69516 ?auto_69517 ) ( ON-TABLE ?auto_69520 ) ( ON ?auto_69518 ?auto_69520 ) ( ON ?auto_69519 ?auto_69518 ) ( not ( = ?auto_69520 ?auto_69518 ) ) ( not ( = ?auto_69520 ?auto_69519 ) ) ( not ( = ?auto_69520 ?auto_69517 ) ) ( not ( = ?auto_69520 ?auto_69516 ) ) ( not ( = ?auto_69518 ?auto_69519 ) ) ( not ( = ?auto_69518 ?auto_69517 ) ) ( not ( = ?auto_69518 ?auto_69516 ) ) ( not ( = ?auto_69515 ?auto_69520 ) ) ( not ( = ?auto_69515 ?auto_69518 ) ) ( CLEAR ?auto_69516 ) ( ON ?auto_69515 ?auto_69521 ) ( CLEAR ?auto_69515 ) ( HAND-EMPTY ) ( not ( = ?auto_69515 ?auto_69521 ) ) ( not ( = ?auto_69516 ?auto_69521 ) ) ( not ( = ?auto_69517 ?auto_69521 ) ) ( not ( = ?auto_69519 ?auto_69521 ) ) ( not ( = ?auto_69520 ?auto_69521 ) ) ( not ( = ?auto_69518 ?auto_69521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69515 ?auto_69521 )
      ( MAKE-3PILE ?auto_69515 ?auto_69516 ?auto_69517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69522 - BLOCK
      ?auto_69523 - BLOCK
      ?auto_69524 - BLOCK
    )
    :vars
    (
      ?auto_69528 - BLOCK
      ?auto_69526 - BLOCK
      ?auto_69527 - BLOCK
      ?auto_69525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69522 ?auto_69523 ) ) ( not ( = ?auto_69522 ?auto_69524 ) ) ( not ( = ?auto_69523 ?auto_69524 ) ) ( ON ?auto_69524 ?auto_69528 ) ( not ( = ?auto_69522 ?auto_69528 ) ) ( not ( = ?auto_69523 ?auto_69528 ) ) ( not ( = ?auto_69524 ?auto_69528 ) ) ( ON-TABLE ?auto_69526 ) ( ON ?auto_69527 ?auto_69526 ) ( ON ?auto_69528 ?auto_69527 ) ( not ( = ?auto_69526 ?auto_69527 ) ) ( not ( = ?auto_69526 ?auto_69528 ) ) ( not ( = ?auto_69526 ?auto_69524 ) ) ( not ( = ?auto_69526 ?auto_69523 ) ) ( not ( = ?auto_69527 ?auto_69528 ) ) ( not ( = ?auto_69527 ?auto_69524 ) ) ( not ( = ?auto_69527 ?auto_69523 ) ) ( not ( = ?auto_69522 ?auto_69526 ) ) ( not ( = ?auto_69522 ?auto_69527 ) ) ( ON ?auto_69522 ?auto_69525 ) ( CLEAR ?auto_69522 ) ( not ( = ?auto_69522 ?auto_69525 ) ) ( not ( = ?auto_69523 ?auto_69525 ) ) ( not ( = ?auto_69524 ?auto_69525 ) ) ( not ( = ?auto_69528 ?auto_69525 ) ) ( not ( = ?auto_69526 ?auto_69525 ) ) ( not ( = ?auto_69527 ?auto_69525 ) ) ( HOLDING ?auto_69523 ) ( CLEAR ?auto_69524 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69526 ?auto_69527 ?auto_69528 ?auto_69524 ?auto_69523 )
      ( MAKE-3PILE ?auto_69522 ?auto_69523 ?auto_69524 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69529 - BLOCK
      ?auto_69530 - BLOCK
      ?auto_69531 - BLOCK
    )
    :vars
    (
      ?auto_69534 - BLOCK
      ?auto_69533 - BLOCK
      ?auto_69532 - BLOCK
      ?auto_69535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69529 ?auto_69530 ) ) ( not ( = ?auto_69529 ?auto_69531 ) ) ( not ( = ?auto_69530 ?auto_69531 ) ) ( ON ?auto_69531 ?auto_69534 ) ( not ( = ?auto_69529 ?auto_69534 ) ) ( not ( = ?auto_69530 ?auto_69534 ) ) ( not ( = ?auto_69531 ?auto_69534 ) ) ( ON-TABLE ?auto_69533 ) ( ON ?auto_69532 ?auto_69533 ) ( ON ?auto_69534 ?auto_69532 ) ( not ( = ?auto_69533 ?auto_69532 ) ) ( not ( = ?auto_69533 ?auto_69534 ) ) ( not ( = ?auto_69533 ?auto_69531 ) ) ( not ( = ?auto_69533 ?auto_69530 ) ) ( not ( = ?auto_69532 ?auto_69534 ) ) ( not ( = ?auto_69532 ?auto_69531 ) ) ( not ( = ?auto_69532 ?auto_69530 ) ) ( not ( = ?auto_69529 ?auto_69533 ) ) ( not ( = ?auto_69529 ?auto_69532 ) ) ( ON ?auto_69529 ?auto_69535 ) ( not ( = ?auto_69529 ?auto_69535 ) ) ( not ( = ?auto_69530 ?auto_69535 ) ) ( not ( = ?auto_69531 ?auto_69535 ) ) ( not ( = ?auto_69534 ?auto_69535 ) ) ( not ( = ?auto_69533 ?auto_69535 ) ) ( not ( = ?auto_69532 ?auto_69535 ) ) ( CLEAR ?auto_69531 ) ( ON ?auto_69530 ?auto_69529 ) ( CLEAR ?auto_69530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69535 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69535 ?auto_69529 )
      ( MAKE-3PILE ?auto_69529 ?auto_69530 ?auto_69531 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69536 - BLOCK
      ?auto_69537 - BLOCK
      ?auto_69538 - BLOCK
    )
    :vars
    (
      ?auto_69541 - BLOCK
      ?auto_69539 - BLOCK
      ?auto_69542 - BLOCK
      ?auto_69540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69536 ?auto_69537 ) ) ( not ( = ?auto_69536 ?auto_69538 ) ) ( not ( = ?auto_69537 ?auto_69538 ) ) ( not ( = ?auto_69536 ?auto_69541 ) ) ( not ( = ?auto_69537 ?auto_69541 ) ) ( not ( = ?auto_69538 ?auto_69541 ) ) ( ON-TABLE ?auto_69539 ) ( ON ?auto_69542 ?auto_69539 ) ( ON ?auto_69541 ?auto_69542 ) ( not ( = ?auto_69539 ?auto_69542 ) ) ( not ( = ?auto_69539 ?auto_69541 ) ) ( not ( = ?auto_69539 ?auto_69538 ) ) ( not ( = ?auto_69539 ?auto_69537 ) ) ( not ( = ?auto_69542 ?auto_69541 ) ) ( not ( = ?auto_69542 ?auto_69538 ) ) ( not ( = ?auto_69542 ?auto_69537 ) ) ( not ( = ?auto_69536 ?auto_69539 ) ) ( not ( = ?auto_69536 ?auto_69542 ) ) ( ON ?auto_69536 ?auto_69540 ) ( not ( = ?auto_69536 ?auto_69540 ) ) ( not ( = ?auto_69537 ?auto_69540 ) ) ( not ( = ?auto_69538 ?auto_69540 ) ) ( not ( = ?auto_69541 ?auto_69540 ) ) ( not ( = ?auto_69539 ?auto_69540 ) ) ( not ( = ?auto_69542 ?auto_69540 ) ) ( ON ?auto_69537 ?auto_69536 ) ( CLEAR ?auto_69537 ) ( ON-TABLE ?auto_69540 ) ( HOLDING ?auto_69538 ) ( CLEAR ?auto_69541 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69539 ?auto_69542 ?auto_69541 ?auto_69538 )
      ( MAKE-3PILE ?auto_69536 ?auto_69537 ?auto_69538 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69543 - BLOCK
      ?auto_69544 - BLOCK
      ?auto_69545 - BLOCK
    )
    :vars
    (
      ?auto_69548 - BLOCK
      ?auto_69549 - BLOCK
      ?auto_69547 - BLOCK
      ?auto_69546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69543 ?auto_69544 ) ) ( not ( = ?auto_69543 ?auto_69545 ) ) ( not ( = ?auto_69544 ?auto_69545 ) ) ( not ( = ?auto_69543 ?auto_69548 ) ) ( not ( = ?auto_69544 ?auto_69548 ) ) ( not ( = ?auto_69545 ?auto_69548 ) ) ( ON-TABLE ?auto_69549 ) ( ON ?auto_69547 ?auto_69549 ) ( ON ?auto_69548 ?auto_69547 ) ( not ( = ?auto_69549 ?auto_69547 ) ) ( not ( = ?auto_69549 ?auto_69548 ) ) ( not ( = ?auto_69549 ?auto_69545 ) ) ( not ( = ?auto_69549 ?auto_69544 ) ) ( not ( = ?auto_69547 ?auto_69548 ) ) ( not ( = ?auto_69547 ?auto_69545 ) ) ( not ( = ?auto_69547 ?auto_69544 ) ) ( not ( = ?auto_69543 ?auto_69549 ) ) ( not ( = ?auto_69543 ?auto_69547 ) ) ( ON ?auto_69543 ?auto_69546 ) ( not ( = ?auto_69543 ?auto_69546 ) ) ( not ( = ?auto_69544 ?auto_69546 ) ) ( not ( = ?auto_69545 ?auto_69546 ) ) ( not ( = ?auto_69548 ?auto_69546 ) ) ( not ( = ?auto_69549 ?auto_69546 ) ) ( not ( = ?auto_69547 ?auto_69546 ) ) ( ON ?auto_69544 ?auto_69543 ) ( ON-TABLE ?auto_69546 ) ( CLEAR ?auto_69548 ) ( ON ?auto_69545 ?auto_69544 ) ( CLEAR ?auto_69545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69546 ?auto_69543 ?auto_69544 )
      ( MAKE-3PILE ?auto_69543 ?auto_69544 ?auto_69545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69550 - BLOCK
      ?auto_69551 - BLOCK
      ?auto_69552 - BLOCK
    )
    :vars
    (
      ?auto_69555 - BLOCK
      ?auto_69554 - BLOCK
      ?auto_69556 - BLOCK
      ?auto_69553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69550 ?auto_69551 ) ) ( not ( = ?auto_69550 ?auto_69552 ) ) ( not ( = ?auto_69551 ?auto_69552 ) ) ( not ( = ?auto_69550 ?auto_69555 ) ) ( not ( = ?auto_69551 ?auto_69555 ) ) ( not ( = ?auto_69552 ?auto_69555 ) ) ( ON-TABLE ?auto_69554 ) ( ON ?auto_69556 ?auto_69554 ) ( not ( = ?auto_69554 ?auto_69556 ) ) ( not ( = ?auto_69554 ?auto_69555 ) ) ( not ( = ?auto_69554 ?auto_69552 ) ) ( not ( = ?auto_69554 ?auto_69551 ) ) ( not ( = ?auto_69556 ?auto_69555 ) ) ( not ( = ?auto_69556 ?auto_69552 ) ) ( not ( = ?auto_69556 ?auto_69551 ) ) ( not ( = ?auto_69550 ?auto_69554 ) ) ( not ( = ?auto_69550 ?auto_69556 ) ) ( ON ?auto_69550 ?auto_69553 ) ( not ( = ?auto_69550 ?auto_69553 ) ) ( not ( = ?auto_69551 ?auto_69553 ) ) ( not ( = ?auto_69552 ?auto_69553 ) ) ( not ( = ?auto_69555 ?auto_69553 ) ) ( not ( = ?auto_69554 ?auto_69553 ) ) ( not ( = ?auto_69556 ?auto_69553 ) ) ( ON ?auto_69551 ?auto_69550 ) ( ON-TABLE ?auto_69553 ) ( ON ?auto_69552 ?auto_69551 ) ( CLEAR ?auto_69552 ) ( HOLDING ?auto_69555 ) ( CLEAR ?auto_69556 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69554 ?auto_69556 ?auto_69555 )
      ( MAKE-3PILE ?auto_69550 ?auto_69551 ?auto_69552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69557 - BLOCK
      ?auto_69558 - BLOCK
      ?auto_69559 - BLOCK
    )
    :vars
    (
      ?auto_69563 - BLOCK
      ?auto_69562 - BLOCK
      ?auto_69561 - BLOCK
      ?auto_69560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69557 ?auto_69558 ) ) ( not ( = ?auto_69557 ?auto_69559 ) ) ( not ( = ?auto_69558 ?auto_69559 ) ) ( not ( = ?auto_69557 ?auto_69563 ) ) ( not ( = ?auto_69558 ?auto_69563 ) ) ( not ( = ?auto_69559 ?auto_69563 ) ) ( ON-TABLE ?auto_69562 ) ( ON ?auto_69561 ?auto_69562 ) ( not ( = ?auto_69562 ?auto_69561 ) ) ( not ( = ?auto_69562 ?auto_69563 ) ) ( not ( = ?auto_69562 ?auto_69559 ) ) ( not ( = ?auto_69562 ?auto_69558 ) ) ( not ( = ?auto_69561 ?auto_69563 ) ) ( not ( = ?auto_69561 ?auto_69559 ) ) ( not ( = ?auto_69561 ?auto_69558 ) ) ( not ( = ?auto_69557 ?auto_69562 ) ) ( not ( = ?auto_69557 ?auto_69561 ) ) ( ON ?auto_69557 ?auto_69560 ) ( not ( = ?auto_69557 ?auto_69560 ) ) ( not ( = ?auto_69558 ?auto_69560 ) ) ( not ( = ?auto_69559 ?auto_69560 ) ) ( not ( = ?auto_69563 ?auto_69560 ) ) ( not ( = ?auto_69562 ?auto_69560 ) ) ( not ( = ?auto_69561 ?auto_69560 ) ) ( ON ?auto_69558 ?auto_69557 ) ( ON-TABLE ?auto_69560 ) ( ON ?auto_69559 ?auto_69558 ) ( CLEAR ?auto_69561 ) ( ON ?auto_69563 ?auto_69559 ) ( CLEAR ?auto_69563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69560 ?auto_69557 ?auto_69558 ?auto_69559 )
      ( MAKE-3PILE ?auto_69557 ?auto_69558 ?auto_69559 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69564 - BLOCK
      ?auto_69565 - BLOCK
      ?auto_69566 - BLOCK
    )
    :vars
    (
      ?auto_69569 - BLOCK
      ?auto_69568 - BLOCK
      ?auto_69570 - BLOCK
      ?auto_69567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69564 ?auto_69565 ) ) ( not ( = ?auto_69564 ?auto_69566 ) ) ( not ( = ?auto_69565 ?auto_69566 ) ) ( not ( = ?auto_69564 ?auto_69569 ) ) ( not ( = ?auto_69565 ?auto_69569 ) ) ( not ( = ?auto_69566 ?auto_69569 ) ) ( ON-TABLE ?auto_69568 ) ( not ( = ?auto_69568 ?auto_69570 ) ) ( not ( = ?auto_69568 ?auto_69569 ) ) ( not ( = ?auto_69568 ?auto_69566 ) ) ( not ( = ?auto_69568 ?auto_69565 ) ) ( not ( = ?auto_69570 ?auto_69569 ) ) ( not ( = ?auto_69570 ?auto_69566 ) ) ( not ( = ?auto_69570 ?auto_69565 ) ) ( not ( = ?auto_69564 ?auto_69568 ) ) ( not ( = ?auto_69564 ?auto_69570 ) ) ( ON ?auto_69564 ?auto_69567 ) ( not ( = ?auto_69564 ?auto_69567 ) ) ( not ( = ?auto_69565 ?auto_69567 ) ) ( not ( = ?auto_69566 ?auto_69567 ) ) ( not ( = ?auto_69569 ?auto_69567 ) ) ( not ( = ?auto_69568 ?auto_69567 ) ) ( not ( = ?auto_69570 ?auto_69567 ) ) ( ON ?auto_69565 ?auto_69564 ) ( ON-TABLE ?auto_69567 ) ( ON ?auto_69566 ?auto_69565 ) ( ON ?auto_69569 ?auto_69566 ) ( CLEAR ?auto_69569 ) ( HOLDING ?auto_69570 ) ( CLEAR ?auto_69568 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69568 ?auto_69570 )
      ( MAKE-3PILE ?auto_69564 ?auto_69565 ?auto_69566 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69571 - BLOCK
      ?auto_69572 - BLOCK
      ?auto_69573 - BLOCK
    )
    :vars
    (
      ?auto_69577 - BLOCK
      ?auto_69574 - BLOCK
      ?auto_69575 - BLOCK
      ?auto_69576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69571 ?auto_69572 ) ) ( not ( = ?auto_69571 ?auto_69573 ) ) ( not ( = ?auto_69572 ?auto_69573 ) ) ( not ( = ?auto_69571 ?auto_69577 ) ) ( not ( = ?auto_69572 ?auto_69577 ) ) ( not ( = ?auto_69573 ?auto_69577 ) ) ( ON-TABLE ?auto_69574 ) ( not ( = ?auto_69574 ?auto_69575 ) ) ( not ( = ?auto_69574 ?auto_69577 ) ) ( not ( = ?auto_69574 ?auto_69573 ) ) ( not ( = ?auto_69574 ?auto_69572 ) ) ( not ( = ?auto_69575 ?auto_69577 ) ) ( not ( = ?auto_69575 ?auto_69573 ) ) ( not ( = ?auto_69575 ?auto_69572 ) ) ( not ( = ?auto_69571 ?auto_69574 ) ) ( not ( = ?auto_69571 ?auto_69575 ) ) ( ON ?auto_69571 ?auto_69576 ) ( not ( = ?auto_69571 ?auto_69576 ) ) ( not ( = ?auto_69572 ?auto_69576 ) ) ( not ( = ?auto_69573 ?auto_69576 ) ) ( not ( = ?auto_69577 ?auto_69576 ) ) ( not ( = ?auto_69574 ?auto_69576 ) ) ( not ( = ?auto_69575 ?auto_69576 ) ) ( ON ?auto_69572 ?auto_69571 ) ( ON-TABLE ?auto_69576 ) ( ON ?auto_69573 ?auto_69572 ) ( ON ?auto_69577 ?auto_69573 ) ( CLEAR ?auto_69574 ) ( ON ?auto_69575 ?auto_69577 ) ( CLEAR ?auto_69575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69576 ?auto_69571 ?auto_69572 ?auto_69573 ?auto_69577 )
      ( MAKE-3PILE ?auto_69571 ?auto_69572 ?auto_69573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69578 - BLOCK
      ?auto_69579 - BLOCK
      ?auto_69580 - BLOCK
    )
    :vars
    (
      ?auto_69583 - BLOCK
      ?auto_69582 - BLOCK
      ?auto_69584 - BLOCK
      ?auto_69581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69578 ?auto_69579 ) ) ( not ( = ?auto_69578 ?auto_69580 ) ) ( not ( = ?auto_69579 ?auto_69580 ) ) ( not ( = ?auto_69578 ?auto_69583 ) ) ( not ( = ?auto_69579 ?auto_69583 ) ) ( not ( = ?auto_69580 ?auto_69583 ) ) ( not ( = ?auto_69582 ?auto_69584 ) ) ( not ( = ?auto_69582 ?auto_69583 ) ) ( not ( = ?auto_69582 ?auto_69580 ) ) ( not ( = ?auto_69582 ?auto_69579 ) ) ( not ( = ?auto_69584 ?auto_69583 ) ) ( not ( = ?auto_69584 ?auto_69580 ) ) ( not ( = ?auto_69584 ?auto_69579 ) ) ( not ( = ?auto_69578 ?auto_69582 ) ) ( not ( = ?auto_69578 ?auto_69584 ) ) ( ON ?auto_69578 ?auto_69581 ) ( not ( = ?auto_69578 ?auto_69581 ) ) ( not ( = ?auto_69579 ?auto_69581 ) ) ( not ( = ?auto_69580 ?auto_69581 ) ) ( not ( = ?auto_69583 ?auto_69581 ) ) ( not ( = ?auto_69582 ?auto_69581 ) ) ( not ( = ?auto_69584 ?auto_69581 ) ) ( ON ?auto_69579 ?auto_69578 ) ( ON-TABLE ?auto_69581 ) ( ON ?auto_69580 ?auto_69579 ) ( ON ?auto_69583 ?auto_69580 ) ( ON ?auto_69584 ?auto_69583 ) ( CLEAR ?auto_69584 ) ( HOLDING ?auto_69582 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69582 )
      ( MAKE-3PILE ?auto_69578 ?auto_69579 ?auto_69580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_69585 - BLOCK
      ?auto_69586 - BLOCK
      ?auto_69587 - BLOCK
    )
    :vars
    (
      ?auto_69589 - BLOCK
      ?auto_69591 - BLOCK
      ?auto_69588 - BLOCK
      ?auto_69590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69585 ?auto_69586 ) ) ( not ( = ?auto_69585 ?auto_69587 ) ) ( not ( = ?auto_69586 ?auto_69587 ) ) ( not ( = ?auto_69585 ?auto_69589 ) ) ( not ( = ?auto_69586 ?auto_69589 ) ) ( not ( = ?auto_69587 ?auto_69589 ) ) ( not ( = ?auto_69591 ?auto_69588 ) ) ( not ( = ?auto_69591 ?auto_69589 ) ) ( not ( = ?auto_69591 ?auto_69587 ) ) ( not ( = ?auto_69591 ?auto_69586 ) ) ( not ( = ?auto_69588 ?auto_69589 ) ) ( not ( = ?auto_69588 ?auto_69587 ) ) ( not ( = ?auto_69588 ?auto_69586 ) ) ( not ( = ?auto_69585 ?auto_69591 ) ) ( not ( = ?auto_69585 ?auto_69588 ) ) ( ON ?auto_69585 ?auto_69590 ) ( not ( = ?auto_69585 ?auto_69590 ) ) ( not ( = ?auto_69586 ?auto_69590 ) ) ( not ( = ?auto_69587 ?auto_69590 ) ) ( not ( = ?auto_69589 ?auto_69590 ) ) ( not ( = ?auto_69591 ?auto_69590 ) ) ( not ( = ?auto_69588 ?auto_69590 ) ) ( ON ?auto_69586 ?auto_69585 ) ( ON-TABLE ?auto_69590 ) ( ON ?auto_69587 ?auto_69586 ) ( ON ?auto_69589 ?auto_69587 ) ( ON ?auto_69588 ?auto_69589 ) ( ON ?auto_69591 ?auto_69588 ) ( CLEAR ?auto_69591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69590 ?auto_69585 ?auto_69586 ?auto_69587 ?auto_69589 ?auto_69588 )
      ( MAKE-3PILE ?auto_69585 ?auto_69586 ?auto_69587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69594 - BLOCK
      ?auto_69595 - BLOCK
    )
    :vars
    (
      ?auto_69596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69596 ?auto_69595 ) ( CLEAR ?auto_69596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69594 ) ( ON ?auto_69595 ?auto_69594 ) ( not ( = ?auto_69594 ?auto_69595 ) ) ( not ( = ?auto_69594 ?auto_69596 ) ) ( not ( = ?auto_69595 ?auto_69596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69596 ?auto_69595 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69597 - BLOCK
      ?auto_69598 - BLOCK
    )
    :vars
    (
      ?auto_69599 - BLOCK
      ?auto_69600 - BLOCK
      ?auto_69601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69599 ?auto_69598 ) ( CLEAR ?auto_69599 ) ( ON-TABLE ?auto_69597 ) ( ON ?auto_69598 ?auto_69597 ) ( not ( = ?auto_69597 ?auto_69598 ) ) ( not ( = ?auto_69597 ?auto_69599 ) ) ( not ( = ?auto_69598 ?auto_69599 ) ) ( HOLDING ?auto_69600 ) ( CLEAR ?auto_69601 ) ( not ( = ?auto_69597 ?auto_69600 ) ) ( not ( = ?auto_69597 ?auto_69601 ) ) ( not ( = ?auto_69598 ?auto_69600 ) ) ( not ( = ?auto_69598 ?auto_69601 ) ) ( not ( = ?auto_69599 ?auto_69600 ) ) ( not ( = ?auto_69599 ?auto_69601 ) ) ( not ( = ?auto_69600 ?auto_69601 ) ) )
    :subtasks
    ( ( !STACK ?auto_69600 ?auto_69601 )
      ( MAKE-2PILE ?auto_69597 ?auto_69598 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69602 - BLOCK
      ?auto_69603 - BLOCK
    )
    :vars
    (
      ?auto_69604 - BLOCK
      ?auto_69605 - BLOCK
      ?auto_69606 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69604 ?auto_69603 ) ( ON-TABLE ?auto_69602 ) ( ON ?auto_69603 ?auto_69602 ) ( not ( = ?auto_69602 ?auto_69603 ) ) ( not ( = ?auto_69602 ?auto_69604 ) ) ( not ( = ?auto_69603 ?auto_69604 ) ) ( CLEAR ?auto_69605 ) ( not ( = ?auto_69602 ?auto_69606 ) ) ( not ( = ?auto_69602 ?auto_69605 ) ) ( not ( = ?auto_69603 ?auto_69606 ) ) ( not ( = ?auto_69603 ?auto_69605 ) ) ( not ( = ?auto_69604 ?auto_69606 ) ) ( not ( = ?auto_69604 ?auto_69605 ) ) ( not ( = ?auto_69606 ?auto_69605 ) ) ( ON ?auto_69606 ?auto_69604 ) ( CLEAR ?auto_69606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69602 ?auto_69603 ?auto_69604 )
      ( MAKE-2PILE ?auto_69602 ?auto_69603 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69607 - BLOCK
      ?auto_69608 - BLOCK
    )
    :vars
    (
      ?auto_69609 - BLOCK
      ?auto_69610 - BLOCK
      ?auto_69611 - BLOCK
      ?auto_69612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69609 ?auto_69608 ) ( ON-TABLE ?auto_69607 ) ( ON ?auto_69608 ?auto_69607 ) ( not ( = ?auto_69607 ?auto_69608 ) ) ( not ( = ?auto_69607 ?auto_69609 ) ) ( not ( = ?auto_69608 ?auto_69609 ) ) ( not ( = ?auto_69607 ?auto_69610 ) ) ( not ( = ?auto_69607 ?auto_69611 ) ) ( not ( = ?auto_69608 ?auto_69610 ) ) ( not ( = ?auto_69608 ?auto_69611 ) ) ( not ( = ?auto_69609 ?auto_69610 ) ) ( not ( = ?auto_69609 ?auto_69611 ) ) ( not ( = ?auto_69610 ?auto_69611 ) ) ( ON ?auto_69610 ?auto_69609 ) ( CLEAR ?auto_69610 ) ( HOLDING ?auto_69611 ) ( CLEAR ?auto_69612 ) ( ON-TABLE ?auto_69612 ) ( not ( = ?auto_69612 ?auto_69611 ) ) ( not ( = ?auto_69607 ?auto_69612 ) ) ( not ( = ?auto_69608 ?auto_69612 ) ) ( not ( = ?auto_69609 ?auto_69612 ) ) ( not ( = ?auto_69610 ?auto_69612 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69612 ?auto_69611 )
      ( MAKE-2PILE ?auto_69607 ?auto_69608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69613 - BLOCK
      ?auto_69614 - BLOCK
    )
    :vars
    (
      ?auto_69617 - BLOCK
      ?auto_69618 - BLOCK
      ?auto_69616 - BLOCK
      ?auto_69615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69617 ?auto_69614 ) ( ON-TABLE ?auto_69613 ) ( ON ?auto_69614 ?auto_69613 ) ( not ( = ?auto_69613 ?auto_69614 ) ) ( not ( = ?auto_69613 ?auto_69617 ) ) ( not ( = ?auto_69614 ?auto_69617 ) ) ( not ( = ?auto_69613 ?auto_69618 ) ) ( not ( = ?auto_69613 ?auto_69616 ) ) ( not ( = ?auto_69614 ?auto_69618 ) ) ( not ( = ?auto_69614 ?auto_69616 ) ) ( not ( = ?auto_69617 ?auto_69618 ) ) ( not ( = ?auto_69617 ?auto_69616 ) ) ( not ( = ?auto_69618 ?auto_69616 ) ) ( ON ?auto_69618 ?auto_69617 ) ( CLEAR ?auto_69615 ) ( ON-TABLE ?auto_69615 ) ( not ( = ?auto_69615 ?auto_69616 ) ) ( not ( = ?auto_69613 ?auto_69615 ) ) ( not ( = ?auto_69614 ?auto_69615 ) ) ( not ( = ?auto_69617 ?auto_69615 ) ) ( not ( = ?auto_69618 ?auto_69615 ) ) ( ON ?auto_69616 ?auto_69618 ) ( CLEAR ?auto_69616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69613 ?auto_69614 ?auto_69617 ?auto_69618 )
      ( MAKE-2PILE ?auto_69613 ?auto_69614 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69619 - BLOCK
      ?auto_69620 - BLOCK
    )
    :vars
    (
      ?auto_69621 - BLOCK
      ?auto_69624 - BLOCK
      ?auto_69623 - BLOCK
      ?auto_69622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69621 ?auto_69620 ) ( ON-TABLE ?auto_69619 ) ( ON ?auto_69620 ?auto_69619 ) ( not ( = ?auto_69619 ?auto_69620 ) ) ( not ( = ?auto_69619 ?auto_69621 ) ) ( not ( = ?auto_69620 ?auto_69621 ) ) ( not ( = ?auto_69619 ?auto_69624 ) ) ( not ( = ?auto_69619 ?auto_69623 ) ) ( not ( = ?auto_69620 ?auto_69624 ) ) ( not ( = ?auto_69620 ?auto_69623 ) ) ( not ( = ?auto_69621 ?auto_69624 ) ) ( not ( = ?auto_69621 ?auto_69623 ) ) ( not ( = ?auto_69624 ?auto_69623 ) ) ( ON ?auto_69624 ?auto_69621 ) ( not ( = ?auto_69622 ?auto_69623 ) ) ( not ( = ?auto_69619 ?auto_69622 ) ) ( not ( = ?auto_69620 ?auto_69622 ) ) ( not ( = ?auto_69621 ?auto_69622 ) ) ( not ( = ?auto_69624 ?auto_69622 ) ) ( ON ?auto_69623 ?auto_69624 ) ( CLEAR ?auto_69623 ) ( HOLDING ?auto_69622 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69622 )
      ( MAKE-2PILE ?auto_69619 ?auto_69620 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69625 - BLOCK
      ?auto_69626 - BLOCK
    )
    :vars
    (
      ?auto_69627 - BLOCK
      ?auto_69629 - BLOCK
      ?auto_69630 - BLOCK
      ?auto_69628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69627 ?auto_69626 ) ( ON-TABLE ?auto_69625 ) ( ON ?auto_69626 ?auto_69625 ) ( not ( = ?auto_69625 ?auto_69626 ) ) ( not ( = ?auto_69625 ?auto_69627 ) ) ( not ( = ?auto_69626 ?auto_69627 ) ) ( not ( = ?auto_69625 ?auto_69629 ) ) ( not ( = ?auto_69625 ?auto_69630 ) ) ( not ( = ?auto_69626 ?auto_69629 ) ) ( not ( = ?auto_69626 ?auto_69630 ) ) ( not ( = ?auto_69627 ?auto_69629 ) ) ( not ( = ?auto_69627 ?auto_69630 ) ) ( not ( = ?auto_69629 ?auto_69630 ) ) ( ON ?auto_69629 ?auto_69627 ) ( not ( = ?auto_69628 ?auto_69630 ) ) ( not ( = ?auto_69625 ?auto_69628 ) ) ( not ( = ?auto_69626 ?auto_69628 ) ) ( not ( = ?auto_69627 ?auto_69628 ) ) ( not ( = ?auto_69629 ?auto_69628 ) ) ( ON ?auto_69630 ?auto_69629 ) ( ON ?auto_69628 ?auto_69630 ) ( CLEAR ?auto_69628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69625 ?auto_69626 ?auto_69627 ?auto_69629 ?auto_69630 )
      ( MAKE-2PILE ?auto_69625 ?auto_69626 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69631 - BLOCK
      ?auto_69632 - BLOCK
    )
    :vars
    (
      ?auto_69636 - BLOCK
      ?auto_69635 - BLOCK
      ?auto_69634 - BLOCK
      ?auto_69633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69636 ?auto_69632 ) ( ON-TABLE ?auto_69631 ) ( ON ?auto_69632 ?auto_69631 ) ( not ( = ?auto_69631 ?auto_69632 ) ) ( not ( = ?auto_69631 ?auto_69636 ) ) ( not ( = ?auto_69632 ?auto_69636 ) ) ( not ( = ?auto_69631 ?auto_69635 ) ) ( not ( = ?auto_69631 ?auto_69634 ) ) ( not ( = ?auto_69632 ?auto_69635 ) ) ( not ( = ?auto_69632 ?auto_69634 ) ) ( not ( = ?auto_69636 ?auto_69635 ) ) ( not ( = ?auto_69636 ?auto_69634 ) ) ( not ( = ?auto_69635 ?auto_69634 ) ) ( ON ?auto_69635 ?auto_69636 ) ( not ( = ?auto_69633 ?auto_69634 ) ) ( not ( = ?auto_69631 ?auto_69633 ) ) ( not ( = ?auto_69632 ?auto_69633 ) ) ( not ( = ?auto_69636 ?auto_69633 ) ) ( not ( = ?auto_69635 ?auto_69633 ) ) ( ON ?auto_69634 ?auto_69635 ) ( HOLDING ?auto_69633 ) ( CLEAR ?auto_69634 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69631 ?auto_69632 ?auto_69636 ?auto_69635 ?auto_69634 ?auto_69633 )
      ( MAKE-2PILE ?auto_69631 ?auto_69632 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69637 - BLOCK
      ?auto_69638 - BLOCK
    )
    :vars
    (
      ?auto_69639 - BLOCK
      ?auto_69642 - BLOCK
      ?auto_69641 - BLOCK
      ?auto_69640 - BLOCK
      ?auto_69643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69639 ?auto_69638 ) ( ON-TABLE ?auto_69637 ) ( ON ?auto_69638 ?auto_69637 ) ( not ( = ?auto_69637 ?auto_69638 ) ) ( not ( = ?auto_69637 ?auto_69639 ) ) ( not ( = ?auto_69638 ?auto_69639 ) ) ( not ( = ?auto_69637 ?auto_69642 ) ) ( not ( = ?auto_69637 ?auto_69641 ) ) ( not ( = ?auto_69638 ?auto_69642 ) ) ( not ( = ?auto_69638 ?auto_69641 ) ) ( not ( = ?auto_69639 ?auto_69642 ) ) ( not ( = ?auto_69639 ?auto_69641 ) ) ( not ( = ?auto_69642 ?auto_69641 ) ) ( ON ?auto_69642 ?auto_69639 ) ( not ( = ?auto_69640 ?auto_69641 ) ) ( not ( = ?auto_69637 ?auto_69640 ) ) ( not ( = ?auto_69638 ?auto_69640 ) ) ( not ( = ?auto_69639 ?auto_69640 ) ) ( not ( = ?auto_69642 ?auto_69640 ) ) ( ON ?auto_69641 ?auto_69642 ) ( CLEAR ?auto_69641 ) ( ON ?auto_69640 ?auto_69643 ) ( CLEAR ?auto_69640 ) ( HAND-EMPTY ) ( not ( = ?auto_69637 ?auto_69643 ) ) ( not ( = ?auto_69638 ?auto_69643 ) ) ( not ( = ?auto_69639 ?auto_69643 ) ) ( not ( = ?auto_69642 ?auto_69643 ) ) ( not ( = ?auto_69641 ?auto_69643 ) ) ( not ( = ?auto_69640 ?auto_69643 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69640 ?auto_69643 )
      ( MAKE-2PILE ?auto_69637 ?auto_69638 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69644 - BLOCK
      ?auto_69645 - BLOCK
    )
    :vars
    (
      ?auto_69648 - BLOCK
      ?auto_69649 - BLOCK
      ?auto_69647 - BLOCK
      ?auto_69650 - BLOCK
      ?auto_69646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69648 ?auto_69645 ) ( ON-TABLE ?auto_69644 ) ( ON ?auto_69645 ?auto_69644 ) ( not ( = ?auto_69644 ?auto_69645 ) ) ( not ( = ?auto_69644 ?auto_69648 ) ) ( not ( = ?auto_69645 ?auto_69648 ) ) ( not ( = ?auto_69644 ?auto_69649 ) ) ( not ( = ?auto_69644 ?auto_69647 ) ) ( not ( = ?auto_69645 ?auto_69649 ) ) ( not ( = ?auto_69645 ?auto_69647 ) ) ( not ( = ?auto_69648 ?auto_69649 ) ) ( not ( = ?auto_69648 ?auto_69647 ) ) ( not ( = ?auto_69649 ?auto_69647 ) ) ( ON ?auto_69649 ?auto_69648 ) ( not ( = ?auto_69650 ?auto_69647 ) ) ( not ( = ?auto_69644 ?auto_69650 ) ) ( not ( = ?auto_69645 ?auto_69650 ) ) ( not ( = ?auto_69648 ?auto_69650 ) ) ( not ( = ?auto_69649 ?auto_69650 ) ) ( ON ?auto_69650 ?auto_69646 ) ( CLEAR ?auto_69650 ) ( not ( = ?auto_69644 ?auto_69646 ) ) ( not ( = ?auto_69645 ?auto_69646 ) ) ( not ( = ?auto_69648 ?auto_69646 ) ) ( not ( = ?auto_69649 ?auto_69646 ) ) ( not ( = ?auto_69647 ?auto_69646 ) ) ( not ( = ?auto_69650 ?auto_69646 ) ) ( HOLDING ?auto_69647 ) ( CLEAR ?auto_69649 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69644 ?auto_69645 ?auto_69648 ?auto_69649 ?auto_69647 )
      ( MAKE-2PILE ?auto_69644 ?auto_69645 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69651 - BLOCK
      ?auto_69652 - BLOCK
    )
    :vars
    (
      ?auto_69657 - BLOCK
      ?auto_69655 - BLOCK
      ?auto_69656 - BLOCK
      ?auto_69653 - BLOCK
      ?auto_69654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69657 ?auto_69652 ) ( ON-TABLE ?auto_69651 ) ( ON ?auto_69652 ?auto_69651 ) ( not ( = ?auto_69651 ?auto_69652 ) ) ( not ( = ?auto_69651 ?auto_69657 ) ) ( not ( = ?auto_69652 ?auto_69657 ) ) ( not ( = ?auto_69651 ?auto_69655 ) ) ( not ( = ?auto_69651 ?auto_69656 ) ) ( not ( = ?auto_69652 ?auto_69655 ) ) ( not ( = ?auto_69652 ?auto_69656 ) ) ( not ( = ?auto_69657 ?auto_69655 ) ) ( not ( = ?auto_69657 ?auto_69656 ) ) ( not ( = ?auto_69655 ?auto_69656 ) ) ( ON ?auto_69655 ?auto_69657 ) ( not ( = ?auto_69653 ?auto_69656 ) ) ( not ( = ?auto_69651 ?auto_69653 ) ) ( not ( = ?auto_69652 ?auto_69653 ) ) ( not ( = ?auto_69657 ?auto_69653 ) ) ( not ( = ?auto_69655 ?auto_69653 ) ) ( ON ?auto_69653 ?auto_69654 ) ( not ( = ?auto_69651 ?auto_69654 ) ) ( not ( = ?auto_69652 ?auto_69654 ) ) ( not ( = ?auto_69657 ?auto_69654 ) ) ( not ( = ?auto_69655 ?auto_69654 ) ) ( not ( = ?auto_69656 ?auto_69654 ) ) ( not ( = ?auto_69653 ?auto_69654 ) ) ( CLEAR ?auto_69655 ) ( ON ?auto_69656 ?auto_69653 ) ( CLEAR ?auto_69656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69654 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69654 ?auto_69653 )
      ( MAKE-2PILE ?auto_69651 ?auto_69652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69658 - BLOCK
      ?auto_69659 - BLOCK
    )
    :vars
    (
      ?auto_69662 - BLOCK
      ?auto_69661 - BLOCK
      ?auto_69663 - BLOCK
      ?auto_69660 - BLOCK
      ?auto_69664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69662 ?auto_69659 ) ( ON-TABLE ?auto_69658 ) ( ON ?auto_69659 ?auto_69658 ) ( not ( = ?auto_69658 ?auto_69659 ) ) ( not ( = ?auto_69658 ?auto_69662 ) ) ( not ( = ?auto_69659 ?auto_69662 ) ) ( not ( = ?auto_69658 ?auto_69661 ) ) ( not ( = ?auto_69658 ?auto_69663 ) ) ( not ( = ?auto_69659 ?auto_69661 ) ) ( not ( = ?auto_69659 ?auto_69663 ) ) ( not ( = ?auto_69662 ?auto_69661 ) ) ( not ( = ?auto_69662 ?auto_69663 ) ) ( not ( = ?auto_69661 ?auto_69663 ) ) ( not ( = ?auto_69660 ?auto_69663 ) ) ( not ( = ?auto_69658 ?auto_69660 ) ) ( not ( = ?auto_69659 ?auto_69660 ) ) ( not ( = ?auto_69662 ?auto_69660 ) ) ( not ( = ?auto_69661 ?auto_69660 ) ) ( ON ?auto_69660 ?auto_69664 ) ( not ( = ?auto_69658 ?auto_69664 ) ) ( not ( = ?auto_69659 ?auto_69664 ) ) ( not ( = ?auto_69662 ?auto_69664 ) ) ( not ( = ?auto_69661 ?auto_69664 ) ) ( not ( = ?auto_69663 ?auto_69664 ) ) ( not ( = ?auto_69660 ?auto_69664 ) ) ( ON ?auto_69663 ?auto_69660 ) ( CLEAR ?auto_69663 ) ( ON-TABLE ?auto_69664 ) ( HOLDING ?auto_69661 ) ( CLEAR ?auto_69662 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69658 ?auto_69659 ?auto_69662 ?auto_69661 )
      ( MAKE-2PILE ?auto_69658 ?auto_69659 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69665 - BLOCK
      ?auto_69666 - BLOCK
    )
    :vars
    (
      ?auto_69667 - BLOCK
      ?auto_69669 - BLOCK
      ?auto_69671 - BLOCK
      ?auto_69670 - BLOCK
      ?auto_69668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69667 ?auto_69666 ) ( ON-TABLE ?auto_69665 ) ( ON ?auto_69666 ?auto_69665 ) ( not ( = ?auto_69665 ?auto_69666 ) ) ( not ( = ?auto_69665 ?auto_69667 ) ) ( not ( = ?auto_69666 ?auto_69667 ) ) ( not ( = ?auto_69665 ?auto_69669 ) ) ( not ( = ?auto_69665 ?auto_69671 ) ) ( not ( = ?auto_69666 ?auto_69669 ) ) ( not ( = ?auto_69666 ?auto_69671 ) ) ( not ( = ?auto_69667 ?auto_69669 ) ) ( not ( = ?auto_69667 ?auto_69671 ) ) ( not ( = ?auto_69669 ?auto_69671 ) ) ( not ( = ?auto_69670 ?auto_69671 ) ) ( not ( = ?auto_69665 ?auto_69670 ) ) ( not ( = ?auto_69666 ?auto_69670 ) ) ( not ( = ?auto_69667 ?auto_69670 ) ) ( not ( = ?auto_69669 ?auto_69670 ) ) ( ON ?auto_69670 ?auto_69668 ) ( not ( = ?auto_69665 ?auto_69668 ) ) ( not ( = ?auto_69666 ?auto_69668 ) ) ( not ( = ?auto_69667 ?auto_69668 ) ) ( not ( = ?auto_69669 ?auto_69668 ) ) ( not ( = ?auto_69671 ?auto_69668 ) ) ( not ( = ?auto_69670 ?auto_69668 ) ) ( ON ?auto_69671 ?auto_69670 ) ( ON-TABLE ?auto_69668 ) ( CLEAR ?auto_69667 ) ( ON ?auto_69669 ?auto_69671 ) ( CLEAR ?auto_69669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69668 ?auto_69670 ?auto_69671 )
      ( MAKE-2PILE ?auto_69665 ?auto_69666 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69686 - BLOCK
      ?auto_69687 - BLOCK
    )
    :vars
    (
      ?auto_69692 - BLOCK
      ?auto_69690 - BLOCK
      ?auto_69689 - BLOCK
      ?auto_69691 - BLOCK
      ?auto_69688 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69686 ) ( not ( = ?auto_69686 ?auto_69687 ) ) ( not ( = ?auto_69686 ?auto_69692 ) ) ( not ( = ?auto_69687 ?auto_69692 ) ) ( not ( = ?auto_69686 ?auto_69690 ) ) ( not ( = ?auto_69686 ?auto_69689 ) ) ( not ( = ?auto_69687 ?auto_69690 ) ) ( not ( = ?auto_69687 ?auto_69689 ) ) ( not ( = ?auto_69692 ?auto_69690 ) ) ( not ( = ?auto_69692 ?auto_69689 ) ) ( not ( = ?auto_69690 ?auto_69689 ) ) ( not ( = ?auto_69691 ?auto_69689 ) ) ( not ( = ?auto_69686 ?auto_69691 ) ) ( not ( = ?auto_69687 ?auto_69691 ) ) ( not ( = ?auto_69692 ?auto_69691 ) ) ( not ( = ?auto_69690 ?auto_69691 ) ) ( ON ?auto_69691 ?auto_69688 ) ( not ( = ?auto_69686 ?auto_69688 ) ) ( not ( = ?auto_69687 ?auto_69688 ) ) ( not ( = ?auto_69692 ?auto_69688 ) ) ( not ( = ?auto_69690 ?auto_69688 ) ) ( not ( = ?auto_69689 ?auto_69688 ) ) ( not ( = ?auto_69691 ?auto_69688 ) ) ( ON ?auto_69689 ?auto_69691 ) ( ON-TABLE ?auto_69688 ) ( ON ?auto_69690 ?auto_69689 ) ( ON ?auto_69692 ?auto_69690 ) ( CLEAR ?auto_69692 ) ( HOLDING ?auto_69687 ) ( CLEAR ?auto_69686 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69686 ?auto_69687 ?auto_69692 )
      ( MAKE-2PILE ?auto_69686 ?auto_69687 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69693 - BLOCK
      ?auto_69694 - BLOCK
    )
    :vars
    (
      ?auto_69698 - BLOCK
      ?auto_69696 - BLOCK
      ?auto_69695 - BLOCK
      ?auto_69699 - BLOCK
      ?auto_69697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69693 ) ( not ( = ?auto_69693 ?auto_69694 ) ) ( not ( = ?auto_69693 ?auto_69698 ) ) ( not ( = ?auto_69694 ?auto_69698 ) ) ( not ( = ?auto_69693 ?auto_69696 ) ) ( not ( = ?auto_69693 ?auto_69695 ) ) ( not ( = ?auto_69694 ?auto_69696 ) ) ( not ( = ?auto_69694 ?auto_69695 ) ) ( not ( = ?auto_69698 ?auto_69696 ) ) ( not ( = ?auto_69698 ?auto_69695 ) ) ( not ( = ?auto_69696 ?auto_69695 ) ) ( not ( = ?auto_69699 ?auto_69695 ) ) ( not ( = ?auto_69693 ?auto_69699 ) ) ( not ( = ?auto_69694 ?auto_69699 ) ) ( not ( = ?auto_69698 ?auto_69699 ) ) ( not ( = ?auto_69696 ?auto_69699 ) ) ( ON ?auto_69699 ?auto_69697 ) ( not ( = ?auto_69693 ?auto_69697 ) ) ( not ( = ?auto_69694 ?auto_69697 ) ) ( not ( = ?auto_69698 ?auto_69697 ) ) ( not ( = ?auto_69696 ?auto_69697 ) ) ( not ( = ?auto_69695 ?auto_69697 ) ) ( not ( = ?auto_69699 ?auto_69697 ) ) ( ON ?auto_69695 ?auto_69699 ) ( ON-TABLE ?auto_69697 ) ( ON ?auto_69696 ?auto_69695 ) ( ON ?auto_69698 ?auto_69696 ) ( CLEAR ?auto_69693 ) ( ON ?auto_69694 ?auto_69698 ) ( CLEAR ?auto_69694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69697 ?auto_69699 ?auto_69695 ?auto_69696 ?auto_69698 )
      ( MAKE-2PILE ?auto_69693 ?auto_69694 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69700 - BLOCK
      ?auto_69701 - BLOCK
    )
    :vars
    (
      ?auto_69705 - BLOCK
      ?auto_69702 - BLOCK
      ?auto_69703 - BLOCK
      ?auto_69704 - BLOCK
      ?auto_69706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69700 ?auto_69701 ) ) ( not ( = ?auto_69700 ?auto_69705 ) ) ( not ( = ?auto_69701 ?auto_69705 ) ) ( not ( = ?auto_69700 ?auto_69702 ) ) ( not ( = ?auto_69700 ?auto_69703 ) ) ( not ( = ?auto_69701 ?auto_69702 ) ) ( not ( = ?auto_69701 ?auto_69703 ) ) ( not ( = ?auto_69705 ?auto_69702 ) ) ( not ( = ?auto_69705 ?auto_69703 ) ) ( not ( = ?auto_69702 ?auto_69703 ) ) ( not ( = ?auto_69704 ?auto_69703 ) ) ( not ( = ?auto_69700 ?auto_69704 ) ) ( not ( = ?auto_69701 ?auto_69704 ) ) ( not ( = ?auto_69705 ?auto_69704 ) ) ( not ( = ?auto_69702 ?auto_69704 ) ) ( ON ?auto_69704 ?auto_69706 ) ( not ( = ?auto_69700 ?auto_69706 ) ) ( not ( = ?auto_69701 ?auto_69706 ) ) ( not ( = ?auto_69705 ?auto_69706 ) ) ( not ( = ?auto_69702 ?auto_69706 ) ) ( not ( = ?auto_69703 ?auto_69706 ) ) ( not ( = ?auto_69704 ?auto_69706 ) ) ( ON ?auto_69703 ?auto_69704 ) ( ON-TABLE ?auto_69706 ) ( ON ?auto_69702 ?auto_69703 ) ( ON ?auto_69705 ?auto_69702 ) ( ON ?auto_69701 ?auto_69705 ) ( CLEAR ?auto_69701 ) ( HOLDING ?auto_69700 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69700 )
      ( MAKE-2PILE ?auto_69700 ?auto_69701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_69707 - BLOCK
      ?auto_69708 - BLOCK
    )
    :vars
    (
      ?auto_69710 - BLOCK
      ?auto_69712 - BLOCK
      ?auto_69709 - BLOCK
      ?auto_69713 - BLOCK
      ?auto_69711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69707 ?auto_69708 ) ) ( not ( = ?auto_69707 ?auto_69710 ) ) ( not ( = ?auto_69708 ?auto_69710 ) ) ( not ( = ?auto_69707 ?auto_69712 ) ) ( not ( = ?auto_69707 ?auto_69709 ) ) ( not ( = ?auto_69708 ?auto_69712 ) ) ( not ( = ?auto_69708 ?auto_69709 ) ) ( not ( = ?auto_69710 ?auto_69712 ) ) ( not ( = ?auto_69710 ?auto_69709 ) ) ( not ( = ?auto_69712 ?auto_69709 ) ) ( not ( = ?auto_69713 ?auto_69709 ) ) ( not ( = ?auto_69707 ?auto_69713 ) ) ( not ( = ?auto_69708 ?auto_69713 ) ) ( not ( = ?auto_69710 ?auto_69713 ) ) ( not ( = ?auto_69712 ?auto_69713 ) ) ( ON ?auto_69713 ?auto_69711 ) ( not ( = ?auto_69707 ?auto_69711 ) ) ( not ( = ?auto_69708 ?auto_69711 ) ) ( not ( = ?auto_69710 ?auto_69711 ) ) ( not ( = ?auto_69712 ?auto_69711 ) ) ( not ( = ?auto_69709 ?auto_69711 ) ) ( not ( = ?auto_69713 ?auto_69711 ) ) ( ON ?auto_69709 ?auto_69713 ) ( ON-TABLE ?auto_69711 ) ( ON ?auto_69712 ?auto_69709 ) ( ON ?auto_69710 ?auto_69712 ) ( ON ?auto_69708 ?auto_69710 ) ( ON ?auto_69707 ?auto_69708 ) ( CLEAR ?auto_69707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69711 ?auto_69713 ?auto_69709 ?auto_69712 ?auto_69710 ?auto_69708 )
      ( MAKE-2PILE ?auto_69707 ?auto_69708 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69718 - BLOCK
      ?auto_69719 - BLOCK
      ?auto_69720 - BLOCK
      ?auto_69721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69721 ) ( CLEAR ?auto_69720 ) ( ON-TABLE ?auto_69718 ) ( ON ?auto_69719 ?auto_69718 ) ( ON ?auto_69720 ?auto_69719 ) ( not ( = ?auto_69718 ?auto_69719 ) ) ( not ( = ?auto_69718 ?auto_69720 ) ) ( not ( = ?auto_69718 ?auto_69721 ) ) ( not ( = ?auto_69719 ?auto_69720 ) ) ( not ( = ?auto_69719 ?auto_69721 ) ) ( not ( = ?auto_69720 ?auto_69721 ) ) )
    :subtasks
    ( ( !STACK ?auto_69721 ?auto_69720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69722 - BLOCK
      ?auto_69723 - BLOCK
      ?auto_69724 - BLOCK
      ?auto_69725 - BLOCK
    )
    :vars
    (
      ?auto_69726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69724 ) ( ON-TABLE ?auto_69722 ) ( ON ?auto_69723 ?auto_69722 ) ( ON ?auto_69724 ?auto_69723 ) ( not ( = ?auto_69722 ?auto_69723 ) ) ( not ( = ?auto_69722 ?auto_69724 ) ) ( not ( = ?auto_69722 ?auto_69725 ) ) ( not ( = ?auto_69723 ?auto_69724 ) ) ( not ( = ?auto_69723 ?auto_69725 ) ) ( not ( = ?auto_69724 ?auto_69725 ) ) ( ON ?auto_69725 ?auto_69726 ) ( CLEAR ?auto_69725 ) ( HAND-EMPTY ) ( not ( = ?auto_69722 ?auto_69726 ) ) ( not ( = ?auto_69723 ?auto_69726 ) ) ( not ( = ?auto_69724 ?auto_69726 ) ) ( not ( = ?auto_69725 ?auto_69726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69725 ?auto_69726 )
      ( MAKE-4PILE ?auto_69722 ?auto_69723 ?auto_69724 ?auto_69725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69727 - BLOCK
      ?auto_69728 - BLOCK
      ?auto_69729 - BLOCK
      ?auto_69730 - BLOCK
    )
    :vars
    (
      ?auto_69731 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69727 ) ( ON ?auto_69728 ?auto_69727 ) ( not ( = ?auto_69727 ?auto_69728 ) ) ( not ( = ?auto_69727 ?auto_69729 ) ) ( not ( = ?auto_69727 ?auto_69730 ) ) ( not ( = ?auto_69728 ?auto_69729 ) ) ( not ( = ?auto_69728 ?auto_69730 ) ) ( not ( = ?auto_69729 ?auto_69730 ) ) ( ON ?auto_69730 ?auto_69731 ) ( CLEAR ?auto_69730 ) ( not ( = ?auto_69727 ?auto_69731 ) ) ( not ( = ?auto_69728 ?auto_69731 ) ) ( not ( = ?auto_69729 ?auto_69731 ) ) ( not ( = ?auto_69730 ?auto_69731 ) ) ( HOLDING ?auto_69729 ) ( CLEAR ?auto_69728 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69727 ?auto_69728 ?auto_69729 )
      ( MAKE-4PILE ?auto_69727 ?auto_69728 ?auto_69729 ?auto_69730 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69732 - BLOCK
      ?auto_69733 - BLOCK
      ?auto_69734 - BLOCK
      ?auto_69735 - BLOCK
    )
    :vars
    (
      ?auto_69736 - BLOCK
      ?auto_69737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69732 ) ( ON ?auto_69733 ?auto_69732 ) ( not ( = ?auto_69732 ?auto_69733 ) ) ( not ( = ?auto_69732 ?auto_69734 ) ) ( not ( = ?auto_69732 ?auto_69735 ) ) ( not ( = ?auto_69733 ?auto_69734 ) ) ( not ( = ?auto_69733 ?auto_69735 ) ) ( not ( = ?auto_69734 ?auto_69735 ) ) ( ON ?auto_69735 ?auto_69736 ) ( not ( = ?auto_69732 ?auto_69736 ) ) ( not ( = ?auto_69733 ?auto_69736 ) ) ( not ( = ?auto_69734 ?auto_69736 ) ) ( not ( = ?auto_69735 ?auto_69736 ) ) ( CLEAR ?auto_69733 ) ( ON ?auto_69734 ?auto_69735 ) ( CLEAR ?auto_69734 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69737 ) ( ON ?auto_69736 ?auto_69737 ) ( not ( = ?auto_69737 ?auto_69736 ) ) ( not ( = ?auto_69737 ?auto_69735 ) ) ( not ( = ?auto_69737 ?auto_69734 ) ) ( not ( = ?auto_69732 ?auto_69737 ) ) ( not ( = ?auto_69733 ?auto_69737 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69737 ?auto_69736 ?auto_69735 )
      ( MAKE-4PILE ?auto_69732 ?auto_69733 ?auto_69734 ?auto_69735 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69738 - BLOCK
      ?auto_69739 - BLOCK
      ?auto_69740 - BLOCK
      ?auto_69741 - BLOCK
    )
    :vars
    (
      ?auto_69743 - BLOCK
      ?auto_69742 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69738 ) ( not ( = ?auto_69738 ?auto_69739 ) ) ( not ( = ?auto_69738 ?auto_69740 ) ) ( not ( = ?auto_69738 ?auto_69741 ) ) ( not ( = ?auto_69739 ?auto_69740 ) ) ( not ( = ?auto_69739 ?auto_69741 ) ) ( not ( = ?auto_69740 ?auto_69741 ) ) ( ON ?auto_69741 ?auto_69743 ) ( not ( = ?auto_69738 ?auto_69743 ) ) ( not ( = ?auto_69739 ?auto_69743 ) ) ( not ( = ?auto_69740 ?auto_69743 ) ) ( not ( = ?auto_69741 ?auto_69743 ) ) ( ON ?auto_69740 ?auto_69741 ) ( CLEAR ?auto_69740 ) ( ON-TABLE ?auto_69742 ) ( ON ?auto_69743 ?auto_69742 ) ( not ( = ?auto_69742 ?auto_69743 ) ) ( not ( = ?auto_69742 ?auto_69741 ) ) ( not ( = ?auto_69742 ?auto_69740 ) ) ( not ( = ?auto_69738 ?auto_69742 ) ) ( not ( = ?auto_69739 ?auto_69742 ) ) ( HOLDING ?auto_69739 ) ( CLEAR ?auto_69738 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69738 ?auto_69739 )
      ( MAKE-4PILE ?auto_69738 ?auto_69739 ?auto_69740 ?auto_69741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69744 - BLOCK
      ?auto_69745 - BLOCK
      ?auto_69746 - BLOCK
      ?auto_69747 - BLOCK
    )
    :vars
    (
      ?auto_69749 - BLOCK
      ?auto_69748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69744 ) ( not ( = ?auto_69744 ?auto_69745 ) ) ( not ( = ?auto_69744 ?auto_69746 ) ) ( not ( = ?auto_69744 ?auto_69747 ) ) ( not ( = ?auto_69745 ?auto_69746 ) ) ( not ( = ?auto_69745 ?auto_69747 ) ) ( not ( = ?auto_69746 ?auto_69747 ) ) ( ON ?auto_69747 ?auto_69749 ) ( not ( = ?auto_69744 ?auto_69749 ) ) ( not ( = ?auto_69745 ?auto_69749 ) ) ( not ( = ?auto_69746 ?auto_69749 ) ) ( not ( = ?auto_69747 ?auto_69749 ) ) ( ON ?auto_69746 ?auto_69747 ) ( ON-TABLE ?auto_69748 ) ( ON ?auto_69749 ?auto_69748 ) ( not ( = ?auto_69748 ?auto_69749 ) ) ( not ( = ?auto_69748 ?auto_69747 ) ) ( not ( = ?auto_69748 ?auto_69746 ) ) ( not ( = ?auto_69744 ?auto_69748 ) ) ( not ( = ?auto_69745 ?auto_69748 ) ) ( CLEAR ?auto_69744 ) ( ON ?auto_69745 ?auto_69746 ) ( CLEAR ?auto_69745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69748 ?auto_69749 ?auto_69747 ?auto_69746 )
      ( MAKE-4PILE ?auto_69744 ?auto_69745 ?auto_69746 ?auto_69747 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69750 - BLOCK
      ?auto_69751 - BLOCK
      ?auto_69752 - BLOCK
      ?auto_69753 - BLOCK
    )
    :vars
    (
      ?auto_69755 - BLOCK
      ?auto_69754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69750 ?auto_69751 ) ) ( not ( = ?auto_69750 ?auto_69752 ) ) ( not ( = ?auto_69750 ?auto_69753 ) ) ( not ( = ?auto_69751 ?auto_69752 ) ) ( not ( = ?auto_69751 ?auto_69753 ) ) ( not ( = ?auto_69752 ?auto_69753 ) ) ( ON ?auto_69753 ?auto_69755 ) ( not ( = ?auto_69750 ?auto_69755 ) ) ( not ( = ?auto_69751 ?auto_69755 ) ) ( not ( = ?auto_69752 ?auto_69755 ) ) ( not ( = ?auto_69753 ?auto_69755 ) ) ( ON ?auto_69752 ?auto_69753 ) ( ON-TABLE ?auto_69754 ) ( ON ?auto_69755 ?auto_69754 ) ( not ( = ?auto_69754 ?auto_69755 ) ) ( not ( = ?auto_69754 ?auto_69753 ) ) ( not ( = ?auto_69754 ?auto_69752 ) ) ( not ( = ?auto_69750 ?auto_69754 ) ) ( not ( = ?auto_69751 ?auto_69754 ) ) ( ON ?auto_69751 ?auto_69752 ) ( CLEAR ?auto_69751 ) ( HOLDING ?auto_69750 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69750 )
      ( MAKE-4PILE ?auto_69750 ?auto_69751 ?auto_69752 ?auto_69753 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69756 - BLOCK
      ?auto_69757 - BLOCK
      ?auto_69758 - BLOCK
      ?auto_69759 - BLOCK
    )
    :vars
    (
      ?auto_69761 - BLOCK
      ?auto_69760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69756 ?auto_69757 ) ) ( not ( = ?auto_69756 ?auto_69758 ) ) ( not ( = ?auto_69756 ?auto_69759 ) ) ( not ( = ?auto_69757 ?auto_69758 ) ) ( not ( = ?auto_69757 ?auto_69759 ) ) ( not ( = ?auto_69758 ?auto_69759 ) ) ( ON ?auto_69759 ?auto_69761 ) ( not ( = ?auto_69756 ?auto_69761 ) ) ( not ( = ?auto_69757 ?auto_69761 ) ) ( not ( = ?auto_69758 ?auto_69761 ) ) ( not ( = ?auto_69759 ?auto_69761 ) ) ( ON ?auto_69758 ?auto_69759 ) ( ON-TABLE ?auto_69760 ) ( ON ?auto_69761 ?auto_69760 ) ( not ( = ?auto_69760 ?auto_69761 ) ) ( not ( = ?auto_69760 ?auto_69759 ) ) ( not ( = ?auto_69760 ?auto_69758 ) ) ( not ( = ?auto_69756 ?auto_69760 ) ) ( not ( = ?auto_69757 ?auto_69760 ) ) ( ON ?auto_69757 ?auto_69758 ) ( ON ?auto_69756 ?auto_69757 ) ( CLEAR ?auto_69756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69760 ?auto_69761 ?auto_69759 ?auto_69758 ?auto_69757 )
      ( MAKE-4PILE ?auto_69756 ?auto_69757 ?auto_69758 ?auto_69759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69762 - BLOCK
      ?auto_69763 - BLOCK
      ?auto_69764 - BLOCK
      ?auto_69765 - BLOCK
    )
    :vars
    (
      ?auto_69766 - BLOCK
      ?auto_69767 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69762 ?auto_69763 ) ) ( not ( = ?auto_69762 ?auto_69764 ) ) ( not ( = ?auto_69762 ?auto_69765 ) ) ( not ( = ?auto_69763 ?auto_69764 ) ) ( not ( = ?auto_69763 ?auto_69765 ) ) ( not ( = ?auto_69764 ?auto_69765 ) ) ( ON ?auto_69765 ?auto_69766 ) ( not ( = ?auto_69762 ?auto_69766 ) ) ( not ( = ?auto_69763 ?auto_69766 ) ) ( not ( = ?auto_69764 ?auto_69766 ) ) ( not ( = ?auto_69765 ?auto_69766 ) ) ( ON ?auto_69764 ?auto_69765 ) ( ON-TABLE ?auto_69767 ) ( ON ?auto_69766 ?auto_69767 ) ( not ( = ?auto_69767 ?auto_69766 ) ) ( not ( = ?auto_69767 ?auto_69765 ) ) ( not ( = ?auto_69767 ?auto_69764 ) ) ( not ( = ?auto_69762 ?auto_69767 ) ) ( not ( = ?auto_69763 ?auto_69767 ) ) ( ON ?auto_69763 ?auto_69764 ) ( HOLDING ?auto_69762 ) ( CLEAR ?auto_69763 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69767 ?auto_69766 ?auto_69765 ?auto_69764 ?auto_69763 ?auto_69762 )
      ( MAKE-4PILE ?auto_69762 ?auto_69763 ?auto_69764 ?auto_69765 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69768 - BLOCK
      ?auto_69769 - BLOCK
      ?auto_69770 - BLOCK
      ?auto_69771 - BLOCK
    )
    :vars
    (
      ?auto_69772 - BLOCK
      ?auto_69773 - BLOCK
      ?auto_69774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69768 ?auto_69769 ) ) ( not ( = ?auto_69768 ?auto_69770 ) ) ( not ( = ?auto_69768 ?auto_69771 ) ) ( not ( = ?auto_69769 ?auto_69770 ) ) ( not ( = ?auto_69769 ?auto_69771 ) ) ( not ( = ?auto_69770 ?auto_69771 ) ) ( ON ?auto_69771 ?auto_69772 ) ( not ( = ?auto_69768 ?auto_69772 ) ) ( not ( = ?auto_69769 ?auto_69772 ) ) ( not ( = ?auto_69770 ?auto_69772 ) ) ( not ( = ?auto_69771 ?auto_69772 ) ) ( ON ?auto_69770 ?auto_69771 ) ( ON-TABLE ?auto_69773 ) ( ON ?auto_69772 ?auto_69773 ) ( not ( = ?auto_69773 ?auto_69772 ) ) ( not ( = ?auto_69773 ?auto_69771 ) ) ( not ( = ?auto_69773 ?auto_69770 ) ) ( not ( = ?auto_69768 ?auto_69773 ) ) ( not ( = ?auto_69769 ?auto_69773 ) ) ( ON ?auto_69769 ?auto_69770 ) ( CLEAR ?auto_69769 ) ( ON ?auto_69768 ?auto_69774 ) ( CLEAR ?auto_69768 ) ( HAND-EMPTY ) ( not ( = ?auto_69768 ?auto_69774 ) ) ( not ( = ?auto_69769 ?auto_69774 ) ) ( not ( = ?auto_69770 ?auto_69774 ) ) ( not ( = ?auto_69771 ?auto_69774 ) ) ( not ( = ?auto_69772 ?auto_69774 ) ) ( not ( = ?auto_69773 ?auto_69774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69768 ?auto_69774 )
      ( MAKE-4PILE ?auto_69768 ?auto_69769 ?auto_69770 ?auto_69771 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69775 - BLOCK
      ?auto_69776 - BLOCK
      ?auto_69777 - BLOCK
      ?auto_69778 - BLOCK
    )
    :vars
    (
      ?auto_69781 - BLOCK
      ?auto_69780 - BLOCK
      ?auto_69779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69775 ?auto_69776 ) ) ( not ( = ?auto_69775 ?auto_69777 ) ) ( not ( = ?auto_69775 ?auto_69778 ) ) ( not ( = ?auto_69776 ?auto_69777 ) ) ( not ( = ?auto_69776 ?auto_69778 ) ) ( not ( = ?auto_69777 ?auto_69778 ) ) ( ON ?auto_69778 ?auto_69781 ) ( not ( = ?auto_69775 ?auto_69781 ) ) ( not ( = ?auto_69776 ?auto_69781 ) ) ( not ( = ?auto_69777 ?auto_69781 ) ) ( not ( = ?auto_69778 ?auto_69781 ) ) ( ON ?auto_69777 ?auto_69778 ) ( ON-TABLE ?auto_69780 ) ( ON ?auto_69781 ?auto_69780 ) ( not ( = ?auto_69780 ?auto_69781 ) ) ( not ( = ?auto_69780 ?auto_69778 ) ) ( not ( = ?auto_69780 ?auto_69777 ) ) ( not ( = ?auto_69775 ?auto_69780 ) ) ( not ( = ?auto_69776 ?auto_69780 ) ) ( ON ?auto_69775 ?auto_69779 ) ( CLEAR ?auto_69775 ) ( not ( = ?auto_69775 ?auto_69779 ) ) ( not ( = ?auto_69776 ?auto_69779 ) ) ( not ( = ?auto_69777 ?auto_69779 ) ) ( not ( = ?auto_69778 ?auto_69779 ) ) ( not ( = ?auto_69781 ?auto_69779 ) ) ( not ( = ?auto_69780 ?auto_69779 ) ) ( HOLDING ?auto_69776 ) ( CLEAR ?auto_69777 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69780 ?auto_69781 ?auto_69778 ?auto_69777 ?auto_69776 )
      ( MAKE-4PILE ?auto_69775 ?auto_69776 ?auto_69777 ?auto_69778 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69782 - BLOCK
      ?auto_69783 - BLOCK
      ?auto_69784 - BLOCK
      ?auto_69785 - BLOCK
    )
    :vars
    (
      ?auto_69788 - BLOCK
      ?auto_69786 - BLOCK
      ?auto_69787 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69782 ?auto_69783 ) ) ( not ( = ?auto_69782 ?auto_69784 ) ) ( not ( = ?auto_69782 ?auto_69785 ) ) ( not ( = ?auto_69783 ?auto_69784 ) ) ( not ( = ?auto_69783 ?auto_69785 ) ) ( not ( = ?auto_69784 ?auto_69785 ) ) ( ON ?auto_69785 ?auto_69788 ) ( not ( = ?auto_69782 ?auto_69788 ) ) ( not ( = ?auto_69783 ?auto_69788 ) ) ( not ( = ?auto_69784 ?auto_69788 ) ) ( not ( = ?auto_69785 ?auto_69788 ) ) ( ON ?auto_69784 ?auto_69785 ) ( ON-TABLE ?auto_69786 ) ( ON ?auto_69788 ?auto_69786 ) ( not ( = ?auto_69786 ?auto_69788 ) ) ( not ( = ?auto_69786 ?auto_69785 ) ) ( not ( = ?auto_69786 ?auto_69784 ) ) ( not ( = ?auto_69782 ?auto_69786 ) ) ( not ( = ?auto_69783 ?auto_69786 ) ) ( ON ?auto_69782 ?auto_69787 ) ( not ( = ?auto_69782 ?auto_69787 ) ) ( not ( = ?auto_69783 ?auto_69787 ) ) ( not ( = ?auto_69784 ?auto_69787 ) ) ( not ( = ?auto_69785 ?auto_69787 ) ) ( not ( = ?auto_69788 ?auto_69787 ) ) ( not ( = ?auto_69786 ?auto_69787 ) ) ( CLEAR ?auto_69784 ) ( ON ?auto_69783 ?auto_69782 ) ( CLEAR ?auto_69783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69787 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69787 ?auto_69782 )
      ( MAKE-4PILE ?auto_69782 ?auto_69783 ?auto_69784 ?auto_69785 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69789 - BLOCK
      ?auto_69790 - BLOCK
      ?auto_69791 - BLOCK
      ?auto_69792 - BLOCK
    )
    :vars
    (
      ?auto_69794 - BLOCK
      ?auto_69793 - BLOCK
      ?auto_69795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69789 ?auto_69790 ) ) ( not ( = ?auto_69789 ?auto_69791 ) ) ( not ( = ?auto_69789 ?auto_69792 ) ) ( not ( = ?auto_69790 ?auto_69791 ) ) ( not ( = ?auto_69790 ?auto_69792 ) ) ( not ( = ?auto_69791 ?auto_69792 ) ) ( ON ?auto_69792 ?auto_69794 ) ( not ( = ?auto_69789 ?auto_69794 ) ) ( not ( = ?auto_69790 ?auto_69794 ) ) ( not ( = ?auto_69791 ?auto_69794 ) ) ( not ( = ?auto_69792 ?auto_69794 ) ) ( ON-TABLE ?auto_69793 ) ( ON ?auto_69794 ?auto_69793 ) ( not ( = ?auto_69793 ?auto_69794 ) ) ( not ( = ?auto_69793 ?auto_69792 ) ) ( not ( = ?auto_69793 ?auto_69791 ) ) ( not ( = ?auto_69789 ?auto_69793 ) ) ( not ( = ?auto_69790 ?auto_69793 ) ) ( ON ?auto_69789 ?auto_69795 ) ( not ( = ?auto_69789 ?auto_69795 ) ) ( not ( = ?auto_69790 ?auto_69795 ) ) ( not ( = ?auto_69791 ?auto_69795 ) ) ( not ( = ?auto_69792 ?auto_69795 ) ) ( not ( = ?auto_69794 ?auto_69795 ) ) ( not ( = ?auto_69793 ?auto_69795 ) ) ( ON ?auto_69790 ?auto_69789 ) ( CLEAR ?auto_69790 ) ( ON-TABLE ?auto_69795 ) ( HOLDING ?auto_69791 ) ( CLEAR ?auto_69792 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69793 ?auto_69794 ?auto_69792 ?auto_69791 )
      ( MAKE-4PILE ?auto_69789 ?auto_69790 ?auto_69791 ?auto_69792 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69796 - BLOCK
      ?auto_69797 - BLOCK
      ?auto_69798 - BLOCK
      ?auto_69799 - BLOCK
    )
    :vars
    (
      ?auto_69802 - BLOCK
      ?auto_69800 - BLOCK
      ?auto_69801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69796 ?auto_69797 ) ) ( not ( = ?auto_69796 ?auto_69798 ) ) ( not ( = ?auto_69796 ?auto_69799 ) ) ( not ( = ?auto_69797 ?auto_69798 ) ) ( not ( = ?auto_69797 ?auto_69799 ) ) ( not ( = ?auto_69798 ?auto_69799 ) ) ( ON ?auto_69799 ?auto_69802 ) ( not ( = ?auto_69796 ?auto_69802 ) ) ( not ( = ?auto_69797 ?auto_69802 ) ) ( not ( = ?auto_69798 ?auto_69802 ) ) ( not ( = ?auto_69799 ?auto_69802 ) ) ( ON-TABLE ?auto_69800 ) ( ON ?auto_69802 ?auto_69800 ) ( not ( = ?auto_69800 ?auto_69802 ) ) ( not ( = ?auto_69800 ?auto_69799 ) ) ( not ( = ?auto_69800 ?auto_69798 ) ) ( not ( = ?auto_69796 ?auto_69800 ) ) ( not ( = ?auto_69797 ?auto_69800 ) ) ( ON ?auto_69796 ?auto_69801 ) ( not ( = ?auto_69796 ?auto_69801 ) ) ( not ( = ?auto_69797 ?auto_69801 ) ) ( not ( = ?auto_69798 ?auto_69801 ) ) ( not ( = ?auto_69799 ?auto_69801 ) ) ( not ( = ?auto_69802 ?auto_69801 ) ) ( not ( = ?auto_69800 ?auto_69801 ) ) ( ON ?auto_69797 ?auto_69796 ) ( ON-TABLE ?auto_69801 ) ( CLEAR ?auto_69799 ) ( ON ?auto_69798 ?auto_69797 ) ( CLEAR ?auto_69798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69801 ?auto_69796 ?auto_69797 )
      ( MAKE-4PILE ?auto_69796 ?auto_69797 ?auto_69798 ?auto_69799 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69803 - BLOCK
      ?auto_69804 - BLOCK
      ?auto_69805 - BLOCK
      ?auto_69806 - BLOCK
    )
    :vars
    (
      ?auto_69807 - BLOCK
      ?auto_69808 - BLOCK
      ?auto_69809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69803 ?auto_69804 ) ) ( not ( = ?auto_69803 ?auto_69805 ) ) ( not ( = ?auto_69803 ?auto_69806 ) ) ( not ( = ?auto_69804 ?auto_69805 ) ) ( not ( = ?auto_69804 ?auto_69806 ) ) ( not ( = ?auto_69805 ?auto_69806 ) ) ( not ( = ?auto_69803 ?auto_69807 ) ) ( not ( = ?auto_69804 ?auto_69807 ) ) ( not ( = ?auto_69805 ?auto_69807 ) ) ( not ( = ?auto_69806 ?auto_69807 ) ) ( ON-TABLE ?auto_69808 ) ( ON ?auto_69807 ?auto_69808 ) ( not ( = ?auto_69808 ?auto_69807 ) ) ( not ( = ?auto_69808 ?auto_69806 ) ) ( not ( = ?auto_69808 ?auto_69805 ) ) ( not ( = ?auto_69803 ?auto_69808 ) ) ( not ( = ?auto_69804 ?auto_69808 ) ) ( ON ?auto_69803 ?auto_69809 ) ( not ( = ?auto_69803 ?auto_69809 ) ) ( not ( = ?auto_69804 ?auto_69809 ) ) ( not ( = ?auto_69805 ?auto_69809 ) ) ( not ( = ?auto_69806 ?auto_69809 ) ) ( not ( = ?auto_69807 ?auto_69809 ) ) ( not ( = ?auto_69808 ?auto_69809 ) ) ( ON ?auto_69804 ?auto_69803 ) ( ON-TABLE ?auto_69809 ) ( ON ?auto_69805 ?auto_69804 ) ( CLEAR ?auto_69805 ) ( HOLDING ?auto_69806 ) ( CLEAR ?auto_69807 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69808 ?auto_69807 ?auto_69806 )
      ( MAKE-4PILE ?auto_69803 ?auto_69804 ?auto_69805 ?auto_69806 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69810 - BLOCK
      ?auto_69811 - BLOCK
      ?auto_69812 - BLOCK
      ?auto_69813 - BLOCK
    )
    :vars
    (
      ?auto_69815 - BLOCK
      ?auto_69814 - BLOCK
      ?auto_69816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69810 ?auto_69811 ) ) ( not ( = ?auto_69810 ?auto_69812 ) ) ( not ( = ?auto_69810 ?auto_69813 ) ) ( not ( = ?auto_69811 ?auto_69812 ) ) ( not ( = ?auto_69811 ?auto_69813 ) ) ( not ( = ?auto_69812 ?auto_69813 ) ) ( not ( = ?auto_69810 ?auto_69815 ) ) ( not ( = ?auto_69811 ?auto_69815 ) ) ( not ( = ?auto_69812 ?auto_69815 ) ) ( not ( = ?auto_69813 ?auto_69815 ) ) ( ON-TABLE ?auto_69814 ) ( ON ?auto_69815 ?auto_69814 ) ( not ( = ?auto_69814 ?auto_69815 ) ) ( not ( = ?auto_69814 ?auto_69813 ) ) ( not ( = ?auto_69814 ?auto_69812 ) ) ( not ( = ?auto_69810 ?auto_69814 ) ) ( not ( = ?auto_69811 ?auto_69814 ) ) ( ON ?auto_69810 ?auto_69816 ) ( not ( = ?auto_69810 ?auto_69816 ) ) ( not ( = ?auto_69811 ?auto_69816 ) ) ( not ( = ?auto_69812 ?auto_69816 ) ) ( not ( = ?auto_69813 ?auto_69816 ) ) ( not ( = ?auto_69815 ?auto_69816 ) ) ( not ( = ?auto_69814 ?auto_69816 ) ) ( ON ?auto_69811 ?auto_69810 ) ( ON-TABLE ?auto_69816 ) ( ON ?auto_69812 ?auto_69811 ) ( CLEAR ?auto_69815 ) ( ON ?auto_69813 ?auto_69812 ) ( CLEAR ?auto_69813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69816 ?auto_69810 ?auto_69811 ?auto_69812 )
      ( MAKE-4PILE ?auto_69810 ?auto_69811 ?auto_69812 ?auto_69813 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69817 - BLOCK
      ?auto_69818 - BLOCK
      ?auto_69819 - BLOCK
      ?auto_69820 - BLOCK
    )
    :vars
    (
      ?auto_69822 - BLOCK
      ?auto_69821 - BLOCK
      ?auto_69823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69817 ?auto_69818 ) ) ( not ( = ?auto_69817 ?auto_69819 ) ) ( not ( = ?auto_69817 ?auto_69820 ) ) ( not ( = ?auto_69818 ?auto_69819 ) ) ( not ( = ?auto_69818 ?auto_69820 ) ) ( not ( = ?auto_69819 ?auto_69820 ) ) ( not ( = ?auto_69817 ?auto_69822 ) ) ( not ( = ?auto_69818 ?auto_69822 ) ) ( not ( = ?auto_69819 ?auto_69822 ) ) ( not ( = ?auto_69820 ?auto_69822 ) ) ( ON-TABLE ?auto_69821 ) ( not ( = ?auto_69821 ?auto_69822 ) ) ( not ( = ?auto_69821 ?auto_69820 ) ) ( not ( = ?auto_69821 ?auto_69819 ) ) ( not ( = ?auto_69817 ?auto_69821 ) ) ( not ( = ?auto_69818 ?auto_69821 ) ) ( ON ?auto_69817 ?auto_69823 ) ( not ( = ?auto_69817 ?auto_69823 ) ) ( not ( = ?auto_69818 ?auto_69823 ) ) ( not ( = ?auto_69819 ?auto_69823 ) ) ( not ( = ?auto_69820 ?auto_69823 ) ) ( not ( = ?auto_69822 ?auto_69823 ) ) ( not ( = ?auto_69821 ?auto_69823 ) ) ( ON ?auto_69818 ?auto_69817 ) ( ON-TABLE ?auto_69823 ) ( ON ?auto_69819 ?auto_69818 ) ( ON ?auto_69820 ?auto_69819 ) ( CLEAR ?auto_69820 ) ( HOLDING ?auto_69822 ) ( CLEAR ?auto_69821 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69821 ?auto_69822 )
      ( MAKE-4PILE ?auto_69817 ?auto_69818 ?auto_69819 ?auto_69820 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69824 - BLOCK
      ?auto_69825 - BLOCK
      ?auto_69826 - BLOCK
      ?auto_69827 - BLOCK
    )
    :vars
    (
      ?auto_69830 - BLOCK
      ?auto_69829 - BLOCK
      ?auto_69828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69824 ?auto_69825 ) ) ( not ( = ?auto_69824 ?auto_69826 ) ) ( not ( = ?auto_69824 ?auto_69827 ) ) ( not ( = ?auto_69825 ?auto_69826 ) ) ( not ( = ?auto_69825 ?auto_69827 ) ) ( not ( = ?auto_69826 ?auto_69827 ) ) ( not ( = ?auto_69824 ?auto_69830 ) ) ( not ( = ?auto_69825 ?auto_69830 ) ) ( not ( = ?auto_69826 ?auto_69830 ) ) ( not ( = ?auto_69827 ?auto_69830 ) ) ( ON-TABLE ?auto_69829 ) ( not ( = ?auto_69829 ?auto_69830 ) ) ( not ( = ?auto_69829 ?auto_69827 ) ) ( not ( = ?auto_69829 ?auto_69826 ) ) ( not ( = ?auto_69824 ?auto_69829 ) ) ( not ( = ?auto_69825 ?auto_69829 ) ) ( ON ?auto_69824 ?auto_69828 ) ( not ( = ?auto_69824 ?auto_69828 ) ) ( not ( = ?auto_69825 ?auto_69828 ) ) ( not ( = ?auto_69826 ?auto_69828 ) ) ( not ( = ?auto_69827 ?auto_69828 ) ) ( not ( = ?auto_69830 ?auto_69828 ) ) ( not ( = ?auto_69829 ?auto_69828 ) ) ( ON ?auto_69825 ?auto_69824 ) ( ON-TABLE ?auto_69828 ) ( ON ?auto_69826 ?auto_69825 ) ( ON ?auto_69827 ?auto_69826 ) ( CLEAR ?auto_69829 ) ( ON ?auto_69830 ?auto_69827 ) ( CLEAR ?auto_69830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69828 ?auto_69824 ?auto_69825 ?auto_69826 ?auto_69827 )
      ( MAKE-4PILE ?auto_69824 ?auto_69825 ?auto_69826 ?auto_69827 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69831 - BLOCK
      ?auto_69832 - BLOCK
      ?auto_69833 - BLOCK
      ?auto_69834 - BLOCK
    )
    :vars
    (
      ?auto_69836 - BLOCK
      ?auto_69837 - BLOCK
      ?auto_69835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69831 ?auto_69832 ) ) ( not ( = ?auto_69831 ?auto_69833 ) ) ( not ( = ?auto_69831 ?auto_69834 ) ) ( not ( = ?auto_69832 ?auto_69833 ) ) ( not ( = ?auto_69832 ?auto_69834 ) ) ( not ( = ?auto_69833 ?auto_69834 ) ) ( not ( = ?auto_69831 ?auto_69836 ) ) ( not ( = ?auto_69832 ?auto_69836 ) ) ( not ( = ?auto_69833 ?auto_69836 ) ) ( not ( = ?auto_69834 ?auto_69836 ) ) ( not ( = ?auto_69837 ?auto_69836 ) ) ( not ( = ?auto_69837 ?auto_69834 ) ) ( not ( = ?auto_69837 ?auto_69833 ) ) ( not ( = ?auto_69831 ?auto_69837 ) ) ( not ( = ?auto_69832 ?auto_69837 ) ) ( ON ?auto_69831 ?auto_69835 ) ( not ( = ?auto_69831 ?auto_69835 ) ) ( not ( = ?auto_69832 ?auto_69835 ) ) ( not ( = ?auto_69833 ?auto_69835 ) ) ( not ( = ?auto_69834 ?auto_69835 ) ) ( not ( = ?auto_69836 ?auto_69835 ) ) ( not ( = ?auto_69837 ?auto_69835 ) ) ( ON ?auto_69832 ?auto_69831 ) ( ON-TABLE ?auto_69835 ) ( ON ?auto_69833 ?auto_69832 ) ( ON ?auto_69834 ?auto_69833 ) ( ON ?auto_69836 ?auto_69834 ) ( CLEAR ?auto_69836 ) ( HOLDING ?auto_69837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69837 )
      ( MAKE-4PILE ?auto_69831 ?auto_69832 ?auto_69833 ?auto_69834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_69838 - BLOCK
      ?auto_69839 - BLOCK
      ?auto_69840 - BLOCK
      ?auto_69841 - BLOCK
    )
    :vars
    (
      ?auto_69844 - BLOCK
      ?auto_69843 - BLOCK
      ?auto_69842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69838 ?auto_69839 ) ) ( not ( = ?auto_69838 ?auto_69840 ) ) ( not ( = ?auto_69838 ?auto_69841 ) ) ( not ( = ?auto_69839 ?auto_69840 ) ) ( not ( = ?auto_69839 ?auto_69841 ) ) ( not ( = ?auto_69840 ?auto_69841 ) ) ( not ( = ?auto_69838 ?auto_69844 ) ) ( not ( = ?auto_69839 ?auto_69844 ) ) ( not ( = ?auto_69840 ?auto_69844 ) ) ( not ( = ?auto_69841 ?auto_69844 ) ) ( not ( = ?auto_69843 ?auto_69844 ) ) ( not ( = ?auto_69843 ?auto_69841 ) ) ( not ( = ?auto_69843 ?auto_69840 ) ) ( not ( = ?auto_69838 ?auto_69843 ) ) ( not ( = ?auto_69839 ?auto_69843 ) ) ( ON ?auto_69838 ?auto_69842 ) ( not ( = ?auto_69838 ?auto_69842 ) ) ( not ( = ?auto_69839 ?auto_69842 ) ) ( not ( = ?auto_69840 ?auto_69842 ) ) ( not ( = ?auto_69841 ?auto_69842 ) ) ( not ( = ?auto_69844 ?auto_69842 ) ) ( not ( = ?auto_69843 ?auto_69842 ) ) ( ON ?auto_69839 ?auto_69838 ) ( ON-TABLE ?auto_69842 ) ( ON ?auto_69840 ?auto_69839 ) ( ON ?auto_69841 ?auto_69840 ) ( ON ?auto_69844 ?auto_69841 ) ( ON ?auto_69843 ?auto_69844 ) ( CLEAR ?auto_69843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69842 ?auto_69838 ?auto_69839 ?auto_69840 ?auto_69841 ?auto_69844 )
      ( MAKE-4PILE ?auto_69838 ?auto_69839 ?auto_69840 ?auto_69841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69846 - BLOCK
    )
    :vars
    (
      ?auto_69847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69847 ?auto_69846 ) ( CLEAR ?auto_69847 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69846 ) ( not ( = ?auto_69846 ?auto_69847 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69847 ?auto_69846 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69848 - BLOCK
    )
    :vars
    (
      ?auto_69849 - BLOCK
      ?auto_69850 - BLOCK
      ?auto_69851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69849 ?auto_69848 ) ( CLEAR ?auto_69849 ) ( ON-TABLE ?auto_69848 ) ( not ( = ?auto_69848 ?auto_69849 ) ) ( HOLDING ?auto_69850 ) ( CLEAR ?auto_69851 ) ( not ( = ?auto_69848 ?auto_69850 ) ) ( not ( = ?auto_69848 ?auto_69851 ) ) ( not ( = ?auto_69849 ?auto_69850 ) ) ( not ( = ?auto_69849 ?auto_69851 ) ) ( not ( = ?auto_69850 ?auto_69851 ) ) )
    :subtasks
    ( ( !STACK ?auto_69850 ?auto_69851 )
      ( MAKE-1PILE ?auto_69848 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69852 - BLOCK
    )
    :vars
    (
      ?auto_69853 - BLOCK
      ?auto_69854 - BLOCK
      ?auto_69855 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69853 ?auto_69852 ) ( ON-TABLE ?auto_69852 ) ( not ( = ?auto_69852 ?auto_69853 ) ) ( CLEAR ?auto_69854 ) ( not ( = ?auto_69852 ?auto_69855 ) ) ( not ( = ?auto_69852 ?auto_69854 ) ) ( not ( = ?auto_69853 ?auto_69855 ) ) ( not ( = ?auto_69853 ?auto_69854 ) ) ( not ( = ?auto_69855 ?auto_69854 ) ) ( ON ?auto_69855 ?auto_69853 ) ( CLEAR ?auto_69855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69852 ?auto_69853 )
      ( MAKE-1PILE ?auto_69852 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69856 - BLOCK
    )
    :vars
    (
      ?auto_69859 - BLOCK
      ?auto_69857 - BLOCK
      ?auto_69858 - BLOCK
      ?auto_69860 - BLOCK
      ?auto_69861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69859 ?auto_69856 ) ( ON-TABLE ?auto_69856 ) ( not ( = ?auto_69856 ?auto_69859 ) ) ( not ( = ?auto_69856 ?auto_69857 ) ) ( not ( = ?auto_69856 ?auto_69858 ) ) ( not ( = ?auto_69859 ?auto_69857 ) ) ( not ( = ?auto_69859 ?auto_69858 ) ) ( not ( = ?auto_69857 ?auto_69858 ) ) ( ON ?auto_69857 ?auto_69859 ) ( CLEAR ?auto_69857 ) ( HOLDING ?auto_69858 ) ( CLEAR ?auto_69860 ) ( ON-TABLE ?auto_69861 ) ( ON ?auto_69860 ?auto_69861 ) ( not ( = ?auto_69861 ?auto_69860 ) ) ( not ( = ?auto_69861 ?auto_69858 ) ) ( not ( = ?auto_69860 ?auto_69858 ) ) ( not ( = ?auto_69856 ?auto_69860 ) ) ( not ( = ?auto_69856 ?auto_69861 ) ) ( not ( = ?auto_69859 ?auto_69860 ) ) ( not ( = ?auto_69859 ?auto_69861 ) ) ( not ( = ?auto_69857 ?auto_69860 ) ) ( not ( = ?auto_69857 ?auto_69861 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69861 ?auto_69860 ?auto_69858 )
      ( MAKE-1PILE ?auto_69856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69862 - BLOCK
    )
    :vars
    (
      ?auto_69866 - BLOCK
      ?auto_69867 - BLOCK
      ?auto_69865 - BLOCK
      ?auto_69863 - BLOCK
      ?auto_69864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69866 ?auto_69862 ) ( ON-TABLE ?auto_69862 ) ( not ( = ?auto_69862 ?auto_69866 ) ) ( not ( = ?auto_69862 ?auto_69867 ) ) ( not ( = ?auto_69862 ?auto_69865 ) ) ( not ( = ?auto_69866 ?auto_69867 ) ) ( not ( = ?auto_69866 ?auto_69865 ) ) ( not ( = ?auto_69867 ?auto_69865 ) ) ( ON ?auto_69867 ?auto_69866 ) ( CLEAR ?auto_69863 ) ( ON-TABLE ?auto_69864 ) ( ON ?auto_69863 ?auto_69864 ) ( not ( = ?auto_69864 ?auto_69863 ) ) ( not ( = ?auto_69864 ?auto_69865 ) ) ( not ( = ?auto_69863 ?auto_69865 ) ) ( not ( = ?auto_69862 ?auto_69863 ) ) ( not ( = ?auto_69862 ?auto_69864 ) ) ( not ( = ?auto_69866 ?auto_69863 ) ) ( not ( = ?auto_69866 ?auto_69864 ) ) ( not ( = ?auto_69867 ?auto_69863 ) ) ( not ( = ?auto_69867 ?auto_69864 ) ) ( ON ?auto_69865 ?auto_69867 ) ( CLEAR ?auto_69865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69862 ?auto_69866 ?auto_69867 )
      ( MAKE-1PILE ?auto_69862 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69868 - BLOCK
    )
    :vars
    (
      ?auto_69870 - BLOCK
      ?auto_69872 - BLOCK
      ?auto_69871 - BLOCK
      ?auto_69869 - BLOCK
      ?auto_69873 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69870 ?auto_69868 ) ( ON-TABLE ?auto_69868 ) ( not ( = ?auto_69868 ?auto_69870 ) ) ( not ( = ?auto_69868 ?auto_69872 ) ) ( not ( = ?auto_69868 ?auto_69871 ) ) ( not ( = ?auto_69870 ?auto_69872 ) ) ( not ( = ?auto_69870 ?auto_69871 ) ) ( not ( = ?auto_69872 ?auto_69871 ) ) ( ON ?auto_69872 ?auto_69870 ) ( ON-TABLE ?auto_69869 ) ( not ( = ?auto_69869 ?auto_69873 ) ) ( not ( = ?auto_69869 ?auto_69871 ) ) ( not ( = ?auto_69873 ?auto_69871 ) ) ( not ( = ?auto_69868 ?auto_69873 ) ) ( not ( = ?auto_69868 ?auto_69869 ) ) ( not ( = ?auto_69870 ?auto_69873 ) ) ( not ( = ?auto_69870 ?auto_69869 ) ) ( not ( = ?auto_69872 ?auto_69873 ) ) ( not ( = ?auto_69872 ?auto_69869 ) ) ( ON ?auto_69871 ?auto_69872 ) ( CLEAR ?auto_69871 ) ( HOLDING ?auto_69873 ) ( CLEAR ?auto_69869 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69869 ?auto_69873 )
      ( MAKE-1PILE ?auto_69868 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69874 - BLOCK
    )
    :vars
    (
      ?auto_69875 - BLOCK
      ?auto_69876 - BLOCK
      ?auto_69879 - BLOCK
      ?auto_69878 - BLOCK
      ?auto_69877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69875 ?auto_69874 ) ( ON-TABLE ?auto_69874 ) ( not ( = ?auto_69874 ?auto_69875 ) ) ( not ( = ?auto_69874 ?auto_69876 ) ) ( not ( = ?auto_69874 ?auto_69879 ) ) ( not ( = ?auto_69875 ?auto_69876 ) ) ( not ( = ?auto_69875 ?auto_69879 ) ) ( not ( = ?auto_69876 ?auto_69879 ) ) ( ON ?auto_69876 ?auto_69875 ) ( ON-TABLE ?auto_69878 ) ( not ( = ?auto_69878 ?auto_69877 ) ) ( not ( = ?auto_69878 ?auto_69879 ) ) ( not ( = ?auto_69877 ?auto_69879 ) ) ( not ( = ?auto_69874 ?auto_69877 ) ) ( not ( = ?auto_69874 ?auto_69878 ) ) ( not ( = ?auto_69875 ?auto_69877 ) ) ( not ( = ?auto_69875 ?auto_69878 ) ) ( not ( = ?auto_69876 ?auto_69877 ) ) ( not ( = ?auto_69876 ?auto_69878 ) ) ( ON ?auto_69879 ?auto_69876 ) ( CLEAR ?auto_69878 ) ( ON ?auto_69877 ?auto_69879 ) ( CLEAR ?auto_69877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69874 ?auto_69875 ?auto_69876 ?auto_69879 )
      ( MAKE-1PILE ?auto_69874 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69880 - BLOCK
    )
    :vars
    (
      ?auto_69882 - BLOCK
      ?auto_69883 - BLOCK
      ?auto_69881 - BLOCK
      ?auto_69885 - BLOCK
      ?auto_69884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69882 ?auto_69880 ) ( ON-TABLE ?auto_69880 ) ( not ( = ?auto_69880 ?auto_69882 ) ) ( not ( = ?auto_69880 ?auto_69883 ) ) ( not ( = ?auto_69880 ?auto_69881 ) ) ( not ( = ?auto_69882 ?auto_69883 ) ) ( not ( = ?auto_69882 ?auto_69881 ) ) ( not ( = ?auto_69883 ?auto_69881 ) ) ( ON ?auto_69883 ?auto_69882 ) ( not ( = ?auto_69885 ?auto_69884 ) ) ( not ( = ?auto_69885 ?auto_69881 ) ) ( not ( = ?auto_69884 ?auto_69881 ) ) ( not ( = ?auto_69880 ?auto_69884 ) ) ( not ( = ?auto_69880 ?auto_69885 ) ) ( not ( = ?auto_69882 ?auto_69884 ) ) ( not ( = ?auto_69882 ?auto_69885 ) ) ( not ( = ?auto_69883 ?auto_69884 ) ) ( not ( = ?auto_69883 ?auto_69885 ) ) ( ON ?auto_69881 ?auto_69883 ) ( ON ?auto_69884 ?auto_69881 ) ( CLEAR ?auto_69884 ) ( HOLDING ?auto_69885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69885 )
      ( MAKE-1PILE ?auto_69880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69886 - BLOCK
    )
    :vars
    (
      ?auto_69887 - BLOCK
      ?auto_69891 - BLOCK
      ?auto_69889 - BLOCK
      ?auto_69890 - BLOCK
      ?auto_69888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69887 ?auto_69886 ) ( ON-TABLE ?auto_69886 ) ( not ( = ?auto_69886 ?auto_69887 ) ) ( not ( = ?auto_69886 ?auto_69891 ) ) ( not ( = ?auto_69886 ?auto_69889 ) ) ( not ( = ?auto_69887 ?auto_69891 ) ) ( not ( = ?auto_69887 ?auto_69889 ) ) ( not ( = ?auto_69891 ?auto_69889 ) ) ( ON ?auto_69891 ?auto_69887 ) ( not ( = ?auto_69890 ?auto_69888 ) ) ( not ( = ?auto_69890 ?auto_69889 ) ) ( not ( = ?auto_69888 ?auto_69889 ) ) ( not ( = ?auto_69886 ?auto_69888 ) ) ( not ( = ?auto_69886 ?auto_69890 ) ) ( not ( = ?auto_69887 ?auto_69888 ) ) ( not ( = ?auto_69887 ?auto_69890 ) ) ( not ( = ?auto_69891 ?auto_69888 ) ) ( not ( = ?auto_69891 ?auto_69890 ) ) ( ON ?auto_69889 ?auto_69891 ) ( ON ?auto_69888 ?auto_69889 ) ( ON ?auto_69890 ?auto_69888 ) ( CLEAR ?auto_69890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69886 ?auto_69887 ?auto_69891 ?auto_69889 ?auto_69888 )
      ( MAKE-1PILE ?auto_69886 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69892 - BLOCK
    )
    :vars
    (
      ?auto_69894 - BLOCK
      ?auto_69896 - BLOCK
      ?auto_69893 - BLOCK
      ?auto_69897 - BLOCK
      ?auto_69895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69894 ?auto_69892 ) ( ON-TABLE ?auto_69892 ) ( not ( = ?auto_69892 ?auto_69894 ) ) ( not ( = ?auto_69892 ?auto_69896 ) ) ( not ( = ?auto_69892 ?auto_69893 ) ) ( not ( = ?auto_69894 ?auto_69896 ) ) ( not ( = ?auto_69894 ?auto_69893 ) ) ( not ( = ?auto_69896 ?auto_69893 ) ) ( ON ?auto_69896 ?auto_69894 ) ( not ( = ?auto_69897 ?auto_69895 ) ) ( not ( = ?auto_69897 ?auto_69893 ) ) ( not ( = ?auto_69895 ?auto_69893 ) ) ( not ( = ?auto_69892 ?auto_69895 ) ) ( not ( = ?auto_69892 ?auto_69897 ) ) ( not ( = ?auto_69894 ?auto_69895 ) ) ( not ( = ?auto_69894 ?auto_69897 ) ) ( not ( = ?auto_69896 ?auto_69895 ) ) ( not ( = ?auto_69896 ?auto_69897 ) ) ( ON ?auto_69893 ?auto_69896 ) ( ON ?auto_69895 ?auto_69893 ) ( HOLDING ?auto_69897 ) ( CLEAR ?auto_69895 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69892 ?auto_69894 ?auto_69896 ?auto_69893 ?auto_69895 ?auto_69897 )
      ( MAKE-1PILE ?auto_69892 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69898 - BLOCK
    )
    :vars
    (
      ?auto_69903 - BLOCK
      ?auto_69901 - BLOCK
      ?auto_69900 - BLOCK
      ?auto_69899 - BLOCK
      ?auto_69902 - BLOCK
      ?auto_69904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69903 ?auto_69898 ) ( ON-TABLE ?auto_69898 ) ( not ( = ?auto_69898 ?auto_69903 ) ) ( not ( = ?auto_69898 ?auto_69901 ) ) ( not ( = ?auto_69898 ?auto_69900 ) ) ( not ( = ?auto_69903 ?auto_69901 ) ) ( not ( = ?auto_69903 ?auto_69900 ) ) ( not ( = ?auto_69901 ?auto_69900 ) ) ( ON ?auto_69901 ?auto_69903 ) ( not ( = ?auto_69899 ?auto_69902 ) ) ( not ( = ?auto_69899 ?auto_69900 ) ) ( not ( = ?auto_69902 ?auto_69900 ) ) ( not ( = ?auto_69898 ?auto_69902 ) ) ( not ( = ?auto_69898 ?auto_69899 ) ) ( not ( = ?auto_69903 ?auto_69902 ) ) ( not ( = ?auto_69903 ?auto_69899 ) ) ( not ( = ?auto_69901 ?auto_69902 ) ) ( not ( = ?auto_69901 ?auto_69899 ) ) ( ON ?auto_69900 ?auto_69901 ) ( ON ?auto_69902 ?auto_69900 ) ( CLEAR ?auto_69902 ) ( ON ?auto_69899 ?auto_69904 ) ( CLEAR ?auto_69899 ) ( HAND-EMPTY ) ( not ( = ?auto_69898 ?auto_69904 ) ) ( not ( = ?auto_69903 ?auto_69904 ) ) ( not ( = ?auto_69901 ?auto_69904 ) ) ( not ( = ?auto_69900 ?auto_69904 ) ) ( not ( = ?auto_69899 ?auto_69904 ) ) ( not ( = ?auto_69902 ?auto_69904 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69899 ?auto_69904 )
      ( MAKE-1PILE ?auto_69898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69905 - BLOCK
    )
    :vars
    (
      ?auto_69909 - BLOCK
      ?auto_69910 - BLOCK
      ?auto_69906 - BLOCK
      ?auto_69911 - BLOCK
      ?auto_69908 - BLOCK
      ?auto_69907 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69909 ?auto_69905 ) ( ON-TABLE ?auto_69905 ) ( not ( = ?auto_69905 ?auto_69909 ) ) ( not ( = ?auto_69905 ?auto_69910 ) ) ( not ( = ?auto_69905 ?auto_69906 ) ) ( not ( = ?auto_69909 ?auto_69910 ) ) ( not ( = ?auto_69909 ?auto_69906 ) ) ( not ( = ?auto_69910 ?auto_69906 ) ) ( ON ?auto_69910 ?auto_69909 ) ( not ( = ?auto_69911 ?auto_69908 ) ) ( not ( = ?auto_69911 ?auto_69906 ) ) ( not ( = ?auto_69908 ?auto_69906 ) ) ( not ( = ?auto_69905 ?auto_69908 ) ) ( not ( = ?auto_69905 ?auto_69911 ) ) ( not ( = ?auto_69909 ?auto_69908 ) ) ( not ( = ?auto_69909 ?auto_69911 ) ) ( not ( = ?auto_69910 ?auto_69908 ) ) ( not ( = ?auto_69910 ?auto_69911 ) ) ( ON ?auto_69906 ?auto_69910 ) ( ON ?auto_69911 ?auto_69907 ) ( CLEAR ?auto_69911 ) ( not ( = ?auto_69905 ?auto_69907 ) ) ( not ( = ?auto_69909 ?auto_69907 ) ) ( not ( = ?auto_69910 ?auto_69907 ) ) ( not ( = ?auto_69906 ?auto_69907 ) ) ( not ( = ?auto_69911 ?auto_69907 ) ) ( not ( = ?auto_69908 ?auto_69907 ) ) ( HOLDING ?auto_69908 ) ( CLEAR ?auto_69906 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_69905 ?auto_69909 ?auto_69910 ?auto_69906 ?auto_69908 )
      ( MAKE-1PILE ?auto_69905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69912 - BLOCK
    )
    :vars
    (
      ?auto_69914 - BLOCK
      ?auto_69916 - BLOCK
      ?auto_69917 - BLOCK
      ?auto_69918 - BLOCK
      ?auto_69915 - BLOCK
      ?auto_69913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69914 ?auto_69912 ) ( ON-TABLE ?auto_69912 ) ( not ( = ?auto_69912 ?auto_69914 ) ) ( not ( = ?auto_69912 ?auto_69916 ) ) ( not ( = ?auto_69912 ?auto_69917 ) ) ( not ( = ?auto_69914 ?auto_69916 ) ) ( not ( = ?auto_69914 ?auto_69917 ) ) ( not ( = ?auto_69916 ?auto_69917 ) ) ( ON ?auto_69916 ?auto_69914 ) ( not ( = ?auto_69918 ?auto_69915 ) ) ( not ( = ?auto_69918 ?auto_69917 ) ) ( not ( = ?auto_69915 ?auto_69917 ) ) ( not ( = ?auto_69912 ?auto_69915 ) ) ( not ( = ?auto_69912 ?auto_69918 ) ) ( not ( = ?auto_69914 ?auto_69915 ) ) ( not ( = ?auto_69914 ?auto_69918 ) ) ( not ( = ?auto_69916 ?auto_69915 ) ) ( not ( = ?auto_69916 ?auto_69918 ) ) ( ON ?auto_69917 ?auto_69916 ) ( ON ?auto_69918 ?auto_69913 ) ( not ( = ?auto_69912 ?auto_69913 ) ) ( not ( = ?auto_69914 ?auto_69913 ) ) ( not ( = ?auto_69916 ?auto_69913 ) ) ( not ( = ?auto_69917 ?auto_69913 ) ) ( not ( = ?auto_69918 ?auto_69913 ) ) ( not ( = ?auto_69915 ?auto_69913 ) ) ( CLEAR ?auto_69917 ) ( ON ?auto_69915 ?auto_69918 ) ( CLEAR ?auto_69915 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_69913 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69913 ?auto_69918 )
      ( MAKE-1PILE ?auto_69912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69919 - BLOCK
    )
    :vars
    (
      ?auto_69922 - BLOCK
      ?auto_69924 - BLOCK
      ?auto_69920 - BLOCK
      ?auto_69923 - BLOCK
      ?auto_69921 - BLOCK
      ?auto_69925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69922 ?auto_69919 ) ( ON-TABLE ?auto_69919 ) ( not ( = ?auto_69919 ?auto_69922 ) ) ( not ( = ?auto_69919 ?auto_69924 ) ) ( not ( = ?auto_69919 ?auto_69920 ) ) ( not ( = ?auto_69922 ?auto_69924 ) ) ( not ( = ?auto_69922 ?auto_69920 ) ) ( not ( = ?auto_69924 ?auto_69920 ) ) ( ON ?auto_69924 ?auto_69922 ) ( not ( = ?auto_69923 ?auto_69921 ) ) ( not ( = ?auto_69923 ?auto_69920 ) ) ( not ( = ?auto_69921 ?auto_69920 ) ) ( not ( = ?auto_69919 ?auto_69921 ) ) ( not ( = ?auto_69919 ?auto_69923 ) ) ( not ( = ?auto_69922 ?auto_69921 ) ) ( not ( = ?auto_69922 ?auto_69923 ) ) ( not ( = ?auto_69924 ?auto_69921 ) ) ( not ( = ?auto_69924 ?auto_69923 ) ) ( ON ?auto_69923 ?auto_69925 ) ( not ( = ?auto_69919 ?auto_69925 ) ) ( not ( = ?auto_69922 ?auto_69925 ) ) ( not ( = ?auto_69924 ?auto_69925 ) ) ( not ( = ?auto_69920 ?auto_69925 ) ) ( not ( = ?auto_69923 ?auto_69925 ) ) ( not ( = ?auto_69921 ?auto_69925 ) ) ( ON ?auto_69921 ?auto_69923 ) ( CLEAR ?auto_69921 ) ( ON-TABLE ?auto_69925 ) ( HOLDING ?auto_69920 ) ( CLEAR ?auto_69924 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69919 ?auto_69922 ?auto_69924 ?auto_69920 )
      ( MAKE-1PILE ?auto_69919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69926 - BLOCK
    )
    :vars
    (
      ?auto_69927 - BLOCK
      ?auto_69928 - BLOCK
      ?auto_69930 - BLOCK
      ?auto_69932 - BLOCK
      ?auto_69931 - BLOCK
      ?auto_69929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69927 ?auto_69926 ) ( ON-TABLE ?auto_69926 ) ( not ( = ?auto_69926 ?auto_69927 ) ) ( not ( = ?auto_69926 ?auto_69928 ) ) ( not ( = ?auto_69926 ?auto_69930 ) ) ( not ( = ?auto_69927 ?auto_69928 ) ) ( not ( = ?auto_69927 ?auto_69930 ) ) ( not ( = ?auto_69928 ?auto_69930 ) ) ( ON ?auto_69928 ?auto_69927 ) ( not ( = ?auto_69932 ?auto_69931 ) ) ( not ( = ?auto_69932 ?auto_69930 ) ) ( not ( = ?auto_69931 ?auto_69930 ) ) ( not ( = ?auto_69926 ?auto_69931 ) ) ( not ( = ?auto_69926 ?auto_69932 ) ) ( not ( = ?auto_69927 ?auto_69931 ) ) ( not ( = ?auto_69927 ?auto_69932 ) ) ( not ( = ?auto_69928 ?auto_69931 ) ) ( not ( = ?auto_69928 ?auto_69932 ) ) ( ON ?auto_69932 ?auto_69929 ) ( not ( = ?auto_69926 ?auto_69929 ) ) ( not ( = ?auto_69927 ?auto_69929 ) ) ( not ( = ?auto_69928 ?auto_69929 ) ) ( not ( = ?auto_69930 ?auto_69929 ) ) ( not ( = ?auto_69932 ?auto_69929 ) ) ( not ( = ?auto_69931 ?auto_69929 ) ) ( ON ?auto_69931 ?auto_69932 ) ( ON-TABLE ?auto_69929 ) ( CLEAR ?auto_69928 ) ( ON ?auto_69930 ?auto_69931 ) ( CLEAR ?auto_69930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69929 ?auto_69932 ?auto_69931 )
      ( MAKE-1PILE ?auto_69926 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69933 - BLOCK
    )
    :vars
    (
      ?auto_69934 - BLOCK
      ?auto_69937 - BLOCK
      ?auto_69939 - BLOCK
      ?auto_69938 - BLOCK
      ?auto_69935 - BLOCK
      ?auto_69936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69934 ?auto_69933 ) ( ON-TABLE ?auto_69933 ) ( not ( = ?auto_69933 ?auto_69934 ) ) ( not ( = ?auto_69933 ?auto_69937 ) ) ( not ( = ?auto_69933 ?auto_69939 ) ) ( not ( = ?auto_69934 ?auto_69937 ) ) ( not ( = ?auto_69934 ?auto_69939 ) ) ( not ( = ?auto_69937 ?auto_69939 ) ) ( not ( = ?auto_69938 ?auto_69935 ) ) ( not ( = ?auto_69938 ?auto_69939 ) ) ( not ( = ?auto_69935 ?auto_69939 ) ) ( not ( = ?auto_69933 ?auto_69935 ) ) ( not ( = ?auto_69933 ?auto_69938 ) ) ( not ( = ?auto_69934 ?auto_69935 ) ) ( not ( = ?auto_69934 ?auto_69938 ) ) ( not ( = ?auto_69937 ?auto_69935 ) ) ( not ( = ?auto_69937 ?auto_69938 ) ) ( ON ?auto_69938 ?auto_69936 ) ( not ( = ?auto_69933 ?auto_69936 ) ) ( not ( = ?auto_69934 ?auto_69936 ) ) ( not ( = ?auto_69937 ?auto_69936 ) ) ( not ( = ?auto_69939 ?auto_69936 ) ) ( not ( = ?auto_69938 ?auto_69936 ) ) ( not ( = ?auto_69935 ?auto_69936 ) ) ( ON ?auto_69935 ?auto_69938 ) ( ON-TABLE ?auto_69936 ) ( ON ?auto_69939 ?auto_69935 ) ( CLEAR ?auto_69939 ) ( HOLDING ?auto_69937 ) ( CLEAR ?auto_69934 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_69933 ?auto_69934 ?auto_69937 )
      ( MAKE-1PILE ?auto_69933 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69940 - BLOCK
    )
    :vars
    (
      ?auto_69943 - BLOCK
      ?auto_69944 - BLOCK
      ?auto_69942 - BLOCK
      ?auto_69941 - BLOCK
      ?auto_69945 - BLOCK
      ?auto_69946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_69943 ?auto_69940 ) ( ON-TABLE ?auto_69940 ) ( not ( = ?auto_69940 ?auto_69943 ) ) ( not ( = ?auto_69940 ?auto_69944 ) ) ( not ( = ?auto_69940 ?auto_69942 ) ) ( not ( = ?auto_69943 ?auto_69944 ) ) ( not ( = ?auto_69943 ?auto_69942 ) ) ( not ( = ?auto_69944 ?auto_69942 ) ) ( not ( = ?auto_69941 ?auto_69945 ) ) ( not ( = ?auto_69941 ?auto_69942 ) ) ( not ( = ?auto_69945 ?auto_69942 ) ) ( not ( = ?auto_69940 ?auto_69945 ) ) ( not ( = ?auto_69940 ?auto_69941 ) ) ( not ( = ?auto_69943 ?auto_69945 ) ) ( not ( = ?auto_69943 ?auto_69941 ) ) ( not ( = ?auto_69944 ?auto_69945 ) ) ( not ( = ?auto_69944 ?auto_69941 ) ) ( ON ?auto_69941 ?auto_69946 ) ( not ( = ?auto_69940 ?auto_69946 ) ) ( not ( = ?auto_69943 ?auto_69946 ) ) ( not ( = ?auto_69944 ?auto_69946 ) ) ( not ( = ?auto_69942 ?auto_69946 ) ) ( not ( = ?auto_69941 ?auto_69946 ) ) ( not ( = ?auto_69945 ?auto_69946 ) ) ( ON ?auto_69945 ?auto_69941 ) ( ON-TABLE ?auto_69946 ) ( ON ?auto_69942 ?auto_69945 ) ( CLEAR ?auto_69943 ) ( ON ?auto_69944 ?auto_69942 ) ( CLEAR ?auto_69944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69946 ?auto_69941 ?auto_69945 ?auto_69942 )
      ( MAKE-1PILE ?auto_69940 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69961 - BLOCK
    )
    :vars
    (
      ?auto_69967 - BLOCK
      ?auto_69962 - BLOCK
      ?auto_69963 - BLOCK
      ?auto_69965 - BLOCK
      ?auto_69964 - BLOCK
      ?auto_69966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69961 ?auto_69967 ) ) ( not ( = ?auto_69961 ?auto_69962 ) ) ( not ( = ?auto_69961 ?auto_69963 ) ) ( not ( = ?auto_69967 ?auto_69962 ) ) ( not ( = ?auto_69967 ?auto_69963 ) ) ( not ( = ?auto_69962 ?auto_69963 ) ) ( not ( = ?auto_69965 ?auto_69964 ) ) ( not ( = ?auto_69965 ?auto_69963 ) ) ( not ( = ?auto_69964 ?auto_69963 ) ) ( not ( = ?auto_69961 ?auto_69964 ) ) ( not ( = ?auto_69961 ?auto_69965 ) ) ( not ( = ?auto_69967 ?auto_69964 ) ) ( not ( = ?auto_69967 ?auto_69965 ) ) ( not ( = ?auto_69962 ?auto_69964 ) ) ( not ( = ?auto_69962 ?auto_69965 ) ) ( ON ?auto_69965 ?auto_69966 ) ( not ( = ?auto_69961 ?auto_69966 ) ) ( not ( = ?auto_69967 ?auto_69966 ) ) ( not ( = ?auto_69962 ?auto_69966 ) ) ( not ( = ?auto_69963 ?auto_69966 ) ) ( not ( = ?auto_69965 ?auto_69966 ) ) ( not ( = ?auto_69964 ?auto_69966 ) ) ( ON ?auto_69964 ?auto_69965 ) ( ON-TABLE ?auto_69966 ) ( ON ?auto_69963 ?auto_69964 ) ( ON ?auto_69962 ?auto_69963 ) ( ON ?auto_69967 ?auto_69962 ) ( CLEAR ?auto_69967 ) ( HOLDING ?auto_69961 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_69961 ?auto_69967 )
      ( MAKE-1PILE ?auto_69961 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_69968 - BLOCK
    )
    :vars
    (
      ?auto_69974 - BLOCK
      ?auto_69972 - BLOCK
      ?auto_69970 - BLOCK
      ?auto_69971 - BLOCK
      ?auto_69969 - BLOCK
      ?auto_69973 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_69968 ?auto_69974 ) ) ( not ( = ?auto_69968 ?auto_69972 ) ) ( not ( = ?auto_69968 ?auto_69970 ) ) ( not ( = ?auto_69974 ?auto_69972 ) ) ( not ( = ?auto_69974 ?auto_69970 ) ) ( not ( = ?auto_69972 ?auto_69970 ) ) ( not ( = ?auto_69971 ?auto_69969 ) ) ( not ( = ?auto_69971 ?auto_69970 ) ) ( not ( = ?auto_69969 ?auto_69970 ) ) ( not ( = ?auto_69968 ?auto_69969 ) ) ( not ( = ?auto_69968 ?auto_69971 ) ) ( not ( = ?auto_69974 ?auto_69969 ) ) ( not ( = ?auto_69974 ?auto_69971 ) ) ( not ( = ?auto_69972 ?auto_69969 ) ) ( not ( = ?auto_69972 ?auto_69971 ) ) ( ON ?auto_69971 ?auto_69973 ) ( not ( = ?auto_69968 ?auto_69973 ) ) ( not ( = ?auto_69974 ?auto_69973 ) ) ( not ( = ?auto_69972 ?auto_69973 ) ) ( not ( = ?auto_69970 ?auto_69973 ) ) ( not ( = ?auto_69971 ?auto_69973 ) ) ( not ( = ?auto_69969 ?auto_69973 ) ) ( ON ?auto_69969 ?auto_69971 ) ( ON-TABLE ?auto_69973 ) ( ON ?auto_69970 ?auto_69969 ) ( ON ?auto_69972 ?auto_69970 ) ( ON ?auto_69974 ?auto_69972 ) ( ON ?auto_69968 ?auto_69974 ) ( CLEAR ?auto_69968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_69973 ?auto_69971 ?auto_69969 ?auto_69970 ?auto_69972 ?auto_69974 )
      ( MAKE-1PILE ?auto_69968 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69980 - BLOCK
      ?auto_69981 - BLOCK
      ?auto_69982 - BLOCK
      ?auto_69983 - BLOCK
      ?auto_69984 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_69984 ) ( CLEAR ?auto_69983 ) ( ON-TABLE ?auto_69980 ) ( ON ?auto_69981 ?auto_69980 ) ( ON ?auto_69982 ?auto_69981 ) ( ON ?auto_69983 ?auto_69982 ) ( not ( = ?auto_69980 ?auto_69981 ) ) ( not ( = ?auto_69980 ?auto_69982 ) ) ( not ( = ?auto_69980 ?auto_69983 ) ) ( not ( = ?auto_69980 ?auto_69984 ) ) ( not ( = ?auto_69981 ?auto_69982 ) ) ( not ( = ?auto_69981 ?auto_69983 ) ) ( not ( = ?auto_69981 ?auto_69984 ) ) ( not ( = ?auto_69982 ?auto_69983 ) ) ( not ( = ?auto_69982 ?auto_69984 ) ) ( not ( = ?auto_69983 ?auto_69984 ) ) )
    :subtasks
    ( ( !STACK ?auto_69984 ?auto_69983 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69985 - BLOCK
      ?auto_69986 - BLOCK
      ?auto_69987 - BLOCK
      ?auto_69988 - BLOCK
      ?auto_69989 - BLOCK
    )
    :vars
    (
      ?auto_69990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_69988 ) ( ON-TABLE ?auto_69985 ) ( ON ?auto_69986 ?auto_69985 ) ( ON ?auto_69987 ?auto_69986 ) ( ON ?auto_69988 ?auto_69987 ) ( not ( = ?auto_69985 ?auto_69986 ) ) ( not ( = ?auto_69985 ?auto_69987 ) ) ( not ( = ?auto_69985 ?auto_69988 ) ) ( not ( = ?auto_69985 ?auto_69989 ) ) ( not ( = ?auto_69986 ?auto_69987 ) ) ( not ( = ?auto_69986 ?auto_69988 ) ) ( not ( = ?auto_69986 ?auto_69989 ) ) ( not ( = ?auto_69987 ?auto_69988 ) ) ( not ( = ?auto_69987 ?auto_69989 ) ) ( not ( = ?auto_69988 ?auto_69989 ) ) ( ON ?auto_69989 ?auto_69990 ) ( CLEAR ?auto_69989 ) ( HAND-EMPTY ) ( not ( = ?auto_69985 ?auto_69990 ) ) ( not ( = ?auto_69986 ?auto_69990 ) ) ( not ( = ?auto_69987 ?auto_69990 ) ) ( not ( = ?auto_69988 ?auto_69990 ) ) ( not ( = ?auto_69989 ?auto_69990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_69989 ?auto_69990 )
      ( MAKE-5PILE ?auto_69985 ?auto_69986 ?auto_69987 ?auto_69988 ?auto_69989 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69991 - BLOCK
      ?auto_69992 - BLOCK
      ?auto_69993 - BLOCK
      ?auto_69994 - BLOCK
      ?auto_69995 - BLOCK
    )
    :vars
    (
      ?auto_69996 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69991 ) ( ON ?auto_69992 ?auto_69991 ) ( ON ?auto_69993 ?auto_69992 ) ( not ( = ?auto_69991 ?auto_69992 ) ) ( not ( = ?auto_69991 ?auto_69993 ) ) ( not ( = ?auto_69991 ?auto_69994 ) ) ( not ( = ?auto_69991 ?auto_69995 ) ) ( not ( = ?auto_69992 ?auto_69993 ) ) ( not ( = ?auto_69992 ?auto_69994 ) ) ( not ( = ?auto_69992 ?auto_69995 ) ) ( not ( = ?auto_69993 ?auto_69994 ) ) ( not ( = ?auto_69993 ?auto_69995 ) ) ( not ( = ?auto_69994 ?auto_69995 ) ) ( ON ?auto_69995 ?auto_69996 ) ( CLEAR ?auto_69995 ) ( not ( = ?auto_69991 ?auto_69996 ) ) ( not ( = ?auto_69992 ?auto_69996 ) ) ( not ( = ?auto_69993 ?auto_69996 ) ) ( not ( = ?auto_69994 ?auto_69996 ) ) ( not ( = ?auto_69995 ?auto_69996 ) ) ( HOLDING ?auto_69994 ) ( CLEAR ?auto_69993 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_69991 ?auto_69992 ?auto_69993 ?auto_69994 )
      ( MAKE-5PILE ?auto_69991 ?auto_69992 ?auto_69993 ?auto_69994 ?auto_69995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_69997 - BLOCK
      ?auto_69998 - BLOCK
      ?auto_69999 - BLOCK
      ?auto_70000 - BLOCK
      ?auto_70001 - BLOCK
    )
    :vars
    (
      ?auto_70002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_69997 ) ( ON ?auto_69998 ?auto_69997 ) ( ON ?auto_69999 ?auto_69998 ) ( not ( = ?auto_69997 ?auto_69998 ) ) ( not ( = ?auto_69997 ?auto_69999 ) ) ( not ( = ?auto_69997 ?auto_70000 ) ) ( not ( = ?auto_69997 ?auto_70001 ) ) ( not ( = ?auto_69998 ?auto_69999 ) ) ( not ( = ?auto_69998 ?auto_70000 ) ) ( not ( = ?auto_69998 ?auto_70001 ) ) ( not ( = ?auto_69999 ?auto_70000 ) ) ( not ( = ?auto_69999 ?auto_70001 ) ) ( not ( = ?auto_70000 ?auto_70001 ) ) ( ON ?auto_70001 ?auto_70002 ) ( not ( = ?auto_69997 ?auto_70002 ) ) ( not ( = ?auto_69998 ?auto_70002 ) ) ( not ( = ?auto_69999 ?auto_70002 ) ) ( not ( = ?auto_70000 ?auto_70002 ) ) ( not ( = ?auto_70001 ?auto_70002 ) ) ( CLEAR ?auto_69999 ) ( ON ?auto_70000 ?auto_70001 ) ( CLEAR ?auto_70000 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70002 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70002 ?auto_70001 )
      ( MAKE-5PILE ?auto_69997 ?auto_69998 ?auto_69999 ?auto_70000 ?auto_70001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70003 - BLOCK
      ?auto_70004 - BLOCK
      ?auto_70005 - BLOCK
      ?auto_70006 - BLOCK
      ?auto_70007 - BLOCK
    )
    :vars
    (
      ?auto_70008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70003 ) ( ON ?auto_70004 ?auto_70003 ) ( not ( = ?auto_70003 ?auto_70004 ) ) ( not ( = ?auto_70003 ?auto_70005 ) ) ( not ( = ?auto_70003 ?auto_70006 ) ) ( not ( = ?auto_70003 ?auto_70007 ) ) ( not ( = ?auto_70004 ?auto_70005 ) ) ( not ( = ?auto_70004 ?auto_70006 ) ) ( not ( = ?auto_70004 ?auto_70007 ) ) ( not ( = ?auto_70005 ?auto_70006 ) ) ( not ( = ?auto_70005 ?auto_70007 ) ) ( not ( = ?auto_70006 ?auto_70007 ) ) ( ON ?auto_70007 ?auto_70008 ) ( not ( = ?auto_70003 ?auto_70008 ) ) ( not ( = ?auto_70004 ?auto_70008 ) ) ( not ( = ?auto_70005 ?auto_70008 ) ) ( not ( = ?auto_70006 ?auto_70008 ) ) ( not ( = ?auto_70007 ?auto_70008 ) ) ( ON ?auto_70006 ?auto_70007 ) ( CLEAR ?auto_70006 ) ( ON-TABLE ?auto_70008 ) ( HOLDING ?auto_70005 ) ( CLEAR ?auto_70004 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70003 ?auto_70004 ?auto_70005 )
      ( MAKE-5PILE ?auto_70003 ?auto_70004 ?auto_70005 ?auto_70006 ?auto_70007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70009 - BLOCK
      ?auto_70010 - BLOCK
      ?auto_70011 - BLOCK
      ?auto_70012 - BLOCK
      ?auto_70013 - BLOCK
    )
    :vars
    (
      ?auto_70014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70009 ) ( ON ?auto_70010 ?auto_70009 ) ( not ( = ?auto_70009 ?auto_70010 ) ) ( not ( = ?auto_70009 ?auto_70011 ) ) ( not ( = ?auto_70009 ?auto_70012 ) ) ( not ( = ?auto_70009 ?auto_70013 ) ) ( not ( = ?auto_70010 ?auto_70011 ) ) ( not ( = ?auto_70010 ?auto_70012 ) ) ( not ( = ?auto_70010 ?auto_70013 ) ) ( not ( = ?auto_70011 ?auto_70012 ) ) ( not ( = ?auto_70011 ?auto_70013 ) ) ( not ( = ?auto_70012 ?auto_70013 ) ) ( ON ?auto_70013 ?auto_70014 ) ( not ( = ?auto_70009 ?auto_70014 ) ) ( not ( = ?auto_70010 ?auto_70014 ) ) ( not ( = ?auto_70011 ?auto_70014 ) ) ( not ( = ?auto_70012 ?auto_70014 ) ) ( not ( = ?auto_70013 ?auto_70014 ) ) ( ON ?auto_70012 ?auto_70013 ) ( ON-TABLE ?auto_70014 ) ( CLEAR ?auto_70010 ) ( ON ?auto_70011 ?auto_70012 ) ( CLEAR ?auto_70011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70014 ?auto_70013 ?auto_70012 )
      ( MAKE-5PILE ?auto_70009 ?auto_70010 ?auto_70011 ?auto_70012 ?auto_70013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70015 - BLOCK
      ?auto_70016 - BLOCK
      ?auto_70017 - BLOCK
      ?auto_70018 - BLOCK
      ?auto_70019 - BLOCK
    )
    :vars
    (
      ?auto_70020 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70015 ) ( not ( = ?auto_70015 ?auto_70016 ) ) ( not ( = ?auto_70015 ?auto_70017 ) ) ( not ( = ?auto_70015 ?auto_70018 ) ) ( not ( = ?auto_70015 ?auto_70019 ) ) ( not ( = ?auto_70016 ?auto_70017 ) ) ( not ( = ?auto_70016 ?auto_70018 ) ) ( not ( = ?auto_70016 ?auto_70019 ) ) ( not ( = ?auto_70017 ?auto_70018 ) ) ( not ( = ?auto_70017 ?auto_70019 ) ) ( not ( = ?auto_70018 ?auto_70019 ) ) ( ON ?auto_70019 ?auto_70020 ) ( not ( = ?auto_70015 ?auto_70020 ) ) ( not ( = ?auto_70016 ?auto_70020 ) ) ( not ( = ?auto_70017 ?auto_70020 ) ) ( not ( = ?auto_70018 ?auto_70020 ) ) ( not ( = ?auto_70019 ?auto_70020 ) ) ( ON ?auto_70018 ?auto_70019 ) ( ON-TABLE ?auto_70020 ) ( ON ?auto_70017 ?auto_70018 ) ( CLEAR ?auto_70017 ) ( HOLDING ?auto_70016 ) ( CLEAR ?auto_70015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70015 ?auto_70016 )
      ( MAKE-5PILE ?auto_70015 ?auto_70016 ?auto_70017 ?auto_70018 ?auto_70019 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70021 - BLOCK
      ?auto_70022 - BLOCK
      ?auto_70023 - BLOCK
      ?auto_70024 - BLOCK
      ?auto_70025 - BLOCK
    )
    :vars
    (
      ?auto_70026 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70021 ) ( not ( = ?auto_70021 ?auto_70022 ) ) ( not ( = ?auto_70021 ?auto_70023 ) ) ( not ( = ?auto_70021 ?auto_70024 ) ) ( not ( = ?auto_70021 ?auto_70025 ) ) ( not ( = ?auto_70022 ?auto_70023 ) ) ( not ( = ?auto_70022 ?auto_70024 ) ) ( not ( = ?auto_70022 ?auto_70025 ) ) ( not ( = ?auto_70023 ?auto_70024 ) ) ( not ( = ?auto_70023 ?auto_70025 ) ) ( not ( = ?auto_70024 ?auto_70025 ) ) ( ON ?auto_70025 ?auto_70026 ) ( not ( = ?auto_70021 ?auto_70026 ) ) ( not ( = ?auto_70022 ?auto_70026 ) ) ( not ( = ?auto_70023 ?auto_70026 ) ) ( not ( = ?auto_70024 ?auto_70026 ) ) ( not ( = ?auto_70025 ?auto_70026 ) ) ( ON ?auto_70024 ?auto_70025 ) ( ON-TABLE ?auto_70026 ) ( ON ?auto_70023 ?auto_70024 ) ( CLEAR ?auto_70021 ) ( ON ?auto_70022 ?auto_70023 ) ( CLEAR ?auto_70022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70026 ?auto_70025 ?auto_70024 ?auto_70023 )
      ( MAKE-5PILE ?auto_70021 ?auto_70022 ?auto_70023 ?auto_70024 ?auto_70025 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70027 - BLOCK
      ?auto_70028 - BLOCK
      ?auto_70029 - BLOCK
      ?auto_70030 - BLOCK
      ?auto_70031 - BLOCK
    )
    :vars
    (
      ?auto_70032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70027 ?auto_70028 ) ) ( not ( = ?auto_70027 ?auto_70029 ) ) ( not ( = ?auto_70027 ?auto_70030 ) ) ( not ( = ?auto_70027 ?auto_70031 ) ) ( not ( = ?auto_70028 ?auto_70029 ) ) ( not ( = ?auto_70028 ?auto_70030 ) ) ( not ( = ?auto_70028 ?auto_70031 ) ) ( not ( = ?auto_70029 ?auto_70030 ) ) ( not ( = ?auto_70029 ?auto_70031 ) ) ( not ( = ?auto_70030 ?auto_70031 ) ) ( ON ?auto_70031 ?auto_70032 ) ( not ( = ?auto_70027 ?auto_70032 ) ) ( not ( = ?auto_70028 ?auto_70032 ) ) ( not ( = ?auto_70029 ?auto_70032 ) ) ( not ( = ?auto_70030 ?auto_70032 ) ) ( not ( = ?auto_70031 ?auto_70032 ) ) ( ON ?auto_70030 ?auto_70031 ) ( ON-TABLE ?auto_70032 ) ( ON ?auto_70029 ?auto_70030 ) ( ON ?auto_70028 ?auto_70029 ) ( CLEAR ?auto_70028 ) ( HOLDING ?auto_70027 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70027 )
      ( MAKE-5PILE ?auto_70027 ?auto_70028 ?auto_70029 ?auto_70030 ?auto_70031 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70033 - BLOCK
      ?auto_70034 - BLOCK
      ?auto_70035 - BLOCK
      ?auto_70036 - BLOCK
      ?auto_70037 - BLOCK
    )
    :vars
    (
      ?auto_70038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70033 ?auto_70034 ) ) ( not ( = ?auto_70033 ?auto_70035 ) ) ( not ( = ?auto_70033 ?auto_70036 ) ) ( not ( = ?auto_70033 ?auto_70037 ) ) ( not ( = ?auto_70034 ?auto_70035 ) ) ( not ( = ?auto_70034 ?auto_70036 ) ) ( not ( = ?auto_70034 ?auto_70037 ) ) ( not ( = ?auto_70035 ?auto_70036 ) ) ( not ( = ?auto_70035 ?auto_70037 ) ) ( not ( = ?auto_70036 ?auto_70037 ) ) ( ON ?auto_70037 ?auto_70038 ) ( not ( = ?auto_70033 ?auto_70038 ) ) ( not ( = ?auto_70034 ?auto_70038 ) ) ( not ( = ?auto_70035 ?auto_70038 ) ) ( not ( = ?auto_70036 ?auto_70038 ) ) ( not ( = ?auto_70037 ?auto_70038 ) ) ( ON ?auto_70036 ?auto_70037 ) ( ON-TABLE ?auto_70038 ) ( ON ?auto_70035 ?auto_70036 ) ( ON ?auto_70034 ?auto_70035 ) ( ON ?auto_70033 ?auto_70034 ) ( CLEAR ?auto_70033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70038 ?auto_70037 ?auto_70036 ?auto_70035 ?auto_70034 )
      ( MAKE-5PILE ?auto_70033 ?auto_70034 ?auto_70035 ?auto_70036 ?auto_70037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70039 - BLOCK
      ?auto_70040 - BLOCK
      ?auto_70041 - BLOCK
      ?auto_70042 - BLOCK
      ?auto_70043 - BLOCK
    )
    :vars
    (
      ?auto_70044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70039 ?auto_70040 ) ) ( not ( = ?auto_70039 ?auto_70041 ) ) ( not ( = ?auto_70039 ?auto_70042 ) ) ( not ( = ?auto_70039 ?auto_70043 ) ) ( not ( = ?auto_70040 ?auto_70041 ) ) ( not ( = ?auto_70040 ?auto_70042 ) ) ( not ( = ?auto_70040 ?auto_70043 ) ) ( not ( = ?auto_70041 ?auto_70042 ) ) ( not ( = ?auto_70041 ?auto_70043 ) ) ( not ( = ?auto_70042 ?auto_70043 ) ) ( ON ?auto_70043 ?auto_70044 ) ( not ( = ?auto_70039 ?auto_70044 ) ) ( not ( = ?auto_70040 ?auto_70044 ) ) ( not ( = ?auto_70041 ?auto_70044 ) ) ( not ( = ?auto_70042 ?auto_70044 ) ) ( not ( = ?auto_70043 ?auto_70044 ) ) ( ON ?auto_70042 ?auto_70043 ) ( ON-TABLE ?auto_70044 ) ( ON ?auto_70041 ?auto_70042 ) ( ON ?auto_70040 ?auto_70041 ) ( HOLDING ?auto_70039 ) ( CLEAR ?auto_70040 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70044 ?auto_70043 ?auto_70042 ?auto_70041 ?auto_70040 ?auto_70039 )
      ( MAKE-5PILE ?auto_70039 ?auto_70040 ?auto_70041 ?auto_70042 ?auto_70043 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70045 - BLOCK
      ?auto_70046 - BLOCK
      ?auto_70047 - BLOCK
      ?auto_70048 - BLOCK
      ?auto_70049 - BLOCK
    )
    :vars
    (
      ?auto_70050 - BLOCK
      ?auto_70051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70045 ?auto_70046 ) ) ( not ( = ?auto_70045 ?auto_70047 ) ) ( not ( = ?auto_70045 ?auto_70048 ) ) ( not ( = ?auto_70045 ?auto_70049 ) ) ( not ( = ?auto_70046 ?auto_70047 ) ) ( not ( = ?auto_70046 ?auto_70048 ) ) ( not ( = ?auto_70046 ?auto_70049 ) ) ( not ( = ?auto_70047 ?auto_70048 ) ) ( not ( = ?auto_70047 ?auto_70049 ) ) ( not ( = ?auto_70048 ?auto_70049 ) ) ( ON ?auto_70049 ?auto_70050 ) ( not ( = ?auto_70045 ?auto_70050 ) ) ( not ( = ?auto_70046 ?auto_70050 ) ) ( not ( = ?auto_70047 ?auto_70050 ) ) ( not ( = ?auto_70048 ?auto_70050 ) ) ( not ( = ?auto_70049 ?auto_70050 ) ) ( ON ?auto_70048 ?auto_70049 ) ( ON-TABLE ?auto_70050 ) ( ON ?auto_70047 ?auto_70048 ) ( ON ?auto_70046 ?auto_70047 ) ( CLEAR ?auto_70046 ) ( ON ?auto_70045 ?auto_70051 ) ( CLEAR ?auto_70045 ) ( HAND-EMPTY ) ( not ( = ?auto_70045 ?auto_70051 ) ) ( not ( = ?auto_70046 ?auto_70051 ) ) ( not ( = ?auto_70047 ?auto_70051 ) ) ( not ( = ?auto_70048 ?auto_70051 ) ) ( not ( = ?auto_70049 ?auto_70051 ) ) ( not ( = ?auto_70050 ?auto_70051 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70045 ?auto_70051 )
      ( MAKE-5PILE ?auto_70045 ?auto_70046 ?auto_70047 ?auto_70048 ?auto_70049 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70052 - BLOCK
      ?auto_70053 - BLOCK
      ?auto_70054 - BLOCK
      ?auto_70055 - BLOCK
      ?auto_70056 - BLOCK
    )
    :vars
    (
      ?auto_70058 - BLOCK
      ?auto_70057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70052 ?auto_70053 ) ) ( not ( = ?auto_70052 ?auto_70054 ) ) ( not ( = ?auto_70052 ?auto_70055 ) ) ( not ( = ?auto_70052 ?auto_70056 ) ) ( not ( = ?auto_70053 ?auto_70054 ) ) ( not ( = ?auto_70053 ?auto_70055 ) ) ( not ( = ?auto_70053 ?auto_70056 ) ) ( not ( = ?auto_70054 ?auto_70055 ) ) ( not ( = ?auto_70054 ?auto_70056 ) ) ( not ( = ?auto_70055 ?auto_70056 ) ) ( ON ?auto_70056 ?auto_70058 ) ( not ( = ?auto_70052 ?auto_70058 ) ) ( not ( = ?auto_70053 ?auto_70058 ) ) ( not ( = ?auto_70054 ?auto_70058 ) ) ( not ( = ?auto_70055 ?auto_70058 ) ) ( not ( = ?auto_70056 ?auto_70058 ) ) ( ON ?auto_70055 ?auto_70056 ) ( ON-TABLE ?auto_70058 ) ( ON ?auto_70054 ?auto_70055 ) ( ON ?auto_70052 ?auto_70057 ) ( CLEAR ?auto_70052 ) ( not ( = ?auto_70052 ?auto_70057 ) ) ( not ( = ?auto_70053 ?auto_70057 ) ) ( not ( = ?auto_70054 ?auto_70057 ) ) ( not ( = ?auto_70055 ?auto_70057 ) ) ( not ( = ?auto_70056 ?auto_70057 ) ) ( not ( = ?auto_70058 ?auto_70057 ) ) ( HOLDING ?auto_70053 ) ( CLEAR ?auto_70054 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70058 ?auto_70056 ?auto_70055 ?auto_70054 ?auto_70053 )
      ( MAKE-5PILE ?auto_70052 ?auto_70053 ?auto_70054 ?auto_70055 ?auto_70056 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70059 - BLOCK
      ?auto_70060 - BLOCK
      ?auto_70061 - BLOCK
      ?auto_70062 - BLOCK
      ?auto_70063 - BLOCK
    )
    :vars
    (
      ?auto_70065 - BLOCK
      ?auto_70064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70059 ?auto_70060 ) ) ( not ( = ?auto_70059 ?auto_70061 ) ) ( not ( = ?auto_70059 ?auto_70062 ) ) ( not ( = ?auto_70059 ?auto_70063 ) ) ( not ( = ?auto_70060 ?auto_70061 ) ) ( not ( = ?auto_70060 ?auto_70062 ) ) ( not ( = ?auto_70060 ?auto_70063 ) ) ( not ( = ?auto_70061 ?auto_70062 ) ) ( not ( = ?auto_70061 ?auto_70063 ) ) ( not ( = ?auto_70062 ?auto_70063 ) ) ( ON ?auto_70063 ?auto_70065 ) ( not ( = ?auto_70059 ?auto_70065 ) ) ( not ( = ?auto_70060 ?auto_70065 ) ) ( not ( = ?auto_70061 ?auto_70065 ) ) ( not ( = ?auto_70062 ?auto_70065 ) ) ( not ( = ?auto_70063 ?auto_70065 ) ) ( ON ?auto_70062 ?auto_70063 ) ( ON-TABLE ?auto_70065 ) ( ON ?auto_70061 ?auto_70062 ) ( ON ?auto_70059 ?auto_70064 ) ( not ( = ?auto_70059 ?auto_70064 ) ) ( not ( = ?auto_70060 ?auto_70064 ) ) ( not ( = ?auto_70061 ?auto_70064 ) ) ( not ( = ?auto_70062 ?auto_70064 ) ) ( not ( = ?auto_70063 ?auto_70064 ) ) ( not ( = ?auto_70065 ?auto_70064 ) ) ( CLEAR ?auto_70061 ) ( ON ?auto_70060 ?auto_70059 ) ( CLEAR ?auto_70060 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70064 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70064 ?auto_70059 )
      ( MAKE-5PILE ?auto_70059 ?auto_70060 ?auto_70061 ?auto_70062 ?auto_70063 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70066 - BLOCK
      ?auto_70067 - BLOCK
      ?auto_70068 - BLOCK
      ?auto_70069 - BLOCK
      ?auto_70070 - BLOCK
    )
    :vars
    (
      ?auto_70072 - BLOCK
      ?auto_70071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70066 ?auto_70067 ) ) ( not ( = ?auto_70066 ?auto_70068 ) ) ( not ( = ?auto_70066 ?auto_70069 ) ) ( not ( = ?auto_70066 ?auto_70070 ) ) ( not ( = ?auto_70067 ?auto_70068 ) ) ( not ( = ?auto_70067 ?auto_70069 ) ) ( not ( = ?auto_70067 ?auto_70070 ) ) ( not ( = ?auto_70068 ?auto_70069 ) ) ( not ( = ?auto_70068 ?auto_70070 ) ) ( not ( = ?auto_70069 ?auto_70070 ) ) ( ON ?auto_70070 ?auto_70072 ) ( not ( = ?auto_70066 ?auto_70072 ) ) ( not ( = ?auto_70067 ?auto_70072 ) ) ( not ( = ?auto_70068 ?auto_70072 ) ) ( not ( = ?auto_70069 ?auto_70072 ) ) ( not ( = ?auto_70070 ?auto_70072 ) ) ( ON ?auto_70069 ?auto_70070 ) ( ON-TABLE ?auto_70072 ) ( ON ?auto_70066 ?auto_70071 ) ( not ( = ?auto_70066 ?auto_70071 ) ) ( not ( = ?auto_70067 ?auto_70071 ) ) ( not ( = ?auto_70068 ?auto_70071 ) ) ( not ( = ?auto_70069 ?auto_70071 ) ) ( not ( = ?auto_70070 ?auto_70071 ) ) ( not ( = ?auto_70072 ?auto_70071 ) ) ( ON ?auto_70067 ?auto_70066 ) ( CLEAR ?auto_70067 ) ( ON-TABLE ?auto_70071 ) ( HOLDING ?auto_70068 ) ( CLEAR ?auto_70069 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70072 ?auto_70070 ?auto_70069 ?auto_70068 )
      ( MAKE-5PILE ?auto_70066 ?auto_70067 ?auto_70068 ?auto_70069 ?auto_70070 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70073 - BLOCK
      ?auto_70074 - BLOCK
      ?auto_70075 - BLOCK
      ?auto_70076 - BLOCK
      ?auto_70077 - BLOCK
    )
    :vars
    (
      ?auto_70078 - BLOCK
      ?auto_70079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70073 ?auto_70074 ) ) ( not ( = ?auto_70073 ?auto_70075 ) ) ( not ( = ?auto_70073 ?auto_70076 ) ) ( not ( = ?auto_70073 ?auto_70077 ) ) ( not ( = ?auto_70074 ?auto_70075 ) ) ( not ( = ?auto_70074 ?auto_70076 ) ) ( not ( = ?auto_70074 ?auto_70077 ) ) ( not ( = ?auto_70075 ?auto_70076 ) ) ( not ( = ?auto_70075 ?auto_70077 ) ) ( not ( = ?auto_70076 ?auto_70077 ) ) ( ON ?auto_70077 ?auto_70078 ) ( not ( = ?auto_70073 ?auto_70078 ) ) ( not ( = ?auto_70074 ?auto_70078 ) ) ( not ( = ?auto_70075 ?auto_70078 ) ) ( not ( = ?auto_70076 ?auto_70078 ) ) ( not ( = ?auto_70077 ?auto_70078 ) ) ( ON ?auto_70076 ?auto_70077 ) ( ON-TABLE ?auto_70078 ) ( ON ?auto_70073 ?auto_70079 ) ( not ( = ?auto_70073 ?auto_70079 ) ) ( not ( = ?auto_70074 ?auto_70079 ) ) ( not ( = ?auto_70075 ?auto_70079 ) ) ( not ( = ?auto_70076 ?auto_70079 ) ) ( not ( = ?auto_70077 ?auto_70079 ) ) ( not ( = ?auto_70078 ?auto_70079 ) ) ( ON ?auto_70074 ?auto_70073 ) ( ON-TABLE ?auto_70079 ) ( CLEAR ?auto_70076 ) ( ON ?auto_70075 ?auto_70074 ) ( CLEAR ?auto_70075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70079 ?auto_70073 ?auto_70074 )
      ( MAKE-5PILE ?auto_70073 ?auto_70074 ?auto_70075 ?auto_70076 ?auto_70077 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70080 - BLOCK
      ?auto_70081 - BLOCK
      ?auto_70082 - BLOCK
      ?auto_70083 - BLOCK
      ?auto_70084 - BLOCK
    )
    :vars
    (
      ?auto_70086 - BLOCK
      ?auto_70085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70080 ?auto_70081 ) ) ( not ( = ?auto_70080 ?auto_70082 ) ) ( not ( = ?auto_70080 ?auto_70083 ) ) ( not ( = ?auto_70080 ?auto_70084 ) ) ( not ( = ?auto_70081 ?auto_70082 ) ) ( not ( = ?auto_70081 ?auto_70083 ) ) ( not ( = ?auto_70081 ?auto_70084 ) ) ( not ( = ?auto_70082 ?auto_70083 ) ) ( not ( = ?auto_70082 ?auto_70084 ) ) ( not ( = ?auto_70083 ?auto_70084 ) ) ( ON ?auto_70084 ?auto_70086 ) ( not ( = ?auto_70080 ?auto_70086 ) ) ( not ( = ?auto_70081 ?auto_70086 ) ) ( not ( = ?auto_70082 ?auto_70086 ) ) ( not ( = ?auto_70083 ?auto_70086 ) ) ( not ( = ?auto_70084 ?auto_70086 ) ) ( ON-TABLE ?auto_70086 ) ( ON ?auto_70080 ?auto_70085 ) ( not ( = ?auto_70080 ?auto_70085 ) ) ( not ( = ?auto_70081 ?auto_70085 ) ) ( not ( = ?auto_70082 ?auto_70085 ) ) ( not ( = ?auto_70083 ?auto_70085 ) ) ( not ( = ?auto_70084 ?auto_70085 ) ) ( not ( = ?auto_70086 ?auto_70085 ) ) ( ON ?auto_70081 ?auto_70080 ) ( ON-TABLE ?auto_70085 ) ( ON ?auto_70082 ?auto_70081 ) ( CLEAR ?auto_70082 ) ( HOLDING ?auto_70083 ) ( CLEAR ?auto_70084 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70086 ?auto_70084 ?auto_70083 )
      ( MAKE-5PILE ?auto_70080 ?auto_70081 ?auto_70082 ?auto_70083 ?auto_70084 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70087 - BLOCK
      ?auto_70088 - BLOCK
      ?auto_70089 - BLOCK
      ?auto_70090 - BLOCK
      ?auto_70091 - BLOCK
    )
    :vars
    (
      ?auto_70092 - BLOCK
      ?auto_70093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70087 ?auto_70088 ) ) ( not ( = ?auto_70087 ?auto_70089 ) ) ( not ( = ?auto_70087 ?auto_70090 ) ) ( not ( = ?auto_70087 ?auto_70091 ) ) ( not ( = ?auto_70088 ?auto_70089 ) ) ( not ( = ?auto_70088 ?auto_70090 ) ) ( not ( = ?auto_70088 ?auto_70091 ) ) ( not ( = ?auto_70089 ?auto_70090 ) ) ( not ( = ?auto_70089 ?auto_70091 ) ) ( not ( = ?auto_70090 ?auto_70091 ) ) ( ON ?auto_70091 ?auto_70092 ) ( not ( = ?auto_70087 ?auto_70092 ) ) ( not ( = ?auto_70088 ?auto_70092 ) ) ( not ( = ?auto_70089 ?auto_70092 ) ) ( not ( = ?auto_70090 ?auto_70092 ) ) ( not ( = ?auto_70091 ?auto_70092 ) ) ( ON-TABLE ?auto_70092 ) ( ON ?auto_70087 ?auto_70093 ) ( not ( = ?auto_70087 ?auto_70093 ) ) ( not ( = ?auto_70088 ?auto_70093 ) ) ( not ( = ?auto_70089 ?auto_70093 ) ) ( not ( = ?auto_70090 ?auto_70093 ) ) ( not ( = ?auto_70091 ?auto_70093 ) ) ( not ( = ?auto_70092 ?auto_70093 ) ) ( ON ?auto_70088 ?auto_70087 ) ( ON-TABLE ?auto_70093 ) ( ON ?auto_70089 ?auto_70088 ) ( CLEAR ?auto_70091 ) ( ON ?auto_70090 ?auto_70089 ) ( CLEAR ?auto_70090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70093 ?auto_70087 ?auto_70088 ?auto_70089 )
      ( MAKE-5PILE ?auto_70087 ?auto_70088 ?auto_70089 ?auto_70090 ?auto_70091 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70094 - BLOCK
      ?auto_70095 - BLOCK
      ?auto_70096 - BLOCK
      ?auto_70097 - BLOCK
      ?auto_70098 - BLOCK
    )
    :vars
    (
      ?auto_70100 - BLOCK
      ?auto_70099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70094 ?auto_70095 ) ) ( not ( = ?auto_70094 ?auto_70096 ) ) ( not ( = ?auto_70094 ?auto_70097 ) ) ( not ( = ?auto_70094 ?auto_70098 ) ) ( not ( = ?auto_70095 ?auto_70096 ) ) ( not ( = ?auto_70095 ?auto_70097 ) ) ( not ( = ?auto_70095 ?auto_70098 ) ) ( not ( = ?auto_70096 ?auto_70097 ) ) ( not ( = ?auto_70096 ?auto_70098 ) ) ( not ( = ?auto_70097 ?auto_70098 ) ) ( not ( = ?auto_70094 ?auto_70100 ) ) ( not ( = ?auto_70095 ?auto_70100 ) ) ( not ( = ?auto_70096 ?auto_70100 ) ) ( not ( = ?auto_70097 ?auto_70100 ) ) ( not ( = ?auto_70098 ?auto_70100 ) ) ( ON-TABLE ?auto_70100 ) ( ON ?auto_70094 ?auto_70099 ) ( not ( = ?auto_70094 ?auto_70099 ) ) ( not ( = ?auto_70095 ?auto_70099 ) ) ( not ( = ?auto_70096 ?auto_70099 ) ) ( not ( = ?auto_70097 ?auto_70099 ) ) ( not ( = ?auto_70098 ?auto_70099 ) ) ( not ( = ?auto_70100 ?auto_70099 ) ) ( ON ?auto_70095 ?auto_70094 ) ( ON-TABLE ?auto_70099 ) ( ON ?auto_70096 ?auto_70095 ) ( ON ?auto_70097 ?auto_70096 ) ( CLEAR ?auto_70097 ) ( HOLDING ?auto_70098 ) ( CLEAR ?auto_70100 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70100 ?auto_70098 )
      ( MAKE-5PILE ?auto_70094 ?auto_70095 ?auto_70096 ?auto_70097 ?auto_70098 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70101 - BLOCK
      ?auto_70102 - BLOCK
      ?auto_70103 - BLOCK
      ?auto_70104 - BLOCK
      ?auto_70105 - BLOCK
    )
    :vars
    (
      ?auto_70107 - BLOCK
      ?auto_70106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70101 ?auto_70102 ) ) ( not ( = ?auto_70101 ?auto_70103 ) ) ( not ( = ?auto_70101 ?auto_70104 ) ) ( not ( = ?auto_70101 ?auto_70105 ) ) ( not ( = ?auto_70102 ?auto_70103 ) ) ( not ( = ?auto_70102 ?auto_70104 ) ) ( not ( = ?auto_70102 ?auto_70105 ) ) ( not ( = ?auto_70103 ?auto_70104 ) ) ( not ( = ?auto_70103 ?auto_70105 ) ) ( not ( = ?auto_70104 ?auto_70105 ) ) ( not ( = ?auto_70101 ?auto_70107 ) ) ( not ( = ?auto_70102 ?auto_70107 ) ) ( not ( = ?auto_70103 ?auto_70107 ) ) ( not ( = ?auto_70104 ?auto_70107 ) ) ( not ( = ?auto_70105 ?auto_70107 ) ) ( ON-TABLE ?auto_70107 ) ( ON ?auto_70101 ?auto_70106 ) ( not ( = ?auto_70101 ?auto_70106 ) ) ( not ( = ?auto_70102 ?auto_70106 ) ) ( not ( = ?auto_70103 ?auto_70106 ) ) ( not ( = ?auto_70104 ?auto_70106 ) ) ( not ( = ?auto_70105 ?auto_70106 ) ) ( not ( = ?auto_70107 ?auto_70106 ) ) ( ON ?auto_70102 ?auto_70101 ) ( ON-TABLE ?auto_70106 ) ( ON ?auto_70103 ?auto_70102 ) ( ON ?auto_70104 ?auto_70103 ) ( CLEAR ?auto_70107 ) ( ON ?auto_70105 ?auto_70104 ) ( CLEAR ?auto_70105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70106 ?auto_70101 ?auto_70102 ?auto_70103 ?auto_70104 )
      ( MAKE-5PILE ?auto_70101 ?auto_70102 ?auto_70103 ?auto_70104 ?auto_70105 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70108 - BLOCK
      ?auto_70109 - BLOCK
      ?auto_70110 - BLOCK
      ?auto_70111 - BLOCK
      ?auto_70112 - BLOCK
    )
    :vars
    (
      ?auto_70113 - BLOCK
      ?auto_70114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70108 ?auto_70109 ) ) ( not ( = ?auto_70108 ?auto_70110 ) ) ( not ( = ?auto_70108 ?auto_70111 ) ) ( not ( = ?auto_70108 ?auto_70112 ) ) ( not ( = ?auto_70109 ?auto_70110 ) ) ( not ( = ?auto_70109 ?auto_70111 ) ) ( not ( = ?auto_70109 ?auto_70112 ) ) ( not ( = ?auto_70110 ?auto_70111 ) ) ( not ( = ?auto_70110 ?auto_70112 ) ) ( not ( = ?auto_70111 ?auto_70112 ) ) ( not ( = ?auto_70108 ?auto_70113 ) ) ( not ( = ?auto_70109 ?auto_70113 ) ) ( not ( = ?auto_70110 ?auto_70113 ) ) ( not ( = ?auto_70111 ?auto_70113 ) ) ( not ( = ?auto_70112 ?auto_70113 ) ) ( ON ?auto_70108 ?auto_70114 ) ( not ( = ?auto_70108 ?auto_70114 ) ) ( not ( = ?auto_70109 ?auto_70114 ) ) ( not ( = ?auto_70110 ?auto_70114 ) ) ( not ( = ?auto_70111 ?auto_70114 ) ) ( not ( = ?auto_70112 ?auto_70114 ) ) ( not ( = ?auto_70113 ?auto_70114 ) ) ( ON ?auto_70109 ?auto_70108 ) ( ON-TABLE ?auto_70114 ) ( ON ?auto_70110 ?auto_70109 ) ( ON ?auto_70111 ?auto_70110 ) ( ON ?auto_70112 ?auto_70111 ) ( CLEAR ?auto_70112 ) ( HOLDING ?auto_70113 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70113 )
      ( MAKE-5PILE ?auto_70108 ?auto_70109 ?auto_70110 ?auto_70111 ?auto_70112 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_70115 - BLOCK
      ?auto_70116 - BLOCK
      ?auto_70117 - BLOCK
      ?auto_70118 - BLOCK
      ?auto_70119 - BLOCK
    )
    :vars
    (
      ?auto_70121 - BLOCK
      ?auto_70120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70115 ?auto_70116 ) ) ( not ( = ?auto_70115 ?auto_70117 ) ) ( not ( = ?auto_70115 ?auto_70118 ) ) ( not ( = ?auto_70115 ?auto_70119 ) ) ( not ( = ?auto_70116 ?auto_70117 ) ) ( not ( = ?auto_70116 ?auto_70118 ) ) ( not ( = ?auto_70116 ?auto_70119 ) ) ( not ( = ?auto_70117 ?auto_70118 ) ) ( not ( = ?auto_70117 ?auto_70119 ) ) ( not ( = ?auto_70118 ?auto_70119 ) ) ( not ( = ?auto_70115 ?auto_70121 ) ) ( not ( = ?auto_70116 ?auto_70121 ) ) ( not ( = ?auto_70117 ?auto_70121 ) ) ( not ( = ?auto_70118 ?auto_70121 ) ) ( not ( = ?auto_70119 ?auto_70121 ) ) ( ON ?auto_70115 ?auto_70120 ) ( not ( = ?auto_70115 ?auto_70120 ) ) ( not ( = ?auto_70116 ?auto_70120 ) ) ( not ( = ?auto_70117 ?auto_70120 ) ) ( not ( = ?auto_70118 ?auto_70120 ) ) ( not ( = ?auto_70119 ?auto_70120 ) ) ( not ( = ?auto_70121 ?auto_70120 ) ) ( ON ?auto_70116 ?auto_70115 ) ( ON-TABLE ?auto_70120 ) ( ON ?auto_70117 ?auto_70116 ) ( ON ?auto_70118 ?auto_70117 ) ( ON ?auto_70119 ?auto_70118 ) ( ON ?auto_70121 ?auto_70119 ) ( CLEAR ?auto_70121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70120 ?auto_70115 ?auto_70116 ?auto_70117 ?auto_70118 ?auto_70119 )
      ( MAKE-5PILE ?auto_70115 ?auto_70116 ?auto_70117 ?auto_70118 ?auto_70119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70128 - BLOCK
      ?auto_70129 - BLOCK
      ?auto_70130 - BLOCK
      ?auto_70131 - BLOCK
      ?auto_70132 - BLOCK
      ?auto_70133 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_70133 ) ( CLEAR ?auto_70132 ) ( ON-TABLE ?auto_70128 ) ( ON ?auto_70129 ?auto_70128 ) ( ON ?auto_70130 ?auto_70129 ) ( ON ?auto_70131 ?auto_70130 ) ( ON ?auto_70132 ?auto_70131 ) ( not ( = ?auto_70128 ?auto_70129 ) ) ( not ( = ?auto_70128 ?auto_70130 ) ) ( not ( = ?auto_70128 ?auto_70131 ) ) ( not ( = ?auto_70128 ?auto_70132 ) ) ( not ( = ?auto_70128 ?auto_70133 ) ) ( not ( = ?auto_70129 ?auto_70130 ) ) ( not ( = ?auto_70129 ?auto_70131 ) ) ( not ( = ?auto_70129 ?auto_70132 ) ) ( not ( = ?auto_70129 ?auto_70133 ) ) ( not ( = ?auto_70130 ?auto_70131 ) ) ( not ( = ?auto_70130 ?auto_70132 ) ) ( not ( = ?auto_70130 ?auto_70133 ) ) ( not ( = ?auto_70131 ?auto_70132 ) ) ( not ( = ?auto_70131 ?auto_70133 ) ) ( not ( = ?auto_70132 ?auto_70133 ) ) )
    :subtasks
    ( ( !STACK ?auto_70133 ?auto_70132 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70134 - BLOCK
      ?auto_70135 - BLOCK
      ?auto_70136 - BLOCK
      ?auto_70137 - BLOCK
      ?auto_70138 - BLOCK
      ?auto_70139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_70138 ) ( ON-TABLE ?auto_70134 ) ( ON ?auto_70135 ?auto_70134 ) ( ON ?auto_70136 ?auto_70135 ) ( ON ?auto_70137 ?auto_70136 ) ( ON ?auto_70138 ?auto_70137 ) ( not ( = ?auto_70134 ?auto_70135 ) ) ( not ( = ?auto_70134 ?auto_70136 ) ) ( not ( = ?auto_70134 ?auto_70137 ) ) ( not ( = ?auto_70134 ?auto_70138 ) ) ( not ( = ?auto_70134 ?auto_70139 ) ) ( not ( = ?auto_70135 ?auto_70136 ) ) ( not ( = ?auto_70135 ?auto_70137 ) ) ( not ( = ?auto_70135 ?auto_70138 ) ) ( not ( = ?auto_70135 ?auto_70139 ) ) ( not ( = ?auto_70136 ?auto_70137 ) ) ( not ( = ?auto_70136 ?auto_70138 ) ) ( not ( = ?auto_70136 ?auto_70139 ) ) ( not ( = ?auto_70137 ?auto_70138 ) ) ( not ( = ?auto_70137 ?auto_70139 ) ) ( not ( = ?auto_70138 ?auto_70139 ) ) ( ON-TABLE ?auto_70139 ) ( CLEAR ?auto_70139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_70139 )
      ( MAKE-6PILE ?auto_70134 ?auto_70135 ?auto_70136 ?auto_70137 ?auto_70138 ?auto_70139 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70140 - BLOCK
      ?auto_70141 - BLOCK
      ?auto_70142 - BLOCK
      ?auto_70143 - BLOCK
      ?auto_70144 - BLOCK
      ?auto_70145 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70140 ) ( ON ?auto_70141 ?auto_70140 ) ( ON ?auto_70142 ?auto_70141 ) ( ON ?auto_70143 ?auto_70142 ) ( not ( = ?auto_70140 ?auto_70141 ) ) ( not ( = ?auto_70140 ?auto_70142 ) ) ( not ( = ?auto_70140 ?auto_70143 ) ) ( not ( = ?auto_70140 ?auto_70144 ) ) ( not ( = ?auto_70140 ?auto_70145 ) ) ( not ( = ?auto_70141 ?auto_70142 ) ) ( not ( = ?auto_70141 ?auto_70143 ) ) ( not ( = ?auto_70141 ?auto_70144 ) ) ( not ( = ?auto_70141 ?auto_70145 ) ) ( not ( = ?auto_70142 ?auto_70143 ) ) ( not ( = ?auto_70142 ?auto_70144 ) ) ( not ( = ?auto_70142 ?auto_70145 ) ) ( not ( = ?auto_70143 ?auto_70144 ) ) ( not ( = ?auto_70143 ?auto_70145 ) ) ( not ( = ?auto_70144 ?auto_70145 ) ) ( ON-TABLE ?auto_70145 ) ( CLEAR ?auto_70145 ) ( HOLDING ?auto_70144 ) ( CLEAR ?auto_70143 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70140 ?auto_70141 ?auto_70142 ?auto_70143 ?auto_70144 )
      ( MAKE-6PILE ?auto_70140 ?auto_70141 ?auto_70142 ?auto_70143 ?auto_70144 ?auto_70145 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70146 - BLOCK
      ?auto_70147 - BLOCK
      ?auto_70148 - BLOCK
      ?auto_70149 - BLOCK
      ?auto_70150 - BLOCK
      ?auto_70151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70146 ) ( ON ?auto_70147 ?auto_70146 ) ( ON ?auto_70148 ?auto_70147 ) ( ON ?auto_70149 ?auto_70148 ) ( not ( = ?auto_70146 ?auto_70147 ) ) ( not ( = ?auto_70146 ?auto_70148 ) ) ( not ( = ?auto_70146 ?auto_70149 ) ) ( not ( = ?auto_70146 ?auto_70150 ) ) ( not ( = ?auto_70146 ?auto_70151 ) ) ( not ( = ?auto_70147 ?auto_70148 ) ) ( not ( = ?auto_70147 ?auto_70149 ) ) ( not ( = ?auto_70147 ?auto_70150 ) ) ( not ( = ?auto_70147 ?auto_70151 ) ) ( not ( = ?auto_70148 ?auto_70149 ) ) ( not ( = ?auto_70148 ?auto_70150 ) ) ( not ( = ?auto_70148 ?auto_70151 ) ) ( not ( = ?auto_70149 ?auto_70150 ) ) ( not ( = ?auto_70149 ?auto_70151 ) ) ( not ( = ?auto_70150 ?auto_70151 ) ) ( ON-TABLE ?auto_70151 ) ( CLEAR ?auto_70149 ) ( ON ?auto_70150 ?auto_70151 ) ( CLEAR ?auto_70150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70151 )
      ( MAKE-6PILE ?auto_70146 ?auto_70147 ?auto_70148 ?auto_70149 ?auto_70150 ?auto_70151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70152 - BLOCK
      ?auto_70153 - BLOCK
      ?auto_70154 - BLOCK
      ?auto_70155 - BLOCK
      ?auto_70156 - BLOCK
      ?auto_70157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70152 ) ( ON ?auto_70153 ?auto_70152 ) ( ON ?auto_70154 ?auto_70153 ) ( not ( = ?auto_70152 ?auto_70153 ) ) ( not ( = ?auto_70152 ?auto_70154 ) ) ( not ( = ?auto_70152 ?auto_70155 ) ) ( not ( = ?auto_70152 ?auto_70156 ) ) ( not ( = ?auto_70152 ?auto_70157 ) ) ( not ( = ?auto_70153 ?auto_70154 ) ) ( not ( = ?auto_70153 ?auto_70155 ) ) ( not ( = ?auto_70153 ?auto_70156 ) ) ( not ( = ?auto_70153 ?auto_70157 ) ) ( not ( = ?auto_70154 ?auto_70155 ) ) ( not ( = ?auto_70154 ?auto_70156 ) ) ( not ( = ?auto_70154 ?auto_70157 ) ) ( not ( = ?auto_70155 ?auto_70156 ) ) ( not ( = ?auto_70155 ?auto_70157 ) ) ( not ( = ?auto_70156 ?auto_70157 ) ) ( ON-TABLE ?auto_70157 ) ( ON ?auto_70156 ?auto_70157 ) ( CLEAR ?auto_70156 ) ( HOLDING ?auto_70155 ) ( CLEAR ?auto_70154 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70152 ?auto_70153 ?auto_70154 ?auto_70155 )
      ( MAKE-6PILE ?auto_70152 ?auto_70153 ?auto_70154 ?auto_70155 ?auto_70156 ?auto_70157 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70158 - BLOCK
      ?auto_70159 - BLOCK
      ?auto_70160 - BLOCK
      ?auto_70161 - BLOCK
      ?auto_70162 - BLOCK
      ?auto_70163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70158 ) ( ON ?auto_70159 ?auto_70158 ) ( ON ?auto_70160 ?auto_70159 ) ( not ( = ?auto_70158 ?auto_70159 ) ) ( not ( = ?auto_70158 ?auto_70160 ) ) ( not ( = ?auto_70158 ?auto_70161 ) ) ( not ( = ?auto_70158 ?auto_70162 ) ) ( not ( = ?auto_70158 ?auto_70163 ) ) ( not ( = ?auto_70159 ?auto_70160 ) ) ( not ( = ?auto_70159 ?auto_70161 ) ) ( not ( = ?auto_70159 ?auto_70162 ) ) ( not ( = ?auto_70159 ?auto_70163 ) ) ( not ( = ?auto_70160 ?auto_70161 ) ) ( not ( = ?auto_70160 ?auto_70162 ) ) ( not ( = ?auto_70160 ?auto_70163 ) ) ( not ( = ?auto_70161 ?auto_70162 ) ) ( not ( = ?auto_70161 ?auto_70163 ) ) ( not ( = ?auto_70162 ?auto_70163 ) ) ( ON-TABLE ?auto_70163 ) ( ON ?auto_70162 ?auto_70163 ) ( CLEAR ?auto_70160 ) ( ON ?auto_70161 ?auto_70162 ) ( CLEAR ?auto_70161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70163 ?auto_70162 )
      ( MAKE-6PILE ?auto_70158 ?auto_70159 ?auto_70160 ?auto_70161 ?auto_70162 ?auto_70163 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70164 - BLOCK
      ?auto_70165 - BLOCK
      ?auto_70166 - BLOCK
      ?auto_70167 - BLOCK
      ?auto_70168 - BLOCK
      ?auto_70169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70164 ) ( ON ?auto_70165 ?auto_70164 ) ( not ( = ?auto_70164 ?auto_70165 ) ) ( not ( = ?auto_70164 ?auto_70166 ) ) ( not ( = ?auto_70164 ?auto_70167 ) ) ( not ( = ?auto_70164 ?auto_70168 ) ) ( not ( = ?auto_70164 ?auto_70169 ) ) ( not ( = ?auto_70165 ?auto_70166 ) ) ( not ( = ?auto_70165 ?auto_70167 ) ) ( not ( = ?auto_70165 ?auto_70168 ) ) ( not ( = ?auto_70165 ?auto_70169 ) ) ( not ( = ?auto_70166 ?auto_70167 ) ) ( not ( = ?auto_70166 ?auto_70168 ) ) ( not ( = ?auto_70166 ?auto_70169 ) ) ( not ( = ?auto_70167 ?auto_70168 ) ) ( not ( = ?auto_70167 ?auto_70169 ) ) ( not ( = ?auto_70168 ?auto_70169 ) ) ( ON-TABLE ?auto_70169 ) ( ON ?auto_70168 ?auto_70169 ) ( ON ?auto_70167 ?auto_70168 ) ( CLEAR ?auto_70167 ) ( HOLDING ?auto_70166 ) ( CLEAR ?auto_70165 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70164 ?auto_70165 ?auto_70166 )
      ( MAKE-6PILE ?auto_70164 ?auto_70165 ?auto_70166 ?auto_70167 ?auto_70168 ?auto_70169 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70170 - BLOCK
      ?auto_70171 - BLOCK
      ?auto_70172 - BLOCK
      ?auto_70173 - BLOCK
      ?auto_70174 - BLOCK
      ?auto_70175 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70170 ) ( ON ?auto_70171 ?auto_70170 ) ( not ( = ?auto_70170 ?auto_70171 ) ) ( not ( = ?auto_70170 ?auto_70172 ) ) ( not ( = ?auto_70170 ?auto_70173 ) ) ( not ( = ?auto_70170 ?auto_70174 ) ) ( not ( = ?auto_70170 ?auto_70175 ) ) ( not ( = ?auto_70171 ?auto_70172 ) ) ( not ( = ?auto_70171 ?auto_70173 ) ) ( not ( = ?auto_70171 ?auto_70174 ) ) ( not ( = ?auto_70171 ?auto_70175 ) ) ( not ( = ?auto_70172 ?auto_70173 ) ) ( not ( = ?auto_70172 ?auto_70174 ) ) ( not ( = ?auto_70172 ?auto_70175 ) ) ( not ( = ?auto_70173 ?auto_70174 ) ) ( not ( = ?auto_70173 ?auto_70175 ) ) ( not ( = ?auto_70174 ?auto_70175 ) ) ( ON-TABLE ?auto_70175 ) ( ON ?auto_70174 ?auto_70175 ) ( ON ?auto_70173 ?auto_70174 ) ( CLEAR ?auto_70171 ) ( ON ?auto_70172 ?auto_70173 ) ( CLEAR ?auto_70172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70175 ?auto_70174 ?auto_70173 )
      ( MAKE-6PILE ?auto_70170 ?auto_70171 ?auto_70172 ?auto_70173 ?auto_70174 ?auto_70175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70176 - BLOCK
      ?auto_70177 - BLOCK
      ?auto_70178 - BLOCK
      ?auto_70179 - BLOCK
      ?auto_70180 - BLOCK
      ?auto_70181 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70176 ) ( not ( = ?auto_70176 ?auto_70177 ) ) ( not ( = ?auto_70176 ?auto_70178 ) ) ( not ( = ?auto_70176 ?auto_70179 ) ) ( not ( = ?auto_70176 ?auto_70180 ) ) ( not ( = ?auto_70176 ?auto_70181 ) ) ( not ( = ?auto_70177 ?auto_70178 ) ) ( not ( = ?auto_70177 ?auto_70179 ) ) ( not ( = ?auto_70177 ?auto_70180 ) ) ( not ( = ?auto_70177 ?auto_70181 ) ) ( not ( = ?auto_70178 ?auto_70179 ) ) ( not ( = ?auto_70178 ?auto_70180 ) ) ( not ( = ?auto_70178 ?auto_70181 ) ) ( not ( = ?auto_70179 ?auto_70180 ) ) ( not ( = ?auto_70179 ?auto_70181 ) ) ( not ( = ?auto_70180 ?auto_70181 ) ) ( ON-TABLE ?auto_70181 ) ( ON ?auto_70180 ?auto_70181 ) ( ON ?auto_70179 ?auto_70180 ) ( ON ?auto_70178 ?auto_70179 ) ( CLEAR ?auto_70178 ) ( HOLDING ?auto_70177 ) ( CLEAR ?auto_70176 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70176 ?auto_70177 )
      ( MAKE-6PILE ?auto_70176 ?auto_70177 ?auto_70178 ?auto_70179 ?auto_70180 ?auto_70181 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70182 - BLOCK
      ?auto_70183 - BLOCK
      ?auto_70184 - BLOCK
      ?auto_70185 - BLOCK
      ?auto_70186 - BLOCK
      ?auto_70187 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_70182 ) ( not ( = ?auto_70182 ?auto_70183 ) ) ( not ( = ?auto_70182 ?auto_70184 ) ) ( not ( = ?auto_70182 ?auto_70185 ) ) ( not ( = ?auto_70182 ?auto_70186 ) ) ( not ( = ?auto_70182 ?auto_70187 ) ) ( not ( = ?auto_70183 ?auto_70184 ) ) ( not ( = ?auto_70183 ?auto_70185 ) ) ( not ( = ?auto_70183 ?auto_70186 ) ) ( not ( = ?auto_70183 ?auto_70187 ) ) ( not ( = ?auto_70184 ?auto_70185 ) ) ( not ( = ?auto_70184 ?auto_70186 ) ) ( not ( = ?auto_70184 ?auto_70187 ) ) ( not ( = ?auto_70185 ?auto_70186 ) ) ( not ( = ?auto_70185 ?auto_70187 ) ) ( not ( = ?auto_70186 ?auto_70187 ) ) ( ON-TABLE ?auto_70187 ) ( ON ?auto_70186 ?auto_70187 ) ( ON ?auto_70185 ?auto_70186 ) ( ON ?auto_70184 ?auto_70185 ) ( CLEAR ?auto_70182 ) ( ON ?auto_70183 ?auto_70184 ) ( CLEAR ?auto_70183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70187 ?auto_70186 ?auto_70185 ?auto_70184 )
      ( MAKE-6PILE ?auto_70182 ?auto_70183 ?auto_70184 ?auto_70185 ?auto_70186 ?auto_70187 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70188 - BLOCK
      ?auto_70189 - BLOCK
      ?auto_70190 - BLOCK
      ?auto_70191 - BLOCK
      ?auto_70192 - BLOCK
      ?auto_70193 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70188 ?auto_70189 ) ) ( not ( = ?auto_70188 ?auto_70190 ) ) ( not ( = ?auto_70188 ?auto_70191 ) ) ( not ( = ?auto_70188 ?auto_70192 ) ) ( not ( = ?auto_70188 ?auto_70193 ) ) ( not ( = ?auto_70189 ?auto_70190 ) ) ( not ( = ?auto_70189 ?auto_70191 ) ) ( not ( = ?auto_70189 ?auto_70192 ) ) ( not ( = ?auto_70189 ?auto_70193 ) ) ( not ( = ?auto_70190 ?auto_70191 ) ) ( not ( = ?auto_70190 ?auto_70192 ) ) ( not ( = ?auto_70190 ?auto_70193 ) ) ( not ( = ?auto_70191 ?auto_70192 ) ) ( not ( = ?auto_70191 ?auto_70193 ) ) ( not ( = ?auto_70192 ?auto_70193 ) ) ( ON-TABLE ?auto_70193 ) ( ON ?auto_70192 ?auto_70193 ) ( ON ?auto_70191 ?auto_70192 ) ( ON ?auto_70190 ?auto_70191 ) ( ON ?auto_70189 ?auto_70190 ) ( CLEAR ?auto_70189 ) ( HOLDING ?auto_70188 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70188 )
      ( MAKE-6PILE ?auto_70188 ?auto_70189 ?auto_70190 ?auto_70191 ?auto_70192 ?auto_70193 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70194 - BLOCK
      ?auto_70195 - BLOCK
      ?auto_70196 - BLOCK
      ?auto_70197 - BLOCK
      ?auto_70198 - BLOCK
      ?auto_70199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70194 ?auto_70195 ) ) ( not ( = ?auto_70194 ?auto_70196 ) ) ( not ( = ?auto_70194 ?auto_70197 ) ) ( not ( = ?auto_70194 ?auto_70198 ) ) ( not ( = ?auto_70194 ?auto_70199 ) ) ( not ( = ?auto_70195 ?auto_70196 ) ) ( not ( = ?auto_70195 ?auto_70197 ) ) ( not ( = ?auto_70195 ?auto_70198 ) ) ( not ( = ?auto_70195 ?auto_70199 ) ) ( not ( = ?auto_70196 ?auto_70197 ) ) ( not ( = ?auto_70196 ?auto_70198 ) ) ( not ( = ?auto_70196 ?auto_70199 ) ) ( not ( = ?auto_70197 ?auto_70198 ) ) ( not ( = ?auto_70197 ?auto_70199 ) ) ( not ( = ?auto_70198 ?auto_70199 ) ) ( ON-TABLE ?auto_70199 ) ( ON ?auto_70198 ?auto_70199 ) ( ON ?auto_70197 ?auto_70198 ) ( ON ?auto_70196 ?auto_70197 ) ( ON ?auto_70195 ?auto_70196 ) ( ON ?auto_70194 ?auto_70195 ) ( CLEAR ?auto_70194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70199 ?auto_70198 ?auto_70197 ?auto_70196 ?auto_70195 )
      ( MAKE-6PILE ?auto_70194 ?auto_70195 ?auto_70196 ?auto_70197 ?auto_70198 ?auto_70199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70200 - BLOCK
      ?auto_70201 - BLOCK
      ?auto_70202 - BLOCK
      ?auto_70203 - BLOCK
      ?auto_70204 - BLOCK
      ?auto_70205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70200 ?auto_70201 ) ) ( not ( = ?auto_70200 ?auto_70202 ) ) ( not ( = ?auto_70200 ?auto_70203 ) ) ( not ( = ?auto_70200 ?auto_70204 ) ) ( not ( = ?auto_70200 ?auto_70205 ) ) ( not ( = ?auto_70201 ?auto_70202 ) ) ( not ( = ?auto_70201 ?auto_70203 ) ) ( not ( = ?auto_70201 ?auto_70204 ) ) ( not ( = ?auto_70201 ?auto_70205 ) ) ( not ( = ?auto_70202 ?auto_70203 ) ) ( not ( = ?auto_70202 ?auto_70204 ) ) ( not ( = ?auto_70202 ?auto_70205 ) ) ( not ( = ?auto_70203 ?auto_70204 ) ) ( not ( = ?auto_70203 ?auto_70205 ) ) ( not ( = ?auto_70204 ?auto_70205 ) ) ( ON-TABLE ?auto_70205 ) ( ON ?auto_70204 ?auto_70205 ) ( ON ?auto_70203 ?auto_70204 ) ( ON ?auto_70202 ?auto_70203 ) ( ON ?auto_70201 ?auto_70202 ) ( HOLDING ?auto_70200 ) ( CLEAR ?auto_70201 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70205 ?auto_70204 ?auto_70203 ?auto_70202 ?auto_70201 ?auto_70200 )
      ( MAKE-6PILE ?auto_70200 ?auto_70201 ?auto_70202 ?auto_70203 ?auto_70204 ?auto_70205 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70206 - BLOCK
      ?auto_70207 - BLOCK
      ?auto_70208 - BLOCK
      ?auto_70209 - BLOCK
      ?auto_70210 - BLOCK
      ?auto_70211 - BLOCK
    )
    :vars
    (
      ?auto_70212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70206 ?auto_70207 ) ) ( not ( = ?auto_70206 ?auto_70208 ) ) ( not ( = ?auto_70206 ?auto_70209 ) ) ( not ( = ?auto_70206 ?auto_70210 ) ) ( not ( = ?auto_70206 ?auto_70211 ) ) ( not ( = ?auto_70207 ?auto_70208 ) ) ( not ( = ?auto_70207 ?auto_70209 ) ) ( not ( = ?auto_70207 ?auto_70210 ) ) ( not ( = ?auto_70207 ?auto_70211 ) ) ( not ( = ?auto_70208 ?auto_70209 ) ) ( not ( = ?auto_70208 ?auto_70210 ) ) ( not ( = ?auto_70208 ?auto_70211 ) ) ( not ( = ?auto_70209 ?auto_70210 ) ) ( not ( = ?auto_70209 ?auto_70211 ) ) ( not ( = ?auto_70210 ?auto_70211 ) ) ( ON-TABLE ?auto_70211 ) ( ON ?auto_70210 ?auto_70211 ) ( ON ?auto_70209 ?auto_70210 ) ( ON ?auto_70208 ?auto_70209 ) ( ON ?auto_70207 ?auto_70208 ) ( CLEAR ?auto_70207 ) ( ON ?auto_70206 ?auto_70212 ) ( CLEAR ?auto_70206 ) ( HAND-EMPTY ) ( not ( = ?auto_70206 ?auto_70212 ) ) ( not ( = ?auto_70207 ?auto_70212 ) ) ( not ( = ?auto_70208 ?auto_70212 ) ) ( not ( = ?auto_70209 ?auto_70212 ) ) ( not ( = ?auto_70210 ?auto_70212 ) ) ( not ( = ?auto_70211 ?auto_70212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_70206 ?auto_70212 )
      ( MAKE-6PILE ?auto_70206 ?auto_70207 ?auto_70208 ?auto_70209 ?auto_70210 ?auto_70211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70213 - BLOCK
      ?auto_70214 - BLOCK
      ?auto_70215 - BLOCK
      ?auto_70216 - BLOCK
      ?auto_70217 - BLOCK
      ?auto_70218 - BLOCK
    )
    :vars
    (
      ?auto_70219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70213 ?auto_70214 ) ) ( not ( = ?auto_70213 ?auto_70215 ) ) ( not ( = ?auto_70213 ?auto_70216 ) ) ( not ( = ?auto_70213 ?auto_70217 ) ) ( not ( = ?auto_70213 ?auto_70218 ) ) ( not ( = ?auto_70214 ?auto_70215 ) ) ( not ( = ?auto_70214 ?auto_70216 ) ) ( not ( = ?auto_70214 ?auto_70217 ) ) ( not ( = ?auto_70214 ?auto_70218 ) ) ( not ( = ?auto_70215 ?auto_70216 ) ) ( not ( = ?auto_70215 ?auto_70217 ) ) ( not ( = ?auto_70215 ?auto_70218 ) ) ( not ( = ?auto_70216 ?auto_70217 ) ) ( not ( = ?auto_70216 ?auto_70218 ) ) ( not ( = ?auto_70217 ?auto_70218 ) ) ( ON-TABLE ?auto_70218 ) ( ON ?auto_70217 ?auto_70218 ) ( ON ?auto_70216 ?auto_70217 ) ( ON ?auto_70215 ?auto_70216 ) ( ON ?auto_70213 ?auto_70219 ) ( CLEAR ?auto_70213 ) ( not ( = ?auto_70213 ?auto_70219 ) ) ( not ( = ?auto_70214 ?auto_70219 ) ) ( not ( = ?auto_70215 ?auto_70219 ) ) ( not ( = ?auto_70216 ?auto_70219 ) ) ( not ( = ?auto_70217 ?auto_70219 ) ) ( not ( = ?auto_70218 ?auto_70219 ) ) ( HOLDING ?auto_70214 ) ( CLEAR ?auto_70215 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70218 ?auto_70217 ?auto_70216 ?auto_70215 ?auto_70214 )
      ( MAKE-6PILE ?auto_70213 ?auto_70214 ?auto_70215 ?auto_70216 ?auto_70217 ?auto_70218 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70220 - BLOCK
      ?auto_70221 - BLOCK
      ?auto_70222 - BLOCK
      ?auto_70223 - BLOCK
      ?auto_70224 - BLOCK
      ?auto_70225 - BLOCK
    )
    :vars
    (
      ?auto_70226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70220 ?auto_70221 ) ) ( not ( = ?auto_70220 ?auto_70222 ) ) ( not ( = ?auto_70220 ?auto_70223 ) ) ( not ( = ?auto_70220 ?auto_70224 ) ) ( not ( = ?auto_70220 ?auto_70225 ) ) ( not ( = ?auto_70221 ?auto_70222 ) ) ( not ( = ?auto_70221 ?auto_70223 ) ) ( not ( = ?auto_70221 ?auto_70224 ) ) ( not ( = ?auto_70221 ?auto_70225 ) ) ( not ( = ?auto_70222 ?auto_70223 ) ) ( not ( = ?auto_70222 ?auto_70224 ) ) ( not ( = ?auto_70222 ?auto_70225 ) ) ( not ( = ?auto_70223 ?auto_70224 ) ) ( not ( = ?auto_70223 ?auto_70225 ) ) ( not ( = ?auto_70224 ?auto_70225 ) ) ( ON-TABLE ?auto_70225 ) ( ON ?auto_70224 ?auto_70225 ) ( ON ?auto_70223 ?auto_70224 ) ( ON ?auto_70222 ?auto_70223 ) ( ON ?auto_70220 ?auto_70226 ) ( not ( = ?auto_70220 ?auto_70226 ) ) ( not ( = ?auto_70221 ?auto_70226 ) ) ( not ( = ?auto_70222 ?auto_70226 ) ) ( not ( = ?auto_70223 ?auto_70226 ) ) ( not ( = ?auto_70224 ?auto_70226 ) ) ( not ( = ?auto_70225 ?auto_70226 ) ) ( CLEAR ?auto_70222 ) ( ON ?auto_70221 ?auto_70220 ) ( CLEAR ?auto_70221 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_70226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70226 ?auto_70220 )
      ( MAKE-6PILE ?auto_70220 ?auto_70221 ?auto_70222 ?auto_70223 ?auto_70224 ?auto_70225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70227 - BLOCK
      ?auto_70228 - BLOCK
      ?auto_70229 - BLOCK
      ?auto_70230 - BLOCK
      ?auto_70231 - BLOCK
      ?auto_70232 - BLOCK
    )
    :vars
    (
      ?auto_70233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70227 ?auto_70228 ) ) ( not ( = ?auto_70227 ?auto_70229 ) ) ( not ( = ?auto_70227 ?auto_70230 ) ) ( not ( = ?auto_70227 ?auto_70231 ) ) ( not ( = ?auto_70227 ?auto_70232 ) ) ( not ( = ?auto_70228 ?auto_70229 ) ) ( not ( = ?auto_70228 ?auto_70230 ) ) ( not ( = ?auto_70228 ?auto_70231 ) ) ( not ( = ?auto_70228 ?auto_70232 ) ) ( not ( = ?auto_70229 ?auto_70230 ) ) ( not ( = ?auto_70229 ?auto_70231 ) ) ( not ( = ?auto_70229 ?auto_70232 ) ) ( not ( = ?auto_70230 ?auto_70231 ) ) ( not ( = ?auto_70230 ?auto_70232 ) ) ( not ( = ?auto_70231 ?auto_70232 ) ) ( ON-TABLE ?auto_70232 ) ( ON ?auto_70231 ?auto_70232 ) ( ON ?auto_70230 ?auto_70231 ) ( ON ?auto_70227 ?auto_70233 ) ( not ( = ?auto_70227 ?auto_70233 ) ) ( not ( = ?auto_70228 ?auto_70233 ) ) ( not ( = ?auto_70229 ?auto_70233 ) ) ( not ( = ?auto_70230 ?auto_70233 ) ) ( not ( = ?auto_70231 ?auto_70233 ) ) ( not ( = ?auto_70232 ?auto_70233 ) ) ( ON ?auto_70228 ?auto_70227 ) ( CLEAR ?auto_70228 ) ( ON-TABLE ?auto_70233 ) ( HOLDING ?auto_70229 ) ( CLEAR ?auto_70230 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70232 ?auto_70231 ?auto_70230 ?auto_70229 )
      ( MAKE-6PILE ?auto_70227 ?auto_70228 ?auto_70229 ?auto_70230 ?auto_70231 ?auto_70232 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70234 - BLOCK
      ?auto_70235 - BLOCK
      ?auto_70236 - BLOCK
      ?auto_70237 - BLOCK
      ?auto_70238 - BLOCK
      ?auto_70239 - BLOCK
    )
    :vars
    (
      ?auto_70240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70234 ?auto_70235 ) ) ( not ( = ?auto_70234 ?auto_70236 ) ) ( not ( = ?auto_70234 ?auto_70237 ) ) ( not ( = ?auto_70234 ?auto_70238 ) ) ( not ( = ?auto_70234 ?auto_70239 ) ) ( not ( = ?auto_70235 ?auto_70236 ) ) ( not ( = ?auto_70235 ?auto_70237 ) ) ( not ( = ?auto_70235 ?auto_70238 ) ) ( not ( = ?auto_70235 ?auto_70239 ) ) ( not ( = ?auto_70236 ?auto_70237 ) ) ( not ( = ?auto_70236 ?auto_70238 ) ) ( not ( = ?auto_70236 ?auto_70239 ) ) ( not ( = ?auto_70237 ?auto_70238 ) ) ( not ( = ?auto_70237 ?auto_70239 ) ) ( not ( = ?auto_70238 ?auto_70239 ) ) ( ON-TABLE ?auto_70239 ) ( ON ?auto_70238 ?auto_70239 ) ( ON ?auto_70237 ?auto_70238 ) ( ON ?auto_70234 ?auto_70240 ) ( not ( = ?auto_70234 ?auto_70240 ) ) ( not ( = ?auto_70235 ?auto_70240 ) ) ( not ( = ?auto_70236 ?auto_70240 ) ) ( not ( = ?auto_70237 ?auto_70240 ) ) ( not ( = ?auto_70238 ?auto_70240 ) ) ( not ( = ?auto_70239 ?auto_70240 ) ) ( ON ?auto_70235 ?auto_70234 ) ( ON-TABLE ?auto_70240 ) ( CLEAR ?auto_70237 ) ( ON ?auto_70236 ?auto_70235 ) ( CLEAR ?auto_70236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70240 ?auto_70234 ?auto_70235 )
      ( MAKE-6PILE ?auto_70234 ?auto_70235 ?auto_70236 ?auto_70237 ?auto_70238 ?auto_70239 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70241 - BLOCK
      ?auto_70242 - BLOCK
      ?auto_70243 - BLOCK
      ?auto_70244 - BLOCK
      ?auto_70245 - BLOCK
      ?auto_70246 - BLOCK
    )
    :vars
    (
      ?auto_70247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70241 ?auto_70242 ) ) ( not ( = ?auto_70241 ?auto_70243 ) ) ( not ( = ?auto_70241 ?auto_70244 ) ) ( not ( = ?auto_70241 ?auto_70245 ) ) ( not ( = ?auto_70241 ?auto_70246 ) ) ( not ( = ?auto_70242 ?auto_70243 ) ) ( not ( = ?auto_70242 ?auto_70244 ) ) ( not ( = ?auto_70242 ?auto_70245 ) ) ( not ( = ?auto_70242 ?auto_70246 ) ) ( not ( = ?auto_70243 ?auto_70244 ) ) ( not ( = ?auto_70243 ?auto_70245 ) ) ( not ( = ?auto_70243 ?auto_70246 ) ) ( not ( = ?auto_70244 ?auto_70245 ) ) ( not ( = ?auto_70244 ?auto_70246 ) ) ( not ( = ?auto_70245 ?auto_70246 ) ) ( ON-TABLE ?auto_70246 ) ( ON ?auto_70245 ?auto_70246 ) ( ON ?auto_70241 ?auto_70247 ) ( not ( = ?auto_70241 ?auto_70247 ) ) ( not ( = ?auto_70242 ?auto_70247 ) ) ( not ( = ?auto_70243 ?auto_70247 ) ) ( not ( = ?auto_70244 ?auto_70247 ) ) ( not ( = ?auto_70245 ?auto_70247 ) ) ( not ( = ?auto_70246 ?auto_70247 ) ) ( ON ?auto_70242 ?auto_70241 ) ( ON-TABLE ?auto_70247 ) ( ON ?auto_70243 ?auto_70242 ) ( CLEAR ?auto_70243 ) ( HOLDING ?auto_70244 ) ( CLEAR ?auto_70245 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_70246 ?auto_70245 ?auto_70244 )
      ( MAKE-6PILE ?auto_70241 ?auto_70242 ?auto_70243 ?auto_70244 ?auto_70245 ?auto_70246 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70248 - BLOCK
      ?auto_70249 - BLOCK
      ?auto_70250 - BLOCK
      ?auto_70251 - BLOCK
      ?auto_70252 - BLOCK
      ?auto_70253 - BLOCK
    )
    :vars
    (
      ?auto_70254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70248 ?auto_70249 ) ) ( not ( = ?auto_70248 ?auto_70250 ) ) ( not ( = ?auto_70248 ?auto_70251 ) ) ( not ( = ?auto_70248 ?auto_70252 ) ) ( not ( = ?auto_70248 ?auto_70253 ) ) ( not ( = ?auto_70249 ?auto_70250 ) ) ( not ( = ?auto_70249 ?auto_70251 ) ) ( not ( = ?auto_70249 ?auto_70252 ) ) ( not ( = ?auto_70249 ?auto_70253 ) ) ( not ( = ?auto_70250 ?auto_70251 ) ) ( not ( = ?auto_70250 ?auto_70252 ) ) ( not ( = ?auto_70250 ?auto_70253 ) ) ( not ( = ?auto_70251 ?auto_70252 ) ) ( not ( = ?auto_70251 ?auto_70253 ) ) ( not ( = ?auto_70252 ?auto_70253 ) ) ( ON-TABLE ?auto_70253 ) ( ON ?auto_70252 ?auto_70253 ) ( ON ?auto_70248 ?auto_70254 ) ( not ( = ?auto_70248 ?auto_70254 ) ) ( not ( = ?auto_70249 ?auto_70254 ) ) ( not ( = ?auto_70250 ?auto_70254 ) ) ( not ( = ?auto_70251 ?auto_70254 ) ) ( not ( = ?auto_70252 ?auto_70254 ) ) ( not ( = ?auto_70253 ?auto_70254 ) ) ( ON ?auto_70249 ?auto_70248 ) ( ON-TABLE ?auto_70254 ) ( ON ?auto_70250 ?auto_70249 ) ( CLEAR ?auto_70252 ) ( ON ?auto_70251 ?auto_70250 ) ( CLEAR ?auto_70251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_70254 ?auto_70248 ?auto_70249 ?auto_70250 )
      ( MAKE-6PILE ?auto_70248 ?auto_70249 ?auto_70250 ?auto_70251 ?auto_70252 ?auto_70253 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70255 - BLOCK
      ?auto_70256 - BLOCK
      ?auto_70257 - BLOCK
      ?auto_70258 - BLOCK
      ?auto_70259 - BLOCK
      ?auto_70260 - BLOCK
    )
    :vars
    (
      ?auto_70261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70255 ?auto_70256 ) ) ( not ( = ?auto_70255 ?auto_70257 ) ) ( not ( = ?auto_70255 ?auto_70258 ) ) ( not ( = ?auto_70255 ?auto_70259 ) ) ( not ( = ?auto_70255 ?auto_70260 ) ) ( not ( = ?auto_70256 ?auto_70257 ) ) ( not ( = ?auto_70256 ?auto_70258 ) ) ( not ( = ?auto_70256 ?auto_70259 ) ) ( not ( = ?auto_70256 ?auto_70260 ) ) ( not ( = ?auto_70257 ?auto_70258 ) ) ( not ( = ?auto_70257 ?auto_70259 ) ) ( not ( = ?auto_70257 ?auto_70260 ) ) ( not ( = ?auto_70258 ?auto_70259 ) ) ( not ( = ?auto_70258 ?auto_70260 ) ) ( not ( = ?auto_70259 ?auto_70260 ) ) ( ON-TABLE ?auto_70260 ) ( ON ?auto_70255 ?auto_70261 ) ( not ( = ?auto_70255 ?auto_70261 ) ) ( not ( = ?auto_70256 ?auto_70261 ) ) ( not ( = ?auto_70257 ?auto_70261 ) ) ( not ( = ?auto_70258 ?auto_70261 ) ) ( not ( = ?auto_70259 ?auto_70261 ) ) ( not ( = ?auto_70260 ?auto_70261 ) ) ( ON ?auto_70256 ?auto_70255 ) ( ON-TABLE ?auto_70261 ) ( ON ?auto_70257 ?auto_70256 ) ( ON ?auto_70258 ?auto_70257 ) ( CLEAR ?auto_70258 ) ( HOLDING ?auto_70259 ) ( CLEAR ?auto_70260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_70260 ?auto_70259 )
      ( MAKE-6PILE ?auto_70255 ?auto_70256 ?auto_70257 ?auto_70258 ?auto_70259 ?auto_70260 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70262 - BLOCK
      ?auto_70263 - BLOCK
      ?auto_70264 - BLOCK
      ?auto_70265 - BLOCK
      ?auto_70266 - BLOCK
      ?auto_70267 - BLOCK
    )
    :vars
    (
      ?auto_70268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70262 ?auto_70263 ) ) ( not ( = ?auto_70262 ?auto_70264 ) ) ( not ( = ?auto_70262 ?auto_70265 ) ) ( not ( = ?auto_70262 ?auto_70266 ) ) ( not ( = ?auto_70262 ?auto_70267 ) ) ( not ( = ?auto_70263 ?auto_70264 ) ) ( not ( = ?auto_70263 ?auto_70265 ) ) ( not ( = ?auto_70263 ?auto_70266 ) ) ( not ( = ?auto_70263 ?auto_70267 ) ) ( not ( = ?auto_70264 ?auto_70265 ) ) ( not ( = ?auto_70264 ?auto_70266 ) ) ( not ( = ?auto_70264 ?auto_70267 ) ) ( not ( = ?auto_70265 ?auto_70266 ) ) ( not ( = ?auto_70265 ?auto_70267 ) ) ( not ( = ?auto_70266 ?auto_70267 ) ) ( ON-TABLE ?auto_70267 ) ( ON ?auto_70262 ?auto_70268 ) ( not ( = ?auto_70262 ?auto_70268 ) ) ( not ( = ?auto_70263 ?auto_70268 ) ) ( not ( = ?auto_70264 ?auto_70268 ) ) ( not ( = ?auto_70265 ?auto_70268 ) ) ( not ( = ?auto_70266 ?auto_70268 ) ) ( not ( = ?auto_70267 ?auto_70268 ) ) ( ON ?auto_70263 ?auto_70262 ) ( ON-TABLE ?auto_70268 ) ( ON ?auto_70264 ?auto_70263 ) ( ON ?auto_70265 ?auto_70264 ) ( CLEAR ?auto_70267 ) ( ON ?auto_70266 ?auto_70265 ) ( CLEAR ?auto_70266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_70268 ?auto_70262 ?auto_70263 ?auto_70264 ?auto_70265 )
      ( MAKE-6PILE ?auto_70262 ?auto_70263 ?auto_70264 ?auto_70265 ?auto_70266 ?auto_70267 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70269 - BLOCK
      ?auto_70270 - BLOCK
      ?auto_70271 - BLOCK
      ?auto_70272 - BLOCK
      ?auto_70273 - BLOCK
      ?auto_70274 - BLOCK
    )
    :vars
    (
      ?auto_70275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70269 ?auto_70270 ) ) ( not ( = ?auto_70269 ?auto_70271 ) ) ( not ( = ?auto_70269 ?auto_70272 ) ) ( not ( = ?auto_70269 ?auto_70273 ) ) ( not ( = ?auto_70269 ?auto_70274 ) ) ( not ( = ?auto_70270 ?auto_70271 ) ) ( not ( = ?auto_70270 ?auto_70272 ) ) ( not ( = ?auto_70270 ?auto_70273 ) ) ( not ( = ?auto_70270 ?auto_70274 ) ) ( not ( = ?auto_70271 ?auto_70272 ) ) ( not ( = ?auto_70271 ?auto_70273 ) ) ( not ( = ?auto_70271 ?auto_70274 ) ) ( not ( = ?auto_70272 ?auto_70273 ) ) ( not ( = ?auto_70272 ?auto_70274 ) ) ( not ( = ?auto_70273 ?auto_70274 ) ) ( ON ?auto_70269 ?auto_70275 ) ( not ( = ?auto_70269 ?auto_70275 ) ) ( not ( = ?auto_70270 ?auto_70275 ) ) ( not ( = ?auto_70271 ?auto_70275 ) ) ( not ( = ?auto_70272 ?auto_70275 ) ) ( not ( = ?auto_70273 ?auto_70275 ) ) ( not ( = ?auto_70274 ?auto_70275 ) ) ( ON ?auto_70270 ?auto_70269 ) ( ON-TABLE ?auto_70275 ) ( ON ?auto_70271 ?auto_70270 ) ( ON ?auto_70272 ?auto_70271 ) ( ON ?auto_70273 ?auto_70272 ) ( CLEAR ?auto_70273 ) ( HOLDING ?auto_70274 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_70274 )
      ( MAKE-6PILE ?auto_70269 ?auto_70270 ?auto_70271 ?auto_70272 ?auto_70273 ?auto_70274 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_70276 - BLOCK
      ?auto_70277 - BLOCK
      ?auto_70278 - BLOCK
      ?auto_70279 - BLOCK
      ?auto_70280 - BLOCK
      ?auto_70281 - BLOCK
    )
    :vars
    (
      ?auto_70282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70276 ?auto_70277 ) ) ( not ( = ?auto_70276 ?auto_70278 ) ) ( not ( = ?auto_70276 ?auto_70279 ) ) ( not ( = ?auto_70276 ?auto_70280 ) ) ( not ( = ?auto_70276 ?auto_70281 ) ) ( not ( = ?auto_70277 ?auto_70278 ) ) ( not ( = ?auto_70277 ?auto_70279 ) ) ( not ( = ?auto_70277 ?auto_70280 ) ) ( not ( = ?auto_70277 ?auto_70281 ) ) ( not ( = ?auto_70278 ?auto_70279 ) ) ( not ( = ?auto_70278 ?auto_70280 ) ) ( not ( = ?auto_70278 ?auto_70281 ) ) ( not ( = ?auto_70279 ?auto_70280 ) ) ( not ( = ?auto_70279 ?auto_70281 ) ) ( not ( = ?auto_70280 ?auto_70281 ) ) ( ON ?auto_70276 ?auto_70282 ) ( not ( = ?auto_70276 ?auto_70282 ) ) ( not ( = ?auto_70277 ?auto_70282 ) ) ( not ( = ?auto_70278 ?auto_70282 ) ) ( not ( = ?auto_70279 ?auto_70282 ) ) ( not ( = ?auto_70280 ?auto_70282 ) ) ( not ( = ?auto_70281 ?auto_70282 ) ) ( ON ?auto_70277 ?auto_70276 ) ( ON-TABLE ?auto_70282 ) ( ON ?auto_70278 ?auto_70277 ) ( ON ?auto_70279 ?auto_70278 ) ( ON ?auto_70280 ?auto_70279 ) ( ON ?auto_70281 ?auto_70280 ) ( CLEAR ?auto_70281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_70282 ?auto_70276 ?auto_70277 ?auto_70278 ?auto_70279 ?auto_70280 )
      ( MAKE-6PILE ?auto_70276 ?auto_70277 ?auto_70278 ?auto_70279 ?auto_70280 ?auto_70281 ) )
  )

)

