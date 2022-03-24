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

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_91667 - BLOCK
      ?auto_91668 - BLOCK
      ?auto_91669 - BLOCK
      ?auto_91670 - BLOCK
      ?auto_91671 - BLOCK
      ?auto_91672 - BLOCK
      ?auto_91673 - BLOCK
    )
    :vars
    (
      ?auto_91674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91674 ?auto_91673 ) ( CLEAR ?auto_91674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91667 ) ( ON ?auto_91668 ?auto_91667 ) ( ON ?auto_91669 ?auto_91668 ) ( ON ?auto_91670 ?auto_91669 ) ( ON ?auto_91671 ?auto_91670 ) ( ON ?auto_91672 ?auto_91671 ) ( ON ?auto_91673 ?auto_91672 ) ( not ( = ?auto_91667 ?auto_91668 ) ) ( not ( = ?auto_91667 ?auto_91669 ) ) ( not ( = ?auto_91667 ?auto_91670 ) ) ( not ( = ?auto_91667 ?auto_91671 ) ) ( not ( = ?auto_91667 ?auto_91672 ) ) ( not ( = ?auto_91667 ?auto_91673 ) ) ( not ( = ?auto_91667 ?auto_91674 ) ) ( not ( = ?auto_91668 ?auto_91669 ) ) ( not ( = ?auto_91668 ?auto_91670 ) ) ( not ( = ?auto_91668 ?auto_91671 ) ) ( not ( = ?auto_91668 ?auto_91672 ) ) ( not ( = ?auto_91668 ?auto_91673 ) ) ( not ( = ?auto_91668 ?auto_91674 ) ) ( not ( = ?auto_91669 ?auto_91670 ) ) ( not ( = ?auto_91669 ?auto_91671 ) ) ( not ( = ?auto_91669 ?auto_91672 ) ) ( not ( = ?auto_91669 ?auto_91673 ) ) ( not ( = ?auto_91669 ?auto_91674 ) ) ( not ( = ?auto_91670 ?auto_91671 ) ) ( not ( = ?auto_91670 ?auto_91672 ) ) ( not ( = ?auto_91670 ?auto_91673 ) ) ( not ( = ?auto_91670 ?auto_91674 ) ) ( not ( = ?auto_91671 ?auto_91672 ) ) ( not ( = ?auto_91671 ?auto_91673 ) ) ( not ( = ?auto_91671 ?auto_91674 ) ) ( not ( = ?auto_91672 ?auto_91673 ) ) ( not ( = ?auto_91672 ?auto_91674 ) ) ( not ( = ?auto_91673 ?auto_91674 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91674 ?auto_91673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91676 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91676 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_91676 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_91677 - BLOCK
    )
    :vars
    (
      ?auto_91678 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91677 ?auto_91678 ) ( CLEAR ?auto_91677 ) ( HAND-EMPTY ) ( not ( = ?auto_91677 ?auto_91678 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91677 ?auto_91678 )
      ( MAKE-1PILE ?auto_91677 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91685 - BLOCK
      ?auto_91686 - BLOCK
      ?auto_91687 - BLOCK
      ?auto_91688 - BLOCK
      ?auto_91689 - BLOCK
      ?auto_91690 - BLOCK
    )
    :vars
    (
      ?auto_91691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91691 ?auto_91690 ) ( CLEAR ?auto_91691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91685 ) ( ON ?auto_91686 ?auto_91685 ) ( ON ?auto_91687 ?auto_91686 ) ( ON ?auto_91688 ?auto_91687 ) ( ON ?auto_91689 ?auto_91688 ) ( ON ?auto_91690 ?auto_91689 ) ( not ( = ?auto_91685 ?auto_91686 ) ) ( not ( = ?auto_91685 ?auto_91687 ) ) ( not ( = ?auto_91685 ?auto_91688 ) ) ( not ( = ?auto_91685 ?auto_91689 ) ) ( not ( = ?auto_91685 ?auto_91690 ) ) ( not ( = ?auto_91685 ?auto_91691 ) ) ( not ( = ?auto_91686 ?auto_91687 ) ) ( not ( = ?auto_91686 ?auto_91688 ) ) ( not ( = ?auto_91686 ?auto_91689 ) ) ( not ( = ?auto_91686 ?auto_91690 ) ) ( not ( = ?auto_91686 ?auto_91691 ) ) ( not ( = ?auto_91687 ?auto_91688 ) ) ( not ( = ?auto_91687 ?auto_91689 ) ) ( not ( = ?auto_91687 ?auto_91690 ) ) ( not ( = ?auto_91687 ?auto_91691 ) ) ( not ( = ?auto_91688 ?auto_91689 ) ) ( not ( = ?auto_91688 ?auto_91690 ) ) ( not ( = ?auto_91688 ?auto_91691 ) ) ( not ( = ?auto_91689 ?auto_91690 ) ) ( not ( = ?auto_91689 ?auto_91691 ) ) ( not ( = ?auto_91690 ?auto_91691 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91691 ?auto_91690 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91692 - BLOCK
      ?auto_91693 - BLOCK
      ?auto_91694 - BLOCK
      ?auto_91695 - BLOCK
      ?auto_91696 - BLOCK
      ?auto_91697 - BLOCK
    )
    :vars
    (
      ?auto_91698 - BLOCK
      ?auto_91699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91698 ?auto_91697 ) ( CLEAR ?auto_91698 ) ( ON-TABLE ?auto_91692 ) ( ON ?auto_91693 ?auto_91692 ) ( ON ?auto_91694 ?auto_91693 ) ( ON ?auto_91695 ?auto_91694 ) ( ON ?auto_91696 ?auto_91695 ) ( ON ?auto_91697 ?auto_91696 ) ( not ( = ?auto_91692 ?auto_91693 ) ) ( not ( = ?auto_91692 ?auto_91694 ) ) ( not ( = ?auto_91692 ?auto_91695 ) ) ( not ( = ?auto_91692 ?auto_91696 ) ) ( not ( = ?auto_91692 ?auto_91697 ) ) ( not ( = ?auto_91692 ?auto_91698 ) ) ( not ( = ?auto_91693 ?auto_91694 ) ) ( not ( = ?auto_91693 ?auto_91695 ) ) ( not ( = ?auto_91693 ?auto_91696 ) ) ( not ( = ?auto_91693 ?auto_91697 ) ) ( not ( = ?auto_91693 ?auto_91698 ) ) ( not ( = ?auto_91694 ?auto_91695 ) ) ( not ( = ?auto_91694 ?auto_91696 ) ) ( not ( = ?auto_91694 ?auto_91697 ) ) ( not ( = ?auto_91694 ?auto_91698 ) ) ( not ( = ?auto_91695 ?auto_91696 ) ) ( not ( = ?auto_91695 ?auto_91697 ) ) ( not ( = ?auto_91695 ?auto_91698 ) ) ( not ( = ?auto_91696 ?auto_91697 ) ) ( not ( = ?auto_91696 ?auto_91698 ) ) ( not ( = ?auto_91697 ?auto_91698 ) ) ( HOLDING ?auto_91699 ) ( not ( = ?auto_91692 ?auto_91699 ) ) ( not ( = ?auto_91693 ?auto_91699 ) ) ( not ( = ?auto_91694 ?auto_91699 ) ) ( not ( = ?auto_91695 ?auto_91699 ) ) ( not ( = ?auto_91696 ?auto_91699 ) ) ( not ( = ?auto_91697 ?auto_91699 ) ) ( not ( = ?auto_91698 ?auto_91699 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_91699 )
      ( MAKE-6PILE ?auto_91692 ?auto_91693 ?auto_91694 ?auto_91695 ?auto_91696 ?auto_91697 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_91700 - BLOCK
      ?auto_91701 - BLOCK
      ?auto_91702 - BLOCK
      ?auto_91703 - BLOCK
      ?auto_91704 - BLOCK
      ?auto_91705 - BLOCK
    )
    :vars
    (
      ?auto_91706 - BLOCK
      ?auto_91707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91706 ?auto_91705 ) ( ON-TABLE ?auto_91700 ) ( ON ?auto_91701 ?auto_91700 ) ( ON ?auto_91702 ?auto_91701 ) ( ON ?auto_91703 ?auto_91702 ) ( ON ?auto_91704 ?auto_91703 ) ( ON ?auto_91705 ?auto_91704 ) ( not ( = ?auto_91700 ?auto_91701 ) ) ( not ( = ?auto_91700 ?auto_91702 ) ) ( not ( = ?auto_91700 ?auto_91703 ) ) ( not ( = ?auto_91700 ?auto_91704 ) ) ( not ( = ?auto_91700 ?auto_91705 ) ) ( not ( = ?auto_91700 ?auto_91706 ) ) ( not ( = ?auto_91701 ?auto_91702 ) ) ( not ( = ?auto_91701 ?auto_91703 ) ) ( not ( = ?auto_91701 ?auto_91704 ) ) ( not ( = ?auto_91701 ?auto_91705 ) ) ( not ( = ?auto_91701 ?auto_91706 ) ) ( not ( = ?auto_91702 ?auto_91703 ) ) ( not ( = ?auto_91702 ?auto_91704 ) ) ( not ( = ?auto_91702 ?auto_91705 ) ) ( not ( = ?auto_91702 ?auto_91706 ) ) ( not ( = ?auto_91703 ?auto_91704 ) ) ( not ( = ?auto_91703 ?auto_91705 ) ) ( not ( = ?auto_91703 ?auto_91706 ) ) ( not ( = ?auto_91704 ?auto_91705 ) ) ( not ( = ?auto_91704 ?auto_91706 ) ) ( not ( = ?auto_91705 ?auto_91706 ) ) ( not ( = ?auto_91700 ?auto_91707 ) ) ( not ( = ?auto_91701 ?auto_91707 ) ) ( not ( = ?auto_91702 ?auto_91707 ) ) ( not ( = ?auto_91703 ?auto_91707 ) ) ( not ( = ?auto_91704 ?auto_91707 ) ) ( not ( = ?auto_91705 ?auto_91707 ) ) ( not ( = ?auto_91706 ?auto_91707 ) ) ( ON ?auto_91707 ?auto_91706 ) ( CLEAR ?auto_91707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91700 ?auto_91701 ?auto_91702 ?auto_91703 ?auto_91704 ?auto_91705 ?auto_91706 )
      ( MAKE-6PILE ?auto_91700 ?auto_91701 ?auto_91702 ?auto_91703 ?auto_91704 ?auto_91705 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91710 - BLOCK
      ?auto_91711 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91711 ) ( CLEAR ?auto_91710 ) ( ON-TABLE ?auto_91710 ) ( not ( = ?auto_91710 ?auto_91711 ) ) )
    :subtasks
    ( ( !STACK ?auto_91711 ?auto_91710 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91712 - BLOCK
      ?auto_91713 - BLOCK
    )
    :vars
    (
      ?auto_91714 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91712 ) ( ON-TABLE ?auto_91712 ) ( not ( = ?auto_91712 ?auto_91713 ) ) ( ON ?auto_91713 ?auto_91714 ) ( CLEAR ?auto_91713 ) ( HAND-EMPTY ) ( not ( = ?auto_91712 ?auto_91714 ) ) ( not ( = ?auto_91713 ?auto_91714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91713 ?auto_91714 )
      ( MAKE-2PILE ?auto_91712 ?auto_91713 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91715 - BLOCK
      ?auto_91716 - BLOCK
    )
    :vars
    (
      ?auto_91717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91715 ?auto_91716 ) ) ( ON ?auto_91716 ?auto_91717 ) ( CLEAR ?auto_91716 ) ( not ( = ?auto_91715 ?auto_91717 ) ) ( not ( = ?auto_91716 ?auto_91717 ) ) ( HOLDING ?auto_91715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91715 )
      ( MAKE-2PILE ?auto_91715 ?auto_91716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_91718 - BLOCK
      ?auto_91719 - BLOCK
    )
    :vars
    (
      ?auto_91720 - BLOCK
      ?auto_91725 - BLOCK
      ?auto_91723 - BLOCK
      ?auto_91721 - BLOCK
      ?auto_91722 - BLOCK
      ?auto_91724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91718 ?auto_91719 ) ) ( ON ?auto_91719 ?auto_91720 ) ( not ( = ?auto_91718 ?auto_91720 ) ) ( not ( = ?auto_91719 ?auto_91720 ) ) ( ON ?auto_91718 ?auto_91719 ) ( CLEAR ?auto_91718 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91725 ) ( ON ?auto_91723 ?auto_91725 ) ( ON ?auto_91721 ?auto_91723 ) ( ON ?auto_91722 ?auto_91721 ) ( ON ?auto_91724 ?auto_91722 ) ( ON ?auto_91720 ?auto_91724 ) ( not ( = ?auto_91725 ?auto_91723 ) ) ( not ( = ?auto_91725 ?auto_91721 ) ) ( not ( = ?auto_91725 ?auto_91722 ) ) ( not ( = ?auto_91725 ?auto_91724 ) ) ( not ( = ?auto_91725 ?auto_91720 ) ) ( not ( = ?auto_91725 ?auto_91719 ) ) ( not ( = ?auto_91725 ?auto_91718 ) ) ( not ( = ?auto_91723 ?auto_91721 ) ) ( not ( = ?auto_91723 ?auto_91722 ) ) ( not ( = ?auto_91723 ?auto_91724 ) ) ( not ( = ?auto_91723 ?auto_91720 ) ) ( not ( = ?auto_91723 ?auto_91719 ) ) ( not ( = ?auto_91723 ?auto_91718 ) ) ( not ( = ?auto_91721 ?auto_91722 ) ) ( not ( = ?auto_91721 ?auto_91724 ) ) ( not ( = ?auto_91721 ?auto_91720 ) ) ( not ( = ?auto_91721 ?auto_91719 ) ) ( not ( = ?auto_91721 ?auto_91718 ) ) ( not ( = ?auto_91722 ?auto_91724 ) ) ( not ( = ?auto_91722 ?auto_91720 ) ) ( not ( = ?auto_91722 ?auto_91719 ) ) ( not ( = ?auto_91722 ?auto_91718 ) ) ( not ( = ?auto_91724 ?auto_91720 ) ) ( not ( = ?auto_91724 ?auto_91719 ) ) ( not ( = ?auto_91724 ?auto_91718 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91725 ?auto_91723 ?auto_91721 ?auto_91722 ?auto_91724 ?auto_91720 ?auto_91719 )
      ( MAKE-2PILE ?auto_91718 ?auto_91719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91731 - BLOCK
      ?auto_91732 - BLOCK
      ?auto_91733 - BLOCK
      ?auto_91734 - BLOCK
      ?auto_91735 - BLOCK
    )
    :vars
    (
      ?auto_91736 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91736 ?auto_91735 ) ( CLEAR ?auto_91736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91731 ) ( ON ?auto_91732 ?auto_91731 ) ( ON ?auto_91733 ?auto_91732 ) ( ON ?auto_91734 ?auto_91733 ) ( ON ?auto_91735 ?auto_91734 ) ( not ( = ?auto_91731 ?auto_91732 ) ) ( not ( = ?auto_91731 ?auto_91733 ) ) ( not ( = ?auto_91731 ?auto_91734 ) ) ( not ( = ?auto_91731 ?auto_91735 ) ) ( not ( = ?auto_91731 ?auto_91736 ) ) ( not ( = ?auto_91732 ?auto_91733 ) ) ( not ( = ?auto_91732 ?auto_91734 ) ) ( not ( = ?auto_91732 ?auto_91735 ) ) ( not ( = ?auto_91732 ?auto_91736 ) ) ( not ( = ?auto_91733 ?auto_91734 ) ) ( not ( = ?auto_91733 ?auto_91735 ) ) ( not ( = ?auto_91733 ?auto_91736 ) ) ( not ( = ?auto_91734 ?auto_91735 ) ) ( not ( = ?auto_91734 ?auto_91736 ) ) ( not ( = ?auto_91735 ?auto_91736 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91736 ?auto_91735 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91737 - BLOCK
      ?auto_91738 - BLOCK
      ?auto_91739 - BLOCK
      ?auto_91740 - BLOCK
      ?auto_91741 - BLOCK
    )
    :vars
    (
      ?auto_91742 - BLOCK
      ?auto_91743 - BLOCK
      ?auto_91744 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91742 ?auto_91741 ) ( CLEAR ?auto_91742 ) ( ON-TABLE ?auto_91737 ) ( ON ?auto_91738 ?auto_91737 ) ( ON ?auto_91739 ?auto_91738 ) ( ON ?auto_91740 ?auto_91739 ) ( ON ?auto_91741 ?auto_91740 ) ( not ( = ?auto_91737 ?auto_91738 ) ) ( not ( = ?auto_91737 ?auto_91739 ) ) ( not ( = ?auto_91737 ?auto_91740 ) ) ( not ( = ?auto_91737 ?auto_91741 ) ) ( not ( = ?auto_91737 ?auto_91742 ) ) ( not ( = ?auto_91738 ?auto_91739 ) ) ( not ( = ?auto_91738 ?auto_91740 ) ) ( not ( = ?auto_91738 ?auto_91741 ) ) ( not ( = ?auto_91738 ?auto_91742 ) ) ( not ( = ?auto_91739 ?auto_91740 ) ) ( not ( = ?auto_91739 ?auto_91741 ) ) ( not ( = ?auto_91739 ?auto_91742 ) ) ( not ( = ?auto_91740 ?auto_91741 ) ) ( not ( = ?auto_91740 ?auto_91742 ) ) ( not ( = ?auto_91741 ?auto_91742 ) ) ( HOLDING ?auto_91743 ) ( CLEAR ?auto_91744 ) ( not ( = ?auto_91737 ?auto_91743 ) ) ( not ( = ?auto_91737 ?auto_91744 ) ) ( not ( = ?auto_91738 ?auto_91743 ) ) ( not ( = ?auto_91738 ?auto_91744 ) ) ( not ( = ?auto_91739 ?auto_91743 ) ) ( not ( = ?auto_91739 ?auto_91744 ) ) ( not ( = ?auto_91740 ?auto_91743 ) ) ( not ( = ?auto_91740 ?auto_91744 ) ) ( not ( = ?auto_91741 ?auto_91743 ) ) ( not ( = ?auto_91741 ?auto_91744 ) ) ( not ( = ?auto_91742 ?auto_91743 ) ) ( not ( = ?auto_91742 ?auto_91744 ) ) ( not ( = ?auto_91743 ?auto_91744 ) ) )
    :subtasks
    ( ( !STACK ?auto_91743 ?auto_91744 )
      ( MAKE-5PILE ?auto_91737 ?auto_91738 ?auto_91739 ?auto_91740 ?auto_91741 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92663 - BLOCK
      ?auto_92664 - BLOCK
      ?auto_92665 - BLOCK
      ?auto_92666 - BLOCK
      ?auto_92667 - BLOCK
    )
    :vars
    (
      ?auto_92668 - BLOCK
      ?auto_92669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92668 ?auto_92667 ) ( ON-TABLE ?auto_92663 ) ( ON ?auto_92664 ?auto_92663 ) ( ON ?auto_92665 ?auto_92664 ) ( ON ?auto_92666 ?auto_92665 ) ( ON ?auto_92667 ?auto_92666 ) ( not ( = ?auto_92663 ?auto_92664 ) ) ( not ( = ?auto_92663 ?auto_92665 ) ) ( not ( = ?auto_92663 ?auto_92666 ) ) ( not ( = ?auto_92663 ?auto_92667 ) ) ( not ( = ?auto_92663 ?auto_92668 ) ) ( not ( = ?auto_92664 ?auto_92665 ) ) ( not ( = ?auto_92664 ?auto_92666 ) ) ( not ( = ?auto_92664 ?auto_92667 ) ) ( not ( = ?auto_92664 ?auto_92668 ) ) ( not ( = ?auto_92665 ?auto_92666 ) ) ( not ( = ?auto_92665 ?auto_92667 ) ) ( not ( = ?auto_92665 ?auto_92668 ) ) ( not ( = ?auto_92666 ?auto_92667 ) ) ( not ( = ?auto_92666 ?auto_92668 ) ) ( not ( = ?auto_92667 ?auto_92668 ) ) ( not ( = ?auto_92663 ?auto_92669 ) ) ( not ( = ?auto_92664 ?auto_92669 ) ) ( not ( = ?auto_92665 ?auto_92669 ) ) ( not ( = ?auto_92666 ?auto_92669 ) ) ( not ( = ?auto_92667 ?auto_92669 ) ) ( not ( = ?auto_92668 ?auto_92669 ) ) ( ON ?auto_92669 ?auto_92668 ) ( CLEAR ?auto_92669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92663 ?auto_92664 ?auto_92665 ?auto_92666 ?auto_92667 ?auto_92668 )
      ( MAKE-5PILE ?auto_92663 ?auto_92664 ?auto_92665 ?auto_92666 ?auto_92667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91753 - BLOCK
      ?auto_91754 - BLOCK
      ?auto_91755 - BLOCK
      ?auto_91756 - BLOCK
      ?auto_91757 - BLOCK
    )
    :vars
    (
      ?auto_91759 - BLOCK
      ?auto_91758 - BLOCK
      ?auto_91760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91759 ?auto_91757 ) ( ON-TABLE ?auto_91753 ) ( ON ?auto_91754 ?auto_91753 ) ( ON ?auto_91755 ?auto_91754 ) ( ON ?auto_91756 ?auto_91755 ) ( ON ?auto_91757 ?auto_91756 ) ( not ( = ?auto_91753 ?auto_91754 ) ) ( not ( = ?auto_91753 ?auto_91755 ) ) ( not ( = ?auto_91753 ?auto_91756 ) ) ( not ( = ?auto_91753 ?auto_91757 ) ) ( not ( = ?auto_91753 ?auto_91759 ) ) ( not ( = ?auto_91754 ?auto_91755 ) ) ( not ( = ?auto_91754 ?auto_91756 ) ) ( not ( = ?auto_91754 ?auto_91757 ) ) ( not ( = ?auto_91754 ?auto_91759 ) ) ( not ( = ?auto_91755 ?auto_91756 ) ) ( not ( = ?auto_91755 ?auto_91757 ) ) ( not ( = ?auto_91755 ?auto_91759 ) ) ( not ( = ?auto_91756 ?auto_91757 ) ) ( not ( = ?auto_91756 ?auto_91759 ) ) ( not ( = ?auto_91757 ?auto_91759 ) ) ( not ( = ?auto_91753 ?auto_91758 ) ) ( not ( = ?auto_91753 ?auto_91760 ) ) ( not ( = ?auto_91754 ?auto_91758 ) ) ( not ( = ?auto_91754 ?auto_91760 ) ) ( not ( = ?auto_91755 ?auto_91758 ) ) ( not ( = ?auto_91755 ?auto_91760 ) ) ( not ( = ?auto_91756 ?auto_91758 ) ) ( not ( = ?auto_91756 ?auto_91760 ) ) ( not ( = ?auto_91757 ?auto_91758 ) ) ( not ( = ?auto_91757 ?auto_91760 ) ) ( not ( = ?auto_91759 ?auto_91758 ) ) ( not ( = ?auto_91759 ?auto_91760 ) ) ( not ( = ?auto_91758 ?auto_91760 ) ) ( ON ?auto_91758 ?auto_91759 ) ( CLEAR ?auto_91758 ) ( HOLDING ?auto_91760 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91760 )
      ( MAKE-5PILE ?auto_91753 ?auto_91754 ?auto_91755 ?auto_91756 ?auto_91757 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91761 - BLOCK
      ?auto_91762 - BLOCK
      ?auto_91763 - BLOCK
      ?auto_91764 - BLOCK
      ?auto_91765 - BLOCK
    )
    :vars
    (
      ?auto_91766 - BLOCK
      ?auto_91768 - BLOCK
      ?auto_91767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91766 ?auto_91765 ) ( ON-TABLE ?auto_91761 ) ( ON ?auto_91762 ?auto_91761 ) ( ON ?auto_91763 ?auto_91762 ) ( ON ?auto_91764 ?auto_91763 ) ( ON ?auto_91765 ?auto_91764 ) ( not ( = ?auto_91761 ?auto_91762 ) ) ( not ( = ?auto_91761 ?auto_91763 ) ) ( not ( = ?auto_91761 ?auto_91764 ) ) ( not ( = ?auto_91761 ?auto_91765 ) ) ( not ( = ?auto_91761 ?auto_91766 ) ) ( not ( = ?auto_91762 ?auto_91763 ) ) ( not ( = ?auto_91762 ?auto_91764 ) ) ( not ( = ?auto_91762 ?auto_91765 ) ) ( not ( = ?auto_91762 ?auto_91766 ) ) ( not ( = ?auto_91763 ?auto_91764 ) ) ( not ( = ?auto_91763 ?auto_91765 ) ) ( not ( = ?auto_91763 ?auto_91766 ) ) ( not ( = ?auto_91764 ?auto_91765 ) ) ( not ( = ?auto_91764 ?auto_91766 ) ) ( not ( = ?auto_91765 ?auto_91766 ) ) ( not ( = ?auto_91761 ?auto_91768 ) ) ( not ( = ?auto_91761 ?auto_91767 ) ) ( not ( = ?auto_91762 ?auto_91768 ) ) ( not ( = ?auto_91762 ?auto_91767 ) ) ( not ( = ?auto_91763 ?auto_91768 ) ) ( not ( = ?auto_91763 ?auto_91767 ) ) ( not ( = ?auto_91764 ?auto_91768 ) ) ( not ( = ?auto_91764 ?auto_91767 ) ) ( not ( = ?auto_91765 ?auto_91768 ) ) ( not ( = ?auto_91765 ?auto_91767 ) ) ( not ( = ?auto_91766 ?auto_91768 ) ) ( not ( = ?auto_91766 ?auto_91767 ) ) ( not ( = ?auto_91768 ?auto_91767 ) ) ( ON ?auto_91768 ?auto_91766 ) ( ON ?auto_91767 ?auto_91768 ) ( CLEAR ?auto_91767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91761 ?auto_91762 ?auto_91763 ?auto_91764 ?auto_91765 ?auto_91766 ?auto_91768 )
      ( MAKE-5PILE ?auto_91761 ?auto_91762 ?auto_91763 ?auto_91764 ?auto_91765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91772 - BLOCK
      ?auto_91773 - BLOCK
      ?auto_91774 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91774 ) ( CLEAR ?auto_91773 ) ( ON-TABLE ?auto_91772 ) ( ON ?auto_91773 ?auto_91772 ) ( not ( = ?auto_91772 ?auto_91773 ) ) ( not ( = ?auto_91772 ?auto_91774 ) ) ( not ( = ?auto_91773 ?auto_91774 ) ) )
    :subtasks
    ( ( !STACK ?auto_91774 ?auto_91773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91775 - BLOCK
      ?auto_91776 - BLOCK
      ?auto_91777 - BLOCK
    )
    :vars
    (
      ?auto_91778 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91776 ) ( ON-TABLE ?auto_91775 ) ( ON ?auto_91776 ?auto_91775 ) ( not ( = ?auto_91775 ?auto_91776 ) ) ( not ( = ?auto_91775 ?auto_91777 ) ) ( not ( = ?auto_91776 ?auto_91777 ) ) ( ON ?auto_91777 ?auto_91778 ) ( CLEAR ?auto_91777 ) ( HAND-EMPTY ) ( not ( = ?auto_91775 ?auto_91778 ) ) ( not ( = ?auto_91776 ?auto_91778 ) ) ( not ( = ?auto_91777 ?auto_91778 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91777 ?auto_91778 )
      ( MAKE-3PILE ?auto_91775 ?auto_91776 ?auto_91777 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91779 - BLOCK
      ?auto_91780 - BLOCK
      ?auto_91781 - BLOCK
    )
    :vars
    (
      ?auto_91782 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91779 ) ( not ( = ?auto_91779 ?auto_91780 ) ) ( not ( = ?auto_91779 ?auto_91781 ) ) ( not ( = ?auto_91780 ?auto_91781 ) ) ( ON ?auto_91781 ?auto_91782 ) ( CLEAR ?auto_91781 ) ( not ( = ?auto_91779 ?auto_91782 ) ) ( not ( = ?auto_91780 ?auto_91782 ) ) ( not ( = ?auto_91781 ?auto_91782 ) ) ( HOLDING ?auto_91780 ) ( CLEAR ?auto_91779 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91779 ?auto_91780 )
      ( MAKE-3PILE ?auto_91779 ?auto_91780 ?auto_91781 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91783 - BLOCK
      ?auto_91784 - BLOCK
      ?auto_91785 - BLOCK
    )
    :vars
    (
      ?auto_91786 - BLOCK
      ?auto_91790 - BLOCK
      ?auto_91789 - BLOCK
      ?auto_91787 - BLOCK
      ?auto_91788 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91783 ) ( not ( = ?auto_91783 ?auto_91784 ) ) ( not ( = ?auto_91783 ?auto_91785 ) ) ( not ( = ?auto_91784 ?auto_91785 ) ) ( ON ?auto_91785 ?auto_91786 ) ( not ( = ?auto_91783 ?auto_91786 ) ) ( not ( = ?auto_91784 ?auto_91786 ) ) ( not ( = ?auto_91785 ?auto_91786 ) ) ( CLEAR ?auto_91783 ) ( ON ?auto_91784 ?auto_91785 ) ( CLEAR ?auto_91784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91790 ) ( ON ?auto_91789 ?auto_91790 ) ( ON ?auto_91787 ?auto_91789 ) ( ON ?auto_91788 ?auto_91787 ) ( ON ?auto_91786 ?auto_91788 ) ( not ( = ?auto_91790 ?auto_91789 ) ) ( not ( = ?auto_91790 ?auto_91787 ) ) ( not ( = ?auto_91790 ?auto_91788 ) ) ( not ( = ?auto_91790 ?auto_91786 ) ) ( not ( = ?auto_91790 ?auto_91785 ) ) ( not ( = ?auto_91790 ?auto_91784 ) ) ( not ( = ?auto_91789 ?auto_91787 ) ) ( not ( = ?auto_91789 ?auto_91788 ) ) ( not ( = ?auto_91789 ?auto_91786 ) ) ( not ( = ?auto_91789 ?auto_91785 ) ) ( not ( = ?auto_91789 ?auto_91784 ) ) ( not ( = ?auto_91787 ?auto_91788 ) ) ( not ( = ?auto_91787 ?auto_91786 ) ) ( not ( = ?auto_91787 ?auto_91785 ) ) ( not ( = ?auto_91787 ?auto_91784 ) ) ( not ( = ?auto_91788 ?auto_91786 ) ) ( not ( = ?auto_91788 ?auto_91785 ) ) ( not ( = ?auto_91788 ?auto_91784 ) ) ( not ( = ?auto_91783 ?auto_91790 ) ) ( not ( = ?auto_91783 ?auto_91789 ) ) ( not ( = ?auto_91783 ?auto_91787 ) ) ( not ( = ?auto_91783 ?auto_91788 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91790 ?auto_91789 ?auto_91787 ?auto_91788 ?auto_91786 ?auto_91785 )
      ( MAKE-3PILE ?auto_91783 ?auto_91784 ?auto_91785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91791 - BLOCK
      ?auto_91792 - BLOCK
      ?auto_91793 - BLOCK
    )
    :vars
    (
      ?auto_91798 - BLOCK
      ?auto_91795 - BLOCK
      ?auto_91794 - BLOCK
      ?auto_91797 - BLOCK
      ?auto_91796 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91791 ?auto_91792 ) ) ( not ( = ?auto_91791 ?auto_91793 ) ) ( not ( = ?auto_91792 ?auto_91793 ) ) ( ON ?auto_91793 ?auto_91798 ) ( not ( = ?auto_91791 ?auto_91798 ) ) ( not ( = ?auto_91792 ?auto_91798 ) ) ( not ( = ?auto_91793 ?auto_91798 ) ) ( ON ?auto_91792 ?auto_91793 ) ( CLEAR ?auto_91792 ) ( ON-TABLE ?auto_91795 ) ( ON ?auto_91794 ?auto_91795 ) ( ON ?auto_91797 ?auto_91794 ) ( ON ?auto_91796 ?auto_91797 ) ( ON ?auto_91798 ?auto_91796 ) ( not ( = ?auto_91795 ?auto_91794 ) ) ( not ( = ?auto_91795 ?auto_91797 ) ) ( not ( = ?auto_91795 ?auto_91796 ) ) ( not ( = ?auto_91795 ?auto_91798 ) ) ( not ( = ?auto_91795 ?auto_91793 ) ) ( not ( = ?auto_91795 ?auto_91792 ) ) ( not ( = ?auto_91794 ?auto_91797 ) ) ( not ( = ?auto_91794 ?auto_91796 ) ) ( not ( = ?auto_91794 ?auto_91798 ) ) ( not ( = ?auto_91794 ?auto_91793 ) ) ( not ( = ?auto_91794 ?auto_91792 ) ) ( not ( = ?auto_91797 ?auto_91796 ) ) ( not ( = ?auto_91797 ?auto_91798 ) ) ( not ( = ?auto_91797 ?auto_91793 ) ) ( not ( = ?auto_91797 ?auto_91792 ) ) ( not ( = ?auto_91796 ?auto_91798 ) ) ( not ( = ?auto_91796 ?auto_91793 ) ) ( not ( = ?auto_91796 ?auto_91792 ) ) ( not ( = ?auto_91791 ?auto_91795 ) ) ( not ( = ?auto_91791 ?auto_91794 ) ) ( not ( = ?auto_91791 ?auto_91797 ) ) ( not ( = ?auto_91791 ?auto_91796 ) ) ( HOLDING ?auto_91791 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91791 )
      ( MAKE-3PILE ?auto_91791 ?auto_91792 ?auto_91793 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91799 - BLOCK
      ?auto_91800 - BLOCK
      ?auto_91801 - BLOCK
    )
    :vars
    (
      ?auto_91806 - BLOCK
      ?auto_91802 - BLOCK
      ?auto_91803 - BLOCK
      ?auto_91805 - BLOCK
      ?auto_91804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91799 ?auto_91800 ) ) ( not ( = ?auto_91799 ?auto_91801 ) ) ( not ( = ?auto_91800 ?auto_91801 ) ) ( ON ?auto_91801 ?auto_91806 ) ( not ( = ?auto_91799 ?auto_91806 ) ) ( not ( = ?auto_91800 ?auto_91806 ) ) ( not ( = ?auto_91801 ?auto_91806 ) ) ( ON ?auto_91800 ?auto_91801 ) ( ON-TABLE ?auto_91802 ) ( ON ?auto_91803 ?auto_91802 ) ( ON ?auto_91805 ?auto_91803 ) ( ON ?auto_91804 ?auto_91805 ) ( ON ?auto_91806 ?auto_91804 ) ( not ( = ?auto_91802 ?auto_91803 ) ) ( not ( = ?auto_91802 ?auto_91805 ) ) ( not ( = ?auto_91802 ?auto_91804 ) ) ( not ( = ?auto_91802 ?auto_91806 ) ) ( not ( = ?auto_91802 ?auto_91801 ) ) ( not ( = ?auto_91802 ?auto_91800 ) ) ( not ( = ?auto_91803 ?auto_91805 ) ) ( not ( = ?auto_91803 ?auto_91804 ) ) ( not ( = ?auto_91803 ?auto_91806 ) ) ( not ( = ?auto_91803 ?auto_91801 ) ) ( not ( = ?auto_91803 ?auto_91800 ) ) ( not ( = ?auto_91805 ?auto_91804 ) ) ( not ( = ?auto_91805 ?auto_91806 ) ) ( not ( = ?auto_91805 ?auto_91801 ) ) ( not ( = ?auto_91805 ?auto_91800 ) ) ( not ( = ?auto_91804 ?auto_91806 ) ) ( not ( = ?auto_91804 ?auto_91801 ) ) ( not ( = ?auto_91804 ?auto_91800 ) ) ( not ( = ?auto_91799 ?auto_91802 ) ) ( not ( = ?auto_91799 ?auto_91803 ) ) ( not ( = ?auto_91799 ?auto_91805 ) ) ( not ( = ?auto_91799 ?auto_91804 ) ) ( ON ?auto_91799 ?auto_91800 ) ( CLEAR ?auto_91799 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91802 ?auto_91803 ?auto_91805 ?auto_91804 ?auto_91806 ?auto_91801 ?auto_91800 )
      ( MAKE-3PILE ?auto_91799 ?auto_91800 ?auto_91801 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91811 - BLOCK
      ?auto_91812 - BLOCK
      ?auto_91813 - BLOCK
      ?auto_91814 - BLOCK
    )
    :vars
    (
      ?auto_91815 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91815 ?auto_91814 ) ( CLEAR ?auto_91815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91811 ) ( ON ?auto_91812 ?auto_91811 ) ( ON ?auto_91813 ?auto_91812 ) ( ON ?auto_91814 ?auto_91813 ) ( not ( = ?auto_91811 ?auto_91812 ) ) ( not ( = ?auto_91811 ?auto_91813 ) ) ( not ( = ?auto_91811 ?auto_91814 ) ) ( not ( = ?auto_91811 ?auto_91815 ) ) ( not ( = ?auto_91812 ?auto_91813 ) ) ( not ( = ?auto_91812 ?auto_91814 ) ) ( not ( = ?auto_91812 ?auto_91815 ) ) ( not ( = ?auto_91813 ?auto_91814 ) ) ( not ( = ?auto_91813 ?auto_91815 ) ) ( not ( = ?auto_91814 ?auto_91815 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91815 ?auto_91814 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91816 - BLOCK
      ?auto_91817 - BLOCK
      ?auto_91818 - BLOCK
      ?auto_91819 - BLOCK
    )
    :vars
    (
      ?auto_91820 - BLOCK
      ?auto_91821 - BLOCK
      ?auto_91822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91820 ?auto_91819 ) ( CLEAR ?auto_91820 ) ( ON-TABLE ?auto_91816 ) ( ON ?auto_91817 ?auto_91816 ) ( ON ?auto_91818 ?auto_91817 ) ( ON ?auto_91819 ?auto_91818 ) ( not ( = ?auto_91816 ?auto_91817 ) ) ( not ( = ?auto_91816 ?auto_91818 ) ) ( not ( = ?auto_91816 ?auto_91819 ) ) ( not ( = ?auto_91816 ?auto_91820 ) ) ( not ( = ?auto_91817 ?auto_91818 ) ) ( not ( = ?auto_91817 ?auto_91819 ) ) ( not ( = ?auto_91817 ?auto_91820 ) ) ( not ( = ?auto_91818 ?auto_91819 ) ) ( not ( = ?auto_91818 ?auto_91820 ) ) ( not ( = ?auto_91819 ?auto_91820 ) ) ( HOLDING ?auto_91821 ) ( CLEAR ?auto_91822 ) ( not ( = ?auto_91816 ?auto_91821 ) ) ( not ( = ?auto_91816 ?auto_91822 ) ) ( not ( = ?auto_91817 ?auto_91821 ) ) ( not ( = ?auto_91817 ?auto_91822 ) ) ( not ( = ?auto_91818 ?auto_91821 ) ) ( not ( = ?auto_91818 ?auto_91822 ) ) ( not ( = ?auto_91819 ?auto_91821 ) ) ( not ( = ?auto_91819 ?auto_91822 ) ) ( not ( = ?auto_91820 ?auto_91821 ) ) ( not ( = ?auto_91820 ?auto_91822 ) ) ( not ( = ?auto_91821 ?auto_91822 ) ) )
    :subtasks
    ( ( !STACK ?auto_91821 ?auto_91822 )
      ( MAKE-4PILE ?auto_91816 ?auto_91817 ?auto_91818 ?auto_91819 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91823 - BLOCK
      ?auto_91824 - BLOCK
      ?auto_91825 - BLOCK
      ?auto_91826 - BLOCK
    )
    :vars
    (
      ?auto_91827 - BLOCK
      ?auto_91829 - BLOCK
      ?auto_91828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91827 ?auto_91826 ) ( ON-TABLE ?auto_91823 ) ( ON ?auto_91824 ?auto_91823 ) ( ON ?auto_91825 ?auto_91824 ) ( ON ?auto_91826 ?auto_91825 ) ( not ( = ?auto_91823 ?auto_91824 ) ) ( not ( = ?auto_91823 ?auto_91825 ) ) ( not ( = ?auto_91823 ?auto_91826 ) ) ( not ( = ?auto_91823 ?auto_91827 ) ) ( not ( = ?auto_91824 ?auto_91825 ) ) ( not ( = ?auto_91824 ?auto_91826 ) ) ( not ( = ?auto_91824 ?auto_91827 ) ) ( not ( = ?auto_91825 ?auto_91826 ) ) ( not ( = ?auto_91825 ?auto_91827 ) ) ( not ( = ?auto_91826 ?auto_91827 ) ) ( CLEAR ?auto_91829 ) ( not ( = ?auto_91823 ?auto_91828 ) ) ( not ( = ?auto_91823 ?auto_91829 ) ) ( not ( = ?auto_91824 ?auto_91828 ) ) ( not ( = ?auto_91824 ?auto_91829 ) ) ( not ( = ?auto_91825 ?auto_91828 ) ) ( not ( = ?auto_91825 ?auto_91829 ) ) ( not ( = ?auto_91826 ?auto_91828 ) ) ( not ( = ?auto_91826 ?auto_91829 ) ) ( not ( = ?auto_91827 ?auto_91828 ) ) ( not ( = ?auto_91827 ?auto_91829 ) ) ( not ( = ?auto_91828 ?auto_91829 ) ) ( ON ?auto_91828 ?auto_91827 ) ( CLEAR ?auto_91828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91823 ?auto_91824 ?auto_91825 ?auto_91826 ?auto_91827 )
      ( MAKE-4PILE ?auto_91823 ?auto_91824 ?auto_91825 ?auto_91826 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91830 - BLOCK
      ?auto_91831 - BLOCK
      ?auto_91832 - BLOCK
      ?auto_91833 - BLOCK
    )
    :vars
    (
      ?auto_91835 - BLOCK
      ?auto_91834 - BLOCK
      ?auto_91836 - BLOCK
      ?auto_91837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91835 ?auto_91833 ) ( ON-TABLE ?auto_91830 ) ( ON ?auto_91831 ?auto_91830 ) ( ON ?auto_91832 ?auto_91831 ) ( ON ?auto_91833 ?auto_91832 ) ( not ( = ?auto_91830 ?auto_91831 ) ) ( not ( = ?auto_91830 ?auto_91832 ) ) ( not ( = ?auto_91830 ?auto_91833 ) ) ( not ( = ?auto_91830 ?auto_91835 ) ) ( not ( = ?auto_91831 ?auto_91832 ) ) ( not ( = ?auto_91831 ?auto_91833 ) ) ( not ( = ?auto_91831 ?auto_91835 ) ) ( not ( = ?auto_91832 ?auto_91833 ) ) ( not ( = ?auto_91832 ?auto_91835 ) ) ( not ( = ?auto_91833 ?auto_91835 ) ) ( not ( = ?auto_91830 ?auto_91834 ) ) ( not ( = ?auto_91830 ?auto_91836 ) ) ( not ( = ?auto_91831 ?auto_91834 ) ) ( not ( = ?auto_91831 ?auto_91836 ) ) ( not ( = ?auto_91832 ?auto_91834 ) ) ( not ( = ?auto_91832 ?auto_91836 ) ) ( not ( = ?auto_91833 ?auto_91834 ) ) ( not ( = ?auto_91833 ?auto_91836 ) ) ( not ( = ?auto_91835 ?auto_91834 ) ) ( not ( = ?auto_91835 ?auto_91836 ) ) ( not ( = ?auto_91834 ?auto_91836 ) ) ( ON ?auto_91834 ?auto_91835 ) ( CLEAR ?auto_91834 ) ( HOLDING ?auto_91836 ) ( CLEAR ?auto_91837 ) ( ON-TABLE ?auto_91837 ) ( not ( = ?auto_91837 ?auto_91836 ) ) ( not ( = ?auto_91830 ?auto_91837 ) ) ( not ( = ?auto_91831 ?auto_91837 ) ) ( not ( = ?auto_91832 ?auto_91837 ) ) ( not ( = ?auto_91833 ?auto_91837 ) ) ( not ( = ?auto_91835 ?auto_91837 ) ) ( not ( = ?auto_91834 ?auto_91837 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91837 ?auto_91836 )
      ( MAKE-4PILE ?auto_91830 ?auto_91831 ?auto_91832 ?auto_91833 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_92892 - BLOCK
      ?auto_92893 - BLOCK
      ?auto_92894 - BLOCK
      ?auto_92895 - BLOCK
    )
    :vars
    (
      ?auto_92896 - BLOCK
      ?auto_92897 - BLOCK
      ?auto_92898 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92896 ?auto_92895 ) ( ON-TABLE ?auto_92892 ) ( ON ?auto_92893 ?auto_92892 ) ( ON ?auto_92894 ?auto_92893 ) ( ON ?auto_92895 ?auto_92894 ) ( not ( = ?auto_92892 ?auto_92893 ) ) ( not ( = ?auto_92892 ?auto_92894 ) ) ( not ( = ?auto_92892 ?auto_92895 ) ) ( not ( = ?auto_92892 ?auto_92896 ) ) ( not ( = ?auto_92893 ?auto_92894 ) ) ( not ( = ?auto_92893 ?auto_92895 ) ) ( not ( = ?auto_92893 ?auto_92896 ) ) ( not ( = ?auto_92894 ?auto_92895 ) ) ( not ( = ?auto_92894 ?auto_92896 ) ) ( not ( = ?auto_92895 ?auto_92896 ) ) ( not ( = ?auto_92892 ?auto_92897 ) ) ( not ( = ?auto_92892 ?auto_92898 ) ) ( not ( = ?auto_92893 ?auto_92897 ) ) ( not ( = ?auto_92893 ?auto_92898 ) ) ( not ( = ?auto_92894 ?auto_92897 ) ) ( not ( = ?auto_92894 ?auto_92898 ) ) ( not ( = ?auto_92895 ?auto_92897 ) ) ( not ( = ?auto_92895 ?auto_92898 ) ) ( not ( = ?auto_92896 ?auto_92897 ) ) ( not ( = ?auto_92896 ?auto_92898 ) ) ( not ( = ?auto_92897 ?auto_92898 ) ) ( ON ?auto_92897 ?auto_92896 ) ( ON ?auto_92898 ?auto_92897 ) ( CLEAR ?auto_92898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92892 ?auto_92893 ?auto_92894 ?auto_92895 ?auto_92896 ?auto_92897 )
      ( MAKE-4PILE ?auto_92892 ?auto_92893 ?auto_92894 ?auto_92895 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91846 - BLOCK
      ?auto_91847 - BLOCK
      ?auto_91848 - BLOCK
      ?auto_91849 - BLOCK
    )
    :vars
    (
      ?auto_91852 - BLOCK
      ?auto_91853 - BLOCK
      ?auto_91851 - BLOCK
      ?auto_91850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91852 ?auto_91849 ) ( ON-TABLE ?auto_91846 ) ( ON ?auto_91847 ?auto_91846 ) ( ON ?auto_91848 ?auto_91847 ) ( ON ?auto_91849 ?auto_91848 ) ( not ( = ?auto_91846 ?auto_91847 ) ) ( not ( = ?auto_91846 ?auto_91848 ) ) ( not ( = ?auto_91846 ?auto_91849 ) ) ( not ( = ?auto_91846 ?auto_91852 ) ) ( not ( = ?auto_91847 ?auto_91848 ) ) ( not ( = ?auto_91847 ?auto_91849 ) ) ( not ( = ?auto_91847 ?auto_91852 ) ) ( not ( = ?auto_91848 ?auto_91849 ) ) ( not ( = ?auto_91848 ?auto_91852 ) ) ( not ( = ?auto_91849 ?auto_91852 ) ) ( not ( = ?auto_91846 ?auto_91853 ) ) ( not ( = ?auto_91846 ?auto_91851 ) ) ( not ( = ?auto_91847 ?auto_91853 ) ) ( not ( = ?auto_91847 ?auto_91851 ) ) ( not ( = ?auto_91848 ?auto_91853 ) ) ( not ( = ?auto_91848 ?auto_91851 ) ) ( not ( = ?auto_91849 ?auto_91853 ) ) ( not ( = ?auto_91849 ?auto_91851 ) ) ( not ( = ?auto_91852 ?auto_91853 ) ) ( not ( = ?auto_91852 ?auto_91851 ) ) ( not ( = ?auto_91853 ?auto_91851 ) ) ( ON ?auto_91853 ?auto_91852 ) ( not ( = ?auto_91850 ?auto_91851 ) ) ( not ( = ?auto_91846 ?auto_91850 ) ) ( not ( = ?auto_91847 ?auto_91850 ) ) ( not ( = ?auto_91848 ?auto_91850 ) ) ( not ( = ?auto_91849 ?auto_91850 ) ) ( not ( = ?auto_91852 ?auto_91850 ) ) ( not ( = ?auto_91853 ?auto_91850 ) ) ( ON ?auto_91851 ?auto_91853 ) ( CLEAR ?auto_91851 ) ( HOLDING ?auto_91850 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91850 )
      ( MAKE-4PILE ?auto_91846 ?auto_91847 ?auto_91848 ?auto_91849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91854 - BLOCK
      ?auto_91855 - BLOCK
      ?auto_91856 - BLOCK
      ?auto_91857 - BLOCK
    )
    :vars
    (
      ?auto_91858 - BLOCK
      ?auto_91860 - BLOCK
      ?auto_91861 - BLOCK
      ?auto_91859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91858 ?auto_91857 ) ( ON-TABLE ?auto_91854 ) ( ON ?auto_91855 ?auto_91854 ) ( ON ?auto_91856 ?auto_91855 ) ( ON ?auto_91857 ?auto_91856 ) ( not ( = ?auto_91854 ?auto_91855 ) ) ( not ( = ?auto_91854 ?auto_91856 ) ) ( not ( = ?auto_91854 ?auto_91857 ) ) ( not ( = ?auto_91854 ?auto_91858 ) ) ( not ( = ?auto_91855 ?auto_91856 ) ) ( not ( = ?auto_91855 ?auto_91857 ) ) ( not ( = ?auto_91855 ?auto_91858 ) ) ( not ( = ?auto_91856 ?auto_91857 ) ) ( not ( = ?auto_91856 ?auto_91858 ) ) ( not ( = ?auto_91857 ?auto_91858 ) ) ( not ( = ?auto_91854 ?auto_91860 ) ) ( not ( = ?auto_91854 ?auto_91861 ) ) ( not ( = ?auto_91855 ?auto_91860 ) ) ( not ( = ?auto_91855 ?auto_91861 ) ) ( not ( = ?auto_91856 ?auto_91860 ) ) ( not ( = ?auto_91856 ?auto_91861 ) ) ( not ( = ?auto_91857 ?auto_91860 ) ) ( not ( = ?auto_91857 ?auto_91861 ) ) ( not ( = ?auto_91858 ?auto_91860 ) ) ( not ( = ?auto_91858 ?auto_91861 ) ) ( not ( = ?auto_91860 ?auto_91861 ) ) ( ON ?auto_91860 ?auto_91858 ) ( not ( = ?auto_91859 ?auto_91861 ) ) ( not ( = ?auto_91854 ?auto_91859 ) ) ( not ( = ?auto_91855 ?auto_91859 ) ) ( not ( = ?auto_91856 ?auto_91859 ) ) ( not ( = ?auto_91857 ?auto_91859 ) ) ( not ( = ?auto_91858 ?auto_91859 ) ) ( not ( = ?auto_91860 ?auto_91859 ) ) ( ON ?auto_91861 ?auto_91860 ) ( ON ?auto_91859 ?auto_91861 ) ( CLEAR ?auto_91859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91854 ?auto_91855 ?auto_91856 ?auto_91857 ?auto_91858 ?auto_91860 ?auto_91861 )
      ( MAKE-4PILE ?auto_91854 ?auto_91855 ?auto_91856 ?auto_91857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91866 - BLOCK
      ?auto_91867 - BLOCK
      ?auto_91868 - BLOCK
      ?auto_91869 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91869 ) ( CLEAR ?auto_91868 ) ( ON-TABLE ?auto_91866 ) ( ON ?auto_91867 ?auto_91866 ) ( ON ?auto_91868 ?auto_91867 ) ( not ( = ?auto_91866 ?auto_91867 ) ) ( not ( = ?auto_91866 ?auto_91868 ) ) ( not ( = ?auto_91866 ?auto_91869 ) ) ( not ( = ?auto_91867 ?auto_91868 ) ) ( not ( = ?auto_91867 ?auto_91869 ) ) ( not ( = ?auto_91868 ?auto_91869 ) ) )
    :subtasks
    ( ( !STACK ?auto_91869 ?auto_91868 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91870 - BLOCK
      ?auto_91871 - BLOCK
      ?auto_91872 - BLOCK
      ?auto_91873 - BLOCK
    )
    :vars
    (
      ?auto_91874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_91872 ) ( ON-TABLE ?auto_91870 ) ( ON ?auto_91871 ?auto_91870 ) ( ON ?auto_91872 ?auto_91871 ) ( not ( = ?auto_91870 ?auto_91871 ) ) ( not ( = ?auto_91870 ?auto_91872 ) ) ( not ( = ?auto_91870 ?auto_91873 ) ) ( not ( = ?auto_91871 ?auto_91872 ) ) ( not ( = ?auto_91871 ?auto_91873 ) ) ( not ( = ?auto_91872 ?auto_91873 ) ) ( ON ?auto_91873 ?auto_91874 ) ( CLEAR ?auto_91873 ) ( HAND-EMPTY ) ( not ( = ?auto_91870 ?auto_91874 ) ) ( not ( = ?auto_91871 ?auto_91874 ) ) ( not ( = ?auto_91872 ?auto_91874 ) ) ( not ( = ?auto_91873 ?auto_91874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91873 ?auto_91874 )
      ( MAKE-4PILE ?auto_91870 ?auto_91871 ?auto_91872 ?auto_91873 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91875 - BLOCK
      ?auto_91876 - BLOCK
      ?auto_91877 - BLOCK
      ?auto_91878 - BLOCK
    )
    :vars
    (
      ?auto_91879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91875 ) ( ON ?auto_91876 ?auto_91875 ) ( not ( = ?auto_91875 ?auto_91876 ) ) ( not ( = ?auto_91875 ?auto_91877 ) ) ( not ( = ?auto_91875 ?auto_91878 ) ) ( not ( = ?auto_91876 ?auto_91877 ) ) ( not ( = ?auto_91876 ?auto_91878 ) ) ( not ( = ?auto_91877 ?auto_91878 ) ) ( ON ?auto_91878 ?auto_91879 ) ( CLEAR ?auto_91878 ) ( not ( = ?auto_91875 ?auto_91879 ) ) ( not ( = ?auto_91876 ?auto_91879 ) ) ( not ( = ?auto_91877 ?auto_91879 ) ) ( not ( = ?auto_91878 ?auto_91879 ) ) ( HOLDING ?auto_91877 ) ( CLEAR ?auto_91876 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91875 ?auto_91876 ?auto_91877 )
      ( MAKE-4PILE ?auto_91875 ?auto_91876 ?auto_91877 ?auto_91878 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91880 - BLOCK
      ?auto_91881 - BLOCK
      ?auto_91882 - BLOCK
      ?auto_91883 - BLOCK
    )
    :vars
    (
      ?auto_91884 - BLOCK
      ?auto_91886 - BLOCK
      ?auto_91887 - BLOCK
      ?auto_91885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91880 ) ( ON ?auto_91881 ?auto_91880 ) ( not ( = ?auto_91880 ?auto_91881 ) ) ( not ( = ?auto_91880 ?auto_91882 ) ) ( not ( = ?auto_91880 ?auto_91883 ) ) ( not ( = ?auto_91881 ?auto_91882 ) ) ( not ( = ?auto_91881 ?auto_91883 ) ) ( not ( = ?auto_91882 ?auto_91883 ) ) ( ON ?auto_91883 ?auto_91884 ) ( not ( = ?auto_91880 ?auto_91884 ) ) ( not ( = ?auto_91881 ?auto_91884 ) ) ( not ( = ?auto_91882 ?auto_91884 ) ) ( not ( = ?auto_91883 ?auto_91884 ) ) ( CLEAR ?auto_91881 ) ( ON ?auto_91882 ?auto_91883 ) ( CLEAR ?auto_91882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91886 ) ( ON ?auto_91887 ?auto_91886 ) ( ON ?auto_91885 ?auto_91887 ) ( ON ?auto_91884 ?auto_91885 ) ( not ( = ?auto_91886 ?auto_91887 ) ) ( not ( = ?auto_91886 ?auto_91885 ) ) ( not ( = ?auto_91886 ?auto_91884 ) ) ( not ( = ?auto_91886 ?auto_91883 ) ) ( not ( = ?auto_91886 ?auto_91882 ) ) ( not ( = ?auto_91887 ?auto_91885 ) ) ( not ( = ?auto_91887 ?auto_91884 ) ) ( not ( = ?auto_91887 ?auto_91883 ) ) ( not ( = ?auto_91887 ?auto_91882 ) ) ( not ( = ?auto_91885 ?auto_91884 ) ) ( not ( = ?auto_91885 ?auto_91883 ) ) ( not ( = ?auto_91885 ?auto_91882 ) ) ( not ( = ?auto_91880 ?auto_91886 ) ) ( not ( = ?auto_91880 ?auto_91887 ) ) ( not ( = ?auto_91880 ?auto_91885 ) ) ( not ( = ?auto_91881 ?auto_91886 ) ) ( not ( = ?auto_91881 ?auto_91887 ) ) ( not ( = ?auto_91881 ?auto_91885 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91886 ?auto_91887 ?auto_91885 ?auto_91884 ?auto_91883 )
      ( MAKE-4PILE ?auto_91880 ?auto_91881 ?auto_91882 ?auto_91883 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91888 - BLOCK
      ?auto_91889 - BLOCK
      ?auto_91890 - BLOCK
      ?auto_91891 - BLOCK
    )
    :vars
    (
      ?auto_91895 - BLOCK
      ?auto_91894 - BLOCK
      ?auto_91893 - BLOCK
      ?auto_91892 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91888 ) ( not ( = ?auto_91888 ?auto_91889 ) ) ( not ( = ?auto_91888 ?auto_91890 ) ) ( not ( = ?auto_91888 ?auto_91891 ) ) ( not ( = ?auto_91889 ?auto_91890 ) ) ( not ( = ?auto_91889 ?auto_91891 ) ) ( not ( = ?auto_91890 ?auto_91891 ) ) ( ON ?auto_91891 ?auto_91895 ) ( not ( = ?auto_91888 ?auto_91895 ) ) ( not ( = ?auto_91889 ?auto_91895 ) ) ( not ( = ?auto_91890 ?auto_91895 ) ) ( not ( = ?auto_91891 ?auto_91895 ) ) ( ON ?auto_91890 ?auto_91891 ) ( CLEAR ?auto_91890 ) ( ON-TABLE ?auto_91894 ) ( ON ?auto_91893 ?auto_91894 ) ( ON ?auto_91892 ?auto_91893 ) ( ON ?auto_91895 ?auto_91892 ) ( not ( = ?auto_91894 ?auto_91893 ) ) ( not ( = ?auto_91894 ?auto_91892 ) ) ( not ( = ?auto_91894 ?auto_91895 ) ) ( not ( = ?auto_91894 ?auto_91891 ) ) ( not ( = ?auto_91894 ?auto_91890 ) ) ( not ( = ?auto_91893 ?auto_91892 ) ) ( not ( = ?auto_91893 ?auto_91895 ) ) ( not ( = ?auto_91893 ?auto_91891 ) ) ( not ( = ?auto_91893 ?auto_91890 ) ) ( not ( = ?auto_91892 ?auto_91895 ) ) ( not ( = ?auto_91892 ?auto_91891 ) ) ( not ( = ?auto_91892 ?auto_91890 ) ) ( not ( = ?auto_91888 ?auto_91894 ) ) ( not ( = ?auto_91888 ?auto_91893 ) ) ( not ( = ?auto_91888 ?auto_91892 ) ) ( not ( = ?auto_91889 ?auto_91894 ) ) ( not ( = ?auto_91889 ?auto_91893 ) ) ( not ( = ?auto_91889 ?auto_91892 ) ) ( HOLDING ?auto_91889 ) ( CLEAR ?auto_91888 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91888 ?auto_91889 )
      ( MAKE-4PILE ?auto_91888 ?auto_91889 ?auto_91890 ?auto_91891 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91896 - BLOCK
      ?auto_91897 - BLOCK
      ?auto_91898 - BLOCK
      ?auto_91899 - BLOCK
    )
    :vars
    (
      ?auto_91901 - BLOCK
      ?auto_91903 - BLOCK
      ?auto_91902 - BLOCK
      ?auto_91900 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_91896 ) ( not ( = ?auto_91896 ?auto_91897 ) ) ( not ( = ?auto_91896 ?auto_91898 ) ) ( not ( = ?auto_91896 ?auto_91899 ) ) ( not ( = ?auto_91897 ?auto_91898 ) ) ( not ( = ?auto_91897 ?auto_91899 ) ) ( not ( = ?auto_91898 ?auto_91899 ) ) ( ON ?auto_91899 ?auto_91901 ) ( not ( = ?auto_91896 ?auto_91901 ) ) ( not ( = ?auto_91897 ?auto_91901 ) ) ( not ( = ?auto_91898 ?auto_91901 ) ) ( not ( = ?auto_91899 ?auto_91901 ) ) ( ON ?auto_91898 ?auto_91899 ) ( ON-TABLE ?auto_91903 ) ( ON ?auto_91902 ?auto_91903 ) ( ON ?auto_91900 ?auto_91902 ) ( ON ?auto_91901 ?auto_91900 ) ( not ( = ?auto_91903 ?auto_91902 ) ) ( not ( = ?auto_91903 ?auto_91900 ) ) ( not ( = ?auto_91903 ?auto_91901 ) ) ( not ( = ?auto_91903 ?auto_91899 ) ) ( not ( = ?auto_91903 ?auto_91898 ) ) ( not ( = ?auto_91902 ?auto_91900 ) ) ( not ( = ?auto_91902 ?auto_91901 ) ) ( not ( = ?auto_91902 ?auto_91899 ) ) ( not ( = ?auto_91902 ?auto_91898 ) ) ( not ( = ?auto_91900 ?auto_91901 ) ) ( not ( = ?auto_91900 ?auto_91899 ) ) ( not ( = ?auto_91900 ?auto_91898 ) ) ( not ( = ?auto_91896 ?auto_91903 ) ) ( not ( = ?auto_91896 ?auto_91902 ) ) ( not ( = ?auto_91896 ?auto_91900 ) ) ( not ( = ?auto_91897 ?auto_91903 ) ) ( not ( = ?auto_91897 ?auto_91902 ) ) ( not ( = ?auto_91897 ?auto_91900 ) ) ( CLEAR ?auto_91896 ) ( ON ?auto_91897 ?auto_91898 ) ( CLEAR ?auto_91897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_91903 ?auto_91902 ?auto_91900 ?auto_91901 ?auto_91899 ?auto_91898 )
      ( MAKE-4PILE ?auto_91896 ?auto_91897 ?auto_91898 ?auto_91899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91904 - BLOCK
      ?auto_91905 - BLOCK
      ?auto_91906 - BLOCK
      ?auto_91907 - BLOCK
    )
    :vars
    (
      ?auto_91909 - BLOCK
      ?auto_91910 - BLOCK
      ?auto_91911 - BLOCK
      ?auto_91908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91904 ?auto_91905 ) ) ( not ( = ?auto_91904 ?auto_91906 ) ) ( not ( = ?auto_91904 ?auto_91907 ) ) ( not ( = ?auto_91905 ?auto_91906 ) ) ( not ( = ?auto_91905 ?auto_91907 ) ) ( not ( = ?auto_91906 ?auto_91907 ) ) ( ON ?auto_91907 ?auto_91909 ) ( not ( = ?auto_91904 ?auto_91909 ) ) ( not ( = ?auto_91905 ?auto_91909 ) ) ( not ( = ?auto_91906 ?auto_91909 ) ) ( not ( = ?auto_91907 ?auto_91909 ) ) ( ON ?auto_91906 ?auto_91907 ) ( ON-TABLE ?auto_91910 ) ( ON ?auto_91911 ?auto_91910 ) ( ON ?auto_91908 ?auto_91911 ) ( ON ?auto_91909 ?auto_91908 ) ( not ( = ?auto_91910 ?auto_91911 ) ) ( not ( = ?auto_91910 ?auto_91908 ) ) ( not ( = ?auto_91910 ?auto_91909 ) ) ( not ( = ?auto_91910 ?auto_91907 ) ) ( not ( = ?auto_91910 ?auto_91906 ) ) ( not ( = ?auto_91911 ?auto_91908 ) ) ( not ( = ?auto_91911 ?auto_91909 ) ) ( not ( = ?auto_91911 ?auto_91907 ) ) ( not ( = ?auto_91911 ?auto_91906 ) ) ( not ( = ?auto_91908 ?auto_91909 ) ) ( not ( = ?auto_91908 ?auto_91907 ) ) ( not ( = ?auto_91908 ?auto_91906 ) ) ( not ( = ?auto_91904 ?auto_91910 ) ) ( not ( = ?auto_91904 ?auto_91911 ) ) ( not ( = ?auto_91904 ?auto_91908 ) ) ( not ( = ?auto_91905 ?auto_91910 ) ) ( not ( = ?auto_91905 ?auto_91911 ) ) ( not ( = ?auto_91905 ?auto_91908 ) ) ( ON ?auto_91905 ?auto_91906 ) ( CLEAR ?auto_91905 ) ( HOLDING ?auto_91904 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91904 )
      ( MAKE-4PILE ?auto_91904 ?auto_91905 ?auto_91906 ?auto_91907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_91912 - BLOCK
      ?auto_91913 - BLOCK
      ?auto_91914 - BLOCK
      ?auto_91915 - BLOCK
    )
    :vars
    (
      ?auto_91919 - BLOCK
      ?auto_91918 - BLOCK
      ?auto_91917 - BLOCK
      ?auto_91916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_91912 ?auto_91913 ) ) ( not ( = ?auto_91912 ?auto_91914 ) ) ( not ( = ?auto_91912 ?auto_91915 ) ) ( not ( = ?auto_91913 ?auto_91914 ) ) ( not ( = ?auto_91913 ?auto_91915 ) ) ( not ( = ?auto_91914 ?auto_91915 ) ) ( ON ?auto_91915 ?auto_91919 ) ( not ( = ?auto_91912 ?auto_91919 ) ) ( not ( = ?auto_91913 ?auto_91919 ) ) ( not ( = ?auto_91914 ?auto_91919 ) ) ( not ( = ?auto_91915 ?auto_91919 ) ) ( ON ?auto_91914 ?auto_91915 ) ( ON-TABLE ?auto_91918 ) ( ON ?auto_91917 ?auto_91918 ) ( ON ?auto_91916 ?auto_91917 ) ( ON ?auto_91919 ?auto_91916 ) ( not ( = ?auto_91918 ?auto_91917 ) ) ( not ( = ?auto_91918 ?auto_91916 ) ) ( not ( = ?auto_91918 ?auto_91919 ) ) ( not ( = ?auto_91918 ?auto_91915 ) ) ( not ( = ?auto_91918 ?auto_91914 ) ) ( not ( = ?auto_91917 ?auto_91916 ) ) ( not ( = ?auto_91917 ?auto_91919 ) ) ( not ( = ?auto_91917 ?auto_91915 ) ) ( not ( = ?auto_91917 ?auto_91914 ) ) ( not ( = ?auto_91916 ?auto_91919 ) ) ( not ( = ?auto_91916 ?auto_91915 ) ) ( not ( = ?auto_91916 ?auto_91914 ) ) ( not ( = ?auto_91912 ?auto_91918 ) ) ( not ( = ?auto_91912 ?auto_91917 ) ) ( not ( = ?auto_91912 ?auto_91916 ) ) ( not ( = ?auto_91913 ?auto_91918 ) ) ( not ( = ?auto_91913 ?auto_91917 ) ) ( not ( = ?auto_91913 ?auto_91916 ) ) ( ON ?auto_91913 ?auto_91914 ) ( ON ?auto_91912 ?auto_91913 ) ( CLEAR ?auto_91912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91918 ?auto_91917 ?auto_91916 ?auto_91919 ?auto_91915 ?auto_91914 ?auto_91913 )
      ( MAKE-4PILE ?auto_91912 ?auto_91913 ?auto_91914 ?auto_91915 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91923 - BLOCK
      ?auto_91924 - BLOCK
      ?auto_91925 - BLOCK
    )
    :vars
    (
      ?auto_91926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91926 ?auto_91925 ) ( CLEAR ?auto_91926 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_91923 ) ( ON ?auto_91924 ?auto_91923 ) ( ON ?auto_91925 ?auto_91924 ) ( not ( = ?auto_91923 ?auto_91924 ) ) ( not ( = ?auto_91923 ?auto_91925 ) ) ( not ( = ?auto_91923 ?auto_91926 ) ) ( not ( = ?auto_91924 ?auto_91925 ) ) ( not ( = ?auto_91924 ?auto_91926 ) ) ( not ( = ?auto_91925 ?auto_91926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_91926 ?auto_91925 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91927 - BLOCK
      ?auto_91928 - BLOCK
      ?auto_91929 - BLOCK
    )
    :vars
    (
      ?auto_91930 - BLOCK
      ?auto_91931 - BLOCK
      ?auto_91932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91930 ?auto_91929 ) ( CLEAR ?auto_91930 ) ( ON-TABLE ?auto_91927 ) ( ON ?auto_91928 ?auto_91927 ) ( ON ?auto_91929 ?auto_91928 ) ( not ( = ?auto_91927 ?auto_91928 ) ) ( not ( = ?auto_91927 ?auto_91929 ) ) ( not ( = ?auto_91927 ?auto_91930 ) ) ( not ( = ?auto_91928 ?auto_91929 ) ) ( not ( = ?auto_91928 ?auto_91930 ) ) ( not ( = ?auto_91929 ?auto_91930 ) ) ( HOLDING ?auto_91931 ) ( CLEAR ?auto_91932 ) ( not ( = ?auto_91927 ?auto_91931 ) ) ( not ( = ?auto_91927 ?auto_91932 ) ) ( not ( = ?auto_91928 ?auto_91931 ) ) ( not ( = ?auto_91928 ?auto_91932 ) ) ( not ( = ?auto_91929 ?auto_91931 ) ) ( not ( = ?auto_91929 ?auto_91932 ) ) ( not ( = ?auto_91930 ?auto_91931 ) ) ( not ( = ?auto_91930 ?auto_91932 ) ) ( not ( = ?auto_91931 ?auto_91932 ) ) )
    :subtasks
    ( ( !STACK ?auto_91931 ?auto_91932 )
      ( MAKE-3PILE ?auto_91927 ?auto_91928 ?auto_91929 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91933 - BLOCK
      ?auto_91934 - BLOCK
      ?auto_91935 - BLOCK
    )
    :vars
    (
      ?auto_91938 - BLOCK
      ?auto_91937 - BLOCK
      ?auto_91936 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91938 ?auto_91935 ) ( ON-TABLE ?auto_91933 ) ( ON ?auto_91934 ?auto_91933 ) ( ON ?auto_91935 ?auto_91934 ) ( not ( = ?auto_91933 ?auto_91934 ) ) ( not ( = ?auto_91933 ?auto_91935 ) ) ( not ( = ?auto_91933 ?auto_91938 ) ) ( not ( = ?auto_91934 ?auto_91935 ) ) ( not ( = ?auto_91934 ?auto_91938 ) ) ( not ( = ?auto_91935 ?auto_91938 ) ) ( CLEAR ?auto_91937 ) ( not ( = ?auto_91933 ?auto_91936 ) ) ( not ( = ?auto_91933 ?auto_91937 ) ) ( not ( = ?auto_91934 ?auto_91936 ) ) ( not ( = ?auto_91934 ?auto_91937 ) ) ( not ( = ?auto_91935 ?auto_91936 ) ) ( not ( = ?auto_91935 ?auto_91937 ) ) ( not ( = ?auto_91938 ?auto_91936 ) ) ( not ( = ?auto_91938 ?auto_91937 ) ) ( not ( = ?auto_91936 ?auto_91937 ) ) ( ON ?auto_91936 ?auto_91938 ) ( CLEAR ?auto_91936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_91933 ?auto_91934 ?auto_91935 ?auto_91938 )
      ( MAKE-3PILE ?auto_91933 ?auto_91934 ?auto_91935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91939 - BLOCK
      ?auto_91940 - BLOCK
      ?auto_91941 - BLOCK
    )
    :vars
    (
      ?auto_91944 - BLOCK
      ?auto_91942 - BLOCK
      ?auto_91943 - BLOCK
      ?auto_91946 - BLOCK
      ?auto_91945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91944 ?auto_91941 ) ( ON-TABLE ?auto_91939 ) ( ON ?auto_91940 ?auto_91939 ) ( ON ?auto_91941 ?auto_91940 ) ( not ( = ?auto_91939 ?auto_91940 ) ) ( not ( = ?auto_91939 ?auto_91941 ) ) ( not ( = ?auto_91939 ?auto_91944 ) ) ( not ( = ?auto_91940 ?auto_91941 ) ) ( not ( = ?auto_91940 ?auto_91944 ) ) ( not ( = ?auto_91941 ?auto_91944 ) ) ( not ( = ?auto_91939 ?auto_91942 ) ) ( not ( = ?auto_91939 ?auto_91943 ) ) ( not ( = ?auto_91940 ?auto_91942 ) ) ( not ( = ?auto_91940 ?auto_91943 ) ) ( not ( = ?auto_91941 ?auto_91942 ) ) ( not ( = ?auto_91941 ?auto_91943 ) ) ( not ( = ?auto_91944 ?auto_91942 ) ) ( not ( = ?auto_91944 ?auto_91943 ) ) ( not ( = ?auto_91942 ?auto_91943 ) ) ( ON ?auto_91942 ?auto_91944 ) ( CLEAR ?auto_91942 ) ( HOLDING ?auto_91943 ) ( CLEAR ?auto_91946 ) ( ON-TABLE ?auto_91945 ) ( ON ?auto_91946 ?auto_91945 ) ( not ( = ?auto_91945 ?auto_91946 ) ) ( not ( = ?auto_91945 ?auto_91943 ) ) ( not ( = ?auto_91946 ?auto_91943 ) ) ( not ( = ?auto_91939 ?auto_91946 ) ) ( not ( = ?auto_91939 ?auto_91945 ) ) ( not ( = ?auto_91940 ?auto_91946 ) ) ( not ( = ?auto_91940 ?auto_91945 ) ) ( not ( = ?auto_91941 ?auto_91946 ) ) ( not ( = ?auto_91941 ?auto_91945 ) ) ( not ( = ?auto_91944 ?auto_91946 ) ) ( not ( = ?auto_91944 ?auto_91945 ) ) ( not ( = ?auto_91942 ?auto_91946 ) ) ( not ( = ?auto_91942 ?auto_91945 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_91945 ?auto_91946 ?auto_91943 )
      ( MAKE-3PILE ?auto_91939 ?auto_91940 ?auto_91941 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91947 - BLOCK
      ?auto_91948 - BLOCK
      ?auto_91949 - BLOCK
    )
    :vars
    (
      ?auto_91950 - BLOCK
      ?auto_91951 - BLOCK
      ?auto_91954 - BLOCK
      ?auto_91953 - BLOCK
      ?auto_91952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91950 ?auto_91949 ) ( ON-TABLE ?auto_91947 ) ( ON ?auto_91948 ?auto_91947 ) ( ON ?auto_91949 ?auto_91948 ) ( not ( = ?auto_91947 ?auto_91948 ) ) ( not ( = ?auto_91947 ?auto_91949 ) ) ( not ( = ?auto_91947 ?auto_91950 ) ) ( not ( = ?auto_91948 ?auto_91949 ) ) ( not ( = ?auto_91948 ?auto_91950 ) ) ( not ( = ?auto_91949 ?auto_91950 ) ) ( not ( = ?auto_91947 ?auto_91951 ) ) ( not ( = ?auto_91947 ?auto_91954 ) ) ( not ( = ?auto_91948 ?auto_91951 ) ) ( not ( = ?auto_91948 ?auto_91954 ) ) ( not ( = ?auto_91949 ?auto_91951 ) ) ( not ( = ?auto_91949 ?auto_91954 ) ) ( not ( = ?auto_91950 ?auto_91951 ) ) ( not ( = ?auto_91950 ?auto_91954 ) ) ( not ( = ?auto_91951 ?auto_91954 ) ) ( ON ?auto_91951 ?auto_91950 ) ( CLEAR ?auto_91953 ) ( ON-TABLE ?auto_91952 ) ( ON ?auto_91953 ?auto_91952 ) ( not ( = ?auto_91952 ?auto_91953 ) ) ( not ( = ?auto_91952 ?auto_91954 ) ) ( not ( = ?auto_91953 ?auto_91954 ) ) ( not ( = ?auto_91947 ?auto_91953 ) ) ( not ( = ?auto_91947 ?auto_91952 ) ) ( not ( = ?auto_91948 ?auto_91953 ) ) ( not ( = ?auto_91948 ?auto_91952 ) ) ( not ( = ?auto_91949 ?auto_91953 ) ) ( not ( = ?auto_91949 ?auto_91952 ) ) ( not ( = ?auto_91950 ?auto_91953 ) ) ( not ( = ?auto_91950 ?auto_91952 ) ) ( not ( = ?auto_91951 ?auto_91953 ) ) ( not ( = ?auto_91951 ?auto_91952 ) ) ( ON ?auto_91954 ?auto_91951 ) ( CLEAR ?auto_91954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_91947 ?auto_91948 ?auto_91949 ?auto_91950 ?auto_91951 )
      ( MAKE-3PILE ?auto_91947 ?auto_91948 ?auto_91949 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91955 - BLOCK
      ?auto_91956 - BLOCK
      ?auto_91957 - BLOCK
    )
    :vars
    (
      ?auto_91959 - BLOCK
      ?auto_91962 - BLOCK
      ?auto_91960 - BLOCK
      ?auto_91958 - BLOCK
      ?auto_91961 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91959 ?auto_91957 ) ( ON-TABLE ?auto_91955 ) ( ON ?auto_91956 ?auto_91955 ) ( ON ?auto_91957 ?auto_91956 ) ( not ( = ?auto_91955 ?auto_91956 ) ) ( not ( = ?auto_91955 ?auto_91957 ) ) ( not ( = ?auto_91955 ?auto_91959 ) ) ( not ( = ?auto_91956 ?auto_91957 ) ) ( not ( = ?auto_91956 ?auto_91959 ) ) ( not ( = ?auto_91957 ?auto_91959 ) ) ( not ( = ?auto_91955 ?auto_91962 ) ) ( not ( = ?auto_91955 ?auto_91960 ) ) ( not ( = ?auto_91956 ?auto_91962 ) ) ( not ( = ?auto_91956 ?auto_91960 ) ) ( not ( = ?auto_91957 ?auto_91962 ) ) ( not ( = ?auto_91957 ?auto_91960 ) ) ( not ( = ?auto_91959 ?auto_91962 ) ) ( not ( = ?auto_91959 ?auto_91960 ) ) ( not ( = ?auto_91962 ?auto_91960 ) ) ( ON ?auto_91962 ?auto_91959 ) ( ON-TABLE ?auto_91958 ) ( not ( = ?auto_91958 ?auto_91961 ) ) ( not ( = ?auto_91958 ?auto_91960 ) ) ( not ( = ?auto_91961 ?auto_91960 ) ) ( not ( = ?auto_91955 ?auto_91961 ) ) ( not ( = ?auto_91955 ?auto_91958 ) ) ( not ( = ?auto_91956 ?auto_91961 ) ) ( not ( = ?auto_91956 ?auto_91958 ) ) ( not ( = ?auto_91957 ?auto_91961 ) ) ( not ( = ?auto_91957 ?auto_91958 ) ) ( not ( = ?auto_91959 ?auto_91961 ) ) ( not ( = ?auto_91959 ?auto_91958 ) ) ( not ( = ?auto_91962 ?auto_91961 ) ) ( not ( = ?auto_91962 ?auto_91958 ) ) ( ON ?auto_91960 ?auto_91962 ) ( CLEAR ?auto_91960 ) ( HOLDING ?auto_91961 ) ( CLEAR ?auto_91958 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_91958 ?auto_91961 )
      ( MAKE-3PILE ?auto_91955 ?auto_91956 ?auto_91957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93140 - BLOCK
      ?auto_93141 - BLOCK
      ?auto_93142 - BLOCK
    )
    :vars
    (
      ?auto_93146 - BLOCK
      ?auto_93145 - BLOCK
      ?auto_93143 - BLOCK
      ?auto_93144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93146 ?auto_93142 ) ( ON-TABLE ?auto_93140 ) ( ON ?auto_93141 ?auto_93140 ) ( ON ?auto_93142 ?auto_93141 ) ( not ( = ?auto_93140 ?auto_93141 ) ) ( not ( = ?auto_93140 ?auto_93142 ) ) ( not ( = ?auto_93140 ?auto_93146 ) ) ( not ( = ?auto_93141 ?auto_93142 ) ) ( not ( = ?auto_93141 ?auto_93146 ) ) ( not ( = ?auto_93142 ?auto_93146 ) ) ( not ( = ?auto_93140 ?auto_93145 ) ) ( not ( = ?auto_93140 ?auto_93143 ) ) ( not ( = ?auto_93141 ?auto_93145 ) ) ( not ( = ?auto_93141 ?auto_93143 ) ) ( not ( = ?auto_93142 ?auto_93145 ) ) ( not ( = ?auto_93142 ?auto_93143 ) ) ( not ( = ?auto_93146 ?auto_93145 ) ) ( not ( = ?auto_93146 ?auto_93143 ) ) ( not ( = ?auto_93145 ?auto_93143 ) ) ( ON ?auto_93145 ?auto_93146 ) ( not ( = ?auto_93144 ?auto_93143 ) ) ( not ( = ?auto_93140 ?auto_93144 ) ) ( not ( = ?auto_93141 ?auto_93144 ) ) ( not ( = ?auto_93142 ?auto_93144 ) ) ( not ( = ?auto_93146 ?auto_93144 ) ) ( not ( = ?auto_93145 ?auto_93144 ) ) ( ON ?auto_93143 ?auto_93145 ) ( ON ?auto_93144 ?auto_93143 ) ( CLEAR ?auto_93144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93140 ?auto_93141 ?auto_93142 ?auto_93146 ?auto_93145 ?auto_93143 )
      ( MAKE-3PILE ?auto_93140 ?auto_93141 ?auto_93142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91971 - BLOCK
      ?auto_91972 - BLOCK
      ?auto_91973 - BLOCK
    )
    :vars
    (
      ?auto_91974 - BLOCK
      ?auto_91975 - BLOCK
      ?auto_91978 - BLOCK
      ?auto_91977 - BLOCK
      ?auto_91976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91974 ?auto_91973 ) ( ON-TABLE ?auto_91971 ) ( ON ?auto_91972 ?auto_91971 ) ( ON ?auto_91973 ?auto_91972 ) ( not ( = ?auto_91971 ?auto_91972 ) ) ( not ( = ?auto_91971 ?auto_91973 ) ) ( not ( = ?auto_91971 ?auto_91974 ) ) ( not ( = ?auto_91972 ?auto_91973 ) ) ( not ( = ?auto_91972 ?auto_91974 ) ) ( not ( = ?auto_91973 ?auto_91974 ) ) ( not ( = ?auto_91971 ?auto_91975 ) ) ( not ( = ?auto_91971 ?auto_91978 ) ) ( not ( = ?auto_91972 ?auto_91975 ) ) ( not ( = ?auto_91972 ?auto_91978 ) ) ( not ( = ?auto_91973 ?auto_91975 ) ) ( not ( = ?auto_91973 ?auto_91978 ) ) ( not ( = ?auto_91974 ?auto_91975 ) ) ( not ( = ?auto_91974 ?auto_91978 ) ) ( not ( = ?auto_91975 ?auto_91978 ) ) ( ON ?auto_91975 ?auto_91974 ) ( not ( = ?auto_91977 ?auto_91976 ) ) ( not ( = ?auto_91977 ?auto_91978 ) ) ( not ( = ?auto_91976 ?auto_91978 ) ) ( not ( = ?auto_91971 ?auto_91976 ) ) ( not ( = ?auto_91971 ?auto_91977 ) ) ( not ( = ?auto_91972 ?auto_91976 ) ) ( not ( = ?auto_91972 ?auto_91977 ) ) ( not ( = ?auto_91973 ?auto_91976 ) ) ( not ( = ?auto_91973 ?auto_91977 ) ) ( not ( = ?auto_91974 ?auto_91976 ) ) ( not ( = ?auto_91974 ?auto_91977 ) ) ( not ( = ?auto_91975 ?auto_91976 ) ) ( not ( = ?auto_91975 ?auto_91977 ) ) ( ON ?auto_91978 ?auto_91975 ) ( ON ?auto_91976 ?auto_91978 ) ( CLEAR ?auto_91976 ) ( HOLDING ?auto_91977 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_91977 )
      ( MAKE-3PILE ?auto_91971 ?auto_91972 ?auto_91973 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_91979 - BLOCK
      ?auto_91980 - BLOCK
      ?auto_91981 - BLOCK
    )
    :vars
    (
      ?auto_91983 - BLOCK
      ?auto_91982 - BLOCK
      ?auto_91985 - BLOCK
      ?auto_91984 - BLOCK
      ?auto_91986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_91983 ?auto_91981 ) ( ON-TABLE ?auto_91979 ) ( ON ?auto_91980 ?auto_91979 ) ( ON ?auto_91981 ?auto_91980 ) ( not ( = ?auto_91979 ?auto_91980 ) ) ( not ( = ?auto_91979 ?auto_91981 ) ) ( not ( = ?auto_91979 ?auto_91983 ) ) ( not ( = ?auto_91980 ?auto_91981 ) ) ( not ( = ?auto_91980 ?auto_91983 ) ) ( not ( = ?auto_91981 ?auto_91983 ) ) ( not ( = ?auto_91979 ?auto_91982 ) ) ( not ( = ?auto_91979 ?auto_91985 ) ) ( not ( = ?auto_91980 ?auto_91982 ) ) ( not ( = ?auto_91980 ?auto_91985 ) ) ( not ( = ?auto_91981 ?auto_91982 ) ) ( not ( = ?auto_91981 ?auto_91985 ) ) ( not ( = ?auto_91983 ?auto_91982 ) ) ( not ( = ?auto_91983 ?auto_91985 ) ) ( not ( = ?auto_91982 ?auto_91985 ) ) ( ON ?auto_91982 ?auto_91983 ) ( not ( = ?auto_91984 ?auto_91986 ) ) ( not ( = ?auto_91984 ?auto_91985 ) ) ( not ( = ?auto_91986 ?auto_91985 ) ) ( not ( = ?auto_91979 ?auto_91986 ) ) ( not ( = ?auto_91979 ?auto_91984 ) ) ( not ( = ?auto_91980 ?auto_91986 ) ) ( not ( = ?auto_91980 ?auto_91984 ) ) ( not ( = ?auto_91981 ?auto_91986 ) ) ( not ( = ?auto_91981 ?auto_91984 ) ) ( not ( = ?auto_91983 ?auto_91986 ) ) ( not ( = ?auto_91983 ?auto_91984 ) ) ( not ( = ?auto_91982 ?auto_91986 ) ) ( not ( = ?auto_91982 ?auto_91984 ) ) ( ON ?auto_91985 ?auto_91982 ) ( ON ?auto_91986 ?auto_91985 ) ( ON ?auto_91984 ?auto_91986 ) ( CLEAR ?auto_91984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_91979 ?auto_91980 ?auto_91981 ?auto_91983 ?auto_91982 ?auto_91985 ?auto_91986 )
      ( MAKE-3PILE ?auto_91979 ?auto_91980 ?auto_91981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91992 - BLOCK
      ?auto_91993 - BLOCK
      ?auto_91994 - BLOCK
      ?auto_91995 - BLOCK
      ?auto_91996 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_91996 ) ( CLEAR ?auto_91995 ) ( ON-TABLE ?auto_91992 ) ( ON ?auto_91993 ?auto_91992 ) ( ON ?auto_91994 ?auto_91993 ) ( ON ?auto_91995 ?auto_91994 ) ( not ( = ?auto_91992 ?auto_91993 ) ) ( not ( = ?auto_91992 ?auto_91994 ) ) ( not ( = ?auto_91992 ?auto_91995 ) ) ( not ( = ?auto_91992 ?auto_91996 ) ) ( not ( = ?auto_91993 ?auto_91994 ) ) ( not ( = ?auto_91993 ?auto_91995 ) ) ( not ( = ?auto_91993 ?auto_91996 ) ) ( not ( = ?auto_91994 ?auto_91995 ) ) ( not ( = ?auto_91994 ?auto_91996 ) ) ( not ( = ?auto_91995 ?auto_91996 ) ) )
    :subtasks
    ( ( !STACK ?auto_91996 ?auto_91995 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_91997 - BLOCK
      ?auto_91998 - BLOCK
      ?auto_91999 - BLOCK
      ?auto_92000 - BLOCK
      ?auto_92001 - BLOCK
    )
    :vars
    (
      ?auto_92002 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92000 ) ( ON-TABLE ?auto_91997 ) ( ON ?auto_91998 ?auto_91997 ) ( ON ?auto_91999 ?auto_91998 ) ( ON ?auto_92000 ?auto_91999 ) ( not ( = ?auto_91997 ?auto_91998 ) ) ( not ( = ?auto_91997 ?auto_91999 ) ) ( not ( = ?auto_91997 ?auto_92000 ) ) ( not ( = ?auto_91997 ?auto_92001 ) ) ( not ( = ?auto_91998 ?auto_91999 ) ) ( not ( = ?auto_91998 ?auto_92000 ) ) ( not ( = ?auto_91998 ?auto_92001 ) ) ( not ( = ?auto_91999 ?auto_92000 ) ) ( not ( = ?auto_91999 ?auto_92001 ) ) ( not ( = ?auto_92000 ?auto_92001 ) ) ( ON ?auto_92001 ?auto_92002 ) ( CLEAR ?auto_92001 ) ( HAND-EMPTY ) ( not ( = ?auto_91997 ?auto_92002 ) ) ( not ( = ?auto_91998 ?auto_92002 ) ) ( not ( = ?auto_91999 ?auto_92002 ) ) ( not ( = ?auto_92000 ?auto_92002 ) ) ( not ( = ?auto_92001 ?auto_92002 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92001 ?auto_92002 )
      ( MAKE-5PILE ?auto_91997 ?auto_91998 ?auto_91999 ?auto_92000 ?auto_92001 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92003 - BLOCK
      ?auto_92004 - BLOCK
      ?auto_92005 - BLOCK
      ?auto_92006 - BLOCK
      ?auto_92007 - BLOCK
    )
    :vars
    (
      ?auto_92008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92003 ) ( ON ?auto_92004 ?auto_92003 ) ( ON ?auto_92005 ?auto_92004 ) ( not ( = ?auto_92003 ?auto_92004 ) ) ( not ( = ?auto_92003 ?auto_92005 ) ) ( not ( = ?auto_92003 ?auto_92006 ) ) ( not ( = ?auto_92003 ?auto_92007 ) ) ( not ( = ?auto_92004 ?auto_92005 ) ) ( not ( = ?auto_92004 ?auto_92006 ) ) ( not ( = ?auto_92004 ?auto_92007 ) ) ( not ( = ?auto_92005 ?auto_92006 ) ) ( not ( = ?auto_92005 ?auto_92007 ) ) ( not ( = ?auto_92006 ?auto_92007 ) ) ( ON ?auto_92007 ?auto_92008 ) ( CLEAR ?auto_92007 ) ( not ( = ?auto_92003 ?auto_92008 ) ) ( not ( = ?auto_92004 ?auto_92008 ) ) ( not ( = ?auto_92005 ?auto_92008 ) ) ( not ( = ?auto_92006 ?auto_92008 ) ) ( not ( = ?auto_92007 ?auto_92008 ) ) ( HOLDING ?auto_92006 ) ( CLEAR ?auto_92005 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92003 ?auto_92004 ?auto_92005 ?auto_92006 )
      ( MAKE-5PILE ?auto_92003 ?auto_92004 ?auto_92005 ?auto_92006 ?auto_92007 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92009 - BLOCK
      ?auto_92010 - BLOCK
      ?auto_92011 - BLOCK
      ?auto_92012 - BLOCK
      ?auto_92013 - BLOCK
    )
    :vars
    (
      ?auto_92014 - BLOCK
      ?auto_92016 - BLOCK
      ?auto_92015 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92009 ) ( ON ?auto_92010 ?auto_92009 ) ( ON ?auto_92011 ?auto_92010 ) ( not ( = ?auto_92009 ?auto_92010 ) ) ( not ( = ?auto_92009 ?auto_92011 ) ) ( not ( = ?auto_92009 ?auto_92012 ) ) ( not ( = ?auto_92009 ?auto_92013 ) ) ( not ( = ?auto_92010 ?auto_92011 ) ) ( not ( = ?auto_92010 ?auto_92012 ) ) ( not ( = ?auto_92010 ?auto_92013 ) ) ( not ( = ?auto_92011 ?auto_92012 ) ) ( not ( = ?auto_92011 ?auto_92013 ) ) ( not ( = ?auto_92012 ?auto_92013 ) ) ( ON ?auto_92013 ?auto_92014 ) ( not ( = ?auto_92009 ?auto_92014 ) ) ( not ( = ?auto_92010 ?auto_92014 ) ) ( not ( = ?auto_92011 ?auto_92014 ) ) ( not ( = ?auto_92012 ?auto_92014 ) ) ( not ( = ?auto_92013 ?auto_92014 ) ) ( CLEAR ?auto_92011 ) ( ON ?auto_92012 ?auto_92013 ) ( CLEAR ?auto_92012 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92016 ) ( ON ?auto_92015 ?auto_92016 ) ( ON ?auto_92014 ?auto_92015 ) ( not ( = ?auto_92016 ?auto_92015 ) ) ( not ( = ?auto_92016 ?auto_92014 ) ) ( not ( = ?auto_92016 ?auto_92013 ) ) ( not ( = ?auto_92016 ?auto_92012 ) ) ( not ( = ?auto_92015 ?auto_92014 ) ) ( not ( = ?auto_92015 ?auto_92013 ) ) ( not ( = ?auto_92015 ?auto_92012 ) ) ( not ( = ?auto_92009 ?auto_92016 ) ) ( not ( = ?auto_92009 ?auto_92015 ) ) ( not ( = ?auto_92010 ?auto_92016 ) ) ( not ( = ?auto_92010 ?auto_92015 ) ) ( not ( = ?auto_92011 ?auto_92016 ) ) ( not ( = ?auto_92011 ?auto_92015 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92016 ?auto_92015 ?auto_92014 ?auto_92013 )
      ( MAKE-5PILE ?auto_92009 ?auto_92010 ?auto_92011 ?auto_92012 ?auto_92013 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92017 - BLOCK
      ?auto_92018 - BLOCK
      ?auto_92019 - BLOCK
      ?auto_92020 - BLOCK
      ?auto_92021 - BLOCK
    )
    :vars
    (
      ?auto_92023 - BLOCK
      ?auto_92022 - BLOCK
      ?auto_92024 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92017 ) ( ON ?auto_92018 ?auto_92017 ) ( not ( = ?auto_92017 ?auto_92018 ) ) ( not ( = ?auto_92017 ?auto_92019 ) ) ( not ( = ?auto_92017 ?auto_92020 ) ) ( not ( = ?auto_92017 ?auto_92021 ) ) ( not ( = ?auto_92018 ?auto_92019 ) ) ( not ( = ?auto_92018 ?auto_92020 ) ) ( not ( = ?auto_92018 ?auto_92021 ) ) ( not ( = ?auto_92019 ?auto_92020 ) ) ( not ( = ?auto_92019 ?auto_92021 ) ) ( not ( = ?auto_92020 ?auto_92021 ) ) ( ON ?auto_92021 ?auto_92023 ) ( not ( = ?auto_92017 ?auto_92023 ) ) ( not ( = ?auto_92018 ?auto_92023 ) ) ( not ( = ?auto_92019 ?auto_92023 ) ) ( not ( = ?auto_92020 ?auto_92023 ) ) ( not ( = ?auto_92021 ?auto_92023 ) ) ( ON ?auto_92020 ?auto_92021 ) ( CLEAR ?auto_92020 ) ( ON-TABLE ?auto_92022 ) ( ON ?auto_92024 ?auto_92022 ) ( ON ?auto_92023 ?auto_92024 ) ( not ( = ?auto_92022 ?auto_92024 ) ) ( not ( = ?auto_92022 ?auto_92023 ) ) ( not ( = ?auto_92022 ?auto_92021 ) ) ( not ( = ?auto_92022 ?auto_92020 ) ) ( not ( = ?auto_92024 ?auto_92023 ) ) ( not ( = ?auto_92024 ?auto_92021 ) ) ( not ( = ?auto_92024 ?auto_92020 ) ) ( not ( = ?auto_92017 ?auto_92022 ) ) ( not ( = ?auto_92017 ?auto_92024 ) ) ( not ( = ?auto_92018 ?auto_92022 ) ) ( not ( = ?auto_92018 ?auto_92024 ) ) ( not ( = ?auto_92019 ?auto_92022 ) ) ( not ( = ?auto_92019 ?auto_92024 ) ) ( HOLDING ?auto_92019 ) ( CLEAR ?auto_92018 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92017 ?auto_92018 ?auto_92019 )
      ( MAKE-5PILE ?auto_92017 ?auto_92018 ?auto_92019 ?auto_92020 ?auto_92021 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92025 - BLOCK
      ?auto_92026 - BLOCK
      ?auto_92027 - BLOCK
      ?auto_92028 - BLOCK
      ?auto_92029 - BLOCK
    )
    :vars
    (
      ?auto_92032 - BLOCK
      ?auto_92030 - BLOCK
      ?auto_92031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92025 ) ( ON ?auto_92026 ?auto_92025 ) ( not ( = ?auto_92025 ?auto_92026 ) ) ( not ( = ?auto_92025 ?auto_92027 ) ) ( not ( = ?auto_92025 ?auto_92028 ) ) ( not ( = ?auto_92025 ?auto_92029 ) ) ( not ( = ?auto_92026 ?auto_92027 ) ) ( not ( = ?auto_92026 ?auto_92028 ) ) ( not ( = ?auto_92026 ?auto_92029 ) ) ( not ( = ?auto_92027 ?auto_92028 ) ) ( not ( = ?auto_92027 ?auto_92029 ) ) ( not ( = ?auto_92028 ?auto_92029 ) ) ( ON ?auto_92029 ?auto_92032 ) ( not ( = ?auto_92025 ?auto_92032 ) ) ( not ( = ?auto_92026 ?auto_92032 ) ) ( not ( = ?auto_92027 ?auto_92032 ) ) ( not ( = ?auto_92028 ?auto_92032 ) ) ( not ( = ?auto_92029 ?auto_92032 ) ) ( ON ?auto_92028 ?auto_92029 ) ( ON-TABLE ?auto_92030 ) ( ON ?auto_92031 ?auto_92030 ) ( ON ?auto_92032 ?auto_92031 ) ( not ( = ?auto_92030 ?auto_92031 ) ) ( not ( = ?auto_92030 ?auto_92032 ) ) ( not ( = ?auto_92030 ?auto_92029 ) ) ( not ( = ?auto_92030 ?auto_92028 ) ) ( not ( = ?auto_92031 ?auto_92032 ) ) ( not ( = ?auto_92031 ?auto_92029 ) ) ( not ( = ?auto_92031 ?auto_92028 ) ) ( not ( = ?auto_92025 ?auto_92030 ) ) ( not ( = ?auto_92025 ?auto_92031 ) ) ( not ( = ?auto_92026 ?auto_92030 ) ) ( not ( = ?auto_92026 ?auto_92031 ) ) ( not ( = ?auto_92027 ?auto_92030 ) ) ( not ( = ?auto_92027 ?auto_92031 ) ) ( CLEAR ?auto_92026 ) ( ON ?auto_92027 ?auto_92028 ) ( CLEAR ?auto_92027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92030 ?auto_92031 ?auto_92032 ?auto_92029 ?auto_92028 )
      ( MAKE-5PILE ?auto_92025 ?auto_92026 ?auto_92027 ?auto_92028 ?auto_92029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92033 - BLOCK
      ?auto_92034 - BLOCK
      ?auto_92035 - BLOCK
      ?auto_92036 - BLOCK
      ?auto_92037 - BLOCK
    )
    :vars
    (
      ?auto_92040 - BLOCK
      ?auto_92039 - BLOCK
      ?auto_92038 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92033 ) ( not ( = ?auto_92033 ?auto_92034 ) ) ( not ( = ?auto_92033 ?auto_92035 ) ) ( not ( = ?auto_92033 ?auto_92036 ) ) ( not ( = ?auto_92033 ?auto_92037 ) ) ( not ( = ?auto_92034 ?auto_92035 ) ) ( not ( = ?auto_92034 ?auto_92036 ) ) ( not ( = ?auto_92034 ?auto_92037 ) ) ( not ( = ?auto_92035 ?auto_92036 ) ) ( not ( = ?auto_92035 ?auto_92037 ) ) ( not ( = ?auto_92036 ?auto_92037 ) ) ( ON ?auto_92037 ?auto_92040 ) ( not ( = ?auto_92033 ?auto_92040 ) ) ( not ( = ?auto_92034 ?auto_92040 ) ) ( not ( = ?auto_92035 ?auto_92040 ) ) ( not ( = ?auto_92036 ?auto_92040 ) ) ( not ( = ?auto_92037 ?auto_92040 ) ) ( ON ?auto_92036 ?auto_92037 ) ( ON-TABLE ?auto_92039 ) ( ON ?auto_92038 ?auto_92039 ) ( ON ?auto_92040 ?auto_92038 ) ( not ( = ?auto_92039 ?auto_92038 ) ) ( not ( = ?auto_92039 ?auto_92040 ) ) ( not ( = ?auto_92039 ?auto_92037 ) ) ( not ( = ?auto_92039 ?auto_92036 ) ) ( not ( = ?auto_92038 ?auto_92040 ) ) ( not ( = ?auto_92038 ?auto_92037 ) ) ( not ( = ?auto_92038 ?auto_92036 ) ) ( not ( = ?auto_92033 ?auto_92039 ) ) ( not ( = ?auto_92033 ?auto_92038 ) ) ( not ( = ?auto_92034 ?auto_92039 ) ) ( not ( = ?auto_92034 ?auto_92038 ) ) ( not ( = ?auto_92035 ?auto_92039 ) ) ( not ( = ?auto_92035 ?auto_92038 ) ) ( ON ?auto_92035 ?auto_92036 ) ( CLEAR ?auto_92035 ) ( HOLDING ?auto_92034 ) ( CLEAR ?auto_92033 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92033 ?auto_92034 )
      ( MAKE-5PILE ?auto_92033 ?auto_92034 ?auto_92035 ?auto_92036 ?auto_92037 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92041 - BLOCK
      ?auto_92042 - BLOCK
      ?auto_92043 - BLOCK
      ?auto_92044 - BLOCK
      ?auto_92045 - BLOCK
    )
    :vars
    (
      ?auto_92046 - BLOCK
      ?auto_92048 - BLOCK
      ?auto_92047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92041 ) ( not ( = ?auto_92041 ?auto_92042 ) ) ( not ( = ?auto_92041 ?auto_92043 ) ) ( not ( = ?auto_92041 ?auto_92044 ) ) ( not ( = ?auto_92041 ?auto_92045 ) ) ( not ( = ?auto_92042 ?auto_92043 ) ) ( not ( = ?auto_92042 ?auto_92044 ) ) ( not ( = ?auto_92042 ?auto_92045 ) ) ( not ( = ?auto_92043 ?auto_92044 ) ) ( not ( = ?auto_92043 ?auto_92045 ) ) ( not ( = ?auto_92044 ?auto_92045 ) ) ( ON ?auto_92045 ?auto_92046 ) ( not ( = ?auto_92041 ?auto_92046 ) ) ( not ( = ?auto_92042 ?auto_92046 ) ) ( not ( = ?auto_92043 ?auto_92046 ) ) ( not ( = ?auto_92044 ?auto_92046 ) ) ( not ( = ?auto_92045 ?auto_92046 ) ) ( ON ?auto_92044 ?auto_92045 ) ( ON-TABLE ?auto_92048 ) ( ON ?auto_92047 ?auto_92048 ) ( ON ?auto_92046 ?auto_92047 ) ( not ( = ?auto_92048 ?auto_92047 ) ) ( not ( = ?auto_92048 ?auto_92046 ) ) ( not ( = ?auto_92048 ?auto_92045 ) ) ( not ( = ?auto_92048 ?auto_92044 ) ) ( not ( = ?auto_92047 ?auto_92046 ) ) ( not ( = ?auto_92047 ?auto_92045 ) ) ( not ( = ?auto_92047 ?auto_92044 ) ) ( not ( = ?auto_92041 ?auto_92048 ) ) ( not ( = ?auto_92041 ?auto_92047 ) ) ( not ( = ?auto_92042 ?auto_92048 ) ) ( not ( = ?auto_92042 ?auto_92047 ) ) ( not ( = ?auto_92043 ?auto_92048 ) ) ( not ( = ?auto_92043 ?auto_92047 ) ) ( ON ?auto_92043 ?auto_92044 ) ( CLEAR ?auto_92041 ) ( ON ?auto_92042 ?auto_92043 ) ( CLEAR ?auto_92042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92048 ?auto_92047 ?auto_92046 ?auto_92045 ?auto_92044 ?auto_92043 )
      ( MAKE-5PILE ?auto_92041 ?auto_92042 ?auto_92043 ?auto_92044 ?auto_92045 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92049 - BLOCK
      ?auto_92050 - BLOCK
      ?auto_92051 - BLOCK
      ?auto_92052 - BLOCK
      ?auto_92053 - BLOCK
    )
    :vars
    (
      ?auto_92056 - BLOCK
      ?auto_92054 - BLOCK
      ?auto_92055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92049 ?auto_92050 ) ) ( not ( = ?auto_92049 ?auto_92051 ) ) ( not ( = ?auto_92049 ?auto_92052 ) ) ( not ( = ?auto_92049 ?auto_92053 ) ) ( not ( = ?auto_92050 ?auto_92051 ) ) ( not ( = ?auto_92050 ?auto_92052 ) ) ( not ( = ?auto_92050 ?auto_92053 ) ) ( not ( = ?auto_92051 ?auto_92052 ) ) ( not ( = ?auto_92051 ?auto_92053 ) ) ( not ( = ?auto_92052 ?auto_92053 ) ) ( ON ?auto_92053 ?auto_92056 ) ( not ( = ?auto_92049 ?auto_92056 ) ) ( not ( = ?auto_92050 ?auto_92056 ) ) ( not ( = ?auto_92051 ?auto_92056 ) ) ( not ( = ?auto_92052 ?auto_92056 ) ) ( not ( = ?auto_92053 ?auto_92056 ) ) ( ON ?auto_92052 ?auto_92053 ) ( ON-TABLE ?auto_92054 ) ( ON ?auto_92055 ?auto_92054 ) ( ON ?auto_92056 ?auto_92055 ) ( not ( = ?auto_92054 ?auto_92055 ) ) ( not ( = ?auto_92054 ?auto_92056 ) ) ( not ( = ?auto_92054 ?auto_92053 ) ) ( not ( = ?auto_92054 ?auto_92052 ) ) ( not ( = ?auto_92055 ?auto_92056 ) ) ( not ( = ?auto_92055 ?auto_92053 ) ) ( not ( = ?auto_92055 ?auto_92052 ) ) ( not ( = ?auto_92049 ?auto_92054 ) ) ( not ( = ?auto_92049 ?auto_92055 ) ) ( not ( = ?auto_92050 ?auto_92054 ) ) ( not ( = ?auto_92050 ?auto_92055 ) ) ( not ( = ?auto_92051 ?auto_92054 ) ) ( not ( = ?auto_92051 ?auto_92055 ) ) ( ON ?auto_92051 ?auto_92052 ) ( ON ?auto_92050 ?auto_92051 ) ( CLEAR ?auto_92050 ) ( HOLDING ?auto_92049 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92049 )
      ( MAKE-5PILE ?auto_92049 ?auto_92050 ?auto_92051 ?auto_92052 ?auto_92053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92057 - BLOCK
      ?auto_92058 - BLOCK
      ?auto_92059 - BLOCK
      ?auto_92060 - BLOCK
      ?auto_92061 - BLOCK
    )
    :vars
    (
      ?auto_92064 - BLOCK
      ?auto_92063 - BLOCK
      ?auto_92062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92057 ?auto_92058 ) ) ( not ( = ?auto_92057 ?auto_92059 ) ) ( not ( = ?auto_92057 ?auto_92060 ) ) ( not ( = ?auto_92057 ?auto_92061 ) ) ( not ( = ?auto_92058 ?auto_92059 ) ) ( not ( = ?auto_92058 ?auto_92060 ) ) ( not ( = ?auto_92058 ?auto_92061 ) ) ( not ( = ?auto_92059 ?auto_92060 ) ) ( not ( = ?auto_92059 ?auto_92061 ) ) ( not ( = ?auto_92060 ?auto_92061 ) ) ( ON ?auto_92061 ?auto_92064 ) ( not ( = ?auto_92057 ?auto_92064 ) ) ( not ( = ?auto_92058 ?auto_92064 ) ) ( not ( = ?auto_92059 ?auto_92064 ) ) ( not ( = ?auto_92060 ?auto_92064 ) ) ( not ( = ?auto_92061 ?auto_92064 ) ) ( ON ?auto_92060 ?auto_92061 ) ( ON-TABLE ?auto_92063 ) ( ON ?auto_92062 ?auto_92063 ) ( ON ?auto_92064 ?auto_92062 ) ( not ( = ?auto_92063 ?auto_92062 ) ) ( not ( = ?auto_92063 ?auto_92064 ) ) ( not ( = ?auto_92063 ?auto_92061 ) ) ( not ( = ?auto_92063 ?auto_92060 ) ) ( not ( = ?auto_92062 ?auto_92064 ) ) ( not ( = ?auto_92062 ?auto_92061 ) ) ( not ( = ?auto_92062 ?auto_92060 ) ) ( not ( = ?auto_92057 ?auto_92063 ) ) ( not ( = ?auto_92057 ?auto_92062 ) ) ( not ( = ?auto_92058 ?auto_92063 ) ) ( not ( = ?auto_92058 ?auto_92062 ) ) ( not ( = ?auto_92059 ?auto_92063 ) ) ( not ( = ?auto_92059 ?auto_92062 ) ) ( ON ?auto_92059 ?auto_92060 ) ( ON ?auto_92058 ?auto_92059 ) ( ON ?auto_92057 ?auto_92058 ) ( CLEAR ?auto_92057 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92063 ?auto_92062 ?auto_92064 ?auto_92061 ?auto_92060 ?auto_92059 ?auto_92058 )
      ( MAKE-5PILE ?auto_92057 ?auto_92058 ?auto_92059 ?auto_92060 ?auto_92061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92067 - BLOCK
      ?auto_92068 - BLOCK
    )
    :vars
    (
      ?auto_92069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92069 ?auto_92068 ) ( CLEAR ?auto_92069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92067 ) ( ON ?auto_92068 ?auto_92067 ) ( not ( = ?auto_92067 ?auto_92068 ) ) ( not ( = ?auto_92067 ?auto_92069 ) ) ( not ( = ?auto_92068 ?auto_92069 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92069 ?auto_92068 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92070 - BLOCK
      ?auto_92071 - BLOCK
    )
    :vars
    (
      ?auto_92072 - BLOCK
      ?auto_92073 - BLOCK
      ?auto_92074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92072 ?auto_92071 ) ( CLEAR ?auto_92072 ) ( ON-TABLE ?auto_92070 ) ( ON ?auto_92071 ?auto_92070 ) ( not ( = ?auto_92070 ?auto_92071 ) ) ( not ( = ?auto_92070 ?auto_92072 ) ) ( not ( = ?auto_92071 ?auto_92072 ) ) ( HOLDING ?auto_92073 ) ( CLEAR ?auto_92074 ) ( not ( = ?auto_92070 ?auto_92073 ) ) ( not ( = ?auto_92070 ?auto_92074 ) ) ( not ( = ?auto_92071 ?auto_92073 ) ) ( not ( = ?auto_92071 ?auto_92074 ) ) ( not ( = ?auto_92072 ?auto_92073 ) ) ( not ( = ?auto_92072 ?auto_92074 ) ) ( not ( = ?auto_92073 ?auto_92074 ) ) )
    :subtasks
    ( ( !STACK ?auto_92073 ?auto_92074 )
      ( MAKE-2PILE ?auto_92070 ?auto_92071 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92075 - BLOCK
      ?auto_92076 - BLOCK
    )
    :vars
    (
      ?auto_92079 - BLOCK
      ?auto_92077 - BLOCK
      ?auto_92078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92079 ?auto_92076 ) ( ON-TABLE ?auto_92075 ) ( ON ?auto_92076 ?auto_92075 ) ( not ( = ?auto_92075 ?auto_92076 ) ) ( not ( = ?auto_92075 ?auto_92079 ) ) ( not ( = ?auto_92076 ?auto_92079 ) ) ( CLEAR ?auto_92077 ) ( not ( = ?auto_92075 ?auto_92078 ) ) ( not ( = ?auto_92075 ?auto_92077 ) ) ( not ( = ?auto_92076 ?auto_92078 ) ) ( not ( = ?auto_92076 ?auto_92077 ) ) ( not ( = ?auto_92079 ?auto_92078 ) ) ( not ( = ?auto_92079 ?auto_92077 ) ) ( not ( = ?auto_92078 ?auto_92077 ) ) ( ON ?auto_92078 ?auto_92079 ) ( CLEAR ?auto_92078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92075 ?auto_92076 ?auto_92079 )
      ( MAKE-2PILE ?auto_92075 ?auto_92076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92080 - BLOCK
      ?auto_92081 - BLOCK
    )
    :vars
    (
      ?auto_92084 - BLOCK
      ?auto_92083 - BLOCK
      ?auto_92082 - BLOCK
      ?auto_92087 - BLOCK
      ?auto_92085 - BLOCK
      ?auto_92086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92084 ?auto_92081 ) ( ON-TABLE ?auto_92080 ) ( ON ?auto_92081 ?auto_92080 ) ( not ( = ?auto_92080 ?auto_92081 ) ) ( not ( = ?auto_92080 ?auto_92084 ) ) ( not ( = ?auto_92081 ?auto_92084 ) ) ( not ( = ?auto_92080 ?auto_92083 ) ) ( not ( = ?auto_92080 ?auto_92082 ) ) ( not ( = ?auto_92081 ?auto_92083 ) ) ( not ( = ?auto_92081 ?auto_92082 ) ) ( not ( = ?auto_92084 ?auto_92083 ) ) ( not ( = ?auto_92084 ?auto_92082 ) ) ( not ( = ?auto_92083 ?auto_92082 ) ) ( ON ?auto_92083 ?auto_92084 ) ( CLEAR ?auto_92083 ) ( HOLDING ?auto_92082 ) ( CLEAR ?auto_92087 ) ( ON-TABLE ?auto_92085 ) ( ON ?auto_92086 ?auto_92085 ) ( ON ?auto_92087 ?auto_92086 ) ( not ( = ?auto_92085 ?auto_92086 ) ) ( not ( = ?auto_92085 ?auto_92087 ) ) ( not ( = ?auto_92085 ?auto_92082 ) ) ( not ( = ?auto_92086 ?auto_92087 ) ) ( not ( = ?auto_92086 ?auto_92082 ) ) ( not ( = ?auto_92087 ?auto_92082 ) ) ( not ( = ?auto_92080 ?auto_92087 ) ) ( not ( = ?auto_92080 ?auto_92085 ) ) ( not ( = ?auto_92080 ?auto_92086 ) ) ( not ( = ?auto_92081 ?auto_92087 ) ) ( not ( = ?auto_92081 ?auto_92085 ) ) ( not ( = ?auto_92081 ?auto_92086 ) ) ( not ( = ?auto_92084 ?auto_92087 ) ) ( not ( = ?auto_92084 ?auto_92085 ) ) ( not ( = ?auto_92084 ?auto_92086 ) ) ( not ( = ?auto_92083 ?auto_92087 ) ) ( not ( = ?auto_92083 ?auto_92085 ) ) ( not ( = ?auto_92083 ?auto_92086 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92085 ?auto_92086 ?auto_92087 ?auto_92082 )
      ( MAKE-2PILE ?auto_92080 ?auto_92081 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92088 - BLOCK
      ?auto_92089 - BLOCK
    )
    :vars
    (
      ?auto_92091 - BLOCK
      ?auto_92090 - BLOCK
      ?auto_92092 - BLOCK
      ?auto_92093 - BLOCK
      ?auto_92095 - BLOCK
      ?auto_92094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92091 ?auto_92089 ) ( ON-TABLE ?auto_92088 ) ( ON ?auto_92089 ?auto_92088 ) ( not ( = ?auto_92088 ?auto_92089 ) ) ( not ( = ?auto_92088 ?auto_92091 ) ) ( not ( = ?auto_92089 ?auto_92091 ) ) ( not ( = ?auto_92088 ?auto_92090 ) ) ( not ( = ?auto_92088 ?auto_92092 ) ) ( not ( = ?auto_92089 ?auto_92090 ) ) ( not ( = ?auto_92089 ?auto_92092 ) ) ( not ( = ?auto_92091 ?auto_92090 ) ) ( not ( = ?auto_92091 ?auto_92092 ) ) ( not ( = ?auto_92090 ?auto_92092 ) ) ( ON ?auto_92090 ?auto_92091 ) ( CLEAR ?auto_92093 ) ( ON-TABLE ?auto_92095 ) ( ON ?auto_92094 ?auto_92095 ) ( ON ?auto_92093 ?auto_92094 ) ( not ( = ?auto_92095 ?auto_92094 ) ) ( not ( = ?auto_92095 ?auto_92093 ) ) ( not ( = ?auto_92095 ?auto_92092 ) ) ( not ( = ?auto_92094 ?auto_92093 ) ) ( not ( = ?auto_92094 ?auto_92092 ) ) ( not ( = ?auto_92093 ?auto_92092 ) ) ( not ( = ?auto_92088 ?auto_92093 ) ) ( not ( = ?auto_92088 ?auto_92095 ) ) ( not ( = ?auto_92088 ?auto_92094 ) ) ( not ( = ?auto_92089 ?auto_92093 ) ) ( not ( = ?auto_92089 ?auto_92095 ) ) ( not ( = ?auto_92089 ?auto_92094 ) ) ( not ( = ?auto_92091 ?auto_92093 ) ) ( not ( = ?auto_92091 ?auto_92095 ) ) ( not ( = ?auto_92091 ?auto_92094 ) ) ( not ( = ?auto_92090 ?auto_92093 ) ) ( not ( = ?auto_92090 ?auto_92095 ) ) ( not ( = ?auto_92090 ?auto_92094 ) ) ( ON ?auto_92092 ?auto_92090 ) ( CLEAR ?auto_92092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92088 ?auto_92089 ?auto_92091 ?auto_92090 )
      ( MAKE-2PILE ?auto_92088 ?auto_92089 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92096 - BLOCK
      ?auto_92097 - BLOCK
    )
    :vars
    (
      ?auto_92099 - BLOCK
      ?auto_92102 - BLOCK
      ?auto_92098 - BLOCK
      ?auto_92103 - BLOCK
      ?auto_92101 - BLOCK
      ?auto_92100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92099 ?auto_92097 ) ( ON-TABLE ?auto_92096 ) ( ON ?auto_92097 ?auto_92096 ) ( not ( = ?auto_92096 ?auto_92097 ) ) ( not ( = ?auto_92096 ?auto_92099 ) ) ( not ( = ?auto_92097 ?auto_92099 ) ) ( not ( = ?auto_92096 ?auto_92102 ) ) ( not ( = ?auto_92096 ?auto_92098 ) ) ( not ( = ?auto_92097 ?auto_92102 ) ) ( not ( = ?auto_92097 ?auto_92098 ) ) ( not ( = ?auto_92099 ?auto_92102 ) ) ( not ( = ?auto_92099 ?auto_92098 ) ) ( not ( = ?auto_92102 ?auto_92098 ) ) ( ON ?auto_92102 ?auto_92099 ) ( ON-TABLE ?auto_92103 ) ( ON ?auto_92101 ?auto_92103 ) ( not ( = ?auto_92103 ?auto_92101 ) ) ( not ( = ?auto_92103 ?auto_92100 ) ) ( not ( = ?auto_92103 ?auto_92098 ) ) ( not ( = ?auto_92101 ?auto_92100 ) ) ( not ( = ?auto_92101 ?auto_92098 ) ) ( not ( = ?auto_92100 ?auto_92098 ) ) ( not ( = ?auto_92096 ?auto_92100 ) ) ( not ( = ?auto_92096 ?auto_92103 ) ) ( not ( = ?auto_92096 ?auto_92101 ) ) ( not ( = ?auto_92097 ?auto_92100 ) ) ( not ( = ?auto_92097 ?auto_92103 ) ) ( not ( = ?auto_92097 ?auto_92101 ) ) ( not ( = ?auto_92099 ?auto_92100 ) ) ( not ( = ?auto_92099 ?auto_92103 ) ) ( not ( = ?auto_92099 ?auto_92101 ) ) ( not ( = ?auto_92102 ?auto_92100 ) ) ( not ( = ?auto_92102 ?auto_92103 ) ) ( not ( = ?auto_92102 ?auto_92101 ) ) ( ON ?auto_92098 ?auto_92102 ) ( CLEAR ?auto_92098 ) ( HOLDING ?auto_92100 ) ( CLEAR ?auto_92101 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92103 ?auto_92101 ?auto_92100 )
      ( MAKE-2PILE ?auto_92096 ?auto_92097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92104 - BLOCK
      ?auto_92105 - BLOCK
    )
    :vars
    (
      ?auto_92106 - BLOCK
      ?auto_92110 - BLOCK
      ?auto_92107 - BLOCK
      ?auto_92108 - BLOCK
      ?auto_92111 - BLOCK
      ?auto_92109 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92106 ?auto_92105 ) ( ON-TABLE ?auto_92104 ) ( ON ?auto_92105 ?auto_92104 ) ( not ( = ?auto_92104 ?auto_92105 ) ) ( not ( = ?auto_92104 ?auto_92106 ) ) ( not ( = ?auto_92105 ?auto_92106 ) ) ( not ( = ?auto_92104 ?auto_92110 ) ) ( not ( = ?auto_92104 ?auto_92107 ) ) ( not ( = ?auto_92105 ?auto_92110 ) ) ( not ( = ?auto_92105 ?auto_92107 ) ) ( not ( = ?auto_92106 ?auto_92110 ) ) ( not ( = ?auto_92106 ?auto_92107 ) ) ( not ( = ?auto_92110 ?auto_92107 ) ) ( ON ?auto_92110 ?auto_92106 ) ( ON-TABLE ?auto_92108 ) ( ON ?auto_92111 ?auto_92108 ) ( not ( = ?auto_92108 ?auto_92111 ) ) ( not ( = ?auto_92108 ?auto_92109 ) ) ( not ( = ?auto_92108 ?auto_92107 ) ) ( not ( = ?auto_92111 ?auto_92109 ) ) ( not ( = ?auto_92111 ?auto_92107 ) ) ( not ( = ?auto_92109 ?auto_92107 ) ) ( not ( = ?auto_92104 ?auto_92109 ) ) ( not ( = ?auto_92104 ?auto_92108 ) ) ( not ( = ?auto_92104 ?auto_92111 ) ) ( not ( = ?auto_92105 ?auto_92109 ) ) ( not ( = ?auto_92105 ?auto_92108 ) ) ( not ( = ?auto_92105 ?auto_92111 ) ) ( not ( = ?auto_92106 ?auto_92109 ) ) ( not ( = ?auto_92106 ?auto_92108 ) ) ( not ( = ?auto_92106 ?auto_92111 ) ) ( not ( = ?auto_92110 ?auto_92109 ) ) ( not ( = ?auto_92110 ?auto_92108 ) ) ( not ( = ?auto_92110 ?auto_92111 ) ) ( ON ?auto_92107 ?auto_92110 ) ( CLEAR ?auto_92111 ) ( ON ?auto_92109 ?auto_92107 ) ( CLEAR ?auto_92109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92104 ?auto_92105 ?auto_92106 ?auto_92110 ?auto_92107 )
      ( MAKE-2PILE ?auto_92104 ?auto_92105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92112 - BLOCK
      ?auto_92113 - BLOCK
    )
    :vars
    (
      ?auto_92114 - BLOCK
      ?auto_92117 - BLOCK
      ?auto_92116 - BLOCK
      ?auto_92118 - BLOCK
      ?auto_92115 - BLOCK
      ?auto_92119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92114 ?auto_92113 ) ( ON-TABLE ?auto_92112 ) ( ON ?auto_92113 ?auto_92112 ) ( not ( = ?auto_92112 ?auto_92113 ) ) ( not ( = ?auto_92112 ?auto_92114 ) ) ( not ( = ?auto_92113 ?auto_92114 ) ) ( not ( = ?auto_92112 ?auto_92117 ) ) ( not ( = ?auto_92112 ?auto_92116 ) ) ( not ( = ?auto_92113 ?auto_92117 ) ) ( not ( = ?auto_92113 ?auto_92116 ) ) ( not ( = ?auto_92114 ?auto_92117 ) ) ( not ( = ?auto_92114 ?auto_92116 ) ) ( not ( = ?auto_92117 ?auto_92116 ) ) ( ON ?auto_92117 ?auto_92114 ) ( ON-TABLE ?auto_92118 ) ( not ( = ?auto_92118 ?auto_92115 ) ) ( not ( = ?auto_92118 ?auto_92119 ) ) ( not ( = ?auto_92118 ?auto_92116 ) ) ( not ( = ?auto_92115 ?auto_92119 ) ) ( not ( = ?auto_92115 ?auto_92116 ) ) ( not ( = ?auto_92119 ?auto_92116 ) ) ( not ( = ?auto_92112 ?auto_92119 ) ) ( not ( = ?auto_92112 ?auto_92118 ) ) ( not ( = ?auto_92112 ?auto_92115 ) ) ( not ( = ?auto_92113 ?auto_92119 ) ) ( not ( = ?auto_92113 ?auto_92118 ) ) ( not ( = ?auto_92113 ?auto_92115 ) ) ( not ( = ?auto_92114 ?auto_92119 ) ) ( not ( = ?auto_92114 ?auto_92118 ) ) ( not ( = ?auto_92114 ?auto_92115 ) ) ( not ( = ?auto_92117 ?auto_92119 ) ) ( not ( = ?auto_92117 ?auto_92118 ) ) ( not ( = ?auto_92117 ?auto_92115 ) ) ( ON ?auto_92116 ?auto_92117 ) ( ON ?auto_92119 ?auto_92116 ) ( CLEAR ?auto_92119 ) ( HOLDING ?auto_92115 ) ( CLEAR ?auto_92118 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92118 ?auto_92115 )
      ( MAKE-2PILE ?auto_92112 ?auto_92113 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93413 - BLOCK
      ?auto_93414 - BLOCK
    )
    :vars
    (
      ?auto_93418 - BLOCK
      ?auto_93419 - BLOCK
      ?auto_93416 - BLOCK
      ?auto_93415 - BLOCK
      ?auto_93417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93418 ?auto_93414 ) ( ON-TABLE ?auto_93413 ) ( ON ?auto_93414 ?auto_93413 ) ( not ( = ?auto_93413 ?auto_93414 ) ) ( not ( = ?auto_93413 ?auto_93418 ) ) ( not ( = ?auto_93414 ?auto_93418 ) ) ( not ( = ?auto_93413 ?auto_93419 ) ) ( not ( = ?auto_93413 ?auto_93416 ) ) ( not ( = ?auto_93414 ?auto_93419 ) ) ( not ( = ?auto_93414 ?auto_93416 ) ) ( not ( = ?auto_93418 ?auto_93419 ) ) ( not ( = ?auto_93418 ?auto_93416 ) ) ( not ( = ?auto_93419 ?auto_93416 ) ) ( ON ?auto_93419 ?auto_93418 ) ( not ( = ?auto_93415 ?auto_93417 ) ) ( not ( = ?auto_93415 ?auto_93416 ) ) ( not ( = ?auto_93417 ?auto_93416 ) ) ( not ( = ?auto_93413 ?auto_93417 ) ) ( not ( = ?auto_93413 ?auto_93415 ) ) ( not ( = ?auto_93414 ?auto_93417 ) ) ( not ( = ?auto_93414 ?auto_93415 ) ) ( not ( = ?auto_93418 ?auto_93417 ) ) ( not ( = ?auto_93418 ?auto_93415 ) ) ( not ( = ?auto_93419 ?auto_93417 ) ) ( not ( = ?auto_93419 ?auto_93415 ) ) ( ON ?auto_93416 ?auto_93419 ) ( ON ?auto_93417 ?auto_93416 ) ( ON ?auto_93415 ?auto_93417 ) ( CLEAR ?auto_93415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93413 ?auto_93414 ?auto_93418 ?auto_93419 ?auto_93416 ?auto_93417 )
      ( MAKE-2PILE ?auto_93413 ?auto_93414 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92128 - BLOCK
      ?auto_92129 - BLOCK
    )
    :vars
    (
      ?auto_92132 - BLOCK
      ?auto_92135 - BLOCK
      ?auto_92131 - BLOCK
      ?auto_92134 - BLOCK
      ?auto_92133 - BLOCK
      ?auto_92130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92132 ?auto_92129 ) ( ON-TABLE ?auto_92128 ) ( ON ?auto_92129 ?auto_92128 ) ( not ( = ?auto_92128 ?auto_92129 ) ) ( not ( = ?auto_92128 ?auto_92132 ) ) ( not ( = ?auto_92129 ?auto_92132 ) ) ( not ( = ?auto_92128 ?auto_92135 ) ) ( not ( = ?auto_92128 ?auto_92131 ) ) ( not ( = ?auto_92129 ?auto_92135 ) ) ( not ( = ?auto_92129 ?auto_92131 ) ) ( not ( = ?auto_92132 ?auto_92135 ) ) ( not ( = ?auto_92132 ?auto_92131 ) ) ( not ( = ?auto_92135 ?auto_92131 ) ) ( ON ?auto_92135 ?auto_92132 ) ( not ( = ?auto_92134 ?auto_92133 ) ) ( not ( = ?auto_92134 ?auto_92130 ) ) ( not ( = ?auto_92134 ?auto_92131 ) ) ( not ( = ?auto_92133 ?auto_92130 ) ) ( not ( = ?auto_92133 ?auto_92131 ) ) ( not ( = ?auto_92130 ?auto_92131 ) ) ( not ( = ?auto_92128 ?auto_92130 ) ) ( not ( = ?auto_92128 ?auto_92134 ) ) ( not ( = ?auto_92128 ?auto_92133 ) ) ( not ( = ?auto_92129 ?auto_92130 ) ) ( not ( = ?auto_92129 ?auto_92134 ) ) ( not ( = ?auto_92129 ?auto_92133 ) ) ( not ( = ?auto_92132 ?auto_92130 ) ) ( not ( = ?auto_92132 ?auto_92134 ) ) ( not ( = ?auto_92132 ?auto_92133 ) ) ( not ( = ?auto_92135 ?auto_92130 ) ) ( not ( = ?auto_92135 ?auto_92134 ) ) ( not ( = ?auto_92135 ?auto_92133 ) ) ( ON ?auto_92131 ?auto_92135 ) ( ON ?auto_92130 ?auto_92131 ) ( ON ?auto_92133 ?auto_92130 ) ( CLEAR ?auto_92133 ) ( HOLDING ?auto_92134 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92134 )
      ( MAKE-2PILE ?auto_92128 ?auto_92129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92136 - BLOCK
      ?auto_92137 - BLOCK
    )
    :vars
    (
      ?auto_92140 - BLOCK
      ?auto_92141 - BLOCK
      ?auto_92138 - BLOCK
      ?auto_92143 - BLOCK
      ?auto_92139 - BLOCK
      ?auto_92142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92140 ?auto_92137 ) ( ON-TABLE ?auto_92136 ) ( ON ?auto_92137 ?auto_92136 ) ( not ( = ?auto_92136 ?auto_92137 ) ) ( not ( = ?auto_92136 ?auto_92140 ) ) ( not ( = ?auto_92137 ?auto_92140 ) ) ( not ( = ?auto_92136 ?auto_92141 ) ) ( not ( = ?auto_92136 ?auto_92138 ) ) ( not ( = ?auto_92137 ?auto_92141 ) ) ( not ( = ?auto_92137 ?auto_92138 ) ) ( not ( = ?auto_92140 ?auto_92141 ) ) ( not ( = ?auto_92140 ?auto_92138 ) ) ( not ( = ?auto_92141 ?auto_92138 ) ) ( ON ?auto_92141 ?auto_92140 ) ( not ( = ?auto_92143 ?auto_92139 ) ) ( not ( = ?auto_92143 ?auto_92142 ) ) ( not ( = ?auto_92143 ?auto_92138 ) ) ( not ( = ?auto_92139 ?auto_92142 ) ) ( not ( = ?auto_92139 ?auto_92138 ) ) ( not ( = ?auto_92142 ?auto_92138 ) ) ( not ( = ?auto_92136 ?auto_92142 ) ) ( not ( = ?auto_92136 ?auto_92143 ) ) ( not ( = ?auto_92136 ?auto_92139 ) ) ( not ( = ?auto_92137 ?auto_92142 ) ) ( not ( = ?auto_92137 ?auto_92143 ) ) ( not ( = ?auto_92137 ?auto_92139 ) ) ( not ( = ?auto_92140 ?auto_92142 ) ) ( not ( = ?auto_92140 ?auto_92143 ) ) ( not ( = ?auto_92140 ?auto_92139 ) ) ( not ( = ?auto_92141 ?auto_92142 ) ) ( not ( = ?auto_92141 ?auto_92143 ) ) ( not ( = ?auto_92141 ?auto_92139 ) ) ( ON ?auto_92138 ?auto_92141 ) ( ON ?auto_92142 ?auto_92138 ) ( ON ?auto_92139 ?auto_92142 ) ( ON ?auto_92143 ?auto_92139 ) ( CLEAR ?auto_92143 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92136 ?auto_92137 ?auto_92140 ?auto_92141 ?auto_92138 ?auto_92142 ?auto_92139 )
      ( MAKE-2PILE ?auto_92136 ?auto_92137 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92150 - BLOCK
      ?auto_92151 - BLOCK
      ?auto_92152 - BLOCK
      ?auto_92153 - BLOCK
      ?auto_92154 - BLOCK
      ?auto_92155 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92155 ) ( CLEAR ?auto_92154 ) ( ON-TABLE ?auto_92150 ) ( ON ?auto_92151 ?auto_92150 ) ( ON ?auto_92152 ?auto_92151 ) ( ON ?auto_92153 ?auto_92152 ) ( ON ?auto_92154 ?auto_92153 ) ( not ( = ?auto_92150 ?auto_92151 ) ) ( not ( = ?auto_92150 ?auto_92152 ) ) ( not ( = ?auto_92150 ?auto_92153 ) ) ( not ( = ?auto_92150 ?auto_92154 ) ) ( not ( = ?auto_92150 ?auto_92155 ) ) ( not ( = ?auto_92151 ?auto_92152 ) ) ( not ( = ?auto_92151 ?auto_92153 ) ) ( not ( = ?auto_92151 ?auto_92154 ) ) ( not ( = ?auto_92151 ?auto_92155 ) ) ( not ( = ?auto_92152 ?auto_92153 ) ) ( not ( = ?auto_92152 ?auto_92154 ) ) ( not ( = ?auto_92152 ?auto_92155 ) ) ( not ( = ?auto_92153 ?auto_92154 ) ) ( not ( = ?auto_92153 ?auto_92155 ) ) ( not ( = ?auto_92154 ?auto_92155 ) ) )
    :subtasks
    ( ( !STACK ?auto_92155 ?auto_92154 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92156 - BLOCK
      ?auto_92157 - BLOCK
      ?auto_92158 - BLOCK
      ?auto_92159 - BLOCK
      ?auto_92160 - BLOCK
      ?auto_92161 - BLOCK
    )
    :vars
    (
      ?auto_92162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92160 ) ( ON-TABLE ?auto_92156 ) ( ON ?auto_92157 ?auto_92156 ) ( ON ?auto_92158 ?auto_92157 ) ( ON ?auto_92159 ?auto_92158 ) ( ON ?auto_92160 ?auto_92159 ) ( not ( = ?auto_92156 ?auto_92157 ) ) ( not ( = ?auto_92156 ?auto_92158 ) ) ( not ( = ?auto_92156 ?auto_92159 ) ) ( not ( = ?auto_92156 ?auto_92160 ) ) ( not ( = ?auto_92156 ?auto_92161 ) ) ( not ( = ?auto_92157 ?auto_92158 ) ) ( not ( = ?auto_92157 ?auto_92159 ) ) ( not ( = ?auto_92157 ?auto_92160 ) ) ( not ( = ?auto_92157 ?auto_92161 ) ) ( not ( = ?auto_92158 ?auto_92159 ) ) ( not ( = ?auto_92158 ?auto_92160 ) ) ( not ( = ?auto_92158 ?auto_92161 ) ) ( not ( = ?auto_92159 ?auto_92160 ) ) ( not ( = ?auto_92159 ?auto_92161 ) ) ( not ( = ?auto_92160 ?auto_92161 ) ) ( ON ?auto_92161 ?auto_92162 ) ( CLEAR ?auto_92161 ) ( HAND-EMPTY ) ( not ( = ?auto_92156 ?auto_92162 ) ) ( not ( = ?auto_92157 ?auto_92162 ) ) ( not ( = ?auto_92158 ?auto_92162 ) ) ( not ( = ?auto_92159 ?auto_92162 ) ) ( not ( = ?auto_92160 ?auto_92162 ) ) ( not ( = ?auto_92161 ?auto_92162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92161 ?auto_92162 )
      ( MAKE-6PILE ?auto_92156 ?auto_92157 ?auto_92158 ?auto_92159 ?auto_92160 ?auto_92161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92163 - BLOCK
      ?auto_92164 - BLOCK
      ?auto_92165 - BLOCK
      ?auto_92166 - BLOCK
      ?auto_92167 - BLOCK
      ?auto_92168 - BLOCK
    )
    :vars
    (
      ?auto_92169 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92163 ) ( ON ?auto_92164 ?auto_92163 ) ( ON ?auto_92165 ?auto_92164 ) ( ON ?auto_92166 ?auto_92165 ) ( not ( = ?auto_92163 ?auto_92164 ) ) ( not ( = ?auto_92163 ?auto_92165 ) ) ( not ( = ?auto_92163 ?auto_92166 ) ) ( not ( = ?auto_92163 ?auto_92167 ) ) ( not ( = ?auto_92163 ?auto_92168 ) ) ( not ( = ?auto_92164 ?auto_92165 ) ) ( not ( = ?auto_92164 ?auto_92166 ) ) ( not ( = ?auto_92164 ?auto_92167 ) ) ( not ( = ?auto_92164 ?auto_92168 ) ) ( not ( = ?auto_92165 ?auto_92166 ) ) ( not ( = ?auto_92165 ?auto_92167 ) ) ( not ( = ?auto_92165 ?auto_92168 ) ) ( not ( = ?auto_92166 ?auto_92167 ) ) ( not ( = ?auto_92166 ?auto_92168 ) ) ( not ( = ?auto_92167 ?auto_92168 ) ) ( ON ?auto_92168 ?auto_92169 ) ( CLEAR ?auto_92168 ) ( not ( = ?auto_92163 ?auto_92169 ) ) ( not ( = ?auto_92164 ?auto_92169 ) ) ( not ( = ?auto_92165 ?auto_92169 ) ) ( not ( = ?auto_92166 ?auto_92169 ) ) ( not ( = ?auto_92167 ?auto_92169 ) ) ( not ( = ?auto_92168 ?auto_92169 ) ) ( HOLDING ?auto_92167 ) ( CLEAR ?auto_92166 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92163 ?auto_92164 ?auto_92165 ?auto_92166 ?auto_92167 )
      ( MAKE-6PILE ?auto_92163 ?auto_92164 ?auto_92165 ?auto_92166 ?auto_92167 ?auto_92168 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92170 - BLOCK
      ?auto_92171 - BLOCK
      ?auto_92172 - BLOCK
      ?auto_92173 - BLOCK
      ?auto_92174 - BLOCK
      ?auto_92175 - BLOCK
    )
    :vars
    (
      ?auto_92176 - BLOCK
      ?auto_92177 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92170 ) ( ON ?auto_92171 ?auto_92170 ) ( ON ?auto_92172 ?auto_92171 ) ( ON ?auto_92173 ?auto_92172 ) ( not ( = ?auto_92170 ?auto_92171 ) ) ( not ( = ?auto_92170 ?auto_92172 ) ) ( not ( = ?auto_92170 ?auto_92173 ) ) ( not ( = ?auto_92170 ?auto_92174 ) ) ( not ( = ?auto_92170 ?auto_92175 ) ) ( not ( = ?auto_92171 ?auto_92172 ) ) ( not ( = ?auto_92171 ?auto_92173 ) ) ( not ( = ?auto_92171 ?auto_92174 ) ) ( not ( = ?auto_92171 ?auto_92175 ) ) ( not ( = ?auto_92172 ?auto_92173 ) ) ( not ( = ?auto_92172 ?auto_92174 ) ) ( not ( = ?auto_92172 ?auto_92175 ) ) ( not ( = ?auto_92173 ?auto_92174 ) ) ( not ( = ?auto_92173 ?auto_92175 ) ) ( not ( = ?auto_92174 ?auto_92175 ) ) ( ON ?auto_92175 ?auto_92176 ) ( not ( = ?auto_92170 ?auto_92176 ) ) ( not ( = ?auto_92171 ?auto_92176 ) ) ( not ( = ?auto_92172 ?auto_92176 ) ) ( not ( = ?auto_92173 ?auto_92176 ) ) ( not ( = ?auto_92174 ?auto_92176 ) ) ( not ( = ?auto_92175 ?auto_92176 ) ) ( CLEAR ?auto_92173 ) ( ON ?auto_92174 ?auto_92175 ) ( CLEAR ?auto_92174 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92177 ) ( ON ?auto_92176 ?auto_92177 ) ( not ( = ?auto_92177 ?auto_92176 ) ) ( not ( = ?auto_92177 ?auto_92175 ) ) ( not ( = ?auto_92177 ?auto_92174 ) ) ( not ( = ?auto_92170 ?auto_92177 ) ) ( not ( = ?auto_92171 ?auto_92177 ) ) ( not ( = ?auto_92172 ?auto_92177 ) ) ( not ( = ?auto_92173 ?auto_92177 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92177 ?auto_92176 ?auto_92175 )
      ( MAKE-6PILE ?auto_92170 ?auto_92171 ?auto_92172 ?auto_92173 ?auto_92174 ?auto_92175 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92178 - BLOCK
      ?auto_92179 - BLOCK
      ?auto_92180 - BLOCK
      ?auto_92181 - BLOCK
      ?auto_92182 - BLOCK
      ?auto_92183 - BLOCK
    )
    :vars
    (
      ?auto_92185 - BLOCK
      ?auto_92184 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92178 ) ( ON ?auto_92179 ?auto_92178 ) ( ON ?auto_92180 ?auto_92179 ) ( not ( = ?auto_92178 ?auto_92179 ) ) ( not ( = ?auto_92178 ?auto_92180 ) ) ( not ( = ?auto_92178 ?auto_92181 ) ) ( not ( = ?auto_92178 ?auto_92182 ) ) ( not ( = ?auto_92178 ?auto_92183 ) ) ( not ( = ?auto_92179 ?auto_92180 ) ) ( not ( = ?auto_92179 ?auto_92181 ) ) ( not ( = ?auto_92179 ?auto_92182 ) ) ( not ( = ?auto_92179 ?auto_92183 ) ) ( not ( = ?auto_92180 ?auto_92181 ) ) ( not ( = ?auto_92180 ?auto_92182 ) ) ( not ( = ?auto_92180 ?auto_92183 ) ) ( not ( = ?auto_92181 ?auto_92182 ) ) ( not ( = ?auto_92181 ?auto_92183 ) ) ( not ( = ?auto_92182 ?auto_92183 ) ) ( ON ?auto_92183 ?auto_92185 ) ( not ( = ?auto_92178 ?auto_92185 ) ) ( not ( = ?auto_92179 ?auto_92185 ) ) ( not ( = ?auto_92180 ?auto_92185 ) ) ( not ( = ?auto_92181 ?auto_92185 ) ) ( not ( = ?auto_92182 ?auto_92185 ) ) ( not ( = ?auto_92183 ?auto_92185 ) ) ( ON ?auto_92182 ?auto_92183 ) ( CLEAR ?auto_92182 ) ( ON-TABLE ?auto_92184 ) ( ON ?auto_92185 ?auto_92184 ) ( not ( = ?auto_92184 ?auto_92185 ) ) ( not ( = ?auto_92184 ?auto_92183 ) ) ( not ( = ?auto_92184 ?auto_92182 ) ) ( not ( = ?auto_92178 ?auto_92184 ) ) ( not ( = ?auto_92179 ?auto_92184 ) ) ( not ( = ?auto_92180 ?auto_92184 ) ) ( not ( = ?auto_92181 ?auto_92184 ) ) ( HOLDING ?auto_92181 ) ( CLEAR ?auto_92180 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92178 ?auto_92179 ?auto_92180 ?auto_92181 )
      ( MAKE-6PILE ?auto_92178 ?auto_92179 ?auto_92180 ?auto_92181 ?auto_92182 ?auto_92183 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92186 - BLOCK
      ?auto_92187 - BLOCK
      ?auto_92188 - BLOCK
      ?auto_92189 - BLOCK
      ?auto_92190 - BLOCK
      ?auto_92191 - BLOCK
    )
    :vars
    (
      ?auto_92192 - BLOCK
      ?auto_92193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92186 ) ( ON ?auto_92187 ?auto_92186 ) ( ON ?auto_92188 ?auto_92187 ) ( not ( = ?auto_92186 ?auto_92187 ) ) ( not ( = ?auto_92186 ?auto_92188 ) ) ( not ( = ?auto_92186 ?auto_92189 ) ) ( not ( = ?auto_92186 ?auto_92190 ) ) ( not ( = ?auto_92186 ?auto_92191 ) ) ( not ( = ?auto_92187 ?auto_92188 ) ) ( not ( = ?auto_92187 ?auto_92189 ) ) ( not ( = ?auto_92187 ?auto_92190 ) ) ( not ( = ?auto_92187 ?auto_92191 ) ) ( not ( = ?auto_92188 ?auto_92189 ) ) ( not ( = ?auto_92188 ?auto_92190 ) ) ( not ( = ?auto_92188 ?auto_92191 ) ) ( not ( = ?auto_92189 ?auto_92190 ) ) ( not ( = ?auto_92189 ?auto_92191 ) ) ( not ( = ?auto_92190 ?auto_92191 ) ) ( ON ?auto_92191 ?auto_92192 ) ( not ( = ?auto_92186 ?auto_92192 ) ) ( not ( = ?auto_92187 ?auto_92192 ) ) ( not ( = ?auto_92188 ?auto_92192 ) ) ( not ( = ?auto_92189 ?auto_92192 ) ) ( not ( = ?auto_92190 ?auto_92192 ) ) ( not ( = ?auto_92191 ?auto_92192 ) ) ( ON ?auto_92190 ?auto_92191 ) ( ON-TABLE ?auto_92193 ) ( ON ?auto_92192 ?auto_92193 ) ( not ( = ?auto_92193 ?auto_92192 ) ) ( not ( = ?auto_92193 ?auto_92191 ) ) ( not ( = ?auto_92193 ?auto_92190 ) ) ( not ( = ?auto_92186 ?auto_92193 ) ) ( not ( = ?auto_92187 ?auto_92193 ) ) ( not ( = ?auto_92188 ?auto_92193 ) ) ( not ( = ?auto_92189 ?auto_92193 ) ) ( CLEAR ?auto_92188 ) ( ON ?auto_92189 ?auto_92190 ) ( CLEAR ?auto_92189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92193 ?auto_92192 ?auto_92191 ?auto_92190 )
      ( MAKE-6PILE ?auto_92186 ?auto_92187 ?auto_92188 ?auto_92189 ?auto_92190 ?auto_92191 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92194 - BLOCK
      ?auto_92195 - BLOCK
      ?auto_92196 - BLOCK
      ?auto_92197 - BLOCK
      ?auto_92198 - BLOCK
      ?auto_92199 - BLOCK
    )
    :vars
    (
      ?auto_92201 - BLOCK
      ?auto_92200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92194 ) ( ON ?auto_92195 ?auto_92194 ) ( not ( = ?auto_92194 ?auto_92195 ) ) ( not ( = ?auto_92194 ?auto_92196 ) ) ( not ( = ?auto_92194 ?auto_92197 ) ) ( not ( = ?auto_92194 ?auto_92198 ) ) ( not ( = ?auto_92194 ?auto_92199 ) ) ( not ( = ?auto_92195 ?auto_92196 ) ) ( not ( = ?auto_92195 ?auto_92197 ) ) ( not ( = ?auto_92195 ?auto_92198 ) ) ( not ( = ?auto_92195 ?auto_92199 ) ) ( not ( = ?auto_92196 ?auto_92197 ) ) ( not ( = ?auto_92196 ?auto_92198 ) ) ( not ( = ?auto_92196 ?auto_92199 ) ) ( not ( = ?auto_92197 ?auto_92198 ) ) ( not ( = ?auto_92197 ?auto_92199 ) ) ( not ( = ?auto_92198 ?auto_92199 ) ) ( ON ?auto_92199 ?auto_92201 ) ( not ( = ?auto_92194 ?auto_92201 ) ) ( not ( = ?auto_92195 ?auto_92201 ) ) ( not ( = ?auto_92196 ?auto_92201 ) ) ( not ( = ?auto_92197 ?auto_92201 ) ) ( not ( = ?auto_92198 ?auto_92201 ) ) ( not ( = ?auto_92199 ?auto_92201 ) ) ( ON ?auto_92198 ?auto_92199 ) ( ON-TABLE ?auto_92200 ) ( ON ?auto_92201 ?auto_92200 ) ( not ( = ?auto_92200 ?auto_92201 ) ) ( not ( = ?auto_92200 ?auto_92199 ) ) ( not ( = ?auto_92200 ?auto_92198 ) ) ( not ( = ?auto_92194 ?auto_92200 ) ) ( not ( = ?auto_92195 ?auto_92200 ) ) ( not ( = ?auto_92196 ?auto_92200 ) ) ( not ( = ?auto_92197 ?auto_92200 ) ) ( ON ?auto_92197 ?auto_92198 ) ( CLEAR ?auto_92197 ) ( HOLDING ?auto_92196 ) ( CLEAR ?auto_92195 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92194 ?auto_92195 ?auto_92196 )
      ( MAKE-6PILE ?auto_92194 ?auto_92195 ?auto_92196 ?auto_92197 ?auto_92198 ?auto_92199 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92202 - BLOCK
      ?auto_92203 - BLOCK
      ?auto_92204 - BLOCK
      ?auto_92205 - BLOCK
      ?auto_92206 - BLOCK
      ?auto_92207 - BLOCK
    )
    :vars
    (
      ?auto_92208 - BLOCK
      ?auto_92209 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92202 ) ( ON ?auto_92203 ?auto_92202 ) ( not ( = ?auto_92202 ?auto_92203 ) ) ( not ( = ?auto_92202 ?auto_92204 ) ) ( not ( = ?auto_92202 ?auto_92205 ) ) ( not ( = ?auto_92202 ?auto_92206 ) ) ( not ( = ?auto_92202 ?auto_92207 ) ) ( not ( = ?auto_92203 ?auto_92204 ) ) ( not ( = ?auto_92203 ?auto_92205 ) ) ( not ( = ?auto_92203 ?auto_92206 ) ) ( not ( = ?auto_92203 ?auto_92207 ) ) ( not ( = ?auto_92204 ?auto_92205 ) ) ( not ( = ?auto_92204 ?auto_92206 ) ) ( not ( = ?auto_92204 ?auto_92207 ) ) ( not ( = ?auto_92205 ?auto_92206 ) ) ( not ( = ?auto_92205 ?auto_92207 ) ) ( not ( = ?auto_92206 ?auto_92207 ) ) ( ON ?auto_92207 ?auto_92208 ) ( not ( = ?auto_92202 ?auto_92208 ) ) ( not ( = ?auto_92203 ?auto_92208 ) ) ( not ( = ?auto_92204 ?auto_92208 ) ) ( not ( = ?auto_92205 ?auto_92208 ) ) ( not ( = ?auto_92206 ?auto_92208 ) ) ( not ( = ?auto_92207 ?auto_92208 ) ) ( ON ?auto_92206 ?auto_92207 ) ( ON-TABLE ?auto_92209 ) ( ON ?auto_92208 ?auto_92209 ) ( not ( = ?auto_92209 ?auto_92208 ) ) ( not ( = ?auto_92209 ?auto_92207 ) ) ( not ( = ?auto_92209 ?auto_92206 ) ) ( not ( = ?auto_92202 ?auto_92209 ) ) ( not ( = ?auto_92203 ?auto_92209 ) ) ( not ( = ?auto_92204 ?auto_92209 ) ) ( not ( = ?auto_92205 ?auto_92209 ) ) ( ON ?auto_92205 ?auto_92206 ) ( CLEAR ?auto_92203 ) ( ON ?auto_92204 ?auto_92205 ) ( CLEAR ?auto_92204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92209 ?auto_92208 ?auto_92207 ?auto_92206 ?auto_92205 )
      ( MAKE-6PILE ?auto_92202 ?auto_92203 ?auto_92204 ?auto_92205 ?auto_92206 ?auto_92207 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92210 - BLOCK
      ?auto_92211 - BLOCK
      ?auto_92212 - BLOCK
      ?auto_92213 - BLOCK
      ?auto_92214 - BLOCK
      ?auto_92215 - BLOCK
    )
    :vars
    (
      ?auto_92216 - BLOCK
      ?auto_92217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92210 ) ( not ( = ?auto_92210 ?auto_92211 ) ) ( not ( = ?auto_92210 ?auto_92212 ) ) ( not ( = ?auto_92210 ?auto_92213 ) ) ( not ( = ?auto_92210 ?auto_92214 ) ) ( not ( = ?auto_92210 ?auto_92215 ) ) ( not ( = ?auto_92211 ?auto_92212 ) ) ( not ( = ?auto_92211 ?auto_92213 ) ) ( not ( = ?auto_92211 ?auto_92214 ) ) ( not ( = ?auto_92211 ?auto_92215 ) ) ( not ( = ?auto_92212 ?auto_92213 ) ) ( not ( = ?auto_92212 ?auto_92214 ) ) ( not ( = ?auto_92212 ?auto_92215 ) ) ( not ( = ?auto_92213 ?auto_92214 ) ) ( not ( = ?auto_92213 ?auto_92215 ) ) ( not ( = ?auto_92214 ?auto_92215 ) ) ( ON ?auto_92215 ?auto_92216 ) ( not ( = ?auto_92210 ?auto_92216 ) ) ( not ( = ?auto_92211 ?auto_92216 ) ) ( not ( = ?auto_92212 ?auto_92216 ) ) ( not ( = ?auto_92213 ?auto_92216 ) ) ( not ( = ?auto_92214 ?auto_92216 ) ) ( not ( = ?auto_92215 ?auto_92216 ) ) ( ON ?auto_92214 ?auto_92215 ) ( ON-TABLE ?auto_92217 ) ( ON ?auto_92216 ?auto_92217 ) ( not ( = ?auto_92217 ?auto_92216 ) ) ( not ( = ?auto_92217 ?auto_92215 ) ) ( not ( = ?auto_92217 ?auto_92214 ) ) ( not ( = ?auto_92210 ?auto_92217 ) ) ( not ( = ?auto_92211 ?auto_92217 ) ) ( not ( = ?auto_92212 ?auto_92217 ) ) ( not ( = ?auto_92213 ?auto_92217 ) ) ( ON ?auto_92213 ?auto_92214 ) ( ON ?auto_92212 ?auto_92213 ) ( CLEAR ?auto_92212 ) ( HOLDING ?auto_92211 ) ( CLEAR ?auto_92210 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92210 ?auto_92211 )
      ( MAKE-6PILE ?auto_92210 ?auto_92211 ?auto_92212 ?auto_92213 ?auto_92214 ?auto_92215 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92218 - BLOCK
      ?auto_92219 - BLOCK
      ?auto_92220 - BLOCK
      ?auto_92221 - BLOCK
      ?auto_92222 - BLOCK
      ?auto_92223 - BLOCK
    )
    :vars
    (
      ?auto_92225 - BLOCK
      ?auto_92224 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92218 ) ( not ( = ?auto_92218 ?auto_92219 ) ) ( not ( = ?auto_92218 ?auto_92220 ) ) ( not ( = ?auto_92218 ?auto_92221 ) ) ( not ( = ?auto_92218 ?auto_92222 ) ) ( not ( = ?auto_92218 ?auto_92223 ) ) ( not ( = ?auto_92219 ?auto_92220 ) ) ( not ( = ?auto_92219 ?auto_92221 ) ) ( not ( = ?auto_92219 ?auto_92222 ) ) ( not ( = ?auto_92219 ?auto_92223 ) ) ( not ( = ?auto_92220 ?auto_92221 ) ) ( not ( = ?auto_92220 ?auto_92222 ) ) ( not ( = ?auto_92220 ?auto_92223 ) ) ( not ( = ?auto_92221 ?auto_92222 ) ) ( not ( = ?auto_92221 ?auto_92223 ) ) ( not ( = ?auto_92222 ?auto_92223 ) ) ( ON ?auto_92223 ?auto_92225 ) ( not ( = ?auto_92218 ?auto_92225 ) ) ( not ( = ?auto_92219 ?auto_92225 ) ) ( not ( = ?auto_92220 ?auto_92225 ) ) ( not ( = ?auto_92221 ?auto_92225 ) ) ( not ( = ?auto_92222 ?auto_92225 ) ) ( not ( = ?auto_92223 ?auto_92225 ) ) ( ON ?auto_92222 ?auto_92223 ) ( ON-TABLE ?auto_92224 ) ( ON ?auto_92225 ?auto_92224 ) ( not ( = ?auto_92224 ?auto_92225 ) ) ( not ( = ?auto_92224 ?auto_92223 ) ) ( not ( = ?auto_92224 ?auto_92222 ) ) ( not ( = ?auto_92218 ?auto_92224 ) ) ( not ( = ?auto_92219 ?auto_92224 ) ) ( not ( = ?auto_92220 ?auto_92224 ) ) ( not ( = ?auto_92221 ?auto_92224 ) ) ( ON ?auto_92221 ?auto_92222 ) ( ON ?auto_92220 ?auto_92221 ) ( CLEAR ?auto_92218 ) ( ON ?auto_92219 ?auto_92220 ) ( CLEAR ?auto_92219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92224 ?auto_92225 ?auto_92223 ?auto_92222 ?auto_92221 ?auto_92220 )
      ( MAKE-6PILE ?auto_92218 ?auto_92219 ?auto_92220 ?auto_92221 ?auto_92222 ?auto_92223 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92226 - BLOCK
      ?auto_92227 - BLOCK
      ?auto_92228 - BLOCK
      ?auto_92229 - BLOCK
      ?auto_92230 - BLOCK
      ?auto_92231 - BLOCK
    )
    :vars
    (
      ?auto_92232 - BLOCK
      ?auto_92233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92226 ?auto_92227 ) ) ( not ( = ?auto_92226 ?auto_92228 ) ) ( not ( = ?auto_92226 ?auto_92229 ) ) ( not ( = ?auto_92226 ?auto_92230 ) ) ( not ( = ?auto_92226 ?auto_92231 ) ) ( not ( = ?auto_92227 ?auto_92228 ) ) ( not ( = ?auto_92227 ?auto_92229 ) ) ( not ( = ?auto_92227 ?auto_92230 ) ) ( not ( = ?auto_92227 ?auto_92231 ) ) ( not ( = ?auto_92228 ?auto_92229 ) ) ( not ( = ?auto_92228 ?auto_92230 ) ) ( not ( = ?auto_92228 ?auto_92231 ) ) ( not ( = ?auto_92229 ?auto_92230 ) ) ( not ( = ?auto_92229 ?auto_92231 ) ) ( not ( = ?auto_92230 ?auto_92231 ) ) ( ON ?auto_92231 ?auto_92232 ) ( not ( = ?auto_92226 ?auto_92232 ) ) ( not ( = ?auto_92227 ?auto_92232 ) ) ( not ( = ?auto_92228 ?auto_92232 ) ) ( not ( = ?auto_92229 ?auto_92232 ) ) ( not ( = ?auto_92230 ?auto_92232 ) ) ( not ( = ?auto_92231 ?auto_92232 ) ) ( ON ?auto_92230 ?auto_92231 ) ( ON-TABLE ?auto_92233 ) ( ON ?auto_92232 ?auto_92233 ) ( not ( = ?auto_92233 ?auto_92232 ) ) ( not ( = ?auto_92233 ?auto_92231 ) ) ( not ( = ?auto_92233 ?auto_92230 ) ) ( not ( = ?auto_92226 ?auto_92233 ) ) ( not ( = ?auto_92227 ?auto_92233 ) ) ( not ( = ?auto_92228 ?auto_92233 ) ) ( not ( = ?auto_92229 ?auto_92233 ) ) ( ON ?auto_92229 ?auto_92230 ) ( ON ?auto_92228 ?auto_92229 ) ( ON ?auto_92227 ?auto_92228 ) ( CLEAR ?auto_92227 ) ( HOLDING ?auto_92226 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92226 )
      ( MAKE-6PILE ?auto_92226 ?auto_92227 ?auto_92228 ?auto_92229 ?auto_92230 ?auto_92231 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_92234 - BLOCK
      ?auto_92235 - BLOCK
      ?auto_92236 - BLOCK
      ?auto_92237 - BLOCK
      ?auto_92238 - BLOCK
      ?auto_92239 - BLOCK
    )
    :vars
    (
      ?auto_92241 - BLOCK
      ?auto_92240 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92234 ?auto_92235 ) ) ( not ( = ?auto_92234 ?auto_92236 ) ) ( not ( = ?auto_92234 ?auto_92237 ) ) ( not ( = ?auto_92234 ?auto_92238 ) ) ( not ( = ?auto_92234 ?auto_92239 ) ) ( not ( = ?auto_92235 ?auto_92236 ) ) ( not ( = ?auto_92235 ?auto_92237 ) ) ( not ( = ?auto_92235 ?auto_92238 ) ) ( not ( = ?auto_92235 ?auto_92239 ) ) ( not ( = ?auto_92236 ?auto_92237 ) ) ( not ( = ?auto_92236 ?auto_92238 ) ) ( not ( = ?auto_92236 ?auto_92239 ) ) ( not ( = ?auto_92237 ?auto_92238 ) ) ( not ( = ?auto_92237 ?auto_92239 ) ) ( not ( = ?auto_92238 ?auto_92239 ) ) ( ON ?auto_92239 ?auto_92241 ) ( not ( = ?auto_92234 ?auto_92241 ) ) ( not ( = ?auto_92235 ?auto_92241 ) ) ( not ( = ?auto_92236 ?auto_92241 ) ) ( not ( = ?auto_92237 ?auto_92241 ) ) ( not ( = ?auto_92238 ?auto_92241 ) ) ( not ( = ?auto_92239 ?auto_92241 ) ) ( ON ?auto_92238 ?auto_92239 ) ( ON-TABLE ?auto_92240 ) ( ON ?auto_92241 ?auto_92240 ) ( not ( = ?auto_92240 ?auto_92241 ) ) ( not ( = ?auto_92240 ?auto_92239 ) ) ( not ( = ?auto_92240 ?auto_92238 ) ) ( not ( = ?auto_92234 ?auto_92240 ) ) ( not ( = ?auto_92235 ?auto_92240 ) ) ( not ( = ?auto_92236 ?auto_92240 ) ) ( not ( = ?auto_92237 ?auto_92240 ) ) ( ON ?auto_92237 ?auto_92238 ) ( ON ?auto_92236 ?auto_92237 ) ( ON ?auto_92235 ?auto_92236 ) ( ON ?auto_92234 ?auto_92235 ) ( CLEAR ?auto_92234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92240 ?auto_92241 ?auto_92239 ?auto_92238 ?auto_92237 ?auto_92236 ?auto_92235 )
      ( MAKE-6PILE ?auto_92234 ?auto_92235 ?auto_92236 ?auto_92237 ?auto_92238 ?auto_92239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92243 - BLOCK
    )
    :vars
    (
      ?auto_92244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92244 ?auto_92243 ) ( CLEAR ?auto_92244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92243 ) ( not ( = ?auto_92243 ?auto_92244 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92244 ?auto_92243 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92245 - BLOCK
    )
    :vars
    (
      ?auto_92246 - BLOCK
      ?auto_92247 - BLOCK
      ?auto_92248 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92246 ?auto_92245 ) ( CLEAR ?auto_92246 ) ( ON-TABLE ?auto_92245 ) ( not ( = ?auto_92245 ?auto_92246 ) ) ( HOLDING ?auto_92247 ) ( CLEAR ?auto_92248 ) ( not ( = ?auto_92245 ?auto_92247 ) ) ( not ( = ?auto_92245 ?auto_92248 ) ) ( not ( = ?auto_92246 ?auto_92247 ) ) ( not ( = ?auto_92246 ?auto_92248 ) ) ( not ( = ?auto_92247 ?auto_92248 ) ) )
    :subtasks
    ( ( !STACK ?auto_92247 ?auto_92248 )
      ( MAKE-1PILE ?auto_92245 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92249 - BLOCK
    )
    :vars
    (
      ?auto_92250 - BLOCK
      ?auto_92251 - BLOCK
      ?auto_92252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92250 ?auto_92249 ) ( ON-TABLE ?auto_92249 ) ( not ( = ?auto_92249 ?auto_92250 ) ) ( CLEAR ?auto_92251 ) ( not ( = ?auto_92249 ?auto_92252 ) ) ( not ( = ?auto_92249 ?auto_92251 ) ) ( not ( = ?auto_92250 ?auto_92252 ) ) ( not ( = ?auto_92250 ?auto_92251 ) ) ( not ( = ?auto_92252 ?auto_92251 ) ) ( ON ?auto_92252 ?auto_92250 ) ( CLEAR ?auto_92252 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92249 ?auto_92250 )
      ( MAKE-1PILE ?auto_92249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92253 - BLOCK
    )
    :vars
    (
      ?auto_92256 - BLOCK
      ?auto_92255 - BLOCK
      ?auto_92254 - BLOCK
      ?auto_92259 - BLOCK
      ?auto_92257 - BLOCK
      ?auto_92258 - BLOCK
      ?auto_92260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92256 ?auto_92253 ) ( ON-TABLE ?auto_92253 ) ( not ( = ?auto_92253 ?auto_92256 ) ) ( not ( = ?auto_92253 ?auto_92255 ) ) ( not ( = ?auto_92253 ?auto_92254 ) ) ( not ( = ?auto_92256 ?auto_92255 ) ) ( not ( = ?auto_92256 ?auto_92254 ) ) ( not ( = ?auto_92255 ?auto_92254 ) ) ( ON ?auto_92255 ?auto_92256 ) ( CLEAR ?auto_92255 ) ( HOLDING ?auto_92254 ) ( CLEAR ?auto_92259 ) ( ON-TABLE ?auto_92257 ) ( ON ?auto_92258 ?auto_92257 ) ( ON ?auto_92260 ?auto_92258 ) ( ON ?auto_92259 ?auto_92260 ) ( not ( = ?auto_92257 ?auto_92258 ) ) ( not ( = ?auto_92257 ?auto_92260 ) ) ( not ( = ?auto_92257 ?auto_92259 ) ) ( not ( = ?auto_92257 ?auto_92254 ) ) ( not ( = ?auto_92258 ?auto_92260 ) ) ( not ( = ?auto_92258 ?auto_92259 ) ) ( not ( = ?auto_92258 ?auto_92254 ) ) ( not ( = ?auto_92260 ?auto_92259 ) ) ( not ( = ?auto_92260 ?auto_92254 ) ) ( not ( = ?auto_92259 ?auto_92254 ) ) ( not ( = ?auto_92253 ?auto_92259 ) ) ( not ( = ?auto_92253 ?auto_92257 ) ) ( not ( = ?auto_92253 ?auto_92258 ) ) ( not ( = ?auto_92253 ?auto_92260 ) ) ( not ( = ?auto_92256 ?auto_92259 ) ) ( not ( = ?auto_92256 ?auto_92257 ) ) ( not ( = ?auto_92256 ?auto_92258 ) ) ( not ( = ?auto_92256 ?auto_92260 ) ) ( not ( = ?auto_92255 ?auto_92259 ) ) ( not ( = ?auto_92255 ?auto_92257 ) ) ( not ( = ?auto_92255 ?auto_92258 ) ) ( not ( = ?auto_92255 ?auto_92260 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92257 ?auto_92258 ?auto_92260 ?auto_92259 ?auto_92254 )
      ( MAKE-1PILE ?auto_92253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92261 - BLOCK
    )
    :vars
    (
      ?auto_92264 - BLOCK
      ?auto_92262 - BLOCK
      ?auto_92268 - BLOCK
      ?auto_92266 - BLOCK
      ?auto_92267 - BLOCK
      ?auto_92263 - BLOCK
      ?auto_92265 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92264 ?auto_92261 ) ( ON-TABLE ?auto_92261 ) ( not ( = ?auto_92261 ?auto_92264 ) ) ( not ( = ?auto_92261 ?auto_92262 ) ) ( not ( = ?auto_92261 ?auto_92268 ) ) ( not ( = ?auto_92264 ?auto_92262 ) ) ( not ( = ?auto_92264 ?auto_92268 ) ) ( not ( = ?auto_92262 ?auto_92268 ) ) ( ON ?auto_92262 ?auto_92264 ) ( CLEAR ?auto_92266 ) ( ON-TABLE ?auto_92267 ) ( ON ?auto_92263 ?auto_92267 ) ( ON ?auto_92265 ?auto_92263 ) ( ON ?auto_92266 ?auto_92265 ) ( not ( = ?auto_92267 ?auto_92263 ) ) ( not ( = ?auto_92267 ?auto_92265 ) ) ( not ( = ?auto_92267 ?auto_92266 ) ) ( not ( = ?auto_92267 ?auto_92268 ) ) ( not ( = ?auto_92263 ?auto_92265 ) ) ( not ( = ?auto_92263 ?auto_92266 ) ) ( not ( = ?auto_92263 ?auto_92268 ) ) ( not ( = ?auto_92265 ?auto_92266 ) ) ( not ( = ?auto_92265 ?auto_92268 ) ) ( not ( = ?auto_92266 ?auto_92268 ) ) ( not ( = ?auto_92261 ?auto_92266 ) ) ( not ( = ?auto_92261 ?auto_92267 ) ) ( not ( = ?auto_92261 ?auto_92263 ) ) ( not ( = ?auto_92261 ?auto_92265 ) ) ( not ( = ?auto_92264 ?auto_92266 ) ) ( not ( = ?auto_92264 ?auto_92267 ) ) ( not ( = ?auto_92264 ?auto_92263 ) ) ( not ( = ?auto_92264 ?auto_92265 ) ) ( not ( = ?auto_92262 ?auto_92266 ) ) ( not ( = ?auto_92262 ?auto_92267 ) ) ( not ( = ?auto_92262 ?auto_92263 ) ) ( not ( = ?auto_92262 ?auto_92265 ) ) ( ON ?auto_92268 ?auto_92262 ) ( CLEAR ?auto_92268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92261 ?auto_92264 ?auto_92262 )
      ( MAKE-1PILE ?auto_92261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92269 - BLOCK
    )
    :vars
    (
      ?auto_92275 - BLOCK
      ?auto_92273 - BLOCK
      ?auto_92272 - BLOCK
      ?auto_92271 - BLOCK
      ?auto_92276 - BLOCK
      ?auto_92270 - BLOCK
      ?auto_92274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92275 ?auto_92269 ) ( ON-TABLE ?auto_92269 ) ( not ( = ?auto_92269 ?auto_92275 ) ) ( not ( = ?auto_92269 ?auto_92273 ) ) ( not ( = ?auto_92269 ?auto_92272 ) ) ( not ( = ?auto_92275 ?auto_92273 ) ) ( not ( = ?auto_92275 ?auto_92272 ) ) ( not ( = ?auto_92273 ?auto_92272 ) ) ( ON ?auto_92273 ?auto_92275 ) ( ON-TABLE ?auto_92271 ) ( ON ?auto_92276 ?auto_92271 ) ( ON ?auto_92270 ?auto_92276 ) ( not ( = ?auto_92271 ?auto_92276 ) ) ( not ( = ?auto_92271 ?auto_92270 ) ) ( not ( = ?auto_92271 ?auto_92274 ) ) ( not ( = ?auto_92271 ?auto_92272 ) ) ( not ( = ?auto_92276 ?auto_92270 ) ) ( not ( = ?auto_92276 ?auto_92274 ) ) ( not ( = ?auto_92276 ?auto_92272 ) ) ( not ( = ?auto_92270 ?auto_92274 ) ) ( not ( = ?auto_92270 ?auto_92272 ) ) ( not ( = ?auto_92274 ?auto_92272 ) ) ( not ( = ?auto_92269 ?auto_92274 ) ) ( not ( = ?auto_92269 ?auto_92271 ) ) ( not ( = ?auto_92269 ?auto_92276 ) ) ( not ( = ?auto_92269 ?auto_92270 ) ) ( not ( = ?auto_92275 ?auto_92274 ) ) ( not ( = ?auto_92275 ?auto_92271 ) ) ( not ( = ?auto_92275 ?auto_92276 ) ) ( not ( = ?auto_92275 ?auto_92270 ) ) ( not ( = ?auto_92273 ?auto_92274 ) ) ( not ( = ?auto_92273 ?auto_92271 ) ) ( not ( = ?auto_92273 ?auto_92276 ) ) ( not ( = ?auto_92273 ?auto_92270 ) ) ( ON ?auto_92272 ?auto_92273 ) ( CLEAR ?auto_92272 ) ( HOLDING ?auto_92274 ) ( CLEAR ?auto_92270 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92271 ?auto_92276 ?auto_92270 ?auto_92274 )
      ( MAKE-1PILE ?auto_92269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92277 - BLOCK
    )
    :vars
    (
      ?auto_92281 - BLOCK
      ?auto_92282 - BLOCK
      ?auto_92284 - BLOCK
      ?auto_92279 - BLOCK
      ?auto_92280 - BLOCK
      ?auto_92283 - BLOCK
      ?auto_92278 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92281 ?auto_92277 ) ( ON-TABLE ?auto_92277 ) ( not ( = ?auto_92277 ?auto_92281 ) ) ( not ( = ?auto_92277 ?auto_92282 ) ) ( not ( = ?auto_92277 ?auto_92284 ) ) ( not ( = ?auto_92281 ?auto_92282 ) ) ( not ( = ?auto_92281 ?auto_92284 ) ) ( not ( = ?auto_92282 ?auto_92284 ) ) ( ON ?auto_92282 ?auto_92281 ) ( ON-TABLE ?auto_92279 ) ( ON ?auto_92280 ?auto_92279 ) ( ON ?auto_92283 ?auto_92280 ) ( not ( = ?auto_92279 ?auto_92280 ) ) ( not ( = ?auto_92279 ?auto_92283 ) ) ( not ( = ?auto_92279 ?auto_92278 ) ) ( not ( = ?auto_92279 ?auto_92284 ) ) ( not ( = ?auto_92280 ?auto_92283 ) ) ( not ( = ?auto_92280 ?auto_92278 ) ) ( not ( = ?auto_92280 ?auto_92284 ) ) ( not ( = ?auto_92283 ?auto_92278 ) ) ( not ( = ?auto_92283 ?auto_92284 ) ) ( not ( = ?auto_92278 ?auto_92284 ) ) ( not ( = ?auto_92277 ?auto_92278 ) ) ( not ( = ?auto_92277 ?auto_92279 ) ) ( not ( = ?auto_92277 ?auto_92280 ) ) ( not ( = ?auto_92277 ?auto_92283 ) ) ( not ( = ?auto_92281 ?auto_92278 ) ) ( not ( = ?auto_92281 ?auto_92279 ) ) ( not ( = ?auto_92281 ?auto_92280 ) ) ( not ( = ?auto_92281 ?auto_92283 ) ) ( not ( = ?auto_92282 ?auto_92278 ) ) ( not ( = ?auto_92282 ?auto_92279 ) ) ( not ( = ?auto_92282 ?auto_92280 ) ) ( not ( = ?auto_92282 ?auto_92283 ) ) ( ON ?auto_92284 ?auto_92282 ) ( CLEAR ?auto_92283 ) ( ON ?auto_92278 ?auto_92284 ) ( CLEAR ?auto_92278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92277 ?auto_92281 ?auto_92282 ?auto_92284 )
      ( MAKE-1PILE ?auto_92277 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92285 - BLOCK
    )
    :vars
    (
      ?auto_92288 - BLOCK
      ?auto_92289 - BLOCK
      ?auto_92287 - BLOCK
      ?auto_92292 - BLOCK
      ?auto_92291 - BLOCK
      ?auto_92290 - BLOCK
      ?auto_92286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92288 ?auto_92285 ) ( ON-TABLE ?auto_92285 ) ( not ( = ?auto_92285 ?auto_92288 ) ) ( not ( = ?auto_92285 ?auto_92289 ) ) ( not ( = ?auto_92285 ?auto_92287 ) ) ( not ( = ?auto_92288 ?auto_92289 ) ) ( not ( = ?auto_92288 ?auto_92287 ) ) ( not ( = ?auto_92289 ?auto_92287 ) ) ( ON ?auto_92289 ?auto_92288 ) ( ON-TABLE ?auto_92292 ) ( ON ?auto_92291 ?auto_92292 ) ( not ( = ?auto_92292 ?auto_92291 ) ) ( not ( = ?auto_92292 ?auto_92290 ) ) ( not ( = ?auto_92292 ?auto_92286 ) ) ( not ( = ?auto_92292 ?auto_92287 ) ) ( not ( = ?auto_92291 ?auto_92290 ) ) ( not ( = ?auto_92291 ?auto_92286 ) ) ( not ( = ?auto_92291 ?auto_92287 ) ) ( not ( = ?auto_92290 ?auto_92286 ) ) ( not ( = ?auto_92290 ?auto_92287 ) ) ( not ( = ?auto_92286 ?auto_92287 ) ) ( not ( = ?auto_92285 ?auto_92286 ) ) ( not ( = ?auto_92285 ?auto_92292 ) ) ( not ( = ?auto_92285 ?auto_92291 ) ) ( not ( = ?auto_92285 ?auto_92290 ) ) ( not ( = ?auto_92288 ?auto_92286 ) ) ( not ( = ?auto_92288 ?auto_92292 ) ) ( not ( = ?auto_92288 ?auto_92291 ) ) ( not ( = ?auto_92288 ?auto_92290 ) ) ( not ( = ?auto_92289 ?auto_92286 ) ) ( not ( = ?auto_92289 ?auto_92292 ) ) ( not ( = ?auto_92289 ?auto_92291 ) ) ( not ( = ?auto_92289 ?auto_92290 ) ) ( ON ?auto_92287 ?auto_92289 ) ( ON ?auto_92286 ?auto_92287 ) ( CLEAR ?auto_92286 ) ( HOLDING ?auto_92290 ) ( CLEAR ?auto_92291 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92292 ?auto_92291 ?auto_92290 )
      ( MAKE-1PILE ?auto_92285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92293 - BLOCK
    )
    :vars
    (
      ?auto_92296 - BLOCK
      ?auto_92299 - BLOCK
      ?auto_92295 - BLOCK
      ?auto_92298 - BLOCK
      ?auto_92300 - BLOCK
      ?auto_92294 - BLOCK
      ?auto_92297 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92296 ?auto_92293 ) ( ON-TABLE ?auto_92293 ) ( not ( = ?auto_92293 ?auto_92296 ) ) ( not ( = ?auto_92293 ?auto_92299 ) ) ( not ( = ?auto_92293 ?auto_92295 ) ) ( not ( = ?auto_92296 ?auto_92299 ) ) ( not ( = ?auto_92296 ?auto_92295 ) ) ( not ( = ?auto_92299 ?auto_92295 ) ) ( ON ?auto_92299 ?auto_92296 ) ( ON-TABLE ?auto_92298 ) ( ON ?auto_92300 ?auto_92298 ) ( not ( = ?auto_92298 ?auto_92300 ) ) ( not ( = ?auto_92298 ?auto_92294 ) ) ( not ( = ?auto_92298 ?auto_92297 ) ) ( not ( = ?auto_92298 ?auto_92295 ) ) ( not ( = ?auto_92300 ?auto_92294 ) ) ( not ( = ?auto_92300 ?auto_92297 ) ) ( not ( = ?auto_92300 ?auto_92295 ) ) ( not ( = ?auto_92294 ?auto_92297 ) ) ( not ( = ?auto_92294 ?auto_92295 ) ) ( not ( = ?auto_92297 ?auto_92295 ) ) ( not ( = ?auto_92293 ?auto_92297 ) ) ( not ( = ?auto_92293 ?auto_92298 ) ) ( not ( = ?auto_92293 ?auto_92300 ) ) ( not ( = ?auto_92293 ?auto_92294 ) ) ( not ( = ?auto_92296 ?auto_92297 ) ) ( not ( = ?auto_92296 ?auto_92298 ) ) ( not ( = ?auto_92296 ?auto_92300 ) ) ( not ( = ?auto_92296 ?auto_92294 ) ) ( not ( = ?auto_92299 ?auto_92297 ) ) ( not ( = ?auto_92299 ?auto_92298 ) ) ( not ( = ?auto_92299 ?auto_92300 ) ) ( not ( = ?auto_92299 ?auto_92294 ) ) ( ON ?auto_92295 ?auto_92299 ) ( ON ?auto_92297 ?auto_92295 ) ( CLEAR ?auto_92300 ) ( ON ?auto_92294 ?auto_92297 ) ( CLEAR ?auto_92294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92293 ?auto_92296 ?auto_92299 ?auto_92295 ?auto_92297 )
      ( MAKE-1PILE ?auto_92293 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92301 - BLOCK
    )
    :vars
    (
      ?auto_92303 - BLOCK
      ?auto_92302 - BLOCK
      ?auto_92306 - BLOCK
      ?auto_92304 - BLOCK
      ?auto_92307 - BLOCK
      ?auto_92308 - BLOCK
      ?auto_92305 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92303 ?auto_92301 ) ( ON-TABLE ?auto_92301 ) ( not ( = ?auto_92301 ?auto_92303 ) ) ( not ( = ?auto_92301 ?auto_92302 ) ) ( not ( = ?auto_92301 ?auto_92306 ) ) ( not ( = ?auto_92303 ?auto_92302 ) ) ( not ( = ?auto_92303 ?auto_92306 ) ) ( not ( = ?auto_92302 ?auto_92306 ) ) ( ON ?auto_92302 ?auto_92303 ) ( ON-TABLE ?auto_92304 ) ( not ( = ?auto_92304 ?auto_92307 ) ) ( not ( = ?auto_92304 ?auto_92308 ) ) ( not ( = ?auto_92304 ?auto_92305 ) ) ( not ( = ?auto_92304 ?auto_92306 ) ) ( not ( = ?auto_92307 ?auto_92308 ) ) ( not ( = ?auto_92307 ?auto_92305 ) ) ( not ( = ?auto_92307 ?auto_92306 ) ) ( not ( = ?auto_92308 ?auto_92305 ) ) ( not ( = ?auto_92308 ?auto_92306 ) ) ( not ( = ?auto_92305 ?auto_92306 ) ) ( not ( = ?auto_92301 ?auto_92305 ) ) ( not ( = ?auto_92301 ?auto_92304 ) ) ( not ( = ?auto_92301 ?auto_92307 ) ) ( not ( = ?auto_92301 ?auto_92308 ) ) ( not ( = ?auto_92303 ?auto_92305 ) ) ( not ( = ?auto_92303 ?auto_92304 ) ) ( not ( = ?auto_92303 ?auto_92307 ) ) ( not ( = ?auto_92303 ?auto_92308 ) ) ( not ( = ?auto_92302 ?auto_92305 ) ) ( not ( = ?auto_92302 ?auto_92304 ) ) ( not ( = ?auto_92302 ?auto_92307 ) ) ( not ( = ?auto_92302 ?auto_92308 ) ) ( ON ?auto_92306 ?auto_92302 ) ( ON ?auto_92305 ?auto_92306 ) ( ON ?auto_92308 ?auto_92305 ) ( CLEAR ?auto_92308 ) ( HOLDING ?auto_92307 ) ( CLEAR ?auto_92304 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92304 ?auto_92307 )
      ( MAKE-1PILE ?auto_92301 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93715 - BLOCK
    )
    :vars
    (
      ?auto_93718 - BLOCK
      ?auto_93719 - BLOCK
      ?auto_93717 - BLOCK
      ?auto_93720 - BLOCK
      ?auto_93716 - BLOCK
      ?auto_93721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93718 ?auto_93715 ) ( ON-TABLE ?auto_93715 ) ( not ( = ?auto_93715 ?auto_93718 ) ) ( not ( = ?auto_93715 ?auto_93719 ) ) ( not ( = ?auto_93715 ?auto_93717 ) ) ( not ( = ?auto_93718 ?auto_93719 ) ) ( not ( = ?auto_93718 ?auto_93717 ) ) ( not ( = ?auto_93719 ?auto_93717 ) ) ( ON ?auto_93719 ?auto_93718 ) ( not ( = ?auto_93720 ?auto_93716 ) ) ( not ( = ?auto_93720 ?auto_93721 ) ) ( not ( = ?auto_93720 ?auto_93717 ) ) ( not ( = ?auto_93716 ?auto_93721 ) ) ( not ( = ?auto_93716 ?auto_93717 ) ) ( not ( = ?auto_93721 ?auto_93717 ) ) ( not ( = ?auto_93715 ?auto_93721 ) ) ( not ( = ?auto_93715 ?auto_93720 ) ) ( not ( = ?auto_93715 ?auto_93716 ) ) ( not ( = ?auto_93718 ?auto_93721 ) ) ( not ( = ?auto_93718 ?auto_93720 ) ) ( not ( = ?auto_93718 ?auto_93716 ) ) ( not ( = ?auto_93719 ?auto_93721 ) ) ( not ( = ?auto_93719 ?auto_93720 ) ) ( not ( = ?auto_93719 ?auto_93716 ) ) ( ON ?auto_93717 ?auto_93719 ) ( ON ?auto_93721 ?auto_93717 ) ( ON ?auto_93716 ?auto_93721 ) ( ON ?auto_93720 ?auto_93716 ) ( CLEAR ?auto_93720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93715 ?auto_93718 ?auto_93719 ?auto_93717 ?auto_93721 ?auto_93716 )
      ( MAKE-1PILE ?auto_93715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92317 - BLOCK
    )
    :vars
    (
      ?auto_92318 - BLOCK
      ?auto_92324 - BLOCK
      ?auto_92321 - BLOCK
      ?auto_92322 - BLOCK
      ?auto_92320 - BLOCK
      ?auto_92319 - BLOCK
      ?auto_92323 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92318 ?auto_92317 ) ( ON-TABLE ?auto_92317 ) ( not ( = ?auto_92317 ?auto_92318 ) ) ( not ( = ?auto_92317 ?auto_92324 ) ) ( not ( = ?auto_92317 ?auto_92321 ) ) ( not ( = ?auto_92318 ?auto_92324 ) ) ( not ( = ?auto_92318 ?auto_92321 ) ) ( not ( = ?auto_92324 ?auto_92321 ) ) ( ON ?auto_92324 ?auto_92318 ) ( not ( = ?auto_92322 ?auto_92320 ) ) ( not ( = ?auto_92322 ?auto_92319 ) ) ( not ( = ?auto_92322 ?auto_92323 ) ) ( not ( = ?auto_92322 ?auto_92321 ) ) ( not ( = ?auto_92320 ?auto_92319 ) ) ( not ( = ?auto_92320 ?auto_92323 ) ) ( not ( = ?auto_92320 ?auto_92321 ) ) ( not ( = ?auto_92319 ?auto_92323 ) ) ( not ( = ?auto_92319 ?auto_92321 ) ) ( not ( = ?auto_92323 ?auto_92321 ) ) ( not ( = ?auto_92317 ?auto_92323 ) ) ( not ( = ?auto_92317 ?auto_92322 ) ) ( not ( = ?auto_92317 ?auto_92320 ) ) ( not ( = ?auto_92317 ?auto_92319 ) ) ( not ( = ?auto_92318 ?auto_92323 ) ) ( not ( = ?auto_92318 ?auto_92322 ) ) ( not ( = ?auto_92318 ?auto_92320 ) ) ( not ( = ?auto_92318 ?auto_92319 ) ) ( not ( = ?auto_92324 ?auto_92323 ) ) ( not ( = ?auto_92324 ?auto_92322 ) ) ( not ( = ?auto_92324 ?auto_92320 ) ) ( not ( = ?auto_92324 ?auto_92319 ) ) ( ON ?auto_92321 ?auto_92324 ) ( ON ?auto_92323 ?auto_92321 ) ( ON ?auto_92319 ?auto_92323 ) ( ON ?auto_92320 ?auto_92319 ) ( CLEAR ?auto_92320 ) ( HOLDING ?auto_92322 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92322 )
      ( MAKE-1PILE ?auto_92317 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92325 - BLOCK
    )
    :vars
    (
      ?auto_92332 - BLOCK
      ?auto_92331 - BLOCK
      ?auto_92328 - BLOCK
      ?auto_92326 - BLOCK
      ?auto_92329 - BLOCK
      ?auto_92330 - BLOCK
      ?auto_92327 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92332 ?auto_92325 ) ( ON-TABLE ?auto_92325 ) ( not ( = ?auto_92325 ?auto_92332 ) ) ( not ( = ?auto_92325 ?auto_92331 ) ) ( not ( = ?auto_92325 ?auto_92328 ) ) ( not ( = ?auto_92332 ?auto_92331 ) ) ( not ( = ?auto_92332 ?auto_92328 ) ) ( not ( = ?auto_92331 ?auto_92328 ) ) ( ON ?auto_92331 ?auto_92332 ) ( not ( = ?auto_92326 ?auto_92329 ) ) ( not ( = ?auto_92326 ?auto_92330 ) ) ( not ( = ?auto_92326 ?auto_92327 ) ) ( not ( = ?auto_92326 ?auto_92328 ) ) ( not ( = ?auto_92329 ?auto_92330 ) ) ( not ( = ?auto_92329 ?auto_92327 ) ) ( not ( = ?auto_92329 ?auto_92328 ) ) ( not ( = ?auto_92330 ?auto_92327 ) ) ( not ( = ?auto_92330 ?auto_92328 ) ) ( not ( = ?auto_92327 ?auto_92328 ) ) ( not ( = ?auto_92325 ?auto_92327 ) ) ( not ( = ?auto_92325 ?auto_92326 ) ) ( not ( = ?auto_92325 ?auto_92329 ) ) ( not ( = ?auto_92325 ?auto_92330 ) ) ( not ( = ?auto_92332 ?auto_92327 ) ) ( not ( = ?auto_92332 ?auto_92326 ) ) ( not ( = ?auto_92332 ?auto_92329 ) ) ( not ( = ?auto_92332 ?auto_92330 ) ) ( not ( = ?auto_92331 ?auto_92327 ) ) ( not ( = ?auto_92331 ?auto_92326 ) ) ( not ( = ?auto_92331 ?auto_92329 ) ) ( not ( = ?auto_92331 ?auto_92330 ) ) ( ON ?auto_92328 ?auto_92331 ) ( ON ?auto_92327 ?auto_92328 ) ( ON ?auto_92330 ?auto_92327 ) ( ON ?auto_92329 ?auto_92330 ) ( ON ?auto_92326 ?auto_92329 ) ( CLEAR ?auto_92326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92325 ?auto_92332 ?auto_92331 ?auto_92328 ?auto_92327 ?auto_92330 ?auto_92329 )
      ( MAKE-1PILE ?auto_92325 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92340 - BLOCK
      ?auto_92341 - BLOCK
      ?auto_92342 - BLOCK
      ?auto_92343 - BLOCK
      ?auto_92344 - BLOCK
      ?auto_92345 - BLOCK
      ?auto_92346 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_92346 ) ( CLEAR ?auto_92345 ) ( ON-TABLE ?auto_92340 ) ( ON ?auto_92341 ?auto_92340 ) ( ON ?auto_92342 ?auto_92341 ) ( ON ?auto_92343 ?auto_92342 ) ( ON ?auto_92344 ?auto_92343 ) ( ON ?auto_92345 ?auto_92344 ) ( not ( = ?auto_92340 ?auto_92341 ) ) ( not ( = ?auto_92340 ?auto_92342 ) ) ( not ( = ?auto_92340 ?auto_92343 ) ) ( not ( = ?auto_92340 ?auto_92344 ) ) ( not ( = ?auto_92340 ?auto_92345 ) ) ( not ( = ?auto_92340 ?auto_92346 ) ) ( not ( = ?auto_92341 ?auto_92342 ) ) ( not ( = ?auto_92341 ?auto_92343 ) ) ( not ( = ?auto_92341 ?auto_92344 ) ) ( not ( = ?auto_92341 ?auto_92345 ) ) ( not ( = ?auto_92341 ?auto_92346 ) ) ( not ( = ?auto_92342 ?auto_92343 ) ) ( not ( = ?auto_92342 ?auto_92344 ) ) ( not ( = ?auto_92342 ?auto_92345 ) ) ( not ( = ?auto_92342 ?auto_92346 ) ) ( not ( = ?auto_92343 ?auto_92344 ) ) ( not ( = ?auto_92343 ?auto_92345 ) ) ( not ( = ?auto_92343 ?auto_92346 ) ) ( not ( = ?auto_92344 ?auto_92345 ) ) ( not ( = ?auto_92344 ?auto_92346 ) ) ( not ( = ?auto_92345 ?auto_92346 ) ) )
    :subtasks
    ( ( !STACK ?auto_92346 ?auto_92345 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92347 - BLOCK
      ?auto_92348 - BLOCK
      ?auto_92349 - BLOCK
      ?auto_92350 - BLOCK
      ?auto_92351 - BLOCK
      ?auto_92352 - BLOCK
      ?auto_92353 - BLOCK
    )
    :vars
    (
      ?auto_92354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_92352 ) ( ON-TABLE ?auto_92347 ) ( ON ?auto_92348 ?auto_92347 ) ( ON ?auto_92349 ?auto_92348 ) ( ON ?auto_92350 ?auto_92349 ) ( ON ?auto_92351 ?auto_92350 ) ( ON ?auto_92352 ?auto_92351 ) ( not ( = ?auto_92347 ?auto_92348 ) ) ( not ( = ?auto_92347 ?auto_92349 ) ) ( not ( = ?auto_92347 ?auto_92350 ) ) ( not ( = ?auto_92347 ?auto_92351 ) ) ( not ( = ?auto_92347 ?auto_92352 ) ) ( not ( = ?auto_92347 ?auto_92353 ) ) ( not ( = ?auto_92348 ?auto_92349 ) ) ( not ( = ?auto_92348 ?auto_92350 ) ) ( not ( = ?auto_92348 ?auto_92351 ) ) ( not ( = ?auto_92348 ?auto_92352 ) ) ( not ( = ?auto_92348 ?auto_92353 ) ) ( not ( = ?auto_92349 ?auto_92350 ) ) ( not ( = ?auto_92349 ?auto_92351 ) ) ( not ( = ?auto_92349 ?auto_92352 ) ) ( not ( = ?auto_92349 ?auto_92353 ) ) ( not ( = ?auto_92350 ?auto_92351 ) ) ( not ( = ?auto_92350 ?auto_92352 ) ) ( not ( = ?auto_92350 ?auto_92353 ) ) ( not ( = ?auto_92351 ?auto_92352 ) ) ( not ( = ?auto_92351 ?auto_92353 ) ) ( not ( = ?auto_92352 ?auto_92353 ) ) ( ON ?auto_92353 ?auto_92354 ) ( CLEAR ?auto_92353 ) ( HAND-EMPTY ) ( not ( = ?auto_92347 ?auto_92354 ) ) ( not ( = ?auto_92348 ?auto_92354 ) ) ( not ( = ?auto_92349 ?auto_92354 ) ) ( not ( = ?auto_92350 ?auto_92354 ) ) ( not ( = ?auto_92351 ?auto_92354 ) ) ( not ( = ?auto_92352 ?auto_92354 ) ) ( not ( = ?auto_92353 ?auto_92354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92353 ?auto_92354 )
      ( MAKE-7PILE ?auto_92347 ?auto_92348 ?auto_92349 ?auto_92350 ?auto_92351 ?auto_92352 ?auto_92353 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92355 - BLOCK
      ?auto_92356 - BLOCK
      ?auto_92357 - BLOCK
      ?auto_92358 - BLOCK
      ?auto_92359 - BLOCK
      ?auto_92360 - BLOCK
      ?auto_92361 - BLOCK
    )
    :vars
    (
      ?auto_92362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92355 ) ( ON ?auto_92356 ?auto_92355 ) ( ON ?auto_92357 ?auto_92356 ) ( ON ?auto_92358 ?auto_92357 ) ( ON ?auto_92359 ?auto_92358 ) ( not ( = ?auto_92355 ?auto_92356 ) ) ( not ( = ?auto_92355 ?auto_92357 ) ) ( not ( = ?auto_92355 ?auto_92358 ) ) ( not ( = ?auto_92355 ?auto_92359 ) ) ( not ( = ?auto_92355 ?auto_92360 ) ) ( not ( = ?auto_92355 ?auto_92361 ) ) ( not ( = ?auto_92356 ?auto_92357 ) ) ( not ( = ?auto_92356 ?auto_92358 ) ) ( not ( = ?auto_92356 ?auto_92359 ) ) ( not ( = ?auto_92356 ?auto_92360 ) ) ( not ( = ?auto_92356 ?auto_92361 ) ) ( not ( = ?auto_92357 ?auto_92358 ) ) ( not ( = ?auto_92357 ?auto_92359 ) ) ( not ( = ?auto_92357 ?auto_92360 ) ) ( not ( = ?auto_92357 ?auto_92361 ) ) ( not ( = ?auto_92358 ?auto_92359 ) ) ( not ( = ?auto_92358 ?auto_92360 ) ) ( not ( = ?auto_92358 ?auto_92361 ) ) ( not ( = ?auto_92359 ?auto_92360 ) ) ( not ( = ?auto_92359 ?auto_92361 ) ) ( not ( = ?auto_92360 ?auto_92361 ) ) ( ON ?auto_92361 ?auto_92362 ) ( CLEAR ?auto_92361 ) ( not ( = ?auto_92355 ?auto_92362 ) ) ( not ( = ?auto_92356 ?auto_92362 ) ) ( not ( = ?auto_92357 ?auto_92362 ) ) ( not ( = ?auto_92358 ?auto_92362 ) ) ( not ( = ?auto_92359 ?auto_92362 ) ) ( not ( = ?auto_92360 ?auto_92362 ) ) ( not ( = ?auto_92361 ?auto_92362 ) ) ( HOLDING ?auto_92360 ) ( CLEAR ?auto_92359 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92355 ?auto_92356 ?auto_92357 ?auto_92358 ?auto_92359 ?auto_92360 )
      ( MAKE-7PILE ?auto_92355 ?auto_92356 ?auto_92357 ?auto_92358 ?auto_92359 ?auto_92360 ?auto_92361 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92363 - BLOCK
      ?auto_92364 - BLOCK
      ?auto_92365 - BLOCK
      ?auto_92366 - BLOCK
      ?auto_92367 - BLOCK
      ?auto_92368 - BLOCK
      ?auto_92369 - BLOCK
    )
    :vars
    (
      ?auto_92370 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92363 ) ( ON ?auto_92364 ?auto_92363 ) ( ON ?auto_92365 ?auto_92364 ) ( ON ?auto_92366 ?auto_92365 ) ( ON ?auto_92367 ?auto_92366 ) ( not ( = ?auto_92363 ?auto_92364 ) ) ( not ( = ?auto_92363 ?auto_92365 ) ) ( not ( = ?auto_92363 ?auto_92366 ) ) ( not ( = ?auto_92363 ?auto_92367 ) ) ( not ( = ?auto_92363 ?auto_92368 ) ) ( not ( = ?auto_92363 ?auto_92369 ) ) ( not ( = ?auto_92364 ?auto_92365 ) ) ( not ( = ?auto_92364 ?auto_92366 ) ) ( not ( = ?auto_92364 ?auto_92367 ) ) ( not ( = ?auto_92364 ?auto_92368 ) ) ( not ( = ?auto_92364 ?auto_92369 ) ) ( not ( = ?auto_92365 ?auto_92366 ) ) ( not ( = ?auto_92365 ?auto_92367 ) ) ( not ( = ?auto_92365 ?auto_92368 ) ) ( not ( = ?auto_92365 ?auto_92369 ) ) ( not ( = ?auto_92366 ?auto_92367 ) ) ( not ( = ?auto_92366 ?auto_92368 ) ) ( not ( = ?auto_92366 ?auto_92369 ) ) ( not ( = ?auto_92367 ?auto_92368 ) ) ( not ( = ?auto_92367 ?auto_92369 ) ) ( not ( = ?auto_92368 ?auto_92369 ) ) ( ON ?auto_92369 ?auto_92370 ) ( not ( = ?auto_92363 ?auto_92370 ) ) ( not ( = ?auto_92364 ?auto_92370 ) ) ( not ( = ?auto_92365 ?auto_92370 ) ) ( not ( = ?auto_92366 ?auto_92370 ) ) ( not ( = ?auto_92367 ?auto_92370 ) ) ( not ( = ?auto_92368 ?auto_92370 ) ) ( not ( = ?auto_92369 ?auto_92370 ) ) ( CLEAR ?auto_92367 ) ( ON ?auto_92368 ?auto_92369 ) ( CLEAR ?auto_92368 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92370 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92370 ?auto_92369 )
      ( MAKE-7PILE ?auto_92363 ?auto_92364 ?auto_92365 ?auto_92366 ?auto_92367 ?auto_92368 ?auto_92369 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92371 - BLOCK
      ?auto_92372 - BLOCK
      ?auto_92373 - BLOCK
      ?auto_92374 - BLOCK
      ?auto_92375 - BLOCK
      ?auto_92376 - BLOCK
      ?auto_92377 - BLOCK
    )
    :vars
    (
      ?auto_92378 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92371 ) ( ON ?auto_92372 ?auto_92371 ) ( ON ?auto_92373 ?auto_92372 ) ( ON ?auto_92374 ?auto_92373 ) ( not ( = ?auto_92371 ?auto_92372 ) ) ( not ( = ?auto_92371 ?auto_92373 ) ) ( not ( = ?auto_92371 ?auto_92374 ) ) ( not ( = ?auto_92371 ?auto_92375 ) ) ( not ( = ?auto_92371 ?auto_92376 ) ) ( not ( = ?auto_92371 ?auto_92377 ) ) ( not ( = ?auto_92372 ?auto_92373 ) ) ( not ( = ?auto_92372 ?auto_92374 ) ) ( not ( = ?auto_92372 ?auto_92375 ) ) ( not ( = ?auto_92372 ?auto_92376 ) ) ( not ( = ?auto_92372 ?auto_92377 ) ) ( not ( = ?auto_92373 ?auto_92374 ) ) ( not ( = ?auto_92373 ?auto_92375 ) ) ( not ( = ?auto_92373 ?auto_92376 ) ) ( not ( = ?auto_92373 ?auto_92377 ) ) ( not ( = ?auto_92374 ?auto_92375 ) ) ( not ( = ?auto_92374 ?auto_92376 ) ) ( not ( = ?auto_92374 ?auto_92377 ) ) ( not ( = ?auto_92375 ?auto_92376 ) ) ( not ( = ?auto_92375 ?auto_92377 ) ) ( not ( = ?auto_92376 ?auto_92377 ) ) ( ON ?auto_92377 ?auto_92378 ) ( not ( = ?auto_92371 ?auto_92378 ) ) ( not ( = ?auto_92372 ?auto_92378 ) ) ( not ( = ?auto_92373 ?auto_92378 ) ) ( not ( = ?auto_92374 ?auto_92378 ) ) ( not ( = ?auto_92375 ?auto_92378 ) ) ( not ( = ?auto_92376 ?auto_92378 ) ) ( not ( = ?auto_92377 ?auto_92378 ) ) ( ON ?auto_92376 ?auto_92377 ) ( CLEAR ?auto_92376 ) ( ON-TABLE ?auto_92378 ) ( HOLDING ?auto_92375 ) ( CLEAR ?auto_92374 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92371 ?auto_92372 ?auto_92373 ?auto_92374 ?auto_92375 )
      ( MAKE-7PILE ?auto_92371 ?auto_92372 ?auto_92373 ?auto_92374 ?auto_92375 ?auto_92376 ?auto_92377 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92379 - BLOCK
      ?auto_92380 - BLOCK
      ?auto_92381 - BLOCK
      ?auto_92382 - BLOCK
      ?auto_92383 - BLOCK
      ?auto_92384 - BLOCK
      ?auto_92385 - BLOCK
    )
    :vars
    (
      ?auto_92386 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92379 ) ( ON ?auto_92380 ?auto_92379 ) ( ON ?auto_92381 ?auto_92380 ) ( ON ?auto_92382 ?auto_92381 ) ( not ( = ?auto_92379 ?auto_92380 ) ) ( not ( = ?auto_92379 ?auto_92381 ) ) ( not ( = ?auto_92379 ?auto_92382 ) ) ( not ( = ?auto_92379 ?auto_92383 ) ) ( not ( = ?auto_92379 ?auto_92384 ) ) ( not ( = ?auto_92379 ?auto_92385 ) ) ( not ( = ?auto_92380 ?auto_92381 ) ) ( not ( = ?auto_92380 ?auto_92382 ) ) ( not ( = ?auto_92380 ?auto_92383 ) ) ( not ( = ?auto_92380 ?auto_92384 ) ) ( not ( = ?auto_92380 ?auto_92385 ) ) ( not ( = ?auto_92381 ?auto_92382 ) ) ( not ( = ?auto_92381 ?auto_92383 ) ) ( not ( = ?auto_92381 ?auto_92384 ) ) ( not ( = ?auto_92381 ?auto_92385 ) ) ( not ( = ?auto_92382 ?auto_92383 ) ) ( not ( = ?auto_92382 ?auto_92384 ) ) ( not ( = ?auto_92382 ?auto_92385 ) ) ( not ( = ?auto_92383 ?auto_92384 ) ) ( not ( = ?auto_92383 ?auto_92385 ) ) ( not ( = ?auto_92384 ?auto_92385 ) ) ( ON ?auto_92385 ?auto_92386 ) ( not ( = ?auto_92379 ?auto_92386 ) ) ( not ( = ?auto_92380 ?auto_92386 ) ) ( not ( = ?auto_92381 ?auto_92386 ) ) ( not ( = ?auto_92382 ?auto_92386 ) ) ( not ( = ?auto_92383 ?auto_92386 ) ) ( not ( = ?auto_92384 ?auto_92386 ) ) ( not ( = ?auto_92385 ?auto_92386 ) ) ( ON ?auto_92384 ?auto_92385 ) ( ON-TABLE ?auto_92386 ) ( CLEAR ?auto_92382 ) ( ON ?auto_92383 ?auto_92384 ) ( CLEAR ?auto_92383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92386 ?auto_92385 ?auto_92384 )
      ( MAKE-7PILE ?auto_92379 ?auto_92380 ?auto_92381 ?auto_92382 ?auto_92383 ?auto_92384 ?auto_92385 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92387 - BLOCK
      ?auto_92388 - BLOCK
      ?auto_92389 - BLOCK
      ?auto_92390 - BLOCK
      ?auto_92391 - BLOCK
      ?auto_92392 - BLOCK
      ?auto_92393 - BLOCK
    )
    :vars
    (
      ?auto_92394 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92387 ) ( ON ?auto_92388 ?auto_92387 ) ( ON ?auto_92389 ?auto_92388 ) ( not ( = ?auto_92387 ?auto_92388 ) ) ( not ( = ?auto_92387 ?auto_92389 ) ) ( not ( = ?auto_92387 ?auto_92390 ) ) ( not ( = ?auto_92387 ?auto_92391 ) ) ( not ( = ?auto_92387 ?auto_92392 ) ) ( not ( = ?auto_92387 ?auto_92393 ) ) ( not ( = ?auto_92388 ?auto_92389 ) ) ( not ( = ?auto_92388 ?auto_92390 ) ) ( not ( = ?auto_92388 ?auto_92391 ) ) ( not ( = ?auto_92388 ?auto_92392 ) ) ( not ( = ?auto_92388 ?auto_92393 ) ) ( not ( = ?auto_92389 ?auto_92390 ) ) ( not ( = ?auto_92389 ?auto_92391 ) ) ( not ( = ?auto_92389 ?auto_92392 ) ) ( not ( = ?auto_92389 ?auto_92393 ) ) ( not ( = ?auto_92390 ?auto_92391 ) ) ( not ( = ?auto_92390 ?auto_92392 ) ) ( not ( = ?auto_92390 ?auto_92393 ) ) ( not ( = ?auto_92391 ?auto_92392 ) ) ( not ( = ?auto_92391 ?auto_92393 ) ) ( not ( = ?auto_92392 ?auto_92393 ) ) ( ON ?auto_92393 ?auto_92394 ) ( not ( = ?auto_92387 ?auto_92394 ) ) ( not ( = ?auto_92388 ?auto_92394 ) ) ( not ( = ?auto_92389 ?auto_92394 ) ) ( not ( = ?auto_92390 ?auto_92394 ) ) ( not ( = ?auto_92391 ?auto_92394 ) ) ( not ( = ?auto_92392 ?auto_92394 ) ) ( not ( = ?auto_92393 ?auto_92394 ) ) ( ON ?auto_92392 ?auto_92393 ) ( ON-TABLE ?auto_92394 ) ( ON ?auto_92391 ?auto_92392 ) ( CLEAR ?auto_92391 ) ( HOLDING ?auto_92390 ) ( CLEAR ?auto_92389 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92387 ?auto_92388 ?auto_92389 ?auto_92390 )
      ( MAKE-7PILE ?auto_92387 ?auto_92388 ?auto_92389 ?auto_92390 ?auto_92391 ?auto_92392 ?auto_92393 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92395 - BLOCK
      ?auto_92396 - BLOCK
      ?auto_92397 - BLOCK
      ?auto_92398 - BLOCK
      ?auto_92399 - BLOCK
      ?auto_92400 - BLOCK
      ?auto_92401 - BLOCK
    )
    :vars
    (
      ?auto_92402 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92395 ) ( ON ?auto_92396 ?auto_92395 ) ( ON ?auto_92397 ?auto_92396 ) ( not ( = ?auto_92395 ?auto_92396 ) ) ( not ( = ?auto_92395 ?auto_92397 ) ) ( not ( = ?auto_92395 ?auto_92398 ) ) ( not ( = ?auto_92395 ?auto_92399 ) ) ( not ( = ?auto_92395 ?auto_92400 ) ) ( not ( = ?auto_92395 ?auto_92401 ) ) ( not ( = ?auto_92396 ?auto_92397 ) ) ( not ( = ?auto_92396 ?auto_92398 ) ) ( not ( = ?auto_92396 ?auto_92399 ) ) ( not ( = ?auto_92396 ?auto_92400 ) ) ( not ( = ?auto_92396 ?auto_92401 ) ) ( not ( = ?auto_92397 ?auto_92398 ) ) ( not ( = ?auto_92397 ?auto_92399 ) ) ( not ( = ?auto_92397 ?auto_92400 ) ) ( not ( = ?auto_92397 ?auto_92401 ) ) ( not ( = ?auto_92398 ?auto_92399 ) ) ( not ( = ?auto_92398 ?auto_92400 ) ) ( not ( = ?auto_92398 ?auto_92401 ) ) ( not ( = ?auto_92399 ?auto_92400 ) ) ( not ( = ?auto_92399 ?auto_92401 ) ) ( not ( = ?auto_92400 ?auto_92401 ) ) ( ON ?auto_92401 ?auto_92402 ) ( not ( = ?auto_92395 ?auto_92402 ) ) ( not ( = ?auto_92396 ?auto_92402 ) ) ( not ( = ?auto_92397 ?auto_92402 ) ) ( not ( = ?auto_92398 ?auto_92402 ) ) ( not ( = ?auto_92399 ?auto_92402 ) ) ( not ( = ?auto_92400 ?auto_92402 ) ) ( not ( = ?auto_92401 ?auto_92402 ) ) ( ON ?auto_92400 ?auto_92401 ) ( ON-TABLE ?auto_92402 ) ( ON ?auto_92399 ?auto_92400 ) ( CLEAR ?auto_92397 ) ( ON ?auto_92398 ?auto_92399 ) ( CLEAR ?auto_92398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92402 ?auto_92401 ?auto_92400 ?auto_92399 )
      ( MAKE-7PILE ?auto_92395 ?auto_92396 ?auto_92397 ?auto_92398 ?auto_92399 ?auto_92400 ?auto_92401 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92403 - BLOCK
      ?auto_92404 - BLOCK
      ?auto_92405 - BLOCK
      ?auto_92406 - BLOCK
      ?auto_92407 - BLOCK
      ?auto_92408 - BLOCK
      ?auto_92409 - BLOCK
    )
    :vars
    (
      ?auto_92410 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92403 ) ( ON ?auto_92404 ?auto_92403 ) ( not ( = ?auto_92403 ?auto_92404 ) ) ( not ( = ?auto_92403 ?auto_92405 ) ) ( not ( = ?auto_92403 ?auto_92406 ) ) ( not ( = ?auto_92403 ?auto_92407 ) ) ( not ( = ?auto_92403 ?auto_92408 ) ) ( not ( = ?auto_92403 ?auto_92409 ) ) ( not ( = ?auto_92404 ?auto_92405 ) ) ( not ( = ?auto_92404 ?auto_92406 ) ) ( not ( = ?auto_92404 ?auto_92407 ) ) ( not ( = ?auto_92404 ?auto_92408 ) ) ( not ( = ?auto_92404 ?auto_92409 ) ) ( not ( = ?auto_92405 ?auto_92406 ) ) ( not ( = ?auto_92405 ?auto_92407 ) ) ( not ( = ?auto_92405 ?auto_92408 ) ) ( not ( = ?auto_92405 ?auto_92409 ) ) ( not ( = ?auto_92406 ?auto_92407 ) ) ( not ( = ?auto_92406 ?auto_92408 ) ) ( not ( = ?auto_92406 ?auto_92409 ) ) ( not ( = ?auto_92407 ?auto_92408 ) ) ( not ( = ?auto_92407 ?auto_92409 ) ) ( not ( = ?auto_92408 ?auto_92409 ) ) ( ON ?auto_92409 ?auto_92410 ) ( not ( = ?auto_92403 ?auto_92410 ) ) ( not ( = ?auto_92404 ?auto_92410 ) ) ( not ( = ?auto_92405 ?auto_92410 ) ) ( not ( = ?auto_92406 ?auto_92410 ) ) ( not ( = ?auto_92407 ?auto_92410 ) ) ( not ( = ?auto_92408 ?auto_92410 ) ) ( not ( = ?auto_92409 ?auto_92410 ) ) ( ON ?auto_92408 ?auto_92409 ) ( ON-TABLE ?auto_92410 ) ( ON ?auto_92407 ?auto_92408 ) ( ON ?auto_92406 ?auto_92407 ) ( CLEAR ?auto_92406 ) ( HOLDING ?auto_92405 ) ( CLEAR ?auto_92404 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92403 ?auto_92404 ?auto_92405 )
      ( MAKE-7PILE ?auto_92403 ?auto_92404 ?auto_92405 ?auto_92406 ?auto_92407 ?auto_92408 ?auto_92409 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92411 - BLOCK
      ?auto_92412 - BLOCK
      ?auto_92413 - BLOCK
      ?auto_92414 - BLOCK
      ?auto_92415 - BLOCK
      ?auto_92416 - BLOCK
      ?auto_92417 - BLOCK
    )
    :vars
    (
      ?auto_92418 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92411 ) ( ON ?auto_92412 ?auto_92411 ) ( not ( = ?auto_92411 ?auto_92412 ) ) ( not ( = ?auto_92411 ?auto_92413 ) ) ( not ( = ?auto_92411 ?auto_92414 ) ) ( not ( = ?auto_92411 ?auto_92415 ) ) ( not ( = ?auto_92411 ?auto_92416 ) ) ( not ( = ?auto_92411 ?auto_92417 ) ) ( not ( = ?auto_92412 ?auto_92413 ) ) ( not ( = ?auto_92412 ?auto_92414 ) ) ( not ( = ?auto_92412 ?auto_92415 ) ) ( not ( = ?auto_92412 ?auto_92416 ) ) ( not ( = ?auto_92412 ?auto_92417 ) ) ( not ( = ?auto_92413 ?auto_92414 ) ) ( not ( = ?auto_92413 ?auto_92415 ) ) ( not ( = ?auto_92413 ?auto_92416 ) ) ( not ( = ?auto_92413 ?auto_92417 ) ) ( not ( = ?auto_92414 ?auto_92415 ) ) ( not ( = ?auto_92414 ?auto_92416 ) ) ( not ( = ?auto_92414 ?auto_92417 ) ) ( not ( = ?auto_92415 ?auto_92416 ) ) ( not ( = ?auto_92415 ?auto_92417 ) ) ( not ( = ?auto_92416 ?auto_92417 ) ) ( ON ?auto_92417 ?auto_92418 ) ( not ( = ?auto_92411 ?auto_92418 ) ) ( not ( = ?auto_92412 ?auto_92418 ) ) ( not ( = ?auto_92413 ?auto_92418 ) ) ( not ( = ?auto_92414 ?auto_92418 ) ) ( not ( = ?auto_92415 ?auto_92418 ) ) ( not ( = ?auto_92416 ?auto_92418 ) ) ( not ( = ?auto_92417 ?auto_92418 ) ) ( ON ?auto_92416 ?auto_92417 ) ( ON-TABLE ?auto_92418 ) ( ON ?auto_92415 ?auto_92416 ) ( ON ?auto_92414 ?auto_92415 ) ( CLEAR ?auto_92412 ) ( ON ?auto_92413 ?auto_92414 ) ( CLEAR ?auto_92413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92418 ?auto_92417 ?auto_92416 ?auto_92415 ?auto_92414 )
      ( MAKE-7PILE ?auto_92411 ?auto_92412 ?auto_92413 ?auto_92414 ?auto_92415 ?auto_92416 ?auto_92417 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92419 - BLOCK
      ?auto_92420 - BLOCK
      ?auto_92421 - BLOCK
      ?auto_92422 - BLOCK
      ?auto_92423 - BLOCK
      ?auto_92424 - BLOCK
      ?auto_92425 - BLOCK
    )
    :vars
    (
      ?auto_92426 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92419 ) ( not ( = ?auto_92419 ?auto_92420 ) ) ( not ( = ?auto_92419 ?auto_92421 ) ) ( not ( = ?auto_92419 ?auto_92422 ) ) ( not ( = ?auto_92419 ?auto_92423 ) ) ( not ( = ?auto_92419 ?auto_92424 ) ) ( not ( = ?auto_92419 ?auto_92425 ) ) ( not ( = ?auto_92420 ?auto_92421 ) ) ( not ( = ?auto_92420 ?auto_92422 ) ) ( not ( = ?auto_92420 ?auto_92423 ) ) ( not ( = ?auto_92420 ?auto_92424 ) ) ( not ( = ?auto_92420 ?auto_92425 ) ) ( not ( = ?auto_92421 ?auto_92422 ) ) ( not ( = ?auto_92421 ?auto_92423 ) ) ( not ( = ?auto_92421 ?auto_92424 ) ) ( not ( = ?auto_92421 ?auto_92425 ) ) ( not ( = ?auto_92422 ?auto_92423 ) ) ( not ( = ?auto_92422 ?auto_92424 ) ) ( not ( = ?auto_92422 ?auto_92425 ) ) ( not ( = ?auto_92423 ?auto_92424 ) ) ( not ( = ?auto_92423 ?auto_92425 ) ) ( not ( = ?auto_92424 ?auto_92425 ) ) ( ON ?auto_92425 ?auto_92426 ) ( not ( = ?auto_92419 ?auto_92426 ) ) ( not ( = ?auto_92420 ?auto_92426 ) ) ( not ( = ?auto_92421 ?auto_92426 ) ) ( not ( = ?auto_92422 ?auto_92426 ) ) ( not ( = ?auto_92423 ?auto_92426 ) ) ( not ( = ?auto_92424 ?auto_92426 ) ) ( not ( = ?auto_92425 ?auto_92426 ) ) ( ON ?auto_92424 ?auto_92425 ) ( ON-TABLE ?auto_92426 ) ( ON ?auto_92423 ?auto_92424 ) ( ON ?auto_92422 ?auto_92423 ) ( ON ?auto_92421 ?auto_92422 ) ( CLEAR ?auto_92421 ) ( HOLDING ?auto_92420 ) ( CLEAR ?auto_92419 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92419 ?auto_92420 )
      ( MAKE-7PILE ?auto_92419 ?auto_92420 ?auto_92421 ?auto_92422 ?auto_92423 ?auto_92424 ?auto_92425 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92427 - BLOCK
      ?auto_92428 - BLOCK
      ?auto_92429 - BLOCK
      ?auto_92430 - BLOCK
      ?auto_92431 - BLOCK
      ?auto_92432 - BLOCK
      ?auto_92433 - BLOCK
    )
    :vars
    (
      ?auto_92434 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92427 ) ( not ( = ?auto_92427 ?auto_92428 ) ) ( not ( = ?auto_92427 ?auto_92429 ) ) ( not ( = ?auto_92427 ?auto_92430 ) ) ( not ( = ?auto_92427 ?auto_92431 ) ) ( not ( = ?auto_92427 ?auto_92432 ) ) ( not ( = ?auto_92427 ?auto_92433 ) ) ( not ( = ?auto_92428 ?auto_92429 ) ) ( not ( = ?auto_92428 ?auto_92430 ) ) ( not ( = ?auto_92428 ?auto_92431 ) ) ( not ( = ?auto_92428 ?auto_92432 ) ) ( not ( = ?auto_92428 ?auto_92433 ) ) ( not ( = ?auto_92429 ?auto_92430 ) ) ( not ( = ?auto_92429 ?auto_92431 ) ) ( not ( = ?auto_92429 ?auto_92432 ) ) ( not ( = ?auto_92429 ?auto_92433 ) ) ( not ( = ?auto_92430 ?auto_92431 ) ) ( not ( = ?auto_92430 ?auto_92432 ) ) ( not ( = ?auto_92430 ?auto_92433 ) ) ( not ( = ?auto_92431 ?auto_92432 ) ) ( not ( = ?auto_92431 ?auto_92433 ) ) ( not ( = ?auto_92432 ?auto_92433 ) ) ( ON ?auto_92433 ?auto_92434 ) ( not ( = ?auto_92427 ?auto_92434 ) ) ( not ( = ?auto_92428 ?auto_92434 ) ) ( not ( = ?auto_92429 ?auto_92434 ) ) ( not ( = ?auto_92430 ?auto_92434 ) ) ( not ( = ?auto_92431 ?auto_92434 ) ) ( not ( = ?auto_92432 ?auto_92434 ) ) ( not ( = ?auto_92433 ?auto_92434 ) ) ( ON ?auto_92432 ?auto_92433 ) ( ON-TABLE ?auto_92434 ) ( ON ?auto_92431 ?auto_92432 ) ( ON ?auto_92430 ?auto_92431 ) ( ON ?auto_92429 ?auto_92430 ) ( CLEAR ?auto_92427 ) ( ON ?auto_92428 ?auto_92429 ) ( CLEAR ?auto_92428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92434 ?auto_92433 ?auto_92432 ?auto_92431 ?auto_92430 ?auto_92429 )
      ( MAKE-7PILE ?auto_92427 ?auto_92428 ?auto_92429 ?auto_92430 ?auto_92431 ?auto_92432 ?auto_92433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92435 - BLOCK
      ?auto_92436 - BLOCK
      ?auto_92437 - BLOCK
      ?auto_92438 - BLOCK
      ?auto_92439 - BLOCK
      ?auto_92440 - BLOCK
      ?auto_92441 - BLOCK
    )
    :vars
    (
      ?auto_92442 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92435 ?auto_92436 ) ) ( not ( = ?auto_92435 ?auto_92437 ) ) ( not ( = ?auto_92435 ?auto_92438 ) ) ( not ( = ?auto_92435 ?auto_92439 ) ) ( not ( = ?auto_92435 ?auto_92440 ) ) ( not ( = ?auto_92435 ?auto_92441 ) ) ( not ( = ?auto_92436 ?auto_92437 ) ) ( not ( = ?auto_92436 ?auto_92438 ) ) ( not ( = ?auto_92436 ?auto_92439 ) ) ( not ( = ?auto_92436 ?auto_92440 ) ) ( not ( = ?auto_92436 ?auto_92441 ) ) ( not ( = ?auto_92437 ?auto_92438 ) ) ( not ( = ?auto_92437 ?auto_92439 ) ) ( not ( = ?auto_92437 ?auto_92440 ) ) ( not ( = ?auto_92437 ?auto_92441 ) ) ( not ( = ?auto_92438 ?auto_92439 ) ) ( not ( = ?auto_92438 ?auto_92440 ) ) ( not ( = ?auto_92438 ?auto_92441 ) ) ( not ( = ?auto_92439 ?auto_92440 ) ) ( not ( = ?auto_92439 ?auto_92441 ) ) ( not ( = ?auto_92440 ?auto_92441 ) ) ( ON ?auto_92441 ?auto_92442 ) ( not ( = ?auto_92435 ?auto_92442 ) ) ( not ( = ?auto_92436 ?auto_92442 ) ) ( not ( = ?auto_92437 ?auto_92442 ) ) ( not ( = ?auto_92438 ?auto_92442 ) ) ( not ( = ?auto_92439 ?auto_92442 ) ) ( not ( = ?auto_92440 ?auto_92442 ) ) ( not ( = ?auto_92441 ?auto_92442 ) ) ( ON ?auto_92440 ?auto_92441 ) ( ON-TABLE ?auto_92442 ) ( ON ?auto_92439 ?auto_92440 ) ( ON ?auto_92438 ?auto_92439 ) ( ON ?auto_92437 ?auto_92438 ) ( ON ?auto_92436 ?auto_92437 ) ( CLEAR ?auto_92436 ) ( HOLDING ?auto_92435 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92435 )
      ( MAKE-7PILE ?auto_92435 ?auto_92436 ?auto_92437 ?auto_92438 ?auto_92439 ?auto_92440 ?auto_92441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_92443 - BLOCK
      ?auto_92444 - BLOCK
      ?auto_92445 - BLOCK
      ?auto_92446 - BLOCK
      ?auto_92447 - BLOCK
      ?auto_92448 - BLOCK
      ?auto_92449 - BLOCK
    )
    :vars
    (
      ?auto_92450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92443 ?auto_92444 ) ) ( not ( = ?auto_92443 ?auto_92445 ) ) ( not ( = ?auto_92443 ?auto_92446 ) ) ( not ( = ?auto_92443 ?auto_92447 ) ) ( not ( = ?auto_92443 ?auto_92448 ) ) ( not ( = ?auto_92443 ?auto_92449 ) ) ( not ( = ?auto_92444 ?auto_92445 ) ) ( not ( = ?auto_92444 ?auto_92446 ) ) ( not ( = ?auto_92444 ?auto_92447 ) ) ( not ( = ?auto_92444 ?auto_92448 ) ) ( not ( = ?auto_92444 ?auto_92449 ) ) ( not ( = ?auto_92445 ?auto_92446 ) ) ( not ( = ?auto_92445 ?auto_92447 ) ) ( not ( = ?auto_92445 ?auto_92448 ) ) ( not ( = ?auto_92445 ?auto_92449 ) ) ( not ( = ?auto_92446 ?auto_92447 ) ) ( not ( = ?auto_92446 ?auto_92448 ) ) ( not ( = ?auto_92446 ?auto_92449 ) ) ( not ( = ?auto_92447 ?auto_92448 ) ) ( not ( = ?auto_92447 ?auto_92449 ) ) ( not ( = ?auto_92448 ?auto_92449 ) ) ( ON ?auto_92449 ?auto_92450 ) ( not ( = ?auto_92443 ?auto_92450 ) ) ( not ( = ?auto_92444 ?auto_92450 ) ) ( not ( = ?auto_92445 ?auto_92450 ) ) ( not ( = ?auto_92446 ?auto_92450 ) ) ( not ( = ?auto_92447 ?auto_92450 ) ) ( not ( = ?auto_92448 ?auto_92450 ) ) ( not ( = ?auto_92449 ?auto_92450 ) ) ( ON ?auto_92448 ?auto_92449 ) ( ON-TABLE ?auto_92450 ) ( ON ?auto_92447 ?auto_92448 ) ( ON ?auto_92446 ?auto_92447 ) ( ON ?auto_92445 ?auto_92446 ) ( ON ?auto_92444 ?auto_92445 ) ( ON ?auto_92443 ?auto_92444 ) ( CLEAR ?auto_92443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92450 ?auto_92449 ?auto_92448 ?auto_92447 ?auto_92446 ?auto_92445 ?auto_92444 )
      ( MAKE-7PILE ?auto_92443 ?auto_92444 ?auto_92445 ?auto_92446 ?auto_92447 ?auto_92448 ?auto_92449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92557 - BLOCK
    )
    :vars
    (
      ?auto_92558 - BLOCK
      ?auto_92559 - BLOCK
      ?auto_92560 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92557 ?auto_92558 ) ( CLEAR ?auto_92557 ) ( not ( = ?auto_92557 ?auto_92558 ) ) ( HOLDING ?auto_92559 ) ( CLEAR ?auto_92560 ) ( not ( = ?auto_92557 ?auto_92559 ) ) ( not ( = ?auto_92557 ?auto_92560 ) ) ( not ( = ?auto_92558 ?auto_92559 ) ) ( not ( = ?auto_92558 ?auto_92560 ) ) ( not ( = ?auto_92559 ?auto_92560 ) ) )
    :subtasks
    ( ( !STACK ?auto_92559 ?auto_92560 )
      ( MAKE-1PILE ?auto_92557 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92561 - BLOCK
    )
    :vars
    (
      ?auto_92563 - BLOCK
      ?auto_92562 - BLOCK
      ?auto_92564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92561 ?auto_92563 ) ( not ( = ?auto_92561 ?auto_92563 ) ) ( CLEAR ?auto_92562 ) ( not ( = ?auto_92561 ?auto_92564 ) ) ( not ( = ?auto_92561 ?auto_92562 ) ) ( not ( = ?auto_92563 ?auto_92564 ) ) ( not ( = ?auto_92563 ?auto_92562 ) ) ( not ( = ?auto_92564 ?auto_92562 ) ) ( ON ?auto_92564 ?auto_92561 ) ( CLEAR ?auto_92564 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92563 ?auto_92561 )
      ( MAKE-1PILE ?auto_92561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92565 - BLOCK
    )
    :vars
    (
      ?auto_92566 - BLOCK
      ?auto_92568 - BLOCK
      ?auto_92567 - BLOCK
      ?auto_92571 - BLOCK
      ?auto_92569 - BLOCK
      ?auto_92570 - BLOCK
      ?auto_92572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92565 ?auto_92566 ) ( not ( = ?auto_92565 ?auto_92566 ) ) ( not ( = ?auto_92565 ?auto_92568 ) ) ( not ( = ?auto_92565 ?auto_92567 ) ) ( not ( = ?auto_92566 ?auto_92568 ) ) ( not ( = ?auto_92566 ?auto_92567 ) ) ( not ( = ?auto_92568 ?auto_92567 ) ) ( ON ?auto_92568 ?auto_92565 ) ( CLEAR ?auto_92568 ) ( ON-TABLE ?auto_92566 ) ( HOLDING ?auto_92567 ) ( CLEAR ?auto_92571 ) ( ON-TABLE ?auto_92569 ) ( ON ?auto_92570 ?auto_92569 ) ( ON ?auto_92572 ?auto_92570 ) ( ON ?auto_92571 ?auto_92572 ) ( not ( = ?auto_92569 ?auto_92570 ) ) ( not ( = ?auto_92569 ?auto_92572 ) ) ( not ( = ?auto_92569 ?auto_92571 ) ) ( not ( = ?auto_92569 ?auto_92567 ) ) ( not ( = ?auto_92570 ?auto_92572 ) ) ( not ( = ?auto_92570 ?auto_92571 ) ) ( not ( = ?auto_92570 ?auto_92567 ) ) ( not ( = ?auto_92572 ?auto_92571 ) ) ( not ( = ?auto_92572 ?auto_92567 ) ) ( not ( = ?auto_92571 ?auto_92567 ) ) ( not ( = ?auto_92565 ?auto_92571 ) ) ( not ( = ?auto_92565 ?auto_92569 ) ) ( not ( = ?auto_92565 ?auto_92570 ) ) ( not ( = ?auto_92565 ?auto_92572 ) ) ( not ( = ?auto_92566 ?auto_92571 ) ) ( not ( = ?auto_92566 ?auto_92569 ) ) ( not ( = ?auto_92566 ?auto_92570 ) ) ( not ( = ?auto_92566 ?auto_92572 ) ) ( not ( = ?auto_92568 ?auto_92571 ) ) ( not ( = ?auto_92568 ?auto_92569 ) ) ( not ( = ?auto_92568 ?auto_92570 ) ) ( not ( = ?auto_92568 ?auto_92572 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92569 ?auto_92570 ?auto_92572 ?auto_92571 ?auto_92567 )
      ( MAKE-1PILE ?auto_92565 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92573 - BLOCK
    )
    :vars
    (
      ?auto_92578 - BLOCK
      ?auto_92574 - BLOCK
      ?auto_92577 - BLOCK
      ?auto_92579 - BLOCK
      ?auto_92575 - BLOCK
      ?auto_92580 - BLOCK
      ?auto_92576 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92573 ?auto_92578 ) ( not ( = ?auto_92573 ?auto_92578 ) ) ( not ( = ?auto_92573 ?auto_92574 ) ) ( not ( = ?auto_92573 ?auto_92577 ) ) ( not ( = ?auto_92578 ?auto_92574 ) ) ( not ( = ?auto_92578 ?auto_92577 ) ) ( not ( = ?auto_92574 ?auto_92577 ) ) ( ON ?auto_92574 ?auto_92573 ) ( ON-TABLE ?auto_92578 ) ( CLEAR ?auto_92579 ) ( ON-TABLE ?auto_92575 ) ( ON ?auto_92580 ?auto_92575 ) ( ON ?auto_92576 ?auto_92580 ) ( ON ?auto_92579 ?auto_92576 ) ( not ( = ?auto_92575 ?auto_92580 ) ) ( not ( = ?auto_92575 ?auto_92576 ) ) ( not ( = ?auto_92575 ?auto_92579 ) ) ( not ( = ?auto_92575 ?auto_92577 ) ) ( not ( = ?auto_92580 ?auto_92576 ) ) ( not ( = ?auto_92580 ?auto_92579 ) ) ( not ( = ?auto_92580 ?auto_92577 ) ) ( not ( = ?auto_92576 ?auto_92579 ) ) ( not ( = ?auto_92576 ?auto_92577 ) ) ( not ( = ?auto_92579 ?auto_92577 ) ) ( not ( = ?auto_92573 ?auto_92579 ) ) ( not ( = ?auto_92573 ?auto_92575 ) ) ( not ( = ?auto_92573 ?auto_92580 ) ) ( not ( = ?auto_92573 ?auto_92576 ) ) ( not ( = ?auto_92578 ?auto_92579 ) ) ( not ( = ?auto_92578 ?auto_92575 ) ) ( not ( = ?auto_92578 ?auto_92580 ) ) ( not ( = ?auto_92578 ?auto_92576 ) ) ( not ( = ?auto_92574 ?auto_92579 ) ) ( not ( = ?auto_92574 ?auto_92575 ) ) ( not ( = ?auto_92574 ?auto_92580 ) ) ( not ( = ?auto_92574 ?auto_92576 ) ) ( ON ?auto_92577 ?auto_92574 ) ( CLEAR ?auto_92577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92578 ?auto_92573 ?auto_92574 )
      ( MAKE-1PILE ?auto_92573 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92581 - BLOCK
    )
    :vars
    (
      ?auto_92583 - BLOCK
      ?auto_92586 - BLOCK
      ?auto_92587 - BLOCK
      ?auto_92582 - BLOCK
      ?auto_92584 - BLOCK
      ?auto_92588 - BLOCK
      ?auto_92585 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92581 ?auto_92583 ) ( not ( = ?auto_92581 ?auto_92583 ) ) ( not ( = ?auto_92581 ?auto_92586 ) ) ( not ( = ?auto_92581 ?auto_92587 ) ) ( not ( = ?auto_92583 ?auto_92586 ) ) ( not ( = ?auto_92583 ?auto_92587 ) ) ( not ( = ?auto_92586 ?auto_92587 ) ) ( ON ?auto_92586 ?auto_92581 ) ( ON-TABLE ?auto_92583 ) ( ON-TABLE ?auto_92582 ) ( ON ?auto_92584 ?auto_92582 ) ( ON ?auto_92588 ?auto_92584 ) ( not ( = ?auto_92582 ?auto_92584 ) ) ( not ( = ?auto_92582 ?auto_92588 ) ) ( not ( = ?auto_92582 ?auto_92585 ) ) ( not ( = ?auto_92582 ?auto_92587 ) ) ( not ( = ?auto_92584 ?auto_92588 ) ) ( not ( = ?auto_92584 ?auto_92585 ) ) ( not ( = ?auto_92584 ?auto_92587 ) ) ( not ( = ?auto_92588 ?auto_92585 ) ) ( not ( = ?auto_92588 ?auto_92587 ) ) ( not ( = ?auto_92585 ?auto_92587 ) ) ( not ( = ?auto_92581 ?auto_92585 ) ) ( not ( = ?auto_92581 ?auto_92582 ) ) ( not ( = ?auto_92581 ?auto_92584 ) ) ( not ( = ?auto_92581 ?auto_92588 ) ) ( not ( = ?auto_92583 ?auto_92585 ) ) ( not ( = ?auto_92583 ?auto_92582 ) ) ( not ( = ?auto_92583 ?auto_92584 ) ) ( not ( = ?auto_92583 ?auto_92588 ) ) ( not ( = ?auto_92586 ?auto_92585 ) ) ( not ( = ?auto_92586 ?auto_92582 ) ) ( not ( = ?auto_92586 ?auto_92584 ) ) ( not ( = ?auto_92586 ?auto_92588 ) ) ( ON ?auto_92587 ?auto_92586 ) ( CLEAR ?auto_92587 ) ( HOLDING ?auto_92585 ) ( CLEAR ?auto_92588 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92582 ?auto_92584 ?auto_92588 ?auto_92585 )
      ( MAKE-1PILE ?auto_92581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92589 - BLOCK
    )
    :vars
    (
      ?auto_92593 - BLOCK
      ?auto_92590 - BLOCK
      ?auto_92594 - BLOCK
      ?auto_92595 - BLOCK
      ?auto_92591 - BLOCK
      ?auto_92592 - BLOCK
      ?auto_92596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92589 ?auto_92593 ) ( not ( = ?auto_92589 ?auto_92593 ) ) ( not ( = ?auto_92589 ?auto_92590 ) ) ( not ( = ?auto_92589 ?auto_92594 ) ) ( not ( = ?auto_92593 ?auto_92590 ) ) ( not ( = ?auto_92593 ?auto_92594 ) ) ( not ( = ?auto_92590 ?auto_92594 ) ) ( ON ?auto_92590 ?auto_92589 ) ( ON-TABLE ?auto_92593 ) ( ON-TABLE ?auto_92595 ) ( ON ?auto_92591 ?auto_92595 ) ( ON ?auto_92592 ?auto_92591 ) ( not ( = ?auto_92595 ?auto_92591 ) ) ( not ( = ?auto_92595 ?auto_92592 ) ) ( not ( = ?auto_92595 ?auto_92596 ) ) ( not ( = ?auto_92595 ?auto_92594 ) ) ( not ( = ?auto_92591 ?auto_92592 ) ) ( not ( = ?auto_92591 ?auto_92596 ) ) ( not ( = ?auto_92591 ?auto_92594 ) ) ( not ( = ?auto_92592 ?auto_92596 ) ) ( not ( = ?auto_92592 ?auto_92594 ) ) ( not ( = ?auto_92596 ?auto_92594 ) ) ( not ( = ?auto_92589 ?auto_92596 ) ) ( not ( = ?auto_92589 ?auto_92595 ) ) ( not ( = ?auto_92589 ?auto_92591 ) ) ( not ( = ?auto_92589 ?auto_92592 ) ) ( not ( = ?auto_92593 ?auto_92596 ) ) ( not ( = ?auto_92593 ?auto_92595 ) ) ( not ( = ?auto_92593 ?auto_92591 ) ) ( not ( = ?auto_92593 ?auto_92592 ) ) ( not ( = ?auto_92590 ?auto_92596 ) ) ( not ( = ?auto_92590 ?auto_92595 ) ) ( not ( = ?auto_92590 ?auto_92591 ) ) ( not ( = ?auto_92590 ?auto_92592 ) ) ( ON ?auto_92594 ?auto_92590 ) ( CLEAR ?auto_92592 ) ( ON ?auto_92596 ?auto_92594 ) ( CLEAR ?auto_92596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92593 ?auto_92589 ?auto_92590 ?auto_92594 )
      ( MAKE-1PILE ?auto_92589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92597 - BLOCK
    )
    :vars
    (
      ?auto_92599 - BLOCK
      ?auto_92598 - BLOCK
      ?auto_92602 - BLOCK
      ?auto_92603 - BLOCK
      ?auto_92604 - BLOCK
      ?auto_92600 - BLOCK
      ?auto_92601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92597 ?auto_92599 ) ( not ( = ?auto_92597 ?auto_92599 ) ) ( not ( = ?auto_92597 ?auto_92598 ) ) ( not ( = ?auto_92597 ?auto_92602 ) ) ( not ( = ?auto_92599 ?auto_92598 ) ) ( not ( = ?auto_92599 ?auto_92602 ) ) ( not ( = ?auto_92598 ?auto_92602 ) ) ( ON ?auto_92598 ?auto_92597 ) ( ON-TABLE ?auto_92599 ) ( ON-TABLE ?auto_92603 ) ( ON ?auto_92604 ?auto_92603 ) ( not ( = ?auto_92603 ?auto_92604 ) ) ( not ( = ?auto_92603 ?auto_92600 ) ) ( not ( = ?auto_92603 ?auto_92601 ) ) ( not ( = ?auto_92603 ?auto_92602 ) ) ( not ( = ?auto_92604 ?auto_92600 ) ) ( not ( = ?auto_92604 ?auto_92601 ) ) ( not ( = ?auto_92604 ?auto_92602 ) ) ( not ( = ?auto_92600 ?auto_92601 ) ) ( not ( = ?auto_92600 ?auto_92602 ) ) ( not ( = ?auto_92601 ?auto_92602 ) ) ( not ( = ?auto_92597 ?auto_92601 ) ) ( not ( = ?auto_92597 ?auto_92603 ) ) ( not ( = ?auto_92597 ?auto_92604 ) ) ( not ( = ?auto_92597 ?auto_92600 ) ) ( not ( = ?auto_92599 ?auto_92601 ) ) ( not ( = ?auto_92599 ?auto_92603 ) ) ( not ( = ?auto_92599 ?auto_92604 ) ) ( not ( = ?auto_92599 ?auto_92600 ) ) ( not ( = ?auto_92598 ?auto_92601 ) ) ( not ( = ?auto_92598 ?auto_92603 ) ) ( not ( = ?auto_92598 ?auto_92604 ) ) ( not ( = ?auto_92598 ?auto_92600 ) ) ( ON ?auto_92602 ?auto_92598 ) ( ON ?auto_92601 ?auto_92602 ) ( CLEAR ?auto_92601 ) ( HOLDING ?auto_92600 ) ( CLEAR ?auto_92604 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92603 ?auto_92604 ?auto_92600 )
      ( MAKE-1PILE ?auto_92597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92605 - BLOCK
    )
    :vars
    (
      ?auto_92609 - BLOCK
      ?auto_92607 - BLOCK
      ?auto_92611 - BLOCK
      ?auto_92606 - BLOCK
      ?auto_92612 - BLOCK
      ?auto_92610 - BLOCK
      ?auto_92608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92605 ?auto_92609 ) ( not ( = ?auto_92605 ?auto_92609 ) ) ( not ( = ?auto_92605 ?auto_92607 ) ) ( not ( = ?auto_92605 ?auto_92611 ) ) ( not ( = ?auto_92609 ?auto_92607 ) ) ( not ( = ?auto_92609 ?auto_92611 ) ) ( not ( = ?auto_92607 ?auto_92611 ) ) ( ON ?auto_92607 ?auto_92605 ) ( ON-TABLE ?auto_92609 ) ( ON-TABLE ?auto_92606 ) ( ON ?auto_92612 ?auto_92606 ) ( not ( = ?auto_92606 ?auto_92612 ) ) ( not ( = ?auto_92606 ?auto_92610 ) ) ( not ( = ?auto_92606 ?auto_92608 ) ) ( not ( = ?auto_92606 ?auto_92611 ) ) ( not ( = ?auto_92612 ?auto_92610 ) ) ( not ( = ?auto_92612 ?auto_92608 ) ) ( not ( = ?auto_92612 ?auto_92611 ) ) ( not ( = ?auto_92610 ?auto_92608 ) ) ( not ( = ?auto_92610 ?auto_92611 ) ) ( not ( = ?auto_92608 ?auto_92611 ) ) ( not ( = ?auto_92605 ?auto_92608 ) ) ( not ( = ?auto_92605 ?auto_92606 ) ) ( not ( = ?auto_92605 ?auto_92612 ) ) ( not ( = ?auto_92605 ?auto_92610 ) ) ( not ( = ?auto_92609 ?auto_92608 ) ) ( not ( = ?auto_92609 ?auto_92606 ) ) ( not ( = ?auto_92609 ?auto_92612 ) ) ( not ( = ?auto_92609 ?auto_92610 ) ) ( not ( = ?auto_92607 ?auto_92608 ) ) ( not ( = ?auto_92607 ?auto_92606 ) ) ( not ( = ?auto_92607 ?auto_92612 ) ) ( not ( = ?auto_92607 ?auto_92610 ) ) ( ON ?auto_92611 ?auto_92607 ) ( ON ?auto_92608 ?auto_92611 ) ( CLEAR ?auto_92612 ) ( ON ?auto_92610 ?auto_92608 ) ( CLEAR ?auto_92610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92609 ?auto_92605 ?auto_92607 ?auto_92611 ?auto_92608 )
      ( MAKE-1PILE ?auto_92605 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92613 - BLOCK
    )
    :vars
    (
      ?auto_92616 - BLOCK
      ?auto_92617 - BLOCK
      ?auto_92620 - BLOCK
      ?auto_92618 - BLOCK
      ?auto_92619 - BLOCK
      ?auto_92615 - BLOCK
      ?auto_92614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92613 ?auto_92616 ) ( not ( = ?auto_92613 ?auto_92616 ) ) ( not ( = ?auto_92613 ?auto_92617 ) ) ( not ( = ?auto_92613 ?auto_92620 ) ) ( not ( = ?auto_92616 ?auto_92617 ) ) ( not ( = ?auto_92616 ?auto_92620 ) ) ( not ( = ?auto_92617 ?auto_92620 ) ) ( ON ?auto_92617 ?auto_92613 ) ( ON-TABLE ?auto_92616 ) ( ON-TABLE ?auto_92618 ) ( not ( = ?auto_92618 ?auto_92619 ) ) ( not ( = ?auto_92618 ?auto_92615 ) ) ( not ( = ?auto_92618 ?auto_92614 ) ) ( not ( = ?auto_92618 ?auto_92620 ) ) ( not ( = ?auto_92619 ?auto_92615 ) ) ( not ( = ?auto_92619 ?auto_92614 ) ) ( not ( = ?auto_92619 ?auto_92620 ) ) ( not ( = ?auto_92615 ?auto_92614 ) ) ( not ( = ?auto_92615 ?auto_92620 ) ) ( not ( = ?auto_92614 ?auto_92620 ) ) ( not ( = ?auto_92613 ?auto_92614 ) ) ( not ( = ?auto_92613 ?auto_92618 ) ) ( not ( = ?auto_92613 ?auto_92619 ) ) ( not ( = ?auto_92613 ?auto_92615 ) ) ( not ( = ?auto_92616 ?auto_92614 ) ) ( not ( = ?auto_92616 ?auto_92618 ) ) ( not ( = ?auto_92616 ?auto_92619 ) ) ( not ( = ?auto_92616 ?auto_92615 ) ) ( not ( = ?auto_92617 ?auto_92614 ) ) ( not ( = ?auto_92617 ?auto_92618 ) ) ( not ( = ?auto_92617 ?auto_92619 ) ) ( not ( = ?auto_92617 ?auto_92615 ) ) ( ON ?auto_92620 ?auto_92617 ) ( ON ?auto_92614 ?auto_92620 ) ( ON ?auto_92615 ?auto_92614 ) ( CLEAR ?auto_92615 ) ( HOLDING ?auto_92619 ) ( CLEAR ?auto_92618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92618 ?auto_92619 )
      ( MAKE-1PILE ?auto_92613 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92621 - BLOCK
    )
    :vars
    (
      ?auto_92628 - BLOCK
      ?auto_92622 - BLOCK
      ?auto_92624 - BLOCK
      ?auto_92623 - BLOCK
      ?auto_92627 - BLOCK
      ?auto_92625 - BLOCK
      ?auto_92626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92621 ?auto_92628 ) ( not ( = ?auto_92621 ?auto_92628 ) ) ( not ( = ?auto_92621 ?auto_92622 ) ) ( not ( = ?auto_92621 ?auto_92624 ) ) ( not ( = ?auto_92628 ?auto_92622 ) ) ( not ( = ?auto_92628 ?auto_92624 ) ) ( not ( = ?auto_92622 ?auto_92624 ) ) ( ON ?auto_92622 ?auto_92621 ) ( ON-TABLE ?auto_92628 ) ( ON-TABLE ?auto_92623 ) ( not ( = ?auto_92623 ?auto_92627 ) ) ( not ( = ?auto_92623 ?auto_92625 ) ) ( not ( = ?auto_92623 ?auto_92626 ) ) ( not ( = ?auto_92623 ?auto_92624 ) ) ( not ( = ?auto_92627 ?auto_92625 ) ) ( not ( = ?auto_92627 ?auto_92626 ) ) ( not ( = ?auto_92627 ?auto_92624 ) ) ( not ( = ?auto_92625 ?auto_92626 ) ) ( not ( = ?auto_92625 ?auto_92624 ) ) ( not ( = ?auto_92626 ?auto_92624 ) ) ( not ( = ?auto_92621 ?auto_92626 ) ) ( not ( = ?auto_92621 ?auto_92623 ) ) ( not ( = ?auto_92621 ?auto_92627 ) ) ( not ( = ?auto_92621 ?auto_92625 ) ) ( not ( = ?auto_92628 ?auto_92626 ) ) ( not ( = ?auto_92628 ?auto_92623 ) ) ( not ( = ?auto_92628 ?auto_92627 ) ) ( not ( = ?auto_92628 ?auto_92625 ) ) ( not ( = ?auto_92622 ?auto_92626 ) ) ( not ( = ?auto_92622 ?auto_92623 ) ) ( not ( = ?auto_92622 ?auto_92627 ) ) ( not ( = ?auto_92622 ?auto_92625 ) ) ( ON ?auto_92624 ?auto_92622 ) ( ON ?auto_92626 ?auto_92624 ) ( ON ?auto_92625 ?auto_92626 ) ( CLEAR ?auto_92623 ) ( ON ?auto_92627 ?auto_92625 ) ( CLEAR ?auto_92627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92628 ?auto_92621 ?auto_92622 ?auto_92624 ?auto_92626 ?auto_92625 )
      ( MAKE-1PILE ?auto_92621 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92629 - BLOCK
    )
    :vars
    (
      ?auto_92630 - BLOCK
      ?auto_92633 - BLOCK
      ?auto_92635 - BLOCK
      ?auto_92632 - BLOCK
      ?auto_92634 - BLOCK
      ?auto_92636 - BLOCK
      ?auto_92631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92629 ?auto_92630 ) ( not ( = ?auto_92629 ?auto_92630 ) ) ( not ( = ?auto_92629 ?auto_92633 ) ) ( not ( = ?auto_92629 ?auto_92635 ) ) ( not ( = ?auto_92630 ?auto_92633 ) ) ( not ( = ?auto_92630 ?auto_92635 ) ) ( not ( = ?auto_92633 ?auto_92635 ) ) ( ON ?auto_92633 ?auto_92629 ) ( ON-TABLE ?auto_92630 ) ( not ( = ?auto_92632 ?auto_92634 ) ) ( not ( = ?auto_92632 ?auto_92636 ) ) ( not ( = ?auto_92632 ?auto_92631 ) ) ( not ( = ?auto_92632 ?auto_92635 ) ) ( not ( = ?auto_92634 ?auto_92636 ) ) ( not ( = ?auto_92634 ?auto_92631 ) ) ( not ( = ?auto_92634 ?auto_92635 ) ) ( not ( = ?auto_92636 ?auto_92631 ) ) ( not ( = ?auto_92636 ?auto_92635 ) ) ( not ( = ?auto_92631 ?auto_92635 ) ) ( not ( = ?auto_92629 ?auto_92631 ) ) ( not ( = ?auto_92629 ?auto_92632 ) ) ( not ( = ?auto_92629 ?auto_92634 ) ) ( not ( = ?auto_92629 ?auto_92636 ) ) ( not ( = ?auto_92630 ?auto_92631 ) ) ( not ( = ?auto_92630 ?auto_92632 ) ) ( not ( = ?auto_92630 ?auto_92634 ) ) ( not ( = ?auto_92630 ?auto_92636 ) ) ( not ( = ?auto_92633 ?auto_92631 ) ) ( not ( = ?auto_92633 ?auto_92632 ) ) ( not ( = ?auto_92633 ?auto_92634 ) ) ( not ( = ?auto_92633 ?auto_92636 ) ) ( ON ?auto_92635 ?auto_92633 ) ( ON ?auto_92631 ?auto_92635 ) ( ON ?auto_92636 ?auto_92631 ) ( ON ?auto_92634 ?auto_92636 ) ( CLEAR ?auto_92634 ) ( HOLDING ?auto_92632 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92632 )
      ( MAKE-1PILE ?auto_92629 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_92637 - BLOCK
    )
    :vars
    (
      ?auto_92644 - BLOCK
      ?auto_92640 - BLOCK
      ?auto_92641 - BLOCK
      ?auto_92643 - BLOCK
      ?auto_92639 - BLOCK
      ?auto_92642 - BLOCK
      ?auto_92638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92637 ?auto_92644 ) ( not ( = ?auto_92637 ?auto_92644 ) ) ( not ( = ?auto_92637 ?auto_92640 ) ) ( not ( = ?auto_92637 ?auto_92641 ) ) ( not ( = ?auto_92644 ?auto_92640 ) ) ( not ( = ?auto_92644 ?auto_92641 ) ) ( not ( = ?auto_92640 ?auto_92641 ) ) ( ON ?auto_92640 ?auto_92637 ) ( ON-TABLE ?auto_92644 ) ( not ( = ?auto_92643 ?auto_92639 ) ) ( not ( = ?auto_92643 ?auto_92642 ) ) ( not ( = ?auto_92643 ?auto_92638 ) ) ( not ( = ?auto_92643 ?auto_92641 ) ) ( not ( = ?auto_92639 ?auto_92642 ) ) ( not ( = ?auto_92639 ?auto_92638 ) ) ( not ( = ?auto_92639 ?auto_92641 ) ) ( not ( = ?auto_92642 ?auto_92638 ) ) ( not ( = ?auto_92642 ?auto_92641 ) ) ( not ( = ?auto_92638 ?auto_92641 ) ) ( not ( = ?auto_92637 ?auto_92638 ) ) ( not ( = ?auto_92637 ?auto_92643 ) ) ( not ( = ?auto_92637 ?auto_92639 ) ) ( not ( = ?auto_92637 ?auto_92642 ) ) ( not ( = ?auto_92644 ?auto_92638 ) ) ( not ( = ?auto_92644 ?auto_92643 ) ) ( not ( = ?auto_92644 ?auto_92639 ) ) ( not ( = ?auto_92644 ?auto_92642 ) ) ( not ( = ?auto_92640 ?auto_92638 ) ) ( not ( = ?auto_92640 ?auto_92643 ) ) ( not ( = ?auto_92640 ?auto_92639 ) ) ( not ( = ?auto_92640 ?auto_92642 ) ) ( ON ?auto_92641 ?auto_92640 ) ( ON ?auto_92638 ?auto_92641 ) ( ON ?auto_92642 ?auto_92638 ) ( ON ?auto_92639 ?auto_92642 ) ( ON ?auto_92643 ?auto_92639 ) ( CLEAR ?auto_92643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92644 ?auto_92637 ?auto_92640 ?auto_92641 ?auto_92638 ?auto_92642 ?auto_92639 )
      ( MAKE-1PILE ?auto_92637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_92656 - BLOCK
      ?auto_92657 - BLOCK
      ?auto_92658 - BLOCK
      ?auto_92659 - BLOCK
      ?auto_92660 - BLOCK
    )
    :vars
    (
      ?auto_92661 - BLOCK
      ?auto_92662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92661 ?auto_92660 ) ( CLEAR ?auto_92661 ) ( ON-TABLE ?auto_92656 ) ( ON ?auto_92657 ?auto_92656 ) ( ON ?auto_92658 ?auto_92657 ) ( ON ?auto_92659 ?auto_92658 ) ( ON ?auto_92660 ?auto_92659 ) ( not ( = ?auto_92656 ?auto_92657 ) ) ( not ( = ?auto_92656 ?auto_92658 ) ) ( not ( = ?auto_92656 ?auto_92659 ) ) ( not ( = ?auto_92656 ?auto_92660 ) ) ( not ( = ?auto_92656 ?auto_92661 ) ) ( not ( = ?auto_92657 ?auto_92658 ) ) ( not ( = ?auto_92657 ?auto_92659 ) ) ( not ( = ?auto_92657 ?auto_92660 ) ) ( not ( = ?auto_92657 ?auto_92661 ) ) ( not ( = ?auto_92658 ?auto_92659 ) ) ( not ( = ?auto_92658 ?auto_92660 ) ) ( not ( = ?auto_92658 ?auto_92661 ) ) ( not ( = ?auto_92659 ?auto_92660 ) ) ( not ( = ?auto_92659 ?auto_92661 ) ) ( not ( = ?auto_92660 ?auto_92661 ) ) ( HOLDING ?auto_92662 ) ( not ( = ?auto_92656 ?auto_92662 ) ) ( not ( = ?auto_92657 ?auto_92662 ) ) ( not ( = ?auto_92658 ?auto_92662 ) ) ( not ( = ?auto_92659 ?auto_92662 ) ) ( not ( = ?auto_92660 ?auto_92662 ) ) ( not ( = ?auto_92661 ?auto_92662 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_92662 )
      ( MAKE-5PILE ?auto_92656 ?auto_92657 ?auto_92658 ?auto_92659 ?auto_92660 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92753 - BLOCK
      ?auto_92754 - BLOCK
    )
    :vars
    (
      ?auto_92755 - BLOCK
      ?auto_92757 - BLOCK
      ?auto_92758 - BLOCK
      ?auto_92756 - BLOCK
      ?auto_92759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92753 ?auto_92754 ) ) ( ON ?auto_92754 ?auto_92755 ) ( not ( = ?auto_92753 ?auto_92755 ) ) ( not ( = ?auto_92754 ?auto_92755 ) ) ( ON ?auto_92753 ?auto_92754 ) ( CLEAR ?auto_92753 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92757 ) ( ON ?auto_92758 ?auto_92757 ) ( ON ?auto_92756 ?auto_92758 ) ( ON ?auto_92759 ?auto_92756 ) ( ON ?auto_92755 ?auto_92759 ) ( not ( = ?auto_92757 ?auto_92758 ) ) ( not ( = ?auto_92757 ?auto_92756 ) ) ( not ( = ?auto_92757 ?auto_92759 ) ) ( not ( = ?auto_92757 ?auto_92755 ) ) ( not ( = ?auto_92757 ?auto_92754 ) ) ( not ( = ?auto_92757 ?auto_92753 ) ) ( not ( = ?auto_92758 ?auto_92756 ) ) ( not ( = ?auto_92758 ?auto_92759 ) ) ( not ( = ?auto_92758 ?auto_92755 ) ) ( not ( = ?auto_92758 ?auto_92754 ) ) ( not ( = ?auto_92758 ?auto_92753 ) ) ( not ( = ?auto_92756 ?auto_92759 ) ) ( not ( = ?auto_92756 ?auto_92755 ) ) ( not ( = ?auto_92756 ?auto_92754 ) ) ( not ( = ?auto_92756 ?auto_92753 ) ) ( not ( = ?auto_92759 ?auto_92755 ) ) ( not ( = ?auto_92759 ?auto_92754 ) ) ( not ( = ?auto_92759 ?auto_92753 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92757 ?auto_92758 ?auto_92756 ?auto_92759 ?auto_92755 ?auto_92754 )
      ( MAKE-2PILE ?auto_92753 ?auto_92754 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92762 - BLOCK
      ?auto_92763 - BLOCK
    )
    :vars
    (
      ?auto_92764 - BLOCK
      ?auto_92765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92762 ?auto_92763 ) ) ( ON ?auto_92763 ?auto_92764 ) ( CLEAR ?auto_92763 ) ( not ( = ?auto_92762 ?auto_92764 ) ) ( not ( = ?auto_92763 ?auto_92764 ) ) ( ON ?auto_92762 ?auto_92765 ) ( CLEAR ?auto_92762 ) ( HAND-EMPTY ) ( not ( = ?auto_92762 ?auto_92765 ) ) ( not ( = ?auto_92763 ?auto_92765 ) ) ( not ( = ?auto_92764 ?auto_92765 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92762 ?auto_92765 )
      ( MAKE-2PILE ?auto_92762 ?auto_92763 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92766 - BLOCK
      ?auto_92767 - BLOCK
    )
    :vars
    (
      ?auto_92768 - BLOCK
      ?auto_92769 - BLOCK
      ?auto_92771 - BLOCK
      ?auto_92770 - BLOCK
      ?auto_92773 - BLOCK
      ?auto_92772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92766 ?auto_92767 ) ) ( not ( = ?auto_92766 ?auto_92768 ) ) ( not ( = ?auto_92767 ?auto_92768 ) ) ( ON ?auto_92766 ?auto_92769 ) ( CLEAR ?auto_92766 ) ( not ( = ?auto_92766 ?auto_92769 ) ) ( not ( = ?auto_92767 ?auto_92769 ) ) ( not ( = ?auto_92768 ?auto_92769 ) ) ( HOLDING ?auto_92767 ) ( CLEAR ?auto_92768 ) ( ON-TABLE ?auto_92771 ) ( ON ?auto_92770 ?auto_92771 ) ( ON ?auto_92773 ?auto_92770 ) ( ON ?auto_92772 ?auto_92773 ) ( ON ?auto_92768 ?auto_92772 ) ( not ( = ?auto_92771 ?auto_92770 ) ) ( not ( = ?auto_92771 ?auto_92773 ) ) ( not ( = ?auto_92771 ?auto_92772 ) ) ( not ( = ?auto_92771 ?auto_92768 ) ) ( not ( = ?auto_92771 ?auto_92767 ) ) ( not ( = ?auto_92770 ?auto_92773 ) ) ( not ( = ?auto_92770 ?auto_92772 ) ) ( not ( = ?auto_92770 ?auto_92768 ) ) ( not ( = ?auto_92770 ?auto_92767 ) ) ( not ( = ?auto_92773 ?auto_92772 ) ) ( not ( = ?auto_92773 ?auto_92768 ) ) ( not ( = ?auto_92773 ?auto_92767 ) ) ( not ( = ?auto_92772 ?auto_92768 ) ) ( not ( = ?auto_92772 ?auto_92767 ) ) ( not ( = ?auto_92766 ?auto_92771 ) ) ( not ( = ?auto_92766 ?auto_92770 ) ) ( not ( = ?auto_92766 ?auto_92773 ) ) ( not ( = ?auto_92766 ?auto_92772 ) ) ( not ( = ?auto_92769 ?auto_92771 ) ) ( not ( = ?auto_92769 ?auto_92770 ) ) ( not ( = ?auto_92769 ?auto_92773 ) ) ( not ( = ?auto_92769 ?auto_92772 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92771 ?auto_92770 ?auto_92773 ?auto_92772 ?auto_92768 ?auto_92767 )
      ( MAKE-2PILE ?auto_92766 ?auto_92767 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92774 - BLOCK
      ?auto_92775 - BLOCK
    )
    :vars
    (
      ?auto_92781 - BLOCK
      ?auto_92780 - BLOCK
      ?auto_92779 - BLOCK
      ?auto_92778 - BLOCK
      ?auto_92777 - BLOCK
      ?auto_92776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92774 ?auto_92775 ) ) ( not ( = ?auto_92774 ?auto_92781 ) ) ( not ( = ?auto_92775 ?auto_92781 ) ) ( ON ?auto_92774 ?auto_92780 ) ( not ( = ?auto_92774 ?auto_92780 ) ) ( not ( = ?auto_92775 ?auto_92780 ) ) ( not ( = ?auto_92781 ?auto_92780 ) ) ( CLEAR ?auto_92781 ) ( ON-TABLE ?auto_92779 ) ( ON ?auto_92778 ?auto_92779 ) ( ON ?auto_92777 ?auto_92778 ) ( ON ?auto_92776 ?auto_92777 ) ( ON ?auto_92781 ?auto_92776 ) ( not ( = ?auto_92779 ?auto_92778 ) ) ( not ( = ?auto_92779 ?auto_92777 ) ) ( not ( = ?auto_92779 ?auto_92776 ) ) ( not ( = ?auto_92779 ?auto_92781 ) ) ( not ( = ?auto_92779 ?auto_92775 ) ) ( not ( = ?auto_92778 ?auto_92777 ) ) ( not ( = ?auto_92778 ?auto_92776 ) ) ( not ( = ?auto_92778 ?auto_92781 ) ) ( not ( = ?auto_92778 ?auto_92775 ) ) ( not ( = ?auto_92777 ?auto_92776 ) ) ( not ( = ?auto_92777 ?auto_92781 ) ) ( not ( = ?auto_92777 ?auto_92775 ) ) ( not ( = ?auto_92776 ?auto_92781 ) ) ( not ( = ?auto_92776 ?auto_92775 ) ) ( not ( = ?auto_92774 ?auto_92779 ) ) ( not ( = ?auto_92774 ?auto_92778 ) ) ( not ( = ?auto_92774 ?auto_92777 ) ) ( not ( = ?auto_92774 ?auto_92776 ) ) ( not ( = ?auto_92780 ?auto_92779 ) ) ( not ( = ?auto_92780 ?auto_92778 ) ) ( not ( = ?auto_92780 ?auto_92777 ) ) ( not ( = ?auto_92780 ?auto_92776 ) ) ( ON ?auto_92775 ?auto_92774 ) ( CLEAR ?auto_92775 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92780 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92780 ?auto_92774 )
      ( MAKE-2PILE ?auto_92774 ?auto_92775 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92782 - BLOCK
      ?auto_92783 - BLOCK
    )
    :vars
    (
      ?auto_92787 - BLOCK
      ?auto_92785 - BLOCK
      ?auto_92786 - BLOCK
      ?auto_92788 - BLOCK
      ?auto_92784 - BLOCK
      ?auto_92789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92782 ?auto_92783 ) ) ( not ( = ?auto_92782 ?auto_92787 ) ) ( not ( = ?auto_92783 ?auto_92787 ) ) ( ON ?auto_92782 ?auto_92785 ) ( not ( = ?auto_92782 ?auto_92785 ) ) ( not ( = ?auto_92783 ?auto_92785 ) ) ( not ( = ?auto_92787 ?auto_92785 ) ) ( ON-TABLE ?auto_92786 ) ( ON ?auto_92788 ?auto_92786 ) ( ON ?auto_92784 ?auto_92788 ) ( ON ?auto_92789 ?auto_92784 ) ( not ( = ?auto_92786 ?auto_92788 ) ) ( not ( = ?auto_92786 ?auto_92784 ) ) ( not ( = ?auto_92786 ?auto_92789 ) ) ( not ( = ?auto_92786 ?auto_92787 ) ) ( not ( = ?auto_92786 ?auto_92783 ) ) ( not ( = ?auto_92788 ?auto_92784 ) ) ( not ( = ?auto_92788 ?auto_92789 ) ) ( not ( = ?auto_92788 ?auto_92787 ) ) ( not ( = ?auto_92788 ?auto_92783 ) ) ( not ( = ?auto_92784 ?auto_92789 ) ) ( not ( = ?auto_92784 ?auto_92787 ) ) ( not ( = ?auto_92784 ?auto_92783 ) ) ( not ( = ?auto_92789 ?auto_92787 ) ) ( not ( = ?auto_92789 ?auto_92783 ) ) ( not ( = ?auto_92782 ?auto_92786 ) ) ( not ( = ?auto_92782 ?auto_92788 ) ) ( not ( = ?auto_92782 ?auto_92784 ) ) ( not ( = ?auto_92782 ?auto_92789 ) ) ( not ( = ?auto_92785 ?auto_92786 ) ) ( not ( = ?auto_92785 ?auto_92788 ) ) ( not ( = ?auto_92785 ?auto_92784 ) ) ( not ( = ?auto_92785 ?auto_92789 ) ) ( ON ?auto_92783 ?auto_92782 ) ( CLEAR ?auto_92783 ) ( ON-TABLE ?auto_92785 ) ( HOLDING ?auto_92787 ) ( CLEAR ?auto_92789 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92786 ?auto_92788 ?auto_92784 ?auto_92789 ?auto_92787 )
      ( MAKE-2PILE ?auto_92782 ?auto_92783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92790 - BLOCK
      ?auto_92791 - BLOCK
    )
    :vars
    (
      ?auto_92792 - BLOCK
      ?auto_92794 - BLOCK
      ?auto_92796 - BLOCK
      ?auto_92793 - BLOCK
      ?auto_92797 - BLOCK
      ?auto_92795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92790 ?auto_92791 ) ) ( not ( = ?auto_92790 ?auto_92792 ) ) ( not ( = ?auto_92791 ?auto_92792 ) ) ( ON ?auto_92790 ?auto_92794 ) ( not ( = ?auto_92790 ?auto_92794 ) ) ( not ( = ?auto_92791 ?auto_92794 ) ) ( not ( = ?auto_92792 ?auto_92794 ) ) ( ON-TABLE ?auto_92796 ) ( ON ?auto_92793 ?auto_92796 ) ( ON ?auto_92797 ?auto_92793 ) ( ON ?auto_92795 ?auto_92797 ) ( not ( = ?auto_92796 ?auto_92793 ) ) ( not ( = ?auto_92796 ?auto_92797 ) ) ( not ( = ?auto_92796 ?auto_92795 ) ) ( not ( = ?auto_92796 ?auto_92792 ) ) ( not ( = ?auto_92796 ?auto_92791 ) ) ( not ( = ?auto_92793 ?auto_92797 ) ) ( not ( = ?auto_92793 ?auto_92795 ) ) ( not ( = ?auto_92793 ?auto_92792 ) ) ( not ( = ?auto_92793 ?auto_92791 ) ) ( not ( = ?auto_92797 ?auto_92795 ) ) ( not ( = ?auto_92797 ?auto_92792 ) ) ( not ( = ?auto_92797 ?auto_92791 ) ) ( not ( = ?auto_92795 ?auto_92792 ) ) ( not ( = ?auto_92795 ?auto_92791 ) ) ( not ( = ?auto_92790 ?auto_92796 ) ) ( not ( = ?auto_92790 ?auto_92793 ) ) ( not ( = ?auto_92790 ?auto_92797 ) ) ( not ( = ?auto_92790 ?auto_92795 ) ) ( not ( = ?auto_92794 ?auto_92796 ) ) ( not ( = ?auto_92794 ?auto_92793 ) ) ( not ( = ?auto_92794 ?auto_92797 ) ) ( not ( = ?auto_92794 ?auto_92795 ) ) ( ON ?auto_92791 ?auto_92790 ) ( ON-TABLE ?auto_92794 ) ( CLEAR ?auto_92795 ) ( ON ?auto_92792 ?auto_92791 ) ( CLEAR ?auto_92792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92794 ?auto_92790 ?auto_92791 )
      ( MAKE-2PILE ?auto_92790 ?auto_92791 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92798 - BLOCK
      ?auto_92799 - BLOCK
    )
    :vars
    (
      ?auto_92803 - BLOCK
      ?auto_92801 - BLOCK
      ?auto_92805 - BLOCK
      ?auto_92802 - BLOCK
      ?auto_92804 - BLOCK
      ?auto_92800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92798 ?auto_92799 ) ) ( not ( = ?auto_92798 ?auto_92803 ) ) ( not ( = ?auto_92799 ?auto_92803 ) ) ( ON ?auto_92798 ?auto_92801 ) ( not ( = ?auto_92798 ?auto_92801 ) ) ( not ( = ?auto_92799 ?auto_92801 ) ) ( not ( = ?auto_92803 ?auto_92801 ) ) ( ON-TABLE ?auto_92805 ) ( ON ?auto_92802 ?auto_92805 ) ( ON ?auto_92804 ?auto_92802 ) ( not ( = ?auto_92805 ?auto_92802 ) ) ( not ( = ?auto_92805 ?auto_92804 ) ) ( not ( = ?auto_92805 ?auto_92800 ) ) ( not ( = ?auto_92805 ?auto_92803 ) ) ( not ( = ?auto_92805 ?auto_92799 ) ) ( not ( = ?auto_92802 ?auto_92804 ) ) ( not ( = ?auto_92802 ?auto_92800 ) ) ( not ( = ?auto_92802 ?auto_92803 ) ) ( not ( = ?auto_92802 ?auto_92799 ) ) ( not ( = ?auto_92804 ?auto_92800 ) ) ( not ( = ?auto_92804 ?auto_92803 ) ) ( not ( = ?auto_92804 ?auto_92799 ) ) ( not ( = ?auto_92800 ?auto_92803 ) ) ( not ( = ?auto_92800 ?auto_92799 ) ) ( not ( = ?auto_92798 ?auto_92805 ) ) ( not ( = ?auto_92798 ?auto_92802 ) ) ( not ( = ?auto_92798 ?auto_92804 ) ) ( not ( = ?auto_92798 ?auto_92800 ) ) ( not ( = ?auto_92801 ?auto_92805 ) ) ( not ( = ?auto_92801 ?auto_92802 ) ) ( not ( = ?auto_92801 ?auto_92804 ) ) ( not ( = ?auto_92801 ?auto_92800 ) ) ( ON ?auto_92799 ?auto_92798 ) ( ON-TABLE ?auto_92801 ) ( ON ?auto_92803 ?auto_92799 ) ( CLEAR ?auto_92803 ) ( HOLDING ?auto_92800 ) ( CLEAR ?auto_92804 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92805 ?auto_92802 ?auto_92804 ?auto_92800 )
      ( MAKE-2PILE ?auto_92798 ?auto_92799 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92806 - BLOCK
      ?auto_92807 - BLOCK
    )
    :vars
    (
      ?auto_92811 - BLOCK
      ?auto_92808 - BLOCK
      ?auto_92813 - BLOCK
      ?auto_92812 - BLOCK
      ?auto_92809 - BLOCK
      ?auto_92810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92806 ?auto_92807 ) ) ( not ( = ?auto_92806 ?auto_92811 ) ) ( not ( = ?auto_92807 ?auto_92811 ) ) ( ON ?auto_92806 ?auto_92808 ) ( not ( = ?auto_92806 ?auto_92808 ) ) ( not ( = ?auto_92807 ?auto_92808 ) ) ( not ( = ?auto_92811 ?auto_92808 ) ) ( ON-TABLE ?auto_92813 ) ( ON ?auto_92812 ?auto_92813 ) ( ON ?auto_92809 ?auto_92812 ) ( not ( = ?auto_92813 ?auto_92812 ) ) ( not ( = ?auto_92813 ?auto_92809 ) ) ( not ( = ?auto_92813 ?auto_92810 ) ) ( not ( = ?auto_92813 ?auto_92811 ) ) ( not ( = ?auto_92813 ?auto_92807 ) ) ( not ( = ?auto_92812 ?auto_92809 ) ) ( not ( = ?auto_92812 ?auto_92810 ) ) ( not ( = ?auto_92812 ?auto_92811 ) ) ( not ( = ?auto_92812 ?auto_92807 ) ) ( not ( = ?auto_92809 ?auto_92810 ) ) ( not ( = ?auto_92809 ?auto_92811 ) ) ( not ( = ?auto_92809 ?auto_92807 ) ) ( not ( = ?auto_92810 ?auto_92811 ) ) ( not ( = ?auto_92810 ?auto_92807 ) ) ( not ( = ?auto_92806 ?auto_92813 ) ) ( not ( = ?auto_92806 ?auto_92812 ) ) ( not ( = ?auto_92806 ?auto_92809 ) ) ( not ( = ?auto_92806 ?auto_92810 ) ) ( not ( = ?auto_92808 ?auto_92813 ) ) ( not ( = ?auto_92808 ?auto_92812 ) ) ( not ( = ?auto_92808 ?auto_92809 ) ) ( not ( = ?auto_92808 ?auto_92810 ) ) ( ON ?auto_92807 ?auto_92806 ) ( ON-TABLE ?auto_92808 ) ( ON ?auto_92811 ?auto_92807 ) ( CLEAR ?auto_92809 ) ( ON ?auto_92810 ?auto_92811 ) ( CLEAR ?auto_92810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_92808 ?auto_92806 ?auto_92807 ?auto_92811 )
      ( MAKE-2PILE ?auto_92806 ?auto_92807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92814 - BLOCK
      ?auto_92815 - BLOCK
    )
    :vars
    (
      ?auto_92817 - BLOCK
      ?auto_92821 - BLOCK
      ?auto_92818 - BLOCK
      ?auto_92820 - BLOCK
      ?auto_92816 - BLOCK
      ?auto_92819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92814 ?auto_92815 ) ) ( not ( = ?auto_92814 ?auto_92817 ) ) ( not ( = ?auto_92815 ?auto_92817 ) ) ( ON ?auto_92814 ?auto_92821 ) ( not ( = ?auto_92814 ?auto_92821 ) ) ( not ( = ?auto_92815 ?auto_92821 ) ) ( not ( = ?auto_92817 ?auto_92821 ) ) ( ON-TABLE ?auto_92818 ) ( ON ?auto_92820 ?auto_92818 ) ( not ( = ?auto_92818 ?auto_92820 ) ) ( not ( = ?auto_92818 ?auto_92816 ) ) ( not ( = ?auto_92818 ?auto_92819 ) ) ( not ( = ?auto_92818 ?auto_92817 ) ) ( not ( = ?auto_92818 ?auto_92815 ) ) ( not ( = ?auto_92820 ?auto_92816 ) ) ( not ( = ?auto_92820 ?auto_92819 ) ) ( not ( = ?auto_92820 ?auto_92817 ) ) ( not ( = ?auto_92820 ?auto_92815 ) ) ( not ( = ?auto_92816 ?auto_92819 ) ) ( not ( = ?auto_92816 ?auto_92817 ) ) ( not ( = ?auto_92816 ?auto_92815 ) ) ( not ( = ?auto_92819 ?auto_92817 ) ) ( not ( = ?auto_92819 ?auto_92815 ) ) ( not ( = ?auto_92814 ?auto_92818 ) ) ( not ( = ?auto_92814 ?auto_92820 ) ) ( not ( = ?auto_92814 ?auto_92816 ) ) ( not ( = ?auto_92814 ?auto_92819 ) ) ( not ( = ?auto_92821 ?auto_92818 ) ) ( not ( = ?auto_92821 ?auto_92820 ) ) ( not ( = ?auto_92821 ?auto_92816 ) ) ( not ( = ?auto_92821 ?auto_92819 ) ) ( ON ?auto_92815 ?auto_92814 ) ( ON-TABLE ?auto_92821 ) ( ON ?auto_92817 ?auto_92815 ) ( ON ?auto_92819 ?auto_92817 ) ( CLEAR ?auto_92819 ) ( HOLDING ?auto_92816 ) ( CLEAR ?auto_92820 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_92818 ?auto_92820 ?auto_92816 )
      ( MAKE-2PILE ?auto_92814 ?auto_92815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92822 - BLOCK
      ?auto_92823 - BLOCK
    )
    :vars
    (
      ?auto_92826 - BLOCK
      ?auto_92829 - BLOCK
      ?auto_92825 - BLOCK
      ?auto_92828 - BLOCK
      ?auto_92824 - BLOCK
      ?auto_92827 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92822 ?auto_92823 ) ) ( not ( = ?auto_92822 ?auto_92826 ) ) ( not ( = ?auto_92823 ?auto_92826 ) ) ( ON ?auto_92822 ?auto_92829 ) ( not ( = ?auto_92822 ?auto_92829 ) ) ( not ( = ?auto_92823 ?auto_92829 ) ) ( not ( = ?auto_92826 ?auto_92829 ) ) ( ON-TABLE ?auto_92825 ) ( ON ?auto_92828 ?auto_92825 ) ( not ( = ?auto_92825 ?auto_92828 ) ) ( not ( = ?auto_92825 ?auto_92824 ) ) ( not ( = ?auto_92825 ?auto_92827 ) ) ( not ( = ?auto_92825 ?auto_92826 ) ) ( not ( = ?auto_92825 ?auto_92823 ) ) ( not ( = ?auto_92828 ?auto_92824 ) ) ( not ( = ?auto_92828 ?auto_92827 ) ) ( not ( = ?auto_92828 ?auto_92826 ) ) ( not ( = ?auto_92828 ?auto_92823 ) ) ( not ( = ?auto_92824 ?auto_92827 ) ) ( not ( = ?auto_92824 ?auto_92826 ) ) ( not ( = ?auto_92824 ?auto_92823 ) ) ( not ( = ?auto_92827 ?auto_92826 ) ) ( not ( = ?auto_92827 ?auto_92823 ) ) ( not ( = ?auto_92822 ?auto_92825 ) ) ( not ( = ?auto_92822 ?auto_92828 ) ) ( not ( = ?auto_92822 ?auto_92824 ) ) ( not ( = ?auto_92822 ?auto_92827 ) ) ( not ( = ?auto_92829 ?auto_92825 ) ) ( not ( = ?auto_92829 ?auto_92828 ) ) ( not ( = ?auto_92829 ?auto_92824 ) ) ( not ( = ?auto_92829 ?auto_92827 ) ) ( ON ?auto_92823 ?auto_92822 ) ( ON-TABLE ?auto_92829 ) ( ON ?auto_92826 ?auto_92823 ) ( ON ?auto_92827 ?auto_92826 ) ( CLEAR ?auto_92828 ) ( ON ?auto_92824 ?auto_92827 ) ( CLEAR ?auto_92824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92829 ?auto_92822 ?auto_92823 ?auto_92826 ?auto_92827 )
      ( MAKE-2PILE ?auto_92822 ?auto_92823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92830 - BLOCK
      ?auto_92831 - BLOCK
    )
    :vars
    (
      ?auto_92836 - BLOCK
      ?auto_92833 - BLOCK
      ?auto_92832 - BLOCK
      ?auto_92837 - BLOCK
      ?auto_92834 - BLOCK
      ?auto_92835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92830 ?auto_92831 ) ) ( not ( = ?auto_92830 ?auto_92836 ) ) ( not ( = ?auto_92831 ?auto_92836 ) ) ( ON ?auto_92830 ?auto_92833 ) ( not ( = ?auto_92830 ?auto_92833 ) ) ( not ( = ?auto_92831 ?auto_92833 ) ) ( not ( = ?auto_92836 ?auto_92833 ) ) ( ON-TABLE ?auto_92832 ) ( not ( = ?auto_92832 ?auto_92837 ) ) ( not ( = ?auto_92832 ?auto_92834 ) ) ( not ( = ?auto_92832 ?auto_92835 ) ) ( not ( = ?auto_92832 ?auto_92836 ) ) ( not ( = ?auto_92832 ?auto_92831 ) ) ( not ( = ?auto_92837 ?auto_92834 ) ) ( not ( = ?auto_92837 ?auto_92835 ) ) ( not ( = ?auto_92837 ?auto_92836 ) ) ( not ( = ?auto_92837 ?auto_92831 ) ) ( not ( = ?auto_92834 ?auto_92835 ) ) ( not ( = ?auto_92834 ?auto_92836 ) ) ( not ( = ?auto_92834 ?auto_92831 ) ) ( not ( = ?auto_92835 ?auto_92836 ) ) ( not ( = ?auto_92835 ?auto_92831 ) ) ( not ( = ?auto_92830 ?auto_92832 ) ) ( not ( = ?auto_92830 ?auto_92837 ) ) ( not ( = ?auto_92830 ?auto_92834 ) ) ( not ( = ?auto_92830 ?auto_92835 ) ) ( not ( = ?auto_92833 ?auto_92832 ) ) ( not ( = ?auto_92833 ?auto_92837 ) ) ( not ( = ?auto_92833 ?auto_92834 ) ) ( not ( = ?auto_92833 ?auto_92835 ) ) ( ON ?auto_92831 ?auto_92830 ) ( ON-TABLE ?auto_92833 ) ( ON ?auto_92836 ?auto_92831 ) ( ON ?auto_92835 ?auto_92836 ) ( ON ?auto_92834 ?auto_92835 ) ( CLEAR ?auto_92834 ) ( HOLDING ?auto_92837 ) ( CLEAR ?auto_92832 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_92832 ?auto_92837 )
      ( MAKE-2PILE ?auto_92830 ?auto_92831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92838 - BLOCK
      ?auto_92839 - BLOCK
    )
    :vars
    (
      ?auto_92840 - BLOCK
      ?auto_92842 - BLOCK
      ?auto_92845 - BLOCK
      ?auto_92844 - BLOCK
      ?auto_92843 - BLOCK
      ?auto_92841 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92838 ?auto_92839 ) ) ( not ( = ?auto_92838 ?auto_92840 ) ) ( not ( = ?auto_92839 ?auto_92840 ) ) ( ON ?auto_92838 ?auto_92842 ) ( not ( = ?auto_92838 ?auto_92842 ) ) ( not ( = ?auto_92839 ?auto_92842 ) ) ( not ( = ?auto_92840 ?auto_92842 ) ) ( ON-TABLE ?auto_92845 ) ( not ( = ?auto_92845 ?auto_92844 ) ) ( not ( = ?auto_92845 ?auto_92843 ) ) ( not ( = ?auto_92845 ?auto_92841 ) ) ( not ( = ?auto_92845 ?auto_92840 ) ) ( not ( = ?auto_92845 ?auto_92839 ) ) ( not ( = ?auto_92844 ?auto_92843 ) ) ( not ( = ?auto_92844 ?auto_92841 ) ) ( not ( = ?auto_92844 ?auto_92840 ) ) ( not ( = ?auto_92844 ?auto_92839 ) ) ( not ( = ?auto_92843 ?auto_92841 ) ) ( not ( = ?auto_92843 ?auto_92840 ) ) ( not ( = ?auto_92843 ?auto_92839 ) ) ( not ( = ?auto_92841 ?auto_92840 ) ) ( not ( = ?auto_92841 ?auto_92839 ) ) ( not ( = ?auto_92838 ?auto_92845 ) ) ( not ( = ?auto_92838 ?auto_92844 ) ) ( not ( = ?auto_92838 ?auto_92843 ) ) ( not ( = ?auto_92838 ?auto_92841 ) ) ( not ( = ?auto_92842 ?auto_92845 ) ) ( not ( = ?auto_92842 ?auto_92844 ) ) ( not ( = ?auto_92842 ?auto_92843 ) ) ( not ( = ?auto_92842 ?auto_92841 ) ) ( ON ?auto_92839 ?auto_92838 ) ( ON-TABLE ?auto_92842 ) ( ON ?auto_92840 ?auto_92839 ) ( ON ?auto_92841 ?auto_92840 ) ( ON ?auto_92843 ?auto_92841 ) ( CLEAR ?auto_92845 ) ( ON ?auto_92844 ?auto_92843 ) ( CLEAR ?auto_92844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92842 ?auto_92838 ?auto_92839 ?auto_92840 ?auto_92841 ?auto_92843 )
      ( MAKE-2PILE ?auto_92838 ?auto_92839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92846 - BLOCK
      ?auto_92847 - BLOCK
    )
    :vars
    (
      ?auto_92853 - BLOCK
      ?auto_92852 - BLOCK
      ?auto_92849 - BLOCK
      ?auto_92848 - BLOCK
      ?auto_92850 - BLOCK
      ?auto_92851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92846 ?auto_92847 ) ) ( not ( = ?auto_92846 ?auto_92853 ) ) ( not ( = ?auto_92847 ?auto_92853 ) ) ( ON ?auto_92846 ?auto_92852 ) ( not ( = ?auto_92846 ?auto_92852 ) ) ( not ( = ?auto_92847 ?auto_92852 ) ) ( not ( = ?auto_92853 ?auto_92852 ) ) ( not ( = ?auto_92849 ?auto_92848 ) ) ( not ( = ?auto_92849 ?auto_92850 ) ) ( not ( = ?auto_92849 ?auto_92851 ) ) ( not ( = ?auto_92849 ?auto_92853 ) ) ( not ( = ?auto_92849 ?auto_92847 ) ) ( not ( = ?auto_92848 ?auto_92850 ) ) ( not ( = ?auto_92848 ?auto_92851 ) ) ( not ( = ?auto_92848 ?auto_92853 ) ) ( not ( = ?auto_92848 ?auto_92847 ) ) ( not ( = ?auto_92850 ?auto_92851 ) ) ( not ( = ?auto_92850 ?auto_92853 ) ) ( not ( = ?auto_92850 ?auto_92847 ) ) ( not ( = ?auto_92851 ?auto_92853 ) ) ( not ( = ?auto_92851 ?auto_92847 ) ) ( not ( = ?auto_92846 ?auto_92849 ) ) ( not ( = ?auto_92846 ?auto_92848 ) ) ( not ( = ?auto_92846 ?auto_92850 ) ) ( not ( = ?auto_92846 ?auto_92851 ) ) ( not ( = ?auto_92852 ?auto_92849 ) ) ( not ( = ?auto_92852 ?auto_92848 ) ) ( not ( = ?auto_92852 ?auto_92850 ) ) ( not ( = ?auto_92852 ?auto_92851 ) ) ( ON ?auto_92847 ?auto_92846 ) ( ON-TABLE ?auto_92852 ) ( ON ?auto_92853 ?auto_92847 ) ( ON ?auto_92851 ?auto_92853 ) ( ON ?auto_92850 ?auto_92851 ) ( ON ?auto_92848 ?auto_92850 ) ( CLEAR ?auto_92848 ) ( HOLDING ?auto_92849 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92849 )
      ( MAKE-2PILE ?auto_92846 ?auto_92847 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_92854 - BLOCK
      ?auto_92855 - BLOCK
    )
    :vars
    (
      ?auto_92857 - BLOCK
      ?auto_92856 - BLOCK
      ?auto_92861 - BLOCK
      ?auto_92860 - BLOCK
      ?auto_92859 - BLOCK
      ?auto_92858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92854 ?auto_92855 ) ) ( not ( = ?auto_92854 ?auto_92857 ) ) ( not ( = ?auto_92855 ?auto_92857 ) ) ( ON ?auto_92854 ?auto_92856 ) ( not ( = ?auto_92854 ?auto_92856 ) ) ( not ( = ?auto_92855 ?auto_92856 ) ) ( not ( = ?auto_92857 ?auto_92856 ) ) ( not ( = ?auto_92861 ?auto_92860 ) ) ( not ( = ?auto_92861 ?auto_92859 ) ) ( not ( = ?auto_92861 ?auto_92858 ) ) ( not ( = ?auto_92861 ?auto_92857 ) ) ( not ( = ?auto_92861 ?auto_92855 ) ) ( not ( = ?auto_92860 ?auto_92859 ) ) ( not ( = ?auto_92860 ?auto_92858 ) ) ( not ( = ?auto_92860 ?auto_92857 ) ) ( not ( = ?auto_92860 ?auto_92855 ) ) ( not ( = ?auto_92859 ?auto_92858 ) ) ( not ( = ?auto_92859 ?auto_92857 ) ) ( not ( = ?auto_92859 ?auto_92855 ) ) ( not ( = ?auto_92858 ?auto_92857 ) ) ( not ( = ?auto_92858 ?auto_92855 ) ) ( not ( = ?auto_92854 ?auto_92861 ) ) ( not ( = ?auto_92854 ?auto_92860 ) ) ( not ( = ?auto_92854 ?auto_92859 ) ) ( not ( = ?auto_92854 ?auto_92858 ) ) ( not ( = ?auto_92856 ?auto_92861 ) ) ( not ( = ?auto_92856 ?auto_92860 ) ) ( not ( = ?auto_92856 ?auto_92859 ) ) ( not ( = ?auto_92856 ?auto_92858 ) ) ( ON ?auto_92855 ?auto_92854 ) ( ON-TABLE ?auto_92856 ) ( ON ?auto_92857 ?auto_92855 ) ( ON ?auto_92858 ?auto_92857 ) ( ON ?auto_92859 ?auto_92858 ) ( ON ?auto_92860 ?auto_92859 ) ( ON ?auto_92861 ?auto_92860 ) ( CLEAR ?auto_92861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_92856 ?auto_92854 ?auto_92855 ?auto_92857 ?auto_92858 ?auto_92859 ?auto_92860 )
      ( MAKE-2PILE ?auto_92854 ?auto_92855 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_92885 - BLOCK
      ?auto_92886 - BLOCK
      ?auto_92887 - BLOCK
      ?auto_92888 - BLOCK
    )
    :vars
    (
      ?auto_92890 - BLOCK
      ?auto_92891 - BLOCK
      ?auto_92889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_92890 ?auto_92888 ) ( ON-TABLE ?auto_92885 ) ( ON ?auto_92886 ?auto_92885 ) ( ON ?auto_92887 ?auto_92886 ) ( ON ?auto_92888 ?auto_92887 ) ( not ( = ?auto_92885 ?auto_92886 ) ) ( not ( = ?auto_92885 ?auto_92887 ) ) ( not ( = ?auto_92885 ?auto_92888 ) ) ( not ( = ?auto_92885 ?auto_92890 ) ) ( not ( = ?auto_92886 ?auto_92887 ) ) ( not ( = ?auto_92886 ?auto_92888 ) ) ( not ( = ?auto_92886 ?auto_92890 ) ) ( not ( = ?auto_92887 ?auto_92888 ) ) ( not ( = ?auto_92887 ?auto_92890 ) ) ( not ( = ?auto_92888 ?auto_92890 ) ) ( not ( = ?auto_92885 ?auto_92891 ) ) ( not ( = ?auto_92885 ?auto_92889 ) ) ( not ( = ?auto_92886 ?auto_92891 ) ) ( not ( = ?auto_92886 ?auto_92889 ) ) ( not ( = ?auto_92887 ?auto_92891 ) ) ( not ( = ?auto_92887 ?auto_92889 ) ) ( not ( = ?auto_92888 ?auto_92891 ) ) ( not ( = ?auto_92888 ?auto_92889 ) ) ( not ( = ?auto_92890 ?auto_92891 ) ) ( not ( = ?auto_92890 ?auto_92889 ) ) ( not ( = ?auto_92891 ?auto_92889 ) ) ( ON ?auto_92891 ?auto_92890 ) ( CLEAR ?auto_92891 ) ( HOLDING ?auto_92889 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92889 )
      ( MAKE-4PILE ?auto_92885 ?auto_92886 ?auto_92887 ?auto_92888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92972 - BLOCK
      ?auto_92973 - BLOCK
      ?auto_92974 - BLOCK
    )
    :vars
    (
      ?auto_92975 - BLOCK
      ?auto_92978 - BLOCK
      ?auto_92977 - BLOCK
      ?auto_92976 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_92972 ) ( not ( = ?auto_92972 ?auto_92973 ) ) ( not ( = ?auto_92972 ?auto_92974 ) ) ( not ( = ?auto_92973 ?auto_92974 ) ) ( ON ?auto_92974 ?auto_92975 ) ( not ( = ?auto_92972 ?auto_92975 ) ) ( not ( = ?auto_92973 ?auto_92975 ) ) ( not ( = ?auto_92974 ?auto_92975 ) ) ( CLEAR ?auto_92972 ) ( ON ?auto_92973 ?auto_92974 ) ( CLEAR ?auto_92973 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_92978 ) ( ON ?auto_92977 ?auto_92978 ) ( ON ?auto_92976 ?auto_92977 ) ( ON ?auto_92975 ?auto_92976 ) ( not ( = ?auto_92978 ?auto_92977 ) ) ( not ( = ?auto_92978 ?auto_92976 ) ) ( not ( = ?auto_92978 ?auto_92975 ) ) ( not ( = ?auto_92978 ?auto_92974 ) ) ( not ( = ?auto_92978 ?auto_92973 ) ) ( not ( = ?auto_92977 ?auto_92976 ) ) ( not ( = ?auto_92977 ?auto_92975 ) ) ( not ( = ?auto_92977 ?auto_92974 ) ) ( not ( = ?auto_92977 ?auto_92973 ) ) ( not ( = ?auto_92976 ?auto_92975 ) ) ( not ( = ?auto_92976 ?auto_92974 ) ) ( not ( = ?auto_92976 ?auto_92973 ) ) ( not ( = ?auto_92972 ?auto_92978 ) ) ( not ( = ?auto_92972 ?auto_92977 ) ) ( not ( = ?auto_92972 ?auto_92976 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_92978 ?auto_92977 ?auto_92976 ?auto_92975 ?auto_92974 )
      ( MAKE-3PILE ?auto_92972 ?auto_92973 ?auto_92974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92979 - BLOCK
      ?auto_92980 - BLOCK
      ?auto_92981 - BLOCK
    )
    :vars
    (
      ?auto_92985 - BLOCK
      ?auto_92984 - BLOCK
      ?auto_92982 - BLOCK
      ?auto_92983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92979 ?auto_92980 ) ) ( not ( = ?auto_92979 ?auto_92981 ) ) ( not ( = ?auto_92980 ?auto_92981 ) ) ( ON ?auto_92981 ?auto_92985 ) ( not ( = ?auto_92979 ?auto_92985 ) ) ( not ( = ?auto_92980 ?auto_92985 ) ) ( not ( = ?auto_92981 ?auto_92985 ) ) ( ON ?auto_92980 ?auto_92981 ) ( CLEAR ?auto_92980 ) ( ON-TABLE ?auto_92984 ) ( ON ?auto_92982 ?auto_92984 ) ( ON ?auto_92983 ?auto_92982 ) ( ON ?auto_92985 ?auto_92983 ) ( not ( = ?auto_92984 ?auto_92982 ) ) ( not ( = ?auto_92984 ?auto_92983 ) ) ( not ( = ?auto_92984 ?auto_92985 ) ) ( not ( = ?auto_92984 ?auto_92981 ) ) ( not ( = ?auto_92984 ?auto_92980 ) ) ( not ( = ?auto_92982 ?auto_92983 ) ) ( not ( = ?auto_92982 ?auto_92985 ) ) ( not ( = ?auto_92982 ?auto_92981 ) ) ( not ( = ?auto_92982 ?auto_92980 ) ) ( not ( = ?auto_92983 ?auto_92985 ) ) ( not ( = ?auto_92983 ?auto_92981 ) ) ( not ( = ?auto_92983 ?auto_92980 ) ) ( not ( = ?auto_92979 ?auto_92984 ) ) ( not ( = ?auto_92979 ?auto_92982 ) ) ( not ( = ?auto_92979 ?auto_92983 ) ) ( HOLDING ?auto_92979 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_92979 )
      ( MAKE-3PILE ?auto_92979 ?auto_92980 ?auto_92981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92986 - BLOCK
      ?auto_92987 - BLOCK
      ?auto_92988 - BLOCK
    )
    :vars
    (
      ?auto_92989 - BLOCK
      ?auto_92992 - BLOCK
      ?auto_92990 - BLOCK
      ?auto_92991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92986 ?auto_92987 ) ) ( not ( = ?auto_92986 ?auto_92988 ) ) ( not ( = ?auto_92987 ?auto_92988 ) ) ( ON ?auto_92988 ?auto_92989 ) ( not ( = ?auto_92986 ?auto_92989 ) ) ( not ( = ?auto_92987 ?auto_92989 ) ) ( not ( = ?auto_92988 ?auto_92989 ) ) ( ON ?auto_92987 ?auto_92988 ) ( ON-TABLE ?auto_92992 ) ( ON ?auto_92990 ?auto_92992 ) ( ON ?auto_92991 ?auto_92990 ) ( ON ?auto_92989 ?auto_92991 ) ( not ( = ?auto_92992 ?auto_92990 ) ) ( not ( = ?auto_92992 ?auto_92991 ) ) ( not ( = ?auto_92992 ?auto_92989 ) ) ( not ( = ?auto_92992 ?auto_92988 ) ) ( not ( = ?auto_92992 ?auto_92987 ) ) ( not ( = ?auto_92990 ?auto_92991 ) ) ( not ( = ?auto_92990 ?auto_92989 ) ) ( not ( = ?auto_92990 ?auto_92988 ) ) ( not ( = ?auto_92990 ?auto_92987 ) ) ( not ( = ?auto_92991 ?auto_92989 ) ) ( not ( = ?auto_92991 ?auto_92988 ) ) ( not ( = ?auto_92991 ?auto_92987 ) ) ( not ( = ?auto_92986 ?auto_92992 ) ) ( not ( = ?auto_92986 ?auto_92990 ) ) ( not ( = ?auto_92986 ?auto_92991 ) ) ( ON ?auto_92986 ?auto_92987 ) ( CLEAR ?auto_92986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_92992 ?auto_92990 ?auto_92991 ?auto_92989 ?auto_92988 ?auto_92987 )
      ( MAKE-3PILE ?auto_92986 ?auto_92987 ?auto_92988 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_92996 - BLOCK
      ?auto_92997 - BLOCK
      ?auto_92998 - BLOCK
    )
    :vars
    (
      ?auto_93001 - BLOCK
      ?auto_93000 - BLOCK
      ?auto_93002 - BLOCK
      ?auto_92999 - BLOCK
      ?auto_93003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_92996 ?auto_92997 ) ) ( not ( = ?auto_92996 ?auto_92998 ) ) ( not ( = ?auto_92997 ?auto_92998 ) ) ( ON ?auto_92998 ?auto_93001 ) ( not ( = ?auto_92996 ?auto_93001 ) ) ( not ( = ?auto_92997 ?auto_93001 ) ) ( not ( = ?auto_92998 ?auto_93001 ) ) ( ON ?auto_92997 ?auto_92998 ) ( CLEAR ?auto_92997 ) ( ON-TABLE ?auto_93000 ) ( ON ?auto_93002 ?auto_93000 ) ( ON ?auto_92999 ?auto_93002 ) ( ON ?auto_93001 ?auto_92999 ) ( not ( = ?auto_93000 ?auto_93002 ) ) ( not ( = ?auto_93000 ?auto_92999 ) ) ( not ( = ?auto_93000 ?auto_93001 ) ) ( not ( = ?auto_93000 ?auto_92998 ) ) ( not ( = ?auto_93000 ?auto_92997 ) ) ( not ( = ?auto_93002 ?auto_92999 ) ) ( not ( = ?auto_93002 ?auto_93001 ) ) ( not ( = ?auto_93002 ?auto_92998 ) ) ( not ( = ?auto_93002 ?auto_92997 ) ) ( not ( = ?auto_92999 ?auto_93001 ) ) ( not ( = ?auto_92999 ?auto_92998 ) ) ( not ( = ?auto_92999 ?auto_92997 ) ) ( not ( = ?auto_92996 ?auto_93000 ) ) ( not ( = ?auto_92996 ?auto_93002 ) ) ( not ( = ?auto_92996 ?auto_92999 ) ) ( ON ?auto_92996 ?auto_93003 ) ( CLEAR ?auto_92996 ) ( HAND-EMPTY ) ( not ( = ?auto_92996 ?auto_93003 ) ) ( not ( = ?auto_92997 ?auto_93003 ) ) ( not ( = ?auto_92998 ?auto_93003 ) ) ( not ( = ?auto_93001 ?auto_93003 ) ) ( not ( = ?auto_93000 ?auto_93003 ) ) ( not ( = ?auto_93002 ?auto_93003 ) ) ( not ( = ?auto_92999 ?auto_93003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_92996 ?auto_93003 )
      ( MAKE-3PILE ?auto_92996 ?auto_92997 ?auto_92998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93004 - BLOCK
      ?auto_93005 - BLOCK
      ?auto_93006 - BLOCK
    )
    :vars
    (
      ?auto_93008 - BLOCK
      ?auto_93011 - BLOCK
      ?auto_93010 - BLOCK
      ?auto_93007 - BLOCK
      ?auto_93009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93004 ?auto_93005 ) ) ( not ( = ?auto_93004 ?auto_93006 ) ) ( not ( = ?auto_93005 ?auto_93006 ) ) ( ON ?auto_93006 ?auto_93008 ) ( not ( = ?auto_93004 ?auto_93008 ) ) ( not ( = ?auto_93005 ?auto_93008 ) ) ( not ( = ?auto_93006 ?auto_93008 ) ) ( ON-TABLE ?auto_93011 ) ( ON ?auto_93010 ?auto_93011 ) ( ON ?auto_93007 ?auto_93010 ) ( ON ?auto_93008 ?auto_93007 ) ( not ( = ?auto_93011 ?auto_93010 ) ) ( not ( = ?auto_93011 ?auto_93007 ) ) ( not ( = ?auto_93011 ?auto_93008 ) ) ( not ( = ?auto_93011 ?auto_93006 ) ) ( not ( = ?auto_93011 ?auto_93005 ) ) ( not ( = ?auto_93010 ?auto_93007 ) ) ( not ( = ?auto_93010 ?auto_93008 ) ) ( not ( = ?auto_93010 ?auto_93006 ) ) ( not ( = ?auto_93010 ?auto_93005 ) ) ( not ( = ?auto_93007 ?auto_93008 ) ) ( not ( = ?auto_93007 ?auto_93006 ) ) ( not ( = ?auto_93007 ?auto_93005 ) ) ( not ( = ?auto_93004 ?auto_93011 ) ) ( not ( = ?auto_93004 ?auto_93010 ) ) ( not ( = ?auto_93004 ?auto_93007 ) ) ( ON ?auto_93004 ?auto_93009 ) ( CLEAR ?auto_93004 ) ( not ( = ?auto_93004 ?auto_93009 ) ) ( not ( = ?auto_93005 ?auto_93009 ) ) ( not ( = ?auto_93006 ?auto_93009 ) ) ( not ( = ?auto_93008 ?auto_93009 ) ) ( not ( = ?auto_93011 ?auto_93009 ) ) ( not ( = ?auto_93010 ?auto_93009 ) ) ( not ( = ?auto_93007 ?auto_93009 ) ) ( HOLDING ?auto_93005 ) ( CLEAR ?auto_93006 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93011 ?auto_93010 ?auto_93007 ?auto_93008 ?auto_93006 ?auto_93005 )
      ( MAKE-3PILE ?auto_93004 ?auto_93005 ?auto_93006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93012 - BLOCK
      ?auto_93013 - BLOCK
      ?auto_93014 - BLOCK
    )
    :vars
    (
      ?auto_93017 - BLOCK
      ?auto_93016 - BLOCK
      ?auto_93019 - BLOCK
      ?auto_93018 - BLOCK
      ?auto_93015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93012 ?auto_93013 ) ) ( not ( = ?auto_93012 ?auto_93014 ) ) ( not ( = ?auto_93013 ?auto_93014 ) ) ( ON ?auto_93014 ?auto_93017 ) ( not ( = ?auto_93012 ?auto_93017 ) ) ( not ( = ?auto_93013 ?auto_93017 ) ) ( not ( = ?auto_93014 ?auto_93017 ) ) ( ON-TABLE ?auto_93016 ) ( ON ?auto_93019 ?auto_93016 ) ( ON ?auto_93018 ?auto_93019 ) ( ON ?auto_93017 ?auto_93018 ) ( not ( = ?auto_93016 ?auto_93019 ) ) ( not ( = ?auto_93016 ?auto_93018 ) ) ( not ( = ?auto_93016 ?auto_93017 ) ) ( not ( = ?auto_93016 ?auto_93014 ) ) ( not ( = ?auto_93016 ?auto_93013 ) ) ( not ( = ?auto_93019 ?auto_93018 ) ) ( not ( = ?auto_93019 ?auto_93017 ) ) ( not ( = ?auto_93019 ?auto_93014 ) ) ( not ( = ?auto_93019 ?auto_93013 ) ) ( not ( = ?auto_93018 ?auto_93017 ) ) ( not ( = ?auto_93018 ?auto_93014 ) ) ( not ( = ?auto_93018 ?auto_93013 ) ) ( not ( = ?auto_93012 ?auto_93016 ) ) ( not ( = ?auto_93012 ?auto_93019 ) ) ( not ( = ?auto_93012 ?auto_93018 ) ) ( ON ?auto_93012 ?auto_93015 ) ( not ( = ?auto_93012 ?auto_93015 ) ) ( not ( = ?auto_93013 ?auto_93015 ) ) ( not ( = ?auto_93014 ?auto_93015 ) ) ( not ( = ?auto_93017 ?auto_93015 ) ) ( not ( = ?auto_93016 ?auto_93015 ) ) ( not ( = ?auto_93019 ?auto_93015 ) ) ( not ( = ?auto_93018 ?auto_93015 ) ) ( CLEAR ?auto_93014 ) ( ON ?auto_93013 ?auto_93012 ) ( CLEAR ?auto_93013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93015 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93015 ?auto_93012 )
      ( MAKE-3PILE ?auto_93012 ?auto_93013 ?auto_93014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93020 - BLOCK
      ?auto_93021 - BLOCK
      ?auto_93022 - BLOCK
    )
    :vars
    (
      ?auto_93027 - BLOCK
      ?auto_93023 - BLOCK
      ?auto_93025 - BLOCK
      ?auto_93024 - BLOCK
      ?auto_93026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93020 ?auto_93021 ) ) ( not ( = ?auto_93020 ?auto_93022 ) ) ( not ( = ?auto_93021 ?auto_93022 ) ) ( not ( = ?auto_93020 ?auto_93027 ) ) ( not ( = ?auto_93021 ?auto_93027 ) ) ( not ( = ?auto_93022 ?auto_93027 ) ) ( ON-TABLE ?auto_93023 ) ( ON ?auto_93025 ?auto_93023 ) ( ON ?auto_93024 ?auto_93025 ) ( ON ?auto_93027 ?auto_93024 ) ( not ( = ?auto_93023 ?auto_93025 ) ) ( not ( = ?auto_93023 ?auto_93024 ) ) ( not ( = ?auto_93023 ?auto_93027 ) ) ( not ( = ?auto_93023 ?auto_93022 ) ) ( not ( = ?auto_93023 ?auto_93021 ) ) ( not ( = ?auto_93025 ?auto_93024 ) ) ( not ( = ?auto_93025 ?auto_93027 ) ) ( not ( = ?auto_93025 ?auto_93022 ) ) ( not ( = ?auto_93025 ?auto_93021 ) ) ( not ( = ?auto_93024 ?auto_93027 ) ) ( not ( = ?auto_93024 ?auto_93022 ) ) ( not ( = ?auto_93024 ?auto_93021 ) ) ( not ( = ?auto_93020 ?auto_93023 ) ) ( not ( = ?auto_93020 ?auto_93025 ) ) ( not ( = ?auto_93020 ?auto_93024 ) ) ( ON ?auto_93020 ?auto_93026 ) ( not ( = ?auto_93020 ?auto_93026 ) ) ( not ( = ?auto_93021 ?auto_93026 ) ) ( not ( = ?auto_93022 ?auto_93026 ) ) ( not ( = ?auto_93027 ?auto_93026 ) ) ( not ( = ?auto_93023 ?auto_93026 ) ) ( not ( = ?auto_93025 ?auto_93026 ) ) ( not ( = ?auto_93024 ?auto_93026 ) ) ( ON ?auto_93021 ?auto_93020 ) ( CLEAR ?auto_93021 ) ( ON-TABLE ?auto_93026 ) ( HOLDING ?auto_93022 ) ( CLEAR ?auto_93027 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93023 ?auto_93025 ?auto_93024 ?auto_93027 ?auto_93022 )
      ( MAKE-3PILE ?auto_93020 ?auto_93021 ?auto_93022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93028 - BLOCK
      ?auto_93029 - BLOCK
      ?auto_93030 - BLOCK
    )
    :vars
    (
      ?auto_93033 - BLOCK
      ?auto_93034 - BLOCK
      ?auto_93031 - BLOCK
      ?auto_93032 - BLOCK
      ?auto_93035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93028 ?auto_93029 ) ) ( not ( = ?auto_93028 ?auto_93030 ) ) ( not ( = ?auto_93029 ?auto_93030 ) ) ( not ( = ?auto_93028 ?auto_93033 ) ) ( not ( = ?auto_93029 ?auto_93033 ) ) ( not ( = ?auto_93030 ?auto_93033 ) ) ( ON-TABLE ?auto_93034 ) ( ON ?auto_93031 ?auto_93034 ) ( ON ?auto_93032 ?auto_93031 ) ( ON ?auto_93033 ?auto_93032 ) ( not ( = ?auto_93034 ?auto_93031 ) ) ( not ( = ?auto_93034 ?auto_93032 ) ) ( not ( = ?auto_93034 ?auto_93033 ) ) ( not ( = ?auto_93034 ?auto_93030 ) ) ( not ( = ?auto_93034 ?auto_93029 ) ) ( not ( = ?auto_93031 ?auto_93032 ) ) ( not ( = ?auto_93031 ?auto_93033 ) ) ( not ( = ?auto_93031 ?auto_93030 ) ) ( not ( = ?auto_93031 ?auto_93029 ) ) ( not ( = ?auto_93032 ?auto_93033 ) ) ( not ( = ?auto_93032 ?auto_93030 ) ) ( not ( = ?auto_93032 ?auto_93029 ) ) ( not ( = ?auto_93028 ?auto_93034 ) ) ( not ( = ?auto_93028 ?auto_93031 ) ) ( not ( = ?auto_93028 ?auto_93032 ) ) ( ON ?auto_93028 ?auto_93035 ) ( not ( = ?auto_93028 ?auto_93035 ) ) ( not ( = ?auto_93029 ?auto_93035 ) ) ( not ( = ?auto_93030 ?auto_93035 ) ) ( not ( = ?auto_93033 ?auto_93035 ) ) ( not ( = ?auto_93034 ?auto_93035 ) ) ( not ( = ?auto_93031 ?auto_93035 ) ) ( not ( = ?auto_93032 ?auto_93035 ) ) ( ON ?auto_93029 ?auto_93028 ) ( ON-TABLE ?auto_93035 ) ( CLEAR ?auto_93033 ) ( ON ?auto_93030 ?auto_93029 ) ( CLEAR ?auto_93030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93035 ?auto_93028 ?auto_93029 )
      ( MAKE-3PILE ?auto_93028 ?auto_93029 ?auto_93030 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93036 - BLOCK
      ?auto_93037 - BLOCK
      ?auto_93038 - BLOCK
    )
    :vars
    (
      ?auto_93043 - BLOCK
      ?auto_93041 - BLOCK
      ?auto_93039 - BLOCK
      ?auto_93040 - BLOCK
      ?auto_93042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93036 ?auto_93037 ) ) ( not ( = ?auto_93036 ?auto_93038 ) ) ( not ( = ?auto_93037 ?auto_93038 ) ) ( not ( = ?auto_93036 ?auto_93043 ) ) ( not ( = ?auto_93037 ?auto_93043 ) ) ( not ( = ?auto_93038 ?auto_93043 ) ) ( ON-TABLE ?auto_93041 ) ( ON ?auto_93039 ?auto_93041 ) ( ON ?auto_93040 ?auto_93039 ) ( not ( = ?auto_93041 ?auto_93039 ) ) ( not ( = ?auto_93041 ?auto_93040 ) ) ( not ( = ?auto_93041 ?auto_93043 ) ) ( not ( = ?auto_93041 ?auto_93038 ) ) ( not ( = ?auto_93041 ?auto_93037 ) ) ( not ( = ?auto_93039 ?auto_93040 ) ) ( not ( = ?auto_93039 ?auto_93043 ) ) ( not ( = ?auto_93039 ?auto_93038 ) ) ( not ( = ?auto_93039 ?auto_93037 ) ) ( not ( = ?auto_93040 ?auto_93043 ) ) ( not ( = ?auto_93040 ?auto_93038 ) ) ( not ( = ?auto_93040 ?auto_93037 ) ) ( not ( = ?auto_93036 ?auto_93041 ) ) ( not ( = ?auto_93036 ?auto_93039 ) ) ( not ( = ?auto_93036 ?auto_93040 ) ) ( ON ?auto_93036 ?auto_93042 ) ( not ( = ?auto_93036 ?auto_93042 ) ) ( not ( = ?auto_93037 ?auto_93042 ) ) ( not ( = ?auto_93038 ?auto_93042 ) ) ( not ( = ?auto_93043 ?auto_93042 ) ) ( not ( = ?auto_93041 ?auto_93042 ) ) ( not ( = ?auto_93039 ?auto_93042 ) ) ( not ( = ?auto_93040 ?auto_93042 ) ) ( ON ?auto_93037 ?auto_93036 ) ( ON-TABLE ?auto_93042 ) ( ON ?auto_93038 ?auto_93037 ) ( CLEAR ?auto_93038 ) ( HOLDING ?auto_93043 ) ( CLEAR ?auto_93040 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93041 ?auto_93039 ?auto_93040 ?auto_93043 )
      ( MAKE-3PILE ?auto_93036 ?auto_93037 ?auto_93038 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93044 - BLOCK
      ?auto_93045 - BLOCK
      ?auto_93046 - BLOCK
    )
    :vars
    (
      ?auto_93051 - BLOCK
      ?auto_93048 - BLOCK
      ?auto_93047 - BLOCK
      ?auto_93049 - BLOCK
      ?auto_93050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93044 ?auto_93045 ) ) ( not ( = ?auto_93044 ?auto_93046 ) ) ( not ( = ?auto_93045 ?auto_93046 ) ) ( not ( = ?auto_93044 ?auto_93051 ) ) ( not ( = ?auto_93045 ?auto_93051 ) ) ( not ( = ?auto_93046 ?auto_93051 ) ) ( ON-TABLE ?auto_93048 ) ( ON ?auto_93047 ?auto_93048 ) ( ON ?auto_93049 ?auto_93047 ) ( not ( = ?auto_93048 ?auto_93047 ) ) ( not ( = ?auto_93048 ?auto_93049 ) ) ( not ( = ?auto_93048 ?auto_93051 ) ) ( not ( = ?auto_93048 ?auto_93046 ) ) ( not ( = ?auto_93048 ?auto_93045 ) ) ( not ( = ?auto_93047 ?auto_93049 ) ) ( not ( = ?auto_93047 ?auto_93051 ) ) ( not ( = ?auto_93047 ?auto_93046 ) ) ( not ( = ?auto_93047 ?auto_93045 ) ) ( not ( = ?auto_93049 ?auto_93051 ) ) ( not ( = ?auto_93049 ?auto_93046 ) ) ( not ( = ?auto_93049 ?auto_93045 ) ) ( not ( = ?auto_93044 ?auto_93048 ) ) ( not ( = ?auto_93044 ?auto_93047 ) ) ( not ( = ?auto_93044 ?auto_93049 ) ) ( ON ?auto_93044 ?auto_93050 ) ( not ( = ?auto_93044 ?auto_93050 ) ) ( not ( = ?auto_93045 ?auto_93050 ) ) ( not ( = ?auto_93046 ?auto_93050 ) ) ( not ( = ?auto_93051 ?auto_93050 ) ) ( not ( = ?auto_93048 ?auto_93050 ) ) ( not ( = ?auto_93047 ?auto_93050 ) ) ( not ( = ?auto_93049 ?auto_93050 ) ) ( ON ?auto_93045 ?auto_93044 ) ( ON-TABLE ?auto_93050 ) ( ON ?auto_93046 ?auto_93045 ) ( CLEAR ?auto_93049 ) ( ON ?auto_93051 ?auto_93046 ) ( CLEAR ?auto_93051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93050 ?auto_93044 ?auto_93045 ?auto_93046 )
      ( MAKE-3PILE ?auto_93044 ?auto_93045 ?auto_93046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93052 - BLOCK
      ?auto_93053 - BLOCK
      ?auto_93054 - BLOCK
    )
    :vars
    (
      ?auto_93057 - BLOCK
      ?auto_93056 - BLOCK
      ?auto_93058 - BLOCK
      ?auto_93055 - BLOCK
      ?auto_93059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93052 ?auto_93053 ) ) ( not ( = ?auto_93052 ?auto_93054 ) ) ( not ( = ?auto_93053 ?auto_93054 ) ) ( not ( = ?auto_93052 ?auto_93057 ) ) ( not ( = ?auto_93053 ?auto_93057 ) ) ( not ( = ?auto_93054 ?auto_93057 ) ) ( ON-TABLE ?auto_93056 ) ( ON ?auto_93058 ?auto_93056 ) ( not ( = ?auto_93056 ?auto_93058 ) ) ( not ( = ?auto_93056 ?auto_93055 ) ) ( not ( = ?auto_93056 ?auto_93057 ) ) ( not ( = ?auto_93056 ?auto_93054 ) ) ( not ( = ?auto_93056 ?auto_93053 ) ) ( not ( = ?auto_93058 ?auto_93055 ) ) ( not ( = ?auto_93058 ?auto_93057 ) ) ( not ( = ?auto_93058 ?auto_93054 ) ) ( not ( = ?auto_93058 ?auto_93053 ) ) ( not ( = ?auto_93055 ?auto_93057 ) ) ( not ( = ?auto_93055 ?auto_93054 ) ) ( not ( = ?auto_93055 ?auto_93053 ) ) ( not ( = ?auto_93052 ?auto_93056 ) ) ( not ( = ?auto_93052 ?auto_93058 ) ) ( not ( = ?auto_93052 ?auto_93055 ) ) ( ON ?auto_93052 ?auto_93059 ) ( not ( = ?auto_93052 ?auto_93059 ) ) ( not ( = ?auto_93053 ?auto_93059 ) ) ( not ( = ?auto_93054 ?auto_93059 ) ) ( not ( = ?auto_93057 ?auto_93059 ) ) ( not ( = ?auto_93056 ?auto_93059 ) ) ( not ( = ?auto_93058 ?auto_93059 ) ) ( not ( = ?auto_93055 ?auto_93059 ) ) ( ON ?auto_93053 ?auto_93052 ) ( ON-TABLE ?auto_93059 ) ( ON ?auto_93054 ?auto_93053 ) ( ON ?auto_93057 ?auto_93054 ) ( CLEAR ?auto_93057 ) ( HOLDING ?auto_93055 ) ( CLEAR ?auto_93058 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93056 ?auto_93058 ?auto_93055 )
      ( MAKE-3PILE ?auto_93052 ?auto_93053 ?auto_93054 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93060 - BLOCK
      ?auto_93061 - BLOCK
      ?auto_93062 - BLOCK
    )
    :vars
    (
      ?auto_93066 - BLOCK
      ?auto_93067 - BLOCK
      ?auto_93063 - BLOCK
      ?auto_93065 - BLOCK
      ?auto_93064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93060 ?auto_93061 ) ) ( not ( = ?auto_93060 ?auto_93062 ) ) ( not ( = ?auto_93061 ?auto_93062 ) ) ( not ( = ?auto_93060 ?auto_93066 ) ) ( not ( = ?auto_93061 ?auto_93066 ) ) ( not ( = ?auto_93062 ?auto_93066 ) ) ( ON-TABLE ?auto_93067 ) ( ON ?auto_93063 ?auto_93067 ) ( not ( = ?auto_93067 ?auto_93063 ) ) ( not ( = ?auto_93067 ?auto_93065 ) ) ( not ( = ?auto_93067 ?auto_93066 ) ) ( not ( = ?auto_93067 ?auto_93062 ) ) ( not ( = ?auto_93067 ?auto_93061 ) ) ( not ( = ?auto_93063 ?auto_93065 ) ) ( not ( = ?auto_93063 ?auto_93066 ) ) ( not ( = ?auto_93063 ?auto_93062 ) ) ( not ( = ?auto_93063 ?auto_93061 ) ) ( not ( = ?auto_93065 ?auto_93066 ) ) ( not ( = ?auto_93065 ?auto_93062 ) ) ( not ( = ?auto_93065 ?auto_93061 ) ) ( not ( = ?auto_93060 ?auto_93067 ) ) ( not ( = ?auto_93060 ?auto_93063 ) ) ( not ( = ?auto_93060 ?auto_93065 ) ) ( ON ?auto_93060 ?auto_93064 ) ( not ( = ?auto_93060 ?auto_93064 ) ) ( not ( = ?auto_93061 ?auto_93064 ) ) ( not ( = ?auto_93062 ?auto_93064 ) ) ( not ( = ?auto_93066 ?auto_93064 ) ) ( not ( = ?auto_93067 ?auto_93064 ) ) ( not ( = ?auto_93063 ?auto_93064 ) ) ( not ( = ?auto_93065 ?auto_93064 ) ) ( ON ?auto_93061 ?auto_93060 ) ( ON-TABLE ?auto_93064 ) ( ON ?auto_93062 ?auto_93061 ) ( ON ?auto_93066 ?auto_93062 ) ( CLEAR ?auto_93063 ) ( ON ?auto_93065 ?auto_93066 ) ( CLEAR ?auto_93065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93064 ?auto_93060 ?auto_93061 ?auto_93062 ?auto_93066 )
      ( MAKE-3PILE ?auto_93060 ?auto_93061 ?auto_93062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93068 - BLOCK
      ?auto_93069 - BLOCK
      ?auto_93070 - BLOCK
    )
    :vars
    (
      ?auto_93074 - BLOCK
      ?auto_93075 - BLOCK
      ?auto_93073 - BLOCK
      ?auto_93071 - BLOCK
      ?auto_93072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93068 ?auto_93069 ) ) ( not ( = ?auto_93068 ?auto_93070 ) ) ( not ( = ?auto_93069 ?auto_93070 ) ) ( not ( = ?auto_93068 ?auto_93074 ) ) ( not ( = ?auto_93069 ?auto_93074 ) ) ( not ( = ?auto_93070 ?auto_93074 ) ) ( ON-TABLE ?auto_93075 ) ( not ( = ?auto_93075 ?auto_93073 ) ) ( not ( = ?auto_93075 ?auto_93071 ) ) ( not ( = ?auto_93075 ?auto_93074 ) ) ( not ( = ?auto_93075 ?auto_93070 ) ) ( not ( = ?auto_93075 ?auto_93069 ) ) ( not ( = ?auto_93073 ?auto_93071 ) ) ( not ( = ?auto_93073 ?auto_93074 ) ) ( not ( = ?auto_93073 ?auto_93070 ) ) ( not ( = ?auto_93073 ?auto_93069 ) ) ( not ( = ?auto_93071 ?auto_93074 ) ) ( not ( = ?auto_93071 ?auto_93070 ) ) ( not ( = ?auto_93071 ?auto_93069 ) ) ( not ( = ?auto_93068 ?auto_93075 ) ) ( not ( = ?auto_93068 ?auto_93073 ) ) ( not ( = ?auto_93068 ?auto_93071 ) ) ( ON ?auto_93068 ?auto_93072 ) ( not ( = ?auto_93068 ?auto_93072 ) ) ( not ( = ?auto_93069 ?auto_93072 ) ) ( not ( = ?auto_93070 ?auto_93072 ) ) ( not ( = ?auto_93074 ?auto_93072 ) ) ( not ( = ?auto_93075 ?auto_93072 ) ) ( not ( = ?auto_93073 ?auto_93072 ) ) ( not ( = ?auto_93071 ?auto_93072 ) ) ( ON ?auto_93069 ?auto_93068 ) ( ON-TABLE ?auto_93072 ) ( ON ?auto_93070 ?auto_93069 ) ( ON ?auto_93074 ?auto_93070 ) ( ON ?auto_93071 ?auto_93074 ) ( CLEAR ?auto_93071 ) ( HOLDING ?auto_93073 ) ( CLEAR ?auto_93075 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93075 ?auto_93073 )
      ( MAKE-3PILE ?auto_93068 ?auto_93069 ?auto_93070 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93076 - BLOCK
      ?auto_93077 - BLOCK
      ?auto_93078 - BLOCK
    )
    :vars
    (
      ?auto_93082 - BLOCK
      ?auto_93079 - BLOCK
      ?auto_93083 - BLOCK
      ?auto_93081 - BLOCK
      ?auto_93080 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93076 ?auto_93077 ) ) ( not ( = ?auto_93076 ?auto_93078 ) ) ( not ( = ?auto_93077 ?auto_93078 ) ) ( not ( = ?auto_93076 ?auto_93082 ) ) ( not ( = ?auto_93077 ?auto_93082 ) ) ( not ( = ?auto_93078 ?auto_93082 ) ) ( ON-TABLE ?auto_93079 ) ( not ( = ?auto_93079 ?auto_93083 ) ) ( not ( = ?auto_93079 ?auto_93081 ) ) ( not ( = ?auto_93079 ?auto_93082 ) ) ( not ( = ?auto_93079 ?auto_93078 ) ) ( not ( = ?auto_93079 ?auto_93077 ) ) ( not ( = ?auto_93083 ?auto_93081 ) ) ( not ( = ?auto_93083 ?auto_93082 ) ) ( not ( = ?auto_93083 ?auto_93078 ) ) ( not ( = ?auto_93083 ?auto_93077 ) ) ( not ( = ?auto_93081 ?auto_93082 ) ) ( not ( = ?auto_93081 ?auto_93078 ) ) ( not ( = ?auto_93081 ?auto_93077 ) ) ( not ( = ?auto_93076 ?auto_93079 ) ) ( not ( = ?auto_93076 ?auto_93083 ) ) ( not ( = ?auto_93076 ?auto_93081 ) ) ( ON ?auto_93076 ?auto_93080 ) ( not ( = ?auto_93076 ?auto_93080 ) ) ( not ( = ?auto_93077 ?auto_93080 ) ) ( not ( = ?auto_93078 ?auto_93080 ) ) ( not ( = ?auto_93082 ?auto_93080 ) ) ( not ( = ?auto_93079 ?auto_93080 ) ) ( not ( = ?auto_93083 ?auto_93080 ) ) ( not ( = ?auto_93081 ?auto_93080 ) ) ( ON ?auto_93077 ?auto_93076 ) ( ON-TABLE ?auto_93080 ) ( ON ?auto_93078 ?auto_93077 ) ( ON ?auto_93082 ?auto_93078 ) ( ON ?auto_93081 ?auto_93082 ) ( CLEAR ?auto_93079 ) ( ON ?auto_93083 ?auto_93081 ) ( CLEAR ?auto_93083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93080 ?auto_93076 ?auto_93077 ?auto_93078 ?auto_93082 ?auto_93081 )
      ( MAKE-3PILE ?auto_93076 ?auto_93077 ?auto_93078 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93084 - BLOCK
      ?auto_93085 - BLOCK
      ?auto_93086 - BLOCK
    )
    :vars
    (
      ?auto_93089 - BLOCK
      ?auto_93087 - BLOCK
      ?auto_93091 - BLOCK
      ?auto_93090 - BLOCK
      ?auto_93088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93084 ?auto_93085 ) ) ( not ( = ?auto_93084 ?auto_93086 ) ) ( not ( = ?auto_93085 ?auto_93086 ) ) ( not ( = ?auto_93084 ?auto_93089 ) ) ( not ( = ?auto_93085 ?auto_93089 ) ) ( not ( = ?auto_93086 ?auto_93089 ) ) ( not ( = ?auto_93087 ?auto_93091 ) ) ( not ( = ?auto_93087 ?auto_93090 ) ) ( not ( = ?auto_93087 ?auto_93089 ) ) ( not ( = ?auto_93087 ?auto_93086 ) ) ( not ( = ?auto_93087 ?auto_93085 ) ) ( not ( = ?auto_93091 ?auto_93090 ) ) ( not ( = ?auto_93091 ?auto_93089 ) ) ( not ( = ?auto_93091 ?auto_93086 ) ) ( not ( = ?auto_93091 ?auto_93085 ) ) ( not ( = ?auto_93090 ?auto_93089 ) ) ( not ( = ?auto_93090 ?auto_93086 ) ) ( not ( = ?auto_93090 ?auto_93085 ) ) ( not ( = ?auto_93084 ?auto_93087 ) ) ( not ( = ?auto_93084 ?auto_93091 ) ) ( not ( = ?auto_93084 ?auto_93090 ) ) ( ON ?auto_93084 ?auto_93088 ) ( not ( = ?auto_93084 ?auto_93088 ) ) ( not ( = ?auto_93085 ?auto_93088 ) ) ( not ( = ?auto_93086 ?auto_93088 ) ) ( not ( = ?auto_93089 ?auto_93088 ) ) ( not ( = ?auto_93087 ?auto_93088 ) ) ( not ( = ?auto_93091 ?auto_93088 ) ) ( not ( = ?auto_93090 ?auto_93088 ) ) ( ON ?auto_93085 ?auto_93084 ) ( ON-TABLE ?auto_93088 ) ( ON ?auto_93086 ?auto_93085 ) ( ON ?auto_93089 ?auto_93086 ) ( ON ?auto_93090 ?auto_93089 ) ( ON ?auto_93091 ?auto_93090 ) ( CLEAR ?auto_93091 ) ( HOLDING ?auto_93087 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93087 )
      ( MAKE-3PILE ?auto_93084 ?auto_93085 ?auto_93086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93092 - BLOCK
      ?auto_93093 - BLOCK
      ?auto_93094 - BLOCK
    )
    :vars
    (
      ?auto_93095 - BLOCK
      ?auto_93097 - BLOCK
      ?auto_93099 - BLOCK
      ?auto_93096 - BLOCK
      ?auto_93098 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93092 ?auto_93093 ) ) ( not ( = ?auto_93092 ?auto_93094 ) ) ( not ( = ?auto_93093 ?auto_93094 ) ) ( not ( = ?auto_93092 ?auto_93095 ) ) ( not ( = ?auto_93093 ?auto_93095 ) ) ( not ( = ?auto_93094 ?auto_93095 ) ) ( not ( = ?auto_93097 ?auto_93099 ) ) ( not ( = ?auto_93097 ?auto_93096 ) ) ( not ( = ?auto_93097 ?auto_93095 ) ) ( not ( = ?auto_93097 ?auto_93094 ) ) ( not ( = ?auto_93097 ?auto_93093 ) ) ( not ( = ?auto_93099 ?auto_93096 ) ) ( not ( = ?auto_93099 ?auto_93095 ) ) ( not ( = ?auto_93099 ?auto_93094 ) ) ( not ( = ?auto_93099 ?auto_93093 ) ) ( not ( = ?auto_93096 ?auto_93095 ) ) ( not ( = ?auto_93096 ?auto_93094 ) ) ( not ( = ?auto_93096 ?auto_93093 ) ) ( not ( = ?auto_93092 ?auto_93097 ) ) ( not ( = ?auto_93092 ?auto_93099 ) ) ( not ( = ?auto_93092 ?auto_93096 ) ) ( ON ?auto_93092 ?auto_93098 ) ( not ( = ?auto_93092 ?auto_93098 ) ) ( not ( = ?auto_93093 ?auto_93098 ) ) ( not ( = ?auto_93094 ?auto_93098 ) ) ( not ( = ?auto_93095 ?auto_93098 ) ) ( not ( = ?auto_93097 ?auto_93098 ) ) ( not ( = ?auto_93099 ?auto_93098 ) ) ( not ( = ?auto_93096 ?auto_93098 ) ) ( ON ?auto_93093 ?auto_93092 ) ( ON-TABLE ?auto_93098 ) ( ON ?auto_93094 ?auto_93093 ) ( ON ?auto_93095 ?auto_93094 ) ( ON ?auto_93096 ?auto_93095 ) ( ON ?auto_93099 ?auto_93096 ) ( ON ?auto_93097 ?auto_93099 ) ( CLEAR ?auto_93097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93098 ?auto_93092 ?auto_93093 ?auto_93094 ?auto_93095 ?auto_93096 ?auto_93099 )
      ( MAKE-3PILE ?auto_93092 ?auto_93093 ?auto_93094 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93119 - BLOCK
      ?auto_93120 - BLOCK
      ?auto_93121 - BLOCK
    )
    :vars
    (
      ?auto_93124 - BLOCK
      ?auto_93123 - BLOCK
      ?auto_93122 - BLOCK
      ?auto_93125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93124 ?auto_93121 ) ( ON-TABLE ?auto_93119 ) ( ON ?auto_93120 ?auto_93119 ) ( ON ?auto_93121 ?auto_93120 ) ( not ( = ?auto_93119 ?auto_93120 ) ) ( not ( = ?auto_93119 ?auto_93121 ) ) ( not ( = ?auto_93119 ?auto_93124 ) ) ( not ( = ?auto_93120 ?auto_93121 ) ) ( not ( = ?auto_93120 ?auto_93124 ) ) ( not ( = ?auto_93121 ?auto_93124 ) ) ( not ( = ?auto_93119 ?auto_93123 ) ) ( not ( = ?auto_93119 ?auto_93122 ) ) ( not ( = ?auto_93120 ?auto_93123 ) ) ( not ( = ?auto_93120 ?auto_93122 ) ) ( not ( = ?auto_93121 ?auto_93123 ) ) ( not ( = ?auto_93121 ?auto_93122 ) ) ( not ( = ?auto_93124 ?auto_93123 ) ) ( not ( = ?auto_93124 ?auto_93122 ) ) ( not ( = ?auto_93123 ?auto_93122 ) ) ( ON ?auto_93123 ?auto_93124 ) ( CLEAR ?auto_93123 ) ( HOLDING ?auto_93122 ) ( CLEAR ?auto_93125 ) ( ON-TABLE ?auto_93125 ) ( not ( = ?auto_93125 ?auto_93122 ) ) ( not ( = ?auto_93119 ?auto_93125 ) ) ( not ( = ?auto_93120 ?auto_93125 ) ) ( not ( = ?auto_93121 ?auto_93125 ) ) ( not ( = ?auto_93124 ?auto_93125 ) ) ( not ( = ?auto_93123 ?auto_93125 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93125 ?auto_93122 )
      ( MAKE-3PILE ?auto_93119 ?auto_93120 ?auto_93121 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93126 - BLOCK
      ?auto_93127 - BLOCK
      ?auto_93128 - BLOCK
    )
    :vars
    (
      ?auto_93131 - BLOCK
      ?auto_93130 - BLOCK
      ?auto_93132 - BLOCK
      ?auto_93129 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93131 ?auto_93128 ) ( ON-TABLE ?auto_93126 ) ( ON ?auto_93127 ?auto_93126 ) ( ON ?auto_93128 ?auto_93127 ) ( not ( = ?auto_93126 ?auto_93127 ) ) ( not ( = ?auto_93126 ?auto_93128 ) ) ( not ( = ?auto_93126 ?auto_93131 ) ) ( not ( = ?auto_93127 ?auto_93128 ) ) ( not ( = ?auto_93127 ?auto_93131 ) ) ( not ( = ?auto_93128 ?auto_93131 ) ) ( not ( = ?auto_93126 ?auto_93130 ) ) ( not ( = ?auto_93126 ?auto_93132 ) ) ( not ( = ?auto_93127 ?auto_93130 ) ) ( not ( = ?auto_93127 ?auto_93132 ) ) ( not ( = ?auto_93128 ?auto_93130 ) ) ( not ( = ?auto_93128 ?auto_93132 ) ) ( not ( = ?auto_93131 ?auto_93130 ) ) ( not ( = ?auto_93131 ?auto_93132 ) ) ( not ( = ?auto_93130 ?auto_93132 ) ) ( ON ?auto_93130 ?auto_93131 ) ( CLEAR ?auto_93129 ) ( ON-TABLE ?auto_93129 ) ( not ( = ?auto_93129 ?auto_93132 ) ) ( not ( = ?auto_93126 ?auto_93129 ) ) ( not ( = ?auto_93127 ?auto_93129 ) ) ( not ( = ?auto_93128 ?auto_93129 ) ) ( not ( = ?auto_93131 ?auto_93129 ) ) ( not ( = ?auto_93130 ?auto_93129 ) ) ( ON ?auto_93132 ?auto_93130 ) ( CLEAR ?auto_93132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93126 ?auto_93127 ?auto_93128 ?auto_93131 ?auto_93130 )
      ( MAKE-3PILE ?auto_93126 ?auto_93127 ?auto_93128 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93133 - BLOCK
      ?auto_93134 - BLOCK
      ?auto_93135 - BLOCK
    )
    :vars
    (
      ?auto_93137 - BLOCK
      ?auto_93136 - BLOCK
      ?auto_93139 - BLOCK
      ?auto_93138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93137 ?auto_93135 ) ( ON-TABLE ?auto_93133 ) ( ON ?auto_93134 ?auto_93133 ) ( ON ?auto_93135 ?auto_93134 ) ( not ( = ?auto_93133 ?auto_93134 ) ) ( not ( = ?auto_93133 ?auto_93135 ) ) ( not ( = ?auto_93133 ?auto_93137 ) ) ( not ( = ?auto_93134 ?auto_93135 ) ) ( not ( = ?auto_93134 ?auto_93137 ) ) ( not ( = ?auto_93135 ?auto_93137 ) ) ( not ( = ?auto_93133 ?auto_93136 ) ) ( not ( = ?auto_93133 ?auto_93139 ) ) ( not ( = ?auto_93134 ?auto_93136 ) ) ( not ( = ?auto_93134 ?auto_93139 ) ) ( not ( = ?auto_93135 ?auto_93136 ) ) ( not ( = ?auto_93135 ?auto_93139 ) ) ( not ( = ?auto_93137 ?auto_93136 ) ) ( not ( = ?auto_93137 ?auto_93139 ) ) ( not ( = ?auto_93136 ?auto_93139 ) ) ( ON ?auto_93136 ?auto_93137 ) ( not ( = ?auto_93138 ?auto_93139 ) ) ( not ( = ?auto_93133 ?auto_93138 ) ) ( not ( = ?auto_93134 ?auto_93138 ) ) ( not ( = ?auto_93135 ?auto_93138 ) ) ( not ( = ?auto_93137 ?auto_93138 ) ) ( not ( = ?auto_93136 ?auto_93138 ) ) ( ON ?auto_93139 ?auto_93136 ) ( CLEAR ?auto_93139 ) ( HOLDING ?auto_93138 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93138 )
      ( MAKE-3PILE ?auto_93133 ?auto_93134 ?auto_93135 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93150 - BLOCK
      ?auto_93151 - BLOCK
      ?auto_93152 - BLOCK
    )
    :vars
    (
      ?auto_93153 - BLOCK
      ?auto_93155 - BLOCK
      ?auto_93156 - BLOCK
      ?auto_93154 - BLOCK
      ?auto_93157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93153 ?auto_93152 ) ( ON-TABLE ?auto_93150 ) ( ON ?auto_93151 ?auto_93150 ) ( ON ?auto_93152 ?auto_93151 ) ( not ( = ?auto_93150 ?auto_93151 ) ) ( not ( = ?auto_93150 ?auto_93152 ) ) ( not ( = ?auto_93150 ?auto_93153 ) ) ( not ( = ?auto_93151 ?auto_93152 ) ) ( not ( = ?auto_93151 ?auto_93153 ) ) ( not ( = ?auto_93152 ?auto_93153 ) ) ( not ( = ?auto_93150 ?auto_93155 ) ) ( not ( = ?auto_93150 ?auto_93156 ) ) ( not ( = ?auto_93151 ?auto_93155 ) ) ( not ( = ?auto_93151 ?auto_93156 ) ) ( not ( = ?auto_93152 ?auto_93155 ) ) ( not ( = ?auto_93152 ?auto_93156 ) ) ( not ( = ?auto_93153 ?auto_93155 ) ) ( not ( = ?auto_93153 ?auto_93156 ) ) ( not ( = ?auto_93155 ?auto_93156 ) ) ( ON ?auto_93155 ?auto_93153 ) ( not ( = ?auto_93154 ?auto_93156 ) ) ( not ( = ?auto_93150 ?auto_93154 ) ) ( not ( = ?auto_93151 ?auto_93154 ) ) ( not ( = ?auto_93152 ?auto_93154 ) ) ( not ( = ?auto_93153 ?auto_93154 ) ) ( not ( = ?auto_93155 ?auto_93154 ) ) ( ON ?auto_93156 ?auto_93155 ) ( CLEAR ?auto_93156 ) ( ON ?auto_93154 ?auto_93157 ) ( CLEAR ?auto_93154 ) ( HAND-EMPTY ) ( not ( = ?auto_93150 ?auto_93157 ) ) ( not ( = ?auto_93151 ?auto_93157 ) ) ( not ( = ?auto_93152 ?auto_93157 ) ) ( not ( = ?auto_93153 ?auto_93157 ) ) ( not ( = ?auto_93155 ?auto_93157 ) ) ( not ( = ?auto_93156 ?auto_93157 ) ) ( not ( = ?auto_93154 ?auto_93157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93154 ?auto_93157 )
      ( MAKE-3PILE ?auto_93150 ?auto_93151 ?auto_93152 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_93158 - BLOCK
      ?auto_93159 - BLOCK
      ?auto_93160 - BLOCK
    )
    :vars
    (
      ?auto_93164 - BLOCK
      ?auto_93162 - BLOCK
      ?auto_93163 - BLOCK
      ?auto_93165 - BLOCK
      ?auto_93161 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93164 ?auto_93160 ) ( ON-TABLE ?auto_93158 ) ( ON ?auto_93159 ?auto_93158 ) ( ON ?auto_93160 ?auto_93159 ) ( not ( = ?auto_93158 ?auto_93159 ) ) ( not ( = ?auto_93158 ?auto_93160 ) ) ( not ( = ?auto_93158 ?auto_93164 ) ) ( not ( = ?auto_93159 ?auto_93160 ) ) ( not ( = ?auto_93159 ?auto_93164 ) ) ( not ( = ?auto_93160 ?auto_93164 ) ) ( not ( = ?auto_93158 ?auto_93162 ) ) ( not ( = ?auto_93158 ?auto_93163 ) ) ( not ( = ?auto_93159 ?auto_93162 ) ) ( not ( = ?auto_93159 ?auto_93163 ) ) ( not ( = ?auto_93160 ?auto_93162 ) ) ( not ( = ?auto_93160 ?auto_93163 ) ) ( not ( = ?auto_93164 ?auto_93162 ) ) ( not ( = ?auto_93164 ?auto_93163 ) ) ( not ( = ?auto_93162 ?auto_93163 ) ) ( ON ?auto_93162 ?auto_93164 ) ( not ( = ?auto_93165 ?auto_93163 ) ) ( not ( = ?auto_93158 ?auto_93165 ) ) ( not ( = ?auto_93159 ?auto_93165 ) ) ( not ( = ?auto_93160 ?auto_93165 ) ) ( not ( = ?auto_93164 ?auto_93165 ) ) ( not ( = ?auto_93162 ?auto_93165 ) ) ( ON ?auto_93165 ?auto_93161 ) ( CLEAR ?auto_93165 ) ( not ( = ?auto_93158 ?auto_93161 ) ) ( not ( = ?auto_93159 ?auto_93161 ) ) ( not ( = ?auto_93160 ?auto_93161 ) ) ( not ( = ?auto_93164 ?auto_93161 ) ) ( not ( = ?auto_93162 ?auto_93161 ) ) ( not ( = ?auto_93163 ?auto_93161 ) ) ( not ( = ?auto_93165 ?auto_93161 ) ) ( HOLDING ?auto_93163 ) ( CLEAR ?auto_93162 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93158 ?auto_93159 ?auto_93160 ?auto_93164 ?auto_93162 ?auto_93163 )
      ( MAKE-3PILE ?auto_93158 ?auto_93159 ?auto_93160 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93220 - BLOCK
      ?auto_93221 - BLOCK
      ?auto_93222 - BLOCK
      ?auto_93223 - BLOCK
    )
    :vars
    (
      ?auto_93224 - BLOCK
      ?auto_93226 - BLOCK
      ?auto_93225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93220 ) ( ON ?auto_93221 ?auto_93220 ) ( not ( = ?auto_93220 ?auto_93221 ) ) ( not ( = ?auto_93220 ?auto_93222 ) ) ( not ( = ?auto_93220 ?auto_93223 ) ) ( not ( = ?auto_93221 ?auto_93222 ) ) ( not ( = ?auto_93221 ?auto_93223 ) ) ( not ( = ?auto_93222 ?auto_93223 ) ) ( ON ?auto_93223 ?auto_93224 ) ( not ( = ?auto_93220 ?auto_93224 ) ) ( not ( = ?auto_93221 ?auto_93224 ) ) ( not ( = ?auto_93222 ?auto_93224 ) ) ( not ( = ?auto_93223 ?auto_93224 ) ) ( CLEAR ?auto_93221 ) ( ON ?auto_93222 ?auto_93223 ) ( CLEAR ?auto_93222 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93226 ) ( ON ?auto_93225 ?auto_93226 ) ( ON ?auto_93224 ?auto_93225 ) ( not ( = ?auto_93226 ?auto_93225 ) ) ( not ( = ?auto_93226 ?auto_93224 ) ) ( not ( = ?auto_93226 ?auto_93223 ) ) ( not ( = ?auto_93226 ?auto_93222 ) ) ( not ( = ?auto_93225 ?auto_93224 ) ) ( not ( = ?auto_93225 ?auto_93223 ) ) ( not ( = ?auto_93225 ?auto_93222 ) ) ( not ( = ?auto_93220 ?auto_93226 ) ) ( not ( = ?auto_93220 ?auto_93225 ) ) ( not ( = ?auto_93221 ?auto_93226 ) ) ( not ( = ?auto_93221 ?auto_93225 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93226 ?auto_93225 ?auto_93224 ?auto_93223 )
      ( MAKE-4PILE ?auto_93220 ?auto_93221 ?auto_93222 ?auto_93223 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93227 - BLOCK
      ?auto_93228 - BLOCK
      ?auto_93229 - BLOCK
      ?auto_93230 - BLOCK
    )
    :vars
    (
      ?auto_93233 - BLOCK
      ?auto_93232 - BLOCK
      ?auto_93231 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93227 ) ( not ( = ?auto_93227 ?auto_93228 ) ) ( not ( = ?auto_93227 ?auto_93229 ) ) ( not ( = ?auto_93227 ?auto_93230 ) ) ( not ( = ?auto_93228 ?auto_93229 ) ) ( not ( = ?auto_93228 ?auto_93230 ) ) ( not ( = ?auto_93229 ?auto_93230 ) ) ( ON ?auto_93230 ?auto_93233 ) ( not ( = ?auto_93227 ?auto_93233 ) ) ( not ( = ?auto_93228 ?auto_93233 ) ) ( not ( = ?auto_93229 ?auto_93233 ) ) ( not ( = ?auto_93230 ?auto_93233 ) ) ( ON ?auto_93229 ?auto_93230 ) ( CLEAR ?auto_93229 ) ( ON-TABLE ?auto_93232 ) ( ON ?auto_93231 ?auto_93232 ) ( ON ?auto_93233 ?auto_93231 ) ( not ( = ?auto_93232 ?auto_93231 ) ) ( not ( = ?auto_93232 ?auto_93233 ) ) ( not ( = ?auto_93232 ?auto_93230 ) ) ( not ( = ?auto_93232 ?auto_93229 ) ) ( not ( = ?auto_93231 ?auto_93233 ) ) ( not ( = ?auto_93231 ?auto_93230 ) ) ( not ( = ?auto_93231 ?auto_93229 ) ) ( not ( = ?auto_93227 ?auto_93232 ) ) ( not ( = ?auto_93227 ?auto_93231 ) ) ( not ( = ?auto_93228 ?auto_93232 ) ) ( not ( = ?auto_93228 ?auto_93231 ) ) ( HOLDING ?auto_93228 ) ( CLEAR ?auto_93227 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93227 ?auto_93228 )
      ( MAKE-4PILE ?auto_93227 ?auto_93228 ?auto_93229 ?auto_93230 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93234 - BLOCK
      ?auto_93235 - BLOCK
      ?auto_93236 - BLOCK
      ?auto_93237 - BLOCK
    )
    :vars
    (
      ?auto_93239 - BLOCK
      ?auto_93238 - BLOCK
      ?auto_93240 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93234 ) ( not ( = ?auto_93234 ?auto_93235 ) ) ( not ( = ?auto_93234 ?auto_93236 ) ) ( not ( = ?auto_93234 ?auto_93237 ) ) ( not ( = ?auto_93235 ?auto_93236 ) ) ( not ( = ?auto_93235 ?auto_93237 ) ) ( not ( = ?auto_93236 ?auto_93237 ) ) ( ON ?auto_93237 ?auto_93239 ) ( not ( = ?auto_93234 ?auto_93239 ) ) ( not ( = ?auto_93235 ?auto_93239 ) ) ( not ( = ?auto_93236 ?auto_93239 ) ) ( not ( = ?auto_93237 ?auto_93239 ) ) ( ON ?auto_93236 ?auto_93237 ) ( ON-TABLE ?auto_93238 ) ( ON ?auto_93240 ?auto_93238 ) ( ON ?auto_93239 ?auto_93240 ) ( not ( = ?auto_93238 ?auto_93240 ) ) ( not ( = ?auto_93238 ?auto_93239 ) ) ( not ( = ?auto_93238 ?auto_93237 ) ) ( not ( = ?auto_93238 ?auto_93236 ) ) ( not ( = ?auto_93240 ?auto_93239 ) ) ( not ( = ?auto_93240 ?auto_93237 ) ) ( not ( = ?auto_93240 ?auto_93236 ) ) ( not ( = ?auto_93234 ?auto_93238 ) ) ( not ( = ?auto_93234 ?auto_93240 ) ) ( not ( = ?auto_93235 ?auto_93238 ) ) ( not ( = ?auto_93235 ?auto_93240 ) ) ( CLEAR ?auto_93234 ) ( ON ?auto_93235 ?auto_93236 ) ( CLEAR ?auto_93235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93238 ?auto_93240 ?auto_93239 ?auto_93237 ?auto_93236 )
      ( MAKE-4PILE ?auto_93234 ?auto_93235 ?auto_93236 ?auto_93237 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93241 - BLOCK
      ?auto_93242 - BLOCK
      ?auto_93243 - BLOCK
      ?auto_93244 - BLOCK
    )
    :vars
    (
      ?auto_93245 - BLOCK
      ?auto_93246 - BLOCK
      ?auto_93247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93241 ?auto_93242 ) ) ( not ( = ?auto_93241 ?auto_93243 ) ) ( not ( = ?auto_93241 ?auto_93244 ) ) ( not ( = ?auto_93242 ?auto_93243 ) ) ( not ( = ?auto_93242 ?auto_93244 ) ) ( not ( = ?auto_93243 ?auto_93244 ) ) ( ON ?auto_93244 ?auto_93245 ) ( not ( = ?auto_93241 ?auto_93245 ) ) ( not ( = ?auto_93242 ?auto_93245 ) ) ( not ( = ?auto_93243 ?auto_93245 ) ) ( not ( = ?auto_93244 ?auto_93245 ) ) ( ON ?auto_93243 ?auto_93244 ) ( ON-TABLE ?auto_93246 ) ( ON ?auto_93247 ?auto_93246 ) ( ON ?auto_93245 ?auto_93247 ) ( not ( = ?auto_93246 ?auto_93247 ) ) ( not ( = ?auto_93246 ?auto_93245 ) ) ( not ( = ?auto_93246 ?auto_93244 ) ) ( not ( = ?auto_93246 ?auto_93243 ) ) ( not ( = ?auto_93247 ?auto_93245 ) ) ( not ( = ?auto_93247 ?auto_93244 ) ) ( not ( = ?auto_93247 ?auto_93243 ) ) ( not ( = ?auto_93241 ?auto_93246 ) ) ( not ( = ?auto_93241 ?auto_93247 ) ) ( not ( = ?auto_93242 ?auto_93246 ) ) ( not ( = ?auto_93242 ?auto_93247 ) ) ( ON ?auto_93242 ?auto_93243 ) ( CLEAR ?auto_93242 ) ( HOLDING ?auto_93241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93241 )
      ( MAKE-4PILE ?auto_93241 ?auto_93242 ?auto_93243 ?auto_93244 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93248 - BLOCK
      ?auto_93249 - BLOCK
      ?auto_93250 - BLOCK
      ?auto_93251 - BLOCK
    )
    :vars
    (
      ?auto_93253 - BLOCK
      ?auto_93252 - BLOCK
      ?auto_93254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93248 ?auto_93249 ) ) ( not ( = ?auto_93248 ?auto_93250 ) ) ( not ( = ?auto_93248 ?auto_93251 ) ) ( not ( = ?auto_93249 ?auto_93250 ) ) ( not ( = ?auto_93249 ?auto_93251 ) ) ( not ( = ?auto_93250 ?auto_93251 ) ) ( ON ?auto_93251 ?auto_93253 ) ( not ( = ?auto_93248 ?auto_93253 ) ) ( not ( = ?auto_93249 ?auto_93253 ) ) ( not ( = ?auto_93250 ?auto_93253 ) ) ( not ( = ?auto_93251 ?auto_93253 ) ) ( ON ?auto_93250 ?auto_93251 ) ( ON-TABLE ?auto_93252 ) ( ON ?auto_93254 ?auto_93252 ) ( ON ?auto_93253 ?auto_93254 ) ( not ( = ?auto_93252 ?auto_93254 ) ) ( not ( = ?auto_93252 ?auto_93253 ) ) ( not ( = ?auto_93252 ?auto_93251 ) ) ( not ( = ?auto_93252 ?auto_93250 ) ) ( not ( = ?auto_93254 ?auto_93253 ) ) ( not ( = ?auto_93254 ?auto_93251 ) ) ( not ( = ?auto_93254 ?auto_93250 ) ) ( not ( = ?auto_93248 ?auto_93252 ) ) ( not ( = ?auto_93248 ?auto_93254 ) ) ( not ( = ?auto_93249 ?auto_93252 ) ) ( not ( = ?auto_93249 ?auto_93254 ) ) ( ON ?auto_93249 ?auto_93250 ) ( ON ?auto_93248 ?auto_93249 ) ( CLEAR ?auto_93248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93252 ?auto_93254 ?auto_93253 ?auto_93251 ?auto_93250 ?auto_93249 )
      ( MAKE-4PILE ?auto_93248 ?auto_93249 ?auto_93250 ?auto_93251 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93259 - BLOCK
      ?auto_93260 - BLOCK
      ?auto_93261 - BLOCK
      ?auto_93262 - BLOCK
    )
    :vars
    (
      ?auto_93263 - BLOCK
      ?auto_93265 - BLOCK
      ?auto_93264 - BLOCK
      ?auto_93266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93259 ?auto_93260 ) ) ( not ( = ?auto_93259 ?auto_93261 ) ) ( not ( = ?auto_93259 ?auto_93262 ) ) ( not ( = ?auto_93260 ?auto_93261 ) ) ( not ( = ?auto_93260 ?auto_93262 ) ) ( not ( = ?auto_93261 ?auto_93262 ) ) ( ON ?auto_93262 ?auto_93263 ) ( not ( = ?auto_93259 ?auto_93263 ) ) ( not ( = ?auto_93260 ?auto_93263 ) ) ( not ( = ?auto_93261 ?auto_93263 ) ) ( not ( = ?auto_93262 ?auto_93263 ) ) ( ON ?auto_93261 ?auto_93262 ) ( ON-TABLE ?auto_93265 ) ( ON ?auto_93264 ?auto_93265 ) ( ON ?auto_93263 ?auto_93264 ) ( not ( = ?auto_93265 ?auto_93264 ) ) ( not ( = ?auto_93265 ?auto_93263 ) ) ( not ( = ?auto_93265 ?auto_93262 ) ) ( not ( = ?auto_93265 ?auto_93261 ) ) ( not ( = ?auto_93264 ?auto_93263 ) ) ( not ( = ?auto_93264 ?auto_93262 ) ) ( not ( = ?auto_93264 ?auto_93261 ) ) ( not ( = ?auto_93259 ?auto_93265 ) ) ( not ( = ?auto_93259 ?auto_93264 ) ) ( not ( = ?auto_93260 ?auto_93265 ) ) ( not ( = ?auto_93260 ?auto_93264 ) ) ( ON ?auto_93260 ?auto_93261 ) ( CLEAR ?auto_93260 ) ( ON ?auto_93259 ?auto_93266 ) ( CLEAR ?auto_93259 ) ( HAND-EMPTY ) ( not ( = ?auto_93259 ?auto_93266 ) ) ( not ( = ?auto_93260 ?auto_93266 ) ) ( not ( = ?auto_93261 ?auto_93266 ) ) ( not ( = ?auto_93262 ?auto_93266 ) ) ( not ( = ?auto_93263 ?auto_93266 ) ) ( not ( = ?auto_93265 ?auto_93266 ) ) ( not ( = ?auto_93264 ?auto_93266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93259 ?auto_93266 )
      ( MAKE-4PILE ?auto_93259 ?auto_93260 ?auto_93261 ?auto_93262 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93267 - BLOCK
      ?auto_93268 - BLOCK
      ?auto_93269 - BLOCK
      ?auto_93270 - BLOCK
    )
    :vars
    (
      ?auto_93272 - BLOCK
      ?auto_93273 - BLOCK
      ?auto_93274 - BLOCK
      ?auto_93271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93267 ?auto_93268 ) ) ( not ( = ?auto_93267 ?auto_93269 ) ) ( not ( = ?auto_93267 ?auto_93270 ) ) ( not ( = ?auto_93268 ?auto_93269 ) ) ( not ( = ?auto_93268 ?auto_93270 ) ) ( not ( = ?auto_93269 ?auto_93270 ) ) ( ON ?auto_93270 ?auto_93272 ) ( not ( = ?auto_93267 ?auto_93272 ) ) ( not ( = ?auto_93268 ?auto_93272 ) ) ( not ( = ?auto_93269 ?auto_93272 ) ) ( not ( = ?auto_93270 ?auto_93272 ) ) ( ON ?auto_93269 ?auto_93270 ) ( ON-TABLE ?auto_93273 ) ( ON ?auto_93274 ?auto_93273 ) ( ON ?auto_93272 ?auto_93274 ) ( not ( = ?auto_93273 ?auto_93274 ) ) ( not ( = ?auto_93273 ?auto_93272 ) ) ( not ( = ?auto_93273 ?auto_93270 ) ) ( not ( = ?auto_93273 ?auto_93269 ) ) ( not ( = ?auto_93274 ?auto_93272 ) ) ( not ( = ?auto_93274 ?auto_93270 ) ) ( not ( = ?auto_93274 ?auto_93269 ) ) ( not ( = ?auto_93267 ?auto_93273 ) ) ( not ( = ?auto_93267 ?auto_93274 ) ) ( not ( = ?auto_93268 ?auto_93273 ) ) ( not ( = ?auto_93268 ?auto_93274 ) ) ( ON ?auto_93267 ?auto_93271 ) ( CLEAR ?auto_93267 ) ( not ( = ?auto_93267 ?auto_93271 ) ) ( not ( = ?auto_93268 ?auto_93271 ) ) ( not ( = ?auto_93269 ?auto_93271 ) ) ( not ( = ?auto_93270 ?auto_93271 ) ) ( not ( = ?auto_93272 ?auto_93271 ) ) ( not ( = ?auto_93273 ?auto_93271 ) ) ( not ( = ?auto_93274 ?auto_93271 ) ) ( HOLDING ?auto_93268 ) ( CLEAR ?auto_93269 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93273 ?auto_93274 ?auto_93272 ?auto_93270 ?auto_93269 ?auto_93268 )
      ( MAKE-4PILE ?auto_93267 ?auto_93268 ?auto_93269 ?auto_93270 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93275 - BLOCK
      ?auto_93276 - BLOCK
      ?auto_93277 - BLOCK
      ?auto_93278 - BLOCK
    )
    :vars
    (
      ?auto_93281 - BLOCK
      ?auto_93282 - BLOCK
      ?auto_93280 - BLOCK
      ?auto_93279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93275 ?auto_93276 ) ) ( not ( = ?auto_93275 ?auto_93277 ) ) ( not ( = ?auto_93275 ?auto_93278 ) ) ( not ( = ?auto_93276 ?auto_93277 ) ) ( not ( = ?auto_93276 ?auto_93278 ) ) ( not ( = ?auto_93277 ?auto_93278 ) ) ( ON ?auto_93278 ?auto_93281 ) ( not ( = ?auto_93275 ?auto_93281 ) ) ( not ( = ?auto_93276 ?auto_93281 ) ) ( not ( = ?auto_93277 ?auto_93281 ) ) ( not ( = ?auto_93278 ?auto_93281 ) ) ( ON ?auto_93277 ?auto_93278 ) ( ON-TABLE ?auto_93282 ) ( ON ?auto_93280 ?auto_93282 ) ( ON ?auto_93281 ?auto_93280 ) ( not ( = ?auto_93282 ?auto_93280 ) ) ( not ( = ?auto_93282 ?auto_93281 ) ) ( not ( = ?auto_93282 ?auto_93278 ) ) ( not ( = ?auto_93282 ?auto_93277 ) ) ( not ( = ?auto_93280 ?auto_93281 ) ) ( not ( = ?auto_93280 ?auto_93278 ) ) ( not ( = ?auto_93280 ?auto_93277 ) ) ( not ( = ?auto_93275 ?auto_93282 ) ) ( not ( = ?auto_93275 ?auto_93280 ) ) ( not ( = ?auto_93276 ?auto_93282 ) ) ( not ( = ?auto_93276 ?auto_93280 ) ) ( ON ?auto_93275 ?auto_93279 ) ( not ( = ?auto_93275 ?auto_93279 ) ) ( not ( = ?auto_93276 ?auto_93279 ) ) ( not ( = ?auto_93277 ?auto_93279 ) ) ( not ( = ?auto_93278 ?auto_93279 ) ) ( not ( = ?auto_93281 ?auto_93279 ) ) ( not ( = ?auto_93282 ?auto_93279 ) ) ( not ( = ?auto_93280 ?auto_93279 ) ) ( CLEAR ?auto_93277 ) ( ON ?auto_93276 ?auto_93275 ) ( CLEAR ?auto_93276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93279 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93279 ?auto_93275 )
      ( MAKE-4PILE ?auto_93275 ?auto_93276 ?auto_93277 ?auto_93278 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93283 - BLOCK
      ?auto_93284 - BLOCK
      ?auto_93285 - BLOCK
      ?auto_93286 - BLOCK
    )
    :vars
    (
      ?auto_93288 - BLOCK
      ?auto_93289 - BLOCK
      ?auto_93290 - BLOCK
      ?auto_93287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93283 ?auto_93284 ) ) ( not ( = ?auto_93283 ?auto_93285 ) ) ( not ( = ?auto_93283 ?auto_93286 ) ) ( not ( = ?auto_93284 ?auto_93285 ) ) ( not ( = ?auto_93284 ?auto_93286 ) ) ( not ( = ?auto_93285 ?auto_93286 ) ) ( ON ?auto_93286 ?auto_93288 ) ( not ( = ?auto_93283 ?auto_93288 ) ) ( not ( = ?auto_93284 ?auto_93288 ) ) ( not ( = ?auto_93285 ?auto_93288 ) ) ( not ( = ?auto_93286 ?auto_93288 ) ) ( ON-TABLE ?auto_93289 ) ( ON ?auto_93290 ?auto_93289 ) ( ON ?auto_93288 ?auto_93290 ) ( not ( = ?auto_93289 ?auto_93290 ) ) ( not ( = ?auto_93289 ?auto_93288 ) ) ( not ( = ?auto_93289 ?auto_93286 ) ) ( not ( = ?auto_93289 ?auto_93285 ) ) ( not ( = ?auto_93290 ?auto_93288 ) ) ( not ( = ?auto_93290 ?auto_93286 ) ) ( not ( = ?auto_93290 ?auto_93285 ) ) ( not ( = ?auto_93283 ?auto_93289 ) ) ( not ( = ?auto_93283 ?auto_93290 ) ) ( not ( = ?auto_93284 ?auto_93289 ) ) ( not ( = ?auto_93284 ?auto_93290 ) ) ( ON ?auto_93283 ?auto_93287 ) ( not ( = ?auto_93283 ?auto_93287 ) ) ( not ( = ?auto_93284 ?auto_93287 ) ) ( not ( = ?auto_93285 ?auto_93287 ) ) ( not ( = ?auto_93286 ?auto_93287 ) ) ( not ( = ?auto_93288 ?auto_93287 ) ) ( not ( = ?auto_93289 ?auto_93287 ) ) ( not ( = ?auto_93290 ?auto_93287 ) ) ( ON ?auto_93284 ?auto_93283 ) ( CLEAR ?auto_93284 ) ( ON-TABLE ?auto_93287 ) ( HOLDING ?auto_93285 ) ( CLEAR ?auto_93286 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93289 ?auto_93290 ?auto_93288 ?auto_93286 ?auto_93285 )
      ( MAKE-4PILE ?auto_93283 ?auto_93284 ?auto_93285 ?auto_93286 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93291 - BLOCK
      ?auto_93292 - BLOCK
      ?auto_93293 - BLOCK
      ?auto_93294 - BLOCK
    )
    :vars
    (
      ?auto_93296 - BLOCK
      ?auto_93298 - BLOCK
      ?auto_93295 - BLOCK
      ?auto_93297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93291 ?auto_93292 ) ) ( not ( = ?auto_93291 ?auto_93293 ) ) ( not ( = ?auto_93291 ?auto_93294 ) ) ( not ( = ?auto_93292 ?auto_93293 ) ) ( not ( = ?auto_93292 ?auto_93294 ) ) ( not ( = ?auto_93293 ?auto_93294 ) ) ( ON ?auto_93294 ?auto_93296 ) ( not ( = ?auto_93291 ?auto_93296 ) ) ( not ( = ?auto_93292 ?auto_93296 ) ) ( not ( = ?auto_93293 ?auto_93296 ) ) ( not ( = ?auto_93294 ?auto_93296 ) ) ( ON-TABLE ?auto_93298 ) ( ON ?auto_93295 ?auto_93298 ) ( ON ?auto_93296 ?auto_93295 ) ( not ( = ?auto_93298 ?auto_93295 ) ) ( not ( = ?auto_93298 ?auto_93296 ) ) ( not ( = ?auto_93298 ?auto_93294 ) ) ( not ( = ?auto_93298 ?auto_93293 ) ) ( not ( = ?auto_93295 ?auto_93296 ) ) ( not ( = ?auto_93295 ?auto_93294 ) ) ( not ( = ?auto_93295 ?auto_93293 ) ) ( not ( = ?auto_93291 ?auto_93298 ) ) ( not ( = ?auto_93291 ?auto_93295 ) ) ( not ( = ?auto_93292 ?auto_93298 ) ) ( not ( = ?auto_93292 ?auto_93295 ) ) ( ON ?auto_93291 ?auto_93297 ) ( not ( = ?auto_93291 ?auto_93297 ) ) ( not ( = ?auto_93292 ?auto_93297 ) ) ( not ( = ?auto_93293 ?auto_93297 ) ) ( not ( = ?auto_93294 ?auto_93297 ) ) ( not ( = ?auto_93296 ?auto_93297 ) ) ( not ( = ?auto_93298 ?auto_93297 ) ) ( not ( = ?auto_93295 ?auto_93297 ) ) ( ON ?auto_93292 ?auto_93291 ) ( ON-TABLE ?auto_93297 ) ( CLEAR ?auto_93294 ) ( ON ?auto_93293 ?auto_93292 ) ( CLEAR ?auto_93293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93297 ?auto_93291 ?auto_93292 )
      ( MAKE-4PILE ?auto_93291 ?auto_93292 ?auto_93293 ?auto_93294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93299 - BLOCK
      ?auto_93300 - BLOCK
      ?auto_93301 - BLOCK
      ?auto_93302 - BLOCK
    )
    :vars
    (
      ?auto_93303 - BLOCK
      ?auto_93304 - BLOCK
      ?auto_93305 - BLOCK
      ?auto_93306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93299 ?auto_93300 ) ) ( not ( = ?auto_93299 ?auto_93301 ) ) ( not ( = ?auto_93299 ?auto_93302 ) ) ( not ( = ?auto_93300 ?auto_93301 ) ) ( not ( = ?auto_93300 ?auto_93302 ) ) ( not ( = ?auto_93301 ?auto_93302 ) ) ( not ( = ?auto_93299 ?auto_93303 ) ) ( not ( = ?auto_93300 ?auto_93303 ) ) ( not ( = ?auto_93301 ?auto_93303 ) ) ( not ( = ?auto_93302 ?auto_93303 ) ) ( ON-TABLE ?auto_93304 ) ( ON ?auto_93305 ?auto_93304 ) ( ON ?auto_93303 ?auto_93305 ) ( not ( = ?auto_93304 ?auto_93305 ) ) ( not ( = ?auto_93304 ?auto_93303 ) ) ( not ( = ?auto_93304 ?auto_93302 ) ) ( not ( = ?auto_93304 ?auto_93301 ) ) ( not ( = ?auto_93305 ?auto_93303 ) ) ( not ( = ?auto_93305 ?auto_93302 ) ) ( not ( = ?auto_93305 ?auto_93301 ) ) ( not ( = ?auto_93299 ?auto_93304 ) ) ( not ( = ?auto_93299 ?auto_93305 ) ) ( not ( = ?auto_93300 ?auto_93304 ) ) ( not ( = ?auto_93300 ?auto_93305 ) ) ( ON ?auto_93299 ?auto_93306 ) ( not ( = ?auto_93299 ?auto_93306 ) ) ( not ( = ?auto_93300 ?auto_93306 ) ) ( not ( = ?auto_93301 ?auto_93306 ) ) ( not ( = ?auto_93302 ?auto_93306 ) ) ( not ( = ?auto_93303 ?auto_93306 ) ) ( not ( = ?auto_93304 ?auto_93306 ) ) ( not ( = ?auto_93305 ?auto_93306 ) ) ( ON ?auto_93300 ?auto_93299 ) ( ON-TABLE ?auto_93306 ) ( ON ?auto_93301 ?auto_93300 ) ( CLEAR ?auto_93301 ) ( HOLDING ?auto_93302 ) ( CLEAR ?auto_93303 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93304 ?auto_93305 ?auto_93303 ?auto_93302 )
      ( MAKE-4PILE ?auto_93299 ?auto_93300 ?auto_93301 ?auto_93302 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93307 - BLOCK
      ?auto_93308 - BLOCK
      ?auto_93309 - BLOCK
      ?auto_93310 - BLOCK
    )
    :vars
    (
      ?auto_93314 - BLOCK
      ?auto_93313 - BLOCK
      ?auto_93312 - BLOCK
      ?auto_93311 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93307 ?auto_93308 ) ) ( not ( = ?auto_93307 ?auto_93309 ) ) ( not ( = ?auto_93307 ?auto_93310 ) ) ( not ( = ?auto_93308 ?auto_93309 ) ) ( not ( = ?auto_93308 ?auto_93310 ) ) ( not ( = ?auto_93309 ?auto_93310 ) ) ( not ( = ?auto_93307 ?auto_93314 ) ) ( not ( = ?auto_93308 ?auto_93314 ) ) ( not ( = ?auto_93309 ?auto_93314 ) ) ( not ( = ?auto_93310 ?auto_93314 ) ) ( ON-TABLE ?auto_93313 ) ( ON ?auto_93312 ?auto_93313 ) ( ON ?auto_93314 ?auto_93312 ) ( not ( = ?auto_93313 ?auto_93312 ) ) ( not ( = ?auto_93313 ?auto_93314 ) ) ( not ( = ?auto_93313 ?auto_93310 ) ) ( not ( = ?auto_93313 ?auto_93309 ) ) ( not ( = ?auto_93312 ?auto_93314 ) ) ( not ( = ?auto_93312 ?auto_93310 ) ) ( not ( = ?auto_93312 ?auto_93309 ) ) ( not ( = ?auto_93307 ?auto_93313 ) ) ( not ( = ?auto_93307 ?auto_93312 ) ) ( not ( = ?auto_93308 ?auto_93313 ) ) ( not ( = ?auto_93308 ?auto_93312 ) ) ( ON ?auto_93307 ?auto_93311 ) ( not ( = ?auto_93307 ?auto_93311 ) ) ( not ( = ?auto_93308 ?auto_93311 ) ) ( not ( = ?auto_93309 ?auto_93311 ) ) ( not ( = ?auto_93310 ?auto_93311 ) ) ( not ( = ?auto_93314 ?auto_93311 ) ) ( not ( = ?auto_93313 ?auto_93311 ) ) ( not ( = ?auto_93312 ?auto_93311 ) ) ( ON ?auto_93308 ?auto_93307 ) ( ON-TABLE ?auto_93311 ) ( ON ?auto_93309 ?auto_93308 ) ( CLEAR ?auto_93314 ) ( ON ?auto_93310 ?auto_93309 ) ( CLEAR ?auto_93310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93311 ?auto_93307 ?auto_93308 ?auto_93309 )
      ( MAKE-4PILE ?auto_93307 ?auto_93308 ?auto_93309 ?auto_93310 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93315 - BLOCK
      ?auto_93316 - BLOCK
      ?auto_93317 - BLOCK
      ?auto_93318 - BLOCK
    )
    :vars
    (
      ?auto_93322 - BLOCK
      ?auto_93319 - BLOCK
      ?auto_93321 - BLOCK
      ?auto_93320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93315 ?auto_93316 ) ) ( not ( = ?auto_93315 ?auto_93317 ) ) ( not ( = ?auto_93315 ?auto_93318 ) ) ( not ( = ?auto_93316 ?auto_93317 ) ) ( not ( = ?auto_93316 ?auto_93318 ) ) ( not ( = ?auto_93317 ?auto_93318 ) ) ( not ( = ?auto_93315 ?auto_93322 ) ) ( not ( = ?auto_93316 ?auto_93322 ) ) ( not ( = ?auto_93317 ?auto_93322 ) ) ( not ( = ?auto_93318 ?auto_93322 ) ) ( ON-TABLE ?auto_93319 ) ( ON ?auto_93321 ?auto_93319 ) ( not ( = ?auto_93319 ?auto_93321 ) ) ( not ( = ?auto_93319 ?auto_93322 ) ) ( not ( = ?auto_93319 ?auto_93318 ) ) ( not ( = ?auto_93319 ?auto_93317 ) ) ( not ( = ?auto_93321 ?auto_93322 ) ) ( not ( = ?auto_93321 ?auto_93318 ) ) ( not ( = ?auto_93321 ?auto_93317 ) ) ( not ( = ?auto_93315 ?auto_93319 ) ) ( not ( = ?auto_93315 ?auto_93321 ) ) ( not ( = ?auto_93316 ?auto_93319 ) ) ( not ( = ?auto_93316 ?auto_93321 ) ) ( ON ?auto_93315 ?auto_93320 ) ( not ( = ?auto_93315 ?auto_93320 ) ) ( not ( = ?auto_93316 ?auto_93320 ) ) ( not ( = ?auto_93317 ?auto_93320 ) ) ( not ( = ?auto_93318 ?auto_93320 ) ) ( not ( = ?auto_93322 ?auto_93320 ) ) ( not ( = ?auto_93319 ?auto_93320 ) ) ( not ( = ?auto_93321 ?auto_93320 ) ) ( ON ?auto_93316 ?auto_93315 ) ( ON-TABLE ?auto_93320 ) ( ON ?auto_93317 ?auto_93316 ) ( ON ?auto_93318 ?auto_93317 ) ( CLEAR ?auto_93318 ) ( HOLDING ?auto_93322 ) ( CLEAR ?auto_93321 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93319 ?auto_93321 ?auto_93322 )
      ( MAKE-4PILE ?auto_93315 ?auto_93316 ?auto_93317 ?auto_93318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93323 - BLOCK
      ?auto_93324 - BLOCK
      ?auto_93325 - BLOCK
      ?auto_93326 - BLOCK
    )
    :vars
    (
      ?auto_93330 - BLOCK
      ?auto_93329 - BLOCK
      ?auto_93327 - BLOCK
      ?auto_93328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93323 ?auto_93324 ) ) ( not ( = ?auto_93323 ?auto_93325 ) ) ( not ( = ?auto_93323 ?auto_93326 ) ) ( not ( = ?auto_93324 ?auto_93325 ) ) ( not ( = ?auto_93324 ?auto_93326 ) ) ( not ( = ?auto_93325 ?auto_93326 ) ) ( not ( = ?auto_93323 ?auto_93330 ) ) ( not ( = ?auto_93324 ?auto_93330 ) ) ( not ( = ?auto_93325 ?auto_93330 ) ) ( not ( = ?auto_93326 ?auto_93330 ) ) ( ON-TABLE ?auto_93329 ) ( ON ?auto_93327 ?auto_93329 ) ( not ( = ?auto_93329 ?auto_93327 ) ) ( not ( = ?auto_93329 ?auto_93330 ) ) ( not ( = ?auto_93329 ?auto_93326 ) ) ( not ( = ?auto_93329 ?auto_93325 ) ) ( not ( = ?auto_93327 ?auto_93330 ) ) ( not ( = ?auto_93327 ?auto_93326 ) ) ( not ( = ?auto_93327 ?auto_93325 ) ) ( not ( = ?auto_93323 ?auto_93329 ) ) ( not ( = ?auto_93323 ?auto_93327 ) ) ( not ( = ?auto_93324 ?auto_93329 ) ) ( not ( = ?auto_93324 ?auto_93327 ) ) ( ON ?auto_93323 ?auto_93328 ) ( not ( = ?auto_93323 ?auto_93328 ) ) ( not ( = ?auto_93324 ?auto_93328 ) ) ( not ( = ?auto_93325 ?auto_93328 ) ) ( not ( = ?auto_93326 ?auto_93328 ) ) ( not ( = ?auto_93330 ?auto_93328 ) ) ( not ( = ?auto_93329 ?auto_93328 ) ) ( not ( = ?auto_93327 ?auto_93328 ) ) ( ON ?auto_93324 ?auto_93323 ) ( ON-TABLE ?auto_93328 ) ( ON ?auto_93325 ?auto_93324 ) ( ON ?auto_93326 ?auto_93325 ) ( CLEAR ?auto_93327 ) ( ON ?auto_93330 ?auto_93326 ) ( CLEAR ?auto_93330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93328 ?auto_93323 ?auto_93324 ?auto_93325 ?auto_93326 )
      ( MAKE-4PILE ?auto_93323 ?auto_93324 ?auto_93325 ?auto_93326 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93331 - BLOCK
      ?auto_93332 - BLOCK
      ?auto_93333 - BLOCK
      ?auto_93334 - BLOCK
    )
    :vars
    (
      ?auto_93338 - BLOCK
      ?auto_93335 - BLOCK
      ?auto_93336 - BLOCK
      ?auto_93337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93331 ?auto_93332 ) ) ( not ( = ?auto_93331 ?auto_93333 ) ) ( not ( = ?auto_93331 ?auto_93334 ) ) ( not ( = ?auto_93332 ?auto_93333 ) ) ( not ( = ?auto_93332 ?auto_93334 ) ) ( not ( = ?auto_93333 ?auto_93334 ) ) ( not ( = ?auto_93331 ?auto_93338 ) ) ( not ( = ?auto_93332 ?auto_93338 ) ) ( not ( = ?auto_93333 ?auto_93338 ) ) ( not ( = ?auto_93334 ?auto_93338 ) ) ( ON-TABLE ?auto_93335 ) ( not ( = ?auto_93335 ?auto_93336 ) ) ( not ( = ?auto_93335 ?auto_93338 ) ) ( not ( = ?auto_93335 ?auto_93334 ) ) ( not ( = ?auto_93335 ?auto_93333 ) ) ( not ( = ?auto_93336 ?auto_93338 ) ) ( not ( = ?auto_93336 ?auto_93334 ) ) ( not ( = ?auto_93336 ?auto_93333 ) ) ( not ( = ?auto_93331 ?auto_93335 ) ) ( not ( = ?auto_93331 ?auto_93336 ) ) ( not ( = ?auto_93332 ?auto_93335 ) ) ( not ( = ?auto_93332 ?auto_93336 ) ) ( ON ?auto_93331 ?auto_93337 ) ( not ( = ?auto_93331 ?auto_93337 ) ) ( not ( = ?auto_93332 ?auto_93337 ) ) ( not ( = ?auto_93333 ?auto_93337 ) ) ( not ( = ?auto_93334 ?auto_93337 ) ) ( not ( = ?auto_93338 ?auto_93337 ) ) ( not ( = ?auto_93335 ?auto_93337 ) ) ( not ( = ?auto_93336 ?auto_93337 ) ) ( ON ?auto_93332 ?auto_93331 ) ( ON-TABLE ?auto_93337 ) ( ON ?auto_93333 ?auto_93332 ) ( ON ?auto_93334 ?auto_93333 ) ( ON ?auto_93338 ?auto_93334 ) ( CLEAR ?auto_93338 ) ( HOLDING ?auto_93336 ) ( CLEAR ?auto_93335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93335 ?auto_93336 )
      ( MAKE-4PILE ?auto_93331 ?auto_93332 ?auto_93333 ?auto_93334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93339 - BLOCK
      ?auto_93340 - BLOCK
      ?auto_93341 - BLOCK
      ?auto_93342 - BLOCK
    )
    :vars
    (
      ?auto_93345 - BLOCK
      ?auto_93346 - BLOCK
      ?auto_93344 - BLOCK
      ?auto_93343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93339 ?auto_93340 ) ) ( not ( = ?auto_93339 ?auto_93341 ) ) ( not ( = ?auto_93339 ?auto_93342 ) ) ( not ( = ?auto_93340 ?auto_93341 ) ) ( not ( = ?auto_93340 ?auto_93342 ) ) ( not ( = ?auto_93341 ?auto_93342 ) ) ( not ( = ?auto_93339 ?auto_93345 ) ) ( not ( = ?auto_93340 ?auto_93345 ) ) ( not ( = ?auto_93341 ?auto_93345 ) ) ( not ( = ?auto_93342 ?auto_93345 ) ) ( ON-TABLE ?auto_93346 ) ( not ( = ?auto_93346 ?auto_93344 ) ) ( not ( = ?auto_93346 ?auto_93345 ) ) ( not ( = ?auto_93346 ?auto_93342 ) ) ( not ( = ?auto_93346 ?auto_93341 ) ) ( not ( = ?auto_93344 ?auto_93345 ) ) ( not ( = ?auto_93344 ?auto_93342 ) ) ( not ( = ?auto_93344 ?auto_93341 ) ) ( not ( = ?auto_93339 ?auto_93346 ) ) ( not ( = ?auto_93339 ?auto_93344 ) ) ( not ( = ?auto_93340 ?auto_93346 ) ) ( not ( = ?auto_93340 ?auto_93344 ) ) ( ON ?auto_93339 ?auto_93343 ) ( not ( = ?auto_93339 ?auto_93343 ) ) ( not ( = ?auto_93340 ?auto_93343 ) ) ( not ( = ?auto_93341 ?auto_93343 ) ) ( not ( = ?auto_93342 ?auto_93343 ) ) ( not ( = ?auto_93345 ?auto_93343 ) ) ( not ( = ?auto_93346 ?auto_93343 ) ) ( not ( = ?auto_93344 ?auto_93343 ) ) ( ON ?auto_93340 ?auto_93339 ) ( ON-TABLE ?auto_93343 ) ( ON ?auto_93341 ?auto_93340 ) ( ON ?auto_93342 ?auto_93341 ) ( ON ?auto_93345 ?auto_93342 ) ( CLEAR ?auto_93346 ) ( ON ?auto_93344 ?auto_93345 ) ( CLEAR ?auto_93344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93343 ?auto_93339 ?auto_93340 ?auto_93341 ?auto_93342 ?auto_93345 )
      ( MAKE-4PILE ?auto_93339 ?auto_93340 ?auto_93341 ?auto_93342 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93347 - BLOCK
      ?auto_93348 - BLOCK
      ?auto_93349 - BLOCK
      ?auto_93350 - BLOCK
    )
    :vars
    (
      ?auto_93352 - BLOCK
      ?auto_93351 - BLOCK
      ?auto_93354 - BLOCK
      ?auto_93353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93347 ?auto_93348 ) ) ( not ( = ?auto_93347 ?auto_93349 ) ) ( not ( = ?auto_93347 ?auto_93350 ) ) ( not ( = ?auto_93348 ?auto_93349 ) ) ( not ( = ?auto_93348 ?auto_93350 ) ) ( not ( = ?auto_93349 ?auto_93350 ) ) ( not ( = ?auto_93347 ?auto_93352 ) ) ( not ( = ?auto_93348 ?auto_93352 ) ) ( not ( = ?auto_93349 ?auto_93352 ) ) ( not ( = ?auto_93350 ?auto_93352 ) ) ( not ( = ?auto_93351 ?auto_93354 ) ) ( not ( = ?auto_93351 ?auto_93352 ) ) ( not ( = ?auto_93351 ?auto_93350 ) ) ( not ( = ?auto_93351 ?auto_93349 ) ) ( not ( = ?auto_93354 ?auto_93352 ) ) ( not ( = ?auto_93354 ?auto_93350 ) ) ( not ( = ?auto_93354 ?auto_93349 ) ) ( not ( = ?auto_93347 ?auto_93351 ) ) ( not ( = ?auto_93347 ?auto_93354 ) ) ( not ( = ?auto_93348 ?auto_93351 ) ) ( not ( = ?auto_93348 ?auto_93354 ) ) ( ON ?auto_93347 ?auto_93353 ) ( not ( = ?auto_93347 ?auto_93353 ) ) ( not ( = ?auto_93348 ?auto_93353 ) ) ( not ( = ?auto_93349 ?auto_93353 ) ) ( not ( = ?auto_93350 ?auto_93353 ) ) ( not ( = ?auto_93352 ?auto_93353 ) ) ( not ( = ?auto_93351 ?auto_93353 ) ) ( not ( = ?auto_93354 ?auto_93353 ) ) ( ON ?auto_93348 ?auto_93347 ) ( ON-TABLE ?auto_93353 ) ( ON ?auto_93349 ?auto_93348 ) ( ON ?auto_93350 ?auto_93349 ) ( ON ?auto_93352 ?auto_93350 ) ( ON ?auto_93354 ?auto_93352 ) ( CLEAR ?auto_93354 ) ( HOLDING ?auto_93351 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93351 )
      ( MAKE-4PILE ?auto_93347 ?auto_93348 ?auto_93349 ?auto_93350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_93355 - BLOCK
      ?auto_93356 - BLOCK
      ?auto_93357 - BLOCK
      ?auto_93358 - BLOCK
    )
    :vars
    (
      ?auto_93361 - BLOCK
      ?auto_93359 - BLOCK
      ?auto_93360 - BLOCK
      ?auto_93362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93355 ?auto_93356 ) ) ( not ( = ?auto_93355 ?auto_93357 ) ) ( not ( = ?auto_93355 ?auto_93358 ) ) ( not ( = ?auto_93356 ?auto_93357 ) ) ( not ( = ?auto_93356 ?auto_93358 ) ) ( not ( = ?auto_93357 ?auto_93358 ) ) ( not ( = ?auto_93355 ?auto_93361 ) ) ( not ( = ?auto_93356 ?auto_93361 ) ) ( not ( = ?auto_93357 ?auto_93361 ) ) ( not ( = ?auto_93358 ?auto_93361 ) ) ( not ( = ?auto_93359 ?auto_93360 ) ) ( not ( = ?auto_93359 ?auto_93361 ) ) ( not ( = ?auto_93359 ?auto_93358 ) ) ( not ( = ?auto_93359 ?auto_93357 ) ) ( not ( = ?auto_93360 ?auto_93361 ) ) ( not ( = ?auto_93360 ?auto_93358 ) ) ( not ( = ?auto_93360 ?auto_93357 ) ) ( not ( = ?auto_93355 ?auto_93359 ) ) ( not ( = ?auto_93355 ?auto_93360 ) ) ( not ( = ?auto_93356 ?auto_93359 ) ) ( not ( = ?auto_93356 ?auto_93360 ) ) ( ON ?auto_93355 ?auto_93362 ) ( not ( = ?auto_93355 ?auto_93362 ) ) ( not ( = ?auto_93356 ?auto_93362 ) ) ( not ( = ?auto_93357 ?auto_93362 ) ) ( not ( = ?auto_93358 ?auto_93362 ) ) ( not ( = ?auto_93361 ?auto_93362 ) ) ( not ( = ?auto_93359 ?auto_93362 ) ) ( not ( = ?auto_93360 ?auto_93362 ) ) ( ON ?auto_93356 ?auto_93355 ) ( ON-TABLE ?auto_93362 ) ( ON ?auto_93357 ?auto_93356 ) ( ON ?auto_93358 ?auto_93357 ) ( ON ?auto_93361 ?auto_93358 ) ( ON ?auto_93360 ?auto_93361 ) ( ON ?auto_93359 ?auto_93360 ) ( CLEAR ?auto_93359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93362 ?auto_93355 ?auto_93356 ?auto_93357 ?auto_93358 ?auto_93361 ?auto_93360 )
      ( MAKE-4PILE ?auto_93355 ?auto_93356 ?auto_93357 ?auto_93358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93378 - BLOCK
      ?auto_93379 - BLOCK
    )
    :vars
    (
      ?auto_93380 - BLOCK
      ?auto_93381 - BLOCK
      ?auto_93382 - BLOCK
      ?auto_93383 - BLOCK
      ?auto_93384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93380 ?auto_93379 ) ( ON-TABLE ?auto_93378 ) ( ON ?auto_93379 ?auto_93378 ) ( not ( = ?auto_93378 ?auto_93379 ) ) ( not ( = ?auto_93378 ?auto_93380 ) ) ( not ( = ?auto_93379 ?auto_93380 ) ) ( not ( = ?auto_93378 ?auto_93381 ) ) ( not ( = ?auto_93378 ?auto_93382 ) ) ( not ( = ?auto_93379 ?auto_93381 ) ) ( not ( = ?auto_93379 ?auto_93382 ) ) ( not ( = ?auto_93380 ?auto_93381 ) ) ( not ( = ?auto_93380 ?auto_93382 ) ) ( not ( = ?auto_93381 ?auto_93382 ) ) ( ON ?auto_93381 ?auto_93380 ) ( CLEAR ?auto_93381 ) ( HOLDING ?auto_93382 ) ( CLEAR ?auto_93383 ) ( ON-TABLE ?auto_93384 ) ( ON ?auto_93383 ?auto_93384 ) ( not ( = ?auto_93384 ?auto_93383 ) ) ( not ( = ?auto_93384 ?auto_93382 ) ) ( not ( = ?auto_93383 ?auto_93382 ) ) ( not ( = ?auto_93378 ?auto_93383 ) ) ( not ( = ?auto_93378 ?auto_93384 ) ) ( not ( = ?auto_93379 ?auto_93383 ) ) ( not ( = ?auto_93379 ?auto_93384 ) ) ( not ( = ?auto_93380 ?auto_93383 ) ) ( not ( = ?auto_93380 ?auto_93384 ) ) ( not ( = ?auto_93381 ?auto_93383 ) ) ( not ( = ?auto_93381 ?auto_93384 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93384 ?auto_93383 ?auto_93382 )
      ( MAKE-2PILE ?auto_93378 ?auto_93379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93385 - BLOCK
      ?auto_93386 - BLOCK
    )
    :vars
    (
      ?auto_93387 - BLOCK
      ?auto_93388 - BLOCK
      ?auto_93389 - BLOCK
      ?auto_93390 - BLOCK
      ?auto_93391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93387 ?auto_93386 ) ( ON-TABLE ?auto_93385 ) ( ON ?auto_93386 ?auto_93385 ) ( not ( = ?auto_93385 ?auto_93386 ) ) ( not ( = ?auto_93385 ?auto_93387 ) ) ( not ( = ?auto_93386 ?auto_93387 ) ) ( not ( = ?auto_93385 ?auto_93388 ) ) ( not ( = ?auto_93385 ?auto_93389 ) ) ( not ( = ?auto_93386 ?auto_93388 ) ) ( not ( = ?auto_93386 ?auto_93389 ) ) ( not ( = ?auto_93387 ?auto_93388 ) ) ( not ( = ?auto_93387 ?auto_93389 ) ) ( not ( = ?auto_93388 ?auto_93389 ) ) ( ON ?auto_93388 ?auto_93387 ) ( CLEAR ?auto_93390 ) ( ON-TABLE ?auto_93391 ) ( ON ?auto_93390 ?auto_93391 ) ( not ( = ?auto_93391 ?auto_93390 ) ) ( not ( = ?auto_93391 ?auto_93389 ) ) ( not ( = ?auto_93390 ?auto_93389 ) ) ( not ( = ?auto_93385 ?auto_93390 ) ) ( not ( = ?auto_93385 ?auto_93391 ) ) ( not ( = ?auto_93386 ?auto_93390 ) ) ( not ( = ?auto_93386 ?auto_93391 ) ) ( not ( = ?auto_93387 ?auto_93390 ) ) ( not ( = ?auto_93387 ?auto_93391 ) ) ( not ( = ?auto_93388 ?auto_93390 ) ) ( not ( = ?auto_93388 ?auto_93391 ) ) ( ON ?auto_93389 ?auto_93388 ) ( CLEAR ?auto_93389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93385 ?auto_93386 ?auto_93387 ?auto_93388 )
      ( MAKE-2PILE ?auto_93385 ?auto_93386 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93392 - BLOCK
      ?auto_93393 - BLOCK
    )
    :vars
    (
      ?auto_93395 - BLOCK
      ?auto_93396 - BLOCK
      ?auto_93397 - BLOCK
      ?auto_93394 - BLOCK
      ?auto_93398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93395 ?auto_93393 ) ( ON-TABLE ?auto_93392 ) ( ON ?auto_93393 ?auto_93392 ) ( not ( = ?auto_93392 ?auto_93393 ) ) ( not ( = ?auto_93392 ?auto_93395 ) ) ( not ( = ?auto_93393 ?auto_93395 ) ) ( not ( = ?auto_93392 ?auto_93396 ) ) ( not ( = ?auto_93392 ?auto_93397 ) ) ( not ( = ?auto_93393 ?auto_93396 ) ) ( not ( = ?auto_93393 ?auto_93397 ) ) ( not ( = ?auto_93395 ?auto_93396 ) ) ( not ( = ?auto_93395 ?auto_93397 ) ) ( not ( = ?auto_93396 ?auto_93397 ) ) ( ON ?auto_93396 ?auto_93395 ) ( ON-TABLE ?auto_93394 ) ( not ( = ?auto_93394 ?auto_93398 ) ) ( not ( = ?auto_93394 ?auto_93397 ) ) ( not ( = ?auto_93398 ?auto_93397 ) ) ( not ( = ?auto_93392 ?auto_93398 ) ) ( not ( = ?auto_93392 ?auto_93394 ) ) ( not ( = ?auto_93393 ?auto_93398 ) ) ( not ( = ?auto_93393 ?auto_93394 ) ) ( not ( = ?auto_93395 ?auto_93398 ) ) ( not ( = ?auto_93395 ?auto_93394 ) ) ( not ( = ?auto_93396 ?auto_93398 ) ) ( not ( = ?auto_93396 ?auto_93394 ) ) ( ON ?auto_93397 ?auto_93396 ) ( CLEAR ?auto_93397 ) ( HOLDING ?auto_93398 ) ( CLEAR ?auto_93394 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93394 ?auto_93398 )
      ( MAKE-2PILE ?auto_93392 ?auto_93393 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93399 - BLOCK
      ?auto_93400 - BLOCK
    )
    :vars
    (
      ?auto_93403 - BLOCK
      ?auto_93402 - BLOCK
      ?auto_93404 - BLOCK
      ?auto_93405 - BLOCK
      ?auto_93401 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93403 ?auto_93400 ) ( ON-TABLE ?auto_93399 ) ( ON ?auto_93400 ?auto_93399 ) ( not ( = ?auto_93399 ?auto_93400 ) ) ( not ( = ?auto_93399 ?auto_93403 ) ) ( not ( = ?auto_93400 ?auto_93403 ) ) ( not ( = ?auto_93399 ?auto_93402 ) ) ( not ( = ?auto_93399 ?auto_93404 ) ) ( not ( = ?auto_93400 ?auto_93402 ) ) ( not ( = ?auto_93400 ?auto_93404 ) ) ( not ( = ?auto_93403 ?auto_93402 ) ) ( not ( = ?auto_93403 ?auto_93404 ) ) ( not ( = ?auto_93402 ?auto_93404 ) ) ( ON ?auto_93402 ?auto_93403 ) ( ON-TABLE ?auto_93405 ) ( not ( = ?auto_93405 ?auto_93401 ) ) ( not ( = ?auto_93405 ?auto_93404 ) ) ( not ( = ?auto_93401 ?auto_93404 ) ) ( not ( = ?auto_93399 ?auto_93401 ) ) ( not ( = ?auto_93399 ?auto_93405 ) ) ( not ( = ?auto_93400 ?auto_93401 ) ) ( not ( = ?auto_93400 ?auto_93405 ) ) ( not ( = ?auto_93403 ?auto_93401 ) ) ( not ( = ?auto_93403 ?auto_93405 ) ) ( not ( = ?auto_93402 ?auto_93401 ) ) ( not ( = ?auto_93402 ?auto_93405 ) ) ( ON ?auto_93404 ?auto_93402 ) ( CLEAR ?auto_93405 ) ( ON ?auto_93401 ?auto_93404 ) ( CLEAR ?auto_93401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93399 ?auto_93400 ?auto_93403 ?auto_93402 ?auto_93404 )
      ( MAKE-2PILE ?auto_93399 ?auto_93400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93406 - BLOCK
      ?auto_93407 - BLOCK
    )
    :vars
    (
      ?auto_93410 - BLOCK
      ?auto_93409 - BLOCK
      ?auto_93412 - BLOCK
      ?auto_93408 - BLOCK
      ?auto_93411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93410 ?auto_93407 ) ( ON-TABLE ?auto_93406 ) ( ON ?auto_93407 ?auto_93406 ) ( not ( = ?auto_93406 ?auto_93407 ) ) ( not ( = ?auto_93406 ?auto_93410 ) ) ( not ( = ?auto_93407 ?auto_93410 ) ) ( not ( = ?auto_93406 ?auto_93409 ) ) ( not ( = ?auto_93406 ?auto_93412 ) ) ( not ( = ?auto_93407 ?auto_93409 ) ) ( not ( = ?auto_93407 ?auto_93412 ) ) ( not ( = ?auto_93410 ?auto_93409 ) ) ( not ( = ?auto_93410 ?auto_93412 ) ) ( not ( = ?auto_93409 ?auto_93412 ) ) ( ON ?auto_93409 ?auto_93410 ) ( not ( = ?auto_93408 ?auto_93411 ) ) ( not ( = ?auto_93408 ?auto_93412 ) ) ( not ( = ?auto_93411 ?auto_93412 ) ) ( not ( = ?auto_93406 ?auto_93411 ) ) ( not ( = ?auto_93406 ?auto_93408 ) ) ( not ( = ?auto_93407 ?auto_93411 ) ) ( not ( = ?auto_93407 ?auto_93408 ) ) ( not ( = ?auto_93410 ?auto_93411 ) ) ( not ( = ?auto_93410 ?auto_93408 ) ) ( not ( = ?auto_93409 ?auto_93411 ) ) ( not ( = ?auto_93409 ?auto_93408 ) ) ( ON ?auto_93412 ?auto_93409 ) ( ON ?auto_93411 ?auto_93412 ) ( CLEAR ?auto_93411 ) ( HOLDING ?auto_93408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93408 )
      ( MAKE-2PILE ?auto_93406 ?auto_93407 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93422 - BLOCK
      ?auto_93423 - BLOCK
    )
    :vars
    (
      ?auto_93426 - BLOCK
      ?auto_93424 - BLOCK
      ?auto_93427 - BLOCK
      ?auto_93428 - BLOCK
      ?auto_93425 - BLOCK
      ?auto_93429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93426 ?auto_93423 ) ( ON-TABLE ?auto_93422 ) ( ON ?auto_93423 ?auto_93422 ) ( not ( = ?auto_93422 ?auto_93423 ) ) ( not ( = ?auto_93422 ?auto_93426 ) ) ( not ( = ?auto_93423 ?auto_93426 ) ) ( not ( = ?auto_93422 ?auto_93424 ) ) ( not ( = ?auto_93422 ?auto_93427 ) ) ( not ( = ?auto_93423 ?auto_93424 ) ) ( not ( = ?auto_93423 ?auto_93427 ) ) ( not ( = ?auto_93426 ?auto_93424 ) ) ( not ( = ?auto_93426 ?auto_93427 ) ) ( not ( = ?auto_93424 ?auto_93427 ) ) ( ON ?auto_93424 ?auto_93426 ) ( not ( = ?auto_93428 ?auto_93425 ) ) ( not ( = ?auto_93428 ?auto_93427 ) ) ( not ( = ?auto_93425 ?auto_93427 ) ) ( not ( = ?auto_93422 ?auto_93425 ) ) ( not ( = ?auto_93422 ?auto_93428 ) ) ( not ( = ?auto_93423 ?auto_93425 ) ) ( not ( = ?auto_93423 ?auto_93428 ) ) ( not ( = ?auto_93426 ?auto_93425 ) ) ( not ( = ?auto_93426 ?auto_93428 ) ) ( not ( = ?auto_93424 ?auto_93425 ) ) ( not ( = ?auto_93424 ?auto_93428 ) ) ( ON ?auto_93427 ?auto_93424 ) ( ON ?auto_93425 ?auto_93427 ) ( CLEAR ?auto_93425 ) ( ON ?auto_93428 ?auto_93429 ) ( CLEAR ?auto_93428 ) ( HAND-EMPTY ) ( not ( = ?auto_93422 ?auto_93429 ) ) ( not ( = ?auto_93423 ?auto_93429 ) ) ( not ( = ?auto_93426 ?auto_93429 ) ) ( not ( = ?auto_93424 ?auto_93429 ) ) ( not ( = ?auto_93427 ?auto_93429 ) ) ( not ( = ?auto_93428 ?auto_93429 ) ) ( not ( = ?auto_93425 ?auto_93429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93428 ?auto_93429 )
      ( MAKE-2PILE ?auto_93422 ?auto_93423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93430 - BLOCK
      ?auto_93431 - BLOCK
    )
    :vars
    (
      ?auto_93437 - BLOCK
      ?auto_93435 - BLOCK
      ?auto_93433 - BLOCK
      ?auto_93432 - BLOCK
      ?auto_93434 - BLOCK
      ?auto_93436 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93437 ?auto_93431 ) ( ON-TABLE ?auto_93430 ) ( ON ?auto_93431 ?auto_93430 ) ( not ( = ?auto_93430 ?auto_93431 ) ) ( not ( = ?auto_93430 ?auto_93437 ) ) ( not ( = ?auto_93431 ?auto_93437 ) ) ( not ( = ?auto_93430 ?auto_93435 ) ) ( not ( = ?auto_93430 ?auto_93433 ) ) ( not ( = ?auto_93431 ?auto_93435 ) ) ( not ( = ?auto_93431 ?auto_93433 ) ) ( not ( = ?auto_93437 ?auto_93435 ) ) ( not ( = ?auto_93437 ?auto_93433 ) ) ( not ( = ?auto_93435 ?auto_93433 ) ) ( ON ?auto_93435 ?auto_93437 ) ( not ( = ?auto_93432 ?auto_93434 ) ) ( not ( = ?auto_93432 ?auto_93433 ) ) ( not ( = ?auto_93434 ?auto_93433 ) ) ( not ( = ?auto_93430 ?auto_93434 ) ) ( not ( = ?auto_93430 ?auto_93432 ) ) ( not ( = ?auto_93431 ?auto_93434 ) ) ( not ( = ?auto_93431 ?auto_93432 ) ) ( not ( = ?auto_93437 ?auto_93434 ) ) ( not ( = ?auto_93437 ?auto_93432 ) ) ( not ( = ?auto_93435 ?auto_93434 ) ) ( not ( = ?auto_93435 ?auto_93432 ) ) ( ON ?auto_93433 ?auto_93435 ) ( ON ?auto_93432 ?auto_93436 ) ( CLEAR ?auto_93432 ) ( not ( = ?auto_93430 ?auto_93436 ) ) ( not ( = ?auto_93431 ?auto_93436 ) ) ( not ( = ?auto_93437 ?auto_93436 ) ) ( not ( = ?auto_93435 ?auto_93436 ) ) ( not ( = ?auto_93433 ?auto_93436 ) ) ( not ( = ?auto_93432 ?auto_93436 ) ) ( not ( = ?auto_93434 ?auto_93436 ) ) ( HOLDING ?auto_93434 ) ( CLEAR ?auto_93433 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93430 ?auto_93431 ?auto_93437 ?auto_93435 ?auto_93433 ?auto_93434 )
      ( MAKE-2PILE ?auto_93430 ?auto_93431 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93438 - BLOCK
      ?auto_93439 - BLOCK
    )
    :vars
    (
      ?auto_93444 - BLOCK
      ?auto_93445 - BLOCK
      ?auto_93442 - BLOCK
      ?auto_93443 - BLOCK
      ?auto_93440 - BLOCK
      ?auto_93441 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93444 ?auto_93439 ) ( ON-TABLE ?auto_93438 ) ( ON ?auto_93439 ?auto_93438 ) ( not ( = ?auto_93438 ?auto_93439 ) ) ( not ( = ?auto_93438 ?auto_93444 ) ) ( not ( = ?auto_93439 ?auto_93444 ) ) ( not ( = ?auto_93438 ?auto_93445 ) ) ( not ( = ?auto_93438 ?auto_93442 ) ) ( not ( = ?auto_93439 ?auto_93445 ) ) ( not ( = ?auto_93439 ?auto_93442 ) ) ( not ( = ?auto_93444 ?auto_93445 ) ) ( not ( = ?auto_93444 ?auto_93442 ) ) ( not ( = ?auto_93445 ?auto_93442 ) ) ( ON ?auto_93445 ?auto_93444 ) ( not ( = ?auto_93443 ?auto_93440 ) ) ( not ( = ?auto_93443 ?auto_93442 ) ) ( not ( = ?auto_93440 ?auto_93442 ) ) ( not ( = ?auto_93438 ?auto_93440 ) ) ( not ( = ?auto_93438 ?auto_93443 ) ) ( not ( = ?auto_93439 ?auto_93440 ) ) ( not ( = ?auto_93439 ?auto_93443 ) ) ( not ( = ?auto_93444 ?auto_93440 ) ) ( not ( = ?auto_93444 ?auto_93443 ) ) ( not ( = ?auto_93445 ?auto_93440 ) ) ( not ( = ?auto_93445 ?auto_93443 ) ) ( ON ?auto_93442 ?auto_93445 ) ( ON ?auto_93443 ?auto_93441 ) ( not ( = ?auto_93438 ?auto_93441 ) ) ( not ( = ?auto_93439 ?auto_93441 ) ) ( not ( = ?auto_93444 ?auto_93441 ) ) ( not ( = ?auto_93445 ?auto_93441 ) ) ( not ( = ?auto_93442 ?auto_93441 ) ) ( not ( = ?auto_93443 ?auto_93441 ) ) ( not ( = ?auto_93440 ?auto_93441 ) ) ( CLEAR ?auto_93442 ) ( ON ?auto_93440 ?auto_93443 ) ( CLEAR ?auto_93440 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93441 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93441 ?auto_93443 )
      ( MAKE-2PILE ?auto_93438 ?auto_93439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_93446 - BLOCK
      ?auto_93447 - BLOCK
    )
    :vars
    (
      ?auto_93449 - BLOCK
      ?auto_93453 - BLOCK
      ?auto_93452 - BLOCK
      ?auto_93448 - BLOCK
      ?auto_93450 - BLOCK
      ?auto_93451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93449 ?auto_93447 ) ( ON-TABLE ?auto_93446 ) ( ON ?auto_93447 ?auto_93446 ) ( not ( = ?auto_93446 ?auto_93447 ) ) ( not ( = ?auto_93446 ?auto_93449 ) ) ( not ( = ?auto_93447 ?auto_93449 ) ) ( not ( = ?auto_93446 ?auto_93453 ) ) ( not ( = ?auto_93446 ?auto_93452 ) ) ( not ( = ?auto_93447 ?auto_93453 ) ) ( not ( = ?auto_93447 ?auto_93452 ) ) ( not ( = ?auto_93449 ?auto_93453 ) ) ( not ( = ?auto_93449 ?auto_93452 ) ) ( not ( = ?auto_93453 ?auto_93452 ) ) ( ON ?auto_93453 ?auto_93449 ) ( not ( = ?auto_93448 ?auto_93450 ) ) ( not ( = ?auto_93448 ?auto_93452 ) ) ( not ( = ?auto_93450 ?auto_93452 ) ) ( not ( = ?auto_93446 ?auto_93450 ) ) ( not ( = ?auto_93446 ?auto_93448 ) ) ( not ( = ?auto_93447 ?auto_93450 ) ) ( not ( = ?auto_93447 ?auto_93448 ) ) ( not ( = ?auto_93449 ?auto_93450 ) ) ( not ( = ?auto_93449 ?auto_93448 ) ) ( not ( = ?auto_93453 ?auto_93450 ) ) ( not ( = ?auto_93453 ?auto_93448 ) ) ( ON ?auto_93448 ?auto_93451 ) ( not ( = ?auto_93446 ?auto_93451 ) ) ( not ( = ?auto_93447 ?auto_93451 ) ) ( not ( = ?auto_93449 ?auto_93451 ) ) ( not ( = ?auto_93453 ?auto_93451 ) ) ( not ( = ?auto_93452 ?auto_93451 ) ) ( not ( = ?auto_93448 ?auto_93451 ) ) ( not ( = ?auto_93450 ?auto_93451 ) ) ( ON ?auto_93450 ?auto_93448 ) ( CLEAR ?auto_93450 ) ( ON-TABLE ?auto_93451 ) ( HOLDING ?auto_93452 ) ( CLEAR ?auto_93453 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93446 ?auto_93447 ?auto_93449 ?auto_93453 ?auto_93452 )
      ( MAKE-2PILE ?auto_93446 ?auto_93447 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93497 - BLOCK
      ?auto_93498 - BLOCK
      ?auto_93499 - BLOCK
      ?auto_93500 - BLOCK
      ?auto_93501 - BLOCK
    )
    :vars
    (
      ?auto_93502 - BLOCK
      ?auto_93503 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93497 ) ( ON ?auto_93498 ?auto_93497 ) ( ON ?auto_93499 ?auto_93498 ) ( not ( = ?auto_93497 ?auto_93498 ) ) ( not ( = ?auto_93497 ?auto_93499 ) ) ( not ( = ?auto_93497 ?auto_93500 ) ) ( not ( = ?auto_93497 ?auto_93501 ) ) ( not ( = ?auto_93498 ?auto_93499 ) ) ( not ( = ?auto_93498 ?auto_93500 ) ) ( not ( = ?auto_93498 ?auto_93501 ) ) ( not ( = ?auto_93499 ?auto_93500 ) ) ( not ( = ?auto_93499 ?auto_93501 ) ) ( not ( = ?auto_93500 ?auto_93501 ) ) ( ON ?auto_93501 ?auto_93502 ) ( not ( = ?auto_93497 ?auto_93502 ) ) ( not ( = ?auto_93498 ?auto_93502 ) ) ( not ( = ?auto_93499 ?auto_93502 ) ) ( not ( = ?auto_93500 ?auto_93502 ) ) ( not ( = ?auto_93501 ?auto_93502 ) ) ( CLEAR ?auto_93499 ) ( ON ?auto_93500 ?auto_93501 ) ( CLEAR ?auto_93500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93503 ) ( ON ?auto_93502 ?auto_93503 ) ( not ( = ?auto_93503 ?auto_93502 ) ) ( not ( = ?auto_93503 ?auto_93501 ) ) ( not ( = ?auto_93503 ?auto_93500 ) ) ( not ( = ?auto_93497 ?auto_93503 ) ) ( not ( = ?auto_93498 ?auto_93503 ) ) ( not ( = ?auto_93499 ?auto_93503 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93503 ?auto_93502 ?auto_93501 )
      ( MAKE-5PILE ?auto_93497 ?auto_93498 ?auto_93499 ?auto_93500 ?auto_93501 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93504 - BLOCK
      ?auto_93505 - BLOCK
      ?auto_93506 - BLOCK
      ?auto_93507 - BLOCK
      ?auto_93508 - BLOCK
    )
    :vars
    (
      ?auto_93510 - BLOCK
      ?auto_93509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93504 ) ( ON ?auto_93505 ?auto_93504 ) ( not ( = ?auto_93504 ?auto_93505 ) ) ( not ( = ?auto_93504 ?auto_93506 ) ) ( not ( = ?auto_93504 ?auto_93507 ) ) ( not ( = ?auto_93504 ?auto_93508 ) ) ( not ( = ?auto_93505 ?auto_93506 ) ) ( not ( = ?auto_93505 ?auto_93507 ) ) ( not ( = ?auto_93505 ?auto_93508 ) ) ( not ( = ?auto_93506 ?auto_93507 ) ) ( not ( = ?auto_93506 ?auto_93508 ) ) ( not ( = ?auto_93507 ?auto_93508 ) ) ( ON ?auto_93508 ?auto_93510 ) ( not ( = ?auto_93504 ?auto_93510 ) ) ( not ( = ?auto_93505 ?auto_93510 ) ) ( not ( = ?auto_93506 ?auto_93510 ) ) ( not ( = ?auto_93507 ?auto_93510 ) ) ( not ( = ?auto_93508 ?auto_93510 ) ) ( ON ?auto_93507 ?auto_93508 ) ( CLEAR ?auto_93507 ) ( ON-TABLE ?auto_93509 ) ( ON ?auto_93510 ?auto_93509 ) ( not ( = ?auto_93509 ?auto_93510 ) ) ( not ( = ?auto_93509 ?auto_93508 ) ) ( not ( = ?auto_93509 ?auto_93507 ) ) ( not ( = ?auto_93504 ?auto_93509 ) ) ( not ( = ?auto_93505 ?auto_93509 ) ) ( not ( = ?auto_93506 ?auto_93509 ) ) ( HOLDING ?auto_93506 ) ( CLEAR ?auto_93505 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93504 ?auto_93505 ?auto_93506 )
      ( MAKE-5PILE ?auto_93504 ?auto_93505 ?auto_93506 ?auto_93507 ?auto_93508 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93511 - BLOCK
      ?auto_93512 - BLOCK
      ?auto_93513 - BLOCK
      ?auto_93514 - BLOCK
      ?auto_93515 - BLOCK
    )
    :vars
    (
      ?auto_93517 - BLOCK
      ?auto_93516 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93511 ) ( ON ?auto_93512 ?auto_93511 ) ( not ( = ?auto_93511 ?auto_93512 ) ) ( not ( = ?auto_93511 ?auto_93513 ) ) ( not ( = ?auto_93511 ?auto_93514 ) ) ( not ( = ?auto_93511 ?auto_93515 ) ) ( not ( = ?auto_93512 ?auto_93513 ) ) ( not ( = ?auto_93512 ?auto_93514 ) ) ( not ( = ?auto_93512 ?auto_93515 ) ) ( not ( = ?auto_93513 ?auto_93514 ) ) ( not ( = ?auto_93513 ?auto_93515 ) ) ( not ( = ?auto_93514 ?auto_93515 ) ) ( ON ?auto_93515 ?auto_93517 ) ( not ( = ?auto_93511 ?auto_93517 ) ) ( not ( = ?auto_93512 ?auto_93517 ) ) ( not ( = ?auto_93513 ?auto_93517 ) ) ( not ( = ?auto_93514 ?auto_93517 ) ) ( not ( = ?auto_93515 ?auto_93517 ) ) ( ON ?auto_93514 ?auto_93515 ) ( ON-TABLE ?auto_93516 ) ( ON ?auto_93517 ?auto_93516 ) ( not ( = ?auto_93516 ?auto_93517 ) ) ( not ( = ?auto_93516 ?auto_93515 ) ) ( not ( = ?auto_93516 ?auto_93514 ) ) ( not ( = ?auto_93511 ?auto_93516 ) ) ( not ( = ?auto_93512 ?auto_93516 ) ) ( not ( = ?auto_93513 ?auto_93516 ) ) ( CLEAR ?auto_93512 ) ( ON ?auto_93513 ?auto_93514 ) ( CLEAR ?auto_93513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93516 ?auto_93517 ?auto_93515 ?auto_93514 )
      ( MAKE-5PILE ?auto_93511 ?auto_93512 ?auto_93513 ?auto_93514 ?auto_93515 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93518 - BLOCK
      ?auto_93519 - BLOCK
      ?auto_93520 - BLOCK
      ?auto_93521 - BLOCK
      ?auto_93522 - BLOCK
    )
    :vars
    (
      ?auto_93524 - BLOCK
      ?auto_93523 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93518 ) ( not ( = ?auto_93518 ?auto_93519 ) ) ( not ( = ?auto_93518 ?auto_93520 ) ) ( not ( = ?auto_93518 ?auto_93521 ) ) ( not ( = ?auto_93518 ?auto_93522 ) ) ( not ( = ?auto_93519 ?auto_93520 ) ) ( not ( = ?auto_93519 ?auto_93521 ) ) ( not ( = ?auto_93519 ?auto_93522 ) ) ( not ( = ?auto_93520 ?auto_93521 ) ) ( not ( = ?auto_93520 ?auto_93522 ) ) ( not ( = ?auto_93521 ?auto_93522 ) ) ( ON ?auto_93522 ?auto_93524 ) ( not ( = ?auto_93518 ?auto_93524 ) ) ( not ( = ?auto_93519 ?auto_93524 ) ) ( not ( = ?auto_93520 ?auto_93524 ) ) ( not ( = ?auto_93521 ?auto_93524 ) ) ( not ( = ?auto_93522 ?auto_93524 ) ) ( ON ?auto_93521 ?auto_93522 ) ( ON-TABLE ?auto_93523 ) ( ON ?auto_93524 ?auto_93523 ) ( not ( = ?auto_93523 ?auto_93524 ) ) ( not ( = ?auto_93523 ?auto_93522 ) ) ( not ( = ?auto_93523 ?auto_93521 ) ) ( not ( = ?auto_93518 ?auto_93523 ) ) ( not ( = ?auto_93519 ?auto_93523 ) ) ( not ( = ?auto_93520 ?auto_93523 ) ) ( ON ?auto_93520 ?auto_93521 ) ( CLEAR ?auto_93520 ) ( HOLDING ?auto_93519 ) ( CLEAR ?auto_93518 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93518 ?auto_93519 )
      ( MAKE-5PILE ?auto_93518 ?auto_93519 ?auto_93520 ?auto_93521 ?auto_93522 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93525 - BLOCK
      ?auto_93526 - BLOCK
      ?auto_93527 - BLOCK
      ?auto_93528 - BLOCK
      ?auto_93529 - BLOCK
    )
    :vars
    (
      ?auto_93531 - BLOCK
      ?auto_93530 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93525 ) ( not ( = ?auto_93525 ?auto_93526 ) ) ( not ( = ?auto_93525 ?auto_93527 ) ) ( not ( = ?auto_93525 ?auto_93528 ) ) ( not ( = ?auto_93525 ?auto_93529 ) ) ( not ( = ?auto_93526 ?auto_93527 ) ) ( not ( = ?auto_93526 ?auto_93528 ) ) ( not ( = ?auto_93526 ?auto_93529 ) ) ( not ( = ?auto_93527 ?auto_93528 ) ) ( not ( = ?auto_93527 ?auto_93529 ) ) ( not ( = ?auto_93528 ?auto_93529 ) ) ( ON ?auto_93529 ?auto_93531 ) ( not ( = ?auto_93525 ?auto_93531 ) ) ( not ( = ?auto_93526 ?auto_93531 ) ) ( not ( = ?auto_93527 ?auto_93531 ) ) ( not ( = ?auto_93528 ?auto_93531 ) ) ( not ( = ?auto_93529 ?auto_93531 ) ) ( ON ?auto_93528 ?auto_93529 ) ( ON-TABLE ?auto_93530 ) ( ON ?auto_93531 ?auto_93530 ) ( not ( = ?auto_93530 ?auto_93531 ) ) ( not ( = ?auto_93530 ?auto_93529 ) ) ( not ( = ?auto_93530 ?auto_93528 ) ) ( not ( = ?auto_93525 ?auto_93530 ) ) ( not ( = ?auto_93526 ?auto_93530 ) ) ( not ( = ?auto_93527 ?auto_93530 ) ) ( ON ?auto_93527 ?auto_93528 ) ( CLEAR ?auto_93525 ) ( ON ?auto_93526 ?auto_93527 ) ( CLEAR ?auto_93526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93530 ?auto_93531 ?auto_93529 ?auto_93528 ?auto_93527 )
      ( MAKE-5PILE ?auto_93525 ?auto_93526 ?auto_93527 ?auto_93528 ?auto_93529 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93532 - BLOCK
      ?auto_93533 - BLOCK
      ?auto_93534 - BLOCK
      ?auto_93535 - BLOCK
      ?auto_93536 - BLOCK
    )
    :vars
    (
      ?auto_93537 - BLOCK
      ?auto_93538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93532 ?auto_93533 ) ) ( not ( = ?auto_93532 ?auto_93534 ) ) ( not ( = ?auto_93532 ?auto_93535 ) ) ( not ( = ?auto_93532 ?auto_93536 ) ) ( not ( = ?auto_93533 ?auto_93534 ) ) ( not ( = ?auto_93533 ?auto_93535 ) ) ( not ( = ?auto_93533 ?auto_93536 ) ) ( not ( = ?auto_93534 ?auto_93535 ) ) ( not ( = ?auto_93534 ?auto_93536 ) ) ( not ( = ?auto_93535 ?auto_93536 ) ) ( ON ?auto_93536 ?auto_93537 ) ( not ( = ?auto_93532 ?auto_93537 ) ) ( not ( = ?auto_93533 ?auto_93537 ) ) ( not ( = ?auto_93534 ?auto_93537 ) ) ( not ( = ?auto_93535 ?auto_93537 ) ) ( not ( = ?auto_93536 ?auto_93537 ) ) ( ON ?auto_93535 ?auto_93536 ) ( ON-TABLE ?auto_93538 ) ( ON ?auto_93537 ?auto_93538 ) ( not ( = ?auto_93538 ?auto_93537 ) ) ( not ( = ?auto_93538 ?auto_93536 ) ) ( not ( = ?auto_93538 ?auto_93535 ) ) ( not ( = ?auto_93532 ?auto_93538 ) ) ( not ( = ?auto_93533 ?auto_93538 ) ) ( not ( = ?auto_93534 ?auto_93538 ) ) ( ON ?auto_93534 ?auto_93535 ) ( ON ?auto_93533 ?auto_93534 ) ( CLEAR ?auto_93533 ) ( HOLDING ?auto_93532 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93532 )
      ( MAKE-5PILE ?auto_93532 ?auto_93533 ?auto_93534 ?auto_93535 ?auto_93536 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93539 - BLOCK
      ?auto_93540 - BLOCK
      ?auto_93541 - BLOCK
      ?auto_93542 - BLOCK
      ?auto_93543 - BLOCK
    )
    :vars
    (
      ?auto_93545 - BLOCK
      ?auto_93544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93539 ?auto_93540 ) ) ( not ( = ?auto_93539 ?auto_93541 ) ) ( not ( = ?auto_93539 ?auto_93542 ) ) ( not ( = ?auto_93539 ?auto_93543 ) ) ( not ( = ?auto_93540 ?auto_93541 ) ) ( not ( = ?auto_93540 ?auto_93542 ) ) ( not ( = ?auto_93540 ?auto_93543 ) ) ( not ( = ?auto_93541 ?auto_93542 ) ) ( not ( = ?auto_93541 ?auto_93543 ) ) ( not ( = ?auto_93542 ?auto_93543 ) ) ( ON ?auto_93543 ?auto_93545 ) ( not ( = ?auto_93539 ?auto_93545 ) ) ( not ( = ?auto_93540 ?auto_93545 ) ) ( not ( = ?auto_93541 ?auto_93545 ) ) ( not ( = ?auto_93542 ?auto_93545 ) ) ( not ( = ?auto_93543 ?auto_93545 ) ) ( ON ?auto_93542 ?auto_93543 ) ( ON-TABLE ?auto_93544 ) ( ON ?auto_93545 ?auto_93544 ) ( not ( = ?auto_93544 ?auto_93545 ) ) ( not ( = ?auto_93544 ?auto_93543 ) ) ( not ( = ?auto_93544 ?auto_93542 ) ) ( not ( = ?auto_93539 ?auto_93544 ) ) ( not ( = ?auto_93540 ?auto_93544 ) ) ( not ( = ?auto_93541 ?auto_93544 ) ) ( ON ?auto_93541 ?auto_93542 ) ( ON ?auto_93540 ?auto_93541 ) ( ON ?auto_93539 ?auto_93540 ) ( CLEAR ?auto_93539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93544 ?auto_93545 ?auto_93543 ?auto_93542 ?auto_93541 ?auto_93540 )
      ( MAKE-5PILE ?auto_93539 ?auto_93540 ?auto_93541 ?auto_93542 ?auto_93543 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93551 - BLOCK
      ?auto_93552 - BLOCK
      ?auto_93553 - BLOCK
      ?auto_93554 - BLOCK
      ?auto_93555 - BLOCK
    )
    :vars
    (
      ?auto_93557 - BLOCK
      ?auto_93556 - BLOCK
      ?auto_93558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93551 ?auto_93552 ) ) ( not ( = ?auto_93551 ?auto_93553 ) ) ( not ( = ?auto_93551 ?auto_93554 ) ) ( not ( = ?auto_93551 ?auto_93555 ) ) ( not ( = ?auto_93552 ?auto_93553 ) ) ( not ( = ?auto_93552 ?auto_93554 ) ) ( not ( = ?auto_93552 ?auto_93555 ) ) ( not ( = ?auto_93553 ?auto_93554 ) ) ( not ( = ?auto_93553 ?auto_93555 ) ) ( not ( = ?auto_93554 ?auto_93555 ) ) ( ON ?auto_93555 ?auto_93557 ) ( not ( = ?auto_93551 ?auto_93557 ) ) ( not ( = ?auto_93552 ?auto_93557 ) ) ( not ( = ?auto_93553 ?auto_93557 ) ) ( not ( = ?auto_93554 ?auto_93557 ) ) ( not ( = ?auto_93555 ?auto_93557 ) ) ( ON ?auto_93554 ?auto_93555 ) ( ON-TABLE ?auto_93556 ) ( ON ?auto_93557 ?auto_93556 ) ( not ( = ?auto_93556 ?auto_93557 ) ) ( not ( = ?auto_93556 ?auto_93555 ) ) ( not ( = ?auto_93556 ?auto_93554 ) ) ( not ( = ?auto_93551 ?auto_93556 ) ) ( not ( = ?auto_93552 ?auto_93556 ) ) ( not ( = ?auto_93553 ?auto_93556 ) ) ( ON ?auto_93553 ?auto_93554 ) ( ON ?auto_93552 ?auto_93553 ) ( CLEAR ?auto_93552 ) ( ON ?auto_93551 ?auto_93558 ) ( CLEAR ?auto_93551 ) ( HAND-EMPTY ) ( not ( = ?auto_93551 ?auto_93558 ) ) ( not ( = ?auto_93552 ?auto_93558 ) ) ( not ( = ?auto_93553 ?auto_93558 ) ) ( not ( = ?auto_93554 ?auto_93558 ) ) ( not ( = ?auto_93555 ?auto_93558 ) ) ( not ( = ?auto_93557 ?auto_93558 ) ) ( not ( = ?auto_93556 ?auto_93558 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93551 ?auto_93558 )
      ( MAKE-5PILE ?auto_93551 ?auto_93552 ?auto_93553 ?auto_93554 ?auto_93555 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93559 - BLOCK
      ?auto_93560 - BLOCK
      ?auto_93561 - BLOCK
      ?auto_93562 - BLOCK
      ?auto_93563 - BLOCK
    )
    :vars
    (
      ?auto_93565 - BLOCK
      ?auto_93566 - BLOCK
      ?auto_93564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93559 ?auto_93560 ) ) ( not ( = ?auto_93559 ?auto_93561 ) ) ( not ( = ?auto_93559 ?auto_93562 ) ) ( not ( = ?auto_93559 ?auto_93563 ) ) ( not ( = ?auto_93560 ?auto_93561 ) ) ( not ( = ?auto_93560 ?auto_93562 ) ) ( not ( = ?auto_93560 ?auto_93563 ) ) ( not ( = ?auto_93561 ?auto_93562 ) ) ( not ( = ?auto_93561 ?auto_93563 ) ) ( not ( = ?auto_93562 ?auto_93563 ) ) ( ON ?auto_93563 ?auto_93565 ) ( not ( = ?auto_93559 ?auto_93565 ) ) ( not ( = ?auto_93560 ?auto_93565 ) ) ( not ( = ?auto_93561 ?auto_93565 ) ) ( not ( = ?auto_93562 ?auto_93565 ) ) ( not ( = ?auto_93563 ?auto_93565 ) ) ( ON ?auto_93562 ?auto_93563 ) ( ON-TABLE ?auto_93566 ) ( ON ?auto_93565 ?auto_93566 ) ( not ( = ?auto_93566 ?auto_93565 ) ) ( not ( = ?auto_93566 ?auto_93563 ) ) ( not ( = ?auto_93566 ?auto_93562 ) ) ( not ( = ?auto_93559 ?auto_93566 ) ) ( not ( = ?auto_93560 ?auto_93566 ) ) ( not ( = ?auto_93561 ?auto_93566 ) ) ( ON ?auto_93561 ?auto_93562 ) ( ON ?auto_93559 ?auto_93564 ) ( CLEAR ?auto_93559 ) ( not ( = ?auto_93559 ?auto_93564 ) ) ( not ( = ?auto_93560 ?auto_93564 ) ) ( not ( = ?auto_93561 ?auto_93564 ) ) ( not ( = ?auto_93562 ?auto_93564 ) ) ( not ( = ?auto_93563 ?auto_93564 ) ) ( not ( = ?auto_93565 ?auto_93564 ) ) ( not ( = ?auto_93566 ?auto_93564 ) ) ( HOLDING ?auto_93560 ) ( CLEAR ?auto_93561 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93566 ?auto_93565 ?auto_93563 ?auto_93562 ?auto_93561 ?auto_93560 )
      ( MAKE-5PILE ?auto_93559 ?auto_93560 ?auto_93561 ?auto_93562 ?auto_93563 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93567 - BLOCK
      ?auto_93568 - BLOCK
      ?auto_93569 - BLOCK
      ?auto_93570 - BLOCK
      ?auto_93571 - BLOCK
    )
    :vars
    (
      ?auto_93572 - BLOCK
      ?auto_93574 - BLOCK
      ?auto_93573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93567 ?auto_93568 ) ) ( not ( = ?auto_93567 ?auto_93569 ) ) ( not ( = ?auto_93567 ?auto_93570 ) ) ( not ( = ?auto_93567 ?auto_93571 ) ) ( not ( = ?auto_93568 ?auto_93569 ) ) ( not ( = ?auto_93568 ?auto_93570 ) ) ( not ( = ?auto_93568 ?auto_93571 ) ) ( not ( = ?auto_93569 ?auto_93570 ) ) ( not ( = ?auto_93569 ?auto_93571 ) ) ( not ( = ?auto_93570 ?auto_93571 ) ) ( ON ?auto_93571 ?auto_93572 ) ( not ( = ?auto_93567 ?auto_93572 ) ) ( not ( = ?auto_93568 ?auto_93572 ) ) ( not ( = ?auto_93569 ?auto_93572 ) ) ( not ( = ?auto_93570 ?auto_93572 ) ) ( not ( = ?auto_93571 ?auto_93572 ) ) ( ON ?auto_93570 ?auto_93571 ) ( ON-TABLE ?auto_93574 ) ( ON ?auto_93572 ?auto_93574 ) ( not ( = ?auto_93574 ?auto_93572 ) ) ( not ( = ?auto_93574 ?auto_93571 ) ) ( not ( = ?auto_93574 ?auto_93570 ) ) ( not ( = ?auto_93567 ?auto_93574 ) ) ( not ( = ?auto_93568 ?auto_93574 ) ) ( not ( = ?auto_93569 ?auto_93574 ) ) ( ON ?auto_93569 ?auto_93570 ) ( ON ?auto_93567 ?auto_93573 ) ( not ( = ?auto_93567 ?auto_93573 ) ) ( not ( = ?auto_93568 ?auto_93573 ) ) ( not ( = ?auto_93569 ?auto_93573 ) ) ( not ( = ?auto_93570 ?auto_93573 ) ) ( not ( = ?auto_93571 ?auto_93573 ) ) ( not ( = ?auto_93572 ?auto_93573 ) ) ( not ( = ?auto_93574 ?auto_93573 ) ) ( CLEAR ?auto_93569 ) ( ON ?auto_93568 ?auto_93567 ) ( CLEAR ?auto_93568 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93573 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93573 ?auto_93567 )
      ( MAKE-5PILE ?auto_93567 ?auto_93568 ?auto_93569 ?auto_93570 ?auto_93571 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93575 - BLOCK
      ?auto_93576 - BLOCK
      ?auto_93577 - BLOCK
      ?auto_93578 - BLOCK
      ?auto_93579 - BLOCK
    )
    :vars
    (
      ?auto_93581 - BLOCK
      ?auto_93580 - BLOCK
      ?auto_93582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93575 ?auto_93576 ) ) ( not ( = ?auto_93575 ?auto_93577 ) ) ( not ( = ?auto_93575 ?auto_93578 ) ) ( not ( = ?auto_93575 ?auto_93579 ) ) ( not ( = ?auto_93576 ?auto_93577 ) ) ( not ( = ?auto_93576 ?auto_93578 ) ) ( not ( = ?auto_93576 ?auto_93579 ) ) ( not ( = ?auto_93577 ?auto_93578 ) ) ( not ( = ?auto_93577 ?auto_93579 ) ) ( not ( = ?auto_93578 ?auto_93579 ) ) ( ON ?auto_93579 ?auto_93581 ) ( not ( = ?auto_93575 ?auto_93581 ) ) ( not ( = ?auto_93576 ?auto_93581 ) ) ( not ( = ?auto_93577 ?auto_93581 ) ) ( not ( = ?auto_93578 ?auto_93581 ) ) ( not ( = ?auto_93579 ?auto_93581 ) ) ( ON ?auto_93578 ?auto_93579 ) ( ON-TABLE ?auto_93580 ) ( ON ?auto_93581 ?auto_93580 ) ( not ( = ?auto_93580 ?auto_93581 ) ) ( not ( = ?auto_93580 ?auto_93579 ) ) ( not ( = ?auto_93580 ?auto_93578 ) ) ( not ( = ?auto_93575 ?auto_93580 ) ) ( not ( = ?auto_93576 ?auto_93580 ) ) ( not ( = ?auto_93577 ?auto_93580 ) ) ( ON ?auto_93575 ?auto_93582 ) ( not ( = ?auto_93575 ?auto_93582 ) ) ( not ( = ?auto_93576 ?auto_93582 ) ) ( not ( = ?auto_93577 ?auto_93582 ) ) ( not ( = ?auto_93578 ?auto_93582 ) ) ( not ( = ?auto_93579 ?auto_93582 ) ) ( not ( = ?auto_93581 ?auto_93582 ) ) ( not ( = ?auto_93580 ?auto_93582 ) ) ( ON ?auto_93576 ?auto_93575 ) ( CLEAR ?auto_93576 ) ( ON-TABLE ?auto_93582 ) ( HOLDING ?auto_93577 ) ( CLEAR ?auto_93578 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93580 ?auto_93581 ?auto_93579 ?auto_93578 ?auto_93577 )
      ( MAKE-5PILE ?auto_93575 ?auto_93576 ?auto_93577 ?auto_93578 ?auto_93579 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93583 - BLOCK
      ?auto_93584 - BLOCK
      ?auto_93585 - BLOCK
      ?auto_93586 - BLOCK
      ?auto_93587 - BLOCK
    )
    :vars
    (
      ?auto_93590 - BLOCK
      ?auto_93588 - BLOCK
      ?auto_93589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93583 ?auto_93584 ) ) ( not ( = ?auto_93583 ?auto_93585 ) ) ( not ( = ?auto_93583 ?auto_93586 ) ) ( not ( = ?auto_93583 ?auto_93587 ) ) ( not ( = ?auto_93584 ?auto_93585 ) ) ( not ( = ?auto_93584 ?auto_93586 ) ) ( not ( = ?auto_93584 ?auto_93587 ) ) ( not ( = ?auto_93585 ?auto_93586 ) ) ( not ( = ?auto_93585 ?auto_93587 ) ) ( not ( = ?auto_93586 ?auto_93587 ) ) ( ON ?auto_93587 ?auto_93590 ) ( not ( = ?auto_93583 ?auto_93590 ) ) ( not ( = ?auto_93584 ?auto_93590 ) ) ( not ( = ?auto_93585 ?auto_93590 ) ) ( not ( = ?auto_93586 ?auto_93590 ) ) ( not ( = ?auto_93587 ?auto_93590 ) ) ( ON ?auto_93586 ?auto_93587 ) ( ON-TABLE ?auto_93588 ) ( ON ?auto_93590 ?auto_93588 ) ( not ( = ?auto_93588 ?auto_93590 ) ) ( not ( = ?auto_93588 ?auto_93587 ) ) ( not ( = ?auto_93588 ?auto_93586 ) ) ( not ( = ?auto_93583 ?auto_93588 ) ) ( not ( = ?auto_93584 ?auto_93588 ) ) ( not ( = ?auto_93585 ?auto_93588 ) ) ( ON ?auto_93583 ?auto_93589 ) ( not ( = ?auto_93583 ?auto_93589 ) ) ( not ( = ?auto_93584 ?auto_93589 ) ) ( not ( = ?auto_93585 ?auto_93589 ) ) ( not ( = ?auto_93586 ?auto_93589 ) ) ( not ( = ?auto_93587 ?auto_93589 ) ) ( not ( = ?auto_93590 ?auto_93589 ) ) ( not ( = ?auto_93588 ?auto_93589 ) ) ( ON ?auto_93584 ?auto_93583 ) ( ON-TABLE ?auto_93589 ) ( CLEAR ?auto_93586 ) ( ON ?auto_93585 ?auto_93584 ) ( CLEAR ?auto_93585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93589 ?auto_93583 ?auto_93584 )
      ( MAKE-5PILE ?auto_93583 ?auto_93584 ?auto_93585 ?auto_93586 ?auto_93587 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93591 - BLOCK
      ?auto_93592 - BLOCK
      ?auto_93593 - BLOCK
      ?auto_93594 - BLOCK
      ?auto_93595 - BLOCK
    )
    :vars
    (
      ?auto_93596 - BLOCK
      ?auto_93597 - BLOCK
      ?auto_93598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93591 ?auto_93592 ) ) ( not ( = ?auto_93591 ?auto_93593 ) ) ( not ( = ?auto_93591 ?auto_93594 ) ) ( not ( = ?auto_93591 ?auto_93595 ) ) ( not ( = ?auto_93592 ?auto_93593 ) ) ( not ( = ?auto_93592 ?auto_93594 ) ) ( not ( = ?auto_93592 ?auto_93595 ) ) ( not ( = ?auto_93593 ?auto_93594 ) ) ( not ( = ?auto_93593 ?auto_93595 ) ) ( not ( = ?auto_93594 ?auto_93595 ) ) ( ON ?auto_93595 ?auto_93596 ) ( not ( = ?auto_93591 ?auto_93596 ) ) ( not ( = ?auto_93592 ?auto_93596 ) ) ( not ( = ?auto_93593 ?auto_93596 ) ) ( not ( = ?auto_93594 ?auto_93596 ) ) ( not ( = ?auto_93595 ?auto_93596 ) ) ( ON-TABLE ?auto_93597 ) ( ON ?auto_93596 ?auto_93597 ) ( not ( = ?auto_93597 ?auto_93596 ) ) ( not ( = ?auto_93597 ?auto_93595 ) ) ( not ( = ?auto_93597 ?auto_93594 ) ) ( not ( = ?auto_93591 ?auto_93597 ) ) ( not ( = ?auto_93592 ?auto_93597 ) ) ( not ( = ?auto_93593 ?auto_93597 ) ) ( ON ?auto_93591 ?auto_93598 ) ( not ( = ?auto_93591 ?auto_93598 ) ) ( not ( = ?auto_93592 ?auto_93598 ) ) ( not ( = ?auto_93593 ?auto_93598 ) ) ( not ( = ?auto_93594 ?auto_93598 ) ) ( not ( = ?auto_93595 ?auto_93598 ) ) ( not ( = ?auto_93596 ?auto_93598 ) ) ( not ( = ?auto_93597 ?auto_93598 ) ) ( ON ?auto_93592 ?auto_93591 ) ( ON-TABLE ?auto_93598 ) ( ON ?auto_93593 ?auto_93592 ) ( CLEAR ?auto_93593 ) ( HOLDING ?auto_93594 ) ( CLEAR ?auto_93595 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93597 ?auto_93596 ?auto_93595 ?auto_93594 )
      ( MAKE-5PILE ?auto_93591 ?auto_93592 ?auto_93593 ?auto_93594 ?auto_93595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93599 - BLOCK
      ?auto_93600 - BLOCK
      ?auto_93601 - BLOCK
      ?auto_93602 - BLOCK
      ?auto_93603 - BLOCK
    )
    :vars
    (
      ?auto_93605 - BLOCK
      ?auto_93606 - BLOCK
      ?auto_93604 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93599 ?auto_93600 ) ) ( not ( = ?auto_93599 ?auto_93601 ) ) ( not ( = ?auto_93599 ?auto_93602 ) ) ( not ( = ?auto_93599 ?auto_93603 ) ) ( not ( = ?auto_93600 ?auto_93601 ) ) ( not ( = ?auto_93600 ?auto_93602 ) ) ( not ( = ?auto_93600 ?auto_93603 ) ) ( not ( = ?auto_93601 ?auto_93602 ) ) ( not ( = ?auto_93601 ?auto_93603 ) ) ( not ( = ?auto_93602 ?auto_93603 ) ) ( ON ?auto_93603 ?auto_93605 ) ( not ( = ?auto_93599 ?auto_93605 ) ) ( not ( = ?auto_93600 ?auto_93605 ) ) ( not ( = ?auto_93601 ?auto_93605 ) ) ( not ( = ?auto_93602 ?auto_93605 ) ) ( not ( = ?auto_93603 ?auto_93605 ) ) ( ON-TABLE ?auto_93606 ) ( ON ?auto_93605 ?auto_93606 ) ( not ( = ?auto_93606 ?auto_93605 ) ) ( not ( = ?auto_93606 ?auto_93603 ) ) ( not ( = ?auto_93606 ?auto_93602 ) ) ( not ( = ?auto_93599 ?auto_93606 ) ) ( not ( = ?auto_93600 ?auto_93606 ) ) ( not ( = ?auto_93601 ?auto_93606 ) ) ( ON ?auto_93599 ?auto_93604 ) ( not ( = ?auto_93599 ?auto_93604 ) ) ( not ( = ?auto_93600 ?auto_93604 ) ) ( not ( = ?auto_93601 ?auto_93604 ) ) ( not ( = ?auto_93602 ?auto_93604 ) ) ( not ( = ?auto_93603 ?auto_93604 ) ) ( not ( = ?auto_93605 ?auto_93604 ) ) ( not ( = ?auto_93606 ?auto_93604 ) ) ( ON ?auto_93600 ?auto_93599 ) ( ON-TABLE ?auto_93604 ) ( ON ?auto_93601 ?auto_93600 ) ( CLEAR ?auto_93603 ) ( ON ?auto_93602 ?auto_93601 ) ( CLEAR ?auto_93602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93604 ?auto_93599 ?auto_93600 ?auto_93601 )
      ( MAKE-5PILE ?auto_93599 ?auto_93600 ?auto_93601 ?auto_93602 ?auto_93603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93607 - BLOCK
      ?auto_93608 - BLOCK
      ?auto_93609 - BLOCK
      ?auto_93610 - BLOCK
      ?auto_93611 - BLOCK
    )
    :vars
    (
      ?auto_93613 - BLOCK
      ?auto_93614 - BLOCK
      ?auto_93612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93607 ?auto_93608 ) ) ( not ( = ?auto_93607 ?auto_93609 ) ) ( not ( = ?auto_93607 ?auto_93610 ) ) ( not ( = ?auto_93607 ?auto_93611 ) ) ( not ( = ?auto_93608 ?auto_93609 ) ) ( not ( = ?auto_93608 ?auto_93610 ) ) ( not ( = ?auto_93608 ?auto_93611 ) ) ( not ( = ?auto_93609 ?auto_93610 ) ) ( not ( = ?auto_93609 ?auto_93611 ) ) ( not ( = ?auto_93610 ?auto_93611 ) ) ( not ( = ?auto_93607 ?auto_93613 ) ) ( not ( = ?auto_93608 ?auto_93613 ) ) ( not ( = ?auto_93609 ?auto_93613 ) ) ( not ( = ?auto_93610 ?auto_93613 ) ) ( not ( = ?auto_93611 ?auto_93613 ) ) ( ON-TABLE ?auto_93614 ) ( ON ?auto_93613 ?auto_93614 ) ( not ( = ?auto_93614 ?auto_93613 ) ) ( not ( = ?auto_93614 ?auto_93611 ) ) ( not ( = ?auto_93614 ?auto_93610 ) ) ( not ( = ?auto_93607 ?auto_93614 ) ) ( not ( = ?auto_93608 ?auto_93614 ) ) ( not ( = ?auto_93609 ?auto_93614 ) ) ( ON ?auto_93607 ?auto_93612 ) ( not ( = ?auto_93607 ?auto_93612 ) ) ( not ( = ?auto_93608 ?auto_93612 ) ) ( not ( = ?auto_93609 ?auto_93612 ) ) ( not ( = ?auto_93610 ?auto_93612 ) ) ( not ( = ?auto_93611 ?auto_93612 ) ) ( not ( = ?auto_93613 ?auto_93612 ) ) ( not ( = ?auto_93614 ?auto_93612 ) ) ( ON ?auto_93608 ?auto_93607 ) ( ON-TABLE ?auto_93612 ) ( ON ?auto_93609 ?auto_93608 ) ( ON ?auto_93610 ?auto_93609 ) ( CLEAR ?auto_93610 ) ( HOLDING ?auto_93611 ) ( CLEAR ?auto_93613 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93614 ?auto_93613 ?auto_93611 )
      ( MAKE-5PILE ?auto_93607 ?auto_93608 ?auto_93609 ?auto_93610 ?auto_93611 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93615 - BLOCK
      ?auto_93616 - BLOCK
      ?auto_93617 - BLOCK
      ?auto_93618 - BLOCK
      ?auto_93619 - BLOCK
    )
    :vars
    (
      ?auto_93620 - BLOCK
      ?auto_93622 - BLOCK
      ?auto_93621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93615 ?auto_93616 ) ) ( not ( = ?auto_93615 ?auto_93617 ) ) ( not ( = ?auto_93615 ?auto_93618 ) ) ( not ( = ?auto_93615 ?auto_93619 ) ) ( not ( = ?auto_93616 ?auto_93617 ) ) ( not ( = ?auto_93616 ?auto_93618 ) ) ( not ( = ?auto_93616 ?auto_93619 ) ) ( not ( = ?auto_93617 ?auto_93618 ) ) ( not ( = ?auto_93617 ?auto_93619 ) ) ( not ( = ?auto_93618 ?auto_93619 ) ) ( not ( = ?auto_93615 ?auto_93620 ) ) ( not ( = ?auto_93616 ?auto_93620 ) ) ( not ( = ?auto_93617 ?auto_93620 ) ) ( not ( = ?auto_93618 ?auto_93620 ) ) ( not ( = ?auto_93619 ?auto_93620 ) ) ( ON-TABLE ?auto_93622 ) ( ON ?auto_93620 ?auto_93622 ) ( not ( = ?auto_93622 ?auto_93620 ) ) ( not ( = ?auto_93622 ?auto_93619 ) ) ( not ( = ?auto_93622 ?auto_93618 ) ) ( not ( = ?auto_93615 ?auto_93622 ) ) ( not ( = ?auto_93616 ?auto_93622 ) ) ( not ( = ?auto_93617 ?auto_93622 ) ) ( ON ?auto_93615 ?auto_93621 ) ( not ( = ?auto_93615 ?auto_93621 ) ) ( not ( = ?auto_93616 ?auto_93621 ) ) ( not ( = ?auto_93617 ?auto_93621 ) ) ( not ( = ?auto_93618 ?auto_93621 ) ) ( not ( = ?auto_93619 ?auto_93621 ) ) ( not ( = ?auto_93620 ?auto_93621 ) ) ( not ( = ?auto_93622 ?auto_93621 ) ) ( ON ?auto_93616 ?auto_93615 ) ( ON-TABLE ?auto_93621 ) ( ON ?auto_93617 ?auto_93616 ) ( ON ?auto_93618 ?auto_93617 ) ( CLEAR ?auto_93620 ) ( ON ?auto_93619 ?auto_93618 ) ( CLEAR ?auto_93619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93621 ?auto_93615 ?auto_93616 ?auto_93617 ?auto_93618 )
      ( MAKE-5PILE ?auto_93615 ?auto_93616 ?auto_93617 ?auto_93618 ?auto_93619 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93623 - BLOCK
      ?auto_93624 - BLOCK
      ?auto_93625 - BLOCK
      ?auto_93626 - BLOCK
      ?auto_93627 - BLOCK
    )
    :vars
    (
      ?auto_93628 - BLOCK
      ?auto_93629 - BLOCK
      ?auto_93630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93623 ?auto_93624 ) ) ( not ( = ?auto_93623 ?auto_93625 ) ) ( not ( = ?auto_93623 ?auto_93626 ) ) ( not ( = ?auto_93623 ?auto_93627 ) ) ( not ( = ?auto_93624 ?auto_93625 ) ) ( not ( = ?auto_93624 ?auto_93626 ) ) ( not ( = ?auto_93624 ?auto_93627 ) ) ( not ( = ?auto_93625 ?auto_93626 ) ) ( not ( = ?auto_93625 ?auto_93627 ) ) ( not ( = ?auto_93626 ?auto_93627 ) ) ( not ( = ?auto_93623 ?auto_93628 ) ) ( not ( = ?auto_93624 ?auto_93628 ) ) ( not ( = ?auto_93625 ?auto_93628 ) ) ( not ( = ?auto_93626 ?auto_93628 ) ) ( not ( = ?auto_93627 ?auto_93628 ) ) ( ON-TABLE ?auto_93629 ) ( not ( = ?auto_93629 ?auto_93628 ) ) ( not ( = ?auto_93629 ?auto_93627 ) ) ( not ( = ?auto_93629 ?auto_93626 ) ) ( not ( = ?auto_93623 ?auto_93629 ) ) ( not ( = ?auto_93624 ?auto_93629 ) ) ( not ( = ?auto_93625 ?auto_93629 ) ) ( ON ?auto_93623 ?auto_93630 ) ( not ( = ?auto_93623 ?auto_93630 ) ) ( not ( = ?auto_93624 ?auto_93630 ) ) ( not ( = ?auto_93625 ?auto_93630 ) ) ( not ( = ?auto_93626 ?auto_93630 ) ) ( not ( = ?auto_93627 ?auto_93630 ) ) ( not ( = ?auto_93628 ?auto_93630 ) ) ( not ( = ?auto_93629 ?auto_93630 ) ) ( ON ?auto_93624 ?auto_93623 ) ( ON-TABLE ?auto_93630 ) ( ON ?auto_93625 ?auto_93624 ) ( ON ?auto_93626 ?auto_93625 ) ( ON ?auto_93627 ?auto_93626 ) ( CLEAR ?auto_93627 ) ( HOLDING ?auto_93628 ) ( CLEAR ?auto_93629 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93629 ?auto_93628 )
      ( MAKE-5PILE ?auto_93623 ?auto_93624 ?auto_93625 ?auto_93626 ?auto_93627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93631 - BLOCK
      ?auto_93632 - BLOCK
      ?auto_93633 - BLOCK
      ?auto_93634 - BLOCK
      ?auto_93635 - BLOCK
    )
    :vars
    (
      ?auto_93636 - BLOCK
      ?auto_93638 - BLOCK
      ?auto_93637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93631 ?auto_93632 ) ) ( not ( = ?auto_93631 ?auto_93633 ) ) ( not ( = ?auto_93631 ?auto_93634 ) ) ( not ( = ?auto_93631 ?auto_93635 ) ) ( not ( = ?auto_93632 ?auto_93633 ) ) ( not ( = ?auto_93632 ?auto_93634 ) ) ( not ( = ?auto_93632 ?auto_93635 ) ) ( not ( = ?auto_93633 ?auto_93634 ) ) ( not ( = ?auto_93633 ?auto_93635 ) ) ( not ( = ?auto_93634 ?auto_93635 ) ) ( not ( = ?auto_93631 ?auto_93636 ) ) ( not ( = ?auto_93632 ?auto_93636 ) ) ( not ( = ?auto_93633 ?auto_93636 ) ) ( not ( = ?auto_93634 ?auto_93636 ) ) ( not ( = ?auto_93635 ?auto_93636 ) ) ( ON-TABLE ?auto_93638 ) ( not ( = ?auto_93638 ?auto_93636 ) ) ( not ( = ?auto_93638 ?auto_93635 ) ) ( not ( = ?auto_93638 ?auto_93634 ) ) ( not ( = ?auto_93631 ?auto_93638 ) ) ( not ( = ?auto_93632 ?auto_93638 ) ) ( not ( = ?auto_93633 ?auto_93638 ) ) ( ON ?auto_93631 ?auto_93637 ) ( not ( = ?auto_93631 ?auto_93637 ) ) ( not ( = ?auto_93632 ?auto_93637 ) ) ( not ( = ?auto_93633 ?auto_93637 ) ) ( not ( = ?auto_93634 ?auto_93637 ) ) ( not ( = ?auto_93635 ?auto_93637 ) ) ( not ( = ?auto_93636 ?auto_93637 ) ) ( not ( = ?auto_93638 ?auto_93637 ) ) ( ON ?auto_93632 ?auto_93631 ) ( ON-TABLE ?auto_93637 ) ( ON ?auto_93633 ?auto_93632 ) ( ON ?auto_93634 ?auto_93633 ) ( ON ?auto_93635 ?auto_93634 ) ( CLEAR ?auto_93638 ) ( ON ?auto_93636 ?auto_93635 ) ( CLEAR ?auto_93636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93637 ?auto_93631 ?auto_93632 ?auto_93633 ?auto_93634 ?auto_93635 )
      ( MAKE-5PILE ?auto_93631 ?auto_93632 ?auto_93633 ?auto_93634 ?auto_93635 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93639 - BLOCK
      ?auto_93640 - BLOCK
      ?auto_93641 - BLOCK
      ?auto_93642 - BLOCK
      ?auto_93643 - BLOCK
    )
    :vars
    (
      ?auto_93646 - BLOCK
      ?auto_93645 - BLOCK
      ?auto_93644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93639 ?auto_93640 ) ) ( not ( = ?auto_93639 ?auto_93641 ) ) ( not ( = ?auto_93639 ?auto_93642 ) ) ( not ( = ?auto_93639 ?auto_93643 ) ) ( not ( = ?auto_93640 ?auto_93641 ) ) ( not ( = ?auto_93640 ?auto_93642 ) ) ( not ( = ?auto_93640 ?auto_93643 ) ) ( not ( = ?auto_93641 ?auto_93642 ) ) ( not ( = ?auto_93641 ?auto_93643 ) ) ( not ( = ?auto_93642 ?auto_93643 ) ) ( not ( = ?auto_93639 ?auto_93646 ) ) ( not ( = ?auto_93640 ?auto_93646 ) ) ( not ( = ?auto_93641 ?auto_93646 ) ) ( not ( = ?auto_93642 ?auto_93646 ) ) ( not ( = ?auto_93643 ?auto_93646 ) ) ( not ( = ?auto_93645 ?auto_93646 ) ) ( not ( = ?auto_93645 ?auto_93643 ) ) ( not ( = ?auto_93645 ?auto_93642 ) ) ( not ( = ?auto_93639 ?auto_93645 ) ) ( not ( = ?auto_93640 ?auto_93645 ) ) ( not ( = ?auto_93641 ?auto_93645 ) ) ( ON ?auto_93639 ?auto_93644 ) ( not ( = ?auto_93639 ?auto_93644 ) ) ( not ( = ?auto_93640 ?auto_93644 ) ) ( not ( = ?auto_93641 ?auto_93644 ) ) ( not ( = ?auto_93642 ?auto_93644 ) ) ( not ( = ?auto_93643 ?auto_93644 ) ) ( not ( = ?auto_93646 ?auto_93644 ) ) ( not ( = ?auto_93645 ?auto_93644 ) ) ( ON ?auto_93640 ?auto_93639 ) ( ON-TABLE ?auto_93644 ) ( ON ?auto_93641 ?auto_93640 ) ( ON ?auto_93642 ?auto_93641 ) ( ON ?auto_93643 ?auto_93642 ) ( ON ?auto_93646 ?auto_93643 ) ( CLEAR ?auto_93646 ) ( HOLDING ?auto_93645 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93645 )
      ( MAKE-5PILE ?auto_93639 ?auto_93640 ?auto_93641 ?auto_93642 ?auto_93643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_93647 - BLOCK
      ?auto_93648 - BLOCK
      ?auto_93649 - BLOCK
      ?auto_93650 - BLOCK
      ?auto_93651 - BLOCK
    )
    :vars
    (
      ?auto_93654 - BLOCK
      ?auto_93653 - BLOCK
      ?auto_93652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93647 ?auto_93648 ) ) ( not ( = ?auto_93647 ?auto_93649 ) ) ( not ( = ?auto_93647 ?auto_93650 ) ) ( not ( = ?auto_93647 ?auto_93651 ) ) ( not ( = ?auto_93648 ?auto_93649 ) ) ( not ( = ?auto_93648 ?auto_93650 ) ) ( not ( = ?auto_93648 ?auto_93651 ) ) ( not ( = ?auto_93649 ?auto_93650 ) ) ( not ( = ?auto_93649 ?auto_93651 ) ) ( not ( = ?auto_93650 ?auto_93651 ) ) ( not ( = ?auto_93647 ?auto_93654 ) ) ( not ( = ?auto_93648 ?auto_93654 ) ) ( not ( = ?auto_93649 ?auto_93654 ) ) ( not ( = ?auto_93650 ?auto_93654 ) ) ( not ( = ?auto_93651 ?auto_93654 ) ) ( not ( = ?auto_93653 ?auto_93654 ) ) ( not ( = ?auto_93653 ?auto_93651 ) ) ( not ( = ?auto_93653 ?auto_93650 ) ) ( not ( = ?auto_93647 ?auto_93653 ) ) ( not ( = ?auto_93648 ?auto_93653 ) ) ( not ( = ?auto_93649 ?auto_93653 ) ) ( ON ?auto_93647 ?auto_93652 ) ( not ( = ?auto_93647 ?auto_93652 ) ) ( not ( = ?auto_93648 ?auto_93652 ) ) ( not ( = ?auto_93649 ?auto_93652 ) ) ( not ( = ?auto_93650 ?auto_93652 ) ) ( not ( = ?auto_93651 ?auto_93652 ) ) ( not ( = ?auto_93654 ?auto_93652 ) ) ( not ( = ?auto_93653 ?auto_93652 ) ) ( ON ?auto_93648 ?auto_93647 ) ( ON-TABLE ?auto_93652 ) ( ON ?auto_93649 ?auto_93648 ) ( ON ?auto_93650 ?auto_93649 ) ( ON ?auto_93651 ?auto_93650 ) ( ON ?auto_93654 ?auto_93651 ) ( ON ?auto_93653 ?auto_93654 ) ( CLEAR ?auto_93653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93652 ?auto_93647 ?auto_93648 ?auto_93649 ?auto_93650 ?auto_93651 ?auto_93654 )
      ( MAKE-5PILE ?auto_93647 ?auto_93648 ?auto_93649 ?auto_93650 ?auto_93651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93666 - BLOCK
    )
    :vars
    (
      ?auto_93667 - BLOCK
      ?auto_93669 - BLOCK
      ?auto_93668 - BLOCK
      ?auto_93670 - BLOCK
      ?auto_93672 - BLOCK
      ?auto_93671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93667 ?auto_93666 ) ( ON-TABLE ?auto_93666 ) ( not ( = ?auto_93666 ?auto_93667 ) ) ( not ( = ?auto_93666 ?auto_93669 ) ) ( not ( = ?auto_93666 ?auto_93668 ) ) ( not ( = ?auto_93667 ?auto_93669 ) ) ( not ( = ?auto_93667 ?auto_93668 ) ) ( not ( = ?auto_93669 ?auto_93668 ) ) ( ON ?auto_93669 ?auto_93667 ) ( CLEAR ?auto_93669 ) ( HOLDING ?auto_93668 ) ( CLEAR ?auto_93670 ) ( ON-TABLE ?auto_93672 ) ( ON ?auto_93671 ?auto_93672 ) ( ON ?auto_93670 ?auto_93671 ) ( not ( = ?auto_93672 ?auto_93671 ) ) ( not ( = ?auto_93672 ?auto_93670 ) ) ( not ( = ?auto_93672 ?auto_93668 ) ) ( not ( = ?auto_93671 ?auto_93670 ) ) ( not ( = ?auto_93671 ?auto_93668 ) ) ( not ( = ?auto_93670 ?auto_93668 ) ) ( not ( = ?auto_93666 ?auto_93670 ) ) ( not ( = ?auto_93666 ?auto_93672 ) ) ( not ( = ?auto_93666 ?auto_93671 ) ) ( not ( = ?auto_93667 ?auto_93670 ) ) ( not ( = ?auto_93667 ?auto_93672 ) ) ( not ( = ?auto_93667 ?auto_93671 ) ) ( not ( = ?auto_93669 ?auto_93670 ) ) ( not ( = ?auto_93669 ?auto_93672 ) ) ( not ( = ?auto_93669 ?auto_93671 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93672 ?auto_93671 ?auto_93670 ?auto_93668 )
      ( MAKE-1PILE ?auto_93666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93673 - BLOCK
    )
    :vars
    (
      ?auto_93677 - BLOCK
      ?auto_93679 - BLOCK
      ?auto_93678 - BLOCK
      ?auto_93675 - BLOCK
      ?auto_93674 - BLOCK
      ?auto_93676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93677 ?auto_93673 ) ( ON-TABLE ?auto_93673 ) ( not ( = ?auto_93673 ?auto_93677 ) ) ( not ( = ?auto_93673 ?auto_93679 ) ) ( not ( = ?auto_93673 ?auto_93678 ) ) ( not ( = ?auto_93677 ?auto_93679 ) ) ( not ( = ?auto_93677 ?auto_93678 ) ) ( not ( = ?auto_93679 ?auto_93678 ) ) ( ON ?auto_93679 ?auto_93677 ) ( CLEAR ?auto_93675 ) ( ON-TABLE ?auto_93674 ) ( ON ?auto_93676 ?auto_93674 ) ( ON ?auto_93675 ?auto_93676 ) ( not ( = ?auto_93674 ?auto_93676 ) ) ( not ( = ?auto_93674 ?auto_93675 ) ) ( not ( = ?auto_93674 ?auto_93678 ) ) ( not ( = ?auto_93676 ?auto_93675 ) ) ( not ( = ?auto_93676 ?auto_93678 ) ) ( not ( = ?auto_93675 ?auto_93678 ) ) ( not ( = ?auto_93673 ?auto_93675 ) ) ( not ( = ?auto_93673 ?auto_93674 ) ) ( not ( = ?auto_93673 ?auto_93676 ) ) ( not ( = ?auto_93677 ?auto_93675 ) ) ( not ( = ?auto_93677 ?auto_93674 ) ) ( not ( = ?auto_93677 ?auto_93676 ) ) ( not ( = ?auto_93679 ?auto_93675 ) ) ( not ( = ?auto_93679 ?auto_93674 ) ) ( not ( = ?auto_93679 ?auto_93676 ) ) ( ON ?auto_93678 ?auto_93679 ) ( CLEAR ?auto_93678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93673 ?auto_93677 ?auto_93679 )
      ( MAKE-1PILE ?auto_93673 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93680 - BLOCK
    )
    :vars
    (
      ?auto_93686 - BLOCK
      ?auto_93684 - BLOCK
      ?auto_93685 - BLOCK
      ?auto_93683 - BLOCK
      ?auto_93682 - BLOCK
      ?auto_93681 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93686 ?auto_93680 ) ( ON-TABLE ?auto_93680 ) ( not ( = ?auto_93680 ?auto_93686 ) ) ( not ( = ?auto_93680 ?auto_93684 ) ) ( not ( = ?auto_93680 ?auto_93685 ) ) ( not ( = ?auto_93686 ?auto_93684 ) ) ( not ( = ?auto_93686 ?auto_93685 ) ) ( not ( = ?auto_93684 ?auto_93685 ) ) ( ON ?auto_93684 ?auto_93686 ) ( ON-TABLE ?auto_93683 ) ( ON ?auto_93682 ?auto_93683 ) ( not ( = ?auto_93683 ?auto_93682 ) ) ( not ( = ?auto_93683 ?auto_93681 ) ) ( not ( = ?auto_93683 ?auto_93685 ) ) ( not ( = ?auto_93682 ?auto_93681 ) ) ( not ( = ?auto_93682 ?auto_93685 ) ) ( not ( = ?auto_93681 ?auto_93685 ) ) ( not ( = ?auto_93680 ?auto_93681 ) ) ( not ( = ?auto_93680 ?auto_93683 ) ) ( not ( = ?auto_93680 ?auto_93682 ) ) ( not ( = ?auto_93686 ?auto_93681 ) ) ( not ( = ?auto_93686 ?auto_93683 ) ) ( not ( = ?auto_93686 ?auto_93682 ) ) ( not ( = ?auto_93684 ?auto_93681 ) ) ( not ( = ?auto_93684 ?auto_93683 ) ) ( not ( = ?auto_93684 ?auto_93682 ) ) ( ON ?auto_93685 ?auto_93684 ) ( CLEAR ?auto_93685 ) ( HOLDING ?auto_93681 ) ( CLEAR ?auto_93682 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93683 ?auto_93682 ?auto_93681 )
      ( MAKE-1PILE ?auto_93680 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93687 - BLOCK
    )
    :vars
    (
      ?auto_93690 - BLOCK
      ?auto_93691 - BLOCK
      ?auto_93688 - BLOCK
      ?auto_93692 - BLOCK
      ?auto_93693 - BLOCK
      ?auto_93689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93690 ?auto_93687 ) ( ON-TABLE ?auto_93687 ) ( not ( = ?auto_93687 ?auto_93690 ) ) ( not ( = ?auto_93687 ?auto_93691 ) ) ( not ( = ?auto_93687 ?auto_93688 ) ) ( not ( = ?auto_93690 ?auto_93691 ) ) ( not ( = ?auto_93690 ?auto_93688 ) ) ( not ( = ?auto_93691 ?auto_93688 ) ) ( ON ?auto_93691 ?auto_93690 ) ( ON-TABLE ?auto_93692 ) ( ON ?auto_93693 ?auto_93692 ) ( not ( = ?auto_93692 ?auto_93693 ) ) ( not ( = ?auto_93692 ?auto_93689 ) ) ( not ( = ?auto_93692 ?auto_93688 ) ) ( not ( = ?auto_93693 ?auto_93689 ) ) ( not ( = ?auto_93693 ?auto_93688 ) ) ( not ( = ?auto_93689 ?auto_93688 ) ) ( not ( = ?auto_93687 ?auto_93689 ) ) ( not ( = ?auto_93687 ?auto_93692 ) ) ( not ( = ?auto_93687 ?auto_93693 ) ) ( not ( = ?auto_93690 ?auto_93689 ) ) ( not ( = ?auto_93690 ?auto_93692 ) ) ( not ( = ?auto_93690 ?auto_93693 ) ) ( not ( = ?auto_93691 ?auto_93689 ) ) ( not ( = ?auto_93691 ?auto_93692 ) ) ( not ( = ?auto_93691 ?auto_93693 ) ) ( ON ?auto_93688 ?auto_93691 ) ( CLEAR ?auto_93693 ) ( ON ?auto_93689 ?auto_93688 ) ( CLEAR ?auto_93689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93687 ?auto_93690 ?auto_93691 ?auto_93688 )
      ( MAKE-1PILE ?auto_93687 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93694 - BLOCK
    )
    :vars
    (
      ?auto_93695 - BLOCK
      ?auto_93696 - BLOCK
      ?auto_93697 - BLOCK
      ?auto_93698 - BLOCK
      ?auto_93700 - BLOCK
      ?auto_93699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93695 ?auto_93694 ) ( ON-TABLE ?auto_93694 ) ( not ( = ?auto_93694 ?auto_93695 ) ) ( not ( = ?auto_93694 ?auto_93696 ) ) ( not ( = ?auto_93694 ?auto_93697 ) ) ( not ( = ?auto_93695 ?auto_93696 ) ) ( not ( = ?auto_93695 ?auto_93697 ) ) ( not ( = ?auto_93696 ?auto_93697 ) ) ( ON ?auto_93696 ?auto_93695 ) ( ON-TABLE ?auto_93698 ) ( not ( = ?auto_93698 ?auto_93700 ) ) ( not ( = ?auto_93698 ?auto_93699 ) ) ( not ( = ?auto_93698 ?auto_93697 ) ) ( not ( = ?auto_93700 ?auto_93699 ) ) ( not ( = ?auto_93700 ?auto_93697 ) ) ( not ( = ?auto_93699 ?auto_93697 ) ) ( not ( = ?auto_93694 ?auto_93699 ) ) ( not ( = ?auto_93694 ?auto_93698 ) ) ( not ( = ?auto_93694 ?auto_93700 ) ) ( not ( = ?auto_93695 ?auto_93699 ) ) ( not ( = ?auto_93695 ?auto_93698 ) ) ( not ( = ?auto_93695 ?auto_93700 ) ) ( not ( = ?auto_93696 ?auto_93699 ) ) ( not ( = ?auto_93696 ?auto_93698 ) ) ( not ( = ?auto_93696 ?auto_93700 ) ) ( ON ?auto_93697 ?auto_93696 ) ( ON ?auto_93699 ?auto_93697 ) ( CLEAR ?auto_93699 ) ( HOLDING ?auto_93700 ) ( CLEAR ?auto_93698 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93698 ?auto_93700 )
      ( MAKE-1PILE ?auto_93694 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93701 - BLOCK
    )
    :vars
    (
      ?auto_93705 - BLOCK
      ?auto_93707 - BLOCK
      ?auto_93704 - BLOCK
      ?auto_93703 - BLOCK
      ?auto_93706 - BLOCK
      ?auto_93702 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93705 ?auto_93701 ) ( ON-TABLE ?auto_93701 ) ( not ( = ?auto_93701 ?auto_93705 ) ) ( not ( = ?auto_93701 ?auto_93707 ) ) ( not ( = ?auto_93701 ?auto_93704 ) ) ( not ( = ?auto_93705 ?auto_93707 ) ) ( not ( = ?auto_93705 ?auto_93704 ) ) ( not ( = ?auto_93707 ?auto_93704 ) ) ( ON ?auto_93707 ?auto_93705 ) ( ON-TABLE ?auto_93703 ) ( not ( = ?auto_93703 ?auto_93706 ) ) ( not ( = ?auto_93703 ?auto_93702 ) ) ( not ( = ?auto_93703 ?auto_93704 ) ) ( not ( = ?auto_93706 ?auto_93702 ) ) ( not ( = ?auto_93706 ?auto_93704 ) ) ( not ( = ?auto_93702 ?auto_93704 ) ) ( not ( = ?auto_93701 ?auto_93702 ) ) ( not ( = ?auto_93701 ?auto_93703 ) ) ( not ( = ?auto_93701 ?auto_93706 ) ) ( not ( = ?auto_93705 ?auto_93702 ) ) ( not ( = ?auto_93705 ?auto_93703 ) ) ( not ( = ?auto_93705 ?auto_93706 ) ) ( not ( = ?auto_93707 ?auto_93702 ) ) ( not ( = ?auto_93707 ?auto_93703 ) ) ( not ( = ?auto_93707 ?auto_93706 ) ) ( ON ?auto_93704 ?auto_93707 ) ( ON ?auto_93702 ?auto_93704 ) ( CLEAR ?auto_93703 ) ( ON ?auto_93706 ?auto_93702 ) ( CLEAR ?auto_93706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93701 ?auto_93705 ?auto_93707 ?auto_93704 ?auto_93702 )
      ( MAKE-1PILE ?auto_93701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93708 - BLOCK
    )
    :vars
    (
      ?auto_93712 - BLOCK
      ?auto_93711 - BLOCK
      ?auto_93714 - BLOCK
      ?auto_93710 - BLOCK
      ?auto_93713 - BLOCK
      ?auto_93709 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93712 ?auto_93708 ) ( ON-TABLE ?auto_93708 ) ( not ( = ?auto_93708 ?auto_93712 ) ) ( not ( = ?auto_93708 ?auto_93711 ) ) ( not ( = ?auto_93708 ?auto_93714 ) ) ( not ( = ?auto_93712 ?auto_93711 ) ) ( not ( = ?auto_93712 ?auto_93714 ) ) ( not ( = ?auto_93711 ?auto_93714 ) ) ( ON ?auto_93711 ?auto_93712 ) ( not ( = ?auto_93710 ?auto_93713 ) ) ( not ( = ?auto_93710 ?auto_93709 ) ) ( not ( = ?auto_93710 ?auto_93714 ) ) ( not ( = ?auto_93713 ?auto_93709 ) ) ( not ( = ?auto_93713 ?auto_93714 ) ) ( not ( = ?auto_93709 ?auto_93714 ) ) ( not ( = ?auto_93708 ?auto_93709 ) ) ( not ( = ?auto_93708 ?auto_93710 ) ) ( not ( = ?auto_93708 ?auto_93713 ) ) ( not ( = ?auto_93712 ?auto_93709 ) ) ( not ( = ?auto_93712 ?auto_93710 ) ) ( not ( = ?auto_93712 ?auto_93713 ) ) ( not ( = ?auto_93711 ?auto_93709 ) ) ( not ( = ?auto_93711 ?auto_93710 ) ) ( not ( = ?auto_93711 ?auto_93713 ) ) ( ON ?auto_93714 ?auto_93711 ) ( ON ?auto_93709 ?auto_93714 ) ( ON ?auto_93713 ?auto_93709 ) ( CLEAR ?auto_93713 ) ( HOLDING ?auto_93710 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93710 )
      ( MAKE-1PILE ?auto_93708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93723 - BLOCK
    )
    :vars
    (
      ?auto_93724 - BLOCK
      ?auto_93728 - BLOCK
      ?auto_93726 - BLOCK
      ?auto_93727 - BLOCK
      ?auto_93725 - BLOCK
      ?auto_93729 - BLOCK
      ?auto_93730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93724 ?auto_93723 ) ( ON-TABLE ?auto_93723 ) ( not ( = ?auto_93723 ?auto_93724 ) ) ( not ( = ?auto_93723 ?auto_93728 ) ) ( not ( = ?auto_93723 ?auto_93726 ) ) ( not ( = ?auto_93724 ?auto_93728 ) ) ( not ( = ?auto_93724 ?auto_93726 ) ) ( not ( = ?auto_93728 ?auto_93726 ) ) ( ON ?auto_93728 ?auto_93724 ) ( not ( = ?auto_93727 ?auto_93725 ) ) ( not ( = ?auto_93727 ?auto_93729 ) ) ( not ( = ?auto_93727 ?auto_93726 ) ) ( not ( = ?auto_93725 ?auto_93729 ) ) ( not ( = ?auto_93725 ?auto_93726 ) ) ( not ( = ?auto_93729 ?auto_93726 ) ) ( not ( = ?auto_93723 ?auto_93729 ) ) ( not ( = ?auto_93723 ?auto_93727 ) ) ( not ( = ?auto_93723 ?auto_93725 ) ) ( not ( = ?auto_93724 ?auto_93729 ) ) ( not ( = ?auto_93724 ?auto_93727 ) ) ( not ( = ?auto_93724 ?auto_93725 ) ) ( not ( = ?auto_93728 ?auto_93729 ) ) ( not ( = ?auto_93728 ?auto_93727 ) ) ( not ( = ?auto_93728 ?auto_93725 ) ) ( ON ?auto_93726 ?auto_93728 ) ( ON ?auto_93729 ?auto_93726 ) ( ON ?auto_93725 ?auto_93729 ) ( CLEAR ?auto_93725 ) ( ON ?auto_93727 ?auto_93730 ) ( CLEAR ?auto_93727 ) ( HAND-EMPTY ) ( not ( = ?auto_93723 ?auto_93730 ) ) ( not ( = ?auto_93724 ?auto_93730 ) ) ( not ( = ?auto_93728 ?auto_93730 ) ) ( not ( = ?auto_93726 ?auto_93730 ) ) ( not ( = ?auto_93727 ?auto_93730 ) ) ( not ( = ?auto_93725 ?auto_93730 ) ) ( not ( = ?auto_93729 ?auto_93730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93727 ?auto_93730 )
      ( MAKE-1PILE ?auto_93723 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93731 - BLOCK
    )
    :vars
    (
      ?auto_93738 - BLOCK
      ?auto_93737 - BLOCK
      ?auto_93735 - BLOCK
      ?auto_93733 - BLOCK
      ?auto_93736 - BLOCK
      ?auto_93732 - BLOCK
      ?auto_93734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93738 ?auto_93731 ) ( ON-TABLE ?auto_93731 ) ( not ( = ?auto_93731 ?auto_93738 ) ) ( not ( = ?auto_93731 ?auto_93737 ) ) ( not ( = ?auto_93731 ?auto_93735 ) ) ( not ( = ?auto_93738 ?auto_93737 ) ) ( not ( = ?auto_93738 ?auto_93735 ) ) ( not ( = ?auto_93737 ?auto_93735 ) ) ( ON ?auto_93737 ?auto_93738 ) ( not ( = ?auto_93733 ?auto_93736 ) ) ( not ( = ?auto_93733 ?auto_93732 ) ) ( not ( = ?auto_93733 ?auto_93735 ) ) ( not ( = ?auto_93736 ?auto_93732 ) ) ( not ( = ?auto_93736 ?auto_93735 ) ) ( not ( = ?auto_93732 ?auto_93735 ) ) ( not ( = ?auto_93731 ?auto_93732 ) ) ( not ( = ?auto_93731 ?auto_93733 ) ) ( not ( = ?auto_93731 ?auto_93736 ) ) ( not ( = ?auto_93738 ?auto_93732 ) ) ( not ( = ?auto_93738 ?auto_93733 ) ) ( not ( = ?auto_93738 ?auto_93736 ) ) ( not ( = ?auto_93737 ?auto_93732 ) ) ( not ( = ?auto_93737 ?auto_93733 ) ) ( not ( = ?auto_93737 ?auto_93736 ) ) ( ON ?auto_93735 ?auto_93737 ) ( ON ?auto_93732 ?auto_93735 ) ( ON ?auto_93733 ?auto_93734 ) ( CLEAR ?auto_93733 ) ( not ( = ?auto_93731 ?auto_93734 ) ) ( not ( = ?auto_93738 ?auto_93734 ) ) ( not ( = ?auto_93737 ?auto_93734 ) ) ( not ( = ?auto_93735 ?auto_93734 ) ) ( not ( = ?auto_93733 ?auto_93734 ) ) ( not ( = ?auto_93736 ?auto_93734 ) ) ( not ( = ?auto_93732 ?auto_93734 ) ) ( HOLDING ?auto_93736 ) ( CLEAR ?auto_93732 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93731 ?auto_93738 ?auto_93737 ?auto_93735 ?auto_93732 ?auto_93736 )
      ( MAKE-1PILE ?auto_93731 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93739 - BLOCK
    )
    :vars
    (
      ?auto_93746 - BLOCK
      ?auto_93740 - BLOCK
      ?auto_93745 - BLOCK
      ?auto_93742 - BLOCK
      ?auto_93744 - BLOCK
      ?auto_93741 - BLOCK
      ?auto_93743 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93746 ?auto_93739 ) ( ON-TABLE ?auto_93739 ) ( not ( = ?auto_93739 ?auto_93746 ) ) ( not ( = ?auto_93739 ?auto_93740 ) ) ( not ( = ?auto_93739 ?auto_93745 ) ) ( not ( = ?auto_93746 ?auto_93740 ) ) ( not ( = ?auto_93746 ?auto_93745 ) ) ( not ( = ?auto_93740 ?auto_93745 ) ) ( ON ?auto_93740 ?auto_93746 ) ( not ( = ?auto_93742 ?auto_93744 ) ) ( not ( = ?auto_93742 ?auto_93741 ) ) ( not ( = ?auto_93742 ?auto_93745 ) ) ( not ( = ?auto_93744 ?auto_93741 ) ) ( not ( = ?auto_93744 ?auto_93745 ) ) ( not ( = ?auto_93741 ?auto_93745 ) ) ( not ( = ?auto_93739 ?auto_93741 ) ) ( not ( = ?auto_93739 ?auto_93742 ) ) ( not ( = ?auto_93739 ?auto_93744 ) ) ( not ( = ?auto_93746 ?auto_93741 ) ) ( not ( = ?auto_93746 ?auto_93742 ) ) ( not ( = ?auto_93746 ?auto_93744 ) ) ( not ( = ?auto_93740 ?auto_93741 ) ) ( not ( = ?auto_93740 ?auto_93742 ) ) ( not ( = ?auto_93740 ?auto_93744 ) ) ( ON ?auto_93745 ?auto_93740 ) ( ON ?auto_93741 ?auto_93745 ) ( ON ?auto_93742 ?auto_93743 ) ( not ( = ?auto_93739 ?auto_93743 ) ) ( not ( = ?auto_93746 ?auto_93743 ) ) ( not ( = ?auto_93740 ?auto_93743 ) ) ( not ( = ?auto_93745 ?auto_93743 ) ) ( not ( = ?auto_93742 ?auto_93743 ) ) ( not ( = ?auto_93744 ?auto_93743 ) ) ( not ( = ?auto_93741 ?auto_93743 ) ) ( CLEAR ?auto_93741 ) ( ON ?auto_93744 ?auto_93742 ) ( CLEAR ?auto_93744 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93743 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93743 ?auto_93742 )
      ( MAKE-1PILE ?auto_93739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_93747 - BLOCK
    )
    :vars
    (
      ?auto_93754 - BLOCK
      ?auto_93749 - BLOCK
      ?auto_93750 - BLOCK
      ?auto_93752 - BLOCK
      ?auto_93751 - BLOCK
      ?auto_93753 - BLOCK
      ?auto_93748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_93754 ?auto_93747 ) ( ON-TABLE ?auto_93747 ) ( not ( = ?auto_93747 ?auto_93754 ) ) ( not ( = ?auto_93747 ?auto_93749 ) ) ( not ( = ?auto_93747 ?auto_93750 ) ) ( not ( = ?auto_93754 ?auto_93749 ) ) ( not ( = ?auto_93754 ?auto_93750 ) ) ( not ( = ?auto_93749 ?auto_93750 ) ) ( ON ?auto_93749 ?auto_93754 ) ( not ( = ?auto_93752 ?auto_93751 ) ) ( not ( = ?auto_93752 ?auto_93753 ) ) ( not ( = ?auto_93752 ?auto_93750 ) ) ( not ( = ?auto_93751 ?auto_93753 ) ) ( not ( = ?auto_93751 ?auto_93750 ) ) ( not ( = ?auto_93753 ?auto_93750 ) ) ( not ( = ?auto_93747 ?auto_93753 ) ) ( not ( = ?auto_93747 ?auto_93752 ) ) ( not ( = ?auto_93747 ?auto_93751 ) ) ( not ( = ?auto_93754 ?auto_93753 ) ) ( not ( = ?auto_93754 ?auto_93752 ) ) ( not ( = ?auto_93754 ?auto_93751 ) ) ( not ( = ?auto_93749 ?auto_93753 ) ) ( not ( = ?auto_93749 ?auto_93752 ) ) ( not ( = ?auto_93749 ?auto_93751 ) ) ( ON ?auto_93750 ?auto_93749 ) ( ON ?auto_93752 ?auto_93748 ) ( not ( = ?auto_93747 ?auto_93748 ) ) ( not ( = ?auto_93754 ?auto_93748 ) ) ( not ( = ?auto_93749 ?auto_93748 ) ) ( not ( = ?auto_93750 ?auto_93748 ) ) ( not ( = ?auto_93752 ?auto_93748 ) ) ( not ( = ?auto_93751 ?auto_93748 ) ) ( not ( = ?auto_93753 ?auto_93748 ) ) ( ON ?auto_93751 ?auto_93752 ) ( CLEAR ?auto_93751 ) ( ON-TABLE ?auto_93748 ) ( HOLDING ?auto_93753 ) ( CLEAR ?auto_93750 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93747 ?auto_93754 ?auto_93749 ?auto_93750 ?auto_93753 )
      ( MAKE-1PILE ?auto_93747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93793 - BLOCK
      ?auto_93794 - BLOCK
      ?auto_93795 - BLOCK
      ?auto_93796 - BLOCK
      ?auto_93797 - BLOCK
      ?auto_93798 - BLOCK
    )
    :vars
    (
      ?auto_93799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93793 ) ( ON ?auto_93794 ?auto_93793 ) ( ON ?auto_93795 ?auto_93794 ) ( ON ?auto_93796 ?auto_93795 ) ( not ( = ?auto_93793 ?auto_93794 ) ) ( not ( = ?auto_93793 ?auto_93795 ) ) ( not ( = ?auto_93793 ?auto_93796 ) ) ( not ( = ?auto_93793 ?auto_93797 ) ) ( not ( = ?auto_93793 ?auto_93798 ) ) ( not ( = ?auto_93794 ?auto_93795 ) ) ( not ( = ?auto_93794 ?auto_93796 ) ) ( not ( = ?auto_93794 ?auto_93797 ) ) ( not ( = ?auto_93794 ?auto_93798 ) ) ( not ( = ?auto_93795 ?auto_93796 ) ) ( not ( = ?auto_93795 ?auto_93797 ) ) ( not ( = ?auto_93795 ?auto_93798 ) ) ( not ( = ?auto_93796 ?auto_93797 ) ) ( not ( = ?auto_93796 ?auto_93798 ) ) ( not ( = ?auto_93797 ?auto_93798 ) ) ( ON ?auto_93798 ?auto_93799 ) ( not ( = ?auto_93793 ?auto_93799 ) ) ( not ( = ?auto_93794 ?auto_93799 ) ) ( not ( = ?auto_93795 ?auto_93799 ) ) ( not ( = ?auto_93796 ?auto_93799 ) ) ( not ( = ?auto_93797 ?auto_93799 ) ) ( not ( = ?auto_93798 ?auto_93799 ) ) ( CLEAR ?auto_93796 ) ( ON ?auto_93797 ?auto_93798 ) ( CLEAR ?auto_93797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93799 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93799 ?auto_93798 )
      ( MAKE-6PILE ?auto_93793 ?auto_93794 ?auto_93795 ?auto_93796 ?auto_93797 ?auto_93798 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93800 - BLOCK
      ?auto_93801 - BLOCK
      ?auto_93802 - BLOCK
      ?auto_93803 - BLOCK
      ?auto_93804 - BLOCK
      ?auto_93805 - BLOCK
    )
    :vars
    (
      ?auto_93806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93800 ) ( ON ?auto_93801 ?auto_93800 ) ( ON ?auto_93802 ?auto_93801 ) ( not ( = ?auto_93800 ?auto_93801 ) ) ( not ( = ?auto_93800 ?auto_93802 ) ) ( not ( = ?auto_93800 ?auto_93803 ) ) ( not ( = ?auto_93800 ?auto_93804 ) ) ( not ( = ?auto_93800 ?auto_93805 ) ) ( not ( = ?auto_93801 ?auto_93802 ) ) ( not ( = ?auto_93801 ?auto_93803 ) ) ( not ( = ?auto_93801 ?auto_93804 ) ) ( not ( = ?auto_93801 ?auto_93805 ) ) ( not ( = ?auto_93802 ?auto_93803 ) ) ( not ( = ?auto_93802 ?auto_93804 ) ) ( not ( = ?auto_93802 ?auto_93805 ) ) ( not ( = ?auto_93803 ?auto_93804 ) ) ( not ( = ?auto_93803 ?auto_93805 ) ) ( not ( = ?auto_93804 ?auto_93805 ) ) ( ON ?auto_93805 ?auto_93806 ) ( not ( = ?auto_93800 ?auto_93806 ) ) ( not ( = ?auto_93801 ?auto_93806 ) ) ( not ( = ?auto_93802 ?auto_93806 ) ) ( not ( = ?auto_93803 ?auto_93806 ) ) ( not ( = ?auto_93804 ?auto_93806 ) ) ( not ( = ?auto_93805 ?auto_93806 ) ) ( ON ?auto_93804 ?auto_93805 ) ( CLEAR ?auto_93804 ) ( ON-TABLE ?auto_93806 ) ( HOLDING ?auto_93803 ) ( CLEAR ?auto_93802 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93800 ?auto_93801 ?auto_93802 ?auto_93803 )
      ( MAKE-6PILE ?auto_93800 ?auto_93801 ?auto_93802 ?auto_93803 ?auto_93804 ?auto_93805 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93807 - BLOCK
      ?auto_93808 - BLOCK
      ?auto_93809 - BLOCK
      ?auto_93810 - BLOCK
      ?auto_93811 - BLOCK
      ?auto_93812 - BLOCK
    )
    :vars
    (
      ?auto_93813 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93807 ) ( ON ?auto_93808 ?auto_93807 ) ( ON ?auto_93809 ?auto_93808 ) ( not ( = ?auto_93807 ?auto_93808 ) ) ( not ( = ?auto_93807 ?auto_93809 ) ) ( not ( = ?auto_93807 ?auto_93810 ) ) ( not ( = ?auto_93807 ?auto_93811 ) ) ( not ( = ?auto_93807 ?auto_93812 ) ) ( not ( = ?auto_93808 ?auto_93809 ) ) ( not ( = ?auto_93808 ?auto_93810 ) ) ( not ( = ?auto_93808 ?auto_93811 ) ) ( not ( = ?auto_93808 ?auto_93812 ) ) ( not ( = ?auto_93809 ?auto_93810 ) ) ( not ( = ?auto_93809 ?auto_93811 ) ) ( not ( = ?auto_93809 ?auto_93812 ) ) ( not ( = ?auto_93810 ?auto_93811 ) ) ( not ( = ?auto_93810 ?auto_93812 ) ) ( not ( = ?auto_93811 ?auto_93812 ) ) ( ON ?auto_93812 ?auto_93813 ) ( not ( = ?auto_93807 ?auto_93813 ) ) ( not ( = ?auto_93808 ?auto_93813 ) ) ( not ( = ?auto_93809 ?auto_93813 ) ) ( not ( = ?auto_93810 ?auto_93813 ) ) ( not ( = ?auto_93811 ?auto_93813 ) ) ( not ( = ?auto_93812 ?auto_93813 ) ) ( ON ?auto_93811 ?auto_93812 ) ( ON-TABLE ?auto_93813 ) ( CLEAR ?auto_93809 ) ( ON ?auto_93810 ?auto_93811 ) ( CLEAR ?auto_93810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93813 ?auto_93812 ?auto_93811 )
      ( MAKE-6PILE ?auto_93807 ?auto_93808 ?auto_93809 ?auto_93810 ?auto_93811 ?auto_93812 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93814 - BLOCK
      ?auto_93815 - BLOCK
      ?auto_93816 - BLOCK
      ?auto_93817 - BLOCK
      ?auto_93818 - BLOCK
      ?auto_93819 - BLOCK
    )
    :vars
    (
      ?auto_93820 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93814 ) ( ON ?auto_93815 ?auto_93814 ) ( not ( = ?auto_93814 ?auto_93815 ) ) ( not ( = ?auto_93814 ?auto_93816 ) ) ( not ( = ?auto_93814 ?auto_93817 ) ) ( not ( = ?auto_93814 ?auto_93818 ) ) ( not ( = ?auto_93814 ?auto_93819 ) ) ( not ( = ?auto_93815 ?auto_93816 ) ) ( not ( = ?auto_93815 ?auto_93817 ) ) ( not ( = ?auto_93815 ?auto_93818 ) ) ( not ( = ?auto_93815 ?auto_93819 ) ) ( not ( = ?auto_93816 ?auto_93817 ) ) ( not ( = ?auto_93816 ?auto_93818 ) ) ( not ( = ?auto_93816 ?auto_93819 ) ) ( not ( = ?auto_93817 ?auto_93818 ) ) ( not ( = ?auto_93817 ?auto_93819 ) ) ( not ( = ?auto_93818 ?auto_93819 ) ) ( ON ?auto_93819 ?auto_93820 ) ( not ( = ?auto_93814 ?auto_93820 ) ) ( not ( = ?auto_93815 ?auto_93820 ) ) ( not ( = ?auto_93816 ?auto_93820 ) ) ( not ( = ?auto_93817 ?auto_93820 ) ) ( not ( = ?auto_93818 ?auto_93820 ) ) ( not ( = ?auto_93819 ?auto_93820 ) ) ( ON ?auto_93818 ?auto_93819 ) ( ON-TABLE ?auto_93820 ) ( ON ?auto_93817 ?auto_93818 ) ( CLEAR ?auto_93817 ) ( HOLDING ?auto_93816 ) ( CLEAR ?auto_93815 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93814 ?auto_93815 ?auto_93816 )
      ( MAKE-6PILE ?auto_93814 ?auto_93815 ?auto_93816 ?auto_93817 ?auto_93818 ?auto_93819 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93821 - BLOCK
      ?auto_93822 - BLOCK
      ?auto_93823 - BLOCK
      ?auto_93824 - BLOCK
      ?auto_93825 - BLOCK
      ?auto_93826 - BLOCK
    )
    :vars
    (
      ?auto_93827 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93821 ) ( ON ?auto_93822 ?auto_93821 ) ( not ( = ?auto_93821 ?auto_93822 ) ) ( not ( = ?auto_93821 ?auto_93823 ) ) ( not ( = ?auto_93821 ?auto_93824 ) ) ( not ( = ?auto_93821 ?auto_93825 ) ) ( not ( = ?auto_93821 ?auto_93826 ) ) ( not ( = ?auto_93822 ?auto_93823 ) ) ( not ( = ?auto_93822 ?auto_93824 ) ) ( not ( = ?auto_93822 ?auto_93825 ) ) ( not ( = ?auto_93822 ?auto_93826 ) ) ( not ( = ?auto_93823 ?auto_93824 ) ) ( not ( = ?auto_93823 ?auto_93825 ) ) ( not ( = ?auto_93823 ?auto_93826 ) ) ( not ( = ?auto_93824 ?auto_93825 ) ) ( not ( = ?auto_93824 ?auto_93826 ) ) ( not ( = ?auto_93825 ?auto_93826 ) ) ( ON ?auto_93826 ?auto_93827 ) ( not ( = ?auto_93821 ?auto_93827 ) ) ( not ( = ?auto_93822 ?auto_93827 ) ) ( not ( = ?auto_93823 ?auto_93827 ) ) ( not ( = ?auto_93824 ?auto_93827 ) ) ( not ( = ?auto_93825 ?auto_93827 ) ) ( not ( = ?auto_93826 ?auto_93827 ) ) ( ON ?auto_93825 ?auto_93826 ) ( ON-TABLE ?auto_93827 ) ( ON ?auto_93824 ?auto_93825 ) ( CLEAR ?auto_93822 ) ( ON ?auto_93823 ?auto_93824 ) ( CLEAR ?auto_93823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93827 ?auto_93826 ?auto_93825 ?auto_93824 )
      ( MAKE-6PILE ?auto_93821 ?auto_93822 ?auto_93823 ?auto_93824 ?auto_93825 ?auto_93826 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93828 - BLOCK
      ?auto_93829 - BLOCK
      ?auto_93830 - BLOCK
      ?auto_93831 - BLOCK
      ?auto_93832 - BLOCK
      ?auto_93833 - BLOCK
    )
    :vars
    (
      ?auto_93834 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93828 ) ( not ( = ?auto_93828 ?auto_93829 ) ) ( not ( = ?auto_93828 ?auto_93830 ) ) ( not ( = ?auto_93828 ?auto_93831 ) ) ( not ( = ?auto_93828 ?auto_93832 ) ) ( not ( = ?auto_93828 ?auto_93833 ) ) ( not ( = ?auto_93829 ?auto_93830 ) ) ( not ( = ?auto_93829 ?auto_93831 ) ) ( not ( = ?auto_93829 ?auto_93832 ) ) ( not ( = ?auto_93829 ?auto_93833 ) ) ( not ( = ?auto_93830 ?auto_93831 ) ) ( not ( = ?auto_93830 ?auto_93832 ) ) ( not ( = ?auto_93830 ?auto_93833 ) ) ( not ( = ?auto_93831 ?auto_93832 ) ) ( not ( = ?auto_93831 ?auto_93833 ) ) ( not ( = ?auto_93832 ?auto_93833 ) ) ( ON ?auto_93833 ?auto_93834 ) ( not ( = ?auto_93828 ?auto_93834 ) ) ( not ( = ?auto_93829 ?auto_93834 ) ) ( not ( = ?auto_93830 ?auto_93834 ) ) ( not ( = ?auto_93831 ?auto_93834 ) ) ( not ( = ?auto_93832 ?auto_93834 ) ) ( not ( = ?auto_93833 ?auto_93834 ) ) ( ON ?auto_93832 ?auto_93833 ) ( ON-TABLE ?auto_93834 ) ( ON ?auto_93831 ?auto_93832 ) ( ON ?auto_93830 ?auto_93831 ) ( CLEAR ?auto_93830 ) ( HOLDING ?auto_93829 ) ( CLEAR ?auto_93828 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93828 ?auto_93829 )
      ( MAKE-6PILE ?auto_93828 ?auto_93829 ?auto_93830 ?auto_93831 ?auto_93832 ?auto_93833 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93835 - BLOCK
      ?auto_93836 - BLOCK
      ?auto_93837 - BLOCK
      ?auto_93838 - BLOCK
      ?auto_93839 - BLOCK
      ?auto_93840 - BLOCK
    )
    :vars
    (
      ?auto_93841 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93835 ) ( not ( = ?auto_93835 ?auto_93836 ) ) ( not ( = ?auto_93835 ?auto_93837 ) ) ( not ( = ?auto_93835 ?auto_93838 ) ) ( not ( = ?auto_93835 ?auto_93839 ) ) ( not ( = ?auto_93835 ?auto_93840 ) ) ( not ( = ?auto_93836 ?auto_93837 ) ) ( not ( = ?auto_93836 ?auto_93838 ) ) ( not ( = ?auto_93836 ?auto_93839 ) ) ( not ( = ?auto_93836 ?auto_93840 ) ) ( not ( = ?auto_93837 ?auto_93838 ) ) ( not ( = ?auto_93837 ?auto_93839 ) ) ( not ( = ?auto_93837 ?auto_93840 ) ) ( not ( = ?auto_93838 ?auto_93839 ) ) ( not ( = ?auto_93838 ?auto_93840 ) ) ( not ( = ?auto_93839 ?auto_93840 ) ) ( ON ?auto_93840 ?auto_93841 ) ( not ( = ?auto_93835 ?auto_93841 ) ) ( not ( = ?auto_93836 ?auto_93841 ) ) ( not ( = ?auto_93837 ?auto_93841 ) ) ( not ( = ?auto_93838 ?auto_93841 ) ) ( not ( = ?auto_93839 ?auto_93841 ) ) ( not ( = ?auto_93840 ?auto_93841 ) ) ( ON ?auto_93839 ?auto_93840 ) ( ON-TABLE ?auto_93841 ) ( ON ?auto_93838 ?auto_93839 ) ( ON ?auto_93837 ?auto_93838 ) ( CLEAR ?auto_93835 ) ( ON ?auto_93836 ?auto_93837 ) ( CLEAR ?auto_93836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93841 ?auto_93840 ?auto_93839 ?auto_93838 ?auto_93837 )
      ( MAKE-6PILE ?auto_93835 ?auto_93836 ?auto_93837 ?auto_93838 ?auto_93839 ?auto_93840 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93842 - BLOCK
      ?auto_93843 - BLOCK
      ?auto_93844 - BLOCK
      ?auto_93845 - BLOCK
      ?auto_93846 - BLOCK
      ?auto_93847 - BLOCK
    )
    :vars
    (
      ?auto_93848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93842 ?auto_93843 ) ) ( not ( = ?auto_93842 ?auto_93844 ) ) ( not ( = ?auto_93842 ?auto_93845 ) ) ( not ( = ?auto_93842 ?auto_93846 ) ) ( not ( = ?auto_93842 ?auto_93847 ) ) ( not ( = ?auto_93843 ?auto_93844 ) ) ( not ( = ?auto_93843 ?auto_93845 ) ) ( not ( = ?auto_93843 ?auto_93846 ) ) ( not ( = ?auto_93843 ?auto_93847 ) ) ( not ( = ?auto_93844 ?auto_93845 ) ) ( not ( = ?auto_93844 ?auto_93846 ) ) ( not ( = ?auto_93844 ?auto_93847 ) ) ( not ( = ?auto_93845 ?auto_93846 ) ) ( not ( = ?auto_93845 ?auto_93847 ) ) ( not ( = ?auto_93846 ?auto_93847 ) ) ( ON ?auto_93847 ?auto_93848 ) ( not ( = ?auto_93842 ?auto_93848 ) ) ( not ( = ?auto_93843 ?auto_93848 ) ) ( not ( = ?auto_93844 ?auto_93848 ) ) ( not ( = ?auto_93845 ?auto_93848 ) ) ( not ( = ?auto_93846 ?auto_93848 ) ) ( not ( = ?auto_93847 ?auto_93848 ) ) ( ON ?auto_93846 ?auto_93847 ) ( ON-TABLE ?auto_93848 ) ( ON ?auto_93845 ?auto_93846 ) ( ON ?auto_93844 ?auto_93845 ) ( ON ?auto_93843 ?auto_93844 ) ( CLEAR ?auto_93843 ) ( HOLDING ?auto_93842 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93842 )
      ( MAKE-6PILE ?auto_93842 ?auto_93843 ?auto_93844 ?auto_93845 ?auto_93846 ?auto_93847 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93849 - BLOCK
      ?auto_93850 - BLOCK
      ?auto_93851 - BLOCK
      ?auto_93852 - BLOCK
      ?auto_93853 - BLOCK
      ?auto_93854 - BLOCK
    )
    :vars
    (
      ?auto_93855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93849 ?auto_93850 ) ) ( not ( = ?auto_93849 ?auto_93851 ) ) ( not ( = ?auto_93849 ?auto_93852 ) ) ( not ( = ?auto_93849 ?auto_93853 ) ) ( not ( = ?auto_93849 ?auto_93854 ) ) ( not ( = ?auto_93850 ?auto_93851 ) ) ( not ( = ?auto_93850 ?auto_93852 ) ) ( not ( = ?auto_93850 ?auto_93853 ) ) ( not ( = ?auto_93850 ?auto_93854 ) ) ( not ( = ?auto_93851 ?auto_93852 ) ) ( not ( = ?auto_93851 ?auto_93853 ) ) ( not ( = ?auto_93851 ?auto_93854 ) ) ( not ( = ?auto_93852 ?auto_93853 ) ) ( not ( = ?auto_93852 ?auto_93854 ) ) ( not ( = ?auto_93853 ?auto_93854 ) ) ( ON ?auto_93854 ?auto_93855 ) ( not ( = ?auto_93849 ?auto_93855 ) ) ( not ( = ?auto_93850 ?auto_93855 ) ) ( not ( = ?auto_93851 ?auto_93855 ) ) ( not ( = ?auto_93852 ?auto_93855 ) ) ( not ( = ?auto_93853 ?auto_93855 ) ) ( not ( = ?auto_93854 ?auto_93855 ) ) ( ON ?auto_93853 ?auto_93854 ) ( ON-TABLE ?auto_93855 ) ( ON ?auto_93852 ?auto_93853 ) ( ON ?auto_93851 ?auto_93852 ) ( ON ?auto_93850 ?auto_93851 ) ( ON ?auto_93849 ?auto_93850 ) ( CLEAR ?auto_93849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93855 ?auto_93854 ?auto_93853 ?auto_93852 ?auto_93851 ?auto_93850 )
      ( MAKE-6PILE ?auto_93849 ?auto_93850 ?auto_93851 ?auto_93852 ?auto_93853 ?auto_93854 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93862 - BLOCK
      ?auto_93863 - BLOCK
      ?auto_93864 - BLOCK
      ?auto_93865 - BLOCK
      ?auto_93866 - BLOCK
      ?auto_93867 - BLOCK
    )
    :vars
    (
      ?auto_93868 - BLOCK
      ?auto_93869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93862 ?auto_93863 ) ) ( not ( = ?auto_93862 ?auto_93864 ) ) ( not ( = ?auto_93862 ?auto_93865 ) ) ( not ( = ?auto_93862 ?auto_93866 ) ) ( not ( = ?auto_93862 ?auto_93867 ) ) ( not ( = ?auto_93863 ?auto_93864 ) ) ( not ( = ?auto_93863 ?auto_93865 ) ) ( not ( = ?auto_93863 ?auto_93866 ) ) ( not ( = ?auto_93863 ?auto_93867 ) ) ( not ( = ?auto_93864 ?auto_93865 ) ) ( not ( = ?auto_93864 ?auto_93866 ) ) ( not ( = ?auto_93864 ?auto_93867 ) ) ( not ( = ?auto_93865 ?auto_93866 ) ) ( not ( = ?auto_93865 ?auto_93867 ) ) ( not ( = ?auto_93866 ?auto_93867 ) ) ( ON ?auto_93867 ?auto_93868 ) ( not ( = ?auto_93862 ?auto_93868 ) ) ( not ( = ?auto_93863 ?auto_93868 ) ) ( not ( = ?auto_93864 ?auto_93868 ) ) ( not ( = ?auto_93865 ?auto_93868 ) ) ( not ( = ?auto_93866 ?auto_93868 ) ) ( not ( = ?auto_93867 ?auto_93868 ) ) ( ON ?auto_93866 ?auto_93867 ) ( ON-TABLE ?auto_93868 ) ( ON ?auto_93865 ?auto_93866 ) ( ON ?auto_93864 ?auto_93865 ) ( ON ?auto_93863 ?auto_93864 ) ( CLEAR ?auto_93863 ) ( ON ?auto_93862 ?auto_93869 ) ( CLEAR ?auto_93862 ) ( HAND-EMPTY ) ( not ( = ?auto_93862 ?auto_93869 ) ) ( not ( = ?auto_93863 ?auto_93869 ) ) ( not ( = ?auto_93864 ?auto_93869 ) ) ( not ( = ?auto_93865 ?auto_93869 ) ) ( not ( = ?auto_93866 ?auto_93869 ) ) ( not ( = ?auto_93867 ?auto_93869 ) ) ( not ( = ?auto_93868 ?auto_93869 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_93862 ?auto_93869 )
      ( MAKE-6PILE ?auto_93862 ?auto_93863 ?auto_93864 ?auto_93865 ?auto_93866 ?auto_93867 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93870 - BLOCK
      ?auto_93871 - BLOCK
      ?auto_93872 - BLOCK
      ?auto_93873 - BLOCK
      ?auto_93874 - BLOCK
      ?auto_93875 - BLOCK
    )
    :vars
    (
      ?auto_93877 - BLOCK
      ?auto_93876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93870 ?auto_93871 ) ) ( not ( = ?auto_93870 ?auto_93872 ) ) ( not ( = ?auto_93870 ?auto_93873 ) ) ( not ( = ?auto_93870 ?auto_93874 ) ) ( not ( = ?auto_93870 ?auto_93875 ) ) ( not ( = ?auto_93871 ?auto_93872 ) ) ( not ( = ?auto_93871 ?auto_93873 ) ) ( not ( = ?auto_93871 ?auto_93874 ) ) ( not ( = ?auto_93871 ?auto_93875 ) ) ( not ( = ?auto_93872 ?auto_93873 ) ) ( not ( = ?auto_93872 ?auto_93874 ) ) ( not ( = ?auto_93872 ?auto_93875 ) ) ( not ( = ?auto_93873 ?auto_93874 ) ) ( not ( = ?auto_93873 ?auto_93875 ) ) ( not ( = ?auto_93874 ?auto_93875 ) ) ( ON ?auto_93875 ?auto_93877 ) ( not ( = ?auto_93870 ?auto_93877 ) ) ( not ( = ?auto_93871 ?auto_93877 ) ) ( not ( = ?auto_93872 ?auto_93877 ) ) ( not ( = ?auto_93873 ?auto_93877 ) ) ( not ( = ?auto_93874 ?auto_93877 ) ) ( not ( = ?auto_93875 ?auto_93877 ) ) ( ON ?auto_93874 ?auto_93875 ) ( ON-TABLE ?auto_93877 ) ( ON ?auto_93873 ?auto_93874 ) ( ON ?auto_93872 ?auto_93873 ) ( ON ?auto_93870 ?auto_93876 ) ( CLEAR ?auto_93870 ) ( not ( = ?auto_93870 ?auto_93876 ) ) ( not ( = ?auto_93871 ?auto_93876 ) ) ( not ( = ?auto_93872 ?auto_93876 ) ) ( not ( = ?auto_93873 ?auto_93876 ) ) ( not ( = ?auto_93874 ?auto_93876 ) ) ( not ( = ?auto_93875 ?auto_93876 ) ) ( not ( = ?auto_93877 ?auto_93876 ) ) ( HOLDING ?auto_93871 ) ( CLEAR ?auto_93872 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93877 ?auto_93875 ?auto_93874 ?auto_93873 ?auto_93872 ?auto_93871 )
      ( MAKE-6PILE ?auto_93870 ?auto_93871 ?auto_93872 ?auto_93873 ?auto_93874 ?auto_93875 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93878 - BLOCK
      ?auto_93879 - BLOCK
      ?auto_93880 - BLOCK
      ?auto_93881 - BLOCK
      ?auto_93882 - BLOCK
      ?auto_93883 - BLOCK
    )
    :vars
    (
      ?auto_93885 - BLOCK
      ?auto_93884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93878 ?auto_93879 ) ) ( not ( = ?auto_93878 ?auto_93880 ) ) ( not ( = ?auto_93878 ?auto_93881 ) ) ( not ( = ?auto_93878 ?auto_93882 ) ) ( not ( = ?auto_93878 ?auto_93883 ) ) ( not ( = ?auto_93879 ?auto_93880 ) ) ( not ( = ?auto_93879 ?auto_93881 ) ) ( not ( = ?auto_93879 ?auto_93882 ) ) ( not ( = ?auto_93879 ?auto_93883 ) ) ( not ( = ?auto_93880 ?auto_93881 ) ) ( not ( = ?auto_93880 ?auto_93882 ) ) ( not ( = ?auto_93880 ?auto_93883 ) ) ( not ( = ?auto_93881 ?auto_93882 ) ) ( not ( = ?auto_93881 ?auto_93883 ) ) ( not ( = ?auto_93882 ?auto_93883 ) ) ( ON ?auto_93883 ?auto_93885 ) ( not ( = ?auto_93878 ?auto_93885 ) ) ( not ( = ?auto_93879 ?auto_93885 ) ) ( not ( = ?auto_93880 ?auto_93885 ) ) ( not ( = ?auto_93881 ?auto_93885 ) ) ( not ( = ?auto_93882 ?auto_93885 ) ) ( not ( = ?auto_93883 ?auto_93885 ) ) ( ON ?auto_93882 ?auto_93883 ) ( ON-TABLE ?auto_93885 ) ( ON ?auto_93881 ?auto_93882 ) ( ON ?auto_93880 ?auto_93881 ) ( ON ?auto_93878 ?auto_93884 ) ( not ( = ?auto_93878 ?auto_93884 ) ) ( not ( = ?auto_93879 ?auto_93884 ) ) ( not ( = ?auto_93880 ?auto_93884 ) ) ( not ( = ?auto_93881 ?auto_93884 ) ) ( not ( = ?auto_93882 ?auto_93884 ) ) ( not ( = ?auto_93883 ?auto_93884 ) ) ( not ( = ?auto_93885 ?auto_93884 ) ) ( CLEAR ?auto_93880 ) ( ON ?auto_93879 ?auto_93878 ) ( CLEAR ?auto_93879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_93884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93884 ?auto_93878 )
      ( MAKE-6PILE ?auto_93878 ?auto_93879 ?auto_93880 ?auto_93881 ?auto_93882 ?auto_93883 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93886 - BLOCK
      ?auto_93887 - BLOCK
      ?auto_93888 - BLOCK
      ?auto_93889 - BLOCK
      ?auto_93890 - BLOCK
      ?auto_93891 - BLOCK
    )
    :vars
    (
      ?auto_93892 - BLOCK
      ?auto_93893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93886 ?auto_93887 ) ) ( not ( = ?auto_93886 ?auto_93888 ) ) ( not ( = ?auto_93886 ?auto_93889 ) ) ( not ( = ?auto_93886 ?auto_93890 ) ) ( not ( = ?auto_93886 ?auto_93891 ) ) ( not ( = ?auto_93887 ?auto_93888 ) ) ( not ( = ?auto_93887 ?auto_93889 ) ) ( not ( = ?auto_93887 ?auto_93890 ) ) ( not ( = ?auto_93887 ?auto_93891 ) ) ( not ( = ?auto_93888 ?auto_93889 ) ) ( not ( = ?auto_93888 ?auto_93890 ) ) ( not ( = ?auto_93888 ?auto_93891 ) ) ( not ( = ?auto_93889 ?auto_93890 ) ) ( not ( = ?auto_93889 ?auto_93891 ) ) ( not ( = ?auto_93890 ?auto_93891 ) ) ( ON ?auto_93891 ?auto_93892 ) ( not ( = ?auto_93886 ?auto_93892 ) ) ( not ( = ?auto_93887 ?auto_93892 ) ) ( not ( = ?auto_93888 ?auto_93892 ) ) ( not ( = ?auto_93889 ?auto_93892 ) ) ( not ( = ?auto_93890 ?auto_93892 ) ) ( not ( = ?auto_93891 ?auto_93892 ) ) ( ON ?auto_93890 ?auto_93891 ) ( ON-TABLE ?auto_93892 ) ( ON ?auto_93889 ?auto_93890 ) ( ON ?auto_93886 ?auto_93893 ) ( not ( = ?auto_93886 ?auto_93893 ) ) ( not ( = ?auto_93887 ?auto_93893 ) ) ( not ( = ?auto_93888 ?auto_93893 ) ) ( not ( = ?auto_93889 ?auto_93893 ) ) ( not ( = ?auto_93890 ?auto_93893 ) ) ( not ( = ?auto_93891 ?auto_93893 ) ) ( not ( = ?auto_93892 ?auto_93893 ) ) ( ON ?auto_93887 ?auto_93886 ) ( CLEAR ?auto_93887 ) ( ON-TABLE ?auto_93893 ) ( HOLDING ?auto_93888 ) ( CLEAR ?auto_93889 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93892 ?auto_93891 ?auto_93890 ?auto_93889 ?auto_93888 )
      ( MAKE-6PILE ?auto_93886 ?auto_93887 ?auto_93888 ?auto_93889 ?auto_93890 ?auto_93891 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93894 - BLOCK
      ?auto_93895 - BLOCK
      ?auto_93896 - BLOCK
      ?auto_93897 - BLOCK
      ?auto_93898 - BLOCK
      ?auto_93899 - BLOCK
    )
    :vars
    (
      ?auto_93901 - BLOCK
      ?auto_93900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93894 ?auto_93895 ) ) ( not ( = ?auto_93894 ?auto_93896 ) ) ( not ( = ?auto_93894 ?auto_93897 ) ) ( not ( = ?auto_93894 ?auto_93898 ) ) ( not ( = ?auto_93894 ?auto_93899 ) ) ( not ( = ?auto_93895 ?auto_93896 ) ) ( not ( = ?auto_93895 ?auto_93897 ) ) ( not ( = ?auto_93895 ?auto_93898 ) ) ( not ( = ?auto_93895 ?auto_93899 ) ) ( not ( = ?auto_93896 ?auto_93897 ) ) ( not ( = ?auto_93896 ?auto_93898 ) ) ( not ( = ?auto_93896 ?auto_93899 ) ) ( not ( = ?auto_93897 ?auto_93898 ) ) ( not ( = ?auto_93897 ?auto_93899 ) ) ( not ( = ?auto_93898 ?auto_93899 ) ) ( ON ?auto_93899 ?auto_93901 ) ( not ( = ?auto_93894 ?auto_93901 ) ) ( not ( = ?auto_93895 ?auto_93901 ) ) ( not ( = ?auto_93896 ?auto_93901 ) ) ( not ( = ?auto_93897 ?auto_93901 ) ) ( not ( = ?auto_93898 ?auto_93901 ) ) ( not ( = ?auto_93899 ?auto_93901 ) ) ( ON ?auto_93898 ?auto_93899 ) ( ON-TABLE ?auto_93901 ) ( ON ?auto_93897 ?auto_93898 ) ( ON ?auto_93894 ?auto_93900 ) ( not ( = ?auto_93894 ?auto_93900 ) ) ( not ( = ?auto_93895 ?auto_93900 ) ) ( not ( = ?auto_93896 ?auto_93900 ) ) ( not ( = ?auto_93897 ?auto_93900 ) ) ( not ( = ?auto_93898 ?auto_93900 ) ) ( not ( = ?auto_93899 ?auto_93900 ) ) ( not ( = ?auto_93901 ?auto_93900 ) ) ( ON ?auto_93895 ?auto_93894 ) ( ON-TABLE ?auto_93900 ) ( CLEAR ?auto_93897 ) ( ON ?auto_93896 ?auto_93895 ) ( CLEAR ?auto_93896 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93900 ?auto_93894 ?auto_93895 )
      ( MAKE-6PILE ?auto_93894 ?auto_93895 ?auto_93896 ?auto_93897 ?auto_93898 ?auto_93899 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93902 - BLOCK
      ?auto_93903 - BLOCK
      ?auto_93904 - BLOCK
      ?auto_93905 - BLOCK
      ?auto_93906 - BLOCK
      ?auto_93907 - BLOCK
    )
    :vars
    (
      ?auto_93909 - BLOCK
      ?auto_93908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93902 ?auto_93903 ) ) ( not ( = ?auto_93902 ?auto_93904 ) ) ( not ( = ?auto_93902 ?auto_93905 ) ) ( not ( = ?auto_93902 ?auto_93906 ) ) ( not ( = ?auto_93902 ?auto_93907 ) ) ( not ( = ?auto_93903 ?auto_93904 ) ) ( not ( = ?auto_93903 ?auto_93905 ) ) ( not ( = ?auto_93903 ?auto_93906 ) ) ( not ( = ?auto_93903 ?auto_93907 ) ) ( not ( = ?auto_93904 ?auto_93905 ) ) ( not ( = ?auto_93904 ?auto_93906 ) ) ( not ( = ?auto_93904 ?auto_93907 ) ) ( not ( = ?auto_93905 ?auto_93906 ) ) ( not ( = ?auto_93905 ?auto_93907 ) ) ( not ( = ?auto_93906 ?auto_93907 ) ) ( ON ?auto_93907 ?auto_93909 ) ( not ( = ?auto_93902 ?auto_93909 ) ) ( not ( = ?auto_93903 ?auto_93909 ) ) ( not ( = ?auto_93904 ?auto_93909 ) ) ( not ( = ?auto_93905 ?auto_93909 ) ) ( not ( = ?auto_93906 ?auto_93909 ) ) ( not ( = ?auto_93907 ?auto_93909 ) ) ( ON ?auto_93906 ?auto_93907 ) ( ON-TABLE ?auto_93909 ) ( ON ?auto_93902 ?auto_93908 ) ( not ( = ?auto_93902 ?auto_93908 ) ) ( not ( = ?auto_93903 ?auto_93908 ) ) ( not ( = ?auto_93904 ?auto_93908 ) ) ( not ( = ?auto_93905 ?auto_93908 ) ) ( not ( = ?auto_93906 ?auto_93908 ) ) ( not ( = ?auto_93907 ?auto_93908 ) ) ( not ( = ?auto_93909 ?auto_93908 ) ) ( ON ?auto_93903 ?auto_93902 ) ( ON-TABLE ?auto_93908 ) ( ON ?auto_93904 ?auto_93903 ) ( CLEAR ?auto_93904 ) ( HOLDING ?auto_93905 ) ( CLEAR ?auto_93906 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93909 ?auto_93907 ?auto_93906 ?auto_93905 )
      ( MAKE-6PILE ?auto_93902 ?auto_93903 ?auto_93904 ?auto_93905 ?auto_93906 ?auto_93907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93910 - BLOCK
      ?auto_93911 - BLOCK
      ?auto_93912 - BLOCK
      ?auto_93913 - BLOCK
      ?auto_93914 - BLOCK
      ?auto_93915 - BLOCK
    )
    :vars
    (
      ?auto_93917 - BLOCK
      ?auto_93916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93910 ?auto_93911 ) ) ( not ( = ?auto_93910 ?auto_93912 ) ) ( not ( = ?auto_93910 ?auto_93913 ) ) ( not ( = ?auto_93910 ?auto_93914 ) ) ( not ( = ?auto_93910 ?auto_93915 ) ) ( not ( = ?auto_93911 ?auto_93912 ) ) ( not ( = ?auto_93911 ?auto_93913 ) ) ( not ( = ?auto_93911 ?auto_93914 ) ) ( not ( = ?auto_93911 ?auto_93915 ) ) ( not ( = ?auto_93912 ?auto_93913 ) ) ( not ( = ?auto_93912 ?auto_93914 ) ) ( not ( = ?auto_93912 ?auto_93915 ) ) ( not ( = ?auto_93913 ?auto_93914 ) ) ( not ( = ?auto_93913 ?auto_93915 ) ) ( not ( = ?auto_93914 ?auto_93915 ) ) ( ON ?auto_93915 ?auto_93917 ) ( not ( = ?auto_93910 ?auto_93917 ) ) ( not ( = ?auto_93911 ?auto_93917 ) ) ( not ( = ?auto_93912 ?auto_93917 ) ) ( not ( = ?auto_93913 ?auto_93917 ) ) ( not ( = ?auto_93914 ?auto_93917 ) ) ( not ( = ?auto_93915 ?auto_93917 ) ) ( ON ?auto_93914 ?auto_93915 ) ( ON-TABLE ?auto_93917 ) ( ON ?auto_93910 ?auto_93916 ) ( not ( = ?auto_93910 ?auto_93916 ) ) ( not ( = ?auto_93911 ?auto_93916 ) ) ( not ( = ?auto_93912 ?auto_93916 ) ) ( not ( = ?auto_93913 ?auto_93916 ) ) ( not ( = ?auto_93914 ?auto_93916 ) ) ( not ( = ?auto_93915 ?auto_93916 ) ) ( not ( = ?auto_93917 ?auto_93916 ) ) ( ON ?auto_93911 ?auto_93910 ) ( ON-TABLE ?auto_93916 ) ( ON ?auto_93912 ?auto_93911 ) ( CLEAR ?auto_93914 ) ( ON ?auto_93913 ?auto_93912 ) ( CLEAR ?auto_93913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_93916 ?auto_93910 ?auto_93911 ?auto_93912 )
      ( MAKE-6PILE ?auto_93910 ?auto_93911 ?auto_93912 ?auto_93913 ?auto_93914 ?auto_93915 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93918 - BLOCK
      ?auto_93919 - BLOCK
      ?auto_93920 - BLOCK
      ?auto_93921 - BLOCK
      ?auto_93922 - BLOCK
      ?auto_93923 - BLOCK
    )
    :vars
    (
      ?auto_93925 - BLOCK
      ?auto_93924 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93918 ?auto_93919 ) ) ( not ( = ?auto_93918 ?auto_93920 ) ) ( not ( = ?auto_93918 ?auto_93921 ) ) ( not ( = ?auto_93918 ?auto_93922 ) ) ( not ( = ?auto_93918 ?auto_93923 ) ) ( not ( = ?auto_93919 ?auto_93920 ) ) ( not ( = ?auto_93919 ?auto_93921 ) ) ( not ( = ?auto_93919 ?auto_93922 ) ) ( not ( = ?auto_93919 ?auto_93923 ) ) ( not ( = ?auto_93920 ?auto_93921 ) ) ( not ( = ?auto_93920 ?auto_93922 ) ) ( not ( = ?auto_93920 ?auto_93923 ) ) ( not ( = ?auto_93921 ?auto_93922 ) ) ( not ( = ?auto_93921 ?auto_93923 ) ) ( not ( = ?auto_93922 ?auto_93923 ) ) ( ON ?auto_93923 ?auto_93925 ) ( not ( = ?auto_93918 ?auto_93925 ) ) ( not ( = ?auto_93919 ?auto_93925 ) ) ( not ( = ?auto_93920 ?auto_93925 ) ) ( not ( = ?auto_93921 ?auto_93925 ) ) ( not ( = ?auto_93922 ?auto_93925 ) ) ( not ( = ?auto_93923 ?auto_93925 ) ) ( ON-TABLE ?auto_93925 ) ( ON ?auto_93918 ?auto_93924 ) ( not ( = ?auto_93918 ?auto_93924 ) ) ( not ( = ?auto_93919 ?auto_93924 ) ) ( not ( = ?auto_93920 ?auto_93924 ) ) ( not ( = ?auto_93921 ?auto_93924 ) ) ( not ( = ?auto_93922 ?auto_93924 ) ) ( not ( = ?auto_93923 ?auto_93924 ) ) ( not ( = ?auto_93925 ?auto_93924 ) ) ( ON ?auto_93919 ?auto_93918 ) ( ON-TABLE ?auto_93924 ) ( ON ?auto_93920 ?auto_93919 ) ( ON ?auto_93921 ?auto_93920 ) ( CLEAR ?auto_93921 ) ( HOLDING ?auto_93922 ) ( CLEAR ?auto_93923 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_93925 ?auto_93923 ?auto_93922 )
      ( MAKE-6PILE ?auto_93918 ?auto_93919 ?auto_93920 ?auto_93921 ?auto_93922 ?auto_93923 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93926 - BLOCK
      ?auto_93927 - BLOCK
      ?auto_93928 - BLOCK
      ?auto_93929 - BLOCK
      ?auto_93930 - BLOCK
      ?auto_93931 - BLOCK
    )
    :vars
    (
      ?auto_93932 - BLOCK
      ?auto_93933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93926 ?auto_93927 ) ) ( not ( = ?auto_93926 ?auto_93928 ) ) ( not ( = ?auto_93926 ?auto_93929 ) ) ( not ( = ?auto_93926 ?auto_93930 ) ) ( not ( = ?auto_93926 ?auto_93931 ) ) ( not ( = ?auto_93927 ?auto_93928 ) ) ( not ( = ?auto_93927 ?auto_93929 ) ) ( not ( = ?auto_93927 ?auto_93930 ) ) ( not ( = ?auto_93927 ?auto_93931 ) ) ( not ( = ?auto_93928 ?auto_93929 ) ) ( not ( = ?auto_93928 ?auto_93930 ) ) ( not ( = ?auto_93928 ?auto_93931 ) ) ( not ( = ?auto_93929 ?auto_93930 ) ) ( not ( = ?auto_93929 ?auto_93931 ) ) ( not ( = ?auto_93930 ?auto_93931 ) ) ( ON ?auto_93931 ?auto_93932 ) ( not ( = ?auto_93926 ?auto_93932 ) ) ( not ( = ?auto_93927 ?auto_93932 ) ) ( not ( = ?auto_93928 ?auto_93932 ) ) ( not ( = ?auto_93929 ?auto_93932 ) ) ( not ( = ?auto_93930 ?auto_93932 ) ) ( not ( = ?auto_93931 ?auto_93932 ) ) ( ON-TABLE ?auto_93932 ) ( ON ?auto_93926 ?auto_93933 ) ( not ( = ?auto_93926 ?auto_93933 ) ) ( not ( = ?auto_93927 ?auto_93933 ) ) ( not ( = ?auto_93928 ?auto_93933 ) ) ( not ( = ?auto_93929 ?auto_93933 ) ) ( not ( = ?auto_93930 ?auto_93933 ) ) ( not ( = ?auto_93931 ?auto_93933 ) ) ( not ( = ?auto_93932 ?auto_93933 ) ) ( ON ?auto_93927 ?auto_93926 ) ( ON-TABLE ?auto_93933 ) ( ON ?auto_93928 ?auto_93927 ) ( ON ?auto_93929 ?auto_93928 ) ( CLEAR ?auto_93931 ) ( ON ?auto_93930 ?auto_93929 ) ( CLEAR ?auto_93930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_93933 ?auto_93926 ?auto_93927 ?auto_93928 ?auto_93929 )
      ( MAKE-6PILE ?auto_93926 ?auto_93927 ?auto_93928 ?auto_93929 ?auto_93930 ?auto_93931 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93934 - BLOCK
      ?auto_93935 - BLOCK
      ?auto_93936 - BLOCK
      ?auto_93937 - BLOCK
      ?auto_93938 - BLOCK
      ?auto_93939 - BLOCK
    )
    :vars
    (
      ?auto_93940 - BLOCK
      ?auto_93941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93934 ?auto_93935 ) ) ( not ( = ?auto_93934 ?auto_93936 ) ) ( not ( = ?auto_93934 ?auto_93937 ) ) ( not ( = ?auto_93934 ?auto_93938 ) ) ( not ( = ?auto_93934 ?auto_93939 ) ) ( not ( = ?auto_93935 ?auto_93936 ) ) ( not ( = ?auto_93935 ?auto_93937 ) ) ( not ( = ?auto_93935 ?auto_93938 ) ) ( not ( = ?auto_93935 ?auto_93939 ) ) ( not ( = ?auto_93936 ?auto_93937 ) ) ( not ( = ?auto_93936 ?auto_93938 ) ) ( not ( = ?auto_93936 ?auto_93939 ) ) ( not ( = ?auto_93937 ?auto_93938 ) ) ( not ( = ?auto_93937 ?auto_93939 ) ) ( not ( = ?auto_93938 ?auto_93939 ) ) ( not ( = ?auto_93934 ?auto_93940 ) ) ( not ( = ?auto_93935 ?auto_93940 ) ) ( not ( = ?auto_93936 ?auto_93940 ) ) ( not ( = ?auto_93937 ?auto_93940 ) ) ( not ( = ?auto_93938 ?auto_93940 ) ) ( not ( = ?auto_93939 ?auto_93940 ) ) ( ON-TABLE ?auto_93940 ) ( ON ?auto_93934 ?auto_93941 ) ( not ( = ?auto_93934 ?auto_93941 ) ) ( not ( = ?auto_93935 ?auto_93941 ) ) ( not ( = ?auto_93936 ?auto_93941 ) ) ( not ( = ?auto_93937 ?auto_93941 ) ) ( not ( = ?auto_93938 ?auto_93941 ) ) ( not ( = ?auto_93939 ?auto_93941 ) ) ( not ( = ?auto_93940 ?auto_93941 ) ) ( ON ?auto_93935 ?auto_93934 ) ( ON-TABLE ?auto_93941 ) ( ON ?auto_93936 ?auto_93935 ) ( ON ?auto_93937 ?auto_93936 ) ( ON ?auto_93938 ?auto_93937 ) ( CLEAR ?auto_93938 ) ( HOLDING ?auto_93939 ) ( CLEAR ?auto_93940 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_93940 ?auto_93939 )
      ( MAKE-6PILE ?auto_93934 ?auto_93935 ?auto_93936 ?auto_93937 ?auto_93938 ?auto_93939 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93942 - BLOCK
      ?auto_93943 - BLOCK
      ?auto_93944 - BLOCK
      ?auto_93945 - BLOCK
      ?auto_93946 - BLOCK
      ?auto_93947 - BLOCK
    )
    :vars
    (
      ?auto_93949 - BLOCK
      ?auto_93948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93942 ?auto_93943 ) ) ( not ( = ?auto_93942 ?auto_93944 ) ) ( not ( = ?auto_93942 ?auto_93945 ) ) ( not ( = ?auto_93942 ?auto_93946 ) ) ( not ( = ?auto_93942 ?auto_93947 ) ) ( not ( = ?auto_93943 ?auto_93944 ) ) ( not ( = ?auto_93943 ?auto_93945 ) ) ( not ( = ?auto_93943 ?auto_93946 ) ) ( not ( = ?auto_93943 ?auto_93947 ) ) ( not ( = ?auto_93944 ?auto_93945 ) ) ( not ( = ?auto_93944 ?auto_93946 ) ) ( not ( = ?auto_93944 ?auto_93947 ) ) ( not ( = ?auto_93945 ?auto_93946 ) ) ( not ( = ?auto_93945 ?auto_93947 ) ) ( not ( = ?auto_93946 ?auto_93947 ) ) ( not ( = ?auto_93942 ?auto_93949 ) ) ( not ( = ?auto_93943 ?auto_93949 ) ) ( not ( = ?auto_93944 ?auto_93949 ) ) ( not ( = ?auto_93945 ?auto_93949 ) ) ( not ( = ?auto_93946 ?auto_93949 ) ) ( not ( = ?auto_93947 ?auto_93949 ) ) ( ON-TABLE ?auto_93949 ) ( ON ?auto_93942 ?auto_93948 ) ( not ( = ?auto_93942 ?auto_93948 ) ) ( not ( = ?auto_93943 ?auto_93948 ) ) ( not ( = ?auto_93944 ?auto_93948 ) ) ( not ( = ?auto_93945 ?auto_93948 ) ) ( not ( = ?auto_93946 ?auto_93948 ) ) ( not ( = ?auto_93947 ?auto_93948 ) ) ( not ( = ?auto_93949 ?auto_93948 ) ) ( ON ?auto_93943 ?auto_93942 ) ( ON-TABLE ?auto_93948 ) ( ON ?auto_93944 ?auto_93943 ) ( ON ?auto_93945 ?auto_93944 ) ( ON ?auto_93946 ?auto_93945 ) ( CLEAR ?auto_93949 ) ( ON ?auto_93947 ?auto_93946 ) ( CLEAR ?auto_93947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93948 ?auto_93942 ?auto_93943 ?auto_93944 ?auto_93945 ?auto_93946 )
      ( MAKE-6PILE ?auto_93942 ?auto_93943 ?auto_93944 ?auto_93945 ?auto_93946 ?auto_93947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93950 - BLOCK
      ?auto_93951 - BLOCK
      ?auto_93952 - BLOCK
      ?auto_93953 - BLOCK
      ?auto_93954 - BLOCK
      ?auto_93955 - BLOCK
    )
    :vars
    (
      ?auto_93956 - BLOCK
      ?auto_93957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93950 ?auto_93951 ) ) ( not ( = ?auto_93950 ?auto_93952 ) ) ( not ( = ?auto_93950 ?auto_93953 ) ) ( not ( = ?auto_93950 ?auto_93954 ) ) ( not ( = ?auto_93950 ?auto_93955 ) ) ( not ( = ?auto_93951 ?auto_93952 ) ) ( not ( = ?auto_93951 ?auto_93953 ) ) ( not ( = ?auto_93951 ?auto_93954 ) ) ( not ( = ?auto_93951 ?auto_93955 ) ) ( not ( = ?auto_93952 ?auto_93953 ) ) ( not ( = ?auto_93952 ?auto_93954 ) ) ( not ( = ?auto_93952 ?auto_93955 ) ) ( not ( = ?auto_93953 ?auto_93954 ) ) ( not ( = ?auto_93953 ?auto_93955 ) ) ( not ( = ?auto_93954 ?auto_93955 ) ) ( not ( = ?auto_93950 ?auto_93956 ) ) ( not ( = ?auto_93951 ?auto_93956 ) ) ( not ( = ?auto_93952 ?auto_93956 ) ) ( not ( = ?auto_93953 ?auto_93956 ) ) ( not ( = ?auto_93954 ?auto_93956 ) ) ( not ( = ?auto_93955 ?auto_93956 ) ) ( ON ?auto_93950 ?auto_93957 ) ( not ( = ?auto_93950 ?auto_93957 ) ) ( not ( = ?auto_93951 ?auto_93957 ) ) ( not ( = ?auto_93952 ?auto_93957 ) ) ( not ( = ?auto_93953 ?auto_93957 ) ) ( not ( = ?auto_93954 ?auto_93957 ) ) ( not ( = ?auto_93955 ?auto_93957 ) ) ( not ( = ?auto_93956 ?auto_93957 ) ) ( ON ?auto_93951 ?auto_93950 ) ( ON-TABLE ?auto_93957 ) ( ON ?auto_93952 ?auto_93951 ) ( ON ?auto_93953 ?auto_93952 ) ( ON ?auto_93954 ?auto_93953 ) ( ON ?auto_93955 ?auto_93954 ) ( CLEAR ?auto_93955 ) ( HOLDING ?auto_93956 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_93956 )
      ( MAKE-6PILE ?auto_93950 ?auto_93951 ?auto_93952 ?auto_93953 ?auto_93954 ?auto_93955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_93958 - BLOCK
      ?auto_93959 - BLOCK
      ?auto_93960 - BLOCK
      ?auto_93961 - BLOCK
      ?auto_93962 - BLOCK
      ?auto_93963 - BLOCK
    )
    :vars
    (
      ?auto_93965 - BLOCK
      ?auto_93964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_93958 ?auto_93959 ) ) ( not ( = ?auto_93958 ?auto_93960 ) ) ( not ( = ?auto_93958 ?auto_93961 ) ) ( not ( = ?auto_93958 ?auto_93962 ) ) ( not ( = ?auto_93958 ?auto_93963 ) ) ( not ( = ?auto_93959 ?auto_93960 ) ) ( not ( = ?auto_93959 ?auto_93961 ) ) ( not ( = ?auto_93959 ?auto_93962 ) ) ( not ( = ?auto_93959 ?auto_93963 ) ) ( not ( = ?auto_93960 ?auto_93961 ) ) ( not ( = ?auto_93960 ?auto_93962 ) ) ( not ( = ?auto_93960 ?auto_93963 ) ) ( not ( = ?auto_93961 ?auto_93962 ) ) ( not ( = ?auto_93961 ?auto_93963 ) ) ( not ( = ?auto_93962 ?auto_93963 ) ) ( not ( = ?auto_93958 ?auto_93965 ) ) ( not ( = ?auto_93959 ?auto_93965 ) ) ( not ( = ?auto_93960 ?auto_93965 ) ) ( not ( = ?auto_93961 ?auto_93965 ) ) ( not ( = ?auto_93962 ?auto_93965 ) ) ( not ( = ?auto_93963 ?auto_93965 ) ) ( ON ?auto_93958 ?auto_93964 ) ( not ( = ?auto_93958 ?auto_93964 ) ) ( not ( = ?auto_93959 ?auto_93964 ) ) ( not ( = ?auto_93960 ?auto_93964 ) ) ( not ( = ?auto_93961 ?auto_93964 ) ) ( not ( = ?auto_93962 ?auto_93964 ) ) ( not ( = ?auto_93963 ?auto_93964 ) ) ( not ( = ?auto_93965 ?auto_93964 ) ) ( ON ?auto_93959 ?auto_93958 ) ( ON-TABLE ?auto_93964 ) ( ON ?auto_93960 ?auto_93959 ) ( ON ?auto_93961 ?auto_93960 ) ( ON ?auto_93962 ?auto_93961 ) ( ON ?auto_93963 ?auto_93962 ) ( ON ?auto_93965 ?auto_93963 ) ( CLEAR ?auto_93965 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_93964 ?auto_93958 ?auto_93959 ?auto_93960 ?auto_93961 ?auto_93962 ?auto_93963 )
      ( MAKE-6PILE ?auto_93958 ?auto_93959 ?auto_93960 ?auto_93961 ?auto_93962 ?auto_93963 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93980 - BLOCK
      ?auto_93981 - BLOCK
      ?auto_93982 - BLOCK
      ?auto_93983 - BLOCK
      ?auto_93984 - BLOCK
      ?auto_93985 - BLOCK
      ?auto_93986 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_93985 ) ( ON-TABLE ?auto_93980 ) ( ON ?auto_93981 ?auto_93980 ) ( ON ?auto_93982 ?auto_93981 ) ( ON ?auto_93983 ?auto_93982 ) ( ON ?auto_93984 ?auto_93983 ) ( ON ?auto_93985 ?auto_93984 ) ( not ( = ?auto_93980 ?auto_93981 ) ) ( not ( = ?auto_93980 ?auto_93982 ) ) ( not ( = ?auto_93980 ?auto_93983 ) ) ( not ( = ?auto_93980 ?auto_93984 ) ) ( not ( = ?auto_93980 ?auto_93985 ) ) ( not ( = ?auto_93980 ?auto_93986 ) ) ( not ( = ?auto_93981 ?auto_93982 ) ) ( not ( = ?auto_93981 ?auto_93983 ) ) ( not ( = ?auto_93981 ?auto_93984 ) ) ( not ( = ?auto_93981 ?auto_93985 ) ) ( not ( = ?auto_93981 ?auto_93986 ) ) ( not ( = ?auto_93982 ?auto_93983 ) ) ( not ( = ?auto_93982 ?auto_93984 ) ) ( not ( = ?auto_93982 ?auto_93985 ) ) ( not ( = ?auto_93982 ?auto_93986 ) ) ( not ( = ?auto_93983 ?auto_93984 ) ) ( not ( = ?auto_93983 ?auto_93985 ) ) ( not ( = ?auto_93983 ?auto_93986 ) ) ( not ( = ?auto_93984 ?auto_93985 ) ) ( not ( = ?auto_93984 ?auto_93986 ) ) ( not ( = ?auto_93985 ?auto_93986 ) ) ( ON-TABLE ?auto_93986 ) ( CLEAR ?auto_93986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_93986 )
      ( MAKE-7PILE ?auto_93980 ?auto_93981 ?auto_93982 ?auto_93983 ?auto_93984 ?auto_93985 ?auto_93986 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93987 - BLOCK
      ?auto_93988 - BLOCK
      ?auto_93989 - BLOCK
      ?auto_93990 - BLOCK
      ?auto_93991 - BLOCK
      ?auto_93992 - BLOCK
      ?auto_93993 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93987 ) ( ON ?auto_93988 ?auto_93987 ) ( ON ?auto_93989 ?auto_93988 ) ( ON ?auto_93990 ?auto_93989 ) ( ON ?auto_93991 ?auto_93990 ) ( not ( = ?auto_93987 ?auto_93988 ) ) ( not ( = ?auto_93987 ?auto_93989 ) ) ( not ( = ?auto_93987 ?auto_93990 ) ) ( not ( = ?auto_93987 ?auto_93991 ) ) ( not ( = ?auto_93987 ?auto_93992 ) ) ( not ( = ?auto_93987 ?auto_93993 ) ) ( not ( = ?auto_93988 ?auto_93989 ) ) ( not ( = ?auto_93988 ?auto_93990 ) ) ( not ( = ?auto_93988 ?auto_93991 ) ) ( not ( = ?auto_93988 ?auto_93992 ) ) ( not ( = ?auto_93988 ?auto_93993 ) ) ( not ( = ?auto_93989 ?auto_93990 ) ) ( not ( = ?auto_93989 ?auto_93991 ) ) ( not ( = ?auto_93989 ?auto_93992 ) ) ( not ( = ?auto_93989 ?auto_93993 ) ) ( not ( = ?auto_93990 ?auto_93991 ) ) ( not ( = ?auto_93990 ?auto_93992 ) ) ( not ( = ?auto_93990 ?auto_93993 ) ) ( not ( = ?auto_93991 ?auto_93992 ) ) ( not ( = ?auto_93991 ?auto_93993 ) ) ( not ( = ?auto_93992 ?auto_93993 ) ) ( ON-TABLE ?auto_93993 ) ( CLEAR ?auto_93993 ) ( HOLDING ?auto_93992 ) ( CLEAR ?auto_93991 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_93987 ?auto_93988 ?auto_93989 ?auto_93990 ?auto_93991 ?auto_93992 )
      ( MAKE-7PILE ?auto_93987 ?auto_93988 ?auto_93989 ?auto_93990 ?auto_93991 ?auto_93992 ?auto_93993 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_93994 - BLOCK
      ?auto_93995 - BLOCK
      ?auto_93996 - BLOCK
      ?auto_93997 - BLOCK
      ?auto_93998 - BLOCK
      ?auto_93999 - BLOCK
      ?auto_94000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_93994 ) ( ON ?auto_93995 ?auto_93994 ) ( ON ?auto_93996 ?auto_93995 ) ( ON ?auto_93997 ?auto_93996 ) ( ON ?auto_93998 ?auto_93997 ) ( not ( = ?auto_93994 ?auto_93995 ) ) ( not ( = ?auto_93994 ?auto_93996 ) ) ( not ( = ?auto_93994 ?auto_93997 ) ) ( not ( = ?auto_93994 ?auto_93998 ) ) ( not ( = ?auto_93994 ?auto_93999 ) ) ( not ( = ?auto_93994 ?auto_94000 ) ) ( not ( = ?auto_93995 ?auto_93996 ) ) ( not ( = ?auto_93995 ?auto_93997 ) ) ( not ( = ?auto_93995 ?auto_93998 ) ) ( not ( = ?auto_93995 ?auto_93999 ) ) ( not ( = ?auto_93995 ?auto_94000 ) ) ( not ( = ?auto_93996 ?auto_93997 ) ) ( not ( = ?auto_93996 ?auto_93998 ) ) ( not ( = ?auto_93996 ?auto_93999 ) ) ( not ( = ?auto_93996 ?auto_94000 ) ) ( not ( = ?auto_93997 ?auto_93998 ) ) ( not ( = ?auto_93997 ?auto_93999 ) ) ( not ( = ?auto_93997 ?auto_94000 ) ) ( not ( = ?auto_93998 ?auto_93999 ) ) ( not ( = ?auto_93998 ?auto_94000 ) ) ( not ( = ?auto_93999 ?auto_94000 ) ) ( ON-TABLE ?auto_94000 ) ( CLEAR ?auto_93998 ) ( ON ?auto_93999 ?auto_94000 ) ( CLEAR ?auto_93999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94000 )
      ( MAKE-7PILE ?auto_93994 ?auto_93995 ?auto_93996 ?auto_93997 ?auto_93998 ?auto_93999 ?auto_94000 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94001 - BLOCK
      ?auto_94002 - BLOCK
      ?auto_94003 - BLOCK
      ?auto_94004 - BLOCK
      ?auto_94005 - BLOCK
      ?auto_94006 - BLOCK
      ?auto_94007 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94001 ) ( ON ?auto_94002 ?auto_94001 ) ( ON ?auto_94003 ?auto_94002 ) ( ON ?auto_94004 ?auto_94003 ) ( not ( = ?auto_94001 ?auto_94002 ) ) ( not ( = ?auto_94001 ?auto_94003 ) ) ( not ( = ?auto_94001 ?auto_94004 ) ) ( not ( = ?auto_94001 ?auto_94005 ) ) ( not ( = ?auto_94001 ?auto_94006 ) ) ( not ( = ?auto_94001 ?auto_94007 ) ) ( not ( = ?auto_94002 ?auto_94003 ) ) ( not ( = ?auto_94002 ?auto_94004 ) ) ( not ( = ?auto_94002 ?auto_94005 ) ) ( not ( = ?auto_94002 ?auto_94006 ) ) ( not ( = ?auto_94002 ?auto_94007 ) ) ( not ( = ?auto_94003 ?auto_94004 ) ) ( not ( = ?auto_94003 ?auto_94005 ) ) ( not ( = ?auto_94003 ?auto_94006 ) ) ( not ( = ?auto_94003 ?auto_94007 ) ) ( not ( = ?auto_94004 ?auto_94005 ) ) ( not ( = ?auto_94004 ?auto_94006 ) ) ( not ( = ?auto_94004 ?auto_94007 ) ) ( not ( = ?auto_94005 ?auto_94006 ) ) ( not ( = ?auto_94005 ?auto_94007 ) ) ( not ( = ?auto_94006 ?auto_94007 ) ) ( ON-TABLE ?auto_94007 ) ( ON ?auto_94006 ?auto_94007 ) ( CLEAR ?auto_94006 ) ( HOLDING ?auto_94005 ) ( CLEAR ?auto_94004 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94001 ?auto_94002 ?auto_94003 ?auto_94004 ?auto_94005 )
      ( MAKE-7PILE ?auto_94001 ?auto_94002 ?auto_94003 ?auto_94004 ?auto_94005 ?auto_94006 ?auto_94007 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94008 - BLOCK
      ?auto_94009 - BLOCK
      ?auto_94010 - BLOCK
      ?auto_94011 - BLOCK
      ?auto_94012 - BLOCK
      ?auto_94013 - BLOCK
      ?auto_94014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94008 ) ( ON ?auto_94009 ?auto_94008 ) ( ON ?auto_94010 ?auto_94009 ) ( ON ?auto_94011 ?auto_94010 ) ( not ( = ?auto_94008 ?auto_94009 ) ) ( not ( = ?auto_94008 ?auto_94010 ) ) ( not ( = ?auto_94008 ?auto_94011 ) ) ( not ( = ?auto_94008 ?auto_94012 ) ) ( not ( = ?auto_94008 ?auto_94013 ) ) ( not ( = ?auto_94008 ?auto_94014 ) ) ( not ( = ?auto_94009 ?auto_94010 ) ) ( not ( = ?auto_94009 ?auto_94011 ) ) ( not ( = ?auto_94009 ?auto_94012 ) ) ( not ( = ?auto_94009 ?auto_94013 ) ) ( not ( = ?auto_94009 ?auto_94014 ) ) ( not ( = ?auto_94010 ?auto_94011 ) ) ( not ( = ?auto_94010 ?auto_94012 ) ) ( not ( = ?auto_94010 ?auto_94013 ) ) ( not ( = ?auto_94010 ?auto_94014 ) ) ( not ( = ?auto_94011 ?auto_94012 ) ) ( not ( = ?auto_94011 ?auto_94013 ) ) ( not ( = ?auto_94011 ?auto_94014 ) ) ( not ( = ?auto_94012 ?auto_94013 ) ) ( not ( = ?auto_94012 ?auto_94014 ) ) ( not ( = ?auto_94013 ?auto_94014 ) ) ( ON-TABLE ?auto_94014 ) ( ON ?auto_94013 ?auto_94014 ) ( CLEAR ?auto_94011 ) ( ON ?auto_94012 ?auto_94013 ) ( CLEAR ?auto_94012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94014 ?auto_94013 )
      ( MAKE-7PILE ?auto_94008 ?auto_94009 ?auto_94010 ?auto_94011 ?auto_94012 ?auto_94013 ?auto_94014 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94015 - BLOCK
      ?auto_94016 - BLOCK
      ?auto_94017 - BLOCK
      ?auto_94018 - BLOCK
      ?auto_94019 - BLOCK
      ?auto_94020 - BLOCK
      ?auto_94021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94015 ) ( ON ?auto_94016 ?auto_94015 ) ( ON ?auto_94017 ?auto_94016 ) ( not ( = ?auto_94015 ?auto_94016 ) ) ( not ( = ?auto_94015 ?auto_94017 ) ) ( not ( = ?auto_94015 ?auto_94018 ) ) ( not ( = ?auto_94015 ?auto_94019 ) ) ( not ( = ?auto_94015 ?auto_94020 ) ) ( not ( = ?auto_94015 ?auto_94021 ) ) ( not ( = ?auto_94016 ?auto_94017 ) ) ( not ( = ?auto_94016 ?auto_94018 ) ) ( not ( = ?auto_94016 ?auto_94019 ) ) ( not ( = ?auto_94016 ?auto_94020 ) ) ( not ( = ?auto_94016 ?auto_94021 ) ) ( not ( = ?auto_94017 ?auto_94018 ) ) ( not ( = ?auto_94017 ?auto_94019 ) ) ( not ( = ?auto_94017 ?auto_94020 ) ) ( not ( = ?auto_94017 ?auto_94021 ) ) ( not ( = ?auto_94018 ?auto_94019 ) ) ( not ( = ?auto_94018 ?auto_94020 ) ) ( not ( = ?auto_94018 ?auto_94021 ) ) ( not ( = ?auto_94019 ?auto_94020 ) ) ( not ( = ?auto_94019 ?auto_94021 ) ) ( not ( = ?auto_94020 ?auto_94021 ) ) ( ON-TABLE ?auto_94021 ) ( ON ?auto_94020 ?auto_94021 ) ( ON ?auto_94019 ?auto_94020 ) ( CLEAR ?auto_94019 ) ( HOLDING ?auto_94018 ) ( CLEAR ?auto_94017 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94015 ?auto_94016 ?auto_94017 ?auto_94018 )
      ( MAKE-7PILE ?auto_94015 ?auto_94016 ?auto_94017 ?auto_94018 ?auto_94019 ?auto_94020 ?auto_94021 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94022 - BLOCK
      ?auto_94023 - BLOCK
      ?auto_94024 - BLOCK
      ?auto_94025 - BLOCK
      ?auto_94026 - BLOCK
      ?auto_94027 - BLOCK
      ?auto_94028 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94022 ) ( ON ?auto_94023 ?auto_94022 ) ( ON ?auto_94024 ?auto_94023 ) ( not ( = ?auto_94022 ?auto_94023 ) ) ( not ( = ?auto_94022 ?auto_94024 ) ) ( not ( = ?auto_94022 ?auto_94025 ) ) ( not ( = ?auto_94022 ?auto_94026 ) ) ( not ( = ?auto_94022 ?auto_94027 ) ) ( not ( = ?auto_94022 ?auto_94028 ) ) ( not ( = ?auto_94023 ?auto_94024 ) ) ( not ( = ?auto_94023 ?auto_94025 ) ) ( not ( = ?auto_94023 ?auto_94026 ) ) ( not ( = ?auto_94023 ?auto_94027 ) ) ( not ( = ?auto_94023 ?auto_94028 ) ) ( not ( = ?auto_94024 ?auto_94025 ) ) ( not ( = ?auto_94024 ?auto_94026 ) ) ( not ( = ?auto_94024 ?auto_94027 ) ) ( not ( = ?auto_94024 ?auto_94028 ) ) ( not ( = ?auto_94025 ?auto_94026 ) ) ( not ( = ?auto_94025 ?auto_94027 ) ) ( not ( = ?auto_94025 ?auto_94028 ) ) ( not ( = ?auto_94026 ?auto_94027 ) ) ( not ( = ?auto_94026 ?auto_94028 ) ) ( not ( = ?auto_94027 ?auto_94028 ) ) ( ON-TABLE ?auto_94028 ) ( ON ?auto_94027 ?auto_94028 ) ( ON ?auto_94026 ?auto_94027 ) ( CLEAR ?auto_94024 ) ( ON ?auto_94025 ?auto_94026 ) ( CLEAR ?auto_94025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94028 ?auto_94027 ?auto_94026 )
      ( MAKE-7PILE ?auto_94022 ?auto_94023 ?auto_94024 ?auto_94025 ?auto_94026 ?auto_94027 ?auto_94028 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94029 - BLOCK
      ?auto_94030 - BLOCK
      ?auto_94031 - BLOCK
      ?auto_94032 - BLOCK
      ?auto_94033 - BLOCK
      ?auto_94034 - BLOCK
      ?auto_94035 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94029 ) ( ON ?auto_94030 ?auto_94029 ) ( not ( = ?auto_94029 ?auto_94030 ) ) ( not ( = ?auto_94029 ?auto_94031 ) ) ( not ( = ?auto_94029 ?auto_94032 ) ) ( not ( = ?auto_94029 ?auto_94033 ) ) ( not ( = ?auto_94029 ?auto_94034 ) ) ( not ( = ?auto_94029 ?auto_94035 ) ) ( not ( = ?auto_94030 ?auto_94031 ) ) ( not ( = ?auto_94030 ?auto_94032 ) ) ( not ( = ?auto_94030 ?auto_94033 ) ) ( not ( = ?auto_94030 ?auto_94034 ) ) ( not ( = ?auto_94030 ?auto_94035 ) ) ( not ( = ?auto_94031 ?auto_94032 ) ) ( not ( = ?auto_94031 ?auto_94033 ) ) ( not ( = ?auto_94031 ?auto_94034 ) ) ( not ( = ?auto_94031 ?auto_94035 ) ) ( not ( = ?auto_94032 ?auto_94033 ) ) ( not ( = ?auto_94032 ?auto_94034 ) ) ( not ( = ?auto_94032 ?auto_94035 ) ) ( not ( = ?auto_94033 ?auto_94034 ) ) ( not ( = ?auto_94033 ?auto_94035 ) ) ( not ( = ?auto_94034 ?auto_94035 ) ) ( ON-TABLE ?auto_94035 ) ( ON ?auto_94034 ?auto_94035 ) ( ON ?auto_94033 ?auto_94034 ) ( ON ?auto_94032 ?auto_94033 ) ( CLEAR ?auto_94032 ) ( HOLDING ?auto_94031 ) ( CLEAR ?auto_94030 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94029 ?auto_94030 ?auto_94031 )
      ( MAKE-7PILE ?auto_94029 ?auto_94030 ?auto_94031 ?auto_94032 ?auto_94033 ?auto_94034 ?auto_94035 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94036 - BLOCK
      ?auto_94037 - BLOCK
      ?auto_94038 - BLOCK
      ?auto_94039 - BLOCK
      ?auto_94040 - BLOCK
      ?auto_94041 - BLOCK
      ?auto_94042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94036 ) ( ON ?auto_94037 ?auto_94036 ) ( not ( = ?auto_94036 ?auto_94037 ) ) ( not ( = ?auto_94036 ?auto_94038 ) ) ( not ( = ?auto_94036 ?auto_94039 ) ) ( not ( = ?auto_94036 ?auto_94040 ) ) ( not ( = ?auto_94036 ?auto_94041 ) ) ( not ( = ?auto_94036 ?auto_94042 ) ) ( not ( = ?auto_94037 ?auto_94038 ) ) ( not ( = ?auto_94037 ?auto_94039 ) ) ( not ( = ?auto_94037 ?auto_94040 ) ) ( not ( = ?auto_94037 ?auto_94041 ) ) ( not ( = ?auto_94037 ?auto_94042 ) ) ( not ( = ?auto_94038 ?auto_94039 ) ) ( not ( = ?auto_94038 ?auto_94040 ) ) ( not ( = ?auto_94038 ?auto_94041 ) ) ( not ( = ?auto_94038 ?auto_94042 ) ) ( not ( = ?auto_94039 ?auto_94040 ) ) ( not ( = ?auto_94039 ?auto_94041 ) ) ( not ( = ?auto_94039 ?auto_94042 ) ) ( not ( = ?auto_94040 ?auto_94041 ) ) ( not ( = ?auto_94040 ?auto_94042 ) ) ( not ( = ?auto_94041 ?auto_94042 ) ) ( ON-TABLE ?auto_94042 ) ( ON ?auto_94041 ?auto_94042 ) ( ON ?auto_94040 ?auto_94041 ) ( ON ?auto_94039 ?auto_94040 ) ( CLEAR ?auto_94037 ) ( ON ?auto_94038 ?auto_94039 ) ( CLEAR ?auto_94038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94042 ?auto_94041 ?auto_94040 ?auto_94039 )
      ( MAKE-7PILE ?auto_94036 ?auto_94037 ?auto_94038 ?auto_94039 ?auto_94040 ?auto_94041 ?auto_94042 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94043 - BLOCK
      ?auto_94044 - BLOCK
      ?auto_94045 - BLOCK
      ?auto_94046 - BLOCK
      ?auto_94047 - BLOCK
      ?auto_94048 - BLOCK
      ?auto_94049 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94043 ) ( not ( = ?auto_94043 ?auto_94044 ) ) ( not ( = ?auto_94043 ?auto_94045 ) ) ( not ( = ?auto_94043 ?auto_94046 ) ) ( not ( = ?auto_94043 ?auto_94047 ) ) ( not ( = ?auto_94043 ?auto_94048 ) ) ( not ( = ?auto_94043 ?auto_94049 ) ) ( not ( = ?auto_94044 ?auto_94045 ) ) ( not ( = ?auto_94044 ?auto_94046 ) ) ( not ( = ?auto_94044 ?auto_94047 ) ) ( not ( = ?auto_94044 ?auto_94048 ) ) ( not ( = ?auto_94044 ?auto_94049 ) ) ( not ( = ?auto_94045 ?auto_94046 ) ) ( not ( = ?auto_94045 ?auto_94047 ) ) ( not ( = ?auto_94045 ?auto_94048 ) ) ( not ( = ?auto_94045 ?auto_94049 ) ) ( not ( = ?auto_94046 ?auto_94047 ) ) ( not ( = ?auto_94046 ?auto_94048 ) ) ( not ( = ?auto_94046 ?auto_94049 ) ) ( not ( = ?auto_94047 ?auto_94048 ) ) ( not ( = ?auto_94047 ?auto_94049 ) ) ( not ( = ?auto_94048 ?auto_94049 ) ) ( ON-TABLE ?auto_94049 ) ( ON ?auto_94048 ?auto_94049 ) ( ON ?auto_94047 ?auto_94048 ) ( ON ?auto_94046 ?auto_94047 ) ( ON ?auto_94045 ?auto_94046 ) ( CLEAR ?auto_94045 ) ( HOLDING ?auto_94044 ) ( CLEAR ?auto_94043 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94043 ?auto_94044 )
      ( MAKE-7PILE ?auto_94043 ?auto_94044 ?auto_94045 ?auto_94046 ?auto_94047 ?auto_94048 ?auto_94049 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94050 - BLOCK
      ?auto_94051 - BLOCK
      ?auto_94052 - BLOCK
      ?auto_94053 - BLOCK
      ?auto_94054 - BLOCK
      ?auto_94055 - BLOCK
      ?auto_94056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_94050 ) ( not ( = ?auto_94050 ?auto_94051 ) ) ( not ( = ?auto_94050 ?auto_94052 ) ) ( not ( = ?auto_94050 ?auto_94053 ) ) ( not ( = ?auto_94050 ?auto_94054 ) ) ( not ( = ?auto_94050 ?auto_94055 ) ) ( not ( = ?auto_94050 ?auto_94056 ) ) ( not ( = ?auto_94051 ?auto_94052 ) ) ( not ( = ?auto_94051 ?auto_94053 ) ) ( not ( = ?auto_94051 ?auto_94054 ) ) ( not ( = ?auto_94051 ?auto_94055 ) ) ( not ( = ?auto_94051 ?auto_94056 ) ) ( not ( = ?auto_94052 ?auto_94053 ) ) ( not ( = ?auto_94052 ?auto_94054 ) ) ( not ( = ?auto_94052 ?auto_94055 ) ) ( not ( = ?auto_94052 ?auto_94056 ) ) ( not ( = ?auto_94053 ?auto_94054 ) ) ( not ( = ?auto_94053 ?auto_94055 ) ) ( not ( = ?auto_94053 ?auto_94056 ) ) ( not ( = ?auto_94054 ?auto_94055 ) ) ( not ( = ?auto_94054 ?auto_94056 ) ) ( not ( = ?auto_94055 ?auto_94056 ) ) ( ON-TABLE ?auto_94056 ) ( ON ?auto_94055 ?auto_94056 ) ( ON ?auto_94054 ?auto_94055 ) ( ON ?auto_94053 ?auto_94054 ) ( ON ?auto_94052 ?auto_94053 ) ( CLEAR ?auto_94050 ) ( ON ?auto_94051 ?auto_94052 ) ( CLEAR ?auto_94051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94056 ?auto_94055 ?auto_94054 ?auto_94053 ?auto_94052 )
      ( MAKE-7PILE ?auto_94050 ?auto_94051 ?auto_94052 ?auto_94053 ?auto_94054 ?auto_94055 ?auto_94056 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94057 - BLOCK
      ?auto_94058 - BLOCK
      ?auto_94059 - BLOCK
      ?auto_94060 - BLOCK
      ?auto_94061 - BLOCK
      ?auto_94062 - BLOCK
      ?auto_94063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94057 ?auto_94058 ) ) ( not ( = ?auto_94057 ?auto_94059 ) ) ( not ( = ?auto_94057 ?auto_94060 ) ) ( not ( = ?auto_94057 ?auto_94061 ) ) ( not ( = ?auto_94057 ?auto_94062 ) ) ( not ( = ?auto_94057 ?auto_94063 ) ) ( not ( = ?auto_94058 ?auto_94059 ) ) ( not ( = ?auto_94058 ?auto_94060 ) ) ( not ( = ?auto_94058 ?auto_94061 ) ) ( not ( = ?auto_94058 ?auto_94062 ) ) ( not ( = ?auto_94058 ?auto_94063 ) ) ( not ( = ?auto_94059 ?auto_94060 ) ) ( not ( = ?auto_94059 ?auto_94061 ) ) ( not ( = ?auto_94059 ?auto_94062 ) ) ( not ( = ?auto_94059 ?auto_94063 ) ) ( not ( = ?auto_94060 ?auto_94061 ) ) ( not ( = ?auto_94060 ?auto_94062 ) ) ( not ( = ?auto_94060 ?auto_94063 ) ) ( not ( = ?auto_94061 ?auto_94062 ) ) ( not ( = ?auto_94061 ?auto_94063 ) ) ( not ( = ?auto_94062 ?auto_94063 ) ) ( ON-TABLE ?auto_94063 ) ( ON ?auto_94062 ?auto_94063 ) ( ON ?auto_94061 ?auto_94062 ) ( ON ?auto_94060 ?auto_94061 ) ( ON ?auto_94059 ?auto_94060 ) ( ON ?auto_94058 ?auto_94059 ) ( CLEAR ?auto_94058 ) ( HOLDING ?auto_94057 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94057 )
      ( MAKE-7PILE ?auto_94057 ?auto_94058 ?auto_94059 ?auto_94060 ?auto_94061 ?auto_94062 ?auto_94063 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94064 - BLOCK
      ?auto_94065 - BLOCK
      ?auto_94066 - BLOCK
      ?auto_94067 - BLOCK
      ?auto_94068 - BLOCK
      ?auto_94069 - BLOCK
      ?auto_94070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94064 ?auto_94065 ) ) ( not ( = ?auto_94064 ?auto_94066 ) ) ( not ( = ?auto_94064 ?auto_94067 ) ) ( not ( = ?auto_94064 ?auto_94068 ) ) ( not ( = ?auto_94064 ?auto_94069 ) ) ( not ( = ?auto_94064 ?auto_94070 ) ) ( not ( = ?auto_94065 ?auto_94066 ) ) ( not ( = ?auto_94065 ?auto_94067 ) ) ( not ( = ?auto_94065 ?auto_94068 ) ) ( not ( = ?auto_94065 ?auto_94069 ) ) ( not ( = ?auto_94065 ?auto_94070 ) ) ( not ( = ?auto_94066 ?auto_94067 ) ) ( not ( = ?auto_94066 ?auto_94068 ) ) ( not ( = ?auto_94066 ?auto_94069 ) ) ( not ( = ?auto_94066 ?auto_94070 ) ) ( not ( = ?auto_94067 ?auto_94068 ) ) ( not ( = ?auto_94067 ?auto_94069 ) ) ( not ( = ?auto_94067 ?auto_94070 ) ) ( not ( = ?auto_94068 ?auto_94069 ) ) ( not ( = ?auto_94068 ?auto_94070 ) ) ( not ( = ?auto_94069 ?auto_94070 ) ) ( ON-TABLE ?auto_94070 ) ( ON ?auto_94069 ?auto_94070 ) ( ON ?auto_94068 ?auto_94069 ) ( ON ?auto_94067 ?auto_94068 ) ( ON ?auto_94066 ?auto_94067 ) ( ON ?auto_94065 ?auto_94066 ) ( ON ?auto_94064 ?auto_94065 ) ( CLEAR ?auto_94064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94070 ?auto_94069 ?auto_94068 ?auto_94067 ?auto_94066 ?auto_94065 )
      ( MAKE-7PILE ?auto_94064 ?auto_94065 ?auto_94066 ?auto_94067 ?auto_94068 ?auto_94069 ?auto_94070 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94078 - BLOCK
      ?auto_94079 - BLOCK
      ?auto_94080 - BLOCK
      ?auto_94081 - BLOCK
      ?auto_94082 - BLOCK
      ?auto_94083 - BLOCK
      ?auto_94084 - BLOCK
    )
    :vars
    (
      ?auto_94085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94078 ?auto_94079 ) ) ( not ( = ?auto_94078 ?auto_94080 ) ) ( not ( = ?auto_94078 ?auto_94081 ) ) ( not ( = ?auto_94078 ?auto_94082 ) ) ( not ( = ?auto_94078 ?auto_94083 ) ) ( not ( = ?auto_94078 ?auto_94084 ) ) ( not ( = ?auto_94079 ?auto_94080 ) ) ( not ( = ?auto_94079 ?auto_94081 ) ) ( not ( = ?auto_94079 ?auto_94082 ) ) ( not ( = ?auto_94079 ?auto_94083 ) ) ( not ( = ?auto_94079 ?auto_94084 ) ) ( not ( = ?auto_94080 ?auto_94081 ) ) ( not ( = ?auto_94080 ?auto_94082 ) ) ( not ( = ?auto_94080 ?auto_94083 ) ) ( not ( = ?auto_94080 ?auto_94084 ) ) ( not ( = ?auto_94081 ?auto_94082 ) ) ( not ( = ?auto_94081 ?auto_94083 ) ) ( not ( = ?auto_94081 ?auto_94084 ) ) ( not ( = ?auto_94082 ?auto_94083 ) ) ( not ( = ?auto_94082 ?auto_94084 ) ) ( not ( = ?auto_94083 ?auto_94084 ) ) ( ON-TABLE ?auto_94084 ) ( ON ?auto_94083 ?auto_94084 ) ( ON ?auto_94082 ?auto_94083 ) ( ON ?auto_94081 ?auto_94082 ) ( ON ?auto_94080 ?auto_94081 ) ( ON ?auto_94079 ?auto_94080 ) ( CLEAR ?auto_94079 ) ( ON ?auto_94078 ?auto_94085 ) ( CLEAR ?auto_94078 ) ( HAND-EMPTY ) ( not ( = ?auto_94078 ?auto_94085 ) ) ( not ( = ?auto_94079 ?auto_94085 ) ) ( not ( = ?auto_94080 ?auto_94085 ) ) ( not ( = ?auto_94081 ?auto_94085 ) ) ( not ( = ?auto_94082 ?auto_94085 ) ) ( not ( = ?auto_94083 ?auto_94085 ) ) ( not ( = ?auto_94084 ?auto_94085 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_94078 ?auto_94085 )
      ( MAKE-7PILE ?auto_94078 ?auto_94079 ?auto_94080 ?auto_94081 ?auto_94082 ?auto_94083 ?auto_94084 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94086 - BLOCK
      ?auto_94087 - BLOCK
      ?auto_94088 - BLOCK
      ?auto_94089 - BLOCK
      ?auto_94090 - BLOCK
      ?auto_94091 - BLOCK
      ?auto_94092 - BLOCK
    )
    :vars
    (
      ?auto_94093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94086 ?auto_94087 ) ) ( not ( = ?auto_94086 ?auto_94088 ) ) ( not ( = ?auto_94086 ?auto_94089 ) ) ( not ( = ?auto_94086 ?auto_94090 ) ) ( not ( = ?auto_94086 ?auto_94091 ) ) ( not ( = ?auto_94086 ?auto_94092 ) ) ( not ( = ?auto_94087 ?auto_94088 ) ) ( not ( = ?auto_94087 ?auto_94089 ) ) ( not ( = ?auto_94087 ?auto_94090 ) ) ( not ( = ?auto_94087 ?auto_94091 ) ) ( not ( = ?auto_94087 ?auto_94092 ) ) ( not ( = ?auto_94088 ?auto_94089 ) ) ( not ( = ?auto_94088 ?auto_94090 ) ) ( not ( = ?auto_94088 ?auto_94091 ) ) ( not ( = ?auto_94088 ?auto_94092 ) ) ( not ( = ?auto_94089 ?auto_94090 ) ) ( not ( = ?auto_94089 ?auto_94091 ) ) ( not ( = ?auto_94089 ?auto_94092 ) ) ( not ( = ?auto_94090 ?auto_94091 ) ) ( not ( = ?auto_94090 ?auto_94092 ) ) ( not ( = ?auto_94091 ?auto_94092 ) ) ( ON-TABLE ?auto_94092 ) ( ON ?auto_94091 ?auto_94092 ) ( ON ?auto_94090 ?auto_94091 ) ( ON ?auto_94089 ?auto_94090 ) ( ON ?auto_94088 ?auto_94089 ) ( ON ?auto_94086 ?auto_94093 ) ( CLEAR ?auto_94086 ) ( not ( = ?auto_94086 ?auto_94093 ) ) ( not ( = ?auto_94087 ?auto_94093 ) ) ( not ( = ?auto_94088 ?auto_94093 ) ) ( not ( = ?auto_94089 ?auto_94093 ) ) ( not ( = ?auto_94090 ?auto_94093 ) ) ( not ( = ?auto_94091 ?auto_94093 ) ) ( not ( = ?auto_94092 ?auto_94093 ) ) ( HOLDING ?auto_94087 ) ( CLEAR ?auto_94088 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94092 ?auto_94091 ?auto_94090 ?auto_94089 ?auto_94088 ?auto_94087 )
      ( MAKE-7PILE ?auto_94086 ?auto_94087 ?auto_94088 ?auto_94089 ?auto_94090 ?auto_94091 ?auto_94092 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94094 - BLOCK
      ?auto_94095 - BLOCK
      ?auto_94096 - BLOCK
      ?auto_94097 - BLOCK
      ?auto_94098 - BLOCK
      ?auto_94099 - BLOCK
      ?auto_94100 - BLOCK
    )
    :vars
    (
      ?auto_94101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94094 ?auto_94095 ) ) ( not ( = ?auto_94094 ?auto_94096 ) ) ( not ( = ?auto_94094 ?auto_94097 ) ) ( not ( = ?auto_94094 ?auto_94098 ) ) ( not ( = ?auto_94094 ?auto_94099 ) ) ( not ( = ?auto_94094 ?auto_94100 ) ) ( not ( = ?auto_94095 ?auto_94096 ) ) ( not ( = ?auto_94095 ?auto_94097 ) ) ( not ( = ?auto_94095 ?auto_94098 ) ) ( not ( = ?auto_94095 ?auto_94099 ) ) ( not ( = ?auto_94095 ?auto_94100 ) ) ( not ( = ?auto_94096 ?auto_94097 ) ) ( not ( = ?auto_94096 ?auto_94098 ) ) ( not ( = ?auto_94096 ?auto_94099 ) ) ( not ( = ?auto_94096 ?auto_94100 ) ) ( not ( = ?auto_94097 ?auto_94098 ) ) ( not ( = ?auto_94097 ?auto_94099 ) ) ( not ( = ?auto_94097 ?auto_94100 ) ) ( not ( = ?auto_94098 ?auto_94099 ) ) ( not ( = ?auto_94098 ?auto_94100 ) ) ( not ( = ?auto_94099 ?auto_94100 ) ) ( ON-TABLE ?auto_94100 ) ( ON ?auto_94099 ?auto_94100 ) ( ON ?auto_94098 ?auto_94099 ) ( ON ?auto_94097 ?auto_94098 ) ( ON ?auto_94096 ?auto_94097 ) ( ON ?auto_94094 ?auto_94101 ) ( not ( = ?auto_94094 ?auto_94101 ) ) ( not ( = ?auto_94095 ?auto_94101 ) ) ( not ( = ?auto_94096 ?auto_94101 ) ) ( not ( = ?auto_94097 ?auto_94101 ) ) ( not ( = ?auto_94098 ?auto_94101 ) ) ( not ( = ?auto_94099 ?auto_94101 ) ) ( not ( = ?auto_94100 ?auto_94101 ) ) ( CLEAR ?auto_94096 ) ( ON ?auto_94095 ?auto_94094 ) ( CLEAR ?auto_94095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_94101 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94101 ?auto_94094 )
      ( MAKE-7PILE ?auto_94094 ?auto_94095 ?auto_94096 ?auto_94097 ?auto_94098 ?auto_94099 ?auto_94100 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94102 - BLOCK
      ?auto_94103 - BLOCK
      ?auto_94104 - BLOCK
      ?auto_94105 - BLOCK
      ?auto_94106 - BLOCK
      ?auto_94107 - BLOCK
      ?auto_94108 - BLOCK
    )
    :vars
    (
      ?auto_94109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94102 ?auto_94103 ) ) ( not ( = ?auto_94102 ?auto_94104 ) ) ( not ( = ?auto_94102 ?auto_94105 ) ) ( not ( = ?auto_94102 ?auto_94106 ) ) ( not ( = ?auto_94102 ?auto_94107 ) ) ( not ( = ?auto_94102 ?auto_94108 ) ) ( not ( = ?auto_94103 ?auto_94104 ) ) ( not ( = ?auto_94103 ?auto_94105 ) ) ( not ( = ?auto_94103 ?auto_94106 ) ) ( not ( = ?auto_94103 ?auto_94107 ) ) ( not ( = ?auto_94103 ?auto_94108 ) ) ( not ( = ?auto_94104 ?auto_94105 ) ) ( not ( = ?auto_94104 ?auto_94106 ) ) ( not ( = ?auto_94104 ?auto_94107 ) ) ( not ( = ?auto_94104 ?auto_94108 ) ) ( not ( = ?auto_94105 ?auto_94106 ) ) ( not ( = ?auto_94105 ?auto_94107 ) ) ( not ( = ?auto_94105 ?auto_94108 ) ) ( not ( = ?auto_94106 ?auto_94107 ) ) ( not ( = ?auto_94106 ?auto_94108 ) ) ( not ( = ?auto_94107 ?auto_94108 ) ) ( ON-TABLE ?auto_94108 ) ( ON ?auto_94107 ?auto_94108 ) ( ON ?auto_94106 ?auto_94107 ) ( ON ?auto_94105 ?auto_94106 ) ( ON ?auto_94102 ?auto_94109 ) ( not ( = ?auto_94102 ?auto_94109 ) ) ( not ( = ?auto_94103 ?auto_94109 ) ) ( not ( = ?auto_94104 ?auto_94109 ) ) ( not ( = ?auto_94105 ?auto_94109 ) ) ( not ( = ?auto_94106 ?auto_94109 ) ) ( not ( = ?auto_94107 ?auto_94109 ) ) ( not ( = ?auto_94108 ?auto_94109 ) ) ( ON ?auto_94103 ?auto_94102 ) ( CLEAR ?auto_94103 ) ( ON-TABLE ?auto_94109 ) ( HOLDING ?auto_94104 ) ( CLEAR ?auto_94105 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94108 ?auto_94107 ?auto_94106 ?auto_94105 ?auto_94104 )
      ( MAKE-7PILE ?auto_94102 ?auto_94103 ?auto_94104 ?auto_94105 ?auto_94106 ?auto_94107 ?auto_94108 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94110 - BLOCK
      ?auto_94111 - BLOCK
      ?auto_94112 - BLOCK
      ?auto_94113 - BLOCK
      ?auto_94114 - BLOCK
      ?auto_94115 - BLOCK
      ?auto_94116 - BLOCK
    )
    :vars
    (
      ?auto_94117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94110 ?auto_94111 ) ) ( not ( = ?auto_94110 ?auto_94112 ) ) ( not ( = ?auto_94110 ?auto_94113 ) ) ( not ( = ?auto_94110 ?auto_94114 ) ) ( not ( = ?auto_94110 ?auto_94115 ) ) ( not ( = ?auto_94110 ?auto_94116 ) ) ( not ( = ?auto_94111 ?auto_94112 ) ) ( not ( = ?auto_94111 ?auto_94113 ) ) ( not ( = ?auto_94111 ?auto_94114 ) ) ( not ( = ?auto_94111 ?auto_94115 ) ) ( not ( = ?auto_94111 ?auto_94116 ) ) ( not ( = ?auto_94112 ?auto_94113 ) ) ( not ( = ?auto_94112 ?auto_94114 ) ) ( not ( = ?auto_94112 ?auto_94115 ) ) ( not ( = ?auto_94112 ?auto_94116 ) ) ( not ( = ?auto_94113 ?auto_94114 ) ) ( not ( = ?auto_94113 ?auto_94115 ) ) ( not ( = ?auto_94113 ?auto_94116 ) ) ( not ( = ?auto_94114 ?auto_94115 ) ) ( not ( = ?auto_94114 ?auto_94116 ) ) ( not ( = ?auto_94115 ?auto_94116 ) ) ( ON-TABLE ?auto_94116 ) ( ON ?auto_94115 ?auto_94116 ) ( ON ?auto_94114 ?auto_94115 ) ( ON ?auto_94113 ?auto_94114 ) ( ON ?auto_94110 ?auto_94117 ) ( not ( = ?auto_94110 ?auto_94117 ) ) ( not ( = ?auto_94111 ?auto_94117 ) ) ( not ( = ?auto_94112 ?auto_94117 ) ) ( not ( = ?auto_94113 ?auto_94117 ) ) ( not ( = ?auto_94114 ?auto_94117 ) ) ( not ( = ?auto_94115 ?auto_94117 ) ) ( not ( = ?auto_94116 ?auto_94117 ) ) ( ON ?auto_94111 ?auto_94110 ) ( ON-TABLE ?auto_94117 ) ( CLEAR ?auto_94113 ) ( ON ?auto_94112 ?auto_94111 ) ( CLEAR ?auto_94112 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94117 ?auto_94110 ?auto_94111 )
      ( MAKE-7PILE ?auto_94110 ?auto_94111 ?auto_94112 ?auto_94113 ?auto_94114 ?auto_94115 ?auto_94116 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94118 - BLOCK
      ?auto_94119 - BLOCK
      ?auto_94120 - BLOCK
      ?auto_94121 - BLOCK
      ?auto_94122 - BLOCK
      ?auto_94123 - BLOCK
      ?auto_94124 - BLOCK
    )
    :vars
    (
      ?auto_94125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94118 ?auto_94119 ) ) ( not ( = ?auto_94118 ?auto_94120 ) ) ( not ( = ?auto_94118 ?auto_94121 ) ) ( not ( = ?auto_94118 ?auto_94122 ) ) ( not ( = ?auto_94118 ?auto_94123 ) ) ( not ( = ?auto_94118 ?auto_94124 ) ) ( not ( = ?auto_94119 ?auto_94120 ) ) ( not ( = ?auto_94119 ?auto_94121 ) ) ( not ( = ?auto_94119 ?auto_94122 ) ) ( not ( = ?auto_94119 ?auto_94123 ) ) ( not ( = ?auto_94119 ?auto_94124 ) ) ( not ( = ?auto_94120 ?auto_94121 ) ) ( not ( = ?auto_94120 ?auto_94122 ) ) ( not ( = ?auto_94120 ?auto_94123 ) ) ( not ( = ?auto_94120 ?auto_94124 ) ) ( not ( = ?auto_94121 ?auto_94122 ) ) ( not ( = ?auto_94121 ?auto_94123 ) ) ( not ( = ?auto_94121 ?auto_94124 ) ) ( not ( = ?auto_94122 ?auto_94123 ) ) ( not ( = ?auto_94122 ?auto_94124 ) ) ( not ( = ?auto_94123 ?auto_94124 ) ) ( ON-TABLE ?auto_94124 ) ( ON ?auto_94123 ?auto_94124 ) ( ON ?auto_94122 ?auto_94123 ) ( ON ?auto_94118 ?auto_94125 ) ( not ( = ?auto_94118 ?auto_94125 ) ) ( not ( = ?auto_94119 ?auto_94125 ) ) ( not ( = ?auto_94120 ?auto_94125 ) ) ( not ( = ?auto_94121 ?auto_94125 ) ) ( not ( = ?auto_94122 ?auto_94125 ) ) ( not ( = ?auto_94123 ?auto_94125 ) ) ( not ( = ?auto_94124 ?auto_94125 ) ) ( ON ?auto_94119 ?auto_94118 ) ( ON-TABLE ?auto_94125 ) ( ON ?auto_94120 ?auto_94119 ) ( CLEAR ?auto_94120 ) ( HOLDING ?auto_94121 ) ( CLEAR ?auto_94122 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94124 ?auto_94123 ?auto_94122 ?auto_94121 )
      ( MAKE-7PILE ?auto_94118 ?auto_94119 ?auto_94120 ?auto_94121 ?auto_94122 ?auto_94123 ?auto_94124 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94126 - BLOCK
      ?auto_94127 - BLOCK
      ?auto_94128 - BLOCK
      ?auto_94129 - BLOCK
      ?auto_94130 - BLOCK
      ?auto_94131 - BLOCK
      ?auto_94132 - BLOCK
    )
    :vars
    (
      ?auto_94133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94126 ?auto_94127 ) ) ( not ( = ?auto_94126 ?auto_94128 ) ) ( not ( = ?auto_94126 ?auto_94129 ) ) ( not ( = ?auto_94126 ?auto_94130 ) ) ( not ( = ?auto_94126 ?auto_94131 ) ) ( not ( = ?auto_94126 ?auto_94132 ) ) ( not ( = ?auto_94127 ?auto_94128 ) ) ( not ( = ?auto_94127 ?auto_94129 ) ) ( not ( = ?auto_94127 ?auto_94130 ) ) ( not ( = ?auto_94127 ?auto_94131 ) ) ( not ( = ?auto_94127 ?auto_94132 ) ) ( not ( = ?auto_94128 ?auto_94129 ) ) ( not ( = ?auto_94128 ?auto_94130 ) ) ( not ( = ?auto_94128 ?auto_94131 ) ) ( not ( = ?auto_94128 ?auto_94132 ) ) ( not ( = ?auto_94129 ?auto_94130 ) ) ( not ( = ?auto_94129 ?auto_94131 ) ) ( not ( = ?auto_94129 ?auto_94132 ) ) ( not ( = ?auto_94130 ?auto_94131 ) ) ( not ( = ?auto_94130 ?auto_94132 ) ) ( not ( = ?auto_94131 ?auto_94132 ) ) ( ON-TABLE ?auto_94132 ) ( ON ?auto_94131 ?auto_94132 ) ( ON ?auto_94130 ?auto_94131 ) ( ON ?auto_94126 ?auto_94133 ) ( not ( = ?auto_94126 ?auto_94133 ) ) ( not ( = ?auto_94127 ?auto_94133 ) ) ( not ( = ?auto_94128 ?auto_94133 ) ) ( not ( = ?auto_94129 ?auto_94133 ) ) ( not ( = ?auto_94130 ?auto_94133 ) ) ( not ( = ?auto_94131 ?auto_94133 ) ) ( not ( = ?auto_94132 ?auto_94133 ) ) ( ON ?auto_94127 ?auto_94126 ) ( ON-TABLE ?auto_94133 ) ( ON ?auto_94128 ?auto_94127 ) ( CLEAR ?auto_94130 ) ( ON ?auto_94129 ?auto_94128 ) ( CLEAR ?auto_94129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_94133 ?auto_94126 ?auto_94127 ?auto_94128 )
      ( MAKE-7PILE ?auto_94126 ?auto_94127 ?auto_94128 ?auto_94129 ?auto_94130 ?auto_94131 ?auto_94132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94134 - BLOCK
      ?auto_94135 - BLOCK
      ?auto_94136 - BLOCK
      ?auto_94137 - BLOCK
      ?auto_94138 - BLOCK
      ?auto_94139 - BLOCK
      ?auto_94140 - BLOCK
    )
    :vars
    (
      ?auto_94141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94134 ?auto_94135 ) ) ( not ( = ?auto_94134 ?auto_94136 ) ) ( not ( = ?auto_94134 ?auto_94137 ) ) ( not ( = ?auto_94134 ?auto_94138 ) ) ( not ( = ?auto_94134 ?auto_94139 ) ) ( not ( = ?auto_94134 ?auto_94140 ) ) ( not ( = ?auto_94135 ?auto_94136 ) ) ( not ( = ?auto_94135 ?auto_94137 ) ) ( not ( = ?auto_94135 ?auto_94138 ) ) ( not ( = ?auto_94135 ?auto_94139 ) ) ( not ( = ?auto_94135 ?auto_94140 ) ) ( not ( = ?auto_94136 ?auto_94137 ) ) ( not ( = ?auto_94136 ?auto_94138 ) ) ( not ( = ?auto_94136 ?auto_94139 ) ) ( not ( = ?auto_94136 ?auto_94140 ) ) ( not ( = ?auto_94137 ?auto_94138 ) ) ( not ( = ?auto_94137 ?auto_94139 ) ) ( not ( = ?auto_94137 ?auto_94140 ) ) ( not ( = ?auto_94138 ?auto_94139 ) ) ( not ( = ?auto_94138 ?auto_94140 ) ) ( not ( = ?auto_94139 ?auto_94140 ) ) ( ON-TABLE ?auto_94140 ) ( ON ?auto_94139 ?auto_94140 ) ( ON ?auto_94134 ?auto_94141 ) ( not ( = ?auto_94134 ?auto_94141 ) ) ( not ( = ?auto_94135 ?auto_94141 ) ) ( not ( = ?auto_94136 ?auto_94141 ) ) ( not ( = ?auto_94137 ?auto_94141 ) ) ( not ( = ?auto_94138 ?auto_94141 ) ) ( not ( = ?auto_94139 ?auto_94141 ) ) ( not ( = ?auto_94140 ?auto_94141 ) ) ( ON ?auto_94135 ?auto_94134 ) ( ON-TABLE ?auto_94141 ) ( ON ?auto_94136 ?auto_94135 ) ( ON ?auto_94137 ?auto_94136 ) ( CLEAR ?auto_94137 ) ( HOLDING ?auto_94138 ) ( CLEAR ?auto_94139 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_94140 ?auto_94139 ?auto_94138 )
      ( MAKE-7PILE ?auto_94134 ?auto_94135 ?auto_94136 ?auto_94137 ?auto_94138 ?auto_94139 ?auto_94140 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94142 - BLOCK
      ?auto_94143 - BLOCK
      ?auto_94144 - BLOCK
      ?auto_94145 - BLOCK
      ?auto_94146 - BLOCK
      ?auto_94147 - BLOCK
      ?auto_94148 - BLOCK
    )
    :vars
    (
      ?auto_94149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94142 ?auto_94143 ) ) ( not ( = ?auto_94142 ?auto_94144 ) ) ( not ( = ?auto_94142 ?auto_94145 ) ) ( not ( = ?auto_94142 ?auto_94146 ) ) ( not ( = ?auto_94142 ?auto_94147 ) ) ( not ( = ?auto_94142 ?auto_94148 ) ) ( not ( = ?auto_94143 ?auto_94144 ) ) ( not ( = ?auto_94143 ?auto_94145 ) ) ( not ( = ?auto_94143 ?auto_94146 ) ) ( not ( = ?auto_94143 ?auto_94147 ) ) ( not ( = ?auto_94143 ?auto_94148 ) ) ( not ( = ?auto_94144 ?auto_94145 ) ) ( not ( = ?auto_94144 ?auto_94146 ) ) ( not ( = ?auto_94144 ?auto_94147 ) ) ( not ( = ?auto_94144 ?auto_94148 ) ) ( not ( = ?auto_94145 ?auto_94146 ) ) ( not ( = ?auto_94145 ?auto_94147 ) ) ( not ( = ?auto_94145 ?auto_94148 ) ) ( not ( = ?auto_94146 ?auto_94147 ) ) ( not ( = ?auto_94146 ?auto_94148 ) ) ( not ( = ?auto_94147 ?auto_94148 ) ) ( ON-TABLE ?auto_94148 ) ( ON ?auto_94147 ?auto_94148 ) ( ON ?auto_94142 ?auto_94149 ) ( not ( = ?auto_94142 ?auto_94149 ) ) ( not ( = ?auto_94143 ?auto_94149 ) ) ( not ( = ?auto_94144 ?auto_94149 ) ) ( not ( = ?auto_94145 ?auto_94149 ) ) ( not ( = ?auto_94146 ?auto_94149 ) ) ( not ( = ?auto_94147 ?auto_94149 ) ) ( not ( = ?auto_94148 ?auto_94149 ) ) ( ON ?auto_94143 ?auto_94142 ) ( ON-TABLE ?auto_94149 ) ( ON ?auto_94144 ?auto_94143 ) ( ON ?auto_94145 ?auto_94144 ) ( CLEAR ?auto_94147 ) ( ON ?auto_94146 ?auto_94145 ) ( CLEAR ?auto_94146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_94149 ?auto_94142 ?auto_94143 ?auto_94144 ?auto_94145 )
      ( MAKE-7PILE ?auto_94142 ?auto_94143 ?auto_94144 ?auto_94145 ?auto_94146 ?auto_94147 ?auto_94148 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94150 - BLOCK
      ?auto_94151 - BLOCK
      ?auto_94152 - BLOCK
      ?auto_94153 - BLOCK
      ?auto_94154 - BLOCK
      ?auto_94155 - BLOCK
      ?auto_94156 - BLOCK
    )
    :vars
    (
      ?auto_94157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94150 ?auto_94151 ) ) ( not ( = ?auto_94150 ?auto_94152 ) ) ( not ( = ?auto_94150 ?auto_94153 ) ) ( not ( = ?auto_94150 ?auto_94154 ) ) ( not ( = ?auto_94150 ?auto_94155 ) ) ( not ( = ?auto_94150 ?auto_94156 ) ) ( not ( = ?auto_94151 ?auto_94152 ) ) ( not ( = ?auto_94151 ?auto_94153 ) ) ( not ( = ?auto_94151 ?auto_94154 ) ) ( not ( = ?auto_94151 ?auto_94155 ) ) ( not ( = ?auto_94151 ?auto_94156 ) ) ( not ( = ?auto_94152 ?auto_94153 ) ) ( not ( = ?auto_94152 ?auto_94154 ) ) ( not ( = ?auto_94152 ?auto_94155 ) ) ( not ( = ?auto_94152 ?auto_94156 ) ) ( not ( = ?auto_94153 ?auto_94154 ) ) ( not ( = ?auto_94153 ?auto_94155 ) ) ( not ( = ?auto_94153 ?auto_94156 ) ) ( not ( = ?auto_94154 ?auto_94155 ) ) ( not ( = ?auto_94154 ?auto_94156 ) ) ( not ( = ?auto_94155 ?auto_94156 ) ) ( ON-TABLE ?auto_94156 ) ( ON ?auto_94150 ?auto_94157 ) ( not ( = ?auto_94150 ?auto_94157 ) ) ( not ( = ?auto_94151 ?auto_94157 ) ) ( not ( = ?auto_94152 ?auto_94157 ) ) ( not ( = ?auto_94153 ?auto_94157 ) ) ( not ( = ?auto_94154 ?auto_94157 ) ) ( not ( = ?auto_94155 ?auto_94157 ) ) ( not ( = ?auto_94156 ?auto_94157 ) ) ( ON ?auto_94151 ?auto_94150 ) ( ON-TABLE ?auto_94157 ) ( ON ?auto_94152 ?auto_94151 ) ( ON ?auto_94153 ?auto_94152 ) ( ON ?auto_94154 ?auto_94153 ) ( CLEAR ?auto_94154 ) ( HOLDING ?auto_94155 ) ( CLEAR ?auto_94156 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_94156 ?auto_94155 )
      ( MAKE-7PILE ?auto_94150 ?auto_94151 ?auto_94152 ?auto_94153 ?auto_94154 ?auto_94155 ?auto_94156 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94158 - BLOCK
      ?auto_94159 - BLOCK
      ?auto_94160 - BLOCK
      ?auto_94161 - BLOCK
      ?auto_94162 - BLOCK
      ?auto_94163 - BLOCK
      ?auto_94164 - BLOCK
    )
    :vars
    (
      ?auto_94165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94158 ?auto_94159 ) ) ( not ( = ?auto_94158 ?auto_94160 ) ) ( not ( = ?auto_94158 ?auto_94161 ) ) ( not ( = ?auto_94158 ?auto_94162 ) ) ( not ( = ?auto_94158 ?auto_94163 ) ) ( not ( = ?auto_94158 ?auto_94164 ) ) ( not ( = ?auto_94159 ?auto_94160 ) ) ( not ( = ?auto_94159 ?auto_94161 ) ) ( not ( = ?auto_94159 ?auto_94162 ) ) ( not ( = ?auto_94159 ?auto_94163 ) ) ( not ( = ?auto_94159 ?auto_94164 ) ) ( not ( = ?auto_94160 ?auto_94161 ) ) ( not ( = ?auto_94160 ?auto_94162 ) ) ( not ( = ?auto_94160 ?auto_94163 ) ) ( not ( = ?auto_94160 ?auto_94164 ) ) ( not ( = ?auto_94161 ?auto_94162 ) ) ( not ( = ?auto_94161 ?auto_94163 ) ) ( not ( = ?auto_94161 ?auto_94164 ) ) ( not ( = ?auto_94162 ?auto_94163 ) ) ( not ( = ?auto_94162 ?auto_94164 ) ) ( not ( = ?auto_94163 ?auto_94164 ) ) ( ON-TABLE ?auto_94164 ) ( ON ?auto_94158 ?auto_94165 ) ( not ( = ?auto_94158 ?auto_94165 ) ) ( not ( = ?auto_94159 ?auto_94165 ) ) ( not ( = ?auto_94160 ?auto_94165 ) ) ( not ( = ?auto_94161 ?auto_94165 ) ) ( not ( = ?auto_94162 ?auto_94165 ) ) ( not ( = ?auto_94163 ?auto_94165 ) ) ( not ( = ?auto_94164 ?auto_94165 ) ) ( ON ?auto_94159 ?auto_94158 ) ( ON-TABLE ?auto_94165 ) ( ON ?auto_94160 ?auto_94159 ) ( ON ?auto_94161 ?auto_94160 ) ( ON ?auto_94162 ?auto_94161 ) ( CLEAR ?auto_94164 ) ( ON ?auto_94163 ?auto_94162 ) ( CLEAR ?auto_94163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_94165 ?auto_94158 ?auto_94159 ?auto_94160 ?auto_94161 ?auto_94162 )
      ( MAKE-7PILE ?auto_94158 ?auto_94159 ?auto_94160 ?auto_94161 ?auto_94162 ?auto_94163 ?auto_94164 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94166 - BLOCK
      ?auto_94167 - BLOCK
      ?auto_94168 - BLOCK
      ?auto_94169 - BLOCK
      ?auto_94170 - BLOCK
      ?auto_94171 - BLOCK
      ?auto_94172 - BLOCK
    )
    :vars
    (
      ?auto_94173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94166 ?auto_94167 ) ) ( not ( = ?auto_94166 ?auto_94168 ) ) ( not ( = ?auto_94166 ?auto_94169 ) ) ( not ( = ?auto_94166 ?auto_94170 ) ) ( not ( = ?auto_94166 ?auto_94171 ) ) ( not ( = ?auto_94166 ?auto_94172 ) ) ( not ( = ?auto_94167 ?auto_94168 ) ) ( not ( = ?auto_94167 ?auto_94169 ) ) ( not ( = ?auto_94167 ?auto_94170 ) ) ( not ( = ?auto_94167 ?auto_94171 ) ) ( not ( = ?auto_94167 ?auto_94172 ) ) ( not ( = ?auto_94168 ?auto_94169 ) ) ( not ( = ?auto_94168 ?auto_94170 ) ) ( not ( = ?auto_94168 ?auto_94171 ) ) ( not ( = ?auto_94168 ?auto_94172 ) ) ( not ( = ?auto_94169 ?auto_94170 ) ) ( not ( = ?auto_94169 ?auto_94171 ) ) ( not ( = ?auto_94169 ?auto_94172 ) ) ( not ( = ?auto_94170 ?auto_94171 ) ) ( not ( = ?auto_94170 ?auto_94172 ) ) ( not ( = ?auto_94171 ?auto_94172 ) ) ( ON ?auto_94166 ?auto_94173 ) ( not ( = ?auto_94166 ?auto_94173 ) ) ( not ( = ?auto_94167 ?auto_94173 ) ) ( not ( = ?auto_94168 ?auto_94173 ) ) ( not ( = ?auto_94169 ?auto_94173 ) ) ( not ( = ?auto_94170 ?auto_94173 ) ) ( not ( = ?auto_94171 ?auto_94173 ) ) ( not ( = ?auto_94172 ?auto_94173 ) ) ( ON ?auto_94167 ?auto_94166 ) ( ON-TABLE ?auto_94173 ) ( ON ?auto_94168 ?auto_94167 ) ( ON ?auto_94169 ?auto_94168 ) ( ON ?auto_94170 ?auto_94169 ) ( ON ?auto_94171 ?auto_94170 ) ( CLEAR ?auto_94171 ) ( HOLDING ?auto_94172 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_94172 )
      ( MAKE-7PILE ?auto_94166 ?auto_94167 ?auto_94168 ?auto_94169 ?auto_94170 ?auto_94171 ?auto_94172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_94174 - BLOCK
      ?auto_94175 - BLOCK
      ?auto_94176 - BLOCK
      ?auto_94177 - BLOCK
      ?auto_94178 - BLOCK
      ?auto_94179 - BLOCK
      ?auto_94180 - BLOCK
    )
    :vars
    (
      ?auto_94181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_94174 ?auto_94175 ) ) ( not ( = ?auto_94174 ?auto_94176 ) ) ( not ( = ?auto_94174 ?auto_94177 ) ) ( not ( = ?auto_94174 ?auto_94178 ) ) ( not ( = ?auto_94174 ?auto_94179 ) ) ( not ( = ?auto_94174 ?auto_94180 ) ) ( not ( = ?auto_94175 ?auto_94176 ) ) ( not ( = ?auto_94175 ?auto_94177 ) ) ( not ( = ?auto_94175 ?auto_94178 ) ) ( not ( = ?auto_94175 ?auto_94179 ) ) ( not ( = ?auto_94175 ?auto_94180 ) ) ( not ( = ?auto_94176 ?auto_94177 ) ) ( not ( = ?auto_94176 ?auto_94178 ) ) ( not ( = ?auto_94176 ?auto_94179 ) ) ( not ( = ?auto_94176 ?auto_94180 ) ) ( not ( = ?auto_94177 ?auto_94178 ) ) ( not ( = ?auto_94177 ?auto_94179 ) ) ( not ( = ?auto_94177 ?auto_94180 ) ) ( not ( = ?auto_94178 ?auto_94179 ) ) ( not ( = ?auto_94178 ?auto_94180 ) ) ( not ( = ?auto_94179 ?auto_94180 ) ) ( ON ?auto_94174 ?auto_94181 ) ( not ( = ?auto_94174 ?auto_94181 ) ) ( not ( = ?auto_94175 ?auto_94181 ) ) ( not ( = ?auto_94176 ?auto_94181 ) ) ( not ( = ?auto_94177 ?auto_94181 ) ) ( not ( = ?auto_94178 ?auto_94181 ) ) ( not ( = ?auto_94179 ?auto_94181 ) ) ( not ( = ?auto_94180 ?auto_94181 ) ) ( ON ?auto_94175 ?auto_94174 ) ( ON-TABLE ?auto_94181 ) ( ON ?auto_94176 ?auto_94175 ) ( ON ?auto_94177 ?auto_94176 ) ( ON ?auto_94178 ?auto_94177 ) ( ON ?auto_94179 ?auto_94178 ) ( ON ?auto_94180 ?auto_94179 ) ( CLEAR ?auto_94180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_94181 ?auto_94174 ?auto_94175 ?auto_94176 ?auto_94177 ?auto_94178 ?auto_94179 )
      ( MAKE-7PILE ?auto_94174 ?auto_94175 ?auto_94176 ?auto_94177 ?auto_94178 ?auto_94179 ?auto_94180 ) )
  )

)

