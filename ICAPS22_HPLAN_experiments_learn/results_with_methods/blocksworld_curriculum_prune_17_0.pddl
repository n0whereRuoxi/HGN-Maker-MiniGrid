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
      ?auto_590401 - BLOCK
    )
    :vars
    (
      ?auto_590402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590401 ?auto_590402 ) ( CLEAR ?auto_590401 ) ( HAND-EMPTY ) ( not ( = ?auto_590401 ?auto_590402 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590401 ?auto_590402 )
      ( !PUTDOWN ?auto_590401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_590408 - BLOCK
      ?auto_590409 - BLOCK
    )
    :vars
    (
      ?auto_590410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590408 ) ( ON ?auto_590409 ?auto_590410 ) ( CLEAR ?auto_590409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590408 ) ( not ( = ?auto_590408 ?auto_590409 ) ) ( not ( = ?auto_590408 ?auto_590410 ) ) ( not ( = ?auto_590409 ?auto_590410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590409 ?auto_590410 )
      ( !STACK ?auto_590409 ?auto_590408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_590418 - BLOCK
      ?auto_590419 - BLOCK
    )
    :vars
    (
      ?auto_590420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590419 ?auto_590420 ) ( not ( = ?auto_590418 ?auto_590419 ) ) ( not ( = ?auto_590418 ?auto_590420 ) ) ( not ( = ?auto_590419 ?auto_590420 ) ) ( ON ?auto_590418 ?auto_590419 ) ( CLEAR ?auto_590418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590418 )
      ( MAKE-2PILE ?auto_590418 ?auto_590419 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_590429 - BLOCK
      ?auto_590430 - BLOCK
      ?auto_590431 - BLOCK
    )
    :vars
    (
      ?auto_590432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590430 ) ( ON ?auto_590431 ?auto_590432 ) ( CLEAR ?auto_590431 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590429 ) ( ON ?auto_590430 ?auto_590429 ) ( not ( = ?auto_590429 ?auto_590430 ) ) ( not ( = ?auto_590429 ?auto_590431 ) ) ( not ( = ?auto_590429 ?auto_590432 ) ) ( not ( = ?auto_590430 ?auto_590431 ) ) ( not ( = ?auto_590430 ?auto_590432 ) ) ( not ( = ?auto_590431 ?auto_590432 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590431 ?auto_590432 )
      ( !STACK ?auto_590431 ?auto_590430 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_590443 - BLOCK
      ?auto_590444 - BLOCK
      ?auto_590445 - BLOCK
    )
    :vars
    (
      ?auto_590446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590445 ?auto_590446 ) ( ON-TABLE ?auto_590443 ) ( not ( = ?auto_590443 ?auto_590444 ) ) ( not ( = ?auto_590443 ?auto_590445 ) ) ( not ( = ?auto_590443 ?auto_590446 ) ) ( not ( = ?auto_590444 ?auto_590445 ) ) ( not ( = ?auto_590444 ?auto_590446 ) ) ( not ( = ?auto_590445 ?auto_590446 ) ) ( CLEAR ?auto_590443 ) ( ON ?auto_590444 ?auto_590445 ) ( CLEAR ?auto_590444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590443 ?auto_590444 )
      ( MAKE-3PILE ?auto_590443 ?auto_590444 ?auto_590445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_590457 - BLOCK
      ?auto_590458 - BLOCK
      ?auto_590459 - BLOCK
    )
    :vars
    (
      ?auto_590460 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590459 ?auto_590460 ) ( not ( = ?auto_590457 ?auto_590458 ) ) ( not ( = ?auto_590457 ?auto_590459 ) ) ( not ( = ?auto_590457 ?auto_590460 ) ) ( not ( = ?auto_590458 ?auto_590459 ) ) ( not ( = ?auto_590458 ?auto_590460 ) ) ( not ( = ?auto_590459 ?auto_590460 ) ) ( ON ?auto_590458 ?auto_590459 ) ( ON ?auto_590457 ?auto_590458 ) ( CLEAR ?auto_590457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590457 )
      ( MAKE-3PILE ?auto_590457 ?auto_590458 ?auto_590459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_590472 - BLOCK
      ?auto_590473 - BLOCK
      ?auto_590474 - BLOCK
      ?auto_590475 - BLOCK
    )
    :vars
    (
      ?auto_590476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590474 ) ( ON ?auto_590475 ?auto_590476 ) ( CLEAR ?auto_590475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590472 ) ( ON ?auto_590473 ?auto_590472 ) ( ON ?auto_590474 ?auto_590473 ) ( not ( = ?auto_590472 ?auto_590473 ) ) ( not ( = ?auto_590472 ?auto_590474 ) ) ( not ( = ?auto_590472 ?auto_590475 ) ) ( not ( = ?auto_590472 ?auto_590476 ) ) ( not ( = ?auto_590473 ?auto_590474 ) ) ( not ( = ?auto_590473 ?auto_590475 ) ) ( not ( = ?auto_590473 ?auto_590476 ) ) ( not ( = ?auto_590474 ?auto_590475 ) ) ( not ( = ?auto_590474 ?auto_590476 ) ) ( not ( = ?auto_590475 ?auto_590476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590475 ?auto_590476 )
      ( !STACK ?auto_590475 ?auto_590474 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_590490 - BLOCK
      ?auto_590491 - BLOCK
      ?auto_590492 - BLOCK
      ?auto_590493 - BLOCK
    )
    :vars
    (
      ?auto_590494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590493 ?auto_590494 ) ( ON-TABLE ?auto_590490 ) ( ON ?auto_590491 ?auto_590490 ) ( not ( = ?auto_590490 ?auto_590491 ) ) ( not ( = ?auto_590490 ?auto_590492 ) ) ( not ( = ?auto_590490 ?auto_590493 ) ) ( not ( = ?auto_590490 ?auto_590494 ) ) ( not ( = ?auto_590491 ?auto_590492 ) ) ( not ( = ?auto_590491 ?auto_590493 ) ) ( not ( = ?auto_590491 ?auto_590494 ) ) ( not ( = ?auto_590492 ?auto_590493 ) ) ( not ( = ?auto_590492 ?auto_590494 ) ) ( not ( = ?auto_590493 ?auto_590494 ) ) ( CLEAR ?auto_590491 ) ( ON ?auto_590492 ?auto_590493 ) ( CLEAR ?auto_590492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590490 ?auto_590491 ?auto_590492 )
      ( MAKE-4PILE ?auto_590490 ?auto_590491 ?auto_590492 ?auto_590493 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_590508 - BLOCK
      ?auto_590509 - BLOCK
      ?auto_590510 - BLOCK
      ?auto_590511 - BLOCK
    )
    :vars
    (
      ?auto_590512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590511 ?auto_590512 ) ( ON-TABLE ?auto_590508 ) ( not ( = ?auto_590508 ?auto_590509 ) ) ( not ( = ?auto_590508 ?auto_590510 ) ) ( not ( = ?auto_590508 ?auto_590511 ) ) ( not ( = ?auto_590508 ?auto_590512 ) ) ( not ( = ?auto_590509 ?auto_590510 ) ) ( not ( = ?auto_590509 ?auto_590511 ) ) ( not ( = ?auto_590509 ?auto_590512 ) ) ( not ( = ?auto_590510 ?auto_590511 ) ) ( not ( = ?auto_590510 ?auto_590512 ) ) ( not ( = ?auto_590511 ?auto_590512 ) ) ( ON ?auto_590510 ?auto_590511 ) ( CLEAR ?auto_590508 ) ( ON ?auto_590509 ?auto_590510 ) ( CLEAR ?auto_590509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590508 ?auto_590509 )
      ( MAKE-4PILE ?auto_590508 ?auto_590509 ?auto_590510 ?auto_590511 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_590526 - BLOCK
      ?auto_590527 - BLOCK
      ?auto_590528 - BLOCK
      ?auto_590529 - BLOCK
    )
    :vars
    (
      ?auto_590530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590529 ?auto_590530 ) ( not ( = ?auto_590526 ?auto_590527 ) ) ( not ( = ?auto_590526 ?auto_590528 ) ) ( not ( = ?auto_590526 ?auto_590529 ) ) ( not ( = ?auto_590526 ?auto_590530 ) ) ( not ( = ?auto_590527 ?auto_590528 ) ) ( not ( = ?auto_590527 ?auto_590529 ) ) ( not ( = ?auto_590527 ?auto_590530 ) ) ( not ( = ?auto_590528 ?auto_590529 ) ) ( not ( = ?auto_590528 ?auto_590530 ) ) ( not ( = ?auto_590529 ?auto_590530 ) ) ( ON ?auto_590528 ?auto_590529 ) ( ON ?auto_590527 ?auto_590528 ) ( ON ?auto_590526 ?auto_590527 ) ( CLEAR ?auto_590526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590526 )
      ( MAKE-4PILE ?auto_590526 ?auto_590527 ?auto_590528 ?auto_590529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_590545 - BLOCK
      ?auto_590546 - BLOCK
      ?auto_590547 - BLOCK
      ?auto_590548 - BLOCK
      ?auto_590549 - BLOCK
    )
    :vars
    (
      ?auto_590550 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590548 ) ( ON ?auto_590549 ?auto_590550 ) ( CLEAR ?auto_590549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590545 ) ( ON ?auto_590546 ?auto_590545 ) ( ON ?auto_590547 ?auto_590546 ) ( ON ?auto_590548 ?auto_590547 ) ( not ( = ?auto_590545 ?auto_590546 ) ) ( not ( = ?auto_590545 ?auto_590547 ) ) ( not ( = ?auto_590545 ?auto_590548 ) ) ( not ( = ?auto_590545 ?auto_590549 ) ) ( not ( = ?auto_590545 ?auto_590550 ) ) ( not ( = ?auto_590546 ?auto_590547 ) ) ( not ( = ?auto_590546 ?auto_590548 ) ) ( not ( = ?auto_590546 ?auto_590549 ) ) ( not ( = ?auto_590546 ?auto_590550 ) ) ( not ( = ?auto_590547 ?auto_590548 ) ) ( not ( = ?auto_590547 ?auto_590549 ) ) ( not ( = ?auto_590547 ?auto_590550 ) ) ( not ( = ?auto_590548 ?auto_590549 ) ) ( not ( = ?auto_590548 ?auto_590550 ) ) ( not ( = ?auto_590549 ?auto_590550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590549 ?auto_590550 )
      ( !STACK ?auto_590549 ?auto_590548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_590567 - BLOCK
      ?auto_590568 - BLOCK
      ?auto_590569 - BLOCK
      ?auto_590570 - BLOCK
      ?auto_590571 - BLOCK
    )
    :vars
    (
      ?auto_590572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590571 ?auto_590572 ) ( ON-TABLE ?auto_590567 ) ( ON ?auto_590568 ?auto_590567 ) ( ON ?auto_590569 ?auto_590568 ) ( not ( = ?auto_590567 ?auto_590568 ) ) ( not ( = ?auto_590567 ?auto_590569 ) ) ( not ( = ?auto_590567 ?auto_590570 ) ) ( not ( = ?auto_590567 ?auto_590571 ) ) ( not ( = ?auto_590567 ?auto_590572 ) ) ( not ( = ?auto_590568 ?auto_590569 ) ) ( not ( = ?auto_590568 ?auto_590570 ) ) ( not ( = ?auto_590568 ?auto_590571 ) ) ( not ( = ?auto_590568 ?auto_590572 ) ) ( not ( = ?auto_590569 ?auto_590570 ) ) ( not ( = ?auto_590569 ?auto_590571 ) ) ( not ( = ?auto_590569 ?auto_590572 ) ) ( not ( = ?auto_590570 ?auto_590571 ) ) ( not ( = ?auto_590570 ?auto_590572 ) ) ( not ( = ?auto_590571 ?auto_590572 ) ) ( CLEAR ?auto_590569 ) ( ON ?auto_590570 ?auto_590571 ) ( CLEAR ?auto_590570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_590567 ?auto_590568 ?auto_590569 ?auto_590570 )
      ( MAKE-5PILE ?auto_590567 ?auto_590568 ?auto_590569 ?auto_590570 ?auto_590571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_590589 - BLOCK
      ?auto_590590 - BLOCK
      ?auto_590591 - BLOCK
      ?auto_590592 - BLOCK
      ?auto_590593 - BLOCK
    )
    :vars
    (
      ?auto_590594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590593 ?auto_590594 ) ( ON-TABLE ?auto_590589 ) ( ON ?auto_590590 ?auto_590589 ) ( not ( = ?auto_590589 ?auto_590590 ) ) ( not ( = ?auto_590589 ?auto_590591 ) ) ( not ( = ?auto_590589 ?auto_590592 ) ) ( not ( = ?auto_590589 ?auto_590593 ) ) ( not ( = ?auto_590589 ?auto_590594 ) ) ( not ( = ?auto_590590 ?auto_590591 ) ) ( not ( = ?auto_590590 ?auto_590592 ) ) ( not ( = ?auto_590590 ?auto_590593 ) ) ( not ( = ?auto_590590 ?auto_590594 ) ) ( not ( = ?auto_590591 ?auto_590592 ) ) ( not ( = ?auto_590591 ?auto_590593 ) ) ( not ( = ?auto_590591 ?auto_590594 ) ) ( not ( = ?auto_590592 ?auto_590593 ) ) ( not ( = ?auto_590592 ?auto_590594 ) ) ( not ( = ?auto_590593 ?auto_590594 ) ) ( ON ?auto_590592 ?auto_590593 ) ( CLEAR ?auto_590590 ) ( ON ?auto_590591 ?auto_590592 ) ( CLEAR ?auto_590591 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590589 ?auto_590590 ?auto_590591 )
      ( MAKE-5PILE ?auto_590589 ?auto_590590 ?auto_590591 ?auto_590592 ?auto_590593 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_590611 - BLOCK
      ?auto_590612 - BLOCK
      ?auto_590613 - BLOCK
      ?auto_590614 - BLOCK
      ?auto_590615 - BLOCK
    )
    :vars
    (
      ?auto_590616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590615 ?auto_590616 ) ( ON-TABLE ?auto_590611 ) ( not ( = ?auto_590611 ?auto_590612 ) ) ( not ( = ?auto_590611 ?auto_590613 ) ) ( not ( = ?auto_590611 ?auto_590614 ) ) ( not ( = ?auto_590611 ?auto_590615 ) ) ( not ( = ?auto_590611 ?auto_590616 ) ) ( not ( = ?auto_590612 ?auto_590613 ) ) ( not ( = ?auto_590612 ?auto_590614 ) ) ( not ( = ?auto_590612 ?auto_590615 ) ) ( not ( = ?auto_590612 ?auto_590616 ) ) ( not ( = ?auto_590613 ?auto_590614 ) ) ( not ( = ?auto_590613 ?auto_590615 ) ) ( not ( = ?auto_590613 ?auto_590616 ) ) ( not ( = ?auto_590614 ?auto_590615 ) ) ( not ( = ?auto_590614 ?auto_590616 ) ) ( not ( = ?auto_590615 ?auto_590616 ) ) ( ON ?auto_590614 ?auto_590615 ) ( ON ?auto_590613 ?auto_590614 ) ( CLEAR ?auto_590611 ) ( ON ?auto_590612 ?auto_590613 ) ( CLEAR ?auto_590612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590611 ?auto_590612 )
      ( MAKE-5PILE ?auto_590611 ?auto_590612 ?auto_590613 ?auto_590614 ?auto_590615 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_590633 - BLOCK
      ?auto_590634 - BLOCK
      ?auto_590635 - BLOCK
      ?auto_590636 - BLOCK
      ?auto_590637 - BLOCK
    )
    :vars
    (
      ?auto_590638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590637 ?auto_590638 ) ( not ( = ?auto_590633 ?auto_590634 ) ) ( not ( = ?auto_590633 ?auto_590635 ) ) ( not ( = ?auto_590633 ?auto_590636 ) ) ( not ( = ?auto_590633 ?auto_590637 ) ) ( not ( = ?auto_590633 ?auto_590638 ) ) ( not ( = ?auto_590634 ?auto_590635 ) ) ( not ( = ?auto_590634 ?auto_590636 ) ) ( not ( = ?auto_590634 ?auto_590637 ) ) ( not ( = ?auto_590634 ?auto_590638 ) ) ( not ( = ?auto_590635 ?auto_590636 ) ) ( not ( = ?auto_590635 ?auto_590637 ) ) ( not ( = ?auto_590635 ?auto_590638 ) ) ( not ( = ?auto_590636 ?auto_590637 ) ) ( not ( = ?auto_590636 ?auto_590638 ) ) ( not ( = ?auto_590637 ?auto_590638 ) ) ( ON ?auto_590636 ?auto_590637 ) ( ON ?auto_590635 ?auto_590636 ) ( ON ?auto_590634 ?auto_590635 ) ( ON ?auto_590633 ?auto_590634 ) ( CLEAR ?auto_590633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590633 )
      ( MAKE-5PILE ?auto_590633 ?auto_590634 ?auto_590635 ?auto_590636 ?auto_590637 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590656 - BLOCK
      ?auto_590657 - BLOCK
      ?auto_590658 - BLOCK
      ?auto_590659 - BLOCK
      ?auto_590660 - BLOCK
      ?auto_590661 - BLOCK
    )
    :vars
    (
      ?auto_590662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590660 ) ( ON ?auto_590661 ?auto_590662 ) ( CLEAR ?auto_590661 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590656 ) ( ON ?auto_590657 ?auto_590656 ) ( ON ?auto_590658 ?auto_590657 ) ( ON ?auto_590659 ?auto_590658 ) ( ON ?auto_590660 ?auto_590659 ) ( not ( = ?auto_590656 ?auto_590657 ) ) ( not ( = ?auto_590656 ?auto_590658 ) ) ( not ( = ?auto_590656 ?auto_590659 ) ) ( not ( = ?auto_590656 ?auto_590660 ) ) ( not ( = ?auto_590656 ?auto_590661 ) ) ( not ( = ?auto_590656 ?auto_590662 ) ) ( not ( = ?auto_590657 ?auto_590658 ) ) ( not ( = ?auto_590657 ?auto_590659 ) ) ( not ( = ?auto_590657 ?auto_590660 ) ) ( not ( = ?auto_590657 ?auto_590661 ) ) ( not ( = ?auto_590657 ?auto_590662 ) ) ( not ( = ?auto_590658 ?auto_590659 ) ) ( not ( = ?auto_590658 ?auto_590660 ) ) ( not ( = ?auto_590658 ?auto_590661 ) ) ( not ( = ?auto_590658 ?auto_590662 ) ) ( not ( = ?auto_590659 ?auto_590660 ) ) ( not ( = ?auto_590659 ?auto_590661 ) ) ( not ( = ?auto_590659 ?auto_590662 ) ) ( not ( = ?auto_590660 ?auto_590661 ) ) ( not ( = ?auto_590660 ?auto_590662 ) ) ( not ( = ?auto_590661 ?auto_590662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590661 ?auto_590662 )
      ( !STACK ?auto_590661 ?auto_590660 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590682 - BLOCK
      ?auto_590683 - BLOCK
      ?auto_590684 - BLOCK
      ?auto_590685 - BLOCK
      ?auto_590686 - BLOCK
      ?auto_590687 - BLOCK
    )
    :vars
    (
      ?auto_590688 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590687 ?auto_590688 ) ( ON-TABLE ?auto_590682 ) ( ON ?auto_590683 ?auto_590682 ) ( ON ?auto_590684 ?auto_590683 ) ( ON ?auto_590685 ?auto_590684 ) ( not ( = ?auto_590682 ?auto_590683 ) ) ( not ( = ?auto_590682 ?auto_590684 ) ) ( not ( = ?auto_590682 ?auto_590685 ) ) ( not ( = ?auto_590682 ?auto_590686 ) ) ( not ( = ?auto_590682 ?auto_590687 ) ) ( not ( = ?auto_590682 ?auto_590688 ) ) ( not ( = ?auto_590683 ?auto_590684 ) ) ( not ( = ?auto_590683 ?auto_590685 ) ) ( not ( = ?auto_590683 ?auto_590686 ) ) ( not ( = ?auto_590683 ?auto_590687 ) ) ( not ( = ?auto_590683 ?auto_590688 ) ) ( not ( = ?auto_590684 ?auto_590685 ) ) ( not ( = ?auto_590684 ?auto_590686 ) ) ( not ( = ?auto_590684 ?auto_590687 ) ) ( not ( = ?auto_590684 ?auto_590688 ) ) ( not ( = ?auto_590685 ?auto_590686 ) ) ( not ( = ?auto_590685 ?auto_590687 ) ) ( not ( = ?auto_590685 ?auto_590688 ) ) ( not ( = ?auto_590686 ?auto_590687 ) ) ( not ( = ?auto_590686 ?auto_590688 ) ) ( not ( = ?auto_590687 ?auto_590688 ) ) ( CLEAR ?auto_590685 ) ( ON ?auto_590686 ?auto_590687 ) ( CLEAR ?auto_590686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_590682 ?auto_590683 ?auto_590684 ?auto_590685 ?auto_590686 )
      ( MAKE-6PILE ?auto_590682 ?auto_590683 ?auto_590684 ?auto_590685 ?auto_590686 ?auto_590687 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590708 - BLOCK
      ?auto_590709 - BLOCK
      ?auto_590710 - BLOCK
      ?auto_590711 - BLOCK
      ?auto_590712 - BLOCK
      ?auto_590713 - BLOCK
    )
    :vars
    (
      ?auto_590714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590713 ?auto_590714 ) ( ON-TABLE ?auto_590708 ) ( ON ?auto_590709 ?auto_590708 ) ( ON ?auto_590710 ?auto_590709 ) ( not ( = ?auto_590708 ?auto_590709 ) ) ( not ( = ?auto_590708 ?auto_590710 ) ) ( not ( = ?auto_590708 ?auto_590711 ) ) ( not ( = ?auto_590708 ?auto_590712 ) ) ( not ( = ?auto_590708 ?auto_590713 ) ) ( not ( = ?auto_590708 ?auto_590714 ) ) ( not ( = ?auto_590709 ?auto_590710 ) ) ( not ( = ?auto_590709 ?auto_590711 ) ) ( not ( = ?auto_590709 ?auto_590712 ) ) ( not ( = ?auto_590709 ?auto_590713 ) ) ( not ( = ?auto_590709 ?auto_590714 ) ) ( not ( = ?auto_590710 ?auto_590711 ) ) ( not ( = ?auto_590710 ?auto_590712 ) ) ( not ( = ?auto_590710 ?auto_590713 ) ) ( not ( = ?auto_590710 ?auto_590714 ) ) ( not ( = ?auto_590711 ?auto_590712 ) ) ( not ( = ?auto_590711 ?auto_590713 ) ) ( not ( = ?auto_590711 ?auto_590714 ) ) ( not ( = ?auto_590712 ?auto_590713 ) ) ( not ( = ?auto_590712 ?auto_590714 ) ) ( not ( = ?auto_590713 ?auto_590714 ) ) ( ON ?auto_590712 ?auto_590713 ) ( CLEAR ?auto_590710 ) ( ON ?auto_590711 ?auto_590712 ) ( CLEAR ?auto_590711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_590708 ?auto_590709 ?auto_590710 ?auto_590711 )
      ( MAKE-6PILE ?auto_590708 ?auto_590709 ?auto_590710 ?auto_590711 ?auto_590712 ?auto_590713 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590734 - BLOCK
      ?auto_590735 - BLOCK
      ?auto_590736 - BLOCK
      ?auto_590737 - BLOCK
      ?auto_590738 - BLOCK
      ?auto_590739 - BLOCK
    )
    :vars
    (
      ?auto_590740 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590739 ?auto_590740 ) ( ON-TABLE ?auto_590734 ) ( ON ?auto_590735 ?auto_590734 ) ( not ( = ?auto_590734 ?auto_590735 ) ) ( not ( = ?auto_590734 ?auto_590736 ) ) ( not ( = ?auto_590734 ?auto_590737 ) ) ( not ( = ?auto_590734 ?auto_590738 ) ) ( not ( = ?auto_590734 ?auto_590739 ) ) ( not ( = ?auto_590734 ?auto_590740 ) ) ( not ( = ?auto_590735 ?auto_590736 ) ) ( not ( = ?auto_590735 ?auto_590737 ) ) ( not ( = ?auto_590735 ?auto_590738 ) ) ( not ( = ?auto_590735 ?auto_590739 ) ) ( not ( = ?auto_590735 ?auto_590740 ) ) ( not ( = ?auto_590736 ?auto_590737 ) ) ( not ( = ?auto_590736 ?auto_590738 ) ) ( not ( = ?auto_590736 ?auto_590739 ) ) ( not ( = ?auto_590736 ?auto_590740 ) ) ( not ( = ?auto_590737 ?auto_590738 ) ) ( not ( = ?auto_590737 ?auto_590739 ) ) ( not ( = ?auto_590737 ?auto_590740 ) ) ( not ( = ?auto_590738 ?auto_590739 ) ) ( not ( = ?auto_590738 ?auto_590740 ) ) ( not ( = ?auto_590739 ?auto_590740 ) ) ( ON ?auto_590738 ?auto_590739 ) ( ON ?auto_590737 ?auto_590738 ) ( CLEAR ?auto_590735 ) ( ON ?auto_590736 ?auto_590737 ) ( CLEAR ?auto_590736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590734 ?auto_590735 ?auto_590736 )
      ( MAKE-6PILE ?auto_590734 ?auto_590735 ?auto_590736 ?auto_590737 ?auto_590738 ?auto_590739 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590760 - BLOCK
      ?auto_590761 - BLOCK
      ?auto_590762 - BLOCK
      ?auto_590763 - BLOCK
      ?auto_590764 - BLOCK
      ?auto_590765 - BLOCK
    )
    :vars
    (
      ?auto_590766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590765 ?auto_590766 ) ( ON-TABLE ?auto_590760 ) ( not ( = ?auto_590760 ?auto_590761 ) ) ( not ( = ?auto_590760 ?auto_590762 ) ) ( not ( = ?auto_590760 ?auto_590763 ) ) ( not ( = ?auto_590760 ?auto_590764 ) ) ( not ( = ?auto_590760 ?auto_590765 ) ) ( not ( = ?auto_590760 ?auto_590766 ) ) ( not ( = ?auto_590761 ?auto_590762 ) ) ( not ( = ?auto_590761 ?auto_590763 ) ) ( not ( = ?auto_590761 ?auto_590764 ) ) ( not ( = ?auto_590761 ?auto_590765 ) ) ( not ( = ?auto_590761 ?auto_590766 ) ) ( not ( = ?auto_590762 ?auto_590763 ) ) ( not ( = ?auto_590762 ?auto_590764 ) ) ( not ( = ?auto_590762 ?auto_590765 ) ) ( not ( = ?auto_590762 ?auto_590766 ) ) ( not ( = ?auto_590763 ?auto_590764 ) ) ( not ( = ?auto_590763 ?auto_590765 ) ) ( not ( = ?auto_590763 ?auto_590766 ) ) ( not ( = ?auto_590764 ?auto_590765 ) ) ( not ( = ?auto_590764 ?auto_590766 ) ) ( not ( = ?auto_590765 ?auto_590766 ) ) ( ON ?auto_590764 ?auto_590765 ) ( ON ?auto_590763 ?auto_590764 ) ( ON ?auto_590762 ?auto_590763 ) ( CLEAR ?auto_590760 ) ( ON ?auto_590761 ?auto_590762 ) ( CLEAR ?auto_590761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590760 ?auto_590761 )
      ( MAKE-6PILE ?auto_590760 ?auto_590761 ?auto_590762 ?auto_590763 ?auto_590764 ?auto_590765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_590786 - BLOCK
      ?auto_590787 - BLOCK
      ?auto_590788 - BLOCK
      ?auto_590789 - BLOCK
      ?auto_590790 - BLOCK
      ?auto_590791 - BLOCK
    )
    :vars
    (
      ?auto_590792 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590791 ?auto_590792 ) ( not ( = ?auto_590786 ?auto_590787 ) ) ( not ( = ?auto_590786 ?auto_590788 ) ) ( not ( = ?auto_590786 ?auto_590789 ) ) ( not ( = ?auto_590786 ?auto_590790 ) ) ( not ( = ?auto_590786 ?auto_590791 ) ) ( not ( = ?auto_590786 ?auto_590792 ) ) ( not ( = ?auto_590787 ?auto_590788 ) ) ( not ( = ?auto_590787 ?auto_590789 ) ) ( not ( = ?auto_590787 ?auto_590790 ) ) ( not ( = ?auto_590787 ?auto_590791 ) ) ( not ( = ?auto_590787 ?auto_590792 ) ) ( not ( = ?auto_590788 ?auto_590789 ) ) ( not ( = ?auto_590788 ?auto_590790 ) ) ( not ( = ?auto_590788 ?auto_590791 ) ) ( not ( = ?auto_590788 ?auto_590792 ) ) ( not ( = ?auto_590789 ?auto_590790 ) ) ( not ( = ?auto_590789 ?auto_590791 ) ) ( not ( = ?auto_590789 ?auto_590792 ) ) ( not ( = ?auto_590790 ?auto_590791 ) ) ( not ( = ?auto_590790 ?auto_590792 ) ) ( not ( = ?auto_590791 ?auto_590792 ) ) ( ON ?auto_590790 ?auto_590791 ) ( ON ?auto_590789 ?auto_590790 ) ( ON ?auto_590788 ?auto_590789 ) ( ON ?auto_590787 ?auto_590788 ) ( ON ?auto_590786 ?auto_590787 ) ( CLEAR ?auto_590786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590786 )
      ( MAKE-6PILE ?auto_590786 ?auto_590787 ?auto_590788 ?auto_590789 ?auto_590790 ?auto_590791 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590813 - BLOCK
      ?auto_590814 - BLOCK
      ?auto_590815 - BLOCK
      ?auto_590816 - BLOCK
      ?auto_590817 - BLOCK
      ?auto_590818 - BLOCK
      ?auto_590819 - BLOCK
    )
    :vars
    (
      ?auto_590820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_590818 ) ( ON ?auto_590819 ?auto_590820 ) ( CLEAR ?auto_590819 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_590813 ) ( ON ?auto_590814 ?auto_590813 ) ( ON ?auto_590815 ?auto_590814 ) ( ON ?auto_590816 ?auto_590815 ) ( ON ?auto_590817 ?auto_590816 ) ( ON ?auto_590818 ?auto_590817 ) ( not ( = ?auto_590813 ?auto_590814 ) ) ( not ( = ?auto_590813 ?auto_590815 ) ) ( not ( = ?auto_590813 ?auto_590816 ) ) ( not ( = ?auto_590813 ?auto_590817 ) ) ( not ( = ?auto_590813 ?auto_590818 ) ) ( not ( = ?auto_590813 ?auto_590819 ) ) ( not ( = ?auto_590813 ?auto_590820 ) ) ( not ( = ?auto_590814 ?auto_590815 ) ) ( not ( = ?auto_590814 ?auto_590816 ) ) ( not ( = ?auto_590814 ?auto_590817 ) ) ( not ( = ?auto_590814 ?auto_590818 ) ) ( not ( = ?auto_590814 ?auto_590819 ) ) ( not ( = ?auto_590814 ?auto_590820 ) ) ( not ( = ?auto_590815 ?auto_590816 ) ) ( not ( = ?auto_590815 ?auto_590817 ) ) ( not ( = ?auto_590815 ?auto_590818 ) ) ( not ( = ?auto_590815 ?auto_590819 ) ) ( not ( = ?auto_590815 ?auto_590820 ) ) ( not ( = ?auto_590816 ?auto_590817 ) ) ( not ( = ?auto_590816 ?auto_590818 ) ) ( not ( = ?auto_590816 ?auto_590819 ) ) ( not ( = ?auto_590816 ?auto_590820 ) ) ( not ( = ?auto_590817 ?auto_590818 ) ) ( not ( = ?auto_590817 ?auto_590819 ) ) ( not ( = ?auto_590817 ?auto_590820 ) ) ( not ( = ?auto_590818 ?auto_590819 ) ) ( not ( = ?auto_590818 ?auto_590820 ) ) ( not ( = ?auto_590819 ?auto_590820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_590819 ?auto_590820 )
      ( !STACK ?auto_590819 ?auto_590818 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590843 - BLOCK
      ?auto_590844 - BLOCK
      ?auto_590845 - BLOCK
      ?auto_590846 - BLOCK
      ?auto_590847 - BLOCK
      ?auto_590848 - BLOCK
      ?auto_590849 - BLOCK
    )
    :vars
    (
      ?auto_590850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590849 ?auto_590850 ) ( ON-TABLE ?auto_590843 ) ( ON ?auto_590844 ?auto_590843 ) ( ON ?auto_590845 ?auto_590844 ) ( ON ?auto_590846 ?auto_590845 ) ( ON ?auto_590847 ?auto_590846 ) ( not ( = ?auto_590843 ?auto_590844 ) ) ( not ( = ?auto_590843 ?auto_590845 ) ) ( not ( = ?auto_590843 ?auto_590846 ) ) ( not ( = ?auto_590843 ?auto_590847 ) ) ( not ( = ?auto_590843 ?auto_590848 ) ) ( not ( = ?auto_590843 ?auto_590849 ) ) ( not ( = ?auto_590843 ?auto_590850 ) ) ( not ( = ?auto_590844 ?auto_590845 ) ) ( not ( = ?auto_590844 ?auto_590846 ) ) ( not ( = ?auto_590844 ?auto_590847 ) ) ( not ( = ?auto_590844 ?auto_590848 ) ) ( not ( = ?auto_590844 ?auto_590849 ) ) ( not ( = ?auto_590844 ?auto_590850 ) ) ( not ( = ?auto_590845 ?auto_590846 ) ) ( not ( = ?auto_590845 ?auto_590847 ) ) ( not ( = ?auto_590845 ?auto_590848 ) ) ( not ( = ?auto_590845 ?auto_590849 ) ) ( not ( = ?auto_590845 ?auto_590850 ) ) ( not ( = ?auto_590846 ?auto_590847 ) ) ( not ( = ?auto_590846 ?auto_590848 ) ) ( not ( = ?auto_590846 ?auto_590849 ) ) ( not ( = ?auto_590846 ?auto_590850 ) ) ( not ( = ?auto_590847 ?auto_590848 ) ) ( not ( = ?auto_590847 ?auto_590849 ) ) ( not ( = ?auto_590847 ?auto_590850 ) ) ( not ( = ?auto_590848 ?auto_590849 ) ) ( not ( = ?auto_590848 ?auto_590850 ) ) ( not ( = ?auto_590849 ?auto_590850 ) ) ( CLEAR ?auto_590847 ) ( ON ?auto_590848 ?auto_590849 ) ( CLEAR ?auto_590848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_590843 ?auto_590844 ?auto_590845 ?auto_590846 ?auto_590847 ?auto_590848 )
      ( MAKE-7PILE ?auto_590843 ?auto_590844 ?auto_590845 ?auto_590846 ?auto_590847 ?auto_590848 ?auto_590849 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590873 - BLOCK
      ?auto_590874 - BLOCK
      ?auto_590875 - BLOCK
      ?auto_590876 - BLOCK
      ?auto_590877 - BLOCK
      ?auto_590878 - BLOCK
      ?auto_590879 - BLOCK
    )
    :vars
    (
      ?auto_590880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590879 ?auto_590880 ) ( ON-TABLE ?auto_590873 ) ( ON ?auto_590874 ?auto_590873 ) ( ON ?auto_590875 ?auto_590874 ) ( ON ?auto_590876 ?auto_590875 ) ( not ( = ?auto_590873 ?auto_590874 ) ) ( not ( = ?auto_590873 ?auto_590875 ) ) ( not ( = ?auto_590873 ?auto_590876 ) ) ( not ( = ?auto_590873 ?auto_590877 ) ) ( not ( = ?auto_590873 ?auto_590878 ) ) ( not ( = ?auto_590873 ?auto_590879 ) ) ( not ( = ?auto_590873 ?auto_590880 ) ) ( not ( = ?auto_590874 ?auto_590875 ) ) ( not ( = ?auto_590874 ?auto_590876 ) ) ( not ( = ?auto_590874 ?auto_590877 ) ) ( not ( = ?auto_590874 ?auto_590878 ) ) ( not ( = ?auto_590874 ?auto_590879 ) ) ( not ( = ?auto_590874 ?auto_590880 ) ) ( not ( = ?auto_590875 ?auto_590876 ) ) ( not ( = ?auto_590875 ?auto_590877 ) ) ( not ( = ?auto_590875 ?auto_590878 ) ) ( not ( = ?auto_590875 ?auto_590879 ) ) ( not ( = ?auto_590875 ?auto_590880 ) ) ( not ( = ?auto_590876 ?auto_590877 ) ) ( not ( = ?auto_590876 ?auto_590878 ) ) ( not ( = ?auto_590876 ?auto_590879 ) ) ( not ( = ?auto_590876 ?auto_590880 ) ) ( not ( = ?auto_590877 ?auto_590878 ) ) ( not ( = ?auto_590877 ?auto_590879 ) ) ( not ( = ?auto_590877 ?auto_590880 ) ) ( not ( = ?auto_590878 ?auto_590879 ) ) ( not ( = ?auto_590878 ?auto_590880 ) ) ( not ( = ?auto_590879 ?auto_590880 ) ) ( ON ?auto_590878 ?auto_590879 ) ( CLEAR ?auto_590876 ) ( ON ?auto_590877 ?auto_590878 ) ( CLEAR ?auto_590877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_590873 ?auto_590874 ?auto_590875 ?auto_590876 ?auto_590877 )
      ( MAKE-7PILE ?auto_590873 ?auto_590874 ?auto_590875 ?auto_590876 ?auto_590877 ?auto_590878 ?auto_590879 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590903 - BLOCK
      ?auto_590904 - BLOCK
      ?auto_590905 - BLOCK
      ?auto_590906 - BLOCK
      ?auto_590907 - BLOCK
      ?auto_590908 - BLOCK
      ?auto_590909 - BLOCK
    )
    :vars
    (
      ?auto_590910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590909 ?auto_590910 ) ( ON-TABLE ?auto_590903 ) ( ON ?auto_590904 ?auto_590903 ) ( ON ?auto_590905 ?auto_590904 ) ( not ( = ?auto_590903 ?auto_590904 ) ) ( not ( = ?auto_590903 ?auto_590905 ) ) ( not ( = ?auto_590903 ?auto_590906 ) ) ( not ( = ?auto_590903 ?auto_590907 ) ) ( not ( = ?auto_590903 ?auto_590908 ) ) ( not ( = ?auto_590903 ?auto_590909 ) ) ( not ( = ?auto_590903 ?auto_590910 ) ) ( not ( = ?auto_590904 ?auto_590905 ) ) ( not ( = ?auto_590904 ?auto_590906 ) ) ( not ( = ?auto_590904 ?auto_590907 ) ) ( not ( = ?auto_590904 ?auto_590908 ) ) ( not ( = ?auto_590904 ?auto_590909 ) ) ( not ( = ?auto_590904 ?auto_590910 ) ) ( not ( = ?auto_590905 ?auto_590906 ) ) ( not ( = ?auto_590905 ?auto_590907 ) ) ( not ( = ?auto_590905 ?auto_590908 ) ) ( not ( = ?auto_590905 ?auto_590909 ) ) ( not ( = ?auto_590905 ?auto_590910 ) ) ( not ( = ?auto_590906 ?auto_590907 ) ) ( not ( = ?auto_590906 ?auto_590908 ) ) ( not ( = ?auto_590906 ?auto_590909 ) ) ( not ( = ?auto_590906 ?auto_590910 ) ) ( not ( = ?auto_590907 ?auto_590908 ) ) ( not ( = ?auto_590907 ?auto_590909 ) ) ( not ( = ?auto_590907 ?auto_590910 ) ) ( not ( = ?auto_590908 ?auto_590909 ) ) ( not ( = ?auto_590908 ?auto_590910 ) ) ( not ( = ?auto_590909 ?auto_590910 ) ) ( ON ?auto_590908 ?auto_590909 ) ( ON ?auto_590907 ?auto_590908 ) ( CLEAR ?auto_590905 ) ( ON ?auto_590906 ?auto_590907 ) ( CLEAR ?auto_590906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_590903 ?auto_590904 ?auto_590905 ?auto_590906 )
      ( MAKE-7PILE ?auto_590903 ?auto_590904 ?auto_590905 ?auto_590906 ?auto_590907 ?auto_590908 ?auto_590909 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590933 - BLOCK
      ?auto_590934 - BLOCK
      ?auto_590935 - BLOCK
      ?auto_590936 - BLOCK
      ?auto_590937 - BLOCK
      ?auto_590938 - BLOCK
      ?auto_590939 - BLOCK
    )
    :vars
    (
      ?auto_590940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590939 ?auto_590940 ) ( ON-TABLE ?auto_590933 ) ( ON ?auto_590934 ?auto_590933 ) ( not ( = ?auto_590933 ?auto_590934 ) ) ( not ( = ?auto_590933 ?auto_590935 ) ) ( not ( = ?auto_590933 ?auto_590936 ) ) ( not ( = ?auto_590933 ?auto_590937 ) ) ( not ( = ?auto_590933 ?auto_590938 ) ) ( not ( = ?auto_590933 ?auto_590939 ) ) ( not ( = ?auto_590933 ?auto_590940 ) ) ( not ( = ?auto_590934 ?auto_590935 ) ) ( not ( = ?auto_590934 ?auto_590936 ) ) ( not ( = ?auto_590934 ?auto_590937 ) ) ( not ( = ?auto_590934 ?auto_590938 ) ) ( not ( = ?auto_590934 ?auto_590939 ) ) ( not ( = ?auto_590934 ?auto_590940 ) ) ( not ( = ?auto_590935 ?auto_590936 ) ) ( not ( = ?auto_590935 ?auto_590937 ) ) ( not ( = ?auto_590935 ?auto_590938 ) ) ( not ( = ?auto_590935 ?auto_590939 ) ) ( not ( = ?auto_590935 ?auto_590940 ) ) ( not ( = ?auto_590936 ?auto_590937 ) ) ( not ( = ?auto_590936 ?auto_590938 ) ) ( not ( = ?auto_590936 ?auto_590939 ) ) ( not ( = ?auto_590936 ?auto_590940 ) ) ( not ( = ?auto_590937 ?auto_590938 ) ) ( not ( = ?auto_590937 ?auto_590939 ) ) ( not ( = ?auto_590937 ?auto_590940 ) ) ( not ( = ?auto_590938 ?auto_590939 ) ) ( not ( = ?auto_590938 ?auto_590940 ) ) ( not ( = ?auto_590939 ?auto_590940 ) ) ( ON ?auto_590938 ?auto_590939 ) ( ON ?auto_590937 ?auto_590938 ) ( ON ?auto_590936 ?auto_590937 ) ( CLEAR ?auto_590934 ) ( ON ?auto_590935 ?auto_590936 ) ( CLEAR ?auto_590935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_590933 ?auto_590934 ?auto_590935 )
      ( MAKE-7PILE ?auto_590933 ?auto_590934 ?auto_590935 ?auto_590936 ?auto_590937 ?auto_590938 ?auto_590939 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590963 - BLOCK
      ?auto_590964 - BLOCK
      ?auto_590965 - BLOCK
      ?auto_590966 - BLOCK
      ?auto_590967 - BLOCK
      ?auto_590968 - BLOCK
      ?auto_590969 - BLOCK
    )
    :vars
    (
      ?auto_590970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590969 ?auto_590970 ) ( ON-TABLE ?auto_590963 ) ( not ( = ?auto_590963 ?auto_590964 ) ) ( not ( = ?auto_590963 ?auto_590965 ) ) ( not ( = ?auto_590963 ?auto_590966 ) ) ( not ( = ?auto_590963 ?auto_590967 ) ) ( not ( = ?auto_590963 ?auto_590968 ) ) ( not ( = ?auto_590963 ?auto_590969 ) ) ( not ( = ?auto_590963 ?auto_590970 ) ) ( not ( = ?auto_590964 ?auto_590965 ) ) ( not ( = ?auto_590964 ?auto_590966 ) ) ( not ( = ?auto_590964 ?auto_590967 ) ) ( not ( = ?auto_590964 ?auto_590968 ) ) ( not ( = ?auto_590964 ?auto_590969 ) ) ( not ( = ?auto_590964 ?auto_590970 ) ) ( not ( = ?auto_590965 ?auto_590966 ) ) ( not ( = ?auto_590965 ?auto_590967 ) ) ( not ( = ?auto_590965 ?auto_590968 ) ) ( not ( = ?auto_590965 ?auto_590969 ) ) ( not ( = ?auto_590965 ?auto_590970 ) ) ( not ( = ?auto_590966 ?auto_590967 ) ) ( not ( = ?auto_590966 ?auto_590968 ) ) ( not ( = ?auto_590966 ?auto_590969 ) ) ( not ( = ?auto_590966 ?auto_590970 ) ) ( not ( = ?auto_590967 ?auto_590968 ) ) ( not ( = ?auto_590967 ?auto_590969 ) ) ( not ( = ?auto_590967 ?auto_590970 ) ) ( not ( = ?auto_590968 ?auto_590969 ) ) ( not ( = ?auto_590968 ?auto_590970 ) ) ( not ( = ?auto_590969 ?auto_590970 ) ) ( ON ?auto_590968 ?auto_590969 ) ( ON ?auto_590967 ?auto_590968 ) ( ON ?auto_590966 ?auto_590967 ) ( ON ?auto_590965 ?auto_590966 ) ( CLEAR ?auto_590963 ) ( ON ?auto_590964 ?auto_590965 ) ( CLEAR ?auto_590964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_590963 ?auto_590964 )
      ( MAKE-7PILE ?auto_590963 ?auto_590964 ?auto_590965 ?auto_590966 ?auto_590967 ?auto_590968 ?auto_590969 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_590993 - BLOCK
      ?auto_590994 - BLOCK
      ?auto_590995 - BLOCK
      ?auto_590996 - BLOCK
      ?auto_590997 - BLOCK
      ?auto_590998 - BLOCK
      ?auto_590999 - BLOCK
    )
    :vars
    (
      ?auto_591000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_590999 ?auto_591000 ) ( not ( = ?auto_590993 ?auto_590994 ) ) ( not ( = ?auto_590993 ?auto_590995 ) ) ( not ( = ?auto_590993 ?auto_590996 ) ) ( not ( = ?auto_590993 ?auto_590997 ) ) ( not ( = ?auto_590993 ?auto_590998 ) ) ( not ( = ?auto_590993 ?auto_590999 ) ) ( not ( = ?auto_590993 ?auto_591000 ) ) ( not ( = ?auto_590994 ?auto_590995 ) ) ( not ( = ?auto_590994 ?auto_590996 ) ) ( not ( = ?auto_590994 ?auto_590997 ) ) ( not ( = ?auto_590994 ?auto_590998 ) ) ( not ( = ?auto_590994 ?auto_590999 ) ) ( not ( = ?auto_590994 ?auto_591000 ) ) ( not ( = ?auto_590995 ?auto_590996 ) ) ( not ( = ?auto_590995 ?auto_590997 ) ) ( not ( = ?auto_590995 ?auto_590998 ) ) ( not ( = ?auto_590995 ?auto_590999 ) ) ( not ( = ?auto_590995 ?auto_591000 ) ) ( not ( = ?auto_590996 ?auto_590997 ) ) ( not ( = ?auto_590996 ?auto_590998 ) ) ( not ( = ?auto_590996 ?auto_590999 ) ) ( not ( = ?auto_590996 ?auto_591000 ) ) ( not ( = ?auto_590997 ?auto_590998 ) ) ( not ( = ?auto_590997 ?auto_590999 ) ) ( not ( = ?auto_590997 ?auto_591000 ) ) ( not ( = ?auto_590998 ?auto_590999 ) ) ( not ( = ?auto_590998 ?auto_591000 ) ) ( not ( = ?auto_590999 ?auto_591000 ) ) ( ON ?auto_590998 ?auto_590999 ) ( ON ?auto_590997 ?auto_590998 ) ( ON ?auto_590996 ?auto_590997 ) ( ON ?auto_590995 ?auto_590996 ) ( ON ?auto_590994 ?auto_590995 ) ( ON ?auto_590993 ?auto_590994 ) ( CLEAR ?auto_590993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_590993 )
      ( MAKE-7PILE ?auto_590993 ?auto_590994 ?auto_590995 ?auto_590996 ?auto_590997 ?auto_590998 ?auto_590999 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591024 - BLOCK
      ?auto_591025 - BLOCK
      ?auto_591026 - BLOCK
      ?auto_591027 - BLOCK
      ?auto_591028 - BLOCK
      ?auto_591029 - BLOCK
      ?auto_591030 - BLOCK
      ?auto_591031 - BLOCK
    )
    :vars
    (
      ?auto_591032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_591030 ) ( ON ?auto_591031 ?auto_591032 ) ( CLEAR ?auto_591031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_591024 ) ( ON ?auto_591025 ?auto_591024 ) ( ON ?auto_591026 ?auto_591025 ) ( ON ?auto_591027 ?auto_591026 ) ( ON ?auto_591028 ?auto_591027 ) ( ON ?auto_591029 ?auto_591028 ) ( ON ?auto_591030 ?auto_591029 ) ( not ( = ?auto_591024 ?auto_591025 ) ) ( not ( = ?auto_591024 ?auto_591026 ) ) ( not ( = ?auto_591024 ?auto_591027 ) ) ( not ( = ?auto_591024 ?auto_591028 ) ) ( not ( = ?auto_591024 ?auto_591029 ) ) ( not ( = ?auto_591024 ?auto_591030 ) ) ( not ( = ?auto_591024 ?auto_591031 ) ) ( not ( = ?auto_591024 ?auto_591032 ) ) ( not ( = ?auto_591025 ?auto_591026 ) ) ( not ( = ?auto_591025 ?auto_591027 ) ) ( not ( = ?auto_591025 ?auto_591028 ) ) ( not ( = ?auto_591025 ?auto_591029 ) ) ( not ( = ?auto_591025 ?auto_591030 ) ) ( not ( = ?auto_591025 ?auto_591031 ) ) ( not ( = ?auto_591025 ?auto_591032 ) ) ( not ( = ?auto_591026 ?auto_591027 ) ) ( not ( = ?auto_591026 ?auto_591028 ) ) ( not ( = ?auto_591026 ?auto_591029 ) ) ( not ( = ?auto_591026 ?auto_591030 ) ) ( not ( = ?auto_591026 ?auto_591031 ) ) ( not ( = ?auto_591026 ?auto_591032 ) ) ( not ( = ?auto_591027 ?auto_591028 ) ) ( not ( = ?auto_591027 ?auto_591029 ) ) ( not ( = ?auto_591027 ?auto_591030 ) ) ( not ( = ?auto_591027 ?auto_591031 ) ) ( not ( = ?auto_591027 ?auto_591032 ) ) ( not ( = ?auto_591028 ?auto_591029 ) ) ( not ( = ?auto_591028 ?auto_591030 ) ) ( not ( = ?auto_591028 ?auto_591031 ) ) ( not ( = ?auto_591028 ?auto_591032 ) ) ( not ( = ?auto_591029 ?auto_591030 ) ) ( not ( = ?auto_591029 ?auto_591031 ) ) ( not ( = ?auto_591029 ?auto_591032 ) ) ( not ( = ?auto_591030 ?auto_591031 ) ) ( not ( = ?auto_591030 ?auto_591032 ) ) ( not ( = ?auto_591031 ?auto_591032 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_591031 ?auto_591032 )
      ( !STACK ?auto_591031 ?auto_591030 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591058 - BLOCK
      ?auto_591059 - BLOCK
      ?auto_591060 - BLOCK
      ?auto_591061 - BLOCK
      ?auto_591062 - BLOCK
      ?auto_591063 - BLOCK
      ?auto_591064 - BLOCK
      ?auto_591065 - BLOCK
    )
    :vars
    (
      ?auto_591066 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591065 ?auto_591066 ) ( ON-TABLE ?auto_591058 ) ( ON ?auto_591059 ?auto_591058 ) ( ON ?auto_591060 ?auto_591059 ) ( ON ?auto_591061 ?auto_591060 ) ( ON ?auto_591062 ?auto_591061 ) ( ON ?auto_591063 ?auto_591062 ) ( not ( = ?auto_591058 ?auto_591059 ) ) ( not ( = ?auto_591058 ?auto_591060 ) ) ( not ( = ?auto_591058 ?auto_591061 ) ) ( not ( = ?auto_591058 ?auto_591062 ) ) ( not ( = ?auto_591058 ?auto_591063 ) ) ( not ( = ?auto_591058 ?auto_591064 ) ) ( not ( = ?auto_591058 ?auto_591065 ) ) ( not ( = ?auto_591058 ?auto_591066 ) ) ( not ( = ?auto_591059 ?auto_591060 ) ) ( not ( = ?auto_591059 ?auto_591061 ) ) ( not ( = ?auto_591059 ?auto_591062 ) ) ( not ( = ?auto_591059 ?auto_591063 ) ) ( not ( = ?auto_591059 ?auto_591064 ) ) ( not ( = ?auto_591059 ?auto_591065 ) ) ( not ( = ?auto_591059 ?auto_591066 ) ) ( not ( = ?auto_591060 ?auto_591061 ) ) ( not ( = ?auto_591060 ?auto_591062 ) ) ( not ( = ?auto_591060 ?auto_591063 ) ) ( not ( = ?auto_591060 ?auto_591064 ) ) ( not ( = ?auto_591060 ?auto_591065 ) ) ( not ( = ?auto_591060 ?auto_591066 ) ) ( not ( = ?auto_591061 ?auto_591062 ) ) ( not ( = ?auto_591061 ?auto_591063 ) ) ( not ( = ?auto_591061 ?auto_591064 ) ) ( not ( = ?auto_591061 ?auto_591065 ) ) ( not ( = ?auto_591061 ?auto_591066 ) ) ( not ( = ?auto_591062 ?auto_591063 ) ) ( not ( = ?auto_591062 ?auto_591064 ) ) ( not ( = ?auto_591062 ?auto_591065 ) ) ( not ( = ?auto_591062 ?auto_591066 ) ) ( not ( = ?auto_591063 ?auto_591064 ) ) ( not ( = ?auto_591063 ?auto_591065 ) ) ( not ( = ?auto_591063 ?auto_591066 ) ) ( not ( = ?auto_591064 ?auto_591065 ) ) ( not ( = ?auto_591064 ?auto_591066 ) ) ( not ( = ?auto_591065 ?auto_591066 ) ) ( CLEAR ?auto_591063 ) ( ON ?auto_591064 ?auto_591065 ) ( CLEAR ?auto_591064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_591058 ?auto_591059 ?auto_591060 ?auto_591061 ?auto_591062 ?auto_591063 ?auto_591064 )
      ( MAKE-8PILE ?auto_591058 ?auto_591059 ?auto_591060 ?auto_591061 ?auto_591062 ?auto_591063 ?auto_591064 ?auto_591065 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591092 - BLOCK
      ?auto_591093 - BLOCK
      ?auto_591094 - BLOCK
      ?auto_591095 - BLOCK
      ?auto_591096 - BLOCK
      ?auto_591097 - BLOCK
      ?auto_591098 - BLOCK
      ?auto_591099 - BLOCK
    )
    :vars
    (
      ?auto_591100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591099 ?auto_591100 ) ( ON-TABLE ?auto_591092 ) ( ON ?auto_591093 ?auto_591092 ) ( ON ?auto_591094 ?auto_591093 ) ( ON ?auto_591095 ?auto_591094 ) ( ON ?auto_591096 ?auto_591095 ) ( not ( = ?auto_591092 ?auto_591093 ) ) ( not ( = ?auto_591092 ?auto_591094 ) ) ( not ( = ?auto_591092 ?auto_591095 ) ) ( not ( = ?auto_591092 ?auto_591096 ) ) ( not ( = ?auto_591092 ?auto_591097 ) ) ( not ( = ?auto_591092 ?auto_591098 ) ) ( not ( = ?auto_591092 ?auto_591099 ) ) ( not ( = ?auto_591092 ?auto_591100 ) ) ( not ( = ?auto_591093 ?auto_591094 ) ) ( not ( = ?auto_591093 ?auto_591095 ) ) ( not ( = ?auto_591093 ?auto_591096 ) ) ( not ( = ?auto_591093 ?auto_591097 ) ) ( not ( = ?auto_591093 ?auto_591098 ) ) ( not ( = ?auto_591093 ?auto_591099 ) ) ( not ( = ?auto_591093 ?auto_591100 ) ) ( not ( = ?auto_591094 ?auto_591095 ) ) ( not ( = ?auto_591094 ?auto_591096 ) ) ( not ( = ?auto_591094 ?auto_591097 ) ) ( not ( = ?auto_591094 ?auto_591098 ) ) ( not ( = ?auto_591094 ?auto_591099 ) ) ( not ( = ?auto_591094 ?auto_591100 ) ) ( not ( = ?auto_591095 ?auto_591096 ) ) ( not ( = ?auto_591095 ?auto_591097 ) ) ( not ( = ?auto_591095 ?auto_591098 ) ) ( not ( = ?auto_591095 ?auto_591099 ) ) ( not ( = ?auto_591095 ?auto_591100 ) ) ( not ( = ?auto_591096 ?auto_591097 ) ) ( not ( = ?auto_591096 ?auto_591098 ) ) ( not ( = ?auto_591096 ?auto_591099 ) ) ( not ( = ?auto_591096 ?auto_591100 ) ) ( not ( = ?auto_591097 ?auto_591098 ) ) ( not ( = ?auto_591097 ?auto_591099 ) ) ( not ( = ?auto_591097 ?auto_591100 ) ) ( not ( = ?auto_591098 ?auto_591099 ) ) ( not ( = ?auto_591098 ?auto_591100 ) ) ( not ( = ?auto_591099 ?auto_591100 ) ) ( ON ?auto_591098 ?auto_591099 ) ( CLEAR ?auto_591096 ) ( ON ?auto_591097 ?auto_591098 ) ( CLEAR ?auto_591097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_591092 ?auto_591093 ?auto_591094 ?auto_591095 ?auto_591096 ?auto_591097 )
      ( MAKE-8PILE ?auto_591092 ?auto_591093 ?auto_591094 ?auto_591095 ?auto_591096 ?auto_591097 ?auto_591098 ?auto_591099 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591126 - BLOCK
      ?auto_591127 - BLOCK
      ?auto_591128 - BLOCK
      ?auto_591129 - BLOCK
      ?auto_591130 - BLOCK
      ?auto_591131 - BLOCK
      ?auto_591132 - BLOCK
      ?auto_591133 - BLOCK
    )
    :vars
    (
      ?auto_591134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591133 ?auto_591134 ) ( ON-TABLE ?auto_591126 ) ( ON ?auto_591127 ?auto_591126 ) ( ON ?auto_591128 ?auto_591127 ) ( ON ?auto_591129 ?auto_591128 ) ( not ( = ?auto_591126 ?auto_591127 ) ) ( not ( = ?auto_591126 ?auto_591128 ) ) ( not ( = ?auto_591126 ?auto_591129 ) ) ( not ( = ?auto_591126 ?auto_591130 ) ) ( not ( = ?auto_591126 ?auto_591131 ) ) ( not ( = ?auto_591126 ?auto_591132 ) ) ( not ( = ?auto_591126 ?auto_591133 ) ) ( not ( = ?auto_591126 ?auto_591134 ) ) ( not ( = ?auto_591127 ?auto_591128 ) ) ( not ( = ?auto_591127 ?auto_591129 ) ) ( not ( = ?auto_591127 ?auto_591130 ) ) ( not ( = ?auto_591127 ?auto_591131 ) ) ( not ( = ?auto_591127 ?auto_591132 ) ) ( not ( = ?auto_591127 ?auto_591133 ) ) ( not ( = ?auto_591127 ?auto_591134 ) ) ( not ( = ?auto_591128 ?auto_591129 ) ) ( not ( = ?auto_591128 ?auto_591130 ) ) ( not ( = ?auto_591128 ?auto_591131 ) ) ( not ( = ?auto_591128 ?auto_591132 ) ) ( not ( = ?auto_591128 ?auto_591133 ) ) ( not ( = ?auto_591128 ?auto_591134 ) ) ( not ( = ?auto_591129 ?auto_591130 ) ) ( not ( = ?auto_591129 ?auto_591131 ) ) ( not ( = ?auto_591129 ?auto_591132 ) ) ( not ( = ?auto_591129 ?auto_591133 ) ) ( not ( = ?auto_591129 ?auto_591134 ) ) ( not ( = ?auto_591130 ?auto_591131 ) ) ( not ( = ?auto_591130 ?auto_591132 ) ) ( not ( = ?auto_591130 ?auto_591133 ) ) ( not ( = ?auto_591130 ?auto_591134 ) ) ( not ( = ?auto_591131 ?auto_591132 ) ) ( not ( = ?auto_591131 ?auto_591133 ) ) ( not ( = ?auto_591131 ?auto_591134 ) ) ( not ( = ?auto_591132 ?auto_591133 ) ) ( not ( = ?auto_591132 ?auto_591134 ) ) ( not ( = ?auto_591133 ?auto_591134 ) ) ( ON ?auto_591132 ?auto_591133 ) ( ON ?auto_591131 ?auto_591132 ) ( CLEAR ?auto_591129 ) ( ON ?auto_591130 ?auto_591131 ) ( CLEAR ?auto_591130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_591126 ?auto_591127 ?auto_591128 ?auto_591129 ?auto_591130 )
      ( MAKE-8PILE ?auto_591126 ?auto_591127 ?auto_591128 ?auto_591129 ?auto_591130 ?auto_591131 ?auto_591132 ?auto_591133 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591160 - BLOCK
      ?auto_591161 - BLOCK
      ?auto_591162 - BLOCK
      ?auto_591163 - BLOCK
      ?auto_591164 - BLOCK
      ?auto_591165 - BLOCK
      ?auto_591166 - BLOCK
      ?auto_591167 - BLOCK
    )
    :vars
    (
      ?auto_591168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591167 ?auto_591168 ) ( ON-TABLE ?auto_591160 ) ( ON ?auto_591161 ?auto_591160 ) ( ON ?auto_591162 ?auto_591161 ) ( not ( = ?auto_591160 ?auto_591161 ) ) ( not ( = ?auto_591160 ?auto_591162 ) ) ( not ( = ?auto_591160 ?auto_591163 ) ) ( not ( = ?auto_591160 ?auto_591164 ) ) ( not ( = ?auto_591160 ?auto_591165 ) ) ( not ( = ?auto_591160 ?auto_591166 ) ) ( not ( = ?auto_591160 ?auto_591167 ) ) ( not ( = ?auto_591160 ?auto_591168 ) ) ( not ( = ?auto_591161 ?auto_591162 ) ) ( not ( = ?auto_591161 ?auto_591163 ) ) ( not ( = ?auto_591161 ?auto_591164 ) ) ( not ( = ?auto_591161 ?auto_591165 ) ) ( not ( = ?auto_591161 ?auto_591166 ) ) ( not ( = ?auto_591161 ?auto_591167 ) ) ( not ( = ?auto_591161 ?auto_591168 ) ) ( not ( = ?auto_591162 ?auto_591163 ) ) ( not ( = ?auto_591162 ?auto_591164 ) ) ( not ( = ?auto_591162 ?auto_591165 ) ) ( not ( = ?auto_591162 ?auto_591166 ) ) ( not ( = ?auto_591162 ?auto_591167 ) ) ( not ( = ?auto_591162 ?auto_591168 ) ) ( not ( = ?auto_591163 ?auto_591164 ) ) ( not ( = ?auto_591163 ?auto_591165 ) ) ( not ( = ?auto_591163 ?auto_591166 ) ) ( not ( = ?auto_591163 ?auto_591167 ) ) ( not ( = ?auto_591163 ?auto_591168 ) ) ( not ( = ?auto_591164 ?auto_591165 ) ) ( not ( = ?auto_591164 ?auto_591166 ) ) ( not ( = ?auto_591164 ?auto_591167 ) ) ( not ( = ?auto_591164 ?auto_591168 ) ) ( not ( = ?auto_591165 ?auto_591166 ) ) ( not ( = ?auto_591165 ?auto_591167 ) ) ( not ( = ?auto_591165 ?auto_591168 ) ) ( not ( = ?auto_591166 ?auto_591167 ) ) ( not ( = ?auto_591166 ?auto_591168 ) ) ( not ( = ?auto_591167 ?auto_591168 ) ) ( ON ?auto_591166 ?auto_591167 ) ( ON ?auto_591165 ?auto_591166 ) ( ON ?auto_591164 ?auto_591165 ) ( CLEAR ?auto_591162 ) ( ON ?auto_591163 ?auto_591164 ) ( CLEAR ?auto_591163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_591160 ?auto_591161 ?auto_591162 ?auto_591163 )
      ( MAKE-8PILE ?auto_591160 ?auto_591161 ?auto_591162 ?auto_591163 ?auto_591164 ?auto_591165 ?auto_591166 ?auto_591167 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591194 - BLOCK
      ?auto_591195 - BLOCK
      ?auto_591196 - BLOCK
      ?auto_591197 - BLOCK
      ?auto_591198 - BLOCK
      ?auto_591199 - BLOCK
      ?auto_591200 - BLOCK
      ?auto_591201 - BLOCK
    )
    :vars
    (
      ?auto_591202 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591201 ?auto_591202 ) ( ON-TABLE ?auto_591194 ) ( ON ?auto_591195 ?auto_591194 ) ( not ( = ?auto_591194 ?auto_591195 ) ) ( not ( = ?auto_591194 ?auto_591196 ) ) ( not ( = ?auto_591194 ?auto_591197 ) ) ( not ( = ?auto_591194 ?auto_591198 ) ) ( not ( = ?auto_591194 ?auto_591199 ) ) ( not ( = ?auto_591194 ?auto_591200 ) ) ( not ( = ?auto_591194 ?auto_591201 ) ) ( not ( = ?auto_591194 ?auto_591202 ) ) ( not ( = ?auto_591195 ?auto_591196 ) ) ( not ( = ?auto_591195 ?auto_591197 ) ) ( not ( = ?auto_591195 ?auto_591198 ) ) ( not ( = ?auto_591195 ?auto_591199 ) ) ( not ( = ?auto_591195 ?auto_591200 ) ) ( not ( = ?auto_591195 ?auto_591201 ) ) ( not ( = ?auto_591195 ?auto_591202 ) ) ( not ( = ?auto_591196 ?auto_591197 ) ) ( not ( = ?auto_591196 ?auto_591198 ) ) ( not ( = ?auto_591196 ?auto_591199 ) ) ( not ( = ?auto_591196 ?auto_591200 ) ) ( not ( = ?auto_591196 ?auto_591201 ) ) ( not ( = ?auto_591196 ?auto_591202 ) ) ( not ( = ?auto_591197 ?auto_591198 ) ) ( not ( = ?auto_591197 ?auto_591199 ) ) ( not ( = ?auto_591197 ?auto_591200 ) ) ( not ( = ?auto_591197 ?auto_591201 ) ) ( not ( = ?auto_591197 ?auto_591202 ) ) ( not ( = ?auto_591198 ?auto_591199 ) ) ( not ( = ?auto_591198 ?auto_591200 ) ) ( not ( = ?auto_591198 ?auto_591201 ) ) ( not ( = ?auto_591198 ?auto_591202 ) ) ( not ( = ?auto_591199 ?auto_591200 ) ) ( not ( = ?auto_591199 ?auto_591201 ) ) ( not ( = ?auto_591199 ?auto_591202 ) ) ( not ( = ?auto_591200 ?auto_591201 ) ) ( not ( = ?auto_591200 ?auto_591202 ) ) ( not ( = ?auto_591201 ?auto_591202 ) ) ( ON ?auto_591200 ?auto_591201 ) ( ON ?auto_591199 ?auto_591200 ) ( ON ?auto_591198 ?auto_591199 ) ( ON ?auto_591197 ?auto_591198 ) ( CLEAR ?auto_591195 ) ( ON ?auto_591196 ?auto_591197 ) ( CLEAR ?auto_591196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_591194 ?auto_591195 ?auto_591196 )
      ( MAKE-8PILE ?auto_591194 ?auto_591195 ?auto_591196 ?auto_591197 ?auto_591198 ?auto_591199 ?auto_591200 ?auto_591201 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591228 - BLOCK
      ?auto_591229 - BLOCK
      ?auto_591230 - BLOCK
      ?auto_591231 - BLOCK
      ?auto_591232 - BLOCK
      ?auto_591233 - BLOCK
      ?auto_591234 - BLOCK
      ?auto_591235 - BLOCK
    )
    :vars
    (
      ?auto_591236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591235 ?auto_591236 ) ( ON-TABLE ?auto_591228 ) ( not ( = ?auto_591228 ?auto_591229 ) ) ( not ( = ?auto_591228 ?auto_591230 ) ) ( not ( = ?auto_591228 ?auto_591231 ) ) ( not ( = ?auto_591228 ?auto_591232 ) ) ( not ( = ?auto_591228 ?auto_591233 ) ) ( not ( = ?auto_591228 ?auto_591234 ) ) ( not ( = ?auto_591228 ?auto_591235 ) ) ( not ( = ?auto_591228 ?auto_591236 ) ) ( not ( = ?auto_591229 ?auto_591230 ) ) ( not ( = ?auto_591229 ?auto_591231 ) ) ( not ( = ?auto_591229 ?auto_591232 ) ) ( not ( = ?auto_591229 ?auto_591233 ) ) ( not ( = ?auto_591229 ?auto_591234 ) ) ( not ( = ?auto_591229 ?auto_591235 ) ) ( not ( = ?auto_591229 ?auto_591236 ) ) ( not ( = ?auto_591230 ?auto_591231 ) ) ( not ( = ?auto_591230 ?auto_591232 ) ) ( not ( = ?auto_591230 ?auto_591233 ) ) ( not ( = ?auto_591230 ?auto_591234 ) ) ( not ( = ?auto_591230 ?auto_591235 ) ) ( not ( = ?auto_591230 ?auto_591236 ) ) ( not ( = ?auto_591231 ?auto_591232 ) ) ( not ( = ?auto_591231 ?auto_591233 ) ) ( not ( = ?auto_591231 ?auto_591234 ) ) ( not ( = ?auto_591231 ?auto_591235 ) ) ( not ( = ?auto_591231 ?auto_591236 ) ) ( not ( = ?auto_591232 ?auto_591233 ) ) ( not ( = ?auto_591232 ?auto_591234 ) ) ( not ( = ?auto_591232 ?auto_591235 ) ) ( not ( = ?auto_591232 ?auto_591236 ) ) ( not ( = ?auto_591233 ?auto_591234 ) ) ( not ( = ?auto_591233 ?auto_591235 ) ) ( not ( = ?auto_591233 ?auto_591236 ) ) ( not ( = ?auto_591234 ?auto_591235 ) ) ( not ( = ?auto_591234 ?auto_591236 ) ) ( not ( = ?auto_591235 ?auto_591236 ) ) ( ON ?auto_591234 ?auto_591235 ) ( ON ?auto_591233 ?auto_591234 ) ( ON ?auto_591232 ?auto_591233 ) ( ON ?auto_591231 ?auto_591232 ) ( ON ?auto_591230 ?auto_591231 ) ( CLEAR ?auto_591228 ) ( ON ?auto_591229 ?auto_591230 ) ( CLEAR ?auto_591229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_591228 ?auto_591229 )
      ( MAKE-8PILE ?auto_591228 ?auto_591229 ?auto_591230 ?auto_591231 ?auto_591232 ?auto_591233 ?auto_591234 ?auto_591235 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_591262 - BLOCK
      ?auto_591263 - BLOCK
      ?auto_591264 - BLOCK
      ?auto_591265 - BLOCK
      ?auto_591266 - BLOCK
      ?auto_591267 - BLOCK
      ?auto_591268 - BLOCK
      ?auto_591269 - BLOCK
    )
    :vars
    (
      ?auto_591270 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591269 ?auto_591270 ) ( not ( = ?auto_591262 ?auto_591263 ) ) ( not ( = ?auto_591262 ?auto_591264 ) ) ( not ( = ?auto_591262 ?auto_591265 ) ) ( not ( = ?auto_591262 ?auto_591266 ) ) ( not ( = ?auto_591262 ?auto_591267 ) ) ( not ( = ?auto_591262 ?auto_591268 ) ) ( not ( = ?auto_591262 ?auto_591269 ) ) ( not ( = ?auto_591262 ?auto_591270 ) ) ( not ( = ?auto_591263 ?auto_591264 ) ) ( not ( = ?auto_591263 ?auto_591265 ) ) ( not ( = ?auto_591263 ?auto_591266 ) ) ( not ( = ?auto_591263 ?auto_591267 ) ) ( not ( = ?auto_591263 ?auto_591268 ) ) ( not ( = ?auto_591263 ?auto_591269 ) ) ( not ( = ?auto_591263 ?auto_591270 ) ) ( not ( = ?auto_591264 ?auto_591265 ) ) ( not ( = ?auto_591264 ?auto_591266 ) ) ( not ( = ?auto_591264 ?auto_591267 ) ) ( not ( = ?auto_591264 ?auto_591268 ) ) ( not ( = ?auto_591264 ?auto_591269 ) ) ( not ( = ?auto_591264 ?auto_591270 ) ) ( not ( = ?auto_591265 ?auto_591266 ) ) ( not ( = ?auto_591265 ?auto_591267 ) ) ( not ( = ?auto_591265 ?auto_591268 ) ) ( not ( = ?auto_591265 ?auto_591269 ) ) ( not ( = ?auto_591265 ?auto_591270 ) ) ( not ( = ?auto_591266 ?auto_591267 ) ) ( not ( = ?auto_591266 ?auto_591268 ) ) ( not ( = ?auto_591266 ?auto_591269 ) ) ( not ( = ?auto_591266 ?auto_591270 ) ) ( not ( = ?auto_591267 ?auto_591268 ) ) ( not ( = ?auto_591267 ?auto_591269 ) ) ( not ( = ?auto_591267 ?auto_591270 ) ) ( not ( = ?auto_591268 ?auto_591269 ) ) ( not ( = ?auto_591268 ?auto_591270 ) ) ( not ( = ?auto_591269 ?auto_591270 ) ) ( ON ?auto_591268 ?auto_591269 ) ( ON ?auto_591267 ?auto_591268 ) ( ON ?auto_591266 ?auto_591267 ) ( ON ?auto_591265 ?auto_591266 ) ( ON ?auto_591264 ?auto_591265 ) ( ON ?auto_591263 ?auto_591264 ) ( ON ?auto_591262 ?auto_591263 ) ( CLEAR ?auto_591262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_591262 )
      ( MAKE-8PILE ?auto_591262 ?auto_591263 ?auto_591264 ?auto_591265 ?auto_591266 ?auto_591267 ?auto_591268 ?auto_591269 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591297 - BLOCK
      ?auto_591298 - BLOCK
      ?auto_591299 - BLOCK
      ?auto_591300 - BLOCK
      ?auto_591301 - BLOCK
      ?auto_591302 - BLOCK
      ?auto_591303 - BLOCK
      ?auto_591304 - BLOCK
      ?auto_591305 - BLOCK
    )
    :vars
    (
      ?auto_591306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_591304 ) ( ON ?auto_591305 ?auto_591306 ) ( CLEAR ?auto_591305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_591297 ) ( ON ?auto_591298 ?auto_591297 ) ( ON ?auto_591299 ?auto_591298 ) ( ON ?auto_591300 ?auto_591299 ) ( ON ?auto_591301 ?auto_591300 ) ( ON ?auto_591302 ?auto_591301 ) ( ON ?auto_591303 ?auto_591302 ) ( ON ?auto_591304 ?auto_591303 ) ( not ( = ?auto_591297 ?auto_591298 ) ) ( not ( = ?auto_591297 ?auto_591299 ) ) ( not ( = ?auto_591297 ?auto_591300 ) ) ( not ( = ?auto_591297 ?auto_591301 ) ) ( not ( = ?auto_591297 ?auto_591302 ) ) ( not ( = ?auto_591297 ?auto_591303 ) ) ( not ( = ?auto_591297 ?auto_591304 ) ) ( not ( = ?auto_591297 ?auto_591305 ) ) ( not ( = ?auto_591297 ?auto_591306 ) ) ( not ( = ?auto_591298 ?auto_591299 ) ) ( not ( = ?auto_591298 ?auto_591300 ) ) ( not ( = ?auto_591298 ?auto_591301 ) ) ( not ( = ?auto_591298 ?auto_591302 ) ) ( not ( = ?auto_591298 ?auto_591303 ) ) ( not ( = ?auto_591298 ?auto_591304 ) ) ( not ( = ?auto_591298 ?auto_591305 ) ) ( not ( = ?auto_591298 ?auto_591306 ) ) ( not ( = ?auto_591299 ?auto_591300 ) ) ( not ( = ?auto_591299 ?auto_591301 ) ) ( not ( = ?auto_591299 ?auto_591302 ) ) ( not ( = ?auto_591299 ?auto_591303 ) ) ( not ( = ?auto_591299 ?auto_591304 ) ) ( not ( = ?auto_591299 ?auto_591305 ) ) ( not ( = ?auto_591299 ?auto_591306 ) ) ( not ( = ?auto_591300 ?auto_591301 ) ) ( not ( = ?auto_591300 ?auto_591302 ) ) ( not ( = ?auto_591300 ?auto_591303 ) ) ( not ( = ?auto_591300 ?auto_591304 ) ) ( not ( = ?auto_591300 ?auto_591305 ) ) ( not ( = ?auto_591300 ?auto_591306 ) ) ( not ( = ?auto_591301 ?auto_591302 ) ) ( not ( = ?auto_591301 ?auto_591303 ) ) ( not ( = ?auto_591301 ?auto_591304 ) ) ( not ( = ?auto_591301 ?auto_591305 ) ) ( not ( = ?auto_591301 ?auto_591306 ) ) ( not ( = ?auto_591302 ?auto_591303 ) ) ( not ( = ?auto_591302 ?auto_591304 ) ) ( not ( = ?auto_591302 ?auto_591305 ) ) ( not ( = ?auto_591302 ?auto_591306 ) ) ( not ( = ?auto_591303 ?auto_591304 ) ) ( not ( = ?auto_591303 ?auto_591305 ) ) ( not ( = ?auto_591303 ?auto_591306 ) ) ( not ( = ?auto_591304 ?auto_591305 ) ) ( not ( = ?auto_591304 ?auto_591306 ) ) ( not ( = ?auto_591305 ?auto_591306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_591305 ?auto_591306 )
      ( !STACK ?auto_591305 ?auto_591304 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591335 - BLOCK
      ?auto_591336 - BLOCK
      ?auto_591337 - BLOCK
      ?auto_591338 - BLOCK
      ?auto_591339 - BLOCK
      ?auto_591340 - BLOCK
      ?auto_591341 - BLOCK
      ?auto_591342 - BLOCK
      ?auto_591343 - BLOCK
    )
    :vars
    (
      ?auto_591344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591343 ?auto_591344 ) ( ON-TABLE ?auto_591335 ) ( ON ?auto_591336 ?auto_591335 ) ( ON ?auto_591337 ?auto_591336 ) ( ON ?auto_591338 ?auto_591337 ) ( ON ?auto_591339 ?auto_591338 ) ( ON ?auto_591340 ?auto_591339 ) ( ON ?auto_591341 ?auto_591340 ) ( not ( = ?auto_591335 ?auto_591336 ) ) ( not ( = ?auto_591335 ?auto_591337 ) ) ( not ( = ?auto_591335 ?auto_591338 ) ) ( not ( = ?auto_591335 ?auto_591339 ) ) ( not ( = ?auto_591335 ?auto_591340 ) ) ( not ( = ?auto_591335 ?auto_591341 ) ) ( not ( = ?auto_591335 ?auto_591342 ) ) ( not ( = ?auto_591335 ?auto_591343 ) ) ( not ( = ?auto_591335 ?auto_591344 ) ) ( not ( = ?auto_591336 ?auto_591337 ) ) ( not ( = ?auto_591336 ?auto_591338 ) ) ( not ( = ?auto_591336 ?auto_591339 ) ) ( not ( = ?auto_591336 ?auto_591340 ) ) ( not ( = ?auto_591336 ?auto_591341 ) ) ( not ( = ?auto_591336 ?auto_591342 ) ) ( not ( = ?auto_591336 ?auto_591343 ) ) ( not ( = ?auto_591336 ?auto_591344 ) ) ( not ( = ?auto_591337 ?auto_591338 ) ) ( not ( = ?auto_591337 ?auto_591339 ) ) ( not ( = ?auto_591337 ?auto_591340 ) ) ( not ( = ?auto_591337 ?auto_591341 ) ) ( not ( = ?auto_591337 ?auto_591342 ) ) ( not ( = ?auto_591337 ?auto_591343 ) ) ( not ( = ?auto_591337 ?auto_591344 ) ) ( not ( = ?auto_591338 ?auto_591339 ) ) ( not ( = ?auto_591338 ?auto_591340 ) ) ( not ( = ?auto_591338 ?auto_591341 ) ) ( not ( = ?auto_591338 ?auto_591342 ) ) ( not ( = ?auto_591338 ?auto_591343 ) ) ( not ( = ?auto_591338 ?auto_591344 ) ) ( not ( = ?auto_591339 ?auto_591340 ) ) ( not ( = ?auto_591339 ?auto_591341 ) ) ( not ( = ?auto_591339 ?auto_591342 ) ) ( not ( = ?auto_591339 ?auto_591343 ) ) ( not ( = ?auto_591339 ?auto_591344 ) ) ( not ( = ?auto_591340 ?auto_591341 ) ) ( not ( = ?auto_591340 ?auto_591342 ) ) ( not ( = ?auto_591340 ?auto_591343 ) ) ( not ( = ?auto_591340 ?auto_591344 ) ) ( not ( = ?auto_591341 ?auto_591342 ) ) ( not ( = ?auto_591341 ?auto_591343 ) ) ( not ( = ?auto_591341 ?auto_591344 ) ) ( not ( = ?auto_591342 ?auto_591343 ) ) ( not ( = ?auto_591342 ?auto_591344 ) ) ( not ( = ?auto_591343 ?auto_591344 ) ) ( CLEAR ?auto_591341 ) ( ON ?auto_591342 ?auto_591343 ) ( CLEAR ?auto_591342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_591335 ?auto_591336 ?auto_591337 ?auto_591338 ?auto_591339 ?auto_591340 ?auto_591341 ?auto_591342 )
      ( MAKE-9PILE ?auto_591335 ?auto_591336 ?auto_591337 ?auto_591338 ?auto_591339 ?auto_591340 ?auto_591341 ?auto_591342 ?auto_591343 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591373 - BLOCK
      ?auto_591374 - BLOCK
      ?auto_591375 - BLOCK
      ?auto_591376 - BLOCK
      ?auto_591377 - BLOCK
      ?auto_591378 - BLOCK
      ?auto_591379 - BLOCK
      ?auto_591380 - BLOCK
      ?auto_591381 - BLOCK
    )
    :vars
    (
      ?auto_591382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591381 ?auto_591382 ) ( ON-TABLE ?auto_591373 ) ( ON ?auto_591374 ?auto_591373 ) ( ON ?auto_591375 ?auto_591374 ) ( ON ?auto_591376 ?auto_591375 ) ( ON ?auto_591377 ?auto_591376 ) ( ON ?auto_591378 ?auto_591377 ) ( not ( = ?auto_591373 ?auto_591374 ) ) ( not ( = ?auto_591373 ?auto_591375 ) ) ( not ( = ?auto_591373 ?auto_591376 ) ) ( not ( = ?auto_591373 ?auto_591377 ) ) ( not ( = ?auto_591373 ?auto_591378 ) ) ( not ( = ?auto_591373 ?auto_591379 ) ) ( not ( = ?auto_591373 ?auto_591380 ) ) ( not ( = ?auto_591373 ?auto_591381 ) ) ( not ( = ?auto_591373 ?auto_591382 ) ) ( not ( = ?auto_591374 ?auto_591375 ) ) ( not ( = ?auto_591374 ?auto_591376 ) ) ( not ( = ?auto_591374 ?auto_591377 ) ) ( not ( = ?auto_591374 ?auto_591378 ) ) ( not ( = ?auto_591374 ?auto_591379 ) ) ( not ( = ?auto_591374 ?auto_591380 ) ) ( not ( = ?auto_591374 ?auto_591381 ) ) ( not ( = ?auto_591374 ?auto_591382 ) ) ( not ( = ?auto_591375 ?auto_591376 ) ) ( not ( = ?auto_591375 ?auto_591377 ) ) ( not ( = ?auto_591375 ?auto_591378 ) ) ( not ( = ?auto_591375 ?auto_591379 ) ) ( not ( = ?auto_591375 ?auto_591380 ) ) ( not ( = ?auto_591375 ?auto_591381 ) ) ( not ( = ?auto_591375 ?auto_591382 ) ) ( not ( = ?auto_591376 ?auto_591377 ) ) ( not ( = ?auto_591376 ?auto_591378 ) ) ( not ( = ?auto_591376 ?auto_591379 ) ) ( not ( = ?auto_591376 ?auto_591380 ) ) ( not ( = ?auto_591376 ?auto_591381 ) ) ( not ( = ?auto_591376 ?auto_591382 ) ) ( not ( = ?auto_591377 ?auto_591378 ) ) ( not ( = ?auto_591377 ?auto_591379 ) ) ( not ( = ?auto_591377 ?auto_591380 ) ) ( not ( = ?auto_591377 ?auto_591381 ) ) ( not ( = ?auto_591377 ?auto_591382 ) ) ( not ( = ?auto_591378 ?auto_591379 ) ) ( not ( = ?auto_591378 ?auto_591380 ) ) ( not ( = ?auto_591378 ?auto_591381 ) ) ( not ( = ?auto_591378 ?auto_591382 ) ) ( not ( = ?auto_591379 ?auto_591380 ) ) ( not ( = ?auto_591379 ?auto_591381 ) ) ( not ( = ?auto_591379 ?auto_591382 ) ) ( not ( = ?auto_591380 ?auto_591381 ) ) ( not ( = ?auto_591380 ?auto_591382 ) ) ( not ( = ?auto_591381 ?auto_591382 ) ) ( ON ?auto_591380 ?auto_591381 ) ( CLEAR ?auto_591378 ) ( ON ?auto_591379 ?auto_591380 ) ( CLEAR ?auto_591379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_591373 ?auto_591374 ?auto_591375 ?auto_591376 ?auto_591377 ?auto_591378 ?auto_591379 )
      ( MAKE-9PILE ?auto_591373 ?auto_591374 ?auto_591375 ?auto_591376 ?auto_591377 ?auto_591378 ?auto_591379 ?auto_591380 ?auto_591381 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591411 - BLOCK
      ?auto_591412 - BLOCK
      ?auto_591413 - BLOCK
      ?auto_591414 - BLOCK
      ?auto_591415 - BLOCK
      ?auto_591416 - BLOCK
      ?auto_591417 - BLOCK
      ?auto_591418 - BLOCK
      ?auto_591419 - BLOCK
    )
    :vars
    (
      ?auto_591420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591419 ?auto_591420 ) ( ON-TABLE ?auto_591411 ) ( ON ?auto_591412 ?auto_591411 ) ( ON ?auto_591413 ?auto_591412 ) ( ON ?auto_591414 ?auto_591413 ) ( ON ?auto_591415 ?auto_591414 ) ( not ( = ?auto_591411 ?auto_591412 ) ) ( not ( = ?auto_591411 ?auto_591413 ) ) ( not ( = ?auto_591411 ?auto_591414 ) ) ( not ( = ?auto_591411 ?auto_591415 ) ) ( not ( = ?auto_591411 ?auto_591416 ) ) ( not ( = ?auto_591411 ?auto_591417 ) ) ( not ( = ?auto_591411 ?auto_591418 ) ) ( not ( = ?auto_591411 ?auto_591419 ) ) ( not ( = ?auto_591411 ?auto_591420 ) ) ( not ( = ?auto_591412 ?auto_591413 ) ) ( not ( = ?auto_591412 ?auto_591414 ) ) ( not ( = ?auto_591412 ?auto_591415 ) ) ( not ( = ?auto_591412 ?auto_591416 ) ) ( not ( = ?auto_591412 ?auto_591417 ) ) ( not ( = ?auto_591412 ?auto_591418 ) ) ( not ( = ?auto_591412 ?auto_591419 ) ) ( not ( = ?auto_591412 ?auto_591420 ) ) ( not ( = ?auto_591413 ?auto_591414 ) ) ( not ( = ?auto_591413 ?auto_591415 ) ) ( not ( = ?auto_591413 ?auto_591416 ) ) ( not ( = ?auto_591413 ?auto_591417 ) ) ( not ( = ?auto_591413 ?auto_591418 ) ) ( not ( = ?auto_591413 ?auto_591419 ) ) ( not ( = ?auto_591413 ?auto_591420 ) ) ( not ( = ?auto_591414 ?auto_591415 ) ) ( not ( = ?auto_591414 ?auto_591416 ) ) ( not ( = ?auto_591414 ?auto_591417 ) ) ( not ( = ?auto_591414 ?auto_591418 ) ) ( not ( = ?auto_591414 ?auto_591419 ) ) ( not ( = ?auto_591414 ?auto_591420 ) ) ( not ( = ?auto_591415 ?auto_591416 ) ) ( not ( = ?auto_591415 ?auto_591417 ) ) ( not ( = ?auto_591415 ?auto_591418 ) ) ( not ( = ?auto_591415 ?auto_591419 ) ) ( not ( = ?auto_591415 ?auto_591420 ) ) ( not ( = ?auto_591416 ?auto_591417 ) ) ( not ( = ?auto_591416 ?auto_591418 ) ) ( not ( = ?auto_591416 ?auto_591419 ) ) ( not ( = ?auto_591416 ?auto_591420 ) ) ( not ( = ?auto_591417 ?auto_591418 ) ) ( not ( = ?auto_591417 ?auto_591419 ) ) ( not ( = ?auto_591417 ?auto_591420 ) ) ( not ( = ?auto_591418 ?auto_591419 ) ) ( not ( = ?auto_591418 ?auto_591420 ) ) ( not ( = ?auto_591419 ?auto_591420 ) ) ( ON ?auto_591418 ?auto_591419 ) ( ON ?auto_591417 ?auto_591418 ) ( CLEAR ?auto_591415 ) ( ON ?auto_591416 ?auto_591417 ) ( CLEAR ?auto_591416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_591411 ?auto_591412 ?auto_591413 ?auto_591414 ?auto_591415 ?auto_591416 )
      ( MAKE-9PILE ?auto_591411 ?auto_591412 ?auto_591413 ?auto_591414 ?auto_591415 ?auto_591416 ?auto_591417 ?auto_591418 ?auto_591419 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591449 - BLOCK
      ?auto_591450 - BLOCK
      ?auto_591451 - BLOCK
      ?auto_591452 - BLOCK
      ?auto_591453 - BLOCK
      ?auto_591454 - BLOCK
      ?auto_591455 - BLOCK
      ?auto_591456 - BLOCK
      ?auto_591457 - BLOCK
    )
    :vars
    (
      ?auto_591458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591457 ?auto_591458 ) ( ON-TABLE ?auto_591449 ) ( ON ?auto_591450 ?auto_591449 ) ( ON ?auto_591451 ?auto_591450 ) ( ON ?auto_591452 ?auto_591451 ) ( not ( = ?auto_591449 ?auto_591450 ) ) ( not ( = ?auto_591449 ?auto_591451 ) ) ( not ( = ?auto_591449 ?auto_591452 ) ) ( not ( = ?auto_591449 ?auto_591453 ) ) ( not ( = ?auto_591449 ?auto_591454 ) ) ( not ( = ?auto_591449 ?auto_591455 ) ) ( not ( = ?auto_591449 ?auto_591456 ) ) ( not ( = ?auto_591449 ?auto_591457 ) ) ( not ( = ?auto_591449 ?auto_591458 ) ) ( not ( = ?auto_591450 ?auto_591451 ) ) ( not ( = ?auto_591450 ?auto_591452 ) ) ( not ( = ?auto_591450 ?auto_591453 ) ) ( not ( = ?auto_591450 ?auto_591454 ) ) ( not ( = ?auto_591450 ?auto_591455 ) ) ( not ( = ?auto_591450 ?auto_591456 ) ) ( not ( = ?auto_591450 ?auto_591457 ) ) ( not ( = ?auto_591450 ?auto_591458 ) ) ( not ( = ?auto_591451 ?auto_591452 ) ) ( not ( = ?auto_591451 ?auto_591453 ) ) ( not ( = ?auto_591451 ?auto_591454 ) ) ( not ( = ?auto_591451 ?auto_591455 ) ) ( not ( = ?auto_591451 ?auto_591456 ) ) ( not ( = ?auto_591451 ?auto_591457 ) ) ( not ( = ?auto_591451 ?auto_591458 ) ) ( not ( = ?auto_591452 ?auto_591453 ) ) ( not ( = ?auto_591452 ?auto_591454 ) ) ( not ( = ?auto_591452 ?auto_591455 ) ) ( not ( = ?auto_591452 ?auto_591456 ) ) ( not ( = ?auto_591452 ?auto_591457 ) ) ( not ( = ?auto_591452 ?auto_591458 ) ) ( not ( = ?auto_591453 ?auto_591454 ) ) ( not ( = ?auto_591453 ?auto_591455 ) ) ( not ( = ?auto_591453 ?auto_591456 ) ) ( not ( = ?auto_591453 ?auto_591457 ) ) ( not ( = ?auto_591453 ?auto_591458 ) ) ( not ( = ?auto_591454 ?auto_591455 ) ) ( not ( = ?auto_591454 ?auto_591456 ) ) ( not ( = ?auto_591454 ?auto_591457 ) ) ( not ( = ?auto_591454 ?auto_591458 ) ) ( not ( = ?auto_591455 ?auto_591456 ) ) ( not ( = ?auto_591455 ?auto_591457 ) ) ( not ( = ?auto_591455 ?auto_591458 ) ) ( not ( = ?auto_591456 ?auto_591457 ) ) ( not ( = ?auto_591456 ?auto_591458 ) ) ( not ( = ?auto_591457 ?auto_591458 ) ) ( ON ?auto_591456 ?auto_591457 ) ( ON ?auto_591455 ?auto_591456 ) ( ON ?auto_591454 ?auto_591455 ) ( CLEAR ?auto_591452 ) ( ON ?auto_591453 ?auto_591454 ) ( CLEAR ?auto_591453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_591449 ?auto_591450 ?auto_591451 ?auto_591452 ?auto_591453 )
      ( MAKE-9PILE ?auto_591449 ?auto_591450 ?auto_591451 ?auto_591452 ?auto_591453 ?auto_591454 ?auto_591455 ?auto_591456 ?auto_591457 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591487 - BLOCK
      ?auto_591488 - BLOCK
      ?auto_591489 - BLOCK
      ?auto_591490 - BLOCK
      ?auto_591491 - BLOCK
      ?auto_591492 - BLOCK
      ?auto_591493 - BLOCK
      ?auto_591494 - BLOCK
      ?auto_591495 - BLOCK
    )
    :vars
    (
      ?auto_591496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591495 ?auto_591496 ) ( ON-TABLE ?auto_591487 ) ( ON ?auto_591488 ?auto_591487 ) ( ON ?auto_591489 ?auto_591488 ) ( not ( = ?auto_591487 ?auto_591488 ) ) ( not ( = ?auto_591487 ?auto_591489 ) ) ( not ( = ?auto_591487 ?auto_591490 ) ) ( not ( = ?auto_591487 ?auto_591491 ) ) ( not ( = ?auto_591487 ?auto_591492 ) ) ( not ( = ?auto_591487 ?auto_591493 ) ) ( not ( = ?auto_591487 ?auto_591494 ) ) ( not ( = ?auto_591487 ?auto_591495 ) ) ( not ( = ?auto_591487 ?auto_591496 ) ) ( not ( = ?auto_591488 ?auto_591489 ) ) ( not ( = ?auto_591488 ?auto_591490 ) ) ( not ( = ?auto_591488 ?auto_591491 ) ) ( not ( = ?auto_591488 ?auto_591492 ) ) ( not ( = ?auto_591488 ?auto_591493 ) ) ( not ( = ?auto_591488 ?auto_591494 ) ) ( not ( = ?auto_591488 ?auto_591495 ) ) ( not ( = ?auto_591488 ?auto_591496 ) ) ( not ( = ?auto_591489 ?auto_591490 ) ) ( not ( = ?auto_591489 ?auto_591491 ) ) ( not ( = ?auto_591489 ?auto_591492 ) ) ( not ( = ?auto_591489 ?auto_591493 ) ) ( not ( = ?auto_591489 ?auto_591494 ) ) ( not ( = ?auto_591489 ?auto_591495 ) ) ( not ( = ?auto_591489 ?auto_591496 ) ) ( not ( = ?auto_591490 ?auto_591491 ) ) ( not ( = ?auto_591490 ?auto_591492 ) ) ( not ( = ?auto_591490 ?auto_591493 ) ) ( not ( = ?auto_591490 ?auto_591494 ) ) ( not ( = ?auto_591490 ?auto_591495 ) ) ( not ( = ?auto_591490 ?auto_591496 ) ) ( not ( = ?auto_591491 ?auto_591492 ) ) ( not ( = ?auto_591491 ?auto_591493 ) ) ( not ( = ?auto_591491 ?auto_591494 ) ) ( not ( = ?auto_591491 ?auto_591495 ) ) ( not ( = ?auto_591491 ?auto_591496 ) ) ( not ( = ?auto_591492 ?auto_591493 ) ) ( not ( = ?auto_591492 ?auto_591494 ) ) ( not ( = ?auto_591492 ?auto_591495 ) ) ( not ( = ?auto_591492 ?auto_591496 ) ) ( not ( = ?auto_591493 ?auto_591494 ) ) ( not ( = ?auto_591493 ?auto_591495 ) ) ( not ( = ?auto_591493 ?auto_591496 ) ) ( not ( = ?auto_591494 ?auto_591495 ) ) ( not ( = ?auto_591494 ?auto_591496 ) ) ( not ( = ?auto_591495 ?auto_591496 ) ) ( ON ?auto_591494 ?auto_591495 ) ( ON ?auto_591493 ?auto_591494 ) ( ON ?auto_591492 ?auto_591493 ) ( ON ?auto_591491 ?auto_591492 ) ( CLEAR ?auto_591489 ) ( ON ?auto_591490 ?auto_591491 ) ( CLEAR ?auto_591490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_591487 ?auto_591488 ?auto_591489 ?auto_591490 )
      ( MAKE-9PILE ?auto_591487 ?auto_591488 ?auto_591489 ?auto_591490 ?auto_591491 ?auto_591492 ?auto_591493 ?auto_591494 ?auto_591495 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591525 - BLOCK
      ?auto_591526 - BLOCK
      ?auto_591527 - BLOCK
      ?auto_591528 - BLOCK
      ?auto_591529 - BLOCK
      ?auto_591530 - BLOCK
      ?auto_591531 - BLOCK
      ?auto_591532 - BLOCK
      ?auto_591533 - BLOCK
    )
    :vars
    (
      ?auto_591534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591533 ?auto_591534 ) ( ON-TABLE ?auto_591525 ) ( ON ?auto_591526 ?auto_591525 ) ( not ( = ?auto_591525 ?auto_591526 ) ) ( not ( = ?auto_591525 ?auto_591527 ) ) ( not ( = ?auto_591525 ?auto_591528 ) ) ( not ( = ?auto_591525 ?auto_591529 ) ) ( not ( = ?auto_591525 ?auto_591530 ) ) ( not ( = ?auto_591525 ?auto_591531 ) ) ( not ( = ?auto_591525 ?auto_591532 ) ) ( not ( = ?auto_591525 ?auto_591533 ) ) ( not ( = ?auto_591525 ?auto_591534 ) ) ( not ( = ?auto_591526 ?auto_591527 ) ) ( not ( = ?auto_591526 ?auto_591528 ) ) ( not ( = ?auto_591526 ?auto_591529 ) ) ( not ( = ?auto_591526 ?auto_591530 ) ) ( not ( = ?auto_591526 ?auto_591531 ) ) ( not ( = ?auto_591526 ?auto_591532 ) ) ( not ( = ?auto_591526 ?auto_591533 ) ) ( not ( = ?auto_591526 ?auto_591534 ) ) ( not ( = ?auto_591527 ?auto_591528 ) ) ( not ( = ?auto_591527 ?auto_591529 ) ) ( not ( = ?auto_591527 ?auto_591530 ) ) ( not ( = ?auto_591527 ?auto_591531 ) ) ( not ( = ?auto_591527 ?auto_591532 ) ) ( not ( = ?auto_591527 ?auto_591533 ) ) ( not ( = ?auto_591527 ?auto_591534 ) ) ( not ( = ?auto_591528 ?auto_591529 ) ) ( not ( = ?auto_591528 ?auto_591530 ) ) ( not ( = ?auto_591528 ?auto_591531 ) ) ( not ( = ?auto_591528 ?auto_591532 ) ) ( not ( = ?auto_591528 ?auto_591533 ) ) ( not ( = ?auto_591528 ?auto_591534 ) ) ( not ( = ?auto_591529 ?auto_591530 ) ) ( not ( = ?auto_591529 ?auto_591531 ) ) ( not ( = ?auto_591529 ?auto_591532 ) ) ( not ( = ?auto_591529 ?auto_591533 ) ) ( not ( = ?auto_591529 ?auto_591534 ) ) ( not ( = ?auto_591530 ?auto_591531 ) ) ( not ( = ?auto_591530 ?auto_591532 ) ) ( not ( = ?auto_591530 ?auto_591533 ) ) ( not ( = ?auto_591530 ?auto_591534 ) ) ( not ( = ?auto_591531 ?auto_591532 ) ) ( not ( = ?auto_591531 ?auto_591533 ) ) ( not ( = ?auto_591531 ?auto_591534 ) ) ( not ( = ?auto_591532 ?auto_591533 ) ) ( not ( = ?auto_591532 ?auto_591534 ) ) ( not ( = ?auto_591533 ?auto_591534 ) ) ( ON ?auto_591532 ?auto_591533 ) ( ON ?auto_591531 ?auto_591532 ) ( ON ?auto_591530 ?auto_591531 ) ( ON ?auto_591529 ?auto_591530 ) ( ON ?auto_591528 ?auto_591529 ) ( CLEAR ?auto_591526 ) ( ON ?auto_591527 ?auto_591528 ) ( CLEAR ?auto_591527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_591525 ?auto_591526 ?auto_591527 )
      ( MAKE-9PILE ?auto_591525 ?auto_591526 ?auto_591527 ?auto_591528 ?auto_591529 ?auto_591530 ?auto_591531 ?auto_591532 ?auto_591533 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591563 - BLOCK
      ?auto_591564 - BLOCK
      ?auto_591565 - BLOCK
      ?auto_591566 - BLOCK
      ?auto_591567 - BLOCK
      ?auto_591568 - BLOCK
      ?auto_591569 - BLOCK
      ?auto_591570 - BLOCK
      ?auto_591571 - BLOCK
    )
    :vars
    (
      ?auto_591572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591571 ?auto_591572 ) ( ON-TABLE ?auto_591563 ) ( not ( = ?auto_591563 ?auto_591564 ) ) ( not ( = ?auto_591563 ?auto_591565 ) ) ( not ( = ?auto_591563 ?auto_591566 ) ) ( not ( = ?auto_591563 ?auto_591567 ) ) ( not ( = ?auto_591563 ?auto_591568 ) ) ( not ( = ?auto_591563 ?auto_591569 ) ) ( not ( = ?auto_591563 ?auto_591570 ) ) ( not ( = ?auto_591563 ?auto_591571 ) ) ( not ( = ?auto_591563 ?auto_591572 ) ) ( not ( = ?auto_591564 ?auto_591565 ) ) ( not ( = ?auto_591564 ?auto_591566 ) ) ( not ( = ?auto_591564 ?auto_591567 ) ) ( not ( = ?auto_591564 ?auto_591568 ) ) ( not ( = ?auto_591564 ?auto_591569 ) ) ( not ( = ?auto_591564 ?auto_591570 ) ) ( not ( = ?auto_591564 ?auto_591571 ) ) ( not ( = ?auto_591564 ?auto_591572 ) ) ( not ( = ?auto_591565 ?auto_591566 ) ) ( not ( = ?auto_591565 ?auto_591567 ) ) ( not ( = ?auto_591565 ?auto_591568 ) ) ( not ( = ?auto_591565 ?auto_591569 ) ) ( not ( = ?auto_591565 ?auto_591570 ) ) ( not ( = ?auto_591565 ?auto_591571 ) ) ( not ( = ?auto_591565 ?auto_591572 ) ) ( not ( = ?auto_591566 ?auto_591567 ) ) ( not ( = ?auto_591566 ?auto_591568 ) ) ( not ( = ?auto_591566 ?auto_591569 ) ) ( not ( = ?auto_591566 ?auto_591570 ) ) ( not ( = ?auto_591566 ?auto_591571 ) ) ( not ( = ?auto_591566 ?auto_591572 ) ) ( not ( = ?auto_591567 ?auto_591568 ) ) ( not ( = ?auto_591567 ?auto_591569 ) ) ( not ( = ?auto_591567 ?auto_591570 ) ) ( not ( = ?auto_591567 ?auto_591571 ) ) ( not ( = ?auto_591567 ?auto_591572 ) ) ( not ( = ?auto_591568 ?auto_591569 ) ) ( not ( = ?auto_591568 ?auto_591570 ) ) ( not ( = ?auto_591568 ?auto_591571 ) ) ( not ( = ?auto_591568 ?auto_591572 ) ) ( not ( = ?auto_591569 ?auto_591570 ) ) ( not ( = ?auto_591569 ?auto_591571 ) ) ( not ( = ?auto_591569 ?auto_591572 ) ) ( not ( = ?auto_591570 ?auto_591571 ) ) ( not ( = ?auto_591570 ?auto_591572 ) ) ( not ( = ?auto_591571 ?auto_591572 ) ) ( ON ?auto_591570 ?auto_591571 ) ( ON ?auto_591569 ?auto_591570 ) ( ON ?auto_591568 ?auto_591569 ) ( ON ?auto_591567 ?auto_591568 ) ( ON ?auto_591566 ?auto_591567 ) ( ON ?auto_591565 ?auto_591566 ) ( CLEAR ?auto_591563 ) ( ON ?auto_591564 ?auto_591565 ) ( CLEAR ?auto_591564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_591563 ?auto_591564 )
      ( MAKE-9PILE ?auto_591563 ?auto_591564 ?auto_591565 ?auto_591566 ?auto_591567 ?auto_591568 ?auto_591569 ?auto_591570 ?auto_591571 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_591601 - BLOCK
      ?auto_591602 - BLOCK
      ?auto_591603 - BLOCK
      ?auto_591604 - BLOCK
      ?auto_591605 - BLOCK
      ?auto_591606 - BLOCK
      ?auto_591607 - BLOCK
      ?auto_591608 - BLOCK
      ?auto_591609 - BLOCK
    )
    :vars
    (
      ?auto_591610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591609 ?auto_591610 ) ( not ( = ?auto_591601 ?auto_591602 ) ) ( not ( = ?auto_591601 ?auto_591603 ) ) ( not ( = ?auto_591601 ?auto_591604 ) ) ( not ( = ?auto_591601 ?auto_591605 ) ) ( not ( = ?auto_591601 ?auto_591606 ) ) ( not ( = ?auto_591601 ?auto_591607 ) ) ( not ( = ?auto_591601 ?auto_591608 ) ) ( not ( = ?auto_591601 ?auto_591609 ) ) ( not ( = ?auto_591601 ?auto_591610 ) ) ( not ( = ?auto_591602 ?auto_591603 ) ) ( not ( = ?auto_591602 ?auto_591604 ) ) ( not ( = ?auto_591602 ?auto_591605 ) ) ( not ( = ?auto_591602 ?auto_591606 ) ) ( not ( = ?auto_591602 ?auto_591607 ) ) ( not ( = ?auto_591602 ?auto_591608 ) ) ( not ( = ?auto_591602 ?auto_591609 ) ) ( not ( = ?auto_591602 ?auto_591610 ) ) ( not ( = ?auto_591603 ?auto_591604 ) ) ( not ( = ?auto_591603 ?auto_591605 ) ) ( not ( = ?auto_591603 ?auto_591606 ) ) ( not ( = ?auto_591603 ?auto_591607 ) ) ( not ( = ?auto_591603 ?auto_591608 ) ) ( not ( = ?auto_591603 ?auto_591609 ) ) ( not ( = ?auto_591603 ?auto_591610 ) ) ( not ( = ?auto_591604 ?auto_591605 ) ) ( not ( = ?auto_591604 ?auto_591606 ) ) ( not ( = ?auto_591604 ?auto_591607 ) ) ( not ( = ?auto_591604 ?auto_591608 ) ) ( not ( = ?auto_591604 ?auto_591609 ) ) ( not ( = ?auto_591604 ?auto_591610 ) ) ( not ( = ?auto_591605 ?auto_591606 ) ) ( not ( = ?auto_591605 ?auto_591607 ) ) ( not ( = ?auto_591605 ?auto_591608 ) ) ( not ( = ?auto_591605 ?auto_591609 ) ) ( not ( = ?auto_591605 ?auto_591610 ) ) ( not ( = ?auto_591606 ?auto_591607 ) ) ( not ( = ?auto_591606 ?auto_591608 ) ) ( not ( = ?auto_591606 ?auto_591609 ) ) ( not ( = ?auto_591606 ?auto_591610 ) ) ( not ( = ?auto_591607 ?auto_591608 ) ) ( not ( = ?auto_591607 ?auto_591609 ) ) ( not ( = ?auto_591607 ?auto_591610 ) ) ( not ( = ?auto_591608 ?auto_591609 ) ) ( not ( = ?auto_591608 ?auto_591610 ) ) ( not ( = ?auto_591609 ?auto_591610 ) ) ( ON ?auto_591608 ?auto_591609 ) ( ON ?auto_591607 ?auto_591608 ) ( ON ?auto_591606 ?auto_591607 ) ( ON ?auto_591605 ?auto_591606 ) ( ON ?auto_591604 ?auto_591605 ) ( ON ?auto_591603 ?auto_591604 ) ( ON ?auto_591602 ?auto_591603 ) ( ON ?auto_591601 ?auto_591602 ) ( CLEAR ?auto_591601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_591601 )
      ( MAKE-9PILE ?auto_591601 ?auto_591602 ?auto_591603 ?auto_591604 ?auto_591605 ?auto_591606 ?auto_591607 ?auto_591608 ?auto_591609 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591640 - BLOCK
      ?auto_591641 - BLOCK
      ?auto_591642 - BLOCK
      ?auto_591643 - BLOCK
      ?auto_591644 - BLOCK
      ?auto_591645 - BLOCK
      ?auto_591646 - BLOCK
      ?auto_591647 - BLOCK
      ?auto_591648 - BLOCK
      ?auto_591649 - BLOCK
    )
    :vars
    (
      ?auto_591650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_591648 ) ( ON ?auto_591649 ?auto_591650 ) ( CLEAR ?auto_591649 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_591640 ) ( ON ?auto_591641 ?auto_591640 ) ( ON ?auto_591642 ?auto_591641 ) ( ON ?auto_591643 ?auto_591642 ) ( ON ?auto_591644 ?auto_591643 ) ( ON ?auto_591645 ?auto_591644 ) ( ON ?auto_591646 ?auto_591645 ) ( ON ?auto_591647 ?auto_591646 ) ( ON ?auto_591648 ?auto_591647 ) ( not ( = ?auto_591640 ?auto_591641 ) ) ( not ( = ?auto_591640 ?auto_591642 ) ) ( not ( = ?auto_591640 ?auto_591643 ) ) ( not ( = ?auto_591640 ?auto_591644 ) ) ( not ( = ?auto_591640 ?auto_591645 ) ) ( not ( = ?auto_591640 ?auto_591646 ) ) ( not ( = ?auto_591640 ?auto_591647 ) ) ( not ( = ?auto_591640 ?auto_591648 ) ) ( not ( = ?auto_591640 ?auto_591649 ) ) ( not ( = ?auto_591640 ?auto_591650 ) ) ( not ( = ?auto_591641 ?auto_591642 ) ) ( not ( = ?auto_591641 ?auto_591643 ) ) ( not ( = ?auto_591641 ?auto_591644 ) ) ( not ( = ?auto_591641 ?auto_591645 ) ) ( not ( = ?auto_591641 ?auto_591646 ) ) ( not ( = ?auto_591641 ?auto_591647 ) ) ( not ( = ?auto_591641 ?auto_591648 ) ) ( not ( = ?auto_591641 ?auto_591649 ) ) ( not ( = ?auto_591641 ?auto_591650 ) ) ( not ( = ?auto_591642 ?auto_591643 ) ) ( not ( = ?auto_591642 ?auto_591644 ) ) ( not ( = ?auto_591642 ?auto_591645 ) ) ( not ( = ?auto_591642 ?auto_591646 ) ) ( not ( = ?auto_591642 ?auto_591647 ) ) ( not ( = ?auto_591642 ?auto_591648 ) ) ( not ( = ?auto_591642 ?auto_591649 ) ) ( not ( = ?auto_591642 ?auto_591650 ) ) ( not ( = ?auto_591643 ?auto_591644 ) ) ( not ( = ?auto_591643 ?auto_591645 ) ) ( not ( = ?auto_591643 ?auto_591646 ) ) ( not ( = ?auto_591643 ?auto_591647 ) ) ( not ( = ?auto_591643 ?auto_591648 ) ) ( not ( = ?auto_591643 ?auto_591649 ) ) ( not ( = ?auto_591643 ?auto_591650 ) ) ( not ( = ?auto_591644 ?auto_591645 ) ) ( not ( = ?auto_591644 ?auto_591646 ) ) ( not ( = ?auto_591644 ?auto_591647 ) ) ( not ( = ?auto_591644 ?auto_591648 ) ) ( not ( = ?auto_591644 ?auto_591649 ) ) ( not ( = ?auto_591644 ?auto_591650 ) ) ( not ( = ?auto_591645 ?auto_591646 ) ) ( not ( = ?auto_591645 ?auto_591647 ) ) ( not ( = ?auto_591645 ?auto_591648 ) ) ( not ( = ?auto_591645 ?auto_591649 ) ) ( not ( = ?auto_591645 ?auto_591650 ) ) ( not ( = ?auto_591646 ?auto_591647 ) ) ( not ( = ?auto_591646 ?auto_591648 ) ) ( not ( = ?auto_591646 ?auto_591649 ) ) ( not ( = ?auto_591646 ?auto_591650 ) ) ( not ( = ?auto_591647 ?auto_591648 ) ) ( not ( = ?auto_591647 ?auto_591649 ) ) ( not ( = ?auto_591647 ?auto_591650 ) ) ( not ( = ?auto_591648 ?auto_591649 ) ) ( not ( = ?auto_591648 ?auto_591650 ) ) ( not ( = ?auto_591649 ?auto_591650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_591649 ?auto_591650 )
      ( !STACK ?auto_591649 ?auto_591648 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591682 - BLOCK
      ?auto_591683 - BLOCK
      ?auto_591684 - BLOCK
      ?auto_591685 - BLOCK
      ?auto_591686 - BLOCK
      ?auto_591687 - BLOCK
      ?auto_591688 - BLOCK
      ?auto_591689 - BLOCK
      ?auto_591690 - BLOCK
      ?auto_591691 - BLOCK
    )
    :vars
    (
      ?auto_591692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591691 ?auto_591692 ) ( ON-TABLE ?auto_591682 ) ( ON ?auto_591683 ?auto_591682 ) ( ON ?auto_591684 ?auto_591683 ) ( ON ?auto_591685 ?auto_591684 ) ( ON ?auto_591686 ?auto_591685 ) ( ON ?auto_591687 ?auto_591686 ) ( ON ?auto_591688 ?auto_591687 ) ( ON ?auto_591689 ?auto_591688 ) ( not ( = ?auto_591682 ?auto_591683 ) ) ( not ( = ?auto_591682 ?auto_591684 ) ) ( not ( = ?auto_591682 ?auto_591685 ) ) ( not ( = ?auto_591682 ?auto_591686 ) ) ( not ( = ?auto_591682 ?auto_591687 ) ) ( not ( = ?auto_591682 ?auto_591688 ) ) ( not ( = ?auto_591682 ?auto_591689 ) ) ( not ( = ?auto_591682 ?auto_591690 ) ) ( not ( = ?auto_591682 ?auto_591691 ) ) ( not ( = ?auto_591682 ?auto_591692 ) ) ( not ( = ?auto_591683 ?auto_591684 ) ) ( not ( = ?auto_591683 ?auto_591685 ) ) ( not ( = ?auto_591683 ?auto_591686 ) ) ( not ( = ?auto_591683 ?auto_591687 ) ) ( not ( = ?auto_591683 ?auto_591688 ) ) ( not ( = ?auto_591683 ?auto_591689 ) ) ( not ( = ?auto_591683 ?auto_591690 ) ) ( not ( = ?auto_591683 ?auto_591691 ) ) ( not ( = ?auto_591683 ?auto_591692 ) ) ( not ( = ?auto_591684 ?auto_591685 ) ) ( not ( = ?auto_591684 ?auto_591686 ) ) ( not ( = ?auto_591684 ?auto_591687 ) ) ( not ( = ?auto_591684 ?auto_591688 ) ) ( not ( = ?auto_591684 ?auto_591689 ) ) ( not ( = ?auto_591684 ?auto_591690 ) ) ( not ( = ?auto_591684 ?auto_591691 ) ) ( not ( = ?auto_591684 ?auto_591692 ) ) ( not ( = ?auto_591685 ?auto_591686 ) ) ( not ( = ?auto_591685 ?auto_591687 ) ) ( not ( = ?auto_591685 ?auto_591688 ) ) ( not ( = ?auto_591685 ?auto_591689 ) ) ( not ( = ?auto_591685 ?auto_591690 ) ) ( not ( = ?auto_591685 ?auto_591691 ) ) ( not ( = ?auto_591685 ?auto_591692 ) ) ( not ( = ?auto_591686 ?auto_591687 ) ) ( not ( = ?auto_591686 ?auto_591688 ) ) ( not ( = ?auto_591686 ?auto_591689 ) ) ( not ( = ?auto_591686 ?auto_591690 ) ) ( not ( = ?auto_591686 ?auto_591691 ) ) ( not ( = ?auto_591686 ?auto_591692 ) ) ( not ( = ?auto_591687 ?auto_591688 ) ) ( not ( = ?auto_591687 ?auto_591689 ) ) ( not ( = ?auto_591687 ?auto_591690 ) ) ( not ( = ?auto_591687 ?auto_591691 ) ) ( not ( = ?auto_591687 ?auto_591692 ) ) ( not ( = ?auto_591688 ?auto_591689 ) ) ( not ( = ?auto_591688 ?auto_591690 ) ) ( not ( = ?auto_591688 ?auto_591691 ) ) ( not ( = ?auto_591688 ?auto_591692 ) ) ( not ( = ?auto_591689 ?auto_591690 ) ) ( not ( = ?auto_591689 ?auto_591691 ) ) ( not ( = ?auto_591689 ?auto_591692 ) ) ( not ( = ?auto_591690 ?auto_591691 ) ) ( not ( = ?auto_591690 ?auto_591692 ) ) ( not ( = ?auto_591691 ?auto_591692 ) ) ( CLEAR ?auto_591689 ) ( ON ?auto_591690 ?auto_591691 ) ( CLEAR ?auto_591690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_591682 ?auto_591683 ?auto_591684 ?auto_591685 ?auto_591686 ?auto_591687 ?auto_591688 ?auto_591689 ?auto_591690 )
      ( MAKE-10PILE ?auto_591682 ?auto_591683 ?auto_591684 ?auto_591685 ?auto_591686 ?auto_591687 ?auto_591688 ?auto_591689 ?auto_591690 ?auto_591691 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591724 - BLOCK
      ?auto_591725 - BLOCK
      ?auto_591726 - BLOCK
      ?auto_591727 - BLOCK
      ?auto_591728 - BLOCK
      ?auto_591729 - BLOCK
      ?auto_591730 - BLOCK
      ?auto_591731 - BLOCK
      ?auto_591732 - BLOCK
      ?auto_591733 - BLOCK
    )
    :vars
    (
      ?auto_591734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591733 ?auto_591734 ) ( ON-TABLE ?auto_591724 ) ( ON ?auto_591725 ?auto_591724 ) ( ON ?auto_591726 ?auto_591725 ) ( ON ?auto_591727 ?auto_591726 ) ( ON ?auto_591728 ?auto_591727 ) ( ON ?auto_591729 ?auto_591728 ) ( ON ?auto_591730 ?auto_591729 ) ( not ( = ?auto_591724 ?auto_591725 ) ) ( not ( = ?auto_591724 ?auto_591726 ) ) ( not ( = ?auto_591724 ?auto_591727 ) ) ( not ( = ?auto_591724 ?auto_591728 ) ) ( not ( = ?auto_591724 ?auto_591729 ) ) ( not ( = ?auto_591724 ?auto_591730 ) ) ( not ( = ?auto_591724 ?auto_591731 ) ) ( not ( = ?auto_591724 ?auto_591732 ) ) ( not ( = ?auto_591724 ?auto_591733 ) ) ( not ( = ?auto_591724 ?auto_591734 ) ) ( not ( = ?auto_591725 ?auto_591726 ) ) ( not ( = ?auto_591725 ?auto_591727 ) ) ( not ( = ?auto_591725 ?auto_591728 ) ) ( not ( = ?auto_591725 ?auto_591729 ) ) ( not ( = ?auto_591725 ?auto_591730 ) ) ( not ( = ?auto_591725 ?auto_591731 ) ) ( not ( = ?auto_591725 ?auto_591732 ) ) ( not ( = ?auto_591725 ?auto_591733 ) ) ( not ( = ?auto_591725 ?auto_591734 ) ) ( not ( = ?auto_591726 ?auto_591727 ) ) ( not ( = ?auto_591726 ?auto_591728 ) ) ( not ( = ?auto_591726 ?auto_591729 ) ) ( not ( = ?auto_591726 ?auto_591730 ) ) ( not ( = ?auto_591726 ?auto_591731 ) ) ( not ( = ?auto_591726 ?auto_591732 ) ) ( not ( = ?auto_591726 ?auto_591733 ) ) ( not ( = ?auto_591726 ?auto_591734 ) ) ( not ( = ?auto_591727 ?auto_591728 ) ) ( not ( = ?auto_591727 ?auto_591729 ) ) ( not ( = ?auto_591727 ?auto_591730 ) ) ( not ( = ?auto_591727 ?auto_591731 ) ) ( not ( = ?auto_591727 ?auto_591732 ) ) ( not ( = ?auto_591727 ?auto_591733 ) ) ( not ( = ?auto_591727 ?auto_591734 ) ) ( not ( = ?auto_591728 ?auto_591729 ) ) ( not ( = ?auto_591728 ?auto_591730 ) ) ( not ( = ?auto_591728 ?auto_591731 ) ) ( not ( = ?auto_591728 ?auto_591732 ) ) ( not ( = ?auto_591728 ?auto_591733 ) ) ( not ( = ?auto_591728 ?auto_591734 ) ) ( not ( = ?auto_591729 ?auto_591730 ) ) ( not ( = ?auto_591729 ?auto_591731 ) ) ( not ( = ?auto_591729 ?auto_591732 ) ) ( not ( = ?auto_591729 ?auto_591733 ) ) ( not ( = ?auto_591729 ?auto_591734 ) ) ( not ( = ?auto_591730 ?auto_591731 ) ) ( not ( = ?auto_591730 ?auto_591732 ) ) ( not ( = ?auto_591730 ?auto_591733 ) ) ( not ( = ?auto_591730 ?auto_591734 ) ) ( not ( = ?auto_591731 ?auto_591732 ) ) ( not ( = ?auto_591731 ?auto_591733 ) ) ( not ( = ?auto_591731 ?auto_591734 ) ) ( not ( = ?auto_591732 ?auto_591733 ) ) ( not ( = ?auto_591732 ?auto_591734 ) ) ( not ( = ?auto_591733 ?auto_591734 ) ) ( ON ?auto_591732 ?auto_591733 ) ( CLEAR ?auto_591730 ) ( ON ?auto_591731 ?auto_591732 ) ( CLEAR ?auto_591731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_591724 ?auto_591725 ?auto_591726 ?auto_591727 ?auto_591728 ?auto_591729 ?auto_591730 ?auto_591731 )
      ( MAKE-10PILE ?auto_591724 ?auto_591725 ?auto_591726 ?auto_591727 ?auto_591728 ?auto_591729 ?auto_591730 ?auto_591731 ?auto_591732 ?auto_591733 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591766 - BLOCK
      ?auto_591767 - BLOCK
      ?auto_591768 - BLOCK
      ?auto_591769 - BLOCK
      ?auto_591770 - BLOCK
      ?auto_591771 - BLOCK
      ?auto_591772 - BLOCK
      ?auto_591773 - BLOCK
      ?auto_591774 - BLOCK
      ?auto_591775 - BLOCK
    )
    :vars
    (
      ?auto_591776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591775 ?auto_591776 ) ( ON-TABLE ?auto_591766 ) ( ON ?auto_591767 ?auto_591766 ) ( ON ?auto_591768 ?auto_591767 ) ( ON ?auto_591769 ?auto_591768 ) ( ON ?auto_591770 ?auto_591769 ) ( ON ?auto_591771 ?auto_591770 ) ( not ( = ?auto_591766 ?auto_591767 ) ) ( not ( = ?auto_591766 ?auto_591768 ) ) ( not ( = ?auto_591766 ?auto_591769 ) ) ( not ( = ?auto_591766 ?auto_591770 ) ) ( not ( = ?auto_591766 ?auto_591771 ) ) ( not ( = ?auto_591766 ?auto_591772 ) ) ( not ( = ?auto_591766 ?auto_591773 ) ) ( not ( = ?auto_591766 ?auto_591774 ) ) ( not ( = ?auto_591766 ?auto_591775 ) ) ( not ( = ?auto_591766 ?auto_591776 ) ) ( not ( = ?auto_591767 ?auto_591768 ) ) ( not ( = ?auto_591767 ?auto_591769 ) ) ( not ( = ?auto_591767 ?auto_591770 ) ) ( not ( = ?auto_591767 ?auto_591771 ) ) ( not ( = ?auto_591767 ?auto_591772 ) ) ( not ( = ?auto_591767 ?auto_591773 ) ) ( not ( = ?auto_591767 ?auto_591774 ) ) ( not ( = ?auto_591767 ?auto_591775 ) ) ( not ( = ?auto_591767 ?auto_591776 ) ) ( not ( = ?auto_591768 ?auto_591769 ) ) ( not ( = ?auto_591768 ?auto_591770 ) ) ( not ( = ?auto_591768 ?auto_591771 ) ) ( not ( = ?auto_591768 ?auto_591772 ) ) ( not ( = ?auto_591768 ?auto_591773 ) ) ( not ( = ?auto_591768 ?auto_591774 ) ) ( not ( = ?auto_591768 ?auto_591775 ) ) ( not ( = ?auto_591768 ?auto_591776 ) ) ( not ( = ?auto_591769 ?auto_591770 ) ) ( not ( = ?auto_591769 ?auto_591771 ) ) ( not ( = ?auto_591769 ?auto_591772 ) ) ( not ( = ?auto_591769 ?auto_591773 ) ) ( not ( = ?auto_591769 ?auto_591774 ) ) ( not ( = ?auto_591769 ?auto_591775 ) ) ( not ( = ?auto_591769 ?auto_591776 ) ) ( not ( = ?auto_591770 ?auto_591771 ) ) ( not ( = ?auto_591770 ?auto_591772 ) ) ( not ( = ?auto_591770 ?auto_591773 ) ) ( not ( = ?auto_591770 ?auto_591774 ) ) ( not ( = ?auto_591770 ?auto_591775 ) ) ( not ( = ?auto_591770 ?auto_591776 ) ) ( not ( = ?auto_591771 ?auto_591772 ) ) ( not ( = ?auto_591771 ?auto_591773 ) ) ( not ( = ?auto_591771 ?auto_591774 ) ) ( not ( = ?auto_591771 ?auto_591775 ) ) ( not ( = ?auto_591771 ?auto_591776 ) ) ( not ( = ?auto_591772 ?auto_591773 ) ) ( not ( = ?auto_591772 ?auto_591774 ) ) ( not ( = ?auto_591772 ?auto_591775 ) ) ( not ( = ?auto_591772 ?auto_591776 ) ) ( not ( = ?auto_591773 ?auto_591774 ) ) ( not ( = ?auto_591773 ?auto_591775 ) ) ( not ( = ?auto_591773 ?auto_591776 ) ) ( not ( = ?auto_591774 ?auto_591775 ) ) ( not ( = ?auto_591774 ?auto_591776 ) ) ( not ( = ?auto_591775 ?auto_591776 ) ) ( ON ?auto_591774 ?auto_591775 ) ( ON ?auto_591773 ?auto_591774 ) ( CLEAR ?auto_591771 ) ( ON ?auto_591772 ?auto_591773 ) ( CLEAR ?auto_591772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_591766 ?auto_591767 ?auto_591768 ?auto_591769 ?auto_591770 ?auto_591771 ?auto_591772 )
      ( MAKE-10PILE ?auto_591766 ?auto_591767 ?auto_591768 ?auto_591769 ?auto_591770 ?auto_591771 ?auto_591772 ?auto_591773 ?auto_591774 ?auto_591775 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591808 - BLOCK
      ?auto_591809 - BLOCK
      ?auto_591810 - BLOCK
      ?auto_591811 - BLOCK
      ?auto_591812 - BLOCK
      ?auto_591813 - BLOCK
      ?auto_591814 - BLOCK
      ?auto_591815 - BLOCK
      ?auto_591816 - BLOCK
      ?auto_591817 - BLOCK
    )
    :vars
    (
      ?auto_591818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591817 ?auto_591818 ) ( ON-TABLE ?auto_591808 ) ( ON ?auto_591809 ?auto_591808 ) ( ON ?auto_591810 ?auto_591809 ) ( ON ?auto_591811 ?auto_591810 ) ( ON ?auto_591812 ?auto_591811 ) ( not ( = ?auto_591808 ?auto_591809 ) ) ( not ( = ?auto_591808 ?auto_591810 ) ) ( not ( = ?auto_591808 ?auto_591811 ) ) ( not ( = ?auto_591808 ?auto_591812 ) ) ( not ( = ?auto_591808 ?auto_591813 ) ) ( not ( = ?auto_591808 ?auto_591814 ) ) ( not ( = ?auto_591808 ?auto_591815 ) ) ( not ( = ?auto_591808 ?auto_591816 ) ) ( not ( = ?auto_591808 ?auto_591817 ) ) ( not ( = ?auto_591808 ?auto_591818 ) ) ( not ( = ?auto_591809 ?auto_591810 ) ) ( not ( = ?auto_591809 ?auto_591811 ) ) ( not ( = ?auto_591809 ?auto_591812 ) ) ( not ( = ?auto_591809 ?auto_591813 ) ) ( not ( = ?auto_591809 ?auto_591814 ) ) ( not ( = ?auto_591809 ?auto_591815 ) ) ( not ( = ?auto_591809 ?auto_591816 ) ) ( not ( = ?auto_591809 ?auto_591817 ) ) ( not ( = ?auto_591809 ?auto_591818 ) ) ( not ( = ?auto_591810 ?auto_591811 ) ) ( not ( = ?auto_591810 ?auto_591812 ) ) ( not ( = ?auto_591810 ?auto_591813 ) ) ( not ( = ?auto_591810 ?auto_591814 ) ) ( not ( = ?auto_591810 ?auto_591815 ) ) ( not ( = ?auto_591810 ?auto_591816 ) ) ( not ( = ?auto_591810 ?auto_591817 ) ) ( not ( = ?auto_591810 ?auto_591818 ) ) ( not ( = ?auto_591811 ?auto_591812 ) ) ( not ( = ?auto_591811 ?auto_591813 ) ) ( not ( = ?auto_591811 ?auto_591814 ) ) ( not ( = ?auto_591811 ?auto_591815 ) ) ( not ( = ?auto_591811 ?auto_591816 ) ) ( not ( = ?auto_591811 ?auto_591817 ) ) ( not ( = ?auto_591811 ?auto_591818 ) ) ( not ( = ?auto_591812 ?auto_591813 ) ) ( not ( = ?auto_591812 ?auto_591814 ) ) ( not ( = ?auto_591812 ?auto_591815 ) ) ( not ( = ?auto_591812 ?auto_591816 ) ) ( not ( = ?auto_591812 ?auto_591817 ) ) ( not ( = ?auto_591812 ?auto_591818 ) ) ( not ( = ?auto_591813 ?auto_591814 ) ) ( not ( = ?auto_591813 ?auto_591815 ) ) ( not ( = ?auto_591813 ?auto_591816 ) ) ( not ( = ?auto_591813 ?auto_591817 ) ) ( not ( = ?auto_591813 ?auto_591818 ) ) ( not ( = ?auto_591814 ?auto_591815 ) ) ( not ( = ?auto_591814 ?auto_591816 ) ) ( not ( = ?auto_591814 ?auto_591817 ) ) ( not ( = ?auto_591814 ?auto_591818 ) ) ( not ( = ?auto_591815 ?auto_591816 ) ) ( not ( = ?auto_591815 ?auto_591817 ) ) ( not ( = ?auto_591815 ?auto_591818 ) ) ( not ( = ?auto_591816 ?auto_591817 ) ) ( not ( = ?auto_591816 ?auto_591818 ) ) ( not ( = ?auto_591817 ?auto_591818 ) ) ( ON ?auto_591816 ?auto_591817 ) ( ON ?auto_591815 ?auto_591816 ) ( ON ?auto_591814 ?auto_591815 ) ( CLEAR ?auto_591812 ) ( ON ?auto_591813 ?auto_591814 ) ( CLEAR ?auto_591813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_591808 ?auto_591809 ?auto_591810 ?auto_591811 ?auto_591812 ?auto_591813 )
      ( MAKE-10PILE ?auto_591808 ?auto_591809 ?auto_591810 ?auto_591811 ?auto_591812 ?auto_591813 ?auto_591814 ?auto_591815 ?auto_591816 ?auto_591817 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591850 - BLOCK
      ?auto_591851 - BLOCK
      ?auto_591852 - BLOCK
      ?auto_591853 - BLOCK
      ?auto_591854 - BLOCK
      ?auto_591855 - BLOCK
      ?auto_591856 - BLOCK
      ?auto_591857 - BLOCK
      ?auto_591858 - BLOCK
      ?auto_591859 - BLOCK
    )
    :vars
    (
      ?auto_591860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591859 ?auto_591860 ) ( ON-TABLE ?auto_591850 ) ( ON ?auto_591851 ?auto_591850 ) ( ON ?auto_591852 ?auto_591851 ) ( ON ?auto_591853 ?auto_591852 ) ( not ( = ?auto_591850 ?auto_591851 ) ) ( not ( = ?auto_591850 ?auto_591852 ) ) ( not ( = ?auto_591850 ?auto_591853 ) ) ( not ( = ?auto_591850 ?auto_591854 ) ) ( not ( = ?auto_591850 ?auto_591855 ) ) ( not ( = ?auto_591850 ?auto_591856 ) ) ( not ( = ?auto_591850 ?auto_591857 ) ) ( not ( = ?auto_591850 ?auto_591858 ) ) ( not ( = ?auto_591850 ?auto_591859 ) ) ( not ( = ?auto_591850 ?auto_591860 ) ) ( not ( = ?auto_591851 ?auto_591852 ) ) ( not ( = ?auto_591851 ?auto_591853 ) ) ( not ( = ?auto_591851 ?auto_591854 ) ) ( not ( = ?auto_591851 ?auto_591855 ) ) ( not ( = ?auto_591851 ?auto_591856 ) ) ( not ( = ?auto_591851 ?auto_591857 ) ) ( not ( = ?auto_591851 ?auto_591858 ) ) ( not ( = ?auto_591851 ?auto_591859 ) ) ( not ( = ?auto_591851 ?auto_591860 ) ) ( not ( = ?auto_591852 ?auto_591853 ) ) ( not ( = ?auto_591852 ?auto_591854 ) ) ( not ( = ?auto_591852 ?auto_591855 ) ) ( not ( = ?auto_591852 ?auto_591856 ) ) ( not ( = ?auto_591852 ?auto_591857 ) ) ( not ( = ?auto_591852 ?auto_591858 ) ) ( not ( = ?auto_591852 ?auto_591859 ) ) ( not ( = ?auto_591852 ?auto_591860 ) ) ( not ( = ?auto_591853 ?auto_591854 ) ) ( not ( = ?auto_591853 ?auto_591855 ) ) ( not ( = ?auto_591853 ?auto_591856 ) ) ( not ( = ?auto_591853 ?auto_591857 ) ) ( not ( = ?auto_591853 ?auto_591858 ) ) ( not ( = ?auto_591853 ?auto_591859 ) ) ( not ( = ?auto_591853 ?auto_591860 ) ) ( not ( = ?auto_591854 ?auto_591855 ) ) ( not ( = ?auto_591854 ?auto_591856 ) ) ( not ( = ?auto_591854 ?auto_591857 ) ) ( not ( = ?auto_591854 ?auto_591858 ) ) ( not ( = ?auto_591854 ?auto_591859 ) ) ( not ( = ?auto_591854 ?auto_591860 ) ) ( not ( = ?auto_591855 ?auto_591856 ) ) ( not ( = ?auto_591855 ?auto_591857 ) ) ( not ( = ?auto_591855 ?auto_591858 ) ) ( not ( = ?auto_591855 ?auto_591859 ) ) ( not ( = ?auto_591855 ?auto_591860 ) ) ( not ( = ?auto_591856 ?auto_591857 ) ) ( not ( = ?auto_591856 ?auto_591858 ) ) ( not ( = ?auto_591856 ?auto_591859 ) ) ( not ( = ?auto_591856 ?auto_591860 ) ) ( not ( = ?auto_591857 ?auto_591858 ) ) ( not ( = ?auto_591857 ?auto_591859 ) ) ( not ( = ?auto_591857 ?auto_591860 ) ) ( not ( = ?auto_591858 ?auto_591859 ) ) ( not ( = ?auto_591858 ?auto_591860 ) ) ( not ( = ?auto_591859 ?auto_591860 ) ) ( ON ?auto_591858 ?auto_591859 ) ( ON ?auto_591857 ?auto_591858 ) ( ON ?auto_591856 ?auto_591857 ) ( ON ?auto_591855 ?auto_591856 ) ( CLEAR ?auto_591853 ) ( ON ?auto_591854 ?auto_591855 ) ( CLEAR ?auto_591854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_591850 ?auto_591851 ?auto_591852 ?auto_591853 ?auto_591854 )
      ( MAKE-10PILE ?auto_591850 ?auto_591851 ?auto_591852 ?auto_591853 ?auto_591854 ?auto_591855 ?auto_591856 ?auto_591857 ?auto_591858 ?auto_591859 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591892 - BLOCK
      ?auto_591893 - BLOCK
      ?auto_591894 - BLOCK
      ?auto_591895 - BLOCK
      ?auto_591896 - BLOCK
      ?auto_591897 - BLOCK
      ?auto_591898 - BLOCK
      ?auto_591899 - BLOCK
      ?auto_591900 - BLOCK
      ?auto_591901 - BLOCK
    )
    :vars
    (
      ?auto_591902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591901 ?auto_591902 ) ( ON-TABLE ?auto_591892 ) ( ON ?auto_591893 ?auto_591892 ) ( ON ?auto_591894 ?auto_591893 ) ( not ( = ?auto_591892 ?auto_591893 ) ) ( not ( = ?auto_591892 ?auto_591894 ) ) ( not ( = ?auto_591892 ?auto_591895 ) ) ( not ( = ?auto_591892 ?auto_591896 ) ) ( not ( = ?auto_591892 ?auto_591897 ) ) ( not ( = ?auto_591892 ?auto_591898 ) ) ( not ( = ?auto_591892 ?auto_591899 ) ) ( not ( = ?auto_591892 ?auto_591900 ) ) ( not ( = ?auto_591892 ?auto_591901 ) ) ( not ( = ?auto_591892 ?auto_591902 ) ) ( not ( = ?auto_591893 ?auto_591894 ) ) ( not ( = ?auto_591893 ?auto_591895 ) ) ( not ( = ?auto_591893 ?auto_591896 ) ) ( not ( = ?auto_591893 ?auto_591897 ) ) ( not ( = ?auto_591893 ?auto_591898 ) ) ( not ( = ?auto_591893 ?auto_591899 ) ) ( not ( = ?auto_591893 ?auto_591900 ) ) ( not ( = ?auto_591893 ?auto_591901 ) ) ( not ( = ?auto_591893 ?auto_591902 ) ) ( not ( = ?auto_591894 ?auto_591895 ) ) ( not ( = ?auto_591894 ?auto_591896 ) ) ( not ( = ?auto_591894 ?auto_591897 ) ) ( not ( = ?auto_591894 ?auto_591898 ) ) ( not ( = ?auto_591894 ?auto_591899 ) ) ( not ( = ?auto_591894 ?auto_591900 ) ) ( not ( = ?auto_591894 ?auto_591901 ) ) ( not ( = ?auto_591894 ?auto_591902 ) ) ( not ( = ?auto_591895 ?auto_591896 ) ) ( not ( = ?auto_591895 ?auto_591897 ) ) ( not ( = ?auto_591895 ?auto_591898 ) ) ( not ( = ?auto_591895 ?auto_591899 ) ) ( not ( = ?auto_591895 ?auto_591900 ) ) ( not ( = ?auto_591895 ?auto_591901 ) ) ( not ( = ?auto_591895 ?auto_591902 ) ) ( not ( = ?auto_591896 ?auto_591897 ) ) ( not ( = ?auto_591896 ?auto_591898 ) ) ( not ( = ?auto_591896 ?auto_591899 ) ) ( not ( = ?auto_591896 ?auto_591900 ) ) ( not ( = ?auto_591896 ?auto_591901 ) ) ( not ( = ?auto_591896 ?auto_591902 ) ) ( not ( = ?auto_591897 ?auto_591898 ) ) ( not ( = ?auto_591897 ?auto_591899 ) ) ( not ( = ?auto_591897 ?auto_591900 ) ) ( not ( = ?auto_591897 ?auto_591901 ) ) ( not ( = ?auto_591897 ?auto_591902 ) ) ( not ( = ?auto_591898 ?auto_591899 ) ) ( not ( = ?auto_591898 ?auto_591900 ) ) ( not ( = ?auto_591898 ?auto_591901 ) ) ( not ( = ?auto_591898 ?auto_591902 ) ) ( not ( = ?auto_591899 ?auto_591900 ) ) ( not ( = ?auto_591899 ?auto_591901 ) ) ( not ( = ?auto_591899 ?auto_591902 ) ) ( not ( = ?auto_591900 ?auto_591901 ) ) ( not ( = ?auto_591900 ?auto_591902 ) ) ( not ( = ?auto_591901 ?auto_591902 ) ) ( ON ?auto_591900 ?auto_591901 ) ( ON ?auto_591899 ?auto_591900 ) ( ON ?auto_591898 ?auto_591899 ) ( ON ?auto_591897 ?auto_591898 ) ( ON ?auto_591896 ?auto_591897 ) ( CLEAR ?auto_591894 ) ( ON ?auto_591895 ?auto_591896 ) ( CLEAR ?auto_591895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_591892 ?auto_591893 ?auto_591894 ?auto_591895 )
      ( MAKE-10PILE ?auto_591892 ?auto_591893 ?auto_591894 ?auto_591895 ?auto_591896 ?auto_591897 ?auto_591898 ?auto_591899 ?auto_591900 ?auto_591901 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591934 - BLOCK
      ?auto_591935 - BLOCK
      ?auto_591936 - BLOCK
      ?auto_591937 - BLOCK
      ?auto_591938 - BLOCK
      ?auto_591939 - BLOCK
      ?auto_591940 - BLOCK
      ?auto_591941 - BLOCK
      ?auto_591942 - BLOCK
      ?auto_591943 - BLOCK
    )
    :vars
    (
      ?auto_591944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591943 ?auto_591944 ) ( ON-TABLE ?auto_591934 ) ( ON ?auto_591935 ?auto_591934 ) ( not ( = ?auto_591934 ?auto_591935 ) ) ( not ( = ?auto_591934 ?auto_591936 ) ) ( not ( = ?auto_591934 ?auto_591937 ) ) ( not ( = ?auto_591934 ?auto_591938 ) ) ( not ( = ?auto_591934 ?auto_591939 ) ) ( not ( = ?auto_591934 ?auto_591940 ) ) ( not ( = ?auto_591934 ?auto_591941 ) ) ( not ( = ?auto_591934 ?auto_591942 ) ) ( not ( = ?auto_591934 ?auto_591943 ) ) ( not ( = ?auto_591934 ?auto_591944 ) ) ( not ( = ?auto_591935 ?auto_591936 ) ) ( not ( = ?auto_591935 ?auto_591937 ) ) ( not ( = ?auto_591935 ?auto_591938 ) ) ( not ( = ?auto_591935 ?auto_591939 ) ) ( not ( = ?auto_591935 ?auto_591940 ) ) ( not ( = ?auto_591935 ?auto_591941 ) ) ( not ( = ?auto_591935 ?auto_591942 ) ) ( not ( = ?auto_591935 ?auto_591943 ) ) ( not ( = ?auto_591935 ?auto_591944 ) ) ( not ( = ?auto_591936 ?auto_591937 ) ) ( not ( = ?auto_591936 ?auto_591938 ) ) ( not ( = ?auto_591936 ?auto_591939 ) ) ( not ( = ?auto_591936 ?auto_591940 ) ) ( not ( = ?auto_591936 ?auto_591941 ) ) ( not ( = ?auto_591936 ?auto_591942 ) ) ( not ( = ?auto_591936 ?auto_591943 ) ) ( not ( = ?auto_591936 ?auto_591944 ) ) ( not ( = ?auto_591937 ?auto_591938 ) ) ( not ( = ?auto_591937 ?auto_591939 ) ) ( not ( = ?auto_591937 ?auto_591940 ) ) ( not ( = ?auto_591937 ?auto_591941 ) ) ( not ( = ?auto_591937 ?auto_591942 ) ) ( not ( = ?auto_591937 ?auto_591943 ) ) ( not ( = ?auto_591937 ?auto_591944 ) ) ( not ( = ?auto_591938 ?auto_591939 ) ) ( not ( = ?auto_591938 ?auto_591940 ) ) ( not ( = ?auto_591938 ?auto_591941 ) ) ( not ( = ?auto_591938 ?auto_591942 ) ) ( not ( = ?auto_591938 ?auto_591943 ) ) ( not ( = ?auto_591938 ?auto_591944 ) ) ( not ( = ?auto_591939 ?auto_591940 ) ) ( not ( = ?auto_591939 ?auto_591941 ) ) ( not ( = ?auto_591939 ?auto_591942 ) ) ( not ( = ?auto_591939 ?auto_591943 ) ) ( not ( = ?auto_591939 ?auto_591944 ) ) ( not ( = ?auto_591940 ?auto_591941 ) ) ( not ( = ?auto_591940 ?auto_591942 ) ) ( not ( = ?auto_591940 ?auto_591943 ) ) ( not ( = ?auto_591940 ?auto_591944 ) ) ( not ( = ?auto_591941 ?auto_591942 ) ) ( not ( = ?auto_591941 ?auto_591943 ) ) ( not ( = ?auto_591941 ?auto_591944 ) ) ( not ( = ?auto_591942 ?auto_591943 ) ) ( not ( = ?auto_591942 ?auto_591944 ) ) ( not ( = ?auto_591943 ?auto_591944 ) ) ( ON ?auto_591942 ?auto_591943 ) ( ON ?auto_591941 ?auto_591942 ) ( ON ?auto_591940 ?auto_591941 ) ( ON ?auto_591939 ?auto_591940 ) ( ON ?auto_591938 ?auto_591939 ) ( ON ?auto_591937 ?auto_591938 ) ( CLEAR ?auto_591935 ) ( ON ?auto_591936 ?auto_591937 ) ( CLEAR ?auto_591936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_591934 ?auto_591935 ?auto_591936 )
      ( MAKE-10PILE ?auto_591934 ?auto_591935 ?auto_591936 ?auto_591937 ?auto_591938 ?auto_591939 ?auto_591940 ?auto_591941 ?auto_591942 ?auto_591943 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_591976 - BLOCK
      ?auto_591977 - BLOCK
      ?auto_591978 - BLOCK
      ?auto_591979 - BLOCK
      ?auto_591980 - BLOCK
      ?auto_591981 - BLOCK
      ?auto_591982 - BLOCK
      ?auto_591983 - BLOCK
      ?auto_591984 - BLOCK
      ?auto_591985 - BLOCK
    )
    :vars
    (
      ?auto_591986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_591985 ?auto_591986 ) ( ON-TABLE ?auto_591976 ) ( not ( = ?auto_591976 ?auto_591977 ) ) ( not ( = ?auto_591976 ?auto_591978 ) ) ( not ( = ?auto_591976 ?auto_591979 ) ) ( not ( = ?auto_591976 ?auto_591980 ) ) ( not ( = ?auto_591976 ?auto_591981 ) ) ( not ( = ?auto_591976 ?auto_591982 ) ) ( not ( = ?auto_591976 ?auto_591983 ) ) ( not ( = ?auto_591976 ?auto_591984 ) ) ( not ( = ?auto_591976 ?auto_591985 ) ) ( not ( = ?auto_591976 ?auto_591986 ) ) ( not ( = ?auto_591977 ?auto_591978 ) ) ( not ( = ?auto_591977 ?auto_591979 ) ) ( not ( = ?auto_591977 ?auto_591980 ) ) ( not ( = ?auto_591977 ?auto_591981 ) ) ( not ( = ?auto_591977 ?auto_591982 ) ) ( not ( = ?auto_591977 ?auto_591983 ) ) ( not ( = ?auto_591977 ?auto_591984 ) ) ( not ( = ?auto_591977 ?auto_591985 ) ) ( not ( = ?auto_591977 ?auto_591986 ) ) ( not ( = ?auto_591978 ?auto_591979 ) ) ( not ( = ?auto_591978 ?auto_591980 ) ) ( not ( = ?auto_591978 ?auto_591981 ) ) ( not ( = ?auto_591978 ?auto_591982 ) ) ( not ( = ?auto_591978 ?auto_591983 ) ) ( not ( = ?auto_591978 ?auto_591984 ) ) ( not ( = ?auto_591978 ?auto_591985 ) ) ( not ( = ?auto_591978 ?auto_591986 ) ) ( not ( = ?auto_591979 ?auto_591980 ) ) ( not ( = ?auto_591979 ?auto_591981 ) ) ( not ( = ?auto_591979 ?auto_591982 ) ) ( not ( = ?auto_591979 ?auto_591983 ) ) ( not ( = ?auto_591979 ?auto_591984 ) ) ( not ( = ?auto_591979 ?auto_591985 ) ) ( not ( = ?auto_591979 ?auto_591986 ) ) ( not ( = ?auto_591980 ?auto_591981 ) ) ( not ( = ?auto_591980 ?auto_591982 ) ) ( not ( = ?auto_591980 ?auto_591983 ) ) ( not ( = ?auto_591980 ?auto_591984 ) ) ( not ( = ?auto_591980 ?auto_591985 ) ) ( not ( = ?auto_591980 ?auto_591986 ) ) ( not ( = ?auto_591981 ?auto_591982 ) ) ( not ( = ?auto_591981 ?auto_591983 ) ) ( not ( = ?auto_591981 ?auto_591984 ) ) ( not ( = ?auto_591981 ?auto_591985 ) ) ( not ( = ?auto_591981 ?auto_591986 ) ) ( not ( = ?auto_591982 ?auto_591983 ) ) ( not ( = ?auto_591982 ?auto_591984 ) ) ( not ( = ?auto_591982 ?auto_591985 ) ) ( not ( = ?auto_591982 ?auto_591986 ) ) ( not ( = ?auto_591983 ?auto_591984 ) ) ( not ( = ?auto_591983 ?auto_591985 ) ) ( not ( = ?auto_591983 ?auto_591986 ) ) ( not ( = ?auto_591984 ?auto_591985 ) ) ( not ( = ?auto_591984 ?auto_591986 ) ) ( not ( = ?auto_591985 ?auto_591986 ) ) ( ON ?auto_591984 ?auto_591985 ) ( ON ?auto_591983 ?auto_591984 ) ( ON ?auto_591982 ?auto_591983 ) ( ON ?auto_591981 ?auto_591982 ) ( ON ?auto_591980 ?auto_591981 ) ( ON ?auto_591979 ?auto_591980 ) ( ON ?auto_591978 ?auto_591979 ) ( CLEAR ?auto_591976 ) ( ON ?auto_591977 ?auto_591978 ) ( CLEAR ?auto_591977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_591976 ?auto_591977 )
      ( MAKE-10PILE ?auto_591976 ?auto_591977 ?auto_591978 ?auto_591979 ?auto_591980 ?auto_591981 ?auto_591982 ?auto_591983 ?auto_591984 ?auto_591985 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_592018 - BLOCK
      ?auto_592019 - BLOCK
      ?auto_592020 - BLOCK
      ?auto_592021 - BLOCK
      ?auto_592022 - BLOCK
      ?auto_592023 - BLOCK
      ?auto_592024 - BLOCK
      ?auto_592025 - BLOCK
      ?auto_592026 - BLOCK
      ?auto_592027 - BLOCK
    )
    :vars
    (
      ?auto_592028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592027 ?auto_592028 ) ( not ( = ?auto_592018 ?auto_592019 ) ) ( not ( = ?auto_592018 ?auto_592020 ) ) ( not ( = ?auto_592018 ?auto_592021 ) ) ( not ( = ?auto_592018 ?auto_592022 ) ) ( not ( = ?auto_592018 ?auto_592023 ) ) ( not ( = ?auto_592018 ?auto_592024 ) ) ( not ( = ?auto_592018 ?auto_592025 ) ) ( not ( = ?auto_592018 ?auto_592026 ) ) ( not ( = ?auto_592018 ?auto_592027 ) ) ( not ( = ?auto_592018 ?auto_592028 ) ) ( not ( = ?auto_592019 ?auto_592020 ) ) ( not ( = ?auto_592019 ?auto_592021 ) ) ( not ( = ?auto_592019 ?auto_592022 ) ) ( not ( = ?auto_592019 ?auto_592023 ) ) ( not ( = ?auto_592019 ?auto_592024 ) ) ( not ( = ?auto_592019 ?auto_592025 ) ) ( not ( = ?auto_592019 ?auto_592026 ) ) ( not ( = ?auto_592019 ?auto_592027 ) ) ( not ( = ?auto_592019 ?auto_592028 ) ) ( not ( = ?auto_592020 ?auto_592021 ) ) ( not ( = ?auto_592020 ?auto_592022 ) ) ( not ( = ?auto_592020 ?auto_592023 ) ) ( not ( = ?auto_592020 ?auto_592024 ) ) ( not ( = ?auto_592020 ?auto_592025 ) ) ( not ( = ?auto_592020 ?auto_592026 ) ) ( not ( = ?auto_592020 ?auto_592027 ) ) ( not ( = ?auto_592020 ?auto_592028 ) ) ( not ( = ?auto_592021 ?auto_592022 ) ) ( not ( = ?auto_592021 ?auto_592023 ) ) ( not ( = ?auto_592021 ?auto_592024 ) ) ( not ( = ?auto_592021 ?auto_592025 ) ) ( not ( = ?auto_592021 ?auto_592026 ) ) ( not ( = ?auto_592021 ?auto_592027 ) ) ( not ( = ?auto_592021 ?auto_592028 ) ) ( not ( = ?auto_592022 ?auto_592023 ) ) ( not ( = ?auto_592022 ?auto_592024 ) ) ( not ( = ?auto_592022 ?auto_592025 ) ) ( not ( = ?auto_592022 ?auto_592026 ) ) ( not ( = ?auto_592022 ?auto_592027 ) ) ( not ( = ?auto_592022 ?auto_592028 ) ) ( not ( = ?auto_592023 ?auto_592024 ) ) ( not ( = ?auto_592023 ?auto_592025 ) ) ( not ( = ?auto_592023 ?auto_592026 ) ) ( not ( = ?auto_592023 ?auto_592027 ) ) ( not ( = ?auto_592023 ?auto_592028 ) ) ( not ( = ?auto_592024 ?auto_592025 ) ) ( not ( = ?auto_592024 ?auto_592026 ) ) ( not ( = ?auto_592024 ?auto_592027 ) ) ( not ( = ?auto_592024 ?auto_592028 ) ) ( not ( = ?auto_592025 ?auto_592026 ) ) ( not ( = ?auto_592025 ?auto_592027 ) ) ( not ( = ?auto_592025 ?auto_592028 ) ) ( not ( = ?auto_592026 ?auto_592027 ) ) ( not ( = ?auto_592026 ?auto_592028 ) ) ( not ( = ?auto_592027 ?auto_592028 ) ) ( ON ?auto_592026 ?auto_592027 ) ( ON ?auto_592025 ?auto_592026 ) ( ON ?auto_592024 ?auto_592025 ) ( ON ?auto_592023 ?auto_592024 ) ( ON ?auto_592022 ?auto_592023 ) ( ON ?auto_592021 ?auto_592022 ) ( ON ?auto_592020 ?auto_592021 ) ( ON ?auto_592019 ?auto_592020 ) ( ON ?auto_592018 ?auto_592019 ) ( CLEAR ?auto_592018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_592018 )
      ( MAKE-10PILE ?auto_592018 ?auto_592019 ?auto_592020 ?auto_592021 ?auto_592022 ?auto_592023 ?auto_592024 ?auto_592025 ?auto_592026 ?auto_592027 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592061 - BLOCK
      ?auto_592062 - BLOCK
      ?auto_592063 - BLOCK
      ?auto_592064 - BLOCK
      ?auto_592065 - BLOCK
      ?auto_592066 - BLOCK
      ?auto_592067 - BLOCK
      ?auto_592068 - BLOCK
      ?auto_592069 - BLOCK
      ?auto_592070 - BLOCK
      ?auto_592071 - BLOCK
    )
    :vars
    (
      ?auto_592072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_592070 ) ( ON ?auto_592071 ?auto_592072 ) ( CLEAR ?auto_592071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_592061 ) ( ON ?auto_592062 ?auto_592061 ) ( ON ?auto_592063 ?auto_592062 ) ( ON ?auto_592064 ?auto_592063 ) ( ON ?auto_592065 ?auto_592064 ) ( ON ?auto_592066 ?auto_592065 ) ( ON ?auto_592067 ?auto_592066 ) ( ON ?auto_592068 ?auto_592067 ) ( ON ?auto_592069 ?auto_592068 ) ( ON ?auto_592070 ?auto_592069 ) ( not ( = ?auto_592061 ?auto_592062 ) ) ( not ( = ?auto_592061 ?auto_592063 ) ) ( not ( = ?auto_592061 ?auto_592064 ) ) ( not ( = ?auto_592061 ?auto_592065 ) ) ( not ( = ?auto_592061 ?auto_592066 ) ) ( not ( = ?auto_592061 ?auto_592067 ) ) ( not ( = ?auto_592061 ?auto_592068 ) ) ( not ( = ?auto_592061 ?auto_592069 ) ) ( not ( = ?auto_592061 ?auto_592070 ) ) ( not ( = ?auto_592061 ?auto_592071 ) ) ( not ( = ?auto_592061 ?auto_592072 ) ) ( not ( = ?auto_592062 ?auto_592063 ) ) ( not ( = ?auto_592062 ?auto_592064 ) ) ( not ( = ?auto_592062 ?auto_592065 ) ) ( not ( = ?auto_592062 ?auto_592066 ) ) ( not ( = ?auto_592062 ?auto_592067 ) ) ( not ( = ?auto_592062 ?auto_592068 ) ) ( not ( = ?auto_592062 ?auto_592069 ) ) ( not ( = ?auto_592062 ?auto_592070 ) ) ( not ( = ?auto_592062 ?auto_592071 ) ) ( not ( = ?auto_592062 ?auto_592072 ) ) ( not ( = ?auto_592063 ?auto_592064 ) ) ( not ( = ?auto_592063 ?auto_592065 ) ) ( not ( = ?auto_592063 ?auto_592066 ) ) ( not ( = ?auto_592063 ?auto_592067 ) ) ( not ( = ?auto_592063 ?auto_592068 ) ) ( not ( = ?auto_592063 ?auto_592069 ) ) ( not ( = ?auto_592063 ?auto_592070 ) ) ( not ( = ?auto_592063 ?auto_592071 ) ) ( not ( = ?auto_592063 ?auto_592072 ) ) ( not ( = ?auto_592064 ?auto_592065 ) ) ( not ( = ?auto_592064 ?auto_592066 ) ) ( not ( = ?auto_592064 ?auto_592067 ) ) ( not ( = ?auto_592064 ?auto_592068 ) ) ( not ( = ?auto_592064 ?auto_592069 ) ) ( not ( = ?auto_592064 ?auto_592070 ) ) ( not ( = ?auto_592064 ?auto_592071 ) ) ( not ( = ?auto_592064 ?auto_592072 ) ) ( not ( = ?auto_592065 ?auto_592066 ) ) ( not ( = ?auto_592065 ?auto_592067 ) ) ( not ( = ?auto_592065 ?auto_592068 ) ) ( not ( = ?auto_592065 ?auto_592069 ) ) ( not ( = ?auto_592065 ?auto_592070 ) ) ( not ( = ?auto_592065 ?auto_592071 ) ) ( not ( = ?auto_592065 ?auto_592072 ) ) ( not ( = ?auto_592066 ?auto_592067 ) ) ( not ( = ?auto_592066 ?auto_592068 ) ) ( not ( = ?auto_592066 ?auto_592069 ) ) ( not ( = ?auto_592066 ?auto_592070 ) ) ( not ( = ?auto_592066 ?auto_592071 ) ) ( not ( = ?auto_592066 ?auto_592072 ) ) ( not ( = ?auto_592067 ?auto_592068 ) ) ( not ( = ?auto_592067 ?auto_592069 ) ) ( not ( = ?auto_592067 ?auto_592070 ) ) ( not ( = ?auto_592067 ?auto_592071 ) ) ( not ( = ?auto_592067 ?auto_592072 ) ) ( not ( = ?auto_592068 ?auto_592069 ) ) ( not ( = ?auto_592068 ?auto_592070 ) ) ( not ( = ?auto_592068 ?auto_592071 ) ) ( not ( = ?auto_592068 ?auto_592072 ) ) ( not ( = ?auto_592069 ?auto_592070 ) ) ( not ( = ?auto_592069 ?auto_592071 ) ) ( not ( = ?auto_592069 ?auto_592072 ) ) ( not ( = ?auto_592070 ?auto_592071 ) ) ( not ( = ?auto_592070 ?auto_592072 ) ) ( not ( = ?auto_592071 ?auto_592072 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_592071 ?auto_592072 )
      ( !STACK ?auto_592071 ?auto_592070 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592107 - BLOCK
      ?auto_592108 - BLOCK
      ?auto_592109 - BLOCK
      ?auto_592110 - BLOCK
      ?auto_592111 - BLOCK
      ?auto_592112 - BLOCK
      ?auto_592113 - BLOCK
      ?auto_592114 - BLOCK
      ?auto_592115 - BLOCK
      ?auto_592116 - BLOCK
      ?auto_592117 - BLOCK
    )
    :vars
    (
      ?auto_592118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592117 ?auto_592118 ) ( ON-TABLE ?auto_592107 ) ( ON ?auto_592108 ?auto_592107 ) ( ON ?auto_592109 ?auto_592108 ) ( ON ?auto_592110 ?auto_592109 ) ( ON ?auto_592111 ?auto_592110 ) ( ON ?auto_592112 ?auto_592111 ) ( ON ?auto_592113 ?auto_592112 ) ( ON ?auto_592114 ?auto_592113 ) ( ON ?auto_592115 ?auto_592114 ) ( not ( = ?auto_592107 ?auto_592108 ) ) ( not ( = ?auto_592107 ?auto_592109 ) ) ( not ( = ?auto_592107 ?auto_592110 ) ) ( not ( = ?auto_592107 ?auto_592111 ) ) ( not ( = ?auto_592107 ?auto_592112 ) ) ( not ( = ?auto_592107 ?auto_592113 ) ) ( not ( = ?auto_592107 ?auto_592114 ) ) ( not ( = ?auto_592107 ?auto_592115 ) ) ( not ( = ?auto_592107 ?auto_592116 ) ) ( not ( = ?auto_592107 ?auto_592117 ) ) ( not ( = ?auto_592107 ?auto_592118 ) ) ( not ( = ?auto_592108 ?auto_592109 ) ) ( not ( = ?auto_592108 ?auto_592110 ) ) ( not ( = ?auto_592108 ?auto_592111 ) ) ( not ( = ?auto_592108 ?auto_592112 ) ) ( not ( = ?auto_592108 ?auto_592113 ) ) ( not ( = ?auto_592108 ?auto_592114 ) ) ( not ( = ?auto_592108 ?auto_592115 ) ) ( not ( = ?auto_592108 ?auto_592116 ) ) ( not ( = ?auto_592108 ?auto_592117 ) ) ( not ( = ?auto_592108 ?auto_592118 ) ) ( not ( = ?auto_592109 ?auto_592110 ) ) ( not ( = ?auto_592109 ?auto_592111 ) ) ( not ( = ?auto_592109 ?auto_592112 ) ) ( not ( = ?auto_592109 ?auto_592113 ) ) ( not ( = ?auto_592109 ?auto_592114 ) ) ( not ( = ?auto_592109 ?auto_592115 ) ) ( not ( = ?auto_592109 ?auto_592116 ) ) ( not ( = ?auto_592109 ?auto_592117 ) ) ( not ( = ?auto_592109 ?auto_592118 ) ) ( not ( = ?auto_592110 ?auto_592111 ) ) ( not ( = ?auto_592110 ?auto_592112 ) ) ( not ( = ?auto_592110 ?auto_592113 ) ) ( not ( = ?auto_592110 ?auto_592114 ) ) ( not ( = ?auto_592110 ?auto_592115 ) ) ( not ( = ?auto_592110 ?auto_592116 ) ) ( not ( = ?auto_592110 ?auto_592117 ) ) ( not ( = ?auto_592110 ?auto_592118 ) ) ( not ( = ?auto_592111 ?auto_592112 ) ) ( not ( = ?auto_592111 ?auto_592113 ) ) ( not ( = ?auto_592111 ?auto_592114 ) ) ( not ( = ?auto_592111 ?auto_592115 ) ) ( not ( = ?auto_592111 ?auto_592116 ) ) ( not ( = ?auto_592111 ?auto_592117 ) ) ( not ( = ?auto_592111 ?auto_592118 ) ) ( not ( = ?auto_592112 ?auto_592113 ) ) ( not ( = ?auto_592112 ?auto_592114 ) ) ( not ( = ?auto_592112 ?auto_592115 ) ) ( not ( = ?auto_592112 ?auto_592116 ) ) ( not ( = ?auto_592112 ?auto_592117 ) ) ( not ( = ?auto_592112 ?auto_592118 ) ) ( not ( = ?auto_592113 ?auto_592114 ) ) ( not ( = ?auto_592113 ?auto_592115 ) ) ( not ( = ?auto_592113 ?auto_592116 ) ) ( not ( = ?auto_592113 ?auto_592117 ) ) ( not ( = ?auto_592113 ?auto_592118 ) ) ( not ( = ?auto_592114 ?auto_592115 ) ) ( not ( = ?auto_592114 ?auto_592116 ) ) ( not ( = ?auto_592114 ?auto_592117 ) ) ( not ( = ?auto_592114 ?auto_592118 ) ) ( not ( = ?auto_592115 ?auto_592116 ) ) ( not ( = ?auto_592115 ?auto_592117 ) ) ( not ( = ?auto_592115 ?auto_592118 ) ) ( not ( = ?auto_592116 ?auto_592117 ) ) ( not ( = ?auto_592116 ?auto_592118 ) ) ( not ( = ?auto_592117 ?auto_592118 ) ) ( CLEAR ?auto_592115 ) ( ON ?auto_592116 ?auto_592117 ) ( CLEAR ?auto_592116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_592107 ?auto_592108 ?auto_592109 ?auto_592110 ?auto_592111 ?auto_592112 ?auto_592113 ?auto_592114 ?auto_592115 ?auto_592116 )
      ( MAKE-11PILE ?auto_592107 ?auto_592108 ?auto_592109 ?auto_592110 ?auto_592111 ?auto_592112 ?auto_592113 ?auto_592114 ?auto_592115 ?auto_592116 ?auto_592117 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592153 - BLOCK
      ?auto_592154 - BLOCK
      ?auto_592155 - BLOCK
      ?auto_592156 - BLOCK
      ?auto_592157 - BLOCK
      ?auto_592158 - BLOCK
      ?auto_592159 - BLOCK
      ?auto_592160 - BLOCK
      ?auto_592161 - BLOCK
      ?auto_592162 - BLOCK
      ?auto_592163 - BLOCK
    )
    :vars
    (
      ?auto_592164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592163 ?auto_592164 ) ( ON-TABLE ?auto_592153 ) ( ON ?auto_592154 ?auto_592153 ) ( ON ?auto_592155 ?auto_592154 ) ( ON ?auto_592156 ?auto_592155 ) ( ON ?auto_592157 ?auto_592156 ) ( ON ?auto_592158 ?auto_592157 ) ( ON ?auto_592159 ?auto_592158 ) ( ON ?auto_592160 ?auto_592159 ) ( not ( = ?auto_592153 ?auto_592154 ) ) ( not ( = ?auto_592153 ?auto_592155 ) ) ( not ( = ?auto_592153 ?auto_592156 ) ) ( not ( = ?auto_592153 ?auto_592157 ) ) ( not ( = ?auto_592153 ?auto_592158 ) ) ( not ( = ?auto_592153 ?auto_592159 ) ) ( not ( = ?auto_592153 ?auto_592160 ) ) ( not ( = ?auto_592153 ?auto_592161 ) ) ( not ( = ?auto_592153 ?auto_592162 ) ) ( not ( = ?auto_592153 ?auto_592163 ) ) ( not ( = ?auto_592153 ?auto_592164 ) ) ( not ( = ?auto_592154 ?auto_592155 ) ) ( not ( = ?auto_592154 ?auto_592156 ) ) ( not ( = ?auto_592154 ?auto_592157 ) ) ( not ( = ?auto_592154 ?auto_592158 ) ) ( not ( = ?auto_592154 ?auto_592159 ) ) ( not ( = ?auto_592154 ?auto_592160 ) ) ( not ( = ?auto_592154 ?auto_592161 ) ) ( not ( = ?auto_592154 ?auto_592162 ) ) ( not ( = ?auto_592154 ?auto_592163 ) ) ( not ( = ?auto_592154 ?auto_592164 ) ) ( not ( = ?auto_592155 ?auto_592156 ) ) ( not ( = ?auto_592155 ?auto_592157 ) ) ( not ( = ?auto_592155 ?auto_592158 ) ) ( not ( = ?auto_592155 ?auto_592159 ) ) ( not ( = ?auto_592155 ?auto_592160 ) ) ( not ( = ?auto_592155 ?auto_592161 ) ) ( not ( = ?auto_592155 ?auto_592162 ) ) ( not ( = ?auto_592155 ?auto_592163 ) ) ( not ( = ?auto_592155 ?auto_592164 ) ) ( not ( = ?auto_592156 ?auto_592157 ) ) ( not ( = ?auto_592156 ?auto_592158 ) ) ( not ( = ?auto_592156 ?auto_592159 ) ) ( not ( = ?auto_592156 ?auto_592160 ) ) ( not ( = ?auto_592156 ?auto_592161 ) ) ( not ( = ?auto_592156 ?auto_592162 ) ) ( not ( = ?auto_592156 ?auto_592163 ) ) ( not ( = ?auto_592156 ?auto_592164 ) ) ( not ( = ?auto_592157 ?auto_592158 ) ) ( not ( = ?auto_592157 ?auto_592159 ) ) ( not ( = ?auto_592157 ?auto_592160 ) ) ( not ( = ?auto_592157 ?auto_592161 ) ) ( not ( = ?auto_592157 ?auto_592162 ) ) ( not ( = ?auto_592157 ?auto_592163 ) ) ( not ( = ?auto_592157 ?auto_592164 ) ) ( not ( = ?auto_592158 ?auto_592159 ) ) ( not ( = ?auto_592158 ?auto_592160 ) ) ( not ( = ?auto_592158 ?auto_592161 ) ) ( not ( = ?auto_592158 ?auto_592162 ) ) ( not ( = ?auto_592158 ?auto_592163 ) ) ( not ( = ?auto_592158 ?auto_592164 ) ) ( not ( = ?auto_592159 ?auto_592160 ) ) ( not ( = ?auto_592159 ?auto_592161 ) ) ( not ( = ?auto_592159 ?auto_592162 ) ) ( not ( = ?auto_592159 ?auto_592163 ) ) ( not ( = ?auto_592159 ?auto_592164 ) ) ( not ( = ?auto_592160 ?auto_592161 ) ) ( not ( = ?auto_592160 ?auto_592162 ) ) ( not ( = ?auto_592160 ?auto_592163 ) ) ( not ( = ?auto_592160 ?auto_592164 ) ) ( not ( = ?auto_592161 ?auto_592162 ) ) ( not ( = ?auto_592161 ?auto_592163 ) ) ( not ( = ?auto_592161 ?auto_592164 ) ) ( not ( = ?auto_592162 ?auto_592163 ) ) ( not ( = ?auto_592162 ?auto_592164 ) ) ( not ( = ?auto_592163 ?auto_592164 ) ) ( ON ?auto_592162 ?auto_592163 ) ( CLEAR ?auto_592160 ) ( ON ?auto_592161 ?auto_592162 ) ( CLEAR ?auto_592161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_592153 ?auto_592154 ?auto_592155 ?auto_592156 ?auto_592157 ?auto_592158 ?auto_592159 ?auto_592160 ?auto_592161 )
      ( MAKE-11PILE ?auto_592153 ?auto_592154 ?auto_592155 ?auto_592156 ?auto_592157 ?auto_592158 ?auto_592159 ?auto_592160 ?auto_592161 ?auto_592162 ?auto_592163 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592199 - BLOCK
      ?auto_592200 - BLOCK
      ?auto_592201 - BLOCK
      ?auto_592202 - BLOCK
      ?auto_592203 - BLOCK
      ?auto_592204 - BLOCK
      ?auto_592205 - BLOCK
      ?auto_592206 - BLOCK
      ?auto_592207 - BLOCK
      ?auto_592208 - BLOCK
      ?auto_592209 - BLOCK
    )
    :vars
    (
      ?auto_592210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592209 ?auto_592210 ) ( ON-TABLE ?auto_592199 ) ( ON ?auto_592200 ?auto_592199 ) ( ON ?auto_592201 ?auto_592200 ) ( ON ?auto_592202 ?auto_592201 ) ( ON ?auto_592203 ?auto_592202 ) ( ON ?auto_592204 ?auto_592203 ) ( ON ?auto_592205 ?auto_592204 ) ( not ( = ?auto_592199 ?auto_592200 ) ) ( not ( = ?auto_592199 ?auto_592201 ) ) ( not ( = ?auto_592199 ?auto_592202 ) ) ( not ( = ?auto_592199 ?auto_592203 ) ) ( not ( = ?auto_592199 ?auto_592204 ) ) ( not ( = ?auto_592199 ?auto_592205 ) ) ( not ( = ?auto_592199 ?auto_592206 ) ) ( not ( = ?auto_592199 ?auto_592207 ) ) ( not ( = ?auto_592199 ?auto_592208 ) ) ( not ( = ?auto_592199 ?auto_592209 ) ) ( not ( = ?auto_592199 ?auto_592210 ) ) ( not ( = ?auto_592200 ?auto_592201 ) ) ( not ( = ?auto_592200 ?auto_592202 ) ) ( not ( = ?auto_592200 ?auto_592203 ) ) ( not ( = ?auto_592200 ?auto_592204 ) ) ( not ( = ?auto_592200 ?auto_592205 ) ) ( not ( = ?auto_592200 ?auto_592206 ) ) ( not ( = ?auto_592200 ?auto_592207 ) ) ( not ( = ?auto_592200 ?auto_592208 ) ) ( not ( = ?auto_592200 ?auto_592209 ) ) ( not ( = ?auto_592200 ?auto_592210 ) ) ( not ( = ?auto_592201 ?auto_592202 ) ) ( not ( = ?auto_592201 ?auto_592203 ) ) ( not ( = ?auto_592201 ?auto_592204 ) ) ( not ( = ?auto_592201 ?auto_592205 ) ) ( not ( = ?auto_592201 ?auto_592206 ) ) ( not ( = ?auto_592201 ?auto_592207 ) ) ( not ( = ?auto_592201 ?auto_592208 ) ) ( not ( = ?auto_592201 ?auto_592209 ) ) ( not ( = ?auto_592201 ?auto_592210 ) ) ( not ( = ?auto_592202 ?auto_592203 ) ) ( not ( = ?auto_592202 ?auto_592204 ) ) ( not ( = ?auto_592202 ?auto_592205 ) ) ( not ( = ?auto_592202 ?auto_592206 ) ) ( not ( = ?auto_592202 ?auto_592207 ) ) ( not ( = ?auto_592202 ?auto_592208 ) ) ( not ( = ?auto_592202 ?auto_592209 ) ) ( not ( = ?auto_592202 ?auto_592210 ) ) ( not ( = ?auto_592203 ?auto_592204 ) ) ( not ( = ?auto_592203 ?auto_592205 ) ) ( not ( = ?auto_592203 ?auto_592206 ) ) ( not ( = ?auto_592203 ?auto_592207 ) ) ( not ( = ?auto_592203 ?auto_592208 ) ) ( not ( = ?auto_592203 ?auto_592209 ) ) ( not ( = ?auto_592203 ?auto_592210 ) ) ( not ( = ?auto_592204 ?auto_592205 ) ) ( not ( = ?auto_592204 ?auto_592206 ) ) ( not ( = ?auto_592204 ?auto_592207 ) ) ( not ( = ?auto_592204 ?auto_592208 ) ) ( not ( = ?auto_592204 ?auto_592209 ) ) ( not ( = ?auto_592204 ?auto_592210 ) ) ( not ( = ?auto_592205 ?auto_592206 ) ) ( not ( = ?auto_592205 ?auto_592207 ) ) ( not ( = ?auto_592205 ?auto_592208 ) ) ( not ( = ?auto_592205 ?auto_592209 ) ) ( not ( = ?auto_592205 ?auto_592210 ) ) ( not ( = ?auto_592206 ?auto_592207 ) ) ( not ( = ?auto_592206 ?auto_592208 ) ) ( not ( = ?auto_592206 ?auto_592209 ) ) ( not ( = ?auto_592206 ?auto_592210 ) ) ( not ( = ?auto_592207 ?auto_592208 ) ) ( not ( = ?auto_592207 ?auto_592209 ) ) ( not ( = ?auto_592207 ?auto_592210 ) ) ( not ( = ?auto_592208 ?auto_592209 ) ) ( not ( = ?auto_592208 ?auto_592210 ) ) ( not ( = ?auto_592209 ?auto_592210 ) ) ( ON ?auto_592208 ?auto_592209 ) ( ON ?auto_592207 ?auto_592208 ) ( CLEAR ?auto_592205 ) ( ON ?auto_592206 ?auto_592207 ) ( CLEAR ?auto_592206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_592199 ?auto_592200 ?auto_592201 ?auto_592202 ?auto_592203 ?auto_592204 ?auto_592205 ?auto_592206 )
      ( MAKE-11PILE ?auto_592199 ?auto_592200 ?auto_592201 ?auto_592202 ?auto_592203 ?auto_592204 ?auto_592205 ?auto_592206 ?auto_592207 ?auto_592208 ?auto_592209 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592245 - BLOCK
      ?auto_592246 - BLOCK
      ?auto_592247 - BLOCK
      ?auto_592248 - BLOCK
      ?auto_592249 - BLOCK
      ?auto_592250 - BLOCK
      ?auto_592251 - BLOCK
      ?auto_592252 - BLOCK
      ?auto_592253 - BLOCK
      ?auto_592254 - BLOCK
      ?auto_592255 - BLOCK
    )
    :vars
    (
      ?auto_592256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592255 ?auto_592256 ) ( ON-TABLE ?auto_592245 ) ( ON ?auto_592246 ?auto_592245 ) ( ON ?auto_592247 ?auto_592246 ) ( ON ?auto_592248 ?auto_592247 ) ( ON ?auto_592249 ?auto_592248 ) ( ON ?auto_592250 ?auto_592249 ) ( not ( = ?auto_592245 ?auto_592246 ) ) ( not ( = ?auto_592245 ?auto_592247 ) ) ( not ( = ?auto_592245 ?auto_592248 ) ) ( not ( = ?auto_592245 ?auto_592249 ) ) ( not ( = ?auto_592245 ?auto_592250 ) ) ( not ( = ?auto_592245 ?auto_592251 ) ) ( not ( = ?auto_592245 ?auto_592252 ) ) ( not ( = ?auto_592245 ?auto_592253 ) ) ( not ( = ?auto_592245 ?auto_592254 ) ) ( not ( = ?auto_592245 ?auto_592255 ) ) ( not ( = ?auto_592245 ?auto_592256 ) ) ( not ( = ?auto_592246 ?auto_592247 ) ) ( not ( = ?auto_592246 ?auto_592248 ) ) ( not ( = ?auto_592246 ?auto_592249 ) ) ( not ( = ?auto_592246 ?auto_592250 ) ) ( not ( = ?auto_592246 ?auto_592251 ) ) ( not ( = ?auto_592246 ?auto_592252 ) ) ( not ( = ?auto_592246 ?auto_592253 ) ) ( not ( = ?auto_592246 ?auto_592254 ) ) ( not ( = ?auto_592246 ?auto_592255 ) ) ( not ( = ?auto_592246 ?auto_592256 ) ) ( not ( = ?auto_592247 ?auto_592248 ) ) ( not ( = ?auto_592247 ?auto_592249 ) ) ( not ( = ?auto_592247 ?auto_592250 ) ) ( not ( = ?auto_592247 ?auto_592251 ) ) ( not ( = ?auto_592247 ?auto_592252 ) ) ( not ( = ?auto_592247 ?auto_592253 ) ) ( not ( = ?auto_592247 ?auto_592254 ) ) ( not ( = ?auto_592247 ?auto_592255 ) ) ( not ( = ?auto_592247 ?auto_592256 ) ) ( not ( = ?auto_592248 ?auto_592249 ) ) ( not ( = ?auto_592248 ?auto_592250 ) ) ( not ( = ?auto_592248 ?auto_592251 ) ) ( not ( = ?auto_592248 ?auto_592252 ) ) ( not ( = ?auto_592248 ?auto_592253 ) ) ( not ( = ?auto_592248 ?auto_592254 ) ) ( not ( = ?auto_592248 ?auto_592255 ) ) ( not ( = ?auto_592248 ?auto_592256 ) ) ( not ( = ?auto_592249 ?auto_592250 ) ) ( not ( = ?auto_592249 ?auto_592251 ) ) ( not ( = ?auto_592249 ?auto_592252 ) ) ( not ( = ?auto_592249 ?auto_592253 ) ) ( not ( = ?auto_592249 ?auto_592254 ) ) ( not ( = ?auto_592249 ?auto_592255 ) ) ( not ( = ?auto_592249 ?auto_592256 ) ) ( not ( = ?auto_592250 ?auto_592251 ) ) ( not ( = ?auto_592250 ?auto_592252 ) ) ( not ( = ?auto_592250 ?auto_592253 ) ) ( not ( = ?auto_592250 ?auto_592254 ) ) ( not ( = ?auto_592250 ?auto_592255 ) ) ( not ( = ?auto_592250 ?auto_592256 ) ) ( not ( = ?auto_592251 ?auto_592252 ) ) ( not ( = ?auto_592251 ?auto_592253 ) ) ( not ( = ?auto_592251 ?auto_592254 ) ) ( not ( = ?auto_592251 ?auto_592255 ) ) ( not ( = ?auto_592251 ?auto_592256 ) ) ( not ( = ?auto_592252 ?auto_592253 ) ) ( not ( = ?auto_592252 ?auto_592254 ) ) ( not ( = ?auto_592252 ?auto_592255 ) ) ( not ( = ?auto_592252 ?auto_592256 ) ) ( not ( = ?auto_592253 ?auto_592254 ) ) ( not ( = ?auto_592253 ?auto_592255 ) ) ( not ( = ?auto_592253 ?auto_592256 ) ) ( not ( = ?auto_592254 ?auto_592255 ) ) ( not ( = ?auto_592254 ?auto_592256 ) ) ( not ( = ?auto_592255 ?auto_592256 ) ) ( ON ?auto_592254 ?auto_592255 ) ( ON ?auto_592253 ?auto_592254 ) ( ON ?auto_592252 ?auto_592253 ) ( CLEAR ?auto_592250 ) ( ON ?auto_592251 ?auto_592252 ) ( CLEAR ?auto_592251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_592245 ?auto_592246 ?auto_592247 ?auto_592248 ?auto_592249 ?auto_592250 ?auto_592251 )
      ( MAKE-11PILE ?auto_592245 ?auto_592246 ?auto_592247 ?auto_592248 ?auto_592249 ?auto_592250 ?auto_592251 ?auto_592252 ?auto_592253 ?auto_592254 ?auto_592255 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592291 - BLOCK
      ?auto_592292 - BLOCK
      ?auto_592293 - BLOCK
      ?auto_592294 - BLOCK
      ?auto_592295 - BLOCK
      ?auto_592296 - BLOCK
      ?auto_592297 - BLOCK
      ?auto_592298 - BLOCK
      ?auto_592299 - BLOCK
      ?auto_592300 - BLOCK
      ?auto_592301 - BLOCK
    )
    :vars
    (
      ?auto_592302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592301 ?auto_592302 ) ( ON-TABLE ?auto_592291 ) ( ON ?auto_592292 ?auto_592291 ) ( ON ?auto_592293 ?auto_592292 ) ( ON ?auto_592294 ?auto_592293 ) ( ON ?auto_592295 ?auto_592294 ) ( not ( = ?auto_592291 ?auto_592292 ) ) ( not ( = ?auto_592291 ?auto_592293 ) ) ( not ( = ?auto_592291 ?auto_592294 ) ) ( not ( = ?auto_592291 ?auto_592295 ) ) ( not ( = ?auto_592291 ?auto_592296 ) ) ( not ( = ?auto_592291 ?auto_592297 ) ) ( not ( = ?auto_592291 ?auto_592298 ) ) ( not ( = ?auto_592291 ?auto_592299 ) ) ( not ( = ?auto_592291 ?auto_592300 ) ) ( not ( = ?auto_592291 ?auto_592301 ) ) ( not ( = ?auto_592291 ?auto_592302 ) ) ( not ( = ?auto_592292 ?auto_592293 ) ) ( not ( = ?auto_592292 ?auto_592294 ) ) ( not ( = ?auto_592292 ?auto_592295 ) ) ( not ( = ?auto_592292 ?auto_592296 ) ) ( not ( = ?auto_592292 ?auto_592297 ) ) ( not ( = ?auto_592292 ?auto_592298 ) ) ( not ( = ?auto_592292 ?auto_592299 ) ) ( not ( = ?auto_592292 ?auto_592300 ) ) ( not ( = ?auto_592292 ?auto_592301 ) ) ( not ( = ?auto_592292 ?auto_592302 ) ) ( not ( = ?auto_592293 ?auto_592294 ) ) ( not ( = ?auto_592293 ?auto_592295 ) ) ( not ( = ?auto_592293 ?auto_592296 ) ) ( not ( = ?auto_592293 ?auto_592297 ) ) ( not ( = ?auto_592293 ?auto_592298 ) ) ( not ( = ?auto_592293 ?auto_592299 ) ) ( not ( = ?auto_592293 ?auto_592300 ) ) ( not ( = ?auto_592293 ?auto_592301 ) ) ( not ( = ?auto_592293 ?auto_592302 ) ) ( not ( = ?auto_592294 ?auto_592295 ) ) ( not ( = ?auto_592294 ?auto_592296 ) ) ( not ( = ?auto_592294 ?auto_592297 ) ) ( not ( = ?auto_592294 ?auto_592298 ) ) ( not ( = ?auto_592294 ?auto_592299 ) ) ( not ( = ?auto_592294 ?auto_592300 ) ) ( not ( = ?auto_592294 ?auto_592301 ) ) ( not ( = ?auto_592294 ?auto_592302 ) ) ( not ( = ?auto_592295 ?auto_592296 ) ) ( not ( = ?auto_592295 ?auto_592297 ) ) ( not ( = ?auto_592295 ?auto_592298 ) ) ( not ( = ?auto_592295 ?auto_592299 ) ) ( not ( = ?auto_592295 ?auto_592300 ) ) ( not ( = ?auto_592295 ?auto_592301 ) ) ( not ( = ?auto_592295 ?auto_592302 ) ) ( not ( = ?auto_592296 ?auto_592297 ) ) ( not ( = ?auto_592296 ?auto_592298 ) ) ( not ( = ?auto_592296 ?auto_592299 ) ) ( not ( = ?auto_592296 ?auto_592300 ) ) ( not ( = ?auto_592296 ?auto_592301 ) ) ( not ( = ?auto_592296 ?auto_592302 ) ) ( not ( = ?auto_592297 ?auto_592298 ) ) ( not ( = ?auto_592297 ?auto_592299 ) ) ( not ( = ?auto_592297 ?auto_592300 ) ) ( not ( = ?auto_592297 ?auto_592301 ) ) ( not ( = ?auto_592297 ?auto_592302 ) ) ( not ( = ?auto_592298 ?auto_592299 ) ) ( not ( = ?auto_592298 ?auto_592300 ) ) ( not ( = ?auto_592298 ?auto_592301 ) ) ( not ( = ?auto_592298 ?auto_592302 ) ) ( not ( = ?auto_592299 ?auto_592300 ) ) ( not ( = ?auto_592299 ?auto_592301 ) ) ( not ( = ?auto_592299 ?auto_592302 ) ) ( not ( = ?auto_592300 ?auto_592301 ) ) ( not ( = ?auto_592300 ?auto_592302 ) ) ( not ( = ?auto_592301 ?auto_592302 ) ) ( ON ?auto_592300 ?auto_592301 ) ( ON ?auto_592299 ?auto_592300 ) ( ON ?auto_592298 ?auto_592299 ) ( ON ?auto_592297 ?auto_592298 ) ( CLEAR ?auto_592295 ) ( ON ?auto_592296 ?auto_592297 ) ( CLEAR ?auto_592296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_592291 ?auto_592292 ?auto_592293 ?auto_592294 ?auto_592295 ?auto_592296 )
      ( MAKE-11PILE ?auto_592291 ?auto_592292 ?auto_592293 ?auto_592294 ?auto_592295 ?auto_592296 ?auto_592297 ?auto_592298 ?auto_592299 ?auto_592300 ?auto_592301 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592337 - BLOCK
      ?auto_592338 - BLOCK
      ?auto_592339 - BLOCK
      ?auto_592340 - BLOCK
      ?auto_592341 - BLOCK
      ?auto_592342 - BLOCK
      ?auto_592343 - BLOCK
      ?auto_592344 - BLOCK
      ?auto_592345 - BLOCK
      ?auto_592346 - BLOCK
      ?auto_592347 - BLOCK
    )
    :vars
    (
      ?auto_592348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592347 ?auto_592348 ) ( ON-TABLE ?auto_592337 ) ( ON ?auto_592338 ?auto_592337 ) ( ON ?auto_592339 ?auto_592338 ) ( ON ?auto_592340 ?auto_592339 ) ( not ( = ?auto_592337 ?auto_592338 ) ) ( not ( = ?auto_592337 ?auto_592339 ) ) ( not ( = ?auto_592337 ?auto_592340 ) ) ( not ( = ?auto_592337 ?auto_592341 ) ) ( not ( = ?auto_592337 ?auto_592342 ) ) ( not ( = ?auto_592337 ?auto_592343 ) ) ( not ( = ?auto_592337 ?auto_592344 ) ) ( not ( = ?auto_592337 ?auto_592345 ) ) ( not ( = ?auto_592337 ?auto_592346 ) ) ( not ( = ?auto_592337 ?auto_592347 ) ) ( not ( = ?auto_592337 ?auto_592348 ) ) ( not ( = ?auto_592338 ?auto_592339 ) ) ( not ( = ?auto_592338 ?auto_592340 ) ) ( not ( = ?auto_592338 ?auto_592341 ) ) ( not ( = ?auto_592338 ?auto_592342 ) ) ( not ( = ?auto_592338 ?auto_592343 ) ) ( not ( = ?auto_592338 ?auto_592344 ) ) ( not ( = ?auto_592338 ?auto_592345 ) ) ( not ( = ?auto_592338 ?auto_592346 ) ) ( not ( = ?auto_592338 ?auto_592347 ) ) ( not ( = ?auto_592338 ?auto_592348 ) ) ( not ( = ?auto_592339 ?auto_592340 ) ) ( not ( = ?auto_592339 ?auto_592341 ) ) ( not ( = ?auto_592339 ?auto_592342 ) ) ( not ( = ?auto_592339 ?auto_592343 ) ) ( not ( = ?auto_592339 ?auto_592344 ) ) ( not ( = ?auto_592339 ?auto_592345 ) ) ( not ( = ?auto_592339 ?auto_592346 ) ) ( not ( = ?auto_592339 ?auto_592347 ) ) ( not ( = ?auto_592339 ?auto_592348 ) ) ( not ( = ?auto_592340 ?auto_592341 ) ) ( not ( = ?auto_592340 ?auto_592342 ) ) ( not ( = ?auto_592340 ?auto_592343 ) ) ( not ( = ?auto_592340 ?auto_592344 ) ) ( not ( = ?auto_592340 ?auto_592345 ) ) ( not ( = ?auto_592340 ?auto_592346 ) ) ( not ( = ?auto_592340 ?auto_592347 ) ) ( not ( = ?auto_592340 ?auto_592348 ) ) ( not ( = ?auto_592341 ?auto_592342 ) ) ( not ( = ?auto_592341 ?auto_592343 ) ) ( not ( = ?auto_592341 ?auto_592344 ) ) ( not ( = ?auto_592341 ?auto_592345 ) ) ( not ( = ?auto_592341 ?auto_592346 ) ) ( not ( = ?auto_592341 ?auto_592347 ) ) ( not ( = ?auto_592341 ?auto_592348 ) ) ( not ( = ?auto_592342 ?auto_592343 ) ) ( not ( = ?auto_592342 ?auto_592344 ) ) ( not ( = ?auto_592342 ?auto_592345 ) ) ( not ( = ?auto_592342 ?auto_592346 ) ) ( not ( = ?auto_592342 ?auto_592347 ) ) ( not ( = ?auto_592342 ?auto_592348 ) ) ( not ( = ?auto_592343 ?auto_592344 ) ) ( not ( = ?auto_592343 ?auto_592345 ) ) ( not ( = ?auto_592343 ?auto_592346 ) ) ( not ( = ?auto_592343 ?auto_592347 ) ) ( not ( = ?auto_592343 ?auto_592348 ) ) ( not ( = ?auto_592344 ?auto_592345 ) ) ( not ( = ?auto_592344 ?auto_592346 ) ) ( not ( = ?auto_592344 ?auto_592347 ) ) ( not ( = ?auto_592344 ?auto_592348 ) ) ( not ( = ?auto_592345 ?auto_592346 ) ) ( not ( = ?auto_592345 ?auto_592347 ) ) ( not ( = ?auto_592345 ?auto_592348 ) ) ( not ( = ?auto_592346 ?auto_592347 ) ) ( not ( = ?auto_592346 ?auto_592348 ) ) ( not ( = ?auto_592347 ?auto_592348 ) ) ( ON ?auto_592346 ?auto_592347 ) ( ON ?auto_592345 ?auto_592346 ) ( ON ?auto_592344 ?auto_592345 ) ( ON ?auto_592343 ?auto_592344 ) ( ON ?auto_592342 ?auto_592343 ) ( CLEAR ?auto_592340 ) ( ON ?auto_592341 ?auto_592342 ) ( CLEAR ?auto_592341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_592337 ?auto_592338 ?auto_592339 ?auto_592340 ?auto_592341 )
      ( MAKE-11PILE ?auto_592337 ?auto_592338 ?auto_592339 ?auto_592340 ?auto_592341 ?auto_592342 ?auto_592343 ?auto_592344 ?auto_592345 ?auto_592346 ?auto_592347 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592383 - BLOCK
      ?auto_592384 - BLOCK
      ?auto_592385 - BLOCK
      ?auto_592386 - BLOCK
      ?auto_592387 - BLOCK
      ?auto_592388 - BLOCK
      ?auto_592389 - BLOCK
      ?auto_592390 - BLOCK
      ?auto_592391 - BLOCK
      ?auto_592392 - BLOCK
      ?auto_592393 - BLOCK
    )
    :vars
    (
      ?auto_592394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592393 ?auto_592394 ) ( ON-TABLE ?auto_592383 ) ( ON ?auto_592384 ?auto_592383 ) ( ON ?auto_592385 ?auto_592384 ) ( not ( = ?auto_592383 ?auto_592384 ) ) ( not ( = ?auto_592383 ?auto_592385 ) ) ( not ( = ?auto_592383 ?auto_592386 ) ) ( not ( = ?auto_592383 ?auto_592387 ) ) ( not ( = ?auto_592383 ?auto_592388 ) ) ( not ( = ?auto_592383 ?auto_592389 ) ) ( not ( = ?auto_592383 ?auto_592390 ) ) ( not ( = ?auto_592383 ?auto_592391 ) ) ( not ( = ?auto_592383 ?auto_592392 ) ) ( not ( = ?auto_592383 ?auto_592393 ) ) ( not ( = ?auto_592383 ?auto_592394 ) ) ( not ( = ?auto_592384 ?auto_592385 ) ) ( not ( = ?auto_592384 ?auto_592386 ) ) ( not ( = ?auto_592384 ?auto_592387 ) ) ( not ( = ?auto_592384 ?auto_592388 ) ) ( not ( = ?auto_592384 ?auto_592389 ) ) ( not ( = ?auto_592384 ?auto_592390 ) ) ( not ( = ?auto_592384 ?auto_592391 ) ) ( not ( = ?auto_592384 ?auto_592392 ) ) ( not ( = ?auto_592384 ?auto_592393 ) ) ( not ( = ?auto_592384 ?auto_592394 ) ) ( not ( = ?auto_592385 ?auto_592386 ) ) ( not ( = ?auto_592385 ?auto_592387 ) ) ( not ( = ?auto_592385 ?auto_592388 ) ) ( not ( = ?auto_592385 ?auto_592389 ) ) ( not ( = ?auto_592385 ?auto_592390 ) ) ( not ( = ?auto_592385 ?auto_592391 ) ) ( not ( = ?auto_592385 ?auto_592392 ) ) ( not ( = ?auto_592385 ?auto_592393 ) ) ( not ( = ?auto_592385 ?auto_592394 ) ) ( not ( = ?auto_592386 ?auto_592387 ) ) ( not ( = ?auto_592386 ?auto_592388 ) ) ( not ( = ?auto_592386 ?auto_592389 ) ) ( not ( = ?auto_592386 ?auto_592390 ) ) ( not ( = ?auto_592386 ?auto_592391 ) ) ( not ( = ?auto_592386 ?auto_592392 ) ) ( not ( = ?auto_592386 ?auto_592393 ) ) ( not ( = ?auto_592386 ?auto_592394 ) ) ( not ( = ?auto_592387 ?auto_592388 ) ) ( not ( = ?auto_592387 ?auto_592389 ) ) ( not ( = ?auto_592387 ?auto_592390 ) ) ( not ( = ?auto_592387 ?auto_592391 ) ) ( not ( = ?auto_592387 ?auto_592392 ) ) ( not ( = ?auto_592387 ?auto_592393 ) ) ( not ( = ?auto_592387 ?auto_592394 ) ) ( not ( = ?auto_592388 ?auto_592389 ) ) ( not ( = ?auto_592388 ?auto_592390 ) ) ( not ( = ?auto_592388 ?auto_592391 ) ) ( not ( = ?auto_592388 ?auto_592392 ) ) ( not ( = ?auto_592388 ?auto_592393 ) ) ( not ( = ?auto_592388 ?auto_592394 ) ) ( not ( = ?auto_592389 ?auto_592390 ) ) ( not ( = ?auto_592389 ?auto_592391 ) ) ( not ( = ?auto_592389 ?auto_592392 ) ) ( not ( = ?auto_592389 ?auto_592393 ) ) ( not ( = ?auto_592389 ?auto_592394 ) ) ( not ( = ?auto_592390 ?auto_592391 ) ) ( not ( = ?auto_592390 ?auto_592392 ) ) ( not ( = ?auto_592390 ?auto_592393 ) ) ( not ( = ?auto_592390 ?auto_592394 ) ) ( not ( = ?auto_592391 ?auto_592392 ) ) ( not ( = ?auto_592391 ?auto_592393 ) ) ( not ( = ?auto_592391 ?auto_592394 ) ) ( not ( = ?auto_592392 ?auto_592393 ) ) ( not ( = ?auto_592392 ?auto_592394 ) ) ( not ( = ?auto_592393 ?auto_592394 ) ) ( ON ?auto_592392 ?auto_592393 ) ( ON ?auto_592391 ?auto_592392 ) ( ON ?auto_592390 ?auto_592391 ) ( ON ?auto_592389 ?auto_592390 ) ( ON ?auto_592388 ?auto_592389 ) ( ON ?auto_592387 ?auto_592388 ) ( CLEAR ?auto_592385 ) ( ON ?auto_592386 ?auto_592387 ) ( CLEAR ?auto_592386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_592383 ?auto_592384 ?auto_592385 ?auto_592386 )
      ( MAKE-11PILE ?auto_592383 ?auto_592384 ?auto_592385 ?auto_592386 ?auto_592387 ?auto_592388 ?auto_592389 ?auto_592390 ?auto_592391 ?auto_592392 ?auto_592393 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592429 - BLOCK
      ?auto_592430 - BLOCK
      ?auto_592431 - BLOCK
      ?auto_592432 - BLOCK
      ?auto_592433 - BLOCK
      ?auto_592434 - BLOCK
      ?auto_592435 - BLOCK
      ?auto_592436 - BLOCK
      ?auto_592437 - BLOCK
      ?auto_592438 - BLOCK
      ?auto_592439 - BLOCK
    )
    :vars
    (
      ?auto_592440 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592439 ?auto_592440 ) ( ON-TABLE ?auto_592429 ) ( ON ?auto_592430 ?auto_592429 ) ( not ( = ?auto_592429 ?auto_592430 ) ) ( not ( = ?auto_592429 ?auto_592431 ) ) ( not ( = ?auto_592429 ?auto_592432 ) ) ( not ( = ?auto_592429 ?auto_592433 ) ) ( not ( = ?auto_592429 ?auto_592434 ) ) ( not ( = ?auto_592429 ?auto_592435 ) ) ( not ( = ?auto_592429 ?auto_592436 ) ) ( not ( = ?auto_592429 ?auto_592437 ) ) ( not ( = ?auto_592429 ?auto_592438 ) ) ( not ( = ?auto_592429 ?auto_592439 ) ) ( not ( = ?auto_592429 ?auto_592440 ) ) ( not ( = ?auto_592430 ?auto_592431 ) ) ( not ( = ?auto_592430 ?auto_592432 ) ) ( not ( = ?auto_592430 ?auto_592433 ) ) ( not ( = ?auto_592430 ?auto_592434 ) ) ( not ( = ?auto_592430 ?auto_592435 ) ) ( not ( = ?auto_592430 ?auto_592436 ) ) ( not ( = ?auto_592430 ?auto_592437 ) ) ( not ( = ?auto_592430 ?auto_592438 ) ) ( not ( = ?auto_592430 ?auto_592439 ) ) ( not ( = ?auto_592430 ?auto_592440 ) ) ( not ( = ?auto_592431 ?auto_592432 ) ) ( not ( = ?auto_592431 ?auto_592433 ) ) ( not ( = ?auto_592431 ?auto_592434 ) ) ( not ( = ?auto_592431 ?auto_592435 ) ) ( not ( = ?auto_592431 ?auto_592436 ) ) ( not ( = ?auto_592431 ?auto_592437 ) ) ( not ( = ?auto_592431 ?auto_592438 ) ) ( not ( = ?auto_592431 ?auto_592439 ) ) ( not ( = ?auto_592431 ?auto_592440 ) ) ( not ( = ?auto_592432 ?auto_592433 ) ) ( not ( = ?auto_592432 ?auto_592434 ) ) ( not ( = ?auto_592432 ?auto_592435 ) ) ( not ( = ?auto_592432 ?auto_592436 ) ) ( not ( = ?auto_592432 ?auto_592437 ) ) ( not ( = ?auto_592432 ?auto_592438 ) ) ( not ( = ?auto_592432 ?auto_592439 ) ) ( not ( = ?auto_592432 ?auto_592440 ) ) ( not ( = ?auto_592433 ?auto_592434 ) ) ( not ( = ?auto_592433 ?auto_592435 ) ) ( not ( = ?auto_592433 ?auto_592436 ) ) ( not ( = ?auto_592433 ?auto_592437 ) ) ( not ( = ?auto_592433 ?auto_592438 ) ) ( not ( = ?auto_592433 ?auto_592439 ) ) ( not ( = ?auto_592433 ?auto_592440 ) ) ( not ( = ?auto_592434 ?auto_592435 ) ) ( not ( = ?auto_592434 ?auto_592436 ) ) ( not ( = ?auto_592434 ?auto_592437 ) ) ( not ( = ?auto_592434 ?auto_592438 ) ) ( not ( = ?auto_592434 ?auto_592439 ) ) ( not ( = ?auto_592434 ?auto_592440 ) ) ( not ( = ?auto_592435 ?auto_592436 ) ) ( not ( = ?auto_592435 ?auto_592437 ) ) ( not ( = ?auto_592435 ?auto_592438 ) ) ( not ( = ?auto_592435 ?auto_592439 ) ) ( not ( = ?auto_592435 ?auto_592440 ) ) ( not ( = ?auto_592436 ?auto_592437 ) ) ( not ( = ?auto_592436 ?auto_592438 ) ) ( not ( = ?auto_592436 ?auto_592439 ) ) ( not ( = ?auto_592436 ?auto_592440 ) ) ( not ( = ?auto_592437 ?auto_592438 ) ) ( not ( = ?auto_592437 ?auto_592439 ) ) ( not ( = ?auto_592437 ?auto_592440 ) ) ( not ( = ?auto_592438 ?auto_592439 ) ) ( not ( = ?auto_592438 ?auto_592440 ) ) ( not ( = ?auto_592439 ?auto_592440 ) ) ( ON ?auto_592438 ?auto_592439 ) ( ON ?auto_592437 ?auto_592438 ) ( ON ?auto_592436 ?auto_592437 ) ( ON ?auto_592435 ?auto_592436 ) ( ON ?auto_592434 ?auto_592435 ) ( ON ?auto_592433 ?auto_592434 ) ( ON ?auto_592432 ?auto_592433 ) ( CLEAR ?auto_592430 ) ( ON ?auto_592431 ?auto_592432 ) ( CLEAR ?auto_592431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_592429 ?auto_592430 ?auto_592431 )
      ( MAKE-11PILE ?auto_592429 ?auto_592430 ?auto_592431 ?auto_592432 ?auto_592433 ?auto_592434 ?auto_592435 ?auto_592436 ?auto_592437 ?auto_592438 ?auto_592439 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592475 - BLOCK
      ?auto_592476 - BLOCK
      ?auto_592477 - BLOCK
      ?auto_592478 - BLOCK
      ?auto_592479 - BLOCK
      ?auto_592480 - BLOCK
      ?auto_592481 - BLOCK
      ?auto_592482 - BLOCK
      ?auto_592483 - BLOCK
      ?auto_592484 - BLOCK
      ?auto_592485 - BLOCK
    )
    :vars
    (
      ?auto_592486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592485 ?auto_592486 ) ( ON-TABLE ?auto_592475 ) ( not ( = ?auto_592475 ?auto_592476 ) ) ( not ( = ?auto_592475 ?auto_592477 ) ) ( not ( = ?auto_592475 ?auto_592478 ) ) ( not ( = ?auto_592475 ?auto_592479 ) ) ( not ( = ?auto_592475 ?auto_592480 ) ) ( not ( = ?auto_592475 ?auto_592481 ) ) ( not ( = ?auto_592475 ?auto_592482 ) ) ( not ( = ?auto_592475 ?auto_592483 ) ) ( not ( = ?auto_592475 ?auto_592484 ) ) ( not ( = ?auto_592475 ?auto_592485 ) ) ( not ( = ?auto_592475 ?auto_592486 ) ) ( not ( = ?auto_592476 ?auto_592477 ) ) ( not ( = ?auto_592476 ?auto_592478 ) ) ( not ( = ?auto_592476 ?auto_592479 ) ) ( not ( = ?auto_592476 ?auto_592480 ) ) ( not ( = ?auto_592476 ?auto_592481 ) ) ( not ( = ?auto_592476 ?auto_592482 ) ) ( not ( = ?auto_592476 ?auto_592483 ) ) ( not ( = ?auto_592476 ?auto_592484 ) ) ( not ( = ?auto_592476 ?auto_592485 ) ) ( not ( = ?auto_592476 ?auto_592486 ) ) ( not ( = ?auto_592477 ?auto_592478 ) ) ( not ( = ?auto_592477 ?auto_592479 ) ) ( not ( = ?auto_592477 ?auto_592480 ) ) ( not ( = ?auto_592477 ?auto_592481 ) ) ( not ( = ?auto_592477 ?auto_592482 ) ) ( not ( = ?auto_592477 ?auto_592483 ) ) ( not ( = ?auto_592477 ?auto_592484 ) ) ( not ( = ?auto_592477 ?auto_592485 ) ) ( not ( = ?auto_592477 ?auto_592486 ) ) ( not ( = ?auto_592478 ?auto_592479 ) ) ( not ( = ?auto_592478 ?auto_592480 ) ) ( not ( = ?auto_592478 ?auto_592481 ) ) ( not ( = ?auto_592478 ?auto_592482 ) ) ( not ( = ?auto_592478 ?auto_592483 ) ) ( not ( = ?auto_592478 ?auto_592484 ) ) ( not ( = ?auto_592478 ?auto_592485 ) ) ( not ( = ?auto_592478 ?auto_592486 ) ) ( not ( = ?auto_592479 ?auto_592480 ) ) ( not ( = ?auto_592479 ?auto_592481 ) ) ( not ( = ?auto_592479 ?auto_592482 ) ) ( not ( = ?auto_592479 ?auto_592483 ) ) ( not ( = ?auto_592479 ?auto_592484 ) ) ( not ( = ?auto_592479 ?auto_592485 ) ) ( not ( = ?auto_592479 ?auto_592486 ) ) ( not ( = ?auto_592480 ?auto_592481 ) ) ( not ( = ?auto_592480 ?auto_592482 ) ) ( not ( = ?auto_592480 ?auto_592483 ) ) ( not ( = ?auto_592480 ?auto_592484 ) ) ( not ( = ?auto_592480 ?auto_592485 ) ) ( not ( = ?auto_592480 ?auto_592486 ) ) ( not ( = ?auto_592481 ?auto_592482 ) ) ( not ( = ?auto_592481 ?auto_592483 ) ) ( not ( = ?auto_592481 ?auto_592484 ) ) ( not ( = ?auto_592481 ?auto_592485 ) ) ( not ( = ?auto_592481 ?auto_592486 ) ) ( not ( = ?auto_592482 ?auto_592483 ) ) ( not ( = ?auto_592482 ?auto_592484 ) ) ( not ( = ?auto_592482 ?auto_592485 ) ) ( not ( = ?auto_592482 ?auto_592486 ) ) ( not ( = ?auto_592483 ?auto_592484 ) ) ( not ( = ?auto_592483 ?auto_592485 ) ) ( not ( = ?auto_592483 ?auto_592486 ) ) ( not ( = ?auto_592484 ?auto_592485 ) ) ( not ( = ?auto_592484 ?auto_592486 ) ) ( not ( = ?auto_592485 ?auto_592486 ) ) ( ON ?auto_592484 ?auto_592485 ) ( ON ?auto_592483 ?auto_592484 ) ( ON ?auto_592482 ?auto_592483 ) ( ON ?auto_592481 ?auto_592482 ) ( ON ?auto_592480 ?auto_592481 ) ( ON ?auto_592479 ?auto_592480 ) ( ON ?auto_592478 ?auto_592479 ) ( ON ?auto_592477 ?auto_592478 ) ( CLEAR ?auto_592475 ) ( ON ?auto_592476 ?auto_592477 ) ( CLEAR ?auto_592476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_592475 ?auto_592476 )
      ( MAKE-11PILE ?auto_592475 ?auto_592476 ?auto_592477 ?auto_592478 ?auto_592479 ?auto_592480 ?auto_592481 ?auto_592482 ?auto_592483 ?auto_592484 ?auto_592485 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_592521 - BLOCK
      ?auto_592522 - BLOCK
      ?auto_592523 - BLOCK
      ?auto_592524 - BLOCK
      ?auto_592525 - BLOCK
      ?auto_592526 - BLOCK
      ?auto_592527 - BLOCK
      ?auto_592528 - BLOCK
      ?auto_592529 - BLOCK
      ?auto_592530 - BLOCK
      ?auto_592531 - BLOCK
    )
    :vars
    (
      ?auto_592532 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592531 ?auto_592532 ) ( not ( = ?auto_592521 ?auto_592522 ) ) ( not ( = ?auto_592521 ?auto_592523 ) ) ( not ( = ?auto_592521 ?auto_592524 ) ) ( not ( = ?auto_592521 ?auto_592525 ) ) ( not ( = ?auto_592521 ?auto_592526 ) ) ( not ( = ?auto_592521 ?auto_592527 ) ) ( not ( = ?auto_592521 ?auto_592528 ) ) ( not ( = ?auto_592521 ?auto_592529 ) ) ( not ( = ?auto_592521 ?auto_592530 ) ) ( not ( = ?auto_592521 ?auto_592531 ) ) ( not ( = ?auto_592521 ?auto_592532 ) ) ( not ( = ?auto_592522 ?auto_592523 ) ) ( not ( = ?auto_592522 ?auto_592524 ) ) ( not ( = ?auto_592522 ?auto_592525 ) ) ( not ( = ?auto_592522 ?auto_592526 ) ) ( not ( = ?auto_592522 ?auto_592527 ) ) ( not ( = ?auto_592522 ?auto_592528 ) ) ( not ( = ?auto_592522 ?auto_592529 ) ) ( not ( = ?auto_592522 ?auto_592530 ) ) ( not ( = ?auto_592522 ?auto_592531 ) ) ( not ( = ?auto_592522 ?auto_592532 ) ) ( not ( = ?auto_592523 ?auto_592524 ) ) ( not ( = ?auto_592523 ?auto_592525 ) ) ( not ( = ?auto_592523 ?auto_592526 ) ) ( not ( = ?auto_592523 ?auto_592527 ) ) ( not ( = ?auto_592523 ?auto_592528 ) ) ( not ( = ?auto_592523 ?auto_592529 ) ) ( not ( = ?auto_592523 ?auto_592530 ) ) ( not ( = ?auto_592523 ?auto_592531 ) ) ( not ( = ?auto_592523 ?auto_592532 ) ) ( not ( = ?auto_592524 ?auto_592525 ) ) ( not ( = ?auto_592524 ?auto_592526 ) ) ( not ( = ?auto_592524 ?auto_592527 ) ) ( not ( = ?auto_592524 ?auto_592528 ) ) ( not ( = ?auto_592524 ?auto_592529 ) ) ( not ( = ?auto_592524 ?auto_592530 ) ) ( not ( = ?auto_592524 ?auto_592531 ) ) ( not ( = ?auto_592524 ?auto_592532 ) ) ( not ( = ?auto_592525 ?auto_592526 ) ) ( not ( = ?auto_592525 ?auto_592527 ) ) ( not ( = ?auto_592525 ?auto_592528 ) ) ( not ( = ?auto_592525 ?auto_592529 ) ) ( not ( = ?auto_592525 ?auto_592530 ) ) ( not ( = ?auto_592525 ?auto_592531 ) ) ( not ( = ?auto_592525 ?auto_592532 ) ) ( not ( = ?auto_592526 ?auto_592527 ) ) ( not ( = ?auto_592526 ?auto_592528 ) ) ( not ( = ?auto_592526 ?auto_592529 ) ) ( not ( = ?auto_592526 ?auto_592530 ) ) ( not ( = ?auto_592526 ?auto_592531 ) ) ( not ( = ?auto_592526 ?auto_592532 ) ) ( not ( = ?auto_592527 ?auto_592528 ) ) ( not ( = ?auto_592527 ?auto_592529 ) ) ( not ( = ?auto_592527 ?auto_592530 ) ) ( not ( = ?auto_592527 ?auto_592531 ) ) ( not ( = ?auto_592527 ?auto_592532 ) ) ( not ( = ?auto_592528 ?auto_592529 ) ) ( not ( = ?auto_592528 ?auto_592530 ) ) ( not ( = ?auto_592528 ?auto_592531 ) ) ( not ( = ?auto_592528 ?auto_592532 ) ) ( not ( = ?auto_592529 ?auto_592530 ) ) ( not ( = ?auto_592529 ?auto_592531 ) ) ( not ( = ?auto_592529 ?auto_592532 ) ) ( not ( = ?auto_592530 ?auto_592531 ) ) ( not ( = ?auto_592530 ?auto_592532 ) ) ( not ( = ?auto_592531 ?auto_592532 ) ) ( ON ?auto_592530 ?auto_592531 ) ( ON ?auto_592529 ?auto_592530 ) ( ON ?auto_592528 ?auto_592529 ) ( ON ?auto_592527 ?auto_592528 ) ( ON ?auto_592526 ?auto_592527 ) ( ON ?auto_592525 ?auto_592526 ) ( ON ?auto_592524 ?auto_592525 ) ( ON ?auto_592523 ?auto_592524 ) ( ON ?auto_592522 ?auto_592523 ) ( ON ?auto_592521 ?auto_592522 ) ( CLEAR ?auto_592521 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_592521 )
      ( MAKE-11PILE ?auto_592521 ?auto_592522 ?auto_592523 ?auto_592524 ?auto_592525 ?auto_592526 ?auto_592527 ?auto_592528 ?auto_592529 ?auto_592530 ?auto_592531 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592568 - BLOCK
      ?auto_592569 - BLOCK
      ?auto_592570 - BLOCK
      ?auto_592571 - BLOCK
      ?auto_592572 - BLOCK
      ?auto_592573 - BLOCK
      ?auto_592574 - BLOCK
      ?auto_592575 - BLOCK
      ?auto_592576 - BLOCK
      ?auto_592577 - BLOCK
      ?auto_592578 - BLOCK
      ?auto_592579 - BLOCK
    )
    :vars
    (
      ?auto_592580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_592578 ) ( ON ?auto_592579 ?auto_592580 ) ( CLEAR ?auto_592579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_592568 ) ( ON ?auto_592569 ?auto_592568 ) ( ON ?auto_592570 ?auto_592569 ) ( ON ?auto_592571 ?auto_592570 ) ( ON ?auto_592572 ?auto_592571 ) ( ON ?auto_592573 ?auto_592572 ) ( ON ?auto_592574 ?auto_592573 ) ( ON ?auto_592575 ?auto_592574 ) ( ON ?auto_592576 ?auto_592575 ) ( ON ?auto_592577 ?auto_592576 ) ( ON ?auto_592578 ?auto_592577 ) ( not ( = ?auto_592568 ?auto_592569 ) ) ( not ( = ?auto_592568 ?auto_592570 ) ) ( not ( = ?auto_592568 ?auto_592571 ) ) ( not ( = ?auto_592568 ?auto_592572 ) ) ( not ( = ?auto_592568 ?auto_592573 ) ) ( not ( = ?auto_592568 ?auto_592574 ) ) ( not ( = ?auto_592568 ?auto_592575 ) ) ( not ( = ?auto_592568 ?auto_592576 ) ) ( not ( = ?auto_592568 ?auto_592577 ) ) ( not ( = ?auto_592568 ?auto_592578 ) ) ( not ( = ?auto_592568 ?auto_592579 ) ) ( not ( = ?auto_592568 ?auto_592580 ) ) ( not ( = ?auto_592569 ?auto_592570 ) ) ( not ( = ?auto_592569 ?auto_592571 ) ) ( not ( = ?auto_592569 ?auto_592572 ) ) ( not ( = ?auto_592569 ?auto_592573 ) ) ( not ( = ?auto_592569 ?auto_592574 ) ) ( not ( = ?auto_592569 ?auto_592575 ) ) ( not ( = ?auto_592569 ?auto_592576 ) ) ( not ( = ?auto_592569 ?auto_592577 ) ) ( not ( = ?auto_592569 ?auto_592578 ) ) ( not ( = ?auto_592569 ?auto_592579 ) ) ( not ( = ?auto_592569 ?auto_592580 ) ) ( not ( = ?auto_592570 ?auto_592571 ) ) ( not ( = ?auto_592570 ?auto_592572 ) ) ( not ( = ?auto_592570 ?auto_592573 ) ) ( not ( = ?auto_592570 ?auto_592574 ) ) ( not ( = ?auto_592570 ?auto_592575 ) ) ( not ( = ?auto_592570 ?auto_592576 ) ) ( not ( = ?auto_592570 ?auto_592577 ) ) ( not ( = ?auto_592570 ?auto_592578 ) ) ( not ( = ?auto_592570 ?auto_592579 ) ) ( not ( = ?auto_592570 ?auto_592580 ) ) ( not ( = ?auto_592571 ?auto_592572 ) ) ( not ( = ?auto_592571 ?auto_592573 ) ) ( not ( = ?auto_592571 ?auto_592574 ) ) ( not ( = ?auto_592571 ?auto_592575 ) ) ( not ( = ?auto_592571 ?auto_592576 ) ) ( not ( = ?auto_592571 ?auto_592577 ) ) ( not ( = ?auto_592571 ?auto_592578 ) ) ( not ( = ?auto_592571 ?auto_592579 ) ) ( not ( = ?auto_592571 ?auto_592580 ) ) ( not ( = ?auto_592572 ?auto_592573 ) ) ( not ( = ?auto_592572 ?auto_592574 ) ) ( not ( = ?auto_592572 ?auto_592575 ) ) ( not ( = ?auto_592572 ?auto_592576 ) ) ( not ( = ?auto_592572 ?auto_592577 ) ) ( not ( = ?auto_592572 ?auto_592578 ) ) ( not ( = ?auto_592572 ?auto_592579 ) ) ( not ( = ?auto_592572 ?auto_592580 ) ) ( not ( = ?auto_592573 ?auto_592574 ) ) ( not ( = ?auto_592573 ?auto_592575 ) ) ( not ( = ?auto_592573 ?auto_592576 ) ) ( not ( = ?auto_592573 ?auto_592577 ) ) ( not ( = ?auto_592573 ?auto_592578 ) ) ( not ( = ?auto_592573 ?auto_592579 ) ) ( not ( = ?auto_592573 ?auto_592580 ) ) ( not ( = ?auto_592574 ?auto_592575 ) ) ( not ( = ?auto_592574 ?auto_592576 ) ) ( not ( = ?auto_592574 ?auto_592577 ) ) ( not ( = ?auto_592574 ?auto_592578 ) ) ( not ( = ?auto_592574 ?auto_592579 ) ) ( not ( = ?auto_592574 ?auto_592580 ) ) ( not ( = ?auto_592575 ?auto_592576 ) ) ( not ( = ?auto_592575 ?auto_592577 ) ) ( not ( = ?auto_592575 ?auto_592578 ) ) ( not ( = ?auto_592575 ?auto_592579 ) ) ( not ( = ?auto_592575 ?auto_592580 ) ) ( not ( = ?auto_592576 ?auto_592577 ) ) ( not ( = ?auto_592576 ?auto_592578 ) ) ( not ( = ?auto_592576 ?auto_592579 ) ) ( not ( = ?auto_592576 ?auto_592580 ) ) ( not ( = ?auto_592577 ?auto_592578 ) ) ( not ( = ?auto_592577 ?auto_592579 ) ) ( not ( = ?auto_592577 ?auto_592580 ) ) ( not ( = ?auto_592578 ?auto_592579 ) ) ( not ( = ?auto_592578 ?auto_592580 ) ) ( not ( = ?auto_592579 ?auto_592580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_592579 ?auto_592580 )
      ( !STACK ?auto_592579 ?auto_592578 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592618 - BLOCK
      ?auto_592619 - BLOCK
      ?auto_592620 - BLOCK
      ?auto_592621 - BLOCK
      ?auto_592622 - BLOCK
      ?auto_592623 - BLOCK
      ?auto_592624 - BLOCK
      ?auto_592625 - BLOCK
      ?auto_592626 - BLOCK
      ?auto_592627 - BLOCK
      ?auto_592628 - BLOCK
      ?auto_592629 - BLOCK
    )
    :vars
    (
      ?auto_592630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592629 ?auto_592630 ) ( ON-TABLE ?auto_592618 ) ( ON ?auto_592619 ?auto_592618 ) ( ON ?auto_592620 ?auto_592619 ) ( ON ?auto_592621 ?auto_592620 ) ( ON ?auto_592622 ?auto_592621 ) ( ON ?auto_592623 ?auto_592622 ) ( ON ?auto_592624 ?auto_592623 ) ( ON ?auto_592625 ?auto_592624 ) ( ON ?auto_592626 ?auto_592625 ) ( ON ?auto_592627 ?auto_592626 ) ( not ( = ?auto_592618 ?auto_592619 ) ) ( not ( = ?auto_592618 ?auto_592620 ) ) ( not ( = ?auto_592618 ?auto_592621 ) ) ( not ( = ?auto_592618 ?auto_592622 ) ) ( not ( = ?auto_592618 ?auto_592623 ) ) ( not ( = ?auto_592618 ?auto_592624 ) ) ( not ( = ?auto_592618 ?auto_592625 ) ) ( not ( = ?auto_592618 ?auto_592626 ) ) ( not ( = ?auto_592618 ?auto_592627 ) ) ( not ( = ?auto_592618 ?auto_592628 ) ) ( not ( = ?auto_592618 ?auto_592629 ) ) ( not ( = ?auto_592618 ?auto_592630 ) ) ( not ( = ?auto_592619 ?auto_592620 ) ) ( not ( = ?auto_592619 ?auto_592621 ) ) ( not ( = ?auto_592619 ?auto_592622 ) ) ( not ( = ?auto_592619 ?auto_592623 ) ) ( not ( = ?auto_592619 ?auto_592624 ) ) ( not ( = ?auto_592619 ?auto_592625 ) ) ( not ( = ?auto_592619 ?auto_592626 ) ) ( not ( = ?auto_592619 ?auto_592627 ) ) ( not ( = ?auto_592619 ?auto_592628 ) ) ( not ( = ?auto_592619 ?auto_592629 ) ) ( not ( = ?auto_592619 ?auto_592630 ) ) ( not ( = ?auto_592620 ?auto_592621 ) ) ( not ( = ?auto_592620 ?auto_592622 ) ) ( not ( = ?auto_592620 ?auto_592623 ) ) ( not ( = ?auto_592620 ?auto_592624 ) ) ( not ( = ?auto_592620 ?auto_592625 ) ) ( not ( = ?auto_592620 ?auto_592626 ) ) ( not ( = ?auto_592620 ?auto_592627 ) ) ( not ( = ?auto_592620 ?auto_592628 ) ) ( not ( = ?auto_592620 ?auto_592629 ) ) ( not ( = ?auto_592620 ?auto_592630 ) ) ( not ( = ?auto_592621 ?auto_592622 ) ) ( not ( = ?auto_592621 ?auto_592623 ) ) ( not ( = ?auto_592621 ?auto_592624 ) ) ( not ( = ?auto_592621 ?auto_592625 ) ) ( not ( = ?auto_592621 ?auto_592626 ) ) ( not ( = ?auto_592621 ?auto_592627 ) ) ( not ( = ?auto_592621 ?auto_592628 ) ) ( not ( = ?auto_592621 ?auto_592629 ) ) ( not ( = ?auto_592621 ?auto_592630 ) ) ( not ( = ?auto_592622 ?auto_592623 ) ) ( not ( = ?auto_592622 ?auto_592624 ) ) ( not ( = ?auto_592622 ?auto_592625 ) ) ( not ( = ?auto_592622 ?auto_592626 ) ) ( not ( = ?auto_592622 ?auto_592627 ) ) ( not ( = ?auto_592622 ?auto_592628 ) ) ( not ( = ?auto_592622 ?auto_592629 ) ) ( not ( = ?auto_592622 ?auto_592630 ) ) ( not ( = ?auto_592623 ?auto_592624 ) ) ( not ( = ?auto_592623 ?auto_592625 ) ) ( not ( = ?auto_592623 ?auto_592626 ) ) ( not ( = ?auto_592623 ?auto_592627 ) ) ( not ( = ?auto_592623 ?auto_592628 ) ) ( not ( = ?auto_592623 ?auto_592629 ) ) ( not ( = ?auto_592623 ?auto_592630 ) ) ( not ( = ?auto_592624 ?auto_592625 ) ) ( not ( = ?auto_592624 ?auto_592626 ) ) ( not ( = ?auto_592624 ?auto_592627 ) ) ( not ( = ?auto_592624 ?auto_592628 ) ) ( not ( = ?auto_592624 ?auto_592629 ) ) ( not ( = ?auto_592624 ?auto_592630 ) ) ( not ( = ?auto_592625 ?auto_592626 ) ) ( not ( = ?auto_592625 ?auto_592627 ) ) ( not ( = ?auto_592625 ?auto_592628 ) ) ( not ( = ?auto_592625 ?auto_592629 ) ) ( not ( = ?auto_592625 ?auto_592630 ) ) ( not ( = ?auto_592626 ?auto_592627 ) ) ( not ( = ?auto_592626 ?auto_592628 ) ) ( not ( = ?auto_592626 ?auto_592629 ) ) ( not ( = ?auto_592626 ?auto_592630 ) ) ( not ( = ?auto_592627 ?auto_592628 ) ) ( not ( = ?auto_592627 ?auto_592629 ) ) ( not ( = ?auto_592627 ?auto_592630 ) ) ( not ( = ?auto_592628 ?auto_592629 ) ) ( not ( = ?auto_592628 ?auto_592630 ) ) ( not ( = ?auto_592629 ?auto_592630 ) ) ( CLEAR ?auto_592627 ) ( ON ?auto_592628 ?auto_592629 ) ( CLEAR ?auto_592628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_592618 ?auto_592619 ?auto_592620 ?auto_592621 ?auto_592622 ?auto_592623 ?auto_592624 ?auto_592625 ?auto_592626 ?auto_592627 ?auto_592628 )
      ( MAKE-12PILE ?auto_592618 ?auto_592619 ?auto_592620 ?auto_592621 ?auto_592622 ?auto_592623 ?auto_592624 ?auto_592625 ?auto_592626 ?auto_592627 ?auto_592628 ?auto_592629 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592668 - BLOCK
      ?auto_592669 - BLOCK
      ?auto_592670 - BLOCK
      ?auto_592671 - BLOCK
      ?auto_592672 - BLOCK
      ?auto_592673 - BLOCK
      ?auto_592674 - BLOCK
      ?auto_592675 - BLOCK
      ?auto_592676 - BLOCK
      ?auto_592677 - BLOCK
      ?auto_592678 - BLOCK
      ?auto_592679 - BLOCK
    )
    :vars
    (
      ?auto_592680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592679 ?auto_592680 ) ( ON-TABLE ?auto_592668 ) ( ON ?auto_592669 ?auto_592668 ) ( ON ?auto_592670 ?auto_592669 ) ( ON ?auto_592671 ?auto_592670 ) ( ON ?auto_592672 ?auto_592671 ) ( ON ?auto_592673 ?auto_592672 ) ( ON ?auto_592674 ?auto_592673 ) ( ON ?auto_592675 ?auto_592674 ) ( ON ?auto_592676 ?auto_592675 ) ( not ( = ?auto_592668 ?auto_592669 ) ) ( not ( = ?auto_592668 ?auto_592670 ) ) ( not ( = ?auto_592668 ?auto_592671 ) ) ( not ( = ?auto_592668 ?auto_592672 ) ) ( not ( = ?auto_592668 ?auto_592673 ) ) ( not ( = ?auto_592668 ?auto_592674 ) ) ( not ( = ?auto_592668 ?auto_592675 ) ) ( not ( = ?auto_592668 ?auto_592676 ) ) ( not ( = ?auto_592668 ?auto_592677 ) ) ( not ( = ?auto_592668 ?auto_592678 ) ) ( not ( = ?auto_592668 ?auto_592679 ) ) ( not ( = ?auto_592668 ?auto_592680 ) ) ( not ( = ?auto_592669 ?auto_592670 ) ) ( not ( = ?auto_592669 ?auto_592671 ) ) ( not ( = ?auto_592669 ?auto_592672 ) ) ( not ( = ?auto_592669 ?auto_592673 ) ) ( not ( = ?auto_592669 ?auto_592674 ) ) ( not ( = ?auto_592669 ?auto_592675 ) ) ( not ( = ?auto_592669 ?auto_592676 ) ) ( not ( = ?auto_592669 ?auto_592677 ) ) ( not ( = ?auto_592669 ?auto_592678 ) ) ( not ( = ?auto_592669 ?auto_592679 ) ) ( not ( = ?auto_592669 ?auto_592680 ) ) ( not ( = ?auto_592670 ?auto_592671 ) ) ( not ( = ?auto_592670 ?auto_592672 ) ) ( not ( = ?auto_592670 ?auto_592673 ) ) ( not ( = ?auto_592670 ?auto_592674 ) ) ( not ( = ?auto_592670 ?auto_592675 ) ) ( not ( = ?auto_592670 ?auto_592676 ) ) ( not ( = ?auto_592670 ?auto_592677 ) ) ( not ( = ?auto_592670 ?auto_592678 ) ) ( not ( = ?auto_592670 ?auto_592679 ) ) ( not ( = ?auto_592670 ?auto_592680 ) ) ( not ( = ?auto_592671 ?auto_592672 ) ) ( not ( = ?auto_592671 ?auto_592673 ) ) ( not ( = ?auto_592671 ?auto_592674 ) ) ( not ( = ?auto_592671 ?auto_592675 ) ) ( not ( = ?auto_592671 ?auto_592676 ) ) ( not ( = ?auto_592671 ?auto_592677 ) ) ( not ( = ?auto_592671 ?auto_592678 ) ) ( not ( = ?auto_592671 ?auto_592679 ) ) ( not ( = ?auto_592671 ?auto_592680 ) ) ( not ( = ?auto_592672 ?auto_592673 ) ) ( not ( = ?auto_592672 ?auto_592674 ) ) ( not ( = ?auto_592672 ?auto_592675 ) ) ( not ( = ?auto_592672 ?auto_592676 ) ) ( not ( = ?auto_592672 ?auto_592677 ) ) ( not ( = ?auto_592672 ?auto_592678 ) ) ( not ( = ?auto_592672 ?auto_592679 ) ) ( not ( = ?auto_592672 ?auto_592680 ) ) ( not ( = ?auto_592673 ?auto_592674 ) ) ( not ( = ?auto_592673 ?auto_592675 ) ) ( not ( = ?auto_592673 ?auto_592676 ) ) ( not ( = ?auto_592673 ?auto_592677 ) ) ( not ( = ?auto_592673 ?auto_592678 ) ) ( not ( = ?auto_592673 ?auto_592679 ) ) ( not ( = ?auto_592673 ?auto_592680 ) ) ( not ( = ?auto_592674 ?auto_592675 ) ) ( not ( = ?auto_592674 ?auto_592676 ) ) ( not ( = ?auto_592674 ?auto_592677 ) ) ( not ( = ?auto_592674 ?auto_592678 ) ) ( not ( = ?auto_592674 ?auto_592679 ) ) ( not ( = ?auto_592674 ?auto_592680 ) ) ( not ( = ?auto_592675 ?auto_592676 ) ) ( not ( = ?auto_592675 ?auto_592677 ) ) ( not ( = ?auto_592675 ?auto_592678 ) ) ( not ( = ?auto_592675 ?auto_592679 ) ) ( not ( = ?auto_592675 ?auto_592680 ) ) ( not ( = ?auto_592676 ?auto_592677 ) ) ( not ( = ?auto_592676 ?auto_592678 ) ) ( not ( = ?auto_592676 ?auto_592679 ) ) ( not ( = ?auto_592676 ?auto_592680 ) ) ( not ( = ?auto_592677 ?auto_592678 ) ) ( not ( = ?auto_592677 ?auto_592679 ) ) ( not ( = ?auto_592677 ?auto_592680 ) ) ( not ( = ?auto_592678 ?auto_592679 ) ) ( not ( = ?auto_592678 ?auto_592680 ) ) ( not ( = ?auto_592679 ?auto_592680 ) ) ( ON ?auto_592678 ?auto_592679 ) ( CLEAR ?auto_592676 ) ( ON ?auto_592677 ?auto_592678 ) ( CLEAR ?auto_592677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_592668 ?auto_592669 ?auto_592670 ?auto_592671 ?auto_592672 ?auto_592673 ?auto_592674 ?auto_592675 ?auto_592676 ?auto_592677 )
      ( MAKE-12PILE ?auto_592668 ?auto_592669 ?auto_592670 ?auto_592671 ?auto_592672 ?auto_592673 ?auto_592674 ?auto_592675 ?auto_592676 ?auto_592677 ?auto_592678 ?auto_592679 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592718 - BLOCK
      ?auto_592719 - BLOCK
      ?auto_592720 - BLOCK
      ?auto_592721 - BLOCK
      ?auto_592722 - BLOCK
      ?auto_592723 - BLOCK
      ?auto_592724 - BLOCK
      ?auto_592725 - BLOCK
      ?auto_592726 - BLOCK
      ?auto_592727 - BLOCK
      ?auto_592728 - BLOCK
      ?auto_592729 - BLOCK
    )
    :vars
    (
      ?auto_592730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592729 ?auto_592730 ) ( ON-TABLE ?auto_592718 ) ( ON ?auto_592719 ?auto_592718 ) ( ON ?auto_592720 ?auto_592719 ) ( ON ?auto_592721 ?auto_592720 ) ( ON ?auto_592722 ?auto_592721 ) ( ON ?auto_592723 ?auto_592722 ) ( ON ?auto_592724 ?auto_592723 ) ( ON ?auto_592725 ?auto_592724 ) ( not ( = ?auto_592718 ?auto_592719 ) ) ( not ( = ?auto_592718 ?auto_592720 ) ) ( not ( = ?auto_592718 ?auto_592721 ) ) ( not ( = ?auto_592718 ?auto_592722 ) ) ( not ( = ?auto_592718 ?auto_592723 ) ) ( not ( = ?auto_592718 ?auto_592724 ) ) ( not ( = ?auto_592718 ?auto_592725 ) ) ( not ( = ?auto_592718 ?auto_592726 ) ) ( not ( = ?auto_592718 ?auto_592727 ) ) ( not ( = ?auto_592718 ?auto_592728 ) ) ( not ( = ?auto_592718 ?auto_592729 ) ) ( not ( = ?auto_592718 ?auto_592730 ) ) ( not ( = ?auto_592719 ?auto_592720 ) ) ( not ( = ?auto_592719 ?auto_592721 ) ) ( not ( = ?auto_592719 ?auto_592722 ) ) ( not ( = ?auto_592719 ?auto_592723 ) ) ( not ( = ?auto_592719 ?auto_592724 ) ) ( not ( = ?auto_592719 ?auto_592725 ) ) ( not ( = ?auto_592719 ?auto_592726 ) ) ( not ( = ?auto_592719 ?auto_592727 ) ) ( not ( = ?auto_592719 ?auto_592728 ) ) ( not ( = ?auto_592719 ?auto_592729 ) ) ( not ( = ?auto_592719 ?auto_592730 ) ) ( not ( = ?auto_592720 ?auto_592721 ) ) ( not ( = ?auto_592720 ?auto_592722 ) ) ( not ( = ?auto_592720 ?auto_592723 ) ) ( not ( = ?auto_592720 ?auto_592724 ) ) ( not ( = ?auto_592720 ?auto_592725 ) ) ( not ( = ?auto_592720 ?auto_592726 ) ) ( not ( = ?auto_592720 ?auto_592727 ) ) ( not ( = ?auto_592720 ?auto_592728 ) ) ( not ( = ?auto_592720 ?auto_592729 ) ) ( not ( = ?auto_592720 ?auto_592730 ) ) ( not ( = ?auto_592721 ?auto_592722 ) ) ( not ( = ?auto_592721 ?auto_592723 ) ) ( not ( = ?auto_592721 ?auto_592724 ) ) ( not ( = ?auto_592721 ?auto_592725 ) ) ( not ( = ?auto_592721 ?auto_592726 ) ) ( not ( = ?auto_592721 ?auto_592727 ) ) ( not ( = ?auto_592721 ?auto_592728 ) ) ( not ( = ?auto_592721 ?auto_592729 ) ) ( not ( = ?auto_592721 ?auto_592730 ) ) ( not ( = ?auto_592722 ?auto_592723 ) ) ( not ( = ?auto_592722 ?auto_592724 ) ) ( not ( = ?auto_592722 ?auto_592725 ) ) ( not ( = ?auto_592722 ?auto_592726 ) ) ( not ( = ?auto_592722 ?auto_592727 ) ) ( not ( = ?auto_592722 ?auto_592728 ) ) ( not ( = ?auto_592722 ?auto_592729 ) ) ( not ( = ?auto_592722 ?auto_592730 ) ) ( not ( = ?auto_592723 ?auto_592724 ) ) ( not ( = ?auto_592723 ?auto_592725 ) ) ( not ( = ?auto_592723 ?auto_592726 ) ) ( not ( = ?auto_592723 ?auto_592727 ) ) ( not ( = ?auto_592723 ?auto_592728 ) ) ( not ( = ?auto_592723 ?auto_592729 ) ) ( not ( = ?auto_592723 ?auto_592730 ) ) ( not ( = ?auto_592724 ?auto_592725 ) ) ( not ( = ?auto_592724 ?auto_592726 ) ) ( not ( = ?auto_592724 ?auto_592727 ) ) ( not ( = ?auto_592724 ?auto_592728 ) ) ( not ( = ?auto_592724 ?auto_592729 ) ) ( not ( = ?auto_592724 ?auto_592730 ) ) ( not ( = ?auto_592725 ?auto_592726 ) ) ( not ( = ?auto_592725 ?auto_592727 ) ) ( not ( = ?auto_592725 ?auto_592728 ) ) ( not ( = ?auto_592725 ?auto_592729 ) ) ( not ( = ?auto_592725 ?auto_592730 ) ) ( not ( = ?auto_592726 ?auto_592727 ) ) ( not ( = ?auto_592726 ?auto_592728 ) ) ( not ( = ?auto_592726 ?auto_592729 ) ) ( not ( = ?auto_592726 ?auto_592730 ) ) ( not ( = ?auto_592727 ?auto_592728 ) ) ( not ( = ?auto_592727 ?auto_592729 ) ) ( not ( = ?auto_592727 ?auto_592730 ) ) ( not ( = ?auto_592728 ?auto_592729 ) ) ( not ( = ?auto_592728 ?auto_592730 ) ) ( not ( = ?auto_592729 ?auto_592730 ) ) ( ON ?auto_592728 ?auto_592729 ) ( ON ?auto_592727 ?auto_592728 ) ( CLEAR ?auto_592725 ) ( ON ?auto_592726 ?auto_592727 ) ( CLEAR ?auto_592726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_592718 ?auto_592719 ?auto_592720 ?auto_592721 ?auto_592722 ?auto_592723 ?auto_592724 ?auto_592725 ?auto_592726 )
      ( MAKE-12PILE ?auto_592718 ?auto_592719 ?auto_592720 ?auto_592721 ?auto_592722 ?auto_592723 ?auto_592724 ?auto_592725 ?auto_592726 ?auto_592727 ?auto_592728 ?auto_592729 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592768 - BLOCK
      ?auto_592769 - BLOCK
      ?auto_592770 - BLOCK
      ?auto_592771 - BLOCK
      ?auto_592772 - BLOCK
      ?auto_592773 - BLOCK
      ?auto_592774 - BLOCK
      ?auto_592775 - BLOCK
      ?auto_592776 - BLOCK
      ?auto_592777 - BLOCK
      ?auto_592778 - BLOCK
      ?auto_592779 - BLOCK
    )
    :vars
    (
      ?auto_592780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592779 ?auto_592780 ) ( ON-TABLE ?auto_592768 ) ( ON ?auto_592769 ?auto_592768 ) ( ON ?auto_592770 ?auto_592769 ) ( ON ?auto_592771 ?auto_592770 ) ( ON ?auto_592772 ?auto_592771 ) ( ON ?auto_592773 ?auto_592772 ) ( ON ?auto_592774 ?auto_592773 ) ( not ( = ?auto_592768 ?auto_592769 ) ) ( not ( = ?auto_592768 ?auto_592770 ) ) ( not ( = ?auto_592768 ?auto_592771 ) ) ( not ( = ?auto_592768 ?auto_592772 ) ) ( not ( = ?auto_592768 ?auto_592773 ) ) ( not ( = ?auto_592768 ?auto_592774 ) ) ( not ( = ?auto_592768 ?auto_592775 ) ) ( not ( = ?auto_592768 ?auto_592776 ) ) ( not ( = ?auto_592768 ?auto_592777 ) ) ( not ( = ?auto_592768 ?auto_592778 ) ) ( not ( = ?auto_592768 ?auto_592779 ) ) ( not ( = ?auto_592768 ?auto_592780 ) ) ( not ( = ?auto_592769 ?auto_592770 ) ) ( not ( = ?auto_592769 ?auto_592771 ) ) ( not ( = ?auto_592769 ?auto_592772 ) ) ( not ( = ?auto_592769 ?auto_592773 ) ) ( not ( = ?auto_592769 ?auto_592774 ) ) ( not ( = ?auto_592769 ?auto_592775 ) ) ( not ( = ?auto_592769 ?auto_592776 ) ) ( not ( = ?auto_592769 ?auto_592777 ) ) ( not ( = ?auto_592769 ?auto_592778 ) ) ( not ( = ?auto_592769 ?auto_592779 ) ) ( not ( = ?auto_592769 ?auto_592780 ) ) ( not ( = ?auto_592770 ?auto_592771 ) ) ( not ( = ?auto_592770 ?auto_592772 ) ) ( not ( = ?auto_592770 ?auto_592773 ) ) ( not ( = ?auto_592770 ?auto_592774 ) ) ( not ( = ?auto_592770 ?auto_592775 ) ) ( not ( = ?auto_592770 ?auto_592776 ) ) ( not ( = ?auto_592770 ?auto_592777 ) ) ( not ( = ?auto_592770 ?auto_592778 ) ) ( not ( = ?auto_592770 ?auto_592779 ) ) ( not ( = ?auto_592770 ?auto_592780 ) ) ( not ( = ?auto_592771 ?auto_592772 ) ) ( not ( = ?auto_592771 ?auto_592773 ) ) ( not ( = ?auto_592771 ?auto_592774 ) ) ( not ( = ?auto_592771 ?auto_592775 ) ) ( not ( = ?auto_592771 ?auto_592776 ) ) ( not ( = ?auto_592771 ?auto_592777 ) ) ( not ( = ?auto_592771 ?auto_592778 ) ) ( not ( = ?auto_592771 ?auto_592779 ) ) ( not ( = ?auto_592771 ?auto_592780 ) ) ( not ( = ?auto_592772 ?auto_592773 ) ) ( not ( = ?auto_592772 ?auto_592774 ) ) ( not ( = ?auto_592772 ?auto_592775 ) ) ( not ( = ?auto_592772 ?auto_592776 ) ) ( not ( = ?auto_592772 ?auto_592777 ) ) ( not ( = ?auto_592772 ?auto_592778 ) ) ( not ( = ?auto_592772 ?auto_592779 ) ) ( not ( = ?auto_592772 ?auto_592780 ) ) ( not ( = ?auto_592773 ?auto_592774 ) ) ( not ( = ?auto_592773 ?auto_592775 ) ) ( not ( = ?auto_592773 ?auto_592776 ) ) ( not ( = ?auto_592773 ?auto_592777 ) ) ( not ( = ?auto_592773 ?auto_592778 ) ) ( not ( = ?auto_592773 ?auto_592779 ) ) ( not ( = ?auto_592773 ?auto_592780 ) ) ( not ( = ?auto_592774 ?auto_592775 ) ) ( not ( = ?auto_592774 ?auto_592776 ) ) ( not ( = ?auto_592774 ?auto_592777 ) ) ( not ( = ?auto_592774 ?auto_592778 ) ) ( not ( = ?auto_592774 ?auto_592779 ) ) ( not ( = ?auto_592774 ?auto_592780 ) ) ( not ( = ?auto_592775 ?auto_592776 ) ) ( not ( = ?auto_592775 ?auto_592777 ) ) ( not ( = ?auto_592775 ?auto_592778 ) ) ( not ( = ?auto_592775 ?auto_592779 ) ) ( not ( = ?auto_592775 ?auto_592780 ) ) ( not ( = ?auto_592776 ?auto_592777 ) ) ( not ( = ?auto_592776 ?auto_592778 ) ) ( not ( = ?auto_592776 ?auto_592779 ) ) ( not ( = ?auto_592776 ?auto_592780 ) ) ( not ( = ?auto_592777 ?auto_592778 ) ) ( not ( = ?auto_592777 ?auto_592779 ) ) ( not ( = ?auto_592777 ?auto_592780 ) ) ( not ( = ?auto_592778 ?auto_592779 ) ) ( not ( = ?auto_592778 ?auto_592780 ) ) ( not ( = ?auto_592779 ?auto_592780 ) ) ( ON ?auto_592778 ?auto_592779 ) ( ON ?auto_592777 ?auto_592778 ) ( ON ?auto_592776 ?auto_592777 ) ( CLEAR ?auto_592774 ) ( ON ?auto_592775 ?auto_592776 ) ( CLEAR ?auto_592775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_592768 ?auto_592769 ?auto_592770 ?auto_592771 ?auto_592772 ?auto_592773 ?auto_592774 ?auto_592775 )
      ( MAKE-12PILE ?auto_592768 ?auto_592769 ?auto_592770 ?auto_592771 ?auto_592772 ?auto_592773 ?auto_592774 ?auto_592775 ?auto_592776 ?auto_592777 ?auto_592778 ?auto_592779 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592818 - BLOCK
      ?auto_592819 - BLOCK
      ?auto_592820 - BLOCK
      ?auto_592821 - BLOCK
      ?auto_592822 - BLOCK
      ?auto_592823 - BLOCK
      ?auto_592824 - BLOCK
      ?auto_592825 - BLOCK
      ?auto_592826 - BLOCK
      ?auto_592827 - BLOCK
      ?auto_592828 - BLOCK
      ?auto_592829 - BLOCK
    )
    :vars
    (
      ?auto_592830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592829 ?auto_592830 ) ( ON-TABLE ?auto_592818 ) ( ON ?auto_592819 ?auto_592818 ) ( ON ?auto_592820 ?auto_592819 ) ( ON ?auto_592821 ?auto_592820 ) ( ON ?auto_592822 ?auto_592821 ) ( ON ?auto_592823 ?auto_592822 ) ( not ( = ?auto_592818 ?auto_592819 ) ) ( not ( = ?auto_592818 ?auto_592820 ) ) ( not ( = ?auto_592818 ?auto_592821 ) ) ( not ( = ?auto_592818 ?auto_592822 ) ) ( not ( = ?auto_592818 ?auto_592823 ) ) ( not ( = ?auto_592818 ?auto_592824 ) ) ( not ( = ?auto_592818 ?auto_592825 ) ) ( not ( = ?auto_592818 ?auto_592826 ) ) ( not ( = ?auto_592818 ?auto_592827 ) ) ( not ( = ?auto_592818 ?auto_592828 ) ) ( not ( = ?auto_592818 ?auto_592829 ) ) ( not ( = ?auto_592818 ?auto_592830 ) ) ( not ( = ?auto_592819 ?auto_592820 ) ) ( not ( = ?auto_592819 ?auto_592821 ) ) ( not ( = ?auto_592819 ?auto_592822 ) ) ( not ( = ?auto_592819 ?auto_592823 ) ) ( not ( = ?auto_592819 ?auto_592824 ) ) ( not ( = ?auto_592819 ?auto_592825 ) ) ( not ( = ?auto_592819 ?auto_592826 ) ) ( not ( = ?auto_592819 ?auto_592827 ) ) ( not ( = ?auto_592819 ?auto_592828 ) ) ( not ( = ?auto_592819 ?auto_592829 ) ) ( not ( = ?auto_592819 ?auto_592830 ) ) ( not ( = ?auto_592820 ?auto_592821 ) ) ( not ( = ?auto_592820 ?auto_592822 ) ) ( not ( = ?auto_592820 ?auto_592823 ) ) ( not ( = ?auto_592820 ?auto_592824 ) ) ( not ( = ?auto_592820 ?auto_592825 ) ) ( not ( = ?auto_592820 ?auto_592826 ) ) ( not ( = ?auto_592820 ?auto_592827 ) ) ( not ( = ?auto_592820 ?auto_592828 ) ) ( not ( = ?auto_592820 ?auto_592829 ) ) ( not ( = ?auto_592820 ?auto_592830 ) ) ( not ( = ?auto_592821 ?auto_592822 ) ) ( not ( = ?auto_592821 ?auto_592823 ) ) ( not ( = ?auto_592821 ?auto_592824 ) ) ( not ( = ?auto_592821 ?auto_592825 ) ) ( not ( = ?auto_592821 ?auto_592826 ) ) ( not ( = ?auto_592821 ?auto_592827 ) ) ( not ( = ?auto_592821 ?auto_592828 ) ) ( not ( = ?auto_592821 ?auto_592829 ) ) ( not ( = ?auto_592821 ?auto_592830 ) ) ( not ( = ?auto_592822 ?auto_592823 ) ) ( not ( = ?auto_592822 ?auto_592824 ) ) ( not ( = ?auto_592822 ?auto_592825 ) ) ( not ( = ?auto_592822 ?auto_592826 ) ) ( not ( = ?auto_592822 ?auto_592827 ) ) ( not ( = ?auto_592822 ?auto_592828 ) ) ( not ( = ?auto_592822 ?auto_592829 ) ) ( not ( = ?auto_592822 ?auto_592830 ) ) ( not ( = ?auto_592823 ?auto_592824 ) ) ( not ( = ?auto_592823 ?auto_592825 ) ) ( not ( = ?auto_592823 ?auto_592826 ) ) ( not ( = ?auto_592823 ?auto_592827 ) ) ( not ( = ?auto_592823 ?auto_592828 ) ) ( not ( = ?auto_592823 ?auto_592829 ) ) ( not ( = ?auto_592823 ?auto_592830 ) ) ( not ( = ?auto_592824 ?auto_592825 ) ) ( not ( = ?auto_592824 ?auto_592826 ) ) ( not ( = ?auto_592824 ?auto_592827 ) ) ( not ( = ?auto_592824 ?auto_592828 ) ) ( not ( = ?auto_592824 ?auto_592829 ) ) ( not ( = ?auto_592824 ?auto_592830 ) ) ( not ( = ?auto_592825 ?auto_592826 ) ) ( not ( = ?auto_592825 ?auto_592827 ) ) ( not ( = ?auto_592825 ?auto_592828 ) ) ( not ( = ?auto_592825 ?auto_592829 ) ) ( not ( = ?auto_592825 ?auto_592830 ) ) ( not ( = ?auto_592826 ?auto_592827 ) ) ( not ( = ?auto_592826 ?auto_592828 ) ) ( not ( = ?auto_592826 ?auto_592829 ) ) ( not ( = ?auto_592826 ?auto_592830 ) ) ( not ( = ?auto_592827 ?auto_592828 ) ) ( not ( = ?auto_592827 ?auto_592829 ) ) ( not ( = ?auto_592827 ?auto_592830 ) ) ( not ( = ?auto_592828 ?auto_592829 ) ) ( not ( = ?auto_592828 ?auto_592830 ) ) ( not ( = ?auto_592829 ?auto_592830 ) ) ( ON ?auto_592828 ?auto_592829 ) ( ON ?auto_592827 ?auto_592828 ) ( ON ?auto_592826 ?auto_592827 ) ( ON ?auto_592825 ?auto_592826 ) ( CLEAR ?auto_592823 ) ( ON ?auto_592824 ?auto_592825 ) ( CLEAR ?auto_592824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_592818 ?auto_592819 ?auto_592820 ?auto_592821 ?auto_592822 ?auto_592823 ?auto_592824 )
      ( MAKE-12PILE ?auto_592818 ?auto_592819 ?auto_592820 ?auto_592821 ?auto_592822 ?auto_592823 ?auto_592824 ?auto_592825 ?auto_592826 ?auto_592827 ?auto_592828 ?auto_592829 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592868 - BLOCK
      ?auto_592869 - BLOCK
      ?auto_592870 - BLOCK
      ?auto_592871 - BLOCK
      ?auto_592872 - BLOCK
      ?auto_592873 - BLOCK
      ?auto_592874 - BLOCK
      ?auto_592875 - BLOCK
      ?auto_592876 - BLOCK
      ?auto_592877 - BLOCK
      ?auto_592878 - BLOCK
      ?auto_592879 - BLOCK
    )
    :vars
    (
      ?auto_592880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592879 ?auto_592880 ) ( ON-TABLE ?auto_592868 ) ( ON ?auto_592869 ?auto_592868 ) ( ON ?auto_592870 ?auto_592869 ) ( ON ?auto_592871 ?auto_592870 ) ( ON ?auto_592872 ?auto_592871 ) ( not ( = ?auto_592868 ?auto_592869 ) ) ( not ( = ?auto_592868 ?auto_592870 ) ) ( not ( = ?auto_592868 ?auto_592871 ) ) ( not ( = ?auto_592868 ?auto_592872 ) ) ( not ( = ?auto_592868 ?auto_592873 ) ) ( not ( = ?auto_592868 ?auto_592874 ) ) ( not ( = ?auto_592868 ?auto_592875 ) ) ( not ( = ?auto_592868 ?auto_592876 ) ) ( not ( = ?auto_592868 ?auto_592877 ) ) ( not ( = ?auto_592868 ?auto_592878 ) ) ( not ( = ?auto_592868 ?auto_592879 ) ) ( not ( = ?auto_592868 ?auto_592880 ) ) ( not ( = ?auto_592869 ?auto_592870 ) ) ( not ( = ?auto_592869 ?auto_592871 ) ) ( not ( = ?auto_592869 ?auto_592872 ) ) ( not ( = ?auto_592869 ?auto_592873 ) ) ( not ( = ?auto_592869 ?auto_592874 ) ) ( not ( = ?auto_592869 ?auto_592875 ) ) ( not ( = ?auto_592869 ?auto_592876 ) ) ( not ( = ?auto_592869 ?auto_592877 ) ) ( not ( = ?auto_592869 ?auto_592878 ) ) ( not ( = ?auto_592869 ?auto_592879 ) ) ( not ( = ?auto_592869 ?auto_592880 ) ) ( not ( = ?auto_592870 ?auto_592871 ) ) ( not ( = ?auto_592870 ?auto_592872 ) ) ( not ( = ?auto_592870 ?auto_592873 ) ) ( not ( = ?auto_592870 ?auto_592874 ) ) ( not ( = ?auto_592870 ?auto_592875 ) ) ( not ( = ?auto_592870 ?auto_592876 ) ) ( not ( = ?auto_592870 ?auto_592877 ) ) ( not ( = ?auto_592870 ?auto_592878 ) ) ( not ( = ?auto_592870 ?auto_592879 ) ) ( not ( = ?auto_592870 ?auto_592880 ) ) ( not ( = ?auto_592871 ?auto_592872 ) ) ( not ( = ?auto_592871 ?auto_592873 ) ) ( not ( = ?auto_592871 ?auto_592874 ) ) ( not ( = ?auto_592871 ?auto_592875 ) ) ( not ( = ?auto_592871 ?auto_592876 ) ) ( not ( = ?auto_592871 ?auto_592877 ) ) ( not ( = ?auto_592871 ?auto_592878 ) ) ( not ( = ?auto_592871 ?auto_592879 ) ) ( not ( = ?auto_592871 ?auto_592880 ) ) ( not ( = ?auto_592872 ?auto_592873 ) ) ( not ( = ?auto_592872 ?auto_592874 ) ) ( not ( = ?auto_592872 ?auto_592875 ) ) ( not ( = ?auto_592872 ?auto_592876 ) ) ( not ( = ?auto_592872 ?auto_592877 ) ) ( not ( = ?auto_592872 ?auto_592878 ) ) ( not ( = ?auto_592872 ?auto_592879 ) ) ( not ( = ?auto_592872 ?auto_592880 ) ) ( not ( = ?auto_592873 ?auto_592874 ) ) ( not ( = ?auto_592873 ?auto_592875 ) ) ( not ( = ?auto_592873 ?auto_592876 ) ) ( not ( = ?auto_592873 ?auto_592877 ) ) ( not ( = ?auto_592873 ?auto_592878 ) ) ( not ( = ?auto_592873 ?auto_592879 ) ) ( not ( = ?auto_592873 ?auto_592880 ) ) ( not ( = ?auto_592874 ?auto_592875 ) ) ( not ( = ?auto_592874 ?auto_592876 ) ) ( not ( = ?auto_592874 ?auto_592877 ) ) ( not ( = ?auto_592874 ?auto_592878 ) ) ( not ( = ?auto_592874 ?auto_592879 ) ) ( not ( = ?auto_592874 ?auto_592880 ) ) ( not ( = ?auto_592875 ?auto_592876 ) ) ( not ( = ?auto_592875 ?auto_592877 ) ) ( not ( = ?auto_592875 ?auto_592878 ) ) ( not ( = ?auto_592875 ?auto_592879 ) ) ( not ( = ?auto_592875 ?auto_592880 ) ) ( not ( = ?auto_592876 ?auto_592877 ) ) ( not ( = ?auto_592876 ?auto_592878 ) ) ( not ( = ?auto_592876 ?auto_592879 ) ) ( not ( = ?auto_592876 ?auto_592880 ) ) ( not ( = ?auto_592877 ?auto_592878 ) ) ( not ( = ?auto_592877 ?auto_592879 ) ) ( not ( = ?auto_592877 ?auto_592880 ) ) ( not ( = ?auto_592878 ?auto_592879 ) ) ( not ( = ?auto_592878 ?auto_592880 ) ) ( not ( = ?auto_592879 ?auto_592880 ) ) ( ON ?auto_592878 ?auto_592879 ) ( ON ?auto_592877 ?auto_592878 ) ( ON ?auto_592876 ?auto_592877 ) ( ON ?auto_592875 ?auto_592876 ) ( ON ?auto_592874 ?auto_592875 ) ( CLEAR ?auto_592872 ) ( ON ?auto_592873 ?auto_592874 ) ( CLEAR ?auto_592873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_592868 ?auto_592869 ?auto_592870 ?auto_592871 ?auto_592872 ?auto_592873 )
      ( MAKE-12PILE ?auto_592868 ?auto_592869 ?auto_592870 ?auto_592871 ?auto_592872 ?auto_592873 ?auto_592874 ?auto_592875 ?auto_592876 ?auto_592877 ?auto_592878 ?auto_592879 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592918 - BLOCK
      ?auto_592919 - BLOCK
      ?auto_592920 - BLOCK
      ?auto_592921 - BLOCK
      ?auto_592922 - BLOCK
      ?auto_592923 - BLOCK
      ?auto_592924 - BLOCK
      ?auto_592925 - BLOCK
      ?auto_592926 - BLOCK
      ?auto_592927 - BLOCK
      ?auto_592928 - BLOCK
      ?auto_592929 - BLOCK
    )
    :vars
    (
      ?auto_592930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592929 ?auto_592930 ) ( ON-TABLE ?auto_592918 ) ( ON ?auto_592919 ?auto_592918 ) ( ON ?auto_592920 ?auto_592919 ) ( ON ?auto_592921 ?auto_592920 ) ( not ( = ?auto_592918 ?auto_592919 ) ) ( not ( = ?auto_592918 ?auto_592920 ) ) ( not ( = ?auto_592918 ?auto_592921 ) ) ( not ( = ?auto_592918 ?auto_592922 ) ) ( not ( = ?auto_592918 ?auto_592923 ) ) ( not ( = ?auto_592918 ?auto_592924 ) ) ( not ( = ?auto_592918 ?auto_592925 ) ) ( not ( = ?auto_592918 ?auto_592926 ) ) ( not ( = ?auto_592918 ?auto_592927 ) ) ( not ( = ?auto_592918 ?auto_592928 ) ) ( not ( = ?auto_592918 ?auto_592929 ) ) ( not ( = ?auto_592918 ?auto_592930 ) ) ( not ( = ?auto_592919 ?auto_592920 ) ) ( not ( = ?auto_592919 ?auto_592921 ) ) ( not ( = ?auto_592919 ?auto_592922 ) ) ( not ( = ?auto_592919 ?auto_592923 ) ) ( not ( = ?auto_592919 ?auto_592924 ) ) ( not ( = ?auto_592919 ?auto_592925 ) ) ( not ( = ?auto_592919 ?auto_592926 ) ) ( not ( = ?auto_592919 ?auto_592927 ) ) ( not ( = ?auto_592919 ?auto_592928 ) ) ( not ( = ?auto_592919 ?auto_592929 ) ) ( not ( = ?auto_592919 ?auto_592930 ) ) ( not ( = ?auto_592920 ?auto_592921 ) ) ( not ( = ?auto_592920 ?auto_592922 ) ) ( not ( = ?auto_592920 ?auto_592923 ) ) ( not ( = ?auto_592920 ?auto_592924 ) ) ( not ( = ?auto_592920 ?auto_592925 ) ) ( not ( = ?auto_592920 ?auto_592926 ) ) ( not ( = ?auto_592920 ?auto_592927 ) ) ( not ( = ?auto_592920 ?auto_592928 ) ) ( not ( = ?auto_592920 ?auto_592929 ) ) ( not ( = ?auto_592920 ?auto_592930 ) ) ( not ( = ?auto_592921 ?auto_592922 ) ) ( not ( = ?auto_592921 ?auto_592923 ) ) ( not ( = ?auto_592921 ?auto_592924 ) ) ( not ( = ?auto_592921 ?auto_592925 ) ) ( not ( = ?auto_592921 ?auto_592926 ) ) ( not ( = ?auto_592921 ?auto_592927 ) ) ( not ( = ?auto_592921 ?auto_592928 ) ) ( not ( = ?auto_592921 ?auto_592929 ) ) ( not ( = ?auto_592921 ?auto_592930 ) ) ( not ( = ?auto_592922 ?auto_592923 ) ) ( not ( = ?auto_592922 ?auto_592924 ) ) ( not ( = ?auto_592922 ?auto_592925 ) ) ( not ( = ?auto_592922 ?auto_592926 ) ) ( not ( = ?auto_592922 ?auto_592927 ) ) ( not ( = ?auto_592922 ?auto_592928 ) ) ( not ( = ?auto_592922 ?auto_592929 ) ) ( not ( = ?auto_592922 ?auto_592930 ) ) ( not ( = ?auto_592923 ?auto_592924 ) ) ( not ( = ?auto_592923 ?auto_592925 ) ) ( not ( = ?auto_592923 ?auto_592926 ) ) ( not ( = ?auto_592923 ?auto_592927 ) ) ( not ( = ?auto_592923 ?auto_592928 ) ) ( not ( = ?auto_592923 ?auto_592929 ) ) ( not ( = ?auto_592923 ?auto_592930 ) ) ( not ( = ?auto_592924 ?auto_592925 ) ) ( not ( = ?auto_592924 ?auto_592926 ) ) ( not ( = ?auto_592924 ?auto_592927 ) ) ( not ( = ?auto_592924 ?auto_592928 ) ) ( not ( = ?auto_592924 ?auto_592929 ) ) ( not ( = ?auto_592924 ?auto_592930 ) ) ( not ( = ?auto_592925 ?auto_592926 ) ) ( not ( = ?auto_592925 ?auto_592927 ) ) ( not ( = ?auto_592925 ?auto_592928 ) ) ( not ( = ?auto_592925 ?auto_592929 ) ) ( not ( = ?auto_592925 ?auto_592930 ) ) ( not ( = ?auto_592926 ?auto_592927 ) ) ( not ( = ?auto_592926 ?auto_592928 ) ) ( not ( = ?auto_592926 ?auto_592929 ) ) ( not ( = ?auto_592926 ?auto_592930 ) ) ( not ( = ?auto_592927 ?auto_592928 ) ) ( not ( = ?auto_592927 ?auto_592929 ) ) ( not ( = ?auto_592927 ?auto_592930 ) ) ( not ( = ?auto_592928 ?auto_592929 ) ) ( not ( = ?auto_592928 ?auto_592930 ) ) ( not ( = ?auto_592929 ?auto_592930 ) ) ( ON ?auto_592928 ?auto_592929 ) ( ON ?auto_592927 ?auto_592928 ) ( ON ?auto_592926 ?auto_592927 ) ( ON ?auto_592925 ?auto_592926 ) ( ON ?auto_592924 ?auto_592925 ) ( ON ?auto_592923 ?auto_592924 ) ( CLEAR ?auto_592921 ) ( ON ?auto_592922 ?auto_592923 ) ( CLEAR ?auto_592922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_592918 ?auto_592919 ?auto_592920 ?auto_592921 ?auto_592922 )
      ( MAKE-12PILE ?auto_592918 ?auto_592919 ?auto_592920 ?auto_592921 ?auto_592922 ?auto_592923 ?auto_592924 ?auto_592925 ?auto_592926 ?auto_592927 ?auto_592928 ?auto_592929 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_592968 - BLOCK
      ?auto_592969 - BLOCK
      ?auto_592970 - BLOCK
      ?auto_592971 - BLOCK
      ?auto_592972 - BLOCK
      ?auto_592973 - BLOCK
      ?auto_592974 - BLOCK
      ?auto_592975 - BLOCK
      ?auto_592976 - BLOCK
      ?auto_592977 - BLOCK
      ?auto_592978 - BLOCK
      ?auto_592979 - BLOCK
    )
    :vars
    (
      ?auto_592980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_592979 ?auto_592980 ) ( ON-TABLE ?auto_592968 ) ( ON ?auto_592969 ?auto_592968 ) ( ON ?auto_592970 ?auto_592969 ) ( not ( = ?auto_592968 ?auto_592969 ) ) ( not ( = ?auto_592968 ?auto_592970 ) ) ( not ( = ?auto_592968 ?auto_592971 ) ) ( not ( = ?auto_592968 ?auto_592972 ) ) ( not ( = ?auto_592968 ?auto_592973 ) ) ( not ( = ?auto_592968 ?auto_592974 ) ) ( not ( = ?auto_592968 ?auto_592975 ) ) ( not ( = ?auto_592968 ?auto_592976 ) ) ( not ( = ?auto_592968 ?auto_592977 ) ) ( not ( = ?auto_592968 ?auto_592978 ) ) ( not ( = ?auto_592968 ?auto_592979 ) ) ( not ( = ?auto_592968 ?auto_592980 ) ) ( not ( = ?auto_592969 ?auto_592970 ) ) ( not ( = ?auto_592969 ?auto_592971 ) ) ( not ( = ?auto_592969 ?auto_592972 ) ) ( not ( = ?auto_592969 ?auto_592973 ) ) ( not ( = ?auto_592969 ?auto_592974 ) ) ( not ( = ?auto_592969 ?auto_592975 ) ) ( not ( = ?auto_592969 ?auto_592976 ) ) ( not ( = ?auto_592969 ?auto_592977 ) ) ( not ( = ?auto_592969 ?auto_592978 ) ) ( not ( = ?auto_592969 ?auto_592979 ) ) ( not ( = ?auto_592969 ?auto_592980 ) ) ( not ( = ?auto_592970 ?auto_592971 ) ) ( not ( = ?auto_592970 ?auto_592972 ) ) ( not ( = ?auto_592970 ?auto_592973 ) ) ( not ( = ?auto_592970 ?auto_592974 ) ) ( not ( = ?auto_592970 ?auto_592975 ) ) ( not ( = ?auto_592970 ?auto_592976 ) ) ( not ( = ?auto_592970 ?auto_592977 ) ) ( not ( = ?auto_592970 ?auto_592978 ) ) ( not ( = ?auto_592970 ?auto_592979 ) ) ( not ( = ?auto_592970 ?auto_592980 ) ) ( not ( = ?auto_592971 ?auto_592972 ) ) ( not ( = ?auto_592971 ?auto_592973 ) ) ( not ( = ?auto_592971 ?auto_592974 ) ) ( not ( = ?auto_592971 ?auto_592975 ) ) ( not ( = ?auto_592971 ?auto_592976 ) ) ( not ( = ?auto_592971 ?auto_592977 ) ) ( not ( = ?auto_592971 ?auto_592978 ) ) ( not ( = ?auto_592971 ?auto_592979 ) ) ( not ( = ?auto_592971 ?auto_592980 ) ) ( not ( = ?auto_592972 ?auto_592973 ) ) ( not ( = ?auto_592972 ?auto_592974 ) ) ( not ( = ?auto_592972 ?auto_592975 ) ) ( not ( = ?auto_592972 ?auto_592976 ) ) ( not ( = ?auto_592972 ?auto_592977 ) ) ( not ( = ?auto_592972 ?auto_592978 ) ) ( not ( = ?auto_592972 ?auto_592979 ) ) ( not ( = ?auto_592972 ?auto_592980 ) ) ( not ( = ?auto_592973 ?auto_592974 ) ) ( not ( = ?auto_592973 ?auto_592975 ) ) ( not ( = ?auto_592973 ?auto_592976 ) ) ( not ( = ?auto_592973 ?auto_592977 ) ) ( not ( = ?auto_592973 ?auto_592978 ) ) ( not ( = ?auto_592973 ?auto_592979 ) ) ( not ( = ?auto_592973 ?auto_592980 ) ) ( not ( = ?auto_592974 ?auto_592975 ) ) ( not ( = ?auto_592974 ?auto_592976 ) ) ( not ( = ?auto_592974 ?auto_592977 ) ) ( not ( = ?auto_592974 ?auto_592978 ) ) ( not ( = ?auto_592974 ?auto_592979 ) ) ( not ( = ?auto_592974 ?auto_592980 ) ) ( not ( = ?auto_592975 ?auto_592976 ) ) ( not ( = ?auto_592975 ?auto_592977 ) ) ( not ( = ?auto_592975 ?auto_592978 ) ) ( not ( = ?auto_592975 ?auto_592979 ) ) ( not ( = ?auto_592975 ?auto_592980 ) ) ( not ( = ?auto_592976 ?auto_592977 ) ) ( not ( = ?auto_592976 ?auto_592978 ) ) ( not ( = ?auto_592976 ?auto_592979 ) ) ( not ( = ?auto_592976 ?auto_592980 ) ) ( not ( = ?auto_592977 ?auto_592978 ) ) ( not ( = ?auto_592977 ?auto_592979 ) ) ( not ( = ?auto_592977 ?auto_592980 ) ) ( not ( = ?auto_592978 ?auto_592979 ) ) ( not ( = ?auto_592978 ?auto_592980 ) ) ( not ( = ?auto_592979 ?auto_592980 ) ) ( ON ?auto_592978 ?auto_592979 ) ( ON ?auto_592977 ?auto_592978 ) ( ON ?auto_592976 ?auto_592977 ) ( ON ?auto_592975 ?auto_592976 ) ( ON ?auto_592974 ?auto_592975 ) ( ON ?auto_592973 ?auto_592974 ) ( ON ?auto_592972 ?auto_592973 ) ( CLEAR ?auto_592970 ) ( ON ?auto_592971 ?auto_592972 ) ( CLEAR ?auto_592971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_592968 ?auto_592969 ?auto_592970 ?auto_592971 )
      ( MAKE-12PILE ?auto_592968 ?auto_592969 ?auto_592970 ?auto_592971 ?auto_592972 ?auto_592973 ?auto_592974 ?auto_592975 ?auto_592976 ?auto_592977 ?auto_592978 ?auto_592979 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_593018 - BLOCK
      ?auto_593019 - BLOCK
      ?auto_593020 - BLOCK
      ?auto_593021 - BLOCK
      ?auto_593022 - BLOCK
      ?auto_593023 - BLOCK
      ?auto_593024 - BLOCK
      ?auto_593025 - BLOCK
      ?auto_593026 - BLOCK
      ?auto_593027 - BLOCK
      ?auto_593028 - BLOCK
      ?auto_593029 - BLOCK
    )
    :vars
    (
      ?auto_593030 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593029 ?auto_593030 ) ( ON-TABLE ?auto_593018 ) ( ON ?auto_593019 ?auto_593018 ) ( not ( = ?auto_593018 ?auto_593019 ) ) ( not ( = ?auto_593018 ?auto_593020 ) ) ( not ( = ?auto_593018 ?auto_593021 ) ) ( not ( = ?auto_593018 ?auto_593022 ) ) ( not ( = ?auto_593018 ?auto_593023 ) ) ( not ( = ?auto_593018 ?auto_593024 ) ) ( not ( = ?auto_593018 ?auto_593025 ) ) ( not ( = ?auto_593018 ?auto_593026 ) ) ( not ( = ?auto_593018 ?auto_593027 ) ) ( not ( = ?auto_593018 ?auto_593028 ) ) ( not ( = ?auto_593018 ?auto_593029 ) ) ( not ( = ?auto_593018 ?auto_593030 ) ) ( not ( = ?auto_593019 ?auto_593020 ) ) ( not ( = ?auto_593019 ?auto_593021 ) ) ( not ( = ?auto_593019 ?auto_593022 ) ) ( not ( = ?auto_593019 ?auto_593023 ) ) ( not ( = ?auto_593019 ?auto_593024 ) ) ( not ( = ?auto_593019 ?auto_593025 ) ) ( not ( = ?auto_593019 ?auto_593026 ) ) ( not ( = ?auto_593019 ?auto_593027 ) ) ( not ( = ?auto_593019 ?auto_593028 ) ) ( not ( = ?auto_593019 ?auto_593029 ) ) ( not ( = ?auto_593019 ?auto_593030 ) ) ( not ( = ?auto_593020 ?auto_593021 ) ) ( not ( = ?auto_593020 ?auto_593022 ) ) ( not ( = ?auto_593020 ?auto_593023 ) ) ( not ( = ?auto_593020 ?auto_593024 ) ) ( not ( = ?auto_593020 ?auto_593025 ) ) ( not ( = ?auto_593020 ?auto_593026 ) ) ( not ( = ?auto_593020 ?auto_593027 ) ) ( not ( = ?auto_593020 ?auto_593028 ) ) ( not ( = ?auto_593020 ?auto_593029 ) ) ( not ( = ?auto_593020 ?auto_593030 ) ) ( not ( = ?auto_593021 ?auto_593022 ) ) ( not ( = ?auto_593021 ?auto_593023 ) ) ( not ( = ?auto_593021 ?auto_593024 ) ) ( not ( = ?auto_593021 ?auto_593025 ) ) ( not ( = ?auto_593021 ?auto_593026 ) ) ( not ( = ?auto_593021 ?auto_593027 ) ) ( not ( = ?auto_593021 ?auto_593028 ) ) ( not ( = ?auto_593021 ?auto_593029 ) ) ( not ( = ?auto_593021 ?auto_593030 ) ) ( not ( = ?auto_593022 ?auto_593023 ) ) ( not ( = ?auto_593022 ?auto_593024 ) ) ( not ( = ?auto_593022 ?auto_593025 ) ) ( not ( = ?auto_593022 ?auto_593026 ) ) ( not ( = ?auto_593022 ?auto_593027 ) ) ( not ( = ?auto_593022 ?auto_593028 ) ) ( not ( = ?auto_593022 ?auto_593029 ) ) ( not ( = ?auto_593022 ?auto_593030 ) ) ( not ( = ?auto_593023 ?auto_593024 ) ) ( not ( = ?auto_593023 ?auto_593025 ) ) ( not ( = ?auto_593023 ?auto_593026 ) ) ( not ( = ?auto_593023 ?auto_593027 ) ) ( not ( = ?auto_593023 ?auto_593028 ) ) ( not ( = ?auto_593023 ?auto_593029 ) ) ( not ( = ?auto_593023 ?auto_593030 ) ) ( not ( = ?auto_593024 ?auto_593025 ) ) ( not ( = ?auto_593024 ?auto_593026 ) ) ( not ( = ?auto_593024 ?auto_593027 ) ) ( not ( = ?auto_593024 ?auto_593028 ) ) ( not ( = ?auto_593024 ?auto_593029 ) ) ( not ( = ?auto_593024 ?auto_593030 ) ) ( not ( = ?auto_593025 ?auto_593026 ) ) ( not ( = ?auto_593025 ?auto_593027 ) ) ( not ( = ?auto_593025 ?auto_593028 ) ) ( not ( = ?auto_593025 ?auto_593029 ) ) ( not ( = ?auto_593025 ?auto_593030 ) ) ( not ( = ?auto_593026 ?auto_593027 ) ) ( not ( = ?auto_593026 ?auto_593028 ) ) ( not ( = ?auto_593026 ?auto_593029 ) ) ( not ( = ?auto_593026 ?auto_593030 ) ) ( not ( = ?auto_593027 ?auto_593028 ) ) ( not ( = ?auto_593027 ?auto_593029 ) ) ( not ( = ?auto_593027 ?auto_593030 ) ) ( not ( = ?auto_593028 ?auto_593029 ) ) ( not ( = ?auto_593028 ?auto_593030 ) ) ( not ( = ?auto_593029 ?auto_593030 ) ) ( ON ?auto_593028 ?auto_593029 ) ( ON ?auto_593027 ?auto_593028 ) ( ON ?auto_593026 ?auto_593027 ) ( ON ?auto_593025 ?auto_593026 ) ( ON ?auto_593024 ?auto_593025 ) ( ON ?auto_593023 ?auto_593024 ) ( ON ?auto_593022 ?auto_593023 ) ( ON ?auto_593021 ?auto_593022 ) ( CLEAR ?auto_593019 ) ( ON ?auto_593020 ?auto_593021 ) ( CLEAR ?auto_593020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_593018 ?auto_593019 ?auto_593020 )
      ( MAKE-12PILE ?auto_593018 ?auto_593019 ?auto_593020 ?auto_593021 ?auto_593022 ?auto_593023 ?auto_593024 ?auto_593025 ?auto_593026 ?auto_593027 ?auto_593028 ?auto_593029 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_593068 - BLOCK
      ?auto_593069 - BLOCK
      ?auto_593070 - BLOCK
      ?auto_593071 - BLOCK
      ?auto_593072 - BLOCK
      ?auto_593073 - BLOCK
      ?auto_593074 - BLOCK
      ?auto_593075 - BLOCK
      ?auto_593076 - BLOCK
      ?auto_593077 - BLOCK
      ?auto_593078 - BLOCK
      ?auto_593079 - BLOCK
    )
    :vars
    (
      ?auto_593080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593079 ?auto_593080 ) ( ON-TABLE ?auto_593068 ) ( not ( = ?auto_593068 ?auto_593069 ) ) ( not ( = ?auto_593068 ?auto_593070 ) ) ( not ( = ?auto_593068 ?auto_593071 ) ) ( not ( = ?auto_593068 ?auto_593072 ) ) ( not ( = ?auto_593068 ?auto_593073 ) ) ( not ( = ?auto_593068 ?auto_593074 ) ) ( not ( = ?auto_593068 ?auto_593075 ) ) ( not ( = ?auto_593068 ?auto_593076 ) ) ( not ( = ?auto_593068 ?auto_593077 ) ) ( not ( = ?auto_593068 ?auto_593078 ) ) ( not ( = ?auto_593068 ?auto_593079 ) ) ( not ( = ?auto_593068 ?auto_593080 ) ) ( not ( = ?auto_593069 ?auto_593070 ) ) ( not ( = ?auto_593069 ?auto_593071 ) ) ( not ( = ?auto_593069 ?auto_593072 ) ) ( not ( = ?auto_593069 ?auto_593073 ) ) ( not ( = ?auto_593069 ?auto_593074 ) ) ( not ( = ?auto_593069 ?auto_593075 ) ) ( not ( = ?auto_593069 ?auto_593076 ) ) ( not ( = ?auto_593069 ?auto_593077 ) ) ( not ( = ?auto_593069 ?auto_593078 ) ) ( not ( = ?auto_593069 ?auto_593079 ) ) ( not ( = ?auto_593069 ?auto_593080 ) ) ( not ( = ?auto_593070 ?auto_593071 ) ) ( not ( = ?auto_593070 ?auto_593072 ) ) ( not ( = ?auto_593070 ?auto_593073 ) ) ( not ( = ?auto_593070 ?auto_593074 ) ) ( not ( = ?auto_593070 ?auto_593075 ) ) ( not ( = ?auto_593070 ?auto_593076 ) ) ( not ( = ?auto_593070 ?auto_593077 ) ) ( not ( = ?auto_593070 ?auto_593078 ) ) ( not ( = ?auto_593070 ?auto_593079 ) ) ( not ( = ?auto_593070 ?auto_593080 ) ) ( not ( = ?auto_593071 ?auto_593072 ) ) ( not ( = ?auto_593071 ?auto_593073 ) ) ( not ( = ?auto_593071 ?auto_593074 ) ) ( not ( = ?auto_593071 ?auto_593075 ) ) ( not ( = ?auto_593071 ?auto_593076 ) ) ( not ( = ?auto_593071 ?auto_593077 ) ) ( not ( = ?auto_593071 ?auto_593078 ) ) ( not ( = ?auto_593071 ?auto_593079 ) ) ( not ( = ?auto_593071 ?auto_593080 ) ) ( not ( = ?auto_593072 ?auto_593073 ) ) ( not ( = ?auto_593072 ?auto_593074 ) ) ( not ( = ?auto_593072 ?auto_593075 ) ) ( not ( = ?auto_593072 ?auto_593076 ) ) ( not ( = ?auto_593072 ?auto_593077 ) ) ( not ( = ?auto_593072 ?auto_593078 ) ) ( not ( = ?auto_593072 ?auto_593079 ) ) ( not ( = ?auto_593072 ?auto_593080 ) ) ( not ( = ?auto_593073 ?auto_593074 ) ) ( not ( = ?auto_593073 ?auto_593075 ) ) ( not ( = ?auto_593073 ?auto_593076 ) ) ( not ( = ?auto_593073 ?auto_593077 ) ) ( not ( = ?auto_593073 ?auto_593078 ) ) ( not ( = ?auto_593073 ?auto_593079 ) ) ( not ( = ?auto_593073 ?auto_593080 ) ) ( not ( = ?auto_593074 ?auto_593075 ) ) ( not ( = ?auto_593074 ?auto_593076 ) ) ( not ( = ?auto_593074 ?auto_593077 ) ) ( not ( = ?auto_593074 ?auto_593078 ) ) ( not ( = ?auto_593074 ?auto_593079 ) ) ( not ( = ?auto_593074 ?auto_593080 ) ) ( not ( = ?auto_593075 ?auto_593076 ) ) ( not ( = ?auto_593075 ?auto_593077 ) ) ( not ( = ?auto_593075 ?auto_593078 ) ) ( not ( = ?auto_593075 ?auto_593079 ) ) ( not ( = ?auto_593075 ?auto_593080 ) ) ( not ( = ?auto_593076 ?auto_593077 ) ) ( not ( = ?auto_593076 ?auto_593078 ) ) ( not ( = ?auto_593076 ?auto_593079 ) ) ( not ( = ?auto_593076 ?auto_593080 ) ) ( not ( = ?auto_593077 ?auto_593078 ) ) ( not ( = ?auto_593077 ?auto_593079 ) ) ( not ( = ?auto_593077 ?auto_593080 ) ) ( not ( = ?auto_593078 ?auto_593079 ) ) ( not ( = ?auto_593078 ?auto_593080 ) ) ( not ( = ?auto_593079 ?auto_593080 ) ) ( ON ?auto_593078 ?auto_593079 ) ( ON ?auto_593077 ?auto_593078 ) ( ON ?auto_593076 ?auto_593077 ) ( ON ?auto_593075 ?auto_593076 ) ( ON ?auto_593074 ?auto_593075 ) ( ON ?auto_593073 ?auto_593074 ) ( ON ?auto_593072 ?auto_593073 ) ( ON ?auto_593071 ?auto_593072 ) ( ON ?auto_593070 ?auto_593071 ) ( CLEAR ?auto_593068 ) ( ON ?auto_593069 ?auto_593070 ) ( CLEAR ?auto_593069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_593068 ?auto_593069 )
      ( MAKE-12PILE ?auto_593068 ?auto_593069 ?auto_593070 ?auto_593071 ?auto_593072 ?auto_593073 ?auto_593074 ?auto_593075 ?auto_593076 ?auto_593077 ?auto_593078 ?auto_593079 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_593118 - BLOCK
      ?auto_593119 - BLOCK
      ?auto_593120 - BLOCK
      ?auto_593121 - BLOCK
      ?auto_593122 - BLOCK
      ?auto_593123 - BLOCK
      ?auto_593124 - BLOCK
      ?auto_593125 - BLOCK
      ?auto_593126 - BLOCK
      ?auto_593127 - BLOCK
      ?auto_593128 - BLOCK
      ?auto_593129 - BLOCK
    )
    :vars
    (
      ?auto_593130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593129 ?auto_593130 ) ( not ( = ?auto_593118 ?auto_593119 ) ) ( not ( = ?auto_593118 ?auto_593120 ) ) ( not ( = ?auto_593118 ?auto_593121 ) ) ( not ( = ?auto_593118 ?auto_593122 ) ) ( not ( = ?auto_593118 ?auto_593123 ) ) ( not ( = ?auto_593118 ?auto_593124 ) ) ( not ( = ?auto_593118 ?auto_593125 ) ) ( not ( = ?auto_593118 ?auto_593126 ) ) ( not ( = ?auto_593118 ?auto_593127 ) ) ( not ( = ?auto_593118 ?auto_593128 ) ) ( not ( = ?auto_593118 ?auto_593129 ) ) ( not ( = ?auto_593118 ?auto_593130 ) ) ( not ( = ?auto_593119 ?auto_593120 ) ) ( not ( = ?auto_593119 ?auto_593121 ) ) ( not ( = ?auto_593119 ?auto_593122 ) ) ( not ( = ?auto_593119 ?auto_593123 ) ) ( not ( = ?auto_593119 ?auto_593124 ) ) ( not ( = ?auto_593119 ?auto_593125 ) ) ( not ( = ?auto_593119 ?auto_593126 ) ) ( not ( = ?auto_593119 ?auto_593127 ) ) ( not ( = ?auto_593119 ?auto_593128 ) ) ( not ( = ?auto_593119 ?auto_593129 ) ) ( not ( = ?auto_593119 ?auto_593130 ) ) ( not ( = ?auto_593120 ?auto_593121 ) ) ( not ( = ?auto_593120 ?auto_593122 ) ) ( not ( = ?auto_593120 ?auto_593123 ) ) ( not ( = ?auto_593120 ?auto_593124 ) ) ( not ( = ?auto_593120 ?auto_593125 ) ) ( not ( = ?auto_593120 ?auto_593126 ) ) ( not ( = ?auto_593120 ?auto_593127 ) ) ( not ( = ?auto_593120 ?auto_593128 ) ) ( not ( = ?auto_593120 ?auto_593129 ) ) ( not ( = ?auto_593120 ?auto_593130 ) ) ( not ( = ?auto_593121 ?auto_593122 ) ) ( not ( = ?auto_593121 ?auto_593123 ) ) ( not ( = ?auto_593121 ?auto_593124 ) ) ( not ( = ?auto_593121 ?auto_593125 ) ) ( not ( = ?auto_593121 ?auto_593126 ) ) ( not ( = ?auto_593121 ?auto_593127 ) ) ( not ( = ?auto_593121 ?auto_593128 ) ) ( not ( = ?auto_593121 ?auto_593129 ) ) ( not ( = ?auto_593121 ?auto_593130 ) ) ( not ( = ?auto_593122 ?auto_593123 ) ) ( not ( = ?auto_593122 ?auto_593124 ) ) ( not ( = ?auto_593122 ?auto_593125 ) ) ( not ( = ?auto_593122 ?auto_593126 ) ) ( not ( = ?auto_593122 ?auto_593127 ) ) ( not ( = ?auto_593122 ?auto_593128 ) ) ( not ( = ?auto_593122 ?auto_593129 ) ) ( not ( = ?auto_593122 ?auto_593130 ) ) ( not ( = ?auto_593123 ?auto_593124 ) ) ( not ( = ?auto_593123 ?auto_593125 ) ) ( not ( = ?auto_593123 ?auto_593126 ) ) ( not ( = ?auto_593123 ?auto_593127 ) ) ( not ( = ?auto_593123 ?auto_593128 ) ) ( not ( = ?auto_593123 ?auto_593129 ) ) ( not ( = ?auto_593123 ?auto_593130 ) ) ( not ( = ?auto_593124 ?auto_593125 ) ) ( not ( = ?auto_593124 ?auto_593126 ) ) ( not ( = ?auto_593124 ?auto_593127 ) ) ( not ( = ?auto_593124 ?auto_593128 ) ) ( not ( = ?auto_593124 ?auto_593129 ) ) ( not ( = ?auto_593124 ?auto_593130 ) ) ( not ( = ?auto_593125 ?auto_593126 ) ) ( not ( = ?auto_593125 ?auto_593127 ) ) ( not ( = ?auto_593125 ?auto_593128 ) ) ( not ( = ?auto_593125 ?auto_593129 ) ) ( not ( = ?auto_593125 ?auto_593130 ) ) ( not ( = ?auto_593126 ?auto_593127 ) ) ( not ( = ?auto_593126 ?auto_593128 ) ) ( not ( = ?auto_593126 ?auto_593129 ) ) ( not ( = ?auto_593126 ?auto_593130 ) ) ( not ( = ?auto_593127 ?auto_593128 ) ) ( not ( = ?auto_593127 ?auto_593129 ) ) ( not ( = ?auto_593127 ?auto_593130 ) ) ( not ( = ?auto_593128 ?auto_593129 ) ) ( not ( = ?auto_593128 ?auto_593130 ) ) ( not ( = ?auto_593129 ?auto_593130 ) ) ( ON ?auto_593128 ?auto_593129 ) ( ON ?auto_593127 ?auto_593128 ) ( ON ?auto_593126 ?auto_593127 ) ( ON ?auto_593125 ?auto_593126 ) ( ON ?auto_593124 ?auto_593125 ) ( ON ?auto_593123 ?auto_593124 ) ( ON ?auto_593122 ?auto_593123 ) ( ON ?auto_593121 ?auto_593122 ) ( ON ?auto_593120 ?auto_593121 ) ( ON ?auto_593119 ?auto_593120 ) ( ON ?auto_593118 ?auto_593119 ) ( CLEAR ?auto_593118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_593118 )
      ( MAKE-12PILE ?auto_593118 ?auto_593119 ?auto_593120 ?auto_593121 ?auto_593122 ?auto_593123 ?auto_593124 ?auto_593125 ?auto_593126 ?auto_593127 ?auto_593128 ?auto_593129 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593169 - BLOCK
      ?auto_593170 - BLOCK
      ?auto_593171 - BLOCK
      ?auto_593172 - BLOCK
      ?auto_593173 - BLOCK
      ?auto_593174 - BLOCK
      ?auto_593175 - BLOCK
      ?auto_593176 - BLOCK
      ?auto_593177 - BLOCK
      ?auto_593178 - BLOCK
      ?auto_593179 - BLOCK
      ?auto_593180 - BLOCK
      ?auto_593181 - BLOCK
    )
    :vars
    (
      ?auto_593182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_593180 ) ( ON ?auto_593181 ?auto_593182 ) ( CLEAR ?auto_593181 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_593169 ) ( ON ?auto_593170 ?auto_593169 ) ( ON ?auto_593171 ?auto_593170 ) ( ON ?auto_593172 ?auto_593171 ) ( ON ?auto_593173 ?auto_593172 ) ( ON ?auto_593174 ?auto_593173 ) ( ON ?auto_593175 ?auto_593174 ) ( ON ?auto_593176 ?auto_593175 ) ( ON ?auto_593177 ?auto_593176 ) ( ON ?auto_593178 ?auto_593177 ) ( ON ?auto_593179 ?auto_593178 ) ( ON ?auto_593180 ?auto_593179 ) ( not ( = ?auto_593169 ?auto_593170 ) ) ( not ( = ?auto_593169 ?auto_593171 ) ) ( not ( = ?auto_593169 ?auto_593172 ) ) ( not ( = ?auto_593169 ?auto_593173 ) ) ( not ( = ?auto_593169 ?auto_593174 ) ) ( not ( = ?auto_593169 ?auto_593175 ) ) ( not ( = ?auto_593169 ?auto_593176 ) ) ( not ( = ?auto_593169 ?auto_593177 ) ) ( not ( = ?auto_593169 ?auto_593178 ) ) ( not ( = ?auto_593169 ?auto_593179 ) ) ( not ( = ?auto_593169 ?auto_593180 ) ) ( not ( = ?auto_593169 ?auto_593181 ) ) ( not ( = ?auto_593169 ?auto_593182 ) ) ( not ( = ?auto_593170 ?auto_593171 ) ) ( not ( = ?auto_593170 ?auto_593172 ) ) ( not ( = ?auto_593170 ?auto_593173 ) ) ( not ( = ?auto_593170 ?auto_593174 ) ) ( not ( = ?auto_593170 ?auto_593175 ) ) ( not ( = ?auto_593170 ?auto_593176 ) ) ( not ( = ?auto_593170 ?auto_593177 ) ) ( not ( = ?auto_593170 ?auto_593178 ) ) ( not ( = ?auto_593170 ?auto_593179 ) ) ( not ( = ?auto_593170 ?auto_593180 ) ) ( not ( = ?auto_593170 ?auto_593181 ) ) ( not ( = ?auto_593170 ?auto_593182 ) ) ( not ( = ?auto_593171 ?auto_593172 ) ) ( not ( = ?auto_593171 ?auto_593173 ) ) ( not ( = ?auto_593171 ?auto_593174 ) ) ( not ( = ?auto_593171 ?auto_593175 ) ) ( not ( = ?auto_593171 ?auto_593176 ) ) ( not ( = ?auto_593171 ?auto_593177 ) ) ( not ( = ?auto_593171 ?auto_593178 ) ) ( not ( = ?auto_593171 ?auto_593179 ) ) ( not ( = ?auto_593171 ?auto_593180 ) ) ( not ( = ?auto_593171 ?auto_593181 ) ) ( not ( = ?auto_593171 ?auto_593182 ) ) ( not ( = ?auto_593172 ?auto_593173 ) ) ( not ( = ?auto_593172 ?auto_593174 ) ) ( not ( = ?auto_593172 ?auto_593175 ) ) ( not ( = ?auto_593172 ?auto_593176 ) ) ( not ( = ?auto_593172 ?auto_593177 ) ) ( not ( = ?auto_593172 ?auto_593178 ) ) ( not ( = ?auto_593172 ?auto_593179 ) ) ( not ( = ?auto_593172 ?auto_593180 ) ) ( not ( = ?auto_593172 ?auto_593181 ) ) ( not ( = ?auto_593172 ?auto_593182 ) ) ( not ( = ?auto_593173 ?auto_593174 ) ) ( not ( = ?auto_593173 ?auto_593175 ) ) ( not ( = ?auto_593173 ?auto_593176 ) ) ( not ( = ?auto_593173 ?auto_593177 ) ) ( not ( = ?auto_593173 ?auto_593178 ) ) ( not ( = ?auto_593173 ?auto_593179 ) ) ( not ( = ?auto_593173 ?auto_593180 ) ) ( not ( = ?auto_593173 ?auto_593181 ) ) ( not ( = ?auto_593173 ?auto_593182 ) ) ( not ( = ?auto_593174 ?auto_593175 ) ) ( not ( = ?auto_593174 ?auto_593176 ) ) ( not ( = ?auto_593174 ?auto_593177 ) ) ( not ( = ?auto_593174 ?auto_593178 ) ) ( not ( = ?auto_593174 ?auto_593179 ) ) ( not ( = ?auto_593174 ?auto_593180 ) ) ( not ( = ?auto_593174 ?auto_593181 ) ) ( not ( = ?auto_593174 ?auto_593182 ) ) ( not ( = ?auto_593175 ?auto_593176 ) ) ( not ( = ?auto_593175 ?auto_593177 ) ) ( not ( = ?auto_593175 ?auto_593178 ) ) ( not ( = ?auto_593175 ?auto_593179 ) ) ( not ( = ?auto_593175 ?auto_593180 ) ) ( not ( = ?auto_593175 ?auto_593181 ) ) ( not ( = ?auto_593175 ?auto_593182 ) ) ( not ( = ?auto_593176 ?auto_593177 ) ) ( not ( = ?auto_593176 ?auto_593178 ) ) ( not ( = ?auto_593176 ?auto_593179 ) ) ( not ( = ?auto_593176 ?auto_593180 ) ) ( not ( = ?auto_593176 ?auto_593181 ) ) ( not ( = ?auto_593176 ?auto_593182 ) ) ( not ( = ?auto_593177 ?auto_593178 ) ) ( not ( = ?auto_593177 ?auto_593179 ) ) ( not ( = ?auto_593177 ?auto_593180 ) ) ( not ( = ?auto_593177 ?auto_593181 ) ) ( not ( = ?auto_593177 ?auto_593182 ) ) ( not ( = ?auto_593178 ?auto_593179 ) ) ( not ( = ?auto_593178 ?auto_593180 ) ) ( not ( = ?auto_593178 ?auto_593181 ) ) ( not ( = ?auto_593178 ?auto_593182 ) ) ( not ( = ?auto_593179 ?auto_593180 ) ) ( not ( = ?auto_593179 ?auto_593181 ) ) ( not ( = ?auto_593179 ?auto_593182 ) ) ( not ( = ?auto_593180 ?auto_593181 ) ) ( not ( = ?auto_593180 ?auto_593182 ) ) ( not ( = ?auto_593181 ?auto_593182 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_593181 ?auto_593182 )
      ( !STACK ?auto_593181 ?auto_593180 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593223 - BLOCK
      ?auto_593224 - BLOCK
      ?auto_593225 - BLOCK
      ?auto_593226 - BLOCK
      ?auto_593227 - BLOCK
      ?auto_593228 - BLOCK
      ?auto_593229 - BLOCK
      ?auto_593230 - BLOCK
      ?auto_593231 - BLOCK
      ?auto_593232 - BLOCK
      ?auto_593233 - BLOCK
      ?auto_593234 - BLOCK
      ?auto_593235 - BLOCK
    )
    :vars
    (
      ?auto_593236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593235 ?auto_593236 ) ( ON-TABLE ?auto_593223 ) ( ON ?auto_593224 ?auto_593223 ) ( ON ?auto_593225 ?auto_593224 ) ( ON ?auto_593226 ?auto_593225 ) ( ON ?auto_593227 ?auto_593226 ) ( ON ?auto_593228 ?auto_593227 ) ( ON ?auto_593229 ?auto_593228 ) ( ON ?auto_593230 ?auto_593229 ) ( ON ?auto_593231 ?auto_593230 ) ( ON ?auto_593232 ?auto_593231 ) ( ON ?auto_593233 ?auto_593232 ) ( not ( = ?auto_593223 ?auto_593224 ) ) ( not ( = ?auto_593223 ?auto_593225 ) ) ( not ( = ?auto_593223 ?auto_593226 ) ) ( not ( = ?auto_593223 ?auto_593227 ) ) ( not ( = ?auto_593223 ?auto_593228 ) ) ( not ( = ?auto_593223 ?auto_593229 ) ) ( not ( = ?auto_593223 ?auto_593230 ) ) ( not ( = ?auto_593223 ?auto_593231 ) ) ( not ( = ?auto_593223 ?auto_593232 ) ) ( not ( = ?auto_593223 ?auto_593233 ) ) ( not ( = ?auto_593223 ?auto_593234 ) ) ( not ( = ?auto_593223 ?auto_593235 ) ) ( not ( = ?auto_593223 ?auto_593236 ) ) ( not ( = ?auto_593224 ?auto_593225 ) ) ( not ( = ?auto_593224 ?auto_593226 ) ) ( not ( = ?auto_593224 ?auto_593227 ) ) ( not ( = ?auto_593224 ?auto_593228 ) ) ( not ( = ?auto_593224 ?auto_593229 ) ) ( not ( = ?auto_593224 ?auto_593230 ) ) ( not ( = ?auto_593224 ?auto_593231 ) ) ( not ( = ?auto_593224 ?auto_593232 ) ) ( not ( = ?auto_593224 ?auto_593233 ) ) ( not ( = ?auto_593224 ?auto_593234 ) ) ( not ( = ?auto_593224 ?auto_593235 ) ) ( not ( = ?auto_593224 ?auto_593236 ) ) ( not ( = ?auto_593225 ?auto_593226 ) ) ( not ( = ?auto_593225 ?auto_593227 ) ) ( not ( = ?auto_593225 ?auto_593228 ) ) ( not ( = ?auto_593225 ?auto_593229 ) ) ( not ( = ?auto_593225 ?auto_593230 ) ) ( not ( = ?auto_593225 ?auto_593231 ) ) ( not ( = ?auto_593225 ?auto_593232 ) ) ( not ( = ?auto_593225 ?auto_593233 ) ) ( not ( = ?auto_593225 ?auto_593234 ) ) ( not ( = ?auto_593225 ?auto_593235 ) ) ( not ( = ?auto_593225 ?auto_593236 ) ) ( not ( = ?auto_593226 ?auto_593227 ) ) ( not ( = ?auto_593226 ?auto_593228 ) ) ( not ( = ?auto_593226 ?auto_593229 ) ) ( not ( = ?auto_593226 ?auto_593230 ) ) ( not ( = ?auto_593226 ?auto_593231 ) ) ( not ( = ?auto_593226 ?auto_593232 ) ) ( not ( = ?auto_593226 ?auto_593233 ) ) ( not ( = ?auto_593226 ?auto_593234 ) ) ( not ( = ?auto_593226 ?auto_593235 ) ) ( not ( = ?auto_593226 ?auto_593236 ) ) ( not ( = ?auto_593227 ?auto_593228 ) ) ( not ( = ?auto_593227 ?auto_593229 ) ) ( not ( = ?auto_593227 ?auto_593230 ) ) ( not ( = ?auto_593227 ?auto_593231 ) ) ( not ( = ?auto_593227 ?auto_593232 ) ) ( not ( = ?auto_593227 ?auto_593233 ) ) ( not ( = ?auto_593227 ?auto_593234 ) ) ( not ( = ?auto_593227 ?auto_593235 ) ) ( not ( = ?auto_593227 ?auto_593236 ) ) ( not ( = ?auto_593228 ?auto_593229 ) ) ( not ( = ?auto_593228 ?auto_593230 ) ) ( not ( = ?auto_593228 ?auto_593231 ) ) ( not ( = ?auto_593228 ?auto_593232 ) ) ( not ( = ?auto_593228 ?auto_593233 ) ) ( not ( = ?auto_593228 ?auto_593234 ) ) ( not ( = ?auto_593228 ?auto_593235 ) ) ( not ( = ?auto_593228 ?auto_593236 ) ) ( not ( = ?auto_593229 ?auto_593230 ) ) ( not ( = ?auto_593229 ?auto_593231 ) ) ( not ( = ?auto_593229 ?auto_593232 ) ) ( not ( = ?auto_593229 ?auto_593233 ) ) ( not ( = ?auto_593229 ?auto_593234 ) ) ( not ( = ?auto_593229 ?auto_593235 ) ) ( not ( = ?auto_593229 ?auto_593236 ) ) ( not ( = ?auto_593230 ?auto_593231 ) ) ( not ( = ?auto_593230 ?auto_593232 ) ) ( not ( = ?auto_593230 ?auto_593233 ) ) ( not ( = ?auto_593230 ?auto_593234 ) ) ( not ( = ?auto_593230 ?auto_593235 ) ) ( not ( = ?auto_593230 ?auto_593236 ) ) ( not ( = ?auto_593231 ?auto_593232 ) ) ( not ( = ?auto_593231 ?auto_593233 ) ) ( not ( = ?auto_593231 ?auto_593234 ) ) ( not ( = ?auto_593231 ?auto_593235 ) ) ( not ( = ?auto_593231 ?auto_593236 ) ) ( not ( = ?auto_593232 ?auto_593233 ) ) ( not ( = ?auto_593232 ?auto_593234 ) ) ( not ( = ?auto_593232 ?auto_593235 ) ) ( not ( = ?auto_593232 ?auto_593236 ) ) ( not ( = ?auto_593233 ?auto_593234 ) ) ( not ( = ?auto_593233 ?auto_593235 ) ) ( not ( = ?auto_593233 ?auto_593236 ) ) ( not ( = ?auto_593234 ?auto_593235 ) ) ( not ( = ?auto_593234 ?auto_593236 ) ) ( not ( = ?auto_593235 ?auto_593236 ) ) ( CLEAR ?auto_593233 ) ( ON ?auto_593234 ?auto_593235 ) ( CLEAR ?auto_593234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_593223 ?auto_593224 ?auto_593225 ?auto_593226 ?auto_593227 ?auto_593228 ?auto_593229 ?auto_593230 ?auto_593231 ?auto_593232 ?auto_593233 ?auto_593234 )
      ( MAKE-13PILE ?auto_593223 ?auto_593224 ?auto_593225 ?auto_593226 ?auto_593227 ?auto_593228 ?auto_593229 ?auto_593230 ?auto_593231 ?auto_593232 ?auto_593233 ?auto_593234 ?auto_593235 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593277 - BLOCK
      ?auto_593278 - BLOCK
      ?auto_593279 - BLOCK
      ?auto_593280 - BLOCK
      ?auto_593281 - BLOCK
      ?auto_593282 - BLOCK
      ?auto_593283 - BLOCK
      ?auto_593284 - BLOCK
      ?auto_593285 - BLOCK
      ?auto_593286 - BLOCK
      ?auto_593287 - BLOCK
      ?auto_593288 - BLOCK
      ?auto_593289 - BLOCK
    )
    :vars
    (
      ?auto_593290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593289 ?auto_593290 ) ( ON-TABLE ?auto_593277 ) ( ON ?auto_593278 ?auto_593277 ) ( ON ?auto_593279 ?auto_593278 ) ( ON ?auto_593280 ?auto_593279 ) ( ON ?auto_593281 ?auto_593280 ) ( ON ?auto_593282 ?auto_593281 ) ( ON ?auto_593283 ?auto_593282 ) ( ON ?auto_593284 ?auto_593283 ) ( ON ?auto_593285 ?auto_593284 ) ( ON ?auto_593286 ?auto_593285 ) ( not ( = ?auto_593277 ?auto_593278 ) ) ( not ( = ?auto_593277 ?auto_593279 ) ) ( not ( = ?auto_593277 ?auto_593280 ) ) ( not ( = ?auto_593277 ?auto_593281 ) ) ( not ( = ?auto_593277 ?auto_593282 ) ) ( not ( = ?auto_593277 ?auto_593283 ) ) ( not ( = ?auto_593277 ?auto_593284 ) ) ( not ( = ?auto_593277 ?auto_593285 ) ) ( not ( = ?auto_593277 ?auto_593286 ) ) ( not ( = ?auto_593277 ?auto_593287 ) ) ( not ( = ?auto_593277 ?auto_593288 ) ) ( not ( = ?auto_593277 ?auto_593289 ) ) ( not ( = ?auto_593277 ?auto_593290 ) ) ( not ( = ?auto_593278 ?auto_593279 ) ) ( not ( = ?auto_593278 ?auto_593280 ) ) ( not ( = ?auto_593278 ?auto_593281 ) ) ( not ( = ?auto_593278 ?auto_593282 ) ) ( not ( = ?auto_593278 ?auto_593283 ) ) ( not ( = ?auto_593278 ?auto_593284 ) ) ( not ( = ?auto_593278 ?auto_593285 ) ) ( not ( = ?auto_593278 ?auto_593286 ) ) ( not ( = ?auto_593278 ?auto_593287 ) ) ( not ( = ?auto_593278 ?auto_593288 ) ) ( not ( = ?auto_593278 ?auto_593289 ) ) ( not ( = ?auto_593278 ?auto_593290 ) ) ( not ( = ?auto_593279 ?auto_593280 ) ) ( not ( = ?auto_593279 ?auto_593281 ) ) ( not ( = ?auto_593279 ?auto_593282 ) ) ( not ( = ?auto_593279 ?auto_593283 ) ) ( not ( = ?auto_593279 ?auto_593284 ) ) ( not ( = ?auto_593279 ?auto_593285 ) ) ( not ( = ?auto_593279 ?auto_593286 ) ) ( not ( = ?auto_593279 ?auto_593287 ) ) ( not ( = ?auto_593279 ?auto_593288 ) ) ( not ( = ?auto_593279 ?auto_593289 ) ) ( not ( = ?auto_593279 ?auto_593290 ) ) ( not ( = ?auto_593280 ?auto_593281 ) ) ( not ( = ?auto_593280 ?auto_593282 ) ) ( not ( = ?auto_593280 ?auto_593283 ) ) ( not ( = ?auto_593280 ?auto_593284 ) ) ( not ( = ?auto_593280 ?auto_593285 ) ) ( not ( = ?auto_593280 ?auto_593286 ) ) ( not ( = ?auto_593280 ?auto_593287 ) ) ( not ( = ?auto_593280 ?auto_593288 ) ) ( not ( = ?auto_593280 ?auto_593289 ) ) ( not ( = ?auto_593280 ?auto_593290 ) ) ( not ( = ?auto_593281 ?auto_593282 ) ) ( not ( = ?auto_593281 ?auto_593283 ) ) ( not ( = ?auto_593281 ?auto_593284 ) ) ( not ( = ?auto_593281 ?auto_593285 ) ) ( not ( = ?auto_593281 ?auto_593286 ) ) ( not ( = ?auto_593281 ?auto_593287 ) ) ( not ( = ?auto_593281 ?auto_593288 ) ) ( not ( = ?auto_593281 ?auto_593289 ) ) ( not ( = ?auto_593281 ?auto_593290 ) ) ( not ( = ?auto_593282 ?auto_593283 ) ) ( not ( = ?auto_593282 ?auto_593284 ) ) ( not ( = ?auto_593282 ?auto_593285 ) ) ( not ( = ?auto_593282 ?auto_593286 ) ) ( not ( = ?auto_593282 ?auto_593287 ) ) ( not ( = ?auto_593282 ?auto_593288 ) ) ( not ( = ?auto_593282 ?auto_593289 ) ) ( not ( = ?auto_593282 ?auto_593290 ) ) ( not ( = ?auto_593283 ?auto_593284 ) ) ( not ( = ?auto_593283 ?auto_593285 ) ) ( not ( = ?auto_593283 ?auto_593286 ) ) ( not ( = ?auto_593283 ?auto_593287 ) ) ( not ( = ?auto_593283 ?auto_593288 ) ) ( not ( = ?auto_593283 ?auto_593289 ) ) ( not ( = ?auto_593283 ?auto_593290 ) ) ( not ( = ?auto_593284 ?auto_593285 ) ) ( not ( = ?auto_593284 ?auto_593286 ) ) ( not ( = ?auto_593284 ?auto_593287 ) ) ( not ( = ?auto_593284 ?auto_593288 ) ) ( not ( = ?auto_593284 ?auto_593289 ) ) ( not ( = ?auto_593284 ?auto_593290 ) ) ( not ( = ?auto_593285 ?auto_593286 ) ) ( not ( = ?auto_593285 ?auto_593287 ) ) ( not ( = ?auto_593285 ?auto_593288 ) ) ( not ( = ?auto_593285 ?auto_593289 ) ) ( not ( = ?auto_593285 ?auto_593290 ) ) ( not ( = ?auto_593286 ?auto_593287 ) ) ( not ( = ?auto_593286 ?auto_593288 ) ) ( not ( = ?auto_593286 ?auto_593289 ) ) ( not ( = ?auto_593286 ?auto_593290 ) ) ( not ( = ?auto_593287 ?auto_593288 ) ) ( not ( = ?auto_593287 ?auto_593289 ) ) ( not ( = ?auto_593287 ?auto_593290 ) ) ( not ( = ?auto_593288 ?auto_593289 ) ) ( not ( = ?auto_593288 ?auto_593290 ) ) ( not ( = ?auto_593289 ?auto_593290 ) ) ( ON ?auto_593288 ?auto_593289 ) ( CLEAR ?auto_593286 ) ( ON ?auto_593287 ?auto_593288 ) ( CLEAR ?auto_593287 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_593277 ?auto_593278 ?auto_593279 ?auto_593280 ?auto_593281 ?auto_593282 ?auto_593283 ?auto_593284 ?auto_593285 ?auto_593286 ?auto_593287 )
      ( MAKE-13PILE ?auto_593277 ?auto_593278 ?auto_593279 ?auto_593280 ?auto_593281 ?auto_593282 ?auto_593283 ?auto_593284 ?auto_593285 ?auto_593286 ?auto_593287 ?auto_593288 ?auto_593289 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593331 - BLOCK
      ?auto_593332 - BLOCK
      ?auto_593333 - BLOCK
      ?auto_593334 - BLOCK
      ?auto_593335 - BLOCK
      ?auto_593336 - BLOCK
      ?auto_593337 - BLOCK
      ?auto_593338 - BLOCK
      ?auto_593339 - BLOCK
      ?auto_593340 - BLOCK
      ?auto_593341 - BLOCK
      ?auto_593342 - BLOCK
      ?auto_593343 - BLOCK
    )
    :vars
    (
      ?auto_593344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593343 ?auto_593344 ) ( ON-TABLE ?auto_593331 ) ( ON ?auto_593332 ?auto_593331 ) ( ON ?auto_593333 ?auto_593332 ) ( ON ?auto_593334 ?auto_593333 ) ( ON ?auto_593335 ?auto_593334 ) ( ON ?auto_593336 ?auto_593335 ) ( ON ?auto_593337 ?auto_593336 ) ( ON ?auto_593338 ?auto_593337 ) ( ON ?auto_593339 ?auto_593338 ) ( not ( = ?auto_593331 ?auto_593332 ) ) ( not ( = ?auto_593331 ?auto_593333 ) ) ( not ( = ?auto_593331 ?auto_593334 ) ) ( not ( = ?auto_593331 ?auto_593335 ) ) ( not ( = ?auto_593331 ?auto_593336 ) ) ( not ( = ?auto_593331 ?auto_593337 ) ) ( not ( = ?auto_593331 ?auto_593338 ) ) ( not ( = ?auto_593331 ?auto_593339 ) ) ( not ( = ?auto_593331 ?auto_593340 ) ) ( not ( = ?auto_593331 ?auto_593341 ) ) ( not ( = ?auto_593331 ?auto_593342 ) ) ( not ( = ?auto_593331 ?auto_593343 ) ) ( not ( = ?auto_593331 ?auto_593344 ) ) ( not ( = ?auto_593332 ?auto_593333 ) ) ( not ( = ?auto_593332 ?auto_593334 ) ) ( not ( = ?auto_593332 ?auto_593335 ) ) ( not ( = ?auto_593332 ?auto_593336 ) ) ( not ( = ?auto_593332 ?auto_593337 ) ) ( not ( = ?auto_593332 ?auto_593338 ) ) ( not ( = ?auto_593332 ?auto_593339 ) ) ( not ( = ?auto_593332 ?auto_593340 ) ) ( not ( = ?auto_593332 ?auto_593341 ) ) ( not ( = ?auto_593332 ?auto_593342 ) ) ( not ( = ?auto_593332 ?auto_593343 ) ) ( not ( = ?auto_593332 ?auto_593344 ) ) ( not ( = ?auto_593333 ?auto_593334 ) ) ( not ( = ?auto_593333 ?auto_593335 ) ) ( not ( = ?auto_593333 ?auto_593336 ) ) ( not ( = ?auto_593333 ?auto_593337 ) ) ( not ( = ?auto_593333 ?auto_593338 ) ) ( not ( = ?auto_593333 ?auto_593339 ) ) ( not ( = ?auto_593333 ?auto_593340 ) ) ( not ( = ?auto_593333 ?auto_593341 ) ) ( not ( = ?auto_593333 ?auto_593342 ) ) ( not ( = ?auto_593333 ?auto_593343 ) ) ( not ( = ?auto_593333 ?auto_593344 ) ) ( not ( = ?auto_593334 ?auto_593335 ) ) ( not ( = ?auto_593334 ?auto_593336 ) ) ( not ( = ?auto_593334 ?auto_593337 ) ) ( not ( = ?auto_593334 ?auto_593338 ) ) ( not ( = ?auto_593334 ?auto_593339 ) ) ( not ( = ?auto_593334 ?auto_593340 ) ) ( not ( = ?auto_593334 ?auto_593341 ) ) ( not ( = ?auto_593334 ?auto_593342 ) ) ( not ( = ?auto_593334 ?auto_593343 ) ) ( not ( = ?auto_593334 ?auto_593344 ) ) ( not ( = ?auto_593335 ?auto_593336 ) ) ( not ( = ?auto_593335 ?auto_593337 ) ) ( not ( = ?auto_593335 ?auto_593338 ) ) ( not ( = ?auto_593335 ?auto_593339 ) ) ( not ( = ?auto_593335 ?auto_593340 ) ) ( not ( = ?auto_593335 ?auto_593341 ) ) ( not ( = ?auto_593335 ?auto_593342 ) ) ( not ( = ?auto_593335 ?auto_593343 ) ) ( not ( = ?auto_593335 ?auto_593344 ) ) ( not ( = ?auto_593336 ?auto_593337 ) ) ( not ( = ?auto_593336 ?auto_593338 ) ) ( not ( = ?auto_593336 ?auto_593339 ) ) ( not ( = ?auto_593336 ?auto_593340 ) ) ( not ( = ?auto_593336 ?auto_593341 ) ) ( not ( = ?auto_593336 ?auto_593342 ) ) ( not ( = ?auto_593336 ?auto_593343 ) ) ( not ( = ?auto_593336 ?auto_593344 ) ) ( not ( = ?auto_593337 ?auto_593338 ) ) ( not ( = ?auto_593337 ?auto_593339 ) ) ( not ( = ?auto_593337 ?auto_593340 ) ) ( not ( = ?auto_593337 ?auto_593341 ) ) ( not ( = ?auto_593337 ?auto_593342 ) ) ( not ( = ?auto_593337 ?auto_593343 ) ) ( not ( = ?auto_593337 ?auto_593344 ) ) ( not ( = ?auto_593338 ?auto_593339 ) ) ( not ( = ?auto_593338 ?auto_593340 ) ) ( not ( = ?auto_593338 ?auto_593341 ) ) ( not ( = ?auto_593338 ?auto_593342 ) ) ( not ( = ?auto_593338 ?auto_593343 ) ) ( not ( = ?auto_593338 ?auto_593344 ) ) ( not ( = ?auto_593339 ?auto_593340 ) ) ( not ( = ?auto_593339 ?auto_593341 ) ) ( not ( = ?auto_593339 ?auto_593342 ) ) ( not ( = ?auto_593339 ?auto_593343 ) ) ( not ( = ?auto_593339 ?auto_593344 ) ) ( not ( = ?auto_593340 ?auto_593341 ) ) ( not ( = ?auto_593340 ?auto_593342 ) ) ( not ( = ?auto_593340 ?auto_593343 ) ) ( not ( = ?auto_593340 ?auto_593344 ) ) ( not ( = ?auto_593341 ?auto_593342 ) ) ( not ( = ?auto_593341 ?auto_593343 ) ) ( not ( = ?auto_593341 ?auto_593344 ) ) ( not ( = ?auto_593342 ?auto_593343 ) ) ( not ( = ?auto_593342 ?auto_593344 ) ) ( not ( = ?auto_593343 ?auto_593344 ) ) ( ON ?auto_593342 ?auto_593343 ) ( ON ?auto_593341 ?auto_593342 ) ( CLEAR ?auto_593339 ) ( ON ?auto_593340 ?auto_593341 ) ( CLEAR ?auto_593340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_593331 ?auto_593332 ?auto_593333 ?auto_593334 ?auto_593335 ?auto_593336 ?auto_593337 ?auto_593338 ?auto_593339 ?auto_593340 )
      ( MAKE-13PILE ?auto_593331 ?auto_593332 ?auto_593333 ?auto_593334 ?auto_593335 ?auto_593336 ?auto_593337 ?auto_593338 ?auto_593339 ?auto_593340 ?auto_593341 ?auto_593342 ?auto_593343 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593385 - BLOCK
      ?auto_593386 - BLOCK
      ?auto_593387 - BLOCK
      ?auto_593388 - BLOCK
      ?auto_593389 - BLOCK
      ?auto_593390 - BLOCK
      ?auto_593391 - BLOCK
      ?auto_593392 - BLOCK
      ?auto_593393 - BLOCK
      ?auto_593394 - BLOCK
      ?auto_593395 - BLOCK
      ?auto_593396 - BLOCK
      ?auto_593397 - BLOCK
    )
    :vars
    (
      ?auto_593398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593397 ?auto_593398 ) ( ON-TABLE ?auto_593385 ) ( ON ?auto_593386 ?auto_593385 ) ( ON ?auto_593387 ?auto_593386 ) ( ON ?auto_593388 ?auto_593387 ) ( ON ?auto_593389 ?auto_593388 ) ( ON ?auto_593390 ?auto_593389 ) ( ON ?auto_593391 ?auto_593390 ) ( ON ?auto_593392 ?auto_593391 ) ( not ( = ?auto_593385 ?auto_593386 ) ) ( not ( = ?auto_593385 ?auto_593387 ) ) ( not ( = ?auto_593385 ?auto_593388 ) ) ( not ( = ?auto_593385 ?auto_593389 ) ) ( not ( = ?auto_593385 ?auto_593390 ) ) ( not ( = ?auto_593385 ?auto_593391 ) ) ( not ( = ?auto_593385 ?auto_593392 ) ) ( not ( = ?auto_593385 ?auto_593393 ) ) ( not ( = ?auto_593385 ?auto_593394 ) ) ( not ( = ?auto_593385 ?auto_593395 ) ) ( not ( = ?auto_593385 ?auto_593396 ) ) ( not ( = ?auto_593385 ?auto_593397 ) ) ( not ( = ?auto_593385 ?auto_593398 ) ) ( not ( = ?auto_593386 ?auto_593387 ) ) ( not ( = ?auto_593386 ?auto_593388 ) ) ( not ( = ?auto_593386 ?auto_593389 ) ) ( not ( = ?auto_593386 ?auto_593390 ) ) ( not ( = ?auto_593386 ?auto_593391 ) ) ( not ( = ?auto_593386 ?auto_593392 ) ) ( not ( = ?auto_593386 ?auto_593393 ) ) ( not ( = ?auto_593386 ?auto_593394 ) ) ( not ( = ?auto_593386 ?auto_593395 ) ) ( not ( = ?auto_593386 ?auto_593396 ) ) ( not ( = ?auto_593386 ?auto_593397 ) ) ( not ( = ?auto_593386 ?auto_593398 ) ) ( not ( = ?auto_593387 ?auto_593388 ) ) ( not ( = ?auto_593387 ?auto_593389 ) ) ( not ( = ?auto_593387 ?auto_593390 ) ) ( not ( = ?auto_593387 ?auto_593391 ) ) ( not ( = ?auto_593387 ?auto_593392 ) ) ( not ( = ?auto_593387 ?auto_593393 ) ) ( not ( = ?auto_593387 ?auto_593394 ) ) ( not ( = ?auto_593387 ?auto_593395 ) ) ( not ( = ?auto_593387 ?auto_593396 ) ) ( not ( = ?auto_593387 ?auto_593397 ) ) ( not ( = ?auto_593387 ?auto_593398 ) ) ( not ( = ?auto_593388 ?auto_593389 ) ) ( not ( = ?auto_593388 ?auto_593390 ) ) ( not ( = ?auto_593388 ?auto_593391 ) ) ( not ( = ?auto_593388 ?auto_593392 ) ) ( not ( = ?auto_593388 ?auto_593393 ) ) ( not ( = ?auto_593388 ?auto_593394 ) ) ( not ( = ?auto_593388 ?auto_593395 ) ) ( not ( = ?auto_593388 ?auto_593396 ) ) ( not ( = ?auto_593388 ?auto_593397 ) ) ( not ( = ?auto_593388 ?auto_593398 ) ) ( not ( = ?auto_593389 ?auto_593390 ) ) ( not ( = ?auto_593389 ?auto_593391 ) ) ( not ( = ?auto_593389 ?auto_593392 ) ) ( not ( = ?auto_593389 ?auto_593393 ) ) ( not ( = ?auto_593389 ?auto_593394 ) ) ( not ( = ?auto_593389 ?auto_593395 ) ) ( not ( = ?auto_593389 ?auto_593396 ) ) ( not ( = ?auto_593389 ?auto_593397 ) ) ( not ( = ?auto_593389 ?auto_593398 ) ) ( not ( = ?auto_593390 ?auto_593391 ) ) ( not ( = ?auto_593390 ?auto_593392 ) ) ( not ( = ?auto_593390 ?auto_593393 ) ) ( not ( = ?auto_593390 ?auto_593394 ) ) ( not ( = ?auto_593390 ?auto_593395 ) ) ( not ( = ?auto_593390 ?auto_593396 ) ) ( not ( = ?auto_593390 ?auto_593397 ) ) ( not ( = ?auto_593390 ?auto_593398 ) ) ( not ( = ?auto_593391 ?auto_593392 ) ) ( not ( = ?auto_593391 ?auto_593393 ) ) ( not ( = ?auto_593391 ?auto_593394 ) ) ( not ( = ?auto_593391 ?auto_593395 ) ) ( not ( = ?auto_593391 ?auto_593396 ) ) ( not ( = ?auto_593391 ?auto_593397 ) ) ( not ( = ?auto_593391 ?auto_593398 ) ) ( not ( = ?auto_593392 ?auto_593393 ) ) ( not ( = ?auto_593392 ?auto_593394 ) ) ( not ( = ?auto_593392 ?auto_593395 ) ) ( not ( = ?auto_593392 ?auto_593396 ) ) ( not ( = ?auto_593392 ?auto_593397 ) ) ( not ( = ?auto_593392 ?auto_593398 ) ) ( not ( = ?auto_593393 ?auto_593394 ) ) ( not ( = ?auto_593393 ?auto_593395 ) ) ( not ( = ?auto_593393 ?auto_593396 ) ) ( not ( = ?auto_593393 ?auto_593397 ) ) ( not ( = ?auto_593393 ?auto_593398 ) ) ( not ( = ?auto_593394 ?auto_593395 ) ) ( not ( = ?auto_593394 ?auto_593396 ) ) ( not ( = ?auto_593394 ?auto_593397 ) ) ( not ( = ?auto_593394 ?auto_593398 ) ) ( not ( = ?auto_593395 ?auto_593396 ) ) ( not ( = ?auto_593395 ?auto_593397 ) ) ( not ( = ?auto_593395 ?auto_593398 ) ) ( not ( = ?auto_593396 ?auto_593397 ) ) ( not ( = ?auto_593396 ?auto_593398 ) ) ( not ( = ?auto_593397 ?auto_593398 ) ) ( ON ?auto_593396 ?auto_593397 ) ( ON ?auto_593395 ?auto_593396 ) ( ON ?auto_593394 ?auto_593395 ) ( CLEAR ?auto_593392 ) ( ON ?auto_593393 ?auto_593394 ) ( CLEAR ?auto_593393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_593385 ?auto_593386 ?auto_593387 ?auto_593388 ?auto_593389 ?auto_593390 ?auto_593391 ?auto_593392 ?auto_593393 )
      ( MAKE-13PILE ?auto_593385 ?auto_593386 ?auto_593387 ?auto_593388 ?auto_593389 ?auto_593390 ?auto_593391 ?auto_593392 ?auto_593393 ?auto_593394 ?auto_593395 ?auto_593396 ?auto_593397 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593439 - BLOCK
      ?auto_593440 - BLOCK
      ?auto_593441 - BLOCK
      ?auto_593442 - BLOCK
      ?auto_593443 - BLOCK
      ?auto_593444 - BLOCK
      ?auto_593445 - BLOCK
      ?auto_593446 - BLOCK
      ?auto_593447 - BLOCK
      ?auto_593448 - BLOCK
      ?auto_593449 - BLOCK
      ?auto_593450 - BLOCK
      ?auto_593451 - BLOCK
    )
    :vars
    (
      ?auto_593452 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593451 ?auto_593452 ) ( ON-TABLE ?auto_593439 ) ( ON ?auto_593440 ?auto_593439 ) ( ON ?auto_593441 ?auto_593440 ) ( ON ?auto_593442 ?auto_593441 ) ( ON ?auto_593443 ?auto_593442 ) ( ON ?auto_593444 ?auto_593443 ) ( ON ?auto_593445 ?auto_593444 ) ( not ( = ?auto_593439 ?auto_593440 ) ) ( not ( = ?auto_593439 ?auto_593441 ) ) ( not ( = ?auto_593439 ?auto_593442 ) ) ( not ( = ?auto_593439 ?auto_593443 ) ) ( not ( = ?auto_593439 ?auto_593444 ) ) ( not ( = ?auto_593439 ?auto_593445 ) ) ( not ( = ?auto_593439 ?auto_593446 ) ) ( not ( = ?auto_593439 ?auto_593447 ) ) ( not ( = ?auto_593439 ?auto_593448 ) ) ( not ( = ?auto_593439 ?auto_593449 ) ) ( not ( = ?auto_593439 ?auto_593450 ) ) ( not ( = ?auto_593439 ?auto_593451 ) ) ( not ( = ?auto_593439 ?auto_593452 ) ) ( not ( = ?auto_593440 ?auto_593441 ) ) ( not ( = ?auto_593440 ?auto_593442 ) ) ( not ( = ?auto_593440 ?auto_593443 ) ) ( not ( = ?auto_593440 ?auto_593444 ) ) ( not ( = ?auto_593440 ?auto_593445 ) ) ( not ( = ?auto_593440 ?auto_593446 ) ) ( not ( = ?auto_593440 ?auto_593447 ) ) ( not ( = ?auto_593440 ?auto_593448 ) ) ( not ( = ?auto_593440 ?auto_593449 ) ) ( not ( = ?auto_593440 ?auto_593450 ) ) ( not ( = ?auto_593440 ?auto_593451 ) ) ( not ( = ?auto_593440 ?auto_593452 ) ) ( not ( = ?auto_593441 ?auto_593442 ) ) ( not ( = ?auto_593441 ?auto_593443 ) ) ( not ( = ?auto_593441 ?auto_593444 ) ) ( not ( = ?auto_593441 ?auto_593445 ) ) ( not ( = ?auto_593441 ?auto_593446 ) ) ( not ( = ?auto_593441 ?auto_593447 ) ) ( not ( = ?auto_593441 ?auto_593448 ) ) ( not ( = ?auto_593441 ?auto_593449 ) ) ( not ( = ?auto_593441 ?auto_593450 ) ) ( not ( = ?auto_593441 ?auto_593451 ) ) ( not ( = ?auto_593441 ?auto_593452 ) ) ( not ( = ?auto_593442 ?auto_593443 ) ) ( not ( = ?auto_593442 ?auto_593444 ) ) ( not ( = ?auto_593442 ?auto_593445 ) ) ( not ( = ?auto_593442 ?auto_593446 ) ) ( not ( = ?auto_593442 ?auto_593447 ) ) ( not ( = ?auto_593442 ?auto_593448 ) ) ( not ( = ?auto_593442 ?auto_593449 ) ) ( not ( = ?auto_593442 ?auto_593450 ) ) ( not ( = ?auto_593442 ?auto_593451 ) ) ( not ( = ?auto_593442 ?auto_593452 ) ) ( not ( = ?auto_593443 ?auto_593444 ) ) ( not ( = ?auto_593443 ?auto_593445 ) ) ( not ( = ?auto_593443 ?auto_593446 ) ) ( not ( = ?auto_593443 ?auto_593447 ) ) ( not ( = ?auto_593443 ?auto_593448 ) ) ( not ( = ?auto_593443 ?auto_593449 ) ) ( not ( = ?auto_593443 ?auto_593450 ) ) ( not ( = ?auto_593443 ?auto_593451 ) ) ( not ( = ?auto_593443 ?auto_593452 ) ) ( not ( = ?auto_593444 ?auto_593445 ) ) ( not ( = ?auto_593444 ?auto_593446 ) ) ( not ( = ?auto_593444 ?auto_593447 ) ) ( not ( = ?auto_593444 ?auto_593448 ) ) ( not ( = ?auto_593444 ?auto_593449 ) ) ( not ( = ?auto_593444 ?auto_593450 ) ) ( not ( = ?auto_593444 ?auto_593451 ) ) ( not ( = ?auto_593444 ?auto_593452 ) ) ( not ( = ?auto_593445 ?auto_593446 ) ) ( not ( = ?auto_593445 ?auto_593447 ) ) ( not ( = ?auto_593445 ?auto_593448 ) ) ( not ( = ?auto_593445 ?auto_593449 ) ) ( not ( = ?auto_593445 ?auto_593450 ) ) ( not ( = ?auto_593445 ?auto_593451 ) ) ( not ( = ?auto_593445 ?auto_593452 ) ) ( not ( = ?auto_593446 ?auto_593447 ) ) ( not ( = ?auto_593446 ?auto_593448 ) ) ( not ( = ?auto_593446 ?auto_593449 ) ) ( not ( = ?auto_593446 ?auto_593450 ) ) ( not ( = ?auto_593446 ?auto_593451 ) ) ( not ( = ?auto_593446 ?auto_593452 ) ) ( not ( = ?auto_593447 ?auto_593448 ) ) ( not ( = ?auto_593447 ?auto_593449 ) ) ( not ( = ?auto_593447 ?auto_593450 ) ) ( not ( = ?auto_593447 ?auto_593451 ) ) ( not ( = ?auto_593447 ?auto_593452 ) ) ( not ( = ?auto_593448 ?auto_593449 ) ) ( not ( = ?auto_593448 ?auto_593450 ) ) ( not ( = ?auto_593448 ?auto_593451 ) ) ( not ( = ?auto_593448 ?auto_593452 ) ) ( not ( = ?auto_593449 ?auto_593450 ) ) ( not ( = ?auto_593449 ?auto_593451 ) ) ( not ( = ?auto_593449 ?auto_593452 ) ) ( not ( = ?auto_593450 ?auto_593451 ) ) ( not ( = ?auto_593450 ?auto_593452 ) ) ( not ( = ?auto_593451 ?auto_593452 ) ) ( ON ?auto_593450 ?auto_593451 ) ( ON ?auto_593449 ?auto_593450 ) ( ON ?auto_593448 ?auto_593449 ) ( ON ?auto_593447 ?auto_593448 ) ( CLEAR ?auto_593445 ) ( ON ?auto_593446 ?auto_593447 ) ( CLEAR ?auto_593446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_593439 ?auto_593440 ?auto_593441 ?auto_593442 ?auto_593443 ?auto_593444 ?auto_593445 ?auto_593446 )
      ( MAKE-13PILE ?auto_593439 ?auto_593440 ?auto_593441 ?auto_593442 ?auto_593443 ?auto_593444 ?auto_593445 ?auto_593446 ?auto_593447 ?auto_593448 ?auto_593449 ?auto_593450 ?auto_593451 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593493 - BLOCK
      ?auto_593494 - BLOCK
      ?auto_593495 - BLOCK
      ?auto_593496 - BLOCK
      ?auto_593497 - BLOCK
      ?auto_593498 - BLOCK
      ?auto_593499 - BLOCK
      ?auto_593500 - BLOCK
      ?auto_593501 - BLOCK
      ?auto_593502 - BLOCK
      ?auto_593503 - BLOCK
      ?auto_593504 - BLOCK
      ?auto_593505 - BLOCK
    )
    :vars
    (
      ?auto_593506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593505 ?auto_593506 ) ( ON-TABLE ?auto_593493 ) ( ON ?auto_593494 ?auto_593493 ) ( ON ?auto_593495 ?auto_593494 ) ( ON ?auto_593496 ?auto_593495 ) ( ON ?auto_593497 ?auto_593496 ) ( ON ?auto_593498 ?auto_593497 ) ( not ( = ?auto_593493 ?auto_593494 ) ) ( not ( = ?auto_593493 ?auto_593495 ) ) ( not ( = ?auto_593493 ?auto_593496 ) ) ( not ( = ?auto_593493 ?auto_593497 ) ) ( not ( = ?auto_593493 ?auto_593498 ) ) ( not ( = ?auto_593493 ?auto_593499 ) ) ( not ( = ?auto_593493 ?auto_593500 ) ) ( not ( = ?auto_593493 ?auto_593501 ) ) ( not ( = ?auto_593493 ?auto_593502 ) ) ( not ( = ?auto_593493 ?auto_593503 ) ) ( not ( = ?auto_593493 ?auto_593504 ) ) ( not ( = ?auto_593493 ?auto_593505 ) ) ( not ( = ?auto_593493 ?auto_593506 ) ) ( not ( = ?auto_593494 ?auto_593495 ) ) ( not ( = ?auto_593494 ?auto_593496 ) ) ( not ( = ?auto_593494 ?auto_593497 ) ) ( not ( = ?auto_593494 ?auto_593498 ) ) ( not ( = ?auto_593494 ?auto_593499 ) ) ( not ( = ?auto_593494 ?auto_593500 ) ) ( not ( = ?auto_593494 ?auto_593501 ) ) ( not ( = ?auto_593494 ?auto_593502 ) ) ( not ( = ?auto_593494 ?auto_593503 ) ) ( not ( = ?auto_593494 ?auto_593504 ) ) ( not ( = ?auto_593494 ?auto_593505 ) ) ( not ( = ?auto_593494 ?auto_593506 ) ) ( not ( = ?auto_593495 ?auto_593496 ) ) ( not ( = ?auto_593495 ?auto_593497 ) ) ( not ( = ?auto_593495 ?auto_593498 ) ) ( not ( = ?auto_593495 ?auto_593499 ) ) ( not ( = ?auto_593495 ?auto_593500 ) ) ( not ( = ?auto_593495 ?auto_593501 ) ) ( not ( = ?auto_593495 ?auto_593502 ) ) ( not ( = ?auto_593495 ?auto_593503 ) ) ( not ( = ?auto_593495 ?auto_593504 ) ) ( not ( = ?auto_593495 ?auto_593505 ) ) ( not ( = ?auto_593495 ?auto_593506 ) ) ( not ( = ?auto_593496 ?auto_593497 ) ) ( not ( = ?auto_593496 ?auto_593498 ) ) ( not ( = ?auto_593496 ?auto_593499 ) ) ( not ( = ?auto_593496 ?auto_593500 ) ) ( not ( = ?auto_593496 ?auto_593501 ) ) ( not ( = ?auto_593496 ?auto_593502 ) ) ( not ( = ?auto_593496 ?auto_593503 ) ) ( not ( = ?auto_593496 ?auto_593504 ) ) ( not ( = ?auto_593496 ?auto_593505 ) ) ( not ( = ?auto_593496 ?auto_593506 ) ) ( not ( = ?auto_593497 ?auto_593498 ) ) ( not ( = ?auto_593497 ?auto_593499 ) ) ( not ( = ?auto_593497 ?auto_593500 ) ) ( not ( = ?auto_593497 ?auto_593501 ) ) ( not ( = ?auto_593497 ?auto_593502 ) ) ( not ( = ?auto_593497 ?auto_593503 ) ) ( not ( = ?auto_593497 ?auto_593504 ) ) ( not ( = ?auto_593497 ?auto_593505 ) ) ( not ( = ?auto_593497 ?auto_593506 ) ) ( not ( = ?auto_593498 ?auto_593499 ) ) ( not ( = ?auto_593498 ?auto_593500 ) ) ( not ( = ?auto_593498 ?auto_593501 ) ) ( not ( = ?auto_593498 ?auto_593502 ) ) ( not ( = ?auto_593498 ?auto_593503 ) ) ( not ( = ?auto_593498 ?auto_593504 ) ) ( not ( = ?auto_593498 ?auto_593505 ) ) ( not ( = ?auto_593498 ?auto_593506 ) ) ( not ( = ?auto_593499 ?auto_593500 ) ) ( not ( = ?auto_593499 ?auto_593501 ) ) ( not ( = ?auto_593499 ?auto_593502 ) ) ( not ( = ?auto_593499 ?auto_593503 ) ) ( not ( = ?auto_593499 ?auto_593504 ) ) ( not ( = ?auto_593499 ?auto_593505 ) ) ( not ( = ?auto_593499 ?auto_593506 ) ) ( not ( = ?auto_593500 ?auto_593501 ) ) ( not ( = ?auto_593500 ?auto_593502 ) ) ( not ( = ?auto_593500 ?auto_593503 ) ) ( not ( = ?auto_593500 ?auto_593504 ) ) ( not ( = ?auto_593500 ?auto_593505 ) ) ( not ( = ?auto_593500 ?auto_593506 ) ) ( not ( = ?auto_593501 ?auto_593502 ) ) ( not ( = ?auto_593501 ?auto_593503 ) ) ( not ( = ?auto_593501 ?auto_593504 ) ) ( not ( = ?auto_593501 ?auto_593505 ) ) ( not ( = ?auto_593501 ?auto_593506 ) ) ( not ( = ?auto_593502 ?auto_593503 ) ) ( not ( = ?auto_593502 ?auto_593504 ) ) ( not ( = ?auto_593502 ?auto_593505 ) ) ( not ( = ?auto_593502 ?auto_593506 ) ) ( not ( = ?auto_593503 ?auto_593504 ) ) ( not ( = ?auto_593503 ?auto_593505 ) ) ( not ( = ?auto_593503 ?auto_593506 ) ) ( not ( = ?auto_593504 ?auto_593505 ) ) ( not ( = ?auto_593504 ?auto_593506 ) ) ( not ( = ?auto_593505 ?auto_593506 ) ) ( ON ?auto_593504 ?auto_593505 ) ( ON ?auto_593503 ?auto_593504 ) ( ON ?auto_593502 ?auto_593503 ) ( ON ?auto_593501 ?auto_593502 ) ( ON ?auto_593500 ?auto_593501 ) ( CLEAR ?auto_593498 ) ( ON ?auto_593499 ?auto_593500 ) ( CLEAR ?auto_593499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_593493 ?auto_593494 ?auto_593495 ?auto_593496 ?auto_593497 ?auto_593498 ?auto_593499 )
      ( MAKE-13PILE ?auto_593493 ?auto_593494 ?auto_593495 ?auto_593496 ?auto_593497 ?auto_593498 ?auto_593499 ?auto_593500 ?auto_593501 ?auto_593502 ?auto_593503 ?auto_593504 ?auto_593505 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593547 - BLOCK
      ?auto_593548 - BLOCK
      ?auto_593549 - BLOCK
      ?auto_593550 - BLOCK
      ?auto_593551 - BLOCK
      ?auto_593552 - BLOCK
      ?auto_593553 - BLOCK
      ?auto_593554 - BLOCK
      ?auto_593555 - BLOCK
      ?auto_593556 - BLOCK
      ?auto_593557 - BLOCK
      ?auto_593558 - BLOCK
      ?auto_593559 - BLOCK
    )
    :vars
    (
      ?auto_593560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593559 ?auto_593560 ) ( ON-TABLE ?auto_593547 ) ( ON ?auto_593548 ?auto_593547 ) ( ON ?auto_593549 ?auto_593548 ) ( ON ?auto_593550 ?auto_593549 ) ( ON ?auto_593551 ?auto_593550 ) ( not ( = ?auto_593547 ?auto_593548 ) ) ( not ( = ?auto_593547 ?auto_593549 ) ) ( not ( = ?auto_593547 ?auto_593550 ) ) ( not ( = ?auto_593547 ?auto_593551 ) ) ( not ( = ?auto_593547 ?auto_593552 ) ) ( not ( = ?auto_593547 ?auto_593553 ) ) ( not ( = ?auto_593547 ?auto_593554 ) ) ( not ( = ?auto_593547 ?auto_593555 ) ) ( not ( = ?auto_593547 ?auto_593556 ) ) ( not ( = ?auto_593547 ?auto_593557 ) ) ( not ( = ?auto_593547 ?auto_593558 ) ) ( not ( = ?auto_593547 ?auto_593559 ) ) ( not ( = ?auto_593547 ?auto_593560 ) ) ( not ( = ?auto_593548 ?auto_593549 ) ) ( not ( = ?auto_593548 ?auto_593550 ) ) ( not ( = ?auto_593548 ?auto_593551 ) ) ( not ( = ?auto_593548 ?auto_593552 ) ) ( not ( = ?auto_593548 ?auto_593553 ) ) ( not ( = ?auto_593548 ?auto_593554 ) ) ( not ( = ?auto_593548 ?auto_593555 ) ) ( not ( = ?auto_593548 ?auto_593556 ) ) ( not ( = ?auto_593548 ?auto_593557 ) ) ( not ( = ?auto_593548 ?auto_593558 ) ) ( not ( = ?auto_593548 ?auto_593559 ) ) ( not ( = ?auto_593548 ?auto_593560 ) ) ( not ( = ?auto_593549 ?auto_593550 ) ) ( not ( = ?auto_593549 ?auto_593551 ) ) ( not ( = ?auto_593549 ?auto_593552 ) ) ( not ( = ?auto_593549 ?auto_593553 ) ) ( not ( = ?auto_593549 ?auto_593554 ) ) ( not ( = ?auto_593549 ?auto_593555 ) ) ( not ( = ?auto_593549 ?auto_593556 ) ) ( not ( = ?auto_593549 ?auto_593557 ) ) ( not ( = ?auto_593549 ?auto_593558 ) ) ( not ( = ?auto_593549 ?auto_593559 ) ) ( not ( = ?auto_593549 ?auto_593560 ) ) ( not ( = ?auto_593550 ?auto_593551 ) ) ( not ( = ?auto_593550 ?auto_593552 ) ) ( not ( = ?auto_593550 ?auto_593553 ) ) ( not ( = ?auto_593550 ?auto_593554 ) ) ( not ( = ?auto_593550 ?auto_593555 ) ) ( not ( = ?auto_593550 ?auto_593556 ) ) ( not ( = ?auto_593550 ?auto_593557 ) ) ( not ( = ?auto_593550 ?auto_593558 ) ) ( not ( = ?auto_593550 ?auto_593559 ) ) ( not ( = ?auto_593550 ?auto_593560 ) ) ( not ( = ?auto_593551 ?auto_593552 ) ) ( not ( = ?auto_593551 ?auto_593553 ) ) ( not ( = ?auto_593551 ?auto_593554 ) ) ( not ( = ?auto_593551 ?auto_593555 ) ) ( not ( = ?auto_593551 ?auto_593556 ) ) ( not ( = ?auto_593551 ?auto_593557 ) ) ( not ( = ?auto_593551 ?auto_593558 ) ) ( not ( = ?auto_593551 ?auto_593559 ) ) ( not ( = ?auto_593551 ?auto_593560 ) ) ( not ( = ?auto_593552 ?auto_593553 ) ) ( not ( = ?auto_593552 ?auto_593554 ) ) ( not ( = ?auto_593552 ?auto_593555 ) ) ( not ( = ?auto_593552 ?auto_593556 ) ) ( not ( = ?auto_593552 ?auto_593557 ) ) ( not ( = ?auto_593552 ?auto_593558 ) ) ( not ( = ?auto_593552 ?auto_593559 ) ) ( not ( = ?auto_593552 ?auto_593560 ) ) ( not ( = ?auto_593553 ?auto_593554 ) ) ( not ( = ?auto_593553 ?auto_593555 ) ) ( not ( = ?auto_593553 ?auto_593556 ) ) ( not ( = ?auto_593553 ?auto_593557 ) ) ( not ( = ?auto_593553 ?auto_593558 ) ) ( not ( = ?auto_593553 ?auto_593559 ) ) ( not ( = ?auto_593553 ?auto_593560 ) ) ( not ( = ?auto_593554 ?auto_593555 ) ) ( not ( = ?auto_593554 ?auto_593556 ) ) ( not ( = ?auto_593554 ?auto_593557 ) ) ( not ( = ?auto_593554 ?auto_593558 ) ) ( not ( = ?auto_593554 ?auto_593559 ) ) ( not ( = ?auto_593554 ?auto_593560 ) ) ( not ( = ?auto_593555 ?auto_593556 ) ) ( not ( = ?auto_593555 ?auto_593557 ) ) ( not ( = ?auto_593555 ?auto_593558 ) ) ( not ( = ?auto_593555 ?auto_593559 ) ) ( not ( = ?auto_593555 ?auto_593560 ) ) ( not ( = ?auto_593556 ?auto_593557 ) ) ( not ( = ?auto_593556 ?auto_593558 ) ) ( not ( = ?auto_593556 ?auto_593559 ) ) ( not ( = ?auto_593556 ?auto_593560 ) ) ( not ( = ?auto_593557 ?auto_593558 ) ) ( not ( = ?auto_593557 ?auto_593559 ) ) ( not ( = ?auto_593557 ?auto_593560 ) ) ( not ( = ?auto_593558 ?auto_593559 ) ) ( not ( = ?auto_593558 ?auto_593560 ) ) ( not ( = ?auto_593559 ?auto_593560 ) ) ( ON ?auto_593558 ?auto_593559 ) ( ON ?auto_593557 ?auto_593558 ) ( ON ?auto_593556 ?auto_593557 ) ( ON ?auto_593555 ?auto_593556 ) ( ON ?auto_593554 ?auto_593555 ) ( ON ?auto_593553 ?auto_593554 ) ( CLEAR ?auto_593551 ) ( ON ?auto_593552 ?auto_593553 ) ( CLEAR ?auto_593552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_593547 ?auto_593548 ?auto_593549 ?auto_593550 ?auto_593551 ?auto_593552 )
      ( MAKE-13PILE ?auto_593547 ?auto_593548 ?auto_593549 ?auto_593550 ?auto_593551 ?auto_593552 ?auto_593553 ?auto_593554 ?auto_593555 ?auto_593556 ?auto_593557 ?auto_593558 ?auto_593559 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593601 - BLOCK
      ?auto_593602 - BLOCK
      ?auto_593603 - BLOCK
      ?auto_593604 - BLOCK
      ?auto_593605 - BLOCK
      ?auto_593606 - BLOCK
      ?auto_593607 - BLOCK
      ?auto_593608 - BLOCK
      ?auto_593609 - BLOCK
      ?auto_593610 - BLOCK
      ?auto_593611 - BLOCK
      ?auto_593612 - BLOCK
      ?auto_593613 - BLOCK
    )
    :vars
    (
      ?auto_593614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593613 ?auto_593614 ) ( ON-TABLE ?auto_593601 ) ( ON ?auto_593602 ?auto_593601 ) ( ON ?auto_593603 ?auto_593602 ) ( ON ?auto_593604 ?auto_593603 ) ( not ( = ?auto_593601 ?auto_593602 ) ) ( not ( = ?auto_593601 ?auto_593603 ) ) ( not ( = ?auto_593601 ?auto_593604 ) ) ( not ( = ?auto_593601 ?auto_593605 ) ) ( not ( = ?auto_593601 ?auto_593606 ) ) ( not ( = ?auto_593601 ?auto_593607 ) ) ( not ( = ?auto_593601 ?auto_593608 ) ) ( not ( = ?auto_593601 ?auto_593609 ) ) ( not ( = ?auto_593601 ?auto_593610 ) ) ( not ( = ?auto_593601 ?auto_593611 ) ) ( not ( = ?auto_593601 ?auto_593612 ) ) ( not ( = ?auto_593601 ?auto_593613 ) ) ( not ( = ?auto_593601 ?auto_593614 ) ) ( not ( = ?auto_593602 ?auto_593603 ) ) ( not ( = ?auto_593602 ?auto_593604 ) ) ( not ( = ?auto_593602 ?auto_593605 ) ) ( not ( = ?auto_593602 ?auto_593606 ) ) ( not ( = ?auto_593602 ?auto_593607 ) ) ( not ( = ?auto_593602 ?auto_593608 ) ) ( not ( = ?auto_593602 ?auto_593609 ) ) ( not ( = ?auto_593602 ?auto_593610 ) ) ( not ( = ?auto_593602 ?auto_593611 ) ) ( not ( = ?auto_593602 ?auto_593612 ) ) ( not ( = ?auto_593602 ?auto_593613 ) ) ( not ( = ?auto_593602 ?auto_593614 ) ) ( not ( = ?auto_593603 ?auto_593604 ) ) ( not ( = ?auto_593603 ?auto_593605 ) ) ( not ( = ?auto_593603 ?auto_593606 ) ) ( not ( = ?auto_593603 ?auto_593607 ) ) ( not ( = ?auto_593603 ?auto_593608 ) ) ( not ( = ?auto_593603 ?auto_593609 ) ) ( not ( = ?auto_593603 ?auto_593610 ) ) ( not ( = ?auto_593603 ?auto_593611 ) ) ( not ( = ?auto_593603 ?auto_593612 ) ) ( not ( = ?auto_593603 ?auto_593613 ) ) ( not ( = ?auto_593603 ?auto_593614 ) ) ( not ( = ?auto_593604 ?auto_593605 ) ) ( not ( = ?auto_593604 ?auto_593606 ) ) ( not ( = ?auto_593604 ?auto_593607 ) ) ( not ( = ?auto_593604 ?auto_593608 ) ) ( not ( = ?auto_593604 ?auto_593609 ) ) ( not ( = ?auto_593604 ?auto_593610 ) ) ( not ( = ?auto_593604 ?auto_593611 ) ) ( not ( = ?auto_593604 ?auto_593612 ) ) ( not ( = ?auto_593604 ?auto_593613 ) ) ( not ( = ?auto_593604 ?auto_593614 ) ) ( not ( = ?auto_593605 ?auto_593606 ) ) ( not ( = ?auto_593605 ?auto_593607 ) ) ( not ( = ?auto_593605 ?auto_593608 ) ) ( not ( = ?auto_593605 ?auto_593609 ) ) ( not ( = ?auto_593605 ?auto_593610 ) ) ( not ( = ?auto_593605 ?auto_593611 ) ) ( not ( = ?auto_593605 ?auto_593612 ) ) ( not ( = ?auto_593605 ?auto_593613 ) ) ( not ( = ?auto_593605 ?auto_593614 ) ) ( not ( = ?auto_593606 ?auto_593607 ) ) ( not ( = ?auto_593606 ?auto_593608 ) ) ( not ( = ?auto_593606 ?auto_593609 ) ) ( not ( = ?auto_593606 ?auto_593610 ) ) ( not ( = ?auto_593606 ?auto_593611 ) ) ( not ( = ?auto_593606 ?auto_593612 ) ) ( not ( = ?auto_593606 ?auto_593613 ) ) ( not ( = ?auto_593606 ?auto_593614 ) ) ( not ( = ?auto_593607 ?auto_593608 ) ) ( not ( = ?auto_593607 ?auto_593609 ) ) ( not ( = ?auto_593607 ?auto_593610 ) ) ( not ( = ?auto_593607 ?auto_593611 ) ) ( not ( = ?auto_593607 ?auto_593612 ) ) ( not ( = ?auto_593607 ?auto_593613 ) ) ( not ( = ?auto_593607 ?auto_593614 ) ) ( not ( = ?auto_593608 ?auto_593609 ) ) ( not ( = ?auto_593608 ?auto_593610 ) ) ( not ( = ?auto_593608 ?auto_593611 ) ) ( not ( = ?auto_593608 ?auto_593612 ) ) ( not ( = ?auto_593608 ?auto_593613 ) ) ( not ( = ?auto_593608 ?auto_593614 ) ) ( not ( = ?auto_593609 ?auto_593610 ) ) ( not ( = ?auto_593609 ?auto_593611 ) ) ( not ( = ?auto_593609 ?auto_593612 ) ) ( not ( = ?auto_593609 ?auto_593613 ) ) ( not ( = ?auto_593609 ?auto_593614 ) ) ( not ( = ?auto_593610 ?auto_593611 ) ) ( not ( = ?auto_593610 ?auto_593612 ) ) ( not ( = ?auto_593610 ?auto_593613 ) ) ( not ( = ?auto_593610 ?auto_593614 ) ) ( not ( = ?auto_593611 ?auto_593612 ) ) ( not ( = ?auto_593611 ?auto_593613 ) ) ( not ( = ?auto_593611 ?auto_593614 ) ) ( not ( = ?auto_593612 ?auto_593613 ) ) ( not ( = ?auto_593612 ?auto_593614 ) ) ( not ( = ?auto_593613 ?auto_593614 ) ) ( ON ?auto_593612 ?auto_593613 ) ( ON ?auto_593611 ?auto_593612 ) ( ON ?auto_593610 ?auto_593611 ) ( ON ?auto_593609 ?auto_593610 ) ( ON ?auto_593608 ?auto_593609 ) ( ON ?auto_593607 ?auto_593608 ) ( ON ?auto_593606 ?auto_593607 ) ( CLEAR ?auto_593604 ) ( ON ?auto_593605 ?auto_593606 ) ( CLEAR ?auto_593605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_593601 ?auto_593602 ?auto_593603 ?auto_593604 ?auto_593605 )
      ( MAKE-13PILE ?auto_593601 ?auto_593602 ?auto_593603 ?auto_593604 ?auto_593605 ?auto_593606 ?auto_593607 ?auto_593608 ?auto_593609 ?auto_593610 ?auto_593611 ?auto_593612 ?auto_593613 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593655 - BLOCK
      ?auto_593656 - BLOCK
      ?auto_593657 - BLOCK
      ?auto_593658 - BLOCK
      ?auto_593659 - BLOCK
      ?auto_593660 - BLOCK
      ?auto_593661 - BLOCK
      ?auto_593662 - BLOCK
      ?auto_593663 - BLOCK
      ?auto_593664 - BLOCK
      ?auto_593665 - BLOCK
      ?auto_593666 - BLOCK
      ?auto_593667 - BLOCK
    )
    :vars
    (
      ?auto_593668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593667 ?auto_593668 ) ( ON-TABLE ?auto_593655 ) ( ON ?auto_593656 ?auto_593655 ) ( ON ?auto_593657 ?auto_593656 ) ( not ( = ?auto_593655 ?auto_593656 ) ) ( not ( = ?auto_593655 ?auto_593657 ) ) ( not ( = ?auto_593655 ?auto_593658 ) ) ( not ( = ?auto_593655 ?auto_593659 ) ) ( not ( = ?auto_593655 ?auto_593660 ) ) ( not ( = ?auto_593655 ?auto_593661 ) ) ( not ( = ?auto_593655 ?auto_593662 ) ) ( not ( = ?auto_593655 ?auto_593663 ) ) ( not ( = ?auto_593655 ?auto_593664 ) ) ( not ( = ?auto_593655 ?auto_593665 ) ) ( not ( = ?auto_593655 ?auto_593666 ) ) ( not ( = ?auto_593655 ?auto_593667 ) ) ( not ( = ?auto_593655 ?auto_593668 ) ) ( not ( = ?auto_593656 ?auto_593657 ) ) ( not ( = ?auto_593656 ?auto_593658 ) ) ( not ( = ?auto_593656 ?auto_593659 ) ) ( not ( = ?auto_593656 ?auto_593660 ) ) ( not ( = ?auto_593656 ?auto_593661 ) ) ( not ( = ?auto_593656 ?auto_593662 ) ) ( not ( = ?auto_593656 ?auto_593663 ) ) ( not ( = ?auto_593656 ?auto_593664 ) ) ( not ( = ?auto_593656 ?auto_593665 ) ) ( not ( = ?auto_593656 ?auto_593666 ) ) ( not ( = ?auto_593656 ?auto_593667 ) ) ( not ( = ?auto_593656 ?auto_593668 ) ) ( not ( = ?auto_593657 ?auto_593658 ) ) ( not ( = ?auto_593657 ?auto_593659 ) ) ( not ( = ?auto_593657 ?auto_593660 ) ) ( not ( = ?auto_593657 ?auto_593661 ) ) ( not ( = ?auto_593657 ?auto_593662 ) ) ( not ( = ?auto_593657 ?auto_593663 ) ) ( not ( = ?auto_593657 ?auto_593664 ) ) ( not ( = ?auto_593657 ?auto_593665 ) ) ( not ( = ?auto_593657 ?auto_593666 ) ) ( not ( = ?auto_593657 ?auto_593667 ) ) ( not ( = ?auto_593657 ?auto_593668 ) ) ( not ( = ?auto_593658 ?auto_593659 ) ) ( not ( = ?auto_593658 ?auto_593660 ) ) ( not ( = ?auto_593658 ?auto_593661 ) ) ( not ( = ?auto_593658 ?auto_593662 ) ) ( not ( = ?auto_593658 ?auto_593663 ) ) ( not ( = ?auto_593658 ?auto_593664 ) ) ( not ( = ?auto_593658 ?auto_593665 ) ) ( not ( = ?auto_593658 ?auto_593666 ) ) ( not ( = ?auto_593658 ?auto_593667 ) ) ( not ( = ?auto_593658 ?auto_593668 ) ) ( not ( = ?auto_593659 ?auto_593660 ) ) ( not ( = ?auto_593659 ?auto_593661 ) ) ( not ( = ?auto_593659 ?auto_593662 ) ) ( not ( = ?auto_593659 ?auto_593663 ) ) ( not ( = ?auto_593659 ?auto_593664 ) ) ( not ( = ?auto_593659 ?auto_593665 ) ) ( not ( = ?auto_593659 ?auto_593666 ) ) ( not ( = ?auto_593659 ?auto_593667 ) ) ( not ( = ?auto_593659 ?auto_593668 ) ) ( not ( = ?auto_593660 ?auto_593661 ) ) ( not ( = ?auto_593660 ?auto_593662 ) ) ( not ( = ?auto_593660 ?auto_593663 ) ) ( not ( = ?auto_593660 ?auto_593664 ) ) ( not ( = ?auto_593660 ?auto_593665 ) ) ( not ( = ?auto_593660 ?auto_593666 ) ) ( not ( = ?auto_593660 ?auto_593667 ) ) ( not ( = ?auto_593660 ?auto_593668 ) ) ( not ( = ?auto_593661 ?auto_593662 ) ) ( not ( = ?auto_593661 ?auto_593663 ) ) ( not ( = ?auto_593661 ?auto_593664 ) ) ( not ( = ?auto_593661 ?auto_593665 ) ) ( not ( = ?auto_593661 ?auto_593666 ) ) ( not ( = ?auto_593661 ?auto_593667 ) ) ( not ( = ?auto_593661 ?auto_593668 ) ) ( not ( = ?auto_593662 ?auto_593663 ) ) ( not ( = ?auto_593662 ?auto_593664 ) ) ( not ( = ?auto_593662 ?auto_593665 ) ) ( not ( = ?auto_593662 ?auto_593666 ) ) ( not ( = ?auto_593662 ?auto_593667 ) ) ( not ( = ?auto_593662 ?auto_593668 ) ) ( not ( = ?auto_593663 ?auto_593664 ) ) ( not ( = ?auto_593663 ?auto_593665 ) ) ( not ( = ?auto_593663 ?auto_593666 ) ) ( not ( = ?auto_593663 ?auto_593667 ) ) ( not ( = ?auto_593663 ?auto_593668 ) ) ( not ( = ?auto_593664 ?auto_593665 ) ) ( not ( = ?auto_593664 ?auto_593666 ) ) ( not ( = ?auto_593664 ?auto_593667 ) ) ( not ( = ?auto_593664 ?auto_593668 ) ) ( not ( = ?auto_593665 ?auto_593666 ) ) ( not ( = ?auto_593665 ?auto_593667 ) ) ( not ( = ?auto_593665 ?auto_593668 ) ) ( not ( = ?auto_593666 ?auto_593667 ) ) ( not ( = ?auto_593666 ?auto_593668 ) ) ( not ( = ?auto_593667 ?auto_593668 ) ) ( ON ?auto_593666 ?auto_593667 ) ( ON ?auto_593665 ?auto_593666 ) ( ON ?auto_593664 ?auto_593665 ) ( ON ?auto_593663 ?auto_593664 ) ( ON ?auto_593662 ?auto_593663 ) ( ON ?auto_593661 ?auto_593662 ) ( ON ?auto_593660 ?auto_593661 ) ( ON ?auto_593659 ?auto_593660 ) ( CLEAR ?auto_593657 ) ( ON ?auto_593658 ?auto_593659 ) ( CLEAR ?auto_593658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_593655 ?auto_593656 ?auto_593657 ?auto_593658 )
      ( MAKE-13PILE ?auto_593655 ?auto_593656 ?auto_593657 ?auto_593658 ?auto_593659 ?auto_593660 ?auto_593661 ?auto_593662 ?auto_593663 ?auto_593664 ?auto_593665 ?auto_593666 ?auto_593667 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593709 - BLOCK
      ?auto_593710 - BLOCK
      ?auto_593711 - BLOCK
      ?auto_593712 - BLOCK
      ?auto_593713 - BLOCK
      ?auto_593714 - BLOCK
      ?auto_593715 - BLOCK
      ?auto_593716 - BLOCK
      ?auto_593717 - BLOCK
      ?auto_593718 - BLOCK
      ?auto_593719 - BLOCK
      ?auto_593720 - BLOCK
      ?auto_593721 - BLOCK
    )
    :vars
    (
      ?auto_593722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593721 ?auto_593722 ) ( ON-TABLE ?auto_593709 ) ( ON ?auto_593710 ?auto_593709 ) ( not ( = ?auto_593709 ?auto_593710 ) ) ( not ( = ?auto_593709 ?auto_593711 ) ) ( not ( = ?auto_593709 ?auto_593712 ) ) ( not ( = ?auto_593709 ?auto_593713 ) ) ( not ( = ?auto_593709 ?auto_593714 ) ) ( not ( = ?auto_593709 ?auto_593715 ) ) ( not ( = ?auto_593709 ?auto_593716 ) ) ( not ( = ?auto_593709 ?auto_593717 ) ) ( not ( = ?auto_593709 ?auto_593718 ) ) ( not ( = ?auto_593709 ?auto_593719 ) ) ( not ( = ?auto_593709 ?auto_593720 ) ) ( not ( = ?auto_593709 ?auto_593721 ) ) ( not ( = ?auto_593709 ?auto_593722 ) ) ( not ( = ?auto_593710 ?auto_593711 ) ) ( not ( = ?auto_593710 ?auto_593712 ) ) ( not ( = ?auto_593710 ?auto_593713 ) ) ( not ( = ?auto_593710 ?auto_593714 ) ) ( not ( = ?auto_593710 ?auto_593715 ) ) ( not ( = ?auto_593710 ?auto_593716 ) ) ( not ( = ?auto_593710 ?auto_593717 ) ) ( not ( = ?auto_593710 ?auto_593718 ) ) ( not ( = ?auto_593710 ?auto_593719 ) ) ( not ( = ?auto_593710 ?auto_593720 ) ) ( not ( = ?auto_593710 ?auto_593721 ) ) ( not ( = ?auto_593710 ?auto_593722 ) ) ( not ( = ?auto_593711 ?auto_593712 ) ) ( not ( = ?auto_593711 ?auto_593713 ) ) ( not ( = ?auto_593711 ?auto_593714 ) ) ( not ( = ?auto_593711 ?auto_593715 ) ) ( not ( = ?auto_593711 ?auto_593716 ) ) ( not ( = ?auto_593711 ?auto_593717 ) ) ( not ( = ?auto_593711 ?auto_593718 ) ) ( not ( = ?auto_593711 ?auto_593719 ) ) ( not ( = ?auto_593711 ?auto_593720 ) ) ( not ( = ?auto_593711 ?auto_593721 ) ) ( not ( = ?auto_593711 ?auto_593722 ) ) ( not ( = ?auto_593712 ?auto_593713 ) ) ( not ( = ?auto_593712 ?auto_593714 ) ) ( not ( = ?auto_593712 ?auto_593715 ) ) ( not ( = ?auto_593712 ?auto_593716 ) ) ( not ( = ?auto_593712 ?auto_593717 ) ) ( not ( = ?auto_593712 ?auto_593718 ) ) ( not ( = ?auto_593712 ?auto_593719 ) ) ( not ( = ?auto_593712 ?auto_593720 ) ) ( not ( = ?auto_593712 ?auto_593721 ) ) ( not ( = ?auto_593712 ?auto_593722 ) ) ( not ( = ?auto_593713 ?auto_593714 ) ) ( not ( = ?auto_593713 ?auto_593715 ) ) ( not ( = ?auto_593713 ?auto_593716 ) ) ( not ( = ?auto_593713 ?auto_593717 ) ) ( not ( = ?auto_593713 ?auto_593718 ) ) ( not ( = ?auto_593713 ?auto_593719 ) ) ( not ( = ?auto_593713 ?auto_593720 ) ) ( not ( = ?auto_593713 ?auto_593721 ) ) ( not ( = ?auto_593713 ?auto_593722 ) ) ( not ( = ?auto_593714 ?auto_593715 ) ) ( not ( = ?auto_593714 ?auto_593716 ) ) ( not ( = ?auto_593714 ?auto_593717 ) ) ( not ( = ?auto_593714 ?auto_593718 ) ) ( not ( = ?auto_593714 ?auto_593719 ) ) ( not ( = ?auto_593714 ?auto_593720 ) ) ( not ( = ?auto_593714 ?auto_593721 ) ) ( not ( = ?auto_593714 ?auto_593722 ) ) ( not ( = ?auto_593715 ?auto_593716 ) ) ( not ( = ?auto_593715 ?auto_593717 ) ) ( not ( = ?auto_593715 ?auto_593718 ) ) ( not ( = ?auto_593715 ?auto_593719 ) ) ( not ( = ?auto_593715 ?auto_593720 ) ) ( not ( = ?auto_593715 ?auto_593721 ) ) ( not ( = ?auto_593715 ?auto_593722 ) ) ( not ( = ?auto_593716 ?auto_593717 ) ) ( not ( = ?auto_593716 ?auto_593718 ) ) ( not ( = ?auto_593716 ?auto_593719 ) ) ( not ( = ?auto_593716 ?auto_593720 ) ) ( not ( = ?auto_593716 ?auto_593721 ) ) ( not ( = ?auto_593716 ?auto_593722 ) ) ( not ( = ?auto_593717 ?auto_593718 ) ) ( not ( = ?auto_593717 ?auto_593719 ) ) ( not ( = ?auto_593717 ?auto_593720 ) ) ( not ( = ?auto_593717 ?auto_593721 ) ) ( not ( = ?auto_593717 ?auto_593722 ) ) ( not ( = ?auto_593718 ?auto_593719 ) ) ( not ( = ?auto_593718 ?auto_593720 ) ) ( not ( = ?auto_593718 ?auto_593721 ) ) ( not ( = ?auto_593718 ?auto_593722 ) ) ( not ( = ?auto_593719 ?auto_593720 ) ) ( not ( = ?auto_593719 ?auto_593721 ) ) ( not ( = ?auto_593719 ?auto_593722 ) ) ( not ( = ?auto_593720 ?auto_593721 ) ) ( not ( = ?auto_593720 ?auto_593722 ) ) ( not ( = ?auto_593721 ?auto_593722 ) ) ( ON ?auto_593720 ?auto_593721 ) ( ON ?auto_593719 ?auto_593720 ) ( ON ?auto_593718 ?auto_593719 ) ( ON ?auto_593717 ?auto_593718 ) ( ON ?auto_593716 ?auto_593717 ) ( ON ?auto_593715 ?auto_593716 ) ( ON ?auto_593714 ?auto_593715 ) ( ON ?auto_593713 ?auto_593714 ) ( ON ?auto_593712 ?auto_593713 ) ( CLEAR ?auto_593710 ) ( ON ?auto_593711 ?auto_593712 ) ( CLEAR ?auto_593711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_593709 ?auto_593710 ?auto_593711 )
      ( MAKE-13PILE ?auto_593709 ?auto_593710 ?auto_593711 ?auto_593712 ?auto_593713 ?auto_593714 ?auto_593715 ?auto_593716 ?auto_593717 ?auto_593718 ?auto_593719 ?auto_593720 ?auto_593721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593763 - BLOCK
      ?auto_593764 - BLOCK
      ?auto_593765 - BLOCK
      ?auto_593766 - BLOCK
      ?auto_593767 - BLOCK
      ?auto_593768 - BLOCK
      ?auto_593769 - BLOCK
      ?auto_593770 - BLOCK
      ?auto_593771 - BLOCK
      ?auto_593772 - BLOCK
      ?auto_593773 - BLOCK
      ?auto_593774 - BLOCK
      ?auto_593775 - BLOCK
    )
    :vars
    (
      ?auto_593776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593775 ?auto_593776 ) ( ON-TABLE ?auto_593763 ) ( not ( = ?auto_593763 ?auto_593764 ) ) ( not ( = ?auto_593763 ?auto_593765 ) ) ( not ( = ?auto_593763 ?auto_593766 ) ) ( not ( = ?auto_593763 ?auto_593767 ) ) ( not ( = ?auto_593763 ?auto_593768 ) ) ( not ( = ?auto_593763 ?auto_593769 ) ) ( not ( = ?auto_593763 ?auto_593770 ) ) ( not ( = ?auto_593763 ?auto_593771 ) ) ( not ( = ?auto_593763 ?auto_593772 ) ) ( not ( = ?auto_593763 ?auto_593773 ) ) ( not ( = ?auto_593763 ?auto_593774 ) ) ( not ( = ?auto_593763 ?auto_593775 ) ) ( not ( = ?auto_593763 ?auto_593776 ) ) ( not ( = ?auto_593764 ?auto_593765 ) ) ( not ( = ?auto_593764 ?auto_593766 ) ) ( not ( = ?auto_593764 ?auto_593767 ) ) ( not ( = ?auto_593764 ?auto_593768 ) ) ( not ( = ?auto_593764 ?auto_593769 ) ) ( not ( = ?auto_593764 ?auto_593770 ) ) ( not ( = ?auto_593764 ?auto_593771 ) ) ( not ( = ?auto_593764 ?auto_593772 ) ) ( not ( = ?auto_593764 ?auto_593773 ) ) ( not ( = ?auto_593764 ?auto_593774 ) ) ( not ( = ?auto_593764 ?auto_593775 ) ) ( not ( = ?auto_593764 ?auto_593776 ) ) ( not ( = ?auto_593765 ?auto_593766 ) ) ( not ( = ?auto_593765 ?auto_593767 ) ) ( not ( = ?auto_593765 ?auto_593768 ) ) ( not ( = ?auto_593765 ?auto_593769 ) ) ( not ( = ?auto_593765 ?auto_593770 ) ) ( not ( = ?auto_593765 ?auto_593771 ) ) ( not ( = ?auto_593765 ?auto_593772 ) ) ( not ( = ?auto_593765 ?auto_593773 ) ) ( not ( = ?auto_593765 ?auto_593774 ) ) ( not ( = ?auto_593765 ?auto_593775 ) ) ( not ( = ?auto_593765 ?auto_593776 ) ) ( not ( = ?auto_593766 ?auto_593767 ) ) ( not ( = ?auto_593766 ?auto_593768 ) ) ( not ( = ?auto_593766 ?auto_593769 ) ) ( not ( = ?auto_593766 ?auto_593770 ) ) ( not ( = ?auto_593766 ?auto_593771 ) ) ( not ( = ?auto_593766 ?auto_593772 ) ) ( not ( = ?auto_593766 ?auto_593773 ) ) ( not ( = ?auto_593766 ?auto_593774 ) ) ( not ( = ?auto_593766 ?auto_593775 ) ) ( not ( = ?auto_593766 ?auto_593776 ) ) ( not ( = ?auto_593767 ?auto_593768 ) ) ( not ( = ?auto_593767 ?auto_593769 ) ) ( not ( = ?auto_593767 ?auto_593770 ) ) ( not ( = ?auto_593767 ?auto_593771 ) ) ( not ( = ?auto_593767 ?auto_593772 ) ) ( not ( = ?auto_593767 ?auto_593773 ) ) ( not ( = ?auto_593767 ?auto_593774 ) ) ( not ( = ?auto_593767 ?auto_593775 ) ) ( not ( = ?auto_593767 ?auto_593776 ) ) ( not ( = ?auto_593768 ?auto_593769 ) ) ( not ( = ?auto_593768 ?auto_593770 ) ) ( not ( = ?auto_593768 ?auto_593771 ) ) ( not ( = ?auto_593768 ?auto_593772 ) ) ( not ( = ?auto_593768 ?auto_593773 ) ) ( not ( = ?auto_593768 ?auto_593774 ) ) ( not ( = ?auto_593768 ?auto_593775 ) ) ( not ( = ?auto_593768 ?auto_593776 ) ) ( not ( = ?auto_593769 ?auto_593770 ) ) ( not ( = ?auto_593769 ?auto_593771 ) ) ( not ( = ?auto_593769 ?auto_593772 ) ) ( not ( = ?auto_593769 ?auto_593773 ) ) ( not ( = ?auto_593769 ?auto_593774 ) ) ( not ( = ?auto_593769 ?auto_593775 ) ) ( not ( = ?auto_593769 ?auto_593776 ) ) ( not ( = ?auto_593770 ?auto_593771 ) ) ( not ( = ?auto_593770 ?auto_593772 ) ) ( not ( = ?auto_593770 ?auto_593773 ) ) ( not ( = ?auto_593770 ?auto_593774 ) ) ( not ( = ?auto_593770 ?auto_593775 ) ) ( not ( = ?auto_593770 ?auto_593776 ) ) ( not ( = ?auto_593771 ?auto_593772 ) ) ( not ( = ?auto_593771 ?auto_593773 ) ) ( not ( = ?auto_593771 ?auto_593774 ) ) ( not ( = ?auto_593771 ?auto_593775 ) ) ( not ( = ?auto_593771 ?auto_593776 ) ) ( not ( = ?auto_593772 ?auto_593773 ) ) ( not ( = ?auto_593772 ?auto_593774 ) ) ( not ( = ?auto_593772 ?auto_593775 ) ) ( not ( = ?auto_593772 ?auto_593776 ) ) ( not ( = ?auto_593773 ?auto_593774 ) ) ( not ( = ?auto_593773 ?auto_593775 ) ) ( not ( = ?auto_593773 ?auto_593776 ) ) ( not ( = ?auto_593774 ?auto_593775 ) ) ( not ( = ?auto_593774 ?auto_593776 ) ) ( not ( = ?auto_593775 ?auto_593776 ) ) ( ON ?auto_593774 ?auto_593775 ) ( ON ?auto_593773 ?auto_593774 ) ( ON ?auto_593772 ?auto_593773 ) ( ON ?auto_593771 ?auto_593772 ) ( ON ?auto_593770 ?auto_593771 ) ( ON ?auto_593769 ?auto_593770 ) ( ON ?auto_593768 ?auto_593769 ) ( ON ?auto_593767 ?auto_593768 ) ( ON ?auto_593766 ?auto_593767 ) ( ON ?auto_593765 ?auto_593766 ) ( CLEAR ?auto_593763 ) ( ON ?auto_593764 ?auto_593765 ) ( CLEAR ?auto_593764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_593763 ?auto_593764 )
      ( MAKE-13PILE ?auto_593763 ?auto_593764 ?auto_593765 ?auto_593766 ?auto_593767 ?auto_593768 ?auto_593769 ?auto_593770 ?auto_593771 ?auto_593772 ?auto_593773 ?auto_593774 ?auto_593775 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_593817 - BLOCK
      ?auto_593818 - BLOCK
      ?auto_593819 - BLOCK
      ?auto_593820 - BLOCK
      ?auto_593821 - BLOCK
      ?auto_593822 - BLOCK
      ?auto_593823 - BLOCK
      ?auto_593824 - BLOCK
      ?auto_593825 - BLOCK
      ?auto_593826 - BLOCK
      ?auto_593827 - BLOCK
      ?auto_593828 - BLOCK
      ?auto_593829 - BLOCK
    )
    :vars
    (
      ?auto_593830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593829 ?auto_593830 ) ( not ( = ?auto_593817 ?auto_593818 ) ) ( not ( = ?auto_593817 ?auto_593819 ) ) ( not ( = ?auto_593817 ?auto_593820 ) ) ( not ( = ?auto_593817 ?auto_593821 ) ) ( not ( = ?auto_593817 ?auto_593822 ) ) ( not ( = ?auto_593817 ?auto_593823 ) ) ( not ( = ?auto_593817 ?auto_593824 ) ) ( not ( = ?auto_593817 ?auto_593825 ) ) ( not ( = ?auto_593817 ?auto_593826 ) ) ( not ( = ?auto_593817 ?auto_593827 ) ) ( not ( = ?auto_593817 ?auto_593828 ) ) ( not ( = ?auto_593817 ?auto_593829 ) ) ( not ( = ?auto_593817 ?auto_593830 ) ) ( not ( = ?auto_593818 ?auto_593819 ) ) ( not ( = ?auto_593818 ?auto_593820 ) ) ( not ( = ?auto_593818 ?auto_593821 ) ) ( not ( = ?auto_593818 ?auto_593822 ) ) ( not ( = ?auto_593818 ?auto_593823 ) ) ( not ( = ?auto_593818 ?auto_593824 ) ) ( not ( = ?auto_593818 ?auto_593825 ) ) ( not ( = ?auto_593818 ?auto_593826 ) ) ( not ( = ?auto_593818 ?auto_593827 ) ) ( not ( = ?auto_593818 ?auto_593828 ) ) ( not ( = ?auto_593818 ?auto_593829 ) ) ( not ( = ?auto_593818 ?auto_593830 ) ) ( not ( = ?auto_593819 ?auto_593820 ) ) ( not ( = ?auto_593819 ?auto_593821 ) ) ( not ( = ?auto_593819 ?auto_593822 ) ) ( not ( = ?auto_593819 ?auto_593823 ) ) ( not ( = ?auto_593819 ?auto_593824 ) ) ( not ( = ?auto_593819 ?auto_593825 ) ) ( not ( = ?auto_593819 ?auto_593826 ) ) ( not ( = ?auto_593819 ?auto_593827 ) ) ( not ( = ?auto_593819 ?auto_593828 ) ) ( not ( = ?auto_593819 ?auto_593829 ) ) ( not ( = ?auto_593819 ?auto_593830 ) ) ( not ( = ?auto_593820 ?auto_593821 ) ) ( not ( = ?auto_593820 ?auto_593822 ) ) ( not ( = ?auto_593820 ?auto_593823 ) ) ( not ( = ?auto_593820 ?auto_593824 ) ) ( not ( = ?auto_593820 ?auto_593825 ) ) ( not ( = ?auto_593820 ?auto_593826 ) ) ( not ( = ?auto_593820 ?auto_593827 ) ) ( not ( = ?auto_593820 ?auto_593828 ) ) ( not ( = ?auto_593820 ?auto_593829 ) ) ( not ( = ?auto_593820 ?auto_593830 ) ) ( not ( = ?auto_593821 ?auto_593822 ) ) ( not ( = ?auto_593821 ?auto_593823 ) ) ( not ( = ?auto_593821 ?auto_593824 ) ) ( not ( = ?auto_593821 ?auto_593825 ) ) ( not ( = ?auto_593821 ?auto_593826 ) ) ( not ( = ?auto_593821 ?auto_593827 ) ) ( not ( = ?auto_593821 ?auto_593828 ) ) ( not ( = ?auto_593821 ?auto_593829 ) ) ( not ( = ?auto_593821 ?auto_593830 ) ) ( not ( = ?auto_593822 ?auto_593823 ) ) ( not ( = ?auto_593822 ?auto_593824 ) ) ( not ( = ?auto_593822 ?auto_593825 ) ) ( not ( = ?auto_593822 ?auto_593826 ) ) ( not ( = ?auto_593822 ?auto_593827 ) ) ( not ( = ?auto_593822 ?auto_593828 ) ) ( not ( = ?auto_593822 ?auto_593829 ) ) ( not ( = ?auto_593822 ?auto_593830 ) ) ( not ( = ?auto_593823 ?auto_593824 ) ) ( not ( = ?auto_593823 ?auto_593825 ) ) ( not ( = ?auto_593823 ?auto_593826 ) ) ( not ( = ?auto_593823 ?auto_593827 ) ) ( not ( = ?auto_593823 ?auto_593828 ) ) ( not ( = ?auto_593823 ?auto_593829 ) ) ( not ( = ?auto_593823 ?auto_593830 ) ) ( not ( = ?auto_593824 ?auto_593825 ) ) ( not ( = ?auto_593824 ?auto_593826 ) ) ( not ( = ?auto_593824 ?auto_593827 ) ) ( not ( = ?auto_593824 ?auto_593828 ) ) ( not ( = ?auto_593824 ?auto_593829 ) ) ( not ( = ?auto_593824 ?auto_593830 ) ) ( not ( = ?auto_593825 ?auto_593826 ) ) ( not ( = ?auto_593825 ?auto_593827 ) ) ( not ( = ?auto_593825 ?auto_593828 ) ) ( not ( = ?auto_593825 ?auto_593829 ) ) ( not ( = ?auto_593825 ?auto_593830 ) ) ( not ( = ?auto_593826 ?auto_593827 ) ) ( not ( = ?auto_593826 ?auto_593828 ) ) ( not ( = ?auto_593826 ?auto_593829 ) ) ( not ( = ?auto_593826 ?auto_593830 ) ) ( not ( = ?auto_593827 ?auto_593828 ) ) ( not ( = ?auto_593827 ?auto_593829 ) ) ( not ( = ?auto_593827 ?auto_593830 ) ) ( not ( = ?auto_593828 ?auto_593829 ) ) ( not ( = ?auto_593828 ?auto_593830 ) ) ( not ( = ?auto_593829 ?auto_593830 ) ) ( ON ?auto_593828 ?auto_593829 ) ( ON ?auto_593827 ?auto_593828 ) ( ON ?auto_593826 ?auto_593827 ) ( ON ?auto_593825 ?auto_593826 ) ( ON ?auto_593824 ?auto_593825 ) ( ON ?auto_593823 ?auto_593824 ) ( ON ?auto_593822 ?auto_593823 ) ( ON ?auto_593821 ?auto_593822 ) ( ON ?auto_593820 ?auto_593821 ) ( ON ?auto_593819 ?auto_593820 ) ( ON ?auto_593818 ?auto_593819 ) ( ON ?auto_593817 ?auto_593818 ) ( CLEAR ?auto_593817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_593817 )
      ( MAKE-13PILE ?auto_593817 ?auto_593818 ?auto_593819 ?auto_593820 ?auto_593821 ?auto_593822 ?auto_593823 ?auto_593824 ?auto_593825 ?auto_593826 ?auto_593827 ?auto_593828 ?auto_593829 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_593872 - BLOCK
      ?auto_593873 - BLOCK
      ?auto_593874 - BLOCK
      ?auto_593875 - BLOCK
      ?auto_593876 - BLOCK
      ?auto_593877 - BLOCK
      ?auto_593878 - BLOCK
      ?auto_593879 - BLOCK
      ?auto_593880 - BLOCK
      ?auto_593881 - BLOCK
      ?auto_593882 - BLOCK
      ?auto_593883 - BLOCK
      ?auto_593884 - BLOCK
      ?auto_593885 - BLOCK
    )
    :vars
    (
      ?auto_593886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_593884 ) ( ON ?auto_593885 ?auto_593886 ) ( CLEAR ?auto_593885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_593872 ) ( ON ?auto_593873 ?auto_593872 ) ( ON ?auto_593874 ?auto_593873 ) ( ON ?auto_593875 ?auto_593874 ) ( ON ?auto_593876 ?auto_593875 ) ( ON ?auto_593877 ?auto_593876 ) ( ON ?auto_593878 ?auto_593877 ) ( ON ?auto_593879 ?auto_593878 ) ( ON ?auto_593880 ?auto_593879 ) ( ON ?auto_593881 ?auto_593880 ) ( ON ?auto_593882 ?auto_593881 ) ( ON ?auto_593883 ?auto_593882 ) ( ON ?auto_593884 ?auto_593883 ) ( not ( = ?auto_593872 ?auto_593873 ) ) ( not ( = ?auto_593872 ?auto_593874 ) ) ( not ( = ?auto_593872 ?auto_593875 ) ) ( not ( = ?auto_593872 ?auto_593876 ) ) ( not ( = ?auto_593872 ?auto_593877 ) ) ( not ( = ?auto_593872 ?auto_593878 ) ) ( not ( = ?auto_593872 ?auto_593879 ) ) ( not ( = ?auto_593872 ?auto_593880 ) ) ( not ( = ?auto_593872 ?auto_593881 ) ) ( not ( = ?auto_593872 ?auto_593882 ) ) ( not ( = ?auto_593872 ?auto_593883 ) ) ( not ( = ?auto_593872 ?auto_593884 ) ) ( not ( = ?auto_593872 ?auto_593885 ) ) ( not ( = ?auto_593872 ?auto_593886 ) ) ( not ( = ?auto_593873 ?auto_593874 ) ) ( not ( = ?auto_593873 ?auto_593875 ) ) ( not ( = ?auto_593873 ?auto_593876 ) ) ( not ( = ?auto_593873 ?auto_593877 ) ) ( not ( = ?auto_593873 ?auto_593878 ) ) ( not ( = ?auto_593873 ?auto_593879 ) ) ( not ( = ?auto_593873 ?auto_593880 ) ) ( not ( = ?auto_593873 ?auto_593881 ) ) ( not ( = ?auto_593873 ?auto_593882 ) ) ( not ( = ?auto_593873 ?auto_593883 ) ) ( not ( = ?auto_593873 ?auto_593884 ) ) ( not ( = ?auto_593873 ?auto_593885 ) ) ( not ( = ?auto_593873 ?auto_593886 ) ) ( not ( = ?auto_593874 ?auto_593875 ) ) ( not ( = ?auto_593874 ?auto_593876 ) ) ( not ( = ?auto_593874 ?auto_593877 ) ) ( not ( = ?auto_593874 ?auto_593878 ) ) ( not ( = ?auto_593874 ?auto_593879 ) ) ( not ( = ?auto_593874 ?auto_593880 ) ) ( not ( = ?auto_593874 ?auto_593881 ) ) ( not ( = ?auto_593874 ?auto_593882 ) ) ( not ( = ?auto_593874 ?auto_593883 ) ) ( not ( = ?auto_593874 ?auto_593884 ) ) ( not ( = ?auto_593874 ?auto_593885 ) ) ( not ( = ?auto_593874 ?auto_593886 ) ) ( not ( = ?auto_593875 ?auto_593876 ) ) ( not ( = ?auto_593875 ?auto_593877 ) ) ( not ( = ?auto_593875 ?auto_593878 ) ) ( not ( = ?auto_593875 ?auto_593879 ) ) ( not ( = ?auto_593875 ?auto_593880 ) ) ( not ( = ?auto_593875 ?auto_593881 ) ) ( not ( = ?auto_593875 ?auto_593882 ) ) ( not ( = ?auto_593875 ?auto_593883 ) ) ( not ( = ?auto_593875 ?auto_593884 ) ) ( not ( = ?auto_593875 ?auto_593885 ) ) ( not ( = ?auto_593875 ?auto_593886 ) ) ( not ( = ?auto_593876 ?auto_593877 ) ) ( not ( = ?auto_593876 ?auto_593878 ) ) ( not ( = ?auto_593876 ?auto_593879 ) ) ( not ( = ?auto_593876 ?auto_593880 ) ) ( not ( = ?auto_593876 ?auto_593881 ) ) ( not ( = ?auto_593876 ?auto_593882 ) ) ( not ( = ?auto_593876 ?auto_593883 ) ) ( not ( = ?auto_593876 ?auto_593884 ) ) ( not ( = ?auto_593876 ?auto_593885 ) ) ( not ( = ?auto_593876 ?auto_593886 ) ) ( not ( = ?auto_593877 ?auto_593878 ) ) ( not ( = ?auto_593877 ?auto_593879 ) ) ( not ( = ?auto_593877 ?auto_593880 ) ) ( not ( = ?auto_593877 ?auto_593881 ) ) ( not ( = ?auto_593877 ?auto_593882 ) ) ( not ( = ?auto_593877 ?auto_593883 ) ) ( not ( = ?auto_593877 ?auto_593884 ) ) ( not ( = ?auto_593877 ?auto_593885 ) ) ( not ( = ?auto_593877 ?auto_593886 ) ) ( not ( = ?auto_593878 ?auto_593879 ) ) ( not ( = ?auto_593878 ?auto_593880 ) ) ( not ( = ?auto_593878 ?auto_593881 ) ) ( not ( = ?auto_593878 ?auto_593882 ) ) ( not ( = ?auto_593878 ?auto_593883 ) ) ( not ( = ?auto_593878 ?auto_593884 ) ) ( not ( = ?auto_593878 ?auto_593885 ) ) ( not ( = ?auto_593878 ?auto_593886 ) ) ( not ( = ?auto_593879 ?auto_593880 ) ) ( not ( = ?auto_593879 ?auto_593881 ) ) ( not ( = ?auto_593879 ?auto_593882 ) ) ( not ( = ?auto_593879 ?auto_593883 ) ) ( not ( = ?auto_593879 ?auto_593884 ) ) ( not ( = ?auto_593879 ?auto_593885 ) ) ( not ( = ?auto_593879 ?auto_593886 ) ) ( not ( = ?auto_593880 ?auto_593881 ) ) ( not ( = ?auto_593880 ?auto_593882 ) ) ( not ( = ?auto_593880 ?auto_593883 ) ) ( not ( = ?auto_593880 ?auto_593884 ) ) ( not ( = ?auto_593880 ?auto_593885 ) ) ( not ( = ?auto_593880 ?auto_593886 ) ) ( not ( = ?auto_593881 ?auto_593882 ) ) ( not ( = ?auto_593881 ?auto_593883 ) ) ( not ( = ?auto_593881 ?auto_593884 ) ) ( not ( = ?auto_593881 ?auto_593885 ) ) ( not ( = ?auto_593881 ?auto_593886 ) ) ( not ( = ?auto_593882 ?auto_593883 ) ) ( not ( = ?auto_593882 ?auto_593884 ) ) ( not ( = ?auto_593882 ?auto_593885 ) ) ( not ( = ?auto_593882 ?auto_593886 ) ) ( not ( = ?auto_593883 ?auto_593884 ) ) ( not ( = ?auto_593883 ?auto_593885 ) ) ( not ( = ?auto_593883 ?auto_593886 ) ) ( not ( = ?auto_593884 ?auto_593885 ) ) ( not ( = ?auto_593884 ?auto_593886 ) ) ( not ( = ?auto_593885 ?auto_593886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_593885 ?auto_593886 )
      ( !STACK ?auto_593885 ?auto_593884 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_593930 - BLOCK
      ?auto_593931 - BLOCK
      ?auto_593932 - BLOCK
      ?auto_593933 - BLOCK
      ?auto_593934 - BLOCK
      ?auto_593935 - BLOCK
      ?auto_593936 - BLOCK
      ?auto_593937 - BLOCK
      ?auto_593938 - BLOCK
      ?auto_593939 - BLOCK
      ?auto_593940 - BLOCK
      ?auto_593941 - BLOCK
      ?auto_593942 - BLOCK
      ?auto_593943 - BLOCK
    )
    :vars
    (
      ?auto_593944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_593943 ?auto_593944 ) ( ON-TABLE ?auto_593930 ) ( ON ?auto_593931 ?auto_593930 ) ( ON ?auto_593932 ?auto_593931 ) ( ON ?auto_593933 ?auto_593932 ) ( ON ?auto_593934 ?auto_593933 ) ( ON ?auto_593935 ?auto_593934 ) ( ON ?auto_593936 ?auto_593935 ) ( ON ?auto_593937 ?auto_593936 ) ( ON ?auto_593938 ?auto_593937 ) ( ON ?auto_593939 ?auto_593938 ) ( ON ?auto_593940 ?auto_593939 ) ( ON ?auto_593941 ?auto_593940 ) ( not ( = ?auto_593930 ?auto_593931 ) ) ( not ( = ?auto_593930 ?auto_593932 ) ) ( not ( = ?auto_593930 ?auto_593933 ) ) ( not ( = ?auto_593930 ?auto_593934 ) ) ( not ( = ?auto_593930 ?auto_593935 ) ) ( not ( = ?auto_593930 ?auto_593936 ) ) ( not ( = ?auto_593930 ?auto_593937 ) ) ( not ( = ?auto_593930 ?auto_593938 ) ) ( not ( = ?auto_593930 ?auto_593939 ) ) ( not ( = ?auto_593930 ?auto_593940 ) ) ( not ( = ?auto_593930 ?auto_593941 ) ) ( not ( = ?auto_593930 ?auto_593942 ) ) ( not ( = ?auto_593930 ?auto_593943 ) ) ( not ( = ?auto_593930 ?auto_593944 ) ) ( not ( = ?auto_593931 ?auto_593932 ) ) ( not ( = ?auto_593931 ?auto_593933 ) ) ( not ( = ?auto_593931 ?auto_593934 ) ) ( not ( = ?auto_593931 ?auto_593935 ) ) ( not ( = ?auto_593931 ?auto_593936 ) ) ( not ( = ?auto_593931 ?auto_593937 ) ) ( not ( = ?auto_593931 ?auto_593938 ) ) ( not ( = ?auto_593931 ?auto_593939 ) ) ( not ( = ?auto_593931 ?auto_593940 ) ) ( not ( = ?auto_593931 ?auto_593941 ) ) ( not ( = ?auto_593931 ?auto_593942 ) ) ( not ( = ?auto_593931 ?auto_593943 ) ) ( not ( = ?auto_593931 ?auto_593944 ) ) ( not ( = ?auto_593932 ?auto_593933 ) ) ( not ( = ?auto_593932 ?auto_593934 ) ) ( not ( = ?auto_593932 ?auto_593935 ) ) ( not ( = ?auto_593932 ?auto_593936 ) ) ( not ( = ?auto_593932 ?auto_593937 ) ) ( not ( = ?auto_593932 ?auto_593938 ) ) ( not ( = ?auto_593932 ?auto_593939 ) ) ( not ( = ?auto_593932 ?auto_593940 ) ) ( not ( = ?auto_593932 ?auto_593941 ) ) ( not ( = ?auto_593932 ?auto_593942 ) ) ( not ( = ?auto_593932 ?auto_593943 ) ) ( not ( = ?auto_593932 ?auto_593944 ) ) ( not ( = ?auto_593933 ?auto_593934 ) ) ( not ( = ?auto_593933 ?auto_593935 ) ) ( not ( = ?auto_593933 ?auto_593936 ) ) ( not ( = ?auto_593933 ?auto_593937 ) ) ( not ( = ?auto_593933 ?auto_593938 ) ) ( not ( = ?auto_593933 ?auto_593939 ) ) ( not ( = ?auto_593933 ?auto_593940 ) ) ( not ( = ?auto_593933 ?auto_593941 ) ) ( not ( = ?auto_593933 ?auto_593942 ) ) ( not ( = ?auto_593933 ?auto_593943 ) ) ( not ( = ?auto_593933 ?auto_593944 ) ) ( not ( = ?auto_593934 ?auto_593935 ) ) ( not ( = ?auto_593934 ?auto_593936 ) ) ( not ( = ?auto_593934 ?auto_593937 ) ) ( not ( = ?auto_593934 ?auto_593938 ) ) ( not ( = ?auto_593934 ?auto_593939 ) ) ( not ( = ?auto_593934 ?auto_593940 ) ) ( not ( = ?auto_593934 ?auto_593941 ) ) ( not ( = ?auto_593934 ?auto_593942 ) ) ( not ( = ?auto_593934 ?auto_593943 ) ) ( not ( = ?auto_593934 ?auto_593944 ) ) ( not ( = ?auto_593935 ?auto_593936 ) ) ( not ( = ?auto_593935 ?auto_593937 ) ) ( not ( = ?auto_593935 ?auto_593938 ) ) ( not ( = ?auto_593935 ?auto_593939 ) ) ( not ( = ?auto_593935 ?auto_593940 ) ) ( not ( = ?auto_593935 ?auto_593941 ) ) ( not ( = ?auto_593935 ?auto_593942 ) ) ( not ( = ?auto_593935 ?auto_593943 ) ) ( not ( = ?auto_593935 ?auto_593944 ) ) ( not ( = ?auto_593936 ?auto_593937 ) ) ( not ( = ?auto_593936 ?auto_593938 ) ) ( not ( = ?auto_593936 ?auto_593939 ) ) ( not ( = ?auto_593936 ?auto_593940 ) ) ( not ( = ?auto_593936 ?auto_593941 ) ) ( not ( = ?auto_593936 ?auto_593942 ) ) ( not ( = ?auto_593936 ?auto_593943 ) ) ( not ( = ?auto_593936 ?auto_593944 ) ) ( not ( = ?auto_593937 ?auto_593938 ) ) ( not ( = ?auto_593937 ?auto_593939 ) ) ( not ( = ?auto_593937 ?auto_593940 ) ) ( not ( = ?auto_593937 ?auto_593941 ) ) ( not ( = ?auto_593937 ?auto_593942 ) ) ( not ( = ?auto_593937 ?auto_593943 ) ) ( not ( = ?auto_593937 ?auto_593944 ) ) ( not ( = ?auto_593938 ?auto_593939 ) ) ( not ( = ?auto_593938 ?auto_593940 ) ) ( not ( = ?auto_593938 ?auto_593941 ) ) ( not ( = ?auto_593938 ?auto_593942 ) ) ( not ( = ?auto_593938 ?auto_593943 ) ) ( not ( = ?auto_593938 ?auto_593944 ) ) ( not ( = ?auto_593939 ?auto_593940 ) ) ( not ( = ?auto_593939 ?auto_593941 ) ) ( not ( = ?auto_593939 ?auto_593942 ) ) ( not ( = ?auto_593939 ?auto_593943 ) ) ( not ( = ?auto_593939 ?auto_593944 ) ) ( not ( = ?auto_593940 ?auto_593941 ) ) ( not ( = ?auto_593940 ?auto_593942 ) ) ( not ( = ?auto_593940 ?auto_593943 ) ) ( not ( = ?auto_593940 ?auto_593944 ) ) ( not ( = ?auto_593941 ?auto_593942 ) ) ( not ( = ?auto_593941 ?auto_593943 ) ) ( not ( = ?auto_593941 ?auto_593944 ) ) ( not ( = ?auto_593942 ?auto_593943 ) ) ( not ( = ?auto_593942 ?auto_593944 ) ) ( not ( = ?auto_593943 ?auto_593944 ) ) ( CLEAR ?auto_593941 ) ( ON ?auto_593942 ?auto_593943 ) ( CLEAR ?auto_593942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_593930 ?auto_593931 ?auto_593932 ?auto_593933 ?auto_593934 ?auto_593935 ?auto_593936 ?auto_593937 ?auto_593938 ?auto_593939 ?auto_593940 ?auto_593941 ?auto_593942 )
      ( MAKE-14PILE ?auto_593930 ?auto_593931 ?auto_593932 ?auto_593933 ?auto_593934 ?auto_593935 ?auto_593936 ?auto_593937 ?auto_593938 ?auto_593939 ?auto_593940 ?auto_593941 ?auto_593942 ?auto_593943 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_593988 - BLOCK
      ?auto_593989 - BLOCK
      ?auto_593990 - BLOCK
      ?auto_593991 - BLOCK
      ?auto_593992 - BLOCK
      ?auto_593993 - BLOCK
      ?auto_593994 - BLOCK
      ?auto_593995 - BLOCK
      ?auto_593996 - BLOCK
      ?auto_593997 - BLOCK
      ?auto_593998 - BLOCK
      ?auto_593999 - BLOCK
      ?auto_594000 - BLOCK
      ?auto_594001 - BLOCK
    )
    :vars
    (
      ?auto_594002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594001 ?auto_594002 ) ( ON-TABLE ?auto_593988 ) ( ON ?auto_593989 ?auto_593988 ) ( ON ?auto_593990 ?auto_593989 ) ( ON ?auto_593991 ?auto_593990 ) ( ON ?auto_593992 ?auto_593991 ) ( ON ?auto_593993 ?auto_593992 ) ( ON ?auto_593994 ?auto_593993 ) ( ON ?auto_593995 ?auto_593994 ) ( ON ?auto_593996 ?auto_593995 ) ( ON ?auto_593997 ?auto_593996 ) ( ON ?auto_593998 ?auto_593997 ) ( not ( = ?auto_593988 ?auto_593989 ) ) ( not ( = ?auto_593988 ?auto_593990 ) ) ( not ( = ?auto_593988 ?auto_593991 ) ) ( not ( = ?auto_593988 ?auto_593992 ) ) ( not ( = ?auto_593988 ?auto_593993 ) ) ( not ( = ?auto_593988 ?auto_593994 ) ) ( not ( = ?auto_593988 ?auto_593995 ) ) ( not ( = ?auto_593988 ?auto_593996 ) ) ( not ( = ?auto_593988 ?auto_593997 ) ) ( not ( = ?auto_593988 ?auto_593998 ) ) ( not ( = ?auto_593988 ?auto_593999 ) ) ( not ( = ?auto_593988 ?auto_594000 ) ) ( not ( = ?auto_593988 ?auto_594001 ) ) ( not ( = ?auto_593988 ?auto_594002 ) ) ( not ( = ?auto_593989 ?auto_593990 ) ) ( not ( = ?auto_593989 ?auto_593991 ) ) ( not ( = ?auto_593989 ?auto_593992 ) ) ( not ( = ?auto_593989 ?auto_593993 ) ) ( not ( = ?auto_593989 ?auto_593994 ) ) ( not ( = ?auto_593989 ?auto_593995 ) ) ( not ( = ?auto_593989 ?auto_593996 ) ) ( not ( = ?auto_593989 ?auto_593997 ) ) ( not ( = ?auto_593989 ?auto_593998 ) ) ( not ( = ?auto_593989 ?auto_593999 ) ) ( not ( = ?auto_593989 ?auto_594000 ) ) ( not ( = ?auto_593989 ?auto_594001 ) ) ( not ( = ?auto_593989 ?auto_594002 ) ) ( not ( = ?auto_593990 ?auto_593991 ) ) ( not ( = ?auto_593990 ?auto_593992 ) ) ( not ( = ?auto_593990 ?auto_593993 ) ) ( not ( = ?auto_593990 ?auto_593994 ) ) ( not ( = ?auto_593990 ?auto_593995 ) ) ( not ( = ?auto_593990 ?auto_593996 ) ) ( not ( = ?auto_593990 ?auto_593997 ) ) ( not ( = ?auto_593990 ?auto_593998 ) ) ( not ( = ?auto_593990 ?auto_593999 ) ) ( not ( = ?auto_593990 ?auto_594000 ) ) ( not ( = ?auto_593990 ?auto_594001 ) ) ( not ( = ?auto_593990 ?auto_594002 ) ) ( not ( = ?auto_593991 ?auto_593992 ) ) ( not ( = ?auto_593991 ?auto_593993 ) ) ( not ( = ?auto_593991 ?auto_593994 ) ) ( not ( = ?auto_593991 ?auto_593995 ) ) ( not ( = ?auto_593991 ?auto_593996 ) ) ( not ( = ?auto_593991 ?auto_593997 ) ) ( not ( = ?auto_593991 ?auto_593998 ) ) ( not ( = ?auto_593991 ?auto_593999 ) ) ( not ( = ?auto_593991 ?auto_594000 ) ) ( not ( = ?auto_593991 ?auto_594001 ) ) ( not ( = ?auto_593991 ?auto_594002 ) ) ( not ( = ?auto_593992 ?auto_593993 ) ) ( not ( = ?auto_593992 ?auto_593994 ) ) ( not ( = ?auto_593992 ?auto_593995 ) ) ( not ( = ?auto_593992 ?auto_593996 ) ) ( not ( = ?auto_593992 ?auto_593997 ) ) ( not ( = ?auto_593992 ?auto_593998 ) ) ( not ( = ?auto_593992 ?auto_593999 ) ) ( not ( = ?auto_593992 ?auto_594000 ) ) ( not ( = ?auto_593992 ?auto_594001 ) ) ( not ( = ?auto_593992 ?auto_594002 ) ) ( not ( = ?auto_593993 ?auto_593994 ) ) ( not ( = ?auto_593993 ?auto_593995 ) ) ( not ( = ?auto_593993 ?auto_593996 ) ) ( not ( = ?auto_593993 ?auto_593997 ) ) ( not ( = ?auto_593993 ?auto_593998 ) ) ( not ( = ?auto_593993 ?auto_593999 ) ) ( not ( = ?auto_593993 ?auto_594000 ) ) ( not ( = ?auto_593993 ?auto_594001 ) ) ( not ( = ?auto_593993 ?auto_594002 ) ) ( not ( = ?auto_593994 ?auto_593995 ) ) ( not ( = ?auto_593994 ?auto_593996 ) ) ( not ( = ?auto_593994 ?auto_593997 ) ) ( not ( = ?auto_593994 ?auto_593998 ) ) ( not ( = ?auto_593994 ?auto_593999 ) ) ( not ( = ?auto_593994 ?auto_594000 ) ) ( not ( = ?auto_593994 ?auto_594001 ) ) ( not ( = ?auto_593994 ?auto_594002 ) ) ( not ( = ?auto_593995 ?auto_593996 ) ) ( not ( = ?auto_593995 ?auto_593997 ) ) ( not ( = ?auto_593995 ?auto_593998 ) ) ( not ( = ?auto_593995 ?auto_593999 ) ) ( not ( = ?auto_593995 ?auto_594000 ) ) ( not ( = ?auto_593995 ?auto_594001 ) ) ( not ( = ?auto_593995 ?auto_594002 ) ) ( not ( = ?auto_593996 ?auto_593997 ) ) ( not ( = ?auto_593996 ?auto_593998 ) ) ( not ( = ?auto_593996 ?auto_593999 ) ) ( not ( = ?auto_593996 ?auto_594000 ) ) ( not ( = ?auto_593996 ?auto_594001 ) ) ( not ( = ?auto_593996 ?auto_594002 ) ) ( not ( = ?auto_593997 ?auto_593998 ) ) ( not ( = ?auto_593997 ?auto_593999 ) ) ( not ( = ?auto_593997 ?auto_594000 ) ) ( not ( = ?auto_593997 ?auto_594001 ) ) ( not ( = ?auto_593997 ?auto_594002 ) ) ( not ( = ?auto_593998 ?auto_593999 ) ) ( not ( = ?auto_593998 ?auto_594000 ) ) ( not ( = ?auto_593998 ?auto_594001 ) ) ( not ( = ?auto_593998 ?auto_594002 ) ) ( not ( = ?auto_593999 ?auto_594000 ) ) ( not ( = ?auto_593999 ?auto_594001 ) ) ( not ( = ?auto_593999 ?auto_594002 ) ) ( not ( = ?auto_594000 ?auto_594001 ) ) ( not ( = ?auto_594000 ?auto_594002 ) ) ( not ( = ?auto_594001 ?auto_594002 ) ) ( ON ?auto_594000 ?auto_594001 ) ( CLEAR ?auto_593998 ) ( ON ?auto_593999 ?auto_594000 ) ( CLEAR ?auto_593999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_593988 ?auto_593989 ?auto_593990 ?auto_593991 ?auto_593992 ?auto_593993 ?auto_593994 ?auto_593995 ?auto_593996 ?auto_593997 ?auto_593998 ?auto_593999 )
      ( MAKE-14PILE ?auto_593988 ?auto_593989 ?auto_593990 ?auto_593991 ?auto_593992 ?auto_593993 ?auto_593994 ?auto_593995 ?auto_593996 ?auto_593997 ?auto_593998 ?auto_593999 ?auto_594000 ?auto_594001 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594046 - BLOCK
      ?auto_594047 - BLOCK
      ?auto_594048 - BLOCK
      ?auto_594049 - BLOCK
      ?auto_594050 - BLOCK
      ?auto_594051 - BLOCK
      ?auto_594052 - BLOCK
      ?auto_594053 - BLOCK
      ?auto_594054 - BLOCK
      ?auto_594055 - BLOCK
      ?auto_594056 - BLOCK
      ?auto_594057 - BLOCK
      ?auto_594058 - BLOCK
      ?auto_594059 - BLOCK
    )
    :vars
    (
      ?auto_594060 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594059 ?auto_594060 ) ( ON-TABLE ?auto_594046 ) ( ON ?auto_594047 ?auto_594046 ) ( ON ?auto_594048 ?auto_594047 ) ( ON ?auto_594049 ?auto_594048 ) ( ON ?auto_594050 ?auto_594049 ) ( ON ?auto_594051 ?auto_594050 ) ( ON ?auto_594052 ?auto_594051 ) ( ON ?auto_594053 ?auto_594052 ) ( ON ?auto_594054 ?auto_594053 ) ( ON ?auto_594055 ?auto_594054 ) ( not ( = ?auto_594046 ?auto_594047 ) ) ( not ( = ?auto_594046 ?auto_594048 ) ) ( not ( = ?auto_594046 ?auto_594049 ) ) ( not ( = ?auto_594046 ?auto_594050 ) ) ( not ( = ?auto_594046 ?auto_594051 ) ) ( not ( = ?auto_594046 ?auto_594052 ) ) ( not ( = ?auto_594046 ?auto_594053 ) ) ( not ( = ?auto_594046 ?auto_594054 ) ) ( not ( = ?auto_594046 ?auto_594055 ) ) ( not ( = ?auto_594046 ?auto_594056 ) ) ( not ( = ?auto_594046 ?auto_594057 ) ) ( not ( = ?auto_594046 ?auto_594058 ) ) ( not ( = ?auto_594046 ?auto_594059 ) ) ( not ( = ?auto_594046 ?auto_594060 ) ) ( not ( = ?auto_594047 ?auto_594048 ) ) ( not ( = ?auto_594047 ?auto_594049 ) ) ( not ( = ?auto_594047 ?auto_594050 ) ) ( not ( = ?auto_594047 ?auto_594051 ) ) ( not ( = ?auto_594047 ?auto_594052 ) ) ( not ( = ?auto_594047 ?auto_594053 ) ) ( not ( = ?auto_594047 ?auto_594054 ) ) ( not ( = ?auto_594047 ?auto_594055 ) ) ( not ( = ?auto_594047 ?auto_594056 ) ) ( not ( = ?auto_594047 ?auto_594057 ) ) ( not ( = ?auto_594047 ?auto_594058 ) ) ( not ( = ?auto_594047 ?auto_594059 ) ) ( not ( = ?auto_594047 ?auto_594060 ) ) ( not ( = ?auto_594048 ?auto_594049 ) ) ( not ( = ?auto_594048 ?auto_594050 ) ) ( not ( = ?auto_594048 ?auto_594051 ) ) ( not ( = ?auto_594048 ?auto_594052 ) ) ( not ( = ?auto_594048 ?auto_594053 ) ) ( not ( = ?auto_594048 ?auto_594054 ) ) ( not ( = ?auto_594048 ?auto_594055 ) ) ( not ( = ?auto_594048 ?auto_594056 ) ) ( not ( = ?auto_594048 ?auto_594057 ) ) ( not ( = ?auto_594048 ?auto_594058 ) ) ( not ( = ?auto_594048 ?auto_594059 ) ) ( not ( = ?auto_594048 ?auto_594060 ) ) ( not ( = ?auto_594049 ?auto_594050 ) ) ( not ( = ?auto_594049 ?auto_594051 ) ) ( not ( = ?auto_594049 ?auto_594052 ) ) ( not ( = ?auto_594049 ?auto_594053 ) ) ( not ( = ?auto_594049 ?auto_594054 ) ) ( not ( = ?auto_594049 ?auto_594055 ) ) ( not ( = ?auto_594049 ?auto_594056 ) ) ( not ( = ?auto_594049 ?auto_594057 ) ) ( not ( = ?auto_594049 ?auto_594058 ) ) ( not ( = ?auto_594049 ?auto_594059 ) ) ( not ( = ?auto_594049 ?auto_594060 ) ) ( not ( = ?auto_594050 ?auto_594051 ) ) ( not ( = ?auto_594050 ?auto_594052 ) ) ( not ( = ?auto_594050 ?auto_594053 ) ) ( not ( = ?auto_594050 ?auto_594054 ) ) ( not ( = ?auto_594050 ?auto_594055 ) ) ( not ( = ?auto_594050 ?auto_594056 ) ) ( not ( = ?auto_594050 ?auto_594057 ) ) ( not ( = ?auto_594050 ?auto_594058 ) ) ( not ( = ?auto_594050 ?auto_594059 ) ) ( not ( = ?auto_594050 ?auto_594060 ) ) ( not ( = ?auto_594051 ?auto_594052 ) ) ( not ( = ?auto_594051 ?auto_594053 ) ) ( not ( = ?auto_594051 ?auto_594054 ) ) ( not ( = ?auto_594051 ?auto_594055 ) ) ( not ( = ?auto_594051 ?auto_594056 ) ) ( not ( = ?auto_594051 ?auto_594057 ) ) ( not ( = ?auto_594051 ?auto_594058 ) ) ( not ( = ?auto_594051 ?auto_594059 ) ) ( not ( = ?auto_594051 ?auto_594060 ) ) ( not ( = ?auto_594052 ?auto_594053 ) ) ( not ( = ?auto_594052 ?auto_594054 ) ) ( not ( = ?auto_594052 ?auto_594055 ) ) ( not ( = ?auto_594052 ?auto_594056 ) ) ( not ( = ?auto_594052 ?auto_594057 ) ) ( not ( = ?auto_594052 ?auto_594058 ) ) ( not ( = ?auto_594052 ?auto_594059 ) ) ( not ( = ?auto_594052 ?auto_594060 ) ) ( not ( = ?auto_594053 ?auto_594054 ) ) ( not ( = ?auto_594053 ?auto_594055 ) ) ( not ( = ?auto_594053 ?auto_594056 ) ) ( not ( = ?auto_594053 ?auto_594057 ) ) ( not ( = ?auto_594053 ?auto_594058 ) ) ( not ( = ?auto_594053 ?auto_594059 ) ) ( not ( = ?auto_594053 ?auto_594060 ) ) ( not ( = ?auto_594054 ?auto_594055 ) ) ( not ( = ?auto_594054 ?auto_594056 ) ) ( not ( = ?auto_594054 ?auto_594057 ) ) ( not ( = ?auto_594054 ?auto_594058 ) ) ( not ( = ?auto_594054 ?auto_594059 ) ) ( not ( = ?auto_594054 ?auto_594060 ) ) ( not ( = ?auto_594055 ?auto_594056 ) ) ( not ( = ?auto_594055 ?auto_594057 ) ) ( not ( = ?auto_594055 ?auto_594058 ) ) ( not ( = ?auto_594055 ?auto_594059 ) ) ( not ( = ?auto_594055 ?auto_594060 ) ) ( not ( = ?auto_594056 ?auto_594057 ) ) ( not ( = ?auto_594056 ?auto_594058 ) ) ( not ( = ?auto_594056 ?auto_594059 ) ) ( not ( = ?auto_594056 ?auto_594060 ) ) ( not ( = ?auto_594057 ?auto_594058 ) ) ( not ( = ?auto_594057 ?auto_594059 ) ) ( not ( = ?auto_594057 ?auto_594060 ) ) ( not ( = ?auto_594058 ?auto_594059 ) ) ( not ( = ?auto_594058 ?auto_594060 ) ) ( not ( = ?auto_594059 ?auto_594060 ) ) ( ON ?auto_594058 ?auto_594059 ) ( ON ?auto_594057 ?auto_594058 ) ( CLEAR ?auto_594055 ) ( ON ?auto_594056 ?auto_594057 ) ( CLEAR ?auto_594056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_594046 ?auto_594047 ?auto_594048 ?auto_594049 ?auto_594050 ?auto_594051 ?auto_594052 ?auto_594053 ?auto_594054 ?auto_594055 ?auto_594056 )
      ( MAKE-14PILE ?auto_594046 ?auto_594047 ?auto_594048 ?auto_594049 ?auto_594050 ?auto_594051 ?auto_594052 ?auto_594053 ?auto_594054 ?auto_594055 ?auto_594056 ?auto_594057 ?auto_594058 ?auto_594059 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594104 - BLOCK
      ?auto_594105 - BLOCK
      ?auto_594106 - BLOCK
      ?auto_594107 - BLOCK
      ?auto_594108 - BLOCK
      ?auto_594109 - BLOCK
      ?auto_594110 - BLOCK
      ?auto_594111 - BLOCK
      ?auto_594112 - BLOCK
      ?auto_594113 - BLOCK
      ?auto_594114 - BLOCK
      ?auto_594115 - BLOCK
      ?auto_594116 - BLOCK
      ?auto_594117 - BLOCK
    )
    :vars
    (
      ?auto_594118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594117 ?auto_594118 ) ( ON-TABLE ?auto_594104 ) ( ON ?auto_594105 ?auto_594104 ) ( ON ?auto_594106 ?auto_594105 ) ( ON ?auto_594107 ?auto_594106 ) ( ON ?auto_594108 ?auto_594107 ) ( ON ?auto_594109 ?auto_594108 ) ( ON ?auto_594110 ?auto_594109 ) ( ON ?auto_594111 ?auto_594110 ) ( ON ?auto_594112 ?auto_594111 ) ( not ( = ?auto_594104 ?auto_594105 ) ) ( not ( = ?auto_594104 ?auto_594106 ) ) ( not ( = ?auto_594104 ?auto_594107 ) ) ( not ( = ?auto_594104 ?auto_594108 ) ) ( not ( = ?auto_594104 ?auto_594109 ) ) ( not ( = ?auto_594104 ?auto_594110 ) ) ( not ( = ?auto_594104 ?auto_594111 ) ) ( not ( = ?auto_594104 ?auto_594112 ) ) ( not ( = ?auto_594104 ?auto_594113 ) ) ( not ( = ?auto_594104 ?auto_594114 ) ) ( not ( = ?auto_594104 ?auto_594115 ) ) ( not ( = ?auto_594104 ?auto_594116 ) ) ( not ( = ?auto_594104 ?auto_594117 ) ) ( not ( = ?auto_594104 ?auto_594118 ) ) ( not ( = ?auto_594105 ?auto_594106 ) ) ( not ( = ?auto_594105 ?auto_594107 ) ) ( not ( = ?auto_594105 ?auto_594108 ) ) ( not ( = ?auto_594105 ?auto_594109 ) ) ( not ( = ?auto_594105 ?auto_594110 ) ) ( not ( = ?auto_594105 ?auto_594111 ) ) ( not ( = ?auto_594105 ?auto_594112 ) ) ( not ( = ?auto_594105 ?auto_594113 ) ) ( not ( = ?auto_594105 ?auto_594114 ) ) ( not ( = ?auto_594105 ?auto_594115 ) ) ( not ( = ?auto_594105 ?auto_594116 ) ) ( not ( = ?auto_594105 ?auto_594117 ) ) ( not ( = ?auto_594105 ?auto_594118 ) ) ( not ( = ?auto_594106 ?auto_594107 ) ) ( not ( = ?auto_594106 ?auto_594108 ) ) ( not ( = ?auto_594106 ?auto_594109 ) ) ( not ( = ?auto_594106 ?auto_594110 ) ) ( not ( = ?auto_594106 ?auto_594111 ) ) ( not ( = ?auto_594106 ?auto_594112 ) ) ( not ( = ?auto_594106 ?auto_594113 ) ) ( not ( = ?auto_594106 ?auto_594114 ) ) ( not ( = ?auto_594106 ?auto_594115 ) ) ( not ( = ?auto_594106 ?auto_594116 ) ) ( not ( = ?auto_594106 ?auto_594117 ) ) ( not ( = ?auto_594106 ?auto_594118 ) ) ( not ( = ?auto_594107 ?auto_594108 ) ) ( not ( = ?auto_594107 ?auto_594109 ) ) ( not ( = ?auto_594107 ?auto_594110 ) ) ( not ( = ?auto_594107 ?auto_594111 ) ) ( not ( = ?auto_594107 ?auto_594112 ) ) ( not ( = ?auto_594107 ?auto_594113 ) ) ( not ( = ?auto_594107 ?auto_594114 ) ) ( not ( = ?auto_594107 ?auto_594115 ) ) ( not ( = ?auto_594107 ?auto_594116 ) ) ( not ( = ?auto_594107 ?auto_594117 ) ) ( not ( = ?auto_594107 ?auto_594118 ) ) ( not ( = ?auto_594108 ?auto_594109 ) ) ( not ( = ?auto_594108 ?auto_594110 ) ) ( not ( = ?auto_594108 ?auto_594111 ) ) ( not ( = ?auto_594108 ?auto_594112 ) ) ( not ( = ?auto_594108 ?auto_594113 ) ) ( not ( = ?auto_594108 ?auto_594114 ) ) ( not ( = ?auto_594108 ?auto_594115 ) ) ( not ( = ?auto_594108 ?auto_594116 ) ) ( not ( = ?auto_594108 ?auto_594117 ) ) ( not ( = ?auto_594108 ?auto_594118 ) ) ( not ( = ?auto_594109 ?auto_594110 ) ) ( not ( = ?auto_594109 ?auto_594111 ) ) ( not ( = ?auto_594109 ?auto_594112 ) ) ( not ( = ?auto_594109 ?auto_594113 ) ) ( not ( = ?auto_594109 ?auto_594114 ) ) ( not ( = ?auto_594109 ?auto_594115 ) ) ( not ( = ?auto_594109 ?auto_594116 ) ) ( not ( = ?auto_594109 ?auto_594117 ) ) ( not ( = ?auto_594109 ?auto_594118 ) ) ( not ( = ?auto_594110 ?auto_594111 ) ) ( not ( = ?auto_594110 ?auto_594112 ) ) ( not ( = ?auto_594110 ?auto_594113 ) ) ( not ( = ?auto_594110 ?auto_594114 ) ) ( not ( = ?auto_594110 ?auto_594115 ) ) ( not ( = ?auto_594110 ?auto_594116 ) ) ( not ( = ?auto_594110 ?auto_594117 ) ) ( not ( = ?auto_594110 ?auto_594118 ) ) ( not ( = ?auto_594111 ?auto_594112 ) ) ( not ( = ?auto_594111 ?auto_594113 ) ) ( not ( = ?auto_594111 ?auto_594114 ) ) ( not ( = ?auto_594111 ?auto_594115 ) ) ( not ( = ?auto_594111 ?auto_594116 ) ) ( not ( = ?auto_594111 ?auto_594117 ) ) ( not ( = ?auto_594111 ?auto_594118 ) ) ( not ( = ?auto_594112 ?auto_594113 ) ) ( not ( = ?auto_594112 ?auto_594114 ) ) ( not ( = ?auto_594112 ?auto_594115 ) ) ( not ( = ?auto_594112 ?auto_594116 ) ) ( not ( = ?auto_594112 ?auto_594117 ) ) ( not ( = ?auto_594112 ?auto_594118 ) ) ( not ( = ?auto_594113 ?auto_594114 ) ) ( not ( = ?auto_594113 ?auto_594115 ) ) ( not ( = ?auto_594113 ?auto_594116 ) ) ( not ( = ?auto_594113 ?auto_594117 ) ) ( not ( = ?auto_594113 ?auto_594118 ) ) ( not ( = ?auto_594114 ?auto_594115 ) ) ( not ( = ?auto_594114 ?auto_594116 ) ) ( not ( = ?auto_594114 ?auto_594117 ) ) ( not ( = ?auto_594114 ?auto_594118 ) ) ( not ( = ?auto_594115 ?auto_594116 ) ) ( not ( = ?auto_594115 ?auto_594117 ) ) ( not ( = ?auto_594115 ?auto_594118 ) ) ( not ( = ?auto_594116 ?auto_594117 ) ) ( not ( = ?auto_594116 ?auto_594118 ) ) ( not ( = ?auto_594117 ?auto_594118 ) ) ( ON ?auto_594116 ?auto_594117 ) ( ON ?auto_594115 ?auto_594116 ) ( ON ?auto_594114 ?auto_594115 ) ( CLEAR ?auto_594112 ) ( ON ?auto_594113 ?auto_594114 ) ( CLEAR ?auto_594113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_594104 ?auto_594105 ?auto_594106 ?auto_594107 ?auto_594108 ?auto_594109 ?auto_594110 ?auto_594111 ?auto_594112 ?auto_594113 )
      ( MAKE-14PILE ?auto_594104 ?auto_594105 ?auto_594106 ?auto_594107 ?auto_594108 ?auto_594109 ?auto_594110 ?auto_594111 ?auto_594112 ?auto_594113 ?auto_594114 ?auto_594115 ?auto_594116 ?auto_594117 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594162 - BLOCK
      ?auto_594163 - BLOCK
      ?auto_594164 - BLOCK
      ?auto_594165 - BLOCK
      ?auto_594166 - BLOCK
      ?auto_594167 - BLOCK
      ?auto_594168 - BLOCK
      ?auto_594169 - BLOCK
      ?auto_594170 - BLOCK
      ?auto_594171 - BLOCK
      ?auto_594172 - BLOCK
      ?auto_594173 - BLOCK
      ?auto_594174 - BLOCK
      ?auto_594175 - BLOCK
    )
    :vars
    (
      ?auto_594176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594175 ?auto_594176 ) ( ON-TABLE ?auto_594162 ) ( ON ?auto_594163 ?auto_594162 ) ( ON ?auto_594164 ?auto_594163 ) ( ON ?auto_594165 ?auto_594164 ) ( ON ?auto_594166 ?auto_594165 ) ( ON ?auto_594167 ?auto_594166 ) ( ON ?auto_594168 ?auto_594167 ) ( ON ?auto_594169 ?auto_594168 ) ( not ( = ?auto_594162 ?auto_594163 ) ) ( not ( = ?auto_594162 ?auto_594164 ) ) ( not ( = ?auto_594162 ?auto_594165 ) ) ( not ( = ?auto_594162 ?auto_594166 ) ) ( not ( = ?auto_594162 ?auto_594167 ) ) ( not ( = ?auto_594162 ?auto_594168 ) ) ( not ( = ?auto_594162 ?auto_594169 ) ) ( not ( = ?auto_594162 ?auto_594170 ) ) ( not ( = ?auto_594162 ?auto_594171 ) ) ( not ( = ?auto_594162 ?auto_594172 ) ) ( not ( = ?auto_594162 ?auto_594173 ) ) ( not ( = ?auto_594162 ?auto_594174 ) ) ( not ( = ?auto_594162 ?auto_594175 ) ) ( not ( = ?auto_594162 ?auto_594176 ) ) ( not ( = ?auto_594163 ?auto_594164 ) ) ( not ( = ?auto_594163 ?auto_594165 ) ) ( not ( = ?auto_594163 ?auto_594166 ) ) ( not ( = ?auto_594163 ?auto_594167 ) ) ( not ( = ?auto_594163 ?auto_594168 ) ) ( not ( = ?auto_594163 ?auto_594169 ) ) ( not ( = ?auto_594163 ?auto_594170 ) ) ( not ( = ?auto_594163 ?auto_594171 ) ) ( not ( = ?auto_594163 ?auto_594172 ) ) ( not ( = ?auto_594163 ?auto_594173 ) ) ( not ( = ?auto_594163 ?auto_594174 ) ) ( not ( = ?auto_594163 ?auto_594175 ) ) ( not ( = ?auto_594163 ?auto_594176 ) ) ( not ( = ?auto_594164 ?auto_594165 ) ) ( not ( = ?auto_594164 ?auto_594166 ) ) ( not ( = ?auto_594164 ?auto_594167 ) ) ( not ( = ?auto_594164 ?auto_594168 ) ) ( not ( = ?auto_594164 ?auto_594169 ) ) ( not ( = ?auto_594164 ?auto_594170 ) ) ( not ( = ?auto_594164 ?auto_594171 ) ) ( not ( = ?auto_594164 ?auto_594172 ) ) ( not ( = ?auto_594164 ?auto_594173 ) ) ( not ( = ?auto_594164 ?auto_594174 ) ) ( not ( = ?auto_594164 ?auto_594175 ) ) ( not ( = ?auto_594164 ?auto_594176 ) ) ( not ( = ?auto_594165 ?auto_594166 ) ) ( not ( = ?auto_594165 ?auto_594167 ) ) ( not ( = ?auto_594165 ?auto_594168 ) ) ( not ( = ?auto_594165 ?auto_594169 ) ) ( not ( = ?auto_594165 ?auto_594170 ) ) ( not ( = ?auto_594165 ?auto_594171 ) ) ( not ( = ?auto_594165 ?auto_594172 ) ) ( not ( = ?auto_594165 ?auto_594173 ) ) ( not ( = ?auto_594165 ?auto_594174 ) ) ( not ( = ?auto_594165 ?auto_594175 ) ) ( not ( = ?auto_594165 ?auto_594176 ) ) ( not ( = ?auto_594166 ?auto_594167 ) ) ( not ( = ?auto_594166 ?auto_594168 ) ) ( not ( = ?auto_594166 ?auto_594169 ) ) ( not ( = ?auto_594166 ?auto_594170 ) ) ( not ( = ?auto_594166 ?auto_594171 ) ) ( not ( = ?auto_594166 ?auto_594172 ) ) ( not ( = ?auto_594166 ?auto_594173 ) ) ( not ( = ?auto_594166 ?auto_594174 ) ) ( not ( = ?auto_594166 ?auto_594175 ) ) ( not ( = ?auto_594166 ?auto_594176 ) ) ( not ( = ?auto_594167 ?auto_594168 ) ) ( not ( = ?auto_594167 ?auto_594169 ) ) ( not ( = ?auto_594167 ?auto_594170 ) ) ( not ( = ?auto_594167 ?auto_594171 ) ) ( not ( = ?auto_594167 ?auto_594172 ) ) ( not ( = ?auto_594167 ?auto_594173 ) ) ( not ( = ?auto_594167 ?auto_594174 ) ) ( not ( = ?auto_594167 ?auto_594175 ) ) ( not ( = ?auto_594167 ?auto_594176 ) ) ( not ( = ?auto_594168 ?auto_594169 ) ) ( not ( = ?auto_594168 ?auto_594170 ) ) ( not ( = ?auto_594168 ?auto_594171 ) ) ( not ( = ?auto_594168 ?auto_594172 ) ) ( not ( = ?auto_594168 ?auto_594173 ) ) ( not ( = ?auto_594168 ?auto_594174 ) ) ( not ( = ?auto_594168 ?auto_594175 ) ) ( not ( = ?auto_594168 ?auto_594176 ) ) ( not ( = ?auto_594169 ?auto_594170 ) ) ( not ( = ?auto_594169 ?auto_594171 ) ) ( not ( = ?auto_594169 ?auto_594172 ) ) ( not ( = ?auto_594169 ?auto_594173 ) ) ( not ( = ?auto_594169 ?auto_594174 ) ) ( not ( = ?auto_594169 ?auto_594175 ) ) ( not ( = ?auto_594169 ?auto_594176 ) ) ( not ( = ?auto_594170 ?auto_594171 ) ) ( not ( = ?auto_594170 ?auto_594172 ) ) ( not ( = ?auto_594170 ?auto_594173 ) ) ( not ( = ?auto_594170 ?auto_594174 ) ) ( not ( = ?auto_594170 ?auto_594175 ) ) ( not ( = ?auto_594170 ?auto_594176 ) ) ( not ( = ?auto_594171 ?auto_594172 ) ) ( not ( = ?auto_594171 ?auto_594173 ) ) ( not ( = ?auto_594171 ?auto_594174 ) ) ( not ( = ?auto_594171 ?auto_594175 ) ) ( not ( = ?auto_594171 ?auto_594176 ) ) ( not ( = ?auto_594172 ?auto_594173 ) ) ( not ( = ?auto_594172 ?auto_594174 ) ) ( not ( = ?auto_594172 ?auto_594175 ) ) ( not ( = ?auto_594172 ?auto_594176 ) ) ( not ( = ?auto_594173 ?auto_594174 ) ) ( not ( = ?auto_594173 ?auto_594175 ) ) ( not ( = ?auto_594173 ?auto_594176 ) ) ( not ( = ?auto_594174 ?auto_594175 ) ) ( not ( = ?auto_594174 ?auto_594176 ) ) ( not ( = ?auto_594175 ?auto_594176 ) ) ( ON ?auto_594174 ?auto_594175 ) ( ON ?auto_594173 ?auto_594174 ) ( ON ?auto_594172 ?auto_594173 ) ( ON ?auto_594171 ?auto_594172 ) ( CLEAR ?auto_594169 ) ( ON ?auto_594170 ?auto_594171 ) ( CLEAR ?auto_594170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_594162 ?auto_594163 ?auto_594164 ?auto_594165 ?auto_594166 ?auto_594167 ?auto_594168 ?auto_594169 ?auto_594170 )
      ( MAKE-14PILE ?auto_594162 ?auto_594163 ?auto_594164 ?auto_594165 ?auto_594166 ?auto_594167 ?auto_594168 ?auto_594169 ?auto_594170 ?auto_594171 ?auto_594172 ?auto_594173 ?auto_594174 ?auto_594175 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594220 - BLOCK
      ?auto_594221 - BLOCK
      ?auto_594222 - BLOCK
      ?auto_594223 - BLOCK
      ?auto_594224 - BLOCK
      ?auto_594225 - BLOCK
      ?auto_594226 - BLOCK
      ?auto_594227 - BLOCK
      ?auto_594228 - BLOCK
      ?auto_594229 - BLOCK
      ?auto_594230 - BLOCK
      ?auto_594231 - BLOCK
      ?auto_594232 - BLOCK
      ?auto_594233 - BLOCK
    )
    :vars
    (
      ?auto_594234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594233 ?auto_594234 ) ( ON-TABLE ?auto_594220 ) ( ON ?auto_594221 ?auto_594220 ) ( ON ?auto_594222 ?auto_594221 ) ( ON ?auto_594223 ?auto_594222 ) ( ON ?auto_594224 ?auto_594223 ) ( ON ?auto_594225 ?auto_594224 ) ( ON ?auto_594226 ?auto_594225 ) ( not ( = ?auto_594220 ?auto_594221 ) ) ( not ( = ?auto_594220 ?auto_594222 ) ) ( not ( = ?auto_594220 ?auto_594223 ) ) ( not ( = ?auto_594220 ?auto_594224 ) ) ( not ( = ?auto_594220 ?auto_594225 ) ) ( not ( = ?auto_594220 ?auto_594226 ) ) ( not ( = ?auto_594220 ?auto_594227 ) ) ( not ( = ?auto_594220 ?auto_594228 ) ) ( not ( = ?auto_594220 ?auto_594229 ) ) ( not ( = ?auto_594220 ?auto_594230 ) ) ( not ( = ?auto_594220 ?auto_594231 ) ) ( not ( = ?auto_594220 ?auto_594232 ) ) ( not ( = ?auto_594220 ?auto_594233 ) ) ( not ( = ?auto_594220 ?auto_594234 ) ) ( not ( = ?auto_594221 ?auto_594222 ) ) ( not ( = ?auto_594221 ?auto_594223 ) ) ( not ( = ?auto_594221 ?auto_594224 ) ) ( not ( = ?auto_594221 ?auto_594225 ) ) ( not ( = ?auto_594221 ?auto_594226 ) ) ( not ( = ?auto_594221 ?auto_594227 ) ) ( not ( = ?auto_594221 ?auto_594228 ) ) ( not ( = ?auto_594221 ?auto_594229 ) ) ( not ( = ?auto_594221 ?auto_594230 ) ) ( not ( = ?auto_594221 ?auto_594231 ) ) ( not ( = ?auto_594221 ?auto_594232 ) ) ( not ( = ?auto_594221 ?auto_594233 ) ) ( not ( = ?auto_594221 ?auto_594234 ) ) ( not ( = ?auto_594222 ?auto_594223 ) ) ( not ( = ?auto_594222 ?auto_594224 ) ) ( not ( = ?auto_594222 ?auto_594225 ) ) ( not ( = ?auto_594222 ?auto_594226 ) ) ( not ( = ?auto_594222 ?auto_594227 ) ) ( not ( = ?auto_594222 ?auto_594228 ) ) ( not ( = ?auto_594222 ?auto_594229 ) ) ( not ( = ?auto_594222 ?auto_594230 ) ) ( not ( = ?auto_594222 ?auto_594231 ) ) ( not ( = ?auto_594222 ?auto_594232 ) ) ( not ( = ?auto_594222 ?auto_594233 ) ) ( not ( = ?auto_594222 ?auto_594234 ) ) ( not ( = ?auto_594223 ?auto_594224 ) ) ( not ( = ?auto_594223 ?auto_594225 ) ) ( not ( = ?auto_594223 ?auto_594226 ) ) ( not ( = ?auto_594223 ?auto_594227 ) ) ( not ( = ?auto_594223 ?auto_594228 ) ) ( not ( = ?auto_594223 ?auto_594229 ) ) ( not ( = ?auto_594223 ?auto_594230 ) ) ( not ( = ?auto_594223 ?auto_594231 ) ) ( not ( = ?auto_594223 ?auto_594232 ) ) ( not ( = ?auto_594223 ?auto_594233 ) ) ( not ( = ?auto_594223 ?auto_594234 ) ) ( not ( = ?auto_594224 ?auto_594225 ) ) ( not ( = ?auto_594224 ?auto_594226 ) ) ( not ( = ?auto_594224 ?auto_594227 ) ) ( not ( = ?auto_594224 ?auto_594228 ) ) ( not ( = ?auto_594224 ?auto_594229 ) ) ( not ( = ?auto_594224 ?auto_594230 ) ) ( not ( = ?auto_594224 ?auto_594231 ) ) ( not ( = ?auto_594224 ?auto_594232 ) ) ( not ( = ?auto_594224 ?auto_594233 ) ) ( not ( = ?auto_594224 ?auto_594234 ) ) ( not ( = ?auto_594225 ?auto_594226 ) ) ( not ( = ?auto_594225 ?auto_594227 ) ) ( not ( = ?auto_594225 ?auto_594228 ) ) ( not ( = ?auto_594225 ?auto_594229 ) ) ( not ( = ?auto_594225 ?auto_594230 ) ) ( not ( = ?auto_594225 ?auto_594231 ) ) ( not ( = ?auto_594225 ?auto_594232 ) ) ( not ( = ?auto_594225 ?auto_594233 ) ) ( not ( = ?auto_594225 ?auto_594234 ) ) ( not ( = ?auto_594226 ?auto_594227 ) ) ( not ( = ?auto_594226 ?auto_594228 ) ) ( not ( = ?auto_594226 ?auto_594229 ) ) ( not ( = ?auto_594226 ?auto_594230 ) ) ( not ( = ?auto_594226 ?auto_594231 ) ) ( not ( = ?auto_594226 ?auto_594232 ) ) ( not ( = ?auto_594226 ?auto_594233 ) ) ( not ( = ?auto_594226 ?auto_594234 ) ) ( not ( = ?auto_594227 ?auto_594228 ) ) ( not ( = ?auto_594227 ?auto_594229 ) ) ( not ( = ?auto_594227 ?auto_594230 ) ) ( not ( = ?auto_594227 ?auto_594231 ) ) ( not ( = ?auto_594227 ?auto_594232 ) ) ( not ( = ?auto_594227 ?auto_594233 ) ) ( not ( = ?auto_594227 ?auto_594234 ) ) ( not ( = ?auto_594228 ?auto_594229 ) ) ( not ( = ?auto_594228 ?auto_594230 ) ) ( not ( = ?auto_594228 ?auto_594231 ) ) ( not ( = ?auto_594228 ?auto_594232 ) ) ( not ( = ?auto_594228 ?auto_594233 ) ) ( not ( = ?auto_594228 ?auto_594234 ) ) ( not ( = ?auto_594229 ?auto_594230 ) ) ( not ( = ?auto_594229 ?auto_594231 ) ) ( not ( = ?auto_594229 ?auto_594232 ) ) ( not ( = ?auto_594229 ?auto_594233 ) ) ( not ( = ?auto_594229 ?auto_594234 ) ) ( not ( = ?auto_594230 ?auto_594231 ) ) ( not ( = ?auto_594230 ?auto_594232 ) ) ( not ( = ?auto_594230 ?auto_594233 ) ) ( not ( = ?auto_594230 ?auto_594234 ) ) ( not ( = ?auto_594231 ?auto_594232 ) ) ( not ( = ?auto_594231 ?auto_594233 ) ) ( not ( = ?auto_594231 ?auto_594234 ) ) ( not ( = ?auto_594232 ?auto_594233 ) ) ( not ( = ?auto_594232 ?auto_594234 ) ) ( not ( = ?auto_594233 ?auto_594234 ) ) ( ON ?auto_594232 ?auto_594233 ) ( ON ?auto_594231 ?auto_594232 ) ( ON ?auto_594230 ?auto_594231 ) ( ON ?auto_594229 ?auto_594230 ) ( ON ?auto_594228 ?auto_594229 ) ( CLEAR ?auto_594226 ) ( ON ?auto_594227 ?auto_594228 ) ( CLEAR ?auto_594227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_594220 ?auto_594221 ?auto_594222 ?auto_594223 ?auto_594224 ?auto_594225 ?auto_594226 ?auto_594227 )
      ( MAKE-14PILE ?auto_594220 ?auto_594221 ?auto_594222 ?auto_594223 ?auto_594224 ?auto_594225 ?auto_594226 ?auto_594227 ?auto_594228 ?auto_594229 ?auto_594230 ?auto_594231 ?auto_594232 ?auto_594233 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594278 - BLOCK
      ?auto_594279 - BLOCK
      ?auto_594280 - BLOCK
      ?auto_594281 - BLOCK
      ?auto_594282 - BLOCK
      ?auto_594283 - BLOCK
      ?auto_594284 - BLOCK
      ?auto_594285 - BLOCK
      ?auto_594286 - BLOCK
      ?auto_594287 - BLOCK
      ?auto_594288 - BLOCK
      ?auto_594289 - BLOCK
      ?auto_594290 - BLOCK
      ?auto_594291 - BLOCK
    )
    :vars
    (
      ?auto_594292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594291 ?auto_594292 ) ( ON-TABLE ?auto_594278 ) ( ON ?auto_594279 ?auto_594278 ) ( ON ?auto_594280 ?auto_594279 ) ( ON ?auto_594281 ?auto_594280 ) ( ON ?auto_594282 ?auto_594281 ) ( ON ?auto_594283 ?auto_594282 ) ( not ( = ?auto_594278 ?auto_594279 ) ) ( not ( = ?auto_594278 ?auto_594280 ) ) ( not ( = ?auto_594278 ?auto_594281 ) ) ( not ( = ?auto_594278 ?auto_594282 ) ) ( not ( = ?auto_594278 ?auto_594283 ) ) ( not ( = ?auto_594278 ?auto_594284 ) ) ( not ( = ?auto_594278 ?auto_594285 ) ) ( not ( = ?auto_594278 ?auto_594286 ) ) ( not ( = ?auto_594278 ?auto_594287 ) ) ( not ( = ?auto_594278 ?auto_594288 ) ) ( not ( = ?auto_594278 ?auto_594289 ) ) ( not ( = ?auto_594278 ?auto_594290 ) ) ( not ( = ?auto_594278 ?auto_594291 ) ) ( not ( = ?auto_594278 ?auto_594292 ) ) ( not ( = ?auto_594279 ?auto_594280 ) ) ( not ( = ?auto_594279 ?auto_594281 ) ) ( not ( = ?auto_594279 ?auto_594282 ) ) ( not ( = ?auto_594279 ?auto_594283 ) ) ( not ( = ?auto_594279 ?auto_594284 ) ) ( not ( = ?auto_594279 ?auto_594285 ) ) ( not ( = ?auto_594279 ?auto_594286 ) ) ( not ( = ?auto_594279 ?auto_594287 ) ) ( not ( = ?auto_594279 ?auto_594288 ) ) ( not ( = ?auto_594279 ?auto_594289 ) ) ( not ( = ?auto_594279 ?auto_594290 ) ) ( not ( = ?auto_594279 ?auto_594291 ) ) ( not ( = ?auto_594279 ?auto_594292 ) ) ( not ( = ?auto_594280 ?auto_594281 ) ) ( not ( = ?auto_594280 ?auto_594282 ) ) ( not ( = ?auto_594280 ?auto_594283 ) ) ( not ( = ?auto_594280 ?auto_594284 ) ) ( not ( = ?auto_594280 ?auto_594285 ) ) ( not ( = ?auto_594280 ?auto_594286 ) ) ( not ( = ?auto_594280 ?auto_594287 ) ) ( not ( = ?auto_594280 ?auto_594288 ) ) ( not ( = ?auto_594280 ?auto_594289 ) ) ( not ( = ?auto_594280 ?auto_594290 ) ) ( not ( = ?auto_594280 ?auto_594291 ) ) ( not ( = ?auto_594280 ?auto_594292 ) ) ( not ( = ?auto_594281 ?auto_594282 ) ) ( not ( = ?auto_594281 ?auto_594283 ) ) ( not ( = ?auto_594281 ?auto_594284 ) ) ( not ( = ?auto_594281 ?auto_594285 ) ) ( not ( = ?auto_594281 ?auto_594286 ) ) ( not ( = ?auto_594281 ?auto_594287 ) ) ( not ( = ?auto_594281 ?auto_594288 ) ) ( not ( = ?auto_594281 ?auto_594289 ) ) ( not ( = ?auto_594281 ?auto_594290 ) ) ( not ( = ?auto_594281 ?auto_594291 ) ) ( not ( = ?auto_594281 ?auto_594292 ) ) ( not ( = ?auto_594282 ?auto_594283 ) ) ( not ( = ?auto_594282 ?auto_594284 ) ) ( not ( = ?auto_594282 ?auto_594285 ) ) ( not ( = ?auto_594282 ?auto_594286 ) ) ( not ( = ?auto_594282 ?auto_594287 ) ) ( not ( = ?auto_594282 ?auto_594288 ) ) ( not ( = ?auto_594282 ?auto_594289 ) ) ( not ( = ?auto_594282 ?auto_594290 ) ) ( not ( = ?auto_594282 ?auto_594291 ) ) ( not ( = ?auto_594282 ?auto_594292 ) ) ( not ( = ?auto_594283 ?auto_594284 ) ) ( not ( = ?auto_594283 ?auto_594285 ) ) ( not ( = ?auto_594283 ?auto_594286 ) ) ( not ( = ?auto_594283 ?auto_594287 ) ) ( not ( = ?auto_594283 ?auto_594288 ) ) ( not ( = ?auto_594283 ?auto_594289 ) ) ( not ( = ?auto_594283 ?auto_594290 ) ) ( not ( = ?auto_594283 ?auto_594291 ) ) ( not ( = ?auto_594283 ?auto_594292 ) ) ( not ( = ?auto_594284 ?auto_594285 ) ) ( not ( = ?auto_594284 ?auto_594286 ) ) ( not ( = ?auto_594284 ?auto_594287 ) ) ( not ( = ?auto_594284 ?auto_594288 ) ) ( not ( = ?auto_594284 ?auto_594289 ) ) ( not ( = ?auto_594284 ?auto_594290 ) ) ( not ( = ?auto_594284 ?auto_594291 ) ) ( not ( = ?auto_594284 ?auto_594292 ) ) ( not ( = ?auto_594285 ?auto_594286 ) ) ( not ( = ?auto_594285 ?auto_594287 ) ) ( not ( = ?auto_594285 ?auto_594288 ) ) ( not ( = ?auto_594285 ?auto_594289 ) ) ( not ( = ?auto_594285 ?auto_594290 ) ) ( not ( = ?auto_594285 ?auto_594291 ) ) ( not ( = ?auto_594285 ?auto_594292 ) ) ( not ( = ?auto_594286 ?auto_594287 ) ) ( not ( = ?auto_594286 ?auto_594288 ) ) ( not ( = ?auto_594286 ?auto_594289 ) ) ( not ( = ?auto_594286 ?auto_594290 ) ) ( not ( = ?auto_594286 ?auto_594291 ) ) ( not ( = ?auto_594286 ?auto_594292 ) ) ( not ( = ?auto_594287 ?auto_594288 ) ) ( not ( = ?auto_594287 ?auto_594289 ) ) ( not ( = ?auto_594287 ?auto_594290 ) ) ( not ( = ?auto_594287 ?auto_594291 ) ) ( not ( = ?auto_594287 ?auto_594292 ) ) ( not ( = ?auto_594288 ?auto_594289 ) ) ( not ( = ?auto_594288 ?auto_594290 ) ) ( not ( = ?auto_594288 ?auto_594291 ) ) ( not ( = ?auto_594288 ?auto_594292 ) ) ( not ( = ?auto_594289 ?auto_594290 ) ) ( not ( = ?auto_594289 ?auto_594291 ) ) ( not ( = ?auto_594289 ?auto_594292 ) ) ( not ( = ?auto_594290 ?auto_594291 ) ) ( not ( = ?auto_594290 ?auto_594292 ) ) ( not ( = ?auto_594291 ?auto_594292 ) ) ( ON ?auto_594290 ?auto_594291 ) ( ON ?auto_594289 ?auto_594290 ) ( ON ?auto_594288 ?auto_594289 ) ( ON ?auto_594287 ?auto_594288 ) ( ON ?auto_594286 ?auto_594287 ) ( ON ?auto_594285 ?auto_594286 ) ( CLEAR ?auto_594283 ) ( ON ?auto_594284 ?auto_594285 ) ( CLEAR ?auto_594284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_594278 ?auto_594279 ?auto_594280 ?auto_594281 ?auto_594282 ?auto_594283 ?auto_594284 )
      ( MAKE-14PILE ?auto_594278 ?auto_594279 ?auto_594280 ?auto_594281 ?auto_594282 ?auto_594283 ?auto_594284 ?auto_594285 ?auto_594286 ?auto_594287 ?auto_594288 ?auto_594289 ?auto_594290 ?auto_594291 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594336 - BLOCK
      ?auto_594337 - BLOCK
      ?auto_594338 - BLOCK
      ?auto_594339 - BLOCK
      ?auto_594340 - BLOCK
      ?auto_594341 - BLOCK
      ?auto_594342 - BLOCK
      ?auto_594343 - BLOCK
      ?auto_594344 - BLOCK
      ?auto_594345 - BLOCK
      ?auto_594346 - BLOCK
      ?auto_594347 - BLOCK
      ?auto_594348 - BLOCK
      ?auto_594349 - BLOCK
    )
    :vars
    (
      ?auto_594350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594349 ?auto_594350 ) ( ON-TABLE ?auto_594336 ) ( ON ?auto_594337 ?auto_594336 ) ( ON ?auto_594338 ?auto_594337 ) ( ON ?auto_594339 ?auto_594338 ) ( ON ?auto_594340 ?auto_594339 ) ( not ( = ?auto_594336 ?auto_594337 ) ) ( not ( = ?auto_594336 ?auto_594338 ) ) ( not ( = ?auto_594336 ?auto_594339 ) ) ( not ( = ?auto_594336 ?auto_594340 ) ) ( not ( = ?auto_594336 ?auto_594341 ) ) ( not ( = ?auto_594336 ?auto_594342 ) ) ( not ( = ?auto_594336 ?auto_594343 ) ) ( not ( = ?auto_594336 ?auto_594344 ) ) ( not ( = ?auto_594336 ?auto_594345 ) ) ( not ( = ?auto_594336 ?auto_594346 ) ) ( not ( = ?auto_594336 ?auto_594347 ) ) ( not ( = ?auto_594336 ?auto_594348 ) ) ( not ( = ?auto_594336 ?auto_594349 ) ) ( not ( = ?auto_594336 ?auto_594350 ) ) ( not ( = ?auto_594337 ?auto_594338 ) ) ( not ( = ?auto_594337 ?auto_594339 ) ) ( not ( = ?auto_594337 ?auto_594340 ) ) ( not ( = ?auto_594337 ?auto_594341 ) ) ( not ( = ?auto_594337 ?auto_594342 ) ) ( not ( = ?auto_594337 ?auto_594343 ) ) ( not ( = ?auto_594337 ?auto_594344 ) ) ( not ( = ?auto_594337 ?auto_594345 ) ) ( not ( = ?auto_594337 ?auto_594346 ) ) ( not ( = ?auto_594337 ?auto_594347 ) ) ( not ( = ?auto_594337 ?auto_594348 ) ) ( not ( = ?auto_594337 ?auto_594349 ) ) ( not ( = ?auto_594337 ?auto_594350 ) ) ( not ( = ?auto_594338 ?auto_594339 ) ) ( not ( = ?auto_594338 ?auto_594340 ) ) ( not ( = ?auto_594338 ?auto_594341 ) ) ( not ( = ?auto_594338 ?auto_594342 ) ) ( not ( = ?auto_594338 ?auto_594343 ) ) ( not ( = ?auto_594338 ?auto_594344 ) ) ( not ( = ?auto_594338 ?auto_594345 ) ) ( not ( = ?auto_594338 ?auto_594346 ) ) ( not ( = ?auto_594338 ?auto_594347 ) ) ( not ( = ?auto_594338 ?auto_594348 ) ) ( not ( = ?auto_594338 ?auto_594349 ) ) ( not ( = ?auto_594338 ?auto_594350 ) ) ( not ( = ?auto_594339 ?auto_594340 ) ) ( not ( = ?auto_594339 ?auto_594341 ) ) ( not ( = ?auto_594339 ?auto_594342 ) ) ( not ( = ?auto_594339 ?auto_594343 ) ) ( not ( = ?auto_594339 ?auto_594344 ) ) ( not ( = ?auto_594339 ?auto_594345 ) ) ( not ( = ?auto_594339 ?auto_594346 ) ) ( not ( = ?auto_594339 ?auto_594347 ) ) ( not ( = ?auto_594339 ?auto_594348 ) ) ( not ( = ?auto_594339 ?auto_594349 ) ) ( not ( = ?auto_594339 ?auto_594350 ) ) ( not ( = ?auto_594340 ?auto_594341 ) ) ( not ( = ?auto_594340 ?auto_594342 ) ) ( not ( = ?auto_594340 ?auto_594343 ) ) ( not ( = ?auto_594340 ?auto_594344 ) ) ( not ( = ?auto_594340 ?auto_594345 ) ) ( not ( = ?auto_594340 ?auto_594346 ) ) ( not ( = ?auto_594340 ?auto_594347 ) ) ( not ( = ?auto_594340 ?auto_594348 ) ) ( not ( = ?auto_594340 ?auto_594349 ) ) ( not ( = ?auto_594340 ?auto_594350 ) ) ( not ( = ?auto_594341 ?auto_594342 ) ) ( not ( = ?auto_594341 ?auto_594343 ) ) ( not ( = ?auto_594341 ?auto_594344 ) ) ( not ( = ?auto_594341 ?auto_594345 ) ) ( not ( = ?auto_594341 ?auto_594346 ) ) ( not ( = ?auto_594341 ?auto_594347 ) ) ( not ( = ?auto_594341 ?auto_594348 ) ) ( not ( = ?auto_594341 ?auto_594349 ) ) ( not ( = ?auto_594341 ?auto_594350 ) ) ( not ( = ?auto_594342 ?auto_594343 ) ) ( not ( = ?auto_594342 ?auto_594344 ) ) ( not ( = ?auto_594342 ?auto_594345 ) ) ( not ( = ?auto_594342 ?auto_594346 ) ) ( not ( = ?auto_594342 ?auto_594347 ) ) ( not ( = ?auto_594342 ?auto_594348 ) ) ( not ( = ?auto_594342 ?auto_594349 ) ) ( not ( = ?auto_594342 ?auto_594350 ) ) ( not ( = ?auto_594343 ?auto_594344 ) ) ( not ( = ?auto_594343 ?auto_594345 ) ) ( not ( = ?auto_594343 ?auto_594346 ) ) ( not ( = ?auto_594343 ?auto_594347 ) ) ( not ( = ?auto_594343 ?auto_594348 ) ) ( not ( = ?auto_594343 ?auto_594349 ) ) ( not ( = ?auto_594343 ?auto_594350 ) ) ( not ( = ?auto_594344 ?auto_594345 ) ) ( not ( = ?auto_594344 ?auto_594346 ) ) ( not ( = ?auto_594344 ?auto_594347 ) ) ( not ( = ?auto_594344 ?auto_594348 ) ) ( not ( = ?auto_594344 ?auto_594349 ) ) ( not ( = ?auto_594344 ?auto_594350 ) ) ( not ( = ?auto_594345 ?auto_594346 ) ) ( not ( = ?auto_594345 ?auto_594347 ) ) ( not ( = ?auto_594345 ?auto_594348 ) ) ( not ( = ?auto_594345 ?auto_594349 ) ) ( not ( = ?auto_594345 ?auto_594350 ) ) ( not ( = ?auto_594346 ?auto_594347 ) ) ( not ( = ?auto_594346 ?auto_594348 ) ) ( not ( = ?auto_594346 ?auto_594349 ) ) ( not ( = ?auto_594346 ?auto_594350 ) ) ( not ( = ?auto_594347 ?auto_594348 ) ) ( not ( = ?auto_594347 ?auto_594349 ) ) ( not ( = ?auto_594347 ?auto_594350 ) ) ( not ( = ?auto_594348 ?auto_594349 ) ) ( not ( = ?auto_594348 ?auto_594350 ) ) ( not ( = ?auto_594349 ?auto_594350 ) ) ( ON ?auto_594348 ?auto_594349 ) ( ON ?auto_594347 ?auto_594348 ) ( ON ?auto_594346 ?auto_594347 ) ( ON ?auto_594345 ?auto_594346 ) ( ON ?auto_594344 ?auto_594345 ) ( ON ?auto_594343 ?auto_594344 ) ( ON ?auto_594342 ?auto_594343 ) ( CLEAR ?auto_594340 ) ( ON ?auto_594341 ?auto_594342 ) ( CLEAR ?auto_594341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_594336 ?auto_594337 ?auto_594338 ?auto_594339 ?auto_594340 ?auto_594341 )
      ( MAKE-14PILE ?auto_594336 ?auto_594337 ?auto_594338 ?auto_594339 ?auto_594340 ?auto_594341 ?auto_594342 ?auto_594343 ?auto_594344 ?auto_594345 ?auto_594346 ?auto_594347 ?auto_594348 ?auto_594349 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594394 - BLOCK
      ?auto_594395 - BLOCK
      ?auto_594396 - BLOCK
      ?auto_594397 - BLOCK
      ?auto_594398 - BLOCK
      ?auto_594399 - BLOCK
      ?auto_594400 - BLOCK
      ?auto_594401 - BLOCK
      ?auto_594402 - BLOCK
      ?auto_594403 - BLOCK
      ?auto_594404 - BLOCK
      ?auto_594405 - BLOCK
      ?auto_594406 - BLOCK
      ?auto_594407 - BLOCK
    )
    :vars
    (
      ?auto_594408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594407 ?auto_594408 ) ( ON-TABLE ?auto_594394 ) ( ON ?auto_594395 ?auto_594394 ) ( ON ?auto_594396 ?auto_594395 ) ( ON ?auto_594397 ?auto_594396 ) ( not ( = ?auto_594394 ?auto_594395 ) ) ( not ( = ?auto_594394 ?auto_594396 ) ) ( not ( = ?auto_594394 ?auto_594397 ) ) ( not ( = ?auto_594394 ?auto_594398 ) ) ( not ( = ?auto_594394 ?auto_594399 ) ) ( not ( = ?auto_594394 ?auto_594400 ) ) ( not ( = ?auto_594394 ?auto_594401 ) ) ( not ( = ?auto_594394 ?auto_594402 ) ) ( not ( = ?auto_594394 ?auto_594403 ) ) ( not ( = ?auto_594394 ?auto_594404 ) ) ( not ( = ?auto_594394 ?auto_594405 ) ) ( not ( = ?auto_594394 ?auto_594406 ) ) ( not ( = ?auto_594394 ?auto_594407 ) ) ( not ( = ?auto_594394 ?auto_594408 ) ) ( not ( = ?auto_594395 ?auto_594396 ) ) ( not ( = ?auto_594395 ?auto_594397 ) ) ( not ( = ?auto_594395 ?auto_594398 ) ) ( not ( = ?auto_594395 ?auto_594399 ) ) ( not ( = ?auto_594395 ?auto_594400 ) ) ( not ( = ?auto_594395 ?auto_594401 ) ) ( not ( = ?auto_594395 ?auto_594402 ) ) ( not ( = ?auto_594395 ?auto_594403 ) ) ( not ( = ?auto_594395 ?auto_594404 ) ) ( not ( = ?auto_594395 ?auto_594405 ) ) ( not ( = ?auto_594395 ?auto_594406 ) ) ( not ( = ?auto_594395 ?auto_594407 ) ) ( not ( = ?auto_594395 ?auto_594408 ) ) ( not ( = ?auto_594396 ?auto_594397 ) ) ( not ( = ?auto_594396 ?auto_594398 ) ) ( not ( = ?auto_594396 ?auto_594399 ) ) ( not ( = ?auto_594396 ?auto_594400 ) ) ( not ( = ?auto_594396 ?auto_594401 ) ) ( not ( = ?auto_594396 ?auto_594402 ) ) ( not ( = ?auto_594396 ?auto_594403 ) ) ( not ( = ?auto_594396 ?auto_594404 ) ) ( not ( = ?auto_594396 ?auto_594405 ) ) ( not ( = ?auto_594396 ?auto_594406 ) ) ( not ( = ?auto_594396 ?auto_594407 ) ) ( not ( = ?auto_594396 ?auto_594408 ) ) ( not ( = ?auto_594397 ?auto_594398 ) ) ( not ( = ?auto_594397 ?auto_594399 ) ) ( not ( = ?auto_594397 ?auto_594400 ) ) ( not ( = ?auto_594397 ?auto_594401 ) ) ( not ( = ?auto_594397 ?auto_594402 ) ) ( not ( = ?auto_594397 ?auto_594403 ) ) ( not ( = ?auto_594397 ?auto_594404 ) ) ( not ( = ?auto_594397 ?auto_594405 ) ) ( not ( = ?auto_594397 ?auto_594406 ) ) ( not ( = ?auto_594397 ?auto_594407 ) ) ( not ( = ?auto_594397 ?auto_594408 ) ) ( not ( = ?auto_594398 ?auto_594399 ) ) ( not ( = ?auto_594398 ?auto_594400 ) ) ( not ( = ?auto_594398 ?auto_594401 ) ) ( not ( = ?auto_594398 ?auto_594402 ) ) ( not ( = ?auto_594398 ?auto_594403 ) ) ( not ( = ?auto_594398 ?auto_594404 ) ) ( not ( = ?auto_594398 ?auto_594405 ) ) ( not ( = ?auto_594398 ?auto_594406 ) ) ( not ( = ?auto_594398 ?auto_594407 ) ) ( not ( = ?auto_594398 ?auto_594408 ) ) ( not ( = ?auto_594399 ?auto_594400 ) ) ( not ( = ?auto_594399 ?auto_594401 ) ) ( not ( = ?auto_594399 ?auto_594402 ) ) ( not ( = ?auto_594399 ?auto_594403 ) ) ( not ( = ?auto_594399 ?auto_594404 ) ) ( not ( = ?auto_594399 ?auto_594405 ) ) ( not ( = ?auto_594399 ?auto_594406 ) ) ( not ( = ?auto_594399 ?auto_594407 ) ) ( not ( = ?auto_594399 ?auto_594408 ) ) ( not ( = ?auto_594400 ?auto_594401 ) ) ( not ( = ?auto_594400 ?auto_594402 ) ) ( not ( = ?auto_594400 ?auto_594403 ) ) ( not ( = ?auto_594400 ?auto_594404 ) ) ( not ( = ?auto_594400 ?auto_594405 ) ) ( not ( = ?auto_594400 ?auto_594406 ) ) ( not ( = ?auto_594400 ?auto_594407 ) ) ( not ( = ?auto_594400 ?auto_594408 ) ) ( not ( = ?auto_594401 ?auto_594402 ) ) ( not ( = ?auto_594401 ?auto_594403 ) ) ( not ( = ?auto_594401 ?auto_594404 ) ) ( not ( = ?auto_594401 ?auto_594405 ) ) ( not ( = ?auto_594401 ?auto_594406 ) ) ( not ( = ?auto_594401 ?auto_594407 ) ) ( not ( = ?auto_594401 ?auto_594408 ) ) ( not ( = ?auto_594402 ?auto_594403 ) ) ( not ( = ?auto_594402 ?auto_594404 ) ) ( not ( = ?auto_594402 ?auto_594405 ) ) ( not ( = ?auto_594402 ?auto_594406 ) ) ( not ( = ?auto_594402 ?auto_594407 ) ) ( not ( = ?auto_594402 ?auto_594408 ) ) ( not ( = ?auto_594403 ?auto_594404 ) ) ( not ( = ?auto_594403 ?auto_594405 ) ) ( not ( = ?auto_594403 ?auto_594406 ) ) ( not ( = ?auto_594403 ?auto_594407 ) ) ( not ( = ?auto_594403 ?auto_594408 ) ) ( not ( = ?auto_594404 ?auto_594405 ) ) ( not ( = ?auto_594404 ?auto_594406 ) ) ( not ( = ?auto_594404 ?auto_594407 ) ) ( not ( = ?auto_594404 ?auto_594408 ) ) ( not ( = ?auto_594405 ?auto_594406 ) ) ( not ( = ?auto_594405 ?auto_594407 ) ) ( not ( = ?auto_594405 ?auto_594408 ) ) ( not ( = ?auto_594406 ?auto_594407 ) ) ( not ( = ?auto_594406 ?auto_594408 ) ) ( not ( = ?auto_594407 ?auto_594408 ) ) ( ON ?auto_594406 ?auto_594407 ) ( ON ?auto_594405 ?auto_594406 ) ( ON ?auto_594404 ?auto_594405 ) ( ON ?auto_594403 ?auto_594404 ) ( ON ?auto_594402 ?auto_594403 ) ( ON ?auto_594401 ?auto_594402 ) ( ON ?auto_594400 ?auto_594401 ) ( ON ?auto_594399 ?auto_594400 ) ( CLEAR ?auto_594397 ) ( ON ?auto_594398 ?auto_594399 ) ( CLEAR ?auto_594398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_594394 ?auto_594395 ?auto_594396 ?auto_594397 ?auto_594398 )
      ( MAKE-14PILE ?auto_594394 ?auto_594395 ?auto_594396 ?auto_594397 ?auto_594398 ?auto_594399 ?auto_594400 ?auto_594401 ?auto_594402 ?auto_594403 ?auto_594404 ?auto_594405 ?auto_594406 ?auto_594407 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594452 - BLOCK
      ?auto_594453 - BLOCK
      ?auto_594454 - BLOCK
      ?auto_594455 - BLOCK
      ?auto_594456 - BLOCK
      ?auto_594457 - BLOCK
      ?auto_594458 - BLOCK
      ?auto_594459 - BLOCK
      ?auto_594460 - BLOCK
      ?auto_594461 - BLOCK
      ?auto_594462 - BLOCK
      ?auto_594463 - BLOCK
      ?auto_594464 - BLOCK
      ?auto_594465 - BLOCK
    )
    :vars
    (
      ?auto_594466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594465 ?auto_594466 ) ( ON-TABLE ?auto_594452 ) ( ON ?auto_594453 ?auto_594452 ) ( ON ?auto_594454 ?auto_594453 ) ( not ( = ?auto_594452 ?auto_594453 ) ) ( not ( = ?auto_594452 ?auto_594454 ) ) ( not ( = ?auto_594452 ?auto_594455 ) ) ( not ( = ?auto_594452 ?auto_594456 ) ) ( not ( = ?auto_594452 ?auto_594457 ) ) ( not ( = ?auto_594452 ?auto_594458 ) ) ( not ( = ?auto_594452 ?auto_594459 ) ) ( not ( = ?auto_594452 ?auto_594460 ) ) ( not ( = ?auto_594452 ?auto_594461 ) ) ( not ( = ?auto_594452 ?auto_594462 ) ) ( not ( = ?auto_594452 ?auto_594463 ) ) ( not ( = ?auto_594452 ?auto_594464 ) ) ( not ( = ?auto_594452 ?auto_594465 ) ) ( not ( = ?auto_594452 ?auto_594466 ) ) ( not ( = ?auto_594453 ?auto_594454 ) ) ( not ( = ?auto_594453 ?auto_594455 ) ) ( not ( = ?auto_594453 ?auto_594456 ) ) ( not ( = ?auto_594453 ?auto_594457 ) ) ( not ( = ?auto_594453 ?auto_594458 ) ) ( not ( = ?auto_594453 ?auto_594459 ) ) ( not ( = ?auto_594453 ?auto_594460 ) ) ( not ( = ?auto_594453 ?auto_594461 ) ) ( not ( = ?auto_594453 ?auto_594462 ) ) ( not ( = ?auto_594453 ?auto_594463 ) ) ( not ( = ?auto_594453 ?auto_594464 ) ) ( not ( = ?auto_594453 ?auto_594465 ) ) ( not ( = ?auto_594453 ?auto_594466 ) ) ( not ( = ?auto_594454 ?auto_594455 ) ) ( not ( = ?auto_594454 ?auto_594456 ) ) ( not ( = ?auto_594454 ?auto_594457 ) ) ( not ( = ?auto_594454 ?auto_594458 ) ) ( not ( = ?auto_594454 ?auto_594459 ) ) ( not ( = ?auto_594454 ?auto_594460 ) ) ( not ( = ?auto_594454 ?auto_594461 ) ) ( not ( = ?auto_594454 ?auto_594462 ) ) ( not ( = ?auto_594454 ?auto_594463 ) ) ( not ( = ?auto_594454 ?auto_594464 ) ) ( not ( = ?auto_594454 ?auto_594465 ) ) ( not ( = ?auto_594454 ?auto_594466 ) ) ( not ( = ?auto_594455 ?auto_594456 ) ) ( not ( = ?auto_594455 ?auto_594457 ) ) ( not ( = ?auto_594455 ?auto_594458 ) ) ( not ( = ?auto_594455 ?auto_594459 ) ) ( not ( = ?auto_594455 ?auto_594460 ) ) ( not ( = ?auto_594455 ?auto_594461 ) ) ( not ( = ?auto_594455 ?auto_594462 ) ) ( not ( = ?auto_594455 ?auto_594463 ) ) ( not ( = ?auto_594455 ?auto_594464 ) ) ( not ( = ?auto_594455 ?auto_594465 ) ) ( not ( = ?auto_594455 ?auto_594466 ) ) ( not ( = ?auto_594456 ?auto_594457 ) ) ( not ( = ?auto_594456 ?auto_594458 ) ) ( not ( = ?auto_594456 ?auto_594459 ) ) ( not ( = ?auto_594456 ?auto_594460 ) ) ( not ( = ?auto_594456 ?auto_594461 ) ) ( not ( = ?auto_594456 ?auto_594462 ) ) ( not ( = ?auto_594456 ?auto_594463 ) ) ( not ( = ?auto_594456 ?auto_594464 ) ) ( not ( = ?auto_594456 ?auto_594465 ) ) ( not ( = ?auto_594456 ?auto_594466 ) ) ( not ( = ?auto_594457 ?auto_594458 ) ) ( not ( = ?auto_594457 ?auto_594459 ) ) ( not ( = ?auto_594457 ?auto_594460 ) ) ( not ( = ?auto_594457 ?auto_594461 ) ) ( not ( = ?auto_594457 ?auto_594462 ) ) ( not ( = ?auto_594457 ?auto_594463 ) ) ( not ( = ?auto_594457 ?auto_594464 ) ) ( not ( = ?auto_594457 ?auto_594465 ) ) ( not ( = ?auto_594457 ?auto_594466 ) ) ( not ( = ?auto_594458 ?auto_594459 ) ) ( not ( = ?auto_594458 ?auto_594460 ) ) ( not ( = ?auto_594458 ?auto_594461 ) ) ( not ( = ?auto_594458 ?auto_594462 ) ) ( not ( = ?auto_594458 ?auto_594463 ) ) ( not ( = ?auto_594458 ?auto_594464 ) ) ( not ( = ?auto_594458 ?auto_594465 ) ) ( not ( = ?auto_594458 ?auto_594466 ) ) ( not ( = ?auto_594459 ?auto_594460 ) ) ( not ( = ?auto_594459 ?auto_594461 ) ) ( not ( = ?auto_594459 ?auto_594462 ) ) ( not ( = ?auto_594459 ?auto_594463 ) ) ( not ( = ?auto_594459 ?auto_594464 ) ) ( not ( = ?auto_594459 ?auto_594465 ) ) ( not ( = ?auto_594459 ?auto_594466 ) ) ( not ( = ?auto_594460 ?auto_594461 ) ) ( not ( = ?auto_594460 ?auto_594462 ) ) ( not ( = ?auto_594460 ?auto_594463 ) ) ( not ( = ?auto_594460 ?auto_594464 ) ) ( not ( = ?auto_594460 ?auto_594465 ) ) ( not ( = ?auto_594460 ?auto_594466 ) ) ( not ( = ?auto_594461 ?auto_594462 ) ) ( not ( = ?auto_594461 ?auto_594463 ) ) ( not ( = ?auto_594461 ?auto_594464 ) ) ( not ( = ?auto_594461 ?auto_594465 ) ) ( not ( = ?auto_594461 ?auto_594466 ) ) ( not ( = ?auto_594462 ?auto_594463 ) ) ( not ( = ?auto_594462 ?auto_594464 ) ) ( not ( = ?auto_594462 ?auto_594465 ) ) ( not ( = ?auto_594462 ?auto_594466 ) ) ( not ( = ?auto_594463 ?auto_594464 ) ) ( not ( = ?auto_594463 ?auto_594465 ) ) ( not ( = ?auto_594463 ?auto_594466 ) ) ( not ( = ?auto_594464 ?auto_594465 ) ) ( not ( = ?auto_594464 ?auto_594466 ) ) ( not ( = ?auto_594465 ?auto_594466 ) ) ( ON ?auto_594464 ?auto_594465 ) ( ON ?auto_594463 ?auto_594464 ) ( ON ?auto_594462 ?auto_594463 ) ( ON ?auto_594461 ?auto_594462 ) ( ON ?auto_594460 ?auto_594461 ) ( ON ?auto_594459 ?auto_594460 ) ( ON ?auto_594458 ?auto_594459 ) ( ON ?auto_594457 ?auto_594458 ) ( ON ?auto_594456 ?auto_594457 ) ( CLEAR ?auto_594454 ) ( ON ?auto_594455 ?auto_594456 ) ( CLEAR ?auto_594455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_594452 ?auto_594453 ?auto_594454 ?auto_594455 )
      ( MAKE-14PILE ?auto_594452 ?auto_594453 ?auto_594454 ?auto_594455 ?auto_594456 ?auto_594457 ?auto_594458 ?auto_594459 ?auto_594460 ?auto_594461 ?auto_594462 ?auto_594463 ?auto_594464 ?auto_594465 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594510 - BLOCK
      ?auto_594511 - BLOCK
      ?auto_594512 - BLOCK
      ?auto_594513 - BLOCK
      ?auto_594514 - BLOCK
      ?auto_594515 - BLOCK
      ?auto_594516 - BLOCK
      ?auto_594517 - BLOCK
      ?auto_594518 - BLOCK
      ?auto_594519 - BLOCK
      ?auto_594520 - BLOCK
      ?auto_594521 - BLOCK
      ?auto_594522 - BLOCK
      ?auto_594523 - BLOCK
    )
    :vars
    (
      ?auto_594524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594523 ?auto_594524 ) ( ON-TABLE ?auto_594510 ) ( ON ?auto_594511 ?auto_594510 ) ( not ( = ?auto_594510 ?auto_594511 ) ) ( not ( = ?auto_594510 ?auto_594512 ) ) ( not ( = ?auto_594510 ?auto_594513 ) ) ( not ( = ?auto_594510 ?auto_594514 ) ) ( not ( = ?auto_594510 ?auto_594515 ) ) ( not ( = ?auto_594510 ?auto_594516 ) ) ( not ( = ?auto_594510 ?auto_594517 ) ) ( not ( = ?auto_594510 ?auto_594518 ) ) ( not ( = ?auto_594510 ?auto_594519 ) ) ( not ( = ?auto_594510 ?auto_594520 ) ) ( not ( = ?auto_594510 ?auto_594521 ) ) ( not ( = ?auto_594510 ?auto_594522 ) ) ( not ( = ?auto_594510 ?auto_594523 ) ) ( not ( = ?auto_594510 ?auto_594524 ) ) ( not ( = ?auto_594511 ?auto_594512 ) ) ( not ( = ?auto_594511 ?auto_594513 ) ) ( not ( = ?auto_594511 ?auto_594514 ) ) ( not ( = ?auto_594511 ?auto_594515 ) ) ( not ( = ?auto_594511 ?auto_594516 ) ) ( not ( = ?auto_594511 ?auto_594517 ) ) ( not ( = ?auto_594511 ?auto_594518 ) ) ( not ( = ?auto_594511 ?auto_594519 ) ) ( not ( = ?auto_594511 ?auto_594520 ) ) ( not ( = ?auto_594511 ?auto_594521 ) ) ( not ( = ?auto_594511 ?auto_594522 ) ) ( not ( = ?auto_594511 ?auto_594523 ) ) ( not ( = ?auto_594511 ?auto_594524 ) ) ( not ( = ?auto_594512 ?auto_594513 ) ) ( not ( = ?auto_594512 ?auto_594514 ) ) ( not ( = ?auto_594512 ?auto_594515 ) ) ( not ( = ?auto_594512 ?auto_594516 ) ) ( not ( = ?auto_594512 ?auto_594517 ) ) ( not ( = ?auto_594512 ?auto_594518 ) ) ( not ( = ?auto_594512 ?auto_594519 ) ) ( not ( = ?auto_594512 ?auto_594520 ) ) ( not ( = ?auto_594512 ?auto_594521 ) ) ( not ( = ?auto_594512 ?auto_594522 ) ) ( not ( = ?auto_594512 ?auto_594523 ) ) ( not ( = ?auto_594512 ?auto_594524 ) ) ( not ( = ?auto_594513 ?auto_594514 ) ) ( not ( = ?auto_594513 ?auto_594515 ) ) ( not ( = ?auto_594513 ?auto_594516 ) ) ( not ( = ?auto_594513 ?auto_594517 ) ) ( not ( = ?auto_594513 ?auto_594518 ) ) ( not ( = ?auto_594513 ?auto_594519 ) ) ( not ( = ?auto_594513 ?auto_594520 ) ) ( not ( = ?auto_594513 ?auto_594521 ) ) ( not ( = ?auto_594513 ?auto_594522 ) ) ( not ( = ?auto_594513 ?auto_594523 ) ) ( not ( = ?auto_594513 ?auto_594524 ) ) ( not ( = ?auto_594514 ?auto_594515 ) ) ( not ( = ?auto_594514 ?auto_594516 ) ) ( not ( = ?auto_594514 ?auto_594517 ) ) ( not ( = ?auto_594514 ?auto_594518 ) ) ( not ( = ?auto_594514 ?auto_594519 ) ) ( not ( = ?auto_594514 ?auto_594520 ) ) ( not ( = ?auto_594514 ?auto_594521 ) ) ( not ( = ?auto_594514 ?auto_594522 ) ) ( not ( = ?auto_594514 ?auto_594523 ) ) ( not ( = ?auto_594514 ?auto_594524 ) ) ( not ( = ?auto_594515 ?auto_594516 ) ) ( not ( = ?auto_594515 ?auto_594517 ) ) ( not ( = ?auto_594515 ?auto_594518 ) ) ( not ( = ?auto_594515 ?auto_594519 ) ) ( not ( = ?auto_594515 ?auto_594520 ) ) ( not ( = ?auto_594515 ?auto_594521 ) ) ( not ( = ?auto_594515 ?auto_594522 ) ) ( not ( = ?auto_594515 ?auto_594523 ) ) ( not ( = ?auto_594515 ?auto_594524 ) ) ( not ( = ?auto_594516 ?auto_594517 ) ) ( not ( = ?auto_594516 ?auto_594518 ) ) ( not ( = ?auto_594516 ?auto_594519 ) ) ( not ( = ?auto_594516 ?auto_594520 ) ) ( not ( = ?auto_594516 ?auto_594521 ) ) ( not ( = ?auto_594516 ?auto_594522 ) ) ( not ( = ?auto_594516 ?auto_594523 ) ) ( not ( = ?auto_594516 ?auto_594524 ) ) ( not ( = ?auto_594517 ?auto_594518 ) ) ( not ( = ?auto_594517 ?auto_594519 ) ) ( not ( = ?auto_594517 ?auto_594520 ) ) ( not ( = ?auto_594517 ?auto_594521 ) ) ( not ( = ?auto_594517 ?auto_594522 ) ) ( not ( = ?auto_594517 ?auto_594523 ) ) ( not ( = ?auto_594517 ?auto_594524 ) ) ( not ( = ?auto_594518 ?auto_594519 ) ) ( not ( = ?auto_594518 ?auto_594520 ) ) ( not ( = ?auto_594518 ?auto_594521 ) ) ( not ( = ?auto_594518 ?auto_594522 ) ) ( not ( = ?auto_594518 ?auto_594523 ) ) ( not ( = ?auto_594518 ?auto_594524 ) ) ( not ( = ?auto_594519 ?auto_594520 ) ) ( not ( = ?auto_594519 ?auto_594521 ) ) ( not ( = ?auto_594519 ?auto_594522 ) ) ( not ( = ?auto_594519 ?auto_594523 ) ) ( not ( = ?auto_594519 ?auto_594524 ) ) ( not ( = ?auto_594520 ?auto_594521 ) ) ( not ( = ?auto_594520 ?auto_594522 ) ) ( not ( = ?auto_594520 ?auto_594523 ) ) ( not ( = ?auto_594520 ?auto_594524 ) ) ( not ( = ?auto_594521 ?auto_594522 ) ) ( not ( = ?auto_594521 ?auto_594523 ) ) ( not ( = ?auto_594521 ?auto_594524 ) ) ( not ( = ?auto_594522 ?auto_594523 ) ) ( not ( = ?auto_594522 ?auto_594524 ) ) ( not ( = ?auto_594523 ?auto_594524 ) ) ( ON ?auto_594522 ?auto_594523 ) ( ON ?auto_594521 ?auto_594522 ) ( ON ?auto_594520 ?auto_594521 ) ( ON ?auto_594519 ?auto_594520 ) ( ON ?auto_594518 ?auto_594519 ) ( ON ?auto_594517 ?auto_594518 ) ( ON ?auto_594516 ?auto_594517 ) ( ON ?auto_594515 ?auto_594516 ) ( ON ?auto_594514 ?auto_594515 ) ( ON ?auto_594513 ?auto_594514 ) ( CLEAR ?auto_594511 ) ( ON ?auto_594512 ?auto_594513 ) ( CLEAR ?auto_594512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_594510 ?auto_594511 ?auto_594512 )
      ( MAKE-14PILE ?auto_594510 ?auto_594511 ?auto_594512 ?auto_594513 ?auto_594514 ?auto_594515 ?auto_594516 ?auto_594517 ?auto_594518 ?auto_594519 ?auto_594520 ?auto_594521 ?auto_594522 ?auto_594523 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594568 - BLOCK
      ?auto_594569 - BLOCK
      ?auto_594570 - BLOCK
      ?auto_594571 - BLOCK
      ?auto_594572 - BLOCK
      ?auto_594573 - BLOCK
      ?auto_594574 - BLOCK
      ?auto_594575 - BLOCK
      ?auto_594576 - BLOCK
      ?auto_594577 - BLOCK
      ?auto_594578 - BLOCK
      ?auto_594579 - BLOCK
      ?auto_594580 - BLOCK
      ?auto_594581 - BLOCK
    )
    :vars
    (
      ?auto_594582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594581 ?auto_594582 ) ( ON-TABLE ?auto_594568 ) ( not ( = ?auto_594568 ?auto_594569 ) ) ( not ( = ?auto_594568 ?auto_594570 ) ) ( not ( = ?auto_594568 ?auto_594571 ) ) ( not ( = ?auto_594568 ?auto_594572 ) ) ( not ( = ?auto_594568 ?auto_594573 ) ) ( not ( = ?auto_594568 ?auto_594574 ) ) ( not ( = ?auto_594568 ?auto_594575 ) ) ( not ( = ?auto_594568 ?auto_594576 ) ) ( not ( = ?auto_594568 ?auto_594577 ) ) ( not ( = ?auto_594568 ?auto_594578 ) ) ( not ( = ?auto_594568 ?auto_594579 ) ) ( not ( = ?auto_594568 ?auto_594580 ) ) ( not ( = ?auto_594568 ?auto_594581 ) ) ( not ( = ?auto_594568 ?auto_594582 ) ) ( not ( = ?auto_594569 ?auto_594570 ) ) ( not ( = ?auto_594569 ?auto_594571 ) ) ( not ( = ?auto_594569 ?auto_594572 ) ) ( not ( = ?auto_594569 ?auto_594573 ) ) ( not ( = ?auto_594569 ?auto_594574 ) ) ( not ( = ?auto_594569 ?auto_594575 ) ) ( not ( = ?auto_594569 ?auto_594576 ) ) ( not ( = ?auto_594569 ?auto_594577 ) ) ( not ( = ?auto_594569 ?auto_594578 ) ) ( not ( = ?auto_594569 ?auto_594579 ) ) ( not ( = ?auto_594569 ?auto_594580 ) ) ( not ( = ?auto_594569 ?auto_594581 ) ) ( not ( = ?auto_594569 ?auto_594582 ) ) ( not ( = ?auto_594570 ?auto_594571 ) ) ( not ( = ?auto_594570 ?auto_594572 ) ) ( not ( = ?auto_594570 ?auto_594573 ) ) ( not ( = ?auto_594570 ?auto_594574 ) ) ( not ( = ?auto_594570 ?auto_594575 ) ) ( not ( = ?auto_594570 ?auto_594576 ) ) ( not ( = ?auto_594570 ?auto_594577 ) ) ( not ( = ?auto_594570 ?auto_594578 ) ) ( not ( = ?auto_594570 ?auto_594579 ) ) ( not ( = ?auto_594570 ?auto_594580 ) ) ( not ( = ?auto_594570 ?auto_594581 ) ) ( not ( = ?auto_594570 ?auto_594582 ) ) ( not ( = ?auto_594571 ?auto_594572 ) ) ( not ( = ?auto_594571 ?auto_594573 ) ) ( not ( = ?auto_594571 ?auto_594574 ) ) ( not ( = ?auto_594571 ?auto_594575 ) ) ( not ( = ?auto_594571 ?auto_594576 ) ) ( not ( = ?auto_594571 ?auto_594577 ) ) ( not ( = ?auto_594571 ?auto_594578 ) ) ( not ( = ?auto_594571 ?auto_594579 ) ) ( not ( = ?auto_594571 ?auto_594580 ) ) ( not ( = ?auto_594571 ?auto_594581 ) ) ( not ( = ?auto_594571 ?auto_594582 ) ) ( not ( = ?auto_594572 ?auto_594573 ) ) ( not ( = ?auto_594572 ?auto_594574 ) ) ( not ( = ?auto_594572 ?auto_594575 ) ) ( not ( = ?auto_594572 ?auto_594576 ) ) ( not ( = ?auto_594572 ?auto_594577 ) ) ( not ( = ?auto_594572 ?auto_594578 ) ) ( not ( = ?auto_594572 ?auto_594579 ) ) ( not ( = ?auto_594572 ?auto_594580 ) ) ( not ( = ?auto_594572 ?auto_594581 ) ) ( not ( = ?auto_594572 ?auto_594582 ) ) ( not ( = ?auto_594573 ?auto_594574 ) ) ( not ( = ?auto_594573 ?auto_594575 ) ) ( not ( = ?auto_594573 ?auto_594576 ) ) ( not ( = ?auto_594573 ?auto_594577 ) ) ( not ( = ?auto_594573 ?auto_594578 ) ) ( not ( = ?auto_594573 ?auto_594579 ) ) ( not ( = ?auto_594573 ?auto_594580 ) ) ( not ( = ?auto_594573 ?auto_594581 ) ) ( not ( = ?auto_594573 ?auto_594582 ) ) ( not ( = ?auto_594574 ?auto_594575 ) ) ( not ( = ?auto_594574 ?auto_594576 ) ) ( not ( = ?auto_594574 ?auto_594577 ) ) ( not ( = ?auto_594574 ?auto_594578 ) ) ( not ( = ?auto_594574 ?auto_594579 ) ) ( not ( = ?auto_594574 ?auto_594580 ) ) ( not ( = ?auto_594574 ?auto_594581 ) ) ( not ( = ?auto_594574 ?auto_594582 ) ) ( not ( = ?auto_594575 ?auto_594576 ) ) ( not ( = ?auto_594575 ?auto_594577 ) ) ( not ( = ?auto_594575 ?auto_594578 ) ) ( not ( = ?auto_594575 ?auto_594579 ) ) ( not ( = ?auto_594575 ?auto_594580 ) ) ( not ( = ?auto_594575 ?auto_594581 ) ) ( not ( = ?auto_594575 ?auto_594582 ) ) ( not ( = ?auto_594576 ?auto_594577 ) ) ( not ( = ?auto_594576 ?auto_594578 ) ) ( not ( = ?auto_594576 ?auto_594579 ) ) ( not ( = ?auto_594576 ?auto_594580 ) ) ( not ( = ?auto_594576 ?auto_594581 ) ) ( not ( = ?auto_594576 ?auto_594582 ) ) ( not ( = ?auto_594577 ?auto_594578 ) ) ( not ( = ?auto_594577 ?auto_594579 ) ) ( not ( = ?auto_594577 ?auto_594580 ) ) ( not ( = ?auto_594577 ?auto_594581 ) ) ( not ( = ?auto_594577 ?auto_594582 ) ) ( not ( = ?auto_594578 ?auto_594579 ) ) ( not ( = ?auto_594578 ?auto_594580 ) ) ( not ( = ?auto_594578 ?auto_594581 ) ) ( not ( = ?auto_594578 ?auto_594582 ) ) ( not ( = ?auto_594579 ?auto_594580 ) ) ( not ( = ?auto_594579 ?auto_594581 ) ) ( not ( = ?auto_594579 ?auto_594582 ) ) ( not ( = ?auto_594580 ?auto_594581 ) ) ( not ( = ?auto_594580 ?auto_594582 ) ) ( not ( = ?auto_594581 ?auto_594582 ) ) ( ON ?auto_594580 ?auto_594581 ) ( ON ?auto_594579 ?auto_594580 ) ( ON ?auto_594578 ?auto_594579 ) ( ON ?auto_594577 ?auto_594578 ) ( ON ?auto_594576 ?auto_594577 ) ( ON ?auto_594575 ?auto_594576 ) ( ON ?auto_594574 ?auto_594575 ) ( ON ?auto_594573 ?auto_594574 ) ( ON ?auto_594572 ?auto_594573 ) ( ON ?auto_594571 ?auto_594572 ) ( ON ?auto_594570 ?auto_594571 ) ( CLEAR ?auto_594568 ) ( ON ?auto_594569 ?auto_594570 ) ( CLEAR ?auto_594569 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_594568 ?auto_594569 )
      ( MAKE-14PILE ?auto_594568 ?auto_594569 ?auto_594570 ?auto_594571 ?auto_594572 ?auto_594573 ?auto_594574 ?auto_594575 ?auto_594576 ?auto_594577 ?auto_594578 ?auto_594579 ?auto_594580 ?auto_594581 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_594626 - BLOCK
      ?auto_594627 - BLOCK
      ?auto_594628 - BLOCK
      ?auto_594629 - BLOCK
      ?auto_594630 - BLOCK
      ?auto_594631 - BLOCK
      ?auto_594632 - BLOCK
      ?auto_594633 - BLOCK
      ?auto_594634 - BLOCK
      ?auto_594635 - BLOCK
      ?auto_594636 - BLOCK
      ?auto_594637 - BLOCK
      ?auto_594638 - BLOCK
      ?auto_594639 - BLOCK
    )
    :vars
    (
      ?auto_594640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594639 ?auto_594640 ) ( not ( = ?auto_594626 ?auto_594627 ) ) ( not ( = ?auto_594626 ?auto_594628 ) ) ( not ( = ?auto_594626 ?auto_594629 ) ) ( not ( = ?auto_594626 ?auto_594630 ) ) ( not ( = ?auto_594626 ?auto_594631 ) ) ( not ( = ?auto_594626 ?auto_594632 ) ) ( not ( = ?auto_594626 ?auto_594633 ) ) ( not ( = ?auto_594626 ?auto_594634 ) ) ( not ( = ?auto_594626 ?auto_594635 ) ) ( not ( = ?auto_594626 ?auto_594636 ) ) ( not ( = ?auto_594626 ?auto_594637 ) ) ( not ( = ?auto_594626 ?auto_594638 ) ) ( not ( = ?auto_594626 ?auto_594639 ) ) ( not ( = ?auto_594626 ?auto_594640 ) ) ( not ( = ?auto_594627 ?auto_594628 ) ) ( not ( = ?auto_594627 ?auto_594629 ) ) ( not ( = ?auto_594627 ?auto_594630 ) ) ( not ( = ?auto_594627 ?auto_594631 ) ) ( not ( = ?auto_594627 ?auto_594632 ) ) ( not ( = ?auto_594627 ?auto_594633 ) ) ( not ( = ?auto_594627 ?auto_594634 ) ) ( not ( = ?auto_594627 ?auto_594635 ) ) ( not ( = ?auto_594627 ?auto_594636 ) ) ( not ( = ?auto_594627 ?auto_594637 ) ) ( not ( = ?auto_594627 ?auto_594638 ) ) ( not ( = ?auto_594627 ?auto_594639 ) ) ( not ( = ?auto_594627 ?auto_594640 ) ) ( not ( = ?auto_594628 ?auto_594629 ) ) ( not ( = ?auto_594628 ?auto_594630 ) ) ( not ( = ?auto_594628 ?auto_594631 ) ) ( not ( = ?auto_594628 ?auto_594632 ) ) ( not ( = ?auto_594628 ?auto_594633 ) ) ( not ( = ?auto_594628 ?auto_594634 ) ) ( not ( = ?auto_594628 ?auto_594635 ) ) ( not ( = ?auto_594628 ?auto_594636 ) ) ( not ( = ?auto_594628 ?auto_594637 ) ) ( not ( = ?auto_594628 ?auto_594638 ) ) ( not ( = ?auto_594628 ?auto_594639 ) ) ( not ( = ?auto_594628 ?auto_594640 ) ) ( not ( = ?auto_594629 ?auto_594630 ) ) ( not ( = ?auto_594629 ?auto_594631 ) ) ( not ( = ?auto_594629 ?auto_594632 ) ) ( not ( = ?auto_594629 ?auto_594633 ) ) ( not ( = ?auto_594629 ?auto_594634 ) ) ( not ( = ?auto_594629 ?auto_594635 ) ) ( not ( = ?auto_594629 ?auto_594636 ) ) ( not ( = ?auto_594629 ?auto_594637 ) ) ( not ( = ?auto_594629 ?auto_594638 ) ) ( not ( = ?auto_594629 ?auto_594639 ) ) ( not ( = ?auto_594629 ?auto_594640 ) ) ( not ( = ?auto_594630 ?auto_594631 ) ) ( not ( = ?auto_594630 ?auto_594632 ) ) ( not ( = ?auto_594630 ?auto_594633 ) ) ( not ( = ?auto_594630 ?auto_594634 ) ) ( not ( = ?auto_594630 ?auto_594635 ) ) ( not ( = ?auto_594630 ?auto_594636 ) ) ( not ( = ?auto_594630 ?auto_594637 ) ) ( not ( = ?auto_594630 ?auto_594638 ) ) ( not ( = ?auto_594630 ?auto_594639 ) ) ( not ( = ?auto_594630 ?auto_594640 ) ) ( not ( = ?auto_594631 ?auto_594632 ) ) ( not ( = ?auto_594631 ?auto_594633 ) ) ( not ( = ?auto_594631 ?auto_594634 ) ) ( not ( = ?auto_594631 ?auto_594635 ) ) ( not ( = ?auto_594631 ?auto_594636 ) ) ( not ( = ?auto_594631 ?auto_594637 ) ) ( not ( = ?auto_594631 ?auto_594638 ) ) ( not ( = ?auto_594631 ?auto_594639 ) ) ( not ( = ?auto_594631 ?auto_594640 ) ) ( not ( = ?auto_594632 ?auto_594633 ) ) ( not ( = ?auto_594632 ?auto_594634 ) ) ( not ( = ?auto_594632 ?auto_594635 ) ) ( not ( = ?auto_594632 ?auto_594636 ) ) ( not ( = ?auto_594632 ?auto_594637 ) ) ( not ( = ?auto_594632 ?auto_594638 ) ) ( not ( = ?auto_594632 ?auto_594639 ) ) ( not ( = ?auto_594632 ?auto_594640 ) ) ( not ( = ?auto_594633 ?auto_594634 ) ) ( not ( = ?auto_594633 ?auto_594635 ) ) ( not ( = ?auto_594633 ?auto_594636 ) ) ( not ( = ?auto_594633 ?auto_594637 ) ) ( not ( = ?auto_594633 ?auto_594638 ) ) ( not ( = ?auto_594633 ?auto_594639 ) ) ( not ( = ?auto_594633 ?auto_594640 ) ) ( not ( = ?auto_594634 ?auto_594635 ) ) ( not ( = ?auto_594634 ?auto_594636 ) ) ( not ( = ?auto_594634 ?auto_594637 ) ) ( not ( = ?auto_594634 ?auto_594638 ) ) ( not ( = ?auto_594634 ?auto_594639 ) ) ( not ( = ?auto_594634 ?auto_594640 ) ) ( not ( = ?auto_594635 ?auto_594636 ) ) ( not ( = ?auto_594635 ?auto_594637 ) ) ( not ( = ?auto_594635 ?auto_594638 ) ) ( not ( = ?auto_594635 ?auto_594639 ) ) ( not ( = ?auto_594635 ?auto_594640 ) ) ( not ( = ?auto_594636 ?auto_594637 ) ) ( not ( = ?auto_594636 ?auto_594638 ) ) ( not ( = ?auto_594636 ?auto_594639 ) ) ( not ( = ?auto_594636 ?auto_594640 ) ) ( not ( = ?auto_594637 ?auto_594638 ) ) ( not ( = ?auto_594637 ?auto_594639 ) ) ( not ( = ?auto_594637 ?auto_594640 ) ) ( not ( = ?auto_594638 ?auto_594639 ) ) ( not ( = ?auto_594638 ?auto_594640 ) ) ( not ( = ?auto_594639 ?auto_594640 ) ) ( ON ?auto_594638 ?auto_594639 ) ( ON ?auto_594637 ?auto_594638 ) ( ON ?auto_594636 ?auto_594637 ) ( ON ?auto_594635 ?auto_594636 ) ( ON ?auto_594634 ?auto_594635 ) ( ON ?auto_594633 ?auto_594634 ) ( ON ?auto_594632 ?auto_594633 ) ( ON ?auto_594631 ?auto_594632 ) ( ON ?auto_594630 ?auto_594631 ) ( ON ?auto_594629 ?auto_594630 ) ( ON ?auto_594628 ?auto_594629 ) ( ON ?auto_594627 ?auto_594628 ) ( ON ?auto_594626 ?auto_594627 ) ( CLEAR ?auto_594626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_594626 )
      ( MAKE-14PILE ?auto_594626 ?auto_594627 ?auto_594628 ?auto_594629 ?auto_594630 ?auto_594631 ?auto_594632 ?auto_594633 ?auto_594634 ?auto_594635 ?auto_594636 ?auto_594637 ?auto_594638 ?auto_594639 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594685 - BLOCK
      ?auto_594686 - BLOCK
      ?auto_594687 - BLOCK
      ?auto_594688 - BLOCK
      ?auto_594689 - BLOCK
      ?auto_594690 - BLOCK
      ?auto_594691 - BLOCK
      ?auto_594692 - BLOCK
      ?auto_594693 - BLOCK
      ?auto_594694 - BLOCK
      ?auto_594695 - BLOCK
      ?auto_594696 - BLOCK
      ?auto_594697 - BLOCK
      ?auto_594698 - BLOCK
      ?auto_594699 - BLOCK
    )
    :vars
    (
      ?auto_594700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_594698 ) ( ON ?auto_594699 ?auto_594700 ) ( CLEAR ?auto_594699 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_594685 ) ( ON ?auto_594686 ?auto_594685 ) ( ON ?auto_594687 ?auto_594686 ) ( ON ?auto_594688 ?auto_594687 ) ( ON ?auto_594689 ?auto_594688 ) ( ON ?auto_594690 ?auto_594689 ) ( ON ?auto_594691 ?auto_594690 ) ( ON ?auto_594692 ?auto_594691 ) ( ON ?auto_594693 ?auto_594692 ) ( ON ?auto_594694 ?auto_594693 ) ( ON ?auto_594695 ?auto_594694 ) ( ON ?auto_594696 ?auto_594695 ) ( ON ?auto_594697 ?auto_594696 ) ( ON ?auto_594698 ?auto_594697 ) ( not ( = ?auto_594685 ?auto_594686 ) ) ( not ( = ?auto_594685 ?auto_594687 ) ) ( not ( = ?auto_594685 ?auto_594688 ) ) ( not ( = ?auto_594685 ?auto_594689 ) ) ( not ( = ?auto_594685 ?auto_594690 ) ) ( not ( = ?auto_594685 ?auto_594691 ) ) ( not ( = ?auto_594685 ?auto_594692 ) ) ( not ( = ?auto_594685 ?auto_594693 ) ) ( not ( = ?auto_594685 ?auto_594694 ) ) ( not ( = ?auto_594685 ?auto_594695 ) ) ( not ( = ?auto_594685 ?auto_594696 ) ) ( not ( = ?auto_594685 ?auto_594697 ) ) ( not ( = ?auto_594685 ?auto_594698 ) ) ( not ( = ?auto_594685 ?auto_594699 ) ) ( not ( = ?auto_594685 ?auto_594700 ) ) ( not ( = ?auto_594686 ?auto_594687 ) ) ( not ( = ?auto_594686 ?auto_594688 ) ) ( not ( = ?auto_594686 ?auto_594689 ) ) ( not ( = ?auto_594686 ?auto_594690 ) ) ( not ( = ?auto_594686 ?auto_594691 ) ) ( not ( = ?auto_594686 ?auto_594692 ) ) ( not ( = ?auto_594686 ?auto_594693 ) ) ( not ( = ?auto_594686 ?auto_594694 ) ) ( not ( = ?auto_594686 ?auto_594695 ) ) ( not ( = ?auto_594686 ?auto_594696 ) ) ( not ( = ?auto_594686 ?auto_594697 ) ) ( not ( = ?auto_594686 ?auto_594698 ) ) ( not ( = ?auto_594686 ?auto_594699 ) ) ( not ( = ?auto_594686 ?auto_594700 ) ) ( not ( = ?auto_594687 ?auto_594688 ) ) ( not ( = ?auto_594687 ?auto_594689 ) ) ( not ( = ?auto_594687 ?auto_594690 ) ) ( not ( = ?auto_594687 ?auto_594691 ) ) ( not ( = ?auto_594687 ?auto_594692 ) ) ( not ( = ?auto_594687 ?auto_594693 ) ) ( not ( = ?auto_594687 ?auto_594694 ) ) ( not ( = ?auto_594687 ?auto_594695 ) ) ( not ( = ?auto_594687 ?auto_594696 ) ) ( not ( = ?auto_594687 ?auto_594697 ) ) ( not ( = ?auto_594687 ?auto_594698 ) ) ( not ( = ?auto_594687 ?auto_594699 ) ) ( not ( = ?auto_594687 ?auto_594700 ) ) ( not ( = ?auto_594688 ?auto_594689 ) ) ( not ( = ?auto_594688 ?auto_594690 ) ) ( not ( = ?auto_594688 ?auto_594691 ) ) ( not ( = ?auto_594688 ?auto_594692 ) ) ( not ( = ?auto_594688 ?auto_594693 ) ) ( not ( = ?auto_594688 ?auto_594694 ) ) ( not ( = ?auto_594688 ?auto_594695 ) ) ( not ( = ?auto_594688 ?auto_594696 ) ) ( not ( = ?auto_594688 ?auto_594697 ) ) ( not ( = ?auto_594688 ?auto_594698 ) ) ( not ( = ?auto_594688 ?auto_594699 ) ) ( not ( = ?auto_594688 ?auto_594700 ) ) ( not ( = ?auto_594689 ?auto_594690 ) ) ( not ( = ?auto_594689 ?auto_594691 ) ) ( not ( = ?auto_594689 ?auto_594692 ) ) ( not ( = ?auto_594689 ?auto_594693 ) ) ( not ( = ?auto_594689 ?auto_594694 ) ) ( not ( = ?auto_594689 ?auto_594695 ) ) ( not ( = ?auto_594689 ?auto_594696 ) ) ( not ( = ?auto_594689 ?auto_594697 ) ) ( not ( = ?auto_594689 ?auto_594698 ) ) ( not ( = ?auto_594689 ?auto_594699 ) ) ( not ( = ?auto_594689 ?auto_594700 ) ) ( not ( = ?auto_594690 ?auto_594691 ) ) ( not ( = ?auto_594690 ?auto_594692 ) ) ( not ( = ?auto_594690 ?auto_594693 ) ) ( not ( = ?auto_594690 ?auto_594694 ) ) ( not ( = ?auto_594690 ?auto_594695 ) ) ( not ( = ?auto_594690 ?auto_594696 ) ) ( not ( = ?auto_594690 ?auto_594697 ) ) ( not ( = ?auto_594690 ?auto_594698 ) ) ( not ( = ?auto_594690 ?auto_594699 ) ) ( not ( = ?auto_594690 ?auto_594700 ) ) ( not ( = ?auto_594691 ?auto_594692 ) ) ( not ( = ?auto_594691 ?auto_594693 ) ) ( not ( = ?auto_594691 ?auto_594694 ) ) ( not ( = ?auto_594691 ?auto_594695 ) ) ( not ( = ?auto_594691 ?auto_594696 ) ) ( not ( = ?auto_594691 ?auto_594697 ) ) ( not ( = ?auto_594691 ?auto_594698 ) ) ( not ( = ?auto_594691 ?auto_594699 ) ) ( not ( = ?auto_594691 ?auto_594700 ) ) ( not ( = ?auto_594692 ?auto_594693 ) ) ( not ( = ?auto_594692 ?auto_594694 ) ) ( not ( = ?auto_594692 ?auto_594695 ) ) ( not ( = ?auto_594692 ?auto_594696 ) ) ( not ( = ?auto_594692 ?auto_594697 ) ) ( not ( = ?auto_594692 ?auto_594698 ) ) ( not ( = ?auto_594692 ?auto_594699 ) ) ( not ( = ?auto_594692 ?auto_594700 ) ) ( not ( = ?auto_594693 ?auto_594694 ) ) ( not ( = ?auto_594693 ?auto_594695 ) ) ( not ( = ?auto_594693 ?auto_594696 ) ) ( not ( = ?auto_594693 ?auto_594697 ) ) ( not ( = ?auto_594693 ?auto_594698 ) ) ( not ( = ?auto_594693 ?auto_594699 ) ) ( not ( = ?auto_594693 ?auto_594700 ) ) ( not ( = ?auto_594694 ?auto_594695 ) ) ( not ( = ?auto_594694 ?auto_594696 ) ) ( not ( = ?auto_594694 ?auto_594697 ) ) ( not ( = ?auto_594694 ?auto_594698 ) ) ( not ( = ?auto_594694 ?auto_594699 ) ) ( not ( = ?auto_594694 ?auto_594700 ) ) ( not ( = ?auto_594695 ?auto_594696 ) ) ( not ( = ?auto_594695 ?auto_594697 ) ) ( not ( = ?auto_594695 ?auto_594698 ) ) ( not ( = ?auto_594695 ?auto_594699 ) ) ( not ( = ?auto_594695 ?auto_594700 ) ) ( not ( = ?auto_594696 ?auto_594697 ) ) ( not ( = ?auto_594696 ?auto_594698 ) ) ( not ( = ?auto_594696 ?auto_594699 ) ) ( not ( = ?auto_594696 ?auto_594700 ) ) ( not ( = ?auto_594697 ?auto_594698 ) ) ( not ( = ?auto_594697 ?auto_594699 ) ) ( not ( = ?auto_594697 ?auto_594700 ) ) ( not ( = ?auto_594698 ?auto_594699 ) ) ( not ( = ?auto_594698 ?auto_594700 ) ) ( not ( = ?auto_594699 ?auto_594700 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_594699 ?auto_594700 )
      ( !STACK ?auto_594699 ?auto_594698 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594747 - BLOCK
      ?auto_594748 - BLOCK
      ?auto_594749 - BLOCK
      ?auto_594750 - BLOCK
      ?auto_594751 - BLOCK
      ?auto_594752 - BLOCK
      ?auto_594753 - BLOCK
      ?auto_594754 - BLOCK
      ?auto_594755 - BLOCK
      ?auto_594756 - BLOCK
      ?auto_594757 - BLOCK
      ?auto_594758 - BLOCK
      ?auto_594759 - BLOCK
      ?auto_594760 - BLOCK
      ?auto_594761 - BLOCK
    )
    :vars
    (
      ?auto_594762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594761 ?auto_594762 ) ( ON-TABLE ?auto_594747 ) ( ON ?auto_594748 ?auto_594747 ) ( ON ?auto_594749 ?auto_594748 ) ( ON ?auto_594750 ?auto_594749 ) ( ON ?auto_594751 ?auto_594750 ) ( ON ?auto_594752 ?auto_594751 ) ( ON ?auto_594753 ?auto_594752 ) ( ON ?auto_594754 ?auto_594753 ) ( ON ?auto_594755 ?auto_594754 ) ( ON ?auto_594756 ?auto_594755 ) ( ON ?auto_594757 ?auto_594756 ) ( ON ?auto_594758 ?auto_594757 ) ( ON ?auto_594759 ?auto_594758 ) ( not ( = ?auto_594747 ?auto_594748 ) ) ( not ( = ?auto_594747 ?auto_594749 ) ) ( not ( = ?auto_594747 ?auto_594750 ) ) ( not ( = ?auto_594747 ?auto_594751 ) ) ( not ( = ?auto_594747 ?auto_594752 ) ) ( not ( = ?auto_594747 ?auto_594753 ) ) ( not ( = ?auto_594747 ?auto_594754 ) ) ( not ( = ?auto_594747 ?auto_594755 ) ) ( not ( = ?auto_594747 ?auto_594756 ) ) ( not ( = ?auto_594747 ?auto_594757 ) ) ( not ( = ?auto_594747 ?auto_594758 ) ) ( not ( = ?auto_594747 ?auto_594759 ) ) ( not ( = ?auto_594747 ?auto_594760 ) ) ( not ( = ?auto_594747 ?auto_594761 ) ) ( not ( = ?auto_594747 ?auto_594762 ) ) ( not ( = ?auto_594748 ?auto_594749 ) ) ( not ( = ?auto_594748 ?auto_594750 ) ) ( not ( = ?auto_594748 ?auto_594751 ) ) ( not ( = ?auto_594748 ?auto_594752 ) ) ( not ( = ?auto_594748 ?auto_594753 ) ) ( not ( = ?auto_594748 ?auto_594754 ) ) ( not ( = ?auto_594748 ?auto_594755 ) ) ( not ( = ?auto_594748 ?auto_594756 ) ) ( not ( = ?auto_594748 ?auto_594757 ) ) ( not ( = ?auto_594748 ?auto_594758 ) ) ( not ( = ?auto_594748 ?auto_594759 ) ) ( not ( = ?auto_594748 ?auto_594760 ) ) ( not ( = ?auto_594748 ?auto_594761 ) ) ( not ( = ?auto_594748 ?auto_594762 ) ) ( not ( = ?auto_594749 ?auto_594750 ) ) ( not ( = ?auto_594749 ?auto_594751 ) ) ( not ( = ?auto_594749 ?auto_594752 ) ) ( not ( = ?auto_594749 ?auto_594753 ) ) ( not ( = ?auto_594749 ?auto_594754 ) ) ( not ( = ?auto_594749 ?auto_594755 ) ) ( not ( = ?auto_594749 ?auto_594756 ) ) ( not ( = ?auto_594749 ?auto_594757 ) ) ( not ( = ?auto_594749 ?auto_594758 ) ) ( not ( = ?auto_594749 ?auto_594759 ) ) ( not ( = ?auto_594749 ?auto_594760 ) ) ( not ( = ?auto_594749 ?auto_594761 ) ) ( not ( = ?auto_594749 ?auto_594762 ) ) ( not ( = ?auto_594750 ?auto_594751 ) ) ( not ( = ?auto_594750 ?auto_594752 ) ) ( not ( = ?auto_594750 ?auto_594753 ) ) ( not ( = ?auto_594750 ?auto_594754 ) ) ( not ( = ?auto_594750 ?auto_594755 ) ) ( not ( = ?auto_594750 ?auto_594756 ) ) ( not ( = ?auto_594750 ?auto_594757 ) ) ( not ( = ?auto_594750 ?auto_594758 ) ) ( not ( = ?auto_594750 ?auto_594759 ) ) ( not ( = ?auto_594750 ?auto_594760 ) ) ( not ( = ?auto_594750 ?auto_594761 ) ) ( not ( = ?auto_594750 ?auto_594762 ) ) ( not ( = ?auto_594751 ?auto_594752 ) ) ( not ( = ?auto_594751 ?auto_594753 ) ) ( not ( = ?auto_594751 ?auto_594754 ) ) ( not ( = ?auto_594751 ?auto_594755 ) ) ( not ( = ?auto_594751 ?auto_594756 ) ) ( not ( = ?auto_594751 ?auto_594757 ) ) ( not ( = ?auto_594751 ?auto_594758 ) ) ( not ( = ?auto_594751 ?auto_594759 ) ) ( not ( = ?auto_594751 ?auto_594760 ) ) ( not ( = ?auto_594751 ?auto_594761 ) ) ( not ( = ?auto_594751 ?auto_594762 ) ) ( not ( = ?auto_594752 ?auto_594753 ) ) ( not ( = ?auto_594752 ?auto_594754 ) ) ( not ( = ?auto_594752 ?auto_594755 ) ) ( not ( = ?auto_594752 ?auto_594756 ) ) ( not ( = ?auto_594752 ?auto_594757 ) ) ( not ( = ?auto_594752 ?auto_594758 ) ) ( not ( = ?auto_594752 ?auto_594759 ) ) ( not ( = ?auto_594752 ?auto_594760 ) ) ( not ( = ?auto_594752 ?auto_594761 ) ) ( not ( = ?auto_594752 ?auto_594762 ) ) ( not ( = ?auto_594753 ?auto_594754 ) ) ( not ( = ?auto_594753 ?auto_594755 ) ) ( not ( = ?auto_594753 ?auto_594756 ) ) ( not ( = ?auto_594753 ?auto_594757 ) ) ( not ( = ?auto_594753 ?auto_594758 ) ) ( not ( = ?auto_594753 ?auto_594759 ) ) ( not ( = ?auto_594753 ?auto_594760 ) ) ( not ( = ?auto_594753 ?auto_594761 ) ) ( not ( = ?auto_594753 ?auto_594762 ) ) ( not ( = ?auto_594754 ?auto_594755 ) ) ( not ( = ?auto_594754 ?auto_594756 ) ) ( not ( = ?auto_594754 ?auto_594757 ) ) ( not ( = ?auto_594754 ?auto_594758 ) ) ( not ( = ?auto_594754 ?auto_594759 ) ) ( not ( = ?auto_594754 ?auto_594760 ) ) ( not ( = ?auto_594754 ?auto_594761 ) ) ( not ( = ?auto_594754 ?auto_594762 ) ) ( not ( = ?auto_594755 ?auto_594756 ) ) ( not ( = ?auto_594755 ?auto_594757 ) ) ( not ( = ?auto_594755 ?auto_594758 ) ) ( not ( = ?auto_594755 ?auto_594759 ) ) ( not ( = ?auto_594755 ?auto_594760 ) ) ( not ( = ?auto_594755 ?auto_594761 ) ) ( not ( = ?auto_594755 ?auto_594762 ) ) ( not ( = ?auto_594756 ?auto_594757 ) ) ( not ( = ?auto_594756 ?auto_594758 ) ) ( not ( = ?auto_594756 ?auto_594759 ) ) ( not ( = ?auto_594756 ?auto_594760 ) ) ( not ( = ?auto_594756 ?auto_594761 ) ) ( not ( = ?auto_594756 ?auto_594762 ) ) ( not ( = ?auto_594757 ?auto_594758 ) ) ( not ( = ?auto_594757 ?auto_594759 ) ) ( not ( = ?auto_594757 ?auto_594760 ) ) ( not ( = ?auto_594757 ?auto_594761 ) ) ( not ( = ?auto_594757 ?auto_594762 ) ) ( not ( = ?auto_594758 ?auto_594759 ) ) ( not ( = ?auto_594758 ?auto_594760 ) ) ( not ( = ?auto_594758 ?auto_594761 ) ) ( not ( = ?auto_594758 ?auto_594762 ) ) ( not ( = ?auto_594759 ?auto_594760 ) ) ( not ( = ?auto_594759 ?auto_594761 ) ) ( not ( = ?auto_594759 ?auto_594762 ) ) ( not ( = ?auto_594760 ?auto_594761 ) ) ( not ( = ?auto_594760 ?auto_594762 ) ) ( not ( = ?auto_594761 ?auto_594762 ) ) ( CLEAR ?auto_594759 ) ( ON ?auto_594760 ?auto_594761 ) ( CLEAR ?auto_594760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_594747 ?auto_594748 ?auto_594749 ?auto_594750 ?auto_594751 ?auto_594752 ?auto_594753 ?auto_594754 ?auto_594755 ?auto_594756 ?auto_594757 ?auto_594758 ?auto_594759 ?auto_594760 )
      ( MAKE-15PILE ?auto_594747 ?auto_594748 ?auto_594749 ?auto_594750 ?auto_594751 ?auto_594752 ?auto_594753 ?auto_594754 ?auto_594755 ?auto_594756 ?auto_594757 ?auto_594758 ?auto_594759 ?auto_594760 ?auto_594761 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594809 - BLOCK
      ?auto_594810 - BLOCK
      ?auto_594811 - BLOCK
      ?auto_594812 - BLOCK
      ?auto_594813 - BLOCK
      ?auto_594814 - BLOCK
      ?auto_594815 - BLOCK
      ?auto_594816 - BLOCK
      ?auto_594817 - BLOCK
      ?auto_594818 - BLOCK
      ?auto_594819 - BLOCK
      ?auto_594820 - BLOCK
      ?auto_594821 - BLOCK
      ?auto_594822 - BLOCK
      ?auto_594823 - BLOCK
    )
    :vars
    (
      ?auto_594824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594823 ?auto_594824 ) ( ON-TABLE ?auto_594809 ) ( ON ?auto_594810 ?auto_594809 ) ( ON ?auto_594811 ?auto_594810 ) ( ON ?auto_594812 ?auto_594811 ) ( ON ?auto_594813 ?auto_594812 ) ( ON ?auto_594814 ?auto_594813 ) ( ON ?auto_594815 ?auto_594814 ) ( ON ?auto_594816 ?auto_594815 ) ( ON ?auto_594817 ?auto_594816 ) ( ON ?auto_594818 ?auto_594817 ) ( ON ?auto_594819 ?auto_594818 ) ( ON ?auto_594820 ?auto_594819 ) ( not ( = ?auto_594809 ?auto_594810 ) ) ( not ( = ?auto_594809 ?auto_594811 ) ) ( not ( = ?auto_594809 ?auto_594812 ) ) ( not ( = ?auto_594809 ?auto_594813 ) ) ( not ( = ?auto_594809 ?auto_594814 ) ) ( not ( = ?auto_594809 ?auto_594815 ) ) ( not ( = ?auto_594809 ?auto_594816 ) ) ( not ( = ?auto_594809 ?auto_594817 ) ) ( not ( = ?auto_594809 ?auto_594818 ) ) ( not ( = ?auto_594809 ?auto_594819 ) ) ( not ( = ?auto_594809 ?auto_594820 ) ) ( not ( = ?auto_594809 ?auto_594821 ) ) ( not ( = ?auto_594809 ?auto_594822 ) ) ( not ( = ?auto_594809 ?auto_594823 ) ) ( not ( = ?auto_594809 ?auto_594824 ) ) ( not ( = ?auto_594810 ?auto_594811 ) ) ( not ( = ?auto_594810 ?auto_594812 ) ) ( not ( = ?auto_594810 ?auto_594813 ) ) ( not ( = ?auto_594810 ?auto_594814 ) ) ( not ( = ?auto_594810 ?auto_594815 ) ) ( not ( = ?auto_594810 ?auto_594816 ) ) ( not ( = ?auto_594810 ?auto_594817 ) ) ( not ( = ?auto_594810 ?auto_594818 ) ) ( not ( = ?auto_594810 ?auto_594819 ) ) ( not ( = ?auto_594810 ?auto_594820 ) ) ( not ( = ?auto_594810 ?auto_594821 ) ) ( not ( = ?auto_594810 ?auto_594822 ) ) ( not ( = ?auto_594810 ?auto_594823 ) ) ( not ( = ?auto_594810 ?auto_594824 ) ) ( not ( = ?auto_594811 ?auto_594812 ) ) ( not ( = ?auto_594811 ?auto_594813 ) ) ( not ( = ?auto_594811 ?auto_594814 ) ) ( not ( = ?auto_594811 ?auto_594815 ) ) ( not ( = ?auto_594811 ?auto_594816 ) ) ( not ( = ?auto_594811 ?auto_594817 ) ) ( not ( = ?auto_594811 ?auto_594818 ) ) ( not ( = ?auto_594811 ?auto_594819 ) ) ( not ( = ?auto_594811 ?auto_594820 ) ) ( not ( = ?auto_594811 ?auto_594821 ) ) ( not ( = ?auto_594811 ?auto_594822 ) ) ( not ( = ?auto_594811 ?auto_594823 ) ) ( not ( = ?auto_594811 ?auto_594824 ) ) ( not ( = ?auto_594812 ?auto_594813 ) ) ( not ( = ?auto_594812 ?auto_594814 ) ) ( not ( = ?auto_594812 ?auto_594815 ) ) ( not ( = ?auto_594812 ?auto_594816 ) ) ( not ( = ?auto_594812 ?auto_594817 ) ) ( not ( = ?auto_594812 ?auto_594818 ) ) ( not ( = ?auto_594812 ?auto_594819 ) ) ( not ( = ?auto_594812 ?auto_594820 ) ) ( not ( = ?auto_594812 ?auto_594821 ) ) ( not ( = ?auto_594812 ?auto_594822 ) ) ( not ( = ?auto_594812 ?auto_594823 ) ) ( not ( = ?auto_594812 ?auto_594824 ) ) ( not ( = ?auto_594813 ?auto_594814 ) ) ( not ( = ?auto_594813 ?auto_594815 ) ) ( not ( = ?auto_594813 ?auto_594816 ) ) ( not ( = ?auto_594813 ?auto_594817 ) ) ( not ( = ?auto_594813 ?auto_594818 ) ) ( not ( = ?auto_594813 ?auto_594819 ) ) ( not ( = ?auto_594813 ?auto_594820 ) ) ( not ( = ?auto_594813 ?auto_594821 ) ) ( not ( = ?auto_594813 ?auto_594822 ) ) ( not ( = ?auto_594813 ?auto_594823 ) ) ( not ( = ?auto_594813 ?auto_594824 ) ) ( not ( = ?auto_594814 ?auto_594815 ) ) ( not ( = ?auto_594814 ?auto_594816 ) ) ( not ( = ?auto_594814 ?auto_594817 ) ) ( not ( = ?auto_594814 ?auto_594818 ) ) ( not ( = ?auto_594814 ?auto_594819 ) ) ( not ( = ?auto_594814 ?auto_594820 ) ) ( not ( = ?auto_594814 ?auto_594821 ) ) ( not ( = ?auto_594814 ?auto_594822 ) ) ( not ( = ?auto_594814 ?auto_594823 ) ) ( not ( = ?auto_594814 ?auto_594824 ) ) ( not ( = ?auto_594815 ?auto_594816 ) ) ( not ( = ?auto_594815 ?auto_594817 ) ) ( not ( = ?auto_594815 ?auto_594818 ) ) ( not ( = ?auto_594815 ?auto_594819 ) ) ( not ( = ?auto_594815 ?auto_594820 ) ) ( not ( = ?auto_594815 ?auto_594821 ) ) ( not ( = ?auto_594815 ?auto_594822 ) ) ( not ( = ?auto_594815 ?auto_594823 ) ) ( not ( = ?auto_594815 ?auto_594824 ) ) ( not ( = ?auto_594816 ?auto_594817 ) ) ( not ( = ?auto_594816 ?auto_594818 ) ) ( not ( = ?auto_594816 ?auto_594819 ) ) ( not ( = ?auto_594816 ?auto_594820 ) ) ( not ( = ?auto_594816 ?auto_594821 ) ) ( not ( = ?auto_594816 ?auto_594822 ) ) ( not ( = ?auto_594816 ?auto_594823 ) ) ( not ( = ?auto_594816 ?auto_594824 ) ) ( not ( = ?auto_594817 ?auto_594818 ) ) ( not ( = ?auto_594817 ?auto_594819 ) ) ( not ( = ?auto_594817 ?auto_594820 ) ) ( not ( = ?auto_594817 ?auto_594821 ) ) ( not ( = ?auto_594817 ?auto_594822 ) ) ( not ( = ?auto_594817 ?auto_594823 ) ) ( not ( = ?auto_594817 ?auto_594824 ) ) ( not ( = ?auto_594818 ?auto_594819 ) ) ( not ( = ?auto_594818 ?auto_594820 ) ) ( not ( = ?auto_594818 ?auto_594821 ) ) ( not ( = ?auto_594818 ?auto_594822 ) ) ( not ( = ?auto_594818 ?auto_594823 ) ) ( not ( = ?auto_594818 ?auto_594824 ) ) ( not ( = ?auto_594819 ?auto_594820 ) ) ( not ( = ?auto_594819 ?auto_594821 ) ) ( not ( = ?auto_594819 ?auto_594822 ) ) ( not ( = ?auto_594819 ?auto_594823 ) ) ( not ( = ?auto_594819 ?auto_594824 ) ) ( not ( = ?auto_594820 ?auto_594821 ) ) ( not ( = ?auto_594820 ?auto_594822 ) ) ( not ( = ?auto_594820 ?auto_594823 ) ) ( not ( = ?auto_594820 ?auto_594824 ) ) ( not ( = ?auto_594821 ?auto_594822 ) ) ( not ( = ?auto_594821 ?auto_594823 ) ) ( not ( = ?auto_594821 ?auto_594824 ) ) ( not ( = ?auto_594822 ?auto_594823 ) ) ( not ( = ?auto_594822 ?auto_594824 ) ) ( not ( = ?auto_594823 ?auto_594824 ) ) ( ON ?auto_594822 ?auto_594823 ) ( CLEAR ?auto_594820 ) ( ON ?auto_594821 ?auto_594822 ) ( CLEAR ?auto_594821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_594809 ?auto_594810 ?auto_594811 ?auto_594812 ?auto_594813 ?auto_594814 ?auto_594815 ?auto_594816 ?auto_594817 ?auto_594818 ?auto_594819 ?auto_594820 ?auto_594821 )
      ( MAKE-15PILE ?auto_594809 ?auto_594810 ?auto_594811 ?auto_594812 ?auto_594813 ?auto_594814 ?auto_594815 ?auto_594816 ?auto_594817 ?auto_594818 ?auto_594819 ?auto_594820 ?auto_594821 ?auto_594822 ?auto_594823 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594871 - BLOCK
      ?auto_594872 - BLOCK
      ?auto_594873 - BLOCK
      ?auto_594874 - BLOCK
      ?auto_594875 - BLOCK
      ?auto_594876 - BLOCK
      ?auto_594877 - BLOCK
      ?auto_594878 - BLOCK
      ?auto_594879 - BLOCK
      ?auto_594880 - BLOCK
      ?auto_594881 - BLOCK
      ?auto_594882 - BLOCK
      ?auto_594883 - BLOCK
      ?auto_594884 - BLOCK
      ?auto_594885 - BLOCK
    )
    :vars
    (
      ?auto_594886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594885 ?auto_594886 ) ( ON-TABLE ?auto_594871 ) ( ON ?auto_594872 ?auto_594871 ) ( ON ?auto_594873 ?auto_594872 ) ( ON ?auto_594874 ?auto_594873 ) ( ON ?auto_594875 ?auto_594874 ) ( ON ?auto_594876 ?auto_594875 ) ( ON ?auto_594877 ?auto_594876 ) ( ON ?auto_594878 ?auto_594877 ) ( ON ?auto_594879 ?auto_594878 ) ( ON ?auto_594880 ?auto_594879 ) ( ON ?auto_594881 ?auto_594880 ) ( not ( = ?auto_594871 ?auto_594872 ) ) ( not ( = ?auto_594871 ?auto_594873 ) ) ( not ( = ?auto_594871 ?auto_594874 ) ) ( not ( = ?auto_594871 ?auto_594875 ) ) ( not ( = ?auto_594871 ?auto_594876 ) ) ( not ( = ?auto_594871 ?auto_594877 ) ) ( not ( = ?auto_594871 ?auto_594878 ) ) ( not ( = ?auto_594871 ?auto_594879 ) ) ( not ( = ?auto_594871 ?auto_594880 ) ) ( not ( = ?auto_594871 ?auto_594881 ) ) ( not ( = ?auto_594871 ?auto_594882 ) ) ( not ( = ?auto_594871 ?auto_594883 ) ) ( not ( = ?auto_594871 ?auto_594884 ) ) ( not ( = ?auto_594871 ?auto_594885 ) ) ( not ( = ?auto_594871 ?auto_594886 ) ) ( not ( = ?auto_594872 ?auto_594873 ) ) ( not ( = ?auto_594872 ?auto_594874 ) ) ( not ( = ?auto_594872 ?auto_594875 ) ) ( not ( = ?auto_594872 ?auto_594876 ) ) ( not ( = ?auto_594872 ?auto_594877 ) ) ( not ( = ?auto_594872 ?auto_594878 ) ) ( not ( = ?auto_594872 ?auto_594879 ) ) ( not ( = ?auto_594872 ?auto_594880 ) ) ( not ( = ?auto_594872 ?auto_594881 ) ) ( not ( = ?auto_594872 ?auto_594882 ) ) ( not ( = ?auto_594872 ?auto_594883 ) ) ( not ( = ?auto_594872 ?auto_594884 ) ) ( not ( = ?auto_594872 ?auto_594885 ) ) ( not ( = ?auto_594872 ?auto_594886 ) ) ( not ( = ?auto_594873 ?auto_594874 ) ) ( not ( = ?auto_594873 ?auto_594875 ) ) ( not ( = ?auto_594873 ?auto_594876 ) ) ( not ( = ?auto_594873 ?auto_594877 ) ) ( not ( = ?auto_594873 ?auto_594878 ) ) ( not ( = ?auto_594873 ?auto_594879 ) ) ( not ( = ?auto_594873 ?auto_594880 ) ) ( not ( = ?auto_594873 ?auto_594881 ) ) ( not ( = ?auto_594873 ?auto_594882 ) ) ( not ( = ?auto_594873 ?auto_594883 ) ) ( not ( = ?auto_594873 ?auto_594884 ) ) ( not ( = ?auto_594873 ?auto_594885 ) ) ( not ( = ?auto_594873 ?auto_594886 ) ) ( not ( = ?auto_594874 ?auto_594875 ) ) ( not ( = ?auto_594874 ?auto_594876 ) ) ( not ( = ?auto_594874 ?auto_594877 ) ) ( not ( = ?auto_594874 ?auto_594878 ) ) ( not ( = ?auto_594874 ?auto_594879 ) ) ( not ( = ?auto_594874 ?auto_594880 ) ) ( not ( = ?auto_594874 ?auto_594881 ) ) ( not ( = ?auto_594874 ?auto_594882 ) ) ( not ( = ?auto_594874 ?auto_594883 ) ) ( not ( = ?auto_594874 ?auto_594884 ) ) ( not ( = ?auto_594874 ?auto_594885 ) ) ( not ( = ?auto_594874 ?auto_594886 ) ) ( not ( = ?auto_594875 ?auto_594876 ) ) ( not ( = ?auto_594875 ?auto_594877 ) ) ( not ( = ?auto_594875 ?auto_594878 ) ) ( not ( = ?auto_594875 ?auto_594879 ) ) ( not ( = ?auto_594875 ?auto_594880 ) ) ( not ( = ?auto_594875 ?auto_594881 ) ) ( not ( = ?auto_594875 ?auto_594882 ) ) ( not ( = ?auto_594875 ?auto_594883 ) ) ( not ( = ?auto_594875 ?auto_594884 ) ) ( not ( = ?auto_594875 ?auto_594885 ) ) ( not ( = ?auto_594875 ?auto_594886 ) ) ( not ( = ?auto_594876 ?auto_594877 ) ) ( not ( = ?auto_594876 ?auto_594878 ) ) ( not ( = ?auto_594876 ?auto_594879 ) ) ( not ( = ?auto_594876 ?auto_594880 ) ) ( not ( = ?auto_594876 ?auto_594881 ) ) ( not ( = ?auto_594876 ?auto_594882 ) ) ( not ( = ?auto_594876 ?auto_594883 ) ) ( not ( = ?auto_594876 ?auto_594884 ) ) ( not ( = ?auto_594876 ?auto_594885 ) ) ( not ( = ?auto_594876 ?auto_594886 ) ) ( not ( = ?auto_594877 ?auto_594878 ) ) ( not ( = ?auto_594877 ?auto_594879 ) ) ( not ( = ?auto_594877 ?auto_594880 ) ) ( not ( = ?auto_594877 ?auto_594881 ) ) ( not ( = ?auto_594877 ?auto_594882 ) ) ( not ( = ?auto_594877 ?auto_594883 ) ) ( not ( = ?auto_594877 ?auto_594884 ) ) ( not ( = ?auto_594877 ?auto_594885 ) ) ( not ( = ?auto_594877 ?auto_594886 ) ) ( not ( = ?auto_594878 ?auto_594879 ) ) ( not ( = ?auto_594878 ?auto_594880 ) ) ( not ( = ?auto_594878 ?auto_594881 ) ) ( not ( = ?auto_594878 ?auto_594882 ) ) ( not ( = ?auto_594878 ?auto_594883 ) ) ( not ( = ?auto_594878 ?auto_594884 ) ) ( not ( = ?auto_594878 ?auto_594885 ) ) ( not ( = ?auto_594878 ?auto_594886 ) ) ( not ( = ?auto_594879 ?auto_594880 ) ) ( not ( = ?auto_594879 ?auto_594881 ) ) ( not ( = ?auto_594879 ?auto_594882 ) ) ( not ( = ?auto_594879 ?auto_594883 ) ) ( not ( = ?auto_594879 ?auto_594884 ) ) ( not ( = ?auto_594879 ?auto_594885 ) ) ( not ( = ?auto_594879 ?auto_594886 ) ) ( not ( = ?auto_594880 ?auto_594881 ) ) ( not ( = ?auto_594880 ?auto_594882 ) ) ( not ( = ?auto_594880 ?auto_594883 ) ) ( not ( = ?auto_594880 ?auto_594884 ) ) ( not ( = ?auto_594880 ?auto_594885 ) ) ( not ( = ?auto_594880 ?auto_594886 ) ) ( not ( = ?auto_594881 ?auto_594882 ) ) ( not ( = ?auto_594881 ?auto_594883 ) ) ( not ( = ?auto_594881 ?auto_594884 ) ) ( not ( = ?auto_594881 ?auto_594885 ) ) ( not ( = ?auto_594881 ?auto_594886 ) ) ( not ( = ?auto_594882 ?auto_594883 ) ) ( not ( = ?auto_594882 ?auto_594884 ) ) ( not ( = ?auto_594882 ?auto_594885 ) ) ( not ( = ?auto_594882 ?auto_594886 ) ) ( not ( = ?auto_594883 ?auto_594884 ) ) ( not ( = ?auto_594883 ?auto_594885 ) ) ( not ( = ?auto_594883 ?auto_594886 ) ) ( not ( = ?auto_594884 ?auto_594885 ) ) ( not ( = ?auto_594884 ?auto_594886 ) ) ( not ( = ?auto_594885 ?auto_594886 ) ) ( ON ?auto_594884 ?auto_594885 ) ( ON ?auto_594883 ?auto_594884 ) ( CLEAR ?auto_594881 ) ( ON ?auto_594882 ?auto_594883 ) ( CLEAR ?auto_594882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_594871 ?auto_594872 ?auto_594873 ?auto_594874 ?auto_594875 ?auto_594876 ?auto_594877 ?auto_594878 ?auto_594879 ?auto_594880 ?auto_594881 ?auto_594882 )
      ( MAKE-15PILE ?auto_594871 ?auto_594872 ?auto_594873 ?auto_594874 ?auto_594875 ?auto_594876 ?auto_594877 ?auto_594878 ?auto_594879 ?auto_594880 ?auto_594881 ?auto_594882 ?auto_594883 ?auto_594884 ?auto_594885 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594933 - BLOCK
      ?auto_594934 - BLOCK
      ?auto_594935 - BLOCK
      ?auto_594936 - BLOCK
      ?auto_594937 - BLOCK
      ?auto_594938 - BLOCK
      ?auto_594939 - BLOCK
      ?auto_594940 - BLOCK
      ?auto_594941 - BLOCK
      ?auto_594942 - BLOCK
      ?auto_594943 - BLOCK
      ?auto_594944 - BLOCK
      ?auto_594945 - BLOCK
      ?auto_594946 - BLOCK
      ?auto_594947 - BLOCK
    )
    :vars
    (
      ?auto_594948 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_594947 ?auto_594948 ) ( ON-TABLE ?auto_594933 ) ( ON ?auto_594934 ?auto_594933 ) ( ON ?auto_594935 ?auto_594934 ) ( ON ?auto_594936 ?auto_594935 ) ( ON ?auto_594937 ?auto_594936 ) ( ON ?auto_594938 ?auto_594937 ) ( ON ?auto_594939 ?auto_594938 ) ( ON ?auto_594940 ?auto_594939 ) ( ON ?auto_594941 ?auto_594940 ) ( ON ?auto_594942 ?auto_594941 ) ( not ( = ?auto_594933 ?auto_594934 ) ) ( not ( = ?auto_594933 ?auto_594935 ) ) ( not ( = ?auto_594933 ?auto_594936 ) ) ( not ( = ?auto_594933 ?auto_594937 ) ) ( not ( = ?auto_594933 ?auto_594938 ) ) ( not ( = ?auto_594933 ?auto_594939 ) ) ( not ( = ?auto_594933 ?auto_594940 ) ) ( not ( = ?auto_594933 ?auto_594941 ) ) ( not ( = ?auto_594933 ?auto_594942 ) ) ( not ( = ?auto_594933 ?auto_594943 ) ) ( not ( = ?auto_594933 ?auto_594944 ) ) ( not ( = ?auto_594933 ?auto_594945 ) ) ( not ( = ?auto_594933 ?auto_594946 ) ) ( not ( = ?auto_594933 ?auto_594947 ) ) ( not ( = ?auto_594933 ?auto_594948 ) ) ( not ( = ?auto_594934 ?auto_594935 ) ) ( not ( = ?auto_594934 ?auto_594936 ) ) ( not ( = ?auto_594934 ?auto_594937 ) ) ( not ( = ?auto_594934 ?auto_594938 ) ) ( not ( = ?auto_594934 ?auto_594939 ) ) ( not ( = ?auto_594934 ?auto_594940 ) ) ( not ( = ?auto_594934 ?auto_594941 ) ) ( not ( = ?auto_594934 ?auto_594942 ) ) ( not ( = ?auto_594934 ?auto_594943 ) ) ( not ( = ?auto_594934 ?auto_594944 ) ) ( not ( = ?auto_594934 ?auto_594945 ) ) ( not ( = ?auto_594934 ?auto_594946 ) ) ( not ( = ?auto_594934 ?auto_594947 ) ) ( not ( = ?auto_594934 ?auto_594948 ) ) ( not ( = ?auto_594935 ?auto_594936 ) ) ( not ( = ?auto_594935 ?auto_594937 ) ) ( not ( = ?auto_594935 ?auto_594938 ) ) ( not ( = ?auto_594935 ?auto_594939 ) ) ( not ( = ?auto_594935 ?auto_594940 ) ) ( not ( = ?auto_594935 ?auto_594941 ) ) ( not ( = ?auto_594935 ?auto_594942 ) ) ( not ( = ?auto_594935 ?auto_594943 ) ) ( not ( = ?auto_594935 ?auto_594944 ) ) ( not ( = ?auto_594935 ?auto_594945 ) ) ( not ( = ?auto_594935 ?auto_594946 ) ) ( not ( = ?auto_594935 ?auto_594947 ) ) ( not ( = ?auto_594935 ?auto_594948 ) ) ( not ( = ?auto_594936 ?auto_594937 ) ) ( not ( = ?auto_594936 ?auto_594938 ) ) ( not ( = ?auto_594936 ?auto_594939 ) ) ( not ( = ?auto_594936 ?auto_594940 ) ) ( not ( = ?auto_594936 ?auto_594941 ) ) ( not ( = ?auto_594936 ?auto_594942 ) ) ( not ( = ?auto_594936 ?auto_594943 ) ) ( not ( = ?auto_594936 ?auto_594944 ) ) ( not ( = ?auto_594936 ?auto_594945 ) ) ( not ( = ?auto_594936 ?auto_594946 ) ) ( not ( = ?auto_594936 ?auto_594947 ) ) ( not ( = ?auto_594936 ?auto_594948 ) ) ( not ( = ?auto_594937 ?auto_594938 ) ) ( not ( = ?auto_594937 ?auto_594939 ) ) ( not ( = ?auto_594937 ?auto_594940 ) ) ( not ( = ?auto_594937 ?auto_594941 ) ) ( not ( = ?auto_594937 ?auto_594942 ) ) ( not ( = ?auto_594937 ?auto_594943 ) ) ( not ( = ?auto_594937 ?auto_594944 ) ) ( not ( = ?auto_594937 ?auto_594945 ) ) ( not ( = ?auto_594937 ?auto_594946 ) ) ( not ( = ?auto_594937 ?auto_594947 ) ) ( not ( = ?auto_594937 ?auto_594948 ) ) ( not ( = ?auto_594938 ?auto_594939 ) ) ( not ( = ?auto_594938 ?auto_594940 ) ) ( not ( = ?auto_594938 ?auto_594941 ) ) ( not ( = ?auto_594938 ?auto_594942 ) ) ( not ( = ?auto_594938 ?auto_594943 ) ) ( not ( = ?auto_594938 ?auto_594944 ) ) ( not ( = ?auto_594938 ?auto_594945 ) ) ( not ( = ?auto_594938 ?auto_594946 ) ) ( not ( = ?auto_594938 ?auto_594947 ) ) ( not ( = ?auto_594938 ?auto_594948 ) ) ( not ( = ?auto_594939 ?auto_594940 ) ) ( not ( = ?auto_594939 ?auto_594941 ) ) ( not ( = ?auto_594939 ?auto_594942 ) ) ( not ( = ?auto_594939 ?auto_594943 ) ) ( not ( = ?auto_594939 ?auto_594944 ) ) ( not ( = ?auto_594939 ?auto_594945 ) ) ( not ( = ?auto_594939 ?auto_594946 ) ) ( not ( = ?auto_594939 ?auto_594947 ) ) ( not ( = ?auto_594939 ?auto_594948 ) ) ( not ( = ?auto_594940 ?auto_594941 ) ) ( not ( = ?auto_594940 ?auto_594942 ) ) ( not ( = ?auto_594940 ?auto_594943 ) ) ( not ( = ?auto_594940 ?auto_594944 ) ) ( not ( = ?auto_594940 ?auto_594945 ) ) ( not ( = ?auto_594940 ?auto_594946 ) ) ( not ( = ?auto_594940 ?auto_594947 ) ) ( not ( = ?auto_594940 ?auto_594948 ) ) ( not ( = ?auto_594941 ?auto_594942 ) ) ( not ( = ?auto_594941 ?auto_594943 ) ) ( not ( = ?auto_594941 ?auto_594944 ) ) ( not ( = ?auto_594941 ?auto_594945 ) ) ( not ( = ?auto_594941 ?auto_594946 ) ) ( not ( = ?auto_594941 ?auto_594947 ) ) ( not ( = ?auto_594941 ?auto_594948 ) ) ( not ( = ?auto_594942 ?auto_594943 ) ) ( not ( = ?auto_594942 ?auto_594944 ) ) ( not ( = ?auto_594942 ?auto_594945 ) ) ( not ( = ?auto_594942 ?auto_594946 ) ) ( not ( = ?auto_594942 ?auto_594947 ) ) ( not ( = ?auto_594942 ?auto_594948 ) ) ( not ( = ?auto_594943 ?auto_594944 ) ) ( not ( = ?auto_594943 ?auto_594945 ) ) ( not ( = ?auto_594943 ?auto_594946 ) ) ( not ( = ?auto_594943 ?auto_594947 ) ) ( not ( = ?auto_594943 ?auto_594948 ) ) ( not ( = ?auto_594944 ?auto_594945 ) ) ( not ( = ?auto_594944 ?auto_594946 ) ) ( not ( = ?auto_594944 ?auto_594947 ) ) ( not ( = ?auto_594944 ?auto_594948 ) ) ( not ( = ?auto_594945 ?auto_594946 ) ) ( not ( = ?auto_594945 ?auto_594947 ) ) ( not ( = ?auto_594945 ?auto_594948 ) ) ( not ( = ?auto_594946 ?auto_594947 ) ) ( not ( = ?auto_594946 ?auto_594948 ) ) ( not ( = ?auto_594947 ?auto_594948 ) ) ( ON ?auto_594946 ?auto_594947 ) ( ON ?auto_594945 ?auto_594946 ) ( ON ?auto_594944 ?auto_594945 ) ( CLEAR ?auto_594942 ) ( ON ?auto_594943 ?auto_594944 ) ( CLEAR ?auto_594943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_594933 ?auto_594934 ?auto_594935 ?auto_594936 ?auto_594937 ?auto_594938 ?auto_594939 ?auto_594940 ?auto_594941 ?auto_594942 ?auto_594943 )
      ( MAKE-15PILE ?auto_594933 ?auto_594934 ?auto_594935 ?auto_594936 ?auto_594937 ?auto_594938 ?auto_594939 ?auto_594940 ?auto_594941 ?auto_594942 ?auto_594943 ?auto_594944 ?auto_594945 ?auto_594946 ?auto_594947 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_594995 - BLOCK
      ?auto_594996 - BLOCK
      ?auto_594997 - BLOCK
      ?auto_594998 - BLOCK
      ?auto_594999 - BLOCK
      ?auto_595000 - BLOCK
      ?auto_595001 - BLOCK
      ?auto_595002 - BLOCK
      ?auto_595003 - BLOCK
      ?auto_595004 - BLOCK
      ?auto_595005 - BLOCK
      ?auto_595006 - BLOCK
      ?auto_595007 - BLOCK
      ?auto_595008 - BLOCK
      ?auto_595009 - BLOCK
    )
    :vars
    (
      ?auto_595010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595009 ?auto_595010 ) ( ON-TABLE ?auto_594995 ) ( ON ?auto_594996 ?auto_594995 ) ( ON ?auto_594997 ?auto_594996 ) ( ON ?auto_594998 ?auto_594997 ) ( ON ?auto_594999 ?auto_594998 ) ( ON ?auto_595000 ?auto_594999 ) ( ON ?auto_595001 ?auto_595000 ) ( ON ?auto_595002 ?auto_595001 ) ( ON ?auto_595003 ?auto_595002 ) ( not ( = ?auto_594995 ?auto_594996 ) ) ( not ( = ?auto_594995 ?auto_594997 ) ) ( not ( = ?auto_594995 ?auto_594998 ) ) ( not ( = ?auto_594995 ?auto_594999 ) ) ( not ( = ?auto_594995 ?auto_595000 ) ) ( not ( = ?auto_594995 ?auto_595001 ) ) ( not ( = ?auto_594995 ?auto_595002 ) ) ( not ( = ?auto_594995 ?auto_595003 ) ) ( not ( = ?auto_594995 ?auto_595004 ) ) ( not ( = ?auto_594995 ?auto_595005 ) ) ( not ( = ?auto_594995 ?auto_595006 ) ) ( not ( = ?auto_594995 ?auto_595007 ) ) ( not ( = ?auto_594995 ?auto_595008 ) ) ( not ( = ?auto_594995 ?auto_595009 ) ) ( not ( = ?auto_594995 ?auto_595010 ) ) ( not ( = ?auto_594996 ?auto_594997 ) ) ( not ( = ?auto_594996 ?auto_594998 ) ) ( not ( = ?auto_594996 ?auto_594999 ) ) ( not ( = ?auto_594996 ?auto_595000 ) ) ( not ( = ?auto_594996 ?auto_595001 ) ) ( not ( = ?auto_594996 ?auto_595002 ) ) ( not ( = ?auto_594996 ?auto_595003 ) ) ( not ( = ?auto_594996 ?auto_595004 ) ) ( not ( = ?auto_594996 ?auto_595005 ) ) ( not ( = ?auto_594996 ?auto_595006 ) ) ( not ( = ?auto_594996 ?auto_595007 ) ) ( not ( = ?auto_594996 ?auto_595008 ) ) ( not ( = ?auto_594996 ?auto_595009 ) ) ( not ( = ?auto_594996 ?auto_595010 ) ) ( not ( = ?auto_594997 ?auto_594998 ) ) ( not ( = ?auto_594997 ?auto_594999 ) ) ( not ( = ?auto_594997 ?auto_595000 ) ) ( not ( = ?auto_594997 ?auto_595001 ) ) ( not ( = ?auto_594997 ?auto_595002 ) ) ( not ( = ?auto_594997 ?auto_595003 ) ) ( not ( = ?auto_594997 ?auto_595004 ) ) ( not ( = ?auto_594997 ?auto_595005 ) ) ( not ( = ?auto_594997 ?auto_595006 ) ) ( not ( = ?auto_594997 ?auto_595007 ) ) ( not ( = ?auto_594997 ?auto_595008 ) ) ( not ( = ?auto_594997 ?auto_595009 ) ) ( not ( = ?auto_594997 ?auto_595010 ) ) ( not ( = ?auto_594998 ?auto_594999 ) ) ( not ( = ?auto_594998 ?auto_595000 ) ) ( not ( = ?auto_594998 ?auto_595001 ) ) ( not ( = ?auto_594998 ?auto_595002 ) ) ( not ( = ?auto_594998 ?auto_595003 ) ) ( not ( = ?auto_594998 ?auto_595004 ) ) ( not ( = ?auto_594998 ?auto_595005 ) ) ( not ( = ?auto_594998 ?auto_595006 ) ) ( not ( = ?auto_594998 ?auto_595007 ) ) ( not ( = ?auto_594998 ?auto_595008 ) ) ( not ( = ?auto_594998 ?auto_595009 ) ) ( not ( = ?auto_594998 ?auto_595010 ) ) ( not ( = ?auto_594999 ?auto_595000 ) ) ( not ( = ?auto_594999 ?auto_595001 ) ) ( not ( = ?auto_594999 ?auto_595002 ) ) ( not ( = ?auto_594999 ?auto_595003 ) ) ( not ( = ?auto_594999 ?auto_595004 ) ) ( not ( = ?auto_594999 ?auto_595005 ) ) ( not ( = ?auto_594999 ?auto_595006 ) ) ( not ( = ?auto_594999 ?auto_595007 ) ) ( not ( = ?auto_594999 ?auto_595008 ) ) ( not ( = ?auto_594999 ?auto_595009 ) ) ( not ( = ?auto_594999 ?auto_595010 ) ) ( not ( = ?auto_595000 ?auto_595001 ) ) ( not ( = ?auto_595000 ?auto_595002 ) ) ( not ( = ?auto_595000 ?auto_595003 ) ) ( not ( = ?auto_595000 ?auto_595004 ) ) ( not ( = ?auto_595000 ?auto_595005 ) ) ( not ( = ?auto_595000 ?auto_595006 ) ) ( not ( = ?auto_595000 ?auto_595007 ) ) ( not ( = ?auto_595000 ?auto_595008 ) ) ( not ( = ?auto_595000 ?auto_595009 ) ) ( not ( = ?auto_595000 ?auto_595010 ) ) ( not ( = ?auto_595001 ?auto_595002 ) ) ( not ( = ?auto_595001 ?auto_595003 ) ) ( not ( = ?auto_595001 ?auto_595004 ) ) ( not ( = ?auto_595001 ?auto_595005 ) ) ( not ( = ?auto_595001 ?auto_595006 ) ) ( not ( = ?auto_595001 ?auto_595007 ) ) ( not ( = ?auto_595001 ?auto_595008 ) ) ( not ( = ?auto_595001 ?auto_595009 ) ) ( not ( = ?auto_595001 ?auto_595010 ) ) ( not ( = ?auto_595002 ?auto_595003 ) ) ( not ( = ?auto_595002 ?auto_595004 ) ) ( not ( = ?auto_595002 ?auto_595005 ) ) ( not ( = ?auto_595002 ?auto_595006 ) ) ( not ( = ?auto_595002 ?auto_595007 ) ) ( not ( = ?auto_595002 ?auto_595008 ) ) ( not ( = ?auto_595002 ?auto_595009 ) ) ( not ( = ?auto_595002 ?auto_595010 ) ) ( not ( = ?auto_595003 ?auto_595004 ) ) ( not ( = ?auto_595003 ?auto_595005 ) ) ( not ( = ?auto_595003 ?auto_595006 ) ) ( not ( = ?auto_595003 ?auto_595007 ) ) ( not ( = ?auto_595003 ?auto_595008 ) ) ( not ( = ?auto_595003 ?auto_595009 ) ) ( not ( = ?auto_595003 ?auto_595010 ) ) ( not ( = ?auto_595004 ?auto_595005 ) ) ( not ( = ?auto_595004 ?auto_595006 ) ) ( not ( = ?auto_595004 ?auto_595007 ) ) ( not ( = ?auto_595004 ?auto_595008 ) ) ( not ( = ?auto_595004 ?auto_595009 ) ) ( not ( = ?auto_595004 ?auto_595010 ) ) ( not ( = ?auto_595005 ?auto_595006 ) ) ( not ( = ?auto_595005 ?auto_595007 ) ) ( not ( = ?auto_595005 ?auto_595008 ) ) ( not ( = ?auto_595005 ?auto_595009 ) ) ( not ( = ?auto_595005 ?auto_595010 ) ) ( not ( = ?auto_595006 ?auto_595007 ) ) ( not ( = ?auto_595006 ?auto_595008 ) ) ( not ( = ?auto_595006 ?auto_595009 ) ) ( not ( = ?auto_595006 ?auto_595010 ) ) ( not ( = ?auto_595007 ?auto_595008 ) ) ( not ( = ?auto_595007 ?auto_595009 ) ) ( not ( = ?auto_595007 ?auto_595010 ) ) ( not ( = ?auto_595008 ?auto_595009 ) ) ( not ( = ?auto_595008 ?auto_595010 ) ) ( not ( = ?auto_595009 ?auto_595010 ) ) ( ON ?auto_595008 ?auto_595009 ) ( ON ?auto_595007 ?auto_595008 ) ( ON ?auto_595006 ?auto_595007 ) ( ON ?auto_595005 ?auto_595006 ) ( CLEAR ?auto_595003 ) ( ON ?auto_595004 ?auto_595005 ) ( CLEAR ?auto_595004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_594995 ?auto_594996 ?auto_594997 ?auto_594998 ?auto_594999 ?auto_595000 ?auto_595001 ?auto_595002 ?auto_595003 ?auto_595004 )
      ( MAKE-15PILE ?auto_594995 ?auto_594996 ?auto_594997 ?auto_594998 ?auto_594999 ?auto_595000 ?auto_595001 ?auto_595002 ?auto_595003 ?auto_595004 ?auto_595005 ?auto_595006 ?auto_595007 ?auto_595008 ?auto_595009 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595057 - BLOCK
      ?auto_595058 - BLOCK
      ?auto_595059 - BLOCK
      ?auto_595060 - BLOCK
      ?auto_595061 - BLOCK
      ?auto_595062 - BLOCK
      ?auto_595063 - BLOCK
      ?auto_595064 - BLOCK
      ?auto_595065 - BLOCK
      ?auto_595066 - BLOCK
      ?auto_595067 - BLOCK
      ?auto_595068 - BLOCK
      ?auto_595069 - BLOCK
      ?auto_595070 - BLOCK
      ?auto_595071 - BLOCK
    )
    :vars
    (
      ?auto_595072 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595071 ?auto_595072 ) ( ON-TABLE ?auto_595057 ) ( ON ?auto_595058 ?auto_595057 ) ( ON ?auto_595059 ?auto_595058 ) ( ON ?auto_595060 ?auto_595059 ) ( ON ?auto_595061 ?auto_595060 ) ( ON ?auto_595062 ?auto_595061 ) ( ON ?auto_595063 ?auto_595062 ) ( ON ?auto_595064 ?auto_595063 ) ( not ( = ?auto_595057 ?auto_595058 ) ) ( not ( = ?auto_595057 ?auto_595059 ) ) ( not ( = ?auto_595057 ?auto_595060 ) ) ( not ( = ?auto_595057 ?auto_595061 ) ) ( not ( = ?auto_595057 ?auto_595062 ) ) ( not ( = ?auto_595057 ?auto_595063 ) ) ( not ( = ?auto_595057 ?auto_595064 ) ) ( not ( = ?auto_595057 ?auto_595065 ) ) ( not ( = ?auto_595057 ?auto_595066 ) ) ( not ( = ?auto_595057 ?auto_595067 ) ) ( not ( = ?auto_595057 ?auto_595068 ) ) ( not ( = ?auto_595057 ?auto_595069 ) ) ( not ( = ?auto_595057 ?auto_595070 ) ) ( not ( = ?auto_595057 ?auto_595071 ) ) ( not ( = ?auto_595057 ?auto_595072 ) ) ( not ( = ?auto_595058 ?auto_595059 ) ) ( not ( = ?auto_595058 ?auto_595060 ) ) ( not ( = ?auto_595058 ?auto_595061 ) ) ( not ( = ?auto_595058 ?auto_595062 ) ) ( not ( = ?auto_595058 ?auto_595063 ) ) ( not ( = ?auto_595058 ?auto_595064 ) ) ( not ( = ?auto_595058 ?auto_595065 ) ) ( not ( = ?auto_595058 ?auto_595066 ) ) ( not ( = ?auto_595058 ?auto_595067 ) ) ( not ( = ?auto_595058 ?auto_595068 ) ) ( not ( = ?auto_595058 ?auto_595069 ) ) ( not ( = ?auto_595058 ?auto_595070 ) ) ( not ( = ?auto_595058 ?auto_595071 ) ) ( not ( = ?auto_595058 ?auto_595072 ) ) ( not ( = ?auto_595059 ?auto_595060 ) ) ( not ( = ?auto_595059 ?auto_595061 ) ) ( not ( = ?auto_595059 ?auto_595062 ) ) ( not ( = ?auto_595059 ?auto_595063 ) ) ( not ( = ?auto_595059 ?auto_595064 ) ) ( not ( = ?auto_595059 ?auto_595065 ) ) ( not ( = ?auto_595059 ?auto_595066 ) ) ( not ( = ?auto_595059 ?auto_595067 ) ) ( not ( = ?auto_595059 ?auto_595068 ) ) ( not ( = ?auto_595059 ?auto_595069 ) ) ( not ( = ?auto_595059 ?auto_595070 ) ) ( not ( = ?auto_595059 ?auto_595071 ) ) ( not ( = ?auto_595059 ?auto_595072 ) ) ( not ( = ?auto_595060 ?auto_595061 ) ) ( not ( = ?auto_595060 ?auto_595062 ) ) ( not ( = ?auto_595060 ?auto_595063 ) ) ( not ( = ?auto_595060 ?auto_595064 ) ) ( not ( = ?auto_595060 ?auto_595065 ) ) ( not ( = ?auto_595060 ?auto_595066 ) ) ( not ( = ?auto_595060 ?auto_595067 ) ) ( not ( = ?auto_595060 ?auto_595068 ) ) ( not ( = ?auto_595060 ?auto_595069 ) ) ( not ( = ?auto_595060 ?auto_595070 ) ) ( not ( = ?auto_595060 ?auto_595071 ) ) ( not ( = ?auto_595060 ?auto_595072 ) ) ( not ( = ?auto_595061 ?auto_595062 ) ) ( not ( = ?auto_595061 ?auto_595063 ) ) ( not ( = ?auto_595061 ?auto_595064 ) ) ( not ( = ?auto_595061 ?auto_595065 ) ) ( not ( = ?auto_595061 ?auto_595066 ) ) ( not ( = ?auto_595061 ?auto_595067 ) ) ( not ( = ?auto_595061 ?auto_595068 ) ) ( not ( = ?auto_595061 ?auto_595069 ) ) ( not ( = ?auto_595061 ?auto_595070 ) ) ( not ( = ?auto_595061 ?auto_595071 ) ) ( not ( = ?auto_595061 ?auto_595072 ) ) ( not ( = ?auto_595062 ?auto_595063 ) ) ( not ( = ?auto_595062 ?auto_595064 ) ) ( not ( = ?auto_595062 ?auto_595065 ) ) ( not ( = ?auto_595062 ?auto_595066 ) ) ( not ( = ?auto_595062 ?auto_595067 ) ) ( not ( = ?auto_595062 ?auto_595068 ) ) ( not ( = ?auto_595062 ?auto_595069 ) ) ( not ( = ?auto_595062 ?auto_595070 ) ) ( not ( = ?auto_595062 ?auto_595071 ) ) ( not ( = ?auto_595062 ?auto_595072 ) ) ( not ( = ?auto_595063 ?auto_595064 ) ) ( not ( = ?auto_595063 ?auto_595065 ) ) ( not ( = ?auto_595063 ?auto_595066 ) ) ( not ( = ?auto_595063 ?auto_595067 ) ) ( not ( = ?auto_595063 ?auto_595068 ) ) ( not ( = ?auto_595063 ?auto_595069 ) ) ( not ( = ?auto_595063 ?auto_595070 ) ) ( not ( = ?auto_595063 ?auto_595071 ) ) ( not ( = ?auto_595063 ?auto_595072 ) ) ( not ( = ?auto_595064 ?auto_595065 ) ) ( not ( = ?auto_595064 ?auto_595066 ) ) ( not ( = ?auto_595064 ?auto_595067 ) ) ( not ( = ?auto_595064 ?auto_595068 ) ) ( not ( = ?auto_595064 ?auto_595069 ) ) ( not ( = ?auto_595064 ?auto_595070 ) ) ( not ( = ?auto_595064 ?auto_595071 ) ) ( not ( = ?auto_595064 ?auto_595072 ) ) ( not ( = ?auto_595065 ?auto_595066 ) ) ( not ( = ?auto_595065 ?auto_595067 ) ) ( not ( = ?auto_595065 ?auto_595068 ) ) ( not ( = ?auto_595065 ?auto_595069 ) ) ( not ( = ?auto_595065 ?auto_595070 ) ) ( not ( = ?auto_595065 ?auto_595071 ) ) ( not ( = ?auto_595065 ?auto_595072 ) ) ( not ( = ?auto_595066 ?auto_595067 ) ) ( not ( = ?auto_595066 ?auto_595068 ) ) ( not ( = ?auto_595066 ?auto_595069 ) ) ( not ( = ?auto_595066 ?auto_595070 ) ) ( not ( = ?auto_595066 ?auto_595071 ) ) ( not ( = ?auto_595066 ?auto_595072 ) ) ( not ( = ?auto_595067 ?auto_595068 ) ) ( not ( = ?auto_595067 ?auto_595069 ) ) ( not ( = ?auto_595067 ?auto_595070 ) ) ( not ( = ?auto_595067 ?auto_595071 ) ) ( not ( = ?auto_595067 ?auto_595072 ) ) ( not ( = ?auto_595068 ?auto_595069 ) ) ( not ( = ?auto_595068 ?auto_595070 ) ) ( not ( = ?auto_595068 ?auto_595071 ) ) ( not ( = ?auto_595068 ?auto_595072 ) ) ( not ( = ?auto_595069 ?auto_595070 ) ) ( not ( = ?auto_595069 ?auto_595071 ) ) ( not ( = ?auto_595069 ?auto_595072 ) ) ( not ( = ?auto_595070 ?auto_595071 ) ) ( not ( = ?auto_595070 ?auto_595072 ) ) ( not ( = ?auto_595071 ?auto_595072 ) ) ( ON ?auto_595070 ?auto_595071 ) ( ON ?auto_595069 ?auto_595070 ) ( ON ?auto_595068 ?auto_595069 ) ( ON ?auto_595067 ?auto_595068 ) ( ON ?auto_595066 ?auto_595067 ) ( CLEAR ?auto_595064 ) ( ON ?auto_595065 ?auto_595066 ) ( CLEAR ?auto_595065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_595057 ?auto_595058 ?auto_595059 ?auto_595060 ?auto_595061 ?auto_595062 ?auto_595063 ?auto_595064 ?auto_595065 )
      ( MAKE-15PILE ?auto_595057 ?auto_595058 ?auto_595059 ?auto_595060 ?auto_595061 ?auto_595062 ?auto_595063 ?auto_595064 ?auto_595065 ?auto_595066 ?auto_595067 ?auto_595068 ?auto_595069 ?auto_595070 ?auto_595071 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595119 - BLOCK
      ?auto_595120 - BLOCK
      ?auto_595121 - BLOCK
      ?auto_595122 - BLOCK
      ?auto_595123 - BLOCK
      ?auto_595124 - BLOCK
      ?auto_595125 - BLOCK
      ?auto_595126 - BLOCK
      ?auto_595127 - BLOCK
      ?auto_595128 - BLOCK
      ?auto_595129 - BLOCK
      ?auto_595130 - BLOCK
      ?auto_595131 - BLOCK
      ?auto_595132 - BLOCK
      ?auto_595133 - BLOCK
    )
    :vars
    (
      ?auto_595134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595133 ?auto_595134 ) ( ON-TABLE ?auto_595119 ) ( ON ?auto_595120 ?auto_595119 ) ( ON ?auto_595121 ?auto_595120 ) ( ON ?auto_595122 ?auto_595121 ) ( ON ?auto_595123 ?auto_595122 ) ( ON ?auto_595124 ?auto_595123 ) ( ON ?auto_595125 ?auto_595124 ) ( not ( = ?auto_595119 ?auto_595120 ) ) ( not ( = ?auto_595119 ?auto_595121 ) ) ( not ( = ?auto_595119 ?auto_595122 ) ) ( not ( = ?auto_595119 ?auto_595123 ) ) ( not ( = ?auto_595119 ?auto_595124 ) ) ( not ( = ?auto_595119 ?auto_595125 ) ) ( not ( = ?auto_595119 ?auto_595126 ) ) ( not ( = ?auto_595119 ?auto_595127 ) ) ( not ( = ?auto_595119 ?auto_595128 ) ) ( not ( = ?auto_595119 ?auto_595129 ) ) ( not ( = ?auto_595119 ?auto_595130 ) ) ( not ( = ?auto_595119 ?auto_595131 ) ) ( not ( = ?auto_595119 ?auto_595132 ) ) ( not ( = ?auto_595119 ?auto_595133 ) ) ( not ( = ?auto_595119 ?auto_595134 ) ) ( not ( = ?auto_595120 ?auto_595121 ) ) ( not ( = ?auto_595120 ?auto_595122 ) ) ( not ( = ?auto_595120 ?auto_595123 ) ) ( not ( = ?auto_595120 ?auto_595124 ) ) ( not ( = ?auto_595120 ?auto_595125 ) ) ( not ( = ?auto_595120 ?auto_595126 ) ) ( not ( = ?auto_595120 ?auto_595127 ) ) ( not ( = ?auto_595120 ?auto_595128 ) ) ( not ( = ?auto_595120 ?auto_595129 ) ) ( not ( = ?auto_595120 ?auto_595130 ) ) ( not ( = ?auto_595120 ?auto_595131 ) ) ( not ( = ?auto_595120 ?auto_595132 ) ) ( not ( = ?auto_595120 ?auto_595133 ) ) ( not ( = ?auto_595120 ?auto_595134 ) ) ( not ( = ?auto_595121 ?auto_595122 ) ) ( not ( = ?auto_595121 ?auto_595123 ) ) ( not ( = ?auto_595121 ?auto_595124 ) ) ( not ( = ?auto_595121 ?auto_595125 ) ) ( not ( = ?auto_595121 ?auto_595126 ) ) ( not ( = ?auto_595121 ?auto_595127 ) ) ( not ( = ?auto_595121 ?auto_595128 ) ) ( not ( = ?auto_595121 ?auto_595129 ) ) ( not ( = ?auto_595121 ?auto_595130 ) ) ( not ( = ?auto_595121 ?auto_595131 ) ) ( not ( = ?auto_595121 ?auto_595132 ) ) ( not ( = ?auto_595121 ?auto_595133 ) ) ( not ( = ?auto_595121 ?auto_595134 ) ) ( not ( = ?auto_595122 ?auto_595123 ) ) ( not ( = ?auto_595122 ?auto_595124 ) ) ( not ( = ?auto_595122 ?auto_595125 ) ) ( not ( = ?auto_595122 ?auto_595126 ) ) ( not ( = ?auto_595122 ?auto_595127 ) ) ( not ( = ?auto_595122 ?auto_595128 ) ) ( not ( = ?auto_595122 ?auto_595129 ) ) ( not ( = ?auto_595122 ?auto_595130 ) ) ( not ( = ?auto_595122 ?auto_595131 ) ) ( not ( = ?auto_595122 ?auto_595132 ) ) ( not ( = ?auto_595122 ?auto_595133 ) ) ( not ( = ?auto_595122 ?auto_595134 ) ) ( not ( = ?auto_595123 ?auto_595124 ) ) ( not ( = ?auto_595123 ?auto_595125 ) ) ( not ( = ?auto_595123 ?auto_595126 ) ) ( not ( = ?auto_595123 ?auto_595127 ) ) ( not ( = ?auto_595123 ?auto_595128 ) ) ( not ( = ?auto_595123 ?auto_595129 ) ) ( not ( = ?auto_595123 ?auto_595130 ) ) ( not ( = ?auto_595123 ?auto_595131 ) ) ( not ( = ?auto_595123 ?auto_595132 ) ) ( not ( = ?auto_595123 ?auto_595133 ) ) ( not ( = ?auto_595123 ?auto_595134 ) ) ( not ( = ?auto_595124 ?auto_595125 ) ) ( not ( = ?auto_595124 ?auto_595126 ) ) ( not ( = ?auto_595124 ?auto_595127 ) ) ( not ( = ?auto_595124 ?auto_595128 ) ) ( not ( = ?auto_595124 ?auto_595129 ) ) ( not ( = ?auto_595124 ?auto_595130 ) ) ( not ( = ?auto_595124 ?auto_595131 ) ) ( not ( = ?auto_595124 ?auto_595132 ) ) ( not ( = ?auto_595124 ?auto_595133 ) ) ( not ( = ?auto_595124 ?auto_595134 ) ) ( not ( = ?auto_595125 ?auto_595126 ) ) ( not ( = ?auto_595125 ?auto_595127 ) ) ( not ( = ?auto_595125 ?auto_595128 ) ) ( not ( = ?auto_595125 ?auto_595129 ) ) ( not ( = ?auto_595125 ?auto_595130 ) ) ( not ( = ?auto_595125 ?auto_595131 ) ) ( not ( = ?auto_595125 ?auto_595132 ) ) ( not ( = ?auto_595125 ?auto_595133 ) ) ( not ( = ?auto_595125 ?auto_595134 ) ) ( not ( = ?auto_595126 ?auto_595127 ) ) ( not ( = ?auto_595126 ?auto_595128 ) ) ( not ( = ?auto_595126 ?auto_595129 ) ) ( not ( = ?auto_595126 ?auto_595130 ) ) ( not ( = ?auto_595126 ?auto_595131 ) ) ( not ( = ?auto_595126 ?auto_595132 ) ) ( not ( = ?auto_595126 ?auto_595133 ) ) ( not ( = ?auto_595126 ?auto_595134 ) ) ( not ( = ?auto_595127 ?auto_595128 ) ) ( not ( = ?auto_595127 ?auto_595129 ) ) ( not ( = ?auto_595127 ?auto_595130 ) ) ( not ( = ?auto_595127 ?auto_595131 ) ) ( not ( = ?auto_595127 ?auto_595132 ) ) ( not ( = ?auto_595127 ?auto_595133 ) ) ( not ( = ?auto_595127 ?auto_595134 ) ) ( not ( = ?auto_595128 ?auto_595129 ) ) ( not ( = ?auto_595128 ?auto_595130 ) ) ( not ( = ?auto_595128 ?auto_595131 ) ) ( not ( = ?auto_595128 ?auto_595132 ) ) ( not ( = ?auto_595128 ?auto_595133 ) ) ( not ( = ?auto_595128 ?auto_595134 ) ) ( not ( = ?auto_595129 ?auto_595130 ) ) ( not ( = ?auto_595129 ?auto_595131 ) ) ( not ( = ?auto_595129 ?auto_595132 ) ) ( not ( = ?auto_595129 ?auto_595133 ) ) ( not ( = ?auto_595129 ?auto_595134 ) ) ( not ( = ?auto_595130 ?auto_595131 ) ) ( not ( = ?auto_595130 ?auto_595132 ) ) ( not ( = ?auto_595130 ?auto_595133 ) ) ( not ( = ?auto_595130 ?auto_595134 ) ) ( not ( = ?auto_595131 ?auto_595132 ) ) ( not ( = ?auto_595131 ?auto_595133 ) ) ( not ( = ?auto_595131 ?auto_595134 ) ) ( not ( = ?auto_595132 ?auto_595133 ) ) ( not ( = ?auto_595132 ?auto_595134 ) ) ( not ( = ?auto_595133 ?auto_595134 ) ) ( ON ?auto_595132 ?auto_595133 ) ( ON ?auto_595131 ?auto_595132 ) ( ON ?auto_595130 ?auto_595131 ) ( ON ?auto_595129 ?auto_595130 ) ( ON ?auto_595128 ?auto_595129 ) ( ON ?auto_595127 ?auto_595128 ) ( CLEAR ?auto_595125 ) ( ON ?auto_595126 ?auto_595127 ) ( CLEAR ?auto_595126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_595119 ?auto_595120 ?auto_595121 ?auto_595122 ?auto_595123 ?auto_595124 ?auto_595125 ?auto_595126 )
      ( MAKE-15PILE ?auto_595119 ?auto_595120 ?auto_595121 ?auto_595122 ?auto_595123 ?auto_595124 ?auto_595125 ?auto_595126 ?auto_595127 ?auto_595128 ?auto_595129 ?auto_595130 ?auto_595131 ?auto_595132 ?auto_595133 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595181 - BLOCK
      ?auto_595182 - BLOCK
      ?auto_595183 - BLOCK
      ?auto_595184 - BLOCK
      ?auto_595185 - BLOCK
      ?auto_595186 - BLOCK
      ?auto_595187 - BLOCK
      ?auto_595188 - BLOCK
      ?auto_595189 - BLOCK
      ?auto_595190 - BLOCK
      ?auto_595191 - BLOCK
      ?auto_595192 - BLOCK
      ?auto_595193 - BLOCK
      ?auto_595194 - BLOCK
      ?auto_595195 - BLOCK
    )
    :vars
    (
      ?auto_595196 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595195 ?auto_595196 ) ( ON-TABLE ?auto_595181 ) ( ON ?auto_595182 ?auto_595181 ) ( ON ?auto_595183 ?auto_595182 ) ( ON ?auto_595184 ?auto_595183 ) ( ON ?auto_595185 ?auto_595184 ) ( ON ?auto_595186 ?auto_595185 ) ( not ( = ?auto_595181 ?auto_595182 ) ) ( not ( = ?auto_595181 ?auto_595183 ) ) ( not ( = ?auto_595181 ?auto_595184 ) ) ( not ( = ?auto_595181 ?auto_595185 ) ) ( not ( = ?auto_595181 ?auto_595186 ) ) ( not ( = ?auto_595181 ?auto_595187 ) ) ( not ( = ?auto_595181 ?auto_595188 ) ) ( not ( = ?auto_595181 ?auto_595189 ) ) ( not ( = ?auto_595181 ?auto_595190 ) ) ( not ( = ?auto_595181 ?auto_595191 ) ) ( not ( = ?auto_595181 ?auto_595192 ) ) ( not ( = ?auto_595181 ?auto_595193 ) ) ( not ( = ?auto_595181 ?auto_595194 ) ) ( not ( = ?auto_595181 ?auto_595195 ) ) ( not ( = ?auto_595181 ?auto_595196 ) ) ( not ( = ?auto_595182 ?auto_595183 ) ) ( not ( = ?auto_595182 ?auto_595184 ) ) ( not ( = ?auto_595182 ?auto_595185 ) ) ( not ( = ?auto_595182 ?auto_595186 ) ) ( not ( = ?auto_595182 ?auto_595187 ) ) ( not ( = ?auto_595182 ?auto_595188 ) ) ( not ( = ?auto_595182 ?auto_595189 ) ) ( not ( = ?auto_595182 ?auto_595190 ) ) ( not ( = ?auto_595182 ?auto_595191 ) ) ( not ( = ?auto_595182 ?auto_595192 ) ) ( not ( = ?auto_595182 ?auto_595193 ) ) ( not ( = ?auto_595182 ?auto_595194 ) ) ( not ( = ?auto_595182 ?auto_595195 ) ) ( not ( = ?auto_595182 ?auto_595196 ) ) ( not ( = ?auto_595183 ?auto_595184 ) ) ( not ( = ?auto_595183 ?auto_595185 ) ) ( not ( = ?auto_595183 ?auto_595186 ) ) ( not ( = ?auto_595183 ?auto_595187 ) ) ( not ( = ?auto_595183 ?auto_595188 ) ) ( not ( = ?auto_595183 ?auto_595189 ) ) ( not ( = ?auto_595183 ?auto_595190 ) ) ( not ( = ?auto_595183 ?auto_595191 ) ) ( not ( = ?auto_595183 ?auto_595192 ) ) ( not ( = ?auto_595183 ?auto_595193 ) ) ( not ( = ?auto_595183 ?auto_595194 ) ) ( not ( = ?auto_595183 ?auto_595195 ) ) ( not ( = ?auto_595183 ?auto_595196 ) ) ( not ( = ?auto_595184 ?auto_595185 ) ) ( not ( = ?auto_595184 ?auto_595186 ) ) ( not ( = ?auto_595184 ?auto_595187 ) ) ( not ( = ?auto_595184 ?auto_595188 ) ) ( not ( = ?auto_595184 ?auto_595189 ) ) ( not ( = ?auto_595184 ?auto_595190 ) ) ( not ( = ?auto_595184 ?auto_595191 ) ) ( not ( = ?auto_595184 ?auto_595192 ) ) ( not ( = ?auto_595184 ?auto_595193 ) ) ( not ( = ?auto_595184 ?auto_595194 ) ) ( not ( = ?auto_595184 ?auto_595195 ) ) ( not ( = ?auto_595184 ?auto_595196 ) ) ( not ( = ?auto_595185 ?auto_595186 ) ) ( not ( = ?auto_595185 ?auto_595187 ) ) ( not ( = ?auto_595185 ?auto_595188 ) ) ( not ( = ?auto_595185 ?auto_595189 ) ) ( not ( = ?auto_595185 ?auto_595190 ) ) ( not ( = ?auto_595185 ?auto_595191 ) ) ( not ( = ?auto_595185 ?auto_595192 ) ) ( not ( = ?auto_595185 ?auto_595193 ) ) ( not ( = ?auto_595185 ?auto_595194 ) ) ( not ( = ?auto_595185 ?auto_595195 ) ) ( not ( = ?auto_595185 ?auto_595196 ) ) ( not ( = ?auto_595186 ?auto_595187 ) ) ( not ( = ?auto_595186 ?auto_595188 ) ) ( not ( = ?auto_595186 ?auto_595189 ) ) ( not ( = ?auto_595186 ?auto_595190 ) ) ( not ( = ?auto_595186 ?auto_595191 ) ) ( not ( = ?auto_595186 ?auto_595192 ) ) ( not ( = ?auto_595186 ?auto_595193 ) ) ( not ( = ?auto_595186 ?auto_595194 ) ) ( not ( = ?auto_595186 ?auto_595195 ) ) ( not ( = ?auto_595186 ?auto_595196 ) ) ( not ( = ?auto_595187 ?auto_595188 ) ) ( not ( = ?auto_595187 ?auto_595189 ) ) ( not ( = ?auto_595187 ?auto_595190 ) ) ( not ( = ?auto_595187 ?auto_595191 ) ) ( not ( = ?auto_595187 ?auto_595192 ) ) ( not ( = ?auto_595187 ?auto_595193 ) ) ( not ( = ?auto_595187 ?auto_595194 ) ) ( not ( = ?auto_595187 ?auto_595195 ) ) ( not ( = ?auto_595187 ?auto_595196 ) ) ( not ( = ?auto_595188 ?auto_595189 ) ) ( not ( = ?auto_595188 ?auto_595190 ) ) ( not ( = ?auto_595188 ?auto_595191 ) ) ( not ( = ?auto_595188 ?auto_595192 ) ) ( not ( = ?auto_595188 ?auto_595193 ) ) ( not ( = ?auto_595188 ?auto_595194 ) ) ( not ( = ?auto_595188 ?auto_595195 ) ) ( not ( = ?auto_595188 ?auto_595196 ) ) ( not ( = ?auto_595189 ?auto_595190 ) ) ( not ( = ?auto_595189 ?auto_595191 ) ) ( not ( = ?auto_595189 ?auto_595192 ) ) ( not ( = ?auto_595189 ?auto_595193 ) ) ( not ( = ?auto_595189 ?auto_595194 ) ) ( not ( = ?auto_595189 ?auto_595195 ) ) ( not ( = ?auto_595189 ?auto_595196 ) ) ( not ( = ?auto_595190 ?auto_595191 ) ) ( not ( = ?auto_595190 ?auto_595192 ) ) ( not ( = ?auto_595190 ?auto_595193 ) ) ( not ( = ?auto_595190 ?auto_595194 ) ) ( not ( = ?auto_595190 ?auto_595195 ) ) ( not ( = ?auto_595190 ?auto_595196 ) ) ( not ( = ?auto_595191 ?auto_595192 ) ) ( not ( = ?auto_595191 ?auto_595193 ) ) ( not ( = ?auto_595191 ?auto_595194 ) ) ( not ( = ?auto_595191 ?auto_595195 ) ) ( not ( = ?auto_595191 ?auto_595196 ) ) ( not ( = ?auto_595192 ?auto_595193 ) ) ( not ( = ?auto_595192 ?auto_595194 ) ) ( not ( = ?auto_595192 ?auto_595195 ) ) ( not ( = ?auto_595192 ?auto_595196 ) ) ( not ( = ?auto_595193 ?auto_595194 ) ) ( not ( = ?auto_595193 ?auto_595195 ) ) ( not ( = ?auto_595193 ?auto_595196 ) ) ( not ( = ?auto_595194 ?auto_595195 ) ) ( not ( = ?auto_595194 ?auto_595196 ) ) ( not ( = ?auto_595195 ?auto_595196 ) ) ( ON ?auto_595194 ?auto_595195 ) ( ON ?auto_595193 ?auto_595194 ) ( ON ?auto_595192 ?auto_595193 ) ( ON ?auto_595191 ?auto_595192 ) ( ON ?auto_595190 ?auto_595191 ) ( ON ?auto_595189 ?auto_595190 ) ( ON ?auto_595188 ?auto_595189 ) ( CLEAR ?auto_595186 ) ( ON ?auto_595187 ?auto_595188 ) ( CLEAR ?auto_595187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_595181 ?auto_595182 ?auto_595183 ?auto_595184 ?auto_595185 ?auto_595186 ?auto_595187 )
      ( MAKE-15PILE ?auto_595181 ?auto_595182 ?auto_595183 ?auto_595184 ?auto_595185 ?auto_595186 ?auto_595187 ?auto_595188 ?auto_595189 ?auto_595190 ?auto_595191 ?auto_595192 ?auto_595193 ?auto_595194 ?auto_595195 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595243 - BLOCK
      ?auto_595244 - BLOCK
      ?auto_595245 - BLOCK
      ?auto_595246 - BLOCK
      ?auto_595247 - BLOCK
      ?auto_595248 - BLOCK
      ?auto_595249 - BLOCK
      ?auto_595250 - BLOCK
      ?auto_595251 - BLOCK
      ?auto_595252 - BLOCK
      ?auto_595253 - BLOCK
      ?auto_595254 - BLOCK
      ?auto_595255 - BLOCK
      ?auto_595256 - BLOCK
      ?auto_595257 - BLOCK
    )
    :vars
    (
      ?auto_595258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595257 ?auto_595258 ) ( ON-TABLE ?auto_595243 ) ( ON ?auto_595244 ?auto_595243 ) ( ON ?auto_595245 ?auto_595244 ) ( ON ?auto_595246 ?auto_595245 ) ( ON ?auto_595247 ?auto_595246 ) ( not ( = ?auto_595243 ?auto_595244 ) ) ( not ( = ?auto_595243 ?auto_595245 ) ) ( not ( = ?auto_595243 ?auto_595246 ) ) ( not ( = ?auto_595243 ?auto_595247 ) ) ( not ( = ?auto_595243 ?auto_595248 ) ) ( not ( = ?auto_595243 ?auto_595249 ) ) ( not ( = ?auto_595243 ?auto_595250 ) ) ( not ( = ?auto_595243 ?auto_595251 ) ) ( not ( = ?auto_595243 ?auto_595252 ) ) ( not ( = ?auto_595243 ?auto_595253 ) ) ( not ( = ?auto_595243 ?auto_595254 ) ) ( not ( = ?auto_595243 ?auto_595255 ) ) ( not ( = ?auto_595243 ?auto_595256 ) ) ( not ( = ?auto_595243 ?auto_595257 ) ) ( not ( = ?auto_595243 ?auto_595258 ) ) ( not ( = ?auto_595244 ?auto_595245 ) ) ( not ( = ?auto_595244 ?auto_595246 ) ) ( not ( = ?auto_595244 ?auto_595247 ) ) ( not ( = ?auto_595244 ?auto_595248 ) ) ( not ( = ?auto_595244 ?auto_595249 ) ) ( not ( = ?auto_595244 ?auto_595250 ) ) ( not ( = ?auto_595244 ?auto_595251 ) ) ( not ( = ?auto_595244 ?auto_595252 ) ) ( not ( = ?auto_595244 ?auto_595253 ) ) ( not ( = ?auto_595244 ?auto_595254 ) ) ( not ( = ?auto_595244 ?auto_595255 ) ) ( not ( = ?auto_595244 ?auto_595256 ) ) ( not ( = ?auto_595244 ?auto_595257 ) ) ( not ( = ?auto_595244 ?auto_595258 ) ) ( not ( = ?auto_595245 ?auto_595246 ) ) ( not ( = ?auto_595245 ?auto_595247 ) ) ( not ( = ?auto_595245 ?auto_595248 ) ) ( not ( = ?auto_595245 ?auto_595249 ) ) ( not ( = ?auto_595245 ?auto_595250 ) ) ( not ( = ?auto_595245 ?auto_595251 ) ) ( not ( = ?auto_595245 ?auto_595252 ) ) ( not ( = ?auto_595245 ?auto_595253 ) ) ( not ( = ?auto_595245 ?auto_595254 ) ) ( not ( = ?auto_595245 ?auto_595255 ) ) ( not ( = ?auto_595245 ?auto_595256 ) ) ( not ( = ?auto_595245 ?auto_595257 ) ) ( not ( = ?auto_595245 ?auto_595258 ) ) ( not ( = ?auto_595246 ?auto_595247 ) ) ( not ( = ?auto_595246 ?auto_595248 ) ) ( not ( = ?auto_595246 ?auto_595249 ) ) ( not ( = ?auto_595246 ?auto_595250 ) ) ( not ( = ?auto_595246 ?auto_595251 ) ) ( not ( = ?auto_595246 ?auto_595252 ) ) ( not ( = ?auto_595246 ?auto_595253 ) ) ( not ( = ?auto_595246 ?auto_595254 ) ) ( not ( = ?auto_595246 ?auto_595255 ) ) ( not ( = ?auto_595246 ?auto_595256 ) ) ( not ( = ?auto_595246 ?auto_595257 ) ) ( not ( = ?auto_595246 ?auto_595258 ) ) ( not ( = ?auto_595247 ?auto_595248 ) ) ( not ( = ?auto_595247 ?auto_595249 ) ) ( not ( = ?auto_595247 ?auto_595250 ) ) ( not ( = ?auto_595247 ?auto_595251 ) ) ( not ( = ?auto_595247 ?auto_595252 ) ) ( not ( = ?auto_595247 ?auto_595253 ) ) ( not ( = ?auto_595247 ?auto_595254 ) ) ( not ( = ?auto_595247 ?auto_595255 ) ) ( not ( = ?auto_595247 ?auto_595256 ) ) ( not ( = ?auto_595247 ?auto_595257 ) ) ( not ( = ?auto_595247 ?auto_595258 ) ) ( not ( = ?auto_595248 ?auto_595249 ) ) ( not ( = ?auto_595248 ?auto_595250 ) ) ( not ( = ?auto_595248 ?auto_595251 ) ) ( not ( = ?auto_595248 ?auto_595252 ) ) ( not ( = ?auto_595248 ?auto_595253 ) ) ( not ( = ?auto_595248 ?auto_595254 ) ) ( not ( = ?auto_595248 ?auto_595255 ) ) ( not ( = ?auto_595248 ?auto_595256 ) ) ( not ( = ?auto_595248 ?auto_595257 ) ) ( not ( = ?auto_595248 ?auto_595258 ) ) ( not ( = ?auto_595249 ?auto_595250 ) ) ( not ( = ?auto_595249 ?auto_595251 ) ) ( not ( = ?auto_595249 ?auto_595252 ) ) ( not ( = ?auto_595249 ?auto_595253 ) ) ( not ( = ?auto_595249 ?auto_595254 ) ) ( not ( = ?auto_595249 ?auto_595255 ) ) ( not ( = ?auto_595249 ?auto_595256 ) ) ( not ( = ?auto_595249 ?auto_595257 ) ) ( not ( = ?auto_595249 ?auto_595258 ) ) ( not ( = ?auto_595250 ?auto_595251 ) ) ( not ( = ?auto_595250 ?auto_595252 ) ) ( not ( = ?auto_595250 ?auto_595253 ) ) ( not ( = ?auto_595250 ?auto_595254 ) ) ( not ( = ?auto_595250 ?auto_595255 ) ) ( not ( = ?auto_595250 ?auto_595256 ) ) ( not ( = ?auto_595250 ?auto_595257 ) ) ( not ( = ?auto_595250 ?auto_595258 ) ) ( not ( = ?auto_595251 ?auto_595252 ) ) ( not ( = ?auto_595251 ?auto_595253 ) ) ( not ( = ?auto_595251 ?auto_595254 ) ) ( not ( = ?auto_595251 ?auto_595255 ) ) ( not ( = ?auto_595251 ?auto_595256 ) ) ( not ( = ?auto_595251 ?auto_595257 ) ) ( not ( = ?auto_595251 ?auto_595258 ) ) ( not ( = ?auto_595252 ?auto_595253 ) ) ( not ( = ?auto_595252 ?auto_595254 ) ) ( not ( = ?auto_595252 ?auto_595255 ) ) ( not ( = ?auto_595252 ?auto_595256 ) ) ( not ( = ?auto_595252 ?auto_595257 ) ) ( not ( = ?auto_595252 ?auto_595258 ) ) ( not ( = ?auto_595253 ?auto_595254 ) ) ( not ( = ?auto_595253 ?auto_595255 ) ) ( not ( = ?auto_595253 ?auto_595256 ) ) ( not ( = ?auto_595253 ?auto_595257 ) ) ( not ( = ?auto_595253 ?auto_595258 ) ) ( not ( = ?auto_595254 ?auto_595255 ) ) ( not ( = ?auto_595254 ?auto_595256 ) ) ( not ( = ?auto_595254 ?auto_595257 ) ) ( not ( = ?auto_595254 ?auto_595258 ) ) ( not ( = ?auto_595255 ?auto_595256 ) ) ( not ( = ?auto_595255 ?auto_595257 ) ) ( not ( = ?auto_595255 ?auto_595258 ) ) ( not ( = ?auto_595256 ?auto_595257 ) ) ( not ( = ?auto_595256 ?auto_595258 ) ) ( not ( = ?auto_595257 ?auto_595258 ) ) ( ON ?auto_595256 ?auto_595257 ) ( ON ?auto_595255 ?auto_595256 ) ( ON ?auto_595254 ?auto_595255 ) ( ON ?auto_595253 ?auto_595254 ) ( ON ?auto_595252 ?auto_595253 ) ( ON ?auto_595251 ?auto_595252 ) ( ON ?auto_595250 ?auto_595251 ) ( ON ?auto_595249 ?auto_595250 ) ( CLEAR ?auto_595247 ) ( ON ?auto_595248 ?auto_595249 ) ( CLEAR ?auto_595248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_595243 ?auto_595244 ?auto_595245 ?auto_595246 ?auto_595247 ?auto_595248 )
      ( MAKE-15PILE ?auto_595243 ?auto_595244 ?auto_595245 ?auto_595246 ?auto_595247 ?auto_595248 ?auto_595249 ?auto_595250 ?auto_595251 ?auto_595252 ?auto_595253 ?auto_595254 ?auto_595255 ?auto_595256 ?auto_595257 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595305 - BLOCK
      ?auto_595306 - BLOCK
      ?auto_595307 - BLOCK
      ?auto_595308 - BLOCK
      ?auto_595309 - BLOCK
      ?auto_595310 - BLOCK
      ?auto_595311 - BLOCK
      ?auto_595312 - BLOCK
      ?auto_595313 - BLOCK
      ?auto_595314 - BLOCK
      ?auto_595315 - BLOCK
      ?auto_595316 - BLOCK
      ?auto_595317 - BLOCK
      ?auto_595318 - BLOCK
      ?auto_595319 - BLOCK
    )
    :vars
    (
      ?auto_595320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595319 ?auto_595320 ) ( ON-TABLE ?auto_595305 ) ( ON ?auto_595306 ?auto_595305 ) ( ON ?auto_595307 ?auto_595306 ) ( ON ?auto_595308 ?auto_595307 ) ( not ( = ?auto_595305 ?auto_595306 ) ) ( not ( = ?auto_595305 ?auto_595307 ) ) ( not ( = ?auto_595305 ?auto_595308 ) ) ( not ( = ?auto_595305 ?auto_595309 ) ) ( not ( = ?auto_595305 ?auto_595310 ) ) ( not ( = ?auto_595305 ?auto_595311 ) ) ( not ( = ?auto_595305 ?auto_595312 ) ) ( not ( = ?auto_595305 ?auto_595313 ) ) ( not ( = ?auto_595305 ?auto_595314 ) ) ( not ( = ?auto_595305 ?auto_595315 ) ) ( not ( = ?auto_595305 ?auto_595316 ) ) ( not ( = ?auto_595305 ?auto_595317 ) ) ( not ( = ?auto_595305 ?auto_595318 ) ) ( not ( = ?auto_595305 ?auto_595319 ) ) ( not ( = ?auto_595305 ?auto_595320 ) ) ( not ( = ?auto_595306 ?auto_595307 ) ) ( not ( = ?auto_595306 ?auto_595308 ) ) ( not ( = ?auto_595306 ?auto_595309 ) ) ( not ( = ?auto_595306 ?auto_595310 ) ) ( not ( = ?auto_595306 ?auto_595311 ) ) ( not ( = ?auto_595306 ?auto_595312 ) ) ( not ( = ?auto_595306 ?auto_595313 ) ) ( not ( = ?auto_595306 ?auto_595314 ) ) ( not ( = ?auto_595306 ?auto_595315 ) ) ( not ( = ?auto_595306 ?auto_595316 ) ) ( not ( = ?auto_595306 ?auto_595317 ) ) ( not ( = ?auto_595306 ?auto_595318 ) ) ( not ( = ?auto_595306 ?auto_595319 ) ) ( not ( = ?auto_595306 ?auto_595320 ) ) ( not ( = ?auto_595307 ?auto_595308 ) ) ( not ( = ?auto_595307 ?auto_595309 ) ) ( not ( = ?auto_595307 ?auto_595310 ) ) ( not ( = ?auto_595307 ?auto_595311 ) ) ( not ( = ?auto_595307 ?auto_595312 ) ) ( not ( = ?auto_595307 ?auto_595313 ) ) ( not ( = ?auto_595307 ?auto_595314 ) ) ( not ( = ?auto_595307 ?auto_595315 ) ) ( not ( = ?auto_595307 ?auto_595316 ) ) ( not ( = ?auto_595307 ?auto_595317 ) ) ( not ( = ?auto_595307 ?auto_595318 ) ) ( not ( = ?auto_595307 ?auto_595319 ) ) ( not ( = ?auto_595307 ?auto_595320 ) ) ( not ( = ?auto_595308 ?auto_595309 ) ) ( not ( = ?auto_595308 ?auto_595310 ) ) ( not ( = ?auto_595308 ?auto_595311 ) ) ( not ( = ?auto_595308 ?auto_595312 ) ) ( not ( = ?auto_595308 ?auto_595313 ) ) ( not ( = ?auto_595308 ?auto_595314 ) ) ( not ( = ?auto_595308 ?auto_595315 ) ) ( not ( = ?auto_595308 ?auto_595316 ) ) ( not ( = ?auto_595308 ?auto_595317 ) ) ( not ( = ?auto_595308 ?auto_595318 ) ) ( not ( = ?auto_595308 ?auto_595319 ) ) ( not ( = ?auto_595308 ?auto_595320 ) ) ( not ( = ?auto_595309 ?auto_595310 ) ) ( not ( = ?auto_595309 ?auto_595311 ) ) ( not ( = ?auto_595309 ?auto_595312 ) ) ( not ( = ?auto_595309 ?auto_595313 ) ) ( not ( = ?auto_595309 ?auto_595314 ) ) ( not ( = ?auto_595309 ?auto_595315 ) ) ( not ( = ?auto_595309 ?auto_595316 ) ) ( not ( = ?auto_595309 ?auto_595317 ) ) ( not ( = ?auto_595309 ?auto_595318 ) ) ( not ( = ?auto_595309 ?auto_595319 ) ) ( not ( = ?auto_595309 ?auto_595320 ) ) ( not ( = ?auto_595310 ?auto_595311 ) ) ( not ( = ?auto_595310 ?auto_595312 ) ) ( not ( = ?auto_595310 ?auto_595313 ) ) ( not ( = ?auto_595310 ?auto_595314 ) ) ( not ( = ?auto_595310 ?auto_595315 ) ) ( not ( = ?auto_595310 ?auto_595316 ) ) ( not ( = ?auto_595310 ?auto_595317 ) ) ( not ( = ?auto_595310 ?auto_595318 ) ) ( not ( = ?auto_595310 ?auto_595319 ) ) ( not ( = ?auto_595310 ?auto_595320 ) ) ( not ( = ?auto_595311 ?auto_595312 ) ) ( not ( = ?auto_595311 ?auto_595313 ) ) ( not ( = ?auto_595311 ?auto_595314 ) ) ( not ( = ?auto_595311 ?auto_595315 ) ) ( not ( = ?auto_595311 ?auto_595316 ) ) ( not ( = ?auto_595311 ?auto_595317 ) ) ( not ( = ?auto_595311 ?auto_595318 ) ) ( not ( = ?auto_595311 ?auto_595319 ) ) ( not ( = ?auto_595311 ?auto_595320 ) ) ( not ( = ?auto_595312 ?auto_595313 ) ) ( not ( = ?auto_595312 ?auto_595314 ) ) ( not ( = ?auto_595312 ?auto_595315 ) ) ( not ( = ?auto_595312 ?auto_595316 ) ) ( not ( = ?auto_595312 ?auto_595317 ) ) ( not ( = ?auto_595312 ?auto_595318 ) ) ( not ( = ?auto_595312 ?auto_595319 ) ) ( not ( = ?auto_595312 ?auto_595320 ) ) ( not ( = ?auto_595313 ?auto_595314 ) ) ( not ( = ?auto_595313 ?auto_595315 ) ) ( not ( = ?auto_595313 ?auto_595316 ) ) ( not ( = ?auto_595313 ?auto_595317 ) ) ( not ( = ?auto_595313 ?auto_595318 ) ) ( not ( = ?auto_595313 ?auto_595319 ) ) ( not ( = ?auto_595313 ?auto_595320 ) ) ( not ( = ?auto_595314 ?auto_595315 ) ) ( not ( = ?auto_595314 ?auto_595316 ) ) ( not ( = ?auto_595314 ?auto_595317 ) ) ( not ( = ?auto_595314 ?auto_595318 ) ) ( not ( = ?auto_595314 ?auto_595319 ) ) ( not ( = ?auto_595314 ?auto_595320 ) ) ( not ( = ?auto_595315 ?auto_595316 ) ) ( not ( = ?auto_595315 ?auto_595317 ) ) ( not ( = ?auto_595315 ?auto_595318 ) ) ( not ( = ?auto_595315 ?auto_595319 ) ) ( not ( = ?auto_595315 ?auto_595320 ) ) ( not ( = ?auto_595316 ?auto_595317 ) ) ( not ( = ?auto_595316 ?auto_595318 ) ) ( not ( = ?auto_595316 ?auto_595319 ) ) ( not ( = ?auto_595316 ?auto_595320 ) ) ( not ( = ?auto_595317 ?auto_595318 ) ) ( not ( = ?auto_595317 ?auto_595319 ) ) ( not ( = ?auto_595317 ?auto_595320 ) ) ( not ( = ?auto_595318 ?auto_595319 ) ) ( not ( = ?auto_595318 ?auto_595320 ) ) ( not ( = ?auto_595319 ?auto_595320 ) ) ( ON ?auto_595318 ?auto_595319 ) ( ON ?auto_595317 ?auto_595318 ) ( ON ?auto_595316 ?auto_595317 ) ( ON ?auto_595315 ?auto_595316 ) ( ON ?auto_595314 ?auto_595315 ) ( ON ?auto_595313 ?auto_595314 ) ( ON ?auto_595312 ?auto_595313 ) ( ON ?auto_595311 ?auto_595312 ) ( ON ?auto_595310 ?auto_595311 ) ( CLEAR ?auto_595308 ) ( ON ?auto_595309 ?auto_595310 ) ( CLEAR ?auto_595309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_595305 ?auto_595306 ?auto_595307 ?auto_595308 ?auto_595309 )
      ( MAKE-15PILE ?auto_595305 ?auto_595306 ?auto_595307 ?auto_595308 ?auto_595309 ?auto_595310 ?auto_595311 ?auto_595312 ?auto_595313 ?auto_595314 ?auto_595315 ?auto_595316 ?auto_595317 ?auto_595318 ?auto_595319 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595367 - BLOCK
      ?auto_595368 - BLOCK
      ?auto_595369 - BLOCK
      ?auto_595370 - BLOCK
      ?auto_595371 - BLOCK
      ?auto_595372 - BLOCK
      ?auto_595373 - BLOCK
      ?auto_595374 - BLOCK
      ?auto_595375 - BLOCK
      ?auto_595376 - BLOCK
      ?auto_595377 - BLOCK
      ?auto_595378 - BLOCK
      ?auto_595379 - BLOCK
      ?auto_595380 - BLOCK
      ?auto_595381 - BLOCK
    )
    :vars
    (
      ?auto_595382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595381 ?auto_595382 ) ( ON-TABLE ?auto_595367 ) ( ON ?auto_595368 ?auto_595367 ) ( ON ?auto_595369 ?auto_595368 ) ( not ( = ?auto_595367 ?auto_595368 ) ) ( not ( = ?auto_595367 ?auto_595369 ) ) ( not ( = ?auto_595367 ?auto_595370 ) ) ( not ( = ?auto_595367 ?auto_595371 ) ) ( not ( = ?auto_595367 ?auto_595372 ) ) ( not ( = ?auto_595367 ?auto_595373 ) ) ( not ( = ?auto_595367 ?auto_595374 ) ) ( not ( = ?auto_595367 ?auto_595375 ) ) ( not ( = ?auto_595367 ?auto_595376 ) ) ( not ( = ?auto_595367 ?auto_595377 ) ) ( not ( = ?auto_595367 ?auto_595378 ) ) ( not ( = ?auto_595367 ?auto_595379 ) ) ( not ( = ?auto_595367 ?auto_595380 ) ) ( not ( = ?auto_595367 ?auto_595381 ) ) ( not ( = ?auto_595367 ?auto_595382 ) ) ( not ( = ?auto_595368 ?auto_595369 ) ) ( not ( = ?auto_595368 ?auto_595370 ) ) ( not ( = ?auto_595368 ?auto_595371 ) ) ( not ( = ?auto_595368 ?auto_595372 ) ) ( not ( = ?auto_595368 ?auto_595373 ) ) ( not ( = ?auto_595368 ?auto_595374 ) ) ( not ( = ?auto_595368 ?auto_595375 ) ) ( not ( = ?auto_595368 ?auto_595376 ) ) ( not ( = ?auto_595368 ?auto_595377 ) ) ( not ( = ?auto_595368 ?auto_595378 ) ) ( not ( = ?auto_595368 ?auto_595379 ) ) ( not ( = ?auto_595368 ?auto_595380 ) ) ( not ( = ?auto_595368 ?auto_595381 ) ) ( not ( = ?auto_595368 ?auto_595382 ) ) ( not ( = ?auto_595369 ?auto_595370 ) ) ( not ( = ?auto_595369 ?auto_595371 ) ) ( not ( = ?auto_595369 ?auto_595372 ) ) ( not ( = ?auto_595369 ?auto_595373 ) ) ( not ( = ?auto_595369 ?auto_595374 ) ) ( not ( = ?auto_595369 ?auto_595375 ) ) ( not ( = ?auto_595369 ?auto_595376 ) ) ( not ( = ?auto_595369 ?auto_595377 ) ) ( not ( = ?auto_595369 ?auto_595378 ) ) ( not ( = ?auto_595369 ?auto_595379 ) ) ( not ( = ?auto_595369 ?auto_595380 ) ) ( not ( = ?auto_595369 ?auto_595381 ) ) ( not ( = ?auto_595369 ?auto_595382 ) ) ( not ( = ?auto_595370 ?auto_595371 ) ) ( not ( = ?auto_595370 ?auto_595372 ) ) ( not ( = ?auto_595370 ?auto_595373 ) ) ( not ( = ?auto_595370 ?auto_595374 ) ) ( not ( = ?auto_595370 ?auto_595375 ) ) ( not ( = ?auto_595370 ?auto_595376 ) ) ( not ( = ?auto_595370 ?auto_595377 ) ) ( not ( = ?auto_595370 ?auto_595378 ) ) ( not ( = ?auto_595370 ?auto_595379 ) ) ( not ( = ?auto_595370 ?auto_595380 ) ) ( not ( = ?auto_595370 ?auto_595381 ) ) ( not ( = ?auto_595370 ?auto_595382 ) ) ( not ( = ?auto_595371 ?auto_595372 ) ) ( not ( = ?auto_595371 ?auto_595373 ) ) ( not ( = ?auto_595371 ?auto_595374 ) ) ( not ( = ?auto_595371 ?auto_595375 ) ) ( not ( = ?auto_595371 ?auto_595376 ) ) ( not ( = ?auto_595371 ?auto_595377 ) ) ( not ( = ?auto_595371 ?auto_595378 ) ) ( not ( = ?auto_595371 ?auto_595379 ) ) ( not ( = ?auto_595371 ?auto_595380 ) ) ( not ( = ?auto_595371 ?auto_595381 ) ) ( not ( = ?auto_595371 ?auto_595382 ) ) ( not ( = ?auto_595372 ?auto_595373 ) ) ( not ( = ?auto_595372 ?auto_595374 ) ) ( not ( = ?auto_595372 ?auto_595375 ) ) ( not ( = ?auto_595372 ?auto_595376 ) ) ( not ( = ?auto_595372 ?auto_595377 ) ) ( not ( = ?auto_595372 ?auto_595378 ) ) ( not ( = ?auto_595372 ?auto_595379 ) ) ( not ( = ?auto_595372 ?auto_595380 ) ) ( not ( = ?auto_595372 ?auto_595381 ) ) ( not ( = ?auto_595372 ?auto_595382 ) ) ( not ( = ?auto_595373 ?auto_595374 ) ) ( not ( = ?auto_595373 ?auto_595375 ) ) ( not ( = ?auto_595373 ?auto_595376 ) ) ( not ( = ?auto_595373 ?auto_595377 ) ) ( not ( = ?auto_595373 ?auto_595378 ) ) ( not ( = ?auto_595373 ?auto_595379 ) ) ( not ( = ?auto_595373 ?auto_595380 ) ) ( not ( = ?auto_595373 ?auto_595381 ) ) ( not ( = ?auto_595373 ?auto_595382 ) ) ( not ( = ?auto_595374 ?auto_595375 ) ) ( not ( = ?auto_595374 ?auto_595376 ) ) ( not ( = ?auto_595374 ?auto_595377 ) ) ( not ( = ?auto_595374 ?auto_595378 ) ) ( not ( = ?auto_595374 ?auto_595379 ) ) ( not ( = ?auto_595374 ?auto_595380 ) ) ( not ( = ?auto_595374 ?auto_595381 ) ) ( not ( = ?auto_595374 ?auto_595382 ) ) ( not ( = ?auto_595375 ?auto_595376 ) ) ( not ( = ?auto_595375 ?auto_595377 ) ) ( not ( = ?auto_595375 ?auto_595378 ) ) ( not ( = ?auto_595375 ?auto_595379 ) ) ( not ( = ?auto_595375 ?auto_595380 ) ) ( not ( = ?auto_595375 ?auto_595381 ) ) ( not ( = ?auto_595375 ?auto_595382 ) ) ( not ( = ?auto_595376 ?auto_595377 ) ) ( not ( = ?auto_595376 ?auto_595378 ) ) ( not ( = ?auto_595376 ?auto_595379 ) ) ( not ( = ?auto_595376 ?auto_595380 ) ) ( not ( = ?auto_595376 ?auto_595381 ) ) ( not ( = ?auto_595376 ?auto_595382 ) ) ( not ( = ?auto_595377 ?auto_595378 ) ) ( not ( = ?auto_595377 ?auto_595379 ) ) ( not ( = ?auto_595377 ?auto_595380 ) ) ( not ( = ?auto_595377 ?auto_595381 ) ) ( not ( = ?auto_595377 ?auto_595382 ) ) ( not ( = ?auto_595378 ?auto_595379 ) ) ( not ( = ?auto_595378 ?auto_595380 ) ) ( not ( = ?auto_595378 ?auto_595381 ) ) ( not ( = ?auto_595378 ?auto_595382 ) ) ( not ( = ?auto_595379 ?auto_595380 ) ) ( not ( = ?auto_595379 ?auto_595381 ) ) ( not ( = ?auto_595379 ?auto_595382 ) ) ( not ( = ?auto_595380 ?auto_595381 ) ) ( not ( = ?auto_595380 ?auto_595382 ) ) ( not ( = ?auto_595381 ?auto_595382 ) ) ( ON ?auto_595380 ?auto_595381 ) ( ON ?auto_595379 ?auto_595380 ) ( ON ?auto_595378 ?auto_595379 ) ( ON ?auto_595377 ?auto_595378 ) ( ON ?auto_595376 ?auto_595377 ) ( ON ?auto_595375 ?auto_595376 ) ( ON ?auto_595374 ?auto_595375 ) ( ON ?auto_595373 ?auto_595374 ) ( ON ?auto_595372 ?auto_595373 ) ( ON ?auto_595371 ?auto_595372 ) ( CLEAR ?auto_595369 ) ( ON ?auto_595370 ?auto_595371 ) ( CLEAR ?auto_595370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_595367 ?auto_595368 ?auto_595369 ?auto_595370 )
      ( MAKE-15PILE ?auto_595367 ?auto_595368 ?auto_595369 ?auto_595370 ?auto_595371 ?auto_595372 ?auto_595373 ?auto_595374 ?auto_595375 ?auto_595376 ?auto_595377 ?auto_595378 ?auto_595379 ?auto_595380 ?auto_595381 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595429 - BLOCK
      ?auto_595430 - BLOCK
      ?auto_595431 - BLOCK
      ?auto_595432 - BLOCK
      ?auto_595433 - BLOCK
      ?auto_595434 - BLOCK
      ?auto_595435 - BLOCK
      ?auto_595436 - BLOCK
      ?auto_595437 - BLOCK
      ?auto_595438 - BLOCK
      ?auto_595439 - BLOCK
      ?auto_595440 - BLOCK
      ?auto_595441 - BLOCK
      ?auto_595442 - BLOCK
      ?auto_595443 - BLOCK
    )
    :vars
    (
      ?auto_595444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595443 ?auto_595444 ) ( ON-TABLE ?auto_595429 ) ( ON ?auto_595430 ?auto_595429 ) ( not ( = ?auto_595429 ?auto_595430 ) ) ( not ( = ?auto_595429 ?auto_595431 ) ) ( not ( = ?auto_595429 ?auto_595432 ) ) ( not ( = ?auto_595429 ?auto_595433 ) ) ( not ( = ?auto_595429 ?auto_595434 ) ) ( not ( = ?auto_595429 ?auto_595435 ) ) ( not ( = ?auto_595429 ?auto_595436 ) ) ( not ( = ?auto_595429 ?auto_595437 ) ) ( not ( = ?auto_595429 ?auto_595438 ) ) ( not ( = ?auto_595429 ?auto_595439 ) ) ( not ( = ?auto_595429 ?auto_595440 ) ) ( not ( = ?auto_595429 ?auto_595441 ) ) ( not ( = ?auto_595429 ?auto_595442 ) ) ( not ( = ?auto_595429 ?auto_595443 ) ) ( not ( = ?auto_595429 ?auto_595444 ) ) ( not ( = ?auto_595430 ?auto_595431 ) ) ( not ( = ?auto_595430 ?auto_595432 ) ) ( not ( = ?auto_595430 ?auto_595433 ) ) ( not ( = ?auto_595430 ?auto_595434 ) ) ( not ( = ?auto_595430 ?auto_595435 ) ) ( not ( = ?auto_595430 ?auto_595436 ) ) ( not ( = ?auto_595430 ?auto_595437 ) ) ( not ( = ?auto_595430 ?auto_595438 ) ) ( not ( = ?auto_595430 ?auto_595439 ) ) ( not ( = ?auto_595430 ?auto_595440 ) ) ( not ( = ?auto_595430 ?auto_595441 ) ) ( not ( = ?auto_595430 ?auto_595442 ) ) ( not ( = ?auto_595430 ?auto_595443 ) ) ( not ( = ?auto_595430 ?auto_595444 ) ) ( not ( = ?auto_595431 ?auto_595432 ) ) ( not ( = ?auto_595431 ?auto_595433 ) ) ( not ( = ?auto_595431 ?auto_595434 ) ) ( not ( = ?auto_595431 ?auto_595435 ) ) ( not ( = ?auto_595431 ?auto_595436 ) ) ( not ( = ?auto_595431 ?auto_595437 ) ) ( not ( = ?auto_595431 ?auto_595438 ) ) ( not ( = ?auto_595431 ?auto_595439 ) ) ( not ( = ?auto_595431 ?auto_595440 ) ) ( not ( = ?auto_595431 ?auto_595441 ) ) ( not ( = ?auto_595431 ?auto_595442 ) ) ( not ( = ?auto_595431 ?auto_595443 ) ) ( not ( = ?auto_595431 ?auto_595444 ) ) ( not ( = ?auto_595432 ?auto_595433 ) ) ( not ( = ?auto_595432 ?auto_595434 ) ) ( not ( = ?auto_595432 ?auto_595435 ) ) ( not ( = ?auto_595432 ?auto_595436 ) ) ( not ( = ?auto_595432 ?auto_595437 ) ) ( not ( = ?auto_595432 ?auto_595438 ) ) ( not ( = ?auto_595432 ?auto_595439 ) ) ( not ( = ?auto_595432 ?auto_595440 ) ) ( not ( = ?auto_595432 ?auto_595441 ) ) ( not ( = ?auto_595432 ?auto_595442 ) ) ( not ( = ?auto_595432 ?auto_595443 ) ) ( not ( = ?auto_595432 ?auto_595444 ) ) ( not ( = ?auto_595433 ?auto_595434 ) ) ( not ( = ?auto_595433 ?auto_595435 ) ) ( not ( = ?auto_595433 ?auto_595436 ) ) ( not ( = ?auto_595433 ?auto_595437 ) ) ( not ( = ?auto_595433 ?auto_595438 ) ) ( not ( = ?auto_595433 ?auto_595439 ) ) ( not ( = ?auto_595433 ?auto_595440 ) ) ( not ( = ?auto_595433 ?auto_595441 ) ) ( not ( = ?auto_595433 ?auto_595442 ) ) ( not ( = ?auto_595433 ?auto_595443 ) ) ( not ( = ?auto_595433 ?auto_595444 ) ) ( not ( = ?auto_595434 ?auto_595435 ) ) ( not ( = ?auto_595434 ?auto_595436 ) ) ( not ( = ?auto_595434 ?auto_595437 ) ) ( not ( = ?auto_595434 ?auto_595438 ) ) ( not ( = ?auto_595434 ?auto_595439 ) ) ( not ( = ?auto_595434 ?auto_595440 ) ) ( not ( = ?auto_595434 ?auto_595441 ) ) ( not ( = ?auto_595434 ?auto_595442 ) ) ( not ( = ?auto_595434 ?auto_595443 ) ) ( not ( = ?auto_595434 ?auto_595444 ) ) ( not ( = ?auto_595435 ?auto_595436 ) ) ( not ( = ?auto_595435 ?auto_595437 ) ) ( not ( = ?auto_595435 ?auto_595438 ) ) ( not ( = ?auto_595435 ?auto_595439 ) ) ( not ( = ?auto_595435 ?auto_595440 ) ) ( not ( = ?auto_595435 ?auto_595441 ) ) ( not ( = ?auto_595435 ?auto_595442 ) ) ( not ( = ?auto_595435 ?auto_595443 ) ) ( not ( = ?auto_595435 ?auto_595444 ) ) ( not ( = ?auto_595436 ?auto_595437 ) ) ( not ( = ?auto_595436 ?auto_595438 ) ) ( not ( = ?auto_595436 ?auto_595439 ) ) ( not ( = ?auto_595436 ?auto_595440 ) ) ( not ( = ?auto_595436 ?auto_595441 ) ) ( not ( = ?auto_595436 ?auto_595442 ) ) ( not ( = ?auto_595436 ?auto_595443 ) ) ( not ( = ?auto_595436 ?auto_595444 ) ) ( not ( = ?auto_595437 ?auto_595438 ) ) ( not ( = ?auto_595437 ?auto_595439 ) ) ( not ( = ?auto_595437 ?auto_595440 ) ) ( not ( = ?auto_595437 ?auto_595441 ) ) ( not ( = ?auto_595437 ?auto_595442 ) ) ( not ( = ?auto_595437 ?auto_595443 ) ) ( not ( = ?auto_595437 ?auto_595444 ) ) ( not ( = ?auto_595438 ?auto_595439 ) ) ( not ( = ?auto_595438 ?auto_595440 ) ) ( not ( = ?auto_595438 ?auto_595441 ) ) ( not ( = ?auto_595438 ?auto_595442 ) ) ( not ( = ?auto_595438 ?auto_595443 ) ) ( not ( = ?auto_595438 ?auto_595444 ) ) ( not ( = ?auto_595439 ?auto_595440 ) ) ( not ( = ?auto_595439 ?auto_595441 ) ) ( not ( = ?auto_595439 ?auto_595442 ) ) ( not ( = ?auto_595439 ?auto_595443 ) ) ( not ( = ?auto_595439 ?auto_595444 ) ) ( not ( = ?auto_595440 ?auto_595441 ) ) ( not ( = ?auto_595440 ?auto_595442 ) ) ( not ( = ?auto_595440 ?auto_595443 ) ) ( not ( = ?auto_595440 ?auto_595444 ) ) ( not ( = ?auto_595441 ?auto_595442 ) ) ( not ( = ?auto_595441 ?auto_595443 ) ) ( not ( = ?auto_595441 ?auto_595444 ) ) ( not ( = ?auto_595442 ?auto_595443 ) ) ( not ( = ?auto_595442 ?auto_595444 ) ) ( not ( = ?auto_595443 ?auto_595444 ) ) ( ON ?auto_595442 ?auto_595443 ) ( ON ?auto_595441 ?auto_595442 ) ( ON ?auto_595440 ?auto_595441 ) ( ON ?auto_595439 ?auto_595440 ) ( ON ?auto_595438 ?auto_595439 ) ( ON ?auto_595437 ?auto_595438 ) ( ON ?auto_595436 ?auto_595437 ) ( ON ?auto_595435 ?auto_595436 ) ( ON ?auto_595434 ?auto_595435 ) ( ON ?auto_595433 ?auto_595434 ) ( ON ?auto_595432 ?auto_595433 ) ( CLEAR ?auto_595430 ) ( ON ?auto_595431 ?auto_595432 ) ( CLEAR ?auto_595431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_595429 ?auto_595430 ?auto_595431 )
      ( MAKE-15PILE ?auto_595429 ?auto_595430 ?auto_595431 ?auto_595432 ?auto_595433 ?auto_595434 ?auto_595435 ?auto_595436 ?auto_595437 ?auto_595438 ?auto_595439 ?auto_595440 ?auto_595441 ?auto_595442 ?auto_595443 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595491 - BLOCK
      ?auto_595492 - BLOCK
      ?auto_595493 - BLOCK
      ?auto_595494 - BLOCK
      ?auto_595495 - BLOCK
      ?auto_595496 - BLOCK
      ?auto_595497 - BLOCK
      ?auto_595498 - BLOCK
      ?auto_595499 - BLOCK
      ?auto_595500 - BLOCK
      ?auto_595501 - BLOCK
      ?auto_595502 - BLOCK
      ?auto_595503 - BLOCK
      ?auto_595504 - BLOCK
      ?auto_595505 - BLOCK
    )
    :vars
    (
      ?auto_595506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595505 ?auto_595506 ) ( ON-TABLE ?auto_595491 ) ( not ( = ?auto_595491 ?auto_595492 ) ) ( not ( = ?auto_595491 ?auto_595493 ) ) ( not ( = ?auto_595491 ?auto_595494 ) ) ( not ( = ?auto_595491 ?auto_595495 ) ) ( not ( = ?auto_595491 ?auto_595496 ) ) ( not ( = ?auto_595491 ?auto_595497 ) ) ( not ( = ?auto_595491 ?auto_595498 ) ) ( not ( = ?auto_595491 ?auto_595499 ) ) ( not ( = ?auto_595491 ?auto_595500 ) ) ( not ( = ?auto_595491 ?auto_595501 ) ) ( not ( = ?auto_595491 ?auto_595502 ) ) ( not ( = ?auto_595491 ?auto_595503 ) ) ( not ( = ?auto_595491 ?auto_595504 ) ) ( not ( = ?auto_595491 ?auto_595505 ) ) ( not ( = ?auto_595491 ?auto_595506 ) ) ( not ( = ?auto_595492 ?auto_595493 ) ) ( not ( = ?auto_595492 ?auto_595494 ) ) ( not ( = ?auto_595492 ?auto_595495 ) ) ( not ( = ?auto_595492 ?auto_595496 ) ) ( not ( = ?auto_595492 ?auto_595497 ) ) ( not ( = ?auto_595492 ?auto_595498 ) ) ( not ( = ?auto_595492 ?auto_595499 ) ) ( not ( = ?auto_595492 ?auto_595500 ) ) ( not ( = ?auto_595492 ?auto_595501 ) ) ( not ( = ?auto_595492 ?auto_595502 ) ) ( not ( = ?auto_595492 ?auto_595503 ) ) ( not ( = ?auto_595492 ?auto_595504 ) ) ( not ( = ?auto_595492 ?auto_595505 ) ) ( not ( = ?auto_595492 ?auto_595506 ) ) ( not ( = ?auto_595493 ?auto_595494 ) ) ( not ( = ?auto_595493 ?auto_595495 ) ) ( not ( = ?auto_595493 ?auto_595496 ) ) ( not ( = ?auto_595493 ?auto_595497 ) ) ( not ( = ?auto_595493 ?auto_595498 ) ) ( not ( = ?auto_595493 ?auto_595499 ) ) ( not ( = ?auto_595493 ?auto_595500 ) ) ( not ( = ?auto_595493 ?auto_595501 ) ) ( not ( = ?auto_595493 ?auto_595502 ) ) ( not ( = ?auto_595493 ?auto_595503 ) ) ( not ( = ?auto_595493 ?auto_595504 ) ) ( not ( = ?auto_595493 ?auto_595505 ) ) ( not ( = ?auto_595493 ?auto_595506 ) ) ( not ( = ?auto_595494 ?auto_595495 ) ) ( not ( = ?auto_595494 ?auto_595496 ) ) ( not ( = ?auto_595494 ?auto_595497 ) ) ( not ( = ?auto_595494 ?auto_595498 ) ) ( not ( = ?auto_595494 ?auto_595499 ) ) ( not ( = ?auto_595494 ?auto_595500 ) ) ( not ( = ?auto_595494 ?auto_595501 ) ) ( not ( = ?auto_595494 ?auto_595502 ) ) ( not ( = ?auto_595494 ?auto_595503 ) ) ( not ( = ?auto_595494 ?auto_595504 ) ) ( not ( = ?auto_595494 ?auto_595505 ) ) ( not ( = ?auto_595494 ?auto_595506 ) ) ( not ( = ?auto_595495 ?auto_595496 ) ) ( not ( = ?auto_595495 ?auto_595497 ) ) ( not ( = ?auto_595495 ?auto_595498 ) ) ( not ( = ?auto_595495 ?auto_595499 ) ) ( not ( = ?auto_595495 ?auto_595500 ) ) ( not ( = ?auto_595495 ?auto_595501 ) ) ( not ( = ?auto_595495 ?auto_595502 ) ) ( not ( = ?auto_595495 ?auto_595503 ) ) ( not ( = ?auto_595495 ?auto_595504 ) ) ( not ( = ?auto_595495 ?auto_595505 ) ) ( not ( = ?auto_595495 ?auto_595506 ) ) ( not ( = ?auto_595496 ?auto_595497 ) ) ( not ( = ?auto_595496 ?auto_595498 ) ) ( not ( = ?auto_595496 ?auto_595499 ) ) ( not ( = ?auto_595496 ?auto_595500 ) ) ( not ( = ?auto_595496 ?auto_595501 ) ) ( not ( = ?auto_595496 ?auto_595502 ) ) ( not ( = ?auto_595496 ?auto_595503 ) ) ( not ( = ?auto_595496 ?auto_595504 ) ) ( not ( = ?auto_595496 ?auto_595505 ) ) ( not ( = ?auto_595496 ?auto_595506 ) ) ( not ( = ?auto_595497 ?auto_595498 ) ) ( not ( = ?auto_595497 ?auto_595499 ) ) ( not ( = ?auto_595497 ?auto_595500 ) ) ( not ( = ?auto_595497 ?auto_595501 ) ) ( not ( = ?auto_595497 ?auto_595502 ) ) ( not ( = ?auto_595497 ?auto_595503 ) ) ( not ( = ?auto_595497 ?auto_595504 ) ) ( not ( = ?auto_595497 ?auto_595505 ) ) ( not ( = ?auto_595497 ?auto_595506 ) ) ( not ( = ?auto_595498 ?auto_595499 ) ) ( not ( = ?auto_595498 ?auto_595500 ) ) ( not ( = ?auto_595498 ?auto_595501 ) ) ( not ( = ?auto_595498 ?auto_595502 ) ) ( not ( = ?auto_595498 ?auto_595503 ) ) ( not ( = ?auto_595498 ?auto_595504 ) ) ( not ( = ?auto_595498 ?auto_595505 ) ) ( not ( = ?auto_595498 ?auto_595506 ) ) ( not ( = ?auto_595499 ?auto_595500 ) ) ( not ( = ?auto_595499 ?auto_595501 ) ) ( not ( = ?auto_595499 ?auto_595502 ) ) ( not ( = ?auto_595499 ?auto_595503 ) ) ( not ( = ?auto_595499 ?auto_595504 ) ) ( not ( = ?auto_595499 ?auto_595505 ) ) ( not ( = ?auto_595499 ?auto_595506 ) ) ( not ( = ?auto_595500 ?auto_595501 ) ) ( not ( = ?auto_595500 ?auto_595502 ) ) ( not ( = ?auto_595500 ?auto_595503 ) ) ( not ( = ?auto_595500 ?auto_595504 ) ) ( not ( = ?auto_595500 ?auto_595505 ) ) ( not ( = ?auto_595500 ?auto_595506 ) ) ( not ( = ?auto_595501 ?auto_595502 ) ) ( not ( = ?auto_595501 ?auto_595503 ) ) ( not ( = ?auto_595501 ?auto_595504 ) ) ( not ( = ?auto_595501 ?auto_595505 ) ) ( not ( = ?auto_595501 ?auto_595506 ) ) ( not ( = ?auto_595502 ?auto_595503 ) ) ( not ( = ?auto_595502 ?auto_595504 ) ) ( not ( = ?auto_595502 ?auto_595505 ) ) ( not ( = ?auto_595502 ?auto_595506 ) ) ( not ( = ?auto_595503 ?auto_595504 ) ) ( not ( = ?auto_595503 ?auto_595505 ) ) ( not ( = ?auto_595503 ?auto_595506 ) ) ( not ( = ?auto_595504 ?auto_595505 ) ) ( not ( = ?auto_595504 ?auto_595506 ) ) ( not ( = ?auto_595505 ?auto_595506 ) ) ( ON ?auto_595504 ?auto_595505 ) ( ON ?auto_595503 ?auto_595504 ) ( ON ?auto_595502 ?auto_595503 ) ( ON ?auto_595501 ?auto_595502 ) ( ON ?auto_595500 ?auto_595501 ) ( ON ?auto_595499 ?auto_595500 ) ( ON ?auto_595498 ?auto_595499 ) ( ON ?auto_595497 ?auto_595498 ) ( ON ?auto_595496 ?auto_595497 ) ( ON ?auto_595495 ?auto_595496 ) ( ON ?auto_595494 ?auto_595495 ) ( ON ?auto_595493 ?auto_595494 ) ( CLEAR ?auto_595491 ) ( ON ?auto_595492 ?auto_595493 ) ( CLEAR ?auto_595492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_595491 ?auto_595492 )
      ( MAKE-15PILE ?auto_595491 ?auto_595492 ?auto_595493 ?auto_595494 ?auto_595495 ?auto_595496 ?auto_595497 ?auto_595498 ?auto_595499 ?auto_595500 ?auto_595501 ?auto_595502 ?auto_595503 ?auto_595504 ?auto_595505 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_595553 - BLOCK
      ?auto_595554 - BLOCK
      ?auto_595555 - BLOCK
      ?auto_595556 - BLOCK
      ?auto_595557 - BLOCK
      ?auto_595558 - BLOCK
      ?auto_595559 - BLOCK
      ?auto_595560 - BLOCK
      ?auto_595561 - BLOCK
      ?auto_595562 - BLOCK
      ?auto_595563 - BLOCK
      ?auto_595564 - BLOCK
      ?auto_595565 - BLOCK
      ?auto_595566 - BLOCK
      ?auto_595567 - BLOCK
    )
    :vars
    (
      ?auto_595568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595567 ?auto_595568 ) ( not ( = ?auto_595553 ?auto_595554 ) ) ( not ( = ?auto_595553 ?auto_595555 ) ) ( not ( = ?auto_595553 ?auto_595556 ) ) ( not ( = ?auto_595553 ?auto_595557 ) ) ( not ( = ?auto_595553 ?auto_595558 ) ) ( not ( = ?auto_595553 ?auto_595559 ) ) ( not ( = ?auto_595553 ?auto_595560 ) ) ( not ( = ?auto_595553 ?auto_595561 ) ) ( not ( = ?auto_595553 ?auto_595562 ) ) ( not ( = ?auto_595553 ?auto_595563 ) ) ( not ( = ?auto_595553 ?auto_595564 ) ) ( not ( = ?auto_595553 ?auto_595565 ) ) ( not ( = ?auto_595553 ?auto_595566 ) ) ( not ( = ?auto_595553 ?auto_595567 ) ) ( not ( = ?auto_595553 ?auto_595568 ) ) ( not ( = ?auto_595554 ?auto_595555 ) ) ( not ( = ?auto_595554 ?auto_595556 ) ) ( not ( = ?auto_595554 ?auto_595557 ) ) ( not ( = ?auto_595554 ?auto_595558 ) ) ( not ( = ?auto_595554 ?auto_595559 ) ) ( not ( = ?auto_595554 ?auto_595560 ) ) ( not ( = ?auto_595554 ?auto_595561 ) ) ( not ( = ?auto_595554 ?auto_595562 ) ) ( not ( = ?auto_595554 ?auto_595563 ) ) ( not ( = ?auto_595554 ?auto_595564 ) ) ( not ( = ?auto_595554 ?auto_595565 ) ) ( not ( = ?auto_595554 ?auto_595566 ) ) ( not ( = ?auto_595554 ?auto_595567 ) ) ( not ( = ?auto_595554 ?auto_595568 ) ) ( not ( = ?auto_595555 ?auto_595556 ) ) ( not ( = ?auto_595555 ?auto_595557 ) ) ( not ( = ?auto_595555 ?auto_595558 ) ) ( not ( = ?auto_595555 ?auto_595559 ) ) ( not ( = ?auto_595555 ?auto_595560 ) ) ( not ( = ?auto_595555 ?auto_595561 ) ) ( not ( = ?auto_595555 ?auto_595562 ) ) ( not ( = ?auto_595555 ?auto_595563 ) ) ( not ( = ?auto_595555 ?auto_595564 ) ) ( not ( = ?auto_595555 ?auto_595565 ) ) ( not ( = ?auto_595555 ?auto_595566 ) ) ( not ( = ?auto_595555 ?auto_595567 ) ) ( not ( = ?auto_595555 ?auto_595568 ) ) ( not ( = ?auto_595556 ?auto_595557 ) ) ( not ( = ?auto_595556 ?auto_595558 ) ) ( not ( = ?auto_595556 ?auto_595559 ) ) ( not ( = ?auto_595556 ?auto_595560 ) ) ( not ( = ?auto_595556 ?auto_595561 ) ) ( not ( = ?auto_595556 ?auto_595562 ) ) ( not ( = ?auto_595556 ?auto_595563 ) ) ( not ( = ?auto_595556 ?auto_595564 ) ) ( not ( = ?auto_595556 ?auto_595565 ) ) ( not ( = ?auto_595556 ?auto_595566 ) ) ( not ( = ?auto_595556 ?auto_595567 ) ) ( not ( = ?auto_595556 ?auto_595568 ) ) ( not ( = ?auto_595557 ?auto_595558 ) ) ( not ( = ?auto_595557 ?auto_595559 ) ) ( not ( = ?auto_595557 ?auto_595560 ) ) ( not ( = ?auto_595557 ?auto_595561 ) ) ( not ( = ?auto_595557 ?auto_595562 ) ) ( not ( = ?auto_595557 ?auto_595563 ) ) ( not ( = ?auto_595557 ?auto_595564 ) ) ( not ( = ?auto_595557 ?auto_595565 ) ) ( not ( = ?auto_595557 ?auto_595566 ) ) ( not ( = ?auto_595557 ?auto_595567 ) ) ( not ( = ?auto_595557 ?auto_595568 ) ) ( not ( = ?auto_595558 ?auto_595559 ) ) ( not ( = ?auto_595558 ?auto_595560 ) ) ( not ( = ?auto_595558 ?auto_595561 ) ) ( not ( = ?auto_595558 ?auto_595562 ) ) ( not ( = ?auto_595558 ?auto_595563 ) ) ( not ( = ?auto_595558 ?auto_595564 ) ) ( not ( = ?auto_595558 ?auto_595565 ) ) ( not ( = ?auto_595558 ?auto_595566 ) ) ( not ( = ?auto_595558 ?auto_595567 ) ) ( not ( = ?auto_595558 ?auto_595568 ) ) ( not ( = ?auto_595559 ?auto_595560 ) ) ( not ( = ?auto_595559 ?auto_595561 ) ) ( not ( = ?auto_595559 ?auto_595562 ) ) ( not ( = ?auto_595559 ?auto_595563 ) ) ( not ( = ?auto_595559 ?auto_595564 ) ) ( not ( = ?auto_595559 ?auto_595565 ) ) ( not ( = ?auto_595559 ?auto_595566 ) ) ( not ( = ?auto_595559 ?auto_595567 ) ) ( not ( = ?auto_595559 ?auto_595568 ) ) ( not ( = ?auto_595560 ?auto_595561 ) ) ( not ( = ?auto_595560 ?auto_595562 ) ) ( not ( = ?auto_595560 ?auto_595563 ) ) ( not ( = ?auto_595560 ?auto_595564 ) ) ( not ( = ?auto_595560 ?auto_595565 ) ) ( not ( = ?auto_595560 ?auto_595566 ) ) ( not ( = ?auto_595560 ?auto_595567 ) ) ( not ( = ?auto_595560 ?auto_595568 ) ) ( not ( = ?auto_595561 ?auto_595562 ) ) ( not ( = ?auto_595561 ?auto_595563 ) ) ( not ( = ?auto_595561 ?auto_595564 ) ) ( not ( = ?auto_595561 ?auto_595565 ) ) ( not ( = ?auto_595561 ?auto_595566 ) ) ( not ( = ?auto_595561 ?auto_595567 ) ) ( not ( = ?auto_595561 ?auto_595568 ) ) ( not ( = ?auto_595562 ?auto_595563 ) ) ( not ( = ?auto_595562 ?auto_595564 ) ) ( not ( = ?auto_595562 ?auto_595565 ) ) ( not ( = ?auto_595562 ?auto_595566 ) ) ( not ( = ?auto_595562 ?auto_595567 ) ) ( not ( = ?auto_595562 ?auto_595568 ) ) ( not ( = ?auto_595563 ?auto_595564 ) ) ( not ( = ?auto_595563 ?auto_595565 ) ) ( not ( = ?auto_595563 ?auto_595566 ) ) ( not ( = ?auto_595563 ?auto_595567 ) ) ( not ( = ?auto_595563 ?auto_595568 ) ) ( not ( = ?auto_595564 ?auto_595565 ) ) ( not ( = ?auto_595564 ?auto_595566 ) ) ( not ( = ?auto_595564 ?auto_595567 ) ) ( not ( = ?auto_595564 ?auto_595568 ) ) ( not ( = ?auto_595565 ?auto_595566 ) ) ( not ( = ?auto_595565 ?auto_595567 ) ) ( not ( = ?auto_595565 ?auto_595568 ) ) ( not ( = ?auto_595566 ?auto_595567 ) ) ( not ( = ?auto_595566 ?auto_595568 ) ) ( not ( = ?auto_595567 ?auto_595568 ) ) ( ON ?auto_595566 ?auto_595567 ) ( ON ?auto_595565 ?auto_595566 ) ( ON ?auto_595564 ?auto_595565 ) ( ON ?auto_595563 ?auto_595564 ) ( ON ?auto_595562 ?auto_595563 ) ( ON ?auto_595561 ?auto_595562 ) ( ON ?auto_595560 ?auto_595561 ) ( ON ?auto_595559 ?auto_595560 ) ( ON ?auto_595558 ?auto_595559 ) ( ON ?auto_595557 ?auto_595558 ) ( ON ?auto_595556 ?auto_595557 ) ( ON ?auto_595555 ?auto_595556 ) ( ON ?auto_595554 ?auto_595555 ) ( ON ?auto_595553 ?auto_595554 ) ( CLEAR ?auto_595553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_595553 )
      ( MAKE-15PILE ?auto_595553 ?auto_595554 ?auto_595555 ?auto_595556 ?auto_595557 ?auto_595558 ?auto_595559 ?auto_595560 ?auto_595561 ?auto_595562 ?auto_595563 ?auto_595564 ?auto_595565 ?auto_595566 ?auto_595567 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595616 - BLOCK
      ?auto_595617 - BLOCK
      ?auto_595618 - BLOCK
      ?auto_595619 - BLOCK
      ?auto_595620 - BLOCK
      ?auto_595621 - BLOCK
      ?auto_595622 - BLOCK
      ?auto_595623 - BLOCK
      ?auto_595624 - BLOCK
      ?auto_595625 - BLOCK
      ?auto_595626 - BLOCK
      ?auto_595627 - BLOCK
      ?auto_595628 - BLOCK
      ?auto_595629 - BLOCK
      ?auto_595630 - BLOCK
      ?auto_595631 - BLOCK
    )
    :vars
    (
      ?auto_595632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_595630 ) ( ON ?auto_595631 ?auto_595632 ) ( CLEAR ?auto_595631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_595616 ) ( ON ?auto_595617 ?auto_595616 ) ( ON ?auto_595618 ?auto_595617 ) ( ON ?auto_595619 ?auto_595618 ) ( ON ?auto_595620 ?auto_595619 ) ( ON ?auto_595621 ?auto_595620 ) ( ON ?auto_595622 ?auto_595621 ) ( ON ?auto_595623 ?auto_595622 ) ( ON ?auto_595624 ?auto_595623 ) ( ON ?auto_595625 ?auto_595624 ) ( ON ?auto_595626 ?auto_595625 ) ( ON ?auto_595627 ?auto_595626 ) ( ON ?auto_595628 ?auto_595627 ) ( ON ?auto_595629 ?auto_595628 ) ( ON ?auto_595630 ?auto_595629 ) ( not ( = ?auto_595616 ?auto_595617 ) ) ( not ( = ?auto_595616 ?auto_595618 ) ) ( not ( = ?auto_595616 ?auto_595619 ) ) ( not ( = ?auto_595616 ?auto_595620 ) ) ( not ( = ?auto_595616 ?auto_595621 ) ) ( not ( = ?auto_595616 ?auto_595622 ) ) ( not ( = ?auto_595616 ?auto_595623 ) ) ( not ( = ?auto_595616 ?auto_595624 ) ) ( not ( = ?auto_595616 ?auto_595625 ) ) ( not ( = ?auto_595616 ?auto_595626 ) ) ( not ( = ?auto_595616 ?auto_595627 ) ) ( not ( = ?auto_595616 ?auto_595628 ) ) ( not ( = ?auto_595616 ?auto_595629 ) ) ( not ( = ?auto_595616 ?auto_595630 ) ) ( not ( = ?auto_595616 ?auto_595631 ) ) ( not ( = ?auto_595616 ?auto_595632 ) ) ( not ( = ?auto_595617 ?auto_595618 ) ) ( not ( = ?auto_595617 ?auto_595619 ) ) ( not ( = ?auto_595617 ?auto_595620 ) ) ( not ( = ?auto_595617 ?auto_595621 ) ) ( not ( = ?auto_595617 ?auto_595622 ) ) ( not ( = ?auto_595617 ?auto_595623 ) ) ( not ( = ?auto_595617 ?auto_595624 ) ) ( not ( = ?auto_595617 ?auto_595625 ) ) ( not ( = ?auto_595617 ?auto_595626 ) ) ( not ( = ?auto_595617 ?auto_595627 ) ) ( not ( = ?auto_595617 ?auto_595628 ) ) ( not ( = ?auto_595617 ?auto_595629 ) ) ( not ( = ?auto_595617 ?auto_595630 ) ) ( not ( = ?auto_595617 ?auto_595631 ) ) ( not ( = ?auto_595617 ?auto_595632 ) ) ( not ( = ?auto_595618 ?auto_595619 ) ) ( not ( = ?auto_595618 ?auto_595620 ) ) ( not ( = ?auto_595618 ?auto_595621 ) ) ( not ( = ?auto_595618 ?auto_595622 ) ) ( not ( = ?auto_595618 ?auto_595623 ) ) ( not ( = ?auto_595618 ?auto_595624 ) ) ( not ( = ?auto_595618 ?auto_595625 ) ) ( not ( = ?auto_595618 ?auto_595626 ) ) ( not ( = ?auto_595618 ?auto_595627 ) ) ( not ( = ?auto_595618 ?auto_595628 ) ) ( not ( = ?auto_595618 ?auto_595629 ) ) ( not ( = ?auto_595618 ?auto_595630 ) ) ( not ( = ?auto_595618 ?auto_595631 ) ) ( not ( = ?auto_595618 ?auto_595632 ) ) ( not ( = ?auto_595619 ?auto_595620 ) ) ( not ( = ?auto_595619 ?auto_595621 ) ) ( not ( = ?auto_595619 ?auto_595622 ) ) ( not ( = ?auto_595619 ?auto_595623 ) ) ( not ( = ?auto_595619 ?auto_595624 ) ) ( not ( = ?auto_595619 ?auto_595625 ) ) ( not ( = ?auto_595619 ?auto_595626 ) ) ( not ( = ?auto_595619 ?auto_595627 ) ) ( not ( = ?auto_595619 ?auto_595628 ) ) ( not ( = ?auto_595619 ?auto_595629 ) ) ( not ( = ?auto_595619 ?auto_595630 ) ) ( not ( = ?auto_595619 ?auto_595631 ) ) ( not ( = ?auto_595619 ?auto_595632 ) ) ( not ( = ?auto_595620 ?auto_595621 ) ) ( not ( = ?auto_595620 ?auto_595622 ) ) ( not ( = ?auto_595620 ?auto_595623 ) ) ( not ( = ?auto_595620 ?auto_595624 ) ) ( not ( = ?auto_595620 ?auto_595625 ) ) ( not ( = ?auto_595620 ?auto_595626 ) ) ( not ( = ?auto_595620 ?auto_595627 ) ) ( not ( = ?auto_595620 ?auto_595628 ) ) ( not ( = ?auto_595620 ?auto_595629 ) ) ( not ( = ?auto_595620 ?auto_595630 ) ) ( not ( = ?auto_595620 ?auto_595631 ) ) ( not ( = ?auto_595620 ?auto_595632 ) ) ( not ( = ?auto_595621 ?auto_595622 ) ) ( not ( = ?auto_595621 ?auto_595623 ) ) ( not ( = ?auto_595621 ?auto_595624 ) ) ( not ( = ?auto_595621 ?auto_595625 ) ) ( not ( = ?auto_595621 ?auto_595626 ) ) ( not ( = ?auto_595621 ?auto_595627 ) ) ( not ( = ?auto_595621 ?auto_595628 ) ) ( not ( = ?auto_595621 ?auto_595629 ) ) ( not ( = ?auto_595621 ?auto_595630 ) ) ( not ( = ?auto_595621 ?auto_595631 ) ) ( not ( = ?auto_595621 ?auto_595632 ) ) ( not ( = ?auto_595622 ?auto_595623 ) ) ( not ( = ?auto_595622 ?auto_595624 ) ) ( not ( = ?auto_595622 ?auto_595625 ) ) ( not ( = ?auto_595622 ?auto_595626 ) ) ( not ( = ?auto_595622 ?auto_595627 ) ) ( not ( = ?auto_595622 ?auto_595628 ) ) ( not ( = ?auto_595622 ?auto_595629 ) ) ( not ( = ?auto_595622 ?auto_595630 ) ) ( not ( = ?auto_595622 ?auto_595631 ) ) ( not ( = ?auto_595622 ?auto_595632 ) ) ( not ( = ?auto_595623 ?auto_595624 ) ) ( not ( = ?auto_595623 ?auto_595625 ) ) ( not ( = ?auto_595623 ?auto_595626 ) ) ( not ( = ?auto_595623 ?auto_595627 ) ) ( not ( = ?auto_595623 ?auto_595628 ) ) ( not ( = ?auto_595623 ?auto_595629 ) ) ( not ( = ?auto_595623 ?auto_595630 ) ) ( not ( = ?auto_595623 ?auto_595631 ) ) ( not ( = ?auto_595623 ?auto_595632 ) ) ( not ( = ?auto_595624 ?auto_595625 ) ) ( not ( = ?auto_595624 ?auto_595626 ) ) ( not ( = ?auto_595624 ?auto_595627 ) ) ( not ( = ?auto_595624 ?auto_595628 ) ) ( not ( = ?auto_595624 ?auto_595629 ) ) ( not ( = ?auto_595624 ?auto_595630 ) ) ( not ( = ?auto_595624 ?auto_595631 ) ) ( not ( = ?auto_595624 ?auto_595632 ) ) ( not ( = ?auto_595625 ?auto_595626 ) ) ( not ( = ?auto_595625 ?auto_595627 ) ) ( not ( = ?auto_595625 ?auto_595628 ) ) ( not ( = ?auto_595625 ?auto_595629 ) ) ( not ( = ?auto_595625 ?auto_595630 ) ) ( not ( = ?auto_595625 ?auto_595631 ) ) ( not ( = ?auto_595625 ?auto_595632 ) ) ( not ( = ?auto_595626 ?auto_595627 ) ) ( not ( = ?auto_595626 ?auto_595628 ) ) ( not ( = ?auto_595626 ?auto_595629 ) ) ( not ( = ?auto_595626 ?auto_595630 ) ) ( not ( = ?auto_595626 ?auto_595631 ) ) ( not ( = ?auto_595626 ?auto_595632 ) ) ( not ( = ?auto_595627 ?auto_595628 ) ) ( not ( = ?auto_595627 ?auto_595629 ) ) ( not ( = ?auto_595627 ?auto_595630 ) ) ( not ( = ?auto_595627 ?auto_595631 ) ) ( not ( = ?auto_595627 ?auto_595632 ) ) ( not ( = ?auto_595628 ?auto_595629 ) ) ( not ( = ?auto_595628 ?auto_595630 ) ) ( not ( = ?auto_595628 ?auto_595631 ) ) ( not ( = ?auto_595628 ?auto_595632 ) ) ( not ( = ?auto_595629 ?auto_595630 ) ) ( not ( = ?auto_595629 ?auto_595631 ) ) ( not ( = ?auto_595629 ?auto_595632 ) ) ( not ( = ?auto_595630 ?auto_595631 ) ) ( not ( = ?auto_595630 ?auto_595632 ) ) ( not ( = ?auto_595631 ?auto_595632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_595631 ?auto_595632 )
      ( !STACK ?auto_595631 ?auto_595630 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595682 - BLOCK
      ?auto_595683 - BLOCK
      ?auto_595684 - BLOCK
      ?auto_595685 - BLOCK
      ?auto_595686 - BLOCK
      ?auto_595687 - BLOCK
      ?auto_595688 - BLOCK
      ?auto_595689 - BLOCK
      ?auto_595690 - BLOCK
      ?auto_595691 - BLOCK
      ?auto_595692 - BLOCK
      ?auto_595693 - BLOCK
      ?auto_595694 - BLOCK
      ?auto_595695 - BLOCK
      ?auto_595696 - BLOCK
      ?auto_595697 - BLOCK
    )
    :vars
    (
      ?auto_595698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595697 ?auto_595698 ) ( ON-TABLE ?auto_595682 ) ( ON ?auto_595683 ?auto_595682 ) ( ON ?auto_595684 ?auto_595683 ) ( ON ?auto_595685 ?auto_595684 ) ( ON ?auto_595686 ?auto_595685 ) ( ON ?auto_595687 ?auto_595686 ) ( ON ?auto_595688 ?auto_595687 ) ( ON ?auto_595689 ?auto_595688 ) ( ON ?auto_595690 ?auto_595689 ) ( ON ?auto_595691 ?auto_595690 ) ( ON ?auto_595692 ?auto_595691 ) ( ON ?auto_595693 ?auto_595692 ) ( ON ?auto_595694 ?auto_595693 ) ( ON ?auto_595695 ?auto_595694 ) ( not ( = ?auto_595682 ?auto_595683 ) ) ( not ( = ?auto_595682 ?auto_595684 ) ) ( not ( = ?auto_595682 ?auto_595685 ) ) ( not ( = ?auto_595682 ?auto_595686 ) ) ( not ( = ?auto_595682 ?auto_595687 ) ) ( not ( = ?auto_595682 ?auto_595688 ) ) ( not ( = ?auto_595682 ?auto_595689 ) ) ( not ( = ?auto_595682 ?auto_595690 ) ) ( not ( = ?auto_595682 ?auto_595691 ) ) ( not ( = ?auto_595682 ?auto_595692 ) ) ( not ( = ?auto_595682 ?auto_595693 ) ) ( not ( = ?auto_595682 ?auto_595694 ) ) ( not ( = ?auto_595682 ?auto_595695 ) ) ( not ( = ?auto_595682 ?auto_595696 ) ) ( not ( = ?auto_595682 ?auto_595697 ) ) ( not ( = ?auto_595682 ?auto_595698 ) ) ( not ( = ?auto_595683 ?auto_595684 ) ) ( not ( = ?auto_595683 ?auto_595685 ) ) ( not ( = ?auto_595683 ?auto_595686 ) ) ( not ( = ?auto_595683 ?auto_595687 ) ) ( not ( = ?auto_595683 ?auto_595688 ) ) ( not ( = ?auto_595683 ?auto_595689 ) ) ( not ( = ?auto_595683 ?auto_595690 ) ) ( not ( = ?auto_595683 ?auto_595691 ) ) ( not ( = ?auto_595683 ?auto_595692 ) ) ( not ( = ?auto_595683 ?auto_595693 ) ) ( not ( = ?auto_595683 ?auto_595694 ) ) ( not ( = ?auto_595683 ?auto_595695 ) ) ( not ( = ?auto_595683 ?auto_595696 ) ) ( not ( = ?auto_595683 ?auto_595697 ) ) ( not ( = ?auto_595683 ?auto_595698 ) ) ( not ( = ?auto_595684 ?auto_595685 ) ) ( not ( = ?auto_595684 ?auto_595686 ) ) ( not ( = ?auto_595684 ?auto_595687 ) ) ( not ( = ?auto_595684 ?auto_595688 ) ) ( not ( = ?auto_595684 ?auto_595689 ) ) ( not ( = ?auto_595684 ?auto_595690 ) ) ( not ( = ?auto_595684 ?auto_595691 ) ) ( not ( = ?auto_595684 ?auto_595692 ) ) ( not ( = ?auto_595684 ?auto_595693 ) ) ( not ( = ?auto_595684 ?auto_595694 ) ) ( not ( = ?auto_595684 ?auto_595695 ) ) ( not ( = ?auto_595684 ?auto_595696 ) ) ( not ( = ?auto_595684 ?auto_595697 ) ) ( not ( = ?auto_595684 ?auto_595698 ) ) ( not ( = ?auto_595685 ?auto_595686 ) ) ( not ( = ?auto_595685 ?auto_595687 ) ) ( not ( = ?auto_595685 ?auto_595688 ) ) ( not ( = ?auto_595685 ?auto_595689 ) ) ( not ( = ?auto_595685 ?auto_595690 ) ) ( not ( = ?auto_595685 ?auto_595691 ) ) ( not ( = ?auto_595685 ?auto_595692 ) ) ( not ( = ?auto_595685 ?auto_595693 ) ) ( not ( = ?auto_595685 ?auto_595694 ) ) ( not ( = ?auto_595685 ?auto_595695 ) ) ( not ( = ?auto_595685 ?auto_595696 ) ) ( not ( = ?auto_595685 ?auto_595697 ) ) ( not ( = ?auto_595685 ?auto_595698 ) ) ( not ( = ?auto_595686 ?auto_595687 ) ) ( not ( = ?auto_595686 ?auto_595688 ) ) ( not ( = ?auto_595686 ?auto_595689 ) ) ( not ( = ?auto_595686 ?auto_595690 ) ) ( not ( = ?auto_595686 ?auto_595691 ) ) ( not ( = ?auto_595686 ?auto_595692 ) ) ( not ( = ?auto_595686 ?auto_595693 ) ) ( not ( = ?auto_595686 ?auto_595694 ) ) ( not ( = ?auto_595686 ?auto_595695 ) ) ( not ( = ?auto_595686 ?auto_595696 ) ) ( not ( = ?auto_595686 ?auto_595697 ) ) ( not ( = ?auto_595686 ?auto_595698 ) ) ( not ( = ?auto_595687 ?auto_595688 ) ) ( not ( = ?auto_595687 ?auto_595689 ) ) ( not ( = ?auto_595687 ?auto_595690 ) ) ( not ( = ?auto_595687 ?auto_595691 ) ) ( not ( = ?auto_595687 ?auto_595692 ) ) ( not ( = ?auto_595687 ?auto_595693 ) ) ( not ( = ?auto_595687 ?auto_595694 ) ) ( not ( = ?auto_595687 ?auto_595695 ) ) ( not ( = ?auto_595687 ?auto_595696 ) ) ( not ( = ?auto_595687 ?auto_595697 ) ) ( not ( = ?auto_595687 ?auto_595698 ) ) ( not ( = ?auto_595688 ?auto_595689 ) ) ( not ( = ?auto_595688 ?auto_595690 ) ) ( not ( = ?auto_595688 ?auto_595691 ) ) ( not ( = ?auto_595688 ?auto_595692 ) ) ( not ( = ?auto_595688 ?auto_595693 ) ) ( not ( = ?auto_595688 ?auto_595694 ) ) ( not ( = ?auto_595688 ?auto_595695 ) ) ( not ( = ?auto_595688 ?auto_595696 ) ) ( not ( = ?auto_595688 ?auto_595697 ) ) ( not ( = ?auto_595688 ?auto_595698 ) ) ( not ( = ?auto_595689 ?auto_595690 ) ) ( not ( = ?auto_595689 ?auto_595691 ) ) ( not ( = ?auto_595689 ?auto_595692 ) ) ( not ( = ?auto_595689 ?auto_595693 ) ) ( not ( = ?auto_595689 ?auto_595694 ) ) ( not ( = ?auto_595689 ?auto_595695 ) ) ( not ( = ?auto_595689 ?auto_595696 ) ) ( not ( = ?auto_595689 ?auto_595697 ) ) ( not ( = ?auto_595689 ?auto_595698 ) ) ( not ( = ?auto_595690 ?auto_595691 ) ) ( not ( = ?auto_595690 ?auto_595692 ) ) ( not ( = ?auto_595690 ?auto_595693 ) ) ( not ( = ?auto_595690 ?auto_595694 ) ) ( not ( = ?auto_595690 ?auto_595695 ) ) ( not ( = ?auto_595690 ?auto_595696 ) ) ( not ( = ?auto_595690 ?auto_595697 ) ) ( not ( = ?auto_595690 ?auto_595698 ) ) ( not ( = ?auto_595691 ?auto_595692 ) ) ( not ( = ?auto_595691 ?auto_595693 ) ) ( not ( = ?auto_595691 ?auto_595694 ) ) ( not ( = ?auto_595691 ?auto_595695 ) ) ( not ( = ?auto_595691 ?auto_595696 ) ) ( not ( = ?auto_595691 ?auto_595697 ) ) ( not ( = ?auto_595691 ?auto_595698 ) ) ( not ( = ?auto_595692 ?auto_595693 ) ) ( not ( = ?auto_595692 ?auto_595694 ) ) ( not ( = ?auto_595692 ?auto_595695 ) ) ( not ( = ?auto_595692 ?auto_595696 ) ) ( not ( = ?auto_595692 ?auto_595697 ) ) ( not ( = ?auto_595692 ?auto_595698 ) ) ( not ( = ?auto_595693 ?auto_595694 ) ) ( not ( = ?auto_595693 ?auto_595695 ) ) ( not ( = ?auto_595693 ?auto_595696 ) ) ( not ( = ?auto_595693 ?auto_595697 ) ) ( not ( = ?auto_595693 ?auto_595698 ) ) ( not ( = ?auto_595694 ?auto_595695 ) ) ( not ( = ?auto_595694 ?auto_595696 ) ) ( not ( = ?auto_595694 ?auto_595697 ) ) ( not ( = ?auto_595694 ?auto_595698 ) ) ( not ( = ?auto_595695 ?auto_595696 ) ) ( not ( = ?auto_595695 ?auto_595697 ) ) ( not ( = ?auto_595695 ?auto_595698 ) ) ( not ( = ?auto_595696 ?auto_595697 ) ) ( not ( = ?auto_595696 ?auto_595698 ) ) ( not ( = ?auto_595697 ?auto_595698 ) ) ( CLEAR ?auto_595695 ) ( ON ?auto_595696 ?auto_595697 ) ( CLEAR ?auto_595696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_595682 ?auto_595683 ?auto_595684 ?auto_595685 ?auto_595686 ?auto_595687 ?auto_595688 ?auto_595689 ?auto_595690 ?auto_595691 ?auto_595692 ?auto_595693 ?auto_595694 ?auto_595695 ?auto_595696 )
      ( MAKE-16PILE ?auto_595682 ?auto_595683 ?auto_595684 ?auto_595685 ?auto_595686 ?auto_595687 ?auto_595688 ?auto_595689 ?auto_595690 ?auto_595691 ?auto_595692 ?auto_595693 ?auto_595694 ?auto_595695 ?auto_595696 ?auto_595697 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595748 - BLOCK
      ?auto_595749 - BLOCK
      ?auto_595750 - BLOCK
      ?auto_595751 - BLOCK
      ?auto_595752 - BLOCK
      ?auto_595753 - BLOCK
      ?auto_595754 - BLOCK
      ?auto_595755 - BLOCK
      ?auto_595756 - BLOCK
      ?auto_595757 - BLOCK
      ?auto_595758 - BLOCK
      ?auto_595759 - BLOCK
      ?auto_595760 - BLOCK
      ?auto_595761 - BLOCK
      ?auto_595762 - BLOCK
      ?auto_595763 - BLOCK
    )
    :vars
    (
      ?auto_595764 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595763 ?auto_595764 ) ( ON-TABLE ?auto_595748 ) ( ON ?auto_595749 ?auto_595748 ) ( ON ?auto_595750 ?auto_595749 ) ( ON ?auto_595751 ?auto_595750 ) ( ON ?auto_595752 ?auto_595751 ) ( ON ?auto_595753 ?auto_595752 ) ( ON ?auto_595754 ?auto_595753 ) ( ON ?auto_595755 ?auto_595754 ) ( ON ?auto_595756 ?auto_595755 ) ( ON ?auto_595757 ?auto_595756 ) ( ON ?auto_595758 ?auto_595757 ) ( ON ?auto_595759 ?auto_595758 ) ( ON ?auto_595760 ?auto_595759 ) ( not ( = ?auto_595748 ?auto_595749 ) ) ( not ( = ?auto_595748 ?auto_595750 ) ) ( not ( = ?auto_595748 ?auto_595751 ) ) ( not ( = ?auto_595748 ?auto_595752 ) ) ( not ( = ?auto_595748 ?auto_595753 ) ) ( not ( = ?auto_595748 ?auto_595754 ) ) ( not ( = ?auto_595748 ?auto_595755 ) ) ( not ( = ?auto_595748 ?auto_595756 ) ) ( not ( = ?auto_595748 ?auto_595757 ) ) ( not ( = ?auto_595748 ?auto_595758 ) ) ( not ( = ?auto_595748 ?auto_595759 ) ) ( not ( = ?auto_595748 ?auto_595760 ) ) ( not ( = ?auto_595748 ?auto_595761 ) ) ( not ( = ?auto_595748 ?auto_595762 ) ) ( not ( = ?auto_595748 ?auto_595763 ) ) ( not ( = ?auto_595748 ?auto_595764 ) ) ( not ( = ?auto_595749 ?auto_595750 ) ) ( not ( = ?auto_595749 ?auto_595751 ) ) ( not ( = ?auto_595749 ?auto_595752 ) ) ( not ( = ?auto_595749 ?auto_595753 ) ) ( not ( = ?auto_595749 ?auto_595754 ) ) ( not ( = ?auto_595749 ?auto_595755 ) ) ( not ( = ?auto_595749 ?auto_595756 ) ) ( not ( = ?auto_595749 ?auto_595757 ) ) ( not ( = ?auto_595749 ?auto_595758 ) ) ( not ( = ?auto_595749 ?auto_595759 ) ) ( not ( = ?auto_595749 ?auto_595760 ) ) ( not ( = ?auto_595749 ?auto_595761 ) ) ( not ( = ?auto_595749 ?auto_595762 ) ) ( not ( = ?auto_595749 ?auto_595763 ) ) ( not ( = ?auto_595749 ?auto_595764 ) ) ( not ( = ?auto_595750 ?auto_595751 ) ) ( not ( = ?auto_595750 ?auto_595752 ) ) ( not ( = ?auto_595750 ?auto_595753 ) ) ( not ( = ?auto_595750 ?auto_595754 ) ) ( not ( = ?auto_595750 ?auto_595755 ) ) ( not ( = ?auto_595750 ?auto_595756 ) ) ( not ( = ?auto_595750 ?auto_595757 ) ) ( not ( = ?auto_595750 ?auto_595758 ) ) ( not ( = ?auto_595750 ?auto_595759 ) ) ( not ( = ?auto_595750 ?auto_595760 ) ) ( not ( = ?auto_595750 ?auto_595761 ) ) ( not ( = ?auto_595750 ?auto_595762 ) ) ( not ( = ?auto_595750 ?auto_595763 ) ) ( not ( = ?auto_595750 ?auto_595764 ) ) ( not ( = ?auto_595751 ?auto_595752 ) ) ( not ( = ?auto_595751 ?auto_595753 ) ) ( not ( = ?auto_595751 ?auto_595754 ) ) ( not ( = ?auto_595751 ?auto_595755 ) ) ( not ( = ?auto_595751 ?auto_595756 ) ) ( not ( = ?auto_595751 ?auto_595757 ) ) ( not ( = ?auto_595751 ?auto_595758 ) ) ( not ( = ?auto_595751 ?auto_595759 ) ) ( not ( = ?auto_595751 ?auto_595760 ) ) ( not ( = ?auto_595751 ?auto_595761 ) ) ( not ( = ?auto_595751 ?auto_595762 ) ) ( not ( = ?auto_595751 ?auto_595763 ) ) ( not ( = ?auto_595751 ?auto_595764 ) ) ( not ( = ?auto_595752 ?auto_595753 ) ) ( not ( = ?auto_595752 ?auto_595754 ) ) ( not ( = ?auto_595752 ?auto_595755 ) ) ( not ( = ?auto_595752 ?auto_595756 ) ) ( not ( = ?auto_595752 ?auto_595757 ) ) ( not ( = ?auto_595752 ?auto_595758 ) ) ( not ( = ?auto_595752 ?auto_595759 ) ) ( not ( = ?auto_595752 ?auto_595760 ) ) ( not ( = ?auto_595752 ?auto_595761 ) ) ( not ( = ?auto_595752 ?auto_595762 ) ) ( not ( = ?auto_595752 ?auto_595763 ) ) ( not ( = ?auto_595752 ?auto_595764 ) ) ( not ( = ?auto_595753 ?auto_595754 ) ) ( not ( = ?auto_595753 ?auto_595755 ) ) ( not ( = ?auto_595753 ?auto_595756 ) ) ( not ( = ?auto_595753 ?auto_595757 ) ) ( not ( = ?auto_595753 ?auto_595758 ) ) ( not ( = ?auto_595753 ?auto_595759 ) ) ( not ( = ?auto_595753 ?auto_595760 ) ) ( not ( = ?auto_595753 ?auto_595761 ) ) ( not ( = ?auto_595753 ?auto_595762 ) ) ( not ( = ?auto_595753 ?auto_595763 ) ) ( not ( = ?auto_595753 ?auto_595764 ) ) ( not ( = ?auto_595754 ?auto_595755 ) ) ( not ( = ?auto_595754 ?auto_595756 ) ) ( not ( = ?auto_595754 ?auto_595757 ) ) ( not ( = ?auto_595754 ?auto_595758 ) ) ( not ( = ?auto_595754 ?auto_595759 ) ) ( not ( = ?auto_595754 ?auto_595760 ) ) ( not ( = ?auto_595754 ?auto_595761 ) ) ( not ( = ?auto_595754 ?auto_595762 ) ) ( not ( = ?auto_595754 ?auto_595763 ) ) ( not ( = ?auto_595754 ?auto_595764 ) ) ( not ( = ?auto_595755 ?auto_595756 ) ) ( not ( = ?auto_595755 ?auto_595757 ) ) ( not ( = ?auto_595755 ?auto_595758 ) ) ( not ( = ?auto_595755 ?auto_595759 ) ) ( not ( = ?auto_595755 ?auto_595760 ) ) ( not ( = ?auto_595755 ?auto_595761 ) ) ( not ( = ?auto_595755 ?auto_595762 ) ) ( not ( = ?auto_595755 ?auto_595763 ) ) ( not ( = ?auto_595755 ?auto_595764 ) ) ( not ( = ?auto_595756 ?auto_595757 ) ) ( not ( = ?auto_595756 ?auto_595758 ) ) ( not ( = ?auto_595756 ?auto_595759 ) ) ( not ( = ?auto_595756 ?auto_595760 ) ) ( not ( = ?auto_595756 ?auto_595761 ) ) ( not ( = ?auto_595756 ?auto_595762 ) ) ( not ( = ?auto_595756 ?auto_595763 ) ) ( not ( = ?auto_595756 ?auto_595764 ) ) ( not ( = ?auto_595757 ?auto_595758 ) ) ( not ( = ?auto_595757 ?auto_595759 ) ) ( not ( = ?auto_595757 ?auto_595760 ) ) ( not ( = ?auto_595757 ?auto_595761 ) ) ( not ( = ?auto_595757 ?auto_595762 ) ) ( not ( = ?auto_595757 ?auto_595763 ) ) ( not ( = ?auto_595757 ?auto_595764 ) ) ( not ( = ?auto_595758 ?auto_595759 ) ) ( not ( = ?auto_595758 ?auto_595760 ) ) ( not ( = ?auto_595758 ?auto_595761 ) ) ( not ( = ?auto_595758 ?auto_595762 ) ) ( not ( = ?auto_595758 ?auto_595763 ) ) ( not ( = ?auto_595758 ?auto_595764 ) ) ( not ( = ?auto_595759 ?auto_595760 ) ) ( not ( = ?auto_595759 ?auto_595761 ) ) ( not ( = ?auto_595759 ?auto_595762 ) ) ( not ( = ?auto_595759 ?auto_595763 ) ) ( not ( = ?auto_595759 ?auto_595764 ) ) ( not ( = ?auto_595760 ?auto_595761 ) ) ( not ( = ?auto_595760 ?auto_595762 ) ) ( not ( = ?auto_595760 ?auto_595763 ) ) ( not ( = ?auto_595760 ?auto_595764 ) ) ( not ( = ?auto_595761 ?auto_595762 ) ) ( not ( = ?auto_595761 ?auto_595763 ) ) ( not ( = ?auto_595761 ?auto_595764 ) ) ( not ( = ?auto_595762 ?auto_595763 ) ) ( not ( = ?auto_595762 ?auto_595764 ) ) ( not ( = ?auto_595763 ?auto_595764 ) ) ( ON ?auto_595762 ?auto_595763 ) ( CLEAR ?auto_595760 ) ( ON ?auto_595761 ?auto_595762 ) ( CLEAR ?auto_595761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_595748 ?auto_595749 ?auto_595750 ?auto_595751 ?auto_595752 ?auto_595753 ?auto_595754 ?auto_595755 ?auto_595756 ?auto_595757 ?auto_595758 ?auto_595759 ?auto_595760 ?auto_595761 )
      ( MAKE-16PILE ?auto_595748 ?auto_595749 ?auto_595750 ?auto_595751 ?auto_595752 ?auto_595753 ?auto_595754 ?auto_595755 ?auto_595756 ?auto_595757 ?auto_595758 ?auto_595759 ?auto_595760 ?auto_595761 ?auto_595762 ?auto_595763 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595814 - BLOCK
      ?auto_595815 - BLOCK
      ?auto_595816 - BLOCK
      ?auto_595817 - BLOCK
      ?auto_595818 - BLOCK
      ?auto_595819 - BLOCK
      ?auto_595820 - BLOCK
      ?auto_595821 - BLOCK
      ?auto_595822 - BLOCK
      ?auto_595823 - BLOCK
      ?auto_595824 - BLOCK
      ?auto_595825 - BLOCK
      ?auto_595826 - BLOCK
      ?auto_595827 - BLOCK
      ?auto_595828 - BLOCK
      ?auto_595829 - BLOCK
    )
    :vars
    (
      ?auto_595830 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595829 ?auto_595830 ) ( ON-TABLE ?auto_595814 ) ( ON ?auto_595815 ?auto_595814 ) ( ON ?auto_595816 ?auto_595815 ) ( ON ?auto_595817 ?auto_595816 ) ( ON ?auto_595818 ?auto_595817 ) ( ON ?auto_595819 ?auto_595818 ) ( ON ?auto_595820 ?auto_595819 ) ( ON ?auto_595821 ?auto_595820 ) ( ON ?auto_595822 ?auto_595821 ) ( ON ?auto_595823 ?auto_595822 ) ( ON ?auto_595824 ?auto_595823 ) ( ON ?auto_595825 ?auto_595824 ) ( not ( = ?auto_595814 ?auto_595815 ) ) ( not ( = ?auto_595814 ?auto_595816 ) ) ( not ( = ?auto_595814 ?auto_595817 ) ) ( not ( = ?auto_595814 ?auto_595818 ) ) ( not ( = ?auto_595814 ?auto_595819 ) ) ( not ( = ?auto_595814 ?auto_595820 ) ) ( not ( = ?auto_595814 ?auto_595821 ) ) ( not ( = ?auto_595814 ?auto_595822 ) ) ( not ( = ?auto_595814 ?auto_595823 ) ) ( not ( = ?auto_595814 ?auto_595824 ) ) ( not ( = ?auto_595814 ?auto_595825 ) ) ( not ( = ?auto_595814 ?auto_595826 ) ) ( not ( = ?auto_595814 ?auto_595827 ) ) ( not ( = ?auto_595814 ?auto_595828 ) ) ( not ( = ?auto_595814 ?auto_595829 ) ) ( not ( = ?auto_595814 ?auto_595830 ) ) ( not ( = ?auto_595815 ?auto_595816 ) ) ( not ( = ?auto_595815 ?auto_595817 ) ) ( not ( = ?auto_595815 ?auto_595818 ) ) ( not ( = ?auto_595815 ?auto_595819 ) ) ( not ( = ?auto_595815 ?auto_595820 ) ) ( not ( = ?auto_595815 ?auto_595821 ) ) ( not ( = ?auto_595815 ?auto_595822 ) ) ( not ( = ?auto_595815 ?auto_595823 ) ) ( not ( = ?auto_595815 ?auto_595824 ) ) ( not ( = ?auto_595815 ?auto_595825 ) ) ( not ( = ?auto_595815 ?auto_595826 ) ) ( not ( = ?auto_595815 ?auto_595827 ) ) ( not ( = ?auto_595815 ?auto_595828 ) ) ( not ( = ?auto_595815 ?auto_595829 ) ) ( not ( = ?auto_595815 ?auto_595830 ) ) ( not ( = ?auto_595816 ?auto_595817 ) ) ( not ( = ?auto_595816 ?auto_595818 ) ) ( not ( = ?auto_595816 ?auto_595819 ) ) ( not ( = ?auto_595816 ?auto_595820 ) ) ( not ( = ?auto_595816 ?auto_595821 ) ) ( not ( = ?auto_595816 ?auto_595822 ) ) ( not ( = ?auto_595816 ?auto_595823 ) ) ( not ( = ?auto_595816 ?auto_595824 ) ) ( not ( = ?auto_595816 ?auto_595825 ) ) ( not ( = ?auto_595816 ?auto_595826 ) ) ( not ( = ?auto_595816 ?auto_595827 ) ) ( not ( = ?auto_595816 ?auto_595828 ) ) ( not ( = ?auto_595816 ?auto_595829 ) ) ( not ( = ?auto_595816 ?auto_595830 ) ) ( not ( = ?auto_595817 ?auto_595818 ) ) ( not ( = ?auto_595817 ?auto_595819 ) ) ( not ( = ?auto_595817 ?auto_595820 ) ) ( not ( = ?auto_595817 ?auto_595821 ) ) ( not ( = ?auto_595817 ?auto_595822 ) ) ( not ( = ?auto_595817 ?auto_595823 ) ) ( not ( = ?auto_595817 ?auto_595824 ) ) ( not ( = ?auto_595817 ?auto_595825 ) ) ( not ( = ?auto_595817 ?auto_595826 ) ) ( not ( = ?auto_595817 ?auto_595827 ) ) ( not ( = ?auto_595817 ?auto_595828 ) ) ( not ( = ?auto_595817 ?auto_595829 ) ) ( not ( = ?auto_595817 ?auto_595830 ) ) ( not ( = ?auto_595818 ?auto_595819 ) ) ( not ( = ?auto_595818 ?auto_595820 ) ) ( not ( = ?auto_595818 ?auto_595821 ) ) ( not ( = ?auto_595818 ?auto_595822 ) ) ( not ( = ?auto_595818 ?auto_595823 ) ) ( not ( = ?auto_595818 ?auto_595824 ) ) ( not ( = ?auto_595818 ?auto_595825 ) ) ( not ( = ?auto_595818 ?auto_595826 ) ) ( not ( = ?auto_595818 ?auto_595827 ) ) ( not ( = ?auto_595818 ?auto_595828 ) ) ( not ( = ?auto_595818 ?auto_595829 ) ) ( not ( = ?auto_595818 ?auto_595830 ) ) ( not ( = ?auto_595819 ?auto_595820 ) ) ( not ( = ?auto_595819 ?auto_595821 ) ) ( not ( = ?auto_595819 ?auto_595822 ) ) ( not ( = ?auto_595819 ?auto_595823 ) ) ( not ( = ?auto_595819 ?auto_595824 ) ) ( not ( = ?auto_595819 ?auto_595825 ) ) ( not ( = ?auto_595819 ?auto_595826 ) ) ( not ( = ?auto_595819 ?auto_595827 ) ) ( not ( = ?auto_595819 ?auto_595828 ) ) ( not ( = ?auto_595819 ?auto_595829 ) ) ( not ( = ?auto_595819 ?auto_595830 ) ) ( not ( = ?auto_595820 ?auto_595821 ) ) ( not ( = ?auto_595820 ?auto_595822 ) ) ( not ( = ?auto_595820 ?auto_595823 ) ) ( not ( = ?auto_595820 ?auto_595824 ) ) ( not ( = ?auto_595820 ?auto_595825 ) ) ( not ( = ?auto_595820 ?auto_595826 ) ) ( not ( = ?auto_595820 ?auto_595827 ) ) ( not ( = ?auto_595820 ?auto_595828 ) ) ( not ( = ?auto_595820 ?auto_595829 ) ) ( not ( = ?auto_595820 ?auto_595830 ) ) ( not ( = ?auto_595821 ?auto_595822 ) ) ( not ( = ?auto_595821 ?auto_595823 ) ) ( not ( = ?auto_595821 ?auto_595824 ) ) ( not ( = ?auto_595821 ?auto_595825 ) ) ( not ( = ?auto_595821 ?auto_595826 ) ) ( not ( = ?auto_595821 ?auto_595827 ) ) ( not ( = ?auto_595821 ?auto_595828 ) ) ( not ( = ?auto_595821 ?auto_595829 ) ) ( not ( = ?auto_595821 ?auto_595830 ) ) ( not ( = ?auto_595822 ?auto_595823 ) ) ( not ( = ?auto_595822 ?auto_595824 ) ) ( not ( = ?auto_595822 ?auto_595825 ) ) ( not ( = ?auto_595822 ?auto_595826 ) ) ( not ( = ?auto_595822 ?auto_595827 ) ) ( not ( = ?auto_595822 ?auto_595828 ) ) ( not ( = ?auto_595822 ?auto_595829 ) ) ( not ( = ?auto_595822 ?auto_595830 ) ) ( not ( = ?auto_595823 ?auto_595824 ) ) ( not ( = ?auto_595823 ?auto_595825 ) ) ( not ( = ?auto_595823 ?auto_595826 ) ) ( not ( = ?auto_595823 ?auto_595827 ) ) ( not ( = ?auto_595823 ?auto_595828 ) ) ( not ( = ?auto_595823 ?auto_595829 ) ) ( not ( = ?auto_595823 ?auto_595830 ) ) ( not ( = ?auto_595824 ?auto_595825 ) ) ( not ( = ?auto_595824 ?auto_595826 ) ) ( not ( = ?auto_595824 ?auto_595827 ) ) ( not ( = ?auto_595824 ?auto_595828 ) ) ( not ( = ?auto_595824 ?auto_595829 ) ) ( not ( = ?auto_595824 ?auto_595830 ) ) ( not ( = ?auto_595825 ?auto_595826 ) ) ( not ( = ?auto_595825 ?auto_595827 ) ) ( not ( = ?auto_595825 ?auto_595828 ) ) ( not ( = ?auto_595825 ?auto_595829 ) ) ( not ( = ?auto_595825 ?auto_595830 ) ) ( not ( = ?auto_595826 ?auto_595827 ) ) ( not ( = ?auto_595826 ?auto_595828 ) ) ( not ( = ?auto_595826 ?auto_595829 ) ) ( not ( = ?auto_595826 ?auto_595830 ) ) ( not ( = ?auto_595827 ?auto_595828 ) ) ( not ( = ?auto_595827 ?auto_595829 ) ) ( not ( = ?auto_595827 ?auto_595830 ) ) ( not ( = ?auto_595828 ?auto_595829 ) ) ( not ( = ?auto_595828 ?auto_595830 ) ) ( not ( = ?auto_595829 ?auto_595830 ) ) ( ON ?auto_595828 ?auto_595829 ) ( ON ?auto_595827 ?auto_595828 ) ( CLEAR ?auto_595825 ) ( ON ?auto_595826 ?auto_595827 ) ( CLEAR ?auto_595826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_595814 ?auto_595815 ?auto_595816 ?auto_595817 ?auto_595818 ?auto_595819 ?auto_595820 ?auto_595821 ?auto_595822 ?auto_595823 ?auto_595824 ?auto_595825 ?auto_595826 )
      ( MAKE-16PILE ?auto_595814 ?auto_595815 ?auto_595816 ?auto_595817 ?auto_595818 ?auto_595819 ?auto_595820 ?auto_595821 ?auto_595822 ?auto_595823 ?auto_595824 ?auto_595825 ?auto_595826 ?auto_595827 ?auto_595828 ?auto_595829 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595880 - BLOCK
      ?auto_595881 - BLOCK
      ?auto_595882 - BLOCK
      ?auto_595883 - BLOCK
      ?auto_595884 - BLOCK
      ?auto_595885 - BLOCK
      ?auto_595886 - BLOCK
      ?auto_595887 - BLOCK
      ?auto_595888 - BLOCK
      ?auto_595889 - BLOCK
      ?auto_595890 - BLOCK
      ?auto_595891 - BLOCK
      ?auto_595892 - BLOCK
      ?auto_595893 - BLOCK
      ?auto_595894 - BLOCK
      ?auto_595895 - BLOCK
    )
    :vars
    (
      ?auto_595896 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595895 ?auto_595896 ) ( ON-TABLE ?auto_595880 ) ( ON ?auto_595881 ?auto_595880 ) ( ON ?auto_595882 ?auto_595881 ) ( ON ?auto_595883 ?auto_595882 ) ( ON ?auto_595884 ?auto_595883 ) ( ON ?auto_595885 ?auto_595884 ) ( ON ?auto_595886 ?auto_595885 ) ( ON ?auto_595887 ?auto_595886 ) ( ON ?auto_595888 ?auto_595887 ) ( ON ?auto_595889 ?auto_595888 ) ( ON ?auto_595890 ?auto_595889 ) ( not ( = ?auto_595880 ?auto_595881 ) ) ( not ( = ?auto_595880 ?auto_595882 ) ) ( not ( = ?auto_595880 ?auto_595883 ) ) ( not ( = ?auto_595880 ?auto_595884 ) ) ( not ( = ?auto_595880 ?auto_595885 ) ) ( not ( = ?auto_595880 ?auto_595886 ) ) ( not ( = ?auto_595880 ?auto_595887 ) ) ( not ( = ?auto_595880 ?auto_595888 ) ) ( not ( = ?auto_595880 ?auto_595889 ) ) ( not ( = ?auto_595880 ?auto_595890 ) ) ( not ( = ?auto_595880 ?auto_595891 ) ) ( not ( = ?auto_595880 ?auto_595892 ) ) ( not ( = ?auto_595880 ?auto_595893 ) ) ( not ( = ?auto_595880 ?auto_595894 ) ) ( not ( = ?auto_595880 ?auto_595895 ) ) ( not ( = ?auto_595880 ?auto_595896 ) ) ( not ( = ?auto_595881 ?auto_595882 ) ) ( not ( = ?auto_595881 ?auto_595883 ) ) ( not ( = ?auto_595881 ?auto_595884 ) ) ( not ( = ?auto_595881 ?auto_595885 ) ) ( not ( = ?auto_595881 ?auto_595886 ) ) ( not ( = ?auto_595881 ?auto_595887 ) ) ( not ( = ?auto_595881 ?auto_595888 ) ) ( not ( = ?auto_595881 ?auto_595889 ) ) ( not ( = ?auto_595881 ?auto_595890 ) ) ( not ( = ?auto_595881 ?auto_595891 ) ) ( not ( = ?auto_595881 ?auto_595892 ) ) ( not ( = ?auto_595881 ?auto_595893 ) ) ( not ( = ?auto_595881 ?auto_595894 ) ) ( not ( = ?auto_595881 ?auto_595895 ) ) ( not ( = ?auto_595881 ?auto_595896 ) ) ( not ( = ?auto_595882 ?auto_595883 ) ) ( not ( = ?auto_595882 ?auto_595884 ) ) ( not ( = ?auto_595882 ?auto_595885 ) ) ( not ( = ?auto_595882 ?auto_595886 ) ) ( not ( = ?auto_595882 ?auto_595887 ) ) ( not ( = ?auto_595882 ?auto_595888 ) ) ( not ( = ?auto_595882 ?auto_595889 ) ) ( not ( = ?auto_595882 ?auto_595890 ) ) ( not ( = ?auto_595882 ?auto_595891 ) ) ( not ( = ?auto_595882 ?auto_595892 ) ) ( not ( = ?auto_595882 ?auto_595893 ) ) ( not ( = ?auto_595882 ?auto_595894 ) ) ( not ( = ?auto_595882 ?auto_595895 ) ) ( not ( = ?auto_595882 ?auto_595896 ) ) ( not ( = ?auto_595883 ?auto_595884 ) ) ( not ( = ?auto_595883 ?auto_595885 ) ) ( not ( = ?auto_595883 ?auto_595886 ) ) ( not ( = ?auto_595883 ?auto_595887 ) ) ( not ( = ?auto_595883 ?auto_595888 ) ) ( not ( = ?auto_595883 ?auto_595889 ) ) ( not ( = ?auto_595883 ?auto_595890 ) ) ( not ( = ?auto_595883 ?auto_595891 ) ) ( not ( = ?auto_595883 ?auto_595892 ) ) ( not ( = ?auto_595883 ?auto_595893 ) ) ( not ( = ?auto_595883 ?auto_595894 ) ) ( not ( = ?auto_595883 ?auto_595895 ) ) ( not ( = ?auto_595883 ?auto_595896 ) ) ( not ( = ?auto_595884 ?auto_595885 ) ) ( not ( = ?auto_595884 ?auto_595886 ) ) ( not ( = ?auto_595884 ?auto_595887 ) ) ( not ( = ?auto_595884 ?auto_595888 ) ) ( not ( = ?auto_595884 ?auto_595889 ) ) ( not ( = ?auto_595884 ?auto_595890 ) ) ( not ( = ?auto_595884 ?auto_595891 ) ) ( not ( = ?auto_595884 ?auto_595892 ) ) ( not ( = ?auto_595884 ?auto_595893 ) ) ( not ( = ?auto_595884 ?auto_595894 ) ) ( not ( = ?auto_595884 ?auto_595895 ) ) ( not ( = ?auto_595884 ?auto_595896 ) ) ( not ( = ?auto_595885 ?auto_595886 ) ) ( not ( = ?auto_595885 ?auto_595887 ) ) ( not ( = ?auto_595885 ?auto_595888 ) ) ( not ( = ?auto_595885 ?auto_595889 ) ) ( not ( = ?auto_595885 ?auto_595890 ) ) ( not ( = ?auto_595885 ?auto_595891 ) ) ( not ( = ?auto_595885 ?auto_595892 ) ) ( not ( = ?auto_595885 ?auto_595893 ) ) ( not ( = ?auto_595885 ?auto_595894 ) ) ( not ( = ?auto_595885 ?auto_595895 ) ) ( not ( = ?auto_595885 ?auto_595896 ) ) ( not ( = ?auto_595886 ?auto_595887 ) ) ( not ( = ?auto_595886 ?auto_595888 ) ) ( not ( = ?auto_595886 ?auto_595889 ) ) ( not ( = ?auto_595886 ?auto_595890 ) ) ( not ( = ?auto_595886 ?auto_595891 ) ) ( not ( = ?auto_595886 ?auto_595892 ) ) ( not ( = ?auto_595886 ?auto_595893 ) ) ( not ( = ?auto_595886 ?auto_595894 ) ) ( not ( = ?auto_595886 ?auto_595895 ) ) ( not ( = ?auto_595886 ?auto_595896 ) ) ( not ( = ?auto_595887 ?auto_595888 ) ) ( not ( = ?auto_595887 ?auto_595889 ) ) ( not ( = ?auto_595887 ?auto_595890 ) ) ( not ( = ?auto_595887 ?auto_595891 ) ) ( not ( = ?auto_595887 ?auto_595892 ) ) ( not ( = ?auto_595887 ?auto_595893 ) ) ( not ( = ?auto_595887 ?auto_595894 ) ) ( not ( = ?auto_595887 ?auto_595895 ) ) ( not ( = ?auto_595887 ?auto_595896 ) ) ( not ( = ?auto_595888 ?auto_595889 ) ) ( not ( = ?auto_595888 ?auto_595890 ) ) ( not ( = ?auto_595888 ?auto_595891 ) ) ( not ( = ?auto_595888 ?auto_595892 ) ) ( not ( = ?auto_595888 ?auto_595893 ) ) ( not ( = ?auto_595888 ?auto_595894 ) ) ( not ( = ?auto_595888 ?auto_595895 ) ) ( not ( = ?auto_595888 ?auto_595896 ) ) ( not ( = ?auto_595889 ?auto_595890 ) ) ( not ( = ?auto_595889 ?auto_595891 ) ) ( not ( = ?auto_595889 ?auto_595892 ) ) ( not ( = ?auto_595889 ?auto_595893 ) ) ( not ( = ?auto_595889 ?auto_595894 ) ) ( not ( = ?auto_595889 ?auto_595895 ) ) ( not ( = ?auto_595889 ?auto_595896 ) ) ( not ( = ?auto_595890 ?auto_595891 ) ) ( not ( = ?auto_595890 ?auto_595892 ) ) ( not ( = ?auto_595890 ?auto_595893 ) ) ( not ( = ?auto_595890 ?auto_595894 ) ) ( not ( = ?auto_595890 ?auto_595895 ) ) ( not ( = ?auto_595890 ?auto_595896 ) ) ( not ( = ?auto_595891 ?auto_595892 ) ) ( not ( = ?auto_595891 ?auto_595893 ) ) ( not ( = ?auto_595891 ?auto_595894 ) ) ( not ( = ?auto_595891 ?auto_595895 ) ) ( not ( = ?auto_595891 ?auto_595896 ) ) ( not ( = ?auto_595892 ?auto_595893 ) ) ( not ( = ?auto_595892 ?auto_595894 ) ) ( not ( = ?auto_595892 ?auto_595895 ) ) ( not ( = ?auto_595892 ?auto_595896 ) ) ( not ( = ?auto_595893 ?auto_595894 ) ) ( not ( = ?auto_595893 ?auto_595895 ) ) ( not ( = ?auto_595893 ?auto_595896 ) ) ( not ( = ?auto_595894 ?auto_595895 ) ) ( not ( = ?auto_595894 ?auto_595896 ) ) ( not ( = ?auto_595895 ?auto_595896 ) ) ( ON ?auto_595894 ?auto_595895 ) ( ON ?auto_595893 ?auto_595894 ) ( ON ?auto_595892 ?auto_595893 ) ( CLEAR ?auto_595890 ) ( ON ?auto_595891 ?auto_595892 ) ( CLEAR ?auto_595891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_595880 ?auto_595881 ?auto_595882 ?auto_595883 ?auto_595884 ?auto_595885 ?auto_595886 ?auto_595887 ?auto_595888 ?auto_595889 ?auto_595890 ?auto_595891 )
      ( MAKE-16PILE ?auto_595880 ?auto_595881 ?auto_595882 ?auto_595883 ?auto_595884 ?auto_595885 ?auto_595886 ?auto_595887 ?auto_595888 ?auto_595889 ?auto_595890 ?auto_595891 ?auto_595892 ?auto_595893 ?auto_595894 ?auto_595895 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_595946 - BLOCK
      ?auto_595947 - BLOCK
      ?auto_595948 - BLOCK
      ?auto_595949 - BLOCK
      ?auto_595950 - BLOCK
      ?auto_595951 - BLOCK
      ?auto_595952 - BLOCK
      ?auto_595953 - BLOCK
      ?auto_595954 - BLOCK
      ?auto_595955 - BLOCK
      ?auto_595956 - BLOCK
      ?auto_595957 - BLOCK
      ?auto_595958 - BLOCK
      ?auto_595959 - BLOCK
      ?auto_595960 - BLOCK
      ?auto_595961 - BLOCK
    )
    :vars
    (
      ?auto_595962 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_595961 ?auto_595962 ) ( ON-TABLE ?auto_595946 ) ( ON ?auto_595947 ?auto_595946 ) ( ON ?auto_595948 ?auto_595947 ) ( ON ?auto_595949 ?auto_595948 ) ( ON ?auto_595950 ?auto_595949 ) ( ON ?auto_595951 ?auto_595950 ) ( ON ?auto_595952 ?auto_595951 ) ( ON ?auto_595953 ?auto_595952 ) ( ON ?auto_595954 ?auto_595953 ) ( ON ?auto_595955 ?auto_595954 ) ( not ( = ?auto_595946 ?auto_595947 ) ) ( not ( = ?auto_595946 ?auto_595948 ) ) ( not ( = ?auto_595946 ?auto_595949 ) ) ( not ( = ?auto_595946 ?auto_595950 ) ) ( not ( = ?auto_595946 ?auto_595951 ) ) ( not ( = ?auto_595946 ?auto_595952 ) ) ( not ( = ?auto_595946 ?auto_595953 ) ) ( not ( = ?auto_595946 ?auto_595954 ) ) ( not ( = ?auto_595946 ?auto_595955 ) ) ( not ( = ?auto_595946 ?auto_595956 ) ) ( not ( = ?auto_595946 ?auto_595957 ) ) ( not ( = ?auto_595946 ?auto_595958 ) ) ( not ( = ?auto_595946 ?auto_595959 ) ) ( not ( = ?auto_595946 ?auto_595960 ) ) ( not ( = ?auto_595946 ?auto_595961 ) ) ( not ( = ?auto_595946 ?auto_595962 ) ) ( not ( = ?auto_595947 ?auto_595948 ) ) ( not ( = ?auto_595947 ?auto_595949 ) ) ( not ( = ?auto_595947 ?auto_595950 ) ) ( not ( = ?auto_595947 ?auto_595951 ) ) ( not ( = ?auto_595947 ?auto_595952 ) ) ( not ( = ?auto_595947 ?auto_595953 ) ) ( not ( = ?auto_595947 ?auto_595954 ) ) ( not ( = ?auto_595947 ?auto_595955 ) ) ( not ( = ?auto_595947 ?auto_595956 ) ) ( not ( = ?auto_595947 ?auto_595957 ) ) ( not ( = ?auto_595947 ?auto_595958 ) ) ( not ( = ?auto_595947 ?auto_595959 ) ) ( not ( = ?auto_595947 ?auto_595960 ) ) ( not ( = ?auto_595947 ?auto_595961 ) ) ( not ( = ?auto_595947 ?auto_595962 ) ) ( not ( = ?auto_595948 ?auto_595949 ) ) ( not ( = ?auto_595948 ?auto_595950 ) ) ( not ( = ?auto_595948 ?auto_595951 ) ) ( not ( = ?auto_595948 ?auto_595952 ) ) ( not ( = ?auto_595948 ?auto_595953 ) ) ( not ( = ?auto_595948 ?auto_595954 ) ) ( not ( = ?auto_595948 ?auto_595955 ) ) ( not ( = ?auto_595948 ?auto_595956 ) ) ( not ( = ?auto_595948 ?auto_595957 ) ) ( not ( = ?auto_595948 ?auto_595958 ) ) ( not ( = ?auto_595948 ?auto_595959 ) ) ( not ( = ?auto_595948 ?auto_595960 ) ) ( not ( = ?auto_595948 ?auto_595961 ) ) ( not ( = ?auto_595948 ?auto_595962 ) ) ( not ( = ?auto_595949 ?auto_595950 ) ) ( not ( = ?auto_595949 ?auto_595951 ) ) ( not ( = ?auto_595949 ?auto_595952 ) ) ( not ( = ?auto_595949 ?auto_595953 ) ) ( not ( = ?auto_595949 ?auto_595954 ) ) ( not ( = ?auto_595949 ?auto_595955 ) ) ( not ( = ?auto_595949 ?auto_595956 ) ) ( not ( = ?auto_595949 ?auto_595957 ) ) ( not ( = ?auto_595949 ?auto_595958 ) ) ( not ( = ?auto_595949 ?auto_595959 ) ) ( not ( = ?auto_595949 ?auto_595960 ) ) ( not ( = ?auto_595949 ?auto_595961 ) ) ( not ( = ?auto_595949 ?auto_595962 ) ) ( not ( = ?auto_595950 ?auto_595951 ) ) ( not ( = ?auto_595950 ?auto_595952 ) ) ( not ( = ?auto_595950 ?auto_595953 ) ) ( not ( = ?auto_595950 ?auto_595954 ) ) ( not ( = ?auto_595950 ?auto_595955 ) ) ( not ( = ?auto_595950 ?auto_595956 ) ) ( not ( = ?auto_595950 ?auto_595957 ) ) ( not ( = ?auto_595950 ?auto_595958 ) ) ( not ( = ?auto_595950 ?auto_595959 ) ) ( not ( = ?auto_595950 ?auto_595960 ) ) ( not ( = ?auto_595950 ?auto_595961 ) ) ( not ( = ?auto_595950 ?auto_595962 ) ) ( not ( = ?auto_595951 ?auto_595952 ) ) ( not ( = ?auto_595951 ?auto_595953 ) ) ( not ( = ?auto_595951 ?auto_595954 ) ) ( not ( = ?auto_595951 ?auto_595955 ) ) ( not ( = ?auto_595951 ?auto_595956 ) ) ( not ( = ?auto_595951 ?auto_595957 ) ) ( not ( = ?auto_595951 ?auto_595958 ) ) ( not ( = ?auto_595951 ?auto_595959 ) ) ( not ( = ?auto_595951 ?auto_595960 ) ) ( not ( = ?auto_595951 ?auto_595961 ) ) ( not ( = ?auto_595951 ?auto_595962 ) ) ( not ( = ?auto_595952 ?auto_595953 ) ) ( not ( = ?auto_595952 ?auto_595954 ) ) ( not ( = ?auto_595952 ?auto_595955 ) ) ( not ( = ?auto_595952 ?auto_595956 ) ) ( not ( = ?auto_595952 ?auto_595957 ) ) ( not ( = ?auto_595952 ?auto_595958 ) ) ( not ( = ?auto_595952 ?auto_595959 ) ) ( not ( = ?auto_595952 ?auto_595960 ) ) ( not ( = ?auto_595952 ?auto_595961 ) ) ( not ( = ?auto_595952 ?auto_595962 ) ) ( not ( = ?auto_595953 ?auto_595954 ) ) ( not ( = ?auto_595953 ?auto_595955 ) ) ( not ( = ?auto_595953 ?auto_595956 ) ) ( not ( = ?auto_595953 ?auto_595957 ) ) ( not ( = ?auto_595953 ?auto_595958 ) ) ( not ( = ?auto_595953 ?auto_595959 ) ) ( not ( = ?auto_595953 ?auto_595960 ) ) ( not ( = ?auto_595953 ?auto_595961 ) ) ( not ( = ?auto_595953 ?auto_595962 ) ) ( not ( = ?auto_595954 ?auto_595955 ) ) ( not ( = ?auto_595954 ?auto_595956 ) ) ( not ( = ?auto_595954 ?auto_595957 ) ) ( not ( = ?auto_595954 ?auto_595958 ) ) ( not ( = ?auto_595954 ?auto_595959 ) ) ( not ( = ?auto_595954 ?auto_595960 ) ) ( not ( = ?auto_595954 ?auto_595961 ) ) ( not ( = ?auto_595954 ?auto_595962 ) ) ( not ( = ?auto_595955 ?auto_595956 ) ) ( not ( = ?auto_595955 ?auto_595957 ) ) ( not ( = ?auto_595955 ?auto_595958 ) ) ( not ( = ?auto_595955 ?auto_595959 ) ) ( not ( = ?auto_595955 ?auto_595960 ) ) ( not ( = ?auto_595955 ?auto_595961 ) ) ( not ( = ?auto_595955 ?auto_595962 ) ) ( not ( = ?auto_595956 ?auto_595957 ) ) ( not ( = ?auto_595956 ?auto_595958 ) ) ( not ( = ?auto_595956 ?auto_595959 ) ) ( not ( = ?auto_595956 ?auto_595960 ) ) ( not ( = ?auto_595956 ?auto_595961 ) ) ( not ( = ?auto_595956 ?auto_595962 ) ) ( not ( = ?auto_595957 ?auto_595958 ) ) ( not ( = ?auto_595957 ?auto_595959 ) ) ( not ( = ?auto_595957 ?auto_595960 ) ) ( not ( = ?auto_595957 ?auto_595961 ) ) ( not ( = ?auto_595957 ?auto_595962 ) ) ( not ( = ?auto_595958 ?auto_595959 ) ) ( not ( = ?auto_595958 ?auto_595960 ) ) ( not ( = ?auto_595958 ?auto_595961 ) ) ( not ( = ?auto_595958 ?auto_595962 ) ) ( not ( = ?auto_595959 ?auto_595960 ) ) ( not ( = ?auto_595959 ?auto_595961 ) ) ( not ( = ?auto_595959 ?auto_595962 ) ) ( not ( = ?auto_595960 ?auto_595961 ) ) ( not ( = ?auto_595960 ?auto_595962 ) ) ( not ( = ?auto_595961 ?auto_595962 ) ) ( ON ?auto_595960 ?auto_595961 ) ( ON ?auto_595959 ?auto_595960 ) ( ON ?auto_595958 ?auto_595959 ) ( ON ?auto_595957 ?auto_595958 ) ( CLEAR ?auto_595955 ) ( ON ?auto_595956 ?auto_595957 ) ( CLEAR ?auto_595956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_595946 ?auto_595947 ?auto_595948 ?auto_595949 ?auto_595950 ?auto_595951 ?auto_595952 ?auto_595953 ?auto_595954 ?auto_595955 ?auto_595956 )
      ( MAKE-16PILE ?auto_595946 ?auto_595947 ?auto_595948 ?auto_595949 ?auto_595950 ?auto_595951 ?auto_595952 ?auto_595953 ?auto_595954 ?auto_595955 ?auto_595956 ?auto_595957 ?auto_595958 ?auto_595959 ?auto_595960 ?auto_595961 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596012 - BLOCK
      ?auto_596013 - BLOCK
      ?auto_596014 - BLOCK
      ?auto_596015 - BLOCK
      ?auto_596016 - BLOCK
      ?auto_596017 - BLOCK
      ?auto_596018 - BLOCK
      ?auto_596019 - BLOCK
      ?auto_596020 - BLOCK
      ?auto_596021 - BLOCK
      ?auto_596022 - BLOCK
      ?auto_596023 - BLOCK
      ?auto_596024 - BLOCK
      ?auto_596025 - BLOCK
      ?auto_596026 - BLOCK
      ?auto_596027 - BLOCK
    )
    :vars
    (
      ?auto_596028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596027 ?auto_596028 ) ( ON-TABLE ?auto_596012 ) ( ON ?auto_596013 ?auto_596012 ) ( ON ?auto_596014 ?auto_596013 ) ( ON ?auto_596015 ?auto_596014 ) ( ON ?auto_596016 ?auto_596015 ) ( ON ?auto_596017 ?auto_596016 ) ( ON ?auto_596018 ?auto_596017 ) ( ON ?auto_596019 ?auto_596018 ) ( ON ?auto_596020 ?auto_596019 ) ( not ( = ?auto_596012 ?auto_596013 ) ) ( not ( = ?auto_596012 ?auto_596014 ) ) ( not ( = ?auto_596012 ?auto_596015 ) ) ( not ( = ?auto_596012 ?auto_596016 ) ) ( not ( = ?auto_596012 ?auto_596017 ) ) ( not ( = ?auto_596012 ?auto_596018 ) ) ( not ( = ?auto_596012 ?auto_596019 ) ) ( not ( = ?auto_596012 ?auto_596020 ) ) ( not ( = ?auto_596012 ?auto_596021 ) ) ( not ( = ?auto_596012 ?auto_596022 ) ) ( not ( = ?auto_596012 ?auto_596023 ) ) ( not ( = ?auto_596012 ?auto_596024 ) ) ( not ( = ?auto_596012 ?auto_596025 ) ) ( not ( = ?auto_596012 ?auto_596026 ) ) ( not ( = ?auto_596012 ?auto_596027 ) ) ( not ( = ?auto_596012 ?auto_596028 ) ) ( not ( = ?auto_596013 ?auto_596014 ) ) ( not ( = ?auto_596013 ?auto_596015 ) ) ( not ( = ?auto_596013 ?auto_596016 ) ) ( not ( = ?auto_596013 ?auto_596017 ) ) ( not ( = ?auto_596013 ?auto_596018 ) ) ( not ( = ?auto_596013 ?auto_596019 ) ) ( not ( = ?auto_596013 ?auto_596020 ) ) ( not ( = ?auto_596013 ?auto_596021 ) ) ( not ( = ?auto_596013 ?auto_596022 ) ) ( not ( = ?auto_596013 ?auto_596023 ) ) ( not ( = ?auto_596013 ?auto_596024 ) ) ( not ( = ?auto_596013 ?auto_596025 ) ) ( not ( = ?auto_596013 ?auto_596026 ) ) ( not ( = ?auto_596013 ?auto_596027 ) ) ( not ( = ?auto_596013 ?auto_596028 ) ) ( not ( = ?auto_596014 ?auto_596015 ) ) ( not ( = ?auto_596014 ?auto_596016 ) ) ( not ( = ?auto_596014 ?auto_596017 ) ) ( not ( = ?auto_596014 ?auto_596018 ) ) ( not ( = ?auto_596014 ?auto_596019 ) ) ( not ( = ?auto_596014 ?auto_596020 ) ) ( not ( = ?auto_596014 ?auto_596021 ) ) ( not ( = ?auto_596014 ?auto_596022 ) ) ( not ( = ?auto_596014 ?auto_596023 ) ) ( not ( = ?auto_596014 ?auto_596024 ) ) ( not ( = ?auto_596014 ?auto_596025 ) ) ( not ( = ?auto_596014 ?auto_596026 ) ) ( not ( = ?auto_596014 ?auto_596027 ) ) ( not ( = ?auto_596014 ?auto_596028 ) ) ( not ( = ?auto_596015 ?auto_596016 ) ) ( not ( = ?auto_596015 ?auto_596017 ) ) ( not ( = ?auto_596015 ?auto_596018 ) ) ( not ( = ?auto_596015 ?auto_596019 ) ) ( not ( = ?auto_596015 ?auto_596020 ) ) ( not ( = ?auto_596015 ?auto_596021 ) ) ( not ( = ?auto_596015 ?auto_596022 ) ) ( not ( = ?auto_596015 ?auto_596023 ) ) ( not ( = ?auto_596015 ?auto_596024 ) ) ( not ( = ?auto_596015 ?auto_596025 ) ) ( not ( = ?auto_596015 ?auto_596026 ) ) ( not ( = ?auto_596015 ?auto_596027 ) ) ( not ( = ?auto_596015 ?auto_596028 ) ) ( not ( = ?auto_596016 ?auto_596017 ) ) ( not ( = ?auto_596016 ?auto_596018 ) ) ( not ( = ?auto_596016 ?auto_596019 ) ) ( not ( = ?auto_596016 ?auto_596020 ) ) ( not ( = ?auto_596016 ?auto_596021 ) ) ( not ( = ?auto_596016 ?auto_596022 ) ) ( not ( = ?auto_596016 ?auto_596023 ) ) ( not ( = ?auto_596016 ?auto_596024 ) ) ( not ( = ?auto_596016 ?auto_596025 ) ) ( not ( = ?auto_596016 ?auto_596026 ) ) ( not ( = ?auto_596016 ?auto_596027 ) ) ( not ( = ?auto_596016 ?auto_596028 ) ) ( not ( = ?auto_596017 ?auto_596018 ) ) ( not ( = ?auto_596017 ?auto_596019 ) ) ( not ( = ?auto_596017 ?auto_596020 ) ) ( not ( = ?auto_596017 ?auto_596021 ) ) ( not ( = ?auto_596017 ?auto_596022 ) ) ( not ( = ?auto_596017 ?auto_596023 ) ) ( not ( = ?auto_596017 ?auto_596024 ) ) ( not ( = ?auto_596017 ?auto_596025 ) ) ( not ( = ?auto_596017 ?auto_596026 ) ) ( not ( = ?auto_596017 ?auto_596027 ) ) ( not ( = ?auto_596017 ?auto_596028 ) ) ( not ( = ?auto_596018 ?auto_596019 ) ) ( not ( = ?auto_596018 ?auto_596020 ) ) ( not ( = ?auto_596018 ?auto_596021 ) ) ( not ( = ?auto_596018 ?auto_596022 ) ) ( not ( = ?auto_596018 ?auto_596023 ) ) ( not ( = ?auto_596018 ?auto_596024 ) ) ( not ( = ?auto_596018 ?auto_596025 ) ) ( not ( = ?auto_596018 ?auto_596026 ) ) ( not ( = ?auto_596018 ?auto_596027 ) ) ( not ( = ?auto_596018 ?auto_596028 ) ) ( not ( = ?auto_596019 ?auto_596020 ) ) ( not ( = ?auto_596019 ?auto_596021 ) ) ( not ( = ?auto_596019 ?auto_596022 ) ) ( not ( = ?auto_596019 ?auto_596023 ) ) ( not ( = ?auto_596019 ?auto_596024 ) ) ( not ( = ?auto_596019 ?auto_596025 ) ) ( not ( = ?auto_596019 ?auto_596026 ) ) ( not ( = ?auto_596019 ?auto_596027 ) ) ( not ( = ?auto_596019 ?auto_596028 ) ) ( not ( = ?auto_596020 ?auto_596021 ) ) ( not ( = ?auto_596020 ?auto_596022 ) ) ( not ( = ?auto_596020 ?auto_596023 ) ) ( not ( = ?auto_596020 ?auto_596024 ) ) ( not ( = ?auto_596020 ?auto_596025 ) ) ( not ( = ?auto_596020 ?auto_596026 ) ) ( not ( = ?auto_596020 ?auto_596027 ) ) ( not ( = ?auto_596020 ?auto_596028 ) ) ( not ( = ?auto_596021 ?auto_596022 ) ) ( not ( = ?auto_596021 ?auto_596023 ) ) ( not ( = ?auto_596021 ?auto_596024 ) ) ( not ( = ?auto_596021 ?auto_596025 ) ) ( not ( = ?auto_596021 ?auto_596026 ) ) ( not ( = ?auto_596021 ?auto_596027 ) ) ( not ( = ?auto_596021 ?auto_596028 ) ) ( not ( = ?auto_596022 ?auto_596023 ) ) ( not ( = ?auto_596022 ?auto_596024 ) ) ( not ( = ?auto_596022 ?auto_596025 ) ) ( not ( = ?auto_596022 ?auto_596026 ) ) ( not ( = ?auto_596022 ?auto_596027 ) ) ( not ( = ?auto_596022 ?auto_596028 ) ) ( not ( = ?auto_596023 ?auto_596024 ) ) ( not ( = ?auto_596023 ?auto_596025 ) ) ( not ( = ?auto_596023 ?auto_596026 ) ) ( not ( = ?auto_596023 ?auto_596027 ) ) ( not ( = ?auto_596023 ?auto_596028 ) ) ( not ( = ?auto_596024 ?auto_596025 ) ) ( not ( = ?auto_596024 ?auto_596026 ) ) ( not ( = ?auto_596024 ?auto_596027 ) ) ( not ( = ?auto_596024 ?auto_596028 ) ) ( not ( = ?auto_596025 ?auto_596026 ) ) ( not ( = ?auto_596025 ?auto_596027 ) ) ( not ( = ?auto_596025 ?auto_596028 ) ) ( not ( = ?auto_596026 ?auto_596027 ) ) ( not ( = ?auto_596026 ?auto_596028 ) ) ( not ( = ?auto_596027 ?auto_596028 ) ) ( ON ?auto_596026 ?auto_596027 ) ( ON ?auto_596025 ?auto_596026 ) ( ON ?auto_596024 ?auto_596025 ) ( ON ?auto_596023 ?auto_596024 ) ( ON ?auto_596022 ?auto_596023 ) ( CLEAR ?auto_596020 ) ( ON ?auto_596021 ?auto_596022 ) ( CLEAR ?auto_596021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_596012 ?auto_596013 ?auto_596014 ?auto_596015 ?auto_596016 ?auto_596017 ?auto_596018 ?auto_596019 ?auto_596020 ?auto_596021 )
      ( MAKE-16PILE ?auto_596012 ?auto_596013 ?auto_596014 ?auto_596015 ?auto_596016 ?auto_596017 ?auto_596018 ?auto_596019 ?auto_596020 ?auto_596021 ?auto_596022 ?auto_596023 ?auto_596024 ?auto_596025 ?auto_596026 ?auto_596027 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596078 - BLOCK
      ?auto_596079 - BLOCK
      ?auto_596080 - BLOCK
      ?auto_596081 - BLOCK
      ?auto_596082 - BLOCK
      ?auto_596083 - BLOCK
      ?auto_596084 - BLOCK
      ?auto_596085 - BLOCK
      ?auto_596086 - BLOCK
      ?auto_596087 - BLOCK
      ?auto_596088 - BLOCK
      ?auto_596089 - BLOCK
      ?auto_596090 - BLOCK
      ?auto_596091 - BLOCK
      ?auto_596092 - BLOCK
      ?auto_596093 - BLOCK
    )
    :vars
    (
      ?auto_596094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596093 ?auto_596094 ) ( ON-TABLE ?auto_596078 ) ( ON ?auto_596079 ?auto_596078 ) ( ON ?auto_596080 ?auto_596079 ) ( ON ?auto_596081 ?auto_596080 ) ( ON ?auto_596082 ?auto_596081 ) ( ON ?auto_596083 ?auto_596082 ) ( ON ?auto_596084 ?auto_596083 ) ( ON ?auto_596085 ?auto_596084 ) ( not ( = ?auto_596078 ?auto_596079 ) ) ( not ( = ?auto_596078 ?auto_596080 ) ) ( not ( = ?auto_596078 ?auto_596081 ) ) ( not ( = ?auto_596078 ?auto_596082 ) ) ( not ( = ?auto_596078 ?auto_596083 ) ) ( not ( = ?auto_596078 ?auto_596084 ) ) ( not ( = ?auto_596078 ?auto_596085 ) ) ( not ( = ?auto_596078 ?auto_596086 ) ) ( not ( = ?auto_596078 ?auto_596087 ) ) ( not ( = ?auto_596078 ?auto_596088 ) ) ( not ( = ?auto_596078 ?auto_596089 ) ) ( not ( = ?auto_596078 ?auto_596090 ) ) ( not ( = ?auto_596078 ?auto_596091 ) ) ( not ( = ?auto_596078 ?auto_596092 ) ) ( not ( = ?auto_596078 ?auto_596093 ) ) ( not ( = ?auto_596078 ?auto_596094 ) ) ( not ( = ?auto_596079 ?auto_596080 ) ) ( not ( = ?auto_596079 ?auto_596081 ) ) ( not ( = ?auto_596079 ?auto_596082 ) ) ( not ( = ?auto_596079 ?auto_596083 ) ) ( not ( = ?auto_596079 ?auto_596084 ) ) ( not ( = ?auto_596079 ?auto_596085 ) ) ( not ( = ?auto_596079 ?auto_596086 ) ) ( not ( = ?auto_596079 ?auto_596087 ) ) ( not ( = ?auto_596079 ?auto_596088 ) ) ( not ( = ?auto_596079 ?auto_596089 ) ) ( not ( = ?auto_596079 ?auto_596090 ) ) ( not ( = ?auto_596079 ?auto_596091 ) ) ( not ( = ?auto_596079 ?auto_596092 ) ) ( not ( = ?auto_596079 ?auto_596093 ) ) ( not ( = ?auto_596079 ?auto_596094 ) ) ( not ( = ?auto_596080 ?auto_596081 ) ) ( not ( = ?auto_596080 ?auto_596082 ) ) ( not ( = ?auto_596080 ?auto_596083 ) ) ( not ( = ?auto_596080 ?auto_596084 ) ) ( not ( = ?auto_596080 ?auto_596085 ) ) ( not ( = ?auto_596080 ?auto_596086 ) ) ( not ( = ?auto_596080 ?auto_596087 ) ) ( not ( = ?auto_596080 ?auto_596088 ) ) ( not ( = ?auto_596080 ?auto_596089 ) ) ( not ( = ?auto_596080 ?auto_596090 ) ) ( not ( = ?auto_596080 ?auto_596091 ) ) ( not ( = ?auto_596080 ?auto_596092 ) ) ( not ( = ?auto_596080 ?auto_596093 ) ) ( not ( = ?auto_596080 ?auto_596094 ) ) ( not ( = ?auto_596081 ?auto_596082 ) ) ( not ( = ?auto_596081 ?auto_596083 ) ) ( not ( = ?auto_596081 ?auto_596084 ) ) ( not ( = ?auto_596081 ?auto_596085 ) ) ( not ( = ?auto_596081 ?auto_596086 ) ) ( not ( = ?auto_596081 ?auto_596087 ) ) ( not ( = ?auto_596081 ?auto_596088 ) ) ( not ( = ?auto_596081 ?auto_596089 ) ) ( not ( = ?auto_596081 ?auto_596090 ) ) ( not ( = ?auto_596081 ?auto_596091 ) ) ( not ( = ?auto_596081 ?auto_596092 ) ) ( not ( = ?auto_596081 ?auto_596093 ) ) ( not ( = ?auto_596081 ?auto_596094 ) ) ( not ( = ?auto_596082 ?auto_596083 ) ) ( not ( = ?auto_596082 ?auto_596084 ) ) ( not ( = ?auto_596082 ?auto_596085 ) ) ( not ( = ?auto_596082 ?auto_596086 ) ) ( not ( = ?auto_596082 ?auto_596087 ) ) ( not ( = ?auto_596082 ?auto_596088 ) ) ( not ( = ?auto_596082 ?auto_596089 ) ) ( not ( = ?auto_596082 ?auto_596090 ) ) ( not ( = ?auto_596082 ?auto_596091 ) ) ( not ( = ?auto_596082 ?auto_596092 ) ) ( not ( = ?auto_596082 ?auto_596093 ) ) ( not ( = ?auto_596082 ?auto_596094 ) ) ( not ( = ?auto_596083 ?auto_596084 ) ) ( not ( = ?auto_596083 ?auto_596085 ) ) ( not ( = ?auto_596083 ?auto_596086 ) ) ( not ( = ?auto_596083 ?auto_596087 ) ) ( not ( = ?auto_596083 ?auto_596088 ) ) ( not ( = ?auto_596083 ?auto_596089 ) ) ( not ( = ?auto_596083 ?auto_596090 ) ) ( not ( = ?auto_596083 ?auto_596091 ) ) ( not ( = ?auto_596083 ?auto_596092 ) ) ( not ( = ?auto_596083 ?auto_596093 ) ) ( not ( = ?auto_596083 ?auto_596094 ) ) ( not ( = ?auto_596084 ?auto_596085 ) ) ( not ( = ?auto_596084 ?auto_596086 ) ) ( not ( = ?auto_596084 ?auto_596087 ) ) ( not ( = ?auto_596084 ?auto_596088 ) ) ( not ( = ?auto_596084 ?auto_596089 ) ) ( not ( = ?auto_596084 ?auto_596090 ) ) ( not ( = ?auto_596084 ?auto_596091 ) ) ( not ( = ?auto_596084 ?auto_596092 ) ) ( not ( = ?auto_596084 ?auto_596093 ) ) ( not ( = ?auto_596084 ?auto_596094 ) ) ( not ( = ?auto_596085 ?auto_596086 ) ) ( not ( = ?auto_596085 ?auto_596087 ) ) ( not ( = ?auto_596085 ?auto_596088 ) ) ( not ( = ?auto_596085 ?auto_596089 ) ) ( not ( = ?auto_596085 ?auto_596090 ) ) ( not ( = ?auto_596085 ?auto_596091 ) ) ( not ( = ?auto_596085 ?auto_596092 ) ) ( not ( = ?auto_596085 ?auto_596093 ) ) ( not ( = ?auto_596085 ?auto_596094 ) ) ( not ( = ?auto_596086 ?auto_596087 ) ) ( not ( = ?auto_596086 ?auto_596088 ) ) ( not ( = ?auto_596086 ?auto_596089 ) ) ( not ( = ?auto_596086 ?auto_596090 ) ) ( not ( = ?auto_596086 ?auto_596091 ) ) ( not ( = ?auto_596086 ?auto_596092 ) ) ( not ( = ?auto_596086 ?auto_596093 ) ) ( not ( = ?auto_596086 ?auto_596094 ) ) ( not ( = ?auto_596087 ?auto_596088 ) ) ( not ( = ?auto_596087 ?auto_596089 ) ) ( not ( = ?auto_596087 ?auto_596090 ) ) ( not ( = ?auto_596087 ?auto_596091 ) ) ( not ( = ?auto_596087 ?auto_596092 ) ) ( not ( = ?auto_596087 ?auto_596093 ) ) ( not ( = ?auto_596087 ?auto_596094 ) ) ( not ( = ?auto_596088 ?auto_596089 ) ) ( not ( = ?auto_596088 ?auto_596090 ) ) ( not ( = ?auto_596088 ?auto_596091 ) ) ( not ( = ?auto_596088 ?auto_596092 ) ) ( not ( = ?auto_596088 ?auto_596093 ) ) ( not ( = ?auto_596088 ?auto_596094 ) ) ( not ( = ?auto_596089 ?auto_596090 ) ) ( not ( = ?auto_596089 ?auto_596091 ) ) ( not ( = ?auto_596089 ?auto_596092 ) ) ( not ( = ?auto_596089 ?auto_596093 ) ) ( not ( = ?auto_596089 ?auto_596094 ) ) ( not ( = ?auto_596090 ?auto_596091 ) ) ( not ( = ?auto_596090 ?auto_596092 ) ) ( not ( = ?auto_596090 ?auto_596093 ) ) ( not ( = ?auto_596090 ?auto_596094 ) ) ( not ( = ?auto_596091 ?auto_596092 ) ) ( not ( = ?auto_596091 ?auto_596093 ) ) ( not ( = ?auto_596091 ?auto_596094 ) ) ( not ( = ?auto_596092 ?auto_596093 ) ) ( not ( = ?auto_596092 ?auto_596094 ) ) ( not ( = ?auto_596093 ?auto_596094 ) ) ( ON ?auto_596092 ?auto_596093 ) ( ON ?auto_596091 ?auto_596092 ) ( ON ?auto_596090 ?auto_596091 ) ( ON ?auto_596089 ?auto_596090 ) ( ON ?auto_596088 ?auto_596089 ) ( ON ?auto_596087 ?auto_596088 ) ( CLEAR ?auto_596085 ) ( ON ?auto_596086 ?auto_596087 ) ( CLEAR ?auto_596086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_596078 ?auto_596079 ?auto_596080 ?auto_596081 ?auto_596082 ?auto_596083 ?auto_596084 ?auto_596085 ?auto_596086 )
      ( MAKE-16PILE ?auto_596078 ?auto_596079 ?auto_596080 ?auto_596081 ?auto_596082 ?auto_596083 ?auto_596084 ?auto_596085 ?auto_596086 ?auto_596087 ?auto_596088 ?auto_596089 ?auto_596090 ?auto_596091 ?auto_596092 ?auto_596093 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596144 - BLOCK
      ?auto_596145 - BLOCK
      ?auto_596146 - BLOCK
      ?auto_596147 - BLOCK
      ?auto_596148 - BLOCK
      ?auto_596149 - BLOCK
      ?auto_596150 - BLOCK
      ?auto_596151 - BLOCK
      ?auto_596152 - BLOCK
      ?auto_596153 - BLOCK
      ?auto_596154 - BLOCK
      ?auto_596155 - BLOCK
      ?auto_596156 - BLOCK
      ?auto_596157 - BLOCK
      ?auto_596158 - BLOCK
      ?auto_596159 - BLOCK
    )
    :vars
    (
      ?auto_596160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596159 ?auto_596160 ) ( ON-TABLE ?auto_596144 ) ( ON ?auto_596145 ?auto_596144 ) ( ON ?auto_596146 ?auto_596145 ) ( ON ?auto_596147 ?auto_596146 ) ( ON ?auto_596148 ?auto_596147 ) ( ON ?auto_596149 ?auto_596148 ) ( ON ?auto_596150 ?auto_596149 ) ( not ( = ?auto_596144 ?auto_596145 ) ) ( not ( = ?auto_596144 ?auto_596146 ) ) ( not ( = ?auto_596144 ?auto_596147 ) ) ( not ( = ?auto_596144 ?auto_596148 ) ) ( not ( = ?auto_596144 ?auto_596149 ) ) ( not ( = ?auto_596144 ?auto_596150 ) ) ( not ( = ?auto_596144 ?auto_596151 ) ) ( not ( = ?auto_596144 ?auto_596152 ) ) ( not ( = ?auto_596144 ?auto_596153 ) ) ( not ( = ?auto_596144 ?auto_596154 ) ) ( not ( = ?auto_596144 ?auto_596155 ) ) ( not ( = ?auto_596144 ?auto_596156 ) ) ( not ( = ?auto_596144 ?auto_596157 ) ) ( not ( = ?auto_596144 ?auto_596158 ) ) ( not ( = ?auto_596144 ?auto_596159 ) ) ( not ( = ?auto_596144 ?auto_596160 ) ) ( not ( = ?auto_596145 ?auto_596146 ) ) ( not ( = ?auto_596145 ?auto_596147 ) ) ( not ( = ?auto_596145 ?auto_596148 ) ) ( not ( = ?auto_596145 ?auto_596149 ) ) ( not ( = ?auto_596145 ?auto_596150 ) ) ( not ( = ?auto_596145 ?auto_596151 ) ) ( not ( = ?auto_596145 ?auto_596152 ) ) ( not ( = ?auto_596145 ?auto_596153 ) ) ( not ( = ?auto_596145 ?auto_596154 ) ) ( not ( = ?auto_596145 ?auto_596155 ) ) ( not ( = ?auto_596145 ?auto_596156 ) ) ( not ( = ?auto_596145 ?auto_596157 ) ) ( not ( = ?auto_596145 ?auto_596158 ) ) ( not ( = ?auto_596145 ?auto_596159 ) ) ( not ( = ?auto_596145 ?auto_596160 ) ) ( not ( = ?auto_596146 ?auto_596147 ) ) ( not ( = ?auto_596146 ?auto_596148 ) ) ( not ( = ?auto_596146 ?auto_596149 ) ) ( not ( = ?auto_596146 ?auto_596150 ) ) ( not ( = ?auto_596146 ?auto_596151 ) ) ( not ( = ?auto_596146 ?auto_596152 ) ) ( not ( = ?auto_596146 ?auto_596153 ) ) ( not ( = ?auto_596146 ?auto_596154 ) ) ( not ( = ?auto_596146 ?auto_596155 ) ) ( not ( = ?auto_596146 ?auto_596156 ) ) ( not ( = ?auto_596146 ?auto_596157 ) ) ( not ( = ?auto_596146 ?auto_596158 ) ) ( not ( = ?auto_596146 ?auto_596159 ) ) ( not ( = ?auto_596146 ?auto_596160 ) ) ( not ( = ?auto_596147 ?auto_596148 ) ) ( not ( = ?auto_596147 ?auto_596149 ) ) ( not ( = ?auto_596147 ?auto_596150 ) ) ( not ( = ?auto_596147 ?auto_596151 ) ) ( not ( = ?auto_596147 ?auto_596152 ) ) ( not ( = ?auto_596147 ?auto_596153 ) ) ( not ( = ?auto_596147 ?auto_596154 ) ) ( not ( = ?auto_596147 ?auto_596155 ) ) ( not ( = ?auto_596147 ?auto_596156 ) ) ( not ( = ?auto_596147 ?auto_596157 ) ) ( not ( = ?auto_596147 ?auto_596158 ) ) ( not ( = ?auto_596147 ?auto_596159 ) ) ( not ( = ?auto_596147 ?auto_596160 ) ) ( not ( = ?auto_596148 ?auto_596149 ) ) ( not ( = ?auto_596148 ?auto_596150 ) ) ( not ( = ?auto_596148 ?auto_596151 ) ) ( not ( = ?auto_596148 ?auto_596152 ) ) ( not ( = ?auto_596148 ?auto_596153 ) ) ( not ( = ?auto_596148 ?auto_596154 ) ) ( not ( = ?auto_596148 ?auto_596155 ) ) ( not ( = ?auto_596148 ?auto_596156 ) ) ( not ( = ?auto_596148 ?auto_596157 ) ) ( not ( = ?auto_596148 ?auto_596158 ) ) ( not ( = ?auto_596148 ?auto_596159 ) ) ( not ( = ?auto_596148 ?auto_596160 ) ) ( not ( = ?auto_596149 ?auto_596150 ) ) ( not ( = ?auto_596149 ?auto_596151 ) ) ( not ( = ?auto_596149 ?auto_596152 ) ) ( not ( = ?auto_596149 ?auto_596153 ) ) ( not ( = ?auto_596149 ?auto_596154 ) ) ( not ( = ?auto_596149 ?auto_596155 ) ) ( not ( = ?auto_596149 ?auto_596156 ) ) ( not ( = ?auto_596149 ?auto_596157 ) ) ( not ( = ?auto_596149 ?auto_596158 ) ) ( not ( = ?auto_596149 ?auto_596159 ) ) ( not ( = ?auto_596149 ?auto_596160 ) ) ( not ( = ?auto_596150 ?auto_596151 ) ) ( not ( = ?auto_596150 ?auto_596152 ) ) ( not ( = ?auto_596150 ?auto_596153 ) ) ( not ( = ?auto_596150 ?auto_596154 ) ) ( not ( = ?auto_596150 ?auto_596155 ) ) ( not ( = ?auto_596150 ?auto_596156 ) ) ( not ( = ?auto_596150 ?auto_596157 ) ) ( not ( = ?auto_596150 ?auto_596158 ) ) ( not ( = ?auto_596150 ?auto_596159 ) ) ( not ( = ?auto_596150 ?auto_596160 ) ) ( not ( = ?auto_596151 ?auto_596152 ) ) ( not ( = ?auto_596151 ?auto_596153 ) ) ( not ( = ?auto_596151 ?auto_596154 ) ) ( not ( = ?auto_596151 ?auto_596155 ) ) ( not ( = ?auto_596151 ?auto_596156 ) ) ( not ( = ?auto_596151 ?auto_596157 ) ) ( not ( = ?auto_596151 ?auto_596158 ) ) ( not ( = ?auto_596151 ?auto_596159 ) ) ( not ( = ?auto_596151 ?auto_596160 ) ) ( not ( = ?auto_596152 ?auto_596153 ) ) ( not ( = ?auto_596152 ?auto_596154 ) ) ( not ( = ?auto_596152 ?auto_596155 ) ) ( not ( = ?auto_596152 ?auto_596156 ) ) ( not ( = ?auto_596152 ?auto_596157 ) ) ( not ( = ?auto_596152 ?auto_596158 ) ) ( not ( = ?auto_596152 ?auto_596159 ) ) ( not ( = ?auto_596152 ?auto_596160 ) ) ( not ( = ?auto_596153 ?auto_596154 ) ) ( not ( = ?auto_596153 ?auto_596155 ) ) ( not ( = ?auto_596153 ?auto_596156 ) ) ( not ( = ?auto_596153 ?auto_596157 ) ) ( not ( = ?auto_596153 ?auto_596158 ) ) ( not ( = ?auto_596153 ?auto_596159 ) ) ( not ( = ?auto_596153 ?auto_596160 ) ) ( not ( = ?auto_596154 ?auto_596155 ) ) ( not ( = ?auto_596154 ?auto_596156 ) ) ( not ( = ?auto_596154 ?auto_596157 ) ) ( not ( = ?auto_596154 ?auto_596158 ) ) ( not ( = ?auto_596154 ?auto_596159 ) ) ( not ( = ?auto_596154 ?auto_596160 ) ) ( not ( = ?auto_596155 ?auto_596156 ) ) ( not ( = ?auto_596155 ?auto_596157 ) ) ( not ( = ?auto_596155 ?auto_596158 ) ) ( not ( = ?auto_596155 ?auto_596159 ) ) ( not ( = ?auto_596155 ?auto_596160 ) ) ( not ( = ?auto_596156 ?auto_596157 ) ) ( not ( = ?auto_596156 ?auto_596158 ) ) ( not ( = ?auto_596156 ?auto_596159 ) ) ( not ( = ?auto_596156 ?auto_596160 ) ) ( not ( = ?auto_596157 ?auto_596158 ) ) ( not ( = ?auto_596157 ?auto_596159 ) ) ( not ( = ?auto_596157 ?auto_596160 ) ) ( not ( = ?auto_596158 ?auto_596159 ) ) ( not ( = ?auto_596158 ?auto_596160 ) ) ( not ( = ?auto_596159 ?auto_596160 ) ) ( ON ?auto_596158 ?auto_596159 ) ( ON ?auto_596157 ?auto_596158 ) ( ON ?auto_596156 ?auto_596157 ) ( ON ?auto_596155 ?auto_596156 ) ( ON ?auto_596154 ?auto_596155 ) ( ON ?auto_596153 ?auto_596154 ) ( ON ?auto_596152 ?auto_596153 ) ( CLEAR ?auto_596150 ) ( ON ?auto_596151 ?auto_596152 ) ( CLEAR ?auto_596151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_596144 ?auto_596145 ?auto_596146 ?auto_596147 ?auto_596148 ?auto_596149 ?auto_596150 ?auto_596151 )
      ( MAKE-16PILE ?auto_596144 ?auto_596145 ?auto_596146 ?auto_596147 ?auto_596148 ?auto_596149 ?auto_596150 ?auto_596151 ?auto_596152 ?auto_596153 ?auto_596154 ?auto_596155 ?auto_596156 ?auto_596157 ?auto_596158 ?auto_596159 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596210 - BLOCK
      ?auto_596211 - BLOCK
      ?auto_596212 - BLOCK
      ?auto_596213 - BLOCK
      ?auto_596214 - BLOCK
      ?auto_596215 - BLOCK
      ?auto_596216 - BLOCK
      ?auto_596217 - BLOCK
      ?auto_596218 - BLOCK
      ?auto_596219 - BLOCK
      ?auto_596220 - BLOCK
      ?auto_596221 - BLOCK
      ?auto_596222 - BLOCK
      ?auto_596223 - BLOCK
      ?auto_596224 - BLOCK
      ?auto_596225 - BLOCK
    )
    :vars
    (
      ?auto_596226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596225 ?auto_596226 ) ( ON-TABLE ?auto_596210 ) ( ON ?auto_596211 ?auto_596210 ) ( ON ?auto_596212 ?auto_596211 ) ( ON ?auto_596213 ?auto_596212 ) ( ON ?auto_596214 ?auto_596213 ) ( ON ?auto_596215 ?auto_596214 ) ( not ( = ?auto_596210 ?auto_596211 ) ) ( not ( = ?auto_596210 ?auto_596212 ) ) ( not ( = ?auto_596210 ?auto_596213 ) ) ( not ( = ?auto_596210 ?auto_596214 ) ) ( not ( = ?auto_596210 ?auto_596215 ) ) ( not ( = ?auto_596210 ?auto_596216 ) ) ( not ( = ?auto_596210 ?auto_596217 ) ) ( not ( = ?auto_596210 ?auto_596218 ) ) ( not ( = ?auto_596210 ?auto_596219 ) ) ( not ( = ?auto_596210 ?auto_596220 ) ) ( not ( = ?auto_596210 ?auto_596221 ) ) ( not ( = ?auto_596210 ?auto_596222 ) ) ( not ( = ?auto_596210 ?auto_596223 ) ) ( not ( = ?auto_596210 ?auto_596224 ) ) ( not ( = ?auto_596210 ?auto_596225 ) ) ( not ( = ?auto_596210 ?auto_596226 ) ) ( not ( = ?auto_596211 ?auto_596212 ) ) ( not ( = ?auto_596211 ?auto_596213 ) ) ( not ( = ?auto_596211 ?auto_596214 ) ) ( not ( = ?auto_596211 ?auto_596215 ) ) ( not ( = ?auto_596211 ?auto_596216 ) ) ( not ( = ?auto_596211 ?auto_596217 ) ) ( not ( = ?auto_596211 ?auto_596218 ) ) ( not ( = ?auto_596211 ?auto_596219 ) ) ( not ( = ?auto_596211 ?auto_596220 ) ) ( not ( = ?auto_596211 ?auto_596221 ) ) ( not ( = ?auto_596211 ?auto_596222 ) ) ( not ( = ?auto_596211 ?auto_596223 ) ) ( not ( = ?auto_596211 ?auto_596224 ) ) ( not ( = ?auto_596211 ?auto_596225 ) ) ( not ( = ?auto_596211 ?auto_596226 ) ) ( not ( = ?auto_596212 ?auto_596213 ) ) ( not ( = ?auto_596212 ?auto_596214 ) ) ( not ( = ?auto_596212 ?auto_596215 ) ) ( not ( = ?auto_596212 ?auto_596216 ) ) ( not ( = ?auto_596212 ?auto_596217 ) ) ( not ( = ?auto_596212 ?auto_596218 ) ) ( not ( = ?auto_596212 ?auto_596219 ) ) ( not ( = ?auto_596212 ?auto_596220 ) ) ( not ( = ?auto_596212 ?auto_596221 ) ) ( not ( = ?auto_596212 ?auto_596222 ) ) ( not ( = ?auto_596212 ?auto_596223 ) ) ( not ( = ?auto_596212 ?auto_596224 ) ) ( not ( = ?auto_596212 ?auto_596225 ) ) ( not ( = ?auto_596212 ?auto_596226 ) ) ( not ( = ?auto_596213 ?auto_596214 ) ) ( not ( = ?auto_596213 ?auto_596215 ) ) ( not ( = ?auto_596213 ?auto_596216 ) ) ( not ( = ?auto_596213 ?auto_596217 ) ) ( not ( = ?auto_596213 ?auto_596218 ) ) ( not ( = ?auto_596213 ?auto_596219 ) ) ( not ( = ?auto_596213 ?auto_596220 ) ) ( not ( = ?auto_596213 ?auto_596221 ) ) ( not ( = ?auto_596213 ?auto_596222 ) ) ( not ( = ?auto_596213 ?auto_596223 ) ) ( not ( = ?auto_596213 ?auto_596224 ) ) ( not ( = ?auto_596213 ?auto_596225 ) ) ( not ( = ?auto_596213 ?auto_596226 ) ) ( not ( = ?auto_596214 ?auto_596215 ) ) ( not ( = ?auto_596214 ?auto_596216 ) ) ( not ( = ?auto_596214 ?auto_596217 ) ) ( not ( = ?auto_596214 ?auto_596218 ) ) ( not ( = ?auto_596214 ?auto_596219 ) ) ( not ( = ?auto_596214 ?auto_596220 ) ) ( not ( = ?auto_596214 ?auto_596221 ) ) ( not ( = ?auto_596214 ?auto_596222 ) ) ( not ( = ?auto_596214 ?auto_596223 ) ) ( not ( = ?auto_596214 ?auto_596224 ) ) ( not ( = ?auto_596214 ?auto_596225 ) ) ( not ( = ?auto_596214 ?auto_596226 ) ) ( not ( = ?auto_596215 ?auto_596216 ) ) ( not ( = ?auto_596215 ?auto_596217 ) ) ( not ( = ?auto_596215 ?auto_596218 ) ) ( not ( = ?auto_596215 ?auto_596219 ) ) ( not ( = ?auto_596215 ?auto_596220 ) ) ( not ( = ?auto_596215 ?auto_596221 ) ) ( not ( = ?auto_596215 ?auto_596222 ) ) ( not ( = ?auto_596215 ?auto_596223 ) ) ( not ( = ?auto_596215 ?auto_596224 ) ) ( not ( = ?auto_596215 ?auto_596225 ) ) ( not ( = ?auto_596215 ?auto_596226 ) ) ( not ( = ?auto_596216 ?auto_596217 ) ) ( not ( = ?auto_596216 ?auto_596218 ) ) ( not ( = ?auto_596216 ?auto_596219 ) ) ( not ( = ?auto_596216 ?auto_596220 ) ) ( not ( = ?auto_596216 ?auto_596221 ) ) ( not ( = ?auto_596216 ?auto_596222 ) ) ( not ( = ?auto_596216 ?auto_596223 ) ) ( not ( = ?auto_596216 ?auto_596224 ) ) ( not ( = ?auto_596216 ?auto_596225 ) ) ( not ( = ?auto_596216 ?auto_596226 ) ) ( not ( = ?auto_596217 ?auto_596218 ) ) ( not ( = ?auto_596217 ?auto_596219 ) ) ( not ( = ?auto_596217 ?auto_596220 ) ) ( not ( = ?auto_596217 ?auto_596221 ) ) ( not ( = ?auto_596217 ?auto_596222 ) ) ( not ( = ?auto_596217 ?auto_596223 ) ) ( not ( = ?auto_596217 ?auto_596224 ) ) ( not ( = ?auto_596217 ?auto_596225 ) ) ( not ( = ?auto_596217 ?auto_596226 ) ) ( not ( = ?auto_596218 ?auto_596219 ) ) ( not ( = ?auto_596218 ?auto_596220 ) ) ( not ( = ?auto_596218 ?auto_596221 ) ) ( not ( = ?auto_596218 ?auto_596222 ) ) ( not ( = ?auto_596218 ?auto_596223 ) ) ( not ( = ?auto_596218 ?auto_596224 ) ) ( not ( = ?auto_596218 ?auto_596225 ) ) ( not ( = ?auto_596218 ?auto_596226 ) ) ( not ( = ?auto_596219 ?auto_596220 ) ) ( not ( = ?auto_596219 ?auto_596221 ) ) ( not ( = ?auto_596219 ?auto_596222 ) ) ( not ( = ?auto_596219 ?auto_596223 ) ) ( not ( = ?auto_596219 ?auto_596224 ) ) ( not ( = ?auto_596219 ?auto_596225 ) ) ( not ( = ?auto_596219 ?auto_596226 ) ) ( not ( = ?auto_596220 ?auto_596221 ) ) ( not ( = ?auto_596220 ?auto_596222 ) ) ( not ( = ?auto_596220 ?auto_596223 ) ) ( not ( = ?auto_596220 ?auto_596224 ) ) ( not ( = ?auto_596220 ?auto_596225 ) ) ( not ( = ?auto_596220 ?auto_596226 ) ) ( not ( = ?auto_596221 ?auto_596222 ) ) ( not ( = ?auto_596221 ?auto_596223 ) ) ( not ( = ?auto_596221 ?auto_596224 ) ) ( not ( = ?auto_596221 ?auto_596225 ) ) ( not ( = ?auto_596221 ?auto_596226 ) ) ( not ( = ?auto_596222 ?auto_596223 ) ) ( not ( = ?auto_596222 ?auto_596224 ) ) ( not ( = ?auto_596222 ?auto_596225 ) ) ( not ( = ?auto_596222 ?auto_596226 ) ) ( not ( = ?auto_596223 ?auto_596224 ) ) ( not ( = ?auto_596223 ?auto_596225 ) ) ( not ( = ?auto_596223 ?auto_596226 ) ) ( not ( = ?auto_596224 ?auto_596225 ) ) ( not ( = ?auto_596224 ?auto_596226 ) ) ( not ( = ?auto_596225 ?auto_596226 ) ) ( ON ?auto_596224 ?auto_596225 ) ( ON ?auto_596223 ?auto_596224 ) ( ON ?auto_596222 ?auto_596223 ) ( ON ?auto_596221 ?auto_596222 ) ( ON ?auto_596220 ?auto_596221 ) ( ON ?auto_596219 ?auto_596220 ) ( ON ?auto_596218 ?auto_596219 ) ( ON ?auto_596217 ?auto_596218 ) ( CLEAR ?auto_596215 ) ( ON ?auto_596216 ?auto_596217 ) ( CLEAR ?auto_596216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_596210 ?auto_596211 ?auto_596212 ?auto_596213 ?auto_596214 ?auto_596215 ?auto_596216 )
      ( MAKE-16PILE ?auto_596210 ?auto_596211 ?auto_596212 ?auto_596213 ?auto_596214 ?auto_596215 ?auto_596216 ?auto_596217 ?auto_596218 ?auto_596219 ?auto_596220 ?auto_596221 ?auto_596222 ?auto_596223 ?auto_596224 ?auto_596225 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596276 - BLOCK
      ?auto_596277 - BLOCK
      ?auto_596278 - BLOCK
      ?auto_596279 - BLOCK
      ?auto_596280 - BLOCK
      ?auto_596281 - BLOCK
      ?auto_596282 - BLOCK
      ?auto_596283 - BLOCK
      ?auto_596284 - BLOCK
      ?auto_596285 - BLOCK
      ?auto_596286 - BLOCK
      ?auto_596287 - BLOCK
      ?auto_596288 - BLOCK
      ?auto_596289 - BLOCK
      ?auto_596290 - BLOCK
      ?auto_596291 - BLOCK
    )
    :vars
    (
      ?auto_596292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596291 ?auto_596292 ) ( ON-TABLE ?auto_596276 ) ( ON ?auto_596277 ?auto_596276 ) ( ON ?auto_596278 ?auto_596277 ) ( ON ?auto_596279 ?auto_596278 ) ( ON ?auto_596280 ?auto_596279 ) ( not ( = ?auto_596276 ?auto_596277 ) ) ( not ( = ?auto_596276 ?auto_596278 ) ) ( not ( = ?auto_596276 ?auto_596279 ) ) ( not ( = ?auto_596276 ?auto_596280 ) ) ( not ( = ?auto_596276 ?auto_596281 ) ) ( not ( = ?auto_596276 ?auto_596282 ) ) ( not ( = ?auto_596276 ?auto_596283 ) ) ( not ( = ?auto_596276 ?auto_596284 ) ) ( not ( = ?auto_596276 ?auto_596285 ) ) ( not ( = ?auto_596276 ?auto_596286 ) ) ( not ( = ?auto_596276 ?auto_596287 ) ) ( not ( = ?auto_596276 ?auto_596288 ) ) ( not ( = ?auto_596276 ?auto_596289 ) ) ( not ( = ?auto_596276 ?auto_596290 ) ) ( not ( = ?auto_596276 ?auto_596291 ) ) ( not ( = ?auto_596276 ?auto_596292 ) ) ( not ( = ?auto_596277 ?auto_596278 ) ) ( not ( = ?auto_596277 ?auto_596279 ) ) ( not ( = ?auto_596277 ?auto_596280 ) ) ( not ( = ?auto_596277 ?auto_596281 ) ) ( not ( = ?auto_596277 ?auto_596282 ) ) ( not ( = ?auto_596277 ?auto_596283 ) ) ( not ( = ?auto_596277 ?auto_596284 ) ) ( not ( = ?auto_596277 ?auto_596285 ) ) ( not ( = ?auto_596277 ?auto_596286 ) ) ( not ( = ?auto_596277 ?auto_596287 ) ) ( not ( = ?auto_596277 ?auto_596288 ) ) ( not ( = ?auto_596277 ?auto_596289 ) ) ( not ( = ?auto_596277 ?auto_596290 ) ) ( not ( = ?auto_596277 ?auto_596291 ) ) ( not ( = ?auto_596277 ?auto_596292 ) ) ( not ( = ?auto_596278 ?auto_596279 ) ) ( not ( = ?auto_596278 ?auto_596280 ) ) ( not ( = ?auto_596278 ?auto_596281 ) ) ( not ( = ?auto_596278 ?auto_596282 ) ) ( not ( = ?auto_596278 ?auto_596283 ) ) ( not ( = ?auto_596278 ?auto_596284 ) ) ( not ( = ?auto_596278 ?auto_596285 ) ) ( not ( = ?auto_596278 ?auto_596286 ) ) ( not ( = ?auto_596278 ?auto_596287 ) ) ( not ( = ?auto_596278 ?auto_596288 ) ) ( not ( = ?auto_596278 ?auto_596289 ) ) ( not ( = ?auto_596278 ?auto_596290 ) ) ( not ( = ?auto_596278 ?auto_596291 ) ) ( not ( = ?auto_596278 ?auto_596292 ) ) ( not ( = ?auto_596279 ?auto_596280 ) ) ( not ( = ?auto_596279 ?auto_596281 ) ) ( not ( = ?auto_596279 ?auto_596282 ) ) ( not ( = ?auto_596279 ?auto_596283 ) ) ( not ( = ?auto_596279 ?auto_596284 ) ) ( not ( = ?auto_596279 ?auto_596285 ) ) ( not ( = ?auto_596279 ?auto_596286 ) ) ( not ( = ?auto_596279 ?auto_596287 ) ) ( not ( = ?auto_596279 ?auto_596288 ) ) ( not ( = ?auto_596279 ?auto_596289 ) ) ( not ( = ?auto_596279 ?auto_596290 ) ) ( not ( = ?auto_596279 ?auto_596291 ) ) ( not ( = ?auto_596279 ?auto_596292 ) ) ( not ( = ?auto_596280 ?auto_596281 ) ) ( not ( = ?auto_596280 ?auto_596282 ) ) ( not ( = ?auto_596280 ?auto_596283 ) ) ( not ( = ?auto_596280 ?auto_596284 ) ) ( not ( = ?auto_596280 ?auto_596285 ) ) ( not ( = ?auto_596280 ?auto_596286 ) ) ( not ( = ?auto_596280 ?auto_596287 ) ) ( not ( = ?auto_596280 ?auto_596288 ) ) ( not ( = ?auto_596280 ?auto_596289 ) ) ( not ( = ?auto_596280 ?auto_596290 ) ) ( not ( = ?auto_596280 ?auto_596291 ) ) ( not ( = ?auto_596280 ?auto_596292 ) ) ( not ( = ?auto_596281 ?auto_596282 ) ) ( not ( = ?auto_596281 ?auto_596283 ) ) ( not ( = ?auto_596281 ?auto_596284 ) ) ( not ( = ?auto_596281 ?auto_596285 ) ) ( not ( = ?auto_596281 ?auto_596286 ) ) ( not ( = ?auto_596281 ?auto_596287 ) ) ( not ( = ?auto_596281 ?auto_596288 ) ) ( not ( = ?auto_596281 ?auto_596289 ) ) ( not ( = ?auto_596281 ?auto_596290 ) ) ( not ( = ?auto_596281 ?auto_596291 ) ) ( not ( = ?auto_596281 ?auto_596292 ) ) ( not ( = ?auto_596282 ?auto_596283 ) ) ( not ( = ?auto_596282 ?auto_596284 ) ) ( not ( = ?auto_596282 ?auto_596285 ) ) ( not ( = ?auto_596282 ?auto_596286 ) ) ( not ( = ?auto_596282 ?auto_596287 ) ) ( not ( = ?auto_596282 ?auto_596288 ) ) ( not ( = ?auto_596282 ?auto_596289 ) ) ( not ( = ?auto_596282 ?auto_596290 ) ) ( not ( = ?auto_596282 ?auto_596291 ) ) ( not ( = ?auto_596282 ?auto_596292 ) ) ( not ( = ?auto_596283 ?auto_596284 ) ) ( not ( = ?auto_596283 ?auto_596285 ) ) ( not ( = ?auto_596283 ?auto_596286 ) ) ( not ( = ?auto_596283 ?auto_596287 ) ) ( not ( = ?auto_596283 ?auto_596288 ) ) ( not ( = ?auto_596283 ?auto_596289 ) ) ( not ( = ?auto_596283 ?auto_596290 ) ) ( not ( = ?auto_596283 ?auto_596291 ) ) ( not ( = ?auto_596283 ?auto_596292 ) ) ( not ( = ?auto_596284 ?auto_596285 ) ) ( not ( = ?auto_596284 ?auto_596286 ) ) ( not ( = ?auto_596284 ?auto_596287 ) ) ( not ( = ?auto_596284 ?auto_596288 ) ) ( not ( = ?auto_596284 ?auto_596289 ) ) ( not ( = ?auto_596284 ?auto_596290 ) ) ( not ( = ?auto_596284 ?auto_596291 ) ) ( not ( = ?auto_596284 ?auto_596292 ) ) ( not ( = ?auto_596285 ?auto_596286 ) ) ( not ( = ?auto_596285 ?auto_596287 ) ) ( not ( = ?auto_596285 ?auto_596288 ) ) ( not ( = ?auto_596285 ?auto_596289 ) ) ( not ( = ?auto_596285 ?auto_596290 ) ) ( not ( = ?auto_596285 ?auto_596291 ) ) ( not ( = ?auto_596285 ?auto_596292 ) ) ( not ( = ?auto_596286 ?auto_596287 ) ) ( not ( = ?auto_596286 ?auto_596288 ) ) ( not ( = ?auto_596286 ?auto_596289 ) ) ( not ( = ?auto_596286 ?auto_596290 ) ) ( not ( = ?auto_596286 ?auto_596291 ) ) ( not ( = ?auto_596286 ?auto_596292 ) ) ( not ( = ?auto_596287 ?auto_596288 ) ) ( not ( = ?auto_596287 ?auto_596289 ) ) ( not ( = ?auto_596287 ?auto_596290 ) ) ( not ( = ?auto_596287 ?auto_596291 ) ) ( not ( = ?auto_596287 ?auto_596292 ) ) ( not ( = ?auto_596288 ?auto_596289 ) ) ( not ( = ?auto_596288 ?auto_596290 ) ) ( not ( = ?auto_596288 ?auto_596291 ) ) ( not ( = ?auto_596288 ?auto_596292 ) ) ( not ( = ?auto_596289 ?auto_596290 ) ) ( not ( = ?auto_596289 ?auto_596291 ) ) ( not ( = ?auto_596289 ?auto_596292 ) ) ( not ( = ?auto_596290 ?auto_596291 ) ) ( not ( = ?auto_596290 ?auto_596292 ) ) ( not ( = ?auto_596291 ?auto_596292 ) ) ( ON ?auto_596290 ?auto_596291 ) ( ON ?auto_596289 ?auto_596290 ) ( ON ?auto_596288 ?auto_596289 ) ( ON ?auto_596287 ?auto_596288 ) ( ON ?auto_596286 ?auto_596287 ) ( ON ?auto_596285 ?auto_596286 ) ( ON ?auto_596284 ?auto_596285 ) ( ON ?auto_596283 ?auto_596284 ) ( ON ?auto_596282 ?auto_596283 ) ( CLEAR ?auto_596280 ) ( ON ?auto_596281 ?auto_596282 ) ( CLEAR ?auto_596281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_596276 ?auto_596277 ?auto_596278 ?auto_596279 ?auto_596280 ?auto_596281 )
      ( MAKE-16PILE ?auto_596276 ?auto_596277 ?auto_596278 ?auto_596279 ?auto_596280 ?auto_596281 ?auto_596282 ?auto_596283 ?auto_596284 ?auto_596285 ?auto_596286 ?auto_596287 ?auto_596288 ?auto_596289 ?auto_596290 ?auto_596291 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596342 - BLOCK
      ?auto_596343 - BLOCK
      ?auto_596344 - BLOCK
      ?auto_596345 - BLOCK
      ?auto_596346 - BLOCK
      ?auto_596347 - BLOCK
      ?auto_596348 - BLOCK
      ?auto_596349 - BLOCK
      ?auto_596350 - BLOCK
      ?auto_596351 - BLOCK
      ?auto_596352 - BLOCK
      ?auto_596353 - BLOCK
      ?auto_596354 - BLOCK
      ?auto_596355 - BLOCK
      ?auto_596356 - BLOCK
      ?auto_596357 - BLOCK
    )
    :vars
    (
      ?auto_596358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596357 ?auto_596358 ) ( ON-TABLE ?auto_596342 ) ( ON ?auto_596343 ?auto_596342 ) ( ON ?auto_596344 ?auto_596343 ) ( ON ?auto_596345 ?auto_596344 ) ( not ( = ?auto_596342 ?auto_596343 ) ) ( not ( = ?auto_596342 ?auto_596344 ) ) ( not ( = ?auto_596342 ?auto_596345 ) ) ( not ( = ?auto_596342 ?auto_596346 ) ) ( not ( = ?auto_596342 ?auto_596347 ) ) ( not ( = ?auto_596342 ?auto_596348 ) ) ( not ( = ?auto_596342 ?auto_596349 ) ) ( not ( = ?auto_596342 ?auto_596350 ) ) ( not ( = ?auto_596342 ?auto_596351 ) ) ( not ( = ?auto_596342 ?auto_596352 ) ) ( not ( = ?auto_596342 ?auto_596353 ) ) ( not ( = ?auto_596342 ?auto_596354 ) ) ( not ( = ?auto_596342 ?auto_596355 ) ) ( not ( = ?auto_596342 ?auto_596356 ) ) ( not ( = ?auto_596342 ?auto_596357 ) ) ( not ( = ?auto_596342 ?auto_596358 ) ) ( not ( = ?auto_596343 ?auto_596344 ) ) ( not ( = ?auto_596343 ?auto_596345 ) ) ( not ( = ?auto_596343 ?auto_596346 ) ) ( not ( = ?auto_596343 ?auto_596347 ) ) ( not ( = ?auto_596343 ?auto_596348 ) ) ( not ( = ?auto_596343 ?auto_596349 ) ) ( not ( = ?auto_596343 ?auto_596350 ) ) ( not ( = ?auto_596343 ?auto_596351 ) ) ( not ( = ?auto_596343 ?auto_596352 ) ) ( not ( = ?auto_596343 ?auto_596353 ) ) ( not ( = ?auto_596343 ?auto_596354 ) ) ( not ( = ?auto_596343 ?auto_596355 ) ) ( not ( = ?auto_596343 ?auto_596356 ) ) ( not ( = ?auto_596343 ?auto_596357 ) ) ( not ( = ?auto_596343 ?auto_596358 ) ) ( not ( = ?auto_596344 ?auto_596345 ) ) ( not ( = ?auto_596344 ?auto_596346 ) ) ( not ( = ?auto_596344 ?auto_596347 ) ) ( not ( = ?auto_596344 ?auto_596348 ) ) ( not ( = ?auto_596344 ?auto_596349 ) ) ( not ( = ?auto_596344 ?auto_596350 ) ) ( not ( = ?auto_596344 ?auto_596351 ) ) ( not ( = ?auto_596344 ?auto_596352 ) ) ( not ( = ?auto_596344 ?auto_596353 ) ) ( not ( = ?auto_596344 ?auto_596354 ) ) ( not ( = ?auto_596344 ?auto_596355 ) ) ( not ( = ?auto_596344 ?auto_596356 ) ) ( not ( = ?auto_596344 ?auto_596357 ) ) ( not ( = ?auto_596344 ?auto_596358 ) ) ( not ( = ?auto_596345 ?auto_596346 ) ) ( not ( = ?auto_596345 ?auto_596347 ) ) ( not ( = ?auto_596345 ?auto_596348 ) ) ( not ( = ?auto_596345 ?auto_596349 ) ) ( not ( = ?auto_596345 ?auto_596350 ) ) ( not ( = ?auto_596345 ?auto_596351 ) ) ( not ( = ?auto_596345 ?auto_596352 ) ) ( not ( = ?auto_596345 ?auto_596353 ) ) ( not ( = ?auto_596345 ?auto_596354 ) ) ( not ( = ?auto_596345 ?auto_596355 ) ) ( not ( = ?auto_596345 ?auto_596356 ) ) ( not ( = ?auto_596345 ?auto_596357 ) ) ( not ( = ?auto_596345 ?auto_596358 ) ) ( not ( = ?auto_596346 ?auto_596347 ) ) ( not ( = ?auto_596346 ?auto_596348 ) ) ( not ( = ?auto_596346 ?auto_596349 ) ) ( not ( = ?auto_596346 ?auto_596350 ) ) ( not ( = ?auto_596346 ?auto_596351 ) ) ( not ( = ?auto_596346 ?auto_596352 ) ) ( not ( = ?auto_596346 ?auto_596353 ) ) ( not ( = ?auto_596346 ?auto_596354 ) ) ( not ( = ?auto_596346 ?auto_596355 ) ) ( not ( = ?auto_596346 ?auto_596356 ) ) ( not ( = ?auto_596346 ?auto_596357 ) ) ( not ( = ?auto_596346 ?auto_596358 ) ) ( not ( = ?auto_596347 ?auto_596348 ) ) ( not ( = ?auto_596347 ?auto_596349 ) ) ( not ( = ?auto_596347 ?auto_596350 ) ) ( not ( = ?auto_596347 ?auto_596351 ) ) ( not ( = ?auto_596347 ?auto_596352 ) ) ( not ( = ?auto_596347 ?auto_596353 ) ) ( not ( = ?auto_596347 ?auto_596354 ) ) ( not ( = ?auto_596347 ?auto_596355 ) ) ( not ( = ?auto_596347 ?auto_596356 ) ) ( not ( = ?auto_596347 ?auto_596357 ) ) ( not ( = ?auto_596347 ?auto_596358 ) ) ( not ( = ?auto_596348 ?auto_596349 ) ) ( not ( = ?auto_596348 ?auto_596350 ) ) ( not ( = ?auto_596348 ?auto_596351 ) ) ( not ( = ?auto_596348 ?auto_596352 ) ) ( not ( = ?auto_596348 ?auto_596353 ) ) ( not ( = ?auto_596348 ?auto_596354 ) ) ( not ( = ?auto_596348 ?auto_596355 ) ) ( not ( = ?auto_596348 ?auto_596356 ) ) ( not ( = ?auto_596348 ?auto_596357 ) ) ( not ( = ?auto_596348 ?auto_596358 ) ) ( not ( = ?auto_596349 ?auto_596350 ) ) ( not ( = ?auto_596349 ?auto_596351 ) ) ( not ( = ?auto_596349 ?auto_596352 ) ) ( not ( = ?auto_596349 ?auto_596353 ) ) ( not ( = ?auto_596349 ?auto_596354 ) ) ( not ( = ?auto_596349 ?auto_596355 ) ) ( not ( = ?auto_596349 ?auto_596356 ) ) ( not ( = ?auto_596349 ?auto_596357 ) ) ( not ( = ?auto_596349 ?auto_596358 ) ) ( not ( = ?auto_596350 ?auto_596351 ) ) ( not ( = ?auto_596350 ?auto_596352 ) ) ( not ( = ?auto_596350 ?auto_596353 ) ) ( not ( = ?auto_596350 ?auto_596354 ) ) ( not ( = ?auto_596350 ?auto_596355 ) ) ( not ( = ?auto_596350 ?auto_596356 ) ) ( not ( = ?auto_596350 ?auto_596357 ) ) ( not ( = ?auto_596350 ?auto_596358 ) ) ( not ( = ?auto_596351 ?auto_596352 ) ) ( not ( = ?auto_596351 ?auto_596353 ) ) ( not ( = ?auto_596351 ?auto_596354 ) ) ( not ( = ?auto_596351 ?auto_596355 ) ) ( not ( = ?auto_596351 ?auto_596356 ) ) ( not ( = ?auto_596351 ?auto_596357 ) ) ( not ( = ?auto_596351 ?auto_596358 ) ) ( not ( = ?auto_596352 ?auto_596353 ) ) ( not ( = ?auto_596352 ?auto_596354 ) ) ( not ( = ?auto_596352 ?auto_596355 ) ) ( not ( = ?auto_596352 ?auto_596356 ) ) ( not ( = ?auto_596352 ?auto_596357 ) ) ( not ( = ?auto_596352 ?auto_596358 ) ) ( not ( = ?auto_596353 ?auto_596354 ) ) ( not ( = ?auto_596353 ?auto_596355 ) ) ( not ( = ?auto_596353 ?auto_596356 ) ) ( not ( = ?auto_596353 ?auto_596357 ) ) ( not ( = ?auto_596353 ?auto_596358 ) ) ( not ( = ?auto_596354 ?auto_596355 ) ) ( not ( = ?auto_596354 ?auto_596356 ) ) ( not ( = ?auto_596354 ?auto_596357 ) ) ( not ( = ?auto_596354 ?auto_596358 ) ) ( not ( = ?auto_596355 ?auto_596356 ) ) ( not ( = ?auto_596355 ?auto_596357 ) ) ( not ( = ?auto_596355 ?auto_596358 ) ) ( not ( = ?auto_596356 ?auto_596357 ) ) ( not ( = ?auto_596356 ?auto_596358 ) ) ( not ( = ?auto_596357 ?auto_596358 ) ) ( ON ?auto_596356 ?auto_596357 ) ( ON ?auto_596355 ?auto_596356 ) ( ON ?auto_596354 ?auto_596355 ) ( ON ?auto_596353 ?auto_596354 ) ( ON ?auto_596352 ?auto_596353 ) ( ON ?auto_596351 ?auto_596352 ) ( ON ?auto_596350 ?auto_596351 ) ( ON ?auto_596349 ?auto_596350 ) ( ON ?auto_596348 ?auto_596349 ) ( ON ?auto_596347 ?auto_596348 ) ( CLEAR ?auto_596345 ) ( ON ?auto_596346 ?auto_596347 ) ( CLEAR ?auto_596346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_596342 ?auto_596343 ?auto_596344 ?auto_596345 ?auto_596346 )
      ( MAKE-16PILE ?auto_596342 ?auto_596343 ?auto_596344 ?auto_596345 ?auto_596346 ?auto_596347 ?auto_596348 ?auto_596349 ?auto_596350 ?auto_596351 ?auto_596352 ?auto_596353 ?auto_596354 ?auto_596355 ?auto_596356 ?auto_596357 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596408 - BLOCK
      ?auto_596409 - BLOCK
      ?auto_596410 - BLOCK
      ?auto_596411 - BLOCK
      ?auto_596412 - BLOCK
      ?auto_596413 - BLOCK
      ?auto_596414 - BLOCK
      ?auto_596415 - BLOCK
      ?auto_596416 - BLOCK
      ?auto_596417 - BLOCK
      ?auto_596418 - BLOCK
      ?auto_596419 - BLOCK
      ?auto_596420 - BLOCK
      ?auto_596421 - BLOCK
      ?auto_596422 - BLOCK
      ?auto_596423 - BLOCK
    )
    :vars
    (
      ?auto_596424 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596423 ?auto_596424 ) ( ON-TABLE ?auto_596408 ) ( ON ?auto_596409 ?auto_596408 ) ( ON ?auto_596410 ?auto_596409 ) ( not ( = ?auto_596408 ?auto_596409 ) ) ( not ( = ?auto_596408 ?auto_596410 ) ) ( not ( = ?auto_596408 ?auto_596411 ) ) ( not ( = ?auto_596408 ?auto_596412 ) ) ( not ( = ?auto_596408 ?auto_596413 ) ) ( not ( = ?auto_596408 ?auto_596414 ) ) ( not ( = ?auto_596408 ?auto_596415 ) ) ( not ( = ?auto_596408 ?auto_596416 ) ) ( not ( = ?auto_596408 ?auto_596417 ) ) ( not ( = ?auto_596408 ?auto_596418 ) ) ( not ( = ?auto_596408 ?auto_596419 ) ) ( not ( = ?auto_596408 ?auto_596420 ) ) ( not ( = ?auto_596408 ?auto_596421 ) ) ( not ( = ?auto_596408 ?auto_596422 ) ) ( not ( = ?auto_596408 ?auto_596423 ) ) ( not ( = ?auto_596408 ?auto_596424 ) ) ( not ( = ?auto_596409 ?auto_596410 ) ) ( not ( = ?auto_596409 ?auto_596411 ) ) ( not ( = ?auto_596409 ?auto_596412 ) ) ( not ( = ?auto_596409 ?auto_596413 ) ) ( not ( = ?auto_596409 ?auto_596414 ) ) ( not ( = ?auto_596409 ?auto_596415 ) ) ( not ( = ?auto_596409 ?auto_596416 ) ) ( not ( = ?auto_596409 ?auto_596417 ) ) ( not ( = ?auto_596409 ?auto_596418 ) ) ( not ( = ?auto_596409 ?auto_596419 ) ) ( not ( = ?auto_596409 ?auto_596420 ) ) ( not ( = ?auto_596409 ?auto_596421 ) ) ( not ( = ?auto_596409 ?auto_596422 ) ) ( not ( = ?auto_596409 ?auto_596423 ) ) ( not ( = ?auto_596409 ?auto_596424 ) ) ( not ( = ?auto_596410 ?auto_596411 ) ) ( not ( = ?auto_596410 ?auto_596412 ) ) ( not ( = ?auto_596410 ?auto_596413 ) ) ( not ( = ?auto_596410 ?auto_596414 ) ) ( not ( = ?auto_596410 ?auto_596415 ) ) ( not ( = ?auto_596410 ?auto_596416 ) ) ( not ( = ?auto_596410 ?auto_596417 ) ) ( not ( = ?auto_596410 ?auto_596418 ) ) ( not ( = ?auto_596410 ?auto_596419 ) ) ( not ( = ?auto_596410 ?auto_596420 ) ) ( not ( = ?auto_596410 ?auto_596421 ) ) ( not ( = ?auto_596410 ?auto_596422 ) ) ( not ( = ?auto_596410 ?auto_596423 ) ) ( not ( = ?auto_596410 ?auto_596424 ) ) ( not ( = ?auto_596411 ?auto_596412 ) ) ( not ( = ?auto_596411 ?auto_596413 ) ) ( not ( = ?auto_596411 ?auto_596414 ) ) ( not ( = ?auto_596411 ?auto_596415 ) ) ( not ( = ?auto_596411 ?auto_596416 ) ) ( not ( = ?auto_596411 ?auto_596417 ) ) ( not ( = ?auto_596411 ?auto_596418 ) ) ( not ( = ?auto_596411 ?auto_596419 ) ) ( not ( = ?auto_596411 ?auto_596420 ) ) ( not ( = ?auto_596411 ?auto_596421 ) ) ( not ( = ?auto_596411 ?auto_596422 ) ) ( not ( = ?auto_596411 ?auto_596423 ) ) ( not ( = ?auto_596411 ?auto_596424 ) ) ( not ( = ?auto_596412 ?auto_596413 ) ) ( not ( = ?auto_596412 ?auto_596414 ) ) ( not ( = ?auto_596412 ?auto_596415 ) ) ( not ( = ?auto_596412 ?auto_596416 ) ) ( not ( = ?auto_596412 ?auto_596417 ) ) ( not ( = ?auto_596412 ?auto_596418 ) ) ( not ( = ?auto_596412 ?auto_596419 ) ) ( not ( = ?auto_596412 ?auto_596420 ) ) ( not ( = ?auto_596412 ?auto_596421 ) ) ( not ( = ?auto_596412 ?auto_596422 ) ) ( not ( = ?auto_596412 ?auto_596423 ) ) ( not ( = ?auto_596412 ?auto_596424 ) ) ( not ( = ?auto_596413 ?auto_596414 ) ) ( not ( = ?auto_596413 ?auto_596415 ) ) ( not ( = ?auto_596413 ?auto_596416 ) ) ( not ( = ?auto_596413 ?auto_596417 ) ) ( not ( = ?auto_596413 ?auto_596418 ) ) ( not ( = ?auto_596413 ?auto_596419 ) ) ( not ( = ?auto_596413 ?auto_596420 ) ) ( not ( = ?auto_596413 ?auto_596421 ) ) ( not ( = ?auto_596413 ?auto_596422 ) ) ( not ( = ?auto_596413 ?auto_596423 ) ) ( not ( = ?auto_596413 ?auto_596424 ) ) ( not ( = ?auto_596414 ?auto_596415 ) ) ( not ( = ?auto_596414 ?auto_596416 ) ) ( not ( = ?auto_596414 ?auto_596417 ) ) ( not ( = ?auto_596414 ?auto_596418 ) ) ( not ( = ?auto_596414 ?auto_596419 ) ) ( not ( = ?auto_596414 ?auto_596420 ) ) ( not ( = ?auto_596414 ?auto_596421 ) ) ( not ( = ?auto_596414 ?auto_596422 ) ) ( not ( = ?auto_596414 ?auto_596423 ) ) ( not ( = ?auto_596414 ?auto_596424 ) ) ( not ( = ?auto_596415 ?auto_596416 ) ) ( not ( = ?auto_596415 ?auto_596417 ) ) ( not ( = ?auto_596415 ?auto_596418 ) ) ( not ( = ?auto_596415 ?auto_596419 ) ) ( not ( = ?auto_596415 ?auto_596420 ) ) ( not ( = ?auto_596415 ?auto_596421 ) ) ( not ( = ?auto_596415 ?auto_596422 ) ) ( not ( = ?auto_596415 ?auto_596423 ) ) ( not ( = ?auto_596415 ?auto_596424 ) ) ( not ( = ?auto_596416 ?auto_596417 ) ) ( not ( = ?auto_596416 ?auto_596418 ) ) ( not ( = ?auto_596416 ?auto_596419 ) ) ( not ( = ?auto_596416 ?auto_596420 ) ) ( not ( = ?auto_596416 ?auto_596421 ) ) ( not ( = ?auto_596416 ?auto_596422 ) ) ( not ( = ?auto_596416 ?auto_596423 ) ) ( not ( = ?auto_596416 ?auto_596424 ) ) ( not ( = ?auto_596417 ?auto_596418 ) ) ( not ( = ?auto_596417 ?auto_596419 ) ) ( not ( = ?auto_596417 ?auto_596420 ) ) ( not ( = ?auto_596417 ?auto_596421 ) ) ( not ( = ?auto_596417 ?auto_596422 ) ) ( not ( = ?auto_596417 ?auto_596423 ) ) ( not ( = ?auto_596417 ?auto_596424 ) ) ( not ( = ?auto_596418 ?auto_596419 ) ) ( not ( = ?auto_596418 ?auto_596420 ) ) ( not ( = ?auto_596418 ?auto_596421 ) ) ( not ( = ?auto_596418 ?auto_596422 ) ) ( not ( = ?auto_596418 ?auto_596423 ) ) ( not ( = ?auto_596418 ?auto_596424 ) ) ( not ( = ?auto_596419 ?auto_596420 ) ) ( not ( = ?auto_596419 ?auto_596421 ) ) ( not ( = ?auto_596419 ?auto_596422 ) ) ( not ( = ?auto_596419 ?auto_596423 ) ) ( not ( = ?auto_596419 ?auto_596424 ) ) ( not ( = ?auto_596420 ?auto_596421 ) ) ( not ( = ?auto_596420 ?auto_596422 ) ) ( not ( = ?auto_596420 ?auto_596423 ) ) ( not ( = ?auto_596420 ?auto_596424 ) ) ( not ( = ?auto_596421 ?auto_596422 ) ) ( not ( = ?auto_596421 ?auto_596423 ) ) ( not ( = ?auto_596421 ?auto_596424 ) ) ( not ( = ?auto_596422 ?auto_596423 ) ) ( not ( = ?auto_596422 ?auto_596424 ) ) ( not ( = ?auto_596423 ?auto_596424 ) ) ( ON ?auto_596422 ?auto_596423 ) ( ON ?auto_596421 ?auto_596422 ) ( ON ?auto_596420 ?auto_596421 ) ( ON ?auto_596419 ?auto_596420 ) ( ON ?auto_596418 ?auto_596419 ) ( ON ?auto_596417 ?auto_596418 ) ( ON ?auto_596416 ?auto_596417 ) ( ON ?auto_596415 ?auto_596416 ) ( ON ?auto_596414 ?auto_596415 ) ( ON ?auto_596413 ?auto_596414 ) ( ON ?auto_596412 ?auto_596413 ) ( CLEAR ?auto_596410 ) ( ON ?auto_596411 ?auto_596412 ) ( CLEAR ?auto_596411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_596408 ?auto_596409 ?auto_596410 ?auto_596411 )
      ( MAKE-16PILE ?auto_596408 ?auto_596409 ?auto_596410 ?auto_596411 ?auto_596412 ?auto_596413 ?auto_596414 ?auto_596415 ?auto_596416 ?auto_596417 ?auto_596418 ?auto_596419 ?auto_596420 ?auto_596421 ?auto_596422 ?auto_596423 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596474 - BLOCK
      ?auto_596475 - BLOCK
      ?auto_596476 - BLOCK
      ?auto_596477 - BLOCK
      ?auto_596478 - BLOCK
      ?auto_596479 - BLOCK
      ?auto_596480 - BLOCK
      ?auto_596481 - BLOCK
      ?auto_596482 - BLOCK
      ?auto_596483 - BLOCK
      ?auto_596484 - BLOCK
      ?auto_596485 - BLOCK
      ?auto_596486 - BLOCK
      ?auto_596487 - BLOCK
      ?auto_596488 - BLOCK
      ?auto_596489 - BLOCK
    )
    :vars
    (
      ?auto_596490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596489 ?auto_596490 ) ( ON-TABLE ?auto_596474 ) ( ON ?auto_596475 ?auto_596474 ) ( not ( = ?auto_596474 ?auto_596475 ) ) ( not ( = ?auto_596474 ?auto_596476 ) ) ( not ( = ?auto_596474 ?auto_596477 ) ) ( not ( = ?auto_596474 ?auto_596478 ) ) ( not ( = ?auto_596474 ?auto_596479 ) ) ( not ( = ?auto_596474 ?auto_596480 ) ) ( not ( = ?auto_596474 ?auto_596481 ) ) ( not ( = ?auto_596474 ?auto_596482 ) ) ( not ( = ?auto_596474 ?auto_596483 ) ) ( not ( = ?auto_596474 ?auto_596484 ) ) ( not ( = ?auto_596474 ?auto_596485 ) ) ( not ( = ?auto_596474 ?auto_596486 ) ) ( not ( = ?auto_596474 ?auto_596487 ) ) ( not ( = ?auto_596474 ?auto_596488 ) ) ( not ( = ?auto_596474 ?auto_596489 ) ) ( not ( = ?auto_596474 ?auto_596490 ) ) ( not ( = ?auto_596475 ?auto_596476 ) ) ( not ( = ?auto_596475 ?auto_596477 ) ) ( not ( = ?auto_596475 ?auto_596478 ) ) ( not ( = ?auto_596475 ?auto_596479 ) ) ( not ( = ?auto_596475 ?auto_596480 ) ) ( not ( = ?auto_596475 ?auto_596481 ) ) ( not ( = ?auto_596475 ?auto_596482 ) ) ( not ( = ?auto_596475 ?auto_596483 ) ) ( not ( = ?auto_596475 ?auto_596484 ) ) ( not ( = ?auto_596475 ?auto_596485 ) ) ( not ( = ?auto_596475 ?auto_596486 ) ) ( not ( = ?auto_596475 ?auto_596487 ) ) ( not ( = ?auto_596475 ?auto_596488 ) ) ( not ( = ?auto_596475 ?auto_596489 ) ) ( not ( = ?auto_596475 ?auto_596490 ) ) ( not ( = ?auto_596476 ?auto_596477 ) ) ( not ( = ?auto_596476 ?auto_596478 ) ) ( not ( = ?auto_596476 ?auto_596479 ) ) ( not ( = ?auto_596476 ?auto_596480 ) ) ( not ( = ?auto_596476 ?auto_596481 ) ) ( not ( = ?auto_596476 ?auto_596482 ) ) ( not ( = ?auto_596476 ?auto_596483 ) ) ( not ( = ?auto_596476 ?auto_596484 ) ) ( not ( = ?auto_596476 ?auto_596485 ) ) ( not ( = ?auto_596476 ?auto_596486 ) ) ( not ( = ?auto_596476 ?auto_596487 ) ) ( not ( = ?auto_596476 ?auto_596488 ) ) ( not ( = ?auto_596476 ?auto_596489 ) ) ( not ( = ?auto_596476 ?auto_596490 ) ) ( not ( = ?auto_596477 ?auto_596478 ) ) ( not ( = ?auto_596477 ?auto_596479 ) ) ( not ( = ?auto_596477 ?auto_596480 ) ) ( not ( = ?auto_596477 ?auto_596481 ) ) ( not ( = ?auto_596477 ?auto_596482 ) ) ( not ( = ?auto_596477 ?auto_596483 ) ) ( not ( = ?auto_596477 ?auto_596484 ) ) ( not ( = ?auto_596477 ?auto_596485 ) ) ( not ( = ?auto_596477 ?auto_596486 ) ) ( not ( = ?auto_596477 ?auto_596487 ) ) ( not ( = ?auto_596477 ?auto_596488 ) ) ( not ( = ?auto_596477 ?auto_596489 ) ) ( not ( = ?auto_596477 ?auto_596490 ) ) ( not ( = ?auto_596478 ?auto_596479 ) ) ( not ( = ?auto_596478 ?auto_596480 ) ) ( not ( = ?auto_596478 ?auto_596481 ) ) ( not ( = ?auto_596478 ?auto_596482 ) ) ( not ( = ?auto_596478 ?auto_596483 ) ) ( not ( = ?auto_596478 ?auto_596484 ) ) ( not ( = ?auto_596478 ?auto_596485 ) ) ( not ( = ?auto_596478 ?auto_596486 ) ) ( not ( = ?auto_596478 ?auto_596487 ) ) ( not ( = ?auto_596478 ?auto_596488 ) ) ( not ( = ?auto_596478 ?auto_596489 ) ) ( not ( = ?auto_596478 ?auto_596490 ) ) ( not ( = ?auto_596479 ?auto_596480 ) ) ( not ( = ?auto_596479 ?auto_596481 ) ) ( not ( = ?auto_596479 ?auto_596482 ) ) ( not ( = ?auto_596479 ?auto_596483 ) ) ( not ( = ?auto_596479 ?auto_596484 ) ) ( not ( = ?auto_596479 ?auto_596485 ) ) ( not ( = ?auto_596479 ?auto_596486 ) ) ( not ( = ?auto_596479 ?auto_596487 ) ) ( not ( = ?auto_596479 ?auto_596488 ) ) ( not ( = ?auto_596479 ?auto_596489 ) ) ( not ( = ?auto_596479 ?auto_596490 ) ) ( not ( = ?auto_596480 ?auto_596481 ) ) ( not ( = ?auto_596480 ?auto_596482 ) ) ( not ( = ?auto_596480 ?auto_596483 ) ) ( not ( = ?auto_596480 ?auto_596484 ) ) ( not ( = ?auto_596480 ?auto_596485 ) ) ( not ( = ?auto_596480 ?auto_596486 ) ) ( not ( = ?auto_596480 ?auto_596487 ) ) ( not ( = ?auto_596480 ?auto_596488 ) ) ( not ( = ?auto_596480 ?auto_596489 ) ) ( not ( = ?auto_596480 ?auto_596490 ) ) ( not ( = ?auto_596481 ?auto_596482 ) ) ( not ( = ?auto_596481 ?auto_596483 ) ) ( not ( = ?auto_596481 ?auto_596484 ) ) ( not ( = ?auto_596481 ?auto_596485 ) ) ( not ( = ?auto_596481 ?auto_596486 ) ) ( not ( = ?auto_596481 ?auto_596487 ) ) ( not ( = ?auto_596481 ?auto_596488 ) ) ( not ( = ?auto_596481 ?auto_596489 ) ) ( not ( = ?auto_596481 ?auto_596490 ) ) ( not ( = ?auto_596482 ?auto_596483 ) ) ( not ( = ?auto_596482 ?auto_596484 ) ) ( not ( = ?auto_596482 ?auto_596485 ) ) ( not ( = ?auto_596482 ?auto_596486 ) ) ( not ( = ?auto_596482 ?auto_596487 ) ) ( not ( = ?auto_596482 ?auto_596488 ) ) ( not ( = ?auto_596482 ?auto_596489 ) ) ( not ( = ?auto_596482 ?auto_596490 ) ) ( not ( = ?auto_596483 ?auto_596484 ) ) ( not ( = ?auto_596483 ?auto_596485 ) ) ( not ( = ?auto_596483 ?auto_596486 ) ) ( not ( = ?auto_596483 ?auto_596487 ) ) ( not ( = ?auto_596483 ?auto_596488 ) ) ( not ( = ?auto_596483 ?auto_596489 ) ) ( not ( = ?auto_596483 ?auto_596490 ) ) ( not ( = ?auto_596484 ?auto_596485 ) ) ( not ( = ?auto_596484 ?auto_596486 ) ) ( not ( = ?auto_596484 ?auto_596487 ) ) ( not ( = ?auto_596484 ?auto_596488 ) ) ( not ( = ?auto_596484 ?auto_596489 ) ) ( not ( = ?auto_596484 ?auto_596490 ) ) ( not ( = ?auto_596485 ?auto_596486 ) ) ( not ( = ?auto_596485 ?auto_596487 ) ) ( not ( = ?auto_596485 ?auto_596488 ) ) ( not ( = ?auto_596485 ?auto_596489 ) ) ( not ( = ?auto_596485 ?auto_596490 ) ) ( not ( = ?auto_596486 ?auto_596487 ) ) ( not ( = ?auto_596486 ?auto_596488 ) ) ( not ( = ?auto_596486 ?auto_596489 ) ) ( not ( = ?auto_596486 ?auto_596490 ) ) ( not ( = ?auto_596487 ?auto_596488 ) ) ( not ( = ?auto_596487 ?auto_596489 ) ) ( not ( = ?auto_596487 ?auto_596490 ) ) ( not ( = ?auto_596488 ?auto_596489 ) ) ( not ( = ?auto_596488 ?auto_596490 ) ) ( not ( = ?auto_596489 ?auto_596490 ) ) ( ON ?auto_596488 ?auto_596489 ) ( ON ?auto_596487 ?auto_596488 ) ( ON ?auto_596486 ?auto_596487 ) ( ON ?auto_596485 ?auto_596486 ) ( ON ?auto_596484 ?auto_596485 ) ( ON ?auto_596483 ?auto_596484 ) ( ON ?auto_596482 ?auto_596483 ) ( ON ?auto_596481 ?auto_596482 ) ( ON ?auto_596480 ?auto_596481 ) ( ON ?auto_596479 ?auto_596480 ) ( ON ?auto_596478 ?auto_596479 ) ( ON ?auto_596477 ?auto_596478 ) ( CLEAR ?auto_596475 ) ( ON ?auto_596476 ?auto_596477 ) ( CLEAR ?auto_596476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_596474 ?auto_596475 ?auto_596476 )
      ( MAKE-16PILE ?auto_596474 ?auto_596475 ?auto_596476 ?auto_596477 ?auto_596478 ?auto_596479 ?auto_596480 ?auto_596481 ?auto_596482 ?auto_596483 ?auto_596484 ?auto_596485 ?auto_596486 ?auto_596487 ?auto_596488 ?auto_596489 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596540 - BLOCK
      ?auto_596541 - BLOCK
      ?auto_596542 - BLOCK
      ?auto_596543 - BLOCK
      ?auto_596544 - BLOCK
      ?auto_596545 - BLOCK
      ?auto_596546 - BLOCK
      ?auto_596547 - BLOCK
      ?auto_596548 - BLOCK
      ?auto_596549 - BLOCK
      ?auto_596550 - BLOCK
      ?auto_596551 - BLOCK
      ?auto_596552 - BLOCK
      ?auto_596553 - BLOCK
      ?auto_596554 - BLOCK
      ?auto_596555 - BLOCK
    )
    :vars
    (
      ?auto_596556 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596555 ?auto_596556 ) ( ON-TABLE ?auto_596540 ) ( not ( = ?auto_596540 ?auto_596541 ) ) ( not ( = ?auto_596540 ?auto_596542 ) ) ( not ( = ?auto_596540 ?auto_596543 ) ) ( not ( = ?auto_596540 ?auto_596544 ) ) ( not ( = ?auto_596540 ?auto_596545 ) ) ( not ( = ?auto_596540 ?auto_596546 ) ) ( not ( = ?auto_596540 ?auto_596547 ) ) ( not ( = ?auto_596540 ?auto_596548 ) ) ( not ( = ?auto_596540 ?auto_596549 ) ) ( not ( = ?auto_596540 ?auto_596550 ) ) ( not ( = ?auto_596540 ?auto_596551 ) ) ( not ( = ?auto_596540 ?auto_596552 ) ) ( not ( = ?auto_596540 ?auto_596553 ) ) ( not ( = ?auto_596540 ?auto_596554 ) ) ( not ( = ?auto_596540 ?auto_596555 ) ) ( not ( = ?auto_596540 ?auto_596556 ) ) ( not ( = ?auto_596541 ?auto_596542 ) ) ( not ( = ?auto_596541 ?auto_596543 ) ) ( not ( = ?auto_596541 ?auto_596544 ) ) ( not ( = ?auto_596541 ?auto_596545 ) ) ( not ( = ?auto_596541 ?auto_596546 ) ) ( not ( = ?auto_596541 ?auto_596547 ) ) ( not ( = ?auto_596541 ?auto_596548 ) ) ( not ( = ?auto_596541 ?auto_596549 ) ) ( not ( = ?auto_596541 ?auto_596550 ) ) ( not ( = ?auto_596541 ?auto_596551 ) ) ( not ( = ?auto_596541 ?auto_596552 ) ) ( not ( = ?auto_596541 ?auto_596553 ) ) ( not ( = ?auto_596541 ?auto_596554 ) ) ( not ( = ?auto_596541 ?auto_596555 ) ) ( not ( = ?auto_596541 ?auto_596556 ) ) ( not ( = ?auto_596542 ?auto_596543 ) ) ( not ( = ?auto_596542 ?auto_596544 ) ) ( not ( = ?auto_596542 ?auto_596545 ) ) ( not ( = ?auto_596542 ?auto_596546 ) ) ( not ( = ?auto_596542 ?auto_596547 ) ) ( not ( = ?auto_596542 ?auto_596548 ) ) ( not ( = ?auto_596542 ?auto_596549 ) ) ( not ( = ?auto_596542 ?auto_596550 ) ) ( not ( = ?auto_596542 ?auto_596551 ) ) ( not ( = ?auto_596542 ?auto_596552 ) ) ( not ( = ?auto_596542 ?auto_596553 ) ) ( not ( = ?auto_596542 ?auto_596554 ) ) ( not ( = ?auto_596542 ?auto_596555 ) ) ( not ( = ?auto_596542 ?auto_596556 ) ) ( not ( = ?auto_596543 ?auto_596544 ) ) ( not ( = ?auto_596543 ?auto_596545 ) ) ( not ( = ?auto_596543 ?auto_596546 ) ) ( not ( = ?auto_596543 ?auto_596547 ) ) ( not ( = ?auto_596543 ?auto_596548 ) ) ( not ( = ?auto_596543 ?auto_596549 ) ) ( not ( = ?auto_596543 ?auto_596550 ) ) ( not ( = ?auto_596543 ?auto_596551 ) ) ( not ( = ?auto_596543 ?auto_596552 ) ) ( not ( = ?auto_596543 ?auto_596553 ) ) ( not ( = ?auto_596543 ?auto_596554 ) ) ( not ( = ?auto_596543 ?auto_596555 ) ) ( not ( = ?auto_596543 ?auto_596556 ) ) ( not ( = ?auto_596544 ?auto_596545 ) ) ( not ( = ?auto_596544 ?auto_596546 ) ) ( not ( = ?auto_596544 ?auto_596547 ) ) ( not ( = ?auto_596544 ?auto_596548 ) ) ( not ( = ?auto_596544 ?auto_596549 ) ) ( not ( = ?auto_596544 ?auto_596550 ) ) ( not ( = ?auto_596544 ?auto_596551 ) ) ( not ( = ?auto_596544 ?auto_596552 ) ) ( not ( = ?auto_596544 ?auto_596553 ) ) ( not ( = ?auto_596544 ?auto_596554 ) ) ( not ( = ?auto_596544 ?auto_596555 ) ) ( not ( = ?auto_596544 ?auto_596556 ) ) ( not ( = ?auto_596545 ?auto_596546 ) ) ( not ( = ?auto_596545 ?auto_596547 ) ) ( not ( = ?auto_596545 ?auto_596548 ) ) ( not ( = ?auto_596545 ?auto_596549 ) ) ( not ( = ?auto_596545 ?auto_596550 ) ) ( not ( = ?auto_596545 ?auto_596551 ) ) ( not ( = ?auto_596545 ?auto_596552 ) ) ( not ( = ?auto_596545 ?auto_596553 ) ) ( not ( = ?auto_596545 ?auto_596554 ) ) ( not ( = ?auto_596545 ?auto_596555 ) ) ( not ( = ?auto_596545 ?auto_596556 ) ) ( not ( = ?auto_596546 ?auto_596547 ) ) ( not ( = ?auto_596546 ?auto_596548 ) ) ( not ( = ?auto_596546 ?auto_596549 ) ) ( not ( = ?auto_596546 ?auto_596550 ) ) ( not ( = ?auto_596546 ?auto_596551 ) ) ( not ( = ?auto_596546 ?auto_596552 ) ) ( not ( = ?auto_596546 ?auto_596553 ) ) ( not ( = ?auto_596546 ?auto_596554 ) ) ( not ( = ?auto_596546 ?auto_596555 ) ) ( not ( = ?auto_596546 ?auto_596556 ) ) ( not ( = ?auto_596547 ?auto_596548 ) ) ( not ( = ?auto_596547 ?auto_596549 ) ) ( not ( = ?auto_596547 ?auto_596550 ) ) ( not ( = ?auto_596547 ?auto_596551 ) ) ( not ( = ?auto_596547 ?auto_596552 ) ) ( not ( = ?auto_596547 ?auto_596553 ) ) ( not ( = ?auto_596547 ?auto_596554 ) ) ( not ( = ?auto_596547 ?auto_596555 ) ) ( not ( = ?auto_596547 ?auto_596556 ) ) ( not ( = ?auto_596548 ?auto_596549 ) ) ( not ( = ?auto_596548 ?auto_596550 ) ) ( not ( = ?auto_596548 ?auto_596551 ) ) ( not ( = ?auto_596548 ?auto_596552 ) ) ( not ( = ?auto_596548 ?auto_596553 ) ) ( not ( = ?auto_596548 ?auto_596554 ) ) ( not ( = ?auto_596548 ?auto_596555 ) ) ( not ( = ?auto_596548 ?auto_596556 ) ) ( not ( = ?auto_596549 ?auto_596550 ) ) ( not ( = ?auto_596549 ?auto_596551 ) ) ( not ( = ?auto_596549 ?auto_596552 ) ) ( not ( = ?auto_596549 ?auto_596553 ) ) ( not ( = ?auto_596549 ?auto_596554 ) ) ( not ( = ?auto_596549 ?auto_596555 ) ) ( not ( = ?auto_596549 ?auto_596556 ) ) ( not ( = ?auto_596550 ?auto_596551 ) ) ( not ( = ?auto_596550 ?auto_596552 ) ) ( not ( = ?auto_596550 ?auto_596553 ) ) ( not ( = ?auto_596550 ?auto_596554 ) ) ( not ( = ?auto_596550 ?auto_596555 ) ) ( not ( = ?auto_596550 ?auto_596556 ) ) ( not ( = ?auto_596551 ?auto_596552 ) ) ( not ( = ?auto_596551 ?auto_596553 ) ) ( not ( = ?auto_596551 ?auto_596554 ) ) ( not ( = ?auto_596551 ?auto_596555 ) ) ( not ( = ?auto_596551 ?auto_596556 ) ) ( not ( = ?auto_596552 ?auto_596553 ) ) ( not ( = ?auto_596552 ?auto_596554 ) ) ( not ( = ?auto_596552 ?auto_596555 ) ) ( not ( = ?auto_596552 ?auto_596556 ) ) ( not ( = ?auto_596553 ?auto_596554 ) ) ( not ( = ?auto_596553 ?auto_596555 ) ) ( not ( = ?auto_596553 ?auto_596556 ) ) ( not ( = ?auto_596554 ?auto_596555 ) ) ( not ( = ?auto_596554 ?auto_596556 ) ) ( not ( = ?auto_596555 ?auto_596556 ) ) ( ON ?auto_596554 ?auto_596555 ) ( ON ?auto_596553 ?auto_596554 ) ( ON ?auto_596552 ?auto_596553 ) ( ON ?auto_596551 ?auto_596552 ) ( ON ?auto_596550 ?auto_596551 ) ( ON ?auto_596549 ?auto_596550 ) ( ON ?auto_596548 ?auto_596549 ) ( ON ?auto_596547 ?auto_596548 ) ( ON ?auto_596546 ?auto_596547 ) ( ON ?auto_596545 ?auto_596546 ) ( ON ?auto_596544 ?auto_596545 ) ( ON ?auto_596543 ?auto_596544 ) ( ON ?auto_596542 ?auto_596543 ) ( CLEAR ?auto_596540 ) ( ON ?auto_596541 ?auto_596542 ) ( CLEAR ?auto_596541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_596540 ?auto_596541 )
      ( MAKE-16PILE ?auto_596540 ?auto_596541 ?auto_596542 ?auto_596543 ?auto_596544 ?auto_596545 ?auto_596546 ?auto_596547 ?auto_596548 ?auto_596549 ?auto_596550 ?auto_596551 ?auto_596552 ?auto_596553 ?auto_596554 ?auto_596555 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_596606 - BLOCK
      ?auto_596607 - BLOCK
      ?auto_596608 - BLOCK
      ?auto_596609 - BLOCK
      ?auto_596610 - BLOCK
      ?auto_596611 - BLOCK
      ?auto_596612 - BLOCK
      ?auto_596613 - BLOCK
      ?auto_596614 - BLOCK
      ?auto_596615 - BLOCK
      ?auto_596616 - BLOCK
      ?auto_596617 - BLOCK
      ?auto_596618 - BLOCK
      ?auto_596619 - BLOCK
      ?auto_596620 - BLOCK
      ?auto_596621 - BLOCK
    )
    :vars
    (
      ?auto_596622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596621 ?auto_596622 ) ( not ( = ?auto_596606 ?auto_596607 ) ) ( not ( = ?auto_596606 ?auto_596608 ) ) ( not ( = ?auto_596606 ?auto_596609 ) ) ( not ( = ?auto_596606 ?auto_596610 ) ) ( not ( = ?auto_596606 ?auto_596611 ) ) ( not ( = ?auto_596606 ?auto_596612 ) ) ( not ( = ?auto_596606 ?auto_596613 ) ) ( not ( = ?auto_596606 ?auto_596614 ) ) ( not ( = ?auto_596606 ?auto_596615 ) ) ( not ( = ?auto_596606 ?auto_596616 ) ) ( not ( = ?auto_596606 ?auto_596617 ) ) ( not ( = ?auto_596606 ?auto_596618 ) ) ( not ( = ?auto_596606 ?auto_596619 ) ) ( not ( = ?auto_596606 ?auto_596620 ) ) ( not ( = ?auto_596606 ?auto_596621 ) ) ( not ( = ?auto_596606 ?auto_596622 ) ) ( not ( = ?auto_596607 ?auto_596608 ) ) ( not ( = ?auto_596607 ?auto_596609 ) ) ( not ( = ?auto_596607 ?auto_596610 ) ) ( not ( = ?auto_596607 ?auto_596611 ) ) ( not ( = ?auto_596607 ?auto_596612 ) ) ( not ( = ?auto_596607 ?auto_596613 ) ) ( not ( = ?auto_596607 ?auto_596614 ) ) ( not ( = ?auto_596607 ?auto_596615 ) ) ( not ( = ?auto_596607 ?auto_596616 ) ) ( not ( = ?auto_596607 ?auto_596617 ) ) ( not ( = ?auto_596607 ?auto_596618 ) ) ( not ( = ?auto_596607 ?auto_596619 ) ) ( not ( = ?auto_596607 ?auto_596620 ) ) ( not ( = ?auto_596607 ?auto_596621 ) ) ( not ( = ?auto_596607 ?auto_596622 ) ) ( not ( = ?auto_596608 ?auto_596609 ) ) ( not ( = ?auto_596608 ?auto_596610 ) ) ( not ( = ?auto_596608 ?auto_596611 ) ) ( not ( = ?auto_596608 ?auto_596612 ) ) ( not ( = ?auto_596608 ?auto_596613 ) ) ( not ( = ?auto_596608 ?auto_596614 ) ) ( not ( = ?auto_596608 ?auto_596615 ) ) ( not ( = ?auto_596608 ?auto_596616 ) ) ( not ( = ?auto_596608 ?auto_596617 ) ) ( not ( = ?auto_596608 ?auto_596618 ) ) ( not ( = ?auto_596608 ?auto_596619 ) ) ( not ( = ?auto_596608 ?auto_596620 ) ) ( not ( = ?auto_596608 ?auto_596621 ) ) ( not ( = ?auto_596608 ?auto_596622 ) ) ( not ( = ?auto_596609 ?auto_596610 ) ) ( not ( = ?auto_596609 ?auto_596611 ) ) ( not ( = ?auto_596609 ?auto_596612 ) ) ( not ( = ?auto_596609 ?auto_596613 ) ) ( not ( = ?auto_596609 ?auto_596614 ) ) ( not ( = ?auto_596609 ?auto_596615 ) ) ( not ( = ?auto_596609 ?auto_596616 ) ) ( not ( = ?auto_596609 ?auto_596617 ) ) ( not ( = ?auto_596609 ?auto_596618 ) ) ( not ( = ?auto_596609 ?auto_596619 ) ) ( not ( = ?auto_596609 ?auto_596620 ) ) ( not ( = ?auto_596609 ?auto_596621 ) ) ( not ( = ?auto_596609 ?auto_596622 ) ) ( not ( = ?auto_596610 ?auto_596611 ) ) ( not ( = ?auto_596610 ?auto_596612 ) ) ( not ( = ?auto_596610 ?auto_596613 ) ) ( not ( = ?auto_596610 ?auto_596614 ) ) ( not ( = ?auto_596610 ?auto_596615 ) ) ( not ( = ?auto_596610 ?auto_596616 ) ) ( not ( = ?auto_596610 ?auto_596617 ) ) ( not ( = ?auto_596610 ?auto_596618 ) ) ( not ( = ?auto_596610 ?auto_596619 ) ) ( not ( = ?auto_596610 ?auto_596620 ) ) ( not ( = ?auto_596610 ?auto_596621 ) ) ( not ( = ?auto_596610 ?auto_596622 ) ) ( not ( = ?auto_596611 ?auto_596612 ) ) ( not ( = ?auto_596611 ?auto_596613 ) ) ( not ( = ?auto_596611 ?auto_596614 ) ) ( not ( = ?auto_596611 ?auto_596615 ) ) ( not ( = ?auto_596611 ?auto_596616 ) ) ( not ( = ?auto_596611 ?auto_596617 ) ) ( not ( = ?auto_596611 ?auto_596618 ) ) ( not ( = ?auto_596611 ?auto_596619 ) ) ( not ( = ?auto_596611 ?auto_596620 ) ) ( not ( = ?auto_596611 ?auto_596621 ) ) ( not ( = ?auto_596611 ?auto_596622 ) ) ( not ( = ?auto_596612 ?auto_596613 ) ) ( not ( = ?auto_596612 ?auto_596614 ) ) ( not ( = ?auto_596612 ?auto_596615 ) ) ( not ( = ?auto_596612 ?auto_596616 ) ) ( not ( = ?auto_596612 ?auto_596617 ) ) ( not ( = ?auto_596612 ?auto_596618 ) ) ( not ( = ?auto_596612 ?auto_596619 ) ) ( not ( = ?auto_596612 ?auto_596620 ) ) ( not ( = ?auto_596612 ?auto_596621 ) ) ( not ( = ?auto_596612 ?auto_596622 ) ) ( not ( = ?auto_596613 ?auto_596614 ) ) ( not ( = ?auto_596613 ?auto_596615 ) ) ( not ( = ?auto_596613 ?auto_596616 ) ) ( not ( = ?auto_596613 ?auto_596617 ) ) ( not ( = ?auto_596613 ?auto_596618 ) ) ( not ( = ?auto_596613 ?auto_596619 ) ) ( not ( = ?auto_596613 ?auto_596620 ) ) ( not ( = ?auto_596613 ?auto_596621 ) ) ( not ( = ?auto_596613 ?auto_596622 ) ) ( not ( = ?auto_596614 ?auto_596615 ) ) ( not ( = ?auto_596614 ?auto_596616 ) ) ( not ( = ?auto_596614 ?auto_596617 ) ) ( not ( = ?auto_596614 ?auto_596618 ) ) ( not ( = ?auto_596614 ?auto_596619 ) ) ( not ( = ?auto_596614 ?auto_596620 ) ) ( not ( = ?auto_596614 ?auto_596621 ) ) ( not ( = ?auto_596614 ?auto_596622 ) ) ( not ( = ?auto_596615 ?auto_596616 ) ) ( not ( = ?auto_596615 ?auto_596617 ) ) ( not ( = ?auto_596615 ?auto_596618 ) ) ( not ( = ?auto_596615 ?auto_596619 ) ) ( not ( = ?auto_596615 ?auto_596620 ) ) ( not ( = ?auto_596615 ?auto_596621 ) ) ( not ( = ?auto_596615 ?auto_596622 ) ) ( not ( = ?auto_596616 ?auto_596617 ) ) ( not ( = ?auto_596616 ?auto_596618 ) ) ( not ( = ?auto_596616 ?auto_596619 ) ) ( not ( = ?auto_596616 ?auto_596620 ) ) ( not ( = ?auto_596616 ?auto_596621 ) ) ( not ( = ?auto_596616 ?auto_596622 ) ) ( not ( = ?auto_596617 ?auto_596618 ) ) ( not ( = ?auto_596617 ?auto_596619 ) ) ( not ( = ?auto_596617 ?auto_596620 ) ) ( not ( = ?auto_596617 ?auto_596621 ) ) ( not ( = ?auto_596617 ?auto_596622 ) ) ( not ( = ?auto_596618 ?auto_596619 ) ) ( not ( = ?auto_596618 ?auto_596620 ) ) ( not ( = ?auto_596618 ?auto_596621 ) ) ( not ( = ?auto_596618 ?auto_596622 ) ) ( not ( = ?auto_596619 ?auto_596620 ) ) ( not ( = ?auto_596619 ?auto_596621 ) ) ( not ( = ?auto_596619 ?auto_596622 ) ) ( not ( = ?auto_596620 ?auto_596621 ) ) ( not ( = ?auto_596620 ?auto_596622 ) ) ( not ( = ?auto_596621 ?auto_596622 ) ) ( ON ?auto_596620 ?auto_596621 ) ( ON ?auto_596619 ?auto_596620 ) ( ON ?auto_596618 ?auto_596619 ) ( ON ?auto_596617 ?auto_596618 ) ( ON ?auto_596616 ?auto_596617 ) ( ON ?auto_596615 ?auto_596616 ) ( ON ?auto_596614 ?auto_596615 ) ( ON ?auto_596613 ?auto_596614 ) ( ON ?auto_596612 ?auto_596613 ) ( ON ?auto_596611 ?auto_596612 ) ( ON ?auto_596610 ?auto_596611 ) ( ON ?auto_596609 ?auto_596610 ) ( ON ?auto_596608 ?auto_596609 ) ( ON ?auto_596607 ?auto_596608 ) ( ON ?auto_596606 ?auto_596607 ) ( CLEAR ?auto_596606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_596606 )
      ( MAKE-16PILE ?auto_596606 ?auto_596607 ?auto_596608 ?auto_596609 ?auto_596610 ?auto_596611 ?auto_596612 ?auto_596613 ?auto_596614 ?auto_596615 ?auto_596616 ?auto_596617 ?auto_596618 ?auto_596619 ?auto_596620 ?auto_596621 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596673 - BLOCK
      ?auto_596674 - BLOCK
      ?auto_596675 - BLOCK
      ?auto_596676 - BLOCK
      ?auto_596677 - BLOCK
      ?auto_596678 - BLOCK
      ?auto_596679 - BLOCK
      ?auto_596680 - BLOCK
      ?auto_596681 - BLOCK
      ?auto_596682 - BLOCK
      ?auto_596683 - BLOCK
      ?auto_596684 - BLOCK
      ?auto_596685 - BLOCK
      ?auto_596686 - BLOCK
      ?auto_596687 - BLOCK
      ?auto_596688 - BLOCK
      ?auto_596689 - BLOCK
    )
    :vars
    (
      ?auto_596690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_596688 ) ( ON ?auto_596689 ?auto_596690 ) ( CLEAR ?auto_596689 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_596673 ) ( ON ?auto_596674 ?auto_596673 ) ( ON ?auto_596675 ?auto_596674 ) ( ON ?auto_596676 ?auto_596675 ) ( ON ?auto_596677 ?auto_596676 ) ( ON ?auto_596678 ?auto_596677 ) ( ON ?auto_596679 ?auto_596678 ) ( ON ?auto_596680 ?auto_596679 ) ( ON ?auto_596681 ?auto_596680 ) ( ON ?auto_596682 ?auto_596681 ) ( ON ?auto_596683 ?auto_596682 ) ( ON ?auto_596684 ?auto_596683 ) ( ON ?auto_596685 ?auto_596684 ) ( ON ?auto_596686 ?auto_596685 ) ( ON ?auto_596687 ?auto_596686 ) ( ON ?auto_596688 ?auto_596687 ) ( not ( = ?auto_596673 ?auto_596674 ) ) ( not ( = ?auto_596673 ?auto_596675 ) ) ( not ( = ?auto_596673 ?auto_596676 ) ) ( not ( = ?auto_596673 ?auto_596677 ) ) ( not ( = ?auto_596673 ?auto_596678 ) ) ( not ( = ?auto_596673 ?auto_596679 ) ) ( not ( = ?auto_596673 ?auto_596680 ) ) ( not ( = ?auto_596673 ?auto_596681 ) ) ( not ( = ?auto_596673 ?auto_596682 ) ) ( not ( = ?auto_596673 ?auto_596683 ) ) ( not ( = ?auto_596673 ?auto_596684 ) ) ( not ( = ?auto_596673 ?auto_596685 ) ) ( not ( = ?auto_596673 ?auto_596686 ) ) ( not ( = ?auto_596673 ?auto_596687 ) ) ( not ( = ?auto_596673 ?auto_596688 ) ) ( not ( = ?auto_596673 ?auto_596689 ) ) ( not ( = ?auto_596673 ?auto_596690 ) ) ( not ( = ?auto_596674 ?auto_596675 ) ) ( not ( = ?auto_596674 ?auto_596676 ) ) ( not ( = ?auto_596674 ?auto_596677 ) ) ( not ( = ?auto_596674 ?auto_596678 ) ) ( not ( = ?auto_596674 ?auto_596679 ) ) ( not ( = ?auto_596674 ?auto_596680 ) ) ( not ( = ?auto_596674 ?auto_596681 ) ) ( not ( = ?auto_596674 ?auto_596682 ) ) ( not ( = ?auto_596674 ?auto_596683 ) ) ( not ( = ?auto_596674 ?auto_596684 ) ) ( not ( = ?auto_596674 ?auto_596685 ) ) ( not ( = ?auto_596674 ?auto_596686 ) ) ( not ( = ?auto_596674 ?auto_596687 ) ) ( not ( = ?auto_596674 ?auto_596688 ) ) ( not ( = ?auto_596674 ?auto_596689 ) ) ( not ( = ?auto_596674 ?auto_596690 ) ) ( not ( = ?auto_596675 ?auto_596676 ) ) ( not ( = ?auto_596675 ?auto_596677 ) ) ( not ( = ?auto_596675 ?auto_596678 ) ) ( not ( = ?auto_596675 ?auto_596679 ) ) ( not ( = ?auto_596675 ?auto_596680 ) ) ( not ( = ?auto_596675 ?auto_596681 ) ) ( not ( = ?auto_596675 ?auto_596682 ) ) ( not ( = ?auto_596675 ?auto_596683 ) ) ( not ( = ?auto_596675 ?auto_596684 ) ) ( not ( = ?auto_596675 ?auto_596685 ) ) ( not ( = ?auto_596675 ?auto_596686 ) ) ( not ( = ?auto_596675 ?auto_596687 ) ) ( not ( = ?auto_596675 ?auto_596688 ) ) ( not ( = ?auto_596675 ?auto_596689 ) ) ( not ( = ?auto_596675 ?auto_596690 ) ) ( not ( = ?auto_596676 ?auto_596677 ) ) ( not ( = ?auto_596676 ?auto_596678 ) ) ( not ( = ?auto_596676 ?auto_596679 ) ) ( not ( = ?auto_596676 ?auto_596680 ) ) ( not ( = ?auto_596676 ?auto_596681 ) ) ( not ( = ?auto_596676 ?auto_596682 ) ) ( not ( = ?auto_596676 ?auto_596683 ) ) ( not ( = ?auto_596676 ?auto_596684 ) ) ( not ( = ?auto_596676 ?auto_596685 ) ) ( not ( = ?auto_596676 ?auto_596686 ) ) ( not ( = ?auto_596676 ?auto_596687 ) ) ( not ( = ?auto_596676 ?auto_596688 ) ) ( not ( = ?auto_596676 ?auto_596689 ) ) ( not ( = ?auto_596676 ?auto_596690 ) ) ( not ( = ?auto_596677 ?auto_596678 ) ) ( not ( = ?auto_596677 ?auto_596679 ) ) ( not ( = ?auto_596677 ?auto_596680 ) ) ( not ( = ?auto_596677 ?auto_596681 ) ) ( not ( = ?auto_596677 ?auto_596682 ) ) ( not ( = ?auto_596677 ?auto_596683 ) ) ( not ( = ?auto_596677 ?auto_596684 ) ) ( not ( = ?auto_596677 ?auto_596685 ) ) ( not ( = ?auto_596677 ?auto_596686 ) ) ( not ( = ?auto_596677 ?auto_596687 ) ) ( not ( = ?auto_596677 ?auto_596688 ) ) ( not ( = ?auto_596677 ?auto_596689 ) ) ( not ( = ?auto_596677 ?auto_596690 ) ) ( not ( = ?auto_596678 ?auto_596679 ) ) ( not ( = ?auto_596678 ?auto_596680 ) ) ( not ( = ?auto_596678 ?auto_596681 ) ) ( not ( = ?auto_596678 ?auto_596682 ) ) ( not ( = ?auto_596678 ?auto_596683 ) ) ( not ( = ?auto_596678 ?auto_596684 ) ) ( not ( = ?auto_596678 ?auto_596685 ) ) ( not ( = ?auto_596678 ?auto_596686 ) ) ( not ( = ?auto_596678 ?auto_596687 ) ) ( not ( = ?auto_596678 ?auto_596688 ) ) ( not ( = ?auto_596678 ?auto_596689 ) ) ( not ( = ?auto_596678 ?auto_596690 ) ) ( not ( = ?auto_596679 ?auto_596680 ) ) ( not ( = ?auto_596679 ?auto_596681 ) ) ( not ( = ?auto_596679 ?auto_596682 ) ) ( not ( = ?auto_596679 ?auto_596683 ) ) ( not ( = ?auto_596679 ?auto_596684 ) ) ( not ( = ?auto_596679 ?auto_596685 ) ) ( not ( = ?auto_596679 ?auto_596686 ) ) ( not ( = ?auto_596679 ?auto_596687 ) ) ( not ( = ?auto_596679 ?auto_596688 ) ) ( not ( = ?auto_596679 ?auto_596689 ) ) ( not ( = ?auto_596679 ?auto_596690 ) ) ( not ( = ?auto_596680 ?auto_596681 ) ) ( not ( = ?auto_596680 ?auto_596682 ) ) ( not ( = ?auto_596680 ?auto_596683 ) ) ( not ( = ?auto_596680 ?auto_596684 ) ) ( not ( = ?auto_596680 ?auto_596685 ) ) ( not ( = ?auto_596680 ?auto_596686 ) ) ( not ( = ?auto_596680 ?auto_596687 ) ) ( not ( = ?auto_596680 ?auto_596688 ) ) ( not ( = ?auto_596680 ?auto_596689 ) ) ( not ( = ?auto_596680 ?auto_596690 ) ) ( not ( = ?auto_596681 ?auto_596682 ) ) ( not ( = ?auto_596681 ?auto_596683 ) ) ( not ( = ?auto_596681 ?auto_596684 ) ) ( not ( = ?auto_596681 ?auto_596685 ) ) ( not ( = ?auto_596681 ?auto_596686 ) ) ( not ( = ?auto_596681 ?auto_596687 ) ) ( not ( = ?auto_596681 ?auto_596688 ) ) ( not ( = ?auto_596681 ?auto_596689 ) ) ( not ( = ?auto_596681 ?auto_596690 ) ) ( not ( = ?auto_596682 ?auto_596683 ) ) ( not ( = ?auto_596682 ?auto_596684 ) ) ( not ( = ?auto_596682 ?auto_596685 ) ) ( not ( = ?auto_596682 ?auto_596686 ) ) ( not ( = ?auto_596682 ?auto_596687 ) ) ( not ( = ?auto_596682 ?auto_596688 ) ) ( not ( = ?auto_596682 ?auto_596689 ) ) ( not ( = ?auto_596682 ?auto_596690 ) ) ( not ( = ?auto_596683 ?auto_596684 ) ) ( not ( = ?auto_596683 ?auto_596685 ) ) ( not ( = ?auto_596683 ?auto_596686 ) ) ( not ( = ?auto_596683 ?auto_596687 ) ) ( not ( = ?auto_596683 ?auto_596688 ) ) ( not ( = ?auto_596683 ?auto_596689 ) ) ( not ( = ?auto_596683 ?auto_596690 ) ) ( not ( = ?auto_596684 ?auto_596685 ) ) ( not ( = ?auto_596684 ?auto_596686 ) ) ( not ( = ?auto_596684 ?auto_596687 ) ) ( not ( = ?auto_596684 ?auto_596688 ) ) ( not ( = ?auto_596684 ?auto_596689 ) ) ( not ( = ?auto_596684 ?auto_596690 ) ) ( not ( = ?auto_596685 ?auto_596686 ) ) ( not ( = ?auto_596685 ?auto_596687 ) ) ( not ( = ?auto_596685 ?auto_596688 ) ) ( not ( = ?auto_596685 ?auto_596689 ) ) ( not ( = ?auto_596685 ?auto_596690 ) ) ( not ( = ?auto_596686 ?auto_596687 ) ) ( not ( = ?auto_596686 ?auto_596688 ) ) ( not ( = ?auto_596686 ?auto_596689 ) ) ( not ( = ?auto_596686 ?auto_596690 ) ) ( not ( = ?auto_596687 ?auto_596688 ) ) ( not ( = ?auto_596687 ?auto_596689 ) ) ( not ( = ?auto_596687 ?auto_596690 ) ) ( not ( = ?auto_596688 ?auto_596689 ) ) ( not ( = ?auto_596688 ?auto_596690 ) ) ( not ( = ?auto_596689 ?auto_596690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_596689 ?auto_596690 )
      ( !STACK ?auto_596689 ?auto_596688 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596708 - BLOCK
      ?auto_596709 - BLOCK
      ?auto_596710 - BLOCK
      ?auto_596711 - BLOCK
      ?auto_596712 - BLOCK
      ?auto_596713 - BLOCK
      ?auto_596714 - BLOCK
      ?auto_596715 - BLOCK
      ?auto_596716 - BLOCK
      ?auto_596717 - BLOCK
      ?auto_596718 - BLOCK
      ?auto_596719 - BLOCK
      ?auto_596720 - BLOCK
      ?auto_596721 - BLOCK
      ?auto_596722 - BLOCK
      ?auto_596723 - BLOCK
      ?auto_596724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_596723 ) ( ON-TABLE ?auto_596724 ) ( CLEAR ?auto_596724 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_596708 ) ( ON ?auto_596709 ?auto_596708 ) ( ON ?auto_596710 ?auto_596709 ) ( ON ?auto_596711 ?auto_596710 ) ( ON ?auto_596712 ?auto_596711 ) ( ON ?auto_596713 ?auto_596712 ) ( ON ?auto_596714 ?auto_596713 ) ( ON ?auto_596715 ?auto_596714 ) ( ON ?auto_596716 ?auto_596715 ) ( ON ?auto_596717 ?auto_596716 ) ( ON ?auto_596718 ?auto_596717 ) ( ON ?auto_596719 ?auto_596718 ) ( ON ?auto_596720 ?auto_596719 ) ( ON ?auto_596721 ?auto_596720 ) ( ON ?auto_596722 ?auto_596721 ) ( ON ?auto_596723 ?auto_596722 ) ( not ( = ?auto_596708 ?auto_596709 ) ) ( not ( = ?auto_596708 ?auto_596710 ) ) ( not ( = ?auto_596708 ?auto_596711 ) ) ( not ( = ?auto_596708 ?auto_596712 ) ) ( not ( = ?auto_596708 ?auto_596713 ) ) ( not ( = ?auto_596708 ?auto_596714 ) ) ( not ( = ?auto_596708 ?auto_596715 ) ) ( not ( = ?auto_596708 ?auto_596716 ) ) ( not ( = ?auto_596708 ?auto_596717 ) ) ( not ( = ?auto_596708 ?auto_596718 ) ) ( not ( = ?auto_596708 ?auto_596719 ) ) ( not ( = ?auto_596708 ?auto_596720 ) ) ( not ( = ?auto_596708 ?auto_596721 ) ) ( not ( = ?auto_596708 ?auto_596722 ) ) ( not ( = ?auto_596708 ?auto_596723 ) ) ( not ( = ?auto_596708 ?auto_596724 ) ) ( not ( = ?auto_596709 ?auto_596710 ) ) ( not ( = ?auto_596709 ?auto_596711 ) ) ( not ( = ?auto_596709 ?auto_596712 ) ) ( not ( = ?auto_596709 ?auto_596713 ) ) ( not ( = ?auto_596709 ?auto_596714 ) ) ( not ( = ?auto_596709 ?auto_596715 ) ) ( not ( = ?auto_596709 ?auto_596716 ) ) ( not ( = ?auto_596709 ?auto_596717 ) ) ( not ( = ?auto_596709 ?auto_596718 ) ) ( not ( = ?auto_596709 ?auto_596719 ) ) ( not ( = ?auto_596709 ?auto_596720 ) ) ( not ( = ?auto_596709 ?auto_596721 ) ) ( not ( = ?auto_596709 ?auto_596722 ) ) ( not ( = ?auto_596709 ?auto_596723 ) ) ( not ( = ?auto_596709 ?auto_596724 ) ) ( not ( = ?auto_596710 ?auto_596711 ) ) ( not ( = ?auto_596710 ?auto_596712 ) ) ( not ( = ?auto_596710 ?auto_596713 ) ) ( not ( = ?auto_596710 ?auto_596714 ) ) ( not ( = ?auto_596710 ?auto_596715 ) ) ( not ( = ?auto_596710 ?auto_596716 ) ) ( not ( = ?auto_596710 ?auto_596717 ) ) ( not ( = ?auto_596710 ?auto_596718 ) ) ( not ( = ?auto_596710 ?auto_596719 ) ) ( not ( = ?auto_596710 ?auto_596720 ) ) ( not ( = ?auto_596710 ?auto_596721 ) ) ( not ( = ?auto_596710 ?auto_596722 ) ) ( not ( = ?auto_596710 ?auto_596723 ) ) ( not ( = ?auto_596710 ?auto_596724 ) ) ( not ( = ?auto_596711 ?auto_596712 ) ) ( not ( = ?auto_596711 ?auto_596713 ) ) ( not ( = ?auto_596711 ?auto_596714 ) ) ( not ( = ?auto_596711 ?auto_596715 ) ) ( not ( = ?auto_596711 ?auto_596716 ) ) ( not ( = ?auto_596711 ?auto_596717 ) ) ( not ( = ?auto_596711 ?auto_596718 ) ) ( not ( = ?auto_596711 ?auto_596719 ) ) ( not ( = ?auto_596711 ?auto_596720 ) ) ( not ( = ?auto_596711 ?auto_596721 ) ) ( not ( = ?auto_596711 ?auto_596722 ) ) ( not ( = ?auto_596711 ?auto_596723 ) ) ( not ( = ?auto_596711 ?auto_596724 ) ) ( not ( = ?auto_596712 ?auto_596713 ) ) ( not ( = ?auto_596712 ?auto_596714 ) ) ( not ( = ?auto_596712 ?auto_596715 ) ) ( not ( = ?auto_596712 ?auto_596716 ) ) ( not ( = ?auto_596712 ?auto_596717 ) ) ( not ( = ?auto_596712 ?auto_596718 ) ) ( not ( = ?auto_596712 ?auto_596719 ) ) ( not ( = ?auto_596712 ?auto_596720 ) ) ( not ( = ?auto_596712 ?auto_596721 ) ) ( not ( = ?auto_596712 ?auto_596722 ) ) ( not ( = ?auto_596712 ?auto_596723 ) ) ( not ( = ?auto_596712 ?auto_596724 ) ) ( not ( = ?auto_596713 ?auto_596714 ) ) ( not ( = ?auto_596713 ?auto_596715 ) ) ( not ( = ?auto_596713 ?auto_596716 ) ) ( not ( = ?auto_596713 ?auto_596717 ) ) ( not ( = ?auto_596713 ?auto_596718 ) ) ( not ( = ?auto_596713 ?auto_596719 ) ) ( not ( = ?auto_596713 ?auto_596720 ) ) ( not ( = ?auto_596713 ?auto_596721 ) ) ( not ( = ?auto_596713 ?auto_596722 ) ) ( not ( = ?auto_596713 ?auto_596723 ) ) ( not ( = ?auto_596713 ?auto_596724 ) ) ( not ( = ?auto_596714 ?auto_596715 ) ) ( not ( = ?auto_596714 ?auto_596716 ) ) ( not ( = ?auto_596714 ?auto_596717 ) ) ( not ( = ?auto_596714 ?auto_596718 ) ) ( not ( = ?auto_596714 ?auto_596719 ) ) ( not ( = ?auto_596714 ?auto_596720 ) ) ( not ( = ?auto_596714 ?auto_596721 ) ) ( not ( = ?auto_596714 ?auto_596722 ) ) ( not ( = ?auto_596714 ?auto_596723 ) ) ( not ( = ?auto_596714 ?auto_596724 ) ) ( not ( = ?auto_596715 ?auto_596716 ) ) ( not ( = ?auto_596715 ?auto_596717 ) ) ( not ( = ?auto_596715 ?auto_596718 ) ) ( not ( = ?auto_596715 ?auto_596719 ) ) ( not ( = ?auto_596715 ?auto_596720 ) ) ( not ( = ?auto_596715 ?auto_596721 ) ) ( not ( = ?auto_596715 ?auto_596722 ) ) ( not ( = ?auto_596715 ?auto_596723 ) ) ( not ( = ?auto_596715 ?auto_596724 ) ) ( not ( = ?auto_596716 ?auto_596717 ) ) ( not ( = ?auto_596716 ?auto_596718 ) ) ( not ( = ?auto_596716 ?auto_596719 ) ) ( not ( = ?auto_596716 ?auto_596720 ) ) ( not ( = ?auto_596716 ?auto_596721 ) ) ( not ( = ?auto_596716 ?auto_596722 ) ) ( not ( = ?auto_596716 ?auto_596723 ) ) ( not ( = ?auto_596716 ?auto_596724 ) ) ( not ( = ?auto_596717 ?auto_596718 ) ) ( not ( = ?auto_596717 ?auto_596719 ) ) ( not ( = ?auto_596717 ?auto_596720 ) ) ( not ( = ?auto_596717 ?auto_596721 ) ) ( not ( = ?auto_596717 ?auto_596722 ) ) ( not ( = ?auto_596717 ?auto_596723 ) ) ( not ( = ?auto_596717 ?auto_596724 ) ) ( not ( = ?auto_596718 ?auto_596719 ) ) ( not ( = ?auto_596718 ?auto_596720 ) ) ( not ( = ?auto_596718 ?auto_596721 ) ) ( not ( = ?auto_596718 ?auto_596722 ) ) ( not ( = ?auto_596718 ?auto_596723 ) ) ( not ( = ?auto_596718 ?auto_596724 ) ) ( not ( = ?auto_596719 ?auto_596720 ) ) ( not ( = ?auto_596719 ?auto_596721 ) ) ( not ( = ?auto_596719 ?auto_596722 ) ) ( not ( = ?auto_596719 ?auto_596723 ) ) ( not ( = ?auto_596719 ?auto_596724 ) ) ( not ( = ?auto_596720 ?auto_596721 ) ) ( not ( = ?auto_596720 ?auto_596722 ) ) ( not ( = ?auto_596720 ?auto_596723 ) ) ( not ( = ?auto_596720 ?auto_596724 ) ) ( not ( = ?auto_596721 ?auto_596722 ) ) ( not ( = ?auto_596721 ?auto_596723 ) ) ( not ( = ?auto_596721 ?auto_596724 ) ) ( not ( = ?auto_596722 ?auto_596723 ) ) ( not ( = ?auto_596722 ?auto_596724 ) ) ( not ( = ?auto_596723 ?auto_596724 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_596724 )
      ( !STACK ?auto_596724 ?auto_596723 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596742 - BLOCK
      ?auto_596743 - BLOCK
      ?auto_596744 - BLOCK
      ?auto_596745 - BLOCK
      ?auto_596746 - BLOCK
      ?auto_596747 - BLOCK
      ?auto_596748 - BLOCK
      ?auto_596749 - BLOCK
      ?auto_596750 - BLOCK
      ?auto_596751 - BLOCK
      ?auto_596752 - BLOCK
      ?auto_596753 - BLOCK
      ?auto_596754 - BLOCK
      ?auto_596755 - BLOCK
      ?auto_596756 - BLOCK
      ?auto_596757 - BLOCK
      ?auto_596758 - BLOCK
    )
    :vars
    (
      ?auto_596759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596758 ?auto_596759 ) ( ON-TABLE ?auto_596742 ) ( ON ?auto_596743 ?auto_596742 ) ( ON ?auto_596744 ?auto_596743 ) ( ON ?auto_596745 ?auto_596744 ) ( ON ?auto_596746 ?auto_596745 ) ( ON ?auto_596747 ?auto_596746 ) ( ON ?auto_596748 ?auto_596747 ) ( ON ?auto_596749 ?auto_596748 ) ( ON ?auto_596750 ?auto_596749 ) ( ON ?auto_596751 ?auto_596750 ) ( ON ?auto_596752 ?auto_596751 ) ( ON ?auto_596753 ?auto_596752 ) ( ON ?auto_596754 ?auto_596753 ) ( ON ?auto_596755 ?auto_596754 ) ( ON ?auto_596756 ?auto_596755 ) ( not ( = ?auto_596742 ?auto_596743 ) ) ( not ( = ?auto_596742 ?auto_596744 ) ) ( not ( = ?auto_596742 ?auto_596745 ) ) ( not ( = ?auto_596742 ?auto_596746 ) ) ( not ( = ?auto_596742 ?auto_596747 ) ) ( not ( = ?auto_596742 ?auto_596748 ) ) ( not ( = ?auto_596742 ?auto_596749 ) ) ( not ( = ?auto_596742 ?auto_596750 ) ) ( not ( = ?auto_596742 ?auto_596751 ) ) ( not ( = ?auto_596742 ?auto_596752 ) ) ( not ( = ?auto_596742 ?auto_596753 ) ) ( not ( = ?auto_596742 ?auto_596754 ) ) ( not ( = ?auto_596742 ?auto_596755 ) ) ( not ( = ?auto_596742 ?auto_596756 ) ) ( not ( = ?auto_596742 ?auto_596757 ) ) ( not ( = ?auto_596742 ?auto_596758 ) ) ( not ( = ?auto_596742 ?auto_596759 ) ) ( not ( = ?auto_596743 ?auto_596744 ) ) ( not ( = ?auto_596743 ?auto_596745 ) ) ( not ( = ?auto_596743 ?auto_596746 ) ) ( not ( = ?auto_596743 ?auto_596747 ) ) ( not ( = ?auto_596743 ?auto_596748 ) ) ( not ( = ?auto_596743 ?auto_596749 ) ) ( not ( = ?auto_596743 ?auto_596750 ) ) ( not ( = ?auto_596743 ?auto_596751 ) ) ( not ( = ?auto_596743 ?auto_596752 ) ) ( not ( = ?auto_596743 ?auto_596753 ) ) ( not ( = ?auto_596743 ?auto_596754 ) ) ( not ( = ?auto_596743 ?auto_596755 ) ) ( not ( = ?auto_596743 ?auto_596756 ) ) ( not ( = ?auto_596743 ?auto_596757 ) ) ( not ( = ?auto_596743 ?auto_596758 ) ) ( not ( = ?auto_596743 ?auto_596759 ) ) ( not ( = ?auto_596744 ?auto_596745 ) ) ( not ( = ?auto_596744 ?auto_596746 ) ) ( not ( = ?auto_596744 ?auto_596747 ) ) ( not ( = ?auto_596744 ?auto_596748 ) ) ( not ( = ?auto_596744 ?auto_596749 ) ) ( not ( = ?auto_596744 ?auto_596750 ) ) ( not ( = ?auto_596744 ?auto_596751 ) ) ( not ( = ?auto_596744 ?auto_596752 ) ) ( not ( = ?auto_596744 ?auto_596753 ) ) ( not ( = ?auto_596744 ?auto_596754 ) ) ( not ( = ?auto_596744 ?auto_596755 ) ) ( not ( = ?auto_596744 ?auto_596756 ) ) ( not ( = ?auto_596744 ?auto_596757 ) ) ( not ( = ?auto_596744 ?auto_596758 ) ) ( not ( = ?auto_596744 ?auto_596759 ) ) ( not ( = ?auto_596745 ?auto_596746 ) ) ( not ( = ?auto_596745 ?auto_596747 ) ) ( not ( = ?auto_596745 ?auto_596748 ) ) ( not ( = ?auto_596745 ?auto_596749 ) ) ( not ( = ?auto_596745 ?auto_596750 ) ) ( not ( = ?auto_596745 ?auto_596751 ) ) ( not ( = ?auto_596745 ?auto_596752 ) ) ( not ( = ?auto_596745 ?auto_596753 ) ) ( not ( = ?auto_596745 ?auto_596754 ) ) ( not ( = ?auto_596745 ?auto_596755 ) ) ( not ( = ?auto_596745 ?auto_596756 ) ) ( not ( = ?auto_596745 ?auto_596757 ) ) ( not ( = ?auto_596745 ?auto_596758 ) ) ( not ( = ?auto_596745 ?auto_596759 ) ) ( not ( = ?auto_596746 ?auto_596747 ) ) ( not ( = ?auto_596746 ?auto_596748 ) ) ( not ( = ?auto_596746 ?auto_596749 ) ) ( not ( = ?auto_596746 ?auto_596750 ) ) ( not ( = ?auto_596746 ?auto_596751 ) ) ( not ( = ?auto_596746 ?auto_596752 ) ) ( not ( = ?auto_596746 ?auto_596753 ) ) ( not ( = ?auto_596746 ?auto_596754 ) ) ( not ( = ?auto_596746 ?auto_596755 ) ) ( not ( = ?auto_596746 ?auto_596756 ) ) ( not ( = ?auto_596746 ?auto_596757 ) ) ( not ( = ?auto_596746 ?auto_596758 ) ) ( not ( = ?auto_596746 ?auto_596759 ) ) ( not ( = ?auto_596747 ?auto_596748 ) ) ( not ( = ?auto_596747 ?auto_596749 ) ) ( not ( = ?auto_596747 ?auto_596750 ) ) ( not ( = ?auto_596747 ?auto_596751 ) ) ( not ( = ?auto_596747 ?auto_596752 ) ) ( not ( = ?auto_596747 ?auto_596753 ) ) ( not ( = ?auto_596747 ?auto_596754 ) ) ( not ( = ?auto_596747 ?auto_596755 ) ) ( not ( = ?auto_596747 ?auto_596756 ) ) ( not ( = ?auto_596747 ?auto_596757 ) ) ( not ( = ?auto_596747 ?auto_596758 ) ) ( not ( = ?auto_596747 ?auto_596759 ) ) ( not ( = ?auto_596748 ?auto_596749 ) ) ( not ( = ?auto_596748 ?auto_596750 ) ) ( not ( = ?auto_596748 ?auto_596751 ) ) ( not ( = ?auto_596748 ?auto_596752 ) ) ( not ( = ?auto_596748 ?auto_596753 ) ) ( not ( = ?auto_596748 ?auto_596754 ) ) ( not ( = ?auto_596748 ?auto_596755 ) ) ( not ( = ?auto_596748 ?auto_596756 ) ) ( not ( = ?auto_596748 ?auto_596757 ) ) ( not ( = ?auto_596748 ?auto_596758 ) ) ( not ( = ?auto_596748 ?auto_596759 ) ) ( not ( = ?auto_596749 ?auto_596750 ) ) ( not ( = ?auto_596749 ?auto_596751 ) ) ( not ( = ?auto_596749 ?auto_596752 ) ) ( not ( = ?auto_596749 ?auto_596753 ) ) ( not ( = ?auto_596749 ?auto_596754 ) ) ( not ( = ?auto_596749 ?auto_596755 ) ) ( not ( = ?auto_596749 ?auto_596756 ) ) ( not ( = ?auto_596749 ?auto_596757 ) ) ( not ( = ?auto_596749 ?auto_596758 ) ) ( not ( = ?auto_596749 ?auto_596759 ) ) ( not ( = ?auto_596750 ?auto_596751 ) ) ( not ( = ?auto_596750 ?auto_596752 ) ) ( not ( = ?auto_596750 ?auto_596753 ) ) ( not ( = ?auto_596750 ?auto_596754 ) ) ( not ( = ?auto_596750 ?auto_596755 ) ) ( not ( = ?auto_596750 ?auto_596756 ) ) ( not ( = ?auto_596750 ?auto_596757 ) ) ( not ( = ?auto_596750 ?auto_596758 ) ) ( not ( = ?auto_596750 ?auto_596759 ) ) ( not ( = ?auto_596751 ?auto_596752 ) ) ( not ( = ?auto_596751 ?auto_596753 ) ) ( not ( = ?auto_596751 ?auto_596754 ) ) ( not ( = ?auto_596751 ?auto_596755 ) ) ( not ( = ?auto_596751 ?auto_596756 ) ) ( not ( = ?auto_596751 ?auto_596757 ) ) ( not ( = ?auto_596751 ?auto_596758 ) ) ( not ( = ?auto_596751 ?auto_596759 ) ) ( not ( = ?auto_596752 ?auto_596753 ) ) ( not ( = ?auto_596752 ?auto_596754 ) ) ( not ( = ?auto_596752 ?auto_596755 ) ) ( not ( = ?auto_596752 ?auto_596756 ) ) ( not ( = ?auto_596752 ?auto_596757 ) ) ( not ( = ?auto_596752 ?auto_596758 ) ) ( not ( = ?auto_596752 ?auto_596759 ) ) ( not ( = ?auto_596753 ?auto_596754 ) ) ( not ( = ?auto_596753 ?auto_596755 ) ) ( not ( = ?auto_596753 ?auto_596756 ) ) ( not ( = ?auto_596753 ?auto_596757 ) ) ( not ( = ?auto_596753 ?auto_596758 ) ) ( not ( = ?auto_596753 ?auto_596759 ) ) ( not ( = ?auto_596754 ?auto_596755 ) ) ( not ( = ?auto_596754 ?auto_596756 ) ) ( not ( = ?auto_596754 ?auto_596757 ) ) ( not ( = ?auto_596754 ?auto_596758 ) ) ( not ( = ?auto_596754 ?auto_596759 ) ) ( not ( = ?auto_596755 ?auto_596756 ) ) ( not ( = ?auto_596755 ?auto_596757 ) ) ( not ( = ?auto_596755 ?auto_596758 ) ) ( not ( = ?auto_596755 ?auto_596759 ) ) ( not ( = ?auto_596756 ?auto_596757 ) ) ( not ( = ?auto_596756 ?auto_596758 ) ) ( not ( = ?auto_596756 ?auto_596759 ) ) ( not ( = ?auto_596757 ?auto_596758 ) ) ( not ( = ?auto_596757 ?auto_596759 ) ) ( not ( = ?auto_596758 ?auto_596759 ) ) ( CLEAR ?auto_596756 ) ( ON ?auto_596757 ?auto_596758 ) ( CLEAR ?auto_596757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_596742 ?auto_596743 ?auto_596744 ?auto_596745 ?auto_596746 ?auto_596747 ?auto_596748 ?auto_596749 ?auto_596750 ?auto_596751 ?auto_596752 ?auto_596753 ?auto_596754 ?auto_596755 ?auto_596756 ?auto_596757 )
      ( MAKE-17PILE ?auto_596742 ?auto_596743 ?auto_596744 ?auto_596745 ?auto_596746 ?auto_596747 ?auto_596748 ?auto_596749 ?auto_596750 ?auto_596751 ?auto_596752 ?auto_596753 ?auto_596754 ?auto_596755 ?auto_596756 ?auto_596757 ?auto_596758 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596777 - BLOCK
      ?auto_596778 - BLOCK
      ?auto_596779 - BLOCK
      ?auto_596780 - BLOCK
      ?auto_596781 - BLOCK
      ?auto_596782 - BLOCK
      ?auto_596783 - BLOCK
      ?auto_596784 - BLOCK
      ?auto_596785 - BLOCK
      ?auto_596786 - BLOCK
      ?auto_596787 - BLOCK
      ?auto_596788 - BLOCK
      ?auto_596789 - BLOCK
      ?auto_596790 - BLOCK
      ?auto_596791 - BLOCK
      ?auto_596792 - BLOCK
      ?auto_596793 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_596793 ) ( ON-TABLE ?auto_596777 ) ( ON ?auto_596778 ?auto_596777 ) ( ON ?auto_596779 ?auto_596778 ) ( ON ?auto_596780 ?auto_596779 ) ( ON ?auto_596781 ?auto_596780 ) ( ON ?auto_596782 ?auto_596781 ) ( ON ?auto_596783 ?auto_596782 ) ( ON ?auto_596784 ?auto_596783 ) ( ON ?auto_596785 ?auto_596784 ) ( ON ?auto_596786 ?auto_596785 ) ( ON ?auto_596787 ?auto_596786 ) ( ON ?auto_596788 ?auto_596787 ) ( ON ?auto_596789 ?auto_596788 ) ( ON ?auto_596790 ?auto_596789 ) ( ON ?auto_596791 ?auto_596790 ) ( not ( = ?auto_596777 ?auto_596778 ) ) ( not ( = ?auto_596777 ?auto_596779 ) ) ( not ( = ?auto_596777 ?auto_596780 ) ) ( not ( = ?auto_596777 ?auto_596781 ) ) ( not ( = ?auto_596777 ?auto_596782 ) ) ( not ( = ?auto_596777 ?auto_596783 ) ) ( not ( = ?auto_596777 ?auto_596784 ) ) ( not ( = ?auto_596777 ?auto_596785 ) ) ( not ( = ?auto_596777 ?auto_596786 ) ) ( not ( = ?auto_596777 ?auto_596787 ) ) ( not ( = ?auto_596777 ?auto_596788 ) ) ( not ( = ?auto_596777 ?auto_596789 ) ) ( not ( = ?auto_596777 ?auto_596790 ) ) ( not ( = ?auto_596777 ?auto_596791 ) ) ( not ( = ?auto_596777 ?auto_596792 ) ) ( not ( = ?auto_596777 ?auto_596793 ) ) ( not ( = ?auto_596778 ?auto_596779 ) ) ( not ( = ?auto_596778 ?auto_596780 ) ) ( not ( = ?auto_596778 ?auto_596781 ) ) ( not ( = ?auto_596778 ?auto_596782 ) ) ( not ( = ?auto_596778 ?auto_596783 ) ) ( not ( = ?auto_596778 ?auto_596784 ) ) ( not ( = ?auto_596778 ?auto_596785 ) ) ( not ( = ?auto_596778 ?auto_596786 ) ) ( not ( = ?auto_596778 ?auto_596787 ) ) ( not ( = ?auto_596778 ?auto_596788 ) ) ( not ( = ?auto_596778 ?auto_596789 ) ) ( not ( = ?auto_596778 ?auto_596790 ) ) ( not ( = ?auto_596778 ?auto_596791 ) ) ( not ( = ?auto_596778 ?auto_596792 ) ) ( not ( = ?auto_596778 ?auto_596793 ) ) ( not ( = ?auto_596779 ?auto_596780 ) ) ( not ( = ?auto_596779 ?auto_596781 ) ) ( not ( = ?auto_596779 ?auto_596782 ) ) ( not ( = ?auto_596779 ?auto_596783 ) ) ( not ( = ?auto_596779 ?auto_596784 ) ) ( not ( = ?auto_596779 ?auto_596785 ) ) ( not ( = ?auto_596779 ?auto_596786 ) ) ( not ( = ?auto_596779 ?auto_596787 ) ) ( not ( = ?auto_596779 ?auto_596788 ) ) ( not ( = ?auto_596779 ?auto_596789 ) ) ( not ( = ?auto_596779 ?auto_596790 ) ) ( not ( = ?auto_596779 ?auto_596791 ) ) ( not ( = ?auto_596779 ?auto_596792 ) ) ( not ( = ?auto_596779 ?auto_596793 ) ) ( not ( = ?auto_596780 ?auto_596781 ) ) ( not ( = ?auto_596780 ?auto_596782 ) ) ( not ( = ?auto_596780 ?auto_596783 ) ) ( not ( = ?auto_596780 ?auto_596784 ) ) ( not ( = ?auto_596780 ?auto_596785 ) ) ( not ( = ?auto_596780 ?auto_596786 ) ) ( not ( = ?auto_596780 ?auto_596787 ) ) ( not ( = ?auto_596780 ?auto_596788 ) ) ( not ( = ?auto_596780 ?auto_596789 ) ) ( not ( = ?auto_596780 ?auto_596790 ) ) ( not ( = ?auto_596780 ?auto_596791 ) ) ( not ( = ?auto_596780 ?auto_596792 ) ) ( not ( = ?auto_596780 ?auto_596793 ) ) ( not ( = ?auto_596781 ?auto_596782 ) ) ( not ( = ?auto_596781 ?auto_596783 ) ) ( not ( = ?auto_596781 ?auto_596784 ) ) ( not ( = ?auto_596781 ?auto_596785 ) ) ( not ( = ?auto_596781 ?auto_596786 ) ) ( not ( = ?auto_596781 ?auto_596787 ) ) ( not ( = ?auto_596781 ?auto_596788 ) ) ( not ( = ?auto_596781 ?auto_596789 ) ) ( not ( = ?auto_596781 ?auto_596790 ) ) ( not ( = ?auto_596781 ?auto_596791 ) ) ( not ( = ?auto_596781 ?auto_596792 ) ) ( not ( = ?auto_596781 ?auto_596793 ) ) ( not ( = ?auto_596782 ?auto_596783 ) ) ( not ( = ?auto_596782 ?auto_596784 ) ) ( not ( = ?auto_596782 ?auto_596785 ) ) ( not ( = ?auto_596782 ?auto_596786 ) ) ( not ( = ?auto_596782 ?auto_596787 ) ) ( not ( = ?auto_596782 ?auto_596788 ) ) ( not ( = ?auto_596782 ?auto_596789 ) ) ( not ( = ?auto_596782 ?auto_596790 ) ) ( not ( = ?auto_596782 ?auto_596791 ) ) ( not ( = ?auto_596782 ?auto_596792 ) ) ( not ( = ?auto_596782 ?auto_596793 ) ) ( not ( = ?auto_596783 ?auto_596784 ) ) ( not ( = ?auto_596783 ?auto_596785 ) ) ( not ( = ?auto_596783 ?auto_596786 ) ) ( not ( = ?auto_596783 ?auto_596787 ) ) ( not ( = ?auto_596783 ?auto_596788 ) ) ( not ( = ?auto_596783 ?auto_596789 ) ) ( not ( = ?auto_596783 ?auto_596790 ) ) ( not ( = ?auto_596783 ?auto_596791 ) ) ( not ( = ?auto_596783 ?auto_596792 ) ) ( not ( = ?auto_596783 ?auto_596793 ) ) ( not ( = ?auto_596784 ?auto_596785 ) ) ( not ( = ?auto_596784 ?auto_596786 ) ) ( not ( = ?auto_596784 ?auto_596787 ) ) ( not ( = ?auto_596784 ?auto_596788 ) ) ( not ( = ?auto_596784 ?auto_596789 ) ) ( not ( = ?auto_596784 ?auto_596790 ) ) ( not ( = ?auto_596784 ?auto_596791 ) ) ( not ( = ?auto_596784 ?auto_596792 ) ) ( not ( = ?auto_596784 ?auto_596793 ) ) ( not ( = ?auto_596785 ?auto_596786 ) ) ( not ( = ?auto_596785 ?auto_596787 ) ) ( not ( = ?auto_596785 ?auto_596788 ) ) ( not ( = ?auto_596785 ?auto_596789 ) ) ( not ( = ?auto_596785 ?auto_596790 ) ) ( not ( = ?auto_596785 ?auto_596791 ) ) ( not ( = ?auto_596785 ?auto_596792 ) ) ( not ( = ?auto_596785 ?auto_596793 ) ) ( not ( = ?auto_596786 ?auto_596787 ) ) ( not ( = ?auto_596786 ?auto_596788 ) ) ( not ( = ?auto_596786 ?auto_596789 ) ) ( not ( = ?auto_596786 ?auto_596790 ) ) ( not ( = ?auto_596786 ?auto_596791 ) ) ( not ( = ?auto_596786 ?auto_596792 ) ) ( not ( = ?auto_596786 ?auto_596793 ) ) ( not ( = ?auto_596787 ?auto_596788 ) ) ( not ( = ?auto_596787 ?auto_596789 ) ) ( not ( = ?auto_596787 ?auto_596790 ) ) ( not ( = ?auto_596787 ?auto_596791 ) ) ( not ( = ?auto_596787 ?auto_596792 ) ) ( not ( = ?auto_596787 ?auto_596793 ) ) ( not ( = ?auto_596788 ?auto_596789 ) ) ( not ( = ?auto_596788 ?auto_596790 ) ) ( not ( = ?auto_596788 ?auto_596791 ) ) ( not ( = ?auto_596788 ?auto_596792 ) ) ( not ( = ?auto_596788 ?auto_596793 ) ) ( not ( = ?auto_596789 ?auto_596790 ) ) ( not ( = ?auto_596789 ?auto_596791 ) ) ( not ( = ?auto_596789 ?auto_596792 ) ) ( not ( = ?auto_596789 ?auto_596793 ) ) ( not ( = ?auto_596790 ?auto_596791 ) ) ( not ( = ?auto_596790 ?auto_596792 ) ) ( not ( = ?auto_596790 ?auto_596793 ) ) ( not ( = ?auto_596791 ?auto_596792 ) ) ( not ( = ?auto_596791 ?auto_596793 ) ) ( not ( = ?auto_596792 ?auto_596793 ) ) ( CLEAR ?auto_596791 ) ( ON ?auto_596792 ?auto_596793 ) ( CLEAR ?auto_596792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_596777 ?auto_596778 ?auto_596779 ?auto_596780 ?auto_596781 ?auto_596782 ?auto_596783 ?auto_596784 ?auto_596785 ?auto_596786 ?auto_596787 ?auto_596788 ?auto_596789 ?auto_596790 ?auto_596791 ?auto_596792 )
      ( MAKE-17PILE ?auto_596777 ?auto_596778 ?auto_596779 ?auto_596780 ?auto_596781 ?auto_596782 ?auto_596783 ?auto_596784 ?auto_596785 ?auto_596786 ?auto_596787 ?auto_596788 ?auto_596789 ?auto_596790 ?auto_596791 ?auto_596792 ?auto_596793 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596811 - BLOCK
      ?auto_596812 - BLOCK
      ?auto_596813 - BLOCK
      ?auto_596814 - BLOCK
      ?auto_596815 - BLOCK
      ?auto_596816 - BLOCK
      ?auto_596817 - BLOCK
      ?auto_596818 - BLOCK
      ?auto_596819 - BLOCK
      ?auto_596820 - BLOCK
      ?auto_596821 - BLOCK
      ?auto_596822 - BLOCK
      ?auto_596823 - BLOCK
      ?auto_596824 - BLOCK
      ?auto_596825 - BLOCK
      ?auto_596826 - BLOCK
      ?auto_596827 - BLOCK
    )
    :vars
    (
      ?auto_596828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596827 ?auto_596828 ) ( ON-TABLE ?auto_596811 ) ( ON ?auto_596812 ?auto_596811 ) ( ON ?auto_596813 ?auto_596812 ) ( ON ?auto_596814 ?auto_596813 ) ( ON ?auto_596815 ?auto_596814 ) ( ON ?auto_596816 ?auto_596815 ) ( ON ?auto_596817 ?auto_596816 ) ( ON ?auto_596818 ?auto_596817 ) ( ON ?auto_596819 ?auto_596818 ) ( ON ?auto_596820 ?auto_596819 ) ( ON ?auto_596821 ?auto_596820 ) ( ON ?auto_596822 ?auto_596821 ) ( ON ?auto_596823 ?auto_596822 ) ( ON ?auto_596824 ?auto_596823 ) ( not ( = ?auto_596811 ?auto_596812 ) ) ( not ( = ?auto_596811 ?auto_596813 ) ) ( not ( = ?auto_596811 ?auto_596814 ) ) ( not ( = ?auto_596811 ?auto_596815 ) ) ( not ( = ?auto_596811 ?auto_596816 ) ) ( not ( = ?auto_596811 ?auto_596817 ) ) ( not ( = ?auto_596811 ?auto_596818 ) ) ( not ( = ?auto_596811 ?auto_596819 ) ) ( not ( = ?auto_596811 ?auto_596820 ) ) ( not ( = ?auto_596811 ?auto_596821 ) ) ( not ( = ?auto_596811 ?auto_596822 ) ) ( not ( = ?auto_596811 ?auto_596823 ) ) ( not ( = ?auto_596811 ?auto_596824 ) ) ( not ( = ?auto_596811 ?auto_596825 ) ) ( not ( = ?auto_596811 ?auto_596826 ) ) ( not ( = ?auto_596811 ?auto_596827 ) ) ( not ( = ?auto_596811 ?auto_596828 ) ) ( not ( = ?auto_596812 ?auto_596813 ) ) ( not ( = ?auto_596812 ?auto_596814 ) ) ( not ( = ?auto_596812 ?auto_596815 ) ) ( not ( = ?auto_596812 ?auto_596816 ) ) ( not ( = ?auto_596812 ?auto_596817 ) ) ( not ( = ?auto_596812 ?auto_596818 ) ) ( not ( = ?auto_596812 ?auto_596819 ) ) ( not ( = ?auto_596812 ?auto_596820 ) ) ( not ( = ?auto_596812 ?auto_596821 ) ) ( not ( = ?auto_596812 ?auto_596822 ) ) ( not ( = ?auto_596812 ?auto_596823 ) ) ( not ( = ?auto_596812 ?auto_596824 ) ) ( not ( = ?auto_596812 ?auto_596825 ) ) ( not ( = ?auto_596812 ?auto_596826 ) ) ( not ( = ?auto_596812 ?auto_596827 ) ) ( not ( = ?auto_596812 ?auto_596828 ) ) ( not ( = ?auto_596813 ?auto_596814 ) ) ( not ( = ?auto_596813 ?auto_596815 ) ) ( not ( = ?auto_596813 ?auto_596816 ) ) ( not ( = ?auto_596813 ?auto_596817 ) ) ( not ( = ?auto_596813 ?auto_596818 ) ) ( not ( = ?auto_596813 ?auto_596819 ) ) ( not ( = ?auto_596813 ?auto_596820 ) ) ( not ( = ?auto_596813 ?auto_596821 ) ) ( not ( = ?auto_596813 ?auto_596822 ) ) ( not ( = ?auto_596813 ?auto_596823 ) ) ( not ( = ?auto_596813 ?auto_596824 ) ) ( not ( = ?auto_596813 ?auto_596825 ) ) ( not ( = ?auto_596813 ?auto_596826 ) ) ( not ( = ?auto_596813 ?auto_596827 ) ) ( not ( = ?auto_596813 ?auto_596828 ) ) ( not ( = ?auto_596814 ?auto_596815 ) ) ( not ( = ?auto_596814 ?auto_596816 ) ) ( not ( = ?auto_596814 ?auto_596817 ) ) ( not ( = ?auto_596814 ?auto_596818 ) ) ( not ( = ?auto_596814 ?auto_596819 ) ) ( not ( = ?auto_596814 ?auto_596820 ) ) ( not ( = ?auto_596814 ?auto_596821 ) ) ( not ( = ?auto_596814 ?auto_596822 ) ) ( not ( = ?auto_596814 ?auto_596823 ) ) ( not ( = ?auto_596814 ?auto_596824 ) ) ( not ( = ?auto_596814 ?auto_596825 ) ) ( not ( = ?auto_596814 ?auto_596826 ) ) ( not ( = ?auto_596814 ?auto_596827 ) ) ( not ( = ?auto_596814 ?auto_596828 ) ) ( not ( = ?auto_596815 ?auto_596816 ) ) ( not ( = ?auto_596815 ?auto_596817 ) ) ( not ( = ?auto_596815 ?auto_596818 ) ) ( not ( = ?auto_596815 ?auto_596819 ) ) ( not ( = ?auto_596815 ?auto_596820 ) ) ( not ( = ?auto_596815 ?auto_596821 ) ) ( not ( = ?auto_596815 ?auto_596822 ) ) ( not ( = ?auto_596815 ?auto_596823 ) ) ( not ( = ?auto_596815 ?auto_596824 ) ) ( not ( = ?auto_596815 ?auto_596825 ) ) ( not ( = ?auto_596815 ?auto_596826 ) ) ( not ( = ?auto_596815 ?auto_596827 ) ) ( not ( = ?auto_596815 ?auto_596828 ) ) ( not ( = ?auto_596816 ?auto_596817 ) ) ( not ( = ?auto_596816 ?auto_596818 ) ) ( not ( = ?auto_596816 ?auto_596819 ) ) ( not ( = ?auto_596816 ?auto_596820 ) ) ( not ( = ?auto_596816 ?auto_596821 ) ) ( not ( = ?auto_596816 ?auto_596822 ) ) ( not ( = ?auto_596816 ?auto_596823 ) ) ( not ( = ?auto_596816 ?auto_596824 ) ) ( not ( = ?auto_596816 ?auto_596825 ) ) ( not ( = ?auto_596816 ?auto_596826 ) ) ( not ( = ?auto_596816 ?auto_596827 ) ) ( not ( = ?auto_596816 ?auto_596828 ) ) ( not ( = ?auto_596817 ?auto_596818 ) ) ( not ( = ?auto_596817 ?auto_596819 ) ) ( not ( = ?auto_596817 ?auto_596820 ) ) ( not ( = ?auto_596817 ?auto_596821 ) ) ( not ( = ?auto_596817 ?auto_596822 ) ) ( not ( = ?auto_596817 ?auto_596823 ) ) ( not ( = ?auto_596817 ?auto_596824 ) ) ( not ( = ?auto_596817 ?auto_596825 ) ) ( not ( = ?auto_596817 ?auto_596826 ) ) ( not ( = ?auto_596817 ?auto_596827 ) ) ( not ( = ?auto_596817 ?auto_596828 ) ) ( not ( = ?auto_596818 ?auto_596819 ) ) ( not ( = ?auto_596818 ?auto_596820 ) ) ( not ( = ?auto_596818 ?auto_596821 ) ) ( not ( = ?auto_596818 ?auto_596822 ) ) ( not ( = ?auto_596818 ?auto_596823 ) ) ( not ( = ?auto_596818 ?auto_596824 ) ) ( not ( = ?auto_596818 ?auto_596825 ) ) ( not ( = ?auto_596818 ?auto_596826 ) ) ( not ( = ?auto_596818 ?auto_596827 ) ) ( not ( = ?auto_596818 ?auto_596828 ) ) ( not ( = ?auto_596819 ?auto_596820 ) ) ( not ( = ?auto_596819 ?auto_596821 ) ) ( not ( = ?auto_596819 ?auto_596822 ) ) ( not ( = ?auto_596819 ?auto_596823 ) ) ( not ( = ?auto_596819 ?auto_596824 ) ) ( not ( = ?auto_596819 ?auto_596825 ) ) ( not ( = ?auto_596819 ?auto_596826 ) ) ( not ( = ?auto_596819 ?auto_596827 ) ) ( not ( = ?auto_596819 ?auto_596828 ) ) ( not ( = ?auto_596820 ?auto_596821 ) ) ( not ( = ?auto_596820 ?auto_596822 ) ) ( not ( = ?auto_596820 ?auto_596823 ) ) ( not ( = ?auto_596820 ?auto_596824 ) ) ( not ( = ?auto_596820 ?auto_596825 ) ) ( not ( = ?auto_596820 ?auto_596826 ) ) ( not ( = ?auto_596820 ?auto_596827 ) ) ( not ( = ?auto_596820 ?auto_596828 ) ) ( not ( = ?auto_596821 ?auto_596822 ) ) ( not ( = ?auto_596821 ?auto_596823 ) ) ( not ( = ?auto_596821 ?auto_596824 ) ) ( not ( = ?auto_596821 ?auto_596825 ) ) ( not ( = ?auto_596821 ?auto_596826 ) ) ( not ( = ?auto_596821 ?auto_596827 ) ) ( not ( = ?auto_596821 ?auto_596828 ) ) ( not ( = ?auto_596822 ?auto_596823 ) ) ( not ( = ?auto_596822 ?auto_596824 ) ) ( not ( = ?auto_596822 ?auto_596825 ) ) ( not ( = ?auto_596822 ?auto_596826 ) ) ( not ( = ?auto_596822 ?auto_596827 ) ) ( not ( = ?auto_596822 ?auto_596828 ) ) ( not ( = ?auto_596823 ?auto_596824 ) ) ( not ( = ?auto_596823 ?auto_596825 ) ) ( not ( = ?auto_596823 ?auto_596826 ) ) ( not ( = ?auto_596823 ?auto_596827 ) ) ( not ( = ?auto_596823 ?auto_596828 ) ) ( not ( = ?auto_596824 ?auto_596825 ) ) ( not ( = ?auto_596824 ?auto_596826 ) ) ( not ( = ?auto_596824 ?auto_596827 ) ) ( not ( = ?auto_596824 ?auto_596828 ) ) ( not ( = ?auto_596825 ?auto_596826 ) ) ( not ( = ?auto_596825 ?auto_596827 ) ) ( not ( = ?auto_596825 ?auto_596828 ) ) ( not ( = ?auto_596826 ?auto_596827 ) ) ( not ( = ?auto_596826 ?auto_596828 ) ) ( not ( = ?auto_596827 ?auto_596828 ) ) ( ON ?auto_596826 ?auto_596827 ) ( CLEAR ?auto_596824 ) ( ON ?auto_596825 ?auto_596826 ) ( CLEAR ?auto_596825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_596811 ?auto_596812 ?auto_596813 ?auto_596814 ?auto_596815 ?auto_596816 ?auto_596817 ?auto_596818 ?auto_596819 ?auto_596820 ?auto_596821 ?auto_596822 ?auto_596823 ?auto_596824 ?auto_596825 )
      ( MAKE-17PILE ?auto_596811 ?auto_596812 ?auto_596813 ?auto_596814 ?auto_596815 ?auto_596816 ?auto_596817 ?auto_596818 ?auto_596819 ?auto_596820 ?auto_596821 ?auto_596822 ?auto_596823 ?auto_596824 ?auto_596825 ?auto_596826 ?auto_596827 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596846 - BLOCK
      ?auto_596847 - BLOCK
      ?auto_596848 - BLOCK
      ?auto_596849 - BLOCK
      ?auto_596850 - BLOCK
      ?auto_596851 - BLOCK
      ?auto_596852 - BLOCK
      ?auto_596853 - BLOCK
      ?auto_596854 - BLOCK
      ?auto_596855 - BLOCK
      ?auto_596856 - BLOCK
      ?auto_596857 - BLOCK
      ?auto_596858 - BLOCK
      ?auto_596859 - BLOCK
      ?auto_596860 - BLOCK
      ?auto_596861 - BLOCK
      ?auto_596862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_596862 ) ( ON-TABLE ?auto_596846 ) ( ON ?auto_596847 ?auto_596846 ) ( ON ?auto_596848 ?auto_596847 ) ( ON ?auto_596849 ?auto_596848 ) ( ON ?auto_596850 ?auto_596849 ) ( ON ?auto_596851 ?auto_596850 ) ( ON ?auto_596852 ?auto_596851 ) ( ON ?auto_596853 ?auto_596852 ) ( ON ?auto_596854 ?auto_596853 ) ( ON ?auto_596855 ?auto_596854 ) ( ON ?auto_596856 ?auto_596855 ) ( ON ?auto_596857 ?auto_596856 ) ( ON ?auto_596858 ?auto_596857 ) ( ON ?auto_596859 ?auto_596858 ) ( not ( = ?auto_596846 ?auto_596847 ) ) ( not ( = ?auto_596846 ?auto_596848 ) ) ( not ( = ?auto_596846 ?auto_596849 ) ) ( not ( = ?auto_596846 ?auto_596850 ) ) ( not ( = ?auto_596846 ?auto_596851 ) ) ( not ( = ?auto_596846 ?auto_596852 ) ) ( not ( = ?auto_596846 ?auto_596853 ) ) ( not ( = ?auto_596846 ?auto_596854 ) ) ( not ( = ?auto_596846 ?auto_596855 ) ) ( not ( = ?auto_596846 ?auto_596856 ) ) ( not ( = ?auto_596846 ?auto_596857 ) ) ( not ( = ?auto_596846 ?auto_596858 ) ) ( not ( = ?auto_596846 ?auto_596859 ) ) ( not ( = ?auto_596846 ?auto_596860 ) ) ( not ( = ?auto_596846 ?auto_596861 ) ) ( not ( = ?auto_596846 ?auto_596862 ) ) ( not ( = ?auto_596847 ?auto_596848 ) ) ( not ( = ?auto_596847 ?auto_596849 ) ) ( not ( = ?auto_596847 ?auto_596850 ) ) ( not ( = ?auto_596847 ?auto_596851 ) ) ( not ( = ?auto_596847 ?auto_596852 ) ) ( not ( = ?auto_596847 ?auto_596853 ) ) ( not ( = ?auto_596847 ?auto_596854 ) ) ( not ( = ?auto_596847 ?auto_596855 ) ) ( not ( = ?auto_596847 ?auto_596856 ) ) ( not ( = ?auto_596847 ?auto_596857 ) ) ( not ( = ?auto_596847 ?auto_596858 ) ) ( not ( = ?auto_596847 ?auto_596859 ) ) ( not ( = ?auto_596847 ?auto_596860 ) ) ( not ( = ?auto_596847 ?auto_596861 ) ) ( not ( = ?auto_596847 ?auto_596862 ) ) ( not ( = ?auto_596848 ?auto_596849 ) ) ( not ( = ?auto_596848 ?auto_596850 ) ) ( not ( = ?auto_596848 ?auto_596851 ) ) ( not ( = ?auto_596848 ?auto_596852 ) ) ( not ( = ?auto_596848 ?auto_596853 ) ) ( not ( = ?auto_596848 ?auto_596854 ) ) ( not ( = ?auto_596848 ?auto_596855 ) ) ( not ( = ?auto_596848 ?auto_596856 ) ) ( not ( = ?auto_596848 ?auto_596857 ) ) ( not ( = ?auto_596848 ?auto_596858 ) ) ( not ( = ?auto_596848 ?auto_596859 ) ) ( not ( = ?auto_596848 ?auto_596860 ) ) ( not ( = ?auto_596848 ?auto_596861 ) ) ( not ( = ?auto_596848 ?auto_596862 ) ) ( not ( = ?auto_596849 ?auto_596850 ) ) ( not ( = ?auto_596849 ?auto_596851 ) ) ( not ( = ?auto_596849 ?auto_596852 ) ) ( not ( = ?auto_596849 ?auto_596853 ) ) ( not ( = ?auto_596849 ?auto_596854 ) ) ( not ( = ?auto_596849 ?auto_596855 ) ) ( not ( = ?auto_596849 ?auto_596856 ) ) ( not ( = ?auto_596849 ?auto_596857 ) ) ( not ( = ?auto_596849 ?auto_596858 ) ) ( not ( = ?auto_596849 ?auto_596859 ) ) ( not ( = ?auto_596849 ?auto_596860 ) ) ( not ( = ?auto_596849 ?auto_596861 ) ) ( not ( = ?auto_596849 ?auto_596862 ) ) ( not ( = ?auto_596850 ?auto_596851 ) ) ( not ( = ?auto_596850 ?auto_596852 ) ) ( not ( = ?auto_596850 ?auto_596853 ) ) ( not ( = ?auto_596850 ?auto_596854 ) ) ( not ( = ?auto_596850 ?auto_596855 ) ) ( not ( = ?auto_596850 ?auto_596856 ) ) ( not ( = ?auto_596850 ?auto_596857 ) ) ( not ( = ?auto_596850 ?auto_596858 ) ) ( not ( = ?auto_596850 ?auto_596859 ) ) ( not ( = ?auto_596850 ?auto_596860 ) ) ( not ( = ?auto_596850 ?auto_596861 ) ) ( not ( = ?auto_596850 ?auto_596862 ) ) ( not ( = ?auto_596851 ?auto_596852 ) ) ( not ( = ?auto_596851 ?auto_596853 ) ) ( not ( = ?auto_596851 ?auto_596854 ) ) ( not ( = ?auto_596851 ?auto_596855 ) ) ( not ( = ?auto_596851 ?auto_596856 ) ) ( not ( = ?auto_596851 ?auto_596857 ) ) ( not ( = ?auto_596851 ?auto_596858 ) ) ( not ( = ?auto_596851 ?auto_596859 ) ) ( not ( = ?auto_596851 ?auto_596860 ) ) ( not ( = ?auto_596851 ?auto_596861 ) ) ( not ( = ?auto_596851 ?auto_596862 ) ) ( not ( = ?auto_596852 ?auto_596853 ) ) ( not ( = ?auto_596852 ?auto_596854 ) ) ( not ( = ?auto_596852 ?auto_596855 ) ) ( not ( = ?auto_596852 ?auto_596856 ) ) ( not ( = ?auto_596852 ?auto_596857 ) ) ( not ( = ?auto_596852 ?auto_596858 ) ) ( not ( = ?auto_596852 ?auto_596859 ) ) ( not ( = ?auto_596852 ?auto_596860 ) ) ( not ( = ?auto_596852 ?auto_596861 ) ) ( not ( = ?auto_596852 ?auto_596862 ) ) ( not ( = ?auto_596853 ?auto_596854 ) ) ( not ( = ?auto_596853 ?auto_596855 ) ) ( not ( = ?auto_596853 ?auto_596856 ) ) ( not ( = ?auto_596853 ?auto_596857 ) ) ( not ( = ?auto_596853 ?auto_596858 ) ) ( not ( = ?auto_596853 ?auto_596859 ) ) ( not ( = ?auto_596853 ?auto_596860 ) ) ( not ( = ?auto_596853 ?auto_596861 ) ) ( not ( = ?auto_596853 ?auto_596862 ) ) ( not ( = ?auto_596854 ?auto_596855 ) ) ( not ( = ?auto_596854 ?auto_596856 ) ) ( not ( = ?auto_596854 ?auto_596857 ) ) ( not ( = ?auto_596854 ?auto_596858 ) ) ( not ( = ?auto_596854 ?auto_596859 ) ) ( not ( = ?auto_596854 ?auto_596860 ) ) ( not ( = ?auto_596854 ?auto_596861 ) ) ( not ( = ?auto_596854 ?auto_596862 ) ) ( not ( = ?auto_596855 ?auto_596856 ) ) ( not ( = ?auto_596855 ?auto_596857 ) ) ( not ( = ?auto_596855 ?auto_596858 ) ) ( not ( = ?auto_596855 ?auto_596859 ) ) ( not ( = ?auto_596855 ?auto_596860 ) ) ( not ( = ?auto_596855 ?auto_596861 ) ) ( not ( = ?auto_596855 ?auto_596862 ) ) ( not ( = ?auto_596856 ?auto_596857 ) ) ( not ( = ?auto_596856 ?auto_596858 ) ) ( not ( = ?auto_596856 ?auto_596859 ) ) ( not ( = ?auto_596856 ?auto_596860 ) ) ( not ( = ?auto_596856 ?auto_596861 ) ) ( not ( = ?auto_596856 ?auto_596862 ) ) ( not ( = ?auto_596857 ?auto_596858 ) ) ( not ( = ?auto_596857 ?auto_596859 ) ) ( not ( = ?auto_596857 ?auto_596860 ) ) ( not ( = ?auto_596857 ?auto_596861 ) ) ( not ( = ?auto_596857 ?auto_596862 ) ) ( not ( = ?auto_596858 ?auto_596859 ) ) ( not ( = ?auto_596858 ?auto_596860 ) ) ( not ( = ?auto_596858 ?auto_596861 ) ) ( not ( = ?auto_596858 ?auto_596862 ) ) ( not ( = ?auto_596859 ?auto_596860 ) ) ( not ( = ?auto_596859 ?auto_596861 ) ) ( not ( = ?auto_596859 ?auto_596862 ) ) ( not ( = ?auto_596860 ?auto_596861 ) ) ( not ( = ?auto_596860 ?auto_596862 ) ) ( not ( = ?auto_596861 ?auto_596862 ) ) ( ON ?auto_596861 ?auto_596862 ) ( CLEAR ?auto_596859 ) ( ON ?auto_596860 ?auto_596861 ) ( CLEAR ?auto_596860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_596846 ?auto_596847 ?auto_596848 ?auto_596849 ?auto_596850 ?auto_596851 ?auto_596852 ?auto_596853 ?auto_596854 ?auto_596855 ?auto_596856 ?auto_596857 ?auto_596858 ?auto_596859 ?auto_596860 )
      ( MAKE-17PILE ?auto_596846 ?auto_596847 ?auto_596848 ?auto_596849 ?auto_596850 ?auto_596851 ?auto_596852 ?auto_596853 ?auto_596854 ?auto_596855 ?auto_596856 ?auto_596857 ?auto_596858 ?auto_596859 ?auto_596860 ?auto_596861 ?auto_596862 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596880 - BLOCK
      ?auto_596881 - BLOCK
      ?auto_596882 - BLOCK
      ?auto_596883 - BLOCK
      ?auto_596884 - BLOCK
      ?auto_596885 - BLOCK
      ?auto_596886 - BLOCK
      ?auto_596887 - BLOCK
      ?auto_596888 - BLOCK
      ?auto_596889 - BLOCK
      ?auto_596890 - BLOCK
      ?auto_596891 - BLOCK
      ?auto_596892 - BLOCK
      ?auto_596893 - BLOCK
      ?auto_596894 - BLOCK
      ?auto_596895 - BLOCK
      ?auto_596896 - BLOCK
    )
    :vars
    (
      ?auto_596897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596896 ?auto_596897 ) ( ON-TABLE ?auto_596880 ) ( ON ?auto_596881 ?auto_596880 ) ( ON ?auto_596882 ?auto_596881 ) ( ON ?auto_596883 ?auto_596882 ) ( ON ?auto_596884 ?auto_596883 ) ( ON ?auto_596885 ?auto_596884 ) ( ON ?auto_596886 ?auto_596885 ) ( ON ?auto_596887 ?auto_596886 ) ( ON ?auto_596888 ?auto_596887 ) ( ON ?auto_596889 ?auto_596888 ) ( ON ?auto_596890 ?auto_596889 ) ( ON ?auto_596891 ?auto_596890 ) ( ON ?auto_596892 ?auto_596891 ) ( not ( = ?auto_596880 ?auto_596881 ) ) ( not ( = ?auto_596880 ?auto_596882 ) ) ( not ( = ?auto_596880 ?auto_596883 ) ) ( not ( = ?auto_596880 ?auto_596884 ) ) ( not ( = ?auto_596880 ?auto_596885 ) ) ( not ( = ?auto_596880 ?auto_596886 ) ) ( not ( = ?auto_596880 ?auto_596887 ) ) ( not ( = ?auto_596880 ?auto_596888 ) ) ( not ( = ?auto_596880 ?auto_596889 ) ) ( not ( = ?auto_596880 ?auto_596890 ) ) ( not ( = ?auto_596880 ?auto_596891 ) ) ( not ( = ?auto_596880 ?auto_596892 ) ) ( not ( = ?auto_596880 ?auto_596893 ) ) ( not ( = ?auto_596880 ?auto_596894 ) ) ( not ( = ?auto_596880 ?auto_596895 ) ) ( not ( = ?auto_596880 ?auto_596896 ) ) ( not ( = ?auto_596880 ?auto_596897 ) ) ( not ( = ?auto_596881 ?auto_596882 ) ) ( not ( = ?auto_596881 ?auto_596883 ) ) ( not ( = ?auto_596881 ?auto_596884 ) ) ( not ( = ?auto_596881 ?auto_596885 ) ) ( not ( = ?auto_596881 ?auto_596886 ) ) ( not ( = ?auto_596881 ?auto_596887 ) ) ( not ( = ?auto_596881 ?auto_596888 ) ) ( not ( = ?auto_596881 ?auto_596889 ) ) ( not ( = ?auto_596881 ?auto_596890 ) ) ( not ( = ?auto_596881 ?auto_596891 ) ) ( not ( = ?auto_596881 ?auto_596892 ) ) ( not ( = ?auto_596881 ?auto_596893 ) ) ( not ( = ?auto_596881 ?auto_596894 ) ) ( not ( = ?auto_596881 ?auto_596895 ) ) ( not ( = ?auto_596881 ?auto_596896 ) ) ( not ( = ?auto_596881 ?auto_596897 ) ) ( not ( = ?auto_596882 ?auto_596883 ) ) ( not ( = ?auto_596882 ?auto_596884 ) ) ( not ( = ?auto_596882 ?auto_596885 ) ) ( not ( = ?auto_596882 ?auto_596886 ) ) ( not ( = ?auto_596882 ?auto_596887 ) ) ( not ( = ?auto_596882 ?auto_596888 ) ) ( not ( = ?auto_596882 ?auto_596889 ) ) ( not ( = ?auto_596882 ?auto_596890 ) ) ( not ( = ?auto_596882 ?auto_596891 ) ) ( not ( = ?auto_596882 ?auto_596892 ) ) ( not ( = ?auto_596882 ?auto_596893 ) ) ( not ( = ?auto_596882 ?auto_596894 ) ) ( not ( = ?auto_596882 ?auto_596895 ) ) ( not ( = ?auto_596882 ?auto_596896 ) ) ( not ( = ?auto_596882 ?auto_596897 ) ) ( not ( = ?auto_596883 ?auto_596884 ) ) ( not ( = ?auto_596883 ?auto_596885 ) ) ( not ( = ?auto_596883 ?auto_596886 ) ) ( not ( = ?auto_596883 ?auto_596887 ) ) ( not ( = ?auto_596883 ?auto_596888 ) ) ( not ( = ?auto_596883 ?auto_596889 ) ) ( not ( = ?auto_596883 ?auto_596890 ) ) ( not ( = ?auto_596883 ?auto_596891 ) ) ( not ( = ?auto_596883 ?auto_596892 ) ) ( not ( = ?auto_596883 ?auto_596893 ) ) ( not ( = ?auto_596883 ?auto_596894 ) ) ( not ( = ?auto_596883 ?auto_596895 ) ) ( not ( = ?auto_596883 ?auto_596896 ) ) ( not ( = ?auto_596883 ?auto_596897 ) ) ( not ( = ?auto_596884 ?auto_596885 ) ) ( not ( = ?auto_596884 ?auto_596886 ) ) ( not ( = ?auto_596884 ?auto_596887 ) ) ( not ( = ?auto_596884 ?auto_596888 ) ) ( not ( = ?auto_596884 ?auto_596889 ) ) ( not ( = ?auto_596884 ?auto_596890 ) ) ( not ( = ?auto_596884 ?auto_596891 ) ) ( not ( = ?auto_596884 ?auto_596892 ) ) ( not ( = ?auto_596884 ?auto_596893 ) ) ( not ( = ?auto_596884 ?auto_596894 ) ) ( not ( = ?auto_596884 ?auto_596895 ) ) ( not ( = ?auto_596884 ?auto_596896 ) ) ( not ( = ?auto_596884 ?auto_596897 ) ) ( not ( = ?auto_596885 ?auto_596886 ) ) ( not ( = ?auto_596885 ?auto_596887 ) ) ( not ( = ?auto_596885 ?auto_596888 ) ) ( not ( = ?auto_596885 ?auto_596889 ) ) ( not ( = ?auto_596885 ?auto_596890 ) ) ( not ( = ?auto_596885 ?auto_596891 ) ) ( not ( = ?auto_596885 ?auto_596892 ) ) ( not ( = ?auto_596885 ?auto_596893 ) ) ( not ( = ?auto_596885 ?auto_596894 ) ) ( not ( = ?auto_596885 ?auto_596895 ) ) ( not ( = ?auto_596885 ?auto_596896 ) ) ( not ( = ?auto_596885 ?auto_596897 ) ) ( not ( = ?auto_596886 ?auto_596887 ) ) ( not ( = ?auto_596886 ?auto_596888 ) ) ( not ( = ?auto_596886 ?auto_596889 ) ) ( not ( = ?auto_596886 ?auto_596890 ) ) ( not ( = ?auto_596886 ?auto_596891 ) ) ( not ( = ?auto_596886 ?auto_596892 ) ) ( not ( = ?auto_596886 ?auto_596893 ) ) ( not ( = ?auto_596886 ?auto_596894 ) ) ( not ( = ?auto_596886 ?auto_596895 ) ) ( not ( = ?auto_596886 ?auto_596896 ) ) ( not ( = ?auto_596886 ?auto_596897 ) ) ( not ( = ?auto_596887 ?auto_596888 ) ) ( not ( = ?auto_596887 ?auto_596889 ) ) ( not ( = ?auto_596887 ?auto_596890 ) ) ( not ( = ?auto_596887 ?auto_596891 ) ) ( not ( = ?auto_596887 ?auto_596892 ) ) ( not ( = ?auto_596887 ?auto_596893 ) ) ( not ( = ?auto_596887 ?auto_596894 ) ) ( not ( = ?auto_596887 ?auto_596895 ) ) ( not ( = ?auto_596887 ?auto_596896 ) ) ( not ( = ?auto_596887 ?auto_596897 ) ) ( not ( = ?auto_596888 ?auto_596889 ) ) ( not ( = ?auto_596888 ?auto_596890 ) ) ( not ( = ?auto_596888 ?auto_596891 ) ) ( not ( = ?auto_596888 ?auto_596892 ) ) ( not ( = ?auto_596888 ?auto_596893 ) ) ( not ( = ?auto_596888 ?auto_596894 ) ) ( not ( = ?auto_596888 ?auto_596895 ) ) ( not ( = ?auto_596888 ?auto_596896 ) ) ( not ( = ?auto_596888 ?auto_596897 ) ) ( not ( = ?auto_596889 ?auto_596890 ) ) ( not ( = ?auto_596889 ?auto_596891 ) ) ( not ( = ?auto_596889 ?auto_596892 ) ) ( not ( = ?auto_596889 ?auto_596893 ) ) ( not ( = ?auto_596889 ?auto_596894 ) ) ( not ( = ?auto_596889 ?auto_596895 ) ) ( not ( = ?auto_596889 ?auto_596896 ) ) ( not ( = ?auto_596889 ?auto_596897 ) ) ( not ( = ?auto_596890 ?auto_596891 ) ) ( not ( = ?auto_596890 ?auto_596892 ) ) ( not ( = ?auto_596890 ?auto_596893 ) ) ( not ( = ?auto_596890 ?auto_596894 ) ) ( not ( = ?auto_596890 ?auto_596895 ) ) ( not ( = ?auto_596890 ?auto_596896 ) ) ( not ( = ?auto_596890 ?auto_596897 ) ) ( not ( = ?auto_596891 ?auto_596892 ) ) ( not ( = ?auto_596891 ?auto_596893 ) ) ( not ( = ?auto_596891 ?auto_596894 ) ) ( not ( = ?auto_596891 ?auto_596895 ) ) ( not ( = ?auto_596891 ?auto_596896 ) ) ( not ( = ?auto_596891 ?auto_596897 ) ) ( not ( = ?auto_596892 ?auto_596893 ) ) ( not ( = ?auto_596892 ?auto_596894 ) ) ( not ( = ?auto_596892 ?auto_596895 ) ) ( not ( = ?auto_596892 ?auto_596896 ) ) ( not ( = ?auto_596892 ?auto_596897 ) ) ( not ( = ?auto_596893 ?auto_596894 ) ) ( not ( = ?auto_596893 ?auto_596895 ) ) ( not ( = ?auto_596893 ?auto_596896 ) ) ( not ( = ?auto_596893 ?auto_596897 ) ) ( not ( = ?auto_596894 ?auto_596895 ) ) ( not ( = ?auto_596894 ?auto_596896 ) ) ( not ( = ?auto_596894 ?auto_596897 ) ) ( not ( = ?auto_596895 ?auto_596896 ) ) ( not ( = ?auto_596895 ?auto_596897 ) ) ( not ( = ?auto_596896 ?auto_596897 ) ) ( ON ?auto_596895 ?auto_596896 ) ( ON ?auto_596894 ?auto_596895 ) ( CLEAR ?auto_596892 ) ( ON ?auto_596893 ?auto_596894 ) ( CLEAR ?auto_596893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_596880 ?auto_596881 ?auto_596882 ?auto_596883 ?auto_596884 ?auto_596885 ?auto_596886 ?auto_596887 ?auto_596888 ?auto_596889 ?auto_596890 ?auto_596891 ?auto_596892 ?auto_596893 )
      ( MAKE-17PILE ?auto_596880 ?auto_596881 ?auto_596882 ?auto_596883 ?auto_596884 ?auto_596885 ?auto_596886 ?auto_596887 ?auto_596888 ?auto_596889 ?auto_596890 ?auto_596891 ?auto_596892 ?auto_596893 ?auto_596894 ?auto_596895 ?auto_596896 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596915 - BLOCK
      ?auto_596916 - BLOCK
      ?auto_596917 - BLOCK
      ?auto_596918 - BLOCK
      ?auto_596919 - BLOCK
      ?auto_596920 - BLOCK
      ?auto_596921 - BLOCK
      ?auto_596922 - BLOCK
      ?auto_596923 - BLOCK
      ?auto_596924 - BLOCK
      ?auto_596925 - BLOCK
      ?auto_596926 - BLOCK
      ?auto_596927 - BLOCK
      ?auto_596928 - BLOCK
      ?auto_596929 - BLOCK
      ?auto_596930 - BLOCK
      ?auto_596931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_596931 ) ( ON-TABLE ?auto_596915 ) ( ON ?auto_596916 ?auto_596915 ) ( ON ?auto_596917 ?auto_596916 ) ( ON ?auto_596918 ?auto_596917 ) ( ON ?auto_596919 ?auto_596918 ) ( ON ?auto_596920 ?auto_596919 ) ( ON ?auto_596921 ?auto_596920 ) ( ON ?auto_596922 ?auto_596921 ) ( ON ?auto_596923 ?auto_596922 ) ( ON ?auto_596924 ?auto_596923 ) ( ON ?auto_596925 ?auto_596924 ) ( ON ?auto_596926 ?auto_596925 ) ( ON ?auto_596927 ?auto_596926 ) ( not ( = ?auto_596915 ?auto_596916 ) ) ( not ( = ?auto_596915 ?auto_596917 ) ) ( not ( = ?auto_596915 ?auto_596918 ) ) ( not ( = ?auto_596915 ?auto_596919 ) ) ( not ( = ?auto_596915 ?auto_596920 ) ) ( not ( = ?auto_596915 ?auto_596921 ) ) ( not ( = ?auto_596915 ?auto_596922 ) ) ( not ( = ?auto_596915 ?auto_596923 ) ) ( not ( = ?auto_596915 ?auto_596924 ) ) ( not ( = ?auto_596915 ?auto_596925 ) ) ( not ( = ?auto_596915 ?auto_596926 ) ) ( not ( = ?auto_596915 ?auto_596927 ) ) ( not ( = ?auto_596915 ?auto_596928 ) ) ( not ( = ?auto_596915 ?auto_596929 ) ) ( not ( = ?auto_596915 ?auto_596930 ) ) ( not ( = ?auto_596915 ?auto_596931 ) ) ( not ( = ?auto_596916 ?auto_596917 ) ) ( not ( = ?auto_596916 ?auto_596918 ) ) ( not ( = ?auto_596916 ?auto_596919 ) ) ( not ( = ?auto_596916 ?auto_596920 ) ) ( not ( = ?auto_596916 ?auto_596921 ) ) ( not ( = ?auto_596916 ?auto_596922 ) ) ( not ( = ?auto_596916 ?auto_596923 ) ) ( not ( = ?auto_596916 ?auto_596924 ) ) ( not ( = ?auto_596916 ?auto_596925 ) ) ( not ( = ?auto_596916 ?auto_596926 ) ) ( not ( = ?auto_596916 ?auto_596927 ) ) ( not ( = ?auto_596916 ?auto_596928 ) ) ( not ( = ?auto_596916 ?auto_596929 ) ) ( not ( = ?auto_596916 ?auto_596930 ) ) ( not ( = ?auto_596916 ?auto_596931 ) ) ( not ( = ?auto_596917 ?auto_596918 ) ) ( not ( = ?auto_596917 ?auto_596919 ) ) ( not ( = ?auto_596917 ?auto_596920 ) ) ( not ( = ?auto_596917 ?auto_596921 ) ) ( not ( = ?auto_596917 ?auto_596922 ) ) ( not ( = ?auto_596917 ?auto_596923 ) ) ( not ( = ?auto_596917 ?auto_596924 ) ) ( not ( = ?auto_596917 ?auto_596925 ) ) ( not ( = ?auto_596917 ?auto_596926 ) ) ( not ( = ?auto_596917 ?auto_596927 ) ) ( not ( = ?auto_596917 ?auto_596928 ) ) ( not ( = ?auto_596917 ?auto_596929 ) ) ( not ( = ?auto_596917 ?auto_596930 ) ) ( not ( = ?auto_596917 ?auto_596931 ) ) ( not ( = ?auto_596918 ?auto_596919 ) ) ( not ( = ?auto_596918 ?auto_596920 ) ) ( not ( = ?auto_596918 ?auto_596921 ) ) ( not ( = ?auto_596918 ?auto_596922 ) ) ( not ( = ?auto_596918 ?auto_596923 ) ) ( not ( = ?auto_596918 ?auto_596924 ) ) ( not ( = ?auto_596918 ?auto_596925 ) ) ( not ( = ?auto_596918 ?auto_596926 ) ) ( not ( = ?auto_596918 ?auto_596927 ) ) ( not ( = ?auto_596918 ?auto_596928 ) ) ( not ( = ?auto_596918 ?auto_596929 ) ) ( not ( = ?auto_596918 ?auto_596930 ) ) ( not ( = ?auto_596918 ?auto_596931 ) ) ( not ( = ?auto_596919 ?auto_596920 ) ) ( not ( = ?auto_596919 ?auto_596921 ) ) ( not ( = ?auto_596919 ?auto_596922 ) ) ( not ( = ?auto_596919 ?auto_596923 ) ) ( not ( = ?auto_596919 ?auto_596924 ) ) ( not ( = ?auto_596919 ?auto_596925 ) ) ( not ( = ?auto_596919 ?auto_596926 ) ) ( not ( = ?auto_596919 ?auto_596927 ) ) ( not ( = ?auto_596919 ?auto_596928 ) ) ( not ( = ?auto_596919 ?auto_596929 ) ) ( not ( = ?auto_596919 ?auto_596930 ) ) ( not ( = ?auto_596919 ?auto_596931 ) ) ( not ( = ?auto_596920 ?auto_596921 ) ) ( not ( = ?auto_596920 ?auto_596922 ) ) ( not ( = ?auto_596920 ?auto_596923 ) ) ( not ( = ?auto_596920 ?auto_596924 ) ) ( not ( = ?auto_596920 ?auto_596925 ) ) ( not ( = ?auto_596920 ?auto_596926 ) ) ( not ( = ?auto_596920 ?auto_596927 ) ) ( not ( = ?auto_596920 ?auto_596928 ) ) ( not ( = ?auto_596920 ?auto_596929 ) ) ( not ( = ?auto_596920 ?auto_596930 ) ) ( not ( = ?auto_596920 ?auto_596931 ) ) ( not ( = ?auto_596921 ?auto_596922 ) ) ( not ( = ?auto_596921 ?auto_596923 ) ) ( not ( = ?auto_596921 ?auto_596924 ) ) ( not ( = ?auto_596921 ?auto_596925 ) ) ( not ( = ?auto_596921 ?auto_596926 ) ) ( not ( = ?auto_596921 ?auto_596927 ) ) ( not ( = ?auto_596921 ?auto_596928 ) ) ( not ( = ?auto_596921 ?auto_596929 ) ) ( not ( = ?auto_596921 ?auto_596930 ) ) ( not ( = ?auto_596921 ?auto_596931 ) ) ( not ( = ?auto_596922 ?auto_596923 ) ) ( not ( = ?auto_596922 ?auto_596924 ) ) ( not ( = ?auto_596922 ?auto_596925 ) ) ( not ( = ?auto_596922 ?auto_596926 ) ) ( not ( = ?auto_596922 ?auto_596927 ) ) ( not ( = ?auto_596922 ?auto_596928 ) ) ( not ( = ?auto_596922 ?auto_596929 ) ) ( not ( = ?auto_596922 ?auto_596930 ) ) ( not ( = ?auto_596922 ?auto_596931 ) ) ( not ( = ?auto_596923 ?auto_596924 ) ) ( not ( = ?auto_596923 ?auto_596925 ) ) ( not ( = ?auto_596923 ?auto_596926 ) ) ( not ( = ?auto_596923 ?auto_596927 ) ) ( not ( = ?auto_596923 ?auto_596928 ) ) ( not ( = ?auto_596923 ?auto_596929 ) ) ( not ( = ?auto_596923 ?auto_596930 ) ) ( not ( = ?auto_596923 ?auto_596931 ) ) ( not ( = ?auto_596924 ?auto_596925 ) ) ( not ( = ?auto_596924 ?auto_596926 ) ) ( not ( = ?auto_596924 ?auto_596927 ) ) ( not ( = ?auto_596924 ?auto_596928 ) ) ( not ( = ?auto_596924 ?auto_596929 ) ) ( not ( = ?auto_596924 ?auto_596930 ) ) ( not ( = ?auto_596924 ?auto_596931 ) ) ( not ( = ?auto_596925 ?auto_596926 ) ) ( not ( = ?auto_596925 ?auto_596927 ) ) ( not ( = ?auto_596925 ?auto_596928 ) ) ( not ( = ?auto_596925 ?auto_596929 ) ) ( not ( = ?auto_596925 ?auto_596930 ) ) ( not ( = ?auto_596925 ?auto_596931 ) ) ( not ( = ?auto_596926 ?auto_596927 ) ) ( not ( = ?auto_596926 ?auto_596928 ) ) ( not ( = ?auto_596926 ?auto_596929 ) ) ( not ( = ?auto_596926 ?auto_596930 ) ) ( not ( = ?auto_596926 ?auto_596931 ) ) ( not ( = ?auto_596927 ?auto_596928 ) ) ( not ( = ?auto_596927 ?auto_596929 ) ) ( not ( = ?auto_596927 ?auto_596930 ) ) ( not ( = ?auto_596927 ?auto_596931 ) ) ( not ( = ?auto_596928 ?auto_596929 ) ) ( not ( = ?auto_596928 ?auto_596930 ) ) ( not ( = ?auto_596928 ?auto_596931 ) ) ( not ( = ?auto_596929 ?auto_596930 ) ) ( not ( = ?auto_596929 ?auto_596931 ) ) ( not ( = ?auto_596930 ?auto_596931 ) ) ( ON ?auto_596930 ?auto_596931 ) ( ON ?auto_596929 ?auto_596930 ) ( CLEAR ?auto_596927 ) ( ON ?auto_596928 ?auto_596929 ) ( CLEAR ?auto_596928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_596915 ?auto_596916 ?auto_596917 ?auto_596918 ?auto_596919 ?auto_596920 ?auto_596921 ?auto_596922 ?auto_596923 ?auto_596924 ?auto_596925 ?auto_596926 ?auto_596927 ?auto_596928 )
      ( MAKE-17PILE ?auto_596915 ?auto_596916 ?auto_596917 ?auto_596918 ?auto_596919 ?auto_596920 ?auto_596921 ?auto_596922 ?auto_596923 ?auto_596924 ?auto_596925 ?auto_596926 ?auto_596927 ?auto_596928 ?auto_596929 ?auto_596930 ?auto_596931 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596949 - BLOCK
      ?auto_596950 - BLOCK
      ?auto_596951 - BLOCK
      ?auto_596952 - BLOCK
      ?auto_596953 - BLOCK
      ?auto_596954 - BLOCK
      ?auto_596955 - BLOCK
      ?auto_596956 - BLOCK
      ?auto_596957 - BLOCK
      ?auto_596958 - BLOCK
      ?auto_596959 - BLOCK
      ?auto_596960 - BLOCK
      ?auto_596961 - BLOCK
      ?auto_596962 - BLOCK
      ?auto_596963 - BLOCK
      ?auto_596964 - BLOCK
      ?auto_596965 - BLOCK
    )
    :vars
    (
      ?auto_596966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_596965 ?auto_596966 ) ( ON-TABLE ?auto_596949 ) ( ON ?auto_596950 ?auto_596949 ) ( ON ?auto_596951 ?auto_596950 ) ( ON ?auto_596952 ?auto_596951 ) ( ON ?auto_596953 ?auto_596952 ) ( ON ?auto_596954 ?auto_596953 ) ( ON ?auto_596955 ?auto_596954 ) ( ON ?auto_596956 ?auto_596955 ) ( ON ?auto_596957 ?auto_596956 ) ( ON ?auto_596958 ?auto_596957 ) ( ON ?auto_596959 ?auto_596958 ) ( ON ?auto_596960 ?auto_596959 ) ( not ( = ?auto_596949 ?auto_596950 ) ) ( not ( = ?auto_596949 ?auto_596951 ) ) ( not ( = ?auto_596949 ?auto_596952 ) ) ( not ( = ?auto_596949 ?auto_596953 ) ) ( not ( = ?auto_596949 ?auto_596954 ) ) ( not ( = ?auto_596949 ?auto_596955 ) ) ( not ( = ?auto_596949 ?auto_596956 ) ) ( not ( = ?auto_596949 ?auto_596957 ) ) ( not ( = ?auto_596949 ?auto_596958 ) ) ( not ( = ?auto_596949 ?auto_596959 ) ) ( not ( = ?auto_596949 ?auto_596960 ) ) ( not ( = ?auto_596949 ?auto_596961 ) ) ( not ( = ?auto_596949 ?auto_596962 ) ) ( not ( = ?auto_596949 ?auto_596963 ) ) ( not ( = ?auto_596949 ?auto_596964 ) ) ( not ( = ?auto_596949 ?auto_596965 ) ) ( not ( = ?auto_596949 ?auto_596966 ) ) ( not ( = ?auto_596950 ?auto_596951 ) ) ( not ( = ?auto_596950 ?auto_596952 ) ) ( not ( = ?auto_596950 ?auto_596953 ) ) ( not ( = ?auto_596950 ?auto_596954 ) ) ( not ( = ?auto_596950 ?auto_596955 ) ) ( not ( = ?auto_596950 ?auto_596956 ) ) ( not ( = ?auto_596950 ?auto_596957 ) ) ( not ( = ?auto_596950 ?auto_596958 ) ) ( not ( = ?auto_596950 ?auto_596959 ) ) ( not ( = ?auto_596950 ?auto_596960 ) ) ( not ( = ?auto_596950 ?auto_596961 ) ) ( not ( = ?auto_596950 ?auto_596962 ) ) ( not ( = ?auto_596950 ?auto_596963 ) ) ( not ( = ?auto_596950 ?auto_596964 ) ) ( not ( = ?auto_596950 ?auto_596965 ) ) ( not ( = ?auto_596950 ?auto_596966 ) ) ( not ( = ?auto_596951 ?auto_596952 ) ) ( not ( = ?auto_596951 ?auto_596953 ) ) ( not ( = ?auto_596951 ?auto_596954 ) ) ( not ( = ?auto_596951 ?auto_596955 ) ) ( not ( = ?auto_596951 ?auto_596956 ) ) ( not ( = ?auto_596951 ?auto_596957 ) ) ( not ( = ?auto_596951 ?auto_596958 ) ) ( not ( = ?auto_596951 ?auto_596959 ) ) ( not ( = ?auto_596951 ?auto_596960 ) ) ( not ( = ?auto_596951 ?auto_596961 ) ) ( not ( = ?auto_596951 ?auto_596962 ) ) ( not ( = ?auto_596951 ?auto_596963 ) ) ( not ( = ?auto_596951 ?auto_596964 ) ) ( not ( = ?auto_596951 ?auto_596965 ) ) ( not ( = ?auto_596951 ?auto_596966 ) ) ( not ( = ?auto_596952 ?auto_596953 ) ) ( not ( = ?auto_596952 ?auto_596954 ) ) ( not ( = ?auto_596952 ?auto_596955 ) ) ( not ( = ?auto_596952 ?auto_596956 ) ) ( not ( = ?auto_596952 ?auto_596957 ) ) ( not ( = ?auto_596952 ?auto_596958 ) ) ( not ( = ?auto_596952 ?auto_596959 ) ) ( not ( = ?auto_596952 ?auto_596960 ) ) ( not ( = ?auto_596952 ?auto_596961 ) ) ( not ( = ?auto_596952 ?auto_596962 ) ) ( not ( = ?auto_596952 ?auto_596963 ) ) ( not ( = ?auto_596952 ?auto_596964 ) ) ( not ( = ?auto_596952 ?auto_596965 ) ) ( not ( = ?auto_596952 ?auto_596966 ) ) ( not ( = ?auto_596953 ?auto_596954 ) ) ( not ( = ?auto_596953 ?auto_596955 ) ) ( not ( = ?auto_596953 ?auto_596956 ) ) ( not ( = ?auto_596953 ?auto_596957 ) ) ( not ( = ?auto_596953 ?auto_596958 ) ) ( not ( = ?auto_596953 ?auto_596959 ) ) ( not ( = ?auto_596953 ?auto_596960 ) ) ( not ( = ?auto_596953 ?auto_596961 ) ) ( not ( = ?auto_596953 ?auto_596962 ) ) ( not ( = ?auto_596953 ?auto_596963 ) ) ( not ( = ?auto_596953 ?auto_596964 ) ) ( not ( = ?auto_596953 ?auto_596965 ) ) ( not ( = ?auto_596953 ?auto_596966 ) ) ( not ( = ?auto_596954 ?auto_596955 ) ) ( not ( = ?auto_596954 ?auto_596956 ) ) ( not ( = ?auto_596954 ?auto_596957 ) ) ( not ( = ?auto_596954 ?auto_596958 ) ) ( not ( = ?auto_596954 ?auto_596959 ) ) ( not ( = ?auto_596954 ?auto_596960 ) ) ( not ( = ?auto_596954 ?auto_596961 ) ) ( not ( = ?auto_596954 ?auto_596962 ) ) ( not ( = ?auto_596954 ?auto_596963 ) ) ( not ( = ?auto_596954 ?auto_596964 ) ) ( not ( = ?auto_596954 ?auto_596965 ) ) ( not ( = ?auto_596954 ?auto_596966 ) ) ( not ( = ?auto_596955 ?auto_596956 ) ) ( not ( = ?auto_596955 ?auto_596957 ) ) ( not ( = ?auto_596955 ?auto_596958 ) ) ( not ( = ?auto_596955 ?auto_596959 ) ) ( not ( = ?auto_596955 ?auto_596960 ) ) ( not ( = ?auto_596955 ?auto_596961 ) ) ( not ( = ?auto_596955 ?auto_596962 ) ) ( not ( = ?auto_596955 ?auto_596963 ) ) ( not ( = ?auto_596955 ?auto_596964 ) ) ( not ( = ?auto_596955 ?auto_596965 ) ) ( not ( = ?auto_596955 ?auto_596966 ) ) ( not ( = ?auto_596956 ?auto_596957 ) ) ( not ( = ?auto_596956 ?auto_596958 ) ) ( not ( = ?auto_596956 ?auto_596959 ) ) ( not ( = ?auto_596956 ?auto_596960 ) ) ( not ( = ?auto_596956 ?auto_596961 ) ) ( not ( = ?auto_596956 ?auto_596962 ) ) ( not ( = ?auto_596956 ?auto_596963 ) ) ( not ( = ?auto_596956 ?auto_596964 ) ) ( not ( = ?auto_596956 ?auto_596965 ) ) ( not ( = ?auto_596956 ?auto_596966 ) ) ( not ( = ?auto_596957 ?auto_596958 ) ) ( not ( = ?auto_596957 ?auto_596959 ) ) ( not ( = ?auto_596957 ?auto_596960 ) ) ( not ( = ?auto_596957 ?auto_596961 ) ) ( not ( = ?auto_596957 ?auto_596962 ) ) ( not ( = ?auto_596957 ?auto_596963 ) ) ( not ( = ?auto_596957 ?auto_596964 ) ) ( not ( = ?auto_596957 ?auto_596965 ) ) ( not ( = ?auto_596957 ?auto_596966 ) ) ( not ( = ?auto_596958 ?auto_596959 ) ) ( not ( = ?auto_596958 ?auto_596960 ) ) ( not ( = ?auto_596958 ?auto_596961 ) ) ( not ( = ?auto_596958 ?auto_596962 ) ) ( not ( = ?auto_596958 ?auto_596963 ) ) ( not ( = ?auto_596958 ?auto_596964 ) ) ( not ( = ?auto_596958 ?auto_596965 ) ) ( not ( = ?auto_596958 ?auto_596966 ) ) ( not ( = ?auto_596959 ?auto_596960 ) ) ( not ( = ?auto_596959 ?auto_596961 ) ) ( not ( = ?auto_596959 ?auto_596962 ) ) ( not ( = ?auto_596959 ?auto_596963 ) ) ( not ( = ?auto_596959 ?auto_596964 ) ) ( not ( = ?auto_596959 ?auto_596965 ) ) ( not ( = ?auto_596959 ?auto_596966 ) ) ( not ( = ?auto_596960 ?auto_596961 ) ) ( not ( = ?auto_596960 ?auto_596962 ) ) ( not ( = ?auto_596960 ?auto_596963 ) ) ( not ( = ?auto_596960 ?auto_596964 ) ) ( not ( = ?auto_596960 ?auto_596965 ) ) ( not ( = ?auto_596960 ?auto_596966 ) ) ( not ( = ?auto_596961 ?auto_596962 ) ) ( not ( = ?auto_596961 ?auto_596963 ) ) ( not ( = ?auto_596961 ?auto_596964 ) ) ( not ( = ?auto_596961 ?auto_596965 ) ) ( not ( = ?auto_596961 ?auto_596966 ) ) ( not ( = ?auto_596962 ?auto_596963 ) ) ( not ( = ?auto_596962 ?auto_596964 ) ) ( not ( = ?auto_596962 ?auto_596965 ) ) ( not ( = ?auto_596962 ?auto_596966 ) ) ( not ( = ?auto_596963 ?auto_596964 ) ) ( not ( = ?auto_596963 ?auto_596965 ) ) ( not ( = ?auto_596963 ?auto_596966 ) ) ( not ( = ?auto_596964 ?auto_596965 ) ) ( not ( = ?auto_596964 ?auto_596966 ) ) ( not ( = ?auto_596965 ?auto_596966 ) ) ( ON ?auto_596964 ?auto_596965 ) ( ON ?auto_596963 ?auto_596964 ) ( ON ?auto_596962 ?auto_596963 ) ( CLEAR ?auto_596960 ) ( ON ?auto_596961 ?auto_596962 ) ( CLEAR ?auto_596961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_596949 ?auto_596950 ?auto_596951 ?auto_596952 ?auto_596953 ?auto_596954 ?auto_596955 ?auto_596956 ?auto_596957 ?auto_596958 ?auto_596959 ?auto_596960 ?auto_596961 )
      ( MAKE-17PILE ?auto_596949 ?auto_596950 ?auto_596951 ?auto_596952 ?auto_596953 ?auto_596954 ?auto_596955 ?auto_596956 ?auto_596957 ?auto_596958 ?auto_596959 ?auto_596960 ?auto_596961 ?auto_596962 ?auto_596963 ?auto_596964 ?auto_596965 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_596984 - BLOCK
      ?auto_596985 - BLOCK
      ?auto_596986 - BLOCK
      ?auto_596987 - BLOCK
      ?auto_596988 - BLOCK
      ?auto_596989 - BLOCK
      ?auto_596990 - BLOCK
      ?auto_596991 - BLOCK
      ?auto_596992 - BLOCK
      ?auto_596993 - BLOCK
      ?auto_596994 - BLOCK
      ?auto_596995 - BLOCK
      ?auto_596996 - BLOCK
      ?auto_596997 - BLOCK
      ?auto_596998 - BLOCK
      ?auto_596999 - BLOCK
      ?auto_597000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597000 ) ( ON-TABLE ?auto_596984 ) ( ON ?auto_596985 ?auto_596984 ) ( ON ?auto_596986 ?auto_596985 ) ( ON ?auto_596987 ?auto_596986 ) ( ON ?auto_596988 ?auto_596987 ) ( ON ?auto_596989 ?auto_596988 ) ( ON ?auto_596990 ?auto_596989 ) ( ON ?auto_596991 ?auto_596990 ) ( ON ?auto_596992 ?auto_596991 ) ( ON ?auto_596993 ?auto_596992 ) ( ON ?auto_596994 ?auto_596993 ) ( ON ?auto_596995 ?auto_596994 ) ( not ( = ?auto_596984 ?auto_596985 ) ) ( not ( = ?auto_596984 ?auto_596986 ) ) ( not ( = ?auto_596984 ?auto_596987 ) ) ( not ( = ?auto_596984 ?auto_596988 ) ) ( not ( = ?auto_596984 ?auto_596989 ) ) ( not ( = ?auto_596984 ?auto_596990 ) ) ( not ( = ?auto_596984 ?auto_596991 ) ) ( not ( = ?auto_596984 ?auto_596992 ) ) ( not ( = ?auto_596984 ?auto_596993 ) ) ( not ( = ?auto_596984 ?auto_596994 ) ) ( not ( = ?auto_596984 ?auto_596995 ) ) ( not ( = ?auto_596984 ?auto_596996 ) ) ( not ( = ?auto_596984 ?auto_596997 ) ) ( not ( = ?auto_596984 ?auto_596998 ) ) ( not ( = ?auto_596984 ?auto_596999 ) ) ( not ( = ?auto_596984 ?auto_597000 ) ) ( not ( = ?auto_596985 ?auto_596986 ) ) ( not ( = ?auto_596985 ?auto_596987 ) ) ( not ( = ?auto_596985 ?auto_596988 ) ) ( not ( = ?auto_596985 ?auto_596989 ) ) ( not ( = ?auto_596985 ?auto_596990 ) ) ( not ( = ?auto_596985 ?auto_596991 ) ) ( not ( = ?auto_596985 ?auto_596992 ) ) ( not ( = ?auto_596985 ?auto_596993 ) ) ( not ( = ?auto_596985 ?auto_596994 ) ) ( not ( = ?auto_596985 ?auto_596995 ) ) ( not ( = ?auto_596985 ?auto_596996 ) ) ( not ( = ?auto_596985 ?auto_596997 ) ) ( not ( = ?auto_596985 ?auto_596998 ) ) ( not ( = ?auto_596985 ?auto_596999 ) ) ( not ( = ?auto_596985 ?auto_597000 ) ) ( not ( = ?auto_596986 ?auto_596987 ) ) ( not ( = ?auto_596986 ?auto_596988 ) ) ( not ( = ?auto_596986 ?auto_596989 ) ) ( not ( = ?auto_596986 ?auto_596990 ) ) ( not ( = ?auto_596986 ?auto_596991 ) ) ( not ( = ?auto_596986 ?auto_596992 ) ) ( not ( = ?auto_596986 ?auto_596993 ) ) ( not ( = ?auto_596986 ?auto_596994 ) ) ( not ( = ?auto_596986 ?auto_596995 ) ) ( not ( = ?auto_596986 ?auto_596996 ) ) ( not ( = ?auto_596986 ?auto_596997 ) ) ( not ( = ?auto_596986 ?auto_596998 ) ) ( not ( = ?auto_596986 ?auto_596999 ) ) ( not ( = ?auto_596986 ?auto_597000 ) ) ( not ( = ?auto_596987 ?auto_596988 ) ) ( not ( = ?auto_596987 ?auto_596989 ) ) ( not ( = ?auto_596987 ?auto_596990 ) ) ( not ( = ?auto_596987 ?auto_596991 ) ) ( not ( = ?auto_596987 ?auto_596992 ) ) ( not ( = ?auto_596987 ?auto_596993 ) ) ( not ( = ?auto_596987 ?auto_596994 ) ) ( not ( = ?auto_596987 ?auto_596995 ) ) ( not ( = ?auto_596987 ?auto_596996 ) ) ( not ( = ?auto_596987 ?auto_596997 ) ) ( not ( = ?auto_596987 ?auto_596998 ) ) ( not ( = ?auto_596987 ?auto_596999 ) ) ( not ( = ?auto_596987 ?auto_597000 ) ) ( not ( = ?auto_596988 ?auto_596989 ) ) ( not ( = ?auto_596988 ?auto_596990 ) ) ( not ( = ?auto_596988 ?auto_596991 ) ) ( not ( = ?auto_596988 ?auto_596992 ) ) ( not ( = ?auto_596988 ?auto_596993 ) ) ( not ( = ?auto_596988 ?auto_596994 ) ) ( not ( = ?auto_596988 ?auto_596995 ) ) ( not ( = ?auto_596988 ?auto_596996 ) ) ( not ( = ?auto_596988 ?auto_596997 ) ) ( not ( = ?auto_596988 ?auto_596998 ) ) ( not ( = ?auto_596988 ?auto_596999 ) ) ( not ( = ?auto_596988 ?auto_597000 ) ) ( not ( = ?auto_596989 ?auto_596990 ) ) ( not ( = ?auto_596989 ?auto_596991 ) ) ( not ( = ?auto_596989 ?auto_596992 ) ) ( not ( = ?auto_596989 ?auto_596993 ) ) ( not ( = ?auto_596989 ?auto_596994 ) ) ( not ( = ?auto_596989 ?auto_596995 ) ) ( not ( = ?auto_596989 ?auto_596996 ) ) ( not ( = ?auto_596989 ?auto_596997 ) ) ( not ( = ?auto_596989 ?auto_596998 ) ) ( not ( = ?auto_596989 ?auto_596999 ) ) ( not ( = ?auto_596989 ?auto_597000 ) ) ( not ( = ?auto_596990 ?auto_596991 ) ) ( not ( = ?auto_596990 ?auto_596992 ) ) ( not ( = ?auto_596990 ?auto_596993 ) ) ( not ( = ?auto_596990 ?auto_596994 ) ) ( not ( = ?auto_596990 ?auto_596995 ) ) ( not ( = ?auto_596990 ?auto_596996 ) ) ( not ( = ?auto_596990 ?auto_596997 ) ) ( not ( = ?auto_596990 ?auto_596998 ) ) ( not ( = ?auto_596990 ?auto_596999 ) ) ( not ( = ?auto_596990 ?auto_597000 ) ) ( not ( = ?auto_596991 ?auto_596992 ) ) ( not ( = ?auto_596991 ?auto_596993 ) ) ( not ( = ?auto_596991 ?auto_596994 ) ) ( not ( = ?auto_596991 ?auto_596995 ) ) ( not ( = ?auto_596991 ?auto_596996 ) ) ( not ( = ?auto_596991 ?auto_596997 ) ) ( not ( = ?auto_596991 ?auto_596998 ) ) ( not ( = ?auto_596991 ?auto_596999 ) ) ( not ( = ?auto_596991 ?auto_597000 ) ) ( not ( = ?auto_596992 ?auto_596993 ) ) ( not ( = ?auto_596992 ?auto_596994 ) ) ( not ( = ?auto_596992 ?auto_596995 ) ) ( not ( = ?auto_596992 ?auto_596996 ) ) ( not ( = ?auto_596992 ?auto_596997 ) ) ( not ( = ?auto_596992 ?auto_596998 ) ) ( not ( = ?auto_596992 ?auto_596999 ) ) ( not ( = ?auto_596992 ?auto_597000 ) ) ( not ( = ?auto_596993 ?auto_596994 ) ) ( not ( = ?auto_596993 ?auto_596995 ) ) ( not ( = ?auto_596993 ?auto_596996 ) ) ( not ( = ?auto_596993 ?auto_596997 ) ) ( not ( = ?auto_596993 ?auto_596998 ) ) ( not ( = ?auto_596993 ?auto_596999 ) ) ( not ( = ?auto_596993 ?auto_597000 ) ) ( not ( = ?auto_596994 ?auto_596995 ) ) ( not ( = ?auto_596994 ?auto_596996 ) ) ( not ( = ?auto_596994 ?auto_596997 ) ) ( not ( = ?auto_596994 ?auto_596998 ) ) ( not ( = ?auto_596994 ?auto_596999 ) ) ( not ( = ?auto_596994 ?auto_597000 ) ) ( not ( = ?auto_596995 ?auto_596996 ) ) ( not ( = ?auto_596995 ?auto_596997 ) ) ( not ( = ?auto_596995 ?auto_596998 ) ) ( not ( = ?auto_596995 ?auto_596999 ) ) ( not ( = ?auto_596995 ?auto_597000 ) ) ( not ( = ?auto_596996 ?auto_596997 ) ) ( not ( = ?auto_596996 ?auto_596998 ) ) ( not ( = ?auto_596996 ?auto_596999 ) ) ( not ( = ?auto_596996 ?auto_597000 ) ) ( not ( = ?auto_596997 ?auto_596998 ) ) ( not ( = ?auto_596997 ?auto_596999 ) ) ( not ( = ?auto_596997 ?auto_597000 ) ) ( not ( = ?auto_596998 ?auto_596999 ) ) ( not ( = ?auto_596998 ?auto_597000 ) ) ( not ( = ?auto_596999 ?auto_597000 ) ) ( ON ?auto_596999 ?auto_597000 ) ( ON ?auto_596998 ?auto_596999 ) ( ON ?auto_596997 ?auto_596998 ) ( CLEAR ?auto_596995 ) ( ON ?auto_596996 ?auto_596997 ) ( CLEAR ?auto_596996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_596984 ?auto_596985 ?auto_596986 ?auto_596987 ?auto_596988 ?auto_596989 ?auto_596990 ?auto_596991 ?auto_596992 ?auto_596993 ?auto_596994 ?auto_596995 ?auto_596996 )
      ( MAKE-17PILE ?auto_596984 ?auto_596985 ?auto_596986 ?auto_596987 ?auto_596988 ?auto_596989 ?auto_596990 ?auto_596991 ?auto_596992 ?auto_596993 ?auto_596994 ?auto_596995 ?auto_596996 ?auto_596997 ?auto_596998 ?auto_596999 ?auto_597000 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597018 - BLOCK
      ?auto_597019 - BLOCK
      ?auto_597020 - BLOCK
      ?auto_597021 - BLOCK
      ?auto_597022 - BLOCK
      ?auto_597023 - BLOCK
      ?auto_597024 - BLOCK
      ?auto_597025 - BLOCK
      ?auto_597026 - BLOCK
      ?auto_597027 - BLOCK
      ?auto_597028 - BLOCK
      ?auto_597029 - BLOCK
      ?auto_597030 - BLOCK
      ?auto_597031 - BLOCK
      ?auto_597032 - BLOCK
      ?auto_597033 - BLOCK
      ?auto_597034 - BLOCK
    )
    :vars
    (
      ?auto_597035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597034 ?auto_597035 ) ( ON-TABLE ?auto_597018 ) ( ON ?auto_597019 ?auto_597018 ) ( ON ?auto_597020 ?auto_597019 ) ( ON ?auto_597021 ?auto_597020 ) ( ON ?auto_597022 ?auto_597021 ) ( ON ?auto_597023 ?auto_597022 ) ( ON ?auto_597024 ?auto_597023 ) ( ON ?auto_597025 ?auto_597024 ) ( ON ?auto_597026 ?auto_597025 ) ( ON ?auto_597027 ?auto_597026 ) ( ON ?auto_597028 ?auto_597027 ) ( not ( = ?auto_597018 ?auto_597019 ) ) ( not ( = ?auto_597018 ?auto_597020 ) ) ( not ( = ?auto_597018 ?auto_597021 ) ) ( not ( = ?auto_597018 ?auto_597022 ) ) ( not ( = ?auto_597018 ?auto_597023 ) ) ( not ( = ?auto_597018 ?auto_597024 ) ) ( not ( = ?auto_597018 ?auto_597025 ) ) ( not ( = ?auto_597018 ?auto_597026 ) ) ( not ( = ?auto_597018 ?auto_597027 ) ) ( not ( = ?auto_597018 ?auto_597028 ) ) ( not ( = ?auto_597018 ?auto_597029 ) ) ( not ( = ?auto_597018 ?auto_597030 ) ) ( not ( = ?auto_597018 ?auto_597031 ) ) ( not ( = ?auto_597018 ?auto_597032 ) ) ( not ( = ?auto_597018 ?auto_597033 ) ) ( not ( = ?auto_597018 ?auto_597034 ) ) ( not ( = ?auto_597018 ?auto_597035 ) ) ( not ( = ?auto_597019 ?auto_597020 ) ) ( not ( = ?auto_597019 ?auto_597021 ) ) ( not ( = ?auto_597019 ?auto_597022 ) ) ( not ( = ?auto_597019 ?auto_597023 ) ) ( not ( = ?auto_597019 ?auto_597024 ) ) ( not ( = ?auto_597019 ?auto_597025 ) ) ( not ( = ?auto_597019 ?auto_597026 ) ) ( not ( = ?auto_597019 ?auto_597027 ) ) ( not ( = ?auto_597019 ?auto_597028 ) ) ( not ( = ?auto_597019 ?auto_597029 ) ) ( not ( = ?auto_597019 ?auto_597030 ) ) ( not ( = ?auto_597019 ?auto_597031 ) ) ( not ( = ?auto_597019 ?auto_597032 ) ) ( not ( = ?auto_597019 ?auto_597033 ) ) ( not ( = ?auto_597019 ?auto_597034 ) ) ( not ( = ?auto_597019 ?auto_597035 ) ) ( not ( = ?auto_597020 ?auto_597021 ) ) ( not ( = ?auto_597020 ?auto_597022 ) ) ( not ( = ?auto_597020 ?auto_597023 ) ) ( not ( = ?auto_597020 ?auto_597024 ) ) ( not ( = ?auto_597020 ?auto_597025 ) ) ( not ( = ?auto_597020 ?auto_597026 ) ) ( not ( = ?auto_597020 ?auto_597027 ) ) ( not ( = ?auto_597020 ?auto_597028 ) ) ( not ( = ?auto_597020 ?auto_597029 ) ) ( not ( = ?auto_597020 ?auto_597030 ) ) ( not ( = ?auto_597020 ?auto_597031 ) ) ( not ( = ?auto_597020 ?auto_597032 ) ) ( not ( = ?auto_597020 ?auto_597033 ) ) ( not ( = ?auto_597020 ?auto_597034 ) ) ( not ( = ?auto_597020 ?auto_597035 ) ) ( not ( = ?auto_597021 ?auto_597022 ) ) ( not ( = ?auto_597021 ?auto_597023 ) ) ( not ( = ?auto_597021 ?auto_597024 ) ) ( not ( = ?auto_597021 ?auto_597025 ) ) ( not ( = ?auto_597021 ?auto_597026 ) ) ( not ( = ?auto_597021 ?auto_597027 ) ) ( not ( = ?auto_597021 ?auto_597028 ) ) ( not ( = ?auto_597021 ?auto_597029 ) ) ( not ( = ?auto_597021 ?auto_597030 ) ) ( not ( = ?auto_597021 ?auto_597031 ) ) ( not ( = ?auto_597021 ?auto_597032 ) ) ( not ( = ?auto_597021 ?auto_597033 ) ) ( not ( = ?auto_597021 ?auto_597034 ) ) ( not ( = ?auto_597021 ?auto_597035 ) ) ( not ( = ?auto_597022 ?auto_597023 ) ) ( not ( = ?auto_597022 ?auto_597024 ) ) ( not ( = ?auto_597022 ?auto_597025 ) ) ( not ( = ?auto_597022 ?auto_597026 ) ) ( not ( = ?auto_597022 ?auto_597027 ) ) ( not ( = ?auto_597022 ?auto_597028 ) ) ( not ( = ?auto_597022 ?auto_597029 ) ) ( not ( = ?auto_597022 ?auto_597030 ) ) ( not ( = ?auto_597022 ?auto_597031 ) ) ( not ( = ?auto_597022 ?auto_597032 ) ) ( not ( = ?auto_597022 ?auto_597033 ) ) ( not ( = ?auto_597022 ?auto_597034 ) ) ( not ( = ?auto_597022 ?auto_597035 ) ) ( not ( = ?auto_597023 ?auto_597024 ) ) ( not ( = ?auto_597023 ?auto_597025 ) ) ( not ( = ?auto_597023 ?auto_597026 ) ) ( not ( = ?auto_597023 ?auto_597027 ) ) ( not ( = ?auto_597023 ?auto_597028 ) ) ( not ( = ?auto_597023 ?auto_597029 ) ) ( not ( = ?auto_597023 ?auto_597030 ) ) ( not ( = ?auto_597023 ?auto_597031 ) ) ( not ( = ?auto_597023 ?auto_597032 ) ) ( not ( = ?auto_597023 ?auto_597033 ) ) ( not ( = ?auto_597023 ?auto_597034 ) ) ( not ( = ?auto_597023 ?auto_597035 ) ) ( not ( = ?auto_597024 ?auto_597025 ) ) ( not ( = ?auto_597024 ?auto_597026 ) ) ( not ( = ?auto_597024 ?auto_597027 ) ) ( not ( = ?auto_597024 ?auto_597028 ) ) ( not ( = ?auto_597024 ?auto_597029 ) ) ( not ( = ?auto_597024 ?auto_597030 ) ) ( not ( = ?auto_597024 ?auto_597031 ) ) ( not ( = ?auto_597024 ?auto_597032 ) ) ( not ( = ?auto_597024 ?auto_597033 ) ) ( not ( = ?auto_597024 ?auto_597034 ) ) ( not ( = ?auto_597024 ?auto_597035 ) ) ( not ( = ?auto_597025 ?auto_597026 ) ) ( not ( = ?auto_597025 ?auto_597027 ) ) ( not ( = ?auto_597025 ?auto_597028 ) ) ( not ( = ?auto_597025 ?auto_597029 ) ) ( not ( = ?auto_597025 ?auto_597030 ) ) ( not ( = ?auto_597025 ?auto_597031 ) ) ( not ( = ?auto_597025 ?auto_597032 ) ) ( not ( = ?auto_597025 ?auto_597033 ) ) ( not ( = ?auto_597025 ?auto_597034 ) ) ( not ( = ?auto_597025 ?auto_597035 ) ) ( not ( = ?auto_597026 ?auto_597027 ) ) ( not ( = ?auto_597026 ?auto_597028 ) ) ( not ( = ?auto_597026 ?auto_597029 ) ) ( not ( = ?auto_597026 ?auto_597030 ) ) ( not ( = ?auto_597026 ?auto_597031 ) ) ( not ( = ?auto_597026 ?auto_597032 ) ) ( not ( = ?auto_597026 ?auto_597033 ) ) ( not ( = ?auto_597026 ?auto_597034 ) ) ( not ( = ?auto_597026 ?auto_597035 ) ) ( not ( = ?auto_597027 ?auto_597028 ) ) ( not ( = ?auto_597027 ?auto_597029 ) ) ( not ( = ?auto_597027 ?auto_597030 ) ) ( not ( = ?auto_597027 ?auto_597031 ) ) ( not ( = ?auto_597027 ?auto_597032 ) ) ( not ( = ?auto_597027 ?auto_597033 ) ) ( not ( = ?auto_597027 ?auto_597034 ) ) ( not ( = ?auto_597027 ?auto_597035 ) ) ( not ( = ?auto_597028 ?auto_597029 ) ) ( not ( = ?auto_597028 ?auto_597030 ) ) ( not ( = ?auto_597028 ?auto_597031 ) ) ( not ( = ?auto_597028 ?auto_597032 ) ) ( not ( = ?auto_597028 ?auto_597033 ) ) ( not ( = ?auto_597028 ?auto_597034 ) ) ( not ( = ?auto_597028 ?auto_597035 ) ) ( not ( = ?auto_597029 ?auto_597030 ) ) ( not ( = ?auto_597029 ?auto_597031 ) ) ( not ( = ?auto_597029 ?auto_597032 ) ) ( not ( = ?auto_597029 ?auto_597033 ) ) ( not ( = ?auto_597029 ?auto_597034 ) ) ( not ( = ?auto_597029 ?auto_597035 ) ) ( not ( = ?auto_597030 ?auto_597031 ) ) ( not ( = ?auto_597030 ?auto_597032 ) ) ( not ( = ?auto_597030 ?auto_597033 ) ) ( not ( = ?auto_597030 ?auto_597034 ) ) ( not ( = ?auto_597030 ?auto_597035 ) ) ( not ( = ?auto_597031 ?auto_597032 ) ) ( not ( = ?auto_597031 ?auto_597033 ) ) ( not ( = ?auto_597031 ?auto_597034 ) ) ( not ( = ?auto_597031 ?auto_597035 ) ) ( not ( = ?auto_597032 ?auto_597033 ) ) ( not ( = ?auto_597032 ?auto_597034 ) ) ( not ( = ?auto_597032 ?auto_597035 ) ) ( not ( = ?auto_597033 ?auto_597034 ) ) ( not ( = ?auto_597033 ?auto_597035 ) ) ( not ( = ?auto_597034 ?auto_597035 ) ) ( ON ?auto_597033 ?auto_597034 ) ( ON ?auto_597032 ?auto_597033 ) ( ON ?auto_597031 ?auto_597032 ) ( ON ?auto_597030 ?auto_597031 ) ( CLEAR ?auto_597028 ) ( ON ?auto_597029 ?auto_597030 ) ( CLEAR ?auto_597029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_597018 ?auto_597019 ?auto_597020 ?auto_597021 ?auto_597022 ?auto_597023 ?auto_597024 ?auto_597025 ?auto_597026 ?auto_597027 ?auto_597028 ?auto_597029 )
      ( MAKE-17PILE ?auto_597018 ?auto_597019 ?auto_597020 ?auto_597021 ?auto_597022 ?auto_597023 ?auto_597024 ?auto_597025 ?auto_597026 ?auto_597027 ?auto_597028 ?auto_597029 ?auto_597030 ?auto_597031 ?auto_597032 ?auto_597033 ?auto_597034 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597053 - BLOCK
      ?auto_597054 - BLOCK
      ?auto_597055 - BLOCK
      ?auto_597056 - BLOCK
      ?auto_597057 - BLOCK
      ?auto_597058 - BLOCK
      ?auto_597059 - BLOCK
      ?auto_597060 - BLOCK
      ?auto_597061 - BLOCK
      ?auto_597062 - BLOCK
      ?auto_597063 - BLOCK
      ?auto_597064 - BLOCK
      ?auto_597065 - BLOCK
      ?auto_597066 - BLOCK
      ?auto_597067 - BLOCK
      ?auto_597068 - BLOCK
      ?auto_597069 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597069 ) ( ON-TABLE ?auto_597053 ) ( ON ?auto_597054 ?auto_597053 ) ( ON ?auto_597055 ?auto_597054 ) ( ON ?auto_597056 ?auto_597055 ) ( ON ?auto_597057 ?auto_597056 ) ( ON ?auto_597058 ?auto_597057 ) ( ON ?auto_597059 ?auto_597058 ) ( ON ?auto_597060 ?auto_597059 ) ( ON ?auto_597061 ?auto_597060 ) ( ON ?auto_597062 ?auto_597061 ) ( ON ?auto_597063 ?auto_597062 ) ( not ( = ?auto_597053 ?auto_597054 ) ) ( not ( = ?auto_597053 ?auto_597055 ) ) ( not ( = ?auto_597053 ?auto_597056 ) ) ( not ( = ?auto_597053 ?auto_597057 ) ) ( not ( = ?auto_597053 ?auto_597058 ) ) ( not ( = ?auto_597053 ?auto_597059 ) ) ( not ( = ?auto_597053 ?auto_597060 ) ) ( not ( = ?auto_597053 ?auto_597061 ) ) ( not ( = ?auto_597053 ?auto_597062 ) ) ( not ( = ?auto_597053 ?auto_597063 ) ) ( not ( = ?auto_597053 ?auto_597064 ) ) ( not ( = ?auto_597053 ?auto_597065 ) ) ( not ( = ?auto_597053 ?auto_597066 ) ) ( not ( = ?auto_597053 ?auto_597067 ) ) ( not ( = ?auto_597053 ?auto_597068 ) ) ( not ( = ?auto_597053 ?auto_597069 ) ) ( not ( = ?auto_597054 ?auto_597055 ) ) ( not ( = ?auto_597054 ?auto_597056 ) ) ( not ( = ?auto_597054 ?auto_597057 ) ) ( not ( = ?auto_597054 ?auto_597058 ) ) ( not ( = ?auto_597054 ?auto_597059 ) ) ( not ( = ?auto_597054 ?auto_597060 ) ) ( not ( = ?auto_597054 ?auto_597061 ) ) ( not ( = ?auto_597054 ?auto_597062 ) ) ( not ( = ?auto_597054 ?auto_597063 ) ) ( not ( = ?auto_597054 ?auto_597064 ) ) ( not ( = ?auto_597054 ?auto_597065 ) ) ( not ( = ?auto_597054 ?auto_597066 ) ) ( not ( = ?auto_597054 ?auto_597067 ) ) ( not ( = ?auto_597054 ?auto_597068 ) ) ( not ( = ?auto_597054 ?auto_597069 ) ) ( not ( = ?auto_597055 ?auto_597056 ) ) ( not ( = ?auto_597055 ?auto_597057 ) ) ( not ( = ?auto_597055 ?auto_597058 ) ) ( not ( = ?auto_597055 ?auto_597059 ) ) ( not ( = ?auto_597055 ?auto_597060 ) ) ( not ( = ?auto_597055 ?auto_597061 ) ) ( not ( = ?auto_597055 ?auto_597062 ) ) ( not ( = ?auto_597055 ?auto_597063 ) ) ( not ( = ?auto_597055 ?auto_597064 ) ) ( not ( = ?auto_597055 ?auto_597065 ) ) ( not ( = ?auto_597055 ?auto_597066 ) ) ( not ( = ?auto_597055 ?auto_597067 ) ) ( not ( = ?auto_597055 ?auto_597068 ) ) ( not ( = ?auto_597055 ?auto_597069 ) ) ( not ( = ?auto_597056 ?auto_597057 ) ) ( not ( = ?auto_597056 ?auto_597058 ) ) ( not ( = ?auto_597056 ?auto_597059 ) ) ( not ( = ?auto_597056 ?auto_597060 ) ) ( not ( = ?auto_597056 ?auto_597061 ) ) ( not ( = ?auto_597056 ?auto_597062 ) ) ( not ( = ?auto_597056 ?auto_597063 ) ) ( not ( = ?auto_597056 ?auto_597064 ) ) ( not ( = ?auto_597056 ?auto_597065 ) ) ( not ( = ?auto_597056 ?auto_597066 ) ) ( not ( = ?auto_597056 ?auto_597067 ) ) ( not ( = ?auto_597056 ?auto_597068 ) ) ( not ( = ?auto_597056 ?auto_597069 ) ) ( not ( = ?auto_597057 ?auto_597058 ) ) ( not ( = ?auto_597057 ?auto_597059 ) ) ( not ( = ?auto_597057 ?auto_597060 ) ) ( not ( = ?auto_597057 ?auto_597061 ) ) ( not ( = ?auto_597057 ?auto_597062 ) ) ( not ( = ?auto_597057 ?auto_597063 ) ) ( not ( = ?auto_597057 ?auto_597064 ) ) ( not ( = ?auto_597057 ?auto_597065 ) ) ( not ( = ?auto_597057 ?auto_597066 ) ) ( not ( = ?auto_597057 ?auto_597067 ) ) ( not ( = ?auto_597057 ?auto_597068 ) ) ( not ( = ?auto_597057 ?auto_597069 ) ) ( not ( = ?auto_597058 ?auto_597059 ) ) ( not ( = ?auto_597058 ?auto_597060 ) ) ( not ( = ?auto_597058 ?auto_597061 ) ) ( not ( = ?auto_597058 ?auto_597062 ) ) ( not ( = ?auto_597058 ?auto_597063 ) ) ( not ( = ?auto_597058 ?auto_597064 ) ) ( not ( = ?auto_597058 ?auto_597065 ) ) ( not ( = ?auto_597058 ?auto_597066 ) ) ( not ( = ?auto_597058 ?auto_597067 ) ) ( not ( = ?auto_597058 ?auto_597068 ) ) ( not ( = ?auto_597058 ?auto_597069 ) ) ( not ( = ?auto_597059 ?auto_597060 ) ) ( not ( = ?auto_597059 ?auto_597061 ) ) ( not ( = ?auto_597059 ?auto_597062 ) ) ( not ( = ?auto_597059 ?auto_597063 ) ) ( not ( = ?auto_597059 ?auto_597064 ) ) ( not ( = ?auto_597059 ?auto_597065 ) ) ( not ( = ?auto_597059 ?auto_597066 ) ) ( not ( = ?auto_597059 ?auto_597067 ) ) ( not ( = ?auto_597059 ?auto_597068 ) ) ( not ( = ?auto_597059 ?auto_597069 ) ) ( not ( = ?auto_597060 ?auto_597061 ) ) ( not ( = ?auto_597060 ?auto_597062 ) ) ( not ( = ?auto_597060 ?auto_597063 ) ) ( not ( = ?auto_597060 ?auto_597064 ) ) ( not ( = ?auto_597060 ?auto_597065 ) ) ( not ( = ?auto_597060 ?auto_597066 ) ) ( not ( = ?auto_597060 ?auto_597067 ) ) ( not ( = ?auto_597060 ?auto_597068 ) ) ( not ( = ?auto_597060 ?auto_597069 ) ) ( not ( = ?auto_597061 ?auto_597062 ) ) ( not ( = ?auto_597061 ?auto_597063 ) ) ( not ( = ?auto_597061 ?auto_597064 ) ) ( not ( = ?auto_597061 ?auto_597065 ) ) ( not ( = ?auto_597061 ?auto_597066 ) ) ( not ( = ?auto_597061 ?auto_597067 ) ) ( not ( = ?auto_597061 ?auto_597068 ) ) ( not ( = ?auto_597061 ?auto_597069 ) ) ( not ( = ?auto_597062 ?auto_597063 ) ) ( not ( = ?auto_597062 ?auto_597064 ) ) ( not ( = ?auto_597062 ?auto_597065 ) ) ( not ( = ?auto_597062 ?auto_597066 ) ) ( not ( = ?auto_597062 ?auto_597067 ) ) ( not ( = ?auto_597062 ?auto_597068 ) ) ( not ( = ?auto_597062 ?auto_597069 ) ) ( not ( = ?auto_597063 ?auto_597064 ) ) ( not ( = ?auto_597063 ?auto_597065 ) ) ( not ( = ?auto_597063 ?auto_597066 ) ) ( not ( = ?auto_597063 ?auto_597067 ) ) ( not ( = ?auto_597063 ?auto_597068 ) ) ( not ( = ?auto_597063 ?auto_597069 ) ) ( not ( = ?auto_597064 ?auto_597065 ) ) ( not ( = ?auto_597064 ?auto_597066 ) ) ( not ( = ?auto_597064 ?auto_597067 ) ) ( not ( = ?auto_597064 ?auto_597068 ) ) ( not ( = ?auto_597064 ?auto_597069 ) ) ( not ( = ?auto_597065 ?auto_597066 ) ) ( not ( = ?auto_597065 ?auto_597067 ) ) ( not ( = ?auto_597065 ?auto_597068 ) ) ( not ( = ?auto_597065 ?auto_597069 ) ) ( not ( = ?auto_597066 ?auto_597067 ) ) ( not ( = ?auto_597066 ?auto_597068 ) ) ( not ( = ?auto_597066 ?auto_597069 ) ) ( not ( = ?auto_597067 ?auto_597068 ) ) ( not ( = ?auto_597067 ?auto_597069 ) ) ( not ( = ?auto_597068 ?auto_597069 ) ) ( ON ?auto_597068 ?auto_597069 ) ( ON ?auto_597067 ?auto_597068 ) ( ON ?auto_597066 ?auto_597067 ) ( ON ?auto_597065 ?auto_597066 ) ( CLEAR ?auto_597063 ) ( ON ?auto_597064 ?auto_597065 ) ( CLEAR ?auto_597064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_597053 ?auto_597054 ?auto_597055 ?auto_597056 ?auto_597057 ?auto_597058 ?auto_597059 ?auto_597060 ?auto_597061 ?auto_597062 ?auto_597063 ?auto_597064 )
      ( MAKE-17PILE ?auto_597053 ?auto_597054 ?auto_597055 ?auto_597056 ?auto_597057 ?auto_597058 ?auto_597059 ?auto_597060 ?auto_597061 ?auto_597062 ?auto_597063 ?auto_597064 ?auto_597065 ?auto_597066 ?auto_597067 ?auto_597068 ?auto_597069 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597087 - BLOCK
      ?auto_597088 - BLOCK
      ?auto_597089 - BLOCK
      ?auto_597090 - BLOCK
      ?auto_597091 - BLOCK
      ?auto_597092 - BLOCK
      ?auto_597093 - BLOCK
      ?auto_597094 - BLOCK
      ?auto_597095 - BLOCK
      ?auto_597096 - BLOCK
      ?auto_597097 - BLOCK
      ?auto_597098 - BLOCK
      ?auto_597099 - BLOCK
      ?auto_597100 - BLOCK
      ?auto_597101 - BLOCK
      ?auto_597102 - BLOCK
      ?auto_597103 - BLOCK
    )
    :vars
    (
      ?auto_597104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597103 ?auto_597104 ) ( ON-TABLE ?auto_597087 ) ( ON ?auto_597088 ?auto_597087 ) ( ON ?auto_597089 ?auto_597088 ) ( ON ?auto_597090 ?auto_597089 ) ( ON ?auto_597091 ?auto_597090 ) ( ON ?auto_597092 ?auto_597091 ) ( ON ?auto_597093 ?auto_597092 ) ( ON ?auto_597094 ?auto_597093 ) ( ON ?auto_597095 ?auto_597094 ) ( ON ?auto_597096 ?auto_597095 ) ( not ( = ?auto_597087 ?auto_597088 ) ) ( not ( = ?auto_597087 ?auto_597089 ) ) ( not ( = ?auto_597087 ?auto_597090 ) ) ( not ( = ?auto_597087 ?auto_597091 ) ) ( not ( = ?auto_597087 ?auto_597092 ) ) ( not ( = ?auto_597087 ?auto_597093 ) ) ( not ( = ?auto_597087 ?auto_597094 ) ) ( not ( = ?auto_597087 ?auto_597095 ) ) ( not ( = ?auto_597087 ?auto_597096 ) ) ( not ( = ?auto_597087 ?auto_597097 ) ) ( not ( = ?auto_597087 ?auto_597098 ) ) ( not ( = ?auto_597087 ?auto_597099 ) ) ( not ( = ?auto_597087 ?auto_597100 ) ) ( not ( = ?auto_597087 ?auto_597101 ) ) ( not ( = ?auto_597087 ?auto_597102 ) ) ( not ( = ?auto_597087 ?auto_597103 ) ) ( not ( = ?auto_597087 ?auto_597104 ) ) ( not ( = ?auto_597088 ?auto_597089 ) ) ( not ( = ?auto_597088 ?auto_597090 ) ) ( not ( = ?auto_597088 ?auto_597091 ) ) ( not ( = ?auto_597088 ?auto_597092 ) ) ( not ( = ?auto_597088 ?auto_597093 ) ) ( not ( = ?auto_597088 ?auto_597094 ) ) ( not ( = ?auto_597088 ?auto_597095 ) ) ( not ( = ?auto_597088 ?auto_597096 ) ) ( not ( = ?auto_597088 ?auto_597097 ) ) ( not ( = ?auto_597088 ?auto_597098 ) ) ( not ( = ?auto_597088 ?auto_597099 ) ) ( not ( = ?auto_597088 ?auto_597100 ) ) ( not ( = ?auto_597088 ?auto_597101 ) ) ( not ( = ?auto_597088 ?auto_597102 ) ) ( not ( = ?auto_597088 ?auto_597103 ) ) ( not ( = ?auto_597088 ?auto_597104 ) ) ( not ( = ?auto_597089 ?auto_597090 ) ) ( not ( = ?auto_597089 ?auto_597091 ) ) ( not ( = ?auto_597089 ?auto_597092 ) ) ( not ( = ?auto_597089 ?auto_597093 ) ) ( not ( = ?auto_597089 ?auto_597094 ) ) ( not ( = ?auto_597089 ?auto_597095 ) ) ( not ( = ?auto_597089 ?auto_597096 ) ) ( not ( = ?auto_597089 ?auto_597097 ) ) ( not ( = ?auto_597089 ?auto_597098 ) ) ( not ( = ?auto_597089 ?auto_597099 ) ) ( not ( = ?auto_597089 ?auto_597100 ) ) ( not ( = ?auto_597089 ?auto_597101 ) ) ( not ( = ?auto_597089 ?auto_597102 ) ) ( not ( = ?auto_597089 ?auto_597103 ) ) ( not ( = ?auto_597089 ?auto_597104 ) ) ( not ( = ?auto_597090 ?auto_597091 ) ) ( not ( = ?auto_597090 ?auto_597092 ) ) ( not ( = ?auto_597090 ?auto_597093 ) ) ( not ( = ?auto_597090 ?auto_597094 ) ) ( not ( = ?auto_597090 ?auto_597095 ) ) ( not ( = ?auto_597090 ?auto_597096 ) ) ( not ( = ?auto_597090 ?auto_597097 ) ) ( not ( = ?auto_597090 ?auto_597098 ) ) ( not ( = ?auto_597090 ?auto_597099 ) ) ( not ( = ?auto_597090 ?auto_597100 ) ) ( not ( = ?auto_597090 ?auto_597101 ) ) ( not ( = ?auto_597090 ?auto_597102 ) ) ( not ( = ?auto_597090 ?auto_597103 ) ) ( not ( = ?auto_597090 ?auto_597104 ) ) ( not ( = ?auto_597091 ?auto_597092 ) ) ( not ( = ?auto_597091 ?auto_597093 ) ) ( not ( = ?auto_597091 ?auto_597094 ) ) ( not ( = ?auto_597091 ?auto_597095 ) ) ( not ( = ?auto_597091 ?auto_597096 ) ) ( not ( = ?auto_597091 ?auto_597097 ) ) ( not ( = ?auto_597091 ?auto_597098 ) ) ( not ( = ?auto_597091 ?auto_597099 ) ) ( not ( = ?auto_597091 ?auto_597100 ) ) ( not ( = ?auto_597091 ?auto_597101 ) ) ( not ( = ?auto_597091 ?auto_597102 ) ) ( not ( = ?auto_597091 ?auto_597103 ) ) ( not ( = ?auto_597091 ?auto_597104 ) ) ( not ( = ?auto_597092 ?auto_597093 ) ) ( not ( = ?auto_597092 ?auto_597094 ) ) ( not ( = ?auto_597092 ?auto_597095 ) ) ( not ( = ?auto_597092 ?auto_597096 ) ) ( not ( = ?auto_597092 ?auto_597097 ) ) ( not ( = ?auto_597092 ?auto_597098 ) ) ( not ( = ?auto_597092 ?auto_597099 ) ) ( not ( = ?auto_597092 ?auto_597100 ) ) ( not ( = ?auto_597092 ?auto_597101 ) ) ( not ( = ?auto_597092 ?auto_597102 ) ) ( not ( = ?auto_597092 ?auto_597103 ) ) ( not ( = ?auto_597092 ?auto_597104 ) ) ( not ( = ?auto_597093 ?auto_597094 ) ) ( not ( = ?auto_597093 ?auto_597095 ) ) ( not ( = ?auto_597093 ?auto_597096 ) ) ( not ( = ?auto_597093 ?auto_597097 ) ) ( not ( = ?auto_597093 ?auto_597098 ) ) ( not ( = ?auto_597093 ?auto_597099 ) ) ( not ( = ?auto_597093 ?auto_597100 ) ) ( not ( = ?auto_597093 ?auto_597101 ) ) ( not ( = ?auto_597093 ?auto_597102 ) ) ( not ( = ?auto_597093 ?auto_597103 ) ) ( not ( = ?auto_597093 ?auto_597104 ) ) ( not ( = ?auto_597094 ?auto_597095 ) ) ( not ( = ?auto_597094 ?auto_597096 ) ) ( not ( = ?auto_597094 ?auto_597097 ) ) ( not ( = ?auto_597094 ?auto_597098 ) ) ( not ( = ?auto_597094 ?auto_597099 ) ) ( not ( = ?auto_597094 ?auto_597100 ) ) ( not ( = ?auto_597094 ?auto_597101 ) ) ( not ( = ?auto_597094 ?auto_597102 ) ) ( not ( = ?auto_597094 ?auto_597103 ) ) ( not ( = ?auto_597094 ?auto_597104 ) ) ( not ( = ?auto_597095 ?auto_597096 ) ) ( not ( = ?auto_597095 ?auto_597097 ) ) ( not ( = ?auto_597095 ?auto_597098 ) ) ( not ( = ?auto_597095 ?auto_597099 ) ) ( not ( = ?auto_597095 ?auto_597100 ) ) ( not ( = ?auto_597095 ?auto_597101 ) ) ( not ( = ?auto_597095 ?auto_597102 ) ) ( not ( = ?auto_597095 ?auto_597103 ) ) ( not ( = ?auto_597095 ?auto_597104 ) ) ( not ( = ?auto_597096 ?auto_597097 ) ) ( not ( = ?auto_597096 ?auto_597098 ) ) ( not ( = ?auto_597096 ?auto_597099 ) ) ( not ( = ?auto_597096 ?auto_597100 ) ) ( not ( = ?auto_597096 ?auto_597101 ) ) ( not ( = ?auto_597096 ?auto_597102 ) ) ( not ( = ?auto_597096 ?auto_597103 ) ) ( not ( = ?auto_597096 ?auto_597104 ) ) ( not ( = ?auto_597097 ?auto_597098 ) ) ( not ( = ?auto_597097 ?auto_597099 ) ) ( not ( = ?auto_597097 ?auto_597100 ) ) ( not ( = ?auto_597097 ?auto_597101 ) ) ( not ( = ?auto_597097 ?auto_597102 ) ) ( not ( = ?auto_597097 ?auto_597103 ) ) ( not ( = ?auto_597097 ?auto_597104 ) ) ( not ( = ?auto_597098 ?auto_597099 ) ) ( not ( = ?auto_597098 ?auto_597100 ) ) ( not ( = ?auto_597098 ?auto_597101 ) ) ( not ( = ?auto_597098 ?auto_597102 ) ) ( not ( = ?auto_597098 ?auto_597103 ) ) ( not ( = ?auto_597098 ?auto_597104 ) ) ( not ( = ?auto_597099 ?auto_597100 ) ) ( not ( = ?auto_597099 ?auto_597101 ) ) ( not ( = ?auto_597099 ?auto_597102 ) ) ( not ( = ?auto_597099 ?auto_597103 ) ) ( not ( = ?auto_597099 ?auto_597104 ) ) ( not ( = ?auto_597100 ?auto_597101 ) ) ( not ( = ?auto_597100 ?auto_597102 ) ) ( not ( = ?auto_597100 ?auto_597103 ) ) ( not ( = ?auto_597100 ?auto_597104 ) ) ( not ( = ?auto_597101 ?auto_597102 ) ) ( not ( = ?auto_597101 ?auto_597103 ) ) ( not ( = ?auto_597101 ?auto_597104 ) ) ( not ( = ?auto_597102 ?auto_597103 ) ) ( not ( = ?auto_597102 ?auto_597104 ) ) ( not ( = ?auto_597103 ?auto_597104 ) ) ( ON ?auto_597102 ?auto_597103 ) ( ON ?auto_597101 ?auto_597102 ) ( ON ?auto_597100 ?auto_597101 ) ( ON ?auto_597099 ?auto_597100 ) ( ON ?auto_597098 ?auto_597099 ) ( CLEAR ?auto_597096 ) ( ON ?auto_597097 ?auto_597098 ) ( CLEAR ?auto_597097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_597087 ?auto_597088 ?auto_597089 ?auto_597090 ?auto_597091 ?auto_597092 ?auto_597093 ?auto_597094 ?auto_597095 ?auto_597096 ?auto_597097 )
      ( MAKE-17PILE ?auto_597087 ?auto_597088 ?auto_597089 ?auto_597090 ?auto_597091 ?auto_597092 ?auto_597093 ?auto_597094 ?auto_597095 ?auto_597096 ?auto_597097 ?auto_597098 ?auto_597099 ?auto_597100 ?auto_597101 ?auto_597102 ?auto_597103 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597122 - BLOCK
      ?auto_597123 - BLOCK
      ?auto_597124 - BLOCK
      ?auto_597125 - BLOCK
      ?auto_597126 - BLOCK
      ?auto_597127 - BLOCK
      ?auto_597128 - BLOCK
      ?auto_597129 - BLOCK
      ?auto_597130 - BLOCK
      ?auto_597131 - BLOCK
      ?auto_597132 - BLOCK
      ?auto_597133 - BLOCK
      ?auto_597134 - BLOCK
      ?auto_597135 - BLOCK
      ?auto_597136 - BLOCK
      ?auto_597137 - BLOCK
      ?auto_597138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597138 ) ( ON-TABLE ?auto_597122 ) ( ON ?auto_597123 ?auto_597122 ) ( ON ?auto_597124 ?auto_597123 ) ( ON ?auto_597125 ?auto_597124 ) ( ON ?auto_597126 ?auto_597125 ) ( ON ?auto_597127 ?auto_597126 ) ( ON ?auto_597128 ?auto_597127 ) ( ON ?auto_597129 ?auto_597128 ) ( ON ?auto_597130 ?auto_597129 ) ( ON ?auto_597131 ?auto_597130 ) ( not ( = ?auto_597122 ?auto_597123 ) ) ( not ( = ?auto_597122 ?auto_597124 ) ) ( not ( = ?auto_597122 ?auto_597125 ) ) ( not ( = ?auto_597122 ?auto_597126 ) ) ( not ( = ?auto_597122 ?auto_597127 ) ) ( not ( = ?auto_597122 ?auto_597128 ) ) ( not ( = ?auto_597122 ?auto_597129 ) ) ( not ( = ?auto_597122 ?auto_597130 ) ) ( not ( = ?auto_597122 ?auto_597131 ) ) ( not ( = ?auto_597122 ?auto_597132 ) ) ( not ( = ?auto_597122 ?auto_597133 ) ) ( not ( = ?auto_597122 ?auto_597134 ) ) ( not ( = ?auto_597122 ?auto_597135 ) ) ( not ( = ?auto_597122 ?auto_597136 ) ) ( not ( = ?auto_597122 ?auto_597137 ) ) ( not ( = ?auto_597122 ?auto_597138 ) ) ( not ( = ?auto_597123 ?auto_597124 ) ) ( not ( = ?auto_597123 ?auto_597125 ) ) ( not ( = ?auto_597123 ?auto_597126 ) ) ( not ( = ?auto_597123 ?auto_597127 ) ) ( not ( = ?auto_597123 ?auto_597128 ) ) ( not ( = ?auto_597123 ?auto_597129 ) ) ( not ( = ?auto_597123 ?auto_597130 ) ) ( not ( = ?auto_597123 ?auto_597131 ) ) ( not ( = ?auto_597123 ?auto_597132 ) ) ( not ( = ?auto_597123 ?auto_597133 ) ) ( not ( = ?auto_597123 ?auto_597134 ) ) ( not ( = ?auto_597123 ?auto_597135 ) ) ( not ( = ?auto_597123 ?auto_597136 ) ) ( not ( = ?auto_597123 ?auto_597137 ) ) ( not ( = ?auto_597123 ?auto_597138 ) ) ( not ( = ?auto_597124 ?auto_597125 ) ) ( not ( = ?auto_597124 ?auto_597126 ) ) ( not ( = ?auto_597124 ?auto_597127 ) ) ( not ( = ?auto_597124 ?auto_597128 ) ) ( not ( = ?auto_597124 ?auto_597129 ) ) ( not ( = ?auto_597124 ?auto_597130 ) ) ( not ( = ?auto_597124 ?auto_597131 ) ) ( not ( = ?auto_597124 ?auto_597132 ) ) ( not ( = ?auto_597124 ?auto_597133 ) ) ( not ( = ?auto_597124 ?auto_597134 ) ) ( not ( = ?auto_597124 ?auto_597135 ) ) ( not ( = ?auto_597124 ?auto_597136 ) ) ( not ( = ?auto_597124 ?auto_597137 ) ) ( not ( = ?auto_597124 ?auto_597138 ) ) ( not ( = ?auto_597125 ?auto_597126 ) ) ( not ( = ?auto_597125 ?auto_597127 ) ) ( not ( = ?auto_597125 ?auto_597128 ) ) ( not ( = ?auto_597125 ?auto_597129 ) ) ( not ( = ?auto_597125 ?auto_597130 ) ) ( not ( = ?auto_597125 ?auto_597131 ) ) ( not ( = ?auto_597125 ?auto_597132 ) ) ( not ( = ?auto_597125 ?auto_597133 ) ) ( not ( = ?auto_597125 ?auto_597134 ) ) ( not ( = ?auto_597125 ?auto_597135 ) ) ( not ( = ?auto_597125 ?auto_597136 ) ) ( not ( = ?auto_597125 ?auto_597137 ) ) ( not ( = ?auto_597125 ?auto_597138 ) ) ( not ( = ?auto_597126 ?auto_597127 ) ) ( not ( = ?auto_597126 ?auto_597128 ) ) ( not ( = ?auto_597126 ?auto_597129 ) ) ( not ( = ?auto_597126 ?auto_597130 ) ) ( not ( = ?auto_597126 ?auto_597131 ) ) ( not ( = ?auto_597126 ?auto_597132 ) ) ( not ( = ?auto_597126 ?auto_597133 ) ) ( not ( = ?auto_597126 ?auto_597134 ) ) ( not ( = ?auto_597126 ?auto_597135 ) ) ( not ( = ?auto_597126 ?auto_597136 ) ) ( not ( = ?auto_597126 ?auto_597137 ) ) ( not ( = ?auto_597126 ?auto_597138 ) ) ( not ( = ?auto_597127 ?auto_597128 ) ) ( not ( = ?auto_597127 ?auto_597129 ) ) ( not ( = ?auto_597127 ?auto_597130 ) ) ( not ( = ?auto_597127 ?auto_597131 ) ) ( not ( = ?auto_597127 ?auto_597132 ) ) ( not ( = ?auto_597127 ?auto_597133 ) ) ( not ( = ?auto_597127 ?auto_597134 ) ) ( not ( = ?auto_597127 ?auto_597135 ) ) ( not ( = ?auto_597127 ?auto_597136 ) ) ( not ( = ?auto_597127 ?auto_597137 ) ) ( not ( = ?auto_597127 ?auto_597138 ) ) ( not ( = ?auto_597128 ?auto_597129 ) ) ( not ( = ?auto_597128 ?auto_597130 ) ) ( not ( = ?auto_597128 ?auto_597131 ) ) ( not ( = ?auto_597128 ?auto_597132 ) ) ( not ( = ?auto_597128 ?auto_597133 ) ) ( not ( = ?auto_597128 ?auto_597134 ) ) ( not ( = ?auto_597128 ?auto_597135 ) ) ( not ( = ?auto_597128 ?auto_597136 ) ) ( not ( = ?auto_597128 ?auto_597137 ) ) ( not ( = ?auto_597128 ?auto_597138 ) ) ( not ( = ?auto_597129 ?auto_597130 ) ) ( not ( = ?auto_597129 ?auto_597131 ) ) ( not ( = ?auto_597129 ?auto_597132 ) ) ( not ( = ?auto_597129 ?auto_597133 ) ) ( not ( = ?auto_597129 ?auto_597134 ) ) ( not ( = ?auto_597129 ?auto_597135 ) ) ( not ( = ?auto_597129 ?auto_597136 ) ) ( not ( = ?auto_597129 ?auto_597137 ) ) ( not ( = ?auto_597129 ?auto_597138 ) ) ( not ( = ?auto_597130 ?auto_597131 ) ) ( not ( = ?auto_597130 ?auto_597132 ) ) ( not ( = ?auto_597130 ?auto_597133 ) ) ( not ( = ?auto_597130 ?auto_597134 ) ) ( not ( = ?auto_597130 ?auto_597135 ) ) ( not ( = ?auto_597130 ?auto_597136 ) ) ( not ( = ?auto_597130 ?auto_597137 ) ) ( not ( = ?auto_597130 ?auto_597138 ) ) ( not ( = ?auto_597131 ?auto_597132 ) ) ( not ( = ?auto_597131 ?auto_597133 ) ) ( not ( = ?auto_597131 ?auto_597134 ) ) ( not ( = ?auto_597131 ?auto_597135 ) ) ( not ( = ?auto_597131 ?auto_597136 ) ) ( not ( = ?auto_597131 ?auto_597137 ) ) ( not ( = ?auto_597131 ?auto_597138 ) ) ( not ( = ?auto_597132 ?auto_597133 ) ) ( not ( = ?auto_597132 ?auto_597134 ) ) ( not ( = ?auto_597132 ?auto_597135 ) ) ( not ( = ?auto_597132 ?auto_597136 ) ) ( not ( = ?auto_597132 ?auto_597137 ) ) ( not ( = ?auto_597132 ?auto_597138 ) ) ( not ( = ?auto_597133 ?auto_597134 ) ) ( not ( = ?auto_597133 ?auto_597135 ) ) ( not ( = ?auto_597133 ?auto_597136 ) ) ( not ( = ?auto_597133 ?auto_597137 ) ) ( not ( = ?auto_597133 ?auto_597138 ) ) ( not ( = ?auto_597134 ?auto_597135 ) ) ( not ( = ?auto_597134 ?auto_597136 ) ) ( not ( = ?auto_597134 ?auto_597137 ) ) ( not ( = ?auto_597134 ?auto_597138 ) ) ( not ( = ?auto_597135 ?auto_597136 ) ) ( not ( = ?auto_597135 ?auto_597137 ) ) ( not ( = ?auto_597135 ?auto_597138 ) ) ( not ( = ?auto_597136 ?auto_597137 ) ) ( not ( = ?auto_597136 ?auto_597138 ) ) ( not ( = ?auto_597137 ?auto_597138 ) ) ( ON ?auto_597137 ?auto_597138 ) ( ON ?auto_597136 ?auto_597137 ) ( ON ?auto_597135 ?auto_597136 ) ( ON ?auto_597134 ?auto_597135 ) ( ON ?auto_597133 ?auto_597134 ) ( CLEAR ?auto_597131 ) ( ON ?auto_597132 ?auto_597133 ) ( CLEAR ?auto_597132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_597122 ?auto_597123 ?auto_597124 ?auto_597125 ?auto_597126 ?auto_597127 ?auto_597128 ?auto_597129 ?auto_597130 ?auto_597131 ?auto_597132 )
      ( MAKE-17PILE ?auto_597122 ?auto_597123 ?auto_597124 ?auto_597125 ?auto_597126 ?auto_597127 ?auto_597128 ?auto_597129 ?auto_597130 ?auto_597131 ?auto_597132 ?auto_597133 ?auto_597134 ?auto_597135 ?auto_597136 ?auto_597137 ?auto_597138 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597156 - BLOCK
      ?auto_597157 - BLOCK
      ?auto_597158 - BLOCK
      ?auto_597159 - BLOCK
      ?auto_597160 - BLOCK
      ?auto_597161 - BLOCK
      ?auto_597162 - BLOCK
      ?auto_597163 - BLOCK
      ?auto_597164 - BLOCK
      ?auto_597165 - BLOCK
      ?auto_597166 - BLOCK
      ?auto_597167 - BLOCK
      ?auto_597168 - BLOCK
      ?auto_597169 - BLOCK
      ?auto_597170 - BLOCK
      ?auto_597171 - BLOCK
      ?auto_597172 - BLOCK
    )
    :vars
    (
      ?auto_597173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597172 ?auto_597173 ) ( ON-TABLE ?auto_597156 ) ( ON ?auto_597157 ?auto_597156 ) ( ON ?auto_597158 ?auto_597157 ) ( ON ?auto_597159 ?auto_597158 ) ( ON ?auto_597160 ?auto_597159 ) ( ON ?auto_597161 ?auto_597160 ) ( ON ?auto_597162 ?auto_597161 ) ( ON ?auto_597163 ?auto_597162 ) ( ON ?auto_597164 ?auto_597163 ) ( not ( = ?auto_597156 ?auto_597157 ) ) ( not ( = ?auto_597156 ?auto_597158 ) ) ( not ( = ?auto_597156 ?auto_597159 ) ) ( not ( = ?auto_597156 ?auto_597160 ) ) ( not ( = ?auto_597156 ?auto_597161 ) ) ( not ( = ?auto_597156 ?auto_597162 ) ) ( not ( = ?auto_597156 ?auto_597163 ) ) ( not ( = ?auto_597156 ?auto_597164 ) ) ( not ( = ?auto_597156 ?auto_597165 ) ) ( not ( = ?auto_597156 ?auto_597166 ) ) ( not ( = ?auto_597156 ?auto_597167 ) ) ( not ( = ?auto_597156 ?auto_597168 ) ) ( not ( = ?auto_597156 ?auto_597169 ) ) ( not ( = ?auto_597156 ?auto_597170 ) ) ( not ( = ?auto_597156 ?auto_597171 ) ) ( not ( = ?auto_597156 ?auto_597172 ) ) ( not ( = ?auto_597156 ?auto_597173 ) ) ( not ( = ?auto_597157 ?auto_597158 ) ) ( not ( = ?auto_597157 ?auto_597159 ) ) ( not ( = ?auto_597157 ?auto_597160 ) ) ( not ( = ?auto_597157 ?auto_597161 ) ) ( not ( = ?auto_597157 ?auto_597162 ) ) ( not ( = ?auto_597157 ?auto_597163 ) ) ( not ( = ?auto_597157 ?auto_597164 ) ) ( not ( = ?auto_597157 ?auto_597165 ) ) ( not ( = ?auto_597157 ?auto_597166 ) ) ( not ( = ?auto_597157 ?auto_597167 ) ) ( not ( = ?auto_597157 ?auto_597168 ) ) ( not ( = ?auto_597157 ?auto_597169 ) ) ( not ( = ?auto_597157 ?auto_597170 ) ) ( not ( = ?auto_597157 ?auto_597171 ) ) ( not ( = ?auto_597157 ?auto_597172 ) ) ( not ( = ?auto_597157 ?auto_597173 ) ) ( not ( = ?auto_597158 ?auto_597159 ) ) ( not ( = ?auto_597158 ?auto_597160 ) ) ( not ( = ?auto_597158 ?auto_597161 ) ) ( not ( = ?auto_597158 ?auto_597162 ) ) ( not ( = ?auto_597158 ?auto_597163 ) ) ( not ( = ?auto_597158 ?auto_597164 ) ) ( not ( = ?auto_597158 ?auto_597165 ) ) ( not ( = ?auto_597158 ?auto_597166 ) ) ( not ( = ?auto_597158 ?auto_597167 ) ) ( not ( = ?auto_597158 ?auto_597168 ) ) ( not ( = ?auto_597158 ?auto_597169 ) ) ( not ( = ?auto_597158 ?auto_597170 ) ) ( not ( = ?auto_597158 ?auto_597171 ) ) ( not ( = ?auto_597158 ?auto_597172 ) ) ( not ( = ?auto_597158 ?auto_597173 ) ) ( not ( = ?auto_597159 ?auto_597160 ) ) ( not ( = ?auto_597159 ?auto_597161 ) ) ( not ( = ?auto_597159 ?auto_597162 ) ) ( not ( = ?auto_597159 ?auto_597163 ) ) ( not ( = ?auto_597159 ?auto_597164 ) ) ( not ( = ?auto_597159 ?auto_597165 ) ) ( not ( = ?auto_597159 ?auto_597166 ) ) ( not ( = ?auto_597159 ?auto_597167 ) ) ( not ( = ?auto_597159 ?auto_597168 ) ) ( not ( = ?auto_597159 ?auto_597169 ) ) ( not ( = ?auto_597159 ?auto_597170 ) ) ( not ( = ?auto_597159 ?auto_597171 ) ) ( not ( = ?auto_597159 ?auto_597172 ) ) ( not ( = ?auto_597159 ?auto_597173 ) ) ( not ( = ?auto_597160 ?auto_597161 ) ) ( not ( = ?auto_597160 ?auto_597162 ) ) ( not ( = ?auto_597160 ?auto_597163 ) ) ( not ( = ?auto_597160 ?auto_597164 ) ) ( not ( = ?auto_597160 ?auto_597165 ) ) ( not ( = ?auto_597160 ?auto_597166 ) ) ( not ( = ?auto_597160 ?auto_597167 ) ) ( not ( = ?auto_597160 ?auto_597168 ) ) ( not ( = ?auto_597160 ?auto_597169 ) ) ( not ( = ?auto_597160 ?auto_597170 ) ) ( not ( = ?auto_597160 ?auto_597171 ) ) ( not ( = ?auto_597160 ?auto_597172 ) ) ( not ( = ?auto_597160 ?auto_597173 ) ) ( not ( = ?auto_597161 ?auto_597162 ) ) ( not ( = ?auto_597161 ?auto_597163 ) ) ( not ( = ?auto_597161 ?auto_597164 ) ) ( not ( = ?auto_597161 ?auto_597165 ) ) ( not ( = ?auto_597161 ?auto_597166 ) ) ( not ( = ?auto_597161 ?auto_597167 ) ) ( not ( = ?auto_597161 ?auto_597168 ) ) ( not ( = ?auto_597161 ?auto_597169 ) ) ( not ( = ?auto_597161 ?auto_597170 ) ) ( not ( = ?auto_597161 ?auto_597171 ) ) ( not ( = ?auto_597161 ?auto_597172 ) ) ( not ( = ?auto_597161 ?auto_597173 ) ) ( not ( = ?auto_597162 ?auto_597163 ) ) ( not ( = ?auto_597162 ?auto_597164 ) ) ( not ( = ?auto_597162 ?auto_597165 ) ) ( not ( = ?auto_597162 ?auto_597166 ) ) ( not ( = ?auto_597162 ?auto_597167 ) ) ( not ( = ?auto_597162 ?auto_597168 ) ) ( not ( = ?auto_597162 ?auto_597169 ) ) ( not ( = ?auto_597162 ?auto_597170 ) ) ( not ( = ?auto_597162 ?auto_597171 ) ) ( not ( = ?auto_597162 ?auto_597172 ) ) ( not ( = ?auto_597162 ?auto_597173 ) ) ( not ( = ?auto_597163 ?auto_597164 ) ) ( not ( = ?auto_597163 ?auto_597165 ) ) ( not ( = ?auto_597163 ?auto_597166 ) ) ( not ( = ?auto_597163 ?auto_597167 ) ) ( not ( = ?auto_597163 ?auto_597168 ) ) ( not ( = ?auto_597163 ?auto_597169 ) ) ( not ( = ?auto_597163 ?auto_597170 ) ) ( not ( = ?auto_597163 ?auto_597171 ) ) ( not ( = ?auto_597163 ?auto_597172 ) ) ( not ( = ?auto_597163 ?auto_597173 ) ) ( not ( = ?auto_597164 ?auto_597165 ) ) ( not ( = ?auto_597164 ?auto_597166 ) ) ( not ( = ?auto_597164 ?auto_597167 ) ) ( not ( = ?auto_597164 ?auto_597168 ) ) ( not ( = ?auto_597164 ?auto_597169 ) ) ( not ( = ?auto_597164 ?auto_597170 ) ) ( not ( = ?auto_597164 ?auto_597171 ) ) ( not ( = ?auto_597164 ?auto_597172 ) ) ( not ( = ?auto_597164 ?auto_597173 ) ) ( not ( = ?auto_597165 ?auto_597166 ) ) ( not ( = ?auto_597165 ?auto_597167 ) ) ( not ( = ?auto_597165 ?auto_597168 ) ) ( not ( = ?auto_597165 ?auto_597169 ) ) ( not ( = ?auto_597165 ?auto_597170 ) ) ( not ( = ?auto_597165 ?auto_597171 ) ) ( not ( = ?auto_597165 ?auto_597172 ) ) ( not ( = ?auto_597165 ?auto_597173 ) ) ( not ( = ?auto_597166 ?auto_597167 ) ) ( not ( = ?auto_597166 ?auto_597168 ) ) ( not ( = ?auto_597166 ?auto_597169 ) ) ( not ( = ?auto_597166 ?auto_597170 ) ) ( not ( = ?auto_597166 ?auto_597171 ) ) ( not ( = ?auto_597166 ?auto_597172 ) ) ( not ( = ?auto_597166 ?auto_597173 ) ) ( not ( = ?auto_597167 ?auto_597168 ) ) ( not ( = ?auto_597167 ?auto_597169 ) ) ( not ( = ?auto_597167 ?auto_597170 ) ) ( not ( = ?auto_597167 ?auto_597171 ) ) ( not ( = ?auto_597167 ?auto_597172 ) ) ( not ( = ?auto_597167 ?auto_597173 ) ) ( not ( = ?auto_597168 ?auto_597169 ) ) ( not ( = ?auto_597168 ?auto_597170 ) ) ( not ( = ?auto_597168 ?auto_597171 ) ) ( not ( = ?auto_597168 ?auto_597172 ) ) ( not ( = ?auto_597168 ?auto_597173 ) ) ( not ( = ?auto_597169 ?auto_597170 ) ) ( not ( = ?auto_597169 ?auto_597171 ) ) ( not ( = ?auto_597169 ?auto_597172 ) ) ( not ( = ?auto_597169 ?auto_597173 ) ) ( not ( = ?auto_597170 ?auto_597171 ) ) ( not ( = ?auto_597170 ?auto_597172 ) ) ( not ( = ?auto_597170 ?auto_597173 ) ) ( not ( = ?auto_597171 ?auto_597172 ) ) ( not ( = ?auto_597171 ?auto_597173 ) ) ( not ( = ?auto_597172 ?auto_597173 ) ) ( ON ?auto_597171 ?auto_597172 ) ( ON ?auto_597170 ?auto_597171 ) ( ON ?auto_597169 ?auto_597170 ) ( ON ?auto_597168 ?auto_597169 ) ( ON ?auto_597167 ?auto_597168 ) ( ON ?auto_597166 ?auto_597167 ) ( CLEAR ?auto_597164 ) ( ON ?auto_597165 ?auto_597166 ) ( CLEAR ?auto_597165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_597156 ?auto_597157 ?auto_597158 ?auto_597159 ?auto_597160 ?auto_597161 ?auto_597162 ?auto_597163 ?auto_597164 ?auto_597165 )
      ( MAKE-17PILE ?auto_597156 ?auto_597157 ?auto_597158 ?auto_597159 ?auto_597160 ?auto_597161 ?auto_597162 ?auto_597163 ?auto_597164 ?auto_597165 ?auto_597166 ?auto_597167 ?auto_597168 ?auto_597169 ?auto_597170 ?auto_597171 ?auto_597172 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597191 - BLOCK
      ?auto_597192 - BLOCK
      ?auto_597193 - BLOCK
      ?auto_597194 - BLOCK
      ?auto_597195 - BLOCK
      ?auto_597196 - BLOCK
      ?auto_597197 - BLOCK
      ?auto_597198 - BLOCK
      ?auto_597199 - BLOCK
      ?auto_597200 - BLOCK
      ?auto_597201 - BLOCK
      ?auto_597202 - BLOCK
      ?auto_597203 - BLOCK
      ?auto_597204 - BLOCK
      ?auto_597205 - BLOCK
      ?auto_597206 - BLOCK
      ?auto_597207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597207 ) ( ON-TABLE ?auto_597191 ) ( ON ?auto_597192 ?auto_597191 ) ( ON ?auto_597193 ?auto_597192 ) ( ON ?auto_597194 ?auto_597193 ) ( ON ?auto_597195 ?auto_597194 ) ( ON ?auto_597196 ?auto_597195 ) ( ON ?auto_597197 ?auto_597196 ) ( ON ?auto_597198 ?auto_597197 ) ( ON ?auto_597199 ?auto_597198 ) ( not ( = ?auto_597191 ?auto_597192 ) ) ( not ( = ?auto_597191 ?auto_597193 ) ) ( not ( = ?auto_597191 ?auto_597194 ) ) ( not ( = ?auto_597191 ?auto_597195 ) ) ( not ( = ?auto_597191 ?auto_597196 ) ) ( not ( = ?auto_597191 ?auto_597197 ) ) ( not ( = ?auto_597191 ?auto_597198 ) ) ( not ( = ?auto_597191 ?auto_597199 ) ) ( not ( = ?auto_597191 ?auto_597200 ) ) ( not ( = ?auto_597191 ?auto_597201 ) ) ( not ( = ?auto_597191 ?auto_597202 ) ) ( not ( = ?auto_597191 ?auto_597203 ) ) ( not ( = ?auto_597191 ?auto_597204 ) ) ( not ( = ?auto_597191 ?auto_597205 ) ) ( not ( = ?auto_597191 ?auto_597206 ) ) ( not ( = ?auto_597191 ?auto_597207 ) ) ( not ( = ?auto_597192 ?auto_597193 ) ) ( not ( = ?auto_597192 ?auto_597194 ) ) ( not ( = ?auto_597192 ?auto_597195 ) ) ( not ( = ?auto_597192 ?auto_597196 ) ) ( not ( = ?auto_597192 ?auto_597197 ) ) ( not ( = ?auto_597192 ?auto_597198 ) ) ( not ( = ?auto_597192 ?auto_597199 ) ) ( not ( = ?auto_597192 ?auto_597200 ) ) ( not ( = ?auto_597192 ?auto_597201 ) ) ( not ( = ?auto_597192 ?auto_597202 ) ) ( not ( = ?auto_597192 ?auto_597203 ) ) ( not ( = ?auto_597192 ?auto_597204 ) ) ( not ( = ?auto_597192 ?auto_597205 ) ) ( not ( = ?auto_597192 ?auto_597206 ) ) ( not ( = ?auto_597192 ?auto_597207 ) ) ( not ( = ?auto_597193 ?auto_597194 ) ) ( not ( = ?auto_597193 ?auto_597195 ) ) ( not ( = ?auto_597193 ?auto_597196 ) ) ( not ( = ?auto_597193 ?auto_597197 ) ) ( not ( = ?auto_597193 ?auto_597198 ) ) ( not ( = ?auto_597193 ?auto_597199 ) ) ( not ( = ?auto_597193 ?auto_597200 ) ) ( not ( = ?auto_597193 ?auto_597201 ) ) ( not ( = ?auto_597193 ?auto_597202 ) ) ( not ( = ?auto_597193 ?auto_597203 ) ) ( not ( = ?auto_597193 ?auto_597204 ) ) ( not ( = ?auto_597193 ?auto_597205 ) ) ( not ( = ?auto_597193 ?auto_597206 ) ) ( not ( = ?auto_597193 ?auto_597207 ) ) ( not ( = ?auto_597194 ?auto_597195 ) ) ( not ( = ?auto_597194 ?auto_597196 ) ) ( not ( = ?auto_597194 ?auto_597197 ) ) ( not ( = ?auto_597194 ?auto_597198 ) ) ( not ( = ?auto_597194 ?auto_597199 ) ) ( not ( = ?auto_597194 ?auto_597200 ) ) ( not ( = ?auto_597194 ?auto_597201 ) ) ( not ( = ?auto_597194 ?auto_597202 ) ) ( not ( = ?auto_597194 ?auto_597203 ) ) ( not ( = ?auto_597194 ?auto_597204 ) ) ( not ( = ?auto_597194 ?auto_597205 ) ) ( not ( = ?auto_597194 ?auto_597206 ) ) ( not ( = ?auto_597194 ?auto_597207 ) ) ( not ( = ?auto_597195 ?auto_597196 ) ) ( not ( = ?auto_597195 ?auto_597197 ) ) ( not ( = ?auto_597195 ?auto_597198 ) ) ( not ( = ?auto_597195 ?auto_597199 ) ) ( not ( = ?auto_597195 ?auto_597200 ) ) ( not ( = ?auto_597195 ?auto_597201 ) ) ( not ( = ?auto_597195 ?auto_597202 ) ) ( not ( = ?auto_597195 ?auto_597203 ) ) ( not ( = ?auto_597195 ?auto_597204 ) ) ( not ( = ?auto_597195 ?auto_597205 ) ) ( not ( = ?auto_597195 ?auto_597206 ) ) ( not ( = ?auto_597195 ?auto_597207 ) ) ( not ( = ?auto_597196 ?auto_597197 ) ) ( not ( = ?auto_597196 ?auto_597198 ) ) ( not ( = ?auto_597196 ?auto_597199 ) ) ( not ( = ?auto_597196 ?auto_597200 ) ) ( not ( = ?auto_597196 ?auto_597201 ) ) ( not ( = ?auto_597196 ?auto_597202 ) ) ( not ( = ?auto_597196 ?auto_597203 ) ) ( not ( = ?auto_597196 ?auto_597204 ) ) ( not ( = ?auto_597196 ?auto_597205 ) ) ( not ( = ?auto_597196 ?auto_597206 ) ) ( not ( = ?auto_597196 ?auto_597207 ) ) ( not ( = ?auto_597197 ?auto_597198 ) ) ( not ( = ?auto_597197 ?auto_597199 ) ) ( not ( = ?auto_597197 ?auto_597200 ) ) ( not ( = ?auto_597197 ?auto_597201 ) ) ( not ( = ?auto_597197 ?auto_597202 ) ) ( not ( = ?auto_597197 ?auto_597203 ) ) ( not ( = ?auto_597197 ?auto_597204 ) ) ( not ( = ?auto_597197 ?auto_597205 ) ) ( not ( = ?auto_597197 ?auto_597206 ) ) ( not ( = ?auto_597197 ?auto_597207 ) ) ( not ( = ?auto_597198 ?auto_597199 ) ) ( not ( = ?auto_597198 ?auto_597200 ) ) ( not ( = ?auto_597198 ?auto_597201 ) ) ( not ( = ?auto_597198 ?auto_597202 ) ) ( not ( = ?auto_597198 ?auto_597203 ) ) ( not ( = ?auto_597198 ?auto_597204 ) ) ( not ( = ?auto_597198 ?auto_597205 ) ) ( not ( = ?auto_597198 ?auto_597206 ) ) ( not ( = ?auto_597198 ?auto_597207 ) ) ( not ( = ?auto_597199 ?auto_597200 ) ) ( not ( = ?auto_597199 ?auto_597201 ) ) ( not ( = ?auto_597199 ?auto_597202 ) ) ( not ( = ?auto_597199 ?auto_597203 ) ) ( not ( = ?auto_597199 ?auto_597204 ) ) ( not ( = ?auto_597199 ?auto_597205 ) ) ( not ( = ?auto_597199 ?auto_597206 ) ) ( not ( = ?auto_597199 ?auto_597207 ) ) ( not ( = ?auto_597200 ?auto_597201 ) ) ( not ( = ?auto_597200 ?auto_597202 ) ) ( not ( = ?auto_597200 ?auto_597203 ) ) ( not ( = ?auto_597200 ?auto_597204 ) ) ( not ( = ?auto_597200 ?auto_597205 ) ) ( not ( = ?auto_597200 ?auto_597206 ) ) ( not ( = ?auto_597200 ?auto_597207 ) ) ( not ( = ?auto_597201 ?auto_597202 ) ) ( not ( = ?auto_597201 ?auto_597203 ) ) ( not ( = ?auto_597201 ?auto_597204 ) ) ( not ( = ?auto_597201 ?auto_597205 ) ) ( not ( = ?auto_597201 ?auto_597206 ) ) ( not ( = ?auto_597201 ?auto_597207 ) ) ( not ( = ?auto_597202 ?auto_597203 ) ) ( not ( = ?auto_597202 ?auto_597204 ) ) ( not ( = ?auto_597202 ?auto_597205 ) ) ( not ( = ?auto_597202 ?auto_597206 ) ) ( not ( = ?auto_597202 ?auto_597207 ) ) ( not ( = ?auto_597203 ?auto_597204 ) ) ( not ( = ?auto_597203 ?auto_597205 ) ) ( not ( = ?auto_597203 ?auto_597206 ) ) ( not ( = ?auto_597203 ?auto_597207 ) ) ( not ( = ?auto_597204 ?auto_597205 ) ) ( not ( = ?auto_597204 ?auto_597206 ) ) ( not ( = ?auto_597204 ?auto_597207 ) ) ( not ( = ?auto_597205 ?auto_597206 ) ) ( not ( = ?auto_597205 ?auto_597207 ) ) ( not ( = ?auto_597206 ?auto_597207 ) ) ( ON ?auto_597206 ?auto_597207 ) ( ON ?auto_597205 ?auto_597206 ) ( ON ?auto_597204 ?auto_597205 ) ( ON ?auto_597203 ?auto_597204 ) ( ON ?auto_597202 ?auto_597203 ) ( ON ?auto_597201 ?auto_597202 ) ( CLEAR ?auto_597199 ) ( ON ?auto_597200 ?auto_597201 ) ( CLEAR ?auto_597200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_597191 ?auto_597192 ?auto_597193 ?auto_597194 ?auto_597195 ?auto_597196 ?auto_597197 ?auto_597198 ?auto_597199 ?auto_597200 )
      ( MAKE-17PILE ?auto_597191 ?auto_597192 ?auto_597193 ?auto_597194 ?auto_597195 ?auto_597196 ?auto_597197 ?auto_597198 ?auto_597199 ?auto_597200 ?auto_597201 ?auto_597202 ?auto_597203 ?auto_597204 ?auto_597205 ?auto_597206 ?auto_597207 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597225 - BLOCK
      ?auto_597226 - BLOCK
      ?auto_597227 - BLOCK
      ?auto_597228 - BLOCK
      ?auto_597229 - BLOCK
      ?auto_597230 - BLOCK
      ?auto_597231 - BLOCK
      ?auto_597232 - BLOCK
      ?auto_597233 - BLOCK
      ?auto_597234 - BLOCK
      ?auto_597235 - BLOCK
      ?auto_597236 - BLOCK
      ?auto_597237 - BLOCK
      ?auto_597238 - BLOCK
      ?auto_597239 - BLOCK
      ?auto_597240 - BLOCK
      ?auto_597241 - BLOCK
    )
    :vars
    (
      ?auto_597242 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597241 ?auto_597242 ) ( ON-TABLE ?auto_597225 ) ( ON ?auto_597226 ?auto_597225 ) ( ON ?auto_597227 ?auto_597226 ) ( ON ?auto_597228 ?auto_597227 ) ( ON ?auto_597229 ?auto_597228 ) ( ON ?auto_597230 ?auto_597229 ) ( ON ?auto_597231 ?auto_597230 ) ( ON ?auto_597232 ?auto_597231 ) ( not ( = ?auto_597225 ?auto_597226 ) ) ( not ( = ?auto_597225 ?auto_597227 ) ) ( not ( = ?auto_597225 ?auto_597228 ) ) ( not ( = ?auto_597225 ?auto_597229 ) ) ( not ( = ?auto_597225 ?auto_597230 ) ) ( not ( = ?auto_597225 ?auto_597231 ) ) ( not ( = ?auto_597225 ?auto_597232 ) ) ( not ( = ?auto_597225 ?auto_597233 ) ) ( not ( = ?auto_597225 ?auto_597234 ) ) ( not ( = ?auto_597225 ?auto_597235 ) ) ( not ( = ?auto_597225 ?auto_597236 ) ) ( not ( = ?auto_597225 ?auto_597237 ) ) ( not ( = ?auto_597225 ?auto_597238 ) ) ( not ( = ?auto_597225 ?auto_597239 ) ) ( not ( = ?auto_597225 ?auto_597240 ) ) ( not ( = ?auto_597225 ?auto_597241 ) ) ( not ( = ?auto_597225 ?auto_597242 ) ) ( not ( = ?auto_597226 ?auto_597227 ) ) ( not ( = ?auto_597226 ?auto_597228 ) ) ( not ( = ?auto_597226 ?auto_597229 ) ) ( not ( = ?auto_597226 ?auto_597230 ) ) ( not ( = ?auto_597226 ?auto_597231 ) ) ( not ( = ?auto_597226 ?auto_597232 ) ) ( not ( = ?auto_597226 ?auto_597233 ) ) ( not ( = ?auto_597226 ?auto_597234 ) ) ( not ( = ?auto_597226 ?auto_597235 ) ) ( not ( = ?auto_597226 ?auto_597236 ) ) ( not ( = ?auto_597226 ?auto_597237 ) ) ( not ( = ?auto_597226 ?auto_597238 ) ) ( not ( = ?auto_597226 ?auto_597239 ) ) ( not ( = ?auto_597226 ?auto_597240 ) ) ( not ( = ?auto_597226 ?auto_597241 ) ) ( not ( = ?auto_597226 ?auto_597242 ) ) ( not ( = ?auto_597227 ?auto_597228 ) ) ( not ( = ?auto_597227 ?auto_597229 ) ) ( not ( = ?auto_597227 ?auto_597230 ) ) ( not ( = ?auto_597227 ?auto_597231 ) ) ( not ( = ?auto_597227 ?auto_597232 ) ) ( not ( = ?auto_597227 ?auto_597233 ) ) ( not ( = ?auto_597227 ?auto_597234 ) ) ( not ( = ?auto_597227 ?auto_597235 ) ) ( not ( = ?auto_597227 ?auto_597236 ) ) ( not ( = ?auto_597227 ?auto_597237 ) ) ( not ( = ?auto_597227 ?auto_597238 ) ) ( not ( = ?auto_597227 ?auto_597239 ) ) ( not ( = ?auto_597227 ?auto_597240 ) ) ( not ( = ?auto_597227 ?auto_597241 ) ) ( not ( = ?auto_597227 ?auto_597242 ) ) ( not ( = ?auto_597228 ?auto_597229 ) ) ( not ( = ?auto_597228 ?auto_597230 ) ) ( not ( = ?auto_597228 ?auto_597231 ) ) ( not ( = ?auto_597228 ?auto_597232 ) ) ( not ( = ?auto_597228 ?auto_597233 ) ) ( not ( = ?auto_597228 ?auto_597234 ) ) ( not ( = ?auto_597228 ?auto_597235 ) ) ( not ( = ?auto_597228 ?auto_597236 ) ) ( not ( = ?auto_597228 ?auto_597237 ) ) ( not ( = ?auto_597228 ?auto_597238 ) ) ( not ( = ?auto_597228 ?auto_597239 ) ) ( not ( = ?auto_597228 ?auto_597240 ) ) ( not ( = ?auto_597228 ?auto_597241 ) ) ( not ( = ?auto_597228 ?auto_597242 ) ) ( not ( = ?auto_597229 ?auto_597230 ) ) ( not ( = ?auto_597229 ?auto_597231 ) ) ( not ( = ?auto_597229 ?auto_597232 ) ) ( not ( = ?auto_597229 ?auto_597233 ) ) ( not ( = ?auto_597229 ?auto_597234 ) ) ( not ( = ?auto_597229 ?auto_597235 ) ) ( not ( = ?auto_597229 ?auto_597236 ) ) ( not ( = ?auto_597229 ?auto_597237 ) ) ( not ( = ?auto_597229 ?auto_597238 ) ) ( not ( = ?auto_597229 ?auto_597239 ) ) ( not ( = ?auto_597229 ?auto_597240 ) ) ( not ( = ?auto_597229 ?auto_597241 ) ) ( not ( = ?auto_597229 ?auto_597242 ) ) ( not ( = ?auto_597230 ?auto_597231 ) ) ( not ( = ?auto_597230 ?auto_597232 ) ) ( not ( = ?auto_597230 ?auto_597233 ) ) ( not ( = ?auto_597230 ?auto_597234 ) ) ( not ( = ?auto_597230 ?auto_597235 ) ) ( not ( = ?auto_597230 ?auto_597236 ) ) ( not ( = ?auto_597230 ?auto_597237 ) ) ( not ( = ?auto_597230 ?auto_597238 ) ) ( not ( = ?auto_597230 ?auto_597239 ) ) ( not ( = ?auto_597230 ?auto_597240 ) ) ( not ( = ?auto_597230 ?auto_597241 ) ) ( not ( = ?auto_597230 ?auto_597242 ) ) ( not ( = ?auto_597231 ?auto_597232 ) ) ( not ( = ?auto_597231 ?auto_597233 ) ) ( not ( = ?auto_597231 ?auto_597234 ) ) ( not ( = ?auto_597231 ?auto_597235 ) ) ( not ( = ?auto_597231 ?auto_597236 ) ) ( not ( = ?auto_597231 ?auto_597237 ) ) ( not ( = ?auto_597231 ?auto_597238 ) ) ( not ( = ?auto_597231 ?auto_597239 ) ) ( not ( = ?auto_597231 ?auto_597240 ) ) ( not ( = ?auto_597231 ?auto_597241 ) ) ( not ( = ?auto_597231 ?auto_597242 ) ) ( not ( = ?auto_597232 ?auto_597233 ) ) ( not ( = ?auto_597232 ?auto_597234 ) ) ( not ( = ?auto_597232 ?auto_597235 ) ) ( not ( = ?auto_597232 ?auto_597236 ) ) ( not ( = ?auto_597232 ?auto_597237 ) ) ( not ( = ?auto_597232 ?auto_597238 ) ) ( not ( = ?auto_597232 ?auto_597239 ) ) ( not ( = ?auto_597232 ?auto_597240 ) ) ( not ( = ?auto_597232 ?auto_597241 ) ) ( not ( = ?auto_597232 ?auto_597242 ) ) ( not ( = ?auto_597233 ?auto_597234 ) ) ( not ( = ?auto_597233 ?auto_597235 ) ) ( not ( = ?auto_597233 ?auto_597236 ) ) ( not ( = ?auto_597233 ?auto_597237 ) ) ( not ( = ?auto_597233 ?auto_597238 ) ) ( not ( = ?auto_597233 ?auto_597239 ) ) ( not ( = ?auto_597233 ?auto_597240 ) ) ( not ( = ?auto_597233 ?auto_597241 ) ) ( not ( = ?auto_597233 ?auto_597242 ) ) ( not ( = ?auto_597234 ?auto_597235 ) ) ( not ( = ?auto_597234 ?auto_597236 ) ) ( not ( = ?auto_597234 ?auto_597237 ) ) ( not ( = ?auto_597234 ?auto_597238 ) ) ( not ( = ?auto_597234 ?auto_597239 ) ) ( not ( = ?auto_597234 ?auto_597240 ) ) ( not ( = ?auto_597234 ?auto_597241 ) ) ( not ( = ?auto_597234 ?auto_597242 ) ) ( not ( = ?auto_597235 ?auto_597236 ) ) ( not ( = ?auto_597235 ?auto_597237 ) ) ( not ( = ?auto_597235 ?auto_597238 ) ) ( not ( = ?auto_597235 ?auto_597239 ) ) ( not ( = ?auto_597235 ?auto_597240 ) ) ( not ( = ?auto_597235 ?auto_597241 ) ) ( not ( = ?auto_597235 ?auto_597242 ) ) ( not ( = ?auto_597236 ?auto_597237 ) ) ( not ( = ?auto_597236 ?auto_597238 ) ) ( not ( = ?auto_597236 ?auto_597239 ) ) ( not ( = ?auto_597236 ?auto_597240 ) ) ( not ( = ?auto_597236 ?auto_597241 ) ) ( not ( = ?auto_597236 ?auto_597242 ) ) ( not ( = ?auto_597237 ?auto_597238 ) ) ( not ( = ?auto_597237 ?auto_597239 ) ) ( not ( = ?auto_597237 ?auto_597240 ) ) ( not ( = ?auto_597237 ?auto_597241 ) ) ( not ( = ?auto_597237 ?auto_597242 ) ) ( not ( = ?auto_597238 ?auto_597239 ) ) ( not ( = ?auto_597238 ?auto_597240 ) ) ( not ( = ?auto_597238 ?auto_597241 ) ) ( not ( = ?auto_597238 ?auto_597242 ) ) ( not ( = ?auto_597239 ?auto_597240 ) ) ( not ( = ?auto_597239 ?auto_597241 ) ) ( not ( = ?auto_597239 ?auto_597242 ) ) ( not ( = ?auto_597240 ?auto_597241 ) ) ( not ( = ?auto_597240 ?auto_597242 ) ) ( not ( = ?auto_597241 ?auto_597242 ) ) ( ON ?auto_597240 ?auto_597241 ) ( ON ?auto_597239 ?auto_597240 ) ( ON ?auto_597238 ?auto_597239 ) ( ON ?auto_597237 ?auto_597238 ) ( ON ?auto_597236 ?auto_597237 ) ( ON ?auto_597235 ?auto_597236 ) ( ON ?auto_597234 ?auto_597235 ) ( CLEAR ?auto_597232 ) ( ON ?auto_597233 ?auto_597234 ) ( CLEAR ?auto_597233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_597225 ?auto_597226 ?auto_597227 ?auto_597228 ?auto_597229 ?auto_597230 ?auto_597231 ?auto_597232 ?auto_597233 )
      ( MAKE-17PILE ?auto_597225 ?auto_597226 ?auto_597227 ?auto_597228 ?auto_597229 ?auto_597230 ?auto_597231 ?auto_597232 ?auto_597233 ?auto_597234 ?auto_597235 ?auto_597236 ?auto_597237 ?auto_597238 ?auto_597239 ?auto_597240 ?auto_597241 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597260 - BLOCK
      ?auto_597261 - BLOCK
      ?auto_597262 - BLOCK
      ?auto_597263 - BLOCK
      ?auto_597264 - BLOCK
      ?auto_597265 - BLOCK
      ?auto_597266 - BLOCK
      ?auto_597267 - BLOCK
      ?auto_597268 - BLOCK
      ?auto_597269 - BLOCK
      ?auto_597270 - BLOCK
      ?auto_597271 - BLOCK
      ?auto_597272 - BLOCK
      ?auto_597273 - BLOCK
      ?auto_597274 - BLOCK
      ?auto_597275 - BLOCK
      ?auto_597276 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597276 ) ( ON-TABLE ?auto_597260 ) ( ON ?auto_597261 ?auto_597260 ) ( ON ?auto_597262 ?auto_597261 ) ( ON ?auto_597263 ?auto_597262 ) ( ON ?auto_597264 ?auto_597263 ) ( ON ?auto_597265 ?auto_597264 ) ( ON ?auto_597266 ?auto_597265 ) ( ON ?auto_597267 ?auto_597266 ) ( not ( = ?auto_597260 ?auto_597261 ) ) ( not ( = ?auto_597260 ?auto_597262 ) ) ( not ( = ?auto_597260 ?auto_597263 ) ) ( not ( = ?auto_597260 ?auto_597264 ) ) ( not ( = ?auto_597260 ?auto_597265 ) ) ( not ( = ?auto_597260 ?auto_597266 ) ) ( not ( = ?auto_597260 ?auto_597267 ) ) ( not ( = ?auto_597260 ?auto_597268 ) ) ( not ( = ?auto_597260 ?auto_597269 ) ) ( not ( = ?auto_597260 ?auto_597270 ) ) ( not ( = ?auto_597260 ?auto_597271 ) ) ( not ( = ?auto_597260 ?auto_597272 ) ) ( not ( = ?auto_597260 ?auto_597273 ) ) ( not ( = ?auto_597260 ?auto_597274 ) ) ( not ( = ?auto_597260 ?auto_597275 ) ) ( not ( = ?auto_597260 ?auto_597276 ) ) ( not ( = ?auto_597261 ?auto_597262 ) ) ( not ( = ?auto_597261 ?auto_597263 ) ) ( not ( = ?auto_597261 ?auto_597264 ) ) ( not ( = ?auto_597261 ?auto_597265 ) ) ( not ( = ?auto_597261 ?auto_597266 ) ) ( not ( = ?auto_597261 ?auto_597267 ) ) ( not ( = ?auto_597261 ?auto_597268 ) ) ( not ( = ?auto_597261 ?auto_597269 ) ) ( not ( = ?auto_597261 ?auto_597270 ) ) ( not ( = ?auto_597261 ?auto_597271 ) ) ( not ( = ?auto_597261 ?auto_597272 ) ) ( not ( = ?auto_597261 ?auto_597273 ) ) ( not ( = ?auto_597261 ?auto_597274 ) ) ( not ( = ?auto_597261 ?auto_597275 ) ) ( not ( = ?auto_597261 ?auto_597276 ) ) ( not ( = ?auto_597262 ?auto_597263 ) ) ( not ( = ?auto_597262 ?auto_597264 ) ) ( not ( = ?auto_597262 ?auto_597265 ) ) ( not ( = ?auto_597262 ?auto_597266 ) ) ( not ( = ?auto_597262 ?auto_597267 ) ) ( not ( = ?auto_597262 ?auto_597268 ) ) ( not ( = ?auto_597262 ?auto_597269 ) ) ( not ( = ?auto_597262 ?auto_597270 ) ) ( not ( = ?auto_597262 ?auto_597271 ) ) ( not ( = ?auto_597262 ?auto_597272 ) ) ( not ( = ?auto_597262 ?auto_597273 ) ) ( not ( = ?auto_597262 ?auto_597274 ) ) ( not ( = ?auto_597262 ?auto_597275 ) ) ( not ( = ?auto_597262 ?auto_597276 ) ) ( not ( = ?auto_597263 ?auto_597264 ) ) ( not ( = ?auto_597263 ?auto_597265 ) ) ( not ( = ?auto_597263 ?auto_597266 ) ) ( not ( = ?auto_597263 ?auto_597267 ) ) ( not ( = ?auto_597263 ?auto_597268 ) ) ( not ( = ?auto_597263 ?auto_597269 ) ) ( not ( = ?auto_597263 ?auto_597270 ) ) ( not ( = ?auto_597263 ?auto_597271 ) ) ( not ( = ?auto_597263 ?auto_597272 ) ) ( not ( = ?auto_597263 ?auto_597273 ) ) ( not ( = ?auto_597263 ?auto_597274 ) ) ( not ( = ?auto_597263 ?auto_597275 ) ) ( not ( = ?auto_597263 ?auto_597276 ) ) ( not ( = ?auto_597264 ?auto_597265 ) ) ( not ( = ?auto_597264 ?auto_597266 ) ) ( not ( = ?auto_597264 ?auto_597267 ) ) ( not ( = ?auto_597264 ?auto_597268 ) ) ( not ( = ?auto_597264 ?auto_597269 ) ) ( not ( = ?auto_597264 ?auto_597270 ) ) ( not ( = ?auto_597264 ?auto_597271 ) ) ( not ( = ?auto_597264 ?auto_597272 ) ) ( not ( = ?auto_597264 ?auto_597273 ) ) ( not ( = ?auto_597264 ?auto_597274 ) ) ( not ( = ?auto_597264 ?auto_597275 ) ) ( not ( = ?auto_597264 ?auto_597276 ) ) ( not ( = ?auto_597265 ?auto_597266 ) ) ( not ( = ?auto_597265 ?auto_597267 ) ) ( not ( = ?auto_597265 ?auto_597268 ) ) ( not ( = ?auto_597265 ?auto_597269 ) ) ( not ( = ?auto_597265 ?auto_597270 ) ) ( not ( = ?auto_597265 ?auto_597271 ) ) ( not ( = ?auto_597265 ?auto_597272 ) ) ( not ( = ?auto_597265 ?auto_597273 ) ) ( not ( = ?auto_597265 ?auto_597274 ) ) ( not ( = ?auto_597265 ?auto_597275 ) ) ( not ( = ?auto_597265 ?auto_597276 ) ) ( not ( = ?auto_597266 ?auto_597267 ) ) ( not ( = ?auto_597266 ?auto_597268 ) ) ( not ( = ?auto_597266 ?auto_597269 ) ) ( not ( = ?auto_597266 ?auto_597270 ) ) ( not ( = ?auto_597266 ?auto_597271 ) ) ( not ( = ?auto_597266 ?auto_597272 ) ) ( not ( = ?auto_597266 ?auto_597273 ) ) ( not ( = ?auto_597266 ?auto_597274 ) ) ( not ( = ?auto_597266 ?auto_597275 ) ) ( not ( = ?auto_597266 ?auto_597276 ) ) ( not ( = ?auto_597267 ?auto_597268 ) ) ( not ( = ?auto_597267 ?auto_597269 ) ) ( not ( = ?auto_597267 ?auto_597270 ) ) ( not ( = ?auto_597267 ?auto_597271 ) ) ( not ( = ?auto_597267 ?auto_597272 ) ) ( not ( = ?auto_597267 ?auto_597273 ) ) ( not ( = ?auto_597267 ?auto_597274 ) ) ( not ( = ?auto_597267 ?auto_597275 ) ) ( not ( = ?auto_597267 ?auto_597276 ) ) ( not ( = ?auto_597268 ?auto_597269 ) ) ( not ( = ?auto_597268 ?auto_597270 ) ) ( not ( = ?auto_597268 ?auto_597271 ) ) ( not ( = ?auto_597268 ?auto_597272 ) ) ( not ( = ?auto_597268 ?auto_597273 ) ) ( not ( = ?auto_597268 ?auto_597274 ) ) ( not ( = ?auto_597268 ?auto_597275 ) ) ( not ( = ?auto_597268 ?auto_597276 ) ) ( not ( = ?auto_597269 ?auto_597270 ) ) ( not ( = ?auto_597269 ?auto_597271 ) ) ( not ( = ?auto_597269 ?auto_597272 ) ) ( not ( = ?auto_597269 ?auto_597273 ) ) ( not ( = ?auto_597269 ?auto_597274 ) ) ( not ( = ?auto_597269 ?auto_597275 ) ) ( not ( = ?auto_597269 ?auto_597276 ) ) ( not ( = ?auto_597270 ?auto_597271 ) ) ( not ( = ?auto_597270 ?auto_597272 ) ) ( not ( = ?auto_597270 ?auto_597273 ) ) ( not ( = ?auto_597270 ?auto_597274 ) ) ( not ( = ?auto_597270 ?auto_597275 ) ) ( not ( = ?auto_597270 ?auto_597276 ) ) ( not ( = ?auto_597271 ?auto_597272 ) ) ( not ( = ?auto_597271 ?auto_597273 ) ) ( not ( = ?auto_597271 ?auto_597274 ) ) ( not ( = ?auto_597271 ?auto_597275 ) ) ( not ( = ?auto_597271 ?auto_597276 ) ) ( not ( = ?auto_597272 ?auto_597273 ) ) ( not ( = ?auto_597272 ?auto_597274 ) ) ( not ( = ?auto_597272 ?auto_597275 ) ) ( not ( = ?auto_597272 ?auto_597276 ) ) ( not ( = ?auto_597273 ?auto_597274 ) ) ( not ( = ?auto_597273 ?auto_597275 ) ) ( not ( = ?auto_597273 ?auto_597276 ) ) ( not ( = ?auto_597274 ?auto_597275 ) ) ( not ( = ?auto_597274 ?auto_597276 ) ) ( not ( = ?auto_597275 ?auto_597276 ) ) ( ON ?auto_597275 ?auto_597276 ) ( ON ?auto_597274 ?auto_597275 ) ( ON ?auto_597273 ?auto_597274 ) ( ON ?auto_597272 ?auto_597273 ) ( ON ?auto_597271 ?auto_597272 ) ( ON ?auto_597270 ?auto_597271 ) ( ON ?auto_597269 ?auto_597270 ) ( CLEAR ?auto_597267 ) ( ON ?auto_597268 ?auto_597269 ) ( CLEAR ?auto_597268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_597260 ?auto_597261 ?auto_597262 ?auto_597263 ?auto_597264 ?auto_597265 ?auto_597266 ?auto_597267 ?auto_597268 )
      ( MAKE-17PILE ?auto_597260 ?auto_597261 ?auto_597262 ?auto_597263 ?auto_597264 ?auto_597265 ?auto_597266 ?auto_597267 ?auto_597268 ?auto_597269 ?auto_597270 ?auto_597271 ?auto_597272 ?auto_597273 ?auto_597274 ?auto_597275 ?auto_597276 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597294 - BLOCK
      ?auto_597295 - BLOCK
      ?auto_597296 - BLOCK
      ?auto_597297 - BLOCK
      ?auto_597298 - BLOCK
      ?auto_597299 - BLOCK
      ?auto_597300 - BLOCK
      ?auto_597301 - BLOCK
      ?auto_597302 - BLOCK
      ?auto_597303 - BLOCK
      ?auto_597304 - BLOCK
      ?auto_597305 - BLOCK
      ?auto_597306 - BLOCK
      ?auto_597307 - BLOCK
      ?auto_597308 - BLOCK
      ?auto_597309 - BLOCK
      ?auto_597310 - BLOCK
    )
    :vars
    (
      ?auto_597311 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597310 ?auto_597311 ) ( ON-TABLE ?auto_597294 ) ( ON ?auto_597295 ?auto_597294 ) ( ON ?auto_597296 ?auto_597295 ) ( ON ?auto_597297 ?auto_597296 ) ( ON ?auto_597298 ?auto_597297 ) ( ON ?auto_597299 ?auto_597298 ) ( ON ?auto_597300 ?auto_597299 ) ( not ( = ?auto_597294 ?auto_597295 ) ) ( not ( = ?auto_597294 ?auto_597296 ) ) ( not ( = ?auto_597294 ?auto_597297 ) ) ( not ( = ?auto_597294 ?auto_597298 ) ) ( not ( = ?auto_597294 ?auto_597299 ) ) ( not ( = ?auto_597294 ?auto_597300 ) ) ( not ( = ?auto_597294 ?auto_597301 ) ) ( not ( = ?auto_597294 ?auto_597302 ) ) ( not ( = ?auto_597294 ?auto_597303 ) ) ( not ( = ?auto_597294 ?auto_597304 ) ) ( not ( = ?auto_597294 ?auto_597305 ) ) ( not ( = ?auto_597294 ?auto_597306 ) ) ( not ( = ?auto_597294 ?auto_597307 ) ) ( not ( = ?auto_597294 ?auto_597308 ) ) ( not ( = ?auto_597294 ?auto_597309 ) ) ( not ( = ?auto_597294 ?auto_597310 ) ) ( not ( = ?auto_597294 ?auto_597311 ) ) ( not ( = ?auto_597295 ?auto_597296 ) ) ( not ( = ?auto_597295 ?auto_597297 ) ) ( not ( = ?auto_597295 ?auto_597298 ) ) ( not ( = ?auto_597295 ?auto_597299 ) ) ( not ( = ?auto_597295 ?auto_597300 ) ) ( not ( = ?auto_597295 ?auto_597301 ) ) ( not ( = ?auto_597295 ?auto_597302 ) ) ( not ( = ?auto_597295 ?auto_597303 ) ) ( not ( = ?auto_597295 ?auto_597304 ) ) ( not ( = ?auto_597295 ?auto_597305 ) ) ( not ( = ?auto_597295 ?auto_597306 ) ) ( not ( = ?auto_597295 ?auto_597307 ) ) ( not ( = ?auto_597295 ?auto_597308 ) ) ( not ( = ?auto_597295 ?auto_597309 ) ) ( not ( = ?auto_597295 ?auto_597310 ) ) ( not ( = ?auto_597295 ?auto_597311 ) ) ( not ( = ?auto_597296 ?auto_597297 ) ) ( not ( = ?auto_597296 ?auto_597298 ) ) ( not ( = ?auto_597296 ?auto_597299 ) ) ( not ( = ?auto_597296 ?auto_597300 ) ) ( not ( = ?auto_597296 ?auto_597301 ) ) ( not ( = ?auto_597296 ?auto_597302 ) ) ( not ( = ?auto_597296 ?auto_597303 ) ) ( not ( = ?auto_597296 ?auto_597304 ) ) ( not ( = ?auto_597296 ?auto_597305 ) ) ( not ( = ?auto_597296 ?auto_597306 ) ) ( not ( = ?auto_597296 ?auto_597307 ) ) ( not ( = ?auto_597296 ?auto_597308 ) ) ( not ( = ?auto_597296 ?auto_597309 ) ) ( not ( = ?auto_597296 ?auto_597310 ) ) ( not ( = ?auto_597296 ?auto_597311 ) ) ( not ( = ?auto_597297 ?auto_597298 ) ) ( not ( = ?auto_597297 ?auto_597299 ) ) ( not ( = ?auto_597297 ?auto_597300 ) ) ( not ( = ?auto_597297 ?auto_597301 ) ) ( not ( = ?auto_597297 ?auto_597302 ) ) ( not ( = ?auto_597297 ?auto_597303 ) ) ( not ( = ?auto_597297 ?auto_597304 ) ) ( not ( = ?auto_597297 ?auto_597305 ) ) ( not ( = ?auto_597297 ?auto_597306 ) ) ( not ( = ?auto_597297 ?auto_597307 ) ) ( not ( = ?auto_597297 ?auto_597308 ) ) ( not ( = ?auto_597297 ?auto_597309 ) ) ( not ( = ?auto_597297 ?auto_597310 ) ) ( not ( = ?auto_597297 ?auto_597311 ) ) ( not ( = ?auto_597298 ?auto_597299 ) ) ( not ( = ?auto_597298 ?auto_597300 ) ) ( not ( = ?auto_597298 ?auto_597301 ) ) ( not ( = ?auto_597298 ?auto_597302 ) ) ( not ( = ?auto_597298 ?auto_597303 ) ) ( not ( = ?auto_597298 ?auto_597304 ) ) ( not ( = ?auto_597298 ?auto_597305 ) ) ( not ( = ?auto_597298 ?auto_597306 ) ) ( not ( = ?auto_597298 ?auto_597307 ) ) ( not ( = ?auto_597298 ?auto_597308 ) ) ( not ( = ?auto_597298 ?auto_597309 ) ) ( not ( = ?auto_597298 ?auto_597310 ) ) ( not ( = ?auto_597298 ?auto_597311 ) ) ( not ( = ?auto_597299 ?auto_597300 ) ) ( not ( = ?auto_597299 ?auto_597301 ) ) ( not ( = ?auto_597299 ?auto_597302 ) ) ( not ( = ?auto_597299 ?auto_597303 ) ) ( not ( = ?auto_597299 ?auto_597304 ) ) ( not ( = ?auto_597299 ?auto_597305 ) ) ( not ( = ?auto_597299 ?auto_597306 ) ) ( not ( = ?auto_597299 ?auto_597307 ) ) ( not ( = ?auto_597299 ?auto_597308 ) ) ( not ( = ?auto_597299 ?auto_597309 ) ) ( not ( = ?auto_597299 ?auto_597310 ) ) ( not ( = ?auto_597299 ?auto_597311 ) ) ( not ( = ?auto_597300 ?auto_597301 ) ) ( not ( = ?auto_597300 ?auto_597302 ) ) ( not ( = ?auto_597300 ?auto_597303 ) ) ( not ( = ?auto_597300 ?auto_597304 ) ) ( not ( = ?auto_597300 ?auto_597305 ) ) ( not ( = ?auto_597300 ?auto_597306 ) ) ( not ( = ?auto_597300 ?auto_597307 ) ) ( not ( = ?auto_597300 ?auto_597308 ) ) ( not ( = ?auto_597300 ?auto_597309 ) ) ( not ( = ?auto_597300 ?auto_597310 ) ) ( not ( = ?auto_597300 ?auto_597311 ) ) ( not ( = ?auto_597301 ?auto_597302 ) ) ( not ( = ?auto_597301 ?auto_597303 ) ) ( not ( = ?auto_597301 ?auto_597304 ) ) ( not ( = ?auto_597301 ?auto_597305 ) ) ( not ( = ?auto_597301 ?auto_597306 ) ) ( not ( = ?auto_597301 ?auto_597307 ) ) ( not ( = ?auto_597301 ?auto_597308 ) ) ( not ( = ?auto_597301 ?auto_597309 ) ) ( not ( = ?auto_597301 ?auto_597310 ) ) ( not ( = ?auto_597301 ?auto_597311 ) ) ( not ( = ?auto_597302 ?auto_597303 ) ) ( not ( = ?auto_597302 ?auto_597304 ) ) ( not ( = ?auto_597302 ?auto_597305 ) ) ( not ( = ?auto_597302 ?auto_597306 ) ) ( not ( = ?auto_597302 ?auto_597307 ) ) ( not ( = ?auto_597302 ?auto_597308 ) ) ( not ( = ?auto_597302 ?auto_597309 ) ) ( not ( = ?auto_597302 ?auto_597310 ) ) ( not ( = ?auto_597302 ?auto_597311 ) ) ( not ( = ?auto_597303 ?auto_597304 ) ) ( not ( = ?auto_597303 ?auto_597305 ) ) ( not ( = ?auto_597303 ?auto_597306 ) ) ( not ( = ?auto_597303 ?auto_597307 ) ) ( not ( = ?auto_597303 ?auto_597308 ) ) ( not ( = ?auto_597303 ?auto_597309 ) ) ( not ( = ?auto_597303 ?auto_597310 ) ) ( not ( = ?auto_597303 ?auto_597311 ) ) ( not ( = ?auto_597304 ?auto_597305 ) ) ( not ( = ?auto_597304 ?auto_597306 ) ) ( not ( = ?auto_597304 ?auto_597307 ) ) ( not ( = ?auto_597304 ?auto_597308 ) ) ( not ( = ?auto_597304 ?auto_597309 ) ) ( not ( = ?auto_597304 ?auto_597310 ) ) ( not ( = ?auto_597304 ?auto_597311 ) ) ( not ( = ?auto_597305 ?auto_597306 ) ) ( not ( = ?auto_597305 ?auto_597307 ) ) ( not ( = ?auto_597305 ?auto_597308 ) ) ( not ( = ?auto_597305 ?auto_597309 ) ) ( not ( = ?auto_597305 ?auto_597310 ) ) ( not ( = ?auto_597305 ?auto_597311 ) ) ( not ( = ?auto_597306 ?auto_597307 ) ) ( not ( = ?auto_597306 ?auto_597308 ) ) ( not ( = ?auto_597306 ?auto_597309 ) ) ( not ( = ?auto_597306 ?auto_597310 ) ) ( not ( = ?auto_597306 ?auto_597311 ) ) ( not ( = ?auto_597307 ?auto_597308 ) ) ( not ( = ?auto_597307 ?auto_597309 ) ) ( not ( = ?auto_597307 ?auto_597310 ) ) ( not ( = ?auto_597307 ?auto_597311 ) ) ( not ( = ?auto_597308 ?auto_597309 ) ) ( not ( = ?auto_597308 ?auto_597310 ) ) ( not ( = ?auto_597308 ?auto_597311 ) ) ( not ( = ?auto_597309 ?auto_597310 ) ) ( not ( = ?auto_597309 ?auto_597311 ) ) ( not ( = ?auto_597310 ?auto_597311 ) ) ( ON ?auto_597309 ?auto_597310 ) ( ON ?auto_597308 ?auto_597309 ) ( ON ?auto_597307 ?auto_597308 ) ( ON ?auto_597306 ?auto_597307 ) ( ON ?auto_597305 ?auto_597306 ) ( ON ?auto_597304 ?auto_597305 ) ( ON ?auto_597303 ?auto_597304 ) ( ON ?auto_597302 ?auto_597303 ) ( CLEAR ?auto_597300 ) ( ON ?auto_597301 ?auto_597302 ) ( CLEAR ?auto_597301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_597294 ?auto_597295 ?auto_597296 ?auto_597297 ?auto_597298 ?auto_597299 ?auto_597300 ?auto_597301 )
      ( MAKE-17PILE ?auto_597294 ?auto_597295 ?auto_597296 ?auto_597297 ?auto_597298 ?auto_597299 ?auto_597300 ?auto_597301 ?auto_597302 ?auto_597303 ?auto_597304 ?auto_597305 ?auto_597306 ?auto_597307 ?auto_597308 ?auto_597309 ?auto_597310 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597329 - BLOCK
      ?auto_597330 - BLOCK
      ?auto_597331 - BLOCK
      ?auto_597332 - BLOCK
      ?auto_597333 - BLOCK
      ?auto_597334 - BLOCK
      ?auto_597335 - BLOCK
      ?auto_597336 - BLOCK
      ?auto_597337 - BLOCK
      ?auto_597338 - BLOCK
      ?auto_597339 - BLOCK
      ?auto_597340 - BLOCK
      ?auto_597341 - BLOCK
      ?auto_597342 - BLOCK
      ?auto_597343 - BLOCK
      ?auto_597344 - BLOCK
      ?auto_597345 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597345 ) ( ON-TABLE ?auto_597329 ) ( ON ?auto_597330 ?auto_597329 ) ( ON ?auto_597331 ?auto_597330 ) ( ON ?auto_597332 ?auto_597331 ) ( ON ?auto_597333 ?auto_597332 ) ( ON ?auto_597334 ?auto_597333 ) ( ON ?auto_597335 ?auto_597334 ) ( not ( = ?auto_597329 ?auto_597330 ) ) ( not ( = ?auto_597329 ?auto_597331 ) ) ( not ( = ?auto_597329 ?auto_597332 ) ) ( not ( = ?auto_597329 ?auto_597333 ) ) ( not ( = ?auto_597329 ?auto_597334 ) ) ( not ( = ?auto_597329 ?auto_597335 ) ) ( not ( = ?auto_597329 ?auto_597336 ) ) ( not ( = ?auto_597329 ?auto_597337 ) ) ( not ( = ?auto_597329 ?auto_597338 ) ) ( not ( = ?auto_597329 ?auto_597339 ) ) ( not ( = ?auto_597329 ?auto_597340 ) ) ( not ( = ?auto_597329 ?auto_597341 ) ) ( not ( = ?auto_597329 ?auto_597342 ) ) ( not ( = ?auto_597329 ?auto_597343 ) ) ( not ( = ?auto_597329 ?auto_597344 ) ) ( not ( = ?auto_597329 ?auto_597345 ) ) ( not ( = ?auto_597330 ?auto_597331 ) ) ( not ( = ?auto_597330 ?auto_597332 ) ) ( not ( = ?auto_597330 ?auto_597333 ) ) ( not ( = ?auto_597330 ?auto_597334 ) ) ( not ( = ?auto_597330 ?auto_597335 ) ) ( not ( = ?auto_597330 ?auto_597336 ) ) ( not ( = ?auto_597330 ?auto_597337 ) ) ( not ( = ?auto_597330 ?auto_597338 ) ) ( not ( = ?auto_597330 ?auto_597339 ) ) ( not ( = ?auto_597330 ?auto_597340 ) ) ( not ( = ?auto_597330 ?auto_597341 ) ) ( not ( = ?auto_597330 ?auto_597342 ) ) ( not ( = ?auto_597330 ?auto_597343 ) ) ( not ( = ?auto_597330 ?auto_597344 ) ) ( not ( = ?auto_597330 ?auto_597345 ) ) ( not ( = ?auto_597331 ?auto_597332 ) ) ( not ( = ?auto_597331 ?auto_597333 ) ) ( not ( = ?auto_597331 ?auto_597334 ) ) ( not ( = ?auto_597331 ?auto_597335 ) ) ( not ( = ?auto_597331 ?auto_597336 ) ) ( not ( = ?auto_597331 ?auto_597337 ) ) ( not ( = ?auto_597331 ?auto_597338 ) ) ( not ( = ?auto_597331 ?auto_597339 ) ) ( not ( = ?auto_597331 ?auto_597340 ) ) ( not ( = ?auto_597331 ?auto_597341 ) ) ( not ( = ?auto_597331 ?auto_597342 ) ) ( not ( = ?auto_597331 ?auto_597343 ) ) ( not ( = ?auto_597331 ?auto_597344 ) ) ( not ( = ?auto_597331 ?auto_597345 ) ) ( not ( = ?auto_597332 ?auto_597333 ) ) ( not ( = ?auto_597332 ?auto_597334 ) ) ( not ( = ?auto_597332 ?auto_597335 ) ) ( not ( = ?auto_597332 ?auto_597336 ) ) ( not ( = ?auto_597332 ?auto_597337 ) ) ( not ( = ?auto_597332 ?auto_597338 ) ) ( not ( = ?auto_597332 ?auto_597339 ) ) ( not ( = ?auto_597332 ?auto_597340 ) ) ( not ( = ?auto_597332 ?auto_597341 ) ) ( not ( = ?auto_597332 ?auto_597342 ) ) ( not ( = ?auto_597332 ?auto_597343 ) ) ( not ( = ?auto_597332 ?auto_597344 ) ) ( not ( = ?auto_597332 ?auto_597345 ) ) ( not ( = ?auto_597333 ?auto_597334 ) ) ( not ( = ?auto_597333 ?auto_597335 ) ) ( not ( = ?auto_597333 ?auto_597336 ) ) ( not ( = ?auto_597333 ?auto_597337 ) ) ( not ( = ?auto_597333 ?auto_597338 ) ) ( not ( = ?auto_597333 ?auto_597339 ) ) ( not ( = ?auto_597333 ?auto_597340 ) ) ( not ( = ?auto_597333 ?auto_597341 ) ) ( not ( = ?auto_597333 ?auto_597342 ) ) ( not ( = ?auto_597333 ?auto_597343 ) ) ( not ( = ?auto_597333 ?auto_597344 ) ) ( not ( = ?auto_597333 ?auto_597345 ) ) ( not ( = ?auto_597334 ?auto_597335 ) ) ( not ( = ?auto_597334 ?auto_597336 ) ) ( not ( = ?auto_597334 ?auto_597337 ) ) ( not ( = ?auto_597334 ?auto_597338 ) ) ( not ( = ?auto_597334 ?auto_597339 ) ) ( not ( = ?auto_597334 ?auto_597340 ) ) ( not ( = ?auto_597334 ?auto_597341 ) ) ( not ( = ?auto_597334 ?auto_597342 ) ) ( not ( = ?auto_597334 ?auto_597343 ) ) ( not ( = ?auto_597334 ?auto_597344 ) ) ( not ( = ?auto_597334 ?auto_597345 ) ) ( not ( = ?auto_597335 ?auto_597336 ) ) ( not ( = ?auto_597335 ?auto_597337 ) ) ( not ( = ?auto_597335 ?auto_597338 ) ) ( not ( = ?auto_597335 ?auto_597339 ) ) ( not ( = ?auto_597335 ?auto_597340 ) ) ( not ( = ?auto_597335 ?auto_597341 ) ) ( not ( = ?auto_597335 ?auto_597342 ) ) ( not ( = ?auto_597335 ?auto_597343 ) ) ( not ( = ?auto_597335 ?auto_597344 ) ) ( not ( = ?auto_597335 ?auto_597345 ) ) ( not ( = ?auto_597336 ?auto_597337 ) ) ( not ( = ?auto_597336 ?auto_597338 ) ) ( not ( = ?auto_597336 ?auto_597339 ) ) ( not ( = ?auto_597336 ?auto_597340 ) ) ( not ( = ?auto_597336 ?auto_597341 ) ) ( not ( = ?auto_597336 ?auto_597342 ) ) ( not ( = ?auto_597336 ?auto_597343 ) ) ( not ( = ?auto_597336 ?auto_597344 ) ) ( not ( = ?auto_597336 ?auto_597345 ) ) ( not ( = ?auto_597337 ?auto_597338 ) ) ( not ( = ?auto_597337 ?auto_597339 ) ) ( not ( = ?auto_597337 ?auto_597340 ) ) ( not ( = ?auto_597337 ?auto_597341 ) ) ( not ( = ?auto_597337 ?auto_597342 ) ) ( not ( = ?auto_597337 ?auto_597343 ) ) ( not ( = ?auto_597337 ?auto_597344 ) ) ( not ( = ?auto_597337 ?auto_597345 ) ) ( not ( = ?auto_597338 ?auto_597339 ) ) ( not ( = ?auto_597338 ?auto_597340 ) ) ( not ( = ?auto_597338 ?auto_597341 ) ) ( not ( = ?auto_597338 ?auto_597342 ) ) ( not ( = ?auto_597338 ?auto_597343 ) ) ( not ( = ?auto_597338 ?auto_597344 ) ) ( not ( = ?auto_597338 ?auto_597345 ) ) ( not ( = ?auto_597339 ?auto_597340 ) ) ( not ( = ?auto_597339 ?auto_597341 ) ) ( not ( = ?auto_597339 ?auto_597342 ) ) ( not ( = ?auto_597339 ?auto_597343 ) ) ( not ( = ?auto_597339 ?auto_597344 ) ) ( not ( = ?auto_597339 ?auto_597345 ) ) ( not ( = ?auto_597340 ?auto_597341 ) ) ( not ( = ?auto_597340 ?auto_597342 ) ) ( not ( = ?auto_597340 ?auto_597343 ) ) ( not ( = ?auto_597340 ?auto_597344 ) ) ( not ( = ?auto_597340 ?auto_597345 ) ) ( not ( = ?auto_597341 ?auto_597342 ) ) ( not ( = ?auto_597341 ?auto_597343 ) ) ( not ( = ?auto_597341 ?auto_597344 ) ) ( not ( = ?auto_597341 ?auto_597345 ) ) ( not ( = ?auto_597342 ?auto_597343 ) ) ( not ( = ?auto_597342 ?auto_597344 ) ) ( not ( = ?auto_597342 ?auto_597345 ) ) ( not ( = ?auto_597343 ?auto_597344 ) ) ( not ( = ?auto_597343 ?auto_597345 ) ) ( not ( = ?auto_597344 ?auto_597345 ) ) ( ON ?auto_597344 ?auto_597345 ) ( ON ?auto_597343 ?auto_597344 ) ( ON ?auto_597342 ?auto_597343 ) ( ON ?auto_597341 ?auto_597342 ) ( ON ?auto_597340 ?auto_597341 ) ( ON ?auto_597339 ?auto_597340 ) ( ON ?auto_597338 ?auto_597339 ) ( ON ?auto_597337 ?auto_597338 ) ( CLEAR ?auto_597335 ) ( ON ?auto_597336 ?auto_597337 ) ( CLEAR ?auto_597336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_597329 ?auto_597330 ?auto_597331 ?auto_597332 ?auto_597333 ?auto_597334 ?auto_597335 ?auto_597336 )
      ( MAKE-17PILE ?auto_597329 ?auto_597330 ?auto_597331 ?auto_597332 ?auto_597333 ?auto_597334 ?auto_597335 ?auto_597336 ?auto_597337 ?auto_597338 ?auto_597339 ?auto_597340 ?auto_597341 ?auto_597342 ?auto_597343 ?auto_597344 ?auto_597345 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597363 - BLOCK
      ?auto_597364 - BLOCK
      ?auto_597365 - BLOCK
      ?auto_597366 - BLOCK
      ?auto_597367 - BLOCK
      ?auto_597368 - BLOCK
      ?auto_597369 - BLOCK
      ?auto_597370 - BLOCK
      ?auto_597371 - BLOCK
      ?auto_597372 - BLOCK
      ?auto_597373 - BLOCK
      ?auto_597374 - BLOCK
      ?auto_597375 - BLOCK
      ?auto_597376 - BLOCK
      ?auto_597377 - BLOCK
      ?auto_597378 - BLOCK
      ?auto_597379 - BLOCK
    )
    :vars
    (
      ?auto_597380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597379 ?auto_597380 ) ( ON-TABLE ?auto_597363 ) ( ON ?auto_597364 ?auto_597363 ) ( ON ?auto_597365 ?auto_597364 ) ( ON ?auto_597366 ?auto_597365 ) ( ON ?auto_597367 ?auto_597366 ) ( ON ?auto_597368 ?auto_597367 ) ( not ( = ?auto_597363 ?auto_597364 ) ) ( not ( = ?auto_597363 ?auto_597365 ) ) ( not ( = ?auto_597363 ?auto_597366 ) ) ( not ( = ?auto_597363 ?auto_597367 ) ) ( not ( = ?auto_597363 ?auto_597368 ) ) ( not ( = ?auto_597363 ?auto_597369 ) ) ( not ( = ?auto_597363 ?auto_597370 ) ) ( not ( = ?auto_597363 ?auto_597371 ) ) ( not ( = ?auto_597363 ?auto_597372 ) ) ( not ( = ?auto_597363 ?auto_597373 ) ) ( not ( = ?auto_597363 ?auto_597374 ) ) ( not ( = ?auto_597363 ?auto_597375 ) ) ( not ( = ?auto_597363 ?auto_597376 ) ) ( not ( = ?auto_597363 ?auto_597377 ) ) ( not ( = ?auto_597363 ?auto_597378 ) ) ( not ( = ?auto_597363 ?auto_597379 ) ) ( not ( = ?auto_597363 ?auto_597380 ) ) ( not ( = ?auto_597364 ?auto_597365 ) ) ( not ( = ?auto_597364 ?auto_597366 ) ) ( not ( = ?auto_597364 ?auto_597367 ) ) ( not ( = ?auto_597364 ?auto_597368 ) ) ( not ( = ?auto_597364 ?auto_597369 ) ) ( not ( = ?auto_597364 ?auto_597370 ) ) ( not ( = ?auto_597364 ?auto_597371 ) ) ( not ( = ?auto_597364 ?auto_597372 ) ) ( not ( = ?auto_597364 ?auto_597373 ) ) ( not ( = ?auto_597364 ?auto_597374 ) ) ( not ( = ?auto_597364 ?auto_597375 ) ) ( not ( = ?auto_597364 ?auto_597376 ) ) ( not ( = ?auto_597364 ?auto_597377 ) ) ( not ( = ?auto_597364 ?auto_597378 ) ) ( not ( = ?auto_597364 ?auto_597379 ) ) ( not ( = ?auto_597364 ?auto_597380 ) ) ( not ( = ?auto_597365 ?auto_597366 ) ) ( not ( = ?auto_597365 ?auto_597367 ) ) ( not ( = ?auto_597365 ?auto_597368 ) ) ( not ( = ?auto_597365 ?auto_597369 ) ) ( not ( = ?auto_597365 ?auto_597370 ) ) ( not ( = ?auto_597365 ?auto_597371 ) ) ( not ( = ?auto_597365 ?auto_597372 ) ) ( not ( = ?auto_597365 ?auto_597373 ) ) ( not ( = ?auto_597365 ?auto_597374 ) ) ( not ( = ?auto_597365 ?auto_597375 ) ) ( not ( = ?auto_597365 ?auto_597376 ) ) ( not ( = ?auto_597365 ?auto_597377 ) ) ( not ( = ?auto_597365 ?auto_597378 ) ) ( not ( = ?auto_597365 ?auto_597379 ) ) ( not ( = ?auto_597365 ?auto_597380 ) ) ( not ( = ?auto_597366 ?auto_597367 ) ) ( not ( = ?auto_597366 ?auto_597368 ) ) ( not ( = ?auto_597366 ?auto_597369 ) ) ( not ( = ?auto_597366 ?auto_597370 ) ) ( not ( = ?auto_597366 ?auto_597371 ) ) ( not ( = ?auto_597366 ?auto_597372 ) ) ( not ( = ?auto_597366 ?auto_597373 ) ) ( not ( = ?auto_597366 ?auto_597374 ) ) ( not ( = ?auto_597366 ?auto_597375 ) ) ( not ( = ?auto_597366 ?auto_597376 ) ) ( not ( = ?auto_597366 ?auto_597377 ) ) ( not ( = ?auto_597366 ?auto_597378 ) ) ( not ( = ?auto_597366 ?auto_597379 ) ) ( not ( = ?auto_597366 ?auto_597380 ) ) ( not ( = ?auto_597367 ?auto_597368 ) ) ( not ( = ?auto_597367 ?auto_597369 ) ) ( not ( = ?auto_597367 ?auto_597370 ) ) ( not ( = ?auto_597367 ?auto_597371 ) ) ( not ( = ?auto_597367 ?auto_597372 ) ) ( not ( = ?auto_597367 ?auto_597373 ) ) ( not ( = ?auto_597367 ?auto_597374 ) ) ( not ( = ?auto_597367 ?auto_597375 ) ) ( not ( = ?auto_597367 ?auto_597376 ) ) ( not ( = ?auto_597367 ?auto_597377 ) ) ( not ( = ?auto_597367 ?auto_597378 ) ) ( not ( = ?auto_597367 ?auto_597379 ) ) ( not ( = ?auto_597367 ?auto_597380 ) ) ( not ( = ?auto_597368 ?auto_597369 ) ) ( not ( = ?auto_597368 ?auto_597370 ) ) ( not ( = ?auto_597368 ?auto_597371 ) ) ( not ( = ?auto_597368 ?auto_597372 ) ) ( not ( = ?auto_597368 ?auto_597373 ) ) ( not ( = ?auto_597368 ?auto_597374 ) ) ( not ( = ?auto_597368 ?auto_597375 ) ) ( not ( = ?auto_597368 ?auto_597376 ) ) ( not ( = ?auto_597368 ?auto_597377 ) ) ( not ( = ?auto_597368 ?auto_597378 ) ) ( not ( = ?auto_597368 ?auto_597379 ) ) ( not ( = ?auto_597368 ?auto_597380 ) ) ( not ( = ?auto_597369 ?auto_597370 ) ) ( not ( = ?auto_597369 ?auto_597371 ) ) ( not ( = ?auto_597369 ?auto_597372 ) ) ( not ( = ?auto_597369 ?auto_597373 ) ) ( not ( = ?auto_597369 ?auto_597374 ) ) ( not ( = ?auto_597369 ?auto_597375 ) ) ( not ( = ?auto_597369 ?auto_597376 ) ) ( not ( = ?auto_597369 ?auto_597377 ) ) ( not ( = ?auto_597369 ?auto_597378 ) ) ( not ( = ?auto_597369 ?auto_597379 ) ) ( not ( = ?auto_597369 ?auto_597380 ) ) ( not ( = ?auto_597370 ?auto_597371 ) ) ( not ( = ?auto_597370 ?auto_597372 ) ) ( not ( = ?auto_597370 ?auto_597373 ) ) ( not ( = ?auto_597370 ?auto_597374 ) ) ( not ( = ?auto_597370 ?auto_597375 ) ) ( not ( = ?auto_597370 ?auto_597376 ) ) ( not ( = ?auto_597370 ?auto_597377 ) ) ( not ( = ?auto_597370 ?auto_597378 ) ) ( not ( = ?auto_597370 ?auto_597379 ) ) ( not ( = ?auto_597370 ?auto_597380 ) ) ( not ( = ?auto_597371 ?auto_597372 ) ) ( not ( = ?auto_597371 ?auto_597373 ) ) ( not ( = ?auto_597371 ?auto_597374 ) ) ( not ( = ?auto_597371 ?auto_597375 ) ) ( not ( = ?auto_597371 ?auto_597376 ) ) ( not ( = ?auto_597371 ?auto_597377 ) ) ( not ( = ?auto_597371 ?auto_597378 ) ) ( not ( = ?auto_597371 ?auto_597379 ) ) ( not ( = ?auto_597371 ?auto_597380 ) ) ( not ( = ?auto_597372 ?auto_597373 ) ) ( not ( = ?auto_597372 ?auto_597374 ) ) ( not ( = ?auto_597372 ?auto_597375 ) ) ( not ( = ?auto_597372 ?auto_597376 ) ) ( not ( = ?auto_597372 ?auto_597377 ) ) ( not ( = ?auto_597372 ?auto_597378 ) ) ( not ( = ?auto_597372 ?auto_597379 ) ) ( not ( = ?auto_597372 ?auto_597380 ) ) ( not ( = ?auto_597373 ?auto_597374 ) ) ( not ( = ?auto_597373 ?auto_597375 ) ) ( not ( = ?auto_597373 ?auto_597376 ) ) ( not ( = ?auto_597373 ?auto_597377 ) ) ( not ( = ?auto_597373 ?auto_597378 ) ) ( not ( = ?auto_597373 ?auto_597379 ) ) ( not ( = ?auto_597373 ?auto_597380 ) ) ( not ( = ?auto_597374 ?auto_597375 ) ) ( not ( = ?auto_597374 ?auto_597376 ) ) ( not ( = ?auto_597374 ?auto_597377 ) ) ( not ( = ?auto_597374 ?auto_597378 ) ) ( not ( = ?auto_597374 ?auto_597379 ) ) ( not ( = ?auto_597374 ?auto_597380 ) ) ( not ( = ?auto_597375 ?auto_597376 ) ) ( not ( = ?auto_597375 ?auto_597377 ) ) ( not ( = ?auto_597375 ?auto_597378 ) ) ( not ( = ?auto_597375 ?auto_597379 ) ) ( not ( = ?auto_597375 ?auto_597380 ) ) ( not ( = ?auto_597376 ?auto_597377 ) ) ( not ( = ?auto_597376 ?auto_597378 ) ) ( not ( = ?auto_597376 ?auto_597379 ) ) ( not ( = ?auto_597376 ?auto_597380 ) ) ( not ( = ?auto_597377 ?auto_597378 ) ) ( not ( = ?auto_597377 ?auto_597379 ) ) ( not ( = ?auto_597377 ?auto_597380 ) ) ( not ( = ?auto_597378 ?auto_597379 ) ) ( not ( = ?auto_597378 ?auto_597380 ) ) ( not ( = ?auto_597379 ?auto_597380 ) ) ( ON ?auto_597378 ?auto_597379 ) ( ON ?auto_597377 ?auto_597378 ) ( ON ?auto_597376 ?auto_597377 ) ( ON ?auto_597375 ?auto_597376 ) ( ON ?auto_597374 ?auto_597375 ) ( ON ?auto_597373 ?auto_597374 ) ( ON ?auto_597372 ?auto_597373 ) ( ON ?auto_597371 ?auto_597372 ) ( ON ?auto_597370 ?auto_597371 ) ( CLEAR ?auto_597368 ) ( ON ?auto_597369 ?auto_597370 ) ( CLEAR ?auto_597369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_597363 ?auto_597364 ?auto_597365 ?auto_597366 ?auto_597367 ?auto_597368 ?auto_597369 )
      ( MAKE-17PILE ?auto_597363 ?auto_597364 ?auto_597365 ?auto_597366 ?auto_597367 ?auto_597368 ?auto_597369 ?auto_597370 ?auto_597371 ?auto_597372 ?auto_597373 ?auto_597374 ?auto_597375 ?auto_597376 ?auto_597377 ?auto_597378 ?auto_597379 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597398 - BLOCK
      ?auto_597399 - BLOCK
      ?auto_597400 - BLOCK
      ?auto_597401 - BLOCK
      ?auto_597402 - BLOCK
      ?auto_597403 - BLOCK
      ?auto_597404 - BLOCK
      ?auto_597405 - BLOCK
      ?auto_597406 - BLOCK
      ?auto_597407 - BLOCK
      ?auto_597408 - BLOCK
      ?auto_597409 - BLOCK
      ?auto_597410 - BLOCK
      ?auto_597411 - BLOCK
      ?auto_597412 - BLOCK
      ?auto_597413 - BLOCK
      ?auto_597414 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597414 ) ( ON-TABLE ?auto_597398 ) ( ON ?auto_597399 ?auto_597398 ) ( ON ?auto_597400 ?auto_597399 ) ( ON ?auto_597401 ?auto_597400 ) ( ON ?auto_597402 ?auto_597401 ) ( ON ?auto_597403 ?auto_597402 ) ( not ( = ?auto_597398 ?auto_597399 ) ) ( not ( = ?auto_597398 ?auto_597400 ) ) ( not ( = ?auto_597398 ?auto_597401 ) ) ( not ( = ?auto_597398 ?auto_597402 ) ) ( not ( = ?auto_597398 ?auto_597403 ) ) ( not ( = ?auto_597398 ?auto_597404 ) ) ( not ( = ?auto_597398 ?auto_597405 ) ) ( not ( = ?auto_597398 ?auto_597406 ) ) ( not ( = ?auto_597398 ?auto_597407 ) ) ( not ( = ?auto_597398 ?auto_597408 ) ) ( not ( = ?auto_597398 ?auto_597409 ) ) ( not ( = ?auto_597398 ?auto_597410 ) ) ( not ( = ?auto_597398 ?auto_597411 ) ) ( not ( = ?auto_597398 ?auto_597412 ) ) ( not ( = ?auto_597398 ?auto_597413 ) ) ( not ( = ?auto_597398 ?auto_597414 ) ) ( not ( = ?auto_597399 ?auto_597400 ) ) ( not ( = ?auto_597399 ?auto_597401 ) ) ( not ( = ?auto_597399 ?auto_597402 ) ) ( not ( = ?auto_597399 ?auto_597403 ) ) ( not ( = ?auto_597399 ?auto_597404 ) ) ( not ( = ?auto_597399 ?auto_597405 ) ) ( not ( = ?auto_597399 ?auto_597406 ) ) ( not ( = ?auto_597399 ?auto_597407 ) ) ( not ( = ?auto_597399 ?auto_597408 ) ) ( not ( = ?auto_597399 ?auto_597409 ) ) ( not ( = ?auto_597399 ?auto_597410 ) ) ( not ( = ?auto_597399 ?auto_597411 ) ) ( not ( = ?auto_597399 ?auto_597412 ) ) ( not ( = ?auto_597399 ?auto_597413 ) ) ( not ( = ?auto_597399 ?auto_597414 ) ) ( not ( = ?auto_597400 ?auto_597401 ) ) ( not ( = ?auto_597400 ?auto_597402 ) ) ( not ( = ?auto_597400 ?auto_597403 ) ) ( not ( = ?auto_597400 ?auto_597404 ) ) ( not ( = ?auto_597400 ?auto_597405 ) ) ( not ( = ?auto_597400 ?auto_597406 ) ) ( not ( = ?auto_597400 ?auto_597407 ) ) ( not ( = ?auto_597400 ?auto_597408 ) ) ( not ( = ?auto_597400 ?auto_597409 ) ) ( not ( = ?auto_597400 ?auto_597410 ) ) ( not ( = ?auto_597400 ?auto_597411 ) ) ( not ( = ?auto_597400 ?auto_597412 ) ) ( not ( = ?auto_597400 ?auto_597413 ) ) ( not ( = ?auto_597400 ?auto_597414 ) ) ( not ( = ?auto_597401 ?auto_597402 ) ) ( not ( = ?auto_597401 ?auto_597403 ) ) ( not ( = ?auto_597401 ?auto_597404 ) ) ( not ( = ?auto_597401 ?auto_597405 ) ) ( not ( = ?auto_597401 ?auto_597406 ) ) ( not ( = ?auto_597401 ?auto_597407 ) ) ( not ( = ?auto_597401 ?auto_597408 ) ) ( not ( = ?auto_597401 ?auto_597409 ) ) ( not ( = ?auto_597401 ?auto_597410 ) ) ( not ( = ?auto_597401 ?auto_597411 ) ) ( not ( = ?auto_597401 ?auto_597412 ) ) ( not ( = ?auto_597401 ?auto_597413 ) ) ( not ( = ?auto_597401 ?auto_597414 ) ) ( not ( = ?auto_597402 ?auto_597403 ) ) ( not ( = ?auto_597402 ?auto_597404 ) ) ( not ( = ?auto_597402 ?auto_597405 ) ) ( not ( = ?auto_597402 ?auto_597406 ) ) ( not ( = ?auto_597402 ?auto_597407 ) ) ( not ( = ?auto_597402 ?auto_597408 ) ) ( not ( = ?auto_597402 ?auto_597409 ) ) ( not ( = ?auto_597402 ?auto_597410 ) ) ( not ( = ?auto_597402 ?auto_597411 ) ) ( not ( = ?auto_597402 ?auto_597412 ) ) ( not ( = ?auto_597402 ?auto_597413 ) ) ( not ( = ?auto_597402 ?auto_597414 ) ) ( not ( = ?auto_597403 ?auto_597404 ) ) ( not ( = ?auto_597403 ?auto_597405 ) ) ( not ( = ?auto_597403 ?auto_597406 ) ) ( not ( = ?auto_597403 ?auto_597407 ) ) ( not ( = ?auto_597403 ?auto_597408 ) ) ( not ( = ?auto_597403 ?auto_597409 ) ) ( not ( = ?auto_597403 ?auto_597410 ) ) ( not ( = ?auto_597403 ?auto_597411 ) ) ( not ( = ?auto_597403 ?auto_597412 ) ) ( not ( = ?auto_597403 ?auto_597413 ) ) ( not ( = ?auto_597403 ?auto_597414 ) ) ( not ( = ?auto_597404 ?auto_597405 ) ) ( not ( = ?auto_597404 ?auto_597406 ) ) ( not ( = ?auto_597404 ?auto_597407 ) ) ( not ( = ?auto_597404 ?auto_597408 ) ) ( not ( = ?auto_597404 ?auto_597409 ) ) ( not ( = ?auto_597404 ?auto_597410 ) ) ( not ( = ?auto_597404 ?auto_597411 ) ) ( not ( = ?auto_597404 ?auto_597412 ) ) ( not ( = ?auto_597404 ?auto_597413 ) ) ( not ( = ?auto_597404 ?auto_597414 ) ) ( not ( = ?auto_597405 ?auto_597406 ) ) ( not ( = ?auto_597405 ?auto_597407 ) ) ( not ( = ?auto_597405 ?auto_597408 ) ) ( not ( = ?auto_597405 ?auto_597409 ) ) ( not ( = ?auto_597405 ?auto_597410 ) ) ( not ( = ?auto_597405 ?auto_597411 ) ) ( not ( = ?auto_597405 ?auto_597412 ) ) ( not ( = ?auto_597405 ?auto_597413 ) ) ( not ( = ?auto_597405 ?auto_597414 ) ) ( not ( = ?auto_597406 ?auto_597407 ) ) ( not ( = ?auto_597406 ?auto_597408 ) ) ( not ( = ?auto_597406 ?auto_597409 ) ) ( not ( = ?auto_597406 ?auto_597410 ) ) ( not ( = ?auto_597406 ?auto_597411 ) ) ( not ( = ?auto_597406 ?auto_597412 ) ) ( not ( = ?auto_597406 ?auto_597413 ) ) ( not ( = ?auto_597406 ?auto_597414 ) ) ( not ( = ?auto_597407 ?auto_597408 ) ) ( not ( = ?auto_597407 ?auto_597409 ) ) ( not ( = ?auto_597407 ?auto_597410 ) ) ( not ( = ?auto_597407 ?auto_597411 ) ) ( not ( = ?auto_597407 ?auto_597412 ) ) ( not ( = ?auto_597407 ?auto_597413 ) ) ( not ( = ?auto_597407 ?auto_597414 ) ) ( not ( = ?auto_597408 ?auto_597409 ) ) ( not ( = ?auto_597408 ?auto_597410 ) ) ( not ( = ?auto_597408 ?auto_597411 ) ) ( not ( = ?auto_597408 ?auto_597412 ) ) ( not ( = ?auto_597408 ?auto_597413 ) ) ( not ( = ?auto_597408 ?auto_597414 ) ) ( not ( = ?auto_597409 ?auto_597410 ) ) ( not ( = ?auto_597409 ?auto_597411 ) ) ( not ( = ?auto_597409 ?auto_597412 ) ) ( not ( = ?auto_597409 ?auto_597413 ) ) ( not ( = ?auto_597409 ?auto_597414 ) ) ( not ( = ?auto_597410 ?auto_597411 ) ) ( not ( = ?auto_597410 ?auto_597412 ) ) ( not ( = ?auto_597410 ?auto_597413 ) ) ( not ( = ?auto_597410 ?auto_597414 ) ) ( not ( = ?auto_597411 ?auto_597412 ) ) ( not ( = ?auto_597411 ?auto_597413 ) ) ( not ( = ?auto_597411 ?auto_597414 ) ) ( not ( = ?auto_597412 ?auto_597413 ) ) ( not ( = ?auto_597412 ?auto_597414 ) ) ( not ( = ?auto_597413 ?auto_597414 ) ) ( ON ?auto_597413 ?auto_597414 ) ( ON ?auto_597412 ?auto_597413 ) ( ON ?auto_597411 ?auto_597412 ) ( ON ?auto_597410 ?auto_597411 ) ( ON ?auto_597409 ?auto_597410 ) ( ON ?auto_597408 ?auto_597409 ) ( ON ?auto_597407 ?auto_597408 ) ( ON ?auto_597406 ?auto_597407 ) ( ON ?auto_597405 ?auto_597406 ) ( CLEAR ?auto_597403 ) ( ON ?auto_597404 ?auto_597405 ) ( CLEAR ?auto_597404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_597398 ?auto_597399 ?auto_597400 ?auto_597401 ?auto_597402 ?auto_597403 ?auto_597404 )
      ( MAKE-17PILE ?auto_597398 ?auto_597399 ?auto_597400 ?auto_597401 ?auto_597402 ?auto_597403 ?auto_597404 ?auto_597405 ?auto_597406 ?auto_597407 ?auto_597408 ?auto_597409 ?auto_597410 ?auto_597411 ?auto_597412 ?auto_597413 ?auto_597414 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597432 - BLOCK
      ?auto_597433 - BLOCK
      ?auto_597434 - BLOCK
      ?auto_597435 - BLOCK
      ?auto_597436 - BLOCK
      ?auto_597437 - BLOCK
      ?auto_597438 - BLOCK
      ?auto_597439 - BLOCK
      ?auto_597440 - BLOCK
      ?auto_597441 - BLOCK
      ?auto_597442 - BLOCK
      ?auto_597443 - BLOCK
      ?auto_597444 - BLOCK
      ?auto_597445 - BLOCK
      ?auto_597446 - BLOCK
      ?auto_597447 - BLOCK
      ?auto_597448 - BLOCK
    )
    :vars
    (
      ?auto_597449 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597448 ?auto_597449 ) ( ON-TABLE ?auto_597432 ) ( ON ?auto_597433 ?auto_597432 ) ( ON ?auto_597434 ?auto_597433 ) ( ON ?auto_597435 ?auto_597434 ) ( ON ?auto_597436 ?auto_597435 ) ( not ( = ?auto_597432 ?auto_597433 ) ) ( not ( = ?auto_597432 ?auto_597434 ) ) ( not ( = ?auto_597432 ?auto_597435 ) ) ( not ( = ?auto_597432 ?auto_597436 ) ) ( not ( = ?auto_597432 ?auto_597437 ) ) ( not ( = ?auto_597432 ?auto_597438 ) ) ( not ( = ?auto_597432 ?auto_597439 ) ) ( not ( = ?auto_597432 ?auto_597440 ) ) ( not ( = ?auto_597432 ?auto_597441 ) ) ( not ( = ?auto_597432 ?auto_597442 ) ) ( not ( = ?auto_597432 ?auto_597443 ) ) ( not ( = ?auto_597432 ?auto_597444 ) ) ( not ( = ?auto_597432 ?auto_597445 ) ) ( not ( = ?auto_597432 ?auto_597446 ) ) ( not ( = ?auto_597432 ?auto_597447 ) ) ( not ( = ?auto_597432 ?auto_597448 ) ) ( not ( = ?auto_597432 ?auto_597449 ) ) ( not ( = ?auto_597433 ?auto_597434 ) ) ( not ( = ?auto_597433 ?auto_597435 ) ) ( not ( = ?auto_597433 ?auto_597436 ) ) ( not ( = ?auto_597433 ?auto_597437 ) ) ( not ( = ?auto_597433 ?auto_597438 ) ) ( not ( = ?auto_597433 ?auto_597439 ) ) ( not ( = ?auto_597433 ?auto_597440 ) ) ( not ( = ?auto_597433 ?auto_597441 ) ) ( not ( = ?auto_597433 ?auto_597442 ) ) ( not ( = ?auto_597433 ?auto_597443 ) ) ( not ( = ?auto_597433 ?auto_597444 ) ) ( not ( = ?auto_597433 ?auto_597445 ) ) ( not ( = ?auto_597433 ?auto_597446 ) ) ( not ( = ?auto_597433 ?auto_597447 ) ) ( not ( = ?auto_597433 ?auto_597448 ) ) ( not ( = ?auto_597433 ?auto_597449 ) ) ( not ( = ?auto_597434 ?auto_597435 ) ) ( not ( = ?auto_597434 ?auto_597436 ) ) ( not ( = ?auto_597434 ?auto_597437 ) ) ( not ( = ?auto_597434 ?auto_597438 ) ) ( not ( = ?auto_597434 ?auto_597439 ) ) ( not ( = ?auto_597434 ?auto_597440 ) ) ( not ( = ?auto_597434 ?auto_597441 ) ) ( not ( = ?auto_597434 ?auto_597442 ) ) ( not ( = ?auto_597434 ?auto_597443 ) ) ( not ( = ?auto_597434 ?auto_597444 ) ) ( not ( = ?auto_597434 ?auto_597445 ) ) ( not ( = ?auto_597434 ?auto_597446 ) ) ( not ( = ?auto_597434 ?auto_597447 ) ) ( not ( = ?auto_597434 ?auto_597448 ) ) ( not ( = ?auto_597434 ?auto_597449 ) ) ( not ( = ?auto_597435 ?auto_597436 ) ) ( not ( = ?auto_597435 ?auto_597437 ) ) ( not ( = ?auto_597435 ?auto_597438 ) ) ( not ( = ?auto_597435 ?auto_597439 ) ) ( not ( = ?auto_597435 ?auto_597440 ) ) ( not ( = ?auto_597435 ?auto_597441 ) ) ( not ( = ?auto_597435 ?auto_597442 ) ) ( not ( = ?auto_597435 ?auto_597443 ) ) ( not ( = ?auto_597435 ?auto_597444 ) ) ( not ( = ?auto_597435 ?auto_597445 ) ) ( not ( = ?auto_597435 ?auto_597446 ) ) ( not ( = ?auto_597435 ?auto_597447 ) ) ( not ( = ?auto_597435 ?auto_597448 ) ) ( not ( = ?auto_597435 ?auto_597449 ) ) ( not ( = ?auto_597436 ?auto_597437 ) ) ( not ( = ?auto_597436 ?auto_597438 ) ) ( not ( = ?auto_597436 ?auto_597439 ) ) ( not ( = ?auto_597436 ?auto_597440 ) ) ( not ( = ?auto_597436 ?auto_597441 ) ) ( not ( = ?auto_597436 ?auto_597442 ) ) ( not ( = ?auto_597436 ?auto_597443 ) ) ( not ( = ?auto_597436 ?auto_597444 ) ) ( not ( = ?auto_597436 ?auto_597445 ) ) ( not ( = ?auto_597436 ?auto_597446 ) ) ( not ( = ?auto_597436 ?auto_597447 ) ) ( not ( = ?auto_597436 ?auto_597448 ) ) ( not ( = ?auto_597436 ?auto_597449 ) ) ( not ( = ?auto_597437 ?auto_597438 ) ) ( not ( = ?auto_597437 ?auto_597439 ) ) ( not ( = ?auto_597437 ?auto_597440 ) ) ( not ( = ?auto_597437 ?auto_597441 ) ) ( not ( = ?auto_597437 ?auto_597442 ) ) ( not ( = ?auto_597437 ?auto_597443 ) ) ( not ( = ?auto_597437 ?auto_597444 ) ) ( not ( = ?auto_597437 ?auto_597445 ) ) ( not ( = ?auto_597437 ?auto_597446 ) ) ( not ( = ?auto_597437 ?auto_597447 ) ) ( not ( = ?auto_597437 ?auto_597448 ) ) ( not ( = ?auto_597437 ?auto_597449 ) ) ( not ( = ?auto_597438 ?auto_597439 ) ) ( not ( = ?auto_597438 ?auto_597440 ) ) ( not ( = ?auto_597438 ?auto_597441 ) ) ( not ( = ?auto_597438 ?auto_597442 ) ) ( not ( = ?auto_597438 ?auto_597443 ) ) ( not ( = ?auto_597438 ?auto_597444 ) ) ( not ( = ?auto_597438 ?auto_597445 ) ) ( not ( = ?auto_597438 ?auto_597446 ) ) ( not ( = ?auto_597438 ?auto_597447 ) ) ( not ( = ?auto_597438 ?auto_597448 ) ) ( not ( = ?auto_597438 ?auto_597449 ) ) ( not ( = ?auto_597439 ?auto_597440 ) ) ( not ( = ?auto_597439 ?auto_597441 ) ) ( not ( = ?auto_597439 ?auto_597442 ) ) ( not ( = ?auto_597439 ?auto_597443 ) ) ( not ( = ?auto_597439 ?auto_597444 ) ) ( not ( = ?auto_597439 ?auto_597445 ) ) ( not ( = ?auto_597439 ?auto_597446 ) ) ( not ( = ?auto_597439 ?auto_597447 ) ) ( not ( = ?auto_597439 ?auto_597448 ) ) ( not ( = ?auto_597439 ?auto_597449 ) ) ( not ( = ?auto_597440 ?auto_597441 ) ) ( not ( = ?auto_597440 ?auto_597442 ) ) ( not ( = ?auto_597440 ?auto_597443 ) ) ( not ( = ?auto_597440 ?auto_597444 ) ) ( not ( = ?auto_597440 ?auto_597445 ) ) ( not ( = ?auto_597440 ?auto_597446 ) ) ( not ( = ?auto_597440 ?auto_597447 ) ) ( not ( = ?auto_597440 ?auto_597448 ) ) ( not ( = ?auto_597440 ?auto_597449 ) ) ( not ( = ?auto_597441 ?auto_597442 ) ) ( not ( = ?auto_597441 ?auto_597443 ) ) ( not ( = ?auto_597441 ?auto_597444 ) ) ( not ( = ?auto_597441 ?auto_597445 ) ) ( not ( = ?auto_597441 ?auto_597446 ) ) ( not ( = ?auto_597441 ?auto_597447 ) ) ( not ( = ?auto_597441 ?auto_597448 ) ) ( not ( = ?auto_597441 ?auto_597449 ) ) ( not ( = ?auto_597442 ?auto_597443 ) ) ( not ( = ?auto_597442 ?auto_597444 ) ) ( not ( = ?auto_597442 ?auto_597445 ) ) ( not ( = ?auto_597442 ?auto_597446 ) ) ( not ( = ?auto_597442 ?auto_597447 ) ) ( not ( = ?auto_597442 ?auto_597448 ) ) ( not ( = ?auto_597442 ?auto_597449 ) ) ( not ( = ?auto_597443 ?auto_597444 ) ) ( not ( = ?auto_597443 ?auto_597445 ) ) ( not ( = ?auto_597443 ?auto_597446 ) ) ( not ( = ?auto_597443 ?auto_597447 ) ) ( not ( = ?auto_597443 ?auto_597448 ) ) ( not ( = ?auto_597443 ?auto_597449 ) ) ( not ( = ?auto_597444 ?auto_597445 ) ) ( not ( = ?auto_597444 ?auto_597446 ) ) ( not ( = ?auto_597444 ?auto_597447 ) ) ( not ( = ?auto_597444 ?auto_597448 ) ) ( not ( = ?auto_597444 ?auto_597449 ) ) ( not ( = ?auto_597445 ?auto_597446 ) ) ( not ( = ?auto_597445 ?auto_597447 ) ) ( not ( = ?auto_597445 ?auto_597448 ) ) ( not ( = ?auto_597445 ?auto_597449 ) ) ( not ( = ?auto_597446 ?auto_597447 ) ) ( not ( = ?auto_597446 ?auto_597448 ) ) ( not ( = ?auto_597446 ?auto_597449 ) ) ( not ( = ?auto_597447 ?auto_597448 ) ) ( not ( = ?auto_597447 ?auto_597449 ) ) ( not ( = ?auto_597448 ?auto_597449 ) ) ( ON ?auto_597447 ?auto_597448 ) ( ON ?auto_597446 ?auto_597447 ) ( ON ?auto_597445 ?auto_597446 ) ( ON ?auto_597444 ?auto_597445 ) ( ON ?auto_597443 ?auto_597444 ) ( ON ?auto_597442 ?auto_597443 ) ( ON ?auto_597441 ?auto_597442 ) ( ON ?auto_597440 ?auto_597441 ) ( ON ?auto_597439 ?auto_597440 ) ( ON ?auto_597438 ?auto_597439 ) ( CLEAR ?auto_597436 ) ( ON ?auto_597437 ?auto_597438 ) ( CLEAR ?auto_597437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_597432 ?auto_597433 ?auto_597434 ?auto_597435 ?auto_597436 ?auto_597437 )
      ( MAKE-17PILE ?auto_597432 ?auto_597433 ?auto_597434 ?auto_597435 ?auto_597436 ?auto_597437 ?auto_597438 ?auto_597439 ?auto_597440 ?auto_597441 ?auto_597442 ?auto_597443 ?auto_597444 ?auto_597445 ?auto_597446 ?auto_597447 ?auto_597448 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597467 - BLOCK
      ?auto_597468 - BLOCK
      ?auto_597469 - BLOCK
      ?auto_597470 - BLOCK
      ?auto_597471 - BLOCK
      ?auto_597472 - BLOCK
      ?auto_597473 - BLOCK
      ?auto_597474 - BLOCK
      ?auto_597475 - BLOCK
      ?auto_597476 - BLOCK
      ?auto_597477 - BLOCK
      ?auto_597478 - BLOCK
      ?auto_597479 - BLOCK
      ?auto_597480 - BLOCK
      ?auto_597481 - BLOCK
      ?auto_597482 - BLOCK
      ?auto_597483 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597483 ) ( ON-TABLE ?auto_597467 ) ( ON ?auto_597468 ?auto_597467 ) ( ON ?auto_597469 ?auto_597468 ) ( ON ?auto_597470 ?auto_597469 ) ( ON ?auto_597471 ?auto_597470 ) ( not ( = ?auto_597467 ?auto_597468 ) ) ( not ( = ?auto_597467 ?auto_597469 ) ) ( not ( = ?auto_597467 ?auto_597470 ) ) ( not ( = ?auto_597467 ?auto_597471 ) ) ( not ( = ?auto_597467 ?auto_597472 ) ) ( not ( = ?auto_597467 ?auto_597473 ) ) ( not ( = ?auto_597467 ?auto_597474 ) ) ( not ( = ?auto_597467 ?auto_597475 ) ) ( not ( = ?auto_597467 ?auto_597476 ) ) ( not ( = ?auto_597467 ?auto_597477 ) ) ( not ( = ?auto_597467 ?auto_597478 ) ) ( not ( = ?auto_597467 ?auto_597479 ) ) ( not ( = ?auto_597467 ?auto_597480 ) ) ( not ( = ?auto_597467 ?auto_597481 ) ) ( not ( = ?auto_597467 ?auto_597482 ) ) ( not ( = ?auto_597467 ?auto_597483 ) ) ( not ( = ?auto_597468 ?auto_597469 ) ) ( not ( = ?auto_597468 ?auto_597470 ) ) ( not ( = ?auto_597468 ?auto_597471 ) ) ( not ( = ?auto_597468 ?auto_597472 ) ) ( not ( = ?auto_597468 ?auto_597473 ) ) ( not ( = ?auto_597468 ?auto_597474 ) ) ( not ( = ?auto_597468 ?auto_597475 ) ) ( not ( = ?auto_597468 ?auto_597476 ) ) ( not ( = ?auto_597468 ?auto_597477 ) ) ( not ( = ?auto_597468 ?auto_597478 ) ) ( not ( = ?auto_597468 ?auto_597479 ) ) ( not ( = ?auto_597468 ?auto_597480 ) ) ( not ( = ?auto_597468 ?auto_597481 ) ) ( not ( = ?auto_597468 ?auto_597482 ) ) ( not ( = ?auto_597468 ?auto_597483 ) ) ( not ( = ?auto_597469 ?auto_597470 ) ) ( not ( = ?auto_597469 ?auto_597471 ) ) ( not ( = ?auto_597469 ?auto_597472 ) ) ( not ( = ?auto_597469 ?auto_597473 ) ) ( not ( = ?auto_597469 ?auto_597474 ) ) ( not ( = ?auto_597469 ?auto_597475 ) ) ( not ( = ?auto_597469 ?auto_597476 ) ) ( not ( = ?auto_597469 ?auto_597477 ) ) ( not ( = ?auto_597469 ?auto_597478 ) ) ( not ( = ?auto_597469 ?auto_597479 ) ) ( not ( = ?auto_597469 ?auto_597480 ) ) ( not ( = ?auto_597469 ?auto_597481 ) ) ( not ( = ?auto_597469 ?auto_597482 ) ) ( not ( = ?auto_597469 ?auto_597483 ) ) ( not ( = ?auto_597470 ?auto_597471 ) ) ( not ( = ?auto_597470 ?auto_597472 ) ) ( not ( = ?auto_597470 ?auto_597473 ) ) ( not ( = ?auto_597470 ?auto_597474 ) ) ( not ( = ?auto_597470 ?auto_597475 ) ) ( not ( = ?auto_597470 ?auto_597476 ) ) ( not ( = ?auto_597470 ?auto_597477 ) ) ( not ( = ?auto_597470 ?auto_597478 ) ) ( not ( = ?auto_597470 ?auto_597479 ) ) ( not ( = ?auto_597470 ?auto_597480 ) ) ( not ( = ?auto_597470 ?auto_597481 ) ) ( not ( = ?auto_597470 ?auto_597482 ) ) ( not ( = ?auto_597470 ?auto_597483 ) ) ( not ( = ?auto_597471 ?auto_597472 ) ) ( not ( = ?auto_597471 ?auto_597473 ) ) ( not ( = ?auto_597471 ?auto_597474 ) ) ( not ( = ?auto_597471 ?auto_597475 ) ) ( not ( = ?auto_597471 ?auto_597476 ) ) ( not ( = ?auto_597471 ?auto_597477 ) ) ( not ( = ?auto_597471 ?auto_597478 ) ) ( not ( = ?auto_597471 ?auto_597479 ) ) ( not ( = ?auto_597471 ?auto_597480 ) ) ( not ( = ?auto_597471 ?auto_597481 ) ) ( not ( = ?auto_597471 ?auto_597482 ) ) ( not ( = ?auto_597471 ?auto_597483 ) ) ( not ( = ?auto_597472 ?auto_597473 ) ) ( not ( = ?auto_597472 ?auto_597474 ) ) ( not ( = ?auto_597472 ?auto_597475 ) ) ( not ( = ?auto_597472 ?auto_597476 ) ) ( not ( = ?auto_597472 ?auto_597477 ) ) ( not ( = ?auto_597472 ?auto_597478 ) ) ( not ( = ?auto_597472 ?auto_597479 ) ) ( not ( = ?auto_597472 ?auto_597480 ) ) ( not ( = ?auto_597472 ?auto_597481 ) ) ( not ( = ?auto_597472 ?auto_597482 ) ) ( not ( = ?auto_597472 ?auto_597483 ) ) ( not ( = ?auto_597473 ?auto_597474 ) ) ( not ( = ?auto_597473 ?auto_597475 ) ) ( not ( = ?auto_597473 ?auto_597476 ) ) ( not ( = ?auto_597473 ?auto_597477 ) ) ( not ( = ?auto_597473 ?auto_597478 ) ) ( not ( = ?auto_597473 ?auto_597479 ) ) ( not ( = ?auto_597473 ?auto_597480 ) ) ( not ( = ?auto_597473 ?auto_597481 ) ) ( not ( = ?auto_597473 ?auto_597482 ) ) ( not ( = ?auto_597473 ?auto_597483 ) ) ( not ( = ?auto_597474 ?auto_597475 ) ) ( not ( = ?auto_597474 ?auto_597476 ) ) ( not ( = ?auto_597474 ?auto_597477 ) ) ( not ( = ?auto_597474 ?auto_597478 ) ) ( not ( = ?auto_597474 ?auto_597479 ) ) ( not ( = ?auto_597474 ?auto_597480 ) ) ( not ( = ?auto_597474 ?auto_597481 ) ) ( not ( = ?auto_597474 ?auto_597482 ) ) ( not ( = ?auto_597474 ?auto_597483 ) ) ( not ( = ?auto_597475 ?auto_597476 ) ) ( not ( = ?auto_597475 ?auto_597477 ) ) ( not ( = ?auto_597475 ?auto_597478 ) ) ( not ( = ?auto_597475 ?auto_597479 ) ) ( not ( = ?auto_597475 ?auto_597480 ) ) ( not ( = ?auto_597475 ?auto_597481 ) ) ( not ( = ?auto_597475 ?auto_597482 ) ) ( not ( = ?auto_597475 ?auto_597483 ) ) ( not ( = ?auto_597476 ?auto_597477 ) ) ( not ( = ?auto_597476 ?auto_597478 ) ) ( not ( = ?auto_597476 ?auto_597479 ) ) ( not ( = ?auto_597476 ?auto_597480 ) ) ( not ( = ?auto_597476 ?auto_597481 ) ) ( not ( = ?auto_597476 ?auto_597482 ) ) ( not ( = ?auto_597476 ?auto_597483 ) ) ( not ( = ?auto_597477 ?auto_597478 ) ) ( not ( = ?auto_597477 ?auto_597479 ) ) ( not ( = ?auto_597477 ?auto_597480 ) ) ( not ( = ?auto_597477 ?auto_597481 ) ) ( not ( = ?auto_597477 ?auto_597482 ) ) ( not ( = ?auto_597477 ?auto_597483 ) ) ( not ( = ?auto_597478 ?auto_597479 ) ) ( not ( = ?auto_597478 ?auto_597480 ) ) ( not ( = ?auto_597478 ?auto_597481 ) ) ( not ( = ?auto_597478 ?auto_597482 ) ) ( not ( = ?auto_597478 ?auto_597483 ) ) ( not ( = ?auto_597479 ?auto_597480 ) ) ( not ( = ?auto_597479 ?auto_597481 ) ) ( not ( = ?auto_597479 ?auto_597482 ) ) ( not ( = ?auto_597479 ?auto_597483 ) ) ( not ( = ?auto_597480 ?auto_597481 ) ) ( not ( = ?auto_597480 ?auto_597482 ) ) ( not ( = ?auto_597480 ?auto_597483 ) ) ( not ( = ?auto_597481 ?auto_597482 ) ) ( not ( = ?auto_597481 ?auto_597483 ) ) ( not ( = ?auto_597482 ?auto_597483 ) ) ( ON ?auto_597482 ?auto_597483 ) ( ON ?auto_597481 ?auto_597482 ) ( ON ?auto_597480 ?auto_597481 ) ( ON ?auto_597479 ?auto_597480 ) ( ON ?auto_597478 ?auto_597479 ) ( ON ?auto_597477 ?auto_597478 ) ( ON ?auto_597476 ?auto_597477 ) ( ON ?auto_597475 ?auto_597476 ) ( ON ?auto_597474 ?auto_597475 ) ( ON ?auto_597473 ?auto_597474 ) ( CLEAR ?auto_597471 ) ( ON ?auto_597472 ?auto_597473 ) ( CLEAR ?auto_597472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_597467 ?auto_597468 ?auto_597469 ?auto_597470 ?auto_597471 ?auto_597472 )
      ( MAKE-17PILE ?auto_597467 ?auto_597468 ?auto_597469 ?auto_597470 ?auto_597471 ?auto_597472 ?auto_597473 ?auto_597474 ?auto_597475 ?auto_597476 ?auto_597477 ?auto_597478 ?auto_597479 ?auto_597480 ?auto_597481 ?auto_597482 ?auto_597483 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597501 - BLOCK
      ?auto_597502 - BLOCK
      ?auto_597503 - BLOCK
      ?auto_597504 - BLOCK
      ?auto_597505 - BLOCK
      ?auto_597506 - BLOCK
      ?auto_597507 - BLOCK
      ?auto_597508 - BLOCK
      ?auto_597509 - BLOCK
      ?auto_597510 - BLOCK
      ?auto_597511 - BLOCK
      ?auto_597512 - BLOCK
      ?auto_597513 - BLOCK
      ?auto_597514 - BLOCK
      ?auto_597515 - BLOCK
      ?auto_597516 - BLOCK
      ?auto_597517 - BLOCK
    )
    :vars
    (
      ?auto_597518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597517 ?auto_597518 ) ( ON-TABLE ?auto_597501 ) ( ON ?auto_597502 ?auto_597501 ) ( ON ?auto_597503 ?auto_597502 ) ( ON ?auto_597504 ?auto_597503 ) ( not ( = ?auto_597501 ?auto_597502 ) ) ( not ( = ?auto_597501 ?auto_597503 ) ) ( not ( = ?auto_597501 ?auto_597504 ) ) ( not ( = ?auto_597501 ?auto_597505 ) ) ( not ( = ?auto_597501 ?auto_597506 ) ) ( not ( = ?auto_597501 ?auto_597507 ) ) ( not ( = ?auto_597501 ?auto_597508 ) ) ( not ( = ?auto_597501 ?auto_597509 ) ) ( not ( = ?auto_597501 ?auto_597510 ) ) ( not ( = ?auto_597501 ?auto_597511 ) ) ( not ( = ?auto_597501 ?auto_597512 ) ) ( not ( = ?auto_597501 ?auto_597513 ) ) ( not ( = ?auto_597501 ?auto_597514 ) ) ( not ( = ?auto_597501 ?auto_597515 ) ) ( not ( = ?auto_597501 ?auto_597516 ) ) ( not ( = ?auto_597501 ?auto_597517 ) ) ( not ( = ?auto_597501 ?auto_597518 ) ) ( not ( = ?auto_597502 ?auto_597503 ) ) ( not ( = ?auto_597502 ?auto_597504 ) ) ( not ( = ?auto_597502 ?auto_597505 ) ) ( not ( = ?auto_597502 ?auto_597506 ) ) ( not ( = ?auto_597502 ?auto_597507 ) ) ( not ( = ?auto_597502 ?auto_597508 ) ) ( not ( = ?auto_597502 ?auto_597509 ) ) ( not ( = ?auto_597502 ?auto_597510 ) ) ( not ( = ?auto_597502 ?auto_597511 ) ) ( not ( = ?auto_597502 ?auto_597512 ) ) ( not ( = ?auto_597502 ?auto_597513 ) ) ( not ( = ?auto_597502 ?auto_597514 ) ) ( not ( = ?auto_597502 ?auto_597515 ) ) ( not ( = ?auto_597502 ?auto_597516 ) ) ( not ( = ?auto_597502 ?auto_597517 ) ) ( not ( = ?auto_597502 ?auto_597518 ) ) ( not ( = ?auto_597503 ?auto_597504 ) ) ( not ( = ?auto_597503 ?auto_597505 ) ) ( not ( = ?auto_597503 ?auto_597506 ) ) ( not ( = ?auto_597503 ?auto_597507 ) ) ( not ( = ?auto_597503 ?auto_597508 ) ) ( not ( = ?auto_597503 ?auto_597509 ) ) ( not ( = ?auto_597503 ?auto_597510 ) ) ( not ( = ?auto_597503 ?auto_597511 ) ) ( not ( = ?auto_597503 ?auto_597512 ) ) ( not ( = ?auto_597503 ?auto_597513 ) ) ( not ( = ?auto_597503 ?auto_597514 ) ) ( not ( = ?auto_597503 ?auto_597515 ) ) ( not ( = ?auto_597503 ?auto_597516 ) ) ( not ( = ?auto_597503 ?auto_597517 ) ) ( not ( = ?auto_597503 ?auto_597518 ) ) ( not ( = ?auto_597504 ?auto_597505 ) ) ( not ( = ?auto_597504 ?auto_597506 ) ) ( not ( = ?auto_597504 ?auto_597507 ) ) ( not ( = ?auto_597504 ?auto_597508 ) ) ( not ( = ?auto_597504 ?auto_597509 ) ) ( not ( = ?auto_597504 ?auto_597510 ) ) ( not ( = ?auto_597504 ?auto_597511 ) ) ( not ( = ?auto_597504 ?auto_597512 ) ) ( not ( = ?auto_597504 ?auto_597513 ) ) ( not ( = ?auto_597504 ?auto_597514 ) ) ( not ( = ?auto_597504 ?auto_597515 ) ) ( not ( = ?auto_597504 ?auto_597516 ) ) ( not ( = ?auto_597504 ?auto_597517 ) ) ( not ( = ?auto_597504 ?auto_597518 ) ) ( not ( = ?auto_597505 ?auto_597506 ) ) ( not ( = ?auto_597505 ?auto_597507 ) ) ( not ( = ?auto_597505 ?auto_597508 ) ) ( not ( = ?auto_597505 ?auto_597509 ) ) ( not ( = ?auto_597505 ?auto_597510 ) ) ( not ( = ?auto_597505 ?auto_597511 ) ) ( not ( = ?auto_597505 ?auto_597512 ) ) ( not ( = ?auto_597505 ?auto_597513 ) ) ( not ( = ?auto_597505 ?auto_597514 ) ) ( not ( = ?auto_597505 ?auto_597515 ) ) ( not ( = ?auto_597505 ?auto_597516 ) ) ( not ( = ?auto_597505 ?auto_597517 ) ) ( not ( = ?auto_597505 ?auto_597518 ) ) ( not ( = ?auto_597506 ?auto_597507 ) ) ( not ( = ?auto_597506 ?auto_597508 ) ) ( not ( = ?auto_597506 ?auto_597509 ) ) ( not ( = ?auto_597506 ?auto_597510 ) ) ( not ( = ?auto_597506 ?auto_597511 ) ) ( not ( = ?auto_597506 ?auto_597512 ) ) ( not ( = ?auto_597506 ?auto_597513 ) ) ( not ( = ?auto_597506 ?auto_597514 ) ) ( not ( = ?auto_597506 ?auto_597515 ) ) ( not ( = ?auto_597506 ?auto_597516 ) ) ( not ( = ?auto_597506 ?auto_597517 ) ) ( not ( = ?auto_597506 ?auto_597518 ) ) ( not ( = ?auto_597507 ?auto_597508 ) ) ( not ( = ?auto_597507 ?auto_597509 ) ) ( not ( = ?auto_597507 ?auto_597510 ) ) ( not ( = ?auto_597507 ?auto_597511 ) ) ( not ( = ?auto_597507 ?auto_597512 ) ) ( not ( = ?auto_597507 ?auto_597513 ) ) ( not ( = ?auto_597507 ?auto_597514 ) ) ( not ( = ?auto_597507 ?auto_597515 ) ) ( not ( = ?auto_597507 ?auto_597516 ) ) ( not ( = ?auto_597507 ?auto_597517 ) ) ( not ( = ?auto_597507 ?auto_597518 ) ) ( not ( = ?auto_597508 ?auto_597509 ) ) ( not ( = ?auto_597508 ?auto_597510 ) ) ( not ( = ?auto_597508 ?auto_597511 ) ) ( not ( = ?auto_597508 ?auto_597512 ) ) ( not ( = ?auto_597508 ?auto_597513 ) ) ( not ( = ?auto_597508 ?auto_597514 ) ) ( not ( = ?auto_597508 ?auto_597515 ) ) ( not ( = ?auto_597508 ?auto_597516 ) ) ( not ( = ?auto_597508 ?auto_597517 ) ) ( not ( = ?auto_597508 ?auto_597518 ) ) ( not ( = ?auto_597509 ?auto_597510 ) ) ( not ( = ?auto_597509 ?auto_597511 ) ) ( not ( = ?auto_597509 ?auto_597512 ) ) ( not ( = ?auto_597509 ?auto_597513 ) ) ( not ( = ?auto_597509 ?auto_597514 ) ) ( not ( = ?auto_597509 ?auto_597515 ) ) ( not ( = ?auto_597509 ?auto_597516 ) ) ( not ( = ?auto_597509 ?auto_597517 ) ) ( not ( = ?auto_597509 ?auto_597518 ) ) ( not ( = ?auto_597510 ?auto_597511 ) ) ( not ( = ?auto_597510 ?auto_597512 ) ) ( not ( = ?auto_597510 ?auto_597513 ) ) ( not ( = ?auto_597510 ?auto_597514 ) ) ( not ( = ?auto_597510 ?auto_597515 ) ) ( not ( = ?auto_597510 ?auto_597516 ) ) ( not ( = ?auto_597510 ?auto_597517 ) ) ( not ( = ?auto_597510 ?auto_597518 ) ) ( not ( = ?auto_597511 ?auto_597512 ) ) ( not ( = ?auto_597511 ?auto_597513 ) ) ( not ( = ?auto_597511 ?auto_597514 ) ) ( not ( = ?auto_597511 ?auto_597515 ) ) ( not ( = ?auto_597511 ?auto_597516 ) ) ( not ( = ?auto_597511 ?auto_597517 ) ) ( not ( = ?auto_597511 ?auto_597518 ) ) ( not ( = ?auto_597512 ?auto_597513 ) ) ( not ( = ?auto_597512 ?auto_597514 ) ) ( not ( = ?auto_597512 ?auto_597515 ) ) ( not ( = ?auto_597512 ?auto_597516 ) ) ( not ( = ?auto_597512 ?auto_597517 ) ) ( not ( = ?auto_597512 ?auto_597518 ) ) ( not ( = ?auto_597513 ?auto_597514 ) ) ( not ( = ?auto_597513 ?auto_597515 ) ) ( not ( = ?auto_597513 ?auto_597516 ) ) ( not ( = ?auto_597513 ?auto_597517 ) ) ( not ( = ?auto_597513 ?auto_597518 ) ) ( not ( = ?auto_597514 ?auto_597515 ) ) ( not ( = ?auto_597514 ?auto_597516 ) ) ( not ( = ?auto_597514 ?auto_597517 ) ) ( not ( = ?auto_597514 ?auto_597518 ) ) ( not ( = ?auto_597515 ?auto_597516 ) ) ( not ( = ?auto_597515 ?auto_597517 ) ) ( not ( = ?auto_597515 ?auto_597518 ) ) ( not ( = ?auto_597516 ?auto_597517 ) ) ( not ( = ?auto_597516 ?auto_597518 ) ) ( not ( = ?auto_597517 ?auto_597518 ) ) ( ON ?auto_597516 ?auto_597517 ) ( ON ?auto_597515 ?auto_597516 ) ( ON ?auto_597514 ?auto_597515 ) ( ON ?auto_597513 ?auto_597514 ) ( ON ?auto_597512 ?auto_597513 ) ( ON ?auto_597511 ?auto_597512 ) ( ON ?auto_597510 ?auto_597511 ) ( ON ?auto_597509 ?auto_597510 ) ( ON ?auto_597508 ?auto_597509 ) ( ON ?auto_597507 ?auto_597508 ) ( ON ?auto_597506 ?auto_597507 ) ( CLEAR ?auto_597504 ) ( ON ?auto_597505 ?auto_597506 ) ( CLEAR ?auto_597505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_597501 ?auto_597502 ?auto_597503 ?auto_597504 ?auto_597505 )
      ( MAKE-17PILE ?auto_597501 ?auto_597502 ?auto_597503 ?auto_597504 ?auto_597505 ?auto_597506 ?auto_597507 ?auto_597508 ?auto_597509 ?auto_597510 ?auto_597511 ?auto_597512 ?auto_597513 ?auto_597514 ?auto_597515 ?auto_597516 ?auto_597517 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597536 - BLOCK
      ?auto_597537 - BLOCK
      ?auto_597538 - BLOCK
      ?auto_597539 - BLOCK
      ?auto_597540 - BLOCK
      ?auto_597541 - BLOCK
      ?auto_597542 - BLOCK
      ?auto_597543 - BLOCK
      ?auto_597544 - BLOCK
      ?auto_597545 - BLOCK
      ?auto_597546 - BLOCK
      ?auto_597547 - BLOCK
      ?auto_597548 - BLOCK
      ?auto_597549 - BLOCK
      ?auto_597550 - BLOCK
      ?auto_597551 - BLOCK
      ?auto_597552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597552 ) ( ON-TABLE ?auto_597536 ) ( ON ?auto_597537 ?auto_597536 ) ( ON ?auto_597538 ?auto_597537 ) ( ON ?auto_597539 ?auto_597538 ) ( not ( = ?auto_597536 ?auto_597537 ) ) ( not ( = ?auto_597536 ?auto_597538 ) ) ( not ( = ?auto_597536 ?auto_597539 ) ) ( not ( = ?auto_597536 ?auto_597540 ) ) ( not ( = ?auto_597536 ?auto_597541 ) ) ( not ( = ?auto_597536 ?auto_597542 ) ) ( not ( = ?auto_597536 ?auto_597543 ) ) ( not ( = ?auto_597536 ?auto_597544 ) ) ( not ( = ?auto_597536 ?auto_597545 ) ) ( not ( = ?auto_597536 ?auto_597546 ) ) ( not ( = ?auto_597536 ?auto_597547 ) ) ( not ( = ?auto_597536 ?auto_597548 ) ) ( not ( = ?auto_597536 ?auto_597549 ) ) ( not ( = ?auto_597536 ?auto_597550 ) ) ( not ( = ?auto_597536 ?auto_597551 ) ) ( not ( = ?auto_597536 ?auto_597552 ) ) ( not ( = ?auto_597537 ?auto_597538 ) ) ( not ( = ?auto_597537 ?auto_597539 ) ) ( not ( = ?auto_597537 ?auto_597540 ) ) ( not ( = ?auto_597537 ?auto_597541 ) ) ( not ( = ?auto_597537 ?auto_597542 ) ) ( not ( = ?auto_597537 ?auto_597543 ) ) ( not ( = ?auto_597537 ?auto_597544 ) ) ( not ( = ?auto_597537 ?auto_597545 ) ) ( not ( = ?auto_597537 ?auto_597546 ) ) ( not ( = ?auto_597537 ?auto_597547 ) ) ( not ( = ?auto_597537 ?auto_597548 ) ) ( not ( = ?auto_597537 ?auto_597549 ) ) ( not ( = ?auto_597537 ?auto_597550 ) ) ( not ( = ?auto_597537 ?auto_597551 ) ) ( not ( = ?auto_597537 ?auto_597552 ) ) ( not ( = ?auto_597538 ?auto_597539 ) ) ( not ( = ?auto_597538 ?auto_597540 ) ) ( not ( = ?auto_597538 ?auto_597541 ) ) ( not ( = ?auto_597538 ?auto_597542 ) ) ( not ( = ?auto_597538 ?auto_597543 ) ) ( not ( = ?auto_597538 ?auto_597544 ) ) ( not ( = ?auto_597538 ?auto_597545 ) ) ( not ( = ?auto_597538 ?auto_597546 ) ) ( not ( = ?auto_597538 ?auto_597547 ) ) ( not ( = ?auto_597538 ?auto_597548 ) ) ( not ( = ?auto_597538 ?auto_597549 ) ) ( not ( = ?auto_597538 ?auto_597550 ) ) ( not ( = ?auto_597538 ?auto_597551 ) ) ( not ( = ?auto_597538 ?auto_597552 ) ) ( not ( = ?auto_597539 ?auto_597540 ) ) ( not ( = ?auto_597539 ?auto_597541 ) ) ( not ( = ?auto_597539 ?auto_597542 ) ) ( not ( = ?auto_597539 ?auto_597543 ) ) ( not ( = ?auto_597539 ?auto_597544 ) ) ( not ( = ?auto_597539 ?auto_597545 ) ) ( not ( = ?auto_597539 ?auto_597546 ) ) ( not ( = ?auto_597539 ?auto_597547 ) ) ( not ( = ?auto_597539 ?auto_597548 ) ) ( not ( = ?auto_597539 ?auto_597549 ) ) ( not ( = ?auto_597539 ?auto_597550 ) ) ( not ( = ?auto_597539 ?auto_597551 ) ) ( not ( = ?auto_597539 ?auto_597552 ) ) ( not ( = ?auto_597540 ?auto_597541 ) ) ( not ( = ?auto_597540 ?auto_597542 ) ) ( not ( = ?auto_597540 ?auto_597543 ) ) ( not ( = ?auto_597540 ?auto_597544 ) ) ( not ( = ?auto_597540 ?auto_597545 ) ) ( not ( = ?auto_597540 ?auto_597546 ) ) ( not ( = ?auto_597540 ?auto_597547 ) ) ( not ( = ?auto_597540 ?auto_597548 ) ) ( not ( = ?auto_597540 ?auto_597549 ) ) ( not ( = ?auto_597540 ?auto_597550 ) ) ( not ( = ?auto_597540 ?auto_597551 ) ) ( not ( = ?auto_597540 ?auto_597552 ) ) ( not ( = ?auto_597541 ?auto_597542 ) ) ( not ( = ?auto_597541 ?auto_597543 ) ) ( not ( = ?auto_597541 ?auto_597544 ) ) ( not ( = ?auto_597541 ?auto_597545 ) ) ( not ( = ?auto_597541 ?auto_597546 ) ) ( not ( = ?auto_597541 ?auto_597547 ) ) ( not ( = ?auto_597541 ?auto_597548 ) ) ( not ( = ?auto_597541 ?auto_597549 ) ) ( not ( = ?auto_597541 ?auto_597550 ) ) ( not ( = ?auto_597541 ?auto_597551 ) ) ( not ( = ?auto_597541 ?auto_597552 ) ) ( not ( = ?auto_597542 ?auto_597543 ) ) ( not ( = ?auto_597542 ?auto_597544 ) ) ( not ( = ?auto_597542 ?auto_597545 ) ) ( not ( = ?auto_597542 ?auto_597546 ) ) ( not ( = ?auto_597542 ?auto_597547 ) ) ( not ( = ?auto_597542 ?auto_597548 ) ) ( not ( = ?auto_597542 ?auto_597549 ) ) ( not ( = ?auto_597542 ?auto_597550 ) ) ( not ( = ?auto_597542 ?auto_597551 ) ) ( not ( = ?auto_597542 ?auto_597552 ) ) ( not ( = ?auto_597543 ?auto_597544 ) ) ( not ( = ?auto_597543 ?auto_597545 ) ) ( not ( = ?auto_597543 ?auto_597546 ) ) ( not ( = ?auto_597543 ?auto_597547 ) ) ( not ( = ?auto_597543 ?auto_597548 ) ) ( not ( = ?auto_597543 ?auto_597549 ) ) ( not ( = ?auto_597543 ?auto_597550 ) ) ( not ( = ?auto_597543 ?auto_597551 ) ) ( not ( = ?auto_597543 ?auto_597552 ) ) ( not ( = ?auto_597544 ?auto_597545 ) ) ( not ( = ?auto_597544 ?auto_597546 ) ) ( not ( = ?auto_597544 ?auto_597547 ) ) ( not ( = ?auto_597544 ?auto_597548 ) ) ( not ( = ?auto_597544 ?auto_597549 ) ) ( not ( = ?auto_597544 ?auto_597550 ) ) ( not ( = ?auto_597544 ?auto_597551 ) ) ( not ( = ?auto_597544 ?auto_597552 ) ) ( not ( = ?auto_597545 ?auto_597546 ) ) ( not ( = ?auto_597545 ?auto_597547 ) ) ( not ( = ?auto_597545 ?auto_597548 ) ) ( not ( = ?auto_597545 ?auto_597549 ) ) ( not ( = ?auto_597545 ?auto_597550 ) ) ( not ( = ?auto_597545 ?auto_597551 ) ) ( not ( = ?auto_597545 ?auto_597552 ) ) ( not ( = ?auto_597546 ?auto_597547 ) ) ( not ( = ?auto_597546 ?auto_597548 ) ) ( not ( = ?auto_597546 ?auto_597549 ) ) ( not ( = ?auto_597546 ?auto_597550 ) ) ( not ( = ?auto_597546 ?auto_597551 ) ) ( not ( = ?auto_597546 ?auto_597552 ) ) ( not ( = ?auto_597547 ?auto_597548 ) ) ( not ( = ?auto_597547 ?auto_597549 ) ) ( not ( = ?auto_597547 ?auto_597550 ) ) ( not ( = ?auto_597547 ?auto_597551 ) ) ( not ( = ?auto_597547 ?auto_597552 ) ) ( not ( = ?auto_597548 ?auto_597549 ) ) ( not ( = ?auto_597548 ?auto_597550 ) ) ( not ( = ?auto_597548 ?auto_597551 ) ) ( not ( = ?auto_597548 ?auto_597552 ) ) ( not ( = ?auto_597549 ?auto_597550 ) ) ( not ( = ?auto_597549 ?auto_597551 ) ) ( not ( = ?auto_597549 ?auto_597552 ) ) ( not ( = ?auto_597550 ?auto_597551 ) ) ( not ( = ?auto_597550 ?auto_597552 ) ) ( not ( = ?auto_597551 ?auto_597552 ) ) ( ON ?auto_597551 ?auto_597552 ) ( ON ?auto_597550 ?auto_597551 ) ( ON ?auto_597549 ?auto_597550 ) ( ON ?auto_597548 ?auto_597549 ) ( ON ?auto_597547 ?auto_597548 ) ( ON ?auto_597546 ?auto_597547 ) ( ON ?auto_597545 ?auto_597546 ) ( ON ?auto_597544 ?auto_597545 ) ( ON ?auto_597543 ?auto_597544 ) ( ON ?auto_597542 ?auto_597543 ) ( ON ?auto_597541 ?auto_597542 ) ( CLEAR ?auto_597539 ) ( ON ?auto_597540 ?auto_597541 ) ( CLEAR ?auto_597540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_597536 ?auto_597537 ?auto_597538 ?auto_597539 ?auto_597540 )
      ( MAKE-17PILE ?auto_597536 ?auto_597537 ?auto_597538 ?auto_597539 ?auto_597540 ?auto_597541 ?auto_597542 ?auto_597543 ?auto_597544 ?auto_597545 ?auto_597546 ?auto_597547 ?auto_597548 ?auto_597549 ?auto_597550 ?auto_597551 ?auto_597552 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597570 - BLOCK
      ?auto_597571 - BLOCK
      ?auto_597572 - BLOCK
      ?auto_597573 - BLOCK
      ?auto_597574 - BLOCK
      ?auto_597575 - BLOCK
      ?auto_597576 - BLOCK
      ?auto_597577 - BLOCK
      ?auto_597578 - BLOCK
      ?auto_597579 - BLOCK
      ?auto_597580 - BLOCK
      ?auto_597581 - BLOCK
      ?auto_597582 - BLOCK
      ?auto_597583 - BLOCK
      ?auto_597584 - BLOCK
      ?auto_597585 - BLOCK
      ?auto_597586 - BLOCK
    )
    :vars
    (
      ?auto_597587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597586 ?auto_597587 ) ( ON-TABLE ?auto_597570 ) ( ON ?auto_597571 ?auto_597570 ) ( ON ?auto_597572 ?auto_597571 ) ( not ( = ?auto_597570 ?auto_597571 ) ) ( not ( = ?auto_597570 ?auto_597572 ) ) ( not ( = ?auto_597570 ?auto_597573 ) ) ( not ( = ?auto_597570 ?auto_597574 ) ) ( not ( = ?auto_597570 ?auto_597575 ) ) ( not ( = ?auto_597570 ?auto_597576 ) ) ( not ( = ?auto_597570 ?auto_597577 ) ) ( not ( = ?auto_597570 ?auto_597578 ) ) ( not ( = ?auto_597570 ?auto_597579 ) ) ( not ( = ?auto_597570 ?auto_597580 ) ) ( not ( = ?auto_597570 ?auto_597581 ) ) ( not ( = ?auto_597570 ?auto_597582 ) ) ( not ( = ?auto_597570 ?auto_597583 ) ) ( not ( = ?auto_597570 ?auto_597584 ) ) ( not ( = ?auto_597570 ?auto_597585 ) ) ( not ( = ?auto_597570 ?auto_597586 ) ) ( not ( = ?auto_597570 ?auto_597587 ) ) ( not ( = ?auto_597571 ?auto_597572 ) ) ( not ( = ?auto_597571 ?auto_597573 ) ) ( not ( = ?auto_597571 ?auto_597574 ) ) ( not ( = ?auto_597571 ?auto_597575 ) ) ( not ( = ?auto_597571 ?auto_597576 ) ) ( not ( = ?auto_597571 ?auto_597577 ) ) ( not ( = ?auto_597571 ?auto_597578 ) ) ( not ( = ?auto_597571 ?auto_597579 ) ) ( not ( = ?auto_597571 ?auto_597580 ) ) ( not ( = ?auto_597571 ?auto_597581 ) ) ( not ( = ?auto_597571 ?auto_597582 ) ) ( not ( = ?auto_597571 ?auto_597583 ) ) ( not ( = ?auto_597571 ?auto_597584 ) ) ( not ( = ?auto_597571 ?auto_597585 ) ) ( not ( = ?auto_597571 ?auto_597586 ) ) ( not ( = ?auto_597571 ?auto_597587 ) ) ( not ( = ?auto_597572 ?auto_597573 ) ) ( not ( = ?auto_597572 ?auto_597574 ) ) ( not ( = ?auto_597572 ?auto_597575 ) ) ( not ( = ?auto_597572 ?auto_597576 ) ) ( not ( = ?auto_597572 ?auto_597577 ) ) ( not ( = ?auto_597572 ?auto_597578 ) ) ( not ( = ?auto_597572 ?auto_597579 ) ) ( not ( = ?auto_597572 ?auto_597580 ) ) ( not ( = ?auto_597572 ?auto_597581 ) ) ( not ( = ?auto_597572 ?auto_597582 ) ) ( not ( = ?auto_597572 ?auto_597583 ) ) ( not ( = ?auto_597572 ?auto_597584 ) ) ( not ( = ?auto_597572 ?auto_597585 ) ) ( not ( = ?auto_597572 ?auto_597586 ) ) ( not ( = ?auto_597572 ?auto_597587 ) ) ( not ( = ?auto_597573 ?auto_597574 ) ) ( not ( = ?auto_597573 ?auto_597575 ) ) ( not ( = ?auto_597573 ?auto_597576 ) ) ( not ( = ?auto_597573 ?auto_597577 ) ) ( not ( = ?auto_597573 ?auto_597578 ) ) ( not ( = ?auto_597573 ?auto_597579 ) ) ( not ( = ?auto_597573 ?auto_597580 ) ) ( not ( = ?auto_597573 ?auto_597581 ) ) ( not ( = ?auto_597573 ?auto_597582 ) ) ( not ( = ?auto_597573 ?auto_597583 ) ) ( not ( = ?auto_597573 ?auto_597584 ) ) ( not ( = ?auto_597573 ?auto_597585 ) ) ( not ( = ?auto_597573 ?auto_597586 ) ) ( not ( = ?auto_597573 ?auto_597587 ) ) ( not ( = ?auto_597574 ?auto_597575 ) ) ( not ( = ?auto_597574 ?auto_597576 ) ) ( not ( = ?auto_597574 ?auto_597577 ) ) ( not ( = ?auto_597574 ?auto_597578 ) ) ( not ( = ?auto_597574 ?auto_597579 ) ) ( not ( = ?auto_597574 ?auto_597580 ) ) ( not ( = ?auto_597574 ?auto_597581 ) ) ( not ( = ?auto_597574 ?auto_597582 ) ) ( not ( = ?auto_597574 ?auto_597583 ) ) ( not ( = ?auto_597574 ?auto_597584 ) ) ( not ( = ?auto_597574 ?auto_597585 ) ) ( not ( = ?auto_597574 ?auto_597586 ) ) ( not ( = ?auto_597574 ?auto_597587 ) ) ( not ( = ?auto_597575 ?auto_597576 ) ) ( not ( = ?auto_597575 ?auto_597577 ) ) ( not ( = ?auto_597575 ?auto_597578 ) ) ( not ( = ?auto_597575 ?auto_597579 ) ) ( not ( = ?auto_597575 ?auto_597580 ) ) ( not ( = ?auto_597575 ?auto_597581 ) ) ( not ( = ?auto_597575 ?auto_597582 ) ) ( not ( = ?auto_597575 ?auto_597583 ) ) ( not ( = ?auto_597575 ?auto_597584 ) ) ( not ( = ?auto_597575 ?auto_597585 ) ) ( not ( = ?auto_597575 ?auto_597586 ) ) ( not ( = ?auto_597575 ?auto_597587 ) ) ( not ( = ?auto_597576 ?auto_597577 ) ) ( not ( = ?auto_597576 ?auto_597578 ) ) ( not ( = ?auto_597576 ?auto_597579 ) ) ( not ( = ?auto_597576 ?auto_597580 ) ) ( not ( = ?auto_597576 ?auto_597581 ) ) ( not ( = ?auto_597576 ?auto_597582 ) ) ( not ( = ?auto_597576 ?auto_597583 ) ) ( not ( = ?auto_597576 ?auto_597584 ) ) ( not ( = ?auto_597576 ?auto_597585 ) ) ( not ( = ?auto_597576 ?auto_597586 ) ) ( not ( = ?auto_597576 ?auto_597587 ) ) ( not ( = ?auto_597577 ?auto_597578 ) ) ( not ( = ?auto_597577 ?auto_597579 ) ) ( not ( = ?auto_597577 ?auto_597580 ) ) ( not ( = ?auto_597577 ?auto_597581 ) ) ( not ( = ?auto_597577 ?auto_597582 ) ) ( not ( = ?auto_597577 ?auto_597583 ) ) ( not ( = ?auto_597577 ?auto_597584 ) ) ( not ( = ?auto_597577 ?auto_597585 ) ) ( not ( = ?auto_597577 ?auto_597586 ) ) ( not ( = ?auto_597577 ?auto_597587 ) ) ( not ( = ?auto_597578 ?auto_597579 ) ) ( not ( = ?auto_597578 ?auto_597580 ) ) ( not ( = ?auto_597578 ?auto_597581 ) ) ( not ( = ?auto_597578 ?auto_597582 ) ) ( not ( = ?auto_597578 ?auto_597583 ) ) ( not ( = ?auto_597578 ?auto_597584 ) ) ( not ( = ?auto_597578 ?auto_597585 ) ) ( not ( = ?auto_597578 ?auto_597586 ) ) ( not ( = ?auto_597578 ?auto_597587 ) ) ( not ( = ?auto_597579 ?auto_597580 ) ) ( not ( = ?auto_597579 ?auto_597581 ) ) ( not ( = ?auto_597579 ?auto_597582 ) ) ( not ( = ?auto_597579 ?auto_597583 ) ) ( not ( = ?auto_597579 ?auto_597584 ) ) ( not ( = ?auto_597579 ?auto_597585 ) ) ( not ( = ?auto_597579 ?auto_597586 ) ) ( not ( = ?auto_597579 ?auto_597587 ) ) ( not ( = ?auto_597580 ?auto_597581 ) ) ( not ( = ?auto_597580 ?auto_597582 ) ) ( not ( = ?auto_597580 ?auto_597583 ) ) ( not ( = ?auto_597580 ?auto_597584 ) ) ( not ( = ?auto_597580 ?auto_597585 ) ) ( not ( = ?auto_597580 ?auto_597586 ) ) ( not ( = ?auto_597580 ?auto_597587 ) ) ( not ( = ?auto_597581 ?auto_597582 ) ) ( not ( = ?auto_597581 ?auto_597583 ) ) ( not ( = ?auto_597581 ?auto_597584 ) ) ( not ( = ?auto_597581 ?auto_597585 ) ) ( not ( = ?auto_597581 ?auto_597586 ) ) ( not ( = ?auto_597581 ?auto_597587 ) ) ( not ( = ?auto_597582 ?auto_597583 ) ) ( not ( = ?auto_597582 ?auto_597584 ) ) ( not ( = ?auto_597582 ?auto_597585 ) ) ( not ( = ?auto_597582 ?auto_597586 ) ) ( not ( = ?auto_597582 ?auto_597587 ) ) ( not ( = ?auto_597583 ?auto_597584 ) ) ( not ( = ?auto_597583 ?auto_597585 ) ) ( not ( = ?auto_597583 ?auto_597586 ) ) ( not ( = ?auto_597583 ?auto_597587 ) ) ( not ( = ?auto_597584 ?auto_597585 ) ) ( not ( = ?auto_597584 ?auto_597586 ) ) ( not ( = ?auto_597584 ?auto_597587 ) ) ( not ( = ?auto_597585 ?auto_597586 ) ) ( not ( = ?auto_597585 ?auto_597587 ) ) ( not ( = ?auto_597586 ?auto_597587 ) ) ( ON ?auto_597585 ?auto_597586 ) ( ON ?auto_597584 ?auto_597585 ) ( ON ?auto_597583 ?auto_597584 ) ( ON ?auto_597582 ?auto_597583 ) ( ON ?auto_597581 ?auto_597582 ) ( ON ?auto_597580 ?auto_597581 ) ( ON ?auto_597579 ?auto_597580 ) ( ON ?auto_597578 ?auto_597579 ) ( ON ?auto_597577 ?auto_597578 ) ( ON ?auto_597576 ?auto_597577 ) ( ON ?auto_597575 ?auto_597576 ) ( ON ?auto_597574 ?auto_597575 ) ( CLEAR ?auto_597572 ) ( ON ?auto_597573 ?auto_597574 ) ( CLEAR ?auto_597573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_597570 ?auto_597571 ?auto_597572 ?auto_597573 )
      ( MAKE-17PILE ?auto_597570 ?auto_597571 ?auto_597572 ?auto_597573 ?auto_597574 ?auto_597575 ?auto_597576 ?auto_597577 ?auto_597578 ?auto_597579 ?auto_597580 ?auto_597581 ?auto_597582 ?auto_597583 ?auto_597584 ?auto_597585 ?auto_597586 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597605 - BLOCK
      ?auto_597606 - BLOCK
      ?auto_597607 - BLOCK
      ?auto_597608 - BLOCK
      ?auto_597609 - BLOCK
      ?auto_597610 - BLOCK
      ?auto_597611 - BLOCK
      ?auto_597612 - BLOCK
      ?auto_597613 - BLOCK
      ?auto_597614 - BLOCK
      ?auto_597615 - BLOCK
      ?auto_597616 - BLOCK
      ?auto_597617 - BLOCK
      ?auto_597618 - BLOCK
      ?auto_597619 - BLOCK
      ?auto_597620 - BLOCK
      ?auto_597621 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597621 ) ( ON-TABLE ?auto_597605 ) ( ON ?auto_597606 ?auto_597605 ) ( ON ?auto_597607 ?auto_597606 ) ( not ( = ?auto_597605 ?auto_597606 ) ) ( not ( = ?auto_597605 ?auto_597607 ) ) ( not ( = ?auto_597605 ?auto_597608 ) ) ( not ( = ?auto_597605 ?auto_597609 ) ) ( not ( = ?auto_597605 ?auto_597610 ) ) ( not ( = ?auto_597605 ?auto_597611 ) ) ( not ( = ?auto_597605 ?auto_597612 ) ) ( not ( = ?auto_597605 ?auto_597613 ) ) ( not ( = ?auto_597605 ?auto_597614 ) ) ( not ( = ?auto_597605 ?auto_597615 ) ) ( not ( = ?auto_597605 ?auto_597616 ) ) ( not ( = ?auto_597605 ?auto_597617 ) ) ( not ( = ?auto_597605 ?auto_597618 ) ) ( not ( = ?auto_597605 ?auto_597619 ) ) ( not ( = ?auto_597605 ?auto_597620 ) ) ( not ( = ?auto_597605 ?auto_597621 ) ) ( not ( = ?auto_597606 ?auto_597607 ) ) ( not ( = ?auto_597606 ?auto_597608 ) ) ( not ( = ?auto_597606 ?auto_597609 ) ) ( not ( = ?auto_597606 ?auto_597610 ) ) ( not ( = ?auto_597606 ?auto_597611 ) ) ( not ( = ?auto_597606 ?auto_597612 ) ) ( not ( = ?auto_597606 ?auto_597613 ) ) ( not ( = ?auto_597606 ?auto_597614 ) ) ( not ( = ?auto_597606 ?auto_597615 ) ) ( not ( = ?auto_597606 ?auto_597616 ) ) ( not ( = ?auto_597606 ?auto_597617 ) ) ( not ( = ?auto_597606 ?auto_597618 ) ) ( not ( = ?auto_597606 ?auto_597619 ) ) ( not ( = ?auto_597606 ?auto_597620 ) ) ( not ( = ?auto_597606 ?auto_597621 ) ) ( not ( = ?auto_597607 ?auto_597608 ) ) ( not ( = ?auto_597607 ?auto_597609 ) ) ( not ( = ?auto_597607 ?auto_597610 ) ) ( not ( = ?auto_597607 ?auto_597611 ) ) ( not ( = ?auto_597607 ?auto_597612 ) ) ( not ( = ?auto_597607 ?auto_597613 ) ) ( not ( = ?auto_597607 ?auto_597614 ) ) ( not ( = ?auto_597607 ?auto_597615 ) ) ( not ( = ?auto_597607 ?auto_597616 ) ) ( not ( = ?auto_597607 ?auto_597617 ) ) ( not ( = ?auto_597607 ?auto_597618 ) ) ( not ( = ?auto_597607 ?auto_597619 ) ) ( not ( = ?auto_597607 ?auto_597620 ) ) ( not ( = ?auto_597607 ?auto_597621 ) ) ( not ( = ?auto_597608 ?auto_597609 ) ) ( not ( = ?auto_597608 ?auto_597610 ) ) ( not ( = ?auto_597608 ?auto_597611 ) ) ( not ( = ?auto_597608 ?auto_597612 ) ) ( not ( = ?auto_597608 ?auto_597613 ) ) ( not ( = ?auto_597608 ?auto_597614 ) ) ( not ( = ?auto_597608 ?auto_597615 ) ) ( not ( = ?auto_597608 ?auto_597616 ) ) ( not ( = ?auto_597608 ?auto_597617 ) ) ( not ( = ?auto_597608 ?auto_597618 ) ) ( not ( = ?auto_597608 ?auto_597619 ) ) ( not ( = ?auto_597608 ?auto_597620 ) ) ( not ( = ?auto_597608 ?auto_597621 ) ) ( not ( = ?auto_597609 ?auto_597610 ) ) ( not ( = ?auto_597609 ?auto_597611 ) ) ( not ( = ?auto_597609 ?auto_597612 ) ) ( not ( = ?auto_597609 ?auto_597613 ) ) ( not ( = ?auto_597609 ?auto_597614 ) ) ( not ( = ?auto_597609 ?auto_597615 ) ) ( not ( = ?auto_597609 ?auto_597616 ) ) ( not ( = ?auto_597609 ?auto_597617 ) ) ( not ( = ?auto_597609 ?auto_597618 ) ) ( not ( = ?auto_597609 ?auto_597619 ) ) ( not ( = ?auto_597609 ?auto_597620 ) ) ( not ( = ?auto_597609 ?auto_597621 ) ) ( not ( = ?auto_597610 ?auto_597611 ) ) ( not ( = ?auto_597610 ?auto_597612 ) ) ( not ( = ?auto_597610 ?auto_597613 ) ) ( not ( = ?auto_597610 ?auto_597614 ) ) ( not ( = ?auto_597610 ?auto_597615 ) ) ( not ( = ?auto_597610 ?auto_597616 ) ) ( not ( = ?auto_597610 ?auto_597617 ) ) ( not ( = ?auto_597610 ?auto_597618 ) ) ( not ( = ?auto_597610 ?auto_597619 ) ) ( not ( = ?auto_597610 ?auto_597620 ) ) ( not ( = ?auto_597610 ?auto_597621 ) ) ( not ( = ?auto_597611 ?auto_597612 ) ) ( not ( = ?auto_597611 ?auto_597613 ) ) ( not ( = ?auto_597611 ?auto_597614 ) ) ( not ( = ?auto_597611 ?auto_597615 ) ) ( not ( = ?auto_597611 ?auto_597616 ) ) ( not ( = ?auto_597611 ?auto_597617 ) ) ( not ( = ?auto_597611 ?auto_597618 ) ) ( not ( = ?auto_597611 ?auto_597619 ) ) ( not ( = ?auto_597611 ?auto_597620 ) ) ( not ( = ?auto_597611 ?auto_597621 ) ) ( not ( = ?auto_597612 ?auto_597613 ) ) ( not ( = ?auto_597612 ?auto_597614 ) ) ( not ( = ?auto_597612 ?auto_597615 ) ) ( not ( = ?auto_597612 ?auto_597616 ) ) ( not ( = ?auto_597612 ?auto_597617 ) ) ( not ( = ?auto_597612 ?auto_597618 ) ) ( not ( = ?auto_597612 ?auto_597619 ) ) ( not ( = ?auto_597612 ?auto_597620 ) ) ( not ( = ?auto_597612 ?auto_597621 ) ) ( not ( = ?auto_597613 ?auto_597614 ) ) ( not ( = ?auto_597613 ?auto_597615 ) ) ( not ( = ?auto_597613 ?auto_597616 ) ) ( not ( = ?auto_597613 ?auto_597617 ) ) ( not ( = ?auto_597613 ?auto_597618 ) ) ( not ( = ?auto_597613 ?auto_597619 ) ) ( not ( = ?auto_597613 ?auto_597620 ) ) ( not ( = ?auto_597613 ?auto_597621 ) ) ( not ( = ?auto_597614 ?auto_597615 ) ) ( not ( = ?auto_597614 ?auto_597616 ) ) ( not ( = ?auto_597614 ?auto_597617 ) ) ( not ( = ?auto_597614 ?auto_597618 ) ) ( not ( = ?auto_597614 ?auto_597619 ) ) ( not ( = ?auto_597614 ?auto_597620 ) ) ( not ( = ?auto_597614 ?auto_597621 ) ) ( not ( = ?auto_597615 ?auto_597616 ) ) ( not ( = ?auto_597615 ?auto_597617 ) ) ( not ( = ?auto_597615 ?auto_597618 ) ) ( not ( = ?auto_597615 ?auto_597619 ) ) ( not ( = ?auto_597615 ?auto_597620 ) ) ( not ( = ?auto_597615 ?auto_597621 ) ) ( not ( = ?auto_597616 ?auto_597617 ) ) ( not ( = ?auto_597616 ?auto_597618 ) ) ( not ( = ?auto_597616 ?auto_597619 ) ) ( not ( = ?auto_597616 ?auto_597620 ) ) ( not ( = ?auto_597616 ?auto_597621 ) ) ( not ( = ?auto_597617 ?auto_597618 ) ) ( not ( = ?auto_597617 ?auto_597619 ) ) ( not ( = ?auto_597617 ?auto_597620 ) ) ( not ( = ?auto_597617 ?auto_597621 ) ) ( not ( = ?auto_597618 ?auto_597619 ) ) ( not ( = ?auto_597618 ?auto_597620 ) ) ( not ( = ?auto_597618 ?auto_597621 ) ) ( not ( = ?auto_597619 ?auto_597620 ) ) ( not ( = ?auto_597619 ?auto_597621 ) ) ( not ( = ?auto_597620 ?auto_597621 ) ) ( ON ?auto_597620 ?auto_597621 ) ( ON ?auto_597619 ?auto_597620 ) ( ON ?auto_597618 ?auto_597619 ) ( ON ?auto_597617 ?auto_597618 ) ( ON ?auto_597616 ?auto_597617 ) ( ON ?auto_597615 ?auto_597616 ) ( ON ?auto_597614 ?auto_597615 ) ( ON ?auto_597613 ?auto_597614 ) ( ON ?auto_597612 ?auto_597613 ) ( ON ?auto_597611 ?auto_597612 ) ( ON ?auto_597610 ?auto_597611 ) ( ON ?auto_597609 ?auto_597610 ) ( CLEAR ?auto_597607 ) ( ON ?auto_597608 ?auto_597609 ) ( CLEAR ?auto_597608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_597605 ?auto_597606 ?auto_597607 ?auto_597608 )
      ( MAKE-17PILE ?auto_597605 ?auto_597606 ?auto_597607 ?auto_597608 ?auto_597609 ?auto_597610 ?auto_597611 ?auto_597612 ?auto_597613 ?auto_597614 ?auto_597615 ?auto_597616 ?auto_597617 ?auto_597618 ?auto_597619 ?auto_597620 ?auto_597621 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597639 - BLOCK
      ?auto_597640 - BLOCK
      ?auto_597641 - BLOCK
      ?auto_597642 - BLOCK
      ?auto_597643 - BLOCK
      ?auto_597644 - BLOCK
      ?auto_597645 - BLOCK
      ?auto_597646 - BLOCK
      ?auto_597647 - BLOCK
      ?auto_597648 - BLOCK
      ?auto_597649 - BLOCK
      ?auto_597650 - BLOCK
      ?auto_597651 - BLOCK
      ?auto_597652 - BLOCK
      ?auto_597653 - BLOCK
      ?auto_597654 - BLOCK
      ?auto_597655 - BLOCK
    )
    :vars
    (
      ?auto_597656 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597655 ?auto_597656 ) ( ON-TABLE ?auto_597639 ) ( ON ?auto_597640 ?auto_597639 ) ( not ( = ?auto_597639 ?auto_597640 ) ) ( not ( = ?auto_597639 ?auto_597641 ) ) ( not ( = ?auto_597639 ?auto_597642 ) ) ( not ( = ?auto_597639 ?auto_597643 ) ) ( not ( = ?auto_597639 ?auto_597644 ) ) ( not ( = ?auto_597639 ?auto_597645 ) ) ( not ( = ?auto_597639 ?auto_597646 ) ) ( not ( = ?auto_597639 ?auto_597647 ) ) ( not ( = ?auto_597639 ?auto_597648 ) ) ( not ( = ?auto_597639 ?auto_597649 ) ) ( not ( = ?auto_597639 ?auto_597650 ) ) ( not ( = ?auto_597639 ?auto_597651 ) ) ( not ( = ?auto_597639 ?auto_597652 ) ) ( not ( = ?auto_597639 ?auto_597653 ) ) ( not ( = ?auto_597639 ?auto_597654 ) ) ( not ( = ?auto_597639 ?auto_597655 ) ) ( not ( = ?auto_597639 ?auto_597656 ) ) ( not ( = ?auto_597640 ?auto_597641 ) ) ( not ( = ?auto_597640 ?auto_597642 ) ) ( not ( = ?auto_597640 ?auto_597643 ) ) ( not ( = ?auto_597640 ?auto_597644 ) ) ( not ( = ?auto_597640 ?auto_597645 ) ) ( not ( = ?auto_597640 ?auto_597646 ) ) ( not ( = ?auto_597640 ?auto_597647 ) ) ( not ( = ?auto_597640 ?auto_597648 ) ) ( not ( = ?auto_597640 ?auto_597649 ) ) ( not ( = ?auto_597640 ?auto_597650 ) ) ( not ( = ?auto_597640 ?auto_597651 ) ) ( not ( = ?auto_597640 ?auto_597652 ) ) ( not ( = ?auto_597640 ?auto_597653 ) ) ( not ( = ?auto_597640 ?auto_597654 ) ) ( not ( = ?auto_597640 ?auto_597655 ) ) ( not ( = ?auto_597640 ?auto_597656 ) ) ( not ( = ?auto_597641 ?auto_597642 ) ) ( not ( = ?auto_597641 ?auto_597643 ) ) ( not ( = ?auto_597641 ?auto_597644 ) ) ( not ( = ?auto_597641 ?auto_597645 ) ) ( not ( = ?auto_597641 ?auto_597646 ) ) ( not ( = ?auto_597641 ?auto_597647 ) ) ( not ( = ?auto_597641 ?auto_597648 ) ) ( not ( = ?auto_597641 ?auto_597649 ) ) ( not ( = ?auto_597641 ?auto_597650 ) ) ( not ( = ?auto_597641 ?auto_597651 ) ) ( not ( = ?auto_597641 ?auto_597652 ) ) ( not ( = ?auto_597641 ?auto_597653 ) ) ( not ( = ?auto_597641 ?auto_597654 ) ) ( not ( = ?auto_597641 ?auto_597655 ) ) ( not ( = ?auto_597641 ?auto_597656 ) ) ( not ( = ?auto_597642 ?auto_597643 ) ) ( not ( = ?auto_597642 ?auto_597644 ) ) ( not ( = ?auto_597642 ?auto_597645 ) ) ( not ( = ?auto_597642 ?auto_597646 ) ) ( not ( = ?auto_597642 ?auto_597647 ) ) ( not ( = ?auto_597642 ?auto_597648 ) ) ( not ( = ?auto_597642 ?auto_597649 ) ) ( not ( = ?auto_597642 ?auto_597650 ) ) ( not ( = ?auto_597642 ?auto_597651 ) ) ( not ( = ?auto_597642 ?auto_597652 ) ) ( not ( = ?auto_597642 ?auto_597653 ) ) ( not ( = ?auto_597642 ?auto_597654 ) ) ( not ( = ?auto_597642 ?auto_597655 ) ) ( not ( = ?auto_597642 ?auto_597656 ) ) ( not ( = ?auto_597643 ?auto_597644 ) ) ( not ( = ?auto_597643 ?auto_597645 ) ) ( not ( = ?auto_597643 ?auto_597646 ) ) ( not ( = ?auto_597643 ?auto_597647 ) ) ( not ( = ?auto_597643 ?auto_597648 ) ) ( not ( = ?auto_597643 ?auto_597649 ) ) ( not ( = ?auto_597643 ?auto_597650 ) ) ( not ( = ?auto_597643 ?auto_597651 ) ) ( not ( = ?auto_597643 ?auto_597652 ) ) ( not ( = ?auto_597643 ?auto_597653 ) ) ( not ( = ?auto_597643 ?auto_597654 ) ) ( not ( = ?auto_597643 ?auto_597655 ) ) ( not ( = ?auto_597643 ?auto_597656 ) ) ( not ( = ?auto_597644 ?auto_597645 ) ) ( not ( = ?auto_597644 ?auto_597646 ) ) ( not ( = ?auto_597644 ?auto_597647 ) ) ( not ( = ?auto_597644 ?auto_597648 ) ) ( not ( = ?auto_597644 ?auto_597649 ) ) ( not ( = ?auto_597644 ?auto_597650 ) ) ( not ( = ?auto_597644 ?auto_597651 ) ) ( not ( = ?auto_597644 ?auto_597652 ) ) ( not ( = ?auto_597644 ?auto_597653 ) ) ( not ( = ?auto_597644 ?auto_597654 ) ) ( not ( = ?auto_597644 ?auto_597655 ) ) ( not ( = ?auto_597644 ?auto_597656 ) ) ( not ( = ?auto_597645 ?auto_597646 ) ) ( not ( = ?auto_597645 ?auto_597647 ) ) ( not ( = ?auto_597645 ?auto_597648 ) ) ( not ( = ?auto_597645 ?auto_597649 ) ) ( not ( = ?auto_597645 ?auto_597650 ) ) ( not ( = ?auto_597645 ?auto_597651 ) ) ( not ( = ?auto_597645 ?auto_597652 ) ) ( not ( = ?auto_597645 ?auto_597653 ) ) ( not ( = ?auto_597645 ?auto_597654 ) ) ( not ( = ?auto_597645 ?auto_597655 ) ) ( not ( = ?auto_597645 ?auto_597656 ) ) ( not ( = ?auto_597646 ?auto_597647 ) ) ( not ( = ?auto_597646 ?auto_597648 ) ) ( not ( = ?auto_597646 ?auto_597649 ) ) ( not ( = ?auto_597646 ?auto_597650 ) ) ( not ( = ?auto_597646 ?auto_597651 ) ) ( not ( = ?auto_597646 ?auto_597652 ) ) ( not ( = ?auto_597646 ?auto_597653 ) ) ( not ( = ?auto_597646 ?auto_597654 ) ) ( not ( = ?auto_597646 ?auto_597655 ) ) ( not ( = ?auto_597646 ?auto_597656 ) ) ( not ( = ?auto_597647 ?auto_597648 ) ) ( not ( = ?auto_597647 ?auto_597649 ) ) ( not ( = ?auto_597647 ?auto_597650 ) ) ( not ( = ?auto_597647 ?auto_597651 ) ) ( not ( = ?auto_597647 ?auto_597652 ) ) ( not ( = ?auto_597647 ?auto_597653 ) ) ( not ( = ?auto_597647 ?auto_597654 ) ) ( not ( = ?auto_597647 ?auto_597655 ) ) ( not ( = ?auto_597647 ?auto_597656 ) ) ( not ( = ?auto_597648 ?auto_597649 ) ) ( not ( = ?auto_597648 ?auto_597650 ) ) ( not ( = ?auto_597648 ?auto_597651 ) ) ( not ( = ?auto_597648 ?auto_597652 ) ) ( not ( = ?auto_597648 ?auto_597653 ) ) ( not ( = ?auto_597648 ?auto_597654 ) ) ( not ( = ?auto_597648 ?auto_597655 ) ) ( not ( = ?auto_597648 ?auto_597656 ) ) ( not ( = ?auto_597649 ?auto_597650 ) ) ( not ( = ?auto_597649 ?auto_597651 ) ) ( not ( = ?auto_597649 ?auto_597652 ) ) ( not ( = ?auto_597649 ?auto_597653 ) ) ( not ( = ?auto_597649 ?auto_597654 ) ) ( not ( = ?auto_597649 ?auto_597655 ) ) ( not ( = ?auto_597649 ?auto_597656 ) ) ( not ( = ?auto_597650 ?auto_597651 ) ) ( not ( = ?auto_597650 ?auto_597652 ) ) ( not ( = ?auto_597650 ?auto_597653 ) ) ( not ( = ?auto_597650 ?auto_597654 ) ) ( not ( = ?auto_597650 ?auto_597655 ) ) ( not ( = ?auto_597650 ?auto_597656 ) ) ( not ( = ?auto_597651 ?auto_597652 ) ) ( not ( = ?auto_597651 ?auto_597653 ) ) ( not ( = ?auto_597651 ?auto_597654 ) ) ( not ( = ?auto_597651 ?auto_597655 ) ) ( not ( = ?auto_597651 ?auto_597656 ) ) ( not ( = ?auto_597652 ?auto_597653 ) ) ( not ( = ?auto_597652 ?auto_597654 ) ) ( not ( = ?auto_597652 ?auto_597655 ) ) ( not ( = ?auto_597652 ?auto_597656 ) ) ( not ( = ?auto_597653 ?auto_597654 ) ) ( not ( = ?auto_597653 ?auto_597655 ) ) ( not ( = ?auto_597653 ?auto_597656 ) ) ( not ( = ?auto_597654 ?auto_597655 ) ) ( not ( = ?auto_597654 ?auto_597656 ) ) ( not ( = ?auto_597655 ?auto_597656 ) ) ( ON ?auto_597654 ?auto_597655 ) ( ON ?auto_597653 ?auto_597654 ) ( ON ?auto_597652 ?auto_597653 ) ( ON ?auto_597651 ?auto_597652 ) ( ON ?auto_597650 ?auto_597651 ) ( ON ?auto_597649 ?auto_597650 ) ( ON ?auto_597648 ?auto_597649 ) ( ON ?auto_597647 ?auto_597648 ) ( ON ?auto_597646 ?auto_597647 ) ( ON ?auto_597645 ?auto_597646 ) ( ON ?auto_597644 ?auto_597645 ) ( ON ?auto_597643 ?auto_597644 ) ( ON ?auto_597642 ?auto_597643 ) ( CLEAR ?auto_597640 ) ( ON ?auto_597641 ?auto_597642 ) ( CLEAR ?auto_597641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_597639 ?auto_597640 ?auto_597641 )
      ( MAKE-17PILE ?auto_597639 ?auto_597640 ?auto_597641 ?auto_597642 ?auto_597643 ?auto_597644 ?auto_597645 ?auto_597646 ?auto_597647 ?auto_597648 ?auto_597649 ?auto_597650 ?auto_597651 ?auto_597652 ?auto_597653 ?auto_597654 ?auto_597655 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597674 - BLOCK
      ?auto_597675 - BLOCK
      ?auto_597676 - BLOCK
      ?auto_597677 - BLOCK
      ?auto_597678 - BLOCK
      ?auto_597679 - BLOCK
      ?auto_597680 - BLOCK
      ?auto_597681 - BLOCK
      ?auto_597682 - BLOCK
      ?auto_597683 - BLOCK
      ?auto_597684 - BLOCK
      ?auto_597685 - BLOCK
      ?auto_597686 - BLOCK
      ?auto_597687 - BLOCK
      ?auto_597688 - BLOCK
      ?auto_597689 - BLOCK
      ?auto_597690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597690 ) ( ON-TABLE ?auto_597674 ) ( ON ?auto_597675 ?auto_597674 ) ( not ( = ?auto_597674 ?auto_597675 ) ) ( not ( = ?auto_597674 ?auto_597676 ) ) ( not ( = ?auto_597674 ?auto_597677 ) ) ( not ( = ?auto_597674 ?auto_597678 ) ) ( not ( = ?auto_597674 ?auto_597679 ) ) ( not ( = ?auto_597674 ?auto_597680 ) ) ( not ( = ?auto_597674 ?auto_597681 ) ) ( not ( = ?auto_597674 ?auto_597682 ) ) ( not ( = ?auto_597674 ?auto_597683 ) ) ( not ( = ?auto_597674 ?auto_597684 ) ) ( not ( = ?auto_597674 ?auto_597685 ) ) ( not ( = ?auto_597674 ?auto_597686 ) ) ( not ( = ?auto_597674 ?auto_597687 ) ) ( not ( = ?auto_597674 ?auto_597688 ) ) ( not ( = ?auto_597674 ?auto_597689 ) ) ( not ( = ?auto_597674 ?auto_597690 ) ) ( not ( = ?auto_597675 ?auto_597676 ) ) ( not ( = ?auto_597675 ?auto_597677 ) ) ( not ( = ?auto_597675 ?auto_597678 ) ) ( not ( = ?auto_597675 ?auto_597679 ) ) ( not ( = ?auto_597675 ?auto_597680 ) ) ( not ( = ?auto_597675 ?auto_597681 ) ) ( not ( = ?auto_597675 ?auto_597682 ) ) ( not ( = ?auto_597675 ?auto_597683 ) ) ( not ( = ?auto_597675 ?auto_597684 ) ) ( not ( = ?auto_597675 ?auto_597685 ) ) ( not ( = ?auto_597675 ?auto_597686 ) ) ( not ( = ?auto_597675 ?auto_597687 ) ) ( not ( = ?auto_597675 ?auto_597688 ) ) ( not ( = ?auto_597675 ?auto_597689 ) ) ( not ( = ?auto_597675 ?auto_597690 ) ) ( not ( = ?auto_597676 ?auto_597677 ) ) ( not ( = ?auto_597676 ?auto_597678 ) ) ( not ( = ?auto_597676 ?auto_597679 ) ) ( not ( = ?auto_597676 ?auto_597680 ) ) ( not ( = ?auto_597676 ?auto_597681 ) ) ( not ( = ?auto_597676 ?auto_597682 ) ) ( not ( = ?auto_597676 ?auto_597683 ) ) ( not ( = ?auto_597676 ?auto_597684 ) ) ( not ( = ?auto_597676 ?auto_597685 ) ) ( not ( = ?auto_597676 ?auto_597686 ) ) ( not ( = ?auto_597676 ?auto_597687 ) ) ( not ( = ?auto_597676 ?auto_597688 ) ) ( not ( = ?auto_597676 ?auto_597689 ) ) ( not ( = ?auto_597676 ?auto_597690 ) ) ( not ( = ?auto_597677 ?auto_597678 ) ) ( not ( = ?auto_597677 ?auto_597679 ) ) ( not ( = ?auto_597677 ?auto_597680 ) ) ( not ( = ?auto_597677 ?auto_597681 ) ) ( not ( = ?auto_597677 ?auto_597682 ) ) ( not ( = ?auto_597677 ?auto_597683 ) ) ( not ( = ?auto_597677 ?auto_597684 ) ) ( not ( = ?auto_597677 ?auto_597685 ) ) ( not ( = ?auto_597677 ?auto_597686 ) ) ( not ( = ?auto_597677 ?auto_597687 ) ) ( not ( = ?auto_597677 ?auto_597688 ) ) ( not ( = ?auto_597677 ?auto_597689 ) ) ( not ( = ?auto_597677 ?auto_597690 ) ) ( not ( = ?auto_597678 ?auto_597679 ) ) ( not ( = ?auto_597678 ?auto_597680 ) ) ( not ( = ?auto_597678 ?auto_597681 ) ) ( not ( = ?auto_597678 ?auto_597682 ) ) ( not ( = ?auto_597678 ?auto_597683 ) ) ( not ( = ?auto_597678 ?auto_597684 ) ) ( not ( = ?auto_597678 ?auto_597685 ) ) ( not ( = ?auto_597678 ?auto_597686 ) ) ( not ( = ?auto_597678 ?auto_597687 ) ) ( not ( = ?auto_597678 ?auto_597688 ) ) ( not ( = ?auto_597678 ?auto_597689 ) ) ( not ( = ?auto_597678 ?auto_597690 ) ) ( not ( = ?auto_597679 ?auto_597680 ) ) ( not ( = ?auto_597679 ?auto_597681 ) ) ( not ( = ?auto_597679 ?auto_597682 ) ) ( not ( = ?auto_597679 ?auto_597683 ) ) ( not ( = ?auto_597679 ?auto_597684 ) ) ( not ( = ?auto_597679 ?auto_597685 ) ) ( not ( = ?auto_597679 ?auto_597686 ) ) ( not ( = ?auto_597679 ?auto_597687 ) ) ( not ( = ?auto_597679 ?auto_597688 ) ) ( not ( = ?auto_597679 ?auto_597689 ) ) ( not ( = ?auto_597679 ?auto_597690 ) ) ( not ( = ?auto_597680 ?auto_597681 ) ) ( not ( = ?auto_597680 ?auto_597682 ) ) ( not ( = ?auto_597680 ?auto_597683 ) ) ( not ( = ?auto_597680 ?auto_597684 ) ) ( not ( = ?auto_597680 ?auto_597685 ) ) ( not ( = ?auto_597680 ?auto_597686 ) ) ( not ( = ?auto_597680 ?auto_597687 ) ) ( not ( = ?auto_597680 ?auto_597688 ) ) ( not ( = ?auto_597680 ?auto_597689 ) ) ( not ( = ?auto_597680 ?auto_597690 ) ) ( not ( = ?auto_597681 ?auto_597682 ) ) ( not ( = ?auto_597681 ?auto_597683 ) ) ( not ( = ?auto_597681 ?auto_597684 ) ) ( not ( = ?auto_597681 ?auto_597685 ) ) ( not ( = ?auto_597681 ?auto_597686 ) ) ( not ( = ?auto_597681 ?auto_597687 ) ) ( not ( = ?auto_597681 ?auto_597688 ) ) ( not ( = ?auto_597681 ?auto_597689 ) ) ( not ( = ?auto_597681 ?auto_597690 ) ) ( not ( = ?auto_597682 ?auto_597683 ) ) ( not ( = ?auto_597682 ?auto_597684 ) ) ( not ( = ?auto_597682 ?auto_597685 ) ) ( not ( = ?auto_597682 ?auto_597686 ) ) ( not ( = ?auto_597682 ?auto_597687 ) ) ( not ( = ?auto_597682 ?auto_597688 ) ) ( not ( = ?auto_597682 ?auto_597689 ) ) ( not ( = ?auto_597682 ?auto_597690 ) ) ( not ( = ?auto_597683 ?auto_597684 ) ) ( not ( = ?auto_597683 ?auto_597685 ) ) ( not ( = ?auto_597683 ?auto_597686 ) ) ( not ( = ?auto_597683 ?auto_597687 ) ) ( not ( = ?auto_597683 ?auto_597688 ) ) ( not ( = ?auto_597683 ?auto_597689 ) ) ( not ( = ?auto_597683 ?auto_597690 ) ) ( not ( = ?auto_597684 ?auto_597685 ) ) ( not ( = ?auto_597684 ?auto_597686 ) ) ( not ( = ?auto_597684 ?auto_597687 ) ) ( not ( = ?auto_597684 ?auto_597688 ) ) ( not ( = ?auto_597684 ?auto_597689 ) ) ( not ( = ?auto_597684 ?auto_597690 ) ) ( not ( = ?auto_597685 ?auto_597686 ) ) ( not ( = ?auto_597685 ?auto_597687 ) ) ( not ( = ?auto_597685 ?auto_597688 ) ) ( not ( = ?auto_597685 ?auto_597689 ) ) ( not ( = ?auto_597685 ?auto_597690 ) ) ( not ( = ?auto_597686 ?auto_597687 ) ) ( not ( = ?auto_597686 ?auto_597688 ) ) ( not ( = ?auto_597686 ?auto_597689 ) ) ( not ( = ?auto_597686 ?auto_597690 ) ) ( not ( = ?auto_597687 ?auto_597688 ) ) ( not ( = ?auto_597687 ?auto_597689 ) ) ( not ( = ?auto_597687 ?auto_597690 ) ) ( not ( = ?auto_597688 ?auto_597689 ) ) ( not ( = ?auto_597688 ?auto_597690 ) ) ( not ( = ?auto_597689 ?auto_597690 ) ) ( ON ?auto_597689 ?auto_597690 ) ( ON ?auto_597688 ?auto_597689 ) ( ON ?auto_597687 ?auto_597688 ) ( ON ?auto_597686 ?auto_597687 ) ( ON ?auto_597685 ?auto_597686 ) ( ON ?auto_597684 ?auto_597685 ) ( ON ?auto_597683 ?auto_597684 ) ( ON ?auto_597682 ?auto_597683 ) ( ON ?auto_597681 ?auto_597682 ) ( ON ?auto_597680 ?auto_597681 ) ( ON ?auto_597679 ?auto_597680 ) ( ON ?auto_597678 ?auto_597679 ) ( ON ?auto_597677 ?auto_597678 ) ( CLEAR ?auto_597675 ) ( ON ?auto_597676 ?auto_597677 ) ( CLEAR ?auto_597676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_597674 ?auto_597675 ?auto_597676 )
      ( MAKE-17PILE ?auto_597674 ?auto_597675 ?auto_597676 ?auto_597677 ?auto_597678 ?auto_597679 ?auto_597680 ?auto_597681 ?auto_597682 ?auto_597683 ?auto_597684 ?auto_597685 ?auto_597686 ?auto_597687 ?auto_597688 ?auto_597689 ?auto_597690 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597708 - BLOCK
      ?auto_597709 - BLOCK
      ?auto_597710 - BLOCK
      ?auto_597711 - BLOCK
      ?auto_597712 - BLOCK
      ?auto_597713 - BLOCK
      ?auto_597714 - BLOCK
      ?auto_597715 - BLOCK
      ?auto_597716 - BLOCK
      ?auto_597717 - BLOCK
      ?auto_597718 - BLOCK
      ?auto_597719 - BLOCK
      ?auto_597720 - BLOCK
      ?auto_597721 - BLOCK
      ?auto_597722 - BLOCK
      ?auto_597723 - BLOCK
      ?auto_597724 - BLOCK
    )
    :vars
    (
      ?auto_597725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597724 ?auto_597725 ) ( ON-TABLE ?auto_597708 ) ( not ( = ?auto_597708 ?auto_597709 ) ) ( not ( = ?auto_597708 ?auto_597710 ) ) ( not ( = ?auto_597708 ?auto_597711 ) ) ( not ( = ?auto_597708 ?auto_597712 ) ) ( not ( = ?auto_597708 ?auto_597713 ) ) ( not ( = ?auto_597708 ?auto_597714 ) ) ( not ( = ?auto_597708 ?auto_597715 ) ) ( not ( = ?auto_597708 ?auto_597716 ) ) ( not ( = ?auto_597708 ?auto_597717 ) ) ( not ( = ?auto_597708 ?auto_597718 ) ) ( not ( = ?auto_597708 ?auto_597719 ) ) ( not ( = ?auto_597708 ?auto_597720 ) ) ( not ( = ?auto_597708 ?auto_597721 ) ) ( not ( = ?auto_597708 ?auto_597722 ) ) ( not ( = ?auto_597708 ?auto_597723 ) ) ( not ( = ?auto_597708 ?auto_597724 ) ) ( not ( = ?auto_597708 ?auto_597725 ) ) ( not ( = ?auto_597709 ?auto_597710 ) ) ( not ( = ?auto_597709 ?auto_597711 ) ) ( not ( = ?auto_597709 ?auto_597712 ) ) ( not ( = ?auto_597709 ?auto_597713 ) ) ( not ( = ?auto_597709 ?auto_597714 ) ) ( not ( = ?auto_597709 ?auto_597715 ) ) ( not ( = ?auto_597709 ?auto_597716 ) ) ( not ( = ?auto_597709 ?auto_597717 ) ) ( not ( = ?auto_597709 ?auto_597718 ) ) ( not ( = ?auto_597709 ?auto_597719 ) ) ( not ( = ?auto_597709 ?auto_597720 ) ) ( not ( = ?auto_597709 ?auto_597721 ) ) ( not ( = ?auto_597709 ?auto_597722 ) ) ( not ( = ?auto_597709 ?auto_597723 ) ) ( not ( = ?auto_597709 ?auto_597724 ) ) ( not ( = ?auto_597709 ?auto_597725 ) ) ( not ( = ?auto_597710 ?auto_597711 ) ) ( not ( = ?auto_597710 ?auto_597712 ) ) ( not ( = ?auto_597710 ?auto_597713 ) ) ( not ( = ?auto_597710 ?auto_597714 ) ) ( not ( = ?auto_597710 ?auto_597715 ) ) ( not ( = ?auto_597710 ?auto_597716 ) ) ( not ( = ?auto_597710 ?auto_597717 ) ) ( not ( = ?auto_597710 ?auto_597718 ) ) ( not ( = ?auto_597710 ?auto_597719 ) ) ( not ( = ?auto_597710 ?auto_597720 ) ) ( not ( = ?auto_597710 ?auto_597721 ) ) ( not ( = ?auto_597710 ?auto_597722 ) ) ( not ( = ?auto_597710 ?auto_597723 ) ) ( not ( = ?auto_597710 ?auto_597724 ) ) ( not ( = ?auto_597710 ?auto_597725 ) ) ( not ( = ?auto_597711 ?auto_597712 ) ) ( not ( = ?auto_597711 ?auto_597713 ) ) ( not ( = ?auto_597711 ?auto_597714 ) ) ( not ( = ?auto_597711 ?auto_597715 ) ) ( not ( = ?auto_597711 ?auto_597716 ) ) ( not ( = ?auto_597711 ?auto_597717 ) ) ( not ( = ?auto_597711 ?auto_597718 ) ) ( not ( = ?auto_597711 ?auto_597719 ) ) ( not ( = ?auto_597711 ?auto_597720 ) ) ( not ( = ?auto_597711 ?auto_597721 ) ) ( not ( = ?auto_597711 ?auto_597722 ) ) ( not ( = ?auto_597711 ?auto_597723 ) ) ( not ( = ?auto_597711 ?auto_597724 ) ) ( not ( = ?auto_597711 ?auto_597725 ) ) ( not ( = ?auto_597712 ?auto_597713 ) ) ( not ( = ?auto_597712 ?auto_597714 ) ) ( not ( = ?auto_597712 ?auto_597715 ) ) ( not ( = ?auto_597712 ?auto_597716 ) ) ( not ( = ?auto_597712 ?auto_597717 ) ) ( not ( = ?auto_597712 ?auto_597718 ) ) ( not ( = ?auto_597712 ?auto_597719 ) ) ( not ( = ?auto_597712 ?auto_597720 ) ) ( not ( = ?auto_597712 ?auto_597721 ) ) ( not ( = ?auto_597712 ?auto_597722 ) ) ( not ( = ?auto_597712 ?auto_597723 ) ) ( not ( = ?auto_597712 ?auto_597724 ) ) ( not ( = ?auto_597712 ?auto_597725 ) ) ( not ( = ?auto_597713 ?auto_597714 ) ) ( not ( = ?auto_597713 ?auto_597715 ) ) ( not ( = ?auto_597713 ?auto_597716 ) ) ( not ( = ?auto_597713 ?auto_597717 ) ) ( not ( = ?auto_597713 ?auto_597718 ) ) ( not ( = ?auto_597713 ?auto_597719 ) ) ( not ( = ?auto_597713 ?auto_597720 ) ) ( not ( = ?auto_597713 ?auto_597721 ) ) ( not ( = ?auto_597713 ?auto_597722 ) ) ( not ( = ?auto_597713 ?auto_597723 ) ) ( not ( = ?auto_597713 ?auto_597724 ) ) ( not ( = ?auto_597713 ?auto_597725 ) ) ( not ( = ?auto_597714 ?auto_597715 ) ) ( not ( = ?auto_597714 ?auto_597716 ) ) ( not ( = ?auto_597714 ?auto_597717 ) ) ( not ( = ?auto_597714 ?auto_597718 ) ) ( not ( = ?auto_597714 ?auto_597719 ) ) ( not ( = ?auto_597714 ?auto_597720 ) ) ( not ( = ?auto_597714 ?auto_597721 ) ) ( not ( = ?auto_597714 ?auto_597722 ) ) ( not ( = ?auto_597714 ?auto_597723 ) ) ( not ( = ?auto_597714 ?auto_597724 ) ) ( not ( = ?auto_597714 ?auto_597725 ) ) ( not ( = ?auto_597715 ?auto_597716 ) ) ( not ( = ?auto_597715 ?auto_597717 ) ) ( not ( = ?auto_597715 ?auto_597718 ) ) ( not ( = ?auto_597715 ?auto_597719 ) ) ( not ( = ?auto_597715 ?auto_597720 ) ) ( not ( = ?auto_597715 ?auto_597721 ) ) ( not ( = ?auto_597715 ?auto_597722 ) ) ( not ( = ?auto_597715 ?auto_597723 ) ) ( not ( = ?auto_597715 ?auto_597724 ) ) ( not ( = ?auto_597715 ?auto_597725 ) ) ( not ( = ?auto_597716 ?auto_597717 ) ) ( not ( = ?auto_597716 ?auto_597718 ) ) ( not ( = ?auto_597716 ?auto_597719 ) ) ( not ( = ?auto_597716 ?auto_597720 ) ) ( not ( = ?auto_597716 ?auto_597721 ) ) ( not ( = ?auto_597716 ?auto_597722 ) ) ( not ( = ?auto_597716 ?auto_597723 ) ) ( not ( = ?auto_597716 ?auto_597724 ) ) ( not ( = ?auto_597716 ?auto_597725 ) ) ( not ( = ?auto_597717 ?auto_597718 ) ) ( not ( = ?auto_597717 ?auto_597719 ) ) ( not ( = ?auto_597717 ?auto_597720 ) ) ( not ( = ?auto_597717 ?auto_597721 ) ) ( not ( = ?auto_597717 ?auto_597722 ) ) ( not ( = ?auto_597717 ?auto_597723 ) ) ( not ( = ?auto_597717 ?auto_597724 ) ) ( not ( = ?auto_597717 ?auto_597725 ) ) ( not ( = ?auto_597718 ?auto_597719 ) ) ( not ( = ?auto_597718 ?auto_597720 ) ) ( not ( = ?auto_597718 ?auto_597721 ) ) ( not ( = ?auto_597718 ?auto_597722 ) ) ( not ( = ?auto_597718 ?auto_597723 ) ) ( not ( = ?auto_597718 ?auto_597724 ) ) ( not ( = ?auto_597718 ?auto_597725 ) ) ( not ( = ?auto_597719 ?auto_597720 ) ) ( not ( = ?auto_597719 ?auto_597721 ) ) ( not ( = ?auto_597719 ?auto_597722 ) ) ( not ( = ?auto_597719 ?auto_597723 ) ) ( not ( = ?auto_597719 ?auto_597724 ) ) ( not ( = ?auto_597719 ?auto_597725 ) ) ( not ( = ?auto_597720 ?auto_597721 ) ) ( not ( = ?auto_597720 ?auto_597722 ) ) ( not ( = ?auto_597720 ?auto_597723 ) ) ( not ( = ?auto_597720 ?auto_597724 ) ) ( not ( = ?auto_597720 ?auto_597725 ) ) ( not ( = ?auto_597721 ?auto_597722 ) ) ( not ( = ?auto_597721 ?auto_597723 ) ) ( not ( = ?auto_597721 ?auto_597724 ) ) ( not ( = ?auto_597721 ?auto_597725 ) ) ( not ( = ?auto_597722 ?auto_597723 ) ) ( not ( = ?auto_597722 ?auto_597724 ) ) ( not ( = ?auto_597722 ?auto_597725 ) ) ( not ( = ?auto_597723 ?auto_597724 ) ) ( not ( = ?auto_597723 ?auto_597725 ) ) ( not ( = ?auto_597724 ?auto_597725 ) ) ( ON ?auto_597723 ?auto_597724 ) ( ON ?auto_597722 ?auto_597723 ) ( ON ?auto_597721 ?auto_597722 ) ( ON ?auto_597720 ?auto_597721 ) ( ON ?auto_597719 ?auto_597720 ) ( ON ?auto_597718 ?auto_597719 ) ( ON ?auto_597717 ?auto_597718 ) ( ON ?auto_597716 ?auto_597717 ) ( ON ?auto_597715 ?auto_597716 ) ( ON ?auto_597714 ?auto_597715 ) ( ON ?auto_597713 ?auto_597714 ) ( ON ?auto_597712 ?auto_597713 ) ( ON ?auto_597711 ?auto_597712 ) ( ON ?auto_597710 ?auto_597711 ) ( CLEAR ?auto_597708 ) ( ON ?auto_597709 ?auto_597710 ) ( CLEAR ?auto_597709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_597708 ?auto_597709 )
      ( MAKE-17PILE ?auto_597708 ?auto_597709 ?auto_597710 ?auto_597711 ?auto_597712 ?auto_597713 ?auto_597714 ?auto_597715 ?auto_597716 ?auto_597717 ?auto_597718 ?auto_597719 ?auto_597720 ?auto_597721 ?auto_597722 ?auto_597723 ?auto_597724 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597743 - BLOCK
      ?auto_597744 - BLOCK
      ?auto_597745 - BLOCK
      ?auto_597746 - BLOCK
      ?auto_597747 - BLOCK
      ?auto_597748 - BLOCK
      ?auto_597749 - BLOCK
      ?auto_597750 - BLOCK
      ?auto_597751 - BLOCK
      ?auto_597752 - BLOCK
      ?auto_597753 - BLOCK
      ?auto_597754 - BLOCK
      ?auto_597755 - BLOCK
      ?auto_597756 - BLOCK
      ?auto_597757 - BLOCK
      ?auto_597758 - BLOCK
      ?auto_597759 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597759 ) ( ON-TABLE ?auto_597743 ) ( not ( = ?auto_597743 ?auto_597744 ) ) ( not ( = ?auto_597743 ?auto_597745 ) ) ( not ( = ?auto_597743 ?auto_597746 ) ) ( not ( = ?auto_597743 ?auto_597747 ) ) ( not ( = ?auto_597743 ?auto_597748 ) ) ( not ( = ?auto_597743 ?auto_597749 ) ) ( not ( = ?auto_597743 ?auto_597750 ) ) ( not ( = ?auto_597743 ?auto_597751 ) ) ( not ( = ?auto_597743 ?auto_597752 ) ) ( not ( = ?auto_597743 ?auto_597753 ) ) ( not ( = ?auto_597743 ?auto_597754 ) ) ( not ( = ?auto_597743 ?auto_597755 ) ) ( not ( = ?auto_597743 ?auto_597756 ) ) ( not ( = ?auto_597743 ?auto_597757 ) ) ( not ( = ?auto_597743 ?auto_597758 ) ) ( not ( = ?auto_597743 ?auto_597759 ) ) ( not ( = ?auto_597744 ?auto_597745 ) ) ( not ( = ?auto_597744 ?auto_597746 ) ) ( not ( = ?auto_597744 ?auto_597747 ) ) ( not ( = ?auto_597744 ?auto_597748 ) ) ( not ( = ?auto_597744 ?auto_597749 ) ) ( not ( = ?auto_597744 ?auto_597750 ) ) ( not ( = ?auto_597744 ?auto_597751 ) ) ( not ( = ?auto_597744 ?auto_597752 ) ) ( not ( = ?auto_597744 ?auto_597753 ) ) ( not ( = ?auto_597744 ?auto_597754 ) ) ( not ( = ?auto_597744 ?auto_597755 ) ) ( not ( = ?auto_597744 ?auto_597756 ) ) ( not ( = ?auto_597744 ?auto_597757 ) ) ( not ( = ?auto_597744 ?auto_597758 ) ) ( not ( = ?auto_597744 ?auto_597759 ) ) ( not ( = ?auto_597745 ?auto_597746 ) ) ( not ( = ?auto_597745 ?auto_597747 ) ) ( not ( = ?auto_597745 ?auto_597748 ) ) ( not ( = ?auto_597745 ?auto_597749 ) ) ( not ( = ?auto_597745 ?auto_597750 ) ) ( not ( = ?auto_597745 ?auto_597751 ) ) ( not ( = ?auto_597745 ?auto_597752 ) ) ( not ( = ?auto_597745 ?auto_597753 ) ) ( not ( = ?auto_597745 ?auto_597754 ) ) ( not ( = ?auto_597745 ?auto_597755 ) ) ( not ( = ?auto_597745 ?auto_597756 ) ) ( not ( = ?auto_597745 ?auto_597757 ) ) ( not ( = ?auto_597745 ?auto_597758 ) ) ( not ( = ?auto_597745 ?auto_597759 ) ) ( not ( = ?auto_597746 ?auto_597747 ) ) ( not ( = ?auto_597746 ?auto_597748 ) ) ( not ( = ?auto_597746 ?auto_597749 ) ) ( not ( = ?auto_597746 ?auto_597750 ) ) ( not ( = ?auto_597746 ?auto_597751 ) ) ( not ( = ?auto_597746 ?auto_597752 ) ) ( not ( = ?auto_597746 ?auto_597753 ) ) ( not ( = ?auto_597746 ?auto_597754 ) ) ( not ( = ?auto_597746 ?auto_597755 ) ) ( not ( = ?auto_597746 ?auto_597756 ) ) ( not ( = ?auto_597746 ?auto_597757 ) ) ( not ( = ?auto_597746 ?auto_597758 ) ) ( not ( = ?auto_597746 ?auto_597759 ) ) ( not ( = ?auto_597747 ?auto_597748 ) ) ( not ( = ?auto_597747 ?auto_597749 ) ) ( not ( = ?auto_597747 ?auto_597750 ) ) ( not ( = ?auto_597747 ?auto_597751 ) ) ( not ( = ?auto_597747 ?auto_597752 ) ) ( not ( = ?auto_597747 ?auto_597753 ) ) ( not ( = ?auto_597747 ?auto_597754 ) ) ( not ( = ?auto_597747 ?auto_597755 ) ) ( not ( = ?auto_597747 ?auto_597756 ) ) ( not ( = ?auto_597747 ?auto_597757 ) ) ( not ( = ?auto_597747 ?auto_597758 ) ) ( not ( = ?auto_597747 ?auto_597759 ) ) ( not ( = ?auto_597748 ?auto_597749 ) ) ( not ( = ?auto_597748 ?auto_597750 ) ) ( not ( = ?auto_597748 ?auto_597751 ) ) ( not ( = ?auto_597748 ?auto_597752 ) ) ( not ( = ?auto_597748 ?auto_597753 ) ) ( not ( = ?auto_597748 ?auto_597754 ) ) ( not ( = ?auto_597748 ?auto_597755 ) ) ( not ( = ?auto_597748 ?auto_597756 ) ) ( not ( = ?auto_597748 ?auto_597757 ) ) ( not ( = ?auto_597748 ?auto_597758 ) ) ( not ( = ?auto_597748 ?auto_597759 ) ) ( not ( = ?auto_597749 ?auto_597750 ) ) ( not ( = ?auto_597749 ?auto_597751 ) ) ( not ( = ?auto_597749 ?auto_597752 ) ) ( not ( = ?auto_597749 ?auto_597753 ) ) ( not ( = ?auto_597749 ?auto_597754 ) ) ( not ( = ?auto_597749 ?auto_597755 ) ) ( not ( = ?auto_597749 ?auto_597756 ) ) ( not ( = ?auto_597749 ?auto_597757 ) ) ( not ( = ?auto_597749 ?auto_597758 ) ) ( not ( = ?auto_597749 ?auto_597759 ) ) ( not ( = ?auto_597750 ?auto_597751 ) ) ( not ( = ?auto_597750 ?auto_597752 ) ) ( not ( = ?auto_597750 ?auto_597753 ) ) ( not ( = ?auto_597750 ?auto_597754 ) ) ( not ( = ?auto_597750 ?auto_597755 ) ) ( not ( = ?auto_597750 ?auto_597756 ) ) ( not ( = ?auto_597750 ?auto_597757 ) ) ( not ( = ?auto_597750 ?auto_597758 ) ) ( not ( = ?auto_597750 ?auto_597759 ) ) ( not ( = ?auto_597751 ?auto_597752 ) ) ( not ( = ?auto_597751 ?auto_597753 ) ) ( not ( = ?auto_597751 ?auto_597754 ) ) ( not ( = ?auto_597751 ?auto_597755 ) ) ( not ( = ?auto_597751 ?auto_597756 ) ) ( not ( = ?auto_597751 ?auto_597757 ) ) ( not ( = ?auto_597751 ?auto_597758 ) ) ( not ( = ?auto_597751 ?auto_597759 ) ) ( not ( = ?auto_597752 ?auto_597753 ) ) ( not ( = ?auto_597752 ?auto_597754 ) ) ( not ( = ?auto_597752 ?auto_597755 ) ) ( not ( = ?auto_597752 ?auto_597756 ) ) ( not ( = ?auto_597752 ?auto_597757 ) ) ( not ( = ?auto_597752 ?auto_597758 ) ) ( not ( = ?auto_597752 ?auto_597759 ) ) ( not ( = ?auto_597753 ?auto_597754 ) ) ( not ( = ?auto_597753 ?auto_597755 ) ) ( not ( = ?auto_597753 ?auto_597756 ) ) ( not ( = ?auto_597753 ?auto_597757 ) ) ( not ( = ?auto_597753 ?auto_597758 ) ) ( not ( = ?auto_597753 ?auto_597759 ) ) ( not ( = ?auto_597754 ?auto_597755 ) ) ( not ( = ?auto_597754 ?auto_597756 ) ) ( not ( = ?auto_597754 ?auto_597757 ) ) ( not ( = ?auto_597754 ?auto_597758 ) ) ( not ( = ?auto_597754 ?auto_597759 ) ) ( not ( = ?auto_597755 ?auto_597756 ) ) ( not ( = ?auto_597755 ?auto_597757 ) ) ( not ( = ?auto_597755 ?auto_597758 ) ) ( not ( = ?auto_597755 ?auto_597759 ) ) ( not ( = ?auto_597756 ?auto_597757 ) ) ( not ( = ?auto_597756 ?auto_597758 ) ) ( not ( = ?auto_597756 ?auto_597759 ) ) ( not ( = ?auto_597757 ?auto_597758 ) ) ( not ( = ?auto_597757 ?auto_597759 ) ) ( not ( = ?auto_597758 ?auto_597759 ) ) ( ON ?auto_597758 ?auto_597759 ) ( ON ?auto_597757 ?auto_597758 ) ( ON ?auto_597756 ?auto_597757 ) ( ON ?auto_597755 ?auto_597756 ) ( ON ?auto_597754 ?auto_597755 ) ( ON ?auto_597753 ?auto_597754 ) ( ON ?auto_597752 ?auto_597753 ) ( ON ?auto_597751 ?auto_597752 ) ( ON ?auto_597750 ?auto_597751 ) ( ON ?auto_597749 ?auto_597750 ) ( ON ?auto_597748 ?auto_597749 ) ( ON ?auto_597747 ?auto_597748 ) ( ON ?auto_597746 ?auto_597747 ) ( ON ?auto_597745 ?auto_597746 ) ( CLEAR ?auto_597743 ) ( ON ?auto_597744 ?auto_597745 ) ( CLEAR ?auto_597744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_597743 ?auto_597744 )
      ( MAKE-17PILE ?auto_597743 ?auto_597744 ?auto_597745 ?auto_597746 ?auto_597747 ?auto_597748 ?auto_597749 ?auto_597750 ?auto_597751 ?auto_597752 ?auto_597753 ?auto_597754 ?auto_597755 ?auto_597756 ?auto_597757 ?auto_597758 ?auto_597759 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597777 - BLOCK
      ?auto_597778 - BLOCK
      ?auto_597779 - BLOCK
      ?auto_597780 - BLOCK
      ?auto_597781 - BLOCK
      ?auto_597782 - BLOCK
      ?auto_597783 - BLOCK
      ?auto_597784 - BLOCK
      ?auto_597785 - BLOCK
      ?auto_597786 - BLOCK
      ?auto_597787 - BLOCK
      ?auto_597788 - BLOCK
      ?auto_597789 - BLOCK
      ?auto_597790 - BLOCK
      ?auto_597791 - BLOCK
      ?auto_597792 - BLOCK
      ?auto_597793 - BLOCK
    )
    :vars
    (
      ?auto_597794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597793 ?auto_597794 ) ( not ( = ?auto_597777 ?auto_597778 ) ) ( not ( = ?auto_597777 ?auto_597779 ) ) ( not ( = ?auto_597777 ?auto_597780 ) ) ( not ( = ?auto_597777 ?auto_597781 ) ) ( not ( = ?auto_597777 ?auto_597782 ) ) ( not ( = ?auto_597777 ?auto_597783 ) ) ( not ( = ?auto_597777 ?auto_597784 ) ) ( not ( = ?auto_597777 ?auto_597785 ) ) ( not ( = ?auto_597777 ?auto_597786 ) ) ( not ( = ?auto_597777 ?auto_597787 ) ) ( not ( = ?auto_597777 ?auto_597788 ) ) ( not ( = ?auto_597777 ?auto_597789 ) ) ( not ( = ?auto_597777 ?auto_597790 ) ) ( not ( = ?auto_597777 ?auto_597791 ) ) ( not ( = ?auto_597777 ?auto_597792 ) ) ( not ( = ?auto_597777 ?auto_597793 ) ) ( not ( = ?auto_597777 ?auto_597794 ) ) ( not ( = ?auto_597778 ?auto_597779 ) ) ( not ( = ?auto_597778 ?auto_597780 ) ) ( not ( = ?auto_597778 ?auto_597781 ) ) ( not ( = ?auto_597778 ?auto_597782 ) ) ( not ( = ?auto_597778 ?auto_597783 ) ) ( not ( = ?auto_597778 ?auto_597784 ) ) ( not ( = ?auto_597778 ?auto_597785 ) ) ( not ( = ?auto_597778 ?auto_597786 ) ) ( not ( = ?auto_597778 ?auto_597787 ) ) ( not ( = ?auto_597778 ?auto_597788 ) ) ( not ( = ?auto_597778 ?auto_597789 ) ) ( not ( = ?auto_597778 ?auto_597790 ) ) ( not ( = ?auto_597778 ?auto_597791 ) ) ( not ( = ?auto_597778 ?auto_597792 ) ) ( not ( = ?auto_597778 ?auto_597793 ) ) ( not ( = ?auto_597778 ?auto_597794 ) ) ( not ( = ?auto_597779 ?auto_597780 ) ) ( not ( = ?auto_597779 ?auto_597781 ) ) ( not ( = ?auto_597779 ?auto_597782 ) ) ( not ( = ?auto_597779 ?auto_597783 ) ) ( not ( = ?auto_597779 ?auto_597784 ) ) ( not ( = ?auto_597779 ?auto_597785 ) ) ( not ( = ?auto_597779 ?auto_597786 ) ) ( not ( = ?auto_597779 ?auto_597787 ) ) ( not ( = ?auto_597779 ?auto_597788 ) ) ( not ( = ?auto_597779 ?auto_597789 ) ) ( not ( = ?auto_597779 ?auto_597790 ) ) ( not ( = ?auto_597779 ?auto_597791 ) ) ( not ( = ?auto_597779 ?auto_597792 ) ) ( not ( = ?auto_597779 ?auto_597793 ) ) ( not ( = ?auto_597779 ?auto_597794 ) ) ( not ( = ?auto_597780 ?auto_597781 ) ) ( not ( = ?auto_597780 ?auto_597782 ) ) ( not ( = ?auto_597780 ?auto_597783 ) ) ( not ( = ?auto_597780 ?auto_597784 ) ) ( not ( = ?auto_597780 ?auto_597785 ) ) ( not ( = ?auto_597780 ?auto_597786 ) ) ( not ( = ?auto_597780 ?auto_597787 ) ) ( not ( = ?auto_597780 ?auto_597788 ) ) ( not ( = ?auto_597780 ?auto_597789 ) ) ( not ( = ?auto_597780 ?auto_597790 ) ) ( not ( = ?auto_597780 ?auto_597791 ) ) ( not ( = ?auto_597780 ?auto_597792 ) ) ( not ( = ?auto_597780 ?auto_597793 ) ) ( not ( = ?auto_597780 ?auto_597794 ) ) ( not ( = ?auto_597781 ?auto_597782 ) ) ( not ( = ?auto_597781 ?auto_597783 ) ) ( not ( = ?auto_597781 ?auto_597784 ) ) ( not ( = ?auto_597781 ?auto_597785 ) ) ( not ( = ?auto_597781 ?auto_597786 ) ) ( not ( = ?auto_597781 ?auto_597787 ) ) ( not ( = ?auto_597781 ?auto_597788 ) ) ( not ( = ?auto_597781 ?auto_597789 ) ) ( not ( = ?auto_597781 ?auto_597790 ) ) ( not ( = ?auto_597781 ?auto_597791 ) ) ( not ( = ?auto_597781 ?auto_597792 ) ) ( not ( = ?auto_597781 ?auto_597793 ) ) ( not ( = ?auto_597781 ?auto_597794 ) ) ( not ( = ?auto_597782 ?auto_597783 ) ) ( not ( = ?auto_597782 ?auto_597784 ) ) ( not ( = ?auto_597782 ?auto_597785 ) ) ( not ( = ?auto_597782 ?auto_597786 ) ) ( not ( = ?auto_597782 ?auto_597787 ) ) ( not ( = ?auto_597782 ?auto_597788 ) ) ( not ( = ?auto_597782 ?auto_597789 ) ) ( not ( = ?auto_597782 ?auto_597790 ) ) ( not ( = ?auto_597782 ?auto_597791 ) ) ( not ( = ?auto_597782 ?auto_597792 ) ) ( not ( = ?auto_597782 ?auto_597793 ) ) ( not ( = ?auto_597782 ?auto_597794 ) ) ( not ( = ?auto_597783 ?auto_597784 ) ) ( not ( = ?auto_597783 ?auto_597785 ) ) ( not ( = ?auto_597783 ?auto_597786 ) ) ( not ( = ?auto_597783 ?auto_597787 ) ) ( not ( = ?auto_597783 ?auto_597788 ) ) ( not ( = ?auto_597783 ?auto_597789 ) ) ( not ( = ?auto_597783 ?auto_597790 ) ) ( not ( = ?auto_597783 ?auto_597791 ) ) ( not ( = ?auto_597783 ?auto_597792 ) ) ( not ( = ?auto_597783 ?auto_597793 ) ) ( not ( = ?auto_597783 ?auto_597794 ) ) ( not ( = ?auto_597784 ?auto_597785 ) ) ( not ( = ?auto_597784 ?auto_597786 ) ) ( not ( = ?auto_597784 ?auto_597787 ) ) ( not ( = ?auto_597784 ?auto_597788 ) ) ( not ( = ?auto_597784 ?auto_597789 ) ) ( not ( = ?auto_597784 ?auto_597790 ) ) ( not ( = ?auto_597784 ?auto_597791 ) ) ( not ( = ?auto_597784 ?auto_597792 ) ) ( not ( = ?auto_597784 ?auto_597793 ) ) ( not ( = ?auto_597784 ?auto_597794 ) ) ( not ( = ?auto_597785 ?auto_597786 ) ) ( not ( = ?auto_597785 ?auto_597787 ) ) ( not ( = ?auto_597785 ?auto_597788 ) ) ( not ( = ?auto_597785 ?auto_597789 ) ) ( not ( = ?auto_597785 ?auto_597790 ) ) ( not ( = ?auto_597785 ?auto_597791 ) ) ( not ( = ?auto_597785 ?auto_597792 ) ) ( not ( = ?auto_597785 ?auto_597793 ) ) ( not ( = ?auto_597785 ?auto_597794 ) ) ( not ( = ?auto_597786 ?auto_597787 ) ) ( not ( = ?auto_597786 ?auto_597788 ) ) ( not ( = ?auto_597786 ?auto_597789 ) ) ( not ( = ?auto_597786 ?auto_597790 ) ) ( not ( = ?auto_597786 ?auto_597791 ) ) ( not ( = ?auto_597786 ?auto_597792 ) ) ( not ( = ?auto_597786 ?auto_597793 ) ) ( not ( = ?auto_597786 ?auto_597794 ) ) ( not ( = ?auto_597787 ?auto_597788 ) ) ( not ( = ?auto_597787 ?auto_597789 ) ) ( not ( = ?auto_597787 ?auto_597790 ) ) ( not ( = ?auto_597787 ?auto_597791 ) ) ( not ( = ?auto_597787 ?auto_597792 ) ) ( not ( = ?auto_597787 ?auto_597793 ) ) ( not ( = ?auto_597787 ?auto_597794 ) ) ( not ( = ?auto_597788 ?auto_597789 ) ) ( not ( = ?auto_597788 ?auto_597790 ) ) ( not ( = ?auto_597788 ?auto_597791 ) ) ( not ( = ?auto_597788 ?auto_597792 ) ) ( not ( = ?auto_597788 ?auto_597793 ) ) ( not ( = ?auto_597788 ?auto_597794 ) ) ( not ( = ?auto_597789 ?auto_597790 ) ) ( not ( = ?auto_597789 ?auto_597791 ) ) ( not ( = ?auto_597789 ?auto_597792 ) ) ( not ( = ?auto_597789 ?auto_597793 ) ) ( not ( = ?auto_597789 ?auto_597794 ) ) ( not ( = ?auto_597790 ?auto_597791 ) ) ( not ( = ?auto_597790 ?auto_597792 ) ) ( not ( = ?auto_597790 ?auto_597793 ) ) ( not ( = ?auto_597790 ?auto_597794 ) ) ( not ( = ?auto_597791 ?auto_597792 ) ) ( not ( = ?auto_597791 ?auto_597793 ) ) ( not ( = ?auto_597791 ?auto_597794 ) ) ( not ( = ?auto_597792 ?auto_597793 ) ) ( not ( = ?auto_597792 ?auto_597794 ) ) ( not ( = ?auto_597793 ?auto_597794 ) ) ( ON ?auto_597792 ?auto_597793 ) ( ON ?auto_597791 ?auto_597792 ) ( ON ?auto_597790 ?auto_597791 ) ( ON ?auto_597789 ?auto_597790 ) ( ON ?auto_597788 ?auto_597789 ) ( ON ?auto_597787 ?auto_597788 ) ( ON ?auto_597786 ?auto_597787 ) ( ON ?auto_597785 ?auto_597786 ) ( ON ?auto_597784 ?auto_597785 ) ( ON ?auto_597783 ?auto_597784 ) ( ON ?auto_597782 ?auto_597783 ) ( ON ?auto_597781 ?auto_597782 ) ( ON ?auto_597780 ?auto_597781 ) ( ON ?auto_597779 ?auto_597780 ) ( ON ?auto_597778 ?auto_597779 ) ( ON ?auto_597777 ?auto_597778 ) ( CLEAR ?auto_597777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_597777 )
      ( MAKE-17PILE ?auto_597777 ?auto_597778 ?auto_597779 ?auto_597780 ?auto_597781 ?auto_597782 ?auto_597783 ?auto_597784 ?auto_597785 ?auto_597786 ?auto_597787 ?auto_597788 ?auto_597789 ?auto_597790 ?auto_597791 ?auto_597792 ?auto_597793 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597812 - BLOCK
      ?auto_597813 - BLOCK
      ?auto_597814 - BLOCK
      ?auto_597815 - BLOCK
      ?auto_597816 - BLOCK
      ?auto_597817 - BLOCK
      ?auto_597818 - BLOCK
      ?auto_597819 - BLOCK
      ?auto_597820 - BLOCK
      ?auto_597821 - BLOCK
      ?auto_597822 - BLOCK
      ?auto_597823 - BLOCK
      ?auto_597824 - BLOCK
      ?auto_597825 - BLOCK
      ?auto_597826 - BLOCK
      ?auto_597827 - BLOCK
      ?auto_597828 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_597828 ) ( not ( = ?auto_597812 ?auto_597813 ) ) ( not ( = ?auto_597812 ?auto_597814 ) ) ( not ( = ?auto_597812 ?auto_597815 ) ) ( not ( = ?auto_597812 ?auto_597816 ) ) ( not ( = ?auto_597812 ?auto_597817 ) ) ( not ( = ?auto_597812 ?auto_597818 ) ) ( not ( = ?auto_597812 ?auto_597819 ) ) ( not ( = ?auto_597812 ?auto_597820 ) ) ( not ( = ?auto_597812 ?auto_597821 ) ) ( not ( = ?auto_597812 ?auto_597822 ) ) ( not ( = ?auto_597812 ?auto_597823 ) ) ( not ( = ?auto_597812 ?auto_597824 ) ) ( not ( = ?auto_597812 ?auto_597825 ) ) ( not ( = ?auto_597812 ?auto_597826 ) ) ( not ( = ?auto_597812 ?auto_597827 ) ) ( not ( = ?auto_597812 ?auto_597828 ) ) ( not ( = ?auto_597813 ?auto_597814 ) ) ( not ( = ?auto_597813 ?auto_597815 ) ) ( not ( = ?auto_597813 ?auto_597816 ) ) ( not ( = ?auto_597813 ?auto_597817 ) ) ( not ( = ?auto_597813 ?auto_597818 ) ) ( not ( = ?auto_597813 ?auto_597819 ) ) ( not ( = ?auto_597813 ?auto_597820 ) ) ( not ( = ?auto_597813 ?auto_597821 ) ) ( not ( = ?auto_597813 ?auto_597822 ) ) ( not ( = ?auto_597813 ?auto_597823 ) ) ( not ( = ?auto_597813 ?auto_597824 ) ) ( not ( = ?auto_597813 ?auto_597825 ) ) ( not ( = ?auto_597813 ?auto_597826 ) ) ( not ( = ?auto_597813 ?auto_597827 ) ) ( not ( = ?auto_597813 ?auto_597828 ) ) ( not ( = ?auto_597814 ?auto_597815 ) ) ( not ( = ?auto_597814 ?auto_597816 ) ) ( not ( = ?auto_597814 ?auto_597817 ) ) ( not ( = ?auto_597814 ?auto_597818 ) ) ( not ( = ?auto_597814 ?auto_597819 ) ) ( not ( = ?auto_597814 ?auto_597820 ) ) ( not ( = ?auto_597814 ?auto_597821 ) ) ( not ( = ?auto_597814 ?auto_597822 ) ) ( not ( = ?auto_597814 ?auto_597823 ) ) ( not ( = ?auto_597814 ?auto_597824 ) ) ( not ( = ?auto_597814 ?auto_597825 ) ) ( not ( = ?auto_597814 ?auto_597826 ) ) ( not ( = ?auto_597814 ?auto_597827 ) ) ( not ( = ?auto_597814 ?auto_597828 ) ) ( not ( = ?auto_597815 ?auto_597816 ) ) ( not ( = ?auto_597815 ?auto_597817 ) ) ( not ( = ?auto_597815 ?auto_597818 ) ) ( not ( = ?auto_597815 ?auto_597819 ) ) ( not ( = ?auto_597815 ?auto_597820 ) ) ( not ( = ?auto_597815 ?auto_597821 ) ) ( not ( = ?auto_597815 ?auto_597822 ) ) ( not ( = ?auto_597815 ?auto_597823 ) ) ( not ( = ?auto_597815 ?auto_597824 ) ) ( not ( = ?auto_597815 ?auto_597825 ) ) ( not ( = ?auto_597815 ?auto_597826 ) ) ( not ( = ?auto_597815 ?auto_597827 ) ) ( not ( = ?auto_597815 ?auto_597828 ) ) ( not ( = ?auto_597816 ?auto_597817 ) ) ( not ( = ?auto_597816 ?auto_597818 ) ) ( not ( = ?auto_597816 ?auto_597819 ) ) ( not ( = ?auto_597816 ?auto_597820 ) ) ( not ( = ?auto_597816 ?auto_597821 ) ) ( not ( = ?auto_597816 ?auto_597822 ) ) ( not ( = ?auto_597816 ?auto_597823 ) ) ( not ( = ?auto_597816 ?auto_597824 ) ) ( not ( = ?auto_597816 ?auto_597825 ) ) ( not ( = ?auto_597816 ?auto_597826 ) ) ( not ( = ?auto_597816 ?auto_597827 ) ) ( not ( = ?auto_597816 ?auto_597828 ) ) ( not ( = ?auto_597817 ?auto_597818 ) ) ( not ( = ?auto_597817 ?auto_597819 ) ) ( not ( = ?auto_597817 ?auto_597820 ) ) ( not ( = ?auto_597817 ?auto_597821 ) ) ( not ( = ?auto_597817 ?auto_597822 ) ) ( not ( = ?auto_597817 ?auto_597823 ) ) ( not ( = ?auto_597817 ?auto_597824 ) ) ( not ( = ?auto_597817 ?auto_597825 ) ) ( not ( = ?auto_597817 ?auto_597826 ) ) ( not ( = ?auto_597817 ?auto_597827 ) ) ( not ( = ?auto_597817 ?auto_597828 ) ) ( not ( = ?auto_597818 ?auto_597819 ) ) ( not ( = ?auto_597818 ?auto_597820 ) ) ( not ( = ?auto_597818 ?auto_597821 ) ) ( not ( = ?auto_597818 ?auto_597822 ) ) ( not ( = ?auto_597818 ?auto_597823 ) ) ( not ( = ?auto_597818 ?auto_597824 ) ) ( not ( = ?auto_597818 ?auto_597825 ) ) ( not ( = ?auto_597818 ?auto_597826 ) ) ( not ( = ?auto_597818 ?auto_597827 ) ) ( not ( = ?auto_597818 ?auto_597828 ) ) ( not ( = ?auto_597819 ?auto_597820 ) ) ( not ( = ?auto_597819 ?auto_597821 ) ) ( not ( = ?auto_597819 ?auto_597822 ) ) ( not ( = ?auto_597819 ?auto_597823 ) ) ( not ( = ?auto_597819 ?auto_597824 ) ) ( not ( = ?auto_597819 ?auto_597825 ) ) ( not ( = ?auto_597819 ?auto_597826 ) ) ( not ( = ?auto_597819 ?auto_597827 ) ) ( not ( = ?auto_597819 ?auto_597828 ) ) ( not ( = ?auto_597820 ?auto_597821 ) ) ( not ( = ?auto_597820 ?auto_597822 ) ) ( not ( = ?auto_597820 ?auto_597823 ) ) ( not ( = ?auto_597820 ?auto_597824 ) ) ( not ( = ?auto_597820 ?auto_597825 ) ) ( not ( = ?auto_597820 ?auto_597826 ) ) ( not ( = ?auto_597820 ?auto_597827 ) ) ( not ( = ?auto_597820 ?auto_597828 ) ) ( not ( = ?auto_597821 ?auto_597822 ) ) ( not ( = ?auto_597821 ?auto_597823 ) ) ( not ( = ?auto_597821 ?auto_597824 ) ) ( not ( = ?auto_597821 ?auto_597825 ) ) ( not ( = ?auto_597821 ?auto_597826 ) ) ( not ( = ?auto_597821 ?auto_597827 ) ) ( not ( = ?auto_597821 ?auto_597828 ) ) ( not ( = ?auto_597822 ?auto_597823 ) ) ( not ( = ?auto_597822 ?auto_597824 ) ) ( not ( = ?auto_597822 ?auto_597825 ) ) ( not ( = ?auto_597822 ?auto_597826 ) ) ( not ( = ?auto_597822 ?auto_597827 ) ) ( not ( = ?auto_597822 ?auto_597828 ) ) ( not ( = ?auto_597823 ?auto_597824 ) ) ( not ( = ?auto_597823 ?auto_597825 ) ) ( not ( = ?auto_597823 ?auto_597826 ) ) ( not ( = ?auto_597823 ?auto_597827 ) ) ( not ( = ?auto_597823 ?auto_597828 ) ) ( not ( = ?auto_597824 ?auto_597825 ) ) ( not ( = ?auto_597824 ?auto_597826 ) ) ( not ( = ?auto_597824 ?auto_597827 ) ) ( not ( = ?auto_597824 ?auto_597828 ) ) ( not ( = ?auto_597825 ?auto_597826 ) ) ( not ( = ?auto_597825 ?auto_597827 ) ) ( not ( = ?auto_597825 ?auto_597828 ) ) ( not ( = ?auto_597826 ?auto_597827 ) ) ( not ( = ?auto_597826 ?auto_597828 ) ) ( not ( = ?auto_597827 ?auto_597828 ) ) ( ON ?auto_597827 ?auto_597828 ) ( ON ?auto_597826 ?auto_597827 ) ( ON ?auto_597825 ?auto_597826 ) ( ON ?auto_597824 ?auto_597825 ) ( ON ?auto_597823 ?auto_597824 ) ( ON ?auto_597822 ?auto_597823 ) ( ON ?auto_597821 ?auto_597822 ) ( ON ?auto_597820 ?auto_597821 ) ( ON ?auto_597819 ?auto_597820 ) ( ON ?auto_597818 ?auto_597819 ) ( ON ?auto_597817 ?auto_597818 ) ( ON ?auto_597816 ?auto_597817 ) ( ON ?auto_597815 ?auto_597816 ) ( ON ?auto_597814 ?auto_597815 ) ( ON ?auto_597813 ?auto_597814 ) ( ON ?auto_597812 ?auto_597813 ) ( CLEAR ?auto_597812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_597812 )
      ( MAKE-17PILE ?auto_597812 ?auto_597813 ?auto_597814 ?auto_597815 ?auto_597816 ?auto_597817 ?auto_597818 ?auto_597819 ?auto_597820 ?auto_597821 ?auto_597822 ?auto_597823 ?auto_597824 ?auto_597825 ?auto_597826 ?auto_597827 ?auto_597828 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_597846 - BLOCK
      ?auto_597847 - BLOCK
      ?auto_597848 - BLOCK
      ?auto_597849 - BLOCK
      ?auto_597850 - BLOCK
      ?auto_597851 - BLOCK
      ?auto_597852 - BLOCK
      ?auto_597853 - BLOCK
      ?auto_597854 - BLOCK
      ?auto_597855 - BLOCK
      ?auto_597856 - BLOCK
      ?auto_597857 - BLOCK
      ?auto_597858 - BLOCK
      ?auto_597859 - BLOCK
      ?auto_597860 - BLOCK
      ?auto_597861 - BLOCK
      ?auto_597862 - BLOCK
    )
    :vars
    (
      ?auto_597863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_597846 ?auto_597847 ) ) ( not ( = ?auto_597846 ?auto_597848 ) ) ( not ( = ?auto_597846 ?auto_597849 ) ) ( not ( = ?auto_597846 ?auto_597850 ) ) ( not ( = ?auto_597846 ?auto_597851 ) ) ( not ( = ?auto_597846 ?auto_597852 ) ) ( not ( = ?auto_597846 ?auto_597853 ) ) ( not ( = ?auto_597846 ?auto_597854 ) ) ( not ( = ?auto_597846 ?auto_597855 ) ) ( not ( = ?auto_597846 ?auto_597856 ) ) ( not ( = ?auto_597846 ?auto_597857 ) ) ( not ( = ?auto_597846 ?auto_597858 ) ) ( not ( = ?auto_597846 ?auto_597859 ) ) ( not ( = ?auto_597846 ?auto_597860 ) ) ( not ( = ?auto_597846 ?auto_597861 ) ) ( not ( = ?auto_597846 ?auto_597862 ) ) ( not ( = ?auto_597847 ?auto_597848 ) ) ( not ( = ?auto_597847 ?auto_597849 ) ) ( not ( = ?auto_597847 ?auto_597850 ) ) ( not ( = ?auto_597847 ?auto_597851 ) ) ( not ( = ?auto_597847 ?auto_597852 ) ) ( not ( = ?auto_597847 ?auto_597853 ) ) ( not ( = ?auto_597847 ?auto_597854 ) ) ( not ( = ?auto_597847 ?auto_597855 ) ) ( not ( = ?auto_597847 ?auto_597856 ) ) ( not ( = ?auto_597847 ?auto_597857 ) ) ( not ( = ?auto_597847 ?auto_597858 ) ) ( not ( = ?auto_597847 ?auto_597859 ) ) ( not ( = ?auto_597847 ?auto_597860 ) ) ( not ( = ?auto_597847 ?auto_597861 ) ) ( not ( = ?auto_597847 ?auto_597862 ) ) ( not ( = ?auto_597848 ?auto_597849 ) ) ( not ( = ?auto_597848 ?auto_597850 ) ) ( not ( = ?auto_597848 ?auto_597851 ) ) ( not ( = ?auto_597848 ?auto_597852 ) ) ( not ( = ?auto_597848 ?auto_597853 ) ) ( not ( = ?auto_597848 ?auto_597854 ) ) ( not ( = ?auto_597848 ?auto_597855 ) ) ( not ( = ?auto_597848 ?auto_597856 ) ) ( not ( = ?auto_597848 ?auto_597857 ) ) ( not ( = ?auto_597848 ?auto_597858 ) ) ( not ( = ?auto_597848 ?auto_597859 ) ) ( not ( = ?auto_597848 ?auto_597860 ) ) ( not ( = ?auto_597848 ?auto_597861 ) ) ( not ( = ?auto_597848 ?auto_597862 ) ) ( not ( = ?auto_597849 ?auto_597850 ) ) ( not ( = ?auto_597849 ?auto_597851 ) ) ( not ( = ?auto_597849 ?auto_597852 ) ) ( not ( = ?auto_597849 ?auto_597853 ) ) ( not ( = ?auto_597849 ?auto_597854 ) ) ( not ( = ?auto_597849 ?auto_597855 ) ) ( not ( = ?auto_597849 ?auto_597856 ) ) ( not ( = ?auto_597849 ?auto_597857 ) ) ( not ( = ?auto_597849 ?auto_597858 ) ) ( not ( = ?auto_597849 ?auto_597859 ) ) ( not ( = ?auto_597849 ?auto_597860 ) ) ( not ( = ?auto_597849 ?auto_597861 ) ) ( not ( = ?auto_597849 ?auto_597862 ) ) ( not ( = ?auto_597850 ?auto_597851 ) ) ( not ( = ?auto_597850 ?auto_597852 ) ) ( not ( = ?auto_597850 ?auto_597853 ) ) ( not ( = ?auto_597850 ?auto_597854 ) ) ( not ( = ?auto_597850 ?auto_597855 ) ) ( not ( = ?auto_597850 ?auto_597856 ) ) ( not ( = ?auto_597850 ?auto_597857 ) ) ( not ( = ?auto_597850 ?auto_597858 ) ) ( not ( = ?auto_597850 ?auto_597859 ) ) ( not ( = ?auto_597850 ?auto_597860 ) ) ( not ( = ?auto_597850 ?auto_597861 ) ) ( not ( = ?auto_597850 ?auto_597862 ) ) ( not ( = ?auto_597851 ?auto_597852 ) ) ( not ( = ?auto_597851 ?auto_597853 ) ) ( not ( = ?auto_597851 ?auto_597854 ) ) ( not ( = ?auto_597851 ?auto_597855 ) ) ( not ( = ?auto_597851 ?auto_597856 ) ) ( not ( = ?auto_597851 ?auto_597857 ) ) ( not ( = ?auto_597851 ?auto_597858 ) ) ( not ( = ?auto_597851 ?auto_597859 ) ) ( not ( = ?auto_597851 ?auto_597860 ) ) ( not ( = ?auto_597851 ?auto_597861 ) ) ( not ( = ?auto_597851 ?auto_597862 ) ) ( not ( = ?auto_597852 ?auto_597853 ) ) ( not ( = ?auto_597852 ?auto_597854 ) ) ( not ( = ?auto_597852 ?auto_597855 ) ) ( not ( = ?auto_597852 ?auto_597856 ) ) ( not ( = ?auto_597852 ?auto_597857 ) ) ( not ( = ?auto_597852 ?auto_597858 ) ) ( not ( = ?auto_597852 ?auto_597859 ) ) ( not ( = ?auto_597852 ?auto_597860 ) ) ( not ( = ?auto_597852 ?auto_597861 ) ) ( not ( = ?auto_597852 ?auto_597862 ) ) ( not ( = ?auto_597853 ?auto_597854 ) ) ( not ( = ?auto_597853 ?auto_597855 ) ) ( not ( = ?auto_597853 ?auto_597856 ) ) ( not ( = ?auto_597853 ?auto_597857 ) ) ( not ( = ?auto_597853 ?auto_597858 ) ) ( not ( = ?auto_597853 ?auto_597859 ) ) ( not ( = ?auto_597853 ?auto_597860 ) ) ( not ( = ?auto_597853 ?auto_597861 ) ) ( not ( = ?auto_597853 ?auto_597862 ) ) ( not ( = ?auto_597854 ?auto_597855 ) ) ( not ( = ?auto_597854 ?auto_597856 ) ) ( not ( = ?auto_597854 ?auto_597857 ) ) ( not ( = ?auto_597854 ?auto_597858 ) ) ( not ( = ?auto_597854 ?auto_597859 ) ) ( not ( = ?auto_597854 ?auto_597860 ) ) ( not ( = ?auto_597854 ?auto_597861 ) ) ( not ( = ?auto_597854 ?auto_597862 ) ) ( not ( = ?auto_597855 ?auto_597856 ) ) ( not ( = ?auto_597855 ?auto_597857 ) ) ( not ( = ?auto_597855 ?auto_597858 ) ) ( not ( = ?auto_597855 ?auto_597859 ) ) ( not ( = ?auto_597855 ?auto_597860 ) ) ( not ( = ?auto_597855 ?auto_597861 ) ) ( not ( = ?auto_597855 ?auto_597862 ) ) ( not ( = ?auto_597856 ?auto_597857 ) ) ( not ( = ?auto_597856 ?auto_597858 ) ) ( not ( = ?auto_597856 ?auto_597859 ) ) ( not ( = ?auto_597856 ?auto_597860 ) ) ( not ( = ?auto_597856 ?auto_597861 ) ) ( not ( = ?auto_597856 ?auto_597862 ) ) ( not ( = ?auto_597857 ?auto_597858 ) ) ( not ( = ?auto_597857 ?auto_597859 ) ) ( not ( = ?auto_597857 ?auto_597860 ) ) ( not ( = ?auto_597857 ?auto_597861 ) ) ( not ( = ?auto_597857 ?auto_597862 ) ) ( not ( = ?auto_597858 ?auto_597859 ) ) ( not ( = ?auto_597858 ?auto_597860 ) ) ( not ( = ?auto_597858 ?auto_597861 ) ) ( not ( = ?auto_597858 ?auto_597862 ) ) ( not ( = ?auto_597859 ?auto_597860 ) ) ( not ( = ?auto_597859 ?auto_597861 ) ) ( not ( = ?auto_597859 ?auto_597862 ) ) ( not ( = ?auto_597860 ?auto_597861 ) ) ( not ( = ?auto_597860 ?auto_597862 ) ) ( not ( = ?auto_597861 ?auto_597862 ) ) ( ON ?auto_597846 ?auto_597863 ) ( not ( = ?auto_597862 ?auto_597863 ) ) ( not ( = ?auto_597861 ?auto_597863 ) ) ( not ( = ?auto_597860 ?auto_597863 ) ) ( not ( = ?auto_597859 ?auto_597863 ) ) ( not ( = ?auto_597858 ?auto_597863 ) ) ( not ( = ?auto_597857 ?auto_597863 ) ) ( not ( = ?auto_597856 ?auto_597863 ) ) ( not ( = ?auto_597855 ?auto_597863 ) ) ( not ( = ?auto_597854 ?auto_597863 ) ) ( not ( = ?auto_597853 ?auto_597863 ) ) ( not ( = ?auto_597852 ?auto_597863 ) ) ( not ( = ?auto_597851 ?auto_597863 ) ) ( not ( = ?auto_597850 ?auto_597863 ) ) ( not ( = ?auto_597849 ?auto_597863 ) ) ( not ( = ?auto_597848 ?auto_597863 ) ) ( not ( = ?auto_597847 ?auto_597863 ) ) ( not ( = ?auto_597846 ?auto_597863 ) ) ( ON ?auto_597847 ?auto_597846 ) ( ON ?auto_597848 ?auto_597847 ) ( ON ?auto_597849 ?auto_597848 ) ( ON ?auto_597850 ?auto_597849 ) ( ON ?auto_597851 ?auto_597850 ) ( ON ?auto_597852 ?auto_597851 ) ( ON ?auto_597853 ?auto_597852 ) ( ON ?auto_597854 ?auto_597853 ) ( ON ?auto_597855 ?auto_597854 ) ( ON ?auto_597856 ?auto_597855 ) ( ON ?auto_597857 ?auto_597856 ) ( ON ?auto_597858 ?auto_597857 ) ( ON ?auto_597859 ?auto_597858 ) ( ON ?auto_597860 ?auto_597859 ) ( ON ?auto_597861 ?auto_597860 ) ( ON ?auto_597862 ?auto_597861 ) ( CLEAR ?auto_597862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_597862 ?auto_597861 ?auto_597860 ?auto_597859 ?auto_597858 ?auto_597857 ?auto_597856 ?auto_597855 ?auto_597854 ?auto_597853 ?auto_597852 ?auto_597851 ?auto_597850 ?auto_597849 ?auto_597848 ?auto_597847 ?auto_597846 )
      ( MAKE-17PILE ?auto_597846 ?auto_597847 ?auto_597848 ?auto_597849 ?auto_597850 ?auto_597851 ?auto_597852 ?auto_597853 ?auto_597854 ?auto_597855 ?auto_597856 ?auto_597857 ?auto_597858 ?auto_597859 ?auto_597860 ?auto_597861 ?auto_597862 ) )
  )

)

