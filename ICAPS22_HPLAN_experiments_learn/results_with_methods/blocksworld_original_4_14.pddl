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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14534 - BLOCK
      ?auto_14535 - BLOCK
      ?auto_14536 - BLOCK
      ?auto_14537 - BLOCK
    )
    :vars
    (
      ?auto_14538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14538 ?auto_14537 ) ( CLEAR ?auto_14538 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14534 ) ( ON ?auto_14535 ?auto_14534 ) ( ON ?auto_14536 ?auto_14535 ) ( ON ?auto_14537 ?auto_14536 ) ( not ( = ?auto_14534 ?auto_14535 ) ) ( not ( = ?auto_14534 ?auto_14536 ) ) ( not ( = ?auto_14534 ?auto_14537 ) ) ( not ( = ?auto_14534 ?auto_14538 ) ) ( not ( = ?auto_14535 ?auto_14536 ) ) ( not ( = ?auto_14535 ?auto_14537 ) ) ( not ( = ?auto_14535 ?auto_14538 ) ) ( not ( = ?auto_14536 ?auto_14537 ) ) ( not ( = ?auto_14536 ?auto_14538 ) ) ( not ( = ?auto_14537 ?auto_14538 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14538 ?auto_14537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14540 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14540 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14541 - BLOCK
    )
    :vars
    (
      ?auto_14542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14541 ?auto_14542 ) ( CLEAR ?auto_14541 ) ( HAND-EMPTY ) ( not ( = ?auto_14541 ?auto_14542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14541 ?auto_14542 )
      ( MAKE-1PILE ?auto_14541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14546 - BLOCK
      ?auto_14547 - BLOCK
      ?auto_14548 - BLOCK
    )
    :vars
    (
      ?auto_14549 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14549 ?auto_14548 ) ( CLEAR ?auto_14549 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14546 ) ( ON ?auto_14547 ?auto_14546 ) ( ON ?auto_14548 ?auto_14547 ) ( not ( = ?auto_14546 ?auto_14547 ) ) ( not ( = ?auto_14546 ?auto_14548 ) ) ( not ( = ?auto_14546 ?auto_14549 ) ) ( not ( = ?auto_14547 ?auto_14548 ) ) ( not ( = ?auto_14547 ?auto_14549 ) ) ( not ( = ?auto_14548 ?auto_14549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14549 ?auto_14548 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14550 - BLOCK
      ?auto_14551 - BLOCK
      ?auto_14552 - BLOCK
    )
    :vars
    (
      ?auto_14553 - BLOCK
      ?auto_14554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14553 ?auto_14552 ) ( CLEAR ?auto_14553 ) ( ON-TABLE ?auto_14550 ) ( ON ?auto_14551 ?auto_14550 ) ( ON ?auto_14552 ?auto_14551 ) ( not ( = ?auto_14550 ?auto_14551 ) ) ( not ( = ?auto_14550 ?auto_14552 ) ) ( not ( = ?auto_14550 ?auto_14553 ) ) ( not ( = ?auto_14551 ?auto_14552 ) ) ( not ( = ?auto_14551 ?auto_14553 ) ) ( not ( = ?auto_14552 ?auto_14553 ) ) ( HOLDING ?auto_14554 ) ( not ( = ?auto_14550 ?auto_14554 ) ) ( not ( = ?auto_14551 ?auto_14554 ) ) ( not ( = ?auto_14552 ?auto_14554 ) ) ( not ( = ?auto_14553 ?auto_14554 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14554 )
      ( MAKE-3PILE ?auto_14550 ?auto_14551 ?auto_14552 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14555 - BLOCK
      ?auto_14556 - BLOCK
      ?auto_14557 - BLOCK
    )
    :vars
    (
      ?auto_14558 - BLOCK
      ?auto_14559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14558 ?auto_14557 ) ( ON-TABLE ?auto_14555 ) ( ON ?auto_14556 ?auto_14555 ) ( ON ?auto_14557 ?auto_14556 ) ( not ( = ?auto_14555 ?auto_14556 ) ) ( not ( = ?auto_14555 ?auto_14557 ) ) ( not ( = ?auto_14555 ?auto_14558 ) ) ( not ( = ?auto_14556 ?auto_14557 ) ) ( not ( = ?auto_14556 ?auto_14558 ) ) ( not ( = ?auto_14557 ?auto_14558 ) ) ( not ( = ?auto_14555 ?auto_14559 ) ) ( not ( = ?auto_14556 ?auto_14559 ) ) ( not ( = ?auto_14557 ?auto_14559 ) ) ( not ( = ?auto_14558 ?auto_14559 ) ) ( ON ?auto_14559 ?auto_14558 ) ( CLEAR ?auto_14559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14555 ?auto_14556 ?auto_14557 ?auto_14558 )
      ( MAKE-3PILE ?auto_14555 ?auto_14556 ?auto_14557 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14562 - BLOCK
      ?auto_14563 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14563 ) ( CLEAR ?auto_14562 ) ( ON-TABLE ?auto_14562 ) ( not ( = ?auto_14562 ?auto_14563 ) ) )
    :subtasks
    ( ( !STACK ?auto_14563 ?auto_14562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14564 - BLOCK
      ?auto_14565 - BLOCK
    )
    :vars
    (
      ?auto_14566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14564 ) ( ON-TABLE ?auto_14564 ) ( not ( = ?auto_14564 ?auto_14565 ) ) ( ON ?auto_14565 ?auto_14566 ) ( CLEAR ?auto_14565 ) ( HAND-EMPTY ) ( not ( = ?auto_14564 ?auto_14566 ) ) ( not ( = ?auto_14565 ?auto_14566 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14565 ?auto_14566 )
      ( MAKE-2PILE ?auto_14564 ?auto_14565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14567 - BLOCK
      ?auto_14568 - BLOCK
    )
    :vars
    (
      ?auto_14569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14567 ?auto_14568 ) ) ( ON ?auto_14568 ?auto_14569 ) ( CLEAR ?auto_14568 ) ( not ( = ?auto_14567 ?auto_14569 ) ) ( not ( = ?auto_14568 ?auto_14569 ) ) ( HOLDING ?auto_14567 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14567 )
      ( MAKE-2PILE ?auto_14567 ?auto_14568 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14570 - BLOCK
      ?auto_14571 - BLOCK
    )
    :vars
    (
      ?auto_14572 - BLOCK
      ?auto_14573 - BLOCK
      ?auto_14574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14570 ?auto_14571 ) ) ( ON ?auto_14571 ?auto_14572 ) ( not ( = ?auto_14570 ?auto_14572 ) ) ( not ( = ?auto_14571 ?auto_14572 ) ) ( ON ?auto_14570 ?auto_14571 ) ( CLEAR ?auto_14570 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14573 ) ( ON ?auto_14574 ?auto_14573 ) ( ON ?auto_14572 ?auto_14574 ) ( not ( = ?auto_14573 ?auto_14574 ) ) ( not ( = ?auto_14573 ?auto_14572 ) ) ( not ( = ?auto_14573 ?auto_14571 ) ) ( not ( = ?auto_14573 ?auto_14570 ) ) ( not ( = ?auto_14574 ?auto_14572 ) ) ( not ( = ?auto_14574 ?auto_14571 ) ) ( not ( = ?auto_14574 ?auto_14570 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14573 ?auto_14574 ?auto_14572 ?auto_14571 )
      ( MAKE-2PILE ?auto_14570 ?auto_14571 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14577 - BLOCK
      ?auto_14578 - BLOCK
    )
    :vars
    (
      ?auto_14579 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14579 ?auto_14578 ) ( CLEAR ?auto_14579 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14577 ) ( ON ?auto_14578 ?auto_14577 ) ( not ( = ?auto_14577 ?auto_14578 ) ) ( not ( = ?auto_14577 ?auto_14579 ) ) ( not ( = ?auto_14578 ?auto_14579 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14579 ?auto_14578 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14580 - BLOCK
      ?auto_14581 - BLOCK
    )
    :vars
    (
      ?auto_14582 - BLOCK
      ?auto_14583 - BLOCK
      ?auto_14584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14582 ?auto_14581 ) ( CLEAR ?auto_14582 ) ( ON-TABLE ?auto_14580 ) ( ON ?auto_14581 ?auto_14580 ) ( not ( = ?auto_14580 ?auto_14581 ) ) ( not ( = ?auto_14580 ?auto_14582 ) ) ( not ( = ?auto_14581 ?auto_14582 ) ) ( HOLDING ?auto_14583 ) ( CLEAR ?auto_14584 ) ( not ( = ?auto_14580 ?auto_14583 ) ) ( not ( = ?auto_14580 ?auto_14584 ) ) ( not ( = ?auto_14581 ?auto_14583 ) ) ( not ( = ?auto_14581 ?auto_14584 ) ) ( not ( = ?auto_14582 ?auto_14583 ) ) ( not ( = ?auto_14582 ?auto_14584 ) ) ( not ( = ?auto_14583 ?auto_14584 ) ) )
    :subtasks
    ( ( !STACK ?auto_14583 ?auto_14584 )
      ( MAKE-2PILE ?auto_14580 ?auto_14581 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14585 - BLOCK
      ?auto_14586 - BLOCK
    )
    :vars
    (
      ?auto_14587 - BLOCK
      ?auto_14588 - BLOCK
      ?auto_14589 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14587 ?auto_14586 ) ( ON-TABLE ?auto_14585 ) ( ON ?auto_14586 ?auto_14585 ) ( not ( = ?auto_14585 ?auto_14586 ) ) ( not ( = ?auto_14585 ?auto_14587 ) ) ( not ( = ?auto_14586 ?auto_14587 ) ) ( CLEAR ?auto_14588 ) ( not ( = ?auto_14585 ?auto_14589 ) ) ( not ( = ?auto_14585 ?auto_14588 ) ) ( not ( = ?auto_14586 ?auto_14589 ) ) ( not ( = ?auto_14586 ?auto_14588 ) ) ( not ( = ?auto_14587 ?auto_14589 ) ) ( not ( = ?auto_14587 ?auto_14588 ) ) ( not ( = ?auto_14589 ?auto_14588 ) ) ( ON ?auto_14589 ?auto_14587 ) ( CLEAR ?auto_14589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14585 ?auto_14586 ?auto_14587 )
      ( MAKE-2PILE ?auto_14585 ?auto_14586 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14590 - BLOCK
      ?auto_14591 - BLOCK
    )
    :vars
    (
      ?auto_14593 - BLOCK
      ?auto_14594 - BLOCK
      ?auto_14592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14593 ?auto_14591 ) ( ON-TABLE ?auto_14590 ) ( ON ?auto_14591 ?auto_14590 ) ( not ( = ?auto_14590 ?auto_14591 ) ) ( not ( = ?auto_14590 ?auto_14593 ) ) ( not ( = ?auto_14591 ?auto_14593 ) ) ( not ( = ?auto_14590 ?auto_14594 ) ) ( not ( = ?auto_14590 ?auto_14592 ) ) ( not ( = ?auto_14591 ?auto_14594 ) ) ( not ( = ?auto_14591 ?auto_14592 ) ) ( not ( = ?auto_14593 ?auto_14594 ) ) ( not ( = ?auto_14593 ?auto_14592 ) ) ( not ( = ?auto_14594 ?auto_14592 ) ) ( ON ?auto_14594 ?auto_14593 ) ( CLEAR ?auto_14594 ) ( HOLDING ?auto_14592 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14592 )
      ( MAKE-2PILE ?auto_14590 ?auto_14591 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14595 - BLOCK
      ?auto_14596 - BLOCK
    )
    :vars
    (
      ?auto_14599 - BLOCK
      ?auto_14598 - BLOCK
      ?auto_14597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14599 ?auto_14596 ) ( ON-TABLE ?auto_14595 ) ( ON ?auto_14596 ?auto_14595 ) ( not ( = ?auto_14595 ?auto_14596 ) ) ( not ( = ?auto_14595 ?auto_14599 ) ) ( not ( = ?auto_14596 ?auto_14599 ) ) ( not ( = ?auto_14595 ?auto_14598 ) ) ( not ( = ?auto_14595 ?auto_14597 ) ) ( not ( = ?auto_14596 ?auto_14598 ) ) ( not ( = ?auto_14596 ?auto_14597 ) ) ( not ( = ?auto_14599 ?auto_14598 ) ) ( not ( = ?auto_14599 ?auto_14597 ) ) ( not ( = ?auto_14598 ?auto_14597 ) ) ( ON ?auto_14598 ?auto_14599 ) ( ON ?auto_14597 ?auto_14598 ) ( CLEAR ?auto_14597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14595 ?auto_14596 ?auto_14599 ?auto_14598 )
      ( MAKE-2PILE ?auto_14595 ?auto_14596 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14603 - BLOCK
      ?auto_14604 - BLOCK
      ?auto_14605 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14605 ) ( CLEAR ?auto_14604 ) ( ON-TABLE ?auto_14603 ) ( ON ?auto_14604 ?auto_14603 ) ( not ( = ?auto_14603 ?auto_14604 ) ) ( not ( = ?auto_14603 ?auto_14605 ) ) ( not ( = ?auto_14604 ?auto_14605 ) ) )
    :subtasks
    ( ( !STACK ?auto_14605 ?auto_14604 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14606 - BLOCK
      ?auto_14607 - BLOCK
      ?auto_14608 - BLOCK
    )
    :vars
    (
      ?auto_14609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14607 ) ( ON-TABLE ?auto_14606 ) ( ON ?auto_14607 ?auto_14606 ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( not ( = ?auto_14607 ?auto_14608 ) ) ( ON ?auto_14608 ?auto_14609 ) ( CLEAR ?auto_14608 ) ( HAND-EMPTY ) ( not ( = ?auto_14606 ?auto_14609 ) ) ( not ( = ?auto_14607 ?auto_14609 ) ) ( not ( = ?auto_14608 ?auto_14609 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14608 ?auto_14609 )
      ( MAKE-3PILE ?auto_14606 ?auto_14607 ?auto_14608 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14610 - BLOCK
      ?auto_14611 - BLOCK
      ?auto_14612 - BLOCK
    )
    :vars
    (
      ?auto_14613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14610 ) ( not ( = ?auto_14610 ?auto_14611 ) ) ( not ( = ?auto_14610 ?auto_14612 ) ) ( not ( = ?auto_14611 ?auto_14612 ) ) ( ON ?auto_14612 ?auto_14613 ) ( CLEAR ?auto_14612 ) ( not ( = ?auto_14610 ?auto_14613 ) ) ( not ( = ?auto_14611 ?auto_14613 ) ) ( not ( = ?auto_14612 ?auto_14613 ) ) ( HOLDING ?auto_14611 ) ( CLEAR ?auto_14610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14610 ?auto_14611 )
      ( MAKE-3PILE ?auto_14610 ?auto_14611 ?auto_14612 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14614 - BLOCK
      ?auto_14615 - BLOCK
      ?auto_14616 - BLOCK
    )
    :vars
    (
      ?auto_14617 - BLOCK
      ?auto_14618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14614 ) ( not ( = ?auto_14614 ?auto_14615 ) ) ( not ( = ?auto_14614 ?auto_14616 ) ) ( not ( = ?auto_14615 ?auto_14616 ) ) ( ON ?auto_14616 ?auto_14617 ) ( not ( = ?auto_14614 ?auto_14617 ) ) ( not ( = ?auto_14615 ?auto_14617 ) ) ( not ( = ?auto_14616 ?auto_14617 ) ) ( CLEAR ?auto_14614 ) ( ON ?auto_14615 ?auto_14616 ) ( CLEAR ?auto_14615 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14618 ) ( ON ?auto_14617 ?auto_14618 ) ( not ( = ?auto_14618 ?auto_14617 ) ) ( not ( = ?auto_14618 ?auto_14616 ) ) ( not ( = ?auto_14618 ?auto_14615 ) ) ( not ( = ?auto_14614 ?auto_14618 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14618 ?auto_14617 ?auto_14616 )
      ( MAKE-3PILE ?auto_14614 ?auto_14615 ?auto_14616 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14619 - BLOCK
      ?auto_14620 - BLOCK
      ?auto_14621 - BLOCK
    )
    :vars
    (
      ?auto_14623 - BLOCK
      ?auto_14622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14619 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14621 ) ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( ON ?auto_14621 ?auto_14623 ) ( not ( = ?auto_14619 ?auto_14623 ) ) ( not ( = ?auto_14620 ?auto_14623 ) ) ( not ( = ?auto_14621 ?auto_14623 ) ) ( ON ?auto_14620 ?auto_14621 ) ( CLEAR ?auto_14620 ) ( ON-TABLE ?auto_14622 ) ( ON ?auto_14623 ?auto_14622 ) ( not ( = ?auto_14622 ?auto_14623 ) ) ( not ( = ?auto_14622 ?auto_14621 ) ) ( not ( = ?auto_14622 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14622 ) ) ( HOLDING ?auto_14619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14619 )
      ( MAKE-3PILE ?auto_14619 ?auto_14620 ?auto_14621 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14624 - BLOCK
      ?auto_14625 - BLOCK
      ?auto_14626 - BLOCK
    )
    :vars
    (
      ?auto_14628 - BLOCK
      ?auto_14627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14624 ?auto_14625 ) ) ( not ( = ?auto_14624 ?auto_14626 ) ) ( not ( = ?auto_14625 ?auto_14626 ) ) ( ON ?auto_14626 ?auto_14628 ) ( not ( = ?auto_14624 ?auto_14628 ) ) ( not ( = ?auto_14625 ?auto_14628 ) ) ( not ( = ?auto_14626 ?auto_14628 ) ) ( ON ?auto_14625 ?auto_14626 ) ( ON-TABLE ?auto_14627 ) ( ON ?auto_14628 ?auto_14627 ) ( not ( = ?auto_14627 ?auto_14628 ) ) ( not ( = ?auto_14627 ?auto_14626 ) ) ( not ( = ?auto_14627 ?auto_14625 ) ) ( not ( = ?auto_14624 ?auto_14627 ) ) ( ON ?auto_14624 ?auto_14625 ) ( CLEAR ?auto_14624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14627 ?auto_14628 ?auto_14626 ?auto_14625 )
      ( MAKE-3PILE ?auto_14624 ?auto_14625 ?auto_14626 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14630 - BLOCK
    )
    :vars
    (
      ?auto_14631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14631 ?auto_14630 ) ( CLEAR ?auto_14631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14630 ) ( not ( = ?auto_14630 ?auto_14631 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14631 ?auto_14630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14632 - BLOCK
    )
    :vars
    (
      ?auto_14633 - BLOCK
      ?auto_14634 - BLOCK
      ?auto_14635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14633 ?auto_14632 ) ( CLEAR ?auto_14633 ) ( ON-TABLE ?auto_14632 ) ( not ( = ?auto_14632 ?auto_14633 ) ) ( HOLDING ?auto_14634 ) ( CLEAR ?auto_14635 ) ( not ( = ?auto_14632 ?auto_14634 ) ) ( not ( = ?auto_14632 ?auto_14635 ) ) ( not ( = ?auto_14633 ?auto_14634 ) ) ( not ( = ?auto_14633 ?auto_14635 ) ) ( not ( = ?auto_14634 ?auto_14635 ) ) )
    :subtasks
    ( ( !STACK ?auto_14634 ?auto_14635 )
      ( MAKE-1PILE ?auto_14632 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14636 - BLOCK
    )
    :vars
    (
      ?auto_14638 - BLOCK
      ?auto_14637 - BLOCK
      ?auto_14639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14638 ?auto_14636 ) ( ON-TABLE ?auto_14636 ) ( not ( = ?auto_14636 ?auto_14638 ) ) ( CLEAR ?auto_14637 ) ( not ( = ?auto_14636 ?auto_14639 ) ) ( not ( = ?auto_14636 ?auto_14637 ) ) ( not ( = ?auto_14638 ?auto_14639 ) ) ( not ( = ?auto_14638 ?auto_14637 ) ) ( not ( = ?auto_14639 ?auto_14637 ) ) ( ON ?auto_14639 ?auto_14638 ) ( CLEAR ?auto_14639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14636 ?auto_14638 )
      ( MAKE-1PILE ?auto_14636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14640 - BLOCK
    )
    :vars
    (
      ?auto_14642 - BLOCK
      ?auto_14641 - BLOCK
      ?auto_14643 - BLOCK
      ?auto_14644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14642 ?auto_14640 ) ( ON-TABLE ?auto_14640 ) ( not ( = ?auto_14640 ?auto_14642 ) ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14641 ) ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( ON ?auto_14641 ?auto_14642 ) ( CLEAR ?auto_14641 ) ( HOLDING ?auto_14643 ) ( CLEAR ?auto_14644 ) ( ON-TABLE ?auto_14644 ) ( not ( = ?auto_14644 ?auto_14643 ) ) ( not ( = ?auto_14640 ?auto_14644 ) ) ( not ( = ?auto_14642 ?auto_14644 ) ) ( not ( = ?auto_14641 ?auto_14644 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14644 ?auto_14643 )
      ( MAKE-1PILE ?auto_14640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14645 - BLOCK
    )
    :vars
    (
      ?auto_14647 - BLOCK
      ?auto_14646 - BLOCK
      ?auto_14649 - BLOCK
      ?auto_14648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14647 ?auto_14645 ) ( ON-TABLE ?auto_14645 ) ( not ( = ?auto_14645 ?auto_14647 ) ) ( not ( = ?auto_14645 ?auto_14646 ) ) ( not ( = ?auto_14645 ?auto_14649 ) ) ( not ( = ?auto_14647 ?auto_14646 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( not ( = ?auto_14646 ?auto_14649 ) ) ( ON ?auto_14646 ?auto_14647 ) ( CLEAR ?auto_14648 ) ( ON-TABLE ?auto_14648 ) ( not ( = ?auto_14648 ?auto_14649 ) ) ( not ( = ?auto_14645 ?auto_14648 ) ) ( not ( = ?auto_14647 ?auto_14648 ) ) ( not ( = ?auto_14646 ?auto_14648 ) ) ( ON ?auto_14649 ?auto_14646 ) ( CLEAR ?auto_14649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14645 ?auto_14647 ?auto_14646 )
      ( MAKE-1PILE ?auto_14645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14650 - BLOCK
    )
    :vars
    (
      ?auto_14652 - BLOCK
      ?auto_14651 - BLOCK
      ?auto_14654 - BLOCK
      ?auto_14653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14652 ?auto_14650 ) ( ON-TABLE ?auto_14650 ) ( not ( = ?auto_14650 ?auto_14652 ) ) ( not ( = ?auto_14650 ?auto_14651 ) ) ( not ( = ?auto_14650 ?auto_14654 ) ) ( not ( = ?auto_14652 ?auto_14651 ) ) ( not ( = ?auto_14652 ?auto_14654 ) ) ( not ( = ?auto_14651 ?auto_14654 ) ) ( ON ?auto_14651 ?auto_14652 ) ( not ( = ?auto_14653 ?auto_14654 ) ) ( not ( = ?auto_14650 ?auto_14653 ) ) ( not ( = ?auto_14652 ?auto_14653 ) ) ( not ( = ?auto_14651 ?auto_14653 ) ) ( ON ?auto_14654 ?auto_14651 ) ( CLEAR ?auto_14654 ) ( HOLDING ?auto_14653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14653 )
      ( MAKE-1PILE ?auto_14650 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14655 - BLOCK
    )
    :vars
    (
      ?auto_14659 - BLOCK
      ?auto_14656 - BLOCK
      ?auto_14657 - BLOCK
      ?auto_14658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14659 ?auto_14655 ) ( ON-TABLE ?auto_14655 ) ( not ( = ?auto_14655 ?auto_14659 ) ) ( not ( = ?auto_14655 ?auto_14656 ) ) ( not ( = ?auto_14655 ?auto_14657 ) ) ( not ( = ?auto_14659 ?auto_14656 ) ) ( not ( = ?auto_14659 ?auto_14657 ) ) ( not ( = ?auto_14656 ?auto_14657 ) ) ( ON ?auto_14656 ?auto_14659 ) ( not ( = ?auto_14658 ?auto_14657 ) ) ( not ( = ?auto_14655 ?auto_14658 ) ) ( not ( = ?auto_14659 ?auto_14658 ) ) ( not ( = ?auto_14656 ?auto_14658 ) ) ( ON ?auto_14657 ?auto_14656 ) ( ON ?auto_14658 ?auto_14657 ) ( CLEAR ?auto_14658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14655 ?auto_14659 ?auto_14656 ?auto_14657 )
      ( MAKE-1PILE ?auto_14655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14664 - BLOCK
      ?auto_14665 - BLOCK
      ?auto_14666 - BLOCK
      ?auto_14667 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14667 ) ( CLEAR ?auto_14666 ) ( ON-TABLE ?auto_14664 ) ( ON ?auto_14665 ?auto_14664 ) ( ON ?auto_14666 ?auto_14665 ) ( not ( = ?auto_14664 ?auto_14665 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( not ( = ?auto_14664 ?auto_14667 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14667 ) ) ( not ( = ?auto_14666 ?auto_14667 ) ) )
    :subtasks
    ( ( !STACK ?auto_14667 ?auto_14666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14668 - BLOCK
      ?auto_14669 - BLOCK
      ?auto_14670 - BLOCK
      ?auto_14671 - BLOCK
    )
    :vars
    (
      ?auto_14672 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14670 ) ( ON-TABLE ?auto_14668 ) ( ON ?auto_14669 ?auto_14668 ) ( ON ?auto_14670 ?auto_14669 ) ( not ( = ?auto_14668 ?auto_14669 ) ) ( not ( = ?auto_14668 ?auto_14670 ) ) ( not ( = ?auto_14668 ?auto_14671 ) ) ( not ( = ?auto_14669 ?auto_14670 ) ) ( not ( = ?auto_14669 ?auto_14671 ) ) ( not ( = ?auto_14670 ?auto_14671 ) ) ( ON ?auto_14671 ?auto_14672 ) ( CLEAR ?auto_14671 ) ( HAND-EMPTY ) ( not ( = ?auto_14668 ?auto_14672 ) ) ( not ( = ?auto_14669 ?auto_14672 ) ) ( not ( = ?auto_14670 ?auto_14672 ) ) ( not ( = ?auto_14671 ?auto_14672 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14671 ?auto_14672 )
      ( MAKE-4PILE ?auto_14668 ?auto_14669 ?auto_14670 ?auto_14671 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14673 - BLOCK
      ?auto_14674 - BLOCK
      ?auto_14675 - BLOCK
      ?auto_14676 - BLOCK
    )
    :vars
    (
      ?auto_14677 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14673 ) ( ON ?auto_14674 ?auto_14673 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( ON ?auto_14676 ?auto_14677 ) ( CLEAR ?auto_14676 ) ( not ( = ?auto_14673 ?auto_14677 ) ) ( not ( = ?auto_14674 ?auto_14677 ) ) ( not ( = ?auto_14675 ?auto_14677 ) ) ( not ( = ?auto_14676 ?auto_14677 ) ) ( HOLDING ?auto_14675 ) ( CLEAR ?auto_14674 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14673 ?auto_14674 ?auto_14675 )
      ( MAKE-4PILE ?auto_14673 ?auto_14674 ?auto_14675 ?auto_14676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14678 - BLOCK
      ?auto_14679 - BLOCK
      ?auto_14680 - BLOCK
      ?auto_14681 - BLOCK
    )
    :vars
    (
      ?auto_14682 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14678 ) ( ON ?auto_14679 ?auto_14678 ) ( not ( = ?auto_14678 ?auto_14679 ) ) ( not ( = ?auto_14678 ?auto_14680 ) ) ( not ( = ?auto_14678 ?auto_14681 ) ) ( not ( = ?auto_14679 ?auto_14680 ) ) ( not ( = ?auto_14679 ?auto_14681 ) ) ( not ( = ?auto_14680 ?auto_14681 ) ) ( ON ?auto_14681 ?auto_14682 ) ( not ( = ?auto_14678 ?auto_14682 ) ) ( not ( = ?auto_14679 ?auto_14682 ) ) ( not ( = ?auto_14680 ?auto_14682 ) ) ( not ( = ?auto_14681 ?auto_14682 ) ) ( CLEAR ?auto_14679 ) ( ON ?auto_14680 ?auto_14681 ) ( CLEAR ?auto_14680 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14682 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14682 ?auto_14681 )
      ( MAKE-4PILE ?auto_14678 ?auto_14679 ?auto_14680 ?auto_14681 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14683 - BLOCK
      ?auto_14684 - BLOCK
      ?auto_14685 - BLOCK
      ?auto_14686 - BLOCK
    )
    :vars
    (
      ?auto_14687 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14683 ) ( not ( = ?auto_14683 ?auto_14684 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( not ( = ?auto_14683 ?auto_14686 ) ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( not ( = ?auto_14684 ?auto_14686 ) ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( ON ?auto_14686 ?auto_14687 ) ( not ( = ?auto_14683 ?auto_14687 ) ) ( not ( = ?auto_14684 ?auto_14687 ) ) ( not ( = ?auto_14685 ?auto_14687 ) ) ( not ( = ?auto_14686 ?auto_14687 ) ) ( ON ?auto_14685 ?auto_14686 ) ( CLEAR ?auto_14685 ) ( ON-TABLE ?auto_14687 ) ( HOLDING ?auto_14684 ) ( CLEAR ?auto_14683 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14683 ?auto_14684 )
      ( MAKE-4PILE ?auto_14683 ?auto_14684 ?auto_14685 ?auto_14686 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14688 - BLOCK
      ?auto_14689 - BLOCK
      ?auto_14690 - BLOCK
      ?auto_14691 - BLOCK
    )
    :vars
    (
      ?auto_14692 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14688 ) ( not ( = ?auto_14688 ?auto_14689 ) ) ( not ( = ?auto_14688 ?auto_14690 ) ) ( not ( = ?auto_14688 ?auto_14691 ) ) ( not ( = ?auto_14689 ?auto_14690 ) ) ( not ( = ?auto_14689 ?auto_14691 ) ) ( not ( = ?auto_14690 ?auto_14691 ) ) ( ON ?auto_14691 ?auto_14692 ) ( not ( = ?auto_14688 ?auto_14692 ) ) ( not ( = ?auto_14689 ?auto_14692 ) ) ( not ( = ?auto_14690 ?auto_14692 ) ) ( not ( = ?auto_14691 ?auto_14692 ) ) ( ON ?auto_14690 ?auto_14691 ) ( ON-TABLE ?auto_14692 ) ( CLEAR ?auto_14688 ) ( ON ?auto_14689 ?auto_14690 ) ( CLEAR ?auto_14689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14692 ?auto_14691 ?auto_14690 )
      ( MAKE-4PILE ?auto_14688 ?auto_14689 ?auto_14690 ?auto_14691 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14693 - BLOCK
      ?auto_14694 - BLOCK
      ?auto_14695 - BLOCK
      ?auto_14696 - BLOCK
    )
    :vars
    (
      ?auto_14697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14693 ?auto_14694 ) ) ( not ( = ?auto_14693 ?auto_14695 ) ) ( not ( = ?auto_14693 ?auto_14696 ) ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( not ( = ?auto_14694 ?auto_14696 ) ) ( not ( = ?auto_14695 ?auto_14696 ) ) ( ON ?auto_14696 ?auto_14697 ) ( not ( = ?auto_14693 ?auto_14697 ) ) ( not ( = ?auto_14694 ?auto_14697 ) ) ( not ( = ?auto_14695 ?auto_14697 ) ) ( not ( = ?auto_14696 ?auto_14697 ) ) ( ON ?auto_14695 ?auto_14696 ) ( ON-TABLE ?auto_14697 ) ( ON ?auto_14694 ?auto_14695 ) ( CLEAR ?auto_14694 ) ( HOLDING ?auto_14693 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14693 )
      ( MAKE-4PILE ?auto_14693 ?auto_14694 ?auto_14695 ?auto_14696 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14698 - BLOCK
      ?auto_14699 - BLOCK
      ?auto_14700 - BLOCK
      ?auto_14701 - BLOCK
    )
    :vars
    (
      ?auto_14702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14698 ?auto_14699 ) ) ( not ( = ?auto_14698 ?auto_14700 ) ) ( not ( = ?auto_14698 ?auto_14701 ) ) ( not ( = ?auto_14699 ?auto_14700 ) ) ( not ( = ?auto_14699 ?auto_14701 ) ) ( not ( = ?auto_14700 ?auto_14701 ) ) ( ON ?auto_14701 ?auto_14702 ) ( not ( = ?auto_14698 ?auto_14702 ) ) ( not ( = ?auto_14699 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14702 ) ) ( not ( = ?auto_14701 ?auto_14702 ) ) ( ON ?auto_14700 ?auto_14701 ) ( ON-TABLE ?auto_14702 ) ( ON ?auto_14699 ?auto_14700 ) ( ON ?auto_14698 ?auto_14699 ) ( CLEAR ?auto_14698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14702 ?auto_14701 ?auto_14700 ?auto_14699 )
      ( MAKE-4PILE ?auto_14698 ?auto_14699 ?auto_14700 ?auto_14701 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14706 - BLOCK
      ?auto_14707 - BLOCK
      ?auto_14708 - BLOCK
    )
    :vars
    (
      ?auto_14709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14709 ?auto_14708 ) ( CLEAR ?auto_14709 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14706 ) ( ON ?auto_14707 ?auto_14706 ) ( ON ?auto_14708 ?auto_14707 ) ( not ( = ?auto_14706 ?auto_14707 ) ) ( not ( = ?auto_14706 ?auto_14708 ) ) ( not ( = ?auto_14706 ?auto_14709 ) ) ( not ( = ?auto_14707 ?auto_14708 ) ) ( not ( = ?auto_14707 ?auto_14709 ) ) ( not ( = ?auto_14708 ?auto_14709 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14709 ?auto_14708 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14719 - BLOCK
      ?auto_14720 - BLOCK
      ?auto_14721 - BLOCK
    )
    :vars
    (
      ?auto_14722 - BLOCK
      ?auto_14723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14719 ) ( ON ?auto_14720 ?auto_14719 ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( not ( = ?auto_14719 ?auto_14721 ) ) ( not ( = ?auto_14719 ?auto_14722 ) ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14720 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) ( ON ?auto_14722 ?auto_14723 ) ( CLEAR ?auto_14722 ) ( not ( = ?auto_14719 ?auto_14723 ) ) ( not ( = ?auto_14720 ?auto_14723 ) ) ( not ( = ?auto_14721 ?auto_14723 ) ) ( not ( = ?auto_14722 ?auto_14723 ) ) ( HOLDING ?auto_14721 ) ( CLEAR ?auto_14720 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14719 ?auto_14720 ?auto_14721 ?auto_14722 )
      ( MAKE-3PILE ?auto_14719 ?auto_14720 ?auto_14721 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14724 - BLOCK
      ?auto_14725 - BLOCK
      ?auto_14726 - BLOCK
    )
    :vars
    (
      ?auto_14727 - BLOCK
      ?auto_14728 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14724 ) ( ON ?auto_14725 ?auto_14724 ) ( not ( = ?auto_14724 ?auto_14725 ) ) ( not ( = ?auto_14724 ?auto_14726 ) ) ( not ( = ?auto_14724 ?auto_14727 ) ) ( not ( = ?auto_14725 ?auto_14726 ) ) ( not ( = ?auto_14725 ?auto_14727 ) ) ( not ( = ?auto_14726 ?auto_14727 ) ) ( ON ?auto_14727 ?auto_14728 ) ( not ( = ?auto_14724 ?auto_14728 ) ) ( not ( = ?auto_14725 ?auto_14728 ) ) ( not ( = ?auto_14726 ?auto_14728 ) ) ( not ( = ?auto_14727 ?auto_14728 ) ) ( CLEAR ?auto_14725 ) ( ON ?auto_14726 ?auto_14727 ) ( CLEAR ?auto_14726 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14728 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14728 ?auto_14727 )
      ( MAKE-3PILE ?auto_14724 ?auto_14725 ?auto_14726 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14729 - BLOCK
      ?auto_14730 - BLOCK
      ?auto_14731 - BLOCK
    )
    :vars
    (
      ?auto_14733 - BLOCK
      ?auto_14732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14729 ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14731 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14730 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14733 ) ) ( ON ?auto_14733 ?auto_14732 ) ( not ( = ?auto_14729 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14731 ?auto_14732 ) ) ( not ( = ?auto_14733 ?auto_14732 ) ) ( ON ?auto_14731 ?auto_14733 ) ( CLEAR ?auto_14731 ) ( ON-TABLE ?auto_14732 ) ( HOLDING ?auto_14730 ) ( CLEAR ?auto_14729 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14729 ?auto_14730 )
      ( MAKE-3PILE ?auto_14729 ?auto_14730 ?auto_14731 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14734 - BLOCK
      ?auto_14735 - BLOCK
      ?auto_14736 - BLOCK
    )
    :vars
    (
      ?auto_14738 - BLOCK
      ?auto_14737 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14734 ) ( not ( = ?auto_14734 ?auto_14735 ) ) ( not ( = ?auto_14734 ?auto_14736 ) ) ( not ( = ?auto_14734 ?auto_14738 ) ) ( not ( = ?auto_14735 ?auto_14736 ) ) ( not ( = ?auto_14735 ?auto_14738 ) ) ( not ( = ?auto_14736 ?auto_14738 ) ) ( ON ?auto_14738 ?auto_14737 ) ( not ( = ?auto_14734 ?auto_14737 ) ) ( not ( = ?auto_14735 ?auto_14737 ) ) ( not ( = ?auto_14736 ?auto_14737 ) ) ( not ( = ?auto_14738 ?auto_14737 ) ) ( ON ?auto_14736 ?auto_14738 ) ( ON-TABLE ?auto_14737 ) ( CLEAR ?auto_14734 ) ( ON ?auto_14735 ?auto_14736 ) ( CLEAR ?auto_14735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14737 ?auto_14738 ?auto_14736 )
      ( MAKE-3PILE ?auto_14734 ?auto_14735 ?auto_14736 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14739 - BLOCK
      ?auto_14740 - BLOCK
      ?auto_14741 - BLOCK
    )
    :vars
    (
      ?auto_14742 - BLOCK
      ?auto_14743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( ON ?auto_14742 ?auto_14743 ) ( not ( = ?auto_14739 ?auto_14743 ) ) ( not ( = ?auto_14740 ?auto_14743 ) ) ( not ( = ?auto_14741 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14743 ) ) ( ON ?auto_14741 ?auto_14742 ) ( ON-TABLE ?auto_14743 ) ( ON ?auto_14740 ?auto_14741 ) ( CLEAR ?auto_14740 ) ( HOLDING ?auto_14739 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14739 )
      ( MAKE-3PILE ?auto_14739 ?auto_14740 ?auto_14741 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14744 - BLOCK
      ?auto_14745 - BLOCK
      ?auto_14746 - BLOCK
    )
    :vars
    (
      ?auto_14748 - BLOCK
      ?auto_14747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14744 ?auto_14745 ) ) ( not ( = ?auto_14744 ?auto_14746 ) ) ( not ( = ?auto_14744 ?auto_14748 ) ) ( not ( = ?auto_14745 ?auto_14746 ) ) ( not ( = ?auto_14745 ?auto_14748 ) ) ( not ( = ?auto_14746 ?auto_14748 ) ) ( ON ?auto_14748 ?auto_14747 ) ( not ( = ?auto_14744 ?auto_14747 ) ) ( not ( = ?auto_14745 ?auto_14747 ) ) ( not ( = ?auto_14746 ?auto_14747 ) ) ( not ( = ?auto_14748 ?auto_14747 ) ) ( ON ?auto_14746 ?auto_14748 ) ( ON-TABLE ?auto_14747 ) ( ON ?auto_14745 ?auto_14746 ) ( ON ?auto_14744 ?auto_14745 ) ( CLEAR ?auto_14744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14747 ?auto_14748 ?auto_14746 ?auto_14745 )
      ( MAKE-3PILE ?auto_14744 ?auto_14745 ?auto_14746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14750 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14751 - BLOCK
    )
    :vars
    (
      ?auto_14752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14751 ?auto_14752 ) ( CLEAR ?auto_14751 ) ( HAND-EMPTY ) ( not ( = ?auto_14751 ?auto_14752 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14751 ?auto_14752 )
      ( MAKE-1PILE ?auto_14751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14753 - BLOCK
    )
    :vars
    (
      ?auto_14754 - BLOCK
      ?auto_14755 - BLOCK
      ?auto_14756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14753 ?auto_14754 ) ) ( HOLDING ?auto_14753 ) ( CLEAR ?auto_14754 ) ( ON-TABLE ?auto_14755 ) ( ON ?auto_14756 ?auto_14755 ) ( ON ?auto_14754 ?auto_14756 ) ( not ( = ?auto_14755 ?auto_14756 ) ) ( not ( = ?auto_14755 ?auto_14754 ) ) ( not ( = ?auto_14755 ?auto_14753 ) ) ( not ( = ?auto_14756 ?auto_14754 ) ) ( not ( = ?auto_14756 ?auto_14753 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14755 ?auto_14756 ?auto_14754 ?auto_14753 )
      ( MAKE-1PILE ?auto_14753 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14757 - BLOCK
    )
    :vars
    (
      ?auto_14759 - BLOCK
      ?auto_14758 - BLOCK
      ?auto_14760 - BLOCK
      ?auto_14761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14757 ?auto_14759 ) ) ( CLEAR ?auto_14759 ) ( ON-TABLE ?auto_14758 ) ( ON ?auto_14760 ?auto_14758 ) ( ON ?auto_14759 ?auto_14760 ) ( not ( = ?auto_14758 ?auto_14760 ) ) ( not ( = ?auto_14758 ?auto_14759 ) ) ( not ( = ?auto_14758 ?auto_14757 ) ) ( not ( = ?auto_14760 ?auto_14759 ) ) ( not ( = ?auto_14760 ?auto_14757 ) ) ( ON ?auto_14757 ?auto_14761 ) ( CLEAR ?auto_14757 ) ( HAND-EMPTY ) ( not ( = ?auto_14757 ?auto_14761 ) ) ( not ( = ?auto_14759 ?auto_14761 ) ) ( not ( = ?auto_14758 ?auto_14761 ) ) ( not ( = ?auto_14760 ?auto_14761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14757 ?auto_14761 )
      ( MAKE-1PILE ?auto_14757 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14762 - BLOCK
    )
    :vars
    (
      ?auto_14764 - BLOCK
      ?auto_14766 - BLOCK
      ?auto_14765 - BLOCK
      ?auto_14763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14762 ?auto_14764 ) ) ( ON-TABLE ?auto_14766 ) ( ON ?auto_14765 ?auto_14766 ) ( not ( = ?auto_14766 ?auto_14765 ) ) ( not ( = ?auto_14766 ?auto_14764 ) ) ( not ( = ?auto_14766 ?auto_14762 ) ) ( not ( = ?auto_14765 ?auto_14764 ) ) ( not ( = ?auto_14765 ?auto_14762 ) ) ( ON ?auto_14762 ?auto_14763 ) ( CLEAR ?auto_14762 ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14764 ?auto_14763 ) ) ( not ( = ?auto_14766 ?auto_14763 ) ) ( not ( = ?auto_14765 ?auto_14763 ) ) ( HOLDING ?auto_14764 ) ( CLEAR ?auto_14765 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14766 ?auto_14765 ?auto_14764 )
      ( MAKE-1PILE ?auto_14762 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14767 - BLOCK
    )
    :vars
    (
      ?auto_14768 - BLOCK
      ?auto_14771 - BLOCK
      ?auto_14770 - BLOCK
      ?auto_14769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14767 ?auto_14768 ) ) ( ON-TABLE ?auto_14771 ) ( ON ?auto_14770 ?auto_14771 ) ( not ( = ?auto_14771 ?auto_14770 ) ) ( not ( = ?auto_14771 ?auto_14768 ) ) ( not ( = ?auto_14771 ?auto_14767 ) ) ( not ( = ?auto_14770 ?auto_14768 ) ) ( not ( = ?auto_14770 ?auto_14767 ) ) ( ON ?auto_14767 ?auto_14769 ) ( not ( = ?auto_14767 ?auto_14769 ) ) ( not ( = ?auto_14768 ?auto_14769 ) ) ( not ( = ?auto_14771 ?auto_14769 ) ) ( not ( = ?auto_14770 ?auto_14769 ) ) ( CLEAR ?auto_14770 ) ( ON ?auto_14768 ?auto_14767 ) ( CLEAR ?auto_14768 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14769 ?auto_14767 )
      ( MAKE-1PILE ?auto_14767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14772 - BLOCK
    )
    :vars
    (
      ?auto_14776 - BLOCK
      ?auto_14773 - BLOCK
      ?auto_14774 - BLOCK
      ?auto_14775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14772 ?auto_14776 ) ) ( ON-TABLE ?auto_14773 ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14776 ) ) ( not ( = ?auto_14773 ?auto_14772 ) ) ( not ( = ?auto_14774 ?auto_14776 ) ) ( not ( = ?auto_14774 ?auto_14772 ) ) ( ON ?auto_14772 ?auto_14775 ) ( not ( = ?auto_14772 ?auto_14775 ) ) ( not ( = ?auto_14776 ?auto_14775 ) ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14774 ?auto_14775 ) ) ( ON ?auto_14776 ?auto_14772 ) ( CLEAR ?auto_14776 ) ( ON-TABLE ?auto_14775 ) ( HOLDING ?auto_14774 ) ( CLEAR ?auto_14773 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14773 ?auto_14774 )
      ( MAKE-1PILE ?auto_14772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14777 - BLOCK
    )
    :vars
    (
      ?auto_14779 - BLOCK
      ?auto_14778 - BLOCK
      ?auto_14780 - BLOCK
      ?auto_14781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14777 ?auto_14779 ) ) ( ON-TABLE ?auto_14778 ) ( not ( = ?auto_14778 ?auto_14780 ) ) ( not ( = ?auto_14778 ?auto_14779 ) ) ( not ( = ?auto_14778 ?auto_14777 ) ) ( not ( = ?auto_14780 ?auto_14779 ) ) ( not ( = ?auto_14780 ?auto_14777 ) ) ( ON ?auto_14777 ?auto_14781 ) ( not ( = ?auto_14777 ?auto_14781 ) ) ( not ( = ?auto_14779 ?auto_14781 ) ) ( not ( = ?auto_14778 ?auto_14781 ) ) ( not ( = ?auto_14780 ?auto_14781 ) ) ( ON ?auto_14779 ?auto_14777 ) ( ON-TABLE ?auto_14781 ) ( CLEAR ?auto_14778 ) ( ON ?auto_14780 ?auto_14779 ) ( CLEAR ?auto_14780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14781 ?auto_14777 ?auto_14779 )
      ( MAKE-1PILE ?auto_14777 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14782 - BLOCK
    )
    :vars
    (
      ?auto_14786 - BLOCK
      ?auto_14784 - BLOCK
      ?auto_14783 - BLOCK
      ?auto_14785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14782 ?auto_14786 ) ) ( not ( = ?auto_14784 ?auto_14783 ) ) ( not ( = ?auto_14784 ?auto_14786 ) ) ( not ( = ?auto_14784 ?auto_14782 ) ) ( not ( = ?auto_14783 ?auto_14786 ) ) ( not ( = ?auto_14783 ?auto_14782 ) ) ( ON ?auto_14782 ?auto_14785 ) ( not ( = ?auto_14782 ?auto_14785 ) ) ( not ( = ?auto_14786 ?auto_14785 ) ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14783 ?auto_14785 ) ) ( ON ?auto_14786 ?auto_14782 ) ( ON-TABLE ?auto_14785 ) ( ON ?auto_14783 ?auto_14786 ) ( CLEAR ?auto_14783 ) ( HOLDING ?auto_14784 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14784 )
      ( MAKE-1PILE ?auto_14782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14787 - BLOCK
    )
    :vars
    (
      ?auto_14789 - BLOCK
      ?auto_14791 - BLOCK
      ?auto_14788 - BLOCK
      ?auto_14790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14787 ?auto_14789 ) ) ( not ( = ?auto_14791 ?auto_14788 ) ) ( not ( = ?auto_14791 ?auto_14789 ) ) ( not ( = ?auto_14791 ?auto_14787 ) ) ( not ( = ?auto_14788 ?auto_14789 ) ) ( not ( = ?auto_14788 ?auto_14787 ) ) ( ON ?auto_14787 ?auto_14790 ) ( not ( = ?auto_14787 ?auto_14790 ) ) ( not ( = ?auto_14789 ?auto_14790 ) ) ( not ( = ?auto_14791 ?auto_14790 ) ) ( not ( = ?auto_14788 ?auto_14790 ) ) ( ON ?auto_14789 ?auto_14787 ) ( ON-TABLE ?auto_14790 ) ( ON ?auto_14788 ?auto_14789 ) ( ON ?auto_14791 ?auto_14788 ) ( CLEAR ?auto_14791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14790 ?auto_14787 ?auto_14789 ?auto_14788 )
      ( MAKE-1PILE ?auto_14787 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14794 - BLOCK
      ?auto_14795 - BLOCK
    )
    :vars
    (
      ?auto_14796 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14796 ?auto_14795 ) ( CLEAR ?auto_14796 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14794 ) ( ON ?auto_14795 ?auto_14794 ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14796 ?auto_14795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14797 - BLOCK
      ?auto_14798 - BLOCK
    )
    :vars
    (
      ?auto_14799 - BLOCK
      ?auto_14800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14799 ?auto_14798 ) ( CLEAR ?auto_14799 ) ( ON-TABLE ?auto_14797 ) ( ON ?auto_14798 ?auto_14797 ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( HOLDING ?auto_14800 ) ( not ( = ?auto_14797 ?auto_14800 ) ) ( not ( = ?auto_14798 ?auto_14800 ) ) ( not ( = ?auto_14799 ?auto_14800 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14800 )
      ( MAKE-2PILE ?auto_14797 ?auto_14798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14801 - BLOCK
      ?auto_14802 - BLOCK
    )
    :vars
    (
      ?auto_14803 - BLOCK
      ?auto_14804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14803 ?auto_14802 ) ( ON-TABLE ?auto_14801 ) ( ON ?auto_14802 ?auto_14801 ) ( not ( = ?auto_14801 ?auto_14802 ) ) ( not ( = ?auto_14801 ?auto_14803 ) ) ( not ( = ?auto_14802 ?auto_14803 ) ) ( not ( = ?auto_14801 ?auto_14804 ) ) ( not ( = ?auto_14802 ?auto_14804 ) ) ( not ( = ?auto_14803 ?auto_14804 ) ) ( ON ?auto_14804 ?auto_14803 ) ( CLEAR ?auto_14804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14801 ?auto_14802 ?auto_14803 )
      ( MAKE-2PILE ?auto_14801 ?auto_14802 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14805 - BLOCK
      ?auto_14806 - BLOCK
    )
    :vars
    (
      ?auto_14808 - BLOCK
      ?auto_14807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14808 ?auto_14806 ) ( ON-TABLE ?auto_14805 ) ( ON ?auto_14806 ?auto_14805 ) ( not ( = ?auto_14805 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14806 ?auto_14807 ) ) ( not ( = ?auto_14808 ?auto_14807 ) ) ( HOLDING ?auto_14807 ) ( CLEAR ?auto_14808 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14805 ?auto_14806 ?auto_14808 ?auto_14807 )
      ( MAKE-2PILE ?auto_14805 ?auto_14806 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14809 - BLOCK
      ?auto_14810 - BLOCK
    )
    :vars
    (
      ?auto_14812 - BLOCK
      ?auto_14811 - BLOCK
      ?auto_14813 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14812 ?auto_14810 ) ( ON-TABLE ?auto_14809 ) ( ON ?auto_14810 ?auto_14809 ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14812 ) ) ( not ( = ?auto_14810 ?auto_14812 ) ) ( not ( = ?auto_14809 ?auto_14811 ) ) ( not ( = ?auto_14810 ?auto_14811 ) ) ( not ( = ?auto_14812 ?auto_14811 ) ) ( CLEAR ?auto_14812 ) ( ON ?auto_14811 ?auto_14813 ) ( CLEAR ?auto_14811 ) ( HAND-EMPTY ) ( not ( = ?auto_14809 ?auto_14813 ) ) ( not ( = ?auto_14810 ?auto_14813 ) ) ( not ( = ?auto_14812 ?auto_14813 ) ) ( not ( = ?auto_14811 ?auto_14813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14811 ?auto_14813 )
      ( MAKE-2PILE ?auto_14809 ?auto_14810 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14824 - BLOCK
      ?auto_14825 - BLOCK
    )
    :vars
    (
      ?auto_14828 - BLOCK
      ?auto_14827 - BLOCK
      ?auto_14826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14824 ) ( not ( = ?auto_14824 ?auto_14825 ) ) ( not ( = ?auto_14824 ?auto_14828 ) ) ( not ( = ?auto_14825 ?auto_14828 ) ) ( not ( = ?auto_14824 ?auto_14827 ) ) ( not ( = ?auto_14825 ?auto_14827 ) ) ( not ( = ?auto_14828 ?auto_14827 ) ) ( ON ?auto_14827 ?auto_14826 ) ( not ( = ?auto_14824 ?auto_14826 ) ) ( not ( = ?auto_14825 ?auto_14826 ) ) ( not ( = ?auto_14828 ?auto_14826 ) ) ( not ( = ?auto_14827 ?auto_14826 ) ) ( ON ?auto_14828 ?auto_14827 ) ( CLEAR ?auto_14828 ) ( HOLDING ?auto_14825 ) ( CLEAR ?auto_14824 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14824 ?auto_14825 ?auto_14828 )
      ( MAKE-2PILE ?auto_14824 ?auto_14825 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14829 - BLOCK
      ?auto_14830 - BLOCK
    )
    :vars
    (
      ?auto_14833 - BLOCK
      ?auto_14832 - BLOCK
      ?auto_14831 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14829 ) ( not ( = ?auto_14829 ?auto_14830 ) ) ( not ( = ?auto_14829 ?auto_14833 ) ) ( not ( = ?auto_14830 ?auto_14833 ) ) ( not ( = ?auto_14829 ?auto_14832 ) ) ( not ( = ?auto_14830 ?auto_14832 ) ) ( not ( = ?auto_14833 ?auto_14832 ) ) ( ON ?auto_14832 ?auto_14831 ) ( not ( = ?auto_14829 ?auto_14831 ) ) ( not ( = ?auto_14830 ?auto_14831 ) ) ( not ( = ?auto_14833 ?auto_14831 ) ) ( not ( = ?auto_14832 ?auto_14831 ) ) ( ON ?auto_14833 ?auto_14832 ) ( CLEAR ?auto_14829 ) ( ON ?auto_14830 ?auto_14833 ) ( CLEAR ?auto_14830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14831 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14831 ?auto_14832 ?auto_14833 )
      ( MAKE-2PILE ?auto_14829 ?auto_14830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14834 - BLOCK
      ?auto_14835 - BLOCK
    )
    :vars
    (
      ?auto_14836 - BLOCK
      ?auto_14838 - BLOCK
      ?auto_14837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14834 ?auto_14835 ) ) ( not ( = ?auto_14834 ?auto_14836 ) ) ( not ( = ?auto_14835 ?auto_14836 ) ) ( not ( = ?auto_14834 ?auto_14838 ) ) ( not ( = ?auto_14835 ?auto_14838 ) ) ( not ( = ?auto_14836 ?auto_14838 ) ) ( ON ?auto_14838 ?auto_14837 ) ( not ( = ?auto_14834 ?auto_14837 ) ) ( not ( = ?auto_14835 ?auto_14837 ) ) ( not ( = ?auto_14836 ?auto_14837 ) ) ( not ( = ?auto_14838 ?auto_14837 ) ) ( ON ?auto_14836 ?auto_14838 ) ( ON ?auto_14835 ?auto_14836 ) ( CLEAR ?auto_14835 ) ( ON-TABLE ?auto_14837 ) ( HOLDING ?auto_14834 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14834 )
      ( MAKE-2PILE ?auto_14834 ?auto_14835 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14839 - BLOCK
      ?auto_14840 - BLOCK
    )
    :vars
    (
      ?auto_14842 - BLOCK
      ?auto_14841 - BLOCK
      ?auto_14843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14842 ?auto_14841 ) ) ( ON ?auto_14841 ?auto_14843 ) ( not ( = ?auto_14839 ?auto_14843 ) ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( ON ?auto_14842 ?auto_14841 ) ( ON ?auto_14840 ?auto_14842 ) ( ON-TABLE ?auto_14843 ) ( ON ?auto_14839 ?auto_14840 ) ( CLEAR ?auto_14839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14843 ?auto_14841 ?auto_14842 ?auto_14840 )
      ( MAKE-2PILE ?auto_14839 ?auto_14840 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14846 - BLOCK
      ?auto_14847 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14847 ) ( CLEAR ?auto_14846 ) ( ON-TABLE ?auto_14846 ) ( not ( = ?auto_14846 ?auto_14847 ) ) )
    :subtasks
    ( ( !STACK ?auto_14847 ?auto_14846 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14848 - BLOCK
      ?auto_14849 - BLOCK
    )
    :vars
    (
      ?auto_14850 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14848 ) ( ON-TABLE ?auto_14848 ) ( not ( = ?auto_14848 ?auto_14849 ) ) ( ON ?auto_14849 ?auto_14850 ) ( CLEAR ?auto_14849 ) ( HAND-EMPTY ) ( not ( = ?auto_14848 ?auto_14850 ) ) ( not ( = ?auto_14849 ?auto_14850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14849 ?auto_14850 )
      ( MAKE-2PILE ?auto_14848 ?auto_14849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14851 - BLOCK
      ?auto_14852 - BLOCK
    )
    :vars
    (
      ?auto_14853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14851 ?auto_14852 ) ) ( ON ?auto_14852 ?auto_14853 ) ( CLEAR ?auto_14852 ) ( not ( = ?auto_14851 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( HOLDING ?auto_14851 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14851 )
      ( MAKE-2PILE ?auto_14851 ?auto_14852 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14854 - BLOCK
      ?auto_14855 - BLOCK
    )
    :vars
    (
      ?auto_14856 - BLOCK
      ?auto_14857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14854 ?auto_14855 ) ) ( ON ?auto_14855 ?auto_14856 ) ( not ( = ?auto_14854 ?auto_14856 ) ) ( not ( = ?auto_14855 ?auto_14856 ) ) ( ON ?auto_14854 ?auto_14855 ) ( CLEAR ?auto_14854 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14857 ) ( ON ?auto_14856 ?auto_14857 ) ( not ( = ?auto_14857 ?auto_14856 ) ) ( not ( = ?auto_14857 ?auto_14855 ) ) ( not ( = ?auto_14857 ?auto_14854 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14857 ?auto_14856 ?auto_14855 )
      ( MAKE-2PILE ?auto_14854 ?auto_14855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14858 - BLOCK
      ?auto_14859 - BLOCK
    )
    :vars
    (
      ?auto_14861 - BLOCK
      ?auto_14860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14858 ?auto_14859 ) ) ( ON ?auto_14859 ?auto_14861 ) ( not ( = ?auto_14858 ?auto_14861 ) ) ( not ( = ?auto_14859 ?auto_14861 ) ) ( ON-TABLE ?auto_14860 ) ( ON ?auto_14861 ?auto_14860 ) ( not ( = ?auto_14860 ?auto_14861 ) ) ( not ( = ?auto_14860 ?auto_14859 ) ) ( not ( = ?auto_14860 ?auto_14858 ) ) ( HOLDING ?auto_14858 ) ( CLEAR ?auto_14859 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14860 ?auto_14861 ?auto_14859 ?auto_14858 )
      ( MAKE-2PILE ?auto_14858 ?auto_14859 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14862 - BLOCK
      ?auto_14863 - BLOCK
    )
    :vars
    (
      ?auto_14864 - BLOCK
      ?auto_14865 - BLOCK
      ?auto_14866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14862 ?auto_14863 ) ) ( ON ?auto_14863 ?auto_14864 ) ( not ( = ?auto_14862 ?auto_14864 ) ) ( not ( = ?auto_14863 ?auto_14864 ) ) ( ON-TABLE ?auto_14865 ) ( ON ?auto_14864 ?auto_14865 ) ( not ( = ?auto_14865 ?auto_14864 ) ) ( not ( = ?auto_14865 ?auto_14863 ) ) ( not ( = ?auto_14865 ?auto_14862 ) ) ( CLEAR ?auto_14863 ) ( ON ?auto_14862 ?auto_14866 ) ( CLEAR ?auto_14862 ) ( HAND-EMPTY ) ( not ( = ?auto_14862 ?auto_14866 ) ) ( not ( = ?auto_14863 ?auto_14866 ) ) ( not ( = ?auto_14864 ?auto_14866 ) ) ( not ( = ?auto_14865 ?auto_14866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14862 ?auto_14866 )
      ( MAKE-2PILE ?auto_14862 ?auto_14863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14867 - BLOCK
      ?auto_14868 - BLOCK
    )
    :vars
    (
      ?auto_14870 - BLOCK
      ?auto_14869 - BLOCK
      ?auto_14871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14867 ?auto_14868 ) ) ( not ( = ?auto_14867 ?auto_14870 ) ) ( not ( = ?auto_14868 ?auto_14870 ) ) ( ON-TABLE ?auto_14869 ) ( ON ?auto_14870 ?auto_14869 ) ( not ( = ?auto_14869 ?auto_14870 ) ) ( not ( = ?auto_14869 ?auto_14868 ) ) ( not ( = ?auto_14869 ?auto_14867 ) ) ( ON ?auto_14867 ?auto_14871 ) ( CLEAR ?auto_14867 ) ( not ( = ?auto_14867 ?auto_14871 ) ) ( not ( = ?auto_14868 ?auto_14871 ) ) ( not ( = ?auto_14870 ?auto_14871 ) ) ( not ( = ?auto_14869 ?auto_14871 ) ) ( HOLDING ?auto_14868 ) ( CLEAR ?auto_14870 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14869 ?auto_14870 ?auto_14868 )
      ( MAKE-2PILE ?auto_14867 ?auto_14868 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14872 - BLOCK
      ?auto_14873 - BLOCK
    )
    :vars
    (
      ?auto_14875 - BLOCK
      ?auto_14876 - BLOCK
      ?auto_14874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14872 ?auto_14873 ) ) ( not ( = ?auto_14872 ?auto_14875 ) ) ( not ( = ?auto_14873 ?auto_14875 ) ) ( ON-TABLE ?auto_14876 ) ( ON ?auto_14875 ?auto_14876 ) ( not ( = ?auto_14876 ?auto_14875 ) ) ( not ( = ?auto_14876 ?auto_14873 ) ) ( not ( = ?auto_14876 ?auto_14872 ) ) ( ON ?auto_14872 ?auto_14874 ) ( not ( = ?auto_14872 ?auto_14874 ) ) ( not ( = ?auto_14873 ?auto_14874 ) ) ( not ( = ?auto_14875 ?auto_14874 ) ) ( not ( = ?auto_14876 ?auto_14874 ) ) ( CLEAR ?auto_14875 ) ( ON ?auto_14873 ?auto_14872 ) ( CLEAR ?auto_14873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14874 ?auto_14872 )
      ( MAKE-2PILE ?auto_14872 ?auto_14873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14877 - BLOCK
      ?auto_14878 - BLOCK
    )
    :vars
    (
      ?auto_14879 - BLOCK
      ?auto_14880 - BLOCK
      ?auto_14881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14877 ?auto_14878 ) ) ( not ( = ?auto_14877 ?auto_14879 ) ) ( not ( = ?auto_14878 ?auto_14879 ) ) ( ON-TABLE ?auto_14880 ) ( not ( = ?auto_14880 ?auto_14879 ) ) ( not ( = ?auto_14880 ?auto_14878 ) ) ( not ( = ?auto_14880 ?auto_14877 ) ) ( ON ?auto_14877 ?auto_14881 ) ( not ( = ?auto_14877 ?auto_14881 ) ) ( not ( = ?auto_14878 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( ON ?auto_14878 ?auto_14877 ) ( CLEAR ?auto_14878 ) ( ON-TABLE ?auto_14881 ) ( HOLDING ?auto_14879 ) ( CLEAR ?auto_14880 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14880 ?auto_14879 )
      ( MAKE-2PILE ?auto_14877 ?auto_14878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14882 - BLOCK
      ?auto_14883 - BLOCK
    )
    :vars
    (
      ?auto_14884 - BLOCK
      ?auto_14885 - BLOCK
      ?auto_14886 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14882 ?auto_14883 ) ) ( not ( = ?auto_14882 ?auto_14884 ) ) ( not ( = ?auto_14883 ?auto_14884 ) ) ( ON-TABLE ?auto_14885 ) ( not ( = ?auto_14885 ?auto_14884 ) ) ( not ( = ?auto_14885 ?auto_14883 ) ) ( not ( = ?auto_14885 ?auto_14882 ) ) ( ON ?auto_14882 ?auto_14886 ) ( not ( = ?auto_14882 ?auto_14886 ) ) ( not ( = ?auto_14883 ?auto_14886 ) ) ( not ( = ?auto_14884 ?auto_14886 ) ) ( not ( = ?auto_14885 ?auto_14886 ) ) ( ON ?auto_14883 ?auto_14882 ) ( ON-TABLE ?auto_14886 ) ( CLEAR ?auto_14885 ) ( ON ?auto_14884 ?auto_14883 ) ( CLEAR ?auto_14884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14886 ?auto_14882 ?auto_14883 )
      ( MAKE-2PILE ?auto_14882 ?auto_14883 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14887 - BLOCK
      ?auto_14888 - BLOCK
    )
    :vars
    (
      ?auto_14891 - BLOCK
      ?auto_14890 - BLOCK
      ?auto_14889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14887 ?auto_14888 ) ) ( not ( = ?auto_14887 ?auto_14891 ) ) ( not ( = ?auto_14888 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14888 ) ) ( not ( = ?auto_14890 ?auto_14887 ) ) ( ON ?auto_14887 ?auto_14889 ) ( not ( = ?auto_14887 ?auto_14889 ) ) ( not ( = ?auto_14888 ?auto_14889 ) ) ( not ( = ?auto_14891 ?auto_14889 ) ) ( not ( = ?auto_14890 ?auto_14889 ) ) ( ON ?auto_14888 ?auto_14887 ) ( ON-TABLE ?auto_14889 ) ( ON ?auto_14891 ?auto_14888 ) ( CLEAR ?auto_14891 ) ( HOLDING ?auto_14890 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14890 )
      ( MAKE-2PILE ?auto_14887 ?auto_14888 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14892 - BLOCK
      ?auto_14893 - BLOCK
    )
    :vars
    (
      ?auto_14896 - BLOCK
      ?auto_14894 - BLOCK
      ?auto_14895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14892 ?auto_14896 ) ) ( not ( = ?auto_14893 ?auto_14896 ) ) ( not ( = ?auto_14894 ?auto_14896 ) ) ( not ( = ?auto_14894 ?auto_14893 ) ) ( not ( = ?auto_14894 ?auto_14892 ) ) ( ON ?auto_14892 ?auto_14895 ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14896 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( ON ?auto_14893 ?auto_14892 ) ( ON-TABLE ?auto_14895 ) ( ON ?auto_14896 ?auto_14893 ) ( ON ?auto_14894 ?auto_14896 ) ( CLEAR ?auto_14894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14895 ?auto_14892 ?auto_14893 ?auto_14896 )
      ( MAKE-2PILE ?auto_14892 ?auto_14893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14898 - BLOCK
    )
    :vars
    (
      ?auto_14899 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14899 ?auto_14898 ) ( CLEAR ?auto_14899 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14898 ) ( not ( = ?auto_14898 ?auto_14899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14899 ?auto_14898 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14900 - BLOCK
    )
    :vars
    (
      ?auto_14901 - BLOCK
      ?auto_14902 - BLOCK
      ?auto_14903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14901 ?auto_14900 ) ( CLEAR ?auto_14901 ) ( ON-TABLE ?auto_14900 ) ( not ( = ?auto_14900 ?auto_14901 ) ) ( HOLDING ?auto_14902 ) ( CLEAR ?auto_14903 ) ( not ( = ?auto_14900 ?auto_14902 ) ) ( not ( = ?auto_14900 ?auto_14903 ) ) ( not ( = ?auto_14901 ?auto_14902 ) ) ( not ( = ?auto_14901 ?auto_14903 ) ) ( not ( = ?auto_14902 ?auto_14903 ) ) )
    :subtasks
    ( ( !STACK ?auto_14902 ?auto_14903 )
      ( MAKE-1PILE ?auto_14900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14904 - BLOCK
    )
    :vars
    (
      ?auto_14907 - BLOCK
      ?auto_14906 - BLOCK
      ?auto_14905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14907 ?auto_14904 ) ( ON-TABLE ?auto_14904 ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( CLEAR ?auto_14906 ) ( not ( = ?auto_14904 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14906 ) ) ( not ( = ?auto_14907 ?auto_14905 ) ) ( not ( = ?auto_14907 ?auto_14906 ) ) ( not ( = ?auto_14905 ?auto_14906 ) ) ( ON ?auto_14905 ?auto_14907 ) ( CLEAR ?auto_14905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14904 ?auto_14907 )
      ( MAKE-1PILE ?auto_14904 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14908 - BLOCK
    )
    :vars
    (
      ?auto_14910 - BLOCK
      ?auto_14909 - BLOCK
      ?auto_14911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14910 ?auto_14908 ) ( ON-TABLE ?auto_14908 ) ( not ( = ?auto_14908 ?auto_14910 ) ) ( not ( = ?auto_14908 ?auto_14909 ) ) ( not ( = ?auto_14908 ?auto_14911 ) ) ( not ( = ?auto_14910 ?auto_14909 ) ) ( not ( = ?auto_14910 ?auto_14911 ) ) ( not ( = ?auto_14909 ?auto_14911 ) ) ( ON ?auto_14909 ?auto_14910 ) ( CLEAR ?auto_14909 ) ( HOLDING ?auto_14911 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14911 )
      ( MAKE-1PILE ?auto_14908 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14912 - BLOCK
    )
    :vars
    (
      ?auto_14913 - BLOCK
      ?auto_14915 - BLOCK
      ?auto_14914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14913 ?auto_14912 ) ( ON-TABLE ?auto_14912 ) ( not ( = ?auto_14912 ?auto_14913 ) ) ( not ( = ?auto_14912 ?auto_14915 ) ) ( not ( = ?auto_14912 ?auto_14914 ) ) ( not ( = ?auto_14913 ?auto_14915 ) ) ( not ( = ?auto_14913 ?auto_14914 ) ) ( not ( = ?auto_14915 ?auto_14914 ) ) ( ON ?auto_14915 ?auto_14913 ) ( ON ?auto_14914 ?auto_14915 ) ( CLEAR ?auto_14914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14912 ?auto_14913 ?auto_14915 )
      ( MAKE-1PILE ?auto_14912 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14916 - BLOCK
    )
    :vars
    (
      ?auto_14918 - BLOCK
      ?auto_14917 - BLOCK
      ?auto_14919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14918 ?auto_14916 ) ( ON-TABLE ?auto_14916 ) ( not ( = ?auto_14916 ?auto_14918 ) ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( not ( = ?auto_14916 ?auto_14919 ) ) ( not ( = ?auto_14918 ?auto_14917 ) ) ( not ( = ?auto_14918 ?auto_14919 ) ) ( not ( = ?auto_14917 ?auto_14919 ) ) ( ON ?auto_14917 ?auto_14918 ) ( HOLDING ?auto_14919 ) ( CLEAR ?auto_14917 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14916 ?auto_14918 ?auto_14917 ?auto_14919 )
      ( MAKE-1PILE ?auto_14916 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14920 - BLOCK
    )
    :vars
    (
      ?auto_14923 - BLOCK
      ?auto_14922 - BLOCK
      ?auto_14921 - BLOCK
      ?auto_14924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14923 ?auto_14920 ) ( ON-TABLE ?auto_14920 ) ( not ( = ?auto_14920 ?auto_14923 ) ) ( not ( = ?auto_14920 ?auto_14922 ) ) ( not ( = ?auto_14920 ?auto_14921 ) ) ( not ( = ?auto_14923 ?auto_14922 ) ) ( not ( = ?auto_14923 ?auto_14921 ) ) ( not ( = ?auto_14922 ?auto_14921 ) ) ( ON ?auto_14922 ?auto_14923 ) ( CLEAR ?auto_14922 ) ( ON ?auto_14921 ?auto_14924 ) ( CLEAR ?auto_14921 ) ( HAND-EMPTY ) ( not ( = ?auto_14920 ?auto_14924 ) ) ( not ( = ?auto_14923 ?auto_14924 ) ) ( not ( = ?auto_14922 ?auto_14924 ) ) ( not ( = ?auto_14921 ?auto_14924 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14921 ?auto_14924 )
      ( MAKE-1PILE ?auto_14920 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14925 - BLOCK
    )
    :vars
    (
      ?auto_14929 - BLOCK
      ?auto_14928 - BLOCK
      ?auto_14927 - BLOCK
      ?auto_14926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14929 ?auto_14925 ) ( ON-TABLE ?auto_14925 ) ( not ( = ?auto_14925 ?auto_14929 ) ) ( not ( = ?auto_14925 ?auto_14928 ) ) ( not ( = ?auto_14925 ?auto_14927 ) ) ( not ( = ?auto_14929 ?auto_14928 ) ) ( not ( = ?auto_14929 ?auto_14927 ) ) ( not ( = ?auto_14928 ?auto_14927 ) ) ( ON ?auto_14927 ?auto_14926 ) ( CLEAR ?auto_14927 ) ( not ( = ?auto_14925 ?auto_14926 ) ) ( not ( = ?auto_14929 ?auto_14926 ) ) ( not ( = ?auto_14928 ?auto_14926 ) ) ( not ( = ?auto_14927 ?auto_14926 ) ) ( HOLDING ?auto_14928 ) ( CLEAR ?auto_14929 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14925 ?auto_14929 ?auto_14928 )
      ( MAKE-1PILE ?auto_14925 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14930 - BLOCK
    )
    :vars
    (
      ?auto_14931 - BLOCK
      ?auto_14932 - BLOCK
      ?auto_14933 - BLOCK
      ?auto_14934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14931 ?auto_14930 ) ( ON-TABLE ?auto_14930 ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14933 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14933 ) ) ( not ( = ?auto_14932 ?auto_14933 ) ) ( ON ?auto_14933 ?auto_14934 ) ( not ( = ?auto_14930 ?auto_14934 ) ) ( not ( = ?auto_14931 ?auto_14934 ) ) ( not ( = ?auto_14932 ?auto_14934 ) ) ( not ( = ?auto_14933 ?auto_14934 ) ) ( CLEAR ?auto_14931 ) ( ON ?auto_14932 ?auto_14933 ) ( CLEAR ?auto_14932 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14934 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14934 ?auto_14933 )
      ( MAKE-1PILE ?auto_14930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14945 - BLOCK
    )
    :vars
    (
      ?auto_14947 - BLOCK
      ?auto_14948 - BLOCK
      ?auto_14949 - BLOCK
      ?auto_14946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14945 ?auto_14947 ) ) ( not ( = ?auto_14945 ?auto_14948 ) ) ( not ( = ?auto_14945 ?auto_14949 ) ) ( not ( = ?auto_14947 ?auto_14948 ) ) ( not ( = ?auto_14947 ?auto_14949 ) ) ( not ( = ?auto_14948 ?auto_14949 ) ) ( ON ?auto_14949 ?auto_14946 ) ( not ( = ?auto_14945 ?auto_14946 ) ) ( not ( = ?auto_14947 ?auto_14946 ) ) ( not ( = ?auto_14948 ?auto_14946 ) ) ( not ( = ?auto_14949 ?auto_14946 ) ) ( ON ?auto_14948 ?auto_14949 ) ( ON-TABLE ?auto_14946 ) ( ON ?auto_14947 ?auto_14948 ) ( CLEAR ?auto_14947 ) ( HOLDING ?auto_14945 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14945 ?auto_14947 )
      ( MAKE-1PILE ?auto_14945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14950 - BLOCK
    )
    :vars
    (
      ?auto_14952 - BLOCK
      ?auto_14953 - BLOCK
      ?auto_14954 - BLOCK
      ?auto_14951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14950 ?auto_14952 ) ) ( not ( = ?auto_14950 ?auto_14953 ) ) ( not ( = ?auto_14950 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14953 ?auto_14954 ) ) ( ON ?auto_14954 ?auto_14951 ) ( not ( = ?auto_14950 ?auto_14951 ) ) ( not ( = ?auto_14952 ?auto_14951 ) ) ( not ( = ?auto_14953 ?auto_14951 ) ) ( not ( = ?auto_14954 ?auto_14951 ) ) ( ON ?auto_14953 ?auto_14954 ) ( ON-TABLE ?auto_14951 ) ( ON ?auto_14952 ?auto_14953 ) ( ON ?auto_14950 ?auto_14952 ) ( CLEAR ?auto_14950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14951 ?auto_14954 ?auto_14953 ?auto_14952 )
      ( MAKE-1PILE ?auto_14950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14958 - BLOCK
      ?auto_14959 - BLOCK
      ?auto_14960 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_14960 ) ( CLEAR ?auto_14959 ) ( ON-TABLE ?auto_14958 ) ( ON ?auto_14959 ?auto_14958 ) ( not ( = ?auto_14958 ?auto_14959 ) ) ( not ( = ?auto_14958 ?auto_14960 ) ) ( not ( = ?auto_14959 ?auto_14960 ) ) )
    :subtasks
    ( ( !STACK ?auto_14960 ?auto_14959 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14961 - BLOCK
      ?auto_14962 - BLOCK
      ?auto_14963 - BLOCK
    )
    :vars
    (
      ?auto_14964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14962 ) ( ON-TABLE ?auto_14961 ) ( ON ?auto_14962 ?auto_14961 ) ( not ( = ?auto_14961 ?auto_14962 ) ) ( not ( = ?auto_14961 ?auto_14963 ) ) ( not ( = ?auto_14962 ?auto_14963 ) ) ( ON ?auto_14963 ?auto_14964 ) ( CLEAR ?auto_14963 ) ( HAND-EMPTY ) ( not ( = ?auto_14961 ?auto_14964 ) ) ( not ( = ?auto_14962 ?auto_14964 ) ) ( not ( = ?auto_14963 ?auto_14964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14963 ?auto_14964 )
      ( MAKE-3PILE ?auto_14961 ?auto_14962 ?auto_14963 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14965 - BLOCK
      ?auto_14966 - BLOCK
      ?auto_14967 - BLOCK
    )
    :vars
    (
      ?auto_14968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14965 ) ( not ( = ?auto_14965 ?auto_14966 ) ) ( not ( = ?auto_14965 ?auto_14967 ) ) ( not ( = ?auto_14966 ?auto_14967 ) ) ( ON ?auto_14967 ?auto_14968 ) ( CLEAR ?auto_14967 ) ( not ( = ?auto_14965 ?auto_14968 ) ) ( not ( = ?auto_14966 ?auto_14968 ) ) ( not ( = ?auto_14967 ?auto_14968 ) ) ( HOLDING ?auto_14966 ) ( CLEAR ?auto_14965 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14965 ?auto_14966 )
      ( MAKE-3PILE ?auto_14965 ?auto_14966 ?auto_14967 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14969 - BLOCK
      ?auto_14970 - BLOCK
      ?auto_14971 - BLOCK
    )
    :vars
    (
      ?auto_14972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14969 ) ( not ( = ?auto_14969 ?auto_14970 ) ) ( not ( = ?auto_14969 ?auto_14971 ) ) ( not ( = ?auto_14970 ?auto_14971 ) ) ( ON ?auto_14971 ?auto_14972 ) ( not ( = ?auto_14969 ?auto_14972 ) ) ( not ( = ?auto_14970 ?auto_14972 ) ) ( not ( = ?auto_14971 ?auto_14972 ) ) ( CLEAR ?auto_14969 ) ( ON ?auto_14970 ?auto_14971 ) ( CLEAR ?auto_14970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14972 ?auto_14971 )
      ( MAKE-3PILE ?auto_14969 ?auto_14970 ?auto_14971 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14973 - BLOCK
      ?auto_14974 - BLOCK
      ?auto_14975 - BLOCK
    )
    :vars
    (
      ?auto_14976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14973 ?auto_14974 ) ) ( not ( = ?auto_14973 ?auto_14975 ) ) ( not ( = ?auto_14974 ?auto_14975 ) ) ( ON ?auto_14975 ?auto_14976 ) ( not ( = ?auto_14973 ?auto_14976 ) ) ( not ( = ?auto_14974 ?auto_14976 ) ) ( not ( = ?auto_14975 ?auto_14976 ) ) ( ON ?auto_14974 ?auto_14975 ) ( CLEAR ?auto_14974 ) ( ON-TABLE ?auto_14976 ) ( HOLDING ?auto_14973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14973 )
      ( MAKE-3PILE ?auto_14973 ?auto_14974 ?auto_14975 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14977 - BLOCK
      ?auto_14978 - BLOCK
      ?auto_14979 - BLOCK
    )
    :vars
    (
      ?auto_14980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14977 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14979 ) ) ( not ( = ?auto_14978 ?auto_14979 ) ) ( ON ?auto_14979 ?auto_14980 ) ( not ( = ?auto_14977 ?auto_14980 ) ) ( not ( = ?auto_14978 ?auto_14980 ) ) ( not ( = ?auto_14979 ?auto_14980 ) ) ( ON ?auto_14978 ?auto_14979 ) ( ON-TABLE ?auto_14980 ) ( ON ?auto_14977 ?auto_14978 ) ( CLEAR ?auto_14977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14980 ?auto_14979 ?auto_14978 )
      ( MAKE-3PILE ?auto_14977 ?auto_14978 ?auto_14979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14981 - BLOCK
      ?auto_14982 - BLOCK
      ?auto_14983 - BLOCK
    )
    :vars
    (
      ?auto_14984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14981 ?auto_14982 ) ) ( not ( = ?auto_14981 ?auto_14983 ) ) ( not ( = ?auto_14982 ?auto_14983 ) ) ( ON ?auto_14983 ?auto_14984 ) ( not ( = ?auto_14981 ?auto_14984 ) ) ( not ( = ?auto_14982 ?auto_14984 ) ) ( not ( = ?auto_14983 ?auto_14984 ) ) ( ON ?auto_14982 ?auto_14983 ) ( ON-TABLE ?auto_14984 ) ( HOLDING ?auto_14981 ) ( CLEAR ?auto_14982 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14984 ?auto_14983 ?auto_14982 ?auto_14981 )
      ( MAKE-3PILE ?auto_14981 ?auto_14982 ?auto_14983 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14985 - BLOCK
      ?auto_14986 - BLOCK
      ?auto_14987 - BLOCK
    )
    :vars
    (
      ?auto_14988 - BLOCK
      ?auto_14989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14985 ?auto_14986 ) ) ( not ( = ?auto_14985 ?auto_14987 ) ) ( not ( = ?auto_14986 ?auto_14987 ) ) ( ON ?auto_14987 ?auto_14988 ) ( not ( = ?auto_14985 ?auto_14988 ) ) ( not ( = ?auto_14986 ?auto_14988 ) ) ( not ( = ?auto_14987 ?auto_14988 ) ) ( ON ?auto_14986 ?auto_14987 ) ( ON-TABLE ?auto_14988 ) ( CLEAR ?auto_14986 ) ( ON ?auto_14985 ?auto_14989 ) ( CLEAR ?auto_14985 ) ( HAND-EMPTY ) ( not ( = ?auto_14985 ?auto_14989 ) ) ( not ( = ?auto_14986 ?auto_14989 ) ) ( not ( = ?auto_14987 ?auto_14989 ) ) ( not ( = ?auto_14988 ?auto_14989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14985 ?auto_14989 )
      ( MAKE-3PILE ?auto_14985 ?auto_14986 ?auto_14987 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14990 - BLOCK
      ?auto_14991 - BLOCK
      ?auto_14992 - BLOCK
    )
    :vars
    (
      ?auto_14994 - BLOCK
      ?auto_14993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( ON ?auto_14992 ?auto_14994 ) ( not ( = ?auto_14990 ?auto_14994 ) ) ( not ( = ?auto_14991 ?auto_14994 ) ) ( not ( = ?auto_14992 ?auto_14994 ) ) ( ON-TABLE ?auto_14994 ) ( ON ?auto_14990 ?auto_14993 ) ( CLEAR ?auto_14990 ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14994 ?auto_14993 ) ) ( HOLDING ?auto_14991 ) ( CLEAR ?auto_14992 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14994 ?auto_14992 ?auto_14991 )
      ( MAKE-3PILE ?auto_14990 ?auto_14991 ?auto_14992 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14995 - BLOCK
      ?auto_14996 - BLOCK
      ?auto_14997 - BLOCK
    )
    :vars
    (
      ?auto_14999 - BLOCK
      ?auto_14998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14995 ?auto_14996 ) ) ( not ( = ?auto_14995 ?auto_14997 ) ) ( not ( = ?auto_14996 ?auto_14997 ) ) ( ON ?auto_14997 ?auto_14999 ) ( not ( = ?auto_14995 ?auto_14999 ) ) ( not ( = ?auto_14996 ?auto_14999 ) ) ( not ( = ?auto_14997 ?auto_14999 ) ) ( ON-TABLE ?auto_14999 ) ( ON ?auto_14995 ?auto_14998 ) ( not ( = ?auto_14995 ?auto_14998 ) ) ( not ( = ?auto_14996 ?auto_14998 ) ) ( not ( = ?auto_14997 ?auto_14998 ) ) ( not ( = ?auto_14999 ?auto_14998 ) ) ( CLEAR ?auto_14997 ) ( ON ?auto_14996 ?auto_14995 ) ( CLEAR ?auto_14996 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14998 ?auto_14995 )
      ( MAKE-3PILE ?auto_14995 ?auto_14996 ?auto_14997 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15000 - BLOCK
      ?auto_15001 - BLOCK
      ?auto_15002 - BLOCK
    )
    :vars
    (
      ?auto_15004 - BLOCK
      ?auto_15003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15000 ?auto_15001 ) ) ( not ( = ?auto_15000 ?auto_15002 ) ) ( not ( = ?auto_15001 ?auto_15002 ) ) ( not ( = ?auto_15000 ?auto_15004 ) ) ( not ( = ?auto_15001 ?auto_15004 ) ) ( not ( = ?auto_15002 ?auto_15004 ) ) ( ON-TABLE ?auto_15004 ) ( ON ?auto_15000 ?auto_15003 ) ( not ( = ?auto_15000 ?auto_15003 ) ) ( not ( = ?auto_15001 ?auto_15003 ) ) ( not ( = ?auto_15002 ?auto_15003 ) ) ( not ( = ?auto_15004 ?auto_15003 ) ) ( ON ?auto_15001 ?auto_15000 ) ( CLEAR ?auto_15001 ) ( ON-TABLE ?auto_15003 ) ( HOLDING ?auto_15002 ) ( CLEAR ?auto_15004 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15004 ?auto_15002 )
      ( MAKE-3PILE ?auto_15000 ?auto_15001 ?auto_15002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15005 - BLOCK
      ?auto_15006 - BLOCK
      ?auto_15007 - BLOCK
    )
    :vars
    (
      ?auto_15008 - BLOCK
      ?auto_15009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15005 ?auto_15006 ) ) ( not ( = ?auto_15005 ?auto_15007 ) ) ( not ( = ?auto_15006 ?auto_15007 ) ) ( not ( = ?auto_15005 ?auto_15008 ) ) ( not ( = ?auto_15006 ?auto_15008 ) ) ( not ( = ?auto_15007 ?auto_15008 ) ) ( ON-TABLE ?auto_15008 ) ( ON ?auto_15005 ?auto_15009 ) ( not ( = ?auto_15005 ?auto_15009 ) ) ( not ( = ?auto_15006 ?auto_15009 ) ) ( not ( = ?auto_15007 ?auto_15009 ) ) ( not ( = ?auto_15008 ?auto_15009 ) ) ( ON ?auto_15006 ?auto_15005 ) ( ON-TABLE ?auto_15009 ) ( CLEAR ?auto_15008 ) ( ON ?auto_15007 ?auto_15006 ) ( CLEAR ?auto_15007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15009 ?auto_15005 ?auto_15006 )
      ( MAKE-3PILE ?auto_15005 ?auto_15006 ?auto_15007 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15010 - BLOCK
      ?auto_15011 - BLOCK
      ?auto_15012 - BLOCK
    )
    :vars
    (
      ?auto_15014 - BLOCK
      ?auto_15013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15010 ?auto_15011 ) ) ( not ( = ?auto_15010 ?auto_15012 ) ) ( not ( = ?auto_15011 ?auto_15012 ) ) ( not ( = ?auto_15010 ?auto_15014 ) ) ( not ( = ?auto_15011 ?auto_15014 ) ) ( not ( = ?auto_15012 ?auto_15014 ) ) ( ON ?auto_15010 ?auto_15013 ) ( not ( = ?auto_15010 ?auto_15013 ) ) ( not ( = ?auto_15011 ?auto_15013 ) ) ( not ( = ?auto_15012 ?auto_15013 ) ) ( not ( = ?auto_15014 ?auto_15013 ) ) ( ON ?auto_15011 ?auto_15010 ) ( ON-TABLE ?auto_15013 ) ( ON ?auto_15012 ?auto_15011 ) ( CLEAR ?auto_15012 ) ( HOLDING ?auto_15014 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15014 )
      ( MAKE-3PILE ?auto_15010 ?auto_15011 ?auto_15012 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15015 - BLOCK
      ?auto_15016 - BLOCK
      ?auto_15017 - BLOCK
    )
    :vars
    (
      ?auto_15018 - BLOCK
      ?auto_15019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15015 ?auto_15016 ) ) ( not ( = ?auto_15015 ?auto_15017 ) ) ( not ( = ?auto_15016 ?auto_15017 ) ) ( not ( = ?auto_15015 ?auto_15018 ) ) ( not ( = ?auto_15016 ?auto_15018 ) ) ( not ( = ?auto_15017 ?auto_15018 ) ) ( ON ?auto_15015 ?auto_15019 ) ( not ( = ?auto_15015 ?auto_15019 ) ) ( not ( = ?auto_15016 ?auto_15019 ) ) ( not ( = ?auto_15017 ?auto_15019 ) ) ( not ( = ?auto_15018 ?auto_15019 ) ) ( ON ?auto_15016 ?auto_15015 ) ( ON-TABLE ?auto_15019 ) ( ON ?auto_15017 ?auto_15016 ) ( ON ?auto_15018 ?auto_15017 ) ( CLEAR ?auto_15018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15019 ?auto_15015 ?auto_15016 ?auto_15017 )
      ( MAKE-3PILE ?auto_15015 ?auto_15016 ?auto_15017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15024 - BLOCK
      ?auto_15025 - BLOCK
      ?auto_15026 - BLOCK
      ?auto_15027 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15027 ) ( CLEAR ?auto_15026 ) ( ON-TABLE ?auto_15024 ) ( ON ?auto_15025 ?auto_15024 ) ( ON ?auto_15026 ?auto_15025 ) ( not ( = ?auto_15024 ?auto_15025 ) ) ( not ( = ?auto_15024 ?auto_15026 ) ) ( not ( = ?auto_15024 ?auto_15027 ) ) ( not ( = ?auto_15025 ?auto_15026 ) ) ( not ( = ?auto_15025 ?auto_15027 ) ) ( not ( = ?auto_15026 ?auto_15027 ) ) )
    :subtasks
    ( ( !STACK ?auto_15027 ?auto_15026 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15028 - BLOCK
      ?auto_15029 - BLOCK
      ?auto_15030 - BLOCK
      ?auto_15031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15030 ) ( ON-TABLE ?auto_15028 ) ( ON ?auto_15029 ?auto_15028 ) ( ON ?auto_15030 ?auto_15029 ) ( not ( = ?auto_15028 ?auto_15029 ) ) ( not ( = ?auto_15028 ?auto_15030 ) ) ( not ( = ?auto_15028 ?auto_15031 ) ) ( not ( = ?auto_15029 ?auto_15030 ) ) ( not ( = ?auto_15029 ?auto_15031 ) ) ( not ( = ?auto_15030 ?auto_15031 ) ) ( ON-TABLE ?auto_15031 ) ( CLEAR ?auto_15031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_15031 )
      ( MAKE-4PILE ?auto_15028 ?auto_15029 ?auto_15030 ?auto_15031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15032 - BLOCK
      ?auto_15033 - BLOCK
      ?auto_15034 - BLOCK
      ?auto_15035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15032 ) ( ON ?auto_15033 ?auto_15032 ) ( not ( = ?auto_15032 ?auto_15033 ) ) ( not ( = ?auto_15032 ?auto_15034 ) ) ( not ( = ?auto_15032 ?auto_15035 ) ) ( not ( = ?auto_15033 ?auto_15034 ) ) ( not ( = ?auto_15033 ?auto_15035 ) ) ( not ( = ?auto_15034 ?auto_15035 ) ) ( ON-TABLE ?auto_15035 ) ( CLEAR ?auto_15035 ) ( HOLDING ?auto_15034 ) ( CLEAR ?auto_15033 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15032 ?auto_15033 ?auto_15034 )
      ( MAKE-4PILE ?auto_15032 ?auto_15033 ?auto_15034 ?auto_15035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15036 - BLOCK
      ?auto_15037 - BLOCK
      ?auto_15038 - BLOCK
      ?auto_15039 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15036 ) ( ON ?auto_15037 ?auto_15036 ) ( not ( = ?auto_15036 ?auto_15037 ) ) ( not ( = ?auto_15036 ?auto_15038 ) ) ( not ( = ?auto_15036 ?auto_15039 ) ) ( not ( = ?auto_15037 ?auto_15038 ) ) ( not ( = ?auto_15037 ?auto_15039 ) ) ( not ( = ?auto_15038 ?auto_15039 ) ) ( ON-TABLE ?auto_15039 ) ( CLEAR ?auto_15037 ) ( ON ?auto_15038 ?auto_15039 ) ( CLEAR ?auto_15038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15039 )
      ( MAKE-4PILE ?auto_15036 ?auto_15037 ?auto_15038 ?auto_15039 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15040 - BLOCK
      ?auto_15041 - BLOCK
      ?auto_15042 - BLOCK
      ?auto_15043 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15040 ) ( not ( = ?auto_15040 ?auto_15041 ) ) ( not ( = ?auto_15040 ?auto_15042 ) ) ( not ( = ?auto_15040 ?auto_15043 ) ) ( not ( = ?auto_15041 ?auto_15042 ) ) ( not ( = ?auto_15041 ?auto_15043 ) ) ( not ( = ?auto_15042 ?auto_15043 ) ) ( ON-TABLE ?auto_15043 ) ( ON ?auto_15042 ?auto_15043 ) ( CLEAR ?auto_15042 ) ( HOLDING ?auto_15041 ) ( CLEAR ?auto_15040 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15040 ?auto_15041 )
      ( MAKE-4PILE ?auto_15040 ?auto_15041 ?auto_15042 ?auto_15043 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15044 - BLOCK
      ?auto_15045 - BLOCK
      ?auto_15046 - BLOCK
      ?auto_15047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15044 ) ( not ( = ?auto_15044 ?auto_15045 ) ) ( not ( = ?auto_15044 ?auto_15046 ) ) ( not ( = ?auto_15044 ?auto_15047 ) ) ( not ( = ?auto_15045 ?auto_15046 ) ) ( not ( = ?auto_15045 ?auto_15047 ) ) ( not ( = ?auto_15046 ?auto_15047 ) ) ( ON-TABLE ?auto_15047 ) ( ON ?auto_15046 ?auto_15047 ) ( CLEAR ?auto_15044 ) ( ON ?auto_15045 ?auto_15046 ) ( CLEAR ?auto_15045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15047 ?auto_15046 )
      ( MAKE-4PILE ?auto_15044 ?auto_15045 ?auto_15046 ?auto_15047 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15048 - BLOCK
      ?auto_15049 - BLOCK
      ?auto_15050 - BLOCK
      ?auto_15051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15048 ?auto_15049 ) ) ( not ( = ?auto_15048 ?auto_15050 ) ) ( not ( = ?auto_15048 ?auto_15051 ) ) ( not ( = ?auto_15049 ?auto_15050 ) ) ( not ( = ?auto_15049 ?auto_15051 ) ) ( not ( = ?auto_15050 ?auto_15051 ) ) ( ON-TABLE ?auto_15051 ) ( ON ?auto_15050 ?auto_15051 ) ( ON ?auto_15049 ?auto_15050 ) ( CLEAR ?auto_15049 ) ( HOLDING ?auto_15048 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15048 )
      ( MAKE-4PILE ?auto_15048 ?auto_15049 ?auto_15050 ?auto_15051 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15052 - BLOCK
      ?auto_15053 - BLOCK
      ?auto_15054 - BLOCK
      ?auto_15055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15052 ?auto_15053 ) ) ( not ( = ?auto_15052 ?auto_15054 ) ) ( not ( = ?auto_15052 ?auto_15055 ) ) ( not ( = ?auto_15053 ?auto_15054 ) ) ( not ( = ?auto_15053 ?auto_15055 ) ) ( not ( = ?auto_15054 ?auto_15055 ) ) ( ON-TABLE ?auto_15055 ) ( ON ?auto_15054 ?auto_15055 ) ( ON ?auto_15053 ?auto_15054 ) ( ON ?auto_15052 ?auto_15053 ) ( CLEAR ?auto_15052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15055 ?auto_15054 ?auto_15053 )
      ( MAKE-4PILE ?auto_15052 ?auto_15053 ?auto_15054 ?auto_15055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15056 - BLOCK
      ?auto_15057 - BLOCK
      ?auto_15058 - BLOCK
      ?auto_15059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15056 ?auto_15057 ) ) ( not ( = ?auto_15056 ?auto_15058 ) ) ( not ( = ?auto_15056 ?auto_15059 ) ) ( not ( = ?auto_15057 ?auto_15058 ) ) ( not ( = ?auto_15057 ?auto_15059 ) ) ( not ( = ?auto_15058 ?auto_15059 ) ) ( ON-TABLE ?auto_15059 ) ( ON ?auto_15058 ?auto_15059 ) ( ON ?auto_15057 ?auto_15058 ) ( HOLDING ?auto_15056 ) ( CLEAR ?auto_15057 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15059 ?auto_15058 ?auto_15057 ?auto_15056 )
      ( MAKE-4PILE ?auto_15056 ?auto_15057 ?auto_15058 ?auto_15059 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15060 - BLOCK
      ?auto_15061 - BLOCK
      ?auto_15062 - BLOCK
      ?auto_15063 - BLOCK
    )
    :vars
    (
      ?auto_15064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15060 ?auto_15061 ) ) ( not ( = ?auto_15060 ?auto_15062 ) ) ( not ( = ?auto_15060 ?auto_15063 ) ) ( not ( = ?auto_15061 ?auto_15062 ) ) ( not ( = ?auto_15061 ?auto_15063 ) ) ( not ( = ?auto_15062 ?auto_15063 ) ) ( ON-TABLE ?auto_15063 ) ( ON ?auto_15062 ?auto_15063 ) ( ON ?auto_15061 ?auto_15062 ) ( CLEAR ?auto_15061 ) ( ON ?auto_15060 ?auto_15064 ) ( CLEAR ?auto_15060 ) ( HAND-EMPTY ) ( not ( = ?auto_15060 ?auto_15064 ) ) ( not ( = ?auto_15061 ?auto_15064 ) ) ( not ( = ?auto_15062 ?auto_15064 ) ) ( not ( = ?auto_15063 ?auto_15064 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15060 ?auto_15064 )
      ( MAKE-4PILE ?auto_15060 ?auto_15061 ?auto_15062 ?auto_15063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15065 - BLOCK
      ?auto_15066 - BLOCK
      ?auto_15067 - BLOCK
      ?auto_15068 - BLOCK
    )
    :vars
    (
      ?auto_15069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15065 ?auto_15066 ) ) ( not ( = ?auto_15065 ?auto_15067 ) ) ( not ( = ?auto_15065 ?auto_15068 ) ) ( not ( = ?auto_15066 ?auto_15067 ) ) ( not ( = ?auto_15066 ?auto_15068 ) ) ( not ( = ?auto_15067 ?auto_15068 ) ) ( ON-TABLE ?auto_15068 ) ( ON ?auto_15067 ?auto_15068 ) ( ON ?auto_15065 ?auto_15069 ) ( CLEAR ?auto_15065 ) ( not ( = ?auto_15065 ?auto_15069 ) ) ( not ( = ?auto_15066 ?auto_15069 ) ) ( not ( = ?auto_15067 ?auto_15069 ) ) ( not ( = ?auto_15068 ?auto_15069 ) ) ( HOLDING ?auto_15066 ) ( CLEAR ?auto_15067 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15068 ?auto_15067 ?auto_15066 )
      ( MAKE-4PILE ?auto_15065 ?auto_15066 ?auto_15067 ?auto_15068 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15070 - BLOCK
      ?auto_15071 - BLOCK
      ?auto_15072 - BLOCK
      ?auto_15073 - BLOCK
    )
    :vars
    (
      ?auto_15074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15070 ?auto_15071 ) ) ( not ( = ?auto_15070 ?auto_15072 ) ) ( not ( = ?auto_15070 ?auto_15073 ) ) ( not ( = ?auto_15071 ?auto_15072 ) ) ( not ( = ?auto_15071 ?auto_15073 ) ) ( not ( = ?auto_15072 ?auto_15073 ) ) ( ON-TABLE ?auto_15073 ) ( ON ?auto_15072 ?auto_15073 ) ( ON ?auto_15070 ?auto_15074 ) ( not ( = ?auto_15070 ?auto_15074 ) ) ( not ( = ?auto_15071 ?auto_15074 ) ) ( not ( = ?auto_15072 ?auto_15074 ) ) ( not ( = ?auto_15073 ?auto_15074 ) ) ( CLEAR ?auto_15072 ) ( ON ?auto_15071 ?auto_15070 ) ( CLEAR ?auto_15071 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15074 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15074 ?auto_15070 )
      ( MAKE-4PILE ?auto_15070 ?auto_15071 ?auto_15072 ?auto_15073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15075 - BLOCK
      ?auto_15076 - BLOCK
      ?auto_15077 - BLOCK
      ?auto_15078 - BLOCK
    )
    :vars
    (
      ?auto_15079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15075 ?auto_15076 ) ) ( not ( = ?auto_15075 ?auto_15077 ) ) ( not ( = ?auto_15075 ?auto_15078 ) ) ( not ( = ?auto_15076 ?auto_15077 ) ) ( not ( = ?auto_15076 ?auto_15078 ) ) ( not ( = ?auto_15077 ?auto_15078 ) ) ( ON-TABLE ?auto_15078 ) ( ON ?auto_15075 ?auto_15079 ) ( not ( = ?auto_15075 ?auto_15079 ) ) ( not ( = ?auto_15076 ?auto_15079 ) ) ( not ( = ?auto_15077 ?auto_15079 ) ) ( not ( = ?auto_15078 ?auto_15079 ) ) ( ON ?auto_15076 ?auto_15075 ) ( CLEAR ?auto_15076 ) ( ON-TABLE ?auto_15079 ) ( HOLDING ?auto_15077 ) ( CLEAR ?auto_15078 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15078 ?auto_15077 )
      ( MAKE-4PILE ?auto_15075 ?auto_15076 ?auto_15077 ?auto_15078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15080 - BLOCK
      ?auto_15081 - BLOCK
      ?auto_15082 - BLOCK
      ?auto_15083 - BLOCK
    )
    :vars
    (
      ?auto_15084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15080 ?auto_15081 ) ) ( not ( = ?auto_15080 ?auto_15082 ) ) ( not ( = ?auto_15080 ?auto_15083 ) ) ( not ( = ?auto_15081 ?auto_15082 ) ) ( not ( = ?auto_15081 ?auto_15083 ) ) ( not ( = ?auto_15082 ?auto_15083 ) ) ( ON-TABLE ?auto_15083 ) ( ON ?auto_15080 ?auto_15084 ) ( not ( = ?auto_15080 ?auto_15084 ) ) ( not ( = ?auto_15081 ?auto_15084 ) ) ( not ( = ?auto_15082 ?auto_15084 ) ) ( not ( = ?auto_15083 ?auto_15084 ) ) ( ON ?auto_15081 ?auto_15080 ) ( ON-TABLE ?auto_15084 ) ( CLEAR ?auto_15083 ) ( ON ?auto_15082 ?auto_15081 ) ( CLEAR ?auto_15082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15084 ?auto_15080 ?auto_15081 )
      ( MAKE-4PILE ?auto_15080 ?auto_15081 ?auto_15082 ?auto_15083 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15085 - BLOCK
      ?auto_15086 - BLOCK
      ?auto_15087 - BLOCK
      ?auto_15088 - BLOCK
    )
    :vars
    (
      ?auto_15089 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15085 ?auto_15086 ) ) ( not ( = ?auto_15085 ?auto_15087 ) ) ( not ( = ?auto_15085 ?auto_15088 ) ) ( not ( = ?auto_15086 ?auto_15087 ) ) ( not ( = ?auto_15086 ?auto_15088 ) ) ( not ( = ?auto_15087 ?auto_15088 ) ) ( ON ?auto_15085 ?auto_15089 ) ( not ( = ?auto_15085 ?auto_15089 ) ) ( not ( = ?auto_15086 ?auto_15089 ) ) ( not ( = ?auto_15087 ?auto_15089 ) ) ( not ( = ?auto_15088 ?auto_15089 ) ) ( ON ?auto_15086 ?auto_15085 ) ( ON-TABLE ?auto_15089 ) ( ON ?auto_15087 ?auto_15086 ) ( CLEAR ?auto_15087 ) ( HOLDING ?auto_15088 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15088 )
      ( MAKE-4PILE ?auto_15085 ?auto_15086 ?auto_15087 ?auto_15088 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15090 - BLOCK
      ?auto_15091 - BLOCK
      ?auto_15092 - BLOCK
      ?auto_15093 - BLOCK
    )
    :vars
    (
      ?auto_15094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15090 ?auto_15091 ) ) ( not ( = ?auto_15090 ?auto_15092 ) ) ( not ( = ?auto_15090 ?auto_15093 ) ) ( not ( = ?auto_15091 ?auto_15092 ) ) ( not ( = ?auto_15091 ?auto_15093 ) ) ( not ( = ?auto_15092 ?auto_15093 ) ) ( ON ?auto_15090 ?auto_15094 ) ( not ( = ?auto_15090 ?auto_15094 ) ) ( not ( = ?auto_15091 ?auto_15094 ) ) ( not ( = ?auto_15092 ?auto_15094 ) ) ( not ( = ?auto_15093 ?auto_15094 ) ) ( ON ?auto_15091 ?auto_15090 ) ( ON-TABLE ?auto_15094 ) ( ON ?auto_15092 ?auto_15091 ) ( ON ?auto_15093 ?auto_15092 ) ( CLEAR ?auto_15093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15094 ?auto_15090 ?auto_15091 ?auto_15092 )
      ( MAKE-4PILE ?auto_15090 ?auto_15091 ?auto_15092 ?auto_15093 ) )
  )

)

