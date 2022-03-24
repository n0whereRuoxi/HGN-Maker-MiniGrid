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
      ?auto_63601 - BLOCK
    )
    :vars
    (
      ?auto_63602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63601 ?auto_63602 ) ( CLEAR ?auto_63601 ) ( HAND-EMPTY ) ( not ( = ?auto_63601 ?auto_63602 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63601 ?auto_63602 )
      ( !PUTDOWN ?auto_63601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63604 - BLOCK
    )
    :vars
    (
      ?auto_63605 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63604 ?auto_63605 ) ( CLEAR ?auto_63604 ) ( HAND-EMPTY ) ( not ( = ?auto_63604 ?auto_63605 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63604 ?auto_63605 )
      ( !PUTDOWN ?auto_63604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63608 - BLOCK
      ?auto_63609 - BLOCK
    )
    :vars
    (
      ?auto_63610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63608 ) ( ON ?auto_63609 ?auto_63610 ) ( CLEAR ?auto_63609 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63608 ) ( not ( = ?auto_63608 ?auto_63609 ) ) ( not ( = ?auto_63608 ?auto_63610 ) ) ( not ( = ?auto_63609 ?auto_63610 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63609 ?auto_63610 )
      ( !STACK ?auto_63609 ?auto_63608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63613 - BLOCK
      ?auto_63614 - BLOCK
    )
    :vars
    (
      ?auto_63615 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63613 ) ( ON ?auto_63614 ?auto_63615 ) ( CLEAR ?auto_63614 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63613 ) ( not ( = ?auto_63613 ?auto_63614 ) ) ( not ( = ?auto_63613 ?auto_63615 ) ) ( not ( = ?auto_63614 ?auto_63615 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63614 ?auto_63615 )
      ( !STACK ?auto_63614 ?auto_63613 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63618 - BLOCK
      ?auto_63619 - BLOCK
    )
    :vars
    (
      ?auto_63620 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63619 ?auto_63620 ) ( not ( = ?auto_63618 ?auto_63619 ) ) ( not ( = ?auto_63618 ?auto_63620 ) ) ( not ( = ?auto_63619 ?auto_63620 ) ) ( ON ?auto_63618 ?auto_63619 ) ( CLEAR ?auto_63618 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63618 )
      ( MAKE-2PILE ?auto_63618 ?auto_63619 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63623 - BLOCK
      ?auto_63624 - BLOCK
    )
    :vars
    (
      ?auto_63625 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63624 ?auto_63625 ) ( not ( = ?auto_63623 ?auto_63624 ) ) ( not ( = ?auto_63623 ?auto_63625 ) ) ( not ( = ?auto_63624 ?auto_63625 ) ) ( ON ?auto_63623 ?auto_63624 ) ( CLEAR ?auto_63623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63623 )
      ( MAKE-2PILE ?auto_63623 ?auto_63624 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63629 - BLOCK
      ?auto_63630 - BLOCK
      ?auto_63631 - BLOCK
    )
    :vars
    (
      ?auto_63632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63630 ) ( ON ?auto_63631 ?auto_63632 ) ( CLEAR ?auto_63631 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63629 ) ( ON ?auto_63630 ?auto_63629 ) ( not ( = ?auto_63629 ?auto_63630 ) ) ( not ( = ?auto_63629 ?auto_63631 ) ) ( not ( = ?auto_63629 ?auto_63632 ) ) ( not ( = ?auto_63630 ?auto_63631 ) ) ( not ( = ?auto_63630 ?auto_63632 ) ) ( not ( = ?auto_63631 ?auto_63632 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63631 ?auto_63632 )
      ( !STACK ?auto_63631 ?auto_63630 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63636 - BLOCK
      ?auto_63637 - BLOCK
      ?auto_63638 - BLOCK
    )
    :vars
    (
      ?auto_63639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63637 ) ( ON ?auto_63638 ?auto_63639 ) ( CLEAR ?auto_63638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63636 ) ( ON ?auto_63637 ?auto_63636 ) ( not ( = ?auto_63636 ?auto_63637 ) ) ( not ( = ?auto_63636 ?auto_63638 ) ) ( not ( = ?auto_63636 ?auto_63639 ) ) ( not ( = ?auto_63637 ?auto_63638 ) ) ( not ( = ?auto_63637 ?auto_63639 ) ) ( not ( = ?auto_63638 ?auto_63639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63638 ?auto_63639 )
      ( !STACK ?auto_63638 ?auto_63637 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63643 - BLOCK
      ?auto_63644 - BLOCK
      ?auto_63645 - BLOCK
    )
    :vars
    (
      ?auto_63646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63645 ?auto_63646 ) ( ON-TABLE ?auto_63643 ) ( not ( = ?auto_63643 ?auto_63644 ) ) ( not ( = ?auto_63643 ?auto_63645 ) ) ( not ( = ?auto_63643 ?auto_63646 ) ) ( not ( = ?auto_63644 ?auto_63645 ) ) ( not ( = ?auto_63644 ?auto_63646 ) ) ( not ( = ?auto_63645 ?auto_63646 ) ) ( CLEAR ?auto_63643 ) ( ON ?auto_63644 ?auto_63645 ) ( CLEAR ?auto_63644 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63643 ?auto_63644 )
      ( MAKE-3PILE ?auto_63643 ?auto_63644 ?auto_63645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63650 - BLOCK
      ?auto_63651 - BLOCK
      ?auto_63652 - BLOCK
    )
    :vars
    (
      ?auto_63653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63652 ?auto_63653 ) ( ON-TABLE ?auto_63650 ) ( not ( = ?auto_63650 ?auto_63651 ) ) ( not ( = ?auto_63650 ?auto_63652 ) ) ( not ( = ?auto_63650 ?auto_63653 ) ) ( not ( = ?auto_63651 ?auto_63652 ) ) ( not ( = ?auto_63651 ?auto_63653 ) ) ( not ( = ?auto_63652 ?auto_63653 ) ) ( CLEAR ?auto_63650 ) ( ON ?auto_63651 ?auto_63652 ) ( CLEAR ?auto_63651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63650 ?auto_63651 )
      ( MAKE-3PILE ?auto_63650 ?auto_63651 ?auto_63652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63657 - BLOCK
      ?auto_63658 - BLOCK
      ?auto_63659 - BLOCK
    )
    :vars
    (
      ?auto_63660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63659 ?auto_63660 ) ( not ( = ?auto_63657 ?auto_63658 ) ) ( not ( = ?auto_63657 ?auto_63659 ) ) ( not ( = ?auto_63657 ?auto_63660 ) ) ( not ( = ?auto_63658 ?auto_63659 ) ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63660 ) ) ( ON ?auto_63658 ?auto_63659 ) ( ON ?auto_63657 ?auto_63658 ) ( CLEAR ?auto_63657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63657 )
      ( MAKE-3PILE ?auto_63657 ?auto_63658 ?auto_63659 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63664 - BLOCK
      ?auto_63665 - BLOCK
      ?auto_63666 - BLOCK
    )
    :vars
    (
      ?auto_63667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63666 ?auto_63667 ) ( not ( = ?auto_63664 ?auto_63665 ) ) ( not ( = ?auto_63664 ?auto_63666 ) ) ( not ( = ?auto_63664 ?auto_63667 ) ) ( not ( = ?auto_63665 ?auto_63666 ) ) ( not ( = ?auto_63665 ?auto_63667 ) ) ( not ( = ?auto_63666 ?auto_63667 ) ) ( ON ?auto_63665 ?auto_63666 ) ( ON ?auto_63664 ?auto_63665 ) ( CLEAR ?auto_63664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63664 )
      ( MAKE-3PILE ?auto_63664 ?auto_63665 ?auto_63666 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63672 - BLOCK
      ?auto_63673 - BLOCK
      ?auto_63674 - BLOCK
      ?auto_63675 - BLOCK
    )
    :vars
    (
      ?auto_63676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63674 ) ( ON ?auto_63675 ?auto_63676 ) ( CLEAR ?auto_63675 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63672 ) ( ON ?auto_63673 ?auto_63672 ) ( ON ?auto_63674 ?auto_63673 ) ( not ( = ?auto_63672 ?auto_63673 ) ) ( not ( = ?auto_63672 ?auto_63674 ) ) ( not ( = ?auto_63672 ?auto_63675 ) ) ( not ( = ?auto_63672 ?auto_63676 ) ) ( not ( = ?auto_63673 ?auto_63674 ) ) ( not ( = ?auto_63673 ?auto_63675 ) ) ( not ( = ?auto_63673 ?auto_63676 ) ) ( not ( = ?auto_63674 ?auto_63675 ) ) ( not ( = ?auto_63674 ?auto_63676 ) ) ( not ( = ?auto_63675 ?auto_63676 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63675 ?auto_63676 )
      ( !STACK ?auto_63675 ?auto_63674 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63681 - BLOCK
      ?auto_63682 - BLOCK
      ?auto_63683 - BLOCK
      ?auto_63684 - BLOCK
    )
    :vars
    (
      ?auto_63685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63683 ) ( ON ?auto_63684 ?auto_63685 ) ( CLEAR ?auto_63684 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63681 ) ( ON ?auto_63682 ?auto_63681 ) ( ON ?auto_63683 ?auto_63682 ) ( not ( = ?auto_63681 ?auto_63682 ) ) ( not ( = ?auto_63681 ?auto_63683 ) ) ( not ( = ?auto_63681 ?auto_63684 ) ) ( not ( = ?auto_63681 ?auto_63685 ) ) ( not ( = ?auto_63682 ?auto_63683 ) ) ( not ( = ?auto_63682 ?auto_63684 ) ) ( not ( = ?auto_63682 ?auto_63685 ) ) ( not ( = ?auto_63683 ?auto_63684 ) ) ( not ( = ?auto_63683 ?auto_63685 ) ) ( not ( = ?auto_63684 ?auto_63685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63684 ?auto_63685 )
      ( !STACK ?auto_63684 ?auto_63683 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63690 - BLOCK
      ?auto_63691 - BLOCK
      ?auto_63692 - BLOCK
      ?auto_63693 - BLOCK
    )
    :vars
    (
      ?auto_63694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63693 ?auto_63694 ) ( ON-TABLE ?auto_63690 ) ( ON ?auto_63691 ?auto_63690 ) ( not ( = ?auto_63690 ?auto_63691 ) ) ( not ( = ?auto_63690 ?auto_63692 ) ) ( not ( = ?auto_63690 ?auto_63693 ) ) ( not ( = ?auto_63690 ?auto_63694 ) ) ( not ( = ?auto_63691 ?auto_63692 ) ) ( not ( = ?auto_63691 ?auto_63693 ) ) ( not ( = ?auto_63691 ?auto_63694 ) ) ( not ( = ?auto_63692 ?auto_63693 ) ) ( not ( = ?auto_63692 ?auto_63694 ) ) ( not ( = ?auto_63693 ?auto_63694 ) ) ( CLEAR ?auto_63691 ) ( ON ?auto_63692 ?auto_63693 ) ( CLEAR ?auto_63692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63690 ?auto_63691 ?auto_63692 )
      ( MAKE-4PILE ?auto_63690 ?auto_63691 ?auto_63692 ?auto_63693 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63699 - BLOCK
      ?auto_63700 - BLOCK
      ?auto_63701 - BLOCK
      ?auto_63702 - BLOCK
    )
    :vars
    (
      ?auto_63703 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63702 ?auto_63703 ) ( ON-TABLE ?auto_63699 ) ( ON ?auto_63700 ?auto_63699 ) ( not ( = ?auto_63699 ?auto_63700 ) ) ( not ( = ?auto_63699 ?auto_63701 ) ) ( not ( = ?auto_63699 ?auto_63702 ) ) ( not ( = ?auto_63699 ?auto_63703 ) ) ( not ( = ?auto_63700 ?auto_63701 ) ) ( not ( = ?auto_63700 ?auto_63702 ) ) ( not ( = ?auto_63700 ?auto_63703 ) ) ( not ( = ?auto_63701 ?auto_63702 ) ) ( not ( = ?auto_63701 ?auto_63703 ) ) ( not ( = ?auto_63702 ?auto_63703 ) ) ( CLEAR ?auto_63700 ) ( ON ?auto_63701 ?auto_63702 ) ( CLEAR ?auto_63701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63699 ?auto_63700 ?auto_63701 )
      ( MAKE-4PILE ?auto_63699 ?auto_63700 ?auto_63701 ?auto_63702 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63708 - BLOCK
      ?auto_63709 - BLOCK
      ?auto_63710 - BLOCK
      ?auto_63711 - BLOCK
    )
    :vars
    (
      ?auto_63712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63711 ?auto_63712 ) ( ON-TABLE ?auto_63708 ) ( not ( = ?auto_63708 ?auto_63709 ) ) ( not ( = ?auto_63708 ?auto_63710 ) ) ( not ( = ?auto_63708 ?auto_63711 ) ) ( not ( = ?auto_63708 ?auto_63712 ) ) ( not ( = ?auto_63709 ?auto_63710 ) ) ( not ( = ?auto_63709 ?auto_63711 ) ) ( not ( = ?auto_63709 ?auto_63712 ) ) ( not ( = ?auto_63710 ?auto_63711 ) ) ( not ( = ?auto_63710 ?auto_63712 ) ) ( not ( = ?auto_63711 ?auto_63712 ) ) ( ON ?auto_63710 ?auto_63711 ) ( CLEAR ?auto_63708 ) ( ON ?auto_63709 ?auto_63710 ) ( CLEAR ?auto_63709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63708 ?auto_63709 )
      ( MAKE-4PILE ?auto_63708 ?auto_63709 ?auto_63710 ?auto_63711 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63717 - BLOCK
      ?auto_63718 - BLOCK
      ?auto_63719 - BLOCK
      ?auto_63720 - BLOCK
    )
    :vars
    (
      ?auto_63721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63720 ?auto_63721 ) ( ON-TABLE ?auto_63717 ) ( not ( = ?auto_63717 ?auto_63718 ) ) ( not ( = ?auto_63717 ?auto_63719 ) ) ( not ( = ?auto_63717 ?auto_63720 ) ) ( not ( = ?auto_63717 ?auto_63721 ) ) ( not ( = ?auto_63718 ?auto_63719 ) ) ( not ( = ?auto_63718 ?auto_63720 ) ) ( not ( = ?auto_63718 ?auto_63721 ) ) ( not ( = ?auto_63719 ?auto_63720 ) ) ( not ( = ?auto_63719 ?auto_63721 ) ) ( not ( = ?auto_63720 ?auto_63721 ) ) ( ON ?auto_63719 ?auto_63720 ) ( CLEAR ?auto_63717 ) ( ON ?auto_63718 ?auto_63719 ) ( CLEAR ?auto_63718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63717 ?auto_63718 )
      ( MAKE-4PILE ?auto_63717 ?auto_63718 ?auto_63719 ?auto_63720 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63726 - BLOCK
      ?auto_63727 - BLOCK
      ?auto_63728 - BLOCK
      ?auto_63729 - BLOCK
    )
    :vars
    (
      ?auto_63730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63729 ?auto_63730 ) ( not ( = ?auto_63726 ?auto_63727 ) ) ( not ( = ?auto_63726 ?auto_63728 ) ) ( not ( = ?auto_63726 ?auto_63729 ) ) ( not ( = ?auto_63726 ?auto_63730 ) ) ( not ( = ?auto_63727 ?auto_63728 ) ) ( not ( = ?auto_63727 ?auto_63729 ) ) ( not ( = ?auto_63727 ?auto_63730 ) ) ( not ( = ?auto_63728 ?auto_63729 ) ) ( not ( = ?auto_63728 ?auto_63730 ) ) ( not ( = ?auto_63729 ?auto_63730 ) ) ( ON ?auto_63728 ?auto_63729 ) ( ON ?auto_63727 ?auto_63728 ) ( ON ?auto_63726 ?auto_63727 ) ( CLEAR ?auto_63726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63726 )
      ( MAKE-4PILE ?auto_63726 ?auto_63727 ?auto_63728 ?auto_63729 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63735 - BLOCK
      ?auto_63736 - BLOCK
      ?auto_63737 - BLOCK
      ?auto_63738 - BLOCK
    )
    :vars
    (
      ?auto_63739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63738 ?auto_63739 ) ( not ( = ?auto_63735 ?auto_63736 ) ) ( not ( = ?auto_63735 ?auto_63737 ) ) ( not ( = ?auto_63735 ?auto_63738 ) ) ( not ( = ?auto_63735 ?auto_63739 ) ) ( not ( = ?auto_63736 ?auto_63737 ) ) ( not ( = ?auto_63736 ?auto_63738 ) ) ( not ( = ?auto_63736 ?auto_63739 ) ) ( not ( = ?auto_63737 ?auto_63738 ) ) ( not ( = ?auto_63737 ?auto_63739 ) ) ( not ( = ?auto_63738 ?auto_63739 ) ) ( ON ?auto_63737 ?auto_63738 ) ( ON ?auto_63736 ?auto_63737 ) ( ON ?auto_63735 ?auto_63736 ) ( CLEAR ?auto_63735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63735 )
      ( MAKE-4PILE ?auto_63735 ?auto_63736 ?auto_63737 ?auto_63738 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63745 - BLOCK
      ?auto_63746 - BLOCK
      ?auto_63747 - BLOCK
      ?auto_63748 - BLOCK
      ?auto_63749 - BLOCK
    )
    :vars
    (
      ?auto_63750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63748 ) ( ON ?auto_63749 ?auto_63750 ) ( CLEAR ?auto_63749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63745 ) ( ON ?auto_63746 ?auto_63745 ) ( ON ?auto_63747 ?auto_63746 ) ( ON ?auto_63748 ?auto_63747 ) ( not ( = ?auto_63745 ?auto_63746 ) ) ( not ( = ?auto_63745 ?auto_63747 ) ) ( not ( = ?auto_63745 ?auto_63748 ) ) ( not ( = ?auto_63745 ?auto_63749 ) ) ( not ( = ?auto_63745 ?auto_63750 ) ) ( not ( = ?auto_63746 ?auto_63747 ) ) ( not ( = ?auto_63746 ?auto_63748 ) ) ( not ( = ?auto_63746 ?auto_63749 ) ) ( not ( = ?auto_63746 ?auto_63750 ) ) ( not ( = ?auto_63747 ?auto_63748 ) ) ( not ( = ?auto_63747 ?auto_63749 ) ) ( not ( = ?auto_63747 ?auto_63750 ) ) ( not ( = ?auto_63748 ?auto_63749 ) ) ( not ( = ?auto_63748 ?auto_63750 ) ) ( not ( = ?auto_63749 ?auto_63750 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63749 ?auto_63750 )
      ( !STACK ?auto_63749 ?auto_63748 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63756 - BLOCK
      ?auto_63757 - BLOCK
      ?auto_63758 - BLOCK
      ?auto_63759 - BLOCK
      ?auto_63760 - BLOCK
    )
    :vars
    (
      ?auto_63761 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63759 ) ( ON ?auto_63760 ?auto_63761 ) ( CLEAR ?auto_63760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63756 ) ( ON ?auto_63757 ?auto_63756 ) ( ON ?auto_63758 ?auto_63757 ) ( ON ?auto_63759 ?auto_63758 ) ( not ( = ?auto_63756 ?auto_63757 ) ) ( not ( = ?auto_63756 ?auto_63758 ) ) ( not ( = ?auto_63756 ?auto_63759 ) ) ( not ( = ?auto_63756 ?auto_63760 ) ) ( not ( = ?auto_63756 ?auto_63761 ) ) ( not ( = ?auto_63757 ?auto_63758 ) ) ( not ( = ?auto_63757 ?auto_63759 ) ) ( not ( = ?auto_63757 ?auto_63760 ) ) ( not ( = ?auto_63757 ?auto_63761 ) ) ( not ( = ?auto_63758 ?auto_63759 ) ) ( not ( = ?auto_63758 ?auto_63760 ) ) ( not ( = ?auto_63758 ?auto_63761 ) ) ( not ( = ?auto_63759 ?auto_63760 ) ) ( not ( = ?auto_63759 ?auto_63761 ) ) ( not ( = ?auto_63760 ?auto_63761 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63760 ?auto_63761 )
      ( !STACK ?auto_63760 ?auto_63759 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63767 - BLOCK
      ?auto_63768 - BLOCK
      ?auto_63769 - BLOCK
      ?auto_63770 - BLOCK
      ?auto_63771 - BLOCK
    )
    :vars
    (
      ?auto_63772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63771 ?auto_63772 ) ( ON-TABLE ?auto_63767 ) ( ON ?auto_63768 ?auto_63767 ) ( ON ?auto_63769 ?auto_63768 ) ( not ( = ?auto_63767 ?auto_63768 ) ) ( not ( = ?auto_63767 ?auto_63769 ) ) ( not ( = ?auto_63767 ?auto_63770 ) ) ( not ( = ?auto_63767 ?auto_63771 ) ) ( not ( = ?auto_63767 ?auto_63772 ) ) ( not ( = ?auto_63768 ?auto_63769 ) ) ( not ( = ?auto_63768 ?auto_63770 ) ) ( not ( = ?auto_63768 ?auto_63771 ) ) ( not ( = ?auto_63768 ?auto_63772 ) ) ( not ( = ?auto_63769 ?auto_63770 ) ) ( not ( = ?auto_63769 ?auto_63771 ) ) ( not ( = ?auto_63769 ?auto_63772 ) ) ( not ( = ?auto_63770 ?auto_63771 ) ) ( not ( = ?auto_63770 ?auto_63772 ) ) ( not ( = ?auto_63771 ?auto_63772 ) ) ( CLEAR ?auto_63769 ) ( ON ?auto_63770 ?auto_63771 ) ( CLEAR ?auto_63770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63767 ?auto_63768 ?auto_63769 ?auto_63770 )
      ( MAKE-5PILE ?auto_63767 ?auto_63768 ?auto_63769 ?auto_63770 ?auto_63771 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63778 - BLOCK
      ?auto_63779 - BLOCK
      ?auto_63780 - BLOCK
      ?auto_63781 - BLOCK
      ?auto_63782 - BLOCK
    )
    :vars
    (
      ?auto_63783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63782 ?auto_63783 ) ( ON-TABLE ?auto_63778 ) ( ON ?auto_63779 ?auto_63778 ) ( ON ?auto_63780 ?auto_63779 ) ( not ( = ?auto_63778 ?auto_63779 ) ) ( not ( = ?auto_63778 ?auto_63780 ) ) ( not ( = ?auto_63778 ?auto_63781 ) ) ( not ( = ?auto_63778 ?auto_63782 ) ) ( not ( = ?auto_63778 ?auto_63783 ) ) ( not ( = ?auto_63779 ?auto_63780 ) ) ( not ( = ?auto_63779 ?auto_63781 ) ) ( not ( = ?auto_63779 ?auto_63782 ) ) ( not ( = ?auto_63779 ?auto_63783 ) ) ( not ( = ?auto_63780 ?auto_63781 ) ) ( not ( = ?auto_63780 ?auto_63782 ) ) ( not ( = ?auto_63780 ?auto_63783 ) ) ( not ( = ?auto_63781 ?auto_63782 ) ) ( not ( = ?auto_63781 ?auto_63783 ) ) ( not ( = ?auto_63782 ?auto_63783 ) ) ( CLEAR ?auto_63780 ) ( ON ?auto_63781 ?auto_63782 ) ( CLEAR ?auto_63781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63778 ?auto_63779 ?auto_63780 ?auto_63781 )
      ( MAKE-5PILE ?auto_63778 ?auto_63779 ?auto_63780 ?auto_63781 ?auto_63782 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63789 - BLOCK
      ?auto_63790 - BLOCK
      ?auto_63791 - BLOCK
      ?auto_63792 - BLOCK
      ?auto_63793 - BLOCK
    )
    :vars
    (
      ?auto_63794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63793 ?auto_63794 ) ( ON-TABLE ?auto_63789 ) ( ON ?auto_63790 ?auto_63789 ) ( not ( = ?auto_63789 ?auto_63790 ) ) ( not ( = ?auto_63789 ?auto_63791 ) ) ( not ( = ?auto_63789 ?auto_63792 ) ) ( not ( = ?auto_63789 ?auto_63793 ) ) ( not ( = ?auto_63789 ?auto_63794 ) ) ( not ( = ?auto_63790 ?auto_63791 ) ) ( not ( = ?auto_63790 ?auto_63792 ) ) ( not ( = ?auto_63790 ?auto_63793 ) ) ( not ( = ?auto_63790 ?auto_63794 ) ) ( not ( = ?auto_63791 ?auto_63792 ) ) ( not ( = ?auto_63791 ?auto_63793 ) ) ( not ( = ?auto_63791 ?auto_63794 ) ) ( not ( = ?auto_63792 ?auto_63793 ) ) ( not ( = ?auto_63792 ?auto_63794 ) ) ( not ( = ?auto_63793 ?auto_63794 ) ) ( ON ?auto_63792 ?auto_63793 ) ( CLEAR ?auto_63790 ) ( ON ?auto_63791 ?auto_63792 ) ( CLEAR ?auto_63791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63789 ?auto_63790 ?auto_63791 )
      ( MAKE-5PILE ?auto_63789 ?auto_63790 ?auto_63791 ?auto_63792 ?auto_63793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63800 - BLOCK
      ?auto_63801 - BLOCK
      ?auto_63802 - BLOCK
      ?auto_63803 - BLOCK
      ?auto_63804 - BLOCK
    )
    :vars
    (
      ?auto_63805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63804 ?auto_63805 ) ( ON-TABLE ?auto_63800 ) ( ON ?auto_63801 ?auto_63800 ) ( not ( = ?auto_63800 ?auto_63801 ) ) ( not ( = ?auto_63800 ?auto_63802 ) ) ( not ( = ?auto_63800 ?auto_63803 ) ) ( not ( = ?auto_63800 ?auto_63804 ) ) ( not ( = ?auto_63800 ?auto_63805 ) ) ( not ( = ?auto_63801 ?auto_63802 ) ) ( not ( = ?auto_63801 ?auto_63803 ) ) ( not ( = ?auto_63801 ?auto_63804 ) ) ( not ( = ?auto_63801 ?auto_63805 ) ) ( not ( = ?auto_63802 ?auto_63803 ) ) ( not ( = ?auto_63802 ?auto_63804 ) ) ( not ( = ?auto_63802 ?auto_63805 ) ) ( not ( = ?auto_63803 ?auto_63804 ) ) ( not ( = ?auto_63803 ?auto_63805 ) ) ( not ( = ?auto_63804 ?auto_63805 ) ) ( ON ?auto_63803 ?auto_63804 ) ( CLEAR ?auto_63801 ) ( ON ?auto_63802 ?auto_63803 ) ( CLEAR ?auto_63802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63800 ?auto_63801 ?auto_63802 )
      ( MAKE-5PILE ?auto_63800 ?auto_63801 ?auto_63802 ?auto_63803 ?auto_63804 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63811 - BLOCK
      ?auto_63812 - BLOCK
      ?auto_63813 - BLOCK
      ?auto_63814 - BLOCK
      ?auto_63815 - BLOCK
    )
    :vars
    (
      ?auto_63816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63815 ?auto_63816 ) ( ON-TABLE ?auto_63811 ) ( not ( = ?auto_63811 ?auto_63812 ) ) ( not ( = ?auto_63811 ?auto_63813 ) ) ( not ( = ?auto_63811 ?auto_63814 ) ) ( not ( = ?auto_63811 ?auto_63815 ) ) ( not ( = ?auto_63811 ?auto_63816 ) ) ( not ( = ?auto_63812 ?auto_63813 ) ) ( not ( = ?auto_63812 ?auto_63814 ) ) ( not ( = ?auto_63812 ?auto_63815 ) ) ( not ( = ?auto_63812 ?auto_63816 ) ) ( not ( = ?auto_63813 ?auto_63814 ) ) ( not ( = ?auto_63813 ?auto_63815 ) ) ( not ( = ?auto_63813 ?auto_63816 ) ) ( not ( = ?auto_63814 ?auto_63815 ) ) ( not ( = ?auto_63814 ?auto_63816 ) ) ( not ( = ?auto_63815 ?auto_63816 ) ) ( ON ?auto_63814 ?auto_63815 ) ( ON ?auto_63813 ?auto_63814 ) ( CLEAR ?auto_63811 ) ( ON ?auto_63812 ?auto_63813 ) ( CLEAR ?auto_63812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63811 ?auto_63812 )
      ( MAKE-5PILE ?auto_63811 ?auto_63812 ?auto_63813 ?auto_63814 ?auto_63815 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63822 - BLOCK
      ?auto_63823 - BLOCK
      ?auto_63824 - BLOCK
      ?auto_63825 - BLOCK
      ?auto_63826 - BLOCK
    )
    :vars
    (
      ?auto_63827 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63826 ?auto_63827 ) ( ON-TABLE ?auto_63822 ) ( not ( = ?auto_63822 ?auto_63823 ) ) ( not ( = ?auto_63822 ?auto_63824 ) ) ( not ( = ?auto_63822 ?auto_63825 ) ) ( not ( = ?auto_63822 ?auto_63826 ) ) ( not ( = ?auto_63822 ?auto_63827 ) ) ( not ( = ?auto_63823 ?auto_63824 ) ) ( not ( = ?auto_63823 ?auto_63825 ) ) ( not ( = ?auto_63823 ?auto_63826 ) ) ( not ( = ?auto_63823 ?auto_63827 ) ) ( not ( = ?auto_63824 ?auto_63825 ) ) ( not ( = ?auto_63824 ?auto_63826 ) ) ( not ( = ?auto_63824 ?auto_63827 ) ) ( not ( = ?auto_63825 ?auto_63826 ) ) ( not ( = ?auto_63825 ?auto_63827 ) ) ( not ( = ?auto_63826 ?auto_63827 ) ) ( ON ?auto_63825 ?auto_63826 ) ( ON ?auto_63824 ?auto_63825 ) ( CLEAR ?auto_63822 ) ( ON ?auto_63823 ?auto_63824 ) ( CLEAR ?auto_63823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63822 ?auto_63823 )
      ( MAKE-5PILE ?auto_63822 ?auto_63823 ?auto_63824 ?auto_63825 ?auto_63826 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63833 - BLOCK
      ?auto_63834 - BLOCK
      ?auto_63835 - BLOCK
      ?auto_63836 - BLOCK
      ?auto_63837 - BLOCK
    )
    :vars
    (
      ?auto_63838 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63837 ?auto_63838 ) ( not ( = ?auto_63833 ?auto_63834 ) ) ( not ( = ?auto_63833 ?auto_63835 ) ) ( not ( = ?auto_63833 ?auto_63836 ) ) ( not ( = ?auto_63833 ?auto_63837 ) ) ( not ( = ?auto_63833 ?auto_63838 ) ) ( not ( = ?auto_63834 ?auto_63835 ) ) ( not ( = ?auto_63834 ?auto_63836 ) ) ( not ( = ?auto_63834 ?auto_63837 ) ) ( not ( = ?auto_63834 ?auto_63838 ) ) ( not ( = ?auto_63835 ?auto_63836 ) ) ( not ( = ?auto_63835 ?auto_63837 ) ) ( not ( = ?auto_63835 ?auto_63838 ) ) ( not ( = ?auto_63836 ?auto_63837 ) ) ( not ( = ?auto_63836 ?auto_63838 ) ) ( not ( = ?auto_63837 ?auto_63838 ) ) ( ON ?auto_63836 ?auto_63837 ) ( ON ?auto_63835 ?auto_63836 ) ( ON ?auto_63834 ?auto_63835 ) ( ON ?auto_63833 ?auto_63834 ) ( CLEAR ?auto_63833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63833 )
      ( MAKE-5PILE ?auto_63833 ?auto_63834 ?auto_63835 ?auto_63836 ?auto_63837 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63844 - BLOCK
      ?auto_63845 - BLOCK
      ?auto_63846 - BLOCK
      ?auto_63847 - BLOCK
      ?auto_63848 - BLOCK
    )
    :vars
    (
      ?auto_63849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63848 ?auto_63849 ) ( not ( = ?auto_63844 ?auto_63845 ) ) ( not ( = ?auto_63844 ?auto_63846 ) ) ( not ( = ?auto_63844 ?auto_63847 ) ) ( not ( = ?auto_63844 ?auto_63848 ) ) ( not ( = ?auto_63844 ?auto_63849 ) ) ( not ( = ?auto_63845 ?auto_63846 ) ) ( not ( = ?auto_63845 ?auto_63847 ) ) ( not ( = ?auto_63845 ?auto_63848 ) ) ( not ( = ?auto_63845 ?auto_63849 ) ) ( not ( = ?auto_63846 ?auto_63847 ) ) ( not ( = ?auto_63846 ?auto_63848 ) ) ( not ( = ?auto_63846 ?auto_63849 ) ) ( not ( = ?auto_63847 ?auto_63848 ) ) ( not ( = ?auto_63847 ?auto_63849 ) ) ( not ( = ?auto_63848 ?auto_63849 ) ) ( ON ?auto_63847 ?auto_63848 ) ( ON ?auto_63846 ?auto_63847 ) ( ON ?auto_63845 ?auto_63846 ) ( ON ?auto_63844 ?auto_63845 ) ( CLEAR ?auto_63844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63844 )
      ( MAKE-5PILE ?auto_63844 ?auto_63845 ?auto_63846 ?auto_63847 ?auto_63848 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63856 - BLOCK
      ?auto_63857 - BLOCK
      ?auto_63858 - BLOCK
      ?auto_63859 - BLOCK
      ?auto_63860 - BLOCK
      ?auto_63861 - BLOCK
    )
    :vars
    (
      ?auto_63862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63860 ) ( ON ?auto_63861 ?auto_63862 ) ( CLEAR ?auto_63861 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63856 ) ( ON ?auto_63857 ?auto_63856 ) ( ON ?auto_63858 ?auto_63857 ) ( ON ?auto_63859 ?auto_63858 ) ( ON ?auto_63860 ?auto_63859 ) ( not ( = ?auto_63856 ?auto_63857 ) ) ( not ( = ?auto_63856 ?auto_63858 ) ) ( not ( = ?auto_63856 ?auto_63859 ) ) ( not ( = ?auto_63856 ?auto_63860 ) ) ( not ( = ?auto_63856 ?auto_63861 ) ) ( not ( = ?auto_63856 ?auto_63862 ) ) ( not ( = ?auto_63857 ?auto_63858 ) ) ( not ( = ?auto_63857 ?auto_63859 ) ) ( not ( = ?auto_63857 ?auto_63860 ) ) ( not ( = ?auto_63857 ?auto_63861 ) ) ( not ( = ?auto_63857 ?auto_63862 ) ) ( not ( = ?auto_63858 ?auto_63859 ) ) ( not ( = ?auto_63858 ?auto_63860 ) ) ( not ( = ?auto_63858 ?auto_63861 ) ) ( not ( = ?auto_63858 ?auto_63862 ) ) ( not ( = ?auto_63859 ?auto_63860 ) ) ( not ( = ?auto_63859 ?auto_63861 ) ) ( not ( = ?auto_63859 ?auto_63862 ) ) ( not ( = ?auto_63860 ?auto_63861 ) ) ( not ( = ?auto_63860 ?auto_63862 ) ) ( not ( = ?auto_63861 ?auto_63862 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63861 ?auto_63862 )
      ( !STACK ?auto_63861 ?auto_63860 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63869 - BLOCK
      ?auto_63870 - BLOCK
      ?auto_63871 - BLOCK
      ?auto_63872 - BLOCK
      ?auto_63873 - BLOCK
      ?auto_63874 - BLOCK
    )
    :vars
    (
      ?auto_63875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63873 ) ( ON ?auto_63874 ?auto_63875 ) ( CLEAR ?auto_63874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63869 ) ( ON ?auto_63870 ?auto_63869 ) ( ON ?auto_63871 ?auto_63870 ) ( ON ?auto_63872 ?auto_63871 ) ( ON ?auto_63873 ?auto_63872 ) ( not ( = ?auto_63869 ?auto_63870 ) ) ( not ( = ?auto_63869 ?auto_63871 ) ) ( not ( = ?auto_63869 ?auto_63872 ) ) ( not ( = ?auto_63869 ?auto_63873 ) ) ( not ( = ?auto_63869 ?auto_63874 ) ) ( not ( = ?auto_63869 ?auto_63875 ) ) ( not ( = ?auto_63870 ?auto_63871 ) ) ( not ( = ?auto_63870 ?auto_63872 ) ) ( not ( = ?auto_63870 ?auto_63873 ) ) ( not ( = ?auto_63870 ?auto_63874 ) ) ( not ( = ?auto_63870 ?auto_63875 ) ) ( not ( = ?auto_63871 ?auto_63872 ) ) ( not ( = ?auto_63871 ?auto_63873 ) ) ( not ( = ?auto_63871 ?auto_63874 ) ) ( not ( = ?auto_63871 ?auto_63875 ) ) ( not ( = ?auto_63872 ?auto_63873 ) ) ( not ( = ?auto_63872 ?auto_63874 ) ) ( not ( = ?auto_63872 ?auto_63875 ) ) ( not ( = ?auto_63873 ?auto_63874 ) ) ( not ( = ?auto_63873 ?auto_63875 ) ) ( not ( = ?auto_63874 ?auto_63875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63874 ?auto_63875 )
      ( !STACK ?auto_63874 ?auto_63873 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63882 - BLOCK
      ?auto_63883 - BLOCK
      ?auto_63884 - BLOCK
      ?auto_63885 - BLOCK
      ?auto_63886 - BLOCK
      ?auto_63887 - BLOCK
    )
    :vars
    (
      ?auto_63888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63887 ?auto_63888 ) ( ON-TABLE ?auto_63882 ) ( ON ?auto_63883 ?auto_63882 ) ( ON ?auto_63884 ?auto_63883 ) ( ON ?auto_63885 ?auto_63884 ) ( not ( = ?auto_63882 ?auto_63883 ) ) ( not ( = ?auto_63882 ?auto_63884 ) ) ( not ( = ?auto_63882 ?auto_63885 ) ) ( not ( = ?auto_63882 ?auto_63886 ) ) ( not ( = ?auto_63882 ?auto_63887 ) ) ( not ( = ?auto_63882 ?auto_63888 ) ) ( not ( = ?auto_63883 ?auto_63884 ) ) ( not ( = ?auto_63883 ?auto_63885 ) ) ( not ( = ?auto_63883 ?auto_63886 ) ) ( not ( = ?auto_63883 ?auto_63887 ) ) ( not ( = ?auto_63883 ?auto_63888 ) ) ( not ( = ?auto_63884 ?auto_63885 ) ) ( not ( = ?auto_63884 ?auto_63886 ) ) ( not ( = ?auto_63884 ?auto_63887 ) ) ( not ( = ?auto_63884 ?auto_63888 ) ) ( not ( = ?auto_63885 ?auto_63886 ) ) ( not ( = ?auto_63885 ?auto_63887 ) ) ( not ( = ?auto_63885 ?auto_63888 ) ) ( not ( = ?auto_63886 ?auto_63887 ) ) ( not ( = ?auto_63886 ?auto_63888 ) ) ( not ( = ?auto_63887 ?auto_63888 ) ) ( CLEAR ?auto_63885 ) ( ON ?auto_63886 ?auto_63887 ) ( CLEAR ?auto_63886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63882 ?auto_63883 ?auto_63884 ?auto_63885 ?auto_63886 )
      ( MAKE-6PILE ?auto_63882 ?auto_63883 ?auto_63884 ?auto_63885 ?auto_63886 ?auto_63887 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63895 - BLOCK
      ?auto_63896 - BLOCK
      ?auto_63897 - BLOCK
      ?auto_63898 - BLOCK
      ?auto_63899 - BLOCK
      ?auto_63900 - BLOCK
    )
    :vars
    (
      ?auto_63901 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63900 ?auto_63901 ) ( ON-TABLE ?auto_63895 ) ( ON ?auto_63896 ?auto_63895 ) ( ON ?auto_63897 ?auto_63896 ) ( ON ?auto_63898 ?auto_63897 ) ( not ( = ?auto_63895 ?auto_63896 ) ) ( not ( = ?auto_63895 ?auto_63897 ) ) ( not ( = ?auto_63895 ?auto_63898 ) ) ( not ( = ?auto_63895 ?auto_63899 ) ) ( not ( = ?auto_63895 ?auto_63900 ) ) ( not ( = ?auto_63895 ?auto_63901 ) ) ( not ( = ?auto_63896 ?auto_63897 ) ) ( not ( = ?auto_63896 ?auto_63898 ) ) ( not ( = ?auto_63896 ?auto_63899 ) ) ( not ( = ?auto_63896 ?auto_63900 ) ) ( not ( = ?auto_63896 ?auto_63901 ) ) ( not ( = ?auto_63897 ?auto_63898 ) ) ( not ( = ?auto_63897 ?auto_63899 ) ) ( not ( = ?auto_63897 ?auto_63900 ) ) ( not ( = ?auto_63897 ?auto_63901 ) ) ( not ( = ?auto_63898 ?auto_63899 ) ) ( not ( = ?auto_63898 ?auto_63900 ) ) ( not ( = ?auto_63898 ?auto_63901 ) ) ( not ( = ?auto_63899 ?auto_63900 ) ) ( not ( = ?auto_63899 ?auto_63901 ) ) ( not ( = ?auto_63900 ?auto_63901 ) ) ( CLEAR ?auto_63898 ) ( ON ?auto_63899 ?auto_63900 ) ( CLEAR ?auto_63899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63895 ?auto_63896 ?auto_63897 ?auto_63898 ?auto_63899 )
      ( MAKE-6PILE ?auto_63895 ?auto_63896 ?auto_63897 ?auto_63898 ?auto_63899 ?auto_63900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63908 - BLOCK
      ?auto_63909 - BLOCK
      ?auto_63910 - BLOCK
      ?auto_63911 - BLOCK
      ?auto_63912 - BLOCK
      ?auto_63913 - BLOCK
    )
    :vars
    (
      ?auto_63914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63913 ?auto_63914 ) ( ON-TABLE ?auto_63908 ) ( ON ?auto_63909 ?auto_63908 ) ( ON ?auto_63910 ?auto_63909 ) ( not ( = ?auto_63908 ?auto_63909 ) ) ( not ( = ?auto_63908 ?auto_63910 ) ) ( not ( = ?auto_63908 ?auto_63911 ) ) ( not ( = ?auto_63908 ?auto_63912 ) ) ( not ( = ?auto_63908 ?auto_63913 ) ) ( not ( = ?auto_63908 ?auto_63914 ) ) ( not ( = ?auto_63909 ?auto_63910 ) ) ( not ( = ?auto_63909 ?auto_63911 ) ) ( not ( = ?auto_63909 ?auto_63912 ) ) ( not ( = ?auto_63909 ?auto_63913 ) ) ( not ( = ?auto_63909 ?auto_63914 ) ) ( not ( = ?auto_63910 ?auto_63911 ) ) ( not ( = ?auto_63910 ?auto_63912 ) ) ( not ( = ?auto_63910 ?auto_63913 ) ) ( not ( = ?auto_63910 ?auto_63914 ) ) ( not ( = ?auto_63911 ?auto_63912 ) ) ( not ( = ?auto_63911 ?auto_63913 ) ) ( not ( = ?auto_63911 ?auto_63914 ) ) ( not ( = ?auto_63912 ?auto_63913 ) ) ( not ( = ?auto_63912 ?auto_63914 ) ) ( not ( = ?auto_63913 ?auto_63914 ) ) ( ON ?auto_63912 ?auto_63913 ) ( CLEAR ?auto_63910 ) ( ON ?auto_63911 ?auto_63912 ) ( CLEAR ?auto_63911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63908 ?auto_63909 ?auto_63910 ?auto_63911 )
      ( MAKE-6PILE ?auto_63908 ?auto_63909 ?auto_63910 ?auto_63911 ?auto_63912 ?auto_63913 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63921 - BLOCK
      ?auto_63922 - BLOCK
      ?auto_63923 - BLOCK
      ?auto_63924 - BLOCK
      ?auto_63925 - BLOCK
      ?auto_63926 - BLOCK
    )
    :vars
    (
      ?auto_63927 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63926 ?auto_63927 ) ( ON-TABLE ?auto_63921 ) ( ON ?auto_63922 ?auto_63921 ) ( ON ?auto_63923 ?auto_63922 ) ( not ( = ?auto_63921 ?auto_63922 ) ) ( not ( = ?auto_63921 ?auto_63923 ) ) ( not ( = ?auto_63921 ?auto_63924 ) ) ( not ( = ?auto_63921 ?auto_63925 ) ) ( not ( = ?auto_63921 ?auto_63926 ) ) ( not ( = ?auto_63921 ?auto_63927 ) ) ( not ( = ?auto_63922 ?auto_63923 ) ) ( not ( = ?auto_63922 ?auto_63924 ) ) ( not ( = ?auto_63922 ?auto_63925 ) ) ( not ( = ?auto_63922 ?auto_63926 ) ) ( not ( = ?auto_63922 ?auto_63927 ) ) ( not ( = ?auto_63923 ?auto_63924 ) ) ( not ( = ?auto_63923 ?auto_63925 ) ) ( not ( = ?auto_63923 ?auto_63926 ) ) ( not ( = ?auto_63923 ?auto_63927 ) ) ( not ( = ?auto_63924 ?auto_63925 ) ) ( not ( = ?auto_63924 ?auto_63926 ) ) ( not ( = ?auto_63924 ?auto_63927 ) ) ( not ( = ?auto_63925 ?auto_63926 ) ) ( not ( = ?auto_63925 ?auto_63927 ) ) ( not ( = ?auto_63926 ?auto_63927 ) ) ( ON ?auto_63925 ?auto_63926 ) ( CLEAR ?auto_63923 ) ( ON ?auto_63924 ?auto_63925 ) ( CLEAR ?auto_63924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63921 ?auto_63922 ?auto_63923 ?auto_63924 )
      ( MAKE-6PILE ?auto_63921 ?auto_63922 ?auto_63923 ?auto_63924 ?auto_63925 ?auto_63926 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63934 - BLOCK
      ?auto_63935 - BLOCK
      ?auto_63936 - BLOCK
      ?auto_63937 - BLOCK
      ?auto_63938 - BLOCK
      ?auto_63939 - BLOCK
    )
    :vars
    (
      ?auto_63940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63939 ?auto_63940 ) ( ON-TABLE ?auto_63934 ) ( ON ?auto_63935 ?auto_63934 ) ( not ( = ?auto_63934 ?auto_63935 ) ) ( not ( = ?auto_63934 ?auto_63936 ) ) ( not ( = ?auto_63934 ?auto_63937 ) ) ( not ( = ?auto_63934 ?auto_63938 ) ) ( not ( = ?auto_63934 ?auto_63939 ) ) ( not ( = ?auto_63934 ?auto_63940 ) ) ( not ( = ?auto_63935 ?auto_63936 ) ) ( not ( = ?auto_63935 ?auto_63937 ) ) ( not ( = ?auto_63935 ?auto_63938 ) ) ( not ( = ?auto_63935 ?auto_63939 ) ) ( not ( = ?auto_63935 ?auto_63940 ) ) ( not ( = ?auto_63936 ?auto_63937 ) ) ( not ( = ?auto_63936 ?auto_63938 ) ) ( not ( = ?auto_63936 ?auto_63939 ) ) ( not ( = ?auto_63936 ?auto_63940 ) ) ( not ( = ?auto_63937 ?auto_63938 ) ) ( not ( = ?auto_63937 ?auto_63939 ) ) ( not ( = ?auto_63937 ?auto_63940 ) ) ( not ( = ?auto_63938 ?auto_63939 ) ) ( not ( = ?auto_63938 ?auto_63940 ) ) ( not ( = ?auto_63939 ?auto_63940 ) ) ( ON ?auto_63938 ?auto_63939 ) ( ON ?auto_63937 ?auto_63938 ) ( CLEAR ?auto_63935 ) ( ON ?auto_63936 ?auto_63937 ) ( CLEAR ?auto_63936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63934 ?auto_63935 ?auto_63936 )
      ( MAKE-6PILE ?auto_63934 ?auto_63935 ?auto_63936 ?auto_63937 ?auto_63938 ?auto_63939 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63947 - BLOCK
      ?auto_63948 - BLOCK
      ?auto_63949 - BLOCK
      ?auto_63950 - BLOCK
      ?auto_63951 - BLOCK
      ?auto_63952 - BLOCK
    )
    :vars
    (
      ?auto_63953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63952 ?auto_63953 ) ( ON-TABLE ?auto_63947 ) ( ON ?auto_63948 ?auto_63947 ) ( not ( = ?auto_63947 ?auto_63948 ) ) ( not ( = ?auto_63947 ?auto_63949 ) ) ( not ( = ?auto_63947 ?auto_63950 ) ) ( not ( = ?auto_63947 ?auto_63951 ) ) ( not ( = ?auto_63947 ?auto_63952 ) ) ( not ( = ?auto_63947 ?auto_63953 ) ) ( not ( = ?auto_63948 ?auto_63949 ) ) ( not ( = ?auto_63948 ?auto_63950 ) ) ( not ( = ?auto_63948 ?auto_63951 ) ) ( not ( = ?auto_63948 ?auto_63952 ) ) ( not ( = ?auto_63948 ?auto_63953 ) ) ( not ( = ?auto_63949 ?auto_63950 ) ) ( not ( = ?auto_63949 ?auto_63951 ) ) ( not ( = ?auto_63949 ?auto_63952 ) ) ( not ( = ?auto_63949 ?auto_63953 ) ) ( not ( = ?auto_63950 ?auto_63951 ) ) ( not ( = ?auto_63950 ?auto_63952 ) ) ( not ( = ?auto_63950 ?auto_63953 ) ) ( not ( = ?auto_63951 ?auto_63952 ) ) ( not ( = ?auto_63951 ?auto_63953 ) ) ( not ( = ?auto_63952 ?auto_63953 ) ) ( ON ?auto_63951 ?auto_63952 ) ( ON ?auto_63950 ?auto_63951 ) ( CLEAR ?auto_63948 ) ( ON ?auto_63949 ?auto_63950 ) ( CLEAR ?auto_63949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63947 ?auto_63948 ?auto_63949 )
      ( MAKE-6PILE ?auto_63947 ?auto_63948 ?auto_63949 ?auto_63950 ?auto_63951 ?auto_63952 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63960 - BLOCK
      ?auto_63961 - BLOCK
      ?auto_63962 - BLOCK
      ?auto_63963 - BLOCK
      ?auto_63964 - BLOCK
      ?auto_63965 - BLOCK
    )
    :vars
    (
      ?auto_63966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63965 ?auto_63966 ) ( ON-TABLE ?auto_63960 ) ( not ( = ?auto_63960 ?auto_63961 ) ) ( not ( = ?auto_63960 ?auto_63962 ) ) ( not ( = ?auto_63960 ?auto_63963 ) ) ( not ( = ?auto_63960 ?auto_63964 ) ) ( not ( = ?auto_63960 ?auto_63965 ) ) ( not ( = ?auto_63960 ?auto_63966 ) ) ( not ( = ?auto_63961 ?auto_63962 ) ) ( not ( = ?auto_63961 ?auto_63963 ) ) ( not ( = ?auto_63961 ?auto_63964 ) ) ( not ( = ?auto_63961 ?auto_63965 ) ) ( not ( = ?auto_63961 ?auto_63966 ) ) ( not ( = ?auto_63962 ?auto_63963 ) ) ( not ( = ?auto_63962 ?auto_63964 ) ) ( not ( = ?auto_63962 ?auto_63965 ) ) ( not ( = ?auto_63962 ?auto_63966 ) ) ( not ( = ?auto_63963 ?auto_63964 ) ) ( not ( = ?auto_63963 ?auto_63965 ) ) ( not ( = ?auto_63963 ?auto_63966 ) ) ( not ( = ?auto_63964 ?auto_63965 ) ) ( not ( = ?auto_63964 ?auto_63966 ) ) ( not ( = ?auto_63965 ?auto_63966 ) ) ( ON ?auto_63964 ?auto_63965 ) ( ON ?auto_63963 ?auto_63964 ) ( ON ?auto_63962 ?auto_63963 ) ( CLEAR ?auto_63960 ) ( ON ?auto_63961 ?auto_63962 ) ( CLEAR ?auto_63961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63960 ?auto_63961 )
      ( MAKE-6PILE ?auto_63960 ?auto_63961 ?auto_63962 ?auto_63963 ?auto_63964 ?auto_63965 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63973 - BLOCK
      ?auto_63974 - BLOCK
      ?auto_63975 - BLOCK
      ?auto_63976 - BLOCK
      ?auto_63977 - BLOCK
      ?auto_63978 - BLOCK
    )
    :vars
    (
      ?auto_63979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63978 ?auto_63979 ) ( ON-TABLE ?auto_63973 ) ( not ( = ?auto_63973 ?auto_63974 ) ) ( not ( = ?auto_63973 ?auto_63975 ) ) ( not ( = ?auto_63973 ?auto_63976 ) ) ( not ( = ?auto_63973 ?auto_63977 ) ) ( not ( = ?auto_63973 ?auto_63978 ) ) ( not ( = ?auto_63973 ?auto_63979 ) ) ( not ( = ?auto_63974 ?auto_63975 ) ) ( not ( = ?auto_63974 ?auto_63976 ) ) ( not ( = ?auto_63974 ?auto_63977 ) ) ( not ( = ?auto_63974 ?auto_63978 ) ) ( not ( = ?auto_63974 ?auto_63979 ) ) ( not ( = ?auto_63975 ?auto_63976 ) ) ( not ( = ?auto_63975 ?auto_63977 ) ) ( not ( = ?auto_63975 ?auto_63978 ) ) ( not ( = ?auto_63975 ?auto_63979 ) ) ( not ( = ?auto_63976 ?auto_63977 ) ) ( not ( = ?auto_63976 ?auto_63978 ) ) ( not ( = ?auto_63976 ?auto_63979 ) ) ( not ( = ?auto_63977 ?auto_63978 ) ) ( not ( = ?auto_63977 ?auto_63979 ) ) ( not ( = ?auto_63978 ?auto_63979 ) ) ( ON ?auto_63977 ?auto_63978 ) ( ON ?auto_63976 ?auto_63977 ) ( ON ?auto_63975 ?auto_63976 ) ( CLEAR ?auto_63973 ) ( ON ?auto_63974 ?auto_63975 ) ( CLEAR ?auto_63974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63973 ?auto_63974 )
      ( MAKE-6PILE ?auto_63973 ?auto_63974 ?auto_63975 ?auto_63976 ?auto_63977 ?auto_63978 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63986 - BLOCK
      ?auto_63987 - BLOCK
      ?auto_63988 - BLOCK
      ?auto_63989 - BLOCK
      ?auto_63990 - BLOCK
      ?auto_63991 - BLOCK
    )
    :vars
    (
      ?auto_63992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63991 ?auto_63992 ) ( not ( = ?auto_63986 ?auto_63987 ) ) ( not ( = ?auto_63986 ?auto_63988 ) ) ( not ( = ?auto_63986 ?auto_63989 ) ) ( not ( = ?auto_63986 ?auto_63990 ) ) ( not ( = ?auto_63986 ?auto_63991 ) ) ( not ( = ?auto_63986 ?auto_63992 ) ) ( not ( = ?auto_63987 ?auto_63988 ) ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( not ( = ?auto_63987 ?auto_63990 ) ) ( not ( = ?auto_63987 ?auto_63991 ) ) ( not ( = ?auto_63987 ?auto_63992 ) ) ( not ( = ?auto_63988 ?auto_63989 ) ) ( not ( = ?auto_63988 ?auto_63990 ) ) ( not ( = ?auto_63988 ?auto_63991 ) ) ( not ( = ?auto_63988 ?auto_63992 ) ) ( not ( = ?auto_63989 ?auto_63990 ) ) ( not ( = ?auto_63989 ?auto_63991 ) ) ( not ( = ?auto_63989 ?auto_63992 ) ) ( not ( = ?auto_63990 ?auto_63991 ) ) ( not ( = ?auto_63990 ?auto_63992 ) ) ( not ( = ?auto_63991 ?auto_63992 ) ) ( ON ?auto_63990 ?auto_63991 ) ( ON ?auto_63989 ?auto_63990 ) ( ON ?auto_63988 ?auto_63989 ) ( ON ?auto_63987 ?auto_63988 ) ( ON ?auto_63986 ?auto_63987 ) ( CLEAR ?auto_63986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63986 )
      ( MAKE-6PILE ?auto_63986 ?auto_63987 ?auto_63988 ?auto_63989 ?auto_63990 ?auto_63991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63999 - BLOCK
      ?auto_64000 - BLOCK
      ?auto_64001 - BLOCK
      ?auto_64002 - BLOCK
      ?auto_64003 - BLOCK
      ?auto_64004 - BLOCK
    )
    :vars
    (
      ?auto_64005 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64004 ?auto_64005 ) ( not ( = ?auto_63999 ?auto_64000 ) ) ( not ( = ?auto_63999 ?auto_64001 ) ) ( not ( = ?auto_63999 ?auto_64002 ) ) ( not ( = ?auto_63999 ?auto_64003 ) ) ( not ( = ?auto_63999 ?auto_64004 ) ) ( not ( = ?auto_63999 ?auto_64005 ) ) ( not ( = ?auto_64000 ?auto_64001 ) ) ( not ( = ?auto_64000 ?auto_64002 ) ) ( not ( = ?auto_64000 ?auto_64003 ) ) ( not ( = ?auto_64000 ?auto_64004 ) ) ( not ( = ?auto_64000 ?auto_64005 ) ) ( not ( = ?auto_64001 ?auto_64002 ) ) ( not ( = ?auto_64001 ?auto_64003 ) ) ( not ( = ?auto_64001 ?auto_64004 ) ) ( not ( = ?auto_64001 ?auto_64005 ) ) ( not ( = ?auto_64002 ?auto_64003 ) ) ( not ( = ?auto_64002 ?auto_64004 ) ) ( not ( = ?auto_64002 ?auto_64005 ) ) ( not ( = ?auto_64003 ?auto_64004 ) ) ( not ( = ?auto_64003 ?auto_64005 ) ) ( not ( = ?auto_64004 ?auto_64005 ) ) ( ON ?auto_64003 ?auto_64004 ) ( ON ?auto_64002 ?auto_64003 ) ( ON ?auto_64001 ?auto_64002 ) ( ON ?auto_64000 ?auto_64001 ) ( ON ?auto_63999 ?auto_64000 ) ( CLEAR ?auto_63999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63999 )
      ( MAKE-6PILE ?auto_63999 ?auto_64000 ?auto_64001 ?auto_64002 ?auto_64003 ?auto_64004 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64013 - BLOCK
      ?auto_64014 - BLOCK
      ?auto_64015 - BLOCK
      ?auto_64016 - BLOCK
      ?auto_64017 - BLOCK
      ?auto_64018 - BLOCK
      ?auto_64019 - BLOCK
    )
    :vars
    (
      ?auto_64020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64018 ) ( ON ?auto_64019 ?auto_64020 ) ( CLEAR ?auto_64019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64013 ) ( ON ?auto_64014 ?auto_64013 ) ( ON ?auto_64015 ?auto_64014 ) ( ON ?auto_64016 ?auto_64015 ) ( ON ?auto_64017 ?auto_64016 ) ( ON ?auto_64018 ?auto_64017 ) ( not ( = ?auto_64013 ?auto_64014 ) ) ( not ( = ?auto_64013 ?auto_64015 ) ) ( not ( = ?auto_64013 ?auto_64016 ) ) ( not ( = ?auto_64013 ?auto_64017 ) ) ( not ( = ?auto_64013 ?auto_64018 ) ) ( not ( = ?auto_64013 ?auto_64019 ) ) ( not ( = ?auto_64013 ?auto_64020 ) ) ( not ( = ?auto_64014 ?auto_64015 ) ) ( not ( = ?auto_64014 ?auto_64016 ) ) ( not ( = ?auto_64014 ?auto_64017 ) ) ( not ( = ?auto_64014 ?auto_64018 ) ) ( not ( = ?auto_64014 ?auto_64019 ) ) ( not ( = ?auto_64014 ?auto_64020 ) ) ( not ( = ?auto_64015 ?auto_64016 ) ) ( not ( = ?auto_64015 ?auto_64017 ) ) ( not ( = ?auto_64015 ?auto_64018 ) ) ( not ( = ?auto_64015 ?auto_64019 ) ) ( not ( = ?auto_64015 ?auto_64020 ) ) ( not ( = ?auto_64016 ?auto_64017 ) ) ( not ( = ?auto_64016 ?auto_64018 ) ) ( not ( = ?auto_64016 ?auto_64019 ) ) ( not ( = ?auto_64016 ?auto_64020 ) ) ( not ( = ?auto_64017 ?auto_64018 ) ) ( not ( = ?auto_64017 ?auto_64019 ) ) ( not ( = ?auto_64017 ?auto_64020 ) ) ( not ( = ?auto_64018 ?auto_64019 ) ) ( not ( = ?auto_64018 ?auto_64020 ) ) ( not ( = ?auto_64019 ?auto_64020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64019 ?auto_64020 )
      ( !STACK ?auto_64019 ?auto_64018 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64028 - BLOCK
      ?auto_64029 - BLOCK
      ?auto_64030 - BLOCK
      ?auto_64031 - BLOCK
      ?auto_64032 - BLOCK
      ?auto_64033 - BLOCK
      ?auto_64034 - BLOCK
    )
    :vars
    (
      ?auto_64035 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64033 ) ( ON ?auto_64034 ?auto_64035 ) ( CLEAR ?auto_64034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64028 ) ( ON ?auto_64029 ?auto_64028 ) ( ON ?auto_64030 ?auto_64029 ) ( ON ?auto_64031 ?auto_64030 ) ( ON ?auto_64032 ?auto_64031 ) ( ON ?auto_64033 ?auto_64032 ) ( not ( = ?auto_64028 ?auto_64029 ) ) ( not ( = ?auto_64028 ?auto_64030 ) ) ( not ( = ?auto_64028 ?auto_64031 ) ) ( not ( = ?auto_64028 ?auto_64032 ) ) ( not ( = ?auto_64028 ?auto_64033 ) ) ( not ( = ?auto_64028 ?auto_64034 ) ) ( not ( = ?auto_64028 ?auto_64035 ) ) ( not ( = ?auto_64029 ?auto_64030 ) ) ( not ( = ?auto_64029 ?auto_64031 ) ) ( not ( = ?auto_64029 ?auto_64032 ) ) ( not ( = ?auto_64029 ?auto_64033 ) ) ( not ( = ?auto_64029 ?auto_64034 ) ) ( not ( = ?auto_64029 ?auto_64035 ) ) ( not ( = ?auto_64030 ?auto_64031 ) ) ( not ( = ?auto_64030 ?auto_64032 ) ) ( not ( = ?auto_64030 ?auto_64033 ) ) ( not ( = ?auto_64030 ?auto_64034 ) ) ( not ( = ?auto_64030 ?auto_64035 ) ) ( not ( = ?auto_64031 ?auto_64032 ) ) ( not ( = ?auto_64031 ?auto_64033 ) ) ( not ( = ?auto_64031 ?auto_64034 ) ) ( not ( = ?auto_64031 ?auto_64035 ) ) ( not ( = ?auto_64032 ?auto_64033 ) ) ( not ( = ?auto_64032 ?auto_64034 ) ) ( not ( = ?auto_64032 ?auto_64035 ) ) ( not ( = ?auto_64033 ?auto_64034 ) ) ( not ( = ?auto_64033 ?auto_64035 ) ) ( not ( = ?auto_64034 ?auto_64035 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64034 ?auto_64035 )
      ( !STACK ?auto_64034 ?auto_64033 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64043 - BLOCK
      ?auto_64044 - BLOCK
      ?auto_64045 - BLOCK
      ?auto_64046 - BLOCK
      ?auto_64047 - BLOCK
      ?auto_64048 - BLOCK
      ?auto_64049 - BLOCK
    )
    :vars
    (
      ?auto_64050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64049 ?auto_64050 ) ( ON-TABLE ?auto_64043 ) ( ON ?auto_64044 ?auto_64043 ) ( ON ?auto_64045 ?auto_64044 ) ( ON ?auto_64046 ?auto_64045 ) ( ON ?auto_64047 ?auto_64046 ) ( not ( = ?auto_64043 ?auto_64044 ) ) ( not ( = ?auto_64043 ?auto_64045 ) ) ( not ( = ?auto_64043 ?auto_64046 ) ) ( not ( = ?auto_64043 ?auto_64047 ) ) ( not ( = ?auto_64043 ?auto_64048 ) ) ( not ( = ?auto_64043 ?auto_64049 ) ) ( not ( = ?auto_64043 ?auto_64050 ) ) ( not ( = ?auto_64044 ?auto_64045 ) ) ( not ( = ?auto_64044 ?auto_64046 ) ) ( not ( = ?auto_64044 ?auto_64047 ) ) ( not ( = ?auto_64044 ?auto_64048 ) ) ( not ( = ?auto_64044 ?auto_64049 ) ) ( not ( = ?auto_64044 ?auto_64050 ) ) ( not ( = ?auto_64045 ?auto_64046 ) ) ( not ( = ?auto_64045 ?auto_64047 ) ) ( not ( = ?auto_64045 ?auto_64048 ) ) ( not ( = ?auto_64045 ?auto_64049 ) ) ( not ( = ?auto_64045 ?auto_64050 ) ) ( not ( = ?auto_64046 ?auto_64047 ) ) ( not ( = ?auto_64046 ?auto_64048 ) ) ( not ( = ?auto_64046 ?auto_64049 ) ) ( not ( = ?auto_64046 ?auto_64050 ) ) ( not ( = ?auto_64047 ?auto_64048 ) ) ( not ( = ?auto_64047 ?auto_64049 ) ) ( not ( = ?auto_64047 ?auto_64050 ) ) ( not ( = ?auto_64048 ?auto_64049 ) ) ( not ( = ?auto_64048 ?auto_64050 ) ) ( not ( = ?auto_64049 ?auto_64050 ) ) ( CLEAR ?auto_64047 ) ( ON ?auto_64048 ?auto_64049 ) ( CLEAR ?auto_64048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64043 ?auto_64044 ?auto_64045 ?auto_64046 ?auto_64047 ?auto_64048 )
      ( MAKE-7PILE ?auto_64043 ?auto_64044 ?auto_64045 ?auto_64046 ?auto_64047 ?auto_64048 ?auto_64049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64058 - BLOCK
      ?auto_64059 - BLOCK
      ?auto_64060 - BLOCK
      ?auto_64061 - BLOCK
      ?auto_64062 - BLOCK
      ?auto_64063 - BLOCK
      ?auto_64064 - BLOCK
    )
    :vars
    (
      ?auto_64065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64064 ?auto_64065 ) ( ON-TABLE ?auto_64058 ) ( ON ?auto_64059 ?auto_64058 ) ( ON ?auto_64060 ?auto_64059 ) ( ON ?auto_64061 ?auto_64060 ) ( ON ?auto_64062 ?auto_64061 ) ( not ( = ?auto_64058 ?auto_64059 ) ) ( not ( = ?auto_64058 ?auto_64060 ) ) ( not ( = ?auto_64058 ?auto_64061 ) ) ( not ( = ?auto_64058 ?auto_64062 ) ) ( not ( = ?auto_64058 ?auto_64063 ) ) ( not ( = ?auto_64058 ?auto_64064 ) ) ( not ( = ?auto_64058 ?auto_64065 ) ) ( not ( = ?auto_64059 ?auto_64060 ) ) ( not ( = ?auto_64059 ?auto_64061 ) ) ( not ( = ?auto_64059 ?auto_64062 ) ) ( not ( = ?auto_64059 ?auto_64063 ) ) ( not ( = ?auto_64059 ?auto_64064 ) ) ( not ( = ?auto_64059 ?auto_64065 ) ) ( not ( = ?auto_64060 ?auto_64061 ) ) ( not ( = ?auto_64060 ?auto_64062 ) ) ( not ( = ?auto_64060 ?auto_64063 ) ) ( not ( = ?auto_64060 ?auto_64064 ) ) ( not ( = ?auto_64060 ?auto_64065 ) ) ( not ( = ?auto_64061 ?auto_64062 ) ) ( not ( = ?auto_64061 ?auto_64063 ) ) ( not ( = ?auto_64061 ?auto_64064 ) ) ( not ( = ?auto_64061 ?auto_64065 ) ) ( not ( = ?auto_64062 ?auto_64063 ) ) ( not ( = ?auto_64062 ?auto_64064 ) ) ( not ( = ?auto_64062 ?auto_64065 ) ) ( not ( = ?auto_64063 ?auto_64064 ) ) ( not ( = ?auto_64063 ?auto_64065 ) ) ( not ( = ?auto_64064 ?auto_64065 ) ) ( CLEAR ?auto_64062 ) ( ON ?auto_64063 ?auto_64064 ) ( CLEAR ?auto_64063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64058 ?auto_64059 ?auto_64060 ?auto_64061 ?auto_64062 ?auto_64063 )
      ( MAKE-7PILE ?auto_64058 ?auto_64059 ?auto_64060 ?auto_64061 ?auto_64062 ?auto_64063 ?auto_64064 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64073 - BLOCK
      ?auto_64074 - BLOCK
      ?auto_64075 - BLOCK
      ?auto_64076 - BLOCK
      ?auto_64077 - BLOCK
      ?auto_64078 - BLOCK
      ?auto_64079 - BLOCK
    )
    :vars
    (
      ?auto_64080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64079 ?auto_64080 ) ( ON-TABLE ?auto_64073 ) ( ON ?auto_64074 ?auto_64073 ) ( ON ?auto_64075 ?auto_64074 ) ( ON ?auto_64076 ?auto_64075 ) ( not ( = ?auto_64073 ?auto_64074 ) ) ( not ( = ?auto_64073 ?auto_64075 ) ) ( not ( = ?auto_64073 ?auto_64076 ) ) ( not ( = ?auto_64073 ?auto_64077 ) ) ( not ( = ?auto_64073 ?auto_64078 ) ) ( not ( = ?auto_64073 ?auto_64079 ) ) ( not ( = ?auto_64073 ?auto_64080 ) ) ( not ( = ?auto_64074 ?auto_64075 ) ) ( not ( = ?auto_64074 ?auto_64076 ) ) ( not ( = ?auto_64074 ?auto_64077 ) ) ( not ( = ?auto_64074 ?auto_64078 ) ) ( not ( = ?auto_64074 ?auto_64079 ) ) ( not ( = ?auto_64074 ?auto_64080 ) ) ( not ( = ?auto_64075 ?auto_64076 ) ) ( not ( = ?auto_64075 ?auto_64077 ) ) ( not ( = ?auto_64075 ?auto_64078 ) ) ( not ( = ?auto_64075 ?auto_64079 ) ) ( not ( = ?auto_64075 ?auto_64080 ) ) ( not ( = ?auto_64076 ?auto_64077 ) ) ( not ( = ?auto_64076 ?auto_64078 ) ) ( not ( = ?auto_64076 ?auto_64079 ) ) ( not ( = ?auto_64076 ?auto_64080 ) ) ( not ( = ?auto_64077 ?auto_64078 ) ) ( not ( = ?auto_64077 ?auto_64079 ) ) ( not ( = ?auto_64077 ?auto_64080 ) ) ( not ( = ?auto_64078 ?auto_64079 ) ) ( not ( = ?auto_64078 ?auto_64080 ) ) ( not ( = ?auto_64079 ?auto_64080 ) ) ( ON ?auto_64078 ?auto_64079 ) ( CLEAR ?auto_64076 ) ( ON ?auto_64077 ?auto_64078 ) ( CLEAR ?auto_64077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64073 ?auto_64074 ?auto_64075 ?auto_64076 ?auto_64077 )
      ( MAKE-7PILE ?auto_64073 ?auto_64074 ?auto_64075 ?auto_64076 ?auto_64077 ?auto_64078 ?auto_64079 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64088 - BLOCK
      ?auto_64089 - BLOCK
      ?auto_64090 - BLOCK
      ?auto_64091 - BLOCK
      ?auto_64092 - BLOCK
      ?auto_64093 - BLOCK
      ?auto_64094 - BLOCK
    )
    :vars
    (
      ?auto_64095 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64094 ?auto_64095 ) ( ON-TABLE ?auto_64088 ) ( ON ?auto_64089 ?auto_64088 ) ( ON ?auto_64090 ?auto_64089 ) ( ON ?auto_64091 ?auto_64090 ) ( not ( = ?auto_64088 ?auto_64089 ) ) ( not ( = ?auto_64088 ?auto_64090 ) ) ( not ( = ?auto_64088 ?auto_64091 ) ) ( not ( = ?auto_64088 ?auto_64092 ) ) ( not ( = ?auto_64088 ?auto_64093 ) ) ( not ( = ?auto_64088 ?auto_64094 ) ) ( not ( = ?auto_64088 ?auto_64095 ) ) ( not ( = ?auto_64089 ?auto_64090 ) ) ( not ( = ?auto_64089 ?auto_64091 ) ) ( not ( = ?auto_64089 ?auto_64092 ) ) ( not ( = ?auto_64089 ?auto_64093 ) ) ( not ( = ?auto_64089 ?auto_64094 ) ) ( not ( = ?auto_64089 ?auto_64095 ) ) ( not ( = ?auto_64090 ?auto_64091 ) ) ( not ( = ?auto_64090 ?auto_64092 ) ) ( not ( = ?auto_64090 ?auto_64093 ) ) ( not ( = ?auto_64090 ?auto_64094 ) ) ( not ( = ?auto_64090 ?auto_64095 ) ) ( not ( = ?auto_64091 ?auto_64092 ) ) ( not ( = ?auto_64091 ?auto_64093 ) ) ( not ( = ?auto_64091 ?auto_64094 ) ) ( not ( = ?auto_64091 ?auto_64095 ) ) ( not ( = ?auto_64092 ?auto_64093 ) ) ( not ( = ?auto_64092 ?auto_64094 ) ) ( not ( = ?auto_64092 ?auto_64095 ) ) ( not ( = ?auto_64093 ?auto_64094 ) ) ( not ( = ?auto_64093 ?auto_64095 ) ) ( not ( = ?auto_64094 ?auto_64095 ) ) ( ON ?auto_64093 ?auto_64094 ) ( CLEAR ?auto_64091 ) ( ON ?auto_64092 ?auto_64093 ) ( CLEAR ?auto_64092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64088 ?auto_64089 ?auto_64090 ?auto_64091 ?auto_64092 )
      ( MAKE-7PILE ?auto_64088 ?auto_64089 ?auto_64090 ?auto_64091 ?auto_64092 ?auto_64093 ?auto_64094 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64103 - BLOCK
      ?auto_64104 - BLOCK
      ?auto_64105 - BLOCK
      ?auto_64106 - BLOCK
      ?auto_64107 - BLOCK
      ?auto_64108 - BLOCK
      ?auto_64109 - BLOCK
    )
    :vars
    (
      ?auto_64110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64109 ?auto_64110 ) ( ON-TABLE ?auto_64103 ) ( ON ?auto_64104 ?auto_64103 ) ( ON ?auto_64105 ?auto_64104 ) ( not ( = ?auto_64103 ?auto_64104 ) ) ( not ( = ?auto_64103 ?auto_64105 ) ) ( not ( = ?auto_64103 ?auto_64106 ) ) ( not ( = ?auto_64103 ?auto_64107 ) ) ( not ( = ?auto_64103 ?auto_64108 ) ) ( not ( = ?auto_64103 ?auto_64109 ) ) ( not ( = ?auto_64103 ?auto_64110 ) ) ( not ( = ?auto_64104 ?auto_64105 ) ) ( not ( = ?auto_64104 ?auto_64106 ) ) ( not ( = ?auto_64104 ?auto_64107 ) ) ( not ( = ?auto_64104 ?auto_64108 ) ) ( not ( = ?auto_64104 ?auto_64109 ) ) ( not ( = ?auto_64104 ?auto_64110 ) ) ( not ( = ?auto_64105 ?auto_64106 ) ) ( not ( = ?auto_64105 ?auto_64107 ) ) ( not ( = ?auto_64105 ?auto_64108 ) ) ( not ( = ?auto_64105 ?auto_64109 ) ) ( not ( = ?auto_64105 ?auto_64110 ) ) ( not ( = ?auto_64106 ?auto_64107 ) ) ( not ( = ?auto_64106 ?auto_64108 ) ) ( not ( = ?auto_64106 ?auto_64109 ) ) ( not ( = ?auto_64106 ?auto_64110 ) ) ( not ( = ?auto_64107 ?auto_64108 ) ) ( not ( = ?auto_64107 ?auto_64109 ) ) ( not ( = ?auto_64107 ?auto_64110 ) ) ( not ( = ?auto_64108 ?auto_64109 ) ) ( not ( = ?auto_64108 ?auto_64110 ) ) ( not ( = ?auto_64109 ?auto_64110 ) ) ( ON ?auto_64108 ?auto_64109 ) ( ON ?auto_64107 ?auto_64108 ) ( CLEAR ?auto_64105 ) ( ON ?auto_64106 ?auto_64107 ) ( CLEAR ?auto_64106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64103 ?auto_64104 ?auto_64105 ?auto_64106 )
      ( MAKE-7PILE ?auto_64103 ?auto_64104 ?auto_64105 ?auto_64106 ?auto_64107 ?auto_64108 ?auto_64109 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64118 - BLOCK
      ?auto_64119 - BLOCK
      ?auto_64120 - BLOCK
      ?auto_64121 - BLOCK
      ?auto_64122 - BLOCK
      ?auto_64123 - BLOCK
      ?auto_64124 - BLOCK
    )
    :vars
    (
      ?auto_64125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64124 ?auto_64125 ) ( ON-TABLE ?auto_64118 ) ( ON ?auto_64119 ?auto_64118 ) ( ON ?auto_64120 ?auto_64119 ) ( not ( = ?auto_64118 ?auto_64119 ) ) ( not ( = ?auto_64118 ?auto_64120 ) ) ( not ( = ?auto_64118 ?auto_64121 ) ) ( not ( = ?auto_64118 ?auto_64122 ) ) ( not ( = ?auto_64118 ?auto_64123 ) ) ( not ( = ?auto_64118 ?auto_64124 ) ) ( not ( = ?auto_64118 ?auto_64125 ) ) ( not ( = ?auto_64119 ?auto_64120 ) ) ( not ( = ?auto_64119 ?auto_64121 ) ) ( not ( = ?auto_64119 ?auto_64122 ) ) ( not ( = ?auto_64119 ?auto_64123 ) ) ( not ( = ?auto_64119 ?auto_64124 ) ) ( not ( = ?auto_64119 ?auto_64125 ) ) ( not ( = ?auto_64120 ?auto_64121 ) ) ( not ( = ?auto_64120 ?auto_64122 ) ) ( not ( = ?auto_64120 ?auto_64123 ) ) ( not ( = ?auto_64120 ?auto_64124 ) ) ( not ( = ?auto_64120 ?auto_64125 ) ) ( not ( = ?auto_64121 ?auto_64122 ) ) ( not ( = ?auto_64121 ?auto_64123 ) ) ( not ( = ?auto_64121 ?auto_64124 ) ) ( not ( = ?auto_64121 ?auto_64125 ) ) ( not ( = ?auto_64122 ?auto_64123 ) ) ( not ( = ?auto_64122 ?auto_64124 ) ) ( not ( = ?auto_64122 ?auto_64125 ) ) ( not ( = ?auto_64123 ?auto_64124 ) ) ( not ( = ?auto_64123 ?auto_64125 ) ) ( not ( = ?auto_64124 ?auto_64125 ) ) ( ON ?auto_64123 ?auto_64124 ) ( ON ?auto_64122 ?auto_64123 ) ( CLEAR ?auto_64120 ) ( ON ?auto_64121 ?auto_64122 ) ( CLEAR ?auto_64121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64118 ?auto_64119 ?auto_64120 ?auto_64121 )
      ( MAKE-7PILE ?auto_64118 ?auto_64119 ?auto_64120 ?auto_64121 ?auto_64122 ?auto_64123 ?auto_64124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64133 - BLOCK
      ?auto_64134 - BLOCK
      ?auto_64135 - BLOCK
      ?auto_64136 - BLOCK
      ?auto_64137 - BLOCK
      ?auto_64138 - BLOCK
      ?auto_64139 - BLOCK
    )
    :vars
    (
      ?auto_64140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64139 ?auto_64140 ) ( ON-TABLE ?auto_64133 ) ( ON ?auto_64134 ?auto_64133 ) ( not ( = ?auto_64133 ?auto_64134 ) ) ( not ( = ?auto_64133 ?auto_64135 ) ) ( not ( = ?auto_64133 ?auto_64136 ) ) ( not ( = ?auto_64133 ?auto_64137 ) ) ( not ( = ?auto_64133 ?auto_64138 ) ) ( not ( = ?auto_64133 ?auto_64139 ) ) ( not ( = ?auto_64133 ?auto_64140 ) ) ( not ( = ?auto_64134 ?auto_64135 ) ) ( not ( = ?auto_64134 ?auto_64136 ) ) ( not ( = ?auto_64134 ?auto_64137 ) ) ( not ( = ?auto_64134 ?auto_64138 ) ) ( not ( = ?auto_64134 ?auto_64139 ) ) ( not ( = ?auto_64134 ?auto_64140 ) ) ( not ( = ?auto_64135 ?auto_64136 ) ) ( not ( = ?auto_64135 ?auto_64137 ) ) ( not ( = ?auto_64135 ?auto_64138 ) ) ( not ( = ?auto_64135 ?auto_64139 ) ) ( not ( = ?auto_64135 ?auto_64140 ) ) ( not ( = ?auto_64136 ?auto_64137 ) ) ( not ( = ?auto_64136 ?auto_64138 ) ) ( not ( = ?auto_64136 ?auto_64139 ) ) ( not ( = ?auto_64136 ?auto_64140 ) ) ( not ( = ?auto_64137 ?auto_64138 ) ) ( not ( = ?auto_64137 ?auto_64139 ) ) ( not ( = ?auto_64137 ?auto_64140 ) ) ( not ( = ?auto_64138 ?auto_64139 ) ) ( not ( = ?auto_64138 ?auto_64140 ) ) ( not ( = ?auto_64139 ?auto_64140 ) ) ( ON ?auto_64138 ?auto_64139 ) ( ON ?auto_64137 ?auto_64138 ) ( ON ?auto_64136 ?auto_64137 ) ( CLEAR ?auto_64134 ) ( ON ?auto_64135 ?auto_64136 ) ( CLEAR ?auto_64135 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64133 ?auto_64134 ?auto_64135 )
      ( MAKE-7PILE ?auto_64133 ?auto_64134 ?auto_64135 ?auto_64136 ?auto_64137 ?auto_64138 ?auto_64139 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64148 - BLOCK
      ?auto_64149 - BLOCK
      ?auto_64150 - BLOCK
      ?auto_64151 - BLOCK
      ?auto_64152 - BLOCK
      ?auto_64153 - BLOCK
      ?auto_64154 - BLOCK
    )
    :vars
    (
      ?auto_64155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64154 ?auto_64155 ) ( ON-TABLE ?auto_64148 ) ( ON ?auto_64149 ?auto_64148 ) ( not ( = ?auto_64148 ?auto_64149 ) ) ( not ( = ?auto_64148 ?auto_64150 ) ) ( not ( = ?auto_64148 ?auto_64151 ) ) ( not ( = ?auto_64148 ?auto_64152 ) ) ( not ( = ?auto_64148 ?auto_64153 ) ) ( not ( = ?auto_64148 ?auto_64154 ) ) ( not ( = ?auto_64148 ?auto_64155 ) ) ( not ( = ?auto_64149 ?auto_64150 ) ) ( not ( = ?auto_64149 ?auto_64151 ) ) ( not ( = ?auto_64149 ?auto_64152 ) ) ( not ( = ?auto_64149 ?auto_64153 ) ) ( not ( = ?auto_64149 ?auto_64154 ) ) ( not ( = ?auto_64149 ?auto_64155 ) ) ( not ( = ?auto_64150 ?auto_64151 ) ) ( not ( = ?auto_64150 ?auto_64152 ) ) ( not ( = ?auto_64150 ?auto_64153 ) ) ( not ( = ?auto_64150 ?auto_64154 ) ) ( not ( = ?auto_64150 ?auto_64155 ) ) ( not ( = ?auto_64151 ?auto_64152 ) ) ( not ( = ?auto_64151 ?auto_64153 ) ) ( not ( = ?auto_64151 ?auto_64154 ) ) ( not ( = ?auto_64151 ?auto_64155 ) ) ( not ( = ?auto_64152 ?auto_64153 ) ) ( not ( = ?auto_64152 ?auto_64154 ) ) ( not ( = ?auto_64152 ?auto_64155 ) ) ( not ( = ?auto_64153 ?auto_64154 ) ) ( not ( = ?auto_64153 ?auto_64155 ) ) ( not ( = ?auto_64154 ?auto_64155 ) ) ( ON ?auto_64153 ?auto_64154 ) ( ON ?auto_64152 ?auto_64153 ) ( ON ?auto_64151 ?auto_64152 ) ( CLEAR ?auto_64149 ) ( ON ?auto_64150 ?auto_64151 ) ( CLEAR ?auto_64150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64148 ?auto_64149 ?auto_64150 )
      ( MAKE-7PILE ?auto_64148 ?auto_64149 ?auto_64150 ?auto_64151 ?auto_64152 ?auto_64153 ?auto_64154 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64163 - BLOCK
      ?auto_64164 - BLOCK
      ?auto_64165 - BLOCK
      ?auto_64166 - BLOCK
      ?auto_64167 - BLOCK
      ?auto_64168 - BLOCK
      ?auto_64169 - BLOCK
    )
    :vars
    (
      ?auto_64170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64169 ?auto_64170 ) ( ON-TABLE ?auto_64163 ) ( not ( = ?auto_64163 ?auto_64164 ) ) ( not ( = ?auto_64163 ?auto_64165 ) ) ( not ( = ?auto_64163 ?auto_64166 ) ) ( not ( = ?auto_64163 ?auto_64167 ) ) ( not ( = ?auto_64163 ?auto_64168 ) ) ( not ( = ?auto_64163 ?auto_64169 ) ) ( not ( = ?auto_64163 ?auto_64170 ) ) ( not ( = ?auto_64164 ?auto_64165 ) ) ( not ( = ?auto_64164 ?auto_64166 ) ) ( not ( = ?auto_64164 ?auto_64167 ) ) ( not ( = ?auto_64164 ?auto_64168 ) ) ( not ( = ?auto_64164 ?auto_64169 ) ) ( not ( = ?auto_64164 ?auto_64170 ) ) ( not ( = ?auto_64165 ?auto_64166 ) ) ( not ( = ?auto_64165 ?auto_64167 ) ) ( not ( = ?auto_64165 ?auto_64168 ) ) ( not ( = ?auto_64165 ?auto_64169 ) ) ( not ( = ?auto_64165 ?auto_64170 ) ) ( not ( = ?auto_64166 ?auto_64167 ) ) ( not ( = ?auto_64166 ?auto_64168 ) ) ( not ( = ?auto_64166 ?auto_64169 ) ) ( not ( = ?auto_64166 ?auto_64170 ) ) ( not ( = ?auto_64167 ?auto_64168 ) ) ( not ( = ?auto_64167 ?auto_64169 ) ) ( not ( = ?auto_64167 ?auto_64170 ) ) ( not ( = ?auto_64168 ?auto_64169 ) ) ( not ( = ?auto_64168 ?auto_64170 ) ) ( not ( = ?auto_64169 ?auto_64170 ) ) ( ON ?auto_64168 ?auto_64169 ) ( ON ?auto_64167 ?auto_64168 ) ( ON ?auto_64166 ?auto_64167 ) ( ON ?auto_64165 ?auto_64166 ) ( CLEAR ?auto_64163 ) ( ON ?auto_64164 ?auto_64165 ) ( CLEAR ?auto_64164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64163 ?auto_64164 )
      ( MAKE-7PILE ?auto_64163 ?auto_64164 ?auto_64165 ?auto_64166 ?auto_64167 ?auto_64168 ?auto_64169 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64178 - BLOCK
      ?auto_64179 - BLOCK
      ?auto_64180 - BLOCK
      ?auto_64181 - BLOCK
      ?auto_64182 - BLOCK
      ?auto_64183 - BLOCK
      ?auto_64184 - BLOCK
    )
    :vars
    (
      ?auto_64185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64184 ?auto_64185 ) ( ON-TABLE ?auto_64178 ) ( not ( = ?auto_64178 ?auto_64179 ) ) ( not ( = ?auto_64178 ?auto_64180 ) ) ( not ( = ?auto_64178 ?auto_64181 ) ) ( not ( = ?auto_64178 ?auto_64182 ) ) ( not ( = ?auto_64178 ?auto_64183 ) ) ( not ( = ?auto_64178 ?auto_64184 ) ) ( not ( = ?auto_64178 ?auto_64185 ) ) ( not ( = ?auto_64179 ?auto_64180 ) ) ( not ( = ?auto_64179 ?auto_64181 ) ) ( not ( = ?auto_64179 ?auto_64182 ) ) ( not ( = ?auto_64179 ?auto_64183 ) ) ( not ( = ?auto_64179 ?auto_64184 ) ) ( not ( = ?auto_64179 ?auto_64185 ) ) ( not ( = ?auto_64180 ?auto_64181 ) ) ( not ( = ?auto_64180 ?auto_64182 ) ) ( not ( = ?auto_64180 ?auto_64183 ) ) ( not ( = ?auto_64180 ?auto_64184 ) ) ( not ( = ?auto_64180 ?auto_64185 ) ) ( not ( = ?auto_64181 ?auto_64182 ) ) ( not ( = ?auto_64181 ?auto_64183 ) ) ( not ( = ?auto_64181 ?auto_64184 ) ) ( not ( = ?auto_64181 ?auto_64185 ) ) ( not ( = ?auto_64182 ?auto_64183 ) ) ( not ( = ?auto_64182 ?auto_64184 ) ) ( not ( = ?auto_64182 ?auto_64185 ) ) ( not ( = ?auto_64183 ?auto_64184 ) ) ( not ( = ?auto_64183 ?auto_64185 ) ) ( not ( = ?auto_64184 ?auto_64185 ) ) ( ON ?auto_64183 ?auto_64184 ) ( ON ?auto_64182 ?auto_64183 ) ( ON ?auto_64181 ?auto_64182 ) ( ON ?auto_64180 ?auto_64181 ) ( CLEAR ?auto_64178 ) ( ON ?auto_64179 ?auto_64180 ) ( CLEAR ?auto_64179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64178 ?auto_64179 )
      ( MAKE-7PILE ?auto_64178 ?auto_64179 ?auto_64180 ?auto_64181 ?auto_64182 ?auto_64183 ?auto_64184 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64193 - BLOCK
      ?auto_64194 - BLOCK
      ?auto_64195 - BLOCK
      ?auto_64196 - BLOCK
      ?auto_64197 - BLOCK
      ?auto_64198 - BLOCK
      ?auto_64199 - BLOCK
    )
    :vars
    (
      ?auto_64200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64199 ?auto_64200 ) ( not ( = ?auto_64193 ?auto_64194 ) ) ( not ( = ?auto_64193 ?auto_64195 ) ) ( not ( = ?auto_64193 ?auto_64196 ) ) ( not ( = ?auto_64193 ?auto_64197 ) ) ( not ( = ?auto_64193 ?auto_64198 ) ) ( not ( = ?auto_64193 ?auto_64199 ) ) ( not ( = ?auto_64193 ?auto_64200 ) ) ( not ( = ?auto_64194 ?auto_64195 ) ) ( not ( = ?auto_64194 ?auto_64196 ) ) ( not ( = ?auto_64194 ?auto_64197 ) ) ( not ( = ?auto_64194 ?auto_64198 ) ) ( not ( = ?auto_64194 ?auto_64199 ) ) ( not ( = ?auto_64194 ?auto_64200 ) ) ( not ( = ?auto_64195 ?auto_64196 ) ) ( not ( = ?auto_64195 ?auto_64197 ) ) ( not ( = ?auto_64195 ?auto_64198 ) ) ( not ( = ?auto_64195 ?auto_64199 ) ) ( not ( = ?auto_64195 ?auto_64200 ) ) ( not ( = ?auto_64196 ?auto_64197 ) ) ( not ( = ?auto_64196 ?auto_64198 ) ) ( not ( = ?auto_64196 ?auto_64199 ) ) ( not ( = ?auto_64196 ?auto_64200 ) ) ( not ( = ?auto_64197 ?auto_64198 ) ) ( not ( = ?auto_64197 ?auto_64199 ) ) ( not ( = ?auto_64197 ?auto_64200 ) ) ( not ( = ?auto_64198 ?auto_64199 ) ) ( not ( = ?auto_64198 ?auto_64200 ) ) ( not ( = ?auto_64199 ?auto_64200 ) ) ( ON ?auto_64198 ?auto_64199 ) ( ON ?auto_64197 ?auto_64198 ) ( ON ?auto_64196 ?auto_64197 ) ( ON ?auto_64195 ?auto_64196 ) ( ON ?auto_64194 ?auto_64195 ) ( ON ?auto_64193 ?auto_64194 ) ( CLEAR ?auto_64193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64193 )
      ( MAKE-7PILE ?auto_64193 ?auto_64194 ?auto_64195 ?auto_64196 ?auto_64197 ?auto_64198 ?auto_64199 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_64208 - BLOCK
      ?auto_64209 - BLOCK
      ?auto_64210 - BLOCK
      ?auto_64211 - BLOCK
      ?auto_64212 - BLOCK
      ?auto_64213 - BLOCK
      ?auto_64214 - BLOCK
    )
    :vars
    (
      ?auto_64215 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64214 ?auto_64215 ) ( not ( = ?auto_64208 ?auto_64209 ) ) ( not ( = ?auto_64208 ?auto_64210 ) ) ( not ( = ?auto_64208 ?auto_64211 ) ) ( not ( = ?auto_64208 ?auto_64212 ) ) ( not ( = ?auto_64208 ?auto_64213 ) ) ( not ( = ?auto_64208 ?auto_64214 ) ) ( not ( = ?auto_64208 ?auto_64215 ) ) ( not ( = ?auto_64209 ?auto_64210 ) ) ( not ( = ?auto_64209 ?auto_64211 ) ) ( not ( = ?auto_64209 ?auto_64212 ) ) ( not ( = ?auto_64209 ?auto_64213 ) ) ( not ( = ?auto_64209 ?auto_64214 ) ) ( not ( = ?auto_64209 ?auto_64215 ) ) ( not ( = ?auto_64210 ?auto_64211 ) ) ( not ( = ?auto_64210 ?auto_64212 ) ) ( not ( = ?auto_64210 ?auto_64213 ) ) ( not ( = ?auto_64210 ?auto_64214 ) ) ( not ( = ?auto_64210 ?auto_64215 ) ) ( not ( = ?auto_64211 ?auto_64212 ) ) ( not ( = ?auto_64211 ?auto_64213 ) ) ( not ( = ?auto_64211 ?auto_64214 ) ) ( not ( = ?auto_64211 ?auto_64215 ) ) ( not ( = ?auto_64212 ?auto_64213 ) ) ( not ( = ?auto_64212 ?auto_64214 ) ) ( not ( = ?auto_64212 ?auto_64215 ) ) ( not ( = ?auto_64213 ?auto_64214 ) ) ( not ( = ?auto_64213 ?auto_64215 ) ) ( not ( = ?auto_64214 ?auto_64215 ) ) ( ON ?auto_64213 ?auto_64214 ) ( ON ?auto_64212 ?auto_64213 ) ( ON ?auto_64211 ?auto_64212 ) ( ON ?auto_64210 ?auto_64211 ) ( ON ?auto_64209 ?auto_64210 ) ( ON ?auto_64208 ?auto_64209 ) ( CLEAR ?auto_64208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64208 )
      ( MAKE-7PILE ?auto_64208 ?auto_64209 ?auto_64210 ?auto_64211 ?auto_64212 ?auto_64213 ?auto_64214 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64224 - BLOCK
      ?auto_64225 - BLOCK
      ?auto_64226 - BLOCK
      ?auto_64227 - BLOCK
      ?auto_64228 - BLOCK
      ?auto_64229 - BLOCK
      ?auto_64230 - BLOCK
      ?auto_64231 - BLOCK
    )
    :vars
    (
      ?auto_64232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64230 ) ( ON ?auto_64231 ?auto_64232 ) ( CLEAR ?auto_64231 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64224 ) ( ON ?auto_64225 ?auto_64224 ) ( ON ?auto_64226 ?auto_64225 ) ( ON ?auto_64227 ?auto_64226 ) ( ON ?auto_64228 ?auto_64227 ) ( ON ?auto_64229 ?auto_64228 ) ( ON ?auto_64230 ?auto_64229 ) ( not ( = ?auto_64224 ?auto_64225 ) ) ( not ( = ?auto_64224 ?auto_64226 ) ) ( not ( = ?auto_64224 ?auto_64227 ) ) ( not ( = ?auto_64224 ?auto_64228 ) ) ( not ( = ?auto_64224 ?auto_64229 ) ) ( not ( = ?auto_64224 ?auto_64230 ) ) ( not ( = ?auto_64224 ?auto_64231 ) ) ( not ( = ?auto_64224 ?auto_64232 ) ) ( not ( = ?auto_64225 ?auto_64226 ) ) ( not ( = ?auto_64225 ?auto_64227 ) ) ( not ( = ?auto_64225 ?auto_64228 ) ) ( not ( = ?auto_64225 ?auto_64229 ) ) ( not ( = ?auto_64225 ?auto_64230 ) ) ( not ( = ?auto_64225 ?auto_64231 ) ) ( not ( = ?auto_64225 ?auto_64232 ) ) ( not ( = ?auto_64226 ?auto_64227 ) ) ( not ( = ?auto_64226 ?auto_64228 ) ) ( not ( = ?auto_64226 ?auto_64229 ) ) ( not ( = ?auto_64226 ?auto_64230 ) ) ( not ( = ?auto_64226 ?auto_64231 ) ) ( not ( = ?auto_64226 ?auto_64232 ) ) ( not ( = ?auto_64227 ?auto_64228 ) ) ( not ( = ?auto_64227 ?auto_64229 ) ) ( not ( = ?auto_64227 ?auto_64230 ) ) ( not ( = ?auto_64227 ?auto_64231 ) ) ( not ( = ?auto_64227 ?auto_64232 ) ) ( not ( = ?auto_64228 ?auto_64229 ) ) ( not ( = ?auto_64228 ?auto_64230 ) ) ( not ( = ?auto_64228 ?auto_64231 ) ) ( not ( = ?auto_64228 ?auto_64232 ) ) ( not ( = ?auto_64229 ?auto_64230 ) ) ( not ( = ?auto_64229 ?auto_64231 ) ) ( not ( = ?auto_64229 ?auto_64232 ) ) ( not ( = ?auto_64230 ?auto_64231 ) ) ( not ( = ?auto_64230 ?auto_64232 ) ) ( not ( = ?auto_64231 ?auto_64232 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64231 ?auto_64232 )
      ( !STACK ?auto_64231 ?auto_64230 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64241 - BLOCK
      ?auto_64242 - BLOCK
      ?auto_64243 - BLOCK
      ?auto_64244 - BLOCK
      ?auto_64245 - BLOCK
      ?auto_64246 - BLOCK
      ?auto_64247 - BLOCK
      ?auto_64248 - BLOCK
    )
    :vars
    (
      ?auto_64249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64247 ) ( ON ?auto_64248 ?auto_64249 ) ( CLEAR ?auto_64248 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64241 ) ( ON ?auto_64242 ?auto_64241 ) ( ON ?auto_64243 ?auto_64242 ) ( ON ?auto_64244 ?auto_64243 ) ( ON ?auto_64245 ?auto_64244 ) ( ON ?auto_64246 ?auto_64245 ) ( ON ?auto_64247 ?auto_64246 ) ( not ( = ?auto_64241 ?auto_64242 ) ) ( not ( = ?auto_64241 ?auto_64243 ) ) ( not ( = ?auto_64241 ?auto_64244 ) ) ( not ( = ?auto_64241 ?auto_64245 ) ) ( not ( = ?auto_64241 ?auto_64246 ) ) ( not ( = ?auto_64241 ?auto_64247 ) ) ( not ( = ?auto_64241 ?auto_64248 ) ) ( not ( = ?auto_64241 ?auto_64249 ) ) ( not ( = ?auto_64242 ?auto_64243 ) ) ( not ( = ?auto_64242 ?auto_64244 ) ) ( not ( = ?auto_64242 ?auto_64245 ) ) ( not ( = ?auto_64242 ?auto_64246 ) ) ( not ( = ?auto_64242 ?auto_64247 ) ) ( not ( = ?auto_64242 ?auto_64248 ) ) ( not ( = ?auto_64242 ?auto_64249 ) ) ( not ( = ?auto_64243 ?auto_64244 ) ) ( not ( = ?auto_64243 ?auto_64245 ) ) ( not ( = ?auto_64243 ?auto_64246 ) ) ( not ( = ?auto_64243 ?auto_64247 ) ) ( not ( = ?auto_64243 ?auto_64248 ) ) ( not ( = ?auto_64243 ?auto_64249 ) ) ( not ( = ?auto_64244 ?auto_64245 ) ) ( not ( = ?auto_64244 ?auto_64246 ) ) ( not ( = ?auto_64244 ?auto_64247 ) ) ( not ( = ?auto_64244 ?auto_64248 ) ) ( not ( = ?auto_64244 ?auto_64249 ) ) ( not ( = ?auto_64245 ?auto_64246 ) ) ( not ( = ?auto_64245 ?auto_64247 ) ) ( not ( = ?auto_64245 ?auto_64248 ) ) ( not ( = ?auto_64245 ?auto_64249 ) ) ( not ( = ?auto_64246 ?auto_64247 ) ) ( not ( = ?auto_64246 ?auto_64248 ) ) ( not ( = ?auto_64246 ?auto_64249 ) ) ( not ( = ?auto_64247 ?auto_64248 ) ) ( not ( = ?auto_64247 ?auto_64249 ) ) ( not ( = ?auto_64248 ?auto_64249 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64248 ?auto_64249 )
      ( !STACK ?auto_64248 ?auto_64247 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64258 - BLOCK
      ?auto_64259 - BLOCK
      ?auto_64260 - BLOCK
      ?auto_64261 - BLOCK
      ?auto_64262 - BLOCK
      ?auto_64263 - BLOCK
      ?auto_64264 - BLOCK
      ?auto_64265 - BLOCK
    )
    :vars
    (
      ?auto_64266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64265 ?auto_64266 ) ( ON-TABLE ?auto_64258 ) ( ON ?auto_64259 ?auto_64258 ) ( ON ?auto_64260 ?auto_64259 ) ( ON ?auto_64261 ?auto_64260 ) ( ON ?auto_64262 ?auto_64261 ) ( ON ?auto_64263 ?auto_64262 ) ( not ( = ?auto_64258 ?auto_64259 ) ) ( not ( = ?auto_64258 ?auto_64260 ) ) ( not ( = ?auto_64258 ?auto_64261 ) ) ( not ( = ?auto_64258 ?auto_64262 ) ) ( not ( = ?auto_64258 ?auto_64263 ) ) ( not ( = ?auto_64258 ?auto_64264 ) ) ( not ( = ?auto_64258 ?auto_64265 ) ) ( not ( = ?auto_64258 ?auto_64266 ) ) ( not ( = ?auto_64259 ?auto_64260 ) ) ( not ( = ?auto_64259 ?auto_64261 ) ) ( not ( = ?auto_64259 ?auto_64262 ) ) ( not ( = ?auto_64259 ?auto_64263 ) ) ( not ( = ?auto_64259 ?auto_64264 ) ) ( not ( = ?auto_64259 ?auto_64265 ) ) ( not ( = ?auto_64259 ?auto_64266 ) ) ( not ( = ?auto_64260 ?auto_64261 ) ) ( not ( = ?auto_64260 ?auto_64262 ) ) ( not ( = ?auto_64260 ?auto_64263 ) ) ( not ( = ?auto_64260 ?auto_64264 ) ) ( not ( = ?auto_64260 ?auto_64265 ) ) ( not ( = ?auto_64260 ?auto_64266 ) ) ( not ( = ?auto_64261 ?auto_64262 ) ) ( not ( = ?auto_64261 ?auto_64263 ) ) ( not ( = ?auto_64261 ?auto_64264 ) ) ( not ( = ?auto_64261 ?auto_64265 ) ) ( not ( = ?auto_64261 ?auto_64266 ) ) ( not ( = ?auto_64262 ?auto_64263 ) ) ( not ( = ?auto_64262 ?auto_64264 ) ) ( not ( = ?auto_64262 ?auto_64265 ) ) ( not ( = ?auto_64262 ?auto_64266 ) ) ( not ( = ?auto_64263 ?auto_64264 ) ) ( not ( = ?auto_64263 ?auto_64265 ) ) ( not ( = ?auto_64263 ?auto_64266 ) ) ( not ( = ?auto_64264 ?auto_64265 ) ) ( not ( = ?auto_64264 ?auto_64266 ) ) ( not ( = ?auto_64265 ?auto_64266 ) ) ( CLEAR ?auto_64263 ) ( ON ?auto_64264 ?auto_64265 ) ( CLEAR ?auto_64264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64258 ?auto_64259 ?auto_64260 ?auto_64261 ?auto_64262 ?auto_64263 ?auto_64264 )
      ( MAKE-8PILE ?auto_64258 ?auto_64259 ?auto_64260 ?auto_64261 ?auto_64262 ?auto_64263 ?auto_64264 ?auto_64265 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64275 - BLOCK
      ?auto_64276 - BLOCK
      ?auto_64277 - BLOCK
      ?auto_64278 - BLOCK
      ?auto_64279 - BLOCK
      ?auto_64280 - BLOCK
      ?auto_64281 - BLOCK
      ?auto_64282 - BLOCK
    )
    :vars
    (
      ?auto_64283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64282 ?auto_64283 ) ( ON-TABLE ?auto_64275 ) ( ON ?auto_64276 ?auto_64275 ) ( ON ?auto_64277 ?auto_64276 ) ( ON ?auto_64278 ?auto_64277 ) ( ON ?auto_64279 ?auto_64278 ) ( ON ?auto_64280 ?auto_64279 ) ( not ( = ?auto_64275 ?auto_64276 ) ) ( not ( = ?auto_64275 ?auto_64277 ) ) ( not ( = ?auto_64275 ?auto_64278 ) ) ( not ( = ?auto_64275 ?auto_64279 ) ) ( not ( = ?auto_64275 ?auto_64280 ) ) ( not ( = ?auto_64275 ?auto_64281 ) ) ( not ( = ?auto_64275 ?auto_64282 ) ) ( not ( = ?auto_64275 ?auto_64283 ) ) ( not ( = ?auto_64276 ?auto_64277 ) ) ( not ( = ?auto_64276 ?auto_64278 ) ) ( not ( = ?auto_64276 ?auto_64279 ) ) ( not ( = ?auto_64276 ?auto_64280 ) ) ( not ( = ?auto_64276 ?auto_64281 ) ) ( not ( = ?auto_64276 ?auto_64282 ) ) ( not ( = ?auto_64276 ?auto_64283 ) ) ( not ( = ?auto_64277 ?auto_64278 ) ) ( not ( = ?auto_64277 ?auto_64279 ) ) ( not ( = ?auto_64277 ?auto_64280 ) ) ( not ( = ?auto_64277 ?auto_64281 ) ) ( not ( = ?auto_64277 ?auto_64282 ) ) ( not ( = ?auto_64277 ?auto_64283 ) ) ( not ( = ?auto_64278 ?auto_64279 ) ) ( not ( = ?auto_64278 ?auto_64280 ) ) ( not ( = ?auto_64278 ?auto_64281 ) ) ( not ( = ?auto_64278 ?auto_64282 ) ) ( not ( = ?auto_64278 ?auto_64283 ) ) ( not ( = ?auto_64279 ?auto_64280 ) ) ( not ( = ?auto_64279 ?auto_64281 ) ) ( not ( = ?auto_64279 ?auto_64282 ) ) ( not ( = ?auto_64279 ?auto_64283 ) ) ( not ( = ?auto_64280 ?auto_64281 ) ) ( not ( = ?auto_64280 ?auto_64282 ) ) ( not ( = ?auto_64280 ?auto_64283 ) ) ( not ( = ?auto_64281 ?auto_64282 ) ) ( not ( = ?auto_64281 ?auto_64283 ) ) ( not ( = ?auto_64282 ?auto_64283 ) ) ( CLEAR ?auto_64280 ) ( ON ?auto_64281 ?auto_64282 ) ( CLEAR ?auto_64281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64275 ?auto_64276 ?auto_64277 ?auto_64278 ?auto_64279 ?auto_64280 ?auto_64281 )
      ( MAKE-8PILE ?auto_64275 ?auto_64276 ?auto_64277 ?auto_64278 ?auto_64279 ?auto_64280 ?auto_64281 ?auto_64282 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64292 - BLOCK
      ?auto_64293 - BLOCK
      ?auto_64294 - BLOCK
      ?auto_64295 - BLOCK
      ?auto_64296 - BLOCK
      ?auto_64297 - BLOCK
      ?auto_64298 - BLOCK
      ?auto_64299 - BLOCK
    )
    :vars
    (
      ?auto_64300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64299 ?auto_64300 ) ( ON-TABLE ?auto_64292 ) ( ON ?auto_64293 ?auto_64292 ) ( ON ?auto_64294 ?auto_64293 ) ( ON ?auto_64295 ?auto_64294 ) ( ON ?auto_64296 ?auto_64295 ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( not ( = ?auto_64292 ?auto_64294 ) ) ( not ( = ?auto_64292 ?auto_64295 ) ) ( not ( = ?auto_64292 ?auto_64296 ) ) ( not ( = ?auto_64292 ?auto_64297 ) ) ( not ( = ?auto_64292 ?auto_64298 ) ) ( not ( = ?auto_64292 ?auto_64299 ) ) ( not ( = ?auto_64292 ?auto_64300 ) ) ( not ( = ?auto_64293 ?auto_64294 ) ) ( not ( = ?auto_64293 ?auto_64295 ) ) ( not ( = ?auto_64293 ?auto_64296 ) ) ( not ( = ?auto_64293 ?auto_64297 ) ) ( not ( = ?auto_64293 ?auto_64298 ) ) ( not ( = ?auto_64293 ?auto_64299 ) ) ( not ( = ?auto_64293 ?auto_64300 ) ) ( not ( = ?auto_64294 ?auto_64295 ) ) ( not ( = ?auto_64294 ?auto_64296 ) ) ( not ( = ?auto_64294 ?auto_64297 ) ) ( not ( = ?auto_64294 ?auto_64298 ) ) ( not ( = ?auto_64294 ?auto_64299 ) ) ( not ( = ?auto_64294 ?auto_64300 ) ) ( not ( = ?auto_64295 ?auto_64296 ) ) ( not ( = ?auto_64295 ?auto_64297 ) ) ( not ( = ?auto_64295 ?auto_64298 ) ) ( not ( = ?auto_64295 ?auto_64299 ) ) ( not ( = ?auto_64295 ?auto_64300 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) ( not ( = ?auto_64296 ?auto_64298 ) ) ( not ( = ?auto_64296 ?auto_64299 ) ) ( not ( = ?auto_64296 ?auto_64300 ) ) ( not ( = ?auto_64297 ?auto_64298 ) ) ( not ( = ?auto_64297 ?auto_64299 ) ) ( not ( = ?auto_64297 ?auto_64300 ) ) ( not ( = ?auto_64298 ?auto_64299 ) ) ( not ( = ?auto_64298 ?auto_64300 ) ) ( not ( = ?auto_64299 ?auto_64300 ) ) ( ON ?auto_64298 ?auto_64299 ) ( CLEAR ?auto_64296 ) ( ON ?auto_64297 ?auto_64298 ) ( CLEAR ?auto_64297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64292 ?auto_64293 ?auto_64294 ?auto_64295 ?auto_64296 ?auto_64297 )
      ( MAKE-8PILE ?auto_64292 ?auto_64293 ?auto_64294 ?auto_64295 ?auto_64296 ?auto_64297 ?auto_64298 ?auto_64299 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64309 - BLOCK
      ?auto_64310 - BLOCK
      ?auto_64311 - BLOCK
      ?auto_64312 - BLOCK
      ?auto_64313 - BLOCK
      ?auto_64314 - BLOCK
      ?auto_64315 - BLOCK
      ?auto_64316 - BLOCK
    )
    :vars
    (
      ?auto_64317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64316 ?auto_64317 ) ( ON-TABLE ?auto_64309 ) ( ON ?auto_64310 ?auto_64309 ) ( ON ?auto_64311 ?auto_64310 ) ( ON ?auto_64312 ?auto_64311 ) ( ON ?auto_64313 ?auto_64312 ) ( not ( = ?auto_64309 ?auto_64310 ) ) ( not ( = ?auto_64309 ?auto_64311 ) ) ( not ( = ?auto_64309 ?auto_64312 ) ) ( not ( = ?auto_64309 ?auto_64313 ) ) ( not ( = ?auto_64309 ?auto_64314 ) ) ( not ( = ?auto_64309 ?auto_64315 ) ) ( not ( = ?auto_64309 ?auto_64316 ) ) ( not ( = ?auto_64309 ?auto_64317 ) ) ( not ( = ?auto_64310 ?auto_64311 ) ) ( not ( = ?auto_64310 ?auto_64312 ) ) ( not ( = ?auto_64310 ?auto_64313 ) ) ( not ( = ?auto_64310 ?auto_64314 ) ) ( not ( = ?auto_64310 ?auto_64315 ) ) ( not ( = ?auto_64310 ?auto_64316 ) ) ( not ( = ?auto_64310 ?auto_64317 ) ) ( not ( = ?auto_64311 ?auto_64312 ) ) ( not ( = ?auto_64311 ?auto_64313 ) ) ( not ( = ?auto_64311 ?auto_64314 ) ) ( not ( = ?auto_64311 ?auto_64315 ) ) ( not ( = ?auto_64311 ?auto_64316 ) ) ( not ( = ?auto_64311 ?auto_64317 ) ) ( not ( = ?auto_64312 ?auto_64313 ) ) ( not ( = ?auto_64312 ?auto_64314 ) ) ( not ( = ?auto_64312 ?auto_64315 ) ) ( not ( = ?auto_64312 ?auto_64316 ) ) ( not ( = ?auto_64312 ?auto_64317 ) ) ( not ( = ?auto_64313 ?auto_64314 ) ) ( not ( = ?auto_64313 ?auto_64315 ) ) ( not ( = ?auto_64313 ?auto_64316 ) ) ( not ( = ?auto_64313 ?auto_64317 ) ) ( not ( = ?auto_64314 ?auto_64315 ) ) ( not ( = ?auto_64314 ?auto_64316 ) ) ( not ( = ?auto_64314 ?auto_64317 ) ) ( not ( = ?auto_64315 ?auto_64316 ) ) ( not ( = ?auto_64315 ?auto_64317 ) ) ( not ( = ?auto_64316 ?auto_64317 ) ) ( ON ?auto_64315 ?auto_64316 ) ( CLEAR ?auto_64313 ) ( ON ?auto_64314 ?auto_64315 ) ( CLEAR ?auto_64314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64309 ?auto_64310 ?auto_64311 ?auto_64312 ?auto_64313 ?auto_64314 )
      ( MAKE-8PILE ?auto_64309 ?auto_64310 ?auto_64311 ?auto_64312 ?auto_64313 ?auto_64314 ?auto_64315 ?auto_64316 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64326 - BLOCK
      ?auto_64327 - BLOCK
      ?auto_64328 - BLOCK
      ?auto_64329 - BLOCK
      ?auto_64330 - BLOCK
      ?auto_64331 - BLOCK
      ?auto_64332 - BLOCK
      ?auto_64333 - BLOCK
    )
    :vars
    (
      ?auto_64334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64333 ?auto_64334 ) ( ON-TABLE ?auto_64326 ) ( ON ?auto_64327 ?auto_64326 ) ( ON ?auto_64328 ?auto_64327 ) ( ON ?auto_64329 ?auto_64328 ) ( not ( = ?auto_64326 ?auto_64327 ) ) ( not ( = ?auto_64326 ?auto_64328 ) ) ( not ( = ?auto_64326 ?auto_64329 ) ) ( not ( = ?auto_64326 ?auto_64330 ) ) ( not ( = ?auto_64326 ?auto_64331 ) ) ( not ( = ?auto_64326 ?auto_64332 ) ) ( not ( = ?auto_64326 ?auto_64333 ) ) ( not ( = ?auto_64326 ?auto_64334 ) ) ( not ( = ?auto_64327 ?auto_64328 ) ) ( not ( = ?auto_64327 ?auto_64329 ) ) ( not ( = ?auto_64327 ?auto_64330 ) ) ( not ( = ?auto_64327 ?auto_64331 ) ) ( not ( = ?auto_64327 ?auto_64332 ) ) ( not ( = ?auto_64327 ?auto_64333 ) ) ( not ( = ?auto_64327 ?auto_64334 ) ) ( not ( = ?auto_64328 ?auto_64329 ) ) ( not ( = ?auto_64328 ?auto_64330 ) ) ( not ( = ?auto_64328 ?auto_64331 ) ) ( not ( = ?auto_64328 ?auto_64332 ) ) ( not ( = ?auto_64328 ?auto_64333 ) ) ( not ( = ?auto_64328 ?auto_64334 ) ) ( not ( = ?auto_64329 ?auto_64330 ) ) ( not ( = ?auto_64329 ?auto_64331 ) ) ( not ( = ?auto_64329 ?auto_64332 ) ) ( not ( = ?auto_64329 ?auto_64333 ) ) ( not ( = ?auto_64329 ?auto_64334 ) ) ( not ( = ?auto_64330 ?auto_64331 ) ) ( not ( = ?auto_64330 ?auto_64332 ) ) ( not ( = ?auto_64330 ?auto_64333 ) ) ( not ( = ?auto_64330 ?auto_64334 ) ) ( not ( = ?auto_64331 ?auto_64332 ) ) ( not ( = ?auto_64331 ?auto_64333 ) ) ( not ( = ?auto_64331 ?auto_64334 ) ) ( not ( = ?auto_64332 ?auto_64333 ) ) ( not ( = ?auto_64332 ?auto_64334 ) ) ( not ( = ?auto_64333 ?auto_64334 ) ) ( ON ?auto_64332 ?auto_64333 ) ( ON ?auto_64331 ?auto_64332 ) ( CLEAR ?auto_64329 ) ( ON ?auto_64330 ?auto_64331 ) ( CLEAR ?auto_64330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64326 ?auto_64327 ?auto_64328 ?auto_64329 ?auto_64330 )
      ( MAKE-8PILE ?auto_64326 ?auto_64327 ?auto_64328 ?auto_64329 ?auto_64330 ?auto_64331 ?auto_64332 ?auto_64333 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64343 - BLOCK
      ?auto_64344 - BLOCK
      ?auto_64345 - BLOCK
      ?auto_64346 - BLOCK
      ?auto_64347 - BLOCK
      ?auto_64348 - BLOCK
      ?auto_64349 - BLOCK
      ?auto_64350 - BLOCK
    )
    :vars
    (
      ?auto_64351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64350 ?auto_64351 ) ( ON-TABLE ?auto_64343 ) ( ON ?auto_64344 ?auto_64343 ) ( ON ?auto_64345 ?auto_64344 ) ( ON ?auto_64346 ?auto_64345 ) ( not ( = ?auto_64343 ?auto_64344 ) ) ( not ( = ?auto_64343 ?auto_64345 ) ) ( not ( = ?auto_64343 ?auto_64346 ) ) ( not ( = ?auto_64343 ?auto_64347 ) ) ( not ( = ?auto_64343 ?auto_64348 ) ) ( not ( = ?auto_64343 ?auto_64349 ) ) ( not ( = ?auto_64343 ?auto_64350 ) ) ( not ( = ?auto_64343 ?auto_64351 ) ) ( not ( = ?auto_64344 ?auto_64345 ) ) ( not ( = ?auto_64344 ?auto_64346 ) ) ( not ( = ?auto_64344 ?auto_64347 ) ) ( not ( = ?auto_64344 ?auto_64348 ) ) ( not ( = ?auto_64344 ?auto_64349 ) ) ( not ( = ?auto_64344 ?auto_64350 ) ) ( not ( = ?auto_64344 ?auto_64351 ) ) ( not ( = ?auto_64345 ?auto_64346 ) ) ( not ( = ?auto_64345 ?auto_64347 ) ) ( not ( = ?auto_64345 ?auto_64348 ) ) ( not ( = ?auto_64345 ?auto_64349 ) ) ( not ( = ?auto_64345 ?auto_64350 ) ) ( not ( = ?auto_64345 ?auto_64351 ) ) ( not ( = ?auto_64346 ?auto_64347 ) ) ( not ( = ?auto_64346 ?auto_64348 ) ) ( not ( = ?auto_64346 ?auto_64349 ) ) ( not ( = ?auto_64346 ?auto_64350 ) ) ( not ( = ?auto_64346 ?auto_64351 ) ) ( not ( = ?auto_64347 ?auto_64348 ) ) ( not ( = ?auto_64347 ?auto_64349 ) ) ( not ( = ?auto_64347 ?auto_64350 ) ) ( not ( = ?auto_64347 ?auto_64351 ) ) ( not ( = ?auto_64348 ?auto_64349 ) ) ( not ( = ?auto_64348 ?auto_64350 ) ) ( not ( = ?auto_64348 ?auto_64351 ) ) ( not ( = ?auto_64349 ?auto_64350 ) ) ( not ( = ?auto_64349 ?auto_64351 ) ) ( not ( = ?auto_64350 ?auto_64351 ) ) ( ON ?auto_64349 ?auto_64350 ) ( ON ?auto_64348 ?auto_64349 ) ( CLEAR ?auto_64346 ) ( ON ?auto_64347 ?auto_64348 ) ( CLEAR ?auto_64347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64343 ?auto_64344 ?auto_64345 ?auto_64346 ?auto_64347 )
      ( MAKE-8PILE ?auto_64343 ?auto_64344 ?auto_64345 ?auto_64346 ?auto_64347 ?auto_64348 ?auto_64349 ?auto_64350 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64360 - BLOCK
      ?auto_64361 - BLOCK
      ?auto_64362 - BLOCK
      ?auto_64363 - BLOCK
      ?auto_64364 - BLOCK
      ?auto_64365 - BLOCK
      ?auto_64366 - BLOCK
      ?auto_64367 - BLOCK
    )
    :vars
    (
      ?auto_64368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64367 ?auto_64368 ) ( ON-TABLE ?auto_64360 ) ( ON ?auto_64361 ?auto_64360 ) ( ON ?auto_64362 ?auto_64361 ) ( not ( = ?auto_64360 ?auto_64361 ) ) ( not ( = ?auto_64360 ?auto_64362 ) ) ( not ( = ?auto_64360 ?auto_64363 ) ) ( not ( = ?auto_64360 ?auto_64364 ) ) ( not ( = ?auto_64360 ?auto_64365 ) ) ( not ( = ?auto_64360 ?auto_64366 ) ) ( not ( = ?auto_64360 ?auto_64367 ) ) ( not ( = ?auto_64360 ?auto_64368 ) ) ( not ( = ?auto_64361 ?auto_64362 ) ) ( not ( = ?auto_64361 ?auto_64363 ) ) ( not ( = ?auto_64361 ?auto_64364 ) ) ( not ( = ?auto_64361 ?auto_64365 ) ) ( not ( = ?auto_64361 ?auto_64366 ) ) ( not ( = ?auto_64361 ?auto_64367 ) ) ( not ( = ?auto_64361 ?auto_64368 ) ) ( not ( = ?auto_64362 ?auto_64363 ) ) ( not ( = ?auto_64362 ?auto_64364 ) ) ( not ( = ?auto_64362 ?auto_64365 ) ) ( not ( = ?auto_64362 ?auto_64366 ) ) ( not ( = ?auto_64362 ?auto_64367 ) ) ( not ( = ?auto_64362 ?auto_64368 ) ) ( not ( = ?auto_64363 ?auto_64364 ) ) ( not ( = ?auto_64363 ?auto_64365 ) ) ( not ( = ?auto_64363 ?auto_64366 ) ) ( not ( = ?auto_64363 ?auto_64367 ) ) ( not ( = ?auto_64363 ?auto_64368 ) ) ( not ( = ?auto_64364 ?auto_64365 ) ) ( not ( = ?auto_64364 ?auto_64366 ) ) ( not ( = ?auto_64364 ?auto_64367 ) ) ( not ( = ?auto_64364 ?auto_64368 ) ) ( not ( = ?auto_64365 ?auto_64366 ) ) ( not ( = ?auto_64365 ?auto_64367 ) ) ( not ( = ?auto_64365 ?auto_64368 ) ) ( not ( = ?auto_64366 ?auto_64367 ) ) ( not ( = ?auto_64366 ?auto_64368 ) ) ( not ( = ?auto_64367 ?auto_64368 ) ) ( ON ?auto_64366 ?auto_64367 ) ( ON ?auto_64365 ?auto_64366 ) ( ON ?auto_64364 ?auto_64365 ) ( CLEAR ?auto_64362 ) ( ON ?auto_64363 ?auto_64364 ) ( CLEAR ?auto_64363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64360 ?auto_64361 ?auto_64362 ?auto_64363 )
      ( MAKE-8PILE ?auto_64360 ?auto_64361 ?auto_64362 ?auto_64363 ?auto_64364 ?auto_64365 ?auto_64366 ?auto_64367 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64377 - BLOCK
      ?auto_64378 - BLOCK
      ?auto_64379 - BLOCK
      ?auto_64380 - BLOCK
      ?auto_64381 - BLOCK
      ?auto_64382 - BLOCK
      ?auto_64383 - BLOCK
      ?auto_64384 - BLOCK
    )
    :vars
    (
      ?auto_64385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64384 ?auto_64385 ) ( ON-TABLE ?auto_64377 ) ( ON ?auto_64378 ?auto_64377 ) ( ON ?auto_64379 ?auto_64378 ) ( not ( = ?auto_64377 ?auto_64378 ) ) ( not ( = ?auto_64377 ?auto_64379 ) ) ( not ( = ?auto_64377 ?auto_64380 ) ) ( not ( = ?auto_64377 ?auto_64381 ) ) ( not ( = ?auto_64377 ?auto_64382 ) ) ( not ( = ?auto_64377 ?auto_64383 ) ) ( not ( = ?auto_64377 ?auto_64384 ) ) ( not ( = ?auto_64377 ?auto_64385 ) ) ( not ( = ?auto_64378 ?auto_64379 ) ) ( not ( = ?auto_64378 ?auto_64380 ) ) ( not ( = ?auto_64378 ?auto_64381 ) ) ( not ( = ?auto_64378 ?auto_64382 ) ) ( not ( = ?auto_64378 ?auto_64383 ) ) ( not ( = ?auto_64378 ?auto_64384 ) ) ( not ( = ?auto_64378 ?auto_64385 ) ) ( not ( = ?auto_64379 ?auto_64380 ) ) ( not ( = ?auto_64379 ?auto_64381 ) ) ( not ( = ?auto_64379 ?auto_64382 ) ) ( not ( = ?auto_64379 ?auto_64383 ) ) ( not ( = ?auto_64379 ?auto_64384 ) ) ( not ( = ?auto_64379 ?auto_64385 ) ) ( not ( = ?auto_64380 ?auto_64381 ) ) ( not ( = ?auto_64380 ?auto_64382 ) ) ( not ( = ?auto_64380 ?auto_64383 ) ) ( not ( = ?auto_64380 ?auto_64384 ) ) ( not ( = ?auto_64380 ?auto_64385 ) ) ( not ( = ?auto_64381 ?auto_64382 ) ) ( not ( = ?auto_64381 ?auto_64383 ) ) ( not ( = ?auto_64381 ?auto_64384 ) ) ( not ( = ?auto_64381 ?auto_64385 ) ) ( not ( = ?auto_64382 ?auto_64383 ) ) ( not ( = ?auto_64382 ?auto_64384 ) ) ( not ( = ?auto_64382 ?auto_64385 ) ) ( not ( = ?auto_64383 ?auto_64384 ) ) ( not ( = ?auto_64383 ?auto_64385 ) ) ( not ( = ?auto_64384 ?auto_64385 ) ) ( ON ?auto_64383 ?auto_64384 ) ( ON ?auto_64382 ?auto_64383 ) ( ON ?auto_64381 ?auto_64382 ) ( CLEAR ?auto_64379 ) ( ON ?auto_64380 ?auto_64381 ) ( CLEAR ?auto_64380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64377 ?auto_64378 ?auto_64379 ?auto_64380 )
      ( MAKE-8PILE ?auto_64377 ?auto_64378 ?auto_64379 ?auto_64380 ?auto_64381 ?auto_64382 ?auto_64383 ?auto_64384 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64394 - BLOCK
      ?auto_64395 - BLOCK
      ?auto_64396 - BLOCK
      ?auto_64397 - BLOCK
      ?auto_64398 - BLOCK
      ?auto_64399 - BLOCK
      ?auto_64400 - BLOCK
      ?auto_64401 - BLOCK
    )
    :vars
    (
      ?auto_64402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64401 ?auto_64402 ) ( ON-TABLE ?auto_64394 ) ( ON ?auto_64395 ?auto_64394 ) ( not ( = ?auto_64394 ?auto_64395 ) ) ( not ( = ?auto_64394 ?auto_64396 ) ) ( not ( = ?auto_64394 ?auto_64397 ) ) ( not ( = ?auto_64394 ?auto_64398 ) ) ( not ( = ?auto_64394 ?auto_64399 ) ) ( not ( = ?auto_64394 ?auto_64400 ) ) ( not ( = ?auto_64394 ?auto_64401 ) ) ( not ( = ?auto_64394 ?auto_64402 ) ) ( not ( = ?auto_64395 ?auto_64396 ) ) ( not ( = ?auto_64395 ?auto_64397 ) ) ( not ( = ?auto_64395 ?auto_64398 ) ) ( not ( = ?auto_64395 ?auto_64399 ) ) ( not ( = ?auto_64395 ?auto_64400 ) ) ( not ( = ?auto_64395 ?auto_64401 ) ) ( not ( = ?auto_64395 ?auto_64402 ) ) ( not ( = ?auto_64396 ?auto_64397 ) ) ( not ( = ?auto_64396 ?auto_64398 ) ) ( not ( = ?auto_64396 ?auto_64399 ) ) ( not ( = ?auto_64396 ?auto_64400 ) ) ( not ( = ?auto_64396 ?auto_64401 ) ) ( not ( = ?auto_64396 ?auto_64402 ) ) ( not ( = ?auto_64397 ?auto_64398 ) ) ( not ( = ?auto_64397 ?auto_64399 ) ) ( not ( = ?auto_64397 ?auto_64400 ) ) ( not ( = ?auto_64397 ?auto_64401 ) ) ( not ( = ?auto_64397 ?auto_64402 ) ) ( not ( = ?auto_64398 ?auto_64399 ) ) ( not ( = ?auto_64398 ?auto_64400 ) ) ( not ( = ?auto_64398 ?auto_64401 ) ) ( not ( = ?auto_64398 ?auto_64402 ) ) ( not ( = ?auto_64399 ?auto_64400 ) ) ( not ( = ?auto_64399 ?auto_64401 ) ) ( not ( = ?auto_64399 ?auto_64402 ) ) ( not ( = ?auto_64400 ?auto_64401 ) ) ( not ( = ?auto_64400 ?auto_64402 ) ) ( not ( = ?auto_64401 ?auto_64402 ) ) ( ON ?auto_64400 ?auto_64401 ) ( ON ?auto_64399 ?auto_64400 ) ( ON ?auto_64398 ?auto_64399 ) ( ON ?auto_64397 ?auto_64398 ) ( CLEAR ?auto_64395 ) ( ON ?auto_64396 ?auto_64397 ) ( CLEAR ?auto_64396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64394 ?auto_64395 ?auto_64396 )
      ( MAKE-8PILE ?auto_64394 ?auto_64395 ?auto_64396 ?auto_64397 ?auto_64398 ?auto_64399 ?auto_64400 ?auto_64401 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64411 - BLOCK
      ?auto_64412 - BLOCK
      ?auto_64413 - BLOCK
      ?auto_64414 - BLOCK
      ?auto_64415 - BLOCK
      ?auto_64416 - BLOCK
      ?auto_64417 - BLOCK
      ?auto_64418 - BLOCK
    )
    :vars
    (
      ?auto_64419 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64418 ?auto_64419 ) ( ON-TABLE ?auto_64411 ) ( ON ?auto_64412 ?auto_64411 ) ( not ( = ?auto_64411 ?auto_64412 ) ) ( not ( = ?auto_64411 ?auto_64413 ) ) ( not ( = ?auto_64411 ?auto_64414 ) ) ( not ( = ?auto_64411 ?auto_64415 ) ) ( not ( = ?auto_64411 ?auto_64416 ) ) ( not ( = ?auto_64411 ?auto_64417 ) ) ( not ( = ?auto_64411 ?auto_64418 ) ) ( not ( = ?auto_64411 ?auto_64419 ) ) ( not ( = ?auto_64412 ?auto_64413 ) ) ( not ( = ?auto_64412 ?auto_64414 ) ) ( not ( = ?auto_64412 ?auto_64415 ) ) ( not ( = ?auto_64412 ?auto_64416 ) ) ( not ( = ?auto_64412 ?auto_64417 ) ) ( not ( = ?auto_64412 ?auto_64418 ) ) ( not ( = ?auto_64412 ?auto_64419 ) ) ( not ( = ?auto_64413 ?auto_64414 ) ) ( not ( = ?auto_64413 ?auto_64415 ) ) ( not ( = ?auto_64413 ?auto_64416 ) ) ( not ( = ?auto_64413 ?auto_64417 ) ) ( not ( = ?auto_64413 ?auto_64418 ) ) ( not ( = ?auto_64413 ?auto_64419 ) ) ( not ( = ?auto_64414 ?auto_64415 ) ) ( not ( = ?auto_64414 ?auto_64416 ) ) ( not ( = ?auto_64414 ?auto_64417 ) ) ( not ( = ?auto_64414 ?auto_64418 ) ) ( not ( = ?auto_64414 ?auto_64419 ) ) ( not ( = ?auto_64415 ?auto_64416 ) ) ( not ( = ?auto_64415 ?auto_64417 ) ) ( not ( = ?auto_64415 ?auto_64418 ) ) ( not ( = ?auto_64415 ?auto_64419 ) ) ( not ( = ?auto_64416 ?auto_64417 ) ) ( not ( = ?auto_64416 ?auto_64418 ) ) ( not ( = ?auto_64416 ?auto_64419 ) ) ( not ( = ?auto_64417 ?auto_64418 ) ) ( not ( = ?auto_64417 ?auto_64419 ) ) ( not ( = ?auto_64418 ?auto_64419 ) ) ( ON ?auto_64417 ?auto_64418 ) ( ON ?auto_64416 ?auto_64417 ) ( ON ?auto_64415 ?auto_64416 ) ( ON ?auto_64414 ?auto_64415 ) ( CLEAR ?auto_64412 ) ( ON ?auto_64413 ?auto_64414 ) ( CLEAR ?auto_64413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64411 ?auto_64412 ?auto_64413 )
      ( MAKE-8PILE ?auto_64411 ?auto_64412 ?auto_64413 ?auto_64414 ?auto_64415 ?auto_64416 ?auto_64417 ?auto_64418 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64428 - BLOCK
      ?auto_64429 - BLOCK
      ?auto_64430 - BLOCK
      ?auto_64431 - BLOCK
      ?auto_64432 - BLOCK
      ?auto_64433 - BLOCK
      ?auto_64434 - BLOCK
      ?auto_64435 - BLOCK
    )
    :vars
    (
      ?auto_64436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64435 ?auto_64436 ) ( ON-TABLE ?auto_64428 ) ( not ( = ?auto_64428 ?auto_64429 ) ) ( not ( = ?auto_64428 ?auto_64430 ) ) ( not ( = ?auto_64428 ?auto_64431 ) ) ( not ( = ?auto_64428 ?auto_64432 ) ) ( not ( = ?auto_64428 ?auto_64433 ) ) ( not ( = ?auto_64428 ?auto_64434 ) ) ( not ( = ?auto_64428 ?auto_64435 ) ) ( not ( = ?auto_64428 ?auto_64436 ) ) ( not ( = ?auto_64429 ?auto_64430 ) ) ( not ( = ?auto_64429 ?auto_64431 ) ) ( not ( = ?auto_64429 ?auto_64432 ) ) ( not ( = ?auto_64429 ?auto_64433 ) ) ( not ( = ?auto_64429 ?auto_64434 ) ) ( not ( = ?auto_64429 ?auto_64435 ) ) ( not ( = ?auto_64429 ?auto_64436 ) ) ( not ( = ?auto_64430 ?auto_64431 ) ) ( not ( = ?auto_64430 ?auto_64432 ) ) ( not ( = ?auto_64430 ?auto_64433 ) ) ( not ( = ?auto_64430 ?auto_64434 ) ) ( not ( = ?auto_64430 ?auto_64435 ) ) ( not ( = ?auto_64430 ?auto_64436 ) ) ( not ( = ?auto_64431 ?auto_64432 ) ) ( not ( = ?auto_64431 ?auto_64433 ) ) ( not ( = ?auto_64431 ?auto_64434 ) ) ( not ( = ?auto_64431 ?auto_64435 ) ) ( not ( = ?auto_64431 ?auto_64436 ) ) ( not ( = ?auto_64432 ?auto_64433 ) ) ( not ( = ?auto_64432 ?auto_64434 ) ) ( not ( = ?auto_64432 ?auto_64435 ) ) ( not ( = ?auto_64432 ?auto_64436 ) ) ( not ( = ?auto_64433 ?auto_64434 ) ) ( not ( = ?auto_64433 ?auto_64435 ) ) ( not ( = ?auto_64433 ?auto_64436 ) ) ( not ( = ?auto_64434 ?auto_64435 ) ) ( not ( = ?auto_64434 ?auto_64436 ) ) ( not ( = ?auto_64435 ?auto_64436 ) ) ( ON ?auto_64434 ?auto_64435 ) ( ON ?auto_64433 ?auto_64434 ) ( ON ?auto_64432 ?auto_64433 ) ( ON ?auto_64431 ?auto_64432 ) ( ON ?auto_64430 ?auto_64431 ) ( CLEAR ?auto_64428 ) ( ON ?auto_64429 ?auto_64430 ) ( CLEAR ?auto_64429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64428 ?auto_64429 )
      ( MAKE-8PILE ?auto_64428 ?auto_64429 ?auto_64430 ?auto_64431 ?auto_64432 ?auto_64433 ?auto_64434 ?auto_64435 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64445 - BLOCK
      ?auto_64446 - BLOCK
      ?auto_64447 - BLOCK
      ?auto_64448 - BLOCK
      ?auto_64449 - BLOCK
      ?auto_64450 - BLOCK
      ?auto_64451 - BLOCK
      ?auto_64452 - BLOCK
    )
    :vars
    (
      ?auto_64453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64452 ?auto_64453 ) ( ON-TABLE ?auto_64445 ) ( not ( = ?auto_64445 ?auto_64446 ) ) ( not ( = ?auto_64445 ?auto_64447 ) ) ( not ( = ?auto_64445 ?auto_64448 ) ) ( not ( = ?auto_64445 ?auto_64449 ) ) ( not ( = ?auto_64445 ?auto_64450 ) ) ( not ( = ?auto_64445 ?auto_64451 ) ) ( not ( = ?auto_64445 ?auto_64452 ) ) ( not ( = ?auto_64445 ?auto_64453 ) ) ( not ( = ?auto_64446 ?auto_64447 ) ) ( not ( = ?auto_64446 ?auto_64448 ) ) ( not ( = ?auto_64446 ?auto_64449 ) ) ( not ( = ?auto_64446 ?auto_64450 ) ) ( not ( = ?auto_64446 ?auto_64451 ) ) ( not ( = ?auto_64446 ?auto_64452 ) ) ( not ( = ?auto_64446 ?auto_64453 ) ) ( not ( = ?auto_64447 ?auto_64448 ) ) ( not ( = ?auto_64447 ?auto_64449 ) ) ( not ( = ?auto_64447 ?auto_64450 ) ) ( not ( = ?auto_64447 ?auto_64451 ) ) ( not ( = ?auto_64447 ?auto_64452 ) ) ( not ( = ?auto_64447 ?auto_64453 ) ) ( not ( = ?auto_64448 ?auto_64449 ) ) ( not ( = ?auto_64448 ?auto_64450 ) ) ( not ( = ?auto_64448 ?auto_64451 ) ) ( not ( = ?auto_64448 ?auto_64452 ) ) ( not ( = ?auto_64448 ?auto_64453 ) ) ( not ( = ?auto_64449 ?auto_64450 ) ) ( not ( = ?auto_64449 ?auto_64451 ) ) ( not ( = ?auto_64449 ?auto_64452 ) ) ( not ( = ?auto_64449 ?auto_64453 ) ) ( not ( = ?auto_64450 ?auto_64451 ) ) ( not ( = ?auto_64450 ?auto_64452 ) ) ( not ( = ?auto_64450 ?auto_64453 ) ) ( not ( = ?auto_64451 ?auto_64452 ) ) ( not ( = ?auto_64451 ?auto_64453 ) ) ( not ( = ?auto_64452 ?auto_64453 ) ) ( ON ?auto_64451 ?auto_64452 ) ( ON ?auto_64450 ?auto_64451 ) ( ON ?auto_64449 ?auto_64450 ) ( ON ?auto_64448 ?auto_64449 ) ( ON ?auto_64447 ?auto_64448 ) ( CLEAR ?auto_64445 ) ( ON ?auto_64446 ?auto_64447 ) ( CLEAR ?auto_64446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64445 ?auto_64446 )
      ( MAKE-8PILE ?auto_64445 ?auto_64446 ?auto_64447 ?auto_64448 ?auto_64449 ?auto_64450 ?auto_64451 ?auto_64452 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64462 - BLOCK
      ?auto_64463 - BLOCK
      ?auto_64464 - BLOCK
      ?auto_64465 - BLOCK
      ?auto_64466 - BLOCK
      ?auto_64467 - BLOCK
      ?auto_64468 - BLOCK
      ?auto_64469 - BLOCK
    )
    :vars
    (
      ?auto_64470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64469 ?auto_64470 ) ( not ( = ?auto_64462 ?auto_64463 ) ) ( not ( = ?auto_64462 ?auto_64464 ) ) ( not ( = ?auto_64462 ?auto_64465 ) ) ( not ( = ?auto_64462 ?auto_64466 ) ) ( not ( = ?auto_64462 ?auto_64467 ) ) ( not ( = ?auto_64462 ?auto_64468 ) ) ( not ( = ?auto_64462 ?auto_64469 ) ) ( not ( = ?auto_64462 ?auto_64470 ) ) ( not ( = ?auto_64463 ?auto_64464 ) ) ( not ( = ?auto_64463 ?auto_64465 ) ) ( not ( = ?auto_64463 ?auto_64466 ) ) ( not ( = ?auto_64463 ?auto_64467 ) ) ( not ( = ?auto_64463 ?auto_64468 ) ) ( not ( = ?auto_64463 ?auto_64469 ) ) ( not ( = ?auto_64463 ?auto_64470 ) ) ( not ( = ?auto_64464 ?auto_64465 ) ) ( not ( = ?auto_64464 ?auto_64466 ) ) ( not ( = ?auto_64464 ?auto_64467 ) ) ( not ( = ?auto_64464 ?auto_64468 ) ) ( not ( = ?auto_64464 ?auto_64469 ) ) ( not ( = ?auto_64464 ?auto_64470 ) ) ( not ( = ?auto_64465 ?auto_64466 ) ) ( not ( = ?auto_64465 ?auto_64467 ) ) ( not ( = ?auto_64465 ?auto_64468 ) ) ( not ( = ?auto_64465 ?auto_64469 ) ) ( not ( = ?auto_64465 ?auto_64470 ) ) ( not ( = ?auto_64466 ?auto_64467 ) ) ( not ( = ?auto_64466 ?auto_64468 ) ) ( not ( = ?auto_64466 ?auto_64469 ) ) ( not ( = ?auto_64466 ?auto_64470 ) ) ( not ( = ?auto_64467 ?auto_64468 ) ) ( not ( = ?auto_64467 ?auto_64469 ) ) ( not ( = ?auto_64467 ?auto_64470 ) ) ( not ( = ?auto_64468 ?auto_64469 ) ) ( not ( = ?auto_64468 ?auto_64470 ) ) ( not ( = ?auto_64469 ?auto_64470 ) ) ( ON ?auto_64468 ?auto_64469 ) ( ON ?auto_64467 ?auto_64468 ) ( ON ?auto_64466 ?auto_64467 ) ( ON ?auto_64465 ?auto_64466 ) ( ON ?auto_64464 ?auto_64465 ) ( ON ?auto_64463 ?auto_64464 ) ( ON ?auto_64462 ?auto_64463 ) ( CLEAR ?auto_64462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64462 )
      ( MAKE-8PILE ?auto_64462 ?auto_64463 ?auto_64464 ?auto_64465 ?auto_64466 ?auto_64467 ?auto_64468 ?auto_64469 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_64479 - BLOCK
      ?auto_64480 - BLOCK
      ?auto_64481 - BLOCK
      ?auto_64482 - BLOCK
      ?auto_64483 - BLOCK
      ?auto_64484 - BLOCK
      ?auto_64485 - BLOCK
      ?auto_64486 - BLOCK
    )
    :vars
    (
      ?auto_64487 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64486 ?auto_64487 ) ( not ( = ?auto_64479 ?auto_64480 ) ) ( not ( = ?auto_64479 ?auto_64481 ) ) ( not ( = ?auto_64479 ?auto_64482 ) ) ( not ( = ?auto_64479 ?auto_64483 ) ) ( not ( = ?auto_64479 ?auto_64484 ) ) ( not ( = ?auto_64479 ?auto_64485 ) ) ( not ( = ?auto_64479 ?auto_64486 ) ) ( not ( = ?auto_64479 ?auto_64487 ) ) ( not ( = ?auto_64480 ?auto_64481 ) ) ( not ( = ?auto_64480 ?auto_64482 ) ) ( not ( = ?auto_64480 ?auto_64483 ) ) ( not ( = ?auto_64480 ?auto_64484 ) ) ( not ( = ?auto_64480 ?auto_64485 ) ) ( not ( = ?auto_64480 ?auto_64486 ) ) ( not ( = ?auto_64480 ?auto_64487 ) ) ( not ( = ?auto_64481 ?auto_64482 ) ) ( not ( = ?auto_64481 ?auto_64483 ) ) ( not ( = ?auto_64481 ?auto_64484 ) ) ( not ( = ?auto_64481 ?auto_64485 ) ) ( not ( = ?auto_64481 ?auto_64486 ) ) ( not ( = ?auto_64481 ?auto_64487 ) ) ( not ( = ?auto_64482 ?auto_64483 ) ) ( not ( = ?auto_64482 ?auto_64484 ) ) ( not ( = ?auto_64482 ?auto_64485 ) ) ( not ( = ?auto_64482 ?auto_64486 ) ) ( not ( = ?auto_64482 ?auto_64487 ) ) ( not ( = ?auto_64483 ?auto_64484 ) ) ( not ( = ?auto_64483 ?auto_64485 ) ) ( not ( = ?auto_64483 ?auto_64486 ) ) ( not ( = ?auto_64483 ?auto_64487 ) ) ( not ( = ?auto_64484 ?auto_64485 ) ) ( not ( = ?auto_64484 ?auto_64486 ) ) ( not ( = ?auto_64484 ?auto_64487 ) ) ( not ( = ?auto_64485 ?auto_64486 ) ) ( not ( = ?auto_64485 ?auto_64487 ) ) ( not ( = ?auto_64486 ?auto_64487 ) ) ( ON ?auto_64485 ?auto_64486 ) ( ON ?auto_64484 ?auto_64485 ) ( ON ?auto_64483 ?auto_64484 ) ( ON ?auto_64482 ?auto_64483 ) ( ON ?auto_64481 ?auto_64482 ) ( ON ?auto_64480 ?auto_64481 ) ( ON ?auto_64479 ?auto_64480 ) ( CLEAR ?auto_64479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64479 )
      ( MAKE-8PILE ?auto_64479 ?auto_64480 ?auto_64481 ?auto_64482 ?auto_64483 ?auto_64484 ?auto_64485 ?auto_64486 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64497 - BLOCK
      ?auto_64498 - BLOCK
      ?auto_64499 - BLOCK
      ?auto_64500 - BLOCK
      ?auto_64501 - BLOCK
      ?auto_64502 - BLOCK
      ?auto_64503 - BLOCK
      ?auto_64504 - BLOCK
      ?auto_64505 - BLOCK
    )
    :vars
    (
      ?auto_64506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64504 ) ( ON ?auto_64505 ?auto_64506 ) ( CLEAR ?auto_64505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64497 ) ( ON ?auto_64498 ?auto_64497 ) ( ON ?auto_64499 ?auto_64498 ) ( ON ?auto_64500 ?auto_64499 ) ( ON ?auto_64501 ?auto_64500 ) ( ON ?auto_64502 ?auto_64501 ) ( ON ?auto_64503 ?auto_64502 ) ( ON ?auto_64504 ?auto_64503 ) ( not ( = ?auto_64497 ?auto_64498 ) ) ( not ( = ?auto_64497 ?auto_64499 ) ) ( not ( = ?auto_64497 ?auto_64500 ) ) ( not ( = ?auto_64497 ?auto_64501 ) ) ( not ( = ?auto_64497 ?auto_64502 ) ) ( not ( = ?auto_64497 ?auto_64503 ) ) ( not ( = ?auto_64497 ?auto_64504 ) ) ( not ( = ?auto_64497 ?auto_64505 ) ) ( not ( = ?auto_64497 ?auto_64506 ) ) ( not ( = ?auto_64498 ?auto_64499 ) ) ( not ( = ?auto_64498 ?auto_64500 ) ) ( not ( = ?auto_64498 ?auto_64501 ) ) ( not ( = ?auto_64498 ?auto_64502 ) ) ( not ( = ?auto_64498 ?auto_64503 ) ) ( not ( = ?auto_64498 ?auto_64504 ) ) ( not ( = ?auto_64498 ?auto_64505 ) ) ( not ( = ?auto_64498 ?auto_64506 ) ) ( not ( = ?auto_64499 ?auto_64500 ) ) ( not ( = ?auto_64499 ?auto_64501 ) ) ( not ( = ?auto_64499 ?auto_64502 ) ) ( not ( = ?auto_64499 ?auto_64503 ) ) ( not ( = ?auto_64499 ?auto_64504 ) ) ( not ( = ?auto_64499 ?auto_64505 ) ) ( not ( = ?auto_64499 ?auto_64506 ) ) ( not ( = ?auto_64500 ?auto_64501 ) ) ( not ( = ?auto_64500 ?auto_64502 ) ) ( not ( = ?auto_64500 ?auto_64503 ) ) ( not ( = ?auto_64500 ?auto_64504 ) ) ( not ( = ?auto_64500 ?auto_64505 ) ) ( not ( = ?auto_64500 ?auto_64506 ) ) ( not ( = ?auto_64501 ?auto_64502 ) ) ( not ( = ?auto_64501 ?auto_64503 ) ) ( not ( = ?auto_64501 ?auto_64504 ) ) ( not ( = ?auto_64501 ?auto_64505 ) ) ( not ( = ?auto_64501 ?auto_64506 ) ) ( not ( = ?auto_64502 ?auto_64503 ) ) ( not ( = ?auto_64502 ?auto_64504 ) ) ( not ( = ?auto_64502 ?auto_64505 ) ) ( not ( = ?auto_64502 ?auto_64506 ) ) ( not ( = ?auto_64503 ?auto_64504 ) ) ( not ( = ?auto_64503 ?auto_64505 ) ) ( not ( = ?auto_64503 ?auto_64506 ) ) ( not ( = ?auto_64504 ?auto_64505 ) ) ( not ( = ?auto_64504 ?auto_64506 ) ) ( not ( = ?auto_64505 ?auto_64506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64505 ?auto_64506 )
      ( !STACK ?auto_64505 ?auto_64504 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64516 - BLOCK
      ?auto_64517 - BLOCK
      ?auto_64518 - BLOCK
      ?auto_64519 - BLOCK
      ?auto_64520 - BLOCK
      ?auto_64521 - BLOCK
      ?auto_64522 - BLOCK
      ?auto_64523 - BLOCK
      ?auto_64524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64523 ) ( ON-TABLE ?auto_64524 ) ( CLEAR ?auto_64524 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64516 ) ( ON ?auto_64517 ?auto_64516 ) ( ON ?auto_64518 ?auto_64517 ) ( ON ?auto_64519 ?auto_64518 ) ( ON ?auto_64520 ?auto_64519 ) ( ON ?auto_64521 ?auto_64520 ) ( ON ?auto_64522 ?auto_64521 ) ( ON ?auto_64523 ?auto_64522 ) ( not ( = ?auto_64516 ?auto_64517 ) ) ( not ( = ?auto_64516 ?auto_64518 ) ) ( not ( = ?auto_64516 ?auto_64519 ) ) ( not ( = ?auto_64516 ?auto_64520 ) ) ( not ( = ?auto_64516 ?auto_64521 ) ) ( not ( = ?auto_64516 ?auto_64522 ) ) ( not ( = ?auto_64516 ?auto_64523 ) ) ( not ( = ?auto_64516 ?auto_64524 ) ) ( not ( = ?auto_64517 ?auto_64518 ) ) ( not ( = ?auto_64517 ?auto_64519 ) ) ( not ( = ?auto_64517 ?auto_64520 ) ) ( not ( = ?auto_64517 ?auto_64521 ) ) ( not ( = ?auto_64517 ?auto_64522 ) ) ( not ( = ?auto_64517 ?auto_64523 ) ) ( not ( = ?auto_64517 ?auto_64524 ) ) ( not ( = ?auto_64518 ?auto_64519 ) ) ( not ( = ?auto_64518 ?auto_64520 ) ) ( not ( = ?auto_64518 ?auto_64521 ) ) ( not ( = ?auto_64518 ?auto_64522 ) ) ( not ( = ?auto_64518 ?auto_64523 ) ) ( not ( = ?auto_64518 ?auto_64524 ) ) ( not ( = ?auto_64519 ?auto_64520 ) ) ( not ( = ?auto_64519 ?auto_64521 ) ) ( not ( = ?auto_64519 ?auto_64522 ) ) ( not ( = ?auto_64519 ?auto_64523 ) ) ( not ( = ?auto_64519 ?auto_64524 ) ) ( not ( = ?auto_64520 ?auto_64521 ) ) ( not ( = ?auto_64520 ?auto_64522 ) ) ( not ( = ?auto_64520 ?auto_64523 ) ) ( not ( = ?auto_64520 ?auto_64524 ) ) ( not ( = ?auto_64521 ?auto_64522 ) ) ( not ( = ?auto_64521 ?auto_64523 ) ) ( not ( = ?auto_64521 ?auto_64524 ) ) ( not ( = ?auto_64522 ?auto_64523 ) ) ( not ( = ?auto_64522 ?auto_64524 ) ) ( not ( = ?auto_64523 ?auto_64524 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_64524 )
      ( !STACK ?auto_64524 ?auto_64523 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64534 - BLOCK
      ?auto_64535 - BLOCK
      ?auto_64536 - BLOCK
      ?auto_64537 - BLOCK
      ?auto_64538 - BLOCK
      ?auto_64539 - BLOCK
      ?auto_64540 - BLOCK
      ?auto_64541 - BLOCK
      ?auto_64542 - BLOCK
    )
    :vars
    (
      ?auto_64543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64542 ?auto_64543 ) ( ON-TABLE ?auto_64534 ) ( ON ?auto_64535 ?auto_64534 ) ( ON ?auto_64536 ?auto_64535 ) ( ON ?auto_64537 ?auto_64536 ) ( ON ?auto_64538 ?auto_64537 ) ( ON ?auto_64539 ?auto_64538 ) ( ON ?auto_64540 ?auto_64539 ) ( not ( = ?auto_64534 ?auto_64535 ) ) ( not ( = ?auto_64534 ?auto_64536 ) ) ( not ( = ?auto_64534 ?auto_64537 ) ) ( not ( = ?auto_64534 ?auto_64538 ) ) ( not ( = ?auto_64534 ?auto_64539 ) ) ( not ( = ?auto_64534 ?auto_64540 ) ) ( not ( = ?auto_64534 ?auto_64541 ) ) ( not ( = ?auto_64534 ?auto_64542 ) ) ( not ( = ?auto_64534 ?auto_64543 ) ) ( not ( = ?auto_64535 ?auto_64536 ) ) ( not ( = ?auto_64535 ?auto_64537 ) ) ( not ( = ?auto_64535 ?auto_64538 ) ) ( not ( = ?auto_64535 ?auto_64539 ) ) ( not ( = ?auto_64535 ?auto_64540 ) ) ( not ( = ?auto_64535 ?auto_64541 ) ) ( not ( = ?auto_64535 ?auto_64542 ) ) ( not ( = ?auto_64535 ?auto_64543 ) ) ( not ( = ?auto_64536 ?auto_64537 ) ) ( not ( = ?auto_64536 ?auto_64538 ) ) ( not ( = ?auto_64536 ?auto_64539 ) ) ( not ( = ?auto_64536 ?auto_64540 ) ) ( not ( = ?auto_64536 ?auto_64541 ) ) ( not ( = ?auto_64536 ?auto_64542 ) ) ( not ( = ?auto_64536 ?auto_64543 ) ) ( not ( = ?auto_64537 ?auto_64538 ) ) ( not ( = ?auto_64537 ?auto_64539 ) ) ( not ( = ?auto_64537 ?auto_64540 ) ) ( not ( = ?auto_64537 ?auto_64541 ) ) ( not ( = ?auto_64537 ?auto_64542 ) ) ( not ( = ?auto_64537 ?auto_64543 ) ) ( not ( = ?auto_64538 ?auto_64539 ) ) ( not ( = ?auto_64538 ?auto_64540 ) ) ( not ( = ?auto_64538 ?auto_64541 ) ) ( not ( = ?auto_64538 ?auto_64542 ) ) ( not ( = ?auto_64538 ?auto_64543 ) ) ( not ( = ?auto_64539 ?auto_64540 ) ) ( not ( = ?auto_64539 ?auto_64541 ) ) ( not ( = ?auto_64539 ?auto_64542 ) ) ( not ( = ?auto_64539 ?auto_64543 ) ) ( not ( = ?auto_64540 ?auto_64541 ) ) ( not ( = ?auto_64540 ?auto_64542 ) ) ( not ( = ?auto_64540 ?auto_64543 ) ) ( not ( = ?auto_64541 ?auto_64542 ) ) ( not ( = ?auto_64541 ?auto_64543 ) ) ( not ( = ?auto_64542 ?auto_64543 ) ) ( CLEAR ?auto_64540 ) ( ON ?auto_64541 ?auto_64542 ) ( CLEAR ?auto_64541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 ?auto_64538 ?auto_64539 ?auto_64540 ?auto_64541 )
      ( MAKE-9PILE ?auto_64534 ?auto_64535 ?auto_64536 ?auto_64537 ?auto_64538 ?auto_64539 ?auto_64540 ?auto_64541 ?auto_64542 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64553 - BLOCK
      ?auto_64554 - BLOCK
      ?auto_64555 - BLOCK
      ?auto_64556 - BLOCK
      ?auto_64557 - BLOCK
      ?auto_64558 - BLOCK
      ?auto_64559 - BLOCK
      ?auto_64560 - BLOCK
      ?auto_64561 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64561 ) ( ON-TABLE ?auto_64553 ) ( ON ?auto_64554 ?auto_64553 ) ( ON ?auto_64555 ?auto_64554 ) ( ON ?auto_64556 ?auto_64555 ) ( ON ?auto_64557 ?auto_64556 ) ( ON ?auto_64558 ?auto_64557 ) ( ON ?auto_64559 ?auto_64558 ) ( not ( = ?auto_64553 ?auto_64554 ) ) ( not ( = ?auto_64553 ?auto_64555 ) ) ( not ( = ?auto_64553 ?auto_64556 ) ) ( not ( = ?auto_64553 ?auto_64557 ) ) ( not ( = ?auto_64553 ?auto_64558 ) ) ( not ( = ?auto_64553 ?auto_64559 ) ) ( not ( = ?auto_64553 ?auto_64560 ) ) ( not ( = ?auto_64553 ?auto_64561 ) ) ( not ( = ?auto_64554 ?auto_64555 ) ) ( not ( = ?auto_64554 ?auto_64556 ) ) ( not ( = ?auto_64554 ?auto_64557 ) ) ( not ( = ?auto_64554 ?auto_64558 ) ) ( not ( = ?auto_64554 ?auto_64559 ) ) ( not ( = ?auto_64554 ?auto_64560 ) ) ( not ( = ?auto_64554 ?auto_64561 ) ) ( not ( = ?auto_64555 ?auto_64556 ) ) ( not ( = ?auto_64555 ?auto_64557 ) ) ( not ( = ?auto_64555 ?auto_64558 ) ) ( not ( = ?auto_64555 ?auto_64559 ) ) ( not ( = ?auto_64555 ?auto_64560 ) ) ( not ( = ?auto_64555 ?auto_64561 ) ) ( not ( = ?auto_64556 ?auto_64557 ) ) ( not ( = ?auto_64556 ?auto_64558 ) ) ( not ( = ?auto_64556 ?auto_64559 ) ) ( not ( = ?auto_64556 ?auto_64560 ) ) ( not ( = ?auto_64556 ?auto_64561 ) ) ( not ( = ?auto_64557 ?auto_64558 ) ) ( not ( = ?auto_64557 ?auto_64559 ) ) ( not ( = ?auto_64557 ?auto_64560 ) ) ( not ( = ?auto_64557 ?auto_64561 ) ) ( not ( = ?auto_64558 ?auto_64559 ) ) ( not ( = ?auto_64558 ?auto_64560 ) ) ( not ( = ?auto_64558 ?auto_64561 ) ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64561 ) ) ( not ( = ?auto_64560 ?auto_64561 ) ) ( CLEAR ?auto_64559 ) ( ON ?auto_64560 ?auto_64561 ) ( CLEAR ?auto_64560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_64553 ?auto_64554 ?auto_64555 ?auto_64556 ?auto_64557 ?auto_64558 ?auto_64559 ?auto_64560 )
      ( MAKE-9PILE ?auto_64553 ?auto_64554 ?auto_64555 ?auto_64556 ?auto_64557 ?auto_64558 ?auto_64559 ?auto_64560 ?auto_64561 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64571 - BLOCK
      ?auto_64572 - BLOCK
      ?auto_64573 - BLOCK
      ?auto_64574 - BLOCK
      ?auto_64575 - BLOCK
      ?auto_64576 - BLOCK
      ?auto_64577 - BLOCK
      ?auto_64578 - BLOCK
      ?auto_64579 - BLOCK
    )
    :vars
    (
      ?auto_64580 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64579 ?auto_64580 ) ( ON-TABLE ?auto_64571 ) ( ON ?auto_64572 ?auto_64571 ) ( ON ?auto_64573 ?auto_64572 ) ( ON ?auto_64574 ?auto_64573 ) ( ON ?auto_64575 ?auto_64574 ) ( ON ?auto_64576 ?auto_64575 ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64571 ?auto_64573 ) ) ( not ( = ?auto_64571 ?auto_64574 ) ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64571 ?auto_64576 ) ) ( not ( = ?auto_64571 ?auto_64577 ) ) ( not ( = ?auto_64571 ?auto_64578 ) ) ( not ( = ?auto_64571 ?auto_64579 ) ) ( not ( = ?auto_64571 ?auto_64580 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( not ( = ?auto_64572 ?auto_64574 ) ) ( not ( = ?auto_64572 ?auto_64575 ) ) ( not ( = ?auto_64572 ?auto_64576 ) ) ( not ( = ?auto_64572 ?auto_64577 ) ) ( not ( = ?auto_64572 ?auto_64578 ) ) ( not ( = ?auto_64572 ?auto_64579 ) ) ( not ( = ?auto_64572 ?auto_64580 ) ) ( not ( = ?auto_64573 ?auto_64574 ) ) ( not ( = ?auto_64573 ?auto_64575 ) ) ( not ( = ?auto_64573 ?auto_64576 ) ) ( not ( = ?auto_64573 ?auto_64577 ) ) ( not ( = ?auto_64573 ?auto_64578 ) ) ( not ( = ?auto_64573 ?auto_64579 ) ) ( not ( = ?auto_64573 ?auto_64580 ) ) ( not ( = ?auto_64574 ?auto_64575 ) ) ( not ( = ?auto_64574 ?auto_64576 ) ) ( not ( = ?auto_64574 ?auto_64577 ) ) ( not ( = ?auto_64574 ?auto_64578 ) ) ( not ( = ?auto_64574 ?auto_64579 ) ) ( not ( = ?auto_64574 ?auto_64580 ) ) ( not ( = ?auto_64575 ?auto_64576 ) ) ( not ( = ?auto_64575 ?auto_64577 ) ) ( not ( = ?auto_64575 ?auto_64578 ) ) ( not ( = ?auto_64575 ?auto_64579 ) ) ( not ( = ?auto_64575 ?auto_64580 ) ) ( not ( = ?auto_64576 ?auto_64577 ) ) ( not ( = ?auto_64576 ?auto_64578 ) ) ( not ( = ?auto_64576 ?auto_64579 ) ) ( not ( = ?auto_64576 ?auto_64580 ) ) ( not ( = ?auto_64577 ?auto_64578 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) ( not ( = ?auto_64577 ?auto_64580 ) ) ( not ( = ?auto_64578 ?auto_64579 ) ) ( not ( = ?auto_64578 ?auto_64580 ) ) ( not ( = ?auto_64579 ?auto_64580 ) ) ( ON ?auto_64578 ?auto_64579 ) ( CLEAR ?auto_64576 ) ( ON ?auto_64577 ?auto_64578 ) ( CLEAR ?auto_64577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ?auto_64575 ?auto_64576 ?auto_64577 )
      ( MAKE-9PILE ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ?auto_64575 ?auto_64576 ?auto_64577 ?auto_64578 ?auto_64579 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64590 - BLOCK
      ?auto_64591 - BLOCK
      ?auto_64592 - BLOCK
      ?auto_64593 - BLOCK
      ?auto_64594 - BLOCK
      ?auto_64595 - BLOCK
      ?auto_64596 - BLOCK
      ?auto_64597 - BLOCK
      ?auto_64598 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64598 ) ( ON-TABLE ?auto_64590 ) ( ON ?auto_64591 ?auto_64590 ) ( ON ?auto_64592 ?auto_64591 ) ( ON ?auto_64593 ?auto_64592 ) ( ON ?auto_64594 ?auto_64593 ) ( ON ?auto_64595 ?auto_64594 ) ( not ( = ?auto_64590 ?auto_64591 ) ) ( not ( = ?auto_64590 ?auto_64592 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64594 ) ) ( not ( = ?auto_64590 ?auto_64595 ) ) ( not ( = ?auto_64590 ?auto_64596 ) ) ( not ( = ?auto_64590 ?auto_64597 ) ) ( not ( = ?auto_64590 ?auto_64598 ) ) ( not ( = ?auto_64591 ?auto_64592 ) ) ( not ( = ?auto_64591 ?auto_64593 ) ) ( not ( = ?auto_64591 ?auto_64594 ) ) ( not ( = ?auto_64591 ?auto_64595 ) ) ( not ( = ?auto_64591 ?auto_64596 ) ) ( not ( = ?auto_64591 ?auto_64597 ) ) ( not ( = ?auto_64591 ?auto_64598 ) ) ( not ( = ?auto_64592 ?auto_64593 ) ) ( not ( = ?auto_64592 ?auto_64594 ) ) ( not ( = ?auto_64592 ?auto_64595 ) ) ( not ( = ?auto_64592 ?auto_64596 ) ) ( not ( = ?auto_64592 ?auto_64597 ) ) ( not ( = ?auto_64592 ?auto_64598 ) ) ( not ( = ?auto_64593 ?auto_64594 ) ) ( not ( = ?auto_64593 ?auto_64595 ) ) ( not ( = ?auto_64593 ?auto_64596 ) ) ( not ( = ?auto_64593 ?auto_64597 ) ) ( not ( = ?auto_64593 ?auto_64598 ) ) ( not ( = ?auto_64594 ?auto_64595 ) ) ( not ( = ?auto_64594 ?auto_64596 ) ) ( not ( = ?auto_64594 ?auto_64597 ) ) ( not ( = ?auto_64594 ?auto_64598 ) ) ( not ( = ?auto_64595 ?auto_64596 ) ) ( not ( = ?auto_64595 ?auto_64597 ) ) ( not ( = ?auto_64595 ?auto_64598 ) ) ( not ( = ?auto_64596 ?auto_64597 ) ) ( not ( = ?auto_64596 ?auto_64598 ) ) ( not ( = ?auto_64597 ?auto_64598 ) ) ( ON ?auto_64597 ?auto_64598 ) ( CLEAR ?auto_64595 ) ( ON ?auto_64596 ?auto_64597 ) ( CLEAR ?auto_64596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_64590 ?auto_64591 ?auto_64592 ?auto_64593 ?auto_64594 ?auto_64595 ?auto_64596 )
      ( MAKE-9PILE ?auto_64590 ?auto_64591 ?auto_64592 ?auto_64593 ?auto_64594 ?auto_64595 ?auto_64596 ?auto_64597 ?auto_64598 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64608 - BLOCK
      ?auto_64609 - BLOCK
      ?auto_64610 - BLOCK
      ?auto_64611 - BLOCK
      ?auto_64612 - BLOCK
      ?auto_64613 - BLOCK
      ?auto_64614 - BLOCK
      ?auto_64615 - BLOCK
      ?auto_64616 - BLOCK
    )
    :vars
    (
      ?auto_64617 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64616 ?auto_64617 ) ( ON-TABLE ?auto_64608 ) ( ON ?auto_64609 ?auto_64608 ) ( ON ?auto_64610 ?auto_64609 ) ( ON ?auto_64611 ?auto_64610 ) ( ON ?auto_64612 ?auto_64611 ) ( not ( = ?auto_64608 ?auto_64609 ) ) ( not ( = ?auto_64608 ?auto_64610 ) ) ( not ( = ?auto_64608 ?auto_64611 ) ) ( not ( = ?auto_64608 ?auto_64612 ) ) ( not ( = ?auto_64608 ?auto_64613 ) ) ( not ( = ?auto_64608 ?auto_64614 ) ) ( not ( = ?auto_64608 ?auto_64615 ) ) ( not ( = ?auto_64608 ?auto_64616 ) ) ( not ( = ?auto_64608 ?auto_64617 ) ) ( not ( = ?auto_64609 ?auto_64610 ) ) ( not ( = ?auto_64609 ?auto_64611 ) ) ( not ( = ?auto_64609 ?auto_64612 ) ) ( not ( = ?auto_64609 ?auto_64613 ) ) ( not ( = ?auto_64609 ?auto_64614 ) ) ( not ( = ?auto_64609 ?auto_64615 ) ) ( not ( = ?auto_64609 ?auto_64616 ) ) ( not ( = ?auto_64609 ?auto_64617 ) ) ( not ( = ?auto_64610 ?auto_64611 ) ) ( not ( = ?auto_64610 ?auto_64612 ) ) ( not ( = ?auto_64610 ?auto_64613 ) ) ( not ( = ?auto_64610 ?auto_64614 ) ) ( not ( = ?auto_64610 ?auto_64615 ) ) ( not ( = ?auto_64610 ?auto_64616 ) ) ( not ( = ?auto_64610 ?auto_64617 ) ) ( not ( = ?auto_64611 ?auto_64612 ) ) ( not ( = ?auto_64611 ?auto_64613 ) ) ( not ( = ?auto_64611 ?auto_64614 ) ) ( not ( = ?auto_64611 ?auto_64615 ) ) ( not ( = ?auto_64611 ?auto_64616 ) ) ( not ( = ?auto_64611 ?auto_64617 ) ) ( not ( = ?auto_64612 ?auto_64613 ) ) ( not ( = ?auto_64612 ?auto_64614 ) ) ( not ( = ?auto_64612 ?auto_64615 ) ) ( not ( = ?auto_64612 ?auto_64616 ) ) ( not ( = ?auto_64612 ?auto_64617 ) ) ( not ( = ?auto_64613 ?auto_64614 ) ) ( not ( = ?auto_64613 ?auto_64615 ) ) ( not ( = ?auto_64613 ?auto_64616 ) ) ( not ( = ?auto_64613 ?auto_64617 ) ) ( not ( = ?auto_64614 ?auto_64615 ) ) ( not ( = ?auto_64614 ?auto_64616 ) ) ( not ( = ?auto_64614 ?auto_64617 ) ) ( not ( = ?auto_64615 ?auto_64616 ) ) ( not ( = ?auto_64615 ?auto_64617 ) ) ( not ( = ?auto_64616 ?auto_64617 ) ) ( ON ?auto_64615 ?auto_64616 ) ( ON ?auto_64614 ?auto_64615 ) ( CLEAR ?auto_64612 ) ( ON ?auto_64613 ?auto_64614 ) ( CLEAR ?auto_64613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64608 ?auto_64609 ?auto_64610 ?auto_64611 ?auto_64612 ?auto_64613 )
      ( MAKE-9PILE ?auto_64608 ?auto_64609 ?auto_64610 ?auto_64611 ?auto_64612 ?auto_64613 ?auto_64614 ?auto_64615 ?auto_64616 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64627 - BLOCK
      ?auto_64628 - BLOCK
      ?auto_64629 - BLOCK
      ?auto_64630 - BLOCK
      ?auto_64631 - BLOCK
      ?auto_64632 - BLOCK
      ?auto_64633 - BLOCK
      ?auto_64634 - BLOCK
      ?auto_64635 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64635 ) ( ON-TABLE ?auto_64627 ) ( ON ?auto_64628 ?auto_64627 ) ( ON ?auto_64629 ?auto_64628 ) ( ON ?auto_64630 ?auto_64629 ) ( ON ?auto_64631 ?auto_64630 ) ( not ( = ?auto_64627 ?auto_64628 ) ) ( not ( = ?auto_64627 ?auto_64629 ) ) ( not ( = ?auto_64627 ?auto_64630 ) ) ( not ( = ?auto_64627 ?auto_64631 ) ) ( not ( = ?auto_64627 ?auto_64632 ) ) ( not ( = ?auto_64627 ?auto_64633 ) ) ( not ( = ?auto_64627 ?auto_64634 ) ) ( not ( = ?auto_64627 ?auto_64635 ) ) ( not ( = ?auto_64628 ?auto_64629 ) ) ( not ( = ?auto_64628 ?auto_64630 ) ) ( not ( = ?auto_64628 ?auto_64631 ) ) ( not ( = ?auto_64628 ?auto_64632 ) ) ( not ( = ?auto_64628 ?auto_64633 ) ) ( not ( = ?auto_64628 ?auto_64634 ) ) ( not ( = ?auto_64628 ?auto_64635 ) ) ( not ( = ?auto_64629 ?auto_64630 ) ) ( not ( = ?auto_64629 ?auto_64631 ) ) ( not ( = ?auto_64629 ?auto_64632 ) ) ( not ( = ?auto_64629 ?auto_64633 ) ) ( not ( = ?auto_64629 ?auto_64634 ) ) ( not ( = ?auto_64629 ?auto_64635 ) ) ( not ( = ?auto_64630 ?auto_64631 ) ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( not ( = ?auto_64630 ?auto_64633 ) ) ( not ( = ?auto_64630 ?auto_64634 ) ) ( not ( = ?auto_64630 ?auto_64635 ) ) ( not ( = ?auto_64631 ?auto_64632 ) ) ( not ( = ?auto_64631 ?auto_64633 ) ) ( not ( = ?auto_64631 ?auto_64634 ) ) ( not ( = ?auto_64631 ?auto_64635 ) ) ( not ( = ?auto_64632 ?auto_64633 ) ) ( not ( = ?auto_64632 ?auto_64634 ) ) ( not ( = ?auto_64632 ?auto_64635 ) ) ( not ( = ?auto_64633 ?auto_64634 ) ) ( not ( = ?auto_64633 ?auto_64635 ) ) ( not ( = ?auto_64634 ?auto_64635 ) ) ( ON ?auto_64634 ?auto_64635 ) ( ON ?auto_64633 ?auto_64634 ) ( CLEAR ?auto_64631 ) ( ON ?auto_64632 ?auto_64633 ) ( CLEAR ?auto_64632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64627 ?auto_64628 ?auto_64629 ?auto_64630 ?auto_64631 ?auto_64632 )
      ( MAKE-9PILE ?auto_64627 ?auto_64628 ?auto_64629 ?auto_64630 ?auto_64631 ?auto_64632 ?auto_64633 ?auto_64634 ?auto_64635 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64645 - BLOCK
      ?auto_64646 - BLOCK
      ?auto_64647 - BLOCK
      ?auto_64648 - BLOCK
      ?auto_64649 - BLOCK
      ?auto_64650 - BLOCK
      ?auto_64651 - BLOCK
      ?auto_64652 - BLOCK
      ?auto_64653 - BLOCK
    )
    :vars
    (
      ?auto_64654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64653 ?auto_64654 ) ( ON-TABLE ?auto_64645 ) ( ON ?auto_64646 ?auto_64645 ) ( ON ?auto_64647 ?auto_64646 ) ( ON ?auto_64648 ?auto_64647 ) ( not ( = ?auto_64645 ?auto_64646 ) ) ( not ( = ?auto_64645 ?auto_64647 ) ) ( not ( = ?auto_64645 ?auto_64648 ) ) ( not ( = ?auto_64645 ?auto_64649 ) ) ( not ( = ?auto_64645 ?auto_64650 ) ) ( not ( = ?auto_64645 ?auto_64651 ) ) ( not ( = ?auto_64645 ?auto_64652 ) ) ( not ( = ?auto_64645 ?auto_64653 ) ) ( not ( = ?auto_64645 ?auto_64654 ) ) ( not ( = ?auto_64646 ?auto_64647 ) ) ( not ( = ?auto_64646 ?auto_64648 ) ) ( not ( = ?auto_64646 ?auto_64649 ) ) ( not ( = ?auto_64646 ?auto_64650 ) ) ( not ( = ?auto_64646 ?auto_64651 ) ) ( not ( = ?auto_64646 ?auto_64652 ) ) ( not ( = ?auto_64646 ?auto_64653 ) ) ( not ( = ?auto_64646 ?auto_64654 ) ) ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64647 ?auto_64649 ) ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( not ( = ?auto_64647 ?auto_64651 ) ) ( not ( = ?auto_64647 ?auto_64652 ) ) ( not ( = ?auto_64647 ?auto_64653 ) ) ( not ( = ?auto_64647 ?auto_64654 ) ) ( not ( = ?auto_64648 ?auto_64649 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64651 ) ) ( not ( = ?auto_64648 ?auto_64652 ) ) ( not ( = ?auto_64648 ?auto_64653 ) ) ( not ( = ?auto_64648 ?auto_64654 ) ) ( not ( = ?auto_64649 ?auto_64650 ) ) ( not ( = ?auto_64649 ?auto_64651 ) ) ( not ( = ?auto_64649 ?auto_64652 ) ) ( not ( = ?auto_64649 ?auto_64653 ) ) ( not ( = ?auto_64649 ?auto_64654 ) ) ( not ( = ?auto_64650 ?auto_64651 ) ) ( not ( = ?auto_64650 ?auto_64652 ) ) ( not ( = ?auto_64650 ?auto_64653 ) ) ( not ( = ?auto_64650 ?auto_64654 ) ) ( not ( = ?auto_64651 ?auto_64652 ) ) ( not ( = ?auto_64651 ?auto_64653 ) ) ( not ( = ?auto_64651 ?auto_64654 ) ) ( not ( = ?auto_64652 ?auto_64653 ) ) ( not ( = ?auto_64652 ?auto_64654 ) ) ( not ( = ?auto_64653 ?auto_64654 ) ) ( ON ?auto_64652 ?auto_64653 ) ( ON ?auto_64651 ?auto_64652 ) ( ON ?auto_64650 ?auto_64651 ) ( CLEAR ?auto_64648 ) ( ON ?auto_64649 ?auto_64650 ) ( CLEAR ?auto_64649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64648 ?auto_64649 )
      ( MAKE-9PILE ?auto_64645 ?auto_64646 ?auto_64647 ?auto_64648 ?auto_64649 ?auto_64650 ?auto_64651 ?auto_64652 ?auto_64653 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64664 - BLOCK
      ?auto_64665 - BLOCK
      ?auto_64666 - BLOCK
      ?auto_64667 - BLOCK
      ?auto_64668 - BLOCK
      ?auto_64669 - BLOCK
      ?auto_64670 - BLOCK
      ?auto_64671 - BLOCK
      ?auto_64672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64672 ) ( ON-TABLE ?auto_64664 ) ( ON ?auto_64665 ?auto_64664 ) ( ON ?auto_64666 ?auto_64665 ) ( ON ?auto_64667 ?auto_64666 ) ( not ( = ?auto_64664 ?auto_64665 ) ) ( not ( = ?auto_64664 ?auto_64666 ) ) ( not ( = ?auto_64664 ?auto_64667 ) ) ( not ( = ?auto_64664 ?auto_64668 ) ) ( not ( = ?auto_64664 ?auto_64669 ) ) ( not ( = ?auto_64664 ?auto_64670 ) ) ( not ( = ?auto_64664 ?auto_64671 ) ) ( not ( = ?auto_64664 ?auto_64672 ) ) ( not ( = ?auto_64665 ?auto_64666 ) ) ( not ( = ?auto_64665 ?auto_64667 ) ) ( not ( = ?auto_64665 ?auto_64668 ) ) ( not ( = ?auto_64665 ?auto_64669 ) ) ( not ( = ?auto_64665 ?auto_64670 ) ) ( not ( = ?auto_64665 ?auto_64671 ) ) ( not ( = ?auto_64665 ?auto_64672 ) ) ( not ( = ?auto_64666 ?auto_64667 ) ) ( not ( = ?auto_64666 ?auto_64668 ) ) ( not ( = ?auto_64666 ?auto_64669 ) ) ( not ( = ?auto_64666 ?auto_64670 ) ) ( not ( = ?auto_64666 ?auto_64671 ) ) ( not ( = ?auto_64666 ?auto_64672 ) ) ( not ( = ?auto_64667 ?auto_64668 ) ) ( not ( = ?auto_64667 ?auto_64669 ) ) ( not ( = ?auto_64667 ?auto_64670 ) ) ( not ( = ?auto_64667 ?auto_64671 ) ) ( not ( = ?auto_64667 ?auto_64672 ) ) ( not ( = ?auto_64668 ?auto_64669 ) ) ( not ( = ?auto_64668 ?auto_64670 ) ) ( not ( = ?auto_64668 ?auto_64671 ) ) ( not ( = ?auto_64668 ?auto_64672 ) ) ( not ( = ?auto_64669 ?auto_64670 ) ) ( not ( = ?auto_64669 ?auto_64671 ) ) ( not ( = ?auto_64669 ?auto_64672 ) ) ( not ( = ?auto_64670 ?auto_64671 ) ) ( not ( = ?auto_64670 ?auto_64672 ) ) ( not ( = ?auto_64671 ?auto_64672 ) ) ( ON ?auto_64671 ?auto_64672 ) ( ON ?auto_64670 ?auto_64671 ) ( ON ?auto_64669 ?auto_64670 ) ( CLEAR ?auto_64667 ) ( ON ?auto_64668 ?auto_64669 ) ( CLEAR ?auto_64668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64664 ?auto_64665 ?auto_64666 ?auto_64667 ?auto_64668 )
      ( MAKE-9PILE ?auto_64664 ?auto_64665 ?auto_64666 ?auto_64667 ?auto_64668 ?auto_64669 ?auto_64670 ?auto_64671 ?auto_64672 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64682 - BLOCK
      ?auto_64683 - BLOCK
      ?auto_64684 - BLOCK
      ?auto_64685 - BLOCK
      ?auto_64686 - BLOCK
      ?auto_64687 - BLOCK
      ?auto_64688 - BLOCK
      ?auto_64689 - BLOCK
      ?auto_64690 - BLOCK
    )
    :vars
    (
      ?auto_64691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64690 ?auto_64691 ) ( ON-TABLE ?auto_64682 ) ( ON ?auto_64683 ?auto_64682 ) ( ON ?auto_64684 ?auto_64683 ) ( not ( = ?auto_64682 ?auto_64683 ) ) ( not ( = ?auto_64682 ?auto_64684 ) ) ( not ( = ?auto_64682 ?auto_64685 ) ) ( not ( = ?auto_64682 ?auto_64686 ) ) ( not ( = ?auto_64682 ?auto_64687 ) ) ( not ( = ?auto_64682 ?auto_64688 ) ) ( not ( = ?auto_64682 ?auto_64689 ) ) ( not ( = ?auto_64682 ?auto_64690 ) ) ( not ( = ?auto_64682 ?auto_64691 ) ) ( not ( = ?auto_64683 ?auto_64684 ) ) ( not ( = ?auto_64683 ?auto_64685 ) ) ( not ( = ?auto_64683 ?auto_64686 ) ) ( not ( = ?auto_64683 ?auto_64687 ) ) ( not ( = ?auto_64683 ?auto_64688 ) ) ( not ( = ?auto_64683 ?auto_64689 ) ) ( not ( = ?auto_64683 ?auto_64690 ) ) ( not ( = ?auto_64683 ?auto_64691 ) ) ( not ( = ?auto_64684 ?auto_64685 ) ) ( not ( = ?auto_64684 ?auto_64686 ) ) ( not ( = ?auto_64684 ?auto_64687 ) ) ( not ( = ?auto_64684 ?auto_64688 ) ) ( not ( = ?auto_64684 ?auto_64689 ) ) ( not ( = ?auto_64684 ?auto_64690 ) ) ( not ( = ?auto_64684 ?auto_64691 ) ) ( not ( = ?auto_64685 ?auto_64686 ) ) ( not ( = ?auto_64685 ?auto_64687 ) ) ( not ( = ?auto_64685 ?auto_64688 ) ) ( not ( = ?auto_64685 ?auto_64689 ) ) ( not ( = ?auto_64685 ?auto_64690 ) ) ( not ( = ?auto_64685 ?auto_64691 ) ) ( not ( = ?auto_64686 ?auto_64687 ) ) ( not ( = ?auto_64686 ?auto_64688 ) ) ( not ( = ?auto_64686 ?auto_64689 ) ) ( not ( = ?auto_64686 ?auto_64690 ) ) ( not ( = ?auto_64686 ?auto_64691 ) ) ( not ( = ?auto_64687 ?auto_64688 ) ) ( not ( = ?auto_64687 ?auto_64689 ) ) ( not ( = ?auto_64687 ?auto_64690 ) ) ( not ( = ?auto_64687 ?auto_64691 ) ) ( not ( = ?auto_64688 ?auto_64689 ) ) ( not ( = ?auto_64688 ?auto_64690 ) ) ( not ( = ?auto_64688 ?auto_64691 ) ) ( not ( = ?auto_64689 ?auto_64690 ) ) ( not ( = ?auto_64689 ?auto_64691 ) ) ( not ( = ?auto_64690 ?auto_64691 ) ) ( ON ?auto_64689 ?auto_64690 ) ( ON ?auto_64688 ?auto_64689 ) ( ON ?auto_64687 ?auto_64688 ) ( ON ?auto_64686 ?auto_64687 ) ( CLEAR ?auto_64684 ) ( ON ?auto_64685 ?auto_64686 ) ( CLEAR ?auto_64685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64682 ?auto_64683 ?auto_64684 ?auto_64685 )
      ( MAKE-9PILE ?auto_64682 ?auto_64683 ?auto_64684 ?auto_64685 ?auto_64686 ?auto_64687 ?auto_64688 ?auto_64689 ?auto_64690 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64701 - BLOCK
      ?auto_64702 - BLOCK
      ?auto_64703 - BLOCK
      ?auto_64704 - BLOCK
      ?auto_64705 - BLOCK
      ?auto_64706 - BLOCK
      ?auto_64707 - BLOCK
      ?auto_64708 - BLOCK
      ?auto_64709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64709 ) ( ON-TABLE ?auto_64701 ) ( ON ?auto_64702 ?auto_64701 ) ( ON ?auto_64703 ?auto_64702 ) ( not ( = ?auto_64701 ?auto_64702 ) ) ( not ( = ?auto_64701 ?auto_64703 ) ) ( not ( = ?auto_64701 ?auto_64704 ) ) ( not ( = ?auto_64701 ?auto_64705 ) ) ( not ( = ?auto_64701 ?auto_64706 ) ) ( not ( = ?auto_64701 ?auto_64707 ) ) ( not ( = ?auto_64701 ?auto_64708 ) ) ( not ( = ?auto_64701 ?auto_64709 ) ) ( not ( = ?auto_64702 ?auto_64703 ) ) ( not ( = ?auto_64702 ?auto_64704 ) ) ( not ( = ?auto_64702 ?auto_64705 ) ) ( not ( = ?auto_64702 ?auto_64706 ) ) ( not ( = ?auto_64702 ?auto_64707 ) ) ( not ( = ?auto_64702 ?auto_64708 ) ) ( not ( = ?auto_64702 ?auto_64709 ) ) ( not ( = ?auto_64703 ?auto_64704 ) ) ( not ( = ?auto_64703 ?auto_64705 ) ) ( not ( = ?auto_64703 ?auto_64706 ) ) ( not ( = ?auto_64703 ?auto_64707 ) ) ( not ( = ?auto_64703 ?auto_64708 ) ) ( not ( = ?auto_64703 ?auto_64709 ) ) ( not ( = ?auto_64704 ?auto_64705 ) ) ( not ( = ?auto_64704 ?auto_64706 ) ) ( not ( = ?auto_64704 ?auto_64707 ) ) ( not ( = ?auto_64704 ?auto_64708 ) ) ( not ( = ?auto_64704 ?auto_64709 ) ) ( not ( = ?auto_64705 ?auto_64706 ) ) ( not ( = ?auto_64705 ?auto_64707 ) ) ( not ( = ?auto_64705 ?auto_64708 ) ) ( not ( = ?auto_64705 ?auto_64709 ) ) ( not ( = ?auto_64706 ?auto_64707 ) ) ( not ( = ?auto_64706 ?auto_64708 ) ) ( not ( = ?auto_64706 ?auto_64709 ) ) ( not ( = ?auto_64707 ?auto_64708 ) ) ( not ( = ?auto_64707 ?auto_64709 ) ) ( not ( = ?auto_64708 ?auto_64709 ) ) ( ON ?auto_64708 ?auto_64709 ) ( ON ?auto_64707 ?auto_64708 ) ( ON ?auto_64706 ?auto_64707 ) ( ON ?auto_64705 ?auto_64706 ) ( CLEAR ?auto_64703 ) ( ON ?auto_64704 ?auto_64705 ) ( CLEAR ?auto_64704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 )
      ( MAKE-9PILE ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 ?auto_64705 ?auto_64706 ?auto_64707 ?auto_64708 ?auto_64709 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64719 - BLOCK
      ?auto_64720 - BLOCK
      ?auto_64721 - BLOCK
      ?auto_64722 - BLOCK
      ?auto_64723 - BLOCK
      ?auto_64724 - BLOCK
      ?auto_64725 - BLOCK
      ?auto_64726 - BLOCK
      ?auto_64727 - BLOCK
    )
    :vars
    (
      ?auto_64728 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64727 ?auto_64728 ) ( ON-TABLE ?auto_64719 ) ( ON ?auto_64720 ?auto_64719 ) ( not ( = ?auto_64719 ?auto_64720 ) ) ( not ( = ?auto_64719 ?auto_64721 ) ) ( not ( = ?auto_64719 ?auto_64722 ) ) ( not ( = ?auto_64719 ?auto_64723 ) ) ( not ( = ?auto_64719 ?auto_64724 ) ) ( not ( = ?auto_64719 ?auto_64725 ) ) ( not ( = ?auto_64719 ?auto_64726 ) ) ( not ( = ?auto_64719 ?auto_64727 ) ) ( not ( = ?auto_64719 ?auto_64728 ) ) ( not ( = ?auto_64720 ?auto_64721 ) ) ( not ( = ?auto_64720 ?auto_64722 ) ) ( not ( = ?auto_64720 ?auto_64723 ) ) ( not ( = ?auto_64720 ?auto_64724 ) ) ( not ( = ?auto_64720 ?auto_64725 ) ) ( not ( = ?auto_64720 ?auto_64726 ) ) ( not ( = ?auto_64720 ?auto_64727 ) ) ( not ( = ?auto_64720 ?auto_64728 ) ) ( not ( = ?auto_64721 ?auto_64722 ) ) ( not ( = ?auto_64721 ?auto_64723 ) ) ( not ( = ?auto_64721 ?auto_64724 ) ) ( not ( = ?auto_64721 ?auto_64725 ) ) ( not ( = ?auto_64721 ?auto_64726 ) ) ( not ( = ?auto_64721 ?auto_64727 ) ) ( not ( = ?auto_64721 ?auto_64728 ) ) ( not ( = ?auto_64722 ?auto_64723 ) ) ( not ( = ?auto_64722 ?auto_64724 ) ) ( not ( = ?auto_64722 ?auto_64725 ) ) ( not ( = ?auto_64722 ?auto_64726 ) ) ( not ( = ?auto_64722 ?auto_64727 ) ) ( not ( = ?auto_64722 ?auto_64728 ) ) ( not ( = ?auto_64723 ?auto_64724 ) ) ( not ( = ?auto_64723 ?auto_64725 ) ) ( not ( = ?auto_64723 ?auto_64726 ) ) ( not ( = ?auto_64723 ?auto_64727 ) ) ( not ( = ?auto_64723 ?auto_64728 ) ) ( not ( = ?auto_64724 ?auto_64725 ) ) ( not ( = ?auto_64724 ?auto_64726 ) ) ( not ( = ?auto_64724 ?auto_64727 ) ) ( not ( = ?auto_64724 ?auto_64728 ) ) ( not ( = ?auto_64725 ?auto_64726 ) ) ( not ( = ?auto_64725 ?auto_64727 ) ) ( not ( = ?auto_64725 ?auto_64728 ) ) ( not ( = ?auto_64726 ?auto_64727 ) ) ( not ( = ?auto_64726 ?auto_64728 ) ) ( not ( = ?auto_64727 ?auto_64728 ) ) ( ON ?auto_64726 ?auto_64727 ) ( ON ?auto_64725 ?auto_64726 ) ( ON ?auto_64724 ?auto_64725 ) ( ON ?auto_64723 ?auto_64724 ) ( ON ?auto_64722 ?auto_64723 ) ( CLEAR ?auto_64720 ) ( ON ?auto_64721 ?auto_64722 ) ( CLEAR ?auto_64721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64719 ?auto_64720 ?auto_64721 )
      ( MAKE-9PILE ?auto_64719 ?auto_64720 ?auto_64721 ?auto_64722 ?auto_64723 ?auto_64724 ?auto_64725 ?auto_64726 ?auto_64727 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64738 - BLOCK
      ?auto_64739 - BLOCK
      ?auto_64740 - BLOCK
      ?auto_64741 - BLOCK
      ?auto_64742 - BLOCK
      ?auto_64743 - BLOCK
      ?auto_64744 - BLOCK
      ?auto_64745 - BLOCK
      ?auto_64746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64746 ) ( ON-TABLE ?auto_64738 ) ( ON ?auto_64739 ?auto_64738 ) ( not ( = ?auto_64738 ?auto_64739 ) ) ( not ( = ?auto_64738 ?auto_64740 ) ) ( not ( = ?auto_64738 ?auto_64741 ) ) ( not ( = ?auto_64738 ?auto_64742 ) ) ( not ( = ?auto_64738 ?auto_64743 ) ) ( not ( = ?auto_64738 ?auto_64744 ) ) ( not ( = ?auto_64738 ?auto_64745 ) ) ( not ( = ?auto_64738 ?auto_64746 ) ) ( not ( = ?auto_64739 ?auto_64740 ) ) ( not ( = ?auto_64739 ?auto_64741 ) ) ( not ( = ?auto_64739 ?auto_64742 ) ) ( not ( = ?auto_64739 ?auto_64743 ) ) ( not ( = ?auto_64739 ?auto_64744 ) ) ( not ( = ?auto_64739 ?auto_64745 ) ) ( not ( = ?auto_64739 ?auto_64746 ) ) ( not ( = ?auto_64740 ?auto_64741 ) ) ( not ( = ?auto_64740 ?auto_64742 ) ) ( not ( = ?auto_64740 ?auto_64743 ) ) ( not ( = ?auto_64740 ?auto_64744 ) ) ( not ( = ?auto_64740 ?auto_64745 ) ) ( not ( = ?auto_64740 ?auto_64746 ) ) ( not ( = ?auto_64741 ?auto_64742 ) ) ( not ( = ?auto_64741 ?auto_64743 ) ) ( not ( = ?auto_64741 ?auto_64744 ) ) ( not ( = ?auto_64741 ?auto_64745 ) ) ( not ( = ?auto_64741 ?auto_64746 ) ) ( not ( = ?auto_64742 ?auto_64743 ) ) ( not ( = ?auto_64742 ?auto_64744 ) ) ( not ( = ?auto_64742 ?auto_64745 ) ) ( not ( = ?auto_64742 ?auto_64746 ) ) ( not ( = ?auto_64743 ?auto_64744 ) ) ( not ( = ?auto_64743 ?auto_64745 ) ) ( not ( = ?auto_64743 ?auto_64746 ) ) ( not ( = ?auto_64744 ?auto_64745 ) ) ( not ( = ?auto_64744 ?auto_64746 ) ) ( not ( = ?auto_64745 ?auto_64746 ) ) ( ON ?auto_64745 ?auto_64746 ) ( ON ?auto_64744 ?auto_64745 ) ( ON ?auto_64743 ?auto_64744 ) ( ON ?auto_64742 ?auto_64743 ) ( ON ?auto_64741 ?auto_64742 ) ( CLEAR ?auto_64739 ) ( ON ?auto_64740 ?auto_64741 ) ( CLEAR ?auto_64740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64738 ?auto_64739 ?auto_64740 )
      ( MAKE-9PILE ?auto_64738 ?auto_64739 ?auto_64740 ?auto_64741 ?auto_64742 ?auto_64743 ?auto_64744 ?auto_64745 ?auto_64746 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64756 - BLOCK
      ?auto_64757 - BLOCK
      ?auto_64758 - BLOCK
      ?auto_64759 - BLOCK
      ?auto_64760 - BLOCK
      ?auto_64761 - BLOCK
      ?auto_64762 - BLOCK
      ?auto_64763 - BLOCK
      ?auto_64764 - BLOCK
    )
    :vars
    (
      ?auto_64765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64764 ?auto_64765 ) ( ON-TABLE ?auto_64756 ) ( not ( = ?auto_64756 ?auto_64757 ) ) ( not ( = ?auto_64756 ?auto_64758 ) ) ( not ( = ?auto_64756 ?auto_64759 ) ) ( not ( = ?auto_64756 ?auto_64760 ) ) ( not ( = ?auto_64756 ?auto_64761 ) ) ( not ( = ?auto_64756 ?auto_64762 ) ) ( not ( = ?auto_64756 ?auto_64763 ) ) ( not ( = ?auto_64756 ?auto_64764 ) ) ( not ( = ?auto_64756 ?auto_64765 ) ) ( not ( = ?auto_64757 ?auto_64758 ) ) ( not ( = ?auto_64757 ?auto_64759 ) ) ( not ( = ?auto_64757 ?auto_64760 ) ) ( not ( = ?auto_64757 ?auto_64761 ) ) ( not ( = ?auto_64757 ?auto_64762 ) ) ( not ( = ?auto_64757 ?auto_64763 ) ) ( not ( = ?auto_64757 ?auto_64764 ) ) ( not ( = ?auto_64757 ?auto_64765 ) ) ( not ( = ?auto_64758 ?auto_64759 ) ) ( not ( = ?auto_64758 ?auto_64760 ) ) ( not ( = ?auto_64758 ?auto_64761 ) ) ( not ( = ?auto_64758 ?auto_64762 ) ) ( not ( = ?auto_64758 ?auto_64763 ) ) ( not ( = ?auto_64758 ?auto_64764 ) ) ( not ( = ?auto_64758 ?auto_64765 ) ) ( not ( = ?auto_64759 ?auto_64760 ) ) ( not ( = ?auto_64759 ?auto_64761 ) ) ( not ( = ?auto_64759 ?auto_64762 ) ) ( not ( = ?auto_64759 ?auto_64763 ) ) ( not ( = ?auto_64759 ?auto_64764 ) ) ( not ( = ?auto_64759 ?auto_64765 ) ) ( not ( = ?auto_64760 ?auto_64761 ) ) ( not ( = ?auto_64760 ?auto_64762 ) ) ( not ( = ?auto_64760 ?auto_64763 ) ) ( not ( = ?auto_64760 ?auto_64764 ) ) ( not ( = ?auto_64760 ?auto_64765 ) ) ( not ( = ?auto_64761 ?auto_64762 ) ) ( not ( = ?auto_64761 ?auto_64763 ) ) ( not ( = ?auto_64761 ?auto_64764 ) ) ( not ( = ?auto_64761 ?auto_64765 ) ) ( not ( = ?auto_64762 ?auto_64763 ) ) ( not ( = ?auto_64762 ?auto_64764 ) ) ( not ( = ?auto_64762 ?auto_64765 ) ) ( not ( = ?auto_64763 ?auto_64764 ) ) ( not ( = ?auto_64763 ?auto_64765 ) ) ( not ( = ?auto_64764 ?auto_64765 ) ) ( ON ?auto_64763 ?auto_64764 ) ( ON ?auto_64762 ?auto_64763 ) ( ON ?auto_64761 ?auto_64762 ) ( ON ?auto_64760 ?auto_64761 ) ( ON ?auto_64759 ?auto_64760 ) ( ON ?auto_64758 ?auto_64759 ) ( CLEAR ?auto_64756 ) ( ON ?auto_64757 ?auto_64758 ) ( CLEAR ?auto_64757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64756 ?auto_64757 )
      ( MAKE-9PILE ?auto_64756 ?auto_64757 ?auto_64758 ?auto_64759 ?auto_64760 ?auto_64761 ?auto_64762 ?auto_64763 ?auto_64764 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64775 - BLOCK
      ?auto_64776 - BLOCK
      ?auto_64777 - BLOCK
      ?auto_64778 - BLOCK
      ?auto_64779 - BLOCK
      ?auto_64780 - BLOCK
      ?auto_64781 - BLOCK
      ?auto_64782 - BLOCK
      ?auto_64783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64783 ) ( ON-TABLE ?auto_64775 ) ( not ( = ?auto_64775 ?auto_64776 ) ) ( not ( = ?auto_64775 ?auto_64777 ) ) ( not ( = ?auto_64775 ?auto_64778 ) ) ( not ( = ?auto_64775 ?auto_64779 ) ) ( not ( = ?auto_64775 ?auto_64780 ) ) ( not ( = ?auto_64775 ?auto_64781 ) ) ( not ( = ?auto_64775 ?auto_64782 ) ) ( not ( = ?auto_64775 ?auto_64783 ) ) ( not ( = ?auto_64776 ?auto_64777 ) ) ( not ( = ?auto_64776 ?auto_64778 ) ) ( not ( = ?auto_64776 ?auto_64779 ) ) ( not ( = ?auto_64776 ?auto_64780 ) ) ( not ( = ?auto_64776 ?auto_64781 ) ) ( not ( = ?auto_64776 ?auto_64782 ) ) ( not ( = ?auto_64776 ?auto_64783 ) ) ( not ( = ?auto_64777 ?auto_64778 ) ) ( not ( = ?auto_64777 ?auto_64779 ) ) ( not ( = ?auto_64777 ?auto_64780 ) ) ( not ( = ?auto_64777 ?auto_64781 ) ) ( not ( = ?auto_64777 ?auto_64782 ) ) ( not ( = ?auto_64777 ?auto_64783 ) ) ( not ( = ?auto_64778 ?auto_64779 ) ) ( not ( = ?auto_64778 ?auto_64780 ) ) ( not ( = ?auto_64778 ?auto_64781 ) ) ( not ( = ?auto_64778 ?auto_64782 ) ) ( not ( = ?auto_64778 ?auto_64783 ) ) ( not ( = ?auto_64779 ?auto_64780 ) ) ( not ( = ?auto_64779 ?auto_64781 ) ) ( not ( = ?auto_64779 ?auto_64782 ) ) ( not ( = ?auto_64779 ?auto_64783 ) ) ( not ( = ?auto_64780 ?auto_64781 ) ) ( not ( = ?auto_64780 ?auto_64782 ) ) ( not ( = ?auto_64780 ?auto_64783 ) ) ( not ( = ?auto_64781 ?auto_64782 ) ) ( not ( = ?auto_64781 ?auto_64783 ) ) ( not ( = ?auto_64782 ?auto_64783 ) ) ( ON ?auto_64782 ?auto_64783 ) ( ON ?auto_64781 ?auto_64782 ) ( ON ?auto_64780 ?auto_64781 ) ( ON ?auto_64779 ?auto_64780 ) ( ON ?auto_64778 ?auto_64779 ) ( ON ?auto_64777 ?auto_64778 ) ( CLEAR ?auto_64775 ) ( ON ?auto_64776 ?auto_64777 ) ( CLEAR ?auto_64776 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64775 ?auto_64776 )
      ( MAKE-9PILE ?auto_64775 ?auto_64776 ?auto_64777 ?auto_64778 ?auto_64779 ?auto_64780 ?auto_64781 ?auto_64782 ?auto_64783 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64793 - BLOCK
      ?auto_64794 - BLOCK
      ?auto_64795 - BLOCK
      ?auto_64796 - BLOCK
      ?auto_64797 - BLOCK
      ?auto_64798 - BLOCK
      ?auto_64799 - BLOCK
      ?auto_64800 - BLOCK
      ?auto_64801 - BLOCK
    )
    :vars
    (
      ?auto_64802 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64801 ?auto_64802 ) ( not ( = ?auto_64793 ?auto_64794 ) ) ( not ( = ?auto_64793 ?auto_64795 ) ) ( not ( = ?auto_64793 ?auto_64796 ) ) ( not ( = ?auto_64793 ?auto_64797 ) ) ( not ( = ?auto_64793 ?auto_64798 ) ) ( not ( = ?auto_64793 ?auto_64799 ) ) ( not ( = ?auto_64793 ?auto_64800 ) ) ( not ( = ?auto_64793 ?auto_64801 ) ) ( not ( = ?auto_64793 ?auto_64802 ) ) ( not ( = ?auto_64794 ?auto_64795 ) ) ( not ( = ?auto_64794 ?auto_64796 ) ) ( not ( = ?auto_64794 ?auto_64797 ) ) ( not ( = ?auto_64794 ?auto_64798 ) ) ( not ( = ?auto_64794 ?auto_64799 ) ) ( not ( = ?auto_64794 ?auto_64800 ) ) ( not ( = ?auto_64794 ?auto_64801 ) ) ( not ( = ?auto_64794 ?auto_64802 ) ) ( not ( = ?auto_64795 ?auto_64796 ) ) ( not ( = ?auto_64795 ?auto_64797 ) ) ( not ( = ?auto_64795 ?auto_64798 ) ) ( not ( = ?auto_64795 ?auto_64799 ) ) ( not ( = ?auto_64795 ?auto_64800 ) ) ( not ( = ?auto_64795 ?auto_64801 ) ) ( not ( = ?auto_64795 ?auto_64802 ) ) ( not ( = ?auto_64796 ?auto_64797 ) ) ( not ( = ?auto_64796 ?auto_64798 ) ) ( not ( = ?auto_64796 ?auto_64799 ) ) ( not ( = ?auto_64796 ?auto_64800 ) ) ( not ( = ?auto_64796 ?auto_64801 ) ) ( not ( = ?auto_64796 ?auto_64802 ) ) ( not ( = ?auto_64797 ?auto_64798 ) ) ( not ( = ?auto_64797 ?auto_64799 ) ) ( not ( = ?auto_64797 ?auto_64800 ) ) ( not ( = ?auto_64797 ?auto_64801 ) ) ( not ( = ?auto_64797 ?auto_64802 ) ) ( not ( = ?auto_64798 ?auto_64799 ) ) ( not ( = ?auto_64798 ?auto_64800 ) ) ( not ( = ?auto_64798 ?auto_64801 ) ) ( not ( = ?auto_64798 ?auto_64802 ) ) ( not ( = ?auto_64799 ?auto_64800 ) ) ( not ( = ?auto_64799 ?auto_64801 ) ) ( not ( = ?auto_64799 ?auto_64802 ) ) ( not ( = ?auto_64800 ?auto_64801 ) ) ( not ( = ?auto_64800 ?auto_64802 ) ) ( not ( = ?auto_64801 ?auto_64802 ) ) ( ON ?auto_64800 ?auto_64801 ) ( ON ?auto_64799 ?auto_64800 ) ( ON ?auto_64798 ?auto_64799 ) ( ON ?auto_64797 ?auto_64798 ) ( ON ?auto_64796 ?auto_64797 ) ( ON ?auto_64795 ?auto_64796 ) ( ON ?auto_64794 ?auto_64795 ) ( ON ?auto_64793 ?auto_64794 ) ( CLEAR ?auto_64793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64793 )
      ( MAKE-9PILE ?auto_64793 ?auto_64794 ?auto_64795 ?auto_64796 ?auto_64797 ?auto_64798 ?auto_64799 ?auto_64800 ?auto_64801 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64812 - BLOCK
      ?auto_64813 - BLOCK
      ?auto_64814 - BLOCK
      ?auto_64815 - BLOCK
      ?auto_64816 - BLOCK
      ?auto_64817 - BLOCK
      ?auto_64818 - BLOCK
      ?auto_64819 - BLOCK
      ?auto_64820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64820 ) ( not ( = ?auto_64812 ?auto_64813 ) ) ( not ( = ?auto_64812 ?auto_64814 ) ) ( not ( = ?auto_64812 ?auto_64815 ) ) ( not ( = ?auto_64812 ?auto_64816 ) ) ( not ( = ?auto_64812 ?auto_64817 ) ) ( not ( = ?auto_64812 ?auto_64818 ) ) ( not ( = ?auto_64812 ?auto_64819 ) ) ( not ( = ?auto_64812 ?auto_64820 ) ) ( not ( = ?auto_64813 ?auto_64814 ) ) ( not ( = ?auto_64813 ?auto_64815 ) ) ( not ( = ?auto_64813 ?auto_64816 ) ) ( not ( = ?auto_64813 ?auto_64817 ) ) ( not ( = ?auto_64813 ?auto_64818 ) ) ( not ( = ?auto_64813 ?auto_64819 ) ) ( not ( = ?auto_64813 ?auto_64820 ) ) ( not ( = ?auto_64814 ?auto_64815 ) ) ( not ( = ?auto_64814 ?auto_64816 ) ) ( not ( = ?auto_64814 ?auto_64817 ) ) ( not ( = ?auto_64814 ?auto_64818 ) ) ( not ( = ?auto_64814 ?auto_64819 ) ) ( not ( = ?auto_64814 ?auto_64820 ) ) ( not ( = ?auto_64815 ?auto_64816 ) ) ( not ( = ?auto_64815 ?auto_64817 ) ) ( not ( = ?auto_64815 ?auto_64818 ) ) ( not ( = ?auto_64815 ?auto_64819 ) ) ( not ( = ?auto_64815 ?auto_64820 ) ) ( not ( = ?auto_64816 ?auto_64817 ) ) ( not ( = ?auto_64816 ?auto_64818 ) ) ( not ( = ?auto_64816 ?auto_64819 ) ) ( not ( = ?auto_64816 ?auto_64820 ) ) ( not ( = ?auto_64817 ?auto_64818 ) ) ( not ( = ?auto_64817 ?auto_64819 ) ) ( not ( = ?auto_64817 ?auto_64820 ) ) ( not ( = ?auto_64818 ?auto_64819 ) ) ( not ( = ?auto_64818 ?auto_64820 ) ) ( not ( = ?auto_64819 ?auto_64820 ) ) ( ON ?auto_64819 ?auto_64820 ) ( ON ?auto_64818 ?auto_64819 ) ( ON ?auto_64817 ?auto_64818 ) ( ON ?auto_64816 ?auto_64817 ) ( ON ?auto_64815 ?auto_64816 ) ( ON ?auto_64814 ?auto_64815 ) ( ON ?auto_64813 ?auto_64814 ) ( ON ?auto_64812 ?auto_64813 ) ( CLEAR ?auto_64812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64812 )
      ( MAKE-9PILE ?auto_64812 ?auto_64813 ?auto_64814 ?auto_64815 ?auto_64816 ?auto_64817 ?auto_64818 ?auto_64819 ?auto_64820 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_64830 - BLOCK
      ?auto_64831 - BLOCK
      ?auto_64832 - BLOCK
      ?auto_64833 - BLOCK
      ?auto_64834 - BLOCK
      ?auto_64835 - BLOCK
      ?auto_64836 - BLOCK
      ?auto_64837 - BLOCK
      ?auto_64838 - BLOCK
    )
    :vars
    (
      ?auto_64839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64830 ?auto_64831 ) ) ( not ( = ?auto_64830 ?auto_64832 ) ) ( not ( = ?auto_64830 ?auto_64833 ) ) ( not ( = ?auto_64830 ?auto_64834 ) ) ( not ( = ?auto_64830 ?auto_64835 ) ) ( not ( = ?auto_64830 ?auto_64836 ) ) ( not ( = ?auto_64830 ?auto_64837 ) ) ( not ( = ?auto_64830 ?auto_64838 ) ) ( not ( = ?auto_64831 ?auto_64832 ) ) ( not ( = ?auto_64831 ?auto_64833 ) ) ( not ( = ?auto_64831 ?auto_64834 ) ) ( not ( = ?auto_64831 ?auto_64835 ) ) ( not ( = ?auto_64831 ?auto_64836 ) ) ( not ( = ?auto_64831 ?auto_64837 ) ) ( not ( = ?auto_64831 ?auto_64838 ) ) ( not ( = ?auto_64832 ?auto_64833 ) ) ( not ( = ?auto_64832 ?auto_64834 ) ) ( not ( = ?auto_64832 ?auto_64835 ) ) ( not ( = ?auto_64832 ?auto_64836 ) ) ( not ( = ?auto_64832 ?auto_64837 ) ) ( not ( = ?auto_64832 ?auto_64838 ) ) ( not ( = ?auto_64833 ?auto_64834 ) ) ( not ( = ?auto_64833 ?auto_64835 ) ) ( not ( = ?auto_64833 ?auto_64836 ) ) ( not ( = ?auto_64833 ?auto_64837 ) ) ( not ( = ?auto_64833 ?auto_64838 ) ) ( not ( = ?auto_64834 ?auto_64835 ) ) ( not ( = ?auto_64834 ?auto_64836 ) ) ( not ( = ?auto_64834 ?auto_64837 ) ) ( not ( = ?auto_64834 ?auto_64838 ) ) ( not ( = ?auto_64835 ?auto_64836 ) ) ( not ( = ?auto_64835 ?auto_64837 ) ) ( not ( = ?auto_64835 ?auto_64838 ) ) ( not ( = ?auto_64836 ?auto_64837 ) ) ( not ( = ?auto_64836 ?auto_64838 ) ) ( not ( = ?auto_64837 ?auto_64838 ) ) ( ON ?auto_64830 ?auto_64839 ) ( not ( = ?auto_64838 ?auto_64839 ) ) ( not ( = ?auto_64837 ?auto_64839 ) ) ( not ( = ?auto_64836 ?auto_64839 ) ) ( not ( = ?auto_64835 ?auto_64839 ) ) ( not ( = ?auto_64834 ?auto_64839 ) ) ( not ( = ?auto_64833 ?auto_64839 ) ) ( not ( = ?auto_64832 ?auto_64839 ) ) ( not ( = ?auto_64831 ?auto_64839 ) ) ( not ( = ?auto_64830 ?auto_64839 ) ) ( ON ?auto_64831 ?auto_64830 ) ( ON ?auto_64832 ?auto_64831 ) ( ON ?auto_64833 ?auto_64832 ) ( ON ?auto_64834 ?auto_64833 ) ( ON ?auto_64835 ?auto_64834 ) ( ON ?auto_64836 ?auto_64835 ) ( ON ?auto_64837 ?auto_64836 ) ( ON ?auto_64838 ?auto_64837 ) ( CLEAR ?auto_64838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_64838 ?auto_64837 ?auto_64836 ?auto_64835 ?auto_64834 ?auto_64833 ?auto_64832 ?auto_64831 ?auto_64830 )
      ( MAKE-9PILE ?auto_64830 ?auto_64831 ?auto_64832 ?auto_64833 ?auto_64834 ?auto_64835 ?auto_64836 ?auto_64837 ?auto_64838 ) )
  )

)

