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
      ?auto_205481 - BLOCK
    )
    :vars
    (
      ?auto_205482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205481 ?auto_205482 ) ( CLEAR ?auto_205481 ) ( HAND-EMPTY ) ( not ( = ?auto_205481 ?auto_205482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205481 ?auto_205482 )
      ( !PUTDOWN ?auto_205481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_205484 - BLOCK
    )
    :vars
    (
      ?auto_205485 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205484 ?auto_205485 ) ( CLEAR ?auto_205484 ) ( HAND-EMPTY ) ( not ( = ?auto_205484 ?auto_205485 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205484 ?auto_205485 )
      ( !PUTDOWN ?auto_205484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205488 - BLOCK
      ?auto_205489 - BLOCK
    )
    :vars
    (
      ?auto_205490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205488 ) ( ON ?auto_205489 ?auto_205490 ) ( CLEAR ?auto_205489 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205488 ) ( not ( = ?auto_205488 ?auto_205489 ) ) ( not ( = ?auto_205488 ?auto_205490 ) ) ( not ( = ?auto_205489 ?auto_205490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205489 ?auto_205490 )
      ( !STACK ?auto_205489 ?auto_205488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205493 - BLOCK
      ?auto_205494 - BLOCK
    )
    :vars
    (
      ?auto_205495 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205493 ) ( ON ?auto_205494 ?auto_205495 ) ( CLEAR ?auto_205494 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205493 ) ( not ( = ?auto_205493 ?auto_205494 ) ) ( not ( = ?auto_205493 ?auto_205495 ) ) ( not ( = ?auto_205494 ?auto_205495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205494 ?auto_205495 )
      ( !STACK ?auto_205494 ?auto_205493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205498 - BLOCK
      ?auto_205499 - BLOCK
    )
    :vars
    (
      ?auto_205500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205499 ?auto_205500 ) ( not ( = ?auto_205498 ?auto_205499 ) ) ( not ( = ?auto_205498 ?auto_205500 ) ) ( not ( = ?auto_205499 ?auto_205500 ) ) ( ON ?auto_205498 ?auto_205499 ) ( CLEAR ?auto_205498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205498 )
      ( MAKE-2PILE ?auto_205498 ?auto_205499 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_205503 - BLOCK
      ?auto_205504 - BLOCK
    )
    :vars
    (
      ?auto_205505 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205504 ?auto_205505 ) ( not ( = ?auto_205503 ?auto_205504 ) ) ( not ( = ?auto_205503 ?auto_205505 ) ) ( not ( = ?auto_205504 ?auto_205505 ) ) ( ON ?auto_205503 ?auto_205504 ) ( CLEAR ?auto_205503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205503 )
      ( MAKE-2PILE ?auto_205503 ?auto_205504 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205509 - BLOCK
      ?auto_205510 - BLOCK
      ?auto_205511 - BLOCK
    )
    :vars
    (
      ?auto_205512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205510 ) ( ON ?auto_205511 ?auto_205512 ) ( CLEAR ?auto_205511 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205509 ) ( ON ?auto_205510 ?auto_205509 ) ( not ( = ?auto_205509 ?auto_205510 ) ) ( not ( = ?auto_205509 ?auto_205511 ) ) ( not ( = ?auto_205509 ?auto_205512 ) ) ( not ( = ?auto_205510 ?auto_205511 ) ) ( not ( = ?auto_205510 ?auto_205512 ) ) ( not ( = ?auto_205511 ?auto_205512 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205511 ?auto_205512 )
      ( !STACK ?auto_205511 ?auto_205510 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205516 - BLOCK
      ?auto_205517 - BLOCK
      ?auto_205518 - BLOCK
    )
    :vars
    (
      ?auto_205519 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205517 ) ( ON ?auto_205518 ?auto_205519 ) ( CLEAR ?auto_205518 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205516 ) ( ON ?auto_205517 ?auto_205516 ) ( not ( = ?auto_205516 ?auto_205517 ) ) ( not ( = ?auto_205516 ?auto_205518 ) ) ( not ( = ?auto_205516 ?auto_205519 ) ) ( not ( = ?auto_205517 ?auto_205518 ) ) ( not ( = ?auto_205517 ?auto_205519 ) ) ( not ( = ?auto_205518 ?auto_205519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205518 ?auto_205519 )
      ( !STACK ?auto_205518 ?auto_205517 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205523 - BLOCK
      ?auto_205524 - BLOCK
      ?auto_205525 - BLOCK
    )
    :vars
    (
      ?auto_205526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205525 ?auto_205526 ) ( ON-TABLE ?auto_205523 ) ( not ( = ?auto_205523 ?auto_205524 ) ) ( not ( = ?auto_205523 ?auto_205525 ) ) ( not ( = ?auto_205523 ?auto_205526 ) ) ( not ( = ?auto_205524 ?auto_205525 ) ) ( not ( = ?auto_205524 ?auto_205526 ) ) ( not ( = ?auto_205525 ?auto_205526 ) ) ( CLEAR ?auto_205523 ) ( ON ?auto_205524 ?auto_205525 ) ( CLEAR ?auto_205524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205523 ?auto_205524 )
      ( MAKE-3PILE ?auto_205523 ?auto_205524 ?auto_205525 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205530 - BLOCK
      ?auto_205531 - BLOCK
      ?auto_205532 - BLOCK
    )
    :vars
    (
      ?auto_205533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205532 ?auto_205533 ) ( ON-TABLE ?auto_205530 ) ( not ( = ?auto_205530 ?auto_205531 ) ) ( not ( = ?auto_205530 ?auto_205532 ) ) ( not ( = ?auto_205530 ?auto_205533 ) ) ( not ( = ?auto_205531 ?auto_205532 ) ) ( not ( = ?auto_205531 ?auto_205533 ) ) ( not ( = ?auto_205532 ?auto_205533 ) ) ( CLEAR ?auto_205530 ) ( ON ?auto_205531 ?auto_205532 ) ( CLEAR ?auto_205531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205530 ?auto_205531 )
      ( MAKE-3PILE ?auto_205530 ?auto_205531 ?auto_205532 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205537 - BLOCK
      ?auto_205538 - BLOCK
      ?auto_205539 - BLOCK
    )
    :vars
    (
      ?auto_205540 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205539 ?auto_205540 ) ( not ( = ?auto_205537 ?auto_205538 ) ) ( not ( = ?auto_205537 ?auto_205539 ) ) ( not ( = ?auto_205537 ?auto_205540 ) ) ( not ( = ?auto_205538 ?auto_205539 ) ) ( not ( = ?auto_205538 ?auto_205540 ) ) ( not ( = ?auto_205539 ?auto_205540 ) ) ( ON ?auto_205538 ?auto_205539 ) ( ON ?auto_205537 ?auto_205538 ) ( CLEAR ?auto_205537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205537 )
      ( MAKE-3PILE ?auto_205537 ?auto_205538 ?auto_205539 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_205544 - BLOCK
      ?auto_205545 - BLOCK
      ?auto_205546 - BLOCK
    )
    :vars
    (
      ?auto_205547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205546 ?auto_205547 ) ( not ( = ?auto_205544 ?auto_205545 ) ) ( not ( = ?auto_205544 ?auto_205546 ) ) ( not ( = ?auto_205544 ?auto_205547 ) ) ( not ( = ?auto_205545 ?auto_205546 ) ) ( not ( = ?auto_205545 ?auto_205547 ) ) ( not ( = ?auto_205546 ?auto_205547 ) ) ( ON ?auto_205545 ?auto_205546 ) ( ON ?auto_205544 ?auto_205545 ) ( CLEAR ?auto_205544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205544 )
      ( MAKE-3PILE ?auto_205544 ?auto_205545 ?auto_205546 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205552 - BLOCK
      ?auto_205553 - BLOCK
      ?auto_205554 - BLOCK
      ?auto_205555 - BLOCK
    )
    :vars
    (
      ?auto_205556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205554 ) ( ON ?auto_205555 ?auto_205556 ) ( CLEAR ?auto_205555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205552 ) ( ON ?auto_205553 ?auto_205552 ) ( ON ?auto_205554 ?auto_205553 ) ( not ( = ?auto_205552 ?auto_205553 ) ) ( not ( = ?auto_205552 ?auto_205554 ) ) ( not ( = ?auto_205552 ?auto_205555 ) ) ( not ( = ?auto_205552 ?auto_205556 ) ) ( not ( = ?auto_205553 ?auto_205554 ) ) ( not ( = ?auto_205553 ?auto_205555 ) ) ( not ( = ?auto_205553 ?auto_205556 ) ) ( not ( = ?auto_205554 ?auto_205555 ) ) ( not ( = ?auto_205554 ?auto_205556 ) ) ( not ( = ?auto_205555 ?auto_205556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205555 ?auto_205556 )
      ( !STACK ?auto_205555 ?auto_205554 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205561 - BLOCK
      ?auto_205562 - BLOCK
      ?auto_205563 - BLOCK
      ?auto_205564 - BLOCK
    )
    :vars
    (
      ?auto_205565 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205563 ) ( ON ?auto_205564 ?auto_205565 ) ( CLEAR ?auto_205564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205561 ) ( ON ?auto_205562 ?auto_205561 ) ( ON ?auto_205563 ?auto_205562 ) ( not ( = ?auto_205561 ?auto_205562 ) ) ( not ( = ?auto_205561 ?auto_205563 ) ) ( not ( = ?auto_205561 ?auto_205564 ) ) ( not ( = ?auto_205561 ?auto_205565 ) ) ( not ( = ?auto_205562 ?auto_205563 ) ) ( not ( = ?auto_205562 ?auto_205564 ) ) ( not ( = ?auto_205562 ?auto_205565 ) ) ( not ( = ?auto_205563 ?auto_205564 ) ) ( not ( = ?auto_205563 ?auto_205565 ) ) ( not ( = ?auto_205564 ?auto_205565 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205564 ?auto_205565 )
      ( !STACK ?auto_205564 ?auto_205563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205570 - BLOCK
      ?auto_205571 - BLOCK
      ?auto_205572 - BLOCK
      ?auto_205573 - BLOCK
    )
    :vars
    (
      ?auto_205574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205573 ?auto_205574 ) ( ON-TABLE ?auto_205570 ) ( ON ?auto_205571 ?auto_205570 ) ( not ( = ?auto_205570 ?auto_205571 ) ) ( not ( = ?auto_205570 ?auto_205572 ) ) ( not ( = ?auto_205570 ?auto_205573 ) ) ( not ( = ?auto_205570 ?auto_205574 ) ) ( not ( = ?auto_205571 ?auto_205572 ) ) ( not ( = ?auto_205571 ?auto_205573 ) ) ( not ( = ?auto_205571 ?auto_205574 ) ) ( not ( = ?auto_205572 ?auto_205573 ) ) ( not ( = ?auto_205572 ?auto_205574 ) ) ( not ( = ?auto_205573 ?auto_205574 ) ) ( CLEAR ?auto_205571 ) ( ON ?auto_205572 ?auto_205573 ) ( CLEAR ?auto_205572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205570 ?auto_205571 ?auto_205572 )
      ( MAKE-4PILE ?auto_205570 ?auto_205571 ?auto_205572 ?auto_205573 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205579 - BLOCK
      ?auto_205580 - BLOCK
      ?auto_205581 - BLOCK
      ?auto_205582 - BLOCK
    )
    :vars
    (
      ?auto_205583 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205582 ?auto_205583 ) ( ON-TABLE ?auto_205579 ) ( ON ?auto_205580 ?auto_205579 ) ( not ( = ?auto_205579 ?auto_205580 ) ) ( not ( = ?auto_205579 ?auto_205581 ) ) ( not ( = ?auto_205579 ?auto_205582 ) ) ( not ( = ?auto_205579 ?auto_205583 ) ) ( not ( = ?auto_205580 ?auto_205581 ) ) ( not ( = ?auto_205580 ?auto_205582 ) ) ( not ( = ?auto_205580 ?auto_205583 ) ) ( not ( = ?auto_205581 ?auto_205582 ) ) ( not ( = ?auto_205581 ?auto_205583 ) ) ( not ( = ?auto_205582 ?auto_205583 ) ) ( CLEAR ?auto_205580 ) ( ON ?auto_205581 ?auto_205582 ) ( CLEAR ?auto_205581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205579 ?auto_205580 ?auto_205581 )
      ( MAKE-4PILE ?auto_205579 ?auto_205580 ?auto_205581 ?auto_205582 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205588 - BLOCK
      ?auto_205589 - BLOCK
      ?auto_205590 - BLOCK
      ?auto_205591 - BLOCK
    )
    :vars
    (
      ?auto_205592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205591 ?auto_205592 ) ( ON-TABLE ?auto_205588 ) ( not ( = ?auto_205588 ?auto_205589 ) ) ( not ( = ?auto_205588 ?auto_205590 ) ) ( not ( = ?auto_205588 ?auto_205591 ) ) ( not ( = ?auto_205588 ?auto_205592 ) ) ( not ( = ?auto_205589 ?auto_205590 ) ) ( not ( = ?auto_205589 ?auto_205591 ) ) ( not ( = ?auto_205589 ?auto_205592 ) ) ( not ( = ?auto_205590 ?auto_205591 ) ) ( not ( = ?auto_205590 ?auto_205592 ) ) ( not ( = ?auto_205591 ?auto_205592 ) ) ( ON ?auto_205590 ?auto_205591 ) ( CLEAR ?auto_205588 ) ( ON ?auto_205589 ?auto_205590 ) ( CLEAR ?auto_205589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205588 ?auto_205589 )
      ( MAKE-4PILE ?auto_205588 ?auto_205589 ?auto_205590 ?auto_205591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205597 - BLOCK
      ?auto_205598 - BLOCK
      ?auto_205599 - BLOCK
      ?auto_205600 - BLOCK
    )
    :vars
    (
      ?auto_205601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205600 ?auto_205601 ) ( ON-TABLE ?auto_205597 ) ( not ( = ?auto_205597 ?auto_205598 ) ) ( not ( = ?auto_205597 ?auto_205599 ) ) ( not ( = ?auto_205597 ?auto_205600 ) ) ( not ( = ?auto_205597 ?auto_205601 ) ) ( not ( = ?auto_205598 ?auto_205599 ) ) ( not ( = ?auto_205598 ?auto_205600 ) ) ( not ( = ?auto_205598 ?auto_205601 ) ) ( not ( = ?auto_205599 ?auto_205600 ) ) ( not ( = ?auto_205599 ?auto_205601 ) ) ( not ( = ?auto_205600 ?auto_205601 ) ) ( ON ?auto_205599 ?auto_205600 ) ( CLEAR ?auto_205597 ) ( ON ?auto_205598 ?auto_205599 ) ( CLEAR ?auto_205598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205597 ?auto_205598 )
      ( MAKE-4PILE ?auto_205597 ?auto_205598 ?auto_205599 ?auto_205600 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205606 - BLOCK
      ?auto_205607 - BLOCK
      ?auto_205608 - BLOCK
      ?auto_205609 - BLOCK
    )
    :vars
    (
      ?auto_205610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205609 ?auto_205610 ) ( not ( = ?auto_205606 ?auto_205607 ) ) ( not ( = ?auto_205606 ?auto_205608 ) ) ( not ( = ?auto_205606 ?auto_205609 ) ) ( not ( = ?auto_205606 ?auto_205610 ) ) ( not ( = ?auto_205607 ?auto_205608 ) ) ( not ( = ?auto_205607 ?auto_205609 ) ) ( not ( = ?auto_205607 ?auto_205610 ) ) ( not ( = ?auto_205608 ?auto_205609 ) ) ( not ( = ?auto_205608 ?auto_205610 ) ) ( not ( = ?auto_205609 ?auto_205610 ) ) ( ON ?auto_205608 ?auto_205609 ) ( ON ?auto_205607 ?auto_205608 ) ( ON ?auto_205606 ?auto_205607 ) ( CLEAR ?auto_205606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205606 )
      ( MAKE-4PILE ?auto_205606 ?auto_205607 ?auto_205608 ?auto_205609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_205615 - BLOCK
      ?auto_205616 - BLOCK
      ?auto_205617 - BLOCK
      ?auto_205618 - BLOCK
    )
    :vars
    (
      ?auto_205619 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205618 ?auto_205619 ) ( not ( = ?auto_205615 ?auto_205616 ) ) ( not ( = ?auto_205615 ?auto_205617 ) ) ( not ( = ?auto_205615 ?auto_205618 ) ) ( not ( = ?auto_205615 ?auto_205619 ) ) ( not ( = ?auto_205616 ?auto_205617 ) ) ( not ( = ?auto_205616 ?auto_205618 ) ) ( not ( = ?auto_205616 ?auto_205619 ) ) ( not ( = ?auto_205617 ?auto_205618 ) ) ( not ( = ?auto_205617 ?auto_205619 ) ) ( not ( = ?auto_205618 ?auto_205619 ) ) ( ON ?auto_205617 ?auto_205618 ) ( ON ?auto_205616 ?auto_205617 ) ( ON ?auto_205615 ?auto_205616 ) ( CLEAR ?auto_205615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205615 )
      ( MAKE-4PILE ?auto_205615 ?auto_205616 ?auto_205617 ?auto_205618 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205625 - BLOCK
      ?auto_205626 - BLOCK
      ?auto_205627 - BLOCK
      ?auto_205628 - BLOCK
      ?auto_205629 - BLOCK
    )
    :vars
    (
      ?auto_205630 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205628 ) ( ON ?auto_205629 ?auto_205630 ) ( CLEAR ?auto_205629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205625 ) ( ON ?auto_205626 ?auto_205625 ) ( ON ?auto_205627 ?auto_205626 ) ( ON ?auto_205628 ?auto_205627 ) ( not ( = ?auto_205625 ?auto_205626 ) ) ( not ( = ?auto_205625 ?auto_205627 ) ) ( not ( = ?auto_205625 ?auto_205628 ) ) ( not ( = ?auto_205625 ?auto_205629 ) ) ( not ( = ?auto_205625 ?auto_205630 ) ) ( not ( = ?auto_205626 ?auto_205627 ) ) ( not ( = ?auto_205626 ?auto_205628 ) ) ( not ( = ?auto_205626 ?auto_205629 ) ) ( not ( = ?auto_205626 ?auto_205630 ) ) ( not ( = ?auto_205627 ?auto_205628 ) ) ( not ( = ?auto_205627 ?auto_205629 ) ) ( not ( = ?auto_205627 ?auto_205630 ) ) ( not ( = ?auto_205628 ?auto_205629 ) ) ( not ( = ?auto_205628 ?auto_205630 ) ) ( not ( = ?auto_205629 ?auto_205630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205629 ?auto_205630 )
      ( !STACK ?auto_205629 ?auto_205628 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205636 - BLOCK
      ?auto_205637 - BLOCK
      ?auto_205638 - BLOCK
      ?auto_205639 - BLOCK
      ?auto_205640 - BLOCK
    )
    :vars
    (
      ?auto_205641 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205639 ) ( ON ?auto_205640 ?auto_205641 ) ( CLEAR ?auto_205640 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205636 ) ( ON ?auto_205637 ?auto_205636 ) ( ON ?auto_205638 ?auto_205637 ) ( ON ?auto_205639 ?auto_205638 ) ( not ( = ?auto_205636 ?auto_205637 ) ) ( not ( = ?auto_205636 ?auto_205638 ) ) ( not ( = ?auto_205636 ?auto_205639 ) ) ( not ( = ?auto_205636 ?auto_205640 ) ) ( not ( = ?auto_205636 ?auto_205641 ) ) ( not ( = ?auto_205637 ?auto_205638 ) ) ( not ( = ?auto_205637 ?auto_205639 ) ) ( not ( = ?auto_205637 ?auto_205640 ) ) ( not ( = ?auto_205637 ?auto_205641 ) ) ( not ( = ?auto_205638 ?auto_205639 ) ) ( not ( = ?auto_205638 ?auto_205640 ) ) ( not ( = ?auto_205638 ?auto_205641 ) ) ( not ( = ?auto_205639 ?auto_205640 ) ) ( not ( = ?auto_205639 ?auto_205641 ) ) ( not ( = ?auto_205640 ?auto_205641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205640 ?auto_205641 )
      ( !STACK ?auto_205640 ?auto_205639 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205647 - BLOCK
      ?auto_205648 - BLOCK
      ?auto_205649 - BLOCK
      ?auto_205650 - BLOCK
      ?auto_205651 - BLOCK
    )
    :vars
    (
      ?auto_205652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205651 ?auto_205652 ) ( ON-TABLE ?auto_205647 ) ( ON ?auto_205648 ?auto_205647 ) ( ON ?auto_205649 ?auto_205648 ) ( not ( = ?auto_205647 ?auto_205648 ) ) ( not ( = ?auto_205647 ?auto_205649 ) ) ( not ( = ?auto_205647 ?auto_205650 ) ) ( not ( = ?auto_205647 ?auto_205651 ) ) ( not ( = ?auto_205647 ?auto_205652 ) ) ( not ( = ?auto_205648 ?auto_205649 ) ) ( not ( = ?auto_205648 ?auto_205650 ) ) ( not ( = ?auto_205648 ?auto_205651 ) ) ( not ( = ?auto_205648 ?auto_205652 ) ) ( not ( = ?auto_205649 ?auto_205650 ) ) ( not ( = ?auto_205649 ?auto_205651 ) ) ( not ( = ?auto_205649 ?auto_205652 ) ) ( not ( = ?auto_205650 ?auto_205651 ) ) ( not ( = ?auto_205650 ?auto_205652 ) ) ( not ( = ?auto_205651 ?auto_205652 ) ) ( CLEAR ?auto_205649 ) ( ON ?auto_205650 ?auto_205651 ) ( CLEAR ?auto_205650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205647 ?auto_205648 ?auto_205649 ?auto_205650 )
      ( MAKE-5PILE ?auto_205647 ?auto_205648 ?auto_205649 ?auto_205650 ?auto_205651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205658 - BLOCK
      ?auto_205659 - BLOCK
      ?auto_205660 - BLOCK
      ?auto_205661 - BLOCK
      ?auto_205662 - BLOCK
    )
    :vars
    (
      ?auto_205663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205662 ?auto_205663 ) ( ON-TABLE ?auto_205658 ) ( ON ?auto_205659 ?auto_205658 ) ( ON ?auto_205660 ?auto_205659 ) ( not ( = ?auto_205658 ?auto_205659 ) ) ( not ( = ?auto_205658 ?auto_205660 ) ) ( not ( = ?auto_205658 ?auto_205661 ) ) ( not ( = ?auto_205658 ?auto_205662 ) ) ( not ( = ?auto_205658 ?auto_205663 ) ) ( not ( = ?auto_205659 ?auto_205660 ) ) ( not ( = ?auto_205659 ?auto_205661 ) ) ( not ( = ?auto_205659 ?auto_205662 ) ) ( not ( = ?auto_205659 ?auto_205663 ) ) ( not ( = ?auto_205660 ?auto_205661 ) ) ( not ( = ?auto_205660 ?auto_205662 ) ) ( not ( = ?auto_205660 ?auto_205663 ) ) ( not ( = ?auto_205661 ?auto_205662 ) ) ( not ( = ?auto_205661 ?auto_205663 ) ) ( not ( = ?auto_205662 ?auto_205663 ) ) ( CLEAR ?auto_205660 ) ( ON ?auto_205661 ?auto_205662 ) ( CLEAR ?auto_205661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205658 ?auto_205659 ?auto_205660 ?auto_205661 )
      ( MAKE-5PILE ?auto_205658 ?auto_205659 ?auto_205660 ?auto_205661 ?auto_205662 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205669 - BLOCK
      ?auto_205670 - BLOCK
      ?auto_205671 - BLOCK
      ?auto_205672 - BLOCK
      ?auto_205673 - BLOCK
    )
    :vars
    (
      ?auto_205674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205673 ?auto_205674 ) ( ON-TABLE ?auto_205669 ) ( ON ?auto_205670 ?auto_205669 ) ( not ( = ?auto_205669 ?auto_205670 ) ) ( not ( = ?auto_205669 ?auto_205671 ) ) ( not ( = ?auto_205669 ?auto_205672 ) ) ( not ( = ?auto_205669 ?auto_205673 ) ) ( not ( = ?auto_205669 ?auto_205674 ) ) ( not ( = ?auto_205670 ?auto_205671 ) ) ( not ( = ?auto_205670 ?auto_205672 ) ) ( not ( = ?auto_205670 ?auto_205673 ) ) ( not ( = ?auto_205670 ?auto_205674 ) ) ( not ( = ?auto_205671 ?auto_205672 ) ) ( not ( = ?auto_205671 ?auto_205673 ) ) ( not ( = ?auto_205671 ?auto_205674 ) ) ( not ( = ?auto_205672 ?auto_205673 ) ) ( not ( = ?auto_205672 ?auto_205674 ) ) ( not ( = ?auto_205673 ?auto_205674 ) ) ( ON ?auto_205672 ?auto_205673 ) ( CLEAR ?auto_205670 ) ( ON ?auto_205671 ?auto_205672 ) ( CLEAR ?auto_205671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205669 ?auto_205670 ?auto_205671 )
      ( MAKE-5PILE ?auto_205669 ?auto_205670 ?auto_205671 ?auto_205672 ?auto_205673 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205680 - BLOCK
      ?auto_205681 - BLOCK
      ?auto_205682 - BLOCK
      ?auto_205683 - BLOCK
      ?auto_205684 - BLOCK
    )
    :vars
    (
      ?auto_205685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205684 ?auto_205685 ) ( ON-TABLE ?auto_205680 ) ( ON ?auto_205681 ?auto_205680 ) ( not ( = ?auto_205680 ?auto_205681 ) ) ( not ( = ?auto_205680 ?auto_205682 ) ) ( not ( = ?auto_205680 ?auto_205683 ) ) ( not ( = ?auto_205680 ?auto_205684 ) ) ( not ( = ?auto_205680 ?auto_205685 ) ) ( not ( = ?auto_205681 ?auto_205682 ) ) ( not ( = ?auto_205681 ?auto_205683 ) ) ( not ( = ?auto_205681 ?auto_205684 ) ) ( not ( = ?auto_205681 ?auto_205685 ) ) ( not ( = ?auto_205682 ?auto_205683 ) ) ( not ( = ?auto_205682 ?auto_205684 ) ) ( not ( = ?auto_205682 ?auto_205685 ) ) ( not ( = ?auto_205683 ?auto_205684 ) ) ( not ( = ?auto_205683 ?auto_205685 ) ) ( not ( = ?auto_205684 ?auto_205685 ) ) ( ON ?auto_205683 ?auto_205684 ) ( CLEAR ?auto_205681 ) ( ON ?auto_205682 ?auto_205683 ) ( CLEAR ?auto_205682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205680 ?auto_205681 ?auto_205682 )
      ( MAKE-5PILE ?auto_205680 ?auto_205681 ?auto_205682 ?auto_205683 ?auto_205684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205691 - BLOCK
      ?auto_205692 - BLOCK
      ?auto_205693 - BLOCK
      ?auto_205694 - BLOCK
      ?auto_205695 - BLOCK
    )
    :vars
    (
      ?auto_205696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205695 ?auto_205696 ) ( ON-TABLE ?auto_205691 ) ( not ( = ?auto_205691 ?auto_205692 ) ) ( not ( = ?auto_205691 ?auto_205693 ) ) ( not ( = ?auto_205691 ?auto_205694 ) ) ( not ( = ?auto_205691 ?auto_205695 ) ) ( not ( = ?auto_205691 ?auto_205696 ) ) ( not ( = ?auto_205692 ?auto_205693 ) ) ( not ( = ?auto_205692 ?auto_205694 ) ) ( not ( = ?auto_205692 ?auto_205695 ) ) ( not ( = ?auto_205692 ?auto_205696 ) ) ( not ( = ?auto_205693 ?auto_205694 ) ) ( not ( = ?auto_205693 ?auto_205695 ) ) ( not ( = ?auto_205693 ?auto_205696 ) ) ( not ( = ?auto_205694 ?auto_205695 ) ) ( not ( = ?auto_205694 ?auto_205696 ) ) ( not ( = ?auto_205695 ?auto_205696 ) ) ( ON ?auto_205694 ?auto_205695 ) ( ON ?auto_205693 ?auto_205694 ) ( CLEAR ?auto_205691 ) ( ON ?auto_205692 ?auto_205693 ) ( CLEAR ?auto_205692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205691 ?auto_205692 )
      ( MAKE-5PILE ?auto_205691 ?auto_205692 ?auto_205693 ?auto_205694 ?auto_205695 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205702 - BLOCK
      ?auto_205703 - BLOCK
      ?auto_205704 - BLOCK
      ?auto_205705 - BLOCK
      ?auto_205706 - BLOCK
    )
    :vars
    (
      ?auto_205707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205706 ?auto_205707 ) ( ON-TABLE ?auto_205702 ) ( not ( = ?auto_205702 ?auto_205703 ) ) ( not ( = ?auto_205702 ?auto_205704 ) ) ( not ( = ?auto_205702 ?auto_205705 ) ) ( not ( = ?auto_205702 ?auto_205706 ) ) ( not ( = ?auto_205702 ?auto_205707 ) ) ( not ( = ?auto_205703 ?auto_205704 ) ) ( not ( = ?auto_205703 ?auto_205705 ) ) ( not ( = ?auto_205703 ?auto_205706 ) ) ( not ( = ?auto_205703 ?auto_205707 ) ) ( not ( = ?auto_205704 ?auto_205705 ) ) ( not ( = ?auto_205704 ?auto_205706 ) ) ( not ( = ?auto_205704 ?auto_205707 ) ) ( not ( = ?auto_205705 ?auto_205706 ) ) ( not ( = ?auto_205705 ?auto_205707 ) ) ( not ( = ?auto_205706 ?auto_205707 ) ) ( ON ?auto_205705 ?auto_205706 ) ( ON ?auto_205704 ?auto_205705 ) ( CLEAR ?auto_205702 ) ( ON ?auto_205703 ?auto_205704 ) ( CLEAR ?auto_205703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205702 ?auto_205703 )
      ( MAKE-5PILE ?auto_205702 ?auto_205703 ?auto_205704 ?auto_205705 ?auto_205706 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205713 - BLOCK
      ?auto_205714 - BLOCK
      ?auto_205715 - BLOCK
      ?auto_205716 - BLOCK
      ?auto_205717 - BLOCK
    )
    :vars
    (
      ?auto_205718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205717 ?auto_205718 ) ( not ( = ?auto_205713 ?auto_205714 ) ) ( not ( = ?auto_205713 ?auto_205715 ) ) ( not ( = ?auto_205713 ?auto_205716 ) ) ( not ( = ?auto_205713 ?auto_205717 ) ) ( not ( = ?auto_205713 ?auto_205718 ) ) ( not ( = ?auto_205714 ?auto_205715 ) ) ( not ( = ?auto_205714 ?auto_205716 ) ) ( not ( = ?auto_205714 ?auto_205717 ) ) ( not ( = ?auto_205714 ?auto_205718 ) ) ( not ( = ?auto_205715 ?auto_205716 ) ) ( not ( = ?auto_205715 ?auto_205717 ) ) ( not ( = ?auto_205715 ?auto_205718 ) ) ( not ( = ?auto_205716 ?auto_205717 ) ) ( not ( = ?auto_205716 ?auto_205718 ) ) ( not ( = ?auto_205717 ?auto_205718 ) ) ( ON ?auto_205716 ?auto_205717 ) ( ON ?auto_205715 ?auto_205716 ) ( ON ?auto_205714 ?auto_205715 ) ( ON ?auto_205713 ?auto_205714 ) ( CLEAR ?auto_205713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205713 )
      ( MAKE-5PILE ?auto_205713 ?auto_205714 ?auto_205715 ?auto_205716 ?auto_205717 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_205724 - BLOCK
      ?auto_205725 - BLOCK
      ?auto_205726 - BLOCK
      ?auto_205727 - BLOCK
      ?auto_205728 - BLOCK
    )
    :vars
    (
      ?auto_205729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205728 ?auto_205729 ) ( not ( = ?auto_205724 ?auto_205725 ) ) ( not ( = ?auto_205724 ?auto_205726 ) ) ( not ( = ?auto_205724 ?auto_205727 ) ) ( not ( = ?auto_205724 ?auto_205728 ) ) ( not ( = ?auto_205724 ?auto_205729 ) ) ( not ( = ?auto_205725 ?auto_205726 ) ) ( not ( = ?auto_205725 ?auto_205727 ) ) ( not ( = ?auto_205725 ?auto_205728 ) ) ( not ( = ?auto_205725 ?auto_205729 ) ) ( not ( = ?auto_205726 ?auto_205727 ) ) ( not ( = ?auto_205726 ?auto_205728 ) ) ( not ( = ?auto_205726 ?auto_205729 ) ) ( not ( = ?auto_205727 ?auto_205728 ) ) ( not ( = ?auto_205727 ?auto_205729 ) ) ( not ( = ?auto_205728 ?auto_205729 ) ) ( ON ?auto_205727 ?auto_205728 ) ( ON ?auto_205726 ?auto_205727 ) ( ON ?auto_205725 ?auto_205726 ) ( ON ?auto_205724 ?auto_205725 ) ( CLEAR ?auto_205724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205724 )
      ( MAKE-5PILE ?auto_205724 ?auto_205725 ?auto_205726 ?auto_205727 ?auto_205728 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205736 - BLOCK
      ?auto_205737 - BLOCK
      ?auto_205738 - BLOCK
      ?auto_205739 - BLOCK
      ?auto_205740 - BLOCK
      ?auto_205741 - BLOCK
    )
    :vars
    (
      ?auto_205742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205740 ) ( ON ?auto_205741 ?auto_205742 ) ( CLEAR ?auto_205741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205736 ) ( ON ?auto_205737 ?auto_205736 ) ( ON ?auto_205738 ?auto_205737 ) ( ON ?auto_205739 ?auto_205738 ) ( ON ?auto_205740 ?auto_205739 ) ( not ( = ?auto_205736 ?auto_205737 ) ) ( not ( = ?auto_205736 ?auto_205738 ) ) ( not ( = ?auto_205736 ?auto_205739 ) ) ( not ( = ?auto_205736 ?auto_205740 ) ) ( not ( = ?auto_205736 ?auto_205741 ) ) ( not ( = ?auto_205736 ?auto_205742 ) ) ( not ( = ?auto_205737 ?auto_205738 ) ) ( not ( = ?auto_205737 ?auto_205739 ) ) ( not ( = ?auto_205737 ?auto_205740 ) ) ( not ( = ?auto_205737 ?auto_205741 ) ) ( not ( = ?auto_205737 ?auto_205742 ) ) ( not ( = ?auto_205738 ?auto_205739 ) ) ( not ( = ?auto_205738 ?auto_205740 ) ) ( not ( = ?auto_205738 ?auto_205741 ) ) ( not ( = ?auto_205738 ?auto_205742 ) ) ( not ( = ?auto_205739 ?auto_205740 ) ) ( not ( = ?auto_205739 ?auto_205741 ) ) ( not ( = ?auto_205739 ?auto_205742 ) ) ( not ( = ?auto_205740 ?auto_205741 ) ) ( not ( = ?auto_205740 ?auto_205742 ) ) ( not ( = ?auto_205741 ?auto_205742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205741 ?auto_205742 )
      ( !STACK ?auto_205741 ?auto_205740 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205749 - BLOCK
      ?auto_205750 - BLOCK
      ?auto_205751 - BLOCK
      ?auto_205752 - BLOCK
      ?auto_205753 - BLOCK
      ?auto_205754 - BLOCK
    )
    :vars
    (
      ?auto_205755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205753 ) ( ON ?auto_205754 ?auto_205755 ) ( CLEAR ?auto_205754 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205749 ) ( ON ?auto_205750 ?auto_205749 ) ( ON ?auto_205751 ?auto_205750 ) ( ON ?auto_205752 ?auto_205751 ) ( ON ?auto_205753 ?auto_205752 ) ( not ( = ?auto_205749 ?auto_205750 ) ) ( not ( = ?auto_205749 ?auto_205751 ) ) ( not ( = ?auto_205749 ?auto_205752 ) ) ( not ( = ?auto_205749 ?auto_205753 ) ) ( not ( = ?auto_205749 ?auto_205754 ) ) ( not ( = ?auto_205749 ?auto_205755 ) ) ( not ( = ?auto_205750 ?auto_205751 ) ) ( not ( = ?auto_205750 ?auto_205752 ) ) ( not ( = ?auto_205750 ?auto_205753 ) ) ( not ( = ?auto_205750 ?auto_205754 ) ) ( not ( = ?auto_205750 ?auto_205755 ) ) ( not ( = ?auto_205751 ?auto_205752 ) ) ( not ( = ?auto_205751 ?auto_205753 ) ) ( not ( = ?auto_205751 ?auto_205754 ) ) ( not ( = ?auto_205751 ?auto_205755 ) ) ( not ( = ?auto_205752 ?auto_205753 ) ) ( not ( = ?auto_205752 ?auto_205754 ) ) ( not ( = ?auto_205752 ?auto_205755 ) ) ( not ( = ?auto_205753 ?auto_205754 ) ) ( not ( = ?auto_205753 ?auto_205755 ) ) ( not ( = ?auto_205754 ?auto_205755 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205754 ?auto_205755 )
      ( !STACK ?auto_205754 ?auto_205753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205762 - BLOCK
      ?auto_205763 - BLOCK
      ?auto_205764 - BLOCK
      ?auto_205765 - BLOCK
      ?auto_205766 - BLOCK
      ?auto_205767 - BLOCK
    )
    :vars
    (
      ?auto_205768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205767 ?auto_205768 ) ( ON-TABLE ?auto_205762 ) ( ON ?auto_205763 ?auto_205762 ) ( ON ?auto_205764 ?auto_205763 ) ( ON ?auto_205765 ?auto_205764 ) ( not ( = ?auto_205762 ?auto_205763 ) ) ( not ( = ?auto_205762 ?auto_205764 ) ) ( not ( = ?auto_205762 ?auto_205765 ) ) ( not ( = ?auto_205762 ?auto_205766 ) ) ( not ( = ?auto_205762 ?auto_205767 ) ) ( not ( = ?auto_205762 ?auto_205768 ) ) ( not ( = ?auto_205763 ?auto_205764 ) ) ( not ( = ?auto_205763 ?auto_205765 ) ) ( not ( = ?auto_205763 ?auto_205766 ) ) ( not ( = ?auto_205763 ?auto_205767 ) ) ( not ( = ?auto_205763 ?auto_205768 ) ) ( not ( = ?auto_205764 ?auto_205765 ) ) ( not ( = ?auto_205764 ?auto_205766 ) ) ( not ( = ?auto_205764 ?auto_205767 ) ) ( not ( = ?auto_205764 ?auto_205768 ) ) ( not ( = ?auto_205765 ?auto_205766 ) ) ( not ( = ?auto_205765 ?auto_205767 ) ) ( not ( = ?auto_205765 ?auto_205768 ) ) ( not ( = ?auto_205766 ?auto_205767 ) ) ( not ( = ?auto_205766 ?auto_205768 ) ) ( not ( = ?auto_205767 ?auto_205768 ) ) ( CLEAR ?auto_205765 ) ( ON ?auto_205766 ?auto_205767 ) ( CLEAR ?auto_205766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205762 ?auto_205763 ?auto_205764 ?auto_205765 ?auto_205766 )
      ( MAKE-6PILE ?auto_205762 ?auto_205763 ?auto_205764 ?auto_205765 ?auto_205766 ?auto_205767 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205775 - BLOCK
      ?auto_205776 - BLOCK
      ?auto_205777 - BLOCK
      ?auto_205778 - BLOCK
      ?auto_205779 - BLOCK
      ?auto_205780 - BLOCK
    )
    :vars
    (
      ?auto_205781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205780 ?auto_205781 ) ( ON-TABLE ?auto_205775 ) ( ON ?auto_205776 ?auto_205775 ) ( ON ?auto_205777 ?auto_205776 ) ( ON ?auto_205778 ?auto_205777 ) ( not ( = ?auto_205775 ?auto_205776 ) ) ( not ( = ?auto_205775 ?auto_205777 ) ) ( not ( = ?auto_205775 ?auto_205778 ) ) ( not ( = ?auto_205775 ?auto_205779 ) ) ( not ( = ?auto_205775 ?auto_205780 ) ) ( not ( = ?auto_205775 ?auto_205781 ) ) ( not ( = ?auto_205776 ?auto_205777 ) ) ( not ( = ?auto_205776 ?auto_205778 ) ) ( not ( = ?auto_205776 ?auto_205779 ) ) ( not ( = ?auto_205776 ?auto_205780 ) ) ( not ( = ?auto_205776 ?auto_205781 ) ) ( not ( = ?auto_205777 ?auto_205778 ) ) ( not ( = ?auto_205777 ?auto_205779 ) ) ( not ( = ?auto_205777 ?auto_205780 ) ) ( not ( = ?auto_205777 ?auto_205781 ) ) ( not ( = ?auto_205778 ?auto_205779 ) ) ( not ( = ?auto_205778 ?auto_205780 ) ) ( not ( = ?auto_205778 ?auto_205781 ) ) ( not ( = ?auto_205779 ?auto_205780 ) ) ( not ( = ?auto_205779 ?auto_205781 ) ) ( not ( = ?auto_205780 ?auto_205781 ) ) ( CLEAR ?auto_205778 ) ( ON ?auto_205779 ?auto_205780 ) ( CLEAR ?auto_205779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205775 ?auto_205776 ?auto_205777 ?auto_205778 ?auto_205779 )
      ( MAKE-6PILE ?auto_205775 ?auto_205776 ?auto_205777 ?auto_205778 ?auto_205779 ?auto_205780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205788 - BLOCK
      ?auto_205789 - BLOCK
      ?auto_205790 - BLOCK
      ?auto_205791 - BLOCK
      ?auto_205792 - BLOCK
      ?auto_205793 - BLOCK
    )
    :vars
    (
      ?auto_205794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205793 ?auto_205794 ) ( ON-TABLE ?auto_205788 ) ( ON ?auto_205789 ?auto_205788 ) ( ON ?auto_205790 ?auto_205789 ) ( not ( = ?auto_205788 ?auto_205789 ) ) ( not ( = ?auto_205788 ?auto_205790 ) ) ( not ( = ?auto_205788 ?auto_205791 ) ) ( not ( = ?auto_205788 ?auto_205792 ) ) ( not ( = ?auto_205788 ?auto_205793 ) ) ( not ( = ?auto_205788 ?auto_205794 ) ) ( not ( = ?auto_205789 ?auto_205790 ) ) ( not ( = ?auto_205789 ?auto_205791 ) ) ( not ( = ?auto_205789 ?auto_205792 ) ) ( not ( = ?auto_205789 ?auto_205793 ) ) ( not ( = ?auto_205789 ?auto_205794 ) ) ( not ( = ?auto_205790 ?auto_205791 ) ) ( not ( = ?auto_205790 ?auto_205792 ) ) ( not ( = ?auto_205790 ?auto_205793 ) ) ( not ( = ?auto_205790 ?auto_205794 ) ) ( not ( = ?auto_205791 ?auto_205792 ) ) ( not ( = ?auto_205791 ?auto_205793 ) ) ( not ( = ?auto_205791 ?auto_205794 ) ) ( not ( = ?auto_205792 ?auto_205793 ) ) ( not ( = ?auto_205792 ?auto_205794 ) ) ( not ( = ?auto_205793 ?auto_205794 ) ) ( ON ?auto_205792 ?auto_205793 ) ( CLEAR ?auto_205790 ) ( ON ?auto_205791 ?auto_205792 ) ( CLEAR ?auto_205791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205788 ?auto_205789 ?auto_205790 ?auto_205791 )
      ( MAKE-6PILE ?auto_205788 ?auto_205789 ?auto_205790 ?auto_205791 ?auto_205792 ?auto_205793 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205801 - BLOCK
      ?auto_205802 - BLOCK
      ?auto_205803 - BLOCK
      ?auto_205804 - BLOCK
      ?auto_205805 - BLOCK
      ?auto_205806 - BLOCK
    )
    :vars
    (
      ?auto_205807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205806 ?auto_205807 ) ( ON-TABLE ?auto_205801 ) ( ON ?auto_205802 ?auto_205801 ) ( ON ?auto_205803 ?auto_205802 ) ( not ( = ?auto_205801 ?auto_205802 ) ) ( not ( = ?auto_205801 ?auto_205803 ) ) ( not ( = ?auto_205801 ?auto_205804 ) ) ( not ( = ?auto_205801 ?auto_205805 ) ) ( not ( = ?auto_205801 ?auto_205806 ) ) ( not ( = ?auto_205801 ?auto_205807 ) ) ( not ( = ?auto_205802 ?auto_205803 ) ) ( not ( = ?auto_205802 ?auto_205804 ) ) ( not ( = ?auto_205802 ?auto_205805 ) ) ( not ( = ?auto_205802 ?auto_205806 ) ) ( not ( = ?auto_205802 ?auto_205807 ) ) ( not ( = ?auto_205803 ?auto_205804 ) ) ( not ( = ?auto_205803 ?auto_205805 ) ) ( not ( = ?auto_205803 ?auto_205806 ) ) ( not ( = ?auto_205803 ?auto_205807 ) ) ( not ( = ?auto_205804 ?auto_205805 ) ) ( not ( = ?auto_205804 ?auto_205806 ) ) ( not ( = ?auto_205804 ?auto_205807 ) ) ( not ( = ?auto_205805 ?auto_205806 ) ) ( not ( = ?auto_205805 ?auto_205807 ) ) ( not ( = ?auto_205806 ?auto_205807 ) ) ( ON ?auto_205805 ?auto_205806 ) ( CLEAR ?auto_205803 ) ( ON ?auto_205804 ?auto_205805 ) ( CLEAR ?auto_205804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205801 ?auto_205802 ?auto_205803 ?auto_205804 )
      ( MAKE-6PILE ?auto_205801 ?auto_205802 ?auto_205803 ?auto_205804 ?auto_205805 ?auto_205806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205814 - BLOCK
      ?auto_205815 - BLOCK
      ?auto_205816 - BLOCK
      ?auto_205817 - BLOCK
      ?auto_205818 - BLOCK
      ?auto_205819 - BLOCK
    )
    :vars
    (
      ?auto_205820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205819 ?auto_205820 ) ( ON-TABLE ?auto_205814 ) ( ON ?auto_205815 ?auto_205814 ) ( not ( = ?auto_205814 ?auto_205815 ) ) ( not ( = ?auto_205814 ?auto_205816 ) ) ( not ( = ?auto_205814 ?auto_205817 ) ) ( not ( = ?auto_205814 ?auto_205818 ) ) ( not ( = ?auto_205814 ?auto_205819 ) ) ( not ( = ?auto_205814 ?auto_205820 ) ) ( not ( = ?auto_205815 ?auto_205816 ) ) ( not ( = ?auto_205815 ?auto_205817 ) ) ( not ( = ?auto_205815 ?auto_205818 ) ) ( not ( = ?auto_205815 ?auto_205819 ) ) ( not ( = ?auto_205815 ?auto_205820 ) ) ( not ( = ?auto_205816 ?auto_205817 ) ) ( not ( = ?auto_205816 ?auto_205818 ) ) ( not ( = ?auto_205816 ?auto_205819 ) ) ( not ( = ?auto_205816 ?auto_205820 ) ) ( not ( = ?auto_205817 ?auto_205818 ) ) ( not ( = ?auto_205817 ?auto_205819 ) ) ( not ( = ?auto_205817 ?auto_205820 ) ) ( not ( = ?auto_205818 ?auto_205819 ) ) ( not ( = ?auto_205818 ?auto_205820 ) ) ( not ( = ?auto_205819 ?auto_205820 ) ) ( ON ?auto_205818 ?auto_205819 ) ( ON ?auto_205817 ?auto_205818 ) ( CLEAR ?auto_205815 ) ( ON ?auto_205816 ?auto_205817 ) ( CLEAR ?auto_205816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205814 ?auto_205815 ?auto_205816 )
      ( MAKE-6PILE ?auto_205814 ?auto_205815 ?auto_205816 ?auto_205817 ?auto_205818 ?auto_205819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205827 - BLOCK
      ?auto_205828 - BLOCK
      ?auto_205829 - BLOCK
      ?auto_205830 - BLOCK
      ?auto_205831 - BLOCK
      ?auto_205832 - BLOCK
    )
    :vars
    (
      ?auto_205833 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205832 ?auto_205833 ) ( ON-TABLE ?auto_205827 ) ( ON ?auto_205828 ?auto_205827 ) ( not ( = ?auto_205827 ?auto_205828 ) ) ( not ( = ?auto_205827 ?auto_205829 ) ) ( not ( = ?auto_205827 ?auto_205830 ) ) ( not ( = ?auto_205827 ?auto_205831 ) ) ( not ( = ?auto_205827 ?auto_205832 ) ) ( not ( = ?auto_205827 ?auto_205833 ) ) ( not ( = ?auto_205828 ?auto_205829 ) ) ( not ( = ?auto_205828 ?auto_205830 ) ) ( not ( = ?auto_205828 ?auto_205831 ) ) ( not ( = ?auto_205828 ?auto_205832 ) ) ( not ( = ?auto_205828 ?auto_205833 ) ) ( not ( = ?auto_205829 ?auto_205830 ) ) ( not ( = ?auto_205829 ?auto_205831 ) ) ( not ( = ?auto_205829 ?auto_205832 ) ) ( not ( = ?auto_205829 ?auto_205833 ) ) ( not ( = ?auto_205830 ?auto_205831 ) ) ( not ( = ?auto_205830 ?auto_205832 ) ) ( not ( = ?auto_205830 ?auto_205833 ) ) ( not ( = ?auto_205831 ?auto_205832 ) ) ( not ( = ?auto_205831 ?auto_205833 ) ) ( not ( = ?auto_205832 ?auto_205833 ) ) ( ON ?auto_205831 ?auto_205832 ) ( ON ?auto_205830 ?auto_205831 ) ( CLEAR ?auto_205828 ) ( ON ?auto_205829 ?auto_205830 ) ( CLEAR ?auto_205829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_205827 ?auto_205828 ?auto_205829 )
      ( MAKE-6PILE ?auto_205827 ?auto_205828 ?auto_205829 ?auto_205830 ?auto_205831 ?auto_205832 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205840 - BLOCK
      ?auto_205841 - BLOCK
      ?auto_205842 - BLOCK
      ?auto_205843 - BLOCK
      ?auto_205844 - BLOCK
      ?auto_205845 - BLOCK
    )
    :vars
    (
      ?auto_205846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205845 ?auto_205846 ) ( ON-TABLE ?auto_205840 ) ( not ( = ?auto_205840 ?auto_205841 ) ) ( not ( = ?auto_205840 ?auto_205842 ) ) ( not ( = ?auto_205840 ?auto_205843 ) ) ( not ( = ?auto_205840 ?auto_205844 ) ) ( not ( = ?auto_205840 ?auto_205845 ) ) ( not ( = ?auto_205840 ?auto_205846 ) ) ( not ( = ?auto_205841 ?auto_205842 ) ) ( not ( = ?auto_205841 ?auto_205843 ) ) ( not ( = ?auto_205841 ?auto_205844 ) ) ( not ( = ?auto_205841 ?auto_205845 ) ) ( not ( = ?auto_205841 ?auto_205846 ) ) ( not ( = ?auto_205842 ?auto_205843 ) ) ( not ( = ?auto_205842 ?auto_205844 ) ) ( not ( = ?auto_205842 ?auto_205845 ) ) ( not ( = ?auto_205842 ?auto_205846 ) ) ( not ( = ?auto_205843 ?auto_205844 ) ) ( not ( = ?auto_205843 ?auto_205845 ) ) ( not ( = ?auto_205843 ?auto_205846 ) ) ( not ( = ?auto_205844 ?auto_205845 ) ) ( not ( = ?auto_205844 ?auto_205846 ) ) ( not ( = ?auto_205845 ?auto_205846 ) ) ( ON ?auto_205844 ?auto_205845 ) ( ON ?auto_205843 ?auto_205844 ) ( ON ?auto_205842 ?auto_205843 ) ( CLEAR ?auto_205840 ) ( ON ?auto_205841 ?auto_205842 ) ( CLEAR ?auto_205841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205840 ?auto_205841 )
      ( MAKE-6PILE ?auto_205840 ?auto_205841 ?auto_205842 ?auto_205843 ?auto_205844 ?auto_205845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205853 - BLOCK
      ?auto_205854 - BLOCK
      ?auto_205855 - BLOCK
      ?auto_205856 - BLOCK
      ?auto_205857 - BLOCK
      ?auto_205858 - BLOCK
    )
    :vars
    (
      ?auto_205859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205858 ?auto_205859 ) ( ON-TABLE ?auto_205853 ) ( not ( = ?auto_205853 ?auto_205854 ) ) ( not ( = ?auto_205853 ?auto_205855 ) ) ( not ( = ?auto_205853 ?auto_205856 ) ) ( not ( = ?auto_205853 ?auto_205857 ) ) ( not ( = ?auto_205853 ?auto_205858 ) ) ( not ( = ?auto_205853 ?auto_205859 ) ) ( not ( = ?auto_205854 ?auto_205855 ) ) ( not ( = ?auto_205854 ?auto_205856 ) ) ( not ( = ?auto_205854 ?auto_205857 ) ) ( not ( = ?auto_205854 ?auto_205858 ) ) ( not ( = ?auto_205854 ?auto_205859 ) ) ( not ( = ?auto_205855 ?auto_205856 ) ) ( not ( = ?auto_205855 ?auto_205857 ) ) ( not ( = ?auto_205855 ?auto_205858 ) ) ( not ( = ?auto_205855 ?auto_205859 ) ) ( not ( = ?auto_205856 ?auto_205857 ) ) ( not ( = ?auto_205856 ?auto_205858 ) ) ( not ( = ?auto_205856 ?auto_205859 ) ) ( not ( = ?auto_205857 ?auto_205858 ) ) ( not ( = ?auto_205857 ?auto_205859 ) ) ( not ( = ?auto_205858 ?auto_205859 ) ) ( ON ?auto_205857 ?auto_205858 ) ( ON ?auto_205856 ?auto_205857 ) ( ON ?auto_205855 ?auto_205856 ) ( CLEAR ?auto_205853 ) ( ON ?auto_205854 ?auto_205855 ) ( CLEAR ?auto_205854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205853 ?auto_205854 )
      ( MAKE-6PILE ?auto_205853 ?auto_205854 ?auto_205855 ?auto_205856 ?auto_205857 ?auto_205858 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205866 - BLOCK
      ?auto_205867 - BLOCK
      ?auto_205868 - BLOCK
      ?auto_205869 - BLOCK
      ?auto_205870 - BLOCK
      ?auto_205871 - BLOCK
    )
    :vars
    (
      ?auto_205872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205871 ?auto_205872 ) ( not ( = ?auto_205866 ?auto_205867 ) ) ( not ( = ?auto_205866 ?auto_205868 ) ) ( not ( = ?auto_205866 ?auto_205869 ) ) ( not ( = ?auto_205866 ?auto_205870 ) ) ( not ( = ?auto_205866 ?auto_205871 ) ) ( not ( = ?auto_205866 ?auto_205872 ) ) ( not ( = ?auto_205867 ?auto_205868 ) ) ( not ( = ?auto_205867 ?auto_205869 ) ) ( not ( = ?auto_205867 ?auto_205870 ) ) ( not ( = ?auto_205867 ?auto_205871 ) ) ( not ( = ?auto_205867 ?auto_205872 ) ) ( not ( = ?auto_205868 ?auto_205869 ) ) ( not ( = ?auto_205868 ?auto_205870 ) ) ( not ( = ?auto_205868 ?auto_205871 ) ) ( not ( = ?auto_205868 ?auto_205872 ) ) ( not ( = ?auto_205869 ?auto_205870 ) ) ( not ( = ?auto_205869 ?auto_205871 ) ) ( not ( = ?auto_205869 ?auto_205872 ) ) ( not ( = ?auto_205870 ?auto_205871 ) ) ( not ( = ?auto_205870 ?auto_205872 ) ) ( not ( = ?auto_205871 ?auto_205872 ) ) ( ON ?auto_205870 ?auto_205871 ) ( ON ?auto_205869 ?auto_205870 ) ( ON ?auto_205868 ?auto_205869 ) ( ON ?auto_205867 ?auto_205868 ) ( ON ?auto_205866 ?auto_205867 ) ( CLEAR ?auto_205866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205866 )
      ( MAKE-6PILE ?auto_205866 ?auto_205867 ?auto_205868 ?auto_205869 ?auto_205870 ?auto_205871 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_205879 - BLOCK
      ?auto_205880 - BLOCK
      ?auto_205881 - BLOCK
      ?auto_205882 - BLOCK
      ?auto_205883 - BLOCK
      ?auto_205884 - BLOCK
    )
    :vars
    (
      ?auto_205885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205884 ?auto_205885 ) ( not ( = ?auto_205879 ?auto_205880 ) ) ( not ( = ?auto_205879 ?auto_205881 ) ) ( not ( = ?auto_205879 ?auto_205882 ) ) ( not ( = ?auto_205879 ?auto_205883 ) ) ( not ( = ?auto_205879 ?auto_205884 ) ) ( not ( = ?auto_205879 ?auto_205885 ) ) ( not ( = ?auto_205880 ?auto_205881 ) ) ( not ( = ?auto_205880 ?auto_205882 ) ) ( not ( = ?auto_205880 ?auto_205883 ) ) ( not ( = ?auto_205880 ?auto_205884 ) ) ( not ( = ?auto_205880 ?auto_205885 ) ) ( not ( = ?auto_205881 ?auto_205882 ) ) ( not ( = ?auto_205881 ?auto_205883 ) ) ( not ( = ?auto_205881 ?auto_205884 ) ) ( not ( = ?auto_205881 ?auto_205885 ) ) ( not ( = ?auto_205882 ?auto_205883 ) ) ( not ( = ?auto_205882 ?auto_205884 ) ) ( not ( = ?auto_205882 ?auto_205885 ) ) ( not ( = ?auto_205883 ?auto_205884 ) ) ( not ( = ?auto_205883 ?auto_205885 ) ) ( not ( = ?auto_205884 ?auto_205885 ) ) ( ON ?auto_205883 ?auto_205884 ) ( ON ?auto_205882 ?auto_205883 ) ( ON ?auto_205881 ?auto_205882 ) ( ON ?auto_205880 ?auto_205881 ) ( ON ?auto_205879 ?auto_205880 ) ( CLEAR ?auto_205879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_205879 )
      ( MAKE-6PILE ?auto_205879 ?auto_205880 ?auto_205881 ?auto_205882 ?auto_205883 ?auto_205884 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205893 - BLOCK
      ?auto_205894 - BLOCK
      ?auto_205895 - BLOCK
      ?auto_205896 - BLOCK
      ?auto_205897 - BLOCK
      ?auto_205898 - BLOCK
      ?auto_205899 - BLOCK
    )
    :vars
    (
      ?auto_205900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205898 ) ( ON ?auto_205899 ?auto_205900 ) ( CLEAR ?auto_205899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205893 ) ( ON ?auto_205894 ?auto_205893 ) ( ON ?auto_205895 ?auto_205894 ) ( ON ?auto_205896 ?auto_205895 ) ( ON ?auto_205897 ?auto_205896 ) ( ON ?auto_205898 ?auto_205897 ) ( not ( = ?auto_205893 ?auto_205894 ) ) ( not ( = ?auto_205893 ?auto_205895 ) ) ( not ( = ?auto_205893 ?auto_205896 ) ) ( not ( = ?auto_205893 ?auto_205897 ) ) ( not ( = ?auto_205893 ?auto_205898 ) ) ( not ( = ?auto_205893 ?auto_205899 ) ) ( not ( = ?auto_205893 ?auto_205900 ) ) ( not ( = ?auto_205894 ?auto_205895 ) ) ( not ( = ?auto_205894 ?auto_205896 ) ) ( not ( = ?auto_205894 ?auto_205897 ) ) ( not ( = ?auto_205894 ?auto_205898 ) ) ( not ( = ?auto_205894 ?auto_205899 ) ) ( not ( = ?auto_205894 ?auto_205900 ) ) ( not ( = ?auto_205895 ?auto_205896 ) ) ( not ( = ?auto_205895 ?auto_205897 ) ) ( not ( = ?auto_205895 ?auto_205898 ) ) ( not ( = ?auto_205895 ?auto_205899 ) ) ( not ( = ?auto_205895 ?auto_205900 ) ) ( not ( = ?auto_205896 ?auto_205897 ) ) ( not ( = ?auto_205896 ?auto_205898 ) ) ( not ( = ?auto_205896 ?auto_205899 ) ) ( not ( = ?auto_205896 ?auto_205900 ) ) ( not ( = ?auto_205897 ?auto_205898 ) ) ( not ( = ?auto_205897 ?auto_205899 ) ) ( not ( = ?auto_205897 ?auto_205900 ) ) ( not ( = ?auto_205898 ?auto_205899 ) ) ( not ( = ?auto_205898 ?auto_205900 ) ) ( not ( = ?auto_205899 ?auto_205900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205899 ?auto_205900 )
      ( !STACK ?auto_205899 ?auto_205898 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205908 - BLOCK
      ?auto_205909 - BLOCK
      ?auto_205910 - BLOCK
      ?auto_205911 - BLOCK
      ?auto_205912 - BLOCK
      ?auto_205913 - BLOCK
      ?auto_205914 - BLOCK
    )
    :vars
    (
      ?auto_205915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_205913 ) ( ON ?auto_205914 ?auto_205915 ) ( CLEAR ?auto_205914 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205908 ) ( ON ?auto_205909 ?auto_205908 ) ( ON ?auto_205910 ?auto_205909 ) ( ON ?auto_205911 ?auto_205910 ) ( ON ?auto_205912 ?auto_205911 ) ( ON ?auto_205913 ?auto_205912 ) ( not ( = ?auto_205908 ?auto_205909 ) ) ( not ( = ?auto_205908 ?auto_205910 ) ) ( not ( = ?auto_205908 ?auto_205911 ) ) ( not ( = ?auto_205908 ?auto_205912 ) ) ( not ( = ?auto_205908 ?auto_205913 ) ) ( not ( = ?auto_205908 ?auto_205914 ) ) ( not ( = ?auto_205908 ?auto_205915 ) ) ( not ( = ?auto_205909 ?auto_205910 ) ) ( not ( = ?auto_205909 ?auto_205911 ) ) ( not ( = ?auto_205909 ?auto_205912 ) ) ( not ( = ?auto_205909 ?auto_205913 ) ) ( not ( = ?auto_205909 ?auto_205914 ) ) ( not ( = ?auto_205909 ?auto_205915 ) ) ( not ( = ?auto_205910 ?auto_205911 ) ) ( not ( = ?auto_205910 ?auto_205912 ) ) ( not ( = ?auto_205910 ?auto_205913 ) ) ( not ( = ?auto_205910 ?auto_205914 ) ) ( not ( = ?auto_205910 ?auto_205915 ) ) ( not ( = ?auto_205911 ?auto_205912 ) ) ( not ( = ?auto_205911 ?auto_205913 ) ) ( not ( = ?auto_205911 ?auto_205914 ) ) ( not ( = ?auto_205911 ?auto_205915 ) ) ( not ( = ?auto_205912 ?auto_205913 ) ) ( not ( = ?auto_205912 ?auto_205914 ) ) ( not ( = ?auto_205912 ?auto_205915 ) ) ( not ( = ?auto_205913 ?auto_205914 ) ) ( not ( = ?auto_205913 ?auto_205915 ) ) ( not ( = ?auto_205914 ?auto_205915 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_205914 ?auto_205915 )
      ( !STACK ?auto_205914 ?auto_205913 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205923 - BLOCK
      ?auto_205924 - BLOCK
      ?auto_205925 - BLOCK
      ?auto_205926 - BLOCK
      ?auto_205927 - BLOCK
      ?auto_205928 - BLOCK
      ?auto_205929 - BLOCK
    )
    :vars
    (
      ?auto_205930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205929 ?auto_205930 ) ( ON-TABLE ?auto_205923 ) ( ON ?auto_205924 ?auto_205923 ) ( ON ?auto_205925 ?auto_205924 ) ( ON ?auto_205926 ?auto_205925 ) ( ON ?auto_205927 ?auto_205926 ) ( not ( = ?auto_205923 ?auto_205924 ) ) ( not ( = ?auto_205923 ?auto_205925 ) ) ( not ( = ?auto_205923 ?auto_205926 ) ) ( not ( = ?auto_205923 ?auto_205927 ) ) ( not ( = ?auto_205923 ?auto_205928 ) ) ( not ( = ?auto_205923 ?auto_205929 ) ) ( not ( = ?auto_205923 ?auto_205930 ) ) ( not ( = ?auto_205924 ?auto_205925 ) ) ( not ( = ?auto_205924 ?auto_205926 ) ) ( not ( = ?auto_205924 ?auto_205927 ) ) ( not ( = ?auto_205924 ?auto_205928 ) ) ( not ( = ?auto_205924 ?auto_205929 ) ) ( not ( = ?auto_205924 ?auto_205930 ) ) ( not ( = ?auto_205925 ?auto_205926 ) ) ( not ( = ?auto_205925 ?auto_205927 ) ) ( not ( = ?auto_205925 ?auto_205928 ) ) ( not ( = ?auto_205925 ?auto_205929 ) ) ( not ( = ?auto_205925 ?auto_205930 ) ) ( not ( = ?auto_205926 ?auto_205927 ) ) ( not ( = ?auto_205926 ?auto_205928 ) ) ( not ( = ?auto_205926 ?auto_205929 ) ) ( not ( = ?auto_205926 ?auto_205930 ) ) ( not ( = ?auto_205927 ?auto_205928 ) ) ( not ( = ?auto_205927 ?auto_205929 ) ) ( not ( = ?auto_205927 ?auto_205930 ) ) ( not ( = ?auto_205928 ?auto_205929 ) ) ( not ( = ?auto_205928 ?auto_205930 ) ) ( not ( = ?auto_205929 ?auto_205930 ) ) ( CLEAR ?auto_205927 ) ( ON ?auto_205928 ?auto_205929 ) ( CLEAR ?auto_205928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205923 ?auto_205924 ?auto_205925 ?auto_205926 ?auto_205927 ?auto_205928 )
      ( MAKE-7PILE ?auto_205923 ?auto_205924 ?auto_205925 ?auto_205926 ?auto_205927 ?auto_205928 ?auto_205929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205938 - BLOCK
      ?auto_205939 - BLOCK
      ?auto_205940 - BLOCK
      ?auto_205941 - BLOCK
      ?auto_205942 - BLOCK
      ?auto_205943 - BLOCK
      ?auto_205944 - BLOCK
    )
    :vars
    (
      ?auto_205945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205944 ?auto_205945 ) ( ON-TABLE ?auto_205938 ) ( ON ?auto_205939 ?auto_205938 ) ( ON ?auto_205940 ?auto_205939 ) ( ON ?auto_205941 ?auto_205940 ) ( ON ?auto_205942 ?auto_205941 ) ( not ( = ?auto_205938 ?auto_205939 ) ) ( not ( = ?auto_205938 ?auto_205940 ) ) ( not ( = ?auto_205938 ?auto_205941 ) ) ( not ( = ?auto_205938 ?auto_205942 ) ) ( not ( = ?auto_205938 ?auto_205943 ) ) ( not ( = ?auto_205938 ?auto_205944 ) ) ( not ( = ?auto_205938 ?auto_205945 ) ) ( not ( = ?auto_205939 ?auto_205940 ) ) ( not ( = ?auto_205939 ?auto_205941 ) ) ( not ( = ?auto_205939 ?auto_205942 ) ) ( not ( = ?auto_205939 ?auto_205943 ) ) ( not ( = ?auto_205939 ?auto_205944 ) ) ( not ( = ?auto_205939 ?auto_205945 ) ) ( not ( = ?auto_205940 ?auto_205941 ) ) ( not ( = ?auto_205940 ?auto_205942 ) ) ( not ( = ?auto_205940 ?auto_205943 ) ) ( not ( = ?auto_205940 ?auto_205944 ) ) ( not ( = ?auto_205940 ?auto_205945 ) ) ( not ( = ?auto_205941 ?auto_205942 ) ) ( not ( = ?auto_205941 ?auto_205943 ) ) ( not ( = ?auto_205941 ?auto_205944 ) ) ( not ( = ?auto_205941 ?auto_205945 ) ) ( not ( = ?auto_205942 ?auto_205943 ) ) ( not ( = ?auto_205942 ?auto_205944 ) ) ( not ( = ?auto_205942 ?auto_205945 ) ) ( not ( = ?auto_205943 ?auto_205944 ) ) ( not ( = ?auto_205943 ?auto_205945 ) ) ( not ( = ?auto_205944 ?auto_205945 ) ) ( CLEAR ?auto_205942 ) ( ON ?auto_205943 ?auto_205944 ) ( CLEAR ?auto_205943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_205938 ?auto_205939 ?auto_205940 ?auto_205941 ?auto_205942 ?auto_205943 )
      ( MAKE-7PILE ?auto_205938 ?auto_205939 ?auto_205940 ?auto_205941 ?auto_205942 ?auto_205943 ?auto_205944 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205953 - BLOCK
      ?auto_205954 - BLOCK
      ?auto_205955 - BLOCK
      ?auto_205956 - BLOCK
      ?auto_205957 - BLOCK
      ?auto_205958 - BLOCK
      ?auto_205959 - BLOCK
    )
    :vars
    (
      ?auto_205960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205959 ?auto_205960 ) ( ON-TABLE ?auto_205953 ) ( ON ?auto_205954 ?auto_205953 ) ( ON ?auto_205955 ?auto_205954 ) ( ON ?auto_205956 ?auto_205955 ) ( not ( = ?auto_205953 ?auto_205954 ) ) ( not ( = ?auto_205953 ?auto_205955 ) ) ( not ( = ?auto_205953 ?auto_205956 ) ) ( not ( = ?auto_205953 ?auto_205957 ) ) ( not ( = ?auto_205953 ?auto_205958 ) ) ( not ( = ?auto_205953 ?auto_205959 ) ) ( not ( = ?auto_205953 ?auto_205960 ) ) ( not ( = ?auto_205954 ?auto_205955 ) ) ( not ( = ?auto_205954 ?auto_205956 ) ) ( not ( = ?auto_205954 ?auto_205957 ) ) ( not ( = ?auto_205954 ?auto_205958 ) ) ( not ( = ?auto_205954 ?auto_205959 ) ) ( not ( = ?auto_205954 ?auto_205960 ) ) ( not ( = ?auto_205955 ?auto_205956 ) ) ( not ( = ?auto_205955 ?auto_205957 ) ) ( not ( = ?auto_205955 ?auto_205958 ) ) ( not ( = ?auto_205955 ?auto_205959 ) ) ( not ( = ?auto_205955 ?auto_205960 ) ) ( not ( = ?auto_205956 ?auto_205957 ) ) ( not ( = ?auto_205956 ?auto_205958 ) ) ( not ( = ?auto_205956 ?auto_205959 ) ) ( not ( = ?auto_205956 ?auto_205960 ) ) ( not ( = ?auto_205957 ?auto_205958 ) ) ( not ( = ?auto_205957 ?auto_205959 ) ) ( not ( = ?auto_205957 ?auto_205960 ) ) ( not ( = ?auto_205958 ?auto_205959 ) ) ( not ( = ?auto_205958 ?auto_205960 ) ) ( not ( = ?auto_205959 ?auto_205960 ) ) ( ON ?auto_205958 ?auto_205959 ) ( CLEAR ?auto_205956 ) ( ON ?auto_205957 ?auto_205958 ) ( CLEAR ?auto_205957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205953 ?auto_205954 ?auto_205955 ?auto_205956 ?auto_205957 )
      ( MAKE-7PILE ?auto_205953 ?auto_205954 ?auto_205955 ?auto_205956 ?auto_205957 ?auto_205958 ?auto_205959 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205968 - BLOCK
      ?auto_205969 - BLOCK
      ?auto_205970 - BLOCK
      ?auto_205971 - BLOCK
      ?auto_205972 - BLOCK
      ?auto_205973 - BLOCK
      ?auto_205974 - BLOCK
    )
    :vars
    (
      ?auto_205975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205974 ?auto_205975 ) ( ON-TABLE ?auto_205968 ) ( ON ?auto_205969 ?auto_205968 ) ( ON ?auto_205970 ?auto_205969 ) ( ON ?auto_205971 ?auto_205970 ) ( not ( = ?auto_205968 ?auto_205969 ) ) ( not ( = ?auto_205968 ?auto_205970 ) ) ( not ( = ?auto_205968 ?auto_205971 ) ) ( not ( = ?auto_205968 ?auto_205972 ) ) ( not ( = ?auto_205968 ?auto_205973 ) ) ( not ( = ?auto_205968 ?auto_205974 ) ) ( not ( = ?auto_205968 ?auto_205975 ) ) ( not ( = ?auto_205969 ?auto_205970 ) ) ( not ( = ?auto_205969 ?auto_205971 ) ) ( not ( = ?auto_205969 ?auto_205972 ) ) ( not ( = ?auto_205969 ?auto_205973 ) ) ( not ( = ?auto_205969 ?auto_205974 ) ) ( not ( = ?auto_205969 ?auto_205975 ) ) ( not ( = ?auto_205970 ?auto_205971 ) ) ( not ( = ?auto_205970 ?auto_205972 ) ) ( not ( = ?auto_205970 ?auto_205973 ) ) ( not ( = ?auto_205970 ?auto_205974 ) ) ( not ( = ?auto_205970 ?auto_205975 ) ) ( not ( = ?auto_205971 ?auto_205972 ) ) ( not ( = ?auto_205971 ?auto_205973 ) ) ( not ( = ?auto_205971 ?auto_205974 ) ) ( not ( = ?auto_205971 ?auto_205975 ) ) ( not ( = ?auto_205972 ?auto_205973 ) ) ( not ( = ?auto_205972 ?auto_205974 ) ) ( not ( = ?auto_205972 ?auto_205975 ) ) ( not ( = ?auto_205973 ?auto_205974 ) ) ( not ( = ?auto_205973 ?auto_205975 ) ) ( not ( = ?auto_205974 ?auto_205975 ) ) ( ON ?auto_205973 ?auto_205974 ) ( CLEAR ?auto_205971 ) ( ON ?auto_205972 ?auto_205973 ) ( CLEAR ?auto_205972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_205968 ?auto_205969 ?auto_205970 ?auto_205971 ?auto_205972 )
      ( MAKE-7PILE ?auto_205968 ?auto_205969 ?auto_205970 ?auto_205971 ?auto_205972 ?auto_205973 ?auto_205974 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205983 - BLOCK
      ?auto_205984 - BLOCK
      ?auto_205985 - BLOCK
      ?auto_205986 - BLOCK
      ?auto_205987 - BLOCK
      ?auto_205988 - BLOCK
      ?auto_205989 - BLOCK
    )
    :vars
    (
      ?auto_205990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_205989 ?auto_205990 ) ( ON-TABLE ?auto_205983 ) ( ON ?auto_205984 ?auto_205983 ) ( ON ?auto_205985 ?auto_205984 ) ( not ( = ?auto_205983 ?auto_205984 ) ) ( not ( = ?auto_205983 ?auto_205985 ) ) ( not ( = ?auto_205983 ?auto_205986 ) ) ( not ( = ?auto_205983 ?auto_205987 ) ) ( not ( = ?auto_205983 ?auto_205988 ) ) ( not ( = ?auto_205983 ?auto_205989 ) ) ( not ( = ?auto_205983 ?auto_205990 ) ) ( not ( = ?auto_205984 ?auto_205985 ) ) ( not ( = ?auto_205984 ?auto_205986 ) ) ( not ( = ?auto_205984 ?auto_205987 ) ) ( not ( = ?auto_205984 ?auto_205988 ) ) ( not ( = ?auto_205984 ?auto_205989 ) ) ( not ( = ?auto_205984 ?auto_205990 ) ) ( not ( = ?auto_205985 ?auto_205986 ) ) ( not ( = ?auto_205985 ?auto_205987 ) ) ( not ( = ?auto_205985 ?auto_205988 ) ) ( not ( = ?auto_205985 ?auto_205989 ) ) ( not ( = ?auto_205985 ?auto_205990 ) ) ( not ( = ?auto_205986 ?auto_205987 ) ) ( not ( = ?auto_205986 ?auto_205988 ) ) ( not ( = ?auto_205986 ?auto_205989 ) ) ( not ( = ?auto_205986 ?auto_205990 ) ) ( not ( = ?auto_205987 ?auto_205988 ) ) ( not ( = ?auto_205987 ?auto_205989 ) ) ( not ( = ?auto_205987 ?auto_205990 ) ) ( not ( = ?auto_205988 ?auto_205989 ) ) ( not ( = ?auto_205988 ?auto_205990 ) ) ( not ( = ?auto_205989 ?auto_205990 ) ) ( ON ?auto_205988 ?auto_205989 ) ( ON ?auto_205987 ?auto_205988 ) ( CLEAR ?auto_205985 ) ( ON ?auto_205986 ?auto_205987 ) ( CLEAR ?auto_205986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205983 ?auto_205984 ?auto_205985 ?auto_205986 )
      ( MAKE-7PILE ?auto_205983 ?auto_205984 ?auto_205985 ?auto_205986 ?auto_205987 ?auto_205988 ?auto_205989 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_205998 - BLOCK
      ?auto_205999 - BLOCK
      ?auto_206000 - BLOCK
      ?auto_206001 - BLOCK
      ?auto_206002 - BLOCK
      ?auto_206003 - BLOCK
      ?auto_206004 - BLOCK
    )
    :vars
    (
      ?auto_206005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206004 ?auto_206005 ) ( ON-TABLE ?auto_205998 ) ( ON ?auto_205999 ?auto_205998 ) ( ON ?auto_206000 ?auto_205999 ) ( not ( = ?auto_205998 ?auto_205999 ) ) ( not ( = ?auto_205998 ?auto_206000 ) ) ( not ( = ?auto_205998 ?auto_206001 ) ) ( not ( = ?auto_205998 ?auto_206002 ) ) ( not ( = ?auto_205998 ?auto_206003 ) ) ( not ( = ?auto_205998 ?auto_206004 ) ) ( not ( = ?auto_205998 ?auto_206005 ) ) ( not ( = ?auto_205999 ?auto_206000 ) ) ( not ( = ?auto_205999 ?auto_206001 ) ) ( not ( = ?auto_205999 ?auto_206002 ) ) ( not ( = ?auto_205999 ?auto_206003 ) ) ( not ( = ?auto_205999 ?auto_206004 ) ) ( not ( = ?auto_205999 ?auto_206005 ) ) ( not ( = ?auto_206000 ?auto_206001 ) ) ( not ( = ?auto_206000 ?auto_206002 ) ) ( not ( = ?auto_206000 ?auto_206003 ) ) ( not ( = ?auto_206000 ?auto_206004 ) ) ( not ( = ?auto_206000 ?auto_206005 ) ) ( not ( = ?auto_206001 ?auto_206002 ) ) ( not ( = ?auto_206001 ?auto_206003 ) ) ( not ( = ?auto_206001 ?auto_206004 ) ) ( not ( = ?auto_206001 ?auto_206005 ) ) ( not ( = ?auto_206002 ?auto_206003 ) ) ( not ( = ?auto_206002 ?auto_206004 ) ) ( not ( = ?auto_206002 ?auto_206005 ) ) ( not ( = ?auto_206003 ?auto_206004 ) ) ( not ( = ?auto_206003 ?auto_206005 ) ) ( not ( = ?auto_206004 ?auto_206005 ) ) ( ON ?auto_206003 ?auto_206004 ) ( ON ?auto_206002 ?auto_206003 ) ( CLEAR ?auto_206000 ) ( ON ?auto_206001 ?auto_206002 ) ( CLEAR ?auto_206001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_205998 ?auto_205999 ?auto_206000 ?auto_206001 )
      ( MAKE-7PILE ?auto_205998 ?auto_205999 ?auto_206000 ?auto_206001 ?auto_206002 ?auto_206003 ?auto_206004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206013 - BLOCK
      ?auto_206014 - BLOCK
      ?auto_206015 - BLOCK
      ?auto_206016 - BLOCK
      ?auto_206017 - BLOCK
      ?auto_206018 - BLOCK
      ?auto_206019 - BLOCK
    )
    :vars
    (
      ?auto_206020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206019 ?auto_206020 ) ( ON-TABLE ?auto_206013 ) ( ON ?auto_206014 ?auto_206013 ) ( not ( = ?auto_206013 ?auto_206014 ) ) ( not ( = ?auto_206013 ?auto_206015 ) ) ( not ( = ?auto_206013 ?auto_206016 ) ) ( not ( = ?auto_206013 ?auto_206017 ) ) ( not ( = ?auto_206013 ?auto_206018 ) ) ( not ( = ?auto_206013 ?auto_206019 ) ) ( not ( = ?auto_206013 ?auto_206020 ) ) ( not ( = ?auto_206014 ?auto_206015 ) ) ( not ( = ?auto_206014 ?auto_206016 ) ) ( not ( = ?auto_206014 ?auto_206017 ) ) ( not ( = ?auto_206014 ?auto_206018 ) ) ( not ( = ?auto_206014 ?auto_206019 ) ) ( not ( = ?auto_206014 ?auto_206020 ) ) ( not ( = ?auto_206015 ?auto_206016 ) ) ( not ( = ?auto_206015 ?auto_206017 ) ) ( not ( = ?auto_206015 ?auto_206018 ) ) ( not ( = ?auto_206015 ?auto_206019 ) ) ( not ( = ?auto_206015 ?auto_206020 ) ) ( not ( = ?auto_206016 ?auto_206017 ) ) ( not ( = ?auto_206016 ?auto_206018 ) ) ( not ( = ?auto_206016 ?auto_206019 ) ) ( not ( = ?auto_206016 ?auto_206020 ) ) ( not ( = ?auto_206017 ?auto_206018 ) ) ( not ( = ?auto_206017 ?auto_206019 ) ) ( not ( = ?auto_206017 ?auto_206020 ) ) ( not ( = ?auto_206018 ?auto_206019 ) ) ( not ( = ?auto_206018 ?auto_206020 ) ) ( not ( = ?auto_206019 ?auto_206020 ) ) ( ON ?auto_206018 ?auto_206019 ) ( ON ?auto_206017 ?auto_206018 ) ( ON ?auto_206016 ?auto_206017 ) ( CLEAR ?auto_206014 ) ( ON ?auto_206015 ?auto_206016 ) ( CLEAR ?auto_206015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206013 ?auto_206014 ?auto_206015 )
      ( MAKE-7PILE ?auto_206013 ?auto_206014 ?auto_206015 ?auto_206016 ?auto_206017 ?auto_206018 ?auto_206019 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206028 - BLOCK
      ?auto_206029 - BLOCK
      ?auto_206030 - BLOCK
      ?auto_206031 - BLOCK
      ?auto_206032 - BLOCK
      ?auto_206033 - BLOCK
      ?auto_206034 - BLOCK
    )
    :vars
    (
      ?auto_206035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206034 ?auto_206035 ) ( ON-TABLE ?auto_206028 ) ( ON ?auto_206029 ?auto_206028 ) ( not ( = ?auto_206028 ?auto_206029 ) ) ( not ( = ?auto_206028 ?auto_206030 ) ) ( not ( = ?auto_206028 ?auto_206031 ) ) ( not ( = ?auto_206028 ?auto_206032 ) ) ( not ( = ?auto_206028 ?auto_206033 ) ) ( not ( = ?auto_206028 ?auto_206034 ) ) ( not ( = ?auto_206028 ?auto_206035 ) ) ( not ( = ?auto_206029 ?auto_206030 ) ) ( not ( = ?auto_206029 ?auto_206031 ) ) ( not ( = ?auto_206029 ?auto_206032 ) ) ( not ( = ?auto_206029 ?auto_206033 ) ) ( not ( = ?auto_206029 ?auto_206034 ) ) ( not ( = ?auto_206029 ?auto_206035 ) ) ( not ( = ?auto_206030 ?auto_206031 ) ) ( not ( = ?auto_206030 ?auto_206032 ) ) ( not ( = ?auto_206030 ?auto_206033 ) ) ( not ( = ?auto_206030 ?auto_206034 ) ) ( not ( = ?auto_206030 ?auto_206035 ) ) ( not ( = ?auto_206031 ?auto_206032 ) ) ( not ( = ?auto_206031 ?auto_206033 ) ) ( not ( = ?auto_206031 ?auto_206034 ) ) ( not ( = ?auto_206031 ?auto_206035 ) ) ( not ( = ?auto_206032 ?auto_206033 ) ) ( not ( = ?auto_206032 ?auto_206034 ) ) ( not ( = ?auto_206032 ?auto_206035 ) ) ( not ( = ?auto_206033 ?auto_206034 ) ) ( not ( = ?auto_206033 ?auto_206035 ) ) ( not ( = ?auto_206034 ?auto_206035 ) ) ( ON ?auto_206033 ?auto_206034 ) ( ON ?auto_206032 ?auto_206033 ) ( ON ?auto_206031 ?auto_206032 ) ( CLEAR ?auto_206029 ) ( ON ?auto_206030 ?auto_206031 ) ( CLEAR ?auto_206030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206028 ?auto_206029 ?auto_206030 )
      ( MAKE-7PILE ?auto_206028 ?auto_206029 ?auto_206030 ?auto_206031 ?auto_206032 ?auto_206033 ?auto_206034 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206043 - BLOCK
      ?auto_206044 - BLOCK
      ?auto_206045 - BLOCK
      ?auto_206046 - BLOCK
      ?auto_206047 - BLOCK
      ?auto_206048 - BLOCK
      ?auto_206049 - BLOCK
    )
    :vars
    (
      ?auto_206050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206049 ?auto_206050 ) ( ON-TABLE ?auto_206043 ) ( not ( = ?auto_206043 ?auto_206044 ) ) ( not ( = ?auto_206043 ?auto_206045 ) ) ( not ( = ?auto_206043 ?auto_206046 ) ) ( not ( = ?auto_206043 ?auto_206047 ) ) ( not ( = ?auto_206043 ?auto_206048 ) ) ( not ( = ?auto_206043 ?auto_206049 ) ) ( not ( = ?auto_206043 ?auto_206050 ) ) ( not ( = ?auto_206044 ?auto_206045 ) ) ( not ( = ?auto_206044 ?auto_206046 ) ) ( not ( = ?auto_206044 ?auto_206047 ) ) ( not ( = ?auto_206044 ?auto_206048 ) ) ( not ( = ?auto_206044 ?auto_206049 ) ) ( not ( = ?auto_206044 ?auto_206050 ) ) ( not ( = ?auto_206045 ?auto_206046 ) ) ( not ( = ?auto_206045 ?auto_206047 ) ) ( not ( = ?auto_206045 ?auto_206048 ) ) ( not ( = ?auto_206045 ?auto_206049 ) ) ( not ( = ?auto_206045 ?auto_206050 ) ) ( not ( = ?auto_206046 ?auto_206047 ) ) ( not ( = ?auto_206046 ?auto_206048 ) ) ( not ( = ?auto_206046 ?auto_206049 ) ) ( not ( = ?auto_206046 ?auto_206050 ) ) ( not ( = ?auto_206047 ?auto_206048 ) ) ( not ( = ?auto_206047 ?auto_206049 ) ) ( not ( = ?auto_206047 ?auto_206050 ) ) ( not ( = ?auto_206048 ?auto_206049 ) ) ( not ( = ?auto_206048 ?auto_206050 ) ) ( not ( = ?auto_206049 ?auto_206050 ) ) ( ON ?auto_206048 ?auto_206049 ) ( ON ?auto_206047 ?auto_206048 ) ( ON ?auto_206046 ?auto_206047 ) ( ON ?auto_206045 ?auto_206046 ) ( CLEAR ?auto_206043 ) ( ON ?auto_206044 ?auto_206045 ) ( CLEAR ?auto_206044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206043 ?auto_206044 )
      ( MAKE-7PILE ?auto_206043 ?auto_206044 ?auto_206045 ?auto_206046 ?auto_206047 ?auto_206048 ?auto_206049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206058 - BLOCK
      ?auto_206059 - BLOCK
      ?auto_206060 - BLOCK
      ?auto_206061 - BLOCK
      ?auto_206062 - BLOCK
      ?auto_206063 - BLOCK
      ?auto_206064 - BLOCK
    )
    :vars
    (
      ?auto_206065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206064 ?auto_206065 ) ( ON-TABLE ?auto_206058 ) ( not ( = ?auto_206058 ?auto_206059 ) ) ( not ( = ?auto_206058 ?auto_206060 ) ) ( not ( = ?auto_206058 ?auto_206061 ) ) ( not ( = ?auto_206058 ?auto_206062 ) ) ( not ( = ?auto_206058 ?auto_206063 ) ) ( not ( = ?auto_206058 ?auto_206064 ) ) ( not ( = ?auto_206058 ?auto_206065 ) ) ( not ( = ?auto_206059 ?auto_206060 ) ) ( not ( = ?auto_206059 ?auto_206061 ) ) ( not ( = ?auto_206059 ?auto_206062 ) ) ( not ( = ?auto_206059 ?auto_206063 ) ) ( not ( = ?auto_206059 ?auto_206064 ) ) ( not ( = ?auto_206059 ?auto_206065 ) ) ( not ( = ?auto_206060 ?auto_206061 ) ) ( not ( = ?auto_206060 ?auto_206062 ) ) ( not ( = ?auto_206060 ?auto_206063 ) ) ( not ( = ?auto_206060 ?auto_206064 ) ) ( not ( = ?auto_206060 ?auto_206065 ) ) ( not ( = ?auto_206061 ?auto_206062 ) ) ( not ( = ?auto_206061 ?auto_206063 ) ) ( not ( = ?auto_206061 ?auto_206064 ) ) ( not ( = ?auto_206061 ?auto_206065 ) ) ( not ( = ?auto_206062 ?auto_206063 ) ) ( not ( = ?auto_206062 ?auto_206064 ) ) ( not ( = ?auto_206062 ?auto_206065 ) ) ( not ( = ?auto_206063 ?auto_206064 ) ) ( not ( = ?auto_206063 ?auto_206065 ) ) ( not ( = ?auto_206064 ?auto_206065 ) ) ( ON ?auto_206063 ?auto_206064 ) ( ON ?auto_206062 ?auto_206063 ) ( ON ?auto_206061 ?auto_206062 ) ( ON ?auto_206060 ?auto_206061 ) ( CLEAR ?auto_206058 ) ( ON ?auto_206059 ?auto_206060 ) ( CLEAR ?auto_206059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206058 ?auto_206059 )
      ( MAKE-7PILE ?auto_206058 ?auto_206059 ?auto_206060 ?auto_206061 ?auto_206062 ?auto_206063 ?auto_206064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206073 - BLOCK
      ?auto_206074 - BLOCK
      ?auto_206075 - BLOCK
      ?auto_206076 - BLOCK
      ?auto_206077 - BLOCK
      ?auto_206078 - BLOCK
      ?auto_206079 - BLOCK
    )
    :vars
    (
      ?auto_206080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206079 ?auto_206080 ) ( not ( = ?auto_206073 ?auto_206074 ) ) ( not ( = ?auto_206073 ?auto_206075 ) ) ( not ( = ?auto_206073 ?auto_206076 ) ) ( not ( = ?auto_206073 ?auto_206077 ) ) ( not ( = ?auto_206073 ?auto_206078 ) ) ( not ( = ?auto_206073 ?auto_206079 ) ) ( not ( = ?auto_206073 ?auto_206080 ) ) ( not ( = ?auto_206074 ?auto_206075 ) ) ( not ( = ?auto_206074 ?auto_206076 ) ) ( not ( = ?auto_206074 ?auto_206077 ) ) ( not ( = ?auto_206074 ?auto_206078 ) ) ( not ( = ?auto_206074 ?auto_206079 ) ) ( not ( = ?auto_206074 ?auto_206080 ) ) ( not ( = ?auto_206075 ?auto_206076 ) ) ( not ( = ?auto_206075 ?auto_206077 ) ) ( not ( = ?auto_206075 ?auto_206078 ) ) ( not ( = ?auto_206075 ?auto_206079 ) ) ( not ( = ?auto_206075 ?auto_206080 ) ) ( not ( = ?auto_206076 ?auto_206077 ) ) ( not ( = ?auto_206076 ?auto_206078 ) ) ( not ( = ?auto_206076 ?auto_206079 ) ) ( not ( = ?auto_206076 ?auto_206080 ) ) ( not ( = ?auto_206077 ?auto_206078 ) ) ( not ( = ?auto_206077 ?auto_206079 ) ) ( not ( = ?auto_206077 ?auto_206080 ) ) ( not ( = ?auto_206078 ?auto_206079 ) ) ( not ( = ?auto_206078 ?auto_206080 ) ) ( not ( = ?auto_206079 ?auto_206080 ) ) ( ON ?auto_206078 ?auto_206079 ) ( ON ?auto_206077 ?auto_206078 ) ( ON ?auto_206076 ?auto_206077 ) ( ON ?auto_206075 ?auto_206076 ) ( ON ?auto_206074 ?auto_206075 ) ( ON ?auto_206073 ?auto_206074 ) ( CLEAR ?auto_206073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206073 )
      ( MAKE-7PILE ?auto_206073 ?auto_206074 ?auto_206075 ?auto_206076 ?auto_206077 ?auto_206078 ?auto_206079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_206088 - BLOCK
      ?auto_206089 - BLOCK
      ?auto_206090 - BLOCK
      ?auto_206091 - BLOCK
      ?auto_206092 - BLOCK
      ?auto_206093 - BLOCK
      ?auto_206094 - BLOCK
    )
    :vars
    (
      ?auto_206095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206094 ?auto_206095 ) ( not ( = ?auto_206088 ?auto_206089 ) ) ( not ( = ?auto_206088 ?auto_206090 ) ) ( not ( = ?auto_206088 ?auto_206091 ) ) ( not ( = ?auto_206088 ?auto_206092 ) ) ( not ( = ?auto_206088 ?auto_206093 ) ) ( not ( = ?auto_206088 ?auto_206094 ) ) ( not ( = ?auto_206088 ?auto_206095 ) ) ( not ( = ?auto_206089 ?auto_206090 ) ) ( not ( = ?auto_206089 ?auto_206091 ) ) ( not ( = ?auto_206089 ?auto_206092 ) ) ( not ( = ?auto_206089 ?auto_206093 ) ) ( not ( = ?auto_206089 ?auto_206094 ) ) ( not ( = ?auto_206089 ?auto_206095 ) ) ( not ( = ?auto_206090 ?auto_206091 ) ) ( not ( = ?auto_206090 ?auto_206092 ) ) ( not ( = ?auto_206090 ?auto_206093 ) ) ( not ( = ?auto_206090 ?auto_206094 ) ) ( not ( = ?auto_206090 ?auto_206095 ) ) ( not ( = ?auto_206091 ?auto_206092 ) ) ( not ( = ?auto_206091 ?auto_206093 ) ) ( not ( = ?auto_206091 ?auto_206094 ) ) ( not ( = ?auto_206091 ?auto_206095 ) ) ( not ( = ?auto_206092 ?auto_206093 ) ) ( not ( = ?auto_206092 ?auto_206094 ) ) ( not ( = ?auto_206092 ?auto_206095 ) ) ( not ( = ?auto_206093 ?auto_206094 ) ) ( not ( = ?auto_206093 ?auto_206095 ) ) ( not ( = ?auto_206094 ?auto_206095 ) ) ( ON ?auto_206093 ?auto_206094 ) ( ON ?auto_206092 ?auto_206093 ) ( ON ?auto_206091 ?auto_206092 ) ( ON ?auto_206090 ?auto_206091 ) ( ON ?auto_206089 ?auto_206090 ) ( ON ?auto_206088 ?auto_206089 ) ( CLEAR ?auto_206088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206088 )
      ( MAKE-7PILE ?auto_206088 ?auto_206089 ?auto_206090 ?auto_206091 ?auto_206092 ?auto_206093 ?auto_206094 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206104 - BLOCK
      ?auto_206105 - BLOCK
      ?auto_206106 - BLOCK
      ?auto_206107 - BLOCK
      ?auto_206108 - BLOCK
      ?auto_206109 - BLOCK
      ?auto_206110 - BLOCK
      ?auto_206111 - BLOCK
    )
    :vars
    (
      ?auto_206112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206110 ) ( ON ?auto_206111 ?auto_206112 ) ( CLEAR ?auto_206111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206104 ) ( ON ?auto_206105 ?auto_206104 ) ( ON ?auto_206106 ?auto_206105 ) ( ON ?auto_206107 ?auto_206106 ) ( ON ?auto_206108 ?auto_206107 ) ( ON ?auto_206109 ?auto_206108 ) ( ON ?auto_206110 ?auto_206109 ) ( not ( = ?auto_206104 ?auto_206105 ) ) ( not ( = ?auto_206104 ?auto_206106 ) ) ( not ( = ?auto_206104 ?auto_206107 ) ) ( not ( = ?auto_206104 ?auto_206108 ) ) ( not ( = ?auto_206104 ?auto_206109 ) ) ( not ( = ?auto_206104 ?auto_206110 ) ) ( not ( = ?auto_206104 ?auto_206111 ) ) ( not ( = ?auto_206104 ?auto_206112 ) ) ( not ( = ?auto_206105 ?auto_206106 ) ) ( not ( = ?auto_206105 ?auto_206107 ) ) ( not ( = ?auto_206105 ?auto_206108 ) ) ( not ( = ?auto_206105 ?auto_206109 ) ) ( not ( = ?auto_206105 ?auto_206110 ) ) ( not ( = ?auto_206105 ?auto_206111 ) ) ( not ( = ?auto_206105 ?auto_206112 ) ) ( not ( = ?auto_206106 ?auto_206107 ) ) ( not ( = ?auto_206106 ?auto_206108 ) ) ( not ( = ?auto_206106 ?auto_206109 ) ) ( not ( = ?auto_206106 ?auto_206110 ) ) ( not ( = ?auto_206106 ?auto_206111 ) ) ( not ( = ?auto_206106 ?auto_206112 ) ) ( not ( = ?auto_206107 ?auto_206108 ) ) ( not ( = ?auto_206107 ?auto_206109 ) ) ( not ( = ?auto_206107 ?auto_206110 ) ) ( not ( = ?auto_206107 ?auto_206111 ) ) ( not ( = ?auto_206107 ?auto_206112 ) ) ( not ( = ?auto_206108 ?auto_206109 ) ) ( not ( = ?auto_206108 ?auto_206110 ) ) ( not ( = ?auto_206108 ?auto_206111 ) ) ( not ( = ?auto_206108 ?auto_206112 ) ) ( not ( = ?auto_206109 ?auto_206110 ) ) ( not ( = ?auto_206109 ?auto_206111 ) ) ( not ( = ?auto_206109 ?auto_206112 ) ) ( not ( = ?auto_206110 ?auto_206111 ) ) ( not ( = ?auto_206110 ?auto_206112 ) ) ( not ( = ?auto_206111 ?auto_206112 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206111 ?auto_206112 )
      ( !STACK ?auto_206111 ?auto_206110 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206121 - BLOCK
      ?auto_206122 - BLOCK
      ?auto_206123 - BLOCK
      ?auto_206124 - BLOCK
      ?auto_206125 - BLOCK
      ?auto_206126 - BLOCK
      ?auto_206127 - BLOCK
      ?auto_206128 - BLOCK
    )
    :vars
    (
      ?auto_206129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206127 ) ( ON ?auto_206128 ?auto_206129 ) ( CLEAR ?auto_206128 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206121 ) ( ON ?auto_206122 ?auto_206121 ) ( ON ?auto_206123 ?auto_206122 ) ( ON ?auto_206124 ?auto_206123 ) ( ON ?auto_206125 ?auto_206124 ) ( ON ?auto_206126 ?auto_206125 ) ( ON ?auto_206127 ?auto_206126 ) ( not ( = ?auto_206121 ?auto_206122 ) ) ( not ( = ?auto_206121 ?auto_206123 ) ) ( not ( = ?auto_206121 ?auto_206124 ) ) ( not ( = ?auto_206121 ?auto_206125 ) ) ( not ( = ?auto_206121 ?auto_206126 ) ) ( not ( = ?auto_206121 ?auto_206127 ) ) ( not ( = ?auto_206121 ?auto_206128 ) ) ( not ( = ?auto_206121 ?auto_206129 ) ) ( not ( = ?auto_206122 ?auto_206123 ) ) ( not ( = ?auto_206122 ?auto_206124 ) ) ( not ( = ?auto_206122 ?auto_206125 ) ) ( not ( = ?auto_206122 ?auto_206126 ) ) ( not ( = ?auto_206122 ?auto_206127 ) ) ( not ( = ?auto_206122 ?auto_206128 ) ) ( not ( = ?auto_206122 ?auto_206129 ) ) ( not ( = ?auto_206123 ?auto_206124 ) ) ( not ( = ?auto_206123 ?auto_206125 ) ) ( not ( = ?auto_206123 ?auto_206126 ) ) ( not ( = ?auto_206123 ?auto_206127 ) ) ( not ( = ?auto_206123 ?auto_206128 ) ) ( not ( = ?auto_206123 ?auto_206129 ) ) ( not ( = ?auto_206124 ?auto_206125 ) ) ( not ( = ?auto_206124 ?auto_206126 ) ) ( not ( = ?auto_206124 ?auto_206127 ) ) ( not ( = ?auto_206124 ?auto_206128 ) ) ( not ( = ?auto_206124 ?auto_206129 ) ) ( not ( = ?auto_206125 ?auto_206126 ) ) ( not ( = ?auto_206125 ?auto_206127 ) ) ( not ( = ?auto_206125 ?auto_206128 ) ) ( not ( = ?auto_206125 ?auto_206129 ) ) ( not ( = ?auto_206126 ?auto_206127 ) ) ( not ( = ?auto_206126 ?auto_206128 ) ) ( not ( = ?auto_206126 ?auto_206129 ) ) ( not ( = ?auto_206127 ?auto_206128 ) ) ( not ( = ?auto_206127 ?auto_206129 ) ) ( not ( = ?auto_206128 ?auto_206129 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206128 ?auto_206129 )
      ( !STACK ?auto_206128 ?auto_206127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206138 - BLOCK
      ?auto_206139 - BLOCK
      ?auto_206140 - BLOCK
      ?auto_206141 - BLOCK
      ?auto_206142 - BLOCK
      ?auto_206143 - BLOCK
      ?auto_206144 - BLOCK
      ?auto_206145 - BLOCK
    )
    :vars
    (
      ?auto_206146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206145 ?auto_206146 ) ( ON-TABLE ?auto_206138 ) ( ON ?auto_206139 ?auto_206138 ) ( ON ?auto_206140 ?auto_206139 ) ( ON ?auto_206141 ?auto_206140 ) ( ON ?auto_206142 ?auto_206141 ) ( ON ?auto_206143 ?auto_206142 ) ( not ( = ?auto_206138 ?auto_206139 ) ) ( not ( = ?auto_206138 ?auto_206140 ) ) ( not ( = ?auto_206138 ?auto_206141 ) ) ( not ( = ?auto_206138 ?auto_206142 ) ) ( not ( = ?auto_206138 ?auto_206143 ) ) ( not ( = ?auto_206138 ?auto_206144 ) ) ( not ( = ?auto_206138 ?auto_206145 ) ) ( not ( = ?auto_206138 ?auto_206146 ) ) ( not ( = ?auto_206139 ?auto_206140 ) ) ( not ( = ?auto_206139 ?auto_206141 ) ) ( not ( = ?auto_206139 ?auto_206142 ) ) ( not ( = ?auto_206139 ?auto_206143 ) ) ( not ( = ?auto_206139 ?auto_206144 ) ) ( not ( = ?auto_206139 ?auto_206145 ) ) ( not ( = ?auto_206139 ?auto_206146 ) ) ( not ( = ?auto_206140 ?auto_206141 ) ) ( not ( = ?auto_206140 ?auto_206142 ) ) ( not ( = ?auto_206140 ?auto_206143 ) ) ( not ( = ?auto_206140 ?auto_206144 ) ) ( not ( = ?auto_206140 ?auto_206145 ) ) ( not ( = ?auto_206140 ?auto_206146 ) ) ( not ( = ?auto_206141 ?auto_206142 ) ) ( not ( = ?auto_206141 ?auto_206143 ) ) ( not ( = ?auto_206141 ?auto_206144 ) ) ( not ( = ?auto_206141 ?auto_206145 ) ) ( not ( = ?auto_206141 ?auto_206146 ) ) ( not ( = ?auto_206142 ?auto_206143 ) ) ( not ( = ?auto_206142 ?auto_206144 ) ) ( not ( = ?auto_206142 ?auto_206145 ) ) ( not ( = ?auto_206142 ?auto_206146 ) ) ( not ( = ?auto_206143 ?auto_206144 ) ) ( not ( = ?auto_206143 ?auto_206145 ) ) ( not ( = ?auto_206143 ?auto_206146 ) ) ( not ( = ?auto_206144 ?auto_206145 ) ) ( not ( = ?auto_206144 ?auto_206146 ) ) ( not ( = ?auto_206145 ?auto_206146 ) ) ( CLEAR ?auto_206143 ) ( ON ?auto_206144 ?auto_206145 ) ( CLEAR ?auto_206144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206138 ?auto_206139 ?auto_206140 ?auto_206141 ?auto_206142 ?auto_206143 ?auto_206144 )
      ( MAKE-8PILE ?auto_206138 ?auto_206139 ?auto_206140 ?auto_206141 ?auto_206142 ?auto_206143 ?auto_206144 ?auto_206145 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206155 - BLOCK
      ?auto_206156 - BLOCK
      ?auto_206157 - BLOCK
      ?auto_206158 - BLOCK
      ?auto_206159 - BLOCK
      ?auto_206160 - BLOCK
      ?auto_206161 - BLOCK
      ?auto_206162 - BLOCK
    )
    :vars
    (
      ?auto_206163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206162 ?auto_206163 ) ( ON-TABLE ?auto_206155 ) ( ON ?auto_206156 ?auto_206155 ) ( ON ?auto_206157 ?auto_206156 ) ( ON ?auto_206158 ?auto_206157 ) ( ON ?auto_206159 ?auto_206158 ) ( ON ?auto_206160 ?auto_206159 ) ( not ( = ?auto_206155 ?auto_206156 ) ) ( not ( = ?auto_206155 ?auto_206157 ) ) ( not ( = ?auto_206155 ?auto_206158 ) ) ( not ( = ?auto_206155 ?auto_206159 ) ) ( not ( = ?auto_206155 ?auto_206160 ) ) ( not ( = ?auto_206155 ?auto_206161 ) ) ( not ( = ?auto_206155 ?auto_206162 ) ) ( not ( = ?auto_206155 ?auto_206163 ) ) ( not ( = ?auto_206156 ?auto_206157 ) ) ( not ( = ?auto_206156 ?auto_206158 ) ) ( not ( = ?auto_206156 ?auto_206159 ) ) ( not ( = ?auto_206156 ?auto_206160 ) ) ( not ( = ?auto_206156 ?auto_206161 ) ) ( not ( = ?auto_206156 ?auto_206162 ) ) ( not ( = ?auto_206156 ?auto_206163 ) ) ( not ( = ?auto_206157 ?auto_206158 ) ) ( not ( = ?auto_206157 ?auto_206159 ) ) ( not ( = ?auto_206157 ?auto_206160 ) ) ( not ( = ?auto_206157 ?auto_206161 ) ) ( not ( = ?auto_206157 ?auto_206162 ) ) ( not ( = ?auto_206157 ?auto_206163 ) ) ( not ( = ?auto_206158 ?auto_206159 ) ) ( not ( = ?auto_206158 ?auto_206160 ) ) ( not ( = ?auto_206158 ?auto_206161 ) ) ( not ( = ?auto_206158 ?auto_206162 ) ) ( not ( = ?auto_206158 ?auto_206163 ) ) ( not ( = ?auto_206159 ?auto_206160 ) ) ( not ( = ?auto_206159 ?auto_206161 ) ) ( not ( = ?auto_206159 ?auto_206162 ) ) ( not ( = ?auto_206159 ?auto_206163 ) ) ( not ( = ?auto_206160 ?auto_206161 ) ) ( not ( = ?auto_206160 ?auto_206162 ) ) ( not ( = ?auto_206160 ?auto_206163 ) ) ( not ( = ?auto_206161 ?auto_206162 ) ) ( not ( = ?auto_206161 ?auto_206163 ) ) ( not ( = ?auto_206162 ?auto_206163 ) ) ( CLEAR ?auto_206160 ) ( ON ?auto_206161 ?auto_206162 ) ( CLEAR ?auto_206161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206155 ?auto_206156 ?auto_206157 ?auto_206158 ?auto_206159 ?auto_206160 ?auto_206161 )
      ( MAKE-8PILE ?auto_206155 ?auto_206156 ?auto_206157 ?auto_206158 ?auto_206159 ?auto_206160 ?auto_206161 ?auto_206162 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206172 - BLOCK
      ?auto_206173 - BLOCK
      ?auto_206174 - BLOCK
      ?auto_206175 - BLOCK
      ?auto_206176 - BLOCK
      ?auto_206177 - BLOCK
      ?auto_206178 - BLOCK
      ?auto_206179 - BLOCK
    )
    :vars
    (
      ?auto_206180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206179 ?auto_206180 ) ( ON-TABLE ?auto_206172 ) ( ON ?auto_206173 ?auto_206172 ) ( ON ?auto_206174 ?auto_206173 ) ( ON ?auto_206175 ?auto_206174 ) ( ON ?auto_206176 ?auto_206175 ) ( not ( = ?auto_206172 ?auto_206173 ) ) ( not ( = ?auto_206172 ?auto_206174 ) ) ( not ( = ?auto_206172 ?auto_206175 ) ) ( not ( = ?auto_206172 ?auto_206176 ) ) ( not ( = ?auto_206172 ?auto_206177 ) ) ( not ( = ?auto_206172 ?auto_206178 ) ) ( not ( = ?auto_206172 ?auto_206179 ) ) ( not ( = ?auto_206172 ?auto_206180 ) ) ( not ( = ?auto_206173 ?auto_206174 ) ) ( not ( = ?auto_206173 ?auto_206175 ) ) ( not ( = ?auto_206173 ?auto_206176 ) ) ( not ( = ?auto_206173 ?auto_206177 ) ) ( not ( = ?auto_206173 ?auto_206178 ) ) ( not ( = ?auto_206173 ?auto_206179 ) ) ( not ( = ?auto_206173 ?auto_206180 ) ) ( not ( = ?auto_206174 ?auto_206175 ) ) ( not ( = ?auto_206174 ?auto_206176 ) ) ( not ( = ?auto_206174 ?auto_206177 ) ) ( not ( = ?auto_206174 ?auto_206178 ) ) ( not ( = ?auto_206174 ?auto_206179 ) ) ( not ( = ?auto_206174 ?auto_206180 ) ) ( not ( = ?auto_206175 ?auto_206176 ) ) ( not ( = ?auto_206175 ?auto_206177 ) ) ( not ( = ?auto_206175 ?auto_206178 ) ) ( not ( = ?auto_206175 ?auto_206179 ) ) ( not ( = ?auto_206175 ?auto_206180 ) ) ( not ( = ?auto_206176 ?auto_206177 ) ) ( not ( = ?auto_206176 ?auto_206178 ) ) ( not ( = ?auto_206176 ?auto_206179 ) ) ( not ( = ?auto_206176 ?auto_206180 ) ) ( not ( = ?auto_206177 ?auto_206178 ) ) ( not ( = ?auto_206177 ?auto_206179 ) ) ( not ( = ?auto_206177 ?auto_206180 ) ) ( not ( = ?auto_206178 ?auto_206179 ) ) ( not ( = ?auto_206178 ?auto_206180 ) ) ( not ( = ?auto_206179 ?auto_206180 ) ) ( ON ?auto_206178 ?auto_206179 ) ( CLEAR ?auto_206176 ) ( ON ?auto_206177 ?auto_206178 ) ( CLEAR ?auto_206177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206172 ?auto_206173 ?auto_206174 ?auto_206175 ?auto_206176 ?auto_206177 )
      ( MAKE-8PILE ?auto_206172 ?auto_206173 ?auto_206174 ?auto_206175 ?auto_206176 ?auto_206177 ?auto_206178 ?auto_206179 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206189 - BLOCK
      ?auto_206190 - BLOCK
      ?auto_206191 - BLOCK
      ?auto_206192 - BLOCK
      ?auto_206193 - BLOCK
      ?auto_206194 - BLOCK
      ?auto_206195 - BLOCK
      ?auto_206196 - BLOCK
    )
    :vars
    (
      ?auto_206197 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206196 ?auto_206197 ) ( ON-TABLE ?auto_206189 ) ( ON ?auto_206190 ?auto_206189 ) ( ON ?auto_206191 ?auto_206190 ) ( ON ?auto_206192 ?auto_206191 ) ( ON ?auto_206193 ?auto_206192 ) ( not ( = ?auto_206189 ?auto_206190 ) ) ( not ( = ?auto_206189 ?auto_206191 ) ) ( not ( = ?auto_206189 ?auto_206192 ) ) ( not ( = ?auto_206189 ?auto_206193 ) ) ( not ( = ?auto_206189 ?auto_206194 ) ) ( not ( = ?auto_206189 ?auto_206195 ) ) ( not ( = ?auto_206189 ?auto_206196 ) ) ( not ( = ?auto_206189 ?auto_206197 ) ) ( not ( = ?auto_206190 ?auto_206191 ) ) ( not ( = ?auto_206190 ?auto_206192 ) ) ( not ( = ?auto_206190 ?auto_206193 ) ) ( not ( = ?auto_206190 ?auto_206194 ) ) ( not ( = ?auto_206190 ?auto_206195 ) ) ( not ( = ?auto_206190 ?auto_206196 ) ) ( not ( = ?auto_206190 ?auto_206197 ) ) ( not ( = ?auto_206191 ?auto_206192 ) ) ( not ( = ?auto_206191 ?auto_206193 ) ) ( not ( = ?auto_206191 ?auto_206194 ) ) ( not ( = ?auto_206191 ?auto_206195 ) ) ( not ( = ?auto_206191 ?auto_206196 ) ) ( not ( = ?auto_206191 ?auto_206197 ) ) ( not ( = ?auto_206192 ?auto_206193 ) ) ( not ( = ?auto_206192 ?auto_206194 ) ) ( not ( = ?auto_206192 ?auto_206195 ) ) ( not ( = ?auto_206192 ?auto_206196 ) ) ( not ( = ?auto_206192 ?auto_206197 ) ) ( not ( = ?auto_206193 ?auto_206194 ) ) ( not ( = ?auto_206193 ?auto_206195 ) ) ( not ( = ?auto_206193 ?auto_206196 ) ) ( not ( = ?auto_206193 ?auto_206197 ) ) ( not ( = ?auto_206194 ?auto_206195 ) ) ( not ( = ?auto_206194 ?auto_206196 ) ) ( not ( = ?auto_206194 ?auto_206197 ) ) ( not ( = ?auto_206195 ?auto_206196 ) ) ( not ( = ?auto_206195 ?auto_206197 ) ) ( not ( = ?auto_206196 ?auto_206197 ) ) ( ON ?auto_206195 ?auto_206196 ) ( CLEAR ?auto_206193 ) ( ON ?auto_206194 ?auto_206195 ) ( CLEAR ?auto_206194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206189 ?auto_206190 ?auto_206191 ?auto_206192 ?auto_206193 ?auto_206194 )
      ( MAKE-8PILE ?auto_206189 ?auto_206190 ?auto_206191 ?auto_206192 ?auto_206193 ?auto_206194 ?auto_206195 ?auto_206196 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206206 - BLOCK
      ?auto_206207 - BLOCK
      ?auto_206208 - BLOCK
      ?auto_206209 - BLOCK
      ?auto_206210 - BLOCK
      ?auto_206211 - BLOCK
      ?auto_206212 - BLOCK
      ?auto_206213 - BLOCK
    )
    :vars
    (
      ?auto_206214 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206213 ?auto_206214 ) ( ON-TABLE ?auto_206206 ) ( ON ?auto_206207 ?auto_206206 ) ( ON ?auto_206208 ?auto_206207 ) ( ON ?auto_206209 ?auto_206208 ) ( not ( = ?auto_206206 ?auto_206207 ) ) ( not ( = ?auto_206206 ?auto_206208 ) ) ( not ( = ?auto_206206 ?auto_206209 ) ) ( not ( = ?auto_206206 ?auto_206210 ) ) ( not ( = ?auto_206206 ?auto_206211 ) ) ( not ( = ?auto_206206 ?auto_206212 ) ) ( not ( = ?auto_206206 ?auto_206213 ) ) ( not ( = ?auto_206206 ?auto_206214 ) ) ( not ( = ?auto_206207 ?auto_206208 ) ) ( not ( = ?auto_206207 ?auto_206209 ) ) ( not ( = ?auto_206207 ?auto_206210 ) ) ( not ( = ?auto_206207 ?auto_206211 ) ) ( not ( = ?auto_206207 ?auto_206212 ) ) ( not ( = ?auto_206207 ?auto_206213 ) ) ( not ( = ?auto_206207 ?auto_206214 ) ) ( not ( = ?auto_206208 ?auto_206209 ) ) ( not ( = ?auto_206208 ?auto_206210 ) ) ( not ( = ?auto_206208 ?auto_206211 ) ) ( not ( = ?auto_206208 ?auto_206212 ) ) ( not ( = ?auto_206208 ?auto_206213 ) ) ( not ( = ?auto_206208 ?auto_206214 ) ) ( not ( = ?auto_206209 ?auto_206210 ) ) ( not ( = ?auto_206209 ?auto_206211 ) ) ( not ( = ?auto_206209 ?auto_206212 ) ) ( not ( = ?auto_206209 ?auto_206213 ) ) ( not ( = ?auto_206209 ?auto_206214 ) ) ( not ( = ?auto_206210 ?auto_206211 ) ) ( not ( = ?auto_206210 ?auto_206212 ) ) ( not ( = ?auto_206210 ?auto_206213 ) ) ( not ( = ?auto_206210 ?auto_206214 ) ) ( not ( = ?auto_206211 ?auto_206212 ) ) ( not ( = ?auto_206211 ?auto_206213 ) ) ( not ( = ?auto_206211 ?auto_206214 ) ) ( not ( = ?auto_206212 ?auto_206213 ) ) ( not ( = ?auto_206212 ?auto_206214 ) ) ( not ( = ?auto_206213 ?auto_206214 ) ) ( ON ?auto_206212 ?auto_206213 ) ( ON ?auto_206211 ?auto_206212 ) ( CLEAR ?auto_206209 ) ( ON ?auto_206210 ?auto_206211 ) ( CLEAR ?auto_206210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206206 ?auto_206207 ?auto_206208 ?auto_206209 ?auto_206210 )
      ( MAKE-8PILE ?auto_206206 ?auto_206207 ?auto_206208 ?auto_206209 ?auto_206210 ?auto_206211 ?auto_206212 ?auto_206213 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206223 - BLOCK
      ?auto_206224 - BLOCK
      ?auto_206225 - BLOCK
      ?auto_206226 - BLOCK
      ?auto_206227 - BLOCK
      ?auto_206228 - BLOCK
      ?auto_206229 - BLOCK
      ?auto_206230 - BLOCK
    )
    :vars
    (
      ?auto_206231 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206230 ?auto_206231 ) ( ON-TABLE ?auto_206223 ) ( ON ?auto_206224 ?auto_206223 ) ( ON ?auto_206225 ?auto_206224 ) ( ON ?auto_206226 ?auto_206225 ) ( not ( = ?auto_206223 ?auto_206224 ) ) ( not ( = ?auto_206223 ?auto_206225 ) ) ( not ( = ?auto_206223 ?auto_206226 ) ) ( not ( = ?auto_206223 ?auto_206227 ) ) ( not ( = ?auto_206223 ?auto_206228 ) ) ( not ( = ?auto_206223 ?auto_206229 ) ) ( not ( = ?auto_206223 ?auto_206230 ) ) ( not ( = ?auto_206223 ?auto_206231 ) ) ( not ( = ?auto_206224 ?auto_206225 ) ) ( not ( = ?auto_206224 ?auto_206226 ) ) ( not ( = ?auto_206224 ?auto_206227 ) ) ( not ( = ?auto_206224 ?auto_206228 ) ) ( not ( = ?auto_206224 ?auto_206229 ) ) ( not ( = ?auto_206224 ?auto_206230 ) ) ( not ( = ?auto_206224 ?auto_206231 ) ) ( not ( = ?auto_206225 ?auto_206226 ) ) ( not ( = ?auto_206225 ?auto_206227 ) ) ( not ( = ?auto_206225 ?auto_206228 ) ) ( not ( = ?auto_206225 ?auto_206229 ) ) ( not ( = ?auto_206225 ?auto_206230 ) ) ( not ( = ?auto_206225 ?auto_206231 ) ) ( not ( = ?auto_206226 ?auto_206227 ) ) ( not ( = ?auto_206226 ?auto_206228 ) ) ( not ( = ?auto_206226 ?auto_206229 ) ) ( not ( = ?auto_206226 ?auto_206230 ) ) ( not ( = ?auto_206226 ?auto_206231 ) ) ( not ( = ?auto_206227 ?auto_206228 ) ) ( not ( = ?auto_206227 ?auto_206229 ) ) ( not ( = ?auto_206227 ?auto_206230 ) ) ( not ( = ?auto_206227 ?auto_206231 ) ) ( not ( = ?auto_206228 ?auto_206229 ) ) ( not ( = ?auto_206228 ?auto_206230 ) ) ( not ( = ?auto_206228 ?auto_206231 ) ) ( not ( = ?auto_206229 ?auto_206230 ) ) ( not ( = ?auto_206229 ?auto_206231 ) ) ( not ( = ?auto_206230 ?auto_206231 ) ) ( ON ?auto_206229 ?auto_206230 ) ( ON ?auto_206228 ?auto_206229 ) ( CLEAR ?auto_206226 ) ( ON ?auto_206227 ?auto_206228 ) ( CLEAR ?auto_206227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206223 ?auto_206224 ?auto_206225 ?auto_206226 ?auto_206227 )
      ( MAKE-8PILE ?auto_206223 ?auto_206224 ?auto_206225 ?auto_206226 ?auto_206227 ?auto_206228 ?auto_206229 ?auto_206230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206240 - BLOCK
      ?auto_206241 - BLOCK
      ?auto_206242 - BLOCK
      ?auto_206243 - BLOCK
      ?auto_206244 - BLOCK
      ?auto_206245 - BLOCK
      ?auto_206246 - BLOCK
      ?auto_206247 - BLOCK
    )
    :vars
    (
      ?auto_206248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206247 ?auto_206248 ) ( ON-TABLE ?auto_206240 ) ( ON ?auto_206241 ?auto_206240 ) ( ON ?auto_206242 ?auto_206241 ) ( not ( = ?auto_206240 ?auto_206241 ) ) ( not ( = ?auto_206240 ?auto_206242 ) ) ( not ( = ?auto_206240 ?auto_206243 ) ) ( not ( = ?auto_206240 ?auto_206244 ) ) ( not ( = ?auto_206240 ?auto_206245 ) ) ( not ( = ?auto_206240 ?auto_206246 ) ) ( not ( = ?auto_206240 ?auto_206247 ) ) ( not ( = ?auto_206240 ?auto_206248 ) ) ( not ( = ?auto_206241 ?auto_206242 ) ) ( not ( = ?auto_206241 ?auto_206243 ) ) ( not ( = ?auto_206241 ?auto_206244 ) ) ( not ( = ?auto_206241 ?auto_206245 ) ) ( not ( = ?auto_206241 ?auto_206246 ) ) ( not ( = ?auto_206241 ?auto_206247 ) ) ( not ( = ?auto_206241 ?auto_206248 ) ) ( not ( = ?auto_206242 ?auto_206243 ) ) ( not ( = ?auto_206242 ?auto_206244 ) ) ( not ( = ?auto_206242 ?auto_206245 ) ) ( not ( = ?auto_206242 ?auto_206246 ) ) ( not ( = ?auto_206242 ?auto_206247 ) ) ( not ( = ?auto_206242 ?auto_206248 ) ) ( not ( = ?auto_206243 ?auto_206244 ) ) ( not ( = ?auto_206243 ?auto_206245 ) ) ( not ( = ?auto_206243 ?auto_206246 ) ) ( not ( = ?auto_206243 ?auto_206247 ) ) ( not ( = ?auto_206243 ?auto_206248 ) ) ( not ( = ?auto_206244 ?auto_206245 ) ) ( not ( = ?auto_206244 ?auto_206246 ) ) ( not ( = ?auto_206244 ?auto_206247 ) ) ( not ( = ?auto_206244 ?auto_206248 ) ) ( not ( = ?auto_206245 ?auto_206246 ) ) ( not ( = ?auto_206245 ?auto_206247 ) ) ( not ( = ?auto_206245 ?auto_206248 ) ) ( not ( = ?auto_206246 ?auto_206247 ) ) ( not ( = ?auto_206246 ?auto_206248 ) ) ( not ( = ?auto_206247 ?auto_206248 ) ) ( ON ?auto_206246 ?auto_206247 ) ( ON ?auto_206245 ?auto_206246 ) ( ON ?auto_206244 ?auto_206245 ) ( CLEAR ?auto_206242 ) ( ON ?auto_206243 ?auto_206244 ) ( CLEAR ?auto_206243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206240 ?auto_206241 ?auto_206242 ?auto_206243 )
      ( MAKE-8PILE ?auto_206240 ?auto_206241 ?auto_206242 ?auto_206243 ?auto_206244 ?auto_206245 ?auto_206246 ?auto_206247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206257 - BLOCK
      ?auto_206258 - BLOCK
      ?auto_206259 - BLOCK
      ?auto_206260 - BLOCK
      ?auto_206261 - BLOCK
      ?auto_206262 - BLOCK
      ?auto_206263 - BLOCK
      ?auto_206264 - BLOCK
    )
    :vars
    (
      ?auto_206265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206264 ?auto_206265 ) ( ON-TABLE ?auto_206257 ) ( ON ?auto_206258 ?auto_206257 ) ( ON ?auto_206259 ?auto_206258 ) ( not ( = ?auto_206257 ?auto_206258 ) ) ( not ( = ?auto_206257 ?auto_206259 ) ) ( not ( = ?auto_206257 ?auto_206260 ) ) ( not ( = ?auto_206257 ?auto_206261 ) ) ( not ( = ?auto_206257 ?auto_206262 ) ) ( not ( = ?auto_206257 ?auto_206263 ) ) ( not ( = ?auto_206257 ?auto_206264 ) ) ( not ( = ?auto_206257 ?auto_206265 ) ) ( not ( = ?auto_206258 ?auto_206259 ) ) ( not ( = ?auto_206258 ?auto_206260 ) ) ( not ( = ?auto_206258 ?auto_206261 ) ) ( not ( = ?auto_206258 ?auto_206262 ) ) ( not ( = ?auto_206258 ?auto_206263 ) ) ( not ( = ?auto_206258 ?auto_206264 ) ) ( not ( = ?auto_206258 ?auto_206265 ) ) ( not ( = ?auto_206259 ?auto_206260 ) ) ( not ( = ?auto_206259 ?auto_206261 ) ) ( not ( = ?auto_206259 ?auto_206262 ) ) ( not ( = ?auto_206259 ?auto_206263 ) ) ( not ( = ?auto_206259 ?auto_206264 ) ) ( not ( = ?auto_206259 ?auto_206265 ) ) ( not ( = ?auto_206260 ?auto_206261 ) ) ( not ( = ?auto_206260 ?auto_206262 ) ) ( not ( = ?auto_206260 ?auto_206263 ) ) ( not ( = ?auto_206260 ?auto_206264 ) ) ( not ( = ?auto_206260 ?auto_206265 ) ) ( not ( = ?auto_206261 ?auto_206262 ) ) ( not ( = ?auto_206261 ?auto_206263 ) ) ( not ( = ?auto_206261 ?auto_206264 ) ) ( not ( = ?auto_206261 ?auto_206265 ) ) ( not ( = ?auto_206262 ?auto_206263 ) ) ( not ( = ?auto_206262 ?auto_206264 ) ) ( not ( = ?auto_206262 ?auto_206265 ) ) ( not ( = ?auto_206263 ?auto_206264 ) ) ( not ( = ?auto_206263 ?auto_206265 ) ) ( not ( = ?auto_206264 ?auto_206265 ) ) ( ON ?auto_206263 ?auto_206264 ) ( ON ?auto_206262 ?auto_206263 ) ( ON ?auto_206261 ?auto_206262 ) ( CLEAR ?auto_206259 ) ( ON ?auto_206260 ?auto_206261 ) ( CLEAR ?auto_206260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206257 ?auto_206258 ?auto_206259 ?auto_206260 )
      ( MAKE-8PILE ?auto_206257 ?auto_206258 ?auto_206259 ?auto_206260 ?auto_206261 ?auto_206262 ?auto_206263 ?auto_206264 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206274 - BLOCK
      ?auto_206275 - BLOCK
      ?auto_206276 - BLOCK
      ?auto_206277 - BLOCK
      ?auto_206278 - BLOCK
      ?auto_206279 - BLOCK
      ?auto_206280 - BLOCK
      ?auto_206281 - BLOCK
    )
    :vars
    (
      ?auto_206282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206281 ?auto_206282 ) ( ON-TABLE ?auto_206274 ) ( ON ?auto_206275 ?auto_206274 ) ( not ( = ?auto_206274 ?auto_206275 ) ) ( not ( = ?auto_206274 ?auto_206276 ) ) ( not ( = ?auto_206274 ?auto_206277 ) ) ( not ( = ?auto_206274 ?auto_206278 ) ) ( not ( = ?auto_206274 ?auto_206279 ) ) ( not ( = ?auto_206274 ?auto_206280 ) ) ( not ( = ?auto_206274 ?auto_206281 ) ) ( not ( = ?auto_206274 ?auto_206282 ) ) ( not ( = ?auto_206275 ?auto_206276 ) ) ( not ( = ?auto_206275 ?auto_206277 ) ) ( not ( = ?auto_206275 ?auto_206278 ) ) ( not ( = ?auto_206275 ?auto_206279 ) ) ( not ( = ?auto_206275 ?auto_206280 ) ) ( not ( = ?auto_206275 ?auto_206281 ) ) ( not ( = ?auto_206275 ?auto_206282 ) ) ( not ( = ?auto_206276 ?auto_206277 ) ) ( not ( = ?auto_206276 ?auto_206278 ) ) ( not ( = ?auto_206276 ?auto_206279 ) ) ( not ( = ?auto_206276 ?auto_206280 ) ) ( not ( = ?auto_206276 ?auto_206281 ) ) ( not ( = ?auto_206276 ?auto_206282 ) ) ( not ( = ?auto_206277 ?auto_206278 ) ) ( not ( = ?auto_206277 ?auto_206279 ) ) ( not ( = ?auto_206277 ?auto_206280 ) ) ( not ( = ?auto_206277 ?auto_206281 ) ) ( not ( = ?auto_206277 ?auto_206282 ) ) ( not ( = ?auto_206278 ?auto_206279 ) ) ( not ( = ?auto_206278 ?auto_206280 ) ) ( not ( = ?auto_206278 ?auto_206281 ) ) ( not ( = ?auto_206278 ?auto_206282 ) ) ( not ( = ?auto_206279 ?auto_206280 ) ) ( not ( = ?auto_206279 ?auto_206281 ) ) ( not ( = ?auto_206279 ?auto_206282 ) ) ( not ( = ?auto_206280 ?auto_206281 ) ) ( not ( = ?auto_206280 ?auto_206282 ) ) ( not ( = ?auto_206281 ?auto_206282 ) ) ( ON ?auto_206280 ?auto_206281 ) ( ON ?auto_206279 ?auto_206280 ) ( ON ?auto_206278 ?auto_206279 ) ( ON ?auto_206277 ?auto_206278 ) ( CLEAR ?auto_206275 ) ( ON ?auto_206276 ?auto_206277 ) ( CLEAR ?auto_206276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206274 ?auto_206275 ?auto_206276 )
      ( MAKE-8PILE ?auto_206274 ?auto_206275 ?auto_206276 ?auto_206277 ?auto_206278 ?auto_206279 ?auto_206280 ?auto_206281 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206291 - BLOCK
      ?auto_206292 - BLOCK
      ?auto_206293 - BLOCK
      ?auto_206294 - BLOCK
      ?auto_206295 - BLOCK
      ?auto_206296 - BLOCK
      ?auto_206297 - BLOCK
      ?auto_206298 - BLOCK
    )
    :vars
    (
      ?auto_206299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206298 ?auto_206299 ) ( ON-TABLE ?auto_206291 ) ( ON ?auto_206292 ?auto_206291 ) ( not ( = ?auto_206291 ?auto_206292 ) ) ( not ( = ?auto_206291 ?auto_206293 ) ) ( not ( = ?auto_206291 ?auto_206294 ) ) ( not ( = ?auto_206291 ?auto_206295 ) ) ( not ( = ?auto_206291 ?auto_206296 ) ) ( not ( = ?auto_206291 ?auto_206297 ) ) ( not ( = ?auto_206291 ?auto_206298 ) ) ( not ( = ?auto_206291 ?auto_206299 ) ) ( not ( = ?auto_206292 ?auto_206293 ) ) ( not ( = ?auto_206292 ?auto_206294 ) ) ( not ( = ?auto_206292 ?auto_206295 ) ) ( not ( = ?auto_206292 ?auto_206296 ) ) ( not ( = ?auto_206292 ?auto_206297 ) ) ( not ( = ?auto_206292 ?auto_206298 ) ) ( not ( = ?auto_206292 ?auto_206299 ) ) ( not ( = ?auto_206293 ?auto_206294 ) ) ( not ( = ?auto_206293 ?auto_206295 ) ) ( not ( = ?auto_206293 ?auto_206296 ) ) ( not ( = ?auto_206293 ?auto_206297 ) ) ( not ( = ?auto_206293 ?auto_206298 ) ) ( not ( = ?auto_206293 ?auto_206299 ) ) ( not ( = ?auto_206294 ?auto_206295 ) ) ( not ( = ?auto_206294 ?auto_206296 ) ) ( not ( = ?auto_206294 ?auto_206297 ) ) ( not ( = ?auto_206294 ?auto_206298 ) ) ( not ( = ?auto_206294 ?auto_206299 ) ) ( not ( = ?auto_206295 ?auto_206296 ) ) ( not ( = ?auto_206295 ?auto_206297 ) ) ( not ( = ?auto_206295 ?auto_206298 ) ) ( not ( = ?auto_206295 ?auto_206299 ) ) ( not ( = ?auto_206296 ?auto_206297 ) ) ( not ( = ?auto_206296 ?auto_206298 ) ) ( not ( = ?auto_206296 ?auto_206299 ) ) ( not ( = ?auto_206297 ?auto_206298 ) ) ( not ( = ?auto_206297 ?auto_206299 ) ) ( not ( = ?auto_206298 ?auto_206299 ) ) ( ON ?auto_206297 ?auto_206298 ) ( ON ?auto_206296 ?auto_206297 ) ( ON ?auto_206295 ?auto_206296 ) ( ON ?auto_206294 ?auto_206295 ) ( CLEAR ?auto_206292 ) ( ON ?auto_206293 ?auto_206294 ) ( CLEAR ?auto_206293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206291 ?auto_206292 ?auto_206293 )
      ( MAKE-8PILE ?auto_206291 ?auto_206292 ?auto_206293 ?auto_206294 ?auto_206295 ?auto_206296 ?auto_206297 ?auto_206298 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206308 - BLOCK
      ?auto_206309 - BLOCK
      ?auto_206310 - BLOCK
      ?auto_206311 - BLOCK
      ?auto_206312 - BLOCK
      ?auto_206313 - BLOCK
      ?auto_206314 - BLOCK
      ?auto_206315 - BLOCK
    )
    :vars
    (
      ?auto_206316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206315 ?auto_206316 ) ( ON-TABLE ?auto_206308 ) ( not ( = ?auto_206308 ?auto_206309 ) ) ( not ( = ?auto_206308 ?auto_206310 ) ) ( not ( = ?auto_206308 ?auto_206311 ) ) ( not ( = ?auto_206308 ?auto_206312 ) ) ( not ( = ?auto_206308 ?auto_206313 ) ) ( not ( = ?auto_206308 ?auto_206314 ) ) ( not ( = ?auto_206308 ?auto_206315 ) ) ( not ( = ?auto_206308 ?auto_206316 ) ) ( not ( = ?auto_206309 ?auto_206310 ) ) ( not ( = ?auto_206309 ?auto_206311 ) ) ( not ( = ?auto_206309 ?auto_206312 ) ) ( not ( = ?auto_206309 ?auto_206313 ) ) ( not ( = ?auto_206309 ?auto_206314 ) ) ( not ( = ?auto_206309 ?auto_206315 ) ) ( not ( = ?auto_206309 ?auto_206316 ) ) ( not ( = ?auto_206310 ?auto_206311 ) ) ( not ( = ?auto_206310 ?auto_206312 ) ) ( not ( = ?auto_206310 ?auto_206313 ) ) ( not ( = ?auto_206310 ?auto_206314 ) ) ( not ( = ?auto_206310 ?auto_206315 ) ) ( not ( = ?auto_206310 ?auto_206316 ) ) ( not ( = ?auto_206311 ?auto_206312 ) ) ( not ( = ?auto_206311 ?auto_206313 ) ) ( not ( = ?auto_206311 ?auto_206314 ) ) ( not ( = ?auto_206311 ?auto_206315 ) ) ( not ( = ?auto_206311 ?auto_206316 ) ) ( not ( = ?auto_206312 ?auto_206313 ) ) ( not ( = ?auto_206312 ?auto_206314 ) ) ( not ( = ?auto_206312 ?auto_206315 ) ) ( not ( = ?auto_206312 ?auto_206316 ) ) ( not ( = ?auto_206313 ?auto_206314 ) ) ( not ( = ?auto_206313 ?auto_206315 ) ) ( not ( = ?auto_206313 ?auto_206316 ) ) ( not ( = ?auto_206314 ?auto_206315 ) ) ( not ( = ?auto_206314 ?auto_206316 ) ) ( not ( = ?auto_206315 ?auto_206316 ) ) ( ON ?auto_206314 ?auto_206315 ) ( ON ?auto_206313 ?auto_206314 ) ( ON ?auto_206312 ?auto_206313 ) ( ON ?auto_206311 ?auto_206312 ) ( ON ?auto_206310 ?auto_206311 ) ( CLEAR ?auto_206308 ) ( ON ?auto_206309 ?auto_206310 ) ( CLEAR ?auto_206309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206308 ?auto_206309 )
      ( MAKE-8PILE ?auto_206308 ?auto_206309 ?auto_206310 ?auto_206311 ?auto_206312 ?auto_206313 ?auto_206314 ?auto_206315 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206325 - BLOCK
      ?auto_206326 - BLOCK
      ?auto_206327 - BLOCK
      ?auto_206328 - BLOCK
      ?auto_206329 - BLOCK
      ?auto_206330 - BLOCK
      ?auto_206331 - BLOCK
      ?auto_206332 - BLOCK
    )
    :vars
    (
      ?auto_206333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206332 ?auto_206333 ) ( ON-TABLE ?auto_206325 ) ( not ( = ?auto_206325 ?auto_206326 ) ) ( not ( = ?auto_206325 ?auto_206327 ) ) ( not ( = ?auto_206325 ?auto_206328 ) ) ( not ( = ?auto_206325 ?auto_206329 ) ) ( not ( = ?auto_206325 ?auto_206330 ) ) ( not ( = ?auto_206325 ?auto_206331 ) ) ( not ( = ?auto_206325 ?auto_206332 ) ) ( not ( = ?auto_206325 ?auto_206333 ) ) ( not ( = ?auto_206326 ?auto_206327 ) ) ( not ( = ?auto_206326 ?auto_206328 ) ) ( not ( = ?auto_206326 ?auto_206329 ) ) ( not ( = ?auto_206326 ?auto_206330 ) ) ( not ( = ?auto_206326 ?auto_206331 ) ) ( not ( = ?auto_206326 ?auto_206332 ) ) ( not ( = ?auto_206326 ?auto_206333 ) ) ( not ( = ?auto_206327 ?auto_206328 ) ) ( not ( = ?auto_206327 ?auto_206329 ) ) ( not ( = ?auto_206327 ?auto_206330 ) ) ( not ( = ?auto_206327 ?auto_206331 ) ) ( not ( = ?auto_206327 ?auto_206332 ) ) ( not ( = ?auto_206327 ?auto_206333 ) ) ( not ( = ?auto_206328 ?auto_206329 ) ) ( not ( = ?auto_206328 ?auto_206330 ) ) ( not ( = ?auto_206328 ?auto_206331 ) ) ( not ( = ?auto_206328 ?auto_206332 ) ) ( not ( = ?auto_206328 ?auto_206333 ) ) ( not ( = ?auto_206329 ?auto_206330 ) ) ( not ( = ?auto_206329 ?auto_206331 ) ) ( not ( = ?auto_206329 ?auto_206332 ) ) ( not ( = ?auto_206329 ?auto_206333 ) ) ( not ( = ?auto_206330 ?auto_206331 ) ) ( not ( = ?auto_206330 ?auto_206332 ) ) ( not ( = ?auto_206330 ?auto_206333 ) ) ( not ( = ?auto_206331 ?auto_206332 ) ) ( not ( = ?auto_206331 ?auto_206333 ) ) ( not ( = ?auto_206332 ?auto_206333 ) ) ( ON ?auto_206331 ?auto_206332 ) ( ON ?auto_206330 ?auto_206331 ) ( ON ?auto_206329 ?auto_206330 ) ( ON ?auto_206328 ?auto_206329 ) ( ON ?auto_206327 ?auto_206328 ) ( CLEAR ?auto_206325 ) ( ON ?auto_206326 ?auto_206327 ) ( CLEAR ?auto_206326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206325 ?auto_206326 )
      ( MAKE-8PILE ?auto_206325 ?auto_206326 ?auto_206327 ?auto_206328 ?auto_206329 ?auto_206330 ?auto_206331 ?auto_206332 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206342 - BLOCK
      ?auto_206343 - BLOCK
      ?auto_206344 - BLOCK
      ?auto_206345 - BLOCK
      ?auto_206346 - BLOCK
      ?auto_206347 - BLOCK
      ?auto_206348 - BLOCK
      ?auto_206349 - BLOCK
    )
    :vars
    (
      ?auto_206350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206349 ?auto_206350 ) ( not ( = ?auto_206342 ?auto_206343 ) ) ( not ( = ?auto_206342 ?auto_206344 ) ) ( not ( = ?auto_206342 ?auto_206345 ) ) ( not ( = ?auto_206342 ?auto_206346 ) ) ( not ( = ?auto_206342 ?auto_206347 ) ) ( not ( = ?auto_206342 ?auto_206348 ) ) ( not ( = ?auto_206342 ?auto_206349 ) ) ( not ( = ?auto_206342 ?auto_206350 ) ) ( not ( = ?auto_206343 ?auto_206344 ) ) ( not ( = ?auto_206343 ?auto_206345 ) ) ( not ( = ?auto_206343 ?auto_206346 ) ) ( not ( = ?auto_206343 ?auto_206347 ) ) ( not ( = ?auto_206343 ?auto_206348 ) ) ( not ( = ?auto_206343 ?auto_206349 ) ) ( not ( = ?auto_206343 ?auto_206350 ) ) ( not ( = ?auto_206344 ?auto_206345 ) ) ( not ( = ?auto_206344 ?auto_206346 ) ) ( not ( = ?auto_206344 ?auto_206347 ) ) ( not ( = ?auto_206344 ?auto_206348 ) ) ( not ( = ?auto_206344 ?auto_206349 ) ) ( not ( = ?auto_206344 ?auto_206350 ) ) ( not ( = ?auto_206345 ?auto_206346 ) ) ( not ( = ?auto_206345 ?auto_206347 ) ) ( not ( = ?auto_206345 ?auto_206348 ) ) ( not ( = ?auto_206345 ?auto_206349 ) ) ( not ( = ?auto_206345 ?auto_206350 ) ) ( not ( = ?auto_206346 ?auto_206347 ) ) ( not ( = ?auto_206346 ?auto_206348 ) ) ( not ( = ?auto_206346 ?auto_206349 ) ) ( not ( = ?auto_206346 ?auto_206350 ) ) ( not ( = ?auto_206347 ?auto_206348 ) ) ( not ( = ?auto_206347 ?auto_206349 ) ) ( not ( = ?auto_206347 ?auto_206350 ) ) ( not ( = ?auto_206348 ?auto_206349 ) ) ( not ( = ?auto_206348 ?auto_206350 ) ) ( not ( = ?auto_206349 ?auto_206350 ) ) ( ON ?auto_206348 ?auto_206349 ) ( ON ?auto_206347 ?auto_206348 ) ( ON ?auto_206346 ?auto_206347 ) ( ON ?auto_206345 ?auto_206346 ) ( ON ?auto_206344 ?auto_206345 ) ( ON ?auto_206343 ?auto_206344 ) ( ON ?auto_206342 ?auto_206343 ) ( CLEAR ?auto_206342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206342 )
      ( MAKE-8PILE ?auto_206342 ?auto_206343 ?auto_206344 ?auto_206345 ?auto_206346 ?auto_206347 ?auto_206348 ?auto_206349 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_206359 - BLOCK
      ?auto_206360 - BLOCK
      ?auto_206361 - BLOCK
      ?auto_206362 - BLOCK
      ?auto_206363 - BLOCK
      ?auto_206364 - BLOCK
      ?auto_206365 - BLOCK
      ?auto_206366 - BLOCK
    )
    :vars
    (
      ?auto_206367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206366 ?auto_206367 ) ( not ( = ?auto_206359 ?auto_206360 ) ) ( not ( = ?auto_206359 ?auto_206361 ) ) ( not ( = ?auto_206359 ?auto_206362 ) ) ( not ( = ?auto_206359 ?auto_206363 ) ) ( not ( = ?auto_206359 ?auto_206364 ) ) ( not ( = ?auto_206359 ?auto_206365 ) ) ( not ( = ?auto_206359 ?auto_206366 ) ) ( not ( = ?auto_206359 ?auto_206367 ) ) ( not ( = ?auto_206360 ?auto_206361 ) ) ( not ( = ?auto_206360 ?auto_206362 ) ) ( not ( = ?auto_206360 ?auto_206363 ) ) ( not ( = ?auto_206360 ?auto_206364 ) ) ( not ( = ?auto_206360 ?auto_206365 ) ) ( not ( = ?auto_206360 ?auto_206366 ) ) ( not ( = ?auto_206360 ?auto_206367 ) ) ( not ( = ?auto_206361 ?auto_206362 ) ) ( not ( = ?auto_206361 ?auto_206363 ) ) ( not ( = ?auto_206361 ?auto_206364 ) ) ( not ( = ?auto_206361 ?auto_206365 ) ) ( not ( = ?auto_206361 ?auto_206366 ) ) ( not ( = ?auto_206361 ?auto_206367 ) ) ( not ( = ?auto_206362 ?auto_206363 ) ) ( not ( = ?auto_206362 ?auto_206364 ) ) ( not ( = ?auto_206362 ?auto_206365 ) ) ( not ( = ?auto_206362 ?auto_206366 ) ) ( not ( = ?auto_206362 ?auto_206367 ) ) ( not ( = ?auto_206363 ?auto_206364 ) ) ( not ( = ?auto_206363 ?auto_206365 ) ) ( not ( = ?auto_206363 ?auto_206366 ) ) ( not ( = ?auto_206363 ?auto_206367 ) ) ( not ( = ?auto_206364 ?auto_206365 ) ) ( not ( = ?auto_206364 ?auto_206366 ) ) ( not ( = ?auto_206364 ?auto_206367 ) ) ( not ( = ?auto_206365 ?auto_206366 ) ) ( not ( = ?auto_206365 ?auto_206367 ) ) ( not ( = ?auto_206366 ?auto_206367 ) ) ( ON ?auto_206365 ?auto_206366 ) ( ON ?auto_206364 ?auto_206365 ) ( ON ?auto_206363 ?auto_206364 ) ( ON ?auto_206362 ?auto_206363 ) ( ON ?auto_206361 ?auto_206362 ) ( ON ?auto_206360 ?auto_206361 ) ( ON ?auto_206359 ?auto_206360 ) ( CLEAR ?auto_206359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206359 )
      ( MAKE-8PILE ?auto_206359 ?auto_206360 ?auto_206361 ?auto_206362 ?auto_206363 ?auto_206364 ?auto_206365 ?auto_206366 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206377 - BLOCK
      ?auto_206378 - BLOCK
      ?auto_206379 - BLOCK
      ?auto_206380 - BLOCK
      ?auto_206381 - BLOCK
      ?auto_206382 - BLOCK
      ?auto_206383 - BLOCK
      ?auto_206384 - BLOCK
      ?auto_206385 - BLOCK
    )
    :vars
    (
      ?auto_206386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206384 ) ( ON ?auto_206385 ?auto_206386 ) ( CLEAR ?auto_206385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206377 ) ( ON ?auto_206378 ?auto_206377 ) ( ON ?auto_206379 ?auto_206378 ) ( ON ?auto_206380 ?auto_206379 ) ( ON ?auto_206381 ?auto_206380 ) ( ON ?auto_206382 ?auto_206381 ) ( ON ?auto_206383 ?auto_206382 ) ( ON ?auto_206384 ?auto_206383 ) ( not ( = ?auto_206377 ?auto_206378 ) ) ( not ( = ?auto_206377 ?auto_206379 ) ) ( not ( = ?auto_206377 ?auto_206380 ) ) ( not ( = ?auto_206377 ?auto_206381 ) ) ( not ( = ?auto_206377 ?auto_206382 ) ) ( not ( = ?auto_206377 ?auto_206383 ) ) ( not ( = ?auto_206377 ?auto_206384 ) ) ( not ( = ?auto_206377 ?auto_206385 ) ) ( not ( = ?auto_206377 ?auto_206386 ) ) ( not ( = ?auto_206378 ?auto_206379 ) ) ( not ( = ?auto_206378 ?auto_206380 ) ) ( not ( = ?auto_206378 ?auto_206381 ) ) ( not ( = ?auto_206378 ?auto_206382 ) ) ( not ( = ?auto_206378 ?auto_206383 ) ) ( not ( = ?auto_206378 ?auto_206384 ) ) ( not ( = ?auto_206378 ?auto_206385 ) ) ( not ( = ?auto_206378 ?auto_206386 ) ) ( not ( = ?auto_206379 ?auto_206380 ) ) ( not ( = ?auto_206379 ?auto_206381 ) ) ( not ( = ?auto_206379 ?auto_206382 ) ) ( not ( = ?auto_206379 ?auto_206383 ) ) ( not ( = ?auto_206379 ?auto_206384 ) ) ( not ( = ?auto_206379 ?auto_206385 ) ) ( not ( = ?auto_206379 ?auto_206386 ) ) ( not ( = ?auto_206380 ?auto_206381 ) ) ( not ( = ?auto_206380 ?auto_206382 ) ) ( not ( = ?auto_206380 ?auto_206383 ) ) ( not ( = ?auto_206380 ?auto_206384 ) ) ( not ( = ?auto_206380 ?auto_206385 ) ) ( not ( = ?auto_206380 ?auto_206386 ) ) ( not ( = ?auto_206381 ?auto_206382 ) ) ( not ( = ?auto_206381 ?auto_206383 ) ) ( not ( = ?auto_206381 ?auto_206384 ) ) ( not ( = ?auto_206381 ?auto_206385 ) ) ( not ( = ?auto_206381 ?auto_206386 ) ) ( not ( = ?auto_206382 ?auto_206383 ) ) ( not ( = ?auto_206382 ?auto_206384 ) ) ( not ( = ?auto_206382 ?auto_206385 ) ) ( not ( = ?auto_206382 ?auto_206386 ) ) ( not ( = ?auto_206383 ?auto_206384 ) ) ( not ( = ?auto_206383 ?auto_206385 ) ) ( not ( = ?auto_206383 ?auto_206386 ) ) ( not ( = ?auto_206384 ?auto_206385 ) ) ( not ( = ?auto_206384 ?auto_206386 ) ) ( not ( = ?auto_206385 ?auto_206386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206385 ?auto_206386 )
      ( !STACK ?auto_206385 ?auto_206384 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206396 - BLOCK
      ?auto_206397 - BLOCK
      ?auto_206398 - BLOCK
      ?auto_206399 - BLOCK
      ?auto_206400 - BLOCK
      ?auto_206401 - BLOCK
      ?auto_206402 - BLOCK
      ?auto_206403 - BLOCK
      ?auto_206404 - BLOCK
    )
    :vars
    (
      ?auto_206405 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206403 ) ( ON ?auto_206404 ?auto_206405 ) ( CLEAR ?auto_206404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206396 ) ( ON ?auto_206397 ?auto_206396 ) ( ON ?auto_206398 ?auto_206397 ) ( ON ?auto_206399 ?auto_206398 ) ( ON ?auto_206400 ?auto_206399 ) ( ON ?auto_206401 ?auto_206400 ) ( ON ?auto_206402 ?auto_206401 ) ( ON ?auto_206403 ?auto_206402 ) ( not ( = ?auto_206396 ?auto_206397 ) ) ( not ( = ?auto_206396 ?auto_206398 ) ) ( not ( = ?auto_206396 ?auto_206399 ) ) ( not ( = ?auto_206396 ?auto_206400 ) ) ( not ( = ?auto_206396 ?auto_206401 ) ) ( not ( = ?auto_206396 ?auto_206402 ) ) ( not ( = ?auto_206396 ?auto_206403 ) ) ( not ( = ?auto_206396 ?auto_206404 ) ) ( not ( = ?auto_206396 ?auto_206405 ) ) ( not ( = ?auto_206397 ?auto_206398 ) ) ( not ( = ?auto_206397 ?auto_206399 ) ) ( not ( = ?auto_206397 ?auto_206400 ) ) ( not ( = ?auto_206397 ?auto_206401 ) ) ( not ( = ?auto_206397 ?auto_206402 ) ) ( not ( = ?auto_206397 ?auto_206403 ) ) ( not ( = ?auto_206397 ?auto_206404 ) ) ( not ( = ?auto_206397 ?auto_206405 ) ) ( not ( = ?auto_206398 ?auto_206399 ) ) ( not ( = ?auto_206398 ?auto_206400 ) ) ( not ( = ?auto_206398 ?auto_206401 ) ) ( not ( = ?auto_206398 ?auto_206402 ) ) ( not ( = ?auto_206398 ?auto_206403 ) ) ( not ( = ?auto_206398 ?auto_206404 ) ) ( not ( = ?auto_206398 ?auto_206405 ) ) ( not ( = ?auto_206399 ?auto_206400 ) ) ( not ( = ?auto_206399 ?auto_206401 ) ) ( not ( = ?auto_206399 ?auto_206402 ) ) ( not ( = ?auto_206399 ?auto_206403 ) ) ( not ( = ?auto_206399 ?auto_206404 ) ) ( not ( = ?auto_206399 ?auto_206405 ) ) ( not ( = ?auto_206400 ?auto_206401 ) ) ( not ( = ?auto_206400 ?auto_206402 ) ) ( not ( = ?auto_206400 ?auto_206403 ) ) ( not ( = ?auto_206400 ?auto_206404 ) ) ( not ( = ?auto_206400 ?auto_206405 ) ) ( not ( = ?auto_206401 ?auto_206402 ) ) ( not ( = ?auto_206401 ?auto_206403 ) ) ( not ( = ?auto_206401 ?auto_206404 ) ) ( not ( = ?auto_206401 ?auto_206405 ) ) ( not ( = ?auto_206402 ?auto_206403 ) ) ( not ( = ?auto_206402 ?auto_206404 ) ) ( not ( = ?auto_206402 ?auto_206405 ) ) ( not ( = ?auto_206403 ?auto_206404 ) ) ( not ( = ?auto_206403 ?auto_206405 ) ) ( not ( = ?auto_206404 ?auto_206405 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206404 ?auto_206405 )
      ( !STACK ?auto_206404 ?auto_206403 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206415 - BLOCK
      ?auto_206416 - BLOCK
      ?auto_206417 - BLOCK
      ?auto_206418 - BLOCK
      ?auto_206419 - BLOCK
      ?auto_206420 - BLOCK
      ?auto_206421 - BLOCK
      ?auto_206422 - BLOCK
      ?auto_206423 - BLOCK
    )
    :vars
    (
      ?auto_206424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206423 ?auto_206424 ) ( ON-TABLE ?auto_206415 ) ( ON ?auto_206416 ?auto_206415 ) ( ON ?auto_206417 ?auto_206416 ) ( ON ?auto_206418 ?auto_206417 ) ( ON ?auto_206419 ?auto_206418 ) ( ON ?auto_206420 ?auto_206419 ) ( ON ?auto_206421 ?auto_206420 ) ( not ( = ?auto_206415 ?auto_206416 ) ) ( not ( = ?auto_206415 ?auto_206417 ) ) ( not ( = ?auto_206415 ?auto_206418 ) ) ( not ( = ?auto_206415 ?auto_206419 ) ) ( not ( = ?auto_206415 ?auto_206420 ) ) ( not ( = ?auto_206415 ?auto_206421 ) ) ( not ( = ?auto_206415 ?auto_206422 ) ) ( not ( = ?auto_206415 ?auto_206423 ) ) ( not ( = ?auto_206415 ?auto_206424 ) ) ( not ( = ?auto_206416 ?auto_206417 ) ) ( not ( = ?auto_206416 ?auto_206418 ) ) ( not ( = ?auto_206416 ?auto_206419 ) ) ( not ( = ?auto_206416 ?auto_206420 ) ) ( not ( = ?auto_206416 ?auto_206421 ) ) ( not ( = ?auto_206416 ?auto_206422 ) ) ( not ( = ?auto_206416 ?auto_206423 ) ) ( not ( = ?auto_206416 ?auto_206424 ) ) ( not ( = ?auto_206417 ?auto_206418 ) ) ( not ( = ?auto_206417 ?auto_206419 ) ) ( not ( = ?auto_206417 ?auto_206420 ) ) ( not ( = ?auto_206417 ?auto_206421 ) ) ( not ( = ?auto_206417 ?auto_206422 ) ) ( not ( = ?auto_206417 ?auto_206423 ) ) ( not ( = ?auto_206417 ?auto_206424 ) ) ( not ( = ?auto_206418 ?auto_206419 ) ) ( not ( = ?auto_206418 ?auto_206420 ) ) ( not ( = ?auto_206418 ?auto_206421 ) ) ( not ( = ?auto_206418 ?auto_206422 ) ) ( not ( = ?auto_206418 ?auto_206423 ) ) ( not ( = ?auto_206418 ?auto_206424 ) ) ( not ( = ?auto_206419 ?auto_206420 ) ) ( not ( = ?auto_206419 ?auto_206421 ) ) ( not ( = ?auto_206419 ?auto_206422 ) ) ( not ( = ?auto_206419 ?auto_206423 ) ) ( not ( = ?auto_206419 ?auto_206424 ) ) ( not ( = ?auto_206420 ?auto_206421 ) ) ( not ( = ?auto_206420 ?auto_206422 ) ) ( not ( = ?auto_206420 ?auto_206423 ) ) ( not ( = ?auto_206420 ?auto_206424 ) ) ( not ( = ?auto_206421 ?auto_206422 ) ) ( not ( = ?auto_206421 ?auto_206423 ) ) ( not ( = ?auto_206421 ?auto_206424 ) ) ( not ( = ?auto_206422 ?auto_206423 ) ) ( not ( = ?auto_206422 ?auto_206424 ) ) ( not ( = ?auto_206423 ?auto_206424 ) ) ( CLEAR ?auto_206421 ) ( ON ?auto_206422 ?auto_206423 ) ( CLEAR ?auto_206422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206415 ?auto_206416 ?auto_206417 ?auto_206418 ?auto_206419 ?auto_206420 ?auto_206421 ?auto_206422 )
      ( MAKE-9PILE ?auto_206415 ?auto_206416 ?auto_206417 ?auto_206418 ?auto_206419 ?auto_206420 ?auto_206421 ?auto_206422 ?auto_206423 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206434 - BLOCK
      ?auto_206435 - BLOCK
      ?auto_206436 - BLOCK
      ?auto_206437 - BLOCK
      ?auto_206438 - BLOCK
      ?auto_206439 - BLOCK
      ?auto_206440 - BLOCK
      ?auto_206441 - BLOCK
      ?auto_206442 - BLOCK
    )
    :vars
    (
      ?auto_206443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206442 ?auto_206443 ) ( ON-TABLE ?auto_206434 ) ( ON ?auto_206435 ?auto_206434 ) ( ON ?auto_206436 ?auto_206435 ) ( ON ?auto_206437 ?auto_206436 ) ( ON ?auto_206438 ?auto_206437 ) ( ON ?auto_206439 ?auto_206438 ) ( ON ?auto_206440 ?auto_206439 ) ( not ( = ?auto_206434 ?auto_206435 ) ) ( not ( = ?auto_206434 ?auto_206436 ) ) ( not ( = ?auto_206434 ?auto_206437 ) ) ( not ( = ?auto_206434 ?auto_206438 ) ) ( not ( = ?auto_206434 ?auto_206439 ) ) ( not ( = ?auto_206434 ?auto_206440 ) ) ( not ( = ?auto_206434 ?auto_206441 ) ) ( not ( = ?auto_206434 ?auto_206442 ) ) ( not ( = ?auto_206434 ?auto_206443 ) ) ( not ( = ?auto_206435 ?auto_206436 ) ) ( not ( = ?auto_206435 ?auto_206437 ) ) ( not ( = ?auto_206435 ?auto_206438 ) ) ( not ( = ?auto_206435 ?auto_206439 ) ) ( not ( = ?auto_206435 ?auto_206440 ) ) ( not ( = ?auto_206435 ?auto_206441 ) ) ( not ( = ?auto_206435 ?auto_206442 ) ) ( not ( = ?auto_206435 ?auto_206443 ) ) ( not ( = ?auto_206436 ?auto_206437 ) ) ( not ( = ?auto_206436 ?auto_206438 ) ) ( not ( = ?auto_206436 ?auto_206439 ) ) ( not ( = ?auto_206436 ?auto_206440 ) ) ( not ( = ?auto_206436 ?auto_206441 ) ) ( not ( = ?auto_206436 ?auto_206442 ) ) ( not ( = ?auto_206436 ?auto_206443 ) ) ( not ( = ?auto_206437 ?auto_206438 ) ) ( not ( = ?auto_206437 ?auto_206439 ) ) ( not ( = ?auto_206437 ?auto_206440 ) ) ( not ( = ?auto_206437 ?auto_206441 ) ) ( not ( = ?auto_206437 ?auto_206442 ) ) ( not ( = ?auto_206437 ?auto_206443 ) ) ( not ( = ?auto_206438 ?auto_206439 ) ) ( not ( = ?auto_206438 ?auto_206440 ) ) ( not ( = ?auto_206438 ?auto_206441 ) ) ( not ( = ?auto_206438 ?auto_206442 ) ) ( not ( = ?auto_206438 ?auto_206443 ) ) ( not ( = ?auto_206439 ?auto_206440 ) ) ( not ( = ?auto_206439 ?auto_206441 ) ) ( not ( = ?auto_206439 ?auto_206442 ) ) ( not ( = ?auto_206439 ?auto_206443 ) ) ( not ( = ?auto_206440 ?auto_206441 ) ) ( not ( = ?auto_206440 ?auto_206442 ) ) ( not ( = ?auto_206440 ?auto_206443 ) ) ( not ( = ?auto_206441 ?auto_206442 ) ) ( not ( = ?auto_206441 ?auto_206443 ) ) ( not ( = ?auto_206442 ?auto_206443 ) ) ( CLEAR ?auto_206440 ) ( ON ?auto_206441 ?auto_206442 ) ( CLEAR ?auto_206441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206434 ?auto_206435 ?auto_206436 ?auto_206437 ?auto_206438 ?auto_206439 ?auto_206440 ?auto_206441 )
      ( MAKE-9PILE ?auto_206434 ?auto_206435 ?auto_206436 ?auto_206437 ?auto_206438 ?auto_206439 ?auto_206440 ?auto_206441 ?auto_206442 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206453 - BLOCK
      ?auto_206454 - BLOCK
      ?auto_206455 - BLOCK
      ?auto_206456 - BLOCK
      ?auto_206457 - BLOCK
      ?auto_206458 - BLOCK
      ?auto_206459 - BLOCK
      ?auto_206460 - BLOCK
      ?auto_206461 - BLOCK
    )
    :vars
    (
      ?auto_206462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206461 ?auto_206462 ) ( ON-TABLE ?auto_206453 ) ( ON ?auto_206454 ?auto_206453 ) ( ON ?auto_206455 ?auto_206454 ) ( ON ?auto_206456 ?auto_206455 ) ( ON ?auto_206457 ?auto_206456 ) ( ON ?auto_206458 ?auto_206457 ) ( not ( = ?auto_206453 ?auto_206454 ) ) ( not ( = ?auto_206453 ?auto_206455 ) ) ( not ( = ?auto_206453 ?auto_206456 ) ) ( not ( = ?auto_206453 ?auto_206457 ) ) ( not ( = ?auto_206453 ?auto_206458 ) ) ( not ( = ?auto_206453 ?auto_206459 ) ) ( not ( = ?auto_206453 ?auto_206460 ) ) ( not ( = ?auto_206453 ?auto_206461 ) ) ( not ( = ?auto_206453 ?auto_206462 ) ) ( not ( = ?auto_206454 ?auto_206455 ) ) ( not ( = ?auto_206454 ?auto_206456 ) ) ( not ( = ?auto_206454 ?auto_206457 ) ) ( not ( = ?auto_206454 ?auto_206458 ) ) ( not ( = ?auto_206454 ?auto_206459 ) ) ( not ( = ?auto_206454 ?auto_206460 ) ) ( not ( = ?auto_206454 ?auto_206461 ) ) ( not ( = ?auto_206454 ?auto_206462 ) ) ( not ( = ?auto_206455 ?auto_206456 ) ) ( not ( = ?auto_206455 ?auto_206457 ) ) ( not ( = ?auto_206455 ?auto_206458 ) ) ( not ( = ?auto_206455 ?auto_206459 ) ) ( not ( = ?auto_206455 ?auto_206460 ) ) ( not ( = ?auto_206455 ?auto_206461 ) ) ( not ( = ?auto_206455 ?auto_206462 ) ) ( not ( = ?auto_206456 ?auto_206457 ) ) ( not ( = ?auto_206456 ?auto_206458 ) ) ( not ( = ?auto_206456 ?auto_206459 ) ) ( not ( = ?auto_206456 ?auto_206460 ) ) ( not ( = ?auto_206456 ?auto_206461 ) ) ( not ( = ?auto_206456 ?auto_206462 ) ) ( not ( = ?auto_206457 ?auto_206458 ) ) ( not ( = ?auto_206457 ?auto_206459 ) ) ( not ( = ?auto_206457 ?auto_206460 ) ) ( not ( = ?auto_206457 ?auto_206461 ) ) ( not ( = ?auto_206457 ?auto_206462 ) ) ( not ( = ?auto_206458 ?auto_206459 ) ) ( not ( = ?auto_206458 ?auto_206460 ) ) ( not ( = ?auto_206458 ?auto_206461 ) ) ( not ( = ?auto_206458 ?auto_206462 ) ) ( not ( = ?auto_206459 ?auto_206460 ) ) ( not ( = ?auto_206459 ?auto_206461 ) ) ( not ( = ?auto_206459 ?auto_206462 ) ) ( not ( = ?auto_206460 ?auto_206461 ) ) ( not ( = ?auto_206460 ?auto_206462 ) ) ( not ( = ?auto_206461 ?auto_206462 ) ) ( ON ?auto_206460 ?auto_206461 ) ( CLEAR ?auto_206458 ) ( ON ?auto_206459 ?auto_206460 ) ( CLEAR ?auto_206459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206453 ?auto_206454 ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 )
      ( MAKE-9PILE ?auto_206453 ?auto_206454 ?auto_206455 ?auto_206456 ?auto_206457 ?auto_206458 ?auto_206459 ?auto_206460 ?auto_206461 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206472 - BLOCK
      ?auto_206473 - BLOCK
      ?auto_206474 - BLOCK
      ?auto_206475 - BLOCK
      ?auto_206476 - BLOCK
      ?auto_206477 - BLOCK
      ?auto_206478 - BLOCK
      ?auto_206479 - BLOCK
      ?auto_206480 - BLOCK
    )
    :vars
    (
      ?auto_206481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206480 ?auto_206481 ) ( ON-TABLE ?auto_206472 ) ( ON ?auto_206473 ?auto_206472 ) ( ON ?auto_206474 ?auto_206473 ) ( ON ?auto_206475 ?auto_206474 ) ( ON ?auto_206476 ?auto_206475 ) ( ON ?auto_206477 ?auto_206476 ) ( not ( = ?auto_206472 ?auto_206473 ) ) ( not ( = ?auto_206472 ?auto_206474 ) ) ( not ( = ?auto_206472 ?auto_206475 ) ) ( not ( = ?auto_206472 ?auto_206476 ) ) ( not ( = ?auto_206472 ?auto_206477 ) ) ( not ( = ?auto_206472 ?auto_206478 ) ) ( not ( = ?auto_206472 ?auto_206479 ) ) ( not ( = ?auto_206472 ?auto_206480 ) ) ( not ( = ?auto_206472 ?auto_206481 ) ) ( not ( = ?auto_206473 ?auto_206474 ) ) ( not ( = ?auto_206473 ?auto_206475 ) ) ( not ( = ?auto_206473 ?auto_206476 ) ) ( not ( = ?auto_206473 ?auto_206477 ) ) ( not ( = ?auto_206473 ?auto_206478 ) ) ( not ( = ?auto_206473 ?auto_206479 ) ) ( not ( = ?auto_206473 ?auto_206480 ) ) ( not ( = ?auto_206473 ?auto_206481 ) ) ( not ( = ?auto_206474 ?auto_206475 ) ) ( not ( = ?auto_206474 ?auto_206476 ) ) ( not ( = ?auto_206474 ?auto_206477 ) ) ( not ( = ?auto_206474 ?auto_206478 ) ) ( not ( = ?auto_206474 ?auto_206479 ) ) ( not ( = ?auto_206474 ?auto_206480 ) ) ( not ( = ?auto_206474 ?auto_206481 ) ) ( not ( = ?auto_206475 ?auto_206476 ) ) ( not ( = ?auto_206475 ?auto_206477 ) ) ( not ( = ?auto_206475 ?auto_206478 ) ) ( not ( = ?auto_206475 ?auto_206479 ) ) ( not ( = ?auto_206475 ?auto_206480 ) ) ( not ( = ?auto_206475 ?auto_206481 ) ) ( not ( = ?auto_206476 ?auto_206477 ) ) ( not ( = ?auto_206476 ?auto_206478 ) ) ( not ( = ?auto_206476 ?auto_206479 ) ) ( not ( = ?auto_206476 ?auto_206480 ) ) ( not ( = ?auto_206476 ?auto_206481 ) ) ( not ( = ?auto_206477 ?auto_206478 ) ) ( not ( = ?auto_206477 ?auto_206479 ) ) ( not ( = ?auto_206477 ?auto_206480 ) ) ( not ( = ?auto_206477 ?auto_206481 ) ) ( not ( = ?auto_206478 ?auto_206479 ) ) ( not ( = ?auto_206478 ?auto_206480 ) ) ( not ( = ?auto_206478 ?auto_206481 ) ) ( not ( = ?auto_206479 ?auto_206480 ) ) ( not ( = ?auto_206479 ?auto_206481 ) ) ( not ( = ?auto_206480 ?auto_206481 ) ) ( ON ?auto_206479 ?auto_206480 ) ( CLEAR ?auto_206477 ) ( ON ?auto_206478 ?auto_206479 ) ( CLEAR ?auto_206478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206472 ?auto_206473 ?auto_206474 ?auto_206475 ?auto_206476 ?auto_206477 ?auto_206478 )
      ( MAKE-9PILE ?auto_206472 ?auto_206473 ?auto_206474 ?auto_206475 ?auto_206476 ?auto_206477 ?auto_206478 ?auto_206479 ?auto_206480 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206491 - BLOCK
      ?auto_206492 - BLOCK
      ?auto_206493 - BLOCK
      ?auto_206494 - BLOCK
      ?auto_206495 - BLOCK
      ?auto_206496 - BLOCK
      ?auto_206497 - BLOCK
      ?auto_206498 - BLOCK
      ?auto_206499 - BLOCK
    )
    :vars
    (
      ?auto_206500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206499 ?auto_206500 ) ( ON-TABLE ?auto_206491 ) ( ON ?auto_206492 ?auto_206491 ) ( ON ?auto_206493 ?auto_206492 ) ( ON ?auto_206494 ?auto_206493 ) ( ON ?auto_206495 ?auto_206494 ) ( not ( = ?auto_206491 ?auto_206492 ) ) ( not ( = ?auto_206491 ?auto_206493 ) ) ( not ( = ?auto_206491 ?auto_206494 ) ) ( not ( = ?auto_206491 ?auto_206495 ) ) ( not ( = ?auto_206491 ?auto_206496 ) ) ( not ( = ?auto_206491 ?auto_206497 ) ) ( not ( = ?auto_206491 ?auto_206498 ) ) ( not ( = ?auto_206491 ?auto_206499 ) ) ( not ( = ?auto_206491 ?auto_206500 ) ) ( not ( = ?auto_206492 ?auto_206493 ) ) ( not ( = ?auto_206492 ?auto_206494 ) ) ( not ( = ?auto_206492 ?auto_206495 ) ) ( not ( = ?auto_206492 ?auto_206496 ) ) ( not ( = ?auto_206492 ?auto_206497 ) ) ( not ( = ?auto_206492 ?auto_206498 ) ) ( not ( = ?auto_206492 ?auto_206499 ) ) ( not ( = ?auto_206492 ?auto_206500 ) ) ( not ( = ?auto_206493 ?auto_206494 ) ) ( not ( = ?auto_206493 ?auto_206495 ) ) ( not ( = ?auto_206493 ?auto_206496 ) ) ( not ( = ?auto_206493 ?auto_206497 ) ) ( not ( = ?auto_206493 ?auto_206498 ) ) ( not ( = ?auto_206493 ?auto_206499 ) ) ( not ( = ?auto_206493 ?auto_206500 ) ) ( not ( = ?auto_206494 ?auto_206495 ) ) ( not ( = ?auto_206494 ?auto_206496 ) ) ( not ( = ?auto_206494 ?auto_206497 ) ) ( not ( = ?auto_206494 ?auto_206498 ) ) ( not ( = ?auto_206494 ?auto_206499 ) ) ( not ( = ?auto_206494 ?auto_206500 ) ) ( not ( = ?auto_206495 ?auto_206496 ) ) ( not ( = ?auto_206495 ?auto_206497 ) ) ( not ( = ?auto_206495 ?auto_206498 ) ) ( not ( = ?auto_206495 ?auto_206499 ) ) ( not ( = ?auto_206495 ?auto_206500 ) ) ( not ( = ?auto_206496 ?auto_206497 ) ) ( not ( = ?auto_206496 ?auto_206498 ) ) ( not ( = ?auto_206496 ?auto_206499 ) ) ( not ( = ?auto_206496 ?auto_206500 ) ) ( not ( = ?auto_206497 ?auto_206498 ) ) ( not ( = ?auto_206497 ?auto_206499 ) ) ( not ( = ?auto_206497 ?auto_206500 ) ) ( not ( = ?auto_206498 ?auto_206499 ) ) ( not ( = ?auto_206498 ?auto_206500 ) ) ( not ( = ?auto_206499 ?auto_206500 ) ) ( ON ?auto_206498 ?auto_206499 ) ( ON ?auto_206497 ?auto_206498 ) ( CLEAR ?auto_206495 ) ( ON ?auto_206496 ?auto_206497 ) ( CLEAR ?auto_206496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206491 ?auto_206492 ?auto_206493 ?auto_206494 ?auto_206495 ?auto_206496 )
      ( MAKE-9PILE ?auto_206491 ?auto_206492 ?auto_206493 ?auto_206494 ?auto_206495 ?auto_206496 ?auto_206497 ?auto_206498 ?auto_206499 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206510 - BLOCK
      ?auto_206511 - BLOCK
      ?auto_206512 - BLOCK
      ?auto_206513 - BLOCK
      ?auto_206514 - BLOCK
      ?auto_206515 - BLOCK
      ?auto_206516 - BLOCK
      ?auto_206517 - BLOCK
      ?auto_206518 - BLOCK
    )
    :vars
    (
      ?auto_206519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206518 ?auto_206519 ) ( ON-TABLE ?auto_206510 ) ( ON ?auto_206511 ?auto_206510 ) ( ON ?auto_206512 ?auto_206511 ) ( ON ?auto_206513 ?auto_206512 ) ( ON ?auto_206514 ?auto_206513 ) ( not ( = ?auto_206510 ?auto_206511 ) ) ( not ( = ?auto_206510 ?auto_206512 ) ) ( not ( = ?auto_206510 ?auto_206513 ) ) ( not ( = ?auto_206510 ?auto_206514 ) ) ( not ( = ?auto_206510 ?auto_206515 ) ) ( not ( = ?auto_206510 ?auto_206516 ) ) ( not ( = ?auto_206510 ?auto_206517 ) ) ( not ( = ?auto_206510 ?auto_206518 ) ) ( not ( = ?auto_206510 ?auto_206519 ) ) ( not ( = ?auto_206511 ?auto_206512 ) ) ( not ( = ?auto_206511 ?auto_206513 ) ) ( not ( = ?auto_206511 ?auto_206514 ) ) ( not ( = ?auto_206511 ?auto_206515 ) ) ( not ( = ?auto_206511 ?auto_206516 ) ) ( not ( = ?auto_206511 ?auto_206517 ) ) ( not ( = ?auto_206511 ?auto_206518 ) ) ( not ( = ?auto_206511 ?auto_206519 ) ) ( not ( = ?auto_206512 ?auto_206513 ) ) ( not ( = ?auto_206512 ?auto_206514 ) ) ( not ( = ?auto_206512 ?auto_206515 ) ) ( not ( = ?auto_206512 ?auto_206516 ) ) ( not ( = ?auto_206512 ?auto_206517 ) ) ( not ( = ?auto_206512 ?auto_206518 ) ) ( not ( = ?auto_206512 ?auto_206519 ) ) ( not ( = ?auto_206513 ?auto_206514 ) ) ( not ( = ?auto_206513 ?auto_206515 ) ) ( not ( = ?auto_206513 ?auto_206516 ) ) ( not ( = ?auto_206513 ?auto_206517 ) ) ( not ( = ?auto_206513 ?auto_206518 ) ) ( not ( = ?auto_206513 ?auto_206519 ) ) ( not ( = ?auto_206514 ?auto_206515 ) ) ( not ( = ?auto_206514 ?auto_206516 ) ) ( not ( = ?auto_206514 ?auto_206517 ) ) ( not ( = ?auto_206514 ?auto_206518 ) ) ( not ( = ?auto_206514 ?auto_206519 ) ) ( not ( = ?auto_206515 ?auto_206516 ) ) ( not ( = ?auto_206515 ?auto_206517 ) ) ( not ( = ?auto_206515 ?auto_206518 ) ) ( not ( = ?auto_206515 ?auto_206519 ) ) ( not ( = ?auto_206516 ?auto_206517 ) ) ( not ( = ?auto_206516 ?auto_206518 ) ) ( not ( = ?auto_206516 ?auto_206519 ) ) ( not ( = ?auto_206517 ?auto_206518 ) ) ( not ( = ?auto_206517 ?auto_206519 ) ) ( not ( = ?auto_206518 ?auto_206519 ) ) ( ON ?auto_206517 ?auto_206518 ) ( ON ?auto_206516 ?auto_206517 ) ( CLEAR ?auto_206514 ) ( ON ?auto_206515 ?auto_206516 ) ( CLEAR ?auto_206515 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206510 ?auto_206511 ?auto_206512 ?auto_206513 ?auto_206514 ?auto_206515 )
      ( MAKE-9PILE ?auto_206510 ?auto_206511 ?auto_206512 ?auto_206513 ?auto_206514 ?auto_206515 ?auto_206516 ?auto_206517 ?auto_206518 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206529 - BLOCK
      ?auto_206530 - BLOCK
      ?auto_206531 - BLOCK
      ?auto_206532 - BLOCK
      ?auto_206533 - BLOCK
      ?auto_206534 - BLOCK
      ?auto_206535 - BLOCK
      ?auto_206536 - BLOCK
      ?auto_206537 - BLOCK
    )
    :vars
    (
      ?auto_206538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206537 ?auto_206538 ) ( ON-TABLE ?auto_206529 ) ( ON ?auto_206530 ?auto_206529 ) ( ON ?auto_206531 ?auto_206530 ) ( ON ?auto_206532 ?auto_206531 ) ( not ( = ?auto_206529 ?auto_206530 ) ) ( not ( = ?auto_206529 ?auto_206531 ) ) ( not ( = ?auto_206529 ?auto_206532 ) ) ( not ( = ?auto_206529 ?auto_206533 ) ) ( not ( = ?auto_206529 ?auto_206534 ) ) ( not ( = ?auto_206529 ?auto_206535 ) ) ( not ( = ?auto_206529 ?auto_206536 ) ) ( not ( = ?auto_206529 ?auto_206537 ) ) ( not ( = ?auto_206529 ?auto_206538 ) ) ( not ( = ?auto_206530 ?auto_206531 ) ) ( not ( = ?auto_206530 ?auto_206532 ) ) ( not ( = ?auto_206530 ?auto_206533 ) ) ( not ( = ?auto_206530 ?auto_206534 ) ) ( not ( = ?auto_206530 ?auto_206535 ) ) ( not ( = ?auto_206530 ?auto_206536 ) ) ( not ( = ?auto_206530 ?auto_206537 ) ) ( not ( = ?auto_206530 ?auto_206538 ) ) ( not ( = ?auto_206531 ?auto_206532 ) ) ( not ( = ?auto_206531 ?auto_206533 ) ) ( not ( = ?auto_206531 ?auto_206534 ) ) ( not ( = ?auto_206531 ?auto_206535 ) ) ( not ( = ?auto_206531 ?auto_206536 ) ) ( not ( = ?auto_206531 ?auto_206537 ) ) ( not ( = ?auto_206531 ?auto_206538 ) ) ( not ( = ?auto_206532 ?auto_206533 ) ) ( not ( = ?auto_206532 ?auto_206534 ) ) ( not ( = ?auto_206532 ?auto_206535 ) ) ( not ( = ?auto_206532 ?auto_206536 ) ) ( not ( = ?auto_206532 ?auto_206537 ) ) ( not ( = ?auto_206532 ?auto_206538 ) ) ( not ( = ?auto_206533 ?auto_206534 ) ) ( not ( = ?auto_206533 ?auto_206535 ) ) ( not ( = ?auto_206533 ?auto_206536 ) ) ( not ( = ?auto_206533 ?auto_206537 ) ) ( not ( = ?auto_206533 ?auto_206538 ) ) ( not ( = ?auto_206534 ?auto_206535 ) ) ( not ( = ?auto_206534 ?auto_206536 ) ) ( not ( = ?auto_206534 ?auto_206537 ) ) ( not ( = ?auto_206534 ?auto_206538 ) ) ( not ( = ?auto_206535 ?auto_206536 ) ) ( not ( = ?auto_206535 ?auto_206537 ) ) ( not ( = ?auto_206535 ?auto_206538 ) ) ( not ( = ?auto_206536 ?auto_206537 ) ) ( not ( = ?auto_206536 ?auto_206538 ) ) ( not ( = ?auto_206537 ?auto_206538 ) ) ( ON ?auto_206536 ?auto_206537 ) ( ON ?auto_206535 ?auto_206536 ) ( ON ?auto_206534 ?auto_206535 ) ( CLEAR ?auto_206532 ) ( ON ?auto_206533 ?auto_206534 ) ( CLEAR ?auto_206533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206529 ?auto_206530 ?auto_206531 ?auto_206532 ?auto_206533 )
      ( MAKE-9PILE ?auto_206529 ?auto_206530 ?auto_206531 ?auto_206532 ?auto_206533 ?auto_206534 ?auto_206535 ?auto_206536 ?auto_206537 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206548 - BLOCK
      ?auto_206549 - BLOCK
      ?auto_206550 - BLOCK
      ?auto_206551 - BLOCK
      ?auto_206552 - BLOCK
      ?auto_206553 - BLOCK
      ?auto_206554 - BLOCK
      ?auto_206555 - BLOCK
      ?auto_206556 - BLOCK
    )
    :vars
    (
      ?auto_206557 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206556 ?auto_206557 ) ( ON-TABLE ?auto_206548 ) ( ON ?auto_206549 ?auto_206548 ) ( ON ?auto_206550 ?auto_206549 ) ( ON ?auto_206551 ?auto_206550 ) ( not ( = ?auto_206548 ?auto_206549 ) ) ( not ( = ?auto_206548 ?auto_206550 ) ) ( not ( = ?auto_206548 ?auto_206551 ) ) ( not ( = ?auto_206548 ?auto_206552 ) ) ( not ( = ?auto_206548 ?auto_206553 ) ) ( not ( = ?auto_206548 ?auto_206554 ) ) ( not ( = ?auto_206548 ?auto_206555 ) ) ( not ( = ?auto_206548 ?auto_206556 ) ) ( not ( = ?auto_206548 ?auto_206557 ) ) ( not ( = ?auto_206549 ?auto_206550 ) ) ( not ( = ?auto_206549 ?auto_206551 ) ) ( not ( = ?auto_206549 ?auto_206552 ) ) ( not ( = ?auto_206549 ?auto_206553 ) ) ( not ( = ?auto_206549 ?auto_206554 ) ) ( not ( = ?auto_206549 ?auto_206555 ) ) ( not ( = ?auto_206549 ?auto_206556 ) ) ( not ( = ?auto_206549 ?auto_206557 ) ) ( not ( = ?auto_206550 ?auto_206551 ) ) ( not ( = ?auto_206550 ?auto_206552 ) ) ( not ( = ?auto_206550 ?auto_206553 ) ) ( not ( = ?auto_206550 ?auto_206554 ) ) ( not ( = ?auto_206550 ?auto_206555 ) ) ( not ( = ?auto_206550 ?auto_206556 ) ) ( not ( = ?auto_206550 ?auto_206557 ) ) ( not ( = ?auto_206551 ?auto_206552 ) ) ( not ( = ?auto_206551 ?auto_206553 ) ) ( not ( = ?auto_206551 ?auto_206554 ) ) ( not ( = ?auto_206551 ?auto_206555 ) ) ( not ( = ?auto_206551 ?auto_206556 ) ) ( not ( = ?auto_206551 ?auto_206557 ) ) ( not ( = ?auto_206552 ?auto_206553 ) ) ( not ( = ?auto_206552 ?auto_206554 ) ) ( not ( = ?auto_206552 ?auto_206555 ) ) ( not ( = ?auto_206552 ?auto_206556 ) ) ( not ( = ?auto_206552 ?auto_206557 ) ) ( not ( = ?auto_206553 ?auto_206554 ) ) ( not ( = ?auto_206553 ?auto_206555 ) ) ( not ( = ?auto_206553 ?auto_206556 ) ) ( not ( = ?auto_206553 ?auto_206557 ) ) ( not ( = ?auto_206554 ?auto_206555 ) ) ( not ( = ?auto_206554 ?auto_206556 ) ) ( not ( = ?auto_206554 ?auto_206557 ) ) ( not ( = ?auto_206555 ?auto_206556 ) ) ( not ( = ?auto_206555 ?auto_206557 ) ) ( not ( = ?auto_206556 ?auto_206557 ) ) ( ON ?auto_206555 ?auto_206556 ) ( ON ?auto_206554 ?auto_206555 ) ( ON ?auto_206553 ?auto_206554 ) ( CLEAR ?auto_206551 ) ( ON ?auto_206552 ?auto_206553 ) ( CLEAR ?auto_206552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206548 ?auto_206549 ?auto_206550 ?auto_206551 ?auto_206552 )
      ( MAKE-9PILE ?auto_206548 ?auto_206549 ?auto_206550 ?auto_206551 ?auto_206552 ?auto_206553 ?auto_206554 ?auto_206555 ?auto_206556 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206567 - BLOCK
      ?auto_206568 - BLOCK
      ?auto_206569 - BLOCK
      ?auto_206570 - BLOCK
      ?auto_206571 - BLOCK
      ?auto_206572 - BLOCK
      ?auto_206573 - BLOCK
      ?auto_206574 - BLOCK
      ?auto_206575 - BLOCK
    )
    :vars
    (
      ?auto_206576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206575 ?auto_206576 ) ( ON-TABLE ?auto_206567 ) ( ON ?auto_206568 ?auto_206567 ) ( ON ?auto_206569 ?auto_206568 ) ( not ( = ?auto_206567 ?auto_206568 ) ) ( not ( = ?auto_206567 ?auto_206569 ) ) ( not ( = ?auto_206567 ?auto_206570 ) ) ( not ( = ?auto_206567 ?auto_206571 ) ) ( not ( = ?auto_206567 ?auto_206572 ) ) ( not ( = ?auto_206567 ?auto_206573 ) ) ( not ( = ?auto_206567 ?auto_206574 ) ) ( not ( = ?auto_206567 ?auto_206575 ) ) ( not ( = ?auto_206567 ?auto_206576 ) ) ( not ( = ?auto_206568 ?auto_206569 ) ) ( not ( = ?auto_206568 ?auto_206570 ) ) ( not ( = ?auto_206568 ?auto_206571 ) ) ( not ( = ?auto_206568 ?auto_206572 ) ) ( not ( = ?auto_206568 ?auto_206573 ) ) ( not ( = ?auto_206568 ?auto_206574 ) ) ( not ( = ?auto_206568 ?auto_206575 ) ) ( not ( = ?auto_206568 ?auto_206576 ) ) ( not ( = ?auto_206569 ?auto_206570 ) ) ( not ( = ?auto_206569 ?auto_206571 ) ) ( not ( = ?auto_206569 ?auto_206572 ) ) ( not ( = ?auto_206569 ?auto_206573 ) ) ( not ( = ?auto_206569 ?auto_206574 ) ) ( not ( = ?auto_206569 ?auto_206575 ) ) ( not ( = ?auto_206569 ?auto_206576 ) ) ( not ( = ?auto_206570 ?auto_206571 ) ) ( not ( = ?auto_206570 ?auto_206572 ) ) ( not ( = ?auto_206570 ?auto_206573 ) ) ( not ( = ?auto_206570 ?auto_206574 ) ) ( not ( = ?auto_206570 ?auto_206575 ) ) ( not ( = ?auto_206570 ?auto_206576 ) ) ( not ( = ?auto_206571 ?auto_206572 ) ) ( not ( = ?auto_206571 ?auto_206573 ) ) ( not ( = ?auto_206571 ?auto_206574 ) ) ( not ( = ?auto_206571 ?auto_206575 ) ) ( not ( = ?auto_206571 ?auto_206576 ) ) ( not ( = ?auto_206572 ?auto_206573 ) ) ( not ( = ?auto_206572 ?auto_206574 ) ) ( not ( = ?auto_206572 ?auto_206575 ) ) ( not ( = ?auto_206572 ?auto_206576 ) ) ( not ( = ?auto_206573 ?auto_206574 ) ) ( not ( = ?auto_206573 ?auto_206575 ) ) ( not ( = ?auto_206573 ?auto_206576 ) ) ( not ( = ?auto_206574 ?auto_206575 ) ) ( not ( = ?auto_206574 ?auto_206576 ) ) ( not ( = ?auto_206575 ?auto_206576 ) ) ( ON ?auto_206574 ?auto_206575 ) ( ON ?auto_206573 ?auto_206574 ) ( ON ?auto_206572 ?auto_206573 ) ( ON ?auto_206571 ?auto_206572 ) ( CLEAR ?auto_206569 ) ( ON ?auto_206570 ?auto_206571 ) ( CLEAR ?auto_206570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206567 ?auto_206568 ?auto_206569 ?auto_206570 )
      ( MAKE-9PILE ?auto_206567 ?auto_206568 ?auto_206569 ?auto_206570 ?auto_206571 ?auto_206572 ?auto_206573 ?auto_206574 ?auto_206575 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206586 - BLOCK
      ?auto_206587 - BLOCK
      ?auto_206588 - BLOCK
      ?auto_206589 - BLOCK
      ?auto_206590 - BLOCK
      ?auto_206591 - BLOCK
      ?auto_206592 - BLOCK
      ?auto_206593 - BLOCK
      ?auto_206594 - BLOCK
    )
    :vars
    (
      ?auto_206595 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206594 ?auto_206595 ) ( ON-TABLE ?auto_206586 ) ( ON ?auto_206587 ?auto_206586 ) ( ON ?auto_206588 ?auto_206587 ) ( not ( = ?auto_206586 ?auto_206587 ) ) ( not ( = ?auto_206586 ?auto_206588 ) ) ( not ( = ?auto_206586 ?auto_206589 ) ) ( not ( = ?auto_206586 ?auto_206590 ) ) ( not ( = ?auto_206586 ?auto_206591 ) ) ( not ( = ?auto_206586 ?auto_206592 ) ) ( not ( = ?auto_206586 ?auto_206593 ) ) ( not ( = ?auto_206586 ?auto_206594 ) ) ( not ( = ?auto_206586 ?auto_206595 ) ) ( not ( = ?auto_206587 ?auto_206588 ) ) ( not ( = ?auto_206587 ?auto_206589 ) ) ( not ( = ?auto_206587 ?auto_206590 ) ) ( not ( = ?auto_206587 ?auto_206591 ) ) ( not ( = ?auto_206587 ?auto_206592 ) ) ( not ( = ?auto_206587 ?auto_206593 ) ) ( not ( = ?auto_206587 ?auto_206594 ) ) ( not ( = ?auto_206587 ?auto_206595 ) ) ( not ( = ?auto_206588 ?auto_206589 ) ) ( not ( = ?auto_206588 ?auto_206590 ) ) ( not ( = ?auto_206588 ?auto_206591 ) ) ( not ( = ?auto_206588 ?auto_206592 ) ) ( not ( = ?auto_206588 ?auto_206593 ) ) ( not ( = ?auto_206588 ?auto_206594 ) ) ( not ( = ?auto_206588 ?auto_206595 ) ) ( not ( = ?auto_206589 ?auto_206590 ) ) ( not ( = ?auto_206589 ?auto_206591 ) ) ( not ( = ?auto_206589 ?auto_206592 ) ) ( not ( = ?auto_206589 ?auto_206593 ) ) ( not ( = ?auto_206589 ?auto_206594 ) ) ( not ( = ?auto_206589 ?auto_206595 ) ) ( not ( = ?auto_206590 ?auto_206591 ) ) ( not ( = ?auto_206590 ?auto_206592 ) ) ( not ( = ?auto_206590 ?auto_206593 ) ) ( not ( = ?auto_206590 ?auto_206594 ) ) ( not ( = ?auto_206590 ?auto_206595 ) ) ( not ( = ?auto_206591 ?auto_206592 ) ) ( not ( = ?auto_206591 ?auto_206593 ) ) ( not ( = ?auto_206591 ?auto_206594 ) ) ( not ( = ?auto_206591 ?auto_206595 ) ) ( not ( = ?auto_206592 ?auto_206593 ) ) ( not ( = ?auto_206592 ?auto_206594 ) ) ( not ( = ?auto_206592 ?auto_206595 ) ) ( not ( = ?auto_206593 ?auto_206594 ) ) ( not ( = ?auto_206593 ?auto_206595 ) ) ( not ( = ?auto_206594 ?auto_206595 ) ) ( ON ?auto_206593 ?auto_206594 ) ( ON ?auto_206592 ?auto_206593 ) ( ON ?auto_206591 ?auto_206592 ) ( ON ?auto_206590 ?auto_206591 ) ( CLEAR ?auto_206588 ) ( ON ?auto_206589 ?auto_206590 ) ( CLEAR ?auto_206589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206586 ?auto_206587 ?auto_206588 ?auto_206589 )
      ( MAKE-9PILE ?auto_206586 ?auto_206587 ?auto_206588 ?auto_206589 ?auto_206590 ?auto_206591 ?auto_206592 ?auto_206593 ?auto_206594 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206605 - BLOCK
      ?auto_206606 - BLOCK
      ?auto_206607 - BLOCK
      ?auto_206608 - BLOCK
      ?auto_206609 - BLOCK
      ?auto_206610 - BLOCK
      ?auto_206611 - BLOCK
      ?auto_206612 - BLOCK
      ?auto_206613 - BLOCK
    )
    :vars
    (
      ?auto_206614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206613 ?auto_206614 ) ( ON-TABLE ?auto_206605 ) ( ON ?auto_206606 ?auto_206605 ) ( not ( = ?auto_206605 ?auto_206606 ) ) ( not ( = ?auto_206605 ?auto_206607 ) ) ( not ( = ?auto_206605 ?auto_206608 ) ) ( not ( = ?auto_206605 ?auto_206609 ) ) ( not ( = ?auto_206605 ?auto_206610 ) ) ( not ( = ?auto_206605 ?auto_206611 ) ) ( not ( = ?auto_206605 ?auto_206612 ) ) ( not ( = ?auto_206605 ?auto_206613 ) ) ( not ( = ?auto_206605 ?auto_206614 ) ) ( not ( = ?auto_206606 ?auto_206607 ) ) ( not ( = ?auto_206606 ?auto_206608 ) ) ( not ( = ?auto_206606 ?auto_206609 ) ) ( not ( = ?auto_206606 ?auto_206610 ) ) ( not ( = ?auto_206606 ?auto_206611 ) ) ( not ( = ?auto_206606 ?auto_206612 ) ) ( not ( = ?auto_206606 ?auto_206613 ) ) ( not ( = ?auto_206606 ?auto_206614 ) ) ( not ( = ?auto_206607 ?auto_206608 ) ) ( not ( = ?auto_206607 ?auto_206609 ) ) ( not ( = ?auto_206607 ?auto_206610 ) ) ( not ( = ?auto_206607 ?auto_206611 ) ) ( not ( = ?auto_206607 ?auto_206612 ) ) ( not ( = ?auto_206607 ?auto_206613 ) ) ( not ( = ?auto_206607 ?auto_206614 ) ) ( not ( = ?auto_206608 ?auto_206609 ) ) ( not ( = ?auto_206608 ?auto_206610 ) ) ( not ( = ?auto_206608 ?auto_206611 ) ) ( not ( = ?auto_206608 ?auto_206612 ) ) ( not ( = ?auto_206608 ?auto_206613 ) ) ( not ( = ?auto_206608 ?auto_206614 ) ) ( not ( = ?auto_206609 ?auto_206610 ) ) ( not ( = ?auto_206609 ?auto_206611 ) ) ( not ( = ?auto_206609 ?auto_206612 ) ) ( not ( = ?auto_206609 ?auto_206613 ) ) ( not ( = ?auto_206609 ?auto_206614 ) ) ( not ( = ?auto_206610 ?auto_206611 ) ) ( not ( = ?auto_206610 ?auto_206612 ) ) ( not ( = ?auto_206610 ?auto_206613 ) ) ( not ( = ?auto_206610 ?auto_206614 ) ) ( not ( = ?auto_206611 ?auto_206612 ) ) ( not ( = ?auto_206611 ?auto_206613 ) ) ( not ( = ?auto_206611 ?auto_206614 ) ) ( not ( = ?auto_206612 ?auto_206613 ) ) ( not ( = ?auto_206612 ?auto_206614 ) ) ( not ( = ?auto_206613 ?auto_206614 ) ) ( ON ?auto_206612 ?auto_206613 ) ( ON ?auto_206611 ?auto_206612 ) ( ON ?auto_206610 ?auto_206611 ) ( ON ?auto_206609 ?auto_206610 ) ( ON ?auto_206608 ?auto_206609 ) ( CLEAR ?auto_206606 ) ( ON ?auto_206607 ?auto_206608 ) ( CLEAR ?auto_206607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206605 ?auto_206606 ?auto_206607 )
      ( MAKE-9PILE ?auto_206605 ?auto_206606 ?auto_206607 ?auto_206608 ?auto_206609 ?auto_206610 ?auto_206611 ?auto_206612 ?auto_206613 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206624 - BLOCK
      ?auto_206625 - BLOCK
      ?auto_206626 - BLOCK
      ?auto_206627 - BLOCK
      ?auto_206628 - BLOCK
      ?auto_206629 - BLOCK
      ?auto_206630 - BLOCK
      ?auto_206631 - BLOCK
      ?auto_206632 - BLOCK
    )
    :vars
    (
      ?auto_206633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206632 ?auto_206633 ) ( ON-TABLE ?auto_206624 ) ( ON ?auto_206625 ?auto_206624 ) ( not ( = ?auto_206624 ?auto_206625 ) ) ( not ( = ?auto_206624 ?auto_206626 ) ) ( not ( = ?auto_206624 ?auto_206627 ) ) ( not ( = ?auto_206624 ?auto_206628 ) ) ( not ( = ?auto_206624 ?auto_206629 ) ) ( not ( = ?auto_206624 ?auto_206630 ) ) ( not ( = ?auto_206624 ?auto_206631 ) ) ( not ( = ?auto_206624 ?auto_206632 ) ) ( not ( = ?auto_206624 ?auto_206633 ) ) ( not ( = ?auto_206625 ?auto_206626 ) ) ( not ( = ?auto_206625 ?auto_206627 ) ) ( not ( = ?auto_206625 ?auto_206628 ) ) ( not ( = ?auto_206625 ?auto_206629 ) ) ( not ( = ?auto_206625 ?auto_206630 ) ) ( not ( = ?auto_206625 ?auto_206631 ) ) ( not ( = ?auto_206625 ?auto_206632 ) ) ( not ( = ?auto_206625 ?auto_206633 ) ) ( not ( = ?auto_206626 ?auto_206627 ) ) ( not ( = ?auto_206626 ?auto_206628 ) ) ( not ( = ?auto_206626 ?auto_206629 ) ) ( not ( = ?auto_206626 ?auto_206630 ) ) ( not ( = ?auto_206626 ?auto_206631 ) ) ( not ( = ?auto_206626 ?auto_206632 ) ) ( not ( = ?auto_206626 ?auto_206633 ) ) ( not ( = ?auto_206627 ?auto_206628 ) ) ( not ( = ?auto_206627 ?auto_206629 ) ) ( not ( = ?auto_206627 ?auto_206630 ) ) ( not ( = ?auto_206627 ?auto_206631 ) ) ( not ( = ?auto_206627 ?auto_206632 ) ) ( not ( = ?auto_206627 ?auto_206633 ) ) ( not ( = ?auto_206628 ?auto_206629 ) ) ( not ( = ?auto_206628 ?auto_206630 ) ) ( not ( = ?auto_206628 ?auto_206631 ) ) ( not ( = ?auto_206628 ?auto_206632 ) ) ( not ( = ?auto_206628 ?auto_206633 ) ) ( not ( = ?auto_206629 ?auto_206630 ) ) ( not ( = ?auto_206629 ?auto_206631 ) ) ( not ( = ?auto_206629 ?auto_206632 ) ) ( not ( = ?auto_206629 ?auto_206633 ) ) ( not ( = ?auto_206630 ?auto_206631 ) ) ( not ( = ?auto_206630 ?auto_206632 ) ) ( not ( = ?auto_206630 ?auto_206633 ) ) ( not ( = ?auto_206631 ?auto_206632 ) ) ( not ( = ?auto_206631 ?auto_206633 ) ) ( not ( = ?auto_206632 ?auto_206633 ) ) ( ON ?auto_206631 ?auto_206632 ) ( ON ?auto_206630 ?auto_206631 ) ( ON ?auto_206629 ?auto_206630 ) ( ON ?auto_206628 ?auto_206629 ) ( ON ?auto_206627 ?auto_206628 ) ( CLEAR ?auto_206625 ) ( ON ?auto_206626 ?auto_206627 ) ( CLEAR ?auto_206626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_206624 ?auto_206625 ?auto_206626 )
      ( MAKE-9PILE ?auto_206624 ?auto_206625 ?auto_206626 ?auto_206627 ?auto_206628 ?auto_206629 ?auto_206630 ?auto_206631 ?auto_206632 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206643 - BLOCK
      ?auto_206644 - BLOCK
      ?auto_206645 - BLOCK
      ?auto_206646 - BLOCK
      ?auto_206647 - BLOCK
      ?auto_206648 - BLOCK
      ?auto_206649 - BLOCK
      ?auto_206650 - BLOCK
      ?auto_206651 - BLOCK
    )
    :vars
    (
      ?auto_206652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206651 ?auto_206652 ) ( ON-TABLE ?auto_206643 ) ( not ( = ?auto_206643 ?auto_206644 ) ) ( not ( = ?auto_206643 ?auto_206645 ) ) ( not ( = ?auto_206643 ?auto_206646 ) ) ( not ( = ?auto_206643 ?auto_206647 ) ) ( not ( = ?auto_206643 ?auto_206648 ) ) ( not ( = ?auto_206643 ?auto_206649 ) ) ( not ( = ?auto_206643 ?auto_206650 ) ) ( not ( = ?auto_206643 ?auto_206651 ) ) ( not ( = ?auto_206643 ?auto_206652 ) ) ( not ( = ?auto_206644 ?auto_206645 ) ) ( not ( = ?auto_206644 ?auto_206646 ) ) ( not ( = ?auto_206644 ?auto_206647 ) ) ( not ( = ?auto_206644 ?auto_206648 ) ) ( not ( = ?auto_206644 ?auto_206649 ) ) ( not ( = ?auto_206644 ?auto_206650 ) ) ( not ( = ?auto_206644 ?auto_206651 ) ) ( not ( = ?auto_206644 ?auto_206652 ) ) ( not ( = ?auto_206645 ?auto_206646 ) ) ( not ( = ?auto_206645 ?auto_206647 ) ) ( not ( = ?auto_206645 ?auto_206648 ) ) ( not ( = ?auto_206645 ?auto_206649 ) ) ( not ( = ?auto_206645 ?auto_206650 ) ) ( not ( = ?auto_206645 ?auto_206651 ) ) ( not ( = ?auto_206645 ?auto_206652 ) ) ( not ( = ?auto_206646 ?auto_206647 ) ) ( not ( = ?auto_206646 ?auto_206648 ) ) ( not ( = ?auto_206646 ?auto_206649 ) ) ( not ( = ?auto_206646 ?auto_206650 ) ) ( not ( = ?auto_206646 ?auto_206651 ) ) ( not ( = ?auto_206646 ?auto_206652 ) ) ( not ( = ?auto_206647 ?auto_206648 ) ) ( not ( = ?auto_206647 ?auto_206649 ) ) ( not ( = ?auto_206647 ?auto_206650 ) ) ( not ( = ?auto_206647 ?auto_206651 ) ) ( not ( = ?auto_206647 ?auto_206652 ) ) ( not ( = ?auto_206648 ?auto_206649 ) ) ( not ( = ?auto_206648 ?auto_206650 ) ) ( not ( = ?auto_206648 ?auto_206651 ) ) ( not ( = ?auto_206648 ?auto_206652 ) ) ( not ( = ?auto_206649 ?auto_206650 ) ) ( not ( = ?auto_206649 ?auto_206651 ) ) ( not ( = ?auto_206649 ?auto_206652 ) ) ( not ( = ?auto_206650 ?auto_206651 ) ) ( not ( = ?auto_206650 ?auto_206652 ) ) ( not ( = ?auto_206651 ?auto_206652 ) ) ( ON ?auto_206650 ?auto_206651 ) ( ON ?auto_206649 ?auto_206650 ) ( ON ?auto_206648 ?auto_206649 ) ( ON ?auto_206647 ?auto_206648 ) ( ON ?auto_206646 ?auto_206647 ) ( ON ?auto_206645 ?auto_206646 ) ( CLEAR ?auto_206643 ) ( ON ?auto_206644 ?auto_206645 ) ( CLEAR ?auto_206644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206643 ?auto_206644 )
      ( MAKE-9PILE ?auto_206643 ?auto_206644 ?auto_206645 ?auto_206646 ?auto_206647 ?auto_206648 ?auto_206649 ?auto_206650 ?auto_206651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206662 - BLOCK
      ?auto_206663 - BLOCK
      ?auto_206664 - BLOCK
      ?auto_206665 - BLOCK
      ?auto_206666 - BLOCK
      ?auto_206667 - BLOCK
      ?auto_206668 - BLOCK
      ?auto_206669 - BLOCK
      ?auto_206670 - BLOCK
    )
    :vars
    (
      ?auto_206671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206670 ?auto_206671 ) ( ON-TABLE ?auto_206662 ) ( not ( = ?auto_206662 ?auto_206663 ) ) ( not ( = ?auto_206662 ?auto_206664 ) ) ( not ( = ?auto_206662 ?auto_206665 ) ) ( not ( = ?auto_206662 ?auto_206666 ) ) ( not ( = ?auto_206662 ?auto_206667 ) ) ( not ( = ?auto_206662 ?auto_206668 ) ) ( not ( = ?auto_206662 ?auto_206669 ) ) ( not ( = ?auto_206662 ?auto_206670 ) ) ( not ( = ?auto_206662 ?auto_206671 ) ) ( not ( = ?auto_206663 ?auto_206664 ) ) ( not ( = ?auto_206663 ?auto_206665 ) ) ( not ( = ?auto_206663 ?auto_206666 ) ) ( not ( = ?auto_206663 ?auto_206667 ) ) ( not ( = ?auto_206663 ?auto_206668 ) ) ( not ( = ?auto_206663 ?auto_206669 ) ) ( not ( = ?auto_206663 ?auto_206670 ) ) ( not ( = ?auto_206663 ?auto_206671 ) ) ( not ( = ?auto_206664 ?auto_206665 ) ) ( not ( = ?auto_206664 ?auto_206666 ) ) ( not ( = ?auto_206664 ?auto_206667 ) ) ( not ( = ?auto_206664 ?auto_206668 ) ) ( not ( = ?auto_206664 ?auto_206669 ) ) ( not ( = ?auto_206664 ?auto_206670 ) ) ( not ( = ?auto_206664 ?auto_206671 ) ) ( not ( = ?auto_206665 ?auto_206666 ) ) ( not ( = ?auto_206665 ?auto_206667 ) ) ( not ( = ?auto_206665 ?auto_206668 ) ) ( not ( = ?auto_206665 ?auto_206669 ) ) ( not ( = ?auto_206665 ?auto_206670 ) ) ( not ( = ?auto_206665 ?auto_206671 ) ) ( not ( = ?auto_206666 ?auto_206667 ) ) ( not ( = ?auto_206666 ?auto_206668 ) ) ( not ( = ?auto_206666 ?auto_206669 ) ) ( not ( = ?auto_206666 ?auto_206670 ) ) ( not ( = ?auto_206666 ?auto_206671 ) ) ( not ( = ?auto_206667 ?auto_206668 ) ) ( not ( = ?auto_206667 ?auto_206669 ) ) ( not ( = ?auto_206667 ?auto_206670 ) ) ( not ( = ?auto_206667 ?auto_206671 ) ) ( not ( = ?auto_206668 ?auto_206669 ) ) ( not ( = ?auto_206668 ?auto_206670 ) ) ( not ( = ?auto_206668 ?auto_206671 ) ) ( not ( = ?auto_206669 ?auto_206670 ) ) ( not ( = ?auto_206669 ?auto_206671 ) ) ( not ( = ?auto_206670 ?auto_206671 ) ) ( ON ?auto_206669 ?auto_206670 ) ( ON ?auto_206668 ?auto_206669 ) ( ON ?auto_206667 ?auto_206668 ) ( ON ?auto_206666 ?auto_206667 ) ( ON ?auto_206665 ?auto_206666 ) ( ON ?auto_206664 ?auto_206665 ) ( CLEAR ?auto_206662 ) ( ON ?auto_206663 ?auto_206664 ) ( CLEAR ?auto_206663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_206662 ?auto_206663 )
      ( MAKE-9PILE ?auto_206662 ?auto_206663 ?auto_206664 ?auto_206665 ?auto_206666 ?auto_206667 ?auto_206668 ?auto_206669 ?auto_206670 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206681 - BLOCK
      ?auto_206682 - BLOCK
      ?auto_206683 - BLOCK
      ?auto_206684 - BLOCK
      ?auto_206685 - BLOCK
      ?auto_206686 - BLOCK
      ?auto_206687 - BLOCK
      ?auto_206688 - BLOCK
      ?auto_206689 - BLOCK
    )
    :vars
    (
      ?auto_206690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206689 ?auto_206690 ) ( not ( = ?auto_206681 ?auto_206682 ) ) ( not ( = ?auto_206681 ?auto_206683 ) ) ( not ( = ?auto_206681 ?auto_206684 ) ) ( not ( = ?auto_206681 ?auto_206685 ) ) ( not ( = ?auto_206681 ?auto_206686 ) ) ( not ( = ?auto_206681 ?auto_206687 ) ) ( not ( = ?auto_206681 ?auto_206688 ) ) ( not ( = ?auto_206681 ?auto_206689 ) ) ( not ( = ?auto_206681 ?auto_206690 ) ) ( not ( = ?auto_206682 ?auto_206683 ) ) ( not ( = ?auto_206682 ?auto_206684 ) ) ( not ( = ?auto_206682 ?auto_206685 ) ) ( not ( = ?auto_206682 ?auto_206686 ) ) ( not ( = ?auto_206682 ?auto_206687 ) ) ( not ( = ?auto_206682 ?auto_206688 ) ) ( not ( = ?auto_206682 ?auto_206689 ) ) ( not ( = ?auto_206682 ?auto_206690 ) ) ( not ( = ?auto_206683 ?auto_206684 ) ) ( not ( = ?auto_206683 ?auto_206685 ) ) ( not ( = ?auto_206683 ?auto_206686 ) ) ( not ( = ?auto_206683 ?auto_206687 ) ) ( not ( = ?auto_206683 ?auto_206688 ) ) ( not ( = ?auto_206683 ?auto_206689 ) ) ( not ( = ?auto_206683 ?auto_206690 ) ) ( not ( = ?auto_206684 ?auto_206685 ) ) ( not ( = ?auto_206684 ?auto_206686 ) ) ( not ( = ?auto_206684 ?auto_206687 ) ) ( not ( = ?auto_206684 ?auto_206688 ) ) ( not ( = ?auto_206684 ?auto_206689 ) ) ( not ( = ?auto_206684 ?auto_206690 ) ) ( not ( = ?auto_206685 ?auto_206686 ) ) ( not ( = ?auto_206685 ?auto_206687 ) ) ( not ( = ?auto_206685 ?auto_206688 ) ) ( not ( = ?auto_206685 ?auto_206689 ) ) ( not ( = ?auto_206685 ?auto_206690 ) ) ( not ( = ?auto_206686 ?auto_206687 ) ) ( not ( = ?auto_206686 ?auto_206688 ) ) ( not ( = ?auto_206686 ?auto_206689 ) ) ( not ( = ?auto_206686 ?auto_206690 ) ) ( not ( = ?auto_206687 ?auto_206688 ) ) ( not ( = ?auto_206687 ?auto_206689 ) ) ( not ( = ?auto_206687 ?auto_206690 ) ) ( not ( = ?auto_206688 ?auto_206689 ) ) ( not ( = ?auto_206688 ?auto_206690 ) ) ( not ( = ?auto_206689 ?auto_206690 ) ) ( ON ?auto_206688 ?auto_206689 ) ( ON ?auto_206687 ?auto_206688 ) ( ON ?auto_206686 ?auto_206687 ) ( ON ?auto_206685 ?auto_206686 ) ( ON ?auto_206684 ?auto_206685 ) ( ON ?auto_206683 ?auto_206684 ) ( ON ?auto_206682 ?auto_206683 ) ( ON ?auto_206681 ?auto_206682 ) ( CLEAR ?auto_206681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206681 )
      ( MAKE-9PILE ?auto_206681 ?auto_206682 ?auto_206683 ?auto_206684 ?auto_206685 ?auto_206686 ?auto_206687 ?auto_206688 ?auto_206689 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_206700 - BLOCK
      ?auto_206701 - BLOCK
      ?auto_206702 - BLOCK
      ?auto_206703 - BLOCK
      ?auto_206704 - BLOCK
      ?auto_206705 - BLOCK
      ?auto_206706 - BLOCK
      ?auto_206707 - BLOCK
      ?auto_206708 - BLOCK
    )
    :vars
    (
      ?auto_206709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206708 ?auto_206709 ) ( not ( = ?auto_206700 ?auto_206701 ) ) ( not ( = ?auto_206700 ?auto_206702 ) ) ( not ( = ?auto_206700 ?auto_206703 ) ) ( not ( = ?auto_206700 ?auto_206704 ) ) ( not ( = ?auto_206700 ?auto_206705 ) ) ( not ( = ?auto_206700 ?auto_206706 ) ) ( not ( = ?auto_206700 ?auto_206707 ) ) ( not ( = ?auto_206700 ?auto_206708 ) ) ( not ( = ?auto_206700 ?auto_206709 ) ) ( not ( = ?auto_206701 ?auto_206702 ) ) ( not ( = ?auto_206701 ?auto_206703 ) ) ( not ( = ?auto_206701 ?auto_206704 ) ) ( not ( = ?auto_206701 ?auto_206705 ) ) ( not ( = ?auto_206701 ?auto_206706 ) ) ( not ( = ?auto_206701 ?auto_206707 ) ) ( not ( = ?auto_206701 ?auto_206708 ) ) ( not ( = ?auto_206701 ?auto_206709 ) ) ( not ( = ?auto_206702 ?auto_206703 ) ) ( not ( = ?auto_206702 ?auto_206704 ) ) ( not ( = ?auto_206702 ?auto_206705 ) ) ( not ( = ?auto_206702 ?auto_206706 ) ) ( not ( = ?auto_206702 ?auto_206707 ) ) ( not ( = ?auto_206702 ?auto_206708 ) ) ( not ( = ?auto_206702 ?auto_206709 ) ) ( not ( = ?auto_206703 ?auto_206704 ) ) ( not ( = ?auto_206703 ?auto_206705 ) ) ( not ( = ?auto_206703 ?auto_206706 ) ) ( not ( = ?auto_206703 ?auto_206707 ) ) ( not ( = ?auto_206703 ?auto_206708 ) ) ( not ( = ?auto_206703 ?auto_206709 ) ) ( not ( = ?auto_206704 ?auto_206705 ) ) ( not ( = ?auto_206704 ?auto_206706 ) ) ( not ( = ?auto_206704 ?auto_206707 ) ) ( not ( = ?auto_206704 ?auto_206708 ) ) ( not ( = ?auto_206704 ?auto_206709 ) ) ( not ( = ?auto_206705 ?auto_206706 ) ) ( not ( = ?auto_206705 ?auto_206707 ) ) ( not ( = ?auto_206705 ?auto_206708 ) ) ( not ( = ?auto_206705 ?auto_206709 ) ) ( not ( = ?auto_206706 ?auto_206707 ) ) ( not ( = ?auto_206706 ?auto_206708 ) ) ( not ( = ?auto_206706 ?auto_206709 ) ) ( not ( = ?auto_206707 ?auto_206708 ) ) ( not ( = ?auto_206707 ?auto_206709 ) ) ( not ( = ?auto_206708 ?auto_206709 ) ) ( ON ?auto_206707 ?auto_206708 ) ( ON ?auto_206706 ?auto_206707 ) ( ON ?auto_206705 ?auto_206706 ) ( ON ?auto_206704 ?auto_206705 ) ( ON ?auto_206703 ?auto_206704 ) ( ON ?auto_206702 ?auto_206703 ) ( ON ?auto_206701 ?auto_206702 ) ( ON ?auto_206700 ?auto_206701 ) ( CLEAR ?auto_206700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_206700 )
      ( MAKE-9PILE ?auto_206700 ?auto_206701 ?auto_206702 ?auto_206703 ?auto_206704 ?auto_206705 ?auto_206706 ?auto_206707 ?auto_206708 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206720 - BLOCK
      ?auto_206721 - BLOCK
      ?auto_206722 - BLOCK
      ?auto_206723 - BLOCK
      ?auto_206724 - BLOCK
      ?auto_206725 - BLOCK
      ?auto_206726 - BLOCK
      ?auto_206727 - BLOCK
      ?auto_206728 - BLOCK
      ?auto_206729 - BLOCK
    )
    :vars
    (
      ?auto_206730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206728 ) ( ON ?auto_206729 ?auto_206730 ) ( CLEAR ?auto_206729 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206720 ) ( ON ?auto_206721 ?auto_206720 ) ( ON ?auto_206722 ?auto_206721 ) ( ON ?auto_206723 ?auto_206722 ) ( ON ?auto_206724 ?auto_206723 ) ( ON ?auto_206725 ?auto_206724 ) ( ON ?auto_206726 ?auto_206725 ) ( ON ?auto_206727 ?auto_206726 ) ( ON ?auto_206728 ?auto_206727 ) ( not ( = ?auto_206720 ?auto_206721 ) ) ( not ( = ?auto_206720 ?auto_206722 ) ) ( not ( = ?auto_206720 ?auto_206723 ) ) ( not ( = ?auto_206720 ?auto_206724 ) ) ( not ( = ?auto_206720 ?auto_206725 ) ) ( not ( = ?auto_206720 ?auto_206726 ) ) ( not ( = ?auto_206720 ?auto_206727 ) ) ( not ( = ?auto_206720 ?auto_206728 ) ) ( not ( = ?auto_206720 ?auto_206729 ) ) ( not ( = ?auto_206720 ?auto_206730 ) ) ( not ( = ?auto_206721 ?auto_206722 ) ) ( not ( = ?auto_206721 ?auto_206723 ) ) ( not ( = ?auto_206721 ?auto_206724 ) ) ( not ( = ?auto_206721 ?auto_206725 ) ) ( not ( = ?auto_206721 ?auto_206726 ) ) ( not ( = ?auto_206721 ?auto_206727 ) ) ( not ( = ?auto_206721 ?auto_206728 ) ) ( not ( = ?auto_206721 ?auto_206729 ) ) ( not ( = ?auto_206721 ?auto_206730 ) ) ( not ( = ?auto_206722 ?auto_206723 ) ) ( not ( = ?auto_206722 ?auto_206724 ) ) ( not ( = ?auto_206722 ?auto_206725 ) ) ( not ( = ?auto_206722 ?auto_206726 ) ) ( not ( = ?auto_206722 ?auto_206727 ) ) ( not ( = ?auto_206722 ?auto_206728 ) ) ( not ( = ?auto_206722 ?auto_206729 ) ) ( not ( = ?auto_206722 ?auto_206730 ) ) ( not ( = ?auto_206723 ?auto_206724 ) ) ( not ( = ?auto_206723 ?auto_206725 ) ) ( not ( = ?auto_206723 ?auto_206726 ) ) ( not ( = ?auto_206723 ?auto_206727 ) ) ( not ( = ?auto_206723 ?auto_206728 ) ) ( not ( = ?auto_206723 ?auto_206729 ) ) ( not ( = ?auto_206723 ?auto_206730 ) ) ( not ( = ?auto_206724 ?auto_206725 ) ) ( not ( = ?auto_206724 ?auto_206726 ) ) ( not ( = ?auto_206724 ?auto_206727 ) ) ( not ( = ?auto_206724 ?auto_206728 ) ) ( not ( = ?auto_206724 ?auto_206729 ) ) ( not ( = ?auto_206724 ?auto_206730 ) ) ( not ( = ?auto_206725 ?auto_206726 ) ) ( not ( = ?auto_206725 ?auto_206727 ) ) ( not ( = ?auto_206725 ?auto_206728 ) ) ( not ( = ?auto_206725 ?auto_206729 ) ) ( not ( = ?auto_206725 ?auto_206730 ) ) ( not ( = ?auto_206726 ?auto_206727 ) ) ( not ( = ?auto_206726 ?auto_206728 ) ) ( not ( = ?auto_206726 ?auto_206729 ) ) ( not ( = ?auto_206726 ?auto_206730 ) ) ( not ( = ?auto_206727 ?auto_206728 ) ) ( not ( = ?auto_206727 ?auto_206729 ) ) ( not ( = ?auto_206727 ?auto_206730 ) ) ( not ( = ?auto_206728 ?auto_206729 ) ) ( not ( = ?auto_206728 ?auto_206730 ) ) ( not ( = ?auto_206729 ?auto_206730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206729 ?auto_206730 )
      ( !STACK ?auto_206729 ?auto_206728 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206741 - BLOCK
      ?auto_206742 - BLOCK
      ?auto_206743 - BLOCK
      ?auto_206744 - BLOCK
      ?auto_206745 - BLOCK
      ?auto_206746 - BLOCK
      ?auto_206747 - BLOCK
      ?auto_206748 - BLOCK
      ?auto_206749 - BLOCK
      ?auto_206750 - BLOCK
    )
    :vars
    (
      ?auto_206751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_206749 ) ( ON ?auto_206750 ?auto_206751 ) ( CLEAR ?auto_206750 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_206741 ) ( ON ?auto_206742 ?auto_206741 ) ( ON ?auto_206743 ?auto_206742 ) ( ON ?auto_206744 ?auto_206743 ) ( ON ?auto_206745 ?auto_206744 ) ( ON ?auto_206746 ?auto_206745 ) ( ON ?auto_206747 ?auto_206746 ) ( ON ?auto_206748 ?auto_206747 ) ( ON ?auto_206749 ?auto_206748 ) ( not ( = ?auto_206741 ?auto_206742 ) ) ( not ( = ?auto_206741 ?auto_206743 ) ) ( not ( = ?auto_206741 ?auto_206744 ) ) ( not ( = ?auto_206741 ?auto_206745 ) ) ( not ( = ?auto_206741 ?auto_206746 ) ) ( not ( = ?auto_206741 ?auto_206747 ) ) ( not ( = ?auto_206741 ?auto_206748 ) ) ( not ( = ?auto_206741 ?auto_206749 ) ) ( not ( = ?auto_206741 ?auto_206750 ) ) ( not ( = ?auto_206741 ?auto_206751 ) ) ( not ( = ?auto_206742 ?auto_206743 ) ) ( not ( = ?auto_206742 ?auto_206744 ) ) ( not ( = ?auto_206742 ?auto_206745 ) ) ( not ( = ?auto_206742 ?auto_206746 ) ) ( not ( = ?auto_206742 ?auto_206747 ) ) ( not ( = ?auto_206742 ?auto_206748 ) ) ( not ( = ?auto_206742 ?auto_206749 ) ) ( not ( = ?auto_206742 ?auto_206750 ) ) ( not ( = ?auto_206742 ?auto_206751 ) ) ( not ( = ?auto_206743 ?auto_206744 ) ) ( not ( = ?auto_206743 ?auto_206745 ) ) ( not ( = ?auto_206743 ?auto_206746 ) ) ( not ( = ?auto_206743 ?auto_206747 ) ) ( not ( = ?auto_206743 ?auto_206748 ) ) ( not ( = ?auto_206743 ?auto_206749 ) ) ( not ( = ?auto_206743 ?auto_206750 ) ) ( not ( = ?auto_206743 ?auto_206751 ) ) ( not ( = ?auto_206744 ?auto_206745 ) ) ( not ( = ?auto_206744 ?auto_206746 ) ) ( not ( = ?auto_206744 ?auto_206747 ) ) ( not ( = ?auto_206744 ?auto_206748 ) ) ( not ( = ?auto_206744 ?auto_206749 ) ) ( not ( = ?auto_206744 ?auto_206750 ) ) ( not ( = ?auto_206744 ?auto_206751 ) ) ( not ( = ?auto_206745 ?auto_206746 ) ) ( not ( = ?auto_206745 ?auto_206747 ) ) ( not ( = ?auto_206745 ?auto_206748 ) ) ( not ( = ?auto_206745 ?auto_206749 ) ) ( not ( = ?auto_206745 ?auto_206750 ) ) ( not ( = ?auto_206745 ?auto_206751 ) ) ( not ( = ?auto_206746 ?auto_206747 ) ) ( not ( = ?auto_206746 ?auto_206748 ) ) ( not ( = ?auto_206746 ?auto_206749 ) ) ( not ( = ?auto_206746 ?auto_206750 ) ) ( not ( = ?auto_206746 ?auto_206751 ) ) ( not ( = ?auto_206747 ?auto_206748 ) ) ( not ( = ?auto_206747 ?auto_206749 ) ) ( not ( = ?auto_206747 ?auto_206750 ) ) ( not ( = ?auto_206747 ?auto_206751 ) ) ( not ( = ?auto_206748 ?auto_206749 ) ) ( not ( = ?auto_206748 ?auto_206750 ) ) ( not ( = ?auto_206748 ?auto_206751 ) ) ( not ( = ?auto_206749 ?auto_206750 ) ) ( not ( = ?auto_206749 ?auto_206751 ) ) ( not ( = ?auto_206750 ?auto_206751 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_206750 ?auto_206751 )
      ( !STACK ?auto_206750 ?auto_206749 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206762 - BLOCK
      ?auto_206763 - BLOCK
      ?auto_206764 - BLOCK
      ?auto_206765 - BLOCK
      ?auto_206766 - BLOCK
      ?auto_206767 - BLOCK
      ?auto_206768 - BLOCK
      ?auto_206769 - BLOCK
      ?auto_206770 - BLOCK
      ?auto_206771 - BLOCK
    )
    :vars
    (
      ?auto_206772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206771 ?auto_206772 ) ( ON-TABLE ?auto_206762 ) ( ON ?auto_206763 ?auto_206762 ) ( ON ?auto_206764 ?auto_206763 ) ( ON ?auto_206765 ?auto_206764 ) ( ON ?auto_206766 ?auto_206765 ) ( ON ?auto_206767 ?auto_206766 ) ( ON ?auto_206768 ?auto_206767 ) ( ON ?auto_206769 ?auto_206768 ) ( not ( = ?auto_206762 ?auto_206763 ) ) ( not ( = ?auto_206762 ?auto_206764 ) ) ( not ( = ?auto_206762 ?auto_206765 ) ) ( not ( = ?auto_206762 ?auto_206766 ) ) ( not ( = ?auto_206762 ?auto_206767 ) ) ( not ( = ?auto_206762 ?auto_206768 ) ) ( not ( = ?auto_206762 ?auto_206769 ) ) ( not ( = ?auto_206762 ?auto_206770 ) ) ( not ( = ?auto_206762 ?auto_206771 ) ) ( not ( = ?auto_206762 ?auto_206772 ) ) ( not ( = ?auto_206763 ?auto_206764 ) ) ( not ( = ?auto_206763 ?auto_206765 ) ) ( not ( = ?auto_206763 ?auto_206766 ) ) ( not ( = ?auto_206763 ?auto_206767 ) ) ( not ( = ?auto_206763 ?auto_206768 ) ) ( not ( = ?auto_206763 ?auto_206769 ) ) ( not ( = ?auto_206763 ?auto_206770 ) ) ( not ( = ?auto_206763 ?auto_206771 ) ) ( not ( = ?auto_206763 ?auto_206772 ) ) ( not ( = ?auto_206764 ?auto_206765 ) ) ( not ( = ?auto_206764 ?auto_206766 ) ) ( not ( = ?auto_206764 ?auto_206767 ) ) ( not ( = ?auto_206764 ?auto_206768 ) ) ( not ( = ?auto_206764 ?auto_206769 ) ) ( not ( = ?auto_206764 ?auto_206770 ) ) ( not ( = ?auto_206764 ?auto_206771 ) ) ( not ( = ?auto_206764 ?auto_206772 ) ) ( not ( = ?auto_206765 ?auto_206766 ) ) ( not ( = ?auto_206765 ?auto_206767 ) ) ( not ( = ?auto_206765 ?auto_206768 ) ) ( not ( = ?auto_206765 ?auto_206769 ) ) ( not ( = ?auto_206765 ?auto_206770 ) ) ( not ( = ?auto_206765 ?auto_206771 ) ) ( not ( = ?auto_206765 ?auto_206772 ) ) ( not ( = ?auto_206766 ?auto_206767 ) ) ( not ( = ?auto_206766 ?auto_206768 ) ) ( not ( = ?auto_206766 ?auto_206769 ) ) ( not ( = ?auto_206766 ?auto_206770 ) ) ( not ( = ?auto_206766 ?auto_206771 ) ) ( not ( = ?auto_206766 ?auto_206772 ) ) ( not ( = ?auto_206767 ?auto_206768 ) ) ( not ( = ?auto_206767 ?auto_206769 ) ) ( not ( = ?auto_206767 ?auto_206770 ) ) ( not ( = ?auto_206767 ?auto_206771 ) ) ( not ( = ?auto_206767 ?auto_206772 ) ) ( not ( = ?auto_206768 ?auto_206769 ) ) ( not ( = ?auto_206768 ?auto_206770 ) ) ( not ( = ?auto_206768 ?auto_206771 ) ) ( not ( = ?auto_206768 ?auto_206772 ) ) ( not ( = ?auto_206769 ?auto_206770 ) ) ( not ( = ?auto_206769 ?auto_206771 ) ) ( not ( = ?auto_206769 ?auto_206772 ) ) ( not ( = ?auto_206770 ?auto_206771 ) ) ( not ( = ?auto_206770 ?auto_206772 ) ) ( not ( = ?auto_206771 ?auto_206772 ) ) ( CLEAR ?auto_206769 ) ( ON ?auto_206770 ?auto_206771 ) ( CLEAR ?auto_206770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_206762 ?auto_206763 ?auto_206764 ?auto_206765 ?auto_206766 ?auto_206767 ?auto_206768 ?auto_206769 ?auto_206770 )
      ( MAKE-10PILE ?auto_206762 ?auto_206763 ?auto_206764 ?auto_206765 ?auto_206766 ?auto_206767 ?auto_206768 ?auto_206769 ?auto_206770 ?auto_206771 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206783 - BLOCK
      ?auto_206784 - BLOCK
      ?auto_206785 - BLOCK
      ?auto_206786 - BLOCK
      ?auto_206787 - BLOCK
      ?auto_206788 - BLOCK
      ?auto_206789 - BLOCK
      ?auto_206790 - BLOCK
      ?auto_206791 - BLOCK
      ?auto_206792 - BLOCK
    )
    :vars
    (
      ?auto_206793 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206792 ?auto_206793 ) ( ON-TABLE ?auto_206783 ) ( ON ?auto_206784 ?auto_206783 ) ( ON ?auto_206785 ?auto_206784 ) ( ON ?auto_206786 ?auto_206785 ) ( ON ?auto_206787 ?auto_206786 ) ( ON ?auto_206788 ?auto_206787 ) ( ON ?auto_206789 ?auto_206788 ) ( ON ?auto_206790 ?auto_206789 ) ( not ( = ?auto_206783 ?auto_206784 ) ) ( not ( = ?auto_206783 ?auto_206785 ) ) ( not ( = ?auto_206783 ?auto_206786 ) ) ( not ( = ?auto_206783 ?auto_206787 ) ) ( not ( = ?auto_206783 ?auto_206788 ) ) ( not ( = ?auto_206783 ?auto_206789 ) ) ( not ( = ?auto_206783 ?auto_206790 ) ) ( not ( = ?auto_206783 ?auto_206791 ) ) ( not ( = ?auto_206783 ?auto_206792 ) ) ( not ( = ?auto_206783 ?auto_206793 ) ) ( not ( = ?auto_206784 ?auto_206785 ) ) ( not ( = ?auto_206784 ?auto_206786 ) ) ( not ( = ?auto_206784 ?auto_206787 ) ) ( not ( = ?auto_206784 ?auto_206788 ) ) ( not ( = ?auto_206784 ?auto_206789 ) ) ( not ( = ?auto_206784 ?auto_206790 ) ) ( not ( = ?auto_206784 ?auto_206791 ) ) ( not ( = ?auto_206784 ?auto_206792 ) ) ( not ( = ?auto_206784 ?auto_206793 ) ) ( not ( = ?auto_206785 ?auto_206786 ) ) ( not ( = ?auto_206785 ?auto_206787 ) ) ( not ( = ?auto_206785 ?auto_206788 ) ) ( not ( = ?auto_206785 ?auto_206789 ) ) ( not ( = ?auto_206785 ?auto_206790 ) ) ( not ( = ?auto_206785 ?auto_206791 ) ) ( not ( = ?auto_206785 ?auto_206792 ) ) ( not ( = ?auto_206785 ?auto_206793 ) ) ( not ( = ?auto_206786 ?auto_206787 ) ) ( not ( = ?auto_206786 ?auto_206788 ) ) ( not ( = ?auto_206786 ?auto_206789 ) ) ( not ( = ?auto_206786 ?auto_206790 ) ) ( not ( = ?auto_206786 ?auto_206791 ) ) ( not ( = ?auto_206786 ?auto_206792 ) ) ( not ( = ?auto_206786 ?auto_206793 ) ) ( not ( = ?auto_206787 ?auto_206788 ) ) ( not ( = ?auto_206787 ?auto_206789 ) ) ( not ( = ?auto_206787 ?auto_206790 ) ) ( not ( = ?auto_206787 ?auto_206791 ) ) ( not ( = ?auto_206787 ?auto_206792 ) ) ( not ( = ?auto_206787 ?auto_206793 ) ) ( not ( = ?auto_206788 ?auto_206789 ) ) ( not ( = ?auto_206788 ?auto_206790 ) ) ( not ( = ?auto_206788 ?auto_206791 ) ) ( not ( = ?auto_206788 ?auto_206792 ) ) ( not ( = ?auto_206788 ?auto_206793 ) ) ( not ( = ?auto_206789 ?auto_206790 ) ) ( not ( = ?auto_206789 ?auto_206791 ) ) ( not ( = ?auto_206789 ?auto_206792 ) ) ( not ( = ?auto_206789 ?auto_206793 ) ) ( not ( = ?auto_206790 ?auto_206791 ) ) ( not ( = ?auto_206790 ?auto_206792 ) ) ( not ( = ?auto_206790 ?auto_206793 ) ) ( not ( = ?auto_206791 ?auto_206792 ) ) ( not ( = ?auto_206791 ?auto_206793 ) ) ( not ( = ?auto_206792 ?auto_206793 ) ) ( CLEAR ?auto_206790 ) ( ON ?auto_206791 ?auto_206792 ) ( CLEAR ?auto_206791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_206783 ?auto_206784 ?auto_206785 ?auto_206786 ?auto_206787 ?auto_206788 ?auto_206789 ?auto_206790 ?auto_206791 )
      ( MAKE-10PILE ?auto_206783 ?auto_206784 ?auto_206785 ?auto_206786 ?auto_206787 ?auto_206788 ?auto_206789 ?auto_206790 ?auto_206791 ?auto_206792 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206804 - BLOCK
      ?auto_206805 - BLOCK
      ?auto_206806 - BLOCK
      ?auto_206807 - BLOCK
      ?auto_206808 - BLOCK
      ?auto_206809 - BLOCK
      ?auto_206810 - BLOCK
      ?auto_206811 - BLOCK
      ?auto_206812 - BLOCK
      ?auto_206813 - BLOCK
    )
    :vars
    (
      ?auto_206814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206813 ?auto_206814 ) ( ON-TABLE ?auto_206804 ) ( ON ?auto_206805 ?auto_206804 ) ( ON ?auto_206806 ?auto_206805 ) ( ON ?auto_206807 ?auto_206806 ) ( ON ?auto_206808 ?auto_206807 ) ( ON ?auto_206809 ?auto_206808 ) ( ON ?auto_206810 ?auto_206809 ) ( not ( = ?auto_206804 ?auto_206805 ) ) ( not ( = ?auto_206804 ?auto_206806 ) ) ( not ( = ?auto_206804 ?auto_206807 ) ) ( not ( = ?auto_206804 ?auto_206808 ) ) ( not ( = ?auto_206804 ?auto_206809 ) ) ( not ( = ?auto_206804 ?auto_206810 ) ) ( not ( = ?auto_206804 ?auto_206811 ) ) ( not ( = ?auto_206804 ?auto_206812 ) ) ( not ( = ?auto_206804 ?auto_206813 ) ) ( not ( = ?auto_206804 ?auto_206814 ) ) ( not ( = ?auto_206805 ?auto_206806 ) ) ( not ( = ?auto_206805 ?auto_206807 ) ) ( not ( = ?auto_206805 ?auto_206808 ) ) ( not ( = ?auto_206805 ?auto_206809 ) ) ( not ( = ?auto_206805 ?auto_206810 ) ) ( not ( = ?auto_206805 ?auto_206811 ) ) ( not ( = ?auto_206805 ?auto_206812 ) ) ( not ( = ?auto_206805 ?auto_206813 ) ) ( not ( = ?auto_206805 ?auto_206814 ) ) ( not ( = ?auto_206806 ?auto_206807 ) ) ( not ( = ?auto_206806 ?auto_206808 ) ) ( not ( = ?auto_206806 ?auto_206809 ) ) ( not ( = ?auto_206806 ?auto_206810 ) ) ( not ( = ?auto_206806 ?auto_206811 ) ) ( not ( = ?auto_206806 ?auto_206812 ) ) ( not ( = ?auto_206806 ?auto_206813 ) ) ( not ( = ?auto_206806 ?auto_206814 ) ) ( not ( = ?auto_206807 ?auto_206808 ) ) ( not ( = ?auto_206807 ?auto_206809 ) ) ( not ( = ?auto_206807 ?auto_206810 ) ) ( not ( = ?auto_206807 ?auto_206811 ) ) ( not ( = ?auto_206807 ?auto_206812 ) ) ( not ( = ?auto_206807 ?auto_206813 ) ) ( not ( = ?auto_206807 ?auto_206814 ) ) ( not ( = ?auto_206808 ?auto_206809 ) ) ( not ( = ?auto_206808 ?auto_206810 ) ) ( not ( = ?auto_206808 ?auto_206811 ) ) ( not ( = ?auto_206808 ?auto_206812 ) ) ( not ( = ?auto_206808 ?auto_206813 ) ) ( not ( = ?auto_206808 ?auto_206814 ) ) ( not ( = ?auto_206809 ?auto_206810 ) ) ( not ( = ?auto_206809 ?auto_206811 ) ) ( not ( = ?auto_206809 ?auto_206812 ) ) ( not ( = ?auto_206809 ?auto_206813 ) ) ( not ( = ?auto_206809 ?auto_206814 ) ) ( not ( = ?auto_206810 ?auto_206811 ) ) ( not ( = ?auto_206810 ?auto_206812 ) ) ( not ( = ?auto_206810 ?auto_206813 ) ) ( not ( = ?auto_206810 ?auto_206814 ) ) ( not ( = ?auto_206811 ?auto_206812 ) ) ( not ( = ?auto_206811 ?auto_206813 ) ) ( not ( = ?auto_206811 ?auto_206814 ) ) ( not ( = ?auto_206812 ?auto_206813 ) ) ( not ( = ?auto_206812 ?auto_206814 ) ) ( not ( = ?auto_206813 ?auto_206814 ) ) ( ON ?auto_206812 ?auto_206813 ) ( CLEAR ?auto_206810 ) ( ON ?auto_206811 ?auto_206812 ) ( CLEAR ?auto_206811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206804 ?auto_206805 ?auto_206806 ?auto_206807 ?auto_206808 ?auto_206809 ?auto_206810 ?auto_206811 )
      ( MAKE-10PILE ?auto_206804 ?auto_206805 ?auto_206806 ?auto_206807 ?auto_206808 ?auto_206809 ?auto_206810 ?auto_206811 ?auto_206812 ?auto_206813 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206825 - BLOCK
      ?auto_206826 - BLOCK
      ?auto_206827 - BLOCK
      ?auto_206828 - BLOCK
      ?auto_206829 - BLOCK
      ?auto_206830 - BLOCK
      ?auto_206831 - BLOCK
      ?auto_206832 - BLOCK
      ?auto_206833 - BLOCK
      ?auto_206834 - BLOCK
    )
    :vars
    (
      ?auto_206835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206834 ?auto_206835 ) ( ON-TABLE ?auto_206825 ) ( ON ?auto_206826 ?auto_206825 ) ( ON ?auto_206827 ?auto_206826 ) ( ON ?auto_206828 ?auto_206827 ) ( ON ?auto_206829 ?auto_206828 ) ( ON ?auto_206830 ?auto_206829 ) ( ON ?auto_206831 ?auto_206830 ) ( not ( = ?auto_206825 ?auto_206826 ) ) ( not ( = ?auto_206825 ?auto_206827 ) ) ( not ( = ?auto_206825 ?auto_206828 ) ) ( not ( = ?auto_206825 ?auto_206829 ) ) ( not ( = ?auto_206825 ?auto_206830 ) ) ( not ( = ?auto_206825 ?auto_206831 ) ) ( not ( = ?auto_206825 ?auto_206832 ) ) ( not ( = ?auto_206825 ?auto_206833 ) ) ( not ( = ?auto_206825 ?auto_206834 ) ) ( not ( = ?auto_206825 ?auto_206835 ) ) ( not ( = ?auto_206826 ?auto_206827 ) ) ( not ( = ?auto_206826 ?auto_206828 ) ) ( not ( = ?auto_206826 ?auto_206829 ) ) ( not ( = ?auto_206826 ?auto_206830 ) ) ( not ( = ?auto_206826 ?auto_206831 ) ) ( not ( = ?auto_206826 ?auto_206832 ) ) ( not ( = ?auto_206826 ?auto_206833 ) ) ( not ( = ?auto_206826 ?auto_206834 ) ) ( not ( = ?auto_206826 ?auto_206835 ) ) ( not ( = ?auto_206827 ?auto_206828 ) ) ( not ( = ?auto_206827 ?auto_206829 ) ) ( not ( = ?auto_206827 ?auto_206830 ) ) ( not ( = ?auto_206827 ?auto_206831 ) ) ( not ( = ?auto_206827 ?auto_206832 ) ) ( not ( = ?auto_206827 ?auto_206833 ) ) ( not ( = ?auto_206827 ?auto_206834 ) ) ( not ( = ?auto_206827 ?auto_206835 ) ) ( not ( = ?auto_206828 ?auto_206829 ) ) ( not ( = ?auto_206828 ?auto_206830 ) ) ( not ( = ?auto_206828 ?auto_206831 ) ) ( not ( = ?auto_206828 ?auto_206832 ) ) ( not ( = ?auto_206828 ?auto_206833 ) ) ( not ( = ?auto_206828 ?auto_206834 ) ) ( not ( = ?auto_206828 ?auto_206835 ) ) ( not ( = ?auto_206829 ?auto_206830 ) ) ( not ( = ?auto_206829 ?auto_206831 ) ) ( not ( = ?auto_206829 ?auto_206832 ) ) ( not ( = ?auto_206829 ?auto_206833 ) ) ( not ( = ?auto_206829 ?auto_206834 ) ) ( not ( = ?auto_206829 ?auto_206835 ) ) ( not ( = ?auto_206830 ?auto_206831 ) ) ( not ( = ?auto_206830 ?auto_206832 ) ) ( not ( = ?auto_206830 ?auto_206833 ) ) ( not ( = ?auto_206830 ?auto_206834 ) ) ( not ( = ?auto_206830 ?auto_206835 ) ) ( not ( = ?auto_206831 ?auto_206832 ) ) ( not ( = ?auto_206831 ?auto_206833 ) ) ( not ( = ?auto_206831 ?auto_206834 ) ) ( not ( = ?auto_206831 ?auto_206835 ) ) ( not ( = ?auto_206832 ?auto_206833 ) ) ( not ( = ?auto_206832 ?auto_206834 ) ) ( not ( = ?auto_206832 ?auto_206835 ) ) ( not ( = ?auto_206833 ?auto_206834 ) ) ( not ( = ?auto_206833 ?auto_206835 ) ) ( not ( = ?auto_206834 ?auto_206835 ) ) ( ON ?auto_206833 ?auto_206834 ) ( CLEAR ?auto_206831 ) ( ON ?auto_206832 ?auto_206833 ) ( CLEAR ?auto_206832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_206825 ?auto_206826 ?auto_206827 ?auto_206828 ?auto_206829 ?auto_206830 ?auto_206831 ?auto_206832 )
      ( MAKE-10PILE ?auto_206825 ?auto_206826 ?auto_206827 ?auto_206828 ?auto_206829 ?auto_206830 ?auto_206831 ?auto_206832 ?auto_206833 ?auto_206834 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206846 - BLOCK
      ?auto_206847 - BLOCK
      ?auto_206848 - BLOCK
      ?auto_206849 - BLOCK
      ?auto_206850 - BLOCK
      ?auto_206851 - BLOCK
      ?auto_206852 - BLOCK
      ?auto_206853 - BLOCK
      ?auto_206854 - BLOCK
      ?auto_206855 - BLOCK
    )
    :vars
    (
      ?auto_206856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206855 ?auto_206856 ) ( ON-TABLE ?auto_206846 ) ( ON ?auto_206847 ?auto_206846 ) ( ON ?auto_206848 ?auto_206847 ) ( ON ?auto_206849 ?auto_206848 ) ( ON ?auto_206850 ?auto_206849 ) ( ON ?auto_206851 ?auto_206850 ) ( not ( = ?auto_206846 ?auto_206847 ) ) ( not ( = ?auto_206846 ?auto_206848 ) ) ( not ( = ?auto_206846 ?auto_206849 ) ) ( not ( = ?auto_206846 ?auto_206850 ) ) ( not ( = ?auto_206846 ?auto_206851 ) ) ( not ( = ?auto_206846 ?auto_206852 ) ) ( not ( = ?auto_206846 ?auto_206853 ) ) ( not ( = ?auto_206846 ?auto_206854 ) ) ( not ( = ?auto_206846 ?auto_206855 ) ) ( not ( = ?auto_206846 ?auto_206856 ) ) ( not ( = ?auto_206847 ?auto_206848 ) ) ( not ( = ?auto_206847 ?auto_206849 ) ) ( not ( = ?auto_206847 ?auto_206850 ) ) ( not ( = ?auto_206847 ?auto_206851 ) ) ( not ( = ?auto_206847 ?auto_206852 ) ) ( not ( = ?auto_206847 ?auto_206853 ) ) ( not ( = ?auto_206847 ?auto_206854 ) ) ( not ( = ?auto_206847 ?auto_206855 ) ) ( not ( = ?auto_206847 ?auto_206856 ) ) ( not ( = ?auto_206848 ?auto_206849 ) ) ( not ( = ?auto_206848 ?auto_206850 ) ) ( not ( = ?auto_206848 ?auto_206851 ) ) ( not ( = ?auto_206848 ?auto_206852 ) ) ( not ( = ?auto_206848 ?auto_206853 ) ) ( not ( = ?auto_206848 ?auto_206854 ) ) ( not ( = ?auto_206848 ?auto_206855 ) ) ( not ( = ?auto_206848 ?auto_206856 ) ) ( not ( = ?auto_206849 ?auto_206850 ) ) ( not ( = ?auto_206849 ?auto_206851 ) ) ( not ( = ?auto_206849 ?auto_206852 ) ) ( not ( = ?auto_206849 ?auto_206853 ) ) ( not ( = ?auto_206849 ?auto_206854 ) ) ( not ( = ?auto_206849 ?auto_206855 ) ) ( not ( = ?auto_206849 ?auto_206856 ) ) ( not ( = ?auto_206850 ?auto_206851 ) ) ( not ( = ?auto_206850 ?auto_206852 ) ) ( not ( = ?auto_206850 ?auto_206853 ) ) ( not ( = ?auto_206850 ?auto_206854 ) ) ( not ( = ?auto_206850 ?auto_206855 ) ) ( not ( = ?auto_206850 ?auto_206856 ) ) ( not ( = ?auto_206851 ?auto_206852 ) ) ( not ( = ?auto_206851 ?auto_206853 ) ) ( not ( = ?auto_206851 ?auto_206854 ) ) ( not ( = ?auto_206851 ?auto_206855 ) ) ( not ( = ?auto_206851 ?auto_206856 ) ) ( not ( = ?auto_206852 ?auto_206853 ) ) ( not ( = ?auto_206852 ?auto_206854 ) ) ( not ( = ?auto_206852 ?auto_206855 ) ) ( not ( = ?auto_206852 ?auto_206856 ) ) ( not ( = ?auto_206853 ?auto_206854 ) ) ( not ( = ?auto_206853 ?auto_206855 ) ) ( not ( = ?auto_206853 ?auto_206856 ) ) ( not ( = ?auto_206854 ?auto_206855 ) ) ( not ( = ?auto_206854 ?auto_206856 ) ) ( not ( = ?auto_206855 ?auto_206856 ) ) ( ON ?auto_206854 ?auto_206855 ) ( ON ?auto_206853 ?auto_206854 ) ( CLEAR ?auto_206851 ) ( ON ?auto_206852 ?auto_206853 ) ( CLEAR ?auto_206852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206846 ?auto_206847 ?auto_206848 ?auto_206849 ?auto_206850 ?auto_206851 ?auto_206852 )
      ( MAKE-10PILE ?auto_206846 ?auto_206847 ?auto_206848 ?auto_206849 ?auto_206850 ?auto_206851 ?auto_206852 ?auto_206853 ?auto_206854 ?auto_206855 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206867 - BLOCK
      ?auto_206868 - BLOCK
      ?auto_206869 - BLOCK
      ?auto_206870 - BLOCK
      ?auto_206871 - BLOCK
      ?auto_206872 - BLOCK
      ?auto_206873 - BLOCK
      ?auto_206874 - BLOCK
      ?auto_206875 - BLOCK
      ?auto_206876 - BLOCK
    )
    :vars
    (
      ?auto_206877 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206876 ?auto_206877 ) ( ON-TABLE ?auto_206867 ) ( ON ?auto_206868 ?auto_206867 ) ( ON ?auto_206869 ?auto_206868 ) ( ON ?auto_206870 ?auto_206869 ) ( ON ?auto_206871 ?auto_206870 ) ( ON ?auto_206872 ?auto_206871 ) ( not ( = ?auto_206867 ?auto_206868 ) ) ( not ( = ?auto_206867 ?auto_206869 ) ) ( not ( = ?auto_206867 ?auto_206870 ) ) ( not ( = ?auto_206867 ?auto_206871 ) ) ( not ( = ?auto_206867 ?auto_206872 ) ) ( not ( = ?auto_206867 ?auto_206873 ) ) ( not ( = ?auto_206867 ?auto_206874 ) ) ( not ( = ?auto_206867 ?auto_206875 ) ) ( not ( = ?auto_206867 ?auto_206876 ) ) ( not ( = ?auto_206867 ?auto_206877 ) ) ( not ( = ?auto_206868 ?auto_206869 ) ) ( not ( = ?auto_206868 ?auto_206870 ) ) ( not ( = ?auto_206868 ?auto_206871 ) ) ( not ( = ?auto_206868 ?auto_206872 ) ) ( not ( = ?auto_206868 ?auto_206873 ) ) ( not ( = ?auto_206868 ?auto_206874 ) ) ( not ( = ?auto_206868 ?auto_206875 ) ) ( not ( = ?auto_206868 ?auto_206876 ) ) ( not ( = ?auto_206868 ?auto_206877 ) ) ( not ( = ?auto_206869 ?auto_206870 ) ) ( not ( = ?auto_206869 ?auto_206871 ) ) ( not ( = ?auto_206869 ?auto_206872 ) ) ( not ( = ?auto_206869 ?auto_206873 ) ) ( not ( = ?auto_206869 ?auto_206874 ) ) ( not ( = ?auto_206869 ?auto_206875 ) ) ( not ( = ?auto_206869 ?auto_206876 ) ) ( not ( = ?auto_206869 ?auto_206877 ) ) ( not ( = ?auto_206870 ?auto_206871 ) ) ( not ( = ?auto_206870 ?auto_206872 ) ) ( not ( = ?auto_206870 ?auto_206873 ) ) ( not ( = ?auto_206870 ?auto_206874 ) ) ( not ( = ?auto_206870 ?auto_206875 ) ) ( not ( = ?auto_206870 ?auto_206876 ) ) ( not ( = ?auto_206870 ?auto_206877 ) ) ( not ( = ?auto_206871 ?auto_206872 ) ) ( not ( = ?auto_206871 ?auto_206873 ) ) ( not ( = ?auto_206871 ?auto_206874 ) ) ( not ( = ?auto_206871 ?auto_206875 ) ) ( not ( = ?auto_206871 ?auto_206876 ) ) ( not ( = ?auto_206871 ?auto_206877 ) ) ( not ( = ?auto_206872 ?auto_206873 ) ) ( not ( = ?auto_206872 ?auto_206874 ) ) ( not ( = ?auto_206872 ?auto_206875 ) ) ( not ( = ?auto_206872 ?auto_206876 ) ) ( not ( = ?auto_206872 ?auto_206877 ) ) ( not ( = ?auto_206873 ?auto_206874 ) ) ( not ( = ?auto_206873 ?auto_206875 ) ) ( not ( = ?auto_206873 ?auto_206876 ) ) ( not ( = ?auto_206873 ?auto_206877 ) ) ( not ( = ?auto_206874 ?auto_206875 ) ) ( not ( = ?auto_206874 ?auto_206876 ) ) ( not ( = ?auto_206874 ?auto_206877 ) ) ( not ( = ?auto_206875 ?auto_206876 ) ) ( not ( = ?auto_206875 ?auto_206877 ) ) ( not ( = ?auto_206876 ?auto_206877 ) ) ( ON ?auto_206875 ?auto_206876 ) ( ON ?auto_206874 ?auto_206875 ) ( CLEAR ?auto_206872 ) ( ON ?auto_206873 ?auto_206874 ) ( CLEAR ?auto_206873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_206867 ?auto_206868 ?auto_206869 ?auto_206870 ?auto_206871 ?auto_206872 ?auto_206873 )
      ( MAKE-10PILE ?auto_206867 ?auto_206868 ?auto_206869 ?auto_206870 ?auto_206871 ?auto_206872 ?auto_206873 ?auto_206874 ?auto_206875 ?auto_206876 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206888 - BLOCK
      ?auto_206889 - BLOCK
      ?auto_206890 - BLOCK
      ?auto_206891 - BLOCK
      ?auto_206892 - BLOCK
      ?auto_206893 - BLOCK
      ?auto_206894 - BLOCK
      ?auto_206895 - BLOCK
      ?auto_206896 - BLOCK
      ?auto_206897 - BLOCK
    )
    :vars
    (
      ?auto_206898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206897 ?auto_206898 ) ( ON-TABLE ?auto_206888 ) ( ON ?auto_206889 ?auto_206888 ) ( ON ?auto_206890 ?auto_206889 ) ( ON ?auto_206891 ?auto_206890 ) ( ON ?auto_206892 ?auto_206891 ) ( not ( = ?auto_206888 ?auto_206889 ) ) ( not ( = ?auto_206888 ?auto_206890 ) ) ( not ( = ?auto_206888 ?auto_206891 ) ) ( not ( = ?auto_206888 ?auto_206892 ) ) ( not ( = ?auto_206888 ?auto_206893 ) ) ( not ( = ?auto_206888 ?auto_206894 ) ) ( not ( = ?auto_206888 ?auto_206895 ) ) ( not ( = ?auto_206888 ?auto_206896 ) ) ( not ( = ?auto_206888 ?auto_206897 ) ) ( not ( = ?auto_206888 ?auto_206898 ) ) ( not ( = ?auto_206889 ?auto_206890 ) ) ( not ( = ?auto_206889 ?auto_206891 ) ) ( not ( = ?auto_206889 ?auto_206892 ) ) ( not ( = ?auto_206889 ?auto_206893 ) ) ( not ( = ?auto_206889 ?auto_206894 ) ) ( not ( = ?auto_206889 ?auto_206895 ) ) ( not ( = ?auto_206889 ?auto_206896 ) ) ( not ( = ?auto_206889 ?auto_206897 ) ) ( not ( = ?auto_206889 ?auto_206898 ) ) ( not ( = ?auto_206890 ?auto_206891 ) ) ( not ( = ?auto_206890 ?auto_206892 ) ) ( not ( = ?auto_206890 ?auto_206893 ) ) ( not ( = ?auto_206890 ?auto_206894 ) ) ( not ( = ?auto_206890 ?auto_206895 ) ) ( not ( = ?auto_206890 ?auto_206896 ) ) ( not ( = ?auto_206890 ?auto_206897 ) ) ( not ( = ?auto_206890 ?auto_206898 ) ) ( not ( = ?auto_206891 ?auto_206892 ) ) ( not ( = ?auto_206891 ?auto_206893 ) ) ( not ( = ?auto_206891 ?auto_206894 ) ) ( not ( = ?auto_206891 ?auto_206895 ) ) ( not ( = ?auto_206891 ?auto_206896 ) ) ( not ( = ?auto_206891 ?auto_206897 ) ) ( not ( = ?auto_206891 ?auto_206898 ) ) ( not ( = ?auto_206892 ?auto_206893 ) ) ( not ( = ?auto_206892 ?auto_206894 ) ) ( not ( = ?auto_206892 ?auto_206895 ) ) ( not ( = ?auto_206892 ?auto_206896 ) ) ( not ( = ?auto_206892 ?auto_206897 ) ) ( not ( = ?auto_206892 ?auto_206898 ) ) ( not ( = ?auto_206893 ?auto_206894 ) ) ( not ( = ?auto_206893 ?auto_206895 ) ) ( not ( = ?auto_206893 ?auto_206896 ) ) ( not ( = ?auto_206893 ?auto_206897 ) ) ( not ( = ?auto_206893 ?auto_206898 ) ) ( not ( = ?auto_206894 ?auto_206895 ) ) ( not ( = ?auto_206894 ?auto_206896 ) ) ( not ( = ?auto_206894 ?auto_206897 ) ) ( not ( = ?auto_206894 ?auto_206898 ) ) ( not ( = ?auto_206895 ?auto_206896 ) ) ( not ( = ?auto_206895 ?auto_206897 ) ) ( not ( = ?auto_206895 ?auto_206898 ) ) ( not ( = ?auto_206896 ?auto_206897 ) ) ( not ( = ?auto_206896 ?auto_206898 ) ) ( not ( = ?auto_206897 ?auto_206898 ) ) ( ON ?auto_206896 ?auto_206897 ) ( ON ?auto_206895 ?auto_206896 ) ( ON ?auto_206894 ?auto_206895 ) ( CLEAR ?auto_206892 ) ( ON ?auto_206893 ?auto_206894 ) ( CLEAR ?auto_206893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206888 ?auto_206889 ?auto_206890 ?auto_206891 ?auto_206892 ?auto_206893 )
      ( MAKE-10PILE ?auto_206888 ?auto_206889 ?auto_206890 ?auto_206891 ?auto_206892 ?auto_206893 ?auto_206894 ?auto_206895 ?auto_206896 ?auto_206897 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206909 - BLOCK
      ?auto_206910 - BLOCK
      ?auto_206911 - BLOCK
      ?auto_206912 - BLOCK
      ?auto_206913 - BLOCK
      ?auto_206914 - BLOCK
      ?auto_206915 - BLOCK
      ?auto_206916 - BLOCK
      ?auto_206917 - BLOCK
      ?auto_206918 - BLOCK
    )
    :vars
    (
      ?auto_206919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206918 ?auto_206919 ) ( ON-TABLE ?auto_206909 ) ( ON ?auto_206910 ?auto_206909 ) ( ON ?auto_206911 ?auto_206910 ) ( ON ?auto_206912 ?auto_206911 ) ( ON ?auto_206913 ?auto_206912 ) ( not ( = ?auto_206909 ?auto_206910 ) ) ( not ( = ?auto_206909 ?auto_206911 ) ) ( not ( = ?auto_206909 ?auto_206912 ) ) ( not ( = ?auto_206909 ?auto_206913 ) ) ( not ( = ?auto_206909 ?auto_206914 ) ) ( not ( = ?auto_206909 ?auto_206915 ) ) ( not ( = ?auto_206909 ?auto_206916 ) ) ( not ( = ?auto_206909 ?auto_206917 ) ) ( not ( = ?auto_206909 ?auto_206918 ) ) ( not ( = ?auto_206909 ?auto_206919 ) ) ( not ( = ?auto_206910 ?auto_206911 ) ) ( not ( = ?auto_206910 ?auto_206912 ) ) ( not ( = ?auto_206910 ?auto_206913 ) ) ( not ( = ?auto_206910 ?auto_206914 ) ) ( not ( = ?auto_206910 ?auto_206915 ) ) ( not ( = ?auto_206910 ?auto_206916 ) ) ( not ( = ?auto_206910 ?auto_206917 ) ) ( not ( = ?auto_206910 ?auto_206918 ) ) ( not ( = ?auto_206910 ?auto_206919 ) ) ( not ( = ?auto_206911 ?auto_206912 ) ) ( not ( = ?auto_206911 ?auto_206913 ) ) ( not ( = ?auto_206911 ?auto_206914 ) ) ( not ( = ?auto_206911 ?auto_206915 ) ) ( not ( = ?auto_206911 ?auto_206916 ) ) ( not ( = ?auto_206911 ?auto_206917 ) ) ( not ( = ?auto_206911 ?auto_206918 ) ) ( not ( = ?auto_206911 ?auto_206919 ) ) ( not ( = ?auto_206912 ?auto_206913 ) ) ( not ( = ?auto_206912 ?auto_206914 ) ) ( not ( = ?auto_206912 ?auto_206915 ) ) ( not ( = ?auto_206912 ?auto_206916 ) ) ( not ( = ?auto_206912 ?auto_206917 ) ) ( not ( = ?auto_206912 ?auto_206918 ) ) ( not ( = ?auto_206912 ?auto_206919 ) ) ( not ( = ?auto_206913 ?auto_206914 ) ) ( not ( = ?auto_206913 ?auto_206915 ) ) ( not ( = ?auto_206913 ?auto_206916 ) ) ( not ( = ?auto_206913 ?auto_206917 ) ) ( not ( = ?auto_206913 ?auto_206918 ) ) ( not ( = ?auto_206913 ?auto_206919 ) ) ( not ( = ?auto_206914 ?auto_206915 ) ) ( not ( = ?auto_206914 ?auto_206916 ) ) ( not ( = ?auto_206914 ?auto_206917 ) ) ( not ( = ?auto_206914 ?auto_206918 ) ) ( not ( = ?auto_206914 ?auto_206919 ) ) ( not ( = ?auto_206915 ?auto_206916 ) ) ( not ( = ?auto_206915 ?auto_206917 ) ) ( not ( = ?auto_206915 ?auto_206918 ) ) ( not ( = ?auto_206915 ?auto_206919 ) ) ( not ( = ?auto_206916 ?auto_206917 ) ) ( not ( = ?auto_206916 ?auto_206918 ) ) ( not ( = ?auto_206916 ?auto_206919 ) ) ( not ( = ?auto_206917 ?auto_206918 ) ) ( not ( = ?auto_206917 ?auto_206919 ) ) ( not ( = ?auto_206918 ?auto_206919 ) ) ( ON ?auto_206917 ?auto_206918 ) ( ON ?auto_206916 ?auto_206917 ) ( ON ?auto_206915 ?auto_206916 ) ( CLEAR ?auto_206913 ) ( ON ?auto_206914 ?auto_206915 ) ( CLEAR ?auto_206914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_206909 ?auto_206910 ?auto_206911 ?auto_206912 ?auto_206913 ?auto_206914 )
      ( MAKE-10PILE ?auto_206909 ?auto_206910 ?auto_206911 ?auto_206912 ?auto_206913 ?auto_206914 ?auto_206915 ?auto_206916 ?auto_206917 ?auto_206918 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206930 - BLOCK
      ?auto_206931 - BLOCK
      ?auto_206932 - BLOCK
      ?auto_206933 - BLOCK
      ?auto_206934 - BLOCK
      ?auto_206935 - BLOCK
      ?auto_206936 - BLOCK
      ?auto_206937 - BLOCK
      ?auto_206938 - BLOCK
      ?auto_206939 - BLOCK
    )
    :vars
    (
      ?auto_206940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206939 ?auto_206940 ) ( ON-TABLE ?auto_206930 ) ( ON ?auto_206931 ?auto_206930 ) ( ON ?auto_206932 ?auto_206931 ) ( ON ?auto_206933 ?auto_206932 ) ( not ( = ?auto_206930 ?auto_206931 ) ) ( not ( = ?auto_206930 ?auto_206932 ) ) ( not ( = ?auto_206930 ?auto_206933 ) ) ( not ( = ?auto_206930 ?auto_206934 ) ) ( not ( = ?auto_206930 ?auto_206935 ) ) ( not ( = ?auto_206930 ?auto_206936 ) ) ( not ( = ?auto_206930 ?auto_206937 ) ) ( not ( = ?auto_206930 ?auto_206938 ) ) ( not ( = ?auto_206930 ?auto_206939 ) ) ( not ( = ?auto_206930 ?auto_206940 ) ) ( not ( = ?auto_206931 ?auto_206932 ) ) ( not ( = ?auto_206931 ?auto_206933 ) ) ( not ( = ?auto_206931 ?auto_206934 ) ) ( not ( = ?auto_206931 ?auto_206935 ) ) ( not ( = ?auto_206931 ?auto_206936 ) ) ( not ( = ?auto_206931 ?auto_206937 ) ) ( not ( = ?auto_206931 ?auto_206938 ) ) ( not ( = ?auto_206931 ?auto_206939 ) ) ( not ( = ?auto_206931 ?auto_206940 ) ) ( not ( = ?auto_206932 ?auto_206933 ) ) ( not ( = ?auto_206932 ?auto_206934 ) ) ( not ( = ?auto_206932 ?auto_206935 ) ) ( not ( = ?auto_206932 ?auto_206936 ) ) ( not ( = ?auto_206932 ?auto_206937 ) ) ( not ( = ?auto_206932 ?auto_206938 ) ) ( not ( = ?auto_206932 ?auto_206939 ) ) ( not ( = ?auto_206932 ?auto_206940 ) ) ( not ( = ?auto_206933 ?auto_206934 ) ) ( not ( = ?auto_206933 ?auto_206935 ) ) ( not ( = ?auto_206933 ?auto_206936 ) ) ( not ( = ?auto_206933 ?auto_206937 ) ) ( not ( = ?auto_206933 ?auto_206938 ) ) ( not ( = ?auto_206933 ?auto_206939 ) ) ( not ( = ?auto_206933 ?auto_206940 ) ) ( not ( = ?auto_206934 ?auto_206935 ) ) ( not ( = ?auto_206934 ?auto_206936 ) ) ( not ( = ?auto_206934 ?auto_206937 ) ) ( not ( = ?auto_206934 ?auto_206938 ) ) ( not ( = ?auto_206934 ?auto_206939 ) ) ( not ( = ?auto_206934 ?auto_206940 ) ) ( not ( = ?auto_206935 ?auto_206936 ) ) ( not ( = ?auto_206935 ?auto_206937 ) ) ( not ( = ?auto_206935 ?auto_206938 ) ) ( not ( = ?auto_206935 ?auto_206939 ) ) ( not ( = ?auto_206935 ?auto_206940 ) ) ( not ( = ?auto_206936 ?auto_206937 ) ) ( not ( = ?auto_206936 ?auto_206938 ) ) ( not ( = ?auto_206936 ?auto_206939 ) ) ( not ( = ?auto_206936 ?auto_206940 ) ) ( not ( = ?auto_206937 ?auto_206938 ) ) ( not ( = ?auto_206937 ?auto_206939 ) ) ( not ( = ?auto_206937 ?auto_206940 ) ) ( not ( = ?auto_206938 ?auto_206939 ) ) ( not ( = ?auto_206938 ?auto_206940 ) ) ( not ( = ?auto_206939 ?auto_206940 ) ) ( ON ?auto_206938 ?auto_206939 ) ( ON ?auto_206937 ?auto_206938 ) ( ON ?auto_206936 ?auto_206937 ) ( ON ?auto_206935 ?auto_206936 ) ( CLEAR ?auto_206933 ) ( ON ?auto_206934 ?auto_206935 ) ( CLEAR ?auto_206934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206930 ?auto_206931 ?auto_206932 ?auto_206933 ?auto_206934 )
      ( MAKE-10PILE ?auto_206930 ?auto_206931 ?auto_206932 ?auto_206933 ?auto_206934 ?auto_206935 ?auto_206936 ?auto_206937 ?auto_206938 ?auto_206939 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206951 - BLOCK
      ?auto_206952 - BLOCK
      ?auto_206953 - BLOCK
      ?auto_206954 - BLOCK
      ?auto_206955 - BLOCK
      ?auto_206956 - BLOCK
      ?auto_206957 - BLOCK
      ?auto_206958 - BLOCK
      ?auto_206959 - BLOCK
      ?auto_206960 - BLOCK
    )
    :vars
    (
      ?auto_206961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206960 ?auto_206961 ) ( ON-TABLE ?auto_206951 ) ( ON ?auto_206952 ?auto_206951 ) ( ON ?auto_206953 ?auto_206952 ) ( ON ?auto_206954 ?auto_206953 ) ( not ( = ?auto_206951 ?auto_206952 ) ) ( not ( = ?auto_206951 ?auto_206953 ) ) ( not ( = ?auto_206951 ?auto_206954 ) ) ( not ( = ?auto_206951 ?auto_206955 ) ) ( not ( = ?auto_206951 ?auto_206956 ) ) ( not ( = ?auto_206951 ?auto_206957 ) ) ( not ( = ?auto_206951 ?auto_206958 ) ) ( not ( = ?auto_206951 ?auto_206959 ) ) ( not ( = ?auto_206951 ?auto_206960 ) ) ( not ( = ?auto_206951 ?auto_206961 ) ) ( not ( = ?auto_206952 ?auto_206953 ) ) ( not ( = ?auto_206952 ?auto_206954 ) ) ( not ( = ?auto_206952 ?auto_206955 ) ) ( not ( = ?auto_206952 ?auto_206956 ) ) ( not ( = ?auto_206952 ?auto_206957 ) ) ( not ( = ?auto_206952 ?auto_206958 ) ) ( not ( = ?auto_206952 ?auto_206959 ) ) ( not ( = ?auto_206952 ?auto_206960 ) ) ( not ( = ?auto_206952 ?auto_206961 ) ) ( not ( = ?auto_206953 ?auto_206954 ) ) ( not ( = ?auto_206953 ?auto_206955 ) ) ( not ( = ?auto_206953 ?auto_206956 ) ) ( not ( = ?auto_206953 ?auto_206957 ) ) ( not ( = ?auto_206953 ?auto_206958 ) ) ( not ( = ?auto_206953 ?auto_206959 ) ) ( not ( = ?auto_206953 ?auto_206960 ) ) ( not ( = ?auto_206953 ?auto_206961 ) ) ( not ( = ?auto_206954 ?auto_206955 ) ) ( not ( = ?auto_206954 ?auto_206956 ) ) ( not ( = ?auto_206954 ?auto_206957 ) ) ( not ( = ?auto_206954 ?auto_206958 ) ) ( not ( = ?auto_206954 ?auto_206959 ) ) ( not ( = ?auto_206954 ?auto_206960 ) ) ( not ( = ?auto_206954 ?auto_206961 ) ) ( not ( = ?auto_206955 ?auto_206956 ) ) ( not ( = ?auto_206955 ?auto_206957 ) ) ( not ( = ?auto_206955 ?auto_206958 ) ) ( not ( = ?auto_206955 ?auto_206959 ) ) ( not ( = ?auto_206955 ?auto_206960 ) ) ( not ( = ?auto_206955 ?auto_206961 ) ) ( not ( = ?auto_206956 ?auto_206957 ) ) ( not ( = ?auto_206956 ?auto_206958 ) ) ( not ( = ?auto_206956 ?auto_206959 ) ) ( not ( = ?auto_206956 ?auto_206960 ) ) ( not ( = ?auto_206956 ?auto_206961 ) ) ( not ( = ?auto_206957 ?auto_206958 ) ) ( not ( = ?auto_206957 ?auto_206959 ) ) ( not ( = ?auto_206957 ?auto_206960 ) ) ( not ( = ?auto_206957 ?auto_206961 ) ) ( not ( = ?auto_206958 ?auto_206959 ) ) ( not ( = ?auto_206958 ?auto_206960 ) ) ( not ( = ?auto_206958 ?auto_206961 ) ) ( not ( = ?auto_206959 ?auto_206960 ) ) ( not ( = ?auto_206959 ?auto_206961 ) ) ( not ( = ?auto_206960 ?auto_206961 ) ) ( ON ?auto_206959 ?auto_206960 ) ( ON ?auto_206958 ?auto_206959 ) ( ON ?auto_206957 ?auto_206958 ) ( ON ?auto_206956 ?auto_206957 ) ( CLEAR ?auto_206954 ) ( ON ?auto_206955 ?auto_206956 ) ( CLEAR ?auto_206955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_206951 ?auto_206952 ?auto_206953 ?auto_206954 ?auto_206955 )
      ( MAKE-10PILE ?auto_206951 ?auto_206952 ?auto_206953 ?auto_206954 ?auto_206955 ?auto_206956 ?auto_206957 ?auto_206958 ?auto_206959 ?auto_206960 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206972 - BLOCK
      ?auto_206973 - BLOCK
      ?auto_206974 - BLOCK
      ?auto_206975 - BLOCK
      ?auto_206976 - BLOCK
      ?auto_206977 - BLOCK
      ?auto_206978 - BLOCK
      ?auto_206979 - BLOCK
      ?auto_206980 - BLOCK
      ?auto_206981 - BLOCK
    )
    :vars
    (
      ?auto_206982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_206981 ?auto_206982 ) ( ON-TABLE ?auto_206972 ) ( ON ?auto_206973 ?auto_206972 ) ( ON ?auto_206974 ?auto_206973 ) ( not ( = ?auto_206972 ?auto_206973 ) ) ( not ( = ?auto_206972 ?auto_206974 ) ) ( not ( = ?auto_206972 ?auto_206975 ) ) ( not ( = ?auto_206972 ?auto_206976 ) ) ( not ( = ?auto_206972 ?auto_206977 ) ) ( not ( = ?auto_206972 ?auto_206978 ) ) ( not ( = ?auto_206972 ?auto_206979 ) ) ( not ( = ?auto_206972 ?auto_206980 ) ) ( not ( = ?auto_206972 ?auto_206981 ) ) ( not ( = ?auto_206972 ?auto_206982 ) ) ( not ( = ?auto_206973 ?auto_206974 ) ) ( not ( = ?auto_206973 ?auto_206975 ) ) ( not ( = ?auto_206973 ?auto_206976 ) ) ( not ( = ?auto_206973 ?auto_206977 ) ) ( not ( = ?auto_206973 ?auto_206978 ) ) ( not ( = ?auto_206973 ?auto_206979 ) ) ( not ( = ?auto_206973 ?auto_206980 ) ) ( not ( = ?auto_206973 ?auto_206981 ) ) ( not ( = ?auto_206973 ?auto_206982 ) ) ( not ( = ?auto_206974 ?auto_206975 ) ) ( not ( = ?auto_206974 ?auto_206976 ) ) ( not ( = ?auto_206974 ?auto_206977 ) ) ( not ( = ?auto_206974 ?auto_206978 ) ) ( not ( = ?auto_206974 ?auto_206979 ) ) ( not ( = ?auto_206974 ?auto_206980 ) ) ( not ( = ?auto_206974 ?auto_206981 ) ) ( not ( = ?auto_206974 ?auto_206982 ) ) ( not ( = ?auto_206975 ?auto_206976 ) ) ( not ( = ?auto_206975 ?auto_206977 ) ) ( not ( = ?auto_206975 ?auto_206978 ) ) ( not ( = ?auto_206975 ?auto_206979 ) ) ( not ( = ?auto_206975 ?auto_206980 ) ) ( not ( = ?auto_206975 ?auto_206981 ) ) ( not ( = ?auto_206975 ?auto_206982 ) ) ( not ( = ?auto_206976 ?auto_206977 ) ) ( not ( = ?auto_206976 ?auto_206978 ) ) ( not ( = ?auto_206976 ?auto_206979 ) ) ( not ( = ?auto_206976 ?auto_206980 ) ) ( not ( = ?auto_206976 ?auto_206981 ) ) ( not ( = ?auto_206976 ?auto_206982 ) ) ( not ( = ?auto_206977 ?auto_206978 ) ) ( not ( = ?auto_206977 ?auto_206979 ) ) ( not ( = ?auto_206977 ?auto_206980 ) ) ( not ( = ?auto_206977 ?auto_206981 ) ) ( not ( = ?auto_206977 ?auto_206982 ) ) ( not ( = ?auto_206978 ?auto_206979 ) ) ( not ( = ?auto_206978 ?auto_206980 ) ) ( not ( = ?auto_206978 ?auto_206981 ) ) ( not ( = ?auto_206978 ?auto_206982 ) ) ( not ( = ?auto_206979 ?auto_206980 ) ) ( not ( = ?auto_206979 ?auto_206981 ) ) ( not ( = ?auto_206979 ?auto_206982 ) ) ( not ( = ?auto_206980 ?auto_206981 ) ) ( not ( = ?auto_206980 ?auto_206982 ) ) ( not ( = ?auto_206981 ?auto_206982 ) ) ( ON ?auto_206980 ?auto_206981 ) ( ON ?auto_206979 ?auto_206980 ) ( ON ?auto_206978 ?auto_206979 ) ( ON ?auto_206977 ?auto_206978 ) ( ON ?auto_206976 ?auto_206977 ) ( CLEAR ?auto_206974 ) ( ON ?auto_206975 ?auto_206976 ) ( CLEAR ?auto_206975 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206972 ?auto_206973 ?auto_206974 ?auto_206975 )
      ( MAKE-10PILE ?auto_206972 ?auto_206973 ?auto_206974 ?auto_206975 ?auto_206976 ?auto_206977 ?auto_206978 ?auto_206979 ?auto_206980 ?auto_206981 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_206993 - BLOCK
      ?auto_206994 - BLOCK
      ?auto_206995 - BLOCK
      ?auto_206996 - BLOCK
      ?auto_206997 - BLOCK
      ?auto_206998 - BLOCK
      ?auto_206999 - BLOCK
      ?auto_207000 - BLOCK
      ?auto_207001 - BLOCK
      ?auto_207002 - BLOCK
    )
    :vars
    (
      ?auto_207003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207002 ?auto_207003 ) ( ON-TABLE ?auto_206993 ) ( ON ?auto_206994 ?auto_206993 ) ( ON ?auto_206995 ?auto_206994 ) ( not ( = ?auto_206993 ?auto_206994 ) ) ( not ( = ?auto_206993 ?auto_206995 ) ) ( not ( = ?auto_206993 ?auto_206996 ) ) ( not ( = ?auto_206993 ?auto_206997 ) ) ( not ( = ?auto_206993 ?auto_206998 ) ) ( not ( = ?auto_206993 ?auto_206999 ) ) ( not ( = ?auto_206993 ?auto_207000 ) ) ( not ( = ?auto_206993 ?auto_207001 ) ) ( not ( = ?auto_206993 ?auto_207002 ) ) ( not ( = ?auto_206993 ?auto_207003 ) ) ( not ( = ?auto_206994 ?auto_206995 ) ) ( not ( = ?auto_206994 ?auto_206996 ) ) ( not ( = ?auto_206994 ?auto_206997 ) ) ( not ( = ?auto_206994 ?auto_206998 ) ) ( not ( = ?auto_206994 ?auto_206999 ) ) ( not ( = ?auto_206994 ?auto_207000 ) ) ( not ( = ?auto_206994 ?auto_207001 ) ) ( not ( = ?auto_206994 ?auto_207002 ) ) ( not ( = ?auto_206994 ?auto_207003 ) ) ( not ( = ?auto_206995 ?auto_206996 ) ) ( not ( = ?auto_206995 ?auto_206997 ) ) ( not ( = ?auto_206995 ?auto_206998 ) ) ( not ( = ?auto_206995 ?auto_206999 ) ) ( not ( = ?auto_206995 ?auto_207000 ) ) ( not ( = ?auto_206995 ?auto_207001 ) ) ( not ( = ?auto_206995 ?auto_207002 ) ) ( not ( = ?auto_206995 ?auto_207003 ) ) ( not ( = ?auto_206996 ?auto_206997 ) ) ( not ( = ?auto_206996 ?auto_206998 ) ) ( not ( = ?auto_206996 ?auto_206999 ) ) ( not ( = ?auto_206996 ?auto_207000 ) ) ( not ( = ?auto_206996 ?auto_207001 ) ) ( not ( = ?auto_206996 ?auto_207002 ) ) ( not ( = ?auto_206996 ?auto_207003 ) ) ( not ( = ?auto_206997 ?auto_206998 ) ) ( not ( = ?auto_206997 ?auto_206999 ) ) ( not ( = ?auto_206997 ?auto_207000 ) ) ( not ( = ?auto_206997 ?auto_207001 ) ) ( not ( = ?auto_206997 ?auto_207002 ) ) ( not ( = ?auto_206997 ?auto_207003 ) ) ( not ( = ?auto_206998 ?auto_206999 ) ) ( not ( = ?auto_206998 ?auto_207000 ) ) ( not ( = ?auto_206998 ?auto_207001 ) ) ( not ( = ?auto_206998 ?auto_207002 ) ) ( not ( = ?auto_206998 ?auto_207003 ) ) ( not ( = ?auto_206999 ?auto_207000 ) ) ( not ( = ?auto_206999 ?auto_207001 ) ) ( not ( = ?auto_206999 ?auto_207002 ) ) ( not ( = ?auto_206999 ?auto_207003 ) ) ( not ( = ?auto_207000 ?auto_207001 ) ) ( not ( = ?auto_207000 ?auto_207002 ) ) ( not ( = ?auto_207000 ?auto_207003 ) ) ( not ( = ?auto_207001 ?auto_207002 ) ) ( not ( = ?auto_207001 ?auto_207003 ) ) ( not ( = ?auto_207002 ?auto_207003 ) ) ( ON ?auto_207001 ?auto_207002 ) ( ON ?auto_207000 ?auto_207001 ) ( ON ?auto_206999 ?auto_207000 ) ( ON ?auto_206998 ?auto_206999 ) ( ON ?auto_206997 ?auto_206998 ) ( CLEAR ?auto_206995 ) ( ON ?auto_206996 ?auto_206997 ) ( CLEAR ?auto_206996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_206993 ?auto_206994 ?auto_206995 ?auto_206996 )
      ( MAKE-10PILE ?auto_206993 ?auto_206994 ?auto_206995 ?auto_206996 ?auto_206997 ?auto_206998 ?auto_206999 ?auto_207000 ?auto_207001 ?auto_207002 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207014 - BLOCK
      ?auto_207015 - BLOCK
      ?auto_207016 - BLOCK
      ?auto_207017 - BLOCK
      ?auto_207018 - BLOCK
      ?auto_207019 - BLOCK
      ?auto_207020 - BLOCK
      ?auto_207021 - BLOCK
      ?auto_207022 - BLOCK
      ?auto_207023 - BLOCK
    )
    :vars
    (
      ?auto_207024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207023 ?auto_207024 ) ( ON-TABLE ?auto_207014 ) ( ON ?auto_207015 ?auto_207014 ) ( not ( = ?auto_207014 ?auto_207015 ) ) ( not ( = ?auto_207014 ?auto_207016 ) ) ( not ( = ?auto_207014 ?auto_207017 ) ) ( not ( = ?auto_207014 ?auto_207018 ) ) ( not ( = ?auto_207014 ?auto_207019 ) ) ( not ( = ?auto_207014 ?auto_207020 ) ) ( not ( = ?auto_207014 ?auto_207021 ) ) ( not ( = ?auto_207014 ?auto_207022 ) ) ( not ( = ?auto_207014 ?auto_207023 ) ) ( not ( = ?auto_207014 ?auto_207024 ) ) ( not ( = ?auto_207015 ?auto_207016 ) ) ( not ( = ?auto_207015 ?auto_207017 ) ) ( not ( = ?auto_207015 ?auto_207018 ) ) ( not ( = ?auto_207015 ?auto_207019 ) ) ( not ( = ?auto_207015 ?auto_207020 ) ) ( not ( = ?auto_207015 ?auto_207021 ) ) ( not ( = ?auto_207015 ?auto_207022 ) ) ( not ( = ?auto_207015 ?auto_207023 ) ) ( not ( = ?auto_207015 ?auto_207024 ) ) ( not ( = ?auto_207016 ?auto_207017 ) ) ( not ( = ?auto_207016 ?auto_207018 ) ) ( not ( = ?auto_207016 ?auto_207019 ) ) ( not ( = ?auto_207016 ?auto_207020 ) ) ( not ( = ?auto_207016 ?auto_207021 ) ) ( not ( = ?auto_207016 ?auto_207022 ) ) ( not ( = ?auto_207016 ?auto_207023 ) ) ( not ( = ?auto_207016 ?auto_207024 ) ) ( not ( = ?auto_207017 ?auto_207018 ) ) ( not ( = ?auto_207017 ?auto_207019 ) ) ( not ( = ?auto_207017 ?auto_207020 ) ) ( not ( = ?auto_207017 ?auto_207021 ) ) ( not ( = ?auto_207017 ?auto_207022 ) ) ( not ( = ?auto_207017 ?auto_207023 ) ) ( not ( = ?auto_207017 ?auto_207024 ) ) ( not ( = ?auto_207018 ?auto_207019 ) ) ( not ( = ?auto_207018 ?auto_207020 ) ) ( not ( = ?auto_207018 ?auto_207021 ) ) ( not ( = ?auto_207018 ?auto_207022 ) ) ( not ( = ?auto_207018 ?auto_207023 ) ) ( not ( = ?auto_207018 ?auto_207024 ) ) ( not ( = ?auto_207019 ?auto_207020 ) ) ( not ( = ?auto_207019 ?auto_207021 ) ) ( not ( = ?auto_207019 ?auto_207022 ) ) ( not ( = ?auto_207019 ?auto_207023 ) ) ( not ( = ?auto_207019 ?auto_207024 ) ) ( not ( = ?auto_207020 ?auto_207021 ) ) ( not ( = ?auto_207020 ?auto_207022 ) ) ( not ( = ?auto_207020 ?auto_207023 ) ) ( not ( = ?auto_207020 ?auto_207024 ) ) ( not ( = ?auto_207021 ?auto_207022 ) ) ( not ( = ?auto_207021 ?auto_207023 ) ) ( not ( = ?auto_207021 ?auto_207024 ) ) ( not ( = ?auto_207022 ?auto_207023 ) ) ( not ( = ?auto_207022 ?auto_207024 ) ) ( not ( = ?auto_207023 ?auto_207024 ) ) ( ON ?auto_207022 ?auto_207023 ) ( ON ?auto_207021 ?auto_207022 ) ( ON ?auto_207020 ?auto_207021 ) ( ON ?auto_207019 ?auto_207020 ) ( ON ?auto_207018 ?auto_207019 ) ( ON ?auto_207017 ?auto_207018 ) ( CLEAR ?auto_207015 ) ( ON ?auto_207016 ?auto_207017 ) ( CLEAR ?auto_207016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207014 ?auto_207015 ?auto_207016 )
      ( MAKE-10PILE ?auto_207014 ?auto_207015 ?auto_207016 ?auto_207017 ?auto_207018 ?auto_207019 ?auto_207020 ?auto_207021 ?auto_207022 ?auto_207023 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207035 - BLOCK
      ?auto_207036 - BLOCK
      ?auto_207037 - BLOCK
      ?auto_207038 - BLOCK
      ?auto_207039 - BLOCK
      ?auto_207040 - BLOCK
      ?auto_207041 - BLOCK
      ?auto_207042 - BLOCK
      ?auto_207043 - BLOCK
      ?auto_207044 - BLOCK
    )
    :vars
    (
      ?auto_207045 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207044 ?auto_207045 ) ( ON-TABLE ?auto_207035 ) ( ON ?auto_207036 ?auto_207035 ) ( not ( = ?auto_207035 ?auto_207036 ) ) ( not ( = ?auto_207035 ?auto_207037 ) ) ( not ( = ?auto_207035 ?auto_207038 ) ) ( not ( = ?auto_207035 ?auto_207039 ) ) ( not ( = ?auto_207035 ?auto_207040 ) ) ( not ( = ?auto_207035 ?auto_207041 ) ) ( not ( = ?auto_207035 ?auto_207042 ) ) ( not ( = ?auto_207035 ?auto_207043 ) ) ( not ( = ?auto_207035 ?auto_207044 ) ) ( not ( = ?auto_207035 ?auto_207045 ) ) ( not ( = ?auto_207036 ?auto_207037 ) ) ( not ( = ?auto_207036 ?auto_207038 ) ) ( not ( = ?auto_207036 ?auto_207039 ) ) ( not ( = ?auto_207036 ?auto_207040 ) ) ( not ( = ?auto_207036 ?auto_207041 ) ) ( not ( = ?auto_207036 ?auto_207042 ) ) ( not ( = ?auto_207036 ?auto_207043 ) ) ( not ( = ?auto_207036 ?auto_207044 ) ) ( not ( = ?auto_207036 ?auto_207045 ) ) ( not ( = ?auto_207037 ?auto_207038 ) ) ( not ( = ?auto_207037 ?auto_207039 ) ) ( not ( = ?auto_207037 ?auto_207040 ) ) ( not ( = ?auto_207037 ?auto_207041 ) ) ( not ( = ?auto_207037 ?auto_207042 ) ) ( not ( = ?auto_207037 ?auto_207043 ) ) ( not ( = ?auto_207037 ?auto_207044 ) ) ( not ( = ?auto_207037 ?auto_207045 ) ) ( not ( = ?auto_207038 ?auto_207039 ) ) ( not ( = ?auto_207038 ?auto_207040 ) ) ( not ( = ?auto_207038 ?auto_207041 ) ) ( not ( = ?auto_207038 ?auto_207042 ) ) ( not ( = ?auto_207038 ?auto_207043 ) ) ( not ( = ?auto_207038 ?auto_207044 ) ) ( not ( = ?auto_207038 ?auto_207045 ) ) ( not ( = ?auto_207039 ?auto_207040 ) ) ( not ( = ?auto_207039 ?auto_207041 ) ) ( not ( = ?auto_207039 ?auto_207042 ) ) ( not ( = ?auto_207039 ?auto_207043 ) ) ( not ( = ?auto_207039 ?auto_207044 ) ) ( not ( = ?auto_207039 ?auto_207045 ) ) ( not ( = ?auto_207040 ?auto_207041 ) ) ( not ( = ?auto_207040 ?auto_207042 ) ) ( not ( = ?auto_207040 ?auto_207043 ) ) ( not ( = ?auto_207040 ?auto_207044 ) ) ( not ( = ?auto_207040 ?auto_207045 ) ) ( not ( = ?auto_207041 ?auto_207042 ) ) ( not ( = ?auto_207041 ?auto_207043 ) ) ( not ( = ?auto_207041 ?auto_207044 ) ) ( not ( = ?auto_207041 ?auto_207045 ) ) ( not ( = ?auto_207042 ?auto_207043 ) ) ( not ( = ?auto_207042 ?auto_207044 ) ) ( not ( = ?auto_207042 ?auto_207045 ) ) ( not ( = ?auto_207043 ?auto_207044 ) ) ( not ( = ?auto_207043 ?auto_207045 ) ) ( not ( = ?auto_207044 ?auto_207045 ) ) ( ON ?auto_207043 ?auto_207044 ) ( ON ?auto_207042 ?auto_207043 ) ( ON ?auto_207041 ?auto_207042 ) ( ON ?auto_207040 ?auto_207041 ) ( ON ?auto_207039 ?auto_207040 ) ( ON ?auto_207038 ?auto_207039 ) ( CLEAR ?auto_207036 ) ( ON ?auto_207037 ?auto_207038 ) ( CLEAR ?auto_207037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207035 ?auto_207036 ?auto_207037 )
      ( MAKE-10PILE ?auto_207035 ?auto_207036 ?auto_207037 ?auto_207038 ?auto_207039 ?auto_207040 ?auto_207041 ?auto_207042 ?auto_207043 ?auto_207044 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207056 - BLOCK
      ?auto_207057 - BLOCK
      ?auto_207058 - BLOCK
      ?auto_207059 - BLOCK
      ?auto_207060 - BLOCK
      ?auto_207061 - BLOCK
      ?auto_207062 - BLOCK
      ?auto_207063 - BLOCK
      ?auto_207064 - BLOCK
      ?auto_207065 - BLOCK
    )
    :vars
    (
      ?auto_207066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207065 ?auto_207066 ) ( ON-TABLE ?auto_207056 ) ( not ( = ?auto_207056 ?auto_207057 ) ) ( not ( = ?auto_207056 ?auto_207058 ) ) ( not ( = ?auto_207056 ?auto_207059 ) ) ( not ( = ?auto_207056 ?auto_207060 ) ) ( not ( = ?auto_207056 ?auto_207061 ) ) ( not ( = ?auto_207056 ?auto_207062 ) ) ( not ( = ?auto_207056 ?auto_207063 ) ) ( not ( = ?auto_207056 ?auto_207064 ) ) ( not ( = ?auto_207056 ?auto_207065 ) ) ( not ( = ?auto_207056 ?auto_207066 ) ) ( not ( = ?auto_207057 ?auto_207058 ) ) ( not ( = ?auto_207057 ?auto_207059 ) ) ( not ( = ?auto_207057 ?auto_207060 ) ) ( not ( = ?auto_207057 ?auto_207061 ) ) ( not ( = ?auto_207057 ?auto_207062 ) ) ( not ( = ?auto_207057 ?auto_207063 ) ) ( not ( = ?auto_207057 ?auto_207064 ) ) ( not ( = ?auto_207057 ?auto_207065 ) ) ( not ( = ?auto_207057 ?auto_207066 ) ) ( not ( = ?auto_207058 ?auto_207059 ) ) ( not ( = ?auto_207058 ?auto_207060 ) ) ( not ( = ?auto_207058 ?auto_207061 ) ) ( not ( = ?auto_207058 ?auto_207062 ) ) ( not ( = ?auto_207058 ?auto_207063 ) ) ( not ( = ?auto_207058 ?auto_207064 ) ) ( not ( = ?auto_207058 ?auto_207065 ) ) ( not ( = ?auto_207058 ?auto_207066 ) ) ( not ( = ?auto_207059 ?auto_207060 ) ) ( not ( = ?auto_207059 ?auto_207061 ) ) ( not ( = ?auto_207059 ?auto_207062 ) ) ( not ( = ?auto_207059 ?auto_207063 ) ) ( not ( = ?auto_207059 ?auto_207064 ) ) ( not ( = ?auto_207059 ?auto_207065 ) ) ( not ( = ?auto_207059 ?auto_207066 ) ) ( not ( = ?auto_207060 ?auto_207061 ) ) ( not ( = ?auto_207060 ?auto_207062 ) ) ( not ( = ?auto_207060 ?auto_207063 ) ) ( not ( = ?auto_207060 ?auto_207064 ) ) ( not ( = ?auto_207060 ?auto_207065 ) ) ( not ( = ?auto_207060 ?auto_207066 ) ) ( not ( = ?auto_207061 ?auto_207062 ) ) ( not ( = ?auto_207061 ?auto_207063 ) ) ( not ( = ?auto_207061 ?auto_207064 ) ) ( not ( = ?auto_207061 ?auto_207065 ) ) ( not ( = ?auto_207061 ?auto_207066 ) ) ( not ( = ?auto_207062 ?auto_207063 ) ) ( not ( = ?auto_207062 ?auto_207064 ) ) ( not ( = ?auto_207062 ?auto_207065 ) ) ( not ( = ?auto_207062 ?auto_207066 ) ) ( not ( = ?auto_207063 ?auto_207064 ) ) ( not ( = ?auto_207063 ?auto_207065 ) ) ( not ( = ?auto_207063 ?auto_207066 ) ) ( not ( = ?auto_207064 ?auto_207065 ) ) ( not ( = ?auto_207064 ?auto_207066 ) ) ( not ( = ?auto_207065 ?auto_207066 ) ) ( ON ?auto_207064 ?auto_207065 ) ( ON ?auto_207063 ?auto_207064 ) ( ON ?auto_207062 ?auto_207063 ) ( ON ?auto_207061 ?auto_207062 ) ( ON ?auto_207060 ?auto_207061 ) ( ON ?auto_207059 ?auto_207060 ) ( ON ?auto_207058 ?auto_207059 ) ( CLEAR ?auto_207056 ) ( ON ?auto_207057 ?auto_207058 ) ( CLEAR ?auto_207057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207056 ?auto_207057 )
      ( MAKE-10PILE ?auto_207056 ?auto_207057 ?auto_207058 ?auto_207059 ?auto_207060 ?auto_207061 ?auto_207062 ?auto_207063 ?auto_207064 ?auto_207065 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207077 - BLOCK
      ?auto_207078 - BLOCK
      ?auto_207079 - BLOCK
      ?auto_207080 - BLOCK
      ?auto_207081 - BLOCK
      ?auto_207082 - BLOCK
      ?auto_207083 - BLOCK
      ?auto_207084 - BLOCK
      ?auto_207085 - BLOCK
      ?auto_207086 - BLOCK
    )
    :vars
    (
      ?auto_207087 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207086 ?auto_207087 ) ( ON-TABLE ?auto_207077 ) ( not ( = ?auto_207077 ?auto_207078 ) ) ( not ( = ?auto_207077 ?auto_207079 ) ) ( not ( = ?auto_207077 ?auto_207080 ) ) ( not ( = ?auto_207077 ?auto_207081 ) ) ( not ( = ?auto_207077 ?auto_207082 ) ) ( not ( = ?auto_207077 ?auto_207083 ) ) ( not ( = ?auto_207077 ?auto_207084 ) ) ( not ( = ?auto_207077 ?auto_207085 ) ) ( not ( = ?auto_207077 ?auto_207086 ) ) ( not ( = ?auto_207077 ?auto_207087 ) ) ( not ( = ?auto_207078 ?auto_207079 ) ) ( not ( = ?auto_207078 ?auto_207080 ) ) ( not ( = ?auto_207078 ?auto_207081 ) ) ( not ( = ?auto_207078 ?auto_207082 ) ) ( not ( = ?auto_207078 ?auto_207083 ) ) ( not ( = ?auto_207078 ?auto_207084 ) ) ( not ( = ?auto_207078 ?auto_207085 ) ) ( not ( = ?auto_207078 ?auto_207086 ) ) ( not ( = ?auto_207078 ?auto_207087 ) ) ( not ( = ?auto_207079 ?auto_207080 ) ) ( not ( = ?auto_207079 ?auto_207081 ) ) ( not ( = ?auto_207079 ?auto_207082 ) ) ( not ( = ?auto_207079 ?auto_207083 ) ) ( not ( = ?auto_207079 ?auto_207084 ) ) ( not ( = ?auto_207079 ?auto_207085 ) ) ( not ( = ?auto_207079 ?auto_207086 ) ) ( not ( = ?auto_207079 ?auto_207087 ) ) ( not ( = ?auto_207080 ?auto_207081 ) ) ( not ( = ?auto_207080 ?auto_207082 ) ) ( not ( = ?auto_207080 ?auto_207083 ) ) ( not ( = ?auto_207080 ?auto_207084 ) ) ( not ( = ?auto_207080 ?auto_207085 ) ) ( not ( = ?auto_207080 ?auto_207086 ) ) ( not ( = ?auto_207080 ?auto_207087 ) ) ( not ( = ?auto_207081 ?auto_207082 ) ) ( not ( = ?auto_207081 ?auto_207083 ) ) ( not ( = ?auto_207081 ?auto_207084 ) ) ( not ( = ?auto_207081 ?auto_207085 ) ) ( not ( = ?auto_207081 ?auto_207086 ) ) ( not ( = ?auto_207081 ?auto_207087 ) ) ( not ( = ?auto_207082 ?auto_207083 ) ) ( not ( = ?auto_207082 ?auto_207084 ) ) ( not ( = ?auto_207082 ?auto_207085 ) ) ( not ( = ?auto_207082 ?auto_207086 ) ) ( not ( = ?auto_207082 ?auto_207087 ) ) ( not ( = ?auto_207083 ?auto_207084 ) ) ( not ( = ?auto_207083 ?auto_207085 ) ) ( not ( = ?auto_207083 ?auto_207086 ) ) ( not ( = ?auto_207083 ?auto_207087 ) ) ( not ( = ?auto_207084 ?auto_207085 ) ) ( not ( = ?auto_207084 ?auto_207086 ) ) ( not ( = ?auto_207084 ?auto_207087 ) ) ( not ( = ?auto_207085 ?auto_207086 ) ) ( not ( = ?auto_207085 ?auto_207087 ) ) ( not ( = ?auto_207086 ?auto_207087 ) ) ( ON ?auto_207085 ?auto_207086 ) ( ON ?auto_207084 ?auto_207085 ) ( ON ?auto_207083 ?auto_207084 ) ( ON ?auto_207082 ?auto_207083 ) ( ON ?auto_207081 ?auto_207082 ) ( ON ?auto_207080 ?auto_207081 ) ( ON ?auto_207079 ?auto_207080 ) ( CLEAR ?auto_207077 ) ( ON ?auto_207078 ?auto_207079 ) ( CLEAR ?auto_207078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207077 ?auto_207078 )
      ( MAKE-10PILE ?auto_207077 ?auto_207078 ?auto_207079 ?auto_207080 ?auto_207081 ?auto_207082 ?auto_207083 ?auto_207084 ?auto_207085 ?auto_207086 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207098 - BLOCK
      ?auto_207099 - BLOCK
      ?auto_207100 - BLOCK
      ?auto_207101 - BLOCK
      ?auto_207102 - BLOCK
      ?auto_207103 - BLOCK
      ?auto_207104 - BLOCK
      ?auto_207105 - BLOCK
      ?auto_207106 - BLOCK
      ?auto_207107 - BLOCK
    )
    :vars
    (
      ?auto_207108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207107 ?auto_207108 ) ( not ( = ?auto_207098 ?auto_207099 ) ) ( not ( = ?auto_207098 ?auto_207100 ) ) ( not ( = ?auto_207098 ?auto_207101 ) ) ( not ( = ?auto_207098 ?auto_207102 ) ) ( not ( = ?auto_207098 ?auto_207103 ) ) ( not ( = ?auto_207098 ?auto_207104 ) ) ( not ( = ?auto_207098 ?auto_207105 ) ) ( not ( = ?auto_207098 ?auto_207106 ) ) ( not ( = ?auto_207098 ?auto_207107 ) ) ( not ( = ?auto_207098 ?auto_207108 ) ) ( not ( = ?auto_207099 ?auto_207100 ) ) ( not ( = ?auto_207099 ?auto_207101 ) ) ( not ( = ?auto_207099 ?auto_207102 ) ) ( not ( = ?auto_207099 ?auto_207103 ) ) ( not ( = ?auto_207099 ?auto_207104 ) ) ( not ( = ?auto_207099 ?auto_207105 ) ) ( not ( = ?auto_207099 ?auto_207106 ) ) ( not ( = ?auto_207099 ?auto_207107 ) ) ( not ( = ?auto_207099 ?auto_207108 ) ) ( not ( = ?auto_207100 ?auto_207101 ) ) ( not ( = ?auto_207100 ?auto_207102 ) ) ( not ( = ?auto_207100 ?auto_207103 ) ) ( not ( = ?auto_207100 ?auto_207104 ) ) ( not ( = ?auto_207100 ?auto_207105 ) ) ( not ( = ?auto_207100 ?auto_207106 ) ) ( not ( = ?auto_207100 ?auto_207107 ) ) ( not ( = ?auto_207100 ?auto_207108 ) ) ( not ( = ?auto_207101 ?auto_207102 ) ) ( not ( = ?auto_207101 ?auto_207103 ) ) ( not ( = ?auto_207101 ?auto_207104 ) ) ( not ( = ?auto_207101 ?auto_207105 ) ) ( not ( = ?auto_207101 ?auto_207106 ) ) ( not ( = ?auto_207101 ?auto_207107 ) ) ( not ( = ?auto_207101 ?auto_207108 ) ) ( not ( = ?auto_207102 ?auto_207103 ) ) ( not ( = ?auto_207102 ?auto_207104 ) ) ( not ( = ?auto_207102 ?auto_207105 ) ) ( not ( = ?auto_207102 ?auto_207106 ) ) ( not ( = ?auto_207102 ?auto_207107 ) ) ( not ( = ?auto_207102 ?auto_207108 ) ) ( not ( = ?auto_207103 ?auto_207104 ) ) ( not ( = ?auto_207103 ?auto_207105 ) ) ( not ( = ?auto_207103 ?auto_207106 ) ) ( not ( = ?auto_207103 ?auto_207107 ) ) ( not ( = ?auto_207103 ?auto_207108 ) ) ( not ( = ?auto_207104 ?auto_207105 ) ) ( not ( = ?auto_207104 ?auto_207106 ) ) ( not ( = ?auto_207104 ?auto_207107 ) ) ( not ( = ?auto_207104 ?auto_207108 ) ) ( not ( = ?auto_207105 ?auto_207106 ) ) ( not ( = ?auto_207105 ?auto_207107 ) ) ( not ( = ?auto_207105 ?auto_207108 ) ) ( not ( = ?auto_207106 ?auto_207107 ) ) ( not ( = ?auto_207106 ?auto_207108 ) ) ( not ( = ?auto_207107 ?auto_207108 ) ) ( ON ?auto_207106 ?auto_207107 ) ( ON ?auto_207105 ?auto_207106 ) ( ON ?auto_207104 ?auto_207105 ) ( ON ?auto_207103 ?auto_207104 ) ( ON ?auto_207102 ?auto_207103 ) ( ON ?auto_207101 ?auto_207102 ) ( ON ?auto_207100 ?auto_207101 ) ( ON ?auto_207099 ?auto_207100 ) ( ON ?auto_207098 ?auto_207099 ) ( CLEAR ?auto_207098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207098 )
      ( MAKE-10PILE ?auto_207098 ?auto_207099 ?auto_207100 ?auto_207101 ?auto_207102 ?auto_207103 ?auto_207104 ?auto_207105 ?auto_207106 ?auto_207107 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_207119 - BLOCK
      ?auto_207120 - BLOCK
      ?auto_207121 - BLOCK
      ?auto_207122 - BLOCK
      ?auto_207123 - BLOCK
      ?auto_207124 - BLOCK
      ?auto_207125 - BLOCK
      ?auto_207126 - BLOCK
      ?auto_207127 - BLOCK
      ?auto_207128 - BLOCK
    )
    :vars
    (
      ?auto_207129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207128 ?auto_207129 ) ( not ( = ?auto_207119 ?auto_207120 ) ) ( not ( = ?auto_207119 ?auto_207121 ) ) ( not ( = ?auto_207119 ?auto_207122 ) ) ( not ( = ?auto_207119 ?auto_207123 ) ) ( not ( = ?auto_207119 ?auto_207124 ) ) ( not ( = ?auto_207119 ?auto_207125 ) ) ( not ( = ?auto_207119 ?auto_207126 ) ) ( not ( = ?auto_207119 ?auto_207127 ) ) ( not ( = ?auto_207119 ?auto_207128 ) ) ( not ( = ?auto_207119 ?auto_207129 ) ) ( not ( = ?auto_207120 ?auto_207121 ) ) ( not ( = ?auto_207120 ?auto_207122 ) ) ( not ( = ?auto_207120 ?auto_207123 ) ) ( not ( = ?auto_207120 ?auto_207124 ) ) ( not ( = ?auto_207120 ?auto_207125 ) ) ( not ( = ?auto_207120 ?auto_207126 ) ) ( not ( = ?auto_207120 ?auto_207127 ) ) ( not ( = ?auto_207120 ?auto_207128 ) ) ( not ( = ?auto_207120 ?auto_207129 ) ) ( not ( = ?auto_207121 ?auto_207122 ) ) ( not ( = ?auto_207121 ?auto_207123 ) ) ( not ( = ?auto_207121 ?auto_207124 ) ) ( not ( = ?auto_207121 ?auto_207125 ) ) ( not ( = ?auto_207121 ?auto_207126 ) ) ( not ( = ?auto_207121 ?auto_207127 ) ) ( not ( = ?auto_207121 ?auto_207128 ) ) ( not ( = ?auto_207121 ?auto_207129 ) ) ( not ( = ?auto_207122 ?auto_207123 ) ) ( not ( = ?auto_207122 ?auto_207124 ) ) ( not ( = ?auto_207122 ?auto_207125 ) ) ( not ( = ?auto_207122 ?auto_207126 ) ) ( not ( = ?auto_207122 ?auto_207127 ) ) ( not ( = ?auto_207122 ?auto_207128 ) ) ( not ( = ?auto_207122 ?auto_207129 ) ) ( not ( = ?auto_207123 ?auto_207124 ) ) ( not ( = ?auto_207123 ?auto_207125 ) ) ( not ( = ?auto_207123 ?auto_207126 ) ) ( not ( = ?auto_207123 ?auto_207127 ) ) ( not ( = ?auto_207123 ?auto_207128 ) ) ( not ( = ?auto_207123 ?auto_207129 ) ) ( not ( = ?auto_207124 ?auto_207125 ) ) ( not ( = ?auto_207124 ?auto_207126 ) ) ( not ( = ?auto_207124 ?auto_207127 ) ) ( not ( = ?auto_207124 ?auto_207128 ) ) ( not ( = ?auto_207124 ?auto_207129 ) ) ( not ( = ?auto_207125 ?auto_207126 ) ) ( not ( = ?auto_207125 ?auto_207127 ) ) ( not ( = ?auto_207125 ?auto_207128 ) ) ( not ( = ?auto_207125 ?auto_207129 ) ) ( not ( = ?auto_207126 ?auto_207127 ) ) ( not ( = ?auto_207126 ?auto_207128 ) ) ( not ( = ?auto_207126 ?auto_207129 ) ) ( not ( = ?auto_207127 ?auto_207128 ) ) ( not ( = ?auto_207127 ?auto_207129 ) ) ( not ( = ?auto_207128 ?auto_207129 ) ) ( ON ?auto_207127 ?auto_207128 ) ( ON ?auto_207126 ?auto_207127 ) ( ON ?auto_207125 ?auto_207126 ) ( ON ?auto_207124 ?auto_207125 ) ( ON ?auto_207123 ?auto_207124 ) ( ON ?auto_207122 ?auto_207123 ) ( ON ?auto_207121 ?auto_207122 ) ( ON ?auto_207120 ?auto_207121 ) ( ON ?auto_207119 ?auto_207120 ) ( CLEAR ?auto_207119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207119 )
      ( MAKE-10PILE ?auto_207119 ?auto_207120 ?auto_207121 ?auto_207122 ?auto_207123 ?auto_207124 ?auto_207125 ?auto_207126 ?auto_207127 ?auto_207128 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207141 - BLOCK
      ?auto_207142 - BLOCK
      ?auto_207143 - BLOCK
      ?auto_207144 - BLOCK
      ?auto_207145 - BLOCK
      ?auto_207146 - BLOCK
      ?auto_207147 - BLOCK
      ?auto_207148 - BLOCK
      ?auto_207149 - BLOCK
      ?auto_207150 - BLOCK
      ?auto_207151 - BLOCK
    )
    :vars
    (
      ?auto_207152 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207150 ) ( ON ?auto_207151 ?auto_207152 ) ( CLEAR ?auto_207151 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207141 ) ( ON ?auto_207142 ?auto_207141 ) ( ON ?auto_207143 ?auto_207142 ) ( ON ?auto_207144 ?auto_207143 ) ( ON ?auto_207145 ?auto_207144 ) ( ON ?auto_207146 ?auto_207145 ) ( ON ?auto_207147 ?auto_207146 ) ( ON ?auto_207148 ?auto_207147 ) ( ON ?auto_207149 ?auto_207148 ) ( ON ?auto_207150 ?auto_207149 ) ( not ( = ?auto_207141 ?auto_207142 ) ) ( not ( = ?auto_207141 ?auto_207143 ) ) ( not ( = ?auto_207141 ?auto_207144 ) ) ( not ( = ?auto_207141 ?auto_207145 ) ) ( not ( = ?auto_207141 ?auto_207146 ) ) ( not ( = ?auto_207141 ?auto_207147 ) ) ( not ( = ?auto_207141 ?auto_207148 ) ) ( not ( = ?auto_207141 ?auto_207149 ) ) ( not ( = ?auto_207141 ?auto_207150 ) ) ( not ( = ?auto_207141 ?auto_207151 ) ) ( not ( = ?auto_207141 ?auto_207152 ) ) ( not ( = ?auto_207142 ?auto_207143 ) ) ( not ( = ?auto_207142 ?auto_207144 ) ) ( not ( = ?auto_207142 ?auto_207145 ) ) ( not ( = ?auto_207142 ?auto_207146 ) ) ( not ( = ?auto_207142 ?auto_207147 ) ) ( not ( = ?auto_207142 ?auto_207148 ) ) ( not ( = ?auto_207142 ?auto_207149 ) ) ( not ( = ?auto_207142 ?auto_207150 ) ) ( not ( = ?auto_207142 ?auto_207151 ) ) ( not ( = ?auto_207142 ?auto_207152 ) ) ( not ( = ?auto_207143 ?auto_207144 ) ) ( not ( = ?auto_207143 ?auto_207145 ) ) ( not ( = ?auto_207143 ?auto_207146 ) ) ( not ( = ?auto_207143 ?auto_207147 ) ) ( not ( = ?auto_207143 ?auto_207148 ) ) ( not ( = ?auto_207143 ?auto_207149 ) ) ( not ( = ?auto_207143 ?auto_207150 ) ) ( not ( = ?auto_207143 ?auto_207151 ) ) ( not ( = ?auto_207143 ?auto_207152 ) ) ( not ( = ?auto_207144 ?auto_207145 ) ) ( not ( = ?auto_207144 ?auto_207146 ) ) ( not ( = ?auto_207144 ?auto_207147 ) ) ( not ( = ?auto_207144 ?auto_207148 ) ) ( not ( = ?auto_207144 ?auto_207149 ) ) ( not ( = ?auto_207144 ?auto_207150 ) ) ( not ( = ?auto_207144 ?auto_207151 ) ) ( not ( = ?auto_207144 ?auto_207152 ) ) ( not ( = ?auto_207145 ?auto_207146 ) ) ( not ( = ?auto_207145 ?auto_207147 ) ) ( not ( = ?auto_207145 ?auto_207148 ) ) ( not ( = ?auto_207145 ?auto_207149 ) ) ( not ( = ?auto_207145 ?auto_207150 ) ) ( not ( = ?auto_207145 ?auto_207151 ) ) ( not ( = ?auto_207145 ?auto_207152 ) ) ( not ( = ?auto_207146 ?auto_207147 ) ) ( not ( = ?auto_207146 ?auto_207148 ) ) ( not ( = ?auto_207146 ?auto_207149 ) ) ( not ( = ?auto_207146 ?auto_207150 ) ) ( not ( = ?auto_207146 ?auto_207151 ) ) ( not ( = ?auto_207146 ?auto_207152 ) ) ( not ( = ?auto_207147 ?auto_207148 ) ) ( not ( = ?auto_207147 ?auto_207149 ) ) ( not ( = ?auto_207147 ?auto_207150 ) ) ( not ( = ?auto_207147 ?auto_207151 ) ) ( not ( = ?auto_207147 ?auto_207152 ) ) ( not ( = ?auto_207148 ?auto_207149 ) ) ( not ( = ?auto_207148 ?auto_207150 ) ) ( not ( = ?auto_207148 ?auto_207151 ) ) ( not ( = ?auto_207148 ?auto_207152 ) ) ( not ( = ?auto_207149 ?auto_207150 ) ) ( not ( = ?auto_207149 ?auto_207151 ) ) ( not ( = ?auto_207149 ?auto_207152 ) ) ( not ( = ?auto_207150 ?auto_207151 ) ) ( not ( = ?auto_207150 ?auto_207152 ) ) ( not ( = ?auto_207151 ?auto_207152 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207151 ?auto_207152 )
      ( !STACK ?auto_207151 ?auto_207150 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207164 - BLOCK
      ?auto_207165 - BLOCK
      ?auto_207166 - BLOCK
      ?auto_207167 - BLOCK
      ?auto_207168 - BLOCK
      ?auto_207169 - BLOCK
      ?auto_207170 - BLOCK
      ?auto_207171 - BLOCK
      ?auto_207172 - BLOCK
      ?auto_207173 - BLOCK
      ?auto_207174 - BLOCK
    )
    :vars
    (
      ?auto_207175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207173 ) ( ON ?auto_207174 ?auto_207175 ) ( CLEAR ?auto_207174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207164 ) ( ON ?auto_207165 ?auto_207164 ) ( ON ?auto_207166 ?auto_207165 ) ( ON ?auto_207167 ?auto_207166 ) ( ON ?auto_207168 ?auto_207167 ) ( ON ?auto_207169 ?auto_207168 ) ( ON ?auto_207170 ?auto_207169 ) ( ON ?auto_207171 ?auto_207170 ) ( ON ?auto_207172 ?auto_207171 ) ( ON ?auto_207173 ?auto_207172 ) ( not ( = ?auto_207164 ?auto_207165 ) ) ( not ( = ?auto_207164 ?auto_207166 ) ) ( not ( = ?auto_207164 ?auto_207167 ) ) ( not ( = ?auto_207164 ?auto_207168 ) ) ( not ( = ?auto_207164 ?auto_207169 ) ) ( not ( = ?auto_207164 ?auto_207170 ) ) ( not ( = ?auto_207164 ?auto_207171 ) ) ( not ( = ?auto_207164 ?auto_207172 ) ) ( not ( = ?auto_207164 ?auto_207173 ) ) ( not ( = ?auto_207164 ?auto_207174 ) ) ( not ( = ?auto_207164 ?auto_207175 ) ) ( not ( = ?auto_207165 ?auto_207166 ) ) ( not ( = ?auto_207165 ?auto_207167 ) ) ( not ( = ?auto_207165 ?auto_207168 ) ) ( not ( = ?auto_207165 ?auto_207169 ) ) ( not ( = ?auto_207165 ?auto_207170 ) ) ( not ( = ?auto_207165 ?auto_207171 ) ) ( not ( = ?auto_207165 ?auto_207172 ) ) ( not ( = ?auto_207165 ?auto_207173 ) ) ( not ( = ?auto_207165 ?auto_207174 ) ) ( not ( = ?auto_207165 ?auto_207175 ) ) ( not ( = ?auto_207166 ?auto_207167 ) ) ( not ( = ?auto_207166 ?auto_207168 ) ) ( not ( = ?auto_207166 ?auto_207169 ) ) ( not ( = ?auto_207166 ?auto_207170 ) ) ( not ( = ?auto_207166 ?auto_207171 ) ) ( not ( = ?auto_207166 ?auto_207172 ) ) ( not ( = ?auto_207166 ?auto_207173 ) ) ( not ( = ?auto_207166 ?auto_207174 ) ) ( not ( = ?auto_207166 ?auto_207175 ) ) ( not ( = ?auto_207167 ?auto_207168 ) ) ( not ( = ?auto_207167 ?auto_207169 ) ) ( not ( = ?auto_207167 ?auto_207170 ) ) ( not ( = ?auto_207167 ?auto_207171 ) ) ( not ( = ?auto_207167 ?auto_207172 ) ) ( not ( = ?auto_207167 ?auto_207173 ) ) ( not ( = ?auto_207167 ?auto_207174 ) ) ( not ( = ?auto_207167 ?auto_207175 ) ) ( not ( = ?auto_207168 ?auto_207169 ) ) ( not ( = ?auto_207168 ?auto_207170 ) ) ( not ( = ?auto_207168 ?auto_207171 ) ) ( not ( = ?auto_207168 ?auto_207172 ) ) ( not ( = ?auto_207168 ?auto_207173 ) ) ( not ( = ?auto_207168 ?auto_207174 ) ) ( not ( = ?auto_207168 ?auto_207175 ) ) ( not ( = ?auto_207169 ?auto_207170 ) ) ( not ( = ?auto_207169 ?auto_207171 ) ) ( not ( = ?auto_207169 ?auto_207172 ) ) ( not ( = ?auto_207169 ?auto_207173 ) ) ( not ( = ?auto_207169 ?auto_207174 ) ) ( not ( = ?auto_207169 ?auto_207175 ) ) ( not ( = ?auto_207170 ?auto_207171 ) ) ( not ( = ?auto_207170 ?auto_207172 ) ) ( not ( = ?auto_207170 ?auto_207173 ) ) ( not ( = ?auto_207170 ?auto_207174 ) ) ( not ( = ?auto_207170 ?auto_207175 ) ) ( not ( = ?auto_207171 ?auto_207172 ) ) ( not ( = ?auto_207171 ?auto_207173 ) ) ( not ( = ?auto_207171 ?auto_207174 ) ) ( not ( = ?auto_207171 ?auto_207175 ) ) ( not ( = ?auto_207172 ?auto_207173 ) ) ( not ( = ?auto_207172 ?auto_207174 ) ) ( not ( = ?auto_207172 ?auto_207175 ) ) ( not ( = ?auto_207173 ?auto_207174 ) ) ( not ( = ?auto_207173 ?auto_207175 ) ) ( not ( = ?auto_207174 ?auto_207175 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207174 ?auto_207175 )
      ( !STACK ?auto_207174 ?auto_207173 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207187 - BLOCK
      ?auto_207188 - BLOCK
      ?auto_207189 - BLOCK
      ?auto_207190 - BLOCK
      ?auto_207191 - BLOCK
      ?auto_207192 - BLOCK
      ?auto_207193 - BLOCK
      ?auto_207194 - BLOCK
      ?auto_207195 - BLOCK
      ?auto_207196 - BLOCK
      ?auto_207197 - BLOCK
    )
    :vars
    (
      ?auto_207198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207197 ?auto_207198 ) ( ON-TABLE ?auto_207187 ) ( ON ?auto_207188 ?auto_207187 ) ( ON ?auto_207189 ?auto_207188 ) ( ON ?auto_207190 ?auto_207189 ) ( ON ?auto_207191 ?auto_207190 ) ( ON ?auto_207192 ?auto_207191 ) ( ON ?auto_207193 ?auto_207192 ) ( ON ?auto_207194 ?auto_207193 ) ( ON ?auto_207195 ?auto_207194 ) ( not ( = ?auto_207187 ?auto_207188 ) ) ( not ( = ?auto_207187 ?auto_207189 ) ) ( not ( = ?auto_207187 ?auto_207190 ) ) ( not ( = ?auto_207187 ?auto_207191 ) ) ( not ( = ?auto_207187 ?auto_207192 ) ) ( not ( = ?auto_207187 ?auto_207193 ) ) ( not ( = ?auto_207187 ?auto_207194 ) ) ( not ( = ?auto_207187 ?auto_207195 ) ) ( not ( = ?auto_207187 ?auto_207196 ) ) ( not ( = ?auto_207187 ?auto_207197 ) ) ( not ( = ?auto_207187 ?auto_207198 ) ) ( not ( = ?auto_207188 ?auto_207189 ) ) ( not ( = ?auto_207188 ?auto_207190 ) ) ( not ( = ?auto_207188 ?auto_207191 ) ) ( not ( = ?auto_207188 ?auto_207192 ) ) ( not ( = ?auto_207188 ?auto_207193 ) ) ( not ( = ?auto_207188 ?auto_207194 ) ) ( not ( = ?auto_207188 ?auto_207195 ) ) ( not ( = ?auto_207188 ?auto_207196 ) ) ( not ( = ?auto_207188 ?auto_207197 ) ) ( not ( = ?auto_207188 ?auto_207198 ) ) ( not ( = ?auto_207189 ?auto_207190 ) ) ( not ( = ?auto_207189 ?auto_207191 ) ) ( not ( = ?auto_207189 ?auto_207192 ) ) ( not ( = ?auto_207189 ?auto_207193 ) ) ( not ( = ?auto_207189 ?auto_207194 ) ) ( not ( = ?auto_207189 ?auto_207195 ) ) ( not ( = ?auto_207189 ?auto_207196 ) ) ( not ( = ?auto_207189 ?auto_207197 ) ) ( not ( = ?auto_207189 ?auto_207198 ) ) ( not ( = ?auto_207190 ?auto_207191 ) ) ( not ( = ?auto_207190 ?auto_207192 ) ) ( not ( = ?auto_207190 ?auto_207193 ) ) ( not ( = ?auto_207190 ?auto_207194 ) ) ( not ( = ?auto_207190 ?auto_207195 ) ) ( not ( = ?auto_207190 ?auto_207196 ) ) ( not ( = ?auto_207190 ?auto_207197 ) ) ( not ( = ?auto_207190 ?auto_207198 ) ) ( not ( = ?auto_207191 ?auto_207192 ) ) ( not ( = ?auto_207191 ?auto_207193 ) ) ( not ( = ?auto_207191 ?auto_207194 ) ) ( not ( = ?auto_207191 ?auto_207195 ) ) ( not ( = ?auto_207191 ?auto_207196 ) ) ( not ( = ?auto_207191 ?auto_207197 ) ) ( not ( = ?auto_207191 ?auto_207198 ) ) ( not ( = ?auto_207192 ?auto_207193 ) ) ( not ( = ?auto_207192 ?auto_207194 ) ) ( not ( = ?auto_207192 ?auto_207195 ) ) ( not ( = ?auto_207192 ?auto_207196 ) ) ( not ( = ?auto_207192 ?auto_207197 ) ) ( not ( = ?auto_207192 ?auto_207198 ) ) ( not ( = ?auto_207193 ?auto_207194 ) ) ( not ( = ?auto_207193 ?auto_207195 ) ) ( not ( = ?auto_207193 ?auto_207196 ) ) ( not ( = ?auto_207193 ?auto_207197 ) ) ( not ( = ?auto_207193 ?auto_207198 ) ) ( not ( = ?auto_207194 ?auto_207195 ) ) ( not ( = ?auto_207194 ?auto_207196 ) ) ( not ( = ?auto_207194 ?auto_207197 ) ) ( not ( = ?auto_207194 ?auto_207198 ) ) ( not ( = ?auto_207195 ?auto_207196 ) ) ( not ( = ?auto_207195 ?auto_207197 ) ) ( not ( = ?auto_207195 ?auto_207198 ) ) ( not ( = ?auto_207196 ?auto_207197 ) ) ( not ( = ?auto_207196 ?auto_207198 ) ) ( not ( = ?auto_207197 ?auto_207198 ) ) ( CLEAR ?auto_207195 ) ( ON ?auto_207196 ?auto_207197 ) ( CLEAR ?auto_207196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207187 ?auto_207188 ?auto_207189 ?auto_207190 ?auto_207191 ?auto_207192 ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 )
      ( MAKE-11PILE ?auto_207187 ?auto_207188 ?auto_207189 ?auto_207190 ?auto_207191 ?auto_207192 ?auto_207193 ?auto_207194 ?auto_207195 ?auto_207196 ?auto_207197 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207210 - BLOCK
      ?auto_207211 - BLOCK
      ?auto_207212 - BLOCK
      ?auto_207213 - BLOCK
      ?auto_207214 - BLOCK
      ?auto_207215 - BLOCK
      ?auto_207216 - BLOCK
      ?auto_207217 - BLOCK
      ?auto_207218 - BLOCK
      ?auto_207219 - BLOCK
      ?auto_207220 - BLOCK
    )
    :vars
    (
      ?auto_207221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207220 ?auto_207221 ) ( ON-TABLE ?auto_207210 ) ( ON ?auto_207211 ?auto_207210 ) ( ON ?auto_207212 ?auto_207211 ) ( ON ?auto_207213 ?auto_207212 ) ( ON ?auto_207214 ?auto_207213 ) ( ON ?auto_207215 ?auto_207214 ) ( ON ?auto_207216 ?auto_207215 ) ( ON ?auto_207217 ?auto_207216 ) ( ON ?auto_207218 ?auto_207217 ) ( not ( = ?auto_207210 ?auto_207211 ) ) ( not ( = ?auto_207210 ?auto_207212 ) ) ( not ( = ?auto_207210 ?auto_207213 ) ) ( not ( = ?auto_207210 ?auto_207214 ) ) ( not ( = ?auto_207210 ?auto_207215 ) ) ( not ( = ?auto_207210 ?auto_207216 ) ) ( not ( = ?auto_207210 ?auto_207217 ) ) ( not ( = ?auto_207210 ?auto_207218 ) ) ( not ( = ?auto_207210 ?auto_207219 ) ) ( not ( = ?auto_207210 ?auto_207220 ) ) ( not ( = ?auto_207210 ?auto_207221 ) ) ( not ( = ?auto_207211 ?auto_207212 ) ) ( not ( = ?auto_207211 ?auto_207213 ) ) ( not ( = ?auto_207211 ?auto_207214 ) ) ( not ( = ?auto_207211 ?auto_207215 ) ) ( not ( = ?auto_207211 ?auto_207216 ) ) ( not ( = ?auto_207211 ?auto_207217 ) ) ( not ( = ?auto_207211 ?auto_207218 ) ) ( not ( = ?auto_207211 ?auto_207219 ) ) ( not ( = ?auto_207211 ?auto_207220 ) ) ( not ( = ?auto_207211 ?auto_207221 ) ) ( not ( = ?auto_207212 ?auto_207213 ) ) ( not ( = ?auto_207212 ?auto_207214 ) ) ( not ( = ?auto_207212 ?auto_207215 ) ) ( not ( = ?auto_207212 ?auto_207216 ) ) ( not ( = ?auto_207212 ?auto_207217 ) ) ( not ( = ?auto_207212 ?auto_207218 ) ) ( not ( = ?auto_207212 ?auto_207219 ) ) ( not ( = ?auto_207212 ?auto_207220 ) ) ( not ( = ?auto_207212 ?auto_207221 ) ) ( not ( = ?auto_207213 ?auto_207214 ) ) ( not ( = ?auto_207213 ?auto_207215 ) ) ( not ( = ?auto_207213 ?auto_207216 ) ) ( not ( = ?auto_207213 ?auto_207217 ) ) ( not ( = ?auto_207213 ?auto_207218 ) ) ( not ( = ?auto_207213 ?auto_207219 ) ) ( not ( = ?auto_207213 ?auto_207220 ) ) ( not ( = ?auto_207213 ?auto_207221 ) ) ( not ( = ?auto_207214 ?auto_207215 ) ) ( not ( = ?auto_207214 ?auto_207216 ) ) ( not ( = ?auto_207214 ?auto_207217 ) ) ( not ( = ?auto_207214 ?auto_207218 ) ) ( not ( = ?auto_207214 ?auto_207219 ) ) ( not ( = ?auto_207214 ?auto_207220 ) ) ( not ( = ?auto_207214 ?auto_207221 ) ) ( not ( = ?auto_207215 ?auto_207216 ) ) ( not ( = ?auto_207215 ?auto_207217 ) ) ( not ( = ?auto_207215 ?auto_207218 ) ) ( not ( = ?auto_207215 ?auto_207219 ) ) ( not ( = ?auto_207215 ?auto_207220 ) ) ( not ( = ?auto_207215 ?auto_207221 ) ) ( not ( = ?auto_207216 ?auto_207217 ) ) ( not ( = ?auto_207216 ?auto_207218 ) ) ( not ( = ?auto_207216 ?auto_207219 ) ) ( not ( = ?auto_207216 ?auto_207220 ) ) ( not ( = ?auto_207216 ?auto_207221 ) ) ( not ( = ?auto_207217 ?auto_207218 ) ) ( not ( = ?auto_207217 ?auto_207219 ) ) ( not ( = ?auto_207217 ?auto_207220 ) ) ( not ( = ?auto_207217 ?auto_207221 ) ) ( not ( = ?auto_207218 ?auto_207219 ) ) ( not ( = ?auto_207218 ?auto_207220 ) ) ( not ( = ?auto_207218 ?auto_207221 ) ) ( not ( = ?auto_207219 ?auto_207220 ) ) ( not ( = ?auto_207219 ?auto_207221 ) ) ( not ( = ?auto_207220 ?auto_207221 ) ) ( CLEAR ?auto_207218 ) ( ON ?auto_207219 ?auto_207220 ) ( CLEAR ?auto_207219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207210 ?auto_207211 ?auto_207212 ?auto_207213 ?auto_207214 ?auto_207215 ?auto_207216 ?auto_207217 ?auto_207218 ?auto_207219 )
      ( MAKE-11PILE ?auto_207210 ?auto_207211 ?auto_207212 ?auto_207213 ?auto_207214 ?auto_207215 ?auto_207216 ?auto_207217 ?auto_207218 ?auto_207219 ?auto_207220 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207233 - BLOCK
      ?auto_207234 - BLOCK
      ?auto_207235 - BLOCK
      ?auto_207236 - BLOCK
      ?auto_207237 - BLOCK
      ?auto_207238 - BLOCK
      ?auto_207239 - BLOCK
      ?auto_207240 - BLOCK
      ?auto_207241 - BLOCK
      ?auto_207242 - BLOCK
      ?auto_207243 - BLOCK
    )
    :vars
    (
      ?auto_207244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207243 ?auto_207244 ) ( ON-TABLE ?auto_207233 ) ( ON ?auto_207234 ?auto_207233 ) ( ON ?auto_207235 ?auto_207234 ) ( ON ?auto_207236 ?auto_207235 ) ( ON ?auto_207237 ?auto_207236 ) ( ON ?auto_207238 ?auto_207237 ) ( ON ?auto_207239 ?auto_207238 ) ( ON ?auto_207240 ?auto_207239 ) ( not ( = ?auto_207233 ?auto_207234 ) ) ( not ( = ?auto_207233 ?auto_207235 ) ) ( not ( = ?auto_207233 ?auto_207236 ) ) ( not ( = ?auto_207233 ?auto_207237 ) ) ( not ( = ?auto_207233 ?auto_207238 ) ) ( not ( = ?auto_207233 ?auto_207239 ) ) ( not ( = ?auto_207233 ?auto_207240 ) ) ( not ( = ?auto_207233 ?auto_207241 ) ) ( not ( = ?auto_207233 ?auto_207242 ) ) ( not ( = ?auto_207233 ?auto_207243 ) ) ( not ( = ?auto_207233 ?auto_207244 ) ) ( not ( = ?auto_207234 ?auto_207235 ) ) ( not ( = ?auto_207234 ?auto_207236 ) ) ( not ( = ?auto_207234 ?auto_207237 ) ) ( not ( = ?auto_207234 ?auto_207238 ) ) ( not ( = ?auto_207234 ?auto_207239 ) ) ( not ( = ?auto_207234 ?auto_207240 ) ) ( not ( = ?auto_207234 ?auto_207241 ) ) ( not ( = ?auto_207234 ?auto_207242 ) ) ( not ( = ?auto_207234 ?auto_207243 ) ) ( not ( = ?auto_207234 ?auto_207244 ) ) ( not ( = ?auto_207235 ?auto_207236 ) ) ( not ( = ?auto_207235 ?auto_207237 ) ) ( not ( = ?auto_207235 ?auto_207238 ) ) ( not ( = ?auto_207235 ?auto_207239 ) ) ( not ( = ?auto_207235 ?auto_207240 ) ) ( not ( = ?auto_207235 ?auto_207241 ) ) ( not ( = ?auto_207235 ?auto_207242 ) ) ( not ( = ?auto_207235 ?auto_207243 ) ) ( not ( = ?auto_207235 ?auto_207244 ) ) ( not ( = ?auto_207236 ?auto_207237 ) ) ( not ( = ?auto_207236 ?auto_207238 ) ) ( not ( = ?auto_207236 ?auto_207239 ) ) ( not ( = ?auto_207236 ?auto_207240 ) ) ( not ( = ?auto_207236 ?auto_207241 ) ) ( not ( = ?auto_207236 ?auto_207242 ) ) ( not ( = ?auto_207236 ?auto_207243 ) ) ( not ( = ?auto_207236 ?auto_207244 ) ) ( not ( = ?auto_207237 ?auto_207238 ) ) ( not ( = ?auto_207237 ?auto_207239 ) ) ( not ( = ?auto_207237 ?auto_207240 ) ) ( not ( = ?auto_207237 ?auto_207241 ) ) ( not ( = ?auto_207237 ?auto_207242 ) ) ( not ( = ?auto_207237 ?auto_207243 ) ) ( not ( = ?auto_207237 ?auto_207244 ) ) ( not ( = ?auto_207238 ?auto_207239 ) ) ( not ( = ?auto_207238 ?auto_207240 ) ) ( not ( = ?auto_207238 ?auto_207241 ) ) ( not ( = ?auto_207238 ?auto_207242 ) ) ( not ( = ?auto_207238 ?auto_207243 ) ) ( not ( = ?auto_207238 ?auto_207244 ) ) ( not ( = ?auto_207239 ?auto_207240 ) ) ( not ( = ?auto_207239 ?auto_207241 ) ) ( not ( = ?auto_207239 ?auto_207242 ) ) ( not ( = ?auto_207239 ?auto_207243 ) ) ( not ( = ?auto_207239 ?auto_207244 ) ) ( not ( = ?auto_207240 ?auto_207241 ) ) ( not ( = ?auto_207240 ?auto_207242 ) ) ( not ( = ?auto_207240 ?auto_207243 ) ) ( not ( = ?auto_207240 ?auto_207244 ) ) ( not ( = ?auto_207241 ?auto_207242 ) ) ( not ( = ?auto_207241 ?auto_207243 ) ) ( not ( = ?auto_207241 ?auto_207244 ) ) ( not ( = ?auto_207242 ?auto_207243 ) ) ( not ( = ?auto_207242 ?auto_207244 ) ) ( not ( = ?auto_207243 ?auto_207244 ) ) ( ON ?auto_207242 ?auto_207243 ) ( CLEAR ?auto_207240 ) ( ON ?auto_207241 ?auto_207242 ) ( CLEAR ?auto_207241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207233 ?auto_207234 ?auto_207235 ?auto_207236 ?auto_207237 ?auto_207238 ?auto_207239 ?auto_207240 ?auto_207241 )
      ( MAKE-11PILE ?auto_207233 ?auto_207234 ?auto_207235 ?auto_207236 ?auto_207237 ?auto_207238 ?auto_207239 ?auto_207240 ?auto_207241 ?auto_207242 ?auto_207243 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207256 - BLOCK
      ?auto_207257 - BLOCK
      ?auto_207258 - BLOCK
      ?auto_207259 - BLOCK
      ?auto_207260 - BLOCK
      ?auto_207261 - BLOCK
      ?auto_207262 - BLOCK
      ?auto_207263 - BLOCK
      ?auto_207264 - BLOCK
      ?auto_207265 - BLOCK
      ?auto_207266 - BLOCK
    )
    :vars
    (
      ?auto_207267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207266 ?auto_207267 ) ( ON-TABLE ?auto_207256 ) ( ON ?auto_207257 ?auto_207256 ) ( ON ?auto_207258 ?auto_207257 ) ( ON ?auto_207259 ?auto_207258 ) ( ON ?auto_207260 ?auto_207259 ) ( ON ?auto_207261 ?auto_207260 ) ( ON ?auto_207262 ?auto_207261 ) ( ON ?auto_207263 ?auto_207262 ) ( not ( = ?auto_207256 ?auto_207257 ) ) ( not ( = ?auto_207256 ?auto_207258 ) ) ( not ( = ?auto_207256 ?auto_207259 ) ) ( not ( = ?auto_207256 ?auto_207260 ) ) ( not ( = ?auto_207256 ?auto_207261 ) ) ( not ( = ?auto_207256 ?auto_207262 ) ) ( not ( = ?auto_207256 ?auto_207263 ) ) ( not ( = ?auto_207256 ?auto_207264 ) ) ( not ( = ?auto_207256 ?auto_207265 ) ) ( not ( = ?auto_207256 ?auto_207266 ) ) ( not ( = ?auto_207256 ?auto_207267 ) ) ( not ( = ?auto_207257 ?auto_207258 ) ) ( not ( = ?auto_207257 ?auto_207259 ) ) ( not ( = ?auto_207257 ?auto_207260 ) ) ( not ( = ?auto_207257 ?auto_207261 ) ) ( not ( = ?auto_207257 ?auto_207262 ) ) ( not ( = ?auto_207257 ?auto_207263 ) ) ( not ( = ?auto_207257 ?auto_207264 ) ) ( not ( = ?auto_207257 ?auto_207265 ) ) ( not ( = ?auto_207257 ?auto_207266 ) ) ( not ( = ?auto_207257 ?auto_207267 ) ) ( not ( = ?auto_207258 ?auto_207259 ) ) ( not ( = ?auto_207258 ?auto_207260 ) ) ( not ( = ?auto_207258 ?auto_207261 ) ) ( not ( = ?auto_207258 ?auto_207262 ) ) ( not ( = ?auto_207258 ?auto_207263 ) ) ( not ( = ?auto_207258 ?auto_207264 ) ) ( not ( = ?auto_207258 ?auto_207265 ) ) ( not ( = ?auto_207258 ?auto_207266 ) ) ( not ( = ?auto_207258 ?auto_207267 ) ) ( not ( = ?auto_207259 ?auto_207260 ) ) ( not ( = ?auto_207259 ?auto_207261 ) ) ( not ( = ?auto_207259 ?auto_207262 ) ) ( not ( = ?auto_207259 ?auto_207263 ) ) ( not ( = ?auto_207259 ?auto_207264 ) ) ( not ( = ?auto_207259 ?auto_207265 ) ) ( not ( = ?auto_207259 ?auto_207266 ) ) ( not ( = ?auto_207259 ?auto_207267 ) ) ( not ( = ?auto_207260 ?auto_207261 ) ) ( not ( = ?auto_207260 ?auto_207262 ) ) ( not ( = ?auto_207260 ?auto_207263 ) ) ( not ( = ?auto_207260 ?auto_207264 ) ) ( not ( = ?auto_207260 ?auto_207265 ) ) ( not ( = ?auto_207260 ?auto_207266 ) ) ( not ( = ?auto_207260 ?auto_207267 ) ) ( not ( = ?auto_207261 ?auto_207262 ) ) ( not ( = ?auto_207261 ?auto_207263 ) ) ( not ( = ?auto_207261 ?auto_207264 ) ) ( not ( = ?auto_207261 ?auto_207265 ) ) ( not ( = ?auto_207261 ?auto_207266 ) ) ( not ( = ?auto_207261 ?auto_207267 ) ) ( not ( = ?auto_207262 ?auto_207263 ) ) ( not ( = ?auto_207262 ?auto_207264 ) ) ( not ( = ?auto_207262 ?auto_207265 ) ) ( not ( = ?auto_207262 ?auto_207266 ) ) ( not ( = ?auto_207262 ?auto_207267 ) ) ( not ( = ?auto_207263 ?auto_207264 ) ) ( not ( = ?auto_207263 ?auto_207265 ) ) ( not ( = ?auto_207263 ?auto_207266 ) ) ( not ( = ?auto_207263 ?auto_207267 ) ) ( not ( = ?auto_207264 ?auto_207265 ) ) ( not ( = ?auto_207264 ?auto_207266 ) ) ( not ( = ?auto_207264 ?auto_207267 ) ) ( not ( = ?auto_207265 ?auto_207266 ) ) ( not ( = ?auto_207265 ?auto_207267 ) ) ( not ( = ?auto_207266 ?auto_207267 ) ) ( ON ?auto_207265 ?auto_207266 ) ( CLEAR ?auto_207263 ) ( ON ?auto_207264 ?auto_207265 ) ( CLEAR ?auto_207264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207256 ?auto_207257 ?auto_207258 ?auto_207259 ?auto_207260 ?auto_207261 ?auto_207262 ?auto_207263 ?auto_207264 )
      ( MAKE-11PILE ?auto_207256 ?auto_207257 ?auto_207258 ?auto_207259 ?auto_207260 ?auto_207261 ?auto_207262 ?auto_207263 ?auto_207264 ?auto_207265 ?auto_207266 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207279 - BLOCK
      ?auto_207280 - BLOCK
      ?auto_207281 - BLOCK
      ?auto_207282 - BLOCK
      ?auto_207283 - BLOCK
      ?auto_207284 - BLOCK
      ?auto_207285 - BLOCK
      ?auto_207286 - BLOCK
      ?auto_207287 - BLOCK
      ?auto_207288 - BLOCK
      ?auto_207289 - BLOCK
    )
    :vars
    (
      ?auto_207290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207289 ?auto_207290 ) ( ON-TABLE ?auto_207279 ) ( ON ?auto_207280 ?auto_207279 ) ( ON ?auto_207281 ?auto_207280 ) ( ON ?auto_207282 ?auto_207281 ) ( ON ?auto_207283 ?auto_207282 ) ( ON ?auto_207284 ?auto_207283 ) ( ON ?auto_207285 ?auto_207284 ) ( not ( = ?auto_207279 ?auto_207280 ) ) ( not ( = ?auto_207279 ?auto_207281 ) ) ( not ( = ?auto_207279 ?auto_207282 ) ) ( not ( = ?auto_207279 ?auto_207283 ) ) ( not ( = ?auto_207279 ?auto_207284 ) ) ( not ( = ?auto_207279 ?auto_207285 ) ) ( not ( = ?auto_207279 ?auto_207286 ) ) ( not ( = ?auto_207279 ?auto_207287 ) ) ( not ( = ?auto_207279 ?auto_207288 ) ) ( not ( = ?auto_207279 ?auto_207289 ) ) ( not ( = ?auto_207279 ?auto_207290 ) ) ( not ( = ?auto_207280 ?auto_207281 ) ) ( not ( = ?auto_207280 ?auto_207282 ) ) ( not ( = ?auto_207280 ?auto_207283 ) ) ( not ( = ?auto_207280 ?auto_207284 ) ) ( not ( = ?auto_207280 ?auto_207285 ) ) ( not ( = ?auto_207280 ?auto_207286 ) ) ( not ( = ?auto_207280 ?auto_207287 ) ) ( not ( = ?auto_207280 ?auto_207288 ) ) ( not ( = ?auto_207280 ?auto_207289 ) ) ( not ( = ?auto_207280 ?auto_207290 ) ) ( not ( = ?auto_207281 ?auto_207282 ) ) ( not ( = ?auto_207281 ?auto_207283 ) ) ( not ( = ?auto_207281 ?auto_207284 ) ) ( not ( = ?auto_207281 ?auto_207285 ) ) ( not ( = ?auto_207281 ?auto_207286 ) ) ( not ( = ?auto_207281 ?auto_207287 ) ) ( not ( = ?auto_207281 ?auto_207288 ) ) ( not ( = ?auto_207281 ?auto_207289 ) ) ( not ( = ?auto_207281 ?auto_207290 ) ) ( not ( = ?auto_207282 ?auto_207283 ) ) ( not ( = ?auto_207282 ?auto_207284 ) ) ( not ( = ?auto_207282 ?auto_207285 ) ) ( not ( = ?auto_207282 ?auto_207286 ) ) ( not ( = ?auto_207282 ?auto_207287 ) ) ( not ( = ?auto_207282 ?auto_207288 ) ) ( not ( = ?auto_207282 ?auto_207289 ) ) ( not ( = ?auto_207282 ?auto_207290 ) ) ( not ( = ?auto_207283 ?auto_207284 ) ) ( not ( = ?auto_207283 ?auto_207285 ) ) ( not ( = ?auto_207283 ?auto_207286 ) ) ( not ( = ?auto_207283 ?auto_207287 ) ) ( not ( = ?auto_207283 ?auto_207288 ) ) ( not ( = ?auto_207283 ?auto_207289 ) ) ( not ( = ?auto_207283 ?auto_207290 ) ) ( not ( = ?auto_207284 ?auto_207285 ) ) ( not ( = ?auto_207284 ?auto_207286 ) ) ( not ( = ?auto_207284 ?auto_207287 ) ) ( not ( = ?auto_207284 ?auto_207288 ) ) ( not ( = ?auto_207284 ?auto_207289 ) ) ( not ( = ?auto_207284 ?auto_207290 ) ) ( not ( = ?auto_207285 ?auto_207286 ) ) ( not ( = ?auto_207285 ?auto_207287 ) ) ( not ( = ?auto_207285 ?auto_207288 ) ) ( not ( = ?auto_207285 ?auto_207289 ) ) ( not ( = ?auto_207285 ?auto_207290 ) ) ( not ( = ?auto_207286 ?auto_207287 ) ) ( not ( = ?auto_207286 ?auto_207288 ) ) ( not ( = ?auto_207286 ?auto_207289 ) ) ( not ( = ?auto_207286 ?auto_207290 ) ) ( not ( = ?auto_207287 ?auto_207288 ) ) ( not ( = ?auto_207287 ?auto_207289 ) ) ( not ( = ?auto_207287 ?auto_207290 ) ) ( not ( = ?auto_207288 ?auto_207289 ) ) ( not ( = ?auto_207288 ?auto_207290 ) ) ( not ( = ?auto_207289 ?auto_207290 ) ) ( ON ?auto_207288 ?auto_207289 ) ( ON ?auto_207287 ?auto_207288 ) ( CLEAR ?auto_207285 ) ( ON ?auto_207286 ?auto_207287 ) ( CLEAR ?auto_207286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207279 ?auto_207280 ?auto_207281 ?auto_207282 ?auto_207283 ?auto_207284 ?auto_207285 ?auto_207286 )
      ( MAKE-11PILE ?auto_207279 ?auto_207280 ?auto_207281 ?auto_207282 ?auto_207283 ?auto_207284 ?auto_207285 ?auto_207286 ?auto_207287 ?auto_207288 ?auto_207289 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207302 - BLOCK
      ?auto_207303 - BLOCK
      ?auto_207304 - BLOCK
      ?auto_207305 - BLOCK
      ?auto_207306 - BLOCK
      ?auto_207307 - BLOCK
      ?auto_207308 - BLOCK
      ?auto_207309 - BLOCK
      ?auto_207310 - BLOCK
      ?auto_207311 - BLOCK
      ?auto_207312 - BLOCK
    )
    :vars
    (
      ?auto_207313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207312 ?auto_207313 ) ( ON-TABLE ?auto_207302 ) ( ON ?auto_207303 ?auto_207302 ) ( ON ?auto_207304 ?auto_207303 ) ( ON ?auto_207305 ?auto_207304 ) ( ON ?auto_207306 ?auto_207305 ) ( ON ?auto_207307 ?auto_207306 ) ( ON ?auto_207308 ?auto_207307 ) ( not ( = ?auto_207302 ?auto_207303 ) ) ( not ( = ?auto_207302 ?auto_207304 ) ) ( not ( = ?auto_207302 ?auto_207305 ) ) ( not ( = ?auto_207302 ?auto_207306 ) ) ( not ( = ?auto_207302 ?auto_207307 ) ) ( not ( = ?auto_207302 ?auto_207308 ) ) ( not ( = ?auto_207302 ?auto_207309 ) ) ( not ( = ?auto_207302 ?auto_207310 ) ) ( not ( = ?auto_207302 ?auto_207311 ) ) ( not ( = ?auto_207302 ?auto_207312 ) ) ( not ( = ?auto_207302 ?auto_207313 ) ) ( not ( = ?auto_207303 ?auto_207304 ) ) ( not ( = ?auto_207303 ?auto_207305 ) ) ( not ( = ?auto_207303 ?auto_207306 ) ) ( not ( = ?auto_207303 ?auto_207307 ) ) ( not ( = ?auto_207303 ?auto_207308 ) ) ( not ( = ?auto_207303 ?auto_207309 ) ) ( not ( = ?auto_207303 ?auto_207310 ) ) ( not ( = ?auto_207303 ?auto_207311 ) ) ( not ( = ?auto_207303 ?auto_207312 ) ) ( not ( = ?auto_207303 ?auto_207313 ) ) ( not ( = ?auto_207304 ?auto_207305 ) ) ( not ( = ?auto_207304 ?auto_207306 ) ) ( not ( = ?auto_207304 ?auto_207307 ) ) ( not ( = ?auto_207304 ?auto_207308 ) ) ( not ( = ?auto_207304 ?auto_207309 ) ) ( not ( = ?auto_207304 ?auto_207310 ) ) ( not ( = ?auto_207304 ?auto_207311 ) ) ( not ( = ?auto_207304 ?auto_207312 ) ) ( not ( = ?auto_207304 ?auto_207313 ) ) ( not ( = ?auto_207305 ?auto_207306 ) ) ( not ( = ?auto_207305 ?auto_207307 ) ) ( not ( = ?auto_207305 ?auto_207308 ) ) ( not ( = ?auto_207305 ?auto_207309 ) ) ( not ( = ?auto_207305 ?auto_207310 ) ) ( not ( = ?auto_207305 ?auto_207311 ) ) ( not ( = ?auto_207305 ?auto_207312 ) ) ( not ( = ?auto_207305 ?auto_207313 ) ) ( not ( = ?auto_207306 ?auto_207307 ) ) ( not ( = ?auto_207306 ?auto_207308 ) ) ( not ( = ?auto_207306 ?auto_207309 ) ) ( not ( = ?auto_207306 ?auto_207310 ) ) ( not ( = ?auto_207306 ?auto_207311 ) ) ( not ( = ?auto_207306 ?auto_207312 ) ) ( not ( = ?auto_207306 ?auto_207313 ) ) ( not ( = ?auto_207307 ?auto_207308 ) ) ( not ( = ?auto_207307 ?auto_207309 ) ) ( not ( = ?auto_207307 ?auto_207310 ) ) ( not ( = ?auto_207307 ?auto_207311 ) ) ( not ( = ?auto_207307 ?auto_207312 ) ) ( not ( = ?auto_207307 ?auto_207313 ) ) ( not ( = ?auto_207308 ?auto_207309 ) ) ( not ( = ?auto_207308 ?auto_207310 ) ) ( not ( = ?auto_207308 ?auto_207311 ) ) ( not ( = ?auto_207308 ?auto_207312 ) ) ( not ( = ?auto_207308 ?auto_207313 ) ) ( not ( = ?auto_207309 ?auto_207310 ) ) ( not ( = ?auto_207309 ?auto_207311 ) ) ( not ( = ?auto_207309 ?auto_207312 ) ) ( not ( = ?auto_207309 ?auto_207313 ) ) ( not ( = ?auto_207310 ?auto_207311 ) ) ( not ( = ?auto_207310 ?auto_207312 ) ) ( not ( = ?auto_207310 ?auto_207313 ) ) ( not ( = ?auto_207311 ?auto_207312 ) ) ( not ( = ?auto_207311 ?auto_207313 ) ) ( not ( = ?auto_207312 ?auto_207313 ) ) ( ON ?auto_207311 ?auto_207312 ) ( ON ?auto_207310 ?auto_207311 ) ( CLEAR ?auto_207308 ) ( ON ?auto_207309 ?auto_207310 ) ( CLEAR ?auto_207309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207302 ?auto_207303 ?auto_207304 ?auto_207305 ?auto_207306 ?auto_207307 ?auto_207308 ?auto_207309 )
      ( MAKE-11PILE ?auto_207302 ?auto_207303 ?auto_207304 ?auto_207305 ?auto_207306 ?auto_207307 ?auto_207308 ?auto_207309 ?auto_207310 ?auto_207311 ?auto_207312 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207325 - BLOCK
      ?auto_207326 - BLOCK
      ?auto_207327 - BLOCK
      ?auto_207328 - BLOCK
      ?auto_207329 - BLOCK
      ?auto_207330 - BLOCK
      ?auto_207331 - BLOCK
      ?auto_207332 - BLOCK
      ?auto_207333 - BLOCK
      ?auto_207334 - BLOCK
      ?auto_207335 - BLOCK
    )
    :vars
    (
      ?auto_207336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207335 ?auto_207336 ) ( ON-TABLE ?auto_207325 ) ( ON ?auto_207326 ?auto_207325 ) ( ON ?auto_207327 ?auto_207326 ) ( ON ?auto_207328 ?auto_207327 ) ( ON ?auto_207329 ?auto_207328 ) ( ON ?auto_207330 ?auto_207329 ) ( not ( = ?auto_207325 ?auto_207326 ) ) ( not ( = ?auto_207325 ?auto_207327 ) ) ( not ( = ?auto_207325 ?auto_207328 ) ) ( not ( = ?auto_207325 ?auto_207329 ) ) ( not ( = ?auto_207325 ?auto_207330 ) ) ( not ( = ?auto_207325 ?auto_207331 ) ) ( not ( = ?auto_207325 ?auto_207332 ) ) ( not ( = ?auto_207325 ?auto_207333 ) ) ( not ( = ?auto_207325 ?auto_207334 ) ) ( not ( = ?auto_207325 ?auto_207335 ) ) ( not ( = ?auto_207325 ?auto_207336 ) ) ( not ( = ?auto_207326 ?auto_207327 ) ) ( not ( = ?auto_207326 ?auto_207328 ) ) ( not ( = ?auto_207326 ?auto_207329 ) ) ( not ( = ?auto_207326 ?auto_207330 ) ) ( not ( = ?auto_207326 ?auto_207331 ) ) ( not ( = ?auto_207326 ?auto_207332 ) ) ( not ( = ?auto_207326 ?auto_207333 ) ) ( not ( = ?auto_207326 ?auto_207334 ) ) ( not ( = ?auto_207326 ?auto_207335 ) ) ( not ( = ?auto_207326 ?auto_207336 ) ) ( not ( = ?auto_207327 ?auto_207328 ) ) ( not ( = ?auto_207327 ?auto_207329 ) ) ( not ( = ?auto_207327 ?auto_207330 ) ) ( not ( = ?auto_207327 ?auto_207331 ) ) ( not ( = ?auto_207327 ?auto_207332 ) ) ( not ( = ?auto_207327 ?auto_207333 ) ) ( not ( = ?auto_207327 ?auto_207334 ) ) ( not ( = ?auto_207327 ?auto_207335 ) ) ( not ( = ?auto_207327 ?auto_207336 ) ) ( not ( = ?auto_207328 ?auto_207329 ) ) ( not ( = ?auto_207328 ?auto_207330 ) ) ( not ( = ?auto_207328 ?auto_207331 ) ) ( not ( = ?auto_207328 ?auto_207332 ) ) ( not ( = ?auto_207328 ?auto_207333 ) ) ( not ( = ?auto_207328 ?auto_207334 ) ) ( not ( = ?auto_207328 ?auto_207335 ) ) ( not ( = ?auto_207328 ?auto_207336 ) ) ( not ( = ?auto_207329 ?auto_207330 ) ) ( not ( = ?auto_207329 ?auto_207331 ) ) ( not ( = ?auto_207329 ?auto_207332 ) ) ( not ( = ?auto_207329 ?auto_207333 ) ) ( not ( = ?auto_207329 ?auto_207334 ) ) ( not ( = ?auto_207329 ?auto_207335 ) ) ( not ( = ?auto_207329 ?auto_207336 ) ) ( not ( = ?auto_207330 ?auto_207331 ) ) ( not ( = ?auto_207330 ?auto_207332 ) ) ( not ( = ?auto_207330 ?auto_207333 ) ) ( not ( = ?auto_207330 ?auto_207334 ) ) ( not ( = ?auto_207330 ?auto_207335 ) ) ( not ( = ?auto_207330 ?auto_207336 ) ) ( not ( = ?auto_207331 ?auto_207332 ) ) ( not ( = ?auto_207331 ?auto_207333 ) ) ( not ( = ?auto_207331 ?auto_207334 ) ) ( not ( = ?auto_207331 ?auto_207335 ) ) ( not ( = ?auto_207331 ?auto_207336 ) ) ( not ( = ?auto_207332 ?auto_207333 ) ) ( not ( = ?auto_207332 ?auto_207334 ) ) ( not ( = ?auto_207332 ?auto_207335 ) ) ( not ( = ?auto_207332 ?auto_207336 ) ) ( not ( = ?auto_207333 ?auto_207334 ) ) ( not ( = ?auto_207333 ?auto_207335 ) ) ( not ( = ?auto_207333 ?auto_207336 ) ) ( not ( = ?auto_207334 ?auto_207335 ) ) ( not ( = ?auto_207334 ?auto_207336 ) ) ( not ( = ?auto_207335 ?auto_207336 ) ) ( ON ?auto_207334 ?auto_207335 ) ( ON ?auto_207333 ?auto_207334 ) ( ON ?auto_207332 ?auto_207333 ) ( CLEAR ?auto_207330 ) ( ON ?auto_207331 ?auto_207332 ) ( CLEAR ?auto_207331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207325 ?auto_207326 ?auto_207327 ?auto_207328 ?auto_207329 ?auto_207330 ?auto_207331 )
      ( MAKE-11PILE ?auto_207325 ?auto_207326 ?auto_207327 ?auto_207328 ?auto_207329 ?auto_207330 ?auto_207331 ?auto_207332 ?auto_207333 ?auto_207334 ?auto_207335 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207348 - BLOCK
      ?auto_207349 - BLOCK
      ?auto_207350 - BLOCK
      ?auto_207351 - BLOCK
      ?auto_207352 - BLOCK
      ?auto_207353 - BLOCK
      ?auto_207354 - BLOCK
      ?auto_207355 - BLOCK
      ?auto_207356 - BLOCK
      ?auto_207357 - BLOCK
      ?auto_207358 - BLOCK
    )
    :vars
    (
      ?auto_207359 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207358 ?auto_207359 ) ( ON-TABLE ?auto_207348 ) ( ON ?auto_207349 ?auto_207348 ) ( ON ?auto_207350 ?auto_207349 ) ( ON ?auto_207351 ?auto_207350 ) ( ON ?auto_207352 ?auto_207351 ) ( ON ?auto_207353 ?auto_207352 ) ( not ( = ?auto_207348 ?auto_207349 ) ) ( not ( = ?auto_207348 ?auto_207350 ) ) ( not ( = ?auto_207348 ?auto_207351 ) ) ( not ( = ?auto_207348 ?auto_207352 ) ) ( not ( = ?auto_207348 ?auto_207353 ) ) ( not ( = ?auto_207348 ?auto_207354 ) ) ( not ( = ?auto_207348 ?auto_207355 ) ) ( not ( = ?auto_207348 ?auto_207356 ) ) ( not ( = ?auto_207348 ?auto_207357 ) ) ( not ( = ?auto_207348 ?auto_207358 ) ) ( not ( = ?auto_207348 ?auto_207359 ) ) ( not ( = ?auto_207349 ?auto_207350 ) ) ( not ( = ?auto_207349 ?auto_207351 ) ) ( not ( = ?auto_207349 ?auto_207352 ) ) ( not ( = ?auto_207349 ?auto_207353 ) ) ( not ( = ?auto_207349 ?auto_207354 ) ) ( not ( = ?auto_207349 ?auto_207355 ) ) ( not ( = ?auto_207349 ?auto_207356 ) ) ( not ( = ?auto_207349 ?auto_207357 ) ) ( not ( = ?auto_207349 ?auto_207358 ) ) ( not ( = ?auto_207349 ?auto_207359 ) ) ( not ( = ?auto_207350 ?auto_207351 ) ) ( not ( = ?auto_207350 ?auto_207352 ) ) ( not ( = ?auto_207350 ?auto_207353 ) ) ( not ( = ?auto_207350 ?auto_207354 ) ) ( not ( = ?auto_207350 ?auto_207355 ) ) ( not ( = ?auto_207350 ?auto_207356 ) ) ( not ( = ?auto_207350 ?auto_207357 ) ) ( not ( = ?auto_207350 ?auto_207358 ) ) ( not ( = ?auto_207350 ?auto_207359 ) ) ( not ( = ?auto_207351 ?auto_207352 ) ) ( not ( = ?auto_207351 ?auto_207353 ) ) ( not ( = ?auto_207351 ?auto_207354 ) ) ( not ( = ?auto_207351 ?auto_207355 ) ) ( not ( = ?auto_207351 ?auto_207356 ) ) ( not ( = ?auto_207351 ?auto_207357 ) ) ( not ( = ?auto_207351 ?auto_207358 ) ) ( not ( = ?auto_207351 ?auto_207359 ) ) ( not ( = ?auto_207352 ?auto_207353 ) ) ( not ( = ?auto_207352 ?auto_207354 ) ) ( not ( = ?auto_207352 ?auto_207355 ) ) ( not ( = ?auto_207352 ?auto_207356 ) ) ( not ( = ?auto_207352 ?auto_207357 ) ) ( not ( = ?auto_207352 ?auto_207358 ) ) ( not ( = ?auto_207352 ?auto_207359 ) ) ( not ( = ?auto_207353 ?auto_207354 ) ) ( not ( = ?auto_207353 ?auto_207355 ) ) ( not ( = ?auto_207353 ?auto_207356 ) ) ( not ( = ?auto_207353 ?auto_207357 ) ) ( not ( = ?auto_207353 ?auto_207358 ) ) ( not ( = ?auto_207353 ?auto_207359 ) ) ( not ( = ?auto_207354 ?auto_207355 ) ) ( not ( = ?auto_207354 ?auto_207356 ) ) ( not ( = ?auto_207354 ?auto_207357 ) ) ( not ( = ?auto_207354 ?auto_207358 ) ) ( not ( = ?auto_207354 ?auto_207359 ) ) ( not ( = ?auto_207355 ?auto_207356 ) ) ( not ( = ?auto_207355 ?auto_207357 ) ) ( not ( = ?auto_207355 ?auto_207358 ) ) ( not ( = ?auto_207355 ?auto_207359 ) ) ( not ( = ?auto_207356 ?auto_207357 ) ) ( not ( = ?auto_207356 ?auto_207358 ) ) ( not ( = ?auto_207356 ?auto_207359 ) ) ( not ( = ?auto_207357 ?auto_207358 ) ) ( not ( = ?auto_207357 ?auto_207359 ) ) ( not ( = ?auto_207358 ?auto_207359 ) ) ( ON ?auto_207357 ?auto_207358 ) ( ON ?auto_207356 ?auto_207357 ) ( ON ?auto_207355 ?auto_207356 ) ( CLEAR ?auto_207353 ) ( ON ?auto_207354 ?auto_207355 ) ( CLEAR ?auto_207354 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207348 ?auto_207349 ?auto_207350 ?auto_207351 ?auto_207352 ?auto_207353 ?auto_207354 )
      ( MAKE-11PILE ?auto_207348 ?auto_207349 ?auto_207350 ?auto_207351 ?auto_207352 ?auto_207353 ?auto_207354 ?auto_207355 ?auto_207356 ?auto_207357 ?auto_207358 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207371 - BLOCK
      ?auto_207372 - BLOCK
      ?auto_207373 - BLOCK
      ?auto_207374 - BLOCK
      ?auto_207375 - BLOCK
      ?auto_207376 - BLOCK
      ?auto_207377 - BLOCK
      ?auto_207378 - BLOCK
      ?auto_207379 - BLOCK
      ?auto_207380 - BLOCK
      ?auto_207381 - BLOCK
    )
    :vars
    (
      ?auto_207382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207381 ?auto_207382 ) ( ON-TABLE ?auto_207371 ) ( ON ?auto_207372 ?auto_207371 ) ( ON ?auto_207373 ?auto_207372 ) ( ON ?auto_207374 ?auto_207373 ) ( ON ?auto_207375 ?auto_207374 ) ( not ( = ?auto_207371 ?auto_207372 ) ) ( not ( = ?auto_207371 ?auto_207373 ) ) ( not ( = ?auto_207371 ?auto_207374 ) ) ( not ( = ?auto_207371 ?auto_207375 ) ) ( not ( = ?auto_207371 ?auto_207376 ) ) ( not ( = ?auto_207371 ?auto_207377 ) ) ( not ( = ?auto_207371 ?auto_207378 ) ) ( not ( = ?auto_207371 ?auto_207379 ) ) ( not ( = ?auto_207371 ?auto_207380 ) ) ( not ( = ?auto_207371 ?auto_207381 ) ) ( not ( = ?auto_207371 ?auto_207382 ) ) ( not ( = ?auto_207372 ?auto_207373 ) ) ( not ( = ?auto_207372 ?auto_207374 ) ) ( not ( = ?auto_207372 ?auto_207375 ) ) ( not ( = ?auto_207372 ?auto_207376 ) ) ( not ( = ?auto_207372 ?auto_207377 ) ) ( not ( = ?auto_207372 ?auto_207378 ) ) ( not ( = ?auto_207372 ?auto_207379 ) ) ( not ( = ?auto_207372 ?auto_207380 ) ) ( not ( = ?auto_207372 ?auto_207381 ) ) ( not ( = ?auto_207372 ?auto_207382 ) ) ( not ( = ?auto_207373 ?auto_207374 ) ) ( not ( = ?auto_207373 ?auto_207375 ) ) ( not ( = ?auto_207373 ?auto_207376 ) ) ( not ( = ?auto_207373 ?auto_207377 ) ) ( not ( = ?auto_207373 ?auto_207378 ) ) ( not ( = ?auto_207373 ?auto_207379 ) ) ( not ( = ?auto_207373 ?auto_207380 ) ) ( not ( = ?auto_207373 ?auto_207381 ) ) ( not ( = ?auto_207373 ?auto_207382 ) ) ( not ( = ?auto_207374 ?auto_207375 ) ) ( not ( = ?auto_207374 ?auto_207376 ) ) ( not ( = ?auto_207374 ?auto_207377 ) ) ( not ( = ?auto_207374 ?auto_207378 ) ) ( not ( = ?auto_207374 ?auto_207379 ) ) ( not ( = ?auto_207374 ?auto_207380 ) ) ( not ( = ?auto_207374 ?auto_207381 ) ) ( not ( = ?auto_207374 ?auto_207382 ) ) ( not ( = ?auto_207375 ?auto_207376 ) ) ( not ( = ?auto_207375 ?auto_207377 ) ) ( not ( = ?auto_207375 ?auto_207378 ) ) ( not ( = ?auto_207375 ?auto_207379 ) ) ( not ( = ?auto_207375 ?auto_207380 ) ) ( not ( = ?auto_207375 ?auto_207381 ) ) ( not ( = ?auto_207375 ?auto_207382 ) ) ( not ( = ?auto_207376 ?auto_207377 ) ) ( not ( = ?auto_207376 ?auto_207378 ) ) ( not ( = ?auto_207376 ?auto_207379 ) ) ( not ( = ?auto_207376 ?auto_207380 ) ) ( not ( = ?auto_207376 ?auto_207381 ) ) ( not ( = ?auto_207376 ?auto_207382 ) ) ( not ( = ?auto_207377 ?auto_207378 ) ) ( not ( = ?auto_207377 ?auto_207379 ) ) ( not ( = ?auto_207377 ?auto_207380 ) ) ( not ( = ?auto_207377 ?auto_207381 ) ) ( not ( = ?auto_207377 ?auto_207382 ) ) ( not ( = ?auto_207378 ?auto_207379 ) ) ( not ( = ?auto_207378 ?auto_207380 ) ) ( not ( = ?auto_207378 ?auto_207381 ) ) ( not ( = ?auto_207378 ?auto_207382 ) ) ( not ( = ?auto_207379 ?auto_207380 ) ) ( not ( = ?auto_207379 ?auto_207381 ) ) ( not ( = ?auto_207379 ?auto_207382 ) ) ( not ( = ?auto_207380 ?auto_207381 ) ) ( not ( = ?auto_207380 ?auto_207382 ) ) ( not ( = ?auto_207381 ?auto_207382 ) ) ( ON ?auto_207380 ?auto_207381 ) ( ON ?auto_207379 ?auto_207380 ) ( ON ?auto_207378 ?auto_207379 ) ( ON ?auto_207377 ?auto_207378 ) ( CLEAR ?auto_207375 ) ( ON ?auto_207376 ?auto_207377 ) ( CLEAR ?auto_207376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207371 ?auto_207372 ?auto_207373 ?auto_207374 ?auto_207375 ?auto_207376 )
      ( MAKE-11PILE ?auto_207371 ?auto_207372 ?auto_207373 ?auto_207374 ?auto_207375 ?auto_207376 ?auto_207377 ?auto_207378 ?auto_207379 ?auto_207380 ?auto_207381 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207394 - BLOCK
      ?auto_207395 - BLOCK
      ?auto_207396 - BLOCK
      ?auto_207397 - BLOCK
      ?auto_207398 - BLOCK
      ?auto_207399 - BLOCK
      ?auto_207400 - BLOCK
      ?auto_207401 - BLOCK
      ?auto_207402 - BLOCK
      ?auto_207403 - BLOCK
      ?auto_207404 - BLOCK
    )
    :vars
    (
      ?auto_207405 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207404 ?auto_207405 ) ( ON-TABLE ?auto_207394 ) ( ON ?auto_207395 ?auto_207394 ) ( ON ?auto_207396 ?auto_207395 ) ( ON ?auto_207397 ?auto_207396 ) ( ON ?auto_207398 ?auto_207397 ) ( not ( = ?auto_207394 ?auto_207395 ) ) ( not ( = ?auto_207394 ?auto_207396 ) ) ( not ( = ?auto_207394 ?auto_207397 ) ) ( not ( = ?auto_207394 ?auto_207398 ) ) ( not ( = ?auto_207394 ?auto_207399 ) ) ( not ( = ?auto_207394 ?auto_207400 ) ) ( not ( = ?auto_207394 ?auto_207401 ) ) ( not ( = ?auto_207394 ?auto_207402 ) ) ( not ( = ?auto_207394 ?auto_207403 ) ) ( not ( = ?auto_207394 ?auto_207404 ) ) ( not ( = ?auto_207394 ?auto_207405 ) ) ( not ( = ?auto_207395 ?auto_207396 ) ) ( not ( = ?auto_207395 ?auto_207397 ) ) ( not ( = ?auto_207395 ?auto_207398 ) ) ( not ( = ?auto_207395 ?auto_207399 ) ) ( not ( = ?auto_207395 ?auto_207400 ) ) ( not ( = ?auto_207395 ?auto_207401 ) ) ( not ( = ?auto_207395 ?auto_207402 ) ) ( not ( = ?auto_207395 ?auto_207403 ) ) ( not ( = ?auto_207395 ?auto_207404 ) ) ( not ( = ?auto_207395 ?auto_207405 ) ) ( not ( = ?auto_207396 ?auto_207397 ) ) ( not ( = ?auto_207396 ?auto_207398 ) ) ( not ( = ?auto_207396 ?auto_207399 ) ) ( not ( = ?auto_207396 ?auto_207400 ) ) ( not ( = ?auto_207396 ?auto_207401 ) ) ( not ( = ?auto_207396 ?auto_207402 ) ) ( not ( = ?auto_207396 ?auto_207403 ) ) ( not ( = ?auto_207396 ?auto_207404 ) ) ( not ( = ?auto_207396 ?auto_207405 ) ) ( not ( = ?auto_207397 ?auto_207398 ) ) ( not ( = ?auto_207397 ?auto_207399 ) ) ( not ( = ?auto_207397 ?auto_207400 ) ) ( not ( = ?auto_207397 ?auto_207401 ) ) ( not ( = ?auto_207397 ?auto_207402 ) ) ( not ( = ?auto_207397 ?auto_207403 ) ) ( not ( = ?auto_207397 ?auto_207404 ) ) ( not ( = ?auto_207397 ?auto_207405 ) ) ( not ( = ?auto_207398 ?auto_207399 ) ) ( not ( = ?auto_207398 ?auto_207400 ) ) ( not ( = ?auto_207398 ?auto_207401 ) ) ( not ( = ?auto_207398 ?auto_207402 ) ) ( not ( = ?auto_207398 ?auto_207403 ) ) ( not ( = ?auto_207398 ?auto_207404 ) ) ( not ( = ?auto_207398 ?auto_207405 ) ) ( not ( = ?auto_207399 ?auto_207400 ) ) ( not ( = ?auto_207399 ?auto_207401 ) ) ( not ( = ?auto_207399 ?auto_207402 ) ) ( not ( = ?auto_207399 ?auto_207403 ) ) ( not ( = ?auto_207399 ?auto_207404 ) ) ( not ( = ?auto_207399 ?auto_207405 ) ) ( not ( = ?auto_207400 ?auto_207401 ) ) ( not ( = ?auto_207400 ?auto_207402 ) ) ( not ( = ?auto_207400 ?auto_207403 ) ) ( not ( = ?auto_207400 ?auto_207404 ) ) ( not ( = ?auto_207400 ?auto_207405 ) ) ( not ( = ?auto_207401 ?auto_207402 ) ) ( not ( = ?auto_207401 ?auto_207403 ) ) ( not ( = ?auto_207401 ?auto_207404 ) ) ( not ( = ?auto_207401 ?auto_207405 ) ) ( not ( = ?auto_207402 ?auto_207403 ) ) ( not ( = ?auto_207402 ?auto_207404 ) ) ( not ( = ?auto_207402 ?auto_207405 ) ) ( not ( = ?auto_207403 ?auto_207404 ) ) ( not ( = ?auto_207403 ?auto_207405 ) ) ( not ( = ?auto_207404 ?auto_207405 ) ) ( ON ?auto_207403 ?auto_207404 ) ( ON ?auto_207402 ?auto_207403 ) ( ON ?auto_207401 ?auto_207402 ) ( ON ?auto_207400 ?auto_207401 ) ( CLEAR ?auto_207398 ) ( ON ?auto_207399 ?auto_207400 ) ( CLEAR ?auto_207399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207394 ?auto_207395 ?auto_207396 ?auto_207397 ?auto_207398 ?auto_207399 )
      ( MAKE-11PILE ?auto_207394 ?auto_207395 ?auto_207396 ?auto_207397 ?auto_207398 ?auto_207399 ?auto_207400 ?auto_207401 ?auto_207402 ?auto_207403 ?auto_207404 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207417 - BLOCK
      ?auto_207418 - BLOCK
      ?auto_207419 - BLOCK
      ?auto_207420 - BLOCK
      ?auto_207421 - BLOCK
      ?auto_207422 - BLOCK
      ?auto_207423 - BLOCK
      ?auto_207424 - BLOCK
      ?auto_207425 - BLOCK
      ?auto_207426 - BLOCK
      ?auto_207427 - BLOCK
    )
    :vars
    (
      ?auto_207428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207427 ?auto_207428 ) ( ON-TABLE ?auto_207417 ) ( ON ?auto_207418 ?auto_207417 ) ( ON ?auto_207419 ?auto_207418 ) ( ON ?auto_207420 ?auto_207419 ) ( not ( = ?auto_207417 ?auto_207418 ) ) ( not ( = ?auto_207417 ?auto_207419 ) ) ( not ( = ?auto_207417 ?auto_207420 ) ) ( not ( = ?auto_207417 ?auto_207421 ) ) ( not ( = ?auto_207417 ?auto_207422 ) ) ( not ( = ?auto_207417 ?auto_207423 ) ) ( not ( = ?auto_207417 ?auto_207424 ) ) ( not ( = ?auto_207417 ?auto_207425 ) ) ( not ( = ?auto_207417 ?auto_207426 ) ) ( not ( = ?auto_207417 ?auto_207427 ) ) ( not ( = ?auto_207417 ?auto_207428 ) ) ( not ( = ?auto_207418 ?auto_207419 ) ) ( not ( = ?auto_207418 ?auto_207420 ) ) ( not ( = ?auto_207418 ?auto_207421 ) ) ( not ( = ?auto_207418 ?auto_207422 ) ) ( not ( = ?auto_207418 ?auto_207423 ) ) ( not ( = ?auto_207418 ?auto_207424 ) ) ( not ( = ?auto_207418 ?auto_207425 ) ) ( not ( = ?auto_207418 ?auto_207426 ) ) ( not ( = ?auto_207418 ?auto_207427 ) ) ( not ( = ?auto_207418 ?auto_207428 ) ) ( not ( = ?auto_207419 ?auto_207420 ) ) ( not ( = ?auto_207419 ?auto_207421 ) ) ( not ( = ?auto_207419 ?auto_207422 ) ) ( not ( = ?auto_207419 ?auto_207423 ) ) ( not ( = ?auto_207419 ?auto_207424 ) ) ( not ( = ?auto_207419 ?auto_207425 ) ) ( not ( = ?auto_207419 ?auto_207426 ) ) ( not ( = ?auto_207419 ?auto_207427 ) ) ( not ( = ?auto_207419 ?auto_207428 ) ) ( not ( = ?auto_207420 ?auto_207421 ) ) ( not ( = ?auto_207420 ?auto_207422 ) ) ( not ( = ?auto_207420 ?auto_207423 ) ) ( not ( = ?auto_207420 ?auto_207424 ) ) ( not ( = ?auto_207420 ?auto_207425 ) ) ( not ( = ?auto_207420 ?auto_207426 ) ) ( not ( = ?auto_207420 ?auto_207427 ) ) ( not ( = ?auto_207420 ?auto_207428 ) ) ( not ( = ?auto_207421 ?auto_207422 ) ) ( not ( = ?auto_207421 ?auto_207423 ) ) ( not ( = ?auto_207421 ?auto_207424 ) ) ( not ( = ?auto_207421 ?auto_207425 ) ) ( not ( = ?auto_207421 ?auto_207426 ) ) ( not ( = ?auto_207421 ?auto_207427 ) ) ( not ( = ?auto_207421 ?auto_207428 ) ) ( not ( = ?auto_207422 ?auto_207423 ) ) ( not ( = ?auto_207422 ?auto_207424 ) ) ( not ( = ?auto_207422 ?auto_207425 ) ) ( not ( = ?auto_207422 ?auto_207426 ) ) ( not ( = ?auto_207422 ?auto_207427 ) ) ( not ( = ?auto_207422 ?auto_207428 ) ) ( not ( = ?auto_207423 ?auto_207424 ) ) ( not ( = ?auto_207423 ?auto_207425 ) ) ( not ( = ?auto_207423 ?auto_207426 ) ) ( not ( = ?auto_207423 ?auto_207427 ) ) ( not ( = ?auto_207423 ?auto_207428 ) ) ( not ( = ?auto_207424 ?auto_207425 ) ) ( not ( = ?auto_207424 ?auto_207426 ) ) ( not ( = ?auto_207424 ?auto_207427 ) ) ( not ( = ?auto_207424 ?auto_207428 ) ) ( not ( = ?auto_207425 ?auto_207426 ) ) ( not ( = ?auto_207425 ?auto_207427 ) ) ( not ( = ?auto_207425 ?auto_207428 ) ) ( not ( = ?auto_207426 ?auto_207427 ) ) ( not ( = ?auto_207426 ?auto_207428 ) ) ( not ( = ?auto_207427 ?auto_207428 ) ) ( ON ?auto_207426 ?auto_207427 ) ( ON ?auto_207425 ?auto_207426 ) ( ON ?auto_207424 ?auto_207425 ) ( ON ?auto_207423 ?auto_207424 ) ( ON ?auto_207422 ?auto_207423 ) ( CLEAR ?auto_207420 ) ( ON ?auto_207421 ?auto_207422 ) ( CLEAR ?auto_207421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207417 ?auto_207418 ?auto_207419 ?auto_207420 ?auto_207421 )
      ( MAKE-11PILE ?auto_207417 ?auto_207418 ?auto_207419 ?auto_207420 ?auto_207421 ?auto_207422 ?auto_207423 ?auto_207424 ?auto_207425 ?auto_207426 ?auto_207427 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207440 - BLOCK
      ?auto_207441 - BLOCK
      ?auto_207442 - BLOCK
      ?auto_207443 - BLOCK
      ?auto_207444 - BLOCK
      ?auto_207445 - BLOCK
      ?auto_207446 - BLOCK
      ?auto_207447 - BLOCK
      ?auto_207448 - BLOCK
      ?auto_207449 - BLOCK
      ?auto_207450 - BLOCK
    )
    :vars
    (
      ?auto_207451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207450 ?auto_207451 ) ( ON-TABLE ?auto_207440 ) ( ON ?auto_207441 ?auto_207440 ) ( ON ?auto_207442 ?auto_207441 ) ( ON ?auto_207443 ?auto_207442 ) ( not ( = ?auto_207440 ?auto_207441 ) ) ( not ( = ?auto_207440 ?auto_207442 ) ) ( not ( = ?auto_207440 ?auto_207443 ) ) ( not ( = ?auto_207440 ?auto_207444 ) ) ( not ( = ?auto_207440 ?auto_207445 ) ) ( not ( = ?auto_207440 ?auto_207446 ) ) ( not ( = ?auto_207440 ?auto_207447 ) ) ( not ( = ?auto_207440 ?auto_207448 ) ) ( not ( = ?auto_207440 ?auto_207449 ) ) ( not ( = ?auto_207440 ?auto_207450 ) ) ( not ( = ?auto_207440 ?auto_207451 ) ) ( not ( = ?auto_207441 ?auto_207442 ) ) ( not ( = ?auto_207441 ?auto_207443 ) ) ( not ( = ?auto_207441 ?auto_207444 ) ) ( not ( = ?auto_207441 ?auto_207445 ) ) ( not ( = ?auto_207441 ?auto_207446 ) ) ( not ( = ?auto_207441 ?auto_207447 ) ) ( not ( = ?auto_207441 ?auto_207448 ) ) ( not ( = ?auto_207441 ?auto_207449 ) ) ( not ( = ?auto_207441 ?auto_207450 ) ) ( not ( = ?auto_207441 ?auto_207451 ) ) ( not ( = ?auto_207442 ?auto_207443 ) ) ( not ( = ?auto_207442 ?auto_207444 ) ) ( not ( = ?auto_207442 ?auto_207445 ) ) ( not ( = ?auto_207442 ?auto_207446 ) ) ( not ( = ?auto_207442 ?auto_207447 ) ) ( not ( = ?auto_207442 ?auto_207448 ) ) ( not ( = ?auto_207442 ?auto_207449 ) ) ( not ( = ?auto_207442 ?auto_207450 ) ) ( not ( = ?auto_207442 ?auto_207451 ) ) ( not ( = ?auto_207443 ?auto_207444 ) ) ( not ( = ?auto_207443 ?auto_207445 ) ) ( not ( = ?auto_207443 ?auto_207446 ) ) ( not ( = ?auto_207443 ?auto_207447 ) ) ( not ( = ?auto_207443 ?auto_207448 ) ) ( not ( = ?auto_207443 ?auto_207449 ) ) ( not ( = ?auto_207443 ?auto_207450 ) ) ( not ( = ?auto_207443 ?auto_207451 ) ) ( not ( = ?auto_207444 ?auto_207445 ) ) ( not ( = ?auto_207444 ?auto_207446 ) ) ( not ( = ?auto_207444 ?auto_207447 ) ) ( not ( = ?auto_207444 ?auto_207448 ) ) ( not ( = ?auto_207444 ?auto_207449 ) ) ( not ( = ?auto_207444 ?auto_207450 ) ) ( not ( = ?auto_207444 ?auto_207451 ) ) ( not ( = ?auto_207445 ?auto_207446 ) ) ( not ( = ?auto_207445 ?auto_207447 ) ) ( not ( = ?auto_207445 ?auto_207448 ) ) ( not ( = ?auto_207445 ?auto_207449 ) ) ( not ( = ?auto_207445 ?auto_207450 ) ) ( not ( = ?auto_207445 ?auto_207451 ) ) ( not ( = ?auto_207446 ?auto_207447 ) ) ( not ( = ?auto_207446 ?auto_207448 ) ) ( not ( = ?auto_207446 ?auto_207449 ) ) ( not ( = ?auto_207446 ?auto_207450 ) ) ( not ( = ?auto_207446 ?auto_207451 ) ) ( not ( = ?auto_207447 ?auto_207448 ) ) ( not ( = ?auto_207447 ?auto_207449 ) ) ( not ( = ?auto_207447 ?auto_207450 ) ) ( not ( = ?auto_207447 ?auto_207451 ) ) ( not ( = ?auto_207448 ?auto_207449 ) ) ( not ( = ?auto_207448 ?auto_207450 ) ) ( not ( = ?auto_207448 ?auto_207451 ) ) ( not ( = ?auto_207449 ?auto_207450 ) ) ( not ( = ?auto_207449 ?auto_207451 ) ) ( not ( = ?auto_207450 ?auto_207451 ) ) ( ON ?auto_207449 ?auto_207450 ) ( ON ?auto_207448 ?auto_207449 ) ( ON ?auto_207447 ?auto_207448 ) ( ON ?auto_207446 ?auto_207447 ) ( ON ?auto_207445 ?auto_207446 ) ( CLEAR ?auto_207443 ) ( ON ?auto_207444 ?auto_207445 ) ( CLEAR ?auto_207444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207440 ?auto_207441 ?auto_207442 ?auto_207443 ?auto_207444 )
      ( MAKE-11PILE ?auto_207440 ?auto_207441 ?auto_207442 ?auto_207443 ?auto_207444 ?auto_207445 ?auto_207446 ?auto_207447 ?auto_207448 ?auto_207449 ?auto_207450 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207463 - BLOCK
      ?auto_207464 - BLOCK
      ?auto_207465 - BLOCK
      ?auto_207466 - BLOCK
      ?auto_207467 - BLOCK
      ?auto_207468 - BLOCK
      ?auto_207469 - BLOCK
      ?auto_207470 - BLOCK
      ?auto_207471 - BLOCK
      ?auto_207472 - BLOCK
      ?auto_207473 - BLOCK
    )
    :vars
    (
      ?auto_207474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207473 ?auto_207474 ) ( ON-TABLE ?auto_207463 ) ( ON ?auto_207464 ?auto_207463 ) ( ON ?auto_207465 ?auto_207464 ) ( not ( = ?auto_207463 ?auto_207464 ) ) ( not ( = ?auto_207463 ?auto_207465 ) ) ( not ( = ?auto_207463 ?auto_207466 ) ) ( not ( = ?auto_207463 ?auto_207467 ) ) ( not ( = ?auto_207463 ?auto_207468 ) ) ( not ( = ?auto_207463 ?auto_207469 ) ) ( not ( = ?auto_207463 ?auto_207470 ) ) ( not ( = ?auto_207463 ?auto_207471 ) ) ( not ( = ?auto_207463 ?auto_207472 ) ) ( not ( = ?auto_207463 ?auto_207473 ) ) ( not ( = ?auto_207463 ?auto_207474 ) ) ( not ( = ?auto_207464 ?auto_207465 ) ) ( not ( = ?auto_207464 ?auto_207466 ) ) ( not ( = ?auto_207464 ?auto_207467 ) ) ( not ( = ?auto_207464 ?auto_207468 ) ) ( not ( = ?auto_207464 ?auto_207469 ) ) ( not ( = ?auto_207464 ?auto_207470 ) ) ( not ( = ?auto_207464 ?auto_207471 ) ) ( not ( = ?auto_207464 ?auto_207472 ) ) ( not ( = ?auto_207464 ?auto_207473 ) ) ( not ( = ?auto_207464 ?auto_207474 ) ) ( not ( = ?auto_207465 ?auto_207466 ) ) ( not ( = ?auto_207465 ?auto_207467 ) ) ( not ( = ?auto_207465 ?auto_207468 ) ) ( not ( = ?auto_207465 ?auto_207469 ) ) ( not ( = ?auto_207465 ?auto_207470 ) ) ( not ( = ?auto_207465 ?auto_207471 ) ) ( not ( = ?auto_207465 ?auto_207472 ) ) ( not ( = ?auto_207465 ?auto_207473 ) ) ( not ( = ?auto_207465 ?auto_207474 ) ) ( not ( = ?auto_207466 ?auto_207467 ) ) ( not ( = ?auto_207466 ?auto_207468 ) ) ( not ( = ?auto_207466 ?auto_207469 ) ) ( not ( = ?auto_207466 ?auto_207470 ) ) ( not ( = ?auto_207466 ?auto_207471 ) ) ( not ( = ?auto_207466 ?auto_207472 ) ) ( not ( = ?auto_207466 ?auto_207473 ) ) ( not ( = ?auto_207466 ?auto_207474 ) ) ( not ( = ?auto_207467 ?auto_207468 ) ) ( not ( = ?auto_207467 ?auto_207469 ) ) ( not ( = ?auto_207467 ?auto_207470 ) ) ( not ( = ?auto_207467 ?auto_207471 ) ) ( not ( = ?auto_207467 ?auto_207472 ) ) ( not ( = ?auto_207467 ?auto_207473 ) ) ( not ( = ?auto_207467 ?auto_207474 ) ) ( not ( = ?auto_207468 ?auto_207469 ) ) ( not ( = ?auto_207468 ?auto_207470 ) ) ( not ( = ?auto_207468 ?auto_207471 ) ) ( not ( = ?auto_207468 ?auto_207472 ) ) ( not ( = ?auto_207468 ?auto_207473 ) ) ( not ( = ?auto_207468 ?auto_207474 ) ) ( not ( = ?auto_207469 ?auto_207470 ) ) ( not ( = ?auto_207469 ?auto_207471 ) ) ( not ( = ?auto_207469 ?auto_207472 ) ) ( not ( = ?auto_207469 ?auto_207473 ) ) ( not ( = ?auto_207469 ?auto_207474 ) ) ( not ( = ?auto_207470 ?auto_207471 ) ) ( not ( = ?auto_207470 ?auto_207472 ) ) ( not ( = ?auto_207470 ?auto_207473 ) ) ( not ( = ?auto_207470 ?auto_207474 ) ) ( not ( = ?auto_207471 ?auto_207472 ) ) ( not ( = ?auto_207471 ?auto_207473 ) ) ( not ( = ?auto_207471 ?auto_207474 ) ) ( not ( = ?auto_207472 ?auto_207473 ) ) ( not ( = ?auto_207472 ?auto_207474 ) ) ( not ( = ?auto_207473 ?auto_207474 ) ) ( ON ?auto_207472 ?auto_207473 ) ( ON ?auto_207471 ?auto_207472 ) ( ON ?auto_207470 ?auto_207471 ) ( ON ?auto_207469 ?auto_207470 ) ( ON ?auto_207468 ?auto_207469 ) ( ON ?auto_207467 ?auto_207468 ) ( CLEAR ?auto_207465 ) ( ON ?auto_207466 ?auto_207467 ) ( CLEAR ?auto_207466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207463 ?auto_207464 ?auto_207465 ?auto_207466 )
      ( MAKE-11PILE ?auto_207463 ?auto_207464 ?auto_207465 ?auto_207466 ?auto_207467 ?auto_207468 ?auto_207469 ?auto_207470 ?auto_207471 ?auto_207472 ?auto_207473 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207486 - BLOCK
      ?auto_207487 - BLOCK
      ?auto_207488 - BLOCK
      ?auto_207489 - BLOCK
      ?auto_207490 - BLOCK
      ?auto_207491 - BLOCK
      ?auto_207492 - BLOCK
      ?auto_207493 - BLOCK
      ?auto_207494 - BLOCK
      ?auto_207495 - BLOCK
      ?auto_207496 - BLOCK
    )
    :vars
    (
      ?auto_207497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207496 ?auto_207497 ) ( ON-TABLE ?auto_207486 ) ( ON ?auto_207487 ?auto_207486 ) ( ON ?auto_207488 ?auto_207487 ) ( not ( = ?auto_207486 ?auto_207487 ) ) ( not ( = ?auto_207486 ?auto_207488 ) ) ( not ( = ?auto_207486 ?auto_207489 ) ) ( not ( = ?auto_207486 ?auto_207490 ) ) ( not ( = ?auto_207486 ?auto_207491 ) ) ( not ( = ?auto_207486 ?auto_207492 ) ) ( not ( = ?auto_207486 ?auto_207493 ) ) ( not ( = ?auto_207486 ?auto_207494 ) ) ( not ( = ?auto_207486 ?auto_207495 ) ) ( not ( = ?auto_207486 ?auto_207496 ) ) ( not ( = ?auto_207486 ?auto_207497 ) ) ( not ( = ?auto_207487 ?auto_207488 ) ) ( not ( = ?auto_207487 ?auto_207489 ) ) ( not ( = ?auto_207487 ?auto_207490 ) ) ( not ( = ?auto_207487 ?auto_207491 ) ) ( not ( = ?auto_207487 ?auto_207492 ) ) ( not ( = ?auto_207487 ?auto_207493 ) ) ( not ( = ?auto_207487 ?auto_207494 ) ) ( not ( = ?auto_207487 ?auto_207495 ) ) ( not ( = ?auto_207487 ?auto_207496 ) ) ( not ( = ?auto_207487 ?auto_207497 ) ) ( not ( = ?auto_207488 ?auto_207489 ) ) ( not ( = ?auto_207488 ?auto_207490 ) ) ( not ( = ?auto_207488 ?auto_207491 ) ) ( not ( = ?auto_207488 ?auto_207492 ) ) ( not ( = ?auto_207488 ?auto_207493 ) ) ( not ( = ?auto_207488 ?auto_207494 ) ) ( not ( = ?auto_207488 ?auto_207495 ) ) ( not ( = ?auto_207488 ?auto_207496 ) ) ( not ( = ?auto_207488 ?auto_207497 ) ) ( not ( = ?auto_207489 ?auto_207490 ) ) ( not ( = ?auto_207489 ?auto_207491 ) ) ( not ( = ?auto_207489 ?auto_207492 ) ) ( not ( = ?auto_207489 ?auto_207493 ) ) ( not ( = ?auto_207489 ?auto_207494 ) ) ( not ( = ?auto_207489 ?auto_207495 ) ) ( not ( = ?auto_207489 ?auto_207496 ) ) ( not ( = ?auto_207489 ?auto_207497 ) ) ( not ( = ?auto_207490 ?auto_207491 ) ) ( not ( = ?auto_207490 ?auto_207492 ) ) ( not ( = ?auto_207490 ?auto_207493 ) ) ( not ( = ?auto_207490 ?auto_207494 ) ) ( not ( = ?auto_207490 ?auto_207495 ) ) ( not ( = ?auto_207490 ?auto_207496 ) ) ( not ( = ?auto_207490 ?auto_207497 ) ) ( not ( = ?auto_207491 ?auto_207492 ) ) ( not ( = ?auto_207491 ?auto_207493 ) ) ( not ( = ?auto_207491 ?auto_207494 ) ) ( not ( = ?auto_207491 ?auto_207495 ) ) ( not ( = ?auto_207491 ?auto_207496 ) ) ( not ( = ?auto_207491 ?auto_207497 ) ) ( not ( = ?auto_207492 ?auto_207493 ) ) ( not ( = ?auto_207492 ?auto_207494 ) ) ( not ( = ?auto_207492 ?auto_207495 ) ) ( not ( = ?auto_207492 ?auto_207496 ) ) ( not ( = ?auto_207492 ?auto_207497 ) ) ( not ( = ?auto_207493 ?auto_207494 ) ) ( not ( = ?auto_207493 ?auto_207495 ) ) ( not ( = ?auto_207493 ?auto_207496 ) ) ( not ( = ?auto_207493 ?auto_207497 ) ) ( not ( = ?auto_207494 ?auto_207495 ) ) ( not ( = ?auto_207494 ?auto_207496 ) ) ( not ( = ?auto_207494 ?auto_207497 ) ) ( not ( = ?auto_207495 ?auto_207496 ) ) ( not ( = ?auto_207495 ?auto_207497 ) ) ( not ( = ?auto_207496 ?auto_207497 ) ) ( ON ?auto_207495 ?auto_207496 ) ( ON ?auto_207494 ?auto_207495 ) ( ON ?auto_207493 ?auto_207494 ) ( ON ?auto_207492 ?auto_207493 ) ( ON ?auto_207491 ?auto_207492 ) ( ON ?auto_207490 ?auto_207491 ) ( CLEAR ?auto_207488 ) ( ON ?auto_207489 ?auto_207490 ) ( CLEAR ?auto_207489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_207486 ?auto_207487 ?auto_207488 ?auto_207489 )
      ( MAKE-11PILE ?auto_207486 ?auto_207487 ?auto_207488 ?auto_207489 ?auto_207490 ?auto_207491 ?auto_207492 ?auto_207493 ?auto_207494 ?auto_207495 ?auto_207496 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207509 - BLOCK
      ?auto_207510 - BLOCK
      ?auto_207511 - BLOCK
      ?auto_207512 - BLOCK
      ?auto_207513 - BLOCK
      ?auto_207514 - BLOCK
      ?auto_207515 - BLOCK
      ?auto_207516 - BLOCK
      ?auto_207517 - BLOCK
      ?auto_207518 - BLOCK
      ?auto_207519 - BLOCK
    )
    :vars
    (
      ?auto_207520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207519 ?auto_207520 ) ( ON-TABLE ?auto_207509 ) ( ON ?auto_207510 ?auto_207509 ) ( not ( = ?auto_207509 ?auto_207510 ) ) ( not ( = ?auto_207509 ?auto_207511 ) ) ( not ( = ?auto_207509 ?auto_207512 ) ) ( not ( = ?auto_207509 ?auto_207513 ) ) ( not ( = ?auto_207509 ?auto_207514 ) ) ( not ( = ?auto_207509 ?auto_207515 ) ) ( not ( = ?auto_207509 ?auto_207516 ) ) ( not ( = ?auto_207509 ?auto_207517 ) ) ( not ( = ?auto_207509 ?auto_207518 ) ) ( not ( = ?auto_207509 ?auto_207519 ) ) ( not ( = ?auto_207509 ?auto_207520 ) ) ( not ( = ?auto_207510 ?auto_207511 ) ) ( not ( = ?auto_207510 ?auto_207512 ) ) ( not ( = ?auto_207510 ?auto_207513 ) ) ( not ( = ?auto_207510 ?auto_207514 ) ) ( not ( = ?auto_207510 ?auto_207515 ) ) ( not ( = ?auto_207510 ?auto_207516 ) ) ( not ( = ?auto_207510 ?auto_207517 ) ) ( not ( = ?auto_207510 ?auto_207518 ) ) ( not ( = ?auto_207510 ?auto_207519 ) ) ( not ( = ?auto_207510 ?auto_207520 ) ) ( not ( = ?auto_207511 ?auto_207512 ) ) ( not ( = ?auto_207511 ?auto_207513 ) ) ( not ( = ?auto_207511 ?auto_207514 ) ) ( not ( = ?auto_207511 ?auto_207515 ) ) ( not ( = ?auto_207511 ?auto_207516 ) ) ( not ( = ?auto_207511 ?auto_207517 ) ) ( not ( = ?auto_207511 ?auto_207518 ) ) ( not ( = ?auto_207511 ?auto_207519 ) ) ( not ( = ?auto_207511 ?auto_207520 ) ) ( not ( = ?auto_207512 ?auto_207513 ) ) ( not ( = ?auto_207512 ?auto_207514 ) ) ( not ( = ?auto_207512 ?auto_207515 ) ) ( not ( = ?auto_207512 ?auto_207516 ) ) ( not ( = ?auto_207512 ?auto_207517 ) ) ( not ( = ?auto_207512 ?auto_207518 ) ) ( not ( = ?auto_207512 ?auto_207519 ) ) ( not ( = ?auto_207512 ?auto_207520 ) ) ( not ( = ?auto_207513 ?auto_207514 ) ) ( not ( = ?auto_207513 ?auto_207515 ) ) ( not ( = ?auto_207513 ?auto_207516 ) ) ( not ( = ?auto_207513 ?auto_207517 ) ) ( not ( = ?auto_207513 ?auto_207518 ) ) ( not ( = ?auto_207513 ?auto_207519 ) ) ( not ( = ?auto_207513 ?auto_207520 ) ) ( not ( = ?auto_207514 ?auto_207515 ) ) ( not ( = ?auto_207514 ?auto_207516 ) ) ( not ( = ?auto_207514 ?auto_207517 ) ) ( not ( = ?auto_207514 ?auto_207518 ) ) ( not ( = ?auto_207514 ?auto_207519 ) ) ( not ( = ?auto_207514 ?auto_207520 ) ) ( not ( = ?auto_207515 ?auto_207516 ) ) ( not ( = ?auto_207515 ?auto_207517 ) ) ( not ( = ?auto_207515 ?auto_207518 ) ) ( not ( = ?auto_207515 ?auto_207519 ) ) ( not ( = ?auto_207515 ?auto_207520 ) ) ( not ( = ?auto_207516 ?auto_207517 ) ) ( not ( = ?auto_207516 ?auto_207518 ) ) ( not ( = ?auto_207516 ?auto_207519 ) ) ( not ( = ?auto_207516 ?auto_207520 ) ) ( not ( = ?auto_207517 ?auto_207518 ) ) ( not ( = ?auto_207517 ?auto_207519 ) ) ( not ( = ?auto_207517 ?auto_207520 ) ) ( not ( = ?auto_207518 ?auto_207519 ) ) ( not ( = ?auto_207518 ?auto_207520 ) ) ( not ( = ?auto_207519 ?auto_207520 ) ) ( ON ?auto_207518 ?auto_207519 ) ( ON ?auto_207517 ?auto_207518 ) ( ON ?auto_207516 ?auto_207517 ) ( ON ?auto_207515 ?auto_207516 ) ( ON ?auto_207514 ?auto_207515 ) ( ON ?auto_207513 ?auto_207514 ) ( ON ?auto_207512 ?auto_207513 ) ( CLEAR ?auto_207510 ) ( ON ?auto_207511 ?auto_207512 ) ( CLEAR ?auto_207511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207509 ?auto_207510 ?auto_207511 )
      ( MAKE-11PILE ?auto_207509 ?auto_207510 ?auto_207511 ?auto_207512 ?auto_207513 ?auto_207514 ?auto_207515 ?auto_207516 ?auto_207517 ?auto_207518 ?auto_207519 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207532 - BLOCK
      ?auto_207533 - BLOCK
      ?auto_207534 - BLOCK
      ?auto_207535 - BLOCK
      ?auto_207536 - BLOCK
      ?auto_207537 - BLOCK
      ?auto_207538 - BLOCK
      ?auto_207539 - BLOCK
      ?auto_207540 - BLOCK
      ?auto_207541 - BLOCK
      ?auto_207542 - BLOCK
    )
    :vars
    (
      ?auto_207543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207542 ?auto_207543 ) ( ON-TABLE ?auto_207532 ) ( ON ?auto_207533 ?auto_207532 ) ( not ( = ?auto_207532 ?auto_207533 ) ) ( not ( = ?auto_207532 ?auto_207534 ) ) ( not ( = ?auto_207532 ?auto_207535 ) ) ( not ( = ?auto_207532 ?auto_207536 ) ) ( not ( = ?auto_207532 ?auto_207537 ) ) ( not ( = ?auto_207532 ?auto_207538 ) ) ( not ( = ?auto_207532 ?auto_207539 ) ) ( not ( = ?auto_207532 ?auto_207540 ) ) ( not ( = ?auto_207532 ?auto_207541 ) ) ( not ( = ?auto_207532 ?auto_207542 ) ) ( not ( = ?auto_207532 ?auto_207543 ) ) ( not ( = ?auto_207533 ?auto_207534 ) ) ( not ( = ?auto_207533 ?auto_207535 ) ) ( not ( = ?auto_207533 ?auto_207536 ) ) ( not ( = ?auto_207533 ?auto_207537 ) ) ( not ( = ?auto_207533 ?auto_207538 ) ) ( not ( = ?auto_207533 ?auto_207539 ) ) ( not ( = ?auto_207533 ?auto_207540 ) ) ( not ( = ?auto_207533 ?auto_207541 ) ) ( not ( = ?auto_207533 ?auto_207542 ) ) ( not ( = ?auto_207533 ?auto_207543 ) ) ( not ( = ?auto_207534 ?auto_207535 ) ) ( not ( = ?auto_207534 ?auto_207536 ) ) ( not ( = ?auto_207534 ?auto_207537 ) ) ( not ( = ?auto_207534 ?auto_207538 ) ) ( not ( = ?auto_207534 ?auto_207539 ) ) ( not ( = ?auto_207534 ?auto_207540 ) ) ( not ( = ?auto_207534 ?auto_207541 ) ) ( not ( = ?auto_207534 ?auto_207542 ) ) ( not ( = ?auto_207534 ?auto_207543 ) ) ( not ( = ?auto_207535 ?auto_207536 ) ) ( not ( = ?auto_207535 ?auto_207537 ) ) ( not ( = ?auto_207535 ?auto_207538 ) ) ( not ( = ?auto_207535 ?auto_207539 ) ) ( not ( = ?auto_207535 ?auto_207540 ) ) ( not ( = ?auto_207535 ?auto_207541 ) ) ( not ( = ?auto_207535 ?auto_207542 ) ) ( not ( = ?auto_207535 ?auto_207543 ) ) ( not ( = ?auto_207536 ?auto_207537 ) ) ( not ( = ?auto_207536 ?auto_207538 ) ) ( not ( = ?auto_207536 ?auto_207539 ) ) ( not ( = ?auto_207536 ?auto_207540 ) ) ( not ( = ?auto_207536 ?auto_207541 ) ) ( not ( = ?auto_207536 ?auto_207542 ) ) ( not ( = ?auto_207536 ?auto_207543 ) ) ( not ( = ?auto_207537 ?auto_207538 ) ) ( not ( = ?auto_207537 ?auto_207539 ) ) ( not ( = ?auto_207537 ?auto_207540 ) ) ( not ( = ?auto_207537 ?auto_207541 ) ) ( not ( = ?auto_207537 ?auto_207542 ) ) ( not ( = ?auto_207537 ?auto_207543 ) ) ( not ( = ?auto_207538 ?auto_207539 ) ) ( not ( = ?auto_207538 ?auto_207540 ) ) ( not ( = ?auto_207538 ?auto_207541 ) ) ( not ( = ?auto_207538 ?auto_207542 ) ) ( not ( = ?auto_207538 ?auto_207543 ) ) ( not ( = ?auto_207539 ?auto_207540 ) ) ( not ( = ?auto_207539 ?auto_207541 ) ) ( not ( = ?auto_207539 ?auto_207542 ) ) ( not ( = ?auto_207539 ?auto_207543 ) ) ( not ( = ?auto_207540 ?auto_207541 ) ) ( not ( = ?auto_207540 ?auto_207542 ) ) ( not ( = ?auto_207540 ?auto_207543 ) ) ( not ( = ?auto_207541 ?auto_207542 ) ) ( not ( = ?auto_207541 ?auto_207543 ) ) ( not ( = ?auto_207542 ?auto_207543 ) ) ( ON ?auto_207541 ?auto_207542 ) ( ON ?auto_207540 ?auto_207541 ) ( ON ?auto_207539 ?auto_207540 ) ( ON ?auto_207538 ?auto_207539 ) ( ON ?auto_207537 ?auto_207538 ) ( ON ?auto_207536 ?auto_207537 ) ( ON ?auto_207535 ?auto_207536 ) ( CLEAR ?auto_207533 ) ( ON ?auto_207534 ?auto_207535 ) ( CLEAR ?auto_207534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_207532 ?auto_207533 ?auto_207534 )
      ( MAKE-11PILE ?auto_207532 ?auto_207533 ?auto_207534 ?auto_207535 ?auto_207536 ?auto_207537 ?auto_207538 ?auto_207539 ?auto_207540 ?auto_207541 ?auto_207542 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207555 - BLOCK
      ?auto_207556 - BLOCK
      ?auto_207557 - BLOCK
      ?auto_207558 - BLOCK
      ?auto_207559 - BLOCK
      ?auto_207560 - BLOCK
      ?auto_207561 - BLOCK
      ?auto_207562 - BLOCK
      ?auto_207563 - BLOCK
      ?auto_207564 - BLOCK
      ?auto_207565 - BLOCK
    )
    :vars
    (
      ?auto_207566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207565 ?auto_207566 ) ( ON-TABLE ?auto_207555 ) ( not ( = ?auto_207555 ?auto_207556 ) ) ( not ( = ?auto_207555 ?auto_207557 ) ) ( not ( = ?auto_207555 ?auto_207558 ) ) ( not ( = ?auto_207555 ?auto_207559 ) ) ( not ( = ?auto_207555 ?auto_207560 ) ) ( not ( = ?auto_207555 ?auto_207561 ) ) ( not ( = ?auto_207555 ?auto_207562 ) ) ( not ( = ?auto_207555 ?auto_207563 ) ) ( not ( = ?auto_207555 ?auto_207564 ) ) ( not ( = ?auto_207555 ?auto_207565 ) ) ( not ( = ?auto_207555 ?auto_207566 ) ) ( not ( = ?auto_207556 ?auto_207557 ) ) ( not ( = ?auto_207556 ?auto_207558 ) ) ( not ( = ?auto_207556 ?auto_207559 ) ) ( not ( = ?auto_207556 ?auto_207560 ) ) ( not ( = ?auto_207556 ?auto_207561 ) ) ( not ( = ?auto_207556 ?auto_207562 ) ) ( not ( = ?auto_207556 ?auto_207563 ) ) ( not ( = ?auto_207556 ?auto_207564 ) ) ( not ( = ?auto_207556 ?auto_207565 ) ) ( not ( = ?auto_207556 ?auto_207566 ) ) ( not ( = ?auto_207557 ?auto_207558 ) ) ( not ( = ?auto_207557 ?auto_207559 ) ) ( not ( = ?auto_207557 ?auto_207560 ) ) ( not ( = ?auto_207557 ?auto_207561 ) ) ( not ( = ?auto_207557 ?auto_207562 ) ) ( not ( = ?auto_207557 ?auto_207563 ) ) ( not ( = ?auto_207557 ?auto_207564 ) ) ( not ( = ?auto_207557 ?auto_207565 ) ) ( not ( = ?auto_207557 ?auto_207566 ) ) ( not ( = ?auto_207558 ?auto_207559 ) ) ( not ( = ?auto_207558 ?auto_207560 ) ) ( not ( = ?auto_207558 ?auto_207561 ) ) ( not ( = ?auto_207558 ?auto_207562 ) ) ( not ( = ?auto_207558 ?auto_207563 ) ) ( not ( = ?auto_207558 ?auto_207564 ) ) ( not ( = ?auto_207558 ?auto_207565 ) ) ( not ( = ?auto_207558 ?auto_207566 ) ) ( not ( = ?auto_207559 ?auto_207560 ) ) ( not ( = ?auto_207559 ?auto_207561 ) ) ( not ( = ?auto_207559 ?auto_207562 ) ) ( not ( = ?auto_207559 ?auto_207563 ) ) ( not ( = ?auto_207559 ?auto_207564 ) ) ( not ( = ?auto_207559 ?auto_207565 ) ) ( not ( = ?auto_207559 ?auto_207566 ) ) ( not ( = ?auto_207560 ?auto_207561 ) ) ( not ( = ?auto_207560 ?auto_207562 ) ) ( not ( = ?auto_207560 ?auto_207563 ) ) ( not ( = ?auto_207560 ?auto_207564 ) ) ( not ( = ?auto_207560 ?auto_207565 ) ) ( not ( = ?auto_207560 ?auto_207566 ) ) ( not ( = ?auto_207561 ?auto_207562 ) ) ( not ( = ?auto_207561 ?auto_207563 ) ) ( not ( = ?auto_207561 ?auto_207564 ) ) ( not ( = ?auto_207561 ?auto_207565 ) ) ( not ( = ?auto_207561 ?auto_207566 ) ) ( not ( = ?auto_207562 ?auto_207563 ) ) ( not ( = ?auto_207562 ?auto_207564 ) ) ( not ( = ?auto_207562 ?auto_207565 ) ) ( not ( = ?auto_207562 ?auto_207566 ) ) ( not ( = ?auto_207563 ?auto_207564 ) ) ( not ( = ?auto_207563 ?auto_207565 ) ) ( not ( = ?auto_207563 ?auto_207566 ) ) ( not ( = ?auto_207564 ?auto_207565 ) ) ( not ( = ?auto_207564 ?auto_207566 ) ) ( not ( = ?auto_207565 ?auto_207566 ) ) ( ON ?auto_207564 ?auto_207565 ) ( ON ?auto_207563 ?auto_207564 ) ( ON ?auto_207562 ?auto_207563 ) ( ON ?auto_207561 ?auto_207562 ) ( ON ?auto_207560 ?auto_207561 ) ( ON ?auto_207559 ?auto_207560 ) ( ON ?auto_207558 ?auto_207559 ) ( ON ?auto_207557 ?auto_207558 ) ( CLEAR ?auto_207555 ) ( ON ?auto_207556 ?auto_207557 ) ( CLEAR ?auto_207556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207555 ?auto_207556 )
      ( MAKE-11PILE ?auto_207555 ?auto_207556 ?auto_207557 ?auto_207558 ?auto_207559 ?auto_207560 ?auto_207561 ?auto_207562 ?auto_207563 ?auto_207564 ?auto_207565 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207578 - BLOCK
      ?auto_207579 - BLOCK
      ?auto_207580 - BLOCK
      ?auto_207581 - BLOCK
      ?auto_207582 - BLOCK
      ?auto_207583 - BLOCK
      ?auto_207584 - BLOCK
      ?auto_207585 - BLOCK
      ?auto_207586 - BLOCK
      ?auto_207587 - BLOCK
      ?auto_207588 - BLOCK
    )
    :vars
    (
      ?auto_207589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207588 ?auto_207589 ) ( ON-TABLE ?auto_207578 ) ( not ( = ?auto_207578 ?auto_207579 ) ) ( not ( = ?auto_207578 ?auto_207580 ) ) ( not ( = ?auto_207578 ?auto_207581 ) ) ( not ( = ?auto_207578 ?auto_207582 ) ) ( not ( = ?auto_207578 ?auto_207583 ) ) ( not ( = ?auto_207578 ?auto_207584 ) ) ( not ( = ?auto_207578 ?auto_207585 ) ) ( not ( = ?auto_207578 ?auto_207586 ) ) ( not ( = ?auto_207578 ?auto_207587 ) ) ( not ( = ?auto_207578 ?auto_207588 ) ) ( not ( = ?auto_207578 ?auto_207589 ) ) ( not ( = ?auto_207579 ?auto_207580 ) ) ( not ( = ?auto_207579 ?auto_207581 ) ) ( not ( = ?auto_207579 ?auto_207582 ) ) ( not ( = ?auto_207579 ?auto_207583 ) ) ( not ( = ?auto_207579 ?auto_207584 ) ) ( not ( = ?auto_207579 ?auto_207585 ) ) ( not ( = ?auto_207579 ?auto_207586 ) ) ( not ( = ?auto_207579 ?auto_207587 ) ) ( not ( = ?auto_207579 ?auto_207588 ) ) ( not ( = ?auto_207579 ?auto_207589 ) ) ( not ( = ?auto_207580 ?auto_207581 ) ) ( not ( = ?auto_207580 ?auto_207582 ) ) ( not ( = ?auto_207580 ?auto_207583 ) ) ( not ( = ?auto_207580 ?auto_207584 ) ) ( not ( = ?auto_207580 ?auto_207585 ) ) ( not ( = ?auto_207580 ?auto_207586 ) ) ( not ( = ?auto_207580 ?auto_207587 ) ) ( not ( = ?auto_207580 ?auto_207588 ) ) ( not ( = ?auto_207580 ?auto_207589 ) ) ( not ( = ?auto_207581 ?auto_207582 ) ) ( not ( = ?auto_207581 ?auto_207583 ) ) ( not ( = ?auto_207581 ?auto_207584 ) ) ( not ( = ?auto_207581 ?auto_207585 ) ) ( not ( = ?auto_207581 ?auto_207586 ) ) ( not ( = ?auto_207581 ?auto_207587 ) ) ( not ( = ?auto_207581 ?auto_207588 ) ) ( not ( = ?auto_207581 ?auto_207589 ) ) ( not ( = ?auto_207582 ?auto_207583 ) ) ( not ( = ?auto_207582 ?auto_207584 ) ) ( not ( = ?auto_207582 ?auto_207585 ) ) ( not ( = ?auto_207582 ?auto_207586 ) ) ( not ( = ?auto_207582 ?auto_207587 ) ) ( not ( = ?auto_207582 ?auto_207588 ) ) ( not ( = ?auto_207582 ?auto_207589 ) ) ( not ( = ?auto_207583 ?auto_207584 ) ) ( not ( = ?auto_207583 ?auto_207585 ) ) ( not ( = ?auto_207583 ?auto_207586 ) ) ( not ( = ?auto_207583 ?auto_207587 ) ) ( not ( = ?auto_207583 ?auto_207588 ) ) ( not ( = ?auto_207583 ?auto_207589 ) ) ( not ( = ?auto_207584 ?auto_207585 ) ) ( not ( = ?auto_207584 ?auto_207586 ) ) ( not ( = ?auto_207584 ?auto_207587 ) ) ( not ( = ?auto_207584 ?auto_207588 ) ) ( not ( = ?auto_207584 ?auto_207589 ) ) ( not ( = ?auto_207585 ?auto_207586 ) ) ( not ( = ?auto_207585 ?auto_207587 ) ) ( not ( = ?auto_207585 ?auto_207588 ) ) ( not ( = ?auto_207585 ?auto_207589 ) ) ( not ( = ?auto_207586 ?auto_207587 ) ) ( not ( = ?auto_207586 ?auto_207588 ) ) ( not ( = ?auto_207586 ?auto_207589 ) ) ( not ( = ?auto_207587 ?auto_207588 ) ) ( not ( = ?auto_207587 ?auto_207589 ) ) ( not ( = ?auto_207588 ?auto_207589 ) ) ( ON ?auto_207587 ?auto_207588 ) ( ON ?auto_207586 ?auto_207587 ) ( ON ?auto_207585 ?auto_207586 ) ( ON ?auto_207584 ?auto_207585 ) ( ON ?auto_207583 ?auto_207584 ) ( ON ?auto_207582 ?auto_207583 ) ( ON ?auto_207581 ?auto_207582 ) ( ON ?auto_207580 ?auto_207581 ) ( CLEAR ?auto_207578 ) ( ON ?auto_207579 ?auto_207580 ) ( CLEAR ?auto_207579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_207578 ?auto_207579 )
      ( MAKE-11PILE ?auto_207578 ?auto_207579 ?auto_207580 ?auto_207581 ?auto_207582 ?auto_207583 ?auto_207584 ?auto_207585 ?auto_207586 ?auto_207587 ?auto_207588 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207601 - BLOCK
      ?auto_207602 - BLOCK
      ?auto_207603 - BLOCK
      ?auto_207604 - BLOCK
      ?auto_207605 - BLOCK
      ?auto_207606 - BLOCK
      ?auto_207607 - BLOCK
      ?auto_207608 - BLOCK
      ?auto_207609 - BLOCK
      ?auto_207610 - BLOCK
      ?auto_207611 - BLOCK
    )
    :vars
    (
      ?auto_207612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207611 ?auto_207612 ) ( not ( = ?auto_207601 ?auto_207602 ) ) ( not ( = ?auto_207601 ?auto_207603 ) ) ( not ( = ?auto_207601 ?auto_207604 ) ) ( not ( = ?auto_207601 ?auto_207605 ) ) ( not ( = ?auto_207601 ?auto_207606 ) ) ( not ( = ?auto_207601 ?auto_207607 ) ) ( not ( = ?auto_207601 ?auto_207608 ) ) ( not ( = ?auto_207601 ?auto_207609 ) ) ( not ( = ?auto_207601 ?auto_207610 ) ) ( not ( = ?auto_207601 ?auto_207611 ) ) ( not ( = ?auto_207601 ?auto_207612 ) ) ( not ( = ?auto_207602 ?auto_207603 ) ) ( not ( = ?auto_207602 ?auto_207604 ) ) ( not ( = ?auto_207602 ?auto_207605 ) ) ( not ( = ?auto_207602 ?auto_207606 ) ) ( not ( = ?auto_207602 ?auto_207607 ) ) ( not ( = ?auto_207602 ?auto_207608 ) ) ( not ( = ?auto_207602 ?auto_207609 ) ) ( not ( = ?auto_207602 ?auto_207610 ) ) ( not ( = ?auto_207602 ?auto_207611 ) ) ( not ( = ?auto_207602 ?auto_207612 ) ) ( not ( = ?auto_207603 ?auto_207604 ) ) ( not ( = ?auto_207603 ?auto_207605 ) ) ( not ( = ?auto_207603 ?auto_207606 ) ) ( not ( = ?auto_207603 ?auto_207607 ) ) ( not ( = ?auto_207603 ?auto_207608 ) ) ( not ( = ?auto_207603 ?auto_207609 ) ) ( not ( = ?auto_207603 ?auto_207610 ) ) ( not ( = ?auto_207603 ?auto_207611 ) ) ( not ( = ?auto_207603 ?auto_207612 ) ) ( not ( = ?auto_207604 ?auto_207605 ) ) ( not ( = ?auto_207604 ?auto_207606 ) ) ( not ( = ?auto_207604 ?auto_207607 ) ) ( not ( = ?auto_207604 ?auto_207608 ) ) ( not ( = ?auto_207604 ?auto_207609 ) ) ( not ( = ?auto_207604 ?auto_207610 ) ) ( not ( = ?auto_207604 ?auto_207611 ) ) ( not ( = ?auto_207604 ?auto_207612 ) ) ( not ( = ?auto_207605 ?auto_207606 ) ) ( not ( = ?auto_207605 ?auto_207607 ) ) ( not ( = ?auto_207605 ?auto_207608 ) ) ( not ( = ?auto_207605 ?auto_207609 ) ) ( not ( = ?auto_207605 ?auto_207610 ) ) ( not ( = ?auto_207605 ?auto_207611 ) ) ( not ( = ?auto_207605 ?auto_207612 ) ) ( not ( = ?auto_207606 ?auto_207607 ) ) ( not ( = ?auto_207606 ?auto_207608 ) ) ( not ( = ?auto_207606 ?auto_207609 ) ) ( not ( = ?auto_207606 ?auto_207610 ) ) ( not ( = ?auto_207606 ?auto_207611 ) ) ( not ( = ?auto_207606 ?auto_207612 ) ) ( not ( = ?auto_207607 ?auto_207608 ) ) ( not ( = ?auto_207607 ?auto_207609 ) ) ( not ( = ?auto_207607 ?auto_207610 ) ) ( not ( = ?auto_207607 ?auto_207611 ) ) ( not ( = ?auto_207607 ?auto_207612 ) ) ( not ( = ?auto_207608 ?auto_207609 ) ) ( not ( = ?auto_207608 ?auto_207610 ) ) ( not ( = ?auto_207608 ?auto_207611 ) ) ( not ( = ?auto_207608 ?auto_207612 ) ) ( not ( = ?auto_207609 ?auto_207610 ) ) ( not ( = ?auto_207609 ?auto_207611 ) ) ( not ( = ?auto_207609 ?auto_207612 ) ) ( not ( = ?auto_207610 ?auto_207611 ) ) ( not ( = ?auto_207610 ?auto_207612 ) ) ( not ( = ?auto_207611 ?auto_207612 ) ) ( ON ?auto_207610 ?auto_207611 ) ( ON ?auto_207609 ?auto_207610 ) ( ON ?auto_207608 ?auto_207609 ) ( ON ?auto_207607 ?auto_207608 ) ( ON ?auto_207606 ?auto_207607 ) ( ON ?auto_207605 ?auto_207606 ) ( ON ?auto_207604 ?auto_207605 ) ( ON ?auto_207603 ?auto_207604 ) ( ON ?auto_207602 ?auto_207603 ) ( ON ?auto_207601 ?auto_207602 ) ( CLEAR ?auto_207601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207601 )
      ( MAKE-11PILE ?auto_207601 ?auto_207602 ?auto_207603 ?auto_207604 ?auto_207605 ?auto_207606 ?auto_207607 ?auto_207608 ?auto_207609 ?auto_207610 ?auto_207611 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_207624 - BLOCK
      ?auto_207625 - BLOCK
      ?auto_207626 - BLOCK
      ?auto_207627 - BLOCK
      ?auto_207628 - BLOCK
      ?auto_207629 - BLOCK
      ?auto_207630 - BLOCK
      ?auto_207631 - BLOCK
      ?auto_207632 - BLOCK
      ?auto_207633 - BLOCK
      ?auto_207634 - BLOCK
    )
    :vars
    (
      ?auto_207635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207634 ?auto_207635 ) ( not ( = ?auto_207624 ?auto_207625 ) ) ( not ( = ?auto_207624 ?auto_207626 ) ) ( not ( = ?auto_207624 ?auto_207627 ) ) ( not ( = ?auto_207624 ?auto_207628 ) ) ( not ( = ?auto_207624 ?auto_207629 ) ) ( not ( = ?auto_207624 ?auto_207630 ) ) ( not ( = ?auto_207624 ?auto_207631 ) ) ( not ( = ?auto_207624 ?auto_207632 ) ) ( not ( = ?auto_207624 ?auto_207633 ) ) ( not ( = ?auto_207624 ?auto_207634 ) ) ( not ( = ?auto_207624 ?auto_207635 ) ) ( not ( = ?auto_207625 ?auto_207626 ) ) ( not ( = ?auto_207625 ?auto_207627 ) ) ( not ( = ?auto_207625 ?auto_207628 ) ) ( not ( = ?auto_207625 ?auto_207629 ) ) ( not ( = ?auto_207625 ?auto_207630 ) ) ( not ( = ?auto_207625 ?auto_207631 ) ) ( not ( = ?auto_207625 ?auto_207632 ) ) ( not ( = ?auto_207625 ?auto_207633 ) ) ( not ( = ?auto_207625 ?auto_207634 ) ) ( not ( = ?auto_207625 ?auto_207635 ) ) ( not ( = ?auto_207626 ?auto_207627 ) ) ( not ( = ?auto_207626 ?auto_207628 ) ) ( not ( = ?auto_207626 ?auto_207629 ) ) ( not ( = ?auto_207626 ?auto_207630 ) ) ( not ( = ?auto_207626 ?auto_207631 ) ) ( not ( = ?auto_207626 ?auto_207632 ) ) ( not ( = ?auto_207626 ?auto_207633 ) ) ( not ( = ?auto_207626 ?auto_207634 ) ) ( not ( = ?auto_207626 ?auto_207635 ) ) ( not ( = ?auto_207627 ?auto_207628 ) ) ( not ( = ?auto_207627 ?auto_207629 ) ) ( not ( = ?auto_207627 ?auto_207630 ) ) ( not ( = ?auto_207627 ?auto_207631 ) ) ( not ( = ?auto_207627 ?auto_207632 ) ) ( not ( = ?auto_207627 ?auto_207633 ) ) ( not ( = ?auto_207627 ?auto_207634 ) ) ( not ( = ?auto_207627 ?auto_207635 ) ) ( not ( = ?auto_207628 ?auto_207629 ) ) ( not ( = ?auto_207628 ?auto_207630 ) ) ( not ( = ?auto_207628 ?auto_207631 ) ) ( not ( = ?auto_207628 ?auto_207632 ) ) ( not ( = ?auto_207628 ?auto_207633 ) ) ( not ( = ?auto_207628 ?auto_207634 ) ) ( not ( = ?auto_207628 ?auto_207635 ) ) ( not ( = ?auto_207629 ?auto_207630 ) ) ( not ( = ?auto_207629 ?auto_207631 ) ) ( not ( = ?auto_207629 ?auto_207632 ) ) ( not ( = ?auto_207629 ?auto_207633 ) ) ( not ( = ?auto_207629 ?auto_207634 ) ) ( not ( = ?auto_207629 ?auto_207635 ) ) ( not ( = ?auto_207630 ?auto_207631 ) ) ( not ( = ?auto_207630 ?auto_207632 ) ) ( not ( = ?auto_207630 ?auto_207633 ) ) ( not ( = ?auto_207630 ?auto_207634 ) ) ( not ( = ?auto_207630 ?auto_207635 ) ) ( not ( = ?auto_207631 ?auto_207632 ) ) ( not ( = ?auto_207631 ?auto_207633 ) ) ( not ( = ?auto_207631 ?auto_207634 ) ) ( not ( = ?auto_207631 ?auto_207635 ) ) ( not ( = ?auto_207632 ?auto_207633 ) ) ( not ( = ?auto_207632 ?auto_207634 ) ) ( not ( = ?auto_207632 ?auto_207635 ) ) ( not ( = ?auto_207633 ?auto_207634 ) ) ( not ( = ?auto_207633 ?auto_207635 ) ) ( not ( = ?auto_207634 ?auto_207635 ) ) ( ON ?auto_207633 ?auto_207634 ) ( ON ?auto_207632 ?auto_207633 ) ( ON ?auto_207631 ?auto_207632 ) ( ON ?auto_207630 ?auto_207631 ) ( ON ?auto_207629 ?auto_207630 ) ( ON ?auto_207628 ?auto_207629 ) ( ON ?auto_207627 ?auto_207628 ) ( ON ?auto_207626 ?auto_207627 ) ( ON ?auto_207625 ?auto_207626 ) ( ON ?auto_207624 ?auto_207625 ) ( CLEAR ?auto_207624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_207624 )
      ( MAKE-11PILE ?auto_207624 ?auto_207625 ?auto_207626 ?auto_207627 ?auto_207628 ?auto_207629 ?auto_207630 ?auto_207631 ?auto_207632 ?auto_207633 ?auto_207634 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207648 - BLOCK
      ?auto_207649 - BLOCK
      ?auto_207650 - BLOCK
      ?auto_207651 - BLOCK
      ?auto_207652 - BLOCK
      ?auto_207653 - BLOCK
      ?auto_207654 - BLOCK
      ?auto_207655 - BLOCK
      ?auto_207656 - BLOCK
      ?auto_207657 - BLOCK
      ?auto_207658 - BLOCK
      ?auto_207659 - BLOCK
    )
    :vars
    (
      ?auto_207660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207658 ) ( ON ?auto_207659 ?auto_207660 ) ( CLEAR ?auto_207659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207648 ) ( ON ?auto_207649 ?auto_207648 ) ( ON ?auto_207650 ?auto_207649 ) ( ON ?auto_207651 ?auto_207650 ) ( ON ?auto_207652 ?auto_207651 ) ( ON ?auto_207653 ?auto_207652 ) ( ON ?auto_207654 ?auto_207653 ) ( ON ?auto_207655 ?auto_207654 ) ( ON ?auto_207656 ?auto_207655 ) ( ON ?auto_207657 ?auto_207656 ) ( ON ?auto_207658 ?auto_207657 ) ( not ( = ?auto_207648 ?auto_207649 ) ) ( not ( = ?auto_207648 ?auto_207650 ) ) ( not ( = ?auto_207648 ?auto_207651 ) ) ( not ( = ?auto_207648 ?auto_207652 ) ) ( not ( = ?auto_207648 ?auto_207653 ) ) ( not ( = ?auto_207648 ?auto_207654 ) ) ( not ( = ?auto_207648 ?auto_207655 ) ) ( not ( = ?auto_207648 ?auto_207656 ) ) ( not ( = ?auto_207648 ?auto_207657 ) ) ( not ( = ?auto_207648 ?auto_207658 ) ) ( not ( = ?auto_207648 ?auto_207659 ) ) ( not ( = ?auto_207648 ?auto_207660 ) ) ( not ( = ?auto_207649 ?auto_207650 ) ) ( not ( = ?auto_207649 ?auto_207651 ) ) ( not ( = ?auto_207649 ?auto_207652 ) ) ( not ( = ?auto_207649 ?auto_207653 ) ) ( not ( = ?auto_207649 ?auto_207654 ) ) ( not ( = ?auto_207649 ?auto_207655 ) ) ( not ( = ?auto_207649 ?auto_207656 ) ) ( not ( = ?auto_207649 ?auto_207657 ) ) ( not ( = ?auto_207649 ?auto_207658 ) ) ( not ( = ?auto_207649 ?auto_207659 ) ) ( not ( = ?auto_207649 ?auto_207660 ) ) ( not ( = ?auto_207650 ?auto_207651 ) ) ( not ( = ?auto_207650 ?auto_207652 ) ) ( not ( = ?auto_207650 ?auto_207653 ) ) ( not ( = ?auto_207650 ?auto_207654 ) ) ( not ( = ?auto_207650 ?auto_207655 ) ) ( not ( = ?auto_207650 ?auto_207656 ) ) ( not ( = ?auto_207650 ?auto_207657 ) ) ( not ( = ?auto_207650 ?auto_207658 ) ) ( not ( = ?auto_207650 ?auto_207659 ) ) ( not ( = ?auto_207650 ?auto_207660 ) ) ( not ( = ?auto_207651 ?auto_207652 ) ) ( not ( = ?auto_207651 ?auto_207653 ) ) ( not ( = ?auto_207651 ?auto_207654 ) ) ( not ( = ?auto_207651 ?auto_207655 ) ) ( not ( = ?auto_207651 ?auto_207656 ) ) ( not ( = ?auto_207651 ?auto_207657 ) ) ( not ( = ?auto_207651 ?auto_207658 ) ) ( not ( = ?auto_207651 ?auto_207659 ) ) ( not ( = ?auto_207651 ?auto_207660 ) ) ( not ( = ?auto_207652 ?auto_207653 ) ) ( not ( = ?auto_207652 ?auto_207654 ) ) ( not ( = ?auto_207652 ?auto_207655 ) ) ( not ( = ?auto_207652 ?auto_207656 ) ) ( not ( = ?auto_207652 ?auto_207657 ) ) ( not ( = ?auto_207652 ?auto_207658 ) ) ( not ( = ?auto_207652 ?auto_207659 ) ) ( not ( = ?auto_207652 ?auto_207660 ) ) ( not ( = ?auto_207653 ?auto_207654 ) ) ( not ( = ?auto_207653 ?auto_207655 ) ) ( not ( = ?auto_207653 ?auto_207656 ) ) ( not ( = ?auto_207653 ?auto_207657 ) ) ( not ( = ?auto_207653 ?auto_207658 ) ) ( not ( = ?auto_207653 ?auto_207659 ) ) ( not ( = ?auto_207653 ?auto_207660 ) ) ( not ( = ?auto_207654 ?auto_207655 ) ) ( not ( = ?auto_207654 ?auto_207656 ) ) ( not ( = ?auto_207654 ?auto_207657 ) ) ( not ( = ?auto_207654 ?auto_207658 ) ) ( not ( = ?auto_207654 ?auto_207659 ) ) ( not ( = ?auto_207654 ?auto_207660 ) ) ( not ( = ?auto_207655 ?auto_207656 ) ) ( not ( = ?auto_207655 ?auto_207657 ) ) ( not ( = ?auto_207655 ?auto_207658 ) ) ( not ( = ?auto_207655 ?auto_207659 ) ) ( not ( = ?auto_207655 ?auto_207660 ) ) ( not ( = ?auto_207656 ?auto_207657 ) ) ( not ( = ?auto_207656 ?auto_207658 ) ) ( not ( = ?auto_207656 ?auto_207659 ) ) ( not ( = ?auto_207656 ?auto_207660 ) ) ( not ( = ?auto_207657 ?auto_207658 ) ) ( not ( = ?auto_207657 ?auto_207659 ) ) ( not ( = ?auto_207657 ?auto_207660 ) ) ( not ( = ?auto_207658 ?auto_207659 ) ) ( not ( = ?auto_207658 ?auto_207660 ) ) ( not ( = ?auto_207659 ?auto_207660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207659 ?auto_207660 )
      ( !STACK ?auto_207659 ?auto_207658 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207673 - BLOCK
      ?auto_207674 - BLOCK
      ?auto_207675 - BLOCK
      ?auto_207676 - BLOCK
      ?auto_207677 - BLOCK
      ?auto_207678 - BLOCK
      ?auto_207679 - BLOCK
      ?auto_207680 - BLOCK
      ?auto_207681 - BLOCK
      ?auto_207682 - BLOCK
      ?auto_207683 - BLOCK
      ?auto_207684 - BLOCK
    )
    :vars
    (
      ?auto_207685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_207683 ) ( ON ?auto_207684 ?auto_207685 ) ( CLEAR ?auto_207684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_207673 ) ( ON ?auto_207674 ?auto_207673 ) ( ON ?auto_207675 ?auto_207674 ) ( ON ?auto_207676 ?auto_207675 ) ( ON ?auto_207677 ?auto_207676 ) ( ON ?auto_207678 ?auto_207677 ) ( ON ?auto_207679 ?auto_207678 ) ( ON ?auto_207680 ?auto_207679 ) ( ON ?auto_207681 ?auto_207680 ) ( ON ?auto_207682 ?auto_207681 ) ( ON ?auto_207683 ?auto_207682 ) ( not ( = ?auto_207673 ?auto_207674 ) ) ( not ( = ?auto_207673 ?auto_207675 ) ) ( not ( = ?auto_207673 ?auto_207676 ) ) ( not ( = ?auto_207673 ?auto_207677 ) ) ( not ( = ?auto_207673 ?auto_207678 ) ) ( not ( = ?auto_207673 ?auto_207679 ) ) ( not ( = ?auto_207673 ?auto_207680 ) ) ( not ( = ?auto_207673 ?auto_207681 ) ) ( not ( = ?auto_207673 ?auto_207682 ) ) ( not ( = ?auto_207673 ?auto_207683 ) ) ( not ( = ?auto_207673 ?auto_207684 ) ) ( not ( = ?auto_207673 ?auto_207685 ) ) ( not ( = ?auto_207674 ?auto_207675 ) ) ( not ( = ?auto_207674 ?auto_207676 ) ) ( not ( = ?auto_207674 ?auto_207677 ) ) ( not ( = ?auto_207674 ?auto_207678 ) ) ( not ( = ?auto_207674 ?auto_207679 ) ) ( not ( = ?auto_207674 ?auto_207680 ) ) ( not ( = ?auto_207674 ?auto_207681 ) ) ( not ( = ?auto_207674 ?auto_207682 ) ) ( not ( = ?auto_207674 ?auto_207683 ) ) ( not ( = ?auto_207674 ?auto_207684 ) ) ( not ( = ?auto_207674 ?auto_207685 ) ) ( not ( = ?auto_207675 ?auto_207676 ) ) ( not ( = ?auto_207675 ?auto_207677 ) ) ( not ( = ?auto_207675 ?auto_207678 ) ) ( not ( = ?auto_207675 ?auto_207679 ) ) ( not ( = ?auto_207675 ?auto_207680 ) ) ( not ( = ?auto_207675 ?auto_207681 ) ) ( not ( = ?auto_207675 ?auto_207682 ) ) ( not ( = ?auto_207675 ?auto_207683 ) ) ( not ( = ?auto_207675 ?auto_207684 ) ) ( not ( = ?auto_207675 ?auto_207685 ) ) ( not ( = ?auto_207676 ?auto_207677 ) ) ( not ( = ?auto_207676 ?auto_207678 ) ) ( not ( = ?auto_207676 ?auto_207679 ) ) ( not ( = ?auto_207676 ?auto_207680 ) ) ( not ( = ?auto_207676 ?auto_207681 ) ) ( not ( = ?auto_207676 ?auto_207682 ) ) ( not ( = ?auto_207676 ?auto_207683 ) ) ( not ( = ?auto_207676 ?auto_207684 ) ) ( not ( = ?auto_207676 ?auto_207685 ) ) ( not ( = ?auto_207677 ?auto_207678 ) ) ( not ( = ?auto_207677 ?auto_207679 ) ) ( not ( = ?auto_207677 ?auto_207680 ) ) ( not ( = ?auto_207677 ?auto_207681 ) ) ( not ( = ?auto_207677 ?auto_207682 ) ) ( not ( = ?auto_207677 ?auto_207683 ) ) ( not ( = ?auto_207677 ?auto_207684 ) ) ( not ( = ?auto_207677 ?auto_207685 ) ) ( not ( = ?auto_207678 ?auto_207679 ) ) ( not ( = ?auto_207678 ?auto_207680 ) ) ( not ( = ?auto_207678 ?auto_207681 ) ) ( not ( = ?auto_207678 ?auto_207682 ) ) ( not ( = ?auto_207678 ?auto_207683 ) ) ( not ( = ?auto_207678 ?auto_207684 ) ) ( not ( = ?auto_207678 ?auto_207685 ) ) ( not ( = ?auto_207679 ?auto_207680 ) ) ( not ( = ?auto_207679 ?auto_207681 ) ) ( not ( = ?auto_207679 ?auto_207682 ) ) ( not ( = ?auto_207679 ?auto_207683 ) ) ( not ( = ?auto_207679 ?auto_207684 ) ) ( not ( = ?auto_207679 ?auto_207685 ) ) ( not ( = ?auto_207680 ?auto_207681 ) ) ( not ( = ?auto_207680 ?auto_207682 ) ) ( not ( = ?auto_207680 ?auto_207683 ) ) ( not ( = ?auto_207680 ?auto_207684 ) ) ( not ( = ?auto_207680 ?auto_207685 ) ) ( not ( = ?auto_207681 ?auto_207682 ) ) ( not ( = ?auto_207681 ?auto_207683 ) ) ( not ( = ?auto_207681 ?auto_207684 ) ) ( not ( = ?auto_207681 ?auto_207685 ) ) ( not ( = ?auto_207682 ?auto_207683 ) ) ( not ( = ?auto_207682 ?auto_207684 ) ) ( not ( = ?auto_207682 ?auto_207685 ) ) ( not ( = ?auto_207683 ?auto_207684 ) ) ( not ( = ?auto_207683 ?auto_207685 ) ) ( not ( = ?auto_207684 ?auto_207685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_207684 ?auto_207685 )
      ( !STACK ?auto_207684 ?auto_207683 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207698 - BLOCK
      ?auto_207699 - BLOCK
      ?auto_207700 - BLOCK
      ?auto_207701 - BLOCK
      ?auto_207702 - BLOCK
      ?auto_207703 - BLOCK
      ?auto_207704 - BLOCK
      ?auto_207705 - BLOCK
      ?auto_207706 - BLOCK
      ?auto_207707 - BLOCK
      ?auto_207708 - BLOCK
      ?auto_207709 - BLOCK
    )
    :vars
    (
      ?auto_207710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207709 ?auto_207710 ) ( ON-TABLE ?auto_207698 ) ( ON ?auto_207699 ?auto_207698 ) ( ON ?auto_207700 ?auto_207699 ) ( ON ?auto_207701 ?auto_207700 ) ( ON ?auto_207702 ?auto_207701 ) ( ON ?auto_207703 ?auto_207702 ) ( ON ?auto_207704 ?auto_207703 ) ( ON ?auto_207705 ?auto_207704 ) ( ON ?auto_207706 ?auto_207705 ) ( ON ?auto_207707 ?auto_207706 ) ( not ( = ?auto_207698 ?auto_207699 ) ) ( not ( = ?auto_207698 ?auto_207700 ) ) ( not ( = ?auto_207698 ?auto_207701 ) ) ( not ( = ?auto_207698 ?auto_207702 ) ) ( not ( = ?auto_207698 ?auto_207703 ) ) ( not ( = ?auto_207698 ?auto_207704 ) ) ( not ( = ?auto_207698 ?auto_207705 ) ) ( not ( = ?auto_207698 ?auto_207706 ) ) ( not ( = ?auto_207698 ?auto_207707 ) ) ( not ( = ?auto_207698 ?auto_207708 ) ) ( not ( = ?auto_207698 ?auto_207709 ) ) ( not ( = ?auto_207698 ?auto_207710 ) ) ( not ( = ?auto_207699 ?auto_207700 ) ) ( not ( = ?auto_207699 ?auto_207701 ) ) ( not ( = ?auto_207699 ?auto_207702 ) ) ( not ( = ?auto_207699 ?auto_207703 ) ) ( not ( = ?auto_207699 ?auto_207704 ) ) ( not ( = ?auto_207699 ?auto_207705 ) ) ( not ( = ?auto_207699 ?auto_207706 ) ) ( not ( = ?auto_207699 ?auto_207707 ) ) ( not ( = ?auto_207699 ?auto_207708 ) ) ( not ( = ?auto_207699 ?auto_207709 ) ) ( not ( = ?auto_207699 ?auto_207710 ) ) ( not ( = ?auto_207700 ?auto_207701 ) ) ( not ( = ?auto_207700 ?auto_207702 ) ) ( not ( = ?auto_207700 ?auto_207703 ) ) ( not ( = ?auto_207700 ?auto_207704 ) ) ( not ( = ?auto_207700 ?auto_207705 ) ) ( not ( = ?auto_207700 ?auto_207706 ) ) ( not ( = ?auto_207700 ?auto_207707 ) ) ( not ( = ?auto_207700 ?auto_207708 ) ) ( not ( = ?auto_207700 ?auto_207709 ) ) ( not ( = ?auto_207700 ?auto_207710 ) ) ( not ( = ?auto_207701 ?auto_207702 ) ) ( not ( = ?auto_207701 ?auto_207703 ) ) ( not ( = ?auto_207701 ?auto_207704 ) ) ( not ( = ?auto_207701 ?auto_207705 ) ) ( not ( = ?auto_207701 ?auto_207706 ) ) ( not ( = ?auto_207701 ?auto_207707 ) ) ( not ( = ?auto_207701 ?auto_207708 ) ) ( not ( = ?auto_207701 ?auto_207709 ) ) ( not ( = ?auto_207701 ?auto_207710 ) ) ( not ( = ?auto_207702 ?auto_207703 ) ) ( not ( = ?auto_207702 ?auto_207704 ) ) ( not ( = ?auto_207702 ?auto_207705 ) ) ( not ( = ?auto_207702 ?auto_207706 ) ) ( not ( = ?auto_207702 ?auto_207707 ) ) ( not ( = ?auto_207702 ?auto_207708 ) ) ( not ( = ?auto_207702 ?auto_207709 ) ) ( not ( = ?auto_207702 ?auto_207710 ) ) ( not ( = ?auto_207703 ?auto_207704 ) ) ( not ( = ?auto_207703 ?auto_207705 ) ) ( not ( = ?auto_207703 ?auto_207706 ) ) ( not ( = ?auto_207703 ?auto_207707 ) ) ( not ( = ?auto_207703 ?auto_207708 ) ) ( not ( = ?auto_207703 ?auto_207709 ) ) ( not ( = ?auto_207703 ?auto_207710 ) ) ( not ( = ?auto_207704 ?auto_207705 ) ) ( not ( = ?auto_207704 ?auto_207706 ) ) ( not ( = ?auto_207704 ?auto_207707 ) ) ( not ( = ?auto_207704 ?auto_207708 ) ) ( not ( = ?auto_207704 ?auto_207709 ) ) ( not ( = ?auto_207704 ?auto_207710 ) ) ( not ( = ?auto_207705 ?auto_207706 ) ) ( not ( = ?auto_207705 ?auto_207707 ) ) ( not ( = ?auto_207705 ?auto_207708 ) ) ( not ( = ?auto_207705 ?auto_207709 ) ) ( not ( = ?auto_207705 ?auto_207710 ) ) ( not ( = ?auto_207706 ?auto_207707 ) ) ( not ( = ?auto_207706 ?auto_207708 ) ) ( not ( = ?auto_207706 ?auto_207709 ) ) ( not ( = ?auto_207706 ?auto_207710 ) ) ( not ( = ?auto_207707 ?auto_207708 ) ) ( not ( = ?auto_207707 ?auto_207709 ) ) ( not ( = ?auto_207707 ?auto_207710 ) ) ( not ( = ?auto_207708 ?auto_207709 ) ) ( not ( = ?auto_207708 ?auto_207710 ) ) ( not ( = ?auto_207709 ?auto_207710 ) ) ( CLEAR ?auto_207707 ) ( ON ?auto_207708 ?auto_207709 ) ( CLEAR ?auto_207708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_207698 ?auto_207699 ?auto_207700 ?auto_207701 ?auto_207702 ?auto_207703 ?auto_207704 ?auto_207705 ?auto_207706 ?auto_207707 ?auto_207708 )
      ( MAKE-12PILE ?auto_207698 ?auto_207699 ?auto_207700 ?auto_207701 ?auto_207702 ?auto_207703 ?auto_207704 ?auto_207705 ?auto_207706 ?auto_207707 ?auto_207708 ?auto_207709 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207723 - BLOCK
      ?auto_207724 - BLOCK
      ?auto_207725 - BLOCK
      ?auto_207726 - BLOCK
      ?auto_207727 - BLOCK
      ?auto_207728 - BLOCK
      ?auto_207729 - BLOCK
      ?auto_207730 - BLOCK
      ?auto_207731 - BLOCK
      ?auto_207732 - BLOCK
      ?auto_207733 - BLOCK
      ?auto_207734 - BLOCK
    )
    :vars
    (
      ?auto_207735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207734 ?auto_207735 ) ( ON-TABLE ?auto_207723 ) ( ON ?auto_207724 ?auto_207723 ) ( ON ?auto_207725 ?auto_207724 ) ( ON ?auto_207726 ?auto_207725 ) ( ON ?auto_207727 ?auto_207726 ) ( ON ?auto_207728 ?auto_207727 ) ( ON ?auto_207729 ?auto_207728 ) ( ON ?auto_207730 ?auto_207729 ) ( ON ?auto_207731 ?auto_207730 ) ( ON ?auto_207732 ?auto_207731 ) ( not ( = ?auto_207723 ?auto_207724 ) ) ( not ( = ?auto_207723 ?auto_207725 ) ) ( not ( = ?auto_207723 ?auto_207726 ) ) ( not ( = ?auto_207723 ?auto_207727 ) ) ( not ( = ?auto_207723 ?auto_207728 ) ) ( not ( = ?auto_207723 ?auto_207729 ) ) ( not ( = ?auto_207723 ?auto_207730 ) ) ( not ( = ?auto_207723 ?auto_207731 ) ) ( not ( = ?auto_207723 ?auto_207732 ) ) ( not ( = ?auto_207723 ?auto_207733 ) ) ( not ( = ?auto_207723 ?auto_207734 ) ) ( not ( = ?auto_207723 ?auto_207735 ) ) ( not ( = ?auto_207724 ?auto_207725 ) ) ( not ( = ?auto_207724 ?auto_207726 ) ) ( not ( = ?auto_207724 ?auto_207727 ) ) ( not ( = ?auto_207724 ?auto_207728 ) ) ( not ( = ?auto_207724 ?auto_207729 ) ) ( not ( = ?auto_207724 ?auto_207730 ) ) ( not ( = ?auto_207724 ?auto_207731 ) ) ( not ( = ?auto_207724 ?auto_207732 ) ) ( not ( = ?auto_207724 ?auto_207733 ) ) ( not ( = ?auto_207724 ?auto_207734 ) ) ( not ( = ?auto_207724 ?auto_207735 ) ) ( not ( = ?auto_207725 ?auto_207726 ) ) ( not ( = ?auto_207725 ?auto_207727 ) ) ( not ( = ?auto_207725 ?auto_207728 ) ) ( not ( = ?auto_207725 ?auto_207729 ) ) ( not ( = ?auto_207725 ?auto_207730 ) ) ( not ( = ?auto_207725 ?auto_207731 ) ) ( not ( = ?auto_207725 ?auto_207732 ) ) ( not ( = ?auto_207725 ?auto_207733 ) ) ( not ( = ?auto_207725 ?auto_207734 ) ) ( not ( = ?auto_207725 ?auto_207735 ) ) ( not ( = ?auto_207726 ?auto_207727 ) ) ( not ( = ?auto_207726 ?auto_207728 ) ) ( not ( = ?auto_207726 ?auto_207729 ) ) ( not ( = ?auto_207726 ?auto_207730 ) ) ( not ( = ?auto_207726 ?auto_207731 ) ) ( not ( = ?auto_207726 ?auto_207732 ) ) ( not ( = ?auto_207726 ?auto_207733 ) ) ( not ( = ?auto_207726 ?auto_207734 ) ) ( not ( = ?auto_207726 ?auto_207735 ) ) ( not ( = ?auto_207727 ?auto_207728 ) ) ( not ( = ?auto_207727 ?auto_207729 ) ) ( not ( = ?auto_207727 ?auto_207730 ) ) ( not ( = ?auto_207727 ?auto_207731 ) ) ( not ( = ?auto_207727 ?auto_207732 ) ) ( not ( = ?auto_207727 ?auto_207733 ) ) ( not ( = ?auto_207727 ?auto_207734 ) ) ( not ( = ?auto_207727 ?auto_207735 ) ) ( not ( = ?auto_207728 ?auto_207729 ) ) ( not ( = ?auto_207728 ?auto_207730 ) ) ( not ( = ?auto_207728 ?auto_207731 ) ) ( not ( = ?auto_207728 ?auto_207732 ) ) ( not ( = ?auto_207728 ?auto_207733 ) ) ( not ( = ?auto_207728 ?auto_207734 ) ) ( not ( = ?auto_207728 ?auto_207735 ) ) ( not ( = ?auto_207729 ?auto_207730 ) ) ( not ( = ?auto_207729 ?auto_207731 ) ) ( not ( = ?auto_207729 ?auto_207732 ) ) ( not ( = ?auto_207729 ?auto_207733 ) ) ( not ( = ?auto_207729 ?auto_207734 ) ) ( not ( = ?auto_207729 ?auto_207735 ) ) ( not ( = ?auto_207730 ?auto_207731 ) ) ( not ( = ?auto_207730 ?auto_207732 ) ) ( not ( = ?auto_207730 ?auto_207733 ) ) ( not ( = ?auto_207730 ?auto_207734 ) ) ( not ( = ?auto_207730 ?auto_207735 ) ) ( not ( = ?auto_207731 ?auto_207732 ) ) ( not ( = ?auto_207731 ?auto_207733 ) ) ( not ( = ?auto_207731 ?auto_207734 ) ) ( not ( = ?auto_207731 ?auto_207735 ) ) ( not ( = ?auto_207732 ?auto_207733 ) ) ( not ( = ?auto_207732 ?auto_207734 ) ) ( not ( = ?auto_207732 ?auto_207735 ) ) ( not ( = ?auto_207733 ?auto_207734 ) ) ( not ( = ?auto_207733 ?auto_207735 ) ) ( not ( = ?auto_207734 ?auto_207735 ) ) ( CLEAR ?auto_207732 ) ( ON ?auto_207733 ?auto_207734 ) ( CLEAR ?auto_207733 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_207723 ?auto_207724 ?auto_207725 ?auto_207726 ?auto_207727 ?auto_207728 ?auto_207729 ?auto_207730 ?auto_207731 ?auto_207732 ?auto_207733 )
      ( MAKE-12PILE ?auto_207723 ?auto_207724 ?auto_207725 ?auto_207726 ?auto_207727 ?auto_207728 ?auto_207729 ?auto_207730 ?auto_207731 ?auto_207732 ?auto_207733 ?auto_207734 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207748 - BLOCK
      ?auto_207749 - BLOCK
      ?auto_207750 - BLOCK
      ?auto_207751 - BLOCK
      ?auto_207752 - BLOCK
      ?auto_207753 - BLOCK
      ?auto_207754 - BLOCK
      ?auto_207755 - BLOCK
      ?auto_207756 - BLOCK
      ?auto_207757 - BLOCK
      ?auto_207758 - BLOCK
      ?auto_207759 - BLOCK
    )
    :vars
    (
      ?auto_207760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207759 ?auto_207760 ) ( ON-TABLE ?auto_207748 ) ( ON ?auto_207749 ?auto_207748 ) ( ON ?auto_207750 ?auto_207749 ) ( ON ?auto_207751 ?auto_207750 ) ( ON ?auto_207752 ?auto_207751 ) ( ON ?auto_207753 ?auto_207752 ) ( ON ?auto_207754 ?auto_207753 ) ( ON ?auto_207755 ?auto_207754 ) ( ON ?auto_207756 ?auto_207755 ) ( not ( = ?auto_207748 ?auto_207749 ) ) ( not ( = ?auto_207748 ?auto_207750 ) ) ( not ( = ?auto_207748 ?auto_207751 ) ) ( not ( = ?auto_207748 ?auto_207752 ) ) ( not ( = ?auto_207748 ?auto_207753 ) ) ( not ( = ?auto_207748 ?auto_207754 ) ) ( not ( = ?auto_207748 ?auto_207755 ) ) ( not ( = ?auto_207748 ?auto_207756 ) ) ( not ( = ?auto_207748 ?auto_207757 ) ) ( not ( = ?auto_207748 ?auto_207758 ) ) ( not ( = ?auto_207748 ?auto_207759 ) ) ( not ( = ?auto_207748 ?auto_207760 ) ) ( not ( = ?auto_207749 ?auto_207750 ) ) ( not ( = ?auto_207749 ?auto_207751 ) ) ( not ( = ?auto_207749 ?auto_207752 ) ) ( not ( = ?auto_207749 ?auto_207753 ) ) ( not ( = ?auto_207749 ?auto_207754 ) ) ( not ( = ?auto_207749 ?auto_207755 ) ) ( not ( = ?auto_207749 ?auto_207756 ) ) ( not ( = ?auto_207749 ?auto_207757 ) ) ( not ( = ?auto_207749 ?auto_207758 ) ) ( not ( = ?auto_207749 ?auto_207759 ) ) ( not ( = ?auto_207749 ?auto_207760 ) ) ( not ( = ?auto_207750 ?auto_207751 ) ) ( not ( = ?auto_207750 ?auto_207752 ) ) ( not ( = ?auto_207750 ?auto_207753 ) ) ( not ( = ?auto_207750 ?auto_207754 ) ) ( not ( = ?auto_207750 ?auto_207755 ) ) ( not ( = ?auto_207750 ?auto_207756 ) ) ( not ( = ?auto_207750 ?auto_207757 ) ) ( not ( = ?auto_207750 ?auto_207758 ) ) ( not ( = ?auto_207750 ?auto_207759 ) ) ( not ( = ?auto_207750 ?auto_207760 ) ) ( not ( = ?auto_207751 ?auto_207752 ) ) ( not ( = ?auto_207751 ?auto_207753 ) ) ( not ( = ?auto_207751 ?auto_207754 ) ) ( not ( = ?auto_207751 ?auto_207755 ) ) ( not ( = ?auto_207751 ?auto_207756 ) ) ( not ( = ?auto_207751 ?auto_207757 ) ) ( not ( = ?auto_207751 ?auto_207758 ) ) ( not ( = ?auto_207751 ?auto_207759 ) ) ( not ( = ?auto_207751 ?auto_207760 ) ) ( not ( = ?auto_207752 ?auto_207753 ) ) ( not ( = ?auto_207752 ?auto_207754 ) ) ( not ( = ?auto_207752 ?auto_207755 ) ) ( not ( = ?auto_207752 ?auto_207756 ) ) ( not ( = ?auto_207752 ?auto_207757 ) ) ( not ( = ?auto_207752 ?auto_207758 ) ) ( not ( = ?auto_207752 ?auto_207759 ) ) ( not ( = ?auto_207752 ?auto_207760 ) ) ( not ( = ?auto_207753 ?auto_207754 ) ) ( not ( = ?auto_207753 ?auto_207755 ) ) ( not ( = ?auto_207753 ?auto_207756 ) ) ( not ( = ?auto_207753 ?auto_207757 ) ) ( not ( = ?auto_207753 ?auto_207758 ) ) ( not ( = ?auto_207753 ?auto_207759 ) ) ( not ( = ?auto_207753 ?auto_207760 ) ) ( not ( = ?auto_207754 ?auto_207755 ) ) ( not ( = ?auto_207754 ?auto_207756 ) ) ( not ( = ?auto_207754 ?auto_207757 ) ) ( not ( = ?auto_207754 ?auto_207758 ) ) ( not ( = ?auto_207754 ?auto_207759 ) ) ( not ( = ?auto_207754 ?auto_207760 ) ) ( not ( = ?auto_207755 ?auto_207756 ) ) ( not ( = ?auto_207755 ?auto_207757 ) ) ( not ( = ?auto_207755 ?auto_207758 ) ) ( not ( = ?auto_207755 ?auto_207759 ) ) ( not ( = ?auto_207755 ?auto_207760 ) ) ( not ( = ?auto_207756 ?auto_207757 ) ) ( not ( = ?auto_207756 ?auto_207758 ) ) ( not ( = ?auto_207756 ?auto_207759 ) ) ( not ( = ?auto_207756 ?auto_207760 ) ) ( not ( = ?auto_207757 ?auto_207758 ) ) ( not ( = ?auto_207757 ?auto_207759 ) ) ( not ( = ?auto_207757 ?auto_207760 ) ) ( not ( = ?auto_207758 ?auto_207759 ) ) ( not ( = ?auto_207758 ?auto_207760 ) ) ( not ( = ?auto_207759 ?auto_207760 ) ) ( ON ?auto_207758 ?auto_207759 ) ( CLEAR ?auto_207756 ) ( ON ?auto_207757 ?auto_207758 ) ( CLEAR ?auto_207757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207748 ?auto_207749 ?auto_207750 ?auto_207751 ?auto_207752 ?auto_207753 ?auto_207754 ?auto_207755 ?auto_207756 ?auto_207757 )
      ( MAKE-12PILE ?auto_207748 ?auto_207749 ?auto_207750 ?auto_207751 ?auto_207752 ?auto_207753 ?auto_207754 ?auto_207755 ?auto_207756 ?auto_207757 ?auto_207758 ?auto_207759 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207773 - BLOCK
      ?auto_207774 - BLOCK
      ?auto_207775 - BLOCK
      ?auto_207776 - BLOCK
      ?auto_207777 - BLOCK
      ?auto_207778 - BLOCK
      ?auto_207779 - BLOCK
      ?auto_207780 - BLOCK
      ?auto_207781 - BLOCK
      ?auto_207782 - BLOCK
      ?auto_207783 - BLOCK
      ?auto_207784 - BLOCK
    )
    :vars
    (
      ?auto_207785 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207784 ?auto_207785 ) ( ON-TABLE ?auto_207773 ) ( ON ?auto_207774 ?auto_207773 ) ( ON ?auto_207775 ?auto_207774 ) ( ON ?auto_207776 ?auto_207775 ) ( ON ?auto_207777 ?auto_207776 ) ( ON ?auto_207778 ?auto_207777 ) ( ON ?auto_207779 ?auto_207778 ) ( ON ?auto_207780 ?auto_207779 ) ( ON ?auto_207781 ?auto_207780 ) ( not ( = ?auto_207773 ?auto_207774 ) ) ( not ( = ?auto_207773 ?auto_207775 ) ) ( not ( = ?auto_207773 ?auto_207776 ) ) ( not ( = ?auto_207773 ?auto_207777 ) ) ( not ( = ?auto_207773 ?auto_207778 ) ) ( not ( = ?auto_207773 ?auto_207779 ) ) ( not ( = ?auto_207773 ?auto_207780 ) ) ( not ( = ?auto_207773 ?auto_207781 ) ) ( not ( = ?auto_207773 ?auto_207782 ) ) ( not ( = ?auto_207773 ?auto_207783 ) ) ( not ( = ?auto_207773 ?auto_207784 ) ) ( not ( = ?auto_207773 ?auto_207785 ) ) ( not ( = ?auto_207774 ?auto_207775 ) ) ( not ( = ?auto_207774 ?auto_207776 ) ) ( not ( = ?auto_207774 ?auto_207777 ) ) ( not ( = ?auto_207774 ?auto_207778 ) ) ( not ( = ?auto_207774 ?auto_207779 ) ) ( not ( = ?auto_207774 ?auto_207780 ) ) ( not ( = ?auto_207774 ?auto_207781 ) ) ( not ( = ?auto_207774 ?auto_207782 ) ) ( not ( = ?auto_207774 ?auto_207783 ) ) ( not ( = ?auto_207774 ?auto_207784 ) ) ( not ( = ?auto_207774 ?auto_207785 ) ) ( not ( = ?auto_207775 ?auto_207776 ) ) ( not ( = ?auto_207775 ?auto_207777 ) ) ( not ( = ?auto_207775 ?auto_207778 ) ) ( not ( = ?auto_207775 ?auto_207779 ) ) ( not ( = ?auto_207775 ?auto_207780 ) ) ( not ( = ?auto_207775 ?auto_207781 ) ) ( not ( = ?auto_207775 ?auto_207782 ) ) ( not ( = ?auto_207775 ?auto_207783 ) ) ( not ( = ?auto_207775 ?auto_207784 ) ) ( not ( = ?auto_207775 ?auto_207785 ) ) ( not ( = ?auto_207776 ?auto_207777 ) ) ( not ( = ?auto_207776 ?auto_207778 ) ) ( not ( = ?auto_207776 ?auto_207779 ) ) ( not ( = ?auto_207776 ?auto_207780 ) ) ( not ( = ?auto_207776 ?auto_207781 ) ) ( not ( = ?auto_207776 ?auto_207782 ) ) ( not ( = ?auto_207776 ?auto_207783 ) ) ( not ( = ?auto_207776 ?auto_207784 ) ) ( not ( = ?auto_207776 ?auto_207785 ) ) ( not ( = ?auto_207777 ?auto_207778 ) ) ( not ( = ?auto_207777 ?auto_207779 ) ) ( not ( = ?auto_207777 ?auto_207780 ) ) ( not ( = ?auto_207777 ?auto_207781 ) ) ( not ( = ?auto_207777 ?auto_207782 ) ) ( not ( = ?auto_207777 ?auto_207783 ) ) ( not ( = ?auto_207777 ?auto_207784 ) ) ( not ( = ?auto_207777 ?auto_207785 ) ) ( not ( = ?auto_207778 ?auto_207779 ) ) ( not ( = ?auto_207778 ?auto_207780 ) ) ( not ( = ?auto_207778 ?auto_207781 ) ) ( not ( = ?auto_207778 ?auto_207782 ) ) ( not ( = ?auto_207778 ?auto_207783 ) ) ( not ( = ?auto_207778 ?auto_207784 ) ) ( not ( = ?auto_207778 ?auto_207785 ) ) ( not ( = ?auto_207779 ?auto_207780 ) ) ( not ( = ?auto_207779 ?auto_207781 ) ) ( not ( = ?auto_207779 ?auto_207782 ) ) ( not ( = ?auto_207779 ?auto_207783 ) ) ( not ( = ?auto_207779 ?auto_207784 ) ) ( not ( = ?auto_207779 ?auto_207785 ) ) ( not ( = ?auto_207780 ?auto_207781 ) ) ( not ( = ?auto_207780 ?auto_207782 ) ) ( not ( = ?auto_207780 ?auto_207783 ) ) ( not ( = ?auto_207780 ?auto_207784 ) ) ( not ( = ?auto_207780 ?auto_207785 ) ) ( not ( = ?auto_207781 ?auto_207782 ) ) ( not ( = ?auto_207781 ?auto_207783 ) ) ( not ( = ?auto_207781 ?auto_207784 ) ) ( not ( = ?auto_207781 ?auto_207785 ) ) ( not ( = ?auto_207782 ?auto_207783 ) ) ( not ( = ?auto_207782 ?auto_207784 ) ) ( not ( = ?auto_207782 ?auto_207785 ) ) ( not ( = ?auto_207783 ?auto_207784 ) ) ( not ( = ?auto_207783 ?auto_207785 ) ) ( not ( = ?auto_207784 ?auto_207785 ) ) ( ON ?auto_207783 ?auto_207784 ) ( CLEAR ?auto_207781 ) ( ON ?auto_207782 ?auto_207783 ) ( CLEAR ?auto_207782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_207773 ?auto_207774 ?auto_207775 ?auto_207776 ?auto_207777 ?auto_207778 ?auto_207779 ?auto_207780 ?auto_207781 ?auto_207782 )
      ( MAKE-12PILE ?auto_207773 ?auto_207774 ?auto_207775 ?auto_207776 ?auto_207777 ?auto_207778 ?auto_207779 ?auto_207780 ?auto_207781 ?auto_207782 ?auto_207783 ?auto_207784 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207798 - BLOCK
      ?auto_207799 - BLOCK
      ?auto_207800 - BLOCK
      ?auto_207801 - BLOCK
      ?auto_207802 - BLOCK
      ?auto_207803 - BLOCK
      ?auto_207804 - BLOCK
      ?auto_207805 - BLOCK
      ?auto_207806 - BLOCK
      ?auto_207807 - BLOCK
      ?auto_207808 - BLOCK
      ?auto_207809 - BLOCK
    )
    :vars
    (
      ?auto_207810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207809 ?auto_207810 ) ( ON-TABLE ?auto_207798 ) ( ON ?auto_207799 ?auto_207798 ) ( ON ?auto_207800 ?auto_207799 ) ( ON ?auto_207801 ?auto_207800 ) ( ON ?auto_207802 ?auto_207801 ) ( ON ?auto_207803 ?auto_207802 ) ( ON ?auto_207804 ?auto_207803 ) ( ON ?auto_207805 ?auto_207804 ) ( not ( = ?auto_207798 ?auto_207799 ) ) ( not ( = ?auto_207798 ?auto_207800 ) ) ( not ( = ?auto_207798 ?auto_207801 ) ) ( not ( = ?auto_207798 ?auto_207802 ) ) ( not ( = ?auto_207798 ?auto_207803 ) ) ( not ( = ?auto_207798 ?auto_207804 ) ) ( not ( = ?auto_207798 ?auto_207805 ) ) ( not ( = ?auto_207798 ?auto_207806 ) ) ( not ( = ?auto_207798 ?auto_207807 ) ) ( not ( = ?auto_207798 ?auto_207808 ) ) ( not ( = ?auto_207798 ?auto_207809 ) ) ( not ( = ?auto_207798 ?auto_207810 ) ) ( not ( = ?auto_207799 ?auto_207800 ) ) ( not ( = ?auto_207799 ?auto_207801 ) ) ( not ( = ?auto_207799 ?auto_207802 ) ) ( not ( = ?auto_207799 ?auto_207803 ) ) ( not ( = ?auto_207799 ?auto_207804 ) ) ( not ( = ?auto_207799 ?auto_207805 ) ) ( not ( = ?auto_207799 ?auto_207806 ) ) ( not ( = ?auto_207799 ?auto_207807 ) ) ( not ( = ?auto_207799 ?auto_207808 ) ) ( not ( = ?auto_207799 ?auto_207809 ) ) ( not ( = ?auto_207799 ?auto_207810 ) ) ( not ( = ?auto_207800 ?auto_207801 ) ) ( not ( = ?auto_207800 ?auto_207802 ) ) ( not ( = ?auto_207800 ?auto_207803 ) ) ( not ( = ?auto_207800 ?auto_207804 ) ) ( not ( = ?auto_207800 ?auto_207805 ) ) ( not ( = ?auto_207800 ?auto_207806 ) ) ( not ( = ?auto_207800 ?auto_207807 ) ) ( not ( = ?auto_207800 ?auto_207808 ) ) ( not ( = ?auto_207800 ?auto_207809 ) ) ( not ( = ?auto_207800 ?auto_207810 ) ) ( not ( = ?auto_207801 ?auto_207802 ) ) ( not ( = ?auto_207801 ?auto_207803 ) ) ( not ( = ?auto_207801 ?auto_207804 ) ) ( not ( = ?auto_207801 ?auto_207805 ) ) ( not ( = ?auto_207801 ?auto_207806 ) ) ( not ( = ?auto_207801 ?auto_207807 ) ) ( not ( = ?auto_207801 ?auto_207808 ) ) ( not ( = ?auto_207801 ?auto_207809 ) ) ( not ( = ?auto_207801 ?auto_207810 ) ) ( not ( = ?auto_207802 ?auto_207803 ) ) ( not ( = ?auto_207802 ?auto_207804 ) ) ( not ( = ?auto_207802 ?auto_207805 ) ) ( not ( = ?auto_207802 ?auto_207806 ) ) ( not ( = ?auto_207802 ?auto_207807 ) ) ( not ( = ?auto_207802 ?auto_207808 ) ) ( not ( = ?auto_207802 ?auto_207809 ) ) ( not ( = ?auto_207802 ?auto_207810 ) ) ( not ( = ?auto_207803 ?auto_207804 ) ) ( not ( = ?auto_207803 ?auto_207805 ) ) ( not ( = ?auto_207803 ?auto_207806 ) ) ( not ( = ?auto_207803 ?auto_207807 ) ) ( not ( = ?auto_207803 ?auto_207808 ) ) ( not ( = ?auto_207803 ?auto_207809 ) ) ( not ( = ?auto_207803 ?auto_207810 ) ) ( not ( = ?auto_207804 ?auto_207805 ) ) ( not ( = ?auto_207804 ?auto_207806 ) ) ( not ( = ?auto_207804 ?auto_207807 ) ) ( not ( = ?auto_207804 ?auto_207808 ) ) ( not ( = ?auto_207804 ?auto_207809 ) ) ( not ( = ?auto_207804 ?auto_207810 ) ) ( not ( = ?auto_207805 ?auto_207806 ) ) ( not ( = ?auto_207805 ?auto_207807 ) ) ( not ( = ?auto_207805 ?auto_207808 ) ) ( not ( = ?auto_207805 ?auto_207809 ) ) ( not ( = ?auto_207805 ?auto_207810 ) ) ( not ( = ?auto_207806 ?auto_207807 ) ) ( not ( = ?auto_207806 ?auto_207808 ) ) ( not ( = ?auto_207806 ?auto_207809 ) ) ( not ( = ?auto_207806 ?auto_207810 ) ) ( not ( = ?auto_207807 ?auto_207808 ) ) ( not ( = ?auto_207807 ?auto_207809 ) ) ( not ( = ?auto_207807 ?auto_207810 ) ) ( not ( = ?auto_207808 ?auto_207809 ) ) ( not ( = ?auto_207808 ?auto_207810 ) ) ( not ( = ?auto_207809 ?auto_207810 ) ) ( ON ?auto_207808 ?auto_207809 ) ( ON ?auto_207807 ?auto_207808 ) ( CLEAR ?auto_207805 ) ( ON ?auto_207806 ?auto_207807 ) ( CLEAR ?auto_207806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207798 ?auto_207799 ?auto_207800 ?auto_207801 ?auto_207802 ?auto_207803 ?auto_207804 ?auto_207805 ?auto_207806 )
      ( MAKE-12PILE ?auto_207798 ?auto_207799 ?auto_207800 ?auto_207801 ?auto_207802 ?auto_207803 ?auto_207804 ?auto_207805 ?auto_207806 ?auto_207807 ?auto_207808 ?auto_207809 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207823 - BLOCK
      ?auto_207824 - BLOCK
      ?auto_207825 - BLOCK
      ?auto_207826 - BLOCK
      ?auto_207827 - BLOCK
      ?auto_207828 - BLOCK
      ?auto_207829 - BLOCK
      ?auto_207830 - BLOCK
      ?auto_207831 - BLOCK
      ?auto_207832 - BLOCK
      ?auto_207833 - BLOCK
      ?auto_207834 - BLOCK
    )
    :vars
    (
      ?auto_207835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207834 ?auto_207835 ) ( ON-TABLE ?auto_207823 ) ( ON ?auto_207824 ?auto_207823 ) ( ON ?auto_207825 ?auto_207824 ) ( ON ?auto_207826 ?auto_207825 ) ( ON ?auto_207827 ?auto_207826 ) ( ON ?auto_207828 ?auto_207827 ) ( ON ?auto_207829 ?auto_207828 ) ( ON ?auto_207830 ?auto_207829 ) ( not ( = ?auto_207823 ?auto_207824 ) ) ( not ( = ?auto_207823 ?auto_207825 ) ) ( not ( = ?auto_207823 ?auto_207826 ) ) ( not ( = ?auto_207823 ?auto_207827 ) ) ( not ( = ?auto_207823 ?auto_207828 ) ) ( not ( = ?auto_207823 ?auto_207829 ) ) ( not ( = ?auto_207823 ?auto_207830 ) ) ( not ( = ?auto_207823 ?auto_207831 ) ) ( not ( = ?auto_207823 ?auto_207832 ) ) ( not ( = ?auto_207823 ?auto_207833 ) ) ( not ( = ?auto_207823 ?auto_207834 ) ) ( not ( = ?auto_207823 ?auto_207835 ) ) ( not ( = ?auto_207824 ?auto_207825 ) ) ( not ( = ?auto_207824 ?auto_207826 ) ) ( not ( = ?auto_207824 ?auto_207827 ) ) ( not ( = ?auto_207824 ?auto_207828 ) ) ( not ( = ?auto_207824 ?auto_207829 ) ) ( not ( = ?auto_207824 ?auto_207830 ) ) ( not ( = ?auto_207824 ?auto_207831 ) ) ( not ( = ?auto_207824 ?auto_207832 ) ) ( not ( = ?auto_207824 ?auto_207833 ) ) ( not ( = ?auto_207824 ?auto_207834 ) ) ( not ( = ?auto_207824 ?auto_207835 ) ) ( not ( = ?auto_207825 ?auto_207826 ) ) ( not ( = ?auto_207825 ?auto_207827 ) ) ( not ( = ?auto_207825 ?auto_207828 ) ) ( not ( = ?auto_207825 ?auto_207829 ) ) ( not ( = ?auto_207825 ?auto_207830 ) ) ( not ( = ?auto_207825 ?auto_207831 ) ) ( not ( = ?auto_207825 ?auto_207832 ) ) ( not ( = ?auto_207825 ?auto_207833 ) ) ( not ( = ?auto_207825 ?auto_207834 ) ) ( not ( = ?auto_207825 ?auto_207835 ) ) ( not ( = ?auto_207826 ?auto_207827 ) ) ( not ( = ?auto_207826 ?auto_207828 ) ) ( not ( = ?auto_207826 ?auto_207829 ) ) ( not ( = ?auto_207826 ?auto_207830 ) ) ( not ( = ?auto_207826 ?auto_207831 ) ) ( not ( = ?auto_207826 ?auto_207832 ) ) ( not ( = ?auto_207826 ?auto_207833 ) ) ( not ( = ?auto_207826 ?auto_207834 ) ) ( not ( = ?auto_207826 ?auto_207835 ) ) ( not ( = ?auto_207827 ?auto_207828 ) ) ( not ( = ?auto_207827 ?auto_207829 ) ) ( not ( = ?auto_207827 ?auto_207830 ) ) ( not ( = ?auto_207827 ?auto_207831 ) ) ( not ( = ?auto_207827 ?auto_207832 ) ) ( not ( = ?auto_207827 ?auto_207833 ) ) ( not ( = ?auto_207827 ?auto_207834 ) ) ( not ( = ?auto_207827 ?auto_207835 ) ) ( not ( = ?auto_207828 ?auto_207829 ) ) ( not ( = ?auto_207828 ?auto_207830 ) ) ( not ( = ?auto_207828 ?auto_207831 ) ) ( not ( = ?auto_207828 ?auto_207832 ) ) ( not ( = ?auto_207828 ?auto_207833 ) ) ( not ( = ?auto_207828 ?auto_207834 ) ) ( not ( = ?auto_207828 ?auto_207835 ) ) ( not ( = ?auto_207829 ?auto_207830 ) ) ( not ( = ?auto_207829 ?auto_207831 ) ) ( not ( = ?auto_207829 ?auto_207832 ) ) ( not ( = ?auto_207829 ?auto_207833 ) ) ( not ( = ?auto_207829 ?auto_207834 ) ) ( not ( = ?auto_207829 ?auto_207835 ) ) ( not ( = ?auto_207830 ?auto_207831 ) ) ( not ( = ?auto_207830 ?auto_207832 ) ) ( not ( = ?auto_207830 ?auto_207833 ) ) ( not ( = ?auto_207830 ?auto_207834 ) ) ( not ( = ?auto_207830 ?auto_207835 ) ) ( not ( = ?auto_207831 ?auto_207832 ) ) ( not ( = ?auto_207831 ?auto_207833 ) ) ( not ( = ?auto_207831 ?auto_207834 ) ) ( not ( = ?auto_207831 ?auto_207835 ) ) ( not ( = ?auto_207832 ?auto_207833 ) ) ( not ( = ?auto_207832 ?auto_207834 ) ) ( not ( = ?auto_207832 ?auto_207835 ) ) ( not ( = ?auto_207833 ?auto_207834 ) ) ( not ( = ?auto_207833 ?auto_207835 ) ) ( not ( = ?auto_207834 ?auto_207835 ) ) ( ON ?auto_207833 ?auto_207834 ) ( ON ?auto_207832 ?auto_207833 ) ( CLEAR ?auto_207830 ) ( ON ?auto_207831 ?auto_207832 ) ( CLEAR ?auto_207831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_207823 ?auto_207824 ?auto_207825 ?auto_207826 ?auto_207827 ?auto_207828 ?auto_207829 ?auto_207830 ?auto_207831 )
      ( MAKE-12PILE ?auto_207823 ?auto_207824 ?auto_207825 ?auto_207826 ?auto_207827 ?auto_207828 ?auto_207829 ?auto_207830 ?auto_207831 ?auto_207832 ?auto_207833 ?auto_207834 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207848 - BLOCK
      ?auto_207849 - BLOCK
      ?auto_207850 - BLOCK
      ?auto_207851 - BLOCK
      ?auto_207852 - BLOCK
      ?auto_207853 - BLOCK
      ?auto_207854 - BLOCK
      ?auto_207855 - BLOCK
      ?auto_207856 - BLOCK
      ?auto_207857 - BLOCK
      ?auto_207858 - BLOCK
      ?auto_207859 - BLOCK
    )
    :vars
    (
      ?auto_207860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207859 ?auto_207860 ) ( ON-TABLE ?auto_207848 ) ( ON ?auto_207849 ?auto_207848 ) ( ON ?auto_207850 ?auto_207849 ) ( ON ?auto_207851 ?auto_207850 ) ( ON ?auto_207852 ?auto_207851 ) ( ON ?auto_207853 ?auto_207852 ) ( ON ?auto_207854 ?auto_207853 ) ( not ( = ?auto_207848 ?auto_207849 ) ) ( not ( = ?auto_207848 ?auto_207850 ) ) ( not ( = ?auto_207848 ?auto_207851 ) ) ( not ( = ?auto_207848 ?auto_207852 ) ) ( not ( = ?auto_207848 ?auto_207853 ) ) ( not ( = ?auto_207848 ?auto_207854 ) ) ( not ( = ?auto_207848 ?auto_207855 ) ) ( not ( = ?auto_207848 ?auto_207856 ) ) ( not ( = ?auto_207848 ?auto_207857 ) ) ( not ( = ?auto_207848 ?auto_207858 ) ) ( not ( = ?auto_207848 ?auto_207859 ) ) ( not ( = ?auto_207848 ?auto_207860 ) ) ( not ( = ?auto_207849 ?auto_207850 ) ) ( not ( = ?auto_207849 ?auto_207851 ) ) ( not ( = ?auto_207849 ?auto_207852 ) ) ( not ( = ?auto_207849 ?auto_207853 ) ) ( not ( = ?auto_207849 ?auto_207854 ) ) ( not ( = ?auto_207849 ?auto_207855 ) ) ( not ( = ?auto_207849 ?auto_207856 ) ) ( not ( = ?auto_207849 ?auto_207857 ) ) ( not ( = ?auto_207849 ?auto_207858 ) ) ( not ( = ?auto_207849 ?auto_207859 ) ) ( not ( = ?auto_207849 ?auto_207860 ) ) ( not ( = ?auto_207850 ?auto_207851 ) ) ( not ( = ?auto_207850 ?auto_207852 ) ) ( not ( = ?auto_207850 ?auto_207853 ) ) ( not ( = ?auto_207850 ?auto_207854 ) ) ( not ( = ?auto_207850 ?auto_207855 ) ) ( not ( = ?auto_207850 ?auto_207856 ) ) ( not ( = ?auto_207850 ?auto_207857 ) ) ( not ( = ?auto_207850 ?auto_207858 ) ) ( not ( = ?auto_207850 ?auto_207859 ) ) ( not ( = ?auto_207850 ?auto_207860 ) ) ( not ( = ?auto_207851 ?auto_207852 ) ) ( not ( = ?auto_207851 ?auto_207853 ) ) ( not ( = ?auto_207851 ?auto_207854 ) ) ( not ( = ?auto_207851 ?auto_207855 ) ) ( not ( = ?auto_207851 ?auto_207856 ) ) ( not ( = ?auto_207851 ?auto_207857 ) ) ( not ( = ?auto_207851 ?auto_207858 ) ) ( not ( = ?auto_207851 ?auto_207859 ) ) ( not ( = ?auto_207851 ?auto_207860 ) ) ( not ( = ?auto_207852 ?auto_207853 ) ) ( not ( = ?auto_207852 ?auto_207854 ) ) ( not ( = ?auto_207852 ?auto_207855 ) ) ( not ( = ?auto_207852 ?auto_207856 ) ) ( not ( = ?auto_207852 ?auto_207857 ) ) ( not ( = ?auto_207852 ?auto_207858 ) ) ( not ( = ?auto_207852 ?auto_207859 ) ) ( not ( = ?auto_207852 ?auto_207860 ) ) ( not ( = ?auto_207853 ?auto_207854 ) ) ( not ( = ?auto_207853 ?auto_207855 ) ) ( not ( = ?auto_207853 ?auto_207856 ) ) ( not ( = ?auto_207853 ?auto_207857 ) ) ( not ( = ?auto_207853 ?auto_207858 ) ) ( not ( = ?auto_207853 ?auto_207859 ) ) ( not ( = ?auto_207853 ?auto_207860 ) ) ( not ( = ?auto_207854 ?auto_207855 ) ) ( not ( = ?auto_207854 ?auto_207856 ) ) ( not ( = ?auto_207854 ?auto_207857 ) ) ( not ( = ?auto_207854 ?auto_207858 ) ) ( not ( = ?auto_207854 ?auto_207859 ) ) ( not ( = ?auto_207854 ?auto_207860 ) ) ( not ( = ?auto_207855 ?auto_207856 ) ) ( not ( = ?auto_207855 ?auto_207857 ) ) ( not ( = ?auto_207855 ?auto_207858 ) ) ( not ( = ?auto_207855 ?auto_207859 ) ) ( not ( = ?auto_207855 ?auto_207860 ) ) ( not ( = ?auto_207856 ?auto_207857 ) ) ( not ( = ?auto_207856 ?auto_207858 ) ) ( not ( = ?auto_207856 ?auto_207859 ) ) ( not ( = ?auto_207856 ?auto_207860 ) ) ( not ( = ?auto_207857 ?auto_207858 ) ) ( not ( = ?auto_207857 ?auto_207859 ) ) ( not ( = ?auto_207857 ?auto_207860 ) ) ( not ( = ?auto_207858 ?auto_207859 ) ) ( not ( = ?auto_207858 ?auto_207860 ) ) ( not ( = ?auto_207859 ?auto_207860 ) ) ( ON ?auto_207858 ?auto_207859 ) ( ON ?auto_207857 ?auto_207858 ) ( ON ?auto_207856 ?auto_207857 ) ( CLEAR ?auto_207854 ) ( ON ?auto_207855 ?auto_207856 ) ( CLEAR ?auto_207855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207848 ?auto_207849 ?auto_207850 ?auto_207851 ?auto_207852 ?auto_207853 ?auto_207854 ?auto_207855 )
      ( MAKE-12PILE ?auto_207848 ?auto_207849 ?auto_207850 ?auto_207851 ?auto_207852 ?auto_207853 ?auto_207854 ?auto_207855 ?auto_207856 ?auto_207857 ?auto_207858 ?auto_207859 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207873 - BLOCK
      ?auto_207874 - BLOCK
      ?auto_207875 - BLOCK
      ?auto_207876 - BLOCK
      ?auto_207877 - BLOCK
      ?auto_207878 - BLOCK
      ?auto_207879 - BLOCK
      ?auto_207880 - BLOCK
      ?auto_207881 - BLOCK
      ?auto_207882 - BLOCK
      ?auto_207883 - BLOCK
      ?auto_207884 - BLOCK
    )
    :vars
    (
      ?auto_207885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207884 ?auto_207885 ) ( ON-TABLE ?auto_207873 ) ( ON ?auto_207874 ?auto_207873 ) ( ON ?auto_207875 ?auto_207874 ) ( ON ?auto_207876 ?auto_207875 ) ( ON ?auto_207877 ?auto_207876 ) ( ON ?auto_207878 ?auto_207877 ) ( ON ?auto_207879 ?auto_207878 ) ( not ( = ?auto_207873 ?auto_207874 ) ) ( not ( = ?auto_207873 ?auto_207875 ) ) ( not ( = ?auto_207873 ?auto_207876 ) ) ( not ( = ?auto_207873 ?auto_207877 ) ) ( not ( = ?auto_207873 ?auto_207878 ) ) ( not ( = ?auto_207873 ?auto_207879 ) ) ( not ( = ?auto_207873 ?auto_207880 ) ) ( not ( = ?auto_207873 ?auto_207881 ) ) ( not ( = ?auto_207873 ?auto_207882 ) ) ( not ( = ?auto_207873 ?auto_207883 ) ) ( not ( = ?auto_207873 ?auto_207884 ) ) ( not ( = ?auto_207873 ?auto_207885 ) ) ( not ( = ?auto_207874 ?auto_207875 ) ) ( not ( = ?auto_207874 ?auto_207876 ) ) ( not ( = ?auto_207874 ?auto_207877 ) ) ( not ( = ?auto_207874 ?auto_207878 ) ) ( not ( = ?auto_207874 ?auto_207879 ) ) ( not ( = ?auto_207874 ?auto_207880 ) ) ( not ( = ?auto_207874 ?auto_207881 ) ) ( not ( = ?auto_207874 ?auto_207882 ) ) ( not ( = ?auto_207874 ?auto_207883 ) ) ( not ( = ?auto_207874 ?auto_207884 ) ) ( not ( = ?auto_207874 ?auto_207885 ) ) ( not ( = ?auto_207875 ?auto_207876 ) ) ( not ( = ?auto_207875 ?auto_207877 ) ) ( not ( = ?auto_207875 ?auto_207878 ) ) ( not ( = ?auto_207875 ?auto_207879 ) ) ( not ( = ?auto_207875 ?auto_207880 ) ) ( not ( = ?auto_207875 ?auto_207881 ) ) ( not ( = ?auto_207875 ?auto_207882 ) ) ( not ( = ?auto_207875 ?auto_207883 ) ) ( not ( = ?auto_207875 ?auto_207884 ) ) ( not ( = ?auto_207875 ?auto_207885 ) ) ( not ( = ?auto_207876 ?auto_207877 ) ) ( not ( = ?auto_207876 ?auto_207878 ) ) ( not ( = ?auto_207876 ?auto_207879 ) ) ( not ( = ?auto_207876 ?auto_207880 ) ) ( not ( = ?auto_207876 ?auto_207881 ) ) ( not ( = ?auto_207876 ?auto_207882 ) ) ( not ( = ?auto_207876 ?auto_207883 ) ) ( not ( = ?auto_207876 ?auto_207884 ) ) ( not ( = ?auto_207876 ?auto_207885 ) ) ( not ( = ?auto_207877 ?auto_207878 ) ) ( not ( = ?auto_207877 ?auto_207879 ) ) ( not ( = ?auto_207877 ?auto_207880 ) ) ( not ( = ?auto_207877 ?auto_207881 ) ) ( not ( = ?auto_207877 ?auto_207882 ) ) ( not ( = ?auto_207877 ?auto_207883 ) ) ( not ( = ?auto_207877 ?auto_207884 ) ) ( not ( = ?auto_207877 ?auto_207885 ) ) ( not ( = ?auto_207878 ?auto_207879 ) ) ( not ( = ?auto_207878 ?auto_207880 ) ) ( not ( = ?auto_207878 ?auto_207881 ) ) ( not ( = ?auto_207878 ?auto_207882 ) ) ( not ( = ?auto_207878 ?auto_207883 ) ) ( not ( = ?auto_207878 ?auto_207884 ) ) ( not ( = ?auto_207878 ?auto_207885 ) ) ( not ( = ?auto_207879 ?auto_207880 ) ) ( not ( = ?auto_207879 ?auto_207881 ) ) ( not ( = ?auto_207879 ?auto_207882 ) ) ( not ( = ?auto_207879 ?auto_207883 ) ) ( not ( = ?auto_207879 ?auto_207884 ) ) ( not ( = ?auto_207879 ?auto_207885 ) ) ( not ( = ?auto_207880 ?auto_207881 ) ) ( not ( = ?auto_207880 ?auto_207882 ) ) ( not ( = ?auto_207880 ?auto_207883 ) ) ( not ( = ?auto_207880 ?auto_207884 ) ) ( not ( = ?auto_207880 ?auto_207885 ) ) ( not ( = ?auto_207881 ?auto_207882 ) ) ( not ( = ?auto_207881 ?auto_207883 ) ) ( not ( = ?auto_207881 ?auto_207884 ) ) ( not ( = ?auto_207881 ?auto_207885 ) ) ( not ( = ?auto_207882 ?auto_207883 ) ) ( not ( = ?auto_207882 ?auto_207884 ) ) ( not ( = ?auto_207882 ?auto_207885 ) ) ( not ( = ?auto_207883 ?auto_207884 ) ) ( not ( = ?auto_207883 ?auto_207885 ) ) ( not ( = ?auto_207884 ?auto_207885 ) ) ( ON ?auto_207883 ?auto_207884 ) ( ON ?auto_207882 ?auto_207883 ) ( ON ?auto_207881 ?auto_207882 ) ( CLEAR ?auto_207879 ) ( ON ?auto_207880 ?auto_207881 ) ( CLEAR ?auto_207880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_207873 ?auto_207874 ?auto_207875 ?auto_207876 ?auto_207877 ?auto_207878 ?auto_207879 ?auto_207880 )
      ( MAKE-12PILE ?auto_207873 ?auto_207874 ?auto_207875 ?auto_207876 ?auto_207877 ?auto_207878 ?auto_207879 ?auto_207880 ?auto_207881 ?auto_207882 ?auto_207883 ?auto_207884 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207898 - BLOCK
      ?auto_207899 - BLOCK
      ?auto_207900 - BLOCK
      ?auto_207901 - BLOCK
      ?auto_207902 - BLOCK
      ?auto_207903 - BLOCK
      ?auto_207904 - BLOCK
      ?auto_207905 - BLOCK
      ?auto_207906 - BLOCK
      ?auto_207907 - BLOCK
      ?auto_207908 - BLOCK
      ?auto_207909 - BLOCK
    )
    :vars
    (
      ?auto_207910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207909 ?auto_207910 ) ( ON-TABLE ?auto_207898 ) ( ON ?auto_207899 ?auto_207898 ) ( ON ?auto_207900 ?auto_207899 ) ( ON ?auto_207901 ?auto_207900 ) ( ON ?auto_207902 ?auto_207901 ) ( ON ?auto_207903 ?auto_207902 ) ( not ( = ?auto_207898 ?auto_207899 ) ) ( not ( = ?auto_207898 ?auto_207900 ) ) ( not ( = ?auto_207898 ?auto_207901 ) ) ( not ( = ?auto_207898 ?auto_207902 ) ) ( not ( = ?auto_207898 ?auto_207903 ) ) ( not ( = ?auto_207898 ?auto_207904 ) ) ( not ( = ?auto_207898 ?auto_207905 ) ) ( not ( = ?auto_207898 ?auto_207906 ) ) ( not ( = ?auto_207898 ?auto_207907 ) ) ( not ( = ?auto_207898 ?auto_207908 ) ) ( not ( = ?auto_207898 ?auto_207909 ) ) ( not ( = ?auto_207898 ?auto_207910 ) ) ( not ( = ?auto_207899 ?auto_207900 ) ) ( not ( = ?auto_207899 ?auto_207901 ) ) ( not ( = ?auto_207899 ?auto_207902 ) ) ( not ( = ?auto_207899 ?auto_207903 ) ) ( not ( = ?auto_207899 ?auto_207904 ) ) ( not ( = ?auto_207899 ?auto_207905 ) ) ( not ( = ?auto_207899 ?auto_207906 ) ) ( not ( = ?auto_207899 ?auto_207907 ) ) ( not ( = ?auto_207899 ?auto_207908 ) ) ( not ( = ?auto_207899 ?auto_207909 ) ) ( not ( = ?auto_207899 ?auto_207910 ) ) ( not ( = ?auto_207900 ?auto_207901 ) ) ( not ( = ?auto_207900 ?auto_207902 ) ) ( not ( = ?auto_207900 ?auto_207903 ) ) ( not ( = ?auto_207900 ?auto_207904 ) ) ( not ( = ?auto_207900 ?auto_207905 ) ) ( not ( = ?auto_207900 ?auto_207906 ) ) ( not ( = ?auto_207900 ?auto_207907 ) ) ( not ( = ?auto_207900 ?auto_207908 ) ) ( not ( = ?auto_207900 ?auto_207909 ) ) ( not ( = ?auto_207900 ?auto_207910 ) ) ( not ( = ?auto_207901 ?auto_207902 ) ) ( not ( = ?auto_207901 ?auto_207903 ) ) ( not ( = ?auto_207901 ?auto_207904 ) ) ( not ( = ?auto_207901 ?auto_207905 ) ) ( not ( = ?auto_207901 ?auto_207906 ) ) ( not ( = ?auto_207901 ?auto_207907 ) ) ( not ( = ?auto_207901 ?auto_207908 ) ) ( not ( = ?auto_207901 ?auto_207909 ) ) ( not ( = ?auto_207901 ?auto_207910 ) ) ( not ( = ?auto_207902 ?auto_207903 ) ) ( not ( = ?auto_207902 ?auto_207904 ) ) ( not ( = ?auto_207902 ?auto_207905 ) ) ( not ( = ?auto_207902 ?auto_207906 ) ) ( not ( = ?auto_207902 ?auto_207907 ) ) ( not ( = ?auto_207902 ?auto_207908 ) ) ( not ( = ?auto_207902 ?auto_207909 ) ) ( not ( = ?auto_207902 ?auto_207910 ) ) ( not ( = ?auto_207903 ?auto_207904 ) ) ( not ( = ?auto_207903 ?auto_207905 ) ) ( not ( = ?auto_207903 ?auto_207906 ) ) ( not ( = ?auto_207903 ?auto_207907 ) ) ( not ( = ?auto_207903 ?auto_207908 ) ) ( not ( = ?auto_207903 ?auto_207909 ) ) ( not ( = ?auto_207903 ?auto_207910 ) ) ( not ( = ?auto_207904 ?auto_207905 ) ) ( not ( = ?auto_207904 ?auto_207906 ) ) ( not ( = ?auto_207904 ?auto_207907 ) ) ( not ( = ?auto_207904 ?auto_207908 ) ) ( not ( = ?auto_207904 ?auto_207909 ) ) ( not ( = ?auto_207904 ?auto_207910 ) ) ( not ( = ?auto_207905 ?auto_207906 ) ) ( not ( = ?auto_207905 ?auto_207907 ) ) ( not ( = ?auto_207905 ?auto_207908 ) ) ( not ( = ?auto_207905 ?auto_207909 ) ) ( not ( = ?auto_207905 ?auto_207910 ) ) ( not ( = ?auto_207906 ?auto_207907 ) ) ( not ( = ?auto_207906 ?auto_207908 ) ) ( not ( = ?auto_207906 ?auto_207909 ) ) ( not ( = ?auto_207906 ?auto_207910 ) ) ( not ( = ?auto_207907 ?auto_207908 ) ) ( not ( = ?auto_207907 ?auto_207909 ) ) ( not ( = ?auto_207907 ?auto_207910 ) ) ( not ( = ?auto_207908 ?auto_207909 ) ) ( not ( = ?auto_207908 ?auto_207910 ) ) ( not ( = ?auto_207909 ?auto_207910 ) ) ( ON ?auto_207908 ?auto_207909 ) ( ON ?auto_207907 ?auto_207908 ) ( ON ?auto_207906 ?auto_207907 ) ( ON ?auto_207905 ?auto_207906 ) ( CLEAR ?auto_207903 ) ( ON ?auto_207904 ?auto_207905 ) ( CLEAR ?auto_207904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207898 ?auto_207899 ?auto_207900 ?auto_207901 ?auto_207902 ?auto_207903 ?auto_207904 )
      ( MAKE-12PILE ?auto_207898 ?auto_207899 ?auto_207900 ?auto_207901 ?auto_207902 ?auto_207903 ?auto_207904 ?auto_207905 ?auto_207906 ?auto_207907 ?auto_207908 ?auto_207909 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207923 - BLOCK
      ?auto_207924 - BLOCK
      ?auto_207925 - BLOCK
      ?auto_207926 - BLOCK
      ?auto_207927 - BLOCK
      ?auto_207928 - BLOCK
      ?auto_207929 - BLOCK
      ?auto_207930 - BLOCK
      ?auto_207931 - BLOCK
      ?auto_207932 - BLOCK
      ?auto_207933 - BLOCK
      ?auto_207934 - BLOCK
    )
    :vars
    (
      ?auto_207935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207934 ?auto_207935 ) ( ON-TABLE ?auto_207923 ) ( ON ?auto_207924 ?auto_207923 ) ( ON ?auto_207925 ?auto_207924 ) ( ON ?auto_207926 ?auto_207925 ) ( ON ?auto_207927 ?auto_207926 ) ( ON ?auto_207928 ?auto_207927 ) ( not ( = ?auto_207923 ?auto_207924 ) ) ( not ( = ?auto_207923 ?auto_207925 ) ) ( not ( = ?auto_207923 ?auto_207926 ) ) ( not ( = ?auto_207923 ?auto_207927 ) ) ( not ( = ?auto_207923 ?auto_207928 ) ) ( not ( = ?auto_207923 ?auto_207929 ) ) ( not ( = ?auto_207923 ?auto_207930 ) ) ( not ( = ?auto_207923 ?auto_207931 ) ) ( not ( = ?auto_207923 ?auto_207932 ) ) ( not ( = ?auto_207923 ?auto_207933 ) ) ( not ( = ?auto_207923 ?auto_207934 ) ) ( not ( = ?auto_207923 ?auto_207935 ) ) ( not ( = ?auto_207924 ?auto_207925 ) ) ( not ( = ?auto_207924 ?auto_207926 ) ) ( not ( = ?auto_207924 ?auto_207927 ) ) ( not ( = ?auto_207924 ?auto_207928 ) ) ( not ( = ?auto_207924 ?auto_207929 ) ) ( not ( = ?auto_207924 ?auto_207930 ) ) ( not ( = ?auto_207924 ?auto_207931 ) ) ( not ( = ?auto_207924 ?auto_207932 ) ) ( not ( = ?auto_207924 ?auto_207933 ) ) ( not ( = ?auto_207924 ?auto_207934 ) ) ( not ( = ?auto_207924 ?auto_207935 ) ) ( not ( = ?auto_207925 ?auto_207926 ) ) ( not ( = ?auto_207925 ?auto_207927 ) ) ( not ( = ?auto_207925 ?auto_207928 ) ) ( not ( = ?auto_207925 ?auto_207929 ) ) ( not ( = ?auto_207925 ?auto_207930 ) ) ( not ( = ?auto_207925 ?auto_207931 ) ) ( not ( = ?auto_207925 ?auto_207932 ) ) ( not ( = ?auto_207925 ?auto_207933 ) ) ( not ( = ?auto_207925 ?auto_207934 ) ) ( not ( = ?auto_207925 ?auto_207935 ) ) ( not ( = ?auto_207926 ?auto_207927 ) ) ( not ( = ?auto_207926 ?auto_207928 ) ) ( not ( = ?auto_207926 ?auto_207929 ) ) ( not ( = ?auto_207926 ?auto_207930 ) ) ( not ( = ?auto_207926 ?auto_207931 ) ) ( not ( = ?auto_207926 ?auto_207932 ) ) ( not ( = ?auto_207926 ?auto_207933 ) ) ( not ( = ?auto_207926 ?auto_207934 ) ) ( not ( = ?auto_207926 ?auto_207935 ) ) ( not ( = ?auto_207927 ?auto_207928 ) ) ( not ( = ?auto_207927 ?auto_207929 ) ) ( not ( = ?auto_207927 ?auto_207930 ) ) ( not ( = ?auto_207927 ?auto_207931 ) ) ( not ( = ?auto_207927 ?auto_207932 ) ) ( not ( = ?auto_207927 ?auto_207933 ) ) ( not ( = ?auto_207927 ?auto_207934 ) ) ( not ( = ?auto_207927 ?auto_207935 ) ) ( not ( = ?auto_207928 ?auto_207929 ) ) ( not ( = ?auto_207928 ?auto_207930 ) ) ( not ( = ?auto_207928 ?auto_207931 ) ) ( not ( = ?auto_207928 ?auto_207932 ) ) ( not ( = ?auto_207928 ?auto_207933 ) ) ( not ( = ?auto_207928 ?auto_207934 ) ) ( not ( = ?auto_207928 ?auto_207935 ) ) ( not ( = ?auto_207929 ?auto_207930 ) ) ( not ( = ?auto_207929 ?auto_207931 ) ) ( not ( = ?auto_207929 ?auto_207932 ) ) ( not ( = ?auto_207929 ?auto_207933 ) ) ( not ( = ?auto_207929 ?auto_207934 ) ) ( not ( = ?auto_207929 ?auto_207935 ) ) ( not ( = ?auto_207930 ?auto_207931 ) ) ( not ( = ?auto_207930 ?auto_207932 ) ) ( not ( = ?auto_207930 ?auto_207933 ) ) ( not ( = ?auto_207930 ?auto_207934 ) ) ( not ( = ?auto_207930 ?auto_207935 ) ) ( not ( = ?auto_207931 ?auto_207932 ) ) ( not ( = ?auto_207931 ?auto_207933 ) ) ( not ( = ?auto_207931 ?auto_207934 ) ) ( not ( = ?auto_207931 ?auto_207935 ) ) ( not ( = ?auto_207932 ?auto_207933 ) ) ( not ( = ?auto_207932 ?auto_207934 ) ) ( not ( = ?auto_207932 ?auto_207935 ) ) ( not ( = ?auto_207933 ?auto_207934 ) ) ( not ( = ?auto_207933 ?auto_207935 ) ) ( not ( = ?auto_207934 ?auto_207935 ) ) ( ON ?auto_207933 ?auto_207934 ) ( ON ?auto_207932 ?auto_207933 ) ( ON ?auto_207931 ?auto_207932 ) ( ON ?auto_207930 ?auto_207931 ) ( CLEAR ?auto_207928 ) ( ON ?auto_207929 ?auto_207930 ) ( CLEAR ?auto_207929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_207923 ?auto_207924 ?auto_207925 ?auto_207926 ?auto_207927 ?auto_207928 ?auto_207929 )
      ( MAKE-12PILE ?auto_207923 ?auto_207924 ?auto_207925 ?auto_207926 ?auto_207927 ?auto_207928 ?auto_207929 ?auto_207930 ?auto_207931 ?auto_207932 ?auto_207933 ?auto_207934 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207948 - BLOCK
      ?auto_207949 - BLOCK
      ?auto_207950 - BLOCK
      ?auto_207951 - BLOCK
      ?auto_207952 - BLOCK
      ?auto_207953 - BLOCK
      ?auto_207954 - BLOCK
      ?auto_207955 - BLOCK
      ?auto_207956 - BLOCK
      ?auto_207957 - BLOCK
      ?auto_207958 - BLOCK
      ?auto_207959 - BLOCK
    )
    :vars
    (
      ?auto_207960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207959 ?auto_207960 ) ( ON-TABLE ?auto_207948 ) ( ON ?auto_207949 ?auto_207948 ) ( ON ?auto_207950 ?auto_207949 ) ( ON ?auto_207951 ?auto_207950 ) ( ON ?auto_207952 ?auto_207951 ) ( not ( = ?auto_207948 ?auto_207949 ) ) ( not ( = ?auto_207948 ?auto_207950 ) ) ( not ( = ?auto_207948 ?auto_207951 ) ) ( not ( = ?auto_207948 ?auto_207952 ) ) ( not ( = ?auto_207948 ?auto_207953 ) ) ( not ( = ?auto_207948 ?auto_207954 ) ) ( not ( = ?auto_207948 ?auto_207955 ) ) ( not ( = ?auto_207948 ?auto_207956 ) ) ( not ( = ?auto_207948 ?auto_207957 ) ) ( not ( = ?auto_207948 ?auto_207958 ) ) ( not ( = ?auto_207948 ?auto_207959 ) ) ( not ( = ?auto_207948 ?auto_207960 ) ) ( not ( = ?auto_207949 ?auto_207950 ) ) ( not ( = ?auto_207949 ?auto_207951 ) ) ( not ( = ?auto_207949 ?auto_207952 ) ) ( not ( = ?auto_207949 ?auto_207953 ) ) ( not ( = ?auto_207949 ?auto_207954 ) ) ( not ( = ?auto_207949 ?auto_207955 ) ) ( not ( = ?auto_207949 ?auto_207956 ) ) ( not ( = ?auto_207949 ?auto_207957 ) ) ( not ( = ?auto_207949 ?auto_207958 ) ) ( not ( = ?auto_207949 ?auto_207959 ) ) ( not ( = ?auto_207949 ?auto_207960 ) ) ( not ( = ?auto_207950 ?auto_207951 ) ) ( not ( = ?auto_207950 ?auto_207952 ) ) ( not ( = ?auto_207950 ?auto_207953 ) ) ( not ( = ?auto_207950 ?auto_207954 ) ) ( not ( = ?auto_207950 ?auto_207955 ) ) ( not ( = ?auto_207950 ?auto_207956 ) ) ( not ( = ?auto_207950 ?auto_207957 ) ) ( not ( = ?auto_207950 ?auto_207958 ) ) ( not ( = ?auto_207950 ?auto_207959 ) ) ( not ( = ?auto_207950 ?auto_207960 ) ) ( not ( = ?auto_207951 ?auto_207952 ) ) ( not ( = ?auto_207951 ?auto_207953 ) ) ( not ( = ?auto_207951 ?auto_207954 ) ) ( not ( = ?auto_207951 ?auto_207955 ) ) ( not ( = ?auto_207951 ?auto_207956 ) ) ( not ( = ?auto_207951 ?auto_207957 ) ) ( not ( = ?auto_207951 ?auto_207958 ) ) ( not ( = ?auto_207951 ?auto_207959 ) ) ( not ( = ?auto_207951 ?auto_207960 ) ) ( not ( = ?auto_207952 ?auto_207953 ) ) ( not ( = ?auto_207952 ?auto_207954 ) ) ( not ( = ?auto_207952 ?auto_207955 ) ) ( not ( = ?auto_207952 ?auto_207956 ) ) ( not ( = ?auto_207952 ?auto_207957 ) ) ( not ( = ?auto_207952 ?auto_207958 ) ) ( not ( = ?auto_207952 ?auto_207959 ) ) ( not ( = ?auto_207952 ?auto_207960 ) ) ( not ( = ?auto_207953 ?auto_207954 ) ) ( not ( = ?auto_207953 ?auto_207955 ) ) ( not ( = ?auto_207953 ?auto_207956 ) ) ( not ( = ?auto_207953 ?auto_207957 ) ) ( not ( = ?auto_207953 ?auto_207958 ) ) ( not ( = ?auto_207953 ?auto_207959 ) ) ( not ( = ?auto_207953 ?auto_207960 ) ) ( not ( = ?auto_207954 ?auto_207955 ) ) ( not ( = ?auto_207954 ?auto_207956 ) ) ( not ( = ?auto_207954 ?auto_207957 ) ) ( not ( = ?auto_207954 ?auto_207958 ) ) ( not ( = ?auto_207954 ?auto_207959 ) ) ( not ( = ?auto_207954 ?auto_207960 ) ) ( not ( = ?auto_207955 ?auto_207956 ) ) ( not ( = ?auto_207955 ?auto_207957 ) ) ( not ( = ?auto_207955 ?auto_207958 ) ) ( not ( = ?auto_207955 ?auto_207959 ) ) ( not ( = ?auto_207955 ?auto_207960 ) ) ( not ( = ?auto_207956 ?auto_207957 ) ) ( not ( = ?auto_207956 ?auto_207958 ) ) ( not ( = ?auto_207956 ?auto_207959 ) ) ( not ( = ?auto_207956 ?auto_207960 ) ) ( not ( = ?auto_207957 ?auto_207958 ) ) ( not ( = ?auto_207957 ?auto_207959 ) ) ( not ( = ?auto_207957 ?auto_207960 ) ) ( not ( = ?auto_207958 ?auto_207959 ) ) ( not ( = ?auto_207958 ?auto_207960 ) ) ( not ( = ?auto_207959 ?auto_207960 ) ) ( ON ?auto_207958 ?auto_207959 ) ( ON ?auto_207957 ?auto_207958 ) ( ON ?auto_207956 ?auto_207957 ) ( ON ?auto_207955 ?auto_207956 ) ( ON ?auto_207954 ?auto_207955 ) ( CLEAR ?auto_207952 ) ( ON ?auto_207953 ?auto_207954 ) ( CLEAR ?auto_207953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207948 ?auto_207949 ?auto_207950 ?auto_207951 ?auto_207952 ?auto_207953 )
      ( MAKE-12PILE ?auto_207948 ?auto_207949 ?auto_207950 ?auto_207951 ?auto_207952 ?auto_207953 ?auto_207954 ?auto_207955 ?auto_207956 ?auto_207957 ?auto_207958 ?auto_207959 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207973 - BLOCK
      ?auto_207974 - BLOCK
      ?auto_207975 - BLOCK
      ?auto_207976 - BLOCK
      ?auto_207977 - BLOCK
      ?auto_207978 - BLOCK
      ?auto_207979 - BLOCK
      ?auto_207980 - BLOCK
      ?auto_207981 - BLOCK
      ?auto_207982 - BLOCK
      ?auto_207983 - BLOCK
      ?auto_207984 - BLOCK
    )
    :vars
    (
      ?auto_207985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_207984 ?auto_207985 ) ( ON-TABLE ?auto_207973 ) ( ON ?auto_207974 ?auto_207973 ) ( ON ?auto_207975 ?auto_207974 ) ( ON ?auto_207976 ?auto_207975 ) ( ON ?auto_207977 ?auto_207976 ) ( not ( = ?auto_207973 ?auto_207974 ) ) ( not ( = ?auto_207973 ?auto_207975 ) ) ( not ( = ?auto_207973 ?auto_207976 ) ) ( not ( = ?auto_207973 ?auto_207977 ) ) ( not ( = ?auto_207973 ?auto_207978 ) ) ( not ( = ?auto_207973 ?auto_207979 ) ) ( not ( = ?auto_207973 ?auto_207980 ) ) ( not ( = ?auto_207973 ?auto_207981 ) ) ( not ( = ?auto_207973 ?auto_207982 ) ) ( not ( = ?auto_207973 ?auto_207983 ) ) ( not ( = ?auto_207973 ?auto_207984 ) ) ( not ( = ?auto_207973 ?auto_207985 ) ) ( not ( = ?auto_207974 ?auto_207975 ) ) ( not ( = ?auto_207974 ?auto_207976 ) ) ( not ( = ?auto_207974 ?auto_207977 ) ) ( not ( = ?auto_207974 ?auto_207978 ) ) ( not ( = ?auto_207974 ?auto_207979 ) ) ( not ( = ?auto_207974 ?auto_207980 ) ) ( not ( = ?auto_207974 ?auto_207981 ) ) ( not ( = ?auto_207974 ?auto_207982 ) ) ( not ( = ?auto_207974 ?auto_207983 ) ) ( not ( = ?auto_207974 ?auto_207984 ) ) ( not ( = ?auto_207974 ?auto_207985 ) ) ( not ( = ?auto_207975 ?auto_207976 ) ) ( not ( = ?auto_207975 ?auto_207977 ) ) ( not ( = ?auto_207975 ?auto_207978 ) ) ( not ( = ?auto_207975 ?auto_207979 ) ) ( not ( = ?auto_207975 ?auto_207980 ) ) ( not ( = ?auto_207975 ?auto_207981 ) ) ( not ( = ?auto_207975 ?auto_207982 ) ) ( not ( = ?auto_207975 ?auto_207983 ) ) ( not ( = ?auto_207975 ?auto_207984 ) ) ( not ( = ?auto_207975 ?auto_207985 ) ) ( not ( = ?auto_207976 ?auto_207977 ) ) ( not ( = ?auto_207976 ?auto_207978 ) ) ( not ( = ?auto_207976 ?auto_207979 ) ) ( not ( = ?auto_207976 ?auto_207980 ) ) ( not ( = ?auto_207976 ?auto_207981 ) ) ( not ( = ?auto_207976 ?auto_207982 ) ) ( not ( = ?auto_207976 ?auto_207983 ) ) ( not ( = ?auto_207976 ?auto_207984 ) ) ( not ( = ?auto_207976 ?auto_207985 ) ) ( not ( = ?auto_207977 ?auto_207978 ) ) ( not ( = ?auto_207977 ?auto_207979 ) ) ( not ( = ?auto_207977 ?auto_207980 ) ) ( not ( = ?auto_207977 ?auto_207981 ) ) ( not ( = ?auto_207977 ?auto_207982 ) ) ( not ( = ?auto_207977 ?auto_207983 ) ) ( not ( = ?auto_207977 ?auto_207984 ) ) ( not ( = ?auto_207977 ?auto_207985 ) ) ( not ( = ?auto_207978 ?auto_207979 ) ) ( not ( = ?auto_207978 ?auto_207980 ) ) ( not ( = ?auto_207978 ?auto_207981 ) ) ( not ( = ?auto_207978 ?auto_207982 ) ) ( not ( = ?auto_207978 ?auto_207983 ) ) ( not ( = ?auto_207978 ?auto_207984 ) ) ( not ( = ?auto_207978 ?auto_207985 ) ) ( not ( = ?auto_207979 ?auto_207980 ) ) ( not ( = ?auto_207979 ?auto_207981 ) ) ( not ( = ?auto_207979 ?auto_207982 ) ) ( not ( = ?auto_207979 ?auto_207983 ) ) ( not ( = ?auto_207979 ?auto_207984 ) ) ( not ( = ?auto_207979 ?auto_207985 ) ) ( not ( = ?auto_207980 ?auto_207981 ) ) ( not ( = ?auto_207980 ?auto_207982 ) ) ( not ( = ?auto_207980 ?auto_207983 ) ) ( not ( = ?auto_207980 ?auto_207984 ) ) ( not ( = ?auto_207980 ?auto_207985 ) ) ( not ( = ?auto_207981 ?auto_207982 ) ) ( not ( = ?auto_207981 ?auto_207983 ) ) ( not ( = ?auto_207981 ?auto_207984 ) ) ( not ( = ?auto_207981 ?auto_207985 ) ) ( not ( = ?auto_207982 ?auto_207983 ) ) ( not ( = ?auto_207982 ?auto_207984 ) ) ( not ( = ?auto_207982 ?auto_207985 ) ) ( not ( = ?auto_207983 ?auto_207984 ) ) ( not ( = ?auto_207983 ?auto_207985 ) ) ( not ( = ?auto_207984 ?auto_207985 ) ) ( ON ?auto_207983 ?auto_207984 ) ( ON ?auto_207982 ?auto_207983 ) ( ON ?auto_207981 ?auto_207982 ) ( ON ?auto_207980 ?auto_207981 ) ( ON ?auto_207979 ?auto_207980 ) ( CLEAR ?auto_207977 ) ( ON ?auto_207978 ?auto_207979 ) ( CLEAR ?auto_207978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_207973 ?auto_207974 ?auto_207975 ?auto_207976 ?auto_207977 ?auto_207978 )
      ( MAKE-12PILE ?auto_207973 ?auto_207974 ?auto_207975 ?auto_207976 ?auto_207977 ?auto_207978 ?auto_207979 ?auto_207980 ?auto_207981 ?auto_207982 ?auto_207983 ?auto_207984 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_207998 - BLOCK
      ?auto_207999 - BLOCK
      ?auto_208000 - BLOCK
      ?auto_208001 - BLOCK
      ?auto_208002 - BLOCK
      ?auto_208003 - BLOCK
      ?auto_208004 - BLOCK
      ?auto_208005 - BLOCK
      ?auto_208006 - BLOCK
      ?auto_208007 - BLOCK
      ?auto_208008 - BLOCK
      ?auto_208009 - BLOCK
    )
    :vars
    (
      ?auto_208010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208009 ?auto_208010 ) ( ON-TABLE ?auto_207998 ) ( ON ?auto_207999 ?auto_207998 ) ( ON ?auto_208000 ?auto_207999 ) ( ON ?auto_208001 ?auto_208000 ) ( not ( = ?auto_207998 ?auto_207999 ) ) ( not ( = ?auto_207998 ?auto_208000 ) ) ( not ( = ?auto_207998 ?auto_208001 ) ) ( not ( = ?auto_207998 ?auto_208002 ) ) ( not ( = ?auto_207998 ?auto_208003 ) ) ( not ( = ?auto_207998 ?auto_208004 ) ) ( not ( = ?auto_207998 ?auto_208005 ) ) ( not ( = ?auto_207998 ?auto_208006 ) ) ( not ( = ?auto_207998 ?auto_208007 ) ) ( not ( = ?auto_207998 ?auto_208008 ) ) ( not ( = ?auto_207998 ?auto_208009 ) ) ( not ( = ?auto_207998 ?auto_208010 ) ) ( not ( = ?auto_207999 ?auto_208000 ) ) ( not ( = ?auto_207999 ?auto_208001 ) ) ( not ( = ?auto_207999 ?auto_208002 ) ) ( not ( = ?auto_207999 ?auto_208003 ) ) ( not ( = ?auto_207999 ?auto_208004 ) ) ( not ( = ?auto_207999 ?auto_208005 ) ) ( not ( = ?auto_207999 ?auto_208006 ) ) ( not ( = ?auto_207999 ?auto_208007 ) ) ( not ( = ?auto_207999 ?auto_208008 ) ) ( not ( = ?auto_207999 ?auto_208009 ) ) ( not ( = ?auto_207999 ?auto_208010 ) ) ( not ( = ?auto_208000 ?auto_208001 ) ) ( not ( = ?auto_208000 ?auto_208002 ) ) ( not ( = ?auto_208000 ?auto_208003 ) ) ( not ( = ?auto_208000 ?auto_208004 ) ) ( not ( = ?auto_208000 ?auto_208005 ) ) ( not ( = ?auto_208000 ?auto_208006 ) ) ( not ( = ?auto_208000 ?auto_208007 ) ) ( not ( = ?auto_208000 ?auto_208008 ) ) ( not ( = ?auto_208000 ?auto_208009 ) ) ( not ( = ?auto_208000 ?auto_208010 ) ) ( not ( = ?auto_208001 ?auto_208002 ) ) ( not ( = ?auto_208001 ?auto_208003 ) ) ( not ( = ?auto_208001 ?auto_208004 ) ) ( not ( = ?auto_208001 ?auto_208005 ) ) ( not ( = ?auto_208001 ?auto_208006 ) ) ( not ( = ?auto_208001 ?auto_208007 ) ) ( not ( = ?auto_208001 ?auto_208008 ) ) ( not ( = ?auto_208001 ?auto_208009 ) ) ( not ( = ?auto_208001 ?auto_208010 ) ) ( not ( = ?auto_208002 ?auto_208003 ) ) ( not ( = ?auto_208002 ?auto_208004 ) ) ( not ( = ?auto_208002 ?auto_208005 ) ) ( not ( = ?auto_208002 ?auto_208006 ) ) ( not ( = ?auto_208002 ?auto_208007 ) ) ( not ( = ?auto_208002 ?auto_208008 ) ) ( not ( = ?auto_208002 ?auto_208009 ) ) ( not ( = ?auto_208002 ?auto_208010 ) ) ( not ( = ?auto_208003 ?auto_208004 ) ) ( not ( = ?auto_208003 ?auto_208005 ) ) ( not ( = ?auto_208003 ?auto_208006 ) ) ( not ( = ?auto_208003 ?auto_208007 ) ) ( not ( = ?auto_208003 ?auto_208008 ) ) ( not ( = ?auto_208003 ?auto_208009 ) ) ( not ( = ?auto_208003 ?auto_208010 ) ) ( not ( = ?auto_208004 ?auto_208005 ) ) ( not ( = ?auto_208004 ?auto_208006 ) ) ( not ( = ?auto_208004 ?auto_208007 ) ) ( not ( = ?auto_208004 ?auto_208008 ) ) ( not ( = ?auto_208004 ?auto_208009 ) ) ( not ( = ?auto_208004 ?auto_208010 ) ) ( not ( = ?auto_208005 ?auto_208006 ) ) ( not ( = ?auto_208005 ?auto_208007 ) ) ( not ( = ?auto_208005 ?auto_208008 ) ) ( not ( = ?auto_208005 ?auto_208009 ) ) ( not ( = ?auto_208005 ?auto_208010 ) ) ( not ( = ?auto_208006 ?auto_208007 ) ) ( not ( = ?auto_208006 ?auto_208008 ) ) ( not ( = ?auto_208006 ?auto_208009 ) ) ( not ( = ?auto_208006 ?auto_208010 ) ) ( not ( = ?auto_208007 ?auto_208008 ) ) ( not ( = ?auto_208007 ?auto_208009 ) ) ( not ( = ?auto_208007 ?auto_208010 ) ) ( not ( = ?auto_208008 ?auto_208009 ) ) ( not ( = ?auto_208008 ?auto_208010 ) ) ( not ( = ?auto_208009 ?auto_208010 ) ) ( ON ?auto_208008 ?auto_208009 ) ( ON ?auto_208007 ?auto_208008 ) ( ON ?auto_208006 ?auto_208007 ) ( ON ?auto_208005 ?auto_208006 ) ( ON ?auto_208004 ?auto_208005 ) ( ON ?auto_208003 ?auto_208004 ) ( CLEAR ?auto_208001 ) ( ON ?auto_208002 ?auto_208003 ) ( CLEAR ?auto_208002 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_207998 ?auto_207999 ?auto_208000 ?auto_208001 ?auto_208002 )
      ( MAKE-12PILE ?auto_207998 ?auto_207999 ?auto_208000 ?auto_208001 ?auto_208002 ?auto_208003 ?auto_208004 ?auto_208005 ?auto_208006 ?auto_208007 ?auto_208008 ?auto_208009 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208023 - BLOCK
      ?auto_208024 - BLOCK
      ?auto_208025 - BLOCK
      ?auto_208026 - BLOCK
      ?auto_208027 - BLOCK
      ?auto_208028 - BLOCK
      ?auto_208029 - BLOCK
      ?auto_208030 - BLOCK
      ?auto_208031 - BLOCK
      ?auto_208032 - BLOCK
      ?auto_208033 - BLOCK
      ?auto_208034 - BLOCK
    )
    :vars
    (
      ?auto_208035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208034 ?auto_208035 ) ( ON-TABLE ?auto_208023 ) ( ON ?auto_208024 ?auto_208023 ) ( ON ?auto_208025 ?auto_208024 ) ( ON ?auto_208026 ?auto_208025 ) ( not ( = ?auto_208023 ?auto_208024 ) ) ( not ( = ?auto_208023 ?auto_208025 ) ) ( not ( = ?auto_208023 ?auto_208026 ) ) ( not ( = ?auto_208023 ?auto_208027 ) ) ( not ( = ?auto_208023 ?auto_208028 ) ) ( not ( = ?auto_208023 ?auto_208029 ) ) ( not ( = ?auto_208023 ?auto_208030 ) ) ( not ( = ?auto_208023 ?auto_208031 ) ) ( not ( = ?auto_208023 ?auto_208032 ) ) ( not ( = ?auto_208023 ?auto_208033 ) ) ( not ( = ?auto_208023 ?auto_208034 ) ) ( not ( = ?auto_208023 ?auto_208035 ) ) ( not ( = ?auto_208024 ?auto_208025 ) ) ( not ( = ?auto_208024 ?auto_208026 ) ) ( not ( = ?auto_208024 ?auto_208027 ) ) ( not ( = ?auto_208024 ?auto_208028 ) ) ( not ( = ?auto_208024 ?auto_208029 ) ) ( not ( = ?auto_208024 ?auto_208030 ) ) ( not ( = ?auto_208024 ?auto_208031 ) ) ( not ( = ?auto_208024 ?auto_208032 ) ) ( not ( = ?auto_208024 ?auto_208033 ) ) ( not ( = ?auto_208024 ?auto_208034 ) ) ( not ( = ?auto_208024 ?auto_208035 ) ) ( not ( = ?auto_208025 ?auto_208026 ) ) ( not ( = ?auto_208025 ?auto_208027 ) ) ( not ( = ?auto_208025 ?auto_208028 ) ) ( not ( = ?auto_208025 ?auto_208029 ) ) ( not ( = ?auto_208025 ?auto_208030 ) ) ( not ( = ?auto_208025 ?auto_208031 ) ) ( not ( = ?auto_208025 ?auto_208032 ) ) ( not ( = ?auto_208025 ?auto_208033 ) ) ( not ( = ?auto_208025 ?auto_208034 ) ) ( not ( = ?auto_208025 ?auto_208035 ) ) ( not ( = ?auto_208026 ?auto_208027 ) ) ( not ( = ?auto_208026 ?auto_208028 ) ) ( not ( = ?auto_208026 ?auto_208029 ) ) ( not ( = ?auto_208026 ?auto_208030 ) ) ( not ( = ?auto_208026 ?auto_208031 ) ) ( not ( = ?auto_208026 ?auto_208032 ) ) ( not ( = ?auto_208026 ?auto_208033 ) ) ( not ( = ?auto_208026 ?auto_208034 ) ) ( not ( = ?auto_208026 ?auto_208035 ) ) ( not ( = ?auto_208027 ?auto_208028 ) ) ( not ( = ?auto_208027 ?auto_208029 ) ) ( not ( = ?auto_208027 ?auto_208030 ) ) ( not ( = ?auto_208027 ?auto_208031 ) ) ( not ( = ?auto_208027 ?auto_208032 ) ) ( not ( = ?auto_208027 ?auto_208033 ) ) ( not ( = ?auto_208027 ?auto_208034 ) ) ( not ( = ?auto_208027 ?auto_208035 ) ) ( not ( = ?auto_208028 ?auto_208029 ) ) ( not ( = ?auto_208028 ?auto_208030 ) ) ( not ( = ?auto_208028 ?auto_208031 ) ) ( not ( = ?auto_208028 ?auto_208032 ) ) ( not ( = ?auto_208028 ?auto_208033 ) ) ( not ( = ?auto_208028 ?auto_208034 ) ) ( not ( = ?auto_208028 ?auto_208035 ) ) ( not ( = ?auto_208029 ?auto_208030 ) ) ( not ( = ?auto_208029 ?auto_208031 ) ) ( not ( = ?auto_208029 ?auto_208032 ) ) ( not ( = ?auto_208029 ?auto_208033 ) ) ( not ( = ?auto_208029 ?auto_208034 ) ) ( not ( = ?auto_208029 ?auto_208035 ) ) ( not ( = ?auto_208030 ?auto_208031 ) ) ( not ( = ?auto_208030 ?auto_208032 ) ) ( not ( = ?auto_208030 ?auto_208033 ) ) ( not ( = ?auto_208030 ?auto_208034 ) ) ( not ( = ?auto_208030 ?auto_208035 ) ) ( not ( = ?auto_208031 ?auto_208032 ) ) ( not ( = ?auto_208031 ?auto_208033 ) ) ( not ( = ?auto_208031 ?auto_208034 ) ) ( not ( = ?auto_208031 ?auto_208035 ) ) ( not ( = ?auto_208032 ?auto_208033 ) ) ( not ( = ?auto_208032 ?auto_208034 ) ) ( not ( = ?auto_208032 ?auto_208035 ) ) ( not ( = ?auto_208033 ?auto_208034 ) ) ( not ( = ?auto_208033 ?auto_208035 ) ) ( not ( = ?auto_208034 ?auto_208035 ) ) ( ON ?auto_208033 ?auto_208034 ) ( ON ?auto_208032 ?auto_208033 ) ( ON ?auto_208031 ?auto_208032 ) ( ON ?auto_208030 ?auto_208031 ) ( ON ?auto_208029 ?auto_208030 ) ( ON ?auto_208028 ?auto_208029 ) ( CLEAR ?auto_208026 ) ( ON ?auto_208027 ?auto_208028 ) ( CLEAR ?auto_208027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208023 ?auto_208024 ?auto_208025 ?auto_208026 ?auto_208027 )
      ( MAKE-12PILE ?auto_208023 ?auto_208024 ?auto_208025 ?auto_208026 ?auto_208027 ?auto_208028 ?auto_208029 ?auto_208030 ?auto_208031 ?auto_208032 ?auto_208033 ?auto_208034 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208048 - BLOCK
      ?auto_208049 - BLOCK
      ?auto_208050 - BLOCK
      ?auto_208051 - BLOCK
      ?auto_208052 - BLOCK
      ?auto_208053 - BLOCK
      ?auto_208054 - BLOCK
      ?auto_208055 - BLOCK
      ?auto_208056 - BLOCK
      ?auto_208057 - BLOCK
      ?auto_208058 - BLOCK
      ?auto_208059 - BLOCK
    )
    :vars
    (
      ?auto_208060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208059 ?auto_208060 ) ( ON-TABLE ?auto_208048 ) ( ON ?auto_208049 ?auto_208048 ) ( ON ?auto_208050 ?auto_208049 ) ( not ( = ?auto_208048 ?auto_208049 ) ) ( not ( = ?auto_208048 ?auto_208050 ) ) ( not ( = ?auto_208048 ?auto_208051 ) ) ( not ( = ?auto_208048 ?auto_208052 ) ) ( not ( = ?auto_208048 ?auto_208053 ) ) ( not ( = ?auto_208048 ?auto_208054 ) ) ( not ( = ?auto_208048 ?auto_208055 ) ) ( not ( = ?auto_208048 ?auto_208056 ) ) ( not ( = ?auto_208048 ?auto_208057 ) ) ( not ( = ?auto_208048 ?auto_208058 ) ) ( not ( = ?auto_208048 ?auto_208059 ) ) ( not ( = ?auto_208048 ?auto_208060 ) ) ( not ( = ?auto_208049 ?auto_208050 ) ) ( not ( = ?auto_208049 ?auto_208051 ) ) ( not ( = ?auto_208049 ?auto_208052 ) ) ( not ( = ?auto_208049 ?auto_208053 ) ) ( not ( = ?auto_208049 ?auto_208054 ) ) ( not ( = ?auto_208049 ?auto_208055 ) ) ( not ( = ?auto_208049 ?auto_208056 ) ) ( not ( = ?auto_208049 ?auto_208057 ) ) ( not ( = ?auto_208049 ?auto_208058 ) ) ( not ( = ?auto_208049 ?auto_208059 ) ) ( not ( = ?auto_208049 ?auto_208060 ) ) ( not ( = ?auto_208050 ?auto_208051 ) ) ( not ( = ?auto_208050 ?auto_208052 ) ) ( not ( = ?auto_208050 ?auto_208053 ) ) ( not ( = ?auto_208050 ?auto_208054 ) ) ( not ( = ?auto_208050 ?auto_208055 ) ) ( not ( = ?auto_208050 ?auto_208056 ) ) ( not ( = ?auto_208050 ?auto_208057 ) ) ( not ( = ?auto_208050 ?auto_208058 ) ) ( not ( = ?auto_208050 ?auto_208059 ) ) ( not ( = ?auto_208050 ?auto_208060 ) ) ( not ( = ?auto_208051 ?auto_208052 ) ) ( not ( = ?auto_208051 ?auto_208053 ) ) ( not ( = ?auto_208051 ?auto_208054 ) ) ( not ( = ?auto_208051 ?auto_208055 ) ) ( not ( = ?auto_208051 ?auto_208056 ) ) ( not ( = ?auto_208051 ?auto_208057 ) ) ( not ( = ?auto_208051 ?auto_208058 ) ) ( not ( = ?auto_208051 ?auto_208059 ) ) ( not ( = ?auto_208051 ?auto_208060 ) ) ( not ( = ?auto_208052 ?auto_208053 ) ) ( not ( = ?auto_208052 ?auto_208054 ) ) ( not ( = ?auto_208052 ?auto_208055 ) ) ( not ( = ?auto_208052 ?auto_208056 ) ) ( not ( = ?auto_208052 ?auto_208057 ) ) ( not ( = ?auto_208052 ?auto_208058 ) ) ( not ( = ?auto_208052 ?auto_208059 ) ) ( not ( = ?auto_208052 ?auto_208060 ) ) ( not ( = ?auto_208053 ?auto_208054 ) ) ( not ( = ?auto_208053 ?auto_208055 ) ) ( not ( = ?auto_208053 ?auto_208056 ) ) ( not ( = ?auto_208053 ?auto_208057 ) ) ( not ( = ?auto_208053 ?auto_208058 ) ) ( not ( = ?auto_208053 ?auto_208059 ) ) ( not ( = ?auto_208053 ?auto_208060 ) ) ( not ( = ?auto_208054 ?auto_208055 ) ) ( not ( = ?auto_208054 ?auto_208056 ) ) ( not ( = ?auto_208054 ?auto_208057 ) ) ( not ( = ?auto_208054 ?auto_208058 ) ) ( not ( = ?auto_208054 ?auto_208059 ) ) ( not ( = ?auto_208054 ?auto_208060 ) ) ( not ( = ?auto_208055 ?auto_208056 ) ) ( not ( = ?auto_208055 ?auto_208057 ) ) ( not ( = ?auto_208055 ?auto_208058 ) ) ( not ( = ?auto_208055 ?auto_208059 ) ) ( not ( = ?auto_208055 ?auto_208060 ) ) ( not ( = ?auto_208056 ?auto_208057 ) ) ( not ( = ?auto_208056 ?auto_208058 ) ) ( not ( = ?auto_208056 ?auto_208059 ) ) ( not ( = ?auto_208056 ?auto_208060 ) ) ( not ( = ?auto_208057 ?auto_208058 ) ) ( not ( = ?auto_208057 ?auto_208059 ) ) ( not ( = ?auto_208057 ?auto_208060 ) ) ( not ( = ?auto_208058 ?auto_208059 ) ) ( not ( = ?auto_208058 ?auto_208060 ) ) ( not ( = ?auto_208059 ?auto_208060 ) ) ( ON ?auto_208058 ?auto_208059 ) ( ON ?auto_208057 ?auto_208058 ) ( ON ?auto_208056 ?auto_208057 ) ( ON ?auto_208055 ?auto_208056 ) ( ON ?auto_208054 ?auto_208055 ) ( ON ?auto_208053 ?auto_208054 ) ( ON ?auto_208052 ?auto_208053 ) ( CLEAR ?auto_208050 ) ( ON ?auto_208051 ?auto_208052 ) ( CLEAR ?auto_208051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208048 ?auto_208049 ?auto_208050 ?auto_208051 )
      ( MAKE-12PILE ?auto_208048 ?auto_208049 ?auto_208050 ?auto_208051 ?auto_208052 ?auto_208053 ?auto_208054 ?auto_208055 ?auto_208056 ?auto_208057 ?auto_208058 ?auto_208059 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208073 - BLOCK
      ?auto_208074 - BLOCK
      ?auto_208075 - BLOCK
      ?auto_208076 - BLOCK
      ?auto_208077 - BLOCK
      ?auto_208078 - BLOCK
      ?auto_208079 - BLOCK
      ?auto_208080 - BLOCK
      ?auto_208081 - BLOCK
      ?auto_208082 - BLOCK
      ?auto_208083 - BLOCK
      ?auto_208084 - BLOCK
    )
    :vars
    (
      ?auto_208085 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208084 ?auto_208085 ) ( ON-TABLE ?auto_208073 ) ( ON ?auto_208074 ?auto_208073 ) ( ON ?auto_208075 ?auto_208074 ) ( not ( = ?auto_208073 ?auto_208074 ) ) ( not ( = ?auto_208073 ?auto_208075 ) ) ( not ( = ?auto_208073 ?auto_208076 ) ) ( not ( = ?auto_208073 ?auto_208077 ) ) ( not ( = ?auto_208073 ?auto_208078 ) ) ( not ( = ?auto_208073 ?auto_208079 ) ) ( not ( = ?auto_208073 ?auto_208080 ) ) ( not ( = ?auto_208073 ?auto_208081 ) ) ( not ( = ?auto_208073 ?auto_208082 ) ) ( not ( = ?auto_208073 ?auto_208083 ) ) ( not ( = ?auto_208073 ?auto_208084 ) ) ( not ( = ?auto_208073 ?auto_208085 ) ) ( not ( = ?auto_208074 ?auto_208075 ) ) ( not ( = ?auto_208074 ?auto_208076 ) ) ( not ( = ?auto_208074 ?auto_208077 ) ) ( not ( = ?auto_208074 ?auto_208078 ) ) ( not ( = ?auto_208074 ?auto_208079 ) ) ( not ( = ?auto_208074 ?auto_208080 ) ) ( not ( = ?auto_208074 ?auto_208081 ) ) ( not ( = ?auto_208074 ?auto_208082 ) ) ( not ( = ?auto_208074 ?auto_208083 ) ) ( not ( = ?auto_208074 ?auto_208084 ) ) ( not ( = ?auto_208074 ?auto_208085 ) ) ( not ( = ?auto_208075 ?auto_208076 ) ) ( not ( = ?auto_208075 ?auto_208077 ) ) ( not ( = ?auto_208075 ?auto_208078 ) ) ( not ( = ?auto_208075 ?auto_208079 ) ) ( not ( = ?auto_208075 ?auto_208080 ) ) ( not ( = ?auto_208075 ?auto_208081 ) ) ( not ( = ?auto_208075 ?auto_208082 ) ) ( not ( = ?auto_208075 ?auto_208083 ) ) ( not ( = ?auto_208075 ?auto_208084 ) ) ( not ( = ?auto_208075 ?auto_208085 ) ) ( not ( = ?auto_208076 ?auto_208077 ) ) ( not ( = ?auto_208076 ?auto_208078 ) ) ( not ( = ?auto_208076 ?auto_208079 ) ) ( not ( = ?auto_208076 ?auto_208080 ) ) ( not ( = ?auto_208076 ?auto_208081 ) ) ( not ( = ?auto_208076 ?auto_208082 ) ) ( not ( = ?auto_208076 ?auto_208083 ) ) ( not ( = ?auto_208076 ?auto_208084 ) ) ( not ( = ?auto_208076 ?auto_208085 ) ) ( not ( = ?auto_208077 ?auto_208078 ) ) ( not ( = ?auto_208077 ?auto_208079 ) ) ( not ( = ?auto_208077 ?auto_208080 ) ) ( not ( = ?auto_208077 ?auto_208081 ) ) ( not ( = ?auto_208077 ?auto_208082 ) ) ( not ( = ?auto_208077 ?auto_208083 ) ) ( not ( = ?auto_208077 ?auto_208084 ) ) ( not ( = ?auto_208077 ?auto_208085 ) ) ( not ( = ?auto_208078 ?auto_208079 ) ) ( not ( = ?auto_208078 ?auto_208080 ) ) ( not ( = ?auto_208078 ?auto_208081 ) ) ( not ( = ?auto_208078 ?auto_208082 ) ) ( not ( = ?auto_208078 ?auto_208083 ) ) ( not ( = ?auto_208078 ?auto_208084 ) ) ( not ( = ?auto_208078 ?auto_208085 ) ) ( not ( = ?auto_208079 ?auto_208080 ) ) ( not ( = ?auto_208079 ?auto_208081 ) ) ( not ( = ?auto_208079 ?auto_208082 ) ) ( not ( = ?auto_208079 ?auto_208083 ) ) ( not ( = ?auto_208079 ?auto_208084 ) ) ( not ( = ?auto_208079 ?auto_208085 ) ) ( not ( = ?auto_208080 ?auto_208081 ) ) ( not ( = ?auto_208080 ?auto_208082 ) ) ( not ( = ?auto_208080 ?auto_208083 ) ) ( not ( = ?auto_208080 ?auto_208084 ) ) ( not ( = ?auto_208080 ?auto_208085 ) ) ( not ( = ?auto_208081 ?auto_208082 ) ) ( not ( = ?auto_208081 ?auto_208083 ) ) ( not ( = ?auto_208081 ?auto_208084 ) ) ( not ( = ?auto_208081 ?auto_208085 ) ) ( not ( = ?auto_208082 ?auto_208083 ) ) ( not ( = ?auto_208082 ?auto_208084 ) ) ( not ( = ?auto_208082 ?auto_208085 ) ) ( not ( = ?auto_208083 ?auto_208084 ) ) ( not ( = ?auto_208083 ?auto_208085 ) ) ( not ( = ?auto_208084 ?auto_208085 ) ) ( ON ?auto_208083 ?auto_208084 ) ( ON ?auto_208082 ?auto_208083 ) ( ON ?auto_208081 ?auto_208082 ) ( ON ?auto_208080 ?auto_208081 ) ( ON ?auto_208079 ?auto_208080 ) ( ON ?auto_208078 ?auto_208079 ) ( ON ?auto_208077 ?auto_208078 ) ( CLEAR ?auto_208075 ) ( ON ?auto_208076 ?auto_208077 ) ( CLEAR ?auto_208076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208073 ?auto_208074 ?auto_208075 ?auto_208076 )
      ( MAKE-12PILE ?auto_208073 ?auto_208074 ?auto_208075 ?auto_208076 ?auto_208077 ?auto_208078 ?auto_208079 ?auto_208080 ?auto_208081 ?auto_208082 ?auto_208083 ?auto_208084 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208098 - BLOCK
      ?auto_208099 - BLOCK
      ?auto_208100 - BLOCK
      ?auto_208101 - BLOCK
      ?auto_208102 - BLOCK
      ?auto_208103 - BLOCK
      ?auto_208104 - BLOCK
      ?auto_208105 - BLOCK
      ?auto_208106 - BLOCK
      ?auto_208107 - BLOCK
      ?auto_208108 - BLOCK
      ?auto_208109 - BLOCK
    )
    :vars
    (
      ?auto_208110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208109 ?auto_208110 ) ( ON-TABLE ?auto_208098 ) ( ON ?auto_208099 ?auto_208098 ) ( not ( = ?auto_208098 ?auto_208099 ) ) ( not ( = ?auto_208098 ?auto_208100 ) ) ( not ( = ?auto_208098 ?auto_208101 ) ) ( not ( = ?auto_208098 ?auto_208102 ) ) ( not ( = ?auto_208098 ?auto_208103 ) ) ( not ( = ?auto_208098 ?auto_208104 ) ) ( not ( = ?auto_208098 ?auto_208105 ) ) ( not ( = ?auto_208098 ?auto_208106 ) ) ( not ( = ?auto_208098 ?auto_208107 ) ) ( not ( = ?auto_208098 ?auto_208108 ) ) ( not ( = ?auto_208098 ?auto_208109 ) ) ( not ( = ?auto_208098 ?auto_208110 ) ) ( not ( = ?auto_208099 ?auto_208100 ) ) ( not ( = ?auto_208099 ?auto_208101 ) ) ( not ( = ?auto_208099 ?auto_208102 ) ) ( not ( = ?auto_208099 ?auto_208103 ) ) ( not ( = ?auto_208099 ?auto_208104 ) ) ( not ( = ?auto_208099 ?auto_208105 ) ) ( not ( = ?auto_208099 ?auto_208106 ) ) ( not ( = ?auto_208099 ?auto_208107 ) ) ( not ( = ?auto_208099 ?auto_208108 ) ) ( not ( = ?auto_208099 ?auto_208109 ) ) ( not ( = ?auto_208099 ?auto_208110 ) ) ( not ( = ?auto_208100 ?auto_208101 ) ) ( not ( = ?auto_208100 ?auto_208102 ) ) ( not ( = ?auto_208100 ?auto_208103 ) ) ( not ( = ?auto_208100 ?auto_208104 ) ) ( not ( = ?auto_208100 ?auto_208105 ) ) ( not ( = ?auto_208100 ?auto_208106 ) ) ( not ( = ?auto_208100 ?auto_208107 ) ) ( not ( = ?auto_208100 ?auto_208108 ) ) ( not ( = ?auto_208100 ?auto_208109 ) ) ( not ( = ?auto_208100 ?auto_208110 ) ) ( not ( = ?auto_208101 ?auto_208102 ) ) ( not ( = ?auto_208101 ?auto_208103 ) ) ( not ( = ?auto_208101 ?auto_208104 ) ) ( not ( = ?auto_208101 ?auto_208105 ) ) ( not ( = ?auto_208101 ?auto_208106 ) ) ( not ( = ?auto_208101 ?auto_208107 ) ) ( not ( = ?auto_208101 ?auto_208108 ) ) ( not ( = ?auto_208101 ?auto_208109 ) ) ( not ( = ?auto_208101 ?auto_208110 ) ) ( not ( = ?auto_208102 ?auto_208103 ) ) ( not ( = ?auto_208102 ?auto_208104 ) ) ( not ( = ?auto_208102 ?auto_208105 ) ) ( not ( = ?auto_208102 ?auto_208106 ) ) ( not ( = ?auto_208102 ?auto_208107 ) ) ( not ( = ?auto_208102 ?auto_208108 ) ) ( not ( = ?auto_208102 ?auto_208109 ) ) ( not ( = ?auto_208102 ?auto_208110 ) ) ( not ( = ?auto_208103 ?auto_208104 ) ) ( not ( = ?auto_208103 ?auto_208105 ) ) ( not ( = ?auto_208103 ?auto_208106 ) ) ( not ( = ?auto_208103 ?auto_208107 ) ) ( not ( = ?auto_208103 ?auto_208108 ) ) ( not ( = ?auto_208103 ?auto_208109 ) ) ( not ( = ?auto_208103 ?auto_208110 ) ) ( not ( = ?auto_208104 ?auto_208105 ) ) ( not ( = ?auto_208104 ?auto_208106 ) ) ( not ( = ?auto_208104 ?auto_208107 ) ) ( not ( = ?auto_208104 ?auto_208108 ) ) ( not ( = ?auto_208104 ?auto_208109 ) ) ( not ( = ?auto_208104 ?auto_208110 ) ) ( not ( = ?auto_208105 ?auto_208106 ) ) ( not ( = ?auto_208105 ?auto_208107 ) ) ( not ( = ?auto_208105 ?auto_208108 ) ) ( not ( = ?auto_208105 ?auto_208109 ) ) ( not ( = ?auto_208105 ?auto_208110 ) ) ( not ( = ?auto_208106 ?auto_208107 ) ) ( not ( = ?auto_208106 ?auto_208108 ) ) ( not ( = ?auto_208106 ?auto_208109 ) ) ( not ( = ?auto_208106 ?auto_208110 ) ) ( not ( = ?auto_208107 ?auto_208108 ) ) ( not ( = ?auto_208107 ?auto_208109 ) ) ( not ( = ?auto_208107 ?auto_208110 ) ) ( not ( = ?auto_208108 ?auto_208109 ) ) ( not ( = ?auto_208108 ?auto_208110 ) ) ( not ( = ?auto_208109 ?auto_208110 ) ) ( ON ?auto_208108 ?auto_208109 ) ( ON ?auto_208107 ?auto_208108 ) ( ON ?auto_208106 ?auto_208107 ) ( ON ?auto_208105 ?auto_208106 ) ( ON ?auto_208104 ?auto_208105 ) ( ON ?auto_208103 ?auto_208104 ) ( ON ?auto_208102 ?auto_208103 ) ( ON ?auto_208101 ?auto_208102 ) ( CLEAR ?auto_208099 ) ( ON ?auto_208100 ?auto_208101 ) ( CLEAR ?auto_208100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208098 ?auto_208099 ?auto_208100 )
      ( MAKE-12PILE ?auto_208098 ?auto_208099 ?auto_208100 ?auto_208101 ?auto_208102 ?auto_208103 ?auto_208104 ?auto_208105 ?auto_208106 ?auto_208107 ?auto_208108 ?auto_208109 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208123 - BLOCK
      ?auto_208124 - BLOCK
      ?auto_208125 - BLOCK
      ?auto_208126 - BLOCK
      ?auto_208127 - BLOCK
      ?auto_208128 - BLOCK
      ?auto_208129 - BLOCK
      ?auto_208130 - BLOCK
      ?auto_208131 - BLOCK
      ?auto_208132 - BLOCK
      ?auto_208133 - BLOCK
      ?auto_208134 - BLOCK
    )
    :vars
    (
      ?auto_208135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208134 ?auto_208135 ) ( ON-TABLE ?auto_208123 ) ( ON ?auto_208124 ?auto_208123 ) ( not ( = ?auto_208123 ?auto_208124 ) ) ( not ( = ?auto_208123 ?auto_208125 ) ) ( not ( = ?auto_208123 ?auto_208126 ) ) ( not ( = ?auto_208123 ?auto_208127 ) ) ( not ( = ?auto_208123 ?auto_208128 ) ) ( not ( = ?auto_208123 ?auto_208129 ) ) ( not ( = ?auto_208123 ?auto_208130 ) ) ( not ( = ?auto_208123 ?auto_208131 ) ) ( not ( = ?auto_208123 ?auto_208132 ) ) ( not ( = ?auto_208123 ?auto_208133 ) ) ( not ( = ?auto_208123 ?auto_208134 ) ) ( not ( = ?auto_208123 ?auto_208135 ) ) ( not ( = ?auto_208124 ?auto_208125 ) ) ( not ( = ?auto_208124 ?auto_208126 ) ) ( not ( = ?auto_208124 ?auto_208127 ) ) ( not ( = ?auto_208124 ?auto_208128 ) ) ( not ( = ?auto_208124 ?auto_208129 ) ) ( not ( = ?auto_208124 ?auto_208130 ) ) ( not ( = ?auto_208124 ?auto_208131 ) ) ( not ( = ?auto_208124 ?auto_208132 ) ) ( not ( = ?auto_208124 ?auto_208133 ) ) ( not ( = ?auto_208124 ?auto_208134 ) ) ( not ( = ?auto_208124 ?auto_208135 ) ) ( not ( = ?auto_208125 ?auto_208126 ) ) ( not ( = ?auto_208125 ?auto_208127 ) ) ( not ( = ?auto_208125 ?auto_208128 ) ) ( not ( = ?auto_208125 ?auto_208129 ) ) ( not ( = ?auto_208125 ?auto_208130 ) ) ( not ( = ?auto_208125 ?auto_208131 ) ) ( not ( = ?auto_208125 ?auto_208132 ) ) ( not ( = ?auto_208125 ?auto_208133 ) ) ( not ( = ?auto_208125 ?auto_208134 ) ) ( not ( = ?auto_208125 ?auto_208135 ) ) ( not ( = ?auto_208126 ?auto_208127 ) ) ( not ( = ?auto_208126 ?auto_208128 ) ) ( not ( = ?auto_208126 ?auto_208129 ) ) ( not ( = ?auto_208126 ?auto_208130 ) ) ( not ( = ?auto_208126 ?auto_208131 ) ) ( not ( = ?auto_208126 ?auto_208132 ) ) ( not ( = ?auto_208126 ?auto_208133 ) ) ( not ( = ?auto_208126 ?auto_208134 ) ) ( not ( = ?auto_208126 ?auto_208135 ) ) ( not ( = ?auto_208127 ?auto_208128 ) ) ( not ( = ?auto_208127 ?auto_208129 ) ) ( not ( = ?auto_208127 ?auto_208130 ) ) ( not ( = ?auto_208127 ?auto_208131 ) ) ( not ( = ?auto_208127 ?auto_208132 ) ) ( not ( = ?auto_208127 ?auto_208133 ) ) ( not ( = ?auto_208127 ?auto_208134 ) ) ( not ( = ?auto_208127 ?auto_208135 ) ) ( not ( = ?auto_208128 ?auto_208129 ) ) ( not ( = ?auto_208128 ?auto_208130 ) ) ( not ( = ?auto_208128 ?auto_208131 ) ) ( not ( = ?auto_208128 ?auto_208132 ) ) ( not ( = ?auto_208128 ?auto_208133 ) ) ( not ( = ?auto_208128 ?auto_208134 ) ) ( not ( = ?auto_208128 ?auto_208135 ) ) ( not ( = ?auto_208129 ?auto_208130 ) ) ( not ( = ?auto_208129 ?auto_208131 ) ) ( not ( = ?auto_208129 ?auto_208132 ) ) ( not ( = ?auto_208129 ?auto_208133 ) ) ( not ( = ?auto_208129 ?auto_208134 ) ) ( not ( = ?auto_208129 ?auto_208135 ) ) ( not ( = ?auto_208130 ?auto_208131 ) ) ( not ( = ?auto_208130 ?auto_208132 ) ) ( not ( = ?auto_208130 ?auto_208133 ) ) ( not ( = ?auto_208130 ?auto_208134 ) ) ( not ( = ?auto_208130 ?auto_208135 ) ) ( not ( = ?auto_208131 ?auto_208132 ) ) ( not ( = ?auto_208131 ?auto_208133 ) ) ( not ( = ?auto_208131 ?auto_208134 ) ) ( not ( = ?auto_208131 ?auto_208135 ) ) ( not ( = ?auto_208132 ?auto_208133 ) ) ( not ( = ?auto_208132 ?auto_208134 ) ) ( not ( = ?auto_208132 ?auto_208135 ) ) ( not ( = ?auto_208133 ?auto_208134 ) ) ( not ( = ?auto_208133 ?auto_208135 ) ) ( not ( = ?auto_208134 ?auto_208135 ) ) ( ON ?auto_208133 ?auto_208134 ) ( ON ?auto_208132 ?auto_208133 ) ( ON ?auto_208131 ?auto_208132 ) ( ON ?auto_208130 ?auto_208131 ) ( ON ?auto_208129 ?auto_208130 ) ( ON ?auto_208128 ?auto_208129 ) ( ON ?auto_208127 ?auto_208128 ) ( ON ?auto_208126 ?auto_208127 ) ( CLEAR ?auto_208124 ) ( ON ?auto_208125 ?auto_208126 ) ( CLEAR ?auto_208125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208123 ?auto_208124 ?auto_208125 )
      ( MAKE-12PILE ?auto_208123 ?auto_208124 ?auto_208125 ?auto_208126 ?auto_208127 ?auto_208128 ?auto_208129 ?auto_208130 ?auto_208131 ?auto_208132 ?auto_208133 ?auto_208134 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208148 - BLOCK
      ?auto_208149 - BLOCK
      ?auto_208150 - BLOCK
      ?auto_208151 - BLOCK
      ?auto_208152 - BLOCK
      ?auto_208153 - BLOCK
      ?auto_208154 - BLOCK
      ?auto_208155 - BLOCK
      ?auto_208156 - BLOCK
      ?auto_208157 - BLOCK
      ?auto_208158 - BLOCK
      ?auto_208159 - BLOCK
    )
    :vars
    (
      ?auto_208160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208159 ?auto_208160 ) ( ON-TABLE ?auto_208148 ) ( not ( = ?auto_208148 ?auto_208149 ) ) ( not ( = ?auto_208148 ?auto_208150 ) ) ( not ( = ?auto_208148 ?auto_208151 ) ) ( not ( = ?auto_208148 ?auto_208152 ) ) ( not ( = ?auto_208148 ?auto_208153 ) ) ( not ( = ?auto_208148 ?auto_208154 ) ) ( not ( = ?auto_208148 ?auto_208155 ) ) ( not ( = ?auto_208148 ?auto_208156 ) ) ( not ( = ?auto_208148 ?auto_208157 ) ) ( not ( = ?auto_208148 ?auto_208158 ) ) ( not ( = ?auto_208148 ?auto_208159 ) ) ( not ( = ?auto_208148 ?auto_208160 ) ) ( not ( = ?auto_208149 ?auto_208150 ) ) ( not ( = ?auto_208149 ?auto_208151 ) ) ( not ( = ?auto_208149 ?auto_208152 ) ) ( not ( = ?auto_208149 ?auto_208153 ) ) ( not ( = ?auto_208149 ?auto_208154 ) ) ( not ( = ?auto_208149 ?auto_208155 ) ) ( not ( = ?auto_208149 ?auto_208156 ) ) ( not ( = ?auto_208149 ?auto_208157 ) ) ( not ( = ?auto_208149 ?auto_208158 ) ) ( not ( = ?auto_208149 ?auto_208159 ) ) ( not ( = ?auto_208149 ?auto_208160 ) ) ( not ( = ?auto_208150 ?auto_208151 ) ) ( not ( = ?auto_208150 ?auto_208152 ) ) ( not ( = ?auto_208150 ?auto_208153 ) ) ( not ( = ?auto_208150 ?auto_208154 ) ) ( not ( = ?auto_208150 ?auto_208155 ) ) ( not ( = ?auto_208150 ?auto_208156 ) ) ( not ( = ?auto_208150 ?auto_208157 ) ) ( not ( = ?auto_208150 ?auto_208158 ) ) ( not ( = ?auto_208150 ?auto_208159 ) ) ( not ( = ?auto_208150 ?auto_208160 ) ) ( not ( = ?auto_208151 ?auto_208152 ) ) ( not ( = ?auto_208151 ?auto_208153 ) ) ( not ( = ?auto_208151 ?auto_208154 ) ) ( not ( = ?auto_208151 ?auto_208155 ) ) ( not ( = ?auto_208151 ?auto_208156 ) ) ( not ( = ?auto_208151 ?auto_208157 ) ) ( not ( = ?auto_208151 ?auto_208158 ) ) ( not ( = ?auto_208151 ?auto_208159 ) ) ( not ( = ?auto_208151 ?auto_208160 ) ) ( not ( = ?auto_208152 ?auto_208153 ) ) ( not ( = ?auto_208152 ?auto_208154 ) ) ( not ( = ?auto_208152 ?auto_208155 ) ) ( not ( = ?auto_208152 ?auto_208156 ) ) ( not ( = ?auto_208152 ?auto_208157 ) ) ( not ( = ?auto_208152 ?auto_208158 ) ) ( not ( = ?auto_208152 ?auto_208159 ) ) ( not ( = ?auto_208152 ?auto_208160 ) ) ( not ( = ?auto_208153 ?auto_208154 ) ) ( not ( = ?auto_208153 ?auto_208155 ) ) ( not ( = ?auto_208153 ?auto_208156 ) ) ( not ( = ?auto_208153 ?auto_208157 ) ) ( not ( = ?auto_208153 ?auto_208158 ) ) ( not ( = ?auto_208153 ?auto_208159 ) ) ( not ( = ?auto_208153 ?auto_208160 ) ) ( not ( = ?auto_208154 ?auto_208155 ) ) ( not ( = ?auto_208154 ?auto_208156 ) ) ( not ( = ?auto_208154 ?auto_208157 ) ) ( not ( = ?auto_208154 ?auto_208158 ) ) ( not ( = ?auto_208154 ?auto_208159 ) ) ( not ( = ?auto_208154 ?auto_208160 ) ) ( not ( = ?auto_208155 ?auto_208156 ) ) ( not ( = ?auto_208155 ?auto_208157 ) ) ( not ( = ?auto_208155 ?auto_208158 ) ) ( not ( = ?auto_208155 ?auto_208159 ) ) ( not ( = ?auto_208155 ?auto_208160 ) ) ( not ( = ?auto_208156 ?auto_208157 ) ) ( not ( = ?auto_208156 ?auto_208158 ) ) ( not ( = ?auto_208156 ?auto_208159 ) ) ( not ( = ?auto_208156 ?auto_208160 ) ) ( not ( = ?auto_208157 ?auto_208158 ) ) ( not ( = ?auto_208157 ?auto_208159 ) ) ( not ( = ?auto_208157 ?auto_208160 ) ) ( not ( = ?auto_208158 ?auto_208159 ) ) ( not ( = ?auto_208158 ?auto_208160 ) ) ( not ( = ?auto_208159 ?auto_208160 ) ) ( ON ?auto_208158 ?auto_208159 ) ( ON ?auto_208157 ?auto_208158 ) ( ON ?auto_208156 ?auto_208157 ) ( ON ?auto_208155 ?auto_208156 ) ( ON ?auto_208154 ?auto_208155 ) ( ON ?auto_208153 ?auto_208154 ) ( ON ?auto_208152 ?auto_208153 ) ( ON ?auto_208151 ?auto_208152 ) ( ON ?auto_208150 ?auto_208151 ) ( CLEAR ?auto_208148 ) ( ON ?auto_208149 ?auto_208150 ) ( CLEAR ?auto_208149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208148 ?auto_208149 )
      ( MAKE-12PILE ?auto_208148 ?auto_208149 ?auto_208150 ?auto_208151 ?auto_208152 ?auto_208153 ?auto_208154 ?auto_208155 ?auto_208156 ?auto_208157 ?auto_208158 ?auto_208159 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208173 - BLOCK
      ?auto_208174 - BLOCK
      ?auto_208175 - BLOCK
      ?auto_208176 - BLOCK
      ?auto_208177 - BLOCK
      ?auto_208178 - BLOCK
      ?auto_208179 - BLOCK
      ?auto_208180 - BLOCK
      ?auto_208181 - BLOCK
      ?auto_208182 - BLOCK
      ?auto_208183 - BLOCK
      ?auto_208184 - BLOCK
    )
    :vars
    (
      ?auto_208185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208184 ?auto_208185 ) ( ON-TABLE ?auto_208173 ) ( not ( = ?auto_208173 ?auto_208174 ) ) ( not ( = ?auto_208173 ?auto_208175 ) ) ( not ( = ?auto_208173 ?auto_208176 ) ) ( not ( = ?auto_208173 ?auto_208177 ) ) ( not ( = ?auto_208173 ?auto_208178 ) ) ( not ( = ?auto_208173 ?auto_208179 ) ) ( not ( = ?auto_208173 ?auto_208180 ) ) ( not ( = ?auto_208173 ?auto_208181 ) ) ( not ( = ?auto_208173 ?auto_208182 ) ) ( not ( = ?auto_208173 ?auto_208183 ) ) ( not ( = ?auto_208173 ?auto_208184 ) ) ( not ( = ?auto_208173 ?auto_208185 ) ) ( not ( = ?auto_208174 ?auto_208175 ) ) ( not ( = ?auto_208174 ?auto_208176 ) ) ( not ( = ?auto_208174 ?auto_208177 ) ) ( not ( = ?auto_208174 ?auto_208178 ) ) ( not ( = ?auto_208174 ?auto_208179 ) ) ( not ( = ?auto_208174 ?auto_208180 ) ) ( not ( = ?auto_208174 ?auto_208181 ) ) ( not ( = ?auto_208174 ?auto_208182 ) ) ( not ( = ?auto_208174 ?auto_208183 ) ) ( not ( = ?auto_208174 ?auto_208184 ) ) ( not ( = ?auto_208174 ?auto_208185 ) ) ( not ( = ?auto_208175 ?auto_208176 ) ) ( not ( = ?auto_208175 ?auto_208177 ) ) ( not ( = ?auto_208175 ?auto_208178 ) ) ( not ( = ?auto_208175 ?auto_208179 ) ) ( not ( = ?auto_208175 ?auto_208180 ) ) ( not ( = ?auto_208175 ?auto_208181 ) ) ( not ( = ?auto_208175 ?auto_208182 ) ) ( not ( = ?auto_208175 ?auto_208183 ) ) ( not ( = ?auto_208175 ?auto_208184 ) ) ( not ( = ?auto_208175 ?auto_208185 ) ) ( not ( = ?auto_208176 ?auto_208177 ) ) ( not ( = ?auto_208176 ?auto_208178 ) ) ( not ( = ?auto_208176 ?auto_208179 ) ) ( not ( = ?auto_208176 ?auto_208180 ) ) ( not ( = ?auto_208176 ?auto_208181 ) ) ( not ( = ?auto_208176 ?auto_208182 ) ) ( not ( = ?auto_208176 ?auto_208183 ) ) ( not ( = ?auto_208176 ?auto_208184 ) ) ( not ( = ?auto_208176 ?auto_208185 ) ) ( not ( = ?auto_208177 ?auto_208178 ) ) ( not ( = ?auto_208177 ?auto_208179 ) ) ( not ( = ?auto_208177 ?auto_208180 ) ) ( not ( = ?auto_208177 ?auto_208181 ) ) ( not ( = ?auto_208177 ?auto_208182 ) ) ( not ( = ?auto_208177 ?auto_208183 ) ) ( not ( = ?auto_208177 ?auto_208184 ) ) ( not ( = ?auto_208177 ?auto_208185 ) ) ( not ( = ?auto_208178 ?auto_208179 ) ) ( not ( = ?auto_208178 ?auto_208180 ) ) ( not ( = ?auto_208178 ?auto_208181 ) ) ( not ( = ?auto_208178 ?auto_208182 ) ) ( not ( = ?auto_208178 ?auto_208183 ) ) ( not ( = ?auto_208178 ?auto_208184 ) ) ( not ( = ?auto_208178 ?auto_208185 ) ) ( not ( = ?auto_208179 ?auto_208180 ) ) ( not ( = ?auto_208179 ?auto_208181 ) ) ( not ( = ?auto_208179 ?auto_208182 ) ) ( not ( = ?auto_208179 ?auto_208183 ) ) ( not ( = ?auto_208179 ?auto_208184 ) ) ( not ( = ?auto_208179 ?auto_208185 ) ) ( not ( = ?auto_208180 ?auto_208181 ) ) ( not ( = ?auto_208180 ?auto_208182 ) ) ( not ( = ?auto_208180 ?auto_208183 ) ) ( not ( = ?auto_208180 ?auto_208184 ) ) ( not ( = ?auto_208180 ?auto_208185 ) ) ( not ( = ?auto_208181 ?auto_208182 ) ) ( not ( = ?auto_208181 ?auto_208183 ) ) ( not ( = ?auto_208181 ?auto_208184 ) ) ( not ( = ?auto_208181 ?auto_208185 ) ) ( not ( = ?auto_208182 ?auto_208183 ) ) ( not ( = ?auto_208182 ?auto_208184 ) ) ( not ( = ?auto_208182 ?auto_208185 ) ) ( not ( = ?auto_208183 ?auto_208184 ) ) ( not ( = ?auto_208183 ?auto_208185 ) ) ( not ( = ?auto_208184 ?auto_208185 ) ) ( ON ?auto_208183 ?auto_208184 ) ( ON ?auto_208182 ?auto_208183 ) ( ON ?auto_208181 ?auto_208182 ) ( ON ?auto_208180 ?auto_208181 ) ( ON ?auto_208179 ?auto_208180 ) ( ON ?auto_208178 ?auto_208179 ) ( ON ?auto_208177 ?auto_208178 ) ( ON ?auto_208176 ?auto_208177 ) ( ON ?auto_208175 ?auto_208176 ) ( CLEAR ?auto_208173 ) ( ON ?auto_208174 ?auto_208175 ) ( CLEAR ?auto_208174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208173 ?auto_208174 )
      ( MAKE-12PILE ?auto_208173 ?auto_208174 ?auto_208175 ?auto_208176 ?auto_208177 ?auto_208178 ?auto_208179 ?auto_208180 ?auto_208181 ?auto_208182 ?auto_208183 ?auto_208184 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208198 - BLOCK
      ?auto_208199 - BLOCK
      ?auto_208200 - BLOCK
      ?auto_208201 - BLOCK
      ?auto_208202 - BLOCK
      ?auto_208203 - BLOCK
      ?auto_208204 - BLOCK
      ?auto_208205 - BLOCK
      ?auto_208206 - BLOCK
      ?auto_208207 - BLOCK
      ?auto_208208 - BLOCK
      ?auto_208209 - BLOCK
    )
    :vars
    (
      ?auto_208210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208209 ?auto_208210 ) ( not ( = ?auto_208198 ?auto_208199 ) ) ( not ( = ?auto_208198 ?auto_208200 ) ) ( not ( = ?auto_208198 ?auto_208201 ) ) ( not ( = ?auto_208198 ?auto_208202 ) ) ( not ( = ?auto_208198 ?auto_208203 ) ) ( not ( = ?auto_208198 ?auto_208204 ) ) ( not ( = ?auto_208198 ?auto_208205 ) ) ( not ( = ?auto_208198 ?auto_208206 ) ) ( not ( = ?auto_208198 ?auto_208207 ) ) ( not ( = ?auto_208198 ?auto_208208 ) ) ( not ( = ?auto_208198 ?auto_208209 ) ) ( not ( = ?auto_208198 ?auto_208210 ) ) ( not ( = ?auto_208199 ?auto_208200 ) ) ( not ( = ?auto_208199 ?auto_208201 ) ) ( not ( = ?auto_208199 ?auto_208202 ) ) ( not ( = ?auto_208199 ?auto_208203 ) ) ( not ( = ?auto_208199 ?auto_208204 ) ) ( not ( = ?auto_208199 ?auto_208205 ) ) ( not ( = ?auto_208199 ?auto_208206 ) ) ( not ( = ?auto_208199 ?auto_208207 ) ) ( not ( = ?auto_208199 ?auto_208208 ) ) ( not ( = ?auto_208199 ?auto_208209 ) ) ( not ( = ?auto_208199 ?auto_208210 ) ) ( not ( = ?auto_208200 ?auto_208201 ) ) ( not ( = ?auto_208200 ?auto_208202 ) ) ( not ( = ?auto_208200 ?auto_208203 ) ) ( not ( = ?auto_208200 ?auto_208204 ) ) ( not ( = ?auto_208200 ?auto_208205 ) ) ( not ( = ?auto_208200 ?auto_208206 ) ) ( not ( = ?auto_208200 ?auto_208207 ) ) ( not ( = ?auto_208200 ?auto_208208 ) ) ( not ( = ?auto_208200 ?auto_208209 ) ) ( not ( = ?auto_208200 ?auto_208210 ) ) ( not ( = ?auto_208201 ?auto_208202 ) ) ( not ( = ?auto_208201 ?auto_208203 ) ) ( not ( = ?auto_208201 ?auto_208204 ) ) ( not ( = ?auto_208201 ?auto_208205 ) ) ( not ( = ?auto_208201 ?auto_208206 ) ) ( not ( = ?auto_208201 ?auto_208207 ) ) ( not ( = ?auto_208201 ?auto_208208 ) ) ( not ( = ?auto_208201 ?auto_208209 ) ) ( not ( = ?auto_208201 ?auto_208210 ) ) ( not ( = ?auto_208202 ?auto_208203 ) ) ( not ( = ?auto_208202 ?auto_208204 ) ) ( not ( = ?auto_208202 ?auto_208205 ) ) ( not ( = ?auto_208202 ?auto_208206 ) ) ( not ( = ?auto_208202 ?auto_208207 ) ) ( not ( = ?auto_208202 ?auto_208208 ) ) ( not ( = ?auto_208202 ?auto_208209 ) ) ( not ( = ?auto_208202 ?auto_208210 ) ) ( not ( = ?auto_208203 ?auto_208204 ) ) ( not ( = ?auto_208203 ?auto_208205 ) ) ( not ( = ?auto_208203 ?auto_208206 ) ) ( not ( = ?auto_208203 ?auto_208207 ) ) ( not ( = ?auto_208203 ?auto_208208 ) ) ( not ( = ?auto_208203 ?auto_208209 ) ) ( not ( = ?auto_208203 ?auto_208210 ) ) ( not ( = ?auto_208204 ?auto_208205 ) ) ( not ( = ?auto_208204 ?auto_208206 ) ) ( not ( = ?auto_208204 ?auto_208207 ) ) ( not ( = ?auto_208204 ?auto_208208 ) ) ( not ( = ?auto_208204 ?auto_208209 ) ) ( not ( = ?auto_208204 ?auto_208210 ) ) ( not ( = ?auto_208205 ?auto_208206 ) ) ( not ( = ?auto_208205 ?auto_208207 ) ) ( not ( = ?auto_208205 ?auto_208208 ) ) ( not ( = ?auto_208205 ?auto_208209 ) ) ( not ( = ?auto_208205 ?auto_208210 ) ) ( not ( = ?auto_208206 ?auto_208207 ) ) ( not ( = ?auto_208206 ?auto_208208 ) ) ( not ( = ?auto_208206 ?auto_208209 ) ) ( not ( = ?auto_208206 ?auto_208210 ) ) ( not ( = ?auto_208207 ?auto_208208 ) ) ( not ( = ?auto_208207 ?auto_208209 ) ) ( not ( = ?auto_208207 ?auto_208210 ) ) ( not ( = ?auto_208208 ?auto_208209 ) ) ( not ( = ?auto_208208 ?auto_208210 ) ) ( not ( = ?auto_208209 ?auto_208210 ) ) ( ON ?auto_208208 ?auto_208209 ) ( ON ?auto_208207 ?auto_208208 ) ( ON ?auto_208206 ?auto_208207 ) ( ON ?auto_208205 ?auto_208206 ) ( ON ?auto_208204 ?auto_208205 ) ( ON ?auto_208203 ?auto_208204 ) ( ON ?auto_208202 ?auto_208203 ) ( ON ?auto_208201 ?auto_208202 ) ( ON ?auto_208200 ?auto_208201 ) ( ON ?auto_208199 ?auto_208200 ) ( ON ?auto_208198 ?auto_208199 ) ( CLEAR ?auto_208198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208198 )
      ( MAKE-12PILE ?auto_208198 ?auto_208199 ?auto_208200 ?auto_208201 ?auto_208202 ?auto_208203 ?auto_208204 ?auto_208205 ?auto_208206 ?auto_208207 ?auto_208208 ?auto_208209 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_208223 - BLOCK
      ?auto_208224 - BLOCK
      ?auto_208225 - BLOCK
      ?auto_208226 - BLOCK
      ?auto_208227 - BLOCK
      ?auto_208228 - BLOCK
      ?auto_208229 - BLOCK
      ?auto_208230 - BLOCK
      ?auto_208231 - BLOCK
      ?auto_208232 - BLOCK
      ?auto_208233 - BLOCK
      ?auto_208234 - BLOCK
    )
    :vars
    (
      ?auto_208235 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208234 ?auto_208235 ) ( not ( = ?auto_208223 ?auto_208224 ) ) ( not ( = ?auto_208223 ?auto_208225 ) ) ( not ( = ?auto_208223 ?auto_208226 ) ) ( not ( = ?auto_208223 ?auto_208227 ) ) ( not ( = ?auto_208223 ?auto_208228 ) ) ( not ( = ?auto_208223 ?auto_208229 ) ) ( not ( = ?auto_208223 ?auto_208230 ) ) ( not ( = ?auto_208223 ?auto_208231 ) ) ( not ( = ?auto_208223 ?auto_208232 ) ) ( not ( = ?auto_208223 ?auto_208233 ) ) ( not ( = ?auto_208223 ?auto_208234 ) ) ( not ( = ?auto_208223 ?auto_208235 ) ) ( not ( = ?auto_208224 ?auto_208225 ) ) ( not ( = ?auto_208224 ?auto_208226 ) ) ( not ( = ?auto_208224 ?auto_208227 ) ) ( not ( = ?auto_208224 ?auto_208228 ) ) ( not ( = ?auto_208224 ?auto_208229 ) ) ( not ( = ?auto_208224 ?auto_208230 ) ) ( not ( = ?auto_208224 ?auto_208231 ) ) ( not ( = ?auto_208224 ?auto_208232 ) ) ( not ( = ?auto_208224 ?auto_208233 ) ) ( not ( = ?auto_208224 ?auto_208234 ) ) ( not ( = ?auto_208224 ?auto_208235 ) ) ( not ( = ?auto_208225 ?auto_208226 ) ) ( not ( = ?auto_208225 ?auto_208227 ) ) ( not ( = ?auto_208225 ?auto_208228 ) ) ( not ( = ?auto_208225 ?auto_208229 ) ) ( not ( = ?auto_208225 ?auto_208230 ) ) ( not ( = ?auto_208225 ?auto_208231 ) ) ( not ( = ?auto_208225 ?auto_208232 ) ) ( not ( = ?auto_208225 ?auto_208233 ) ) ( not ( = ?auto_208225 ?auto_208234 ) ) ( not ( = ?auto_208225 ?auto_208235 ) ) ( not ( = ?auto_208226 ?auto_208227 ) ) ( not ( = ?auto_208226 ?auto_208228 ) ) ( not ( = ?auto_208226 ?auto_208229 ) ) ( not ( = ?auto_208226 ?auto_208230 ) ) ( not ( = ?auto_208226 ?auto_208231 ) ) ( not ( = ?auto_208226 ?auto_208232 ) ) ( not ( = ?auto_208226 ?auto_208233 ) ) ( not ( = ?auto_208226 ?auto_208234 ) ) ( not ( = ?auto_208226 ?auto_208235 ) ) ( not ( = ?auto_208227 ?auto_208228 ) ) ( not ( = ?auto_208227 ?auto_208229 ) ) ( not ( = ?auto_208227 ?auto_208230 ) ) ( not ( = ?auto_208227 ?auto_208231 ) ) ( not ( = ?auto_208227 ?auto_208232 ) ) ( not ( = ?auto_208227 ?auto_208233 ) ) ( not ( = ?auto_208227 ?auto_208234 ) ) ( not ( = ?auto_208227 ?auto_208235 ) ) ( not ( = ?auto_208228 ?auto_208229 ) ) ( not ( = ?auto_208228 ?auto_208230 ) ) ( not ( = ?auto_208228 ?auto_208231 ) ) ( not ( = ?auto_208228 ?auto_208232 ) ) ( not ( = ?auto_208228 ?auto_208233 ) ) ( not ( = ?auto_208228 ?auto_208234 ) ) ( not ( = ?auto_208228 ?auto_208235 ) ) ( not ( = ?auto_208229 ?auto_208230 ) ) ( not ( = ?auto_208229 ?auto_208231 ) ) ( not ( = ?auto_208229 ?auto_208232 ) ) ( not ( = ?auto_208229 ?auto_208233 ) ) ( not ( = ?auto_208229 ?auto_208234 ) ) ( not ( = ?auto_208229 ?auto_208235 ) ) ( not ( = ?auto_208230 ?auto_208231 ) ) ( not ( = ?auto_208230 ?auto_208232 ) ) ( not ( = ?auto_208230 ?auto_208233 ) ) ( not ( = ?auto_208230 ?auto_208234 ) ) ( not ( = ?auto_208230 ?auto_208235 ) ) ( not ( = ?auto_208231 ?auto_208232 ) ) ( not ( = ?auto_208231 ?auto_208233 ) ) ( not ( = ?auto_208231 ?auto_208234 ) ) ( not ( = ?auto_208231 ?auto_208235 ) ) ( not ( = ?auto_208232 ?auto_208233 ) ) ( not ( = ?auto_208232 ?auto_208234 ) ) ( not ( = ?auto_208232 ?auto_208235 ) ) ( not ( = ?auto_208233 ?auto_208234 ) ) ( not ( = ?auto_208233 ?auto_208235 ) ) ( not ( = ?auto_208234 ?auto_208235 ) ) ( ON ?auto_208233 ?auto_208234 ) ( ON ?auto_208232 ?auto_208233 ) ( ON ?auto_208231 ?auto_208232 ) ( ON ?auto_208230 ?auto_208231 ) ( ON ?auto_208229 ?auto_208230 ) ( ON ?auto_208228 ?auto_208229 ) ( ON ?auto_208227 ?auto_208228 ) ( ON ?auto_208226 ?auto_208227 ) ( ON ?auto_208225 ?auto_208226 ) ( ON ?auto_208224 ?auto_208225 ) ( ON ?auto_208223 ?auto_208224 ) ( CLEAR ?auto_208223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208223 )
      ( MAKE-12PILE ?auto_208223 ?auto_208224 ?auto_208225 ?auto_208226 ?auto_208227 ?auto_208228 ?auto_208229 ?auto_208230 ?auto_208231 ?auto_208232 ?auto_208233 ?auto_208234 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208249 - BLOCK
      ?auto_208250 - BLOCK
      ?auto_208251 - BLOCK
      ?auto_208252 - BLOCK
      ?auto_208253 - BLOCK
      ?auto_208254 - BLOCK
      ?auto_208255 - BLOCK
      ?auto_208256 - BLOCK
      ?auto_208257 - BLOCK
      ?auto_208258 - BLOCK
      ?auto_208259 - BLOCK
      ?auto_208260 - BLOCK
      ?auto_208261 - BLOCK
    )
    :vars
    (
      ?auto_208262 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208260 ) ( ON ?auto_208261 ?auto_208262 ) ( CLEAR ?auto_208261 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208249 ) ( ON ?auto_208250 ?auto_208249 ) ( ON ?auto_208251 ?auto_208250 ) ( ON ?auto_208252 ?auto_208251 ) ( ON ?auto_208253 ?auto_208252 ) ( ON ?auto_208254 ?auto_208253 ) ( ON ?auto_208255 ?auto_208254 ) ( ON ?auto_208256 ?auto_208255 ) ( ON ?auto_208257 ?auto_208256 ) ( ON ?auto_208258 ?auto_208257 ) ( ON ?auto_208259 ?auto_208258 ) ( ON ?auto_208260 ?auto_208259 ) ( not ( = ?auto_208249 ?auto_208250 ) ) ( not ( = ?auto_208249 ?auto_208251 ) ) ( not ( = ?auto_208249 ?auto_208252 ) ) ( not ( = ?auto_208249 ?auto_208253 ) ) ( not ( = ?auto_208249 ?auto_208254 ) ) ( not ( = ?auto_208249 ?auto_208255 ) ) ( not ( = ?auto_208249 ?auto_208256 ) ) ( not ( = ?auto_208249 ?auto_208257 ) ) ( not ( = ?auto_208249 ?auto_208258 ) ) ( not ( = ?auto_208249 ?auto_208259 ) ) ( not ( = ?auto_208249 ?auto_208260 ) ) ( not ( = ?auto_208249 ?auto_208261 ) ) ( not ( = ?auto_208249 ?auto_208262 ) ) ( not ( = ?auto_208250 ?auto_208251 ) ) ( not ( = ?auto_208250 ?auto_208252 ) ) ( not ( = ?auto_208250 ?auto_208253 ) ) ( not ( = ?auto_208250 ?auto_208254 ) ) ( not ( = ?auto_208250 ?auto_208255 ) ) ( not ( = ?auto_208250 ?auto_208256 ) ) ( not ( = ?auto_208250 ?auto_208257 ) ) ( not ( = ?auto_208250 ?auto_208258 ) ) ( not ( = ?auto_208250 ?auto_208259 ) ) ( not ( = ?auto_208250 ?auto_208260 ) ) ( not ( = ?auto_208250 ?auto_208261 ) ) ( not ( = ?auto_208250 ?auto_208262 ) ) ( not ( = ?auto_208251 ?auto_208252 ) ) ( not ( = ?auto_208251 ?auto_208253 ) ) ( not ( = ?auto_208251 ?auto_208254 ) ) ( not ( = ?auto_208251 ?auto_208255 ) ) ( not ( = ?auto_208251 ?auto_208256 ) ) ( not ( = ?auto_208251 ?auto_208257 ) ) ( not ( = ?auto_208251 ?auto_208258 ) ) ( not ( = ?auto_208251 ?auto_208259 ) ) ( not ( = ?auto_208251 ?auto_208260 ) ) ( not ( = ?auto_208251 ?auto_208261 ) ) ( not ( = ?auto_208251 ?auto_208262 ) ) ( not ( = ?auto_208252 ?auto_208253 ) ) ( not ( = ?auto_208252 ?auto_208254 ) ) ( not ( = ?auto_208252 ?auto_208255 ) ) ( not ( = ?auto_208252 ?auto_208256 ) ) ( not ( = ?auto_208252 ?auto_208257 ) ) ( not ( = ?auto_208252 ?auto_208258 ) ) ( not ( = ?auto_208252 ?auto_208259 ) ) ( not ( = ?auto_208252 ?auto_208260 ) ) ( not ( = ?auto_208252 ?auto_208261 ) ) ( not ( = ?auto_208252 ?auto_208262 ) ) ( not ( = ?auto_208253 ?auto_208254 ) ) ( not ( = ?auto_208253 ?auto_208255 ) ) ( not ( = ?auto_208253 ?auto_208256 ) ) ( not ( = ?auto_208253 ?auto_208257 ) ) ( not ( = ?auto_208253 ?auto_208258 ) ) ( not ( = ?auto_208253 ?auto_208259 ) ) ( not ( = ?auto_208253 ?auto_208260 ) ) ( not ( = ?auto_208253 ?auto_208261 ) ) ( not ( = ?auto_208253 ?auto_208262 ) ) ( not ( = ?auto_208254 ?auto_208255 ) ) ( not ( = ?auto_208254 ?auto_208256 ) ) ( not ( = ?auto_208254 ?auto_208257 ) ) ( not ( = ?auto_208254 ?auto_208258 ) ) ( not ( = ?auto_208254 ?auto_208259 ) ) ( not ( = ?auto_208254 ?auto_208260 ) ) ( not ( = ?auto_208254 ?auto_208261 ) ) ( not ( = ?auto_208254 ?auto_208262 ) ) ( not ( = ?auto_208255 ?auto_208256 ) ) ( not ( = ?auto_208255 ?auto_208257 ) ) ( not ( = ?auto_208255 ?auto_208258 ) ) ( not ( = ?auto_208255 ?auto_208259 ) ) ( not ( = ?auto_208255 ?auto_208260 ) ) ( not ( = ?auto_208255 ?auto_208261 ) ) ( not ( = ?auto_208255 ?auto_208262 ) ) ( not ( = ?auto_208256 ?auto_208257 ) ) ( not ( = ?auto_208256 ?auto_208258 ) ) ( not ( = ?auto_208256 ?auto_208259 ) ) ( not ( = ?auto_208256 ?auto_208260 ) ) ( not ( = ?auto_208256 ?auto_208261 ) ) ( not ( = ?auto_208256 ?auto_208262 ) ) ( not ( = ?auto_208257 ?auto_208258 ) ) ( not ( = ?auto_208257 ?auto_208259 ) ) ( not ( = ?auto_208257 ?auto_208260 ) ) ( not ( = ?auto_208257 ?auto_208261 ) ) ( not ( = ?auto_208257 ?auto_208262 ) ) ( not ( = ?auto_208258 ?auto_208259 ) ) ( not ( = ?auto_208258 ?auto_208260 ) ) ( not ( = ?auto_208258 ?auto_208261 ) ) ( not ( = ?auto_208258 ?auto_208262 ) ) ( not ( = ?auto_208259 ?auto_208260 ) ) ( not ( = ?auto_208259 ?auto_208261 ) ) ( not ( = ?auto_208259 ?auto_208262 ) ) ( not ( = ?auto_208260 ?auto_208261 ) ) ( not ( = ?auto_208260 ?auto_208262 ) ) ( not ( = ?auto_208261 ?auto_208262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_208261 ?auto_208262 )
      ( !STACK ?auto_208261 ?auto_208260 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208276 - BLOCK
      ?auto_208277 - BLOCK
      ?auto_208278 - BLOCK
      ?auto_208279 - BLOCK
      ?auto_208280 - BLOCK
      ?auto_208281 - BLOCK
      ?auto_208282 - BLOCK
      ?auto_208283 - BLOCK
      ?auto_208284 - BLOCK
      ?auto_208285 - BLOCK
      ?auto_208286 - BLOCK
      ?auto_208287 - BLOCK
      ?auto_208288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_208287 ) ( ON-TABLE ?auto_208288 ) ( CLEAR ?auto_208288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_208276 ) ( ON ?auto_208277 ?auto_208276 ) ( ON ?auto_208278 ?auto_208277 ) ( ON ?auto_208279 ?auto_208278 ) ( ON ?auto_208280 ?auto_208279 ) ( ON ?auto_208281 ?auto_208280 ) ( ON ?auto_208282 ?auto_208281 ) ( ON ?auto_208283 ?auto_208282 ) ( ON ?auto_208284 ?auto_208283 ) ( ON ?auto_208285 ?auto_208284 ) ( ON ?auto_208286 ?auto_208285 ) ( ON ?auto_208287 ?auto_208286 ) ( not ( = ?auto_208276 ?auto_208277 ) ) ( not ( = ?auto_208276 ?auto_208278 ) ) ( not ( = ?auto_208276 ?auto_208279 ) ) ( not ( = ?auto_208276 ?auto_208280 ) ) ( not ( = ?auto_208276 ?auto_208281 ) ) ( not ( = ?auto_208276 ?auto_208282 ) ) ( not ( = ?auto_208276 ?auto_208283 ) ) ( not ( = ?auto_208276 ?auto_208284 ) ) ( not ( = ?auto_208276 ?auto_208285 ) ) ( not ( = ?auto_208276 ?auto_208286 ) ) ( not ( = ?auto_208276 ?auto_208287 ) ) ( not ( = ?auto_208276 ?auto_208288 ) ) ( not ( = ?auto_208277 ?auto_208278 ) ) ( not ( = ?auto_208277 ?auto_208279 ) ) ( not ( = ?auto_208277 ?auto_208280 ) ) ( not ( = ?auto_208277 ?auto_208281 ) ) ( not ( = ?auto_208277 ?auto_208282 ) ) ( not ( = ?auto_208277 ?auto_208283 ) ) ( not ( = ?auto_208277 ?auto_208284 ) ) ( not ( = ?auto_208277 ?auto_208285 ) ) ( not ( = ?auto_208277 ?auto_208286 ) ) ( not ( = ?auto_208277 ?auto_208287 ) ) ( not ( = ?auto_208277 ?auto_208288 ) ) ( not ( = ?auto_208278 ?auto_208279 ) ) ( not ( = ?auto_208278 ?auto_208280 ) ) ( not ( = ?auto_208278 ?auto_208281 ) ) ( not ( = ?auto_208278 ?auto_208282 ) ) ( not ( = ?auto_208278 ?auto_208283 ) ) ( not ( = ?auto_208278 ?auto_208284 ) ) ( not ( = ?auto_208278 ?auto_208285 ) ) ( not ( = ?auto_208278 ?auto_208286 ) ) ( not ( = ?auto_208278 ?auto_208287 ) ) ( not ( = ?auto_208278 ?auto_208288 ) ) ( not ( = ?auto_208279 ?auto_208280 ) ) ( not ( = ?auto_208279 ?auto_208281 ) ) ( not ( = ?auto_208279 ?auto_208282 ) ) ( not ( = ?auto_208279 ?auto_208283 ) ) ( not ( = ?auto_208279 ?auto_208284 ) ) ( not ( = ?auto_208279 ?auto_208285 ) ) ( not ( = ?auto_208279 ?auto_208286 ) ) ( not ( = ?auto_208279 ?auto_208287 ) ) ( not ( = ?auto_208279 ?auto_208288 ) ) ( not ( = ?auto_208280 ?auto_208281 ) ) ( not ( = ?auto_208280 ?auto_208282 ) ) ( not ( = ?auto_208280 ?auto_208283 ) ) ( not ( = ?auto_208280 ?auto_208284 ) ) ( not ( = ?auto_208280 ?auto_208285 ) ) ( not ( = ?auto_208280 ?auto_208286 ) ) ( not ( = ?auto_208280 ?auto_208287 ) ) ( not ( = ?auto_208280 ?auto_208288 ) ) ( not ( = ?auto_208281 ?auto_208282 ) ) ( not ( = ?auto_208281 ?auto_208283 ) ) ( not ( = ?auto_208281 ?auto_208284 ) ) ( not ( = ?auto_208281 ?auto_208285 ) ) ( not ( = ?auto_208281 ?auto_208286 ) ) ( not ( = ?auto_208281 ?auto_208287 ) ) ( not ( = ?auto_208281 ?auto_208288 ) ) ( not ( = ?auto_208282 ?auto_208283 ) ) ( not ( = ?auto_208282 ?auto_208284 ) ) ( not ( = ?auto_208282 ?auto_208285 ) ) ( not ( = ?auto_208282 ?auto_208286 ) ) ( not ( = ?auto_208282 ?auto_208287 ) ) ( not ( = ?auto_208282 ?auto_208288 ) ) ( not ( = ?auto_208283 ?auto_208284 ) ) ( not ( = ?auto_208283 ?auto_208285 ) ) ( not ( = ?auto_208283 ?auto_208286 ) ) ( not ( = ?auto_208283 ?auto_208287 ) ) ( not ( = ?auto_208283 ?auto_208288 ) ) ( not ( = ?auto_208284 ?auto_208285 ) ) ( not ( = ?auto_208284 ?auto_208286 ) ) ( not ( = ?auto_208284 ?auto_208287 ) ) ( not ( = ?auto_208284 ?auto_208288 ) ) ( not ( = ?auto_208285 ?auto_208286 ) ) ( not ( = ?auto_208285 ?auto_208287 ) ) ( not ( = ?auto_208285 ?auto_208288 ) ) ( not ( = ?auto_208286 ?auto_208287 ) ) ( not ( = ?auto_208286 ?auto_208288 ) ) ( not ( = ?auto_208287 ?auto_208288 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_208288 )
      ( !STACK ?auto_208288 ?auto_208287 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208302 - BLOCK
      ?auto_208303 - BLOCK
      ?auto_208304 - BLOCK
      ?auto_208305 - BLOCK
      ?auto_208306 - BLOCK
      ?auto_208307 - BLOCK
      ?auto_208308 - BLOCK
      ?auto_208309 - BLOCK
      ?auto_208310 - BLOCK
      ?auto_208311 - BLOCK
      ?auto_208312 - BLOCK
      ?auto_208313 - BLOCK
      ?auto_208314 - BLOCK
    )
    :vars
    (
      ?auto_208315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208314 ?auto_208315 ) ( ON-TABLE ?auto_208302 ) ( ON ?auto_208303 ?auto_208302 ) ( ON ?auto_208304 ?auto_208303 ) ( ON ?auto_208305 ?auto_208304 ) ( ON ?auto_208306 ?auto_208305 ) ( ON ?auto_208307 ?auto_208306 ) ( ON ?auto_208308 ?auto_208307 ) ( ON ?auto_208309 ?auto_208308 ) ( ON ?auto_208310 ?auto_208309 ) ( ON ?auto_208311 ?auto_208310 ) ( ON ?auto_208312 ?auto_208311 ) ( not ( = ?auto_208302 ?auto_208303 ) ) ( not ( = ?auto_208302 ?auto_208304 ) ) ( not ( = ?auto_208302 ?auto_208305 ) ) ( not ( = ?auto_208302 ?auto_208306 ) ) ( not ( = ?auto_208302 ?auto_208307 ) ) ( not ( = ?auto_208302 ?auto_208308 ) ) ( not ( = ?auto_208302 ?auto_208309 ) ) ( not ( = ?auto_208302 ?auto_208310 ) ) ( not ( = ?auto_208302 ?auto_208311 ) ) ( not ( = ?auto_208302 ?auto_208312 ) ) ( not ( = ?auto_208302 ?auto_208313 ) ) ( not ( = ?auto_208302 ?auto_208314 ) ) ( not ( = ?auto_208302 ?auto_208315 ) ) ( not ( = ?auto_208303 ?auto_208304 ) ) ( not ( = ?auto_208303 ?auto_208305 ) ) ( not ( = ?auto_208303 ?auto_208306 ) ) ( not ( = ?auto_208303 ?auto_208307 ) ) ( not ( = ?auto_208303 ?auto_208308 ) ) ( not ( = ?auto_208303 ?auto_208309 ) ) ( not ( = ?auto_208303 ?auto_208310 ) ) ( not ( = ?auto_208303 ?auto_208311 ) ) ( not ( = ?auto_208303 ?auto_208312 ) ) ( not ( = ?auto_208303 ?auto_208313 ) ) ( not ( = ?auto_208303 ?auto_208314 ) ) ( not ( = ?auto_208303 ?auto_208315 ) ) ( not ( = ?auto_208304 ?auto_208305 ) ) ( not ( = ?auto_208304 ?auto_208306 ) ) ( not ( = ?auto_208304 ?auto_208307 ) ) ( not ( = ?auto_208304 ?auto_208308 ) ) ( not ( = ?auto_208304 ?auto_208309 ) ) ( not ( = ?auto_208304 ?auto_208310 ) ) ( not ( = ?auto_208304 ?auto_208311 ) ) ( not ( = ?auto_208304 ?auto_208312 ) ) ( not ( = ?auto_208304 ?auto_208313 ) ) ( not ( = ?auto_208304 ?auto_208314 ) ) ( not ( = ?auto_208304 ?auto_208315 ) ) ( not ( = ?auto_208305 ?auto_208306 ) ) ( not ( = ?auto_208305 ?auto_208307 ) ) ( not ( = ?auto_208305 ?auto_208308 ) ) ( not ( = ?auto_208305 ?auto_208309 ) ) ( not ( = ?auto_208305 ?auto_208310 ) ) ( not ( = ?auto_208305 ?auto_208311 ) ) ( not ( = ?auto_208305 ?auto_208312 ) ) ( not ( = ?auto_208305 ?auto_208313 ) ) ( not ( = ?auto_208305 ?auto_208314 ) ) ( not ( = ?auto_208305 ?auto_208315 ) ) ( not ( = ?auto_208306 ?auto_208307 ) ) ( not ( = ?auto_208306 ?auto_208308 ) ) ( not ( = ?auto_208306 ?auto_208309 ) ) ( not ( = ?auto_208306 ?auto_208310 ) ) ( not ( = ?auto_208306 ?auto_208311 ) ) ( not ( = ?auto_208306 ?auto_208312 ) ) ( not ( = ?auto_208306 ?auto_208313 ) ) ( not ( = ?auto_208306 ?auto_208314 ) ) ( not ( = ?auto_208306 ?auto_208315 ) ) ( not ( = ?auto_208307 ?auto_208308 ) ) ( not ( = ?auto_208307 ?auto_208309 ) ) ( not ( = ?auto_208307 ?auto_208310 ) ) ( not ( = ?auto_208307 ?auto_208311 ) ) ( not ( = ?auto_208307 ?auto_208312 ) ) ( not ( = ?auto_208307 ?auto_208313 ) ) ( not ( = ?auto_208307 ?auto_208314 ) ) ( not ( = ?auto_208307 ?auto_208315 ) ) ( not ( = ?auto_208308 ?auto_208309 ) ) ( not ( = ?auto_208308 ?auto_208310 ) ) ( not ( = ?auto_208308 ?auto_208311 ) ) ( not ( = ?auto_208308 ?auto_208312 ) ) ( not ( = ?auto_208308 ?auto_208313 ) ) ( not ( = ?auto_208308 ?auto_208314 ) ) ( not ( = ?auto_208308 ?auto_208315 ) ) ( not ( = ?auto_208309 ?auto_208310 ) ) ( not ( = ?auto_208309 ?auto_208311 ) ) ( not ( = ?auto_208309 ?auto_208312 ) ) ( not ( = ?auto_208309 ?auto_208313 ) ) ( not ( = ?auto_208309 ?auto_208314 ) ) ( not ( = ?auto_208309 ?auto_208315 ) ) ( not ( = ?auto_208310 ?auto_208311 ) ) ( not ( = ?auto_208310 ?auto_208312 ) ) ( not ( = ?auto_208310 ?auto_208313 ) ) ( not ( = ?auto_208310 ?auto_208314 ) ) ( not ( = ?auto_208310 ?auto_208315 ) ) ( not ( = ?auto_208311 ?auto_208312 ) ) ( not ( = ?auto_208311 ?auto_208313 ) ) ( not ( = ?auto_208311 ?auto_208314 ) ) ( not ( = ?auto_208311 ?auto_208315 ) ) ( not ( = ?auto_208312 ?auto_208313 ) ) ( not ( = ?auto_208312 ?auto_208314 ) ) ( not ( = ?auto_208312 ?auto_208315 ) ) ( not ( = ?auto_208313 ?auto_208314 ) ) ( not ( = ?auto_208313 ?auto_208315 ) ) ( not ( = ?auto_208314 ?auto_208315 ) ) ( CLEAR ?auto_208312 ) ( ON ?auto_208313 ?auto_208314 ) ( CLEAR ?auto_208313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_208302 ?auto_208303 ?auto_208304 ?auto_208305 ?auto_208306 ?auto_208307 ?auto_208308 ?auto_208309 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 )
      ( MAKE-13PILE ?auto_208302 ?auto_208303 ?auto_208304 ?auto_208305 ?auto_208306 ?auto_208307 ?auto_208308 ?auto_208309 ?auto_208310 ?auto_208311 ?auto_208312 ?auto_208313 ?auto_208314 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208329 - BLOCK
      ?auto_208330 - BLOCK
      ?auto_208331 - BLOCK
      ?auto_208332 - BLOCK
      ?auto_208333 - BLOCK
      ?auto_208334 - BLOCK
      ?auto_208335 - BLOCK
      ?auto_208336 - BLOCK
      ?auto_208337 - BLOCK
      ?auto_208338 - BLOCK
      ?auto_208339 - BLOCK
      ?auto_208340 - BLOCK
      ?auto_208341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208341 ) ( ON-TABLE ?auto_208329 ) ( ON ?auto_208330 ?auto_208329 ) ( ON ?auto_208331 ?auto_208330 ) ( ON ?auto_208332 ?auto_208331 ) ( ON ?auto_208333 ?auto_208332 ) ( ON ?auto_208334 ?auto_208333 ) ( ON ?auto_208335 ?auto_208334 ) ( ON ?auto_208336 ?auto_208335 ) ( ON ?auto_208337 ?auto_208336 ) ( ON ?auto_208338 ?auto_208337 ) ( ON ?auto_208339 ?auto_208338 ) ( not ( = ?auto_208329 ?auto_208330 ) ) ( not ( = ?auto_208329 ?auto_208331 ) ) ( not ( = ?auto_208329 ?auto_208332 ) ) ( not ( = ?auto_208329 ?auto_208333 ) ) ( not ( = ?auto_208329 ?auto_208334 ) ) ( not ( = ?auto_208329 ?auto_208335 ) ) ( not ( = ?auto_208329 ?auto_208336 ) ) ( not ( = ?auto_208329 ?auto_208337 ) ) ( not ( = ?auto_208329 ?auto_208338 ) ) ( not ( = ?auto_208329 ?auto_208339 ) ) ( not ( = ?auto_208329 ?auto_208340 ) ) ( not ( = ?auto_208329 ?auto_208341 ) ) ( not ( = ?auto_208330 ?auto_208331 ) ) ( not ( = ?auto_208330 ?auto_208332 ) ) ( not ( = ?auto_208330 ?auto_208333 ) ) ( not ( = ?auto_208330 ?auto_208334 ) ) ( not ( = ?auto_208330 ?auto_208335 ) ) ( not ( = ?auto_208330 ?auto_208336 ) ) ( not ( = ?auto_208330 ?auto_208337 ) ) ( not ( = ?auto_208330 ?auto_208338 ) ) ( not ( = ?auto_208330 ?auto_208339 ) ) ( not ( = ?auto_208330 ?auto_208340 ) ) ( not ( = ?auto_208330 ?auto_208341 ) ) ( not ( = ?auto_208331 ?auto_208332 ) ) ( not ( = ?auto_208331 ?auto_208333 ) ) ( not ( = ?auto_208331 ?auto_208334 ) ) ( not ( = ?auto_208331 ?auto_208335 ) ) ( not ( = ?auto_208331 ?auto_208336 ) ) ( not ( = ?auto_208331 ?auto_208337 ) ) ( not ( = ?auto_208331 ?auto_208338 ) ) ( not ( = ?auto_208331 ?auto_208339 ) ) ( not ( = ?auto_208331 ?auto_208340 ) ) ( not ( = ?auto_208331 ?auto_208341 ) ) ( not ( = ?auto_208332 ?auto_208333 ) ) ( not ( = ?auto_208332 ?auto_208334 ) ) ( not ( = ?auto_208332 ?auto_208335 ) ) ( not ( = ?auto_208332 ?auto_208336 ) ) ( not ( = ?auto_208332 ?auto_208337 ) ) ( not ( = ?auto_208332 ?auto_208338 ) ) ( not ( = ?auto_208332 ?auto_208339 ) ) ( not ( = ?auto_208332 ?auto_208340 ) ) ( not ( = ?auto_208332 ?auto_208341 ) ) ( not ( = ?auto_208333 ?auto_208334 ) ) ( not ( = ?auto_208333 ?auto_208335 ) ) ( not ( = ?auto_208333 ?auto_208336 ) ) ( not ( = ?auto_208333 ?auto_208337 ) ) ( not ( = ?auto_208333 ?auto_208338 ) ) ( not ( = ?auto_208333 ?auto_208339 ) ) ( not ( = ?auto_208333 ?auto_208340 ) ) ( not ( = ?auto_208333 ?auto_208341 ) ) ( not ( = ?auto_208334 ?auto_208335 ) ) ( not ( = ?auto_208334 ?auto_208336 ) ) ( not ( = ?auto_208334 ?auto_208337 ) ) ( not ( = ?auto_208334 ?auto_208338 ) ) ( not ( = ?auto_208334 ?auto_208339 ) ) ( not ( = ?auto_208334 ?auto_208340 ) ) ( not ( = ?auto_208334 ?auto_208341 ) ) ( not ( = ?auto_208335 ?auto_208336 ) ) ( not ( = ?auto_208335 ?auto_208337 ) ) ( not ( = ?auto_208335 ?auto_208338 ) ) ( not ( = ?auto_208335 ?auto_208339 ) ) ( not ( = ?auto_208335 ?auto_208340 ) ) ( not ( = ?auto_208335 ?auto_208341 ) ) ( not ( = ?auto_208336 ?auto_208337 ) ) ( not ( = ?auto_208336 ?auto_208338 ) ) ( not ( = ?auto_208336 ?auto_208339 ) ) ( not ( = ?auto_208336 ?auto_208340 ) ) ( not ( = ?auto_208336 ?auto_208341 ) ) ( not ( = ?auto_208337 ?auto_208338 ) ) ( not ( = ?auto_208337 ?auto_208339 ) ) ( not ( = ?auto_208337 ?auto_208340 ) ) ( not ( = ?auto_208337 ?auto_208341 ) ) ( not ( = ?auto_208338 ?auto_208339 ) ) ( not ( = ?auto_208338 ?auto_208340 ) ) ( not ( = ?auto_208338 ?auto_208341 ) ) ( not ( = ?auto_208339 ?auto_208340 ) ) ( not ( = ?auto_208339 ?auto_208341 ) ) ( not ( = ?auto_208340 ?auto_208341 ) ) ( CLEAR ?auto_208339 ) ( ON ?auto_208340 ?auto_208341 ) ( CLEAR ?auto_208340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_208329 ?auto_208330 ?auto_208331 ?auto_208332 ?auto_208333 ?auto_208334 ?auto_208335 ?auto_208336 ?auto_208337 ?auto_208338 ?auto_208339 ?auto_208340 )
      ( MAKE-13PILE ?auto_208329 ?auto_208330 ?auto_208331 ?auto_208332 ?auto_208333 ?auto_208334 ?auto_208335 ?auto_208336 ?auto_208337 ?auto_208338 ?auto_208339 ?auto_208340 ?auto_208341 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208355 - BLOCK
      ?auto_208356 - BLOCK
      ?auto_208357 - BLOCK
      ?auto_208358 - BLOCK
      ?auto_208359 - BLOCK
      ?auto_208360 - BLOCK
      ?auto_208361 - BLOCK
      ?auto_208362 - BLOCK
      ?auto_208363 - BLOCK
      ?auto_208364 - BLOCK
      ?auto_208365 - BLOCK
      ?auto_208366 - BLOCK
      ?auto_208367 - BLOCK
    )
    :vars
    (
      ?auto_208368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208367 ?auto_208368 ) ( ON-TABLE ?auto_208355 ) ( ON ?auto_208356 ?auto_208355 ) ( ON ?auto_208357 ?auto_208356 ) ( ON ?auto_208358 ?auto_208357 ) ( ON ?auto_208359 ?auto_208358 ) ( ON ?auto_208360 ?auto_208359 ) ( ON ?auto_208361 ?auto_208360 ) ( ON ?auto_208362 ?auto_208361 ) ( ON ?auto_208363 ?auto_208362 ) ( ON ?auto_208364 ?auto_208363 ) ( not ( = ?auto_208355 ?auto_208356 ) ) ( not ( = ?auto_208355 ?auto_208357 ) ) ( not ( = ?auto_208355 ?auto_208358 ) ) ( not ( = ?auto_208355 ?auto_208359 ) ) ( not ( = ?auto_208355 ?auto_208360 ) ) ( not ( = ?auto_208355 ?auto_208361 ) ) ( not ( = ?auto_208355 ?auto_208362 ) ) ( not ( = ?auto_208355 ?auto_208363 ) ) ( not ( = ?auto_208355 ?auto_208364 ) ) ( not ( = ?auto_208355 ?auto_208365 ) ) ( not ( = ?auto_208355 ?auto_208366 ) ) ( not ( = ?auto_208355 ?auto_208367 ) ) ( not ( = ?auto_208355 ?auto_208368 ) ) ( not ( = ?auto_208356 ?auto_208357 ) ) ( not ( = ?auto_208356 ?auto_208358 ) ) ( not ( = ?auto_208356 ?auto_208359 ) ) ( not ( = ?auto_208356 ?auto_208360 ) ) ( not ( = ?auto_208356 ?auto_208361 ) ) ( not ( = ?auto_208356 ?auto_208362 ) ) ( not ( = ?auto_208356 ?auto_208363 ) ) ( not ( = ?auto_208356 ?auto_208364 ) ) ( not ( = ?auto_208356 ?auto_208365 ) ) ( not ( = ?auto_208356 ?auto_208366 ) ) ( not ( = ?auto_208356 ?auto_208367 ) ) ( not ( = ?auto_208356 ?auto_208368 ) ) ( not ( = ?auto_208357 ?auto_208358 ) ) ( not ( = ?auto_208357 ?auto_208359 ) ) ( not ( = ?auto_208357 ?auto_208360 ) ) ( not ( = ?auto_208357 ?auto_208361 ) ) ( not ( = ?auto_208357 ?auto_208362 ) ) ( not ( = ?auto_208357 ?auto_208363 ) ) ( not ( = ?auto_208357 ?auto_208364 ) ) ( not ( = ?auto_208357 ?auto_208365 ) ) ( not ( = ?auto_208357 ?auto_208366 ) ) ( not ( = ?auto_208357 ?auto_208367 ) ) ( not ( = ?auto_208357 ?auto_208368 ) ) ( not ( = ?auto_208358 ?auto_208359 ) ) ( not ( = ?auto_208358 ?auto_208360 ) ) ( not ( = ?auto_208358 ?auto_208361 ) ) ( not ( = ?auto_208358 ?auto_208362 ) ) ( not ( = ?auto_208358 ?auto_208363 ) ) ( not ( = ?auto_208358 ?auto_208364 ) ) ( not ( = ?auto_208358 ?auto_208365 ) ) ( not ( = ?auto_208358 ?auto_208366 ) ) ( not ( = ?auto_208358 ?auto_208367 ) ) ( not ( = ?auto_208358 ?auto_208368 ) ) ( not ( = ?auto_208359 ?auto_208360 ) ) ( not ( = ?auto_208359 ?auto_208361 ) ) ( not ( = ?auto_208359 ?auto_208362 ) ) ( not ( = ?auto_208359 ?auto_208363 ) ) ( not ( = ?auto_208359 ?auto_208364 ) ) ( not ( = ?auto_208359 ?auto_208365 ) ) ( not ( = ?auto_208359 ?auto_208366 ) ) ( not ( = ?auto_208359 ?auto_208367 ) ) ( not ( = ?auto_208359 ?auto_208368 ) ) ( not ( = ?auto_208360 ?auto_208361 ) ) ( not ( = ?auto_208360 ?auto_208362 ) ) ( not ( = ?auto_208360 ?auto_208363 ) ) ( not ( = ?auto_208360 ?auto_208364 ) ) ( not ( = ?auto_208360 ?auto_208365 ) ) ( not ( = ?auto_208360 ?auto_208366 ) ) ( not ( = ?auto_208360 ?auto_208367 ) ) ( not ( = ?auto_208360 ?auto_208368 ) ) ( not ( = ?auto_208361 ?auto_208362 ) ) ( not ( = ?auto_208361 ?auto_208363 ) ) ( not ( = ?auto_208361 ?auto_208364 ) ) ( not ( = ?auto_208361 ?auto_208365 ) ) ( not ( = ?auto_208361 ?auto_208366 ) ) ( not ( = ?auto_208361 ?auto_208367 ) ) ( not ( = ?auto_208361 ?auto_208368 ) ) ( not ( = ?auto_208362 ?auto_208363 ) ) ( not ( = ?auto_208362 ?auto_208364 ) ) ( not ( = ?auto_208362 ?auto_208365 ) ) ( not ( = ?auto_208362 ?auto_208366 ) ) ( not ( = ?auto_208362 ?auto_208367 ) ) ( not ( = ?auto_208362 ?auto_208368 ) ) ( not ( = ?auto_208363 ?auto_208364 ) ) ( not ( = ?auto_208363 ?auto_208365 ) ) ( not ( = ?auto_208363 ?auto_208366 ) ) ( not ( = ?auto_208363 ?auto_208367 ) ) ( not ( = ?auto_208363 ?auto_208368 ) ) ( not ( = ?auto_208364 ?auto_208365 ) ) ( not ( = ?auto_208364 ?auto_208366 ) ) ( not ( = ?auto_208364 ?auto_208367 ) ) ( not ( = ?auto_208364 ?auto_208368 ) ) ( not ( = ?auto_208365 ?auto_208366 ) ) ( not ( = ?auto_208365 ?auto_208367 ) ) ( not ( = ?auto_208365 ?auto_208368 ) ) ( not ( = ?auto_208366 ?auto_208367 ) ) ( not ( = ?auto_208366 ?auto_208368 ) ) ( not ( = ?auto_208367 ?auto_208368 ) ) ( ON ?auto_208366 ?auto_208367 ) ( CLEAR ?auto_208364 ) ( ON ?auto_208365 ?auto_208366 ) ( CLEAR ?auto_208365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_208355 ?auto_208356 ?auto_208357 ?auto_208358 ?auto_208359 ?auto_208360 ?auto_208361 ?auto_208362 ?auto_208363 ?auto_208364 ?auto_208365 )
      ( MAKE-13PILE ?auto_208355 ?auto_208356 ?auto_208357 ?auto_208358 ?auto_208359 ?auto_208360 ?auto_208361 ?auto_208362 ?auto_208363 ?auto_208364 ?auto_208365 ?auto_208366 ?auto_208367 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208382 - BLOCK
      ?auto_208383 - BLOCK
      ?auto_208384 - BLOCK
      ?auto_208385 - BLOCK
      ?auto_208386 - BLOCK
      ?auto_208387 - BLOCK
      ?auto_208388 - BLOCK
      ?auto_208389 - BLOCK
      ?auto_208390 - BLOCK
      ?auto_208391 - BLOCK
      ?auto_208392 - BLOCK
      ?auto_208393 - BLOCK
      ?auto_208394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208394 ) ( ON-TABLE ?auto_208382 ) ( ON ?auto_208383 ?auto_208382 ) ( ON ?auto_208384 ?auto_208383 ) ( ON ?auto_208385 ?auto_208384 ) ( ON ?auto_208386 ?auto_208385 ) ( ON ?auto_208387 ?auto_208386 ) ( ON ?auto_208388 ?auto_208387 ) ( ON ?auto_208389 ?auto_208388 ) ( ON ?auto_208390 ?auto_208389 ) ( ON ?auto_208391 ?auto_208390 ) ( not ( = ?auto_208382 ?auto_208383 ) ) ( not ( = ?auto_208382 ?auto_208384 ) ) ( not ( = ?auto_208382 ?auto_208385 ) ) ( not ( = ?auto_208382 ?auto_208386 ) ) ( not ( = ?auto_208382 ?auto_208387 ) ) ( not ( = ?auto_208382 ?auto_208388 ) ) ( not ( = ?auto_208382 ?auto_208389 ) ) ( not ( = ?auto_208382 ?auto_208390 ) ) ( not ( = ?auto_208382 ?auto_208391 ) ) ( not ( = ?auto_208382 ?auto_208392 ) ) ( not ( = ?auto_208382 ?auto_208393 ) ) ( not ( = ?auto_208382 ?auto_208394 ) ) ( not ( = ?auto_208383 ?auto_208384 ) ) ( not ( = ?auto_208383 ?auto_208385 ) ) ( not ( = ?auto_208383 ?auto_208386 ) ) ( not ( = ?auto_208383 ?auto_208387 ) ) ( not ( = ?auto_208383 ?auto_208388 ) ) ( not ( = ?auto_208383 ?auto_208389 ) ) ( not ( = ?auto_208383 ?auto_208390 ) ) ( not ( = ?auto_208383 ?auto_208391 ) ) ( not ( = ?auto_208383 ?auto_208392 ) ) ( not ( = ?auto_208383 ?auto_208393 ) ) ( not ( = ?auto_208383 ?auto_208394 ) ) ( not ( = ?auto_208384 ?auto_208385 ) ) ( not ( = ?auto_208384 ?auto_208386 ) ) ( not ( = ?auto_208384 ?auto_208387 ) ) ( not ( = ?auto_208384 ?auto_208388 ) ) ( not ( = ?auto_208384 ?auto_208389 ) ) ( not ( = ?auto_208384 ?auto_208390 ) ) ( not ( = ?auto_208384 ?auto_208391 ) ) ( not ( = ?auto_208384 ?auto_208392 ) ) ( not ( = ?auto_208384 ?auto_208393 ) ) ( not ( = ?auto_208384 ?auto_208394 ) ) ( not ( = ?auto_208385 ?auto_208386 ) ) ( not ( = ?auto_208385 ?auto_208387 ) ) ( not ( = ?auto_208385 ?auto_208388 ) ) ( not ( = ?auto_208385 ?auto_208389 ) ) ( not ( = ?auto_208385 ?auto_208390 ) ) ( not ( = ?auto_208385 ?auto_208391 ) ) ( not ( = ?auto_208385 ?auto_208392 ) ) ( not ( = ?auto_208385 ?auto_208393 ) ) ( not ( = ?auto_208385 ?auto_208394 ) ) ( not ( = ?auto_208386 ?auto_208387 ) ) ( not ( = ?auto_208386 ?auto_208388 ) ) ( not ( = ?auto_208386 ?auto_208389 ) ) ( not ( = ?auto_208386 ?auto_208390 ) ) ( not ( = ?auto_208386 ?auto_208391 ) ) ( not ( = ?auto_208386 ?auto_208392 ) ) ( not ( = ?auto_208386 ?auto_208393 ) ) ( not ( = ?auto_208386 ?auto_208394 ) ) ( not ( = ?auto_208387 ?auto_208388 ) ) ( not ( = ?auto_208387 ?auto_208389 ) ) ( not ( = ?auto_208387 ?auto_208390 ) ) ( not ( = ?auto_208387 ?auto_208391 ) ) ( not ( = ?auto_208387 ?auto_208392 ) ) ( not ( = ?auto_208387 ?auto_208393 ) ) ( not ( = ?auto_208387 ?auto_208394 ) ) ( not ( = ?auto_208388 ?auto_208389 ) ) ( not ( = ?auto_208388 ?auto_208390 ) ) ( not ( = ?auto_208388 ?auto_208391 ) ) ( not ( = ?auto_208388 ?auto_208392 ) ) ( not ( = ?auto_208388 ?auto_208393 ) ) ( not ( = ?auto_208388 ?auto_208394 ) ) ( not ( = ?auto_208389 ?auto_208390 ) ) ( not ( = ?auto_208389 ?auto_208391 ) ) ( not ( = ?auto_208389 ?auto_208392 ) ) ( not ( = ?auto_208389 ?auto_208393 ) ) ( not ( = ?auto_208389 ?auto_208394 ) ) ( not ( = ?auto_208390 ?auto_208391 ) ) ( not ( = ?auto_208390 ?auto_208392 ) ) ( not ( = ?auto_208390 ?auto_208393 ) ) ( not ( = ?auto_208390 ?auto_208394 ) ) ( not ( = ?auto_208391 ?auto_208392 ) ) ( not ( = ?auto_208391 ?auto_208393 ) ) ( not ( = ?auto_208391 ?auto_208394 ) ) ( not ( = ?auto_208392 ?auto_208393 ) ) ( not ( = ?auto_208392 ?auto_208394 ) ) ( not ( = ?auto_208393 ?auto_208394 ) ) ( ON ?auto_208393 ?auto_208394 ) ( CLEAR ?auto_208391 ) ( ON ?auto_208392 ?auto_208393 ) ( CLEAR ?auto_208392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_208382 ?auto_208383 ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 ?auto_208388 ?auto_208389 ?auto_208390 ?auto_208391 ?auto_208392 )
      ( MAKE-13PILE ?auto_208382 ?auto_208383 ?auto_208384 ?auto_208385 ?auto_208386 ?auto_208387 ?auto_208388 ?auto_208389 ?auto_208390 ?auto_208391 ?auto_208392 ?auto_208393 ?auto_208394 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208408 - BLOCK
      ?auto_208409 - BLOCK
      ?auto_208410 - BLOCK
      ?auto_208411 - BLOCK
      ?auto_208412 - BLOCK
      ?auto_208413 - BLOCK
      ?auto_208414 - BLOCK
      ?auto_208415 - BLOCK
      ?auto_208416 - BLOCK
      ?auto_208417 - BLOCK
      ?auto_208418 - BLOCK
      ?auto_208419 - BLOCK
      ?auto_208420 - BLOCK
    )
    :vars
    (
      ?auto_208421 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208420 ?auto_208421 ) ( ON-TABLE ?auto_208408 ) ( ON ?auto_208409 ?auto_208408 ) ( ON ?auto_208410 ?auto_208409 ) ( ON ?auto_208411 ?auto_208410 ) ( ON ?auto_208412 ?auto_208411 ) ( ON ?auto_208413 ?auto_208412 ) ( ON ?auto_208414 ?auto_208413 ) ( ON ?auto_208415 ?auto_208414 ) ( ON ?auto_208416 ?auto_208415 ) ( not ( = ?auto_208408 ?auto_208409 ) ) ( not ( = ?auto_208408 ?auto_208410 ) ) ( not ( = ?auto_208408 ?auto_208411 ) ) ( not ( = ?auto_208408 ?auto_208412 ) ) ( not ( = ?auto_208408 ?auto_208413 ) ) ( not ( = ?auto_208408 ?auto_208414 ) ) ( not ( = ?auto_208408 ?auto_208415 ) ) ( not ( = ?auto_208408 ?auto_208416 ) ) ( not ( = ?auto_208408 ?auto_208417 ) ) ( not ( = ?auto_208408 ?auto_208418 ) ) ( not ( = ?auto_208408 ?auto_208419 ) ) ( not ( = ?auto_208408 ?auto_208420 ) ) ( not ( = ?auto_208408 ?auto_208421 ) ) ( not ( = ?auto_208409 ?auto_208410 ) ) ( not ( = ?auto_208409 ?auto_208411 ) ) ( not ( = ?auto_208409 ?auto_208412 ) ) ( not ( = ?auto_208409 ?auto_208413 ) ) ( not ( = ?auto_208409 ?auto_208414 ) ) ( not ( = ?auto_208409 ?auto_208415 ) ) ( not ( = ?auto_208409 ?auto_208416 ) ) ( not ( = ?auto_208409 ?auto_208417 ) ) ( not ( = ?auto_208409 ?auto_208418 ) ) ( not ( = ?auto_208409 ?auto_208419 ) ) ( not ( = ?auto_208409 ?auto_208420 ) ) ( not ( = ?auto_208409 ?auto_208421 ) ) ( not ( = ?auto_208410 ?auto_208411 ) ) ( not ( = ?auto_208410 ?auto_208412 ) ) ( not ( = ?auto_208410 ?auto_208413 ) ) ( not ( = ?auto_208410 ?auto_208414 ) ) ( not ( = ?auto_208410 ?auto_208415 ) ) ( not ( = ?auto_208410 ?auto_208416 ) ) ( not ( = ?auto_208410 ?auto_208417 ) ) ( not ( = ?auto_208410 ?auto_208418 ) ) ( not ( = ?auto_208410 ?auto_208419 ) ) ( not ( = ?auto_208410 ?auto_208420 ) ) ( not ( = ?auto_208410 ?auto_208421 ) ) ( not ( = ?auto_208411 ?auto_208412 ) ) ( not ( = ?auto_208411 ?auto_208413 ) ) ( not ( = ?auto_208411 ?auto_208414 ) ) ( not ( = ?auto_208411 ?auto_208415 ) ) ( not ( = ?auto_208411 ?auto_208416 ) ) ( not ( = ?auto_208411 ?auto_208417 ) ) ( not ( = ?auto_208411 ?auto_208418 ) ) ( not ( = ?auto_208411 ?auto_208419 ) ) ( not ( = ?auto_208411 ?auto_208420 ) ) ( not ( = ?auto_208411 ?auto_208421 ) ) ( not ( = ?auto_208412 ?auto_208413 ) ) ( not ( = ?auto_208412 ?auto_208414 ) ) ( not ( = ?auto_208412 ?auto_208415 ) ) ( not ( = ?auto_208412 ?auto_208416 ) ) ( not ( = ?auto_208412 ?auto_208417 ) ) ( not ( = ?auto_208412 ?auto_208418 ) ) ( not ( = ?auto_208412 ?auto_208419 ) ) ( not ( = ?auto_208412 ?auto_208420 ) ) ( not ( = ?auto_208412 ?auto_208421 ) ) ( not ( = ?auto_208413 ?auto_208414 ) ) ( not ( = ?auto_208413 ?auto_208415 ) ) ( not ( = ?auto_208413 ?auto_208416 ) ) ( not ( = ?auto_208413 ?auto_208417 ) ) ( not ( = ?auto_208413 ?auto_208418 ) ) ( not ( = ?auto_208413 ?auto_208419 ) ) ( not ( = ?auto_208413 ?auto_208420 ) ) ( not ( = ?auto_208413 ?auto_208421 ) ) ( not ( = ?auto_208414 ?auto_208415 ) ) ( not ( = ?auto_208414 ?auto_208416 ) ) ( not ( = ?auto_208414 ?auto_208417 ) ) ( not ( = ?auto_208414 ?auto_208418 ) ) ( not ( = ?auto_208414 ?auto_208419 ) ) ( not ( = ?auto_208414 ?auto_208420 ) ) ( not ( = ?auto_208414 ?auto_208421 ) ) ( not ( = ?auto_208415 ?auto_208416 ) ) ( not ( = ?auto_208415 ?auto_208417 ) ) ( not ( = ?auto_208415 ?auto_208418 ) ) ( not ( = ?auto_208415 ?auto_208419 ) ) ( not ( = ?auto_208415 ?auto_208420 ) ) ( not ( = ?auto_208415 ?auto_208421 ) ) ( not ( = ?auto_208416 ?auto_208417 ) ) ( not ( = ?auto_208416 ?auto_208418 ) ) ( not ( = ?auto_208416 ?auto_208419 ) ) ( not ( = ?auto_208416 ?auto_208420 ) ) ( not ( = ?auto_208416 ?auto_208421 ) ) ( not ( = ?auto_208417 ?auto_208418 ) ) ( not ( = ?auto_208417 ?auto_208419 ) ) ( not ( = ?auto_208417 ?auto_208420 ) ) ( not ( = ?auto_208417 ?auto_208421 ) ) ( not ( = ?auto_208418 ?auto_208419 ) ) ( not ( = ?auto_208418 ?auto_208420 ) ) ( not ( = ?auto_208418 ?auto_208421 ) ) ( not ( = ?auto_208419 ?auto_208420 ) ) ( not ( = ?auto_208419 ?auto_208421 ) ) ( not ( = ?auto_208420 ?auto_208421 ) ) ( ON ?auto_208419 ?auto_208420 ) ( ON ?auto_208418 ?auto_208419 ) ( CLEAR ?auto_208416 ) ( ON ?auto_208417 ?auto_208418 ) ( CLEAR ?auto_208417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_208408 ?auto_208409 ?auto_208410 ?auto_208411 ?auto_208412 ?auto_208413 ?auto_208414 ?auto_208415 ?auto_208416 ?auto_208417 )
      ( MAKE-13PILE ?auto_208408 ?auto_208409 ?auto_208410 ?auto_208411 ?auto_208412 ?auto_208413 ?auto_208414 ?auto_208415 ?auto_208416 ?auto_208417 ?auto_208418 ?auto_208419 ?auto_208420 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208435 - BLOCK
      ?auto_208436 - BLOCK
      ?auto_208437 - BLOCK
      ?auto_208438 - BLOCK
      ?auto_208439 - BLOCK
      ?auto_208440 - BLOCK
      ?auto_208441 - BLOCK
      ?auto_208442 - BLOCK
      ?auto_208443 - BLOCK
      ?auto_208444 - BLOCK
      ?auto_208445 - BLOCK
      ?auto_208446 - BLOCK
      ?auto_208447 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208447 ) ( ON-TABLE ?auto_208435 ) ( ON ?auto_208436 ?auto_208435 ) ( ON ?auto_208437 ?auto_208436 ) ( ON ?auto_208438 ?auto_208437 ) ( ON ?auto_208439 ?auto_208438 ) ( ON ?auto_208440 ?auto_208439 ) ( ON ?auto_208441 ?auto_208440 ) ( ON ?auto_208442 ?auto_208441 ) ( ON ?auto_208443 ?auto_208442 ) ( not ( = ?auto_208435 ?auto_208436 ) ) ( not ( = ?auto_208435 ?auto_208437 ) ) ( not ( = ?auto_208435 ?auto_208438 ) ) ( not ( = ?auto_208435 ?auto_208439 ) ) ( not ( = ?auto_208435 ?auto_208440 ) ) ( not ( = ?auto_208435 ?auto_208441 ) ) ( not ( = ?auto_208435 ?auto_208442 ) ) ( not ( = ?auto_208435 ?auto_208443 ) ) ( not ( = ?auto_208435 ?auto_208444 ) ) ( not ( = ?auto_208435 ?auto_208445 ) ) ( not ( = ?auto_208435 ?auto_208446 ) ) ( not ( = ?auto_208435 ?auto_208447 ) ) ( not ( = ?auto_208436 ?auto_208437 ) ) ( not ( = ?auto_208436 ?auto_208438 ) ) ( not ( = ?auto_208436 ?auto_208439 ) ) ( not ( = ?auto_208436 ?auto_208440 ) ) ( not ( = ?auto_208436 ?auto_208441 ) ) ( not ( = ?auto_208436 ?auto_208442 ) ) ( not ( = ?auto_208436 ?auto_208443 ) ) ( not ( = ?auto_208436 ?auto_208444 ) ) ( not ( = ?auto_208436 ?auto_208445 ) ) ( not ( = ?auto_208436 ?auto_208446 ) ) ( not ( = ?auto_208436 ?auto_208447 ) ) ( not ( = ?auto_208437 ?auto_208438 ) ) ( not ( = ?auto_208437 ?auto_208439 ) ) ( not ( = ?auto_208437 ?auto_208440 ) ) ( not ( = ?auto_208437 ?auto_208441 ) ) ( not ( = ?auto_208437 ?auto_208442 ) ) ( not ( = ?auto_208437 ?auto_208443 ) ) ( not ( = ?auto_208437 ?auto_208444 ) ) ( not ( = ?auto_208437 ?auto_208445 ) ) ( not ( = ?auto_208437 ?auto_208446 ) ) ( not ( = ?auto_208437 ?auto_208447 ) ) ( not ( = ?auto_208438 ?auto_208439 ) ) ( not ( = ?auto_208438 ?auto_208440 ) ) ( not ( = ?auto_208438 ?auto_208441 ) ) ( not ( = ?auto_208438 ?auto_208442 ) ) ( not ( = ?auto_208438 ?auto_208443 ) ) ( not ( = ?auto_208438 ?auto_208444 ) ) ( not ( = ?auto_208438 ?auto_208445 ) ) ( not ( = ?auto_208438 ?auto_208446 ) ) ( not ( = ?auto_208438 ?auto_208447 ) ) ( not ( = ?auto_208439 ?auto_208440 ) ) ( not ( = ?auto_208439 ?auto_208441 ) ) ( not ( = ?auto_208439 ?auto_208442 ) ) ( not ( = ?auto_208439 ?auto_208443 ) ) ( not ( = ?auto_208439 ?auto_208444 ) ) ( not ( = ?auto_208439 ?auto_208445 ) ) ( not ( = ?auto_208439 ?auto_208446 ) ) ( not ( = ?auto_208439 ?auto_208447 ) ) ( not ( = ?auto_208440 ?auto_208441 ) ) ( not ( = ?auto_208440 ?auto_208442 ) ) ( not ( = ?auto_208440 ?auto_208443 ) ) ( not ( = ?auto_208440 ?auto_208444 ) ) ( not ( = ?auto_208440 ?auto_208445 ) ) ( not ( = ?auto_208440 ?auto_208446 ) ) ( not ( = ?auto_208440 ?auto_208447 ) ) ( not ( = ?auto_208441 ?auto_208442 ) ) ( not ( = ?auto_208441 ?auto_208443 ) ) ( not ( = ?auto_208441 ?auto_208444 ) ) ( not ( = ?auto_208441 ?auto_208445 ) ) ( not ( = ?auto_208441 ?auto_208446 ) ) ( not ( = ?auto_208441 ?auto_208447 ) ) ( not ( = ?auto_208442 ?auto_208443 ) ) ( not ( = ?auto_208442 ?auto_208444 ) ) ( not ( = ?auto_208442 ?auto_208445 ) ) ( not ( = ?auto_208442 ?auto_208446 ) ) ( not ( = ?auto_208442 ?auto_208447 ) ) ( not ( = ?auto_208443 ?auto_208444 ) ) ( not ( = ?auto_208443 ?auto_208445 ) ) ( not ( = ?auto_208443 ?auto_208446 ) ) ( not ( = ?auto_208443 ?auto_208447 ) ) ( not ( = ?auto_208444 ?auto_208445 ) ) ( not ( = ?auto_208444 ?auto_208446 ) ) ( not ( = ?auto_208444 ?auto_208447 ) ) ( not ( = ?auto_208445 ?auto_208446 ) ) ( not ( = ?auto_208445 ?auto_208447 ) ) ( not ( = ?auto_208446 ?auto_208447 ) ) ( ON ?auto_208446 ?auto_208447 ) ( ON ?auto_208445 ?auto_208446 ) ( CLEAR ?auto_208443 ) ( ON ?auto_208444 ?auto_208445 ) ( CLEAR ?auto_208444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_208435 ?auto_208436 ?auto_208437 ?auto_208438 ?auto_208439 ?auto_208440 ?auto_208441 ?auto_208442 ?auto_208443 ?auto_208444 )
      ( MAKE-13PILE ?auto_208435 ?auto_208436 ?auto_208437 ?auto_208438 ?auto_208439 ?auto_208440 ?auto_208441 ?auto_208442 ?auto_208443 ?auto_208444 ?auto_208445 ?auto_208446 ?auto_208447 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208461 - BLOCK
      ?auto_208462 - BLOCK
      ?auto_208463 - BLOCK
      ?auto_208464 - BLOCK
      ?auto_208465 - BLOCK
      ?auto_208466 - BLOCK
      ?auto_208467 - BLOCK
      ?auto_208468 - BLOCK
      ?auto_208469 - BLOCK
      ?auto_208470 - BLOCK
      ?auto_208471 - BLOCK
      ?auto_208472 - BLOCK
      ?auto_208473 - BLOCK
    )
    :vars
    (
      ?auto_208474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208473 ?auto_208474 ) ( ON-TABLE ?auto_208461 ) ( ON ?auto_208462 ?auto_208461 ) ( ON ?auto_208463 ?auto_208462 ) ( ON ?auto_208464 ?auto_208463 ) ( ON ?auto_208465 ?auto_208464 ) ( ON ?auto_208466 ?auto_208465 ) ( ON ?auto_208467 ?auto_208466 ) ( ON ?auto_208468 ?auto_208467 ) ( not ( = ?auto_208461 ?auto_208462 ) ) ( not ( = ?auto_208461 ?auto_208463 ) ) ( not ( = ?auto_208461 ?auto_208464 ) ) ( not ( = ?auto_208461 ?auto_208465 ) ) ( not ( = ?auto_208461 ?auto_208466 ) ) ( not ( = ?auto_208461 ?auto_208467 ) ) ( not ( = ?auto_208461 ?auto_208468 ) ) ( not ( = ?auto_208461 ?auto_208469 ) ) ( not ( = ?auto_208461 ?auto_208470 ) ) ( not ( = ?auto_208461 ?auto_208471 ) ) ( not ( = ?auto_208461 ?auto_208472 ) ) ( not ( = ?auto_208461 ?auto_208473 ) ) ( not ( = ?auto_208461 ?auto_208474 ) ) ( not ( = ?auto_208462 ?auto_208463 ) ) ( not ( = ?auto_208462 ?auto_208464 ) ) ( not ( = ?auto_208462 ?auto_208465 ) ) ( not ( = ?auto_208462 ?auto_208466 ) ) ( not ( = ?auto_208462 ?auto_208467 ) ) ( not ( = ?auto_208462 ?auto_208468 ) ) ( not ( = ?auto_208462 ?auto_208469 ) ) ( not ( = ?auto_208462 ?auto_208470 ) ) ( not ( = ?auto_208462 ?auto_208471 ) ) ( not ( = ?auto_208462 ?auto_208472 ) ) ( not ( = ?auto_208462 ?auto_208473 ) ) ( not ( = ?auto_208462 ?auto_208474 ) ) ( not ( = ?auto_208463 ?auto_208464 ) ) ( not ( = ?auto_208463 ?auto_208465 ) ) ( not ( = ?auto_208463 ?auto_208466 ) ) ( not ( = ?auto_208463 ?auto_208467 ) ) ( not ( = ?auto_208463 ?auto_208468 ) ) ( not ( = ?auto_208463 ?auto_208469 ) ) ( not ( = ?auto_208463 ?auto_208470 ) ) ( not ( = ?auto_208463 ?auto_208471 ) ) ( not ( = ?auto_208463 ?auto_208472 ) ) ( not ( = ?auto_208463 ?auto_208473 ) ) ( not ( = ?auto_208463 ?auto_208474 ) ) ( not ( = ?auto_208464 ?auto_208465 ) ) ( not ( = ?auto_208464 ?auto_208466 ) ) ( not ( = ?auto_208464 ?auto_208467 ) ) ( not ( = ?auto_208464 ?auto_208468 ) ) ( not ( = ?auto_208464 ?auto_208469 ) ) ( not ( = ?auto_208464 ?auto_208470 ) ) ( not ( = ?auto_208464 ?auto_208471 ) ) ( not ( = ?auto_208464 ?auto_208472 ) ) ( not ( = ?auto_208464 ?auto_208473 ) ) ( not ( = ?auto_208464 ?auto_208474 ) ) ( not ( = ?auto_208465 ?auto_208466 ) ) ( not ( = ?auto_208465 ?auto_208467 ) ) ( not ( = ?auto_208465 ?auto_208468 ) ) ( not ( = ?auto_208465 ?auto_208469 ) ) ( not ( = ?auto_208465 ?auto_208470 ) ) ( not ( = ?auto_208465 ?auto_208471 ) ) ( not ( = ?auto_208465 ?auto_208472 ) ) ( not ( = ?auto_208465 ?auto_208473 ) ) ( not ( = ?auto_208465 ?auto_208474 ) ) ( not ( = ?auto_208466 ?auto_208467 ) ) ( not ( = ?auto_208466 ?auto_208468 ) ) ( not ( = ?auto_208466 ?auto_208469 ) ) ( not ( = ?auto_208466 ?auto_208470 ) ) ( not ( = ?auto_208466 ?auto_208471 ) ) ( not ( = ?auto_208466 ?auto_208472 ) ) ( not ( = ?auto_208466 ?auto_208473 ) ) ( not ( = ?auto_208466 ?auto_208474 ) ) ( not ( = ?auto_208467 ?auto_208468 ) ) ( not ( = ?auto_208467 ?auto_208469 ) ) ( not ( = ?auto_208467 ?auto_208470 ) ) ( not ( = ?auto_208467 ?auto_208471 ) ) ( not ( = ?auto_208467 ?auto_208472 ) ) ( not ( = ?auto_208467 ?auto_208473 ) ) ( not ( = ?auto_208467 ?auto_208474 ) ) ( not ( = ?auto_208468 ?auto_208469 ) ) ( not ( = ?auto_208468 ?auto_208470 ) ) ( not ( = ?auto_208468 ?auto_208471 ) ) ( not ( = ?auto_208468 ?auto_208472 ) ) ( not ( = ?auto_208468 ?auto_208473 ) ) ( not ( = ?auto_208468 ?auto_208474 ) ) ( not ( = ?auto_208469 ?auto_208470 ) ) ( not ( = ?auto_208469 ?auto_208471 ) ) ( not ( = ?auto_208469 ?auto_208472 ) ) ( not ( = ?auto_208469 ?auto_208473 ) ) ( not ( = ?auto_208469 ?auto_208474 ) ) ( not ( = ?auto_208470 ?auto_208471 ) ) ( not ( = ?auto_208470 ?auto_208472 ) ) ( not ( = ?auto_208470 ?auto_208473 ) ) ( not ( = ?auto_208470 ?auto_208474 ) ) ( not ( = ?auto_208471 ?auto_208472 ) ) ( not ( = ?auto_208471 ?auto_208473 ) ) ( not ( = ?auto_208471 ?auto_208474 ) ) ( not ( = ?auto_208472 ?auto_208473 ) ) ( not ( = ?auto_208472 ?auto_208474 ) ) ( not ( = ?auto_208473 ?auto_208474 ) ) ( ON ?auto_208472 ?auto_208473 ) ( ON ?auto_208471 ?auto_208472 ) ( ON ?auto_208470 ?auto_208471 ) ( CLEAR ?auto_208468 ) ( ON ?auto_208469 ?auto_208470 ) ( CLEAR ?auto_208469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_208461 ?auto_208462 ?auto_208463 ?auto_208464 ?auto_208465 ?auto_208466 ?auto_208467 ?auto_208468 ?auto_208469 )
      ( MAKE-13PILE ?auto_208461 ?auto_208462 ?auto_208463 ?auto_208464 ?auto_208465 ?auto_208466 ?auto_208467 ?auto_208468 ?auto_208469 ?auto_208470 ?auto_208471 ?auto_208472 ?auto_208473 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208488 - BLOCK
      ?auto_208489 - BLOCK
      ?auto_208490 - BLOCK
      ?auto_208491 - BLOCK
      ?auto_208492 - BLOCK
      ?auto_208493 - BLOCK
      ?auto_208494 - BLOCK
      ?auto_208495 - BLOCK
      ?auto_208496 - BLOCK
      ?auto_208497 - BLOCK
      ?auto_208498 - BLOCK
      ?auto_208499 - BLOCK
      ?auto_208500 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208500 ) ( ON-TABLE ?auto_208488 ) ( ON ?auto_208489 ?auto_208488 ) ( ON ?auto_208490 ?auto_208489 ) ( ON ?auto_208491 ?auto_208490 ) ( ON ?auto_208492 ?auto_208491 ) ( ON ?auto_208493 ?auto_208492 ) ( ON ?auto_208494 ?auto_208493 ) ( ON ?auto_208495 ?auto_208494 ) ( not ( = ?auto_208488 ?auto_208489 ) ) ( not ( = ?auto_208488 ?auto_208490 ) ) ( not ( = ?auto_208488 ?auto_208491 ) ) ( not ( = ?auto_208488 ?auto_208492 ) ) ( not ( = ?auto_208488 ?auto_208493 ) ) ( not ( = ?auto_208488 ?auto_208494 ) ) ( not ( = ?auto_208488 ?auto_208495 ) ) ( not ( = ?auto_208488 ?auto_208496 ) ) ( not ( = ?auto_208488 ?auto_208497 ) ) ( not ( = ?auto_208488 ?auto_208498 ) ) ( not ( = ?auto_208488 ?auto_208499 ) ) ( not ( = ?auto_208488 ?auto_208500 ) ) ( not ( = ?auto_208489 ?auto_208490 ) ) ( not ( = ?auto_208489 ?auto_208491 ) ) ( not ( = ?auto_208489 ?auto_208492 ) ) ( not ( = ?auto_208489 ?auto_208493 ) ) ( not ( = ?auto_208489 ?auto_208494 ) ) ( not ( = ?auto_208489 ?auto_208495 ) ) ( not ( = ?auto_208489 ?auto_208496 ) ) ( not ( = ?auto_208489 ?auto_208497 ) ) ( not ( = ?auto_208489 ?auto_208498 ) ) ( not ( = ?auto_208489 ?auto_208499 ) ) ( not ( = ?auto_208489 ?auto_208500 ) ) ( not ( = ?auto_208490 ?auto_208491 ) ) ( not ( = ?auto_208490 ?auto_208492 ) ) ( not ( = ?auto_208490 ?auto_208493 ) ) ( not ( = ?auto_208490 ?auto_208494 ) ) ( not ( = ?auto_208490 ?auto_208495 ) ) ( not ( = ?auto_208490 ?auto_208496 ) ) ( not ( = ?auto_208490 ?auto_208497 ) ) ( not ( = ?auto_208490 ?auto_208498 ) ) ( not ( = ?auto_208490 ?auto_208499 ) ) ( not ( = ?auto_208490 ?auto_208500 ) ) ( not ( = ?auto_208491 ?auto_208492 ) ) ( not ( = ?auto_208491 ?auto_208493 ) ) ( not ( = ?auto_208491 ?auto_208494 ) ) ( not ( = ?auto_208491 ?auto_208495 ) ) ( not ( = ?auto_208491 ?auto_208496 ) ) ( not ( = ?auto_208491 ?auto_208497 ) ) ( not ( = ?auto_208491 ?auto_208498 ) ) ( not ( = ?auto_208491 ?auto_208499 ) ) ( not ( = ?auto_208491 ?auto_208500 ) ) ( not ( = ?auto_208492 ?auto_208493 ) ) ( not ( = ?auto_208492 ?auto_208494 ) ) ( not ( = ?auto_208492 ?auto_208495 ) ) ( not ( = ?auto_208492 ?auto_208496 ) ) ( not ( = ?auto_208492 ?auto_208497 ) ) ( not ( = ?auto_208492 ?auto_208498 ) ) ( not ( = ?auto_208492 ?auto_208499 ) ) ( not ( = ?auto_208492 ?auto_208500 ) ) ( not ( = ?auto_208493 ?auto_208494 ) ) ( not ( = ?auto_208493 ?auto_208495 ) ) ( not ( = ?auto_208493 ?auto_208496 ) ) ( not ( = ?auto_208493 ?auto_208497 ) ) ( not ( = ?auto_208493 ?auto_208498 ) ) ( not ( = ?auto_208493 ?auto_208499 ) ) ( not ( = ?auto_208493 ?auto_208500 ) ) ( not ( = ?auto_208494 ?auto_208495 ) ) ( not ( = ?auto_208494 ?auto_208496 ) ) ( not ( = ?auto_208494 ?auto_208497 ) ) ( not ( = ?auto_208494 ?auto_208498 ) ) ( not ( = ?auto_208494 ?auto_208499 ) ) ( not ( = ?auto_208494 ?auto_208500 ) ) ( not ( = ?auto_208495 ?auto_208496 ) ) ( not ( = ?auto_208495 ?auto_208497 ) ) ( not ( = ?auto_208495 ?auto_208498 ) ) ( not ( = ?auto_208495 ?auto_208499 ) ) ( not ( = ?auto_208495 ?auto_208500 ) ) ( not ( = ?auto_208496 ?auto_208497 ) ) ( not ( = ?auto_208496 ?auto_208498 ) ) ( not ( = ?auto_208496 ?auto_208499 ) ) ( not ( = ?auto_208496 ?auto_208500 ) ) ( not ( = ?auto_208497 ?auto_208498 ) ) ( not ( = ?auto_208497 ?auto_208499 ) ) ( not ( = ?auto_208497 ?auto_208500 ) ) ( not ( = ?auto_208498 ?auto_208499 ) ) ( not ( = ?auto_208498 ?auto_208500 ) ) ( not ( = ?auto_208499 ?auto_208500 ) ) ( ON ?auto_208499 ?auto_208500 ) ( ON ?auto_208498 ?auto_208499 ) ( ON ?auto_208497 ?auto_208498 ) ( CLEAR ?auto_208495 ) ( ON ?auto_208496 ?auto_208497 ) ( CLEAR ?auto_208496 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_208488 ?auto_208489 ?auto_208490 ?auto_208491 ?auto_208492 ?auto_208493 ?auto_208494 ?auto_208495 ?auto_208496 )
      ( MAKE-13PILE ?auto_208488 ?auto_208489 ?auto_208490 ?auto_208491 ?auto_208492 ?auto_208493 ?auto_208494 ?auto_208495 ?auto_208496 ?auto_208497 ?auto_208498 ?auto_208499 ?auto_208500 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208514 - BLOCK
      ?auto_208515 - BLOCK
      ?auto_208516 - BLOCK
      ?auto_208517 - BLOCK
      ?auto_208518 - BLOCK
      ?auto_208519 - BLOCK
      ?auto_208520 - BLOCK
      ?auto_208521 - BLOCK
      ?auto_208522 - BLOCK
      ?auto_208523 - BLOCK
      ?auto_208524 - BLOCK
      ?auto_208525 - BLOCK
      ?auto_208526 - BLOCK
    )
    :vars
    (
      ?auto_208527 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208526 ?auto_208527 ) ( ON-TABLE ?auto_208514 ) ( ON ?auto_208515 ?auto_208514 ) ( ON ?auto_208516 ?auto_208515 ) ( ON ?auto_208517 ?auto_208516 ) ( ON ?auto_208518 ?auto_208517 ) ( ON ?auto_208519 ?auto_208518 ) ( ON ?auto_208520 ?auto_208519 ) ( not ( = ?auto_208514 ?auto_208515 ) ) ( not ( = ?auto_208514 ?auto_208516 ) ) ( not ( = ?auto_208514 ?auto_208517 ) ) ( not ( = ?auto_208514 ?auto_208518 ) ) ( not ( = ?auto_208514 ?auto_208519 ) ) ( not ( = ?auto_208514 ?auto_208520 ) ) ( not ( = ?auto_208514 ?auto_208521 ) ) ( not ( = ?auto_208514 ?auto_208522 ) ) ( not ( = ?auto_208514 ?auto_208523 ) ) ( not ( = ?auto_208514 ?auto_208524 ) ) ( not ( = ?auto_208514 ?auto_208525 ) ) ( not ( = ?auto_208514 ?auto_208526 ) ) ( not ( = ?auto_208514 ?auto_208527 ) ) ( not ( = ?auto_208515 ?auto_208516 ) ) ( not ( = ?auto_208515 ?auto_208517 ) ) ( not ( = ?auto_208515 ?auto_208518 ) ) ( not ( = ?auto_208515 ?auto_208519 ) ) ( not ( = ?auto_208515 ?auto_208520 ) ) ( not ( = ?auto_208515 ?auto_208521 ) ) ( not ( = ?auto_208515 ?auto_208522 ) ) ( not ( = ?auto_208515 ?auto_208523 ) ) ( not ( = ?auto_208515 ?auto_208524 ) ) ( not ( = ?auto_208515 ?auto_208525 ) ) ( not ( = ?auto_208515 ?auto_208526 ) ) ( not ( = ?auto_208515 ?auto_208527 ) ) ( not ( = ?auto_208516 ?auto_208517 ) ) ( not ( = ?auto_208516 ?auto_208518 ) ) ( not ( = ?auto_208516 ?auto_208519 ) ) ( not ( = ?auto_208516 ?auto_208520 ) ) ( not ( = ?auto_208516 ?auto_208521 ) ) ( not ( = ?auto_208516 ?auto_208522 ) ) ( not ( = ?auto_208516 ?auto_208523 ) ) ( not ( = ?auto_208516 ?auto_208524 ) ) ( not ( = ?auto_208516 ?auto_208525 ) ) ( not ( = ?auto_208516 ?auto_208526 ) ) ( not ( = ?auto_208516 ?auto_208527 ) ) ( not ( = ?auto_208517 ?auto_208518 ) ) ( not ( = ?auto_208517 ?auto_208519 ) ) ( not ( = ?auto_208517 ?auto_208520 ) ) ( not ( = ?auto_208517 ?auto_208521 ) ) ( not ( = ?auto_208517 ?auto_208522 ) ) ( not ( = ?auto_208517 ?auto_208523 ) ) ( not ( = ?auto_208517 ?auto_208524 ) ) ( not ( = ?auto_208517 ?auto_208525 ) ) ( not ( = ?auto_208517 ?auto_208526 ) ) ( not ( = ?auto_208517 ?auto_208527 ) ) ( not ( = ?auto_208518 ?auto_208519 ) ) ( not ( = ?auto_208518 ?auto_208520 ) ) ( not ( = ?auto_208518 ?auto_208521 ) ) ( not ( = ?auto_208518 ?auto_208522 ) ) ( not ( = ?auto_208518 ?auto_208523 ) ) ( not ( = ?auto_208518 ?auto_208524 ) ) ( not ( = ?auto_208518 ?auto_208525 ) ) ( not ( = ?auto_208518 ?auto_208526 ) ) ( not ( = ?auto_208518 ?auto_208527 ) ) ( not ( = ?auto_208519 ?auto_208520 ) ) ( not ( = ?auto_208519 ?auto_208521 ) ) ( not ( = ?auto_208519 ?auto_208522 ) ) ( not ( = ?auto_208519 ?auto_208523 ) ) ( not ( = ?auto_208519 ?auto_208524 ) ) ( not ( = ?auto_208519 ?auto_208525 ) ) ( not ( = ?auto_208519 ?auto_208526 ) ) ( not ( = ?auto_208519 ?auto_208527 ) ) ( not ( = ?auto_208520 ?auto_208521 ) ) ( not ( = ?auto_208520 ?auto_208522 ) ) ( not ( = ?auto_208520 ?auto_208523 ) ) ( not ( = ?auto_208520 ?auto_208524 ) ) ( not ( = ?auto_208520 ?auto_208525 ) ) ( not ( = ?auto_208520 ?auto_208526 ) ) ( not ( = ?auto_208520 ?auto_208527 ) ) ( not ( = ?auto_208521 ?auto_208522 ) ) ( not ( = ?auto_208521 ?auto_208523 ) ) ( not ( = ?auto_208521 ?auto_208524 ) ) ( not ( = ?auto_208521 ?auto_208525 ) ) ( not ( = ?auto_208521 ?auto_208526 ) ) ( not ( = ?auto_208521 ?auto_208527 ) ) ( not ( = ?auto_208522 ?auto_208523 ) ) ( not ( = ?auto_208522 ?auto_208524 ) ) ( not ( = ?auto_208522 ?auto_208525 ) ) ( not ( = ?auto_208522 ?auto_208526 ) ) ( not ( = ?auto_208522 ?auto_208527 ) ) ( not ( = ?auto_208523 ?auto_208524 ) ) ( not ( = ?auto_208523 ?auto_208525 ) ) ( not ( = ?auto_208523 ?auto_208526 ) ) ( not ( = ?auto_208523 ?auto_208527 ) ) ( not ( = ?auto_208524 ?auto_208525 ) ) ( not ( = ?auto_208524 ?auto_208526 ) ) ( not ( = ?auto_208524 ?auto_208527 ) ) ( not ( = ?auto_208525 ?auto_208526 ) ) ( not ( = ?auto_208525 ?auto_208527 ) ) ( not ( = ?auto_208526 ?auto_208527 ) ) ( ON ?auto_208525 ?auto_208526 ) ( ON ?auto_208524 ?auto_208525 ) ( ON ?auto_208523 ?auto_208524 ) ( ON ?auto_208522 ?auto_208523 ) ( CLEAR ?auto_208520 ) ( ON ?auto_208521 ?auto_208522 ) ( CLEAR ?auto_208521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208514 ?auto_208515 ?auto_208516 ?auto_208517 ?auto_208518 ?auto_208519 ?auto_208520 ?auto_208521 )
      ( MAKE-13PILE ?auto_208514 ?auto_208515 ?auto_208516 ?auto_208517 ?auto_208518 ?auto_208519 ?auto_208520 ?auto_208521 ?auto_208522 ?auto_208523 ?auto_208524 ?auto_208525 ?auto_208526 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208541 - BLOCK
      ?auto_208542 - BLOCK
      ?auto_208543 - BLOCK
      ?auto_208544 - BLOCK
      ?auto_208545 - BLOCK
      ?auto_208546 - BLOCK
      ?auto_208547 - BLOCK
      ?auto_208548 - BLOCK
      ?auto_208549 - BLOCK
      ?auto_208550 - BLOCK
      ?auto_208551 - BLOCK
      ?auto_208552 - BLOCK
      ?auto_208553 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208553 ) ( ON-TABLE ?auto_208541 ) ( ON ?auto_208542 ?auto_208541 ) ( ON ?auto_208543 ?auto_208542 ) ( ON ?auto_208544 ?auto_208543 ) ( ON ?auto_208545 ?auto_208544 ) ( ON ?auto_208546 ?auto_208545 ) ( ON ?auto_208547 ?auto_208546 ) ( not ( = ?auto_208541 ?auto_208542 ) ) ( not ( = ?auto_208541 ?auto_208543 ) ) ( not ( = ?auto_208541 ?auto_208544 ) ) ( not ( = ?auto_208541 ?auto_208545 ) ) ( not ( = ?auto_208541 ?auto_208546 ) ) ( not ( = ?auto_208541 ?auto_208547 ) ) ( not ( = ?auto_208541 ?auto_208548 ) ) ( not ( = ?auto_208541 ?auto_208549 ) ) ( not ( = ?auto_208541 ?auto_208550 ) ) ( not ( = ?auto_208541 ?auto_208551 ) ) ( not ( = ?auto_208541 ?auto_208552 ) ) ( not ( = ?auto_208541 ?auto_208553 ) ) ( not ( = ?auto_208542 ?auto_208543 ) ) ( not ( = ?auto_208542 ?auto_208544 ) ) ( not ( = ?auto_208542 ?auto_208545 ) ) ( not ( = ?auto_208542 ?auto_208546 ) ) ( not ( = ?auto_208542 ?auto_208547 ) ) ( not ( = ?auto_208542 ?auto_208548 ) ) ( not ( = ?auto_208542 ?auto_208549 ) ) ( not ( = ?auto_208542 ?auto_208550 ) ) ( not ( = ?auto_208542 ?auto_208551 ) ) ( not ( = ?auto_208542 ?auto_208552 ) ) ( not ( = ?auto_208542 ?auto_208553 ) ) ( not ( = ?auto_208543 ?auto_208544 ) ) ( not ( = ?auto_208543 ?auto_208545 ) ) ( not ( = ?auto_208543 ?auto_208546 ) ) ( not ( = ?auto_208543 ?auto_208547 ) ) ( not ( = ?auto_208543 ?auto_208548 ) ) ( not ( = ?auto_208543 ?auto_208549 ) ) ( not ( = ?auto_208543 ?auto_208550 ) ) ( not ( = ?auto_208543 ?auto_208551 ) ) ( not ( = ?auto_208543 ?auto_208552 ) ) ( not ( = ?auto_208543 ?auto_208553 ) ) ( not ( = ?auto_208544 ?auto_208545 ) ) ( not ( = ?auto_208544 ?auto_208546 ) ) ( not ( = ?auto_208544 ?auto_208547 ) ) ( not ( = ?auto_208544 ?auto_208548 ) ) ( not ( = ?auto_208544 ?auto_208549 ) ) ( not ( = ?auto_208544 ?auto_208550 ) ) ( not ( = ?auto_208544 ?auto_208551 ) ) ( not ( = ?auto_208544 ?auto_208552 ) ) ( not ( = ?auto_208544 ?auto_208553 ) ) ( not ( = ?auto_208545 ?auto_208546 ) ) ( not ( = ?auto_208545 ?auto_208547 ) ) ( not ( = ?auto_208545 ?auto_208548 ) ) ( not ( = ?auto_208545 ?auto_208549 ) ) ( not ( = ?auto_208545 ?auto_208550 ) ) ( not ( = ?auto_208545 ?auto_208551 ) ) ( not ( = ?auto_208545 ?auto_208552 ) ) ( not ( = ?auto_208545 ?auto_208553 ) ) ( not ( = ?auto_208546 ?auto_208547 ) ) ( not ( = ?auto_208546 ?auto_208548 ) ) ( not ( = ?auto_208546 ?auto_208549 ) ) ( not ( = ?auto_208546 ?auto_208550 ) ) ( not ( = ?auto_208546 ?auto_208551 ) ) ( not ( = ?auto_208546 ?auto_208552 ) ) ( not ( = ?auto_208546 ?auto_208553 ) ) ( not ( = ?auto_208547 ?auto_208548 ) ) ( not ( = ?auto_208547 ?auto_208549 ) ) ( not ( = ?auto_208547 ?auto_208550 ) ) ( not ( = ?auto_208547 ?auto_208551 ) ) ( not ( = ?auto_208547 ?auto_208552 ) ) ( not ( = ?auto_208547 ?auto_208553 ) ) ( not ( = ?auto_208548 ?auto_208549 ) ) ( not ( = ?auto_208548 ?auto_208550 ) ) ( not ( = ?auto_208548 ?auto_208551 ) ) ( not ( = ?auto_208548 ?auto_208552 ) ) ( not ( = ?auto_208548 ?auto_208553 ) ) ( not ( = ?auto_208549 ?auto_208550 ) ) ( not ( = ?auto_208549 ?auto_208551 ) ) ( not ( = ?auto_208549 ?auto_208552 ) ) ( not ( = ?auto_208549 ?auto_208553 ) ) ( not ( = ?auto_208550 ?auto_208551 ) ) ( not ( = ?auto_208550 ?auto_208552 ) ) ( not ( = ?auto_208550 ?auto_208553 ) ) ( not ( = ?auto_208551 ?auto_208552 ) ) ( not ( = ?auto_208551 ?auto_208553 ) ) ( not ( = ?auto_208552 ?auto_208553 ) ) ( ON ?auto_208552 ?auto_208553 ) ( ON ?auto_208551 ?auto_208552 ) ( ON ?auto_208550 ?auto_208551 ) ( ON ?auto_208549 ?auto_208550 ) ( CLEAR ?auto_208547 ) ( ON ?auto_208548 ?auto_208549 ) ( CLEAR ?auto_208548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_208541 ?auto_208542 ?auto_208543 ?auto_208544 ?auto_208545 ?auto_208546 ?auto_208547 ?auto_208548 )
      ( MAKE-13PILE ?auto_208541 ?auto_208542 ?auto_208543 ?auto_208544 ?auto_208545 ?auto_208546 ?auto_208547 ?auto_208548 ?auto_208549 ?auto_208550 ?auto_208551 ?auto_208552 ?auto_208553 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208567 - BLOCK
      ?auto_208568 - BLOCK
      ?auto_208569 - BLOCK
      ?auto_208570 - BLOCK
      ?auto_208571 - BLOCK
      ?auto_208572 - BLOCK
      ?auto_208573 - BLOCK
      ?auto_208574 - BLOCK
      ?auto_208575 - BLOCK
      ?auto_208576 - BLOCK
      ?auto_208577 - BLOCK
      ?auto_208578 - BLOCK
      ?auto_208579 - BLOCK
    )
    :vars
    (
      ?auto_208580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208579 ?auto_208580 ) ( ON-TABLE ?auto_208567 ) ( ON ?auto_208568 ?auto_208567 ) ( ON ?auto_208569 ?auto_208568 ) ( ON ?auto_208570 ?auto_208569 ) ( ON ?auto_208571 ?auto_208570 ) ( ON ?auto_208572 ?auto_208571 ) ( not ( = ?auto_208567 ?auto_208568 ) ) ( not ( = ?auto_208567 ?auto_208569 ) ) ( not ( = ?auto_208567 ?auto_208570 ) ) ( not ( = ?auto_208567 ?auto_208571 ) ) ( not ( = ?auto_208567 ?auto_208572 ) ) ( not ( = ?auto_208567 ?auto_208573 ) ) ( not ( = ?auto_208567 ?auto_208574 ) ) ( not ( = ?auto_208567 ?auto_208575 ) ) ( not ( = ?auto_208567 ?auto_208576 ) ) ( not ( = ?auto_208567 ?auto_208577 ) ) ( not ( = ?auto_208567 ?auto_208578 ) ) ( not ( = ?auto_208567 ?auto_208579 ) ) ( not ( = ?auto_208567 ?auto_208580 ) ) ( not ( = ?auto_208568 ?auto_208569 ) ) ( not ( = ?auto_208568 ?auto_208570 ) ) ( not ( = ?auto_208568 ?auto_208571 ) ) ( not ( = ?auto_208568 ?auto_208572 ) ) ( not ( = ?auto_208568 ?auto_208573 ) ) ( not ( = ?auto_208568 ?auto_208574 ) ) ( not ( = ?auto_208568 ?auto_208575 ) ) ( not ( = ?auto_208568 ?auto_208576 ) ) ( not ( = ?auto_208568 ?auto_208577 ) ) ( not ( = ?auto_208568 ?auto_208578 ) ) ( not ( = ?auto_208568 ?auto_208579 ) ) ( not ( = ?auto_208568 ?auto_208580 ) ) ( not ( = ?auto_208569 ?auto_208570 ) ) ( not ( = ?auto_208569 ?auto_208571 ) ) ( not ( = ?auto_208569 ?auto_208572 ) ) ( not ( = ?auto_208569 ?auto_208573 ) ) ( not ( = ?auto_208569 ?auto_208574 ) ) ( not ( = ?auto_208569 ?auto_208575 ) ) ( not ( = ?auto_208569 ?auto_208576 ) ) ( not ( = ?auto_208569 ?auto_208577 ) ) ( not ( = ?auto_208569 ?auto_208578 ) ) ( not ( = ?auto_208569 ?auto_208579 ) ) ( not ( = ?auto_208569 ?auto_208580 ) ) ( not ( = ?auto_208570 ?auto_208571 ) ) ( not ( = ?auto_208570 ?auto_208572 ) ) ( not ( = ?auto_208570 ?auto_208573 ) ) ( not ( = ?auto_208570 ?auto_208574 ) ) ( not ( = ?auto_208570 ?auto_208575 ) ) ( not ( = ?auto_208570 ?auto_208576 ) ) ( not ( = ?auto_208570 ?auto_208577 ) ) ( not ( = ?auto_208570 ?auto_208578 ) ) ( not ( = ?auto_208570 ?auto_208579 ) ) ( not ( = ?auto_208570 ?auto_208580 ) ) ( not ( = ?auto_208571 ?auto_208572 ) ) ( not ( = ?auto_208571 ?auto_208573 ) ) ( not ( = ?auto_208571 ?auto_208574 ) ) ( not ( = ?auto_208571 ?auto_208575 ) ) ( not ( = ?auto_208571 ?auto_208576 ) ) ( not ( = ?auto_208571 ?auto_208577 ) ) ( not ( = ?auto_208571 ?auto_208578 ) ) ( not ( = ?auto_208571 ?auto_208579 ) ) ( not ( = ?auto_208571 ?auto_208580 ) ) ( not ( = ?auto_208572 ?auto_208573 ) ) ( not ( = ?auto_208572 ?auto_208574 ) ) ( not ( = ?auto_208572 ?auto_208575 ) ) ( not ( = ?auto_208572 ?auto_208576 ) ) ( not ( = ?auto_208572 ?auto_208577 ) ) ( not ( = ?auto_208572 ?auto_208578 ) ) ( not ( = ?auto_208572 ?auto_208579 ) ) ( not ( = ?auto_208572 ?auto_208580 ) ) ( not ( = ?auto_208573 ?auto_208574 ) ) ( not ( = ?auto_208573 ?auto_208575 ) ) ( not ( = ?auto_208573 ?auto_208576 ) ) ( not ( = ?auto_208573 ?auto_208577 ) ) ( not ( = ?auto_208573 ?auto_208578 ) ) ( not ( = ?auto_208573 ?auto_208579 ) ) ( not ( = ?auto_208573 ?auto_208580 ) ) ( not ( = ?auto_208574 ?auto_208575 ) ) ( not ( = ?auto_208574 ?auto_208576 ) ) ( not ( = ?auto_208574 ?auto_208577 ) ) ( not ( = ?auto_208574 ?auto_208578 ) ) ( not ( = ?auto_208574 ?auto_208579 ) ) ( not ( = ?auto_208574 ?auto_208580 ) ) ( not ( = ?auto_208575 ?auto_208576 ) ) ( not ( = ?auto_208575 ?auto_208577 ) ) ( not ( = ?auto_208575 ?auto_208578 ) ) ( not ( = ?auto_208575 ?auto_208579 ) ) ( not ( = ?auto_208575 ?auto_208580 ) ) ( not ( = ?auto_208576 ?auto_208577 ) ) ( not ( = ?auto_208576 ?auto_208578 ) ) ( not ( = ?auto_208576 ?auto_208579 ) ) ( not ( = ?auto_208576 ?auto_208580 ) ) ( not ( = ?auto_208577 ?auto_208578 ) ) ( not ( = ?auto_208577 ?auto_208579 ) ) ( not ( = ?auto_208577 ?auto_208580 ) ) ( not ( = ?auto_208578 ?auto_208579 ) ) ( not ( = ?auto_208578 ?auto_208580 ) ) ( not ( = ?auto_208579 ?auto_208580 ) ) ( ON ?auto_208578 ?auto_208579 ) ( ON ?auto_208577 ?auto_208578 ) ( ON ?auto_208576 ?auto_208577 ) ( ON ?auto_208575 ?auto_208576 ) ( ON ?auto_208574 ?auto_208575 ) ( CLEAR ?auto_208572 ) ( ON ?auto_208573 ?auto_208574 ) ( CLEAR ?auto_208573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208567 ?auto_208568 ?auto_208569 ?auto_208570 ?auto_208571 ?auto_208572 ?auto_208573 )
      ( MAKE-13PILE ?auto_208567 ?auto_208568 ?auto_208569 ?auto_208570 ?auto_208571 ?auto_208572 ?auto_208573 ?auto_208574 ?auto_208575 ?auto_208576 ?auto_208577 ?auto_208578 ?auto_208579 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208594 - BLOCK
      ?auto_208595 - BLOCK
      ?auto_208596 - BLOCK
      ?auto_208597 - BLOCK
      ?auto_208598 - BLOCK
      ?auto_208599 - BLOCK
      ?auto_208600 - BLOCK
      ?auto_208601 - BLOCK
      ?auto_208602 - BLOCK
      ?auto_208603 - BLOCK
      ?auto_208604 - BLOCK
      ?auto_208605 - BLOCK
      ?auto_208606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208606 ) ( ON-TABLE ?auto_208594 ) ( ON ?auto_208595 ?auto_208594 ) ( ON ?auto_208596 ?auto_208595 ) ( ON ?auto_208597 ?auto_208596 ) ( ON ?auto_208598 ?auto_208597 ) ( ON ?auto_208599 ?auto_208598 ) ( not ( = ?auto_208594 ?auto_208595 ) ) ( not ( = ?auto_208594 ?auto_208596 ) ) ( not ( = ?auto_208594 ?auto_208597 ) ) ( not ( = ?auto_208594 ?auto_208598 ) ) ( not ( = ?auto_208594 ?auto_208599 ) ) ( not ( = ?auto_208594 ?auto_208600 ) ) ( not ( = ?auto_208594 ?auto_208601 ) ) ( not ( = ?auto_208594 ?auto_208602 ) ) ( not ( = ?auto_208594 ?auto_208603 ) ) ( not ( = ?auto_208594 ?auto_208604 ) ) ( not ( = ?auto_208594 ?auto_208605 ) ) ( not ( = ?auto_208594 ?auto_208606 ) ) ( not ( = ?auto_208595 ?auto_208596 ) ) ( not ( = ?auto_208595 ?auto_208597 ) ) ( not ( = ?auto_208595 ?auto_208598 ) ) ( not ( = ?auto_208595 ?auto_208599 ) ) ( not ( = ?auto_208595 ?auto_208600 ) ) ( not ( = ?auto_208595 ?auto_208601 ) ) ( not ( = ?auto_208595 ?auto_208602 ) ) ( not ( = ?auto_208595 ?auto_208603 ) ) ( not ( = ?auto_208595 ?auto_208604 ) ) ( not ( = ?auto_208595 ?auto_208605 ) ) ( not ( = ?auto_208595 ?auto_208606 ) ) ( not ( = ?auto_208596 ?auto_208597 ) ) ( not ( = ?auto_208596 ?auto_208598 ) ) ( not ( = ?auto_208596 ?auto_208599 ) ) ( not ( = ?auto_208596 ?auto_208600 ) ) ( not ( = ?auto_208596 ?auto_208601 ) ) ( not ( = ?auto_208596 ?auto_208602 ) ) ( not ( = ?auto_208596 ?auto_208603 ) ) ( not ( = ?auto_208596 ?auto_208604 ) ) ( not ( = ?auto_208596 ?auto_208605 ) ) ( not ( = ?auto_208596 ?auto_208606 ) ) ( not ( = ?auto_208597 ?auto_208598 ) ) ( not ( = ?auto_208597 ?auto_208599 ) ) ( not ( = ?auto_208597 ?auto_208600 ) ) ( not ( = ?auto_208597 ?auto_208601 ) ) ( not ( = ?auto_208597 ?auto_208602 ) ) ( not ( = ?auto_208597 ?auto_208603 ) ) ( not ( = ?auto_208597 ?auto_208604 ) ) ( not ( = ?auto_208597 ?auto_208605 ) ) ( not ( = ?auto_208597 ?auto_208606 ) ) ( not ( = ?auto_208598 ?auto_208599 ) ) ( not ( = ?auto_208598 ?auto_208600 ) ) ( not ( = ?auto_208598 ?auto_208601 ) ) ( not ( = ?auto_208598 ?auto_208602 ) ) ( not ( = ?auto_208598 ?auto_208603 ) ) ( not ( = ?auto_208598 ?auto_208604 ) ) ( not ( = ?auto_208598 ?auto_208605 ) ) ( not ( = ?auto_208598 ?auto_208606 ) ) ( not ( = ?auto_208599 ?auto_208600 ) ) ( not ( = ?auto_208599 ?auto_208601 ) ) ( not ( = ?auto_208599 ?auto_208602 ) ) ( not ( = ?auto_208599 ?auto_208603 ) ) ( not ( = ?auto_208599 ?auto_208604 ) ) ( not ( = ?auto_208599 ?auto_208605 ) ) ( not ( = ?auto_208599 ?auto_208606 ) ) ( not ( = ?auto_208600 ?auto_208601 ) ) ( not ( = ?auto_208600 ?auto_208602 ) ) ( not ( = ?auto_208600 ?auto_208603 ) ) ( not ( = ?auto_208600 ?auto_208604 ) ) ( not ( = ?auto_208600 ?auto_208605 ) ) ( not ( = ?auto_208600 ?auto_208606 ) ) ( not ( = ?auto_208601 ?auto_208602 ) ) ( not ( = ?auto_208601 ?auto_208603 ) ) ( not ( = ?auto_208601 ?auto_208604 ) ) ( not ( = ?auto_208601 ?auto_208605 ) ) ( not ( = ?auto_208601 ?auto_208606 ) ) ( not ( = ?auto_208602 ?auto_208603 ) ) ( not ( = ?auto_208602 ?auto_208604 ) ) ( not ( = ?auto_208602 ?auto_208605 ) ) ( not ( = ?auto_208602 ?auto_208606 ) ) ( not ( = ?auto_208603 ?auto_208604 ) ) ( not ( = ?auto_208603 ?auto_208605 ) ) ( not ( = ?auto_208603 ?auto_208606 ) ) ( not ( = ?auto_208604 ?auto_208605 ) ) ( not ( = ?auto_208604 ?auto_208606 ) ) ( not ( = ?auto_208605 ?auto_208606 ) ) ( ON ?auto_208605 ?auto_208606 ) ( ON ?auto_208604 ?auto_208605 ) ( ON ?auto_208603 ?auto_208604 ) ( ON ?auto_208602 ?auto_208603 ) ( ON ?auto_208601 ?auto_208602 ) ( CLEAR ?auto_208599 ) ( ON ?auto_208600 ?auto_208601 ) ( CLEAR ?auto_208600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_208594 ?auto_208595 ?auto_208596 ?auto_208597 ?auto_208598 ?auto_208599 ?auto_208600 )
      ( MAKE-13PILE ?auto_208594 ?auto_208595 ?auto_208596 ?auto_208597 ?auto_208598 ?auto_208599 ?auto_208600 ?auto_208601 ?auto_208602 ?auto_208603 ?auto_208604 ?auto_208605 ?auto_208606 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208620 - BLOCK
      ?auto_208621 - BLOCK
      ?auto_208622 - BLOCK
      ?auto_208623 - BLOCK
      ?auto_208624 - BLOCK
      ?auto_208625 - BLOCK
      ?auto_208626 - BLOCK
      ?auto_208627 - BLOCK
      ?auto_208628 - BLOCK
      ?auto_208629 - BLOCK
      ?auto_208630 - BLOCK
      ?auto_208631 - BLOCK
      ?auto_208632 - BLOCK
    )
    :vars
    (
      ?auto_208633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208632 ?auto_208633 ) ( ON-TABLE ?auto_208620 ) ( ON ?auto_208621 ?auto_208620 ) ( ON ?auto_208622 ?auto_208621 ) ( ON ?auto_208623 ?auto_208622 ) ( ON ?auto_208624 ?auto_208623 ) ( not ( = ?auto_208620 ?auto_208621 ) ) ( not ( = ?auto_208620 ?auto_208622 ) ) ( not ( = ?auto_208620 ?auto_208623 ) ) ( not ( = ?auto_208620 ?auto_208624 ) ) ( not ( = ?auto_208620 ?auto_208625 ) ) ( not ( = ?auto_208620 ?auto_208626 ) ) ( not ( = ?auto_208620 ?auto_208627 ) ) ( not ( = ?auto_208620 ?auto_208628 ) ) ( not ( = ?auto_208620 ?auto_208629 ) ) ( not ( = ?auto_208620 ?auto_208630 ) ) ( not ( = ?auto_208620 ?auto_208631 ) ) ( not ( = ?auto_208620 ?auto_208632 ) ) ( not ( = ?auto_208620 ?auto_208633 ) ) ( not ( = ?auto_208621 ?auto_208622 ) ) ( not ( = ?auto_208621 ?auto_208623 ) ) ( not ( = ?auto_208621 ?auto_208624 ) ) ( not ( = ?auto_208621 ?auto_208625 ) ) ( not ( = ?auto_208621 ?auto_208626 ) ) ( not ( = ?auto_208621 ?auto_208627 ) ) ( not ( = ?auto_208621 ?auto_208628 ) ) ( not ( = ?auto_208621 ?auto_208629 ) ) ( not ( = ?auto_208621 ?auto_208630 ) ) ( not ( = ?auto_208621 ?auto_208631 ) ) ( not ( = ?auto_208621 ?auto_208632 ) ) ( not ( = ?auto_208621 ?auto_208633 ) ) ( not ( = ?auto_208622 ?auto_208623 ) ) ( not ( = ?auto_208622 ?auto_208624 ) ) ( not ( = ?auto_208622 ?auto_208625 ) ) ( not ( = ?auto_208622 ?auto_208626 ) ) ( not ( = ?auto_208622 ?auto_208627 ) ) ( not ( = ?auto_208622 ?auto_208628 ) ) ( not ( = ?auto_208622 ?auto_208629 ) ) ( not ( = ?auto_208622 ?auto_208630 ) ) ( not ( = ?auto_208622 ?auto_208631 ) ) ( not ( = ?auto_208622 ?auto_208632 ) ) ( not ( = ?auto_208622 ?auto_208633 ) ) ( not ( = ?auto_208623 ?auto_208624 ) ) ( not ( = ?auto_208623 ?auto_208625 ) ) ( not ( = ?auto_208623 ?auto_208626 ) ) ( not ( = ?auto_208623 ?auto_208627 ) ) ( not ( = ?auto_208623 ?auto_208628 ) ) ( not ( = ?auto_208623 ?auto_208629 ) ) ( not ( = ?auto_208623 ?auto_208630 ) ) ( not ( = ?auto_208623 ?auto_208631 ) ) ( not ( = ?auto_208623 ?auto_208632 ) ) ( not ( = ?auto_208623 ?auto_208633 ) ) ( not ( = ?auto_208624 ?auto_208625 ) ) ( not ( = ?auto_208624 ?auto_208626 ) ) ( not ( = ?auto_208624 ?auto_208627 ) ) ( not ( = ?auto_208624 ?auto_208628 ) ) ( not ( = ?auto_208624 ?auto_208629 ) ) ( not ( = ?auto_208624 ?auto_208630 ) ) ( not ( = ?auto_208624 ?auto_208631 ) ) ( not ( = ?auto_208624 ?auto_208632 ) ) ( not ( = ?auto_208624 ?auto_208633 ) ) ( not ( = ?auto_208625 ?auto_208626 ) ) ( not ( = ?auto_208625 ?auto_208627 ) ) ( not ( = ?auto_208625 ?auto_208628 ) ) ( not ( = ?auto_208625 ?auto_208629 ) ) ( not ( = ?auto_208625 ?auto_208630 ) ) ( not ( = ?auto_208625 ?auto_208631 ) ) ( not ( = ?auto_208625 ?auto_208632 ) ) ( not ( = ?auto_208625 ?auto_208633 ) ) ( not ( = ?auto_208626 ?auto_208627 ) ) ( not ( = ?auto_208626 ?auto_208628 ) ) ( not ( = ?auto_208626 ?auto_208629 ) ) ( not ( = ?auto_208626 ?auto_208630 ) ) ( not ( = ?auto_208626 ?auto_208631 ) ) ( not ( = ?auto_208626 ?auto_208632 ) ) ( not ( = ?auto_208626 ?auto_208633 ) ) ( not ( = ?auto_208627 ?auto_208628 ) ) ( not ( = ?auto_208627 ?auto_208629 ) ) ( not ( = ?auto_208627 ?auto_208630 ) ) ( not ( = ?auto_208627 ?auto_208631 ) ) ( not ( = ?auto_208627 ?auto_208632 ) ) ( not ( = ?auto_208627 ?auto_208633 ) ) ( not ( = ?auto_208628 ?auto_208629 ) ) ( not ( = ?auto_208628 ?auto_208630 ) ) ( not ( = ?auto_208628 ?auto_208631 ) ) ( not ( = ?auto_208628 ?auto_208632 ) ) ( not ( = ?auto_208628 ?auto_208633 ) ) ( not ( = ?auto_208629 ?auto_208630 ) ) ( not ( = ?auto_208629 ?auto_208631 ) ) ( not ( = ?auto_208629 ?auto_208632 ) ) ( not ( = ?auto_208629 ?auto_208633 ) ) ( not ( = ?auto_208630 ?auto_208631 ) ) ( not ( = ?auto_208630 ?auto_208632 ) ) ( not ( = ?auto_208630 ?auto_208633 ) ) ( not ( = ?auto_208631 ?auto_208632 ) ) ( not ( = ?auto_208631 ?auto_208633 ) ) ( not ( = ?auto_208632 ?auto_208633 ) ) ( ON ?auto_208631 ?auto_208632 ) ( ON ?auto_208630 ?auto_208631 ) ( ON ?auto_208629 ?auto_208630 ) ( ON ?auto_208628 ?auto_208629 ) ( ON ?auto_208627 ?auto_208628 ) ( ON ?auto_208626 ?auto_208627 ) ( CLEAR ?auto_208624 ) ( ON ?auto_208625 ?auto_208626 ) ( CLEAR ?auto_208625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208620 ?auto_208621 ?auto_208622 ?auto_208623 ?auto_208624 ?auto_208625 )
      ( MAKE-13PILE ?auto_208620 ?auto_208621 ?auto_208622 ?auto_208623 ?auto_208624 ?auto_208625 ?auto_208626 ?auto_208627 ?auto_208628 ?auto_208629 ?auto_208630 ?auto_208631 ?auto_208632 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208647 - BLOCK
      ?auto_208648 - BLOCK
      ?auto_208649 - BLOCK
      ?auto_208650 - BLOCK
      ?auto_208651 - BLOCK
      ?auto_208652 - BLOCK
      ?auto_208653 - BLOCK
      ?auto_208654 - BLOCK
      ?auto_208655 - BLOCK
      ?auto_208656 - BLOCK
      ?auto_208657 - BLOCK
      ?auto_208658 - BLOCK
      ?auto_208659 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208659 ) ( ON-TABLE ?auto_208647 ) ( ON ?auto_208648 ?auto_208647 ) ( ON ?auto_208649 ?auto_208648 ) ( ON ?auto_208650 ?auto_208649 ) ( ON ?auto_208651 ?auto_208650 ) ( not ( = ?auto_208647 ?auto_208648 ) ) ( not ( = ?auto_208647 ?auto_208649 ) ) ( not ( = ?auto_208647 ?auto_208650 ) ) ( not ( = ?auto_208647 ?auto_208651 ) ) ( not ( = ?auto_208647 ?auto_208652 ) ) ( not ( = ?auto_208647 ?auto_208653 ) ) ( not ( = ?auto_208647 ?auto_208654 ) ) ( not ( = ?auto_208647 ?auto_208655 ) ) ( not ( = ?auto_208647 ?auto_208656 ) ) ( not ( = ?auto_208647 ?auto_208657 ) ) ( not ( = ?auto_208647 ?auto_208658 ) ) ( not ( = ?auto_208647 ?auto_208659 ) ) ( not ( = ?auto_208648 ?auto_208649 ) ) ( not ( = ?auto_208648 ?auto_208650 ) ) ( not ( = ?auto_208648 ?auto_208651 ) ) ( not ( = ?auto_208648 ?auto_208652 ) ) ( not ( = ?auto_208648 ?auto_208653 ) ) ( not ( = ?auto_208648 ?auto_208654 ) ) ( not ( = ?auto_208648 ?auto_208655 ) ) ( not ( = ?auto_208648 ?auto_208656 ) ) ( not ( = ?auto_208648 ?auto_208657 ) ) ( not ( = ?auto_208648 ?auto_208658 ) ) ( not ( = ?auto_208648 ?auto_208659 ) ) ( not ( = ?auto_208649 ?auto_208650 ) ) ( not ( = ?auto_208649 ?auto_208651 ) ) ( not ( = ?auto_208649 ?auto_208652 ) ) ( not ( = ?auto_208649 ?auto_208653 ) ) ( not ( = ?auto_208649 ?auto_208654 ) ) ( not ( = ?auto_208649 ?auto_208655 ) ) ( not ( = ?auto_208649 ?auto_208656 ) ) ( not ( = ?auto_208649 ?auto_208657 ) ) ( not ( = ?auto_208649 ?auto_208658 ) ) ( not ( = ?auto_208649 ?auto_208659 ) ) ( not ( = ?auto_208650 ?auto_208651 ) ) ( not ( = ?auto_208650 ?auto_208652 ) ) ( not ( = ?auto_208650 ?auto_208653 ) ) ( not ( = ?auto_208650 ?auto_208654 ) ) ( not ( = ?auto_208650 ?auto_208655 ) ) ( not ( = ?auto_208650 ?auto_208656 ) ) ( not ( = ?auto_208650 ?auto_208657 ) ) ( not ( = ?auto_208650 ?auto_208658 ) ) ( not ( = ?auto_208650 ?auto_208659 ) ) ( not ( = ?auto_208651 ?auto_208652 ) ) ( not ( = ?auto_208651 ?auto_208653 ) ) ( not ( = ?auto_208651 ?auto_208654 ) ) ( not ( = ?auto_208651 ?auto_208655 ) ) ( not ( = ?auto_208651 ?auto_208656 ) ) ( not ( = ?auto_208651 ?auto_208657 ) ) ( not ( = ?auto_208651 ?auto_208658 ) ) ( not ( = ?auto_208651 ?auto_208659 ) ) ( not ( = ?auto_208652 ?auto_208653 ) ) ( not ( = ?auto_208652 ?auto_208654 ) ) ( not ( = ?auto_208652 ?auto_208655 ) ) ( not ( = ?auto_208652 ?auto_208656 ) ) ( not ( = ?auto_208652 ?auto_208657 ) ) ( not ( = ?auto_208652 ?auto_208658 ) ) ( not ( = ?auto_208652 ?auto_208659 ) ) ( not ( = ?auto_208653 ?auto_208654 ) ) ( not ( = ?auto_208653 ?auto_208655 ) ) ( not ( = ?auto_208653 ?auto_208656 ) ) ( not ( = ?auto_208653 ?auto_208657 ) ) ( not ( = ?auto_208653 ?auto_208658 ) ) ( not ( = ?auto_208653 ?auto_208659 ) ) ( not ( = ?auto_208654 ?auto_208655 ) ) ( not ( = ?auto_208654 ?auto_208656 ) ) ( not ( = ?auto_208654 ?auto_208657 ) ) ( not ( = ?auto_208654 ?auto_208658 ) ) ( not ( = ?auto_208654 ?auto_208659 ) ) ( not ( = ?auto_208655 ?auto_208656 ) ) ( not ( = ?auto_208655 ?auto_208657 ) ) ( not ( = ?auto_208655 ?auto_208658 ) ) ( not ( = ?auto_208655 ?auto_208659 ) ) ( not ( = ?auto_208656 ?auto_208657 ) ) ( not ( = ?auto_208656 ?auto_208658 ) ) ( not ( = ?auto_208656 ?auto_208659 ) ) ( not ( = ?auto_208657 ?auto_208658 ) ) ( not ( = ?auto_208657 ?auto_208659 ) ) ( not ( = ?auto_208658 ?auto_208659 ) ) ( ON ?auto_208658 ?auto_208659 ) ( ON ?auto_208657 ?auto_208658 ) ( ON ?auto_208656 ?auto_208657 ) ( ON ?auto_208655 ?auto_208656 ) ( ON ?auto_208654 ?auto_208655 ) ( ON ?auto_208653 ?auto_208654 ) ( CLEAR ?auto_208651 ) ( ON ?auto_208652 ?auto_208653 ) ( CLEAR ?auto_208652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 ?auto_208652 )
      ( MAKE-13PILE ?auto_208647 ?auto_208648 ?auto_208649 ?auto_208650 ?auto_208651 ?auto_208652 ?auto_208653 ?auto_208654 ?auto_208655 ?auto_208656 ?auto_208657 ?auto_208658 ?auto_208659 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208673 - BLOCK
      ?auto_208674 - BLOCK
      ?auto_208675 - BLOCK
      ?auto_208676 - BLOCK
      ?auto_208677 - BLOCK
      ?auto_208678 - BLOCK
      ?auto_208679 - BLOCK
      ?auto_208680 - BLOCK
      ?auto_208681 - BLOCK
      ?auto_208682 - BLOCK
      ?auto_208683 - BLOCK
      ?auto_208684 - BLOCK
      ?auto_208685 - BLOCK
    )
    :vars
    (
      ?auto_208686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208685 ?auto_208686 ) ( ON-TABLE ?auto_208673 ) ( ON ?auto_208674 ?auto_208673 ) ( ON ?auto_208675 ?auto_208674 ) ( ON ?auto_208676 ?auto_208675 ) ( not ( = ?auto_208673 ?auto_208674 ) ) ( not ( = ?auto_208673 ?auto_208675 ) ) ( not ( = ?auto_208673 ?auto_208676 ) ) ( not ( = ?auto_208673 ?auto_208677 ) ) ( not ( = ?auto_208673 ?auto_208678 ) ) ( not ( = ?auto_208673 ?auto_208679 ) ) ( not ( = ?auto_208673 ?auto_208680 ) ) ( not ( = ?auto_208673 ?auto_208681 ) ) ( not ( = ?auto_208673 ?auto_208682 ) ) ( not ( = ?auto_208673 ?auto_208683 ) ) ( not ( = ?auto_208673 ?auto_208684 ) ) ( not ( = ?auto_208673 ?auto_208685 ) ) ( not ( = ?auto_208673 ?auto_208686 ) ) ( not ( = ?auto_208674 ?auto_208675 ) ) ( not ( = ?auto_208674 ?auto_208676 ) ) ( not ( = ?auto_208674 ?auto_208677 ) ) ( not ( = ?auto_208674 ?auto_208678 ) ) ( not ( = ?auto_208674 ?auto_208679 ) ) ( not ( = ?auto_208674 ?auto_208680 ) ) ( not ( = ?auto_208674 ?auto_208681 ) ) ( not ( = ?auto_208674 ?auto_208682 ) ) ( not ( = ?auto_208674 ?auto_208683 ) ) ( not ( = ?auto_208674 ?auto_208684 ) ) ( not ( = ?auto_208674 ?auto_208685 ) ) ( not ( = ?auto_208674 ?auto_208686 ) ) ( not ( = ?auto_208675 ?auto_208676 ) ) ( not ( = ?auto_208675 ?auto_208677 ) ) ( not ( = ?auto_208675 ?auto_208678 ) ) ( not ( = ?auto_208675 ?auto_208679 ) ) ( not ( = ?auto_208675 ?auto_208680 ) ) ( not ( = ?auto_208675 ?auto_208681 ) ) ( not ( = ?auto_208675 ?auto_208682 ) ) ( not ( = ?auto_208675 ?auto_208683 ) ) ( not ( = ?auto_208675 ?auto_208684 ) ) ( not ( = ?auto_208675 ?auto_208685 ) ) ( not ( = ?auto_208675 ?auto_208686 ) ) ( not ( = ?auto_208676 ?auto_208677 ) ) ( not ( = ?auto_208676 ?auto_208678 ) ) ( not ( = ?auto_208676 ?auto_208679 ) ) ( not ( = ?auto_208676 ?auto_208680 ) ) ( not ( = ?auto_208676 ?auto_208681 ) ) ( not ( = ?auto_208676 ?auto_208682 ) ) ( not ( = ?auto_208676 ?auto_208683 ) ) ( not ( = ?auto_208676 ?auto_208684 ) ) ( not ( = ?auto_208676 ?auto_208685 ) ) ( not ( = ?auto_208676 ?auto_208686 ) ) ( not ( = ?auto_208677 ?auto_208678 ) ) ( not ( = ?auto_208677 ?auto_208679 ) ) ( not ( = ?auto_208677 ?auto_208680 ) ) ( not ( = ?auto_208677 ?auto_208681 ) ) ( not ( = ?auto_208677 ?auto_208682 ) ) ( not ( = ?auto_208677 ?auto_208683 ) ) ( not ( = ?auto_208677 ?auto_208684 ) ) ( not ( = ?auto_208677 ?auto_208685 ) ) ( not ( = ?auto_208677 ?auto_208686 ) ) ( not ( = ?auto_208678 ?auto_208679 ) ) ( not ( = ?auto_208678 ?auto_208680 ) ) ( not ( = ?auto_208678 ?auto_208681 ) ) ( not ( = ?auto_208678 ?auto_208682 ) ) ( not ( = ?auto_208678 ?auto_208683 ) ) ( not ( = ?auto_208678 ?auto_208684 ) ) ( not ( = ?auto_208678 ?auto_208685 ) ) ( not ( = ?auto_208678 ?auto_208686 ) ) ( not ( = ?auto_208679 ?auto_208680 ) ) ( not ( = ?auto_208679 ?auto_208681 ) ) ( not ( = ?auto_208679 ?auto_208682 ) ) ( not ( = ?auto_208679 ?auto_208683 ) ) ( not ( = ?auto_208679 ?auto_208684 ) ) ( not ( = ?auto_208679 ?auto_208685 ) ) ( not ( = ?auto_208679 ?auto_208686 ) ) ( not ( = ?auto_208680 ?auto_208681 ) ) ( not ( = ?auto_208680 ?auto_208682 ) ) ( not ( = ?auto_208680 ?auto_208683 ) ) ( not ( = ?auto_208680 ?auto_208684 ) ) ( not ( = ?auto_208680 ?auto_208685 ) ) ( not ( = ?auto_208680 ?auto_208686 ) ) ( not ( = ?auto_208681 ?auto_208682 ) ) ( not ( = ?auto_208681 ?auto_208683 ) ) ( not ( = ?auto_208681 ?auto_208684 ) ) ( not ( = ?auto_208681 ?auto_208685 ) ) ( not ( = ?auto_208681 ?auto_208686 ) ) ( not ( = ?auto_208682 ?auto_208683 ) ) ( not ( = ?auto_208682 ?auto_208684 ) ) ( not ( = ?auto_208682 ?auto_208685 ) ) ( not ( = ?auto_208682 ?auto_208686 ) ) ( not ( = ?auto_208683 ?auto_208684 ) ) ( not ( = ?auto_208683 ?auto_208685 ) ) ( not ( = ?auto_208683 ?auto_208686 ) ) ( not ( = ?auto_208684 ?auto_208685 ) ) ( not ( = ?auto_208684 ?auto_208686 ) ) ( not ( = ?auto_208685 ?auto_208686 ) ) ( ON ?auto_208684 ?auto_208685 ) ( ON ?auto_208683 ?auto_208684 ) ( ON ?auto_208682 ?auto_208683 ) ( ON ?auto_208681 ?auto_208682 ) ( ON ?auto_208680 ?auto_208681 ) ( ON ?auto_208679 ?auto_208680 ) ( ON ?auto_208678 ?auto_208679 ) ( CLEAR ?auto_208676 ) ( ON ?auto_208677 ?auto_208678 ) ( CLEAR ?auto_208677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208673 ?auto_208674 ?auto_208675 ?auto_208676 ?auto_208677 )
      ( MAKE-13PILE ?auto_208673 ?auto_208674 ?auto_208675 ?auto_208676 ?auto_208677 ?auto_208678 ?auto_208679 ?auto_208680 ?auto_208681 ?auto_208682 ?auto_208683 ?auto_208684 ?auto_208685 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208700 - BLOCK
      ?auto_208701 - BLOCK
      ?auto_208702 - BLOCK
      ?auto_208703 - BLOCK
      ?auto_208704 - BLOCK
      ?auto_208705 - BLOCK
      ?auto_208706 - BLOCK
      ?auto_208707 - BLOCK
      ?auto_208708 - BLOCK
      ?auto_208709 - BLOCK
      ?auto_208710 - BLOCK
      ?auto_208711 - BLOCK
      ?auto_208712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208712 ) ( ON-TABLE ?auto_208700 ) ( ON ?auto_208701 ?auto_208700 ) ( ON ?auto_208702 ?auto_208701 ) ( ON ?auto_208703 ?auto_208702 ) ( not ( = ?auto_208700 ?auto_208701 ) ) ( not ( = ?auto_208700 ?auto_208702 ) ) ( not ( = ?auto_208700 ?auto_208703 ) ) ( not ( = ?auto_208700 ?auto_208704 ) ) ( not ( = ?auto_208700 ?auto_208705 ) ) ( not ( = ?auto_208700 ?auto_208706 ) ) ( not ( = ?auto_208700 ?auto_208707 ) ) ( not ( = ?auto_208700 ?auto_208708 ) ) ( not ( = ?auto_208700 ?auto_208709 ) ) ( not ( = ?auto_208700 ?auto_208710 ) ) ( not ( = ?auto_208700 ?auto_208711 ) ) ( not ( = ?auto_208700 ?auto_208712 ) ) ( not ( = ?auto_208701 ?auto_208702 ) ) ( not ( = ?auto_208701 ?auto_208703 ) ) ( not ( = ?auto_208701 ?auto_208704 ) ) ( not ( = ?auto_208701 ?auto_208705 ) ) ( not ( = ?auto_208701 ?auto_208706 ) ) ( not ( = ?auto_208701 ?auto_208707 ) ) ( not ( = ?auto_208701 ?auto_208708 ) ) ( not ( = ?auto_208701 ?auto_208709 ) ) ( not ( = ?auto_208701 ?auto_208710 ) ) ( not ( = ?auto_208701 ?auto_208711 ) ) ( not ( = ?auto_208701 ?auto_208712 ) ) ( not ( = ?auto_208702 ?auto_208703 ) ) ( not ( = ?auto_208702 ?auto_208704 ) ) ( not ( = ?auto_208702 ?auto_208705 ) ) ( not ( = ?auto_208702 ?auto_208706 ) ) ( not ( = ?auto_208702 ?auto_208707 ) ) ( not ( = ?auto_208702 ?auto_208708 ) ) ( not ( = ?auto_208702 ?auto_208709 ) ) ( not ( = ?auto_208702 ?auto_208710 ) ) ( not ( = ?auto_208702 ?auto_208711 ) ) ( not ( = ?auto_208702 ?auto_208712 ) ) ( not ( = ?auto_208703 ?auto_208704 ) ) ( not ( = ?auto_208703 ?auto_208705 ) ) ( not ( = ?auto_208703 ?auto_208706 ) ) ( not ( = ?auto_208703 ?auto_208707 ) ) ( not ( = ?auto_208703 ?auto_208708 ) ) ( not ( = ?auto_208703 ?auto_208709 ) ) ( not ( = ?auto_208703 ?auto_208710 ) ) ( not ( = ?auto_208703 ?auto_208711 ) ) ( not ( = ?auto_208703 ?auto_208712 ) ) ( not ( = ?auto_208704 ?auto_208705 ) ) ( not ( = ?auto_208704 ?auto_208706 ) ) ( not ( = ?auto_208704 ?auto_208707 ) ) ( not ( = ?auto_208704 ?auto_208708 ) ) ( not ( = ?auto_208704 ?auto_208709 ) ) ( not ( = ?auto_208704 ?auto_208710 ) ) ( not ( = ?auto_208704 ?auto_208711 ) ) ( not ( = ?auto_208704 ?auto_208712 ) ) ( not ( = ?auto_208705 ?auto_208706 ) ) ( not ( = ?auto_208705 ?auto_208707 ) ) ( not ( = ?auto_208705 ?auto_208708 ) ) ( not ( = ?auto_208705 ?auto_208709 ) ) ( not ( = ?auto_208705 ?auto_208710 ) ) ( not ( = ?auto_208705 ?auto_208711 ) ) ( not ( = ?auto_208705 ?auto_208712 ) ) ( not ( = ?auto_208706 ?auto_208707 ) ) ( not ( = ?auto_208706 ?auto_208708 ) ) ( not ( = ?auto_208706 ?auto_208709 ) ) ( not ( = ?auto_208706 ?auto_208710 ) ) ( not ( = ?auto_208706 ?auto_208711 ) ) ( not ( = ?auto_208706 ?auto_208712 ) ) ( not ( = ?auto_208707 ?auto_208708 ) ) ( not ( = ?auto_208707 ?auto_208709 ) ) ( not ( = ?auto_208707 ?auto_208710 ) ) ( not ( = ?auto_208707 ?auto_208711 ) ) ( not ( = ?auto_208707 ?auto_208712 ) ) ( not ( = ?auto_208708 ?auto_208709 ) ) ( not ( = ?auto_208708 ?auto_208710 ) ) ( not ( = ?auto_208708 ?auto_208711 ) ) ( not ( = ?auto_208708 ?auto_208712 ) ) ( not ( = ?auto_208709 ?auto_208710 ) ) ( not ( = ?auto_208709 ?auto_208711 ) ) ( not ( = ?auto_208709 ?auto_208712 ) ) ( not ( = ?auto_208710 ?auto_208711 ) ) ( not ( = ?auto_208710 ?auto_208712 ) ) ( not ( = ?auto_208711 ?auto_208712 ) ) ( ON ?auto_208711 ?auto_208712 ) ( ON ?auto_208710 ?auto_208711 ) ( ON ?auto_208709 ?auto_208710 ) ( ON ?auto_208708 ?auto_208709 ) ( ON ?auto_208707 ?auto_208708 ) ( ON ?auto_208706 ?auto_208707 ) ( ON ?auto_208705 ?auto_208706 ) ( CLEAR ?auto_208703 ) ( ON ?auto_208704 ?auto_208705 ) ( CLEAR ?auto_208704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_208700 ?auto_208701 ?auto_208702 ?auto_208703 ?auto_208704 )
      ( MAKE-13PILE ?auto_208700 ?auto_208701 ?auto_208702 ?auto_208703 ?auto_208704 ?auto_208705 ?auto_208706 ?auto_208707 ?auto_208708 ?auto_208709 ?auto_208710 ?auto_208711 ?auto_208712 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208726 - BLOCK
      ?auto_208727 - BLOCK
      ?auto_208728 - BLOCK
      ?auto_208729 - BLOCK
      ?auto_208730 - BLOCK
      ?auto_208731 - BLOCK
      ?auto_208732 - BLOCK
      ?auto_208733 - BLOCK
      ?auto_208734 - BLOCK
      ?auto_208735 - BLOCK
      ?auto_208736 - BLOCK
      ?auto_208737 - BLOCK
      ?auto_208738 - BLOCK
    )
    :vars
    (
      ?auto_208739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208738 ?auto_208739 ) ( ON-TABLE ?auto_208726 ) ( ON ?auto_208727 ?auto_208726 ) ( ON ?auto_208728 ?auto_208727 ) ( not ( = ?auto_208726 ?auto_208727 ) ) ( not ( = ?auto_208726 ?auto_208728 ) ) ( not ( = ?auto_208726 ?auto_208729 ) ) ( not ( = ?auto_208726 ?auto_208730 ) ) ( not ( = ?auto_208726 ?auto_208731 ) ) ( not ( = ?auto_208726 ?auto_208732 ) ) ( not ( = ?auto_208726 ?auto_208733 ) ) ( not ( = ?auto_208726 ?auto_208734 ) ) ( not ( = ?auto_208726 ?auto_208735 ) ) ( not ( = ?auto_208726 ?auto_208736 ) ) ( not ( = ?auto_208726 ?auto_208737 ) ) ( not ( = ?auto_208726 ?auto_208738 ) ) ( not ( = ?auto_208726 ?auto_208739 ) ) ( not ( = ?auto_208727 ?auto_208728 ) ) ( not ( = ?auto_208727 ?auto_208729 ) ) ( not ( = ?auto_208727 ?auto_208730 ) ) ( not ( = ?auto_208727 ?auto_208731 ) ) ( not ( = ?auto_208727 ?auto_208732 ) ) ( not ( = ?auto_208727 ?auto_208733 ) ) ( not ( = ?auto_208727 ?auto_208734 ) ) ( not ( = ?auto_208727 ?auto_208735 ) ) ( not ( = ?auto_208727 ?auto_208736 ) ) ( not ( = ?auto_208727 ?auto_208737 ) ) ( not ( = ?auto_208727 ?auto_208738 ) ) ( not ( = ?auto_208727 ?auto_208739 ) ) ( not ( = ?auto_208728 ?auto_208729 ) ) ( not ( = ?auto_208728 ?auto_208730 ) ) ( not ( = ?auto_208728 ?auto_208731 ) ) ( not ( = ?auto_208728 ?auto_208732 ) ) ( not ( = ?auto_208728 ?auto_208733 ) ) ( not ( = ?auto_208728 ?auto_208734 ) ) ( not ( = ?auto_208728 ?auto_208735 ) ) ( not ( = ?auto_208728 ?auto_208736 ) ) ( not ( = ?auto_208728 ?auto_208737 ) ) ( not ( = ?auto_208728 ?auto_208738 ) ) ( not ( = ?auto_208728 ?auto_208739 ) ) ( not ( = ?auto_208729 ?auto_208730 ) ) ( not ( = ?auto_208729 ?auto_208731 ) ) ( not ( = ?auto_208729 ?auto_208732 ) ) ( not ( = ?auto_208729 ?auto_208733 ) ) ( not ( = ?auto_208729 ?auto_208734 ) ) ( not ( = ?auto_208729 ?auto_208735 ) ) ( not ( = ?auto_208729 ?auto_208736 ) ) ( not ( = ?auto_208729 ?auto_208737 ) ) ( not ( = ?auto_208729 ?auto_208738 ) ) ( not ( = ?auto_208729 ?auto_208739 ) ) ( not ( = ?auto_208730 ?auto_208731 ) ) ( not ( = ?auto_208730 ?auto_208732 ) ) ( not ( = ?auto_208730 ?auto_208733 ) ) ( not ( = ?auto_208730 ?auto_208734 ) ) ( not ( = ?auto_208730 ?auto_208735 ) ) ( not ( = ?auto_208730 ?auto_208736 ) ) ( not ( = ?auto_208730 ?auto_208737 ) ) ( not ( = ?auto_208730 ?auto_208738 ) ) ( not ( = ?auto_208730 ?auto_208739 ) ) ( not ( = ?auto_208731 ?auto_208732 ) ) ( not ( = ?auto_208731 ?auto_208733 ) ) ( not ( = ?auto_208731 ?auto_208734 ) ) ( not ( = ?auto_208731 ?auto_208735 ) ) ( not ( = ?auto_208731 ?auto_208736 ) ) ( not ( = ?auto_208731 ?auto_208737 ) ) ( not ( = ?auto_208731 ?auto_208738 ) ) ( not ( = ?auto_208731 ?auto_208739 ) ) ( not ( = ?auto_208732 ?auto_208733 ) ) ( not ( = ?auto_208732 ?auto_208734 ) ) ( not ( = ?auto_208732 ?auto_208735 ) ) ( not ( = ?auto_208732 ?auto_208736 ) ) ( not ( = ?auto_208732 ?auto_208737 ) ) ( not ( = ?auto_208732 ?auto_208738 ) ) ( not ( = ?auto_208732 ?auto_208739 ) ) ( not ( = ?auto_208733 ?auto_208734 ) ) ( not ( = ?auto_208733 ?auto_208735 ) ) ( not ( = ?auto_208733 ?auto_208736 ) ) ( not ( = ?auto_208733 ?auto_208737 ) ) ( not ( = ?auto_208733 ?auto_208738 ) ) ( not ( = ?auto_208733 ?auto_208739 ) ) ( not ( = ?auto_208734 ?auto_208735 ) ) ( not ( = ?auto_208734 ?auto_208736 ) ) ( not ( = ?auto_208734 ?auto_208737 ) ) ( not ( = ?auto_208734 ?auto_208738 ) ) ( not ( = ?auto_208734 ?auto_208739 ) ) ( not ( = ?auto_208735 ?auto_208736 ) ) ( not ( = ?auto_208735 ?auto_208737 ) ) ( not ( = ?auto_208735 ?auto_208738 ) ) ( not ( = ?auto_208735 ?auto_208739 ) ) ( not ( = ?auto_208736 ?auto_208737 ) ) ( not ( = ?auto_208736 ?auto_208738 ) ) ( not ( = ?auto_208736 ?auto_208739 ) ) ( not ( = ?auto_208737 ?auto_208738 ) ) ( not ( = ?auto_208737 ?auto_208739 ) ) ( not ( = ?auto_208738 ?auto_208739 ) ) ( ON ?auto_208737 ?auto_208738 ) ( ON ?auto_208736 ?auto_208737 ) ( ON ?auto_208735 ?auto_208736 ) ( ON ?auto_208734 ?auto_208735 ) ( ON ?auto_208733 ?auto_208734 ) ( ON ?auto_208732 ?auto_208733 ) ( ON ?auto_208731 ?auto_208732 ) ( ON ?auto_208730 ?auto_208731 ) ( CLEAR ?auto_208728 ) ( ON ?auto_208729 ?auto_208730 ) ( CLEAR ?auto_208729 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208726 ?auto_208727 ?auto_208728 ?auto_208729 )
      ( MAKE-13PILE ?auto_208726 ?auto_208727 ?auto_208728 ?auto_208729 ?auto_208730 ?auto_208731 ?auto_208732 ?auto_208733 ?auto_208734 ?auto_208735 ?auto_208736 ?auto_208737 ?auto_208738 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208753 - BLOCK
      ?auto_208754 - BLOCK
      ?auto_208755 - BLOCK
      ?auto_208756 - BLOCK
      ?auto_208757 - BLOCK
      ?auto_208758 - BLOCK
      ?auto_208759 - BLOCK
      ?auto_208760 - BLOCK
      ?auto_208761 - BLOCK
      ?auto_208762 - BLOCK
      ?auto_208763 - BLOCK
      ?auto_208764 - BLOCK
      ?auto_208765 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208765 ) ( ON-TABLE ?auto_208753 ) ( ON ?auto_208754 ?auto_208753 ) ( ON ?auto_208755 ?auto_208754 ) ( not ( = ?auto_208753 ?auto_208754 ) ) ( not ( = ?auto_208753 ?auto_208755 ) ) ( not ( = ?auto_208753 ?auto_208756 ) ) ( not ( = ?auto_208753 ?auto_208757 ) ) ( not ( = ?auto_208753 ?auto_208758 ) ) ( not ( = ?auto_208753 ?auto_208759 ) ) ( not ( = ?auto_208753 ?auto_208760 ) ) ( not ( = ?auto_208753 ?auto_208761 ) ) ( not ( = ?auto_208753 ?auto_208762 ) ) ( not ( = ?auto_208753 ?auto_208763 ) ) ( not ( = ?auto_208753 ?auto_208764 ) ) ( not ( = ?auto_208753 ?auto_208765 ) ) ( not ( = ?auto_208754 ?auto_208755 ) ) ( not ( = ?auto_208754 ?auto_208756 ) ) ( not ( = ?auto_208754 ?auto_208757 ) ) ( not ( = ?auto_208754 ?auto_208758 ) ) ( not ( = ?auto_208754 ?auto_208759 ) ) ( not ( = ?auto_208754 ?auto_208760 ) ) ( not ( = ?auto_208754 ?auto_208761 ) ) ( not ( = ?auto_208754 ?auto_208762 ) ) ( not ( = ?auto_208754 ?auto_208763 ) ) ( not ( = ?auto_208754 ?auto_208764 ) ) ( not ( = ?auto_208754 ?auto_208765 ) ) ( not ( = ?auto_208755 ?auto_208756 ) ) ( not ( = ?auto_208755 ?auto_208757 ) ) ( not ( = ?auto_208755 ?auto_208758 ) ) ( not ( = ?auto_208755 ?auto_208759 ) ) ( not ( = ?auto_208755 ?auto_208760 ) ) ( not ( = ?auto_208755 ?auto_208761 ) ) ( not ( = ?auto_208755 ?auto_208762 ) ) ( not ( = ?auto_208755 ?auto_208763 ) ) ( not ( = ?auto_208755 ?auto_208764 ) ) ( not ( = ?auto_208755 ?auto_208765 ) ) ( not ( = ?auto_208756 ?auto_208757 ) ) ( not ( = ?auto_208756 ?auto_208758 ) ) ( not ( = ?auto_208756 ?auto_208759 ) ) ( not ( = ?auto_208756 ?auto_208760 ) ) ( not ( = ?auto_208756 ?auto_208761 ) ) ( not ( = ?auto_208756 ?auto_208762 ) ) ( not ( = ?auto_208756 ?auto_208763 ) ) ( not ( = ?auto_208756 ?auto_208764 ) ) ( not ( = ?auto_208756 ?auto_208765 ) ) ( not ( = ?auto_208757 ?auto_208758 ) ) ( not ( = ?auto_208757 ?auto_208759 ) ) ( not ( = ?auto_208757 ?auto_208760 ) ) ( not ( = ?auto_208757 ?auto_208761 ) ) ( not ( = ?auto_208757 ?auto_208762 ) ) ( not ( = ?auto_208757 ?auto_208763 ) ) ( not ( = ?auto_208757 ?auto_208764 ) ) ( not ( = ?auto_208757 ?auto_208765 ) ) ( not ( = ?auto_208758 ?auto_208759 ) ) ( not ( = ?auto_208758 ?auto_208760 ) ) ( not ( = ?auto_208758 ?auto_208761 ) ) ( not ( = ?auto_208758 ?auto_208762 ) ) ( not ( = ?auto_208758 ?auto_208763 ) ) ( not ( = ?auto_208758 ?auto_208764 ) ) ( not ( = ?auto_208758 ?auto_208765 ) ) ( not ( = ?auto_208759 ?auto_208760 ) ) ( not ( = ?auto_208759 ?auto_208761 ) ) ( not ( = ?auto_208759 ?auto_208762 ) ) ( not ( = ?auto_208759 ?auto_208763 ) ) ( not ( = ?auto_208759 ?auto_208764 ) ) ( not ( = ?auto_208759 ?auto_208765 ) ) ( not ( = ?auto_208760 ?auto_208761 ) ) ( not ( = ?auto_208760 ?auto_208762 ) ) ( not ( = ?auto_208760 ?auto_208763 ) ) ( not ( = ?auto_208760 ?auto_208764 ) ) ( not ( = ?auto_208760 ?auto_208765 ) ) ( not ( = ?auto_208761 ?auto_208762 ) ) ( not ( = ?auto_208761 ?auto_208763 ) ) ( not ( = ?auto_208761 ?auto_208764 ) ) ( not ( = ?auto_208761 ?auto_208765 ) ) ( not ( = ?auto_208762 ?auto_208763 ) ) ( not ( = ?auto_208762 ?auto_208764 ) ) ( not ( = ?auto_208762 ?auto_208765 ) ) ( not ( = ?auto_208763 ?auto_208764 ) ) ( not ( = ?auto_208763 ?auto_208765 ) ) ( not ( = ?auto_208764 ?auto_208765 ) ) ( ON ?auto_208764 ?auto_208765 ) ( ON ?auto_208763 ?auto_208764 ) ( ON ?auto_208762 ?auto_208763 ) ( ON ?auto_208761 ?auto_208762 ) ( ON ?auto_208760 ?auto_208761 ) ( ON ?auto_208759 ?auto_208760 ) ( ON ?auto_208758 ?auto_208759 ) ( ON ?auto_208757 ?auto_208758 ) ( CLEAR ?auto_208755 ) ( ON ?auto_208756 ?auto_208757 ) ( CLEAR ?auto_208756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_208753 ?auto_208754 ?auto_208755 ?auto_208756 )
      ( MAKE-13PILE ?auto_208753 ?auto_208754 ?auto_208755 ?auto_208756 ?auto_208757 ?auto_208758 ?auto_208759 ?auto_208760 ?auto_208761 ?auto_208762 ?auto_208763 ?auto_208764 ?auto_208765 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208779 - BLOCK
      ?auto_208780 - BLOCK
      ?auto_208781 - BLOCK
      ?auto_208782 - BLOCK
      ?auto_208783 - BLOCK
      ?auto_208784 - BLOCK
      ?auto_208785 - BLOCK
      ?auto_208786 - BLOCK
      ?auto_208787 - BLOCK
      ?auto_208788 - BLOCK
      ?auto_208789 - BLOCK
      ?auto_208790 - BLOCK
      ?auto_208791 - BLOCK
    )
    :vars
    (
      ?auto_208792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208791 ?auto_208792 ) ( ON-TABLE ?auto_208779 ) ( ON ?auto_208780 ?auto_208779 ) ( not ( = ?auto_208779 ?auto_208780 ) ) ( not ( = ?auto_208779 ?auto_208781 ) ) ( not ( = ?auto_208779 ?auto_208782 ) ) ( not ( = ?auto_208779 ?auto_208783 ) ) ( not ( = ?auto_208779 ?auto_208784 ) ) ( not ( = ?auto_208779 ?auto_208785 ) ) ( not ( = ?auto_208779 ?auto_208786 ) ) ( not ( = ?auto_208779 ?auto_208787 ) ) ( not ( = ?auto_208779 ?auto_208788 ) ) ( not ( = ?auto_208779 ?auto_208789 ) ) ( not ( = ?auto_208779 ?auto_208790 ) ) ( not ( = ?auto_208779 ?auto_208791 ) ) ( not ( = ?auto_208779 ?auto_208792 ) ) ( not ( = ?auto_208780 ?auto_208781 ) ) ( not ( = ?auto_208780 ?auto_208782 ) ) ( not ( = ?auto_208780 ?auto_208783 ) ) ( not ( = ?auto_208780 ?auto_208784 ) ) ( not ( = ?auto_208780 ?auto_208785 ) ) ( not ( = ?auto_208780 ?auto_208786 ) ) ( not ( = ?auto_208780 ?auto_208787 ) ) ( not ( = ?auto_208780 ?auto_208788 ) ) ( not ( = ?auto_208780 ?auto_208789 ) ) ( not ( = ?auto_208780 ?auto_208790 ) ) ( not ( = ?auto_208780 ?auto_208791 ) ) ( not ( = ?auto_208780 ?auto_208792 ) ) ( not ( = ?auto_208781 ?auto_208782 ) ) ( not ( = ?auto_208781 ?auto_208783 ) ) ( not ( = ?auto_208781 ?auto_208784 ) ) ( not ( = ?auto_208781 ?auto_208785 ) ) ( not ( = ?auto_208781 ?auto_208786 ) ) ( not ( = ?auto_208781 ?auto_208787 ) ) ( not ( = ?auto_208781 ?auto_208788 ) ) ( not ( = ?auto_208781 ?auto_208789 ) ) ( not ( = ?auto_208781 ?auto_208790 ) ) ( not ( = ?auto_208781 ?auto_208791 ) ) ( not ( = ?auto_208781 ?auto_208792 ) ) ( not ( = ?auto_208782 ?auto_208783 ) ) ( not ( = ?auto_208782 ?auto_208784 ) ) ( not ( = ?auto_208782 ?auto_208785 ) ) ( not ( = ?auto_208782 ?auto_208786 ) ) ( not ( = ?auto_208782 ?auto_208787 ) ) ( not ( = ?auto_208782 ?auto_208788 ) ) ( not ( = ?auto_208782 ?auto_208789 ) ) ( not ( = ?auto_208782 ?auto_208790 ) ) ( not ( = ?auto_208782 ?auto_208791 ) ) ( not ( = ?auto_208782 ?auto_208792 ) ) ( not ( = ?auto_208783 ?auto_208784 ) ) ( not ( = ?auto_208783 ?auto_208785 ) ) ( not ( = ?auto_208783 ?auto_208786 ) ) ( not ( = ?auto_208783 ?auto_208787 ) ) ( not ( = ?auto_208783 ?auto_208788 ) ) ( not ( = ?auto_208783 ?auto_208789 ) ) ( not ( = ?auto_208783 ?auto_208790 ) ) ( not ( = ?auto_208783 ?auto_208791 ) ) ( not ( = ?auto_208783 ?auto_208792 ) ) ( not ( = ?auto_208784 ?auto_208785 ) ) ( not ( = ?auto_208784 ?auto_208786 ) ) ( not ( = ?auto_208784 ?auto_208787 ) ) ( not ( = ?auto_208784 ?auto_208788 ) ) ( not ( = ?auto_208784 ?auto_208789 ) ) ( not ( = ?auto_208784 ?auto_208790 ) ) ( not ( = ?auto_208784 ?auto_208791 ) ) ( not ( = ?auto_208784 ?auto_208792 ) ) ( not ( = ?auto_208785 ?auto_208786 ) ) ( not ( = ?auto_208785 ?auto_208787 ) ) ( not ( = ?auto_208785 ?auto_208788 ) ) ( not ( = ?auto_208785 ?auto_208789 ) ) ( not ( = ?auto_208785 ?auto_208790 ) ) ( not ( = ?auto_208785 ?auto_208791 ) ) ( not ( = ?auto_208785 ?auto_208792 ) ) ( not ( = ?auto_208786 ?auto_208787 ) ) ( not ( = ?auto_208786 ?auto_208788 ) ) ( not ( = ?auto_208786 ?auto_208789 ) ) ( not ( = ?auto_208786 ?auto_208790 ) ) ( not ( = ?auto_208786 ?auto_208791 ) ) ( not ( = ?auto_208786 ?auto_208792 ) ) ( not ( = ?auto_208787 ?auto_208788 ) ) ( not ( = ?auto_208787 ?auto_208789 ) ) ( not ( = ?auto_208787 ?auto_208790 ) ) ( not ( = ?auto_208787 ?auto_208791 ) ) ( not ( = ?auto_208787 ?auto_208792 ) ) ( not ( = ?auto_208788 ?auto_208789 ) ) ( not ( = ?auto_208788 ?auto_208790 ) ) ( not ( = ?auto_208788 ?auto_208791 ) ) ( not ( = ?auto_208788 ?auto_208792 ) ) ( not ( = ?auto_208789 ?auto_208790 ) ) ( not ( = ?auto_208789 ?auto_208791 ) ) ( not ( = ?auto_208789 ?auto_208792 ) ) ( not ( = ?auto_208790 ?auto_208791 ) ) ( not ( = ?auto_208790 ?auto_208792 ) ) ( not ( = ?auto_208791 ?auto_208792 ) ) ( ON ?auto_208790 ?auto_208791 ) ( ON ?auto_208789 ?auto_208790 ) ( ON ?auto_208788 ?auto_208789 ) ( ON ?auto_208787 ?auto_208788 ) ( ON ?auto_208786 ?auto_208787 ) ( ON ?auto_208785 ?auto_208786 ) ( ON ?auto_208784 ?auto_208785 ) ( ON ?auto_208783 ?auto_208784 ) ( ON ?auto_208782 ?auto_208783 ) ( CLEAR ?auto_208780 ) ( ON ?auto_208781 ?auto_208782 ) ( CLEAR ?auto_208781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208779 ?auto_208780 ?auto_208781 )
      ( MAKE-13PILE ?auto_208779 ?auto_208780 ?auto_208781 ?auto_208782 ?auto_208783 ?auto_208784 ?auto_208785 ?auto_208786 ?auto_208787 ?auto_208788 ?auto_208789 ?auto_208790 ?auto_208791 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208806 - BLOCK
      ?auto_208807 - BLOCK
      ?auto_208808 - BLOCK
      ?auto_208809 - BLOCK
      ?auto_208810 - BLOCK
      ?auto_208811 - BLOCK
      ?auto_208812 - BLOCK
      ?auto_208813 - BLOCK
      ?auto_208814 - BLOCK
      ?auto_208815 - BLOCK
      ?auto_208816 - BLOCK
      ?auto_208817 - BLOCK
      ?auto_208818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208818 ) ( ON-TABLE ?auto_208806 ) ( ON ?auto_208807 ?auto_208806 ) ( not ( = ?auto_208806 ?auto_208807 ) ) ( not ( = ?auto_208806 ?auto_208808 ) ) ( not ( = ?auto_208806 ?auto_208809 ) ) ( not ( = ?auto_208806 ?auto_208810 ) ) ( not ( = ?auto_208806 ?auto_208811 ) ) ( not ( = ?auto_208806 ?auto_208812 ) ) ( not ( = ?auto_208806 ?auto_208813 ) ) ( not ( = ?auto_208806 ?auto_208814 ) ) ( not ( = ?auto_208806 ?auto_208815 ) ) ( not ( = ?auto_208806 ?auto_208816 ) ) ( not ( = ?auto_208806 ?auto_208817 ) ) ( not ( = ?auto_208806 ?auto_208818 ) ) ( not ( = ?auto_208807 ?auto_208808 ) ) ( not ( = ?auto_208807 ?auto_208809 ) ) ( not ( = ?auto_208807 ?auto_208810 ) ) ( not ( = ?auto_208807 ?auto_208811 ) ) ( not ( = ?auto_208807 ?auto_208812 ) ) ( not ( = ?auto_208807 ?auto_208813 ) ) ( not ( = ?auto_208807 ?auto_208814 ) ) ( not ( = ?auto_208807 ?auto_208815 ) ) ( not ( = ?auto_208807 ?auto_208816 ) ) ( not ( = ?auto_208807 ?auto_208817 ) ) ( not ( = ?auto_208807 ?auto_208818 ) ) ( not ( = ?auto_208808 ?auto_208809 ) ) ( not ( = ?auto_208808 ?auto_208810 ) ) ( not ( = ?auto_208808 ?auto_208811 ) ) ( not ( = ?auto_208808 ?auto_208812 ) ) ( not ( = ?auto_208808 ?auto_208813 ) ) ( not ( = ?auto_208808 ?auto_208814 ) ) ( not ( = ?auto_208808 ?auto_208815 ) ) ( not ( = ?auto_208808 ?auto_208816 ) ) ( not ( = ?auto_208808 ?auto_208817 ) ) ( not ( = ?auto_208808 ?auto_208818 ) ) ( not ( = ?auto_208809 ?auto_208810 ) ) ( not ( = ?auto_208809 ?auto_208811 ) ) ( not ( = ?auto_208809 ?auto_208812 ) ) ( not ( = ?auto_208809 ?auto_208813 ) ) ( not ( = ?auto_208809 ?auto_208814 ) ) ( not ( = ?auto_208809 ?auto_208815 ) ) ( not ( = ?auto_208809 ?auto_208816 ) ) ( not ( = ?auto_208809 ?auto_208817 ) ) ( not ( = ?auto_208809 ?auto_208818 ) ) ( not ( = ?auto_208810 ?auto_208811 ) ) ( not ( = ?auto_208810 ?auto_208812 ) ) ( not ( = ?auto_208810 ?auto_208813 ) ) ( not ( = ?auto_208810 ?auto_208814 ) ) ( not ( = ?auto_208810 ?auto_208815 ) ) ( not ( = ?auto_208810 ?auto_208816 ) ) ( not ( = ?auto_208810 ?auto_208817 ) ) ( not ( = ?auto_208810 ?auto_208818 ) ) ( not ( = ?auto_208811 ?auto_208812 ) ) ( not ( = ?auto_208811 ?auto_208813 ) ) ( not ( = ?auto_208811 ?auto_208814 ) ) ( not ( = ?auto_208811 ?auto_208815 ) ) ( not ( = ?auto_208811 ?auto_208816 ) ) ( not ( = ?auto_208811 ?auto_208817 ) ) ( not ( = ?auto_208811 ?auto_208818 ) ) ( not ( = ?auto_208812 ?auto_208813 ) ) ( not ( = ?auto_208812 ?auto_208814 ) ) ( not ( = ?auto_208812 ?auto_208815 ) ) ( not ( = ?auto_208812 ?auto_208816 ) ) ( not ( = ?auto_208812 ?auto_208817 ) ) ( not ( = ?auto_208812 ?auto_208818 ) ) ( not ( = ?auto_208813 ?auto_208814 ) ) ( not ( = ?auto_208813 ?auto_208815 ) ) ( not ( = ?auto_208813 ?auto_208816 ) ) ( not ( = ?auto_208813 ?auto_208817 ) ) ( not ( = ?auto_208813 ?auto_208818 ) ) ( not ( = ?auto_208814 ?auto_208815 ) ) ( not ( = ?auto_208814 ?auto_208816 ) ) ( not ( = ?auto_208814 ?auto_208817 ) ) ( not ( = ?auto_208814 ?auto_208818 ) ) ( not ( = ?auto_208815 ?auto_208816 ) ) ( not ( = ?auto_208815 ?auto_208817 ) ) ( not ( = ?auto_208815 ?auto_208818 ) ) ( not ( = ?auto_208816 ?auto_208817 ) ) ( not ( = ?auto_208816 ?auto_208818 ) ) ( not ( = ?auto_208817 ?auto_208818 ) ) ( ON ?auto_208817 ?auto_208818 ) ( ON ?auto_208816 ?auto_208817 ) ( ON ?auto_208815 ?auto_208816 ) ( ON ?auto_208814 ?auto_208815 ) ( ON ?auto_208813 ?auto_208814 ) ( ON ?auto_208812 ?auto_208813 ) ( ON ?auto_208811 ?auto_208812 ) ( ON ?auto_208810 ?auto_208811 ) ( ON ?auto_208809 ?auto_208810 ) ( CLEAR ?auto_208807 ) ( ON ?auto_208808 ?auto_208809 ) ( CLEAR ?auto_208808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_208806 ?auto_208807 ?auto_208808 )
      ( MAKE-13PILE ?auto_208806 ?auto_208807 ?auto_208808 ?auto_208809 ?auto_208810 ?auto_208811 ?auto_208812 ?auto_208813 ?auto_208814 ?auto_208815 ?auto_208816 ?auto_208817 ?auto_208818 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208832 - BLOCK
      ?auto_208833 - BLOCK
      ?auto_208834 - BLOCK
      ?auto_208835 - BLOCK
      ?auto_208836 - BLOCK
      ?auto_208837 - BLOCK
      ?auto_208838 - BLOCK
      ?auto_208839 - BLOCK
      ?auto_208840 - BLOCK
      ?auto_208841 - BLOCK
      ?auto_208842 - BLOCK
      ?auto_208843 - BLOCK
      ?auto_208844 - BLOCK
    )
    :vars
    (
      ?auto_208845 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208844 ?auto_208845 ) ( ON-TABLE ?auto_208832 ) ( not ( = ?auto_208832 ?auto_208833 ) ) ( not ( = ?auto_208832 ?auto_208834 ) ) ( not ( = ?auto_208832 ?auto_208835 ) ) ( not ( = ?auto_208832 ?auto_208836 ) ) ( not ( = ?auto_208832 ?auto_208837 ) ) ( not ( = ?auto_208832 ?auto_208838 ) ) ( not ( = ?auto_208832 ?auto_208839 ) ) ( not ( = ?auto_208832 ?auto_208840 ) ) ( not ( = ?auto_208832 ?auto_208841 ) ) ( not ( = ?auto_208832 ?auto_208842 ) ) ( not ( = ?auto_208832 ?auto_208843 ) ) ( not ( = ?auto_208832 ?auto_208844 ) ) ( not ( = ?auto_208832 ?auto_208845 ) ) ( not ( = ?auto_208833 ?auto_208834 ) ) ( not ( = ?auto_208833 ?auto_208835 ) ) ( not ( = ?auto_208833 ?auto_208836 ) ) ( not ( = ?auto_208833 ?auto_208837 ) ) ( not ( = ?auto_208833 ?auto_208838 ) ) ( not ( = ?auto_208833 ?auto_208839 ) ) ( not ( = ?auto_208833 ?auto_208840 ) ) ( not ( = ?auto_208833 ?auto_208841 ) ) ( not ( = ?auto_208833 ?auto_208842 ) ) ( not ( = ?auto_208833 ?auto_208843 ) ) ( not ( = ?auto_208833 ?auto_208844 ) ) ( not ( = ?auto_208833 ?auto_208845 ) ) ( not ( = ?auto_208834 ?auto_208835 ) ) ( not ( = ?auto_208834 ?auto_208836 ) ) ( not ( = ?auto_208834 ?auto_208837 ) ) ( not ( = ?auto_208834 ?auto_208838 ) ) ( not ( = ?auto_208834 ?auto_208839 ) ) ( not ( = ?auto_208834 ?auto_208840 ) ) ( not ( = ?auto_208834 ?auto_208841 ) ) ( not ( = ?auto_208834 ?auto_208842 ) ) ( not ( = ?auto_208834 ?auto_208843 ) ) ( not ( = ?auto_208834 ?auto_208844 ) ) ( not ( = ?auto_208834 ?auto_208845 ) ) ( not ( = ?auto_208835 ?auto_208836 ) ) ( not ( = ?auto_208835 ?auto_208837 ) ) ( not ( = ?auto_208835 ?auto_208838 ) ) ( not ( = ?auto_208835 ?auto_208839 ) ) ( not ( = ?auto_208835 ?auto_208840 ) ) ( not ( = ?auto_208835 ?auto_208841 ) ) ( not ( = ?auto_208835 ?auto_208842 ) ) ( not ( = ?auto_208835 ?auto_208843 ) ) ( not ( = ?auto_208835 ?auto_208844 ) ) ( not ( = ?auto_208835 ?auto_208845 ) ) ( not ( = ?auto_208836 ?auto_208837 ) ) ( not ( = ?auto_208836 ?auto_208838 ) ) ( not ( = ?auto_208836 ?auto_208839 ) ) ( not ( = ?auto_208836 ?auto_208840 ) ) ( not ( = ?auto_208836 ?auto_208841 ) ) ( not ( = ?auto_208836 ?auto_208842 ) ) ( not ( = ?auto_208836 ?auto_208843 ) ) ( not ( = ?auto_208836 ?auto_208844 ) ) ( not ( = ?auto_208836 ?auto_208845 ) ) ( not ( = ?auto_208837 ?auto_208838 ) ) ( not ( = ?auto_208837 ?auto_208839 ) ) ( not ( = ?auto_208837 ?auto_208840 ) ) ( not ( = ?auto_208837 ?auto_208841 ) ) ( not ( = ?auto_208837 ?auto_208842 ) ) ( not ( = ?auto_208837 ?auto_208843 ) ) ( not ( = ?auto_208837 ?auto_208844 ) ) ( not ( = ?auto_208837 ?auto_208845 ) ) ( not ( = ?auto_208838 ?auto_208839 ) ) ( not ( = ?auto_208838 ?auto_208840 ) ) ( not ( = ?auto_208838 ?auto_208841 ) ) ( not ( = ?auto_208838 ?auto_208842 ) ) ( not ( = ?auto_208838 ?auto_208843 ) ) ( not ( = ?auto_208838 ?auto_208844 ) ) ( not ( = ?auto_208838 ?auto_208845 ) ) ( not ( = ?auto_208839 ?auto_208840 ) ) ( not ( = ?auto_208839 ?auto_208841 ) ) ( not ( = ?auto_208839 ?auto_208842 ) ) ( not ( = ?auto_208839 ?auto_208843 ) ) ( not ( = ?auto_208839 ?auto_208844 ) ) ( not ( = ?auto_208839 ?auto_208845 ) ) ( not ( = ?auto_208840 ?auto_208841 ) ) ( not ( = ?auto_208840 ?auto_208842 ) ) ( not ( = ?auto_208840 ?auto_208843 ) ) ( not ( = ?auto_208840 ?auto_208844 ) ) ( not ( = ?auto_208840 ?auto_208845 ) ) ( not ( = ?auto_208841 ?auto_208842 ) ) ( not ( = ?auto_208841 ?auto_208843 ) ) ( not ( = ?auto_208841 ?auto_208844 ) ) ( not ( = ?auto_208841 ?auto_208845 ) ) ( not ( = ?auto_208842 ?auto_208843 ) ) ( not ( = ?auto_208842 ?auto_208844 ) ) ( not ( = ?auto_208842 ?auto_208845 ) ) ( not ( = ?auto_208843 ?auto_208844 ) ) ( not ( = ?auto_208843 ?auto_208845 ) ) ( not ( = ?auto_208844 ?auto_208845 ) ) ( ON ?auto_208843 ?auto_208844 ) ( ON ?auto_208842 ?auto_208843 ) ( ON ?auto_208841 ?auto_208842 ) ( ON ?auto_208840 ?auto_208841 ) ( ON ?auto_208839 ?auto_208840 ) ( ON ?auto_208838 ?auto_208839 ) ( ON ?auto_208837 ?auto_208838 ) ( ON ?auto_208836 ?auto_208837 ) ( ON ?auto_208835 ?auto_208836 ) ( ON ?auto_208834 ?auto_208835 ) ( CLEAR ?auto_208832 ) ( ON ?auto_208833 ?auto_208834 ) ( CLEAR ?auto_208833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208832 ?auto_208833 )
      ( MAKE-13PILE ?auto_208832 ?auto_208833 ?auto_208834 ?auto_208835 ?auto_208836 ?auto_208837 ?auto_208838 ?auto_208839 ?auto_208840 ?auto_208841 ?auto_208842 ?auto_208843 ?auto_208844 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208859 - BLOCK
      ?auto_208860 - BLOCK
      ?auto_208861 - BLOCK
      ?auto_208862 - BLOCK
      ?auto_208863 - BLOCK
      ?auto_208864 - BLOCK
      ?auto_208865 - BLOCK
      ?auto_208866 - BLOCK
      ?auto_208867 - BLOCK
      ?auto_208868 - BLOCK
      ?auto_208869 - BLOCK
      ?auto_208870 - BLOCK
      ?auto_208871 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208871 ) ( ON-TABLE ?auto_208859 ) ( not ( = ?auto_208859 ?auto_208860 ) ) ( not ( = ?auto_208859 ?auto_208861 ) ) ( not ( = ?auto_208859 ?auto_208862 ) ) ( not ( = ?auto_208859 ?auto_208863 ) ) ( not ( = ?auto_208859 ?auto_208864 ) ) ( not ( = ?auto_208859 ?auto_208865 ) ) ( not ( = ?auto_208859 ?auto_208866 ) ) ( not ( = ?auto_208859 ?auto_208867 ) ) ( not ( = ?auto_208859 ?auto_208868 ) ) ( not ( = ?auto_208859 ?auto_208869 ) ) ( not ( = ?auto_208859 ?auto_208870 ) ) ( not ( = ?auto_208859 ?auto_208871 ) ) ( not ( = ?auto_208860 ?auto_208861 ) ) ( not ( = ?auto_208860 ?auto_208862 ) ) ( not ( = ?auto_208860 ?auto_208863 ) ) ( not ( = ?auto_208860 ?auto_208864 ) ) ( not ( = ?auto_208860 ?auto_208865 ) ) ( not ( = ?auto_208860 ?auto_208866 ) ) ( not ( = ?auto_208860 ?auto_208867 ) ) ( not ( = ?auto_208860 ?auto_208868 ) ) ( not ( = ?auto_208860 ?auto_208869 ) ) ( not ( = ?auto_208860 ?auto_208870 ) ) ( not ( = ?auto_208860 ?auto_208871 ) ) ( not ( = ?auto_208861 ?auto_208862 ) ) ( not ( = ?auto_208861 ?auto_208863 ) ) ( not ( = ?auto_208861 ?auto_208864 ) ) ( not ( = ?auto_208861 ?auto_208865 ) ) ( not ( = ?auto_208861 ?auto_208866 ) ) ( not ( = ?auto_208861 ?auto_208867 ) ) ( not ( = ?auto_208861 ?auto_208868 ) ) ( not ( = ?auto_208861 ?auto_208869 ) ) ( not ( = ?auto_208861 ?auto_208870 ) ) ( not ( = ?auto_208861 ?auto_208871 ) ) ( not ( = ?auto_208862 ?auto_208863 ) ) ( not ( = ?auto_208862 ?auto_208864 ) ) ( not ( = ?auto_208862 ?auto_208865 ) ) ( not ( = ?auto_208862 ?auto_208866 ) ) ( not ( = ?auto_208862 ?auto_208867 ) ) ( not ( = ?auto_208862 ?auto_208868 ) ) ( not ( = ?auto_208862 ?auto_208869 ) ) ( not ( = ?auto_208862 ?auto_208870 ) ) ( not ( = ?auto_208862 ?auto_208871 ) ) ( not ( = ?auto_208863 ?auto_208864 ) ) ( not ( = ?auto_208863 ?auto_208865 ) ) ( not ( = ?auto_208863 ?auto_208866 ) ) ( not ( = ?auto_208863 ?auto_208867 ) ) ( not ( = ?auto_208863 ?auto_208868 ) ) ( not ( = ?auto_208863 ?auto_208869 ) ) ( not ( = ?auto_208863 ?auto_208870 ) ) ( not ( = ?auto_208863 ?auto_208871 ) ) ( not ( = ?auto_208864 ?auto_208865 ) ) ( not ( = ?auto_208864 ?auto_208866 ) ) ( not ( = ?auto_208864 ?auto_208867 ) ) ( not ( = ?auto_208864 ?auto_208868 ) ) ( not ( = ?auto_208864 ?auto_208869 ) ) ( not ( = ?auto_208864 ?auto_208870 ) ) ( not ( = ?auto_208864 ?auto_208871 ) ) ( not ( = ?auto_208865 ?auto_208866 ) ) ( not ( = ?auto_208865 ?auto_208867 ) ) ( not ( = ?auto_208865 ?auto_208868 ) ) ( not ( = ?auto_208865 ?auto_208869 ) ) ( not ( = ?auto_208865 ?auto_208870 ) ) ( not ( = ?auto_208865 ?auto_208871 ) ) ( not ( = ?auto_208866 ?auto_208867 ) ) ( not ( = ?auto_208866 ?auto_208868 ) ) ( not ( = ?auto_208866 ?auto_208869 ) ) ( not ( = ?auto_208866 ?auto_208870 ) ) ( not ( = ?auto_208866 ?auto_208871 ) ) ( not ( = ?auto_208867 ?auto_208868 ) ) ( not ( = ?auto_208867 ?auto_208869 ) ) ( not ( = ?auto_208867 ?auto_208870 ) ) ( not ( = ?auto_208867 ?auto_208871 ) ) ( not ( = ?auto_208868 ?auto_208869 ) ) ( not ( = ?auto_208868 ?auto_208870 ) ) ( not ( = ?auto_208868 ?auto_208871 ) ) ( not ( = ?auto_208869 ?auto_208870 ) ) ( not ( = ?auto_208869 ?auto_208871 ) ) ( not ( = ?auto_208870 ?auto_208871 ) ) ( ON ?auto_208870 ?auto_208871 ) ( ON ?auto_208869 ?auto_208870 ) ( ON ?auto_208868 ?auto_208869 ) ( ON ?auto_208867 ?auto_208868 ) ( ON ?auto_208866 ?auto_208867 ) ( ON ?auto_208865 ?auto_208866 ) ( ON ?auto_208864 ?auto_208865 ) ( ON ?auto_208863 ?auto_208864 ) ( ON ?auto_208862 ?auto_208863 ) ( ON ?auto_208861 ?auto_208862 ) ( CLEAR ?auto_208859 ) ( ON ?auto_208860 ?auto_208861 ) ( CLEAR ?auto_208860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_208859 ?auto_208860 )
      ( MAKE-13PILE ?auto_208859 ?auto_208860 ?auto_208861 ?auto_208862 ?auto_208863 ?auto_208864 ?auto_208865 ?auto_208866 ?auto_208867 ?auto_208868 ?auto_208869 ?auto_208870 ?auto_208871 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208885 - BLOCK
      ?auto_208886 - BLOCK
      ?auto_208887 - BLOCK
      ?auto_208888 - BLOCK
      ?auto_208889 - BLOCK
      ?auto_208890 - BLOCK
      ?auto_208891 - BLOCK
      ?auto_208892 - BLOCK
      ?auto_208893 - BLOCK
      ?auto_208894 - BLOCK
      ?auto_208895 - BLOCK
      ?auto_208896 - BLOCK
      ?auto_208897 - BLOCK
    )
    :vars
    (
      ?auto_208898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_208897 ?auto_208898 ) ( not ( = ?auto_208885 ?auto_208886 ) ) ( not ( = ?auto_208885 ?auto_208887 ) ) ( not ( = ?auto_208885 ?auto_208888 ) ) ( not ( = ?auto_208885 ?auto_208889 ) ) ( not ( = ?auto_208885 ?auto_208890 ) ) ( not ( = ?auto_208885 ?auto_208891 ) ) ( not ( = ?auto_208885 ?auto_208892 ) ) ( not ( = ?auto_208885 ?auto_208893 ) ) ( not ( = ?auto_208885 ?auto_208894 ) ) ( not ( = ?auto_208885 ?auto_208895 ) ) ( not ( = ?auto_208885 ?auto_208896 ) ) ( not ( = ?auto_208885 ?auto_208897 ) ) ( not ( = ?auto_208885 ?auto_208898 ) ) ( not ( = ?auto_208886 ?auto_208887 ) ) ( not ( = ?auto_208886 ?auto_208888 ) ) ( not ( = ?auto_208886 ?auto_208889 ) ) ( not ( = ?auto_208886 ?auto_208890 ) ) ( not ( = ?auto_208886 ?auto_208891 ) ) ( not ( = ?auto_208886 ?auto_208892 ) ) ( not ( = ?auto_208886 ?auto_208893 ) ) ( not ( = ?auto_208886 ?auto_208894 ) ) ( not ( = ?auto_208886 ?auto_208895 ) ) ( not ( = ?auto_208886 ?auto_208896 ) ) ( not ( = ?auto_208886 ?auto_208897 ) ) ( not ( = ?auto_208886 ?auto_208898 ) ) ( not ( = ?auto_208887 ?auto_208888 ) ) ( not ( = ?auto_208887 ?auto_208889 ) ) ( not ( = ?auto_208887 ?auto_208890 ) ) ( not ( = ?auto_208887 ?auto_208891 ) ) ( not ( = ?auto_208887 ?auto_208892 ) ) ( not ( = ?auto_208887 ?auto_208893 ) ) ( not ( = ?auto_208887 ?auto_208894 ) ) ( not ( = ?auto_208887 ?auto_208895 ) ) ( not ( = ?auto_208887 ?auto_208896 ) ) ( not ( = ?auto_208887 ?auto_208897 ) ) ( not ( = ?auto_208887 ?auto_208898 ) ) ( not ( = ?auto_208888 ?auto_208889 ) ) ( not ( = ?auto_208888 ?auto_208890 ) ) ( not ( = ?auto_208888 ?auto_208891 ) ) ( not ( = ?auto_208888 ?auto_208892 ) ) ( not ( = ?auto_208888 ?auto_208893 ) ) ( not ( = ?auto_208888 ?auto_208894 ) ) ( not ( = ?auto_208888 ?auto_208895 ) ) ( not ( = ?auto_208888 ?auto_208896 ) ) ( not ( = ?auto_208888 ?auto_208897 ) ) ( not ( = ?auto_208888 ?auto_208898 ) ) ( not ( = ?auto_208889 ?auto_208890 ) ) ( not ( = ?auto_208889 ?auto_208891 ) ) ( not ( = ?auto_208889 ?auto_208892 ) ) ( not ( = ?auto_208889 ?auto_208893 ) ) ( not ( = ?auto_208889 ?auto_208894 ) ) ( not ( = ?auto_208889 ?auto_208895 ) ) ( not ( = ?auto_208889 ?auto_208896 ) ) ( not ( = ?auto_208889 ?auto_208897 ) ) ( not ( = ?auto_208889 ?auto_208898 ) ) ( not ( = ?auto_208890 ?auto_208891 ) ) ( not ( = ?auto_208890 ?auto_208892 ) ) ( not ( = ?auto_208890 ?auto_208893 ) ) ( not ( = ?auto_208890 ?auto_208894 ) ) ( not ( = ?auto_208890 ?auto_208895 ) ) ( not ( = ?auto_208890 ?auto_208896 ) ) ( not ( = ?auto_208890 ?auto_208897 ) ) ( not ( = ?auto_208890 ?auto_208898 ) ) ( not ( = ?auto_208891 ?auto_208892 ) ) ( not ( = ?auto_208891 ?auto_208893 ) ) ( not ( = ?auto_208891 ?auto_208894 ) ) ( not ( = ?auto_208891 ?auto_208895 ) ) ( not ( = ?auto_208891 ?auto_208896 ) ) ( not ( = ?auto_208891 ?auto_208897 ) ) ( not ( = ?auto_208891 ?auto_208898 ) ) ( not ( = ?auto_208892 ?auto_208893 ) ) ( not ( = ?auto_208892 ?auto_208894 ) ) ( not ( = ?auto_208892 ?auto_208895 ) ) ( not ( = ?auto_208892 ?auto_208896 ) ) ( not ( = ?auto_208892 ?auto_208897 ) ) ( not ( = ?auto_208892 ?auto_208898 ) ) ( not ( = ?auto_208893 ?auto_208894 ) ) ( not ( = ?auto_208893 ?auto_208895 ) ) ( not ( = ?auto_208893 ?auto_208896 ) ) ( not ( = ?auto_208893 ?auto_208897 ) ) ( not ( = ?auto_208893 ?auto_208898 ) ) ( not ( = ?auto_208894 ?auto_208895 ) ) ( not ( = ?auto_208894 ?auto_208896 ) ) ( not ( = ?auto_208894 ?auto_208897 ) ) ( not ( = ?auto_208894 ?auto_208898 ) ) ( not ( = ?auto_208895 ?auto_208896 ) ) ( not ( = ?auto_208895 ?auto_208897 ) ) ( not ( = ?auto_208895 ?auto_208898 ) ) ( not ( = ?auto_208896 ?auto_208897 ) ) ( not ( = ?auto_208896 ?auto_208898 ) ) ( not ( = ?auto_208897 ?auto_208898 ) ) ( ON ?auto_208896 ?auto_208897 ) ( ON ?auto_208895 ?auto_208896 ) ( ON ?auto_208894 ?auto_208895 ) ( ON ?auto_208893 ?auto_208894 ) ( ON ?auto_208892 ?auto_208893 ) ( ON ?auto_208891 ?auto_208892 ) ( ON ?auto_208890 ?auto_208891 ) ( ON ?auto_208889 ?auto_208890 ) ( ON ?auto_208888 ?auto_208889 ) ( ON ?auto_208887 ?auto_208888 ) ( ON ?auto_208886 ?auto_208887 ) ( ON ?auto_208885 ?auto_208886 ) ( CLEAR ?auto_208885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208885 )
      ( MAKE-13PILE ?auto_208885 ?auto_208886 ?auto_208887 ?auto_208888 ?auto_208889 ?auto_208890 ?auto_208891 ?auto_208892 ?auto_208893 ?auto_208894 ?auto_208895 ?auto_208896 ?auto_208897 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208912 - BLOCK
      ?auto_208913 - BLOCK
      ?auto_208914 - BLOCK
      ?auto_208915 - BLOCK
      ?auto_208916 - BLOCK
      ?auto_208917 - BLOCK
      ?auto_208918 - BLOCK
      ?auto_208919 - BLOCK
      ?auto_208920 - BLOCK
      ?auto_208921 - BLOCK
      ?auto_208922 - BLOCK
      ?auto_208923 - BLOCK
      ?auto_208924 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_208924 ) ( not ( = ?auto_208912 ?auto_208913 ) ) ( not ( = ?auto_208912 ?auto_208914 ) ) ( not ( = ?auto_208912 ?auto_208915 ) ) ( not ( = ?auto_208912 ?auto_208916 ) ) ( not ( = ?auto_208912 ?auto_208917 ) ) ( not ( = ?auto_208912 ?auto_208918 ) ) ( not ( = ?auto_208912 ?auto_208919 ) ) ( not ( = ?auto_208912 ?auto_208920 ) ) ( not ( = ?auto_208912 ?auto_208921 ) ) ( not ( = ?auto_208912 ?auto_208922 ) ) ( not ( = ?auto_208912 ?auto_208923 ) ) ( not ( = ?auto_208912 ?auto_208924 ) ) ( not ( = ?auto_208913 ?auto_208914 ) ) ( not ( = ?auto_208913 ?auto_208915 ) ) ( not ( = ?auto_208913 ?auto_208916 ) ) ( not ( = ?auto_208913 ?auto_208917 ) ) ( not ( = ?auto_208913 ?auto_208918 ) ) ( not ( = ?auto_208913 ?auto_208919 ) ) ( not ( = ?auto_208913 ?auto_208920 ) ) ( not ( = ?auto_208913 ?auto_208921 ) ) ( not ( = ?auto_208913 ?auto_208922 ) ) ( not ( = ?auto_208913 ?auto_208923 ) ) ( not ( = ?auto_208913 ?auto_208924 ) ) ( not ( = ?auto_208914 ?auto_208915 ) ) ( not ( = ?auto_208914 ?auto_208916 ) ) ( not ( = ?auto_208914 ?auto_208917 ) ) ( not ( = ?auto_208914 ?auto_208918 ) ) ( not ( = ?auto_208914 ?auto_208919 ) ) ( not ( = ?auto_208914 ?auto_208920 ) ) ( not ( = ?auto_208914 ?auto_208921 ) ) ( not ( = ?auto_208914 ?auto_208922 ) ) ( not ( = ?auto_208914 ?auto_208923 ) ) ( not ( = ?auto_208914 ?auto_208924 ) ) ( not ( = ?auto_208915 ?auto_208916 ) ) ( not ( = ?auto_208915 ?auto_208917 ) ) ( not ( = ?auto_208915 ?auto_208918 ) ) ( not ( = ?auto_208915 ?auto_208919 ) ) ( not ( = ?auto_208915 ?auto_208920 ) ) ( not ( = ?auto_208915 ?auto_208921 ) ) ( not ( = ?auto_208915 ?auto_208922 ) ) ( not ( = ?auto_208915 ?auto_208923 ) ) ( not ( = ?auto_208915 ?auto_208924 ) ) ( not ( = ?auto_208916 ?auto_208917 ) ) ( not ( = ?auto_208916 ?auto_208918 ) ) ( not ( = ?auto_208916 ?auto_208919 ) ) ( not ( = ?auto_208916 ?auto_208920 ) ) ( not ( = ?auto_208916 ?auto_208921 ) ) ( not ( = ?auto_208916 ?auto_208922 ) ) ( not ( = ?auto_208916 ?auto_208923 ) ) ( not ( = ?auto_208916 ?auto_208924 ) ) ( not ( = ?auto_208917 ?auto_208918 ) ) ( not ( = ?auto_208917 ?auto_208919 ) ) ( not ( = ?auto_208917 ?auto_208920 ) ) ( not ( = ?auto_208917 ?auto_208921 ) ) ( not ( = ?auto_208917 ?auto_208922 ) ) ( not ( = ?auto_208917 ?auto_208923 ) ) ( not ( = ?auto_208917 ?auto_208924 ) ) ( not ( = ?auto_208918 ?auto_208919 ) ) ( not ( = ?auto_208918 ?auto_208920 ) ) ( not ( = ?auto_208918 ?auto_208921 ) ) ( not ( = ?auto_208918 ?auto_208922 ) ) ( not ( = ?auto_208918 ?auto_208923 ) ) ( not ( = ?auto_208918 ?auto_208924 ) ) ( not ( = ?auto_208919 ?auto_208920 ) ) ( not ( = ?auto_208919 ?auto_208921 ) ) ( not ( = ?auto_208919 ?auto_208922 ) ) ( not ( = ?auto_208919 ?auto_208923 ) ) ( not ( = ?auto_208919 ?auto_208924 ) ) ( not ( = ?auto_208920 ?auto_208921 ) ) ( not ( = ?auto_208920 ?auto_208922 ) ) ( not ( = ?auto_208920 ?auto_208923 ) ) ( not ( = ?auto_208920 ?auto_208924 ) ) ( not ( = ?auto_208921 ?auto_208922 ) ) ( not ( = ?auto_208921 ?auto_208923 ) ) ( not ( = ?auto_208921 ?auto_208924 ) ) ( not ( = ?auto_208922 ?auto_208923 ) ) ( not ( = ?auto_208922 ?auto_208924 ) ) ( not ( = ?auto_208923 ?auto_208924 ) ) ( ON ?auto_208923 ?auto_208924 ) ( ON ?auto_208922 ?auto_208923 ) ( ON ?auto_208921 ?auto_208922 ) ( ON ?auto_208920 ?auto_208921 ) ( ON ?auto_208919 ?auto_208920 ) ( ON ?auto_208918 ?auto_208919 ) ( ON ?auto_208917 ?auto_208918 ) ( ON ?auto_208916 ?auto_208917 ) ( ON ?auto_208915 ?auto_208916 ) ( ON ?auto_208914 ?auto_208915 ) ( ON ?auto_208913 ?auto_208914 ) ( ON ?auto_208912 ?auto_208913 ) ( CLEAR ?auto_208912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_208912 )
      ( MAKE-13PILE ?auto_208912 ?auto_208913 ?auto_208914 ?auto_208915 ?auto_208916 ?auto_208917 ?auto_208918 ?auto_208919 ?auto_208920 ?auto_208921 ?auto_208922 ?auto_208923 ?auto_208924 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_208938 - BLOCK
      ?auto_208939 - BLOCK
      ?auto_208940 - BLOCK
      ?auto_208941 - BLOCK
      ?auto_208942 - BLOCK
      ?auto_208943 - BLOCK
      ?auto_208944 - BLOCK
      ?auto_208945 - BLOCK
      ?auto_208946 - BLOCK
      ?auto_208947 - BLOCK
      ?auto_208948 - BLOCK
      ?auto_208949 - BLOCK
      ?auto_208950 - BLOCK
    )
    :vars
    (
      ?auto_208951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_208938 ?auto_208939 ) ) ( not ( = ?auto_208938 ?auto_208940 ) ) ( not ( = ?auto_208938 ?auto_208941 ) ) ( not ( = ?auto_208938 ?auto_208942 ) ) ( not ( = ?auto_208938 ?auto_208943 ) ) ( not ( = ?auto_208938 ?auto_208944 ) ) ( not ( = ?auto_208938 ?auto_208945 ) ) ( not ( = ?auto_208938 ?auto_208946 ) ) ( not ( = ?auto_208938 ?auto_208947 ) ) ( not ( = ?auto_208938 ?auto_208948 ) ) ( not ( = ?auto_208938 ?auto_208949 ) ) ( not ( = ?auto_208938 ?auto_208950 ) ) ( not ( = ?auto_208939 ?auto_208940 ) ) ( not ( = ?auto_208939 ?auto_208941 ) ) ( not ( = ?auto_208939 ?auto_208942 ) ) ( not ( = ?auto_208939 ?auto_208943 ) ) ( not ( = ?auto_208939 ?auto_208944 ) ) ( not ( = ?auto_208939 ?auto_208945 ) ) ( not ( = ?auto_208939 ?auto_208946 ) ) ( not ( = ?auto_208939 ?auto_208947 ) ) ( not ( = ?auto_208939 ?auto_208948 ) ) ( not ( = ?auto_208939 ?auto_208949 ) ) ( not ( = ?auto_208939 ?auto_208950 ) ) ( not ( = ?auto_208940 ?auto_208941 ) ) ( not ( = ?auto_208940 ?auto_208942 ) ) ( not ( = ?auto_208940 ?auto_208943 ) ) ( not ( = ?auto_208940 ?auto_208944 ) ) ( not ( = ?auto_208940 ?auto_208945 ) ) ( not ( = ?auto_208940 ?auto_208946 ) ) ( not ( = ?auto_208940 ?auto_208947 ) ) ( not ( = ?auto_208940 ?auto_208948 ) ) ( not ( = ?auto_208940 ?auto_208949 ) ) ( not ( = ?auto_208940 ?auto_208950 ) ) ( not ( = ?auto_208941 ?auto_208942 ) ) ( not ( = ?auto_208941 ?auto_208943 ) ) ( not ( = ?auto_208941 ?auto_208944 ) ) ( not ( = ?auto_208941 ?auto_208945 ) ) ( not ( = ?auto_208941 ?auto_208946 ) ) ( not ( = ?auto_208941 ?auto_208947 ) ) ( not ( = ?auto_208941 ?auto_208948 ) ) ( not ( = ?auto_208941 ?auto_208949 ) ) ( not ( = ?auto_208941 ?auto_208950 ) ) ( not ( = ?auto_208942 ?auto_208943 ) ) ( not ( = ?auto_208942 ?auto_208944 ) ) ( not ( = ?auto_208942 ?auto_208945 ) ) ( not ( = ?auto_208942 ?auto_208946 ) ) ( not ( = ?auto_208942 ?auto_208947 ) ) ( not ( = ?auto_208942 ?auto_208948 ) ) ( not ( = ?auto_208942 ?auto_208949 ) ) ( not ( = ?auto_208942 ?auto_208950 ) ) ( not ( = ?auto_208943 ?auto_208944 ) ) ( not ( = ?auto_208943 ?auto_208945 ) ) ( not ( = ?auto_208943 ?auto_208946 ) ) ( not ( = ?auto_208943 ?auto_208947 ) ) ( not ( = ?auto_208943 ?auto_208948 ) ) ( not ( = ?auto_208943 ?auto_208949 ) ) ( not ( = ?auto_208943 ?auto_208950 ) ) ( not ( = ?auto_208944 ?auto_208945 ) ) ( not ( = ?auto_208944 ?auto_208946 ) ) ( not ( = ?auto_208944 ?auto_208947 ) ) ( not ( = ?auto_208944 ?auto_208948 ) ) ( not ( = ?auto_208944 ?auto_208949 ) ) ( not ( = ?auto_208944 ?auto_208950 ) ) ( not ( = ?auto_208945 ?auto_208946 ) ) ( not ( = ?auto_208945 ?auto_208947 ) ) ( not ( = ?auto_208945 ?auto_208948 ) ) ( not ( = ?auto_208945 ?auto_208949 ) ) ( not ( = ?auto_208945 ?auto_208950 ) ) ( not ( = ?auto_208946 ?auto_208947 ) ) ( not ( = ?auto_208946 ?auto_208948 ) ) ( not ( = ?auto_208946 ?auto_208949 ) ) ( not ( = ?auto_208946 ?auto_208950 ) ) ( not ( = ?auto_208947 ?auto_208948 ) ) ( not ( = ?auto_208947 ?auto_208949 ) ) ( not ( = ?auto_208947 ?auto_208950 ) ) ( not ( = ?auto_208948 ?auto_208949 ) ) ( not ( = ?auto_208948 ?auto_208950 ) ) ( not ( = ?auto_208949 ?auto_208950 ) ) ( ON ?auto_208938 ?auto_208951 ) ( not ( = ?auto_208950 ?auto_208951 ) ) ( not ( = ?auto_208949 ?auto_208951 ) ) ( not ( = ?auto_208948 ?auto_208951 ) ) ( not ( = ?auto_208947 ?auto_208951 ) ) ( not ( = ?auto_208946 ?auto_208951 ) ) ( not ( = ?auto_208945 ?auto_208951 ) ) ( not ( = ?auto_208944 ?auto_208951 ) ) ( not ( = ?auto_208943 ?auto_208951 ) ) ( not ( = ?auto_208942 ?auto_208951 ) ) ( not ( = ?auto_208941 ?auto_208951 ) ) ( not ( = ?auto_208940 ?auto_208951 ) ) ( not ( = ?auto_208939 ?auto_208951 ) ) ( not ( = ?auto_208938 ?auto_208951 ) ) ( ON ?auto_208939 ?auto_208938 ) ( ON ?auto_208940 ?auto_208939 ) ( ON ?auto_208941 ?auto_208940 ) ( ON ?auto_208942 ?auto_208941 ) ( ON ?auto_208943 ?auto_208942 ) ( ON ?auto_208944 ?auto_208943 ) ( ON ?auto_208945 ?auto_208944 ) ( ON ?auto_208946 ?auto_208945 ) ( ON ?auto_208947 ?auto_208946 ) ( ON ?auto_208948 ?auto_208947 ) ( ON ?auto_208949 ?auto_208948 ) ( ON ?auto_208950 ?auto_208949 ) ( CLEAR ?auto_208950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_208950 ?auto_208949 ?auto_208948 ?auto_208947 ?auto_208946 ?auto_208945 ?auto_208944 ?auto_208943 ?auto_208942 ?auto_208941 ?auto_208940 ?auto_208939 ?auto_208938 )
      ( MAKE-13PILE ?auto_208938 ?auto_208939 ?auto_208940 ?auto_208941 ?auto_208942 ?auto_208943 ?auto_208944 ?auto_208945 ?auto_208946 ?auto_208947 ?auto_208948 ?auto_208949 ?auto_208950 ) )
  )

)

