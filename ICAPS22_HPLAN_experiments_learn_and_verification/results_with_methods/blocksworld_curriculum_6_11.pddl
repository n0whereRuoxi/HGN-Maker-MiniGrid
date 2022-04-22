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
      ?auto_14584 - BLOCK
    )
    :vars
    (
      ?auto_14585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14584 ?auto_14585 ) ( CLEAR ?auto_14584 ) ( HAND-EMPTY ) ( not ( = ?auto_14584 ?auto_14585 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14584 ?auto_14585 )
      ( !PUTDOWN ?auto_14584 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_14587 - BLOCK
    )
    :vars
    (
      ?auto_14588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14587 ?auto_14588 ) ( CLEAR ?auto_14587 ) ( HAND-EMPTY ) ( not ( = ?auto_14587 ?auto_14588 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14587 ?auto_14588 )
      ( !PUTDOWN ?auto_14587 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14591 - BLOCK
      ?auto_14592 - BLOCK
    )
    :vars
    (
      ?auto_14593 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14591 ) ( ON ?auto_14592 ?auto_14593 ) ( CLEAR ?auto_14592 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14591 ) ( not ( = ?auto_14591 ?auto_14592 ) ) ( not ( = ?auto_14591 ?auto_14593 ) ) ( not ( = ?auto_14592 ?auto_14593 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14592 ?auto_14593 )
      ( !STACK ?auto_14592 ?auto_14591 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14596 - BLOCK
      ?auto_14597 - BLOCK
    )
    :vars
    (
      ?auto_14598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14596 ) ( ON ?auto_14597 ?auto_14598 ) ( CLEAR ?auto_14597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14596 ) ( not ( = ?auto_14596 ?auto_14597 ) ) ( not ( = ?auto_14596 ?auto_14598 ) ) ( not ( = ?auto_14597 ?auto_14598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14597 ?auto_14598 )
      ( !STACK ?auto_14597 ?auto_14596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14601 - BLOCK
      ?auto_14602 - BLOCK
    )
    :vars
    (
      ?auto_14603 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14602 ?auto_14603 ) ( not ( = ?auto_14601 ?auto_14602 ) ) ( not ( = ?auto_14601 ?auto_14603 ) ) ( not ( = ?auto_14602 ?auto_14603 ) ) ( ON ?auto_14601 ?auto_14602 ) ( CLEAR ?auto_14601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14601 )
      ( MAKE-2PILE ?auto_14601 ?auto_14602 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_14606 - BLOCK
      ?auto_14607 - BLOCK
    )
    :vars
    (
      ?auto_14608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14607 ?auto_14608 ) ( not ( = ?auto_14606 ?auto_14607 ) ) ( not ( = ?auto_14606 ?auto_14608 ) ) ( not ( = ?auto_14607 ?auto_14608 ) ) ( ON ?auto_14606 ?auto_14607 ) ( CLEAR ?auto_14606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14606 )
      ( MAKE-2PILE ?auto_14606 ?auto_14607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14612 - BLOCK
      ?auto_14613 - BLOCK
      ?auto_14614 - BLOCK
    )
    :vars
    (
      ?auto_14615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14613 ) ( ON ?auto_14614 ?auto_14615 ) ( CLEAR ?auto_14614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14612 ) ( ON ?auto_14613 ?auto_14612 ) ( not ( = ?auto_14612 ?auto_14613 ) ) ( not ( = ?auto_14612 ?auto_14614 ) ) ( not ( = ?auto_14612 ?auto_14615 ) ) ( not ( = ?auto_14613 ?auto_14614 ) ) ( not ( = ?auto_14613 ?auto_14615 ) ) ( not ( = ?auto_14614 ?auto_14615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14614 ?auto_14615 )
      ( !STACK ?auto_14614 ?auto_14613 ) )
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
      ?auto_14622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14620 ) ( ON ?auto_14621 ?auto_14622 ) ( CLEAR ?auto_14621 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14619 ) ( ON ?auto_14620 ?auto_14619 ) ( not ( = ?auto_14619 ?auto_14620 ) ) ( not ( = ?auto_14619 ?auto_14621 ) ) ( not ( = ?auto_14619 ?auto_14622 ) ) ( not ( = ?auto_14620 ?auto_14621 ) ) ( not ( = ?auto_14620 ?auto_14622 ) ) ( not ( = ?auto_14621 ?auto_14622 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14621 ?auto_14622 )
      ( !STACK ?auto_14621 ?auto_14620 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14626 - BLOCK
      ?auto_14627 - BLOCK
      ?auto_14628 - BLOCK
    )
    :vars
    (
      ?auto_14629 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14628 ?auto_14629 ) ( ON-TABLE ?auto_14626 ) ( not ( = ?auto_14626 ?auto_14627 ) ) ( not ( = ?auto_14626 ?auto_14628 ) ) ( not ( = ?auto_14626 ?auto_14629 ) ) ( not ( = ?auto_14627 ?auto_14628 ) ) ( not ( = ?auto_14627 ?auto_14629 ) ) ( not ( = ?auto_14628 ?auto_14629 ) ) ( CLEAR ?auto_14626 ) ( ON ?auto_14627 ?auto_14628 ) ( CLEAR ?auto_14627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14626 ?auto_14627 )
      ( MAKE-3PILE ?auto_14626 ?auto_14627 ?auto_14628 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14633 - BLOCK
      ?auto_14634 - BLOCK
      ?auto_14635 - BLOCK
    )
    :vars
    (
      ?auto_14636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14635 ?auto_14636 ) ( ON-TABLE ?auto_14633 ) ( not ( = ?auto_14633 ?auto_14634 ) ) ( not ( = ?auto_14633 ?auto_14635 ) ) ( not ( = ?auto_14633 ?auto_14636 ) ) ( not ( = ?auto_14634 ?auto_14635 ) ) ( not ( = ?auto_14634 ?auto_14636 ) ) ( not ( = ?auto_14635 ?auto_14636 ) ) ( CLEAR ?auto_14633 ) ( ON ?auto_14634 ?auto_14635 ) ( CLEAR ?auto_14634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14633 ?auto_14634 )
      ( MAKE-3PILE ?auto_14633 ?auto_14634 ?auto_14635 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14640 - BLOCK
      ?auto_14641 - BLOCK
      ?auto_14642 - BLOCK
    )
    :vars
    (
      ?auto_14643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14642 ?auto_14643 ) ( not ( = ?auto_14640 ?auto_14641 ) ) ( not ( = ?auto_14640 ?auto_14642 ) ) ( not ( = ?auto_14640 ?auto_14643 ) ) ( not ( = ?auto_14641 ?auto_14642 ) ) ( not ( = ?auto_14641 ?auto_14643 ) ) ( not ( = ?auto_14642 ?auto_14643 ) ) ( ON ?auto_14641 ?auto_14642 ) ( ON ?auto_14640 ?auto_14641 ) ( CLEAR ?auto_14640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14640 )
      ( MAKE-3PILE ?auto_14640 ?auto_14641 ?auto_14642 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_14647 - BLOCK
      ?auto_14648 - BLOCK
      ?auto_14649 - BLOCK
    )
    :vars
    (
      ?auto_14650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14649 ?auto_14650 ) ( not ( = ?auto_14647 ?auto_14648 ) ) ( not ( = ?auto_14647 ?auto_14649 ) ) ( not ( = ?auto_14647 ?auto_14650 ) ) ( not ( = ?auto_14648 ?auto_14649 ) ) ( not ( = ?auto_14648 ?auto_14650 ) ) ( not ( = ?auto_14649 ?auto_14650 ) ) ( ON ?auto_14648 ?auto_14649 ) ( ON ?auto_14647 ?auto_14648 ) ( CLEAR ?auto_14647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14647 )
      ( MAKE-3PILE ?auto_14647 ?auto_14648 ?auto_14649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14655 - BLOCK
      ?auto_14656 - BLOCK
      ?auto_14657 - BLOCK
      ?auto_14658 - BLOCK
    )
    :vars
    (
      ?auto_14659 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14657 ) ( ON ?auto_14658 ?auto_14659 ) ( CLEAR ?auto_14658 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14655 ) ( ON ?auto_14656 ?auto_14655 ) ( ON ?auto_14657 ?auto_14656 ) ( not ( = ?auto_14655 ?auto_14656 ) ) ( not ( = ?auto_14655 ?auto_14657 ) ) ( not ( = ?auto_14655 ?auto_14658 ) ) ( not ( = ?auto_14655 ?auto_14659 ) ) ( not ( = ?auto_14656 ?auto_14657 ) ) ( not ( = ?auto_14656 ?auto_14658 ) ) ( not ( = ?auto_14656 ?auto_14659 ) ) ( not ( = ?auto_14657 ?auto_14658 ) ) ( not ( = ?auto_14657 ?auto_14659 ) ) ( not ( = ?auto_14658 ?auto_14659 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14658 ?auto_14659 )
      ( !STACK ?auto_14658 ?auto_14657 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14664 - BLOCK
      ?auto_14665 - BLOCK
      ?auto_14666 - BLOCK
      ?auto_14667 - BLOCK
    )
    :vars
    (
      ?auto_14668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14666 ) ( ON ?auto_14667 ?auto_14668 ) ( CLEAR ?auto_14667 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14664 ) ( ON ?auto_14665 ?auto_14664 ) ( ON ?auto_14666 ?auto_14665 ) ( not ( = ?auto_14664 ?auto_14665 ) ) ( not ( = ?auto_14664 ?auto_14666 ) ) ( not ( = ?auto_14664 ?auto_14667 ) ) ( not ( = ?auto_14664 ?auto_14668 ) ) ( not ( = ?auto_14665 ?auto_14666 ) ) ( not ( = ?auto_14665 ?auto_14667 ) ) ( not ( = ?auto_14665 ?auto_14668 ) ) ( not ( = ?auto_14666 ?auto_14667 ) ) ( not ( = ?auto_14666 ?auto_14668 ) ) ( not ( = ?auto_14667 ?auto_14668 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14667 ?auto_14668 )
      ( !STACK ?auto_14667 ?auto_14666 ) )
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
    ( and ( ON ?auto_14676 ?auto_14677 ) ( ON-TABLE ?auto_14673 ) ( ON ?auto_14674 ?auto_14673 ) ( not ( = ?auto_14673 ?auto_14674 ) ) ( not ( = ?auto_14673 ?auto_14675 ) ) ( not ( = ?auto_14673 ?auto_14676 ) ) ( not ( = ?auto_14673 ?auto_14677 ) ) ( not ( = ?auto_14674 ?auto_14675 ) ) ( not ( = ?auto_14674 ?auto_14676 ) ) ( not ( = ?auto_14674 ?auto_14677 ) ) ( not ( = ?auto_14675 ?auto_14676 ) ) ( not ( = ?auto_14675 ?auto_14677 ) ) ( not ( = ?auto_14676 ?auto_14677 ) ) ( CLEAR ?auto_14674 ) ( ON ?auto_14675 ?auto_14676 ) ( CLEAR ?auto_14675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14673 ?auto_14674 ?auto_14675 )
      ( MAKE-4PILE ?auto_14673 ?auto_14674 ?auto_14675 ?auto_14676 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14682 - BLOCK
      ?auto_14683 - BLOCK
      ?auto_14684 - BLOCK
      ?auto_14685 - BLOCK
    )
    :vars
    (
      ?auto_14686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14685 ?auto_14686 ) ( ON-TABLE ?auto_14682 ) ( ON ?auto_14683 ?auto_14682 ) ( not ( = ?auto_14682 ?auto_14683 ) ) ( not ( = ?auto_14682 ?auto_14684 ) ) ( not ( = ?auto_14682 ?auto_14685 ) ) ( not ( = ?auto_14682 ?auto_14686 ) ) ( not ( = ?auto_14683 ?auto_14684 ) ) ( not ( = ?auto_14683 ?auto_14685 ) ) ( not ( = ?auto_14683 ?auto_14686 ) ) ( not ( = ?auto_14684 ?auto_14685 ) ) ( not ( = ?auto_14684 ?auto_14686 ) ) ( not ( = ?auto_14685 ?auto_14686 ) ) ( CLEAR ?auto_14683 ) ( ON ?auto_14684 ?auto_14685 ) ( CLEAR ?auto_14684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14682 ?auto_14683 ?auto_14684 )
      ( MAKE-4PILE ?auto_14682 ?auto_14683 ?auto_14684 ?auto_14685 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14691 - BLOCK
      ?auto_14692 - BLOCK
      ?auto_14693 - BLOCK
      ?auto_14694 - BLOCK
    )
    :vars
    (
      ?auto_14695 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14694 ?auto_14695 ) ( ON-TABLE ?auto_14691 ) ( not ( = ?auto_14691 ?auto_14692 ) ) ( not ( = ?auto_14691 ?auto_14693 ) ) ( not ( = ?auto_14691 ?auto_14694 ) ) ( not ( = ?auto_14691 ?auto_14695 ) ) ( not ( = ?auto_14692 ?auto_14693 ) ) ( not ( = ?auto_14692 ?auto_14694 ) ) ( not ( = ?auto_14692 ?auto_14695 ) ) ( not ( = ?auto_14693 ?auto_14694 ) ) ( not ( = ?auto_14693 ?auto_14695 ) ) ( not ( = ?auto_14694 ?auto_14695 ) ) ( ON ?auto_14693 ?auto_14694 ) ( CLEAR ?auto_14691 ) ( ON ?auto_14692 ?auto_14693 ) ( CLEAR ?auto_14692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14691 ?auto_14692 )
      ( MAKE-4PILE ?auto_14691 ?auto_14692 ?auto_14693 ?auto_14694 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14700 - BLOCK
      ?auto_14701 - BLOCK
      ?auto_14702 - BLOCK
      ?auto_14703 - BLOCK
    )
    :vars
    (
      ?auto_14704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14703 ?auto_14704 ) ( ON-TABLE ?auto_14700 ) ( not ( = ?auto_14700 ?auto_14701 ) ) ( not ( = ?auto_14700 ?auto_14702 ) ) ( not ( = ?auto_14700 ?auto_14703 ) ) ( not ( = ?auto_14700 ?auto_14704 ) ) ( not ( = ?auto_14701 ?auto_14702 ) ) ( not ( = ?auto_14701 ?auto_14703 ) ) ( not ( = ?auto_14701 ?auto_14704 ) ) ( not ( = ?auto_14702 ?auto_14703 ) ) ( not ( = ?auto_14702 ?auto_14704 ) ) ( not ( = ?auto_14703 ?auto_14704 ) ) ( ON ?auto_14702 ?auto_14703 ) ( CLEAR ?auto_14700 ) ( ON ?auto_14701 ?auto_14702 ) ( CLEAR ?auto_14701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14700 ?auto_14701 )
      ( MAKE-4PILE ?auto_14700 ?auto_14701 ?auto_14702 ?auto_14703 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14709 - BLOCK
      ?auto_14710 - BLOCK
      ?auto_14711 - BLOCK
      ?auto_14712 - BLOCK
    )
    :vars
    (
      ?auto_14713 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14712 ?auto_14713 ) ( not ( = ?auto_14709 ?auto_14710 ) ) ( not ( = ?auto_14709 ?auto_14711 ) ) ( not ( = ?auto_14709 ?auto_14712 ) ) ( not ( = ?auto_14709 ?auto_14713 ) ) ( not ( = ?auto_14710 ?auto_14711 ) ) ( not ( = ?auto_14710 ?auto_14712 ) ) ( not ( = ?auto_14710 ?auto_14713 ) ) ( not ( = ?auto_14711 ?auto_14712 ) ) ( not ( = ?auto_14711 ?auto_14713 ) ) ( not ( = ?auto_14712 ?auto_14713 ) ) ( ON ?auto_14711 ?auto_14712 ) ( ON ?auto_14710 ?auto_14711 ) ( ON ?auto_14709 ?auto_14710 ) ( CLEAR ?auto_14709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14709 )
      ( MAKE-4PILE ?auto_14709 ?auto_14710 ?auto_14711 ?auto_14712 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_14718 - BLOCK
      ?auto_14719 - BLOCK
      ?auto_14720 - BLOCK
      ?auto_14721 - BLOCK
    )
    :vars
    (
      ?auto_14722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14721 ?auto_14722 ) ( not ( = ?auto_14718 ?auto_14719 ) ) ( not ( = ?auto_14718 ?auto_14720 ) ) ( not ( = ?auto_14718 ?auto_14721 ) ) ( not ( = ?auto_14718 ?auto_14722 ) ) ( not ( = ?auto_14719 ?auto_14720 ) ) ( not ( = ?auto_14719 ?auto_14721 ) ) ( not ( = ?auto_14719 ?auto_14722 ) ) ( not ( = ?auto_14720 ?auto_14721 ) ) ( not ( = ?auto_14720 ?auto_14722 ) ) ( not ( = ?auto_14721 ?auto_14722 ) ) ( ON ?auto_14720 ?auto_14721 ) ( ON ?auto_14719 ?auto_14720 ) ( ON ?auto_14718 ?auto_14719 ) ( CLEAR ?auto_14718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14718 )
      ( MAKE-4PILE ?auto_14718 ?auto_14719 ?auto_14720 ?auto_14721 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14728 - BLOCK
      ?auto_14729 - BLOCK
      ?auto_14730 - BLOCK
      ?auto_14731 - BLOCK
      ?auto_14732 - BLOCK
    )
    :vars
    (
      ?auto_14733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14731 ) ( ON ?auto_14732 ?auto_14733 ) ( CLEAR ?auto_14732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14728 ) ( ON ?auto_14729 ?auto_14728 ) ( ON ?auto_14730 ?auto_14729 ) ( ON ?auto_14731 ?auto_14730 ) ( not ( = ?auto_14728 ?auto_14729 ) ) ( not ( = ?auto_14728 ?auto_14730 ) ) ( not ( = ?auto_14728 ?auto_14731 ) ) ( not ( = ?auto_14728 ?auto_14732 ) ) ( not ( = ?auto_14728 ?auto_14733 ) ) ( not ( = ?auto_14729 ?auto_14730 ) ) ( not ( = ?auto_14729 ?auto_14731 ) ) ( not ( = ?auto_14729 ?auto_14732 ) ) ( not ( = ?auto_14729 ?auto_14733 ) ) ( not ( = ?auto_14730 ?auto_14731 ) ) ( not ( = ?auto_14730 ?auto_14732 ) ) ( not ( = ?auto_14730 ?auto_14733 ) ) ( not ( = ?auto_14731 ?auto_14732 ) ) ( not ( = ?auto_14731 ?auto_14733 ) ) ( not ( = ?auto_14732 ?auto_14733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14732 ?auto_14733 )
      ( !STACK ?auto_14732 ?auto_14731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14739 - BLOCK
      ?auto_14740 - BLOCK
      ?auto_14741 - BLOCK
      ?auto_14742 - BLOCK
      ?auto_14743 - BLOCK
    )
    :vars
    (
      ?auto_14744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14742 ) ( ON ?auto_14743 ?auto_14744 ) ( CLEAR ?auto_14743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14739 ) ( ON ?auto_14740 ?auto_14739 ) ( ON ?auto_14741 ?auto_14740 ) ( ON ?auto_14742 ?auto_14741 ) ( not ( = ?auto_14739 ?auto_14740 ) ) ( not ( = ?auto_14739 ?auto_14741 ) ) ( not ( = ?auto_14739 ?auto_14742 ) ) ( not ( = ?auto_14739 ?auto_14743 ) ) ( not ( = ?auto_14739 ?auto_14744 ) ) ( not ( = ?auto_14740 ?auto_14741 ) ) ( not ( = ?auto_14740 ?auto_14742 ) ) ( not ( = ?auto_14740 ?auto_14743 ) ) ( not ( = ?auto_14740 ?auto_14744 ) ) ( not ( = ?auto_14741 ?auto_14742 ) ) ( not ( = ?auto_14741 ?auto_14743 ) ) ( not ( = ?auto_14741 ?auto_14744 ) ) ( not ( = ?auto_14742 ?auto_14743 ) ) ( not ( = ?auto_14742 ?auto_14744 ) ) ( not ( = ?auto_14743 ?auto_14744 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14743 ?auto_14744 )
      ( !STACK ?auto_14743 ?auto_14742 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14750 - BLOCK
      ?auto_14751 - BLOCK
      ?auto_14752 - BLOCK
      ?auto_14753 - BLOCK
      ?auto_14754 - BLOCK
    )
    :vars
    (
      ?auto_14755 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14754 ?auto_14755 ) ( ON-TABLE ?auto_14750 ) ( ON ?auto_14751 ?auto_14750 ) ( ON ?auto_14752 ?auto_14751 ) ( not ( = ?auto_14750 ?auto_14751 ) ) ( not ( = ?auto_14750 ?auto_14752 ) ) ( not ( = ?auto_14750 ?auto_14753 ) ) ( not ( = ?auto_14750 ?auto_14754 ) ) ( not ( = ?auto_14750 ?auto_14755 ) ) ( not ( = ?auto_14751 ?auto_14752 ) ) ( not ( = ?auto_14751 ?auto_14753 ) ) ( not ( = ?auto_14751 ?auto_14754 ) ) ( not ( = ?auto_14751 ?auto_14755 ) ) ( not ( = ?auto_14752 ?auto_14753 ) ) ( not ( = ?auto_14752 ?auto_14754 ) ) ( not ( = ?auto_14752 ?auto_14755 ) ) ( not ( = ?auto_14753 ?auto_14754 ) ) ( not ( = ?auto_14753 ?auto_14755 ) ) ( not ( = ?auto_14754 ?auto_14755 ) ) ( CLEAR ?auto_14752 ) ( ON ?auto_14753 ?auto_14754 ) ( CLEAR ?auto_14753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14750 ?auto_14751 ?auto_14752 ?auto_14753 )
      ( MAKE-5PILE ?auto_14750 ?auto_14751 ?auto_14752 ?auto_14753 ?auto_14754 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14761 - BLOCK
      ?auto_14762 - BLOCK
      ?auto_14763 - BLOCK
      ?auto_14764 - BLOCK
      ?auto_14765 - BLOCK
    )
    :vars
    (
      ?auto_14766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14765 ?auto_14766 ) ( ON-TABLE ?auto_14761 ) ( ON ?auto_14762 ?auto_14761 ) ( ON ?auto_14763 ?auto_14762 ) ( not ( = ?auto_14761 ?auto_14762 ) ) ( not ( = ?auto_14761 ?auto_14763 ) ) ( not ( = ?auto_14761 ?auto_14764 ) ) ( not ( = ?auto_14761 ?auto_14765 ) ) ( not ( = ?auto_14761 ?auto_14766 ) ) ( not ( = ?auto_14762 ?auto_14763 ) ) ( not ( = ?auto_14762 ?auto_14764 ) ) ( not ( = ?auto_14762 ?auto_14765 ) ) ( not ( = ?auto_14762 ?auto_14766 ) ) ( not ( = ?auto_14763 ?auto_14764 ) ) ( not ( = ?auto_14763 ?auto_14765 ) ) ( not ( = ?auto_14763 ?auto_14766 ) ) ( not ( = ?auto_14764 ?auto_14765 ) ) ( not ( = ?auto_14764 ?auto_14766 ) ) ( not ( = ?auto_14765 ?auto_14766 ) ) ( CLEAR ?auto_14763 ) ( ON ?auto_14764 ?auto_14765 ) ( CLEAR ?auto_14764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14761 ?auto_14762 ?auto_14763 ?auto_14764 )
      ( MAKE-5PILE ?auto_14761 ?auto_14762 ?auto_14763 ?auto_14764 ?auto_14765 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14772 - BLOCK
      ?auto_14773 - BLOCK
      ?auto_14774 - BLOCK
      ?auto_14775 - BLOCK
      ?auto_14776 - BLOCK
    )
    :vars
    (
      ?auto_14777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14776 ?auto_14777 ) ( ON-TABLE ?auto_14772 ) ( ON ?auto_14773 ?auto_14772 ) ( not ( = ?auto_14772 ?auto_14773 ) ) ( not ( = ?auto_14772 ?auto_14774 ) ) ( not ( = ?auto_14772 ?auto_14775 ) ) ( not ( = ?auto_14772 ?auto_14776 ) ) ( not ( = ?auto_14772 ?auto_14777 ) ) ( not ( = ?auto_14773 ?auto_14774 ) ) ( not ( = ?auto_14773 ?auto_14775 ) ) ( not ( = ?auto_14773 ?auto_14776 ) ) ( not ( = ?auto_14773 ?auto_14777 ) ) ( not ( = ?auto_14774 ?auto_14775 ) ) ( not ( = ?auto_14774 ?auto_14776 ) ) ( not ( = ?auto_14774 ?auto_14777 ) ) ( not ( = ?auto_14775 ?auto_14776 ) ) ( not ( = ?auto_14775 ?auto_14777 ) ) ( not ( = ?auto_14776 ?auto_14777 ) ) ( ON ?auto_14775 ?auto_14776 ) ( CLEAR ?auto_14773 ) ( ON ?auto_14774 ?auto_14775 ) ( CLEAR ?auto_14774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14772 ?auto_14773 ?auto_14774 )
      ( MAKE-5PILE ?auto_14772 ?auto_14773 ?auto_14774 ?auto_14775 ?auto_14776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14783 - BLOCK
      ?auto_14784 - BLOCK
      ?auto_14785 - BLOCK
      ?auto_14786 - BLOCK
      ?auto_14787 - BLOCK
    )
    :vars
    (
      ?auto_14788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14787 ?auto_14788 ) ( ON-TABLE ?auto_14783 ) ( ON ?auto_14784 ?auto_14783 ) ( not ( = ?auto_14783 ?auto_14784 ) ) ( not ( = ?auto_14783 ?auto_14785 ) ) ( not ( = ?auto_14783 ?auto_14786 ) ) ( not ( = ?auto_14783 ?auto_14787 ) ) ( not ( = ?auto_14783 ?auto_14788 ) ) ( not ( = ?auto_14784 ?auto_14785 ) ) ( not ( = ?auto_14784 ?auto_14786 ) ) ( not ( = ?auto_14784 ?auto_14787 ) ) ( not ( = ?auto_14784 ?auto_14788 ) ) ( not ( = ?auto_14785 ?auto_14786 ) ) ( not ( = ?auto_14785 ?auto_14787 ) ) ( not ( = ?auto_14785 ?auto_14788 ) ) ( not ( = ?auto_14786 ?auto_14787 ) ) ( not ( = ?auto_14786 ?auto_14788 ) ) ( not ( = ?auto_14787 ?auto_14788 ) ) ( ON ?auto_14786 ?auto_14787 ) ( CLEAR ?auto_14784 ) ( ON ?auto_14785 ?auto_14786 ) ( CLEAR ?auto_14785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14783 ?auto_14784 ?auto_14785 )
      ( MAKE-5PILE ?auto_14783 ?auto_14784 ?auto_14785 ?auto_14786 ?auto_14787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14794 - BLOCK
      ?auto_14795 - BLOCK
      ?auto_14796 - BLOCK
      ?auto_14797 - BLOCK
      ?auto_14798 - BLOCK
    )
    :vars
    (
      ?auto_14799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14798 ?auto_14799 ) ( ON-TABLE ?auto_14794 ) ( not ( = ?auto_14794 ?auto_14795 ) ) ( not ( = ?auto_14794 ?auto_14796 ) ) ( not ( = ?auto_14794 ?auto_14797 ) ) ( not ( = ?auto_14794 ?auto_14798 ) ) ( not ( = ?auto_14794 ?auto_14799 ) ) ( not ( = ?auto_14795 ?auto_14796 ) ) ( not ( = ?auto_14795 ?auto_14797 ) ) ( not ( = ?auto_14795 ?auto_14798 ) ) ( not ( = ?auto_14795 ?auto_14799 ) ) ( not ( = ?auto_14796 ?auto_14797 ) ) ( not ( = ?auto_14796 ?auto_14798 ) ) ( not ( = ?auto_14796 ?auto_14799 ) ) ( not ( = ?auto_14797 ?auto_14798 ) ) ( not ( = ?auto_14797 ?auto_14799 ) ) ( not ( = ?auto_14798 ?auto_14799 ) ) ( ON ?auto_14797 ?auto_14798 ) ( ON ?auto_14796 ?auto_14797 ) ( CLEAR ?auto_14794 ) ( ON ?auto_14795 ?auto_14796 ) ( CLEAR ?auto_14795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14794 ?auto_14795 )
      ( MAKE-5PILE ?auto_14794 ?auto_14795 ?auto_14796 ?auto_14797 ?auto_14798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14805 - BLOCK
      ?auto_14806 - BLOCK
      ?auto_14807 - BLOCK
      ?auto_14808 - BLOCK
      ?auto_14809 - BLOCK
    )
    :vars
    (
      ?auto_14810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14809 ?auto_14810 ) ( ON-TABLE ?auto_14805 ) ( not ( = ?auto_14805 ?auto_14806 ) ) ( not ( = ?auto_14805 ?auto_14807 ) ) ( not ( = ?auto_14805 ?auto_14808 ) ) ( not ( = ?auto_14805 ?auto_14809 ) ) ( not ( = ?auto_14805 ?auto_14810 ) ) ( not ( = ?auto_14806 ?auto_14807 ) ) ( not ( = ?auto_14806 ?auto_14808 ) ) ( not ( = ?auto_14806 ?auto_14809 ) ) ( not ( = ?auto_14806 ?auto_14810 ) ) ( not ( = ?auto_14807 ?auto_14808 ) ) ( not ( = ?auto_14807 ?auto_14809 ) ) ( not ( = ?auto_14807 ?auto_14810 ) ) ( not ( = ?auto_14808 ?auto_14809 ) ) ( not ( = ?auto_14808 ?auto_14810 ) ) ( not ( = ?auto_14809 ?auto_14810 ) ) ( ON ?auto_14808 ?auto_14809 ) ( ON ?auto_14807 ?auto_14808 ) ( CLEAR ?auto_14805 ) ( ON ?auto_14806 ?auto_14807 ) ( CLEAR ?auto_14806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14805 ?auto_14806 )
      ( MAKE-5PILE ?auto_14805 ?auto_14806 ?auto_14807 ?auto_14808 ?auto_14809 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14816 - BLOCK
      ?auto_14817 - BLOCK
      ?auto_14818 - BLOCK
      ?auto_14819 - BLOCK
      ?auto_14820 - BLOCK
    )
    :vars
    (
      ?auto_14821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14820 ?auto_14821 ) ( not ( = ?auto_14816 ?auto_14817 ) ) ( not ( = ?auto_14816 ?auto_14818 ) ) ( not ( = ?auto_14816 ?auto_14819 ) ) ( not ( = ?auto_14816 ?auto_14820 ) ) ( not ( = ?auto_14816 ?auto_14821 ) ) ( not ( = ?auto_14817 ?auto_14818 ) ) ( not ( = ?auto_14817 ?auto_14819 ) ) ( not ( = ?auto_14817 ?auto_14820 ) ) ( not ( = ?auto_14817 ?auto_14821 ) ) ( not ( = ?auto_14818 ?auto_14819 ) ) ( not ( = ?auto_14818 ?auto_14820 ) ) ( not ( = ?auto_14818 ?auto_14821 ) ) ( not ( = ?auto_14819 ?auto_14820 ) ) ( not ( = ?auto_14819 ?auto_14821 ) ) ( not ( = ?auto_14820 ?auto_14821 ) ) ( ON ?auto_14819 ?auto_14820 ) ( ON ?auto_14818 ?auto_14819 ) ( ON ?auto_14817 ?auto_14818 ) ( ON ?auto_14816 ?auto_14817 ) ( CLEAR ?auto_14816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14816 )
      ( MAKE-5PILE ?auto_14816 ?auto_14817 ?auto_14818 ?auto_14819 ?auto_14820 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_14827 - BLOCK
      ?auto_14828 - BLOCK
      ?auto_14829 - BLOCK
      ?auto_14830 - BLOCK
      ?auto_14831 - BLOCK
    )
    :vars
    (
      ?auto_14832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14831 ?auto_14832 ) ( not ( = ?auto_14827 ?auto_14828 ) ) ( not ( = ?auto_14827 ?auto_14829 ) ) ( not ( = ?auto_14827 ?auto_14830 ) ) ( not ( = ?auto_14827 ?auto_14831 ) ) ( not ( = ?auto_14827 ?auto_14832 ) ) ( not ( = ?auto_14828 ?auto_14829 ) ) ( not ( = ?auto_14828 ?auto_14830 ) ) ( not ( = ?auto_14828 ?auto_14831 ) ) ( not ( = ?auto_14828 ?auto_14832 ) ) ( not ( = ?auto_14829 ?auto_14830 ) ) ( not ( = ?auto_14829 ?auto_14831 ) ) ( not ( = ?auto_14829 ?auto_14832 ) ) ( not ( = ?auto_14830 ?auto_14831 ) ) ( not ( = ?auto_14830 ?auto_14832 ) ) ( not ( = ?auto_14831 ?auto_14832 ) ) ( ON ?auto_14830 ?auto_14831 ) ( ON ?auto_14829 ?auto_14830 ) ( ON ?auto_14828 ?auto_14829 ) ( ON ?auto_14827 ?auto_14828 ) ( CLEAR ?auto_14827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14827 )
      ( MAKE-5PILE ?auto_14827 ?auto_14828 ?auto_14829 ?auto_14830 ?auto_14831 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14839 - BLOCK
      ?auto_14840 - BLOCK
      ?auto_14841 - BLOCK
      ?auto_14842 - BLOCK
      ?auto_14843 - BLOCK
      ?auto_14844 - BLOCK
    )
    :vars
    (
      ?auto_14845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14843 ) ( ON ?auto_14844 ?auto_14845 ) ( CLEAR ?auto_14844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14839 ) ( ON ?auto_14840 ?auto_14839 ) ( ON ?auto_14841 ?auto_14840 ) ( ON ?auto_14842 ?auto_14841 ) ( ON ?auto_14843 ?auto_14842 ) ( not ( = ?auto_14839 ?auto_14840 ) ) ( not ( = ?auto_14839 ?auto_14841 ) ) ( not ( = ?auto_14839 ?auto_14842 ) ) ( not ( = ?auto_14839 ?auto_14843 ) ) ( not ( = ?auto_14839 ?auto_14844 ) ) ( not ( = ?auto_14839 ?auto_14845 ) ) ( not ( = ?auto_14840 ?auto_14841 ) ) ( not ( = ?auto_14840 ?auto_14842 ) ) ( not ( = ?auto_14840 ?auto_14843 ) ) ( not ( = ?auto_14840 ?auto_14844 ) ) ( not ( = ?auto_14840 ?auto_14845 ) ) ( not ( = ?auto_14841 ?auto_14842 ) ) ( not ( = ?auto_14841 ?auto_14843 ) ) ( not ( = ?auto_14841 ?auto_14844 ) ) ( not ( = ?auto_14841 ?auto_14845 ) ) ( not ( = ?auto_14842 ?auto_14843 ) ) ( not ( = ?auto_14842 ?auto_14844 ) ) ( not ( = ?auto_14842 ?auto_14845 ) ) ( not ( = ?auto_14843 ?auto_14844 ) ) ( not ( = ?auto_14843 ?auto_14845 ) ) ( not ( = ?auto_14844 ?auto_14845 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_14844 ?auto_14845 )
      ( !STACK ?auto_14844 ?auto_14843 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14852 - BLOCK
      ?auto_14853 - BLOCK
      ?auto_14854 - BLOCK
      ?auto_14855 - BLOCK
      ?auto_14856 - BLOCK
      ?auto_14857 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_14856 ) ( ON-TABLE ?auto_14857 ) ( CLEAR ?auto_14857 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_14852 ) ( ON ?auto_14853 ?auto_14852 ) ( ON ?auto_14854 ?auto_14853 ) ( ON ?auto_14855 ?auto_14854 ) ( ON ?auto_14856 ?auto_14855 ) ( not ( = ?auto_14852 ?auto_14853 ) ) ( not ( = ?auto_14852 ?auto_14854 ) ) ( not ( = ?auto_14852 ?auto_14855 ) ) ( not ( = ?auto_14852 ?auto_14856 ) ) ( not ( = ?auto_14852 ?auto_14857 ) ) ( not ( = ?auto_14853 ?auto_14854 ) ) ( not ( = ?auto_14853 ?auto_14855 ) ) ( not ( = ?auto_14853 ?auto_14856 ) ) ( not ( = ?auto_14853 ?auto_14857 ) ) ( not ( = ?auto_14854 ?auto_14855 ) ) ( not ( = ?auto_14854 ?auto_14856 ) ) ( not ( = ?auto_14854 ?auto_14857 ) ) ( not ( = ?auto_14855 ?auto_14856 ) ) ( not ( = ?auto_14855 ?auto_14857 ) ) ( not ( = ?auto_14856 ?auto_14857 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_14857 )
      ( !STACK ?auto_14857 ?auto_14856 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14864 - BLOCK
      ?auto_14865 - BLOCK
      ?auto_14866 - BLOCK
      ?auto_14867 - BLOCK
      ?auto_14868 - BLOCK
      ?auto_14869 - BLOCK
    )
    :vars
    (
      ?auto_14870 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14869 ?auto_14870 ) ( ON-TABLE ?auto_14864 ) ( ON ?auto_14865 ?auto_14864 ) ( ON ?auto_14866 ?auto_14865 ) ( ON ?auto_14867 ?auto_14866 ) ( not ( = ?auto_14864 ?auto_14865 ) ) ( not ( = ?auto_14864 ?auto_14866 ) ) ( not ( = ?auto_14864 ?auto_14867 ) ) ( not ( = ?auto_14864 ?auto_14868 ) ) ( not ( = ?auto_14864 ?auto_14869 ) ) ( not ( = ?auto_14864 ?auto_14870 ) ) ( not ( = ?auto_14865 ?auto_14866 ) ) ( not ( = ?auto_14865 ?auto_14867 ) ) ( not ( = ?auto_14865 ?auto_14868 ) ) ( not ( = ?auto_14865 ?auto_14869 ) ) ( not ( = ?auto_14865 ?auto_14870 ) ) ( not ( = ?auto_14866 ?auto_14867 ) ) ( not ( = ?auto_14866 ?auto_14868 ) ) ( not ( = ?auto_14866 ?auto_14869 ) ) ( not ( = ?auto_14866 ?auto_14870 ) ) ( not ( = ?auto_14867 ?auto_14868 ) ) ( not ( = ?auto_14867 ?auto_14869 ) ) ( not ( = ?auto_14867 ?auto_14870 ) ) ( not ( = ?auto_14868 ?auto_14869 ) ) ( not ( = ?auto_14868 ?auto_14870 ) ) ( not ( = ?auto_14869 ?auto_14870 ) ) ( CLEAR ?auto_14867 ) ( ON ?auto_14868 ?auto_14869 ) ( CLEAR ?auto_14868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14864 ?auto_14865 ?auto_14866 ?auto_14867 ?auto_14868 )
      ( MAKE-6PILE ?auto_14864 ?auto_14865 ?auto_14866 ?auto_14867 ?auto_14868 ?auto_14869 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14877 - BLOCK
      ?auto_14878 - BLOCK
      ?auto_14879 - BLOCK
      ?auto_14880 - BLOCK
      ?auto_14881 - BLOCK
      ?auto_14882 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14882 ) ( ON-TABLE ?auto_14877 ) ( ON ?auto_14878 ?auto_14877 ) ( ON ?auto_14879 ?auto_14878 ) ( ON ?auto_14880 ?auto_14879 ) ( not ( = ?auto_14877 ?auto_14878 ) ) ( not ( = ?auto_14877 ?auto_14879 ) ) ( not ( = ?auto_14877 ?auto_14880 ) ) ( not ( = ?auto_14877 ?auto_14881 ) ) ( not ( = ?auto_14877 ?auto_14882 ) ) ( not ( = ?auto_14878 ?auto_14879 ) ) ( not ( = ?auto_14878 ?auto_14880 ) ) ( not ( = ?auto_14878 ?auto_14881 ) ) ( not ( = ?auto_14878 ?auto_14882 ) ) ( not ( = ?auto_14879 ?auto_14880 ) ) ( not ( = ?auto_14879 ?auto_14881 ) ) ( not ( = ?auto_14879 ?auto_14882 ) ) ( not ( = ?auto_14880 ?auto_14881 ) ) ( not ( = ?auto_14880 ?auto_14882 ) ) ( not ( = ?auto_14881 ?auto_14882 ) ) ( CLEAR ?auto_14880 ) ( ON ?auto_14881 ?auto_14882 ) ( CLEAR ?auto_14881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_14877 ?auto_14878 ?auto_14879 ?auto_14880 ?auto_14881 )
      ( MAKE-6PILE ?auto_14877 ?auto_14878 ?auto_14879 ?auto_14880 ?auto_14881 ?auto_14882 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14889 - BLOCK
      ?auto_14890 - BLOCK
      ?auto_14891 - BLOCK
      ?auto_14892 - BLOCK
      ?auto_14893 - BLOCK
      ?auto_14894 - BLOCK
    )
    :vars
    (
      ?auto_14895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14894 ?auto_14895 ) ( ON-TABLE ?auto_14889 ) ( ON ?auto_14890 ?auto_14889 ) ( ON ?auto_14891 ?auto_14890 ) ( not ( = ?auto_14889 ?auto_14890 ) ) ( not ( = ?auto_14889 ?auto_14891 ) ) ( not ( = ?auto_14889 ?auto_14892 ) ) ( not ( = ?auto_14889 ?auto_14893 ) ) ( not ( = ?auto_14889 ?auto_14894 ) ) ( not ( = ?auto_14889 ?auto_14895 ) ) ( not ( = ?auto_14890 ?auto_14891 ) ) ( not ( = ?auto_14890 ?auto_14892 ) ) ( not ( = ?auto_14890 ?auto_14893 ) ) ( not ( = ?auto_14890 ?auto_14894 ) ) ( not ( = ?auto_14890 ?auto_14895 ) ) ( not ( = ?auto_14891 ?auto_14892 ) ) ( not ( = ?auto_14891 ?auto_14893 ) ) ( not ( = ?auto_14891 ?auto_14894 ) ) ( not ( = ?auto_14891 ?auto_14895 ) ) ( not ( = ?auto_14892 ?auto_14893 ) ) ( not ( = ?auto_14892 ?auto_14894 ) ) ( not ( = ?auto_14892 ?auto_14895 ) ) ( not ( = ?auto_14893 ?auto_14894 ) ) ( not ( = ?auto_14893 ?auto_14895 ) ) ( not ( = ?auto_14894 ?auto_14895 ) ) ( ON ?auto_14893 ?auto_14894 ) ( CLEAR ?auto_14891 ) ( ON ?auto_14892 ?auto_14893 ) ( CLEAR ?auto_14892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14889 ?auto_14890 ?auto_14891 ?auto_14892 )
      ( MAKE-6PILE ?auto_14889 ?auto_14890 ?auto_14891 ?auto_14892 ?auto_14893 ?auto_14894 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14902 - BLOCK
      ?auto_14903 - BLOCK
      ?auto_14904 - BLOCK
      ?auto_14905 - BLOCK
      ?auto_14906 - BLOCK
      ?auto_14907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14907 ) ( ON-TABLE ?auto_14902 ) ( ON ?auto_14903 ?auto_14902 ) ( ON ?auto_14904 ?auto_14903 ) ( not ( = ?auto_14902 ?auto_14903 ) ) ( not ( = ?auto_14902 ?auto_14904 ) ) ( not ( = ?auto_14902 ?auto_14905 ) ) ( not ( = ?auto_14902 ?auto_14906 ) ) ( not ( = ?auto_14902 ?auto_14907 ) ) ( not ( = ?auto_14903 ?auto_14904 ) ) ( not ( = ?auto_14903 ?auto_14905 ) ) ( not ( = ?auto_14903 ?auto_14906 ) ) ( not ( = ?auto_14903 ?auto_14907 ) ) ( not ( = ?auto_14904 ?auto_14905 ) ) ( not ( = ?auto_14904 ?auto_14906 ) ) ( not ( = ?auto_14904 ?auto_14907 ) ) ( not ( = ?auto_14905 ?auto_14906 ) ) ( not ( = ?auto_14905 ?auto_14907 ) ) ( not ( = ?auto_14906 ?auto_14907 ) ) ( ON ?auto_14906 ?auto_14907 ) ( CLEAR ?auto_14904 ) ( ON ?auto_14905 ?auto_14906 ) ( CLEAR ?auto_14905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_14902 ?auto_14903 ?auto_14904 ?auto_14905 )
      ( MAKE-6PILE ?auto_14902 ?auto_14903 ?auto_14904 ?auto_14905 ?auto_14906 ?auto_14907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14914 - BLOCK
      ?auto_14915 - BLOCK
      ?auto_14916 - BLOCK
      ?auto_14917 - BLOCK
      ?auto_14918 - BLOCK
      ?auto_14919 - BLOCK
    )
    :vars
    (
      ?auto_14920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14919 ?auto_14920 ) ( ON-TABLE ?auto_14914 ) ( ON ?auto_14915 ?auto_14914 ) ( not ( = ?auto_14914 ?auto_14915 ) ) ( not ( = ?auto_14914 ?auto_14916 ) ) ( not ( = ?auto_14914 ?auto_14917 ) ) ( not ( = ?auto_14914 ?auto_14918 ) ) ( not ( = ?auto_14914 ?auto_14919 ) ) ( not ( = ?auto_14914 ?auto_14920 ) ) ( not ( = ?auto_14915 ?auto_14916 ) ) ( not ( = ?auto_14915 ?auto_14917 ) ) ( not ( = ?auto_14915 ?auto_14918 ) ) ( not ( = ?auto_14915 ?auto_14919 ) ) ( not ( = ?auto_14915 ?auto_14920 ) ) ( not ( = ?auto_14916 ?auto_14917 ) ) ( not ( = ?auto_14916 ?auto_14918 ) ) ( not ( = ?auto_14916 ?auto_14919 ) ) ( not ( = ?auto_14916 ?auto_14920 ) ) ( not ( = ?auto_14917 ?auto_14918 ) ) ( not ( = ?auto_14917 ?auto_14919 ) ) ( not ( = ?auto_14917 ?auto_14920 ) ) ( not ( = ?auto_14918 ?auto_14919 ) ) ( not ( = ?auto_14918 ?auto_14920 ) ) ( not ( = ?auto_14919 ?auto_14920 ) ) ( ON ?auto_14918 ?auto_14919 ) ( ON ?auto_14917 ?auto_14918 ) ( CLEAR ?auto_14915 ) ( ON ?auto_14916 ?auto_14917 ) ( CLEAR ?auto_14916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14914 ?auto_14915 ?auto_14916 )
      ( MAKE-6PILE ?auto_14914 ?auto_14915 ?auto_14916 ?auto_14917 ?auto_14918 ?auto_14919 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14927 - BLOCK
      ?auto_14928 - BLOCK
      ?auto_14929 - BLOCK
      ?auto_14930 - BLOCK
      ?auto_14931 - BLOCK
      ?auto_14932 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14932 ) ( ON-TABLE ?auto_14927 ) ( ON ?auto_14928 ?auto_14927 ) ( not ( = ?auto_14927 ?auto_14928 ) ) ( not ( = ?auto_14927 ?auto_14929 ) ) ( not ( = ?auto_14927 ?auto_14930 ) ) ( not ( = ?auto_14927 ?auto_14931 ) ) ( not ( = ?auto_14927 ?auto_14932 ) ) ( not ( = ?auto_14928 ?auto_14929 ) ) ( not ( = ?auto_14928 ?auto_14930 ) ) ( not ( = ?auto_14928 ?auto_14931 ) ) ( not ( = ?auto_14928 ?auto_14932 ) ) ( not ( = ?auto_14929 ?auto_14930 ) ) ( not ( = ?auto_14929 ?auto_14931 ) ) ( not ( = ?auto_14929 ?auto_14932 ) ) ( not ( = ?auto_14930 ?auto_14931 ) ) ( not ( = ?auto_14930 ?auto_14932 ) ) ( not ( = ?auto_14931 ?auto_14932 ) ) ( ON ?auto_14931 ?auto_14932 ) ( ON ?auto_14930 ?auto_14931 ) ( CLEAR ?auto_14928 ) ( ON ?auto_14929 ?auto_14930 ) ( CLEAR ?auto_14929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_14927 ?auto_14928 ?auto_14929 )
      ( MAKE-6PILE ?auto_14927 ?auto_14928 ?auto_14929 ?auto_14930 ?auto_14931 ?auto_14932 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14939 - BLOCK
      ?auto_14940 - BLOCK
      ?auto_14941 - BLOCK
      ?auto_14942 - BLOCK
      ?auto_14943 - BLOCK
      ?auto_14944 - BLOCK
    )
    :vars
    (
      ?auto_14945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14944 ?auto_14945 ) ( ON-TABLE ?auto_14939 ) ( not ( = ?auto_14939 ?auto_14940 ) ) ( not ( = ?auto_14939 ?auto_14941 ) ) ( not ( = ?auto_14939 ?auto_14942 ) ) ( not ( = ?auto_14939 ?auto_14943 ) ) ( not ( = ?auto_14939 ?auto_14944 ) ) ( not ( = ?auto_14939 ?auto_14945 ) ) ( not ( = ?auto_14940 ?auto_14941 ) ) ( not ( = ?auto_14940 ?auto_14942 ) ) ( not ( = ?auto_14940 ?auto_14943 ) ) ( not ( = ?auto_14940 ?auto_14944 ) ) ( not ( = ?auto_14940 ?auto_14945 ) ) ( not ( = ?auto_14941 ?auto_14942 ) ) ( not ( = ?auto_14941 ?auto_14943 ) ) ( not ( = ?auto_14941 ?auto_14944 ) ) ( not ( = ?auto_14941 ?auto_14945 ) ) ( not ( = ?auto_14942 ?auto_14943 ) ) ( not ( = ?auto_14942 ?auto_14944 ) ) ( not ( = ?auto_14942 ?auto_14945 ) ) ( not ( = ?auto_14943 ?auto_14944 ) ) ( not ( = ?auto_14943 ?auto_14945 ) ) ( not ( = ?auto_14944 ?auto_14945 ) ) ( ON ?auto_14943 ?auto_14944 ) ( ON ?auto_14942 ?auto_14943 ) ( ON ?auto_14941 ?auto_14942 ) ( CLEAR ?auto_14939 ) ( ON ?auto_14940 ?auto_14941 ) ( CLEAR ?auto_14940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14939 ?auto_14940 )
      ( MAKE-6PILE ?auto_14939 ?auto_14940 ?auto_14941 ?auto_14942 ?auto_14943 ?auto_14944 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14952 - BLOCK
      ?auto_14953 - BLOCK
      ?auto_14954 - BLOCK
      ?auto_14955 - BLOCK
      ?auto_14956 - BLOCK
      ?auto_14957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14957 ) ( ON-TABLE ?auto_14952 ) ( not ( = ?auto_14952 ?auto_14953 ) ) ( not ( = ?auto_14952 ?auto_14954 ) ) ( not ( = ?auto_14952 ?auto_14955 ) ) ( not ( = ?auto_14952 ?auto_14956 ) ) ( not ( = ?auto_14952 ?auto_14957 ) ) ( not ( = ?auto_14953 ?auto_14954 ) ) ( not ( = ?auto_14953 ?auto_14955 ) ) ( not ( = ?auto_14953 ?auto_14956 ) ) ( not ( = ?auto_14953 ?auto_14957 ) ) ( not ( = ?auto_14954 ?auto_14955 ) ) ( not ( = ?auto_14954 ?auto_14956 ) ) ( not ( = ?auto_14954 ?auto_14957 ) ) ( not ( = ?auto_14955 ?auto_14956 ) ) ( not ( = ?auto_14955 ?auto_14957 ) ) ( not ( = ?auto_14956 ?auto_14957 ) ) ( ON ?auto_14956 ?auto_14957 ) ( ON ?auto_14955 ?auto_14956 ) ( ON ?auto_14954 ?auto_14955 ) ( CLEAR ?auto_14952 ) ( ON ?auto_14953 ?auto_14954 ) ( CLEAR ?auto_14953 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_14952 ?auto_14953 )
      ( MAKE-6PILE ?auto_14952 ?auto_14953 ?auto_14954 ?auto_14955 ?auto_14956 ?auto_14957 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14964 - BLOCK
      ?auto_14965 - BLOCK
      ?auto_14966 - BLOCK
      ?auto_14967 - BLOCK
      ?auto_14968 - BLOCK
      ?auto_14969 - BLOCK
    )
    :vars
    (
      ?auto_14970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14969 ?auto_14970 ) ( not ( = ?auto_14964 ?auto_14965 ) ) ( not ( = ?auto_14964 ?auto_14966 ) ) ( not ( = ?auto_14964 ?auto_14967 ) ) ( not ( = ?auto_14964 ?auto_14968 ) ) ( not ( = ?auto_14964 ?auto_14969 ) ) ( not ( = ?auto_14964 ?auto_14970 ) ) ( not ( = ?auto_14965 ?auto_14966 ) ) ( not ( = ?auto_14965 ?auto_14967 ) ) ( not ( = ?auto_14965 ?auto_14968 ) ) ( not ( = ?auto_14965 ?auto_14969 ) ) ( not ( = ?auto_14965 ?auto_14970 ) ) ( not ( = ?auto_14966 ?auto_14967 ) ) ( not ( = ?auto_14966 ?auto_14968 ) ) ( not ( = ?auto_14966 ?auto_14969 ) ) ( not ( = ?auto_14966 ?auto_14970 ) ) ( not ( = ?auto_14967 ?auto_14968 ) ) ( not ( = ?auto_14967 ?auto_14969 ) ) ( not ( = ?auto_14967 ?auto_14970 ) ) ( not ( = ?auto_14968 ?auto_14969 ) ) ( not ( = ?auto_14968 ?auto_14970 ) ) ( not ( = ?auto_14969 ?auto_14970 ) ) ( ON ?auto_14968 ?auto_14969 ) ( ON ?auto_14967 ?auto_14968 ) ( ON ?auto_14966 ?auto_14967 ) ( ON ?auto_14965 ?auto_14966 ) ( ON ?auto_14964 ?auto_14965 ) ( CLEAR ?auto_14964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14964 )
      ( MAKE-6PILE ?auto_14964 ?auto_14965 ?auto_14966 ?auto_14967 ?auto_14968 ?auto_14969 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14977 - BLOCK
      ?auto_14978 - BLOCK
      ?auto_14979 - BLOCK
      ?auto_14980 - BLOCK
      ?auto_14981 - BLOCK
      ?auto_14982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_14982 ) ( not ( = ?auto_14977 ?auto_14978 ) ) ( not ( = ?auto_14977 ?auto_14979 ) ) ( not ( = ?auto_14977 ?auto_14980 ) ) ( not ( = ?auto_14977 ?auto_14981 ) ) ( not ( = ?auto_14977 ?auto_14982 ) ) ( not ( = ?auto_14978 ?auto_14979 ) ) ( not ( = ?auto_14978 ?auto_14980 ) ) ( not ( = ?auto_14978 ?auto_14981 ) ) ( not ( = ?auto_14978 ?auto_14982 ) ) ( not ( = ?auto_14979 ?auto_14980 ) ) ( not ( = ?auto_14979 ?auto_14981 ) ) ( not ( = ?auto_14979 ?auto_14982 ) ) ( not ( = ?auto_14980 ?auto_14981 ) ) ( not ( = ?auto_14980 ?auto_14982 ) ) ( not ( = ?auto_14981 ?auto_14982 ) ) ( ON ?auto_14981 ?auto_14982 ) ( ON ?auto_14980 ?auto_14981 ) ( ON ?auto_14979 ?auto_14980 ) ( ON ?auto_14978 ?auto_14979 ) ( ON ?auto_14977 ?auto_14978 ) ( CLEAR ?auto_14977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_14977 )
      ( MAKE-6PILE ?auto_14977 ?auto_14978 ?auto_14979 ?auto_14980 ?auto_14981 ?auto_14982 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_14989 - BLOCK
      ?auto_14990 - BLOCK
      ?auto_14991 - BLOCK
      ?auto_14992 - BLOCK
      ?auto_14993 - BLOCK
      ?auto_14994 - BLOCK
    )
    :vars
    (
      ?auto_14995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_14989 ?auto_14990 ) ) ( not ( = ?auto_14989 ?auto_14991 ) ) ( not ( = ?auto_14989 ?auto_14992 ) ) ( not ( = ?auto_14989 ?auto_14993 ) ) ( not ( = ?auto_14989 ?auto_14994 ) ) ( not ( = ?auto_14990 ?auto_14991 ) ) ( not ( = ?auto_14990 ?auto_14992 ) ) ( not ( = ?auto_14990 ?auto_14993 ) ) ( not ( = ?auto_14990 ?auto_14994 ) ) ( not ( = ?auto_14991 ?auto_14992 ) ) ( not ( = ?auto_14991 ?auto_14993 ) ) ( not ( = ?auto_14991 ?auto_14994 ) ) ( not ( = ?auto_14992 ?auto_14993 ) ) ( not ( = ?auto_14992 ?auto_14994 ) ) ( not ( = ?auto_14993 ?auto_14994 ) ) ( ON ?auto_14989 ?auto_14995 ) ( not ( = ?auto_14994 ?auto_14995 ) ) ( not ( = ?auto_14993 ?auto_14995 ) ) ( not ( = ?auto_14992 ?auto_14995 ) ) ( not ( = ?auto_14991 ?auto_14995 ) ) ( not ( = ?auto_14990 ?auto_14995 ) ) ( not ( = ?auto_14989 ?auto_14995 ) ) ( ON ?auto_14990 ?auto_14989 ) ( ON ?auto_14991 ?auto_14990 ) ( ON ?auto_14992 ?auto_14991 ) ( ON ?auto_14993 ?auto_14992 ) ( ON ?auto_14994 ?auto_14993 ) ( CLEAR ?auto_14994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_14994 ?auto_14993 ?auto_14992 ?auto_14991 ?auto_14990 ?auto_14989 )
      ( MAKE-6PILE ?auto_14989 ?auto_14990 ?auto_14991 ?auto_14992 ?auto_14993 ?auto_14994 ) )
  )

)

