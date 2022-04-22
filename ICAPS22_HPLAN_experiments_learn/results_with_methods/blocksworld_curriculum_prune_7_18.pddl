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
      ?auto_29533 - BLOCK
    )
    :vars
    (
      ?auto_29534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29533 ?auto_29534 ) ( CLEAR ?auto_29533 ) ( HAND-EMPTY ) ( not ( = ?auto_29533 ?auto_29534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29533 ?auto_29534 )
      ( !PUTDOWN ?auto_29533 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29540 - BLOCK
      ?auto_29541 - BLOCK
    )
    :vars
    (
      ?auto_29542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29540 ) ( ON ?auto_29541 ?auto_29542 ) ( CLEAR ?auto_29541 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29540 ) ( not ( = ?auto_29540 ?auto_29541 ) ) ( not ( = ?auto_29540 ?auto_29542 ) ) ( not ( = ?auto_29541 ?auto_29542 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29541 ?auto_29542 )
      ( !STACK ?auto_29541 ?auto_29540 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29550 - BLOCK
      ?auto_29551 - BLOCK
    )
    :vars
    (
      ?auto_29552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29551 ?auto_29552 ) ( not ( = ?auto_29550 ?auto_29551 ) ) ( not ( = ?auto_29550 ?auto_29552 ) ) ( not ( = ?auto_29551 ?auto_29552 ) ) ( ON ?auto_29550 ?auto_29551 ) ( CLEAR ?auto_29550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29550 )
      ( MAKE-2PILE ?auto_29550 ?auto_29551 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29561 - BLOCK
      ?auto_29562 - BLOCK
      ?auto_29563 - BLOCK
    )
    :vars
    (
      ?auto_29564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29562 ) ( ON ?auto_29563 ?auto_29564 ) ( CLEAR ?auto_29563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29561 ) ( ON ?auto_29562 ?auto_29561 ) ( not ( = ?auto_29561 ?auto_29562 ) ) ( not ( = ?auto_29561 ?auto_29563 ) ) ( not ( = ?auto_29561 ?auto_29564 ) ) ( not ( = ?auto_29562 ?auto_29563 ) ) ( not ( = ?auto_29562 ?auto_29564 ) ) ( not ( = ?auto_29563 ?auto_29564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29563 ?auto_29564 )
      ( !STACK ?auto_29563 ?auto_29562 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29575 - BLOCK
      ?auto_29576 - BLOCK
      ?auto_29577 - BLOCK
    )
    :vars
    (
      ?auto_29578 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29577 ?auto_29578 ) ( ON-TABLE ?auto_29575 ) ( not ( = ?auto_29575 ?auto_29576 ) ) ( not ( = ?auto_29575 ?auto_29577 ) ) ( not ( = ?auto_29575 ?auto_29578 ) ) ( not ( = ?auto_29576 ?auto_29577 ) ) ( not ( = ?auto_29576 ?auto_29578 ) ) ( not ( = ?auto_29577 ?auto_29578 ) ) ( CLEAR ?auto_29575 ) ( ON ?auto_29576 ?auto_29577 ) ( CLEAR ?auto_29576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29575 ?auto_29576 )
      ( MAKE-3PILE ?auto_29575 ?auto_29576 ?auto_29577 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29589 - BLOCK
      ?auto_29590 - BLOCK
      ?auto_29591 - BLOCK
    )
    :vars
    (
      ?auto_29592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29591 ?auto_29592 ) ( not ( = ?auto_29589 ?auto_29590 ) ) ( not ( = ?auto_29589 ?auto_29591 ) ) ( not ( = ?auto_29589 ?auto_29592 ) ) ( not ( = ?auto_29590 ?auto_29591 ) ) ( not ( = ?auto_29590 ?auto_29592 ) ) ( not ( = ?auto_29591 ?auto_29592 ) ) ( ON ?auto_29590 ?auto_29591 ) ( ON ?auto_29589 ?auto_29590 ) ( CLEAR ?auto_29589 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29589 )
      ( MAKE-3PILE ?auto_29589 ?auto_29590 ?auto_29591 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29604 - BLOCK
      ?auto_29605 - BLOCK
      ?auto_29606 - BLOCK
      ?auto_29607 - BLOCK
    )
    :vars
    (
      ?auto_29608 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29606 ) ( ON ?auto_29607 ?auto_29608 ) ( CLEAR ?auto_29607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29604 ) ( ON ?auto_29605 ?auto_29604 ) ( ON ?auto_29606 ?auto_29605 ) ( not ( = ?auto_29604 ?auto_29605 ) ) ( not ( = ?auto_29604 ?auto_29606 ) ) ( not ( = ?auto_29604 ?auto_29607 ) ) ( not ( = ?auto_29604 ?auto_29608 ) ) ( not ( = ?auto_29605 ?auto_29606 ) ) ( not ( = ?auto_29605 ?auto_29607 ) ) ( not ( = ?auto_29605 ?auto_29608 ) ) ( not ( = ?auto_29606 ?auto_29607 ) ) ( not ( = ?auto_29606 ?auto_29608 ) ) ( not ( = ?auto_29607 ?auto_29608 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29607 ?auto_29608 )
      ( !STACK ?auto_29607 ?auto_29606 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29622 - BLOCK
      ?auto_29623 - BLOCK
      ?auto_29624 - BLOCK
      ?auto_29625 - BLOCK
    )
    :vars
    (
      ?auto_29626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29625 ?auto_29626 ) ( ON-TABLE ?auto_29622 ) ( ON ?auto_29623 ?auto_29622 ) ( not ( = ?auto_29622 ?auto_29623 ) ) ( not ( = ?auto_29622 ?auto_29624 ) ) ( not ( = ?auto_29622 ?auto_29625 ) ) ( not ( = ?auto_29622 ?auto_29626 ) ) ( not ( = ?auto_29623 ?auto_29624 ) ) ( not ( = ?auto_29623 ?auto_29625 ) ) ( not ( = ?auto_29623 ?auto_29626 ) ) ( not ( = ?auto_29624 ?auto_29625 ) ) ( not ( = ?auto_29624 ?auto_29626 ) ) ( not ( = ?auto_29625 ?auto_29626 ) ) ( CLEAR ?auto_29623 ) ( ON ?auto_29624 ?auto_29625 ) ( CLEAR ?auto_29624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29622 ?auto_29623 ?auto_29624 )
      ( MAKE-4PILE ?auto_29622 ?auto_29623 ?auto_29624 ?auto_29625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29640 - BLOCK
      ?auto_29641 - BLOCK
      ?auto_29642 - BLOCK
      ?auto_29643 - BLOCK
    )
    :vars
    (
      ?auto_29644 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29643 ?auto_29644 ) ( ON-TABLE ?auto_29640 ) ( not ( = ?auto_29640 ?auto_29641 ) ) ( not ( = ?auto_29640 ?auto_29642 ) ) ( not ( = ?auto_29640 ?auto_29643 ) ) ( not ( = ?auto_29640 ?auto_29644 ) ) ( not ( = ?auto_29641 ?auto_29642 ) ) ( not ( = ?auto_29641 ?auto_29643 ) ) ( not ( = ?auto_29641 ?auto_29644 ) ) ( not ( = ?auto_29642 ?auto_29643 ) ) ( not ( = ?auto_29642 ?auto_29644 ) ) ( not ( = ?auto_29643 ?auto_29644 ) ) ( ON ?auto_29642 ?auto_29643 ) ( CLEAR ?auto_29640 ) ( ON ?auto_29641 ?auto_29642 ) ( CLEAR ?auto_29641 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29640 ?auto_29641 )
      ( MAKE-4PILE ?auto_29640 ?auto_29641 ?auto_29642 ?auto_29643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29658 - BLOCK
      ?auto_29659 - BLOCK
      ?auto_29660 - BLOCK
      ?auto_29661 - BLOCK
    )
    :vars
    (
      ?auto_29662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29661 ?auto_29662 ) ( not ( = ?auto_29658 ?auto_29659 ) ) ( not ( = ?auto_29658 ?auto_29660 ) ) ( not ( = ?auto_29658 ?auto_29661 ) ) ( not ( = ?auto_29658 ?auto_29662 ) ) ( not ( = ?auto_29659 ?auto_29660 ) ) ( not ( = ?auto_29659 ?auto_29661 ) ) ( not ( = ?auto_29659 ?auto_29662 ) ) ( not ( = ?auto_29660 ?auto_29661 ) ) ( not ( = ?auto_29660 ?auto_29662 ) ) ( not ( = ?auto_29661 ?auto_29662 ) ) ( ON ?auto_29660 ?auto_29661 ) ( ON ?auto_29659 ?auto_29660 ) ( ON ?auto_29658 ?auto_29659 ) ( CLEAR ?auto_29658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29658 )
      ( MAKE-4PILE ?auto_29658 ?auto_29659 ?auto_29660 ?auto_29661 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29677 - BLOCK
      ?auto_29678 - BLOCK
      ?auto_29679 - BLOCK
      ?auto_29680 - BLOCK
      ?auto_29681 - BLOCK
    )
    :vars
    (
      ?auto_29682 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29680 ) ( ON ?auto_29681 ?auto_29682 ) ( CLEAR ?auto_29681 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29677 ) ( ON ?auto_29678 ?auto_29677 ) ( ON ?auto_29679 ?auto_29678 ) ( ON ?auto_29680 ?auto_29679 ) ( not ( = ?auto_29677 ?auto_29678 ) ) ( not ( = ?auto_29677 ?auto_29679 ) ) ( not ( = ?auto_29677 ?auto_29680 ) ) ( not ( = ?auto_29677 ?auto_29681 ) ) ( not ( = ?auto_29677 ?auto_29682 ) ) ( not ( = ?auto_29678 ?auto_29679 ) ) ( not ( = ?auto_29678 ?auto_29680 ) ) ( not ( = ?auto_29678 ?auto_29681 ) ) ( not ( = ?auto_29678 ?auto_29682 ) ) ( not ( = ?auto_29679 ?auto_29680 ) ) ( not ( = ?auto_29679 ?auto_29681 ) ) ( not ( = ?auto_29679 ?auto_29682 ) ) ( not ( = ?auto_29680 ?auto_29681 ) ) ( not ( = ?auto_29680 ?auto_29682 ) ) ( not ( = ?auto_29681 ?auto_29682 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29681 ?auto_29682 )
      ( !STACK ?auto_29681 ?auto_29680 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29699 - BLOCK
      ?auto_29700 - BLOCK
      ?auto_29701 - BLOCK
      ?auto_29702 - BLOCK
      ?auto_29703 - BLOCK
    )
    :vars
    (
      ?auto_29704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29703 ?auto_29704 ) ( ON-TABLE ?auto_29699 ) ( ON ?auto_29700 ?auto_29699 ) ( ON ?auto_29701 ?auto_29700 ) ( not ( = ?auto_29699 ?auto_29700 ) ) ( not ( = ?auto_29699 ?auto_29701 ) ) ( not ( = ?auto_29699 ?auto_29702 ) ) ( not ( = ?auto_29699 ?auto_29703 ) ) ( not ( = ?auto_29699 ?auto_29704 ) ) ( not ( = ?auto_29700 ?auto_29701 ) ) ( not ( = ?auto_29700 ?auto_29702 ) ) ( not ( = ?auto_29700 ?auto_29703 ) ) ( not ( = ?auto_29700 ?auto_29704 ) ) ( not ( = ?auto_29701 ?auto_29702 ) ) ( not ( = ?auto_29701 ?auto_29703 ) ) ( not ( = ?auto_29701 ?auto_29704 ) ) ( not ( = ?auto_29702 ?auto_29703 ) ) ( not ( = ?auto_29702 ?auto_29704 ) ) ( not ( = ?auto_29703 ?auto_29704 ) ) ( CLEAR ?auto_29701 ) ( ON ?auto_29702 ?auto_29703 ) ( CLEAR ?auto_29702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29699 ?auto_29700 ?auto_29701 ?auto_29702 )
      ( MAKE-5PILE ?auto_29699 ?auto_29700 ?auto_29701 ?auto_29702 ?auto_29703 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29721 - BLOCK
      ?auto_29722 - BLOCK
      ?auto_29723 - BLOCK
      ?auto_29724 - BLOCK
      ?auto_29725 - BLOCK
    )
    :vars
    (
      ?auto_29726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29725 ?auto_29726 ) ( ON-TABLE ?auto_29721 ) ( ON ?auto_29722 ?auto_29721 ) ( not ( = ?auto_29721 ?auto_29722 ) ) ( not ( = ?auto_29721 ?auto_29723 ) ) ( not ( = ?auto_29721 ?auto_29724 ) ) ( not ( = ?auto_29721 ?auto_29725 ) ) ( not ( = ?auto_29721 ?auto_29726 ) ) ( not ( = ?auto_29722 ?auto_29723 ) ) ( not ( = ?auto_29722 ?auto_29724 ) ) ( not ( = ?auto_29722 ?auto_29725 ) ) ( not ( = ?auto_29722 ?auto_29726 ) ) ( not ( = ?auto_29723 ?auto_29724 ) ) ( not ( = ?auto_29723 ?auto_29725 ) ) ( not ( = ?auto_29723 ?auto_29726 ) ) ( not ( = ?auto_29724 ?auto_29725 ) ) ( not ( = ?auto_29724 ?auto_29726 ) ) ( not ( = ?auto_29725 ?auto_29726 ) ) ( ON ?auto_29724 ?auto_29725 ) ( CLEAR ?auto_29722 ) ( ON ?auto_29723 ?auto_29724 ) ( CLEAR ?auto_29723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29721 ?auto_29722 ?auto_29723 )
      ( MAKE-5PILE ?auto_29721 ?auto_29722 ?auto_29723 ?auto_29724 ?auto_29725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29743 - BLOCK
      ?auto_29744 - BLOCK
      ?auto_29745 - BLOCK
      ?auto_29746 - BLOCK
      ?auto_29747 - BLOCK
    )
    :vars
    (
      ?auto_29748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29747 ?auto_29748 ) ( ON-TABLE ?auto_29743 ) ( not ( = ?auto_29743 ?auto_29744 ) ) ( not ( = ?auto_29743 ?auto_29745 ) ) ( not ( = ?auto_29743 ?auto_29746 ) ) ( not ( = ?auto_29743 ?auto_29747 ) ) ( not ( = ?auto_29743 ?auto_29748 ) ) ( not ( = ?auto_29744 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29746 ) ) ( not ( = ?auto_29744 ?auto_29747 ) ) ( not ( = ?auto_29744 ?auto_29748 ) ) ( not ( = ?auto_29745 ?auto_29746 ) ) ( not ( = ?auto_29745 ?auto_29747 ) ) ( not ( = ?auto_29745 ?auto_29748 ) ) ( not ( = ?auto_29746 ?auto_29747 ) ) ( not ( = ?auto_29746 ?auto_29748 ) ) ( not ( = ?auto_29747 ?auto_29748 ) ) ( ON ?auto_29746 ?auto_29747 ) ( ON ?auto_29745 ?auto_29746 ) ( CLEAR ?auto_29743 ) ( ON ?auto_29744 ?auto_29745 ) ( CLEAR ?auto_29744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29743 ?auto_29744 )
      ( MAKE-5PILE ?auto_29743 ?auto_29744 ?auto_29745 ?auto_29746 ?auto_29747 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29765 - BLOCK
      ?auto_29766 - BLOCK
      ?auto_29767 - BLOCK
      ?auto_29768 - BLOCK
      ?auto_29769 - BLOCK
    )
    :vars
    (
      ?auto_29770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29769 ?auto_29770 ) ( not ( = ?auto_29765 ?auto_29766 ) ) ( not ( = ?auto_29765 ?auto_29767 ) ) ( not ( = ?auto_29765 ?auto_29768 ) ) ( not ( = ?auto_29765 ?auto_29769 ) ) ( not ( = ?auto_29765 ?auto_29770 ) ) ( not ( = ?auto_29766 ?auto_29767 ) ) ( not ( = ?auto_29766 ?auto_29768 ) ) ( not ( = ?auto_29766 ?auto_29769 ) ) ( not ( = ?auto_29766 ?auto_29770 ) ) ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) ( ON ?auto_29768 ?auto_29769 ) ( ON ?auto_29767 ?auto_29768 ) ( ON ?auto_29766 ?auto_29767 ) ( ON ?auto_29765 ?auto_29766 ) ( CLEAR ?auto_29765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29765 )
      ( MAKE-5PILE ?auto_29765 ?auto_29766 ?auto_29767 ?auto_29768 ?auto_29769 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29788 - BLOCK
      ?auto_29789 - BLOCK
      ?auto_29790 - BLOCK
      ?auto_29791 - BLOCK
      ?auto_29792 - BLOCK
      ?auto_29793 - BLOCK
    )
    :vars
    (
      ?auto_29794 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29792 ) ( ON ?auto_29793 ?auto_29794 ) ( CLEAR ?auto_29793 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29788 ) ( ON ?auto_29789 ?auto_29788 ) ( ON ?auto_29790 ?auto_29789 ) ( ON ?auto_29791 ?auto_29790 ) ( ON ?auto_29792 ?auto_29791 ) ( not ( = ?auto_29788 ?auto_29789 ) ) ( not ( = ?auto_29788 ?auto_29790 ) ) ( not ( = ?auto_29788 ?auto_29791 ) ) ( not ( = ?auto_29788 ?auto_29792 ) ) ( not ( = ?auto_29788 ?auto_29793 ) ) ( not ( = ?auto_29788 ?auto_29794 ) ) ( not ( = ?auto_29789 ?auto_29790 ) ) ( not ( = ?auto_29789 ?auto_29791 ) ) ( not ( = ?auto_29789 ?auto_29792 ) ) ( not ( = ?auto_29789 ?auto_29793 ) ) ( not ( = ?auto_29789 ?auto_29794 ) ) ( not ( = ?auto_29790 ?auto_29791 ) ) ( not ( = ?auto_29790 ?auto_29792 ) ) ( not ( = ?auto_29790 ?auto_29793 ) ) ( not ( = ?auto_29790 ?auto_29794 ) ) ( not ( = ?auto_29791 ?auto_29792 ) ) ( not ( = ?auto_29791 ?auto_29793 ) ) ( not ( = ?auto_29791 ?auto_29794 ) ) ( not ( = ?auto_29792 ?auto_29793 ) ) ( not ( = ?auto_29792 ?auto_29794 ) ) ( not ( = ?auto_29793 ?auto_29794 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29793 ?auto_29794 )
      ( !STACK ?auto_29793 ?auto_29792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29814 - BLOCK
      ?auto_29815 - BLOCK
      ?auto_29816 - BLOCK
      ?auto_29817 - BLOCK
      ?auto_29818 - BLOCK
      ?auto_29819 - BLOCK
    )
    :vars
    (
      ?auto_29820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29819 ?auto_29820 ) ( ON-TABLE ?auto_29814 ) ( ON ?auto_29815 ?auto_29814 ) ( ON ?auto_29816 ?auto_29815 ) ( ON ?auto_29817 ?auto_29816 ) ( not ( = ?auto_29814 ?auto_29815 ) ) ( not ( = ?auto_29814 ?auto_29816 ) ) ( not ( = ?auto_29814 ?auto_29817 ) ) ( not ( = ?auto_29814 ?auto_29818 ) ) ( not ( = ?auto_29814 ?auto_29819 ) ) ( not ( = ?auto_29814 ?auto_29820 ) ) ( not ( = ?auto_29815 ?auto_29816 ) ) ( not ( = ?auto_29815 ?auto_29817 ) ) ( not ( = ?auto_29815 ?auto_29818 ) ) ( not ( = ?auto_29815 ?auto_29819 ) ) ( not ( = ?auto_29815 ?auto_29820 ) ) ( not ( = ?auto_29816 ?auto_29817 ) ) ( not ( = ?auto_29816 ?auto_29818 ) ) ( not ( = ?auto_29816 ?auto_29819 ) ) ( not ( = ?auto_29816 ?auto_29820 ) ) ( not ( = ?auto_29817 ?auto_29818 ) ) ( not ( = ?auto_29817 ?auto_29819 ) ) ( not ( = ?auto_29817 ?auto_29820 ) ) ( not ( = ?auto_29818 ?auto_29819 ) ) ( not ( = ?auto_29818 ?auto_29820 ) ) ( not ( = ?auto_29819 ?auto_29820 ) ) ( CLEAR ?auto_29817 ) ( ON ?auto_29818 ?auto_29819 ) ( CLEAR ?auto_29818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29814 ?auto_29815 ?auto_29816 ?auto_29817 ?auto_29818 )
      ( MAKE-6PILE ?auto_29814 ?auto_29815 ?auto_29816 ?auto_29817 ?auto_29818 ?auto_29819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29840 - BLOCK
      ?auto_29841 - BLOCK
      ?auto_29842 - BLOCK
      ?auto_29843 - BLOCK
      ?auto_29844 - BLOCK
      ?auto_29845 - BLOCK
    )
    :vars
    (
      ?auto_29846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29845 ?auto_29846 ) ( ON-TABLE ?auto_29840 ) ( ON ?auto_29841 ?auto_29840 ) ( ON ?auto_29842 ?auto_29841 ) ( not ( = ?auto_29840 ?auto_29841 ) ) ( not ( = ?auto_29840 ?auto_29842 ) ) ( not ( = ?auto_29840 ?auto_29843 ) ) ( not ( = ?auto_29840 ?auto_29844 ) ) ( not ( = ?auto_29840 ?auto_29845 ) ) ( not ( = ?auto_29840 ?auto_29846 ) ) ( not ( = ?auto_29841 ?auto_29842 ) ) ( not ( = ?auto_29841 ?auto_29843 ) ) ( not ( = ?auto_29841 ?auto_29844 ) ) ( not ( = ?auto_29841 ?auto_29845 ) ) ( not ( = ?auto_29841 ?auto_29846 ) ) ( not ( = ?auto_29842 ?auto_29843 ) ) ( not ( = ?auto_29842 ?auto_29844 ) ) ( not ( = ?auto_29842 ?auto_29845 ) ) ( not ( = ?auto_29842 ?auto_29846 ) ) ( not ( = ?auto_29843 ?auto_29844 ) ) ( not ( = ?auto_29843 ?auto_29845 ) ) ( not ( = ?auto_29843 ?auto_29846 ) ) ( not ( = ?auto_29844 ?auto_29845 ) ) ( not ( = ?auto_29844 ?auto_29846 ) ) ( not ( = ?auto_29845 ?auto_29846 ) ) ( ON ?auto_29844 ?auto_29845 ) ( CLEAR ?auto_29842 ) ( ON ?auto_29843 ?auto_29844 ) ( CLEAR ?auto_29843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29840 ?auto_29841 ?auto_29842 ?auto_29843 )
      ( MAKE-6PILE ?auto_29840 ?auto_29841 ?auto_29842 ?auto_29843 ?auto_29844 ?auto_29845 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29866 - BLOCK
      ?auto_29867 - BLOCK
      ?auto_29868 - BLOCK
      ?auto_29869 - BLOCK
      ?auto_29870 - BLOCK
      ?auto_29871 - BLOCK
    )
    :vars
    (
      ?auto_29872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29871 ?auto_29872 ) ( ON-TABLE ?auto_29866 ) ( ON ?auto_29867 ?auto_29866 ) ( not ( = ?auto_29866 ?auto_29867 ) ) ( not ( = ?auto_29866 ?auto_29868 ) ) ( not ( = ?auto_29866 ?auto_29869 ) ) ( not ( = ?auto_29866 ?auto_29870 ) ) ( not ( = ?auto_29866 ?auto_29871 ) ) ( not ( = ?auto_29866 ?auto_29872 ) ) ( not ( = ?auto_29867 ?auto_29868 ) ) ( not ( = ?auto_29867 ?auto_29869 ) ) ( not ( = ?auto_29867 ?auto_29870 ) ) ( not ( = ?auto_29867 ?auto_29871 ) ) ( not ( = ?auto_29867 ?auto_29872 ) ) ( not ( = ?auto_29868 ?auto_29869 ) ) ( not ( = ?auto_29868 ?auto_29870 ) ) ( not ( = ?auto_29868 ?auto_29871 ) ) ( not ( = ?auto_29868 ?auto_29872 ) ) ( not ( = ?auto_29869 ?auto_29870 ) ) ( not ( = ?auto_29869 ?auto_29871 ) ) ( not ( = ?auto_29869 ?auto_29872 ) ) ( not ( = ?auto_29870 ?auto_29871 ) ) ( not ( = ?auto_29870 ?auto_29872 ) ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( ON ?auto_29870 ?auto_29871 ) ( ON ?auto_29869 ?auto_29870 ) ( CLEAR ?auto_29867 ) ( ON ?auto_29868 ?auto_29869 ) ( CLEAR ?auto_29868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29866 ?auto_29867 ?auto_29868 )
      ( MAKE-6PILE ?auto_29866 ?auto_29867 ?auto_29868 ?auto_29869 ?auto_29870 ?auto_29871 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29892 - BLOCK
      ?auto_29893 - BLOCK
      ?auto_29894 - BLOCK
      ?auto_29895 - BLOCK
      ?auto_29896 - BLOCK
      ?auto_29897 - BLOCK
    )
    :vars
    (
      ?auto_29898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29897 ?auto_29898 ) ( ON-TABLE ?auto_29892 ) ( not ( = ?auto_29892 ?auto_29893 ) ) ( not ( = ?auto_29892 ?auto_29894 ) ) ( not ( = ?auto_29892 ?auto_29895 ) ) ( not ( = ?auto_29892 ?auto_29896 ) ) ( not ( = ?auto_29892 ?auto_29897 ) ) ( not ( = ?auto_29892 ?auto_29898 ) ) ( not ( = ?auto_29893 ?auto_29894 ) ) ( not ( = ?auto_29893 ?auto_29895 ) ) ( not ( = ?auto_29893 ?auto_29896 ) ) ( not ( = ?auto_29893 ?auto_29897 ) ) ( not ( = ?auto_29893 ?auto_29898 ) ) ( not ( = ?auto_29894 ?auto_29895 ) ) ( not ( = ?auto_29894 ?auto_29896 ) ) ( not ( = ?auto_29894 ?auto_29897 ) ) ( not ( = ?auto_29894 ?auto_29898 ) ) ( not ( = ?auto_29895 ?auto_29896 ) ) ( not ( = ?auto_29895 ?auto_29897 ) ) ( not ( = ?auto_29895 ?auto_29898 ) ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29898 ) ) ( not ( = ?auto_29897 ?auto_29898 ) ) ( ON ?auto_29896 ?auto_29897 ) ( ON ?auto_29895 ?auto_29896 ) ( ON ?auto_29894 ?auto_29895 ) ( CLEAR ?auto_29892 ) ( ON ?auto_29893 ?auto_29894 ) ( CLEAR ?auto_29893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29892 ?auto_29893 )
      ( MAKE-6PILE ?auto_29892 ?auto_29893 ?auto_29894 ?auto_29895 ?auto_29896 ?auto_29897 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_29918 - BLOCK
      ?auto_29919 - BLOCK
      ?auto_29920 - BLOCK
      ?auto_29921 - BLOCK
      ?auto_29922 - BLOCK
      ?auto_29923 - BLOCK
    )
    :vars
    (
      ?auto_29924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29923 ?auto_29924 ) ( not ( = ?auto_29918 ?auto_29919 ) ) ( not ( = ?auto_29918 ?auto_29920 ) ) ( not ( = ?auto_29918 ?auto_29921 ) ) ( not ( = ?auto_29918 ?auto_29922 ) ) ( not ( = ?auto_29918 ?auto_29923 ) ) ( not ( = ?auto_29918 ?auto_29924 ) ) ( not ( = ?auto_29919 ?auto_29920 ) ) ( not ( = ?auto_29919 ?auto_29921 ) ) ( not ( = ?auto_29919 ?auto_29922 ) ) ( not ( = ?auto_29919 ?auto_29923 ) ) ( not ( = ?auto_29919 ?auto_29924 ) ) ( not ( = ?auto_29920 ?auto_29921 ) ) ( not ( = ?auto_29920 ?auto_29922 ) ) ( not ( = ?auto_29920 ?auto_29923 ) ) ( not ( = ?auto_29920 ?auto_29924 ) ) ( not ( = ?auto_29921 ?auto_29922 ) ) ( not ( = ?auto_29921 ?auto_29923 ) ) ( not ( = ?auto_29921 ?auto_29924 ) ) ( not ( = ?auto_29922 ?auto_29923 ) ) ( not ( = ?auto_29922 ?auto_29924 ) ) ( not ( = ?auto_29923 ?auto_29924 ) ) ( ON ?auto_29922 ?auto_29923 ) ( ON ?auto_29921 ?auto_29922 ) ( ON ?auto_29920 ?auto_29921 ) ( ON ?auto_29919 ?auto_29920 ) ( ON ?auto_29918 ?auto_29919 ) ( CLEAR ?auto_29918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29918 )
      ( MAKE-6PILE ?auto_29918 ?auto_29919 ?auto_29920 ?auto_29921 ?auto_29922 ?auto_29923 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29945 - BLOCK
      ?auto_29946 - BLOCK
      ?auto_29947 - BLOCK
      ?auto_29948 - BLOCK
      ?auto_29949 - BLOCK
      ?auto_29950 - BLOCK
      ?auto_29951 - BLOCK
    )
    :vars
    (
      ?auto_29952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29950 ) ( ON ?auto_29951 ?auto_29952 ) ( CLEAR ?auto_29951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29945 ) ( ON ?auto_29946 ?auto_29945 ) ( ON ?auto_29947 ?auto_29946 ) ( ON ?auto_29948 ?auto_29947 ) ( ON ?auto_29949 ?auto_29948 ) ( ON ?auto_29950 ?auto_29949 ) ( not ( = ?auto_29945 ?auto_29946 ) ) ( not ( = ?auto_29945 ?auto_29947 ) ) ( not ( = ?auto_29945 ?auto_29948 ) ) ( not ( = ?auto_29945 ?auto_29949 ) ) ( not ( = ?auto_29945 ?auto_29950 ) ) ( not ( = ?auto_29945 ?auto_29951 ) ) ( not ( = ?auto_29945 ?auto_29952 ) ) ( not ( = ?auto_29946 ?auto_29947 ) ) ( not ( = ?auto_29946 ?auto_29948 ) ) ( not ( = ?auto_29946 ?auto_29949 ) ) ( not ( = ?auto_29946 ?auto_29950 ) ) ( not ( = ?auto_29946 ?auto_29951 ) ) ( not ( = ?auto_29946 ?auto_29952 ) ) ( not ( = ?auto_29947 ?auto_29948 ) ) ( not ( = ?auto_29947 ?auto_29949 ) ) ( not ( = ?auto_29947 ?auto_29950 ) ) ( not ( = ?auto_29947 ?auto_29951 ) ) ( not ( = ?auto_29947 ?auto_29952 ) ) ( not ( = ?auto_29948 ?auto_29949 ) ) ( not ( = ?auto_29948 ?auto_29950 ) ) ( not ( = ?auto_29948 ?auto_29951 ) ) ( not ( = ?auto_29948 ?auto_29952 ) ) ( not ( = ?auto_29949 ?auto_29950 ) ) ( not ( = ?auto_29949 ?auto_29951 ) ) ( not ( = ?auto_29949 ?auto_29952 ) ) ( not ( = ?auto_29950 ?auto_29951 ) ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29951 ?auto_29952 )
      ( !STACK ?auto_29951 ?auto_29950 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29960 - BLOCK
      ?auto_29961 - BLOCK
      ?auto_29962 - BLOCK
      ?auto_29963 - BLOCK
      ?auto_29964 - BLOCK
      ?auto_29965 - BLOCK
      ?auto_29966 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29965 ) ( ON-TABLE ?auto_29966 ) ( CLEAR ?auto_29966 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29960 ) ( ON ?auto_29961 ?auto_29960 ) ( ON ?auto_29962 ?auto_29961 ) ( ON ?auto_29963 ?auto_29962 ) ( ON ?auto_29964 ?auto_29963 ) ( ON ?auto_29965 ?auto_29964 ) ( not ( = ?auto_29960 ?auto_29961 ) ) ( not ( = ?auto_29960 ?auto_29962 ) ) ( not ( = ?auto_29960 ?auto_29963 ) ) ( not ( = ?auto_29960 ?auto_29964 ) ) ( not ( = ?auto_29960 ?auto_29965 ) ) ( not ( = ?auto_29960 ?auto_29966 ) ) ( not ( = ?auto_29961 ?auto_29962 ) ) ( not ( = ?auto_29961 ?auto_29963 ) ) ( not ( = ?auto_29961 ?auto_29964 ) ) ( not ( = ?auto_29961 ?auto_29965 ) ) ( not ( = ?auto_29961 ?auto_29966 ) ) ( not ( = ?auto_29962 ?auto_29963 ) ) ( not ( = ?auto_29962 ?auto_29964 ) ) ( not ( = ?auto_29962 ?auto_29965 ) ) ( not ( = ?auto_29962 ?auto_29966 ) ) ( not ( = ?auto_29963 ?auto_29964 ) ) ( not ( = ?auto_29963 ?auto_29965 ) ) ( not ( = ?auto_29963 ?auto_29966 ) ) ( not ( = ?auto_29964 ?auto_29965 ) ) ( not ( = ?auto_29964 ?auto_29966 ) ) ( not ( = ?auto_29965 ?auto_29966 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_29966 )
      ( !STACK ?auto_29966 ?auto_29965 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29974 - BLOCK
      ?auto_29975 - BLOCK
      ?auto_29976 - BLOCK
      ?auto_29977 - BLOCK
      ?auto_29978 - BLOCK
      ?auto_29979 - BLOCK
      ?auto_29980 - BLOCK
    )
    :vars
    (
      ?auto_29981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29980 ?auto_29981 ) ( ON-TABLE ?auto_29974 ) ( ON ?auto_29975 ?auto_29974 ) ( ON ?auto_29976 ?auto_29975 ) ( ON ?auto_29977 ?auto_29976 ) ( ON ?auto_29978 ?auto_29977 ) ( not ( = ?auto_29974 ?auto_29975 ) ) ( not ( = ?auto_29974 ?auto_29976 ) ) ( not ( = ?auto_29974 ?auto_29977 ) ) ( not ( = ?auto_29974 ?auto_29978 ) ) ( not ( = ?auto_29974 ?auto_29979 ) ) ( not ( = ?auto_29974 ?auto_29980 ) ) ( not ( = ?auto_29974 ?auto_29981 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29977 ) ) ( not ( = ?auto_29975 ?auto_29978 ) ) ( not ( = ?auto_29975 ?auto_29979 ) ) ( not ( = ?auto_29975 ?auto_29980 ) ) ( not ( = ?auto_29975 ?auto_29981 ) ) ( not ( = ?auto_29976 ?auto_29977 ) ) ( not ( = ?auto_29976 ?auto_29978 ) ) ( not ( = ?auto_29976 ?auto_29979 ) ) ( not ( = ?auto_29976 ?auto_29980 ) ) ( not ( = ?auto_29976 ?auto_29981 ) ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29977 ?auto_29979 ) ) ( not ( = ?auto_29977 ?auto_29980 ) ) ( not ( = ?auto_29977 ?auto_29981 ) ) ( not ( = ?auto_29978 ?auto_29979 ) ) ( not ( = ?auto_29978 ?auto_29980 ) ) ( not ( = ?auto_29978 ?auto_29981 ) ) ( not ( = ?auto_29979 ?auto_29980 ) ) ( not ( = ?auto_29979 ?auto_29981 ) ) ( not ( = ?auto_29980 ?auto_29981 ) ) ( CLEAR ?auto_29978 ) ( ON ?auto_29979 ?auto_29980 ) ( CLEAR ?auto_29979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_29974 ?auto_29975 ?auto_29976 ?auto_29977 ?auto_29978 ?auto_29979 )
      ( MAKE-7PILE ?auto_29974 ?auto_29975 ?auto_29976 ?auto_29977 ?auto_29978 ?auto_29979 ?auto_29980 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_29989 - BLOCK
      ?auto_29990 - BLOCK
      ?auto_29991 - BLOCK
      ?auto_29992 - BLOCK
      ?auto_29993 - BLOCK
      ?auto_29994 - BLOCK
      ?auto_29995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29995 ) ( ON-TABLE ?auto_29989 ) ( ON ?auto_29990 ?auto_29989 ) ( ON ?auto_29991 ?auto_29990 ) ( ON ?auto_29992 ?auto_29991 ) ( ON ?auto_29993 ?auto_29992 ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29992 ) ) ( not ( = ?auto_29989 ?auto_29993 ) ) ( not ( = ?auto_29989 ?auto_29994 ) ) ( not ( = ?auto_29989 ?auto_29995 ) ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( not ( = ?auto_29990 ?auto_29992 ) ) ( not ( = ?auto_29990 ?auto_29993 ) ) ( not ( = ?auto_29990 ?auto_29994 ) ) ( not ( = ?auto_29990 ?auto_29995 ) ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( not ( = ?auto_29991 ?auto_29993 ) ) ( not ( = ?auto_29991 ?auto_29994 ) ) ( not ( = ?auto_29991 ?auto_29995 ) ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( not ( = ?auto_29992 ?auto_29994 ) ) ( not ( = ?auto_29992 ?auto_29995 ) ) ( not ( = ?auto_29993 ?auto_29994 ) ) ( not ( = ?auto_29993 ?auto_29995 ) ) ( not ( = ?auto_29994 ?auto_29995 ) ) ( CLEAR ?auto_29993 ) ( ON ?auto_29994 ?auto_29995 ) ( CLEAR ?auto_29994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_29989 ?auto_29990 ?auto_29991 ?auto_29992 ?auto_29993 ?auto_29994 )
      ( MAKE-7PILE ?auto_29989 ?auto_29990 ?auto_29991 ?auto_29992 ?auto_29993 ?auto_29994 ?auto_29995 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30003 - BLOCK
      ?auto_30004 - BLOCK
      ?auto_30005 - BLOCK
      ?auto_30006 - BLOCK
      ?auto_30007 - BLOCK
      ?auto_30008 - BLOCK
      ?auto_30009 - BLOCK
    )
    :vars
    (
      ?auto_30010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30009 ?auto_30010 ) ( ON-TABLE ?auto_30003 ) ( ON ?auto_30004 ?auto_30003 ) ( ON ?auto_30005 ?auto_30004 ) ( ON ?auto_30006 ?auto_30005 ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_30003 ?auto_30005 ) ) ( not ( = ?auto_30003 ?auto_30006 ) ) ( not ( = ?auto_30003 ?auto_30007 ) ) ( not ( = ?auto_30003 ?auto_30008 ) ) ( not ( = ?auto_30003 ?auto_30009 ) ) ( not ( = ?auto_30003 ?auto_30010 ) ) ( not ( = ?auto_30004 ?auto_30005 ) ) ( not ( = ?auto_30004 ?auto_30006 ) ) ( not ( = ?auto_30004 ?auto_30007 ) ) ( not ( = ?auto_30004 ?auto_30008 ) ) ( not ( = ?auto_30004 ?auto_30009 ) ) ( not ( = ?auto_30004 ?auto_30010 ) ) ( not ( = ?auto_30005 ?auto_30006 ) ) ( not ( = ?auto_30005 ?auto_30007 ) ) ( not ( = ?auto_30005 ?auto_30008 ) ) ( not ( = ?auto_30005 ?auto_30009 ) ) ( not ( = ?auto_30005 ?auto_30010 ) ) ( not ( = ?auto_30006 ?auto_30007 ) ) ( not ( = ?auto_30006 ?auto_30008 ) ) ( not ( = ?auto_30006 ?auto_30009 ) ) ( not ( = ?auto_30006 ?auto_30010 ) ) ( not ( = ?auto_30007 ?auto_30008 ) ) ( not ( = ?auto_30007 ?auto_30009 ) ) ( not ( = ?auto_30007 ?auto_30010 ) ) ( not ( = ?auto_30008 ?auto_30009 ) ) ( not ( = ?auto_30008 ?auto_30010 ) ) ( not ( = ?auto_30009 ?auto_30010 ) ) ( ON ?auto_30008 ?auto_30009 ) ( CLEAR ?auto_30006 ) ( ON ?auto_30007 ?auto_30008 ) ( CLEAR ?auto_30007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30003 ?auto_30004 ?auto_30005 ?auto_30006 ?auto_30007 )
      ( MAKE-7PILE ?auto_30003 ?auto_30004 ?auto_30005 ?auto_30006 ?auto_30007 ?auto_30008 ?auto_30009 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30018 - BLOCK
      ?auto_30019 - BLOCK
      ?auto_30020 - BLOCK
      ?auto_30021 - BLOCK
      ?auto_30022 - BLOCK
      ?auto_30023 - BLOCK
      ?auto_30024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30024 ) ( ON-TABLE ?auto_30018 ) ( ON ?auto_30019 ?auto_30018 ) ( ON ?auto_30020 ?auto_30019 ) ( ON ?auto_30021 ?auto_30020 ) ( not ( = ?auto_30018 ?auto_30019 ) ) ( not ( = ?auto_30018 ?auto_30020 ) ) ( not ( = ?auto_30018 ?auto_30021 ) ) ( not ( = ?auto_30018 ?auto_30022 ) ) ( not ( = ?auto_30018 ?auto_30023 ) ) ( not ( = ?auto_30018 ?auto_30024 ) ) ( not ( = ?auto_30019 ?auto_30020 ) ) ( not ( = ?auto_30019 ?auto_30021 ) ) ( not ( = ?auto_30019 ?auto_30022 ) ) ( not ( = ?auto_30019 ?auto_30023 ) ) ( not ( = ?auto_30019 ?auto_30024 ) ) ( not ( = ?auto_30020 ?auto_30021 ) ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( not ( = ?auto_30020 ?auto_30023 ) ) ( not ( = ?auto_30020 ?auto_30024 ) ) ( not ( = ?auto_30021 ?auto_30022 ) ) ( not ( = ?auto_30021 ?auto_30023 ) ) ( not ( = ?auto_30021 ?auto_30024 ) ) ( not ( = ?auto_30022 ?auto_30023 ) ) ( not ( = ?auto_30022 ?auto_30024 ) ) ( not ( = ?auto_30023 ?auto_30024 ) ) ( ON ?auto_30023 ?auto_30024 ) ( CLEAR ?auto_30021 ) ( ON ?auto_30022 ?auto_30023 ) ( CLEAR ?auto_30022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30018 ?auto_30019 ?auto_30020 ?auto_30021 ?auto_30022 )
      ( MAKE-7PILE ?auto_30018 ?auto_30019 ?auto_30020 ?auto_30021 ?auto_30022 ?auto_30023 ?auto_30024 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30032 - BLOCK
      ?auto_30033 - BLOCK
      ?auto_30034 - BLOCK
      ?auto_30035 - BLOCK
      ?auto_30036 - BLOCK
      ?auto_30037 - BLOCK
      ?auto_30038 - BLOCK
    )
    :vars
    (
      ?auto_30039 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30038 ?auto_30039 ) ( ON-TABLE ?auto_30032 ) ( ON ?auto_30033 ?auto_30032 ) ( ON ?auto_30034 ?auto_30033 ) ( not ( = ?auto_30032 ?auto_30033 ) ) ( not ( = ?auto_30032 ?auto_30034 ) ) ( not ( = ?auto_30032 ?auto_30035 ) ) ( not ( = ?auto_30032 ?auto_30036 ) ) ( not ( = ?auto_30032 ?auto_30037 ) ) ( not ( = ?auto_30032 ?auto_30038 ) ) ( not ( = ?auto_30032 ?auto_30039 ) ) ( not ( = ?auto_30033 ?auto_30034 ) ) ( not ( = ?auto_30033 ?auto_30035 ) ) ( not ( = ?auto_30033 ?auto_30036 ) ) ( not ( = ?auto_30033 ?auto_30037 ) ) ( not ( = ?auto_30033 ?auto_30038 ) ) ( not ( = ?auto_30033 ?auto_30039 ) ) ( not ( = ?auto_30034 ?auto_30035 ) ) ( not ( = ?auto_30034 ?auto_30036 ) ) ( not ( = ?auto_30034 ?auto_30037 ) ) ( not ( = ?auto_30034 ?auto_30038 ) ) ( not ( = ?auto_30034 ?auto_30039 ) ) ( not ( = ?auto_30035 ?auto_30036 ) ) ( not ( = ?auto_30035 ?auto_30037 ) ) ( not ( = ?auto_30035 ?auto_30038 ) ) ( not ( = ?auto_30035 ?auto_30039 ) ) ( not ( = ?auto_30036 ?auto_30037 ) ) ( not ( = ?auto_30036 ?auto_30038 ) ) ( not ( = ?auto_30036 ?auto_30039 ) ) ( not ( = ?auto_30037 ?auto_30038 ) ) ( not ( = ?auto_30037 ?auto_30039 ) ) ( not ( = ?auto_30038 ?auto_30039 ) ) ( ON ?auto_30037 ?auto_30038 ) ( ON ?auto_30036 ?auto_30037 ) ( CLEAR ?auto_30034 ) ( ON ?auto_30035 ?auto_30036 ) ( CLEAR ?auto_30035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30032 ?auto_30033 ?auto_30034 ?auto_30035 )
      ( MAKE-7PILE ?auto_30032 ?auto_30033 ?auto_30034 ?auto_30035 ?auto_30036 ?auto_30037 ?auto_30038 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30047 - BLOCK
      ?auto_30048 - BLOCK
      ?auto_30049 - BLOCK
      ?auto_30050 - BLOCK
      ?auto_30051 - BLOCK
      ?auto_30052 - BLOCK
      ?auto_30053 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30053 ) ( ON-TABLE ?auto_30047 ) ( ON ?auto_30048 ?auto_30047 ) ( ON ?auto_30049 ?auto_30048 ) ( not ( = ?auto_30047 ?auto_30048 ) ) ( not ( = ?auto_30047 ?auto_30049 ) ) ( not ( = ?auto_30047 ?auto_30050 ) ) ( not ( = ?auto_30047 ?auto_30051 ) ) ( not ( = ?auto_30047 ?auto_30052 ) ) ( not ( = ?auto_30047 ?auto_30053 ) ) ( not ( = ?auto_30048 ?auto_30049 ) ) ( not ( = ?auto_30048 ?auto_30050 ) ) ( not ( = ?auto_30048 ?auto_30051 ) ) ( not ( = ?auto_30048 ?auto_30052 ) ) ( not ( = ?auto_30048 ?auto_30053 ) ) ( not ( = ?auto_30049 ?auto_30050 ) ) ( not ( = ?auto_30049 ?auto_30051 ) ) ( not ( = ?auto_30049 ?auto_30052 ) ) ( not ( = ?auto_30049 ?auto_30053 ) ) ( not ( = ?auto_30050 ?auto_30051 ) ) ( not ( = ?auto_30050 ?auto_30052 ) ) ( not ( = ?auto_30050 ?auto_30053 ) ) ( not ( = ?auto_30051 ?auto_30052 ) ) ( not ( = ?auto_30051 ?auto_30053 ) ) ( not ( = ?auto_30052 ?auto_30053 ) ) ( ON ?auto_30052 ?auto_30053 ) ( ON ?auto_30051 ?auto_30052 ) ( CLEAR ?auto_30049 ) ( ON ?auto_30050 ?auto_30051 ) ( CLEAR ?auto_30050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30047 ?auto_30048 ?auto_30049 ?auto_30050 )
      ( MAKE-7PILE ?auto_30047 ?auto_30048 ?auto_30049 ?auto_30050 ?auto_30051 ?auto_30052 ?auto_30053 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30061 - BLOCK
      ?auto_30062 - BLOCK
      ?auto_30063 - BLOCK
      ?auto_30064 - BLOCK
      ?auto_30065 - BLOCK
      ?auto_30066 - BLOCK
      ?auto_30067 - BLOCK
    )
    :vars
    (
      ?auto_30068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30067 ?auto_30068 ) ( ON-TABLE ?auto_30061 ) ( ON ?auto_30062 ?auto_30061 ) ( not ( = ?auto_30061 ?auto_30062 ) ) ( not ( = ?auto_30061 ?auto_30063 ) ) ( not ( = ?auto_30061 ?auto_30064 ) ) ( not ( = ?auto_30061 ?auto_30065 ) ) ( not ( = ?auto_30061 ?auto_30066 ) ) ( not ( = ?auto_30061 ?auto_30067 ) ) ( not ( = ?auto_30061 ?auto_30068 ) ) ( not ( = ?auto_30062 ?auto_30063 ) ) ( not ( = ?auto_30062 ?auto_30064 ) ) ( not ( = ?auto_30062 ?auto_30065 ) ) ( not ( = ?auto_30062 ?auto_30066 ) ) ( not ( = ?auto_30062 ?auto_30067 ) ) ( not ( = ?auto_30062 ?auto_30068 ) ) ( not ( = ?auto_30063 ?auto_30064 ) ) ( not ( = ?auto_30063 ?auto_30065 ) ) ( not ( = ?auto_30063 ?auto_30066 ) ) ( not ( = ?auto_30063 ?auto_30067 ) ) ( not ( = ?auto_30063 ?auto_30068 ) ) ( not ( = ?auto_30064 ?auto_30065 ) ) ( not ( = ?auto_30064 ?auto_30066 ) ) ( not ( = ?auto_30064 ?auto_30067 ) ) ( not ( = ?auto_30064 ?auto_30068 ) ) ( not ( = ?auto_30065 ?auto_30066 ) ) ( not ( = ?auto_30065 ?auto_30067 ) ) ( not ( = ?auto_30065 ?auto_30068 ) ) ( not ( = ?auto_30066 ?auto_30067 ) ) ( not ( = ?auto_30066 ?auto_30068 ) ) ( not ( = ?auto_30067 ?auto_30068 ) ) ( ON ?auto_30066 ?auto_30067 ) ( ON ?auto_30065 ?auto_30066 ) ( ON ?auto_30064 ?auto_30065 ) ( CLEAR ?auto_30062 ) ( ON ?auto_30063 ?auto_30064 ) ( CLEAR ?auto_30063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30061 ?auto_30062 ?auto_30063 )
      ( MAKE-7PILE ?auto_30061 ?auto_30062 ?auto_30063 ?auto_30064 ?auto_30065 ?auto_30066 ?auto_30067 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30076 - BLOCK
      ?auto_30077 - BLOCK
      ?auto_30078 - BLOCK
      ?auto_30079 - BLOCK
      ?auto_30080 - BLOCK
      ?auto_30081 - BLOCK
      ?auto_30082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30082 ) ( ON-TABLE ?auto_30076 ) ( ON ?auto_30077 ?auto_30076 ) ( not ( = ?auto_30076 ?auto_30077 ) ) ( not ( = ?auto_30076 ?auto_30078 ) ) ( not ( = ?auto_30076 ?auto_30079 ) ) ( not ( = ?auto_30076 ?auto_30080 ) ) ( not ( = ?auto_30076 ?auto_30081 ) ) ( not ( = ?auto_30076 ?auto_30082 ) ) ( not ( = ?auto_30077 ?auto_30078 ) ) ( not ( = ?auto_30077 ?auto_30079 ) ) ( not ( = ?auto_30077 ?auto_30080 ) ) ( not ( = ?auto_30077 ?auto_30081 ) ) ( not ( = ?auto_30077 ?auto_30082 ) ) ( not ( = ?auto_30078 ?auto_30079 ) ) ( not ( = ?auto_30078 ?auto_30080 ) ) ( not ( = ?auto_30078 ?auto_30081 ) ) ( not ( = ?auto_30078 ?auto_30082 ) ) ( not ( = ?auto_30079 ?auto_30080 ) ) ( not ( = ?auto_30079 ?auto_30081 ) ) ( not ( = ?auto_30079 ?auto_30082 ) ) ( not ( = ?auto_30080 ?auto_30081 ) ) ( not ( = ?auto_30080 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30082 ) ) ( ON ?auto_30081 ?auto_30082 ) ( ON ?auto_30080 ?auto_30081 ) ( ON ?auto_30079 ?auto_30080 ) ( CLEAR ?auto_30077 ) ( ON ?auto_30078 ?auto_30079 ) ( CLEAR ?auto_30078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30076 ?auto_30077 ?auto_30078 )
      ( MAKE-7PILE ?auto_30076 ?auto_30077 ?auto_30078 ?auto_30079 ?auto_30080 ?auto_30081 ?auto_30082 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30090 - BLOCK
      ?auto_30091 - BLOCK
      ?auto_30092 - BLOCK
      ?auto_30093 - BLOCK
      ?auto_30094 - BLOCK
      ?auto_30095 - BLOCK
      ?auto_30096 - BLOCK
    )
    :vars
    (
      ?auto_30097 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30096 ?auto_30097 ) ( ON-TABLE ?auto_30090 ) ( not ( = ?auto_30090 ?auto_30091 ) ) ( not ( = ?auto_30090 ?auto_30092 ) ) ( not ( = ?auto_30090 ?auto_30093 ) ) ( not ( = ?auto_30090 ?auto_30094 ) ) ( not ( = ?auto_30090 ?auto_30095 ) ) ( not ( = ?auto_30090 ?auto_30096 ) ) ( not ( = ?auto_30090 ?auto_30097 ) ) ( not ( = ?auto_30091 ?auto_30092 ) ) ( not ( = ?auto_30091 ?auto_30093 ) ) ( not ( = ?auto_30091 ?auto_30094 ) ) ( not ( = ?auto_30091 ?auto_30095 ) ) ( not ( = ?auto_30091 ?auto_30096 ) ) ( not ( = ?auto_30091 ?auto_30097 ) ) ( not ( = ?auto_30092 ?auto_30093 ) ) ( not ( = ?auto_30092 ?auto_30094 ) ) ( not ( = ?auto_30092 ?auto_30095 ) ) ( not ( = ?auto_30092 ?auto_30096 ) ) ( not ( = ?auto_30092 ?auto_30097 ) ) ( not ( = ?auto_30093 ?auto_30094 ) ) ( not ( = ?auto_30093 ?auto_30095 ) ) ( not ( = ?auto_30093 ?auto_30096 ) ) ( not ( = ?auto_30093 ?auto_30097 ) ) ( not ( = ?auto_30094 ?auto_30095 ) ) ( not ( = ?auto_30094 ?auto_30096 ) ) ( not ( = ?auto_30094 ?auto_30097 ) ) ( not ( = ?auto_30095 ?auto_30096 ) ) ( not ( = ?auto_30095 ?auto_30097 ) ) ( not ( = ?auto_30096 ?auto_30097 ) ) ( ON ?auto_30095 ?auto_30096 ) ( ON ?auto_30094 ?auto_30095 ) ( ON ?auto_30093 ?auto_30094 ) ( ON ?auto_30092 ?auto_30093 ) ( CLEAR ?auto_30090 ) ( ON ?auto_30091 ?auto_30092 ) ( CLEAR ?auto_30091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30090 ?auto_30091 )
      ( MAKE-7PILE ?auto_30090 ?auto_30091 ?auto_30092 ?auto_30093 ?auto_30094 ?auto_30095 ?auto_30096 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30105 - BLOCK
      ?auto_30106 - BLOCK
      ?auto_30107 - BLOCK
      ?auto_30108 - BLOCK
      ?auto_30109 - BLOCK
      ?auto_30110 - BLOCK
      ?auto_30111 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30111 ) ( ON-TABLE ?auto_30105 ) ( not ( = ?auto_30105 ?auto_30106 ) ) ( not ( = ?auto_30105 ?auto_30107 ) ) ( not ( = ?auto_30105 ?auto_30108 ) ) ( not ( = ?auto_30105 ?auto_30109 ) ) ( not ( = ?auto_30105 ?auto_30110 ) ) ( not ( = ?auto_30105 ?auto_30111 ) ) ( not ( = ?auto_30106 ?auto_30107 ) ) ( not ( = ?auto_30106 ?auto_30108 ) ) ( not ( = ?auto_30106 ?auto_30109 ) ) ( not ( = ?auto_30106 ?auto_30110 ) ) ( not ( = ?auto_30106 ?auto_30111 ) ) ( not ( = ?auto_30107 ?auto_30108 ) ) ( not ( = ?auto_30107 ?auto_30109 ) ) ( not ( = ?auto_30107 ?auto_30110 ) ) ( not ( = ?auto_30107 ?auto_30111 ) ) ( not ( = ?auto_30108 ?auto_30109 ) ) ( not ( = ?auto_30108 ?auto_30110 ) ) ( not ( = ?auto_30108 ?auto_30111 ) ) ( not ( = ?auto_30109 ?auto_30110 ) ) ( not ( = ?auto_30109 ?auto_30111 ) ) ( not ( = ?auto_30110 ?auto_30111 ) ) ( ON ?auto_30110 ?auto_30111 ) ( ON ?auto_30109 ?auto_30110 ) ( ON ?auto_30108 ?auto_30109 ) ( ON ?auto_30107 ?auto_30108 ) ( CLEAR ?auto_30105 ) ( ON ?auto_30106 ?auto_30107 ) ( CLEAR ?auto_30106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30105 ?auto_30106 )
      ( MAKE-7PILE ?auto_30105 ?auto_30106 ?auto_30107 ?auto_30108 ?auto_30109 ?auto_30110 ?auto_30111 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30119 - BLOCK
      ?auto_30120 - BLOCK
      ?auto_30121 - BLOCK
      ?auto_30122 - BLOCK
      ?auto_30123 - BLOCK
      ?auto_30124 - BLOCK
      ?auto_30125 - BLOCK
    )
    :vars
    (
      ?auto_30126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30125 ?auto_30126 ) ( not ( = ?auto_30119 ?auto_30120 ) ) ( not ( = ?auto_30119 ?auto_30121 ) ) ( not ( = ?auto_30119 ?auto_30122 ) ) ( not ( = ?auto_30119 ?auto_30123 ) ) ( not ( = ?auto_30119 ?auto_30124 ) ) ( not ( = ?auto_30119 ?auto_30125 ) ) ( not ( = ?auto_30119 ?auto_30126 ) ) ( not ( = ?auto_30120 ?auto_30121 ) ) ( not ( = ?auto_30120 ?auto_30122 ) ) ( not ( = ?auto_30120 ?auto_30123 ) ) ( not ( = ?auto_30120 ?auto_30124 ) ) ( not ( = ?auto_30120 ?auto_30125 ) ) ( not ( = ?auto_30120 ?auto_30126 ) ) ( not ( = ?auto_30121 ?auto_30122 ) ) ( not ( = ?auto_30121 ?auto_30123 ) ) ( not ( = ?auto_30121 ?auto_30124 ) ) ( not ( = ?auto_30121 ?auto_30125 ) ) ( not ( = ?auto_30121 ?auto_30126 ) ) ( not ( = ?auto_30122 ?auto_30123 ) ) ( not ( = ?auto_30122 ?auto_30124 ) ) ( not ( = ?auto_30122 ?auto_30125 ) ) ( not ( = ?auto_30122 ?auto_30126 ) ) ( not ( = ?auto_30123 ?auto_30124 ) ) ( not ( = ?auto_30123 ?auto_30125 ) ) ( not ( = ?auto_30123 ?auto_30126 ) ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( not ( = ?auto_30124 ?auto_30126 ) ) ( not ( = ?auto_30125 ?auto_30126 ) ) ( ON ?auto_30124 ?auto_30125 ) ( ON ?auto_30123 ?auto_30124 ) ( ON ?auto_30122 ?auto_30123 ) ( ON ?auto_30121 ?auto_30122 ) ( ON ?auto_30120 ?auto_30121 ) ( ON ?auto_30119 ?auto_30120 ) ( CLEAR ?auto_30119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30119 )
      ( MAKE-7PILE ?auto_30119 ?auto_30120 ?auto_30121 ?auto_30122 ?auto_30123 ?auto_30124 ?auto_30125 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30134 - BLOCK
      ?auto_30135 - BLOCK
      ?auto_30136 - BLOCK
      ?auto_30137 - BLOCK
      ?auto_30138 - BLOCK
      ?auto_30139 - BLOCK
      ?auto_30140 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30140 ) ( not ( = ?auto_30134 ?auto_30135 ) ) ( not ( = ?auto_30134 ?auto_30136 ) ) ( not ( = ?auto_30134 ?auto_30137 ) ) ( not ( = ?auto_30134 ?auto_30138 ) ) ( not ( = ?auto_30134 ?auto_30139 ) ) ( not ( = ?auto_30134 ?auto_30140 ) ) ( not ( = ?auto_30135 ?auto_30136 ) ) ( not ( = ?auto_30135 ?auto_30137 ) ) ( not ( = ?auto_30135 ?auto_30138 ) ) ( not ( = ?auto_30135 ?auto_30139 ) ) ( not ( = ?auto_30135 ?auto_30140 ) ) ( not ( = ?auto_30136 ?auto_30137 ) ) ( not ( = ?auto_30136 ?auto_30138 ) ) ( not ( = ?auto_30136 ?auto_30139 ) ) ( not ( = ?auto_30136 ?auto_30140 ) ) ( not ( = ?auto_30137 ?auto_30138 ) ) ( not ( = ?auto_30137 ?auto_30139 ) ) ( not ( = ?auto_30137 ?auto_30140 ) ) ( not ( = ?auto_30138 ?auto_30139 ) ) ( not ( = ?auto_30138 ?auto_30140 ) ) ( not ( = ?auto_30139 ?auto_30140 ) ) ( ON ?auto_30139 ?auto_30140 ) ( ON ?auto_30138 ?auto_30139 ) ( ON ?auto_30137 ?auto_30138 ) ( ON ?auto_30136 ?auto_30137 ) ( ON ?auto_30135 ?auto_30136 ) ( ON ?auto_30134 ?auto_30135 ) ( CLEAR ?auto_30134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30134 )
      ( MAKE-7PILE ?auto_30134 ?auto_30135 ?auto_30136 ?auto_30137 ?auto_30138 ?auto_30139 ?auto_30140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_30148 - BLOCK
      ?auto_30149 - BLOCK
      ?auto_30150 - BLOCK
      ?auto_30151 - BLOCK
      ?auto_30152 - BLOCK
      ?auto_30153 - BLOCK
      ?auto_30154 - BLOCK
    )
    :vars
    (
      ?auto_30155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30148 ?auto_30149 ) ) ( not ( = ?auto_30148 ?auto_30150 ) ) ( not ( = ?auto_30148 ?auto_30151 ) ) ( not ( = ?auto_30148 ?auto_30152 ) ) ( not ( = ?auto_30148 ?auto_30153 ) ) ( not ( = ?auto_30148 ?auto_30154 ) ) ( not ( = ?auto_30149 ?auto_30150 ) ) ( not ( = ?auto_30149 ?auto_30151 ) ) ( not ( = ?auto_30149 ?auto_30152 ) ) ( not ( = ?auto_30149 ?auto_30153 ) ) ( not ( = ?auto_30149 ?auto_30154 ) ) ( not ( = ?auto_30150 ?auto_30151 ) ) ( not ( = ?auto_30150 ?auto_30152 ) ) ( not ( = ?auto_30150 ?auto_30153 ) ) ( not ( = ?auto_30150 ?auto_30154 ) ) ( not ( = ?auto_30151 ?auto_30152 ) ) ( not ( = ?auto_30151 ?auto_30153 ) ) ( not ( = ?auto_30151 ?auto_30154 ) ) ( not ( = ?auto_30152 ?auto_30153 ) ) ( not ( = ?auto_30152 ?auto_30154 ) ) ( not ( = ?auto_30153 ?auto_30154 ) ) ( ON ?auto_30148 ?auto_30155 ) ( not ( = ?auto_30154 ?auto_30155 ) ) ( not ( = ?auto_30153 ?auto_30155 ) ) ( not ( = ?auto_30152 ?auto_30155 ) ) ( not ( = ?auto_30151 ?auto_30155 ) ) ( not ( = ?auto_30150 ?auto_30155 ) ) ( not ( = ?auto_30149 ?auto_30155 ) ) ( not ( = ?auto_30148 ?auto_30155 ) ) ( ON ?auto_30149 ?auto_30148 ) ( ON ?auto_30150 ?auto_30149 ) ( ON ?auto_30151 ?auto_30150 ) ( ON ?auto_30152 ?auto_30151 ) ( ON ?auto_30153 ?auto_30152 ) ( ON ?auto_30154 ?auto_30153 ) ( CLEAR ?auto_30154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_30154 ?auto_30153 ?auto_30152 ?auto_30151 ?auto_30150 ?auto_30149 ?auto_30148 )
      ( MAKE-7PILE ?auto_30148 ?auto_30149 ?auto_30150 ?auto_30151 ?auto_30152 ?auto_30153 ?auto_30154 ) )
  )

)

