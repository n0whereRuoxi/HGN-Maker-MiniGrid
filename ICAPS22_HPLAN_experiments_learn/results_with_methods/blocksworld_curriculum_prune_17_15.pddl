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
      ?auto_702361 - BLOCK
    )
    :vars
    (
      ?auto_702362 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702361 ?auto_702362 ) ( CLEAR ?auto_702361 ) ( HAND-EMPTY ) ( not ( = ?auto_702361 ?auto_702362 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702361 ?auto_702362 )
      ( !PUTDOWN ?auto_702361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_702368 - BLOCK
      ?auto_702369 - BLOCK
    )
    :vars
    (
      ?auto_702370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702368 ) ( ON ?auto_702369 ?auto_702370 ) ( CLEAR ?auto_702369 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702368 ) ( not ( = ?auto_702368 ?auto_702369 ) ) ( not ( = ?auto_702368 ?auto_702370 ) ) ( not ( = ?auto_702369 ?auto_702370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702369 ?auto_702370 )
      ( !STACK ?auto_702369 ?auto_702368 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_702378 - BLOCK
      ?auto_702379 - BLOCK
    )
    :vars
    (
      ?auto_702380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702379 ?auto_702380 ) ( not ( = ?auto_702378 ?auto_702379 ) ) ( not ( = ?auto_702378 ?auto_702380 ) ) ( not ( = ?auto_702379 ?auto_702380 ) ) ( ON ?auto_702378 ?auto_702379 ) ( CLEAR ?auto_702378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702378 )
      ( MAKE-2PILE ?auto_702378 ?auto_702379 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_702389 - BLOCK
      ?auto_702390 - BLOCK
      ?auto_702391 - BLOCK
    )
    :vars
    (
      ?auto_702392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702390 ) ( ON ?auto_702391 ?auto_702392 ) ( CLEAR ?auto_702391 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702389 ) ( ON ?auto_702390 ?auto_702389 ) ( not ( = ?auto_702389 ?auto_702390 ) ) ( not ( = ?auto_702389 ?auto_702391 ) ) ( not ( = ?auto_702389 ?auto_702392 ) ) ( not ( = ?auto_702390 ?auto_702391 ) ) ( not ( = ?auto_702390 ?auto_702392 ) ) ( not ( = ?auto_702391 ?auto_702392 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702391 ?auto_702392 )
      ( !STACK ?auto_702391 ?auto_702390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_702403 - BLOCK
      ?auto_702404 - BLOCK
      ?auto_702405 - BLOCK
    )
    :vars
    (
      ?auto_702406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702405 ?auto_702406 ) ( ON-TABLE ?auto_702403 ) ( not ( = ?auto_702403 ?auto_702404 ) ) ( not ( = ?auto_702403 ?auto_702405 ) ) ( not ( = ?auto_702403 ?auto_702406 ) ) ( not ( = ?auto_702404 ?auto_702405 ) ) ( not ( = ?auto_702404 ?auto_702406 ) ) ( not ( = ?auto_702405 ?auto_702406 ) ) ( CLEAR ?auto_702403 ) ( ON ?auto_702404 ?auto_702405 ) ( CLEAR ?auto_702404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702403 ?auto_702404 )
      ( MAKE-3PILE ?auto_702403 ?auto_702404 ?auto_702405 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_702417 - BLOCK
      ?auto_702418 - BLOCK
      ?auto_702419 - BLOCK
    )
    :vars
    (
      ?auto_702420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702419 ?auto_702420 ) ( not ( = ?auto_702417 ?auto_702418 ) ) ( not ( = ?auto_702417 ?auto_702419 ) ) ( not ( = ?auto_702417 ?auto_702420 ) ) ( not ( = ?auto_702418 ?auto_702419 ) ) ( not ( = ?auto_702418 ?auto_702420 ) ) ( not ( = ?auto_702419 ?auto_702420 ) ) ( ON ?auto_702418 ?auto_702419 ) ( ON ?auto_702417 ?auto_702418 ) ( CLEAR ?auto_702417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702417 )
      ( MAKE-3PILE ?auto_702417 ?auto_702418 ?auto_702419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_702432 - BLOCK
      ?auto_702433 - BLOCK
      ?auto_702434 - BLOCK
      ?auto_702435 - BLOCK
    )
    :vars
    (
      ?auto_702436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702434 ) ( ON ?auto_702435 ?auto_702436 ) ( CLEAR ?auto_702435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702432 ) ( ON ?auto_702433 ?auto_702432 ) ( ON ?auto_702434 ?auto_702433 ) ( not ( = ?auto_702432 ?auto_702433 ) ) ( not ( = ?auto_702432 ?auto_702434 ) ) ( not ( = ?auto_702432 ?auto_702435 ) ) ( not ( = ?auto_702432 ?auto_702436 ) ) ( not ( = ?auto_702433 ?auto_702434 ) ) ( not ( = ?auto_702433 ?auto_702435 ) ) ( not ( = ?auto_702433 ?auto_702436 ) ) ( not ( = ?auto_702434 ?auto_702435 ) ) ( not ( = ?auto_702434 ?auto_702436 ) ) ( not ( = ?auto_702435 ?auto_702436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702435 ?auto_702436 )
      ( !STACK ?auto_702435 ?auto_702434 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_702450 - BLOCK
      ?auto_702451 - BLOCK
      ?auto_702452 - BLOCK
      ?auto_702453 - BLOCK
    )
    :vars
    (
      ?auto_702454 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702453 ?auto_702454 ) ( ON-TABLE ?auto_702450 ) ( ON ?auto_702451 ?auto_702450 ) ( not ( = ?auto_702450 ?auto_702451 ) ) ( not ( = ?auto_702450 ?auto_702452 ) ) ( not ( = ?auto_702450 ?auto_702453 ) ) ( not ( = ?auto_702450 ?auto_702454 ) ) ( not ( = ?auto_702451 ?auto_702452 ) ) ( not ( = ?auto_702451 ?auto_702453 ) ) ( not ( = ?auto_702451 ?auto_702454 ) ) ( not ( = ?auto_702452 ?auto_702453 ) ) ( not ( = ?auto_702452 ?auto_702454 ) ) ( not ( = ?auto_702453 ?auto_702454 ) ) ( CLEAR ?auto_702451 ) ( ON ?auto_702452 ?auto_702453 ) ( CLEAR ?auto_702452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702450 ?auto_702451 ?auto_702452 )
      ( MAKE-4PILE ?auto_702450 ?auto_702451 ?auto_702452 ?auto_702453 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_702468 - BLOCK
      ?auto_702469 - BLOCK
      ?auto_702470 - BLOCK
      ?auto_702471 - BLOCK
    )
    :vars
    (
      ?auto_702472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702471 ?auto_702472 ) ( ON-TABLE ?auto_702468 ) ( not ( = ?auto_702468 ?auto_702469 ) ) ( not ( = ?auto_702468 ?auto_702470 ) ) ( not ( = ?auto_702468 ?auto_702471 ) ) ( not ( = ?auto_702468 ?auto_702472 ) ) ( not ( = ?auto_702469 ?auto_702470 ) ) ( not ( = ?auto_702469 ?auto_702471 ) ) ( not ( = ?auto_702469 ?auto_702472 ) ) ( not ( = ?auto_702470 ?auto_702471 ) ) ( not ( = ?auto_702470 ?auto_702472 ) ) ( not ( = ?auto_702471 ?auto_702472 ) ) ( ON ?auto_702470 ?auto_702471 ) ( CLEAR ?auto_702468 ) ( ON ?auto_702469 ?auto_702470 ) ( CLEAR ?auto_702469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702468 ?auto_702469 )
      ( MAKE-4PILE ?auto_702468 ?auto_702469 ?auto_702470 ?auto_702471 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_702486 - BLOCK
      ?auto_702487 - BLOCK
      ?auto_702488 - BLOCK
      ?auto_702489 - BLOCK
    )
    :vars
    (
      ?auto_702490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702489 ?auto_702490 ) ( not ( = ?auto_702486 ?auto_702487 ) ) ( not ( = ?auto_702486 ?auto_702488 ) ) ( not ( = ?auto_702486 ?auto_702489 ) ) ( not ( = ?auto_702486 ?auto_702490 ) ) ( not ( = ?auto_702487 ?auto_702488 ) ) ( not ( = ?auto_702487 ?auto_702489 ) ) ( not ( = ?auto_702487 ?auto_702490 ) ) ( not ( = ?auto_702488 ?auto_702489 ) ) ( not ( = ?auto_702488 ?auto_702490 ) ) ( not ( = ?auto_702489 ?auto_702490 ) ) ( ON ?auto_702488 ?auto_702489 ) ( ON ?auto_702487 ?auto_702488 ) ( ON ?auto_702486 ?auto_702487 ) ( CLEAR ?auto_702486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702486 )
      ( MAKE-4PILE ?auto_702486 ?auto_702487 ?auto_702488 ?auto_702489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_702505 - BLOCK
      ?auto_702506 - BLOCK
      ?auto_702507 - BLOCK
      ?auto_702508 - BLOCK
      ?auto_702509 - BLOCK
    )
    :vars
    (
      ?auto_702510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702508 ) ( ON ?auto_702509 ?auto_702510 ) ( CLEAR ?auto_702509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702505 ) ( ON ?auto_702506 ?auto_702505 ) ( ON ?auto_702507 ?auto_702506 ) ( ON ?auto_702508 ?auto_702507 ) ( not ( = ?auto_702505 ?auto_702506 ) ) ( not ( = ?auto_702505 ?auto_702507 ) ) ( not ( = ?auto_702505 ?auto_702508 ) ) ( not ( = ?auto_702505 ?auto_702509 ) ) ( not ( = ?auto_702505 ?auto_702510 ) ) ( not ( = ?auto_702506 ?auto_702507 ) ) ( not ( = ?auto_702506 ?auto_702508 ) ) ( not ( = ?auto_702506 ?auto_702509 ) ) ( not ( = ?auto_702506 ?auto_702510 ) ) ( not ( = ?auto_702507 ?auto_702508 ) ) ( not ( = ?auto_702507 ?auto_702509 ) ) ( not ( = ?auto_702507 ?auto_702510 ) ) ( not ( = ?auto_702508 ?auto_702509 ) ) ( not ( = ?auto_702508 ?auto_702510 ) ) ( not ( = ?auto_702509 ?auto_702510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702509 ?auto_702510 )
      ( !STACK ?auto_702509 ?auto_702508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_702527 - BLOCK
      ?auto_702528 - BLOCK
      ?auto_702529 - BLOCK
      ?auto_702530 - BLOCK
      ?auto_702531 - BLOCK
    )
    :vars
    (
      ?auto_702532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702531 ?auto_702532 ) ( ON-TABLE ?auto_702527 ) ( ON ?auto_702528 ?auto_702527 ) ( ON ?auto_702529 ?auto_702528 ) ( not ( = ?auto_702527 ?auto_702528 ) ) ( not ( = ?auto_702527 ?auto_702529 ) ) ( not ( = ?auto_702527 ?auto_702530 ) ) ( not ( = ?auto_702527 ?auto_702531 ) ) ( not ( = ?auto_702527 ?auto_702532 ) ) ( not ( = ?auto_702528 ?auto_702529 ) ) ( not ( = ?auto_702528 ?auto_702530 ) ) ( not ( = ?auto_702528 ?auto_702531 ) ) ( not ( = ?auto_702528 ?auto_702532 ) ) ( not ( = ?auto_702529 ?auto_702530 ) ) ( not ( = ?auto_702529 ?auto_702531 ) ) ( not ( = ?auto_702529 ?auto_702532 ) ) ( not ( = ?auto_702530 ?auto_702531 ) ) ( not ( = ?auto_702530 ?auto_702532 ) ) ( not ( = ?auto_702531 ?auto_702532 ) ) ( CLEAR ?auto_702529 ) ( ON ?auto_702530 ?auto_702531 ) ( CLEAR ?auto_702530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_702527 ?auto_702528 ?auto_702529 ?auto_702530 )
      ( MAKE-5PILE ?auto_702527 ?auto_702528 ?auto_702529 ?auto_702530 ?auto_702531 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_702549 - BLOCK
      ?auto_702550 - BLOCK
      ?auto_702551 - BLOCK
      ?auto_702552 - BLOCK
      ?auto_702553 - BLOCK
    )
    :vars
    (
      ?auto_702554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702553 ?auto_702554 ) ( ON-TABLE ?auto_702549 ) ( ON ?auto_702550 ?auto_702549 ) ( not ( = ?auto_702549 ?auto_702550 ) ) ( not ( = ?auto_702549 ?auto_702551 ) ) ( not ( = ?auto_702549 ?auto_702552 ) ) ( not ( = ?auto_702549 ?auto_702553 ) ) ( not ( = ?auto_702549 ?auto_702554 ) ) ( not ( = ?auto_702550 ?auto_702551 ) ) ( not ( = ?auto_702550 ?auto_702552 ) ) ( not ( = ?auto_702550 ?auto_702553 ) ) ( not ( = ?auto_702550 ?auto_702554 ) ) ( not ( = ?auto_702551 ?auto_702552 ) ) ( not ( = ?auto_702551 ?auto_702553 ) ) ( not ( = ?auto_702551 ?auto_702554 ) ) ( not ( = ?auto_702552 ?auto_702553 ) ) ( not ( = ?auto_702552 ?auto_702554 ) ) ( not ( = ?auto_702553 ?auto_702554 ) ) ( ON ?auto_702552 ?auto_702553 ) ( CLEAR ?auto_702550 ) ( ON ?auto_702551 ?auto_702552 ) ( CLEAR ?auto_702551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702549 ?auto_702550 ?auto_702551 )
      ( MAKE-5PILE ?auto_702549 ?auto_702550 ?auto_702551 ?auto_702552 ?auto_702553 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_702571 - BLOCK
      ?auto_702572 - BLOCK
      ?auto_702573 - BLOCK
      ?auto_702574 - BLOCK
      ?auto_702575 - BLOCK
    )
    :vars
    (
      ?auto_702576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702575 ?auto_702576 ) ( ON-TABLE ?auto_702571 ) ( not ( = ?auto_702571 ?auto_702572 ) ) ( not ( = ?auto_702571 ?auto_702573 ) ) ( not ( = ?auto_702571 ?auto_702574 ) ) ( not ( = ?auto_702571 ?auto_702575 ) ) ( not ( = ?auto_702571 ?auto_702576 ) ) ( not ( = ?auto_702572 ?auto_702573 ) ) ( not ( = ?auto_702572 ?auto_702574 ) ) ( not ( = ?auto_702572 ?auto_702575 ) ) ( not ( = ?auto_702572 ?auto_702576 ) ) ( not ( = ?auto_702573 ?auto_702574 ) ) ( not ( = ?auto_702573 ?auto_702575 ) ) ( not ( = ?auto_702573 ?auto_702576 ) ) ( not ( = ?auto_702574 ?auto_702575 ) ) ( not ( = ?auto_702574 ?auto_702576 ) ) ( not ( = ?auto_702575 ?auto_702576 ) ) ( ON ?auto_702574 ?auto_702575 ) ( ON ?auto_702573 ?auto_702574 ) ( CLEAR ?auto_702571 ) ( ON ?auto_702572 ?auto_702573 ) ( CLEAR ?auto_702572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702571 ?auto_702572 )
      ( MAKE-5PILE ?auto_702571 ?auto_702572 ?auto_702573 ?auto_702574 ?auto_702575 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_702593 - BLOCK
      ?auto_702594 - BLOCK
      ?auto_702595 - BLOCK
      ?auto_702596 - BLOCK
      ?auto_702597 - BLOCK
    )
    :vars
    (
      ?auto_702598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702597 ?auto_702598 ) ( not ( = ?auto_702593 ?auto_702594 ) ) ( not ( = ?auto_702593 ?auto_702595 ) ) ( not ( = ?auto_702593 ?auto_702596 ) ) ( not ( = ?auto_702593 ?auto_702597 ) ) ( not ( = ?auto_702593 ?auto_702598 ) ) ( not ( = ?auto_702594 ?auto_702595 ) ) ( not ( = ?auto_702594 ?auto_702596 ) ) ( not ( = ?auto_702594 ?auto_702597 ) ) ( not ( = ?auto_702594 ?auto_702598 ) ) ( not ( = ?auto_702595 ?auto_702596 ) ) ( not ( = ?auto_702595 ?auto_702597 ) ) ( not ( = ?auto_702595 ?auto_702598 ) ) ( not ( = ?auto_702596 ?auto_702597 ) ) ( not ( = ?auto_702596 ?auto_702598 ) ) ( not ( = ?auto_702597 ?auto_702598 ) ) ( ON ?auto_702596 ?auto_702597 ) ( ON ?auto_702595 ?auto_702596 ) ( ON ?auto_702594 ?auto_702595 ) ( ON ?auto_702593 ?auto_702594 ) ( CLEAR ?auto_702593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702593 )
      ( MAKE-5PILE ?auto_702593 ?auto_702594 ?auto_702595 ?auto_702596 ?auto_702597 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702616 - BLOCK
      ?auto_702617 - BLOCK
      ?auto_702618 - BLOCK
      ?auto_702619 - BLOCK
      ?auto_702620 - BLOCK
      ?auto_702621 - BLOCK
    )
    :vars
    (
      ?auto_702622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702620 ) ( ON ?auto_702621 ?auto_702622 ) ( CLEAR ?auto_702621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702616 ) ( ON ?auto_702617 ?auto_702616 ) ( ON ?auto_702618 ?auto_702617 ) ( ON ?auto_702619 ?auto_702618 ) ( ON ?auto_702620 ?auto_702619 ) ( not ( = ?auto_702616 ?auto_702617 ) ) ( not ( = ?auto_702616 ?auto_702618 ) ) ( not ( = ?auto_702616 ?auto_702619 ) ) ( not ( = ?auto_702616 ?auto_702620 ) ) ( not ( = ?auto_702616 ?auto_702621 ) ) ( not ( = ?auto_702616 ?auto_702622 ) ) ( not ( = ?auto_702617 ?auto_702618 ) ) ( not ( = ?auto_702617 ?auto_702619 ) ) ( not ( = ?auto_702617 ?auto_702620 ) ) ( not ( = ?auto_702617 ?auto_702621 ) ) ( not ( = ?auto_702617 ?auto_702622 ) ) ( not ( = ?auto_702618 ?auto_702619 ) ) ( not ( = ?auto_702618 ?auto_702620 ) ) ( not ( = ?auto_702618 ?auto_702621 ) ) ( not ( = ?auto_702618 ?auto_702622 ) ) ( not ( = ?auto_702619 ?auto_702620 ) ) ( not ( = ?auto_702619 ?auto_702621 ) ) ( not ( = ?auto_702619 ?auto_702622 ) ) ( not ( = ?auto_702620 ?auto_702621 ) ) ( not ( = ?auto_702620 ?auto_702622 ) ) ( not ( = ?auto_702621 ?auto_702622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702621 ?auto_702622 )
      ( !STACK ?auto_702621 ?auto_702620 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702642 - BLOCK
      ?auto_702643 - BLOCK
      ?auto_702644 - BLOCK
      ?auto_702645 - BLOCK
      ?auto_702646 - BLOCK
      ?auto_702647 - BLOCK
    )
    :vars
    (
      ?auto_702648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702647 ?auto_702648 ) ( ON-TABLE ?auto_702642 ) ( ON ?auto_702643 ?auto_702642 ) ( ON ?auto_702644 ?auto_702643 ) ( ON ?auto_702645 ?auto_702644 ) ( not ( = ?auto_702642 ?auto_702643 ) ) ( not ( = ?auto_702642 ?auto_702644 ) ) ( not ( = ?auto_702642 ?auto_702645 ) ) ( not ( = ?auto_702642 ?auto_702646 ) ) ( not ( = ?auto_702642 ?auto_702647 ) ) ( not ( = ?auto_702642 ?auto_702648 ) ) ( not ( = ?auto_702643 ?auto_702644 ) ) ( not ( = ?auto_702643 ?auto_702645 ) ) ( not ( = ?auto_702643 ?auto_702646 ) ) ( not ( = ?auto_702643 ?auto_702647 ) ) ( not ( = ?auto_702643 ?auto_702648 ) ) ( not ( = ?auto_702644 ?auto_702645 ) ) ( not ( = ?auto_702644 ?auto_702646 ) ) ( not ( = ?auto_702644 ?auto_702647 ) ) ( not ( = ?auto_702644 ?auto_702648 ) ) ( not ( = ?auto_702645 ?auto_702646 ) ) ( not ( = ?auto_702645 ?auto_702647 ) ) ( not ( = ?auto_702645 ?auto_702648 ) ) ( not ( = ?auto_702646 ?auto_702647 ) ) ( not ( = ?auto_702646 ?auto_702648 ) ) ( not ( = ?auto_702647 ?auto_702648 ) ) ( CLEAR ?auto_702645 ) ( ON ?auto_702646 ?auto_702647 ) ( CLEAR ?auto_702646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_702642 ?auto_702643 ?auto_702644 ?auto_702645 ?auto_702646 )
      ( MAKE-6PILE ?auto_702642 ?auto_702643 ?auto_702644 ?auto_702645 ?auto_702646 ?auto_702647 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702668 - BLOCK
      ?auto_702669 - BLOCK
      ?auto_702670 - BLOCK
      ?auto_702671 - BLOCK
      ?auto_702672 - BLOCK
      ?auto_702673 - BLOCK
    )
    :vars
    (
      ?auto_702674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702673 ?auto_702674 ) ( ON-TABLE ?auto_702668 ) ( ON ?auto_702669 ?auto_702668 ) ( ON ?auto_702670 ?auto_702669 ) ( not ( = ?auto_702668 ?auto_702669 ) ) ( not ( = ?auto_702668 ?auto_702670 ) ) ( not ( = ?auto_702668 ?auto_702671 ) ) ( not ( = ?auto_702668 ?auto_702672 ) ) ( not ( = ?auto_702668 ?auto_702673 ) ) ( not ( = ?auto_702668 ?auto_702674 ) ) ( not ( = ?auto_702669 ?auto_702670 ) ) ( not ( = ?auto_702669 ?auto_702671 ) ) ( not ( = ?auto_702669 ?auto_702672 ) ) ( not ( = ?auto_702669 ?auto_702673 ) ) ( not ( = ?auto_702669 ?auto_702674 ) ) ( not ( = ?auto_702670 ?auto_702671 ) ) ( not ( = ?auto_702670 ?auto_702672 ) ) ( not ( = ?auto_702670 ?auto_702673 ) ) ( not ( = ?auto_702670 ?auto_702674 ) ) ( not ( = ?auto_702671 ?auto_702672 ) ) ( not ( = ?auto_702671 ?auto_702673 ) ) ( not ( = ?auto_702671 ?auto_702674 ) ) ( not ( = ?auto_702672 ?auto_702673 ) ) ( not ( = ?auto_702672 ?auto_702674 ) ) ( not ( = ?auto_702673 ?auto_702674 ) ) ( ON ?auto_702672 ?auto_702673 ) ( CLEAR ?auto_702670 ) ( ON ?auto_702671 ?auto_702672 ) ( CLEAR ?auto_702671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_702668 ?auto_702669 ?auto_702670 ?auto_702671 )
      ( MAKE-6PILE ?auto_702668 ?auto_702669 ?auto_702670 ?auto_702671 ?auto_702672 ?auto_702673 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702694 - BLOCK
      ?auto_702695 - BLOCK
      ?auto_702696 - BLOCK
      ?auto_702697 - BLOCK
      ?auto_702698 - BLOCK
      ?auto_702699 - BLOCK
    )
    :vars
    (
      ?auto_702700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702699 ?auto_702700 ) ( ON-TABLE ?auto_702694 ) ( ON ?auto_702695 ?auto_702694 ) ( not ( = ?auto_702694 ?auto_702695 ) ) ( not ( = ?auto_702694 ?auto_702696 ) ) ( not ( = ?auto_702694 ?auto_702697 ) ) ( not ( = ?auto_702694 ?auto_702698 ) ) ( not ( = ?auto_702694 ?auto_702699 ) ) ( not ( = ?auto_702694 ?auto_702700 ) ) ( not ( = ?auto_702695 ?auto_702696 ) ) ( not ( = ?auto_702695 ?auto_702697 ) ) ( not ( = ?auto_702695 ?auto_702698 ) ) ( not ( = ?auto_702695 ?auto_702699 ) ) ( not ( = ?auto_702695 ?auto_702700 ) ) ( not ( = ?auto_702696 ?auto_702697 ) ) ( not ( = ?auto_702696 ?auto_702698 ) ) ( not ( = ?auto_702696 ?auto_702699 ) ) ( not ( = ?auto_702696 ?auto_702700 ) ) ( not ( = ?auto_702697 ?auto_702698 ) ) ( not ( = ?auto_702697 ?auto_702699 ) ) ( not ( = ?auto_702697 ?auto_702700 ) ) ( not ( = ?auto_702698 ?auto_702699 ) ) ( not ( = ?auto_702698 ?auto_702700 ) ) ( not ( = ?auto_702699 ?auto_702700 ) ) ( ON ?auto_702698 ?auto_702699 ) ( ON ?auto_702697 ?auto_702698 ) ( CLEAR ?auto_702695 ) ( ON ?auto_702696 ?auto_702697 ) ( CLEAR ?auto_702696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702694 ?auto_702695 ?auto_702696 )
      ( MAKE-6PILE ?auto_702694 ?auto_702695 ?auto_702696 ?auto_702697 ?auto_702698 ?auto_702699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702720 - BLOCK
      ?auto_702721 - BLOCK
      ?auto_702722 - BLOCK
      ?auto_702723 - BLOCK
      ?auto_702724 - BLOCK
      ?auto_702725 - BLOCK
    )
    :vars
    (
      ?auto_702726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702725 ?auto_702726 ) ( ON-TABLE ?auto_702720 ) ( not ( = ?auto_702720 ?auto_702721 ) ) ( not ( = ?auto_702720 ?auto_702722 ) ) ( not ( = ?auto_702720 ?auto_702723 ) ) ( not ( = ?auto_702720 ?auto_702724 ) ) ( not ( = ?auto_702720 ?auto_702725 ) ) ( not ( = ?auto_702720 ?auto_702726 ) ) ( not ( = ?auto_702721 ?auto_702722 ) ) ( not ( = ?auto_702721 ?auto_702723 ) ) ( not ( = ?auto_702721 ?auto_702724 ) ) ( not ( = ?auto_702721 ?auto_702725 ) ) ( not ( = ?auto_702721 ?auto_702726 ) ) ( not ( = ?auto_702722 ?auto_702723 ) ) ( not ( = ?auto_702722 ?auto_702724 ) ) ( not ( = ?auto_702722 ?auto_702725 ) ) ( not ( = ?auto_702722 ?auto_702726 ) ) ( not ( = ?auto_702723 ?auto_702724 ) ) ( not ( = ?auto_702723 ?auto_702725 ) ) ( not ( = ?auto_702723 ?auto_702726 ) ) ( not ( = ?auto_702724 ?auto_702725 ) ) ( not ( = ?auto_702724 ?auto_702726 ) ) ( not ( = ?auto_702725 ?auto_702726 ) ) ( ON ?auto_702724 ?auto_702725 ) ( ON ?auto_702723 ?auto_702724 ) ( ON ?auto_702722 ?auto_702723 ) ( CLEAR ?auto_702720 ) ( ON ?auto_702721 ?auto_702722 ) ( CLEAR ?auto_702721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702720 ?auto_702721 )
      ( MAKE-6PILE ?auto_702720 ?auto_702721 ?auto_702722 ?auto_702723 ?auto_702724 ?auto_702725 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_702746 - BLOCK
      ?auto_702747 - BLOCK
      ?auto_702748 - BLOCK
      ?auto_702749 - BLOCK
      ?auto_702750 - BLOCK
      ?auto_702751 - BLOCK
    )
    :vars
    (
      ?auto_702752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702751 ?auto_702752 ) ( not ( = ?auto_702746 ?auto_702747 ) ) ( not ( = ?auto_702746 ?auto_702748 ) ) ( not ( = ?auto_702746 ?auto_702749 ) ) ( not ( = ?auto_702746 ?auto_702750 ) ) ( not ( = ?auto_702746 ?auto_702751 ) ) ( not ( = ?auto_702746 ?auto_702752 ) ) ( not ( = ?auto_702747 ?auto_702748 ) ) ( not ( = ?auto_702747 ?auto_702749 ) ) ( not ( = ?auto_702747 ?auto_702750 ) ) ( not ( = ?auto_702747 ?auto_702751 ) ) ( not ( = ?auto_702747 ?auto_702752 ) ) ( not ( = ?auto_702748 ?auto_702749 ) ) ( not ( = ?auto_702748 ?auto_702750 ) ) ( not ( = ?auto_702748 ?auto_702751 ) ) ( not ( = ?auto_702748 ?auto_702752 ) ) ( not ( = ?auto_702749 ?auto_702750 ) ) ( not ( = ?auto_702749 ?auto_702751 ) ) ( not ( = ?auto_702749 ?auto_702752 ) ) ( not ( = ?auto_702750 ?auto_702751 ) ) ( not ( = ?auto_702750 ?auto_702752 ) ) ( not ( = ?auto_702751 ?auto_702752 ) ) ( ON ?auto_702750 ?auto_702751 ) ( ON ?auto_702749 ?auto_702750 ) ( ON ?auto_702748 ?auto_702749 ) ( ON ?auto_702747 ?auto_702748 ) ( ON ?auto_702746 ?auto_702747 ) ( CLEAR ?auto_702746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702746 )
      ( MAKE-6PILE ?auto_702746 ?auto_702747 ?auto_702748 ?auto_702749 ?auto_702750 ?auto_702751 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702773 - BLOCK
      ?auto_702774 - BLOCK
      ?auto_702775 - BLOCK
      ?auto_702776 - BLOCK
      ?auto_702777 - BLOCK
      ?auto_702778 - BLOCK
      ?auto_702779 - BLOCK
    )
    :vars
    (
      ?auto_702780 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702778 ) ( ON ?auto_702779 ?auto_702780 ) ( CLEAR ?auto_702779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702773 ) ( ON ?auto_702774 ?auto_702773 ) ( ON ?auto_702775 ?auto_702774 ) ( ON ?auto_702776 ?auto_702775 ) ( ON ?auto_702777 ?auto_702776 ) ( ON ?auto_702778 ?auto_702777 ) ( not ( = ?auto_702773 ?auto_702774 ) ) ( not ( = ?auto_702773 ?auto_702775 ) ) ( not ( = ?auto_702773 ?auto_702776 ) ) ( not ( = ?auto_702773 ?auto_702777 ) ) ( not ( = ?auto_702773 ?auto_702778 ) ) ( not ( = ?auto_702773 ?auto_702779 ) ) ( not ( = ?auto_702773 ?auto_702780 ) ) ( not ( = ?auto_702774 ?auto_702775 ) ) ( not ( = ?auto_702774 ?auto_702776 ) ) ( not ( = ?auto_702774 ?auto_702777 ) ) ( not ( = ?auto_702774 ?auto_702778 ) ) ( not ( = ?auto_702774 ?auto_702779 ) ) ( not ( = ?auto_702774 ?auto_702780 ) ) ( not ( = ?auto_702775 ?auto_702776 ) ) ( not ( = ?auto_702775 ?auto_702777 ) ) ( not ( = ?auto_702775 ?auto_702778 ) ) ( not ( = ?auto_702775 ?auto_702779 ) ) ( not ( = ?auto_702775 ?auto_702780 ) ) ( not ( = ?auto_702776 ?auto_702777 ) ) ( not ( = ?auto_702776 ?auto_702778 ) ) ( not ( = ?auto_702776 ?auto_702779 ) ) ( not ( = ?auto_702776 ?auto_702780 ) ) ( not ( = ?auto_702777 ?auto_702778 ) ) ( not ( = ?auto_702777 ?auto_702779 ) ) ( not ( = ?auto_702777 ?auto_702780 ) ) ( not ( = ?auto_702778 ?auto_702779 ) ) ( not ( = ?auto_702778 ?auto_702780 ) ) ( not ( = ?auto_702779 ?auto_702780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702779 ?auto_702780 )
      ( !STACK ?auto_702779 ?auto_702778 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702803 - BLOCK
      ?auto_702804 - BLOCK
      ?auto_702805 - BLOCK
      ?auto_702806 - BLOCK
      ?auto_702807 - BLOCK
      ?auto_702808 - BLOCK
      ?auto_702809 - BLOCK
    )
    :vars
    (
      ?auto_702810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702809 ?auto_702810 ) ( ON-TABLE ?auto_702803 ) ( ON ?auto_702804 ?auto_702803 ) ( ON ?auto_702805 ?auto_702804 ) ( ON ?auto_702806 ?auto_702805 ) ( ON ?auto_702807 ?auto_702806 ) ( not ( = ?auto_702803 ?auto_702804 ) ) ( not ( = ?auto_702803 ?auto_702805 ) ) ( not ( = ?auto_702803 ?auto_702806 ) ) ( not ( = ?auto_702803 ?auto_702807 ) ) ( not ( = ?auto_702803 ?auto_702808 ) ) ( not ( = ?auto_702803 ?auto_702809 ) ) ( not ( = ?auto_702803 ?auto_702810 ) ) ( not ( = ?auto_702804 ?auto_702805 ) ) ( not ( = ?auto_702804 ?auto_702806 ) ) ( not ( = ?auto_702804 ?auto_702807 ) ) ( not ( = ?auto_702804 ?auto_702808 ) ) ( not ( = ?auto_702804 ?auto_702809 ) ) ( not ( = ?auto_702804 ?auto_702810 ) ) ( not ( = ?auto_702805 ?auto_702806 ) ) ( not ( = ?auto_702805 ?auto_702807 ) ) ( not ( = ?auto_702805 ?auto_702808 ) ) ( not ( = ?auto_702805 ?auto_702809 ) ) ( not ( = ?auto_702805 ?auto_702810 ) ) ( not ( = ?auto_702806 ?auto_702807 ) ) ( not ( = ?auto_702806 ?auto_702808 ) ) ( not ( = ?auto_702806 ?auto_702809 ) ) ( not ( = ?auto_702806 ?auto_702810 ) ) ( not ( = ?auto_702807 ?auto_702808 ) ) ( not ( = ?auto_702807 ?auto_702809 ) ) ( not ( = ?auto_702807 ?auto_702810 ) ) ( not ( = ?auto_702808 ?auto_702809 ) ) ( not ( = ?auto_702808 ?auto_702810 ) ) ( not ( = ?auto_702809 ?auto_702810 ) ) ( CLEAR ?auto_702807 ) ( ON ?auto_702808 ?auto_702809 ) ( CLEAR ?auto_702808 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_702803 ?auto_702804 ?auto_702805 ?auto_702806 ?auto_702807 ?auto_702808 )
      ( MAKE-7PILE ?auto_702803 ?auto_702804 ?auto_702805 ?auto_702806 ?auto_702807 ?auto_702808 ?auto_702809 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702833 - BLOCK
      ?auto_702834 - BLOCK
      ?auto_702835 - BLOCK
      ?auto_702836 - BLOCK
      ?auto_702837 - BLOCK
      ?auto_702838 - BLOCK
      ?auto_702839 - BLOCK
    )
    :vars
    (
      ?auto_702840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702839 ?auto_702840 ) ( ON-TABLE ?auto_702833 ) ( ON ?auto_702834 ?auto_702833 ) ( ON ?auto_702835 ?auto_702834 ) ( ON ?auto_702836 ?auto_702835 ) ( not ( = ?auto_702833 ?auto_702834 ) ) ( not ( = ?auto_702833 ?auto_702835 ) ) ( not ( = ?auto_702833 ?auto_702836 ) ) ( not ( = ?auto_702833 ?auto_702837 ) ) ( not ( = ?auto_702833 ?auto_702838 ) ) ( not ( = ?auto_702833 ?auto_702839 ) ) ( not ( = ?auto_702833 ?auto_702840 ) ) ( not ( = ?auto_702834 ?auto_702835 ) ) ( not ( = ?auto_702834 ?auto_702836 ) ) ( not ( = ?auto_702834 ?auto_702837 ) ) ( not ( = ?auto_702834 ?auto_702838 ) ) ( not ( = ?auto_702834 ?auto_702839 ) ) ( not ( = ?auto_702834 ?auto_702840 ) ) ( not ( = ?auto_702835 ?auto_702836 ) ) ( not ( = ?auto_702835 ?auto_702837 ) ) ( not ( = ?auto_702835 ?auto_702838 ) ) ( not ( = ?auto_702835 ?auto_702839 ) ) ( not ( = ?auto_702835 ?auto_702840 ) ) ( not ( = ?auto_702836 ?auto_702837 ) ) ( not ( = ?auto_702836 ?auto_702838 ) ) ( not ( = ?auto_702836 ?auto_702839 ) ) ( not ( = ?auto_702836 ?auto_702840 ) ) ( not ( = ?auto_702837 ?auto_702838 ) ) ( not ( = ?auto_702837 ?auto_702839 ) ) ( not ( = ?auto_702837 ?auto_702840 ) ) ( not ( = ?auto_702838 ?auto_702839 ) ) ( not ( = ?auto_702838 ?auto_702840 ) ) ( not ( = ?auto_702839 ?auto_702840 ) ) ( ON ?auto_702838 ?auto_702839 ) ( CLEAR ?auto_702836 ) ( ON ?auto_702837 ?auto_702838 ) ( CLEAR ?auto_702837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_702833 ?auto_702834 ?auto_702835 ?auto_702836 ?auto_702837 )
      ( MAKE-7PILE ?auto_702833 ?auto_702834 ?auto_702835 ?auto_702836 ?auto_702837 ?auto_702838 ?auto_702839 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702863 - BLOCK
      ?auto_702864 - BLOCK
      ?auto_702865 - BLOCK
      ?auto_702866 - BLOCK
      ?auto_702867 - BLOCK
      ?auto_702868 - BLOCK
      ?auto_702869 - BLOCK
    )
    :vars
    (
      ?auto_702870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702869 ?auto_702870 ) ( ON-TABLE ?auto_702863 ) ( ON ?auto_702864 ?auto_702863 ) ( ON ?auto_702865 ?auto_702864 ) ( not ( = ?auto_702863 ?auto_702864 ) ) ( not ( = ?auto_702863 ?auto_702865 ) ) ( not ( = ?auto_702863 ?auto_702866 ) ) ( not ( = ?auto_702863 ?auto_702867 ) ) ( not ( = ?auto_702863 ?auto_702868 ) ) ( not ( = ?auto_702863 ?auto_702869 ) ) ( not ( = ?auto_702863 ?auto_702870 ) ) ( not ( = ?auto_702864 ?auto_702865 ) ) ( not ( = ?auto_702864 ?auto_702866 ) ) ( not ( = ?auto_702864 ?auto_702867 ) ) ( not ( = ?auto_702864 ?auto_702868 ) ) ( not ( = ?auto_702864 ?auto_702869 ) ) ( not ( = ?auto_702864 ?auto_702870 ) ) ( not ( = ?auto_702865 ?auto_702866 ) ) ( not ( = ?auto_702865 ?auto_702867 ) ) ( not ( = ?auto_702865 ?auto_702868 ) ) ( not ( = ?auto_702865 ?auto_702869 ) ) ( not ( = ?auto_702865 ?auto_702870 ) ) ( not ( = ?auto_702866 ?auto_702867 ) ) ( not ( = ?auto_702866 ?auto_702868 ) ) ( not ( = ?auto_702866 ?auto_702869 ) ) ( not ( = ?auto_702866 ?auto_702870 ) ) ( not ( = ?auto_702867 ?auto_702868 ) ) ( not ( = ?auto_702867 ?auto_702869 ) ) ( not ( = ?auto_702867 ?auto_702870 ) ) ( not ( = ?auto_702868 ?auto_702869 ) ) ( not ( = ?auto_702868 ?auto_702870 ) ) ( not ( = ?auto_702869 ?auto_702870 ) ) ( ON ?auto_702868 ?auto_702869 ) ( ON ?auto_702867 ?auto_702868 ) ( CLEAR ?auto_702865 ) ( ON ?auto_702866 ?auto_702867 ) ( CLEAR ?auto_702866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_702863 ?auto_702864 ?auto_702865 ?auto_702866 )
      ( MAKE-7PILE ?auto_702863 ?auto_702864 ?auto_702865 ?auto_702866 ?auto_702867 ?auto_702868 ?auto_702869 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702893 - BLOCK
      ?auto_702894 - BLOCK
      ?auto_702895 - BLOCK
      ?auto_702896 - BLOCK
      ?auto_702897 - BLOCK
      ?auto_702898 - BLOCK
      ?auto_702899 - BLOCK
    )
    :vars
    (
      ?auto_702900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702899 ?auto_702900 ) ( ON-TABLE ?auto_702893 ) ( ON ?auto_702894 ?auto_702893 ) ( not ( = ?auto_702893 ?auto_702894 ) ) ( not ( = ?auto_702893 ?auto_702895 ) ) ( not ( = ?auto_702893 ?auto_702896 ) ) ( not ( = ?auto_702893 ?auto_702897 ) ) ( not ( = ?auto_702893 ?auto_702898 ) ) ( not ( = ?auto_702893 ?auto_702899 ) ) ( not ( = ?auto_702893 ?auto_702900 ) ) ( not ( = ?auto_702894 ?auto_702895 ) ) ( not ( = ?auto_702894 ?auto_702896 ) ) ( not ( = ?auto_702894 ?auto_702897 ) ) ( not ( = ?auto_702894 ?auto_702898 ) ) ( not ( = ?auto_702894 ?auto_702899 ) ) ( not ( = ?auto_702894 ?auto_702900 ) ) ( not ( = ?auto_702895 ?auto_702896 ) ) ( not ( = ?auto_702895 ?auto_702897 ) ) ( not ( = ?auto_702895 ?auto_702898 ) ) ( not ( = ?auto_702895 ?auto_702899 ) ) ( not ( = ?auto_702895 ?auto_702900 ) ) ( not ( = ?auto_702896 ?auto_702897 ) ) ( not ( = ?auto_702896 ?auto_702898 ) ) ( not ( = ?auto_702896 ?auto_702899 ) ) ( not ( = ?auto_702896 ?auto_702900 ) ) ( not ( = ?auto_702897 ?auto_702898 ) ) ( not ( = ?auto_702897 ?auto_702899 ) ) ( not ( = ?auto_702897 ?auto_702900 ) ) ( not ( = ?auto_702898 ?auto_702899 ) ) ( not ( = ?auto_702898 ?auto_702900 ) ) ( not ( = ?auto_702899 ?auto_702900 ) ) ( ON ?auto_702898 ?auto_702899 ) ( ON ?auto_702897 ?auto_702898 ) ( ON ?auto_702896 ?auto_702897 ) ( CLEAR ?auto_702894 ) ( ON ?auto_702895 ?auto_702896 ) ( CLEAR ?auto_702895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_702893 ?auto_702894 ?auto_702895 )
      ( MAKE-7PILE ?auto_702893 ?auto_702894 ?auto_702895 ?auto_702896 ?auto_702897 ?auto_702898 ?auto_702899 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702923 - BLOCK
      ?auto_702924 - BLOCK
      ?auto_702925 - BLOCK
      ?auto_702926 - BLOCK
      ?auto_702927 - BLOCK
      ?auto_702928 - BLOCK
      ?auto_702929 - BLOCK
    )
    :vars
    (
      ?auto_702930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702929 ?auto_702930 ) ( ON-TABLE ?auto_702923 ) ( not ( = ?auto_702923 ?auto_702924 ) ) ( not ( = ?auto_702923 ?auto_702925 ) ) ( not ( = ?auto_702923 ?auto_702926 ) ) ( not ( = ?auto_702923 ?auto_702927 ) ) ( not ( = ?auto_702923 ?auto_702928 ) ) ( not ( = ?auto_702923 ?auto_702929 ) ) ( not ( = ?auto_702923 ?auto_702930 ) ) ( not ( = ?auto_702924 ?auto_702925 ) ) ( not ( = ?auto_702924 ?auto_702926 ) ) ( not ( = ?auto_702924 ?auto_702927 ) ) ( not ( = ?auto_702924 ?auto_702928 ) ) ( not ( = ?auto_702924 ?auto_702929 ) ) ( not ( = ?auto_702924 ?auto_702930 ) ) ( not ( = ?auto_702925 ?auto_702926 ) ) ( not ( = ?auto_702925 ?auto_702927 ) ) ( not ( = ?auto_702925 ?auto_702928 ) ) ( not ( = ?auto_702925 ?auto_702929 ) ) ( not ( = ?auto_702925 ?auto_702930 ) ) ( not ( = ?auto_702926 ?auto_702927 ) ) ( not ( = ?auto_702926 ?auto_702928 ) ) ( not ( = ?auto_702926 ?auto_702929 ) ) ( not ( = ?auto_702926 ?auto_702930 ) ) ( not ( = ?auto_702927 ?auto_702928 ) ) ( not ( = ?auto_702927 ?auto_702929 ) ) ( not ( = ?auto_702927 ?auto_702930 ) ) ( not ( = ?auto_702928 ?auto_702929 ) ) ( not ( = ?auto_702928 ?auto_702930 ) ) ( not ( = ?auto_702929 ?auto_702930 ) ) ( ON ?auto_702928 ?auto_702929 ) ( ON ?auto_702927 ?auto_702928 ) ( ON ?auto_702926 ?auto_702927 ) ( ON ?auto_702925 ?auto_702926 ) ( CLEAR ?auto_702923 ) ( ON ?auto_702924 ?auto_702925 ) ( CLEAR ?auto_702924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_702923 ?auto_702924 )
      ( MAKE-7PILE ?auto_702923 ?auto_702924 ?auto_702925 ?auto_702926 ?auto_702927 ?auto_702928 ?auto_702929 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_702953 - BLOCK
      ?auto_702954 - BLOCK
      ?auto_702955 - BLOCK
      ?auto_702956 - BLOCK
      ?auto_702957 - BLOCK
      ?auto_702958 - BLOCK
      ?auto_702959 - BLOCK
    )
    :vars
    (
      ?auto_702960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_702959 ?auto_702960 ) ( not ( = ?auto_702953 ?auto_702954 ) ) ( not ( = ?auto_702953 ?auto_702955 ) ) ( not ( = ?auto_702953 ?auto_702956 ) ) ( not ( = ?auto_702953 ?auto_702957 ) ) ( not ( = ?auto_702953 ?auto_702958 ) ) ( not ( = ?auto_702953 ?auto_702959 ) ) ( not ( = ?auto_702953 ?auto_702960 ) ) ( not ( = ?auto_702954 ?auto_702955 ) ) ( not ( = ?auto_702954 ?auto_702956 ) ) ( not ( = ?auto_702954 ?auto_702957 ) ) ( not ( = ?auto_702954 ?auto_702958 ) ) ( not ( = ?auto_702954 ?auto_702959 ) ) ( not ( = ?auto_702954 ?auto_702960 ) ) ( not ( = ?auto_702955 ?auto_702956 ) ) ( not ( = ?auto_702955 ?auto_702957 ) ) ( not ( = ?auto_702955 ?auto_702958 ) ) ( not ( = ?auto_702955 ?auto_702959 ) ) ( not ( = ?auto_702955 ?auto_702960 ) ) ( not ( = ?auto_702956 ?auto_702957 ) ) ( not ( = ?auto_702956 ?auto_702958 ) ) ( not ( = ?auto_702956 ?auto_702959 ) ) ( not ( = ?auto_702956 ?auto_702960 ) ) ( not ( = ?auto_702957 ?auto_702958 ) ) ( not ( = ?auto_702957 ?auto_702959 ) ) ( not ( = ?auto_702957 ?auto_702960 ) ) ( not ( = ?auto_702958 ?auto_702959 ) ) ( not ( = ?auto_702958 ?auto_702960 ) ) ( not ( = ?auto_702959 ?auto_702960 ) ) ( ON ?auto_702958 ?auto_702959 ) ( ON ?auto_702957 ?auto_702958 ) ( ON ?auto_702956 ?auto_702957 ) ( ON ?auto_702955 ?auto_702956 ) ( ON ?auto_702954 ?auto_702955 ) ( ON ?auto_702953 ?auto_702954 ) ( CLEAR ?auto_702953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_702953 )
      ( MAKE-7PILE ?auto_702953 ?auto_702954 ?auto_702955 ?auto_702956 ?auto_702957 ?auto_702958 ?auto_702959 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_702984 - BLOCK
      ?auto_702985 - BLOCK
      ?auto_702986 - BLOCK
      ?auto_702987 - BLOCK
      ?auto_702988 - BLOCK
      ?auto_702989 - BLOCK
      ?auto_702990 - BLOCK
      ?auto_702991 - BLOCK
    )
    :vars
    (
      ?auto_702992 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_702990 ) ( ON ?auto_702991 ?auto_702992 ) ( CLEAR ?auto_702991 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_702984 ) ( ON ?auto_702985 ?auto_702984 ) ( ON ?auto_702986 ?auto_702985 ) ( ON ?auto_702987 ?auto_702986 ) ( ON ?auto_702988 ?auto_702987 ) ( ON ?auto_702989 ?auto_702988 ) ( ON ?auto_702990 ?auto_702989 ) ( not ( = ?auto_702984 ?auto_702985 ) ) ( not ( = ?auto_702984 ?auto_702986 ) ) ( not ( = ?auto_702984 ?auto_702987 ) ) ( not ( = ?auto_702984 ?auto_702988 ) ) ( not ( = ?auto_702984 ?auto_702989 ) ) ( not ( = ?auto_702984 ?auto_702990 ) ) ( not ( = ?auto_702984 ?auto_702991 ) ) ( not ( = ?auto_702984 ?auto_702992 ) ) ( not ( = ?auto_702985 ?auto_702986 ) ) ( not ( = ?auto_702985 ?auto_702987 ) ) ( not ( = ?auto_702985 ?auto_702988 ) ) ( not ( = ?auto_702985 ?auto_702989 ) ) ( not ( = ?auto_702985 ?auto_702990 ) ) ( not ( = ?auto_702985 ?auto_702991 ) ) ( not ( = ?auto_702985 ?auto_702992 ) ) ( not ( = ?auto_702986 ?auto_702987 ) ) ( not ( = ?auto_702986 ?auto_702988 ) ) ( not ( = ?auto_702986 ?auto_702989 ) ) ( not ( = ?auto_702986 ?auto_702990 ) ) ( not ( = ?auto_702986 ?auto_702991 ) ) ( not ( = ?auto_702986 ?auto_702992 ) ) ( not ( = ?auto_702987 ?auto_702988 ) ) ( not ( = ?auto_702987 ?auto_702989 ) ) ( not ( = ?auto_702987 ?auto_702990 ) ) ( not ( = ?auto_702987 ?auto_702991 ) ) ( not ( = ?auto_702987 ?auto_702992 ) ) ( not ( = ?auto_702988 ?auto_702989 ) ) ( not ( = ?auto_702988 ?auto_702990 ) ) ( not ( = ?auto_702988 ?auto_702991 ) ) ( not ( = ?auto_702988 ?auto_702992 ) ) ( not ( = ?auto_702989 ?auto_702990 ) ) ( not ( = ?auto_702989 ?auto_702991 ) ) ( not ( = ?auto_702989 ?auto_702992 ) ) ( not ( = ?auto_702990 ?auto_702991 ) ) ( not ( = ?auto_702990 ?auto_702992 ) ) ( not ( = ?auto_702991 ?auto_702992 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_702991 ?auto_702992 )
      ( !STACK ?auto_702991 ?auto_702990 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703018 - BLOCK
      ?auto_703019 - BLOCK
      ?auto_703020 - BLOCK
      ?auto_703021 - BLOCK
      ?auto_703022 - BLOCK
      ?auto_703023 - BLOCK
      ?auto_703024 - BLOCK
      ?auto_703025 - BLOCK
    )
    :vars
    (
      ?auto_703026 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703025 ?auto_703026 ) ( ON-TABLE ?auto_703018 ) ( ON ?auto_703019 ?auto_703018 ) ( ON ?auto_703020 ?auto_703019 ) ( ON ?auto_703021 ?auto_703020 ) ( ON ?auto_703022 ?auto_703021 ) ( ON ?auto_703023 ?auto_703022 ) ( not ( = ?auto_703018 ?auto_703019 ) ) ( not ( = ?auto_703018 ?auto_703020 ) ) ( not ( = ?auto_703018 ?auto_703021 ) ) ( not ( = ?auto_703018 ?auto_703022 ) ) ( not ( = ?auto_703018 ?auto_703023 ) ) ( not ( = ?auto_703018 ?auto_703024 ) ) ( not ( = ?auto_703018 ?auto_703025 ) ) ( not ( = ?auto_703018 ?auto_703026 ) ) ( not ( = ?auto_703019 ?auto_703020 ) ) ( not ( = ?auto_703019 ?auto_703021 ) ) ( not ( = ?auto_703019 ?auto_703022 ) ) ( not ( = ?auto_703019 ?auto_703023 ) ) ( not ( = ?auto_703019 ?auto_703024 ) ) ( not ( = ?auto_703019 ?auto_703025 ) ) ( not ( = ?auto_703019 ?auto_703026 ) ) ( not ( = ?auto_703020 ?auto_703021 ) ) ( not ( = ?auto_703020 ?auto_703022 ) ) ( not ( = ?auto_703020 ?auto_703023 ) ) ( not ( = ?auto_703020 ?auto_703024 ) ) ( not ( = ?auto_703020 ?auto_703025 ) ) ( not ( = ?auto_703020 ?auto_703026 ) ) ( not ( = ?auto_703021 ?auto_703022 ) ) ( not ( = ?auto_703021 ?auto_703023 ) ) ( not ( = ?auto_703021 ?auto_703024 ) ) ( not ( = ?auto_703021 ?auto_703025 ) ) ( not ( = ?auto_703021 ?auto_703026 ) ) ( not ( = ?auto_703022 ?auto_703023 ) ) ( not ( = ?auto_703022 ?auto_703024 ) ) ( not ( = ?auto_703022 ?auto_703025 ) ) ( not ( = ?auto_703022 ?auto_703026 ) ) ( not ( = ?auto_703023 ?auto_703024 ) ) ( not ( = ?auto_703023 ?auto_703025 ) ) ( not ( = ?auto_703023 ?auto_703026 ) ) ( not ( = ?auto_703024 ?auto_703025 ) ) ( not ( = ?auto_703024 ?auto_703026 ) ) ( not ( = ?auto_703025 ?auto_703026 ) ) ( CLEAR ?auto_703023 ) ( ON ?auto_703024 ?auto_703025 ) ( CLEAR ?auto_703024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_703018 ?auto_703019 ?auto_703020 ?auto_703021 ?auto_703022 ?auto_703023 ?auto_703024 )
      ( MAKE-8PILE ?auto_703018 ?auto_703019 ?auto_703020 ?auto_703021 ?auto_703022 ?auto_703023 ?auto_703024 ?auto_703025 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703052 - BLOCK
      ?auto_703053 - BLOCK
      ?auto_703054 - BLOCK
      ?auto_703055 - BLOCK
      ?auto_703056 - BLOCK
      ?auto_703057 - BLOCK
      ?auto_703058 - BLOCK
      ?auto_703059 - BLOCK
    )
    :vars
    (
      ?auto_703060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703059 ?auto_703060 ) ( ON-TABLE ?auto_703052 ) ( ON ?auto_703053 ?auto_703052 ) ( ON ?auto_703054 ?auto_703053 ) ( ON ?auto_703055 ?auto_703054 ) ( ON ?auto_703056 ?auto_703055 ) ( not ( = ?auto_703052 ?auto_703053 ) ) ( not ( = ?auto_703052 ?auto_703054 ) ) ( not ( = ?auto_703052 ?auto_703055 ) ) ( not ( = ?auto_703052 ?auto_703056 ) ) ( not ( = ?auto_703052 ?auto_703057 ) ) ( not ( = ?auto_703052 ?auto_703058 ) ) ( not ( = ?auto_703052 ?auto_703059 ) ) ( not ( = ?auto_703052 ?auto_703060 ) ) ( not ( = ?auto_703053 ?auto_703054 ) ) ( not ( = ?auto_703053 ?auto_703055 ) ) ( not ( = ?auto_703053 ?auto_703056 ) ) ( not ( = ?auto_703053 ?auto_703057 ) ) ( not ( = ?auto_703053 ?auto_703058 ) ) ( not ( = ?auto_703053 ?auto_703059 ) ) ( not ( = ?auto_703053 ?auto_703060 ) ) ( not ( = ?auto_703054 ?auto_703055 ) ) ( not ( = ?auto_703054 ?auto_703056 ) ) ( not ( = ?auto_703054 ?auto_703057 ) ) ( not ( = ?auto_703054 ?auto_703058 ) ) ( not ( = ?auto_703054 ?auto_703059 ) ) ( not ( = ?auto_703054 ?auto_703060 ) ) ( not ( = ?auto_703055 ?auto_703056 ) ) ( not ( = ?auto_703055 ?auto_703057 ) ) ( not ( = ?auto_703055 ?auto_703058 ) ) ( not ( = ?auto_703055 ?auto_703059 ) ) ( not ( = ?auto_703055 ?auto_703060 ) ) ( not ( = ?auto_703056 ?auto_703057 ) ) ( not ( = ?auto_703056 ?auto_703058 ) ) ( not ( = ?auto_703056 ?auto_703059 ) ) ( not ( = ?auto_703056 ?auto_703060 ) ) ( not ( = ?auto_703057 ?auto_703058 ) ) ( not ( = ?auto_703057 ?auto_703059 ) ) ( not ( = ?auto_703057 ?auto_703060 ) ) ( not ( = ?auto_703058 ?auto_703059 ) ) ( not ( = ?auto_703058 ?auto_703060 ) ) ( not ( = ?auto_703059 ?auto_703060 ) ) ( ON ?auto_703058 ?auto_703059 ) ( CLEAR ?auto_703056 ) ( ON ?auto_703057 ?auto_703058 ) ( CLEAR ?auto_703057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_703052 ?auto_703053 ?auto_703054 ?auto_703055 ?auto_703056 ?auto_703057 )
      ( MAKE-8PILE ?auto_703052 ?auto_703053 ?auto_703054 ?auto_703055 ?auto_703056 ?auto_703057 ?auto_703058 ?auto_703059 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703086 - BLOCK
      ?auto_703087 - BLOCK
      ?auto_703088 - BLOCK
      ?auto_703089 - BLOCK
      ?auto_703090 - BLOCK
      ?auto_703091 - BLOCK
      ?auto_703092 - BLOCK
      ?auto_703093 - BLOCK
    )
    :vars
    (
      ?auto_703094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703093 ?auto_703094 ) ( ON-TABLE ?auto_703086 ) ( ON ?auto_703087 ?auto_703086 ) ( ON ?auto_703088 ?auto_703087 ) ( ON ?auto_703089 ?auto_703088 ) ( not ( = ?auto_703086 ?auto_703087 ) ) ( not ( = ?auto_703086 ?auto_703088 ) ) ( not ( = ?auto_703086 ?auto_703089 ) ) ( not ( = ?auto_703086 ?auto_703090 ) ) ( not ( = ?auto_703086 ?auto_703091 ) ) ( not ( = ?auto_703086 ?auto_703092 ) ) ( not ( = ?auto_703086 ?auto_703093 ) ) ( not ( = ?auto_703086 ?auto_703094 ) ) ( not ( = ?auto_703087 ?auto_703088 ) ) ( not ( = ?auto_703087 ?auto_703089 ) ) ( not ( = ?auto_703087 ?auto_703090 ) ) ( not ( = ?auto_703087 ?auto_703091 ) ) ( not ( = ?auto_703087 ?auto_703092 ) ) ( not ( = ?auto_703087 ?auto_703093 ) ) ( not ( = ?auto_703087 ?auto_703094 ) ) ( not ( = ?auto_703088 ?auto_703089 ) ) ( not ( = ?auto_703088 ?auto_703090 ) ) ( not ( = ?auto_703088 ?auto_703091 ) ) ( not ( = ?auto_703088 ?auto_703092 ) ) ( not ( = ?auto_703088 ?auto_703093 ) ) ( not ( = ?auto_703088 ?auto_703094 ) ) ( not ( = ?auto_703089 ?auto_703090 ) ) ( not ( = ?auto_703089 ?auto_703091 ) ) ( not ( = ?auto_703089 ?auto_703092 ) ) ( not ( = ?auto_703089 ?auto_703093 ) ) ( not ( = ?auto_703089 ?auto_703094 ) ) ( not ( = ?auto_703090 ?auto_703091 ) ) ( not ( = ?auto_703090 ?auto_703092 ) ) ( not ( = ?auto_703090 ?auto_703093 ) ) ( not ( = ?auto_703090 ?auto_703094 ) ) ( not ( = ?auto_703091 ?auto_703092 ) ) ( not ( = ?auto_703091 ?auto_703093 ) ) ( not ( = ?auto_703091 ?auto_703094 ) ) ( not ( = ?auto_703092 ?auto_703093 ) ) ( not ( = ?auto_703092 ?auto_703094 ) ) ( not ( = ?auto_703093 ?auto_703094 ) ) ( ON ?auto_703092 ?auto_703093 ) ( ON ?auto_703091 ?auto_703092 ) ( CLEAR ?auto_703089 ) ( ON ?auto_703090 ?auto_703091 ) ( CLEAR ?auto_703090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_703086 ?auto_703087 ?auto_703088 ?auto_703089 ?auto_703090 )
      ( MAKE-8PILE ?auto_703086 ?auto_703087 ?auto_703088 ?auto_703089 ?auto_703090 ?auto_703091 ?auto_703092 ?auto_703093 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703120 - BLOCK
      ?auto_703121 - BLOCK
      ?auto_703122 - BLOCK
      ?auto_703123 - BLOCK
      ?auto_703124 - BLOCK
      ?auto_703125 - BLOCK
      ?auto_703126 - BLOCK
      ?auto_703127 - BLOCK
    )
    :vars
    (
      ?auto_703128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703127 ?auto_703128 ) ( ON-TABLE ?auto_703120 ) ( ON ?auto_703121 ?auto_703120 ) ( ON ?auto_703122 ?auto_703121 ) ( not ( = ?auto_703120 ?auto_703121 ) ) ( not ( = ?auto_703120 ?auto_703122 ) ) ( not ( = ?auto_703120 ?auto_703123 ) ) ( not ( = ?auto_703120 ?auto_703124 ) ) ( not ( = ?auto_703120 ?auto_703125 ) ) ( not ( = ?auto_703120 ?auto_703126 ) ) ( not ( = ?auto_703120 ?auto_703127 ) ) ( not ( = ?auto_703120 ?auto_703128 ) ) ( not ( = ?auto_703121 ?auto_703122 ) ) ( not ( = ?auto_703121 ?auto_703123 ) ) ( not ( = ?auto_703121 ?auto_703124 ) ) ( not ( = ?auto_703121 ?auto_703125 ) ) ( not ( = ?auto_703121 ?auto_703126 ) ) ( not ( = ?auto_703121 ?auto_703127 ) ) ( not ( = ?auto_703121 ?auto_703128 ) ) ( not ( = ?auto_703122 ?auto_703123 ) ) ( not ( = ?auto_703122 ?auto_703124 ) ) ( not ( = ?auto_703122 ?auto_703125 ) ) ( not ( = ?auto_703122 ?auto_703126 ) ) ( not ( = ?auto_703122 ?auto_703127 ) ) ( not ( = ?auto_703122 ?auto_703128 ) ) ( not ( = ?auto_703123 ?auto_703124 ) ) ( not ( = ?auto_703123 ?auto_703125 ) ) ( not ( = ?auto_703123 ?auto_703126 ) ) ( not ( = ?auto_703123 ?auto_703127 ) ) ( not ( = ?auto_703123 ?auto_703128 ) ) ( not ( = ?auto_703124 ?auto_703125 ) ) ( not ( = ?auto_703124 ?auto_703126 ) ) ( not ( = ?auto_703124 ?auto_703127 ) ) ( not ( = ?auto_703124 ?auto_703128 ) ) ( not ( = ?auto_703125 ?auto_703126 ) ) ( not ( = ?auto_703125 ?auto_703127 ) ) ( not ( = ?auto_703125 ?auto_703128 ) ) ( not ( = ?auto_703126 ?auto_703127 ) ) ( not ( = ?auto_703126 ?auto_703128 ) ) ( not ( = ?auto_703127 ?auto_703128 ) ) ( ON ?auto_703126 ?auto_703127 ) ( ON ?auto_703125 ?auto_703126 ) ( ON ?auto_703124 ?auto_703125 ) ( CLEAR ?auto_703122 ) ( ON ?auto_703123 ?auto_703124 ) ( CLEAR ?auto_703123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_703120 ?auto_703121 ?auto_703122 ?auto_703123 )
      ( MAKE-8PILE ?auto_703120 ?auto_703121 ?auto_703122 ?auto_703123 ?auto_703124 ?auto_703125 ?auto_703126 ?auto_703127 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703154 - BLOCK
      ?auto_703155 - BLOCK
      ?auto_703156 - BLOCK
      ?auto_703157 - BLOCK
      ?auto_703158 - BLOCK
      ?auto_703159 - BLOCK
      ?auto_703160 - BLOCK
      ?auto_703161 - BLOCK
    )
    :vars
    (
      ?auto_703162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703161 ?auto_703162 ) ( ON-TABLE ?auto_703154 ) ( ON ?auto_703155 ?auto_703154 ) ( not ( = ?auto_703154 ?auto_703155 ) ) ( not ( = ?auto_703154 ?auto_703156 ) ) ( not ( = ?auto_703154 ?auto_703157 ) ) ( not ( = ?auto_703154 ?auto_703158 ) ) ( not ( = ?auto_703154 ?auto_703159 ) ) ( not ( = ?auto_703154 ?auto_703160 ) ) ( not ( = ?auto_703154 ?auto_703161 ) ) ( not ( = ?auto_703154 ?auto_703162 ) ) ( not ( = ?auto_703155 ?auto_703156 ) ) ( not ( = ?auto_703155 ?auto_703157 ) ) ( not ( = ?auto_703155 ?auto_703158 ) ) ( not ( = ?auto_703155 ?auto_703159 ) ) ( not ( = ?auto_703155 ?auto_703160 ) ) ( not ( = ?auto_703155 ?auto_703161 ) ) ( not ( = ?auto_703155 ?auto_703162 ) ) ( not ( = ?auto_703156 ?auto_703157 ) ) ( not ( = ?auto_703156 ?auto_703158 ) ) ( not ( = ?auto_703156 ?auto_703159 ) ) ( not ( = ?auto_703156 ?auto_703160 ) ) ( not ( = ?auto_703156 ?auto_703161 ) ) ( not ( = ?auto_703156 ?auto_703162 ) ) ( not ( = ?auto_703157 ?auto_703158 ) ) ( not ( = ?auto_703157 ?auto_703159 ) ) ( not ( = ?auto_703157 ?auto_703160 ) ) ( not ( = ?auto_703157 ?auto_703161 ) ) ( not ( = ?auto_703157 ?auto_703162 ) ) ( not ( = ?auto_703158 ?auto_703159 ) ) ( not ( = ?auto_703158 ?auto_703160 ) ) ( not ( = ?auto_703158 ?auto_703161 ) ) ( not ( = ?auto_703158 ?auto_703162 ) ) ( not ( = ?auto_703159 ?auto_703160 ) ) ( not ( = ?auto_703159 ?auto_703161 ) ) ( not ( = ?auto_703159 ?auto_703162 ) ) ( not ( = ?auto_703160 ?auto_703161 ) ) ( not ( = ?auto_703160 ?auto_703162 ) ) ( not ( = ?auto_703161 ?auto_703162 ) ) ( ON ?auto_703160 ?auto_703161 ) ( ON ?auto_703159 ?auto_703160 ) ( ON ?auto_703158 ?auto_703159 ) ( ON ?auto_703157 ?auto_703158 ) ( CLEAR ?auto_703155 ) ( ON ?auto_703156 ?auto_703157 ) ( CLEAR ?auto_703156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_703154 ?auto_703155 ?auto_703156 )
      ( MAKE-8PILE ?auto_703154 ?auto_703155 ?auto_703156 ?auto_703157 ?auto_703158 ?auto_703159 ?auto_703160 ?auto_703161 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703188 - BLOCK
      ?auto_703189 - BLOCK
      ?auto_703190 - BLOCK
      ?auto_703191 - BLOCK
      ?auto_703192 - BLOCK
      ?auto_703193 - BLOCK
      ?auto_703194 - BLOCK
      ?auto_703195 - BLOCK
    )
    :vars
    (
      ?auto_703196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703195 ?auto_703196 ) ( ON-TABLE ?auto_703188 ) ( not ( = ?auto_703188 ?auto_703189 ) ) ( not ( = ?auto_703188 ?auto_703190 ) ) ( not ( = ?auto_703188 ?auto_703191 ) ) ( not ( = ?auto_703188 ?auto_703192 ) ) ( not ( = ?auto_703188 ?auto_703193 ) ) ( not ( = ?auto_703188 ?auto_703194 ) ) ( not ( = ?auto_703188 ?auto_703195 ) ) ( not ( = ?auto_703188 ?auto_703196 ) ) ( not ( = ?auto_703189 ?auto_703190 ) ) ( not ( = ?auto_703189 ?auto_703191 ) ) ( not ( = ?auto_703189 ?auto_703192 ) ) ( not ( = ?auto_703189 ?auto_703193 ) ) ( not ( = ?auto_703189 ?auto_703194 ) ) ( not ( = ?auto_703189 ?auto_703195 ) ) ( not ( = ?auto_703189 ?auto_703196 ) ) ( not ( = ?auto_703190 ?auto_703191 ) ) ( not ( = ?auto_703190 ?auto_703192 ) ) ( not ( = ?auto_703190 ?auto_703193 ) ) ( not ( = ?auto_703190 ?auto_703194 ) ) ( not ( = ?auto_703190 ?auto_703195 ) ) ( not ( = ?auto_703190 ?auto_703196 ) ) ( not ( = ?auto_703191 ?auto_703192 ) ) ( not ( = ?auto_703191 ?auto_703193 ) ) ( not ( = ?auto_703191 ?auto_703194 ) ) ( not ( = ?auto_703191 ?auto_703195 ) ) ( not ( = ?auto_703191 ?auto_703196 ) ) ( not ( = ?auto_703192 ?auto_703193 ) ) ( not ( = ?auto_703192 ?auto_703194 ) ) ( not ( = ?auto_703192 ?auto_703195 ) ) ( not ( = ?auto_703192 ?auto_703196 ) ) ( not ( = ?auto_703193 ?auto_703194 ) ) ( not ( = ?auto_703193 ?auto_703195 ) ) ( not ( = ?auto_703193 ?auto_703196 ) ) ( not ( = ?auto_703194 ?auto_703195 ) ) ( not ( = ?auto_703194 ?auto_703196 ) ) ( not ( = ?auto_703195 ?auto_703196 ) ) ( ON ?auto_703194 ?auto_703195 ) ( ON ?auto_703193 ?auto_703194 ) ( ON ?auto_703192 ?auto_703193 ) ( ON ?auto_703191 ?auto_703192 ) ( ON ?auto_703190 ?auto_703191 ) ( CLEAR ?auto_703188 ) ( ON ?auto_703189 ?auto_703190 ) ( CLEAR ?auto_703189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_703188 ?auto_703189 )
      ( MAKE-8PILE ?auto_703188 ?auto_703189 ?auto_703190 ?auto_703191 ?auto_703192 ?auto_703193 ?auto_703194 ?auto_703195 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_703222 - BLOCK
      ?auto_703223 - BLOCK
      ?auto_703224 - BLOCK
      ?auto_703225 - BLOCK
      ?auto_703226 - BLOCK
      ?auto_703227 - BLOCK
      ?auto_703228 - BLOCK
      ?auto_703229 - BLOCK
    )
    :vars
    (
      ?auto_703230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703229 ?auto_703230 ) ( not ( = ?auto_703222 ?auto_703223 ) ) ( not ( = ?auto_703222 ?auto_703224 ) ) ( not ( = ?auto_703222 ?auto_703225 ) ) ( not ( = ?auto_703222 ?auto_703226 ) ) ( not ( = ?auto_703222 ?auto_703227 ) ) ( not ( = ?auto_703222 ?auto_703228 ) ) ( not ( = ?auto_703222 ?auto_703229 ) ) ( not ( = ?auto_703222 ?auto_703230 ) ) ( not ( = ?auto_703223 ?auto_703224 ) ) ( not ( = ?auto_703223 ?auto_703225 ) ) ( not ( = ?auto_703223 ?auto_703226 ) ) ( not ( = ?auto_703223 ?auto_703227 ) ) ( not ( = ?auto_703223 ?auto_703228 ) ) ( not ( = ?auto_703223 ?auto_703229 ) ) ( not ( = ?auto_703223 ?auto_703230 ) ) ( not ( = ?auto_703224 ?auto_703225 ) ) ( not ( = ?auto_703224 ?auto_703226 ) ) ( not ( = ?auto_703224 ?auto_703227 ) ) ( not ( = ?auto_703224 ?auto_703228 ) ) ( not ( = ?auto_703224 ?auto_703229 ) ) ( not ( = ?auto_703224 ?auto_703230 ) ) ( not ( = ?auto_703225 ?auto_703226 ) ) ( not ( = ?auto_703225 ?auto_703227 ) ) ( not ( = ?auto_703225 ?auto_703228 ) ) ( not ( = ?auto_703225 ?auto_703229 ) ) ( not ( = ?auto_703225 ?auto_703230 ) ) ( not ( = ?auto_703226 ?auto_703227 ) ) ( not ( = ?auto_703226 ?auto_703228 ) ) ( not ( = ?auto_703226 ?auto_703229 ) ) ( not ( = ?auto_703226 ?auto_703230 ) ) ( not ( = ?auto_703227 ?auto_703228 ) ) ( not ( = ?auto_703227 ?auto_703229 ) ) ( not ( = ?auto_703227 ?auto_703230 ) ) ( not ( = ?auto_703228 ?auto_703229 ) ) ( not ( = ?auto_703228 ?auto_703230 ) ) ( not ( = ?auto_703229 ?auto_703230 ) ) ( ON ?auto_703228 ?auto_703229 ) ( ON ?auto_703227 ?auto_703228 ) ( ON ?auto_703226 ?auto_703227 ) ( ON ?auto_703225 ?auto_703226 ) ( ON ?auto_703224 ?auto_703225 ) ( ON ?auto_703223 ?auto_703224 ) ( ON ?auto_703222 ?auto_703223 ) ( CLEAR ?auto_703222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_703222 )
      ( MAKE-8PILE ?auto_703222 ?auto_703223 ?auto_703224 ?auto_703225 ?auto_703226 ?auto_703227 ?auto_703228 ?auto_703229 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703257 - BLOCK
      ?auto_703258 - BLOCK
      ?auto_703259 - BLOCK
      ?auto_703260 - BLOCK
      ?auto_703261 - BLOCK
      ?auto_703262 - BLOCK
      ?auto_703263 - BLOCK
      ?auto_703264 - BLOCK
      ?auto_703265 - BLOCK
    )
    :vars
    (
      ?auto_703266 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_703264 ) ( ON ?auto_703265 ?auto_703266 ) ( CLEAR ?auto_703265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_703257 ) ( ON ?auto_703258 ?auto_703257 ) ( ON ?auto_703259 ?auto_703258 ) ( ON ?auto_703260 ?auto_703259 ) ( ON ?auto_703261 ?auto_703260 ) ( ON ?auto_703262 ?auto_703261 ) ( ON ?auto_703263 ?auto_703262 ) ( ON ?auto_703264 ?auto_703263 ) ( not ( = ?auto_703257 ?auto_703258 ) ) ( not ( = ?auto_703257 ?auto_703259 ) ) ( not ( = ?auto_703257 ?auto_703260 ) ) ( not ( = ?auto_703257 ?auto_703261 ) ) ( not ( = ?auto_703257 ?auto_703262 ) ) ( not ( = ?auto_703257 ?auto_703263 ) ) ( not ( = ?auto_703257 ?auto_703264 ) ) ( not ( = ?auto_703257 ?auto_703265 ) ) ( not ( = ?auto_703257 ?auto_703266 ) ) ( not ( = ?auto_703258 ?auto_703259 ) ) ( not ( = ?auto_703258 ?auto_703260 ) ) ( not ( = ?auto_703258 ?auto_703261 ) ) ( not ( = ?auto_703258 ?auto_703262 ) ) ( not ( = ?auto_703258 ?auto_703263 ) ) ( not ( = ?auto_703258 ?auto_703264 ) ) ( not ( = ?auto_703258 ?auto_703265 ) ) ( not ( = ?auto_703258 ?auto_703266 ) ) ( not ( = ?auto_703259 ?auto_703260 ) ) ( not ( = ?auto_703259 ?auto_703261 ) ) ( not ( = ?auto_703259 ?auto_703262 ) ) ( not ( = ?auto_703259 ?auto_703263 ) ) ( not ( = ?auto_703259 ?auto_703264 ) ) ( not ( = ?auto_703259 ?auto_703265 ) ) ( not ( = ?auto_703259 ?auto_703266 ) ) ( not ( = ?auto_703260 ?auto_703261 ) ) ( not ( = ?auto_703260 ?auto_703262 ) ) ( not ( = ?auto_703260 ?auto_703263 ) ) ( not ( = ?auto_703260 ?auto_703264 ) ) ( not ( = ?auto_703260 ?auto_703265 ) ) ( not ( = ?auto_703260 ?auto_703266 ) ) ( not ( = ?auto_703261 ?auto_703262 ) ) ( not ( = ?auto_703261 ?auto_703263 ) ) ( not ( = ?auto_703261 ?auto_703264 ) ) ( not ( = ?auto_703261 ?auto_703265 ) ) ( not ( = ?auto_703261 ?auto_703266 ) ) ( not ( = ?auto_703262 ?auto_703263 ) ) ( not ( = ?auto_703262 ?auto_703264 ) ) ( not ( = ?auto_703262 ?auto_703265 ) ) ( not ( = ?auto_703262 ?auto_703266 ) ) ( not ( = ?auto_703263 ?auto_703264 ) ) ( not ( = ?auto_703263 ?auto_703265 ) ) ( not ( = ?auto_703263 ?auto_703266 ) ) ( not ( = ?auto_703264 ?auto_703265 ) ) ( not ( = ?auto_703264 ?auto_703266 ) ) ( not ( = ?auto_703265 ?auto_703266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_703265 ?auto_703266 )
      ( !STACK ?auto_703265 ?auto_703264 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703295 - BLOCK
      ?auto_703296 - BLOCK
      ?auto_703297 - BLOCK
      ?auto_703298 - BLOCK
      ?auto_703299 - BLOCK
      ?auto_703300 - BLOCK
      ?auto_703301 - BLOCK
      ?auto_703302 - BLOCK
      ?auto_703303 - BLOCK
    )
    :vars
    (
      ?auto_703304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703303 ?auto_703304 ) ( ON-TABLE ?auto_703295 ) ( ON ?auto_703296 ?auto_703295 ) ( ON ?auto_703297 ?auto_703296 ) ( ON ?auto_703298 ?auto_703297 ) ( ON ?auto_703299 ?auto_703298 ) ( ON ?auto_703300 ?auto_703299 ) ( ON ?auto_703301 ?auto_703300 ) ( not ( = ?auto_703295 ?auto_703296 ) ) ( not ( = ?auto_703295 ?auto_703297 ) ) ( not ( = ?auto_703295 ?auto_703298 ) ) ( not ( = ?auto_703295 ?auto_703299 ) ) ( not ( = ?auto_703295 ?auto_703300 ) ) ( not ( = ?auto_703295 ?auto_703301 ) ) ( not ( = ?auto_703295 ?auto_703302 ) ) ( not ( = ?auto_703295 ?auto_703303 ) ) ( not ( = ?auto_703295 ?auto_703304 ) ) ( not ( = ?auto_703296 ?auto_703297 ) ) ( not ( = ?auto_703296 ?auto_703298 ) ) ( not ( = ?auto_703296 ?auto_703299 ) ) ( not ( = ?auto_703296 ?auto_703300 ) ) ( not ( = ?auto_703296 ?auto_703301 ) ) ( not ( = ?auto_703296 ?auto_703302 ) ) ( not ( = ?auto_703296 ?auto_703303 ) ) ( not ( = ?auto_703296 ?auto_703304 ) ) ( not ( = ?auto_703297 ?auto_703298 ) ) ( not ( = ?auto_703297 ?auto_703299 ) ) ( not ( = ?auto_703297 ?auto_703300 ) ) ( not ( = ?auto_703297 ?auto_703301 ) ) ( not ( = ?auto_703297 ?auto_703302 ) ) ( not ( = ?auto_703297 ?auto_703303 ) ) ( not ( = ?auto_703297 ?auto_703304 ) ) ( not ( = ?auto_703298 ?auto_703299 ) ) ( not ( = ?auto_703298 ?auto_703300 ) ) ( not ( = ?auto_703298 ?auto_703301 ) ) ( not ( = ?auto_703298 ?auto_703302 ) ) ( not ( = ?auto_703298 ?auto_703303 ) ) ( not ( = ?auto_703298 ?auto_703304 ) ) ( not ( = ?auto_703299 ?auto_703300 ) ) ( not ( = ?auto_703299 ?auto_703301 ) ) ( not ( = ?auto_703299 ?auto_703302 ) ) ( not ( = ?auto_703299 ?auto_703303 ) ) ( not ( = ?auto_703299 ?auto_703304 ) ) ( not ( = ?auto_703300 ?auto_703301 ) ) ( not ( = ?auto_703300 ?auto_703302 ) ) ( not ( = ?auto_703300 ?auto_703303 ) ) ( not ( = ?auto_703300 ?auto_703304 ) ) ( not ( = ?auto_703301 ?auto_703302 ) ) ( not ( = ?auto_703301 ?auto_703303 ) ) ( not ( = ?auto_703301 ?auto_703304 ) ) ( not ( = ?auto_703302 ?auto_703303 ) ) ( not ( = ?auto_703302 ?auto_703304 ) ) ( not ( = ?auto_703303 ?auto_703304 ) ) ( CLEAR ?auto_703301 ) ( ON ?auto_703302 ?auto_703303 ) ( CLEAR ?auto_703302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_703295 ?auto_703296 ?auto_703297 ?auto_703298 ?auto_703299 ?auto_703300 ?auto_703301 ?auto_703302 )
      ( MAKE-9PILE ?auto_703295 ?auto_703296 ?auto_703297 ?auto_703298 ?auto_703299 ?auto_703300 ?auto_703301 ?auto_703302 ?auto_703303 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703333 - BLOCK
      ?auto_703334 - BLOCK
      ?auto_703335 - BLOCK
      ?auto_703336 - BLOCK
      ?auto_703337 - BLOCK
      ?auto_703338 - BLOCK
      ?auto_703339 - BLOCK
      ?auto_703340 - BLOCK
      ?auto_703341 - BLOCK
    )
    :vars
    (
      ?auto_703342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703341 ?auto_703342 ) ( ON-TABLE ?auto_703333 ) ( ON ?auto_703334 ?auto_703333 ) ( ON ?auto_703335 ?auto_703334 ) ( ON ?auto_703336 ?auto_703335 ) ( ON ?auto_703337 ?auto_703336 ) ( ON ?auto_703338 ?auto_703337 ) ( not ( = ?auto_703333 ?auto_703334 ) ) ( not ( = ?auto_703333 ?auto_703335 ) ) ( not ( = ?auto_703333 ?auto_703336 ) ) ( not ( = ?auto_703333 ?auto_703337 ) ) ( not ( = ?auto_703333 ?auto_703338 ) ) ( not ( = ?auto_703333 ?auto_703339 ) ) ( not ( = ?auto_703333 ?auto_703340 ) ) ( not ( = ?auto_703333 ?auto_703341 ) ) ( not ( = ?auto_703333 ?auto_703342 ) ) ( not ( = ?auto_703334 ?auto_703335 ) ) ( not ( = ?auto_703334 ?auto_703336 ) ) ( not ( = ?auto_703334 ?auto_703337 ) ) ( not ( = ?auto_703334 ?auto_703338 ) ) ( not ( = ?auto_703334 ?auto_703339 ) ) ( not ( = ?auto_703334 ?auto_703340 ) ) ( not ( = ?auto_703334 ?auto_703341 ) ) ( not ( = ?auto_703334 ?auto_703342 ) ) ( not ( = ?auto_703335 ?auto_703336 ) ) ( not ( = ?auto_703335 ?auto_703337 ) ) ( not ( = ?auto_703335 ?auto_703338 ) ) ( not ( = ?auto_703335 ?auto_703339 ) ) ( not ( = ?auto_703335 ?auto_703340 ) ) ( not ( = ?auto_703335 ?auto_703341 ) ) ( not ( = ?auto_703335 ?auto_703342 ) ) ( not ( = ?auto_703336 ?auto_703337 ) ) ( not ( = ?auto_703336 ?auto_703338 ) ) ( not ( = ?auto_703336 ?auto_703339 ) ) ( not ( = ?auto_703336 ?auto_703340 ) ) ( not ( = ?auto_703336 ?auto_703341 ) ) ( not ( = ?auto_703336 ?auto_703342 ) ) ( not ( = ?auto_703337 ?auto_703338 ) ) ( not ( = ?auto_703337 ?auto_703339 ) ) ( not ( = ?auto_703337 ?auto_703340 ) ) ( not ( = ?auto_703337 ?auto_703341 ) ) ( not ( = ?auto_703337 ?auto_703342 ) ) ( not ( = ?auto_703338 ?auto_703339 ) ) ( not ( = ?auto_703338 ?auto_703340 ) ) ( not ( = ?auto_703338 ?auto_703341 ) ) ( not ( = ?auto_703338 ?auto_703342 ) ) ( not ( = ?auto_703339 ?auto_703340 ) ) ( not ( = ?auto_703339 ?auto_703341 ) ) ( not ( = ?auto_703339 ?auto_703342 ) ) ( not ( = ?auto_703340 ?auto_703341 ) ) ( not ( = ?auto_703340 ?auto_703342 ) ) ( not ( = ?auto_703341 ?auto_703342 ) ) ( ON ?auto_703340 ?auto_703341 ) ( CLEAR ?auto_703338 ) ( ON ?auto_703339 ?auto_703340 ) ( CLEAR ?auto_703339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_703333 ?auto_703334 ?auto_703335 ?auto_703336 ?auto_703337 ?auto_703338 ?auto_703339 )
      ( MAKE-9PILE ?auto_703333 ?auto_703334 ?auto_703335 ?auto_703336 ?auto_703337 ?auto_703338 ?auto_703339 ?auto_703340 ?auto_703341 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703371 - BLOCK
      ?auto_703372 - BLOCK
      ?auto_703373 - BLOCK
      ?auto_703374 - BLOCK
      ?auto_703375 - BLOCK
      ?auto_703376 - BLOCK
      ?auto_703377 - BLOCK
      ?auto_703378 - BLOCK
      ?auto_703379 - BLOCK
    )
    :vars
    (
      ?auto_703380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703379 ?auto_703380 ) ( ON-TABLE ?auto_703371 ) ( ON ?auto_703372 ?auto_703371 ) ( ON ?auto_703373 ?auto_703372 ) ( ON ?auto_703374 ?auto_703373 ) ( ON ?auto_703375 ?auto_703374 ) ( not ( = ?auto_703371 ?auto_703372 ) ) ( not ( = ?auto_703371 ?auto_703373 ) ) ( not ( = ?auto_703371 ?auto_703374 ) ) ( not ( = ?auto_703371 ?auto_703375 ) ) ( not ( = ?auto_703371 ?auto_703376 ) ) ( not ( = ?auto_703371 ?auto_703377 ) ) ( not ( = ?auto_703371 ?auto_703378 ) ) ( not ( = ?auto_703371 ?auto_703379 ) ) ( not ( = ?auto_703371 ?auto_703380 ) ) ( not ( = ?auto_703372 ?auto_703373 ) ) ( not ( = ?auto_703372 ?auto_703374 ) ) ( not ( = ?auto_703372 ?auto_703375 ) ) ( not ( = ?auto_703372 ?auto_703376 ) ) ( not ( = ?auto_703372 ?auto_703377 ) ) ( not ( = ?auto_703372 ?auto_703378 ) ) ( not ( = ?auto_703372 ?auto_703379 ) ) ( not ( = ?auto_703372 ?auto_703380 ) ) ( not ( = ?auto_703373 ?auto_703374 ) ) ( not ( = ?auto_703373 ?auto_703375 ) ) ( not ( = ?auto_703373 ?auto_703376 ) ) ( not ( = ?auto_703373 ?auto_703377 ) ) ( not ( = ?auto_703373 ?auto_703378 ) ) ( not ( = ?auto_703373 ?auto_703379 ) ) ( not ( = ?auto_703373 ?auto_703380 ) ) ( not ( = ?auto_703374 ?auto_703375 ) ) ( not ( = ?auto_703374 ?auto_703376 ) ) ( not ( = ?auto_703374 ?auto_703377 ) ) ( not ( = ?auto_703374 ?auto_703378 ) ) ( not ( = ?auto_703374 ?auto_703379 ) ) ( not ( = ?auto_703374 ?auto_703380 ) ) ( not ( = ?auto_703375 ?auto_703376 ) ) ( not ( = ?auto_703375 ?auto_703377 ) ) ( not ( = ?auto_703375 ?auto_703378 ) ) ( not ( = ?auto_703375 ?auto_703379 ) ) ( not ( = ?auto_703375 ?auto_703380 ) ) ( not ( = ?auto_703376 ?auto_703377 ) ) ( not ( = ?auto_703376 ?auto_703378 ) ) ( not ( = ?auto_703376 ?auto_703379 ) ) ( not ( = ?auto_703376 ?auto_703380 ) ) ( not ( = ?auto_703377 ?auto_703378 ) ) ( not ( = ?auto_703377 ?auto_703379 ) ) ( not ( = ?auto_703377 ?auto_703380 ) ) ( not ( = ?auto_703378 ?auto_703379 ) ) ( not ( = ?auto_703378 ?auto_703380 ) ) ( not ( = ?auto_703379 ?auto_703380 ) ) ( ON ?auto_703378 ?auto_703379 ) ( ON ?auto_703377 ?auto_703378 ) ( CLEAR ?auto_703375 ) ( ON ?auto_703376 ?auto_703377 ) ( CLEAR ?auto_703376 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_703371 ?auto_703372 ?auto_703373 ?auto_703374 ?auto_703375 ?auto_703376 )
      ( MAKE-9PILE ?auto_703371 ?auto_703372 ?auto_703373 ?auto_703374 ?auto_703375 ?auto_703376 ?auto_703377 ?auto_703378 ?auto_703379 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703409 - BLOCK
      ?auto_703410 - BLOCK
      ?auto_703411 - BLOCK
      ?auto_703412 - BLOCK
      ?auto_703413 - BLOCK
      ?auto_703414 - BLOCK
      ?auto_703415 - BLOCK
      ?auto_703416 - BLOCK
      ?auto_703417 - BLOCK
    )
    :vars
    (
      ?auto_703418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703417 ?auto_703418 ) ( ON-TABLE ?auto_703409 ) ( ON ?auto_703410 ?auto_703409 ) ( ON ?auto_703411 ?auto_703410 ) ( ON ?auto_703412 ?auto_703411 ) ( not ( = ?auto_703409 ?auto_703410 ) ) ( not ( = ?auto_703409 ?auto_703411 ) ) ( not ( = ?auto_703409 ?auto_703412 ) ) ( not ( = ?auto_703409 ?auto_703413 ) ) ( not ( = ?auto_703409 ?auto_703414 ) ) ( not ( = ?auto_703409 ?auto_703415 ) ) ( not ( = ?auto_703409 ?auto_703416 ) ) ( not ( = ?auto_703409 ?auto_703417 ) ) ( not ( = ?auto_703409 ?auto_703418 ) ) ( not ( = ?auto_703410 ?auto_703411 ) ) ( not ( = ?auto_703410 ?auto_703412 ) ) ( not ( = ?auto_703410 ?auto_703413 ) ) ( not ( = ?auto_703410 ?auto_703414 ) ) ( not ( = ?auto_703410 ?auto_703415 ) ) ( not ( = ?auto_703410 ?auto_703416 ) ) ( not ( = ?auto_703410 ?auto_703417 ) ) ( not ( = ?auto_703410 ?auto_703418 ) ) ( not ( = ?auto_703411 ?auto_703412 ) ) ( not ( = ?auto_703411 ?auto_703413 ) ) ( not ( = ?auto_703411 ?auto_703414 ) ) ( not ( = ?auto_703411 ?auto_703415 ) ) ( not ( = ?auto_703411 ?auto_703416 ) ) ( not ( = ?auto_703411 ?auto_703417 ) ) ( not ( = ?auto_703411 ?auto_703418 ) ) ( not ( = ?auto_703412 ?auto_703413 ) ) ( not ( = ?auto_703412 ?auto_703414 ) ) ( not ( = ?auto_703412 ?auto_703415 ) ) ( not ( = ?auto_703412 ?auto_703416 ) ) ( not ( = ?auto_703412 ?auto_703417 ) ) ( not ( = ?auto_703412 ?auto_703418 ) ) ( not ( = ?auto_703413 ?auto_703414 ) ) ( not ( = ?auto_703413 ?auto_703415 ) ) ( not ( = ?auto_703413 ?auto_703416 ) ) ( not ( = ?auto_703413 ?auto_703417 ) ) ( not ( = ?auto_703413 ?auto_703418 ) ) ( not ( = ?auto_703414 ?auto_703415 ) ) ( not ( = ?auto_703414 ?auto_703416 ) ) ( not ( = ?auto_703414 ?auto_703417 ) ) ( not ( = ?auto_703414 ?auto_703418 ) ) ( not ( = ?auto_703415 ?auto_703416 ) ) ( not ( = ?auto_703415 ?auto_703417 ) ) ( not ( = ?auto_703415 ?auto_703418 ) ) ( not ( = ?auto_703416 ?auto_703417 ) ) ( not ( = ?auto_703416 ?auto_703418 ) ) ( not ( = ?auto_703417 ?auto_703418 ) ) ( ON ?auto_703416 ?auto_703417 ) ( ON ?auto_703415 ?auto_703416 ) ( ON ?auto_703414 ?auto_703415 ) ( CLEAR ?auto_703412 ) ( ON ?auto_703413 ?auto_703414 ) ( CLEAR ?auto_703413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_703409 ?auto_703410 ?auto_703411 ?auto_703412 ?auto_703413 )
      ( MAKE-9PILE ?auto_703409 ?auto_703410 ?auto_703411 ?auto_703412 ?auto_703413 ?auto_703414 ?auto_703415 ?auto_703416 ?auto_703417 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703447 - BLOCK
      ?auto_703448 - BLOCK
      ?auto_703449 - BLOCK
      ?auto_703450 - BLOCK
      ?auto_703451 - BLOCK
      ?auto_703452 - BLOCK
      ?auto_703453 - BLOCK
      ?auto_703454 - BLOCK
      ?auto_703455 - BLOCK
    )
    :vars
    (
      ?auto_703456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703455 ?auto_703456 ) ( ON-TABLE ?auto_703447 ) ( ON ?auto_703448 ?auto_703447 ) ( ON ?auto_703449 ?auto_703448 ) ( not ( = ?auto_703447 ?auto_703448 ) ) ( not ( = ?auto_703447 ?auto_703449 ) ) ( not ( = ?auto_703447 ?auto_703450 ) ) ( not ( = ?auto_703447 ?auto_703451 ) ) ( not ( = ?auto_703447 ?auto_703452 ) ) ( not ( = ?auto_703447 ?auto_703453 ) ) ( not ( = ?auto_703447 ?auto_703454 ) ) ( not ( = ?auto_703447 ?auto_703455 ) ) ( not ( = ?auto_703447 ?auto_703456 ) ) ( not ( = ?auto_703448 ?auto_703449 ) ) ( not ( = ?auto_703448 ?auto_703450 ) ) ( not ( = ?auto_703448 ?auto_703451 ) ) ( not ( = ?auto_703448 ?auto_703452 ) ) ( not ( = ?auto_703448 ?auto_703453 ) ) ( not ( = ?auto_703448 ?auto_703454 ) ) ( not ( = ?auto_703448 ?auto_703455 ) ) ( not ( = ?auto_703448 ?auto_703456 ) ) ( not ( = ?auto_703449 ?auto_703450 ) ) ( not ( = ?auto_703449 ?auto_703451 ) ) ( not ( = ?auto_703449 ?auto_703452 ) ) ( not ( = ?auto_703449 ?auto_703453 ) ) ( not ( = ?auto_703449 ?auto_703454 ) ) ( not ( = ?auto_703449 ?auto_703455 ) ) ( not ( = ?auto_703449 ?auto_703456 ) ) ( not ( = ?auto_703450 ?auto_703451 ) ) ( not ( = ?auto_703450 ?auto_703452 ) ) ( not ( = ?auto_703450 ?auto_703453 ) ) ( not ( = ?auto_703450 ?auto_703454 ) ) ( not ( = ?auto_703450 ?auto_703455 ) ) ( not ( = ?auto_703450 ?auto_703456 ) ) ( not ( = ?auto_703451 ?auto_703452 ) ) ( not ( = ?auto_703451 ?auto_703453 ) ) ( not ( = ?auto_703451 ?auto_703454 ) ) ( not ( = ?auto_703451 ?auto_703455 ) ) ( not ( = ?auto_703451 ?auto_703456 ) ) ( not ( = ?auto_703452 ?auto_703453 ) ) ( not ( = ?auto_703452 ?auto_703454 ) ) ( not ( = ?auto_703452 ?auto_703455 ) ) ( not ( = ?auto_703452 ?auto_703456 ) ) ( not ( = ?auto_703453 ?auto_703454 ) ) ( not ( = ?auto_703453 ?auto_703455 ) ) ( not ( = ?auto_703453 ?auto_703456 ) ) ( not ( = ?auto_703454 ?auto_703455 ) ) ( not ( = ?auto_703454 ?auto_703456 ) ) ( not ( = ?auto_703455 ?auto_703456 ) ) ( ON ?auto_703454 ?auto_703455 ) ( ON ?auto_703453 ?auto_703454 ) ( ON ?auto_703452 ?auto_703453 ) ( ON ?auto_703451 ?auto_703452 ) ( CLEAR ?auto_703449 ) ( ON ?auto_703450 ?auto_703451 ) ( CLEAR ?auto_703450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_703447 ?auto_703448 ?auto_703449 ?auto_703450 )
      ( MAKE-9PILE ?auto_703447 ?auto_703448 ?auto_703449 ?auto_703450 ?auto_703451 ?auto_703452 ?auto_703453 ?auto_703454 ?auto_703455 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703485 - BLOCK
      ?auto_703486 - BLOCK
      ?auto_703487 - BLOCK
      ?auto_703488 - BLOCK
      ?auto_703489 - BLOCK
      ?auto_703490 - BLOCK
      ?auto_703491 - BLOCK
      ?auto_703492 - BLOCK
      ?auto_703493 - BLOCK
    )
    :vars
    (
      ?auto_703494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703493 ?auto_703494 ) ( ON-TABLE ?auto_703485 ) ( ON ?auto_703486 ?auto_703485 ) ( not ( = ?auto_703485 ?auto_703486 ) ) ( not ( = ?auto_703485 ?auto_703487 ) ) ( not ( = ?auto_703485 ?auto_703488 ) ) ( not ( = ?auto_703485 ?auto_703489 ) ) ( not ( = ?auto_703485 ?auto_703490 ) ) ( not ( = ?auto_703485 ?auto_703491 ) ) ( not ( = ?auto_703485 ?auto_703492 ) ) ( not ( = ?auto_703485 ?auto_703493 ) ) ( not ( = ?auto_703485 ?auto_703494 ) ) ( not ( = ?auto_703486 ?auto_703487 ) ) ( not ( = ?auto_703486 ?auto_703488 ) ) ( not ( = ?auto_703486 ?auto_703489 ) ) ( not ( = ?auto_703486 ?auto_703490 ) ) ( not ( = ?auto_703486 ?auto_703491 ) ) ( not ( = ?auto_703486 ?auto_703492 ) ) ( not ( = ?auto_703486 ?auto_703493 ) ) ( not ( = ?auto_703486 ?auto_703494 ) ) ( not ( = ?auto_703487 ?auto_703488 ) ) ( not ( = ?auto_703487 ?auto_703489 ) ) ( not ( = ?auto_703487 ?auto_703490 ) ) ( not ( = ?auto_703487 ?auto_703491 ) ) ( not ( = ?auto_703487 ?auto_703492 ) ) ( not ( = ?auto_703487 ?auto_703493 ) ) ( not ( = ?auto_703487 ?auto_703494 ) ) ( not ( = ?auto_703488 ?auto_703489 ) ) ( not ( = ?auto_703488 ?auto_703490 ) ) ( not ( = ?auto_703488 ?auto_703491 ) ) ( not ( = ?auto_703488 ?auto_703492 ) ) ( not ( = ?auto_703488 ?auto_703493 ) ) ( not ( = ?auto_703488 ?auto_703494 ) ) ( not ( = ?auto_703489 ?auto_703490 ) ) ( not ( = ?auto_703489 ?auto_703491 ) ) ( not ( = ?auto_703489 ?auto_703492 ) ) ( not ( = ?auto_703489 ?auto_703493 ) ) ( not ( = ?auto_703489 ?auto_703494 ) ) ( not ( = ?auto_703490 ?auto_703491 ) ) ( not ( = ?auto_703490 ?auto_703492 ) ) ( not ( = ?auto_703490 ?auto_703493 ) ) ( not ( = ?auto_703490 ?auto_703494 ) ) ( not ( = ?auto_703491 ?auto_703492 ) ) ( not ( = ?auto_703491 ?auto_703493 ) ) ( not ( = ?auto_703491 ?auto_703494 ) ) ( not ( = ?auto_703492 ?auto_703493 ) ) ( not ( = ?auto_703492 ?auto_703494 ) ) ( not ( = ?auto_703493 ?auto_703494 ) ) ( ON ?auto_703492 ?auto_703493 ) ( ON ?auto_703491 ?auto_703492 ) ( ON ?auto_703490 ?auto_703491 ) ( ON ?auto_703489 ?auto_703490 ) ( ON ?auto_703488 ?auto_703489 ) ( CLEAR ?auto_703486 ) ( ON ?auto_703487 ?auto_703488 ) ( CLEAR ?auto_703487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_703485 ?auto_703486 ?auto_703487 )
      ( MAKE-9PILE ?auto_703485 ?auto_703486 ?auto_703487 ?auto_703488 ?auto_703489 ?auto_703490 ?auto_703491 ?auto_703492 ?auto_703493 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703523 - BLOCK
      ?auto_703524 - BLOCK
      ?auto_703525 - BLOCK
      ?auto_703526 - BLOCK
      ?auto_703527 - BLOCK
      ?auto_703528 - BLOCK
      ?auto_703529 - BLOCK
      ?auto_703530 - BLOCK
      ?auto_703531 - BLOCK
    )
    :vars
    (
      ?auto_703532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703531 ?auto_703532 ) ( ON-TABLE ?auto_703523 ) ( not ( = ?auto_703523 ?auto_703524 ) ) ( not ( = ?auto_703523 ?auto_703525 ) ) ( not ( = ?auto_703523 ?auto_703526 ) ) ( not ( = ?auto_703523 ?auto_703527 ) ) ( not ( = ?auto_703523 ?auto_703528 ) ) ( not ( = ?auto_703523 ?auto_703529 ) ) ( not ( = ?auto_703523 ?auto_703530 ) ) ( not ( = ?auto_703523 ?auto_703531 ) ) ( not ( = ?auto_703523 ?auto_703532 ) ) ( not ( = ?auto_703524 ?auto_703525 ) ) ( not ( = ?auto_703524 ?auto_703526 ) ) ( not ( = ?auto_703524 ?auto_703527 ) ) ( not ( = ?auto_703524 ?auto_703528 ) ) ( not ( = ?auto_703524 ?auto_703529 ) ) ( not ( = ?auto_703524 ?auto_703530 ) ) ( not ( = ?auto_703524 ?auto_703531 ) ) ( not ( = ?auto_703524 ?auto_703532 ) ) ( not ( = ?auto_703525 ?auto_703526 ) ) ( not ( = ?auto_703525 ?auto_703527 ) ) ( not ( = ?auto_703525 ?auto_703528 ) ) ( not ( = ?auto_703525 ?auto_703529 ) ) ( not ( = ?auto_703525 ?auto_703530 ) ) ( not ( = ?auto_703525 ?auto_703531 ) ) ( not ( = ?auto_703525 ?auto_703532 ) ) ( not ( = ?auto_703526 ?auto_703527 ) ) ( not ( = ?auto_703526 ?auto_703528 ) ) ( not ( = ?auto_703526 ?auto_703529 ) ) ( not ( = ?auto_703526 ?auto_703530 ) ) ( not ( = ?auto_703526 ?auto_703531 ) ) ( not ( = ?auto_703526 ?auto_703532 ) ) ( not ( = ?auto_703527 ?auto_703528 ) ) ( not ( = ?auto_703527 ?auto_703529 ) ) ( not ( = ?auto_703527 ?auto_703530 ) ) ( not ( = ?auto_703527 ?auto_703531 ) ) ( not ( = ?auto_703527 ?auto_703532 ) ) ( not ( = ?auto_703528 ?auto_703529 ) ) ( not ( = ?auto_703528 ?auto_703530 ) ) ( not ( = ?auto_703528 ?auto_703531 ) ) ( not ( = ?auto_703528 ?auto_703532 ) ) ( not ( = ?auto_703529 ?auto_703530 ) ) ( not ( = ?auto_703529 ?auto_703531 ) ) ( not ( = ?auto_703529 ?auto_703532 ) ) ( not ( = ?auto_703530 ?auto_703531 ) ) ( not ( = ?auto_703530 ?auto_703532 ) ) ( not ( = ?auto_703531 ?auto_703532 ) ) ( ON ?auto_703530 ?auto_703531 ) ( ON ?auto_703529 ?auto_703530 ) ( ON ?auto_703528 ?auto_703529 ) ( ON ?auto_703527 ?auto_703528 ) ( ON ?auto_703526 ?auto_703527 ) ( ON ?auto_703525 ?auto_703526 ) ( CLEAR ?auto_703523 ) ( ON ?auto_703524 ?auto_703525 ) ( CLEAR ?auto_703524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_703523 ?auto_703524 )
      ( MAKE-9PILE ?auto_703523 ?auto_703524 ?auto_703525 ?auto_703526 ?auto_703527 ?auto_703528 ?auto_703529 ?auto_703530 ?auto_703531 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_703561 - BLOCK
      ?auto_703562 - BLOCK
      ?auto_703563 - BLOCK
      ?auto_703564 - BLOCK
      ?auto_703565 - BLOCK
      ?auto_703566 - BLOCK
      ?auto_703567 - BLOCK
      ?auto_703568 - BLOCK
      ?auto_703569 - BLOCK
    )
    :vars
    (
      ?auto_703570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703569 ?auto_703570 ) ( not ( = ?auto_703561 ?auto_703562 ) ) ( not ( = ?auto_703561 ?auto_703563 ) ) ( not ( = ?auto_703561 ?auto_703564 ) ) ( not ( = ?auto_703561 ?auto_703565 ) ) ( not ( = ?auto_703561 ?auto_703566 ) ) ( not ( = ?auto_703561 ?auto_703567 ) ) ( not ( = ?auto_703561 ?auto_703568 ) ) ( not ( = ?auto_703561 ?auto_703569 ) ) ( not ( = ?auto_703561 ?auto_703570 ) ) ( not ( = ?auto_703562 ?auto_703563 ) ) ( not ( = ?auto_703562 ?auto_703564 ) ) ( not ( = ?auto_703562 ?auto_703565 ) ) ( not ( = ?auto_703562 ?auto_703566 ) ) ( not ( = ?auto_703562 ?auto_703567 ) ) ( not ( = ?auto_703562 ?auto_703568 ) ) ( not ( = ?auto_703562 ?auto_703569 ) ) ( not ( = ?auto_703562 ?auto_703570 ) ) ( not ( = ?auto_703563 ?auto_703564 ) ) ( not ( = ?auto_703563 ?auto_703565 ) ) ( not ( = ?auto_703563 ?auto_703566 ) ) ( not ( = ?auto_703563 ?auto_703567 ) ) ( not ( = ?auto_703563 ?auto_703568 ) ) ( not ( = ?auto_703563 ?auto_703569 ) ) ( not ( = ?auto_703563 ?auto_703570 ) ) ( not ( = ?auto_703564 ?auto_703565 ) ) ( not ( = ?auto_703564 ?auto_703566 ) ) ( not ( = ?auto_703564 ?auto_703567 ) ) ( not ( = ?auto_703564 ?auto_703568 ) ) ( not ( = ?auto_703564 ?auto_703569 ) ) ( not ( = ?auto_703564 ?auto_703570 ) ) ( not ( = ?auto_703565 ?auto_703566 ) ) ( not ( = ?auto_703565 ?auto_703567 ) ) ( not ( = ?auto_703565 ?auto_703568 ) ) ( not ( = ?auto_703565 ?auto_703569 ) ) ( not ( = ?auto_703565 ?auto_703570 ) ) ( not ( = ?auto_703566 ?auto_703567 ) ) ( not ( = ?auto_703566 ?auto_703568 ) ) ( not ( = ?auto_703566 ?auto_703569 ) ) ( not ( = ?auto_703566 ?auto_703570 ) ) ( not ( = ?auto_703567 ?auto_703568 ) ) ( not ( = ?auto_703567 ?auto_703569 ) ) ( not ( = ?auto_703567 ?auto_703570 ) ) ( not ( = ?auto_703568 ?auto_703569 ) ) ( not ( = ?auto_703568 ?auto_703570 ) ) ( not ( = ?auto_703569 ?auto_703570 ) ) ( ON ?auto_703568 ?auto_703569 ) ( ON ?auto_703567 ?auto_703568 ) ( ON ?auto_703566 ?auto_703567 ) ( ON ?auto_703565 ?auto_703566 ) ( ON ?auto_703564 ?auto_703565 ) ( ON ?auto_703563 ?auto_703564 ) ( ON ?auto_703562 ?auto_703563 ) ( ON ?auto_703561 ?auto_703562 ) ( CLEAR ?auto_703561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_703561 )
      ( MAKE-9PILE ?auto_703561 ?auto_703562 ?auto_703563 ?auto_703564 ?auto_703565 ?auto_703566 ?auto_703567 ?auto_703568 ?auto_703569 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703600 - BLOCK
      ?auto_703601 - BLOCK
      ?auto_703602 - BLOCK
      ?auto_703603 - BLOCK
      ?auto_703604 - BLOCK
      ?auto_703605 - BLOCK
      ?auto_703606 - BLOCK
      ?auto_703607 - BLOCK
      ?auto_703608 - BLOCK
      ?auto_703609 - BLOCK
    )
    :vars
    (
      ?auto_703610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_703608 ) ( ON ?auto_703609 ?auto_703610 ) ( CLEAR ?auto_703609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_703600 ) ( ON ?auto_703601 ?auto_703600 ) ( ON ?auto_703602 ?auto_703601 ) ( ON ?auto_703603 ?auto_703602 ) ( ON ?auto_703604 ?auto_703603 ) ( ON ?auto_703605 ?auto_703604 ) ( ON ?auto_703606 ?auto_703605 ) ( ON ?auto_703607 ?auto_703606 ) ( ON ?auto_703608 ?auto_703607 ) ( not ( = ?auto_703600 ?auto_703601 ) ) ( not ( = ?auto_703600 ?auto_703602 ) ) ( not ( = ?auto_703600 ?auto_703603 ) ) ( not ( = ?auto_703600 ?auto_703604 ) ) ( not ( = ?auto_703600 ?auto_703605 ) ) ( not ( = ?auto_703600 ?auto_703606 ) ) ( not ( = ?auto_703600 ?auto_703607 ) ) ( not ( = ?auto_703600 ?auto_703608 ) ) ( not ( = ?auto_703600 ?auto_703609 ) ) ( not ( = ?auto_703600 ?auto_703610 ) ) ( not ( = ?auto_703601 ?auto_703602 ) ) ( not ( = ?auto_703601 ?auto_703603 ) ) ( not ( = ?auto_703601 ?auto_703604 ) ) ( not ( = ?auto_703601 ?auto_703605 ) ) ( not ( = ?auto_703601 ?auto_703606 ) ) ( not ( = ?auto_703601 ?auto_703607 ) ) ( not ( = ?auto_703601 ?auto_703608 ) ) ( not ( = ?auto_703601 ?auto_703609 ) ) ( not ( = ?auto_703601 ?auto_703610 ) ) ( not ( = ?auto_703602 ?auto_703603 ) ) ( not ( = ?auto_703602 ?auto_703604 ) ) ( not ( = ?auto_703602 ?auto_703605 ) ) ( not ( = ?auto_703602 ?auto_703606 ) ) ( not ( = ?auto_703602 ?auto_703607 ) ) ( not ( = ?auto_703602 ?auto_703608 ) ) ( not ( = ?auto_703602 ?auto_703609 ) ) ( not ( = ?auto_703602 ?auto_703610 ) ) ( not ( = ?auto_703603 ?auto_703604 ) ) ( not ( = ?auto_703603 ?auto_703605 ) ) ( not ( = ?auto_703603 ?auto_703606 ) ) ( not ( = ?auto_703603 ?auto_703607 ) ) ( not ( = ?auto_703603 ?auto_703608 ) ) ( not ( = ?auto_703603 ?auto_703609 ) ) ( not ( = ?auto_703603 ?auto_703610 ) ) ( not ( = ?auto_703604 ?auto_703605 ) ) ( not ( = ?auto_703604 ?auto_703606 ) ) ( not ( = ?auto_703604 ?auto_703607 ) ) ( not ( = ?auto_703604 ?auto_703608 ) ) ( not ( = ?auto_703604 ?auto_703609 ) ) ( not ( = ?auto_703604 ?auto_703610 ) ) ( not ( = ?auto_703605 ?auto_703606 ) ) ( not ( = ?auto_703605 ?auto_703607 ) ) ( not ( = ?auto_703605 ?auto_703608 ) ) ( not ( = ?auto_703605 ?auto_703609 ) ) ( not ( = ?auto_703605 ?auto_703610 ) ) ( not ( = ?auto_703606 ?auto_703607 ) ) ( not ( = ?auto_703606 ?auto_703608 ) ) ( not ( = ?auto_703606 ?auto_703609 ) ) ( not ( = ?auto_703606 ?auto_703610 ) ) ( not ( = ?auto_703607 ?auto_703608 ) ) ( not ( = ?auto_703607 ?auto_703609 ) ) ( not ( = ?auto_703607 ?auto_703610 ) ) ( not ( = ?auto_703608 ?auto_703609 ) ) ( not ( = ?auto_703608 ?auto_703610 ) ) ( not ( = ?auto_703609 ?auto_703610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_703609 ?auto_703610 )
      ( !STACK ?auto_703609 ?auto_703608 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703642 - BLOCK
      ?auto_703643 - BLOCK
      ?auto_703644 - BLOCK
      ?auto_703645 - BLOCK
      ?auto_703646 - BLOCK
      ?auto_703647 - BLOCK
      ?auto_703648 - BLOCK
      ?auto_703649 - BLOCK
      ?auto_703650 - BLOCK
      ?auto_703651 - BLOCK
    )
    :vars
    (
      ?auto_703652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703651 ?auto_703652 ) ( ON-TABLE ?auto_703642 ) ( ON ?auto_703643 ?auto_703642 ) ( ON ?auto_703644 ?auto_703643 ) ( ON ?auto_703645 ?auto_703644 ) ( ON ?auto_703646 ?auto_703645 ) ( ON ?auto_703647 ?auto_703646 ) ( ON ?auto_703648 ?auto_703647 ) ( ON ?auto_703649 ?auto_703648 ) ( not ( = ?auto_703642 ?auto_703643 ) ) ( not ( = ?auto_703642 ?auto_703644 ) ) ( not ( = ?auto_703642 ?auto_703645 ) ) ( not ( = ?auto_703642 ?auto_703646 ) ) ( not ( = ?auto_703642 ?auto_703647 ) ) ( not ( = ?auto_703642 ?auto_703648 ) ) ( not ( = ?auto_703642 ?auto_703649 ) ) ( not ( = ?auto_703642 ?auto_703650 ) ) ( not ( = ?auto_703642 ?auto_703651 ) ) ( not ( = ?auto_703642 ?auto_703652 ) ) ( not ( = ?auto_703643 ?auto_703644 ) ) ( not ( = ?auto_703643 ?auto_703645 ) ) ( not ( = ?auto_703643 ?auto_703646 ) ) ( not ( = ?auto_703643 ?auto_703647 ) ) ( not ( = ?auto_703643 ?auto_703648 ) ) ( not ( = ?auto_703643 ?auto_703649 ) ) ( not ( = ?auto_703643 ?auto_703650 ) ) ( not ( = ?auto_703643 ?auto_703651 ) ) ( not ( = ?auto_703643 ?auto_703652 ) ) ( not ( = ?auto_703644 ?auto_703645 ) ) ( not ( = ?auto_703644 ?auto_703646 ) ) ( not ( = ?auto_703644 ?auto_703647 ) ) ( not ( = ?auto_703644 ?auto_703648 ) ) ( not ( = ?auto_703644 ?auto_703649 ) ) ( not ( = ?auto_703644 ?auto_703650 ) ) ( not ( = ?auto_703644 ?auto_703651 ) ) ( not ( = ?auto_703644 ?auto_703652 ) ) ( not ( = ?auto_703645 ?auto_703646 ) ) ( not ( = ?auto_703645 ?auto_703647 ) ) ( not ( = ?auto_703645 ?auto_703648 ) ) ( not ( = ?auto_703645 ?auto_703649 ) ) ( not ( = ?auto_703645 ?auto_703650 ) ) ( not ( = ?auto_703645 ?auto_703651 ) ) ( not ( = ?auto_703645 ?auto_703652 ) ) ( not ( = ?auto_703646 ?auto_703647 ) ) ( not ( = ?auto_703646 ?auto_703648 ) ) ( not ( = ?auto_703646 ?auto_703649 ) ) ( not ( = ?auto_703646 ?auto_703650 ) ) ( not ( = ?auto_703646 ?auto_703651 ) ) ( not ( = ?auto_703646 ?auto_703652 ) ) ( not ( = ?auto_703647 ?auto_703648 ) ) ( not ( = ?auto_703647 ?auto_703649 ) ) ( not ( = ?auto_703647 ?auto_703650 ) ) ( not ( = ?auto_703647 ?auto_703651 ) ) ( not ( = ?auto_703647 ?auto_703652 ) ) ( not ( = ?auto_703648 ?auto_703649 ) ) ( not ( = ?auto_703648 ?auto_703650 ) ) ( not ( = ?auto_703648 ?auto_703651 ) ) ( not ( = ?auto_703648 ?auto_703652 ) ) ( not ( = ?auto_703649 ?auto_703650 ) ) ( not ( = ?auto_703649 ?auto_703651 ) ) ( not ( = ?auto_703649 ?auto_703652 ) ) ( not ( = ?auto_703650 ?auto_703651 ) ) ( not ( = ?auto_703650 ?auto_703652 ) ) ( not ( = ?auto_703651 ?auto_703652 ) ) ( CLEAR ?auto_703649 ) ( ON ?auto_703650 ?auto_703651 ) ( CLEAR ?auto_703650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_703642 ?auto_703643 ?auto_703644 ?auto_703645 ?auto_703646 ?auto_703647 ?auto_703648 ?auto_703649 ?auto_703650 )
      ( MAKE-10PILE ?auto_703642 ?auto_703643 ?auto_703644 ?auto_703645 ?auto_703646 ?auto_703647 ?auto_703648 ?auto_703649 ?auto_703650 ?auto_703651 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703684 - BLOCK
      ?auto_703685 - BLOCK
      ?auto_703686 - BLOCK
      ?auto_703687 - BLOCK
      ?auto_703688 - BLOCK
      ?auto_703689 - BLOCK
      ?auto_703690 - BLOCK
      ?auto_703691 - BLOCK
      ?auto_703692 - BLOCK
      ?auto_703693 - BLOCK
    )
    :vars
    (
      ?auto_703694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703693 ?auto_703694 ) ( ON-TABLE ?auto_703684 ) ( ON ?auto_703685 ?auto_703684 ) ( ON ?auto_703686 ?auto_703685 ) ( ON ?auto_703687 ?auto_703686 ) ( ON ?auto_703688 ?auto_703687 ) ( ON ?auto_703689 ?auto_703688 ) ( ON ?auto_703690 ?auto_703689 ) ( not ( = ?auto_703684 ?auto_703685 ) ) ( not ( = ?auto_703684 ?auto_703686 ) ) ( not ( = ?auto_703684 ?auto_703687 ) ) ( not ( = ?auto_703684 ?auto_703688 ) ) ( not ( = ?auto_703684 ?auto_703689 ) ) ( not ( = ?auto_703684 ?auto_703690 ) ) ( not ( = ?auto_703684 ?auto_703691 ) ) ( not ( = ?auto_703684 ?auto_703692 ) ) ( not ( = ?auto_703684 ?auto_703693 ) ) ( not ( = ?auto_703684 ?auto_703694 ) ) ( not ( = ?auto_703685 ?auto_703686 ) ) ( not ( = ?auto_703685 ?auto_703687 ) ) ( not ( = ?auto_703685 ?auto_703688 ) ) ( not ( = ?auto_703685 ?auto_703689 ) ) ( not ( = ?auto_703685 ?auto_703690 ) ) ( not ( = ?auto_703685 ?auto_703691 ) ) ( not ( = ?auto_703685 ?auto_703692 ) ) ( not ( = ?auto_703685 ?auto_703693 ) ) ( not ( = ?auto_703685 ?auto_703694 ) ) ( not ( = ?auto_703686 ?auto_703687 ) ) ( not ( = ?auto_703686 ?auto_703688 ) ) ( not ( = ?auto_703686 ?auto_703689 ) ) ( not ( = ?auto_703686 ?auto_703690 ) ) ( not ( = ?auto_703686 ?auto_703691 ) ) ( not ( = ?auto_703686 ?auto_703692 ) ) ( not ( = ?auto_703686 ?auto_703693 ) ) ( not ( = ?auto_703686 ?auto_703694 ) ) ( not ( = ?auto_703687 ?auto_703688 ) ) ( not ( = ?auto_703687 ?auto_703689 ) ) ( not ( = ?auto_703687 ?auto_703690 ) ) ( not ( = ?auto_703687 ?auto_703691 ) ) ( not ( = ?auto_703687 ?auto_703692 ) ) ( not ( = ?auto_703687 ?auto_703693 ) ) ( not ( = ?auto_703687 ?auto_703694 ) ) ( not ( = ?auto_703688 ?auto_703689 ) ) ( not ( = ?auto_703688 ?auto_703690 ) ) ( not ( = ?auto_703688 ?auto_703691 ) ) ( not ( = ?auto_703688 ?auto_703692 ) ) ( not ( = ?auto_703688 ?auto_703693 ) ) ( not ( = ?auto_703688 ?auto_703694 ) ) ( not ( = ?auto_703689 ?auto_703690 ) ) ( not ( = ?auto_703689 ?auto_703691 ) ) ( not ( = ?auto_703689 ?auto_703692 ) ) ( not ( = ?auto_703689 ?auto_703693 ) ) ( not ( = ?auto_703689 ?auto_703694 ) ) ( not ( = ?auto_703690 ?auto_703691 ) ) ( not ( = ?auto_703690 ?auto_703692 ) ) ( not ( = ?auto_703690 ?auto_703693 ) ) ( not ( = ?auto_703690 ?auto_703694 ) ) ( not ( = ?auto_703691 ?auto_703692 ) ) ( not ( = ?auto_703691 ?auto_703693 ) ) ( not ( = ?auto_703691 ?auto_703694 ) ) ( not ( = ?auto_703692 ?auto_703693 ) ) ( not ( = ?auto_703692 ?auto_703694 ) ) ( not ( = ?auto_703693 ?auto_703694 ) ) ( ON ?auto_703692 ?auto_703693 ) ( CLEAR ?auto_703690 ) ( ON ?auto_703691 ?auto_703692 ) ( CLEAR ?auto_703691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_703684 ?auto_703685 ?auto_703686 ?auto_703687 ?auto_703688 ?auto_703689 ?auto_703690 ?auto_703691 )
      ( MAKE-10PILE ?auto_703684 ?auto_703685 ?auto_703686 ?auto_703687 ?auto_703688 ?auto_703689 ?auto_703690 ?auto_703691 ?auto_703692 ?auto_703693 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703726 - BLOCK
      ?auto_703727 - BLOCK
      ?auto_703728 - BLOCK
      ?auto_703729 - BLOCK
      ?auto_703730 - BLOCK
      ?auto_703731 - BLOCK
      ?auto_703732 - BLOCK
      ?auto_703733 - BLOCK
      ?auto_703734 - BLOCK
      ?auto_703735 - BLOCK
    )
    :vars
    (
      ?auto_703736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703735 ?auto_703736 ) ( ON-TABLE ?auto_703726 ) ( ON ?auto_703727 ?auto_703726 ) ( ON ?auto_703728 ?auto_703727 ) ( ON ?auto_703729 ?auto_703728 ) ( ON ?auto_703730 ?auto_703729 ) ( ON ?auto_703731 ?auto_703730 ) ( not ( = ?auto_703726 ?auto_703727 ) ) ( not ( = ?auto_703726 ?auto_703728 ) ) ( not ( = ?auto_703726 ?auto_703729 ) ) ( not ( = ?auto_703726 ?auto_703730 ) ) ( not ( = ?auto_703726 ?auto_703731 ) ) ( not ( = ?auto_703726 ?auto_703732 ) ) ( not ( = ?auto_703726 ?auto_703733 ) ) ( not ( = ?auto_703726 ?auto_703734 ) ) ( not ( = ?auto_703726 ?auto_703735 ) ) ( not ( = ?auto_703726 ?auto_703736 ) ) ( not ( = ?auto_703727 ?auto_703728 ) ) ( not ( = ?auto_703727 ?auto_703729 ) ) ( not ( = ?auto_703727 ?auto_703730 ) ) ( not ( = ?auto_703727 ?auto_703731 ) ) ( not ( = ?auto_703727 ?auto_703732 ) ) ( not ( = ?auto_703727 ?auto_703733 ) ) ( not ( = ?auto_703727 ?auto_703734 ) ) ( not ( = ?auto_703727 ?auto_703735 ) ) ( not ( = ?auto_703727 ?auto_703736 ) ) ( not ( = ?auto_703728 ?auto_703729 ) ) ( not ( = ?auto_703728 ?auto_703730 ) ) ( not ( = ?auto_703728 ?auto_703731 ) ) ( not ( = ?auto_703728 ?auto_703732 ) ) ( not ( = ?auto_703728 ?auto_703733 ) ) ( not ( = ?auto_703728 ?auto_703734 ) ) ( not ( = ?auto_703728 ?auto_703735 ) ) ( not ( = ?auto_703728 ?auto_703736 ) ) ( not ( = ?auto_703729 ?auto_703730 ) ) ( not ( = ?auto_703729 ?auto_703731 ) ) ( not ( = ?auto_703729 ?auto_703732 ) ) ( not ( = ?auto_703729 ?auto_703733 ) ) ( not ( = ?auto_703729 ?auto_703734 ) ) ( not ( = ?auto_703729 ?auto_703735 ) ) ( not ( = ?auto_703729 ?auto_703736 ) ) ( not ( = ?auto_703730 ?auto_703731 ) ) ( not ( = ?auto_703730 ?auto_703732 ) ) ( not ( = ?auto_703730 ?auto_703733 ) ) ( not ( = ?auto_703730 ?auto_703734 ) ) ( not ( = ?auto_703730 ?auto_703735 ) ) ( not ( = ?auto_703730 ?auto_703736 ) ) ( not ( = ?auto_703731 ?auto_703732 ) ) ( not ( = ?auto_703731 ?auto_703733 ) ) ( not ( = ?auto_703731 ?auto_703734 ) ) ( not ( = ?auto_703731 ?auto_703735 ) ) ( not ( = ?auto_703731 ?auto_703736 ) ) ( not ( = ?auto_703732 ?auto_703733 ) ) ( not ( = ?auto_703732 ?auto_703734 ) ) ( not ( = ?auto_703732 ?auto_703735 ) ) ( not ( = ?auto_703732 ?auto_703736 ) ) ( not ( = ?auto_703733 ?auto_703734 ) ) ( not ( = ?auto_703733 ?auto_703735 ) ) ( not ( = ?auto_703733 ?auto_703736 ) ) ( not ( = ?auto_703734 ?auto_703735 ) ) ( not ( = ?auto_703734 ?auto_703736 ) ) ( not ( = ?auto_703735 ?auto_703736 ) ) ( ON ?auto_703734 ?auto_703735 ) ( ON ?auto_703733 ?auto_703734 ) ( CLEAR ?auto_703731 ) ( ON ?auto_703732 ?auto_703733 ) ( CLEAR ?auto_703732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_703726 ?auto_703727 ?auto_703728 ?auto_703729 ?auto_703730 ?auto_703731 ?auto_703732 )
      ( MAKE-10PILE ?auto_703726 ?auto_703727 ?auto_703728 ?auto_703729 ?auto_703730 ?auto_703731 ?auto_703732 ?auto_703733 ?auto_703734 ?auto_703735 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703768 - BLOCK
      ?auto_703769 - BLOCK
      ?auto_703770 - BLOCK
      ?auto_703771 - BLOCK
      ?auto_703772 - BLOCK
      ?auto_703773 - BLOCK
      ?auto_703774 - BLOCK
      ?auto_703775 - BLOCK
      ?auto_703776 - BLOCK
      ?auto_703777 - BLOCK
    )
    :vars
    (
      ?auto_703778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703777 ?auto_703778 ) ( ON-TABLE ?auto_703768 ) ( ON ?auto_703769 ?auto_703768 ) ( ON ?auto_703770 ?auto_703769 ) ( ON ?auto_703771 ?auto_703770 ) ( ON ?auto_703772 ?auto_703771 ) ( not ( = ?auto_703768 ?auto_703769 ) ) ( not ( = ?auto_703768 ?auto_703770 ) ) ( not ( = ?auto_703768 ?auto_703771 ) ) ( not ( = ?auto_703768 ?auto_703772 ) ) ( not ( = ?auto_703768 ?auto_703773 ) ) ( not ( = ?auto_703768 ?auto_703774 ) ) ( not ( = ?auto_703768 ?auto_703775 ) ) ( not ( = ?auto_703768 ?auto_703776 ) ) ( not ( = ?auto_703768 ?auto_703777 ) ) ( not ( = ?auto_703768 ?auto_703778 ) ) ( not ( = ?auto_703769 ?auto_703770 ) ) ( not ( = ?auto_703769 ?auto_703771 ) ) ( not ( = ?auto_703769 ?auto_703772 ) ) ( not ( = ?auto_703769 ?auto_703773 ) ) ( not ( = ?auto_703769 ?auto_703774 ) ) ( not ( = ?auto_703769 ?auto_703775 ) ) ( not ( = ?auto_703769 ?auto_703776 ) ) ( not ( = ?auto_703769 ?auto_703777 ) ) ( not ( = ?auto_703769 ?auto_703778 ) ) ( not ( = ?auto_703770 ?auto_703771 ) ) ( not ( = ?auto_703770 ?auto_703772 ) ) ( not ( = ?auto_703770 ?auto_703773 ) ) ( not ( = ?auto_703770 ?auto_703774 ) ) ( not ( = ?auto_703770 ?auto_703775 ) ) ( not ( = ?auto_703770 ?auto_703776 ) ) ( not ( = ?auto_703770 ?auto_703777 ) ) ( not ( = ?auto_703770 ?auto_703778 ) ) ( not ( = ?auto_703771 ?auto_703772 ) ) ( not ( = ?auto_703771 ?auto_703773 ) ) ( not ( = ?auto_703771 ?auto_703774 ) ) ( not ( = ?auto_703771 ?auto_703775 ) ) ( not ( = ?auto_703771 ?auto_703776 ) ) ( not ( = ?auto_703771 ?auto_703777 ) ) ( not ( = ?auto_703771 ?auto_703778 ) ) ( not ( = ?auto_703772 ?auto_703773 ) ) ( not ( = ?auto_703772 ?auto_703774 ) ) ( not ( = ?auto_703772 ?auto_703775 ) ) ( not ( = ?auto_703772 ?auto_703776 ) ) ( not ( = ?auto_703772 ?auto_703777 ) ) ( not ( = ?auto_703772 ?auto_703778 ) ) ( not ( = ?auto_703773 ?auto_703774 ) ) ( not ( = ?auto_703773 ?auto_703775 ) ) ( not ( = ?auto_703773 ?auto_703776 ) ) ( not ( = ?auto_703773 ?auto_703777 ) ) ( not ( = ?auto_703773 ?auto_703778 ) ) ( not ( = ?auto_703774 ?auto_703775 ) ) ( not ( = ?auto_703774 ?auto_703776 ) ) ( not ( = ?auto_703774 ?auto_703777 ) ) ( not ( = ?auto_703774 ?auto_703778 ) ) ( not ( = ?auto_703775 ?auto_703776 ) ) ( not ( = ?auto_703775 ?auto_703777 ) ) ( not ( = ?auto_703775 ?auto_703778 ) ) ( not ( = ?auto_703776 ?auto_703777 ) ) ( not ( = ?auto_703776 ?auto_703778 ) ) ( not ( = ?auto_703777 ?auto_703778 ) ) ( ON ?auto_703776 ?auto_703777 ) ( ON ?auto_703775 ?auto_703776 ) ( ON ?auto_703774 ?auto_703775 ) ( CLEAR ?auto_703772 ) ( ON ?auto_703773 ?auto_703774 ) ( CLEAR ?auto_703773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_703768 ?auto_703769 ?auto_703770 ?auto_703771 ?auto_703772 ?auto_703773 )
      ( MAKE-10PILE ?auto_703768 ?auto_703769 ?auto_703770 ?auto_703771 ?auto_703772 ?auto_703773 ?auto_703774 ?auto_703775 ?auto_703776 ?auto_703777 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703810 - BLOCK
      ?auto_703811 - BLOCK
      ?auto_703812 - BLOCK
      ?auto_703813 - BLOCK
      ?auto_703814 - BLOCK
      ?auto_703815 - BLOCK
      ?auto_703816 - BLOCK
      ?auto_703817 - BLOCK
      ?auto_703818 - BLOCK
      ?auto_703819 - BLOCK
    )
    :vars
    (
      ?auto_703820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703819 ?auto_703820 ) ( ON-TABLE ?auto_703810 ) ( ON ?auto_703811 ?auto_703810 ) ( ON ?auto_703812 ?auto_703811 ) ( ON ?auto_703813 ?auto_703812 ) ( not ( = ?auto_703810 ?auto_703811 ) ) ( not ( = ?auto_703810 ?auto_703812 ) ) ( not ( = ?auto_703810 ?auto_703813 ) ) ( not ( = ?auto_703810 ?auto_703814 ) ) ( not ( = ?auto_703810 ?auto_703815 ) ) ( not ( = ?auto_703810 ?auto_703816 ) ) ( not ( = ?auto_703810 ?auto_703817 ) ) ( not ( = ?auto_703810 ?auto_703818 ) ) ( not ( = ?auto_703810 ?auto_703819 ) ) ( not ( = ?auto_703810 ?auto_703820 ) ) ( not ( = ?auto_703811 ?auto_703812 ) ) ( not ( = ?auto_703811 ?auto_703813 ) ) ( not ( = ?auto_703811 ?auto_703814 ) ) ( not ( = ?auto_703811 ?auto_703815 ) ) ( not ( = ?auto_703811 ?auto_703816 ) ) ( not ( = ?auto_703811 ?auto_703817 ) ) ( not ( = ?auto_703811 ?auto_703818 ) ) ( not ( = ?auto_703811 ?auto_703819 ) ) ( not ( = ?auto_703811 ?auto_703820 ) ) ( not ( = ?auto_703812 ?auto_703813 ) ) ( not ( = ?auto_703812 ?auto_703814 ) ) ( not ( = ?auto_703812 ?auto_703815 ) ) ( not ( = ?auto_703812 ?auto_703816 ) ) ( not ( = ?auto_703812 ?auto_703817 ) ) ( not ( = ?auto_703812 ?auto_703818 ) ) ( not ( = ?auto_703812 ?auto_703819 ) ) ( not ( = ?auto_703812 ?auto_703820 ) ) ( not ( = ?auto_703813 ?auto_703814 ) ) ( not ( = ?auto_703813 ?auto_703815 ) ) ( not ( = ?auto_703813 ?auto_703816 ) ) ( not ( = ?auto_703813 ?auto_703817 ) ) ( not ( = ?auto_703813 ?auto_703818 ) ) ( not ( = ?auto_703813 ?auto_703819 ) ) ( not ( = ?auto_703813 ?auto_703820 ) ) ( not ( = ?auto_703814 ?auto_703815 ) ) ( not ( = ?auto_703814 ?auto_703816 ) ) ( not ( = ?auto_703814 ?auto_703817 ) ) ( not ( = ?auto_703814 ?auto_703818 ) ) ( not ( = ?auto_703814 ?auto_703819 ) ) ( not ( = ?auto_703814 ?auto_703820 ) ) ( not ( = ?auto_703815 ?auto_703816 ) ) ( not ( = ?auto_703815 ?auto_703817 ) ) ( not ( = ?auto_703815 ?auto_703818 ) ) ( not ( = ?auto_703815 ?auto_703819 ) ) ( not ( = ?auto_703815 ?auto_703820 ) ) ( not ( = ?auto_703816 ?auto_703817 ) ) ( not ( = ?auto_703816 ?auto_703818 ) ) ( not ( = ?auto_703816 ?auto_703819 ) ) ( not ( = ?auto_703816 ?auto_703820 ) ) ( not ( = ?auto_703817 ?auto_703818 ) ) ( not ( = ?auto_703817 ?auto_703819 ) ) ( not ( = ?auto_703817 ?auto_703820 ) ) ( not ( = ?auto_703818 ?auto_703819 ) ) ( not ( = ?auto_703818 ?auto_703820 ) ) ( not ( = ?auto_703819 ?auto_703820 ) ) ( ON ?auto_703818 ?auto_703819 ) ( ON ?auto_703817 ?auto_703818 ) ( ON ?auto_703816 ?auto_703817 ) ( ON ?auto_703815 ?auto_703816 ) ( CLEAR ?auto_703813 ) ( ON ?auto_703814 ?auto_703815 ) ( CLEAR ?auto_703814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_703810 ?auto_703811 ?auto_703812 ?auto_703813 ?auto_703814 )
      ( MAKE-10PILE ?auto_703810 ?auto_703811 ?auto_703812 ?auto_703813 ?auto_703814 ?auto_703815 ?auto_703816 ?auto_703817 ?auto_703818 ?auto_703819 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703852 - BLOCK
      ?auto_703853 - BLOCK
      ?auto_703854 - BLOCK
      ?auto_703855 - BLOCK
      ?auto_703856 - BLOCK
      ?auto_703857 - BLOCK
      ?auto_703858 - BLOCK
      ?auto_703859 - BLOCK
      ?auto_703860 - BLOCK
      ?auto_703861 - BLOCK
    )
    :vars
    (
      ?auto_703862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703861 ?auto_703862 ) ( ON-TABLE ?auto_703852 ) ( ON ?auto_703853 ?auto_703852 ) ( ON ?auto_703854 ?auto_703853 ) ( not ( = ?auto_703852 ?auto_703853 ) ) ( not ( = ?auto_703852 ?auto_703854 ) ) ( not ( = ?auto_703852 ?auto_703855 ) ) ( not ( = ?auto_703852 ?auto_703856 ) ) ( not ( = ?auto_703852 ?auto_703857 ) ) ( not ( = ?auto_703852 ?auto_703858 ) ) ( not ( = ?auto_703852 ?auto_703859 ) ) ( not ( = ?auto_703852 ?auto_703860 ) ) ( not ( = ?auto_703852 ?auto_703861 ) ) ( not ( = ?auto_703852 ?auto_703862 ) ) ( not ( = ?auto_703853 ?auto_703854 ) ) ( not ( = ?auto_703853 ?auto_703855 ) ) ( not ( = ?auto_703853 ?auto_703856 ) ) ( not ( = ?auto_703853 ?auto_703857 ) ) ( not ( = ?auto_703853 ?auto_703858 ) ) ( not ( = ?auto_703853 ?auto_703859 ) ) ( not ( = ?auto_703853 ?auto_703860 ) ) ( not ( = ?auto_703853 ?auto_703861 ) ) ( not ( = ?auto_703853 ?auto_703862 ) ) ( not ( = ?auto_703854 ?auto_703855 ) ) ( not ( = ?auto_703854 ?auto_703856 ) ) ( not ( = ?auto_703854 ?auto_703857 ) ) ( not ( = ?auto_703854 ?auto_703858 ) ) ( not ( = ?auto_703854 ?auto_703859 ) ) ( not ( = ?auto_703854 ?auto_703860 ) ) ( not ( = ?auto_703854 ?auto_703861 ) ) ( not ( = ?auto_703854 ?auto_703862 ) ) ( not ( = ?auto_703855 ?auto_703856 ) ) ( not ( = ?auto_703855 ?auto_703857 ) ) ( not ( = ?auto_703855 ?auto_703858 ) ) ( not ( = ?auto_703855 ?auto_703859 ) ) ( not ( = ?auto_703855 ?auto_703860 ) ) ( not ( = ?auto_703855 ?auto_703861 ) ) ( not ( = ?auto_703855 ?auto_703862 ) ) ( not ( = ?auto_703856 ?auto_703857 ) ) ( not ( = ?auto_703856 ?auto_703858 ) ) ( not ( = ?auto_703856 ?auto_703859 ) ) ( not ( = ?auto_703856 ?auto_703860 ) ) ( not ( = ?auto_703856 ?auto_703861 ) ) ( not ( = ?auto_703856 ?auto_703862 ) ) ( not ( = ?auto_703857 ?auto_703858 ) ) ( not ( = ?auto_703857 ?auto_703859 ) ) ( not ( = ?auto_703857 ?auto_703860 ) ) ( not ( = ?auto_703857 ?auto_703861 ) ) ( not ( = ?auto_703857 ?auto_703862 ) ) ( not ( = ?auto_703858 ?auto_703859 ) ) ( not ( = ?auto_703858 ?auto_703860 ) ) ( not ( = ?auto_703858 ?auto_703861 ) ) ( not ( = ?auto_703858 ?auto_703862 ) ) ( not ( = ?auto_703859 ?auto_703860 ) ) ( not ( = ?auto_703859 ?auto_703861 ) ) ( not ( = ?auto_703859 ?auto_703862 ) ) ( not ( = ?auto_703860 ?auto_703861 ) ) ( not ( = ?auto_703860 ?auto_703862 ) ) ( not ( = ?auto_703861 ?auto_703862 ) ) ( ON ?auto_703860 ?auto_703861 ) ( ON ?auto_703859 ?auto_703860 ) ( ON ?auto_703858 ?auto_703859 ) ( ON ?auto_703857 ?auto_703858 ) ( ON ?auto_703856 ?auto_703857 ) ( CLEAR ?auto_703854 ) ( ON ?auto_703855 ?auto_703856 ) ( CLEAR ?auto_703855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_703852 ?auto_703853 ?auto_703854 ?auto_703855 )
      ( MAKE-10PILE ?auto_703852 ?auto_703853 ?auto_703854 ?auto_703855 ?auto_703856 ?auto_703857 ?auto_703858 ?auto_703859 ?auto_703860 ?auto_703861 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703894 - BLOCK
      ?auto_703895 - BLOCK
      ?auto_703896 - BLOCK
      ?auto_703897 - BLOCK
      ?auto_703898 - BLOCK
      ?auto_703899 - BLOCK
      ?auto_703900 - BLOCK
      ?auto_703901 - BLOCK
      ?auto_703902 - BLOCK
      ?auto_703903 - BLOCK
    )
    :vars
    (
      ?auto_703904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703903 ?auto_703904 ) ( ON-TABLE ?auto_703894 ) ( ON ?auto_703895 ?auto_703894 ) ( not ( = ?auto_703894 ?auto_703895 ) ) ( not ( = ?auto_703894 ?auto_703896 ) ) ( not ( = ?auto_703894 ?auto_703897 ) ) ( not ( = ?auto_703894 ?auto_703898 ) ) ( not ( = ?auto_703894 ?auto_703899 ) ) ( not ( = ?auto_703894 ?auto_703900 ) ) ( not ( = ?auto_703894 ?auto_703901 ) ) ( not ( = ?auto_703894 ?auto_703902 ) ) ( not ( = ?auto_703894 ?auto_703903 ) ) ( not ( = ?auto_703894 ?auto_703904 ) ) ( not ( = ?auto_703895 ?auto_703896 ) ) ( not ( = ?auto_703895 ?auto_703897 ) ) ( not ( = ?auto_703895 ?auto_703898 ) ) ( not ( = ?auto_703895 ?auto_703899 ) ) ( not ( = ?auto_703895 ?auto_703900 ) ) ( not ( = ?auto_703895 ?auto_703901 ) ) ( not ( = ?auto_703895 ?auto_703902 ) ) ( not ( = ?auto_703895 ?auto_703903 ) ) ( not ( = ?auto_703895 ?auto_703904 ) ) ( not ( = ?auto_703896 ?auto_703897 ) ) ( not ( = ?auto_703896 ?auto_703898 ) ) ( not ( = ?auto_703896 ?auto_703899 ) ) ( not ( = ?auto_703896 ?auto_703900 ) ) ( not ( = ?auto_703896 ?auto_703901 ) ) ( not ( = ?auto_703896 ?auto_703902 ) ) ( not ( = ?auto_703896 ?auto_703903 ) ) ( not ( = ?auto_703896 ?auto_703904 ) ) ( not ( = ?auto_703897 ?auto_703898 ) ) ( not ( = ?auto_703897 ?auto_703899 ) ) ( not ( = ?auto_703897 ?auto_703900 ) ) ( not ( = ?auto_703897 ?auto_703901 ) ) ( not ( = ?auto_703897 ?auto_703902 ) ) ( not ( = ?auto_703897 ?auto_703903 ) ) ( not ( = ?auto_703897 ?auto_703904 ) ) ( not ( = ?auto_703898 ?auto_703899 ) ) ( not ( = ?auto_703898 ?auto_703900 ) ) ( not ( = ?auto_703898 ?auto_703901 ) ) ( not ( = ?auto_703898 ?auto_703902 ) ) ( not ( = ?auto_703898 ?auto_703903 ) ) ( not ( = ?auto_703898 ?auto_703904 ) ) ( not ( = ?auto_703899 ?auto_703900 ) ) ( not ( = ?auto_703899 ?auto_703901 ) ) ( not ( = ?auto_703899 ?auto_703902 ) ) ( not ( = ?auto_703899 ?auto_703903 ) ) ( not ( = ?auto_703899 ?auto_703904 ) ) ( not ( = ?auto_703900 ?auto_703901 ) ) ( not ( = ?auto_703900 ?auto_703902 ) ) ( not ( = ?auto_703900 ?auto_703903 ) ) ( not ( = ?auto_703900 ?auto_703904 ) ) ( not ( = ?auto_703901 ?auto_703902 ) ) ( not ( = ?auto_703901 ?auto_703903 ) ) ( not ( = ?auto_703901 ?auto_703904 ) ) ( not ( = ?auto_703902 ?auto_703903 ) ) ( not ( = ?auto_703902 ?auto_703904 ) ) ( not ( = ?auto_703903 ?auto_703904 ) ) ( ON ?auto_703902 ?auto_703903 ) ( ON ?auto_703901 ?auto_703902 ) ( ON ?auto_703900 ?auto_703901 ) ( ON ?auto_703899 ?auto_703900 ) ( ON ?auto_703898 ?auto_703899 ) ( ON ?auto_703897 ?auto_703898 ) ( CLEAR ?auto_703895 ) ( ON ?auto_703896 ?auto_703897 ) ( CLEAR ?auto_703896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_703894 ?auto_703895 ?auto_703896 )
      ( MAKE-10PILE ?auto_703894 ?auto_703895 ?auto_703896 ?auto_703897 ?auto_703898 ?auto_703899 ?auto_703900 ?auto_703901 ?auto_703902 ?auto_703903 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703936 - BLOCK
      ?auto_703937 - BLOCK
      ?auto_703938 - BLOCK
      ?auto_703939 - BLOCK
      ?auto_703940 - BLOCK
      ?auto_703941 - BLOCK
      ?auto_703942 - BLOCK
      ?auto_703943 - BLOCK
      ?auto_703944 - BLOCK
      ?auto_703945 - BLOCK
    )
    :vars
    (
      ?auto_703946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703945 ?auto_703946 ) ( ON-TABLE ?auto_703936 ) ( not ( = ?auto_703936 ?auto_703937 ) ) ( not ( = ?auto_703936 ?auto_703938 ) ) ( not ( = ?auto_703936 ?auto_703939 ) ) ( not ( = ?auto_703936 ?auto_703940 ) ) ( not ( = ?auto_703936 ?auto_703941 ) ) ( not ( = ?auto_703936 ?auto_703942 ) ) ( not ( = ?auto_703936 ?auto_703943 ) ) ( not ( = ?auto_703936 ?auto_703944 ) ) ( not ( = ?auto_703936 ?auto_703945 ) ) ( not ( = ?auto_703936 ?auto_703946 ) ) ( not ( = ?auto_703937 ?auto_703938 ) ) ( not ( = ?auto_703937 ?auto_703939 ) ) ( not ( = ?auto_703937 ?auto_703940 ) ) ( not ( = ?auto_703937 ?auto_703941 ) ) ( not ( = ?auto_703937 ?auto_703942 ) ) ( not ( = ?auto_703937 ?auto_703943 ) ) ( not ( = ?auto_703937 ?auto_703944 ) ) ( not ( = ?auto_703937 ?auto_703945 ) ) ( not ( = ?auto_703937 ?auto_703946 ) ) ( not ( = ?auto_703938 ?auto_703939 ) ) ( not ( = ?auto_703938 ?auto_703940 ) ) ( not ( = ?auto_703938 ?auto_703941 ) ) ( not ( = ?auto_703938 ?auto_703942 ) ) ( not ( = ?auto_703938 ?auto_703943 ) ) ( not ( = ?auto_703938 ?auto_703944 ) ) ( not ( = ?auto_703938 ?auto_703945 ) ) ( not ( = ?auto_703938 ?auto_703946 ) ) ( not ( = ?auto_703939 ?auto_703940 ) ) ( not ( = ?auto_703939 ?auto_703941 ) ) ( not ( = ?auto_703939 ?auto_703942 ) ) ( not ( = ?auto_703939 ?auto_703943 ) ) ( not ( = ?auto_703939 ?auto_703944 ) ) ( not ( = ?auto_703939 ?auto_703945 ) ) ( not ( = ?auto_703939 ?auto_703946 ) ) ( not ( = ?auto_703940 ?auto_703941 ) ) ( not ( = ?auto_703940 ?auto_703942 ) ) ( not ( = ?auto_703940 ?auto_703943 ) ) ( not ( = ?auto_703940 ?auto_703944 ) ) ( not ( = ?auto_703940 ?auto_703945 ) ) ( not ( = ?auto_703940 ?auto_703946 ) ) ( not ( = ?auto_703941 ?auto_703942 ) ) ( not ( = ?auto_703941 ?auto_703943 ) ) ( not ( = ?auto_703941 ?auto_703944 ) ) ( not ( = ?auto_703941 ?auto_703945 ) ) ( not ( = ?auto_703941 ?auto_703946 ) ) ( not ( = ?auto_703942 ?auto_703943 ) ) ( not ( = ?auto_703942 ?auto_703944 ) ) ( not ( = ?auto_703942 ?auto_703945 ) ) ( not ( = ?auto_703942 ?auto_703946 ) ) ( not ( = ?auto_703943 ?auto_703944 ) ) ( not ( = ?auto_703943 ?auto_703945 ) ) ( not ( = ?auto_703943 ?auto_703946 ) ) ( not ( = ?auto_703944 ?auto_703945 ) ) ( not ( = ?auto_703944 ?auto_703946 ) ) ( not ( = ?auto_703945 ?auto_703946 ) ) ( ON ?auto_703944 ?auto_703945 ) ( ON ?auto_703943 ?auto_703944 ) ( ON ?auto_703942 ?auto_703943 ) ( ON ?auto_703941 ?auto_703942 ) ( ON ?auto_703940 ?auto_703941 ) ( ON ?auto_703939 ?auto_703940 ) ( ON ?auto_703938 ?auto_703939 ) ( CLEAR ?auto_703936 ) ( ON ?auto_703937 ?auto_703938 ) ( CLEAR ?auto_703937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_703936 ?auto_703937 )
      ( MAKE-10PILE ?auto_703936 ?auto_703937 ?auto_703938 ?auto_703939 ?auto_703940 ?auto_703941 ?auto_703942 ?auto_703943 ?auto_703944 ?auto_703945 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_703978 - BLOCK
      ?auto_703979 - BLOCK
      ?auto_703980 - BLOCK
      ?auto_703981 - BLOCK
      ?auto_703982 - BLOCK
      ?auto_703983 - BLOCK
      ?auto_703984 - BLOCK
      ?auto_703985 - BLOCK
      ?auto_703986 - BLOCK
      ?auto_703987 - BLOCK
    )
    :vars
    (
      ?auto_703988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_703987 ?auto_703988 ) ( not ( = ?auto_703978 ?auto_703979 ) ) ( not ( = ?auto_703978 ?auto_703980 ) ) ( not ( = ?auto_703978 ?auto_703981 ) ) ( not ( = ?auto_703978 ?auto_703982 ) ) ( not ( = ?auto_703978 ?auto_703983 ) ) ( not ( = ?auto_703978 ?auto_703984 ) ) ( not ( = ?auto_703978 ?auto_703985 ) ) ( not ( = ?auto_703978 ?auto_703986 ) ) ( not ( = ?auto_703978 ?auto_703987 ) ) ( not ( = ?auto_703978 ?auto_703988 ) ) ( not ( = ?auto_703979 ?auto_703980 ) ) ( not ( = ?auto_703979 ?auto_703981 ) ) ( not ( = ?auto_703979 ?auto_703982 ) ) ( not ( = ?auto_703979 ?auto_703983 ) ) ( not ( = ?auto_703979 ?auto_703984 ) ) ( not ( = ?auto_703979 ?auto_703985 ) ) ( not ( = ?auto_703979 ?auto_703986 ) ) ( not ( = ?auto_703979 ?auto_703987 ) ) ( not ( = ?auto_703979 ?auto_703988 ) ) ( not ( = ?auto_703980 ?auto_703981 ) ) ( not ( = ?auto_703980 ?auto_703982 ) ) ( not ( = ?auto_703980 ?auto_703983 ) ) ( not ( = ?auto_703980 ?auto_703984 ) ) ( not ( = ?auto_703980 ?auto_703985 ) ) ( not ( = ?auto_703980 ?auto_703986 ) ) ( not ( = ?auto_703980 ?auto_703987 ) ) ( not ( = ?auto_703980 ?auto_703988 ) ) ( not ( = ?auto_703981 ?auto_703982 ) ) ( not ( = ?auto_703981 ?auto_703983 ) ) ( not ( = ?auto_703981 ?auto_703984 ) ) ( not ( = ?auto_703981 ?auto_703985 ) ) ( not ( = ?auto_703981 ?auto_703986 ) ) ( not ( = ?auto_703981 ?auto_703987 ) ) ( not ( = ?auto_703981 ?auto_703988 ) ) ( not ( = ?auto_703982 ?auto_703983 ) ) ( not ( = ?auto_703982 ?auto_703984 ) ) ( not ( = ?auto_703982 ?auto_703985 ) ) ( not ( = ?auto_703982 ?auto_703986 ) ) ( not ( = ?auto_703982 ?auto_703987 ) ) ( not ( = ?auto_703982 ?auto_703988 ) ) ( not ( = ?auto_703983 ?auto_703984 ) ) ( not ( = ?auto_703983 ?auto_703985 ) ) ( not ( = ?auto_703983 ?auto_703986 ) ) ( not ( = ?auto_703983 ?auto_703987 ) ) ( not ( = ?auto_703983 ?auto_703988 ) ) ( not ( = ?auto_703984 ?auto_703985 ) ) ( not ( = ?auto_703984 ?auto_703986 ) ) ( not ( = ?auto_703984 ?auto_703987 ) ) ( not ( = ?auto_703984 ?auto_703988 ) ) ( not ( = ?auto_703985 ?auto_703986 ) ) ( not ( = ?auto_703985 ?auto_703987 ) ) ( not ( = ?auto_703985 ?auto_703988 ) ) ( not ( = ?auto_703986 ?auto_703987 ) ) ( not ( = ?auto_703986 ?auto_703988 ) ) ( not ( = ?auto_703987 ?auto_703988 ) ) ( ON ?auto_703986 ?auto_703987 ) ( ON ?auto_703985 ?auto_703986 ) ( ON ?auto_703984 ?auto_703985 ) ( ON ?auto_703983 ?auto_703984 ) ( ON ?auto_703982 ?auto_703983 ) ( ON ?auto_703981 ?auto_703982 ) ( ON ?auto_703980 ?auto_703981 ) ( ON ?auto_703979 ?auto_703980 ) ( ON ?auto_703978 ?auto_703979 ) ( CLEAR ?auto_703978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_703978 )
      ( MAKE-10PILE ?auto_703978 ?auto_703979 ?auto_703980 ?auto_703981 ?auto_703982 ?auto_703983 ?auto_703984 ?auto_703985 ?auto_703986 ?auto_703987 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704021 - BLOCK
      ?auto_704022 - BLOCK
      ?auto_704023 - BLOCK
      ?auto_704024 - BLOCK
      ?auto_704025 - BLOCK
      ?auto_704026 - BLOCK
      ?auto_704027 - BLOCK
      ?auto_704028 - BLOCK
      ?auto_704029 - BLOCK
      ?auto_704030 - BLOCK
      ?auto_704031 - BLOCK
    )
    :vars
    (
      ?auto_704032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_704030 ) ( ON ?auto_704031 ?auto_704032 ) ( CLEAR ?auto_704031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_704021 ) ( ON ?auto_704022 ?auto_704021 ) ( ON ?auto_704023 ?auto_704022 ) ( ON ?auto_704024 ?auto_704023 ) ( ON ?auto_704025 ?auto_704024 ) ( ON ?auto_704026 ?auto_704025 ) ( ON ?auto_704027 ?auto_704026 ) ( ON ?auto_704028 ?auto_704027 ) ( ON ?auto_704029 ?auto_704028 ) ( ON ?auto_704030 ?auto_704029 ) ( not ( = ?auto_704021 ?auto_704022 ) ) ( not ( = ?auto_704021 ?auto_704023 ) ) ( not ( = ?auto_704021 ?auto_704024 ) ) ( not ( = ?auto_704021 ?auto_704025 ) ) ( not ( = ?auto_704021 ?auto_704026 ) ) ( not ( = ?auto_704021 ?auto_704027 ) ) ( not ( = ?auto_704021 ?auto_704028 ) ) ( not ( = ?auto_704021 ?auto_704029 ) ) ( not ( = ?auto_704021 ?auto_704030 ) ) ( not ( = ?auto_704021 ?auto_704031 ) ) ( not ( = ?auto_704021 ?auto_704032 ) ) ( not ( = ?auto_704022 ?auto_704023 ) ) ( not ( = ?auto_704022 ?auto_704024 ) ) ( not ( = ?auto_704022 ?auto_704025 ) ) ( not ( = ?auto_704022 ?auto_704026 ) ) ( not ( = ?auto_704022 ?auto_704027 ) ) ( not ( = ?auto_704022 ?auto_704028 ) ) ( not ( = ?auto_704022 ?auto_704029 ) ) ( not ( = ?auto_704022 ?auto_704030 ) ) ( not ( = ?auto_704022 ?auto_704031 ) ) ( not ( = ?auto_704022 ?auto_704032 ) ) ( not ( = ?auto_704023 ?auto_704024 ) ) ( not ( = ?auto_704023 ?auto_704025 ) ) ( not ( = ?auto_704023 ?auto_704026 ) ) ( not ( = ?auto_704023 ?auto_704027 ) ) ( not ( = ?auto_704023 ?auto_704028 ) ) ( not ( = ?auto_704023 ?auto_704029 ) ) ( not ( = ?auto_704023 ?auto_704030 ) ) ( not ( = ?auto_704023 ?auto_704031 ) ) ( not ( = ?auto_704023 ?auto_704032 ) ) ( not ( = ?auto_704024 ?auto_704025 ) ) ( not ( = ?auto_704024 ?auto_704026 ) ) ( not ( = ?auto_704024 ?auto_704027 ) ) ( not ( = ?auto_704024 ?auto_704028 ) ) ( not ( = ?auto_704024 ?auto_704029 ) ) ( not ( = ?auto_704024 ?auto_704030 ) ) ( not ( = ?auto_704024 ?auto_704031 ) ) ( not ( = ?auto_704024 ?auto_704032 ) ) ( not ( = ?auto_704025 ?auto_704026 ) ) ( not ( = ?auto_704025 ?auto_704027 ) ) ( not ( = ?auto_704025 ?auto_704028 ) ) ( not ( = ?auto_704025 ?auto_704029 ) ) ( not ( = ?auto_704025 ?auto_704030 ) ) ( not ( = ?auto_704025 ?auto_704031 ) ) ( not ( = ?auto_704025 ?auto_704032 ) ) ( not ( = ?auto_704026 ?auto_704027 ) ) ( not ( = ?auto_704026 ?auto_704028 ) ) ( not ( = ?auto_704026 ?auto_704029 ) ) ( not ( = ?auto_704026 ?auto_704030 ) ) ( not ( = ?auto_704026 ?auto_704031 ) ) ( not ( = ?auto_704026 ?auto_704032 ) ) ( not ( = ?auto_704027 ?auto_704028 ) ) ( not ( = ?auto_704027 ?auto_704029 ) ) ( not ( = ?auto_704027 ?auto_704030 ) ) ( not ( = ?auto_704027 ?auto_704031 ) ) ( not ( = ?auto_704027 ?auto_704032 ) ) ( not ( = ?auto_704028 ?auto_704029 ) ) ( not ( = ?auto_704028 ?auto_704030 ) ) ( not ( = ?auto_704028 ?auto_704031 ) ) ( not ( = ?auto_704028 ?auto_704032 ) ) ( not ( = ?auto_704029 ?auto_704030 ) ) ( not ( = ?auto_704029 ?auto_704031 ) ) ( not ( = ?auto_704029 ?auto_704032 ) ) ( not ( = ?auto_704030 ?auto_704031 ) ) ( not ( = ?auto_704030 ?auto_704032 ) ) ( not ( = ?auto_704031 ?auto_704032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_704031 ?auto_704032 )
      ( !STACK ?auto_704031 ?auto_704030 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704067 - BLOCK
      ?auto_704068 - BLOCK
      ?auto_704069 - BLOCK
      ?auto_704070 - BLOCK
      ?auto_704071 - BLOCK
      ?auto_704072 - BLOCK
      ?auto_704073 - BLOCK
      ?auto_704074 - BLOCK
      ?auto_704075 - BLOCK
      ?auto_704076 - BLOCK
      ?auto_704077 - BLOCK
    )
    :vars
    (
      ?auto_704078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704077 ?auto_704078 ) ( ON-TABLE ?auto_704067 ) ( ON ?auto_704068 ?auto_704067 ) ( ON ?auto_704069 ?auto_704068 ) ( ON ?auto_704070 ?auto_704069 ) ( ON ?auto_704071 ?auto_704070 ) ( ON ?auto_704072 ?auto_704071 ) ( ON ?auto_704073 ?auto_704072 ) ( ON ?auto_704074 ?auto_704073 ) ( ON ?auto_704075 ?auto_704074 ) ( not ( = ?auto_704067 ?auto_704068 ) ) ( not ( = ?auto_704067 ?auto_704069 ) ) ( not ( = ?auto_704067 ?auto_704070 ) ) ( not ( = ?auto_704067 ?auto_704071 ) ) ( not ( = ?auto_704067 ?auto_704072 ) ) ( not ( = ?auto_704067 ?auto_704073 ) ) ( not ( = ?auto_704067 ?auto_704074 ) ) ( not ( = ?auto_704067 ?auto_704075 ) ) ( not ( = ?auto_704067 ?auto_704076 ) ) ( not ( = ?auto_704067 ?auto_704077 ) ) ( not ( = ?auto_704067 ?auto_704078 ) ) ( not ( = ?auto_704068 ?auto_704069 ) ) ( not ( = ?auto_704068 ?auto_704070 ) ) ( not ( = ?auto_704068 ?auto_704071 ) ) ( not ( = ?auto_704068 ?auto_704072 ) ) ( not ( = ?auto_704068 ?auto_704073 ) ) ( not ( = ?auto_704068 ?auto_704074 ) ) ( not ( = ?auto_704068 ?auto_704075 ) ) ( not ( = ?auto_704068 ?auto_704076 ) ) ( not ( = ?auto_704068 ?auto_704077 ) ) ( not ( = ?auto_704068 ?auto_704078 ) ) ( not ( = ?auto_704069 ?auto_704070 ) ) ( not ( = ?auto_704069 ?auto_704071 ) ) ( not ( = ?auto_704069 ?auto_704072 ) ) ( not ( = ?auto_704069 ?auto_704073 ) ) ( not ( = ?auto_704069 ?auto_704074 ) ) ( not ( = ?auto_704069 ?auto_704075 ) ) ( not ( = ?auto_704069 ?auto_704076 ) ) ( not ( = ?auto_704069 ?auto_704077 ) ) ( not ( = ?auto_704069 ?auto_704078 ) ) ( not ( = ?auto_704070 ?auto_704071 ) ) ( not ( = ?auto_704070 ?auto_704072 ) ) ( not ( = ?auto_704070 ?auto_704073 ) ) ( not ( = ?auto_704070 ?auto_704074 ) ) ( not ( = ?auto_704070 ?auto_704075 ) ) ( not ( = ?auto_704070 ?auto_704076 ) ) ( not ( = ?auto_704070 ?auto_704077 ) ) ( not ( = ?auto_704070 ?auto_704078 ) ) ( not ( = ?auto_704071 ?auto_704072 ) ) ( not ( = ?auto_704071 ?auto_704073 ) ) ( not ( = ?auto_704071 ?auto_704074 ) ) ( not ( = ?auto_704071 ?auto_704075 ) ) ( not ( = ?auto_704071 ?auto_704076 ) ) ( not ( = ?auto_704071 ?auto_704077 ) ) ( not ( = ?auto_704071 ?auto_704078 ) ) ( not ( = ?auto_704072 ?auto_704073 ) ) ( not ( = ?auto_704072 ?auto_704074 ) ) ( not ( = ?auto_704072 ?auto_704075 ) ) ( not ( = ?auto_704072 ?auto_704076 ) ) ( not ( = ?auto_704072 ?auto_704077 ) ) ( not ( = ?auto_704072 ?auto_704078 ) ) ( not ( = ?auto_704073 ?auto_704074 ) ) ( not ( = ?auto_704073 ?auto_704075 ) ) ( not ( = ?auto_704073 ?auto_704076 ) ) ( not ( = ?auto_704073 ?auto_704077 ) ) ( not ( = ?auto_704073 ?auto_704078 ) ) ( not ( = ?auto_704074 ?auto_704075 ) ) ( not ( = ?auto_704074 ?auto_704076 ) ) ( not ( = ?auto_704074 ?auto_704077 ) ) ( not ( = ?auto_704074 ?auto_704078 ) ) ( not ( = ?auto_704075 ?auto_704076 ) ) ( not ( = ?auto_704075 ?auto_704077 ) ) ( not ( = ?auto_704075 ?auto_704078 ) ) ( not ( = ?auto_704076 ?auto_704077 ) ) ( not ( = ?auto_704076 ?auto_704078 ) ) ( not ( = ?auto_704077 ?auto_704078 ) ) ( CLEAR ?auto_704075 ) ( ON ?auto_704076 ?auto_704077 ) ( CLEAR ?auto_704076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_704067 ?auto_704068 ?auto_704069 ?auto_704070 ?auto_704071 ?auto_704072 ?auto_704073 ?auto_704074 ?auto_704075 ?auto_704076 )
      ( MAKE-11PILE ?auto_704067 ?auto_704068 ?auto_704069 ?auto_704070 ?auto_704071 ?auto_704072 ?auto_704073 ?auto_704074 ?auto_704075 ?auto_704076 ?auto_704077 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704113 - BLOCK
      ?auto_704114 - BLOCK
      ?auto_704115 - BLOCK
      ?auto_704116 - BLOCK
      ?auto_704117 - BLOCK
      ?auto_704118 - BLOCK
      ?auto_704119 - BLOCK
      ?auto_704120 - BLOCK
      ?auto_704121 - BLOCK
      ?auto_704122 - BLOCK
      ?auto_704123 - BLOCK
    )
    :vars
    (
      ?auto_704124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704123 ?auto_704124 ) ( ON-TABLE ?auto_704113 ) ( ON ?auto_704114 ?auto_704113 ) ( ON ?auto_704115 ?auto_704114 ) ( ON ?auto_704116 ?auto_704115 ) ( ON ?auto_704117 ?auto_704116 ) ( ON ?auto_704118 ?auto_704117 ) ( ON ?auto_704119 ?auto_704118 ) ( ON ?auto_704120 ?auto_704119 ) ( not ( = ?auto_704113 ?auto_704114 ) ) ( not ( = ?auto_704113 ?auto_704115 ) ) ( not ( = ?auto_704113 ?auto_704116 ) ) ( not ( = ?auto_704113 ?auto_704117 ) ) ( not ( = ?auto_704113 ?auto_704118 ) ) ( not ( = ?auto_704113 ?auto_704119 ) ) ( not ( = ?auto_704113 ?auto_704120 ) ) ( not ( = ?auto_704113 ?auto_704121 ) ) ( not ( = ?auto_704113 ?auto_704122 ) ) ( not ( = ?auto_704113 ?auto_704123 ) ) ( not ( = ?auto_704113 ?auto_704124 ) ) ( not ( = ?auto_704114 ?auto_704115 ) ) ( not ( = ?auto_704114 ?auto_704116 ) ) ( not ( = ?auto_704114 ?auto_704117 ) ) ( not ( = ?auto_704114 ?auto_704118 ) ) ( not ( = ?auto_704114 ?auto_704119 ) ) ( not ( = ?auto_704114 ?auto_704120 ) ) ( not ( = ?auto_704114 ?auto_704121 ) ) ( not ( = ?auto_704114 ?auto_704122 ) ) ( not ( = ?auto_704114 ?auto_704123 ) ) ( not ( = ?auto_704114 ?auto_704124 ) ) ( not ( = ?auto_704115 ?auto_704116 ) ) ( not ( = ?auto_704115 ?auto_704117 ) ) ( not ( = ?auto_704115 ?auto_704118 ) ) ( not ( = ?auto_704115 ?auto_704119 ) ) ( not ( = ?auto_704115 ?auto_704120 ) ) ( not ( = ?auto_704115 ?auto_704121 ) ) ( not ( = ?auto_704115 ?auto_704122 ) ) ( not ( = ?auto_704115 ?auto_704123 ) ) ( not ( = ?auto_704115 ?auto_704124 ) ) ( not ( = ?auto_704116 ?auto_704117 ) ) ( not ( = ?auto_704116 ?auto_704118 ) ) ( not ( = ?auto_704116 ?auto_704119 ) ) ( not ( = ?auto_704116 ?auto_704120 ) ) ( not ( = ?auto_704116 ?auto_704121 ) ) ( not ( = ?auto_704116 ?auto_704122 ) ) ( not ( = ?auto_704116 ?auto_704123 ) ) ( not ( = ?auto_704116 ?auto_704124 ) ) ( not ( = ?auto_704117 ?auto_704118 ) ) ( not ( = ?auto_704117 ?auto_704119 ) ) ( not ( = ?auto_704117 ?auto_704120 ) ) ( not ( = ?auto_704117 ?auto_704121 ) ) ( not ( = ?auto_704117 ?auto_704122 ) ) ( not ( = ?auto_704117 ?auto_704123 ) ) ( not ( = ?auto_704117 ?auto_704124 ) ) ( not ( = ?auto_704118 ?auto_704119 ) ) ( not ( = ?auto_704118 ?auto_704120 ) ) ( not ( = ?auto_704118 ?auto_704121 ) ) ( not ( = ?auto_704118 ?auto_704122 ) ) ( not ( = ?auto_704118 ?auto_704123 ) ) ( not ( = ?auto_704118 ?auto_704124 ) ) ( not ( = ?auto_704119 ?auto_704120 ) ) ( not ( = ?auto_704119 ?auto_704121 ) ) ( not ( = ?auto_704119 ?auto_704122 ) ) ( not ( = ?auto_704119 ?auto_704123 ) ) ( not ( = ?auto_704119 ?auto_704124 ) ) ( not ( = ?auto_704120 ?auto_704121 ) ) ( not ( = ?auto_704120 ?auto_704122 ) ) ( not ( = ?auto_704120 ?auto_704123 ) ) ( not ( = ?auto_704120 ?auto_704124 ) ) ( not ( = ?auto_704121 ?auto_704122 ) ) ( not ( = ?auto_704121 ?auto_704123 ) ) ( not ( = ?auto_704121 ?auto_704124 ) ) ( not ( = ?auto_704122 ?auto_704123 ) ) ( not ( = ?auto_704122 ?auto_704124 ) ) ( not ( = ?auto_704123 ?auto_704124 ) ) ( ON ?auto_704122 ?auto_704123 ) ( CLEAR ?auto_704120 ) ( ON ?auto_704121 ?auto_704122 ) ( CLEAR ?auto_704121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_704113 ?auto_704114 ?auto_704115 ?auto_704116 ?auto_704117 ?auto_704118 ?auto_704119 ?auto_704120 ?auto_704121 )
      ( MAKE-11PILE ?auto_704113 ?auto_704114 ?auto_704115 ?auto_704116 ?auto_704117 ?auto_704118 ?auto_704119 ?auto_704120 ?auto_704121 ?auto_704122 ?auto_704123 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704159 - BLOCK
      ?auto_704160 - BLOCK
      ?auto_704161 - BLOCK
      ?auto_704162 - BLOCK
      ?auto_704163 - BLOCK
      ?auto_704164 - BLOCK
      ?auto_704165 - BLOCK
      ?auto_704166 - BLOCK
      ?auto_704167 - BLOCK
      ?auto_704168 - BLOCK
      ?auto_704169 - BLOCK
    )
    :vars
    (
      ?auto_704170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704169 ?auto_704170 ) ( ON-TABLE ?auto_704159 ) ( ON ?auto_704160 ?auto_704159 ) ( ON ?auto_704161 ?auto_704160 ) ( ON ?auto_704162 ?auto_704161 ) ( ON ?auto_704163 ?auto_704162 ) ( ON ?auto_704164 ?auto_704163 ) ( ON ?auto_704165 ?auto_704164 ) ( not ( = ?auto_704159 ?auto_704160 ) ) ( not ( = ?auto_704159 ?auto_704161 ) ) ( not ( = ?auto_704159 ?auto_704162 ) ) ( not ( = ?auto_704159 ?auto_704163 ) ) ( not ( = ?auto_704159 ?auto_704164 ) ) ( not ( = ?auto_704159 ?auto_704165 ) ) ( not ( = ?auto_704159 ?auto_704166 ) ) ( not ( = ?auto_704159 ?auto_704167 ) ) ( not ( = ?auto_704159 ?auto_704168 ) ) ( not ( = ?auto_704159 ?auto_704169 ) ) ( not ( = ?auto_704159 ?auto_704170 ) ) ( not ( = ?auto_704160 ?auto_704161 ) ) ( not ( = ?auto_704160 ?auto_704162 ) ) ( not ( = ?auto_704160 ?auto_704163 ) ) ( not ( = ?auto_704160 ?auto_704164 ) ) ( not ( = ?auto_704160 ?auto_704165 ) ) ( not ( = ?auto_704160 ?auto_704166 ) ) ( not ( = ?auto_704160 ?auto_704167 ) ) ( not ( = ?auto_704160 ?auto_704168 ) ) ( not ( = ?auto_704160 ?auto_704169 ) ) ( not ( = ?auto_704160 ?auto_704170 ) ) ( not ( = ?auto_704161 ?auto_704162 ) ) ( not ( = ?auto_704161 ?auto_704163 ) ) ( not ( = ?auto_704161 ?auto_704164 ) ) ( not ( = ?auto_704161 ?auto_704165 ) ) ( not ( = ?auto_704161 ?auto_704166 ) ) ( not ( = ?auto_704161 ?auto_704167 ) ) ( not ( = ?auto_704161 ?auto_704168 ) ) ( not ( = ?auto_704161 ?auto_704169 ) ) ( not ( = ?auto_704161 ?auto_704170 ) ) ( not ( = ?auto_704162 ?auto_704163 ) ) ( not ( = ?auto_704162 ?auto_704164 ) ) ( not ( = ?auto_704162 ?auto_704165 ) ) ( not ( = ?auto_704162 ?auto_704166 ) ) ( not ( = ?auto_704162 ?auto_704167 ) ) ( not ( = ?auto_704162 ?auto_704168 ) ) ( not ( = ?auto_704162 ?auto_704169 ) ) ( not ( = ?auto_704162 ?auto_704170 ) ) ( not ( = ?auto_704163 ?auto_704164 ) ) ( not ( = ?auto_704163 ?auto_704165 ) ) ( not ( = ?auto_704163 ?auto_704166 ) ) ( not ( = ?auto_704163 ?auto_704167 ) ) ( not ( = ?auto_704163 ?auto_704168 ) ) ( not ( = ?auto_704163 ?auto_704169 ) ) ( not ( = ?auto_704163 ?auto_704170 ) ) ( not ( = ?auto_704164 ?auto_704165 ) ) ( not ( = ?auto_704164 ?auto_704166 ) ) ( not ( = ?auto_704164 ?auto_704167 ) ) ( not ( = ?auto_704164 ?auto_704168 ) ) ( not ( = ?auto_704164 ?auto_704169 ) ) ( not ( = ?auto_704164 ?auto_704170 ) ) ( not ( = ?auto_704165 ?auto_704166 ) ) ( not ( = ?auto_704165 ?auto_704167 ) ) ( not ( = ?auto_704165 ?auto_704168 ) ) ( not ( = ?auto_704165 ?auto_704169 ) ) ( not ( = ?auto_704165 ?auto_704170 ) ) ( not ( = ?auto_704166 ?auto_704167 ) ) ( not ( = ?auto_704166 ?auto_704168 ) ) ( not ( = ?auto_704166 ?auto_704169 ) ) ( not ( = ?auto_704166 ?auto_704170 ) ) ( not ( = ?auto_704167 ?auto_704168 ) ) ( not ( = ?auto_704167 ?auto_704169 ) ) ( not ( = ?auto_704167 ?auto_704170 ) ) ( not ( = ?auto_704168 ?auto_704169 ) ) ( not ( = ?auto_704168 ?auto_704170 ) ) ( not ( = ?auto_704169 ?auto_704170 ) ) ( ON ?auto_704168 ?auto_704169 ) ( ON ?auto_704167 ?auto_704168 ) ( CLEAR ?auto_704165 ) ( ON ?auto_704166 ?auto_704167 ) ( CLEAR ?auto_704166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_704159 ?auto_704160 ?auto_704161 ?auto_704162 ?auto_704163 ?auto_704164 ?auto_704165 ?auto_704166 )
      ( MAKE-11PILE ?auto_704159 ?auto_704160 ?auto_704161 ?auto_704162 ?auto_704163 ?auto_704164 ?auto_704165 ?auto_704166 ?auto_704167 ?auto_704168 ?auto_704169 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704205 - BLOCK
      ?auto_704206 - BLOCK
      ?auto_704207 - BLOCK
      ?auto_704208 - BLOCK
      ?auto_704209 - BLOCK
      ?auto_704210 - BLOCK
      ?auto_704211 - BLOCK
      ?auto_704212 - BLOCK
      ?auto_704213 - BLOCK
      ?auto_704214 - BLOCK
      ?auto_704215 - BLOCK
    )
    :vars
    (
      ?auto_704216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704215 ?auto_704216 ) ( ON-TABLE ?auto_704205 ) ( ON ?auto_704206 ?auto_704205 ) ( ON ?auto_704207 ?auto_704206 ) ( ON ?auto_704208 ?auto_704207 ) ( ON ?auto_704209 ?auto_704208 ) ( ON ?auto_704210 ?auto_704209 ) ( not ( = ?auto_704205 ?auto_704206 ) ) ( not ( = ?auto_704205 ?auto_704207 ) ) ( not ( = ?auto_704205 ?auto_704208 ) ) ( not ( = ?auto_704205 ?auto_704209 ) ) ( not ( = ?auto_704205 ?auto_704210 ) ) ( not ( = ?auto_704205 ?auto_704211 ) ) ( not ( = ?auto_704205 ?auto_704212 ) ) ( not ( = ?auto_704205 ?auto_704213 ) ) ( not ( = ?auto_704205 ?auto_704214 ) ) ( not ( = ?auto_704205 ?auto_704215 ) ) ( not ( = ?auto_704205 ?auto_704216 ) ) ( not ( = ?auto_704206 ?auto_704207 ) ) ( not ( = ?auto_704206 ?auto_704208 ) ) ( not ( = ?auto_704206 ?auto_704209 ) ) ( not ( = ?auto_704206 ?auto_704210 ) ) ( not ( = ?auto_704206 ?auto_704211 ) ) ( not ( = ?auto_704206 ?auto_704212 ) ) ( not ( = ?auto_704206 ?auto_704213 ) ) ( not ( = ?auto_704206 ?auto_704214 ) ) ( not ( = ?auto_704206 ?auto_704215 ) ) ( not ( = ?auto_704206 ?auto_704216 ) ) ( not ( = ?auto_704207 ?auto_704208 ) ) ( not ( = ?auto_704207 ?auto_704209 ) ) ( not ( = ?auto_704207 ?auto_704210 ) ) ( not ( = ?auto_704207 ?auto_704211 ) ) ( not ( = ?auto_704207 ?auto_704212 ) ) ( not ( = ?auto_704207 ?auto_704213 ) ) ( not ( = ?auto_704207 ?auto_704214 ) ) ( not ( = ?auto_704207 ?auto_704215 ) ) ( not ( = ?auto_704207 ?auto_704216 ) ) ( not ( = ?auto_704208 ?auto_704209 ) ) ( not ( = ?auto_704208 ?auto_704210 ) ) ( not ( = ?auto_704208 ?auto_704211 ) ) ( not ( = ?auto_704208 ?auto_704212 ) ) ( not ( = ?auto_704208 ?auto_704213 ) ) ( not ( = ?auto_704208 ?auto_704214 ) ) ( not ( = ?auto_704208 ?auto_704215 ) ) ( not ( = ?auto_704208 ?auto_704216 ) ) ( not ( = ?auto_704209 ?auto_704210 ) ) ( not ( = ?auto_704209 ?auto_704211 ) ) ( not ( = ?auto_704209 ?auto_704212 ) ) ( not ( = ?auto_704209 ?auto_704213 ) ) ( not ( = ?auto_704209 ?auto_704214 ) ) ( not ( = ?auto_704209 ?auto_704215 ) ) ( not ( = ?auto_704209 ?auto_704216 ) ) ( not ( = ?auto_704210 ?auto_704211 ) ) ( not ( = ?auto_704210 ?auto_704212 ) ) ( not ( = ?auto_704210 ?auto_704213 ) ) ( not ( = ?auto_704210 ?auto_704214 ) ) ( not ( = ?auto_704210 ?auto_704215 ) ) ( not ( = ?auto_704210 ?auto_704216 ) ) ( not ( = ?auto_704211 ?auto_704212 ) ) ( not ( = ?auto_704211 ?auto_704213 ) ) ( not ( = ?auto_704211 ?auto_704214 ) ) ( not ( = ?auto_704211 ?auto_704215 ) ) ( not ( = ?auto_704211 ?auto_704216 ) ) ( not ( = ?auto_704212 ?auto_704213 ) ) ( not ( = ?auto_704212 ?auto_704214 ) ) ( not ( = ?auto_704212 ?auto_704215 ) ) ( not ( = ?auto_704212 ?auto_704216 ) ) ( not ( = ?auto_704213 ?auto_704214 ) ) ( not ( = ?auto_704213 ?auto_704215 ) ) ( not ( = ?auto_704213 ?auto_704216 ) ) ( not ( = ?auto_704214 ?auto_704215 ) ) ( not ( = ?auto_704214 ?auto_704216 ) ) ( not ( = ?auto_704215 ?auto_704216 ) ) ( ON ?auto_704214 ?auto_704215 ) ( ON ?auto_704213 ?auto_704214 ) ( ON ?auto_704212 ?auto_704213 ) ( CLEAR ?auto_704210 ) ( ON ?auto_704211 ?auto_704212 ) ( CLEAR ?auto_704211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_704205 ?auto_704206 ?auto_704207 ?auto_704208 ?auto_704209 ?auto_704210 ?auto_704211 )
      ( MAKE-11PILE ?auto_704205 ?auto_704206 ?auto_704207 ?auto_704208 ?auto_704209 ?auto_704210 ?auto_704211 ?auto_704212 ?auto_704213 ?auto_704214 ?auto_704215 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704251 - BLOCK
      ?auto_704252 - BLOCK
      ?auto_704253 - BLOCK
      ?auto_704254 - BLOCK
      ?auto_704255 - BLOCK
      ?auto_704256 - BLOCK
      ?auto_704257 - BLOCK
      ?auto_704258 - BLOCK
      ?auto_704259 - BLOCK
      ?auto_704260 - BLOCK
      ?auto_704261 - BLOCK
    )
    :vars
    (
      ?auto_704262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704261 ?auto_704262 ) ( ON-TABLE ?auto_704251 ) ( ON ?auto_704252 ?auto_704251 ) ( ON ?auto_704253 ?auto_704252 ) ( ON ?auto_704254 ?auto_704253 ) ( ON ?auto_704255 ?auto_704254 ) ( not ( = ?auto_704251 ?auto_704252 ) ) ( not ( = ?auto_704251 ?auto_704253 ) ) ( not ( = ?auto_704251 ?auto_704254 ) ) ( not ( = ?auto_704251 ?auto_704255 ) ) ( not ( = ?auto_704251 ?auto_704256 ) ) ( not ( = ?auto_704251 ?auto_704257 ) ) ( not ( = ?auto_704251 ?auto_704258 ) ) ( not ( = ?auto_704251 ?auto_704259 ) ) ( not ( = ?auto_704251 ?auto_704260 ) ) ( not ( = ?auto_704251 ?auto_704261 ) ) ( not ( = ?auto_704251 ?auto_704262 ) ) ( not ( = ?auto_704252 ?auto_704253 ) ) ( not ( = ?auto_704252 ?auto_704254 ) ) ( not ( = ?auto_704252 ?auto_704255 ) ) ( not ( = ?auto_704252 ?auto_704256 ) ) ( not ( = ?auto_704252 ?auto_704257 ) ) ( not ( = ?auto_704252 ?auto_704258 ) ) ( not ( = ?auto_704252 ?auto_704259 ) ) ( not ( = ?auto_704252 ?auto_704260 ) ) ( not ( = ?auto_704252 ?auto_704261 ) ) ( not ( = ?auto_704252 ?auto_704262 ) ) ( not ( = ?auto_704253 ?auto_704254 ) ) ( not ( = ?auto_704253 ?auto_704255 ) ) ( not ( = ?auto_704253 ?auto_704256 ) ) ( not ( = ?auto_704253 ?auto_704257 ) ) ( not ( = ?auto_704253 ?auto_704258 ) ) ( not ( = ?auto_704253 ?auto_704259 ) ) ( not ( = ?auto_704253 ?auto_704260 ) ) ( not ( = ?auto_704253 ?auto_704261 ) ) ( not ( = ?auto_704253 ?auto_704262 ) ) ( not ( = ?auto_704254 ?auto_704255 ) ) ( not ( = ?auto_704254 ?auto_704256 ) ) ( not ( = ?auto_704254 ?auto_704257 ) ) ( not ( = ?auto_704254 ?auto_704258 ) ) ( not ( = ?auto_704254 ?auto_704259 ) ) ( not ( = ?auto_704254 ?auto_704260 ) ) ( not ( = ?auto_704254 ?auto_704261 ) ) ( not ( = ?auto_704254 ?auto_704262 ) ) ( not ( = ?auto_704255 ?auto_704256 ) ) ( not ( = ?auto_704255 ?auto_704257 ) ) ( not ( = ?auto_704255 ?auto_704258 ) ) ( not ( = ?auto_704255 ?auto_704259 ) ) ( not ( = ?auto_704255 ?auto_704260 ) ) ( not ( = ?auto_704255 ?auto_704261 ) ) ( not ( = ?auto_704255 ?auto_704262 ) ) ( not ( = ?auto_704256 ?auto_704257 ) ) ( not ( = ?auto_704256 ?auto_704258 ) ) ( not ( = ?auto_704256 ?auto_704259 ) ) ( not ( = ?auto_704256 ?auto_704260 ) ) ( not ( = ?auto_704256 ?auto_704261 ) ) ( not ( = ?auto_704256 ?auto_704262 ) ) ( not ( = ?auto_704257 ?auto_704258 ) ) ( not ( = ?auto_704257 ?auto_704259 ) ) ( not ( = ?auto_704257 ?auto_704260 ) ) ( not ( = ?auto_704257 ?auto_704261 ) ) ( not ( = ?auto_704257 ?auto_704262 ) ) ( not ( = ?auto_704258 ?auto_704259 ) ) ( not ( = ?auto_704258 ?auto_704260 ) ) ( not ( = ?auto_704258 ?auto_704261 ) ) ( not ( = ?auto_704258 ?auto_704262 ) ) ( not ( = ?auto_704259 ?auto_704260 ) ) ( not ( = ?auto_704259 ?auto_704261 ) ) ( not ( = ?auto_704259 ?auto_704262 ) ) ( not ( = ?auto_704260 ?auto_704261 ) ) ( not ( = ?auto_704260 ?auto_704262 ) ) ( not ( = ?auto_704261 ?auto_704262 ) ) ( ON ?auto_704260 ?auto_704261 ) ( ON ?auto_704259 ?auto_704260 ) ( ON ?auto_704258 ?auto_704259 ) ( ON ?auto_704257 ?auto_704258 ) ( CLEAR ?auto_704255 ) ( ON ?auto_704256 ?auto_704257 ) ( CLEAR ?auto_704256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_704251 ?auto_704252 ?auto_704253 ?auto_704254 ?auto_704255 ?auto_704256 )
      ( MAKE-11PILE ?auto_704251 ?auto_704252 ?auto_704253 ?auto_704254 ?auto_704255 ?auto_704256 ?auto_704257 ?auto_704258 ?auto_704259 ?auto_704260 ?auto_704261 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704297 - BLOCK
      ?auto_704298 - BLOCK
      ?auto_704299 - BLOCK
      ?auto_704300 - BLOCK
      ?auto_704301 - BLOCK
      ?auto_704302 - BLOCK
      ?auto_704303 - BLOCK
      ?auto_704304 - BLOCK
      ?auto_704305 - BLOCK
      ?auto_704306 - BLOCK
      ?auto_704307 - BLOCK
    )
    :vars
    (
      ?auto_704308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704307 ?auto_704308 ) ( ON-TABLE ?auto_704297 ) ( ON ?auto_704298 ?auto_704297 ) ( ON ?auto_704299 ?auto_704298 ) ( ON ?auto_704300 ?auto_704299 ) ( not ( = ?auto_704297 ?auto_704298 ) ) ( not ( = ?auto_704297 ?auto_704299 ) ) ( not ( = ?auto_704297 ?auto_704300 ) ) ( not ( = ?auto_704297 ?auto_704301 ) ) ( not ( = ?auto_704297 ?auto_704302 ) ) ( not ( = ?auto_704297 ?auto_704303 ) ) ( not ( = ?auto_704297 ?auto_704304 ) ) ( not ( = ?auto_704297 ?auto_704305 ) ) ( not ( = ?auto_704297 ?auto_704306 ) ) ( not ( = ?auto_704297 ?auto_704307 ) ) ( not ( = ?auto_704297 ?auto_704308 ) ) ( not ( = ?auto_704298 ?auto_704299 ) ) ( not ( = ?auto_704298 ?auto_704300 ) ) ( not ( = ?auto_704298 ?auto_704301 ) ) ( not ( = ?auto_704298 ?auto_704302 ) ) ( not ( = ?auto_704298 ?auto_704303 ) ) ( not ( = ?auto_704298 ?auto_704304 ) ) ( not ( = ?auto_704298 ?auto_704305 ) ) ( not ( = ?auto_704298 ?auto_704306 ) ) ( not ( = ?auto_704298 ?auto_704307 ) ) ( not ( = ?auto_704298 ?auto_704308 ) ) ( not ( = ?auto_704299 ?auto_704300 ) ) ( not ( = ?auto_704299 ?auto_704301 ) ) ( not ( = ?auto_704299 ?auto_704302 ) ) ( not ( = ?auto_704299 ?auto_704303 ) ) ( not ( = ?auto_704299 ?auto_704304 ) ) ( not ( = ?auto_704299 ?auto_704305 ) ) ( not ( = ?auto_704299 ?auto_704306 ) ) ( not ( = ?auto_704299 ?auto_704307 ) ) ( not ( = ?auto_704299 ?auto_704308 ) ) ( not ( = ?auto_704300 ?auto_704301 ) ) ( not ( = ?auto_704300 ?auto_704302 ) ) ( not ( = ?auto_704300 ?auto_704303 ) ) ( not ( = ?auto_704300 ?auto_704304 ) ) ( not ( = ?auto_704300 ?auto_704305 ) ) ( not ( = ?auto_704300 ?auto_704306 ) ) ( not ( = ?auto_704300 ?auto_704307 ) ) ( not ( = ?auto_704300 ?auto_704308 ) ) ( not ( = ?auto_704301 ?auto_704302 ) ) ( not ( = ?auto_704301 ?auto_704303 ) ) ( not ( = ?auto_704301 ?auto_704304 ) ) ( not ( = ?auto_704301 ?auto_704305 ) ) ( not ( = ?auto_704301 ?auto_704306 ) ) ( not ( = ?auto_704301 ?auto_704307 ) ) ( not ( = ?auto_704301 ?auto_704308 ) ) ( not ( = ?auto_704302 ?auto_704303 ) ) ( not ( = ?auto_704302 ?auto_704304 ) ) ( not ( = ?auto_704302 ?auto_704305 ) ) ( not ( = ?auto_704302 ?auto_704306 ) ) ( not ( = ?auto_704302 ?auto_704307 ) ) ( not ( = ?auto_704302 ?auto_704308 ) ) ( not ( = ?auto_704303 ?auto_704304 ) ) ( not ( = ?auto_704303 ?auto_704305 ) ) ( not ( = ?auto_704303 ?auto_704306 ) ) ( not ( = ?auto_704303 ?auto_704307 ) ) ( not ( = ?auto_704303 ?auto_704308 ) ) ( not ( = ?auto_704304 ?auto_704305 ) ) ( not ( = ?auto_704304 ?auto_704306 ) ) ( not ( = ?auto_704304 ?auto_704307 ) ) ( not ( = ?auto_704304 ?auto_704308 ) ) ( not ( = ?auto_704305 ?auto_704306 ) ) ( not ( = ?auto_704305 ?auto_704307 ) ) ( not ( = ?auto_704305 ?auto_704308 ) ) ( not ( = ?auto_704306 ?auto_704307 ) ) ( not ( = ?auto_704306 ?auto_704308 ) ) ( not ( = ?auto_704307 ?auto_704308 ) ) ( ON ?auto_704306 ?auto_704307 ) ( ON ?auto_704305 ?auto_704306 ) ( ON ?auto_704304 ?auto_704305 ) ( ON ?auto_704303 ?auto_704304 ) ( ON ?auto_704302 ?auto_704303 ) ( CLEAR ?auto_704300 ) ( ON ?auto_704301 ?auto_704302 ) ( CLEAR ?auto_704301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_704297 ?auto_704298 ?auto_704299 ?auto_704300 ?auto_704301 )
      ( MAKE-11PILE ?auto_704297 ?auto_704298 ?auto_704299 ?auto_704300 ?auto_704301 ?auto_704302 ?auto_704303 ?auto_704304 ?auto_704305 ?auto_704306 ?auto_704307 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704343 - BLOCK
      ?auto_704344 - BLOCK
      ?auto_704345 - BLOCK
      ?auto_704346 - BLOCK
      ?auto_704347 - BLOCK
      ?auto_704348 - BLOCK
      ?auto_704349 - BLOCK
      ?auto_704350 - BLOCK
      ?auto_704351 - BLOCK
      ?auto_704352 - BLOCK
      ?auto_704353 - BLOCK
    )
    :vars
    (
      ?auto_704354 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704353 ?auto_704354 ) ( ON-TABLE ?auto_704343 ) ( ON ?auto_704344 ?auto_704343 ) ( ON ?auto_704345 ?auto_704344 ) ( not ( = ?auto_704343 ?auto_704344 ) ) ( not ( = ?auto_704343 ?auto_704345 ) ) ( not ( = ?auto_704343 ?auto_704346 ) ) ( not ( = ?auto_704343 ?auto_704347 ) ) ( not ( = ?auto_704343 ?auto_704348 ) ) ( not ( = ?auto_704343 ?auto_704349 ) ) ( not ( = ?auto_704343 ?auto_704350 ) ) ( not ( = ?auto_704343 ?auto_704351 ) ) ( not ( = ?auto_704343 ?auto_704352 ) ) ( not ( = ?auto_704343 ?auto_704353 ) ) ( not ( = ?auto_704343 ?auto_704354 ) ) ( not ( = ?auto_704344 ?auto_704345 ) ) ( not ( = ?auto_704344 ?auto_704346 ) ) ( not ( = ?auto_704344 ?auto_704347 ) ) ( not ( = ?auto_704344 ?auto_704348 ) ) ( not ( = ?auto_704344 ?auto_704349 ) ) ( not ( = ?auto_704344 ?auto_704350 ) ) ( not ( = ?auto_704344 ?auto_704351 ) ) ( not ( = ?auto_704344 ?auto_704352 ) ) ( not ( = ?auto_704344 ?auto_704353 ) ) ( not ( = ?auto_704344 ?auto_704354 ) ) ( not ( = ?auto_704345 ?auto_704346 ) ) ( not ( = ?auto_704345 ?auto_704347 ) ) ( not ( = ?auto_704345 ?auto_704348 ) ) ( not ( = ?auto_704345 ?auto_704349 ) ) ( not ( = ?auto_704345 ?auto_704350 ) ) ( not ( = ?auto_704345 ?auto_704351 ) ) ( not ( = ?auto_704345 ?auto_704352 ) ) ( not ( = ?auto_704345 ?auto_704353 ) ) ( not ( = ?auto_704345 ?auto_704354 ) ) ( not ( = ?auto_704346 ?auto_704347 ) ) ( not ( = ?auto_704346 ?auto_704348 ) ) ( not ( = ?auto_704346 ?auto_704349 ) ) ( not ( = ?auto_704346 ?auto_704350 ) ) ( not ( = ?auto_704346 ?auto_704351 ) ) ( not ( = ?auto_704346 ?auto_704352 ) ) ( not ( = ?auto_704346 ?auto_704353 ) ) ( not ( = ?auto_704346 ?auto_704354 ) ) ( not ( = ?auto_704347 ?auto_704348 ) ) ( not ( = ?auto_704347 ?auto_704349 ) ) ( not ( = ?auto_704347 ?auto_704350 ) ) ( not ( = ?auto_704347 ?auto_704351 ) ) ( not ( = ?auto_704347 ?auto_704352 ) ) ( not ( = ?auto_704347 ?auto_704353 ) ) ( not ( = ?auto_704347 ?auto_704354 ) ) ( not ( = ?auto_704348 ?auto_704349 ) ) ( not ( = ?auto_704348 ?auto_704350 ) ) ( not ( = ?auto_704348 ?auto_704351 ) ) ( not ( = ?auto_704348 ?auto_704352 ) ) ( not ( = ?auto_704348 ?auto_704353 ) ) ( not ( = ?auto_704348 ?auto_704354 ) ) ( not ( = ?auto_704349 ?auto_704350 ) ) ( not ( = ?auto_704349 ?auto_704351 ) ) ( not ( = ?auto_704349 ?auto_704352 ) ) ( not ( = ?auto_704349 ?auto_704353 ) ) ( not ( = ?auto_704349 ?auto_704354 ) ) ( not ( = ?auto_704350 ?auto_704351 ) ) ( not ( = ?auto_704350 ?auto_704352 ) ) ( not ( = ?auto_704350 ?auto_704353 ) ) ( not ( = ?auto_704350 ?auto_704354 ) ) ( not ( = ?auto_704351 ?auto_704352 ) ) ( not ( = ?auto_704351 ?auto_704353 ) ) ( not ( = ?auto_704351 ?auto_704354 ) ) ( not ( = ?auto_704352 ?auto_704353 ) ) ( not ( = ?auto_704352 ?auto_704354 ) ) ( not ( = ?auto_704353 ?auto_704354 ) ) ( ON ?auto_704352 ?auto_704353 ) ( ON ?auto_704351 ?auto_704352 ) ( ON ?auto_704350 ?auto_704351 ) ( ON ?auto_704349 ?auto_704350 ) ( ON ?auto_704348 ?auto_704349 ) ( ON ?auto_704347 ?auto_704348 ) ( CLEAR ?auto_704345 ) ( ON ?auto_704346 ?auto_704347 ) ( CLEAR ?auto_704346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_704343 ?auto_704344 ?auto_704345 ?auto_704346 )
      ( MAKE-11PILE ?auto_704343 ?auto_704344 ?auto_704345 ?auto_704346 ?auto_704347 ?auto_704348 ?auto_704349 ?auto_704350 ?auto_704351 ?auto_704352 ?auto_704353 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704389 - BLOCK
      ?auto_704390 - BLOCK
      ?auto_704391 - BLOCK
      ?auto_704392 - BLOCK
      ?auto_704393 - BLOCK
      ?auto_704394 - BLOCK
      ?auto_704395 - BLOCK
      ?auto_704396 - BLOCK
      ?auto_704397 - BLOCK
      ?auto_704398 - BLOCK
      ?auto_704399 - BLOCK
    )
    :vars
    (
      ?auto_704400 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704399 ?auto_704400 ) ( ON-TABLE ?auto_704389 ) ( ON ?auto_704390 ?auto_704389 ) ( not ( = ?auto_704389 ?auto_704390 ) ) ( not ( = ?auto_704389 ?auto_704391 ) ) ( not ( = ?auto_704389 ?auto_704392 ) ) ( not ( = ?auto_704389 ?auto_704393 ) ) ( not ( = ?auto_704389 ?auto_704394 ) ) ( not ( = ?auto_704389 ?auto_704395 ) ) ( not ( = ?auto_704389 ?auto_704396 ) ) ( not ( = ?auto_704389 ?auto_704397 ) ) ( not ( = ?auto_704389 ?auto_704398 ) ) ( not ( = ?auto_704389 ?auto_704399 ) ) ( not ( = ?auto_704389 ?auto_704400 ) ) ( not ( = ?auto_704390 ?auto_704391 ) ) ( not ( = ?auto_704390 ?auto_704392 ) ) ( not ( = ?auto_704390 ?auto_704393 ) ) ( not ( = ?auto_704390 ?auto_704394 ) ) ( not ( = ?auto_704390 ?auto_704395 ) ) ( not ( = ?auto_704390 ?auto_704396 ) ) ( not ( = ?auto_704390 ?auto_704397 ) ) ( not ( = ?auto_704390 ?auto_704398 ) ) ( not ( = ?auto_704390 ?auto_704399 ) ) ( not ( = ?auto_704390 ?auto_704400 ) ) ( not ( = ?auto_704391 ?auto_704392 ) ) ( not ( = ?auto_704391 ?auto_704393 ) ) ( not ( = ?auto_704391 ?auto_704394 ) ) ( not ( = ?auto_704391 ?auto_704395 ) ) ( not ( = ?auto_704391 ?auto_704396 ) ) ( not ( = ?auto_704391 ?auto_704397 ) ) ( not ( = ?auto_704391 ?auto_704398 ) ) ( not ( = ?auto_704391 ?auto_704399 ) ) ( not ( = ?auto_704391 ?auto_704400 ) ) ( not ( = ?auto_704392 ?auto_704393 ) ) ( not ( = ?auto_704392 ?auto_704394 ) ) ( not ( = ?auto_704392 ?auto_704395 ) ) ( not ( = ?auto_704392 ?auto_704396 ) ) ( not ( = ?auto_704392 ?auto_704397 ) ) ( not ( = ?auto_704392 ?auto_704398 ) ) ( not ( = ?auto_704392 ?auto_704399 ) ) ( not ( = ?auto_704392 ?auto_704400 ) ) ( not ( = ?auto_704393 ?auto_704394 ) ) ( not ( = ?auto_704393 ?auto_704395 ) ) ( not ( = ?auto_704393 ?auto_704396 ) ) ( not ( = ?auto_704393 ?auto_704397 ) ) ( not ( = ?auto_704393 ?auto_704398 ) ) ( not ( = ?auto_704393 ?auto_704399 ) ) ( not ( = ?auto_704393 ?auto_704400 ) ) ( not ( = ?auto_704394 ?auto_704395 ) ) ( not ( = ?auto_704394 ?auto_704396 ) ) ( not ( = ?auto_704394 ?auto_704397 ) ) ( not ( = ?auto_704394 ?auto_704398 ) ) ( not ( = ?auto_704394 ?auto_704399 ) ) ( not ( = ?auto_704394 ?auto_704400 ) ) ( not ( = ?auto_704395 ?auto_704396 ) ) ( not ( = ?auto_704395 ?auto_704397 ) ) ( not ( = ?auto_704395 ?auto_704398 ) ) ( not ( = ?auto_704395 ?auto_704399 ) ) ( not ( = ?auto_704395 ?auto_704400 ) ) ( not ( = ?auto_704396 ?auto_704397 ) ) ( not ( = ?auto_704396 ?auto_704398 ) ) ( not ( = ?auto_704396 ?auto_704399 ) ) ( not ( = ?auto_704396 ?auto_704400 ) ) ( not ( = ?auto_704397 ?auto_704398 ) ) ( not ( = ?auto_704397 ?auto_704399 ) ) ( not ( = ?auto_704397 ?auto_704400 ) ) ( not ( = ?auto_704398 ?auto_704399 ) ) ( not ( = ?auto_704398 ?auto_704400 ) ) ( not ( = ?auto_704399 ?auto_704400 ) ) ( ON ?auto_704398 ?auto_704399 ) ( ON ?auto_704397 ?auto_704398 ) ( ON ?auto_704396 ?auto_704397 ) ( ON ?auto_704395 ?auto_704396 ) ( ON ?auto_704394 ?auto_704395 ) ( ON ?auto_704393 ?auto_704394 ) ( ON ?auto_704392 ?auto_704393 ) ( CLEAR ?auto_704390 ) ( ON ?auto_704391 ?auto_704392 ) ( CLEAR ?auto_704391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_704389 ?auto_704390 ?auto_704391 )
      ( MAKE-11PILE ?auto_704389 ?auto_704390 ?auto_704391 ?auto_704392 ?auto_704393 ?auto_704394 ?auto_704395 ?auto_704396 ?auto_704397 ?auto_704398 ?auto_704399 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704435 - BLOCK
      ?auto_704436 - BLOCK
      ?auto_704437 - BLOCK
      ?auto_704438 - BLOCK
      ?auto_704439 - BLOCK
      ?auto_704440 - BLOCK
      ?auto_704441 - BLOCK
      ?auto_704442 - BLOCK
      ?auto_704443 - BLOCK
      ?auto_704444 - BLOCK
      ?auto_704445 - BLOCK
    )
    :vars
    (
      ?auto_704446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704445 ?auto_704446 ) ( ON-TABLE ?auto_704435 ) ( not ( = ?auto_704435 ?auto_704436 ) ) ( not ( = ?auto_704435 ?auto_704437 ) ) ( not ( = ?auto_704435 ?auto_704438 ) ) ( not ( = ?auto_704435 ?auto_704439 ) ) ( not ( = ?auto_704435 ?auto_704440 ) ) ( not ( = ?auto_704435 ?auto_704441 ) ) ( not ( = ?auto_704435 ?auto_704442 ) ) ( not ( = ?auto_704435 ?auto_704443 ) ) ( not ( = ?auto_704435 ?auto_704444 ) ) ( not ( = ?auto_704435 ?auto_704445 ) ) ( not ( = ?auto_704435 ?auto_704446 ) ) ( not ( = ?auto_704436 ?auto_704437 ) ) ( not ( = ?auto_704436 ?auto_704438 ) ) ( not ( = ?auto_704436 ?auto_704439 ) ) ( not ( = ?auto_704436 ?auto_704440 ) ) ( not ( = ?auto_704436 ?auto_704441 ) ) ( not ( = ?auto_704436 ?auto_704442 ) ) ( not ( = ?auto_704436 ?auto_704443 ) ) ( not ( = ?auto_704436 ?auto_704444 ) ) ( not ( = ?auto_704436 ?auto_704445 ) ) ( not ( = ?auto_704436 ?auto_704446 ) ) ( not ( = ?auto_704437 ?auto_704438 ) ) ( not ( = ?auto_704437 ?auto_704439 ) ) ( not ( = ?auto_704437 ?auto_704440 ) ) ( not ( = ?auto_704437 ?auto_704441 ) ) ( not ( = ?auto_704437 ?auto_704442 ) ) ( not ( = ?auto_704437 ?auto_704443 ) ) ( not ( = ?auto_704437 ?auto_704444 ) ) ( not ( = ?auto_704437 ?auto_704445 ) ) ( not ( = ?auto_704437 ?auto_704446 ) ) ( not ( = ?auto_704438 ?auto_704439 ) ) ( not ( = ?auto_704438 ?auto_704440 ) ) ( not ( = ?auto_704438 ?auto_704441 ) ) ( not ( = ?auto_704438 ?auto_704442 ) ) ( not ( = ?auto_704438 ?auto_704443 ) ) ( not ( = ?auto_704438 ?auto_704444 ) ) ( not ( = ?auto_704438 ?auto_704445 ) ) ( not ( = ?auto_704438 ?auto_704446 ) ) ( not ( = ?auto_704439 ?auto_704440 ) ) ( not ( = ?auto_704439 ?auto_704441 ) ) ( not ( = ?auto_704439 ?auto_704442 ) ) ( not ( = ?auto_704439 ?auto_704443 ) ) ( not ( = ?auto_704439 ?auto_704444 ) ) ( not ( = ?auto_704439 ?auto_704445 ) ) ( not ( = ?auto_704439 ?auto_704446 ) ) ( not ( = ?auto_704440 ?auto_704441 ) ) ( not ( = ?auto_704440 ?auto_704442 ) ) ( not ( = ?auto_704440 ?auto_704443 ) ) ( not ( = ?auto_704440 ?auto_704444 ) ) ( not ( = ?auto_704440 ?auto_704445 ) ) ( not ( = ?auto_704440 ?auto_704446 ) ) ( not ( = ?auto_704441 ?auto_704442 ) ) ( not ( = ?auto_704441 ?auto_704443 ) ) ( not ( = ?auto_704441 ?auto_704444 ) ) ( not ( = ?auto_704441 ?auto_704445 ) ) ( not ( = ?auto_704441 ?auto_704446 ) ) ( not ( = ?auto_704442 ?auto_704443 ) ) ( not ( = ?auto_704442 ?auto_704444 ) ) ( not ( = ?auto_704442 ?auto_704445 ) ) ( not ( = ?auto_704442 ?auto_704446 ) ) ( not ( = ?auto_704443 ?auto_704444 ) ) ( not ( = ?auto_704443 ?auto_704445 ) ) ( not ( = ?auto_704443 ?auto_704446 ) ) ( not ( = ?auto_704444 ?auto_704445 ) ) ( not ( = ?auto_704444 ?auto_704446 ) ) ( not ( = ?auto_704445 ?auto_704446 ) ) ( ON ?auto_704444 ?auto_704445 ) ( ON ?auto_704443 ?auto_704444 ) ( ON ?auto_704442 ?auto_704443 ) ( ON ?auto_704441 ?auto_704442 ) ( ON ?auto_704440 ?auto_704441 ) ( ON ?auto_704439 ?auto_704440 ) ( ON ?auto_704438 ?auto_704439 ) ( ON ?auto_704437 ?auto_704438 ) ( CLEAR ?auto_704435 ) ( ON ?auto_704436 ?auto_704437 ) ( CLEAR ?auto_704436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_704435 ?auto_704436 )
      ( MAKE-11PILE ?auto_704435 ?auto_704436 ?auto_704437 ?auto_704438 ?auto_704439 ?auto_704440 ?auto_704441 ?auto_704442 ?auto_704443 ?auto_704444 ?auto_704445 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_704481 - BLOCK
      ?auto_704482 - BLOCK
      ?auto_704483 - BLOCK
      ?auto_704484 - BLOCK
      ?auto_704485 - BLOCK
      ?auto_704486 - BLOCK
      ?auto_704487 - BLOCK
      ?auto_704488 - BLOCK
      ?auto_704489 - BLOCK
      ?auto_704490 - BLOCK
      ?auto_704491 - BLOCK
    )
    :vars
    (
      ?auto_704492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704491 ?auto_704492 ) ( not ( = ?auto_704481 ?auto_704482 ) ) ( not ( = ?auto_704481 ?auto_704483 ) ) ( not ( = ?auto_704481 ?auto_704484 ) ) ( not ( = ?auto_704481 ?auto_704485 ) ) ( not ( = ?auto_704481 ?auto_704486 ) ) ( not ( = ?auto_704481 ?auto_704487 ) ) ( not ( = ?auto_704481 ?auto_704488 ) ) ( not ( = ?auto_704481 ?auto_704489 ) ) ( not ( = ?auto_704481 ?auto_704490 ) ) ( not ( = ?auto_704481 ?auto_704491 ) ) ( not ( = ?auto_704481 ?auto_704492 ) ) ( not ( = ?auto_704482 ?auto_704483 ) ) ( not ( = ?auto_704482 ?auto_704484 ) ) ( not ( = ?auto_704482 ?auto_704485 ) ) ( not ( = ?auto_704482 ?auto_704486 ) ) ( not ( = ?auto_704482 ?auto_704487 ) ) ( not ( = ?auto_704482 ?auto_704488 ) ) ( not ( = ?auto_704482 ?auto_704489 ) ) ( not ( = ?auto_704482 ?auto_704490 ) ) ( not ( = ?auto_704482 ?auto_704491 ) ) ( not ( = ?auto_704482 ?auto_704492 ) ) ( not ( = ?auto_704483 ?auto_704484 ) ) ( not ( = ?auto_704483 ?auto_704485 ) ) ( not ( = ?auto_704483 ?auto_704486 ) ) ( not ( = ?auto_704483 ?auto_704487 ) ) ( not ( = ?auto_704483 ?auto_704488 ) ) ( not ( = ?auto_704483 ?auto_704489 ) ) ( not ( = ?auto_704483 ?auto_704490 ) ) ( not ( = ?auto_704483 ?auto_704491 ) ) ( not ( = ?auto_704483 ?auto_704492 ) ) ( not ( = ?auto_704484 ?auto_704485 ) ) ( not ( = ?auto_704484 ?auto_704486 ) ) ( not ( = ?auto_704484 ?auto_704487 ) ) ( not ( = ?auto_704484 ?auto_704488 ) ) ( not ( = ?auto_704484 ?auto_704489 ) ) ( not ( = ?auto_704484 ?auto_704490 ) ) ( not ( = ?auto_704484 ?auto_704491 ) ) ( not ( = ?auto_704484 ?auto_704492 ) ) ( not ( = ?auto_704485 ?auto_704486 ) ) ( not ( = ?auto_704485 ?auto_704487 ) ) ( not ( = ?auto_704485 ?auto_704488 ) ) ( not ( = ?auto_704485 ?auto_704489 ) ) ( not ( = ?auto_704485 ?auto_704490 ) ) ( not ( = ?auto_704485 ?auto_704491 ) ) ( not ( = ?auto_704485 ?auto_704492 ) ) ( not ( = ?auto_704486 ?auto_704487 ) ) ( not ( = ?auto_704486 ?auto_704488 ) ) ( not ( = ?auto_704486 ?auto_704489 ) ) ( not ( = ?auto_704486 ?auto_704490 ) ) ( not ( = ?auto_704486 ?auto_704491 ) ) ( not ( = ?auto_704486 ?auto_704492 ) ) ( not ( = ?auto_704487 ?auto_704488 ) ) ( not ( = ?auto_704487 ?auto_704489 ) ) ( not ( = ?auto_704487 ?auto_704490 ) ) ( not ( = ?auto_704487 ?auto_704491 ) ) ( not ( = ?auto_704487 ?auto_704492 ) ) ( not ( = ?auto_704488 ?auto_704489 ) ) ( not ( = ?auto_704488 ?auto_704490 ) ) ( not ( = ?auto_704488 ?auto_704491 ) ) ( not ( = ?auto_704488 ?auto_704492 ) ) ( not ( = ?auto_704489 ?auto_704490 ) ) ( not ( = ?auto_704489 ?auto_704491 ) ) ( not ( = ?auto_704489 ?auto_704492 ) ) ( not ( = ?auto_704490 ?auto_704491 ) ) ( not ( = ?auto_704490 ?auto_704492 ) ) ( not ( = ?auto_704491 ?auto_704492 ) ) ( ON ?auto_704490 ?auto_704491 ) ( ON ?auto_704489 ?auto_704490 ) ( ON ?auto_704488 ?auto_704489 ) ( ON ?auto_704487 ?auto_704488 ) ( ON ?auto_704486 ?auto_704487 ) ( ON ?auto_704485 ?auto_704486 ) ( ON ?auto_704484 ?auto_704485 ) ( ON ?auto_704483 ?auto_704484 ) ( ON ?auto_704482 ?auto_704483 ) ( ON ?auto_704481 ?auto_704482 ) ( CLEAR ?auto_704481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_704481 )
      ( MAKE-11PILE ?auto_704481 ?auto_704482 ?auto_704483 ?auto_704484 ?auto_704485 ?auto_704486 ?auto_704487 ?auto_704488 ?auto_704489 ?auto_704490 ?auto_704491 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704528 - BLOCK
      ?auto_704529 - BLOCK
      ?auto_704530 - BLOCK
      ?auto_704531 - BLOCK
      ?auto_704532 - BLOCK
      ?auto_704533 - BLOCK
      ?auto_704534 - BLOCK
      ?auto_704535 - BLOCK
      ?auto_704536 - BLOCK
      ?auto_704537 - BLOCK
      ?auto_704538 - BLOCK
      ?auto_704539 - BLOCK
    )
    :vars
    (
      ?auto_704540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_704538 ) ( ON ?auto_704539 ?auto_704540 ) ( CLEAR ?auto_704539 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_704528 ) ( ON ?auto_704529 ?auto_704528 ) ( ON ?auto_704530 ?auto_704529 ) ( ON ?auto_704531 ?auto_704530 ) ( ON ?auto_704532 ?auto_704531 ) ( ON ?auto_704533 ?auto_704532 ) ( ON ?auto_704534 ?auto_704533 ) ( ON ?auto_704535 ?auto_704534 ) ( ON ?auto_704536 ?auto_704535 ) ( ON ?auto_704537 ?auto_704536 ) ( ON ?auto_704538 ?auto_704537 ) ( not ( = ?auto_704528 ?auto_704529 ) ) ( not ( = ?auto_704528 ?auto_704530 ) ) ( not ( = ?auto_704528 ?auto_704531 ) ) ( not ( = ?auto_704528 ?auto_704532 ) ) ( not ( = ?auto_704528 ?auto_704533 ) ) ( not ( = ?auto_704528 ?auto_704534 ) ) ( not ( = ?auto_704528 ?auto_704535 ) ) ( not ( = ?auto_704528 ?auto_704536 ) ) ( not ( = ?auto_704528 ?auto_704537 ) ) ( not ( = ?auto_704528 ?auto_704538 ) ) ( not ( = ?auto_704528 ?auto_704539 ) ) ( not ( = ?auto_704528 ?auto_704540 ) ) ( not ( = ?auto_704529 ?auto_704530 ) ) ( not ( = ?auto_704529 ?auto_704531 ) ) ( not ( = ?auto_704529 ?auto_704532 ) ) ( not ( = ?auto_704529 ?auto_704533 ) ) ( not ( = ?auto_704529 ?auto_704534 ) ) ( not ( = ?auto_704529 ?auto_704535 ) ) ( not ( = ?auto_704529 ?auto_704536 ) ) ( not ( = ?auto_704529 ?auto_704537 ) ) ( not ( = ?auto_704529 ?auto_704538 ) ) ( not ( = ?auto_704529 ?auto_704539 ) ) ( not ( = ?auto_704529 ?auto_704540 ) ) ( not ( = ?auto_704530 ?auto_704531 ) ) ( not ( = ?auto_704530 ?auto_704532 ) ) ( not ( = ?auto_704530 ?auto_704533 ) ) ( not ( = ?auto_704530 ?auto_704534 ) ) ( not ( = ?auto_704530 ?auto_704535 ) ) ( not ( = ?auto_704530 ?auto_704536 ) ) ( not ( = ?auto_704530 ?auto_704537 ) ) ( not ( = ?auto_704530 ?auto_704538 ) ) ( not ( = ?auto_704530 ?auto_704539 ) ) ( not ( = ?auto_704530 ?auto_704540 ) ) ( not ( = ?auto_704531 ?auto_704532 ) ) ( not ( = ?auto_704531 ?auto_704533 ) ) ( not ( = ?auto_704531 ?auto_704534 ) ) ( not ( = ?auto_704531 ?auto_704535 ) ) ( not ( = ?auto_704531 ?auto_704536 ) ) ( not ( = ?auto_704531 ?auto_704537 ) ) ( not ( = ?auto_704531 ?auto_704538 ) ) ( not ( = ?auto_704531 ?auto_704539 ) ) ( not ( = ?auto_704531 ?auto_704540 ) ) ( not ( = ?auto_704532 ?auto_704533 ) ) ( not ( = ?auto_704532 ?auto_704534 ) ) ( not ( = ?auto_704532 ?auto_704535 ) ) ( not ( = ?auto_704532 ?auto_704536 ) ) ( not ( = ?auto_704532 ?auto_704537 ) ) ( not ( = ?auto_704532 ?auto_704538 ) ) ( not ( = ?auto_704532 ?auto_704539 ) ) ( not ( = ?auto_704532 ?auto_704540 ) ) ( not ( = ?auto_704533 ?auto_704534 ) ) ( not ( = ?auto_704533 ?auto_704535 ) ) ( not ( = ?auto_704533 ?auto_704536 ) ) ( not ( = ?auto_704533 ?auto_704537 ) ) ( not ( = ?auto_704533 ?auto_704538 ) ) ( not ( = ?auto_704533 ?auto_704539 ) ) ( not ( = ?auto_704533 ?auto_704540 ) ) ( not ( = ?auto_704534 ?auto_704535 ) ) ( not ( = ?auto_704534 ?auto_704536 ) ) ( not ( = ?auto_704534 ?auto_704537 ) ) ( not ( = ?auto_704534 ?auto_704538 ) ) ( not ( = ?auto_704534 ?auto_704539 ) ) ( not ( = ?auto_704534 ?auto_704540 ) ) ( not ( = ?auto_704535 ?auto_704536 ) ) ( not ( = ?auto_704535 ?auto_704537 ) ) ( not ( = ?auto_704535 ?auto_704538 ) ) ( not ( = ?auto_704535 ?auto_704539 ) ) ( not ( = ?auto_704535 ?auto_704540 ) ) ( not ( = ?auto_704536 ?auto_704537 ) ) ( not ( = ?auto_704536 ?auto_704538 ) ) ( not ( = ?auto_704536 ?auto_704539 ) ) ( not ( = ?auto_704536 ?auto_704540 ) ) ( not ( = ?auto_704537 ?auto_704538 ) ) ( not ( = ?auto_704537 ?auto_704539 ) ) ( not ( = ?auto_704537 ?auto_704540 ) ) ( not ( = ?auto_704538 ?auto_704539 ) ) ( not ( = ?auto_704538 ?auto_704540 ) ) ( not ( = ?auto_704539 ?auto_704540 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_704539 ?auto_704540 )
      ( !STACK ?auto_704539 ?auto_704538 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704578 - BLOCK
      ?auto_704579 - BLOCK
      ?auto_704580 - BLOCK
      ?auto_704581 - BLOCK
      ?auto_704582 - BLOCK
      ?auto_704583 - BLOCK
      ?auto_704584 - BLOCK
      ?auto_704585 - BLOCK
      ?auto_704586 - BLOCK
      ?auto_704587 - BLOCK
      ?auto_704588 - BLOCK
      ?auto_704589 - BLOCK
    )
    :vars
    (
      ?auto_704590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704589 ?auto_704590 ) ( ON-TABLE ?auto_704578 ) ( ON ?auto_704579 ?auto_704578 ) ( ON ?auto_704580 ?auto_704579 ) ( ON ?auto_704581 ?auto_704580 ) ( ON ?auto_704582 ?auto_704581 ) ( ON ?auto_704583 ?auto_704582 ) ( ON ?auto_704584 ?auto_704583 ) ( ON ?auto_704585 ?auto_704584 ) ( ON ?auto_704586 ?auto_704585 ) ( ON ?auto_704587 ?auto_704586 ) ( not ( = ?auto_704578 ?auto_704579 ) ) ( not ( = ?auto_704578 ?auto_704580 ) ) ( not ( = ?auto_704578 ?auto_704581 ) ) ( not ( = ?auto_704578 ?auto_704582 ) ) ( not ( = ?auto_704578 ?auto_704583 ) ) ( not ( = ?auto_704578 ?auto_704584 ) ) ( not ( = ?auto_704578 ?auto_704585 ) ) ( not ( = ?auto_704578 ?auto_704586 ) ) ( not ( = ?auto_704578 ?auto_704587 ) ) ( not ( = ?auto_704578 ?auto_704588 ) ) ( not ( = ?auto_704578 ?auto_704589 ) ) ( not ( = ?auto_704578 ?auto_704590 ) ) ( not ( = ?auto_704579 ?auto_704580 ) ) ( not ( = ?auto_704579 ?auto_704581 ) ) ( not ( = ?auto_704579 ?auto_704582 ) ) ( not ( = ?auto_704579 ?auto_704583 ) ) ( not ( = ?auto_704579 ?auto_704584 ) ) ( not ( = ?auto_704579 ?auto_704585 ) ) ( not ( = ?auto_704579 ?auto_704586 ) ) ( not ( = ?auto_704579 ?auto_704587 ) ) ( not ( = ?auto_704579 ?auto_704588 ) ) ( not ( = ?auto_704579 ?auto_704589 ) ) ( not ( = ?auto_704579 ?auto_704590 ) ) ( not ( = ?auto_704580 ?auto_704581 ) ) ( not ( = ?auto_704580 ?auto_704582 ) ) ( not ( = ?auto_704580 ?auto_704583 ) ) ( not ( = ?auto_704580 ?auto_704584 ) ) ( not ( = ?auto_704580 ?auto_704585 ) ) ( not ( = ?auto_704580 ?auto_704586 ) ) ( not ( = ?auto_704580 ?auto_704587 ) ) ( not ( = ?auto_704580 ?auto_704588 ) ) ( not ( = ?auto_704580 ?auto_704589 ) ) ( not ( = ?auto_704580 ?auto_704590 ) ) ( not ( = ?auto_704581 ?auto_704582 ) ) ( not ( = ?auto_704581 ?auto_704583 ) ) ( not ( = ?auto_704581 ?auto_704584 ) ) ( not ( = ?auto_704581 ?auto_704585 ) ) ( not ( = ?auto_704581 ?auto_704586 ) ) ( not ( = ?auto_704581 ?auto_704587 ) ) ( not ( = ?auto_704581 ?auto_704588 ) ) ( not ( = ?auto_704581 ?auto_704589 ) ) ( not ( = ?auto_704581 ?auto_704590 ) ) ( not ( = ?auto_704582 ?auto_704583 ) ) ( not ( = ?auto_704582 ?auto_704584 ) ) ( not ( = ?auto_704582 ?auto_704585 ) ) ( not ( = ?auto_704582 ?auto_704586 ) ) ( not ( = ?auto_704582 ?auto_704587 ) ) ( not ( = ?auto_704582 ?auto_704588 ) ) ( not ( = ?auto_704582 ?auto_704589 ) ) ( not ( = ?auto_704582 ?auto_704590 ) ) ( not ( = ?auto_704583 ?auto_704584 ) ) ( not ( = ?auto_704583 ?auto_704585 ) ) ( not ( = ?auto_704583 ?auto_704586 ) ) ( not ( = ?auto_704583 ?auto_704587 ) ) ( not ( = ?auto_704583 ?auto_704588 ) ) ( not ( = ?auto_704583 ?auto_704589 ) ) ( not ( = ?auto_704583 ?auto_704590 ) ) ( not ( = ?auto_704584 ?auto_704585 ) ) ( not ( = ?auto_704584 ?auto_704586 ) ) ( not ( = ?auto_704584 ?auto_704587 ) ) ( not ( = ?auto_704584 ?auto_704588 ) ) ( not ( = ?auto_704584 ?auto_704589 ) ) ( not ( = ?auto_704584 ?auto_704590 ) ) ( not ( = ?auto_704585 ?auto_704586 ) ) ( not ( = ?auto_704585 ?auto_704587 ) ) ( not ( = ?auto_704585 ?auto_704588 ) ) ( not ( = ?auto_704585 ?auto_704589 ) ) ( not ( = ?auto_704585 ?auto_704590 ) ) ( not ( = ?auto_704586 ?auto_704587 ) ) ( not ( = ?auto_704586 ?auto_704588 ) ) ( not ( = ?auto_704586 ?auto_704589 ) ) ( not ( = ?auto_704586 ?auto_704590 ) ) ( not ( = ?auto_704587 ?auto_704588 ) ) ( not ( = ?auto_704587 ?auto_704589 ) ) ( not ( = ?auto_704587 ?auto_704590 ) ) ( not ( = ?auto_704588 ?auto_704589 ) ) ( not ( = ?auto_704588 ?auto_704590 ) ) ( not ( = ?auto_704589 ?auto_704590 ) ) ( CLEAR ?auto_704587 ) ( ON ?auto_704588 ?auto_704589 ) ( CLEAR ?auto_704588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_704578 ?auto_704579 ?auto_704580 ?auto_704581 ?auto_704582 ?auto_704583 ?auto_704584 ?auto_704585 ?auto_704586 ?auto_704587 ?auto_704588 )
      ( MAKE-12PILE ?auto_704578 ?auto_704579 ?auto_704580 ?auto_704581 ?auto_704582 ?auto_704583 ?auto_704584 ?auto_704585 ?auto_704586 ?auto_704587 ?auto_704588 ?auto_704589 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704628 - BLOCK
      ?auto_704629 - BLOCK
      ?auto_704630 - BLOCK
      ?auto_704631 - BLOCK
      ?auto_704632 - BLOCK
      ?auto_704633 - BLOCK
      ?auto_704634 - BLOCK
      ?auto_704635 - BLOCK
      ?auto_704636 - BLOCK
      ?auto_704637 - BLOCK
      ?auto_704638 - BLOCK
      ?auto_704639 - BLOCK
    )
    :vars
    (
      ?auto_704640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704639 ?auto_704640 ) ( ON-TABLE ?auto_704628 ) ( ON ?auto_704629 ?auto_704628 ) ( ON ?auto_704630 ?auto_704629 ) ( ON ?auto_704631 ?auto_704630 ) ( ON ?auto_704632 ?auto_704631 ) ( ON ?auto_704633 ?auto_704632 ) ( ON ?auto_704634 ?auto_704633 ) ( ON ?auto_704635 ?auto_704634 ) ( ON ?auto_704636 ?auto_704635 ) ( not ( = ?auto_704628 ?auto_704629 ) ) ( not ( = ?auto_704628 ?auto_704630 ) ) ( not ( = ?auto_704628 ?auto_704631 ) ) ( not ( = ?auto_704628 ?auto_704632 ) ) ( not ( = ?auto_704628 ?auto_704633 ) ) ( not ( = ?auto_704628 ?auto_704634 ) ) ( not ( = ?auto_704628 ?auto_704635 ) ) ( not ( = ?auto_704628 ?auto_704636 ) ) ( not ( = ?auto_704628 ?auto_704637 ) ) ( not ( = ?auto_704628 ?auto_704638 ) ) ( not ( = ?auto_704628 ?auto_704639 ) ) ( not ( = ?auto_704628 ?auto_704640 ) ) ( not ( = ?auto_704629 ?auto_704630 ) ) ( not ( = ?auto_704629 ?auto_704631 ) ) ( not ( = ?auto_704629 ?auto_704632 ) ) ( not ( = ?auto_704629 ?auto_704633 ) ) ( not ( = ?auto_704629 ?auto_704634 ) ) ( not ( = ?auto_704629 ?auto_704635 ) ) ( not ( = ?auto_704629 ?auto_704636 ) ) ( not ( = ?auto_704629 ?auto_704637 ) ) ( not ( = ?auto_704629 ?auto_704638 ) ) ( not ( = ?auto_704629 ?auto_704639 ) ) ( not ( = ?auto_704629 ?auto_704640 ) ) ( not ( = ?auto_704630 ?auto_704631 ) ) ( not ( = ?auto_704630 ?auto_704632 ) ) ( not ( = ?auto_704630 ?auto_704633 ) ) ( not ( = ?auto_704630 ?auto_704634 ) ) ( not ( = ?auto_704630 ?auto_704635 ) ) ( not ( = ?auto_704630 ?auto_704636 ) ) ( not ( = ?auto_704630 ?auto_704637 ) ) ( not ( = ?auto_704630 ?auto_704638 ) ) ( not ( = ?auto_704630 ?auto_704639 ) ) ( not ( = ?auto_704630 ?auto_704640 ) ) ( not ( = ?auto_704631 ?auto_704632 ) ) ( not ( = ?auto_704631 ?auto_704633 ) ) ( not ( = ?auto_704631 ?auto_704634 ) ) ( not ( = ?auto_704631 ?auto_704635 ) ) ( not ( = ?auto_704631 ?auto_704636 ) ) ( not ( = ?auto_704631 ?auto_704637 ) ) ( not ( = ?auto_704631 ?auto_704638 ) ) ( not ( = ?auto_704631 ?auto_704639 ) ) ( not ( = ?auto_704631 ?auto_704640 ) ) ( not ( = ?auto_704632 ?auto_704633 ) ) ( not ( = ?auto_704632 ?auto_704634 ) ) ( not ( = ?auto_704632 ?auto_704635 ) ) ( not ( = ?auto_704632 ?auto_704636 ) ) ( not ( = ?auto_704632 ?auto_704637 ) ) ( not ( = ?auto_704632 ?auto_704638 ) ) ( not ( = ?auto_704632 ?auto_704639 ) ) ( not ( = ?auto_704632 ?auto_704640 ) ) ( not ( = ?auto_704633 ?auto_704634 ) ) ( not ( = ?auto_704633 ?auto_704635 ) ) ( not ( = ?auto_704633 ?auto_704636 ) ) ( not ( = ?auto_704633 ?auto_704637 ) ) ( not ( = ?auto_704633 ?auto_704638 ) ) ( not ( = ?auto_704633 ?auto_704639 ) ) ( not ( = ?auto_704633 ?auto_704640 ) ) ( not ( = ?auto_704634 ?auto_704635 ) ) ( not ( = ?auto_704634 ?auto_704636 ) ) ( not ( = ?auto_704634 ?auto_704637 ) ) ( not ( = ?auto_704634 ?auto_704638 ) ) ( not ( = ?auto_704634 ?auto_704639 ) ) ( not ( = ?auto_704634 ?auto_704640 ) ) ( not ( = ?auto_704635 ?auto_704636 ) ) ( not ( = ?auto_704635 ?auto_704637 ) ) ( not ( = ?auto_704635 ?auto_704638 ) ) ( not ( = ?auto_704635 ?auto_704639 ) ) ( not ( = ?auto_704635 ?auto_704640 ) ) ( not ( = ?auto_704636 ?auto_704637 ) ) ( not ( = ?auto_704636 ?auto_704638 ) ) ( not ( = ?auto_704636 ?auto_704639 ) ) ( not ( = ?auto_704636 ?auto_704640 ) ) ( not ( = ?auto_704637 ?auto_704638 ) ) ( not ( = ?auto_704637 ?auto_704639 ) ) ( not ( = ?auto_704637 ?auto_704640 ) ) ( not ( = ?auto_704638 ?auto_704639 ) ) ( not ( = ?auto_704638 ?auto_704640 ) ) ( not ( = ?auto_704639 ?auto_704640 ) ) ( ON ?auto_704638 ?auto_704639 ) ( CLEAR ?auto_704636 ) ( ON ?auto_704637 ?auto_704638 ) ( CLEAR ?auto_704637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_704628 ?auto_704629 ?auto_704630 ?auto_704631 ?auto_704632 ?auto_704633 ?auto_704634 ?auto_704635 ?auto_704636 ?auto_704637 )
      ( MAKE-12PILE ?auto_704628 ?auto_704629 ?auto_704630 ?auto_704631 ?auto_704632 ?auto_704633 ?auto_704634 ?auto_704635 ?auto_704636 ?auto_704637 ?auto_704638 ?auto_704639 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704678 - BLOCK
      ?auto_704679 - BLOCK
      ?auto_704680 - BLOCK
      ?auto_704681 - BLOCK
      ?auto_704682 - BLOCK
      ?auto_704683 - BLOCK
      ?auto_704684 - BLOCK
      ?auto_704685 - BLOCK
      ?auto_704686 - BLOCK
      ?auto_704687 - BLOCK
      ?auto_704688 - BLOCK
      ?auto_704689 - BLOCK
    )
    :vars
    (
      ?auto_704690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704689 ?auto_704690 ) ( ON-TABLE ?auto_704678 ) ( ON ?auto_704679 ?auto_704678 ) ( ON ?auto_704680 ?auto_704679 ) ( ON ?auto_704681 ?auto_704680 ) ( ON ?auto_704682 ?auto_704681 ) ( ON ?auto_704683 ?auto_704682 ) ( ON ?auto_704684 ?auto_704683 ) ( ON ?auto_704685 ?auto_704684 ) ( not ( = ?auto_704678 ?auto_704679 ) ) ( not ( = ?auto_704678 ?auto_704680 ) ) ( not ( = ?auto_704678 ?auto_704681 ) ) ( not ( = ?auto_704678 ?auto_704682 ) ) ( not ( = ?auto_704678 ?auto_704683 ) ) ( not ( = ?auto_704678 ?auto_704684 ) ) ( not ( = ?auto_704678 ?auto_704685 ) ) ( not ( = ?auto_704678 ?auto_704686 ) ) ( not ( = ?auto_704678 ?auto_704687 ) ) ( not ( = ?auto_704678 ?auto_704688 ) ) ( not ( = ?auto_704678 ?auto_704689 ) ) ( not ( = ?auto_704678 ?auto_704690 ) ) ( not ( = ?auto_704679 ?auto_704680 ) ) ( not ( = ?auto_704679 ?auto_704681 ) ) ( not ( = ?auto_704679 ?auto_704682 ) ) ( not ( = ?auto_704679 ?auto_704683 ) ) ( not ( = ?auto_704679 ?auto_704684 ) ) ( not ( = ?auto_704679 ?auto_704685 ) ) ( not ( = ?auto_704679 ?auto_704686 ) ) ( not ( = ?auto_704679 ?auto_704687 ) ) ( not ( = ?auto_704679 ?auto_704688 ) ) ( not ( = ?auto_704679 ?auto_704689 ) ) ( not ( = ?auto_704679 ?auto_704690 ) ) ( not ( = ?auto_704680 ?auto_704681 ) ) ( not ( = ?auto_704680 ?auto_704682 ) ) ( not ( = ?auto_704680 ?auto_704683 ) ) ( not ( = ?auto_704680 ?auto_704684 ) ) ( not ( = ?auto_704680 ?auto_704685 ) ) ( not ( = ?auto_704680 ?auto_704686 ) ) ( not ( = ?auto_704680 ?auto_704687 ) ) ( not ( = ?auto_704680 ?auto_704688 ) ) ( not ( = ?auto_704680 ?auto_704689 ) ) ( not ( = ?auto_704680 ?auto_704690 ) ) ( not ( = ?auto_704681 ?auto_704682 ) ) ( not ( = ?auto_704681 ?auto_704683 ) ) ( not ( = ?auto_704681 ?auto_704684 ) ) ( not ( = ?auto_704681 ?auto_704685 ) ) ( not ( = ?auto_704681 ?auto_704686 ) ) ( not ( = ?auto_704681 ?auto_704687 ) ) ( not ( = ?auto_704681 ?auto_704688 ) ) ( not ( = ?auto_704681 ?auto_704689 ) ) ( not ( = ?auto_704681 ?auto_704690 ) ) ( not ( = ?auto_704682 ?auto_704683 ) ) ( not ( = ?auto_704682 ?auto_704684 ) ) ( not ( = ?auto_704682 ?auto_704685 ) ) ( not ( = ?auto_704682 ?auto_704686 ) ) ( not ( = ?auto_704682 ?auto_704687 ) ) ( not ( = ?auto_704682 ?auto_704688 ) ) ( not ( = ?auto_704682 ?auto_704689 ) ) ( not ( = ?auto_704682 ?auto_704690 ) ) ( not ( = ?auto_704683 ?auto_704684 ) ) ( not ( = ?auto_704683 ?auto_704685 ) ) ( not ( = ?auto_704683 ?auto_704686 ) ) ( not ( = ?auto_704683 ?auto_704687 ) ) ( not ( = ?auto_704683 ?auto_704688 ) ) ( not ( = ?auto_704683 ?auto_704689 ) ) ( not ( = ?auto_704683 ?auto_704690 ) ) ( not ( = ?auto_704684 ?auto_704685 ) ) ( not ( = ?auto_704684 ?auto_704686 ) ) ( not ( = ?auto_704684 ?auto_704687 ) ) ( not ( = ?auto_704684 ?auto_704688 ) ) ( not ( = ?auto_704684 ?auto_704689 ) ) ( not ( = ?auto_704684 ?auto_704690 ) ) ( not ( = ?auto_704685 ?auto_704686 ) ) ( not ( = ?auto_704685 ?auto_704687 ) ) ( not ( = ?auto_704685 ?auto_704688 ) ) ( not ( = ?auto_704685 ?auto_704689 ) ) ( not ( = ?auto_704685 ?auto_704690 ) ) ( not ( = ?auto_704686 ?auto_704687 ) ) ( not ( = ?auto_704686 ?auto_704688 ) ) ( not ( = ?auto_704686 ?auto_704689 ) ) ( not ( = ?auto_704686 ?auto_704690 ) ) ( not ( = ?auto_704687 ?auto_704688 ) ) ( not ( = ?auto_704687 ?auto_704689 ) ) ( not ( = ?auto_704687 ?auto_704690 ) ) ( not ( = ?auto_704688 ?auto_704689 ) ) ( not ( = ?auto_704688 ?auto_704690 ) ) ( not ( = ?auto_704689 ?auto_704690 ) ) ( ON ?auto_704688 ?auto_704689 ) ( ON ?auto_704687 ?auto_704688 ) ( CLEAR ?auto_704685 ) ( ON ?auto_704686 ?auto_704687 ) ( CLEAR ?auto_704686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_704678 ?auto_704679 ?auto_704680 ?auto_704681 ?auto_704682 ?auto_704683 ?auto_704684 ?auto_704685 ?auto_704686 )
      ( MAKE-12PILE ?auto_704678 ?auto_704679 ?auto_704680 ?auto_704681 ?auto_704682 ?auto_704683 ?auto_704684 ?auto_704685 ?auto_704686 ?auto_704687 ?auto_704688 ?auto_704689 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704728 - BLOCK
      ?auto_704729 - BLOCK
      ?auto_704730 - BLOCK
      ?auto_704731 - BLOCK
      ?auto_704732 - BLOCK
      ?auto_704733 - BLOCK
      ?auto_704734 - BLOCK
      ?auto_704735 - BLOCK
      ?auto_704736 - BLOCK
      ?auto_704737 - BLOCK
      ?auto_704738 - BLOCK
      ?auto_704739 - BLOCK
    )
    :vars
    (
      ?auto_704740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704739 ?auto_704740 ) ( ON-TABLE ?auto_704728 ) ( ON ?auto_704729 ?auto_704728 ) ( ON ?auto_704730 ?auto_704729 ) ( ON ?auto_704731 ?auto_704730 ) ( ON ?auto_704732 ?auto_704731 ) ( ON ?auto_704733 ?auto_704732 ) ( ON ?auto_704734 ?auto_704733 ) ( not ( = ?auto_704728 ?auto_704729 ) ) ( not ( = ?auto_704728 ?auto_704730 ) ) ( not ( = ?auto_704728 ?auto_704731 ) ) ( not ( = ?auto_704728 ?auto_704732 ) ) ( not ( = ?auto_704728 ?auto_704733 ) ) ( not ( = ?auto_704728 ?auto_704734 ) ) ( not ( = ?auto_704728 ?auto_704735 ) ) ( not ( = ?auto_704728 ?auto_704736 ) ) ( not ( = ?auto_704728 ?auto_704737 ) ) ( not ( = ?auto_704728 ?auto_704738 ) ) ( not ( = ?auto_704728 ?auto_704739 ) ) ( not ( = ?auto_704728 ?auto_704740 ) ) ( not ( = ?auto_704729 ?auto_704730 ) ) ( not ( = ?auto_704729 ?auto_704731 ) ) ( not ( = ?auto_704729 ?auto_704732 ) ) ( not ( = ?auto_704729 ?auto_704733 ) ) ( not ( = ?auto_704729 ?auto_704734 ) ) ( not ( = ?auto_704729 ?auto_704735 ) ) ( not ( = ?auto_704729 ?auto_704736 ) ) ( not ( = ?auto_704729 ?auto_704737 ) ) ( not ( = ?auto_704729 ?auto_704738 ) ) ( not ( = ?auto_704729 ?auto_704739 ) ) ( not ( = ?auto_704729 ?auto_704740 ) ) ( not ( = ?auto_704730 ?auto_704731 ) ) ( not ( = ?auto_704730 ?auto_704732 ) ) ( not ( = ?auto_704730 ?auto_704733 ) ) ( not ( = ?auto_704730 ?auto_704734 ) ) ( not ( = ?auto_704730 ?auto_704735 ) ) ( not ( = ?auto_704730 ?auto_704736 ) ) ( not ( = ?auto_704730 ?auto_704737 ) ) ( not ( = ?auto_704730 ?auto_704738 ) ) ( not ( = ?auto_704730 ?auto_704739 ) ) ( not ( = ?auto_704730 ?auto_704740 ) ) ( not ( = ?auto_704731 ?auto_704732 ) ) ( not ( = ?auto_704731 ?auto_704733 ) ) ( not ( = ?auto_704731 ?auto_704734 ) ) ( not ( = ?auto_704731 ?auto_704735 ) ) ( not ( = ?auto_704731 ?auto_704736 ) ) ( not ( = ?auto_704731 ?auto_704737 ) ) ( not ( = ?auto_704731 ?auto_704738 ) ) ( not ( = ?auto_704731 ?auto_704739 ) ) ( not ( = ?auto_704731 ?auto_704740 ) ) ( not ( = ?auto_704732 ?auto_704733 ) ) ( not ( = ?auto_704732 ?auto_704734 ) ) ( not ( = ?auto_704732 ?auto_704735 ) ) ( not ( = ?auto_704732 ?auto_704736 ) ) ( not ( = ?auto_704732 ?auto_704737 ) ) ( not ( = ?auto_704732 ?auto_704738 ) ) ( not ( = ?auto_704732 ?auto_704739 ) ) ( not ( = ?auto_704732 ?auto_704740 ) ) ( not ( = ?auto_704733 ?auto_704734 ) ) ( not ( = ?auto_704733 ?auto_704735 ) ) ( not ( = ?auto_704733 ?auto_704736 ) ) ( not ( = ?auto_704733 ?auto_704737 ) ) ( not ( = ?auto_704733 ?auto_704738 ) ) ( not ( = ?auto_704733 ?auto_704739 ) ) ( not ( = ?auto_704733 ?auto_704740 ) ) ( not ( = ?auto_704734 ?auto_704735 ) ) ( not ( = ?auto_704734 ?auto_704736 ) ) ( not ( = ?auto_704734 ?auto_704737 ) ) ( not ( = ?auto_704734 ?auto_704738 ) ) ( not ( = ?auto_704734 ?auto_704739 ) ) ( not ( = ?auto_704734 ?auto_704740 ) ) ( not ( = ?auto_704735 ?auto_704736 ) ) ( not ( = ?auto_704735 ?auto_704737 ) ) ( not ( = ?auto_704735 ?auto_704738 ) ) ( not ( = ?auto_704735 ?auto_704739 ) ) ( not ( = ?auto_704735 ?auto_704740 ) ) ( not ( = ?auto_704736 ?auto_704737 ) ) ( not ( = ?auto_704736 ?auto_704738 ) ) ( not ( = ?auto_704736 ?auto_704739 ) ) ( not ( = ?auto_704736 ?auto_704740 ) ) ( not ( = ?auto_704737 ?auto_704738 ) ) ( not ( = ?auto_704737 ?auto_704739 ) ) ( not ( = ?auto_704737 ?auto_704740 ) ) ( not ( = ?auto_704738 ?auto_704739 ) ) ( not ( = ?auto_704738 ?auto_704740 ) ) ( not ( = ?auto_704739 ?auto_704740 ) ) ( ON ?auto_704738 ?auto_704739 ) ( ON ?auto_704737 ?auto_704738 ) ( ON ?auto_704736 ?auto_704737 ) ( CLEAR ?auto_704734 ) ( ON ?auto_704735 ?auto_704736 ) ( CLEAR ?auto_704735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_704728 ?auto_704729 ?auto_704730 ?auto_704731 ?auto_704732 ?auto_704733 ?auto_704734 ?auto_704735 )
      ( MAKE-12PILE ?auto_704728 ?auto_704729 ?auto_704730 ?auto_704731 ?auto_704732 ?auto_704733 ?auto_704734 ?auto_704735 ?auto_704736 ?auto_704737 ?auto_704738 ?auto_704739 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704778 - BLOCK
      ?auto_704779 - BLOCK
      ?auto_704780 - BLOCK
      ?auto_704781 - BLOCK
      ?auto_704782 - BLOCK
      ?auto_704783 - BLOCK
      ?auto_704784 - BLOCK
      ?auto_704785 - BLOCK
      ?auto_704786 - BLOCK
      ?auto_704787 - BLOCK
      ?auto_704788 - BLOCK
      ?auto_704789 - BLOCK
    )
    :vars
    (
      ?auto_704790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704789 ?auto_704790 ) ( ON-TABLE ?auto_704778 ) ( ON ?auto_704779 ?auto_704778 ) ( ON ?auto_704780 ?auto_704779 ) ( ON ?auto_704781 ?auto_704780 ) ( ON ?auto_704782 ?auto_704781 ) ( ON ?auto_704783 ?auto_704782 ) ( not ( = ?auto_704778 ?auto_704779 ) ) ( not ( = ?auto_704778 ?auto_704780 ) ) ( not ( = ?auto_704778 ?auto_704781 ) ) ( not ( = ?auto_704778 ?auto_704782 ) ) ( not ( = ?auto_704778 ?auto_704783 ) ) ( not ( = ?auto_704778 ?auto_704784 ) ) ( not ( = ?auto_704778 ?auto_704785 ) ) ( not ( = ?auto_704778 ?auto_704786 ) ) ( not ( = ?auto_704778 ?auto_704787 ) ) ( not ( = ?auto_704778 ?auto_704788 ) ) ( not ( = ?auto_704778 ?auto_704789 ) ) ( not ( = ?auto_704778 ?auto_704790 ) ) ( not ( = ?auto_704779 ?auto_704780 ) ) ( not ( = ?auto_704779 ?auto_704781 ) ) ( not ( = ?auto_704779 ?auto_704782 ) ) ( not ( = ?auto_704779 ?auto_704783 ) ) ( not ( = ?auto_704779 ?auto_704784 ) ) ( not ( = ?auto_704779 ?auto_704785 ) ) ( not ( = ?auto_704779 ?auto_704786 ) ) ( not ( = ?auto_704779 ?auto_704787 ) ) ( not ( = ?auto_704779 ?auto_704788 ) ) ( not ( = ?auto_704779 ?auto_704789 ) ) ( not ( = ?auto_704779 ?auto_704790 ) ) ( not ( = ?auto_704780 ?auto_704781 ) ) ( not ( = ?auto_704780 ?auto_704782 ) ) ( not ( = ?auto_704780 ?auto_704783 ) ) ( not ( = ?auto_704780 ?auto_704784 ) ) ( not ( = ?auto_704780 ?auto_704785 ) ) ( not ( = ?auto_704780 ?auto_704786 ) ) ( not ( = ?auto_704780 ?auto_704787 ) ) ( not ( = ?auto_704780 ?auto_704788 ) ) ( not ( = ?auto_704780 ?auto_704789 ) ) ( not ( = ?auto_704780 ?auto_704790 ) ) ( not ( = ?auto_704781 ?auto_704782 ) ) ( not ( = ?auto_704781 ?auto_704783 ) ) ( not ( = ?auto_704781 ?auto_704784 ) ) ( not ( = ?auto_704781 ?auto_704785 ) ) ( not ( = ?auto_704781 ?auto_704786 ) ) ( not ( = ?auto_704781 ?auto_704787 ) ) ( not ( = ?auto_704781 ?auto_704788 ) ) ( not ( = ?auto_704781 ?auto_704789 ) ) ( not ( = ?auto_704781 ?auto_704790 ) ) ( not ( = ?auto_704782 ?auto_704783 ) ) ( not ( = ?auto_704782 ?auto_704784 ) ) ( not ( = ?auto_704782 ?auto_704785 ) ) ( not ( = ?auto_704782 ?auto_704786 ) ) ( not ( = ?auto_704782 ?auto_704787 ) ) ( not ( = ?auto_704782 ?auto_704788 ) ) ( not ( = ?auto_704782 ?auto_704789 ) ) ( not ( = ?auto_704782 ?auto_704790 ) ) ( not ( = ?auto_704783 ?auto_704784 ) ) ( not ( = ?auto_704783 ?auto_704785 ) ) ( not ( = ?auto_704783 ?auto_704786 ) ) ( not ( = ?auto_704783 ?auto_704787 ) ) ( not ( = ?auto_704783 ?auto_704788 ) ) ( not ( = ?auto_704783 ?auto_704789 ) ) ( not ( = ?auto_704783 ?auto_704790 ) ) ( not ( = ?auto_704784 ?auto_704785 ) ) ( not ( = ?auto_704784 ?auto_704786 ) ) ( not ( = ?auto_704784 ?auto_704787 ) ) ( not ( = ?auto_704784 ?auto_704788 ) ) ( not ( = ?auto_704784 ?auto_704789 ) ) ( not ( = ?auto_704784 ?auto_704790 ) ) ( not ( = ?auto_704785 ?auto_704786 ) ) ( not ( = ?auto_704785 ?auto_704787 ) ) ( not ( = ?auto_704785 ?auto_704788 ) ) ( not ( = ?auto_704785 ?auto_704789 ) ) ( not ( = ?auto_704785 ?auto_704790 ) ) ( not ( = ?auto_704786 ?auto_704787 ) ) ( not ( = ?auto_704786 ?auto_704788 ) ) ( not ( = ?auto_704786 ?auto_704789 ) ) ( not ( = ?auto_704786 ?auto_704790 ) ) ( not ( = ?auto_704787 ?auto_704788 ) ) ( not ( = ?auto_704787 ?auto_704789 ) ) ( not ( = ?auto_704787 ?auto_704790 ) ) ( not ( = ?auto_704788 ?auto_704789 ) ) ( not ( = ?auto_704788 ?auto_704790 ) ) ( not ( = ?auto_704789 ?auto_704790 ) ) ( ON ?auto_704788 ?auto_704789 ) ( ON ?auto_704787 ?auto_704788 ) ( ON ?auto_704786 ?auto_704787 ) ( ON ?auto_704785 ?auto_704786 ) ( CLEAR ?auto_704783 ) ( ON ?auto_704784 ?auto_704785 ) ( CLEAR ?auto_704784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_704778 ?auto_704779 ?auto_704780 ?auto_704781 ?auto_704782 ?auto_704783 ?auto_704784 )
      ( MAKE-12PILE ?auto_704778 ?auto_704779 ?auto_704780 ?auto_704781 ?auto_704782 ?auto_704783 ?auto_704784 ?auto_704785 ?auto_704786 ?auto_704787 ?auto_704788 ?auto_704789 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704828 - BLOCK
      ?auto_704829 - BLOCK
      ?auto_704830 - BLOCK
      ?auto_704831 - BLOCK
      ?auto_704832 - BLOCK
      ?auto_704833 - BLOCK
      ?auto_704834 - BLOCK
      ?auto_704835 - BLOCK
      ?auto_704836 - BLOCK
      ?auto_704837 - BLOCK
      ?auto_704838 - BLOCK
      ?auto_704839 - BLOCK
    )
    :vars
    (
      ?auto_704840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704839 ?auto_704840 ) ( ON-TABLE ?auto_704828 ) ( ON ?auto_704829 ?auto_704828 ) ( ON ?auto_704830 ?auto_704829 ) ( ON ?auto_704831 ?auto_704830 ) ( ON ?auto_704832 ?auto_704831 ) ( not ( = ?auto_704828 ?auto_704829 ) ) ( not ( = ?auto_704828 ?auto_704830 ) ) ( not ( = ?auto_704828 ?auto_704831 ) ) ( not ( = ?auto_704828 ?auto_704832 ) ) ( not ( = ?auto_704828 ?auto_704833 ) ) ( not ( = ?auto_704828 ?auto_704834 ) ) ( not ( = ?auto_704828 ?auto_704835 ) ) ( not ( = ?auto_704828 ?auto_704836 ) ) ( not ( = ?auto_704828 ?auto_704837 ) ) ( not ( = ?auto_704828 ?auto_704838 ) ) ( not ( = ?auto_704828 ?auto_704839 ) ) ( not ( = ?auto_704828 ?auto_704840 ) ) ( not ( = ?auto_704829 ?auto_704830 ) ) ( not ( = ?auto_704829 ?auto_704831 ) ) ( not ( = ?auto_704829 ?auto_704832 ) ) ( not ( = ?auto_704829 ?auto_704833 ) ) ( not ( = ?auto_704829 ?auto_704834 ) ) ( not ( = ?auto_704829 ?auto_704835 ) ) ( not ( = ?auto_704829 ?auto_704836 ) ) ( not ( = ?auto_704829 ?auto_704837 ) ) ( not ( = ?auto_704829 ?auto_704838 ) ) ( not ( = ?auto_704829 ?auto_704839 ) ) ( not ( = ?auto_704829 ?auto_704840 ) ) ( not ( = ?auto_704830 ?auto_704831 ) ) ( not ( = ?auto_704830 ?auto_704832 ) ) ( not ( = ?auto_704830 ?auto_704833 ) ) ( not ( = ?auto_704830 ?auto_704834 ) ) ( not ( = ?auto_704830 ?auto_704835 ) ) ( not ( = ?auto_704830 ?auto_704836 ) ) ( not ( = ?auto_704830 ?auto_704837 ) ) ( not ( = ?auto_704830 ?auto_704838 ) ) ( not ( = ?auto_704830 ?auto_704839 ) ) ( not ( = ?auto_704830 ?auto_704840 ) ) ( not ( = ?auto_704831 ?auto_704832 ) ) ( not ( = ?auto_704831 ?auto_704833 ) ) ( not ( = ?auto_704831 ?auto_704834 ) ) ( not ( = ?auto_704831 ?auto_704835 ) ) ( not ( = ?auto_704831 ?auto_704836 ) ) ( not ( = ?auto_704831 ?auto_704837 ) ) ( not ( = ?auto_704831 ?auto_704838 ) ) ( not ( = ?auto_704831 ?auto_704839 ) ) ( not ( = ?auto_704831 ?auto_704840 ) ) ( not ( = ?auto_704832 ?auto_704833 ) ) ( not ( = ?auto_704832 ?auto_704834 ) ) ( not ( = ?auto_704832 ?auto_704835 ) ) ( not ( = ?auto_704832 ?auto_704836 ) ) ( not ( = ?auto_704832 ?auto_704837 ) ) ( not ( = ?auto_704832 ?auto_704838 ) ) ( not ( = ?auto_704832 ?auto_704839 ) ) ( not ( = ?auto_704832 ?auto_704840 ) ) ( not ( = ?auto_704833 ?auto_704834 ) ) ( not ( = ?auto_704833 ?auto_704835 ) ) ( not ( = ?auto_704833 ?auto_704836 ) ) ( not ( = ?auto_704833 ?auto_704837 ) ) ( not ( = ?auto_704833 ?auto_704838 ) ) ( not ( = ?auto_704833 ?auto_704839 ) ) ( not ( = ?auto_704833 ?auto_704840 ) ) ( not ( = ?auto_704834 ?auto_704835 ) ) ( not ( = ?auto_704834 ?auto_704836 ) ) ( not ( = ?auto_704834 ?auto_704837 ) ) ( not ( = ?auto_704834 ?auto_704838 ) ) ( not ( = ?auto_704834 ?auto_704839 ) ) ( not ( = ?auto_704834 ?auto_704840 ) ) ( not ( = ?auto_704835 ?auto_704836 ) ) ( not ( = ?auto_704835 ?auto_704837 ) ) ( not ( = ?auto_704835 ?auto_704838 ) ) ( not ( = ?auto_704835 ?auto_704839 ) ) ( not ( = ?auto_704835 ?auto_704840 ) ) ( not ( = ?auto_704836 ?auto_704837 ) ) ( not ( = ?auto_704836 ?auto_704838 ) ) ( not ( = ?auto_704836 ?auto_704839 ) ) ( not ( = ?auto_704836 ?auto_704840 ) ) ( not ( = ?auto_704837 ?auto_704838 ) ) ( not ( = ?auto_704837 ?auto_704839 ) ) ( not ( = ?auto_704837 ?auto_704840 ) ) ( not ( = ?auto_704838 ?auto_704839 ) ) ( not ( = ?auto_704838 ?auto_704840 ) ) ( not ( = ?auto_704839 ?auto_704840 ) ) ( ON ?auto_704838 ?auto_704839 ) ( ON ?auto_704837 ?auto_704838 ) ( ON ?auto_704836 ?auto_704837 ) ( ON ?auto_704835 ?auto_704836 ) ( ON ?auto_704834 ?auto_704835 ) ( CLEAR ?auto_704832 ) ( ON ?auto_704833 ?auto_704834 ) ( CLEAR ?auto_704833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_704828 ?auto_704829 ?auto_704830 ?auto_704831 ?auto_704832 ?auto_704833 )
      ( MAKE-12PILE ?auto_704828 ?auto_704829 ?auto_704830 ?auto_704831 ?auto_704832 ?auto_704833 ?auto_704834 ?auto_704835 ?auto_704836 ?auto_704837 ?auto_704838 ?auto_704839 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704878 - BLOCK
      ?auto_704879 - BLOCK
      ?auto_704880 - BLOCK
      ?auto_704881 - BLOCK
      ?auto_704882 - BLOCK
      ?auto_704883 - BLOCK
      ?auto_704884 - BLOCK
      ?auto_704885 - BLOCK
      ?auto_704886 - BLOCK
      ?auto_704887 - BLOCK
      ?auto_704888 - BLOCK
      ?auto_704889 - BLOCK
    )
    :vars
    (
      ?auto_704890 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704889 ?auto_704890 ) ( ON-TABLE ?auto_704878 ) ( ON ?auto_704879 ?auto_704878 ) ( ON ?auto_704880 ?auto_704879 ) ( ON ?auto_704881 ?auto_704880 ) ( not ( = ?auto_704878 ?auto_704879 ) ) ( not ( = ?auto_704878 ?auto_704880 ) ) ( not ( = ?auto_704878 ?auto_704881 ) ) ( not ( = ?auto_704878 ?auto_704882 ) ) ( not ( = ?auto_704878 ?auto_704883 ) ) ( not ( = ?auto_704878 ?auto_704884 ) ) ( not ( = ?auto_704878 ?auto_704885 ) ) ( not ( = ?auto_704878 ?auto_704886 ) ) ( not ( = ?auto_704878 ?auto_704887 ) ) ( not ( = ?auto_704878 ?auto_704888 ) ) ( not ( = ?auto_704878 ?auto_704889 ) ) ( not ( = ?auto_704878 ?auto_704890 ) ) ( not ( = ?auto_704879 ?auto_704880 ) ) ( not ( = ?auto_704879 ?auto_704881 ) ) ( not ( = ?auto_704879 ?auto_704882 ) ) ( not ( = ?auto_704879 ?auto_704883 ) ) ( not ( = ?auto_704879 ?auto_704884 ) ) ( not ( = ?auto_704879 ?auto_704885 ) ) ( not ( = ?auto_704879 ?auto_704886 ) ) ( not ( = ?auto_704879 ?auto_704887 ) ) ( not ( = ?auto_704879 ?auto_704888 ) ) ( not ( = ?auto_704879 ?auto_704889 ) ) ( not ( = ?auto_704879 ?auto_704890 ) ) ( not ( = ?auto_704880 ?auto_704881 ) ) ( not ( = ?auto_704880 ?auto_704882 ) ) ( not ( = ?auto_704880 ?auto_704883 ) ) ( not ( = ?auto_704880 ?auto_704884 ) ) ( not ( = ?auto_704880 ?auto_704885 ) ) ( not ( = ?auto_704880 ?auto_704886 ) ) ( not ( = ?auto_704880 ?auto_704887 ) ) ( not ( = ?auto_704880 ?auto_704888 ) ) ( not ( = ?auto_704880 ?auto_704889 ) ) ( not ( = ?auto_704880 ?auto_704890 ) ) ( not ( = ?auto_704881 ?auto_704882 ) ) ( not ( = ?auto_704881 ?auto_704883 ) ) ( not ( = ?auto_704881 ?auto_704884 ) ) ( not ( = ?auto_704881 ?auto_704885 ) ) ( not ( = ?auto_704881 ?auto_704886 ) ) ( not ( = ?auto_704881 ?auto_704887 ) ) ( not ( = ?auto_704881 ?auto_704888 ) ) ( not ( = ?auto_704881 ?auto_704889 ) ) ( not ( = ?auto_704881 ?auto_704890 ) ) ( not ( = ?auto_704882 ?auto_704883 ) ) ( not ( = ?auto_704882 ?auto_704884 ) ) ( not ( = ?auto_704882 ?auto_704885 ) ) ( not ( = ?auto_704882 ?auto_704886 ) ) ( not ( = ?auto_704882 ?auto_704887 ) ) ( not ( = ?auto_704882 ?auto_704888 ) ) ( not ( = ?auto_704882 ?auto_704889 ) ) ( not ( = ?auto_704882 ?auto_704890 ) ) ( not ( = ?auto_704883 ?auto_704884 ) ) ( not ( = ?auto_704883 ?auto_704885 ) ) ( not ( = ?auto_704883 ?auto_704886 ) ) ( not ( = ?auto_704883 ?auto_704887 ) ) ( not ( = ?auto_704883 ?auto_704888 ) ) ( not ( = ?auto_704883 ?auto_704889 ) ) ( not ( = ?auto_704883 ?auto_704890 ) ) ( not ( = ?auto_704884 ?auto_704885 ) ) ( not ( = ?auto_704884 ?auto_704886 ) ) ( not ( = ?auto_704884 ?auto_704887 ) ) ( not ( = ?auto_704884 ?auto_704888 ) ) ( not ( = ?auto_704884 ?auto_704889 ) ) ( not ( = ?auto_704884 ?auto_704890 ) ) ( not ( = ?auto_704885 ?auto_704886 ) ) ( not ( = ?auto_704885 ?auto_704887 ) ) ( not ( = ?auto_704885 ?auto_704888 ) ) ( not ( = ?auto_704885 ?auto_704889 ) ) ( not ( = ?auto_704885 ?auto_704890 ) ) ( not ( = ?auto_704886 ?auto_704887 ) ) ( not ( = ?auto_704886 ?auto_704888 ) ) ( not ( = ?auto_704886 ?auto_704889 ) ) ( not ( = ?auto_704886 ?auto_704890 ) ) ( not ( = ?auto_704887 ?auto_704888 ) ) ( not ( = ?auto_704887 ?auto_704889 ) ) ( not ( = ?auto_704887 ?auto_704890 ) ) ( not ( = ?auto_704888 ?auto_704889 ) ) ( not ( = ?auto_704888 ?auto_704890 ) ) ( not ( = ?auto_704889 ?auto_704890 ) ) ( ON ?auto_704888 ?auto_704889 ) ( ON ?auto_704887 ?auto_704888 ) ( ON ?auto_704886 ?auto_704887 ) ( ON ?auto_704885 ?auto_704886 ) ( ON ?auto_704884 ?auto_704885 ) ( ON ?auto_704883 ?auto_704884 ) ( CLEAR ?auto_704881 ) ( ON ?auto_704882 ?auto_704883 ) ( CLEAR ?auto_704882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_704878 ?auto_704879 ?auto_704880 ?auto_704881 ?auto_704882 )
      ( MAKE-12PILE ?auto_704878 ?auto_704879 ?auto_704880 ?auto_704881 ?auto_704882 ?auto_704883 ?auto_704884 ?auto_704885 ?auto_704886 ?auto_704887 ?auto_704888 ?auto_704889 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704928 - BLOCK
      ?auto_704929 - BLOCK
      ?auto_704930 - BLOCK
      ?auto_704931 - BLOCK
      ?auto_704932 - BLOCK
      ?auto_704933 - BLOCK
      ?auto_704934 - BLOCK
      ?auto_704935 - BLOCK
      ?auto_704936 - BLOCK
      ?auto_704937 - BLOCK
      ?auto_704938 - BLOCK
      ?auto_704939 - BLOCK
    )
    :vars
    (
      ?auto_704940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704939 ?auto_704940 ) ( ON-TABLE ?auto_704928 ) ( ON ?auto_704929 ?auto_704928 ) ( ON ?auto_704930 ?auto_704929 ) ( not ( = ?auto_704928 ?auto_704929 ) ) ( not ( = ?auto_704928 ?auto_704930 ) ) ( not ( = ?auto_704928 ?auto_704931 ) ) ( not ( = ?auto_704928 ?auto_704932 ) ) ( not ( = ?auto_704928 ?auto_704933 ) ) ( not ( = ?auto_704928 ?auto_704934 ) ) ( not ( = ?auto_704928 ?auto_704935 ) ) ( not ( = ?auto_704928 ?auto_704936 ) ) ( not ( = ?auto_704928 ?auto_704937 ) ) ( not ( = ?auto_704928 ?auto_704938 ) ) ( not ( = ?auto_704928 ?auto_704939 ) ) ( not ( = ?auto_704928 ?auto_704940 ) ) ( not ( = ?auto_704929 ?auto_704930 ) ) ( not ( = ?auto_704929 ?auto_704931 ) ) ( not ( = ?auto_704929 ?auto_704932 ) ) ( not ( = ?auto_704929 ?auto_704933 ) ) ( not ( = ?auto_704929 ?auto_704934 ) ) ( not ( = ?auto_704929 ?auto_704935 ) ) ( not ( = ?auto_704929 ?auto_704936 ) ) ( not ( = ?auto_704929 ?auto_704937 ) ) ( not ( = ?auto_704929 ?auto_704938 ) ) ( not ( = ?auto_704929 ?auto_704939 ) ) ( not ( = ?auto_704929 ?auto_704940 ) ) ( not ( = ?auto_704930 ?auto_704931 ) ) ( not ( = ?auto_704930 ?auto_704932 ) ) ( not ( = ?auto_704930 ?auto_704933 ) ) ( not ( = ?auto_704930 ?auto_704934 ) ) ( not ( = ?auto_704930 ?auto_704935 ) ) ( not ( = ?auto_704930 ?auto_704936 ) ) ( not ( = ?auto_704930 ?auto_704937 ) ) ( not ( = ?auto_704930 ?auto_704938 ) ) ( not ( = ?auto_704930 ?auto_704939 ) ) ( not ( = ?auto_704930 ?auto_704940 ) ) ( not ( = ?auto_704931 ?auto_704932 ) ) ( not ( = ?auto_704931 ?auto_704933 ) ) ( not ( = ?auto_704931 ?auto_704934 ) ) ( not ( = ?auto_704931 ?auto_704935 ) ) ( not ( = ?auto_704931 ?auto_704936 ) ) ( not ( = ?auto_704931 ?auto_704937 ) ) ( not ( = ?auto_704931 ?auto_704938 ) ) ( not ( = ?auto_704931 ?auto_704939 ) ) ( not ( = ?auto_704931 ?auto_704940 ) ) ( not ( = ?auto_704932 ?auto_704933 ) ) ( not ( = ?auto_704932 ?auto_704934 ) ) ( not ( = ?auto_704932 ?auto_704935 ) ) ( not ( = ?auto_704932 ?auto_704936 ) ) ( not ( = ?auto_704932 ?auto_704937 ) ) ( not ( = ?auto_704932 ?auto_704938 ) ) ( not ( = ?auto_704932 ?auto_704939 ) ) ( not ( = ?auto_704932 ?auto_704940 ) ) ( not ( = ?auto_704933 ?auto_704934 ) ) ( not ( = ?auto_704933 ?auto_704935 ) ) ( not ( = ?auto_704933 ?auto_704936 ) ) ( not ( = ?auto_704933 ?auto_704937 ) ) ( not ( = ?auto_704933 ?auto_704938 ) ) ( not ( = ?auto_704933 ?auto_704939 ) ) ( not ( = ?auto_704933 ?auto_704940 ) ) ( not ( = ?auto_704934 ?auto_704935 ) ) ( not ( = ?auto_704934 ?auto_704936 ) ) ( not ( = ?auto_704934 ?auto_704937 ) ) ( not ( = ?auto_704934 ?auto_704938 ) ) ( not ( = ?auto_704934 ?auto_704939 ) ) ( not ( = ?auto_704934 ?auto_704940 ) ) ( not ( = ?auto_704935 ?auto_704936 ) ) ( not ( = ?auto_704935 ?auto_704937 ) ) ( not ( = ?auto_704935 ?auto_704938 ) ) ( not ( = ?auto_704935 ?auto_704939 ) ) ( not ( = ?auto_704935 ?auto_704940 ) ) ( not ( = ?auto_704936 ?auto_704937 ) ) ( not ( = ?auto_704936 ?auto_704938 ) ) ( not ( = ?auto_704936 ?auto_704939 ) ) ( not ( = ?auto_704936 ?auto_704940 ) ) ( not ( = ?auto_704937 ?auto_704938 ) ) ( not ( = ?auto_704937 ?auto_704939 ) ) ( not ( = ?auto_704937 ?auto_704940 ) ) ( not ( = ?auto_704938 ?auto_704939 ) ) ( not ( = ?auto_704938 ?auto_704940 ) ) ( not ( = ?auto_704939 ?auto_704940 ) ) ( ON ?auto_704938 ?auto_704939 ) ( ON ?auto_704937 ?auto_704938 ) ( ON ?auto_704936 ?auto_704937 ) ( ON ?auto_704935 ?auto_704936 ) ( ON ?auto_704934 ?auto_704935 ) ( ON ?auto_704933 ?auto_704934 ) ( ON ?auto_704932 ?auto_704933 ) ( CLEAR ?auto_704930 ) ( ON ?auto_704931 ?auto_704932 ) ( CLEAR ?auto_704931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_704928 ?auto_704929 ?auto_704930 ?auto_704931 )
      ( MAKE-12PILE ?auto_704928 ?auto_704929 ?auto_704930 ?auto_704931 ?auto_704932 ?auto_704933 ?auto_704934 ?auto_704935 ?auto_704936 ?auto_704937 ?auto_704938 ?auto_704939 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_704978 - BLOCK
      ?auto_704979 - BLOCK
      ?auto_704980 - BLOCK
      ?auto_704981 - BLOCK
      ?auto_704982 - BLOCK
      ?auto_704983 - BLOCK
      ?auto_704984 - BLOCK
      ?auto_704985 - BLOCK
      ?auto_704986 - BLOCK
      ?auto_704987 - BLOCK
      ?auto_704988 - BLOCK
      ?auto_704989 - BLOCK
    )
    :vars
    (
      ?auto_704990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_704989 ?auto_704990 ) ( ON-TABLE ?auto_704978 ) ( ON ?auto_704979 ?auto_704978 ) ( not ( = ?auto_704978 ?auto_704979 ) ) ( not ( = ?auto_704978 ?auto_704980 ) ) ( not ( = ?auto_704978 ?auto_704981 ) ) ( not ( = ?auto_704978 ?auto_704982 ) ) ( not ( = ?auto_704978 ?auto_704983 ) ) ( not ( = ?auto_704978 ?auto_704984 ) ) ( not ( = ?auto_704978 ?auto_704985 ) ) ( not ( = ?auto_704978 ?auto_704986 ) ) ( not ( = ?auto_704978 ?auto_704987 ) ) ( not ( = ?auto_704978 ?auto_704988 ) ) ( not ( = ?auto_704978 ?auto_704989 ) ) ( not ( = ?auto_704978 ?auto_704990 ) ) ( not ( = ?auto_704979 ?auto_704980 ) ) ( not ( = ?auto_704979 ?auto_704981 ) ) ( not ( = ?auto_704979 ?auto_704982 ) ) ( not ( = ?auto_704979 ?auto_704983 ) ) ( not ( = ?auto_704979 ?auto_704984 ) ) ( not ( = ?auto_704979 ?auto_704985 ) ) ( not ( = ?auto_704979 ?auto_704986 ) ) ( not ( = ?auto_704979 ?auto_704987 ) ) ( not ( = ?auto_704979 ?auto_704988 ) ) ( not ( = ?auto_704979 ?auto_704989 ) ) ( not ( = ?auto_704979 ?auto_704990 ) ) ( not ( = ?auto_704980 ?auto_704981 ) ) ( not ( = ?auto_704980 ?auto_704982 ) ) ( not ( = ?auto_704980 ?auto_704983 ) ) ( not ( = ?auto_704980 ?auto_704984 ) ) ( not ( = ?auto_704980 ?auto_704985 ) ) ( not ( = ?auto_704980 ?auto_704986 ) ) ( not ( = ?auto_704980 ?auto_704987 ) ) ( not ( = ?auto_704980 ?auto_704988 ) ) ( not ( = ?auto_704980 ?auto_704989 ) ) ( not ( = ?auto_704980 ?auto_704990 ) ) ( not ( = ?auto_704981 ?auto_704982 ) ) ( not ( = ?auto_704981 ?auto_704983 ) ) ( not ( = ?auto_704981 ?auto_704984 ) ) ( not ( = ?auto_704981 ?auto_704985 ) ) ( not ( = ?auto_704981 ?auto_704986 ) ) ( not ( = ?auto_704981 ?auto_704987 ) ) ( not ( = ?auto_704981 ?auto_704988 ) ) ( not ( = ?auto_704981 ?auto_704989 ) ) ( not ( = ?auto_704981 ?auto_704990 ) ) ( not ( = ?auto_704982 ?auto_704983 ) ) ( not ( = ?auto_704982 ?auto_704984 ) ) ( not ( = ?auto_704982 ?auto_704985 ) ) ( not ( = ?auto_704982 ?auto_704986 ) ) ( not ( = ?auto_704982 ?auto_704987 ) ) ( not ( = ?auto_704982 ?auto_704988 ) ) ( not ( = ?auto_704982 ?auto_704989 ) ) ( not ( = ?auto_704982 ?auto_704990 ) ) ( not ( = ?auto_704983 ?auto_704984 ) ) ( not ( = ?auto_704983 ?auto_704985 ) ) ( not ( = ?auto_704983 ?auto_704986 ) ) ( not ( = ?auto_704983 ?auto_704987 ) ) ( not ( = ?auto_704983 ?auto_704988 ) ) ( not ( = ?auto_704983 ?auto_704989 ) ) ( not ( = ?auto_704983 ?auto_704990 ) ) ( not ( = ?auto_704984 ?auto_704985 ) ) ( not ( = ?auto_704984 ?auto_704986 ) ) ( not ( = ?auto_704984 ?auto_704987 ) ) ( not ( = ?auto_704984 ?auto_704988 ) ) ( not ( = ?auto_704984 ?auto_704989 ) ) ( not ( = ?auto_704984 ?auto_704990 ) ) ( not ( = ?auto_704985 ?auto_704986 ) ) ( not ( = ?auto_704985 ?auto_704987 ) ) ( not ( = ?auto_704985 ?auto_704988 ) ) ( not ( = ?auto_704985 ?auto_704989 ) ) ( not ( = ?auto_704985 ?auto_704990 ) ) ( not ( = ?auto_704986 ?auto_704987 ) ) ( not ( = ?auto_704986 ?auto_704988 ) ) ( not ( = ?auto_704986 ?auto_704989 ) ) ( not ( = ?auto_704986 ?auto_704990 ) ) ( not ( = ?auto_704987 ?auto_704988 ) ) ( not ( = ?auto_704987 ?auto_704989 ) ) ( not ( = ?auto_704987 ?auto_704990 ) ) ( not ( = ?auto_704988 ?auto_704989 ) ) ( not ( = ?auto_704988 ?auto_704990 ) ) ( not ( = ?auto_704989 ?auto_704990 ) ) ( ON ?auto_704988 ?auto_704989 ) ( ON ?auto_704987 ?auto_704988 ) ( ON ?auto_704986 ?auto_704987 ) ( ON ?auto_704985 ?auto_704986 ) ( ON ?auto_704984 ?auto_704985 ) ( ON ?auto_704983 ?auto_704984 ) ( ON ?auto_704982 ?auto_704983 ) ( ON ?auto_704981 ?auto_704982 ) ( CLEAR ?auto_704979 ) ( ON ?auto_704980 ?auto_704981 ) ( CLEAR ?auto_704980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_704978 ?auto_704979 ?auto_704980 )
      ( MAKE-12PILE ?auto_704978 ?auto_704979 ?auto_704980 ?auto_704981 ?auto_704982 ?auto_704983 ?auto_704984 ?auto_704985 ?auto_704986 ?auto_704987 ?auto_704988 ?auto_704989 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_705028 - BLOCK
      ?auto_705029 - BLOCK
      ?auto_705030 - BLOCK
      ?auto_705031 - BLOCK
      ?auto_705032 - BLOCK
      ?auto_705033 - BLOCK
      ?auto_705034 - BLOCK
      ?auto_705035 - BLOCK
      ?auto_705036 - BLOCK
      ?auto_705037 - BLOCK
      ?auto_705038 - BLOCK
      ?auto_705039 - BLOCK
    )
    :vars
    (
      ?auto_705040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705039 ?auto_705040 ) ( ON-TABLE ?auto_705028 ) ( not ( = ?auto_705028 ?auto_705029 ) ) ( not ( = ?auto_705028 ?auto_705030 ) ) ( not ( = ?auto_705028 ?auto_705031 ) ) ( not ( = ?auto_705028 ?auto_705032 ) ) ( not ( = ?auto_705028 ?auto_705033 ) ) ( not ( = ?auto_705028 ?auto_705034 ) ) ( not ( = ?auto_705028 ?auto_705035 ) ) ( not ( = ?auto_705028 ?auto_705036 ) ) ( not ( = ?auto_705028 ?auto_705037 ) ) ( not ( = ?auto_705028 ?auto_705038 ) ) ( not ( = ?auto_705028 ?auto_705039 ) ) ( not ( = ?auto_705028 ?auto_705040 ) ) ( not ( = ?auto_705029 ?auto_705030 ) ) ( not ( = ?auto_705029 ?auto_705031 ) ) ( not ( = ?auto_705029 ?auto_705032 ) ) ( not ( = ?auto_705029 ?auto_705033 ) ) ( not ( = ?auto_705029 ?auto_705034 ) ) ( not ( = ?auto_705029 ?auto_705035 ) ) ( not ( = ?auto_705029 ?auto_705036 ) ) ( not ( = ?auto_705029 ?auto_705037 ) ) ( not ( = ?auto_705029 ?auto_705038 ) ) ( not ( = ?auto_705029 ?auto_705039 ) ) ( not ( = ?auto_705029 ?auto_705040 ) ) ( not ( = ?auto_705030 ?auto_705031 ) ) ( not ( = ?auto_705030 ?auto_705032 ) ) ( not ( = ?auto_705030 ?auto_705033 ) ) ( not ( = ?auto_705030 ?auto_705034 ) ) ( not ( = ?auto_705030 ?auto_705035 ) ) ( not ( = ?auto_705030 ?auto_705036 ) ) ( not ( = ?auto_705030 ?auto_705037 ) ) ( not ( = ?auto_705030 ?auto_705038 ) ) ( not ( = ?auto_705030 ?auto_705039 ) ) ( not ( = ?auto_705030 ?auto_705040 ) ) ( not ( = ?auto_705031 ?auto_705032 ) ) ( not ( = ?auto_705031 ?auto_705033 ) ) ( not ( = ?auto_705031 ?auto_705034 ) ) ( not ( = ?auto_705031 ?auto_705035 ) ) ( not ( = ?auto_705031 ?auto_705036 ) ) ( not ( = ?auto_705031 ?auto_705037 ) ) ( not ( = ?auto_705031 ?auto_705038 ) ) ( not ( = ?auto_705031 ?auto_705039 ) ) ( not ( = ?auto_705031 ?auto_705040 ) ) ( not ( = ?auto_705032 ?auto_705033 ) ) ( not ( = ?auto_705032 ?auto_705034 ) ) ( not ( = ?auto_705032 ?auto_705035 ) ) ( not ( = ?auto_705032 ?auto_705036 ) ) ( not ( = ?auto_705032 ?auto_705037 ) ) ( not ( = ?auto_705032 ?auto_705038 ) ) ( not ( = ?auto_705032 ?auto_705039 ) ) ( not ( = ?auto_705032 ?auto_705040 ) ) ( not ( = ?auto_705033 ?auto_705034 ) ) ( not ( = ?auto_705033 ?auto_705035 ) ) ( not ( = ?auto_705033 ?auto_705036 ) ) ( not ( = ?auto_705033 ?auto_705037 ) ) ( not ( = ?auto_705033 ?auto_705038 ) ) ( not ( = ?auto_705033 ?auto_705039 ) ) ( not ( = ?auto_705033 ?auto_705040 ) ) ( not ( = ?auto_705034 ?auto_705035 ) ) ( not ( = ?auto_705034 ?auto_705036 ) ) ( not ( = ?auto_705034 ?auto_705037 ) ) ( not ( = ?auto_705034 ?auto_705038 ) ) ( not ( = ?auto_705034 ?auto_705039 ) ) ( not ( = ?auto_705034 ?auto_705040 ) ) ( not ( = ?auto_705035 ?auto_705036 ) ) ( not ( = ?auto_705035 ?auto_705037 ) ) ( not ( = ?auto_705035 ?auto_705038 ) ) ( not ( = ?auto_705035 ?auto_705039 ) ) ( not ( = ?auto_705035 ?auto_705040 ) ) ( not ( = ?auto_705036 ?auto_705037 ) ) ( not ( = ?auto_705036 ?auto_705038 ) ) ( not ( = ?auto_705036 ?auto_705039 ) ) ( not ( = ?auto_705036 ?auto_705040 ) ) ( not ( = ?auto_705037 ?auto_705038 ) ) ( not ( = ?auto_705037 ?auto_705039 ) ) ( not ( = ?auto_705037 ?auto_705040 ) ) ( not ( = ?auto_705038 ?auto_705039 ) ) ( not ( = ?auto_705038 ?auto_705040 ) ) ( not ( = ?auto_705039 ?auto_705040 ) ) ( ON ?auto_705038 ?auto_705039 ) ( ON ?auto_705037 ?auto_705038 ) ( ON ?auto_705036 ?auto_705037 ) ( ON ?auto_705035 ?auto_705036 ) ( ON ?auto_705034 ?auto_705035 ) ( ON ?auto_705033 ?auto_705034 ) ( ON ?auto_705032 ?auto_705033 ) ( ON ?auto_705031 ?auto_705032 ) ( ON ?auto_705030 ?auto_705031 ) ( CLEAR ?auto_705028 ) ( ON ?auto_705029 ?auto_705030 ) ( CLEAR ?auto_705029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_705028 ?auto_705029 )
      ( MAKE-12PILE ?auto_705028 ?auto_705029 ?auto_705030 ?auto_705031 ?auto_705032 ?auto_705033 ?auto_705034 ?auto_705035 ?auto_705036 ?auto_705037 ?auto_705038 ?auto_705039 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_705078 - BLOCK
      ?auto_705079 - BLOCK
      ?auto_705080 - BLOCK
      ?auto_705081 - BLOCK
      ?auto_705082 - BLOCK
      ?auto_705083 - BLOCK
      ?auto_705084 - BLOCK
      ?auto_705085 - BLOCK
      ?auto_705086 - BLOCK
      ?auto_705087 - BLOCK
      ?auto_705088 - BLOCK
      ?auto_705089 - BLOCK
    )
    :vars
    (
      ?auto_705090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705089 ?auto_705090 ) ( not ( = ?auto_705078 ?auto_705079 ) ) ( not ( = ?auto_705078 ?auto_705080 ) ) ( not ( = ?auto_705078 ?auto_705081 ) ) ( not ( = ?auto_705078 ?auto_705082 ) ) ( not ( = ?auto_705078 ?auto_705083 ) ) ( not ( = ?auto_705078 ?auto_705084 ) ) ( not ( = ?auto_705078 ?auto_705085 ) ) ( not ( = ?auto_705078 ?auto_705086 ) ) ( not ( = ?auto_705078 ?auto_705087 ) ) ( not ( = ?auto_705078 ?auto_705088 ) ) ( not ( = ?auto_705078 ?auto_705089 ) ) ( not ( = ?auto_705078 ?auto_705090 ) ) ( not ( = ?auto_705079 ?auto_705080 ) ) ( not ( = ?auto_705079 ?auto_705081 ) ) ( not ( = ?auto_705079 ?auto_705082 ) ) ( not ( = ?auto_705079 ?auto_705083 ) ) ( not ( = ?auto_705079 ?auto_705084 ) ) ( not ( = ?auto_705079 ?auto_705085 ) ) ( not ( = ?auto_705079 ?auto_705086 ) ) ( not ( = ?auto_705079 ?auto_705087 ) ) ( not ( = ?auto_705079 ?auto_705088 ) ) ( not ( = ?auto_705079 ?auto_705089 ) ) ( not ( = ?auto_705079 ?auto_705090 ) ) ( not ( = ?auto_705080 ?auto_705081 ) ) ( not ( = ?auto_705080 ?auto_705082 ) ) ( not ( = ?auto_705080 ?auto_705083 ) ) ( not ( = ?auto_705080 ?auto_705084 ) ) ( not ( = ?auto_705080 ?auto_705085 ) ) ( not ( = ?auto_705080 ?auto_705086 ) ) ( not ( = ?auto_705080 ?auto_705087 ) ) ( not ( = ?auto_705080 ?auto_705088 ) ) ( not ( = ?auto_705080 ?auto_705089 ) ) ( not ( = ?auto_705080 ?auto_705090 ) ) ( not ( = ?auto_705081 ?auto_705082 ) ) ( not ( = ?auto_705081 ?auto_705083 ) ) ( not ( = ?auto_705081 ?auto_705084 ) ) ( not ( = ?auto_705081 ?auto_705085 ) ) ( not ( = ?auto_705081 ?auto_705086 ) ) ( not ( = ?auto_705081 ?auto_705087 ) ) ( not ( = ?auto_705081 ?auto_705088 ) ) ( not ( = ?auto_705081 ?auto_705089 ) ) ( not ( = ?auto_705081 ?auto_705090 ) ) ( not ( = ?auto_705082 ?auto_705083 ) ) ( not ( = ?auto_705082 ?auto_705084 ) ) ( not ( = ?auto_705082 ?auto_705085 ) ) ( not ( = ?auto_705082 ?auto_705086 ) ) ( not ( = ?auto_705082 ?auto_705087 ) ) ( not ( = ?auto_705082 ?auto_705088 ) ) ( not ( = ?auto_705082 ?auto_705089 ) ) ( not ( = ?auto_705082 ?auto_705090 ) ) ( not ( = ?auto_705083 ?auto_705084 ) ) ( not ( = ?auto_705083 ?auto_705085 ) ) ( not ( = ?auto_705083 ?auto_705086 ) ) ( not ( = ?auto_705083 ?auto_705087 ) ) ( not ( = ?auto_705083 ?auto_705088 ) ) ( not ( = ?auto_705083 ?auto_705089 ) ) ( not ( = ?auto_705083 ?auto_705090 ) ) ( not ( = ?auto_705084 ?auto_705085 ) ) ( not ( = ?auto_705084 ?auto_705086 ) ) ( not ( = ?auto_705084 ?auto_705087 ) ) ( not ( = ?auto_705084 ?auto_705088 ) ) ( not ( = ?auto_705084 ?auto_705089 ) ) ( not ( = ?auto_705084 ?auto_705090 ) ) ( not ( = ?auto_705085 ?auto_705086 ) ) ( not ( = ?auto_705085 ?auto_705087 ) ) ( not ( = ?auto_705085 ?auto_705088 ) ) ( not ( = ?auto_705085 ?auto_705089 ) ) ( not ( = ?auto_705085 ?auto_705090 ) ) ( not ( = ?auto_705086 ?auto_705087 ) ) ( not ( = ?auto_705086 ?auto_705088 ) ) ( not ( = ?auto_705086 ?auto_705089 ) ) ( not ( = ?auto_705086 ?auto_705090 ) ) ( not ( = ?auto_705087 ?auto_705088 ) ) ( not ( = ?auto_705087 ?auto_705089 ) ) ( not ( = ?auto_705087 ?auto_705090 ) ) ( not ( = ?auto_705088 ?auto_705089 ) ) ( not ( = ?auto_705088 ?auto_705090 ) ) ( not ( = ?auto_705089 ?auto_705090 ) ) ( ON ?auto_705088 ?auto_705089 ) ( ON ?auto_705087 ?auto_705088 ) ( ON ?auto_705086 ?auto_705087 ) ( ON ?auto_705085 ?auto_705086 ) ( ON ?auto_705084 ?auto_705085 ) ( ON ?auto_705083 ?auto_705084 ) ( ON ?auto_705082 ?auto_705083 ) ( ON ?auto_705081 ?auto_705082 ) ( ON ?auto_705080 ?auto_705081 ) ( ON ?auto_705079 ?auto_705080 ) ( ON ?auto_705078 ?auto_705079 ) ( CLEAR ?auto_705078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_705078 )
      ( MAKE-12PILE ?auto_705078 ?auto_705079 ?auto_705080 ?auto_705081 ?auto_705082 ?auto_705083 ?auto_705084 ?auto_705085 ?auto_705086 ?auto_705087 ?auto_705088 ?auto_705089 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705129 - BLOCK
      ?auto_705130 - BLOCK
      ?auto_705131 - BLOCK
      ?auto_705132 - BLOCK
      ?auto_705133 - BLOCK
      ?auto_705134 - BLOCK
      ?auto_705135 - BLOCK
      ?auto_705136 - BLOCK
      ?auto_705137 - BLOCK
      ?auto_705138 - BLOCK
      ?auto_705139 - BLOCK
      ?auto_705140 - BLOCK
      ?auto_705141 - BLOCK
    )
    :vars
    (
      ?auto_705142 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_705140 ) ( ON ?auto_705141 ?auto_705142 ) ( CLEAR ?auto_705141 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_705129 ) ( ON ?auto_705130 ?auto_705129 ) ( ON ?auto_705131 ?auto_705130 ) ( ON ?auto_705132 ?auto_705131 ) ( ON ?auto_705133 ?auto_705132 ) ( ON ?auto_705134 ?auto_705133 ) ( ON ?auto_705135 ?auto_705134 ) ( ON ?auto_705136 ?auto_705135 ) ( ON ?auto_705137 ?auto_705136 ) ( ON ?auto_705138 ?auto_705137 ) ( ON ?auto_705139 ?auto_705138 ) ( ON ?auto_705140 ?auto_705139 ) ( not ( = ?auto_705129 ?auto_705130 ) ) ( not ( = ?auto_705129 ?auto_705131 ) ) ( not ( = ?auto_705129 ?auto_705132 ) ) ( not ( = ?auto_705129 ?auto_705133 ) ) ( not ( = ?auto_705129 ?auto_705134 ) ) ( not ( = ?auto_705129 ?auto_705135 ) ) ( not ( = ?auto_705129 ?auto_705136 ) ) ( not ( = ?auto_705129 ?auto_705137 ) ) ( not ( = ?auto_705129 ?auto_705138 ) ) ( not ( = ?auto_705129 ?auto_705139 ) ) ( not ( = ?auto_705129 ?auto_705140 ) ) ( not ( = ?auto_705129 ?auto_705141 ) ) ( not ( = ?auto_705129 ?auto_705142 ) ) ( not ( = ?auto_705130 ?auto_705131 ) ) ( not ( = ?auto_705130 ?auto_705132 ) ) ( not ( = ?auto_705130 ?auto_705133 ) ) ( not ( = ?auto_705130 ?auto_705134 ) ) ( not ( = ?auto_705130 ?auto_705135 ) ) ( not ( = ?auto_705130 ?auto_705136 ) ) ( not ( = ?auto_705130 ?auto_705137 ) ) ( not ( = ?auto_705130 ?auto_705138 ) ) ( not ( = ?auto_705130 ?auto_705139 ) ) ( not ( = ?auto_705130 ?auto_705140 ) ) ( not ( = ?auto_705130 ?auto_705141 ) ) ( not ( = ?auto_705130 ?auto_705142 ) ) ( not ( = ?auto_705131 ?auto_705132 ) ) ( not ( = ?auto_705131 ?auto_705133 ) ) ( not ( = ?auto_705131 ?auto_705134 ) ) ( not ( = ?auto_705131 ?auto_705135 ) ) ( not ( = ?auto_705131 ?auto_705136 ) ) ( not ( = ?auto_705131 ?auto_705137 ) ) ( not ( = ?auto_705131 ?auto_705138 ) ) ( not ( = ?auto_705131 ?auto_705139 ) ) ( not ( = ?auto_705131 ?auto_705140 ) ) ( not ( = ?auto_705131 ?auto_705141 ) ) ( not ( = ?auto_705131 ?auto_705142 ) ) ( not ( = ?auto_705132 ?auto_705133 ) ) ( not ( = ?auto_705132 ?auto_705134 ) ) ( not ( = ?auto_705132 ?auto_705135 ) ) ( not ( = ?auto_705132 ?auto_705136 ) ) ( not ( = ?auto_705132 ?auto_705137 ) ) ( not ( = ?auto_705132 ?auto_705138 ) ) ( not ( = ?auto_705132 ?auto_705139 ) ) ( not ( = ?auto_705132 ?auto_705140 ) ) ( not ( = ?auto_705132 ?auto_705141 ) ) ( not ( = ?auto_705132 ?auto_705142 ) ) ( not ( = ?auto_705133 ?auto_705134 ) ) ( not ( = ?auto_705133 ?auto_705135 ) ) ( not ( = ?auto_705133 ?auto_705136 ) ) ( not ( = ?auto_705133 ?auto_705137 ) ) ( not ( = ?auto_705133 ?auto_705138 ) ) ( not ( = ?auto_705133 ?auto_705139 ) ) ( not ( = ?auto_705133 ?auto_705140 ) ) ( not ( = ?auto_705133 ?auto_705141 ) ) ( not ( = ?auto_705133 ?auto_705142 ) ) ( not ( = ?auto_705134 ?auto_705135 ) ) ( not ( = ?auto_705134 ?auto_705136 ) ) ( not ( = ?auto_705134 ?auto_705137 ) ) ( not ( = ?auto_705134 ?auto_705138 ) ) ( not ( = ?auto_705134 ?auto_705139 ) ) ( not ( = ?auto_705134 ?auto_705140 ) ) ( not ( = ?auto_705134 ?auto_705141 ) ) ( not ( = ?auto_705134 ?auto_705142 ) ) ( not ( = ?auto_705135 ?auto_705136 ) ) ( not ( = ?auto_705135 ?auto_705137 ) ) ( not ( = ?auto_705135 ?auto_705138 ) ) ( not ( = ?auto_705135 ?auto_705139 ) ) ( not ( = ?auto_705135 ?auto_705140 ) ) ( not ( = ?auto_705135 ?auto_705141 ) ) ( not ( = ?auto_705135 ?auto_705142 ) ) ( not ( = ?auto_705136 ?auto_705137 ) ) ( not ( = ?auto_705136 ?auto_705138 ) ) ( not ( = ?auto_705136 ?auto_705139 ) ) ( not ( = ?auto_705136 ?auto_705140 ) ) ( not ( = ?auto_705136 ?auto_705141 ) ) ( not ( = ?auto_705136 ?auto_705142 ) ) ( not ( = ?auto_705137 ?auto_705138 ) ) ( not ( = ?auto_705137 ?auto_705139 ) ) ( not ( = ?auto_705137 ?auto_705140 ) ) ( not ( = ?auto_705137 ?auto_705141 ) ) ( not ( = ?auto_705137 ?auto_705142 ) ) ( not ( = ?auto_705138 ?auto_705139 ) ) ( not ( = ?auto_705138 ?auto_705140 ) ) ( not ( = ?auto_705138 ?auto_705141 ) ) ( not ( = ?auto_705138 ?auto_705142 ) ) ( not ( = ?auto_705139 ?auto_705140 ) ) ( not ( = ?auto_705139 ?auto_705141 ) ) ( not ( = ?auto_705139 ?auto_705142 ) ) ( not ( = ?auto_705140 ?auto_705141 ) ) ( not ( = ?auto_705140 ?auto_705142 ) ) ( not ( = ?auto_705141 ?auto_705142 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_705141 ?auto_705142 )
      ( !STACK ?auto_705141 ?auto_705140 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705183 - BLOCK
      ?auto_705184 - BLOCK
      ?auto_705185 - BLOCK
      ?auto_705186 - BLOCK
      ?auto_705187 - BLOCK
      ?auto_705188 - BLOCK
      ?auto_705189 - BLOCK
      ?auto_705190 - BLOCK
      ?auto_705191 - BLOCK
      ?auto_705192 - BLOCK
      ?auto_705193 - BLOCK
      ?auto_705194 - BLOCK
      ?auto_705195 - BLOCK
    )
    :vars
    (
      ?auto_705196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705195 ?auto_705196 ) ( ON-TABLE ?auto_705183 ) ( ON ?auto_705184 ?auto_705183 ) ( ON ?auto_705185 ?auto_705184 ) ( ON ?auto_705186 ?auto_705185 ) ( ON ?auto_705187 ?auto_705186 ) ( ON ?auto_705188 ?auto_705187 ) ( ON ?auto_705189 ?auto_705188 ) ( ON ?auto_705190 ?auto_705189 ) ( ON ?auto_705191 ?auto_705190 ) ( ON ?auto_705192 ?auto_705191 ) ( ON ?auto_705193 ?auto_705192 ) ( not ( = ?auto_705183 ?auto_705184 ) ) ( not ( = ?auto_705183 ?auto_705185 ) ) ( not ( = ?auto_705183 ?auto_705186 ) ) ( not ( = ?auto_705183 ?auto_705187 ) ) ( not ( = ?auto_705183 ?auto_705188 ) ) ( not ( = ?auto_705183 ?auto_705189 ) ) ( not ( = ?auto_705183 ?auto_705190 ) ) ( not ( = ?auto_705183 ?auto_705191 ) ) ( not ( = ?auto_705183 ?auto_705192 ) ) ( not ( = ?auto_705183 ?auto_705193 ) ) ( not ( = ?auto_705183 ?auto_705194 ) ) ( not ( = ?auto_705183 ?auto_705195 ) ) ( not ( = ?auto_705183 ?auto_705196 ) ) ( not ( = ?auto_705184 ?auto_705185 ) ) ( not ( = ?auto_705184 ?auto_705186 ) ) ( not ( = ?auto_705184 ?auto_705187 ) ) ( not ( = ?auto_705184 ?auto_705188 ) ) ( not ( = ?auto_705184 ?auto_705189 ) ) ( not ( = ?auto_705184 ?auto_705190 ) ) ( not ( = ?auto_705184 ?auto_705191 ) ) ( not ( = ?auto_705184 ?auto_705192 ) ) ( not ( = ?auto_705184 ?auto_705193 ) ) ( not ( = ?auto_705184 ?auto_705194 ) ) ( not ( = ?auto_705184 ?auto_705195 ) ) ( not ( = ?auto_705184 ?auto_705196 ) ) ( not ( = ?auto_705185 ?auto_705186 ) ) ( not ( = ?auto_705185 ?auto_705187 ) ) ( not ( = ?auto_705185 ?auto_705188 ) ) ( not ( = ?auto_705185 ?auto_705189 ) ) ( not ( = ?auto_705185 ?auto_705190 ) ) ( not ( = ?auto_705185 ?auto_705191 ) ) ( not ( = ?auto_705185 ?auto_705192 ) ) ( not ( = ?auto_705185 ?auto_705193 ) ) ( not ( = ?auto_705185 ?auto_705194 ) ) ( not ( = ?auto_705185 ?auto_705195 ) ) ( not ( = ?auto_705185 ?auto_705196 ) ) ( not ( = ?auto_705186 ?auto_705187 ) ) ( not ( = ?auto_705186 ?auto_705188 ) ) ( not ( = ?auto_705186 ?auto_705189 ) ) ( not ( = ?auto_705186 ?auto_705190 ) ) ( not ( = ?auto_705186 ?auto_705191 ) ) ( not ( = ?auto_705186 ?auto_705192 ) ) ( not ( = ?auto_705186 ?auto_705193 ) ) ( not ( = ?auto_705186 ?auto_705194 ) ) ( not ( = ?auto_705186 ?auto_705195 ) ) ( not ( = ?auto_705186 ?auto_705196 ) ) ( not ( = ?auto_705187 ?auto_705188 ) ) ( not ( = ?auto_705187 ?auto_705189 ) ) ( not ( = ?auto_705187 ?auto_705190 ) ) ( not ( = ?auto_705187 ?auto_705191 ) ) ( not ( = ?auto_705187 ?auto_705192 ) ) ( not ( = ?auto_705187 ?auto_705193 ) ) ( not ( = ?auto_705187 ?auto_705194 ) ) ( not ( = ?auto_705187 ?auto_705195 ) ) ( not ( = ?auto_705187 ?auto_705196 ) ) ( not ( = ?auto_705188 ?auto_705189 ) ) ( not ( = ?auto_705188 ?auto_705190 ) ) ( not ( = ?auto_705188 ?auto_705191 ) ) ( not ( = ?auto_705188 ?auto_705192 ) ) ( not ( = ?auto_705188 ?auto_705193 ) ) ( not ( = ?auto_705188 ?auto_705194 ) ) ( not ( = ?auto_705188 ?auto_705195 ) ) ( not ( = ?auto_705188 ?auto_705196 ) ) ( not ( = ?auto_705189 ?auto_705190 ) ) ( not ( = ?auto_705189 ?auto_705191 ) ) ( not ( = ?auto_705189 ?auto_705192 ) ) ( not ( = ?auto_705189 ?auto_705193 ) ) ( not ( = ?auto_705189 ?auto_705194 ) ) ( not ( = ?auto_705189 ?auto_705195 ) ) ( not ( = ?auto_705189 ?auto_705196 ) ) ( not ( = ?auto_705190 ?auto_705191 ) ) ( not ( = ?auto_705190 ?auto_705192 ) ) ( not ( = ?auto_705190 ?auto_705193 ) ) ( not ( = ?auto_705190 ?auto_705194 ) ) ( not ( = ?auto_705190 ?auto_705195 ) ) ( not ( = ?auto_705190 ?auto_705196 ) ) ( not ( = ?auto_705191 ?auto_705192 ) ) ( not ( = ?auto_705191 ?auto_705193 ) ) ( not ( = ?auto_705191 ?auto_705194 ) ) ( not ( = ?auto_705191 ?auto_705195 ) ) ( not ( = ?auto_705191 ?auto_705196 ) ) ( not ( = ?auto_705192 ?auto_705193 ) ) ( not ( = ?auto_705192 ?auto_705194 ) ) ( not ( = ?auto_705192 ?auto_705195 ) ) ( not ( = ?auto_705192 ?auto_705196 ) ) ( not ( = ?auto_705193 ?auto_705194 ) ) ( not ( = ?auto_705193 ?auto_705195 ) ) ( not ( = ?auto_705193 ?auto_705196 ) ) ( not ( = ?auto_705194 ?auto_705195 ) ) ( not ( = ?auto_705194 ?auto_705196 ) ) ( not ( = ?auto_705195 ?auto_705196 ) ) ( CLEAR ?auto_705193 ) ( ON ?auto_705194 ?auto_705195 ) ( CLEAR ?auto_705194 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_705183 ?auto_705184 ?auto_705185 ?auto_705186 ?auto_705187 ?auto_705188 ?auto_705189 ?auto_705190 ?auto_705191 ?auto_705192 ?auto_705193 ?auto_705194 )
      ( MAKE-13PILE ?auto_705183 ?auto_705184 ?auto_705185 ?auto_705186 ?auto_705187 ?auto_705188 ?auto_705189 ?auto_705190 ?auto_705191 ?auto_705192 ?auto_705193 ?auto_705194 ?auto_705195 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705237 - BLOCK
      ?auto_705238 - BLOCK
      ?auto_705239 - BLOCK
      ?auto_705240 - BLOCK
      ?auto_705241 - BLOCK
      ?auto_705242 - BLOCK
      ?auto_705243 - BLOCK
      ?auto_705244 - BLOCK
      ?auto_705245 - BLOCK
      ?auto_705246 - BLOCK
      ?auto_705247 - BLOCK
      ?auto_705248 - BLOCK
      ?auto_705249 - BLOCK
    )
    :vars
    (
      ?auto_705250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705249 ?auto_705250 ) ( ON-TABLE ?auto_705237 ) ( ON ?auto_705238 ?auto_705237 ) ( ON ?auto_705239 ?auto_705238 ) ( ON ?auto_705240 ?auto_705239 ) ( ON ?auto_705241 ?auto_705240 ) ( ON ?auto_705242 ?auto_705241 ) ( ON ?auto_705243 ?auto_705242 ) ( ON ?auto_705244 ?auto_705243 ) ( ON ?auto_705245 ?auto_705244 ) ( ON ?auto_705246 ?auto_705245 ) ( not ( = ?auto_705237 ?auto_705238 ) ) ( not ( = ?auto_705237 ?auto_705239 ) ) ( not ( = ?auto_705237 ?auto_705240 ) ) ( not ( = ?auto_705237 ?auto_705241 ) ) ( not ( = ?auto_705237 ?auto_705242 ) ) ( not ( = ?auto_705237 ?auto_705243 ) ) ( not ( = ?auto_705237 ?auto_705244 ) ) ( not ( = ?auto_705237 ?auto_705245 ) ) ( not ( = ?auto_705237 ?auto_705246 ) ) ( not ( = ?auto_705237 ?auto_705247 ) ) ( not ( = ?auto_705237 ?auto_705248 ) ) ( not ( = ?auto_705237 ?auto_705249 ) ) ( not ( = ?auto_705237 ?auto_705250 ) ) ( not ( = ?auto_705238 ?auto_705239 ) ) ( not ( = ?auto_705238 ?auto_705240 ) ) ( not ( = ?auto_705238 ?auto_705241 ) ) ( not ( = ?auto_705238 ?auto_705242 ) ) ( not ( = ?auto_705238 ?auto_705243 ) ) ( not ( = ?auto_705238 ?auto_705244 ) ) ( not ( = ?auto_705238 ?auto_705245 ) ) ( not ( = ?auto_705238 ?auto_705246 ) ) ( not ( = ?auto_705238 ?auto_705247 ) ) ( not ( = ?auto_705238 ?auto_705248 ) ) ( not ( = ?auto_705238 ?auto_705249 ) ) ( not ( = ?auto_705238 ?auto_705250 ) ) ( not ( = ?auto_705239 ?auto_705240 ) ) ( not ( = ?auto_705239 ?auto_705241 ) ) ( not ( = ?auto_705239 ?auto_705242 ) ) ( not ( = ?auto_705239 ?auto_705243 ) ) ( not ( = ?auto_705239 ?auto_705244 ) ) ( not ( = ?auto_705239 ?auto_705245 ) ) ( not ( = ?auto_705239 ?auto_705246 ) ) ( not ( = ?auto_705239 ?auto_705247 ) ) ( not ( = ?auto_705239 ?auto_705248 ) ) ( not ( = ?auto_705239 ?auto_705249 ) ) ( not ( = ?auto_705239 ?auto_705250 ) ) ( not ( = ?auto_705240 ?auto_705241 ) ) ( not ( = ?auto_705240 ?auto_705242 ) ) ( not ( = ?auto_705240 ?auto_705243 ) ) ( not ( = ?auto_705240 ?auto_705244 ) ) ( not ( = ?auto_705240 ?auto_705245 ) ) ( not ( = ?auto_705240 ?auto_705246 ) ) ( not ( = ?auto_705240 ?auto_705247 ) ) ( not ( = ?auto_705240 ?auto_705248 ) ) ( not ( = ?auto_705240 ?auto_705249 ) ) ( not ( = ?auto_705240 ?auto_705250 ) ) ( not ( = ?auto_705241 ?auto_705242 ) ) ( not ( = ?auto_705241 ?auto_705243 ) ) ( not ( = ?auto_705241 ?auto_705244 ) ) ( not ( = ?auto_705241 ?auto_705245 ) ) ( not ( = ?auto_705241 ?auto_705246 ) ) ( not ( = ?auto_705241 ?auto_705247 ) ) ( not ( = ?auto_705241 ?auto_705248 ) ) ( not ( = ?auto_705241 ?auto_705249 ) ) ( not ( = ?auto_705241 ?auto_705250 ) ) ( not ( = ?auto_705242 ?auto_705243 ) ) ( not ( = ?auto_705242 ?auto_705244 ) ) ( not ( = ?auto_705242 ?auto_705245 ) ) ( not ( = ?auto_705242 ?auto_705246 ) ) ( not ( = ?auto_705242 ?auto_705247 ) ) ( not ( = ?auto_705242 ?auto_705248 ) ) ( not ( = ?auto_705242 ?auto_705249 ) ) ( not ( = ?auto_705242 ?auto_705250 ) ) ( not ( = ?auto_705243 ?auto_705244 ) ) ( not ( = ?auto_705243 ?auto_705245 ) ) ( not ( = ?auto_705243 ?auto_705246 ) ) ( not ( = ?auto_705243 ?auto_705247 ) ) ( not ( = ?auto_705243 ?auto_705248 ) ) ( not ( = ?auto_705243 ?auto_705249 ) ) ( not ( = ?auto_705243 ?auto_705250 ) ) ( not ( = ?auto_705244 ?auto_705245 ) ) ( not ( = ?auto_705244 ?auto_705246 ) ) ( not ( = ?auto_705244 ?auto_705247 ) ) ( not ( = ?auto_705244 ?auto_705248 ) ) ( not ( = ?auto_705244 ?auto_705249 ) ) ( not ( = ?auto_705244 ?auto_705250 ) ) ( not ( = ?auto_705245 ?auto_705246 ) ) ( not ( = ?auto_705245 ?auto_705247 ) ) ( not ( = ?auto_705245 ?auto_705248 ) ) ( not ( = ?auto_705245 ?auto_705249 ) ) ( not ( = ?auto_705245 ?auto_705250 ) ) ( not ( = ?auto_705246 ?auto_705247 ) ) ( not ( = ?auto_705246 ?auto_705248 ) ) ( not ( = ?auto_705246 ?auto_705249 ) ) ( not ( = ?auto_705246 ?auto_705250 ) ) ( not ( = ?auto_705247 ?auto_705248 ) ) ( not ( = ?auto_705247 ?auto_705249 ) ) ( not ( = ?auto_705247 ?auto_705250 ) ) ( not ( = ?auto_705248 ?auto_705249 ) ) ( not ( = ?auto_705248 ?auto_705250 ) ) ( not ( = ?auto_705249 ?auto_705250 ) ) ( ON ?auto_705248 ?auto_705249 ) ( CLEAR ?auto_705246 ) ( ON ?auto_705247 ?auto_705248 ) ( CLEAR ?auto_705247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_705237 ?auto_705238 ?auto_705239 ?auto_705240 ?auto_705241 ?auto_705242 ?auto_705243 ?auto_705244 ?auto_705245 ?auto_705246 ?auto_705247 )
      ( MAKE-13PILE ?auto_705237 ?auto_705238 ?auto_705239 ?auto_705240 ?auto_705241 ?auto_705242 ?auto_705243 ?auto_705244 ?auto_705245 ?auto_705246 ?auto_705247 ?auto_705248 ?auto_705249 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705291 - BLOCK
      ?auto_705292 - BLOCK
      ?auto_705293 - BLOCK
      ?auto_705294 - BLOCK
      ?auto_705295 - BLOCK
      ?auto_705296 - BLOCK
      ?auto_705297 - BLOCK
      ?auto_705298 - BLOCK
      ?auto_705299 - BLOCK
      ?auto_705300 - BLOCK
      ?auto_705301 - BLOCK
      ?auto_705302 - BLOCK
      ?auto_705303 - BLOCK
    )
    :vars
    (
      ?auto_705304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705303 ?auto_705304 ) ( ON-TABLE ?auto_705291 ) ( ON ?auto_705292 ?auto_705291 ) ( ON ?auto_705293 ?auto_705292 ) ( ON ?auto_705294 ?auto_705293 ) ( ON ?auto_705295 ?auto_705294 ) ( ON ?auto_705296 ?auto_705295 ) ( ON ?auto_705297 ?auto_705296 ) ( ON ?auto_705298 ?auto_705297 ) ( ON ?auto_705299 ?auto_705298 ) ( not ( = ?auto_705291 ?auto_705292 ) ) ( not ( = ?auto_705291 ?auto_705293 ) ) ( not ( = ?auto_705291 ?auto_705294 ) ) ( not ( = ?auto_705291 ?auto_705295 ) ) ( not ( = ?auto_705291 ?auto_705296 ) ) ( not ( = ?auto_705291 ?auto_705297 ) ) ( not ( = ?auto_705291 ?auto_705298 ) ) ( not ( = ?auto_705291 ?auto_705299 ) ) ( not ( = ?auto_705291 ?auto_705300 ) ) ( not ( = ?auto_705291 ?auto_705301 ) ) ( not ( = ?auto_705291 ?auto_705302 ) ) ( not ( = ?auto_705291 ?auto_705303 ) ) ( not ( = ?auto_705291 ?auto_705304 ) ) ( not ( = ?auto_705292 ?auto_705293 ) ) ( not ( = ?auto_705292 ?auto_705294 ) ) ( not ( = ?auto_705292 ?auto_705295 ) ) ( not ( = ?auto_705292 ?auto_705296 ) ) ( not ( = ?auto_705292 ?auto_705297 ) ) ( not ( = ?auto_705292 ?auto_705298 ) ) ( not ( = ?auto_705292 ?auto_705299 ) ) ( not ( = ?auto_705292 ?auto_705300 ) ) ( not ( = ?auto_705292 ?auto_705301 ) ) ( not ( = ?auto_705292 ?auto_705302 ) ) ( not ( = ?auto_705292 ?auto_705303 ) ) ( not ( = ?auto_705292 ?auto_705304 ) ) ( not ( = ?auto_705293 ?auto_705294 ) ) ( not ( = ?auto_705293 ?auto_705295 ) ) ( not ( = ?auto_705293 ?auto_705296 ) ) ( not ( = ?auto_705293 ?auto_705297 ) ) ( not ( = ?auto_705293 ?auto_705298 ) ) ( not ( = ?auto_705293 ?auto_705299 ) ) ( not ( = ?auto_705293 ?auto_705300 ) ) ( not ( = ?auto_705293 ?auto_705301 ) ) ( not ( = ?auto_705293 ?auto_705302 ) ) ( not ( = ?auto_705293 ?auto_705303 ) ) ( not ( = ?auto_705293 ?auto_705304 ) ) ( not ( = ?auto_705294 ?auto_705295 ) ) ( not ( = ?auto_705294 ?auto_705296 ) ) ( not ( = ?auto_705294 ?auto_705297 ) ) ( not ( = ?auto_705294 ?auto_705298 ) ) ( not ( = ?auto_705294 ?auto_705299 ) ) ( not ( = ?auto_705294 ?auto_705300 ) ) ( not ( = ?auto_705294 ?auto_705301 ) ) ( not ( = ?auto_705294 ?auto_705302 ) ) ( not ( = ?auto_705294 ?auto_705303 ) ) ( not ( = ?auto_705294 ?auto_705304 ) ) ( not ( = ?auto_705295 ?auto_705296 ) ) ( not ( = ?auto_705295 ?auto_705297 ) ) ( not ( = ?auto_705295 ?auto_705298 ) ) ( not ( = ?auto_705295 ?auto_705299 ) ) ( not ( = ?auto_705295 ?auto_705300 ) ) ( not ( = ?auto_705295 ?auto_705301 ) ) ( not ( = ?auto_705295 ?auto_705302 ) ) ( not ( = ?auto_705295 ?auto_705303 ) ) ( not ( = ?auto_705295 ?auto_705304 ) ) ( not ( = ?auto_705296 ?auto_705297 ) ) ( not ( = ?auto_705296 ?auto_705298 ) ) ( not ( = ?auto_705296 ?auto_705299 ) ) ( not ( = ?auto_705296 ?auto_705300 ) ) ( not ( = ?auto_705296 ?auto_705301 ) ) ( not ( = ?auto_705296 ?auto_705302 ) ) ( not ( = ?auto_705296 ?auto_705303 ) ) ( not ( = ?auto_705296 ?auto_705304 ) ) ( not ( = ?auto_705297 ?auto_705298 ) ) ( not ( = ?auto_705297 ?auto_705299 ) ) ( not ( = ?auto_705297 ?auto_705300 ) ) ( not ( = ?auto_705297 ?auto_705301 ) ) ( not ( = ?auto_705297 ?auto_705302 ) ) ( not ( = ?auto_705297 ?auto_705303 ) ) ( not ( = ?auto_705297 ?auto_705304 ) ) ( not ( = ?auto_705298 ?auto_705299 ) ) ( not ( = ?auto_705298 ?auto_705300 ) ) ( not ( = ?auto_705298 ?auto_705301 ) ) ( not ( = ?auto_705298 ?auto_705302 ) ) ( not ( = ?auto_705298 ?auto_705303 ) ) ( not ( = ?auto_705298 ?auto_705304 ) ) ( not ( = ?auto_705299 ?auto_705300 ) ) ( not ( = ?auto_705299 ?auto_705301 ) ) ( not ( = ?auto_705299 ?auto_705302 ) ) ( not ( = ?auto_705299 ?auto_705303 ) ) ( not ( = ?auto_705299 ?auto_705304 ) ) ( not ( = ?auto_705300 ?auto_705301 ) ) ( not ( = ?auto_705300 ?auto_705302 ) ) ( not ( = ?auto_705300 ?auto_705303 ) ) ( not ( = ?auto_705300 ?auto_705304 ) ) ( not ( = ?auto_705301 ?auto_705302 ) ) ( not ( = ?auto_705301 ?auto_705303 ) ) ( not ( = ?auto_705301 ?auto_705304 ) ) ( not ( = ?auto_705302 ?auto_705303 ) ) ( not ( = ?auto_705302 ?auto_705304 ) ) ( not ( = ?auto_705303 ?auto_705304 ) ) ( ON ?auto_705302 ?auto_705303 ) ( ON ?auto_705301 ?auto_705302 ) ( CLEAR ?auto_705299 ) ( ON ?auto_705300 ?auto_705301 ) ( CLEAR ?auto_705300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_705291 ?auto_705292 ?auto_705293 ?auto_705294 ?auto_705295 ?auto_705296 ?auto_705297 ?auto_705298 ?auto_705299 ?auto_705300 )
      ( MAKE-13PILE ?auto_705291 ?auto_705292 ?auto_705293 ?auto_705294 ?auto_705295 ?auto_705296 ?auto_705297 ?auto_705298 ?auto_705299 ?auto_705300 ?auto_705301 ?auto_705302 ?auto_705303 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705345 - BLOCK
      ?auto_705346 - BLOCK
      ?auto_705347 - BLOCK
      ?auto_705348 - BLOCK
      ?auto_705349 - BLOCK
      ?auto_705350 - BLOCK
      ?auto_705351 - BLOCK
      ?auto_705352 - BLOCK
      ?auto_705353 - BLOCK
      ?auto_705354 - BLOCK
      ?auto_705355 - BLOCK
      ?auto_705356 - BLOCK
      ?auto_705357 - BLOCK
    )
    :vars
    (
      ?auto_705358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705357 ?auto_705358 ) ( ON-TABLE ?auto_705345 ) ( ON ?auto_705346 ?auto_705345 ) ( ON ?auto_705347 ?auto_705346 ) ( ON ?auto_705348 ?auto_705347 ) ( ON ?auto_705349 ?auto_705348 ) ( ON ?auto_705350 ?auto_705349 ) ( ON ?auto_705351 ?auto_705350 ) ( ON ?auto_705352 ?auto_705351 ) ( not ( = ?auto_705345 ?auto_705346 ) ) ( not ( = ?auto_705345 ?auto_705347 ) ) ( not ( = ?auto_705345 ?auto_705348 ) ) ( not ( = ?auto_705345 ?auto_705349 ) ) ( not ( = ?auto_705345 ?auto_705350 ) ) ( not ( = ?auto_705345 ?auto_705351 ) ) ( not ( = ?auto_705345 ?auto_705352 ) ) ( not ( = ?auto_705345 ?auto_705353 ) ) ( not ( = ?auto_705345 ?auto_705354 ) ) ( not ( = ?auto_705345 ?auto_705355 ) ) ( not ( = ?auto_705345 ?auto_705356 ) ) ( not ( = ?auto_705345 ?auto_705357 ) ) ( not ( = ?auto_705345 ?auto_705358 ) ) ( not ( = ?auto_705346 ?auto_705347 ) ) ( not ( = ?auto_705346 ?auto_705348 ) ) ( not ( = ?auto_705346 ?auto_705349 ) ) ( not ( = ?auto_705346 ?auto_705350 ) ) ( not ( = ?auto_705346 ?auto_705351 ) ) ( not ( = ?auto_705346 ?auto_705352 ) ) ( not ( = ?auto_705346 ?auto_705353 ) ) ( not ( = ?auto_705346 ?auto_705354 ) ) ( not ( = ?auto_705346 ?auto_705355 ) ) ( not ( = ?auto_705346 ?auto_705356 ) ) ( not ( = ?auto_705346 ?auto_705357 ) ) ( not ( = ?auto_705346 ?auto_705358 ) ) ( not ( = ?auto_705347 ?auto_705348 ) ) ( not ( = ?auto_705347 ?auto_705349 ) ) ( not ( = ?auto_705347 ?auto_705350 ) ) ( not ( = ?auto_705347 ?auto_705351 ) ) ( not ( = ?auto_705347 ?auto_705352 ) ) ( not ( = ?auto_705347 ?auto_705353 ) ) ( not ( = ?auto_705347 ?auto_705354 ) ) ( not ( = ?auto_705347 ?auto_705355 ) ) ( not ( = ?auto_705347 ?auto_705356 ) ) ( not ( = ?auto_705347 ?auto_705357 ) ) ( not ( = ?auto_705347 ?auto_705358 ) ) ( not ( = ?auto_705348 ?auto_705349 ) ) ( not ( = ?auto_705348 ?auto_705350 ) ) ( not ( = ?auto_705348 ?auto_705351 ) ) ( not ( = ?auto_705348 ?auto_705352 ) ) ( not ( = ?auto_705348 ?auto_705353 ) ) ( not ( = ?auto_705348 ?auto_705354 ) ) ( not ( = ?auto_705348 ?auto_705355 ) ) ( not ( = ?auto_705348 ?auto_705356 ) ) ( not ( = ?auto_705348 ?auto_705357 ) ) ( not ( = ?auto_705348 ?auto_705358 ) ) ( not ( = ?auto_705349 ?auto_705350 ) ) ( not ( = ?auto_705349 ?auto_705351 ) ) ( not ( = ?auto_705349 ?auto_705352 ) ) ( not ( = ?auto_705349 ?auto_705353 ) ) ( not ( = ?auto_705349 ?auto_705354 ) ) ( not ( = ?auto_705349 ?auto_705355 ) ) ( not ( = ?auto_705349 ?auto_705356 ) ) ( not ( = ?auto_705349 ?auto_705357 ) ) ( not ( = ?auto_705349 ?auto_705358 ) ) ( not ( = ?auto_705350 ?auto_705351 ) ) ( not ( = ?auto_705350 ?auto_705352 ) ) ( not ( = ?auto_705350 ?auto_705353 ) ) ( not ( = ?auto_705350 ?auto_705354 ) ) ( not ( = ?auto_705350 ?auto_705355 ) ) ( not ( = ?auto_705350 ?auto_705356 ) ) ( not ( = ?auto_705350 ?auto_705357 ) ) ( not ( = ?auto_705350 ?auto_705358 ) ) ( not ( = ?auto_705351 ?auto_705352 ) ) ( not ( = ?auto_705351 ?auto_705353 ) ) ( not ( = ?auto_705351 ?auto_705354 ) ) ( not ( = ?auto_705351 ?auto_705355 ) ) ( not ( = ?auto_705351 ?auto_705356 ) ) ( not ( = ?auto_705351 ?auto_705357 ) ) ( not ( = ?auto_705351 ?auto_705358 ) ) ( not ( = ?auto_705352 ?auto_705353 ) ) ( not ( = ?auto_705352 ?auto_705354 ) ) ( not ( = ?auto_705352 ?auto_705355 ) ) ( not ( = ?auto_705352 ?auto_705356 ) ) ( not ( = ?auto_705352 ?auto_705357 ) ) ( not ( = ?auto_705352 ?auto_705358 ) ) ( not ( = ?auto_705353 ?auto_705354 ) ) ( not ( = ?auto_705353 ?auto_705355 ) ) ( not ( = ?auto_705353 ?auto_705356 ) ) ( not ( = ?auto_705353 ?auto_705357 ) ) ( not ( = ?auto_705353 ?auto_705358 ) ) ( not ( = ?auto_705354 ?auto_705355 ) ) ( not ( = ?auto_705354 ?auto_705356 ) ) ( not ( = ?auto_705354 ?auto_705357 ) ) ( not ( = ?auto_705354 ?auto_705358 ) ) ( not ( = ?auto_705355 ?auto_705356 ) ) ( not ( = ?auto_705355 ?auto_705357 ) ) ( not ( = ?auto_705355 ?auto_705358 ) ) ( not ( = ?auto_705356 ?auto_705357 ) ) ( not ( = ?auto_705356 ?auto_705358 ) ) ( not ( = ?auto_705357 ?auto_705358 ) ) ( ON ?auto_705356 ?auto_705357 ) ( ON ?auto_705355 ?auto_705356 ) ( ON ?auto_705354 ?auto_705355 ) ( CLEAR ?auto_705352 ) ( ON ?auto_705353 ?auto_705354 ) ( CLEAR ?auto_705353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_705345 ?auto_705346 ?auto_705347 ?auto_705348 ?auto_705349 ?auto_705350 ?auto_705351 ?auto_705352 ?auto_705353 )
      ( MAKE-13PILE ?auto_705345 ?auto_705346 ?auto_705347 ?auto_705348 ?auto_705349 ?auto_705350 ?auto_705351 ?auto_705352 ?auto_705353 ?auto_705354 ?auto_705355 ?auto_705356 ?auto_705357 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705399 - BLOCK
      ?auto_705400 - BLOCK
      ?auto_705401 - BLOCK
      ?auto_705402 - BLOCK
      ?auto_705403 - BLOCK
      ?auto_705404 - BLOCK
      ?auto_705405 - BLOCK
      ?auto_705406 - BLOCK
      ?auto_705407 - BLOCK
      ?auto_705408 - BLOCK
      ?auto_705409 - BLOCK
      ?auto_705410 - BLOCK
      ?auto_705411 - BLOCK
    )
    :vars
    (
      ?auto_705412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705411 ?auto_705412 ) ( ON-TABLE ?auto_705399 ) ( ON ?auto_705400 ?auto_705399 ) ( ON ?auto_705401 ?auto_705400 ) ( ON ?auto_705402 ?auto_705401 ) ( ON ?auto_705403 ?auto_705402 ) ( ON ?auto_705404 ?auto_705403 ) ( ON ?auto_705405 ?auto_705404 ) ( not ( = ?auto_705399 ?auto_705400 ) ) ( not ( = ?auto_705399 ?auto_705401 ) ) ( not ( = ?auto_705399 ?auto_705402 ) ) ( not ( = ?auto_705399 ?auto_705403 ) ) ( not ( = ?auto_705399 ?auto_705404 ) ) ( not ( = ?auto_705399 ?auto_705405 ) ) ( not ( = ?auto_705399 ?auto_705406 ) ) ( not ( = ?auto_705399 ?auto_705407 ) ) ( not ( = ?auto_705399 ?auto_705408 ) ) ( not ( = ?auto_705399 ?auto_705409 ) ) ( not ( = ?auto_705399 ?auto_705410 ) ) ( not ( = ?auto_705399 ?auto_705411 ) ) ( not ( = ?auto_705399 ?auto_705412 ) ) ( not ( = ?auto_705400 ?auto_705401 ) ) ( not ( = ?auto_705400 ?auto_705402 ) ) ( not ( = ?auto_705400 ?auto_705403 ) ) ( not ( = ?auto_705400 ?auto_705404 ) ) ( not ( = ?auto_705400 ?auto_705405 ) ) ( not ( = ?auto_705400 ?auto_705406 ) ) ( not ( = ?auto_705400 ?auto_705407 ) ) ( not ( = ?auto_705400 ?auto_705408 ) ) ( not ( = ?auto_705400 ?auto_705409 ) ) ( not ( = ?auto_705400 ?auto_705410 ) ) ( not ( = ?auto_705400 ?auto_705411 ) ) ( not ( = ?auto_705400 ?auto_705412 ) ) ( not ( = ?auto_705401 ?auto_705402 ) ) ( not ( = ?auto_705401 ?auto_705403 ) ) ( not ( = ?auto_705401 ?auto_705404 ) ) ( not ( = ?auto_705401 ?auto_705405 ) ) ( not ( = ?auto_705401 ?auto_705406 ) ) ( not ( = ?auto_705401 ?auto_705407 ) ) ( not ( = ?auto_705401 ?auto_705408 ) ) ( not ( = ?auto_705401 ?auto_705409 ) ) ( not ( = ?auto_705401 ?auto_705410 ) ) ( not ( = ?auto_705401 ?auto_705411 ) ) ( not ( = ?auto_705401 ?auto_705412 ) ) ( not ( = ?auto_705402 ?auto_705403 ) ) ( not ( = ?auto_705402 ?auto_705404 ) ) ( not ( = ?auto_705402 ?auto_705405 ) ) ( not ( = ?auto_705402 ?auto_705406 ) ) ( not ( = ?auto_705402 ?auto_705407 ) ) ( not ( = ?auto_705402 ?auto_705408 ) ) ( not ( = ?auto_705402 ?auto_705409 ) ) ( not ( = ?auto_705402 ?auto_705410 ) ) ( not ( = ?auto_705402 ?auto_705411 ) ) ( not ( = ?auto_705402 ?auto_705412 ) ) ( not ( = ?auto_705403 ?auto_705404 ) ) ( not ( = ?auto_705403 ?auto_705405 ) ) ( not ( = ?auto_705403 ?auto_705406 ) ) ( not ( = ?auto_705403 ?auto_705407 ) ) ( not ( = ?auto_705403 ?auto_705408 ) ) ( not ( = ?auto_705403 ?auto_705409 ) ) ( not ( = ?auto_705403 ?auto_705410 ) ) ( not ( = ?auto_705403 ?auto_705411 ) ) ( not ( = ?auto_705403 ?auto_705412 ) ) ( not ( = ?auto_705404 ?auto_705405 ) ) ( not ( = ?auto_705404 ?auto_705406 ) ) ( not ( = ?auto_705404 ?auto_705407 ) ) ( not ( = ?auto_705404 ?auto_705408 ) ) ( not ( = ?auto_705404 ?auto_705409 ) ) ( not ( = ?auto_705404 ?auto_705410 ) ) ( not ( = ?auto_705404 ?auto_705411 ) ) ( not ( = ?auto_705404 ?auto_705412 ) ) ( not ( = ?auto_705405 ?auto_705406 ) ) ( not ( = ?auto_705405 ?auto_705407 ) ) ( not ( = ?auto_705405 ?auto_705408 ) ) ( not ( = ?auto_705405 ?auto_705409 ) ) ( not ( = ?auto_705405 ?auto_705410 ) ) ( not ( = ?auto_705405 ?auto_705411 ) ) ( not ( = ?auto_705405 ?auto_705412 ) ) ( not ( = ?auto_705406 ?auto_705407 ) ) ( not ( = ?auto_705406 ?auto_705408 ) ) ( not ( = ?auto_705406 ?auto_705409 ) ) ( not ( = ?auto_705406 ?auto_705410 ) ) ( not ( = ?auto_705406 ?auto_705411 ) ) ( not ( = ?auto_705406 ?auto_705412 ) ) ( not ( = ?auto_705407 ?auto_705408 ) ) ( not ( = ?auto_705407 ?auto_705409 ) ) ( not ( = ?auto_705407 ?auto_705410 ) ) ( not ( = ?auto_705407 ?auto_705411 ) ) ( not ( = ?auto_705407 ?auto_705412 ) ) ( not ( = ?auto_705408 ?auto_705409 ) ) ( not ( = ?auto_705408 ?auto_705410 ) ) ( not ( = ?auto_705408 ?auto_705411 ) ) ( not ( = ?auto_705408 ?auto_705412 ) ) ( not ( = ?auto_705409 ?auto_705410 ) ) ( not ( = ?auto_705409 ?auto_705411 ) ) ( not ( = ?auto_705409 ?auto_705412 ) ) ( not ( = ?auto_705410 ?auto_705411 ) ) ( not ( = ?auto_705410 ?auto_705412 ) ) ( not ( = ?auto_705411 ?auto_705412 ) ) ( ON ?auto_705410 ?auto_705411 ) ( ON ?auto_705409 ?auto_705410 ) ( ON ?auto_705408 ?auto_705409 ) ( ON ?auto_705407 ?auto_705408 ) ( CLEAR ?auto_705405 ) ( ON ?auto_705406 ?auto_705407 ) ( CLEAR ?auto_705406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_705399 ?auto_705400 ?auto_705401 ?auto_705402 ?auto_705403 ?auto_705404 ?auto_705405 ?auto_705406 )
      ( MAKE-13PILE ?auto_705399 ?auto_705400 ?auto_705401 ?auto_705402 ?auto_705403 ?auto_705404 ?auto_705405 ?auto_705406 ?auto_705407 ?auto_705408 ?auto_705409 ?auto_705410 ?auto_705411 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705453 - BLOCK
      ?auto_705454 - BLOCK
      ?auto_705455 - BLOCK
      ?auto_705456 - BLOCK
      ?auto_705457 - BLOCK
      ?auto_705458 - BLOCK
      ?auto_705459 - BLOCK
      ?auto_705460 - BLOCK
      ?auto_705461 - BLOCK
      ?auto_705462 - BLOCK
      ?auto_705463 - BLOCK
      ?auto_705464 - BLOCK
      ?auto_705465 - BLOCK
    )
    :vars
    (
      ?auto_705466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705465 ?auto_705466 ) ( ON-TABLE ?auto_705453 ) ( ON ?auto_705454 ?auto_705453 ) ( ON ?auto_705455 ?auto_705454 ) ( ON ?auto_705456 ?auto_705455 ) ( ON ?auto_705457 ?auto_705456 ) ( ON ?auto_705458 ?auto_705457 ) ( not ( = ?auto_705453 ?auto_705454 ) ) ( not ( = ?auto_705453 ?auto_705455 ) ) ( not ( = ?auto_705453 ?auto_705456 ) ) ( not ( = ?auto_705453 ?auto_705457 ) ) ( not ( = ?auto_705453 ?auto_705458 ) ) ( not ( = ?auto_705453 ?auto_705459 ) ) ( not ( = ?auto_705453 ?auto_705460 ) ) ( not ( = ?auto_705453 ?auto_705461 ) ) ( not ( = ?auto_705453 ?auto_705462 ) ) ( not ( = ?auto_705453 ?auto_705463 ) ) ( not ( = ?auto_705453 ?auto_705464 ) ) ( not ( = ?auto_705453 ?auto_705465 ) ) ( not ( = ?auto_705453 ?auto_705466 ) ) ( not ( = ?auto_705454 ?auto_705455 ) ) ( not ( = ?auto_705454 ?auto_705456 ) ) ( not ( = ?auto_705454 ?auto_705457 ) ) ( not ( = ?auto_705454 ?auto_705458 ) ) ( not ( = ?auto_705454 ?auto_705459 ) ) ( not ( = ?auto_705454 ?auto_705460 ) ) ( not ( = ?auto_705454 ?auto_705461 ) ) ( not ( = ?auto_705454 ?auto_705462 ) ) ( not ( = ?auto_705454 ?auto_705463 ) ) ( not ( = ?auto_705454 ?auto_705464 ) ) ( not ( = ?auto_705454 ?auto_705465 ) ) ( not ( = ?auto_705454 ?auto_705466 ) ) ( not ( = ?auto_705455 ?auto_705456 ) ) ( not ( = ?auto_705455 ?auto_705457 ) ) ( not ( = ?auto_705455 ?auto_705458 ) ) ( not ( = ?auto_705455 ?auto_705459 ) ) ( not ( = ?auto_705455 ?auto_705460 ) ) ( not ( = ?auto_705455 ?auto_705461 ) ) ( not ( = ?auto_705455 ?auto_705462 ) ) ( not ( = ?auto_705455 ?auto_705463 ) ) ( not ( = ?auto_705455 ?auto_705464 ) ) ( not ( = ?auto_705455 ?auto_705465 ) ) ( not ( = ?auto_705455 ?auto_705466 ) ) ( not ( = ?auto_705456 ?auto_705457 ) ) ( not ( = ?auto_705456 ?auto_705458 ) ) ( not ( = ?auto_705456 ?auto_705459 ) ) ( not ( = ?auto_705456 ?auto_705460 ) ) ( not ( = ?auto_705456 ?auto_705461 ) ) ( not ( = ?auto_705456 ?auto_705462 ) ) ( not ( = ?auto_705456 ?auto_705463 ) ) ( not ( = ?auto_705456 ?auto_705464 ) ) ( not ( = ?auto_705456 ?auto_705465 ) ) ( not ( = ?auto_705456 ?auto_705466 ) ) ( not ( = ?auto_705457 ?auto_705458 ) ) ( not ( = ?auto_705457 ?auto_705459 ) ) ( not ( = ?auto_705457 ?auto_705460 ) ) ( not ( = ?auto_705457 ?auto_705461 ) ) ( not ( = ?auto_705457 ?auto_705462 ) ) ( not ( = ?auto_705457 ?auto_705463 ) ) ( not ( = ?auto_705457 ?auto_705464 ) ) ( not ( = ?auto_705457 ?auto_705465 ) ) ( not ( = ?auto_705457 ?auto_705466 ) ) ( not ( = ?auto_705458 ?auto_705459 ) ) ( not ( = ?auto_705458 ?auto_705460 ) ) ( not ( = ?auto_705458 ?auto_705461 ) ) ( not ( = ?auto_705458 ?auto_705462 ) ) ( not ( = ?auto_705458 ?auto_705463 ) ) ( not ( = ?auto_705458 ?auto_705464 ) ) ( not ( = ?auto_705458 ?auto_705465 ) ) ( not ( = ?auto_705458 ?auto_705466 ) ) ( not ( = ?auto_705459 ?auto_705460 ) ) ( not ( = ?auto_705459 ?auto_705461 ) ) ( not ( = ?auto_705459 ?auto_705462 ) ) ( not ( = ?auto_705459 ?auto_705463 ) ) ( not ( = ?auto_705459 ?auto_705464 ) ) ( not ( = ?auto_705459 ?auto_705465 ) ) ( not ( = ?auto_705459 ?auto_705466 ) ) ( not ( = ?auto_705460 ?auto_705461 ) ) ( not ( = ?auto_705460 ?auto_705462 ) ) ( not ( = ?auto_705460 ?auto_705463 ) ) ( not ( = ?auto_705460 ?auto_705464 ) ) ( not ( = ?auto_705460 ?auto_705465 ) ) ( not ( = ?auto_705460 ?auto_705466 ) ) ( not ( = ?auto_705461 ?auto_705462 ) ) ( not ( = ?auto_705461 ?auto_705463 ) ) ( not ( = ?auto_705461 ?auto_705464 ) ) ( not ( = ?auto_705461 ?auto_705465 ) ) ( not ( = ?auto_705461 ?auto_705466 ) ) ( not ( = ?auto_705462 ?auto_705463 ) ) ( not ( = ?auto_705462 ?auto_705464 ) ) ( not ( = ?auto_705462 ?auto_705465 ) ) ( not ( = ?auto_705462 ?auto_705466 ) ) ( not ( = ?auto_705463 ?auto_705464 ) ) ( not ( = ?auto_705463 ?auto_705465 ) ) ( not ( = ?auto_705463 ?auto_705466 ) ) ( not ( = ?auto_705464 ?auto_705465 ) ) ( not ( = ?auto_705464 ?auto_705466 ) ) ( not ( = ?auto_705465 ?auto_705466 ) ) ( ON ?auto_705464 ?auto_705465 ) ( ON ?auto_705463 ?auto_705464 ) ( ON ?auto_705462 ?auto_705463 ) ( ON ?auto_705461 ?auto_705462 ) ( ON ?auto_705460 ?auto_705461 ) ( CLEAR ?auto_705458 ) ( ON ?auto_705459 ?auto_705460 ) ( CLEAR ?auto_705459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_705453 ?auto_705454 ?auto_705455 ?auto_705456 ?auto_705457 ?auto_705458 ?auto_705459 )
      ( MAKE-13PILE ?auto_705453 ?auto_705454 ?auto_705455 ?auto_705456 ?auto_705457 ?auto_705458 ?auto_705459 ?auto_705460 ?auto_705461 ?auto_705462 ?auto_705463 ?auto_705464 ?auto_705465 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705507 - BLOCK
      ?auto_705508 - BLOCK
      ?auto_705509 - BLOCK
      ?auto_705510 - BLOCK
      ?auto_705511 - BLOCK
      ?auto_705512 - BLOCK
      ?auto_705513 - BLOCK
      ?auto_705514 - BLOCK
      ?auto_705515 - BLOCK
      ?auto_705516 - BLOCK
      ?auto_705517 - BLOCK
      ?auto_705518 - BLOCK
      ?auto_705519 - BLOCK
    )
    :vars
    (
      ?auto_705520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705519 ?auto_705520 ) ( ON-TABLE ?auto_705507 ) ( ON ?auto_705508 ?auto_705507 ) ( ON ?auto_705509 ?auto_705508 ) ( ON ?auto_705510 ?auto_705509 ) ( ON ?auto_705511 ?auto_705510 ) ( not ( = ?auto_705507 ?auto_705508 ) ) ( not ( = ?auto_705507 ?auto_705509 ) ) ( not ( = ?auto_705507 ?auto_705510 ) ) ( not ( = ?auto_705507 ?auto_705511 ) ) ( not ( = ?auto_705507 ?auto_705512 ) ) ( not ( = ?auto_705507 ?auto_705513 ) ) ( not ( = ?auto_705507 ?auto_705514 ) ) ( not ( = ?auto_705507 ?auto_705515 ) ) ( not ( = ?auto_705507 ?auto_705516 ) ) ( not ( = ?auto_705507 ?auto_705517 ) ) ( not ( = ?auto_705507 ?auto_705518 ) ) ( not ( = ?auto_705507 ?auto_705519 ) ) ( not ( = ?auto_705507 ?auto_705520 ) ) ( not ( = ?auto_705508 ?auto_705509 ) ) ( not ( = ?auto_705508 ?auto_705510 ) ) ( not ( = ?auto_705508 ?auto_705511 ) ) ( not ( = ?auto_705508 ?auto_705512 ) ) ( not ( = ?auto_705508 ?auto_705513 ) ) ( not ( = ?auto_705508 ?auto_705514 ) ) ( not ( = ?auto_705508 ?auto_705515 ) ) ( not ( = ?auto_705508 ?auto_705516 ) ) ( not ( = ?auto_705508 ?auto_705517 ) ) ( not ( = ?auto_705508 ?auto_705518 ) ) ( not ( = ?auto_705508 ?auto_705519 ) ) ( not ( = ?auto_705508 ?auto_705520 ) ) ( not ( = ?auto_705509 ?auto_705510 ) ) ( not ( = ?auto_705509 ?auto_705511 ) ) ( not ( = ?auto_705509 ?auto_705512 ) ) ( not ( = ?auto_705509 ?auto_705513 ) ) ( not ( = ?auto_705509 ?auto_705514 ) ) ( not ( = ?auto_705509 ?auto_705515 ) ) ( not ( = ?auto_705509 ?auto_705516 ) ) ( not ( = ?auto_705509 ?auto_705517 ) ) ( not ( = ?auto_705509 ?auto_705518 ) ) ( not ( = ?auto_705509 ?auto_705519 ) ) ( not ( = ?auto_705509 ?auto_705520 ) ) ( not ( = ?auto_705510 ?auto_705511 ) ) ( not ( = ?auto_705510 ?auto_705512 ) ) ( not ( = ?auto_705510 ?auto_705513 ) ) ( not ( = ?auto_705510 ?auto_705514 ) ) ( not ( = ?auto_705510 ?auto_705515 ) ) ( not ( = ?auto_705510 ?auto_705516 ) ) ( not ( = ?auto_705510 ?auto_705517 ) ) ( not ( = ?auto_705510 ?auto_705518 ) ) ( not ( = ?auto_705510 ?auto_705519 ) ) ( not ( = ?auto_705510 ?auto_705520 ) ) ( not ( = ?auto_705511 ?auto_705512 ) ) ( not ( = ?auto_705511 ?auto_705513 ) ) ( not ( = ?auto_705511 ?auto_705514 ) ) ( not ( = ?auto_705511 ?auto_705515 ) ) ( not ( = ?auto_705511 ?auto_705516 ) ) ( not ( = ?auto_705511 ?auto_705517 ) ) ( not ( = ?auto_705511 ?auto_705518 ) ) ( not ( = ?auto_705511 ?auto_705519 ) ) ( not ( = ?auto_705511 ?auto_705520 ) ) ( not ( = ?auto_705512 ?auto_705513 ) ) ( not ( = ?auto_705512 ?auto_705514 ) ) ( not ( = ?auto_705512 ?auto_705515 ) ) ( not ( = ?auto_705512 ?auto_705516 ) ) ( not ( = ?auto_705512 ?auto_705517 ) ) ( not ( = ?auto_705512 ?auto_705518 ) ) ( not ( = ?auto_705512 ?auto_705519 ) ) ( not ( = ?auto_705512 ?auto_705520 ) ) ( not ( = ?auto_705513 ?auto_705514 ) ) ( not ( = ?auto_705513 ?auto_705515 ) ) ( not ( = ?auto_705513 ?auto_705516 ) ) ( not ( = ?auto_705513 ?auto_705517 ) ) ( not ( = ?auto_705513 ?auto_705518 ) ) ( not ( = ?auto_705513 ?auto_705519 ) ) ( not ( = ?auto_705513 ?auto_705520 ) ) ( not ( = ?auto_705514 ?auto_705515 ) ) ( not ( = ?auto_705514 ?auto_705516 ) ) ( not ( = ?auto_705514 ?auto_705517 ) ) ( not ( = ?auto_705514 ?auto_705518 ) ) ( not ( = ?auto_705514 ?auto_705519 ) ) ( not ( = ?auto_705514 ?auto_705520 ) ) ( not ( = ?auto_705515 ?auto_705516 ) ) ( not ( = ?auto_705515 ?auto_705517 ) ) ( not ( = ?auto_705515 ?auto_705518 ) ) ( not ( = ?auto_705515 ?auto_705519 ) ) ( not ( = ?auto_705515 ?auto_705520 ) ) ( not ( = ?auto_705516 ?auto_705517 ) ) ( not ( = ?auto_705516 ?auto_705518 ) ) ( not ( = ?auto_705516 ?auto_705519 ) ) ( not ( = ?auto_705516 ?auto_705520 ) ) ( not ( = ?auto_705517 ?auto_705518 ) ) ( not ( = ?auto_705517 ?auto_705519 ) ) ( not ( = ?auto_705517 ?auto_705520 ) ) ( not ( = ?auto_705518 ?auto_705519 ) ) ( not ( = ?auto_705518 ?auto_705520 ) ) ( not ( = ?auto_705519 ?auto_705520 ) ) ( ON ?auto_705518 ?auto_705519 ) ( ON ?auto_705517 ?auto_705518 ) ( ON ?auto_705516 ?auto_705517 ) ( ON ?auto_705515 ?auto_705516 ) ( ON ?auto_705514 ?auto_705515 ) ( ON ?auto_705513 ?auto_705514 ) ( CLEAR ?auto_705511 ) ( ON ?auto_705512 ?auto_705513 ) ( CLEAR ?auto_705512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_705507 ?auto_705508 ?auto_705509 ?auto_705510 ?auto_705511 ?auto_705512 )
      ( MAKE-13PILE ?auto_705507 ?auto_705508 ?auto_705509 ?auto_705510 ?auto_705511 ?auto_705512 ?auto_705513 ?auto_705514 ?auto_705515 ?auto_705516 ?auto_705517 ?auto_705518 ?auto_705519 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705561 - BLOCK
      ?auto_705562 - BLOCK
      ?auto_705563 - BLOCK
      ?auto_705564 - BLOCK
      ?auto_705565 - BLOCK
      ?auto_705566 - BLOCK
      ?auto_705567 - BLOCK
      ?auto_705568 - BLOCK
      ?auto_705569 - BLOCK
      ?auto_705570 - BLOCK
      ?auto_705571 - BLOCK
      ?auto_705572 - BLOCK
      ?auto_705573 - BLOCK
    )
    :vars
    (
      ?auto_705574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705573 ?auto_705574 ) ( ON-TABLE ?auto_705561 ) ( ON ?auto_705562 ?auto_705561 ) ( ON ?auto_705563 ?auto_705562 ) ( ON ?auto_705564 ?auto_705563 ) ( not ( = ?auto_705561 ?auto_705562 ) ) ( not ( = ?auto_705561 ?auto_705563 ) ) ( not ( = ?auto_705561 ?auto_705564 ) ) ( not ( = ?auto_705561 ?auto_705565 ) ) ( not ( = ?auto_705561 ?auto_705566 ) ) ( not ( = ?auto_705561 ?auto_705567 ) ) ( not ( = ?auto_705561 ?auto_705568 ) ) ( not ( = ?auto_705561 ?auto_705569 ) ) ( not ( = ?auto_705561 ?auto_705570 ) ) ( not ( = ?auto_705561 ?auto_705571 ) ) ( not ( = ?auto_705561 ?auto_705572 ) ) ( not ( = ?auto_705561 ?auto_705573 ) ) ( not ( = ?auto_705561 ?auto_705574 ) ) ( not ( = ?auto_705562 ?auto_705563 ) ) ( not ( = ?auto_705562 ?auto_705564 ) ) ( not ( = ?auto_705562 ?auto_705565 ) ) ( not ( = ?auto_705562 ?auto_705566 ) ) ( not ( = ?auto_705562 ?auto_705567 ) ) ( not ( = ?auto_705562 ?auto_705568 ) ) ( not ( = ?auto_705562 ?auto_705569 ) ) ( not ( = ?auto_705562 ?auto_705570 ) ) ( not ( = ?auto_705562 ?auto_705571 ) ) ( not ( = ?auto_705562 ?auto_705572 ) ) ( not ( = ?auto_705562 ?auto_705573 ) ) ( not ( = ?auto_705562 ?auto_705574 ) ) ( not ( = ?auto_705563 ?auto_705564 ) ) ( not ( = ?auto_705563 ?auto_705565 ) ) ( not ( = ?auto_705563 ?auto_705566 ) ) ( not ( = ?auto_705563 ?auto_705567 ) ) ( not ( = ?auto_705563 ?auto_705568 ) ) ( not ( = ?auto_705563 ?auto_705569 ) ) ( not ( = ?auto_705563 ?auto_705570 ) ) ( not ( = ?auto_705563 ?auto_705571 ) ) ( not ( = ?auto_705563 ?auto_705572 ) ) ( not ( = ?auto_705563 ?auto_705573 ) ) ( not ( = ?auto_705563 ?auto_705574 ) ) ( not ( = ?auto_705564 ?auto_705565 ) ) ( not ( = ?auto_705564 ?auto_705566 ) ) ( not ( = ?auto_705564 ?auto_705567 ) ) ( not ( = ?auto_705564 ?auto_705568 ) ) ( not ( = ?auto_705564 ?auto_705569 ) ) ( not ( = ?auto_705564 ?auto_705570 ) ) ( not ( = ?auto_705564 ?auto_705571 ) ) ( not ( = ?auto_705564 ?auto_705572 ) ) ( not ( = ?auto_705564 ?auto_705573 ) ) ( not ( = ?auto_705564 ?auto_705574 ) ) ( not ( = ?auto_705565 ?auto_705566 ) ) ( not ( = ?auto_705565 ?auto_705567 ) ) ( not ( = ?auto_705565 ?auto_705568 ) ) ( not ( = ?auto_705565 ?auto_705569 ) ) ( not ( = ?auto_705565 ?auto_705570 ) ) ( not ( = ?auto_705565 ?auto_705571 ) ) ( not ( = ?auto_705565 ?auto_705572 ) ) ( not ( = ?auto_705565 ?auto_705573 ) ) ( not ( = ?auto_705565 ?auto_705574 ) ) ( not ( = ?auto_705566 ?auto_705567 ) ) ( not ( = ?auto_705566 ?auto_705568 ) ) ( not ( = ?auto_705566 ?auto_705569 ) ) ( not ( = ?auto_705566 ?auto_705570 ) ) ( not ( = ?auto_705566 ?auto_705571 ) ) ( not ( = ?auto_705566 ?auto_705572 ) ) ( not ( = ?auto_705566 ?auto_705573 ) ) ( not ( = ?auto_705566 ?auto_705574 ) ) ( not ( = ?auto_705567 ?auto_705568 ) ) ( not ( = ?auto_705567 ?auto_705569 ) ) ( not ( = ?auto_705567 ?auto_705570 ) ) ( not ( = ?auto_705567 ?auto_705571 ) ) ( not ( = ?auto_705567 ?auto_705572 ) ) ( not ( = ?auto_705567 ?auto_705573 ) ) ( not ( = ?auto_705567 ?auto_705574 ) ) ( not ( = ?auto_705568 ?auto_705569 ) ) ( not ( = ?auto_705568 ?auto_705570 ) ) ( not ( = ?auto_705568 ?auto_705571 ) ) ( not ( = ?auto_705568 ?auto_705572 ) ) ( not ( = ?auto_705568 ?auto_705573 ) ) ( not ( = ?auto_705568 ?auto_705574 ) ) ( not ( = ?auto_705569 ?auto_705570 ) ) ( not ( = ?auto_705569 ?auto_705571 ) ) ( not ( = ?auto_705569 ?auto_705572 ) ) ( not ( = ?auto_705569 ?auto_705573 ) ) ( not ( = ?auto_705569 ?auto_705574 ) ) ( not ( = ?auto_705570 ?auto_705571 ) ) ( not ( = ?auto_705570 ?auto_705572 ) ) ( not ( = ?auto_705570 ?auto_705573 ) ) ( not ( = ?auto_705570 ?auto_705574 ) ) ( not ( = ?auto_705571 ?auto_705572 ) ) ( not ( = ?auto_705571 ?auto_705573 ) ) ( not ( = ?auto_705571 ?auto_705574 ) ) ( not ( = ?auto_705572 ?auto_705573 ) ) ( not ( = ?auto_705572 ?auto_705574 ) ) ( not ( = ?auto_705573 ?auto_705574 ) ) ( ON ?auto_705572 ?auto_705573 ) ( ON ?auto_705571 ?auto_705572 ) ( ON ?auto_705570 ?auto_705571 ) ( ON ?auto_705569 ?auto_705570 ) ( ON ?auto_705568 ?auto_705569 ) ( ON ?auto_705567 ?auto_705568 ) ( ON ?auto_705566 ?auto_705567 ) ( CLEAR ?auto_705564 ) ( ON ?auto_705565 ?auto_705566 ) ( CLEAR ?auto_705565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_705561 ?auto_705562 ?auto_705563 ?auto_705564 ?auto_705565 )
      ( MAKE-13PILE ?auto_705561 ?auto_705562 ?auto_705563 ?auto_705564 ?auto_705565 ?auto_705566 ?auto_705567 ?auto_705568 ?auto_705569 ?auto_705570 ?auto_705571 ?auto_705572 ?auto_705573 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705615 - BLOCK
      ?auto_705616 - BLOCK
      ?auto_705617 - BLOCK
      ?auto_705618 - BLOCK
      ?auto_705619 - BLOCK
      ?auto_705620 - BLOCK
      ?auto_705621 - BLOCK
      ?auto_705622 - BLOCK
      ?auto_705623 - BLOCK
      ?auto_705624 - BLOCK
      ?auto_705625 - BLOCK
      ?auto_705626 - BLOCK
      ?auto_705627 - BLOCK
    )
    :vars
    (
      ?auto_705628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705627 ?auto_705628 ) ( ON-TABLE ?auto_705615 ) ( ON ?auto_705616 ?auto_705615 ) ( ON ?auto_705617 ?auto_705616 ) ( not ( = ?auto_705615 ?auto_705616 ) ) ( not ( = ?auto_705615 ?auto_705617 ) ) ( not ( = ?auto_705615 ?auto_705618 ) ) ( not ( = ?auto_705615 ?auto_705619 ) ) ( not ( = ?auto_705615 ?auto_705620 ) ) ( not ( = ?auto_705615 ?auto_705621 ) ) ( not ( = ?auto_705615 ?auto_705622 ) ) ( not ( = ?auto_705615 ?auto_705623 ) ) ( not ( = ?auto_705615 ?auto_705624 ) ) ( not ( = ?auto_705615 ?auto_705625 ) ) ( not ( = ?auto_705615 ?auto_705626 ) ) ( not ( = ?auto_705615 ?auto_705627 ) ) ( not ( = ?auto_705615 ?auto_705628 ) ) ( not ( = ?auto_705616 ?auto_705617 ) ) ( not ( = ?auto_705616 ?auto_705618 ) ) ( not ( = ?auto_705616 ?auto_705619 ) ) ( not ( = ?auto_705616 ?auto_705620 ) ) ( not ( = ?auto_705616 ?auto_705621 ) ) ( not ( = ?auto_705616 ?auto_705622 ) ) ( not ( = ?auto_705616 ?auto_705623 ) ) ( not ( = ?auto_705616 ?auto_705624 ) ) ( not ( = ?auto_705616 ?auto_705625 ) ) ( not ( = ?auto_705616 ?auto_705626 ) ) ( not ( = ?auto_705616 ?auto_705627 ) ) ( not ( = ?auto_705616 ?auto_705628 ) ) ( not ( = ?auto_705617 ?auto_705618 ) ) ( not ( = ?auto_705617 ?auto_705619 ) ) ( not ( = ?auto_705617 ?auto_705620 ) ) ( not ( = ?auto_705617 ?auto_705621 ) ) ( not ( = ?auto_705617 ?auto_705622 ) ) ( not ( = ?auto_705617 ?auto_705623 ) ) ( not ( = ?auto_705617 ?auto_705624 ) ) ( not ( = ?auto_705617 ?auto_705625 ) ) ( not ( = ?auto_705617 ?auto_705626 ) ) ( not ( = ?auto_705617 ?auto_705627 ) ) ( not ( = ?auto_705617 ?auto_705628 ) ) ( not ( = ?auto_705618 ?auto_705619 ) ) ( not ( = ?auto_705618 ?auto_705620 ) ) ( not ( = ?auto_705618 ?auto_705621 ) ) ( not ( = ?auto_705618 ?auto_705622 ) ) ( not ( = ?auto_705618 ?auto_705623 ) ) ( not ( = ?auto_705618 ?auto_705624 ) ) ( not ( = ?auto_705618 ?auto_705625 ) ) ( not ( = ?auto_705618 ?auto_705626 ) ) ( not ( = ?auto_705618 ?auto_705627 ) ) ( not ( = ?auto_705618 ?auto_705628 ) ) ( not ( = ?auto_705619 ?auto_705620 ) ) ( not ( = ?auto_705619 ?auto_705621 ) ) ( not ( = ?auto_705619 ?auto_705622 ) ) ( not ( = ?auto_705619 ?auto_705623 ) ) ( not ( = ?auto_705619 ?auto_705624 ) ) ( not ( = ?auto_705619 ?auto_705625 ) ) ( not ( = ?auto_705619 ?auto_705626 ) ) ( not ( = ?auto_705619 ?auto_705627 ) ) ( not ( = ?auto_705619 ?auto_705628 ) ) ( not ( = ?auto_705620 ?auto_705621 ) ) ( not ( = ?auto_705620 ?auto_705622 ) ) ( not ( = ?auto_705620 ?auto_705623 ) ) ( not ( = ?auto_705620 ?auto_705624 ) ) ( not ( = ?auto_705620 ?auto_705625 ) ) ( not ( = ?auto_705620 ?auto_705626 ) ) ( not ( = ?auto_705620 ?auto_705627 ) ) ( not ( = ?auto_705620 ?auto_705628 ) ) ( not ( = ?auto_705621 ?auto_705622 ) ) ( not ( = ?auto_705621 ?auto_705623 ) ) ( not ( = ?auto_705621 ?auto_705624 ) ) ( not ( = ?auto_705621 ?auto_705625 ) ) ( not ( = ?auto_705621 ?auto_705626 ) ) ( not ( = ?auto_705621 ?auto_705627 ) ) ( not ( = ?auto_705621 ?auto_705628 ) ) ( not ( = ?auto_705622 ?auto_705623 ) ) ( not ( = ?auto_705622 ?auto_705624 ) ) ( not ( = ?auto_705622 ?auto_705625 ) ) ( not ( = ?auto_705622 ?auto_705626 ) ) ( not ( = ?auto_705622 ?auto_705627 ) ) ( not ( = ?auto_705622 ?auto_705628 ) ) ( not ( = ?auto_705623 ?auto_705624 ) ) ( not ( = ?auto_705623 ?auto_705625 ) ) ( not ( = ?auto_705623 ?auto_705626 ) ) ( not ( = ?auto_705623 ?auto_705627 ) ) ( not ( = ?auto_705623 ?auto_705628 ) ) ( not ( = ?auto_705624 ?auto_705625 ) ) ( not ( = ?auto_705624 ?auto_705626 ) ) ( not ( = ?auto_705624 ?auto_705627 ) ) ( not ( = ?auto_705624 ?auto_705628 ) ) ( not ( = ?auto_705625 ?auto_705626 ) ) ( not ( = ?auto_705625 ?auto_705627 ) ) ( not ( = ?auto_705625 ?auto_705628 ) ) ( not ( = ?auto_705626 ?auto_705627 ) ) ( not ( = ?auto_705626 ?auto_705628 ) ) ( not ( = ?auto_705627 ?auto_705628 ) ) ( ON ?auto_705626 ?auto_705627 ) ( ON ?auto_705625 ?auto_705626 ) ( ON ?auto_705624 ?auto_705625 ) ( ON ?auto_705623 ?auto_705624 ) ( ON ?auto_705622 ?auto_705623 ) ( ON ?auto_705621 ?auto_705622 ) ( ON ?auto_705620 ?auto_705621 ) ( ON ?auto_705619 ?auto_705620 ) ( CLEAR ?auto_705617 ) ( ON ?auto_705618 ?auto_705619 ) ( CLEAR ?auto_705618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_705615 ?auto_705616 ?auto_705617 ?auto_705618 )
      ( MAKE-13PILE ?auto_705615 ?auto_705616 ?auto_705617 ?auto_705618 ?auto_705619 ?auto_705620 ?auto_705621 ?auto_705622 ?auto_705623 ?auto_705624 ?auto_705625 ?auto_705626 ?auto_705627 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705669 - BLOCK
      ?auto_705670 - BLOCK
      ?auto_705671 - BLOCK
      ?auto_705672 - BLOCK
      ?auto_705673 - BLOCK
      ?auto_705674 - BLOCK
      ?auto_705675 - BLOCK
      ?auto_705676 - BLOCK
      ?auto_705677 - BLOCK
      ?auto_705678 - BLOCK
      ?auto_705679 - BLOCK
      ?auto_705680 - BLOCK
      ?auto_705681 - BLOCK
    )
    :vars
    (
      ?auto_705682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705681 ?auto_705682 ) ( ON-TABLE ?auto_705669 ) ( ON ?auto_705670 ?auto_705669 ) ( not ( = ?auto_705669 ?auto_705670 ) ) ( not ( = ?auto_705669 ?auto_705671 ) ) ( not ( = ?auto_705669 ?auto_705672 ) ) ( not ( = ?auto_705669 ?auto_705673 ) ) ( not ( = ?auto_705669 ?auto_705674 ) ) ( not ( = ?auto_705669 ?auto_705675 ) ) ( not ( = ?auto_705669 ?auto_705676 ) ) ( not ( = ?auto_705669 ?auto_705677 ) ) ( not ( = ?auto_705669 ?auto_705678 ) ) ( not ( = ?auto_705669 ?auto_705679 ) ) ( not ( = ?auto_705669 ?auto_705680 ) ) ( not ( = ?auto_705669 ?auto_705681 ) ) ( not ( = ?auto_705669 ?auto_705682 ) ) ( not ( = ?auto_705670 ?auto_705671 ) ) ( not ( = ?auto_705670 ?auto_705672 ) ) ( not ( = ?auto_705670 ?auto_705673 ) ) ( not ( = ?auto_705670 ?auto_705674 ) ) ( not ( = ?auto_705670 ?auto_705675 ) ) ( not ( = ?auto_705670 ?auto_705676 ) ) ( not ( = ?auto_705670 ?auto_705677 ) ) ( not ( = ?auto_705670 ?auto_705678 ) ) ( not ( = ?auto_705670 ?auto_705679 ) ) ( not ( = ?auto_705670 ?auto_705680 ) ) ( not ( = ?auto_705670 ?auto_705681 ) ) ( not ( = ?auto_705670 ?auto_705682 ) ) ( not ( = ?auto_705671 ?auto_705672 ) ) ( not ( = ?auto_705671 ?auto_705673 ) ) ( not ( = ?auto_705671 ?auto_705674 ) ) ( not ( = ?auto_705671 ?auto_705675 ) ) ( not ( = ?auto_705671 ?auto_705676 ) ) ( not ( = ?auto_705671 ?auto_705677 ) ) ( not ( = ?auto_705671 ?auto_705678 ) ) ( not ( = ?auto_705671 ?auto_705679 ) ) ( not ( = ?auto_705671 ?auto_705680 ) ) ( not ( = ?auto_705671 ?auto_705681 ) ) ( not ( = ?auto_705671 ?auto_705682 ) ) ( not ( = ?auto_705672 ?auto_705673 ) ) ( not ( = ?auto_705672 ?auto_705674 ) ) ( not ( = ?auto_705672 ?auto_705675 ) ) ( not ( = ?auto_705672 ?auto_705676 ) ) ( not ( = ?auto_705672 ?auto_705677 ) ) ( not ( = ?auto_705672 ?auto_705678 ) ) ( not ( = ?auto_705672 ?auto_705679 ) ) ( not ( = ?auto_705672 ?auto_705680 ) ) ( not ( = ?auto_705672 ?auto_705681 ) ) ( not ( = ?auto_705672 ?auto_705682 ) ) ( not ( = ?auto_705673 ?auto_705674 ) ) ( not ( = ?auto_705673 ?auto_705675 ) ) ( not ( = ?auto_705673 ?auto_705676 ) ) ( not ( = ?auto_705673 ?auto_705677 ) ) ( not ( = ?auto_705673 ?auto_705678 ) ) ( not ( = ?auto_705673 ?auto_705679 ) ) ( not ( = ?auto_705673 ?auto_705680 ) ) ( not ( = ?auto_705673 ?auto_705681 ) ) ( not ( = ?auto_705673 ?auto_705682 ) ) ( not ( = ?auto_705674 ?auto_705675 ) ) ( not ( = ?auto_705674 ?auto_705676 ) ) ( not ( = ?auto_705674 ?auto_705677 ) ) ( not ( = ?auto_705674 ?auto_705678 ) ) ( not ( = ?auto_705674 ?auto_705679 ) ) ( not ( = ?auto_705674 ?auto_705680 ) ) ( not ( = ?auto_705674 ?auto_705681 ) ) ( not ( = ?auto_705674 ?auto_705682 ) ) ( not ( = ?auto_705675 ?auto_705676 ) ) ( not ( = ?auto_705675 ?auto_705677 ) ) ( not ( = ?auto_705675 ?auto_705678 ) ) ( not ( = ?auto_705675 ?auto_705679 ) ) ( not ( = ?auto_705675 ?auto_705680 ) ) ( not ( = ?auto_705675 ?auto_705681 ) ) ( not ( = ?auto_705675 ?auto_705682 ) ) ( not ( = ?auto_705676 ?auto_705677 ) ) ( not ( = ?auto_705676 ?auto_705678 ) ) ( not ( = ?auto_705676 ?auto_705679 ) ) ( not ( = ?auto_705676 ?auto_705680 ) ) ( not ( = ?auto_705676 ?auto_705681 ) ) ( not ( = ?auto_705676 ?auto_705682 ) ) ( not ( = ?auto_705677 ?auto_705678 ) ) ( not ( = ?auto_705677 ?auto_705679 ) ) ( not ( = ?auto_705677 ?auto_705680 ) ) ( not ( = ?auto_705677 ?auto_705681 ) ) ( not ( = ?auto_705677 ?auto_705682 ) ) ( not ( = ?auto_705678 ?auto_705679 ) ) ( not ( = ?auto_705678 ?auto_705680 ) ) ( not ( = ?auto_705678 ?auto_705681 ) ) ( not ( = ?auto_705678 ?auto_705682 ) ) ( not ( = ?auto_705679 ?auto_705680 ) ) ( not ( = ?auto_705679 ?auto_705681 ) ) ( not ( = ?auto_705679 ?auto_705682 ) ) ( not ( = ?auto_705680 ?auto_705681 ) ) ( not ( = ?auto_705680 ?auto_705682 ) ) ( not ( = ?auto_705681 ?auto_705682 ) ) ( ON ?auto_705680 ?auto_705681 ) ( ON ?auto_705679 ?auto_705680 ) ( ON ?auto_705678 ?auto_705679 ) ( ON ?auto_705677 ?auto_705678 ) ( ON ?auto_705676 ?auto_705677 ) ( ON ?auto_705675 ?auto_705676 ) ( ON ?auto_705674 ?auto_705675 ) ( ON ?auto_705673 ?auto_705674 ) ( ON ?auto_705672 ?auto_705673 ) ( CLEAR ?auto_705670 ) ( ON ?auto_705671 ?auto_705672 ) ( CLEAR ?auto_705671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_705669 ?auto_705670 ?auto_705671 )
      ( MAKE-13PILE ?auto_705669 ?auto_705670 ?auto_705671 ?auto_705672 ?auto_705673 ?auto_705674 ?auto_705675 ?auto_705676 ?auto_705677 ?auto_705678 ?auto_705679 ?auto_705680 ?auto_705681 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705723 - BLOCK
      ?auto_705724 - BLOCK
      ?auto_705725 - BLOCK
      ?auto_705726 - BLOCK
      ?auto_705727 - BLOCK
      ?auto_705728 - BLOCK
      ?auto_705729 - BLOCK
      ?auto_705730 - BLOCK
      ?auto_705731 - BLOCK
      ?auto_705732 - BLOCK
      ?auto_705733 - BLOCK
      ?auto_705734 - BLOCK
      ?auto_705735 - BLOCK
    )
    :vars
    (
      ?auto_705736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705735 ?auto_705736 ) ( ON-TABLE ?auto_705723 ) ( not ( = ?auto_705723 ?auto_705724 ) ) ( not ( = ?auto_705723 ?auto_705725 ) ) ( not ( = ?auto_705723 ?auto_705726 ) ) ( not ( = ?auto_705723 ?auto_705727 ) ) ( not ( = ?auto_705723 ?auto_705728 ) ) ( not ( = ?auto_705723 ?auto_705729 ) ) ( not ( = ?auto_705723 ?auto_705730 ) ) ( not ( = ?auto_705723 ?auto_705731 ) ) ( not ( = ?auto_705723 ?auto_705732 ) ) ( not ( = ?auto_705723 ?auto_705733 ) ) ( not ( = ?auto_705723 ?auto_705734 ) ) ( not ( = ?auto_705723 ?auto_705735 ) ) ( not ( = ?auto_705723 ?auto_705736 ) ) ( not ( = ?auto_705724 ?auto_705725 ) ) ( not ( = ?auto_705724 ?auto_705726 ) ) ( not ( = ?auto_705724 ?auto_705727 ) ) ( not ( = ?auto_705724 ?auto_705728 ) ) ( not ( = ?auto_705724 ?auto_705729 ) ) ( not ( = ?auto_705724 ?auto_705730 ) ) ( not ( = ?auto_705724 ?auto_705731 ) ) ( not ( = ?auto_705724 ?auto_705732 ) ) ( not ( = ?auto_705724 ?auto_705733 ) ) ( not ( = ?auto_705724 ?auto_705734 ) ) ( not ( = ?auto_705724 ?auto_705735 ) ) ( not ( = ?auto_705724 ?auto_705736 ) ) ( not ( = ?auto_705725 ?auto_705726 ) ) ( not ( = ?auto_705725 ?auto_705727 ) ) ( not ( = ?auto_705725 ?auto_705728 ) ) ( not ( = ?auto_705725 ?auto_705729 ) ) ( not ( = ?auto_705725 ?auto_705730 ) ) ( not ( = ?auto_705725 ?auto_705731 ) ) ( not ( = ?auto_705725 ?auto_705732 ) ) ( not ( = ?auto_705725 ?auto_705733 ) ) ( not ( = ?auto_705725 ?auto_705734 ) ) ( not ( = ?auto_705725 ?auto_705735 ) ) ( not ( = ?auto_705725 ?auto_705736 ) ) ( not ( = ?auto_705726 ?auto_705727 ) ) ( not ( = ?auto_705726 ?auto_705728 ) ) ( not ( = ?auto_705726 ?auto_705729 ) ) ( not ( = ?auto_705726 ?auto_705730 ) ) ( not ( = ?auto_705726 ?auto_705731 ) ) ( not ( = ?auto_705726 ?auto_705732 ) ) ( not ( = ?auto_705726 ?auto_705733 ) ) ( not ( = ?auto_705726 ?auto_705734 ) ) ( not ( = ?auto_705726 ?auto_705735 ) ) ( not ( = ?auto_705726 ?auto_705736 ) ) ( not ( = ?auto_705727 ?auto_705728 ) ) ( not ( = ?auto_705727 ?auto_705729 ) ) ( not ( = ?auto_705727 ?auto_705730 ) ) ( not ( = ?auto_705727 ?auto_705731 ) ) ( not ( = ?auto_705727 ?auto_705732 ) ) ( not ( = ?auto_705727 ?auto_705733 ) ) ( not ( = ?auto_705727 ?auto_705734 ) ) ( not ( = ?auto_705727 ?auto_705735 ) ) ( not ( = ?auto_705727 ?auto_705736 ) ) ( not ( = ?auto_705728 ?auto_705729 ) ) ( not ( = ?auto_705728 ?auto_705730 ) ) ( not ( = ?auto_705728 ?auto_705731 ) ) ( not ( = ?auto_705728 ?auto_705732 ) ) ( not ( = ?auto_705728 ?auto_705733 ) ) ( not ( = ?auto_705728 ?auto_705734 ) ) ( not ( = ?auto_705728 ?auto_705735 ) ) ( not ( = ?auto_705728 ?auto_705736 ) ) ( not ( = ?auto_705729 ?auto_705730 ) ) ( not ( = ?auto_705729 ?auto_705731 ) ) ( not ( = ?auto_705729 ?auto_705732 ) ) ( not ( = ?auto_705729 ?auto_705733 ) ) ( not ( = ?auto_705729 ?auto_705734 ) ) ( not ( = ?auto_705729 ?auto_705735 ) ) ( not ( = ?auto_705729 ?auto_705736 ) ) ( not ( = ?auto_705730 ?auto_705731 ) ) ( not ( = ?auto_705730 ?auto_705732 ) ) ( not ( = ?auto_705730 ?auto_705733 ) ) ( not ( = ?auto_705730 ?auto_705734 ) ) ( not ( = ?auto_705730 ?auto_705735 ) ) ( not ( = ?auto_705730 ?auto_705736 ) ) ( not ( = ?auto_705731 ?auto_705732 ) ) ( not ( = ?auto_705731 ?auto_705733 ) ) ( not ( = ?auto_705731 ?auto_705734 ) ) ( not ( = ?auto_705731 ?auto_705735 ) ) ( not ( = ?auto_705731 ?auto_705736 ) ) ( not ( = ?auto_705732 ?auto_705733 ) ) ( not ( = ?auto_705732 ?auto_705734 ) ) ( not ( = ?auto_705732 ?auto_705735 ) ) ( not ( = ?auto_705732 ?auto_705736 ) ) ( not ( = ?auto_705733 ?auto_705734 ) ) ( not ( = ?auto_705733 ?auto_705735 ) ) ( not ( = ?auto_705733 ?auto_705736 ) ) ( not ( = ?auto_705734 ?auto_705735 ) ) ( not ( = ?auto_705734 ?auto_705736 ) ) ( not ( = ?auto_705735 ?auto_705736 ) ) ( ON ?auto_705734 ?auto_705735 ) ( ON ?auto_705733 ?auto_705734 ) ( ON ?auto_705732 ?auto_705733 ) ( ON ?auto_705731 ?auto_705732 ) ( ON ?auto_705730 ?auto_705731 ) ( ON ?auto_705729 ?auto_705730 ) ( ON ?auto_705728 ?auto_705729 ) ( ON ?auto_705727 ?auto_705728 ) ( ON ?auto_705726 ?auto_705727 ) ( ON ?auto_705725 ?auto_705726 ) ( CLEAR ?auto_705723 ) ( ON ?auto_705724 ?auto_705725 ) ( CLEAR ?auto_705724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_705723 ?auto_705724 )
      ( MAKE-13PILE ?auto_705723 ?auto_705724 ?auto_705725 ?auto_705726 ?auto_705727 ?auto_705728 ?auto_705729 ?auto_705730 ?auto_705731 ?auto_705732 ?auto_705733 ?auto_705734 ?auto_705735 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_705777 - BLOCK
      ?auto_705778 - BLOCK
      ?auto_705779 - BLOCK
      ?auto_705780 - BLOCK
      ?auto_705781 - BLOCK
      ?auto_705782 - BLOCK
      ?auto_705783 - BLOCK
      ?auto_705784 - BLOCK
      ?auto_705785 - BLOCK
      ?auto_705786 - BLOCK
      ?auto_705787 - BLOCK
      ?auto_705788 - BLOCK
      ?auto_705789 - BLOCK
    )
    :vars
    (
      ?auto_705790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705789 ?auto_705790 ) ( not ( = ?auto_705777 ?auto_705778 ) ) ( not ( = ?auto_705777 ?auto_705779 ) ) ( not ( = ?auto_705777 ?auto_705780 ) ) ( not ( = ?auto_705777 ?auto_705781 ) ) ( not ( = ?auto_705777 ?auto_705782 ) ) ( not ( = ?auto_705777 ?auto_705783 ) ) ( not ( = ?auto_705777 ?auto_705784 ) ) ( not ( = ?auto_705777 ?auto_705785 ) ) ( not ( = ?auto_705777 ?auto_705786 ) ) ( not ( = ?auto_705777 ?auto_705787 ) ) ( not ( = ?auto_705777 ?auto_705788 ) ) ( not ( = ?auto_705777 ?auto_705789 ) ) ( not ( = ?auto_705777 ?auto_705790 ) ) ( not ( = ?auto_705778 ?auto_705779 ) ) ( not ( = ?auto_705778 ?auto_705780 ) ) ( not ( = ?auto_705778 ?auto_705781 ) ) ( not ( = ?auto_705778 ?auto_705782 ) ) ( not ( = ?auto_705778 ?auto_705783 ) ) ( not ( = ?auto_705778 ?auto_705784 ) ) ( not ( = ?auto_705778 ?auto_705785 ) ) ( not ( = ?auto_705778 ?auto_705786 ) ) ( not ( = ?auto_705778 ?auto_705787 ) ) ( not ( = ?auto_705778 ?auto_705788 ) ) ( not ( = ?auto_705778 ?auto_705789 ) ) ( not ( = ?auto_705778 ?auto_705790 ) ) ( not ( = ?auto_705779 ?auto_705780 ) ) ( not ( = ?auto_705779 ?auto_705781 ) ) ( not ( = ?auto_705779 ?auto_705782 ) ) ( not ( = ?auto_705779 ?auto_705783 ) ) ( not ( = ?auto_705779 ?auto_705784 ) ) ( not ( = ?auto_705779 ?auto_705785 ) ) ( not ( = ?auto_705779 ?auto_705786 ) ) ( not ( = ?auto_705779 ?auto_705787 ) ) ( not ( = ?auto_705779 ?auto_705788 ) ) ( not ( = ?auto_705779 ?auto_705789 ) ) ( not ( = ?auto_705779 ?auto_705790 ) ) ( not ( = ?auto_705780 ?auto_705781 ) ) ( not ( = ?auto_705780 ?auto_705782 ) ) ( not ( = ?auto_705780 ?auto_705783 ) ) ( not ( = ?auto_705780 ?auto_705784 ) ) ( not ( = ?auto_705780 ?auto_705785 ) ) ( not ( = ?auto_705780 ?auto_705786 ) ) ( not ( = ?auto_705780 ?auto_705787 ) ) ( not ( = ?auto_705780 ?auto_705788 ) ) ( not ( = ?auto_705780 ?auto_705789 ) ) ( not ( = ?auto_705780 ?auto_705790 ) ) ( not ( = ?auto_705781 ?auto_705782 ) ) ( not ( = ?auto_705781 ?auto_705783 ) ) ( not ( = ?auto_705781 ?auto_705784 ) ) ( not ( = ?auto_705781 ?auto_705785 ) ) ( not ( = ?auto_705781 ?auto_705786 ) ) ( not ( = ?auto_705781 ?auto_705787 ) ) ( not ( = ?auto_705781 ?auto_705788 ) ) ( not ( = ?auto_705781 ?auto_705789 ) ) ( not ( = ?auto_705781 ?auto_705790 ) ) ( not ( = ?auto_705782 ?auto_705783 ) ) ( not ( = ?auto_705782 ?auto_705784 ) ) ( not ( = ?auto_705782 ?auto_705785 ) ) ( not ( = ?auto_705782 ?auto_705786 ) ) ( not ( = ?auto_705782 ?auto_705787 ) ) ( not ( = ?auto_705782 ?auto_705788 ) ) ( not ( = ?auto_705782 ?auto_705789 ) ) ( not ( = ?auto_705782 ?auto_705790 ) ) ( not ( = ?auto_705783 ?auto_705784 ) ) ( not ( = ?auto_705783 ?auto_705785 ) ) ( not ( = ?auto_705783 ?auto_705786 ) ) ( not ( = ?auto_705783 ?auto_705787 ) ) ( not ( = ?auto_705783 ?auto_705788 ) ) ( not ( = ?auto_705783 ?auto_705789 ) ) ( not ( = ?auto_705783 ?auto_705790 ) ) ( not ( = ?auto_705784 ?auto_705785 ) ) ( not ( = ?auto_705784 ?auto_705786 ) ) ( not ( = ?auto_705784 ?auto_705787 ) ) ( not ( = ?auto_705784 ?auto_705788 ) ) ( not ( = ?auto_705784 ?auto_705789 ) ) ( not ( = ?auto_705784 ?auto_705790 ) ) ( not ( = ?auto_705785 ?auto_705786 ) ) ( not ( = ?auto_705785 ?auto_705787 ) ) ( not ( = ?auto_705785 ?auto_705788 ) ) ( not ( = ?auto_705785 ?auto_705789 ) ) ( not ( = ?auto_705785 ?auto_705790 ) ) ( not ( = ?auto_705786 ?auto_705787 ) ) ( not ( = ?auto_705786 ?auto_705788 ) ) ( not ( = ?auto_705786 ?auto_705789 ) ) ( not ( = ?auto_705786 ?auto_705790 ) ) ( not ( = ?auto_705787 ?auto_705788 ) ) ( not ( = ?auto_705787 ?auto_705789 ) ) ( not ( = ?auto_705787 ?auto_705790 ) ) ( not ( = ?auto_705788 ?auto_705789 ) ) ( not ( = ?auto_705788 ?auto_705790 ) ) ( not ( = ?auto_705789 ?auto_705790 ) ) ( ON ?auto_705788 ?auto_705789 ) ( ON ?auto_705787 ?auto_705788 ) ( ON ?auto_705786 ?auto_705787 ) ( ON ?auto_705785 ?auto_705786 ) ( ON ?auto_705784 ?auto_705785 ) ( ON ?auto_705783 ?auto_705784 ) ( ON ?auto_705782 ?auto_705783 ) ( ON ?auto_705781 ?auto_705782 ) ( ON ?auto_705780 ?auto_705781 ) ( ON ?auto_705779 ?auto_705780 ) ( ON ?auto_705778 ?auto_705779 ) ( ON ?auto_705777 ?auto_705778 ) ( CLEAR ?auto_705777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_705777 )
      ( MAKE-13PILE ?auto_705777 ?auto_705778 ?auto_705779 ?auto_705780 ?auto_705781 ?auto_705782 ?auto_705783 ?auto_705784 ?auto_705785 ?auto_705786 ?auto_705787 ?auto_705788 ?auto_705789 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_705832 - BLOCK
      ?auto_705833 - BLOCK
      ?auto_705834 - BLOCK
      ?auto_705835 - BLOCK
      ?auto_705836 - BLOCK
      ?auto_705837 - BLOCK
      ?auto_705838 - BLOCK
      ?auto_705839 - BLOCK
      ?auto_705840 - BLOCK
      ?auto_705841 - BLOCK
      ?auto_705842 - BLOCK
      ?auto_705843 - BLOCK
      ?auto_705844 - BLOCK
      ?auto_705845 - BLOCK
    )
    :vars
    (
      ?auto_705846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_705844 ) ( ON ?auto_705845 ?auto_705846 ) ( CLEAR ?auto_705845 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_705832 ) ( ON ?auto_705833 ?auto_705832 ) ( ON ?auto_705834 ?auto_705833 ) ( ON ?auto_705835 ?auto_705834 ) ( ON ?auto_705836 ?auto_705835 ) ( ON ?auto_705837 ?auto_705836 ) ( ON ?auto_705838 ?auto_705837 ) ( ON ?auto_705839 ?auto_705838 ) ( ON ?auto_705840 ?auto_705839 ) ( ON ?auto_705841 ?auto_705840 ) ( ON ?auto_705842 ?auto_705841 ) ( ON ?auto_705843 ?auto_705842 ) ( ON ?auto_705844 ?auto_705843 ) ( not ( = ?auto_705832 ?auto_705833 ) ) ( not ( = ?auto_705832 ?auto_705834 ) ) ( not ( = ?auto_705832 ?auto_705835 ) ) ( not ( = ?auto_705832 ?auto_705836 ) ) ( not ( = ?auto_705832 ?auto_705837 ) ) ( not ( = ?auto_705832 ?auto_705838 ) ) ( not ( = ?auto_705832 ?auto_705839 ) ) ( not ( = ?auto_705832 ?auto_705840 ) ) ( not ( = ?auto_705832 ?auto_705841 ) ) ( not ( = ?auto_705832 ?auto_705842 ) ) ( not ( = ?auto_705832 ?auto_705843 ) ) ( not ( = ?auto_705832 ?auto_705844 ) ) ( not ( = ?auto_705832 ?auto_705845 ) ) ( not ( = ?auto_705832 ?auto_705846 ) ) ( not ( = ?auto_705833 ?auto_705834 ) ) ( not ( = ?auto_705833 ?auto_705835 ) ) ( not ( = ?auto_705833 ?auto_705836 ) ) ( not ( = ?auto_705833 ?auto_705837 ) ) ( not ( = ?auto_705833 ?auto_705838 ) ) ( not ( = ?auto_705833 ?auto_705839 ) ) ( not ( = ?auto_705833 ?auto_705840 ) ) ( not ( = ?auto_705833 ?auto_705841 ) ) ( not ( = ?auto_705833 ?auto_705842 ) ) ( not ( = ?auto_705833 ?auto_705843 ) ) ( not ( = ?auto_705833 ?auto_705844 ) ) ( not ( = ?auto_705833 ?auto_705845 ) ) ( not ( = ?auto_705833 ?auto_705846 ) ) ( not ( = ?auto_705834 ?auto_705835 ) ) ( not ( = ?auto_705834 ?auto_705836 ) ) ( not ( = ?auto_705834 ?auto_705837 ) ) ( not ( = ?auto_705834 ?auto_705838 ) ) ( not ( = ?auto_705834 ?auto_705839 ) ) ( not ( = ?auto_705834 ?auto_705840 ) ) ( not ( = ?auto_705834 ?auto_705841 ) ) ( not ( = ?auto_705834 ?auto_705842 ) ) ( not ( = ?auto_705834 ?auto_705843 ) ) ( not ( = ?auto_705834 ?auto_705844 ) ) ( not ( = ?auto_705834 ?auto_705845 ) ) ( not ( = ?auto_705834 ?auto_705846 ) ) ( not ( = ?auto_705835 ?auto_705836 ) ) ( not ( = ?auto_705835 ?auto_705837 ) ) ( not ( = ?auto_705835 ?auto_705838 ) ) ( not ( = ?auto_705835 ?auto_705839 ) ) ( not ( = ?auto_705835 ?auto_705840 ) ) ( not ( = ?auto_705835 ?auto_705841 ) ) ( not ( = ?auto_705835 ?auto_705842 ) ) ( not ( = ?auto_705835 ?auto_705843 ) ) ( not ( = ?auto_705835 ?auto_705844 ) ) ( not ( = ?auto_705835 ?auto_705845 ) ) ( not ( = ?auto_705835 ?auto_705846 ) ) ( not ( = ?auto_705836 ?auto_705837 ) ) ( not ( = ?auto_705836 ?auto_705838 ) ) ( not ( = ?auto_705836 ?auto_705839 ) ) ( not ( = ?auto_705836 ?auto_705840 ) ) ( not ( = ?auto_705836 ?auto_705841 ) ) ( not ( = ?auto_705836 ?auto_705842 ) ) ( not ( = ?auto_705836 ?auto_705843 ) ) ( not ( = ?auto_705836 ?auto_705844 ) ) ( not ( = ?auto_705836 ?auto_705845 ) ) ( not ( = ?auto_705836 ?auto_705846 ) ) ( not ( = ?auto_705837 ?auto_705838 ) ) ( not ( = ?auto_705837 ?auto_705839 ) ) ( not ( = ?auto_705837 ?auto_705840 ) ) ( not ( = ?auto_705837 ?auto_705841 ) ) ( not ( = ?auto_705837 ?auto_705842 ) ) ( not ( = ?auto_705837 ?auto_705843 ) ) ( not ( = ?auto_705837 ?auto_705844 ) ) ( not ( = ?auto_705837 ?auto_705845 ) ) ( not ( = ?auto_705837 ?auto_705846 ) ) ( not ( = ?auto_705838 ?auto_705839 ) ) ( not ( = ?auto_705838 ?auto_705840 ) ) ( not ( = ?auto_705838 ?auto_705841 ) ) ( not ( = ?auto_705838 ?auto_705842 ) ) ( not ( = ?auto_705838 ?auto_705843 ) ) ( not ( = ?auto_705838 ?auto_705844 ) ) ( not ( = ?auto_705838 ?auto_705845 ) ) ( not ( = ?auto_705838 ?auto_705846 ) ) ( not ( = ?auto_705839 ?auto_705840 ) ) ( not ( = ?auto_705839 ?auto_705841 ) ) ( not ( = ?auto_705839 ?auto_705842 ) ) ( not ( = ?auto_705839 ?auto_705843 ) ) ( not ( = ?auto_705839 ?auto_705844 ) ) ( not ( = ?auto_705839 ?auto_705845 ) ) ( not ( = ?auto_705839 ?auto_705846 ) ) ( not ( = ?auto_705840 ?auto_705841 ) ) ( not ( = ?auto_705840 ?auto_705842 ) ) ( not ( = ?auto_705840 ?auto_705843 ) ) ( not ( = ?auto_705840 ?auto_705844 ) ) ( not ( = ?auto_705840 ?auto_705845 ) ) ( not ( = ?auto_705840 ?auto_705846 ) ) ( not ( = ?auto_705841 ?auto_705842 ) ) ( not ( = ?auto_705841 ?auto_705843 ) ) ( not ( = ?auto_705841 ?auto_705844 ) ) ( not ( = ?auto_705841 ?auto_705845 ) ) ( not ( = ?auto_705841 ?auto_705846 ) ) ( not ( = ?auto_705842 ?auto_705843 ) ) ( not ( = ?auto_705842 ?auto_705844 ) ) ( not ( = ?auto_705842 ?auto_705845 ) ) ( not ( = ?auto_705842 ?auto_705846 ) ) ( not ( = ?auto_705843 ?auto_705844 ) ) ( not ( = ?auto_705843 ?auto_705845 ) ) ( not ( = ?auto_705843 ?auto_705846 ) ) ( not ( = ?auto_705844 ?auto_705845 ) ) ( not ( = ?auto_705844 ?auto_705846 ) ) ( not ( = ?auto_705845 ?auto_705846 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_705845 ?auto_705846 )
      ( !STACK ?auto_705845 ?auto_705844 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_705890 - BLOCK
      ?auto_705891 - BLOCK
      ?auto_705892 - BLOCK
      ?auto_705893 - BLOCK
      ?auto_705894 - BLOCK
      ?auto_705895 - BLOCK
      ?auto_705896 - BLOCK
      ?auto_705897 - BLOCK
      ?auto_705898 - BLOCK
      ?auto_705899 - BLOCK
      ?auto_705900 - BLOCK
      ?auto_705901 - BLOCK
      ?auto_705902 - BLOCK
      ?auto_705903 - BLOCK
    )
    :vars
    (
      ?auto_705904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705903 ?auto_705904 ) ( ON-TABLE ?auto_705890 ) ( ON ?auto_705891 ?auto_705890 ) ( ON ?auto_705892 ?auto_705891 ) ( ON ?auto_705893 ?auto_705892 ) ( ON ?auto_705894 ?auto_705893 ) ( ON ?auto_705895 ?auto_705894 ) ( ON ?auto_705896 ?auto_705895 ) ( ON ?auto_705897 ?auto_705896 ) ( ON ?auto_705898 ?auto_705897 ) ( ON ?auto_705899 ?auto_705898 ) ( ON ?auto_705900 ?auto_705899 ) ( ON ?auto_705901 ?auto_705900 ) ( not ( = ?auto_705890 ?auto_705891 ) ) ( not ( = ?auto_705890 ?auto_705892 ) ) ( not ( = ?auto_705890 ?auto_705893 ) ) ( not ( = ?auto_705890 ?auto_705894 ) ) ( not ( = ?auto_705890 ?auto_705895 ) ) ( not ( = ?auto_705890 ?auto_705896 ) ) ( not ( = ?auto_705890 ?auto_705897 ) ) ( not ( = ?auto_705890 ?auto_705898 ) ) ( not ( = ?auto_705890 ?auto_705899 ) ) ( not ( = ?auto_705890 ?auto_705900 ) ) ( not ( = ?auto_705890 ?auto_705901 ) ) ( not ( = ?auto_705890 ?auto_705902 ) ) ( not ( = ?auto_705890 ?auto_705903 ) ) ( not ( = ?auto_705890 ?auto_705904 ) ) ( not ( = ?auto_705891 ?auto_705892 ) ) ( not ( = ?auto_705891 ?auto_705893 ) ) ( not ( = ?auto_705891 ?auto_705894 ) ) ( not ( = ?auto_705891 ?auto_705895 ) ) ( not ( = ?auto_705891 ?auto_705896 ) ) ( not ( = ?auto_705891 ?auto_705897 ) ) ( not ( = ?auto_705891 ?auto_705898 ) ) ( not ( = ?auto_705891 ?auto_705899 ) ) ( not ( = ?auto_705891 ?auto_705900 ) ) ( not ( = ?auto_705891 ?auto_705901 ) ) ( not ( = ?auto_705891 ?auto_705902 ) ) ( not ( = ?auto_705891 ?auto_705903 ) ) ( not ( = ?auto_705891 ?auto_705904 ) ) ( not ( = ?auto_705892 ?auto_705893 ) ) ( not ( = ?auto_705892 ?auto_705894 ) ) ( not ( = ?auto_705892 ?auto_705895 ) ) ( not ( = ?auto_705892 ?auto_705896 ) ) ( not ( = ?auto_705892 ?auto_705897 ) ) ( not ( = ?auto_705892 ?auto_705898 ) ) ( not ( = ?auto_705892 ?auto_705899 ) ) ( not ( = ?auto_705892 ?auto_705900 ) ) ( not ( = ?auto_705892 ?auto_705901 ) ) ( not ( = ?auto_705892 ?auto_705902 ) ) ( not ( = ?auto_705892 ?auto_705903 ) ) ( not ( = ?auto_705892 ?auto_705904 ) ) ( not ( = ?auto_705893 ?auto_705894 ) ) ( not ( = ?auto_705893 ?auto_705895 ) ) ( not ( = ?auto_705893 ?auto_705896 ) ) ( not ( = ?auto_705893 ?auto_705897 ) ) ( not ( = ?auto_705893 ?auto_705898 ) ) ( not ( = ?auto_705893 ?auto_705899 ) ) ( not ( = ?auto_705893 ?auto_705900 ) ) ( not ( = ?auto_705893 ?auto_705901 ) ) ( not ( = ?auto_705893 ?auto_705902 ) ) ( not ( = ?auto_705893 ?auto_705903 ) ) ( not ( = ?auto_705893 ?auto_705904 ) ) ( not ( = ?auto_705894 ?auto_705895 ) ) ( not ( = ?auto_705894 ?auto_705896 ) ) ( not ( = ?auto_705894 ?auto_705897 ) ) ( not ( = ?auto_705894 ?auto_705898 ) ) ( not ( = ?auto_705894 ?auto_705899 ) ) ( not ( = ?auto_705894 ?auto_705900 ) ) ( not ( = ?auto_705894 ?auto_705901 ) ) ( not ( = ?auto_705894 ?auto_705902 ) ) ( not ( = ?auto_705894 ?auto_705903 ) ) ( not ( = ?auto_705894 ?auto_705904 ) ) ( not ( = ?auto_705895 ?auto_705896 ) ) ( not ( = ?auto_705895 ?auto_705897 ) ) ( not ( = ?auto_705895 ?auto_705898 ) ) ( not ( = ?auto_705895 ?auto_705899 ) ) ( not ( = ?auto_705895 ?auto_705900 ) ) ( not ( = ?auto_705895 ?auto_705901 ) ) ( not ( = ?auto_705895 ?auto_705902 ) ) ( not ( = ?auto_705895 ?auto_705903 ) ) ( not ( = ?auto_705895 ?auto_705904 ) ) ( not ( = ?auto_705896 ?auto_705897 ) ) ( not ( = ?auto_705896 ?auto_705898 ) ) ( not ( = ?auto_705896 ?auto_705899 ) ) ( not ( = ?auto_705896 ?auto_705900 ) ) ( not ( = ?auto_705896 ?auto_705901 ) ) ( not ( = ?auto_705896 ?auto_705902 ) ) ( not ( = ?auto_705896 ?auto_705903 ) ) ( not ( = ?auto_705896 ?auto_705904 ) ) ( not ( = ?auto_705897 ?auto_705898 ) ) ( not ( = ?auto_705897 ?auto_705899 ) ) ( not ( = ?auto_705897 ?auto_705900 ) ) ( not ( = ?auto_705897 ?auto_705901 ) ) ( not ( = ?auto_705897 ?auto_705902 ) ) ( not ( = ?auto_705897 ?auto_705903 ) ) ( not ( = ?auto_705897 ?auto_705904 ) ) ( not ( = ?auto_705898 ?auto_705899 ) ) ( not ( = ?auto_705898 ?auto_705900 ) ) ( not ( = ?auto_705898 ?auto_705901 ) ) ( not ( = ?auto_705898 ?auto_705902 ) ) ( not ( = ?auto_705898 ?auto_705903 ) ) ( not ( = ?auto_705898 ?auto_705904 ) ) ( not ( = ?auto_705899 ?auto_705900 ) ) ( not ( = ?auto_705899 ?auto_705901 ) ) ( not ( = ?auto_705899 ?auto_705902 ) ) ( not ( = ?auto_705899 ?auto_705903 ) ) ( not ( = ?auto_705899 ?auto_705904 ) ) ( not ( = ?auto_705900 ?auto_705901 ) ) ( not ( = ?auto_705900 ?auto_705902 ) ) ( not ( = ?auto_705900 ?auto_705903 ) ) ( not ( = ?auto_705900 ?auto_705904 ) ) ( not ( = ?auto_705901 ?auto_705902 ) ) ( not ( = ?auto_705901 ?auto_705903 ) ) ( not ( = ?auto_705901 ?auto_705904 ) ) ( not ( = ?auto_705902 ?auto_705903 ) ) ( not ( = ?auto_705902 ?auto_705904 ) ) ( not ( = ?auto_705903 ?auto_705904 ) ) ( CLEAR ?auto_705901 ) ( ON ?auto_705902 ?auto_705903 ) ( CLEAR ?auto_705902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_705890 ?auto_705891 ?auto_705892 ?auto_705893 ?auto_705894 ?auto_705895 ?auto_705896 ?auto_705897 ?auto_705898 ?auto_705899 ?auto_705900 ?auto_705901 ?auto_705902 )
      ( MAKE-14PILE ?auto_705890 ?auto_705891 ?auto_705892 ?auto_705893 ?auto_705894 ?auto_705895 ?auto_705896 ?auto_705897 ?auto_705898 ?auto_705899 ?auto_705900 ?auto_705901 ?auto_705902 ?auto_705903 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_705948 - BLOCK
      ?auto_705949 - BLOCK
      ?auto_705950 - BLOCK
      ?auto_705951 - BLOCK
      ?auto_705952 - BLOCK
      ?auto_705953 - BLOCK
      ?auto_705954 - BLOCK
      ?auto_705955 - BLOCK
      ?auto_705956 - BLOCK
      ?auto_705957 - BLOCK
      ?auto_705958 - BLOCK
      ?auto_705959 - BLOCK
      ?auto_705960 - BLOCK
      ?auto_705961 - BLOCK
    )
    :vars
    (
      ?auto_705962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_705961 ?auto_705962 ) ( ON-TABLE ?auto_705948 ) ( ON ?auto_705949 ?auto_705948 ) ( ON ?auto_705950 ?auto_705949 ) ( ON ?auto_705951 ?auto_705950 ) ( ON ?auto_705952 ?auto_705951 ) ( ON ?auto_705953 ?auto_705952 ) ( ON ?auto_705954 ?auto_705953 ) ( ON ?auto_705955 ?auto_705954 ) ( ON ?auto_705956 ?auto_705955 ) ( ON ?auto_705957 ?auto_705956 ) ( ON ?auto_705958 ?auto_705957 ) ( not ( = ?auto_705948 ?auto_705949 ) ) ( not ( = ?auto_705948 ?auto_705950 ) ) ( not ( = ?auto_705948 ?auto_705951 ) ) ( not ( = ?auto_705948 ?auto_705952 ) ) ( not ( = ?auto_705948 ?auto_705953 ) ) ( not ( = ?auto_705948 ?auto_705954 ) ) ( not ( = ?auto_705948 ?auto_705955 ) ) ( not ( = ?auto_705948 ?auto_705956 ) ) ( not ( = ?auto_705948 ?auto_705957 ) ) ( not ( = ?auto_705948 ?auto_705958 ) ) ( not ( = ?auto_705948 ?auto_705959 ) ) ( not ( = ?auto_705948 ?auto_705960 ) ) ( not ( = ?auto_705948 ?auto_705961 ) ) ( not ( = ?auto_705948 ?auto_705962 ) ) ( not ( = ?auto_705949 ?auto_705950 ) ) ( not ( = ?auto_705949 ?auto_705951 ) ) ( not ( = ?auto_705949 ?auto_705952 ) ) ( not ( = ?auto_705949 ?auto_705953 ) ) ( not ( = ?auto_705949 ?auto_705954 ) ) ( not ( = ?auto_705949 ?auto_705955 ) ) ( not ( = ?auto_705949 ?auto_705956 ) ) ( not ( = ?auto_705949 ?auto_705957 ) ) ( not ( = ?auto_705949 ?auto_705958 ) ) ( not ( = ?auto_705949 ?auto_705959 ) ) ( not ( = ?auto_705949 ?auto_705960 ) ) ( not ( = ?auto_705949 ?auto_705961 ) ) ( not ( = ?auto_705949 ?auto_705962 ) ) ( not ( = ?auto_705950 ?auto_705951 ) ) ( not ( = ?auto_705950 ?auto_705952 ) ) ( not ( = ?auto_705950 ?auto_705953 ) ) ( not ( = ?auto_705950 ?auto_705954 ) ) ( not ( = ?auto_705950 ?auto_705955 ) ) ( not ( = ?auto_705950 ?auto_705956 ) ) ( not ( = ?auto_705950 ?auto_705957 ) ) ( not ( = ?auto_705950 ?auto_705958 ) ) ( not ( = ?auto_705950 ?auto_705959 ) ) ( not ( = ?auto_705950 ?auto_705960 ) ) ( not ( = ?auto_705950 ?auto_705961 ) ) ( not ( = ?auto_705950 ?auto_705962 ) ) ( not ( = ?auto_705951 ?auto_705952 ) ) ( not ( = ?auto_705951 ?auto_705953 ) ) ( not ( = ?auto_705951 ?auto_705954 ) ) ( not ( = ?auto_705951 ?auto_705955 ) ) ( not ( = ?auto_705951 ?auto_705956 ) ) ( not ( = ?auto_705951 ?auto_705957 ) ) ( not ( = ?auto_705951 ?auto_705958 ) ) ( not ( = ?auto_705951 ?auto_705959 ) ) ( not ( = ?auto_705951 ?auto_705960 ) ) ( not ( = ?auto_705951 ?auto_705961 ) ) ( not ( = ?auto_705951 ?auto_705962 ) ) ( not ( = ?auto_705952 ?auto_705953 ) ) ( not ( = ?auto_705952 ?auto_705954 ) ) ( not ( = ?auto_705952 ?auto_705955 ) ) ( not ( = ?auto_705952 ?auto_705956 ) ) ( not ( = ?auto_705952 ?auto_705957 ) ) ( not ( = ?auto_705952 ?auto_705958 ) ) ( not ( = ?auto_705952 ?auto_705959 ) ) ( not ( = ?auto_705952 ?auto_705960 ) ) ( not ( = ?auto_705952 ?auto_705961 ) ) ( not ( = ?auto_705952 ?auto_705962 ) ) ( not ( = ?auto_705953 ?auto_705954 ) ) ( not ( = ?auto_705953 ?auto_705955 ) ) ( not ( = ?auto_705953 ?auto_705956 ) ) ( not ( = ?auto_705953 ?auto_705957 ) ) ( not ( = ?auto_705953 ?auto_705958 ) ) ( not ( = ?auto_705953 ?auto_705959 ) ) ( not ( = ?auto_705953 ?auto_705960 ) ) ( not ( = ?auto_705953 ?auto_705961 ) ) ( not ( = ?auto_705953 ?auto_705962 ) ) ( not ( = ?auto_705954 ?auto_705955 ) ) ( not ( = ?auto_705954 ?auto_705956 ) ) ( not ( = ?auto_705954 ?auto_705957 ) ) ( not ( = ?auto_705954 ?auto_705958 ) ) ( not ( = ?auto_705954 ?auto_705959 ) ) ( not ( = ?auto_705954 ?auto_705960 ) ) ( not ( = ?auto_705954 ?auto_705961 ) ) ( not ( = ?auto_705954 ?auto_705962 ) ) ( not ( = ?auto_705955 ?auto_705956 ) ) ( not ( = ?auto_705955 ?auto_705957 ) ) ( not ( = ?auto_705955 ?auto_705958 ) ) ( not ( = ?auto_705955 ?auto_705959 ) ) ( not ( = ?auto_705955 ?auto_705960 ) ) ( not ( = ?auto_705955 ?auto_705961 ) ) ( not ( = ?auto_705955 ?auto_705962 ) ) ( not ( = ?auto_705956 ?auto_705957 ) ) ( not ( = ?auto_705956 ?auto_705958 ) ) ( not ( = ?auto_705956 ?auto_705959 ) ) ( not ( = ?auto_705956 ?auto_705960 ) ) ( not ( = ?auto_705956 ?auto_705961 ) ) ( not ( = ?auto_705956 ?auto_705962 ) ) ( not ( = ?auto_705957 ?auto_705958 ) ) ( not ( = ?auto_705957 ?auto_705959 ) ) ( not ( = ?auto_705957 ?auto_705960 ) ) ( not ( = ?auto_705957 ?auto_705961 ) ) ( not ( = ?auto_705957 ?auto_705962 ) ) ( not ( = ?auto_705958 ?auto_705959 ) ) ( not ( = ?auto_705958 ?auto_705960 ) ) ( not ( = ?auto_705958 ?auto_705961 ) ) ( not ( = ?auto_705958 ?auto_705962 ) ) ( not ( = ?auto_705959 ?auto_705960 ) ) ( not ( = ?auto_705959 ?auto_705961 ) ) ( not ( = ?auto_705959 ?auto_705962 ) ) ( not ( = ?auto_705960 ?auto_705961 ) ) ( not ( = ?auto_705960 ?auto_705962 ) ) ( not ( = ?auto_705961 ?auto_705962 ) ) ( ON ?auto_705960 ?auto_705961 ) ( CLEAR ?auto_705958 ) ( ON ?auto_705959 ?auto_705960 ) ( CLEAR ?auto_705959 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_705948 ?auto_705949 ?auto_705950 ?auto_705951 ?auto_705952 ?auto_705953 ?auto_705954 ?auto_705955 ?auto_705956 ?auto_705957 ?auto_705958 ?auto_705959 )
      ( MAKE-14PILE ?auto_705948 ?auto_705949 ?auto_705950 ?auto_705951 ?auto_705952 ?auto_705953 ?auto_705954 ?auto_705955 ?auto_705956 ?auto_705957 ?auto_705958 ?auto_705959 ?auto_705960 ?auto_705961 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706006 - BLOCK
      ?auto_706007 - BLOCK
      ?auto_706008 - BLOCK
      ?auto_706009 - BLOCK
      ?auto_706010 - BLOCK
      ?auto_706011 - BLOCK
      ?auto_706012 - BLOCK
      ?auto_706013 - BLOCK
      ?auto_706014 - BLOCK
      ?auto_706015 - BLOCK
      ?auto_706016 - BLOCK
      ?auto_706017 - BLOCK
      ?auto_706018 - BLOCK
      ?auto_706019 - BLOCK
    )
    :vars
    (
      ?auto_706020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706019 ?auto_706020 ) ( ON-TABLE ?auto_706006 ) ( ON ?auto_706007 ?auto_706006 ) ( ON ?auto_706008 ?auto_706007 ) ( ON ?auto_706009 ?auto_706008 ) ( ON ?auto_706010 ?auto_706009 ) ( ON ?auto_706011 ?auto_706010 ) ( ON ?auto_706012 ?auto_706011 ) ( ON ?auto_706013 ?auto_706012 ) ( ON ?auto_706014 ?auto_706013 ) ( ON ?auto_706015 ?auto_706014 ) ( not ( = ?auto_706006 ?auto_706007 ) ) ( not ( = ?auto_706006 ?auto_706008 ) ) ( not ( = ?auto_706006 ?auto_706009 ) ) ( not ( = ?auto_706006 ?auto_706010 ) ) ( not ( = ?auto_706006 ?auto_706011 ) ) ( not ( = ?auto_706006 ?auto_706012 ) ) ( not ( = ?auto_706006 ?auto_706013 ) ) ( not ( = ?auto_706006 ?auto_706014 ) ) ( not ( = ?auto_706006 ?auto_706015 ) ) ( not ( = ?auto_706006 ?auto_706016 ) ) ( not ( = ?auto_706006 ?auto_706017 ) ) ( not ( = ?auto_706006 ?auto_706018 ) ) ( not ( = ?auto_706006 ?auto_706019 ) ) ( not ( = ?auto_706006 ?auto_706020 ) ) ( not ( = ?auto_706007 ?auto_706008 ) ) ( not ( = ?auto_706007 ?auto_706009 ) ) ( not ( = ?auto_706007 ?auto_706010 ) ) ( not ( = ?auto_706007 ?auto_706011 ) ) ( not ( = ?auto_706007 ?auto_706012 ) ) ( not ( = ?auto_706007 ?auto_706013 ) ) ( not ( = ?auto_706007 ?auto_706014 ) ) ( not ( = ?auto_706007 ?auto_706015 ) ) ( not ( = ?auto_706007 ?auto_706016 ) ) ( not ( = ?auto_706007 ?auto_706017 ) ) ( not ( = ?auto_706007 ?auto_706018 ) ) ( not ( = ?auto_706007 ?auto_706019 ) ) ( not ( = ?auto_706007 ?auto_706020 ) ) ( not ( = ?auto_706008 ?auto_706009 ) ) ( not ( = ?auto_706008 ?auto_706010 ) ) ( not ( = ?auto_706008 ?auto_706011 ) ) ( not ( = ?auto_706008 ?auto_706012 ) ) ( not ( = ?auto_706008 ?auto_706013 ) ) ( not ( = ?auto_706008 ?auto_706014 ) ) ( not ( = ?auto_706008 ?auto_706015 ) ) ( not ( = ?auto_706008 ?auto_706016 ) ) ( not ( = ?auto_706008 ?auto_706017 ) ) ( not ( = ?auto_706008 ?auto_706018 ) ) ( not ( = ?auto_706008 ?auto_706019 ) ) ( not ( = ?auto_706008 ?auto_706020 ) ) ( not ( = ?auto_706009 ?auto_706010 ) ) ( not ( = ?auto_706009 ?auto_706011 ) ) ( not ( = ?auto_706009 ?auto_706012 ) ) ( not ( = ?auto_706009 ?auto_706013 ) ) ( not ( = ?auto_706009 ?auto_706014 ) ) ( not ( = ?auto_706009 ?auto_706015 ) ) ( not ( = ?auto_706009 ?auto_706016 ) ) ( not ( = ?auto_706009 ?auto_706017 ) ) ( not ( = ?auto_706009 ?auto_706018 ) ) ( not ( = ?auto_706009 ?auto_706019 ) ) ( not ( = ?auto_706009 ?auto_706020 ) ) ( not ( = ?auto_706010 ?auto_706011 ) ) ( not ( = ?auto_706010 ?auto_706012 ) ) ( not ( = ?auto_706010 ?auto_706013 ) ) ( not ( = ?auto_706010 ?auto_706014 ) ) ( not ( = ?auto_706010 ?auto_706015 ) ) ( not ( = ?auto_706010 ?auto_706016 ) ) ( not ( = ?auto_706010 ?auto_706017 ) ) ( not ( = ?auto_706010 ?auto_706018 ) ) ( not ( = ?auto_706010 ?auto_706019 ) ) ( not ( = ?auto_706010 ?auto_706020 ) ) ( not ( = ?auto_706011 ?auto_706012 ) ) ( not ( = ?auto_706011 ?auto_706013 ) ) ( not ( = ?auto_706011 ?auto_706014 ) ) ( not ( = ?auto_706011 ?auto_706015 ) ) ( not ( = ?auto_706011 ?auto_706016 ) ) ( not ( = ?auto_706011 ?auto_706017 ) ) ( not ( = ?auto_706011 ?auto_706018 ) ) ( not ( = ?auto_706011 ?auto_706019 ) ) ( not ( = ?auto_706011 ?auto_706020 ) ) ( not ( = ?auto_706012 ?auto_706013 ) ) ( not ( = ?auto_706012 ?auto_706014 ) ) ( not ( = ?auto_706012 ?auto_706015 ) ) ( not ( = ?auto_706012 ?auto_706016 ) ) ( not ( = ?auto_706012 ?auto_706017 ) ) ( not ( = ?auto_706012 ?auto_706018 ) ) ( not ( = ?auto_706012 ?auto_706019 ) ) ( not ( = ?auto_706012 ?auto_706020 ) ) ( not ( = ?auto_706013 ?auto_706014 ) ) ( not ( = ?auto_706013 ?auto_706015 ) ) ( not ( = ?auto_706013 ?auto_706016 ) ) ( not ( = ?auto_706013 ?auto_706017 ) ) ( not ( = ?auto_706013 ?auto_706018 ) ) ( not ( = ?auto_706013 ?auto_706019 ) ) ( not ( = ?auto_706013 ?auto_706020 ) ) ( not ( = ?auto_706014 ?auto_706015 ) ) ( not ( = ?auto_706014 ?auto_706016 ) ) ( not ( = ?auto_706014 ?auto_706017 ) ) ( not ( = ?auto_706014 ?auto_706018 ) ) ( not ( = ?auto_706014 ?auto_706019 ) ) ( not ( = ?auto_706014 ?auto_706020 ) ) ( not ( = ?auto_706015 ?auto_706016 ) ) ( not ( = ?auto_706015 ?auto_706017 ) ) ( not ( = ?auto_706015 ?auto_706018 ) ) ( not ( = ?auto_706015 ?auto_706019 ) ) ( not ( = ?auto_706015 ?auto_706020 ) ) ( not ( = ?auto_706016 ?auto_706017 ) ) ( not ( = ?auto_706016 ?auto_706018 ) ) ( not ( = ?auto_706016 ?auto_706019 ) ) ( not ( = ?auto_706016 ?auto_706020 ) ) ( not ( = ?auto_706017 ?auto_706018 ) ) ( not ( = ?auto_706017 ?auto_706019 ) ) ( not ( = ?auto_706017 ?auto_706020 ) ) ( not ( = ?auto_706018 ?auto_706019 ) ) ( not ( = ?auto_706018 ?auto_706020 ) ) ( not ( = ?auto_706019 ?auto_706020 ) ) ( ON ?auto_706018 ?auto_706019 ) ( ON ?auto_706017 ?auto_706018 ) ( CLEAR ?auto_706015 ) ( ON ?auto_706016 ?auto_706017 ) ( CLEAR ?auto_706016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_706006 ?auto_706007 ?auto_706008 ?auto_706009 ?auto_706010 ?auto_706011 ?auto_706012 ?auto_706013 ?auto_706014 ?auto_706015 ?auto_706016 )
      ( MAKE-14PILE ?auto_706006 ?auto_706007 ?auto_706008 ?auto_706009 ?auto_706010 ?auto_706011 ?auto_706012 ?auto_706013 ?auto_706014 ?auto_706015 ?auto_706016 ?auto_706017 ?auto_706018 ?auto_706019 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706064 - BLOCK
      ?auto_706065 - BLOCK
      ?auto_706066 - BLOCK
      ?auto_706067 - BLOCK
      ?auto_706068 - BLOCK
      ?auto_706069 - BLOCK
      ?auto_706070 - BLOCK
      ?auto_706071 - BLOCK
      ?auto_706072 - BLOCK
      ?auto_706073 - BLOCK
      ?auto_706074 - BLOCK
      ?auto_706075 - BLOCK
      ?auto_706076 - BLOCK
      ?auto_706077 - BLOCK
    )
    :vars
    (
      ?auto_706078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706077 ?auto_706078 ) ( ON-TABLE ?auto_706064 ) ( ON ?auto_706065 ?auto_706064 ) ( ON ?auto_706066 ?auto_706065 ) ( ON ?auto_706067 ?auto_706066 ) ( ON ?auto_706068 ?auto_706067 ) ( ON ?auto_706069 ?auto_706068 ) ( ON ?auto_706070 ?auto_706069 ) ( ON ?auto_706071 ?auto_706070 ) ( ON ?auto_706072 ?auto_706071 ) ( not ( = ?auto_706064 ?auto_706065 ) ) ( not ( = ?auto_706064 ?auto_706066 ) ) ( not ( = ?auto_706064 ?auto_706067 ) ) ( not ( = ?auto_706064 ?auto_706068 ) ) ( not ( = ?auto_706064 ?auto_706069 ) ) ( not ( = ?auto_706064 ?auto_706070 ) ) ( not ( = ?auto_706064 ?auto_706071 ) ) ( not ( = ?auto_706064 ?auto_706072 ) ) ( not ( = ?auto_706064 ?auto_706073 ) ) ( not ( = ?auto_706064 ?auto_706074 ) ) ( not ( = ?auto_706064 ?auto_706075 ) ) ( not ( = ?auto_706064 ?auto_706076 ) ) ( not ( = ?auto_706064 ?auto_706077 ) ) ( not ( = ?auto_706064 ?auto_706078 ) ) ( not ( = ?auto_706065 ?auto_706066 ) ) ( not ( = ?auto_706065 ?auto_706067 ) ) ( not ( = ?auto_706065 ?auto_706068 ) ) ( not ( = ?auto_706065 ?auto_706069 ) ) ( not ( = ?auto_706065 ?auto_706070 ) ) ( not ( = ?auto_706065 ?auto_706071 ) ) ( not ( = ?auto_706065 ?auto_706072 ) ) ( not ( = ?auto_706065 ?auto_706073 ) ) ( not ( = ?auto_706065 ?auto_706074 ) ) ( not ( = ?auto_706065 ?auto_706075 ) ) ( not ( = ?auto_706065 ?auto_706076 ) ) ( not ( = ?auto_706065 ?auto_706077 ) ) ( not ( = ?auto_706065 ?auto_706078 ) ) ( not ( = ?auto_706066 ?auto_706067 ) ) ( not ( = ?auto_706066 ?auto_706068 ) ) ( not ( = ?auto_706066 ?auto_706069 ) ) ( not ( = ?auto_706066 ?auto_706070 ) ) ( not ( = ?auto_706066 ?auto_706071 ) ) ( not ( = ?auto_706066 ?auto_706072 ) ) ( not ( = ?auto_706066 ?auto_706073 ) ) ( not ( = ?auto_706066 ?auto_706074 ) ) ( not ( = ?auto_706066 ?auto_706075 ) ) ( not ( = ?auto_706066 ?auto_706076 ) ) ( not ( = ?auto_706066 ?auto_706077 ) ) ( not ( = ?auto_706066 ?auto_706078 ) ) ( not ( = ?auto_706067 ?auto_706068 ) ) ( not ( = ?auto_706067 ?auto_706069 ) ) ( not ( = ?auto_706067 ?auto_706070 ) ) ( not ( = ?auto_706067 ?auto_706071 ) ) ( not ( = ?auto_706067 ?auto_706072 ) ) ( not ( = ?auto_706067 ?auto_706073 ) ) ( not ( = ?auto_706067 ?auto_706074 ) ) ( not ( = ?auto_706067 ?auto_706075 ) ) ( not ( = ?auto_706067 ?auto_706076 ) ) ( not ( = ?auto_706067 ?auto_706077 ) ) ( not ( = ?auto_706067 ?auto_706078 ) ) ( not ( = ?auto_706068 ?auto_706069 ) ) ( not ( = ?auto_706068 ?auto_706070 ) ) ( not ( = ?auto_706068 ?auto_706071 ) ) ( not ( = ?auto_706068 ?auto_706072 ) ) ( not ( = ?auto_706068 ?auto_706073 ) ) ( not ( = ?auto_706068 ?auto_706074 ) ) ( not ( = ?auto_706068 ?auto_706075 ) ) ( not ( = ?auto_706068 ?auto_706076 ) ) ( not ( = ?auto_706068 ?auto_706077 ) ) ( not ( = ?auto_706068 ?auto_706078 ) ) ( not ( = ?auto_706069 ?auto_706070 ) ) ( not ( = ?auto_706069 ?auto_706071 ) ) ( not ( = ?auto_706069 ?auto_706072 ) ) ( not ( = ?auto_706069 ?auto_706073 ) ) ( not ( = ?auto_706069 ?auto_706074 ) ) ( not ( = ?auto_706069 ?auto_706075 ) ) ( not ( = ?auto_706069 ?auto_706076 ) ) ( not ( = ?auto_706069 ?auto_706077 ) ) ( not ( = ?auto_706069 ?auto_706078 ) ) ( not ( = ?auto_706070 ?auto_706071 ) ) ( not ( = ?auto_706070 ?auto_706072 ) ) ( not ( = ?auto_706070 ?auto_706073 ) ) ( not ( = ?auto_706070 ?auto_706074 ) ) ( not ( = ?auto_706070 ?auto_706075 ) ) ( not ( = ?auto_706070 ?auto_706076 ) ) ( not ( = ?auto_706070 ?auto_706077 ) ) ( not ( = ?auto_706070 ?auto_706078 ) ) ( not ( = ?auto_706071 ?auto_706072 ) ) ( not ( = ?auto_706071 ?auto_706073 ) ) ( not ( = ?auto_706071 ?auto_706074 ) ) ( not ( = ?auto_706071 ?auto_706075 ) ) ( not ( = ?auto_706071 ?auto_706076 ) ) ( not ( = ?auto_706071 ?auto_706077 ) ) ( not ( = ?auto_706071 ?auto_706078 ) ) ( not ( = ?auto_706072 ?auto_706073 ) ) ( not ( = ?auto_706072 ?auto_706074 ) ) ( not ( = ?auto_706072 ?auto_706075 ) ) ( not ( = ?auto_706072 ?auto_706076 ) ) ( not ( = ?auto_706072 ?auto_706077 ) ) ( not ( = ?auto_706072 ?auto_706078 ) ) ( not ( = ?auto_706073 ?auto_706074 ) ) ( not ( = ?auto_706073 ?auto_706075 ) ) ( not ( = ?auto_706073 ?auto_706076 ) ) ( not ( = ?auto_706073 ?auto_706077 ) ) ( not ( = ?auto_706073 ?auto_706078 ) ) ( not ( = ?auto_706074 ?auto_706075 ) ) ( not ( = ?auto_706074 ?auto_706076 ) ) ( not ( = ?auto_706074 ?auto_706077 ) ) ( not ( = ?auto_706074 ?auto_706078 ) ) ( not ( = ?auto_706075 ?auto_706076 ) ) ( not ( = ?auto_706075 ?auto_706077 ) ) ( not ( = ?auto_706075 ?auto_706078 ) ) ( not ( = ?auto_706076 ?auto_706077 ) ) ( not ( = ?auto_706076 ?auto_706078 ) ) ( not ( = ?auto_706077 ?auto_706078 ) ) ( ON ?auto_706076 ?auto_706077 ) ( ON ?auto_706075 ?auto_706076 ) ( ON ?auto_706074 ?auto_706075 ) ( CLEAR ?auto_706072 ) ( ON ?auto_706073 ?auto_706074 ) ( CLEAR ?auto_706073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_706064 ?auto_706065 ?auto_706066 ?auto_706067 ?auto_706068 ?auto_706069 ?auto_706070 ?auto_706071 ?auto_706072 ?auto_706073 )
      ( MAKE-14PILE ?auto_706064 ?auto_706065 ?auto_706066 ?auto_706067 ?auto_706068 ?auto_706069 ?auto_706070 ?auto_706071 ?auto_706072 ?auto_706073 ?auto_706074 ?auto_706075 ?auto_706076 ?auto_706077 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706122 - BLOCK
      ?auto_706123 - BLOCK
      ?auto_706124 - BLOCK
      ?auto_706125 - BLOCK
      ?auto_706126 - BLOCK
      ?auto_706127 - BLOCK
      ?auto_706128 - BLOCK
      ?auto_706129 - BLOCK
      ?auto_706130 - BLOCK
      ?auto_706131 - BLOCK
      ?auto_706132 - BLOCK
      ?auto_706133 - BLOCK
      ?auto_706134 - BLOCK
      ?auto_706135 - BLOCK
    )
    :vars
    (
      ?auto_706136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706135 ?auto_706136 ) ( ON-TABLE ?auto_706122 ) ( ON ?auto_706123 ?auto_706122 ) ( ON ?auto_706124 ?auto_706123 ) ( ON ?auto_706125 ?auto_706124 ) ( ON ?auto_706126 ?auto_706125 ) ( ON ?auto_706127 ?auto_706126 ) ( ON ?auto_706128 ?auto_706127 ) ( ON ?auto_706129 ?auto_706128 ) ( not ( = ?auto_706122 ?auto_706123 ) ) ( not ( = ?auto_706122 ?auto_706124 ) ) ( not ( = ?auto_706122 ?auto_706125 ) ) ( not ( = ?auto_706122 ?auto_706126 ) ) ( not ( = ?auto_706122 ?auto_706127 ) ) ( not ( = ?auto_706122 ?auto_706128 ) ) ( not ( = ?auto_706122 ?auto_706129 ) ) ( not ( = ?auto_706122 ?auto_706130 ) ) ( not ( = ?auto_706122 ?auto_706131 ) ) ( not ( = ?auto_706122 ?auto_706132 ) ) ( not ( = ?auto_706122 ?auto_706133 ) ) ( not ( = ?auto_706122 ?auto_706134 ) ) ( not ( = ?auto_706122 ?auto_706135 ) ) ( not ( = ?auto_706122 ?auto_706136 ) ) ( not ( = ?auto_706123 ?auto_706124 ) ) ( not ( = ?auto_706123 ?auto_706125 ) ) ( not ( = ?auto_706123 ?auto_706126 ) ) ( not ( = ?auto_706123 ?auto_706127 ) ) ( not ( = ?auto_706123 ?auto_706128 ) ) ( not ( = ?auto_706123 ?auto_706129 ) ) ( not ( = ?auto_706123 ?auto_706130 ) ) ( not ( = ?auto_706123 ?auto_706131 ) ) ( not ( = ?auto_706123 ?auto_706132 ) ) ( not ( = ?auto_706123 ?auto_706133 ) ) ( not ( = ?auto_706123 ?auto_706134 ) ) ( not ( = ?auto_706123 ?auto_706135 ) ) ( not ( = ?auto_706123 ?auto_706136 ) ) ( not ( = ?auto_706124 ?auto_706125 ) ) ( not ( = ?auto_706124 ?auto_706126 ) ) ( not ( = ?auto_706124 ?auto_706127 ) ) ( not ( = ?auto_706124 ?auto_706128 ) ) ( not ( = ?auto_706124 ?auto_706129 ) ) ( not ( = ?auto_706124 ?auto_706130 ) ) ( not ( = ?auto_706124 ?auto_706131 ) ) ( not ( = ?auto_706124 ?auto_706132 ) ) ( not ( = ?auto_706124 ?auto_706133 ) ) ( not ( = ?auto_706124 ?auto_706134 ) ) ( not ( = ?auto_706124 ?auto_706135 ) ) ( not ( = ?auto_706124 ?auto_706136 ) ) ( not ( = ?auto_706125 ?auto_706126 ) ) ( not ( = ?auto_706125 ?auto_706127 ) ) ( not ( = ?auto_706125 ?auto_706128 ) ) ( not ( = ?auto_706125 ?auto_706129 ) ) ( not ( = ?auto_706125 ?auto_706130 ) ) ( not ( = ?auto_706125 ?auto_706131 ) ) ( not ( = ?auto_706125 ?auto_706132 ) ) ( not ( = ?auto_706125 ?auto_706133 ) ) ( not ( = ?auto_706125 ?auto_706134 ) ) ( not ( = ?auto_706125 ?auto_706135 ) ) ( not ( = ?auto_706125 ?auto_706136 ) ) ( not ( = ?auto_706126 ?auto_706127 ) ) ( not ( = ?auto_706126 ?auto_706128 ) ) ( not ( = ?auto_706126 ?auto_706129 ) ) ( not ( = ?auto_706126 ?auto_706130 ) ) ( not ( = ?auto_706126 ?auto_706131 ) ) ( not ( = ?auto_706126 ?auto_706132 ) ) ( not ( = ?auto_706126 ?auto_706133 ) ) ( not ( = ?auto_706126 ?auto_706134 ) ) ( not ( = ?auto_706126 ?auto_706135 ) ) ( not ( = ?auto_706126 ?auto_706136 ) ) ( not ( = ?auto_706127 ?auto_706128 ) ) ( not ( = ?auto_706127 ?auto_706129 ) ) ( not ( = ?auto_706127 ?auto_706130 ) ) ( not ( = ?auto_706127 ?auto_706131 ) ) ( not ( = ?auto_706127 ?auto_706132 ) ) ( not ( = ?auto_706127 ?auto_706133 ) ) ( not ( = ?auto_706127 ?auto_706134 ) ) ( not ( = ?auto_706127 ?auto_706135 ) ) ( not ( = ?auto_706127 ?auto_706136 ) ) ( not ( = ?auto_706128 ?auto_706129 ) ) ( not ( = ?auto_706128 ?auto_706130 ) ) ( not ( = ?auto_706128 ?auto_706131 ) ) ( not ( = ?auto_706128 ?auto_706132 ) ) ( not ( = ?auto_706128 ?auto_706133 ) ) ( not ( = ?auto_706128 ?auto_706134 ) ) ( not ( = ?auto_706128 ?auto_706135 ) ) ( not ( = ?auto_706128 ?auto_706136 ) ) ( not ( = ?auto_706129 ?auto_706130 ) ) ( not ( = ?auto_706129 ?auto_706131 ) ) ( not ( = ?auto_706129 ?auto_706132 ) ) ( not ( = ?auto_706129 ?auto_706133 ) ) ( not ( = ?auto_706129 ?auto_706134 ) ) ( not ( = ?auto_706129 ?auto_706135 ) ) ( not ( = ?auto_706129 ?auto_706136 ) ) ( not ( = ?auto_706130 ?auto_706131 ) ) ( not ( = ?auto_706130 ?auto_706132 ) ) ( not ( = ?auto_706130 ?auto_706133 ) ) ( not ( = ?auto_706130 ?auto_706134 ) ) ( not ( = ?auto_706130 ?auto_706135 ) ) ( not ( = ?auto_706130 ?auto_706136 ) ) ( not ( = ?auto_706131 ?auto_706132 ) ) ( not ( = ?auto_706131 ?auto_706133 ) ) ( not ( = ?auto_706131 ?auto_706134 ) ) ( not ( = ?auto_706131 ?auto_706135 ) ) ( not ( = ?auto_706131 ?auto_706136 ) ) ( not ( = ?auto_706132 ?auto_706133 ) ) ( not ( = ?auto_706132 ?auto_706134 ) ) ( not ( = ?auto_706132 ?auto_706135 ) ) ( not ( = ?auto_706132 ?auto_706136 ) ) ( not ( = ?auto_706133 ?auto_706134 ) ) ( not ( = ?auto_706133 ?auto_706135 ) ) ( not ( = ?auto_706133 ?auto_706136 ) ) ( not ( = ?auto_706134 ?auto_706135 ) ) ( not ( = ?auto_706134 ?auto_706136 ) ) ( not ( = ?auto_706135 ?auto_706136 ) ) ( ON ?auto_706134 ?auto_706135 ) ( ON ?auto_706133 ?auto_706134 ) ( ON ?auto_706132 ?auto_706133 ) ( ON ?auto_706131 ?auto_706132 ) ( CLEAR ?auto_706129 ) ( ON ?auto_706130 ?auto_706131 ) ( CLEAR ?auto_706130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_706122 ?auto_706123 ?auto_706124 ?auto_706125 ?auto_706126 ?auto_706127 ?auto_706128 ?auto_706129 ?auto_706130 )
      ( MAKE-14PILE ?auto_706122 ?auto_706123 ?auto_706124 ?auto_706125 ?auto_706126 ?auto_706127 ?auto_706128 ?auto_706129 ?auto_706130 ?auto_706131 ?auto_706132 ?auto_706133 ?auto_706134 ?auto_706135 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706180 - BLOCK
      ?auto_706181 - BLOCK
      ?auto_706182 - BLOCK
      ?auto_706183 - BLOCK
      ?auto_706184 - BLOCK
      ?auto_706185 - BLOCK
      ?auto_706186 - BLOCK
      ?auto_706187 - BLOCK
      ?auto_706188 - BLOCK
      ?auto_706189 - BLOCK
      ?auto_706190 - BLOCK
      ?auto_706191 - BLOCK
      ?auto_706192 - BLOCK
      ?auto_706193 - BLOCK
    )
    :vars
    (
      ?auto_706194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706193 ?auto_706194 ) ( ON-TABLE ?auto_706180 ) ( ON ?auto_706181 ?auto_706180 ) ( ON ?auto_706182 ?auto_706181 ) ( ON ?auto_706183 ?auto_706182 ) ( ON ?auto_706184 ?auto_706183 ) ( ON ?auto_706185 ?auto_706184 ) ( ON ?auto_706186 ?auto_706185 ) ( not ( = ?auto_706180 ?auto_706181 ) ) ( not ( = ?auto_706180 ?auto_706182 ) ) ( not ( = ?auto_706180 ?auto_706183 ) ) ( not ( = ?auto_706180 ?auto_706184 ) ) ( not ( = ?auto_706180 ?auto_706185 ) ) ( not ( = ?auto_706180 ?auto_706186 ) ) ( not ( = ?auto_706180 ?auto_706187 ) ) ( not ( = ?auto_706180 ?auto_706188 ) ) ( not ( = ?auto_706180 ?auto_706189 ) ) ( not ( = ?auto_706180 ?auto_706190 ) ) ( not ( = ?auto_706180 ?auto_706191 ) ) ( not ( = ?auto_706180 ?auto_706192 ) ) ( not ( = ?auto_706180 ?auto_706193 ) ) ( not ( = ?auto_706180 ?auto_706194 ) ) ( not ( = ?auto_706181 ?auto_706182 ) ) ( not ( = ?auto_706181 ?auto_706183 ) ) ( not ( = ?auto_706181 ?auto_706184 ) ) ( not ( = ?auto_706181 ?auto_706185 ) ) ( not ( = ?auto_706181 ?auto_706186 ) ) ( not ( = ?auto_706181 ?auto_706187 ) ) ( not ( = ?auto_706181 ?auto_706188 ) ) ( not ( = ?auto_706181 ?auto_706189 ) ) ( not ( = ?auto_706181 ?auto_706190 ) ) ( not ( = ?auto_706181 ?auto_706191 ) ) ( not ( = ?auto_706181 ?auto_706192 ) ) ( not ( = ?auto_706181 ?auto_706193 ) ) ( not ( = ?auto_706181 ?auto_706194 ) ) ( not ( = ?auto_706182 ?auto_706183 ) ) ( not ( = ?auto_706182 ?auto_706184 ) ) ( not ( = ?auto_706182 ?auto_706185 ) ) ( not ( = ?auto_706182 ?auto_706186 ) ) ( not ( = ?auto_706182 ?auto_706187 ) ) ( not ( = ?auto_706182 ?auto_706188 ) ) ( not ( = ?auto_706182 ?auto_706189 ) ) ( not ( = ?auto_706182 ?auto_706190 ) ) ( not ( = ?auto_706182 ?auto_706191 ) ) ( not ( = ?auto_706182 ?auto_706192 ) ) ( not ( = ?auto_706182 ?auto_706193 ) ) ( not ( = ?auto_706182 ?auto_706194 ) ) ( not ( = ?auto_706183 ?auto_706184 ) ) ( not ( = ?auto_706183 ?auto_706185 ) ) ( not ( = ?auto_706183 ?auto_706186 ) ) ( not ( = ?auto_706183 ?auto_706187 ) ) ( not ( = ?auto_706183 ?auto_706188 ) ) ( not ( = ?auto_706183 ?auto_706189 ) ) ( not ( = ?auto_706183 ?auto_706190 ) ) ( not ( = ?auto_706183 ?auto_706191 ) ) ( not ( = ?auto_706183 ?auto_706192 ) ) ( not ( = ?auto_706183 ?auto_706193 ) ) ( not ( = ?auto_706183 ?auto_706194 ) ) ( not ( = ?auto_706184 ?auto_706185 ) ) ( not ( = ?auto_706184 ?auto_706186 ) ) ( not ( = ?auto_706184 ?auto_706187 ) ) ( not ( = ?auto_706184 ?auto_706188 ) ) ( not ( = ?auto_706184 ?auto_706189 ) ) ( not ( = ?auto_706184 ?auto_706190 ) ) ( not ( = ?auto_706184 ?auto_706191 ) ) ( not ( = ?auto_706184 ?auto_706192 ) ) ( not ( = ?auto_706184 ?auto_706193 ) ) ( not ( = ?auto_706184 ?auto_706194 ) ) ( not ( = ?auto_706185 ?auto_706186 ) ) ( not ( = ?auto_706185 ?auto_706187 ) ) ( not ( = ?auto_706185 ?auto_706188 ) ) ( not ( = ?auto_706185 ?auto_706189 ) ) ( not ( = ?auto_706185 ?auto_706190 ) ) ( not ( = ?auto_706185 ?auto_706191 ) ) ( not ( = ?auto_706185 ?auto_706192 ) ) ( not ( = ?auto_706185 ?auto_706193 ) ) ( not ( = ?auto_706185 ?auto_706194 ) ) ( not ( = ?auto_706186 ?auto_706187 ) ) ( not ( = ?auto_706186 ?auto_706188 ) ) ( not ( = ?auto_706186 ?auto_706189 ) ) ( not ( = ?auto_706186 ?auto_706190 ) ) ( not ( = ?auto_706186 ?auto_706191 ) ) ( not ( = ?auto_706186 ?auto_706192 ) ) ( not ( = ?auto_706186 ?auto_706193 ) ) ( not ( = ?auto_706186 ?auto_706194 ) ) ( not ( = ?auto_706187 ?auto_706188 ) ) ( not ( = ?auto_706187 ?auto_706189 ) ) ( not ( = ?auto_706187 ?auto_706190 ) ) ( not ( = ?auto_706187 ?auto_706191 ) ) ( not ( = ?auto_706187 ?auto_706192 ) ) ( not ( = ?auto_706187 ?auto_706193 ) ) ( not ( = ?auto_706187 ?auto_706194 ) ) ( not ( = ?auto_706188 ?auto_706189 ) ) ( not ( = ?auto_706188 ?auto_706190 ) ) ( not ( = ?auto_706188 ?auto_706191 ) ) ( not ( = ?auto_706188 ?auto_706192 ) ) ( not ( = ?auto_706188 ?auto_706193 ) ) ( not ( = ?auto_706188 ?auto_706194 ) ) ( not ( = ?auto_706189 ?auto_706190 ) ) ( not ( = ?auto_706189 ?auto_706191 ) ) ( not ( = ?auto_706189 ?auto_706192 ) ) ( not ( = ?auto_706189 ?auto_706193 ) ) ( not ( = ?auto_706189 ?auto_706194 ) ) ( not ( = ?auto_706190 ?auto_706191 ) ) ( not ( = ?auto_706190 ?auto_706192 ) ) ( not ( = ?auto_706190 ?auto_706193 ) ) ( not ( = ?auto_706190 ?auto_706194 ) ) ( not ( = ?auto_706191 ?auto_706192 ) ) ( not ( = ?auto_706191 ?auto_706193 ) ) ( not ( = ?auto_706191 ?auto_706194 ) ) ( not ( = ?auto_706192 ?auto_706193 ) ) ( not ( = ?auto_706192 ?auto_706194 ) ) ( not ( = ?auto_706193 ?auto_706194 ) ) ( ON ?auto_706192 ?auto_706193 ) ( ON ?auto_706191 ?auto_706192 ) ( ON ?auto_706190 ?auto_706191 ) ( ON ?auto_706189 ?auto_706190 ) ( ON ?auto_706188 ?auto_706189 ) ( CLEAR ?auto_706186 ) ( ON ?auto_706187 ?auto_706188 ) ( CLEAR ?auto_706187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_706180 ?auto_706181 ?auto_706182 ?auto_706183 ?auto_706184 ?auto_706185 ?auto_706186 ?auto_706187 )
      ( MAKE-14PILE ?auto_706180 ?auto_706181 ?auto_706182 ?auto_706183 ?auto_706184 ?auto_706185 ?auto_706186 ?auto_706187 ?auto_706188 ?auto_706189 ?auto_706190 ?auto_706191 ?auto_706192 ?auto_706193 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706238 - BLOCK
      ?auto_706239 - BLOCK
      ?auto_706240 - BLOCK
      ?auto_706241 - BLOCK
      ?auto_706242 - BLOCK
      ?auto_706243 - BLOCK
      ?auto_706244 - BLOCK
      ?auto_706245 - BLOCK
      ?auto_706246 - BLOCK
      ?auto_706247 - BLOCK
      ?auto_706248 - BLOCK
      ?auto_706249 - BLOCK
      ?auto_706250 - BLOCK
      ?auto_706251 - BLOCK
    )
    :vars
    (
      ?auto_706252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706251 ?auto_706252 ) ( ON-TABLE ?auto_706238 ) ( ON ?auto_706239 ?auto_706238 ) ( ON ?auto_706240 ?auto_706239 ) ( ON ?auto_706241 ?auto_706240 ) ( ON ?auto_706242 ?auto_706241 ) ( ON ?auto_706243 ?auto_706242 ) ( not ( = ?auto_706238 ?auto_706239 ) ) ( not ( = ?auto_706238 ?auto_706240 ) ) ( not ( = ?auto_706238 ?auto_706241 ) ) ( not ( = ?auto_706238 ?auto_706242 ) ) ( not ( = ?auto_706238 ?auto_706243 ) ) ( not ( = ?auto_706238 ?auto_706244 ) ) ( not ( = ?auto_706238 ?auto_706245 ) ) ( not ( = ?auto_706238 ?auto_706246 ) ) ( not ( = ?auto_706238 ?auto_706247 ) ) ( not ( = ?auto_706238 ?auto_706248 ) ) ( not ( = ?auto_706238 ?auto_706249 ) ) ( not ( = ?auto_706238 ?auto_706250 ) ) ( not ( = ?auto_706238 ?auto_706251 ) ) ( not ( = ?auto_706238 ?auto_706252 ) ) ( not ( = ?auto_706239 ?auto_706240 ) ) ( not ( = ?auto_706239 ?auto_706241 ) ) ( not ( = ?auto_706239 ?auto_706242 ) ) ( not ( = ?auto_706239 ?auto_706243 ) ) ( not ( = ?auto_706239 ?auto_706244 ) ) ( not ( = ?auto_706239 ?auto_706245 ) ) ( not ( = ?auto_706239 ?auto_706246 ) ) ( not ( = ?auto_706239 ?auto_706247 ) ) ( not ( = ?auto_706239 ?auto_706248 ) ) ( not ( = ?auto_706239 ?auto_706249 ) ) ( not ( = ?auto_706239 ?auto_706250 ) ) ( not ( = ?auto_706239 ?auto_706251 ) ) ( not ( = ?auto_706239 ?auto_706252 ) ) ( not ( = ?auto_706240 ?auto_706241 ) ) ( not ( = ?auto_706240 ?auto_706242 ) ) ( not ( = ?auto_706240 ?auto_706243 ) ) ( not ( = ?auto_706240 ?auto_706244 ) ) ( not ( = ?auto_706240 ?auto_706245 ) ) ( not ( = ?auto_706240 ?auto_706246 ) ) ( not ( = ?auto_706240 ?auto_706247 ) ) ( not ( = ?auto_706240 ?auto_706248 ) ) ( not ( = ?auto_706240 ?auto_706249 ) ) ( not ( = ?auto_706240 ?auto_706250 ) ) ( not ( = ?auto_706240 ?auto_706251 ) ) ( not ( = ?auto_706240 ?auto_706252 ) ) ( not ( = ?auto_706241 ?auto_706242 ) ) ( not ( = ?auto_706241 ?auto_706243 ) ) ( not ( = ?auto_706241 ?auto_706244 ) ) ( not ( = ?auto_706241 ?auto_706245 ) ) ( not ( = ?auto_706241 ?auto_706246 ) ) ( not ( = ?auto_706241 ?auto_706247 ) ) ( not ( = ?auto_706241 ?auto_706248 ) ) ( not ( = ?auto_706241 ?auto_706249 ) ) ( not ( = ?auto_706241 ?auto_706250 ) ) ( not ( = ?auto_706241 ?auto_706251 ) ) ( not ( = ?auto_706241 ?auto_706252 ) ) ( not ( = ?auto_706242 ?auto_706243 ) ) ( not ( = ?auto_706242 ?auto_706244 ) ) ( not ( = ?auto_706242 ?auto_706245 ) ) ( not ( = ?auto_706242 ?auto_706246 ) ) ( not ( = ?auto_706242 ?auto_706247 ) ) ( not ( = ?auto_706242 ?auto_706248 ) ) ( not ( = ?auto_706242 ?auto_706249 ) ) ( not ( = ?auto_706242 ?auto_706250 ) ) ( not ( = ?auto_706242 ?auto_706251 ) ) ( not ( = ?auto_706242 ?auto_706252 ) ) ( not ( = ?auto_706243 ?auto_706244 ) ) ( not ( = ?auto_706243 ?auto_706245 ) ) ( not ( = ?auto_706243 ?auto_706246 ) ) ( not ( = ?auto_706243 ?auto_706247 ) ) ( not ( = ?auto_706243 ?auto_706248 ) ) ( not ( = ?auto_706243 ?auto_706249 ) ) ( not ( = ?auto_706243 ?auto_706250 ) ) ( not ( = ?auto_706243 ?auto_706251 ) ) ( not ( = ?auto_706243 ?auto_706252 ) ) ( not ( = ?auto_706244 ?auto_706245 ) ) ( not ( = ?auto_706244 ?auto_706246 ) ) ( not ( = ?auto_706244 ?auto_706247 ) ) ( not ( = ?auto_706244 ?auto_706248 ) ) ( not ( = ?auto_706244 ?auto_706249 ) ) ( not ( = ?auto_706244 ?auto_706250 ) ) ( not ( = ?auto_706244 ?auto_706251 ) ) ( not ( = ?auto_706244 ?auto_706252 ) ) ( not ( = ?auto_706245 ?auto_706246 ) ) ( not ( = ?auto_706245 ?auto_706247 ) ) ( not ( = ?auto_706245 ?auto_706248 ) ) ( not ( = ?auto_706245 ?auto_706249 ) ) ( not ( = ?auto_706245 ?auto_706250 ) ) ( not ( = ?auto_706245 ?auto_706251 ) ) ( not ( = ?auto_706245 ?auto_706252 ) ) ( not ( = ?auto_706246 ?auto_706247 ) ) ( not ( = ?auto_706246 ?auto_706248 ) ) ( not ( = ?auto_706246 ?auto_706249 ) ) ( not ( = ?auto_706246 ?auto_706250 ) ) ( not ( = ?auto_706246 ?auto_706251 ) ) ( not ( = ?auto_706246 ?auto_706252 ) ) ( not ( = ?auto_706247 ?auto_706248 ) ) ( not ( = ?auto_706247 ?auto_706249 ) ) ( not ( = ?auto_706247 ?auto_706250 ) ) ( not ( = ?auto_706247 ?auto_706251 ) ) ( not ( = ?auto_706247 ?auto_706252 ) ) ( not ( = ?auto_706248 ?auto_706249 ) ) ( not ( = ?auto_706248 ?auto_706250 ) ) ( not ( = ?auto_706248 ?auto_706251 ) ) ( not ( = ?auto_706248 ?auto_706252 ) ) ( not ( = ?auto_706249 ?auto_706250 ) ) ( not ( = ?auto_706249 ?auto_706251 ) ) ( not ( = ?auto_706249 ?auto_706252 ) ) ( not ( = ?auto_706250 ?auto_706251 ) ) ( not ( = ?auto_706250 ?auto_706252 ) ) ( not ( = ?auto_706251 ?auto_706252 ) ) ( ON ?auto_706250 ?auto_706251 ) ( ON ?auto_706249 ?auto_706250 ) ( ON ?auto_706248 ?auto_706249 ) ( ON ?auto_706247 ?auto_706248 ) ( ON ?auto_706246 ?auto_706247 ) ( ON ?auto_706245 ?auto_706246 ) ( CLEAR ?auto_706243 ) ( ON ?auto_706244 ?auto_706245 ) ( CLEAR ?auto_706244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_706238 ?auto_706239 ?auto_706240 ?auto_706241 ?auto_706242 ?auto_706243 ?auto_706244 )
      ( MAKE-14PILE ?auto_706238 ?auto_706239 ?auto_706240 ?auto_706241 ?auto_706242 ?auto_706243 ?auto_706244 ?auto_706245 ?auto_706246 ?auto_706247 ?auto_706248 ?auto_706249 ?auto_706250 ?auto_706251 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706296 - BLOCK
      ?auto_706297 - BLOCK
      ?auto_706298 - BLOCK
      ?auto_706299 - BLOCK
      ?auto_706300 - BLOCK
      ?auto_706301 - BLOCK
      ?auto_706302 - BLOCK
      ?auto_706303 - BLOCK
      ?auto_706304 - BLOCK
      ?auto_706305 - BLOCK
      ?auto_706306 - BLOCK
      ?auto_706307 - BLOCK
      ?auto_706308 - BLOCK
      ?auto_706309 - BLOCK
    )
    :vars
    (
      ?auto_706310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706309 ?auto_706310 ) ( ON-TABLE ?auto_706296 ) ( ON ?auto_706297 ?auto_706296 ) ( ON ?auto_706298 ?auto_706297 ) ( ON ?auto_706299 ?auto_706298 ) ( ON ?auto_706300 ?auto_706299 ) ( not ( = ?auto_706296 ?auto_706297 ) ) ( not ( = ?auto_706296 ?auto_706298 ) ) ( not ( = ?auto_706296 ?auto_706299 ) ) ( not ( = ?auto_706296 ?auto_706300 ) ) ( not ( = ?auto_706296 ?auto_706301 ) ) ( not ( = ?auto_706296 ?auto_706302 ) ) ( not ( = ?auto_706296 ?auto_706303 ) ) ( not ( = ?auto_706296 ?auto_706304 ) ) ( not ( = ?auto_706296 ?auto_706305 ) ) ( not ( = ?auto_706296 ?auto_706306 ) ) ( not ( = ?auto_706296 ?auto_706307 ) ) ( not ( = ?auto_706296 ?auto_706308 ) ) ( not ( = ?auto_706296 ?auto_706309 ) ) ( not ( = ?auto_706296 ?auto_706310 ) ) ( not ( = ?auto_706297 ?auto_706298 ) ) ( not ( = ?auto_706297 ?auto_706299 ) ) ( not ( = ?auto_706297 ?auto_706300 ) ) ( not ( = ?auto_706297 ?auto_706301 ) ) ( not ( = ?auto_706297 ?auto_706302 ) ) ( not ( = ?auto_706297 ?auto_706303 ) ) ( not ( = ?auto_706297 ?auto_706304 ) ) ( not ( = ?auto_706297 ?auto_706305 ) ) ( not ( = ?auto_706297 ?auto_706306 ) ) ( not ( = ?auto_706297 ?auto_706307 ) ) ( not ( = ?auto_706297 ?auto_706308 ) ) ( not ( = ?auto_706297 ?auto_706309 ) ) ( not ( = ?auto_706297 ?auto_706310 ) ) ( not ( = ?auto_706298 ?auto_706299 ) ) ( not ( = ?auto_706298 ?auto_706300 ) ) ( not ( = ?auto_706298 ?auto_706301 ) ) ( not ( = ?auto_706298 ?auto_706302 ) ) ( not ( = ?auto_706298 ?auto_706303 ) ) ( not ( = ?auto_706298 ?auto_706304 ) ) ( not ( = ?auto_706298 ?auto_706305 ) ) ( not ( = ?auto_706298 ?auto_706306 ) ) ( not ( = ?auto_706298 ?auto_706307 ) ) ( not ( = ?auto_706298 ?auto_706308 ) ) ( not ( = ?auto_706298 ?auto_706309 ) ) ( not ( = ?auto_706298 ?auto_706310 ) ) ( not ( = ?auto_706299 ?auto_706300 ) ) ( not ( = ?auto_706299 ?auto_706301 ) ) ( not ( = ?auto_706299 ?auto_706302 ) ) ( not ( = ?auto_706299 ?auto_706303 ) ) ( not ( = ?auto_706299 ?auto_706304 ) ) ( not ( = ?auto_706299 ?auto_706305 ) ) ( not ( = ?auto_706299 ?auto_706306 ) ) ( not ( = ?auto_706299 ?auto_706307 ) ) ( not ( = ?auto_706299 ?auto_706308 ) ) ( not ( = ?auto_706299 ?auto_706309 ) ) ( not ( = ?auto_706299 ?auto_706310 ) ) ( not ( = ?auto_706300 ?auto_706301 ) ) ( not ( = ?auto_706300 ?auto_706302 ) ) ( not ( = ?auto_706300 ?auto_706303 ) ) ( not ( = ?auto_706300 ?auto_706304 ) ) ( not ( = ?auto_706300 ?auto_706305 ) ) ( not ( = ?auto_706300 ?auto_706306 ) ) ( not ( = ?auto_706300 ?auto_706307 ) ) ( not ( = ?auto_706300 ?auto_706308 ) ) ( not ( = ?auto_706300 ?auto_706309 ) ) ( not ( = ?auto_706300 ?auto_706310 ) ) ( not ( = ?auto_706301 ?auto_706302 ) ) ( not ( = ?auto_706301 ?auto_706303 ) ) ( not ( = ?auto_706301 ?auto_706304 ) ) ( not ( = ?auto_706301 ?auto_706305 ) ) ( not ( = ?auto_706301 ?auto_706306 ) ) ( not ( = ?auto_706301 ?auto_706307 ) ) ( not ( = ?auto_706301 ?auto_706308 ) ) ( not ( = ?auto_706301 ?auto_706309 ) ) ( not ( = ?auto_706301 ?auto_706310 ) ) ( not ( = ?auto_706302 ?auto_706303 ) ) ( not ( = ?auto_706302 ?auto_706304 ) ) ( not ( = ?auto_706302 ?auto_706305 ) ) ( not ( = ?auto_706302 ?auto_706306 ) ) ( not ( = ?auto_706302 ?auto_706307 ) ) ( not ( = ?auto_706302 ?auto_706308 ) ) ( not ( = ?auto_706302 ?auto_706309 ) ) ( not ( = ?auto_706302 ?auto_706310 ) ) ( not ( = ?auto_706303 ?auto_706304 ) ) ( not ( = ?auto_706303 ?auto_706305 ) ) ( not ( = ?auto_706303 ?auto_706306 ) ) ( not ( = ?auto_706303 ?auto_706307 ) ) ( not ( = ?auto_706303 ?auto_706308 ) ) ( not ( = ?auto_706303 ?auto_706309 ) ) ( not ( = ?auto_706303 ?auto_706310 ) ) ( not ( = ?auto_706304 ?auto_706305 ) ) ( not ( = ?auto_706304 ?auto_706306 ) ) ( not ( = ?auto_706304 ?auto_706307 ) ) ( not ( = ?auto_706304 ?auto_706308 ) ) ( not ( = ?auto_706304 ?auto_706309 ) ) ( not ( = ?auto_706304 ?auto_706310 ) ) ( not ( = ?auto_706305 ?auto_706306 ) ) ( not ( = ?auto_706305 ?auto_706307 ) ) ( not ( = ?auto_706305 ?auto_706308 ) ) ( not ( = ?auto_706305 ?auto_706309 ) ) ( not ( = ?auto_706305 ?auto_706310 ) ) ( not ( = ?auto_706306 ?auto_706307 ) ) ( not ( = ?auto_706306 ?auto_706308 ) ) ( not ( = ?auto_706306 ?auto_706309 ) ) ( not ( = ?auto_706306 ?auto_706310 ) ) ( not ( = ?auto_706307 ?auto_706308 ) ) ( not ( = ?auto_706307 ?auto_706309 ) ) ( not ( = ?auto_706307 ?auto_706310 ) ) ( not ( = ?auto_706308 ?auto_706309 ) ) ( not ( = ?auto_706308 ?auto_706310 ) ) ( not ( = ?auto_706309 ?auto_706310 ) ) ( ON ?auto_706308 ?auto_706309 ) ( ON ?auto_706307 ?auto_706308 ) ( ON ?auto_706306 ?auto_706307 ) ( ON ?auto_706305 ?auto_706306 ) ( ON ?auto_706304 ?auto_706305 ) ( ON ?auto_706303 ?auto_706304 ) ( ON ?auto_706302 ?auto_706303 ) ( CLEAR ?auto_706300 ) ( ON ?auto_706301 ?auto_706302 ) ( CLEAR ?auto_706301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_706296 ?auto_706297 ?auto_706298 ?auto_706299 ?auto_706300 ?auto_706301 )
      ( MAKE-14PILE ?auto_706296 ?auto_706297 ?auto_706298 ?auto_706299 ?auto_706300 ?auto_706301 ?auto_706302 ?auto_706303 ?auto_706304 ?auto_706305 ?auto_706306 ?auto_706307 ?auto_706308 ?auto_706309 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706354 - BLOCK
      ?auto_706355 - BLOCK
      ?auto_706356 - BLOCK
      ?auto_706357 - BLOCK
      ?auto_706358 - BLOCK
      ?auto_706359 - BLOCK
      ?auto_706360 - BLOCK
      ?auto_706361 - BLOCK
      ?auto_706362 - BLOCK
      ?auto_706363 - BLOCK
      ?auto_706364 - BLOCK
      ?auto_706365 - BLOCK
      ?auto_706366 - BLOCK
      ?auto_706367 - BLOCK
    )
    :vars
    (
      ?auto_706368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706367 ?auto_706368 ) ( ON-TABLE ?auto_706354 ) ( ON ?auto_706355 ?auto_706354 ) ( ON ?auto_706356 ?auto_706355 ) ( ON ?auto_706357 ?auto_706356 ) ( not ( = ?auto_706354 ?auto_706355 ) ) ( not ( = ?auto_706354 ?auto_706356 ) ) ( not ( = ?auto_706354 ?auto_706357 ) ) ( not ( = ?auto_706354 ?auto_706358 ) ) ( not ( = ?auto_706354 ?auto_706359 ) ) ( not ( = ?auto_706354 ?auto_706360 ) ) ( not ( = ?auto_706354 ?auto_706361 ) ) ( not ( = ?auto_706354 ?auto_706362 ) ) ( not ( = ?auto_706354 ?auto_706363 ) ) ( not ( = ?auto_706354 ?auto_706364 ) ) ( not ( = ?auto_706354 ?auto_706365 ) ) ( not ( = ?auto_706354 ?auto_706366 ) ) ( not ( = ?auto_706354 ?auto_706367 ) ) ( not ( = ?auto_706354 ?auto_706368 ) ) ( not ( = ?auto_706355 ?auto_706356 ) ) ( not ( = ?auto_706355 ?auto_706357 ) ) ( not ( = ?auto_706355 ?auto_706358 ) ) ( not ( = ?auto_706355 ?auto_706359 ) ) ( not ( = ?auto_706355 ?auto_706360 ) ) ( not ( = ?auto_706355 ?auto_706361 ) ) ( not ( = ?auto_706355 ?auto_706362 ) ) ( not ( = ?auto_706355 ?auto_706363 ) ) ( not ( = ?auto_706355 ?auto_706364 ) ) ( not ( = ?auto_706355 ?auto_706365 ) ) ( not ( = ?auto_706355 ?auto_706366 ) ) ( not ( = ?auto_706355 ?auto_706367 ) ) ( not ( = ?auto_706355 ?auto_706368 ) ) ( not ( = ?auto_706356 ?auto_706357 ) ) ( not ( = ?auto_706356 ?auto_706358 ) ) ( not ( = ?auto_706356 ?auto_706359 ) ) ( not ( = ?auto_706356 ?auto_706360 ) ) ( not ( = ?auto_706356 ?auto_706361 ) ) ( not ( = ?auto_706356 ?auto_706362 ) ) ( not ( = ?auto_706356 ?auto_706363 ) ) ( not ( = ?auto_706356 ?auto_706364 ) ) ( not ( = ?auto_706356 ?auto_706365 ) ) ( not ( = ?auto_706356 ?auto_706366 ) ) ( not ( = ?auto_706356 ?auto_706367 ) ) ( not ( = ?auto_706356 ?auto_706368 ) ) ( not ( = ?auto_706357 ?auto_706358 ) ) ( not ( = ?auto_706357 ?auto_706359 ) ) ( not ( = ?auto_706357 ?auto_706360 ) ) ( not ( = ?auto_706357 ?auto_706361 ) ) ( not ( = ?auto_706357 ?auto_706362 ) ) ( not ( = ?auto_706357 ?auto_706363 ) ) ( not ( = ?auto_706357 ?auto_706364 ) ) ( not ( = ?auto_706357 ?auto_706365 ) ) ( not ( = ?auto_706357 ?auto_706366 ) ) ( not ( = ?auto_706357 ?auto_706367 ) ) ( not ( = ?auto_706357 ?auto_706368 ) ) ( not ( = ?auto_706358 ?auto_706359 ) ) ( not ( = ?auto_706358 ?auto_706360 ) ) ( not ( = ?auto_706358 ?auto_706361 ) ) ( not ( = ?auto_706358 ?auto_706362 ) ) ( not ( = ?auto_706358 ?auto_706363 ) ) ( not ( = ?auto_706358 ?auto_706364 ) ) ( not ( = ?auto_706358 ?auto_706365 ) ) ( not ( = ?auto_706358 ?auto_706366 ) ) ( not ( = ?auto_706358 ?auto_706367 ) ) ( not ( = ?auto_706358 ?auto_706368 ) ) ( not ( = ?auto_706359 ?auto_706360 ) ) ( not ( = ?auto_706359 ?auto_706361 ) ) ( not ( = ?auto_706359 ?auto_706362 ) ) ( not ( = ?auto_706359 ?auto_706363 ) ) ( not ( = ?auto_706359 ?auto_706364 ) ) ( not ( = ?auto_706359 ?auto_706365 ) ) ( not ( = ?auto_706359 ?auto_706366 ) ) ( not ( = ?auto_706359 ?auto_706367 ) ) ( not ( = ?auto_706359 ?auto_706368 ) ) ( not ( = ?auto_706360 ?auto_706361 ) ) ( not ( = ?auto_706360 ?auto_706362 ) ) ( not ( = ?auto_706360 ?auto_706363 ) ) ( not ( = ?auto_706360 ?auto_706364 ) ) ( not ( = ?auto_706360 ?auto_706365 ) ) ( not ( = ?auto_706360 ?auto_706366 ) ) ( not ( = ?auto_706360 ?auto_706367 ) ) ( not ( = ?auto_706360 ?auto_706368 ) ) ( not ( = ?auto_706361 ?auto_706362 ) ) ( not ( = ?auto_706361 ?auto_706363 ) ) ( not ( = ?auto_706361 ?auto_706364 ) ) ( not ( = ?auto_706361 ?auto_706365 ) ) ( not ( = ?auto_706361 ?auto_706366 ) ) ( not ( = ?auto_706361 ?auto_706367 ) ) ( not ( = ?auto_706361 ?auto_706368 ) ) ( not ( = ?auto_706362 ?auto_706363 ) ) ( not ( = ?auto_706362 ?auto_706364 ) ) ( not ( = ?auto_706362 ?auto_706365 ) ) ( not ( = ?auto_706362 ?auto_706366 ) ) ( not ( = ?auto_706362 ?auto_706367 ) ) ( not ( = ?auto_706362 ?auto_706368 ) ) ( not ( = ?auto_706363 ?auto_706364 ) ) ( not ( = ?auto_706363 ?auto_706365 ) ) ( not ( = ?auto_706363 ?auto_706366 ) ) ( not ( = ?auto_706363 ?auto_706367 ) ) ( not ( = ?auto_706363 ?auto_706368 ) ) ( not ( = ?auto_706364 ?auto_706365 ) ) ( not ( = ?auto_706364 ?auto_706366 ) ) ( not ( = ?auto_706364 ?auto_706367 ) ) ( not ( = ?auto_706364 ?auto_706368 ) ) ( not ( = ?auto_706365 ?auto_706366 ) ) ( not ( = ?auto_706365 ?auto_706367 ) ) ( not ( = ?auto_706365 ?auto_706368 ) ) ( not ( = ?auto_706366 ?auto_706367 ) ) ( not ( = ?auto_706366 ?auto_706368 ) ) ( not ( = ?auto_706367 ?auto_706368 ) ) ( ON ?auto_706366 ?auto_706367 ) ( ON ?auto_706365 ?auto_706366 ) ( ON ?auto_706364 ?auto_706365 ) ( ON ?auto_706363 ?auto_706364 ) ( ON ?auto_706362 ?auto_706363 ) ( ON ?auto_706361 ?auto_706362 ) ( ON ?auto_706360 ?auto_706361 ) ( ON ?auto_706359 ?auto_706360 ) ( CLEAR ?auto_706357 ) ( ON ?auto_706358 ?auto_706359 ) ( CLEAR ?auto_706358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_706354 ?auto_706355 ?auto_706356 ?auto_706357 ?auto_706358 )
      ( MAKE-14PILE ?auto_706354 ?auto_706355 ?auto_706356 ?auto_706357 ?auto_706358 ?auto_706359 ?auto_706360 ?auto_706361 ?auto_706362 ?auto_706363 ?auto_706364 ?auto_706365 ?auto_706366 ?auto_706367 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706412 - BLOCK
      ?auto_706413 - BLOCK
      ?auto_706414 - BLOCK
      ?auto_706415 - BLOCK
      ?auto_706416 - BLOCK
      ?auto_706417 - BLOCK
      ?auto_706418 - BLOCK
      ?auto_706419 - BLOCK
      ?auto_706420 - BLOCK
      ?auto_706421 - BLOCK
      ?auto_706422 - BLOCK
      ?auto_706423 - BLOCK
      ?auto_706424 - BLOCK
      ?auto_706425 - BLOCK
    )
    :vars
    (
      ?auto_706426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706425 ?auto_706426 ) ( ON-TABLE ?auto_706412 ) ( ON ?auto_706413 ?auto_706412 ) ( ON ?auto_706414 ?auto_706413 ) ( not ( = ?auto_706412 ?auto_706413 ) ) ( not ( = ?auto_706412 ?auto_706414 ) ) ( not ( = ?auto_706412 ?auto_706415 ) ) ( not ( = ?auto_706412 ?auto_706416 ) ) ( not ( = ?auto_706412 ?auto_706417 ) ) ( not ( = ?auto_706412 ?auto_706418 ) ) ( not ( = ?auto_706412 ?auto_706419 ) ) ( not ( = ?auto_706412 ?auto_706420 ) ) ( not ( = ?auto_706412 ?auto_706421 ) ) ( not ( = ?auto_706412 ?auto_706422 ) ) ( not ( = ?auto_706412 ?auto_706423 ) ) ( not ( = ?auto_706412 ?auto_706424 ) ) ( not ( = ?auto_706412 ?auto_706425 ) ) ( not ( = ?auto_706412 ?auto_706426 ) ) ( not ( = ?auto_706413 ?auto_706414 ) ) ( not ( = ?auto_706413 ?auto_706415 ) ) ( not ( = ?auto_706413 ?auto_706416 ) ) ( not ( = ?auto_706413 ?auto_706417 ) ) ( not ( = ?auto_706413 ?auto_706418 ) ) ( not ( = ?auto_706413 ?auto_706419 ) ) ( not ( = ?auto_706413 ?auto_706420 ) ) ( not ( = ?auto_706413 ?auto_706421 ) ) ( not ( = ?auto_706413 ?auto_706422 ) ) ( not ( = ?auto_706413 ?auto_706423 ) ) ( not ( = ?auto_706413 ?auto_706424 ) ) ( not ( = ?auto_706413 ?auto_706425 ) ) ( not ( = ?auto_706413 ?auto_706426 ) ) ( not ( = ?auto_706414 ?auto_706415 ) ) ( not ( = ?auto_706414 ?auto_706416 ) ) ( not ( = ?auto_706414 ?auto_706417 ) ) ( not ( = ?auto_706414 ?auto_706418 ) ) ( not ( = ?auto_706414 ?auto_706419 ) ) ( not ( = ?auto_706414 ?auto_706420 ) ) ( not ( = ?auto_706414 ?auto_706421 ) ) ( not ( = ?auto_706414 ?auto_706422 ) ) ( not ( = ?auto_706414 ?auto_706423 ) ) ( not ( = ?auto_706414 ?auto_706424 ) ) ( not ( = ?auto_706414 ?auto_706425 ) ) ( not ( = ?auto_706414 ?auto_706426 ) ) ( not ( = ?auto_706415 ?auto_706416 ) ) ( not ( = ?auto_706415 ?auto_706417 ) ) ( not ( = ?auto_706415 ?auto_706418 ) ) ( not ( = ?auto_706415 ?auto_706419 ) ) ( not ( = ?auto_706415 ?auto_706420 ) ) ( not ( = ?auto_706415 ?auto_706421 ) ) ( not ( = ?auto_706415 ?auto_706422 ) ) ( not ( = ?auto_706415 ?auto_706423 ) ) ( not ( = ?auto_706415 ?auto_706424 ) ) ( not ( = ?auto_706415 ?auto_706425 ) ) ( not ( = ?auto_706415 ?auto_706426 ) ) ( not ( = ?auto_706416 ?auto_706417 ) ) ( not ( = ?auto_706416 ?auto_706418 ) ) ( not ( = ?auto_706416 ?auto_706419 ) ) ( not ( = ?auto_706416 ?auto_706420 ) ) ( not ( = ?auto_706416 ?auto_706421 ) ) ( not ( = ?auto_706416 ?auto_706422 ) ) ( not ( = ?auto_706416 ?auto_706423 ) ) ( not ( = ?auto_706416 ?auto_706424 ) ) ( not ( = ?auto_706416 ?auto_706425 ) ) ( not ( = ?auto_706416 ?auto_706426 ) ) ( not ( = ?auto_706417 ?auto_706418 ) ) ( not ( = ?auto_706417 ?auto_706419 ) ) ( not ( = ?auto_706417 ?auto_706420 ) ) ( not ( = ?auto_706417 ?auto_706421 ) ) ( not ( = ?auto_706417 ?auto_706422 ) ) ( not ( = ?auto_706417 ?auto_706423 ) ) ( not ( = ?auto_706417 ?auto_706424 ) ) ( not ( = ?auto_706417 ?auto_706425 ) ) ( not ( = ?auto_706417 ?auto_706426 ) ) ( not ( = ?auto_706418 ?auto_706419 ) ) ( not ( = ?auto_706418 ?auto_706420 ) ) ( not ( = ?auto_706418 ?auto_706421 ) ) ( not ( = ?auto_706418 ?auto_706422 ) ) ( not ( = ?auto_706418 ?auto_706423 ) ) ( not ( = ?auto_706418 ?auto_706424 ) ) ( not ( = ?auto_706418 ?auto_706425 ) ) ( not ( = ?auto_706418 ?auto_706426 ) ) ( not ( = ?auto_706419 ?auto_706420 ) ) ( not ( = ?auto_706419 ?auto_706421 ) ) ( not ( = ?auto_706419 ?auto_706422 ) ) ( not ( = ?auto_706419 ?auto_706423 ) ) ( not ( = ?auto_706419 ?auto_706424 ) ) ( not ( = ?auto_706419 ?auto_706425 ) ) ( not ( = ?auto_706419 ?auto_706426 ) ) ( not ( = ?auto_706420 ?auto_706421 ) ) ( not ( = ?auto_706420 ?auto_706422 ) ) ( not ( = ?auto_706420 ?auto_706423 ) ) ( not ( = ?auto_706420 ?auto_706424 ) ) ( not ( = ?auto_706420 ?auto_706425 ) ) ( not ( = ?auto_706420 ?auto_706426 ) ) ( not ( = ?auto_706421 ?auto_706422 ) ) ( not ( = ?auto_706421 ?auto_706423 ) ) ( not ( = ?auto_706421 ?auto_706424 ) ) ( not ( = ?auto_706421 ?auto_706425 ) ) ( not ( = ?auto_706421 ?auto_706426 ) ) ( not ( = ?auto_706422 ?auto_706423 ) ) ( not ( = ?auto_706422 ?auto_706424 ) ) ( not ( = ?auto_706422 ?auto_706425 ) ) ( not ( = ?auto_706422 ?auto_706426 ) ) ( not ( = ?auto_706423 ?auto_706424 ) ) ( not ( = ?auto_706423 ?auto_706425 ) ) ( not ( = ?auto_706423 ?auto_706426 ) ) ( not ( = ?auto_706424 ?auto_706425 ) ) ( not ( = ?auto_706424 ?auto_706426 ) ) ( not ( = ?auto_706425 ?auto_706426 ) ) ( ON ?auto_706424 ?auto_706425 ) ( ON ?auto_706423 ?auto_706424 ) ( ON ?auto_706422 ?auto_706423 ) ( ON ?auto_706421 ?auto_706422 ) ( ON ?auto_706420 ?auto_706421 ) ( ON ?auto_706419 ?auto_706420 ) ( ON ?auto_706418 ?auto_706419 ) ( ON ?auto_706417 ?auto_706418 ) ( ON ?auto_706416 ?auto_706417 ) ( CLEAR ?auto_706414 ) ( ON ?auto_706415 ?auto_706416 ) ( CLEAR ?auto_706415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_706412 ?auto_706413 ?auto_706414 ?auto_706415 )
      ( MAKE-14PILE ?auto_706412 ?auto_706413 ?auto_706414 ?auto_706415 ?auto_706416 ?auto_706417 ?auto_706418 ?auto_706419 ?auto_706420 ?auto_706421 ?auto_706422 ?auto_706423 ?auto_706424 ?auto_706425 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706470 - BLOCK
      ?auto_706471 - BLOCK
      ?auto_706472 - BLOCK
      ?auto_706473 - BLOCK
      ?auto_706474 - BLOCK
      ?auto_706475 - BLOCK
      ?auto_706476 - BLOCK
      ?auto_706477 - BLOCK
      ?auto_706478 - BLOCK
      ?auto_706479 - BLOCK
      ?auto_706480 - BLOCK
      ?auto_706481 - BLOCK
      ?auto_706482 - BLOCK
      ?auto_706483 - BLOCK
    )
    :vars
    (
      ?auto_706484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706483 ?auto_706484 ) ( ON-TABLE ?auto_706470 ) ( ON ?auto_706471 ?auto_706470 ) ( not ( = ?auto_706470 ?auto_706471 ) ) ( not ( = ?auto_706470 ?auto_706472 ) ) ( not ( = ?auto_706470 ?auto_706473 ) ) ( not ( = ?auto_706470 ?auto_706474 ) ) ( not ( = ?auto_706470 ?auto_706475 ) ) ( not ( = ?auto_706470 ?auto_706476 ) ) ( not ( = ?auto_706470 ?auto_706477 ) ) ( not ( = ?auto_706470 ?auto_706478 ) ) ( not ( = ?auto_706470 ?auto_706479 ) ) ( not ( = ?auto_706470 ?auto_706480 ) ) ( not ( = ?auto_706470 ?auto_706481 ) ) ( not ( = ?auto_706470 ?auto_706482 ) ) ( not ( = ?auto_706470 ?auto_706483 ) ) ( not ( = ?auto_706470 ?auto_706484 ) ) ( not ( = ?auto_706471 ?auto_706472 ) ) ( not ( = ?auto_706471 ?auto_706473 ) ) ( not ( = ?auto_706471 ?auto_706474 ) ) ( not ( = ?auto_706471 ?auto_706475 ) ) ( not ( = ?auto_706471 ?auto_706476 ) ) ( not ( = ?auto_706471 ?auto_706477 ) ) ( not ( = ?auto_706471 ?auto_706478 ) ) ( not ( = ?auto_706471 ?auto_706479 ) ) ( not ( = ?auto_706471 ?auto_706480 ) ) ( not ( = ?auto_706471 ?auto_706481 ) ) ( not ( = ?auto_706471 ?auto_706482 ) ) ( not ( = ?auto_706471 ?auto_706483 ) ) ( not ( = ?auto_706471 ?auto_706484 ) ) ( not ( = ?auto_706472 ?auto_706473 ) ) ( not ( = ?auto_706472 ?auto_706474 ) ) ( not ( = ?auto_706472 ?auto_706475 ) ) ( not ( = ?auto_706472 ?auto_706476 ) ) ( not ( = ?auto_706472 ?auto_706477 ) ) ( not ( = ?auto_706472 ?auto_706478 ) ) ( not ( = ?auto_706472 ?auto_706479 ) ) ( not ( = ?auto_706472 ?auto_706480 ) ) ( not ( = ?auto_706472 ?auto_706481 ) ) ( not ( = ?auto_706472 ?auto_706482 ) ) ( not ( = ?auto_706472 ?auto_706483 ) ) ( not ( = ?auto_706472 ?auto_706484 ) ) ( not ( = ?auto_706473 ?auto_706474 ) ) ( not ( = ?auto_706473 ?auto_706475 ) ) ( not ( = ?auto_706473 ?auto_706476 ) ) ( not ( = ?auto_706473 ?auto_706477 ) ) ( not ( = ?auto_706473 ?auto_706478 ) ) ( not ( = ?auto_706473 ?auto_706479 ) ) ( not ( = ?auto_706473 ?auto_706480 ) ) ( not ( = ?auto_706473 ?auto_706481 ) ) ( not ( = ?auto_706473 ?auto_706482 ) ) ( not ( = ?auto_706473 ?auto_706483 ) ) ( not ( = ?auto_706473 ?auto_706484 ) ) ( not ( = ?auto_706474 ?auto_706475 ) ) ( not ( = ?auto_706474 ?auto_706476 ) ) ( not ( = ?auto_706474 ?auto_706477 ) ) ( not ( = ?auto_706474 ?auto_706478 ) ) ( not ( = ?auto_706474 ?auto_706479 ) ) ( not ( = ?auto_706474 ?auto_706480 ) ) ( not ( = ?auto_706474 ?auto_706481 ) ) ( not ( = ?auto_706474 ?auto_706482 ) ) ( not ( = ?auto_706474 ?auto_706483 ) ) ( not ( = ?auto_706474 ?auto_706484 ) ) ( not ( = ?auto_706475 ?auto_706476 ) ) ( not ( = ?auto_706475 ?auto_706477 ) ) ( not ( = ?auto_706475 ?auto_706478 ) ) ( not ( = ?auto_706475 ?auto_706479 ) ) ( not ( = ?auto_706475 ?auto_706480 ) ) ( not ( = ?auto_706475 ?auto_706481 ) ) ( not ( = ?auto_706475 ?auto_706482 ) ) ( not ( = ?auto_706475 ?auto_706483 ) ) ( not ( = ?auto_706475 ?auto_706484 ) ) ( not ( = ?auto_706476 ?auto_706477 ) ) ( not ( = ?auto_706476 ?auto_706478 ) ) ( not ( = ?auto_706476 ?auto_706479 ) ) ( not ( = ?auto_706476 ?auto_706480 ) ) ( not ( = ?auto_706476 ?auto_706481 ) ) ( not ( = ?auto_706476 ?auto_706482 ) ) ( not ( = ?auto_706476 ?auto_706483 ) ) ( not ( = ?auto_706476 ?auto_706484 ) ) ( not ( = ?auto_706477 ?auto_706478 ) ) ( not ( = ?auto_706477 ?auto_706479 ) ) ( not ( = ?auto_706477 ?auto_706480 ) ) ( not ( = ?auto_706477 ?auto_706481 ) ) ( not ( = ?auto_706477 ?auto_706482 ) ) ( not ( = ?auto_706477 ?auto_706483 ) ) ( not ( = ?auto_706477 ?auto_706484 ) ) ( not ( = ?auto_706478 ?auto_706479 ) ) ( not ( = ?auto_706478 ?auto_706480 ) ) ( not ( = ?auto_706478 ?auto_706481 ) ) ( not ( = ?auto_706478 ?auto_706482 ) ) ( not ( = ?auto_706478 ?auto_706483 ) ) ( not ( = ?auto_706478 ?auto_706484 ) ) ( not ( = ?auto_706479 ?auto_706480 ) ) ( not ( = ?auto_706479 ?auto_706481 ) ) ( not ( = ?auto_706479 ?auto_706482 ) ) ( not ( = ?auto_706479 ?auto_706483 ) ) ( not ( = ?auto_706479 ?auto_706484 ) ) ( not ( = ?auto_706480 ?auto_706481 ) ) ( not ( = ?auto_706480 ?auto_706482 ) ) ( not ( = ?auto_706480 ?auto_706483 ) ) ( not ( = ?auto_706480 ?auto_706484 ) ) ( not ( = ?auto_706481 ?auto_706482 ) ) ( not ( = ?auto_706481 ?auto_706483 ) ) ( not ( = ?auto_706481 ?auto_706484 ) ) ( not ( = ?auto_706482 ?auto_706483 ) ) ( not ( = ?auto_706482 ?auto_706484 ) ) ( not ( = ?auto_706483 ?auto_706484 ) ) ( ON ?auto_706482 ?auto_706483 ) ( ON ?auto_706481 ?auto_706482 ) ( ON ?auto_706480 ?auto_706481 ) ( ON ?auto_706479 ?auto_706480 ) ( ON ?auto_706478 ?auto_706479 ) ( ON ?auto_706477 ?auto_706478 ) ( ON ?auto_706476 ?auto_706477 ) ( ON ?auto_706475 ?auto_706476 ) ( ON ?auto_706474 ?auto_706475 ) ( ON ?auto_706473 ?auto_706474 ) ( CLEAR ?auto_706471 ) ( ON ?auto_706472 ?auto_706473 ) ( CLEAR ?auto_706472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_706470 ?auto_706471 ?auto_706472 )
      ( MAKE-14PILE ?auto_706470 ?auto_706471 ?auto_706472 ?auto_706473 ?auto_706474 ?auto_706475 ?auto_706476 ?auto_706477 ?auto_706478 ?auto_706479 ?auto_706480 ?auto_706481 ?auto_706482 ?auto_706483 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706528 - BLOCK
      ?auto_706529 - BLOCK
      ?auto_706530 - BLOCK
      ?auto_706531 - BLOCK
      ?auto_706532 - BLOCK
      ?auto_706533 - BLOCK
      ?auto_706534 - BLOCK
      ?auto_706535 - BLOCK
      ?auto_706536 - BLOCK
      ?auto_706537 - BLOCK
      ?auto_706538 - BLOCK
      ?auto_706539 - BLOCK
      ?auto_706540 - BLOCK
      ?auto_706541 - BLOCK
    )
    :vars
    (
      ?auto_706542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706541 ?auto_706542 ) ( ON-TABLE ?auto_706528 ) ( not ( = ?auto_706528 ?auto_706529 ) ) ( not ( = ?auto_706528 ?auto_706530 ) ) ( not ( = ?auto_706528 ?auto_706531 ) ) ( not ( = ?auto_706528 ?auto_706532 ) ) ( not ( = ?auto_706528 ?auto_706533 ) ) ( not ( = ?auto_706528 ?auto_706534 ) ) ( not ( = ?auto_706528 ?auto_706535 ) ) ( not ( = ?auto_706528 ?auto_706536 ) ) ( not ( = ?auto_706528 ?auto_706537 ) ) ( not ( = ?auto_706528 ?auto_706538 ) ) ( not ( = ?auto_706528 ?auto_706539 ) ) ( not ( = ?auto_706528 ?auto_706540 ) ) ( not ( = ?auto_706528 ?auto_706541 ) ) ( not ( = ?auto_706528 ?auto_706542 ) ) ( not ( = ?auto_706529 ?auto_706530 ) ) ( not ( = ?auto_706529 ?auto_706531 ) ) ( not ( = ?auto_706529 ?auto_706532 ) ) ( not ( = ?auto_706529 ?auto_706533 ) ) ( not ( = ?auto_706529 ?auto_706534 ) ) ( not ( = ?auto_706529 ?auto_706535 ) ) ( not ( = ?auto_706529 ?auto_706536 ) ) ( not ( = ?auto_706529 ?auto_706537 ) ) ( not ( = ?auto_706529 ?auto_706538 ) ) ( not ( = ?auto_706529 ?auto_706539 ) ) ( not ( = ?auto_706529 ?auto_706540 ) ) ( not ( = ?auto_706529 ?auto_706541 ) ) ( not ( = ?auto_706529 ?auto_706542 ) ) ( not ( = ?auto_706530 ?auto_706531 ) ) ( not ( = ?auto_706530 ?auto_706532 ) ) ( not ( = ?auto_706530 ?auto_706533 ) ) ( not ( = ?auto_706530 ?auto_706534 ) ) ( not ( = ?auto_706530 ?auto_706535 ) ) ( not ( = ?auto_706530 ?auto_706536 ) ) ( not ( = ?auto_706530 ?auto_706537 ) ) ( not ( = ?auto_706530 ?auto_706538 ) ) ( not ( = ?auto_706530 ?auto_706539 ) ) ( not ( = ?auto_706530 ?auto_706540 ) ) ( not ( = ?auto_706530 ?auto_706541 ) ) ( not ( = ?auto_706530 ?auto_706542 ) ) ( not ( = ?auto_706531 ?auto_706532 ) ) ( not ( = ?auto_706531 ?auto_706533 ) ) ( not ( = ?auto_706531 ?auto_706534 ) ) ( not ( = ?auto_706531 ?auto_706535 ) ) ( not ( = ?auto_706531 ?auto_706536 ) ) ( not ( = ?auto_706531 ?auto_706537 ) ) ( not ( = ?auto_706531 ?auto_706538 ) ) ( not ( = ?auto_706531 ?auto_706539 ) ) ( not ( = ?auto_706531 ?auto_706540 ) ) ( not ( = ?auto_706531 ?auto_706541 ) ) ( not ( = ?auto_706531 ?auto_706542 ) ) ( not ( = ?auto_706532 ?auto_706533 ) ) ( not ( = ?auto_706532 ?auto_706534 ) ) ( not ( = ?auto_706532 ?auto_706535 ) ) ( not ( = ?auto_706532 ?auto_706536 ) ) ( not ( = ?auto_706532 ?auto_706537 ) ) ( not ( = ?auto_706532 ?auto_706538 ) ) ( not ( = ?auto_706532 ?auto_706539 ) ) ( not ( = ?auto_706532 ?auto_706540 ) ) ( not ( = ?auto_706532 ?auto_706541 ) ) ( not ( = ?auto_706532 ?auto_706542 ) ) ( not ( = ?auto_706533 ?auto_706534 ) ) ( not ( = ?auto_706533 ?auto_706535 ) ) ( not ( = ?auto_706533 ?auto_706536 ) ) ( not ( = ?auto_706533 ?auto_706537 ) ) ( not ( = ?auto_706533 ?auto_706538 ) ) ( not ( = ?auto_706533 ?auto_706539 ) ) ( not ( = ?auto_706533 ?auto_706540 ) ) ( not ( = ?auto_706533 ?auto_706541 ) ) ( not ( = ?auto_706533 ?auto_706542 ) ) ( not ( = ?auto_706534 ?auto_706535 ) ) ( not ( = ?auto_706534 ?auto_706536 ) ) ( not ( = ?auto_706534 ?auto_706537 ) ) ( not ( = ?auto_706534 ?auto_706538 ) ) ( not ( = ?auto_706534 ?auto_706539 ) ) ( not ( = ?auto_706534 ?auto_706540 ) ) ( not ( = ?auto_706534 ?auto_706541 ) ) ( not ( = ?auto_706534 ?auto_706542 ) ) ( not ( = ?auto_706535 ?auto_706536 ) ) ( not ( = ?auto_706535 ?auto_706537 ) ) ( not ( = ?auto_706535 ?auto_706538 ) ) ( not ( = ?auto_706535 ?auto_706539 ) ) ( not ( = ?auto_706535 ?auto_706540 ) ) ( not ( = ?auto_706535 ?auto_706541 ) ) ( not ( = ?auto_706535 ?auto_706542 ) ) ( not ( = ?auto_706536 ?auto_706537 ) ) ( not ( = ?auto_706536 ?auto_706538 ) ) ( not ( = ?auto_706536 ?auto_706539 ) ) ( not ( = ?auto_706536 ?auto_706540 ) ) ( not ( = ?auto_706536 ?auto_706541 ) ) ( not ( = ?auto_706536 ?auto_706542 ) ) ( not ( = ?auto_706537 ?auto_706538 ) ) ( not ( = ?auto_706537 ?auto_706539 ) ) ( not ( = ?auto_706537 ?auto_706540 ) ) ( not ( = ?auto_706537 ?auto_706541 ) ) ( not ( = ?auto_706537 ?auto_706542 ) ) ( not ( = ?auto_706538 ?auto_706539 ) ) ( not ( = ?auto_706538 ?auto_706540 ) ) ( not ( = ?auto_706538 ?auto_706541 ) ) ( not ( = ?auto_706538 ?auto_706542 ) ) ( not ( = ?auto_706539 ?auto_706540 ) ) ( not ( = ?auto_706539 ?auto_706541 ) ) ( not ( = ?auto_706539 ?auto_706542 ) ) ( not ( = ?auto_706540 ?auto_706541 ) ) ( not ( = ?auto_706540 ?auto_706542 ) ) ( not ( = ?auto_706541 ?auto_706542 ) ) ( ON ?auto_706540 ?auto_706541 ) ( ON ?auto_706539 ?auto_706540 ) ( ON ?auto_706538 ?auto_706539 ) ( ON ?auto_706537 ?auto_706538 ) ( ON ?auto_706536 ?auto_706537 ) ( ON ?auto_706535 ?auto_706536 ) ( ON ?auto_706534 ?auto_706535 ) ( ON ?auto_706533 ?auto_706534 ) ( ON ?auto_706532 ?auto_706533 ) ( ON ?auto_706531 ?auto_706532 ) ( ON ?auto_706530 ?auto_706531 ) ( CLEAR ?auto_706528 ) ( ON ?auto_706529 ?auto_706530 ) ( CLEAR ?auto_706529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_706528 ?auto_706529 )
      ( MAKE-14PILE ?auto_706528 ?auto_706529 ?auto_706530 ?auto_706531 ?auto_706532 ?auto_706533 ?auto_706534 ?auto_706535 ?auto_706536 ?auto_706537 ?auto_706538 ?auto_706539 ?auto_706540 ?auto_706541 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_706586 - BLOCK
      ?auto_706587 - BLOCK
      ?auto_706588 - BLOCK
      ?auto_706589 - BLOCK
      ?auto_706590 - BLOCK
      ?auto_706591 - BLOCK
      ?auto_706592 - BLOCK
      ?auto_706593 - BLOCK
      ?auto_706594 - BLOCK
      ?auto_706595 - BLOCK
      ?auto_706596 - BLOCK
      ?auto_706597 - BLOCK
      ?auto_706598 - BLOCK
      ?auto_706599 - BLOCK
    )
    :vars
    (
      ?auto_706600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706599 ?auto_706600 ) ( not ( = ?auto_706586 ?auto_706587 ) ) ( not ( = ?auto_706586 ?auto_706588 ) ) ( not ( = ?auto_706586 ?auto_706589 ) ) ( not ( = ?auto_706586 ?auto_706590 ) ) ( not ( = ?auto_706586 ?auto_706591 ) ) ( not ( = ?auto_706586 ?auto_706592 ) ) ( not ( = ?auto_706586 ?auto_706593 ) ) ( not ( = ?auto_706586 ?auto_706594 ) ) ( not ( = ?auto_706586 ?auto_706595 ) ) ( not ( = ?auto_706586 ?auto_706596 ) ) ( not ( = ?auto_706586 ?auto_706597 ) ) ( not ( = ?auto_706586 ?auto_706598 ) ) ( not ( = ?auto_706586 ?auto_706599 ) ) ( not ( = ?auto_706586 ?auto_706600 ) ) ( not ( = ?auto_706587 ?auto_706588 ) ) ( not ( = ?auto_706587 ?auto_706589 ) ) ( not ( = ?auto_706587 ?auto_706590 ) ) ( not ( = ?auto_706587 ?auto_706591 ) ) ( not ( = ?auto_706587 ?auto_706592 ) ) ( not ( = ?auto_706587 ?auto_706593 ) ) ( not ( = ?auto_706587 ?auto_706594 ) ) ( not ( = ?auto_706587 ?auto_706595 ) ) ( not ( = ?auto_706587 ?auto_706596 ) ) ( not ( = ?auto_706587 ?auto_706597 ) ) ( not ( = ?auto_706587 ?auto_706598 ) ) ( not ( = ?auto_706587 ?auto_706599 ) ) ( not ( = ?auto_706587 ?auto_706600 ) ) ( not ( = ?auto_706588 ?auto_706589 ) ) ( not ( = ?auto_706588 ?auto_706590 ) ) ( not ( = ?auto_706588 ?auto_706591 ) ) ( not ( = ?auto_706588 ?auto_706592 ) ) ( not ( = ?auto_706588 ?auto_706593 ) ) ( not ( = ?auto_706588 ?auto_706594 ) ) ( not ( = ?auto_706588 ?auto_706595 ) ) ( not ( = ?auto_706588 ?auto_706596 ) ) ( not ( = ?auto_706588 ?auto_706597 ) ) ( not ( = ?auto_706588 ?auto_706598 ) ) ( not ( = ?auto_706588 ?auto_706599 ) ) ( not ( = ?auto_706588 ?auto_706600 ) ) ( not ( = ?auto_706589 ?auto_706590 ) ) ( not ( = ?auto_706589 ?auto_706591 ) ) ( not ( = ?auto_706589 ?auto_706592 ) ) ( not ( = ?auto_706589 ?auto_706593 ) ) ( not ( = ?auto_706589 ?auto_706594 ) ) ( not ( = ?auto_706589 ?auto_706595 ) ) ( not ( = ?auto_706589 ?auto_706596 ) ) ( not ( = ?auto_706589 ?auto_706597 ) ) ( not ( = ?auto_706589 ?auto_706598 ) ) ( not ( = ?auto_706589 ?auto_706599 ) ) ( not ( = ?auto_706589 ?auto_706600 ) ) ( not ( = ?auto_706590 ?auto_706591 ) ) ( not ( = ?auto_706590 ?auto_706592 ) ) ( not ( = ?auto_706590 ?auto_706593 ) ) ( not ( = ?auto_706590 ?auto_706594 ) ) ( not ( = ?auto_706590 ?auto_706595 ) ) ( not ( = ?auto_706590 ?auto_706596 ) ) ( not ( = ?auto_706590 ?auto_706597 ) ) ( not ( = ?auto_706590 ?auto_706598 ) ) ( not ( = ?auto_706590 ?auto_706599 ) ) ( not ( = ?auto_706590 ?auto_706600 ) ) ( not ( = ?auto_706591 ?auto_706592 ) ) ( not ( = ?auto_706591 ?auto_706593 ) ) ( not ( = ?auto_706591 ?auto_706594 ) ) ( not ( = ?auto_706591 ?auto_706595 ) ) ( not ( = ?auto_706591 ?auto_706596 ) ) ( not ( = ?auto_706591 ?auto_706597 ) ) ( not ( = ?auto_706591 ?auto_706598 ) ) ( not ( = ?auto_706591 ?auto_706599 ) ) ( not ( = ?auto_706591 ?auto_706600 ) ) ( not ( = ?auto_706592 ?auto_706593 ) ) ( not ( = ?auto_706592 ?auto_706594 ) ) ( not ( = ?auto_706592 ?auto_706595 ) ) ( not ( = ?auto_706592 ?auto_706596 ) ) ( not ( = ?auto_706592 ?auto_706597 ) ) ( not ( = ?auto_706592 ?auto_706598 ) ) ( not ( = ?auto_706592 ?auto_706599 ) ) ( not ( = ?auto_706592 ?auto_706600 ) ) ( not ( = ?auto_706593 ?auto_706594 ) ) ( not ( = ?auto_706593 ?auto_706595 ) ) ( not ( = ?auto_706593 ?auto_706596 ) ) ( not ( = ?auto_706593 ?auto_706597 ) ) ( not ( = ?auto_706593 ?auto_706598 ) ) ( not ( = ?auto_706593 ?auto_706599 ) ) ( not ( = ?auto_706593 ?auto_706600 ) ) ( not ( = ?auto_706594 ?auto_706595 ) ) ( not ( = ?auto_706594 ?auto_706596 ) ) ( not ( = ?auto_706594 ?auto_706597 ) ) ( not ( = ?auto_706594 ?auto_706598 ) ) ( not ( = ?auto_706594 ?auto_706599 ) ) ( not ( = ?auto_706594 ?auto_706600 ) ) ( not ( = ?auto_706595 ?auto_706596 ) ) ( not ( = ?auto_706595 ?auto_706597 ) ) ( not ( = ?auto_706595 ?auto_706598 ) ) ( not ( = ?auto_706595 ?auto_706599 ) ) ( not ( = ?auto_706595 ?auto_706600 ) ) ( not ( = ?auto_706596 ?auto_706597 ) ) ( not ( = ?auto_706596 ?auto_706598 ) ) ( not ( = ?auto_706596 ?auto_706599 ) ) ( not ( = ?auto_706596 ?auto_706600 ) ) ( not ( = ?auto_706597 ?auto_706598 ) ) ( not ( = ?auto_706597 ?auto_706599 ) ) ( not ( = ?auto_706597 ?auto_706600 ) ) ( not ( = ?auto_706598 ?auto_706599 ) ) ( not ( = ?auto_706598 ?auto_706600 ) ) ( not ( = ?auto_706599 ?auto_706600 ) ) ( ON ?auto_706598 ?auto_706599 ) ( ON ?auto_706597 ?auto_706598 ) ( ON ?auto_706596 ?auto_706597 ) ( ON ?auto_706595 ?auto_706596 ) ( ON ?auto_706594 ?auto_706595 ) ( ON ?auto_706593 ?auto_706594 ) ( ON ?auto_706592 ?auto_706593 ) ( ON ?auto_706591 ?auto_706592 ) ( ON ?auto_706590 ?auto_706591 ) ( ON ?auto_706589 ?auto_706590 ) ( ON ?auto_706588 ?auto_706589 ) ( ON ?auto_706587 ?auto_706588 ) ( ON ?auto_706586 ?auto_706587 ) ( CLEAR ?auto_706586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_706586 )
      ( MAKE-14PILE ?auto_706586 ?auto_706587 ?auto_706588 ?auto_706589 ?auto_706590 ?auto_706591 ?auto_706592 ?auto_706593 ?auto_706594 ?auto_706595 ?auto_706596 ?auto_706597 ?auto_706598 ?auto_706599 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706645 - BLOCK
      ?auto_706646 - BLOCK
      ?auto_706647 - BLOCK
      ?auto_706648 - BLOCK
      ?auto_706649 - BLOCK
      ?auto_706650 - BLOCK
      ?auto_706651 - BLOCK
      ?auto_706652 - BLOCK
      ?auto_706653 - BLOCK
      ?auto_706654 - BLOCK
      ?auto_706655 - BLOCK
      ?auto_706656 - BLOCK
      ?auto_706657 - BLOCK
      ?auto_706658 - BLOCK
      ?auto_706659 - BLOCK
    )
    :vars
    (
      ?auto_706660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_706658 ) ( ON ?auto_706659 ?auto_706660 ) ( CLEAR ?auto_706659 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_706645 ) ( ON ?auto_706646 ?auto_706645 ) ( ON ?auto_706647 ?auto_706646 ) ( ON ?auto_706648 ?auto_706647 ) ( ON ?auto_706649 ?auto_706648 ) ( ON ?auto_706650 ?auto_706649 ) ( ON ?auto_706651 ?auto_706650 ) ( ON ?auto_706652 ?auto_706651 ) ( ON ?auto_706653 ?auto_706652 ) ( ON ?auto_706654 ?auto_706653 ) ( ON ?auto_706655 ?auto_706654 ) ( ON ?auto_706656 ?auto_706655 ) ( ON ?auto_706657 ?auto_706656 ) ( ON ?auto_706658 ?auto_706657 ) ( not ( = ?auto_706645 ?auto_706646 ) ) ( not ( = ?auto_706645 ?auto_706647 ) ) ( not ( = ?auto_706645 ?auto_706648 ) ) ( not ( = ?auto_706645 ?auto_706649 ) ) ( not ( = ?auto_706645 ?auto_706650 ) ) ( not ( = ?auto_706645 ?auto_706651 ) ) ( not ( = ?auto_706645 ?auto_706652 ) ) ( not ( = ?auto_706645 ?auto_706653 ) ) ( not ( = ?auto_706645 ?auto_706654 ) ) ( not ( = ?auto_706645 ?auto_706655 ) ) ( not ( = ?auto_706645 ?auto_706656 ) ) ( not ( = ?auto_706645 ?auto_706657 ) ) ( not ( = ?auto_706645 ?auto_706658 ) ) ( not ( = ?auto_706645 ?auto_706659 ) ) ( not ( = ?auto_706645 ?auto_706660 ) ) ( not ( = ?auto_706646 ?auto_706647 ) ) ( not ( = ?auto_706646 ?auto_706648 ) ) ( not ( = ?auto_706646 ?auto_706649 ) ) ( not ( = ?auto_706646 ?auto_706650 ) ) ( not ( = ?auto_706646 ?auto_706651 ) ) ( not ( = ?auto_706646 ?auto_706652 ) ) ( not ( = ?auto_706646 ?auto_706653 ) ) ( not ( = ?auto_706646 ?auto_706654 ) ) ( not ( = ?auto_706646 ?auto_706655 ) ) ( not ( = ?auto_706646 ?auto_706656 ) ) ( not ( = ?auto_706646 ?auto_706657 ) ) ( not ( = ?auto_706646 ?auto_706658 ) ) ( not ( = ?auto_706646 ?auto_706659 ) ) ( not ( = ?auto_706646 ?auto_706660 ) ) ( not ( = ?auto_706647 ?auto_706648 ) ) ( not ( = ?auto_706647 ?auto_706649 ) ) ( not ( = ?auto_706647 ?auto_706650 ) ) ( not ( = ?auto_706647 ?auto_706651 ) ) ( not ( = ?auto_706647 ?auto_706652 ) ) ( not ( = ?auto_706647 ?auto_706653 ) ) ( not ( = ?auto_706647 ?auto_706654 ) ) ( not ( = ?auto_706647 ?auto_706655 ) ) ( not ( = ?auto_706647 ?auto_706656 ) ) ( not ( = ?auto_706647 ?auto_706657 ) ) ( not ( = ?auto_706647 ?auto_706658 ) ) ( not ( = ?auto_706647 ?auto_706659 ) ) ( not ( = ?auto_706647 ?auto_706660 ) ) ( not ( = ?auto_706648 ?auto_706649 ) ) ( not ( = ?auto_706648 ?auto_706650 ) ) ( not ( = ?auto_706648 ?auto_706651 ) ) ( not ( = ?auto_706648 ?auto_706652 ) ) ( not ( = ?auto_706648 ?auto_706653 ) ) ( not ( = ?auto_706648 ?auto_706654 ) ) ( not ( = ?auto_706648 ?auto_706655 ) ) ( not ( = ?auto_706648 ?auto_706656 ) ) ( not ( = ?auto_706648 ?auto_706657 ) ) ( not ( = ?auto_706648 ?auto_706658 ) ) ( not ( = ?auto_706648 ?auto_706659 ) ) ( not ( = ?auto_706648 ?auto_706660 ) ) ( not ( = ?auto_706649 ?auto_706650 ) ) ( not ( = ?auto_706649 ?auto_706651 ) ) ( not ( = ?auto_706649 ?auto_706652 ) ) ( not ( = ?auto_706649 ?auto_706653 ) ) ( not ( = ?auto_706649 ?auto_706654 ) ) ( not ( = ?auto_706649 ?auto_706655 ) ) ( not ( = ?auto_706649 ?auto_706656 ) ) ( not ( = ?auto_706649 ?auto_706657 ) ) ( not ( = ?auto_706649 ?auto_706658 ) ) ( not ( = ?auto_706649 ?auto_706659 ) ) ( not ( = ?auto_706649 ?auto_706660 ) ) ( not ( = ?auto_706650 ?auto_706651 ) ) ( not ( = ?auto_706650 ?auto_706652 ) ) ( not ( = ?auto_706650 ?auto_706653 ) ) ( not ( = ?auto_706650 ?auto_706654 ) ) ( not ( = ?auto_706650 ?auto_706655 ) ) ( not ( = ?auto_706650 ?auto_706656 ) ) ( not ( = ?auto_706650 ?auto_706657 ) ) ( not ( = ?auto_706650 ?auto_706658 ) ) ( not ( = ?auto_706650 ?auto_706659 ) ) ( not ( = ?auto_706650 ?auto_706660 ) ) ( not ( = ?auto_706651 ?auto_706652 ) ) ( not ( = ?auto_706651 ?auto_706653 ) ) ( not ( = ?auto_706651 ?auto_706654 ) ) ( not ( = ?auto_706651 ?auto_706655 ) ) ( not ( = ?auto_706651 ?auto_706656 ) ) ( not ( = ?auto_706651 ?auto_706657 ) ) ( not ( = ?auto_706651 ?auto_706658 ) ) ( not ( = ?auto_706651 ?auto_706659 ) ) ( not ( = ?auto_706651 ?auto_706660 ) ) ( not ( = ?auto_706652 ?auto_706653 ) ) ( not ( = ?auto_706652 ?auto_706654 ) ) ( not ( = ?auto_706652 ?auto_706655 ) ) ( not ( = ?auto_706652 ?auto_706656 ) ) ( not ( = ?auto_706652 ?auto_706657 ) ) ( not ( = ?auto_706652 ?auto_706658 ) ) ( not ( = ?auto_706652 ?auto_706659 ) ) ( not ( = ?auto_706652 ?auto_706660 ) ) ( not ( = ?auto_706653 ?auto_706654 ) ) ( not ( = ?auto_706653 ?auto_706655 ) ) ( not ( = ?auto_706653 ?auto_706656 ) ) ( not ( = ?auto_706653 ?auto_706657 ) ) ( not ( = ?auto_706653 ?auto_706658 ) ) ( not ( = ?auto_706653 ?auto_706659 ) ) ( not ( = ?auto_706653 ?auto_706660 ) ) ( not ( = ?auto_706654 ?auto_706655 ) ) ( not ( = ?auto_706654 ?auto_706656 ) ) ( not ( = ?auto_706654 ?auto_706657 ) ) ( not ( = ?auto_706654 ?auto_706658 ) ) ( not ( = ?auto_706654 ?auto_706659 ) ) ( not ( = ?auto_706654 ?auto_706660 ) ) ( not ( = ?auto_706655 ?auto_706656 ) ) ( not ( = ?auto_706655 ?auto_706657 ) ) ( not ( = ?auto_706655 ?auto_706658 ) ) ( not ( = ?auto_706655 ?auto_706659 ) ) ( not ( = ?auto_706655 ?auto_706660 ) ) ( not ( = ?auto_706656 ?auto_706657 ) ) ( not ( = ?auto_706656 ?auto_706658 ) ) ( not ( = ?auto_706656 ?auto_706659 ) ) ( not ( = ?auto_706656 ?auto_706660 ) ) ( not ( = ?auto_706657 ?auto_706658 ) ) ( not ( = ?auto_706657 ?auto_706659 ) ) ( not ( = ?auto_706657 ?auto_706660 ) ) ( not ( = ?auto_706658 ?auto_706659 ) ) ( not ( = ?auto_706658 ?auto_706660 ) ) ( not ( = ?auto_706659 ?auto_706660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_706659 ?auto_706660 )
      ( !STACK ?auto_706659 ?auto_706658 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706707 - BLOCK
      ?auto_706708 - BLOCK
      ?auto_706709 - BLOCK
      ?auto_706710 - BLOCK
      ?auto_706711 - BLOCK
      ?auto_706712 - BLOCK
      ?auto_706713 - BLOCK
      ?auto_706714 - BLOCK
      ?auto_706715 - BLOCK
      ?auto_706716 - BLOCK
      ?auto_706717 - BLOCK
      ?auto_706718 - BLOCK
      ?auto_706719 - BLOCK
      ?auto_706720 - BLOCK
      ?auto_706721 - BLOCK
    )
    :vars
    (
      ?auto_706722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706721 ?auto_706722 ) ( ON-TABLE ?auto_706707 ) ( ON ?auto_706708 ?auto_706707 ) ( ON ?auto_706709 ?auto_706708 ) ( ON ?auto_706710 ?auto_706709 ) ( ON ?auto_706711 ?auto_706710 ) ( ON ?auto_706712 ?auto_706711 ) ( ON ?auto_706713 ?auto_706712 ) ( ON ?auto_706714 ?auto_706713 ) ( ON ?auto_706715 ?auto_706714 ) ( ON ?auto_706716 ?auto_706715 ) ( ON ?auto_706717 ?auto_706716 ) ( ON ?auto_706718 ?auto_706717 ) ( ON ?auto_706719 ?auto_706718 ) ( not ( = ?auto_706707 ?auto_706708 ) ) ( not ( = ?auto_706707 ?auto_706709 ) ) ( not ( = ?auto_706707 ?auto_706710 ) ) ( not ( = ?auto_706707 ?auto_706711 ) ) ( not ( = ?auto_706707 ?auto_706712 ) ) ( not ( = ?auto_706707 ?auto_706713 ) ) ( not ( = ?auto_706707 ?auto_706714 ) ) ( not ( = ?auto_706707 ?auto_706715 ) ) ( not ( = ?auto_706707 ?auto_706716 ) ) ( not ( = ?auto_706707 ?auto_706717 ) ) ( not ( = ?auto_706707 ?auto_706718 ) ) ( not ( = ?auto_706707 ?auto_706719 ) ) ( not ( = ?auto_706707 ?auto_706720 ) ) ( not ( = ?auto_706707 ?auto_706721 ) ) ( not ( = ?auto_706707 ?auto_706722 ) ) ( not ( = ?auto_706708 ?auto_706709 ) ) ( not ( = ?auto_706708 ?auto_706710 ) ) ( not ( = ?auto_706708 ?auto_706711 ) ) ( not ( = ?auto_706708 ?auto_706712 ) ) ( not ( = ?auto_706708 ?auto_706713 ) ) ( not ( = ?auto_706708 ?auto_706714 ) ) ( not ( = ?auto_706708 ?auto_706715 ) ) ( not ( = ?auto_706708 ?auto_706716 ) ) ( not ( = ?auto_706708 ?auto_706717 ) ) ( not ( = ?auto_706708 ?auto_706718 ) ) ( not ( = ?auto_706708 ?auto_706719 ) ) ( not ( = ?auto_706708 ?auto_706720 ) ) ( not ( = ?auto_706708 ?auto_706721 ) ) ( not ( = ?auto_706708 ?auto_706722 ) ) ( not ( = ?auto_706709 ?auto_706710 ) ) ( not ( = ?auto_706709 ?auto_706711 ) ) ( not ( = ?auto_706709 ?auto_706712 ) ) ( not ( = ?auto_706709 ?auto_706713 ) ) ( not ( = ?auto_706709 ?auto_706714 ) ) ( not ( = ?auto_706709 ?auto_706715 ) ) ( not ( = ?auto_706709 ?auto_706716 ) ) ( not ( = ?auto_706709 ?auto_706717 ) ) ( not ( = ?auto_706709 ?auto_706718 ) ) ( not ( = ?auto_706709 ?auto_706719 ) ) ( not ( = ?auto_706709 ?auto_706720 ) ) ( not ( = ?auto_706709 ?auto_706721 ) ) ( not ( = ?auto_706709 ?auto_706722 ) ) ( not ( = ?auto_706710 ?auto_706711 ) ) ( not ( = ?auto_706710 ?auto_706712 ) ) ( not ( = ?auto_706710 ?auto_706713 ) ) ( not ( = ?auto_706710 ?auto_706714 ) ) ( not ( = ?auto_706710 ?auto_706715 ) ) ( not ( = ?auto_706710 ?auto_706716 ) ) ( not ( = ?auto_706710 ?auto_706717 ) ) ( not ( = ?auto_706710 ?auto_706718 ) ) ( not ( = ?auto_706710 ?auto_706719 ) ) ( not ( = ?auto_706710 ?auto_706720 ) ) ( not ( = ?auto_706710 ?auto_706721 ) ) ( not ( = ?auto_706710 ?auto_706722 ) ) ( not ( = ?auto_706711 ?auto_706712 ) ) ( not ( = ?auto_706711 ?auto_706713 ) ) ( not ( = ?auto_706711 ?auto_706714 ) ) ( not ( = ?auto_706711 ?auto_706715 ) ) ( not ( = ?auto_706711 ?auto_706716 ) ) ( not ( = ?auto_706711 ?auto_706717 ) ) ( not ( = ?auto_706711 ?auto_706718 ) ) ( not ( = ?auto_706711 ?auto_706719 ) ) ( not ( = ?auto_706711 ?auto_706720 ) ) ( not ( = ?auto_706711 ?auto_706721 ) ) ( not ( = ?auto_706711 ?auto_706722 ) ) ( not ( = ?auto_706712 ?auto_706713 ) ) ( not ( = ?auto_706712 ?auto_706714 ) ) ( not ( = ?auto_706712 ?auto_706715 ) ) ( not ( = ?auto_706712 ?auto_706716 ) ) ( not ( = ?auto_706712 ?auto_706717 ) ) ( not ( = ?auto_706712 ?auto_706718 ) ) ( not ( = ?auto_706712 ?auto_706719 ) ) ( not ( = ?auto_706712 ?auto_706720 ) ) ( not ( = ?auto_706712 ?auto_706721 ) ) ( not ( = ?auto_706712 ?auto_706722 ) ) ( not ( = ?auto_706713 ?auto_706714 ) ) ( not ( = ?auto_706713 ?auto_706715 ) ) ( not ( = ?auto_706713 ?auto_706716 ) ) ( not ( = ?auto_706713 ?auto_706717 ) ) ( not ( = ?auto_706713 ?auto_706718 ) ) ( not ( = ?auto_706713 ?auto_706719 ) ) ( not ( = ?auto_706713 ?auto_706720 ) ) ( not ( = ?auto_706713 ?auto_706721 ) ) ( not ( = ?auto_706713 ?auto_706722 ) ) ( not ( = ?auto_706714 ?auto_706715 ) ) ( not ( = ?auto_706714 ?auto_706716 ) ) ( not ( = ?auto_706714 ?auto_706717 ) ) ( not ( = ?auto_706714 ?auto_706718 ) ) ( not ( = ?auto_706714 ?auto_706719 ) ) ( not ( = ?auto_706714 ?auto_706720 ) ) ( not ( = ?auto_706714 ?auto_706721 ) ) ( not ( = ?auto_706714 ?auto_706722 ) ) ( not ( = ?auto_706715 ?auto_706716 ) ) ( not ( = ?auto_706715 ?auto_706717 ) ) ( not ( = ?auto_706715 ?auto_706718 ) ) ( not ( = ?auto_706715 ?auto_706719 ) ) ( not ( = ?auto_706715 ?auto_706720 ) ) ( not ( = ?auto_706715 ?auto_706721 ) ) ( not ( = ?auto_706715 ?auto_706722 ) ) ( not ( = ?auto_706716 ?auto_706717 ) ) ( not ( = ?auto_706716 ?auto_706718 ) ) ( not ( = ?auto_706716 ?auto_706719 ) ) ( not ( = ?auto_706716 ?auto_706720 ) ) ( not ( = ?auto_706716 ?auto_706721 ) ) ( not ( = ?auto_706716 ?auto_706722 ) ) ( not ( = ?auto_706717 ?auto_706718 ) ) ( not ( = ?auto_706717 ?auto_706719 ) ) ( not ( = ?auto_706717 ?auto_706720 ) ) ( not ( = ?auto_706717 ?auto_706721 ) ) ( not ( = ?auto_706717 ?auto_706722 ) ) ( not ( = ?auto_706718 ?auto_706719 ) ) ( not ( = ?auto_706718 ?auto_706720 ) ) ( not ( = ?auto_706718 ?auto_706721 ) ) ( not ( = ?auto_706718 ?auto_706722 ) ) ( not ( = ?auto_706719 ?auto_706720 ) ) ( not ( = ?auto_706719 ?auto_706721 ) ) ( not ( = ?auto_706719 ?auto_706722 ) ) ( not ( = ?auto_706720 ?auto_706721 ) ) ( not ( = ?auto_706720 ?auto_706722 ) ) ( not ( = ?auto_706721 ?auto_706722 ) ) ( CLEAR ?auto_706719 ) ( ON ?auto_706720 ?auto_706721 ) ( CLEAR ?auto_706720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_706707 ?auto_706708 ?auto_706709 ?auto_706710 ?auto_706711 ?auto_706712 ?auto_706713 ?auto_706714 ?auto_706715 ?auto_706716 ?auto_706717 ?auto_706718 ?auto_706719 ?auto_706720 )
      ( MAKE-15PILE ?auto_706707 ?auto_706708 ?auto_706709 ?auto_706710 ?auto_706711 ?auto_706712 ?auto_706713 ?auto_706714 ?auto_706715 ?auto_706716 ?auto_706717 ?auto_706718 ?auto_706719 ?auto_706720 ?auto_706721 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706769 - BLOCK
      ?auto_706770 - BLOCK
      ?auto_706771 - BLOCK
      ?auto_706772 - BLOCK
      ?auto_706773 - BLOCK
      ?auto_706774 - BLOCK
      ?auto_706775 - BLOCK
      ?auto_706776 - BLOCK
      ?auto_706777 - BLOCK
      ?auto_706778 - BLOCK
      ?auto_706779 - BLOCK
      ?auto_706780 - BLOCK
      ?auto_706781 - BLOCK
      ?auto_706782 - BLOCK
      ?auto_706783 - BLOCK
    )
    :vars
    (
      ?auto_706784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706783 ?auto_706784 ) ( ON-TABLE ?auto_706769 ) ( ON ?auto_706770 ?auto_706769 ) ( ON ?auto_706771 ?auto_706770 ) ( ON ?auto_706772 ?auto_706771 ) ( ON ?auto_706773 ?auto_706772 ) ( ON ?auto_706774 ?auto_706773 ) ( ON ?auto_706775 ?auto_706774 ) ( ON ?auto_706776 ?auto_706775 ) ( ON ?auto_706777 ?auto_706776 ) ( ON ?auto_706778 ?auto_706777 ) ( ON ?auto_706779 ?auto_706778 ) ( ON ?auto_706780 ?auto_706779 ) ( not ( = ?auto_706769 ?auto_706770 ) ) ( not ( = ?auto_706769 ?auto_706771 ) ) ( not ( = ?auto_706769 ?auto_706772 ) ) ( not ( = ?auto_706769 ?auto_706773 ) ) ( not ( = ?auto_706769 ?auto_706774 ) ) ( not ( = ?auto_706769 ?auto_706775 ) ) ( not ( = ?auto_706769 ?auto_706776 ) ) ( not ( = ?auto_706769 ?auto_706777 ) ) ( not ( = ?auto_706769 ?auto_706778 ) ) ( not ( = ?auto_706769 ?auto_706779 ) ) ( not ( = ?auto_706769 ?auto_706780 ) ) ( not ( = ?auto_706769 ?auto_706781 ) ) ( not ( = ?auto_706769 ?auto_706782 ) ) ( not ( = ?auto_706769 ?auto_706783 ) ) ( not ( = ?auto_706769 ?auto_706784 ) ) ( not ( = ?auto_706770 ?auto_706771 ) ) ( not ( = ?auto_706770 ?auto_706772 ) ) ( not ( = ?auto_706770 ?auto_706773 ) ) ( not ( = ?auto_706770 ?auto_706774 ) ) ( not ( = ?auto_706770 ?auto_706775 ) ) ( not ( = ?auto_706770 ?auto_706776 ) ) ( not ( = ?auto_706770 ?auto_706777 ) ) ( not ( = ?auto_706770 ?auto_706778 ) ) ( not ( = ?auto_706770 ?auto_706779 ) ) ( not ( = ?auto_706770 ?auto_706780 ) ) ( not ( = ?auto_706770 ?auto_706781 ) ) ( not ( = ?auto_706770 ?auto_706782 ) ) ( not ( = ?auto_706770 ?auto_706783 ) ) ( not ( = ?auto_706770 ?auto_706784 ) ) ( not ( = ?auto_706771 ?auto_706772 ) ) ( not ( = ?auto_706771 ?auto_706773 ) ) ( not ( = ?auto_706771 ?auto_706774 ) ) ( not ( = ?auto_706771 ?auto_706775 ) ) ( not ( = ?auto_706771 ?auto_706776 ) ) ( not ( = ?auto_706771 ?auto_706777 ) ) ( not ( = ?auto_706771 ?auto_706778 ) ) ( not ( = ?auto_706771 ?auto_706779 ) ) ( not ( = ?auto_706771 ?auto_706780 ) ) ( not ( = ?auto_706771 ?auto_706781 ) ) ( not ( = ?auto_706771 ?auto_706782 ) ) ( not ( = ?auto_706771 ?auto_706783 ) ) ( not ( = ?auto_706771 ?auto_706784 ) ) ( not ( = ?auto_706772 ?auto_706773 ) ) ( not ( = ?auto_706772 ?auto_706774 ) ) ( not ( = ?auto_706772 ?auto_706775 ) ) ( not ( = ?auto_706772 ?auto_706776 ) ) ( not ( = ?auto_706772 ?auto_706777 ) ) ( not ( = ?auto_706772 ?auto_706778 ) ) ( not ( = ?auto_706772 ?auto_706779 ) ) ( not ( = ?auto_706772 ?auto_706780 ) ) ( not ( = ?auto_706772 ?auto_706781 ) ) ( not ( = ?auto_706772 ?auto_706782 ) ) ( not ( = ?auto_706772 ?auto_706783 ) ) ( not ( = ?auto_706772 ?auto_706784 ) ) ( not ( = ?auto_706773 ?auto_706774 ) ) ( not ( = ?auto_706773 ?auto_706775 ) ) ( not ( = ?auto_706773 ?auto_706776 ) ) ( not ( = ?auto_706773 ?auto_706777 ) ) ( not ( = ?auto_706773 ?auto_706778 ) ) ( not ( = ?auto_706773 ?auto_706779 ) ) ( not ( = ?auto_706773 ?auto_706780 ) ) ( not ( = ?auto_706773 ?auto_706781 ) ) ( not ( = ?auto_706773 ?auto_706782 ) ) ( not ( = ?auto_706773 ?auto_706783 ) ) ( not ( = ?auto_706773 ?auto_706784 ) ) ( not ( = ?auto_706774 ?auto_706775 ) ) ( not ( = ?auto_706774 ?auto_706776 ) ) ( not ( = ?auto_706774 ?auto_706777 ) ) ( not ( = ?auto_706774 ?auto_706778 ) ) ( not ( = ?auto_706774 ?auto_706779 ) ) ( not ( = ?auto_706774 ?auto_706780 ) ) ( not ( = ?auto_706774 ?auto_706781 ) ) ( not ( = ?auto_706774 ?auto_706782 ) ) ( not ( = ?auto_706774 ?auto_706783 ) ) ( not ( = ?auto_706774 ?auto_706784 ) ) ( not ( = ?auto_706775 ?auto_706776 ) ) ( not ( = ?auto_706775 ?auto_706777 ) ) ( not ( = ?auto_706775 ?auto_706778 ) ) ( not ( = ?auto_706775 ?auto_706779 ) ) ( not ( = ?auto_706775 ?auto_706780 ) ) ( not ( = ?auto_706775 ?auto_706781 ) ) ( not ( = ?auto_706775 ?auto_706782 ) ) ( not ( = ?auto_706775 ?auto_706783 ) ) ( not ( = ?auto_706775 ?auto_706784 ) ) ( not ( = ?auto_706776 ?auto_706777 ) ) ( not ( = ?auto_706776 ?auto_706778 ) ) ( not ( = ?auto_706776 ?auto_706779 ) ) ( not ( = ?auto_706776 ?auto_706780 ) ) ( not ( = ?auto_706776 ?auto_706781 ) ) ( not ( = ?auto_706776 ?auto_706782 ) ) ( not ( = ?auto_706776 ?auto_706783 ) ) ( not ( = ?auto_706776 ?auto_706784 ) ) ( not ( = ?auto_706777 ?auto_706778 ) ) ( not ( = ?auto_706777 ?auto_706779 ) ) ( not ( = ?auto_706777 ?auto_706780 ) ) ( not ( = ?auto_706777 ?auto_706781 ) ) ( not ( = ?auto_706777 ?auto_706782 ) ) ( not ( = ?auto_706777 ?auto_706783 ) ) ( not ( = ?auto_706777 ?auto_706784 ) ) ( not ( = ?auto_706778 ?auto_706779 ) ) ( not ( = ?auto_706778 ?auto_706780 ) ) ( not ( = ?auto_706778 ?auto_706781 ) ) ( not ( = ?auto_706778 ?auto_706782 ) ) ( not ( = ?auto_706778 ?auto_706783 ) ) ( not ( = ?auto_706778 ?auto_706784 ) ) ( not ( = ?auto_706779 ?auto_706780 ) ) ( not ( = ?auto_706779 ?auto_706781 ) ) ( not ( = ?auto_706779 ?auto_706782 ) ) ( not ( = ?auto_706779 ?auto_706783 ) ) ( not ( = ?auto_706779 ?auto_706784 ) ) ( not ( = ?auto_706780 ?auto_706781 ) ) ( not ( = ?auto_706780 ?auto_706782 ) ) ( not ( = ?auto_706780 ?auto_706783 ) ) ( not ( = ?auto_706780 ?auto_706784 ) ) ( not ( = ?auto_706781 ?auto_706782 ) ) ( not ( = ?auto_706781 ?auto_706783 ) ) ( not ( = ?auto_706781 ?auto_706784 ) ) ( not ( = ?auto_706782 ?auto_706783 ) ) ( not ( = ?auto_706782 ?auto_706784 ) ) ( not ( = ?auto_706783 ?auto_706784 ) ) ( ON ?auto_706782 ?auto_706783 ) ( CLEAR ?auto_706780 ) ( ON ?auto_706781 ?auto_706782 ) ( CLEAR ?auto_706781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_706769 ?auto_706770 ?auto_706771 ?auto_706772 ?auto_706773 ?auto_706774 ?auto_706775 ?auto_706776 ?auto_706777 ?auto_706778 ?auto_706779 ?auto_706780 ?auto_706781 )
      ( MAKE-15PILE ?auto_706769 ?auto_706770 ?auto_706771 ?auto_706772 ?auto_706773 ?auto_706774 ?auto_706775 ?auto_706776 ?auto_706777 ?auto_706778 ?auto_706779 ?auto_706780 ?auto_706781 ?auto_706782 ?auto_706783 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706831 - BLOCK
      ?auto_706832 - BLOCK
      ?auto_706833 - BLOCK
      ?auto_706834 - BLOCK
      ?auto_706835 - BLOCK
      ?auto_706836 - BLOCK
      ?auto_706837 - BLOCK
      ?auto_706838 - BLOCK
      ?auto_706839 - BLOCK
      ?auto_706840 - BLOCK
      ?auto_706841 - BLOCK
      ?auto_706842 - BLOCK
      ?auto_706843 - BLOCK
      ?auto_706844 - BLOCK
      ?auto_706845 - BLOCK
    )
    :vars
    (
      ?auto_706846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706845 ?auto_706846 ) ( ON-TABLE ?auto_706831 ) ( ON ?auto_706832 ?auto_706831 ) ( ON ?auto_706833 ?auto_706832 ) ( ON ?auto_706834 ?auto_706833 ) ( ON ?auto_706835 ?auto_706834 ) ( ON ?auto_706836 ?auto_706835 ) ( ON ?auto_706837 ?auto_706836 ) ( ON ?auto_706838 ?auto_706837 ) ( ON ?auto_706839 ?auto_706838 ) ( ON ?auto_706840 ?auto_706839 ) ( ON ?auto_706841 ?auto_706840 ) ( not ( = ?auto_706831 ?auto_706832 ) ) ( not ( = ?auto_706831 ?auto_706833 ) ) ( not ( = ?auto_706831 ?auto_706834 ) ) ( not ( = ?auto_706831 ?auto_706835 ) ) ( not ( = ?auto_706831 ?auto_706836 ) ) ( not ( = ?auto_706831 ?auto_706837 ) ) ( not ( = ?auto_706831 ?auto_706838 ) ) ( not ( = ?auto_706831 ?auto_706839 ) ) ( not ( = ?auto_706831 ?auto_706840 ) ) ( not ( = ?auto_706831 ?auto_706841 ) ) ( not ( = ?auto_706831 ?auto_706842 ) ) ( not ( = ?auto_706831 ?auto_706843 ) ) ( not ( = ?auto_706831 ?auto_706844 ) ) ( not ( = ?auto_706831 ?auto_706845 ) ) ( not ( = ?auto_706831 ?auto_706846 ) ) ( not ( = ?auto_706832 ?auto_706833 ) ) ( not ( = ?auto_706832 ?auto_706834 ) ) ( not ( = ?auto_706832 ?auto_706835 ) ) ( not ( = ?auto_706832 ?auto_706836 ) ) ( not ( = ?auto_706832 ?auto_706837 ) ) ( not ( = ?auto_706832 ?auto_706838 ) ) ( not ( = ?auto_706832 ?auto_706839 ) ) ( not ( = ?auto_706832 ?auto_706840 ) ) ( not ( = ?auto_706832 ?auto_706841 ) ) ( not ( = ?auto_706832 ?auto_706842 ) ) ( not ( = ?auto_706832 ?auto_706843 ) ) ( not ( = ?auto_706832 ?auto_706844 ) ) ( not ( = ?auto_706832 ?auto_706845 ) ) ( not ( = ?auto_706832 ?auto_706846 ) ) ( not ( = ?auto_706833 ?auto_706834 ) ) ( not ( = ?auto_706833 ?auto_706835 ) ) ( not ( = ?auto_706833 ?auto_706836 ) ) ( not ( = ?auto_706833 ?auto_706837 ) ) ( not ( = ?auto_706833 ?auto_706838 ) ) ( not ( = ?auto_706833 ?auto_706839 ) ) ( not ( = ?auto_706833 ?auto_706840 ) ) ( not ( = ?auto_706833 ?auto_706841 ) ) ( not ( = ?auto_706833 ?auto_706842 ) ) ( not ( = ?auto_706833 ?auto_706843 ) ) ( not ( = ?auto_706833 ?auto_706844 ) ) ( not ( = ?auto_706833 ?auto_706845 ) ) ( not ( = ?auto_706833 ?auto_706846 ) ) ( not ( = ?auto_706834 ?auto_706835 ) ) ( not ( = ?auto_706834 ?auto_706836 ) ) ( not ( = ?auto_706834 ?auto_706837 ) ) ( not ( = ?auto_706834 ?auto_706838 ) ) ( not ( = ?auto_706834 ?auto_706839 ) ) ( not ( = ?auto_706834 ?auto_706840 ) ) ( not ( = ?auto_706834 ?auto_706841 ) ) ( not ( = ?auto_706834 ?auto_706842 ) ) ( not ( = ?auto_706834 ?auto_706843 ) ) ( not ( = ?auto_706834 ?auto_706844 ) ) ( not ( = ?auto_706834 ?auto_706845 ) ) ( not ( = ?auto_706834 ?auto_706846 ) ) ( not ( = ?auto_706835 ?auto_706836 ) ) ( not ( = ?auto_706835 ?auto_706837 ) ) ( not ( = ?auto_706835 ?auto_706838 ) ) ( not ( = ?auto_706835 ?auto_706839 ) ) ( not ( = ?auto_706835 ?auto_706840 ) ) ( not ( = ?auto_706835 ?auto_706841 ) ) ( not ( = ?auto_706835 ?auto_706842 ) ) ( not ( = ?auto_706835 ?auto_706843 ) ) ( not ( = ?auto_706835 ?auto_706844 ) ) ( not ( = ?auto_706835 ?auto_706845 ) ) ( not ( = ?auto_706835 ?auto_706846 ) ) ( not ( = ?auto_706836 ?auto_706837 ) ) ( not ( = ?auto_706836 ?auto_706838 ) ) ( not ( = ?auto_706836 ?auto_706839 ) ) ( not ( = ?auto_706836 ?auto_706840 ) ) ( not ( = ?auto_706836 ?auto_706841 ) ) ( not ( = ?auto_706836 ?auto_706842 ) ) ( not ( = ?auto_706836 ?auto_706843 ) ) ( not ( = ?auto_706836 ?auto_706844 ) ) ( not ( = ?auto_706836 ?auto_706845 ) ) ( not ( = ?auto_706836 ?auto_706846 ) ) ( not ( = ?auto_706837 ?auto_706838 ) ) ( not ( = ?auto_706837 ?auto_706839 ) ) ( not ( = ?auto_706837 ?auto_706840 ) ) ( not ( = ?auto_706837 ?auto_706841 ) ) ( not ( = ?auto_706837 ?auto_706842 ) ) ( not ( = ?auto_706837 ?auto_706843 ) ) ( not ( = ?auto_706837 ?auto_706844 ) ) ( not ( = ?auto_706837 ?auto_706845 ) ) ( not ( = ?auto_706837 ?auto_706846 ) ) ( not ( = ?auto_706838 ?auto_706839 ) ) ( not ( = ?auto_706838 ?auto_706840 ) ) ( not ( = ?auto_706838 ?auto_706841 ) ) ( not ( = ?auto_706838 ?auto_706842 ) ) ( not ( = ?auto_706838 ?auto_706843 ) ) ( not ( = ?auto_706838 ?auto_706844 ) ) ( not ( = ?auto_706838 ?auto_706845 ) ) ( not ( = ?auto_706838 ?auto_706846 ) ) ( not ( = ?auto_706839 ?auto_706840 ) ) ( not ( = ?auto_706839 ?auto_706841 ) ) ( not ( = ?auto_706839 ?auto_706842 ) ) ( not ( = ?auto_706839 ?auto_706843 ) ) ( not ( = ?auto_706839 ?auto_706844 ) ) ( not ( = ?auto_706839 ?auto_706845 ) ) ( not ( = ?auto_706839 ?auto_706846 ) ) ( not ( = ?auto_706840 ?auto_706841 ) ) ( not ( = ?auto_706840 ?auto_706842 ) ) ( not ( = ?auto_706840 ?auto_706843 ) ) ( not ( = ?auto_706840 ?auto_706844 ) ) ( not ( = ?auto_706840 ?auto_706845 ) ) ( not ( = ?auto_706840 ?auto_706846 ) ) ( not ( = ?auto_706841 ?auto_706842 ) ) ( not ( = ?auto_706841 ?auto_706843 ) ) ( not ( = ?auto_706841 ?auto_706844 ) ) ( not ( = ?auto_706841 ?auto_706845 ) ) ( not ( = ?auto_706841 ?auto_706846 ) ) ( not ( = ?auto_706842 ?auto_706843 ) ) ( not ( = ?auto_706842 ?auto_706844 ) ) ( not ( = ?auto_706842 ?auto_706845 ) ) ( not ( = ?auto_706842 ?auto_706846 ) ) ( not ( = ?auto_706843 ?auto_706844 ) ) ( not ( = ?auto_706843 ?auto_706845 ) ) ( not ( = ?auto_706843 ?auto_706846 ) ) ( not ( = ?auto_706844 ?auto_706845 ) ) ( not ( = ?auto_706844 ?auto_706846 ) ) ( not ( = ?auto_706845 ?auto_706846 ) ) ( ON ?auto_706844 ?auto_706845 ) ( ON ?auto_706843 ?auto_706844 ) ( CLEAR ?auto_706841 ) ( ON ?auto_706842 ?auto_706843 ) ( CLEAR ?auto_706842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_706831 ?auto_706832 ?auto_706833 ?auto_706834 ?auto_706835 ?auto_706836 ?auto_706837 ?auto_706838 ?auto_706839 ?auto_706840 ?auto_706841 ?auto_706842 )
      ( MAKE-15PILE ?auto_706831 ?auto_706832 ?auto_706833 ?auto_706834 ?auto_706835 ?auto_706836 ?auto_706837 ?auto_706838 ?auto_706839 ?auto_706840 ?auto_706841 ?auto_706842 ?auto_706843 ?auto_706844 ?auto_706845 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706893 - BLOCK
      ?auto_706894 - BLOCK
      ?auto_706895 - BLOCK
      ?auto_706896 - BLOCK
      ?auto_706897 - BLOCK
      ?auto_706898 - BLOCK
      ?auto_706899 - BLOCK
      ?auto_706900 - BLOCK
      ?auto_706901 - BLOCK
      ?auto_706902 - BLOCK
      ?auto_706903 - BLOCK
      ?auto_706904 - BLOCK
      ?auto_706905 - BLOCK
      ?auto_706906 - BLOCK
      ?auto_706907 - BLOCK
    )
    :vars
    (
      ?auto_706908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706907 ?auto_706908 ) ( ON-TABLE ?auto_706893 ) ( ON ?auto_706894 ?auto_706893 ) ( ON ?auto_706895 ?auto_706894 ) ( ON ?auto_706896 ?auto_706895 ) ( ON ?auto_706897 ?auto_706896 ) ( ON ?auto_706898 ?auto_706897 ) ( ON ?auto_706899 ?auto_706898 ) ( ON ?auto_706900 ?auto_706899 ) ( ON ?auto_706901 ?auto_706900 ) ( ON ?auto_706902 ?auto_706901 ) ( not ( = ?auto_706893 ?auto_706894 ) ) ( not ( = ?auto_706893 ?auto_706895 ) ) ( not ( = ?auto_706893 ?auto_706896 ) ) ( not ( = ?auto_706893 ?auto_706897 ) ) ( not ( = ?auto_706893 ?auto_706898 ) ) ( not ( = ?auto_706893 ?auto_706899 ) ) ( not ( = ?auto_706893 ?auto_706900 ) ) ( not ( = ?auto_706893 ?auto_706901 ) ) ( not ( = ?auto_706893 ?auto_706902 ) ) ( not ( = ?auto_706893 ?auto_706903 ) ) ( not ( = ?auto_706893 ?auto_706904 ) ) ( not ( = ?auto_706893 ?auto_706905 ) ) ( not ( = ?auto_706893 ?auto_706906 ) ) ( not ( = ?auto_706893 ?auto_706907 ) ) ( not ( = ?auto_706893 ?auto_706908 ) ) ( not ( = ?auto_706894 ?auto_706895 ) ) ( not ( = ?auto_706894 ?auto_706896 ) ) ( not ( = ?auto_706894 ?auto_706897 ) ) ( not ( = ?auto_706894 ?auto_706898 ) ) ( not ( = ?auto_706894 ?auto_706899 ) ) ( not ( = ?auto_706894 ?auto_706900 ) ) ( not ( = ?auto_706894 ?auto_706901 ) ) ( not ( = ?auto_706894 ?auto_706902 ) ) ( not ( = ?auto_706894 ?auto_706903 ) ) ( not ( = ?auto_706894 ?auto_706904 ) ) ( not ( = ?auto_706894 ?auto_706905 ) ) ( not ( = ?auto_706894 ?auto_706906 ) ) ( not ( = ?auto_706894 ?auto_706907 ) ) ( not ( = ?auto_706894 ?auto_706908 ) ) ( not ( = ?auto_706895 ?auto_706896 ) ) ( not ( = ?auto_706895 ?auto_706897 ) ) ( not ( = ?auto_706895 ?auto_706898 ) ) ( not ( = ?auto_706895 ?auto_706899 ) ) ( not ( = ?auto_706895 ?auto_706900 ) ) ( not ( = ?auto_706895 ?auto_706901 ) ) ( not ( = ?auto_706895 ?auto_706902 ) ) ( not ( = ?auto_706895 ?auto_706903 ) ) ( not ( = ?auto_706895 ?auto_706904 ) ) ( not ( = ?auto_706895 ?auto_706905 ) ) ( not ( = ?auto_706895 ?auto_706906 ) ) ( not ( = ?auto_706895 ?auto_706907 ) ) ( not ( = ?auto_706895 ?auto_706908 ) ) ( not ( = ?auto_706896 ?auto_706897 ) ) ( not ( = ?auto_706896 ?auto_706898 ) ) ( not ( = ?auto_706896 ?auto_706899 ) ) ( not ( = ?auto_706896 ?auto_706900 ) ) ( not ( = ?auto_706896 ?auto_706901 ) ) ( not ( = ?auto_706896 ?auto_706902 ) ) ( not ( = ?auto_706896 ?auto_706903 ) ) ( not ( = ?auto_706896 ?auto_706904 ) ) ( not ( = ?auto_706896 ?auto_706905 ) ) ( not ( = ?auto_706896 ?auto_706906 ) ) ( not ( = ?auto_706896 ?auto_706907 ) ) ( not ( = ?auto_706896 ?auto_706908 ) ) ( not ( = ?auto_706897 ?auto_706898 ) ) ( not ( = ?auto_706897 ?auto_706899 ) ) ( not ( = ?auto_706897 ?auto_706900 ) ) ( not ( = ?auto_706897 ?auto_706901 ) ) ( not ( = ?auto_706897 ?auto_706902 ) ) ( not ( = ?auto_706897 ?auto_706903 ) ) ( not ( = ?auto_706897 ?auto_706904 ) ) ( not ( = ?auto_706897 ?auto_706905 ) ) ( not ( = ?auto_706897 ?auto_706906 ) ) ( not ( = ?auto_706897 ?auto_706907 ) ) ( not ( = ?auto_706897 ?auto_706908 ) ) ( not ( = ?auto_706898 ?auto_706899 ) ) ( not ( = ?auto_706898 ?auto_706900 ) ) ( not ( = ?auto_706898 ?auto_706901 ) ) ( not ( = ?auto_706898 ?auto_706902 ) ) ( not ( = ?auto_706898 ?auto_706903 ) ) ( not ( = ?auto_706898 ?auto_706904 ) ) ( not ( = ?auto_706898 ?auto_706905 ) ) ( not ( = ?auto_706898 ?auto_706906 ) ) ( not ( = ?auto_706898 ?auto_706907 ) ) ( not ( = ?auto_706898 ?auto_706908 ) ) ( not ( = ?auto_706899 ?auto_706900 ) ) ( not ( = ?auto_706899 ?auto_706901 ) ) ( not ( = ?auto_706899 ?auto_706902 ) ) ( not ( = ?auto_706899 ?auto_706903 ) ) ( not ( = ?auto_706899 ?auto_706904 ) ) ( not ( = ?auto_706899 ?auto_706905 ) ) ( not ( = ?auto_706899 ?auto_706906 ) ) ( not ( = ?auto_706899 ?auto_706907 ) ) ( not ( = ?auto_706899 ?auto_706908 ) ) ( not ( = ?auto_706900 ?auto_706901 ) ) ( not ( = ?auto_706900 ?auto_706902 ) ) ( not ( = ?auto_706900 ?auto_706903 ) ) ( not ( = ?auto_706900 ?auto_706904 ) ) ( not ( = ?auto_706900 ?auto_706905 ) ) ( not ( = ?auto_706900 ?auto_706906 ) ) ( not ( = ?auto_706900 ?auto_706907 ) ) ( not ( = ?auto_706900 ?auto_706908 ) ) ( not ( = ?auto_706901 ?auto_706902 ) ) ( not ( = ?auto_706901 ?auto_706903 ) ) ( not ( = ?auto_706901 ?auto_706904 ) ) ( not ( = ?auto_706901 ?auto_706905 ) ) ( not ( = ?auto_706901 ?auto_706906 ) ) ( not ( = ?auto_706901 ?auto_706907 ) ) ( not ( = ?auto_706901 ?auto_706908 ) ) ( not ( = ?auto_706902 ?auto_706903 ) ) ( not ( = ?auto_706902 ?auto_706904 ) ) ( not ( = ?auto_706902 ?auto_706905 ) ) ( not ( = ?auto_706902 ?auto_706906 ) ) ( not ( = ?auto_706902 ?auto_706907 ) ) ( not ( = ?auto_706902 ?auto_706908 ) ) ( not ( = ?auto_706903 ?auto_706904 ) ) ( not ( = ?auto_706903 ?auto_706905 ) ) ( not ( = ?auto_706903 ?auto_706906 ) ) ( not ( = ?auto_706903 ?auto_706907 ) ) ( not ( = ?auto_706903 ?auto_706908 ) ) ( not ( = ?auto_706904 ?auto_706905 ) ) ( not ( = ?auto_706904 ?auto_706906 ) ) ( not ( = ?auto_706904 ?auto_706907 ) ) ( not ( = ?auto_706904 ?auto_706908 ) ) ( not ( = ?auto_706905 ?auto_706906 ) ) ( not ( = ?auto_706905 ?auto_706907 ) ) ( not ( = ?auto_706905 ?auto_706908 ) ) ( not ( = ?auto_706906 ?auto_706907 ) ) ( not ( = ?auto_706906 ?auto_706908 ) ) ( not ( = ?auto_706907 ?auto_706908 ) ) ( ON ?auto_706906 ?auto_706907 ) ( ON ?auto_706905 ?auto_706906 ) ( ON ?auto_706904 ?auto_706905 ) ( CLEAR ?auto_706902 ) ( ON ?auto_706903 ?auto_706904 ) ( CLEAR ?auto_706903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_706893 ?auto_706894 ?auto_706895 ?auto_706896 ?auto_706897 ?auto_706898 ?auto_706899 ?auto_706900 ?auto_706901 ?auto_706902 ?auto_706903 )
      ( MAKE-15PILE ?auto_706893 ?auto_706894 ?auto_706895 ?auto_706896 ?auto_706897 ?auto_706898 ?auto_706899 ?auto_706900 ?auto_706901 ?auto_706902 ?auto_706903 ?auto_706904 ?auto_706905 ?auto_706906 ?auto_706907 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_706955 - BLOCK
      ?auto_706956 - BLOCK
      ?auto_706957 - BLOCK
      ?auto_706958 - BLOCK
      ?auto_706959 - BLOCK
      ?auto_706960 - BLOCK
      ?auto_706961 - BLOCK
      ?auto_706962 - BLOCK
      ?auto_706963 - BLOCK
      ?auto_706964 - BLOCK
      ?auto_706965 - BLOCK
      ?auto_706966 - BLOCK
      ?auto_706967 - BLOCK
      ?auto_706968 - BLOCK
      ?auto_706969 - BLOCK
    )
    :vars
    (
      ?auto_706970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_706969 ?auto_706970 ) ( ON-TABLE ?auto_706955 ) ( ON ?auto_706956 ?auto_706955 ) ( ON ?auto_706957 ?auto_706956 ) ( ON ?auto_706958 ?auto_706957 ) ( ON ?auto_706959 ?auto_706958 ) ( ON ?auto_706960 ?auto_706959 ) ( ON ?auto_706961 ?auto_706960 ) ( ON ?auto_706962 ?auto_706961 ) ( ON ?auto_706963 ?auto_706962 ) ( not ( = ?auto_706955 ?auto_706956 ) ) ( not ( = ?auto_706955 ?auto_706957 ) ) ( not ( = ?auto_706955 ?auto_706958 ) ) ( not ( = ?auto_706955 ?auto_706959 ) ) ( not ( = ?auto_706955 ?auto_706960 ) ) ( not ( = ?auto_706955 ?auto_706961 ) ) ( not ( = ?auto_706955 ?auto_706962 ) ) ( not ( = ?auto_706955 ?auto_706963 ) ) ( not ( = ?auto_706955 ?auto_706964 ) ) ( not ( = ?auto_706955 ?auto_706965 ) ) ( not ( = ?auto_706955 ?auto_706966 ) ) ( not ( = ?auto_706955 ?auto_706967 ) ) ( not ( = ?auto_706955 ?auto_706968 ) ) ( not ( = ?auto_706955 ?auto_706969 ) ) ( not ( = ?auto_706955 ?auto_706970 ) ) ( not ( = ?auto_706956 ?auto_706957 ) ) ( not ( = ?auto_706956 ?auto_706958 ) ) ( not ( = ?auto_706956 ?auto_706959 ) ) ( not ( = ?auto_706956 ?auto_706960 ) ) ( not ( = ?auto_706956 ?auto_706961 ) ) ( not ( = ?auto_706956 ?auto_706962 ) ) ( not ( = ?auto_706956 ?auto_706963 ) ) ( not ( = ?auto_706956 ?auto_706964 ) ) ( not ( = ?auto_706956 ?auto_706965 ) ) ( not ( = ?auto_706956 ?auto_706966 ) ) ( not ( = ?auto_706956 ?auto_706967 ) ) ( not ( = ?auto_706956 ?auto_706968 ) ) ( not ( = ?auto_706956 ?auto_706969 ) ) ( not ( = ?auto_706956 ?auto_706970 ) ) ( not ( = ?auto_706957 ?auto_706958 ) ) ( not ( = ?auto_706957 ?auto_706959 ) ) ( not ( = ?auto_706957 ?auto_706960 ) ) ( not ( = ?auto_706957 ?auto_706961 ) ) ( not ( = ?auto_706957 ?auto_706962 ) ) ( not ( = ?auto_706957 ?auto_706963 ) ) ( not ( = ?auto_706957 ?auto_706964 ) ) ( not ( = ?auto_706957 ?auto_706965 ) ) ( not ( = ?auto_706957 ?auto_706966 ) ) ( not ( = ?auto_706957 ?auto_706967 ) ) ( not ( = ?auto_706957 ?auto_706968 ) ) ( not ( = ?auto_706957 ?auto_706969 ) ) ( not ( = ?auto_706957 ?auto_706970 ) ) ( not ( = ?auto_706958 ?auto_706959 ) ) ( not ( = ?auto_706958 ?auto_706960 ) ) ( not ( = ?auto_706958 ?auto_706961 ) ) ( not ( = ?auto_706958 ?auto_706962 ) ) ( not ( = ?auto_706958 ?auto_706963 ) ) ( not ( = ?auto_706958 ?auto_706964 ) ) ( not ( = ?auto_706958 ?auto_706965 ) ) ( not ( = ?auto_706958 ?auto_706966 ) ) ( not ( = ?auto_706958 ?auto_706967 ) ) ( not ( = ?auto_706958 ?auto_706968 ) ) ( not ( = ?auto_706958 ?auto_706969 ) ) ( not ( = ?auto_706958 ?auto_706970 ) ) ( not ( = ?auto_706959 ?auto_706960 ) ) ( not ( = ?auto_706959 ?auto_706961 ) ) ( not ( = ?auto_706959 ?auto_706962 ) ) ( not ( = ?auto_706959 ?auto_706963 ) ) ( not ( = ?auto_706959 ?auto_706964 ) ) ( not ( = ?auto_706959 ?auto_706965 ) ) ( not ( = ?auto_706959 ?auto_706966 ) ) ( not ( = ?auto_706959 ?auto_706967 ) ) ( not ( = ?auto_706959 ?auto_706968 ) ) ( not ( = ?auto_706959 ?auto_706969 ) ) ( not ( = ?auto_706959 ?auto_706970 ) ) ( not ( = ?auto_706960 ?auto_706961 ) ) ( not ( = ?auto_706960 ?auto_706962 ) ) ( not ( = ?auto_706960 ?auto_706963 ) ) ( not ( = ?auto_706960 ?auto_706964 ) ) ( not ( = ?auto_706960 ?auto_706965 ) ) ( not ( = ?auto_706960 ?auto_706966 ) ) ( not ( = ?auto_706960 ?auto_706967 ) ) ( not ( = ?auto_706960 ?auto_706968 ) ) ( not ( = ?auto_706960 ?auto_706969 ) ) ( not ( = ?auto_706960 ?auto_706970 ) ) ( not ( = ?auto_706961 ?auto_706962 ) ) ( not ( = ?auto_706961 ?auto_706963 ) ) ( not ( = ?auto_706961 ?auto_706964 ) ) ( not ( = ?auto_706961 ?auto_706965 ) ) ( not ( = ?auto_706961 ?auto_706966 ) ) ( not ( = ?auto_706961 ?auto_706967 ) ) ( not ( = ?auto_706961 ?auto_706968 ) ) ( not ( = ?auto_706961 ?auto_706969 ) ) ( not ( = ?auto_706961 ?auto_706970 ) ) ( not ( = ?auto_706962 ?auto_706963 ) ) ( not ( = ?auto_706962 ?auto_706964 ) ) ( not ( = ?auto_706962 ?auto_706965 ) ) ( not ( = ?auto_706962 ?auto_706966 ) ) ( not ( = ?auto_706962 ?auto_706967 ) ) ( not ( = ?auto_706962 ?auto_706968 ) ) ( not ( = ?auto_706962 ?auto_706969 ) ) ( not ( = ?auto_706962 ?auto_706970 ) ) ( not ( = ?auto_706963 ?auto_706964 ) ) ( not ( = ?auto_706963 ?auto_706965 ) ) ( not ( = ?auto_706963 ?auto_706966 ) ) ( not ( = ?auto_706963 ?auto_706967 ) ) ( not ( = ?auto_706963 ?auto_706968 ) ) ( not ( = ?auto_706963 ?auto_706969 ) ) ( not ( = ?auto_706963 ?auto_706970 ) ) ( not ( = ?auto_706964 ?auto_706965 ) ) ( not ( = ?auto_706964 ?auto_706966 ) ) ( not ( = ?auto_706964 ?auto_706967 ) ) ( not ( = ?auto_706964 ?auto_706968 ) ) ( not ( = ?auto_706964 ?auto_706969 ) ) ( not ( = ?auto_706964 ?auto_706970 ) ) ( not ( = ?auto_706965 ?auto_706966 ) ) ( not ( = ?auto_706965 ?auto_706967 ) ) ( not ( = ?auto_706965 ?auto_706968 ) ) ( not ( = ?auto_706965 ?auto_706969 ) ) ( not ( = ?auto_706965 ?auto_706970 ) ) ( not ( = ?auto_706966 ?auto_706967 ) ) ( not ( = ?auto_706966 ?auto_706968 ) ) ( not ( = ?auto_706966 ?auto_706969 ) ) ( not ( = ?auto_706966 ?auto_706970 ) ) ( not ( = ?auto_706967 ?auto_706968 ) ) ( not ( = ?auto_706967 ?auto_706969 ) ) ( not ( = ?auto_706967 ?auto_706970 ) ) ( not ( = ?auto_706968 ?auto_706969 ) ) ( not ( = ?auto_706968 ?auto_706970 ) ) ( not ( = ?auto_706969 ?auto_706970 ) ) ( ON ?auto_706968 ?auto_706969 ) ( ON ?auto_706967 ?auto_706968 ) ( ON ?auto_706966 ?auto_706967 ) ( ON ?auto_706965 ?auto_706966 ) ( CLEAR ?auto_706963 ) ( ON ?auto_706964 ?auto_706965 ) ( CLEAR ?auto_706964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_706955 ?auto_706956 ?auto_706957 ?auto_706958 ?auto_706959 ?auto_706960 ?auto_706961 ?auto_706962 ?auto_706963 ?auto_706964 )
      ( MAKE-15PILE ?auto_706955 ?auto_706956 ?auto_706957 ?auto_706958 ?auto_706959 ?auto_706960 ?auto_706961 ?auto_706962 ?auto_706963 ?auto_706964 ?auto_706965 ?auto_706966 ?auto_706967 ?auto_706968 ?auto_706969 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707017 - BLOCK
      ?auto_707018 - BLOCK
      ?auto_707019 - BLOCK
      ?auto_707020 - BLOCK
      ?auto_707021 - BLOCK
      ?auto_707022 - BLOCK
      ?auto_707023 - BLOCK
      ?auto_707024 - BLOCK
      ?auto_707025 - BLOCK
      ?auto_707026 - BLOCK
      ?auto_707027 - BLOCK
      ?auto_707028 - BLOCK
      ?auto_707029 - BLOCK
      ?auto_707030 - BLOCK
      ?auto_707031 - BLOCK
    )
    :vars
    (
      ?auto_707032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707031 ?auto_707032 ) ( ON-TABLE ?auto_707017 ) ( ON ?auto_707018 ?auto_707017 ) ( ON ?auto_707019 ?auto_707018 ) ( ON ?auto_707020 ?auto_707019 ) ( ON ?auto_707021 ?auto_707020 ) ( ON ?auto_707022 ?auto_707021 ) ( ON ?auto_707023 ?auto_707022 ) ( ON ?auto_707024 ?auto_707023 ) ( not ( = ?auto_707017 ?auto_707018 ) ) ( not ( = ?auto_707017 ?auto_707019 ) ) ( not ( = ?auto_707017 ?auto_707020 ) ) ( not ( = ?auto_707017 ?auto_707021 ) ) ( not ( = ?auto_707017 ?auto_707022 ) ) ( not ( = ?auto_707017 ?auto_707023 ) ) ( not ( = ?auto_707017 ?auto_707024 ) ) ( not ( = ?auto_707017 ?auto_707025 ) ) ( not ( = ?auto_707017 ?auto_707026 ) ) ( not ( = ?auto_707017 ?auto_707027 ) ) ( not ( = ?auto_707017 ?auto_707028 ) ) ( not ( = ?auto_707017 ?auto_707029 ) ) ( not ( = ?auto_707017 ?auto_707030 ) ) ( not ( = ?auto_707017 ?auto_707031 ) ) ( not ( = ?auto_707017 ?auto_707032 ) ) ( not ( = ?auto_707018 ?auto_707019 ) ) ( not ( = ?auto_707018 ?auto_707020 ) ) ( not ( = ?auto_707018 ?auto_707021 ) ) ( not ( = ?auto_707018 ?auto_707022 ) ) ( not ( = ?auto_707018 ?auto_707023 ) ) ( not ( = ?auto_707018 ?auto_707024 ) ) ( not ( = ?auto_707018 ?auto_707025 ) ) ( not ( = ?auto_707018 ?auto_707026 ) ) ( not ( = ?auto_707018 ?auto_707027 ) ) ( not ( = ?auto_707018 ?auto_707028 ) ) ( not ( = ?auto_707018 ?auto_707029 ) ) ( not ( = ?auto_707018 ?auto_707030 ) ) ( not ( = ?auto_707018 ?auto_707031 ) ) ( not ( = ?auto_707018 ?auto_707032 ) ) ( not ( = ?auto_707019 ?auto_707020 ) ) ( not ( = ?auto_707019 ?auto_707021 ) ) ( not ( = ?auto_707019 ?auto_707022 ) ) ( not ( = ?auto_707019 ?auto_707023 ) ) ( not ( = ?auto_707019 ?auto_707024 ) ) ( not ( = ?auto_707019 ?auto_707025 ) ) ( not ( = ?auto_707019 ?auto_707026 ) ) ( not ( = ?auto_707019 ?auto_707027 ) ) ( not ( = ?auto_707019 ?auto_707028 ) ) ( not ( = ?auto_707019 ?auto_707029 ) ) ( not ( = ?auto_707019 ?auto_707030 ) ) ( not ( = ?auto_707019 ?auto_707031 ) ) ( not ( = ?auto_707019 ?auto_707032 ) ) ( not ( = ?auto_707020 ?auto_707021 ) ) ( not ( = ?auto_707020 ?auto_707022 ) ) ( not ( = ?auto_707020 ?auto_707023 ) ) ( not ( = ?auto_707020 ?auto_707024 ) ) ( not ( = ?auto_707020 ?auto_707025 ) ) ( not ( = ?auto_707020 ?auto_707026 ) ) ( not ( = ?auto_707020 ?auto_707027 ) ) ( not ( = ?auto_707020 ?auto_707028 ) ) ( not ( = ?auto_707020 ?auto_707029 ) ) ( not ( = ?auto_707020 ?auto_707030 ) ) ( not ( = ?auto_707020 ?auto_707031 ) ) ( not ( = ?auto_707020 ?auto_707032 ) ) ( not ( = ?auto_707021 ?auto_707022 ) ) ( not ( = ?auto_707021 ?auto_707023 ) ) ( not ( = ?auto_707021 ?auto_707024 ) ) ( not ( = ?auto_707021 ?auto_707025 ) ) ( not ( = ?auto_707021 ?auto_707026 ) ) ( not ( = ?auto_707021 ?auto_707027 ) ) ( not ( = ?auto_707021 ?auto_707028 ) ) ( not ( = ?auto_707021 ?auto_707029 ) ) ( not ( = ?auto_707021 ?auto_707030 ) ) ( not ( = ?auto_707021 ?auto_707031 ) ) ( not ( = ?auto_707021 ?auto_707032 ) ) ( not ( = ?auto_707022 ?auto_707023 ) ) ( not ( = ?auto_707022 ?auto_707024 ) ) ( not ( = ?auto_707022 ?auto_707025 ) ) ( not ( = ?auto_707022 ?auto_707026 ) ) ( not ( = ?auto_707022 ?auto_707027 ) ) ( not ( = ?auto_707022 ?auto_707028 ) ) ( not ( = ?auto_707022 ?auto_707029 ) ) ( not ( = ?auto_707022 ?auto_707030 ) ) ( not ( = ?auto_707022 ?auto_707031 ) ) ( not ( = ?auto_707022 ?auto_707032 ) ) ( not ( = ?auto_707023 ?auto_707024 ) ) ( not ( = ?auto_707023 ?auto_707025 ) ) ( not ( = ?auto_707023 ?auto_707026 ) ) ( not ( = ?auto_707023 ?auto_707027 ) ) ( not ( = ?auto_707023 ?auto_707028 ) ) ( not ( = ?auto_707023 ?auto_707029 ) ) ( not ( = ?auto_707023 ?auto_707030 ) ) ( not ( = ?auto_707023 ?auto_707031 ) ) ( not ( = ?auto_707023 ?auto_707032 ) ) ( not ( = ?auto_707024 ?auto_707025 ) ) ( not ( = ?auto_707024 ?auto_707026 ) ) ( not ( = ?auto_707024 ?auto_707027 ) ) ( not ( = ?auto_707024 ?auto_707028 ) ) ( not ( = ?auto_707024 ?auto_707029 ) ) ( not ( = ?auto_707024 ?auto_707030 ) ) ( not ( = ?auto_707024 ?auto_707031 ) ) ( not ( = ?auto_707024 ?auto_707032 ) ) ( not ( = ?auto_707025 ?auto_707026 ) ) ( not ( = ?auto_707025 ?auto_707027 ) ) ( not ( = ?auto_707025 ?auto_707028 ) ) ( not ( = ?auto_707025 ?auto_707029 ) ) ( not ( = ?auto_707025 ?auto_707030 ) ) ( not ( = ?auto_707025 ?auto_707031 ) ) ( not ( = ?auto_707025 ?auto_707032 ) ) ( not ( = ?auto_707026 ?auto_707027 ) ) ( not ( = ?auto_707026 ?auto_707028 ) ) ( not ( = ?auto_707026 ?auto_707029 ) ) ( not ( = ?auto_707026 ?auto_707030 ) ) ( not ( = ?auto_707026 ?auto_707031 ) ) ( not ( = ?auto_707026 ?auto_707032 ) ) ( not ( = ?auto_707027 ?auto_707028 ) ) ( not ( = ?auto_707027 ?auto_707029 ) ) ( not ( = ?auto_707027 ?auto_707030 ) ) ( not ( = ?auto_707027 ?auto_707031 ) ) ( not ( = ?auto_707027 ?auto_707032 ) ) ( not ( = ?auto_707028 ?auto_707029 ) ) ( not ( = ?auto_707028 ?auto_707030 ) ) ( not ( = ?auto_707028 ?auto_707031 ) ) ( not ( = ?auto_707028 ?auto_707032 ) ) ( not ( = ?auto_707029 ?auto_707030 ) ) ( not ( = ?auto_707029 ?auto_707031 ) ) ( not ( = ?auto_707029 ?auto_707032 ) ) ( not ( = ?auto_707030 ?auto_707031 ) ) ( not ( = ?auto_707030 ?auto_707032 ) ) ( not ( = ?auto_707031 ?auto_707032 ) ) ( ON ?auto_707030 ?auto_707031 ) ( ON ?auto_707029 ?auto_707030 ) ( ON ?auto_707028 ?auto_707029 ) ( ON ?auto_707027 ?auto_707028 ) ( ON ?auto_707026 ?auto_707027 ) ( CLEAR ?auto_707024 ) ( ON ?auto_707025 ?auto_707026 ) ( CLEAR ?auto_707025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_707017 ?auto_707018 ?auto_707019 ?auto_707020 ?auto_707021 ?auto_707022 ?auto_707023 ?auto_707024 ?auto_707025 )
      ( MAKE-15PILE ?auto_707017 ?auto_707018 ?auto_707019 ?auto_707020 ?auto_707021 ?auto_707022 ?auto_707023 ?auto_707024 ?auto_707025 ?auto_707026 ?auto_707027 ?auto_707028 ?auto_707029 ?auto_707030 ?auto_707031 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707079 - BLOCK
      ?auto_707080 - BLOCK
      ?auto_707081 - BLOCK
      ?auto_707082 - BLOCK
      ?auto_707083 - BLOCK
      ?auto_707084 - BLOCK
      ?auto_707085 - BLOCK
      ?auto_707086 - BLOCK
      ?auto_707087 - BLOCK
      ?auto_707088 - BLOCK
      ?auto_707089 - BLOCK
      ?auto_707090 - BLOCK
      ?auto_707091 - BLOCK
      ?auto_707092 - BLOCK
      ?auto_707093 - BLOCK
    )
    :vars
    (
      ?auto_707094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707093 ?auto_707094 ) ( ON-TABLE ?auto_707079 ) ( ON ?auto_707080 ?auto_707079 ) ( ON ?auto_707081 ?auto_707080 ) ( ON ?auto_707082 ?auto_707081 ) ( ON ?auto_707083 ?auto_707082 ) ( ON ?auto_707084 ?auto_707083 ) ( ON ?auto_707085 ?auto_707084 ) ( not ( = ?auto_707079 ?auto_707080 ) ) ( not ( = ?auto_707079 ?auto_707081 ) ) ( not ( = ?auto_707079 ?auto_707082 ) ) ( not ( = ?auto_707079 ?auto_707083 ) ) ( not ( = ?auto_707079 ?auto_707084 ) ) ( not ( = ?auto_707079 ?auto_707085 ) ) ( not ( = ?auto_707079 ?auto_707086 ) ) ( not ( = ?auto_707079 ?auto_707087 ) ) ( not ( = ?auto_707079 ?auto_707088 ) ) ( not ( = ?auto_707079 ?auto_707089 ) ) ( not ( = ?auto_707079 ?auto_707090 ) ) ( not ( = ?auto_707079 ?auto_707091 ) ) ( not ( = ?auto_707079 ?auto_707092 ) ) ( not ( = ?auto_707079 ?auto_707093 ) ) ( not ( = ?auto_707079 ?auto_707094 ) ) ( not ( = ?auto_707080 ?auto_707081 ) ) ( not ( = ?auto_707080 ?auto_707082 ) ) ( not ( = ?auto_707080 ?auto_707083 ) ) ( not ( = ?auto_707080 ?auto_707084 ) ) ( not ( = ?auto_707080 ?auto_707085 ) ) ( not ( = ?auto_707080 ?auto_707086 ) ) ( not ( = ?auto_707080 ?auto_707087 ) ) ( not ( = ?auto_707080 ?auto_707088 ) ) ( not ( = ?auto_707080 ?auto_707089 ) ) ( not ( = ?auto_707080 ?auto_707090 ) ) ( not ( = ?auto_707080 ?auto_707091 ) ) ( not ( = ?auto_707080 ?auto_707092 ) ) ( not ( = ?auto_707080 ?auto_707093 ) ) ( not ( = ?auto_707080 ?auto_707094 ) ) ( not ( = ?auto_707081 ?auto_707082 ) ) ( not ( = ?auto_707081 ?auto_707083 ) ) ( not ( = ?auto_707081 ?auto_707084 ) ) ( not ( = ?auto_707081 ?auto_707085 ) ) ( not ( = ?auto_707081 ?auto_707086 ) ) ( not ( = ?auto_707081 ?auto_707087 ) ) ( not ( = ?auto_707081 ?auto_707088 ) ) ( not ( = ?auto_707081 ?auto_707089 ) ) ( not ( = ?auto_707081 ?auto_707090 ) ) ( not ( = ?auto_707081 ?auto_707091 ) ) ( not ( = ?auto_707081 ?auto_707092 ) ) ( not ( = ?auto_707081 ?auto_707093 ) ) ( not ( = ?auto_707081 ?auto_707094 ) ) ( not ( = ?auto_707082 ?auto_707083 ) ) ( not ( = ?auto_707082 ?auto_707084 ) ) ( not ( = ?auto_707082 ?auto_707085 ) ) ( not ( = ?auto_707082 ?auto_707086 ) ) ( not ( = ?auto_707082 ?auto_707087 ) ) ( not ( = ?auto_707082 ?auto_707088 ) ) ( not ( = ?auto_707082 ?auto_707089 ) ) ( not ( = ?auto_707082 ?auto_707090 ) ) ( not ( = ?auto_707082 ?auto_707091 ) ) ( not ( = ?auto_707082 ?auto_707092 ) ) ( not ( = ?auto_707082 ?auto_707093 ) ) ( not ( = ?auto_707082 ?auto_707094 ) ) ( not ( = ?auto_707083 ?auto_707084 ) ) ( not ( = ?auto_707083 ?auto_707085 ) ) ( not ( = ?auto_707083 ?auto_707086 ) ) ( not ( = ?auto_707083 ?auto_707087 ) ) ( not ( = ?auto_707083 ?auto_707088 ) ) ( not ( = ?auto_707083 ?auto_707089 ) ) ( not ( = ?auto_707083 ?auto_707090 ) ) ( not ( = ?auto_707083 ?auto_707091 ) ) ( not ( = ?auto_707083 ?auto_707092 ) ) ( not ( = ?auto_707083 ?auto_707093 ) ) ( not ( = ?auto_707083 ?auto_707094 ) ) ( not ( = ?auto_707084 ?auto_707085 ) ) ( not ( = ?auto_707084 ?auto_707086 ) ) ( not ( = ?auto_707084 ?auto_707087 ) ) ( not ( = ?auto_707084 ?auto_707088 ) ) ( not ( = ?auto_707084 ?auto_707089 ) ) ( not ( = ?auto_707084 ?auto_707090 ) ) ( not ( = ?auto_707084 ?auto_707091 ) ) ( not ( = ?auto_707084 ?auto_707092 ) ) ( not ( = ?auto_707084 ?auto_707093 ) ) ( not ( = ?auto_707084 ?auto_707094 ) ) ( not ( = ?auto_707085 ?auto_707086 ) ) ( not ( = ?auto_707085 ?auto_707087 ) ) ( not ( = ?auto_707085 ?auto_707088 ) ) ( not ( = ?auto_707085 ?auto_707089 ) ) ( not ( = ?auto_707085 ?auto_707090 ) ) ( not ( = ?auto_707085 ?auto_707091 ) ) ( not ( = ?auto_707085 ?auto_707092 ) ) ( not ( = ?auto_707085 ?auto_707093 ) ) ( not ( = ?auto_707085 ?auto_707094 ) ) ( not ( = ?auto_707086 ?auto_707087 ) ) ( not ( = ?auto_707086 ?auto_707088 ) ) ( not ( = ?auto_707086 ?auto_707089 ) ) ( not ( = ?auto_707086 ?auto_707090 ) ) ( not ( = ?auto_707086 ?auto_707091 ) ) ( not ( = ?auto_707086 ?auto_707092 ) ) ( not ( = ?auto_707086 ?auto_707093 ) ) ( not ( = ?auto_707086 ?auto_707094 ) ) ( not ( = ?auto_707087 ?auto_707088 ) ) ( not ( = ?auto_707087 ?auto_707089 ) ) ( not ( = ?auto_707087 ?auto_707090 ) ) ( not ( = ?auto_707087 ?auto_707091 ) ) ( not ( = ?auto_707087 ?auto_707092 ) ) ( not ( = ?auto_707087 ?auto_707093 ) ) ( not ( = ?auto_707087 ?auto_707094 ) ) ( not ( = ?auto_707088 ?auto_707089 ) ) ( not ( = ?auto_707088 ?auto_707090 ) ) ( not ( = ?auto_707088 ?auto_707091 ) ) ( not ( = ?auto_707088 ?auto_707092 ) ) ( not ( = ?auto_707088 ?auto_707093 ) ) ( not ( = ?auto_707088 ?auto_707094 ) ) ( not ( = ?auto_707089 ?auto_707090 ) ) ( not ( = ?auto_707089 ?auto_707091 ) ) ( not ( = ?auto_707089 ?auto_707092 ) ) ( not ( = ?auto_707089 ?auto_707093 ) ) ( not ( = ?auto_707089 ?auto_707094 ) ) ( not ( = ?auto_707090 ?auto_707091 ) ) ( not ( = ?auto_707090 ?auto_707092 ) ) ( not ( = ?auto_707090 ?auto_707093 ) ) ( not ( = ?auto_707090 ?auto_707094 ) ) ( not ( = ?auto_707091 ?auto_707092 ) ) ( not ( = ?auto_707091 ?auto_707093 ) ) ( not ( = ?auto_707091 ?auto_707094 ) ) ( not ( = ?auto_707092 ?auto_707093 ) ) ( not ( = ?auto_707092 ?auto_707094 ) ) ( not ( = ?auto_707093 ?auto_707094 ) ) ( ON ?auto_707092 ?auto_707093 ) ( ON ?auto_707091 ?auto_707092 ) ( ON ?auto_707090 ?auto_707091 ) ( ON ?auto_707089 ?auto_707090 ) ( ON ?auto_707088 ?auto_707089 ) ( ON ?auto_707087 ?auto_707088 ) ( CLEAR ?auto_707085 ) ( ON ?auto_707086 ?auto_707087 ) ( CLEAR ?auto_707086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_707079 ?auto_707080 ?auto_707081 ?auto_707082 ?auto_707083 ?auto_707084 ?auto_707085 ?auto_707086 )
      ( MAKE-15PILE ?auto_707079 ?auto_707080 ?auto_707081 ?auto_707082 ?auto_707083 ?auto_707084 ?auto_707085 ?auto_707086 ?auto_707087 ?auto_707088 ?auto_707089 ?auto_707090 ?auto_707091 ?auto_707092 ?auto_707093 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707141 - BLOCK
      ?auto_707142 - BLOCK
      ?auto_707143 - BLOCK
      ?auto_707144 - BLOCK
      ?auto_707145 - BLOCK
      ?auto_707146 - BLOCK
      ?auto_707147 - BLOCK
      ?auto_707148 - BLOCK
      ?auto_707149 - BLOCK
      ?auto_707150 - BLOCK
      ?auto_707151 - BLOCK
      ?auto_707152 - BLOCK
      ?auto_707153 - BLOCK
      ?auto_707154 - BLOCK
      ?auto_707155 - BLOCK
    )
    :vars
    (
      ?auto_707156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707155 ?auto_707156 ) ( ON-TABLE ?auto_707141 ) ( ON ?auto_707142 ?auto_707141 ) ( ON ?auto_707143 ?auto_707142 ) ( ON ?auto_707144 ?auto_707143 ) ( ON ?auto_707145 ?auto_707144 ) ( ON ?auto_707146 ?auto_707145 ) ( not ( = ?auto_707141 ?auto_707142 ) ) ( not ( = ?auto_707141 ?auto_707143 ) ) ( not ( = ?auto_707141 ?auto_707144 ) ) ( not ( = ?auto_707141 ?auto_707145 ) ) ( not ( = ?auto_707141 ?auto_707146 ) ) ( not ( = ?auto_707141 ?auto_707147 ) ) ( not ( = ?auto_707141 ?auto_707148 ) ) ( not ( = ?auto_707141 ?auto_707149 ) ) ( not ( = ?auto_707141 ?auto_707150 ) ) ( not ( = ?auto_707141 ?auto_707151 ) ) ( not ( = ?auto_707141 ?auto_707152 ) ) ( not ( = ?auto_707141 ?auto_707153 ) ) ( not ( = ?auto_707141 ?auto_707154 ) ) ( not ( = ?auto_707141 ?auto_707155 ) ) ( not ( = ?auto_707141 ?auto_707156 ) ) ( not ( = ?auto_707142 ?auto_707143 ) ) ( not ( = ?auto_707142 ?auto_707144 ) ) ( not ( = ?auto_707142 ?auto_707145 ) ) ( not ( = ?auto_707142 ?auto_707146 ) ) ( not ( = ?auto_707142 ?auto_707147 ) ) ( not ( = ?auto_707142 ?auto_707148 ) ) ( not ( = ?auto_707142 ?auto_707149 ) ) ( not ( = ?auto_707142 ?auto_707150 ) ) ( not ( = ?auto_707142 ?auto_707151 ) ) ( not ( = ?auto_707142 ?auto_707152 ) ) ( not ( = ?auto_707142 ?auto_707153 ) ) ( not ( = ?auto_707142 ?auto_707154 ) ) ( not ( = ?auto_707142 ?auto_707155 ) ) ( not ( = ?auto_707142 ?auto_707156 ) ) ( not ( = ?auto_707143 ?auto_707144 ) ) ( not ( = ?auto_707143 ?auto_707145 ) ) ( not ( = ?auto_707143 ?auto_707146 ) ) ( not ( = ?auto_707143 ?auto_707147 ) ) ( not ( = ?auto_707143 ?auto_707148 ) ) ( not ( = ?auto_707143 ?auto_707149 ) ) ( not ( = ?auto_707143 ?auto_707150 ) ) ( not ( = ?auto_707143 ?auto_707151 ) ) ( not ( = ?auto_707143 ?auto_707152 ) ) ( not ( = ?auto_707143 ?auto_707153 ) ) ( not ( = ?auto_707143 ?auto_707154 ) ) ( not ( = ?auto_707143 ?auto_707155 ) ) ( not ( = ?auto_707143 ?auto_707156 ) ) ( not ( = ?auto_707144 ?auto_707145 ) ) ( not ( = ?auto_707144 ?auto_707146 ) ) ( not ( = ?auto_707144 ?auto_707147 ) ) ( not ( = ?auto_707144 ?auto_707148 ) ) ( not ( = ?auto_707144 ?auto_707149 ) ) ( not ( = ?auto_707144 ?auto_707150 ) ) ( not ( = ?auto_707144 ?auto_707151 ) ) ( not ( = ?auto_707144 ?auto_707152 ) ) ( not ( = ?auto_707144 ?auto_707153 ) ) ( not ( = ?auto_707144 ?auto_707154 ) ) ( not ( = ?auto_707144 ?auto_707155 ) ) ( not ( = ?auto_707144 ?auto_707156 ) ) ( not ( = ?auto_707145 ?auto_707146 ) ) ( not ( = ?auto_707145 ?auto_707147 ) ) ( not ( = ?auto_707145 ?auto_707148 ) ) ( not ( = ?auto_707145 ?auto_707149 ) ) ( not ( = ?auto_707145 ?auto_707150 ) ) ( not ( = ?auto_707145 ?auto_707151 ) ) ( not ( = ?auto_707145 ?auto_707152 ) ) ( not ( = ?auto_707145 ?auto_707153 ) ) ( not ( = ?auto_707145 ?auto_707154 ) ) ( not ( = ?auto_707145 ?auto_707155 ) ) ( not ( = ?auto_707145 ?auto_707156 ) ) ( not ( = ?auto_707146 ?auto_707147 ) ) ( not ( = ?auto_707146 ?auto_707148 ) ) ( not ( = ?auto_707146 ?auto_707149 ) ) ( not ( = ?auto_707146 ?auto_707150 ) ) ( not ( = ?auto_707146 ?auto_707151 ) ) ( not ( = ?auto_707146 ?auto_707152 ) ) ( not ( = ?auto_707146 ?auto_707153 ) ) ( not ( = ?auto_707146 ?auto_707154 ) ) ( not ( = ?auto_707146 ?auto_707155 ) ) ( not ( = ?auto_707146 ?auto_707156 ) ) ( not ( = ?auto_707147 ?auto_707148 ) ) ( not ( = ?auto_707147 ?auto_707149 ) ) ( not ( = ?auto_707147 ?auto_707150 ) ) ( not ( = ?auto_707147 ?auto_707151 ) ) ( not ( = ?auto_707147 ?auto_707152 ) ) ( not ( = ?auto_707147 ?auto_707153 ) ) ( not ( = ?auto_707147 ?auto_707154 ) ) ( not ( = ?auto_707147 ?auto_707155 ) ) ( not ( = ?auto_707147 ?auto_707156 ) ) ( not ( = ?auto_707148 ?auto_707149 ) ) ( not ( = ?auto_707148 ?auto_707150 ) ) ( not ( = ?auto_707148 ?auto_707151 ) ) ( not ( = ?auto_707148 ?auto_707152 ) ) ( not ( = ?auto_707148 ?auto_707153 ) ) ( not ( = ?auto_707148 ?auto_707154 ) ) ( not ( = ?auto_707148 ?auto_707155 ) ) ( not ( = ?auto_707148 ?auto_707156 ) ) ( not ( = ?auto_707149 ?auto_707150 ) ) ( not ( = ?auto_707149 ?auto_707151 ) ) ( not ( = ?auto_707149 ?auto_707152 ) ) ( not ( = ?auto_707149 ?auto_707153 ) ) ( not ( = ?auto_707149 ?auto_707154 ) ) ( not ( = ?auto_707149 ?auto_707155 ) ) ( not ( = ?auto_707149 ?auto_707156 ) ) ( not ( = ?auto_707150 ?auto_707151 ) ) ( not ( = ?auto_707150 ?auto_707152 ) ) ( not ( = ?auto_707150 ?auto_707153 ) ) ( not ( = ?auto_707150 ?auto_707154 ) ) ( not ( = ?auto_707150 ?auto_707155 ) ) ( not ( = ?auto_707150 ?auto_707156 ) ) ( not ( = ?auto_707151 ?auto_707152 ) ) ( not ( = ?auto_707151 ?auto_707153 ) ) ( not ( = ?auto_707151 ?auto_707154 ) ) ( not ( = ?auto_707151 ?auto_707155 ) ) ( not ( = ?auto_707151 ?auto_707156 ) ) ( not ( = ?auto_707152 ?auto_707153 ) ) ( not ( = ?auto_707152 ?auto_707154 ) ) ( not ( = ?auto_707152 ?auto_707155 ) ) ( not ( = ?auto_707152 ?auto_707156 ) ) ( not ( = ?auto_707153 ?auto_707154 ) ) ( not ( = ?auto_707153 ?auto_707155 ) ) ( not ( = ?auto_707153 ?auto_707156 ) ) ( not ( = ?auto_707154 ?auto_707155 ) ) ( not ( = ?auto_707154 ?auto_707156 ) ) ( not ( = ?auto_707155 ?auto_707156 ) ) ( ON ?auto_707154 ?auto_707155 ) ( ON ?auto_707153 ?auto_707154 ) ( ON ?auto_707152 ?auto_707153 ) ( ON ?auto_707151 ?auto_707152 ) ( ON ?auto_707150 ?auto_707151 ) ( ON ?auto_707149 ?auto_707150 ) ( ON ?auto_707148 ?auto_707149 ) ( CLEAR ?auto_707146 ) ( ON ?auto_707147 ?auto_707148 ) ( CLEAR ?auto_707147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_707141 ?auto_707142 ?auto_707143 ?auto_707144 ?auto_707145 ?auto_707146 ?auto_707147 )
      ( MAKE-15PILE ?auto_707141 ?auto_707142 ?auto_707143 ?auto_707144 ?auto_707145 ?auto_707146 ?auto_707147 ?auto_707148 ?auto_707149 ?auto_707150 ?auto_707151 ?auto_707152 ?auto_707153 ?auto_707154 ?auto_707155 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707203 - BLOCK
      ?auto_707204 - BLOCK
      ?auto_707205 - BLOCK
      ?auto_707206 - BLOCK
      ?auto_707207 - BLOCK
      ?auto_707208 - BLOCK
      ?auto_707209 - BLOCK
      ?auto_707210 - BLOCK
      ?auto_707211 - BLOCK
      ?auto_707212 - BLOCK
      ?auto_707213 - BLOCK
      ?auto_707214 - BLOCK
      ?auto_707215 - BLOCK
      ?auto_707216 - BLOCK
      ?auto_707217 - BLOCK
    )
    :vars
    (
      ?auto_707218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707217 ?auto_707218 ) ( ON-TABLE ?auto_707203 ) ( ON ?auto_707204 ?auto_707203 ) ( ON ?auto_707205 ?auto_707204 ) ( ON ?auto_707206 ?auto_707205 ) ( ON ?auto_707207 ?auto_707206 ) ( not ( = ?auto_707203 ?auto_707204 ) ) ( not ( = ?auto_707203 ?auto_707205 ) ) ( not ( = ?auto_707203 ?auto_707206 ) ) ( not ( = ?auto_707203 ?auto_707207 ) ) ( not ( = ?auto_707203 ?auto_707208 ) ) ( not ( = ?auto_707203 ?auto_707209 ) ) ( not ( = ?auto_707203 ?auto_707210 ) ) ( not ( = ?auto_707203 ?auto_707211 ) ) ( not ( = ?auto_707203 ?auto_707212 ) ) ( not ( = ?auto_707203 ?auto_707213 ) ) ( not ( = ?auto_707203 ?auto_707214 ) ) ( not ( = ?auto_707203 ?auto_707215 ) ) ( not ( = ?auto_707203 ?auto_707216 ) ) ( not ( = ?auto_707203 ?auto_707217 ) ) ( not ( = ?auto_707203 ?auto_707218 ) ) ( not ( = ?auto_707204 ?auto_707205 ) ) ( not ( = ?auto_707204 ?auto_707206 ) ) ( not ( = ?auto_707204 ?auto_707207 ) ) ( not ( = ?auto_707204 ?auto_707208 ) ) ( not ( = ?auto_707204 ?auto_707209 ) ) ( not ( = ?auto_707204 ?auto_707210 ) ) ( not ( = ?auto_707204 ?auto_707211 ) ) ( not ( = ?auto_707204 ?auto_707212 ) ) ( not ( = ?auto_707204 ?auto_707213 ) ) ( not ( = ?auto_707204 ?auto_707214 ) ) ( not ( = ?auto_707204 ?auto_707215 ) ) ( not ( = ?auto_707204 ?auto_707216 ) ) ( not ( = ?auto_707204 ?auto_707217 ) ) ( not ( = ?auto_707204 ?auto_707218 ) ) ( not ( = ?auto_707205 ?auto_707206 ) ) ( not ( = ?auto_707205 ?auto_707207 ) ) ( not ( = ?auto_707205 ?auto_707208 ) ) ( not ( = ?auto_707205 ?auto_707209 ) ) ( not ( = ?auto_707205 ?auto_707210 ) ) ( not ( = ?auto_707205 ?auto_707211 ) ) ( not ( = ?auto_707205 ?auto_707212 ) ) ( not ( = ?auto_707205 ?auto_707213 ) ) ( not ( = ?auto_707205 ?auto_707214 ) ) ( not ( = ?auto_707205 ?auto_707215 ) ) ( not ( = ?auto_707205 ?auto_707216 ) ) ( not ( = ?auto_707205 ?auto_707217 ) ) ( not ( = ?auto_707205 ?auto_707218 ) ) ( not ( = ?auto_707206 ?auto_707207 ) ) ( not ( = ?auto_707206 ?auto_707208 ) ) ( not ( = ?auto_707206 ?auto_707209 ) ) ( not ( = ?auto_707206 ?auto_707210 ) ) ( not ( = ?auto_707206 ?auto_707211 ) ) ( not ( = ?auto_707206 ?auto_707212 ) ) ( not ( = ?auto_707206 ?auto_707213 ) ) ( not ( = ?auto_707206 ?auto_707214 ) ) ( not ( = ?auto_707206 ?auto_707215 ) ) ( not ( = ?auto_707206 ?auto_707216 ) ) ( not ( = ?auto_707206 ?auto_707217 ) ) ( not ( = ?auto_707206 ?auto_707218 ) ) ( not ( = ?auto_707207 ?auto_707208 ) ) ( not ( = ?auto_707207 ?auto_707209 ) ) ( not ( = ?auto_707207 ?auto_707210 ) ) ( not ( = ?auto_707207 ?auto_707211 ) ) ( not ( = ?auto_707207 ?auto_707212 ) ) ( not ( = ?auto_707207 ?auto_707213 ) ) ( not ( = ?auto_707207 ?auto_707214 ) ) ( not ( = ?auto_707207 ?auto_707215 ) ) ( not ( = ?auto_707207 ?auto_707216 ) ) ( not ( = ?auto_707207 ?auto_707217 ) ) ( not ( = ?auto_707207 ?auto_707218 ) ) ( not ( = ?auto_707208 ?auto_707209 ) ) ( not ( = ?auto_707208 ?auto_707210 ) ) ( not ( = ?auto_707208 ?auto_707211 ) ) ( not ( = ?auto_707208 ?auto_707212 ) ) ( not ( = ?auto_707208 ?auto_707213 ) ) ( not ( = ?auto_707208 ?auto_707214 ) ) ( not ( = ?auto_707208 ?auto_707215 ) ) ( not ( = ?auto_707208 ?auto_707216 ) ) ( not ( = ?auto_707208 ?auto_707217 ) ) ( not ( = ?auto_707208 ?auto_707218 ) ) ( not ( = ?auto_707209 ?auto_707210 ) ) ( not ( = ?auto_707209 ?auto_707211 ) ) ( not ( = ?auto_707209 ?auto_707212 ) ) ( not ( = ?auto_707209 ?auto_707213 ) ) ( not ( = ?auto_707209 ?auto_707214 ) ) ( not ( = ?auto_707209 ?auto_707215 ) ) ( not ( = ?auto_707209 ?auto_707216 ) ) ( not ( = ?auto_707209 ?auto_707217 ) ) ( not ( = ?auto_707209 ?auto_707218 ) ) ( not ( = ?auto_707210 ?auto_707211 ) ) ( not ( = ?auto_707210 ?auto_707212 ) ) ( not ( = ?auto_707210 ?auto_707213 ) ) ( not ( = ?auto_707210 ?auto_707214 ) ) ( not ( = ?auto_707210 ?auto_707215 ) ) ( not ( = ?auto_707210 ?auto_707216 ) ) ( not ( = ?auto_707210 ?auto_707217 ) ) ( not ( = ?auto_707210 ?auto_707218 ) ) ( not ( = ?auto_707211 ?auto_707212 ) ) ( not ( = ?auto_707211 ?auto_707213 ) ) ( not ( = ?auto_707211 ?auto_707214 ) ) ( not ( = ?auto_707211 ?auto_707215 ) ) ( not ( = ?auto_707211 ?auto_707216 ) ) ( not ( = ?auto_707211 ?auto_707217 ) ) ( not ( = ?auto_707211 ?auto_707218 ) ) ( not ( = ?auto_707212 ?auto_707213 ) ) ( not ( = ?auto_707212 ?auto_707214 ) ) ( not ( = ?auto_707212 ?auto_707215 ) ) ( not ( = ?auto_707212 ?auto_707216 ) ) ( not ( = ?auto_707212 ?auto_707217 ) ) ( not ( = ?auto_707212 ?auto_707218 ) ) ( not ( = ?auto_707213 ?auto_707214 ) ) ( not ( = ?auto_707213 ?auto_707215 ) ) ( not ( = ?auto_707213 ?auto_707216 ) ) ( not ( = ?auto_707213 ?auto_707217 ) ) ( not ( = ?auto_707213 ?auto_707218 ) ) ( not ( = ?auto_707214 ?auto_707215 ) ) ( not ( = ?auto_707214 ?auto_707216 ) ) ( not ( = ?auto_707214 ?auto_707217 ) ) ( not ( = ?auto_707214 ?auto_707218 ) ) ( not ( = ?auto_707215 ?auto_707216 ) ) ( not ( = ?auto_707215 ?auto_707217 ) ) ( not ( = ?auto_707215 ?auto_707218 ) ) ( not ( = ?auto_707216 ?auto_707217 ) ) ( not ( = ?auto_707216 ?auto_707218 ) ) ( not ( = ?auto_707217 ?auto_707218 ) ) ( ON ?auto_707216 ?auto_707217 ) ( ON ?auto_707215 ?auto_707216 ) ( ON ?auto_707214 ?auto_707215 ) ( ON ?auto_707213 ?auto_707214 ) ( ON ?auto_707212 ?auto_707213 ) ( ON ?auto_707211 ?auto_707212 ) ( ON ?auto_707210 ?auto_707211 ) ( ON ?auto_707209 ?auto_707210 ) ( CLEAR ?auto_707207 ) ( ON ?auto_707208 ?auto_707209 ) ( CLEAR ?auto_707208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_707203 ?auto_707204 ?auto_707205 ?auto_707206 ?auto_707207 ?auto_707208 )
      ( MAKE-15PILE ?auto_707203 ?auto_707204 ?auto_707205 ?auto_707206 ?auto_707207 ?auto_707208 ?auto_707209 ?auto_707210 ?auto_707211 ?auto_707212 ?auto_707213 ?auto_707214 ?auto_707215 ?auto_707216 ?auto_707217 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707265 - BLOCK
      ?auto_707266 - BLOCK
      ?auto_707267 - BLOCK
      ?auto_707268 - BLOCK
      ?auto_707269 - BLOCK
      ?auto_707270 - BLOCK
      ?auto_707271 - BLOCK
      ?auto_707272 - BLOCK
      ?auto_707273 - BLOCK
      ?auto_707274 - BLOCK
      ?auto_707275 - BLOCK
      ?auto_707276 - BLOCK
      ?auto_707277 - BLOCK
      ?auto_707278 - BLOCK
      ?auto_707279 - BLOCK
    )
    :vars
    (
      ?auto_707280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707279 ?auto_707280 ) ( ON-TABLE ?auto_707265 ) ( ON ?auto_707266 ?auto_707265 ) ( ON ?auto_707267 ?auto_707266 ) ( ON ?auto_707268 ?auto_707267 ) ( not ( = ?auto_707265 ?auto_707266 ) ) ( not ( = ?auto_707265 ?auto_707267 ) ) ( not ( = ?auto_707265 ?auto_707268 ) ) ( not ( = ?auto_707265 ?auto_707269 ) ) ( not ( = ?auto_707265 ?auto_707270 ) ) ( not ( = ?auto_707265 ?auto_707271 ) ) ( not ( = ?auto_707265 ?auto_707272 ) ) ( not ( = ?auto_707265 ?auto_707273 ) ) ( not ( = ?auto_707265 ?auto_707274 ) ) ( not ( = ?auto_707265 ?auto_707275 ) ) ( not ( = ?auto_707265 ?auto_707276 ) ) ( not ( = ?auto_707265 ?auto_707277 ) ) ( not ( = ?auto_707265 ?auto_707278 ) ) ( not ( = ?auto_707265 ?auto_707279 ) ) ( not ( = ?auto_707265 ?auto_707280 ) ) ( not ( = ?auto_707266 ?auto_707267 ) ) ( not ( = ?auto_707266 ?auto_707268 ) ) ( not ( = ?auto_707266 ?auto_707269 ) ) ( not ( = ?auto_707266 ?auto_707270 ) ) ( not ( = ?auto_707266 ?auto_707271 ) ) ( not ( = ?auto_707266 ?auto_707272 ) ) ( not ( = ?auto_707266 ?auto_707273 ) ) ( not ( = ?auto_707266 ?auto_707274 ) ) ( not ( = ?auto_707266 ?auto_707275 ) ) ( not ( = ?auto_707266 ?auto_707276 ) ) ( not ( = ?auto_707266 ?auto_707277 ) ) ( not ( = ?auto_707266 ?auto_707278 ) ) ( not ( = ?auto_707266 ?auto_707279 ) ) ( not ( = ?auto_707266 ?auto_707280 ) ) ( not ( = ?auto_707267 ?auto_707268 ) ) ( not ( = ?auto_707267 ?auto_707269 ) ) ( not ( = ?auto_707267 ?auto_707270 ) ) ( not ( = ?auto_707267 ?auto_707271 ) ) ( not ( = ?auto_707267 ?auto_707272 ) ) ( not ( = ?auto_707267 ?auto_707273 ) ) ( not ( = ?auto_707267 ?auto_707274 ) ) ( not ( = ?auto_707267 ?auto_707275 ) ) ( not ( = ?auto_707267 ?auto_707276 ) ) ( not ( = ?auto_707267 ?auto_707277 ) ) ( not ( = ?auto_707267 ?auto_707278 ) ) ( not ( = ?auto_707267 ?auto_707279 ) ) ( not ( = ?auto_707267 ?auto_707280 ) ) ( not ( = ?auto_707268 ?auto_707269 ) ) ( not ( = ?auto_707268 ?auto_707270 ) ) ( not ( = ?auto_707268 ?auto_707271 ) ) ( not ( = ?auto_707268 ?auto_707272 ) ) ( not ( = ?auto_707268 ?auto_707273 ) ) ( not ( = ?auto_707268 ?auto_707274 ) ) ( not ( = ?auto_707268 ?auto_707275 ) ) ( not ( = ?auto_707268 ?auto_707276 ) ) ( not ( = ?auto_707268 ?auto_707277 ) ) ( not ( = ?auto_707268 ?auto_707278 ) ) ( not ( = ?auto_707268 ?auto_707279 ) ) ( not ( = ?auto_707268 ?auto_707280 ) ) ( not ( = ?auto_707269 ?auto_707270 ) ) ( not ( = ?auto_707269 ?auto_707271 ) ) ( not ( = ?auto_707269 ?auto_707272 ) ) ( not ( = ?auto_707269 ?auto_707273 ) ) ( not ( = ?auto_707269 ?auto_707274 ) ) ( not ( = ?auto_707269 ?auto_707275 ) ) ( not ( = ?auto_707269 ?auto_707276 ) ) ( not ( = ?auto_707269 ?auto_707277 ) ) ( not ( = ?auto_707269 ?auto_707278 ) ) ( not ( = ?auto_707269 ?auto_707279 ) ) ( not ( = ?auto_707269 ?auto_707280 ) ) ( not ( = ?auto_707270 ?auto_707271 ) ) ( not ( = ?auto_707270 ?auto_707272 ) ) ( not ( = ?auto_707270 ?auto_707273 ) ) ( not ( = ?auto_707270 ?auto_707274 ) ) ( not ( = ?auto_707270 ?auto_707275 ) ) ( not ( = ?auto_707270 ?auto_707276 ) ) ( not ( = ?auto_707270 ?auto_707277 ) ) ( not ( = ?auto_707270 ?auto_707278 ) ) ( not ( = ?auto_707270 ?auto_707279 ) ) ( not ( = ?auto_707270 ?auto_707280 ) ) ( not ( = ?auto_707271 ?auto_707272 ) ) ( not ( = ?auto_707271 ?auto_707273 ) ) ( not ( = ?auto_707271 ?auto_707274 ) ) ( not ( = ?auto_707271 ?auto_707275 ) ) ( not ( = ?auto_707271 ?auto_707276 ) ) ( not ( = ?auto_707271 ?auto_707277 ) ) ( not ( = ?auto_707271 ?auto_707278 ) ) ( not ( = ?auto_707271 ?auto_707279 ) ) ( not ( = ?auto_707271 ?auto_707280 ) ) ( not ( = ?auto_707272 ?auto_707273 ) ) ( not ( = ?auto_707272 ?auto_707274 ) ) ( not ( = ?auto_707272 ?auto_707275 ) ) ( not ( = ?auto_707272 ?auto_707276 ) ) ( not ( = ?auto_707272 ?auto_707277 ) ) ( not ( = ?auto_707272 ?auto_707278 ) ) ( not ( = ?auto_707272 ?auto_707279 ) ) ( not ( = ?auto_707272 ?auto_707280 ) ) ( not ( = ?auto_707273 ?auto_707274 ) ) ( not ( = ?auto_707273 ?auto_707275 ) ) ( not ( = ?auto_707273 ?auto_707276 ) ) ( not ( = ?auto_707273 ?auto_707277 ) ) ( not ( = ?auto_707273 ?auto_707278 ) ) ( not ( = ?auto_707273 ?auto_707279 ) ) ( not ( = ?auto_707273 ?auto_707280 ) ) ( not ( = ?auto_707274 ?auto_707275 ) ) ( not ( = ?auto_707274 ?auto_707276 ) ) ( not ( = ?auto_707274 ?auto_707277 ) ) ( not ( = ?auto_707274 ?auto_707278 ) ) ( not ( = ?auto_707274 ?auto_707279 ) ) ( not ( = ?auto_707274 ?auto_707280 ) ) ( not ( = ?auto_707275 ?auto_707276 ) ) ( not ( = ?auto_707275 ?auto_707277 ) ) ( not ( = ?auto_707275 ?auto_707278 ) ) ( not ( = ?auto_707275 ?auto_707279 ) ) ( not ( = ?auto_707275 ?auto_707280 ) ) ( not ( = ?auto_707276 ?auto_707277 ) ) ( not ( = ?auto_707276 ?auto_707278 ) ) ( not ( = ?auto_707276 ?auto_707279 ) ) ( not ( = ?auto_707276 ?auto_707280 ) ) ( not ( = ?auto_707277 ?auto_707278 ) ) ( not ( = ?auto_707277 ?auto_707279 ) ) ( not ( = ?auto_707277 ?auto_707280 ) ) ( not ( = ?auto_707278 ?auto_707279 ) ) ( not ( = ?auto_707278 ?auto_707280 ) ) ( not ( = ?auto_707279 ?auto_707280 ) ) ( ON ?auto_707278 ?auto_707279 ) ( ON ?auto_707277 ?auto_707278 ) ( ON ?auto_707276 ?auto_707277 ) ( ON ?auto_707275 ?auto_707276 ) ( ON ?auto_707274 ?auto_707275 ) ( ON ?auto_707273 ?auto_707274 ) ( ON ?auto_707272 ?auto_707273 ) ( ON ?auto_707271 ?auto_707272 ) ( ON ?auto_707270 ?auto_707271 ) ( CLEAR ?auto_707268 ) ( ON ?auto_707269 ?auto_707270 ) ( CLEAR ?auto_707269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_707265 ?auto_707266 ?auto_707267 ?auto_707268 ?auto_707269 )
      ( MAKE-15PILE ?auto_707265 ?auto_707266 ?auto_707267 ?auto_707268 ?auto_707269 ?auto_707270 ?auto_707271 ?auto_707272 ?auto_707273 ?auto_707274 ?auto_707275 ?auto_707276 ?auto_707277 ?auto_707278 ?auto_707279 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707327 - BLOCK
      ?auto_707328 - BLOCK
      ?auto_707329 - BLOCK
      ?auto_707330 - BLOCK
      ?auto_707331 - BLOCK
      ?auto_707332 - BLOCK
      ?auto_707333 - BLOCK
      ?auto_707334 - BLOCK
      ?auto_707335 - BLOCK
      ?auto_707336 - BLOCK
      ?auto_707337 - BLOCK
      ?auto_707338 - BLOCK
      ?auto_707339 - BLOCK
      ?auto_707340 - BLOCK
      ?auto_707341 - BLOCK
    )
    :vars
    (
      ?auto_707342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707341 ?auto_707342 ) ( ON-TABLE ?auto_707327 ) ( ON ?auto_707328 ?auto_707327 ) ( ON ?auto_707329 ?auto_707328 ) ( not ( = ?auto_707327 ?auto_707328 ) ) ( not ( = ?auto_707327 ?auto_707329 ) ) ( not ( = ?auto_707327 ?auto_707330 ) ) ( not ( = ?auto_707327 ?auto_707331 ) ) ( not ( = ?auto_707327 ?auto_707332 ) ) ( not ( = ?auto_707327 ?auto_707333 ) ) ( not ( = ?auto_707327 ?auto_707334 ) ) ( not ( = ?auto_707327 ?auto_707335 ) ) ( not ( = ?auto_707327 ?auto_707336 ) ) ( not ( = ?auto_707327 ?auto_707337 ) ) ( not ( = ?auto_707327 ?auto_707338 ) ) ( not ( = ?auto_707327 ?auto_707339 ) ) ( not ( = ?auto_707327 ?auto_707340 ) ) ( not ( = ?auto_707327 ?auto_707341 ) ) ( not ( = ?auto_707327 ?auto_707342 ) ) ( not ( = ?auto_707328 ?auto_707329 ) ) ( not ( = ?auto_707328 ?auto_707330 ) ) ( not ( = ?auto_707328 ?auto_707331 ) ) ( not ( = ?auto_707328 ?auto_707332 ) ) ( not ( = ?auto_707328 ?auto_707333 ) ) ( not ( = ?auto_707328 ?auto_707334 ) ) ( not ( = ?auto_707328 ?auto_707335 ) ) ( not ( = ?auto_707328 ?auto_707336 ) ) ( not ( = ?auto_707328 ?auto_707337 ) ) ( not ( = ?auto_707328 ?auto_707338 ) ) ( not ( = ?auto_707328 ?auto_707339 ) ) ( not ( = ?auto_707328 ?auto_707340 ) ) ( not ( = ?auto_707328 ?auto_707341 ) ) ( not ( = ?auto_707328 ?auto_707342 ) ) ( not ( = ?auto_707329 ?auto_707330 ) ) ( not ( = ?auto_707329 ?auto_707331 ) ) ( not ( = ?auto_707329 ?auto_707332 ) ) ( not ( = ?auto_707329 ?auto_707333 ) ) ( not ( = ?auto_707329 ?auto_707334 ) ) ( not ( = ?auto_707329 ?auto_707335 ) ) ( not ( = ?auto_707329 ?auto_707336 ) ) ( not ( = ?auto_707329 ?auto_707337 ) ) ( not ( = ?auto_707329 ?auto_707338 ) ) ( not ( = ?auto_707329 ?auto_707339 ) ) ( not ( = ?auto_707329 ?auto_707340 ) ) ( not ( = ?auto_707329 ?auto_707341 ) ) ( not ( = ?auto_707329 ?auto_707342 ) ) ( not ( = ?auto_707330 ?auto_707331 ) ) ( not ( = ?auto_707330 ?auto_707332 ) ) ( not ( = ?auto_707330 ?auto_707333 ) ) ( not ( = ?auto_707330 ?auto_707334 ) ) ( not ( = ?auto_707330 ?auto_707335 ) ) ( not ( = ?auto_707330 ?auto_707336 ) ) ( not ( = ?auto_707330 ?auto_707337 ) ) ( not ( = ?auto_707330 ?auto_707338 ) ) ( not ( = ?auto_707330 ?auto_707339 ) ) ( not ( = ?auto_707330 ?auto_707340 ) ) ( not ( = ?auto_707330 ?auto_707341 ) ) ( not ( = ?auto_707330 ?auto_707342 ) ) ( not ( = ?auto_707331 ?auto_707332 ) ) ( not ( = ?auto_707331 ?auto_707333 ) ) ( not ( = ?auto_707331 ?auto_707334 ) ) ( not ( = ?auto_707331 ?auto_707335 ) ) ( not ( = ?auto_707331 ?auto_707336 ) ) ( not ( = ?auto_707331 ?auto_707337 ) ) ( not ( = ?auto_707331 ?auto_707338 ) ) ( not ( = ?auto_707331 ?auto_707339 ) ) ( not ( = ?auto_707331 ?auto_707340 ) ) ( not ( = ?auto_707331 ?auto_707341 ) ) ( not ( = ?auto_707331 ?auto_707342 ) ) ( not ( = ?auto_707332 ?auto_707333 ) ) ( not ( = ?auto_707332 ?auto_707334 ) ) ( not ( = ?auto_707332 ?auto_707335 ) ) ( not ( = ?auto_707332 ?auto_707336 ) ) ( not ( = ?auto_707332 ?auto_707337 ) ) ( not ( = ?auto_707332 ?auto_707338 ) ) ( not ( = ?auto_707332 ?auto_707339 ) ) ( not ( = ?auto_707332 ?auto_707340 ) ) ( not ( = ?auto_707332 ?auto_707341 ) ) ( not ( = ?auto_707332 ?auto_707342 ) ) ( not ( = ?auto_707333 ?auto_707334 ) ) ( not ( = ?auto_707333 ?auto_707335 ) ) ( not ( = ?auto_707333 ?auto_707336 ) ) ( not ( = ?auto_707333 ?auto_707337 ) ) ( not ( = ?auto_707333 ?auto_707338 ) ) ( not ( = ?auto_707333 ?auto_707339 ) ) ( not ( = ?auto_707333 ?auto_707340 ) ) ( not ( = ?auto_707333 ?auto_707341 ) ) ( not ( = ?auto_707333 ?auto_707342 ) ) ( not ( = ?auto_707334 ?auto_707335 ) ) ( not ( = ?auto_707334 ?auto_707336 ) ) ( not ( = ?auto_707334 ?auto_707337 ) ) ( not ( = ?auto_707334 ?auto_707338 ) ) ( not ( = ?auto_707334 ?auto_707339 ) ) ( not ( = ?auto_707334 ?auto_707340 ) ) ( not ( = ?auto_707334 ?auto_707341 ) ) ( not ( = ?auto_707334 ?auto_707342 ) ) ( not ( = ?auto_707335 ?auto_707336 ) ) ( not ( = ?auto_707335 ?auto_707337 ) ) ( not ( = ?auto_707335 ?auto_707338 ) ) ( not ( = ?auto_707335 ?auto_707339 ) ) ( not ( = ?auto_707335 ?auto_707340 ) ) ( not ( = ?auto_707335 ?auto_707341 ) ) ( not ( = ?auto_707335 ?auto_707342 ) ) ( not ( = ?auto_707336 ?auto_707337 ) ) ( not ( = ?auto_707336 ?auto_707338 ) ) ( not ( = ?auto_707336 ?auto_707339 ) ) ( not ( = ?auto_707336 ?auto_707340 ) ) ( not ( = ?auto_707336 ?auto_707341 ) ) ( not ( = ?auto_707336 ?auto_707342 ) ) ( not ( = ?auto_707337 ?auto_707338 ) ) ( not ( = ?auto_707337 ?auto_707339 ) ) ( not ( = ?auto_707337 ?auto_707340 ) ) ( not ( = ?auto_707337 ?auto_707341 ) ) ( not ( = ?auto_707337 ?auto_707342 ) ) ( not ( = ?auto_707338 ?auto_707339 ) ) ( not ( = ?auto_707338 ?auto_707340 ) ) ( not ( = ?auto_707338 ?auto_707341 ) ) ( not ( = ?auto_707338 ?auto_707342 ) ) ( not ( = ?auto_707339 ?auto_707340 ) ) ( not ( = ?auto_707339 ?auto_707341 ) ) ( not ( = ?auto_707339 ?auto_707342 ) ) ( not ( = ?auto_707340 ?auto_707341 ) ) ( not ( = ?auto_707340 ?auto_707342 ) ) ( not ( = ?auto_707341 ?auto_707342 ) ) ( ON ?auto_707340 ?auto_707341 ) ( ON ?auto_707339 ?auto_707340 ) ( ON ?auto_707338 ?auto_707339 ) ( ON ?auto_707337 ?auto_707338 ) ( ON ?auto_707336 ?auto_707337 ) ( ON ?auto_707335 ?auto_707336 ) ( ON ?auto_707334 ?auto_707335 ) ( ON ?auto_707333 ?auto_707334 ) ( ON ?auto_707332 ?auto_707333 ) ( ON ?auto_707331 ?auto_707332 ) ( CLEAR ?auto_707329 ) ( ON ?auto_707330 ?auto_707331 ) ( CLEAR ?auto_707330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_707327 ?auto_707328 ?auto_707329 ?auto_707330 )
      ( MAKE-15PILE ?auto_707327 ?auto_707328 ?auto_707329 ?auto_707330 ?auto_707331 ?auto_707332 ?auto_707333 ?auto_707334 ?auto_707335 ?auto_707336 ?auto_707337 ?auto_707338 ?auto_707339 ?auto_707340 ?auto_707341 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707389 - BLOCK
      ?auto_707390 - BLOCK
      ?auto_707391 - BLOCK
      ?auto_707392 - BLOCK
      ?auto_707393 - BLOCK
      ?auto_707394 - BLOCK
      ?auto_707395 - BLOCK
      ?auto_707396 - BLOCK
      ?auto_707397 - BLOCK
      ?auto_707398 - BLOCK
      ?auto_707399 - BLOCK
      ?auto_707400 - BLOCK
      ?auto_707401 - BLOCK
      ?auto_707402 - BLOCK
      ?auto_707403 - BLOCK
    )
    :vars
    (
      ?auto_707404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707403 ?auto_707404 ) ( ON-TABLE ?auto_707389 ) ( ON ?auto_707390 ?auto_707389 ) ( not ( = ?auto_707389 ?auto_707390 ) ) ( not ( = ?auto_707389 ?auto_707391 ) ) ( not ( = ?auto_707389 ?auto_707392 ) ) ( not ( = ?auto_707389 ?auto_707393 ) ) ( not ( = ?auto_707389 ?auto_707394 ) ) ( not ( = ?auto_707389 ?auto_707395 ) ) ( not ( = ?auto_707389 ?auto_707396 ) ) ( not ( = ?auto_707389 ?auto_707397 ) ) ( not ( = ?auto_707389 ?auto_707398 ) ) ( not ( = ?auto_707389 ?auto_707399 ) ) ( not ( = ?auto_707389 ?auto_707400 ) ) ( not ( = ?auto_707389 ?auto_707401 ) ) ( not ( = ?auto_707389 ?auto_707402 ) ) ( not ( = ?auto_707389 ?auto_707403 ) ) ( not ( = ?auto_707389 ?auto_707404 ) ) ( not ( = ?auto_707390 ?auto_707391 ) ) ( not ( = ?auto_707390 ?auto_707392 ) ) ( not ( = ?auto_707390 ?auto_707393 ) ) ( not ( = ?auto_707390 ?auto_707394 ) ) ( not ( = ?auto_707390 ?auto_707395 ) ) ( not ( = ?auto_707390 ?auto_707396 ) ) ( not ( = ?auto_707390 ?auto_707397 ) ) ( not ( = ?auto_707390 ?auto_707398 ) ) ( not ( = ?auto_707390 ?auto_707399 ) ) ( not ( = ?auto_707390 ?auto_707400 ) ) ( not ( = ?auto_707390 ?auto_707401 ) ) ( not ( = ?auto_707390 ?auto_707402 ) ) ( not ( = ?auto_707390 ?auto_707403 ) ) ( not ( = ?auto_707390 ?auto_707404 ) ) ( not ( = ?auto_707391 ?auto_707392 ) ) ( not ( = ?auto_707391 ?auto_707393 ) ) ( not ( = ?auto_707391 ?auto_707394 ) ) ( not ( = ?auto_707391 ?auto_707395 ) ) ( not ( = ?auto_707391 ?auto_707396 ) ) ( not ( = ?auto_707391 ?auto_707397 ) ) ( not ( = ?auto_707391 ?auto_707398 ) ) ( not ( = ?auto_707391 ?auto_707399 ) ) ( not ( = ?auto_707391 ?auto_707400 ) ) ( not ( = ?auto_707391 ?auto_707401 ) ) ( not ( = ?auto_707391 ?auto_707402 ) ) ( not ( = ?auto_707391 ?auto_707403 ) ) ( not ( = ?auto_707391 ?auto_707404 ) ) ( not ( = ?auto_707392 ?auto_707393 ) ) ( not ( = ?auto_707392 ?auto_707394 ) ) ( not ( = ?auto_707392 ?auto_707395 ) ) ( not ( = ?auto_707392 ?auto_707396 ) ) ( not ( = ?auto_707392 ?auto_707397 ) ) ( not ( = ?auto_707392 ?auto_707398 ) ) ( not ( = ?auto_707392 ?auto_707399 ) ) ( not ( = ?auto_707392 ?auto_707400 ) ) ( not ( = ?auto_707392 ?auto_707401 ) ) ( not ( = ?auto_707392 ?auto_707402 ) ) ( not ( = ?auto_707392 ?auto_707403 ) ) ( not ( = ?auto_707392 ?auto_707404 ) ) ( not ( = ?auto_707393 ?auto_707394 ) ) ( not ( = ?auto_707393 ?auto_707395 ) ) ( not ( = ?auto_707393 ?auto_707396 ) ) ( not ( = ?auto_707393 ?auto_707397 ) ) ( not ( = ?auto_707393 ?auto_707398 ) ) ( not ( = ?auto_707393 ?auto_707399 ) ) ( not ( = ?auto_707393 ?auto_707400 ) ) ( not ( = ?auto_707393 ?auto_707401 ) ) ( not ( = ?auto_707393 ?auto_707402 ) ) ( not ( = ?auto_707393 ?auto_707403 ) ) ( not ( = ?auto_707393 ?auto_707404 ) ) ( not ( = ?auto_707394 ?auto_707395 ) ) ( not ( = ?auto_707394 ?auto_707396 ) ) ( not ( = ?auto_707394 ?auto_707397 ) ) ( not ( = ?auto_707394 ?auto_707398 ) ) ( not ( = ?auto_707394 ?auto_707399 ) ) ( not ( = ?auto_707394 ?auto_707400 ) ) ( not ( = ?auto_707394 ?auto_707401 ) ) ( not ( = ?auto_707394 ?auto_707402 ) ) ( not ( = ?auto_707394 ?auto_707403 ) ) ( not ( = ?auto_707394 ?auto_707404 ) ) ( not ( = ?auto_707395 ?auto_707396 ) ) ( not ( = ?auto_707395 ?auto_707397 ) ) ( not ( = ?auto_707395 ?auto_707398 ) ) ( not ( = ?auto_707395 ?auto_707399 ) ) ( not ( = ?auto_707395 ?auto_707400 ) ) ( not ( = ?auto_707395 ?auto_707401 ) ) ( not ( = ?auto_707395 ?auto_707402 ) ) ( not ( = ?auto_707395 ?auto_707403 ) ) ( not ( = ?auto_707395 ?auto_707404 ) ) ( not ( = ?auto_707396 ?auto_707397 ) ) ( not ( = ?auto_707396 ?auto_707398 ) ) ( not ( = ?auto_707396 ?auto_707399 ) ) ( not ( = ?auto_707396 ?auto_707400 ) ) ( not ( = ?auto_707396 ?auto_707401 ) ) ( not ( = ?auto_707396 ?auto_707402 ) ) ( not ( = ?auto_707396 ?auto_707403 ) ) ( not ( = ?auto_707396 ?auto_707404 ) ) ( not ( = ?auto_707397 ?auto_707398 ) ) ( not ( = ?auto_707397 ?auto_707399 ) ) ( not ( = ?auto_707397 ?auto_707400 ) ) ( not ( = ?auto_707397 ?auto_707401 ) ) ( not ( = ?auto_707397 ?auto_707402 ) ) ( not ( = ?auto_707397 ?auto_707403 ) ) ( not ( = ?auto_707397 ?auto_707404 ) ) ( not ( = ?auto_707398 ?auto_707399 ) ) ( not ( = ?auto_707398 ?auto_707400 ) ) ( not ( = ?auto_707398 ?auto_707401 ) ) ( not ( = ?auto_707398 ?auto_707402 ) ) ( not ( = ?auto_707398 ?auto_707403 ) ) ( not ( = ?auto_707398 ?auto_707404 ) ) ( not ( = ?auto_707399 ?auto_707400 ) ) ( not ( = ?auto_707399 ?auto_707401 ) ) ( not ( = ?auto_707399 ?auto_707402 ) ) ( not ( = ?auto_707399 ?auto_707403 ) ) ( not ( = ?auto_707399 ?auto_707404 ) ) ( not ( = ?auto_707400 ?auto_707401 ) ) ( not ( = ?auto_707400 ?auto_707402 ) ) ( not ( = ?auto_707400 ?auto_707403 ) ) ( not ( = ?auto_707400 ?auto_707404 ) ) ( not ( = ?auto_707401 ?auto_707402 ) ) ( not ( = ?auto_707401 ?auto_707403 ) ) ( not ( = ?auto_707401 ?auto_707404 ) ) ( not ( = ?auto_707402 ?auto_707403 ) ) ( not ( = ?auto_707402 ?auto_707404 ) ) ( not ( = ?auto_707403 ?auto_707404 ) ) ( ON ?auto_707402 ?auto_707403 ) ( ON ?auto_707401 ?auto_707402 ) ( ON ?auto_707400 ?auto_707401 ) ( ON ?auto_707399 ?auto_707400 ) ( ON ?auto_707398 ?auto_707399 ) ( ON ?auto_707397 ?auto_707398 ) ( ON ?auto_707396 ?auto_707397 ) ( ON ?auto_707395 ?auto_707396 ) ( ON ?auto_707394 ?auto_707395 ) ( ON ?auto_707393 ?auto_707394 ) ( ON ?auto_707392 ?auto_707393 ) ( CLEAR ?auto_707390 ) ( ON ?auto_707391 ?auto_707392 ) ( CLEAR ?auto_707391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_707389 ?auto_707390 ?auto_707391 )
      ( MAKE-15PILE ?auto_707389 ?auto_707390 ?auto_707391 ?auto_707392 ?auto_707393 ?auto_707394 ?auto_707395 ?auto_707396 ?auto_707397 ?auto_707398 ?auto_707399 ?auto_707400 ?auto_707401 ?auto_707402 ?auto_707403 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707451 - BLOCK
      ?auto_707452 - BLOCK
      ?auto_707453 - BLOCK
      ?auto_707454 - BLOCK
      ?auto_707455 - BLOCK
      ?auto_707456 - BLOCK
      ?auto_707457 - BLOCK
      ?auto_707458 - BLOCK
      ?auto_707459 - BLOCK
      ?auto_707460 - BLOCK
      ?auto_707461 - BLOCK
      ?auto_707462 - BLOCK
      ?auto_707463 - BLOCK
      ?auto_707464 - BLOCK
      ?auto_707465 - BLOCK
    )
    :vars
    (
      ?auto_707466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707465 ?auto_707466 ) ( ON-TABLE ?auto_707451 ) ( not ( = ?auto_707451 ?auto_707452 ) ) ( not ( = ?auto_707451 ?auto_707453 ) ) ( not ( = ?auto_707451 ?auto_707454 ) ) ( not ( = ?auto_707451 ?auto_707455 ) ) ( not ( = ?auto_707451 ?auto_707456 ) ) ( not ( = ?auto_707451 ?auto_707457 ) ) ( not ( = ?auto_707451 ?auto_707458 ) ) ( not ( = ?auto_707451 ?auto_707459 ) ) ( not ( = ?auto_707451 ?auto_707460 ) ) ( not ( = ?auto_707451 ?auto_707461 ) ) ( not ( = ?auto_707451 ?auto_707462 ) ) ( not ( = ?auto_707451 ?auto_707463 ) ) ( not ( = ?auto_707451 ?auto_707464 ) ) ( not ( = ?auto_707451 ?auto_707465 ) ) ( not ( = ?auto_707451 ?auto_707466 ) ) ( not ( = ?auto_707452 ?auto_707453 ) ) ( not ( = ?auto_707452 ?auto_707454 ) ) ( not ( = ?auto_707452 ?auto_707455 ) ) ( not ( = ?auto_707452 ?auto_707456 ) ) ( not ( = ?auto_707452 ?auto_707457 ) ) ( not ( = ?auto_707452 ?auto_707458 ) ) ( not ( = ?auto_707452 ?auto_707459 ) ) ( not ( = ?auto_707452 ?auto_707460 ) ) ( not ( = ?auto_707452 ?auto_707461 ) ) ( not ( = ?auto_707452 ?auto_707462 ) ) ( not ( = ?auto_707452 ?auto_707463 ) ) ( not ( = ?auto_707452 ?auto_707464 ) ) ( not ( = ?auto_707452 ?auto_707465 ) ) ( not ( = ?auto_707452 ?auto_707466 ) ) ( not ( = ?auto_707453 ?auto_707454 ) ) ( not ( = ?auto_707453 ?auto_707455 ) ) ( not ( = ?auto_707453 ?auto_707456 ) ) ( not ( = ?auto_707453 ?auto_707457 ) ) ( not ( = ?auto_707453 ?auto_707458 ) ) ( not ( = ?auto_707453 ?auto_707459 ) ) ( not ( = ?auto_707453 ?auto_707460 ) ) ( not ( = ?auto_707453 ?auto_707461 ) ) ( not ( = ?auto_707453 ?auto_707462 ) ) ( not ( = ?auto_707453 ?auto_707463 ) ) ( not ( = ?auto_707453 ?auto_707464 ) ) ( not ( = ?auto_707453 ?auto_707465 ) ) ( not ( = ?auto_707453 ?auto_707466 ) ) ( not ( = ?auto_707454 ?auto_707455 ) ) ( not ( = ?auto_707454 ?auto_707456 ) ) ( not ( = ?auto_707454 ?auto_707457 ) ) ( not ( = ?auto_707454 ?auto_707458 ) ) ( not ( = ?auto_707454 ?auto_707459 ) ) ( not ( = ?auto_707454 ?auto_707460 ) ) ( not ( = ?auto_707454 ?auto_707461 ) ) ( not ( = ?auto_707454 ?auto_707462 ) ) ( not ( = ?auto_707454 ?auto_707463 ) ) ( not ( = ?auto_707454 ?auto_707464 ) ) ( not ( = ?auto_707454 ?auto_707465 ) ) ( not ( = ?auto_707454 ?auto_707466 ) ) ( not ( = ?auto_707455 ?auto_707456 ) ) ( not ( = ?auto_707455 ?auto_707457 ) ) ( not ( = ?auto_707455 ?auto_707458 ) ) ( not ( = ?auto_707455 ?auto_707459 ) ) ( not ( = ?auto_707455 ?auto_707460 ) ) ( not ( = ?auto_707455 ?auto_707461 ) ) ( not ( = ?auto_707455 ?auto_707462 ) ) ( not ( = ?auto_707455 ?auto_707463 ) ) ( not ( = ?auto_707455 ?auto_707464 ) ) ( not ( = ?auto_707455 ?auto_707465 ) ) ( not ( = ?auto_707455 ?auto_707466 ) ) ( not ( = ?auto_707456 ?auto_707457 ) ) ( not ( = ?auto_707456 ?auto_707458 ) ) ( not ( = ?auto_707456 ?auto_707459 ) ) ( not ( = ?auto_707456 ?auto_707460 ) ) ( not ( = ?auto_707456 ?auto_707461 ) ) ( not ( = ?auto_707456 ?auto_707462 ) ) ( not ( = ?auto_707456 ?auto_707463 ) ) ( not ( = ?auto_707456 ?auto_707464 ) ) ( not ( = ?auto_707456 ?auto_707465 ) ) ( not ( = ?auto_707456 ?auto_707466 ) ) ( not ( = ?auto_707457 ?auto_707458 ) ) ( not ( = ?auto_707457 ?auto_707459 ) ) ( not ( = ?auto_707457 ?auto_707460 ) ) ( not ( = ?auto_707457 ?auto_707461 ) ) ( not ( = ?auto_707457 ?auto_707462 ) ) ( not ( = ?auto_707457 ?auto_707463 ) ) ( not ( = ?auto_707457 ?auto_707464 ) ) ( not ( = ?auto_707457 ?auto_707465 ) ) ( not ( = ?auto_707457 ?auto_707466 ) ) ( not ( = ?auto_707458 ?auto_707459 ) ) ( not ( = ?auto_707458 ?auto_707460 ) ) ( not ( = ?auto_707458 ?auto_707461 ) ) ( not ( = ?auto_707458 ?auto_707462 ) ) ( not ( = ?auto_707458 ?auto_707463 ) ) ( not ( = ?auto_707458 ?auto_707464 ) ) ( not ( = ?auto_707458 ?auto_707465 ) ) ( not ( = ?auto_707458 ?auto_707466 ) ) ( not ( = ?auto_707459 ?auto_707460 ) ) ( not ( = ?auto_707459 ?auto_707461 ) ) ( not ( = ?auto_707459 ?auto_707462 ) ) ( not ( = ?auto_707459 ?auto_707463 ) ) ( not ( = ?auto_707459 ?auto_707464 ) ) ( not ( = ?auto_707459 ?auto_707465 ) ) ( not ( = ?auto_707459 ?auto_707466 ) ) ( not ( = ?auto_707460 ?auto_707461 ) ) ( not ( = ?auto_707460 ?auto_707462 ) ) ( not ( = ?auto_707460 ?auto_707463 ) ) ( not ( = ?auto_707460 ?auto_707464 ) ) ( not ( = ?auto_707460 ?auto_707465 ) ) ( not ( = ?auto_707460 ?auto_707466 ) ) ( not ( = ?auto_707461 ?auto_707462 ) ) ( not ( = ?auto_707461 ?auto_707463 ) ) ( not ( = ?auto_707461 ?auto_707464 ) ) ( not ( = ?auto_707461 ?auto_707465 ) ) ( not ( = ?auto_707461 ?auto_707466 ) ) ( not ( = ?auto_707462 ?auto_707463 ) ) ( not ( = ?auto_707462 ?auto_707464 ) ) ( not ( = ?auto_707462 ?auto_707465 ) ) ( not ( = ?auto_707462 ?auto_707466 ) ) ( not ( = ?auto_707463 ?auto_707464 ) ) ( not ( = ?auto_707463 ?auto_707465 ) ) ( not ( = ?auto_707463 ?auto_707466 ) ) ( not ( = ?auto_707464 ?auto_707465 ) ) ( not ( = ?auto_707464 ?auto_707466 ) ) ( not ( = ?auto_707465 ?auto_707466 ) ) ( ON ?auto_707464 ?auto_707465 ) ( ON ?auto_707463 ?auto_707464 ) ( ON ?auto_707462 ?auto_707463 ) ( ON ?auto_707461 ?auto_707462 ) ( ON ?auto_707460 ?auto_707461 ) ( ON ?auto_707459 ?auto_707460 ) ( ON ?auto_707458 ?auto_707459 ) ( ON ?auto_707457 ?auto_707458 ) ( ON ?auto_707456 ?auto_707457 ) ( ON ?auto_707455 ?auto_707456 ) ( ON ?auto_707454 ?auto_707455 ) ( ON ?auto_707453 ?auto_707454 ) ( CLEAR ?auto_707451 ) ( ON ?auto_707452 ?auto_707453 ) ( CLEAR ?auto_707452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_707451 ?auto_707452 )
      ( MAKE-15PILE ?auto_707451 ?auto_707452 ?auto_707453 ?auto_707454 ?auto_707455 ?auto_707456 ?auto_707457 ?auto_707458 ?auto_707459 ?auto_707460 ?auto_707461 ?auto_707462 ?auto_707463 ?auto_707464 ?auto_707465 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_707513 - BLOCK
      ?auto_707514 - BLOCK
      ?auto_707515 - BLOCK
      ?auto_707516 - BLOCK
      ?auto_707517 - BLOCK
      ?auto_707518 - BLOCK
      ?auto_707519 - BLOCK
      ?auto_707520 - BLOCK
      ?auto_707521 - BLOCK
      ?auto_707522 - BLOCK
      ?auto_707523 - BLOCK
      ?auto_707524 - BLOCK
      ?auto_707525 - BLOCK
      ?auto_707526 - BLOCK
      ?auto_707527 - BLOCK
    )
    :vars
    (
      ?auto_707528 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707527 ?auto_707528 ) ( not ( = ?auto_707513 ?auto_707514 ) ) ( not ( = ?auto_707513 ?auto_707515 ) ) ( not ( = ?auto_707513 ?auto_707516 ) ) ( not ( = ?auto_707513 ?auto_707517 ) ) ( not ( = ?auto_707513 ?auto_707518 ) ) ( not ( = ?auto_707513 ?auto_707519 ) ) ( not ( = ?auto_707513 ?auto_707520 ) ) ( not ( = ?auto_707513 ?auto_707521 ) ) ( not ( = ?auto_707513 ?auto_707522 ) ) ( not ( = ?auto_707513 ?auto_707523 ) ) ( not ( = ?auto_707513 ?auto_707524 ) ) ( not ( = ?auto_707513 ?auto_707525 ) ) ( not ( = ?auto_707513 ?auto_707526 ) ) ( not ( = ?auto_707513 ?auto_707527 ) ) ( not ( = ?auto_707513 ?auto_707528 ) ) ( not ( = ?auto_707514 ?auto_707515 ) ) ( not ( = ?auto_707514 ?auto_707516 ) ) ( not ( = ?auto_707514 ?auto_707517 ) ) ( not ( = ?auto_707514 ?auto_707518 ) ) ( not ( = ?auto_707514 ?auto_707519 ) ) ( not ( = ?auto_707514 ?auto_707520 ) ) ( not ( = ?auto_707514 ?auto_707521 ) ) ( not ( = ?auto_707514 ?auto_707522 ) ) ( not ( = ?auto_707514 ?auto_707523 ) ) ( not ( = ?auto_707514 ?auto_707524 ) ) ( not ( = ?auto_707514 ?auto_707525 ) ) ( not ( = ?auto_707514 ?auto_707526 ) ) ( not ( = ?auto_707514 ?auto_707527 ) ) ( not ( = ?auto_707514 ?auto_707528 ) ) ( not ( = ?auto_707515 ?auto_707516 ) ) ( not ( = ?auto_707515 ?auto_707517 ) ) ( not ( = ?auto_707515 ?auto_707518 ) ) ( not ( = ?auto_707515 ?auto_707519 ) ) ( not ( = ?auto_707515 ?auto_707520 ) ) ( not ( = ?auto_707515 ?auto_707521 ) ) ( not ( = ?auto_707515 ?auto_707522 ) ) ( not ( = ?auto_707515 ?auto_707523 ) ) ( not ( = ?auto_707515 ?auto_707524 ) ) ( not ( = ?auto_707515 ?auto_707525 ) ) ( not ( = ?auto_707515 ?auto_707526 ) ) ( not ( = ?auto_707515 ?auto_707527 ) ) ( not ( = ?auto_707515 ?auto_707528 ) ) ( not ( = ?auto_707516 ?auto_707517 ) ) ( not ( = ?auto_707516 ?auto_707518 ) ) ( not ( = ?auto_707516 ?auto_707519 ) ) ( not ( = ?auto_707516 ?auto_707520 ) ) ( not ( = ?auto_707516 ?auto_707521 ) ) ( not ( = ?auto_707516 ?auto_707522 ) ) ( not ( = ?auto_707516 ?auto_707523 ) ) ( not ( = ?auto_707516 ?auto_707524 ) ) ( not ( = ?auto_707516 ?auto_707525 ) ) ( not ( = ?auto_707516 ?auto_707526 ) ) ( not ( = ?auto_707516 ?auto_707527 ) ) ( not ( = ?auto_707516 ?auto_707528 ) ) ( not ( = ?auto_707517 ?auto_707518 ) ) ( not ( = ?auto_707517 ?auto_707519 ) ) ( not ( = ?auto_707517 ?auto_707520 ) ) ( not ( = ?auto_707517 ?auto_707521 ) ) ( not ( = ?auto_707517 ?auto_707522 ) ) ( not ( = ?auto_707517 ?auto_707523 ) ) ( not ( = ?auto_707517 ?auto_707524 ) ) ( not ( = ?auto_707517 ?auto_707525 ) ) ( not ( = ?auto_707517 ?auto_707526 ) ) ( not ( = ?auto_707517 ?auto_707527 ) ) ( not ( = ?auto_707517 ?auto_707528 ) ) ( not ( = ?auto_707518 ?auto_707519 ) ) ( not ( = ?auto_707518 ?auto_707520 ) ) ( not ( = ?auto_707518 ?auto_707521 ) ) ( not ( = ?auto_707518 ?auto_707522 ) ) ( not ( = ?auto_707518 ?auto_707523 ) ) ( not ( = ?auto_707518 ?auto_707524 ) ) ( not ( = ?auto_707518 ?auto_707525 ) ) ( not ( = ?auto_707518 ?auto_707526 ) ) ( not ( = ?auto_707518 ?auto_707527 ) ) ( not ( = ?auto_707518 ?auto_707528 ) ) ( not ( = ?auto_707519 ?auto_707520 ) ) ( not ( = ?auto_707519 ?auto_707521 ) ) ( not ( = ?auto_707519 ?auto_707522 ) ) ( not ( = ?auto_707519 ?auto_707523 ) ) ( not ( = ?auto_707519 ?auto_707524 ) ) ( not ( = ?auto_707519 ?auto_707525 ) ) ( not ( = ?auto_707519 ?auto_707526 ) ) ( not ( = ?auto_707519 ?auto_707527 ) ) ( not ( = ?auto_707519 ?auto_707528 ) ) ( not ( = ?auto_707520 ?auto_707521 ) ) ( not ( = ?auto_707520 ?auto_707522 ) ) ( not ( = ?auto_707520 ?auto_707523 ) ) ( not ( = ?auto_707520 ?auto_707524 ) ) ( not ( = ?auto_707520 ?auto_707525 ) ) ( not ( = ?auto_707520 ?auto_707526 ) ) ( not ( = ?auto_707520 ?auto_707527 ) ) ( not ( = ?auto_707520 ?auto_707528 ) ) ( not ( = ?auto_707521 ?auto_707522 ) ) ( not ( = ?auto_707521 ?auto_707523 ) ) ( not ( = ?auto_707521 ?auto_707524 ) ) ( not ( = ?auto_707521 ?auto_707525 ) ) ( not ( = ?auto_707521 ?auto_707526 ) ) ( not ( = ?auto_707521 ?auto_707527 ) ) ( not ( = ?auto_707521 ?auto_707528 ) ) ( not ( = ?auto_707522 ?auto_707523 ) ) ( not ( = ?auto_707522 ?auto_707524 ) ) ( not ( = ?auto_707522 ?auto_707525 ) ) ( not ( = ?auto_707522 ?auto_707526 ) ) ( not ( = ?auto_707522 ?auto_707527 ) ) ( not ( = ?auto_707522 ?auto_707528 ) ) ( not ( = ?auto_707523 ?auto_707524 ) ) ( not ( = ?auto_707523 ?auto_707525 ) ) ( not ( = ?auto_707523 ?auto_707526 ) ) ( not ( = ?auto_707523 ?auto_707527 ) ) ( not ( = ?auto_707523 ?auto_707528 ) ) ( not ( = ?auto_707524 ?auto_707525 ) ) ( not ( = ?auto_707524 ?auto_707526 ) ) ( not ( = ?auto_707524 ?auto_707527 ) ) ( not ( = ?auto_707524 ?auto_707528 ) ) ( not ( = ?auto_707525 ?auto_707526 ) ) ( not ( = ?auto_707525 ?auto_707527 ) ) ( not ( = ?auto_707525 ?auto_707528 ) ) ( not ( = ?auto_707526 ?auto_707527 ) ) ( not ( = ?auto_707526 ?auto_707528 ) ) ( not ( = ?auto_707527 ?auto_707528 ) ) ( ON ?auto_707526 ?auto_707527 ) ( ON ?auto_707525 ?auto_707526 ) ( ON ?auto_707524 ?auto_707525 ) ( ON ?auto_707523 ?auto_707524 ) ( ON ?auto_707522 ?auto_707523 ) ( ON ?auto_707521 ?auto_707522 ) ( ON ?auto_707520 ?auto_707521 ) ( ON ?auto_707519 ?auto_707520 ) ( ON ?auto_707518 ?auto_707519 ) ( ON ?auto_707517 ?auto_707518 ) ( ON ?auto_707516 ?auto_707517 ) ( ON ?auto_707515 ?auto_707516 ) ( ON ?auto_707514 ?auto_707515 ) ( ON ?auto_707513 ?auto_707514 ) ( CLEAR ?auto_707513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_707513 )
      ( MAKE-15PILE ?auto_707513 ?auto_707514 ?auto_707515 ?auto_707516 ?auto_707517 ?auto_707518 ?auto_707519 ?auto_707520 ?auto_707521 ?auto_707522 ?auto_707523 ?auto_707524 ?auto_707525 ?auto_707526 ?auto_707527 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707576 - BLOCK
      ?auto_707577 - BLOCK
      ?auto_707578 - BLOCK
      ?auto_707579 - BLOCK
      ?auto_707580 - BLOCK
      ?auto_707581 - BLOCK
      ?auto_707582 - BLOCK
      ?auto_707583 - BLOCK
      ?auto_707584 - BLOCK
      ?auto_707585 - BLOCK
      ?auto_707586 - BLOCK
      ?auto_707587 - BLOCK
      ?auto_707588 - BLOCK
      ?auto_707589 - BLOCK
      ?auto_707590 - BLOCK
      ?auto_707591 - BLOCK
    )
    :vars
    (
      ?auto_707592 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_707590 ) ( ON ?auto_707591 ?auto_707592 ) ( CLEAR ?auto_707591 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_707576 ) ( ON ?auto_707577 ?auto_707576 ) ( ON ?auto_707578 ?auto_707577 ) ( ON ?auto_707579 ?auto_707578 ) ( ON ?auto_707580 ?auto_707579 ) ( ON ?auto_707581 ?auto_707580 ) ( ON ?auto_707582 ?auto_707581 ) ( ON ?auto_707583 ?auto_707582 ) ( ON ?auto_707584 ?auto_707583 ) ( ON ?auto_707585 ?auto_707584 ) ( ON ?auto_707586 ?auto_707585 ) ( ON ?auto_707587 ?auto_707586 ) ( ON ?auto_707588 ?auto_707587 ) ( ON ?auto_707589 ?auto_707588 ) ( ON ?auto_707590 ?auto_707589 ) ( not ( = ?auto_707576 ?auto_707577 ) ) ( not ( = ?auto_707576 ?auto_707578 ) ) ( not ( = ?auto_707576 ?auto_707579 ) ) ( not ( = ?auto_707576 ?auto_707580 ) ) ( not ( = ?auto_707576 ?auto_707581 ) ) ( not ( = ?auto_707576 ?auto_707582 ) ) ( not ( = ?auto_707576 ?auto_707583 ) ) ( not ( = ?auto_707576 ?auto_707584 ) ) ( not ( = ?auto_707576 ?auto_707585 ) ) ( not ( = ?auto_707576 ?auto_707586 ) ) ( not ( = ?auto_707576 ?auto_707587 ) ) ( not ( = ?auto_707576 ?auto_707588 ) ) ( not ( = ?auto_707576 ?auto_707589 ) ) ( not ( = ?auto_707576 ?auto_707590 ) ) ( not ( = ?auto_707576 ?auto_707591 ) ) ( not ( = ?auto_707576 ?auto_707592 ) ) ( not ( = ?auto_707577 ?auto_707578 ) ) ( not ( = ?auto_707577 ?auto_707579 ) ) ( not ( = ?auto_707577 ?auto_707580 ) ) ( not ( = ?auto_707577 ?auto_707581 ) ) ( not ( = ?auto_707577 ?auto_707582 ) ) ( not ( = ?auto_707577 ?auto_707583 ) ) ( not ( = ?auto_707577 ?auto_707584 ) ) ( not ( = ?auto_707577 ?auto_707585 ) ) ( not ( = ?auto_707577 ?auto_707586 ) ) ( not ( = ?auto_707577 ?auto_707587 ) ) ( not ( = ?auto_707577 ?auto_707588 ) ) ( not ( = ?auto_707577 ?auto_707589 ) ) ( not ( = ?auto_707577 ?auto_707590 ) ) ( not ( = ?auto_707577 ?auto_707591 ) ) ( not ( = ?auto_707577 ?auto_707592 ) ) ( not ( = ?auto_707578 ?auto_707579 ) ) ( not ( = ?auto_707578 ?auto_707580 ) ) ( not ( = ?auto_707578 ?auto_707581 ) ) ( not ( = ?auto_707578 ?auto_707582 ) ) ( not ( = ?auto_707578 ?auto_707583 ) ) ( not ( = ?auto_707578 ?auto_707584 ) ) ( not ( = ?auto_707578 ?auto_707585 ) ) ( not ( = ?auto_707578 ?auto_707586 ) ) ( not ( = ?auto_707578 ?auto_707587 ) ) ( not ( = ?auto_707578 ?auto_707588 ) ) ( not ( = ?auto_707578 ?auto_707589 ) ) ( not ( = ?auto_707578 ?auto_707590 ) ) ( not ( = ?auto_707578 ?auto_707591 ) ) ( not ( = ?auto_707578 ?auto_707592 ) ) ( not ( = ?auto_707579 ?auto_707580 ) ) ( not ( = ?auto_707579 ?auto_707581 ) ) ( not ( = ?auto_707579 ?auto_707582 ) ) ( not ( = ?auto_707579 ?auto_707583 ) ) ( not ( = ?auto_707579 ?auto_707584 ) ) ( not ( = ?auto_707579 ?auto_707585 ) ) ( not ( = ?auto_707579 ?auto_707586 ) ) ( not ( = ?auto_707579 ?auto_707587 ) ) ( not ( = ?auto_707579 ?auto_707588 ) ) ( not ( = ?auto_707579 ?auto_707589 ) ) ( not ( = ?auto_707579 ?auto_707590 ) ) ( not ( = ?auto_707579 ?auto_707591 ) ) ( not ( = ?auto_707579 ?auto_707592 ) ) ( not ( = ?auto_707580 ?auto_707581 ) ) ( not ( = ?auto_707580 ?auto_707582 ) ) ( not ( = ?auto_707580 ?auto_707583 ) ) ( not ( = ?auto_707580 ?auto_707584 ) ) ( not ( = ?auto_707580 ?auto_707585 ) ) ( not ( = ?auto_707580 ?auto_707586 ) ) ( not ( = ?auto_707580 ?auto_707587 ) ) ( not ( = ?auto_707580 ?auto_707588 ) ) ( not ( = ?auto_707580 ?auto_707589 ) ) ( not ( = ?auto_707580 ?auto_707590 ) ) ( not ( = ?auto_707580 ?auto_707591 ) ) ( not ( = ?auto_707580 ?auto_707592 ) ) ( not ( = ?auto_707581 ?auto_707582 ) ) ( not ( = ?auto_707581 ?auto_707583 ) ) ( not ( = ?auto_707581 ?auto_707584 ) ) ( not ( = ?auto_707581 ?auto_707585 ) ) ( not ( = ?auto_707581 ?auto_707586 ) ) ( not ( = ?auto_707581 ?auto_707587 ) ) ( not ( = ?auto_707581 ?auto_707588 ) ) ( not ( = ?auto_707581 ?auto_707589 ) ) ( not ( = ?auto_707581 ?auto_707590 ) ) ( not ( = ?auto_707581 ?auto_707591 ) ) ( not ( = ?auto_707581 ?auto_707592 ) ) ( not ( = ?auto_707582 ?auto_707583 ) ) ( not ( = ?auto_707582 ?auto_707584 ) ) ( not ( = ?auto_707582 ?auto_707585 ) ) ( not ( = ?auto_707582 ?auto_707586 ) ) ( not ( = ?auto_707582 ?auto_707587 ) ) ( not ( = ?auto_707582 ?auto_707588 ) ) ( not ( = ?auto_707582 ?auto_707589 ) ) ( not ( = ?auto_707582 ?auto_707590 ) ) ( not ( = ?auto_707582 ?auto_707591 ) ) ( not ( = ?auto_707582 ?auto_707592 ) ) ( not ( = ?auto_707583 ?auto_707584 ) ) ( not ( = ?auto_707583 ?auto_707585 ) ) ( not ( = ?auto_707583 ?auto_707586 ) ) ( not ( = ?auto_707583 ?auto_707587 ) ) ( not ( = ?auto_707583 ?auto_707588 ) ) ( not ( = ?auto_707583 ?auto_707589 ) ) ( not ( = ?auto_707583 ?auto_707590 ) ) ( not ( = ?auto_707583 ?auto_707591 ) ) ( not ( = ?auto_707583 ?auto_707592 ) ) ( not ( = ?auto_707584 ?auto_707585 ) ) ( not ( = ?auto_707584 ?auto_707586 ) ) ( not ( = ?auto_707584 ?auto_707587 ) ) ( not ( = ?auto_707584 ?auto_707588 ) ) ( not ( = ?auto_707584 ?auto_707589 ) ) ( not ( = ?auto_707584 ?auto_707590 ) ) ( not ( = ?auto_707584 ?auto_707591 ) ) ( not ( = ?auto_707584 ?auto_707592 ) ) ( not ( = ?auto_707585 ?auto_707586 ) ) ( not ( = ?auto_707585 ?auto_707587 ) ) ( not ( = ?auto_707585 ?auto_707588 ) ) ( not ( = ?auto_707585 ?auto_707589 ) ) ( not ( = ?auto_707585 ?auto_707590 ) ) ( not ( = ?auto_707585 ?auto_707591 ) ) ( not ( = ?auto_707585 ?auto_707592 ) ) ( not ( = ?auto_707586 ?auto_707587 ) ) ( not ( = ?auto_707586 ?auto_707588 ) ) ( not ( = ?auto_707586 ?auto_707589 ) ) ( not ( = ?auto_707586 ?auto_707590 ) ) ( not ( = ?auto_707586 ?auto_707591 ) ) ( not ( = ?auto_707586 ?auto_707592 ) ) ( not ( = ?auto_707587 ?auto_707588 ) ) ( not ( = ?auto_707587 ?auto_707589 ) ) ( not ( = ?auto_707587 ?auto_707590 ) ) ( not ( = ?auto_707587 ?auto_707591 ) ) ( not ( = ?auto_707587 ?auto_707592 ) ) ( not ( = ?auto_707588 ?auto_707589 ) ) ( not ( = ?auto_707588 ?auto_707590 ) ) ( not ( = ?auto_707588 ?auto_707591 ) ) ( not ( = ?auto_707588 ?auto_707592 ) ) ( not ( = ?auto_707589 ?auto_707590 ) ) ( not ( = ?auto_707589 ?auto_707591 ) ) ( not ( = ?auto_707589 ?auto_707592 ) ) ( not ( = ?auto_707590 ?auto_707591 ) ) ( not ( = ?auto_707590 ?auto_707592 ) ) ( not ( = ?auto_707591 ?auto_707592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_707591 ?auto_707592 )
      ( !STACK ?auto_707591 ?auto_707590 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707642 - BLOCK
      ?auto_707643 - BLOCK
      ?auto_707644 - BLOCK
      ?auto_707645 - BLOCK
      ?auto_707646 - BLOCK
      ?auto_707647 - BLOCK
      ?auto_707648 - BLOCK
      ?auto_707649 - BLOCK
      ?auto_707650 - BLOCK
      ?auto_707651 - BLOCK
      ?auto_707652 - BLOCK
      ?auto_707653 - BLOCK
      ?auto_707654 - BLOCK
      ?auto_707655 - BLOCK
      ?auto_707656 - BLOCK
      ?auto_707657 - BLOCK
    )
    :vars
    (
      ?auto_707658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707657 ?auto_707658 ) ( ON-TABLE ?auto_707642 ) ( ON ?auto_707643 ?auto_707642 ) ( ON ?auto_707644 ?auto_707643 ) ( ON ?auto_707645 ?auto_707644 ) ( ON ?auto_707646 ?auto_707645 ) ( ON ?auto_707647 ?auto_707646 ) ( ON ?auto_707648 ?auto_707647 ) ( ON ?auto_707649 ?auto_707648 ) ( ON ?auto_707650 ?auto_707649 ) ( ON ?auto_707651 ?auto_707650 ) ( ON ?auto_707652 ?auto_707651 ) ( ON ?auto_707653 ?auto_707652 ) ( ON ?auto_707654 ?auto_707653 ) ( ON ?auto_707655 ?auto_707654 ) ( not ( = ?auto_707642 ?auto_707643 ) ) ( not ( = ?auto_707642 ?auto_707644 ) ) ( not ( = ?auto_707642 ?auto_707645 ) ) ( not ( = ?auto_707642 ?auto_707646 ) ) ( not ( = ?auto_707642 ?auto_707647 ) ) ( not ( = ?auto_707642 ?auto_707648 ) ) ( not ( = ?auto_707642 ?auto_707649 ) ) ( not ( = ?auto_707642 ?auto_707650 ) ) ( not ( = ?auto_707642 ?auto_707651 ) ) ( not ( = ?auto_707642 ?auto_707652 ) ) ( not ( = ?auto_707642 ?auto_707653 ) ) ( not ( = ?auto_707642 ?auto_707654 ) ) ( not ( = ?auto_707642 ?auto_707655 ) ) ( not ( = ?auto_707642 ?auto_707656 ) ) ( not ( = ?auto_707642 ?auto_707657 ) ) ( not ( = ?auto_707642 ?auto_707658 ) ) ( not ( = ?auto_707643 ?auto_707644 ) ) ( not ( = ?auto_707643 ?auto_707645 ) ) ( not ( = ?auto_707643 ?auto_707646 ) ) ( not ( = ?auto_707643 ?auto_707647 ) ) ( not ( = ?auto_707643 ?auto_707648 ) ) ( not ( = ?auto_707643 ?auto_707649 ) ) ( not ( = ?auto_707643 ?auto_707650 ) ) ( not ( = ?auto_707643 ?auto_707651 ) ) ( not ( = ?auto_707643 ?auto_707652 ) ) ( not ( = ?auto_707643 ?auto_707653 ) ) ( not ( = ?auto_707643 ?auto_707654 ) ) ( not ( = ?auto_707643 ?auto_707655 ) ) ( not ( = ?auto_707643 ?auto_707656 ) ) ( not ( = ?auto_707643 ?auto_707657 ) ) ( not ( = ?auto_707643 ?auto_707658 ) ) ( not ( = ?auto_707644 ?auto_707645 ) ) ( not ( = ?auto_707644 ?auto_707646 ) ) ( not ( = ?auto_707644 ?auto_707647 ) ) ( not ( = ?auto_707644 ?auto_707648 ) ) ( not ( = ?auto_707644 ?auto_707649 ) ) ( not ( = ?auto_707644 ?auto_707650 ) ) ( not ( = ?auto_707644 ?auto_707651 ) ) ( not ( = ?auto_707644 ?auto_707652 ) ) ( not ( = ?auto_707644 ?auto_707653 ) ) ( not ( = ?auto_707644 ?auto_707654 ) ) ( not ( = ?auto_707644 ?auto_707655 ) ) ( not ( = ?auto_707644 ?auto_707656 ) ) ( not ( = ?auto_707644 ?auto_707657 ) ) ( not ( = ?auto_707644 ?auto_707658 ) ) ( not ( = ?auto_707645 ?auto_707646 ) ) ( not ( = ?auto_707645 ?auto_707647 ) ) ( not ( = ?auto_707645 ?auto_707648 ) ) ( not ( = ?auto_707645 ?auto_707649 ) ) ( not ( = ?auto_707645 ?auto_707650 ) ) ( not ( = ?auto_707645 ?auto_707651 ) ) ( not ( = ?auto_707645 ?auto_707652 ) ) ( not ( = ?auto_707645 ?auto_707653 ) ) ( not ( = ?auto_707645 ?auto_707654 ) ) ( not ( = ?auto_707645 ?auto_707655 ) ) ( not ( = ?auto_707645 ?auto_707656 ) ) ( not ( = ?auto_707645 ?auto_707657 ) ) ( not ( = ?auto_707645 ?auto_707658 ) ) ( not ( = ?auto_707646 ?auto_707647 ) ) ( not ( = ?auto_707646 ?auto_707648 ) ) ( not ( = ?auto_707646 ?auto_707649 ) ) ( not ( = ?auto_707646 ?auto_707650 ) ) ( not ( = ?auto_707646 ?auto_707651 ) ) ( not ( = ?auto_707646 ?auto_707652 ) ) ( not ( = ?auto_707646 ?auto_707653 ) ) ( not ( = ?auto_707646 ?auto_707654 ) ) ( not ( = ?auto_707646 ?auto_707655 ) ) ( not ( = ?auto_707646 ?auto_707656 ) ) ( not ( = ?auto_707646 ?auto_707657 ) ) ( not ( = ?auto_707646 ?auto_707658 ) ) ( not ( = ?auto_707647 ?auto_707648 ) ) ( not ( = ?auto_707647 ?auto_707649 ) ) ( not ( = ?auto_707647 ?auto_707650 ) ) ( not ( = ?auto_707647 ?auto_707651 ) ) ( not ( = ?auto_707647 ?auto_707652 ) ) ( not ( = ?auto_707647 ?auto_707653 ) ) ( not ( = ?auto_707647 ?auto_707654 ) ) ( not ( = ?auto_707647 ?auto_707655 ) ) ( not ( = ?auto_707647 ?auto_707656 ) ) ( not ( = ?auto_707647 ?auto_707657 ) ) ( not ( = ?auto_707647 ?auto_707658 ) ) ( not ( = ?auto_707648 ?auto_707649 ) ) ( not ( = ?auto_707648 ?auto_707650 ) ) ( not ( = ?auto_707648 ?auto_707651 ) ) ( not ( = ?auto_707648 ?auto_707652 ) ) ( not ( = ?auto_707648 ?auto_707653 ) ) ( not ( = ?auto_707648 ?auto_707654 ) ) ( not ( = ?auto_707648 ?auto_707655 ) ) ( not ( = ?auto_707648 ?auto_707656 ) ) ( not ( = ?auto_707648 ?auto_707657 ) ) ( not ( = ?auto_707648 ?auto_707658 ) ) ( not ( = ?auto_707649 ?auto_707650 ) ) ( not ( = ?auto_707649 ?auto_707651 ) ) ( not ( = ?auto_707649 ?auto_707652 ) ) ( not ( = ?auto_707649 ?auto_707653 ) ) ( not ( = ?auto_707649 ?auto_707654 ) ) ( not ( = ?auto_707649 ?auto_707655 ) ) ( not ( = ?auto_707649 ?auto_707656 ) ) ( not ( = ?auto_707649 ?auto_707657 ) ) ( not ( = ?auto_707649 ?auto_707658 ) ) ( not ( = ?auto_707650 ?auto_707651 ) ) ( not ( = ?auto_707650 ?auto_707652 ) ) ( not ( = ?auto_707650 ?auto_707653 ) ) ( not ( = ?auto_707650 ?auto_707654 ) ) ( not ( = ?auto_707650 ?auto_707655 ) ) ( not ( = ?auto_707650 ?auto_707656 ) ) ( not ( = ?auto_707650 ?auto_707657 ) ) ( not ( = ?auto_707650 ?auto_707658 ) ) ( not ( = ?auto_707651 ?auto_707652 ) ) ( not ( = ?auto_707651 ?auto_707653 ) ) ( not ( = ?auto_707651 ?auto_707654 ) ) ( not ( = ?auto_707651 ?auto_707655 ) ) ( not ( = ?auto_707651 ?auto_707656 ) ) ( not ( = ?auto_707651 ?auto_707657 ) ) ( not ( = ?auto_707651 ?auto_707658 ) ) ( not ( = ?auto_707652 ?auto_707653 ) ) ( not ( = ?auto_707652 ?auto_707654 ) ) ( not ( = ?auto_707652 ?auto_707655 ) ) ( not ( = ?auto_707652 ?auto_707656 ) ) ( not ( = ?auto_707652 ?auto_707657 ) ) ( not ( = ?auto_707652 ?auto_707658 ) ) ( not ( = ?auto_707653 ?auto_707654 ) ) ( not ( = ?auto_707653 ?auto_707655 ) ) ( not ( = ?auto_707653 ?auto_707656 ) ) ( not ( = ?auto_707653 ?auto_707657 ) ) ( not ( = ?auto_707653 ?auto_707658 ) ) ( not ( = ?auto_707654 ?auto_707655 ) ) ( not ( = ?auto_707654 ?auto_707656 ) ) ( not ( = ?auto_707654 ?auto_707657 ) ) ( not ( = ?auto_707654 ?auto_707658 ) ) ( not ( = ?auto_707655 ?auto_707656 ) ) ( not ( = ?auto_707655 ?auto_707657 ) ) ( not ( = ?auto_707655 ?auto_707658 ) ) ( not ( = ?auto_707656 ?auto_707657 ) ) ( not ( = ?auto_707656 ?auto_707658 ) ) ( not ( = ?auto_707657 ?auto_707658 ) ) ( CLEAR ?auto_707655 ) ( ON ?auto_707656 ?auto_707657 ) ( CLEAR ?auto_707656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_707642 ?auto_707643 ?auto_707644 ?auto_707645 ?auto_707646 ?auto_707647 ?auto_707648 ?auto_707649 ?auto_707650 ?auto_707651 ?auto_707652 ?auto_707653 ?auto_707654 ?auto_707655 ?auto_707656 )
      ( MAKE-16PILE ?auto_707642 ?auto_707643 ?auto_707644 ?auto_707645 ?auto_707646 ?auto_707647 ?auto_707648 ?auto_707649 ?auto_707650 ?auto_707651 ?auto_707652 ?auto_707653 ?auto_707654 ?auto_707655 ?auto_707656 ?auto_707657 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707708 - BLOCK
      ?auto_707709 - BLOCK
      ?auto_707710 - BLOCK
      ?auto_707711 - BLOCK
      ?auto_707712 - BLOCK
      ?auto_707713 - BLOCK
      ?auto_707714 - BLOCK
      ?auto_707715 - BLOCK
      ?auto_707716 - BLOCK
      ?auto_707717 - BLOCK
      ?auto_707718 - BLOCK
      ?auto_707719 - BLOCK
      ?auto_707720 - BLOCK
      ?auto_707721 - BLOCK
      ?auto_707722 - BLOCK
      ?auto_707723 - BLOCK
    )
    :vars
    (
      ?auto_707724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707723 ?auto_707724 ) ( ON-TABLE ?auto_707708 ) ( ON ?auto_707709 ?auto_707708 ) ( ON ?auto_707710 ?auto_707709 ) ( ON ?auto_707711 ?auto_707710 ) ( ON ?auto_707712 ?auto_707711 ) ( ON ?auto_707713 ?auto_707712 ) ( ON ?auto_707714 ?auto_707713 ) ( ON ?auto_707715 ?auto_707714 ) ( ON ?auto_707716 ?auto_707715 ) ( ON ?auto_707717 ?auto_707716 ) ( ON ?auto_707718 ?auto_707717 ) ( ON ?auto_707719 ?auto_707718 ) ( ON ?auto_707720 ?auto_707719 ) ( not ( = ?auto_707708 ?auto_707709 ) ) ( not ( = ?auto_707708 ?auto_707710 ) ) ( not ( = ?auto_707708 ?auto_707711 ) ) ( not ( = ?auto_707708 ?auto_707712 ) ) ( not ( = ?auto_707708 ?auto_707713 ) ) ( not ( = ?auto_707708 ?auto_707714 ) ) ( not ( = ?auto_707708 ?auto_707715 ) ) ( not ( = ?auto_707708 ?auto_707716 ) ) ( not ( = ?auto_707708 ?auto_707717 ) ) ( not ( = ?auto_707708 ?auto_707718 ) ) ( not ( = ?auto_707708 ?auto_707719 ) ) ( not ( = ?auto_707708 ?auto_707720 ) ) ( not ( = ?auto_707708 ?auto_707721 ) ) ( not ( = ?auto_707708 ?auto_707722 ) ) ( not ( = ?auto_707708 ?auto_707723 ) ) ( not ( = ?auto_707708 ?auto_707724 ) ) ( not ( = ?auto_707709 ?auto_707710 ) ) ( not ( = ?auto_707709 ?auto_707711 ) ) ( not ( = ?auto_707709 ?auto_707712 ) ) ( not ( = ?auto_707709 ?auto_707713 ) ) ( not ( = ?auto_707709 ?auto_707714 ) ) ( not ( = ?auto_707709 ?auto_707715 ) ) ( not ( = ?auto_707709 ?auto_707716 ) ) ( not ( = ?auto_707709 ?auto_707717 ) ) ( not ( = ?auto_707709 ?auto_707718 ) ) ( not ( = ?auto_707709 ?auto_707719 ) ) ( not ( = ?auto_707709 ?auto_707720 ) ) ( not ( = ?auto_707709 ?auto_707721 ) ) ( not ( = ?auto_707709 ?auto_707722 ) ) ( not ( = ?auto_707709 ?auto_707723 ) ) ( not ( = ?auto_707709 ?auto_707724 ) ) ( not ( = ?auto_707710 ?auto_707711 ) ) ( not ( = ?auto_707710 ?auto_707712 ) ) ( not ( = ?auto_707710 ?auto_707713 ) ) ( not ( = ?auto_707710 ?auto_707714 ) ) ( not ( = ?auto_707710 ?auto_707715 ) ) ( not ( = ?auto_707710 ?auto_707716 ) ) ( not ( = ?auto_707710 ?auto_707717 ) ) ( not ( = ?auto_707710 ?auto_707718 ) ) ( not ( = ?auto_707710 ?auto_707719 ) ) ( not ( = ?auto_707710 ?auto_707720 ) ) ( not ( = ?auto_707710 ?auto_707721 ) ) ( not ( = ?auto_707710 ?auto_707722 ) ) ( not ( = ?auto_707710 ?auto_707723 ) ) ( not ( = ?auto_707710 ?auto_707724 ) ) ( not ( = ?auto_707711 ?auto_707712 ) ) ( not ( = ?auto_707711 ?auto_707713 ) ) ( not ( = ?auto_707711 ?auto_707714 ) ) ( not ( = ?auto_707711 ?auto_707715 ) ) ( not ( = ?auto_707711 ?auto_707716 ) ) ( not ( = ?auto_707711 ?auto_707717 ) ) ( not ( = ?auto_707711 ?auto_707718 ) ) ( not ( = ?auto_707711 ?auto_707719 ) ) ( not ( = ?auto_707711 ?auto_707720 ) ) ( not ( = ?auto_707711 ?auto_707721 ) ) ( not ( = ?auto_707711 ?auto_707722 ) ) ( not ( = ?auto_707711 ?auto_707723 ) ) ( not ( = ?auto_707711 ?auto_707724 ) ) ( not ( = ?auto_707712 ?auto_707713 ) ) ( not ( = ?auto_707712 ?auto_707714 ) ) ( not ( = ?auto_707712 ?auto_707715 ) ) ( not ( = ?auto_707712 ?auto_707716 ) ) ( not ( = ?auto_707712 ?auto_707717 ) ) ( not ( = ?auto_707712 ?auto_707718 ) ) ( not ( = ?auto_707712 ?auto_707719 ) ) ( not ( = ?auto_707712 ?auto_707720 ) ) ( not ( = ?auto_707712 ?auto_707721 ) ) ( not ( = ?auto_707712 ?auto_707722 ) ) ( not ( = ?auto_707712 ?auto_707723 ) ) ( not ( = ?auto_707712 ?auto_707724 ) ) ( not ( = ?auto_707713 ?auto_707714 ) ) ( not ( = ?auto_707713 ?auto_707715 ) ) ( not ( = ?auto_707713 ?auto_707716 ) ) ( not ( = ?auto_707713 ?auto_707717 ) ) ( not ( = ?auto_707713 ?auto_707718 ) ) ( not ( = ?auto_707713 ?auto_707719 ) ) ( not ( = ?auto_707713 ?auto_707720 ) ) ( not ( = ?auto_707713 ?auto_707721 ) ) ( not ( = ?auto_707713 ?auto_707722 ) ) ( not ( = ?auto_707713 ?auto_707723 ) ) ( not ( = ?auto_707713 ?auto_707724 ) ) ( not ( = ?auto_707714 ?auto_707715 ) ) ( not ( = ?auto_707714 ?auto_707716 ) ) ( not ( = ?auto_707714 ?auto_707717 ) ) ( not ( = ?auto_707714 ?auto_707718 ) ) ( not ( = ?auto_707714 ?auto_707719 ) ) ( not ( = ?auto_707714 ?auto_707720 ) ) ( not ( = ?auto_707714 ?auto_707721 ) ) ( not ( = ?auto_707714 ?auto_707722 ) ) ( not ( = ?auto_707714 ?auto_707723 ) ) ( not ( = ?auto_707714 ?auto_707724 ) ) ( not ( = ?auto_707715 ?auto_707716 ) ) ( not ( = ?auto_707715 ?auto_707717 ) ) ( not ( = ?auto_707715 ?auto_707718 ) ) ( not ( = ?auto_707715 ?auto_707719 ) ) ( not ( = ?auto_707715 ?auto_707720 ) ) ( not ( = ?auto_707715 ?auto_707721 ) ) ( not ( = ?auto_707715 ?auto_707722 ) ) ( not ( = ?auto_707715 ?auto_707723 ) ) ( not ( = ?auto_707715 ?auto_707724 ) ) ( not ( = ?auto_707716 ?auto_707717 ) ) ( not ( = ?auto_707716 ?auto_707718 ) ) ( not ( = ?auto_707716 ?auto_707719 ) ) ( not ( = ?auto_707716 ?auto_707720 ) ) ( not ( = ?auto_707716 ?auto_707721 ) ) ( not ( = ?auto_707716 ?auto_707722 ) ) ( not ( = ?auto_707716 ?auto_707723 ) ) ( not ( = ?auto_707716 ?auto_707724 ) ) ( not ( = ?auto_707717 ?auto_707718 ) ) ( not ( = ?auto_707717 ?auto_707719 ) ) ( not ( = ?auto_707717 ?auto_707720 ) ) ( not ( = ?auto_707717 ?auto_707721 ) ) ( not ( = ?auto_707717 ?auto_707722 ) ) ( not ( = ?auto_707717 ?auto_707723 ) ) ( not ( = ?auto_707717 ?auto_707724 ) ) ( not ( = ?auto_707718 ?auto_707719 ) ) ( not ( = ?auto_707718 ?auto_707720 ) ) ( not ( = ?auto_707718 ?auto_707721 ) ) ( not ( = ?auto_707718 ?auto_707722 ) ) ( not ( = ?auto_707718 ?auto_707723 ) ) ( not ( = ?auto_707718 ?auto_707724 ) ) ( not ( = ?auto_707719 ?auto_707720 ) ) ( not ( = ?auto_707719 ?auto_707721 ) ) ( not ( = ?auto_707719 ?auto_707722 ) ) ( not ( = ?auto_707719 ?auto_707723 ) ) ( not ( = ?auto_707719 ?auto_707724 ) ) ( not ( = ?auto_707720 ?auto_707721 ) ) ( not ( = ?auto_707720 ?auto_707722 ) ) ( not ( = ?auto_707720 ?auto_707723 ) ) ( not ( = ?auto_707720 ?auto_707724 ) ) ( not ( = ?auto_707721 ?auto_707722 ) ) ( not ( = ?auto_707721 ?auto_707723 ) ) ( not ( = ?auto_707721 ?auto_707724 ) ) ( not ( = ?auto_707722 ?auto_707723 ) ) ( not ( = ?auto_707722 ?auto_707724 ) ) ( not ( = ?auto_707723 ?auto_707724 ) ) ( ON ?auto_707722 ?auto_707723 ) ( CLEAR ?auto_707720 ) ( ON ?auto_707721 ?auto_707722 ) ( CLEAR ?auto_707721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_707708 ?auto_707709 ?auto_707710 ?auto_707711 ?auto_707712 ?auto_707713 ?auto_707714 ?auto_707715 ?auto_707716 ?auto_707717 ?auto_707718 ?auto_707719 ?auto_707720 ?auto_707721 )
      ( MAKE-16PILE ?auto_707708 ?auto_707709 ?auto_707710 ?auto_707711 ?auto_707712 ?auto_707713 ?auto_707714 ?auto_707715 ?auto_707716 ?auto_707717 ?auto_707718 ?auto_707719 ?auto_707720 ?auto_707721 ?auto_707722 ?auto_707723 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707774 - BLOCK
      ?auto_707775 - BLOCK
      ?auto_707776 - BLOCK
      ?auto_707777 - BLOCK
      ?auto_707778 - BLOCK
      ?auto_707779 - BLOCK
      ?auto_707780 - BLOCK
      ?auto_707781 - BLOCK
      ?auto_707782 - BLOCK
      ?auto_707783 - BLOCK
      ?auto_707784 - BLOCK
      ?auto_707785 - BLOCK
      ?auto_707786 - BLOCK
      ?auto_707787 - BLOCK
      ?auto_707788 - BLOCK
      ?auto_707789 - BLOCK
    )
    :vars
    (
      ?auto_707790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707789 ?auto_707790 ) ( ON-TABLE ?auto_707774 ) ( ON ?auto_707775 ?auto_707774 ) ( ON ?auto_707776 ?auto_707775 ) ( ON ?auto_707777 ?auto_707776 ) ( ON ?auto_707778 ?auto_707777 ) ( ON ?auto_707779 ?auto_707778 ) ( ON ?auto_707780 ?auto_707779 ) ( ON ?auto_707781 ?auto_707780 ) ( ON ?auto_707782 ?auto_707781 ) ( ON ?auto_707783 ?auto_707782 ) ( ON ?auto_707784 ?auto_707783 ) ( ON ?auto_707785 ?auto_707784 ) ( not ( = ?auto_707774 ?auto_707775 ) ) ( not ( = ?auto_707774 ?auto_707776 ) ) ( not ( = ?auto_707774 ?auto_707777 ) ) ( not ( = ?auto_707774 ?auto_707778 ) ) ( not ( = ?auto_707774 ?auto_707779 ) ) ( not ( = ?auto_707774 ?auto_707780 ) ) ( not ( = ?auto_707774 ?auto_707781 ) ) ( not ( = ?auto_707774 ?auto_707782 ) ) ( not ( = ?auto_707774 ?auto_707783 ) ) ( not ( = ?auto_707774 ?auto_707784 ) ) ( not ( = ?auto_707774 ?auto_707785 ) ) ( not ( = ?auto_707774 ?auto_707786 ) ) ( not ( = ?auto_707774 ?auto_707787 ) ) ( not ( = ?auto_707774 ?auto_707788 ) ) ( not ( = ?auto_707774 ?auto_707789 ) ) ( not ( = ?auto_707774 ?auto_707790 ) ) ( not ( = ?auto_707775 ?auto_707776 ) ) ( not ( = ?auto_707775 ?auto_707777 ) ) ( not ( = ?auto_707775 ?auto_707778 ) ) ( not ( = ?auto_707775 ?auto_707779 ) ) ( not ( = ?auto_707775 ?auto_707780 ) ) ( not ( = ?auto_707775 ?auto_707781 ) ) ( not ( = ?auto_707775 ?auto_707782 ) ) ( not ( = ?auto_707775 ?auto_707783 ) ) ( not ( = ?auto_707775 ?auto_707784 ) ) ( not ( = ?auto_707775 ?auto_707785 ) ) ( not ( = ?auto_707775 ?auto_707786 ) ) ( not ( = ?auto_707775 ?auto_707787 ) ) ( not ( = ?auto_707775 ?auto_707788 ) ) ( not ( = ?auto_707775 ?auto_707789 ) ) ( not ( = ?auto_707775 ?auto_707790 ) ) ( not ( = ?auto_707776 ?auto_707777 ) ) ( not ( = ?auto_707776 ?auto_707778 ) ) ( not ( = ?auto_707776 ?auto_707779 ) ) ( not ( = ?auto_707776 ?auto_707780 ) ) ( not ( = ?auto_707776 ?auto_707781 ) ) ( not ( = ?auto_707776 ?auto_707782 ) ) ( not ( = ?auto_707776 ?auto_707783 ) ) ( not ( = ?auto_707776 ?auto_707784 ) ) ( not ( = ?auto_707776 ?auto_707785 ) ) ( not ( = ?auto_707776 ?auto_707786 ) ) ( not ( = ?auto_707776 ?auto_707787 ) ) ( not ( = ?auto_707776 ?auto_707788 ) ) ( not ( = ?auto_707776 ?auto_707789 ) ) ( not ( = ?auto_707776 ?auto_707790 ) ) ( not ( = ?auto_707777 ?auto_707778 ) ) ( not ( = ?auto_707777 ?auto_707779 ) ) ( not ( = ?auto_707777 ?auto_707780 ) ) ( not ( = ?auto_707777 ?auto_707781 ) ) ( not ( = ?auto_707777 ?auto_707782 ) ) ( not ( = ?auto_707777 ?auto_707783 ) ) ( not ( = ?auto_707777 ?auto_707784 ) ) ( not ( = ?auto_707777 ?auto_707785 ) ) ( not ( = ?auto_707777 ?auto_707786 ) ) ( not ( = ?auto_707777 ?auto_707787 ) ) ( not ( = ?auto_707777 ?auto_707788 ) ) ( not ( = ?auto_707777 ?auto_707789 ) ) ( not ( = ?auto_707777 ?auto_707790 ) ) ( not ( = ?auto_707778 ?auto_707779 ) ) ( not ( = ?auto_707778 ?auto_707780 ) ) ( not ( = ?auto_707778 ?auto_707781 ) ) ( not ( = ?auto_707778 ?auto_707782 ) ) ( not ( = ?auto_707778 ?auto_707783 ) ) ( not ( = ?auto_707778 ?auto_707784 ) ) ( not ( = ?auto_707778 ?auto_707785 ) ) ( not ( = ?auto_707778 ?auto_707786 ) ) ( not ( = ?auto_707778 ?auto_707787 ) ) ( not ( = ?auto_707778 ?auto_707788 ) ) ( not ( = ?auto_707778 ?auto_707789 ) ) ( not ( = ?auto_707778 ?auto_707790 ) ) ( not ( = ?auto_707779 ?auto_707780 ) ) ( not ( = ?auto_707779 ?auto_707781 ) ) ( not ( = ?auto_707779 ?auto_707782 ) ) ( not ( = ?auto_707779 ?auto_707783 ) ) ( not ( = ?auto_707779 ?auto_707784 ) ) ( not ( = ?auto_707779 ?auto_707785 ) ) ( not ( = ?auto_707779 ?auto_707786 ) ) ( not ( = ?auto_707779 ?auto_707787 ) ) ( not ( = ?auto_707779 ?auto_707788 ) ) ( not ( = ?auto_707779 ?auto_707789 ) ) ( not ( = ?auto_707779 ?auto_707790 ) ) ( not ( = ?auto_707780 ?auto_707781 ) ) ( not ( = ?auto_707780 ?auto_707782 ) ) ( not ( = ?auto_707780 ?auto_707783 ) ) ( not ( = ?auto_707780 ?auto_707784 ) ) ( not ( = ?auto_707780 ?auto_707785 ) ) ( not ( = ?auto_707780 ?auto_707786 ) ) ( not ( = ?auto_707780 ?auto_707787 ) ) ( not ( = ?auto_707780 ?auto_707788 ) ) ( not ( = ?auto_707780 ?auto_707789 ) ) ( not ( = ?auto_707780 ?auto_707790 ) ) ( not ( = ?auto_707781 ?auto_707782 ) ) ( not ( = ?auto_707781 ?auto_707783 ) ) ( not ( = ?auto_707781 ?auto_707784 ) ) ( not ( = ?auto_707781 ?auto_707785 ) ) ( not ( = ?auto_707781 ?auto_707786 ) ) ( not ( = ?auto_707781 ?auto_707787 ) ) ( not ( = ?auto_707781 ?auto_707788 ) ) ( not ( = ?auto_707781 ?auto_707789 ) ) ( not ( = ?auto_707781 ?auto_707790 ) ) ( not ( = ?auto_707782 ?auto_707783 ) ) ( not ( = ?auto_707782 ?auto_707784 ) ) ( not ( = ?auto_707782 ?auto_707785 ) ) ( not ( = ?auto_707782 ?auto_707786 ) ) ( not ( = ?auto_707782 ?auto_707787 ) ) ( not ( = ?auto_707782 ?auto_707788 ) ) ( not ( = ?auto_707782 ?auto_707789 ) ) ( not ( = ?auto_707782 ?auto_707790 ) ) ( not ( = ?auto_707783 ?auto_707784 ) ) ( not ( = ?auto_707783 ?auto_707785 ) ) ( not ( = ?auto_707783 ?auto_707786 ) ) ( not ( = ?auto_707783 ?auto_707787 ) ) ( not ( = ?auto_707783 ?auto_707788 ) ) ( not ( = ?auto_707783 ?auto_707789 ) ) ( not ( = ?auto_707783 ?auto_707790 ) ) ( not ( = ?auto_707784 ?auto_707785 ) ) ( not ( = ?auto_707784 ?auto_707786 ) ) ( not ( = ?auto_707784 ?auto_707787 ) ) ( not ( = ?auto_707784 ?auto_707788 ) ) ( not ( = ?auto_707784 ?auto_707789 ) ) ( not ( = ?auto_707784 ?auto_707790 ) ) ( not ( = ?auto_707785 ?auto_707786 ) ) ( not ( = ?auto_707785 ?auto_707787 ) ) ( not ( = ?auto_707785 ?auto_707788 ) ) ( not ( = ?auto_707785 ?auto_707789 ) ) ( not ( = ?auto_707785 ?auto_707790 ) ) ( not ( = ?auto_707786 ?auto_707787 ) ) ( not ( = ?auto_707786 ?auto_707788 ) ) ( not ( = ?auto_707786 ?auto_707789 ) ) ( not ( = ?auto_707786 ?auto_707790 ) ) ( not ( = ?auto_707787 ?auto_707788 ) ) ( not ( = ?auto_707787 ?auto_707789 ) ) ( not ( = ?auto_707787 ?auto_707790 ) ) ( not ( = ?auto_707788 ?auto_707789 ) ) ( not ( = ?auto_707788 ?auto_707790 ) ) ( not ( = ?auto_707789 ?auto_707790 ) ) ( ON ?auto_707788 ?auto_707789 ) ( ON ?auto_707787 ?auto_707788 ) ( CLEAR ?auto_707785 ) ( ON ?auto_707786 ?auto_707787 ) ( CLEAR ?auto_707786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_707774 ?auto_707775 ?auto_707776 ?auto_707777 ?auto_707778 ?auto_707779 ?auto_707780 ?auto_707781 ?auto_707782 ?auto_707783 ?auto_707784 ?auto_707785 ?auto_707786 )
      ( MAKE-16PILE ?auto_707774 ?auto_707775 ?auto_707776 ?auto_707777 ?auto_707778 ?auto_707779 ?auto_707780 ?auto_707781 ?auto_707782 ?auto_707783 ?auto_707784 ?auto_707785 ?auto_707786 ?auto_707787 ?auto_707788 ?auto_707789 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707840 - BLOCK
      ?auto_707841 - BLOCK
      ?auto_707842 - BLOCK
      ?auto_707843 - BLOCK
      ?auto_707844 - BLOCK
      ?auto_707845 - BLOCK
      ?auto_707846 - BLOCK
      ?auto_707847 - BLOCK
      ?auto_707848 - BLOCK
      ?auto_707849 - BLOCK
      ?auto_707850 - BLOCK
      ?auto_707851 - BLOCK
      ?auto_707852 - BLOCK
      ?auto_707853 - BLOCK
      ?auto_707854 - BLOCK
      ?auto_707855 - BLOCK
    )
    :vars
    (
      ?auto_707856 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707855 ?auto_707856 ) ( ON-TABLE ?auto_707840 ) ( ON ?auto_707841 ?auto_707840 ) ( ON ?auto_707842 ?auto_707841 ) ( ON ?auto_707843 ?auto_707842 ) ( ON ?auto_707844 ?auto_707843 ) ( ON ?auto_707845 ?auto_707844 ) ( ON ?auto_707846 ?auto_707845 ) ( ON ?auto_707847 ?auto_707846 ) ( ON ?auto_707848 ?auto_707847 ) ( ON ?auto_707849 ?auto_707848 ) ( ON ?auto_707850 ?auto_707849 ) ( not ( = ?auto_707840 ?auto_707841 ) ) ( not ( = ?auto_707840 ?auto_707842 ) ) ( not ( = ?auto_707840 ?auto_707843 ) ) ( not ( = ?auto_707840 ?auto_707844 ) ) ( not ( = ?auto_707840 ?auto_707845 ) ) ( not ( = ?auto_707840 ?auto_707846 ) ) ( not ( = ?auto_707840 ?auto_707847 ) ) ( not ( = ?auto_707840 ?auto_707848 ) ) ( not ( = ?auto_707840 ?auto_707849 ) ) ( not ( = ?auto_707840 ?auto_707850 ) ) ( not ( = ?auto_707840 ?auto_707851 ) ) ( not ( = ?auto_707840 ?auto_707852 ) ) ( not ( = ?auto_707840 ?auto_707853 ) ) ( not ( = ?auto_707840 ?auto_707854 ) ) ( not ( = ?auto_707840 ?auto_707855 ) ) ( not ( = ?auto_707840 ?auto_707856 ) ) ( not ( = ?auto_707841 ?auto_707842 ) ) ( not ( = ?auto_707841 ?auto_707843 ) ) ( not ( = ?auto_707841 ?auto_707844 ) ) ( not ( = ?auto_707841 ?auto_707845 ) ) ( not ( = ?auto_707841 ?auto_707846 ) ) ( not ( = ?auto_707841 ?auto_707847 ) ) ( not ( = ?auto_707841 ?auto_707848 ) ) ( not ( = ?auto_707841 ?auto_707849 ) ) ( not ( = ?auto_707841 ?auto_707850 ) ) ( not ( = ?auto_707841 ?auto_707851 ) ) ( not ( = ?auto_707841 ?auto_707852 ) ) ( not ( = ?auto_707841 ?auto_707853 ) ) ( not ( = ?auto_707841 ?auto_707854 ) ) ( not ( = ?auto_707841 ?auto_707855 ) ) ( not ( = ?auto_707841 ?auto_707856 ) ) ( not ( = ?auto_707842 ?auto_707843 ) ) ( not ( = ?auto_707842 ?auto_707844 ) ) ( not ( = ?auto_707842 ?auto_707845 ) ) ( not ( = ?auto_707842 ?auto_707846 ) ) ( not ( = ?auto_707842 ?auto_707847 ) ) ( not ( = ?auto_707842 ?auto_707848 ) ) ( not ( = ?auto_707842 ?auto_707849 ) ) ( not ( = ?auto_707842 ?auto_707850 ) ) ( not ( = ?auto_707842 ?auto_707851 ) ) ( not ( = ?auto_707842 ?auto_707852 ) ) ( not ( = ?auto_707842 ?auto_707853 ) ) ( not ( = ?auto_707842 ?auto_707854 ) ) ( not ( = ?auto_707842 ?auto_707855 ) ) ( not ( = ?auto_707842 ?auto_707856 ) ) ( not ( = ?auto_707843 ?auto_707844 ) ) ( not ( = ?auto_707843 ?auto_707845 ) ) ( not ( = ?auto_707843 ?auto_707846 ) ) ( not ( = ?auto_707843 ?auto_707847 ) ) ( not ( = ?auto_707843 ?auto_707848 ) ) ( not ( = ?auto_707843 ?auto_707849 ) ) ( not ( = ?auto_707843 ?auto_707850 ) ) ( not ( = ?auto_707843 ?auto_707851 ) ) ( not ( = ?auto_707843 ?auto_707852 ) ) ( not ( = ?auto_707843 ?auto_707853 ) ) ( not ( = ?auto_707843 ?auto_707854 ) ) ( not ( = ?auto_707843 ?auto_707855 ) ) ( not ( = ?auto_707843 ?auto_707856 ) ) ( not ( = ?auto_707844 ?auto_707845 ) ) ( not ( = ?auto_707844 ?auto_707846 ) ) ( not ( = ?auto_707844 ?auto_707847 ) ) ( not ( = ?auto_707844 ?auto_707848 ) ) ( not ( = ?auto_707844 ?auto_707849 ) ) ( not ( = ?auto_707844 ?auto_707850 ) ) ( not ( = ?auto_707844 ?auto_707851 ) ) ( not ( = ?auto_707844 ?auto_707852 ) ) ( not ( = ?auto_707844 ?auto_707853 ) ) ( not ( = ?auto_707844 ?auto_707854 ) ) ( not ( = ?auto_707844 ?auto_707855 ) ) ( not ( = ?auto_707844 ?auto_707856 ) ) ( not ( = ?auto_707845 ?auto_707846 ) ) ( not ( = ?auto_707845 ?auto_707847 ) ) ( not ( = ?auto_707845 ?auto_707848 ) ) ( not ( = ?auto_707845 ?auto_707849 ) ) ( not ( = ?auto_707845 ?auto_707850 ) ) ( not ( = ?auto_707845 ?auto_707851 ) ) ( not ( = ?auto_707845 ?auto_707852 ) ) ( not ( = ?auto_707845 ?auto_707853 ) ) ( not ( = ?auto_707845 ?auto_707854 ) ) ( not ( = ?auto_707845 ?auto_707855 ) ) ( not ( = ?auto_707845 ?auto_707856 ) ) ( not ( = ?auto_707846 ?auto_707847 ) ) ( not ( = ?auto_707846 ?auto_707848 ) ) ( not ( = ?auto_707846 ?auto_707849 ) ) ( not ( = ?auto_707846 ?auto_707850 ) ) ( not ( = ?auto_707846 ?auto_707851 ) ) ( not ( = ?auto_707846 ?auto_707852 ) ) ( not ( = ?auto_707846 ?auto_707853 ) ) ( not ( = ?auto_707846 ?auto_707854 ) ) ( not ( = ?auto_707846 ?auto_707855 ) ) ( not ( = ?auto_707846 ?auto_707856 ) ) ( not ( = ?auto_707847 ?auto_707848 ) ) ( not ( = ?auto_707847 ?auto_707849 ) ) ( not ( = ?auto_707847 ?auto_707850 ) ) ( not ( = ?auto_707847 ?auto_707851 ) ) ( not ( = ?auto_707847 ?auto_707852 ) ) ( not ( = ?auto_707847 ?auto_707853 ) ) ( not ( = ?auto_707847 ?auto_707854 ) ) ( not ( = ?auto_707847 ?auto_707855 ) ) ( not ( = ?auto_707847 ?auto_707856 ) ) ( not ( = ?auto_707848 ?auto_707849 ) ) ( not ( = ?auto_707848 ?auto_707850 ) ) ( not ( = ?auto_707848 ?auto_707851 ) ) ( not ( = ?auto_707848 ?auto_707852 ) ) ( not ( = ?auto_707848 ?auto_707853 ) ) ( not ( = ?auto_707848 ?auto_707854 ) ) ( not ( = ?auto_707848 ?auto_707855 ) ) ( not ( = ?auto_707848 ?auto_707856 ) ) ( not ( = ?auto_707849 ?auto_707850 ) ) ( not ( = ?auto_707849 ?auto_707851 ) ) ( not ( = ?auto_707849 ?auto_707852 ) ) ( not ( = ?auto_707849 ?auto_707853 ) ) ( not ( = ?auto_707849 ?auto_707854 ) ) ( not ( = ?auto_707849 ?auto_707855 ) ) ( not ( = ?auto_707849 ?auto_707856 ) ) ( not ( = ?auto_707850 ?auto_707851 ) ) ( not ( = ?auto_707850 ?auto_707852 ) ) ( not ( = ?auto_707850 ?auto_707853 ) ) ( not ( = ?auto_707850 ?auto_707854 ) ) ( not ( = ?auto_707850 ?auto_707855 ) ) ( not ( = ?auto_707850 ?auto_707856 ) ) ( not ( = ?auto_707851 ?auto_707852 ) ) ( not ( = ?auto_707851 ?auto_707853 ) ) ( not ( = ?auto_707851 ?auto_707854 ) ) ( not ( = ?auto_707851 ?auto_707855 ) ) ( not ( = ?auto_707851 ?auto_707856 ) ) ( not ( = ?auto_707852 ?auto_707853 ) ) ( not ( = ?auto_707852 ?auto_707854 ) ) ( not ( = ?auto_707852 ?auto_707855 ) ) ( not ( = ?auto_707852 ?auto_707856 ) ) ( not ( = ?auto_707853 ?auto_707854 ) ) ( not ( = ?auto_707853 ?auto_707855 ) ) ( not ( = ?auto_707853 ?auto_707856 ) ) ( not ( = ?auto_707854 ?auto_707855 ) ) ( not ( = ?auto_707854 ?auto_707856 ) ) ( not ( = ?auto_707855 ?auto_707856 ) ) ( ON ?auto_707854 ?auto_707855 ) ( ON ?auto_707853 ?auto_707854 ) ( ON ?auto_707852 ?auto_707853 ) ( CLEAR ?auto_707850 ) ( ON ?auto_707851 ?auto_707852 ) ( CLEAR ?auto_707851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_707840 ?auto_707841 ?auto_707842 ?auto_707843 ?auto_707844 ?auto_707845 ?auto_707846 ?auto_707847 ?auto_707848 ?auto_707849 ?auto_707850 ?auto_707851 )
      ( MAKE-16PILE ?auto_707840 ?auto_707841 ?auto_707842 ?auto_707843 ?auto_707844 ?auto_707845 ?auto_707846 ?auto_707847 ?auto_707848 ?auto_707849 ?auto_707850 ?auto_707851 ?auto_707852 ?auto_707853 ?auto_707854 ?auto_707855 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707906 - BLOCK
      ?auto_707907 - BLOCK
      ?auto_707908 - BLOCK
      ?auto_707909 - BLOCK
      ?auto_707910 - BLOCK
      ?auto_707911 - BLOCK
      ?auto_707912 - BLOCK
      ?auto_707913 - BLOCK
      ?auto_707914 - BLOCK
      ?auto_707915 - BLOCK
      ?auto_707916 - BLOCK
      ?auto_707917 - BLOCK
      ?auto_707918 - BLOCK
      ?auto_707919 - BLOCK
      ?auto_707920 - BLOCK
      ?auto_707921 - BLOCK
    )
    :vars
    (
      ?auto_707922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707921 ?auto_707922 ) ( ON-TABLE ?auto_707906 ) ( ON ?auto_707907 ?auto_707906 ) ( ON ?auto_707908 ?auto_707907 ) ( ON ?auto_707909 ?auto_707908 ) ( ON ?auto_707910 ?auto_707909 ) ( ON ?auto_707911 ?auto_707910 ) ( ON ?auto_707912 ?auto_707911 ) ( ON ?auto_707913 ?auto_707912 ) ( ON ?auto_707914 ?auto_707913 ) ( ON ?auto_707915 ?auto_707914 ) ( not ( = ?auto_707906 ?auto_707907 ) ) ( not ( = ?auto_707906 ?auto_707908 ) ) ( not ( = ?auto_707906 ?auto_707909 ) ) ( not ( = ?auto_707906 ?auto_707910 ) ) ( not ( = ?auto_707906 ?auto_707911 ) ) ( not ( = ?auto_707906 ?auto_707912 ) ) ( not ( = ?auto_707906 ?auto_707913 ) ) ( not ( = ?auto_707906 ?auto_707914 ) ) ( not ( = ?auto_707906 ?auto_707915 ) ) ( not ( = ?auto_707906 ?auto_707916 ) ) ( not ( = ?auto_707906 ?auto_707917 ) ) ( not ( = ?auto_707906 ?auto_707918 ) ) ( not ( = ?auto_707906 ?auto_707919 ) ) ( not ( = ?auto_707906 ?auto_707920 ) ) ( not ( = ?auto_707906 ?auto_707921 ) ) ( not ( = ?auto_707906 ?auto_707922 ) ) ( not ( = ?auto_707907 ?auto_707908 ) ) ( not ( = ?auto_707907 ?auto_707909 ) ) ( not ( = ?auto_707907 ?auto_707910 ) ) ( not ( = ?auto_707907 ?auto_707911 ) ) ( not ( = ?auto_707907 ?auto_707912 ) ) ( not ( = ?auto_707907 ?auto_707913 ) ) ( not ( = ?auto_707907 ?auto_707914 ) ) ( not ( = ?auto_707907 ?auto_707915 ) ) ( not ( = ?auto_707907 ?auto_707916 ) ) ( not ( = ?auto_707907 ?auto_707917 ) ) ( not ( = ?auto_707907 ?auto_707918 ) ) ( not ( = ?auto_707907 ?auto_707919 ) ) ( not ( = ?auto_707907 ?auto_707920 ) ) ( not ( = ?auto_707907 ?auto_707921 ) ) ( not ( = ?auto_707907 ?auto_707922 ) ) ( not ( = ?auto_707908 ?auto_707909 ) ) ( not ( = ?auto_707908 ?auto_707910 ) ) ( not ( = ?auto_707908 ?auto_707911 ) ) ( not ( = ?auto_707908 ?auto_707912 ) ) ( not ( = ?auto_707908 ?auto_707913 ) ) ( not ( = ?auto_707908 ?auto_707914 ) ) ( not ( = ?auto_707908 ?auto_707915 ) ) ( not ( = ?auto_707908 ?auto_707916 ) ) ( not ( = ?auto_707908 ?auto_707917 ) ) ( not ( = ?auto_707908 ?auto_707918 ) ) ( not ( = ?auto_707908 ?auto_707919 ) ) ( not ( = ?auto_707908 ?auto_707920 ) ) ( not ( = ?auto_707908 ?auto_707921 ) ) ( not ( = ?auto_707908 ?auto_707922 ) ) ( not ( = ?auto_707909 ?auto_707910 ) ) ( not ( = ?auto_707909 ?auto_707911 ) ) ( not ( = ?auto_707909 ?auto_707912 ) ) ( not ( = ?auto_707909 ?auto_707913 ) ) ( not ( = ?auto_707909 ?auto_707914 ) ) ( not ( = ?auto_707909 ?auto_707915 ) ) ( not ( = ?auto_707909 ?auto_707916 ) ) ( not ( = ?auto_707909 ?auto_707917 ) ) ( not ( = ?auto_707909 ?auto_707918 ) ) ( not ( = ?auto_707909 ?auto_707919 ) ) ( not ( = ?auto_707909 ?auto_707920 ) ) ( not ( = ?auto_707909 ?auto_707921 ) ) ( not ( = ?auto_707909 ?auto_707922 ) ) ( not ( = ?auto_707910 ?auto_707911 ) ) ( not ( = ?auto_707910 ?auto_707912 ) ) ( not ( = ?auto_707910 ?auto_707913 ) ) ( not ( = ?auto_707910 ?auto_707914 ) ) ( not ( = ?auto_707910 ?auto_707915 ) ) ( not ( = ?auto_707910 ?auto_707916 ) ) ( not ( = ?auto_707910 ?auto_707917 ) ) ( not ( = ?auto_707910 ?auto_707918 ) ) ( not ( = ?auto_707910 ?auto_707919 ) ) ( not ( = ?auto_707910 ?auto_707920 ) ) ( not ( = ?auto_707910 ?auto_707921 ) ) ( not ( = ?auto_707910 ?auto_707922 ) ) ( not ( = ?auto_707911 ?auto_707912 ) ) ( not ( = ?auto_707911 ?auto_707913 ) ) ( not ( = ?auto_707911 ?auto_707914 ) ) ( not ( = ?auto_707911 ?auto_707915 ) ) ( not ( = ?auto_707911 ?auto_707916 ) ) ( not ( = ?auto_707911 ?auto_707917 ) ) ( not ( = ?auto_707911 ?auto_707918 ) ) ( not ( = ?auto_707911 ?auto_707919 ) ) ( not ( = ?auto_707911 ?auto_707920 ) ) ( not ( = ?auto_707911 ?auto_707921 ) ) ( not ( = ?auto_707911 ?auto_707922 ) ) ( not ( = ?auto_707912 ?auto_707913 ) ) ( not ( = ?auto_707912 ?auto_707914 ) ) ( not ( = ?auto_707912 ?auto_707915 ) ) ( not ( = ?auto_707912 ?auto_707916 ) ) ( not ( = ?auto_707912 ?auto_707917 ) ) ( not ( = ?auto_707912 ?auto_707918 ) ) ( not ( = ?auto_707912 ?auto_707919 ) ) ( not ( = ?auto_707912 ?auto_707920 ) ) ( not ( = ?auto_707912 ?auto_707921 ) ) ( not ( = ?auto_707912 ?auto_707922 ) ) ( not ( = ?auto_707913 ?auto_707914 ) ) ( not ( = ?auto_707913 ?auto_707915 ) ) ( not ( = ?auto_707913 ?auto_707916 ) ) ( not ( = ?auto_707913 ?auto_707917 ) ) ( not ( = ?auto_707913 ?auto_707918 ) ) ( not ( = ?auto_707913 ?auto_707919 ) ) ( not ( = ?auto_707913 ?auto_707920 ) ) ( not ( = ?auto_707913 ?auto_707921 ) ) ( not ( = ?auto_707913 ?auto_707922 ) ) ( not ( = ?auto_707914 ?auto_707915 ) ) ( not ( = ?auto_707914 ?auto_707916 ) ) ( not ( = ?auto_707914 ?auto_707917 ) ) ( not ( = ?auto_707914 ?auto_707918 ) ) ( not ( = ?auto_707914 ?auto_707919 ) ) ( not ( = ?auto_707914 ?auto_707920 ) ) ( not ( = ?auto_707914 ?auto_707921 ) ) ( not ( = ?auto_707914 ?auto_707922 ) ) ( not ( = ?auto_707915 ?auto_707916 ) ) ( not ( = ?auto_707915 ?auto_707917 ) ) ( not ( = ?auto_707915 ?auto_707918 ) ) ( not ( = ?auto_707915 ?auto_707919 ) ) ( not ( = ?auto_707915 ?auto_707920 ) ) ( not ( = ?auto_707915 ?auto_707921 ) ) ( not ( = ?auto_707915 ?auto_707922 ) ) ( not ( = ?auto_707916 ?auto_707917 ) ) ( not ( = ?auto_707916 ?auto_707918 ) ) ( not ( = ?auto_707916 ?auto_707919 ) ) ( not ( = ?auto_707916 ?auto_707920 ) ) ( not ( = ?auto_707916 ?auto_707921 ) ) ( not ( = ?auto_707916 ?auto_707922 ) ) ( not ( = ?auto_707917 ?auto_707918 ) ) ( not ( = ?auto_707917 ?auto_707919 ) ) ( not ( = ?auto_707917 ?auto_707920 ) ) ( not ( = ?auto_707917 ?auto_707921 ) ) ( not ( = ?auto_707917 ?auto_707922 ) ) ( not ( = ?auto_707918 ?auto_707919 ) ) ( not ( = ?auto_707918 ?auto_707920 ) ) ( not ( = ?auto_707918 ?auto_707921 ) ) ( not ( = ?auto_707918 ?auto_707922 ) ) ( not ( = ?auto_707919 ?auto_707920 ) ) ( not ( = ?auto_707919 ?auto_707921 ) ) ( not ( = ?auto_707919 ?auto_707922 ) ) ( not ( = ?auto_707920 ?auto_707921 ) ) ( not ( = ?auto_707920 ?auto_707922 ) ) ( not ( = ?auto_707921 ?auto_707922 ) ) ( ON ?auto_707920 ?auto_707921 ) ( ON ?auto_707919 ?auto_707920 ) ( ON ?auto_707918 ?auto_707919 ) ( ON ?auto_707917 ?auto_707918 ) ( CLEAR ?auto_707915 ) ( ON ?auto_707916 ?auto_707917 ) ( CLEAR ?auto_707916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_707906 ?auto_707907 ?auto_707908 ?auto_707909 ?auto_707910 ?auto_707911 ?auto_707912 ?auto_707913 ?auto_707914 ?auto_707915 ?auto_707916 )
      ( MAKE-16PILE ?auto_707906 ?auto_707907 ?auto_707908 ?auto_707909 ?auto_707910 ?auto_707911 ?auto_707912 ?auto_707913 ?auto_707914 ?auto_707915 ?auto_707916 ?auto_707917 ?auto_707918 ?auto_707919 ?auto_707920 ?auto_707921 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_707972 - BLOCK
      ?auto_707973 - BLOCK
      ?auto_707974 - BLOCK
      ?auto_707975 - BLOCK
      ?auto_707976 - BLOCK
      ?auto_707977 - BLOCK
      ?auto_707978 - BLOCK
      ?auto_707979 - BLOCK
      ?auto_707980 - BLOCK
      ?auto_707981 - BLOCK
      ?auto_707982 - BLOCK
      ?auto_707983 - BLOCK
      ?auto_707984 - BLOCK
      ?auto_707985 - BLOCK
      ?auto_707986 - BLOCK
      ?auto_707987 - BLOCK
    )
    :vars
    (
      ?auto_707988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_707987 ?auto_707988 ) ( ON-TABLE ?auto_707972 ) ( ON ?auto_707973 ?auto_707972 ) ( ON ?auto_707974 ?auto_707973 ) ( ON ?auto_707975 ?auto_707974 ) ( ON ?auto_707976 ?auto_707975 ) ( ON ?auto_707977 ?auto_707976 ) ( ON ?auto_707978 ?auto_707977 ) ( ON ?auto_707979 ?auto_707978 ) ( ON ?auto_707980 ?auto_707979 ) ( not ( = ?auto_707972 ?auto_707973 ) ) ( not ( = ?auto_707972 ?auto_707974 ) ) ( not ( = ?auto_707972 ?auto_707975 ) ) ( not ( = ?auto_707972 ?auto_707976 ) ) ( not ( = ?auto_707972 ?auto_707977 ) ) ( not ( = ?auto_707972 ?auto_707978 ) ) ( not ( = ?auto_707972 ?auto_707979 ) ) ( not ( = ?auto_707972 ?auto_707980 ) ) ( not ( = ?auto_707972 ?auto_707981 ) ) ( not ( = ?auto_707972 ?auto_707982 ) ) ( not ( = ?auto_707972 ?auto_707983 ) ) ( not ( = ?auto_707972 ?auto_707984 ) ) ( not ( = ?auto_707972 ?auto_707985 ) ) ( not ( = ?auto_707972 ?auto_707986 ) ) ( not ( = ?auto_707972 ?auto_707987 ) ) ( not ( = ?auto_707972 ?auto_707988 ) ) ( not ( = ?auto_707973 ?auto_707974 ) ) ( not ( = ?auto_707973 ?auto_707975 ) ) ( not ( = ?auto_707973 ?auto_707976 ) ) ( not ( = ?auto_707973 ?auto_707977 ) ) ( not ( = ?auto_707973 ?auto_707978 ) ) ( not ( = ?auto_707973 ?auto_707979 ) ) ( not ( = ?auto_707973 ?auto_707980 ) ) ( not ( = ?auto_707973 ?auto_707981 ) ) ( not ( = ?auto_707973 ?auto_707982 ) ) ( not ( = ?auto_707973 ?auto_707983 ) ) ( not ( = ?auto_707973 ?auto_707984 ) ) ( not ( = ?auto_707973 ?auto_707985 ) ) ( not ( = ?auto_707973 ?auto_707986 ) ) ( not ( = ?auto_707973 ?auto_707987 ) ) ( not ( = ?auto_707973 ?auto_707988 ) ) ( not ( = ?auto_707974 ?auto_707975 ) ) ( not ( = ?auto_707974 ?auto_707976 ) ) ( not ( = ?auto_707974 ?auto_707977 ) ) ( not ( = ?auto_707974 ?auto_707978 ) ) ( not ( = ?auto_707974 ?auto_707979 ) ) ( not ( = ?auto_707974 ?auto_707980 ) ) ( not ( = ?auto_707974 ?auto_707981 ) ) ( not ( = ?auto_707974 ?auto_707982 ) ) ( not ( = ?auto_707974 ?auto_707983 ) ) ( not ( = ?auto_707974 ?auto_707984 ) ) ( not ( = ?auto_707974 ?auto_707985 ) ) ( not ( = ?auto_707974 ?auto_707986 ) ) ( not ( = ?auto_707974 ?auto_707987 ) ) ( not ( = ?auto_707974 ?auto_707988 ) ) ( not ( = ?auto_707975 ?auto_707976 ) ) ( not ( = ?auto_707975 ?auto_707977 ) ) ( not ( = ?auto_707975 ?auto_707978 ) ) ( not ( = ?auto_707975 ?auto_707979 ) ) ( not ( = ?auto_707975 ?auto_707980 ) ) ( not ( = ?auto_707975 ?auto_707981 ) ) ( not ( = ?auto_707975 ?auto_707982 ) ) ( not ( = ?auto_707975 ?auto_707983 ) ) ( not ( = ?auto_707975 ?auto_707984 ) ) ( not ( = ?auto_707975 ?auto_707985 ) ) ( not ( = ?auto_707975 ?auto_707986 ) ) ( not ( = ?auto_707975 ?auto_707987 ) ) ( not ( = ?auto_707975 ?auto_707988 ) ) ( not ( = ?auto_707976 ?auto_707977 ) ) ( not ( = ?auto_707976 ?auto_707978 ) ) ( not ( = ?auto_707976 ?auto_707979 ) ) ( not ( = ?auto_707976 ?auto_707980 ) ) ( not ( = ?auto_707976 ?auto_707981 ) ) ( not ( = ?auto_707976 ?auto_707982 ) ) ( not ( = ?auto_707976 ?auto_707983 ) ) ( not ( = ?auto_707976 ?auto_707984 ) ) ( not ( = ?auto_707976 ?auto_707985 ) ) ( not ( = ?auto_707976 ?auto_707986 ) ) ( not ( = ?auto_707976 ?auto_707987 ) ) ( not ( = ?auto_707976 ?auto_707988 ) ) ( not ( = ?auto_707977 ?auto_707978 ) ) ( not ( = ?auto_707977 ?auto_707979 ) ) ( not ( = ?auto_707977 ?auto_707980 ) ) ( not ( = ?auto_707977 ?auto_707981 ) ) ( not ( = ?auto_707977 ?auto_707982 ) ) ( not ( = ?auto_707977 ?auto_707983 ) ) ( not ( = ?auto_707977 ?auto_707984 ) ) ( not ( = ?auto_707977 ?auto_707985 ) ) ( not ( = ?auto_707977 ?auto_707986 ) ) ( not ( = ?auto_707977 ?auto_707987 ) ) ( not ( = ?auto_707977 ?auto_707988 ) ) ( not ( = ?auto_707978 ?auto_707979 ) ) ( not ( = ?auto_707978 ?auto_707980 ) ) ( not ( = ?auto_707978 ?auto_707981 ) ) ( not ( = ?auto_707978 ?auto_707982 ) ) ( not ( = ?auto_707978 ?auto_707983 ) ) ( not ( = ?auto_707978 ?auto_707984 ) ) ( not ( = ?auto_707978 ?auto_707985 ) ) ( not ( = ?auto_707978 ?auto_707986 ) ) ( not ( = ?auto_707978 ?auto_707987 ) ) ( not ( = ?auto_707978 ?auto_707988 ) ) ( not ( = ?auto_707979 ?auto_707980 ) ) ( not ( = ?auto_707979 ?auto_707981 ) ) ( not ( = ?auto_707979 ?auto_707982 ) ) ( not ( = ?auto_707979 ?auto_707983 ) ) ( not ( = ?auto_707979 ?auto_707984 ) ) ( not ( = ?auto_707979 ?auto_707985 ) ) ( not ( = ?auto_707979 ?auto_707986 ) ) ( not ( = ?auto_707979 ?auto_707987 ) ) ( not ( = ?auto_707979 ?auto_707988 ) ) ( not ( = ?auto_707980 ?auto_707981 ) ) ( not ( = ?auto_707980 ?auto_707982 ) ) ( not ( = ?auto_707980 ?auto_707983 ) ) ( not ( = ?auto_707980 ?auto_707984 ) ) ( not ( = ?auto_707980 ?auto_707985 ) ) ( not ( = ?auto_707980 ?auto_707986 ) ) ( not ( = ?auto_707980 ?auto_707987 ) ) ( not ( = ?auto_707980 ?auto_707988 ) ) ( not ( = ?auto_707981 ?auto_707982 ) ) ( not ( = ?auto_707981 ?auto_707983 ) ) ( not ( = ?auto_707981 ?auto_707984 ) ) ( not ( = ?auto_707981 ?auto_707985 ) ) ( not ( = ?auto_707981 ?auto_707986 ) ) ( not ( = ?auto_707981 ?auto_707987 ) ) ( not ( = ?auto_707981 ?auto_707988 ) ) ( not ( = ?auto_707982 ?auto_707983 ) ) ( not ( = ?auto_707982 ?auto_707984 ) ) ( not ( = ?auto_707982 ?auto_707985 ) ) ( not ( = ?auto_707982 ?auto_707986 ) ) ( not ( = ?auto_707982 ?auto_707987 ) ) ( not ( = ?auto_707982 ?auto_707988 ) ) ( not ( = ?auto_707983 ?auto_707984 ) ) ( not ( = ?auto_707983 ?auto_707985 ) ) ( not ( = ?auto_707983 ?auto_707986 ) ) ( not ( = ?auto_707983 ?auto_707987 ) ) ( not ( = ?auto_707983 ?auto_707988 ) ) ( not ( = ?auto_707984 ?auto_707985 ) ) ( not ( = ?auto_707984 ?auto_707986 ) ) ( not ( = ?auto_707984 ?auto_707987 ) ) ( not ( = ?auto_707984 ?auto_707988 ) ) ( not ( = ?auto_707985 ?auto_707986 ) ) ( not ( = ?auto_707985 ?auto_707987 ) ) ( not ( = ?auto_707985 ?auto_707988 ) ) ( not ( = ?auto_707986 ?auto_707987 ) ) ( not ( = ?auto_707986 ?auto_707988 ) ) ( not ( = ?auto_707987 ?auto_707988 ) ) ( ON ?auto_707986 ?auto_707987 ) ( ON ?auto_707985 ?auto_707986 ) ( ON ?auto_707984 ?auto_707985 ) ( ON ?auto_707983 ?auto_707984 ) ( ON ?auto_707982 ?auto_707983 ) ( CLEAR ?auto_707980 ) ( ON ?auto_707981 ?auto_707982 ) ( CLEAR ?auto_707981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_707972 ?auto_707973 ?auto_707974 ?auto_707975 ?auto_707976 ?auto_707977 ?auto_707978 ?auto_707979 ?auto_707980 ?auto_707981 )
      ( MAKE-16PILE ?auto_707972 ?auto_707973 ?auto_707974 ?auto_707975 ?auto_707976 ?auto_707977 ?auto_707978 ?auto_707979 ?auto_707980 ?auto_707981 ?auto_707982 ?auto_707983 ?auto_707984 ?auto_707985 ?auto_707986 ?auto_707987 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708038 - BLOCK
      ?auto_708039 - BLOCK
      ?auto_708040 - BLOCK
      ?auto_708041 - BLOCK
      ?auto_708042 - BLOCK
      ?auto_708043 - BLOCK
      ?auto_708044 - BLOCK
      ?auto_708045 - BLOCK
      ?auto_708046 - BLOCK
      ?auto_708047 - BLOCK
      ?auto_708048 - BLOCK
      ?auto_708049 - BLOCK
      ?auto_708050 - BLOCK
      ?auto_708051 - BLOCK
      ?auto_708052 - BLOCK
      ?auto_708053 - BLOCK
    )
    :vars
    (
      ?auto_708054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708053 ?auto_708054 ) ( ON-TABLE ?auto_708038 ) ( ON ?auto_708039 ?auto_708038 ) ( ON ?auto_708040 ?auto_708039 ) ( ON ?auto_708041 ?auto_708040 ) ( ON ?auto_708042 ?auto_708041 ) ( ON ?auto_708043 ?auto_708042 ) ( ON ?auto_708044 ?auto_708043 ) ( ON ?auto_708045 ?auto_708044 ) ( not ( = ?auto_708038 ?auto_708039 ) ) ( not ( = ?auto_708038 ?auto_708040 ) ) ( not ( = ?auto_708038 ?auto_708041 ) ) ( not ( = ?auto_708038 ?auto_708042 ) ) ( not ( = ?auto_708038 ?auto_708043 ) ) ( not ( = ?auto_708038 ?auto_708044 ) ) ( not ( = ?auto_708038 ?auto_708045 ) ) ( not ( = ?auto_708038 ?auto_708046 ) ) ( not ( = ?auto_708038 ?auto_708047 ) ) ( not ( = ?auto_708038 ?auto_708048 ) ) ( not ( = ?auto_708038 ?auto_708049 ) ) ( not ( = ?auto_708038 ?auto_708050 ) ) ( not ( = ?auto_708038 ?auto_708051 ) ) ( not ( = ?auto_708038 ?auto_708052 ) ) ( not ( = ?auto_708038 ?auto_708053 ) ) ( not ( = ?auto_708038 ?auto_708054 ) ) ( not ( = ?auto_708039 ?auto_708040 ) ) ( not ( = ?auto_708039 ?auto_708041 ) ) ( not ( = ?auto_708039 ?auto_708042 ) ) ( not ( = ?auto_708039 ?auto_708043 ) ) ( not ( = ?auto_708039 ?auto_708044 ) ) ( not ( = ?auto_708039 ?auto_708045 ) ) ( not ( = ?auto_708039 ?auto_708046 ) ) ( not ( = ?auto_708039 ?auto_708047 ) ) ( not ( = ?auto_708039 ?auto_708048 ) ) ( not ( = ?auto_708039 ?auto_708049 ) ) ( not ( = ?auto_708039 ?auto_708050 ) ) ( not ( = ?auto_708039 ?auto_708051 ) ) ( not ( = ?auto_708039 ?auto_708052 ) ) ( not ( = ?auto_708039 ?auto_708053 ) ) ( not ( = ?auto_708039 ?auto_708054 ) ) ( not ( = ?auto_708040 ?auto_708041 ) ) ( not ( = ?auto_708040 ?auto_708042 ) ) ( not ( = ?auto_708040 ?auto_708043 ) ) ( not ( = ?auto_708040 ?auto_708044 ) ) ( not ( = ?auto_708040 ?auto_708045 ) ) ( not ( = ?auto_708040 ?auto_708046 ) ) ( not ( = ?auto_708040 ?auto_708047 ) ) ( not ( = ?auto_708040 ?auto_708048 ) ) ( not ( = ?auto_708040 ?auto_708049 ) ) ( not ( = ?auto_708040 ?auto_708050 ) ) ( not ( = ?auto_708040 ?auto_708051 ) ) ( not ( = ?auto_708040 ?auto_708052 ) ) ( not ( = ?auto_708040 ?auto_708053 ) ) ( not ( = ?auto_708040 ?auto_708054 ) ) ( not ( = ?auto_708041 ?auto_708042 ) ) ( not ( = ?auto_708041 ?auto_708043 ) ) ( not ( = ?auto_708041 ?auto_708044 ) ) ( not ( = ?auto_708041 ?auto_708045 ) ) ( not ( = ?auto_708041 ?auto_708046 ) ) ( not ( = ?auto_708041 ?auto_708047 ) ) ( not ( = ?auto_708041 ?auto_708048 ) ) ( not ( = ?auto_708041 ?auto_708049 ) ) ( not ( = ?auto_708041 ?auto_708050 ) ) ( not ( = ?auto_708041 ?auto_708051 ) ) ( not ( = ?auto_708041 ?auto_708052 ) ) ( not ( = ?auto_708041 ?auto_708053 ) ) ( not ( = ?auto_708041 ?auto_708054 ) ) ( not ( = ?auto_708042 ?auto_708043 ) ) ( not ( = ?auto_708042 ?auto_708044 ) ) ( not ( = ?auto_708042 ?auto_708045 ) ) ( not ( = ?auto_708042 ?auto_708046 ) ) ( not ( = ?auto_708042 ?auto_708047 ) ) ( not ( = ?auto_708042 ?auto_708048 ) ) ( not ( = ?auto_708042 ?auto_708049 ) ) ( not ( = ?auto_708042 ?auto_708050 ) ) ( not ( = ?auto_708042 ?auto_708051 ) ) ( not ( = ?auto_708042 ?auto_708052 ) ) ( not ( = ?auto_708042 ?auto_708053 ) ) ( not ( = ?auto_708042 ?auto_708054 ) ) ( not ( = ?auto_708043 ?auto_708044 ) ) ( not ( = ?auto_708043 ?auto_708045 ) ) ( not ( = ?auto_708043 ?auto_708046 ) ) ( not ( = ?auto_708043 ?auto_708047 ) ) ( not ( = ?auto_708043 ?auto_708048 ) ) ( not ( = ?auto_708043 ?auto_708049 ) ) ( not ( = ?auto_708043 ?auto_708050 ) ) ( not ( = ?auto_708043 ?auto_708051 ) ) ( not ( = ?auto_708043 ?auto_708052 ) ) ( not ( = ?auto_708043 ?auto_708053 ) ) ( not ( = ?auto_708043 ?auto_708054 ) ) ( not ( = ?auto_708044 ?auto_708045 ) ) ( not ( = ?auto_708044 ?auto_708046 ) ) ( not ( = ?auto_708044 ?auto_708047 ) ) ( not ( = ?auto_708044 ?auto_708048 ) ) ( not ( = ?auto_708044 ?auto_708049 ) ) ( not ( = ?auto_708044 ?auto_708050 ) ) ( not ( = ?auto_708044 ?auto_708051 ) ) ( not ( = ?auto_708044 ?auto_708052 ) ) ( not ( = ?auto_708044 ?auto_708053 ) ) ( not ( = ?auto_708044 ?auto_708054 ) ) ( not ( = ?auto_708045 ?auto_708046 ) ) ( not ( = ?auto_708045 ?auto_708047 ) ) ( not ( = ?auto_708045 ?auto_708048 ) ) ( not ( = ?auto_708045 ?auto_708049 ) ) ( not ( = ?auto_708045 ?auto_708050 ) ) ( not ( = ?auto_708045 ?auto_708051 ) ) ( not ( = ?auto_708045 ?auto_708052 ) ) ( not ( = ?auto_708045 ?auto_708053 ) ) ( not ( = ?auto_708045 ?auto_708054 ) ) ( not ( = ?auto_708046 ?auto_708047 ) ) ( not ( = ?auto_708046 ?auto_708048 ) ) ( not ( = ?auto_708046 ?auto_708049 ) ) ( not ( = ?auto_708046 ?auto_708050 ) ) ( not ( = ?auto_708046 ?auto_708051 ) ) ( not ( = ?auto_708046 ?auto_708052 ) ) ( not ( = ?auto_708046 ?auto_708053 ) ) ( not ( = ?auto_708046 ?auto_708054 ) ) ( not ( = ?auto_708047 ?auto_708048 ) ) ( not ( = ?auto_708047 ?auto_708049 ) ) ( not ( = ?auto_708047 ?auto_708050 ) ) ( not ( = ?auto_708047 ?auto_708051 ) ) ( not ( = ?auto_708047 ?auto_708052 ) ) ( not ( = ?auto_708047 ?auto_708053 ) ) ( not ( = ?auto_708047 ?auto_708054 ) ) ( not ( = ?auto_708048 ?auto_708049 ) ) ( not ( = ?auto_708048 ?auto_708050 ) ) ( not ( = ?auto_708048 ?auto_708051 ) ) ( not ( = ?auto_708048 ?auto_708052 ) ) ( not ( = ?auto_708048 ?auto_708053 ) ) ( not ( = ?auto_708048 ?auto_708054 ) ) ( not ( = ?auto_708049 ?auto_708050 ) ) ( not ( = ?auto_708049 ?auto_708051 ) ) ( not ( = ?auto_708049 ?auto_708052 ) ) ( not ( = ?auto_708049 ?auto_708053 ) ) ( not ( = ?auto_708049 ?auto_708054 ) ) ( not ( = ?auto_708050 ?auto_708051 ) ) ( not ( = ?auto_708050 ?auto_708052 ) ) ( not ( = ?auto_708050 ?auto_708053 ) ) ( not ( = ?auto_708050 ?auto_708054 ) ) ( not ( = ?auto_708051 ?auto_708052 ) ) ( not ( = ?auto_708051 ?auto_708053 ) ) ( not ( = ?auto_708051 ?auto_708054 ) ) ( not ( = ?auto_708052 ?auto_708053 ) ) ( not ( = ?auto_708052 ?auto_708054 ) ) ( not ( = ?auto_708053 ?auto_708054 ) ) ( ON ?auto_708052 ?auto_708053 ) ( ON ?auto_708051 ?auto_708052 ) ( ON ?auto_708050 ?auto_708051 ) ( ON ?auto_708049 ?auto_708050 ) ( ON ?auto_708048 ?auto_708049 ) ( ON ?auto_708047 ?auto_708048 ) ( CLEAR ?auto_708045 ) ( ON ?auto_708046 ?auto_708047 ) ( CLEAR ?auto_708046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_708038 ?auto_708039 ?auto_708040 ?auto_708041 ?auto_708042 ?auto_708043 ?auto_708044 ?auto_708045 ?auto_708046 )
      ( MAKE-16PILE ?auto_708038 ?auto_708039 ?auto_708040 ?auto_708041 ?auto_708042 ?auto_708043 ?auto_708044 ?auto_708045 ?auto_708046 ?auto_708047 ?auto_708048 ?auto_708049 ?auto_708050 ?auto_708051 ?auto_708052 ?auto_708053 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708104 - BLOCK
      ?auto_708105 - BLOCK
      ?auto_708106 - BLOCK
      ?auto_708107 - BLOCK
      ?auto_708108 - BLOCK
      ?auto_708109 - BLOCK
      ?auto_708110 - BLOCK
      ?auto_708111 - BLOCK
      ?auto_708112 - BLOCK
      ?auto_708113 - BLOCK
      ?auto_708114 - BLOCK
      ?auto_708115 - BLOCK
      ?auto_708116 - BLOCK
      ?auto_708117 - BLOCK
      ?auto_708118 - BLOCK
      ?auto_708119 - BLOCK
    )
    :vars
    (
      ?auto_708120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708119 ?auto_708120 ) ( ON-TABLE ?auto_708104 ) ( ON ?auto_708105 ?auto_708104 ) ( ON ?auto_708106 ?auto_708105 ) ( ON ?auto_708107 ?auto_708106 ) ( ON ?auto_708108 ?auto_708107 ) ( ON ?auto_708109 ?auto_708108 ) ( ON ?auto_708110 ?auto_708109 ) ( not ( = ?auto_708104 ?auto_708105 ) ) ( not ( = ?auto_708104 ?auto_708106 ) ) ( not ( = ?auto_708104 ?auto_708107 ) ) ( not ( = ?auto_708104 ?auto_708108 ) ) ( not ( = ?auto_708104 ?auto_708109 ) ) ( not ( = ?auto_708104 ?auto_708110 ) ) ( not ( = ?auto_708104 ?auto_708111 ) ) ( not ( = ?auto_708104 ?auto_708112 ) ) ( not ( = ?auto_708104 ?auto_708113 ) ) ( not ( = ?auto_708104 ?auto_708114 ) ) ( not ( = ?auto_708104 ?auto_708115 ) ) ( not ( = ?auto_708104 ?auto_708116 ) ) ( not ( = ?auto_708104 ?auto_708117 ) ) ( not ( = ?auto_708104 ?auto_708118 ) ) ( not ( = ?auto_708104 ?auto_708119 ) ) ( not ( = ?auto_708104 ?auto_708120 ) ) ( not ( = ?auto_708105 ?auto_708106 ) ) ( not ( = ?auto_708105 ?auto_708107 ) ) ( not ( = ?auto_708105 ?auto_708108 ) ) ( not ( = ?auto_708105 ?auto_708109 ) ) ( not ( = ?auto_708105 ?auto_708110 ) ) ( not ( = ?auto_708105 ?auto_708111 ) ) ( not ( = ?auto_708105 ?auto_708112 ) ) ( not ( = ?auto_708105 ?auto_708113 ) ) ( not ( = ?auto_708105 ?auto_708114 ) ) ( not ( = ?auto_708105 ?auto_708115 ) ) ( not ( = ?auto_708105 ?auto_708116 ) ) ( not ( = ?auto_708105 ?auto_708117 ) ) ( not ( = ?auto_708105 ?auto_708118 ) ) ( not ( = ?auto_708105 ?auto_708119 ) ) ( not ( = ?auto_708105 ?auto_708120 ) ) ( not ( = ?auto_708106 ?auto_708107 ) ) ( not ( = ?auto_708106 ?auto_708108 ) ) ( not ( = ?auto_708106 ?auto_708109 ) ) ( not ( = ?auto_708106 ?auto_708110 ) ) ( not ( = ?auto_708106 ?auto_708111 ) ) ( not ( = ?auto_708106 ?auto_708112 ) ) ( not ( = ?auto_708106 ?auto_708113 ) ) ( not ( = ?auto_708106 ?auto_708114 ) ) ( not ( = ?auto_708106 ?auto_708115 ) ) ( not ( = ?auto_708106 ?auto_708116 ) ) ( not ( = ?auto_708106 ?auto_708117 ) ) ( not ( = ?auto_708106 ?auto_708118 ) ) ( not ( = ?auto_708106 ?auto_708119 ) ) ( not ( = ?auto_708106 ?auto_708120 ) ) ( not ( = ?auto_708107 ?auto_708108 ) ) ( not ( = ?auto_708107 ?auto_708109 ) ) ( not ( = ?auto_708107 ?auto_708110 ) ) ( not ( = ?auto_708107 ?auto_708111 ) ) ( not ( = ?auto_708107 ?auto_708112 ) ) ( not ( = ?auto_708107 ?auto_708113 ) ) ( not ( = ?auto_708107 ?auto_708114 ) ) ( not ( = ?auto_708107 ?auto_708115 ) ) ( not ( = ?auto_708107 ?auto_708116 ) ) ( not ( = ?auto_708107 ?auto_708117 ) ) ( not ( = ?auto_708107 ?auto_708118 ) ) ( not ( = ?auto_708107 ?auto_708119 ) ) ( not ( = ?auto_708107 ?auto_708120 ) ) ( not ( = ?auto_708108 ?auto_708109 ) ) ( not ( = ?auto_708108 ?auto_708110 ) ) ( not ( = ?auto_708108 ?auto_708111 ) ) ( not ( = ?auto_708108 ?auto_708112 ) ) ( not ( = ?auto_708108 ?auto_708113 ) ) ( not ( = ?auto_708108 ?auto_708114 ) ) ( not ( = ?auto_708108 ?auto_708115 ) ) ( not ( = ?auto_708108 ?auto_708116 ) ) ( not ( = ?auto_708108 ?auto_708117 ) ) ( not ( = ?auto_708108 ?auto_708118 ) ) ( not ( = ?auto_708108 ?auto_708119 ) ) ( not ( = ?auto_708108 ?auto_708120 ) ) ( not ( = ?auto_708109 ?auto_708110 ) ) ( not ( = ?auto_708109 ?auto_708111 ) ) ( not ( = ?auto_708109 ?auto_708112 ) ) ( not ( = ?auto_708109 ?auto_708113 ) ) ( not ( = ?auto_708109 ?auto_708114 ) ) ( not ( = ?auto_708109 ?auto_708115 ) ) ( not ( = ?auto_708109 ?auto_708116 ) ) ( not ( = ?auto_708109 ?auto_708117 ) ) ( not ( = ?auto_708109 ?auto_708118 ) ) ( not ( = ?auto_708109 ?auto_708119 ) ) ( not ( = ?auto_708109 ?auto_708120 ) ) ( not ( = ?auto_708110 ?auto_708111 ) ) ( not ( = ?auto_708110 ?auto_708112 ) ) ( not ( = ?auto_708110 ?auto_708113 ) ) ( not ( = ?auto_708110 ?auto_708114 ) ) ( not ( = ?auto_708110 ?auto_708115 ) ) ( not ( = ?auto_708110 ?auto_708116 ) ) ( not ( = ?auto_708110 ?auto_708117 ) ) ( not ( = ?auto_708110 ?auto_708118 ) ) ( not ( = ?auto_708110 ?auto_708119 ) ) ( not ( = ?auto_708110 ?auto_708120 ) ) ( not ( = ?auto_708111 ?auto_708112 ) ) ( not ( = ?auto_708111 ?auto_708113 ) ) ( not ( = ?auto_708111 ?auto_708114 ) ) ( not ( = ?auto_708111 ?auto_708115 ) ) ( not ( = ?auto_708111 ?auto_708116 ) ) ( not ( = ?auto_708111 ?auto_708117 ) ) ( not ( = ?auto_708111 ?auto_708118 ) ) ( not ( = ?auto_708111 ?auto_708119 ) ) ( not ( = ?auto_708111 ?auto_708120 ) ) ( not ( = ?auto_708112 ?auto_708113 ) ) ( not ( = ?auto_708112 ?auto_708114 ) ) ( not ( = ?auto_708112 ?auto_708115 ) ) ( not ( = ?auto_708112 ?auto_708116 ) ) ( not ( = ?auto_708112 ?auto_708117 ) ) ( not ( = ?auto_708112 ?auto_708118 ) ) ( not ( = ?auto_708112 ?auto_708119 ) ) ( not ( = ?auto_708112 ?auto_708120 ) ) ( not ( = ?auto_708113 ?auto_708114 ) ) ( not ( = ?auto_708113 ?auto_708115 ) ) ( not ( = ?auto_708113 ?auto_708116 ) ) ( not ( = ?auto_708113 ?auto_708117 ) ) ( not ( = ?auto_708113 ?auto_708118 ) ) ( not ( = ?auto_708113 ?auto_708119 ) ) ( not ( = ?auto_708113 ?auto_708120 ) ) ( not ( = ?auto_708114 ?auto_708115 ) ) ( not ( = ?auto_708114 ?auto_708116 ) ) ( not ( = ?auto_708114 ?auto_708117 ) ) ( not ( = ?auto_708114 ?auto_708118 ) ) ( not ( = ?auto_708114 ?auto_708119 ) ) ( not ( = ?auto_708114 ?auto_708120 ) ) ( not ( = ?auto_708115 ?auto_708116 ) ) ( not ( = ?auto_708115 ?auto_708117 ) ) ( not ( = ?auto_708115 ?auto_708118 ) ) ( not ( = ?auto_708115 ?auto_708119 ) ) ( not ( = ?auto_708115 ?auto_708120 ) ) ( not ( = ?auto_708116 ?auto_708117 ) ) ( not ( = ?auto_708116 ?auto_708118 ) ) ( not ( = ?auto_708116 ?auto_708119 ) ) ( not ( = ?auto_708116 ?auto_708120 ) ) ( not ( = ?auto_708117 ?auto_708118 ) ) ( not ( = ?auto_708117 ?auto_708119 ) ) ( not ( = ?auto_708117 ?auto_708120 ) ) ( not ( = ?auto_708118 ?auto_708119 ) ) ( not ( = ?auto_708118 ?auto_708120 ) ) ( not ( = ?auto_708119 ?auto_708120 ) ) ( ON ?auto_708118 ?auto_708119 ) ( ON ?auto_708117 ?auto_708118 ) ( ON ?auto_708116 ?auto_708117 ) ( ON ?auto_708115 ?auto_708116 ) ( ON ?auto_708114 ?auto_708115 ) ( ON ?auto_708113 ?auto_708114 ) ( ON ?auto_708112 ?auto_708113 ) ( CLEAR ?auto_708110 ) ( ON ?auto_708111 ?auto_708112 ) ( CLEAR ?auto_708111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_708104 ?auto_708105 ?auto_708106 ?auto_708107 ?auto_708108 ?auto_708109 ?auto_708110 ?auto_708111 )
      ( MAKE-16PILE ?auto_708104 ?auto_708105 ?auto_708106 ?auto_708107 ?auto_708108 ?auto_708109 ?auto_708110 ?auto_708111 ?auto_708112 ?auto_708113 ?auto_708114 ?auto_708115 ?auto_708116 ?auto_708117 ?auto_708118 ?auto_708119 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708170 - BLOCK
      ?auto_708171 - BLOCK
      ?auto_708172 - BLOCK
      ?auto_708173 - BLOCK
      ?auto_708174 - BLOCK
      ?auto_708175 - BLOCK
      ?auto_708176 - BLOCK
      ?auto_708177 - BLOCK
      ?auto_708178 - BLOCK
      ?auto_708179 - BLOCK
      ?auto_708180 - BLOCK
      ?auto_708181 - BLOCK
      ?auto_708182 - BLOCK
      ?auto_708183 - BLOCK
      ?auto_708184 - BLOCK
      ?auto_708185 - BLOCK
    )
    :vars
    (
      ?auto_708186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708185 ?auto_708186 ) ( ON-TABLE ?auto_708170 ) ( ON ?auto_708171 ?auto_708170 ) ( ON ?auto_708172 ?auto_708171 ) ( ON ?auto_708173 ?auto_708172 ) ( ON ?auto_708174 ?auto_708173 ) ( ON ?auto_708175 ?auto_708174 ) ( not ( = ?auto_708170 ?auto_708171 ) ) ( not ( = ?auto_708170 ?auto_708172 ) ) ( not ( = ?auto_708170 ?auto_708173 ) ) ( not ( = ?auto_708170 ?auto_708174 ) ) ( not ( = ?auto_708170 ?auto_708175 ) ) ( not ( = ?auto_708170 ?auto_708176 ) ) ( not ( = ?auto_708170 ?auto_708177 ) ) ( not ( = ?auto_708170 ?auto_708178 ) ) ( not ( = ?auto_708170 ?auto_708179 ) ) ( not ( = ?auto_708170 ?auto_708180 ) ) ( not ( = ?auto_708170 ?auto_708181 ) ) ( not ( = ?auto_708170 ?auto_708182 ) ) ( not ( = ?auto_708170 ?auto_708183 ) ) ( not ( = ?auto_708170 ?auto_708184 ) ) ( not ( = ?auto_708170 ?auto_708185 ) ) ( not ( = ?auto_708170 ?auto_708186 ) ) ( not ( = ?auto_708171 ?auto_708172 ) ) ( not ( = ?auto_708171 ?auto_708173 ) ) ( not ( = ?auto_708171 ?auto_708174 ) ) ( not ( = ?auto_708171 ?auto_708175 ) ) ( not ( = ?auto_708171 ?auto_708176 ) ) ( not ( = ?auto_708171 ?auto_708177 ) ) ( not ( = ?auto_708171 ?auto_708178 ) ) ( not ( = ?auto_708171 ?auto_708179 ) ) ( not ( = ?auto_708171 ?auto_708180 ) ) ( not ( = ?auto_708171 ?auto_708181 ) ) ( not ( = ?auto_708171 ?auto_708182 ) ) ( not ( = ?auto_708171 ?auto_708183 ) ) ( not ( = ?auto_708171 ?auto_708184 ) ) ( not ( = ?auto_708171 ?auto_708185 ) ) ( not ( = ?auto_708171 ?auto_708186 ) ) ( not ( = ?auto_708172 ?auto_708173 ) ) ( not ( = ?auto_708172 ?auto_708174 ) ) ( not ( = ?auto_708172 ?auto_708175 ) ) ( not ( = ?auto_708172 ?auto_708176 ) ) ( not ( = ?auto_708172 ?auto_708177 ) ) ( not ( = ?auto_708172 ?auto_708178 ) ) ( not ( = ?auto_708172 ?auto_708179 ) ) ( not ( = ?auto_708172 ?auto_708180 ) ) ( not ( = ?auto_708172 ?auto_708181 ) ) ( not ( = ?auto_708172 ?auto_708182 ) ) ( not ( = ?auto_708172 ?auto_708183 ) ) ( not ( = ?auto_708172 ?auto_708184 ) ) ( not ( = ?auto_708172 ?auto_708185 ) ) ( not ( = ?auto_708172 ?auto_708186 ) ) ( not ( = ?auto_708173 ?auto_708174 ) ) ( not ( = ?auto_708173 ?auto_708175 ) ) ( not ( = ?auto_708173 ?auto_708176 ) ) ( not ( = ?auto_708173 ?auto_708177 ) ) ( not ( = ?auto_708173 ?auto_708178 ) ) ( not ( = ?auto_708173 ?auto_708179 ) ) ( not ( = ?auto_708173 ?auto_708180 ) ) ( not ( = ?auto_708173 ?auto_708181 ) ) ( not ( = ?auto_708173 ?auto_708182 ) ) ( not ( = ?auto_708173 ?auto_708183 ) ) ( not ( = ?auto_708173 ?auto_708184 ) ) ( not ( = ?auto_708173 ?auto_708185 ) ) ( not ( = ?auto_708173 ?auto_708186 ) ) ( not ( = ?auto_708174 ?auto_708175 ) ) ( not ( = ?auto_708174 ?auto_708176 ) ) ( not ( = ?auto_708174 ?auto_708177 ) ) ( not ( = ?auto_708174 ?auto_708178 ) ) ( not ( = ?auto_708174 ?auto_708179 ) ) ( not ( = ?auto_708174 ?auto_708180 ) ) ( not ( = ?auto_708174 ?auto_708181 ) ) ( not ( = ?auto_708174 ?auto_708182 ) ) ( not ( = ?auto_708174 ?auto_708183 ) ) ( not ( = ?auto_708174 ?auto_708184 ) ) ( not ( = ?auto_708174 ?auto_708185 ) ) ( not ( = ?auto_708174 ?auto_708186 ) ) ( not ( = ?auto_708175 ?auto_708176 ) ) ( not ( = ?auto_708175 ?auto_708177 ) ) ( not ( = ?auto_708175 ?auto_708178 ) ) ( not ( = ?auto_708175 ?auto_708179 ) ) ( not ( = ?auto_708175 ?auto_708180 ) ) ( not ( = ?auto_708175 ?auto_708181 ) ) ( not ( = ?auto_708175 ?auto_708182 ) ) ( not ( = ?auto_708175 ?auto_708183 ) ) ( not ( = ?auto_708175 ?auto_708184 ) ) ( not ( = ?auto_708175 ?auto_708185 ) ) ( not ( = ?auto_708175 ?auto_708186 ) ) ( not ( = ?auto_708176 ?auto_708177 ) ) ( not ( = ?auto_708176 ?auto_708178 ) ) ( not ( = ?auto_708176 ?auto_708179 ) ) ( not ( = ?auto_708176 ?auto_708180 ) ) ( not ( = ?auto_708176 ?auto_708181 ) ) ( not ( = ?auto_708176 ?auto_708182 ) ) ( not ( = ?auto_708176 ?auto_708183 ) ) ( not ( = ?auto_708176 ?auto_708184 ) ) ( not ( = ?auto_708176 ?auto_708185 ) ) ( not ( = ?auto_708176 ?auto_708186 ) ) ( not ( = ?auto_708177 ?auto_708178 ) ) ( not ( = ?auto_708177 ?auto_708179 ) ) ( not ( = ?auto_708177 ?auto_708180 ) ) ( not ( = ?auto_708177 ?auto_708181 ) ) ( not ( = ?auto_708177 ?auto_708182 ) ) ( not ( = ?auto_708177 ?auto_708183 ) ) ( not ( = ?auto_708177 ?auto_708184 ) ) ( not ( = ?auto_708177 ?auto_708185 ) ) ( not ( = ?auto_708177 ?auto_708186 ) ) ( not ( = ?auto_708178 ?auto_708179 ) ) ( not ( = ?auto_708178 ?auto_708180 ) ) ( not ( = ?auto_708178 ?auto_708181 ) ) ( not ( = ?auto_708178 ?auto_708182 ) ) ( not ( = ?auto_708178 ?auto_708183 ) ) ( not ( = ?auto_708178 ?auto_708184 ) ) ( not ( = ?auto_708178 ?auto_708185 ) ) ( not ( = ?auto_708178 ?auto_708186 ) ) ( not ( = ?auto_708179 ?auto_708180 ) ) ( not ( = ?auto_708179 ?auto_708181 ) ) ( not ( = ?auto_708179 ?auto_708182 ) ) ( not ( = ?auto_708179 ?auto_708183 ) ) ( not ( = ?auto_708179 ?auto_708184 ) ) ( not ( = ?auto_708179 ?auto_708185 ) ) ( not ( = ?auto_708179 ?auto_708186 ) ) ( not ( = ?auto_708180 ?auto_708181 ) ) ( not ( = ?auto_708180 ?auto_708182 ) ) ( not ( = ?auto_708180 ?auto_708183 ) ) ( not ( = ?auto_708180 ?auto_708184 ) ) ( not ( = ?auto_708180 ?auto_708185 ) ) ( not ( = ?auto_708180 ?auto_708186 ) ) ( not ( = ?auto_708181 ?auto_708182 ) ) ( not ( = ?auto_708181 ?auto_708183 ) ) ( not ( = ?auto_708181 ?auto_708184 ) ) ( not ( = ?auto_708181 ?auto_708185 ) ) ( not ( = ?auto_708181 ?auto_708186 ) ) ( not ( = ?auto_708182 ?auto_708183 ) ) ( not ( = ?auto_708182 ?auto_708184 ) ) ( not ( = ?auto_708182 ?auto_708185 ) ) ( not ( = ?auto_708182 ?auto_708186 ) ) ( not ( = ?auto_708183 ?auto_708184 ) ) ( not ( = ?auto_708183 ?auto_708185 ) ) ( not ( = ?auto_708183 ?auto_708186 ) ) ( not ( = ?auto_708184 ?auto_708185 ) ) ( not ( = ?auto_708184 ?auto_708186 ) ) ( not ( = ?auto_708185 ?auto_708186 ) ) ( ON ?auto_708184 ?auto_708185 ) ( ON ?auto_708183 ?auto_708184 ) ( ON ?auto_708182 ?auto_708183 ) ( ON ?auto_708181 ?auto_708182 ) ( ON ?auto_708180 ?auto_708181 ) ( ON ?auto_708179 ?auto_708180 ) ( ON ?auto_708178 ?auto_708179 ) ( ON ?auto_708177 ?auto_708178 ) ( CLEAR ?auto_708175 ) ( ON ?auto_708176 ?auto_708177 ) ( CLEAR ?auto_708176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_708170 ?auto_708171 ?auto_708172 ?auto_708173 ?auto_708174 ?auto_708175 ?auto_708176 )
      ( MAKE-16PILE ?auto_708170 ?auto_708171 ?auto_708172 ?auto_708173 ?auto_708174 ?auto_708175 ?auto_708176 ?auto_708177 ?auto_708178 ?auto_708179 ?auto_708180 ?auto_708181 ?auto_708182 ?auto_708183 ?auto_708184 ?auto_708185 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708236 - BLOCK
      ?auto_708237 - BLOCK
      ?auto_708238 - BLOCK
      ?auto_708239 - BLOCK
      ?auto_708240 - BLOCK
      ?auto_708241 - BLOCK
      ?auto_708242 - BLOCK
      ?auto_708243 - BLOCK
      ?auto_708244 - BLOCK
      ?auto_708245 - BLOCK
      ?auto_708246 - BLOCK
      ?auto_708247 - BLOCK
      ?auto_708248 - BLOCK
      ?auto_708249 - BLOCK
      ?auto_708250 - BLOCK
      ?auto_708251 - BLOCK
    )
    :vars
    (
      ?auto_708252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708251 ?auto_708252 ) ( ON-TABLE ?auto_708236 ) ( ON ?auto_708237 ?auto_708236 ) ( ON ?auto_708238 ?auto_708237 ) ( ON ?auto_708239 ?auto_708238 ) ( ON ?auto_708240 ?auto_708239 ) ( not ( = ?auto_708236 ?auto_708237 ) ) ( not ( = ?auto_708236 ?auto_708238 ) ) ( not ( = ?auto_708236 ?auto_708239 ) ) ( not ( = ?auto_708236 ?auto_708240 ) ) ( not ( = ?auto_708236 ?auto_708241 ) ) ( not ( = ?auto_708236 ?auto_708242 ) ) ( not ( = ?auto_708236 ?auto_708243 ) ) ( not ( = ?auto_708236 ?auto_708244 ) ) ( not ( = ?auto_708236 ?auto_708245 ) ) ( not ( = ?auto_708236 ?auto_708246 ) ) ( not ( = ?auto_708236 ?auto_708247 ) ) ( not ( = ?auto_708236 ?auto_708248 ) ) ( not ( = ?auto_708236 ?auto_708249 ) ) ( not ( = ?auto_708236 ?auto_708250 ) ) ( not ( = ?auto_708236 ?auto_708251 ) ) ( not ( = ?auto_708236 ?auto_708252 ) ) ( not ( = ?auto_708237 ?auto_708238 ) ) ( not ( = ?auto_708237 ?auto_708239 ) ) ( not ( = ?auto_708237 ?auto_708240 ) ) ( not ( = ?auto_708237 ?auto_708241 ) ) ( not ( = ?auto_708237 ?auto_708242 ) ) ( not ( = ?auto_708237 ?auto_708243 ) ) ( not ( = ?auto_708237 ?auto_708244 ) ) ( not ( = ?auto_708237 ?auto_708245 ) ) ( not ( = ?auto_708237 ?auto_708246 ) ) ( not ( = ?auto_708237 ?auto_708247 ) ) ( not ( = ?auto_708237 ?auto_708248 ) ) ( not ( = ?auto_708237 ?auto_708249 ) ) ( not ( = ?auto_708237 ?auto_708250 ) ) ( not ( = ?auto_708237 ?auto_708251 ) ) ( not ( = ?auto_708237 ?auto_708252 ) ) ( not ( = ?auto_708238 ?auto_708239 ) ) ( not ( = ?auto_708238 ?auto_708240 ) ) ( not ( = ?auto_708238 ?auto_708241 ) ) ( not ( = ?auto_708238 ?auto_708242 ) ) ( not ( = ?auto_708238 ?auto_708243 ) ) ( not ( = ?auto_708238 ?auto_708244 ) ) ( not ( = ?auto_708238 ?auto_708245 ) ) ( not ( = ?auto_708238 ?auto_708246 ) ) ( not ( = ?auto_708238 ?auto_708247 ) ) ( not ( = ?auto_708238 ?auto_708248 ) ) ( not ( = ?auto_708238 ?auto_708249 ) ) ( not ( = ?auto_708238 ?auto_708250 ) ) ( not ( = ?auto_708238 ?auto_708251 ) ) ( not ( = ?auto_708238 ?auto_708252 ) ) ( not ( = ?auto_708239 ?auto_708240 ) ) ( not ( = ?auto_708239 ?auto_708241 ) ) ( not ( = ?auto_708239 ?auto_708242 ) ) ( not ( = ?auto_708239 ?auto_708243 ) ) ( not ( = ?auto_708239 ?auto_708244 ) ) ( not ( = ?auto_708239 ?auto_708245 ) ) ( not ( = ?auto_708239 ?auto_708246 ) ) ( not ( = ?auto_708239 ?auto_708247 ) ) ( not ( = ?auto_708239 ?auto_708248 ) ) ( not ( = ?auto_708239 ?auto_708249 ) ) ( not ( = ?auto_708239 ?auto_708250 ) ) ( not ( = ?auto_708239 ?auto_708251 ) ) ( not ( = ?auto_708239 ?auto_708252 ) ) ( not ( = ?auto_708240 ?auto_708241 ) ) ( not ( = ?auto_708240 ?auto_708242 ) ) ( not ( = ?auto_708240 ?auto_708243 ) ) ( not ( = ?auto_708240 ?auto_708244 ) ) ( not ( = ?auto_708240 ?auto_708245 ) ) ( not ( = ?auto_708240 ?auto_708246 ) ) ( not ( = ?auto_708240 ?auto_708247 ) ) ( not ( = ?auto_708240 ?auto_708248 ) ) ( not ( = ?auto_708240 ?auto_708249 ) ) ( not ( = ?auto_708240 ?auto_708250 ) ) ( not ( = ?auto_708240 ?auto_708251 ) ) ( not ( = ?auto_708240 ?auto_708252 ) ) ( not ( = ?auto_708241 ?auto_708242 ) ) ( not ( = ?auto_708241 ?auto_708243 ) ) ( not ( = ?auto_708241 ?auto_708244 ) ) ( not ( = ?auto_708241 ?auto_708245 ) ) ( not ( = ?auto_708241 ?auto_708246 ) ) ( not ( = ?auto_708241 ?auto_708247 ) ) ( not ( = ?auto_708241 ?auto_708248 ) ) ( not ( = ?auto_708241 ?auto_708249 ) ) ( not ( = ?auto_708241 ?auto_708250 ) ) ( not ( = ?auto_708241 ?auto_708251 ) ) ( not ( = ?auto_708241 ?auto_708252 ) ) ( not ( = ?auto_708242 ?auto_708243 ) ) ( not ( = ?auto_708242 ?auto_708244 ) ) ( not ( = ?auto_708242 ?auto_708245 ) ) ( not ( = ?auto_708242 ?auto_708246 ) ) ( not ( = ?auto_708242 ?auto_708247 ) ) ( not ( = ?auto_708242 ?auto_708248 ) ) ( not ( = ?auto_708242 ?auto_708249 ) ) ( not ( = ?auto_708242 ?auto_708250 ) ) ( not ( = ?auto_708242 ?auto_708251 ) ) ( not ( = ?auto_708242 ?auto_708252 ) ) ( not ( = ?auto_708243 ?auto_708244 ) ) ( not ( = ?auto_708243 ?auto_708245 ) ) ( not ( = ?auto_708243 ?auto_708246 ) ) ( not ( = ?auto_708243 ?auto_708247 ) ) ( not ( = ?auto_708243 ?auto_708248 ) ) ( not ( = ?auto_708243 ?auto_708249 ) ) ( not ( = ?auto_708243 ?auto_708250 ) ) ( not ( = ?auto_708243 ?auto_708251 ) ) ( not ( = ?auto_708243 ?auto_708252 ) ) ( not ( = ?auto_708244 ?auto_708245 ) ) ( not ( = ?auto_708244 ?auto_708246 ) ) ( not ( = ?auto_708244 ?auto_708247 ) ) ( not ( = ?auto_708244 ?auto_708248 ) ) ( not ( = ?auto_708244 ?auto_708249 ) ) ( not ( = ?auto_708244 ?auto_708250 ) ) ( not ( = ?auto_708244 ?auto_708251 ) ) ( not ( = ?auto_708244 ?auto_708252 ) ) ( not ( = ?auto_708245 ?auto_708246 ) ) ( not ( = ?auto_708245 ?auto_708247 ) ) ( not ( = ?auto_708245 ?auto_708248 ) ) ( not ( = ?auto_708245 ?auto_708249 ) ) ( not ( = ?auto_708245 ?auto_708250 ) ) ( not ( = ?auto_708245 ?auto_708251 ) ) ( not ( = ?auto_708245 ?auto_708252 ) ) ( not ( = ?auto_708246 ?auto_708247 ) ) ( not ( = ?auto_708246 ?auto_708248 ) ) ( not ( = ?auto_708246 ?auto_708249 ) ) ( not ( = ?auto_708246 ?auto_708250 ) ) ( not ( = ?auto_708246 ?auto_708251 ) ) ( not ( = ?auto_708246 ?auto_708252 ) ) ( not ( = ?auto_708247 ?auto_708248 ) ) ( not ( = ?auto_708247 ?auto_708249 ) ) ( not ( = ?auto_708247 ?auto_708250 ) ) ( not ( = ?auto_708247 ?auto_708251 ) ) ( not ( = ?auto_708247 ?auto_708252 ) ) ( not ( = ?auto_708248 ?auto_708249 ) ) ( not ( = ?auto_708248 ?auto_708250 ) ) ( not ( = ?auto_708248 ?auto_708251 ) ) ( not ( = ?auto_708248 ?auto_708252 ) ) ( not ( = ?auto_708249 ?auto_708250 ) ) ( not ( = ?auto_708249 ?auto_708251 ) ) ( not ( = ?auto_708249 ?auto_708252 ) ) ( not ( = ?auto_708250 ?auto_708251 ) ) ( not ( = ?auto_708250 ?auto_708252 ) ) ( not ( = ?auto_708251 ?auto_708252 ) ) ( ON ?auto_708250 ?auto_708251 ) ( ON ?auto_708249 ?auto_708250 ) ( ON ?auto_708248 ?auto_708249 ) ( ON ?auto_708247 ?auto_708248 ) ( ON ?auto_708246 ?auto_708247 ) ( ON ?auto_708245 ?auto_708246 ) ( ON ?auto_708244 ?auto_708245 ) ( ON ?auto_708243 ?auto_708244 ) ( ON ?auto_708242 ?auto_708243 ) ( CLEAR ?auto_708240 ) ( ON ?auto_708241 ?auto_708242 ) ( CLEAR ?auto_708241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_708236 ?auto_708237 ?auto_708238 ?auto_708239 ?auto_708240 ?auto_708241 )
      ( MAKE-16PILE ?auto_708236 ?auto_708237 ?auto_708238 ?auto_708239 ?auto_708240 ?auto_708241 ?auto_708242 ?auto_708243 ?auto_708244 ?auto_708245 ?auto_708246 ?auto_708247 ?auto_708248 ?auto_708249 ?auto_708250 ?auto_708251 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708302 - BLOCK
      ?auto_708303 - BLOCK
      ?auto_708304 - BLOCK
      ?auto_708305 - BLOCK
      ?auto_708306 - BLOCK
      ?auto_708307 - BLOCK
      ?auto_708308 - BLOCK
      ?auto_708309 - BLOCK
      ?auto_708310 - BLOCK
      ?auto_708311 - BLOCK
      ?auto_708312 - BLOCK
      ?auto_708313 - BLOCK
      ?auto_708314 - BLOCK
      ?auto_708315 - BLOCK
      ?auto_708316 - BLOCK
      ?auto_708317 - BLOCK
    )
    :vars
    (
      ?auto_708318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708317 ?auto_708318 ) ( ON-TABLE ?auto_708302 ) ( ON ?auto_708303 ?auto_708302 ) ( ON ?auto_708304 ?auto_708303 ) ( ON ?auto_708305 ?auto_708304 ) ( not ( = ?auto_708302 ?auto_708303 ) ) ( not ( = ?auto_708302 ?auto_708304 ) ) ( not ( = ?auto_708302 ?auto_708305 ) ) ( not ( = ?auto_708302 ?auto_708306 ) ) ( not ( = ?auto_708302 ?auto_708307 ) ) ( not ( = ?auto_708302 ?auto_708308 ) ) ( not ( = ?auto_708302 ?auto_708309 ) ) ( not ( = ?auto_708302 ?auto_708310 ) ) ( not ( = ?auto_708302 ?auto_708311 ) ) ( not ( = ?auto_708302 ?auto_708312 ) ) ( not ( = ?auto_708302 ?auto_708313 ) ) ( not ( = ?auto_708302 ?auto_708314 ) ) ( not ( = ?auto_708302 ?auto_708315 ) ) ( not ( = ?auto_708302 ?auto_708316 ) ) ( not ( = ?auto_708302 ?auto_708317 ) ) ( not ( = ?auto_708302 ?auto_708318 ) ) ( not ( = ?auto_708303 ?auto_708304 ) ) ( not ( = ?auto_708303 ?auto_708305 ) ) ( not ( = ?auto_708303 ?auto_708306 ) ) ( not ( = ?auto_708303 ?auto_708307 ) ) ( not ( = ?auto_708303 ?auto_708308 ) ) ( not ( = ?auto_708303 ?auto_708309 ) ) ( not ( = ?auto_708303 ?auto_708310 ) ) ( not ( = ?auto_708303 ?auto_708311 ) ) ( not ( = ?auto_708303 ?auto_708312 ) ) ( not ( = ?auto_708303 ?auto_708313 ) ) ( not ( = ?auto_708303 ?auto_708314 ) ) ( not ( = ?auto_708303 ?auto_708315 ) ) ( not ( = ?auto_708303 ?auto_708316 ) ) ( not ( = ?auto_708303 ?auto_708317 ) ) ( not ( = ?auto_708303 ?auto_708318 ) ) ( not ( = ?auto_708304 ?auto_708305 ) ) ( not ( = ?auto_708304 ?auto_708306 ) ) ( not ( = ?auto_708304 ?auto_708307 ) ) ( not ( = ?auto_708304 ?auto_708308 ) ) ( not ( = ?auto_708304 ?auto_708309 ) ) ( not ( = ?auto_708304 ?auto_708310 ) ) ( not ( = ?auto_708304 ?auto_708311 ) ) ( not ( = ?auto_708304 ?auto_708312 ) ) ( not ( = ?auto_708304 ?auto_708313 ) ) ( not ( = ?auto_708304 ?auto_708314 ) ) ( not ( = ?auto_708304 ?auto_708315 ) ) ( not ( = ?auto_708304 ?auto_708316 ) ) ( not ( = ?auto_708304 ?auto_708317 ) ) ( not ( = ?auto_708304 ?auto_708318 ) ) ( not ( = ?auto_708305 ?auto_708306 ) ) ( not ( = ?auto_708305 ?auto_708307 ) ) ( not ( = ?auto_708305 ?auto_708308 ) ) ( not ( = ?auto_708305 ?auto_708309 ) ) ( not ( = ?auto_708305 ?auto_708310 ) ) ( not ( = ?auto_708305 ?auto_708311 ) ) ( not ( = ?auto_708305 ?auto_708312 ) ) ( not ( = ?auto_708305 ?auto_708313 ) ) ( not ( = ?auto_708305 ?auto_708314 ) ) ( not ( = ?auto_708305 ?auto_708315 ) ) ( not ( = ?auto_708305 ?auto_708316 ) ) ( not ( = ?auto_708305 ?auto_708317 ) ) ( not ( = ?auto_708305 ?auto_708318 ) ) ( not ( = ?auto_708306 ?auto_708307 ) ) ( not ( = ?auto_708306 ?auto_708308 ) ) ( not ( = ?auto_708306 ?auto_708309 ) ) ( not ( = ?auto_708306 ?auto_708310 ) ) ( not ( = ?auto_708306 ?auto_708311 ) ) ( not ( = ?auto_708306 ?auto_708312 ) ) ( not ( = ?auto_708306 ?auto_708313 ) ) ( not ( = ?auto_708306 ?auto_708314 ) ) ( not ( = ?auto_708306 ?auto_708315 ) ) ( not ( = ?auto_708306 ?auto_708316 ) ) ( not ( = ?auto_708306 ?auto_708317 ) ) ( not ( = ?auto_708306 ?auto_708318 ) ) ( not ( = ?auto_708307 ?auto_708308 ) ) ( not ( = ?auto_708307 ?auto_708309 ) ) ( not ( = ?auto_708307 ?auto_708310 ) ) ( not ( = ?auto_708307 ?auto_708311 ) ) ( not ( = ?auto_708307 ?auto_708312 ) ) ( not ( = ?auto_708307 ?auto_708313 ) ) ( not ( = ?auto_708307 ?auto_708314 ) ) ( not ( = ?auto_708307 ?auto_708315 ) ) ( not ( = ?auto_708307 ?auto_708316 ) ) ( not ( = ?auto_708307 ?auto_708317 ) ) ( not ( = ?auto_708307 ?auto_708318 ) ) ( not ( = ?auto_708308 ?auto_708309 ) ) ( not ( = ?auto_708308 ?auto_708310 ) ) ( not ( = ?auto_708308 ?auto_708311 ) ) ( not ( = ?auto_708308 ?auto_708312 ) ) ( not ( = ?auto_708308 ?auto_708313 ) ) ( not ( = ?auto_708308 ?auto_708314 ) ) ( not ( = ?auto_708308 ?auto_708315 ) ) ( not ( = ?auto_708308 ?auto_708316 ) ) ( not ( = ?auto_708308 ?auto_708317 ) ) ( not ( = ?auto_708308 ?auto_708318 ) ) ( not ( = ?auto_708309 ?auto_708310 ) ) ( not ( = ?auto_708309 ?auto_708311 ) ) ( not ( = ?auto_708309 ?auto_708312 ) ) ( not ( = ?auto_708309 ?auto_708313 ) ) ( not ( = ?auto_708309 ?auto_708314 ) ) ( not ( = ?auto_708309 ?auto_708315 ) ) ( not ( = ?auto_708309 ?auto_708316 ) ) ( not ( = ?auto_708309 ?auto_708317 ) ) ( not ( = ?auto_708309 ?auto_708318 ) ) ( not ( = ?auto_708310 ?auto_708311 ) ) ( not ( = ?auto_708310 ?auto_708312 ) ) ( not ( = ?auto_708310 ?auto_708313 ) ) ( not ( = ?auto_708310 ?auto_708314 ) ) ( not ( = ?auto_708310 ?auto_708315 ) ) ( not ( = ?auto_708310 ?auto_708316 ) ) ( not ( = ?auto_708310 ?auto_708317 ) ) ( not ( = ?auto_708310 ?auto_708318 ) ) ( not ( = ?auto_708311 ?auto_708312 ) ) ( not ( = ?auto_708311 ?auto_708313 ) ) ( not ( = ?auto_708311 ?auto_708314 ) ) ( not ( = ?auto_708311 ?auto_708315 ) ) ( not ( = ?auto_708311 ?auto_708316 ) ) ( not ( = ?auto_708311 ?auto_708317 ) ) ( not ( = ?auto_708311 ?auto_708318 ) ) ( not ( = ?auto_708312 ?auto_708313 ) ) ( not ( = ?auto_708312 ?auto_708314 ) ) ( not ( = ?auto_708312 ?auto_708315 ) ) ( not ( = ?auto_708312 ?auto_708316 ) ) ( not ( = ?auto_708312 ?auto_708317 ) ) ( not ( = ?auto_708312 ?auto_708318 ) ) ( not ( = ?auto_708313 ?auto_708314 ) ) ( not ( = ?auto_708313 ?auto_708315 ) ) ( not ( = ?auto_708313 ?auto_708316 ) ) ( not ( = ?auto_708313 ?auto_708317 ) ) ( not ( = ?auto_708313 ?auto_708318 ) ) ( not ( = ?auto_708314 ?auto_708315 ) ) ( not ( = ?auto_708314 ?auto_708316 ) ) ( not ( = ?auto_708314 ?auto_708317 ) ) ( not ( = ?auto_708314 ?auto_708318 ) ) ( not ( = ?auto_708315 ?auto_708316 ) ) ( not ( = ?auto_708315 ?auto_708317 ) ) ( not ( = ?auto_708315 ?auto_708318 ) ) ( not ( = ?auto_708316 ?auto_708317 ) ) ( not ( = ?auto_708316 ?auto_708318 ) ) ( not ( = ?auto_708317 ?auto_708318 ) ) ( ON ?auto_708316 ?auto_708317 ) ( ON ?auto_708315 ?auto_708316 ) ( ON ?auto_708314 ?auto_708315 ) ( ON ?auto_708313 ?auto_708314 ) ( ON ?auto_708312 ?auto_708313 ) ( ON ?auto_708311 ?auto_708312 ) ( ON ?auto_708310 ?auto_708311 ) ( ON ?auto_708309 ?auto_708310 ) ( ON ?auto_708308 ?auto_708309 ) ( ON ?auto_708307 ?auto_708308 ) ( CLEAR ?auto_708305 ) ( ON ?auto_708306 ?auto_708307 ) ( CLEAR ?auto_708306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_708302 ?auto_708303 ?auto_708304 ?auto_708305 ?auto_708306 )
      ( MAKE-16PILE ?auto_708302 ?auto_708303 ?auto_708304 ?auto_708305 ?auto_708306 ?auto_708307 ?auto_708308 ?auto_708309 ?auto_708310 ?auto_708311 ?auto_708312 ?auto_708313 ?auto_708314 ?auto_708315 ?auto_708316 ?auto_708317 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708368 - BLOCK
      ?auto_708369 - BLOCK
      ?auto_708370 - BLOCK
      ?auto_708371 - BLOCK
      ?auto_708372 - BLOCK
      ?auto_708373 - BLOCK
      ?auto_708374 - BLOCK
      ?auto_708375 - BLOCK
      ?auto_708376 - BLOCK
      ?auto_708377 - BLOCK
      ?auto_708378 - BLOCK
      ?auto_708379 - BLOCK
      ?auto_708380 - BLOCK
      ?auto_708381 - BLOCK
      ?auto_708382 - BLOCK
      ?auto_708383 - BLOCK
    )
    :vars
    (
      ?auto_708384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708383 ?auto_708384 ) ( ON-TABLE ?auto_708368 ) ( ON ?auto_708369 ?auto_708368 ) ( ON ?auto_708370 ?auto_708369 ) ( not ( = ?auto_708368 ?auto_708369 ) ) ( not ( = ?auto_708368 ?auto_708370 ) ) ( not ( = ?auto_708368 ?auto_708371 ) ) ( not ( = ?auto_708368 ?auto_708372 ) ) ( not ( = ?auto_708368 ?auto_708373 ) ) ( not ( = ?auto_708368 ?auto_708374 ) ) ( not ( = ?auto_708368 ?auto_708375 ) ) ( not ( = ?auto_708368 ?auto_708376 ) ) ( not ( = ?auto_708368 ?auto_708377 ) ) ( not ( = ?auto_708368 ?auto_708378 ) ) ( not ( = ?auto_708368 ?auto_708379 ) ) ( not ( = ?auto_708368 ?auto_708380 ) ) ( not ( = ?auto_708368 ?auto_708381 ) ) ( not ( = ?auto_708368 ?auto_708382 ) ) ( not ( = ?auto_708368 ?auto_708383 ) ) ( not ( = ?auto_708368 ?auto_708384 ) ) ( not ( = ?auto_708369 ?auto_708370 ) ) ( not ( = ?auto_708369 ?auto_708371 ) ) ( not ( = ?auto_708369 ?auto_708372 ) ) ( not ( = ?auto_708369 ?auto_708373 ) ) ( not ( = ?auto_708369 ?auto_708374 ) ) ( not ( = ?auto_708369 ?auto_708375 ) ) ( not ( = ?auto_708369 ?auto_708376 ) ) ( not ( = ?auto_708369 ?auto_708377 ) ) ( not ( = ?auto_708369 ?auto_708378 ) ) ( not ( = ?auto_708369 ?auto_708379 ) ) ( not ( = ?auto_708369 ?auto_708380 ) ) ( not ( = ?auto_708369 ?auto_708381 ) ) ( not ( = ?auto_708369 ?auto_708382 ) ) ( not ( = ?auto_708369 ?auto_708383 ) ) ( not ( = ?auto_708369 ?auto_708384 ) ) ( not ( = ?auto_708370 ?auto_708371 ) ) ( not ( = ?auto_708370 ?auto_708372 ) ) ( not ( = ?auto_708370 ?auto_708373 ) ) ( not ( = ?auto_708370 ?auto_708374 ) ) ( not ( = ?auto_708370 ?auto_708375 ) ) ( not ( = ?auto_708370 ?auto_708376 ) ) ( not ( = ?auto_708370 ?auto_708377 ) ) ( not ( = ?auto_708370 ?auto_708378 ) ) ( not ( = ?auto_708370 ?auto_708379 ) ) ( not ( = ?auto_708370 ?auto_708380 ) ) ( not ( = ?auto_708370 ?auto_708381 ) ) ( not ( = ?auto_708370 ?auto_708382 ) ) ( not ( = ?auto_708370 ?auto_708383 ) ) ( not ( = ?auto_708370 ?auto_708384 ) ) ( not ( = ?auto_708371 ?auto_708372 ) ) ( not ( = ?auto_708371 ?auto_708373 ) ) ( not ( = ?auto_708371 ?auto_708374 ) ) ( not ( = ?auto_708371 ?auto_708375 ) ) ( not ( = ?auto_708371 ?auto_708376 ) ) ( not ( = ?auto_708371 ?auto_708377 ) ) ( not ( = ?auto_708371 ?auto_708378 ) ) ( not ( = ?auto_708371 ?auto_708379 ) ) ( not ( = ?auto_708371 ?auto_708380 ) ) ( not ( = ?auto_708371 ?auto_708381 ) ) ( not ( = ?auto_708371 ?auto_708382 ) ) ( not ( = ?auto_708371 ?auto_708383 ) ) ( not ( = ?auto_708371 ?auto_708384 ) ) ( not ( = ?auto_708372 ?auto_708373 ) ) ( not ( = ?auto_708372 ?auto_708374 ) ) ( not ( = ?auto_708372 ?auto_708375 ) ) ( not ( = ?auto_708372 ?auto_708376 ) ) ( not ( = ?auto_708372 ?auto_708377 ) ) ( not ( = ?auto_708372 ?auto_708378 ) ) ( not ( = ?auto_708372 ?auto_708379 ) ) ( not ( = ?auto_708372 ?auto_708380 ) ) ( not ( = ?auto_708372 ?auto_708381 ) ) ( not ( = ?auto_708372 ?auto_708382 ) ) ( not ( = ?auto_708372 ?auto_708383 ) ) ( not ( = ?auto_708372 ?auto_708384 ) ) ( not ( = ?auto_708373 ?auto_708374 ) ) ( not ( = ?auto_708373 ?auto_708375 ) ) ( not ( = ?auto_708373 ?auto_708376 ) ) ( not ( = ?auto_708373 ?auto_708377 ) ) ( not ( = ?auto_708373 ?auto_708378 ) ) ( not ( = ?auto_708373 ?auto_708379 ) ) ( not ( = ?auto_708373 ?auto_708380 ) ) ( not ( = ?auto_708373 ?auto_708381 ) ) ( not ( = ?auto_708373 ?auto_708382 ) ) ( not ( = ?auto_708373 ?auto_708383 ) ) ( not ( = ?auto_708373 ?auto_708384 ) ) ( not ( = ?auto_708374 ?auto_708375 ) ) ( not ( = ?auto_708374 ?auto_708376 ) ) ( not ( = ?auto_708374 ?auto_708377 ) ) ( not ( = ?auto_708374 ?auto_708378 ) ) ( not ( = ?auto_708374 ?auto_708379 ) ) ( not ( = ?auto_708374 ?auto_708380 ) ) ( not ( = ?auto_708374 ?auto_708381 ) ) ( not ( = ?auto_708374 ?auto_708382 ) ) ( not ( = ?auto_708374 ?auto_708383 ) ) ( not ( = ?auto_708374 ?auto_708384 ) ) ( not ( = ?auto_708375 ?auto_708376 ) ) ( not ( = ?auto_708375 ?auto_708377 ) ) ( not ( = ?auto_708375 ?auto_708378 ) ) ( not ( = ?auto_708375 ?auto_708379 ) ) ( not ( = ?auto_708375 ?auto_708380 ) ) ( not ( = ?auto_708375 ?auto_708381 ) ) ( not ( = ?auto_708375 ?auto_708382 ) ) ( not ( = ?auto_708375 ?auto_708383 ) ) ( not ( = ?auto_708375 ?auto_708384 ) ) ( not ( = ?auto_708376 ?auto_708377 ) ) ( not ( = ?auto_708376 ?auto_708378 ) ) ( not ( = ?auto_708376 ?auto_708379 ) ) ( not ( = ?auto_708376 ?auto_708380 ) ) ( not ( = ?auto_708376 ?auto_708381 ) ) ( not ( = ?auto_708376 ?auto_708382 ) ) ( not ( = ?auto_708376 ?auto_708383 ) ) ( not ( = ?auto_708376 ?auto_708384 ) ) ( not ( = ?auto_708377 ?auto_708378 ) ) ( not ( = ?auto_708377 ?auto_708379 ) ) ( not ( = ?auto_708377 ?auto_708380 ) ) ( not ( = ?auto_708377 ?auto_708381 ) ) ( not ( = ?auto_708377 ?auto_708382 ) ) ( not ( = ?auto_708377 ?auto_708383 ) ) ( not ( = ?auto_708377 ?auto_708384 ) ) ( not ( = ?auto_708378 ?auto_708379 ) ) ( not ( = ?auto_708378 ?auto_708380 ) ) ( not ( = ?auto_708378 ?auto_708381 ) ) ( not ( = ?auto_708378 ?auto_708382 ) ) ( not ( = ?auto_708378 ?auto_708383 ) ) ( not ( = ?auto_708378 ?auto_708384 ) ) ( not ( = ?auto_708379 ?auto_708380 ) ) ( not ( = ?auto_708379 ?auto_708381 ) ) ( not ( = ?auto_708379 ?auto_708382 ) ) ( not ( = ?auto_708379 ?auto_708383 ) ) ( not ( = ?auto_708379 ?auto_708384 ) ) ( not ( = ?auto_708380 ?auto_708381 ) ) ( not ( = ?auto_708380 ?auto_708382 ) ) ( not ( = ?auto_708380 ?auto_708383 ) ) ( not ( = ?auto_708380 ?auto_708384 ) ) ( not ( = ?auto_708381 ?auto_708382 ) ) ( not ( = ?auto_708381 ?auto_708383 ) ) ( not ( = ?auto_708381 ?auto_708384 ) ) ( not ( = ?auto_708382 ?auto_708383 ) ) ( not ( = ?auto_708382 ?auto_708384 ) ) ( not ( = ?auto_708383 ?auto_708384 ) ) ( ON ?auto_708382 ?auto_708383 ) ( ON ?auto_708381 ?auto_708382 ) ( ON ?auto_708380 ?auto_708381 ) ( ON ?auto_708379 ?auto_708380 ) ( ON ?auto_708378 ?auto_708379 ) ( ON ?auto_708377 ?auto_708378 ) ( ON ?auto_708376 ?auto_708377 ) ( ON ?auto_708375 ?auto_708376 ) ( ON ?auto_708374 ?auto_708375 ) ( ON ?auto_708373 ?auto_708374 ) ( ON ?auto_708372 ?auto_708373 ) ( CLEAR ?auto_708370 ) ( ON ?auto_708371 ?auto_708372 ) ( CLEAR ?auto_708371 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_708368 ?auto_708369 ?auto_708370 ?auto_708371 )
      ( MAKE-16PILE ?auto_708368 ?auto_708369 ?auto_708370 ?auto_708371 ?auto_708372 ?auto_708373 ?auto_708374 ?auto_708375 ?auto_708376 ?auto_708377 ?auto_708378 ?auto_708379 ?auto_708380 ?auto_708381 ?auto_708382 ?auto_708383 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708434 - BLOCK
      ?auto_708435 - BLOCK
      ?auto_708436 - BLOCK
      ?auto_708437 - BLOCK
      ?auto_708438 - BLOCK
      ?auto_708439 - BLOCK
      ?auto_708440 - BLOCK
      ?auto_708441 - BLOCK
      ?auto_708442 - BLOCK
      ?auto_708443 - BLOCK
      ?auto_708444 - BLOCK
      ?auto_708445 - BLOCK
      ?auto_708446 - BLOCK
      ?auto_708447 - BLOCK
      ?auto_708448 - BLOCK
      ?auto_708449 - BLOCK
    )
    :vars
    (
      ?auto_708450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708449 ?auto_708450 ) ( ON-TABLE ?auto_708434 ) ( ON ?auto_708435 ?auto_708434 ) ( not ( = ?auto_708434 ?auto_708435 ) ) ( not ( = ?auto_708434 ?auto_708436 ) ) ( not ( = ?auto_708434 ?auto_708437 ) ) ( not ( = ?auto_708434 ?auto_708438 ) ) ( not ( = ?auto_708434 ?auto_708439 ) ) ( not ( = ?auto_708434 ?auto_708440 ) ) ( not ( = ?auto_708434 ?auto_708441 ) ) ( not ( = ?auto_708434 ?auto_708442 ) ) ( not ( = ?auto_708434 ?auto_708443 ) ) ( not ( = ?auto_708434 ?auto_708444 ) ) ( not ( = ?auto_708434 ?auto_708445 ) ) ( not ( = ?auto_708434 ?auto_708446 ) ) ( not ( = ?auto_708434 ?auto_708447 ) ) ( not ( = ?auto_708434 ?auto_708448 ) ) ( not ( = ?auto_708434 ?auto_708449 ) ) ( not ( = ?auto_708434 ?auto_708450 ) ) ( not ( = ?auto_708435 ?auto_708436 ) ) ( not ( = ?auto_708435 ?auto_708437 ) ) ( not ( = ?auto_708435 ?auto_708438 ) ) ( not ( = ?auto_708435 ?auto_708439 ) ) ( not ( = ?auto_708435 ?auto_708440 ) ) ( not ( = ?auto_708435 ?auto_708441 ) ) ( not ( = ?auto_708435 ?auto_708442 ) ) ( not ( = ?auto_708435 ?auto_708443 ) ) ( not ( = ?auto_708435 ?auto_708444 ) ) ( not ( = ?auto_708435 ?auto_708445 ) ) ( not ( = ?auto_708435 ?auto_708446 ) ) ( not ( = ?auto_708435 ?auto_708447 ) ) ( not ( = ?auto_708435 ?auto_708448 ) ) ( not ( = ?auto_708435 ?auto_708449 ) ) ( not ( = ?auto_708435 ?auto_708450 ) ) ( not ( = ?auto_708436 ?auto_708437 ) ) ( not ( = ?auto_708436 ?auto_708438 ) ) ( not ( = ?auto_708436 ?auto_708439 ) ) ( not ( = ?auto_708436 ?auto_708440 ) ) ( not ( = ?auto_708436 ?auto_708441 ) ) ( not ( = ?auto_708436 ?auto_708442 ) ) ( not ( = ?auto_708436 ?auto_708443 ) ) ( not ( = ?auto_708436 ?auto_708444 ) ) ( not ( = ?auto_708436 ?auto_708445 ) ) ( not ( = ?auto_708436 ?auto_708446 ) ) ( not ( = ?auto_708436 ?auto_708447 ) ) ( not ( = ?auto_708436 ?auto_708448 ) ) ( not ( = ?auto_708436 ?auto_708449 ) ) ( not ( = ?auto_708436 ?auto_708450 ) ) ( not ( = ?auto_708437 ?auto_708438 ) ) ( not ( = ?auto_708437 ?auto_708439 ) ) ( not ( = ?auto_708437 ?auto_708440 ) ) ( not ( = ?auto_708437 ?auto_708441 ) ) ( not ( = ?auto_708437 ?auto_708442 ) ) ( not ( = ?auto_708437 ?auto_708443 ) ) ( not ( = ?auto_708437 ?auto_708444 ) ) ( not ( = ?auto_708437 ?auto_708445 ) ) ( not ( = ?auto_708437 ?auto_708446 ) ) ( not ( = ?auto_708437 ?auto_708447 ) ) ( not ( = ?auto_708437 ?auto_708448 ) ) ( not ( = ?auto_708437 ?auto_708449 ) ) ( not ( = ?auto_708437 ?auto_708450 ) ) ( not ( = ?auto_708438 ?auto_708439 ) ) ( not ( = ?auto_708438 ?auto_708440 ) ) ( not ( = ?auto_708438 ?auto_708441 ) ) ( not ( = ?auto_708438 ?auto_708442 ) ) ( not ( = ?auto_708438 ?auto_708443 ) ) ( not ( = ?auto_708438 ?auto_708444 ) ) ( not ( = ?auto_708438 ?auto_708445 ) ) ( not ( = ?auto_708438 ?auto_708446 ) ) ( not ( = ?auto_708438 ?auto_708447 ) ) ( not ( = ?auto_708438 ?auto_708448 ) ) ( not ( = ?auto_708438 ?auto_708449 ) ) ( not ( = ?auto_708438 ?auto_708450 ) ) ( not ( = ?auto_708439 ?auto_708440 ) ) ( not ( = ?auto_708439 ?auto_708441 ) ) ( not ( = ?auto_708439 ?auto_708442 ) ) ( not ( = ?auto_708439 ?auto_708443 ) ) ( not ( = ?auto_708439 ?auto_708444 ) ) ( not ( = ?auto_708439 ?auto_708445 ) ) ( not ( = ?auto_708439 ?auto_708446 ) ) ( not ( = ?auto_708439 ?auto_708447 ) ) ( not ( = ?auto_708439 ?auto_708448 ) ) ( not ( = ?auto_708439 ?auto_708449 ) ) ( not ( = ?auto_708439 ?auto_708450 ) ) ( not ( = ?auto_708440 ?auto_708441 ) ) ( not ( = ?auto_708440 ?auto_708442 ) ) ( not ( = ?auto_708440 ?auto_708443 ) ) ( not ( = ?auto_708440 ?auto_708444 ) ) ( not ( = ?auto_708440 ?auto_708445 ) ) ( not ( = ?auto_708440 ?auto_708446 ) ) ( not ( = ?auto_708440 ?auto_708447 ) ) ( not ( = ?auto_708440 ?auto_708448 ) ) ( not ( = ?auto_708440 ?auto_708449 ) ) ( not ( = ?auto_708440 ?auto_708450 ) ) ( not ( = ?auto_708441 ?auto_708442 ) ) ( not ( = ?auto_708441 ?auto_708443 ) ) ( not ( = ?auto_708441 ?auto_708444 ) ) ( not ( = ?auto_708441 ?auto_708445 ) ) ( not ( = ?auto_708441 ?auto_708446 ) ) ( not ( = ?auto_708441 ?auto_708447 ) ) ( not ( = ?auto_708441 ?auto_708448 ) ) ( not ( = ?auto_708441 ?auto_708449 ) ) ( not ( = ?auto_708441 ?auto_708450 ) ) ( not ( = ?auto_708442 ?auto_708443 ) ) ( not ( = ?auto_708442 ?auto_708444 ) ) ( not ( = ?auto_708442 ?auto_708445 ) ) ( not ( = ?auto_708442 ?auto_708446 ) ) ( not ( = ?auto_708442 ?auto_708447 ) ) ( not ( = ?auto_708442 ?auto_708448 ) ) ( not ( = ?auto_708442 ?auto_708449 ) ) ( not ( = ?auto_708442 ?auto_708450 ) ) ( not ( = ?auto_708443 ?auto_708444 ) ) ( not ( = ?auto_708443 ?auto_708445 ) ) ( not ( = ?auto_708443 ?auto_708446 ) ) ( not ( = ?auto_708443 ?auto_708447 ) ) ( not ( = ?auto_708443 ?auto_708448 ) ) ( not ( = ?auto_708443 ?auto_708449 ) ) ( not ( = ?auto_708443 ?auto_708450 ) ) ( not ( = ?auto_708444 ?auto_708445 ) ) ( not ( = ?auto_708444 ?auto_708446 ) ) ( not ( = ?auto_708444 ?auto_708447 ) ) ( not ( = ?auto_708444 ?auto_708448 ) ) ( not ( = ?auto_708444 ?auto_708449 ) ) ( not ( = ?auto_708444 ?auto_708450 ) ) ( not ( = ?auto_708445 ?auto_708446 ) ) ( not ( = ?auto_708445 ?auto_708447 ) ) ( not ( = ?auto_708445 ?auto_708448 ) ) ( not ( = ?auto_708445 ?auto_708449 ) ) ( not ( = ?auto_708445 ?auto_708450 ) ) ( not ( = ?auto_708446 ?auto_708447 ) ) ( not ( = ?auto_708446 ?auto_708448 ) ) ( not ( = ?auto_708446 ?auto_708449 ) ) ( not ( = ?auto_708446 ?auto_708450 ) ) ( not ( = ?auto_708447 ?auto_708448 ) ) ( not ( = ?auto_708447 ?auto_708449 ) ) ( not ( = ?auto_708447 ?auto_708450 ) ) ( not ( = ?auto_708448 ?auto_708449 ) ) ( not ( = ?auto_708448 ?auto_708450 ) ) ( not ( = ?auto_708449 ?auto_708450 ) ) ( ON ?auto_708448 ?auto_708449 ) ( ON ?auto_708447 ?auto_708448 ) ( ON ?auto_708446 ?auto_708447 ) ( ON ?auto_708445 ?auto_708446 ) ( ON ?auto_708444 ?auto_708445 ) ( ON ?auto_708443 ?auto_708444 ) ( ON ?auto_708442 ?auto_708443 ) ( ON ?auto_708441 ?auto_708442 ) ( ON ?auto_708440 ?auto_708441 ) ( ON ?auto_708439 ?auto_708440 ) ( ON ?auto_708438 ?auto_708439 ) ( ON ?auto_708437 ?auto_708438 ) ( CLEAR ?auto_708435 ) ( ON ?auto_708436 ?auto_708437 ) ( CLEAR ?auto_708436 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_708434 ?auto_708435 ?auto_708436 )
      ( MAKE-16PILE ?auto_708434 ?auto_708435 ?auto_708436 ?auto_708437 ?auto_708438 ?auto_708439 ?auto_708440 ?auto_708441 ?auto_708442 ?auto_708443 ?auto_708444 ?auto_708445 ?auto_708446 ?auto_708447 ?auto_708448 ?auto_708449 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708500 - BLOCK
      ?auto_708501 - BLOCK
      ?auto_708502 - BLOCK
      ?auto_708503 - BLOCK
      ?auto_708504 - BLOCK
      ?auto_708505 - BLOCK
      ?auto_708506 - BLOCK
      ?auto_708507 - BLOCK
      ?auto_708508 - BLOCK
      ?auto_708509 - BLOCK
      ?auto_708510 - BLOCK
      ?auto_708511 - BLOCK
      ?auto_708512 - BLOCK
      ?auto_708513 - BLOCK
      ?auto_708514 - BLOCK
      ?auto_708515 - BLOCK
    )
    :vars
    (
      ?auto_708516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708515 ?auto_708516 ) ( ON-TABLE ?auto_708500 ) ( not ( = ?auto_708500 ?auto_708501 ) ) ( not ( = ?auto_708500 ?auto_708502 ) ) ( not ( = ?auto_708500 ?auto_708503 ) ) ( not ( = ?auto_708500 ?auto_708504 ) ) ( not ( = ?auto_708500 ?auto_708505 ) ) ( not ( = ?auto_708500 ?auto_708506 ) ) ( not ( = ?auto_708500 ?auto_708507 ) ) ( not ( = ?auto_708500 ?auto_708508 ) ) ( not ( = ?auto_708500 ?auto_708509 ) ) ( not ( = ?auto_708500 ?auto_708510 ) ) ( not ( = ?auto_708500 ?auto_708511 ) ) ( not ( = ?auto_708500 ?auto_708512 ) ) ( not ( = ?auto_708500 ?auto_708513 ) ) ( not ( = ?auto_708500 ?auto_708514 ) ) ( not ( = ?auto_708500 ?auto_708515 ) ) ( not ( = ?auto_708500 ?auto_708516 ) ) ( not ( = ?auto_708501 ?auto_708502 ) ) ( not ( = ?auto_708501 ?auto_708503 ) ) ( not ( = ?auto_708501 ?auto_708504 ) ) ( not ( = ?auto_708501 ?auto_708505 ) ) ( not ( = ?auto_708501 ?auto_708506 ) ) ( not ( = ?auto_708501 ?auto_708507 ) ) ( not ( = ?auto_708501 ?auto_708508 ) ) ( not ( = ?auto_708501 ?auto_708509 ) ) ( not ( = ?auto_708501 ?auto_708510 ) ) ( not ( = ?auto_708501 ?auto_708511 ) ) ( not ( = ?auto_708501 ?auto_708512 ) ) ( not ( = ?auto_708501 ?auto_708513 ) ) ( not ( = ?auto_708501 ?auto_708514 ) ) ( not ( = ?auto_708501 ?auto_708515 ) ) ( not ( = ?auto_708501 ?auto_708516 ) ) ( not ( = ?auto_708502 ?auto_708503 ) ) ( not ( = ?auto_708502 ?auto_708504 ) ) ( not ( = ?auto_708502 ?auto_708505 ) ) ( not ( = ?auto_708502 ?auto_708506 ) ) ( not ( = ?auto_708502 ?auto_708507 ) ) ( not ( = ?auto_708502 ?auto_708508 ) ) ( not ( = ?auto_708502 ?auto_708509 ) ) ( not ( = ?auto_708502 ?auto_708510 ) ) ( not ( = ?auto_708502 ?auto_708511 ) ) ( not ( = ?auto_708502 ?auto_708512 ) ) ( not ( = ?auto_708502 ?auto_708513 ) ) ( not ( = ?auto_708502 ?auto_708514 ) ) ( not ( = ?auto_708502 ?auto_708515 ) ) ( not ( = ?auto_708502 ?auto_708516 ) ) ( not ( = ?auto_708503 ?auto_708504 ) ) ( not ( = ?auto_708503 ?auto_708505 ) ) ( not ( = ?auto_708503 ?auto_708506 ) ) ( not ( = ?auto_708503 ?auto_708507 ) ) ( not ( = ?auto_708503 ?auto_708508 ) ) ( not ( = ?auto_708503 ?auto_708509 ) ) ( not ( = ?auto_708503 ?auto_708510 ) ) ( not ( = ?auto_708503 ?auto_708511 ) ) ( not ( = ?auto_708503 ?auto_708512 ) ) ( not ( = ?auto_708503 ?auto_708513 ) ) ( not ( = ?auto_708503 ?auto_708514 ) ) ( not ( = ?auto_708503 ?auto_708515 ) ) ( not ( = ?auto_708503 ?auto_708516 ) ) ( not ( = ?auto_708504 ?auto_708505 ) ) ( not ( = ?auto_708504 ?auto_708506 ) ) ( not ( = ?auto_708504 ?auto_708507 ) ) ( not ( = ?auto_708504 ?auto_708508 ) ) ( not ( = ?auto_708504 ?auto_708509 ) ) ( not ( = ?auto_708504 ?auto_708510 ) ) ( not ( = ?auto_708504 ?auto_708511 ) ) ( not ( = ?auto_708504 ?auto_708512 ) ) ( not ( = ?auto_708504 ?auto_708513 ) ) ( not ( = ?auto_708504 ?auto_708514 ) ) ( not ( = ?auto_708504 ?auto_708515 ) ) ( not ( = ?auto_708504 ?auto_708516 ) ) ( not ( = ?auto_708505 ?auto_708506 ) ) ( not ( = ?auto_708505 ?auto_708507 ) ) ( not ( = ?auto_708505 ?auto_708508 ) ) ( not ( = ?auto_708505 ?auto_708509 ) ) ( not ( = ?auto_708505 ?auto_708510 ) ) ( not ( = ?auto_708505 ?auto_708511 ) ) ( not ( = ?auto_708505 ?auto_708512 ) ) ( not ( = ?auto_708505 ?auto_708513 ) ) ( not ( = ?auto_708505 ?auto_708514 ) ) ( not ( = ?auto_708505 ?auto_708515 ) ) ( not ( = ?auto_708505 ?auto_708516 ) ) ( not ( = ?auto_708506 ?auto_708507 ) ) ( not ( = ?auto_708506 ?auto_708508 ) ) ( not ( = ?auto_708506 ?auto_708509 ) ) ( not ( = ?auto_708506 ?auto_708510 ) ) ( not ( = ?auto_708506 ?auto_708511 ) ) ( not ( = ?auto_708506 ?auto_708512 ) ) ( not ( = ?auto_708506 ?auto_708513 ) ) ( not ( = ?auto_708506 ?auto_708514 ) ) ( not ( = ?auto_708506 ?auto_708515 ) ) ( not ( = ?auto_708506 ?auto_708516 ) ) ( not ( = ?auto_708507 ?auto_708508 ) ) ( not ( = ?auto_708507 ?auto_708509 ) ) ( not ( = ?auto_708507 ?auto_708510 ) ) ( not ( = ?auto_708507 ?auto_708511 ) ) ( not ( = ?auto_708507 ?auto_708512 ) ) ( not ( = ?auto_708507 ?auto_708513 ) ) ( not ( = ?auto_708507 ?auto_708514 ) ) ( not ( = ?auto_708507 ?auto_708515 ) ) ( not ( = ?auto_708507 ?auto_708516 ) ) ( not ( = ?auto_708508 ?auto_708509 ) ) ( not ( = ?auto_708508 ?auto_708510 ) ) ( not ( = ?auto_708508 ?auto_708511 ) ) ( not ( = ?auto_708508 ?auto_708512 ) ) ( not ( = ?auto_708508 ?auto_708513 ) ) ( not ( = ?auto_708508 ?auto_708514 ) ) ( not ( = ?auto_708508 ?auto_708515 ) ) ( not ( = ?auto_708508 ?auto_708516 ) ) ( not ( = ?auto_708509 ?auto_708510 ) ) ( not ( = ?auto_708509 ?auto_708511 ) ) ( not ( = ?auto_708509 ?auto_708512 ) ) ( not ( = ?auto_708509 ?auto_708513 ) ) ( not ( = ?auto_708509 ?auto_708514 ) ) ( not ( = ?auto_708509 ?auto_708515 ) ) ( not ( = ?auto_708509 ?auto_708516 ) ) ( not ( = ?auto_708510 ?auto_708511 ) ) ( not ( = ?auto_708510 ?auto_708512 ) ) ( not ( = ?auto_708510 ?auto_708513 ) ) ( not ( = ?auto_708510 ?auto_708514 ) ) ( not ( = ?auto_708510 ?auto_708515 ) ) ( not ( = ?auto_708510 ?auto_708516 ) ) ( not ( = ?auto_708511 ?auto_708512 ) ) ( not ( = ?auto_708511 ?auto_708513 ) ) ( not ( = ?auto_708511 ?auto_708514 ) ) ( not ( = ?auto_708511 ?auto_708515 ) ) ( not ( = ?auto_708511 ?auto_708516 ) ) ( not ( = ?auto_708512 ?auto_708513 ) ) ( not ( = ?auto_708512 ?auto_708514 ) ) ( not ( = ?auto_708512 ?auto_708515 ) ) ( not ( = ?auto_708512 ?auto_708516 ) ) ( not ( = ?auto_708513 ?auto_708514 ) ) ( not ( = ?auto_708513 ?auto_708515 ) ) ( not ( = ?auto_708513 ?auto_708516 ) ) ( not ( = ?auto_708514 ?auto_708515 ) ) ( not ( = ?auto_708514 ?auto_708516 ) ) ( not ( = ?auto_708515 ?auto_708516 ) ) ( ON ?auto_708514 ?auto_708515 ) ( ON ?auto_708513 ?auto_708514 ) ( ON ?auto_708512 ?auto_708513 ) ( ON ?auto_708511 ?auto_708512 ) ( ON ?auto_708510 ?auto_708511 ) ( ON ?auto_708509 ?auto_708510 ) ( ON ?auto_708508 ?auto_708509 ) ( ON ?auto_708507 ?auto_708508 ) ( ON ?auto_708506 ?auto_708507 ) ( ON ?auto_708505 ?auto_708506 ) ( ON ?auto_708504 ?auto_708505 ) ( ON ?auto_708503 ?auto_708504 ) ( ON ?auto_708502 ?auto_708503 ) ( CLEAR ?auto_708500 ) ( ON ?auto_708501 ?auto_708502 ) ( CLEAR ?auto_708501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_708500 ?auto_708501 )
      ( MAKE-16PILE ?auto_708500 ?auto_708501 ?auto_708502 ?auto_708503 ?auto_708504 ?auto_708505 ?auto_708506 ?auto_708507 ?auto_708508 ?auto_708509 ?auto_708510 ?auto_708511 ?auto_708512 ?auto_708513 ?auto_708514 ?auto_708515 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_708566 - BLOCK
      ?auto_708567 - BLOCK
      ?auto_708568 - BLOCK
      ?auto_708569 - BLOCK
      ?auto_708570 - BLOCK
      ?auto_708571 - BLOCK
      ?auto_708572 - BLOCK
      ?auto_708573 - BLOCK
      ?auto_708574 - BLOCK
      ?auto_708575 - BLOCK
      ?auto_708576 - BLOCK
      ?auto_708577 - BLOCK
      ?auto_708578 - BLOCK
      ?auto_708579 - BLOCK
      ?auto_708580 - BLOCK
      ?auto_708581 - BLOCK
    )
    :vars
    (
      ?auto_708582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708581 ?auto_708582 ) ( not ( = ?auto_708566 ?auto_708567 ) ) ( not ( = ?auto_708566 ?auto_708568 ) ) ( not ( = ?auto_708566 ?auto_708569 ) ) ( not ( = ?auto_708566 ?auto_708570 ) ) ( not ( = ?auto_708566 ?auto_708571 ) ) ( not ( = ?auto_708566 ?auto_708572 ) ) ( not ( = ?auto_708566 ?auto_708573 ) ) ( not ( = ?auto_708566 ?auto_708574 ) ) ( not ( = ?auto_708566 ?auto_708575 ) ) ( not ( = ?auto_708566 ?auto_708576 ) ) ( not ( = ?auto_708566 ?auto_708577 ) ) ( not ( = ?auto_708566 ?auto_708578 ) ) ( not ( = ?auto_708566 ?auto_708579 ) ) ( not ( = ?auto_708566 ?auto_708580 ) ) ( not ( = ?auto_708566 ?auto_708581 ) ) ( not ( = ?auto_708566 ?auto_708582 ) ) ( not ( = ?auto_708567 ?auto_708568 ) ) ( not ( = ?auto_708567 ?auto_708569 ) ) ( not ( = ?auto_708567 ?auto_708570 ) ) ( not ( = ?auto_708567 ?auto_708571 ) ) ( not ( = ?auto_708567 ?auto_708572 ) ) ( not ( = ?auto_708567 ?auto_708573 ) ) ( not ( = ?auto_708567 ?auto_708574 ) ) ( not ( = ?auto_708567 ?auto_708575 ) ) ( not ( = ?auto_708567 ?auto_708576 ) ) ( not ( = ?auto_708567 ?auto_708577 ) ) ( not ( = ?auto_708567 ?auto_708578 ) ) ( not ( = ?auto_708567 ?auto_708579 ) ) ( not ( = ?auto_708567 ?auto_708580 ) ) ( not ( = ?auto_708567 ?auto_708581 ) ) ( not ( = ?auto_708567 ?auto_708582 ) ) ( not ( = ?auto_708568 ?auto_708569 ) ) ( not ( = ?auto_708568 ?auto_708570 ) ) ( not ( = ?auto_708568 ?auto_708571 ) ) ( not ( = ?auto_708568 ?auto_708572 ) ) ( not ( = ?auto_708568 ?auto_708573 ) ) ( not ( = ?auto_708568 ?auto_708574 ) ) ( not ( = ?auto_708568 ?auto_708575 ) ) ( not ( = ?auto_708568 ?auto_708576 ) ) ( not ( = ?auto_708568 ?auto_708577 ) ) ( not ( = ?auto_708568 ?auto_708578 ) ) ( not ( = ?auto_708568 ?auto_708579 ) ) ( not ( = ?auto_708568 ?auto_708580 ) ) ( not ( = ?auto_708568 ?auto_708581 ) ) ( not ( = ?auto_708568 ?auto_708582 ) ) ( not ( = ?auto_708569 ?auto_708570 ) ) ( not ( = ?auto_708569 ?auto_708571 ) ) ( not ( = ?auto_708569 ?auto_708572 ) ) ( not ( = ?auto_708569 ?auto_708573 ) ) ( not ( = ?auto_708569 ?auto_708574 ) ) ( not ( = ?auto_708569 ?auto_708575 ) ) ( not ( = ?auto_708569 ?auto_708576 ) ) ( not ( = ?auto_708569 ?auto_708577 ) ) ( not ( = ?auto_708569 ?auto_708578 ) ) ( not ( = ?auto_708569 ?auto_708579 ) ) ( not ( = ?auto_708569 ?auto_708580 ) ) ( not ( = ?auto_708569 ?auto_708581 ) ) ( not ( = ?auto_708569 ?auto_708582 ) ) ( not ( = ?auto_708570 ?auto_708571 ) ) ( not ( = ?auto_708570 ?auto_708572 ) ) ( not ( = ?auto_708570 ?auto_708573 ) ) ( not ( = ?auto_708570 ?auto_708574 ) ) ( not ( = ?auto_708570 ?auto_708575 ) ) ( not ( = ?auto_708570 ?auto_708576 ) ) ( not ( = ?auto_708570 ?auto_708577 ) ) ( not ( = ?auto_708570 ?auto_708578 ) ) ( not ( = ?auto_708570 ?auto_708579 ) ) ( not ( = ?auto_708570 ?auto_708580 ) ) ( not ( = ?auto_708570 ?auto_708581 ) ) ( not ( = ?auto_708570 ?auto_708582 ) ) ( not ( = ?auto_708571 ?auto_708572 ) ) ( not ( = ?auto_708571 ?auto_708573 ) ) ( not ( = ?auto_708571 ?auto_708574 ) ) ( not ( = ?auto_708571 ?auto_708575 ) ) ( not ( = ?auto_708571 ?auto_708576 ) ) ( not ( = ?auto_708571 ?auto_708577 ) ) ( not ( = ?auto_708571 ?auto_708578 ) ) ( not ( = ?auto_708571 ?auto_708579 ) ) ( not ( = ?auto_708571 ?auto_708580 ) ) ( not ( = ?auto_708571 ?auto_708581 ) ) ( not ( = ?auto_708571 ?auto_708582 ) ) ( not ( = ?auto_708572 ?auto_708573 ) ) ( not ( = ?auto_708572 ?auto_708574 ) ) ( not ( = ?auto_708572 ?auto_708575 ) ) ( not ( = ?auto_708572 ?auto_708576 ) ) ( not ( = ?auto_708572 ?auto_708577 ) ) ( not ( = ?auto_708572 ?auto_708578 ) ) ( not ( = ?auto_708572 ?auto_708579 ) ) ( not ( = ?auto_708572 ?auto_708580 ) ) ( not ( = ?auto_708572 ?auto_708581 ) ) ( not ( = ?auto_708572 ?auto_708582 ) ) ( not ( = ?auto_708573 ?auto_708574 ) ) ( not ( = ?auto_708573 ?auto_708575 ) ) ( not ( = ?auto_708573 ?auto_708576 ) ) ( not ( = ?auto_708573 ?auto_708577 ) ) ( not ( = ?auto_708573 ?auto_708578 ) ) ( not ( = ?auto_708573 ?auto_708579 ) ) ( not ( = ?auto_708573 ?auto_708580 ) ) ( not ( = ?auto_708573 ?auto_708581 ) ) ( not ( = ?auto_708573 ?auto_708582 ) ) ( not ( = ?auto_708574 ?auto_708575 ) ) ( not ( = ?auto_708574 ?auto_708576 ) ) ( not ( = ?auto_708574 ?auto_708577 ) ) ( not ( = ?auto_708574 ?auto_708578 ) ) ( not ( = ?auto_708574 ?auto_708579 ) ) ( not ( = ?auto_708574 ?auto_708580 ) ) ( not ( = ?auto_708574 ?auto_708581 ) ) ( not ( = ?auto_708574 ?auto_708582 ) ) ( not ( = ?auto_708575 ?auto_708576 ) ) ( not ( = ?auto_708575 ?auto_708577 ) ) ( not ( = ?auto_708575 ?auto_708578 ) ) ( not ( = ?auto_708575 ?auto_708579 ) ) ( not ( = ?auto_708575 ?auto_708580 ) ) ( not ( = ?auto_708575 ?auto_708581 ) ) ( not ( = ?auto_708575 ?auto_708582 ) ) ( not ( = ?auto_708576 ?auto_708577 ) ) ( not ( = ?auto_708576 ?auto_708578 ) ) ( not ( = ?auto_708576 ?auto_708579 ) ) ( not ( = ?auto_708576 ?auto_708580 ) ) ( not ( = ?auto_708576 ?auto_708581 ) ) ( not ( = ?auto_708576 ?auto_708582 ) ) ( not ( = ?auto_708577 ?auto_708578 ) ) ( not ( = ?auto_708577 ?auto_708579 ) ) ( not ( = ?auto_708577 ?auto_708580 ) ) ( not ( = ?auto_708577 ?auto_708581 ) ) ( not ( = ?auto_708577 ?auto_708582 ) ) ( not ( = ?auto_708578 ?auto_708579 ) ) ( not ( = ?auto_708578 ?auto_708580 ) ) ( not ( = ?auto_708578 ?auto_708581 ) ) ( not ( = ?auto_708578 ?auto_708582 ) ) ( not ( = ?auto_708579 ?auto_708580 ) ) ( not ( = ?auto_708579 ?auto_708581 ) ) ( not ( = ?auto_708579 ?auto_708582 ) ) ( not ( = ?auto_708580 ?auto_708581 ) ) ( not ( = ?auto_708580 ?auto_708582 ) ) ( not ( = ?auto_708581 ?auto_708582 ) ) ( ON ?auto_708580 ?auto_708581 ) ( ON ?auto_708579 ?auto_708580 ) ( ON ?auto_708578 ?auto_708579 ) ( ON ?auto_708577 ?auto_708578 ) ( ON ?auto_708576 ?auto_708577 ) ( ON ?auto_708575 ?auto_708576 ) ( ON ?auto_708574 ?auto_708575 ) ( ON ?auto_708573 ?auto_708574 ) ( ON ?auto_708572 ?auto_708573 ) ( ON ?auto_708571 ?auto_708572 ) ( ON ?auto_708570 ?auto_708571 ) ( ON ?auto_708569 ?auto_708570 ) ( ON ?auto_708568 ?auto_708569 ) ( ON ?auto_708567 ?auto_708568 ) ( ON ?auto_708566 ?auto_708567 ) ( CLEAR ?auto_708566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_708566 )
      ( MAKE-16PILE ?auto_708566 ?auto_708567 ?auto_708568 ?auto_708569 ?auto_708570 ?auto_708571 ?auto_708572 ?auto_708573 ?auto_708574 ?auto_708575 ?auto_708576 ?auto_708577 ?auto_708578 ?auto_708579 ?auto_708580 ?auto_708581 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708633 - BLOCK
      ?auto_708634 - BLOCK
      ?auto_708635 - BLOCK
      ?auto_708636 - BLOCK
      ?auto_708637 - BLOCK
      ?auto_708638 - BLOCK
      ?auto_708639 - BLOCK
      ?auto_708640 - BLOCK
      ?auto_708641 - BLOCK
      ?auto_708642 - BLOCK
      ?auto_708643 - BLOCK
      ?auto_708644 - BLOCK
      ?auto_708645 - BLOCK
      ?auto_708646 - BLOCK
      ?auto_708647 - BLOCK
      ?auto_708648 - BLOCK
      ?auto_708649 - BLOCK
    )
    :vars
    (
      ?auto_708650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_708648 ) ( ON ?auto_708649 ?auto_708650 ) ( CLEAR ?auto_708649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_708633 ) ( ON ?auto_708634 ?auto_708633 ) ( ON ?auto_708635 ?auto_708634 ) ( ON ?auto_708636 ?auto_708635 ) ( ON ?auto_708637 ?auto_708636 ) ( ON ?auto_708638 ?auto_708637 ) ( ON ?auto_708639 ?auto_708638 ) ( ON ?auto_708640 ?auto_708639 ) ( ON ?auto_708641 ?auto_708640 ) ( ON ?auto_708642 ?auto_708641 ) ( ON ?auto_708643 ?auto_708642 ) ( ON ?auto_708644 ?auto_708643 ) ( ON ?auto_708645 ?auto_708644 ) ( ON ?auto_708646 ?auto_708645 ) ( ON ?auto_708647 ?auto_708646 ) ( ON ?auto_708648 ?auto_708647 ) ( not ( = ?auto_708633 ?auto_708634 ) ) ( not ( = ?auto_708633 ?auto_708635 ) ) ( not ( = ?auto_708633 ?auto_708636 ) ) ( not ( = ?auto_708633 ?auto_708637 ) ) ( not ( = ?auto_708633 ?auto_708638 ) ) ( not ( = ?auto_708633 ?auto_708639 ) ) ( not ( = ?auto_708633 ?auto_708640 ) ) ( not ( = ?auto_708633 ?auto_708641 ) ) ( not ( = ?auto_708633 ?auto_708642 ) ) ( not ( = ?auto_708633 ?auto_708643 ) ) ( not ( = ?auto_708633 ?auto_708644 ) ) ( not ( = ?auto_708633 ?auto_708645 ) ) ( not ( = ?auto_708633 ?auto_708646 ) ) ( not ( = ?auto_708633 ?auto_708647 ) ) ( not ( = ?auto_708633 ?auto_708648 ) ) ( not ( = ?auto_708633 ?auto_708649 ) ) ( not ( = ?auto_708633 ?auto_708650 ) ) ( not ( = ?auto_708634 ?auto_708635 ) ) ( not ( = ?auto_708634 ?auto_708636 ) ) ( not ( = ?auto_708634 ?auto_708637 ) ) ( not ( = ?auto_708634 ?auto_708638 ) ) ( not ( = ?auto_708634 ?auto_708639 ) ) ( not ( = ?auto_708634 ?auto_708640 ) ) ( not ( = ?auto_708634 ?auto_708641 ) ) ( not ( = ?auto_708634 ?auto_708642 ) ) ( not ( = ?auto_708634 ?auto_708643 ) ) ( not ( = ?auto_708634 ?auto_708644 ) ) ( not ( = ?auto_708634 ?auto_708645 ) ) ( not ( = ?auto_708634 ?auto_708646 ) ) ( not ( = ?auto_708634 ?auto_708647 ) ) ( not ( = ?auto_708634 ?auto_708648 ) ) ( not ( = ?auto_708634 ?auto_708649 ) ) ( not ( = ?auto_708634 ?auto_708650 ) ) ( not ( = ?auto_708635 ?auto_708636 ) ) ( not ( = ?auto_708635 ?auto_708637 ) ) ( not ( = ?auto_708635 ?auto_708638 ) ) ( not ( = ?auto_708635 ?auto_708639 ) ) ( not ( = ?auto_708635 ?auto_708640 ) ) ( not ( = ?auto_708635 ?auto_708641 ) ) ( not ( = ?auto_708635 ?auto_708642 ) ) ( not ( = ?auto_708635 ?auto_708643 ) ) ( not ( = ?auto_708635 ?auto_708644 ) ) ( not ( = ?auto_708635 ?auto_708645 ) ) ( not ( = ?auto_708635 ?auto_708646 ) ) ( not ( = ?auto_708635 ?auto_708647 ) ) ( not ( = ?auto_708635 ?auto_708648 ) ) ( not ( = ?auto_708635 ?auto_708649 ) ) ( not ( = ?auto_708635 ?auto_708650 ) ) ( not ( = ?auto_708636 ?auto_708637 ) ) ( not ( = ?auto_708636 ?auto_708638 ) ) ( not ( = ?auto_708636 ?auto_708639 ) ) ( not ( = ?auto_708636 ?auto_708640 ) ) ( not ( = ?auto_708636 ?auto_708641 ) ) ( not ( = ?auto_708636 ?auto_708642 ) ) ( not ( = ?auto_708636 ?auto_708643 ) ) ( not ( = ?auto_708636 ?auto_708644 ) ) ( not ( = ?auto_708636 ?auto_708645 ) ) ( not ( = ?auto_708636 ?auto_708646 ) ) ( not ( = ?auto_708636 ?auto_708647 ) ) ( not ( = ?auto_708636 ?auto_708648 ) ) ( not ( = ?auto_708636 ?auto_708649 ) ) ( not ( = ?auto_708636 ?auto_708650 ) ) ( not ( = ?auto_708637 ?auto_708638 ) ) ( not ( = ?auto_708637 ?auto_708639 ) ) ( not ( = ?auto_708637 ?auto_708640 ) ) ( not ( = ?auto_708637 ?auto_708641 ) ) ( not ( = ?auto_708637 ?auto_708642 ) ) ( not ( = ?auto_708637 ?auto_708643 ) ) ( not ( = ?auto_708637 ?auto_708644 ) ) ( not ( = ?auto_708637 ?auto_708645 ) ) ( not ( = ?auto_708637 ?auto_708646 ) ) ( not ( = ?auto_708637 ?auto_708647 ) ) ( not ( = ?auto_708637 ?auto_708648 ) ) ( not ( = ?auto_708637 ?auto_708649 ) ) ( not ( = ?auto_708637 ?auto_708650 ) ) ( not ( = ?auto_708638 ?auto_708639 ) ) ( not ( = ?auto_708638 ?auto_708640 ) ) ( not ( = ?auto_708638 ?auto_708641 ) ) ( not ( = ?auto_708638 ?auto_708642 ) ) ( not ( = ?auto_708638 ?auto_708643 ) ) ( not ( = ?auto_708638 ?auto_708644 ) ) ( not ( = ?auto_708638 ?auto_708645 ) ) ( not ( = ?auto_708638 ?auto_708646 ) ) ( not ( = ?auto_708638 ?auto_708647 ) ) ( not ( = ?auto_708638 ?auto_708648 ) ) ( not ( = ?auto_708638 ?auto_708649 ) ) ( not ( = ?auto_708638 ?auto_708650 ) ) ( not ( = ?auto_708639 ?auto_708640 ) ) ( not ( = ?auto_708639 ?auto_708641 ) ) ( not ( = ?auto_708639 ?auto_708642 ) ) ( not ( = ?auto_708639 ?auto_708643 ) ) ( not ( = ?auto_708639 ?auto_708644 ) ) ( not ( = ?auto_708639 ?auto_708645 ) ) ( not ( = ?auto_708639 ?auto_708646 ) ) ( not ( = ?auto_708639 ?auto_708647 ) ) ( not ( = ?auto_708639 ?auto_708648 ) ) ( not ( = ?auto_708639 ?auto_708649 ) ) ( not ( = ?auto_708639 ?auto_708650 ) ) ( not ( = ?auto_708640 ?auto_708641 ) ) ( not ( = ?auto_708640 ?auto_708642 ) ) ( not ( = ?auto_708640 ?auto_708643 ) ) ( not ( = ?auto_708640 ?auto_708644 ) ) ( not ( = ?auto_708640 ?auto_708645 ) ) ( not ( = ?auto_708640 ?auto_708646 ) ) ( not ( = ?auto_708640 ?auto_708647 ) ) ( not ( = ?auto_708640 ?auto_708648 ) ) ( not ( = ?auto_708640 ?auto_708649 ) ) ( not ( = ?auto_708640 ?auto_708650 ) ) ( not ( = ?auto_708641 ?auto_708642 ) ) ( not ( = ?auto_708641 ?auto_708643 ) ) ( not ( = ?auto_708641 ?auto_708644 ) ) ( not ( = ?auto_708641 ?auto_708645 ) ) ( not ( = ?auto_708641 ?auto_708646 ) ) ( not ( = ?auto_708641 ?auto_708647 ) ) ( not ( = ?auto_708641 ?auto_708648 ) ) ( not ( = ?auto_708641 ?auto_708649 ) ) ( not ( = ?auto_708641 ?auto_708650 ) ) ( not ( = ?auto_708642 ?auto_708643 ) ) ( not ( = ?auto_708642 ?auto_708644 ) ) ( not ( = ?auto_708642 ?auto_708645 ) ) ( not ( = ?auto_708642 ?auto_708646 ) ) ( not ( = ?auto_708642 ?auto_708647 ) ) ( not ( = ?auto_708642 ?auto_708648 ) ) ( not ( = ?auto_708642 ?auto_708649 ) ) ( not ( = ?auto_708642 ?auto_708650 ) ) ( not ( = ?auto_708643 ?auto_708644 ) ) ( not ( = ?auto_708643 ?auto_708645 ) ) ( not ( = ?auto_708643 ?auto_708646 ) ) ( not ( = ?auto_708643 ?auto_708647 ) ) ( not ( = ?auto_708643 ?auto_708648 ) ) ( not ( = ?auto_708643 ?auto_708649 ) ) ( not ( = ?auto_708643 ?auto_708650 ) ) ( not ( = ?auto_708644 ?auto_708645 ) ) ( not ( = ?auto_708644 ?auto_708646 ) ) ( not ( = ?auto_708644 ?auto_708647 ) ) ( not ( = ?auto_708644 ?auto_708648 ) ) ( not ( = ?auto_708644 ?auto_708649 ) ) ( not ( = ?auto_708644 ?auto_708650 ) ) ( not ( = ?auto_708645 ?auto_708646 ) ) ( not ( = ?auto_708645 ?auto_708647 ) ) ( not ( = ?auto_708645 ?auto_708648 ) ) ( not ( = ?auto_708645 ?auto_708649 ) ) ( not ( = ?auto_708645 ?auto_708650 ) ) ( not ( = ?auto_708646 ?auto_708647 ) ) ( not ( = ?auto_708646 ?auto_708648 ) ) ( not ( = ?auto_708646 ?auto_708649 ) ) ( not ( = ?auto_708646 ?auto_708650 ) ) ( not ( = ?auto_708647 ?auto_708648 ) ) ( not ( = ?auto_708647 ?auto_708649 ) ) ( not ( = ?auto_708647 ?auto_708650 ) ) ( not ( = ?auto_708648 ?auto_708649 ) ) ( not ( = ?auto_708648 ?auto_708650 ) ) ( not ( = ?auto_708649 ?auto_708650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_708649 ?auto_708650 )
      ( !STACK ?auto_708649 ?auto_708648 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708668 - BLOCK
      ?auto_708669 - BLOCK
      ?auto_708670 - BLOCK
      ?auto_708671 - BLOCK
      ?auto_708672 - BLOCK
      ?auto_708673 - BLOCK
      ?auto_708674 - BLOCK
      ?auto_708675 - BLOCK
      ?auto_708676 - BLOCK
      ?auto_708677 - BLOCK
      ?auto_708678 - BLOCK
      ?auto_708679 - BLOCK
      ?auto_708680 - BLOCK
      ?auto_708681 - BLOCK
      ?auto_708682 - BLOCK
      ?auto_708683 - BLOCK
      ?auto_708684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_708683 ) ( ON-TABLE ?auto_708684 ) ( CLEAR ?auto_708684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_708668 ) ( ON ?auto_708669 ?auto_708668 ) ( ON ?auto_708670 ?auto_708669 ) ( ON ?auto_708671 ?auto_708670 ) ( ON ?auto_708672 ?auto_708671 ) ( ON ?auto_708673 ?auto_708672 ) ( ON ?auto_708674 ?auto_708673 ) ( ON ?auto_708675 ?auto_708674 ) ( ON ?auto_708676 ?auto_708675 ) ( ON ?auto_708677 ?auto_708676 ) ( ON ?auto_708678 ?auto_708677 ) ( ON ?auto_708679 ?auto_708678 ) ( ON ?auto_708680 ?auto_708679 ) ( ON ?auto_708681 ?auto_708680 ) ( ON ?auto_708682 ?auto_708681 ) ( ON ?auto_708683 ?auto_708682 ) ( not ( = ?auto_708668 ?auto_708669 ) ) ( not ( = ?auto_708668 ?auto_708670 ) ) ( not ( = ?auto_708668 ?auto_708671 ) ) ( not ( = ?auto_708668 ?auto_708672 ) ) ( not ( = ?auto_708668 ?auto_708673 ) ) ( not ( = ?auto_708668 ?auto_708674 ) ) ( not ( = ?auto_708668 ?auto_708675 ) ) ( not ( = ?auto_708668 ?auto_708676 ) ) ( not ( = ?auto_708668 ?auto_708677 ) ) ( not ( = ?auto_708668 ?auto_708678 ) ) ( not ( = ?auto_708668 ?auto_708679 ) ) ( not ( = ?auto_708668 ?auto_708680 ) ) ( not ( = ?auto_708668 ?auto_708681 ) ) ( not ( = ?auto_708668 ?auto_708682 ) ) ( not ( = ?auto_708668 ?auto_708683 ) ) ( not ( = ?auto_708668 ?auto_708684 ) ) ( not ( = ?auto_708669 ?auto_708670 ) ) ( not ( = ?auto_708669 ?auto_708671 ) ) ( not ( = ?auto_708669 ?auto_708672 ) ) ( not ( = ?auto_708669 ?auto_708673 ) ) ( not ( = ?auto_708669 ?auto_708674 ) ) ( not ( = ?auto_708669 ?auto_708675 ) ) ( not ( = ?auto_708669 ?auto_708676 ) ) ( not ( = ?auto_708669 ?auto_708677 ) ) ( not ( = ?auto_708669 ?auto_708678 ) ) ( not ( = ?auto_708669 ?auto_708679 ) ) ( not ( = ?auto_708669 ?auto_708680 ) ) ( not ( = ?auto_708669 ?auto_708681 ) ) ( not ( = ?auto_708669 ?auto_708682 ) ) ( not ( = ?auto_708669 ?auto_708683 ) ) ( not ( = ?auto_708669 ?auto_708684 ) ) ( not ( = ?auto_708670 ?auto_708671 ) ) ( not ( = ?auto_708670 ?auto_708672 ) ) ( not ( = ?auto_708670 ?auto_708673 ) ) ( not ( = ?auto_708670 ?auto_708674 ) ) ( not ( = ?auto_708670 ?auto_708675 ) ) ( not ( = ?auto_708670 ?auto_708676 ) ) ( not ( = ?auto_708670 ?auto_708677 ) ) ( not ( = ?auto_708670 ?auto_708678 ) ) ( not ( = ?auto_708670 ?auto_708679 ) ) ( not ( = ?auto_708670 ?auto_708680 ) ) ( not ( = ?auto_708670 ?auto_708681 ) ) ( not ( = ?auto_708670 ?auto_708682 ) ) ( not ( = ?auto_708670 ?auto_708683 ) ) ( not ( = ?auto_708670 ?auto_708684 ) ) ( not ( = ?auto_708671 ?auto_708672 ) ) ( not ( = ?auto_708671 ?auto_708673 ) ) ( not ( = ?auto_708671 ?auto_708674 ) ) ( not ( = ?auto_708671 ?auto_708675 ) ) ( not ( = ?auto_708671 ?auto_708676 ) ) ( not ( = ?auto_708671 ?auto_708677 ) ) ( not ( = ?auto_708671 ?auto_708678 ) ) ( not ( = ?auto_708671 ?auto_708679 ) ) ( not ( = ?auto_708671 ?auto_708680 ) ) ( not ( = ?auto_708671 ?auto_708681 ) ) ( not ( = ?auto_708671 ?auto_708682 ) ) ( not ( = ?auto_708671 ?auto_708683 ) ) ( not ( = ?auto_708671 ?auto_708684 ) ) ( not ( = ?auto_708672 ?auto_708673 ) ) ( not ( = ?auto_708672 ?auto_708674 ) ) ( not ( = ?auto_708672 ?auto_708675 ) ) ( not ( = ?auto_708672 ?auto_708676 ) ) ( not ( = ?auto_708672 ?auto_708677 ) ) ( not ( = ?auto_708672 ?auto_708678 ) ) ( not ( = ?auto_708672 ?auto_708679 ) ) ( not ( = ?auto_708672 ?auto_708680 ) ) ( not ( = ?auto_708672 ?auto_708681 ) ) ( not ( = ?auto_708672 ?auto_708682 ) ) ( not ( = ?auto_708672 ?auto_708683 ) ) ( not ( = ?auto_708672 ?auto_708684 ) ) ( not ( = ?auto_708673 ?auto_708674 ) ) ( not ( = ?auto_708673 ?auto_708675 ) ) ( not ( = ?auto_708673 ?auto_708676 ) ) ( not ( = ?auto_708673 ?auto_708677 ) ) ( not ( = ?auto_708673 ?auto_708678 ) ) ( not ( = ?auto_708673 ?auto_708679 ) ) ( not ( = ?auto_708673 ?auto_708680 ) ) ( not ( = ?auto_708673 ?auto_708681 ) ) ( not ( = ?auto_708673 ?auto_708682 ) ) ( not ( = ?auto_708673 ?auto_708683 ) ) ( not ( = ?auto_708673 ?auto_708684 ) ) ( not ( = ?auto_708674 ?auto_708675 ) ) ( not ( = ?auto_708674 ?auto_708676 ) ) ( not ( = ?auto_708674 ?auto_708677 ) ) ( not ( = ?auto_708674 ?auto_708678 ) ) ( not ( = ?auto_708674 ?auto_708679 ) ) ( not ( = ?auto_708674 ?auto_708680 ) ) ( not ( = ?auto_708674 ?auto_708681 ) ) ( not ( = ?auto_708674 ?auto_708682 ) ) ( not ( = ?auto_708674 ?auto_708683 ) ) ( not ( = ?auto_708674 ?auto_708684 ) ) ( not ( = ?auto_708675 ?auto_708676 ) ) ( not ( = ?auto_708675 ?auto_708677 ) ) ( not ( = ?auto_708675 ?auto_708678 ) ) ( not ( = ?auto_708675 ?auto_708679 ) ) ( not ( = ?auto_708675 ?auto_708680 ) ) ( not ( = ?auto_708675 ?auto_708681 ) ) ( not ( = ?auto_708675 ?auto_708682 ) ) ( not ( = ?auto_708675 ?auto_708683 ) ) ( not ( = ?auto_708675 ?auto_708684 ) ) ( not ( = ?auto_708676 ?auto_708677 ) ) ( not ( = ?auto_708676 ?auto_708678 ) ) ( not ( = ?auto_708676 ?auto_708679 ) ) ( not ( = ?auto_708676 ?auto_708680 ) ) ( not ( = ?auto_708676 ?auto_708681 ) ) ( not ( = ?auto_708676 ?auto_708682 ) ) ( not ( = ?auto_708676 ?auto_708683 ) ) ( not ( = ?auto_708676 ?auto_708684 ) ) ( not ( = ?auto_708677 ?auto_708678 ) ) ( not ( = ?auto_708677 ?auto_708679 ) ) ( not ( = ?auto_708677 ?auto_708680 ) ) ( not ( = ?auto_708677 ?auto_708681 ) ) ( not ( = ?auto_708677 ?auto_708682 ) ) ( not ( = ?auto_708677 ?auto_708683 ) ) ( not ( = ?auto_708677 ?auto_708684 ) ) ( not ( = ?auto_708678 ?auto_708679 ) ) ( not ( = ?auto_708678 ?auto_708680 ) ) ( not ( = ?auto_708678 ?auto_708681 ) ) ( not ( = ?auto_708678 ?auto_708682 ) ) ( not ( = ?auto_708678 ?auto_708683 ) ) ( not ( = ?auto_708678 ?auto_708684 ) ) ( not ( = ?auto_708679 ?auto_708680 ) ) ( not ( = ?auto_708679 ?auto_708681 ) ) ( not ( = ?auto_708679 ?auto_708682 ) ) ( not ( = ?auto_708679 ?auto_708683 ) ) ( not ( = ?auto_708679 ?auto_708684 ) ) ( not ( = ?auto_708680 ?auto_708681 ) ) ( not ( = ?auto_708680 ?auto_708682 ) ) ( not ( = ?auto_708680 ?auto_708683 ) ) ( not ( = ?auto_708680 ?auto_708684 ) ) ( not ( = ?auto_708681 ?auto_708682 ) ) ( not ( = ?auto_708681 ?auto_708683 ) ) ( not ( = ?auto_708681 ?auto_708684 ) ) ( not ( = ?auto_708682 ?auto_708683 ) ) ( not ( = ?auto_708682 ?auto_708684 ) ) ( not ( = ?auto_708683 ?auto_708684 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_708684 )
      ( !STACK ?auto_708684 ?auto_708683 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708702 - BLOCK
      ?auto_708703 - BLOCK
      ?auto_708704 - BLOCK
      ?auto_708705 - BLOCK
      ?auto_708706 - BLOCK
      ?auto_708707 - BLOCK
      ?auto_708708 - BLOCK
      ?auto_708709 - BLOCK
      ?auto_708710 - BLOCK
      ?auto_708711 - BLOCK
      ?auto_708712 - BLOCK
      ?auto_708713 - BLOCK
      ?auto_708714 - BLOCK
      ?auto_708715 - BLOCK
      ?auto_708716 - BLOCK
      ?auto_708717 - BLOCK
      ?auto_708718 - BLOCK
    )
    :vars
    (
      ?auto_708719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708718 ?auto_708719 ) ( ON-TABLE ?auto_708702 ) ( ON ?auto_708703 ?auto_708702 ) ( ON ?auto_708704 ?auto_708703 ) ( ON ?auto_708705 ?auto_708704 ) ( ON ?auto_708706 ?auto_708705 ) ( ON ?auto_708707 ?auto_708706 ) ( ON ?auto_708708 ?auto_708707 ) ( ON ?auto_708709 ?auto_708708 ) ( ON ?auto_708710 ?auto_708709 ) ( ON ?auto_708711 ?auto_708710 ) ( ON ?auto_708712 ?auto_708711 ) ( ON ?auto_708713 ?auto_708712 ) ( ON ?auto_708714 ?auto_708713 ) ( ON ?auto_708715 ?auto_708714 ) ( ON ?auto_708716 ?auto_708715 ) ( not ( = ?auto_708702 ?auto_708703 ) ) ( not ( = ?auto_708702 ?auto_708704 ) ) ( not ( = ?auto_708702 ?auto_708705 ) ) ( not ( = ?auto_708702 ?auto_708706 ) ) ( not ( = ?auto_708702 ?auto_708707 ) ) ( not ( = ?auto_708702 ?auto_708708 ) ) ( not ( = ?auto_708702 ?auto_708709 ) ) ( not ( = ?auto_708702 ?auto_708710 ) ) ( not ( = ?auto_708702 ?auto_708711 ) ) ( not ( = ?auto_708702 ?auto_708712 ) ) ( not ( = ?auto_708702 ?auto_708713 ) ) ( not ( = ?auto_708702 ?auto_708714 ) ) ( not ( = ?auto_708702 ?auto_708715 ) ) ( not ( = ?auto_708702 ?auto_708716 ) ) ( not ( = ?auto_708702 ?auto_708717 ) ) ( not ( = ?auto_708702 ?auto_708718 ) ) ( not ( = ?auto_708702 ?auto_708719 ) ) ( not ( = ?auto_708703 ?auto_708704 ) ) ( not ( = ?auto_708703 ?auto_708705 ) ) ( not ( = ?auto_708703 ?auto_708706 ) ) ( not ( = ?auto_708703 ?auto_708707 ) ) ( not ( = ?auto_708703 ?auto_708708 ) ) ( not ( = ?auto_708703 ?auto_708709 ) ) ( not ( = ?auto_708703 ?auto_708710 ) ) ( not ( = ?auto_708703 ?auto_708711 ) ) ( not ( = ?auto_708703 ?auto_708712 ) ) ( not ( = ?auto_708703 ?auto_708713 ) ) ( not ( = ?auto_708703 ?auto_708714 ) ) ( not ( = ?auto_708703 ?auto_708715 ) ) ( not ( = ?auto_708703 ?auto_708716 ) ) ( not ( = ?auto_708703 ?auto_708717 ) ) ( not ( = ?auto_708703 ?auto_708718 ) ) ( not ( = ?auto_708703 ?auto_708719 ) ) ( not ( = ?auto_708704 ?auto_708705 ) ) ( not ( = ?auto_708704 ?auto_708706 ) ) ( not ( = ?auto_708704 ?auto_708707 ) ) ( not ( = ?auto_708704 ?auto_708708 ) ) ( not ( = ?auto_708704 ?auto_708709 ) ) ( not ( = ?auto_708704 ?auto_708710 ) ) ( not ( = ?auto_708704 ?auto_708711 ) ) ( not ( = ?auto_708704 ?auto_708712 ) ) ( not ( = ?auto_708704 ?auto_708713 ) ) ( not ( = ?auto_708704 ?auto_708714 ) ) ( not ( = ?auto_708704 ?auto_708715 ) ) ( not ( = ?auto_708704 ?auto_708716 ) ) ( not ( = ?auto_708704 ?auto_708717 ) ) ( not ( = ?auto_708704 ?auto_708718 ) ) ( not ( = ?auto_708704 ?auto_708719 ) ) ( not ( = ?auto_708705 ?auto_708706 ) ) ( not ( = ?auto_708705 ?auto_708707 ) ) ( not ( = ?auto_708705 ?auto_708708 ) ) ( not ( = ?auto_708705 ?auto_708709 ) ) ( not ( = ?auto_708705 ?auto_708710 ) ) ( not ( = ?auto_708705 ?auto_708711 ) ) ( not ( = ?auto_708705 ?auto_708712 ) ) ( not ( = ?auto_708705 ?auto_708713 ) ) ( not ( = ?auto_708705 ?auto_708714 ) ) ( not ( = ?auto_708705 ?auto_708715 ) ) ( not ( = ?auto_708705 ?auto_708716 ) ) ( not ( = ?auto_708705 ?auto_708717 ) ) ( not ( = ?auto_708705 ?auto_708718 ) ) ( not ( = ?auto_708705 ?auto_708719 ) ) ( not ( = ?auto_708706 ?auto_708707 ) ) ( not ( = ?auto_708706 ?auto_708708 ) ) ( not ( = ?auto_708706 ?auto_708709 ) ) ( not ( = ?auto_708706 ?auto_708710 ) ) ( not ( = ?auto_708706 ?auto_708711 ) ) ( not ( = ?auto_708706 ?auto_708712 ) ) ( not ( = ?auto_708706 ?auto_708713 ) ) ( not ( = ?auto_708706 ?auto_708714 ) ) ( not ( = ?auto_708706 ?auto_708715 ) ) ( not ( = ?auto_708706 ?auto_708716 ) ) ( not ( = ?auto_708706 ?auto_708717 ) ) ( not ( = ?auto_708706 ?auto_708718 ) ) ( not ( = ?auto_708706 ?auto_708719 ) ) ( not ( = ?auto_708707 ?auto_708708 ) ) ( not ( = ?auto_708707 ?auto_708709 ) ) ( not ( = ?auto_708707 ?auto_708710 ) ) ( not ( = ?auto_708707 ?auto_708711 ) ) ( not ( = ?auto_708707 ?auto_708712 ) ) ( not ( = ?auto_708707 ?auto_708713 ) ) ( not ( = ?auto_708707 ?auto_708714 ) ) ( not ( = ?auto_708707 ?auto_708715 ) ) ( not ( = ?auto_708707 ?auto_708716 ) ) ( not ( = ?auto_708707 ?auto_708717 ) ) ( not ( = ?auto_708707 ?auto_708718 ) ) ( not ( = ?auto_708707 ?auto_708719 ) ) ( not ( = ?auto_708708 ?auto_708709 ) ) ( not ( = ?auto_708708 ?auto_708710 ) ) ( not ( = ?auto_708708 ?auto_708711 ) ) ( not ( = ?auto_708708 ?auto_708712 ) ) ( not ( = ?auto_708708 ?auto_708713 ) ) ( not ( = ?auto_708708 ?auto_708714 ) ) ( not ( = ?auto_708708 ?auto_708715 ) ) ( not ( = ?auto_708708 ?auto_708716 ) ) ( not ( = ?auto_708708 ?auto_708717 ) ) ( not ( = ?auto_708708 ?auto_708718 ) ) ( not ( = ?auto_708708 ?auto_708719 ) ) ( not ( = ?auto_708709 ?auto_708710 ) ) ( not ( = ?auto_708709 ?auto_708711 ) ) ( not ( = ?auto_708709 ?auto_708712 ) ) ( not ( = ?auto_708709 ?auto_708713 ) ) ( not ( = ?auto_708709 ?auto_708714 ) ) ( not ( = ?auto_708709 ?auto_708715 ) ) ( not ( = ?auto_708709 ?auto_708716 ) ) ( not ( = ?auto_708709 ?auto_708717 ) ) ( not ( = ?auto_708709 ?auto_708718 ) ) ( not ( = ?auto_708709 ?auto_708719 ) ) ( not ( = ?auto_708710 ?auto_708711 ) ) ( not ( = ?auto_708710 ?auto_708712 ) ) ( not ( = ?auto_708710 ?auto_708713 ) ) ( not ( = ?auto_708710 ?auto_708714 ) ) ( not ( = ?auto_708710 ?auto_708715 ) ) ( not ( = ?auto_708710 ?auto_708716 ) ) ( not ( = ?auto_708710 ?auto_708717 ) ) ( not ( = ?auto_708710 ?auto_708718 ) ) ( not ( = ?auto_708710 ?auto_708719 ) ) ( not ( = ?auto_708711 ?auto_708712 ) ) ( not ( = ?auto_708711 ?auto_708713 ) ) ( not ( = ?auto_708711 ?auto_708714 ) ) ( not ( = ?auto_708711 ?auto_708715 ) ) ( not ( = ?auto_708711 ?auto_708716 ) ) ( not ( = ?auto_708711 ?auto_708717 ) ) ( not ( = ?auto_708711 ?auto_708718 ) ) ( not ( = ?auto_708711 ?auto_708719 ) ) ( not ( = ?auto_708712 ?auto_708713 ) ) ( not ( = ?auto_708712 ?auto_708714 ) ) ( not ( = ?auto_708712 ?auto_708715 ) ) ( not ( = ?auto_708712 ?auto_708716 ) ) ( not ( = ?auto_708712 ?auto_708717 ) ) ( not ( = ?auto_708712 ?auto_708718 ) ) ( not ( = ?auto_708712 ?auto_708719 ) ) ( not ( = ?auto_708713 ?auto_708714 ) ) ( not ( = ?auto_708713 ?auto_708715 ) ) ( not ( = ?auto_708713 ?auto_708716 ) ) ( not ( = ?auto_708713 ?auto_708717 ) ) ( not ( = ?auto_708713 ?auto_708718 ) ) ( not ( = ?auto_708713 ?auto_708719 ) ) ( not ( = ?auto_708714 ?auto_708715 ) ) ( not ( = ?auto_708714 ?auto_708716 ) ) ( not ( = ?auto_708714 ?auto_708717 ) ) ( not ( = ?auto_708714 ?auto_708718 ) ) ( not ( = ?auto_708714 ?auto_708719 ) ) ( not ( = ?auto_708715 ?auto_708716 ) ) ( not ( = ?auto_708715 ?auto_708717 ) ) ( not ( = ?auto_708715 ?auto_708718 ) ) ( not ( = ?auto_708715 ?auto_708719 ) ) ( not ( = ?auto_708716 ?auto_708717 ) ) ( not ( = ?auto_708716 ?auto_708718 ) ) ( not ( = ?auto_708716 ?auto_708719 ) ) ( not ( = ?auto_708717 ?auto_708718 ) ) ( not ( = ?auto_708717 ?auto_708719 ) ) ( not ( = ?auto_708718 ?auto_708719 ) ) ( CLEAR ?auto_708716 ) ( ON ?auto_708717 ?auto_708718 ) ( CLEAR ?auto_708717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_708702 ?auto_708703 ?auto_708704 ?auto_708705 ?auto_708706 ?auto_708707 ?auto_708708 ?auto_708709 ?auto_708710 ?auto_708711 ?auto_708712 ?auto_708713 ?auto_708714 ?auto_708715 ?auto_708716 ?auto_708717 )
      ( MAKE-17PILE ?auto_708702 ?auto_708703 ?auto_708704 ?auto_708705 ?auto_708706 ?auto_708707 ?auto_708708 ?auto_708709 ?auto_708710 ?auto_708711 ?auto_708712 ?auto_708713 ?auto_708714 ?auto_708715 ?auto_708716 ?auto_708717 ?auto_708718 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708737 - BLOCK
      ?auto_708738 - BLOCK
      ?auto_708739 - BLOCK
      ?auto_708740 - BLOCK
      ?auto_708741 - BLOCK
      ?auto_708742 - BLOCK
      ?auto_708743 - BLOCK
      ?auto_708744 - BLOCK
      ?auto_708745 - BLOCK
      ?auto_708746 - BLOCK
      ?auto_708747 - BLOCK
      ?auto_708748 - BLOCK
      ?auto_708749 - BLOCK
      ?auto_708750 - BLOCK
      ?auto_708751 - BLOCK
      ?auto_708752 - BLOCK
      ?auto_708753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_708753 ) ( ON-TABLE ?auto_708737 ) ( ON ?auto_708738 ?auto_708737 ) ( ON ?auto_708739 ?auto_708738 ) ( ON ?auto_708740 ?auto_708739 ) ( ON ?auto_708741 ?auto_708740 ) ( ON ?auto_708742 ?auto_708741 ) ( ON ?auto_708743 ?auto_708742 ) ( ON ?auto_708744 ?auto_708743 ) ( ON ?auto_708745 ?auto_708744 ) ( ON ?auto_708746 ?auto_708745 ) ( ON ?auto_708747 ?auto_708746 ) ( ON ?auto_708748 ?auto_708747 ) ( ON ?auto_708749 ?auto_708748 ) ( ON ?auto_708750 ?auto_708749 ) ( ON ?auto_708751 ?auto_708750 ) ( not ( = ?auto_708737 ?auto_708738 ) ) ( not ( = ?auto_708737 ?auto_708739 ) ) ( not ( = ?auto_708737 ?auto_708740 ) ) ( not ( = ?auto_708737 ?auto_708741 ) ) ( not ( = ?auto_708737 ?auto_708742 ) ) ( not ( = ?auto_708737 ?auto_708743 ) ) ( not ( = ?auto_708737 ?auto_708744 ) ) ( not ( = ?auto_708737 ?auto_708745 ) ) ( not ( = ?auto_708737 ?auto_708746 ) ) ( not ( = ?auto_708737 ?auto_708747 ) ) ( not ( = ?auto_708737 ?auto_708748 ) ) ( not ( = ?auto_708737 ?auto_708749 ) ) ( not ( = ?auto_708737 ?auto_708750 ) ) ( not ( = ?auto_708737 ?auto_708751 ) ) ( not ( = ?auto_708737 ?auto_708752 ) ) ( not ( = ?auto_708737 ?auto_708753 ) ) ( not ( = ?auto_708738 ?auto_708739 ) ) ( not ( = ?auto_708738 ?auto_708740 ) ) ( not ( = ?auto_708738 ?auto_708741 ) ) ( not ( = ?auto_708738 ?auto_708742 ) ) ( not ( = ?auto_708738 ?auto_708743 ) ) ( not ( = ?auto_708738 ?auto_708744 ) ) ( not ( = ?auto_708738 ?auto_708745 ) ) ( not ( = ?auto_708738 ?auto_708746 ) ) ( not ( = ?auto_708738 ?auto_708747 ) ) ( not ( = ?auto_708738 ?auto_708748 ) ) ( not ( = ?auto_708738 ?auto_708749 ) ) ( not ( = ?auto_708738 ?auto_708750 ) ) ( not ( = ?auto_708738 ?auto_708751 ) ) ( not ( = ?auto_708738 ?auto_708752 ) ) ( not ( = ?auto_708738 ?auto_708753 ) ) ( not ( = ?auto_708739 ?auto_708740 ) ) ( not ( = ?auto_708739 ?auto_708741 ) ) ( not ( = ?auto_708739 ?auto_708742 ) ) ( not ( = ?auto_708739 ?auto_708743 ) ) ( not ( = ?auto_708739 ?auto_708744 ) ) ( not ( = ?auto_708739 ?auto_708745 ) ) ( not ( = ?auto_708739 ?auto_708746 ) ) ( not ( = ?auto_708739 ?auto_708747 ) ) ( not ( = ?auto_708739 ?auto_708748 ) ) ( not ( = ?auto_708739 ?auto_708749 ) ) ( not ( = ?auto_708739 ?auto_708750 ) ) ( not ( = ?auto_708739 ?auto_708751 ) ) ( not ( = ?auto_708739 ?auto_708752 ) ) ( not ( = ?auto_708739 ?auto_708753 ) ) ( not ( = ?auto_708740 ?auto_708741 ) ) ( not ( = ?auto_708740 ?auto_708742 ) ) ( not ( = ?auto_708740 ?auto_708743 ) ) ( not ( = ?auto_708740 ?auto_708744 ) ) ( not ( = ?auto_708740 ?auto_708745 ) ) ( not ( = ?auto_708740 ?auto_708746 ) ) ( not ( = ?auto_708740 ?auto_708747 ) ) ( not ( = ?auto_708740 ?auto_708748 ) ) ( not ( = ?auto_708740 ?auto_708749 ) ) ( not ( = ?auto_708740 ?auto_708750 ) ) ( not ( = ?auto_708740 ?auto_708751 ) ) ( not ( = ?auto_708740 ?auto_708752 ) ) ( not ( = ?auto_708740 ?auto_708753 ) ) ( not ( = ?auto_708741 ?auto_708742 ) ) ( not ( = ?auto_708741 ?auto_708743 ) ) ( not ( = ?auto_708741 ?auto_708744 ) ) ( not ( = ?auto_708741 ?auto_708745 ) ) ( not ( = ?auto_708741 ?auto_708746 ) ) ( not ( = ?auto_708741 ?auto_708747 ) ) ( not ( = ?auto_708741 ?auto_708748 ) ) ( not ( = ?auto_708741 ?auto_708749 ) ) ( not ( = ?auto_708741 ?auto_708750 ) ) ( not ( = ?auto_708741 ?auto_708751 ) ) ( not ( = ?auto_708741 ?auto_708752 ) ) ( not ( = ?auto_708741 ?auto_708753 ) ) ( not ( = ?auto_708742 ?auto_708743 ) ) ( not ( = ?auto_708742 ?auto_708744 ) ) ( not ( = ?auto_708742 ?auto_708745 ) ) ( not ( = ?auto_708742 ?auto_708746 ) ) ( not ( = ?auto_708742 ?auto_708747 ) ) ( not ( = ?auto_708742 ?auto_708748 ) ) ( not ( = ?auto_708742 ?auto_708749 ) ) ( not ( = ?auto_708742 ?auto_708750 ) ) ( not ( = ?auto_708742 ?auto_708751 ) ) ( not ( = ?auto_708742 ?auto_708752 ) ) ( not ( = ?auto_708742 ?auto_708753 ) ) ( not ( = ?auto_708743 ?auto_708744 ) ) ( not ( = ?auto_708743 ?auto_708745 ) ) ( not ( = ?auto_708743 ?auto_708746 ) ) ( not ( = ?auto_708743 ?auto_708747 ) ) ( not ( = ?auto_708743 ?auto_708748 ) ) ( not ( = ?auto_708743 ?auto_708749 ) ) ( not ( = ?auto_708743 ?auto_708750 ) ) ( not ( = ?auto_708743 ?auto_708751 ) ) ( not ( = ?auto_708743 ?auto_708752 ) ) ( not ( = ?auto_708743 ?auto_708753 ) ) ( not ( = ?auto_708744 ?auto_708745 ) ) ( not ( = ?auto_708744 ?auto_708746 ) ) ( not ( = ?auto_708744 ?auto_708747 ) ) ( not ( = ?auto_708744 ?auto_708748 ) ) ( not ( = ?auto_708744 ?auto_708749 ) ) ( not ( = ?auto_708744 ?auto_708750 ) ) ( not ( = ?auto_708744 ?auto_708751 ) ) ( not ( = ?auto_708744 ?auto_708752 ) ) ( not ( = ?auto_708744 ?auto_708753 ) ) ( not ( = ?auto_708745 ?auto_708746 ) ) ( not ( = ?auto_708745 ?auto_708747 ) ) ( not ( = ?auto_708745 ?auto_708748 ) ) ( not ( = ?auto_708745 ?auto_708749 ) ) ( not ( = ?auto_708745 ?auto_708750 ) ) ( not ( = ?auto_708745 ?auto_708751 ) ) ( not ( = ?auto_708745 ?auto_708752 ) ) ( not ( = ?auto_708745 ?auto_708753 ) ) ( not ( = ?auto_708746 ?auto_708747 ) ) ( not ( = ?auto_708746 ?auto_708748 ) ) ( not ( = ?auto_708746 ?auto_708749 ) ) ( not ( = ?auto_708746 ?auto_708750 ) ) ( not ( = ?auto_708746 ?auto_708751 ) ) ( not ( = ?auto_708746 ?auto_708752 ) ) ( not ( = ?auto_708746 ?auto_708753 ) ) ( not ( = ?auto_708747 ?auto_708748 ) ) ( not ( = ?auto_708747 ?auto_708749 ) ) ( not ( = ?auto_708747 ?auto_708750 ) ) ( not ( = ?auto_708747 ?auto_708751 ) ) ( not ( = ?auto_708747 ?auto_708752 ) ) ( not ( = ?auto_708747 ?auto_708753 ) ) ( not ( = ?auto_708748 ?auto_708749 ) ) ( not ( = ?auto_708748 ?auto_708750 ) ) ( not ( = ?auto_708748 ?auto_708751 ) ) ( not ( = ?auto_708748 ?auto_708752 ) ) ( not ( = ?auto_708748 ?auto_708753 ) ) ( not ( = ?auto_708749 ?auto_708750 ) ) ( not ( = ?auto_708749 ?auto_708751 ) ) ( not ( = ?auto_708749 ?auto_708752 ) ) ( not ( = ?auto_708749 ?auto_708753 ) ) ( not ( = ?auto_708750 ?auto_708751 ) ) ( not ( = ?auto_708750 ?auto_708752 ) ) ( not ( = ?auto_708750 ?auto_708753 ) ) ( not ( = ?auto_708751 ?auto_708752 ) ) ( not ( = ?auto_708751 ?auto_708753 ) ) ( not ( = ?auto_708752 ?auto_708753 ) ) ( CLEAR ?auto_708751 ) ( ON ?auto_708752 ?auto_708753 ) ( CLEAR ?auto_708752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_708737 ?auto_708738 ?auto_708739 ?auto_708740 ?auto_708741 ?auto_708742 ?auto_708743 ?auto_708744 ?auto_708745 ?auto_708746 ?auto_708747 ?auto_708748 ?auto_708749 ?auto_708750 ?auto_708751 ?auto_708752 )
      ( MAKE-17PILE ?auto_708737 ?auto_708738 ?auto_708739 ?auto_708740 ?auto_708741 ?auto_708742 ?auto_708743 ?auto_708744 ?auto_708745 ?auto_708746 ?auto_708747 ?auto_708748 ?auto_708749 ?auto_708750 ?auto_708751 ?auto_708752 ?auto_708753 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708771 - BLOCK
      ?auto_708772 - BLOCK
      ?auto_708773 - BLOCK
      ?auto_708774 - BLOCK
      ?auto_708775 - BLOCK
      ?auto_708776 - BLOCK
      ?auto_708777 - BLOCK
      ?auto_708778 - BLOCK
      ?auto_708779 - BLOCK
      ?auto_708780 - BLOCK
      ?auto_708781 - BLOCK
      ?auto_708782 - BLOCK
      ?auto_708783 - BLOCK
      ?auto_708784 - BLOCK
      ?auto_708785 - BLOCK
      ?auto_708786 - BLOCK
      ?auto_708787 - BLOCK
    )
    :vars
    (
      ?auto_708788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708787 ?auto_708788 ) ( ON-TABLE ?auto_708771 ) ( ON ?auto_708772 ?auto_708771 ) ( ON ?auto_708773 ?auto_708772 ) ( ON ?auto_708774 ?auto_708773 ) ( ON ?auto_708775 ?auto_708774 ) ( ON ?auto_708776 ?auto_708775 ) ( ON ?auto_708777 ?auto_708776 ) ( ON ?auto_708778 ?auto_708777 ) ( ON ?auto_708779 ?auto_708778 ) ( ON ?auto_708780 ?auto_708779 ) ( ON ?auto_708781 ?auto_708780 ) ( ON ?auto_708782 ?auto_708781 ) ( ON ?auto_708783 ?auto_708782 ) ( ON ?auto_708784 ?auto_708783 ) ( not ( = ?auto_708771 ?auto_708772 ) ) ( not ( = ?auto_708771 ?auto_708773 ) ) ( not ( = ?auto_708771 ?auto_708774 ) ) ( not ( = ?auto_708771 ?auto_708775 ) ) ( not ( = ?auto_708771 ?auto_708776 ) ) ( not ( = ?auto_708771 ?auto_708777 ) ) ( not ( = ?auto_708771 ?auto_708778 ) ) ( not ( = ?auto_708771 ?auto_708779 ) ) ( not ( = ?auto_708771 ?auto_708780 ) ) ( not ( = ?auto_708771 ?auto_708781 ) ) ( not ( = ?auto_708771 ?auto_708782 ) ) ( not ( = ?auto_708771 ?auto_708783 ) ) ( not ( = ?auto_708771 ?auto_708784 ) ) ( not ( = ?auto_708771 ?auto_708785 ) ) ( not ( = ?auto_708771 ?auto_708786 ) ) ( not ( = ?auto_708771 ?auto_708787 ) ) ( not ( = ?auto_708771 ?auto_708788 ) ) ( not ( = ?auto_708772 ?auto_708773 ) ) ( not ( = ?auto_708772 ?auto_708774 ) ) ( not ( = ?auto_708772 ?auto_708775 ) ) ( not ( = ?auto_708772 ?auto_708776 ) ) ( not ( = ?auto_708772 ?auto_708777 ) ) ( not ( = ?auto_708772 ?auto_708778 ) ) ( not ( = ?auto_708772 ?auto_708779 ) ) ( not ( = ?auto_708772 ?auto_708780 ) ) ( not ( = ?auto_708772 ?auto_708781 ) ) ( not ( = ?auto_708772 ?auto_708782 ) ) ( not ( = ?auto_708772 ?auto_708783 ) ) ( not ( = ?auto_708772 ?auto_708784 ) ) ( not ( = ?auto_708772 ?auto_708785 ) ) ( not ( = ?auto_708772 ?auto_708786 ) ) ( not ( = ?auto_708772 ?auto_708787 ) ) ( not ( = ?auto_708772 ?auto_708788 ) ) ( not ( = ?auto_708773 ?auto_708774 ) ) ( not ( = ?auto_708773 ?auto_708775 ) ) ( not ( = ?auto_708773 ?auto_708776 ) ) ( not ( = ?auto_708773 ?auto_708777 ) ) ( not ( = ?auto_708773 ?auto_708778 ) ) ( not ( = ?auto_708773 ?auto_708779 ) ) ( not ( = ?auto_708773 ?auto_708780 ) ) ( not ( = ?auto_708773 ?auto_708781 ) ) ( not ( = ?auto_708773 ?auto_708782 ) ) ( not ( = ?auto_708773 ?auto_708783 ) ) ( not ( = ?auto_708773 ?auto_708784 ) ) ( not ( = ?auto_708773 ?auto_708785 ) ) ( not ( = ?auto_708773 ?auto_708786 ) ) ( not ( = ?auto_708773 ?auto_708787 ) ) ( not ( = ?auto_708773 ?auto_708788 ) ) ( not ( = ?auto_708774 ?auto_708775 ) ) ( not ( = ?auto_708774 ?auto_708776 ) ) ( not ( = ?auto_708774 ?auto_708777 ) ) ( not ( = ?auto_708774 ?auto_708778 ) ) ( not ( = ?auto_708774 ?auto_708779 ) ) ( not ( = ?auto_708774 ?auto_708780 ) ) ( not ( = ?auto_708774 ?auto_708781 ) ) ( not ( = ?auto_708774 ?auto_708782 ) ) ( not ( = ?auto_708774 ?auto_708783 ) ) ( not ( = ?auto_708774 ?auto_708784 ) ) ( not ( = ?auto_708774 ?auto_708785 ) ) ( not ( = ?auto_708774 ?auto_708786 ) ) ( not ( = ?auto_708774 ?auto_708787 ) ) ( not ( = ?auto_708774 ?auto_708788 ) ) ( not ( = ?auto_708775 ?auto_708776 ) ) ( not ( = ?auto_708775 ?auto_708777 ) ) ( not ( = ?auto_708775 ?auto_708778 ) ) ( not ( = ?auto_708775 ?auto_708779 ) ) ( not ( = ?auto_708775 ?auto_708780 ) ) ( not ( = ?auto_708775 ?auto_708781 ) ) ( not ( = ?auto_708775 ?auto_708782 ) ) ( not ( = ?auto_708775 ?auto_708783 ) ) ( not ( = ?auto_708775 ?auto_708784 ) ) ( not ( = ?auto_708775 ?auto_708785 ) ) ( not ( = ?auto_708775 ?auto_708786 ) ) ( not ( = ?auto_708775 ?auto_708787 ) ) ( not ( = ?auto_708775 ?auto_708788 ) ) ( not ( = ?auto_708776 ?auto_708777 ) ) ( not ( = ?auto_708776 ?auto_708778 ) ) ( not ( = ?auto_708776 ?auto_708779 ) ) ( not ( = ?auto_708776 ?auto_708780 ) ) ( not ( = ?auto_708776 ?auto_708781 ) ) ( not ( = ?auto_708776 ?auto_708782 ) ) ( not ( = ?auto_708776 ?auto_708783 ) ) ( not ( = ?auto_708776 ?auto_708784 ) ) ( not ( = ?auto_708776 ?auto_708785 ) ) ( not ( = ?auto_708776 ?auto_708786 ) ) ( not ( = ?auto_708776 ?auto_708787 ) ) ( not ( = ?auto_708776 ?auto_708788 ) ) ( not ( = ?auto_708777 ?auto_708778 ) ) ( not ( = ?auto_708777 ?auto_708779 ) ) ( not ( = ?auto_708777 ?auto_708780 ) ) ( not ( = ?auto_708777 ?auto_708781 ) ) ( not ( = ?auto_708777 ?auto_708782 ) ) ( not ( = ?auto_708777 ?auto_708783 ) ) ( not ( = ?auto_708777 ?auto_708784 ) ) ( not ( = ?auto_708777 ?auto_708785 ) ) ( not ( = ?auto_708777 ?auto_708786 ) ) ( not ( = ?auto_708777 ?auto_708787 ) ) ( not ( = ?auto_708777 ?auto_708788 ) ) ( not ( = ?auto_708778 ?auto_708779 ) ) ( not ( = ?auto_708778 ?auto_708780 ) ) ( not ( = ?auto_708778 ?auto_708781 ) ) ( not ( = ?auto_708778 ?auto_708782 ) ) ( not ( = ?auto_708778 ?auto_708783 ) ) ( not ( = ?auto_708778 ?auto_708784 ) ) ( not ( = ?auto_708778 ?auto_708785 ) ) ( not ( = ?auto_708778 ?auto_708786 ) ) ( not ( = ?auto_708778 ?auto_708787 ) ) ( not ( = ?auto_708778 ?auto_708788 ) ) ( not ( = ?auto_708779 ?auto_708780 ) ) ( not ( = ?auto_708779 ?auto_708781 ) ) ( not ( = ?auto_708779 ?auto_708782 ) ) ( not ( = ?auto_708779 ?auto_708783 ) ) ( not ( = ?auto_708779 ?auto_708784 ) ) ( not ( = ?auto_708779 ?auto_708785 ) ) ( not ( = ?auto_708779 ?auto_708786 ) ) ( not ( = ?auto_708779 ?auto_708787 ) ) ( not ( = ?auto_708779 ?auto_708788 ) ) ( not ( = ?auto_708780 ?auto_708781 ) ) ( not ( = ?auto_708780 ?auto_708782 ) ) ( not ( = ?auto_708780 ?auto_708783 ) ) ( not ( = ?auto_708780 ?auto_708784 ) ) ( not ( = ?auto_708780 ?auto_708785 ) ) ( not ( = ?auto_708780 ?auto_708786 ) ) ( not ( = ?auto_708780 ?auto_708787 ) ) ( not ( = ?auto_708780 ?auto_708788 ) ) ( not ( = ?auto_708781 ?auto_708782 ) ) ( not ( = ?auto_708781 ?auto_708783 ) ) ( not ( = ?auto_708781 ?auto_708784 ) ) ( not ( = ?auto_708781 ?auto_708785 ) ) ( not ( = ?auto_708781 ?auto_708786 ) ) ( not ( = ?auto_708781 ?auto_708787 ) ) ( not ( = ?auto_708781 ?auto_708788 ) ) ( not ( = ?auto_708782 ?auto_708783 ) ) ( not ( = ?auto_708782 ?auto_708784 ) ) ( not ( = ?auto_708782 ?auto_708785 ) ) ( not ( = ?auto_708782 ?auto_708786 ) ) ( not ( = ?auto_708782 ?auto_708787 ) ) ( not ( = ?auto_708782 ?auto_708788 ) ) ( not ( = ?auto_708783 ?auto_708784 ) ) ( not ( = ?auto_708783 ?auto_708785 ) ) ( not ( = ?auto_708783 ?auto_708786 ) ) ( not ( = ?auto_708783 ?auto_708787 ) ) ( not ( = ?auto_708783 ?auto_708788 ) ) ( not ( = ?auto_708784 ?auto_708785 ) ) ( not ( = ?auto_708784 ?auto_708786 ) ) ( not ( = ?auto_708784 ?auto_708787 ) ) ( not ( = ?auto_708784 ?auto_708788 ) ) ( not ( = ?auto_708785 ?auto_708786 ) ) ( not ( = ?auto_708785 ?auto_708787 ) ) ( not ( = ?auto_708785 ?auto_708788 ) ) ( not ( = ?auto_708786 ?auto_708787 ) ) ( not ( = ?auto_708786 ?auto_708788 ) ) ( not ( = ?auto_708787 ?auto_708788 ) ) ( ON ?auto_708786 ?auto_708787 ) ( CLEAR ?auto_708784 ) ( ON ?auto_708785 ?auto_708786 ) ( CLEAR ?auto_708785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_708771 ?auto_708772 ?auto_708773 ?auto_708774 ?auto_708775 ?auto_708776 ?auto_708777 ?auto_708778 ?auto_708779 ?auto_708780 ?auto_708781 ?auto_708782 ?auto_708783 ?auto_708784 ?auto_708785 )
      ( MAKE-17PILE ?auto_708771 ?auto_708772 ?auto_708773 ?auto_708774 ?auto_708775 ?auto_708776 ?auto_708777 ?auto_708778 ?auto_708779 ?auto_708780 ?auto_708781 ?auto_708782 ?auto_708783 ?auto_708784 ?auto_708785 ?auto_708786 ?auto_708787 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708806 - BLOCK
      ?auto_708807 - BLOCK
      ?auto_708808 - BLOCK
      ?auto_708809 - BLOCK
      ?auto_708810 - BLOCK
      ?auto_708811 - BLOCK
      ?auto_708812 - BLOCK
      ?auto_708813 - BLOCK
      ?auto_708814 - BLOCK
      ?auto_708815 - BLOCK
      ?auto_708816 - BLOCK
      ?auto_708817 - BLOCK
      ?auto_708818 - BLOCK
      ?auto_708819 - BLOCK
      ?auto_708820 - BLOCK
      ?auto_708821 - BLOCK
      ?auto_708822 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_708822 ) ( ON-TABLE ?auto_708806 ) ( ON ?auto_708807 ?auto_708806 ) ( ON ?auto_708808 ?auto_708807 ) ( ON ?auto_708809 ?auto_708808 ) ( ON ?auto_708810 ?auto_708809 ) ( ON ?auto_708811 ?auto_708810 ) ( ON ?auto_708812 ?auto_708811 ) ( ON ?auto_708813 ?auto_708812 ) ( ON ?auto_708814 ?auto_708813 ) ( ON ?auto_708815 ?auto_708814 ) ( ON ?auto_708816 ?auto_708815 ) ( ON ?auto_708817 ?auto_708816 ) ( ON ?auto_708818 ?auto_708817 ) ( ON ?auto_708819 ?auto_708818 ) ( not ( = ?auto_708806 ?auto_708807 ) ) ( not ( = ?auto_708806 ?auto_708808 ) ) ( not ( = ?auto_708806 ?auto_708809 ) ) ( not ( = ?auto_708806 ?auto_708810 ) ) ( not ( = ?auto_708806 ?auto_708811 ) ) ( not ( = ?auto_708806 ?auto_708812 ) ) ( not ( = ?auto_708806 ?auto_708813 ) ) ( not ( = ?auto_708806 ?auto_708814 ) ) ( not ( = ?auto_708806 ?auto_708815 ) ) ( not ( = ?auto_708806 ?auto_708816 ) ) ( not ( = ?auto_708806 ?auto_708817 ) ) ( not ( = ?auto_708806 ?auto_708818 ) ) ( not ( = ?auto_708806 ?auto_708819 ) ) ( not ( = ?auto_708806 ?auto_708820 ) ) ( not ( = ?auto_708806 ?auto_708821 ) ) ( not ( = ?auto_708806 ?auto_708822 ) ) ( not ( = ?auto_708807 ?auto_708808 ) ) ( not ( = ?auto_708807 ?auto_708809 ) ) ( not ( = ?auto_708807 ?auto_708810 ) ) ( not ( = ?auto_708807 ?auto_708811 ) ) ( not ( = ?auto_708807 ?auto_708812 ) ) ( not ( = ?auto_708807 ?auto_708813 ) ) ( not ( = ?auto_708807 ?auto_708814 ) ) ( not ( = ?auto_708807 ?auto_708815 ) ) ( not ( = ?auto_708807 ?auto_708816 ) ) ( not ( = ?auto_708807 ?auto_708817 ) ) ( not ( = ?auto_708807 ?auto_708818 ) ) ( not ( = ?auto_708807 ?auto_708819 ) ) ( not ( = ?auto_708807 ?auto_708820 ) ) ( not ( = ?auto_708807 ?auto_708821 ) ) ( not ( = ?auto_708807 ?auto_708822 ) ) ( not ( = ?auto_708808 ?auto_708809 ) ) ( not ( = ?auto_708808 ?auto_708810 ) ) ( not ( = ?auto_708808 ?auto_708811 ) ) ( not ( = ?auto_708808 ?auto_708812 ) ) ( not ( = ?auto_708808 ?auto_708813 ) ) ( not ( = ?auto_708808 ?auto_708814 ) ) ( not ( = ?auto_708808 ?auto_708815 ) ) ( not ( = ?auto_708808 ?auto_708816 ) ) ( not ( = ?auto_708808 ?auto_708817 ) ) ( not ( = ?auto_708808 ?auto_708818 ) ) ( not ( = ?auto_708808 ?auto_708819 ) ) ( not ( = ?auto_708808 ?auto_708820 ) ) ( not ( = ?auto_708808 ?auto_708821 ) ) ( not ( = ?auto_708808 ?auto_708822 ) ) ( not ( = ?auto_708809 ?auto_708810 ) ) ( not ( = ?auto_708809 ?auto_708811 ) ) ( not ( = ?auto_708809 ?auto_708812 ) ) ( not ( = ?auto_708809 ?auto_708813 ) ) ( not ( = ?auto_708809 ?auto_708814 ) ) ( not ( = ?auto_708809 ?auto_708815 ) ) ( not ( = ?auto_708809 ?auto_708816 ) ) ( not ( = ?auto_708809 ?auto_708817 ) ) ( not ( = ?auto_708809 ?auto_708818 ) ) ( not ( = ?auto_708809 ?auto_708819 ) ) ( not ( = ?auto_708809 ?auto_708820 ) ) ( not ( = ?auto_708809 ?auto_708821 ) ) ( not ( = ?auto_708809 ?auto_708822 ) ) ( not ( = ?auto_708810 ?auto_708811 ) ) ( not ( = ?auto_708810 ?auto_708812 ) ) ( not ( = ?auto_708810 ?auto_708813 ) ) ( not ( = ?auto_708810 ?auto_708814 ) ) ( not ( = ?auto_708810 ?auto_708815 ) ) ( not ( = ?auto_708810 ?auto_708816 ) ) ( not ( = ?auto_708810 ?auto_708817 ) ) ( not ( = ?auto_708810 ?auto_708818 ) ) ( not ( = ?auto_708810 ?auto_708819 ) ) ( not ( = ?auto_708810 ?auto_708820 ) ) ( not ( = ?auto_708810 ?auto_708821 ) ) ( not ( = ?auto_708810 ?auto_708822 ) ) ( not ( = ?auto_708811 ?auto_708812 ) ) ( not ( = ?auto_708811 ?auto_708813 ) ) ( not ( = ?auto_708811 ?auto_708814 ) ) ( not ( = ?auto_708811 ?auto_708815 ) ) ( not ( = ?auto_708811 ?auto_708816 ) ) ( not ( = ?auto_708811 ?auto_708817 ) ) ( not ( = ?auto_708811 ?auto_708818 ) ) ( not ( = ?auto_708811 ?auto_708819 ) ) ( not ( = ?auto_708811 ?auto_708820 ) ) ( not ( = ?auto_708811 ?auto_708821 ) ) ( not ( = ?auto_708811 ?auto_708822 ) ) ( not ( = ?auto_708812 ?auto_708813 ) ) ( not ( = ?auto_708812 ?auto_708814 ) ) ( not ( = ?auto_708812 ?auto_708815 ) ) ( not ( = ?auto_708812 ?auto_708816 ) ) ( not ( = ?auto_708812 ?auto_708817 ) ) ( not ( = ?auto_708812 ?auto_708818 ) ) ( not ( = ?auto_708812 ?auto_708819 ) ) ( not ( = ?auto_708812 ?auto_708820 ) ) ( not ( = ?auto_708812 ?auto_708821 ) ) ( not ( = ?auto_708812 ?auto_708822 ) ) ( not ( = ?auto_708813 ?auto_708814 ) ) ( not ( = ?auto_708813 ?auto_708815 ) ) ( not ( = ?auto_708813 ?auto_708816 ) ) ( not ( = ?auto_708813 ?auto_708817 ) ) ( not ( = ?auto_708813 ?auto_708818 ) ) ( not ( = ?auto_708813 ?auto_708819 ) ) ( not ( = ?auto_708813 ?auto_708820 ) ) ( not ( = ?auto_708813 ?auto_708821 ) ) ( not ( = ?auto_708813 ?auto_708822 ) ) ( not ( = ?auto_708814 ?auto_708815 ) ) ( not ( = ?auto_708814 ?auto_708816 ) ) ( not ( = ?auto_708814 ?auto_708817 ) ) ( not ( = ?auto_708814 ?auto_708818 ) ) ( not ( = ?auto_708814 ?auto_708819 ) ) ( not ( = ?auto_708814 ?auto_708820 ) ) ( not ( = ?auto_708814 ?auto_708821 ) ) ( not ( = ?auto_708814 ?auto_708822 ) ) ( not ( = ?auto_708815 ?auto_708816 ) ) ( not ( = ?auto_708815 ?auto_708817 ) ) ( not ( = ?auto_708815 ?auto_708818 ) ) ( not ( = ?auto_708815 ?auto_708819 ) ) ( not ( = ?auto_708815 ?auto_708820 ) ) ( not ( = ?auto_708815 ?auto_708821 ) ) ( not ( = ?auto_708815 ?auto_708822 ) ) ( not ( = ?auto_708816 ?auto_708817 ) ) ( not ( = ?auto_708816 ?auto_708818 ) ) ( not ( = ?auto_708816 ?auto_708819 ) ) ( not ( = ?auto_708816 ?auto_708820 ) ) ( not ( = ?auto_708816 ?auto_708821 ) ) ( not ( = ?auto_708816 ?auto_708822 ) ) ( not ( = ?auto_708817 ?auto_708818 ) ) ( not ( = ?auto_708817 ?auto_708819 ) ) ( not ( = ?auto_708817 ?auto_708820 ) ) ( not ( = ?auto_708817 ?auto_708821 ) ) ( not ( = ?auto_708817 ?auto_708822 ) ) ( not ( = ?auto_708818 ?auto_708819 ) ) ( not ( = ?auto_708818 ?auto_708820 ) ) ( not ( = ?auto_708818 ?auto_708821 ) ) ( not ( = ?auto_708818 ?auto_708822 ) ) ( not ( = ?auto_708819 ?auto_708820 ) ) ( not ( = ?auto_708819 ?auto_708821 ) ) ( not ( = ?auto_708819 ?auto_708822 ) ) ( not ( = ?auto_708820 ?auto_708821 ) ) ( not ( = ?auto_708820 ?auto_708822 ) ) ( not ( = ?auto_708821 ?auto_708822 ) ) ( ON ?auto_708821 ?auto_708822 ) ( CLEAR ?auto_708819 ) ( ON ?auto_708820 ?auto_708821 ) ( CLEAR ?auto_708820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_708806 ?auto_708807 ?auto_708808 ?auto_708809 ?auto_708810 ?auto_708811 ?auto_708812 ?auto_708813 ?auto_708814 ?auto_708815 ?auto_708816 ?auto_708817 ?auto_708818 ?auto_708819 ?auto_708820 )
      ( MAKE-17PILE ?auto_708806 ?auto_708807 ?auto_708808 ?auto_708809 ?auto_708810 ?auto_708811 ?auto_708812 ?auto_708813 ?auto_708814 ?auto_708815 ?auto_708816 ?auto_708817 ?auto_708818 ?auto_708819 ?auto_708820 ?auto_708821 ?auto_708822 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708840 - BLOCK
      ?auto_708841 - BLOCK
      ?auto_708842 - BLOCK
      ?auto_708843 - BLOCK
      ?auto_708844 - BLOCK
      ?auto_708845 - BLOCK
      ?auto_708846 - BLOCK
      ?auto_708847 - BLOCK
      ?auto_708848 - BLOCK
      ?auto_708849 - BLOCK
      ?auto_708850 - BLOCK
      ?auto_708851 - BLOCK
      ?auto_708852 - BLOCK
      ?auto_708853 - BLOCK
      ?auto_708854 - BLOCK
      ?auto_708855 - BLOCK
      ?auto_708856 - BLOCK
    )
    :vars
    (
      ?auto_708857 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708856 ?auto_708857 ) ( ON-TABLE ?auto_708840 ) ( ON ?auto_708841 ?auto_708840 ) ( ON ?auto_708842 ?auto_708841 ) ( ON ?auto_708843 ?auto_708842 ) ( ON ?auto_708844 ?auto_708843 ) ( ON ?auto_708845 ?auto_708844 ) ( ON ?auto_708846 ?auto_708845 ) ( ON ?auto_708847 ?auto_708846 ) ( ON ?auto_708848 ?auto_708847 ) ( ON ?auto_708849 ?auto_708848 ) ( ON ?auto_708850 ?auto_708849 ) ( ON ?auto_708851 ?auto_708850 ) ( ON ?auto_708852 ?auto_708851 ) ( not ( = ?auto_708840 ?auto_708841 ) ) ( not ( = ?auto_708840 ?auto_708842 ) ) ( not ( = ?auto_708840 ?auto_708843 ) ) ( not ( = ?auto_708840 ?auto_708844 ) ) ( not ( = ?auto_708840 ?auto_708845 ) ) ( not ( = ?auto_708840 ?auto_708846 ) ) ( not ( = ?auto_708840 ?auto_708847 ) ) ( not ( = ?auto_708840 ?auto_708848 ) ) ( not ( = ?auto_708840 ?auto_708849 ) ) ( not ( = ?auto_708840 ?auto_708850 ) ) ( not ( = ?auto_708840 ?auto_708851 ) ) ( not ( = ?auto_708840 ?auto_708852 ) ) ( not ( = ?auto_708840 ?auto_708853 ) ) ( not ( = ?auto_708840 ?auto_708854 ) ) ( not ( = ?auto_708840 ?auto_708855 ) ) ( not ( = ?auto_708840 ?auto_708856 ) ) ( not ( = ?auto_708840 ?auto_708857 ) ) ( not ( = ?auto_708841 ?auto_708842 ) ) ( not ( = ?auto_708841 ?auto_708843 ) ) ( not ( = ?auto_708841 ?auto_708844 ) ) ( not ( = ?auto_708841 ?auto_708845 ) ) ( not ( = ?auto_708841 ?auto_708846 ) ) ( not ( = ?auto_708841 ?auto_708847 ) ) ( not ( = ?auto_708841 ?auto_708848 ) ) ( not ( = ?auto_708841 ?auto_708849 ) ) ( not ( = ?auto_708841 ?auto_708850 ) ) ( not ( = ?auto_708841 ?auto_708851 ) ) ( not ( = ?auto_708841 ?auto_708852 ) ) ( not ( = ?auto_708841 ?auto_708853 ) ) ( not ( = ?auto_708841 ?auto_708854 ) ) ( not ( = ?auto_708841 ?auto_708855 ) ) ( not ( = ?auto_708841 ?auto_708856 ) ) ( not ( = ?auto_708841 ?auto_708857 ) ) ( not ( = ?auto_708842 ?auto_708843 ) ) ( not ( = ?auto_708842 ?auto_708844 ) ) ( not ( = ?auto_708842 ?auto_708845 ) ) ( not ( = ?auto_708842 ?auto_708846 ) ) ( not ( = ?auto_708842 ?auto_708847 ) ) ( not ( = ?auto_708842 ?auto_708848 ) ) ( not ( = ?auto_708842 ?auto_708849 ) ) ( not ( = ?auto_708842 ?auto_708850 ) ) ( not ( = ?auto_708842 ?auto_708851 ) ) ( not ( = ?auto_708842 ?auto_708852 ) ) ( not ( = ?auto_708842 ?auto_708853 ) ) ( not ( = ?auto_708842 ?auto_708854 ) ) ( not ( = ?auto_708842 ?auto_708855 ) ) ( not ( = ?auto_708842 ?auto_708856 ) ) ( not ( = ?auto_708842 ?auto_708857 ) ) ( not ( = ?auto_708843 ?auto_708844 ) ) ( not ( = ?auto_708843 ?auto_708845 ) ) ( not ( = ?auto_708843 ?auto_708846 ) ) ( not ( = ?auto_708843 ?auto_708847 ) ) ( not ( = ?auto_708843 ?auto_708848 ) ) ( not ( = ?auto_708843 ?auto_708849 ) ) ( not ( = ?auto_708843 ?auto_708850 ) ) ( not ( = ?auto_708843 ?auto_708851 ) ) ( not ( = ?auto_708843 ?auto_708852 ) ) ( not ( = ?auto_708843 ?auto_708853 ) ) ( not ( = ?auto_708843 ?auto_708854 ) ) ( not ( = ?auto_708843 ?auto_708855 ) ) ( not ( = ?auto_708843 ?auto_708856 ) ) ( not ( = ?auto_708843 ?auto_708857 ) ) ( not ( = ?auto_708844 ?auto_708845 ) ) ( not ( = ?auto_708844 ?auto_708846 ) ) ( not ( = ?auto_708844 ?auto_708847 ) ) ( not ( = ?auto_708844 ?auto_708848 ) ) ( not ( = ?auto_708844 ?auto_708849 ) ) ( not ( = ?auto_708844 ?auto_708850 ) ) ( not ( = ?auto_708844 ?auto_708851 ) ) ( not ( = ?auto_708844 ?auto_708852 ) ) ( not ( = ?auto_708844 ?auto_708853 ) ) ( not ( = ?auto_708844 ?auto_708854 ) ) ( not ( = ?auto_708844 ?auto_708855 ) ) ( not ( = ?auto_708844 ?auto_708856 ) ) ( not ( = ?auto_708844 ?auto_708857 ) ) ( not ( = ?auto_708845 ?auto_708846 ) ) ( not ( = ?auto_708845 ?auto_708847 ) ) ( not ( = ?auto_708845 ?auto_708848 ) ) ( not ( = ?auto_708845 ?auto_708849 ) ) ( not ( = ?auto_708845 ?auto_708850 ) ) ( not ( = ?auto_708845 ?auto_708851 ) ) ( not ( = ?auto_708845 ?auto_708852 ) ) ( not ( = ?auto_708845 ?auto_708853 ) ) ( not ( = ?auto_708845 ?auto_708854 ) ) ( not ( = ?auto_708845 ?auto_708855 ) ) ( not ( = ?auto_708845 ?auto_708856 ) ) ( not ( = ?auto_708845 ?auto_708857 ) ) ( not ( = ?auto_708846 ?auto_708847 ) ) ( not ( = ?auto_708846 ?auto_708848 ) ) ( not ( = ?auto_708846 ?auto_708849 ) ) ( not ( = ?auto_708846 ?auto_708850 ) ) ( not ( = ?auto_708846 ?auto_708851 ) ) ( not ( = ?auto_708846 ?auto_708852 ) ) ( not ( = ?auto_708846 ?auto_708853 ) ) ( not ( = ?auto_708846 ?auto_708854 ) ) ( not ( = ?auto_708846 ?auto_708855 ) ) ( not ( = ?auto_708846 ?auto_708856 ) ) ( not ( = ?auto_708846 ?auto_708857 ) ) ( not ( = ?auto_708847 ?auto_708848 ) ) ( not ( = ?auto_708847 ?auto_708849 ) ) ( not ( = ?auto_708847 ?auto_708850 ) ) ( not ( = ?auto_708847 ?auto_708851 ) ) ( not ( = ?auto_708847 ?auto_708852 ) ) ( not ( = ?auto_708847 ?auto_708853 ) ) ( not ( = ?auto_708847 ?auto_708854 ) ) ( not ( = ?auto_708847 ?auto_708855 ) ) ( not ( = ?auto_708847 ?auto_708856 ) ) ( not ( = ?auto_708847 ?auto_708857 ) ) ( not ( = ?auto_708848 ?auto_708849 ) ) ( not ( = ?auto_708848 ?auto_708850 ) ) ( not ( = ?auto_708848 ?auto_708851 ) ) ( not ( = ?auto_708848 ?auto_708852 ) ) ( not ( = ?auto_708848 ?auto_708853 ) ) ( not ( = ?auto_708848 ?auto_708854 ) ) ( not ( = ?auto_708848 ?auto_708855 ) ) ( not ( = ?auto_708848 ?auto_708856 ) ) ( not ( = ?auto_708848 ?auto_708857 ) ) ( not ( = ?auto_708849 ?auto_708850 ) ) ( not ( = ?auto_708849 ?auto_708851 ) ) ( not ( = ?auto_708849 ?auto_708852 ) ) ( not ( = ?auto_708849 ?auto_708853 ) ) ( not ( = ?auto_708849 ?auto_708854 ) ) ( not ( = ?auto_708849 ?auto_708855 ) ) ( not ( = ?auto_708849 ?auto_708856 ) ) ( not ( = ?auto_708849 ?auto_708857 ) ) ( not ( = ?auto_708850 ?auto_708851 ) ) ( not ( = ?auto_708850 ?auto_708852 ) ) ( not ( = ?auto_708850 ?auto_708853 ) ) ( not ( = ?auto_708850 ?auto_708854 ) ) ( not ( = ?auto_708850 ?auto_708855 ) ) ( not ( = ?auto_708850 ?auto_708856 ) ) ( not ( = ?auto_708850 ?auto_708857 ) ) ( not ( = ?auto_708851 ?auto_708852 ) ) ( not ( = ?auto_708851 ?auto_708853 ) ) ( not ( = ?auto_708851 ?auto_708854 ) ) ( not ( = ?auto_708851 ?auto_708855 ) ) ( not ( = ?auto_708851 ?auto_708856 ) ) ( not ( = ?auto_708851 ?auto_708857 ) ) ( not ( = ?auto_708852 ?auto_708853 ) ) ( not ( = ?auto_708852 ?auto_708854 ) ) ( not ( = ?auto_708852 ?auto_708855 ) ) ( not ( = ?auto_708852 ?auto_708856 ) ) ( not ( = ?auto_708852 ?auto_708857 ) ) ( not ( = ?auto_708853 ?auto_708854 ) ) ( not ( = ?auto_708853 ?auto_708855 ) ) ( not ( = ?auto_708853 ?auto_708856 ) ) ( not ( = ?auto_708853 ?auto_708857 ) ) ( not ( = ?auto_708854 ?auto_708855 ) ) ( not ( = ?auto_708854 ?auto_708856 ) ) ( not ( = ?auto_708854 ?auto_708857 ) ) ( not ( = ?auto_708855 ?auto_708856 ) ) ( not ( = ?auto_708855 ?auto_708857 ) ) ( not ( = ?auto_708856 ?auto_708857 ) ) ( ON ?auto_708855 ?auto_708856 ) ( ON ?auto_708854 ?auto_708855 ) ( CLEAR ?auto_708852 ) ( ON ?auto_708853 ?auto_708854 ) ( CLEAR ?auto_708853 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_708840 ?auto_708841 ?auto_708842 ?auto_708843 ?auto_708844 ?auto_708845 ?auto_708846 ?auto_708847 ?auto_708848 ?auto_708849 ?auto_708850 ?auto_708851 ?auto_708852 ?auto_708853 )
      ( MAKE-17PILE ?auto_708840 ?auto_708841 ?auto_708842 ?auto_708843 ?auto_708844 ?auto_708845 ?auto_708846 ?auto_708847 ?auto_708848 ?auto_708849 ?auto_708850 ?auto_708851 ?auto_708852 ?auto_708853 ?auto_708854 ?auto_708855 ?auto_708856 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708875 - BLOCK
      ?auto_708876 - BLOCK
      ?auto_708877 - BLOCK
      ?auto_708878 - BLOCK
      ?auto_708879 - BLOCK
      ?auto_708880 - BLOCK
      ?auto_708881 - BLOCK
      ?auto_708882 - BLOCK
      ?auto_708883 - BLOCK
      ?auto_708884 - BLOCK
      ?auto_708885 - BLOCK
      ?auto_708886 - BLOCK
      ?auto_708887 - BLOCK
      ?auto_708888 - BLOCK
      ?auto_708889 - BLOCK
      ?auto_708890 - BLOCK
      ?auto_708891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_708891 ) ( ON-TABLE ?auto_708875 ) ( ON ?auto_708876 ?auto_708875 ) ( ON ?auto_708877 ?auto_708876 ) ( ON ?auto_708878 ?auto_708877 ) ( ON ?auto_708879 ?auto_708878 ) ( ON ?auto_708880 ?auto_708879 ) ( ON ?auto_708881 ?auto_708880 ) ( ON ?auto_708882 ?auto_708881 ) ( ON ?auto_708883 ?auto_708882 ) ( ON ?auto_708884 ?auto_708883 ) ( ON ?auto_708885 ?auto_708884 ) ( ON ?auto_708886 ?auto_708885 ) ( ON ?auto_708887 ?auto_708886 ) ( not ( = ?auto_708875 ?auto_708876 ) ) ( not ( = ?auto_708875 ?auto_708877 ) ) ( not ( = ?auto_708875 ?auto_708878 ) ) ( not ( = ?auto_708875 ?auto_708879 ) ) ( not ( = ?auto_708875 ?auto_708880 ) ) ( not ( = ?auto_708875 ?auto_708881 ) ) ( not ( = ?auto_708875 ?auto_708882 ) ) ( not ( = ?auto_708875 ?auto_708883 ) ) ( not ( = ?auto_708875 ?auto_708884 ) ) ( not ( = ?auto_708875 ?auto_708885 ) ) ( not ( = ?auto_708875 ?auto_708886 ) ) ( not ( = ?auto_708875 ?auto_708887 ) ) ( not ( = ?auto_708875 ?auto_708888 ) ) ( not ( = ?auto_708875 ?auto_708889 ) ) ( not ( = ?auto_708875 ?auto_708890 ) ) ( not ( = ?auto_708875 ?auto_708891 ) ) ( not ( = ?auto_708876 ?auto_708877 ) ) ( not ( = ?auto_708876 ?auto_708878 ) ) ( not ( = ?auto_708876 ?auto_708879 ) ) ( not ( = ?auto_708876 ?auto_708880 ) ) ( not ( = ?auto_708876 ?auto_708881 ) ) ( not ( = ?auto_708876 ?auto_708882 ) ) ( not ( = ?auto_708876 ?auto_708883 ) ) ( not ( = ?auto_708876 ?auto_708884 ) ) ( not ( = ?auto_708876 ?auto_708885 ) ) ( not ( = ?auto_708876 ?auto_708886 ) ) ( not ( = ?auto_708876 ?auto_708887 ) ) ( not ( = ?auto_708876 ?auto_708888 ) ) ( not ( = ?auto_708876 ?auto_708889 ) ) ( not ( = ?auto_708876 ?auto_708890 ) ) ( not ( = ?auto_708876 ?auto_708891 ) ) ( not ( = ?auto_708877 ?auto_708878 ) ) ( not ( = ?auto_708877 ?auto_708879 ) ) ( not ( = ?auto_708877 ?auto_708880 ) ) ( not ( = ?auto_708877 ?auto_708881 ) ) ( not ( = ?auto_708877 ?auto_708882 ) ) ( not ( = ?auto_708877 ?auto_708883 ) ) ( not ( = ?auto_708877 ?auto_708884 ) ) ( not ( = ?auto_708877 ?auto_708885 ) ) ( not ( = ?auto_708877 ?auto_708886 ) ) ( not ( = ?auto_708877 ?auto_708887 ) ) ( not ( = ?auto_708877 ?auto_708888 ) ) ( not ( = ?auto_708877 ?auto_708889 ) ) ( not ( = ?auto_708877 ?auto_708890 ) ) ( not ( = ?auto_708877 ?auto_708891 ) ) ( not ( = ?auto_708878 ?auto_708879 ) ) ( not ( = ?auto_708878 ?auto_708880 ) ) ( not ( = ?auto_708878 ?auto_708881 ) ) ( not ( = ?auto_708878 ?auto_708882 ) ) ( not ( = ?auto_708878 ?auto_708883 ) ) ( not ( = ?auto_708878 ?auto_708884 ) ) ( not ( = ?auto_708878 ?auto_708885 ) ) ( not ( = ?auto_708878 ?auto_708886 ) ) ( not ( = ?auto_708878 ?auto_708887 ) ) ( not ( = ?auto_708878 ?auto_708888 ) ) ( not ( = ?auto_708878 ?auto_708889 ) ) ( not ( = ?auto_708878 ?auto_708890 ) ) ( not ( = ?auto_708878 ?auto_708891 ) ) ( not ( = ?auto_708879 ?auto_708880 ) ) ( not ( = ?auto_708879 ?auto_708881 ) ) ( not ( = ?auto_708879 ?auto_708882 ) ) ( not ( = ?auto_708879 ?auto_708883 ) ) ( not ( = ?auto_708879 ?auto_708884 ) ) ( not ( = ?auto_708879 ?auto_708885 ) ) ( not ( = ?auto_708879 ?auto_708886 ) ) ( not ( = ?auto_708879 ?auto_708887 ) ) ( not ( = ?auto_708879 ?auto_708888 ) ) ( not ( = ?auto_708879 ?auto_708889 ) ) ( not ( = ?auto_708879 ?auto_708890 ) ) ( not ( = ?auto_708879 ?auto_708891 ) ) ( not ( = ?auto_708880 ?auto_708881 ) ) ( not ( = ?auto_708880 ?auto_708882 ) ) ( not ( = ?auto_708880 ?auto_708883 ) ) ( not ( = ?auto_708880 ?auto_708884 ) ) ( not ( = ?auto_708880 ?auto_708885 ) ) ( not ( = ?auto_708880 ?auto_708886 ) ) ( not ( = ?auto_708880 ?auto_708887 ) ) ( not ( = ?auto_708880 ?auto_708888 ) ) ( not ( = ?auto_708880 ?auto_708889 ) ) ( not ( = ?auto_708880 ?auto_708890 ) ) ( not ( = ?auto_708880 ?auto_708891 ) ) ( not ( = ?auto_708881 ?auto_708882 ) ) ( not ( = ?auto_708881 ?auto_708883 ) ) ( not ( = ?auto_708881 ?auto_708884 ) ) ( not ( = ?auto_708881 ?auto_708885 ) ) ( not ( = ?auto_708881 ?auto_708886 ) ) ( not ( = ?auto_708881 ?auto_708887 ) ) ( not ( = ?auto_708881 ?auto_708888 ) ) ( not ( = ?auto_708881 ?auto_708889 ) ) ( not ( = ?auto_708881 ?auto_708890 ) ) ( not ( = ?auto_708881 ?auto_708891 ) ) ( not ( = ?auto_708882 ?auto_708883 ) ) ( not ( = ?auto_708882 ?auto_708884 ) ) ( not ( = ?auto_708882 ?auto_708885 ) ) ( not ( = ?auto_708882 ?auto_708886 ) ) ( not ( = ?auto_708882 ?auto_708887 ) ) ( not ( = ?auto_708882 ?auto_708888 ) ) ( not ( = ?auto_708882 ?auto_708889 ) ) ( not ( = ?auto_708882 ?auto_708890 ) ) ( not ( = ?auto_708882 ?auto_708891 ) ) ( not ( = ?auto_708883 ?auto_708884 ) ) ( not ( = ?auto_708883 ?auto_708885 ) ) ( not ( = ?auto_708883 ?auto_708886 ) ) ( not ( = ?auto_708883 ?auto_708887 ) ) ( not ( = ?auto_708883 ?auto_708888 ) ) ( not ( = ?auto_708883 ?auto_708889 ) ) ( not ( = ?auto_708883 ?auto_708890 ) ) ( not ( = ?auto_708883 ?auto_708891 ) ) ( not ( = ?auto_708884 ?auto_708885 ) ) ( not ( = ?auto_708884 ?auto_708886 ) ) ( not ( = ?auto_708884 ?auto_708887 ) ) ( not ( = ?auto_708884 ?auto_708888 ) ) ( not ( = ?auto_708884 ?auto_708889 ) ) ( not ( = ?auto_708884 ?auto_708890 ) ) ( not ( = ?auto_708884 ?auto_708891 ) ) ( not ( = ?auto_708885 ?auto_708886 ) ) ( not ( = ?auto_708885 ?auto_708887 ) ) ( not ( = ?auto_708885 ?auto_708888 ) ) ( not ( = ?auto_708885 ?auto_708889 ) ) ( not ( = ?auto_708885 ?auto_708890 ) ) ( not ( = ?auto_708885 ?auto_708891 ) ) ( not ( = ?auto_708886 ?auto_708887 ) ) ( not ( = ?auto_708886 ?auto_708888 ) ) ( not ( = ?auto_708886 ?auto_708889 ) ) ( not ( = ?auto_708886 ?auto_708890 ) ) ( not ( = ?auto_708886 ?auto_708891 ) ) ( not ( = ?auto_708887 ?auto_708888 ) ) ( not ( = ?auto_708887 ?auto_708889 ) ) ( not ( = ?auto_708887 ?auto_708890 ) ) ( not ( = ?auto_708887 ?auto_708891 ) ) ( not ( = ?auto_708888 ?auto_708889 ) ) ( not ( = ?auto_708888 ?auto_708890 ) ) ( not ( = ?auto_708888 ?auto_708891 ) ) ( not ( = ?auto_708889 ?auto_708890 ) ) ( not ( = ?auto_708889 ?auto_708891 ) ) ( not ( = ?auto_708890 ?auto_708891 ) ) ( ON ?auto_708890 ?auto_708891 ) ( ON ?auto_708889 ?auto_708890 ) ( CLEAR ?auto_708887 ) ( ON ?auto_708888 ?auto_708889 ) ( CLEAR ?auto_708888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_708875 ?auto_708876 ?auto_708877 ?auto_708878 ?auto_708879 ?auto_708880 ?auto_708881 ?auto_708882 ?auto_708883 ?auto_708884 ?auto_708885 ?auto_708886 ?auto_708887 ?auto_708888 )
      ( MAKE-17PILE ?auto_708875 ?auto_708876 ?auto_708877 ?auto_708878 ?auto_708879 ?auto_708880 ?auto_708881 ?auto_708882 ?auto_708883 ?auto_708884 ?auto_708885 ?auto_708886 ?auto_708887 ?auto_708888 ?auto_708889 ?auto_708890 ?auto_708891 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708909 - BLOCK
      ?auto_708910 - BLOCK
      ?auto_708911 - BLOCK
      ?auto_708912 - BLOCK
      ?auto_708913 - BLOCK
      ?auto_708914 - BLOCK
      ?auto_708915 - BLOCK
      ?auto_708916 - BLOCK
      ?auto_708917 - BLOCK
      ?auto_708918 - BLOCK
      ?auto_708919 - BLOCK
      ?auto_708920 - BLOCK
      ?auto_708921 - BLOCK
      ?auto_708922 - BLOCK
      ?auto_708923 - BLOCK
      ?auto_708924 - BLOCK
      ?auto_708925 - BLOCK
    )
    :vars
    (
      ?auto_708926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708925 ?auto_708926 ) ( ON-TABLE ?auto_708909 ) ( ON ?auto_708910 ?auto_708909 ) ( ON ?auto_708911 ?auto_708910 ) ( ON ?auto_708912 ?auto_708911 ) ( ON ?auto_708913 ?auto_708912 ) ( ON ?auto_708914 ?auto_708913 ) ( ON ?auto_708915 ?auto_708914 ) ( ON ?auto_708916 ?auto_708915 ) ( ON ?auto_708917 ?auto_708916 ) ( ON ?auto_708918 ?auto_708917 ) ( ON ?auto_708919 ?auto_708918 ) ( ON ?auto_708920 ?auto_708919 ) ( not ( = ?auto_708909 ?auto_708910 ) ) ( not ( = ?auto_708909 ?auto_708911 ) ) ( not ( = ?auto_708909 ?auto_708912 ) ) ( not ( = ?auto_708909 ?auto_708913 ) ) ( not ( = ?auto_708909 ?auto_708914 ) ) ( not ( = ?auto_708909 ?auto_708915 ) ) ( not ( = ?auto_708909 ?auto_708916 ) ) ( not ( = ?auto_708909 ?auto_708917 ) ) ( not ( = ?auto_708909 ?auto_708918 ) ) ( not ( = ?auto_708909 ?auto_708919 ) ) ( not ( = ?auto_708909 ?auto_708920 ) ) ( not ( = ?auto_708909 ?auto_708921 ) ) ( not ( = ?auto_708909 ?auto_708922 ) ) ( not ( = ?auto_708909 ?auto_708923 ) ) ( not ( = ?auto_708909 ?auto_708924 ) ) ( not ( = ?auto_708909 ?auto_708925 ) ) ( not ( = ?auto_708909 ?auto_708926 ) ) ( not ( = ?auto_708910 ?auto_708911 ) ) ( not ( = ?auto_708910 ?auto_708912 ) ) ( not ( = ?auto_708910 ?auto_708913 ) ) ( not ( = ?auto_708910 ?auto_708914 ) ) ( not ( = ?auto_708910 ?auto_708915 ) ) ( not ( = ?auto_708910 ?auto_708916 ) ) ( not ( = ?auto_708910 ?auto_708917 ) ) ( not ( = ?auto_708910 ?auto_708918 ) ) ( not ( = ?auto_708910 ?auto_708919 ) ) ( not ( = ?auto_708910 ?auto_708920 ) ) ( not ( = ?auto_708910 ?auto_708921 ) ) ( not ( = ?auto_708910 ?auto_708922 ) ) ( not ( = ?auto_708910 ?auto_708923 ) ) ( not ( = ?auto_708910 ?auto_708924 ) ) ( not ( = ?auto_708910 ?auto_708925 ) ) ( not ( = ?auto_708910 ?auto_708926 ) ) ( not ( = ?auto_708911 ?auto_708912 ) ) ( not ( = ?auto_708911 ?auto_708913 ) ) ( not ( = ?auto_708911 ?auto_708914 ) ) ( not ( = ?auto_708911 ?auto_708915 ) ) ( not ( = ?auto_708911 ?auto_708916 ) ) ( not ( = ?auto_708911 ?auto_708917 ) ) ( not ( = ?auto_708911 ?auto_708918 ) ) ( not ( = ?auto_708911 ?auto_708919 ) ) ( not ( = ?auto_708911 ?auto_708920 ) ) ( not ( = ?auto_708911 ?auto_708921 ) ) ( not ( = ?auto_708911 ?auto_708922 ) ) ( not ( = ?auto_708911 ?auto_708923 ) ) ( not ( = ?auto_708911 ?auto_708924 ) ) ( not ( = ?auto_708911 ?auto_708925 ) ) ( not ( = ?auto_708911 ?auto_708926 ) ) ( not ( = ?auto_708912 ?auto_708913 ) ) ( not ( = ?auto_708912 ?auto_708914 ) ) ( not ( = ?auto_708912 ?auto_708915 ) ) ( not ( = ?auto_708912 ?auto_708916 ) ) ( not ( = ?auto_708912 ?auto_708917 ) ) ( not ( = ?auto_708912 ?auto_708918 ) ) ( not ( = ?auto_708912 ?auto_708919 ) ) ( not ( = ?auto_708912 ?auto_708920 ) ) ( not ( = ?auto_708912 ?auto_708921 ) ) ( not ( = ?auto_708912 ?auto_708922 ) ) ( not ( = ?auto_708912 ?auto_708923 ) ) ( not ( = ?auto_708912 ?auto_708924 ) ) ( not ( = ?auto_708912 ?auto_708925 ) ) ( not ( = ?auto_708912 ?auto_708926 ) ) ( not ( = ?auto_708913 ?auto_708914 ) ) ( not ( = ?auto_708913 ?auto_708915 ) ) ( not ( = ?auto_708913 ?auto_708916 ) ) ( not ( = ?auto_708913 ?auto_708917 ) ) ( not ( = ?auto_708913 ?auto_708918 ) ) ( not ( = ?auto_708913 ?auto_708919 ) ) ( not ( = ?auto_708913 ?auto_708920 ) ) ( not ( = ?auto_708913 ?auto_708921 ) ) ( not ( = ?auto_708913 ?auto_708922 ) ) ( not ( = ?auto_708913 ?auto_708923 ) ) ( not ( = ?auto_708913 ?auto_708924 ) ) ( not ( = ?auto_708913 ?auto_708925 ) ) ( not ( = ?auto_708913 ?auto_708926 ) ) ( not ( = ?auto_708914 ?auto_708915 ) ) ( not ( = ?auto_708914 ?auto_708916 ) ) ( not ( = ?auto_708914 ?auto_708917 ) ) ( not ( = ?auto_708914 ?auto_708918 ) ) ( not ( = ?auto_708914 ?auto_708919 ) ) ( not ( = ?auto_708914 ?auto_708920 ) ) ( not ( = ?auto_708914 ?auto_708921 ) ) ( not ( = ?auto_708914 ?auto_708922 ) ) ( not ( = ?auto_708914 ?auto_708923 ) ) ( not ( = ?auto_708914 ?auto_708924 ) ) ( not ( = ?auto_708914 ?auto_708925 ) ) ( not ( = ?auto_708914 ?auto_708926 ) ) ( not ( = ?auto_708915 ?auto_708916 ) ) ( not ( = ?auto_708915 ?auto_708917 ) ) ( not ( = ?auto_708915 ?auto_708918 ) ) ( not ( = ?auto_708915 ?auto_708919 ) ) ( not ( = ?auto_708915 ?auto_708920 ) ) ( not ( = ?auto_708915 ?auto_708921 ) ) ( not ( = ?auto_708915 ?auto_708922 ) ) ( not ( = ?auto_708915 ?auto_708923 ) ) ( not ( = ?auto_708915 ?auto_708924 ) ) ( not ( = ?auto_708915 ?auto_708925 ) ) ( not ( = ?auto_708915 ?auto_708926 ) ) ( not ( = ?auto_708916 ?auto_708917 ) ) ( not ( = ?auto_708916 ?auto_708918 ) ) ( not ( = ?auto_708916 ?auto_708919 ) ) ( not ( = ?auto_708916 ?auto_708920 ) ) ( not ( = ?auto_708916 ?auto_708921 ) ) ( not ( = ?auto_708916 ?auto_708922 ) ) ( not ( = ?auto_708916 ?auto_708923 ) ) ( not ( = ?auto_708916 ?auto_708924 ) ) ( not ( = ?auto_708916 ?auto_708925 ) ) ( not ( = ?auto_708916 ?auto_708926 ) ) ( not ( = ?auto_708917 ?auto_708918 ) ) ( not ( = ?auto_708917 ?auto_708919 ) ) ( not ( = ?auto_708917 ?auto_708920 ) ) ( not ( = ?auto_708917 ?auto_708921 ) ) ( not ( = ?auto_708917 ?auto_708922 ) ) ( not ( = ?auto_708917 ?auto_708923 ) ) ( not ( = ?auto_708917 ?auto_708924 ) ) ( not ( = ?auto_708917 ?auto_708925 ) ) ( not ( = ?auto_708917 ?auto_708926 ) ) ( not ( = ?auto_708918 ?auto_708919 ) ) ( not ( = ?auto_708918 ?auto_708920 ) ) ( not ( = ?auto_708918 ?auto_708921 ) ) ( not ( = ?auto_708918 ?auto_708922 ) ) ( not ( = ?auto_708918 ?auto_708923 ) ) ( not ( = ?auto_708918 ?auto_708924 ) ) ( not ( = ?auto_708918 ?auto_708925 ) ) ( not ( = ?auto_708918 ?auto_708926 ) ) ( not ( = ?auto_708919 ?auto_708920 ) ) ( not ( = ?auto_708919 ?auto_708921 ) ) ( not ( = ?auto_708919 ?auto_708922 ) ) ( not ( = ?auto_708919 ?auto_708923 ) ) ( not ( = ?auto_708919 ?auto_708924 ) ) ( not ( = ?auto_708919 ?auto_708925 ) ) ( not ( = ?auto_708919 ?auto_708926 ) ) ( not ( = ?auto_708920 ?auto_708921 ) ) ( not ( = ?auto_708920 ?auto_708922 ) ) ( not ( = ?auto_708920 ?auto_708923 ) ) ( not ( = ?auto_708920 ?auto_708924 ) ) ( not ( = ?auto_708920 ?auto_708925 ) ) ( not ( = ?auto_708920 ?auto_708926 ) ) ( not ( = ?auto_708921 ?auto_708922 ) ) ( not ( = ?auto_708921 ?auto_708923 ) ) ( not ( = ?auto_708921 ?auto_708924 ) ) ( not ( = ?auto_708921 ?auto_708925 ) ) ( not ( = ?auto_708921 ?auto_708926 ) ) ( not ( = ?auto_708922 ?auto_708923 ) ) ( not ( = ?auto_708922 ?auto_708924 ) ) ( not ( = ?auto_708922 ?auto_708925 ) ) ( not ( = ?auto_708922 ?auto_708926 ) ) ( not ( = ?auto_708923 ?auto_708924 ) ) ( not ( = ?auto_708923 ?auto_708925 ) ) ( not ( = ?auto_708923 ?auto_708926 ) ) ( not ( = ?auto_708924 ?auto_708925 ) ) ( not ( = ?auto_708924 ?auto_708926 ) ) ( not ( = ?auto_708925 ?auto_708926 ) ) ( ON ?auto_708924 ?auto_708925 ) ( ON ?auto_708923 ?auto_708924 ) ( ON ?auto_708922 ?auto_708923 ) ( CLEAR ?auto_708920 ) ( ON ?auto_708921 ?auto_708922 ) ( CLEAR ?auto_708921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_708909 ?auto_708910 ?auto_708911 ?auto_708912 ?auto_708913 ?auto_708914 ?auto_708915 ?auto_708916 ?auto_708917 ?auto_708918 ?auto_708919 ?auto_708920 ?auto_708921 )
      ( MAKE-17PILE ?auto_708909 ?auto_708910 ?auto_708911 ?auto_708912 ?auto_708913 ?auto_708914 ?auto_708915 ?auto_708916 ?auto_708917 ?auto_708918 ?auto_708919 ?auto_708920 ?auto_708921 ?auto_708922 ?auto_708923 ?auto_708924 ?auto_708925 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708944 - BLOCK
      ?auto_708945 - BLOCK
      ?auto_708946 - BLOCK
      ?auto_708947 - BLOCK
      ?auto_708948 - BLOCK
      ?auto_708949 - BLOCK
      ?auto_708950 - BLOCK
      ?auto_708951 - BLOCK
      ?auto_708952 - BLOCK
      ?auto_708953 - BLOCK
      ?auto_708954 - BLOCK
      ?auto_708955 - BLOCK
      ?auto_708956 - BLOCK
      ?auto_708957 - BLOCK
      ?auto_708958 - BLOCK
      ?auto_708959 - BLOCK
      ?auto_708960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_708960 ) ( ON-TABLE ?auto_708944 ) ( ON ?auto_708945 ?auto_708944 ) ( ON ?auto_708946 ?auto_708945 ) ( ON ?auto_708947 ?auto_708946 ) ( ON ?auto_708948 ?auto_708947 ) ( ON ?auto_708949 ?auto_708948 ) ( ON ?auto_708950 ?auto_708949 ) ( ON ?auto_708951 ?auto_708950 ) ( ON ?auto_708952 ?auto_708951 ) ( ON ?auto_708953 ?auto_708952 ) ( ON ?auto_708954 ?auto_708953 ) ( ON ?auto_708955 ?auto_708954 ) ( not ( = ?auto_708944 ?auto_708945 ) ) ( not ( = ?auto_708944 ?auto_708946 ) ) ( not ( = ?auto_708944 ?auto_708947 ) ) ( not ( = ?auto_708944 ?auto_708948 ) ) ( not ( = ?auto_708944 ?auto_708949 ) ) ( not ( = ?auto_708944 ?auto_708950 ) ) ( not ( = ?auto_708944 ?auto_708951 ) ) ( not ( = ?auto_708944 ?auto_708952 ) ) ( not ( = ?auto_708944 ?auto_708953 ) ) ( not ( = ?auto_708944 ?auto_708954 ) ) ( not ( = ?auto_708944 ?auto_708955 ) ) ( not ( = ?auto_708944 ?auto_708956 ) ) ( not ( = ?auto_708944 ?auto_708957 ) ) ( not ( = ?auto_708944 ?auto_708958 ) ) ( not ( = ?auto_708944 ?auto_708959 ) ) ( not ( = ?auto_708944 ?auto_708960 ) ) ( not ( = ?auto_708945 ?auto_708946 ) ) ( not ( = ?auto_708945 ?auto_708947 ) ) ( not ( = ?auto_708945 ?auto_708948 ) ) ( not ( = ?auto_708945 ?auto_708949 ) ) ( not ( = ?auto_708945 ?auto_708950 ) ) ( not ( = ?auto_708945 ?auto_708951 ) ) ( not ( = ?auto_708945 ?auto_708952 ) ) ( not ( = ?auto_708945 ?auto_708953 ) ) ( not ( = ?auto_708945 ?auto_708954 ) ) ( not ( = ?auto_708945 ?auto_708955 ) ) ( not ( = ?auto_708945 ?auto_708956 ) ) ( not ( = ?auto_708945 ?auto_708957 ) ) ( not ( = ?auto_708945 ?auto_708958 ) ) ( not ( = ?auto_708945 ?auto_708959 ) ) ( not ( = ?auto_708945 ?auto_708960 ) ) ( not ( = ?auto_708946 ?auto_708947 ) ) ( not ( = ?auto_708946 ?auto_708948 ) ) ( not ( = ?auto_708946 ?auto_708949 ) ) ( not ( = ?auto_708946 ?auto_708950 ) ) ( not ( = ?auto_708946 ?auto_708951 ) ) ( not ( = ?auto_708946 ?auto_708952 ) ) ( not ( = ?auto_708946 ?auto_708953 ) ) ( not ( = ?auto_708946 ?auto_708954 ) ) ( not ( = ?auto_708946 ?auto_708955 ) ) ( not ( = ?auto_708946 ?auto_708956 ) ) ( not ( = ?auto_708946 ?auto_708957 ) ) ( not ( = ?auto_708946 ?auto_708958 ) ) ( not ( = ?auto_708946 ?auto_708959 ) ) ( not ( = ?auto_708946 ?auto_708960 ) ) ( not ( = ?auto_708947 ?auto_708948 ) ) ( not ( = ?auto_708947 ?auto_708949 ) ) ( not ( = ?auto_708947 ?auto_708950 ) ) ( not ( = ?auto_708947 ?auto_708951 ) ) ( not ( = ?auto_708947 ?auto_708952 ) ) ( not ( = ?auto_708947 ?auto_708953 ) ) ( not ( = ?auto_708947 ?auto_708954 ) ) ( not ( = ?auto_708947 ?auto_708955 ) ) ( not ( = ?auto_708947 ?auto_708956 ) ) ( not ( = ?auto_708947 ?auto_708957 ) ) ( not ( = ?auto_708947 ?auto_708958 ) ) ( not ( = ?auto_708947 ?auto_708959 ) ) ( not ( = ?auto_708947 ?auto_708960 ) ) ( not ( = ?auto_708948 ?auto_708949 ) ) ( not ( = ?auto_708948 ?auto_708950 ) ) ( not ( = ?auto_708948 ?auto_708951 ) ) ( not ( = ?auto_708948 ?auto_708952 ) ) ( not ( = ?auto_708948 ?auto_708953 ) ) ( not ( = ?auto_708948 ?auto_708954 ) ) ( not ( = ?auto_708948 ?auto_708955 ) ) ( not ( = ?auto_708948 ?auto_708956 ) ) ( not ( = ?auto_708948 ?auto_708957 ) ) ( not ( = ?auto_708948 ?auto_708958 ) ) ( not ( = ?auto_708948 ?auto_708959 ) ) ( not ( = ?auto_708948 ?auto_708960 ) ) ( not ( = ?auto_708949 ?auto_708950 ) ) ( not ( = ?auto_708949 ?auto_708951 ) ) ( not ( = ?auto_708949 ?auto_708952 ) ) ( not ( = ?auto_708949 ?auto_708953 ) ) ( not ( = ?auto_708949 ?auto_708954 ) ) ( not ( = ?auto_708949 ?auto_708955 ) ) ( not ( = ?auto_708949 ?auto_708956 ) ) ( not ( = ?auto_708949 ?auto_708957 ) ) ( not ( = ?auto_708949 ?auto_708958 ) ) ( not ( = ?auto_708949 ?auto_708959 ) ) ( not ( = ?auto_708949 ?auto_708960 ) ) ( not ( = ?auto_708950 ?auto_708951 ) ) ( not ( = ?auto_708950 ?auto_708952 ) ) ( not ( = ?auto_708950 ?auto_708953 ) ) ( not ( = ?auto_708950 ?auto_708954 ) ) ( not ( = ?auto_708950 ?auto_708955 ) ) ( not ( = ?auto_708950 ?auto_708956 ) ) ( not ( = ?auto_708950 ?auto_708957 ) ) ( not ( = ?auto_708950 ?auto_708958 ) ) ( not ( = ?auto_708950 ?auto_708959 ) ) ( not ( = ?auto_708950 ?auto_708960 ) ) ( not ( = ?auto_708951 ?auto_708952 ) ) ( not ( = ?auto_708951 ?auto_708953 ) ) ( not ( = ?auto_708951 ?auto_708954 ) ) ( not ( = ?auto_708951 ?auto_708955 ) ) ( not ( = ?auto_708951 ?auto_708956 ) ) ( not ( = ?auto_708951 ?auto_708957 ) ) ( not ( = ?auto_708951 ?auto_708958 ) ) ( not ( = ?auto_708951 ?auto_708959 ) ) ( not ( = ?auto_708951 ?auto_708960 ) ) ( not ( = ?auto_708952 ?auto_708953 ) ) ( not ( = ?auto_708952 ?auto_708954 ) ) ( not ( = ?auto_708952 ?auto_708955 ) ) ( not ( = ?auto_708952 ?auto_708956 ) ) ( not ( = ?auto_708952 ?auto_708957 ) ) ( not ( = ?auto_708952 ?auto_708958 ) ) ( not ( = ?auto_708952 ?auto_708959 ) ) ( not ( = ?auto_708952 ?auto_708960 ) ) ( not ( = ?auto_708953 ?auto_708954 ) ) ( not ( = ?auto_708953 ?auto_708955 ) ) ( not ( = ?auto_708953 ?auto_708956 ) ) ( not ( = ?auto_708953 ?auto_708957 ) ) ( not ( = ?auto_708953 ?auto_708958 ) ) ( not ( = ?auto_708953 ?auto_708959 ) ) ( not ( = ?auto_708953 ?auto_708960 ) ) ( not ( = ?auto_708954 ?auto_708955 ) ) ( not ( = ?auto_708954 ?auto_708956 ) ) ( not ( = ?auto_708954 ?auto_708957 ) ) ( not ( = ?auto_708954 ?auto_708958 ) ) ( not ( = ?auto_708954 ?auto_708959 ) ) ( not ( = ?auto_708954 ?auto_708960 ) ) ( not ( = ?auto_708955 ?auto_708956 ) ) ( not ( = ?auto_708955 ?auto_708957 ) ) ( not ( = ?auto_708955 ?auto_708958 ) ) ( not ( = ?auto_708955 ?auto_708959 ) ) ( not ( = ?auto_708955 ?auto_708960 ) ) ( not ( = ?auto_708956 ?auto_708957 ) ) ( not ( = ?auto_708956 ?auto_708958 ) ) ( not ( = ?auto_708956 ?auto_708959 ) ) ( not ( = ?auto_708956 ?auto_708960 ) ) ( not ( = ?auto_708957 ?auto_708958 ) ) ( not ( = ?auto_708957 ?auto_708959 ) ) ( not ( = ?auto_708957 ?auto_708960 ) ) ( not ( = ?auto_708958 ?auto_708959 ) ) ( not ( = ?auto_708958 ?auto_708960 ) ) ( not ( = ?auto_708959 ?auto_708960 ) ) ( ON ?auto_708959 ?auto_708960 ) ( ON ?auto_708958 ?auto_708959 ) ( ON ?auto_708957 ?auto_708958 ) ( CLEAR ?auto_708955 ) ( ON ?auto_708956 ?auto_708957 ) ( CLEAR ?auto_708956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_708944 ?auto_708945 ?auto_708946 ?auto_708947 ?auto_708948 ?auto_708949 ?auto_708950 ?auto_708951 ?auto_708952 ?auto_708953 ?auto_708954 ?auto_708955 ?auto_708956 )
      ( MAKE-17PILE ?auto_708944 ?auto_708945 ?auto_708946 ?auto_708947 ?auto_708948 ?auto_708949 ?auto_708950 ?auto_708951 ?auto_708952 ?auto_708953 ?auto_708954 ?auto_708955 ?auto_708956 ?auto_708957 ?auto_708958 ?auto_708959 ?auto_708960 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_708978 - BLOCK
      ?auto_708979 - BLOCK
      ?auto_708980 - BLOCK
      ?auto_708981 - BLOCK
      ?auto_708982 - BLOCK
      ?auto_708983 - BLOCK
      ?auto_708984 - BLOCK
      ?auto_708985 - BLOCK
      ?auto_708986 - BLOCK
      ?auto_708987 - BLOCK
      ?auto_708988 - BLOCK
      ?auto_708989 - BLOCK
      ?auto_708990 - BLOCK
      ?auto_708991 - BLOCK
      ?auto_708992 - BLOCK
      ?auto_708993 - BLOCK
      ?auto_708994 - BLOCK
    )
    :vars
    (
      ?auto_708995 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_708994 ?auto_708995 ) ( ON-TABLE ?auto_708978 ) ( ON ?auto_708979 ?auto_708978 ) ( ON ?auto_708980 ?auto_708979 ) ( ON ?auto_708981 ?auto_708980 ) ( ON ?auto_708982 ?auto_708981 ) ( ON ?auto_708983 ?auto_708982 ) ( ON ?auto_708984 ?auto_708983 ) ( ON ?auto_708985 ?auto_708984 ) ( ON ?auto_708986 ?auto_708985 ) ( ON ?auto_708987 ?auto_708986 ) ( ON ?auto_708988 ?auto_708987 ) ( not ( = ?auto_708978 ?auto_708979 ) ) ( not ( = ?auto_708978 ?auto_708980 ) ) ( not ( = ?auto_708978 ?auto_708981 ) ) ( not ( = ?auto_708978 ?auto_708982 ) ) ( not ( = ?auto_708978 ?auto_708983 ) ) ( not ( = ?auto_708978 ?auto_708984 ) ) ( not ( = ?auto_708978 ?auto_708985 ) ) ( not ( = ?auto_708978 ?auto_708986 ) ) ( not ( = ?auto_708978 ?auto_708987 ) ) ( not ( = ?auto_708978 ?auto_708988 ) ) ( not ( = ?auto_708978 ?auto_708989 ) ) ( not ( = ?auto_708978 ?auto_708990 ) ) ( not ( = ?auto_708978 ?auto_708991 ) ) ( not ( = ?auto_708978 ?auto_708992 ) ) ( not ( = ?auto_708978 ?auto_708993 ) ) ( not ( = ?auto_708978 ?auto_708994 ) ) ( not ( = ?auto_708978 ?auto_708995 ) ) ( not ( = ?auto_708979 ?auto_708980 ) ) ( not ( = ?auto_708979 ?auto_708981 ) ) ( not ( = ?auto_708979 ?auto_708982 ) ) ( not ( = ?auto_708979 ?auto_708983 ) ) ( not ( = ?auto_708979 ?auto_708984 ) ) ( not ( = ?auto_708979 ?auto_708985 ) ) ( not ( = ?auto_708979 ?auto_708986 ) ) ( not ( = ?auto_708979 ?auto_708987 ) ) ( not ( = ?auto_708979 ?auto_708988 ) ) ( not ( = ?auto_708979 ?auto_708989 ) ) ( not ( = ?auto_708979 ?auto_708990 ) ) ( not ( = ?auto_708979 ?auto_708991 ) ) ( not ( = ?auto_708979 ?auto_708992 ) ) ( not ( = ?auto_708979 ?auto_708993 ) ) ( not ( = ?auto_708979 ?auto_708994 ) ) ( not ( = ?auto_708979 ?auto_708995 ) ) ( not ( = ?auto_708980 ?auto_708981 ) ) ( not ( = ?auto_708980 ?auto_708982 ) ) ( not ( = ?auto_708980 ?auto_708983 ) ) ( not ( = ?auto_708980 ?auto_708984 ) ) ( not ( = ?auto_708980 ?auto_708985 ) ) ( not ( = ?auto_708980 ?auto_708986 ) ) ( not ( = ?auto_708980 ?auto_708987 ) ) ( not ( = ?auto_708980 ?auto_708988 ) ) ( not ( = ?auto_708980 ?auto_708989 ) ) ( not ( = ?auto_708980 ?auto_708990 ) ) ( not ( = ?auto_708980 ?auto_708991 ) ) ( not ( = ?auto_708980 ?auto_708992 ) ) ( not ( = ?auto_708980 ?auto_708993 ) ) ( not ( = ?auto_708980 ?auto_708994 ) ) ( not ( = ?auto_708980 ?auto_708995 ) ) ( not ( = ?auto_708981 ?auto_708982 ) ) ( not ( = ?auto_708981 ?auto_708983 ) ) ( not ( = ?auto_708981 ?auto_708984 ) ) ( not ( = ?auto_708981 ?auto_708985 ) ) ( not ( = ?auto_708981 ?auto_708986 ) ) ( not ( = ?auto_708981 ?auto_708987 ) ) ( not ( = ?auto_708981 ?auto_708988 ) ) ( not ( = ?auto_708981 ?auto_708989 ) ) ( not ( = ?auto_708981 ?auto_708990 ) ) ( not ( = ?auto_708981 ?auto_708991 ) ) ( not ( = ?auto_708981 ?auto_708992 ) ) ( not ( = ?auto_708981 ?auto_708993 ) ) ( not ( = ?auto_708981 ?auto_708994 ) ) ( not ( = ?auto_708981 ?auto_708995 ) ) ( not ( = ?auto_708982 ?auto_708983 ) ) ( not ( = ?auto_708982 ?auto_708984 ) ) ( not ( = ?auto_708982 ?auto_708985 ) ) ( not ( = ?auto_708982 ?auto_708986 ) ) ( not ( = ?auto_708982 ?auto_708987 ) ) ( not ( = ?auto_708982 ?auto_708988 ) ) ( not ( = ?auto_708982 ?auto_708989 ) ) ( not ( = ?auto_708982 ?auto_708990 ) ) ( not ( = ?auto_708982 ?auto_708991 ) ) ( not ( = ?auto_708982 ?auto_708992 ) ) ( not ( = ?auto_708982 ?auto_708993 ) ) ( not ( = ?auto_708982 ?auto_708994 ) ) ( not ( = ?auto_708982 ?auto_708995 ) ) ( not ( = ?auto_708983 ?auto_708984 ) ) ( not ( = ?auto_708983 ?auto_708985 ) ) ( not ( = ?auto_708983 ?auto_708986 ) ) ( not ( = ?auto_708983 ?auto_708987 ) ) ( not ( = ?auto_708983 ?auto_708988 ) ) ( not ( = ?auto_708983 ?auto_708989 ) ) ( not ( = ?auto_708983 ?auto_708990 ) ) ( not ( = ?auto_708983 ?auto_708991 ) ) ( not ( = ?auto_708983 ?auto_708992 ) ) ( not ( = ?auto_708983 ?auto_708993 ) ) ( not ( = ?auto_708983 ?auto_708994 ) ) ( not ( = ?auto_708983 ?auto_708995 ) ) ( not ( = ?auto_708984 ?auto_708985 ) ) ( not ( = ?auto_708984 ?auto_708986 ) ) ( not ( = ?auto_708984 ?auto_708987 ) ) ( not ( = ?auto_708984 ?auto_708988 ) ) ( not ( = ?auto_708984 ?auto_708989 ) ) ( not ( = ?auto_708984 ?auto_708990 ) ) ( not ( = ?auto_708984 ?auto_708991 ) ) ( not ( = ?auto_708984 ?auto_708992 ) ) ( not ( = ?auto_708984 ?auto_708993 ) ) ( not ( = ?auto_708984 ?auto_708994 ) ) ( not ( = ?auto_708984 ?auto_708995 ) ) ( not ( = ?auto_708985 ?auto_708986 ) ) ( not ( = ?auto_708985 ?auto_708987 ) ) ( not ( = ?auto_708985 ?auto_708988 ) ) ( not ( = ?auto_708985 ?auto_708989 ) ) ( not ( = ?auto_708985 ?auto_708990 ) ) ( not ( = ?auto_708985 ?auto_708991 ) ) ( not ( = ?auto_708985 ?auto_708992 ) ) ( not ( = ?auto_708985 ?auto_708993 ) ) ( not ( = ?auto_708985 ?auto_708994 ) ) ( not ( = ?auto_708985 ?auto_708995 ) ) ( not ( = ?auto_708986 ?auto_708987 ) ) ( not ( = ?auto_708986 ?auto_708988 ) ) ( not ( = ?auto_708986 ?auto_708989 ) ) ( not ( = ?auto_708986 ?auto_708990 ) ) ( not ( = ?auto_708986 ?auto_708991 ) ) ( not ( = ?auto_708986 ?auto_708992 ) ) ( not ( = ?auto_708986 ?auto_708993 ) ) ( not ( = ?auto_708986 ?auto_708994 ) ) ( not ( = ?auto_708986 ?auto_708995 ) ) ( not ( = ?auto_708987 ?auto_708988 ) ) ( not ( = ?auto_708987 ?auto_708989 ) ) ( not ( = ?auto_708987 ?auto_708990 ) ) ( not ( = ?auto_708987 ?auto_708991 ) ) ( not ( = ?auto_708987 ?auto_708992 ) ) ( not ( = ?auto_708987 ?auto_708993 ) ) ( not ( = ?auto_708987 ?auto_708994 ) ) ( not ( = ?auto_708987 ?auto_708995 ) ) ( not ( = ?auto_708988 ?auto_708989 ) ) ( not ( = ?auto_708988 ?auto_708990 ) ) ( not ( = ?auto_708988 ?auto_708991 ) ) ( not ( = ?auto_708988 ?auto_708992 ) ) ( not ( = ?auto_708988 ?auto_708993 ) ) ( not ( = ?auto_708988 ?auto_708994 ) ) ( not ( = ?auto_708988 ?auto_708995 ) ) ( not ( = ?auto_708989 ?auto_708990 ) ) ( not ( = ?auto_708989 ?auto_708991 ) ) ( not ( = ?auto_708989 ?auto_708992 ) ) ( not ( = ?auto_708989 ?auto_708993 ) ) ( not ( = ?auto_708989 ?auto_708994 ) ) ( not ( = ?auto_708989 ?auto_708995 ) ) ( not ( = ?auto_708990 ?auto_708991 ) ) ( not ( = ?auto_708990 ?auto_708992 ) ) ( not ( = ?auto_708990 ?auto_708993 ) ) ( not ( = ?auto_708990 ?auto_708994 ) ) ( not ( = ?auto_708990 ?auto_708995 ) ) ( not ( = ?auto_708991 ?auto_708992 ) ) ( not ( = ?auto_708991 ?auto_708993 ) ) ( not ( = ?auto_708991 ?auto_708994 ) ) ( not ( = ?auto_708991 ?auto_708995 ) ) ( not ( = ?auto_708992 ?auto_708993 ) ) ( not ( = ?auto_708992 ?auto_708994 ) ) ( not ( = ?auto_708992 ?auto_708995 ) ) ( not ( = ?auto_708993 ?auto_708994 ) ) ( not ( = ?auto_708993 ?auto_708995 ) ) ( not ( = ?auto_708994 ?auto_708995 ) ) ( ON ?auto_708993 ?auto_708994 ) ( ON ?auto_708992 ?auto_708993 ) ( ON ?auto_708991 ?auto_708992 ) ( ON ?auto_708990 ?auto_708991 ) ( CLEAR ?auto_708988 ) ( ON ?auto_708989 ?auto_708990 ) ( CLEAR ?auto_708989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_708978 ?auto_708979 ?auto_708980 ?auto_708981 ?auto_708982 ?auto_708983 ?auto_708984 ?auto_708985 ?auto_708986 ?auto_708987 ?auto_708988 ?auto_708989 )
      ( MAKE-17PILE ?auto_708978 ?auto_708979 ?auto_708980 ?auto_708981 ?auto_708982 ?auto_708983 ?auto_708984 ?auto_708985 ?auto_708986 ?auto_708987 ?auto_708988 ?auto_708989 ?auto_708990 ?auto_708991 ?auto_708992 ?auto_708993 ?auto_708994 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709013 - BLOCK
      ?auto_709014 - BLOCK
      ?auto_709015 - BLOCK
      ?auto_709016 - BLOCK
      ?auto_709017 - BLOCK
      ?auto_709018 - BLOCK
      ?auto_709019 - BLOCK
      ?auto_709020 - BLOCK
      ?auto_709021 - BLOCK
      ?auto_709022 - BLOCK
      ?auto_709023 - BLOCK
      ?auto_709024 - BLOCK
      ?auto_709025 - BLOCK
      ?auto_709026 - BLOCK
      ?auto_709027 - BLOCK
      ?auto_709028 - BLOCK
      ?auto_709029 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709029 ) ( ON-TABLE ?auto_709013 ) ( ON ?auto_709014 ?auto_709013 ) ( ON ?auto_709015 ?auto_709014 ) ( ON ?auto_709016 ?auto_709015 ) ( ON ?auto_709017 ?auto_709016 ) ( ON ?auto_709018 ?auto_709017 ) ( ON ?auto_709019 ?auto_709018 ) ( ON ?auto_709020 ?auto_709019 ) ( ON ?auto_709021 ?auto_709020 ) ( ON ?auto_709022 ?auto_709021 ) ( ON ?auto_709023 ?auto_709022 ) ( not ( = ?auto_709013 ?auto_709014 ) ) ( not ( = ?auto_709013 ?auto_709015 ) ) ( not ( = ?auto_709013 ?auto_709016 ) ) ( not ( = ?auto_709013 ?auto_709017 ) ) ( not ( = ?auto_709013 ?auto_709018 ) ) ( not ( = ?auto_709013 ?auto_709019 ) ) ( not ( = ?auto_709013 ?auto_709020 ) ) ( not ( = ?auto_709013 ?auto_709021 ) ) ( not ( = ?auto_709013 ?auto_709022 ) ) ( not ( = ?auto_709013 ?auto_709023 ) ) ( not ( = ?auto_709013 ?auto_709024 ) ) ( not ( = ?auto_709013 ?auto_709025 ) ) ( not ( = ?auto_709013 ?auto_709026 ) ) ( not ( = ?auto_709013 ?auto_709027 ) ) ( not ( = ?auto_709013 ?auto_709028 ) ) ( not ( = ?auto_709013 ?auto_709029 ) ) ( not ( = ?auto_709014 ?auto_709015 ) ) ( not ( = ?auto_709014 ?auto_709016 ) ) ( not ( = ?auto_709014 ?auto_709017 ) ) ( not ( = ?auto_709014 ?auto_709018 ) ) ( not ( = ?auto_709014 ?auto_709019 ) ) ( not ( = ?auto_709014 ?auto_709020 ) ) ( not ( = ?auto_709014 ?auto_709021 ) ) ( not ( = ?auto_709014 ?auto_709022 ) ) ( not ( = ?auto_709014 ?auto_709023 ) ) ( not ( = ?auto_709014 ?auto_709024 ) ) ( not ( = ?auto_709014 ?auto_709025 ) ) ( not ( = ?auto_709014 ?auto_709026 ) ) ( not ( = ?auto_709014 ?auto_709027 ) ) ( not ( = ?auto_709014 ?auto_709028 ) ) ( not ( = ?auto_709014 ?auto_709029 ) ) ( not ( = ?auto_709015 ?auto_709016 ) ) ( not ( = ?auto_709015 ?auto_709017 ) ) ( not ( = ?auto_709015 ?auto_709018 ) ) ( not ( = ?auto_709015 ?auto_709019 ) ) ( not ( = ?auto_709015 ?auto_709020 ) ) ( not ( = ?auto_709015 ?auto_709021 ) ) ( not ( = ?auto_709015 ?auto_709022 ) ) ( not ( = ?auto_709015 ?auto_709023 ) ) ( not ( = ?auto_709015 ?auto_709024 ) ) ( not ( = ?auto_709015 ?auto_709025 ) ) ( not ( = ?auto_709015 ?auto_709026 ) ) ( not ( = ?auto_709015 ?auto_709027 ) ) ( not ( = ?auto_709015 ?auto_709028 ) ) ( not ( = ?auto_709015 ?auto_709029 ) ) ( not ( = ?auto_709016 ?auto_709017 ) ) ( not ( = ?auto_709016 ?auto_709018 ) ) ( not ( = ?auto_709016 ?auto_709019 ) ) ( not ( = ?auto_709016 ?auto_709020 ) ) ( not ( = ?auto_709016 ?auto_709021 ) ) ( not ( = ?auto_709016 ?auto_709022 ) ) ( not ( = ?auto_709016 ?auto_709023 ) ) ( not ( = ?auto_709016 ?auto_709024 ) ) ( not ( = ?auto_709016 ?auto_709025 ) ) ( not ( = ?auto_709016 ?auto_709026 ) ) ( not ( = ?auto_709016 ?auto_709027 ) ) ( not ( = ?auto_709016 ?auto_709028 ) ) ( not ( = ?auto_709016 ?auto_709029 ) ) ( not ( = ?auto_709017 ?auto_709018 ) ) ( not ( = ?auto_709017 ?auto_709019 ) ) ( not ( = ?auto_709017 ?auto_709020 ) ) ( not ( = ?auto_709017 ?auto_709021 ) ) ( not ( = ?auto_709017 ?auto_709022 ) ) ( not ( = ?auto_709017 ?auto_709023 ) ) ( not ( = ?auto_709017 ?auto_709024 ) ) ( not ( = ?auto_709017 ?auto_709025 ) ) ( not ( = ?auto_709017 ?auto_709026 ) ) ( not ( = ?auto_709017 ?auto_709027 ) ) ( not ( = ?auto_709017 ?auto_709028 ) ) ( not ( = ?auto_709017 ?auto_709029 ) ) ( not ( = ?auto_709018 ?auto_709019 ) ) ( not ( = ?auto_709018 ?auto_709020 ) ) ( not ( = ?auto_709018 ?auto_709021 ) ) ( not ( = ?auto_709018 ?auto_709022 ) ) ( not ( = ?auto_709018 ?auto_709023 ) ) ( not ( = ?auto_709018 ?auto_709024 ) ) ( not ( = ?auto_709018 ?auto_709025 ) ) ( not ( = ?auto_709018 ?auto_709026 ) ) ( not ( = ?auto_709018 ?auto_709027 ) ) ( not ( = ?auto_709018 ?auto_709028 ) ) ( not ( = ?auto_709018 ?auto_709029 ) ) ( not ( = ?auto_709019 ?auto_709020 ) ) ( not ( = ?auto_709019 ?auto_709021 ) ) ( not ( = ?auto_709019 ?auto_709022 ) ) ( not ( = ?auto_709019 ?auto_709023 ) ) ( not ( = ?auto_709019 ?auto_709024 ) ) ( not ( = ?auto_709019 ?auto_709025 ) ) ( not ( = ?auto_709019 ?auto_709026 ) ) ( not ( = ?auto_709019 ?auto_709027 ) ) ( not ( = ?auto_709019 ?auto_709028 ) ) ( not ( = ?auto_709019 ?auto_709029 ) ) ( not ( = ?auto_709020 ?auto_709021 ) ) ( not ( = ?auto_709020 ?auto_709022 ) ) ( not ( = ?auto_709020 ?auto_709023 ) ) ( not ( = ?auto_709020 ?auto_709024 ) ) ( not ( = ?auto_709020 ?auto_709025 ) ) ( not ( = ?auto_709020 ?auto_709026 ) ) ( not ( = ?auto_709020 ?auto_709027 ) ) ( not ( = ?auto_709020 ?auto_709028 ) ) ( not ( = ?auto_709020 ?auto_709029 ) ) ( not ( = ?auto_709021 ?auto_709022 ) ) ( not ( = ?auto_709021 ?auto_709023 ) ) ( not ( = ?auto_709021 ?auto_709024 ) ) ( not ( = ?auto_709021 ?auto_709025 ) ) ( not ( = ?auto_709021 ?auto_709026 ) ) ( not ( = ?auto_709021 ?auto_709027 ) ) ( not ( = ?auto_709021 ?auto_709028 ) ) ( not ( = ?auto_709021 ?auto_709029 ) ) ( not ( = ?auto_709022 ?auto_709023 ) ) ( not ( = ?auto_709022 ?auto_709024 ) ) ( not ( = ?auto_709022 ?auto_709025 ) ) ( not ( = ?auto_709022 ?auto_709026 ) ) ( not ( = ?auto_709022 ?auto_709027 ) ) ( not ( = ?auto_709022 ?auto_709028 ) ) ( not ( = ?auto_709022 ?auto_709029 ) ) ( not ( = ?auto_709023 ?auto_709024 ) ) ( not ( = ?auto_709023 ?auto_709025 ) ) ( not ( = ?auto_709023 ?auto_709026 ) ) ( not ( = ?auto_709023 ?auto_709027 ) ) ( not ( = ?auto_709023 ?auto_709028 ) ) ( not ( = ?auto_709023 ?auto_709029 ) ) ( not ( = ?auto_709024 ?auto_709025 ) ) ( not ( = ?auto_709024 ?auto_709026 ) ) ( not ( = ?auto_709024 ?auto_709027 ) ) ( not ( = ?auto_709024 ?auto_709028 ) ) ( not ( = ?auto_709024 ?auto_709029 ) ) ( not ( = ?auto_709025 ?auto_709026 ) ) ( not ( = ?auto_709025 ?auto_709027 ) ) ( not ( = ?auto_709025 ?auto_709028 ) ) ( not ( = ?auto_709025 ?auto_709029 ) ) ( not ( = ?auto_709026 ?auto_709027 ) ) ( not ( = ?auto_709026 ?auto_709028 ) ) ( not ( = ?auto_709026 ?auto_709029 ) ) ( not ( = ?auto_709027 ?auto_709028 ) ) ( not ( = ?auto_709027 ?auto_709029 ) ) ( not ( = ?auto_709028 ?auto_709029 ) ) ( ON ?auto_709028 ?auto_709029 ) ( ON ?auto_709027 ?auto_709028 ) ( ON ?auto_709026 ?auto_709027 ) ( ON ?auto_709025 ?auto_709026 ) ( CLEAR ?auto_709023 ) ( ON ?auto_709024 ?auto_709025 ) ( CLEAR ?auto_709024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_709013 ?auto_709014 ?auto_709015 ?auto_709016 ?auto_709017 ?auto_709018 ?auto_709019 ?auto_709020 ?auto_709021 ?auto_709022 ?auto_709023 ?auto_709024 )
      ( MAKE-17PILE ?auto_709013 ?auto_709014 ?auto_709015 ?auto_709016 ?auto_709017 ?auto_709018 ?auto_709019 ?auto_709020 ?auto_709021 ?auto_709022 ?auto_709023 ?auto_709024 ?auto_709025 ?auto_709026 ?auto_709027 ?auto_709028 ?auto_709029 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709047 - BLOCK
      ?auto_709048 - BLOCK
      ?auto_709049 - BLOCK
      ?auto_709050 - BLOCK
      ?auto_709051 - BLOCK
      ?auto_709052 - BLOCK
      ?auto_709053 - BLOCK
      ?auto_709054 - BLOCK
      ?auto_709055 - BLOCK
      ?auto_709056 - BLOCK
      ?auto_709057 - BLOCK
      ?auto_709058 - BLOCK
      ?auto_709059 - BLOCK
      ?auto_709060 - BLOCK
      ?auto_709061 - BLOCK
      ?auto_709062 - BLOCK
      ?auto_709063 - BLOCK
    )
    :vars
    (
      ?auto_709064 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709063 ?auto_709064 ) ( ON-TABLE ?auto_709047 ) ( ON ?auto_709048 ?auto_709047 ) ( ON ?auto_709049 ?auto_709048 ) ( ON ?auto_709050 ?auto_709049 ) ( ON ?auto_709051 ?auto_709050 ) ( ON ?auto_709052 ?auto_709051 ) ( ON ?auto_709053 ?auto_709052 ) ( ON ?auto_709054 ?auto_709053 ) ( ON ?auto_709055 ?auto_709054 ) ( ON ?auto_709056 ?auto_709055 ) ( not ( = ?auto_709047 ?auto_709048 ) ) ( not ( = ?auto_709047 ?auto_709049 ) ) ( not ( = ?auto_709047 ?auto_709050 ) ) ( not ( = ?auto_709047 ?auto_709051 ) ) ( not ( = ?auto_709047 ?auto_709052 ) ) ( not ( = ?auto_709047 ?auto_709053 ) ) ( not ( = ?auto_709047 ?auto_709054 ) ) ( not ( = ?auto_709047 ?auto_709055 ) ) ( not ( = ?auto_709047 ?auto_709056 ) ) ( not ( = ?auto_709047 ?auto_709057 ) ) ( not ( = ?auto_709047 ?auto_709058 ) ) ( not ( = ?auto_709047 ?auto_709059 ) ) ( not ( = ?auto_709047 ?auto_709060 ) ) ( not ( = ?auto_709047 ?auto_709061 ) ) ( not ( = ?auto_709047 ?auto_709062 ) ) ( not ( = ?auto_709047 ?auto_709063 ) ) ( not ( = ?auto_709047 ?auto_709064 ) ) ( not ( = ?auto_709048 ?auto_709049 ) ) ( not ( = ?auto_709048 ?auto_709050 ) ) ( not ( = ?auto_709048 ?auto_709051 ) ) ( not ( = ?auto_709048 ?auto_709052 ) ) ( not ( = ?auto_709048 ?auto_709053 ) ) ( not ( = ?auto_709048 ?auto_709054 ) ) ( not ( = ?auto_709048 ?auto_709055 ) ) ( not ( = ?auto_709048 ?auto_709056 ) ) ( not ( = ?auto_709048 ?auto_709057 ) ) ( not ( = ?auto_709048 ?auto_709058 ) ) ( not ( = ?auto_709048 ?auto_709059 ) ) ( not ( = ?auto_709048 ?auto_709060 ) ) ( not ( = ?auto_709048 ?auto_709061 ) ) ( not ( = ?auto_709048 ?auto_709062 ) ) ( not ( = ?auto_709048 ?auto_709063 ) ) ( not ( = ?auto_709048 ?auto_709064 ) ) ( not ( = ?auto_709049 ?auto_709050 ) ) ( not ( = ?auto_709049 ?auto_709051 ) ) ( not ( = ?auto_709049 ?auto_709052 ) ) ( not ( = ?auto_709049 ?auto_709053 ) ) ( not ( = ?auto_709049 ?auto_709054 ) ) ( not ( = ?auto_709049 ?auto_709055 ) ) ( not ( = ?auto_709049 ?auto_709056 ) ) ( not ( = ?auto_709049 ?auto_709057 ) ) ( not ( = ?auto_709049 ?auto_709058 ) ) ( not ( = ?auto_709049 ?auto_709059 ) ) ( not ( = ?auto_709049 ?auto_709060 ) ) ( not ( = ?auto_709049 ?auto_709061 ) ) ( not ( = ?auto_709049 ?auto_709062 ) ) ( not ( = ?auto_709049 ?auto_709063 ) ) ( not ( = ?auto_709049 ?auto_709064 ) ) ( not ( = ?auto_709050 ?auto_709051 ) ) ( not ( = ?auto_709050 ?auto_709052 ) ) ( not ( = ?auto_709050 ?auto_709053 ) ) ( not ( = ?auto_709050 ?auto_709054 ) ) ( not ( = ?auto_709050 ?auto_709055 ) ) ( not ( = ?auto_709050 ?auto_709056 ) ) ( not ( = ?auto_709050 ?auto_709057 ) ) ( not ( = ?auto_709050 ?auto_709058 ) ) ( not ( = ?auto_709050 ?auto_709059 ) ) ( not ( = ?auto_709050 ?auto_709060 ) ) ( not ( = ?auto_709050 ?auto_709061 ) ) ( not ( = ?auto_709050 ?auto_709062 ) ) ( not ( = ?auto_709050 ?auto_709063 ) ) ( not ( = ?auto_709050 ?auto_709064 ) ) ( not ( = ?auto_709051 ?auto_709052 ) ) ( not ( = ?auto_709051 ?auto_709053 ) ) ( not ( = ?auto_709051 ?auto_709054 ) ) ( not ( = ?auto_709051 ?auto_709055 ) ) ( not ( = ?auto_709051 ?auto_709056 ) ) ( not ( = ?auto_709051 ?auto_709057 ) ) ( not ( = ?auto_709051 ?auto_709058 ) ) ( not ( = ?auto_709051 ?auto_709059 ) ) ( not ( = ?auto_709051 ?auto_709060 ) ) ( not ( = ?auto_709051 ?auto_709061 ) ) ( not ( = ?auto_709051 ?auto_709062 ) ) ( not ( = ?auto_709051 ?auto_709063 ) ) ( not ( = ?auto_709051 ?auto_709064 ) ) ( not ( = ?auto_709052 ?auto_709053 ) ) ( not ( = ?auto_709052 ?auto_709054 ) ) ( not ( = ?auto_709052 ?auto_709055 ) ) ( not ( = ?auto_709052 ?auto_709056 ) ) ( not ( = ?auto_709052 ?auto_709057 ) ) ( not ( = ?auto_709052 ?auto_709058 ) ) ( not ( = ?auto_709052 ?auto_709059 ) ) ( not ( = ?auto_709052 ?auto_709060 ) ) ( not ( = ?auto_709052 ?auto_709061 ) ) ( not ( = ?auto_709052 ?auto_709062 ) ) ( not ( = ?auto_709052 ?auto_709063 ) ) ( not ( = ?auto_709052 ?auto_709064 ) ) ( not ( = ?auto_709053 ?auto_709054 ) ) ( not ( = ?auto_709053 ?auto_709055 ) ) ( not ( = ?auto_709053 ?auto_709056 ) ) ( not ( = ?auto_709053 ?auto_709057 ) ) ( not ( = ?auto_709053 ?auto_709058 ) ) ( not ( = ?auto_709053 ?auto_709059 ) ) ( not ( = ?auto_709053 ?auto_709060 ) ) ( not ( = ?auto_709053 ?auto_709061 ) ) ( not ( = ?auto_709053 ?auto_709062 ) ) ( not ( = ?auto_709053 ?auto_709063 ) ) ( not ( = ?auto_709053 ?auto_709064 ) ) ( not ( = ?auto_709054 ?auto_709055 ) ) ( not ( = ?auto_709054 ?auto_709056 ) ) ( not ( = ?auto_709054 ?auto_709057 ) ) ( not ( = ?auto_709054 ?auto_709058 ) ) ( not ( = ?auto_709054 ?auto_709059 ) ) ( not ( = ?auto_709054 ?auto_709060 ) ) ( not ( = ?auto_709054 ?auto_709061 ) ) ( not ( = ?auto_709054 ?auto_709062 ) ) ( not ( = ?auto_709054 ?auto_709063 ) ) ( not ( = ?auto_709054 ?auto_709064 ) ) ( not ( = ?auto_709055 ?auto_709056 ) ) ( not ( = ?auto_709055 ?auto_709057 ) ) ( not ( = ?auto_709055 ?auto_709058 ) ) ( not ( = ?auto_709055 ?auto_709059 ) ) ( not ( = ?auto_709055 ?auto_709060 ) ) ( not ( = ?auto_709055 ?auto_709061 ) ) ( not ( = ?auto_709055 ?auto_709062 ) ) ( not ( = ?auto_709055 ?auto_709063 ) ) ( not ( = ?auto_709055 ?auto_709064 ) ) ( not ( = ?auto_709056 ?auto_709057 ) ) ( not ( = ?auto_709056 ?auto_709058 ) ) ( not ( = ?auto_709056 ?auto_709059 ) ) ( not ( = ?auto_709056 ?auto_709060 ) ) ( not ( = ?auto_709056 ?auto_709061 ) ) ( not ( = ?auto_709056 ?auto_709062 ) ) ( not ( = ?auto_709056 ?auto_709063 ) ) ( not ( = ?auto_709056 ?auto_709064 ) ) ( not ( = ?auto_709057 ?auto_709058 ) ) ( not ( = ?auto_709057 ?auto_709059 ) ) ( not ( = ?auto_709057 ?auto_709060 ) ) ( not ( = ?auto_709057 ?auto_709061 ) ) ( not ( = ?auto_709057 ?auto_709062 ) ) ( not ( = ?auto_709057 ?auto_709063 ) ) ( not ( = ?auto_709057 ?auto_709064 ) ) ( not ( = ?auto_709058 ?auto_709059 ) ) ( not ( = ?auto_709058 ?auto_709060 ) ) ( not ( = ?auto_709058 ?auto_709061 ) ) ( not ( = ?auto_709058 ?auto_709062 ) ) ( not ( = ?auto_709058 ?auto_709063 ) ) ( not ( = ?auto_709058 ?auto_709064 ) ) ( not ( = ?auto_709059 ?auto_709060 ) ) ( not ( = ?auto_709059 ?auto_709061 ) ) ( not ( = ?auto_709059 ?auto_709062 ) ) ( not ( = ?auto_709059 ?auto_709063 ) ) ( not ( = ?auto_709059 ?auto_709064 ) ) ( not ( = ?auto_709060 ?auto_709061 ) ) ( not ( = ?auto_709060 ?auto_709062 ) ) ( not ( = ?auto_709060 ?auto_709063 ) ) ( not ( = ?auto_709060 ?auto_709064 ) ) ( not ( = ?auto_709061 ?auto_709062 ) ) ( not ( = ?auto_709061 ?auto_709063 ) ) ( not ( = ?auto_709061 ?auto_709064 ) ) ( not ( = ?auto_709062 ?auto_709063 ) ) ( not ( = ?auto_709062 ?auto_709064 ) ) ( not ( = ?auto_709063 ?auto_709064 ) ) ( ON ?auto_709062 ?auto_709063 ) ( ON ?auto_709061 ?auto_709062 ) ( ON ?auto_709060 ?auto_709061 ) ( ON ?auto_709059 ?auto_709060 ) ( ON ?auto_709058 ?auto_709059 ) ( CLEAR ?auto_709056 ) ( ON ?auto_709057 ?auto_709058 ) ( CLEAR ?auto_709057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_709047 ?auto_709048 ?auto_709049 ?auto_709050 ?auto_709051 ?auto_709052 ?auto_709053 ?auto_709054 ?auto_709055 ?auto_709056 ?auto_709057 )
      ( MAKE-17PILE ?auto_709047 ?auto_709048 ?auto_709049 ?auto_709050 ?auto_709051 ?auto_709052 ?auto_709053 ?auto_709054 ?auto_709055 ?auto_709056 ?auto_709057 ?auto_709058 ?auto_709059 ?auto_709060 ?auto_709061 ?auto_709062 ?auto_709063 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709082 - BLOCK
      ?auto_709083 - BLOCK
      ?auto_709084 - BLOCK
      ?auto_709085 - BLOCK
      ?auto_709086 - BLOCK
      ?auto_709087 - BLOCK
      ?auto_709088 - BLOCK
      ?auto_709089 - BLOCK
      ?auto_709090 - BLOCK
      ?auto_709091 - BLOCK
      ?auto_709092 - BLOCK
      ?auto_709093 - BLOCK
      ?auto_709094 - BLOCK
      ?auto_709095 - BLOCK
      ?auto_709096 - BLOCK
      ?auto_709097 - BLOCK
      ?auto_709098 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709098 ) ( ON-TABLE ?auto_709082 ) ( ON ?auto_709083 ?auto_709082 ) ( ON ?auto_709084 ?auto_709083 ) ( ON ?auto_709085 ?auto_709084 ) ( ON ?auto_709086 ?auto_709085 ) ( ON ?auto_709087 ?auto_709086 ) ( ON ?auto_709088 ?auto_709087 ) ( ON ?auto_709089 ?auto_709088 ) ( ON ?auto_709090 ?auto_709089 ) ( ON ?auto_709091 ?auto_709090 ) ( not ( = ?auto_709082 ?auto_709083 ) ) ( not ( = ?auto_709082 ?auto_709084 ) ) ( not ( = ?auto_709082 ?auto_709085 ) ) ( not ( = ?auto_709082 ?auto_709086 ) ) ( not ( = ?auto_709082 ?auto_709087 ) ) ( not ( = ?auto_709082 ?auto_709088 ) ) ( not ( = ?auto_709082 ?auto_709089 ) ) ( not ( = ?auto_709082 ?auto_709090 ) ) ( not ( = ?auto_709082 ?auto_709091 ) ) ( not ( = ?auto_709082 ?auto_709092 ) ) ( not ( = ?auto_709082 ?auto_709093 ) ) ( not ( = ?auto_709082 ?auto_709094 ) ) ( not ( = ?auto_709082 ?auto_709095 ) ) ( not ( = ?auto_709082 ?auto_709096 ) ) ( not ( = ?auto_709082 ?auto_709097 ) ) ( not ( = ?auto_709082 ?auto_709098 ) ) ( not ( = ?auto_709083 ?auto_709084 ) ) ( not ( = ?auto_709083 ?auto_709085 ) ) ( not ( = ?auto_709083 ?auto_709086 ) ) ( not ( = ?auto_709083 ?auto_709087 ) ) ( not ( = ?auto_709083 ?auto_709088 ) ) ( not ( = ?auto_709083 ?auto_709089 ) ) ( not ( = ?auto_709083 ?auto_709090 ) ) ( not ( = ?auto_709083 ?auto_709091 ) ) ( not ( = ?auto_709083 ?auto_709092 ) ) ( not ( = ?auto_709083 ?auto_709093 ) ) ( not ( = ?auto_709083 ?auto_709094 ) ) ( not ( = ?auto_709083 ?auto_709095 ) ) ( not ( = ?auto_709083 ?auto_709096 ) ) ( not ( = ?auto_709083 ?auto_709097 ) ) ( not ( = ?auto_709083 ?auto_709098 ) ) ( not ( = ?auto_709084 ?auto_709085 ) ) ( not ( = ?auto_709084 ?auto_709086 ) ) ( not ( = ?auto_709084 ?auto_709087 ) ) ( not ( = ?auto_709084 ?auto_709088 ) ) ( not ( = ?auto_709084 ?auto_709089 ) ) ( not ( = ?auto_709084 ?auto_709090 ) ) ( not ( = ?auto_709084 ?auto_709091 ) ) ( not ( = ?auto_709084 ?auto_709092 ) ) ( not ( = ?auto_709084 ?auto_709093 ) ) ( not ( = ?auto_709084 ?auto_709094 ) ) ( not ( = ?auto_709084 ?auto_709095 ) ) ( not ( = ?auto_709084 ?auto_709096 ) ) ( not ( = ?auto_709084 ?auto_709097 ) ) ( not ( = ?auto_709084 ?auto_709098 ) ) ( not ( = ?auto_709085 ?auto_709086 ) ) ( not ( = ?auto_709085 ?auto_709087 ) ) ( not ( = ?auto_709085 ?auto_709088 ) ) ( not ( = ?auto_709085 ?auto_709089 ) ) ( not ( = ?auto_709085 ?auto_709090 ) ) ( not ( = ?auto_709085 ?auto_709091 ) ) ( not ( = ?auto_709085 ?auto_709092 ) ) ( not ( = ?auto_709085 ?auto_709093 ) ) ( not ( = ?auto_709085 ?auto_709094 ) ) ( not ( = ?auto_709085 ?auto_709095 ) ) ( not ( = ?auto_709085 ?auto_709096 ) ) ( not ( = ?auto_709085 ?auto_709097 ) ) ( not ( = ?auto_709085 ?auto_709098 ) ) ( not ( = ?auto_709086 ?auto_709087 ) ) ( not ( = ?auto_709086 ?auto_709088 ) ) ( not ( = ?auto_709086 ?auto_709089 ) ) ( not ( = ?auto_709086 ?auto_709090 ) ) ( not ( = ?auto_709086 ?auto_709091 ) ) ( not ( = ?auto_709086 ?auto_709092 ) ) ( not ( = ?auto_709086 ?auto_709093 ) ) ( not ( = ?auto_709086 ?auto_709094 ) ) ( not ( = ?auto_709086 ?auto_709095 ) ) ( not ( = ?auto_709086 ?auto_709096 ) ) ( not ( = ?auto_709086 ?auto_709097 ) ) ( not ( = ?auto_709086 ?auto_709098 ) ) ( not ( = ?auto_709087 ?auto_709088 ) ) ( not ( = ?auto_709087 ?auto_709089 ) ) ( not ( = ?auto_709087 ?auto_709090 ) ) ( not ( = ?auto_709087 ?auto_709091 ) ) ( not ( = ?auto_709087 ?auto_709092 ) ) ( not ( = ?auto_709087 ?auto_709093 ) ) ( not ( = ?auto_709087 ?auto_709094 ) ) ( not ( = ?auto_709087 ?auto_709095 ) ) ( not ( = ?auto_709087 ?auto_709096 ) ) ( not ( = ?auto_709087 ?auto_709097 ) ) ( not ( = ?auto_709087 ?auto_709098 ) ) ( not ( = ?auto_709088 ?auto_709089 ) ) ( not ( = ?auto_709088 ?auto_709090 ) ) ( not ( = ?auto_709088 ?auto_709091 ) ) ( not ( = ?auto_709088 ?auto_709092 ) ) ( not ( = ?auto_709088 ?auto_709093 ) ) ( not ( = ?auto_709088 ?auto_709094 ) ) ( not ( = ?auto_709088 ?auto_709095 ) ) ( not ( = ?auto_709088 ?auto_709096 ) ) ( not ( = ?auto_709088 ?auto_709097 ) ) ( not ( = ?auto_709088 ?auto_709098 ) ) ( not ( = ?auto_709089 ?auto_709090 ) ) ( not ( = ?auto_709089 ?auto_709091 ) ) ( not ( = ?auto_709089 ?auto_709092 ) ) ( not ( = ?auto_709089 ?auto_709093 ) ) ( not ( = ?auto_709089 ?auto_709094 ) ) ( not ( = ?auto_709089 ?auto_709095 ) ) ( not ( = ?auto_709089 ?auto_709096 ) ) ( not ( = ?auto_709089 ?auto_709097 ) ) ( not ( = ?auto_709089 ?auto_709098 ) ) ( not ( = ?auto_709090 ?auto_709091 ) ) ( not ( = ?auto_709090 ?auto_709092 ) ) ( not ( = ?auto_709090 ?auto_709093 ) ) ( not ( = ?auto_709090 ?auto_709094 ) ) ( not ( = ?auto_709090 ?auto_709095 ) ) ( not ( = ?auto_709090 ?auto_709096 ) ) ( not ( = ?auto_709090 ?auto_709097 ) ) ( not ( = ?auto_709090 ?auto_709098 ) ) ( not ( = ?auto_709091 ?auto_709092 ) ) ( not ( = ?auto_709091 ?auto_709093 ) ) ( not ( = ?auto_709091 ?auto_709094 ) ) ( not ( = ?auto_709091 ?auto_709095 ) ) ( not ( = ?auto_709091 ?auto_709096 ) ) ( not ( = ?auto_709091 ?auto_709097 ) ) ( not ( = ?auto_709091 ?auto_709098 ) ) ( not ( = ?auto_709092 ?auto_709093 ) ) ( not ( = ?auto_709092 ?auto_709094 ) ) ( not ( = ?auto_709092 ?auto_709095 ) ) ( not ( = ?auto_709092 ?auto_709096 ) ) ( not ( = ?auto_709092 ?auto_709097 ) ) ( not ( = ?auto_709092 ?auto_709098 ) ) ( not ( = ?auto_709093 ?auto_709094 ) ) ( not ( = ?auto_709093 ?auto_709095 ) ) ( not ( = ?auto_709093 ?auto_709096 ) ) ( not ( = ?auto_709093 ?auto_709097 ) ) ( not ( = ?auto_709093 ?auto_709098 ) ) ( not ( = ?auto_709094 ?auto_709095 ) ) ( not ( = ?auto_709094 ?auto_709096 ) ) ( not ( = ?auto_709094 ?auto_709097 ) ) ( not ( = ?auto_709094 ?auto_709098 ) ) ( not ( = ?auto_709095 ?auto_709096 ) ) ( not ( = ?auto_709095 ?auto_709097 ) ) ( not ( = ?auto_709095 ?auto_709098 ) ) ( not ( = ?auto_709096 ?auto_709097 ) ) ( not ( = ?auto_709096 ?auto_709098 ) ) ( not ( = ?auto_709097 ?auto_709098 ) ) ( ON ?auto_709097 ?auto_709098 ) ( ON ?auto_709096 ?auto_709097 ) ( ON ?auto_709095 ?auto_709096 ) ( ON ?auto_709094 ?auto_709095 ) ( ON ?auto_709093 ?auto_709094 ) ( CLEAR ?auto_709091 ) ( ON ?auto_709092 ?auto_709093 ) ( CLEAR ?auto_709092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_709082 ?auto_709083 ?auto_709084 ?auto_709085 ?auto_709086 ?auto_709087 ?auto_709088 ?auto_709089 ?auto_709090 ?auto_709091 ?auto_709092 )
      ( MAKE-17PILE ?auto_709082 ?auto_709083 ?auto_709084 ?auto_709085 ?auto_709086 ?auto_709087 ?auto_709088 ?auto_709089 ?auto_709090 ?auto_709091 ?auto_709092 ?auto_709093 ?auto_709094 ?auto_709095 ?auto_709096 ?auto_709097 ?auto_709098 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709116 - BLOCK
      ?auto_709117 - BLOCK
      ?auto_709118 - BLOCK
      ?auto_709119 - BLOCK
      ?auto_709120 - BLOCK
      ?auto_709121 - BLOCK
      ?auto_709122 - BLOCK
      ?auto_709123 - BLOCK
      ?auto_709124 - BLOCK
      ?auto_709125 - BLOCK
      ?auto_709126 - BLOCK
      ?auto_709127 - BLOCK
      ?auto_709128 - BLOCK
      ?auto_709129 - BLOCK
      ?auto_709130 - BLOCK
      ?auto_709131 - BLOCK
      ?auto_709132 - BLOCK
    )
    :vars
    (
      ?auto_709133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709132 ?auto_709133 ) ( ON-TABLE ?auto_709116 ) ( ON ?auto_709117 ?auto_709116 ) ( ON ?auto_709118 ?auto_709117 ) ( ON ?auto_709119 ?auto_709118 ) ( ON ?auto_709120 ?auto_709119 ) ( ON ?auto_709121 ?auto_709120 ) ( ON ?auto_709122 ?auto_709121 ) ( ON ?auto_709123 ?auto_709122 ) ( ON ?auto_709124 ?auto_709123 ) ( not ( = ?auto_709116 ?auto_709117 ) ) ( not ( = ?auto_709116 ?auto_709118 ) ) ( not ( = ?auto_709116 ?auto_709119 ) ) ( not ( = ?auto_709116 ?auto_709120 ) ) ( not ( = ?auto_709116 ?auto_709121 ) ) ( not ( = ?auto_709116 ?auto_709122 ) ) ( not ( = ?auto_709116 ?auto_709123 ) ) ( not ( = ?auto_709116 ?auto_709124 ) ) ( not ( = ?auto_709116 ?auto_709125 ) ) ( not ( = ?auto_709116 ?auto_709126 ) ) ( not ( = ?auto_709116 ?auto_709127 ) ) ( not ( = ?auto_709116 ?auto_709128 ) ) ( not ( = ?auto_709116 ?auto_709129 ) ) ( not ( = ?auto_709116 ?auto_709130 ) ) ( not ( = ?auto_709116 ?auto_709131 ) ) ( not ( = ?auto_709116 ?auto_709132 ) ) ( not ( = ?auto_709116 ?auto_709133 ) ) ( not ( = ?auto_709117 ?auto_709118 ) ) ( not ( = ?auto_709117 ?auto_709119 ) ) ( not ( = ?auto_709117 ?auto_709120 ) ) ( not ( = ?auto_709117 ?auto_709121 ) ) ( not ( = ?auto_709117 ?auto_709122 ) ) ( not ( = ?auto_709117 ?auto_709123 ) ) ( not ( = ?auto_709117 ?auto_709124 ) ) ( not ( = ?auto_709117 ?auto_709125 ) ) ( not ( = ?auto_709117 ?auto_709126 ) ) ( not ( = ?auto_709117 ?auto_709127 ) ) ( not ( = ?auto_709117 ?auto_709128 ) ) ( not ( = ?auto_709117 ?auto_709129 ) ) ( not ( = ?auto_709117 ?auto_709130 ) ) ( not ( = ?auto_709117 ?auto_709131 ) ) ( not ( = ?auto_709117 ?auto_709132 ) ) ( not ( = ?auto_709117 ?auto_709133 ) ) ( not ( = ?auto_709118 ?auto_709119 ) ) ( not ( = ?auto_709118 ?auto_709120 ) ) ( not ( = ?auto_709118 ?auto_709121 ) ) ( not ( = ?auto_709118 ?auto_709122 ) ) ( not ( = ?auto_709118 ?auto_709123 ) ) ( not ( = ?auto_709118 ?auto_709124 ) ) ( not ( = ?auto_709118 ?auto_709125 ) ) ( not ( = ?auto_709118 ?auto_709126 ) ) ( not ( = ?auto_709118 ?auto_709127 ) ) ( not ( = ?auto_709118 ?auto_709128 ) ) ( not ( = ?auto_709118 ?auto_709129 ) ) ( not ( = ?auto_709118 ?auto_709130 ) ) ( not ( = ?auto_709118 ?auto_709131 ) ) ( not ( = ?auto_709118 ?auto_709132 ) ) ( not ( = ?auto_709118 ?auto_709133 ) ) ( not ( = ?auto_709119 ?auto_709120 ) ) ( not ( = ?auto_709119 ?auto_709121 ) ) ( not ( = ?auto_709119 ?auto_709122 ) ) ( not ( = ?auto_709119 ?auto_709123 ) ) ( not ( = ?auto_709119 ?auto_709124 ) ) ( not ( = ?auto_709119 ?auto_709125 ) ) ( not ( = ?auto_709119 ?auto_709126 ) ) ( not ( = ?auto_709119 ?auto_709127 ) ) ( not ( = ?auto_709119 ?auto_709128 ) ) ( not ( = ?auto_709119 ?auto_709129 ) ) ( not ( = ?auto_709119 ?auto_709130 ) ) ( not ( = ?auto_709119 ?auto_709131 ) ) ( not ( = ?auto_709119 ?auto_709132 ) ) ( not ( = ?auto_709119 ?auto_709133 ) ) ( not ( = ?auto_709120 ?auto_709121 ) ) ( not ( = ?auto_709120 ?auto_709122 ) ) ( not ( = ?auto_709120 ?auto_709123 ) ) ( not ( = ?auto_709120 ?auto_709124 ) ) ( not ( = ?auto_709120 ?auto_709125 ) ) ( not ( = ?auto_709120 ?auto_709126 ) ) ( not ( = ?auto_709120 ?auto_709127 ) ) ( not ( = ?auto_709120 ?auto_709128 ) ) ( not ( = ?auto_709120 ?auto_709129 ) ) ( not ( = ?auto_709120 ?auto_709130 ) ) ( not ( = ?auto_709120 ?auto_709131 ) ) ( not ( = ?auto_709120 ?auto_709132 ) ) ( not ( = ?auto_709120 ?auto_709133 ) ) ( not ( = ?auto_709121 ?auto_709122 ) ) ( not ( = ?auto_709121 ?auto_709123 ) ) ( not ( = ?auto_709121 ?auto_709124 ) ) ( not ( = ?auto_709121 ?auto_709125 ) ) ( not ( = ?auto_709121 ?auto_709126 ) ) ( not ( = ?auto_709121 ?auto_709127 ) ) ( not ( = ?auto_709121 ?auto_709128 ) ) ( not ( = ?auto_709121 ?auto_709129 ) ) ( not ( = ?auto_709121 ?auto_709130 ) ) ( not ( = ?auto_709121 ?auto_709131 ) ) ( not ( = ?auto_709121 ?auto_709132 ) ) ( not ( = ?auto_709121 ?auto_709133 ) ) ( not ( = ?auto_709122 ?auto_709123 ) ) ( not ( = ?auto_709122 ?auto_709124 ) ) ( not ( = ?auto_709122 ?auto_709125 ) ) ( not ( = ?auto_709122 ?auto_709126 ) ) ( not ( = ?auto_709122 ?auto_709127 ) ) ( not ( = ?auto_709122 ?auto_709128 ) ) ( not ( = ?auto_709122 ?auto_709129 ) ) ( not ( = ?auto_709122 ?auto_709130 ) ) ( not ( = ?auto_709122 ?auto_709131 ) ) ( not ( = ?auto_709122 ?auto_709132 ) ) ( not ( = ?auto_709122 ?auto_709133 ) ) ( not ( = ?auto_709123 ?auto_709124 ) ) ( not ( = ?auto_709123 ?auto_709125 ) ) ( not ( = ?auto_709123 ?auto_709126 ) ) ( not ( = ?auto_709123 ?auto_709127 ) ) ( not ( = ?auto_709123 ?auto_709128 ) ) ( not ( = ?auto_709123 ?auto_709129 ) ) ( not ( = ?auto_709123 ?auto_709130 ) ) ( not ( = ?auto_709123 ?auto_709131 ) ) ( not ( = ?auto_709123 ?auto_709132 ) ) ( not ( = ?auto_709123 ?auto_709133 ) ) ( not ( = ?auto_709124 ?auto_709125 ) ) ( not ( = ?auto_709124 ?auto_709126 ) ) ( not ( = ?auto_709124 ?auto_709127 ) ) ( not ( = ?auto_709124 ?auto_709128 ) ) ( not ( = ?auto_709124 ?auto_709129 ) ) ( not ( = ?auto_709124 ?auto_709130 ) ) ( not ( = ?auto_709124 ?auto_709131 ) ) ( not ( = ?auto_709124 ?auto_709132 ) ) ( not ( = ?auto_709124 ?auto_709133 ) ) ( not ( = ?auto_709125 ?auto_709126 ) ) ( not ( = ?auto_709125 ?auto_709127 ) ) ( not ( = ?auto_709125 ?auto_709128 ) ) ( not ( = ?auto_709125 ?auto_709129 ) ) ( not ( = ?auto_709125 ?auto_709130 ) ) ( not ( = ?auto_709125 ?auto_709131 ) ) ( not ( = ?auto_709125 ?auto_709132 ) ) ( not ( = ?auto_709125 ?auto_709133 ) ) ( not ( = ?auto_709126 ?auto_709127 ) ) ( not ( = ?auto_709126 ?auto_709128 ) ) ( not ( = ?auto_709126 ?auto_709129 ) ) ( not ( = ?auto_709126 ?auto_709130 ) ) ( not ( = ?auto_709126 ?auto_709131 ) ) ( not ( = ?auto_709126 ?auto_709132 ) ) ( not ( = ?auto_709126 ?auto_709133 ) ) ( not ( = ?auto_709127 ?auto_709128 ) ) ( not ( = ?auto_709127 ?auto_709129 ) ) ( not ( = ?auto_709127 ?auto_709130 ) ) ( not ( = ?auto_709127 ?auto_709131 ) ) ( not ( = ?auto_709127 ?auto_709132 ) ) ( not ( = ?auto_709127 ?auto_709133 ) ) ( not ( = ?auto_709128 ?auto_709129 ) ) ( not ( = ?auto_709128 ?auto_709130 ) ) ( not ( = ?auto_709128 ?auto_709131 ) ) ( not ( = ?auto_709128 ?auto_709132 ) ) ( not ( = ?auto_709128 ?auto_709133 ) ) ( not ( = ?auto_709129 ?auto_709130 ) ) ( not ( = ?auto_709129 ?auto_709131 ) ) ( not ( = ?auto_709129 ?auto_709132 ) ) ( not ( = ?auto_709129 ?auto_709133 ) ) ( not ( = ?auto_709130 ?auto_709131 ) ) ( not ( = ?auto_709130 ?auto_709132 ) ) ( not ( = ?auto_709130 ?auto_709133 ) ) ( not ( = ?auto_709131 ?auto_709132 ) ) ( not ( = ?auto_709131 ?auto_709133 ) ) ( not ( = ?auto_709132 ?auto_709133 ) ) ( ON ?auto_709131 ?auto_709132 ) ( ON ?auto_709130 ?auto_709131 ) ( ON ?auto_709129 ?auto_709130 ) ( ON ?auto_709128 ?auto_709129 ) ( ON ?auto_709127 ?auto_709128 ) ( ON ?auto_709126 ?auto_709127 ) ( CLEAR ?auto_709124 ) ( ON ?auto_709125 ?auto_709126 ) ( CLEAR ?auto_709125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_709116 ?auto_709117 ?auto_709118 ?auto_709119 ?auto_709120 ?auto_709121 ?auto_709122 ?auto_709123 ?auto_709124 ?auto_709125 )
      ( MAKE-17PILE ?auto_709116 ?auto_709117 ?auto_709118 ?auto_709119 ?auto_709120 ?auto_709121 ?auto_709122 ?auto_709123 ?auto_709124 ?auto_709125 ?auto_709126 ?auto_709127 ?auto_709128 ?auto_709129 ?auto_709130 ?auto_709131 ?auto_709132 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709151 - BLOCK
      ?auto_709152 - BLOCK
      ?auto_709153 - BLOCK
      ?auto_709154 - BLOCK
      ?auto_709155 - BLOCK
      ?auto_709156 - BLOCK
      ?auto_709157 - BLOCK
      ?auto_709158 - BLOCK
      ?auto_709159 - BLOCK
      ?auto_709160 - BLOCK
      ?auto_709161 - BLOCK
      ?auto_709162 - BLOCK
      ?auto_709163 - BLOCK
      ?auto_709164 - BLOCK
      ?auto_709165 - BLOCK
      ?auto_709166 - BLOCK
      ?auto_709167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709167 ) ( ON-TABLE ?auto_709151 ) ( ON ?auto_709152 ?auto_709151 ) ( ON ?auto_709153 ?auto_709152 ) ( ON ?auto_709154 ?auto_709153 ) ( ON ?auto_709155 ?auto_709154 ) ( ON ?auto_709156 ?auto_709155 ) ( ON ?auto_709157 ?auto_709156 ) ( ON ?auto_709158 ?auto_709157 ) ( ON ?auto_709159 ?auto_709158 ) ( not ( = ?auto_709151 ?auto_709152 ) ) ( not ( = ?auto_709151 ?auto_709153 ) ) ( not ( = ?auto_709151 ?auto_709154 ) ) ( not ( = ?auto_709151 ?auto_709155 ) ) ( not ( = ?auto_709151 ?auto_709156 ) ) ( not ( = ?auto_709151 ?auto_709157 ) ) ( not ( = ?auto_709151 ?auto_709158 ) ) ( not ( = ?auto_709151 ?auto_709159 ) ) ( not ( = ?auto_709151 ?auto_709160 ) ) ( not ( = ?auto_709151 ?auto_709161 ) ) ( not ( = ?auto_709151 ?auto_709162 ) ) ( not ( = ?auto_709151 ?auto_709163 ) ) ( not ( = ?auto_709151 ?auto_709164 ) ) ( not ( = ?auto_709151 ?auto_709165 ) ) ( not ( = ?auto_709151 ?auto_709166 ) ) ( not ( = ?auto_709151 ?auto_709167 ) ) ( not ( = ?auto_709152 ?auto_709153 ) ) ( not ( = ?auto_709152 ?auto_709154 ) ) ( not ( = ?auto_709152 ?auto_709155 ) ) ( not ( = ?auto_709152 ?auto_709156 ) ) ( not ( = ?auto_709152 ?auto_709157 ) ) ( not ( = ?auto_709152 ?auto_709158 ) ) ( not ( = ?auto_709152 ?auto_709159 ) ) ( not ( = ?auto_709152 ?auto_709160 ) ) ( not ( = ?auto_709152 ?auto_709161 ) ) ( not ( = ?auto_709152 ?auto_709162 ) ) ( not ( = ?auto_709152 ?auto_709163 ) ) ( not ( = ?auto_709152 ?auto_709164 ) ) ( not ( = ?auto_709152 ?auto_709165 ) ) ( not ( = ?auto_709152 ?auto_709166 ) ) ( not ( = ?auto_709152 ?auto_709167 ) ) ( not ( = ?auto_709153 ?auto_709154 ) ) ( not ( = ?auto_709153 ?auto_709155 ) ) ( not ( = ?auto_709153 ?auto_709156 ) ) ( not ( = ?auto_709153 ?auto_709157 ) ) ( not ( = ?auto_709153 ?auto_709158 ) ) ( not ( = ?auto_709153 ?auto_709159 ) ) ( not ( = ?auto_709153 ?auto_709160 ) ) ( not ( = ?auto_709153 ?auto_709161 ) ) ( not ( = ?auto_709153 ?auto_709162 ) ) ( not ( = ?auto_709153 ?auto_709163 ) ) ( not ( = ?auto_709153 ?auto_709164 ) ) ( not ( = ?auto_709153 ?auto_709165 ) ) ( not ( = ?auto_709153 ?auto_709166 ) ) ( not ( = ?auto_709153 ?auto_709167 ) ) ( not ( = ?auto_709154 ?auto_709155 ) ) ( not ( = ?auto_709154 ?auto_709156 ) ) ( not ( = ?auto_709154 ?auto_709157 ) ) ( not ( = ?auto_709154 ?auto_709158 ) ) ( not ( = ?auto_709154 ?auto_709159 ) ) ( not ( = ?auto_709154 ?auto_709160 ) ) ( not ( = ?auto_709154 ?auto_709161 ) ) ( not ( = ?auto_709154 ?auto_709162 ) ) ( not ( = ?auto_709154 ?auto_709163 ) ) ( not ( = ?auto_709154 ?auto_709164 ) ) ( not ( = ?auto_709154 ?auto_709165 ) ) ( not ( = ?auto_709154 ?auto_709166 ) ) ( not ( = ?auto_709154 ?auto_709167 ) ) ( not ( = ?auto_709155 ?auto_709156 ) ) ( not ( = ?auto_709155 ?auto_709157 ) ) ( not ( = ?auto_709155 ?auto_709158 ) ) ( not ( = ?auto_709155 ?auto_709159 ) ) ( not ( = ?auto_709155 ?auto_709160 ) ) ( not ( = ?auto_709155 ?auto_709161 ) ) ( not ( = ?auto_709155 ?auto_709162 ) ) ( not ( = ?auto_709155 ?auto_709163 ) ) ( not ( = ?auto_709155 ?auto_709164 ) ) ( not ( = ?auto_709155 ?auto_709165 ) ) ( not ( = ?auto_709155 ?auto_709166 ) ) ( not ( = ?auto_709155 ?auto_709167 ) ) ( not ( = ?auto_709156 ?auto_709157 ) ) ( not ( = ?auto_709156 ?auto_709158 ) ) ( not ( = ?auto_709156 ?auto_709159 ) ) ( not ( = ?auto_709156 ?auto_709160 ) ) ( not ( = ?auto_709156 ?auto_709161 ) ) ( not ( = ?auto_709156 ?auto_709162 ) ) ( not ( = ?auto_709156 ?auto_709163 ) ) ( not ( = ?auto_709156 ?auto_709164 ) ) ( not ( = ?auto_709156 ?auto_709165 ) ) ( not ( = ?auto_709156 ?auto_709166 ) ) ( not ( = ?auto_709156 ?auto_709167 ) ) ( not ( = ?auto_709157 ?auto_709158 ) ) ( not ( = ?auto_709157 ?auto_709159 ) ) ( not ( = ?auto_709157 ?auto_709160 ) ) ( not ( = ?auto_709157 ?auto_709161 ) ) ( not ( = ?auto_709157 ?auto_709162 ) ) ( not ( = ?auto_709157 ?auto_709163 ) ) ( not ( = ?auto_709157 ?auto_709164 ) ) ( not ( = ?auto_709157 ?auto_709165 ) ) ( not ( = ?auto_709157 ?auto_709166 ) ) ( not ( = ?auto_709157 ?auto_709167 ) ) ( not ( = ?auto_709158 ?auto_709159 ) ) ( not ( = ?auto_709158 ?auto_709160 ) ) ( not ( = ?auto_709158 ?auto_709161 ) ) ( not ( = ?auto_709158 ?auto_709162 ) ) ( not ( = ?auto_709158 ?auto_709163 ) ) ( not ( = ?auto_709158 ?auto_709164 ) ) ( not ( = ?auto_709158 ?auto_709165 ) ) ( not ( = ?auto_709158 ?auto_709166 ) ) ( not ( = ?auto_709158 ?auto_709167 ) ) ( not ( = ?auto_709159 ?auto_709160 ) ) ( not ( = ?auto_709159 ?auto_709161 ) ) ( not ( = ?auto_709159 ?auto_709162 ) ) ( not ( = ?auto_709159 ?auto_709163 ) ) ( not ( = ?auto_709159 ?auto_709164 ) ) ( not ( = ?auto_709159 ?auto_709165 ) ) ( not ( = ?auto_709159 ?auto_709166 ) ) ( not ( = ?auto_709159 ?auto_709167 ) ) ( not ( = ?auto_709160 ?auto_709161 ) ) ( not ( = ?auto_709160 ?auto_709162 ) ) ( not ( = ?auto_709160 ?auto_709163 ) ) ( not ( = ?auto_709160 ?auto_709164 ) ) ( not ( = ?auto_709160 ?auto_709165 ) ) ( not ( = ?auto_709160 ?auto_709166 ) ) ( not ( = ?auto_709160 ?auto_709167 ) ) ( not ( = ?auto_709161 ?auto_709162 ) ) ( not ( = ?auto_709161 ?auto_709163 ) ) ( not ( = ?auto_709161 ?auto_709164 ) ) ( not ( = ?auto_709161 ?auto_709165 ) ) ( not ( = ?auto_709161 ?auto_709166 ) ) ( not ( = ?auto_709161 ?auto_709167 ) ) ( not ( = ?auto_709162 ?auto_709163 ) ) ( not ( = ?auto_709162 ?auto_709164 ) ) ( not ( = ?auto_709162 ?auto_709165 ) ) ( not ( = ?auto_709162 ?auto_709166 ) ) ( not ( = ?auto_709162 ?auto_709167 ) ) ( not ( = ?auto_709163 ?auto_709164 ) ) ( not ( = ?auto_709163 ?auto_709165 ) ) ( not ( = ?auto_709163 ?auto_709166 ) ) ( not ( = ?auto_709163 ?auto_709167 ) ) ( not ( = ?auto_709164 ?auto_709165 ) ) ( not ( = ?auto_709164 ?auto_709166 ) ) ( not ( = ?auto_709164 ?auto_709167 ) ) ( not ( = ?auto_709165 ?auto_709166 ) ) ( not ( = ?auto_709165 ?auto_709167 ) ) ( not ( = ?auto_709166 ?auto_709167 ) ) ( ON ?auto_709166 ?auto_709167 ) ( ON ?auto_709165 ?auto_709166 ) ( ON ?auto_709164 ?auto_709165 ) ( ON ?auto_709163 ?auto_709164 ) ( ON ?auto_709162 ?auto_709163 ) ( ON ?auto_709161 ?auto_709162 ) ( CLEAR ?auto_709159 ) ( ON ?auto_709160 ?auto_709161 ) ( CLEAR ?auto_709160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_709151 ?auto_709152 ?auto_709153 ?auto_709154 ?auto_709155 ?auto_709156 ?auto_709157 ?auto_709158 ?auto_709159 ?auto_709160 )
      ( MAKE-17PILE ?auto_709151 ?auto_709152 ?auto_709153 ?auto_709154 ?auto_709155 ?auto_709156 ?auto_709157 ?auto_709158 ?auto_709159 ?auto_709160 ?auto_709161 ?auto_709162 ?auto_709163 ?auto_709164 ?auto_709165 ?auto_709166 ?auto_709167 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709185 - BLOCK
      ?auto_709186 - BLOCK
      ?auto_709187 - BLOCK
      ?auto_709188 - BLOCK
      ?auto_709189 - BLOCK
      ?auto_709190 - BLOCK
      ?auto_709191 - BLOCK
      ?auto_709192 - BLOCK
      ?auto_709193 - BLOCK
      ?auto_709194 - BLOCK
      ?auto_709195 - BLOCK
      ?auto_709196 - BLOCK
      ?auto_709197 - BLOCK
      ?auto_709198 - BLOCK
      ?auto_709199 - BLOCK
      ?auto_709200 - BLOCK
      ?auto_709201 - BLOCK
    )
    :vars
    (
      ?auto_709202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709201 ?auto_709202 ) ( ON-TABLE ?auto_709185 ) ( ON ?auto_709186 ?auto_709185 ) ( ON ?auto_709187 ?auto_709186 ) ( ON ?auto_709188 ?auto_709187 ) ( ON ?auto_709189 ?auto_709188 ) ( ON ?auto_709190 ?auto_709189 ) ( ON ?auto_709191 ?auto_709190 ) ( ON ?auto_709192 ?auto_709191 ) ( not ( = ?auto_709185 ?auto_709186 ) ) ( not ( = ?auto_709185 ?auto_709187 ) ) ( not ( = ?auto_709185 ?auto_709188 ) ) ( not ( = ?auto_709185 ?auto_709189 ) ) ( not ( = ?auto_709185 ?auto_709190 ) ) ( not ( = ?auto_709185 ?auto_709191 ) ) ( not ( = ?auto_709185 ?auto_709192 ) ) ( not ( = ?auto_709185 ?auto_709193 ) ) ( not ( = ?auto_709185 ?auto_709194 ) ) ( not ( = ?auto_709185 ?auto_709195 ) ) ( not ( = ?auto_709185 ?auto_709196 ) ) ( not ( = ?auto_709185 ?auto_709197 ) ) ( not ( = ?auto_709185 ?auto_709198 ) ) ( not ( = ?auto_709185 ?auto_709199 ) ) ( not ( = ?auto_709185 ?auto_709200 ) ) ( not ( = ?auto_709185 ?auto_709201 ) ) ( not ( = ?auto_709185 ?auto_709202 ) ) ( not ( = ?auto_709186 ?auto_709187 ) ) ( not ( = ?auto_709186 ?auto_709188 ) ) ( not ( = ?auto_709186 ?auto_709189 ) ) ( not ( = ?auto_709186 ?auto_709190 ) ) ( not ( = ?auto_709186 ?auto_709191 ) ) ( not ( = ?auto_709186 ?auto_709192 ) ) ( not ( = ?auto_709186 ?auto_709193 ) ) ( not ( = ?auto_709186 ?auto_709194 ) ) ( not ( = ?auto_709186 ?auto_709195 ) ) ( not ( = ?auto_709186 ?auto_709196 ) ) ( not ( = ?auto_709186 ?auto_709197 ) ) ( not ( = ?auto_709186 ?auto_709198 ) ) ( not ( = ?auto_709186 ?auto_709199 ) ) ( not ( = ?auto_709186 ?auto_709200 ) ) ( not ( = ?auto_709186 ?auto_709201 ) ) ( not ( = ?auto_709186 ?auto_709202 ) ) ( not ( = ?auto_709187 ?auto_709188 ) ) ( not ( = ?auto_709187 ?auto_709189 ) ) ( not ( = ?auto_709187 ?auto_709190 ) ) ( not ( = ?auto_709187 ?auto_709191 ) ) ( not ( = ?auto_709187 ?auto_709192 ) ) ( not ( = ?auto_709187 ?auto_709193 ) ) ( not ( = ?auto_709187 ?auto_709194 ) ) ( not ( = ?auto_709187 ?auto_709195 ) ) ( not ( = ?auto_709187 ?auto_709196 ) ) ( not ( = ?auto_709187 ?auto_709197 ) ) ( not ( = ?auto_709187 ?auto_709198 ) ) ( not ( = ?auto_709187 ?auto_709199 ) ) ( not ( = ?auto_709187 ?auto_709200 ) ) ( not ( = ?auto_709187 ?auto_709201 ) ) ( not ( = ?auto_709187 ?auto_709202 ) ) ( not ( = ?auto_709188 ?auto_709189 ) ) ( not ( = ?auto_709188 ?auto_709190 ) ) ( not ( = ?auto_709188 ?auto_709191 ) ) ( not ( = ?auto_709188 ?auto_709192 ) ) ( not ( = ?auto_709188 ?auto_709193 ) ) ( not ( = ?auto_709188 ?auto_709194 ) ) ( not ( = ?auto_709188 ?auto_709195 ) ) ( not ( = ?auto_709188 ?auto_709196 ) ) ( not ( = ?auto_709188 ?auto_709197 ) ) ( not ( = ?auto_709188 ?auto_709198 ) ) ( not ( = ?auto_709188 ?auto_709199 ) ) ( not ( = ?auto_709188 ?auto_709200 ) ) ( not ( = ?auto_709188 ?auto_709201 ) ) ( not ( = ?auto_709188 ?auto_709202 ) ) ( not ( = ?auto_709189 ?auto_709190 ) ) ( not ( = ?auto_709189 ?auto_709191 ) ) ( not ( = ?auto_709189 ?auto_709192 ) ) ( not ( = ?auto_709189 ?auto_709193 ) ) ( not ( = ?auto_709189 ?auto_709194 ) ) ( not ( = ?auto_709189 ?auto_709195 ) ) ( not ( = ?auto_709189 ?auto_709196 ) ) ( not ( = ?auto_709189 ?auto_709197 ) ) ( not ( = ?auto_709189 ?auto_709198 ) ) ( not ( = ?auto_709189 ?auto_709199 ) ) ( not ( = ?auto_709189 ?auto_709200 ) ) ( not ( = ?auto_709189 ?auto_709201 ) ) ( not ( = ?auto_709189 ?auto_709202 ) ) ( not ( = ?auto_709190 ?auto_709191 ) ) ( not ( = ?auto_709190 ?auto_709192 ) ) ( not ( = ?auto_709190 ?auto_709193 ) ) ( not ( = ?auto_709190 ?auto_709194 ) ) ( not ( = ?auto_709190 ?auto_709195 ) ) ( not ( = ?auto_709190 ?auto_709196 ) ) ( not ( = ?auto_709190 ?auto_709197 ) ) ( not ( = ?auto_709190 ?auto_709198 ) ) ( not ( = ?auto_709190 ?auto_709199 ) ) ( not ( = ?auto_709190 ?auto_709200 ) ) ( not ( = ?auto_709190 ?auto_709201 ) ) ( not ( = ?auto_709190 ?auto_709202 ) ) ( not ( = ?auto_709191 ?auto_709192 ) ) ( not ( = ?auto_709191 ?auto_709193 ) ) ( not ( = ?auto_709191 ?auto_709194 ) ) ( not ( = ?auto_709191 ?auto_709195 ) ) ( not ( = ?auto_709191 ?auto_709196 ) ) ( not ( = ?auto_709191 ?auto_709197 ) ) ( not ( = ?auto_709191 ?auto_709198 ) ) ( not ( = ?auto_709191 ?auto_709199 ) ) ( not ( = ?auto_709191 ?auto_709200 ) ) ( not ( = ?auto_709191 ?auto_709201 ) ) ( not ( = ?auto_709191 ?auto_709202 ) ) ( not ( = ?auto_709192 ?auto_709193 ) ) ( not ( = ?auto_709192 ?auto_709194 ) ) ( not ( = ?auto_709192 ?auto_709195 ) ) ( not ( = ?auto_709192 ?auto_709196 ) ) ( not ( = ?auto_709192 ?auto_709197 ) ) ( not ( = ?auto_709192 ?auto_709198 ) ) ( not ( = ?auto_709192 ?auto_709199 ) ) ( not ( = ?auto_709192 ?auto_709200 ) ) ( not ( = ?auto_709192 ?auto_709201 ) ) ( not ( = ?auto_709192 ?auto_709202 ) ) ( not ( = ?auto_709193 ?auto_709194 ) ) ( not ( = ?auto_709193 ?auto_709195 ) ) ( not ( = ?auto_709193 ?auto_709196 ) ) ( not ( = ?auto_709193 ?auto_709197 ) ) ( not ( = ?auto_709193 ?auto_709198 ) ) ( not ( = ?auto_709193 ?auto_709199 ) ) ( not ( = ?auto_709193 ?auto_709200 ) ) ( not ( = ?auto_709193 ?auto_709201 ) ) ( not ( = ?auto_709193 ?auto_709202 ) ) ( not ( = ?auto_709194 ?auto_709195 ) ) ( not ( = ?auto_709194 ?auto_709196 ) ) ( not ( = ?auto_709194 ?auto_709197 ) ) ( not ( = ?auto_709194 ?auto_709198 ) ) ( not ( = ?auto_709194 ?auto_709199 ) ) ( not ( = ?auto_709194 ?auto_709200 ) ) ( not ( = ?auto_709194 ?auto_709201 ) ) ( not ( = ?auto_709194 ?auto_709202 ) ) ( not ( = ?auto_709195 ?auto_709196 ) ) ( not ( = ?auto_709195 ?auto_709197 ) ) ( not ( = ?auto_709195 ?auto_709198 ) ) ( not ( = ?auto_709195 ?auto_709199 ) ) ( not ( = ?auto_709195 ?auto_709200 ) ) ( not ( = ?auto_709195 ?auto_709201 ) ) ( not ( = ?auto_709195 ?auto_709202 ) ) ( not ( = ?auto_709196 ?auto_709197 ) ) ( not ( = ?auto_709196 ?auto_709198 ) ) ( not ( = ?auto_709196 ?auto_709199 ) ) ( not ( = ?auto_709196 ?auto_709200 ) ) ( not ( = ?auto_709196 ?auto_709201 ) ) ( not ( = ?auto_709196 ?auto_709202 ) ) ( not ( = ?auto_709197 ?auto_709198 ) ) ( not ( = ?auto_709197 ?auto_709199 ) ) ( not ( = ?auto_709197 ?auto_709200 ) ) ( not ( = ?auto_709197 ?auto_709201 ) ) ( not ( = ?auto_709197 ?auto_709202 ) ) ( not ( = ?auto_709198 ?auto_709199 ) ) ( not ( = ?auto_709198 ?auto_709200 ) ) ( not ( = ?auto_709198 ?auto_709201 ) ) ( not ( = ?auto_709198 ?auto_709202 ) ) ( not ( = ?auto_709199 ?auto_709200 ) ) ( not ( = ?auto_709199 ?auto_709201 ) ) ( not ( = ?auto_709199 ?auto_709202 ) ) ( not ( = ?auto_709200 ?auto_709201 ) ) ( not ( = ?auto_709200 ?auto_709202 ) ) ( not ( = ?auto_709201 ?auto_709202 ) ) ( ON ?auto_709200 ?auto_709201 ) ( ON ?auto_709199 ?auto_709200 ) ( ON ?auto_709198 ?auto_709199 ) ( ON ?auto_709197 ?auto_709198 ) ( ON ?auto_709196 ?auto_709197 ) ( ON ?auto_709195 ?auto_709196 ) ( ON ?auto_709194 ?auto_709195 ) ( CLEAR ?auto_709192 ) ( ON ?auto_709193 ?auto_709194 ) ( CLEAR ?auto_709193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_709185 ?auto_709186 ?auto_709187 ?auto_709188 ?auto_709189 ?auto_709190 ?auto_709191 ?auto_709192 ?auto_709193 )
      ( MAKE-17PILE ?auto_709185 ?auto_709186 ?auto_709187 ?auto_709188 ?auto_709189 ?auto_709190 ?auto_709191 ?auto_709192 ?auto_709193 ?auto_709194 ?auto_709195 ?auto_709196 ?auto_709197 ?auto_709198 ?auto_709199 ?auto_709200 ?auto_709201 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709220 - BLOCK
      ?auto_709221 - BLOCK
      ?auto_709222 - BLOCK
      ?auto_709223 - BLOCK
      ?auto_709224 - BLOCK
      ?auto_709225 - BLOCK
      ?auto_709226 - BLOCK
      ?auto_709227 - BLOCK
      ?auto_709228 - BLOCK
      ?auto_709229 - BLOCK
      ?auto_709230 - BLOCK
      ?auto_709231 - BLOCK
      ?auto_709232 - BLOCK
      ?auto_709233 - BLOCK
      ?auto_709234 - BLOCK
      ?auto_709235 - BLOCK
      ?auto_709236 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709236 ) ( ON-TABLE ?auto_709220 ) ( ON ?auto_709221 ?auto_709220 ) ( ON ?auto_709222 ?auto_709221 ) ( ON ?auto_709223 ?auto_709222 ) ( ON ?auto_709224 ?auto_709223 ) ( ON ?auto_709225 ?auto_709224 ) ( ON ?auto_709226 ?auto_709225 ) ( ON ?auto_709227 ?auto_709226 ) ( not ( = ?auto_709220 ?auto_709221 ) ) ( not ( = ?auto_709220 ?auto_709222 ) ) ( not ( = ?auto_709220 ?auto_709223 ) ) ( not ( = ?auto_709220 ?auto_709224 ) ) ( not ( = ?auto_709220 ?auto_709225 ) ) ( not ( = ?auto_709220 ?auto_709226 ) ) ( not ( = ?auto_709220 ?auto_709227 ) ) ( not ( = ?auto_709220 ?auto_709228 ) ) ( not ( = ?auto_709220 ?auto_709229 ) ) ( not ( = ?auto_709220 ?auto_709230 ) ) ( not ( = ?auto_709220 ?auto_709231 ) ) ( not ( = ?auto_709220 ?auto_709232 ) ) ( not ( = ?auto_709220 ?auto_709233 ) ) ( not ( = ?auto_709220 ?auto_709234 ) ) ( not ( = ?auto_709220 ?auto_709235 ) ) ( not ( = ?auto_709220 ?auto_709236 ) ) ( not ( = ?auto_709221 ?auto_709222 ) ) ( not ( = ?auto_709221 ?auto_709223 ) ) ( not ( = ?auto_709221 ?auto_709224 ) ) ( not ( = ?auto_709221 ?auto_709225 ) ) ( not ( = ?auto_709221 ?auto_709226 ) ) ( not ( = ?auto_709221 ?auto_709227 ) ) ( not ( = ?auto_709221 ?auto_709228 ) ) ( not ( = ?auto_709221 ?auto_709229 ) ) ( not ( = ?auto_709221 ?auto_709230 ) ) ( not ( = ?auto_709221 ?auto_709231 ) ) ( not ( = ?auto_709221 ?auto_709232 ) ) ( not ( = ?auto_709221 ?auto_709233 ) ) ( not ( = ?auto_709221 ?auto_709234 ) ) ( not ( = ?auto_709221 ?auto_709235 ) ) ( not ( = ?auto_709221 ?auto_709236 ) ) ( not ( = ?auto_709222 ?auto_709223 ) ) ( not ( = ?auto_709222 ?auto_709224 ) ) ( not ( = ?auto_709222 ?auto_709225 ) ) ( not ( = ?auto_709222 ?auto_709226 ) ) ( not ( = ?auto_709222 ?auto_709227 ) ) ( not ( = ?auto_709222 ?auto_709228 ) ) ( not ( = ?auto_709222 ?auto_709229 ) ) ( not ( = ?auto_709222 ?auto_709230 ) ) ( not ( = ?auto_709222 ?auto_709231 ) ) ( not ( = ?auto_709222 ?auto_709232 ) ) ( not ( = ?auto_709222 ?auto_709233 ) ) ( not ( = ?auto_709222 ?auto_709234 ) ) ( not ( = ?auto_709222 ?auto_709235 ) ) ( not ( = ?auto_709222 ?auto_709236 ) ) ( not ( = ?auto_709223 ?auto_709224 ) ) ( not ( = ?auto_709223 ?auto_709225 ) ) ( not ( = ?auto_709223 ?auto_709226 ) ) ( not ( = ?auto_709223 ?auto_709227 ) ) ( not ( = ?auto_709223 ?auto_709228 ) ) ( not ( = ?auto_709223 ?auto_709229 ) ) ( not ( = ?auto_709223 ?auto_709230 ) ) ( not ( = ?auto_709223 ?auto_709231 ) ) ( not ( = ?auto_709223 ?auto_709232 ) ) ( not ( = ?auto_709223 ?auto_709233 ) ) ( not ( = ?auto_709223 ?auto_709234 ) ) ( not ( = ?auto_709223 ?auto_709235 ) ) ( not ( = ?auto_709223 ?auto_709236 ) ) ( not ( = ?auto_709224 ?auto_709225 ) ) ( not ( = ?auto_709224 ?auto_709226 ) ) ( not ( = ?auto_709224 ?auto_709227 ) ) ( not ( = ?auto_709224 ?auto_709228 ) ) ( not ( = ?auto_709224 ?auto_709229 ) ) ( not ( = ?auto_709224 ?auto_709230 ) ) ( not ( = ?auto_709224 ?auto_709231 ) ) ( not ( = ?auto_709224 ?auto_709232 ) ) ( not ( = ?auto_709224 ?auto_709233 ) ) ( not ( = ?auto_709224 ?auto_709234 ) ) ( not ( = ?auto_709224 ?auto_709235 ) ) ( not ( = ?auto_709224 ?auto_709236 ) ) ( not ( = ?auto_709225 ?auto_709226 ) ) ( not ( = ?auto_709225 ?auto_709227 ) ) ( not ( = ?auto_709225 ?auto_709228 ) ) ( not ( = ?auto_709225 ?auto_709229 ) ) ( not ( = ?auto_709225 ?auto_709230 ) ) ( not ( = ?auto_709225 ?auto_709231 ) ) ( not ( = ?auto_709225 ?auto_709232 ) ) ( not ( = ?auto_709225 ?auto_709233 ) ) ( not ( = ?auto_709225 ?auto_709234 ) ) ( not ( = ?auto_709225 ?auto_709235 ) ) ( not ( = ?auto_709225 ?auto_709236 ) ) ( not ( = ?auto_709226 ?auto_709227 ) ) ( not ( = ?auto_709226 ?auto_709228 ) ) ( not ( = ?auto_709226 ?auto_709229 ) ) ( not ( = ?auto_709226 ?auto_709230 ) ) ( not ( = ?auto_709226 ?auto_709231 ) ) ( not ( = ?auto_709226 ?auto_709232 ) ) ( not ( = ?auto_709226 ?auto_709233 ) ) ( not ( = ?auto_709226 ?auto_709234 ) ) ( not ( = ?auto_709226 ?auto_709235 ) ) ( not ( = ?auto_709226 ?auto_709236 ) ) ( not ( = ?auto_709227 ?auto_709228 ) ) ( not ( = ?auto_709227 ?auto_709229 ) ) ( not ( = ?auto_709227 ?auto_709230 ) ) ( not ( = ?auto_709227 ?auto_709231 ) ) ( not ( = ?auto_709227 ?auto_709232 ) ) ( not ( = ?auto_709227 ?auto_709233 ) ) ( not ( = ?auto_709227 ?auto_709234 ) ) ( not ( = ?auto_709227 ?auto_709235 ) ) ( not ( = ?auto_709227 ?auto_709236 ) ) ( not ( = ?auto_709228 ?auto_709229 ) ) ( not ( = ?auto_709228 ?auto_709230 ) ) ( not ( = ?auto_709228 ?auto_709231 ) ) ( not ( = ?auto_709228 ?auto_709232 ) ) ( not ( = ?auto_709228 ?auto_709233 ) ) ( not ( = ?auto_709228 ?auto_709234 ) ) ( not ( = ?auto_709228 ?auto_709235 ) ) ( not ( = ?auto_709228 ?auto_709236 ) ) ( not ( = ?auto_709229 ?auto_709230 ) ) ( not ( = ?auto_709229 ?auto_709231 ) ) ( not ( = ?auto_709229 ?auto_709232 ) ) ( not ( = ?auto_709229 ?auto_709233 ) ) ( not ( = ?auto_709229 ?auto_709234 ) ) ( not ( = ?auto_709229 ?auto_709235 ) ) ( not ( = ?auto_709229 ?auto_709236 ) ) ( not ( = ?auto_709230 ?auto_709231 ) ) ( not ( = ?auto_709230 ?auto_709232 ) ) ( not ( = ?auto_709230 ?auto_709233 ) ) ( not ( = ?auto_709230 ?auto_709234 ) ) ( not ( = ?auto_709230 ?auto_709235 ) ) ( not ( = ?auto_709230 ?auto_709236 ) ) ( not ( = ?auto_709231 ?auto_709232 ) ) ( not ( = ?auto_709231 ?auto_709233 ) ) ( not ( = ?auto_709231 ?auto_709234 ) ) ( not ( = ?auto_709231 ?auto_709235 ) ) ( not ( = ?auto_709231 ?auto_709236 ) ) ( not ( = ?auto_709232 ?auto_709233 ) ) ( not ( = ?auto_709232 ?auto_709234 ) ) ( not ( = ?auto_709232 ?auto_709235 ) ) ( not ( = ?auto_709232 ?auto_709236 ) ) ( not ( = ?auto_709233 ?auto_709234 ) ) ( not ( = ?auto_709233 ?auto_709235 ) ) ( not ( = ?auto_709233 ?auto_709236 ) ) ( not ( = ?auto_709234 ?auto_709235 ) ) ( not ( = ?auto_709234 ?auto_709236 ) ) ( not ( = ?auto_709235 ?auto_709236 ) ) ( ON ?auto_709235 ?auto_709236 ) ( ON ?auto_709234 ?auto_709235 ) ( ON ?auto_709233 ?auto_709234 ) ( ON ?auto_709232 ?auto_709233 ) ( ON ?auto_709231 ?auto_709232 ) ( ON ?auto_709230 ?auto_709231 ) ( ON ?auto_709229 ?auto_709230 ) ( CLEAR ?auto_709227 ) ( ON ?auto_709228 ?auto_709229 ) ( CLEAR ?auto_709228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_709220 ?auto_709221 ?auto_709222 ?auto_709223 ?auto_709224 ?auto_709225 ?auto_709226 ?auto_709227 ?auto_709228 )
      ( MAKE-17PILE ?auto_709220 ?auto_709221 ?auto_709222 ?auto_709223 ?auto_709224 ?auto_709225 ?auto_709226 ?auto_709227 ?auto_709228 ?auto_709229 ?auto_709230 ?auto_709231 ?auto_709232 ?auto_709233 ?auto_709234 ?auto_709235 ?auto_709236 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709254 - BLOCK
      ?auto_709255 - BLOCK
      ?auto_709256 - BLOCK
      ?auto_709257 - BLOCK
      ?auto_709258 - BLOCK
      ?auto_709259 - BLOCK
      ?auto_709260 - BLOCK
      ?auto_709261 - BLOCK
      ?auto_709262 - BLOCK
      ?auto_709263 - BLOCK
      ?auto_709264 - BLOCK
      ?auto_709265 - BLOCK
      ?auto_709266 - BLOCK
      ?auto_709267 - BLOCK
      ?auto_709268 - BLOCK
      ?auto_709269 - BLOCK
      ?auto_709270 - BLOCK
    )
    :vars
    (
      ?auto_709271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709270 ?auto_709271 ) ( ON-TABLE ?auto_709254 ) ( ON ?auto_709255 ?auto_709254 ) ( ON ?auto_709256 ?auto_709255 ) ( ON ?auto_709257 ?auto_709256 ) ( ON ?auto_709258 ?auto_709257 ) ( ON ?auto_709259 ?auto_709258 ) ( ON ?auto_709260 ?auto_709259 ) ( not ( = ?auto_709254 ?auto_709255 ) ) ( not ( = ?auto_709254 ?auto_709256 ) ) ( not ( = ?auto_709254 ?auto_709257 ) ) ( not ( = ?auto_709254 ?auto_709258 ) ) ( not ( = ?auto_709254 ?auto_709259 ) ) ( not ( = ?auto_709254 ?auto_709260 ) ) ( not ( = ?auto_709254 ?auto_709261 ) ) ( not ( = ?auto_709254 ?auto_709262 ) ) ( not ( = ?auto_709254 ?auto_709263 ) ) ( not ( = ?auto_709254 ?auto_709264 ) ) ( not ( = ?auto_709254 ?auto_709265 ) ) ( not ( = ?auto_709254 ?auto_709266 ) ) ( not ( = ?auto_709254 ?auto_709267 ) ) ( not ( = ?auto_709254 ?auto_709268 ) ) ( not ( = ?auto_709254 ?auto_709269 ) ) ( not ( = ?auto_709254 ?auto_709270 ) ) ( not ( = ?auto_709254 ?auto_709271 ) ) ( not ( = ?auto_709255 ?auto_709256 ) ) ( not ( = ?auto_709255 ?auto_709257 ) ) ( not ( = ?auto_709255 ?auto_709258 ) ) ( not ( = ?auto_709255 ?auto_709259 ) ) ( not ( = ?auto_709255 ?auto_709260 ) ) ( not ( = ?auto_709255 ?auto_709261 ) ) ( not ( = ?auto_709255 ?auto_709262 ) ) ( not ( = ?auto_709255 ?auto_709263 ) ) ( not ( = ?auto_709255 ?auto_709264 ) ) ( not ( = ?auto_709255 ?auto_709265 ) ) ( not ( = ?auto_709255 ?auto_709266 ) ) ( not ( = ?auto_709255 ?auto_709267 ) ) ( not ( = ?auto_709255 ?auto_709268 ) ) ( not ( = ?auto_709255 ?auto_709269 ) ) ( not ( = ?auto_709255 ?auto_709270 ) ) ( not ( = ?auto_709255 ?auto_709271 ) ) ( not ( = ?auto_709256 ?auto_709257 ) ) ( not ( = ?auto_709256 ?auto_709258 ) ) ( not ( = ?auto_709256 ?auto_709259 ) ) ( not ( = ?auto_709256 ?auto_709260 ) ) ( not ( = ?auto_709256 ?auto_709261 ) ) ( not ( = ?auto_709256 ?auto_709262 ) ) ( not ( = ?auto_709256 ?auto_709263 ) ) ( not ( = ?auto_709256 ?auto_709264 ) ) ( not ( = ?auto_709256 ?auto_709265 ) ) ( not ( = ?auto_709256 ?auto_709266 ) ) ( not ( = ?auto_709256 ?auto_709267 ) ) ( not ( = ?auto_709256 ?auto_709268 ) ) ( not ( = ?auto_709256 ?auto_709269 ) ) ( not ( = ?auto_709256 ?auto_709270 ) ) ( not ( = ?auto_709256 ?auto_709271 ) ) ( not ( = ?auto_709257 ?auto_709258 ) ) ( not ( = ?auto_709257 ?auto_709259 ) ) ( not ( = ?auto_709257 ?auto_709260 ) ) ( not ( = ?auto_709257 ?auto_709261 ) ) ( not ( = ?auto_709257 ?auto_709262 ) ) ( not ( = ?auto_709257 ?auto_709263 ) ) ( not ( = ?auto_709257 ?auto_709264 ) ) ( not ( = ?auto_709257 ?auto_709265 ) ) ( not ( = ?auto_709257 ?auto_709266 ) ) ( not ( = ?auto_709257 ?auto_709267 ) ) ( not ( = ?auto_709257 ?auto_709268 ) ) ( not ( = ?auto_709257 ?auto_709269 ) ) ( not ( = ?auto_709257 ?auto_709270 ) ) ( not ( = ?auto_709257 ?auto_709271 ) ) ( not ( = ?auto_709258 ?auto_709259 ) ) ( not ( = ?auto_709258 ?auto_709260 ) ) ( not ( = ?auto_709258 ?auto_709261 ) ) ( not ( = ?auto_709258 ?auto_709262 ) ) ( not ( = ?auto_709258 ?auto_709263 ) ) ( not ( = ?auto_709258 ?auto_709264 ) ) ( not ( = ?auto_709258 ?auto_709265 ) ) ( not ( = ?auto_709258 ?auto_709266 ) ) ( not ( = ?auto_709258 ?auto_709267 ) ) ( not ( = ?auto_709258 ?auto_709268 ) ) ( not ( = ?auto_709258 ?auto_709269 ) ) ( not ( = ?auto_709258 ?auto_709270 ) ) ( not ( = ?auto_709258 ?auto_709271 ) ) ( not ( = ?auto_709259 ?auto_709260 ) ) ( not ( = ?auto_709259 ?auto_709261 ) ) ( not ( = ?auto_709259 ?auto_709262 ) ) ( not ( = ?auto_709259 ?auto_709263 ) ) ( not ( = ?auto_709259 ?auto_709264 ) ) ( not ( = ?auto_709259 ?auto_709265 ) ) ( not ( = ?auto_709259 ?auto_709266 ) ) ( not ( = ?auto_709259 ?auto_709267 ) ) ( not ( = ?auto_709259 ?auto_709268 ) ) ( not ( = ?auto_709259 ?auto_709269 ) ) ( not ( = ?auto_709259 ?auto_709270 ) ) ( not ( = ?auto_709259 ?auto_709271 ) ) ( not ( = ?auto_709260 ?auto_709261 ) ) ( not ( = ?auto_709260 ?auto_709262 ) ) ( not ( = ?auto_709260 ?auto_709263 ) ) ( not ( = ?auto_709260 ?auto_709264 ) ) ( not ( = ?auto_709260 ?auto_709265 ) ) ( not ( = ?auto_709260 ?auto_709266 ) ) ( not ( = ?auto_709260 ?auto_709267 ) ) ( not ( = ?auto_709260 ?auto_709268 ) ) ( not ( = ?auto_709260 ?auto_709269 ) ) ( not ( = ?auto_709260 ?auto_709270 ) ) ( not ( = ?auto_709260 ?auto_709271 ) ) ( not ( = ?auto_709261 ?auto_709262 ) ) ( not ( = ?auto_709261 ?auto_709263 ) ) ( not ( = ?auto_709261 ?auto_709264 ) ) ( not ( = ?auto_709261 ?auto_709265 ) ) ( not ( = ?auto_709261 ?auto_709266 ) ) ( not ( = ?auto_709261 ?auto_709267 ) ) ( not ( = ?auto_709261 ?auto_709268 ) ) ( not ( = ?auto_709261 ?auto_709269 ) ) ( not ( = ?auto_709261 ?auto_709270 ) ) ( not ( = ?auto_709261 ?auto_709271 ) ) ( not ( = ?auto_709262 ?auto_709263 ) ) ( not ( = ?auto_709262 ?auto_709264 ) ) ( not ( = ?auto_709262 ?auto_709265 ) ) ( not ( = ?auto_709262 ?auto_709266 ) ) ( not ( = ?auto_709262 ?auto_709267 ) ) ( not ( = ?auto_709262 ?auto_709268 ) ) ( not ( = ?auto_709262 ?auto_709269 ) ) ( not ( = ?auto_709262 ?auto_709270 ) ) ( not ( = ?auto_709262 ?auto_709271 ) ) ( not ( = ?auto_709263 ?auto_709264 ) ) ( not ( = ?auto_709263 ?auto_709265 ) ) ( not ( = ?auto_709263 ?auto_709266 ) ) ( not ( = ?auto_709263 ?auto_709267 ) ) ( not ( = ?auto_709263 ?auto_709268 ) ) ( not ( = ?auto_709263 ?auto_709269 ) ) ( not ( = ?auto_709263 ?auto_709270 ) ) ( not ( = ?auto_709263 ?auto_709271 ) ) ( not ( = ?auto_709264 ?auto_709265 ) ) ( not ( = ?auto_709264 ?auto_709266 ) ) ( not ( = ?auto_709264 ?auto_709267 ) ) ( not ( = ?auto_709264 ?auto_709268 ) ) ( not ( = ?auto_709264 ?auto_709269 ) ) ( not ( = ?auto_709264 ?auto_709270 ) ) ( not ( = ?auto_709264 ?auto_709271 ) ) ( not ( = ?auto_709265 ?auto_709266 ) ) ( not ( = ?auto_709265 ?auto_709267 ) ) ( not ( = ?auto_709265 ?auto_709268 ) ) ( not ( = ?auto_709265 ?auto_709269 ) ) ( not ( = ?auto_709265 ?auto_709270 ) ) ( not ( = ?auto_709265 ?auto_709271 ) ) ( not ( = ?auto_709266 ?auto_709267 ) ) ( not ( = ?auto_709266 ?auto_709268 ) ) ( not ( = ?auto_709266 ?auto_709269 ) ) ( not ( = ?auto_709266 ?auto_709270 ) ) ( not ( = ?auto_709266 ?auto_709271 ) ) ( not ( = ?auto_709267 ?auto_709268 ) ) ( not ( = ?auto_709267 ?auto_709269 ) ) ( not ( = ?auto_709267 ?auto_709270 ) ) ( not ( = ?auto_709267 ?auto_709271 ) ) ( not ( = ?auto_709268 ?auto_709269 ) ) ( not ( = ?auto_709268 ?auto_709270 ) ) ( not ( = ?auto_709268 ?auto_709271 ) ) ( not ( = ?auto_709269 ?auto_709270 ) ) ( not ( = ?auto_709269 ?auto_709271 ) ) ( not ( = ?auto_709270 ?auto_709271 ) ) ( ON ?auto_709269 ?auto_709270 ) ( ON ?auto_709268 ?auto_709269 ) ( ON ?auto_709267 ?auto_709268 ) ( ON ?auto_709266 ?auto_709267 ) ( ON ?auto_709265 ?auto_709266 ) ( ON ?auto_709264 ?auto_709265 ) ( ON ?auto_709263 ?auto_709264 ) ( ON ?auto_709262 ?auto_709263 ) ( CLEAR ?auto_709260 ) ( ON ?auto_709261 ?auto_709262 ) ( CLEAR ?auto_709261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_709254 ?auto_709255 ?auto_709256 ?auto_709257 ?auto_709258 ?auto_709259 ?auto_709260 ?auto_709261 )
      ( MAKE-17PILE ?auto_709254 ?auto_709255 ?auto_709256 ?auto_709257 ?auto_709258 ?auto_709259 ?auto_709260 ?auto_709261 ?auto_709262 ?auto_709263 ?auto_709264 ?auto_709265 ?auto_709266 ?auto_709267 ?auto_709268 ?auto_709269 ?auto_709270 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709289 - BLOCK
      ?auto_709290 - BLOCK
      ?auto_709291 - BLOCK
      ?auto_709292 - BLOCK
      ?auto_709293 - BLOCK
      ?auto_709294 - BLOCK
      ?auto_709295 - BLOCK
      ?auto_709296 - BLOCK
      ?auto_709297 - BLOCK
      ?auto_709298 - BLOCK
      ?auto_709299 - BLOCK
      ?auto_709300 - BLOCK
      ?auto_709301 - BLOCK
      ?auto_709302 - BLOCK
      ?auto_709303 - BLOCK
      ?auto_709304 - BLOCK
      ?auto_709305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709305 ) ( ON-TABLE ?auto_709289 ) ( ON ?auto_709290 ?auto_709289 ) ( ON ?auto_709291 ?auto_709290 ) ( ON ?auto_709292 ?auto_709291 ) ( ON ?auto_709293 ?auto_709292 ) ( ON ?auto_709294 ?auto_709293 ) ( ON ?auto_709295 ?auto_709294 ) ( not ( = ?auto_709289 ?auto_709290 ) ) ( not ( = ?auto_709289 ?auto_709291 ) ) ( not ( = ?auto_709289 ?auto_709292 ) ) ( not ( = ?auto_709289 ?auto_709293 ) ) ( not ( = ?auto_709289 ?auto_709294 ) ) ( not ( = ?auto_709289 ?auto_709295 ) ) ( not ( = ?auto_709289 ?auto_709296 ) ) ( not ( = ?auto_709289 ?auto_709297 ) ) ( not ( = ?auto_709289 ?auto_709298 ) ) ( not ( = ?auto_709289 ?auto_709299 ) ) ( not ( = ?auto_709289 ?auto_709300 ) ) ( not ( = ?auto_709289 ?auto_709301 ) ) ( not ( = ?auto_709289 ?auto_709302 ) ) ( not ( = ?auto_709289 ?auto_709303 ) ) ( not ( = ?auto_709289 ?auto_709304 ) ) ( not ( = ?auto_709289 ?auto_709305 ) ) ( not ( = ?auto_709290 ?auto_709291 ) ) ( not ( = ?auto_709290 ?auto_709292 ) ) ( not ( = ?auto_709290 ?auto_709293 ) ) ( not ( = ?auto_709290 ?auto_709294 ) ) ( not ( = ?auto_709290 ?auto_709295 ) ) ( not ( = ?auto_709290 ?auto_709296 ) ) ( not ( = ?auto_709290 ?auto_709297 ) ) ( not ( = ?auto_709290 ?auto_709298 ) ) ( not ( = ?auto_709290 ?auto_709299 ) ) ( not ( = ?auto_709290 ?auto_709300 ) ) ( not ( = ?auto_709290 ?auto_709301 ) ) ( not ( = ?auto_709290 ?auto_709302 ) ) ( not ( = ?auto_709290 ?auto_709303 ) ) ( not ( = ?auto_709290 ?auto_709304 ) ) ( not ( = ?auto_709290 ?auto_709305 ) ) ( not ( = ?auto_709291 ?auto_709292 ) ) ( not ( = ?auto_709291 ?auto_709293 ) ) ( not ( = ?auto_709291 ?auto_709294 ) ) ( not ( = ?auto_709291 ?auto_709295 ) ) ( not ( = ?auto_709291 ?auto_709296 ) ) ( not ( = ?auto_709291 ?auto_709297 ) ) ( not ( = ?auto_709291 ?auto_709298 ) ) ( not ( = ?auto_709291 ?auto_709299 ) ) ( not ( = ?auto_709291 ?auto_709300 ) ) ( not ( = ?auto_709291 ?auto_709301 ) ) ( not ( = ?auto_709291 ?auto_709302 ) ) ( not ( = ?auto_709291 ?auto_709303 ) ) ( not ( = ?auto_709291 ?auto_709304 ) ) ( not ( = ?auto_709291 ?auto_709305 ) ) ( not ( = ?auto_709292 ?auto_709293 ) ) ( not ( = ?auto_709292 ?auto_709294 ) ) ( not ( = ?auto_709292 ?auto_709295 ) ) ( not ( = ?auto_709292 ?auto_709296 ) ) ( not ( = ?auto_709292 ?auto_709297 ) ) ( not ( = ?auto_709292 ?auto_709298 ) ) ( not ( = ?auto_709292 ?auto_709299 ) ) ( not ( = ?auto_709292 ?auto_709300 ) ) ( not ( = ?auto_709292 ?auto_709301 ) ) ( not ( = ?auto_709292 ?auto_709302 ) ) ( not ( = ?auto_709292 ?auto_709303 ) ) ( not ( = ?auto_709292 ?auto_709304 ) ) ( not ( = ?auto_709292 ?auto_709305 ) ) ( not ( = ?auto_709293 ?auto_709294 ) ) ( not ( = ?auto_709293 ?auto_709295 ) ) ( not ( = ?auto_709293 ?auto_709296 ) ) ( not ( = ?auto_709293 ?auto_709297 ) ) ( not ( = ?auto_709293 ?auto_709298 ) ) ( not ( = ?auto_709293 ?auto_709299 ) ) ( not ( = ?auto_709293 ?auto_709300 ) ) ( not ( = ?auto_709293 ?auto_709301 ) ) ( not ( = ?auto_709293 ?auto_709302 ) ) ( not ( = ?auto_709293 ?auto_709303 ) ) ( not ( = ?auto_709293 ?auto_709304 ) ) ( not ( = ?auto_709293 ?auto_709305 ) ) ( not ( = ?auto_709294 ?auto_709295 ) ) ( not ( = ?auto_709294 ?auto_709296 ) ) ( not ( = ?auto_709294 ?auto_709297 ) ) ( not ( = ?auto_709294 ?auto_709298 ) ) ( not ( = ?auto_709294 ?auto_709299 ) ) ( not ( = ?auto_709294 ?auto_709300 ) ) ( not ( = ?auto_709294 ?auto_709301 ) ) ( not ( = ?auto_709294 ?auto_709302 ) ) ( not ( = ?auto_709294 ?auto_709303 ) ) ( not ( = ?auto_709294 ?auto_709304 ) ) ( not ( = ?auto_709294 ?auto_709305 ) ) ( not ( = ?auto_709295 ?auto_709296 ) ) ( not ( = ?auto_709295 ?auto_709297 ) ) ( not ( = ?auto_709295 ?auto_709298 ) ) ( not ( = ?auto_709295 ?auto_709299 ) ) ( not ( = ?auto_709295 ?auto_709300 ) ) ( not ( = ?auto_709295 ?auto_709301 ) ) ( not ( = ?auto_709295 ?auto_709302 ) ) ( not ( = ?auto_709295 ?auto_709303 ) ) ( not ( = ?auto_709295 ?auto_709304 ) ) ( not ( = ?auto_709295 ?auto_709305 ) ) ( not ( = ?auto_709296 ?auto_709297 ) ) ( not ( = ?auto_709296 ?auto_709298 ) ) ( not ( = ?auto_709296 ?auto_709299 ) ) ( not ( = ?auto_709296 ?auto_709300 ) ) ( not ( = ?auto_709296 ?auto_709301 ) ) ( not ( = ?auto_709296 ?auto_709302 ) ) ( not ( = ?auto_709296 ?auto_709303 ) ) ( not ( = ?auto_709296 ?auto_709304 ) ) ( not ( = ?auto_709296 ?auto_709305 ) ) ( not ( = ?auto_709297 ?auto_709298 ) ) ( not ( = ?auto_709297 ?auto_709299 ) ) ( not ( = ?auto_709297 ?auto_709300 ) ) ( not ( = ?auto_709297 ?auto_709301 ) ) ( not ( = ?auto_709297 ?auto_709302 ) ) ( not ( = ?auto_709297 ?auto_709303 ) ) ( not ( = ?auto_709297 ?auto_709304 ) ) ( not ( = ?auto_709297 ?auto_709305 ) ) ( not ( = ?auto_709298 ?auto_709299 ) ) ( not ( = ?auto_709298 ?auto_709300 ) ) ( not ( = ?auto_709298 ?auto_709301 ) ) ( not ( = ?auto_709298 ?auto_709302 ) ) ( not ( = ?auto_709298 ?auto_709303 ) ) ( not ( = ?auto_709298 ?auto_709304 ) ) ( not ( = ?auto_709298 ?auto_709305 ) ) ( not ( = ?auto_709299 ?auto_709300 ) ) ( not ( = ?auto_709299 ?auto_709301 ) ) ( not ( = ?auto_709299 ?auto_709302 ) ) ( not ( = ?auto_709299 ?auto_709303 ) ) ( not ( = ?auto_709299 ?auto_709304 ) ) ( not ( = ?auto_709299 ?auto_709305 ) ) ( not ( = ?auto_709300 ?auto_709301 ) ) ( not ( = ?auto_709300 ?auto_709302 ) ) ( not ( = ?auto_709300 ?auto_709303 ) ) ( not ( = ?auto_709300 ?auto_709304 ) ) ( not ( = ?auto_709300 ?auto_709305 ) ) ( not ( = ?auto_709301 ?auto_709302 ) ) ( not ( = ?auto_709301 ?auto_709303 ) ) ( not ( = ?auto_709301 ?auto_709304 ) ) ( not ( = ?auto_709301 ?auto_709305 ) ) ( not ( = ?auto_709302 ?auto_709303 ) ) ( not ( = ?auto_709302 ?auto_709304 ) ) ( not ( = ?auto_709302 ?auto_709305 ) ) ( not ( = ?auto_709303 ?auto_709304 ) ) ( not ( = ?auto_709303 ?auto_709305 ) ) ( not ( = ?auto_709304 ?auto_709305 ) ) ( ON ?auto_709304 ?auto_709305 ) ( ON ?auto_709303 ?auto_709304 ) ( ON ?auto_709302 ?auto_709303 ) ( ON ?auto_709301 ?auto_709302 ) ( ON ?auto_709300 ?auto_709301 ) ( ON ?auto_709299 ?auto_709300 ) ( ON ?auto_709298 ?auto_709299 ) ( ON ?auto_709297 ?auto_709298 ) ( CLEAR ?auto_709295 ) ( ON ?auto_709296 ?auto_709297 ) ( CLEAR ?auto_709296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_709289 ?auto_709290 ?auto_709291 ?auto_709292 ?auto_709293 ?auto_709294 ?auto_709295 ?auto_709296 )
      ( MAKE-17PILE ?auto_709289 ?auto_709290 ?auto_709291 ?auto_709292 ?auto_709293 ?auto_709294 ?auto_709295 ?auto_709296 ?auto_709297 ?auto_709298 ?auto_709299 ?auto_709300 ?auto_709301 ?auto_709302 ?auto_709303 ?auto_709304 ?auto_709305 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709323 - BLOCK
      ?auto_709324 - BLOCK
      ?auto_709325 - BLOCK
      ?auto_709326 - BLOCK
      ?auto_709327 - BLOCK
      ?auto_709328 - BLOCK
      ?auto_709329 - BLOCK
      ?auto_709330 - BLOCK
      ?auto_709331 - BLOCK
      ?auto_709332 - BLOCK
      ?auto_709333 - BLOCK
      ?auto_709334 - BLOCK
      ?auto_709335 - BLOCK
      ?auto_709336 - BLOCK
      ?auto_709337 - BLOCK
      ?auto_709338 - BLOCK
      ?auto_709339 - BLOCK
    )
    :vars
    (
      ?auto_709340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709339 ?auto_709340 ) ( ON-TABLE ?auto_709323 ) ( ON ?auto_709324 ?auto_709323 ) ( ON ?auto_709325 ?auto_709324 ) ( ON ?auto_709326 ?auto_709325 ) ( ON ?auto_709327 ?auto_709326 ) ( ON ?auto_709328 ?auto_709327 ) ( not ( = ?auto_709323 ?auto_709324 ) ) ( not ( = ?auto_709323 ?auto_709325 ) ) ( not ( = ?auto_709323 ?auto_709326 ) ) ( not ( = ?auto_709323 ?auto_709327 ) ) ( not ( = ?auto_709323 ?auto_709328 ) ) ( not ( = ?auto_709323 ?auto_709329 ) ) ( not ( = ?auto_709323 ?auto_709330 ) ) ( not ( = ?auto_709323 ?auto_709331 ) ) ( not ( = ?auto_709323 ?auto_709332 ) ) ( not ( = ?auto_709323 ?auto_709333 ) ) ( not ( = ?auto_709323 ?auto_709334 ) ) ( not ( = ?auto_709323 ?auto_709335 ) ) ( not ( = ?auto_709323 ?auto_709336 ) ) ( not ( = ?auto_709323 ?auto_709337 ) ) ( not ( = ?auto_709323 ?auto_709338 ) ) ( not ( = ?auto_709323 ?auto_709339 ) ) ( not ( = ?auto_709323 ?auto_709340 ) ) ( not ( = ?auto_709324 ?auto_709325 ) ) ( not ( = ?auto_709324 ?auto_709326 ) ) ( not ( = ?auto_709324 ?auto_709327 ) ) ( not ( = ?auto_709324 ?auto_709328 ) ) ( not ( = ?auto_709324 ?auto_709329 ) ) ( not ( = ?auto_709324 ?auto_709330 ) ) ( not ( = ?auto_709324 ?auto_709331 ) ) ( not ( = ?auto_709324 ?auto_709332 ) ) ( not ( = ?auto_709324 ?auto_709333 ) ) ( not ( = ?auto_709324 ?auto_709334 ) ) ( not ( = ?auto_709324 ?auto_709335 ) ) ( not ( = ?auto_709324 ?auto_709336 ) ) ( not ( = ?auto_709324 ?auto_709337 ) ) ( not ( = ?auto_709324 ?auto_709338 ) ) ( not ( = ?auto_709324 ?auto_709339 ) ) ( not ( = ?auto_709324 ?auto_709340 ) ) ( not ( = ?auto_709325 ?auto_709326 ) ) ( not ( = ?auto_709325 ?auto_709327 ) ) ( not ( = ?auto_709325 ?auto_709328 ) ) ( not ( = ?auto_709325 ?auto_709329 ) ) ( not ( = ?auto_709325 ?auto_709330 ) ) ( not ( = ?auto_709325 ?auto_709331 ) ) ( not ( = ?auto_709325 ?auto_709332 ) ) ( not ( = ?auto_709325 ?auto_709333 ) ) ( not ( = ?auto_709325 ?auto_709334 ) ) ( not ( = ?auto_709325 ?auto_709335 ) ) ( not ( = ?auto_709325 ?auto_709336 ) ) ( not ( = ?auto_709325 ?auto_709337 ) ) ( not ( = ?auto_709325 ?auto_709338 ) ) ( not ( = ?auto_709325 ?auto_709339 ) ) ( not ( = ?auto_709325 ?auto_709340 ) ) ( not ( = ?auto_709326 ?auto_709327 ) ) ( not ( = ?auto_709326 ?auto_709328 ) ) ( not ( = ?auto_709326 ?auto_709329 ) ) ( not ( = ?auto_709326 ?auto_709330 ) ) ( not ( = ?auto_709326 ?auto_709331 ) ) ( not ( = ?auto_709326 ?auto_709332 ) ) ( not ( = ?auto_709326 ?auto_709333 ) ) ( not ( = ?auto_709326 ?auto_709334 ) ) ( not ( = ?auto_709326 ?auto_709335 ) ) ( not ( = ?auto_709326 ?auto_709336 ) ) ( not ( = ?auto_709326 ?auto_709337 ) ) ( not ( = ?auto_709326 ?auto_709338 ) ) ( not ( = ?auto_709326 ?auto_709339 ) ) ( not ( = ?auto_709326 ?auto_709340 ) ) ( not ( = ?auto_709327 ?auto_709328 ) ) ( not ( = ?auto_709327 ?auto_709329 ) ) ( not ( = ?auto_709327 ?auto_709330 ) ) ( not ( = ?auto_709327 ?auto_709331 ) ) ( not ( = ?auto_709327 ?auto_709332 ) ) ( not ( = ?auto_709327 ?auto_709333 ) ) ( not ( = ?auto_709327 ?auto_709334 ) ) ( not ( = ?auto_709327 ?auto_709335 ) ) ( not ( = ?auto_709327 ?auto_709336 ) ) ( not ( = ?auto_709327 ?auto_709337 ) ) ( not ( = ?auto_709327 ?auto_709338 ) ) ( not ( = ?auto_709327 ?auto_709339 ) ) ( not ( = ?auto_709327 ?auto_709340 ) ) ( not ( = ?auto_709328 ?auto_709329 ) ) ( not ( = ?auto_709328 ?auto_709330 ) ) ( not ( = ?auto_709328 ?auto_709331 ) ) ( not ( = ?auto_709328 ?auto_709332 ) ) ( not ( = ?auto_709328 ?auto_709333 ) ) ( not ( = ?auto_709328 ?auto_709334 ) ) ( not ( = ?auto_709328 ?auto_709335 ) ) ( not ( = ?auto_709328 ?auto_709336 ) ) ( not ( = ?auto_709328 ?auto_709337 ) ) ( not ( = ?auto_709328 ?auto_709338 ) ) ( not ( = ?auto_709328 ?auto_709339 ) ) ( not ( = ?auto_709328 ?auto_709340 ) ) ( not ( = ?auto_709329 ?auto_709330 ) ) ( not ( = ?auto_709329 ?auto_709331 ) ) ( not ( = ?auto_709329 ?auto_709332 ) ) ( not ( = ?auto_709329 ?auto_709333 ) ) ( not ( = ?auto_709329 ?auto_709334 ) ) ( not ( = ?auto_709329 ?auto_709335 ) ) ( not ( = ?auto_709329 ?auto_709336 ) ) ( not ( = ?auto_709329 ?auto_709337 ) ) ( not ( = ?auto_709329 ?auto_709338 ) ) ( not ( = ?auto_709329 ?auto_709339 ) ) ( not ( = ?auto_709329 ?auto_709340 ) ) ( not ( = ?auto_709330 ?auto_709331 ) ) ( not ( = ?auto_709330 ?auto_709332 ) ) ( not ( = ?auto_709330 ?auto_709333 ) ) ( not ( = ?auto_709330 ?auto_709334 ) ) ( not ( = ?auto_709330 ?auto_709335 ) ) ( not ( = ?auto_709330 ?auto_709336 ) ) ( not ( = ?auto_709330 ?auto_709337 ) ) ( not ( = ?auto_709330 ?auto_709338 ) ) ( not ( = ?auto_709330 ?auto_709339 ) ) ( not ( = ?auto_709330 ?auto_709340 ) ) ( not ( = ?auto_709331 ?auto_709332 ) ) ( not ( = ?auto_709331 ?auto_709333 ) ) ( not ( = ?auto_709331 ?auto_709334 ) ) ( not ( = ?auto_709331 ?auto_709335 ) ) ( not ( = ?auto_709331 ?auto_709336 ) ) ( not ( = ?auto_709331 ?auto_709337 ) ) ( not ( = ?auto_709331 ?auto_709338 ) ) ( not ( = ?auto_709331 ?auto_709339 ) ) ( not ( = ?auto_709331 ?auto_709340 ) ) ( not ( = ?auto_709332 ?auto_709333 ) ) ( not ( = ?auto_709332 ?auto_709334 ) ) ( not ( = ?auto_709332 ?auto_709335 ) ) ( not ( = ?auto_709332 ?auto_709336 ) ) ( not ( = ?auto_709332 ?auto_709337 ) ) ( not ( = ?auto_709332 ?auto_709338 ) ) ( not ( = ?auto_709332 ?auto_709339 ) ) ( not ( = ?auto_709332 ?auto_709340 ) ) ( not ( = ?auto_709333 ?auto_709334 ) ) ( not ( = ?auto_709333 ?auto_709335 ) ) ( not ( = ?auto_709333 ?auto_709336 ) ) ( not ( = ?auto_709333 ?auto_709337 ) ) ( not ( = ?auto_709333 ?auto_709338 ) ) ( not ( = ?auto_709333 ?auto_709339 ) ) ( not ( = ?auto_709333 ?auto_709340 ) ) ( not ( = ?auto_709334 ?auto_709335 ) ) ( not ( = ?auto_709334 ?auto_709336 ) ) ( not ( = ?auto_709334 ?auto_709337 ) ) ( not ( = ?auto_709334 ?auto_709338 ) ) ( not ( = ?auto_709334 ?auto_709339 ) ) ( not ( = ?auto_709334 ?auto_709340 ) ) ( not ( = ?auto_709335 ?auto_709336 ) ) ( not ( = ?auto_709335 ?auto_709337 ) ) ( not ( = ?auto_709335 ?auto_709338 ) ) ( not ( = ?auto_709335 ?auto_709339 ) ) ( not ( = ?auto_709335 ?auto_709340 ) ) ( not ( = ?auto_709336 ?auto_709337 ) ) ( not ( = ?auto_709336 ?auto_709338 ) ) ( not ( = ?auto_709336 ?auto_709339 ) ) ( not ( = ?auto_709336 ?auto_709340 ) ) ( not ( = ?auto_709337 ?auto_709338 ) ) ( not ( = ?auto_709337 ?auto_709339 ) ) ( not ( = ?auto_709337 ?auto_709340 ) ) ( not ( = ?auto_709338 ?auto_709339 ) ) ( not ( = ?auto_709338 ?auto_709340 ) ) ( not ( = ?auto_709339 ?auto_709340 ) ) ( ON ?auto_709338 ?auto_709339 ) ( ON ?auto_709337 ?auto_709338 ) ( ON ?auto_709336 ?auto_709337 ) ( ON ?auto_709335 ?auto_709336 ) ( ON ?auto_709334 ?auto_709335 ) ( ON ?auto_709333 ?auto_709334 ) ( ON ?auto_709332 ?auto_709333 ) ( ON ?auto_709331 ?auto_709332 ) ( ON ?auto_709330 ?auto_709331 ) ( CLEAR ?auto_709328 ) ( ON ?auto_709329 ?auto_709330 ) ( CLEAR ?auto_709329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_709323 ?auto_709324 ?auto_709325 ?auto_709326 ?auto_709327 ?auto_709328 ?auto_709329 )
      ( MAKE-17PILE ?auto_709323 ?auto_709324 ?auto_709325 ?auto_709326 ?auto_709327 ?auto_709328 ?auto_709329 ?auto_709330 ?auto_709331 ?auto_709332 ?auto_709333 ?auto_709334 ?auto_709335 ?auto_709336 ?auto_709337 ?auto_709338 ?auto_709339 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709358 - BLOCK
      ?auto_709359 - BLOCK
      ?auto_709360 - BLOCK
      ?auto_709361 - BLOCK
      ?auto_709362 - BLOCK
      ?auto_709363 - BLOCK
      ?auto_709364 - BLOCK
      ?auto_709365 - BLOCK
      ?auto_709366 - BLOCK
      ?auto_709367 - BLOCK
      ?auto_709368 - BLOCK
      ?auto_709369 - BLOCK
      ?auto_709370 - BLOCK
      ?auto_709371 - BLOCK
      ?auto_709372 - BLOCK
      ?auto_709373 - BLOCK
      ?auto_709374 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709374 ) ( ON-TABLE ?auto_709358 ) ( ON ?auto_709359 ?auto_709358 ) ( ON ?auto_709360 ?auto_709359 ) ( ON ?auto_709361 ?auto_709360 ) ( ON ?auto_709362 ?auto_709361 ) ( ON ?auto_709363 ?auto_709362 ) ( not ( = ?auto_709358 ?auto_709359 ) ) ( not ( = ?auto_709358 ?auto_709360 ) ) ( not ( = ?auto_709358 ?auto_709361 ) ) ( not ( = ?auto_709358 ?auto_709362 ) ) ( not ( = ?auto_709358 ?auto_709363 ) ) ( not ( = ?auto_709358 ?auto_709364 ) ) ( not ( = ?auto_709358 ?auto_709365 ) ) ( not ( = ?auto_709358 ?auto_709366 ) ) ( not ( = ?auto_709358 ?auto_709367 ) ) ( not ( = ?auto_709358 ?auto_709368 ) ) ( not ( = ?auto_709358 ?auto_709369 ) ) ( not ( = ?auto_709358 ?auto_709370 ) ) ( not ( = ?auto_709358 ?auto_709371 ) ) ( not ( = ?auto_709358 ?auto_709372 ) ) ( not ( = ?auto_709358 ?auto_709373 ) ) ( not ( = ?auto_709358 ?auto_709374 ) ) ( not ( = ?auto_709359 ?auto_709360 ) ) ( not ( = ?auto_709359 ?auto_709361 ) ) ( not ( = ?auto_709359 ?auto_709362 ) ) ( not ( = ?auto_709359 ?auto_709363 ) ) ( not ( = ?auto_709359 ?auto_709364 ) ) ( not ( = ?auto_709359 ?auto_709365 ) ) ( not ( = ?auto_709359 ?auto_709366 ) ) ( not ( = ?auto_709359 ?auto_709367 ) ) ( not ( = ?auto_709359 ?auto_709368 ) ) ( not ( = ?auto_709359 ?auto_709369 ) ) ( not ( = ?auto_709359 ?auto_709370 ) ) ( not ( = ?auto_709359 ?auto_709371 ) ) ( not ( = ?auto_709359 ?auto_709372 ) ) ( not ( = ?auto_709359 ?auto_709373 ) ) ( not ( = ?auto_709359 ?auto_709374 ) ) ( not ( = ?auto_709360 ?auto_709361 ) ) ( not ( = ?auto_709360 ?auto_709362 ) ) ( not ( = ?auto_709360 ?auto_709363 ) ) ( not ( = ?auto_709360 ?auto_709364 ) ) ( not ( = ?auto_709360 ?auto_709365 ) ) ( not ( = ?auto_709360 ?auto_709366 ) ) ( not ( = ?auto_709360 ?auto_709367 ) ) ( not ( = ?auto_709360 ?auto_709368 ) ) ( not ( = ?auto_709360 ?auto_709369 ) ) ( not ( = ?auto_709360 ?auto_709370 ) ) ( not ( = ?auto_709360 ?auto_709371 ) ) ( not ( = ?auto_709360 ?auto_709372 ) ) ( not ( = ?auto_709360 ?auto_709373 ) ) ( not ( = ?auto_709360 ?auto_709374 ) ) ( not ( = ?auto_709361 ?auto_709362 ) ) ( not ( = ?auto_709361 ?auto_709363 ) ) ( not ( = ?auto_709361 ?auto_709364 ) ) ( not ( = ?auto_709361 ?auto_709365 ) ) ( not ( = ?auto_709361 ?auto_709366 ) ) ( not ( = ?auto_709361 ?auto_709367 ) ) ( not ( = ?auto_709361 ?auto_709368 ) ) ( not ( = ?auto_709361 ?auto_709369 ) ) ( not ( = ?auto_709361 ?auto_709370 ) ) ( not ( = ?auto_709361 ?auto_709371 ) ) ( not ( = ?auto_709361 ?auto_709372 ) ) ( not ( = ?auto_709361 ?auto_709373 ) ) ( not ( = ?auto_709361 ?auto_709374 ) ) ( not ( = ?auto_709362 ?auto_709363 ) ) ( not ( = ?auto_709362 ?auto_709364 ) ) ( not ( = ?auto_709362 ?auto_709365 ) ) ( not ( = ?auto_709362 ?auto_709366 ) ) ( not ( = ?auto_709362 ?auto_709367 ) ) ( not ( = ?auto_709362 ?auto_709368 ) ) ( not ( = ?auto_709362 ?auto_709369 ) ) ( not ( = ?auto_709362 ?auto_709370 ) ) ( not ( = ?auto_709362 ?auto_709371 ) ) ( not ( = ?auto_709362 ?auto_709372 ) ) ( not ( = ?auto_709362 ?auto_709373 ) ) ( not ( = ?auto_709362 ?auto_709374 ) ) ( not ( = ?auto_709363 ?auto_709364 ) ) ( not ( = ?auto_709363 ?auto_709365 ) ) ( not ( = ?auto_709363 ?auto_709366 ) ) ( not ( = ?auto_709363 ?auto_709367 ) ) ( not ( = ?auto_709363 ?auto_709368 ) ) ( not ( = ?auto_709363 ?auto_709369 ) ) ( not ( = ?auto_709363 ?auto_709370 ) ) ( not ( = ?auto_709363 ?auto_709371 ) ) ( not ( = ?auto_709363 ?auto_709372 ) ) ( not ( = ?auto_709363 ?auto_709373 ) ) ( not ( = ?auto_709363 ?auto_709374 ) ) ( not ( = ?auto_709364 ?auto_709365 ) ) ( not ( = ?auto_709364 ?auto_709366 ) ) ( not ( = ?auto_709364 ?auto_709367 ) ) ( not ( = ?auto_709364 ?auto_709368 ) ) ( not ( = ?auto_709364 ?auto_709369 ) ) ( not ( = ?auto_709364 ?auto_709370 ) ) ( not ( = ?auto_709364 ?auto_709371 ) ) ( not ( = ?auto_709364 ?auto_709372 ) ) ( not ( = ?auto_709364 ?auto_709373 ) ) ( not ( = ?auto_709364 ?auto_709374 ) ) ( not ( = ?auto_709365 ?auto_709366 ) ) ( not ( = ?auto_709365 ?auto_709367 ) ) ( not ( = ?auto_709365 ?auto_709368 ) ) ( not ( = ?auto_709365 ?auto_709369 ) ) ( not ( = ?auto_709365 ?auto_709370 ) ) ( not ( = ?auto_709365 ?auto_709371 ) ) ( not ( = ?auto_709365 ?auto_709372 ) ) ( not ( = ?auto_709365 ?auto_709373 ) ) ( not ( = ?auto_709365 ?auto_709374 ) ) ( not ( = ?auto_709366 ?auto_709367 ) ) ( not ( = ?auto_709366 ?auto_709368 ) ) ( not ( = ?auto_709366 ?auto_709369 ) ) ( not ( = ?auto_709366 ?auto_709370 ) ) ( not ( = ?auto_709366 ?auto_709371 ) ) ( not ( = ?auto_709366 ?auto_709372 ) ) ( not ( = ?auto_709366 ?auto_709373 ) ) ( not ( = ?auto_709366 ?auto_709374 ) ) ( not ( = ?auto_709367 ?auto_709368 ) ) ( not ( = ?auto_709367 ?auto_709369 ) ) ( not ( = ?auto_709367 ?auto_709370 ) ) ( not ( = ?auto_709367 ?auto_709371 ) ) ( not ( = ?auto_709367 ?auto_709372 ) ) ( not ( = ?auto_709367 ?auto_709373 ) ) ( not ( = ?auto_709367 ?auto_709374 ) ) ( not ( = ?auto_709368 ?auto_709369 ) ) ( not ( = ?auto_709368 ?auto_709370 ) ) ( not ( = ?auto_709368 ?auto_709371 ) ) ( not ( = ?auto_709368 ?auto_709372 ) ) ( not ( = ?auto_709368 ?auto_709373 ) ) ( not ( = ?auto_709368 ?auto_709374 ) ) ( not ( = ?auto_709369 ?auto_709370 ) ) ( not ( = ?auto_709369 ?auto_709371 ) ) ( not ( = ?auto_709369 ?auto_709372 ) ) ( not ( = ?auto_709369 ?auto_709373 ) ) ( not ( = ?auto_709369 ?auto_709374 ) ) ( not ( = ?auto_709370 ?auto_709371 ) ) ( not ( = ?auto_709370 ?auto_709372 ) ) ( not ( = ?auto_709370 ?auto_709373 ) ) ( not ( = ?auto_709370 ?auto_709374 ) ) ( not ( = ?auto_709371 ?auto_709372 ) ) ( not ( = ?auto_709371 ?auto_709373 ) ) ( not ( = ?auto_709371 ?auto_709374 ) ) ( not ( = ?auto_709372 ?auto_709373 ) ) ( not ( = ?auto_709372 ?auto_709374 ) ) ( not ( = ?auto_709373 ?auto_709374 ) ) ( ON ?auto_709373 ?auto_709374 ) ( ON ?auto_709372 ?auto_709373 ) ( ON ?auto_709371 ?auto_709372 ) ( ON ?auto_709370 ?auto_709371 ) ( ON ?auto_709369 ?auto_709370 ) ( ON ?auto_709368 ?auto_709369 ) ( ON ?auto_709367 ?auto_709368 ) ( ON ?auto_709366 ?auto_709367 ) ( ON ?auto_709365 ?auto_709366 ) ( CLEAR ?auto_709363 ) ( ON ?auto_709364 ?auto_709365 ) ( CLEAR ?auto_709364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_709358 ?auto_709359 ?auto_709360 ?auto_709361 ?auto_709362 ?auto_709363 ?auto_709364 )
      ( MAKE-17PILE ?auto_709358 ?auto_709359 ?auto_709360 ?auto_709361 ?auto_709362 ?auto_709363 ?auto_709364 ?auto_709365 ?auto_709366 ?auto_709367 ?auto_709368 ?auto_709369 ?auto_709370 ?auto_709371 ?auto_709372 ?auto_709373 ?auto_709374 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709392 - BLOCK
      ?auto_709393 - BLOCK
      ?auto_709394 - BLOCK
      ?auto_709395 - BLOCK
      ?auto_709396 - BLOCK
      ?auto_709397 - BLOCK
      ?auto_709398 - BLOCK
      ?auto_709399 - BLOCK
      ?auto_709400 - BLOCK
      ?auto_709401 - BLOCK
      ?auto_709402 - BLOCK
      ?auto_709403 - BLOCK
      ?auto_709404 - BLOCK
      ?auto_709405 - BLOCK
      ?auto_709406 - BLOCK
      ?auto_709407 - BLOCK
      ?auto_709408 - BLOCK
    )
    :vars
    (
      ?auto_709409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709408 ?auto_709409 ) ( ON-TABLE ?auto_709392 ) ( ON ?auto_709393 ?auto_709392 ) ( ON ?auto_709394 ?auto_709393 ) ( ON ?auto_709395 ?auto_709394 ) ( ON ?auto_709396 ?auto_709395 ) ( not ( = ?auto_709392 ?auto_709393 ) ) ( not ( = ?auto_709392 ?auto_709394 ) ) ( not ( = ?auto_709392 ?auto_709395 ) ) ( not ( = ?auto_709392 ?auto_709396 ) ) ( not ( = ?auto_709392 ?auto_709397 ) ) ( not ( = ?auto_709392 ?auto_709398 ) ) ( not ( = ?auto_709392 ?auto_709399 ) ) ( not ( = ?auto_709392 ?auto_709400 ) ) ( not ( = ?auto_709392 ?auto_709401 ) ) ( not ( = ?auto_709392 ?auto_709402 ) ) ( not ( = ?auto_709392 ?auto_709403 ) ) ( not ( = ?auto_709392 ?auto_709404 ) ) ( not ( = ?auto_709392 ?auto_709405 ) ) ( not ( = ?auto_709392 ?auto_709406 ) ) ( not ( = ?auto_709392 ?auto_709407 ) ) ( not ( = ?auto_709392 ?auto_709408 ) ) ( not ( = ?auto_709392 ?auto_709409 ) ) ( not ( = ?auto_709393 ?auto_709394 ) ) ( not ( = ?auto_709393 ?auto_709395 ) ) ( not ( = ?auto_709393 ?auto_709396 ) ) ( not ( = ?auto_709393 ?auto_709397 ) ) ( not ( = ?auto_709393 ?auto_709398 ) ) ( not ( = ?auto_709393 ?auto_709399 ) ) ( not ( = ?auto_709393 ?auto_709400 ) ) ( not ( = ?auto_709393 ?auto_709401 ) ) ( not ( = ?auto_709393 ?auto_709402 ) ) ( not ( = ?auto_709393 ?auto_709403 ) ) ( not ( = ?auto_709393 ?auto_709404 ) ) ( not ( = ?auto_709393 ?auto_709405 ) ) ( not ( = ?auto_709393 ?auto_709406 ) ) ( not ( = ?auto_709393 ?auto_709407 ) ) ( not ( = ?auto_709393 ?auto_709408 ) ) ( not ( = ?auto_709393 ?auto_709409 ) ) ( not ( = ?auto_709394 ?auto_709395 ) ) ( not ( = ?auto_709394 ?auto_709396 ) ) ( not ( = ?auto_709394 ?auto_709397 ) ) ( not ( = ?auto_709394 ?auto_709398 ) ) ( not ( = ?auto_709394 ?auto_709399 ) ) ( not ( = ?auto_709394 ?auto_709400 ) ) ( not ( = ?auto_709394 ?auto_709401 ) ) ( not ( = ?auto_709394 ?auto_709402 ) ) ( not ( = ?auto_709394 ?auto_709403 ) ) ( not ( = ?auto_709394 ?auto_709404 ) ) ( not ( = ?auto_709394 ?auto_709405 ) ) ( not ( = ?auto_709394 ?auto_709406 ) ) ( not ( = ?auto_709394 ?auto_709407 ) ) ( not ( = ?auto_709394 ?auto_709408 ) ) ( not ( = ?auto_709394 ?auto_709409 ) ) ( not ( = ?auto_709395 ?auto_709396 ) ) ( not ( = ?auto_709395 ?auto_709397 ) ) ( not ( = ?auto_709395 ?auto_709398 ) ) ( not ( = ?auto_709395 ?auto_709399 ) ) ( not ( = ?auto_709395 ?auto_709400 ) ) ( not ( = ?auto_709395 ?auto_709401 ) ) ( not ( = ?auto_709395 ?auto_709402 ) ) ( not ( = ?auto_709395 ?auto_709403 ) ) ( not ( = ?auto_709395 ?auto_709404 ) ) ( not ( = ?auto_709395 ?auto_709405 ) ) ( not ( = ?auto_709395 ?auto_709406 ) ) ( not ( = ?auto_709395 ?auto_709407 ) ) ( not ( = ?auto_709395 ?auto_709408 ) ) ( not ( = ?auto_709395 ?auto_709409 ) ) ( not ( = ?auto_709396 ?auto_709397 ) ) ( not ( = ?auto_709396 ?auto_709398 ) ) ( not ( = ?auto_709396 ?auto_709399 ) ) ( not ( = ?auto_709396 ?auto_709400 ) ) ( not ( = ?auto_709396 ?auto_709401 ) ) ( not ( = ?auto_709396 ?auto_709402 ) ) ( not ( = ?auto_709396 ?auto_709403 ) ) ( not ( = ?auto_709396 ?auto_709404 ) ) ( not ( = ?auto_709396 ?auto_709405 ) ) ( not ( = ?auto_709396 ?auto_709406 ) ) ( not ( = ?auto_709396 ?auto_709407 ) ) ( not ( = ?auto_709396 ?auto_709408 ) ) ( not ( = ?auto_709396 ?auto_709409 ) ) ( not ( = ?auto_709397 ?auto_709398 ) ) ( not ( = ?auto_709397 ?auto_709399 ) ) ( not ( = ?auto_709397 ?auto_709400 ) ) ( not ( = ?auto_709397 ?auto_709401 ) ) ( not ( = ?auto_709397 ?auto_709402 ) ) ( not ( = ?auto_709397 ?auto_709403 ) ) ( not ( = ?auto_709397 ?auto_709404 ) ) ( not ( = ?auto_709397 ?auto_709405 ) ) ( not ( = ?auto_709397 ?auto_709406 ) ) ( not ( = ?auto_709397 ?auto_709407 ) ) ( not ( = ?auto_709397 ?auto_709408 ) ) ( not ( = ?auto_709397 ?auto_709409 ) ) ( not ( = ?auto_709398 ?auto_709399 ) ) ( not ( = ?auto_709398 ?auto_709400 ) ) ( not ( = ?auto_709398 ?auto_709401 ) ) ( not ( = ?auto_709398 ?auto_709402 ) ) ( not ( = ?auto_709398 ?auto_709403 ) ) ( not ( = ?auto_709398 ?auto_709404 ) ) ( not ( = ?auto_709398 ?auto_709405 ) ) ( not ( = ?auto_709398 ?auto_709406 ) ) ( not ( = ?auto_709398 ?auto_709407 ) ) ( not ( = ?auto_709398 ?auto_709408 ) ) ( not ( = ?auto_709398 ?auto_709409 ) ) ( not ( = ?auto_709399 ?auto_709400 ) ) ( not ( = ?auto_709399 ?auto_709401 ) ) ( not ( = ?auto_709399 ?auto_709402 ) ) ( not ( = ?auto_709399 ?auto_709403 ) ) ( not ( = ?auto_709399 ?auto_709404 ) ) ( not ( = ?auto_709399 ?auto_709405 ) ) ( not ( = ?auto_709399 ?auto_709406 ) ) ( not ( = ?auto_709399 ?auto_709407 ) ) ( not ( = ?auto_709399 ?auto_709408 ) ) ( not ( = ?auto_709399 ?auto_709409 ) ) ( not ( = ?auto_709400 ?auto_709401 ) ) ( not ( = ?auto_709400 ?auto_709402 ) ) ( not ( = ?auto_709400 ?auto_709403 ) ) ( not ( = ?auto_709400 ?auto_709404 ) ) ( not ( = ?auto_709400 ?auto_709405 ) ) ( not ( = ?auto_709400 ?auto_709406 ) ) ( not ( = ?auto_709400 ?auto_709407 ) ) ( not ( = ?auto_709400 ?auto_709408 ) ) ( not ( = ?auto_709400 ?auto_709409 ) ) ( not ( = ?auto_709401 ?auto_709402 ) ) ( not ( = ?auto_709401 ?auto_709403 ) ) ( not ( = ?auto_709401 ?auto_709404 ) ) ( not ( = ?auto_709401 ?auto_709405 ) ) ( not ( = ?auto_709401 ?auto_709406 ) ) ( not ( = ?auto_709401 ?auto_709407 ) ) ( not ( = ?auto_709401 ?auto_709408 ) ) ( not ( = ?auto_709401 ?auto_709409 ) ) ( not ( = ?auto_709402 ?auto_709403 ) ) ( not ( = ?auto_709402 ?auto_709404 ) ) ( not ( = ?auto_709402 ?auto_709405 ) ) ( not ( = ?auto_709402 ?auto_709406 ) ) ( not ( = ?auto_709402 ?auto_709407 ) ) ( not ( = ?auto_709402 ?auto_709408 ) ) ( not ( = ?auto_709402 ?auto_709409 ) ) ( not ( = ?auto_709403 ?auto_709404 ) ) ( not ( = ?auto_709403 ?auto_709405 ) ) ( not ( = ?auto_709403 ?auto_709406 ) ) ( not ( = ?auto_709403 ?auto_709407 ) ) ( not ( = ?auto_709403 ?auto_709408 ) ) ( not ( = ?auto_709403 ?auto_709409 ) ) ( not ( = ?auto_709404 ?auto_709405 ) ) ( not ( = ?auto_709404 ?auto_709406 ) ) ( not ( = ?auto_709404 ?auto_709407 ) ) ( not ( = ?auto_709404 ?auto_709408 ) ) ( not ( = ?auto_709404 ?auto_709409 ) ) ( not ( = ?auto_709405 ?auto_709406 ) ) ( not ( = ?auto_709405 ?auto_709407 ) ) ( not ( = ?auto_709405 ?auto_709408 ) ) ( not ( = ?auto_709405 ?auto_709409 ) ) ( not ( = ?auto_709406 ?auto_709407 ) ) ( not ( = ?auto_709406 ?auto_709408 ) ) ( not ( = ?auto_709406 ?auto_709409 ) ) ( not ( = ?auto_709407 ?auto_709408 ) ) ( not ( = ?auto_709407 ?auto_709409 ) ) ( not ( = ?auto_709408 ?auto_709409 ) ) ( ON ?auto_709407 ?auto_709408 ) ( ON ?auto_709406 ?auto_709407 ) ( ON ?auto_709405 ?auto_709406 ) ( ON ?auto_709404 ?auto_709405 ) ( ON ?auto_709403 ?auto_709404 ) ( ON ?auto_709402 ?auto_709403 ) ( ON ?auto_709401 ?auto_709402 ) ( ON ?auto_709400 ?auto_709401 ) ( ON ?auto_709399 ?auto_709400 ) ( ON ?auto_709398 ?auto_709399 ) ( CLEAR ?auto_709396 ) ( ON ?auto_709397 ?auto_709398 ) ( CLEAR ?auto_709397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_709392 ?auto_709393 ?auto_709394 ?auto_709395 ?auto_709396 ?auto_709397 )
      ( MAKE-17PILE ?auto_709392 ?auto_709393 ?auto_709394 ?auto_709395 ?auto_709396 ?auto_709397 ?auto_709398 ?auto_709399 ?auto_709400 ?auto_709401 ?auto_709402 ?auto_709403 ?auto_709404 ?auto_709405 ?auto_709406 ?auto_709407 ?auto_709408 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709427 - BLOCK
      ?auto_709428 - BLOCK
      ?auto_709429 - BLOCK
      ?auto_709430 - BLOCK
      ?auto_709431 - BLOCK
      ?auto_709432 - BLOCK
      ?auto_709433 - BLOCK
      ?auto_709434 - BLOCK
      ?auto_709435 - BLOCK
      ?auto_709436 - BLOCK
      ?auto_709437 - BLOCK
      ?auto_709438 - BLOCK
      ?auto_709439 - BLOCK
      ?auto_709440 - BLOCK
      ?auto_709441 - BLOCK
      ?auto_709442 - BLOCK
      ?auto_709443 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709443 ) ( ON-TABLE ?auto_709427 ) ( ON ?auto_709428 ?auto_709427 ) ( ON ?auto_709429 ?auto_709428 ) ( ON ?auto_709430 ?auto_709429 ) ( ON ?auto_709431 ?auto_709430 ) ( not ( = ?auto_709427 ?auto_709428 ) ) ( not ( = ?auto_709427 ?auto_709429 ) ) ( not ( = ?auto_709427 ?auto_709430 ) ) ( not ( = ?auto_709427 ?auto_709431 ) ) ( not ( = ?auto_709427 ?auto_709432 ) ) ( not ( = ?auto_709427 ?auto_709433 ) ) ( not ( = ?auto_709427 ?auto_709434 ) ) ( not ( = ?auto_709427 ?auto_709435 ) ) ( not ( = ?auto_709427 ?auto_709436 ) ) ( not ( = ?auto_709427 ?auto_709437 ) ) ( not ( = ?auto_709427 ?auto_709438 ) ) ( not ( = ?auto_709427 ?auto_709439 ) ) ( not ( = ?auto_709427 ?auto_709440 ) ) ( not ( = ?auto_709427 ?auto_709441 ) ) ( not ( = ?auto_709427 ?auto_709442 ) ) ( not ( = ?auto_709427 ?auto_709443 ) ) ( not ( = ?auto_709428 ?auto_709429 ) ) ( not ( = ?auto_709428 ?auto_709430 ) ) ( not ( = ?auto_709428 ?auto_709431 ) ) ( not ( = ?auto_709428 ?auto_709432 ) ) ( not ( = ?auto_709428 ?auto_709433 ) ) ( not ( = ?auto_709428 ?auto_709434 ) ) ( not ( = ?auto_709428 ?auto_709435 ) ) ( not ( = ?auto_709428 ?auto_709436 ) ) ( not ( = ?auto_709428 ?auto_709437 ) ) ( not ( = ?auto_709428 ?auto_709438 ) ) ( not ( = ?auto_709428 ?auto_709439 ) ) ( not ( = ?auto_709428 ?auto_709440 ) ) ( not ( = ?auto_709428 ?auto_709441 ) ) ( not ( = ?auto_709428 ?auto_709442 ) ) ( not ( = ?auto_709428 ?auto_709443 ) ) ( not ( = ?auto_709429 ?auto_709430 ) ) ( not ( = ?auto_709429 ?auto_709431 ) ) ( not ( = ?auto_709429 ?auto_709432 ) ) ( not ( = ?auto_709429 ?auto_709433 ) ) ( not ( = ?auto_709429 ?auto_709434 ) ) ( not ( = ?auto_709429 ?auto_709435 ) ) ( not ( = ?auto_709429 ?auto_709436 ) ) ( not ( = ?auto_709429 ?auto_709437 ) ) ( not ( = ?auto_709429 ?auto_709438 ) ) ( not ( = ?auto_709429 ?auto_709439 ) ) ( not ( = ?auto_709429 ?auto_709440 ) ) ( not ( = ?auto_709429 ?auto_709441 ) ) ( not ( = ?auto_709429 ?auto_709442 ) ) ( not ( = ?auto_709429 ?auto_709443 ) ) ( not ( = ?auto_709430 ?auto_709431 ) ) ( not ( = ?auto_709430 ?auto_709432 ) ) ( not ( = ?auto_709430 ?auto_709433 ) ) ( not ( = ?auto_709430 ?auto_709434 ) ) ( not ( = ?auto_709430 ?auto_709435 ) ) ( not ( = ?auto_709430 ?auto_709436 ) ) ( not ( = ?auto_709430 ?auto_709437 ) ) ( not ( = ?auto_709430 ?auto_709438 ) ) ( not ( = ?auto_709430 ?auto_709439 ) ) ( not ( = ?auto_709430 ?auto_709440 ) ) ( not ( = ?auto_709430 ?auto_709441 ) ) ( not ( = ?auto_709430 ?auto_709442 ) ) ( not ( = ?auto_709430 ?auto_709443 ) ) ( not ( = ?auto_709431 ?auto_709432 ) ) ( not ( = ?auto_709431 ?auto_709433 ) ) ( not ( = ?auto_709431 ?auto_709434 ) ) ( not ( = ?auto_709431 ?auto_709435 ) ) ( not ( = ?auto_709431 ?auto_709436 ) ) ( not ( = ?auto_709431 ?auto_709437 ) ) ( not ( = ?auto_709431 ?auto_709438 ) ) ( not ( = ?auto_709431 ?auto_709439 ) ) ( not ( = ?auto_709431 ?auto_709440 ) ) ( not ( = ?auto_709431 ?auto_709441 ) ) ( not ( = ?auto_709431 ?auto_709442 ) ) ( not ( = ?auto_709431 ?auto_709443 ) ) ( not ( = ?auto_709432 ?auto_709433 ) ) ( not ( = ?auto_709432 ?auto_709434 ) ) ( not ( = ?auto_709432 ?auto_709435 ) ) ( not ( = ?auto_709432 ?auto_709436 ) ) ( not ( = ?auto_709432 ?auto_709437 ) ) ( not ( = ?auto_709432 ?auto_709438 ) ) ( not ( = ?auto_709432 ?auto_709439 ) ) ( not ( = ?auto_709432 ?auto_709440 ) ) ( not ( = ?auto_709432 ?auto_709441 ) ) ( not ( = ?auto_709432 ?auto_709442 ) ) ( not ( = ?auto_709432 ?auto_709443 ) ) ( not ( = ?auto_709433 ?auto_709434 ) ) ( not ( = ?auto_709433 ?auto_709435 ) ) ( not ( = ?auto_709433 ?auto_709436 ) ) ( not ( = ?auto_709433 ?auto_709437 ) ) ( not ( = ?auto_709433 ?auto_709438 ) ) ( not ( = ?auto_709433 ?auto_709439 ) ) ( not ( = ?auto_709433 ?auto_709440 ) ) ( not ( = ?auto_709433 ?auto_709441 ) ) ( not ( = ?auto_709433 ?auto_709442 ) ) ( not ( = ?auto_709433 ?auto_709443 ) ) ( not ( = ?auto_709434 ?auto_709435 ) ) ( not ( = ?auto_709434 ?auto_709436 ) ) ( not ( = ?auto_709434 ?auto_709437 ) ) ( not ( = ?auto_709434 ?auto_709438 ) ) ( not ( = ?auto_709434 ?auto_709439 ) ) ( not ( = ?auto_709434 ?auto_709440 ) ) ( not ( = ?auto_709434 ?auto_709441 ) ) ( not ( = ?auto_709434 ?auto_709442 ) ) ( not ( = ?auto_709434 ?auto_709443 ) ) ( not ( = ?auto_709435 ?auto_709436 ) ) ( not ( = ?auto_709435 ?auto_709437 ) ) ( not ( = ?auto_709435 ?auto_709438 ) ) ( not ( = ?auto_709435 ?auto_709439 ) ) ( not ( = ?auto_709435 ?auto_709440 ) ) ( not ( = ?auto_709435 ?auto_709441 ) ) ( not ( = ?auto_709435 ?auto_709442 ) ) ( not ( = ?auto_709435 ?auto_709443 ) ) ( not ( = ?auto_709436 ?auto_709437 ) ) ( not ( = ?auto_709436 ?auto_709438 ) ) ( not ( = ?auto_709436 ?auto_709439 ) ) ( not ( = ?auto_709436 ?auto_709440 ) ) ( not ( = ?auto_709436 ?auto_709441 ) ) ( not ( = ?auto_709436 ?auto_709442 ) ) ( not ( = ?auto_709436 ?auto_709443 ) ) ( not ( = ?auto_709437 ?auto_709438 ) ) ( not ( = ?auto_709437 ?auto_709439 ) ) ( not ( = ?auto_709437 ?auto_709440 ) ) ( not ( = ?auto_709437 ?auto_709441 ) ) ( not ( = ?auto_709437 ?auto_709442 ) ) ( not ( = ?auto_709437 ?auto_709443 ) ) ( not ( = ?auto_709438 ?auto_709439 ) ) ( not ( = ?auto_709438 ?auto_709440 ) ) ( not ( = ?auto_709438 ?auto_709441 ) ) ( not ( = ?auto_709438 ?auto_709442 ) ) ( not ( = ?auto_709438 ?auto_709443 ) ) ( not ( = ?auto_709439 ?auto_709440 ) ) ( not ( = ?auto_709439 ?auto_709441 ) ) ( not ( = ?auto_709439 ?auto_709442 ) ) ( not ( = ?auto_709439 ?auto_709443 ) ) ( not ( = ?auto_709440 ?auto_709441 ) ) ( not ( = ?auto_709440 ?auto_709442 ) ) ( not ( = ?auto_709440 ?auto_709443 ) ) ( not ( = ?auto_709441 ?auto_709442 ) ) ( not ( = ?auto_709441 ?auto_709443 ) ) ( not ( = ?auto_709442 ?auto_709443 ) ) ( ON ?auto_709442 ?auto_709443 ) ( ON ?auto_709441 ?auto_709442 ) ( ON ?auto_709440 ?auto_709441 ) ( ON ?auto_709439 ?auto_709440 ) ( ON ?auto_709438 ?auto_709439 ) ( ON ?auto_709437 ?auto_709438 ) ( ON ?auto_709436 ?auto_709437 ) ( ON ?auto_709435 ?auto_709436 ) ( ON ?auto_709434 ?auto_709435 ) ( ON ?auto_709433 ?auto_709434 ) ( CLEAR ?auto_709431 ) ( ON ?auto_709432 ?auto_709433 ) ( CLEAR ?auto_709432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_709427 ?auto_709428 ?auto_709429 ?auto_709430 ?auto_709431 ?auto_709432 )
      ( MAKE-17PILE ?auto_709427 ?auto_709428 ?auto_709429 ?auto_709430 ?auto_709431 ?auto_709432 ?auto_709433 ?auto_709434 ?auto_709435 ?auto_709436 ?auto_709437 ?auto_709438 ?auto_709439 ?auto_709440 ?auto_709441 ?auto_709442 ?auto_709443 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709461 - BLOCK
      ?auto_709462 - BLOCK
      ?auto_709463 - BLOCK
      ?auto_709464 - BLOCK
      ?auto_709465 - BLOCK
      ?auto_709466 - BLOCK
      ?auto_709467 - BLOCK
      ?auto_709468 - BLOCK
      ?auto_709469 - BLOCK
      ?auto_709470 - BLOCK
      ?auto_709471 - BLOCK
      ?auto_709472 - BLOCK
      ?auto_709473 - BLOCK
      ?auto_709474 - BLOCK
      ?auto_709475 - BLOCK
      ?auto_709476 - BLOCK
      ?auto_709477 - BLOCK
    )
    :vars
    (
      ?auto_709478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709477 ?auto_709478 ) ( ON-TABLE ?auto_709461 ) ( ON ?auto_709462 ?auto_709461 ) ( ON ?auto_709463 ?auto_709462 ) ( ON ?auto_709464 ?auto_709463 ) ( not ( = ?auto_709461 ?auto_709462 ) ) ( not ( = ?auto_709461 ?auto_709463 ) ) ( not ( = ?auto_709461 ?auto_709464 ) ) ( not ( = ?auto_709461 ?auto_709465 ) ) ( not ( = ?auto_709461 ?auto_709466 ) ) ( not ( = ?auto_709461 ?auto_709467 ) ) ( not ( = ?auto_709461 ?auto_709468 ) ) ( not ( = ?auto_709461 ?auto_709469 ) ) ( not ( = ?auto_709461 ?auto_709470 ) ) ( not ( = ?auto_709461 ?auto_709471 ) ) ( not ( = ?auto_709461 ?auto_709472 ) ) ( not ( = ?auto_709461 ?auto_709473 ) ) ( not ( = ?auto_709461 ?auto_709474 ) ) ( not ( = ?auto_709461 ?auto_709475 ) ) ( not ( = ?auto_709461 ?auto_709476 ) ) ( not ( = ?auto_709461 ?auto_709477 ) ) ( not ( = ?auto_709461 ?auto_709478 ) ) ( not ( = ?auto_709462 ?auto_709463 ) ) ( not ( = ?auto_709462 ?auto_709464 ) ) ( not ( = ?auto_709462 ?auto_709465 ) ) ( not ( = ?auto_709462 ?auto_709466 ) ) ( not ( = ?auto_709462 ?auto_709467 ) ) ( not ( = ?auto_709462 ?auto_709468 ) ) ( not ( = ?auto_709462 ?auto_709469 ) ) ( not ( = ?auto_709462 ?auto_709470 ) ) ( not ( = ?auto_709462 ?auto_709471 ) ) ( not ( = ?auto_709462 ?auto_709472 ) ) ( not ( = ?auto_709462 ?auto_709473 ) ) ( not ( = ?auto_709462 ?auto_709474 ) ) ( not ( = ?auto_709462 ?auto_709475 ) ) ( not ( = ?auto_709462 ?auto_709476 ) ) ( not ( = ?auto_709462 ?auto_709477 ) ) ( not ( = ?auto_709462 ?auto_709478 ) ) ( not ( = ?auto_709463 ?auto_709464 ) ) ( not ( = ?auto_709463 ?auto_709465 ) ) ( not ( = ?auto_709463 ?auto_709466 ) ) ( not ( = ?auto_709463 ?auto_709467 ) ) ( not ( = ?auto_709463 ?auto_709468 ) ) ( not ( = ?auto_709463 ?auto_709469 ) ) ( not ( = ?auto_709463 ?auto_709470 ) ) ( not ( = ?auto_709463 ?auto_709471 ) ) ( not ( = ?auto_709463 ?auto_709472 ) ) ( not ( = ?auto_709463 ?auto_709473 ) ) ( not ( = ?auto_709463 ?auto_709474 ) ) ( not ( = ?auto_709463 ?auto_709475 ) ) ( not ( = ?auto_709463 ?auto_709476 ) ) ( not ( = ?auto_709463 ?auto_709477 ) ) ( not ( = ?auto_709463 ?auto_709478 ) ) ( not ( = ?auto_709464 ?auto_709465 ) ) ( not ( = ?auto_709464 ?auto_709466 ) ) ( not ( = ?auto_709464 ?auto_709467 ) ) ( not ( = ?auto_709464 ?auto_709468 ) ) ( not ( = ?auto_709464 ?auto_709469 ) ) ( not ( = ?auto_709464 ?auto_709470 ) ) ( not ( = ?auto_709464 ?auto_709471 ) ) ( not ( = ?auto_709464 ?auto_709472 ) ) ( not ( = ?auto_709464 ?auto_709473 ) ) ( not ( = ?auto_709464 ?auto_709474 ) ) ( not ( = ?auto_709464 ?auto_709475 ) ) ( not ( = ?auto_709464 ?auto_709476 ) ) ( not ( = ?auto_709464 ?auto_709477 ) ) ( not ( = ?auto_709464 ?auto_709478 ) ) ( not ( = ?auto_709465 ?auto_709466 ) ) ( not ( = ?auto_709465 ?auto_709467 ) ) ( not ( = ?auto_709465 ?auto_709468 ) ) ( not ( = ?auto_709465 ?auto_709469 ) ) ( not ( = ?auto_709465 ?auto_709470 ) ) ( not ( = ?auto_709465 ?auto_709471 ) ) ( not ( = ?auto_709465 ?auto_709472 ) ) ( not ( = ?auto_709465 ?auto_709473 ) ) ( not ( = ?auto_709465 ?auto_709474 ) ) ( not ( = ?auto_709465 ?auto_709475 ) ) ( not ( = ?auto_709465 ?auto_709476 ) ) ( not ( = ?auto_709465 ?auto_709477 ) ) ( not ( = ?auto_709465 ?auto_709478 ) ) ( not ( = ?auto_709466 ?auto_709467 ) ) ( not ( = ?auto_709466 ?auto_709468 ) ) ( not ( = ?auto_709466 ?auto_709469 ) ) ( not ( = ?auto_709466 ?auto_709470 ) ) ( not ( = ?auto_709466 ?auto_709471 ) ) ( not ( = ?auto_709466 ?auto_709472 ) ) ( not ( = ?auto_709466 ?auto_709473 ) ) ( not ( = ?auto_709466 ?auto_709474 ) ) ( not ( = ?auto_709466 ?auto_709475 ) ) ( not ( = ?auto_709466 ?auto_709476 ) ) ( not ( = ?auto_709466 ?auto_709477 ) ) ( not ( = ?auto_709466 ?auto_709478 ) ) ( not ( = ?auto_709467 ?auto_709468 ) ) ( not ( = ?auto_709467 ?auto_709469 ) ) ( not ( = ?auto_709467 ?auto_709470 ) ) ( not ( = ?auto_709467 ?auto_709471 ) ) ( not ( = ?auto_709467 ?auto_709472 ) ) ( not ( = ?auto_709467 ?auto_709473 ) ) ( not ( = ?auto_709467 ?auto_709474 ) ) ( not ( = ?auto_709467 ?auto_709475 ) ) ( not ( = ?auto_709467 ?auto_709476 ) ) ( not ( = ?auto_709467 ?auto_709477 ) ) ( not ( = ?auto_709467 ?auto_709478 ) ) ( not ( = ?auto_709468 ?auto_709469 ) ) ( not ( = ?auto_709468 ?auto_709470 ) ) ( not ( = ?auto_709468 ?auto_709471 ) ) ( not ( = ?auto_709468 ?auto_709472 ) ) ( not ( = ?auto_709468 ?auto_709473 ) ) ( not ( = ?auto_709468 ?auto_709474 ) ) ( not ( = ?auto_709468 ?auto_709475 ) ) ( not ( = ?auto_709468 ?auto_709476 ) ) ( not ( = ?auto_709468 ?auto_709477 ) ) ( not ( = ?auto_709468 ?auto_709478 ) ) ( not ( = ?auto_709469 ?auto_709470 ) ) ( not ( = ?auto_709469 ?auto_709471 ) ) ( not ( = ?auto_709469 ?auto_709472 ) ) ( not ( = ?auto_709469 ?auto_709473 ) ) ( not ( = ?auto_709469 ?auto_709474 ) ) ( not ( = ?auto_709469 ?auto_709475 ) ) ( not ( = ?auto_709469 ?auto_709476 ) ) ( not ( = ?auto_709469 ?auto_709477 ) ) ( not ( = ?auto_709469 ?auto_709478 ) ) ( not ( = ?auto_709470 ?auto_709471 ) ) ( not ( = ?auto_709470 ?auto_709472 ) ) ( not ( = ?auto_709470 ?auto_709473 ) ) ( not ( = ?auto_709470 ?auto_709474 ) ) ( not ( = ?auto_709470 ?auto_709475 ) ) ( not ( = ?auto_709470 ?auto_709476 ) ) ( not ( = ?auto_709470 ?auto_709477 ) ) ( not ( = ?auto_709470 ?auto_709478 ) ) ( not ( = ?auto_709471 ?auto_709472 ) ) ( not ( = ?auto_709471 ?auto_709473 ) ) ( not ( = ?auto_709471 ?auto_709474 ) ) ( not ( = ?auto_709471 ?auto_709475 ) ) ( not ( = ?auto_709471 ?auto_709476 ) ) ( not ( = ?auto_709471 ?auto_709477 ) ) ( not ( = ?auto_709471 ?auto_709478 ) ) ( not ( = ?auto_709472 ?auto_709473 ) ) ( not ( = ?auto_709472 ?auto_709474 ) ) ( not ( = ?auto_709472 ?auto_709475 ) ) ( not ( = ?auto_709472 ?auto_709476 ) ) ( not ( = ?auto_709472 ?auto_709477 ) ) ( not ( = ?auto_709472 ?auto_709478 ) ) ( not ( = ?auto_709473 ?auto_709474 ) ) ( not ( = ?auto_709473 ?auto_709475 ) ) ( not ( = ?auto_709473 ?auto_709476 ) ) ( not ( = ?auto_709473 ?auto_709477 ) ) ( not ( = ?auto_709473 ?auto_709478 ) ) ( not ( = ?auto_709474 ?auto_709475 ) ) ( not ( = ?auto_709474 ?auto_709476 ) ) ( not ( = ?auto_709474 ?auto_709477 ) ) ( not ( = ?auto_709474 ?auto_709478 ) ) ( not ( = ?auto_709475 ?auto_709476 ) ) ( not ( = ?auto_709475 ?auto_709477 ) ) ( not ( = ?auto_709475 ?auto_709478 ) ) ( not ( = ?auto_709476 ?auto_709477 ) ) ( not ( = ?auto_709476 ?auto_709478 ) ) ( not ( = ?auto_709477 ?auto_709478 ) ) ( ON ?auto_709476 ?auto_709477 ) ( ON ?auto_709475 ?auto_709476 ) ( ON ?auto_709474 ?auto_709475 ) ( ON ?auto_709473 ?auto_709474 ) ( ON ?auto_709472 ?auto_709473 ) ( ON ?auto_709471 ?auto_709472 ) ( ON ?auto_709470 ?auto_709471 ) ( ON ?auto_709469 ?auto_709470 ) ( ON ?auto_709468 ?auto_709469 ) ( ON ?auto_709467 ?auto_709468 ) ( ON ?auto_709466 ?auto_709467 ) ( CLEAR ?auto_709464 ) ( ON ?auto_709465 ?auto_709466 ) ( CLEAR ?auto_709465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_709461 ?auto_709462 ?auto_709463 ?auto_709464 ?auto_709465 )
      ( MAKE-17PILE ?auto_709461 ?auto_709462 ?auto_709463 ?auto_709464 ?auto_709465 ?auto_709466 ?auto_709467 ?auto_709468 ?auto_709469 ?auto_709470 ?auto_709471 ?auto_709472 ?auto_709473 ?auto_709474 ?auto_709475 ?auto_709476 ?auto_709477 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709496 - BLOCK
      ?auto_709497 - BLOCK
      ?auto_709498 - BLOCK
      ?auto_709499 - BLOCK
      ?auto_709500 - BLOCK
      ?auto_709501 - BLOCK
      ?auto_709502 - BLOCK
      ?auto_709503 - BLOCK
      ?auto_709504 - BLOCK
      ?auto_709505 - BLOCK
      ?auto_709506 - BLOCK
      ?auto_709507 - BLOCK
      ?auto_709508 - BLOCK
      ?auto_709509 - BLOCK
      ?auto_709510 - BLOCK
      ?auto_709511 - BLOCK
      ?auto_709512 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709512 ) ( ON-TABLE ?auto_709496 ) ( ON ?auto_709497 ?auto_709496 ) ( ON ?auto_709498 ?auto_709497 ) ( ON ?auto_709499 ?auto_709498 ) ( not ( = ?auto_709496 ?auto_709497 ) ) ( not ( = ?auto_709496 ?auto_709498 ) ) ( not ( = ?auto_709496 ?auto_709499 ) ) ( not ( = ?auto_709496 ?auto_709500 ) ) ( not ( = ?auto_709496 ?auto_709501 ) ) ( not ( = ?auto_709496 ?auto_709502 ) ) ( not ( = ?auto_709496 ?auto_709503 ) ) ( not ( = ?auto_709496 ?auto_709504 ) ) ( not ( = ?auto_709496 ?auto_709505 ) ) ( not ( = ?auto_709496 ?auto_709506 ) ) ( not ( = ?auto_709496 ?auto_709507 ) ) ( not ( = ?auto_709496 ?auto_709508 ) ) ( not ( = ?auto_709496 ?auto_709509 ) ) ( not ( = ?auto_709496 ?auto_709510 ) ) ( not ( = ?auto_709496 ?auto_709511 ) ) ( not ( = ?auto_709496 ?auto_709512 ) ) ( not ( = ?auto_709497 ?auto_709498 ) ) ( not ( = ?auto_709497 ?auto_709499 ) ) ( not ( = ?auto_709497 ?auto_709500 ) ) ( not ( = ?auto_709497 ?auto_709501 ) ) ( not ( = ?auto_709497 ?auto_709502 ) ) ( not ( = ?auto_709497 ?auto_709503 ) ) ( not ( = ?auto_709497 ?auto_709504 ) ) ( not ( = ?auto_709497 ?auto_709505 ) ) ( not ( = ?auto_709497 ?auto_709506 ) ) ( not ( = ?auto_709497 ?auto_709507 ) ) ( not ( = ?auto_709497 ?auto_709508 ) ) ( not ( = ?auto_709497 ?auto_709509 ) ) ( not ( = ?auto_709497 ?auto_709510 ) ) ( not ( = ?auto_709497 ?auto_709511 ) ) ( not ( = ?auto_709497 ?auto_709512 ) ) ( not ( = ?auto_709498 ?auto_709499 ) ) ( not ( = ?auto_709498 ?auto_709500 ) ) ( not ( = ?auto_709498 ?auto_709501 ) ) ( not ( = ?auto_709498 ?auto_709502 ) ) ( not ( = ?auto_709498 ?auto_709503 ) ) ( not ( = ?auto_709498 ?auto_709504 ) ) ( not ( = ?auto_709498 ?auto_709505 ) ) ( not ( = ?auto_709498 ?auto_709506 ) ) ( not ( = ?auto_709498 ?auto_709507 ) ) ( not ( = ?auto_709498 ?auto_709508 ) ) ( not ( = ?auto_709498 ?auto_709509 ) ) ( not ( = ?auto_709498 ?auto_709510 ) ) ( not ( = ?auto_709498 ?auto_709511 ) ) ( not ( = ?auto_709498 ?auto_709512 ) ) ( not ( = ?auto_709499 ?auto_709500 ) ) ( not ( = ?auto_709499 ?auto_709501 ) ) ( not ( = ?auto_709499 ?auto_709502 ) ) ( not ( = ?auto_709499 ?auto_709503 ) ) ( not ( = ?auto_709499 ?auto_709504 ) ) ( not ( = ?auto_709499 ?auto_709505 ) ) ( not ( = ?auto_709499 ?auto_709506 ) ) ( not ( = ?auto_709499 ?auto_709507 ) ) ( not ( = ?auto_709499 ?auto_709508 ) ) ( not ( = ?auto_709499 ?auto_709509 ) ) ( not ( = ?auto_709499 ?auto_709510 ) ) ( not ( = ?auto_709499 ?auto_709511 ) ) ( not ( = ?auto_709499 ?auto_709512 ) ) ( not ( = ?auto_709500 ?auto_709501 ) ) ( not ( = ?auto_709500 ?auto_709502 ) ) ( not ( = ?auto_709500 ?auto_709503 ) ) ( not ( = ?auto_709500 ?auto_709504 ) ) ( not ( = ?auto_709500 ?auto_709505 ) ) ( not ( = ?auto_709500 ?auto_709506 ) ) ( not ( = ?auto_709500 ?auto_709507 ) ) ( not ( = ?auto_709500 ?auto_709508 ) ) ( not ( = ?auto_709500 ?auto_709509 ) ) ( not ( = ?auto_709500 ?auto_709510 ) ) ( not ( = ?auto_709500 ?auto_709511 ) ) ( not ( = ?auto_709500 ?auto_709512 ) ) ( not ( = ?auto_709501 ?auto_709502 ) ) ( not ( = ?auto_709501 ?auto_709503 ) ) ( not ( = ?auto_709501 ?auto_709504 ) ) ( not ( = ?auto_709501 ?auto_709505 ) ) ( not ( = ?auto_709501 ?auto_709506 ) ) ( not ( = ?auto_709501 ?auto_709507 ) ) ( not ( = ?auto_709501 ?auto_709508 ) ) ( not ( = ?auto_709501 ?auto_709509 ) ) ( not ( = ?auto_709501 ?auto_709510 ) ) ( not ( = ?auto_709501 ?auto_709511 ) ) ( not ( = ?auto_709501 ?auto_709512 ) ) ( not ( = ?auto_709502 ?auto_709503 ) ) ( not ( = ?auto_709502 ?auto_709504 ) ) ( not ( = ?auto_709502 ?auto_709505 ) ) ( not ( = ?auto_709502 ?auto_709506 ) ) ( not ( = ?auto_709502 ?auto_709507 ) ) ( not ( = ?auto_709502 ?auto_709508 ) ) ( not ( = ?auto_709502 ?auto_709509 ) ) ( not ( = ?auto_709502 ?auto_709510 ) ) ( not ( = ?auto_709502 ?auto_709511 ) ) ( not ( = ?auto_709502 ?auto_709512 ) ) ( not ( = ?auto_709503 ?auto_709504 ) ) ( not ( = ?auto_709503 ?auto_709505 ) ) ( not ( = ?auto_709503 ?auto_709506 ) ) ( not ( = ?auto_709503 ?auto_709507 ) ) ( not ( = ?auto_709503 ?auto_709508 ) ) ( not ( = ?auto_709503 ?auto_709509 ) ) ( not ( = ?auto_709503 ?auto_709510 ) ) ( not ( = ?auto_709503 ?auto_709511 ) ) ( not ( = ?auto_709503 ?auto_709512 ) ) ( not ( = ?auto_709504 ?auto_709505 ) ) ( not ( = ?auto_709504 ?auto_709506 ) ) ( not ( = ?auto_709504 ?auto_709507 ) ) ( not ( = ?auto_709504 ?auto_709508 ) ) ( not ( = ?auto_709504 ?auto_709509 ) ) ( not ( = ?auto_709504 ?auto_709510 ) ) ( not ( = ?auto_709504 ?auto_709511 ) ) ( not ( = ?auto_709504 ?auto_709512 ) ) ( not ( = ?auto_709505 ?auto_709506 ) ) ( not ( = ?auto_709505 ?auto_709507 ) ) ( not ( = ?auto_709505 ?auto_709508 ) ) ( not ( = ?auto_709505 ?auto_709509 ) ) ( not ( = ?auto_709505 ?auto_709510 ) ) ( not ( = ?auto_709505 ?auto_709511 ) ) ( not ( = ?auto_709505 ?auto_709512 ) ) ( not ( = ?auto_709506 ?auto_709507 ) ) ( not ( = ?auto_709506 ?auto_709508 ) ) ( not ( = ?auto_709506 ?auto_709509 ) ) ( not ( = ?auto_709506 ?auto_709510 ) ) ( not ( = ?auto_709506 ?auto_709511 ) ) ( not ( = ?auto_709506 ?auto_709512 ) ) ( not ( = ?auto_709507 ?auto_709508 ) ) ( not ( = ?auto_709507 ?auto_709509 ) ) ( not ( = ?auto_709507 ?auto_709510 ) ) ( not ( = ?auto_709507 ?auto_709511 ) ) ( not ( = ?auto_709507 ?auto_709512 ) ) ( not ( = ?auto_709508 ?auto_709509 ) ) ( not ( = ?auto_709508 ?auto_709510 ) ) ( not ( = ?auto_709508 ?auto_709511 ) ) ( not ( = ?auto_709508 ?auto_709512 ) ) ( not ( = ?auto_709509 ?auto_709510 ) ) ( not ( = ?auto_709509 ?auto_709511 ) ) ( not ( = ?auto_709509 ?auto_709512 ) ) ( not ( = ?auto_709510 ?auto_709511 ) ) ( not ( = ?auto_709510 ?auto_709512 ) ) ( not ( = ?auto_709511 ?auto_709512 ) ) ( ON ?auto_709511 ?auto_709512 ) ( ON ?auto_709510 ?auto_709511 ) ( ON ?auto_709509 ?auto_709510 ) ( ON ?auto_709508 ?auto_709509 ) ( ON ?auto_709507 ?auto_709508 ) ( ON ?auto_709506 ?auto_709507 ) ( ON ?auto_709505 ?auto_709506 ) ( ON ?auto_709504 ?auto_709505 ) ( ON ?auto_709503 ?auto_709504 ) ( ON ?auto_709502 ?auto_709503 ) ( ON ?auto_709501 ?auto_709502 ) ( CLEAR ?auto_709499 ) ( ON ?auto_709500 ?auto_709501 ) ( CLEAR ?auto_709500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_709496 ?auto_709497 ?auto_709498 ?auto_709499 ?auto_709500 )
      ( MAKE-17PILE ?auto_709496 ?auto_709497 ?auto_709498 ?auto_709499 ?auto_709500 ?auto_709501 ?auto_709502 ?auto_709503 ?auto_709504 ?auto_709505 ?auto_709506 ?auto_709507 ?auto_709508 ?auto_709509 ?auto_709510 ?auto_709511 ?auto_709512 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709530 - BLOCK
      ?auto_709531 - BLOCK
      ?auto_709532 - BLOCK
      ?auto_709533 - BLOCK
      ?auto_709534 - BLOCK
      ?auto_709535 - BLOCK
      ?auto_709536 - BLOCK
      ?auto_709537 - BLOCK
      ?auto_709538 - BLOCK
      ?auto_709539 - BLOCK
      ?auto_709540 - BLOCK
      ?auto_709541 - BLOCK
      ?auto_709542 - BLOCK
      ?auto_709543 - BLOCK
      ?auto_709544 - BLOCK
      ?auto_709545 - BLOCK
      ?auto_709546 - BLOCK
    )
    :vars
    (
      ?auto_709547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709546 ?auto_709547 ) ( ON-TABLE ?auto_709530 ) ( ON ?auto_709531 ?auto_709530 ) ( ON ?auto_709532 ?auto_709531 ) ( not ( = ?auto_709530 ?auto_709531 ) ) ( not ( = ?auto_709530 ?auto_709532 ) ) ( not ( = ?auto_709530 ?auto_709533 ) ) ( not ( = ?auto_709530 ?auto_709534 ) ) ( not ( = ?auto_709530 ?auto_709535 ) ) ( not ( = ?auto_709530 ?auto_709536 ) ) ( not ( = ?auto_709530 ?auto_709537 ) ) ( not ( = ?auto_709530 ?auto_709538 ) ) ( not ( = ?auto_709530 ?auto_709539 ) ) ( not ( = ?auto_709530 ?auto_709540 ) ) ( not ( = ?auto_709530 ?auto_709541 ) ) ( not ( = ?auto_709530 ?auto_709542 ) ) ( not ( = ?auto_709530 ?auto_709543 ) ) ( not ( = ?auto_709530 ?auto_709544 ) ) ( not ( = ?auto_709530 ?auto_709545 ) ) ( not ( = ?auto_709530 ?auto_709546 ) ) ( not ( = ?auto_709530 ?auto_709547 ) ) ( not ( = ?auto_709531 ?auto_709532 ) ) ( not ( = ?auto_709531 ?auto_709533 ) ) ( not ( = ?auto_709531 ?auto_709534 ) ) ( not ( = ?auto_709531 ?auto_709535 ) ) ( not ( = ?auto_709531 ?auto_709536 ) ) ( not ( = ?auto_709531 ?auto_709537 ) ) ( not ( = ?auto_709531 ?auto_709538 ) ) ( not ( = ?auto_709531 ?auto_709539 ) ) ( not ( = ?auto_709531 ?auto_709540 ) ) ( not ( = ?auto_709531 ?auto_709541 ) ) ( not ( = ?auto_709531 ?auto_709542 ) ) ( not ( = ?auto_709531 ?auto_709543 ) ) ( not ( = ?auto_709531 ?auto_709544 ) ) ( not ( = ?auto_709531 ?auto_709545 ) ) ( not ( = ?auto_709531 ?auto_709546 ) ) ( not ( = ?auto_709531 ?auto_709547 ) ) ( not ( = ?auto_709532 ?auto_709533 ) ) ( not ( = ?auto_709532 ?auto_709534 ) ) ( not ( = ?auto_709532 ?auto_709535 ) ) ( not ( = ?auto_709532 ?auto_709536 ) ) ( not ( = ?auto_709532 ?auto_709537 ) ) ( not ( = ?auto_709532 ?auto_709538 ) ) ( not ( = ?auto_709532 ?auto_709539 ) ) ( not ( = ?auto_709532 ?auto_709540 ) ) ( not ( = ?auto_709532 ?auto_709541 ) ) ( not ( = ?auto_709532 ?auto_709542 ) ) ( not ( = ?auto_709532 ?auto_709543 ) ) ( not ( = ?auto_709532 ?auto_709544 ) ) ( not ( = ?auto_709532 ?auto_709545 ) ) ( not ( = ?auto_709532 ?auto_709546 ) ) ( not ( = ?auto_709532 ?auto_709547 ) ) ( not ( = ?auto_709533 ?auto_709534 ) ) ( not ( = ?auto_709533 ?auto_709535 ) ) ( not ( = ?auto_709533 ?auto_709536 ) ) ( not ( = ?auto_709533 ?auto_709537 ) ) ( not ( = ?auto_709533 ?auto_709538 ) ) ( not ( = ?auto_709533 ?auto_709539 ) ) ( not ( = ?auto_709533 ?auto_709540 ) ) ( not ( = ?auto_709533 ?auto_709541 ) ) ( not ( = ?auto_709533 ?auto_709542 ) ) ( not ( = ?auto_709533 ?auto_709543 ) ) ( not ( = ?auto_709533 ?auto_709544 ) ) ( not ( = ?auto_709533 ?auto_709545 ) ) ( not ( = ?auto_709533 ?auto_709546 ) ) ( not ( = ?auto_709533 ?auto_709547 ) ) ( not ( = ?auto_709534 ?auto_709535 ) ) ( not ( = ?auto_709534 ?auto_709536 ) ) ( not ( = ?auto_709534 ?auto_709537 ) ) ( not ( = ?auto_709534 ?auto_709538 ) ) ( not ( = ?auto_709534 ?auto_709539 ) ) ( not ( = ?auto_709534 ?auto_709540 ) ) ( not ( = ?auto_709534 ?auto_709541 ) ) ( not ( = ?auto_709534 ?auto_709542 ) ) ( not ( = ?auto_709534 ?auto_709543 ) ) ( not ( = ?auto_709534 ?auto_709544 ) ) ( not ( = ?auto_709534 ?auto_709545 ) ) ( not ( = ?auto_709534 ?auto_709546 ) ) ( not ( = ?auto_709534 ?auto_709547 ) ) ( not ( = ?auto_709535 ?auto_709536 ) ) ( not ( = ?auto_709535 ?auto_709537 ) ) ( not ( = ?auto_709535 ?auto_709538 ) ) ( not ( = ?auto_709535 ?auto_709539 ) ) ( not ( = ?auto_709535 ?auto_709540 ) ) ( not ( = ?auto_709535 ?auto_709541 ) ) ( not ( = ?auto_709535 ?auto_709542 ) ) ( not ( = ?auto_709535 ?auto_709543 ) ) ( not ( = ?auto_709535 ?auto_709544 ) ) ( not ( = ?auto_709535 ?auto_709545 ) ) ( not ( = ?auto_709535 ?auto_709546 ) ) ( not ( = ?auto_709535 ?auto_709547 ) ) ( not ( = ?auto_709536 ?auto_709537 ) ) ( not ( = ?auto_709536 ?auto_709538 ) ) ( not ( = ?auto_709536 ?auto_709539 ) ) ( not ( = ?auto_709536 ?auto_709540 ) ) ( not ( = ?auto_709536 ?auto_709541 ) ) ( not ( = ?auto_709536 ?auto_709542 ) ) ( not ( = ?auto_709536 ?auto_709543 ) ) ( not ( = ?auto_709536 ?auto_709544 ) ) ( not ( = ?auto_709536 ?auto_709545 ) ) ( not ( = ?auto_709536 ?auto_709546 ) ) ( not ( = ?auto_709536 ?auto_709547 ) ) ( not ( = ?auto_709537 ?auto_709538 ) ) ( not ( = ?auto_709537 ?auto_709539 ) ) ( not ( = ?auto_709537 ?auto_709540 ) ) ( not ( = ?auto_709537 ?auto_709541 ) ) ( not ( = ?auto_709537 ?auto_709542 ) ) ( not ( = ?auto_709537 ?auto_709543 ) ) ( not ( = ?auto_709537 ?auto_709544 ) ) ( not ( = ?auto_709537 ?auto_709545 ) ) ( not ( = ?auto_709537 ?auto_709546 ) ) ( not ( = ?auto_709537 ?auto_709547 ) ) ( not ( = ?auto_709538 ?auto_709539 ) ) ( not ( = ?auto_709538 ?auto_709540 ) ) ( not ( = ?auto_709538 ?auto_709541 ) ) ( not ( = ?auto_709538 ?auto_709542 ) ) ( not ( = ?auto_709538 ?auto_709543 ) ) ( not ( = ?auto_709538 ?auto_709544 ) ) ( not ( = ?auto_709538 ?auto_709545 ) ) ( not ( = ?auto_709538 ?auto_709546 ) ) ( not ( = ?auto_709538 ?auto_709547 ) ) ( not ( = ?auto_709539 ?auto_709540 ) ) ( not ( = ?auto_709539 ?auto_709541 ) ) ( not ( = ?auto_709539 ?auto_709542 ) ) ( not ( = ?auto_709539 ?auto_709543 ) ) ( not ( = ?auto_709539 ?auto_709544 ) ) ( not ( = ?auto_709539 ?auto_709545 ) ) ( not ( = ?auto_709539 ?auto_709546 ) ) ( not ( = ?auto_709539 ?auto_709547 ) ) ( not ( = ?auto_709540 ?auto_709541 ) ) ( not ( = ?auto_709540 ?auto_709542 ) ) ( not ( = ?auto_709540 ?auto_709543 ) ) ( not ( = ?auto_709540 ?auto_709544 ) ) ( not ( = ?auto_709540 ?auto_709545 ) ) ( not ( = ?auto_709540 ?auto_709546 ) ) ( not ( = ?auto_709540 ?auto_709547 ) ) ( not ( = ?auto_709541 ?auto_709542 ) ) ( not ( = ?auto_709541 ?auto_709543 ) ) ( not ( = ?auto_709541 ?auto_709544 ) ) ( not ( = ?auto_709541 ?auto_709545 ) ) ( not ( = ?auto_709541 ?auto_709546 ) ) ( not ( = ?auto_709541 ?auto_709547 ) ) ( not ( = ?auto_709542 ?auto_709543 ) ) ( not ( = ?auto_709542 ?auto_709544 ) ) ( not ( = ?auto_709542 ?auto_709545 ) ) ( not ( = ?auto_709542 ?auto_709546 ) ) ( not ( = ?auto_709542 ?auto_709547 ) ) ( not ( = ?auto_709543 ?auto_709544 ) ) ( not ( = ?auto_709543 ?auto_709545 ) ) ( not ( = ?auto_709543 ?auto_709546 ) ) ( not ( = ?auto_709543 ?auto_709547 ) ) ( not ( = ?auto_709544 ?auto_709545 ) ) ( not ( = ?auto_709544 ?auto_709546 ) ) ( not ( = ?auto_709544 ?auto_709547 ) ) ( not ( = ?auto_709545 ?auto_709546 ) ) ( not ( = ?auto_709545 ?auto_709547 ) ) ( not ( = ?auto_709546 ?auto_709547 ) ) ( ON ?auto_709545 ?auto_709546 ) ( ON ?auto_709544 ?auto_709545 ) ( ON ?auto_709543 ?auto_709544 ) ( ON ?auto_709542 ?auto_709543 ) ( ON ?auto_709541 ?auto_709542 ) ( ON ?auto_709540 ?auto_709541 ) ( ON ?auto_709539 ?auto_709540 ) ( ON ?auto_709538 ?auto_709539 ) ( ON ?auto_709537 ?auto_709538 ) ( ON ?auto_709536 ?auto_709537 ) ( ON ?auto_709535 ?auto_709536 ) ( ON ?auto_709534 ?auto_709535 ) ( CLEAR ?auto_709532 ) ( ON ?auto_709533 ?auto_709534 ) ( CLEAR ?auto_709533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_709530 ?auto_709531 ?auto_709532 ?auto_709533 )
      ( MAKE-17PILE ?auto_709530 ?auto_709531 ?auto_709532 ?auto_709533 ?auto_709534 ?auto_709535 ?auto_709536 ?auto_709537 ?auto_709538 ?auto_709539 ?auto_709540 ?auto_709541 ?auto_709542 ?auto_709543 ?auto_709544 ?auto_709545 ?auto_709546 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709565 - BLOCK
      ?auto_709566 - BLOCK
      ?auto_709567 - BLOCK
      ?auto_709568 - BLOCK
      ?auto_709569 - BLOCK
      ?auto_709570 - BLOCK
      ?auto_709571 - BLOCK
      ?auto_709572 - BLOCK
      ?auto_709573 - BLOCK
      ?auto_709574 - BLOCK
      ?auto_709575 - BLOCK
      ?auto_709576 - BLOCK
      ?auto_709577 - BLOCK
      ?auto_709578 - BLOCK
      ?auto_709579 - BLOCK
      ?auto_709580 - BLOCK
      ?auto_709581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709581 ) ( ON-TABLE ?auto_709565 ) ( ON ?auto_709566 ?auto_709565 ) ( ON ?auto_709567 ?auto_709566 ) ( not ( = ?auto_709565 ?auto_709566 ) ) ( not ( = ?auto_709565 ?auto_709567 ) ) ( not ( = ?auto_709565 ?auto_709568 ) ) ( not ( = ?auto_709565 ?auto_709569 ) ) ( not ( = ?auto_709565 ?auto_709570 ) ) ( not ( = ?auto_709565 ?auto_709571 ) ) ( not ( = ?auto_709565 ?auto_709572 ) ) ( not ( = ?auto_709565 ?auto_709573 ) ) ( not ( = ?auto_709565 ?auto_709574 ) ) ( not ( = ?auto_709565 ?auto_709575 ) ) ( not ( = ?auto_709565 ?auto_709576 ) ) ( not ( = ?auto_709565 ?auto_709577 ) ) ( not ( = ?auto_709565 ?auto_709578 ) ) ( not ( = ?auto_709565 ?auto_709579 ) ) ( not ( = ?auto_709565 ?auto_709580 ) ) ( not ( = ?auto_709565 ?auto_709581 ) ) ( not ( = ?auto_709566 ?auto_709567 ) ) ( not ( = ?auto_709566 ?auto_709568 ) ) ( not ( = ?auto_709566 ?auto_709569 ) ) ( not ( = ?auto_709566 ?auto_709570 ) ) ( not ( = ?auto_709566 ?auto_709571 ) ) ( not ( = ?auto_709566 ?auto_709572 ) ) ( not ( = ?auto_709566 ?auto_709573 ) ) ( not ( = ?auto_709566 ?auto_709574 ) ) ( not ( = ?auto_709566 ?auto_709575 ) ) ( not ( = ?auto_709566 ?auto_709576 ) ) ( not ( = ?auto_709566 ?auto_709577 ) ) ( not ( = ?auto_709566 ?auto_709578 ) ) ( not ( = ?auto_709566 ?auto_709579 ) ) ( not ( = ?auto_709566 ?auto_709580 ) ) ( not ( = ?auto_709566 ?auto_709581 ) ) ( not ( = ?auto_709567 ?auto_709568 ) ) ( not ( = ?auto_709567 ?auto_709569 ) ) ( not ( = ?auto_709567 ?auto_709570 ) ) ( not ( = ?auto_709567 ?auto_709571 ) ) ( not ( = ?auto_709567 ?auto_709572 ) ) ( not ( = ?auto_709567 ?auto_709573 ) ) ( not ( = ?auto_709567 ?auto_709574 ) ) ( not ( = ?auto_709567 ?auto_709575 ) ) ( not ( = ?auto_709567 ?auto_709576 ) ) ( not ( = ?auto_709567 ?auto_709577 ) ) ( not ( = ?auto_709567 ?auto_709578 ) ) ( not ( = ?auto_709567 ?auto_709579 ) ) ( not ( = ?auto_709567 ?auto_709580 ) ) ( not ( = ?auto_709567 ?auto_709581 ) ) ( not ( = ?auto_709568 ?auto_709569 ) ) ( not ( = ?auto_709568 ?auto_709570 ) ) ( not ( = ?auto_709568 ?auto_709571 ) ) ( not ( = ?auto_709568 ?auto_709572 ) ) ( not ( = ?auto_709568 ?auto_709573 ) ) ( not ( = ?auto_709568 ?auto_709574 ) ) ( not ( = ?auto_709568 ?auto_709575 ) ) ( not ( = ?auto_709568 ?auto_709576 ) ) ( not ( = ?auto_709568 ?auto_709577 ) ) ( not ( = ?auto_709568 ?auto_709578 ) ) ( not ( = ?auto_709568 ?auto_709579 ) ) ( not ( = ?auto_709568 ?auto_709580 ) ) ( not ( = ?auto_709568 ?auto_709581 ) ) ( not ( = ?auto_709569 ?auto_709570 ) ) ( not ( = ?auto_709569 ?auto_709571 ) ) ( not ( = ?auto_709569 ?auto_709572 ) ) ( not ( = ?auto_709569 ?auto_709573 ) ) ( not ( = ?auto_709569 ?auto_709574 ) ) ( not ( = ?auto_709569 ?auto_709575 ) ) ( not ( = ?auto_709569 ?auto_709576 ) ) ( not ( = ?auto_709569 ?auto_709577 ) ) ( not ( = ?auto_709569 ?auto_709578 ) ) ( not ( = ?auto_709569 ?auto_709579 ) ) ( not ( = ?auto_709569 ?auto_709580 ) ) ( not ( = ?auto_709569 ?auto_709581 ) ) ( not ( = ?auto_709570 ?auto_709571 ) ) ( not ( = ?auto_709570 ?auto_709572 ) ) ( not ( = ?auto_709570 ?auto_709573 ) ) ( not ( = ?auto_709570 ?auto_709574 ) ) ( not ( = ?auto_709570 ?auto_709575 ) ) ( not ( = ?auto_709570 ?auto_709576 ) ) ( not ( = ?auto_709570 ?auto_709577 ) ) ( not ( = ?auto_709570 ?auto_709578 ) ) ( not ( = ?auto_709570 ?auto_709579 ) ) ( not ( = ?auto_709570 ?auto_709580 ) ) ( not ( = ?auto_709570 ?auto_709581 ) ) ( not ( = ?auto_709571 ?auto_709572 ) ) ( not ( = ?auto_709571 ?auto_709573 ) ) ( not ( = ?auto_709571 ?auto_709574 ) ) ( not ( = ?auto_709571 ?auto_709575 ) ) ( not ( = ?auto_709571 ?auto_709576 ) ) ( not ( = ?auto_709571 ?auto_709577 ) ) ( not ( = ?auto_709571 ?auto_709578 ) ) ( not ( = ?auto_709571 ?auto_709579 ) ) ( not ( = ?auto_709571 ?auto_709580 ) ) ( not ( = ?auto_709571 ?auto_709581 ) ) ( not ( = ?auto_709572 ?auto_709573 ) ) ( not ( = ?auto_709572 ?auto_709574 ) ) ( not ( = ?auto_709572 ?auto_709575 ) ) ( not ( = ?auto_709572 ?auto_709576 ) ) ( not ( = ?auto_709572 ?auto_709577 ) ) ( not ( = ?auto_709572 ?auto_709578 ) ) ( not ( = ?auto_709572 ?auto_709579 ) ) ( not ( = ?auto_709572 ?auto_709580 ) ) ( not ( = ?auto_709572 ?auto_709581 ) ) ( not ( = ?auto_709573 ?auto_709574 ) ) ( not ( = ?auto_709573 ?auto_709575 ) ) ( not ( = ?auto_709573 ?auto_709576 ) ) ( not ( = ?auto_709573 ?auto_709577 ) ) ( not ( = ?auto_709573 ?auto_709578 ) ) ( not ( = ?auto_709573 ?auto_709579 ) ) ( not ( = ?auto_709573 ?auto_709580 ) ) ( not ( = ?auto_709573 ?auto_709581 ) ) ( not ( = ?auto_709574 ?auto_709575 ) ) ( not ( = ?auto_709574 ?auto_709576 ) ) ( not ( = ?auto_709574 ?auto_709577 ) ) ( not ( = ?auto_709574 ?auto_709578 ) ) ( not ( = ?auto_709574 ?auto_709579 ) ) ( not ( = ?auto_709574 ?auto_709580 ) ) ( not ( = ?auto_709574 ?auto_709581 ) ) ( not ( = ?auto_709575 ?auto_709576 ) ) ( not ( = ?auto_709575 ?auto_709577 ) ) ( not ( = ?auto_709575 ?auto_709578 ) ) ( not ( = ?auto_709575 ?auto_709579 ) ) ( not ( = ?auto_709575 ?auto_709580 ) ) ( not ( = ?auto_709575 ?auto_709581 ) ) ( not ( = ?auto_709576 ?auto_709577 ) ) ( not ( = ?auto_709576 ?auto_709578 ) ) ( not ( = ?auto_709576 ?auto_709579 ) ) ( not ( = ?auto_709576 ?auto_709580 ) ) ( not ( = ?auto_709576 ?auto_709581 ) ) ( not ( = ?auto_709577 ?auto_709578 ) ) ( not ( = ?auto_709577 ?auto_709579 ) ) ( not ( = ?auto_709577 ?auto_709580 ) ) ( not ( = ?auto_709577 ?auto_709581 ) ) ( not ( = ?auto_709578 ?auto_709579 ) ) ( not ( = ?auto_709578 ?auto_709580 ) ) ( not ( = ?auto_709578 ?auto_709581 ) ) ( not ( = ?auto_709579 ?auto_709580 ) ) ( not ( = ?auto_709579 ?auto_709581 ) ) ( not ( = ?auto_709580 ?auto_709581 ) ) ( ON ?auto_709580 ?auto_709581 ) ( ON ?auto_709579 ?auto_709580 ) ( ON ?auto_709578 ?auto_709579 ) ( ON ?auto_709577 ?auto_709578 ) ( ON ?auto_709576 ?auto_709577 ) ( ON ?auto_709575 ?auto_709576 ) ( ON ?auto_709574 ?auto_709575 ) ( ON ?auto_709573 ?auto_709574 ) ( ON ?auto_709572 ?auto_709573 ) ( ON ?auto_709571 ?auto_709572 ) ( ON ?auto_709570 ?auto_709571 ) ( ON ?auto_709569 ?auto_709570 ) ( CLEAR ?auto_709567 ) ( ON ?auto_709568 ?auto_709569 ) ( CLEAR ?auto_709568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_709565 ?auto_709566 ?auto_709567 ?auto_709568 )
      ( MAKE-17PILE ?auto_709565 ?auto_709566 ?auto_709567 ?auto_709568 ?auto_709569 ?auto_709570 ?auto_709571 ?auto_709572 ?auto_709573 ?auto_709574 ?auto_709575 ?auto_709576 ?auto_709577 ?auto_709578 ?auto_709579 ?auto_709580 ?auto_709581 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709599 - BLOCK
      ?auto_709600 - BLOCK
      ?auto_709601 - BLOCK
      ?auto_709602 - BLOCK
      ?auto_709603 - BLOCK
      ?auto_709604 - BLOCK
      ?auto_709605 - BLOCK
      ?auto_709606 - BLOCK
      ?auto_709607 - BLOCK
      ?auto_709608 - BLOCK
      ?auto_709609 - BLOCK
      ?auto_709610 - BLOCK
      ?auto_709611 - BLOCK
      ?auto_709612 - BLOCK
      ?auto_709613 - BLOCK
      ?auto_709614 - BLOCK
      ?auto_709615 - BLOCK
    )
    :vars
    (
      ?auto_709616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709615 ?auto_709616 ) ( ON-TABLE ?auto_709599 ) ( ON ?auto_709600 ?auto_709599 ) ( not ( = ?auto_709599 ?auto_709600 ) ) ( not ( = ?auto_709599 ?auto_709601 ) ) ( not ( = ?auto_709599 ?auto_709602 ) ) ( not ( = ?auto_709599 ?auto_709603 ) ) ( not ( = ?auto_709599 ?auto_709604 ) ) ( not ( = ?auto_709599 ?auto_709605 ) ) ( not ( = ?auto_709599 ?auto_709606 ) ) ( not ( = ?auto_709599 ?auto_709607 ) ) ( not ( = ?auto_709599 ?auto_709608 ) ) ( not ( = ?auto_709599 ?auto_709609 ) ) ( not ( = ?auto_709599 ?auto_709610 ) ) ( not ( = ?auto_709599 ?auto_709611 ) ) ( not ( = ?auto_709599 ?auto_709612 ) ) ( not ( = ?auto_709599 ?auto_709613 ) ) ( not ( = ?auto_709599 ?auto_709614 ) ) ( not ( = ?auto_709599 ?auto_709615 ) ) ( not ( = ?auto_709599 ?auto_709616 ) ) ( not ( = ?auto_709600 ?auto_709601 ) ) ( not ( = ?auto_709600 ?auto_709602 ) ) ( not ( = ?auto_709600 ?auto_709603 ) ) ( not ( = ?auto_709600 ?auto_709604 ) ) ( not ( = ?auto_709600 ?auto_709605 ) ) ( not ( = ?auto_709600 ?auto_709606 ) ) ( not ( = ?auto_709600 ?auto_709607 ) ) ( not ( = ?auto_709600 ?auto_709608 ) ) ( not ( = ?auto_709600 ?auto_709609 ) ) ( not ( = ?auto_709600 ?auto_709610 ) ) ( not ( = ?auto_709600 ?auto_709611 ) ) ( not ( = ?auto_709600 ?auto_709612 ) ) ( not ( = ?auto_709600 ?auto_709613 ) ) ( not ( = ?auto_709600 ?auto_709614 ) ) ( not ( = ?auto_709600 ?auto_709615 ) ) ( not ( = ?auto_709600 ?auto_709616 ) ) ( not ( = ?auto_709601 ?auto_709602 ) ) ( not ( = ?auto_709601 ?auto_709603 ) ) ( not ( = ?auto_709601 ?auto_709604 ) ) ( not ( = ?auto_709601 ?auto_709605 ) ) ( not ( = ?auto_709601 ?auto_709606 ) ) ( not ( = ?auto_709601 ?auto_709607 ) ) ( not ( = ?auto_709601 ?auto_709608 ) ) ( not ( = ?auto_709601 ?auto_709609 ) ) ( not ( = ?auto_709601 ?auto_709610 ) ) ( not ( = ?auto_709601 ?auto_709611 ) ) ( not ( = ?auto_709601 ?auto_709612 ) ) ( not ( = ?auto_709601 ?auto_709613 ) ) ( not ( = ?auto_709601 ?auto_709614 ) ) ( not ( = ?auto_709601 ?auto_709615 ) ) ( not ( = ?auto_709601 ?auto_709616 ) ) ( not ( = ?auto_709602 ?auto_709603 ) ) ( not ( = ?auto_709602 ?auto_709604 ) ) ( not ( = ?auto_709602 ?auto_709605 ) ) ( not ( = ?auto_709602 ?auto_709606 ) ) ( not ( = ?auto_709602 ?auto_709607 ) ) ( not ( = ?auto_709602 ?auto_709608 ) ) ( not ( = ?auto_709602 ?auto_709609 ) ) ( not ( = ?auto_709602 ?auto_709610 ) ) ( not ( = ?auto_709602 ?auto_709611 ) ) ( not ( = ?auto_709602 ?auto_709612 ) ) ( not ( = ?auto_709602 ?auto_709613 ) ) ( not ( = ?auto_709602 ?auto_709614 ) ) ( not ( = ?auto_709602 ?auto_709615 ) ) ( not ( = ?auto_709602 ?auto_709616 ) ) ( not ( = ?auto_709603 ?auto_709604 ) ) ( not ( = ?auto_709603 ?auto_709605 ) ) ( not ( = ?auto_709603 ?auto_709606 ) ) ( not ( = ?auto_709603 ?auto_709607 ) ) ( not ( = ?auto_709603 ?auto_709608 ) ) ( not ( = ?auto_709603 ?auto_709609 ) ) ( not ( = ?auto_709603 ?auto_709610 ) ) ( not ( = ?auto_709603 ?auto_709611 ) ) ( not ( = ?auto_709603 ?auto_709612 ) ) ( not ( = ?auto_709603 ?auto_709613 ) ) ( not ( = ?auto_709603 ?auto_709614 ) ) ( not ( = ?auto_709603 ?auto_709615 ) ) ( not ( = ?auto_709603 ?auto_709616 ) ) ( not ( = ?auto_709604 ?auto_709605 ) ) ( not ( = ?auto_709604 ?auto_709606 ) ) ( not ( = ?auto_709604 ?auto_709607 ) ) ( not ( = ?auto_709604 ?auto_709608 ) ) ( not ( = ?auto_709604 ?auto_709609 ) ) ( not ( = ?auto_709604 ?auto_709610 ) ) ( not ( = ?auto_709604 ?auto_709611 ) ) ( not ( = ?auto_709604 ?auto_709612 ) ) ( not ( = ?auto_709604 ?auto_709613 ) ) ( not ( = ?auto_709604 ?auto_709614 ) ) ( not ( = ?auto_709604 ?auto_709615 ) ) ( not ( = ?auto_709604 ?auto_709616 ) ) ( not ( = ?auto_709605 ?auto_709606 ) ) ( not ( = ?auto_709605 ?auto_709607 ) ) ( not ( = ?auto_709605 ?auto_709608 ) ) ( not ( = ?auto_709605 ?auto_709609 ) ) ( not ( = ?auto_709605 ?auto_709610 ) ) ( not ( = ?auto_709605 ?auto_709611 ) ) ( not ( = ?auto_709605 ?auto_709612 ) ) ( not ( = ?auto_709605 ?auto_709613 ) ) ( not ( = ?auto_709605 ?auto_709614 ) ) ( not ( = ?auto_709605 ?auto_709615 ) ) ( not ( = ?auto_709605 ?auto_709616 ) ) ( not ( = ?auto_709606 ?auto_709607 ) ) ( not ( = ?auto_709606 ?auto_709608 ) ) ( not ( = ?auto_709606 ?auto_709609 ) ) ( not ( = ?auto_709606 ?auto_709610 ) ) ( not ( = ?auto_709606 ?auto_709611 ) ) ( not ( = ?auto_709606 ?auto_709612 ) ) ( not ( = ?auto_709606 ?auto_709613 ) ) ( not ( = ?auto_709606 ?auto_709614 ) ) ( not ( = ?auto_709606 ?auto_709615 ) ) ( not ( = ?auto_709606 ?auto_709616 ) ) ( not ( = ?auto_709607 ?auto_709608 ) ) ( not ( = ?auto_709607 ?auto_709609 ) ) ( not ( = ?auto_709607 ?auto_709610 ) ) ( not ( = ?auto_709607 ?auto_709611 ) ) ( not ( = ?auto_709607 ?auto_709612 ) ) ( not ( = ?auto_709607 ?auto_709613 ) ) ( not ( = ?auto_709607 ?auto_709614 ) ) ( not ( = ?auto_709607 ?auto_709615 ) ) ( not ( = ?auto_709607 ?auto_709616 ) ) ( not ( = ?auto_709608 ?auto_709609 ) ) ( not ( = ?auto_709608 ?auto_709610 ) ) ( not ( = ?auto_709608 ?auto_709611 ) ) ( not ( = ?auto_709608 ?auto_709612 ) ) ( not ( = ?auto_709608 ?auto_709613 ) ) ( not ( = ?auto_709608 ?auto_709614 ) ) ( not ( = ?auto_709608 ?auto_709615 ) ) ( not ( = ?auto_709608 ?auto_709616 ) ) ( not ( = ?auto_709609 ?auto_709610 ) ) ( not ( = ?auto_709609 ?auto_709611 ) ) ( not ( = ?auto_709609 ?auto_709612 ) ) ( not ( = ?auto_709609 ?auto_709613 ) ) ( not ( = ?auto_709609 ?auto_709614 ) ) ( not ( = ?auto_709609 ?auto_709615 ) ) ( not ( = ?auto_709609 ?auto_709616 ) ) ( not ( = ?auto_709610 ?auto_709611 ) ) ( not ( = ?auto_709610 ?auto_709612 ) ) ( not ( = ?auto_709610 ?auto_709613 ) ) ( not ( = ?auto_709610 ?auto_709614 ) ) ( not ( = ?auto_709610 ?auto_709615 ) ) ( not ( = ?auto_709610 ?auto_709616 ) ) ( not ( = ?auto_709611 ?auto_709612 ) ) ( not ( = ?auto_709611 ?auto_709613 ) ) ( not ( = ?auto_709611 ?auto_709614 ) ) ( not ( = ?auto_709611 ?auto_709615 ) ) ( not ( = ?auto_709611 ?auto_709616 ) ) ( not ( = ?auto_709612 ?auto_709613 ) ) ( not ( = ?auto_709612 ?auto_709614 ) ) ( not ( = ?auto_709612 ?auto_709615 ) ) ( not ( = ?auto_709612 ?auto_709616 ) ) ( not ( = ?auto_709613 ?auto_709614 ) ) ( not ( = ?auto_709613 ?auto_709615 ) ) ( not ( = ?auto_709613 ?auto_709616 ) ) ( not ( = ?auto_709614 ?auto_709615 ) ) ( not ( = ?auto_709614 ?auto_709616 ) ) ( not ( = ?auto_709615 ?auto_709616 ) ) ( ON ?auto_709614 ?auto_709615 ) ( ON ?auto_709613 ?auto_709614 ) ( ON ?auto_709612 ?auto_709613 ) ( ON ?auto_709611 ?auto_709612 ) ( ON ?auto_709610 ?auto_709611 ) ( ON ?auto_709609 ?auto_709610 ) ( ON ?auto_709608 ?auto_709609 ) ( ON ?auto_709607 ?auto_709608 ) ( ON ?auto_709606 ?auto_709607 ) ( ON ?auto_709605 ?auto_709606 ) ( ON ?auto_709604 ?auto_709605 ) ( ON ?auto_709603 ?auto_709604 ) ( ON ?auto_709602 ?auto_709603 ) ( CLEAR ?auto_709600 ) ( ON ?auto_709601 ?auto_709602 ) ( CLEAR ?auto_709601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_709599 ?auto_709600 ?auto_709601 )
      ( MAKE-17PILE ?auto_709599 ?auto_709600 ?auto_709601 ?auto_709602 ?auto_709603 ?auto_709604 ?auto_709605 ?auto_709606 ?auto_709607 ?auto_709608 ?auto_709609 ?auto_709610 ?auto_709611 ?auto_709612 ?auto_709613 ?auto_709614 ?auto_709615 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709634 - BLOCK
      ?auto_709635 - BLOCK
      ?auto_709636 - BLOCK
      ?auto_709637 - BLOCK
      ?auto_709638 - BLOCK
      ?auto_709639 - BLOCK
      ?auto_709640 - BLOCK
      ?auto_709641 - BLOCK
      ?auto_709642 - BLOCK
      ?auto_709643 - BLOCK
      ?auto_709644 - BLOCK
      ?auto_709645 - BLOCK
      ?auto_709646 - BLOCK
      ?auto_709647 - BLOCK
      ?auto_709648 - BLOCK
      ?auto_709649 - BLOCK
      ?auto_709650 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709650 ) ( ON-TABLE ?auto_709634 ) ( ON ?auto_709635 ?auto_709634 ) ( not ( = ?auto_709634 ?auto_709635 ) ) ( not ( = ?auto_709634 ?auto_709636 ) ) ( not ( = ?auto_709634 ?auto_709637 ) ) ( not ( = ?auto_709634 ?auto_709638 ) ) ( not ( = ?auto_709634 ?auto_709639 ) ) ( not ( = ?auto_709634 ?auto_709640 ) ) ( not ( = ?auto_709634 ?auto_709641 ) ) ( not ( = ?auto_709634 ?auto_709642 ) ) ( not ( = ?auto_709634 ?auto_709643 ) ) ( not ( = ?auto_709634 ?auto_709644 ) ) ( not ( = ?auto_709634 ?auto_709645 ) ) ( not ( = ?auto_709634 ?auto_709646 ) ) ( not ( = ?auto_709634 ?auto_709647 ) ) ( not ( = ?auto_709634 ?auto_709648 ) ) ( not ( = ?auto_709634 ?auto_709649 ) ) ( not ( = ?auto_709634 ?auto_709650 ) ) ( not ( = ?auto_709635 ?auto_709636 ) ) ( not ( = ?auto_709635 ?auto_709637 ) ) ( not ( = ?auto_709635 ?auto_709638 ) ) ( not ( = ?auto_709635 ?auto_709639 ) ) ( not ( = ?auto_709635 ?auto_709640 ) ) ( not ( = ?auto_709635 ?auto_709641 ) ) ( not ( = ?auto_709635 ?auto_709642 ) ) ( not ( = ?auto_709635 ?auto_709643 ) ) ( not ( = ?auto_709635 ?auto_709644 ) ) ( not ( = ?auto_709635 ?auto_709645 ) ) ( not ( = ?auto_709635 ?auto_709646 ) ) ( not ( = ?auto_709635 ?auto_709647 ) ) ( not ( = ?auto_709635 ?auto_709648 ) ) ( not ( = ?auto_709635 ?auto_709649 ) ) ( not ( = ?auto_709635 ?auto_709650 ) ) ( not ( = ?auto_709636 ?auto_709637 ) ) ( not ( = ?auto_709636 ?auto_709638 ) ) ( not ( = ?auto_709636 ?auto_709639 ) ) ( not ( = ?auto_709636 ?auto_709640 ) ) ( not ( = ?auto_709636 ?auto_709641 ) ) ( not ( = ?auto_709636 ?auto_709642 ) ) ( not ( = ?auto_709636 ?auto_709643 ) ) ( not ( = ?auto_709636 ?auto_709644 ) ) ( not ( = ?auto_709636 ?auto_709645 ) ) ( not ( = ?auto_709636 ?auto_709646 ) ) ( not ( = ?auto_709636 ?auto_709647 ) ) ( not ( = ?auto_709636 ?auto_709648 ) ) ( not ( = ?auto_709636 ?auto_709649 ) ) ( not ( = ?auto_709636 ?auto_709650 ) ) ( not ( = ?auto_709637 ?auto_709638 ) ) ( not ( = ?auto_709637 ?auto_709639 ) ) ( not ( = ?auto_709637 ?auto_709640 ) ) ( not ( = ?auto_709637 ?auto_709641 ) ) ( not ( = ?auto_709637 ?auto_709642 ) ) ( not ( = ?auto_709637 ?auto_709643 ) ) ( not ( = ?auto_709637 ?auto_709644 ) ) ( not ( = ?auto_709637 ?auto_709645 ) ) ( not ( = ?auto_709637 ?auto_709646 ) ) ( not ( = ?auto_709637 ?auto_709647 ) ) ( not ( = ?auto_709637 ?auto_709648 ) ) ( not ( = ?auto_709637 ?auto_709649 ) ) ( not ( = ?auto_709637 ?auto_709650 ) ) ( not ( = ?auto_709638 ?auto_709639 ) ) ( not ( = ?auto_709638 ?auto_709640 ) ) ( not ( = ?auto_709638 ?auto_709641 ) ) ( not ( = ?auto_709638 ?auto_709642 ) ) ( not ( = ?auto_709638 ?auto_709643 ) ) ( not ( = ?auto_709638 ?auto_709644 ) ) ( not ( = ?auto_709638 ?auto_709645 ) ) ( not ( = ?auto_709638 ?auto_709646 ) ) ( not ( = ?auto_709638 ?auto_709647 ) ) ( not ( = ?auto_709638 ?auto_709648 ) ) ( not ( = ?auto_709638 ?auto_709649 ) ) ( not ( = ?auto_709638 ?auto_709650 ) ) ( not ( = ?auto_709639 ?auto_709640 ) ) ( not ( = ?auto_709639 ?auto_709641 ) ) ( not ( = ?auto_709639 ?auto_709642 ) ) ( not ( = ?auto_709639 ?auto_709643 ) ) ( not ( = ?auto_709639 ?auto_709644 ) ) ( not ( = ?auto_709639 ?auto_709645 ) ) ( not ( = ?auto_709639 ?auto_709646 ) ) ( not ( = ?auto_709639 ?auto_709647 ) ) ( not ( = ?auto_709639 ?auto_709648 ) ) ( not ( = ?auto_709639 ?auto_709649 ) ) ( not ( = ?auto_709639 ?auto_709650 ) ) ( not ( = ?auto_709640 ?auto_709641 ) ) ( not ( = ?auto_709640 ?auto_709642 ) ) ( not ( = ?auto_709640 ?auto_709643 ) ) ( not ( = ?auto_709640 ?auto_709644 ) ) ( not ( = ?auto_709640 ?auto_709645 ) ) ( not ( = ?auto_709640 ?auto_709646 ) ) ( not ( = ?auto_709640 ?auto_709647 ) ) ( not ( = ?auto_709640 ?auto_709648 ) ) ( not ( = ?auto_709640 ?auto_709649 ) ) ( not ( = ?auto_709640 ?auto_709650 ) ) ( not ( = ?auto_709641 ?auto_709642 ) ) ( not ( = ?auto_709641 ?auto_709643 ) ) ( not ( = ?auto_709641 ?auto_709644 ) ) ( not ( = ?auto_709641 ?auto_709645 ) ) ( not ( = ?auto_709641 ?auto_709646 ) ) ( not ( = ?auto_709641 ?auto_709647 ) ) ( not ( = ?auto_709641 ?auto_709648 ) ) ( not ( = ?auto_709641 ?auto_709649 ) ) ( not ( = ?auto_709641 ?auto_709650 ) ) ( not ( = ?auto_709642 ?auto_709643 ) ) ( not ( = ?auto_709642 ?auto_709644 ) ) ( not ( = ?auto_709642 ?auto_709645 ) ) ( not ( = ?auto_709642 ?auto_709646 ) ) ( not ( = ?auto_709642 ?auto_709647 ) ) ( not ( = ?auto_709642 ?auto_709648 ) ) ( not ( = ?auto_709642 ?auto_709649 ) ) ( not ( = ?auto_709642 ?auto_709650 ) ) ( not ( = ?auto_709643 ?auto_709644 ) ) ( not ( = ?auto_709643 ?auto_709645 ) ) ( not ( = ?auto_709643 ?auto_709646 ) ) ( not ( = ?auto_709643 ?auto_709647 ) ) ( not ( = ?auto_709643 ?auto_709648 ) ) ( not ( = ?auto_709643 ?auto_709649 ) ) ( not ( = ?auto_709643 ?auto_709650 ) ) ( not ( = ?auto_709644 ?auto_709645 ) ) ( not ( = ?auto_709644 ?auto_709646 ) ) ( not ( = ?auto_709644 ?auto_709647 ) ) ( not ( = ?auto_709644 ?auto_709648 ) ) ( not ( = ?auto_709644 ?auto_709649 ) ) ( not ( = ?auto_709644 ?auto_709650 ) ) ( not ( = ?auto_709645 ?auto_709646 ) ) ( not ( = ?auto_709645 ?auto_709647 ) ) ( not ( = ?auto_709645 ?auto_709648 ) ) ( not ( = ?auto_709645 ?auto_709649 ) ) ( not ( = ?auto_709645 ?auto_709650 ) ) ( not ( = ?auto_709646 ?auto_709647 ) ) ( not ( = ?auto_709646 ?auto_709648 ) ) ( not ( = ?auto_709646 ?auto_709649 ) ) ( not ( = ?auto_709646 ?auto_709650 ) ) ( not ( = ?auto_709647 ?auto_709648 ) ) ( not ( = ?auto_709647 ?auto_709649 ) ) ( not ( = ?auto_709647 ?auto_709650 ) ) ( not ( = ?auto_709648 ?auto_709649 ) ) ( not ( = ?auto_709648 ?auto_709650 ) ) ( not ( = ?auto_709649 ?auto_709650 ) ) ( ON ?auto_709649 ?auto_709650 ) ( ON ?auto_709648 ?auto_709649 ) ( ON ?auto_709647 ?auto_709648 ) ( ON ?auto_709646 ?auto_709647 ) ( ON ?auto_709645 ?auto_709646 ) ( ON ?auto_709644 ?auto_709645 ) ( ON ?auto_709643 ?auto_709644 ) ( ON ?auto_709642 ?auto_709643 ) ( ON ?auto_709641 ?auto_709642 ) ( ON ?auto_709640 ?auto_709641 ) ( ON ?auto_709639 ?auto_709640 ) ( ON ?auto_709638 ?auto_709639 ) ( ON ?auto_709637 ?auto_709638 ) ( CLEAR ?auto_709635 ) ( ON ?auto_709636 ?auto_709637 ) ( CLEAR ?auto_709636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_709634 ?auto_709635 ?auto_709636 )
      ( MAKE-17PILE ?auto_709634 ?auto_709635 ?auto_709636 ?auto_709637 ?auto_709638 ?auto_709639 ?auto_709640 ?auto_709641 ?auto_709642 ?auto_709643 ?auto_709644 ?auto_709645 ?auto_709646 ?auto_709647 ?auto_709648 ?auto_709649 ?auto_709650 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709668 - BLOCK
      ?auto_709669 - BLOCK
      ?auto_709670 - BLOCK
      ?auto_709671 - BLOCK
      ?auto_709672 - BLOCK
      ?auto_709673 - BLOCK
      ?auto_709674 - BLOCK
      ?auto_709675 - BLOCK
      ?auto_709676 - BLOCK
      ?auto_709677 - BLOCK
      ?auto_709678 - BLOCK
      ?auto_709679 - BLOCK
      ?auto_709680 - BLOCK
      ?auto_709681 - BLOCK
      ?auto_709682 - BLOCK
      ?auto_709683 - BLOCK
      ?auto_709684 - BLOCK
    )
    :vars
    (
      ?auto_709685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709684 ?auto_709685 ) ( ON-TABLE ?auto_709668 ) ( not ( = ?auto_709668 ?auto_709669 ) ) ( not ( = ?auto_709668 ?auto_709670 ) ) ( not ( = ?auto_709668 ?auto_709671 ) ) ( not ( = ?auto_709668 ?auto_709672 ) ) ( not ( = ?auto_709668 ?auto_709673 ) ) ( not ( = ?auto_709668 ?auto_709674 ) ) ( not ( = ?auto_709668 ?auto_709675 ) ) ( not ( = ?auto_709668 ?auto_709676 ) ) ( not ( = ?auto_709668 ?auto_709677 ) ) ( not ( = ?auto_709668 ?auto_709678 ) ) ( not ( = ?auto_709668 ?auto_709679 ) ) ( not ( = ?auto_709668 ?auto_709680 ) ) ( not ( = ?auto_709668 ?auto_709681 ) ) ( not ( = ?auto_709668 ?auto_709682 ) ) ( not ( = ?auto_709668 ?auto_709683 ) ) ( not ( = ?auto_709668 ?auto_709684 ) ) ( not ( = ?auto_709668 ?auto_709685 ) ) ( not ( = ?auto_709669 ?auto_709670 ) ) ( not ( = ?auto_709669 ?auto_709671 ) ) ( not ( = ?auto_709669 ?auto_709672 ) ) ( not ( = ?auto_709669 ?auto_709673 ) ) ( not ( = ?auto_709669 ?auto_709674 ) ) ( not ( = ?auto_709669 ?auto_709675 ) ) ( not ( = ?auto_709669 ?auto_709676 ) ) ( not ( = ?auto_709669 ?auto_709677 ) ) ( not ( = ?auto_709669 ?auto_709678 ) ) ( not ( = ?auto_709669 ?auto_709679 ) ) ( not ( = ?auto_709669 ?auto_709680 ) ) ( not ( = ?auto_709669 ?auto_709681 ) ) ( not ( = ?auto_709669 ?auto_709682 ) ) ( not ( = ?auto_709669 ?auto_709683 ) ) ( not ( = ?auto_709669 ?auto_709684 ) ) ( not ( = ?auto_709669 ?auto_709685 ) ) ( not ( = ?auto_709670 ?auto_709671 ) ) ( not ( = ?auto_709670 ?auto_709672 ) ) ( not ( = ?auto_709670 ?auto_709673 ) ) ( not ( = ?auto_709670 ?auto_709674 ) ) ( not ( = ?auto_709670 ?auto_709675 ) ) ( not ( = ?auto_709670 ?auto_709676 ) ) ( not ( = ?auto_709670 ?auto_709677 ) ) ( not ( = ?auto_709670 ?auto_709678 ) ) ( not ( = ?auto_709670 ?auto_709679 ) ) ( not ( = ?auto_709670 ?auto_709680 ) ) ( not ( = ?auto_709670 ?auto_709681 ) ) ( not ( = ?auto_709670 ?auto_709682 ) ) ( not ( = ?auto_709670 ?auto_709683 ) ) ( not ( = ?auto_709670 ?auto_709684 ) ) ( not ( = ?auto_709670 ?auto_709685 ) ) ( not ( = ?auto_709671 ?auto_709672 ) ) ( not ( = ?auto_709671 ?auto_709673 ) ) ( not ( = ?auto_709671 ?auto_709674 ) ) ( not ( = ?auto_709671 ?auto_709675 ) ) ( not ( = ?auto_709671 ?auto_709676 ) ) ( not ( = ?auto_709671 ?auto_709677 ) ) ( not ( = ?auto_709671 ?auto_709678 ) ) ( not ( = ?auto_709671 ?auto_709679 ) ) ( not ( = ?auto_709671 ?auto_709680 ) ) ( not ( = ?auto_709671 ?auto_709681 ) ) ( not ( = ?auto_709671 ?auto_709682 ) ) ( not ( = ?auto_709671 ?auto_709683 ) ) ( not ( = ?auto_709671 ?auto_709684 ) ) ( not ( = ?auto_709671 ?auto_709685 ) ) ( not ( = ?auto_709672 ?auto_709673 ) ) ( not ( = ?auto_709672 ?auto_709674 ) ) ( not ( = ?auto_709672 ?auto_709675 ) ) ( not ( = ?auto_709672 ?auto_709676 ) ) ( not ( = ?auto_709672 ?auto_709677 ) ) ( not ( = ?auto_709672 ?auto_709678 ) ) ( not ( = ?auto_709672 ?auto_709679 ) ) ( not ( = ?auto_709672 ?auto_709680 ) ) ( not ( = ?auto_709672 ?auto_709681 ) ) ( not ( = ?auto_709672 ?auto_709682 ) ) ( not ( = ?auto_709672 ?auto_709683 ) ) ( not ( = ?auto_709672 ?auto_709684 ) ) ( not ( = ?auto_709672 ?auto_709685 ) ) ( not ( = ?auto_709673 ?auto_709674 ) ) ( not ( = ?auto_709673 ?auto_709675 ) ) ( not ( = ?auto_709673 ?auto_709676 ) ) ( not ( = ?auto_709673 ?auto_709677 ) ) ( not ( = ?auto_709673 ?auto_709678 ) ) ( not ( = ?auto_709673 ?auto_709679 ) ) ( not ( = ?auto_709673 ?auto_709680 ) ) ( not ( = ?auto_709673 ?auto_709681 ) ) ( not ( = ?auto_709673 ?auto_709682 ) ) ( not ( = ?auto_709673 ?auto_709683 ) ) ( not ( = ?auto_709673 ?auto_709684 ) ) ( not ( = ?auto_709673 ?auto_709685 ) ) ( not ( = ?auto_709674 ?auto_709675 ) ) ( not ( = ?auto_709674 ?auto_709676 ) ) ( not ( = ?auto_709674 ?auto_709677 ) ) ( not ( = ?auto_709674 ?auto_709678 ) ) ( not ( = ?auto_709674 ?auto_709679 ) ) ( not ( = ?auto_709674 ?auto_709680 ) ) ( not ( = ?auto_709674 ?auto_709681 ) ) ( not ( = ?auto_709674 ?auto_709682 ) ) ( not ( = ?auto_709674 ?auto_709683 ) ) ( not ( = ?auto_709674 ?auto_709684 ) ) ( not ( = ?auto_709674 ?auto_709685 ) ) ( not ( = ?auto_709675 ?auto_709676 ) ) ( not ( = ?auto_709675 ?auto_709677 ) ) ( not ( = ?auto_709675 ?auto_709678 ) ) ( not ( = ?auto_709675 ?auto_709679 ) ) ( not ( = ?auto_709675 ?auto_709680 ) ) ( not ( = ?auto_709675 ?auto_709681 ) ) ( not ( = ?auto_709675 ?auto_709682 ) ) ( not ( = ?auto_709675 ?auto_709683 ) ) ( not ( = ?auto_709675 ?auto_709684 ) ) ( not ( = ?auto_709675 ?auto_709685 ) ) ( not ( = ?auto_709676 ?auto_709677 ) ) ( not ( = ?auto_709676 ?auto_709678 ) ) ( not ( = ?auto_709676 ?auto_709679 ) ) ( not ( = ?auto_709676 ?auto_709680 ) ) ( not ( = ?auto_709676 ?auto_709681 ) ) ( not ( = ?auto_709676 ?auto_709682 ) ) ( not ( = ?auto_709676 ?auto_709683 ) ) ( not ( = ?auto_709676 ?auto_709684 ) ) ( not ( = ?auto_709676 ?auto_709685 ) ) ( not ( = ?auto_709677 ?auto_709678 ) ) ( not ( = ?auto_709677 ?auto_709679 ) ) ( not ( = ?auto_709677 ?auto_709680 ) ) ( not ( = ?auto_709677 ?auto_709681 ) ) ( not ( = ?auto_709677 ?auto_709682 ) ) ( not ( = ?auto_709677 ?auto_709683 ) ) ( not ( = ?auto_709677 ?auto_709684 ) ) ( not ( = ?auto_709677 ?auto_709685 ) ) ( not ( = ?auto_709678 ?auto_709679 ) ) ( not ( = ?auto_709678 ?auto_709680 ) ) ( not ( = ?auto_709678 ?auto_709681 ) ) ( not ( = ?auto_709678 ?auto_709682 ) ) ( not ( = ?auto_709678 ?auto_709683 ) ) ( not ( = ?auto_709678 ?auto_709684 ) ) ( not ( = ?auto_709678 ?auto_709685 ) ) ( not ( = ?auto_709679 ?auto_709680 ) ) ( not ( = ?auto_709679 ?auto_709681 ) ) ( not ( = ?auto_709679 ?auto_709682 ) ) ( not ( = ?auto_709679 ?auto_709683 ) ) ( not ( = ?auto_709679 ?auto_709684 ) ) ( not ( = ?auto_709679 ?auto_709685 ) ) ( not ( = ?auto_709680 ?auto_709681 ) ) ( not ( = ?auto_709680 ?auto_709682 ) ) ( not ( = ?auto_709680 ?auto_709683 ) ) ( not ( = ?auto_709680 ?auto_709684 ) ) ( not ( = ?auto_709680 ?auto_709685 ) ) ( not ( = ?auto_709681 ?auto_709682 ) ) ( not ( = ?auto_709681 ?auto_709683 ) ) ( not ( = ?auto_709681 ?auto_709684 ) ) ( not ( = ?auto_709681 ?auto_709685 ) ) ( not ( = ?auto_709682 ?auto_709683 ) ) ( not ( = ?auto_709682 ?auto_709684 ) ) ( not ( = ?auto_709682 ?auto_709685 ) ) ( not ( = ?auto_709683 ?auto_709684 ) ) ( not ( = ?auto_709683 ?auto_709685 ) ) ( not ( = ?auto_709684 ?auto_709685 ) ) ( ON ?auto_709683 ?auto_709684 ) ( ON ?auto_709682 ?auto_709683 ) ( ON ?auto_709681 ?auto_709682 ) ( ON ?auto_709680 ?auto_709681 ) ( ON ?auto_709679 ?auto_709680 ) ( ON ?auto_709678 ?auto_709679 ) ( ON ?auto_709677 ?auto_709678 ) ( ON ?auto_709676 ?auto_709677 ) ( ON ?auto_709675 ?auto_709676 ) ( ON ?auto_709674 ?auto_709675 ) ( ON ?auto_709673 ?auto_709674 ) ( ON ?auto_709672 ?auto_709673 ) ( ON ?auto_709671 ?auto_709672 ) ( ON ?auto_709670 ?auto_709671 ) ( CLEAR ?auto_709668 ) ( ON ?auto_709669 ?auto_709670 ) ( CLEAR ?auto_709669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_709668 ?auto_709669 )
      ( MAKE-17PILE ?auto_709668 ?auto_709669 ?auto_709670 ?auto_709671 ?auto_709672 ?auto_709673 ?auto_709674 ?auto_709675 ?auto_709676 ?auto_709677 ?auto_709678 ?auto_709679 ?auto_709680 ?auto_709681 ?auto_709682 ?auto_709683 ?auto_709684 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709703 - BLOCK
      ?auto_709704 - BLOCK
      ?auto_709705 - BLOCK
      ?auto_709706 - BLOCK
      ?auto_709707 - BLOCK
      ?auto_709708 - BLOCK
      ?auto_709709 - BLOCK
      ?auto_709710 - BLOCK
      ?auto_709711 - BLOCK
      ?auto_709712 - BLOCK
      ?auto_709713 - BLOCK
      ?auto_709714 - BLOCK
      ?auto_709715 - BLOCK
      ?auto_709716 - BLOCK
      ?auto_709717 - BLOCK
      ?auto_709718 - BLOCK
      ?auto_709719 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709719 ) ( ON-TABLE ?auto_709703 ) ( not ( = ?auto_709703 ?auto_709704 ) ) ( not ( = ?auto_709703 ?auto_709705 ) ) ( not ( = ?auto_709703 ?auto_709706 ) ) ( not ( = ?auto_709703 ?auto_709707 ) ) ( not ( = ?auto_709703 ?auto_709708 ) ) ( not ( = ?auto_709703 ?auto_709709 ) ) ( not ( = ?auto_709703 ?auto_709710 ) ) ( not ( = ?auto_709703 ?auto_709711 ) ) ( not ( = ?auto_709703 ?auto_709712 ) ) ( not ( = ?auto_709703 ?auto_709713 ) ) ( not ( = ?auto_709703 ?auto_709714 ) ) ( not ( = ?auto_709703 ?auto_709715 ) ) ( not ( = ?auto_709703 ?auto_709716 ) ) ( not ( = ?auto_709703 ?auto_709717 ) ) ( not ( = ?auto_709703 ?auto_709718 ) ) ( not ( = ?auto_709703 ?auto_709719 ) ) ( not ( = ?auto_709704 ?auto_709705 ) ) ( not ( = ?auto_709704 ?auto_709706 ) ) ( not ( = ?auto_709704 ?auto_709707 ) ) ( not ( = ?auto_709704 ?auto_709708 ) ) ( not ( = ?auto_709704 ?auto_709709 ) ) ( not ( = ?auto_709704 ?auto_709710 ) ) ( not ( = ?auto_709704 ?auto_709711 ) ) ( not ( = ?auto_709704 ?auto_709712 ) ) ( not ( = ?auto_709704 ?auto_709713 ) ) ( not ( = ?auto_709704 ?auto_709714 ) ) ( not ( = ?auto_709704 ?auto_709715 ) ) ( not ( = ?auto_709704 ?auto_709716 ) ) ( not ( = ?auto_709704 ?auto_709717 ) ) ( not ( = ?auto_709704 ?auto_709718 ) ) ( not ( = ?auto_709704 ?auto_709719 ) ) ( not ( = ?auto_709705 ?auto_709706 ) ) ( not ( = ?auto_709705 ?auto_709707 ) ) ( not ( = ?auto_709705 ?auto_709708 ) ) ( not ( = ?auto_709705 ?auto_709709 ) ) ( not ( = ?auto_709705 ?auto_709710 ) ) ( not ( = ?auto_709705 ?auto_709711 ) ) ( not ( = ?auto_709705 ?auto_709712 ) ) ( not ( = ?auto_709705 ?auto_709713 ) ) ( not ( = ?auto_709705 ?auto_709714 ) ) ( not ( = ?auto_709705 ?auto_709715 ) ) ( not ( = ?auto_709705 ?auto_709716 ) ) ( not ( = ?auto_709705 ?auto_709717 ) ) ( not ( = ?auto_709705 ?auto_709718 ) ) ( not ( = ?auto_709705 ?auto_709719 ) ) ( not ( = ?auto_709706 ?auto_709707 ) ) ( not ( = ?auto_709706 ?auto_709708 ) ) ( not ( = ?auto_709706 ?auto_709709 ) ) ( not ( = ?auto_709706 ?auto_709710 ) ) ( not ( = ?auto_709706 ?auto_709711 ) ) ( not ( = ?auto_709706 ?auto_709712 ) ) ( not ( = ?auto_709706 ?auto_709713 ) ) ( not ( = ?auto_709706 ?auto_709714 ) ) ( not ( = ?auto_709706 ?auto_709715 ) ) ( not ( = ?auto_709706 ?auto_709716 ) ) ( not ( = ?auto_709706 ?auto_709717 ) ) ( not ( = ?auto_709706 ?auto_709718 ) ) ( not ( = ?auto_709706 ?auto_709719 ) ) ( not ( = ?auto_709707 ?auto_709708 ) ) ( not ( = ?auto_709707 ?auto_709709 ) ) ( not ( = ?auto_709707 ?auto_709710 ) ) ( not ( = ?auto_709707 ?auto_709711 ) ) ( not ( = ?auto_709707 ?auto_709712 ) ) ( not ( = ?auto_709707 ?auto_709713 ) ) ( not ( = ?auto_709707 ?auto_709714 ) ) ( not ( = ?auto_709707 ?auto_709715 ) ) ( not ( = ?auto_709707 ?auto_709716 ) ) ( not ( = ?auto_709707 ?auto_709717 ) ) ( not ( = ?auto_709707 ?auto_709718 ) ) ( not ( = ?auto_709707 ?auto_709719 ) ) ( not ( = ?auto_709708 ?auto_709709 ) ) ( not ( = ?auto_709708 ?auto_709710 ) ) ( not ( = ?auto_709708 ?auto_709711 ) ) ( not ( = ?auto_709708 ?auto_709712 ) ) ( not ( = ?auto_709708 ?auto_709713 ) ) ( not ( = ?auto_709708 ?auto_709714 ) ) ( not ( = ?auto_709708 ?auto_709715 ) ) ( not ( = ?auto_709708 ?auto_709716 ) ) ( not ( = ?auto_709708 ?auto_709717 ) ) ( not ( = ?auto_709708 ?auto_709718 ) ) ( not ( = ?auto_709708 ?auto_709719 ) ) ( not ( = ?auto_709709 ?auto_709710 ) ) ( not ( = ?auto_709709 ?auto_709711 ) ) ( not ( = ?auto_709709 ?auto_709712 ) ) ( not ( = ?auto_709709 ?auto_709713 ) ) ( not ( = ?auto_709709 ?auto_709714 ) ) ( not ( = ?auto_709709 ?auto_709715 ) ) ( not ( = ?auto_709709 ?auto_709716 ) ) ( not ( = ?auto_709709 ?auto_709717 ) ) ( not ( = ?auto_709709 ?auto_709718 ) ) ( not ( = ?auto_709709 ?auto_709719 ) ) ( not ( = ?auto_709710 ?auto_709711 ) ) ( not ( = ?auto_709710 ?auto_709712 ) ) ( not ( = ?auto_709710 ?auto_709713 ) ) ( not ( = ?auto_709710 ?auto_709714 ) ) ( not ( = ?auto_709710 ?auto_709715 ) ) ( not ( = ?auto_709710 ?auto_709716 ) ) ( not ( = ?auto_709710 ?auto_709717 ) ) ( not ( = ?auto_709710 ?auto_709718 ) ) ( not ( = ?auto_709710 ?auto_709719 ) ) ( not ( = ?auto_709711 ?auto_709712 ) ) ( not ( = ?auto_709711 ?auto_709713 ) ) ( not ( = ?auto_709711 ?auto_709714 ) ) ( not ( = ?auto_709711 ?auto_709715 ) ) ( not ( = ?auto_709711 ?auto_709716 ) ) ( not ( = ?auto_709711 ?auto_709717 ) ) ( not ( = ?auto_709711 ?auto_709718 ) ) ( not ( = ?auto_709711 ?auto_709719 ) ) ( not ( = ?auto_709712 ?auto_709713 ) ) ( not ( = ?auto_709712 ?auto_709714 ) ) ( not ( = ?auto_709712 ?auto_709715 ) ) ( not ( = ?auto_709712 ?auto_709716 ) ) ( not ( = ?auto_709712 ?auto_709717 ) ) ( not ( = ?auto_709712 ?auto_709718 ) ) ( not ( = ?auto_709712 ?auto_709719 ) ) ( not ( = ?auto_709713 ?auto_709714 ) ) ( not ( = ?auto_709713 ?auto_709715 ) ) ( not ( = ?auto_709713 ?auto_709716 ) ) ( not ( = ?auto_709713 ?auto_709717 ) ) ( not ( = ?auto_709713 ?auto_709718 ) ) ( not ( = ?auto_709713 ?auto_709719 ) ) ( not ( = ?auto_709714 ?auto_709715 ) ) ( not ( = ?auto_709714 ?auto_709716 ) ) ( not ( = ?auto_709714 ?auto_709717 ) ) ( not ( = ?auto_709714 ?auto_709718 ) ) ( not ( = ?auto_709714 ?auto_709719 ) ) ( not ( = ?auto_709715 ?auto_709716 ) ) ( not ( = ?auto_709715 ?auto_709717 ) ) ( not ( = ?auto_709715 ?auto_709718 ) ) ( not ( = ?auto_709715 ?auto_709719 ) ) ( not ( = ?auto_709716 ?auto_709717 ) ) ( not ( = ?auto_709716 ?auto_709718 ) ) ( not ( = ?auto_709716 ?auto_709719 ) ) ( not ( = ?auto_709717 ?auto_709718 ) ) ( not ( = ?auto_709717 ?auto_709719 ) ) ( not ( = ?auto_709718 ?auto_709719 ) ) ( ON ?auto_709718 ?auto_709719 ) ( ON ?auto_709717 ?auto_709718 ) ( ON ?auto_709716 ?auto_709717 ) ( ON ?auto_709715 ?auto_709716 ) ( ON ?auto_709714 ?auto_709715 ) ( ON ?auto_709713 ?auto_709714 ) ( ON ?auto_709712 ?auto_709713 ) ( ON ?auto_709711 ?auto_709712 ) ( ON ?auto_709710 ?auto_709711 ) ( ON ?auto_709709 ?auto_709710 ) ( ON ?auto_709708 ?auto_709709 ) ( ON ?auto_709707 ?auto_709708 ) ( ON ?auto_709706 ?auto_709707 ) ( ON ?auto_709705 ?auto_709706 ) ( CLEAR ?auto_709703 ) ( ON ?auto_709704 ?auto_709705 ) ( CLEAR ?auto_709704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_709703 ?auto_709704 )
      ( MAKE-17PILE ?auto_709703 ?auto_709704 ?auto_709705 ?auto_709706 ?auto_709707 ?auto_709708 ?auto_709709 ?auto_709710 ?auto_709711 ?auto_709712 ?auto_709713 ?auto_709714 ?auto_709715 ?auto_709716 ?auto_709717 ?auto_709718 ?auto_709719 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709737 - BLOCK
      ?auto_709738 - BLOCK
      ?auto_709739 - BLOCK
      ?auto_709740 - BLOCK
      ?auto_709741 - BLOCK
      ?auto_709742 - BLOCK
      ?auto_709743 - BLOCK
      ?auto_709744 - BLOCK
      ?auto_709745 - BLOCK
      ?auto_709746 - BLOCK
      ?auto_709747 - BLOCK
      ?auto_709748 - BLOCK
      ?auto_709749 - BLOCK
      ?auto_709750 - BLOCK
      ?auto_709751 - BLOCK
      ?auto_709752 - BLOCK
      ?auto_709753 - BLOCK
    )
    :vars
    (
      ?auto_709754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_709753 ?auto_709754 ) ( not ( = ?auto_709737 ?auto_709738 ) ) ( not ( = ?auto_709737 ?auto_709739 ) ) ( not ( = ?auto_709737 ?auto_709740 ) ) ( not ( = ?auto_709737 ?auto_709741 ) ) ( not ( = ?auto_709737 ?auto_709742 ) ) ( not ( = ?auto_709737 ?auto_709743 ) ) ( not ( = ?auto_709737 ?auto_709744 ) ) ( not ( = ?auto_709737 ?auto_709745 ) ) ( not ( = ?auto_709737 ?auto_709746 ) ) ( not ( = ?auto_709737 ?auto_709747 ) ) ( not ( = ?auto_709737 ?auto_709748 ) ) ( not ( = ?auto_709737 ?auto_709749 ) ) ( not ( = ?auto_709737 ?auto_709750 ) ) ( not ( = ?auto_709737 ?auto_709751 ) ) ( not ( = ?auto_709737 ?auto_709752 ) ) ( not ( = ?auto_709737 ?auto_709753 ) ) ( not ( = ?auto_709737 ?auto_709754 ) ) ( not ( = ?auto_709738 ?auto_709739 ) ) ( not ( = ?auto_709738 ?auto_709740 ) ) ( not ( = ?auto_709738 ?auto_709741 ) ) ( not ( = ?auto_709738 ?auto_709742 ) ) ( not ( = ?auto_709738 ?auto_709743 ) ) ( not ( = ?auto_709738 ?auto_709744 ) ) ( not ( = ?auto_709738 ?auto_709745 ) ) ( not ( = ?auto_709738 ?auto_709746 ) ) ( not ( = ?auto_709738 ?auto_709747 ) ) ( not ( = ?auto_709738 ?auto_709748 ) ) ( not ( = ?auto_709738 ?auto_709749 ) ) ( not ( = ?auto_709738 ?auto_709750 ) ) ( not ( = ?auto_709738 ?auto_709751 ) ) ( not ( = ?auto_709738 ?auto_709752 ) ) ( not ( = ?auto_709738 ?auto_709753 ) ) ( not ( = ?auto_709738 ?auto_709754 ) ) ( not ( = ?auto_709739 ?auto_709740 ) ) ( not ( = ?auto_709739 ?auto_709741 ) ) ( not ( = ?auto_709739 ?auto_709742 ) ) ( not ( = ?auto_709739 ?auto_709743 ) ) ( not ( = ?auto_709739 ?auto_709744 ) ) ( not ( = ?auto_709739 ?auto_709745 ) ) ( not ( = ?auto_709739 ?auto_709746 ) ) ( not ( = ?auto_709739 ?auto_709747 ) ) ( not ( = ?auto_709739 ?auto_709748 ) ) ( not ( = ?auto_709739 ?auto_709749 ) ) ( not ( = ?auto_709739 ?auto_709750 ) ) ( not ( = ?auto_709739 ?auto_709751 ) ) ( not ( = ?auto_709739 ?auto_709752 ) ) ( not ( = ?auto_709739 ?auto_709753 ) ) ( not ( = ?auto_709739 ?auto_709754 ) ) ( not ( = ?auto_709740 ?auto_709741 ) ) ( not ( = ?auto_709740 ?auto_709742 ) ) ( not ( = ?auto_709740 ?auto_709743 ) ) ( not ( = ?auto_709740 ?auto_709744 ) ) ( not ( = ?auto_709740 ?auto_709745 ) ) ( not ( = ?auto_709740 ?auto_709746 ) ) ( not ( = ?auto_709740 ?auto_709747 ) ) ( not ( = ?auto_709740 ?auto_709748 ) ) ( not ( = ?auto_709740 ?auto_709749 ) ) ( not ( = ?auto_709740 ?auto_709750 ) ) ( not ( = ?auto_709740 ?auto_709751 ) ) ( not ( = ?auto_709740 ?auto_709752 ) ) ( not ( = ?auto_709740 ?auto_709753 ) ) ( not ( = ?auto_709740 ?auto_709754 ) ) ( not ( = ?auto_709741 ?auto_709742 ) ) ( not ( = ?auto_709741 ?auto_709743 ) ) ( not ( = ?auto_709741 ?auto_709744 ) ) ( not ( = ?auto_709741 ?auto_709745 ) ) ( not ( = ?auto_709741 ?auto_709746 ) ) ( not ( = ?auto_709741 ?auto_709747 ) ) ( not ( = ?auto_709741 ?auto_709748 ) ) ( not ( = ?auto_709741 ?auto_709749 ) ) ( not ( = ?auto_709741 ?auto_709750 ) ) ( not ( = ?auto_709741 ?auto_709751 ) ) ( not ( = ?auto_709741 ?auto_709752 ) ) ( not ( = ?auto_709741 ?auto_709753 ) ) ( not ( = ?auto_709741 ?auto_709754 ) ) ( not ( = ?auto_709742 ?auto_709743 ) ) ( not ( = ?auto_709742 ?auto_709744 ) ) ( not ( = ?auto_709742 ?auto_709745 ) ) ( not ( = ?auto_709742 ?auto_709746 ) ) ( not ( = ?auto_709742 ?auto_709747 ) ) ( not ( = ?auto_709742 ?auto_709748 ) ) ( not ( = ?auto_709742 ?auto_709749 ) ) ( not ( = ?auto_709742 ?auto_709750 ) ) ( not ( = ?auto_709742 ?auto_709751 ) ) ( not ( = ?auto_709742 ?auto_709752 ) ) ( not ( = ?auto_709742 ?auto_709753 ) ) ( not ( = ?auto_709742 ?auto_709754 ) ) ( not ( = ?auto_709743 ?auto_709744 ) ) ( not ( = ?auto_709743 ?auto_709745 ) ) ( not ( = ?auto_709743 ?auto_709746 ) ) ( not ( = ?auto_709743 ?auto_709747 ) ) ( not ( = ?auto_709743 ?auto_709748 ) ) ( not ( = ?auto_709743 ?auto_709749 ) ) ( not ( = ?auto_709743 ?auto_709750 ) ) ( not ( = ?auto_709743 ?auto_709751 ) ) ( not ( = ?auto_709743 ?auto_709752 ) ) ( not ( = ?auto_709743 ?auto_709753 ) ) ( not ( = ?auto_709743 ?auto_709754 ) ) ( not ( = ?auto_709744 ?auto_709745 ) ) ( not ( = ?auto_709744 ?auto_709746 ) ) ( not ( = ?auto_709744 ?auto_709747 ) ) ( not ( = ?auto_709744 ?auto_709748 ) ) ( not ( = ?auto_709744 ?auto_709749 ) ) ( not ( = ?auto_709744 ?auto_709750 ) ) ( not ( = ?auto_709744 ?auto_709751 ) ) ( not ( = ?auto_709744 ?auto_709752 ) ) ( not ( = ?auto_709744 ?auto_709753 ) ) ( not ( = ?auto_709744 ?auto_709754 ) ) ( not ( = ?auto_709745 ?auto_709746 ) ) ( not ( = ?auto_709745 ?auto_709747 ) ) ( not ( = ?auto_709745 ?auto_709748 ) ) ( not ( = ?auto_709745 ?auto_709749 ) ) ( not ( = ?auto_709745 ?auto_709750 ) ) ( not ( = ?auto_709745 ?auto_709751 ) ) ( not ( = ?auto_709745 ?auto_709752 ) ) ( not ( = ?auto_709745 ?auto_709753 ) ) ( not ( = ?auto_709745 ?auto_709754 ) ) ( not ( = ?auto_709746 ?auto_709747 ) ) ( not ( = ?auto_709746 ?auto_709748 ) ) ( not ( = ?auto_709746 ?auto_709749 ) ) ( not ( = ?auto_709746 ?auto_709750 ) ) ( not ( = ?auto_709746 ?auto_709751 ) ) ( not ( = ?auto_709746 ?auto_709752 ) ) ( not ( = ?auto_709746 ?auto_709753 ) ) ( not ( = ?auto_709746 ?auto_709754 ) ) ( not ( = ?auto_709747 ?auto_709748 ) ) ( not ( = ?auto_709747 ?auto_709749 ) ) ( not ( = ?auto_709747 ?auto_709750 ) ) ( not ( = ?auto_709747 ?auto_709751 ) ) ( not ( = ?auto_709747 ?auto_709752 ) ) ( not ( = ?auto_709747 ?auto_709753 ) ) ( not ( = ?auto_709747 ?auto_709754 ) ) ( not ( = ?auto_709748 ?auto_709749 ) ) ( not ( = ?auto_709748 ?auto_709750 ) ) ( not ( = ?auto_709748 ?auto_709751 ) ) ( not ( = ?auto_709748 ?auto_709752 ) ) ( not ( = ?auto_709748 ?auto_709753 ) ) ( not ( = ?auto_709748 ?auto_709754 ) ) ( not ( = ?auto_709749 ?auto_709750 ) ) ( not ( = ?auto_709749 ?auto_709751 ) ) ( not ( = ?auto_709749 ?auto_709752 ) ) ( not ( = ?auto_709749 ?auto_709753 ) ) ( not ( = ?auto_709749 ?auto_709754 ) ) ( not ( = ?auto_709750 ?auto_709751 ) ) ( not ( = ?auto_709750 ?auto_709752 ) ) ( not ( = ?auto_709750 ?auto_709753 ) ) ( not ( = ?auto_709750 ?auto_709754 ) ) ( not ( = ?auto_709751 ?auto_709752 ) ) ( not ( = ?auto_709751 ?auto_709753 ) ) ( not ( = ?auto_709751 ?auto_709754 ) ) ( not ( = ?auto_709752 ?auto_709753 ) ) ( not ( = ?auto_709752 ?auto_709754 ) ) ( not ( = ?auto_709753 ?auto_709754 ) ) ( ON ?auto_709752 ?auto_709753 ) ( ON ?auto_709751 ?auto_709752 ) ( ON ?auto_709750 ?auto_709751 ) ( ON ?auto_709749 ?auto_709750 ) ( ON ?auto_709748 ?auto_709749 ) ( ON ?auto_709747 ?auto_709748 ) ( ON ?auto_709746 ?auto_709747 ) ( ON ?auto_709745 ?auto_709746 ) ( ON ?auto_709744 ?auto_709745 ) ( ON ?auto_709743 ?auto_709744 ) ( ON ?auto_709742 ?auto_709743 ) ( ON ?auto_709741 ?auto_709742 ) ( ON ?auto_709740 ?auto_709741 ) ( ON ?auto_709739 ?auto_709740 ) ( ON ?auto_709738 ?auto_709739 ) ( ON ?auto_709737 ?auto_709738 ) ( CLEAR ?auto_709737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_709737 )
      ( MAKE-17PILE ?auto_709737 ?auto_709738 ?auto_709739 ?auto_709740 ?auto_709741 ?auto_709742 ?auto_709743 ?auto_709744 ?auto_709745 ?auto_709746 ?auto_709747 ?auto_709748 ?auto_709749 ?auto_709750 ?auto_709751 ?auto_709752 ?auto_709753 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709772 - BLOCK
      ?auto_709773 - BLOCK
      ?auto_709774 - BLOCK
      ?auto_709775 - BLOCK
      ?auto_709776 - BLOCK
      ?auto_709777 - BLOCK
      ?auto_709778 - BLOCK
      ?auto_709779 - BLOCK
      ?auto_709780 - BLOCK
      ?auto_709781 - BLOCK
      ?auto_709782 - BLOCK
      ?auto_709783 - BLOCK
      ?auto_709784 - BLOCK
      ?auto_709785 - BLOCK
      ?auto_709786 - BLOCK
      ?auto_709787 - BLOCK
      ?auto_709788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_709788 ) ( not ( = ?auto_709772 ?auto_709773 ) ) ( not ( = ?auto_709772 ?auto_709774 ) ) ( not ( = ?auto_709772 ?auto_709775 ) ) ( not ( = ?auto_709772 ?auto_709776 ) ) ( not ( = ?auto_709772 ?auto_709777 ) ) ( not ( = ?auto_709772 ?auto_709778 ) ) ( not ( = ?auto_709772 ?auto_709779 ) ) ( not ( = ?auto_709772 ?auto_709780 ) ) ( not ( = ?auto_709772 ?auto_709781 ) ) ( not ( = ?auto_709772 ?auto_709782 ) ) ( not ( = ?auto_709772 ?auto_709783 ) ) ( not ( = ?auto_709772 ?auto_709784 ) ) ( not ( = ?auto_709772 ?auto_709785 ) ) ( not ( = ?auto_709772 ?auto_709786 ) ) ( not ( = ?auto_709772 ?auto_709787 ) ) ( not ( = ?auto_709772 ?auto_709788 ) ) ( not ( = ?auto_709773 ?auto_709774 ) ) ( not ( = ?auto_709773 ?auto_709775 ) ) ( not ( = ?auto_709773 ?auto_709776 ) ) ( not ( = ?auto_709773 ?auto_709777 ) ) ( not ( = ?auto_709773 ?auto_709778 ) ) ( not ( = ?auto_709773 ?auto_709779 ) ) ( not ( = ?auto_709773 ?auto_709780 ) ) ( not ( = ?auto_709773 ?auto_709781 ) ) ( not ( = ?auto_709773 ?auto_709782 ) ) ( not ( = ?auto_709773 ?auto_709783 ) ) ( not ( = ?auto_709773 ?auto_709784 ) ) ( not ( = ?auto_709773 ?auto_709785 ) ) ( not ( = ?auto_709773 ?auto_709786 ) ) ( not ( = ?auto_709773 ?auto_709787 ) ) ( not ( = ?auto_709773 ?auto_709788 ) ) ( not ( = ?auto_709774 ?auto_709775 ) ) ( not ( = ?auto_709774 ?auto_709776 ) ) ( not ( = ?auto_709774 ?auto_709777 ) ) ( not ( = ?auto_709774 ?auto_709778 ) ) ( not ( = ?auto_709774 ?auto_709779 ) ) ( not ( = ?auto_709774 ?auto_709780 ) ) ( not ( = ?auto_709774 ?auto_709781 ) ) ( not ( = ?auto_709774 ?auto_709782 ) ) ( not ( = ?auto_709774 ?auto_709783 ) ) ( not ( = ?auto_709774 ?auto_709784 ) ) ( not ( = ?auto_709774 ?auto_709785 ) ) ( not ( = ?auto_709774 ?auto_709786 ) ) ( not ( = ?auto_709774 ?auto_709787 ) ) ( not ( = ?auto_709774 ?auto_709788 ) ) ( not ( = ?auto_709775 ?auto_709776 ) ) ( not ( = ?auto_709775 ?auto_709777 ) ) ( not ( = ?auto_709775 ?auto_709778 ) ) ( not ( = ?auto_709775 ?auto_709779 ) ) ( not ( = ?auto_709775 ?auto_709780 ) ) ( not ( = ?auto_709775 ?auto_709781 ) ) ( not ( = ?auto_709775 ?auto_709782 ) ) ( not ( = ?auto_709775 ?auto_709783 ) ) ( not ( = ?auto_709775 ?auto_709784 ) ) ( not ( = ?auto_709775 ?auto_709785 ) ) ( not ( = ?auto_709775 ?auto_709786 ) ) ( not ( = ?auto_709775 ?auto_709787 ) ) ( not ( = ?auto_709775 ?auto_709788 ) ) ( not ( = ?auto_709776 ?auto_709777 ) ) ( not ( = ?auto_709776 ?auto_709778 ) ) ( not ( = ?auto_709776 ?auto_709779 ) ) ( not ( = ?auto_709776 ?auto_709780 ) ) ( not ( = ?auto_709776 ?auto_709781 ) ) ( not ( = ?auto_709776 ?auto_709782 ) ) ( not ( = ?auto_709776 ?auto_709783 ) ) ( not ( = ?auto_709776 ?auto_709784 ) ) ( not ( = ?auto_709776 ?auto_709785 ) ) ( not ( = ?auto_709776 ?auto_709786 ) ) ( not ( = ?auto_709776 ?auto_709787 ) ) ( not ( = ?auto_709776 ?auto_709788 ) ) ( not ( = ?auto_709777 ?auto_709778 ) ) ( not ( = ?auto_709777 ?auto_709779 ) ) ( not ( = ?auto_709777 ?auto_709780 ) ) ( not ( = ?auto_709777 ?auto_709781 ) ) ( not ( = ?auto_709777 ?auto_709782 ) ) ( not ( = ?auto_709777 ?auto_709783 ) ) ( not ( = ?auto_709777 ?auto_709784 ) ) ( not ( = ?auto_709777 ?auto_709785 ) ) ( not ( = ?auto_709777 ?auto_709786 ) ) ( not ( = ?auto_709777 ?auto_709787 ) ) ( not ( = ?auto_709777 ?auto_709788 ) ) ( not ( = ?auto_709778 ?auto_709779 ) ) ( not ( = ?auto_709778 ?auto_709780 ) ) ( not ( = ?auto_709778 ?auto_709781 ) ) ( not ( = ?auto_709778 ?auto_709782 ) ) ( not ( = ?auto_709778 ?auto_709783 ) ) ( not ( = ?auto_709778 ?auto_709784 ) ) ( not ( = ?auto_709778 ?auto_709785 ) ) ( not ( = ?auto_709778 ?auto_709786 ) ) ( not ( = ?auto_709778 ?auto_709787 ) ) ( not ( = ?auto_709778 ?auto_709788 ) ) ( not ( = ?auto_709779 ?auto_709780 ) ) ( not ( = ?auto_709779 ?auto_709781 ) ) ( not ( = ?auto_709779 ?auto_709782 ) ) ( not ( = ?auto_709779 ?auto_709783 ) ) ( not ( = ?auto_709779 ?auto_709784 ) ) ( not ( = ?auto_709779 ?auto_709785 ) ) ( not ( = ?auto_709779 ?auto_709786 ) ) ( not ( = ?auto_709779 ?auto_709787 ) ) ( not ( = ?auto_709779 ?auto_709788 ) ) ( not ( = ?auto_709780 ?auto_709781 ) ) ( not ( = ?auto_709780 ?auto_709782 ) ) ( not ( = ?auto_709780 ?auto_709783 ) ) ( not ( = ?auto_709780 ?auto_709784 ) ) ( not ( = ?auto_709780 ?auto_709785 ) ) ( not ( = ?auto_709780 ?auto_709786 ) ) ( not ( = ?auto_709780 ?auto_709787 ) ) ( not ( = ?auto_709780 ?auto_709788 ) ) ( not ( = ?auto_709781 ?auto_709782 ) ) ( not ( = ?auto_709781 ?auto_709783 ) ) ( not ( = ?auto_709781 ?auto_709784 ) ) ( not ( = ?auto_709781 ?auto_709785 ) ) ( not ( = ?auto_709781 ?auto_709786 ) ) ( not ( = ?auto_709781 ?auto_709787 ) ) ( not ( = ?auto_709781 ?auto_709788 ) ) ( not ( = ?auto_709782 ?auto_709783 ) ) ( not ( = ?auto_709782 ?auto_709784 ) ) ( not ( = ?auto_709782 ?auto_709785 ) ) ( not ( = ?auto_709782 ?auto_709786 ) ) ( not ( = ?auto_709782 ?auto_709787 ) ) ( not ( = ?auto_709782 ?auto_709788 ) ) ( not ( = ?auto_709783 ?auto_709784 ) ) ( not ( = ?auto_709783 ?auto_709785 ) ) ( not ( = ?auto_709783 ?auto_709786 ) ) ( not ( = ?auto_709783 ?auto_709787 ) ) ( not ( = ?auto_709783 ?auto_709788 ) ) ( not ( = ?auto_709784 ?auto_709785 ) ) ( not ( = ?auto_709784 ?auto_709786 ) ) ( not ( = ?auto_709784 ?auto_709787 ) ) ( not ( = ?auto_709784 ?auto_709788 ) ) ( not ( = ?auto_709785 ?auto_709786 ) ) ( not ( = ?auto_709785 ?auto_709787 ) ) ( not ( = ?auto_709785 ?auto_709788 ) ) ( not ( = ?auto_709786 ?auto_709787 ) ) ( not ( = ?auto_709786 ?auto_709788 ) ) ( not ( = ?auto_709787 ?auto_709788 ) ) ( ON ?auto_709787 ?auto_709788 ) ( ON ?auto_709786 ?auto_709787 ) ( ON ?auto_709785 ?auto_709786 ) ( ON ?auto_709784 ?auto_709785 ) ( ON ?auto_709783 ?auto_709784 ) ( ON ?auto_709782 ?auto_709783 ) ( ON ?auto_709781 ?auto_709782 ) ( ON ?auto_709780 ?auto_709781 ) ( ON ?auto_709779 ?auto_709780 ) ( ON ?auto_709778 ?auto_709779 ) ( ON ?auto_709777 ?auto_709778 ) ( ON ?auto_709776 ?auto_709777 ) ( ON ?auto_709775 ?auto_709776 ) ( ON ?auto_709774 ?auto_709775 ) ( ON ?auto_709773 ?auto_709774 ) ( ON ?auto_709772 ?auto_709773 ) ( CLEAR ?auto_709772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_709772 )
      ( MAKE-17PILE ?auto_709772 ?auto_709773 ?auto_709774 ?auto_709775 ?auto_709776 ?auto_709777 ?auto_709778 ?auto_709779 ?auto_709780 ?auto_709781 ?auto_709782 ?auto_709783 ?auto_709784 ?auto_709785 ?auto_709786 ?auto_709787 ?auto_709788 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_709806 - BLOCK
      ?auto_709807 - BLOCK
      ?auto_709808 - BLOCK
      ?auto_709809 - BLOCK
      ?auto_709810 - BLOCK
      ?auto_709811 - BLOCK
      ?auto_709812 - BLOCK
      ?auto_709813 - BLOCK
      ?auto_709814 - BLOCK
      ?auto_709815 - BLOCK
      ?auto_709816 - BLOCK
      ?auto_709817 - BLOCK
      ?auto_709818 - BLOCK
      ?auto_709819 - BLOCK
      ?auto_709820 - BLOCK
      ?auto_709821 - BLOCK
      ?auto_709822 - BLOCK
    )
    :vars
    (
      ?auto_709823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_709806 ?auto_709807 ) ) ( not ( = ?auto_709806 ?auto_709808 ) ) ( not ( = ?auto_709806 ?auto_709809 ) ) ( not ( = ?auto_709806 ?auto_709810 ) ) ( not ( = ?auto_709806 ?auto_709811 ) ) ( not ( = ?auto_709806 ?auto_709812 ) ) ( not ( = ?auto_709806 ?auto_709813 ) ) ( not ( = ?auto_709806 ?auto_709814 ) ) ( not ( = ?auto_709806 ?auto_709815 ) ) ( not ( = ?auto_709806 ?auto_709816 ) ) ( not ( = ?auto_709806 ?auto_709817 ) ) ( not ( = ?auto_709806 ?auto_709818 ) ) ( not ( = ?auto_709806 ?auto_709819 ) ) ( not ( = ?auto_709806 ?auto_709820 ) ) ( not ( = ?auto_709806 ?auto_709821 ) ) ( not ( = ?auto_709806 ?auto_709822 ) ) ( not ( = ?auto_709807 ?auto_709808 ) ) ( not ( = ?auto_709807 ?auto_709809 ) ) ( not ( = ?auto_709807 ?auto_709810 ) ) ( not ( = ?auto_709807 ?auto_709811 ) ) ( not ( = ?auto_709807 ?auto_709812 ) ) ( not ( = ?auto_709807 ?auto_709813 ) ) ( not ( = ?auto_709807 ?auto_709814 ) ) ( not ( = ?auto_709807 ?auto_709815 ) ) ( not ( = ?auto_709807 ?auto_709816 ) ) ( not ( = ?auto_709807 ?auto_709817 ) ) ( not ( = ?auto_709807 ?auto_709818 ) ) ( not ( = ?auto_709807 ?auto_709819 ) ) ( not ( = ?auto_709807 ?auto_709820 ) ) ( not ( = ?auto_709807 ?auto_709821 ) ) ( not ( = ?auto_709807 ?auto_709822 ) ) ( not ( = ?auto_709808 ?auto_709809 ) ) ( not ( = ?auto_709808 ?auto_709810 ) ) ( not ( = ?auto_709808 ?auto_709811 ) ) ( not ( = ?auto_709808 ?auto_709812 ) ) ( not ( = ?auto_709808 ?auto_709813 ) ) ( not ( = ?auto_709808 ?auto_709814 ) ) ( not ( = ?auto_709808 ?auto_709815 ) ) ( not ( = ?auto_709808 ?auto_709816 ) ) ( not ( = ?auto_709808 ?auto_709817 ) ) ( not ( = ?auto_709808 ?auto_709818 ) ) ( not ( = ?auto_709808 ?auto_709819 ) ) ( not ( = ?auto_709808 ?auto_709820 ) ) ( not ( = ?auto_709808 ?auto_709821 ) ) ( not ( = ?auto_709808 ?auto_709822 ) ) ( not ( = ?auto_709809 ?auto_709810 ) ) ( not ( = ?auto_709809 ?auto_709811 ) ) ( not ( = ?auto_709809 ?auto_709812 ) ) ( not ( = ?auto_709809 ?auto_709813 ) ) ( not ( = ?auto_709809 ?auto_709814 ) ) ( not ( = ?auto_709809 ?auto_709815 ) ) ( not ( = ?auto_709809 ?auto_709816 ) ) ( not ( = ?auto_709809 ?auto_709817 ) ) ( not ( = ?auto_709809 ?auto_709818 ) ) ( not ( = ?auto_709809 ?auto_709819 ) ) ( not ( = ?auto_709809 ?auto_709820 ) ) ( not ( = ?auto_709809 ?auto_709821 ) ) ( not ( = ?auto_709809 ?auto_709822 ) ) ( not ( = ?auto_709810 ?auto_709811 ) ) ( not ( = ?auto_709810 ?auto_709812 ) ) ( not ( = ?auto_709810 ?auto_709813 ) ) ( not ( = ?auto_709810 ?auto_709814 ) ) ( not ( = ?auto_709810 ?auto_709815 ) ) ( not ( = ?auto_709810 ?auto_709816 ) ) ( not ( = ?auto_709810 ?auto_709817 ) ) ( not ( = ?auto_709810 ?auto_709818 ) ) ( not ( = ?auto_709810 ?auto_709819 ) ) ( not ( = ?auto_709810 ?auto_709820 ) ) ( not ( = ?auto_709810 ?auto_709821 ) ) ( not ( = ?auto_709810 ?auto_709822 ) ) ( not ( = ?auto_709811 ?auto_709812 ) ) ( not ( = ?auto_709811 ?auto_709813 ) ) ( not ( = ?auto_709811 ?auto_709814 ) ) ( not ( = ?auto_709811 ?auto_709815 ) ) ( not ( = ?auto_709811 ?auto_709816 ) ) ( not ( = ?auto_709811 ?auto_709817 ) ) ( not ( = ?auto_709811 ?auto_709818 ) ) ( not ( = ?auto_709811 ?auto_709819 ) ) ( not ( = ?auto_709811 ?auto_709820 ) ) ( not ( = ?auto_709811 ?auto_709821 ) ) ( not ( = ?auto_709811 ?auto_709822 ) ) ( not ( = ?auto_709812 ?auto_709813 ) ) ( not ( = ?auto_709812 ?auto_709814 ) ) ( not ( = ?auto_709812 ?auto_709815 ) ) ( not ( = ?auto_709812 ?auto_709816 ) ) ( not ( = ?auto_709812 ?auto_709817 ) ) ( not ( = ?auto_709812 ?auto_709818 ) ) ( not ( = ?auto_709812 ?auto_709819 ) ) ( not ( = ?auto_709812 ?auto_709820 ) ) ( not ( = ?auto_709812 ?auto_709821 ) ) ( not ( = ?auto_709812 ?auto_709822 ) ) ( not ( = ?auto_709813 ?auto_709814 ) ) ( not ( = ?auto_709813 ?auto_709815 ) ) ( not ( = ?auto_709813 ?auto_709816 ) ) ( not ( = ?auto_709813 ?auto_709817 ) ) ( not ( = ?auto_709813 ?auto_709818 ) ) ( not ( = ?auto_709813 ?auto_709819 ) ) ( not ( = ?auto_709813 ?auto_709820 ) ) ( not ( = ?auto_709813 ?auto_709821 ) ) ( not ( = ?auto_709813 ?auto_709822 ) ) ( not ( = ?auto_709814 ?auto_709815 ) ) ( not ( = ?auto_709814 ?auto_709816 ) ) ( not ( = ?auto_709814 ?auto_709817 ) ) ( not ( = ?auto_709814 ?auto_709818 ) ) ( not ( = ?auto_709814 ?auto_709819 ) ) ( not ( = ?auto_709814 ?auto_709820 ) ) ( not ( = ?auto_709814 ?auto_709821 ) ) ( not ( = ?auto_709814 ?auto_709822 ) ) ( not ( = ?auto_709815 ?auto_709816 ) ) ( not ( = ?auto_709815 ?auto_709817 ) ) ( not ( = ?auto_709815 ?auto_709818 ) ) ( not ( = ?auto_709815 ?auto_709819 ) ) ( not ( = ?auto_709815 ?auto_709820 ) ) ( not ( = ?auto_709815 ?auto_709821 ) ) ( not ( = ?auto_709815 ?auto_709822 ) ) ( not ( = ?auto_709816 ?auto_709817 ) ) ( not ( = ?auto_709816 ?auto_709818 ) ) ( not ( = ?auto_709816 ?auto_709819 ) ) ( not ( = ?auto_709816 ?auto_709820 ) ) ( not ( = ?auto_709816 ?auto_709821 ) ) ( not ( = ?auto_709816 ?auto_709822 ) ) ( not ( = ?auto_709817 ?auto_709818 ) ) ( not ( = ?auto_709817 ?auto_709819 ) ) ( not ( = ?auto_709817 ?auto_709820 ) ) ( not ( = ?auto_709817 ?auto_709821 ) ) ( not ( = ?auto_709817 ?auto_709822 ) ) ( not ( = ?auto_709818 ?auto_709819 ) ) ( not ( = ?auto_709818 ?auto_709820 ) ) ( not ( = ?auto_709818 ?auto_709821 ) ) ( not ( = ?auto_709818 ?auto_709822 ) ) ( not ( = ?auto_709819 ?auto_709820 ) ) ( not ( = ?auto_709819 ?auto_709821 ) ) ( not ( = ?auto_709819 ?auto_709822 ) ) ( not ( = ?auto_709820 ?auto_709821 ) ) ( not ( = ?auto_709820 ?auto_709822 ) ) ( not ( = ?auto_709821 ?auto_709822 ) ) ( ON ?auto_709806 ?auto_709823 ) ( not ( = ?auto_709822 ?auto_709823 ) ) ( not ( = ?auto_709821 ?auto_709823 ) ) ( not ( = ?auto_709820 ?auto_709823 ) ) ( not ( = ?auto_709819 ?auto_709823 ) ) ( not ( = ?auto_709818 ?auto_709823 ) ) ( not ( = ?auto_709817 ?auto_709823 ) ) ( not ( = ?auto_709816 ?auto_709823 ) ) ( not ( = ?auto_709815 ?auto_709823 ) ) ( not ( = ?auto_709814 ?auto_709823 ) ) ( not ( = ?auto_709813 ?auto_709823 ) ) ( not ( = ?auto_709812 ?auto_709823 ) ) ( not ( = ?auto_709811 ?auto_709823 ) ) ( not ( = ?auto_709810 ?auto_709823 ) ) ( not ( = ?auto_709809 ?auto_709823 ) ) ( not ( = ?auto_709808 ?auto_709823 ) ) ( not ( = ?auto_709807 ?auto_709823 ) ) ( not ( = ?auto_709806 ?auto_709823 ) ) ( ON ?auto_709807 ?auto_709806 ) ( ON ?auto_709808 ?auto_709807 ) ( ON ?auto_709809 ?auto_709808 ) ( ON ?auto_709810 ?auto_709809 ) ( ON ?auto_709811 ?auto_709810 ) ( ON ?auto_709812 ?auto_709811 ) ( ON ?auto_709813 ?auto_709812 ) ( ON ?auto_709814 ?auto_709813 ) ( ON ?auto_709815 ?auto_709814 ) ( ON ?auto_709816 ?auto_709815 ) ( ON ?auto_709817 ?auto_709816 ) ( ON ?auto_709818 ?auto_709817 ) ( ON ?auto_709819 ?auto_709818 ) ( ON ?auto_709820 ?auto_709819 ) ( ON ?auto_709821 ?auto_709820 ) ( ON ?auto_709822 ?auto_709821 ) ( CLEAR ?auto_709822 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_709822 ?auto_709821 ?auto_709820 ?auto_709819 ?auto_709818 ?auto_709817 ?auto_709816 ?auto_709815 ?auto_709814 ?auto_709813 ?auto_709812 ?auto_709811 ?auto_709810 ?auto_709809 ?auto_709808 ?auto_709807 ?auto_709806 )
      ( MAKE-17PILE ?auto_709806 ?auto_709807 ?auto_709808 ?auto_709809 ?auto_709810 ?auto_709811 ?auto_709812 ?auto_709813 ?auto_709814 ?auto_709815 ?auto_709816 ?auto_709817 ?auto_709818 ?auto_709819 ?auto_709820 ?auto_709821 ?auto_709822 ) )
  )

)

