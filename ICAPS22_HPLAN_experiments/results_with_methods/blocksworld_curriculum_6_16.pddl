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
      ?auto_16649 - BLOCK
    )
    :vars
    (
      ?auto_16650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16649 ?auto_16650 ) ( CLEAR ?auto_16649 ) ( HAND-EMPTY ) ( not ( = ?auto_16649 ?auto_16650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16649 ?auto_16650 )
      ( !PUTDOWN ?auto_16649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16652 - BLOCK
    )
    :vars
    (
      ?auto_16653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16652 ?auto_16653 ) ( CLEAR ?auto_16652 ) ( HAND-EMPTY ) ( not ( = ?auto_16652 ?auto_16653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16652 ?auto_16653 )
      ( !PUTDOWN ?auto_16652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16656 - BLOCK
      ?auto_16657 - BLOCK
    )
    :vars
    (
      ?auto_16658 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16656 ) ( ON ?auto_16657 ?auto_16658 ) ( CLEAR ?auto_16657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16656 ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16658 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16657 ?auto_16658 )
      ( !STACK ?auto_16657 ?auto_16656 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16661 - BLOCK
      ?auto_16662 - BLOCK
    )
    :vars
    (
      ?auto_16663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16661 ) ( ON ?auto_16662 ?auto_16663 ) ( CLEAR ?auto_16662 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16661 ) ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16662 ?auto_16663 )
      ( !STACK ?auto_16662 ?auto_16661 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16666 - BLOCK
      ?auto_16667 - BLOCK
    )
    :vars
    (
      ?auto_16668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16667 ?auto_16668 ) ( not ( = ?auto_16666 ?auto_16667 ) ) ( not ( = ?auto_16666 ?auto_16668 ) ) ( not ( = ?auto_16667 ?auto_16668 ) ) ( ON ?auto_16666 ?auto_16667 ) ( CLEAR ?auto_16666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16666 )
      ( MAKE-2PILE ?auto_16666 ?auto_16667 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16671 - BLOCK
      ?auto_16672 - BLOCK
    )
    :vars
    (
      ?auto_16673 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16672 ?auto_16673 ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( not ( = ?auto_16671 ?auto_16673 ) ) ( not ( = ?auto_16672 ?auto_16673 ) ) ( ON ?auto_16671 ?auto_16672 ) ( CLEAR ?auto_16671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16671 )
      ( MAKE-2PILE ?auto_16671 ?auto_16672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16677 - BLOCK
      ?auto_16678 - BLOCK
      ?auto_16679 - BLOCK
    )
    :vars
    (
      ?auto_16680 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16678 ) ( ON ?auto_16679 ?auto_16680 ) ( CLEAR ?auto_16679 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16677 ) ( ON ?auto_16678 ?auto_16677 ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16679 ) ) ( not ( = ?auto_16677 ?auto_16680 ) ) ( not ( = ?auto_16678 ?auto_16679 ) ) ( not ( = ?auto_16678 ?auto_16680 ) ) ( not ( = ?auto_16679 ?auto_16680 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16679 ?auto_16680 )
      ( !STACK ?auto_16679 ?auto_16678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16684 - BLOCK
      ?auto_16685 - BLOCK
      ?auto_16686 - BLOCK
    )
    :vars
    (
      ?auto_16687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16685 ) ( ON ?auto_16686 ?auto_16687 ) ( CLEAR ?auto_16686 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16684 ) ( ON ?auto_16685 ?auto_16684 ) ( not ( = ?auto_16684 ?auto_16685 ) ) ( not ( = ?auto_16684 ?auto_16686 ) ) ( not ( = ?auto_16684 ?auto_16687 ) ) ( not ( = ?auto_16685 ?auto_16686 ) ) ( not ( = ?auto_16685 ?auto_16687 ) ) ( not ( = ?auto_16686 ?auto_16687 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16686 ?auto_16687 )
      ( !STACK ?auto_16686 ?auto_16685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16691 - BLOCK
      ?auto_16692 - BLOCK
      ?auto_16693 - BLOCK
    )
    :vars
    (
      ?auto_16694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16693 ?auto_16694 ) ( ON-TABLE ?auto_16691 ) ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( CLEAR ?auto_16691 ) ( ON ?auto_16692 ?auto_16693 ) ( CLEAR ?auto_16692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16691 ?auto_16692 )
      ( MAKE-3PILE ?auto_16691 ?auto_16692 ?auto_16693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16698 - BLOCK
      ?auto_16699 - BLOCK
      ?auto_16700 - BLOCK
    )
    :vars
    (
      ?auto_16701 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16700 ?auto_16701 ) ( ON-TABLE ?auto_16698 ) ( not ( = ?auto_16698 ?auto_16699 ) ) ( not ( = ?auto_16698 ?auto_16700 ) ) ( not ( = ?auto_16698 ?auto_16701 ) ) ( not ( = ?auto_16699 ?auto_16700 ) ) ( not ( = ?auto_16699 ?auto_16701 ) ) ( not ( = ?auto_16700 ?auto_16701 ) ) ( CLEAR ?auto_16698 ) ( ON ?auto_16699 ?auto_16700 ) ( CLEAR ?auto_16699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16698 ?auto_16699 )
      ( MAKE-3PILE ?auto_16698 ?auto_16699 ?auto_16700 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16705 - BLOCK
      ?auto_16706 - BLOCK
      ?auto_16707 - BLOCK
    )
    :vars
    (
      ?auto_16708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16707 ?auto_16708 ) ( not ( = ?auto_16705 ?auto_16706 ) ) ( not ( = ?auto_16705 ?auto_16707 ) ) ( not ( = ?auto_16705 ?auto_16708 ) ) ( not ( = ?auto_16706 ?auto_16707 ) ) ( not ( = ?auto_16706 ?auto_16708 ) ) ( not ( = ?auto_16707 ?auto_16708 ) ) ( ON ?auto_16706 ?auto_16707 ) ( ON ?auto_16705 ?auto_16706 ) ( CLEAR ?auto_16705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16705 )
      ( MAKE-3PILE ?auto_16705 ?auto_16706 ?auto_16707 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16712 - BLOCK
      ?auto_16713 - BLOCK
      ?auto_16714 - BLOCK
    )
    :vars
    (
      ?auto_16715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16714 ?auto_16715 ) ( not ( = ?auto_16712 ?auto_16713 ) ) ( not ( = ?auto_16712 ?auto_16714 ) ) ( not ( = ?auto_16712 ?auto_16715 ) ) ( not ( = ?auto_16713 ?auto_16714 ) ) ( not ( = ?auto_16713 ?auto_16715 ) ) ( not ( = ?auto_16714 ?auto_16715 ) ) ( ON ?auto_16713 ?auto_16714 ) ( ON ?auto_16712 ?auto_16713 ) ( CLEAR ?auto_16712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16712 )
      ( MAKE-3PILE ?auto_16712 ?auto_16713 ?auto_16714 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16720 - BLOCK
      ?auto_16721 - BLOCK
      ?auto_16722 - BLOCK
      ?auto_16723 - BLOCK
    )
    :vars
    (
      ?auto_16724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16722 ) ( ON ?auto_16723 ?auto_16724 ) ( CLEAR ?auto_16723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16720 ) ( ON ?auto_16721 ?auto_16720 ) ( ON ?auto_16722 ?auto_16721 ) ( not ( = ?auto_16720 ?auto_16721 ) ) ( not ( = ?auto_16720 ?auto_16722 ) ) ( not ( = ?auto_16720 ?auto_16723 ) ) ( not ( = ?auto_16720 ?auto_16724 ) ) ( not ( = ?auto_16721 ?auto_16722 ) ) ( not ( = ?auto_16721 ?auto_16723 ) ) ( not ( = ?auto_16721 ?auto_16724 ) ) ( not ( = ?auto_16722 ?auto_16723 ) ) ( not ( = ?auto_16722 ?auto_16724 ) ) ( not ( = ?auto_16723 ?auto_16724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16723 ?auto_16724 )
      ( !STACK ?auto_16723 ?auto_16722 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16729 - BLOCK
      ?auto_16730 - BLOCK
      ?auto_16731 - BLOCK
      ?auto_16732 - BLOCK
    )
    :vars
    (
      ?auto_16733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16731 ) ( ON ?auto_16732 ?auto_16733 ) ( CLEAR ?auto_16732 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16729 ) ( ON ?auto_16730 ?auto_16729 ) ( ON ?auto_16731 ?auto_16730 ) ( not ( = ?auto_16729 ?auto_16730 ) ) ( not ( = ?auto_16729 ?auto_16731 ) ) ( not ( = ?auto_16729 ?auto_16732 ) ) ( not ( = ?auto_16729 ?auto_16733 ) ) ( not ( = ?auto_16730 ?auto_16731 ) ) ( not ( = ?auto_16730 ?auto_16732 ) ) ( not ( = ?auto_16730 ?auto_16733 ) ) ( not ( = ?auto_16731 ?auto_16732 ) ) ( not ( = ?auto_16731 ?auto_16733 ) ) ( not ( = ?auto_16732 ?auto_16733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16732 ?auto_16733 )
      ( !STACK ?auto_16732 ?auto_16731 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16738 - BLOCK
      ?auto_16739 - BLOCK
      ?auto_16740 - BLOCK
      ?auto_16741 - BLOCK
    )
    :vars
    (
      ?auto_16742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16741 ?auto_16742 ) ( ON-TABLE ?auto_16738 ) ( ON ?auto_16739 ?auto_16738 ) ( not ( = ?auto_16738 ?auto_16739 ) ) ( not ( = ?auto_16738 ?auto_16740 ) ) ( not ( = ?auto_16738 ?auto_16741 ) ) ( not ( = ?auto_16738 ?auto_16742 ) ) ( not ( = ?auto_16739 ?auto_16740 ) ) ( not ( = ?auto_16739 ?auto_16741 ) ) ( not ( = ?auto_16739 ?auto_16742 ) ) ( not ( = ?auto_16740 ?auto_16741 ) ) ( not ( = ?auto_16740 ?auto_16742 ) ) ( not ( = ?auto_16741 ?auto_16742 ) ) ( CLEAR ?auto_16739 ) ( ON ?auto_16740 ?auto_16741 ) ( CLEAR ?auto_16740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16738 ?auto_16739 ?auto_16740 )
      ( MAKE-4PILE ?auto_16738 ?auto_16739 ?auto_16740 ?auto_16741 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16747 - BLOCK
      ?auto_16748 - BLOCK
      ?auto_16749 - BLOCK
      ?auto_16750 - BLOCK
    )
    :vars
    (
      ?auto_16751 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16750 ?auto_16751 ) ( ON-TABLE ?auto_16747 ) ( ON ?auto_16748 ?auto_16747 ) ( not ( = ?auto_16747 ?auto_16748 ) ) ( not ( = ?auto_16747 ?auto_16749 ) ) ( not ( = ?auto_16747 ?auto_16750 ) ) ( not ( = ?auto_16747 ?auto_16751 ) ) ( not ( = ?auto_16748 ?auto_16749 ) ) ( not ( = ?auto_16748 ?auto_16750 ) ) ( not ( = ?auto_16748 ?auto_16751 ) ) ( not ( = ?auto_16749 ?auto_16750 ) ) ( not ( = ?auto_16749 ?auto_16751 ) ) ( not ( = ?auto_16750 ?auto_16751 ) ) ( CLEAR ?auto_16748 ) ( ON ?auto_16749 ?auto_16750 ) ( CLEAR ?auto_16749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16747 ?auto_16748 ?auto_16749 )
      ( MAKE-4PILE ?auto_16747 ?auto_16748 ?auto_16749 ?auto_16750 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16756 - BLOCK
      ?auto_16757 - BLOCK
      ?auto_16758 - BLOCK
      ?auto_16759 - BLOCK
    )
    :vars
    (
      ?auto_16760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16759 ?auto_16760 ) ( ON-TABLE ?auto_16756 ) ( not ( = ?auto_16756 ?auto_16757 ) ) ( not ( = ?auto_16756 ?auto_16758 ) ) ( not ( = ?auto_16756 ?auto_16759 ) ) ( not ( = ?auto_16756 ?auto_16760 ) ) ( not ( = ?auto_16757 ?auto_16758 ) ) ( not ( = ?auto_16757 ?auto_16759 ) ) ( not ( = ?auto_16757 ?auto_16760 ) ) ( not ( = ?auto_16758 ?auto_16759 ) ) ( not ( = ?auto_16758 ?auto_16760 ) ) ( not ( = ?auto_16759 ?auto_16760 ) ) ( ON ?auto_16758 ?auto_16759 ) ( CLEAR ?auto_16756 ) ( ON ?auto_16757 ?auto_16758 ) ( CLEAR ?auto_16757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16756 ?auto_16757 )
      ( MAKE-4PILE ?auto_16756 ?auto_16757 ?auto_16758 ?auto_16759 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16765 - BLOCK
      ?auto_16766 - BLOCK
      ?auto_16767 - BLOCK
      ?auto_16768 - BLOCK
    )
    :vars
    (
      ?auto_16769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16768 ?auto_16769 ) ( ON-TABLE ?auto_16765 ) ( not ( = ?auto_16765 ?auto_16766 ) ) ( not ( = ?auto_16765 ?auto_16767 ) ) ( not ( = ?auto_16765 ?auto_16768 ) ) ( not ( = ?auto_16765 ?auto_16769 ) ) ( not ( = ?auto_16766 ?auto_16767 ) ) ( not ( = ?auto_16766 ?auto_16768 ) ) ( not ( = ?auto_16766 ?auto_16769 ) ) ( not ( = ?auto_16767 ?auto_16768 ) ) ( not ( = ?auto_16767 ?auto_16769 ) ) ( not ( = ?auto_16768 ?auto_16769 ) ) ( ON ?auto_16767 ?auto_16768 ) ( CLEAR ?auto_16765 ) ( ON ?auto_16766 ?auto_16767 ) ( CLEAR ?auto_16766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16765 ?auto_16766 )
      ( MAKE-4PILE ?auto_16765 ?auto_16766 ?auto_16767 ?auto_16768 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16774 - BLOCK
      ?auto_16775 - BLOCK
      ?auto_16776 - BLOCK
      ?auto_16777 - BLOCK
    )
    :vars
    (
      ?auto_16778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16777 ?auto_16778 ) ( not ( = ?auto_16774 ?auto_16775 ) ) ( not ( = ?auto_16774 ?auto_16776 ) ) ( not ( = ?auto_16774 ?auto_16777 ) ) ( not ( = ?auto_16774 ?auto_16778 ) ) ( not ( = ?auto_16775 ?auto_16776 ) ) ( not ( = ?auto_16775 ?auto_16777 ) ) ( not ( = ?auto_16775 ?auto_16778 ) ) ( not ( = ?auto_16776 ?auto_16777 ) ) ( not ( = ?auto_16776 ?auto_16778 ) ) ( not ( = ?auto_16777 ?auto_16778 ) ) ( ON ?auto_16776 ?auto_16777 ) ( ON ?auto_16775 ?auto_16776 ) ( ON ?auto_16774 ?auto_16775 ) ( CLEAR ?auto_16774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16774 )
      ( MAKE-4PILE ?auto_16774 ?auto_16775 ?auto_16776 ?auto_16777 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16783 - BLOCK
      ?auto_16784 - BLOCK
      ?auto_16785 - BLOCK
      ?auto_16786 - BLOCK
    )
    :vars
    (
      ?auto_16787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16786 ?auto_16787 ) ( not ( = ?auto_16783 ?auto_16784 ) ) ( not ( = ?auto_16783 ?auto_16785 ) ) ( not ( = ?auto_16783 ?auto_16786 ) ) ( not ( = ?auto_16783 ?auto_16787 ) ) ( not ( = ?auto_16784 ?auto_16785 ) ) ( not ( = ?auto_16784 ?auto_16786 ) ) ( not ( = ?auto_16784 ?auto_16787 ) ) ( not ( = ?auto_16785 ?auto_16786 ) ) ( not ( = ?auto_16785 ?auto_16787 ) ) ( not ( = ?auto_16786 ?auto_16787 ) ) ( ON ?auto_16785 ?auto_16786 ) ( ON ?auto_16784 ?auto_16785 ) ( ON ?auto_16783 ?auto_16784 ) ( CLEAR ?auto_16783 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16783 )
      ( MAKE-4PILE ?auto_16783 ?auto_16784 ?auto_16785 ?auto_16786 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16793 - BLOCK
      ?auto_16794 - BLOCK
      ?auto_16795 - BLOCK
      ?auto_16796 - BLOCK
      ?auto_16797 - BLOCK
    )
    :vars
    (
      ?auto_16798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16796 ) ( ON ?auto_16797 ?auto_16798 ) ( CLEAR ?auto_16797 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16793 ) ( ON ?auto_16794 ?auto_16793 ) ( ON ?auto_16795 ?auto_16794 ) ( ON ?auto_16796 ?auto_16795 ) ( not ( = ?auto_16793 ?auto_16794 ) ) ( not ( = ?auto_16793 ?auto_16795 ) ) ( not ( = ?auto_16793 ?auto_16796 ) ) ( not ( = ?auto_16793 ?auto_16797 ) ) ( not ( = ?auto_16793 ?auto_16798 ) ) ( not ( = ?auto_16794 ?auto_16795 ) ) ( not ( = ?auto_16794 ?auto_16796 ) ) ( not ( = ?auto_16794 ?auto_16797 ) ) ( not ( = ?auto_16794 ?auto_16798 ) ) ( not ( = ?auto_16795 ?auto_16796 ) ) ( not ( = ?auto_16795 ?auto_16797 ) ) ( not ( = ?auto_16795 ?auto_16798 ) ) ( not ( = ?auto_16796 ?auto_16797 ) ) ( not ( = ?auto_16796 ?auto_16798 ) ) ( not ( = ?auto_16797 ?auto_16798 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16797 ?auto_16798 )
      ( !STACK ?auto_16797 ?auto_16796 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16804 - BLOCK
      ?auto_16805 - BLOCK
      ?auto_16806 - BLOCK
      ?auto_16807 - BLOCK
      ?auto_16808 - BLOCK
    )
    :vars
    (
      ?auto_16809 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16807 ) ( ON ?auto_16808 ?auto_16809 ) ( CLEAR ?auto_16808 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16804 ) ( ON ?auto_16805 ?auto_16804 ) ( ON ?auto_16806 ?auto_16805 ) ( ON ?auto_16807 ?auto_16806 ) ( not ( = ?auto_16804 ?auto_16805 ) ) ( not ( = ?auto_16804 ?auto_16806 ) ) ( not ( = ?auto_16804 ?auto_16807 ) ) ( not ( = ?auto_16804 ?auto_16808 ) ) ( not ( = ?auto_16804 ?auto_16809 ) ) ( not ( = ?auto_16805 ?auto_16806 ) ) ( not ( = ?auto_16805 ?auto_16807 ) ) ( not ( = ?auto_16805 ?auto_16808 ) ) ( not ( = ?auto_16805 ?auto_16809 ) ) ( not ( = ?auto_16806 ?auto_16807 ) ) ( not ( = ?auto_16806 ?auto_16808 ) ) ( not ( = ?auto_16806 ?auto_16809 ) ) ( not ( = ?auto_16807 ?auto_16808 ) ) ( not ( = ?auto_16807 ?auto_16809 ) ) ( not ( = ?auto_16808 ?auto_16809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16808 ?auto_16809 )
      ( !STACK ?auto_16808 ?auto_16807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16815 - BLOCK
      ?auto_16816 - BLOCK
      ?auto_16817 - BLOCK
      ?auto_16818 - BLOCK
      ?auto_16819 - BLOCK
    )
    :vars
    (
      ?auto_16820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16819 ?auto_16820 ) ( ON-TABLE ?auto_16815 ) ( ON ?auto_16816 ?auto_16815 ) ( ON ?auto_16817 ?auto_16816 ) ( not ( = ?auto_16815 ?auto_16816 ) ) ( not ( = ?auto_16815 ?auto_16817 ) ) ( not ( = ?auto_16815 ?auto_16818 ) ) ( not ( = ?auto_16815 ?auto_16819 ) ) ( not ( = ?auto_16815 ?auto_16820 ) ) ( not ( = ?auto_16816 ?auto_16817 ) ) ( not ( = ?auto_16816 ?auto_16818 ) ) ( not ( = ?auto_16816 ?auto_16819 ) ) ( not ( = ?auto_16816 ?auto_16820 ) ) ( not ( = ?auto_16817 ?auto_16818 ) ) ( not ( = ?auto_16817 ?auto_16819 ) ) ( not ( = ?auto_16817 ?auto_16820 ) ) ( not ( = ?auto_16818 ?auto_16819 ) ) ( not ( = ?auto_16818 ?auto_16820 ) ) ( not ( = ?auto_16819 ?auto_16820 ) ) ( CLEAR ?auto_16817 ) ( ON ?auto_16818 ?auto_16819 ) ( CLEAR ?auto_16818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 )
      ( MAKE-5PILE ?auto_16815 ?auto_16816 ?auto_16817 ?auto_16818 ?auto_16819 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16826 - BLOCK
      ?auto_16827 - BLOCK
      ?auto_16828 - BLOCK
      ?auto_16829 - BLOCK
      ?auto_16830 - BLOCK
    )
    :vars
    (
      ?auto_16831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16830 ?auto_16831 ) ( ON-TABLE ?auto_16826 ) ( ON ?auto_16827 ?auto_16826 ) ( ON ?auto_16828 ?auto_16827 ) ( not ( = ?auto_16826 ?auto_16827 ) ) ( not ( = ?auto_16826 ?auto_16828 ) ) ( not ( = ?auto_16826 ?auto_16829 ) ) ( not ( = ?auto_16826 ?auto_16830 ) ) ( not ( = ?auto_16826 ?auto_16831 ) ) ( not ( = ?auto_16827 ?auto_16828 ) ) ( not ( = ?auto_16827 ?auto_16829 ) ) ( not ( = ?auto_16827 ?auto_16830 ) ) ( not ( = ?auto_16827 ?auto_16831 ) ) ( not ( = ?auto_16828 ?auto_16829 ) ) ( not ( = ?auto_16828 ?auto_16830 ) ) ( not ( = ?auto_16828 ?auto_16831 ) ) ( not ( = ?auto_16829 ?auto_16830 ) ) ( not ( = ?auto_16829 ?auto_16831 ) ) ( not ( = ?auto_16830 ?auto_16831 ) ) ( CLEAR ?auto_16828 ) ( ON ?auto_16829 ?auto_16830 ) ( CLEAR ?auto_16829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 )
      ( MAKE-5PILE ?auto_16826 ?auto_16827 ?auto_16828 ?auto_16829 ?auto_16830 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16837 - BLOCK
      ?auto_16838 - BLOCK
      ?auto_16839 - BLOCK
      ?auto_16840 - BLOCK
      ?auto_16841 - BLOCK
    )
    :vars
    (
      ?auto_16842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16841 ?auto_16842 ) ( ON-TABLE ?auto_16837 ) ( ON ?auto_16838 ?auto_16837 ) ( not ( = ?auto_16837 ?auto_16838 ) ) ( not ( = ?auto_16837 ?auto_16839 ) ) ( not ( = ?auto_16837 ?auto_16840 ) ) ( not ( = ?auto_16837 ?auto_16841 ) ) ( not ( = ?auto_16837 ?auto_16842 ) ) ( not ( = ?auto_16838 ?auto_16839 ) ) ( not ( = ?auto_16838 ?auto_16840 ) ) ( not ( = ?auto_16838 ?auto_16841 ) ) ( not ( = ?auto_16838 ?auto_16842 ) ) ( not ( = ?auto_16839 ?auto_16840 ) ) ( not ( = ?auto_16839 ?auto_16841 ) ) ( not ( = ?auto_16839 ?auto_16842 ) ) ( not ( = ?auto_16840 ?auto_16841 ) ) ( not ( = ?auto_16840 ?auto_16842 ) ) ( not ( = ?auto_16841 ?auto_16842 ) ) ( ON ?auto_16840 ?auto_16841 ) ( CLEAR ?auto_16838 ) ( ON ?auto_16839 ?auto_16840 ) ( CLEAR ?auto_16839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16837 ?auto_16838 ?auto_16839 )
      ( MAKE-5PILE ?auto_16837 ?auto_16838 ?auto_16839 ?auto_16840 ?auto_16841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16848 - BLOCK
      ?auto_16849 - BLOCK
      ?auto_16850 - BLOCK
      ?auto_16851 - BLOCK
      ?auto_16852 - BLOCK
    )
    :vars
    (
      ?auto_16853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16852 ?auto_16853 ) ( ON-TABLE ?auto_16848 ) ( ON ?auto_16849 ?auto_16848 ) ( not ( = ?auto_16848 ?auto_16849 ) ) ( not ( = ?auto_16848 ?auto_16850 ) ) ( not ( = ?auto_16848 ?auto_16851 ) ) ( not ( = ?auto_16848 ?auto_16852 ) ) ( not ( = ?auto_16848 ?auto_16853 ) ) ( not ( = ?auto_16849 ?auto_16850 ) ) ( not ( = ?auto_16849 ?auto_16851 ) ) ( not ( = ?auto_16849 ?auto_16852 ) ) ( not ( = ?auto_16849 ?auto_16853 ) ) ( not ( = ?auto_16850 ?auto_16851 ) ) ( not ( = ?auto_16850 ?auto_16852 ) ) ( not ( = ?auto_16850 ?auto_16853 ) ) ( not ( = ?auto_16851 ?auto_16852 ) ) ( not ( = ?auto_16851 ?auto_16853 ) ) ( not ( = ?auto_16852 ?auto_16853 ) ) ( ON ?auto_16851 ?auto_16852 ) ( CLEAR ?auto_16849 ) ( ON ?auto_16850 ?auto_16851 ) ( CLEAR ?auto_16850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16848 ?auto_16849 ?auto_16850 )
      ( MAKE-5PILE ?auto_16848 ?auto_16849 ?auto_16850 ?auto_16851 ?auto_16852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16859 - BLOCK
      ?auto_16860 - BLOCK
      ?auto_16861 - BLOCK
      ?auto_16862 - BLOCK
      ?auto_16863 - BLOCK
    )
    :vars
    (
      ?auto_16864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16863 ?auto_16864 ) ( ON-TABLE ?auto_16859 ) ( not ( = ?auto_16859 ?auto_16860 ) ) ( not ( = ?auto_16859 ?auto_16861 ) ) ( not ( = ?auto_16859 ?auto_16862 ) ) ( not ( = ?auto_16859 ?auto_16863 ) ) ( not ( = ?auto_16859 ?auto_16864 ) ) ( not ( = ?auto_16860 ?auto_16861 ) ) ( not ( = ?auto_16860 ?auto_16862 ) ) ( not ( = ?auto_16860 ?auto_16863 ) ) ( not ( = ?auto_16860 ?auto_16864 ) ) ( not ( = ?auto_16861 ?auto_16862 ) ) ( not ( = ?auto_16861 ?auto_16863 ) ) ( not ( = ?auto_16861 ?auto_16864 ) ) ( not ( = ?auto_16862 ?auto_16863 ) ) ( not ( = ?auto_16862 ?auto_16864 ) ) ( not ( = ?auto_16863 ?auto_16864 ) ) ( ON ?auto_16862 ?auto_16863 ) ( ON ?auto_16861 ?auto_16862 ) ( CLEAR ?auto_16859 ) ( ON ?auto_16860 ?auto_16861 ) ( CLEAR ?auto_16860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16859 ?auto_16860 )
      ( MAKE-5PILE ?auto_16859 ?auto_16860 ?auto_16861 ?auto_16862 ?auto_16863 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16870 - BLOCK
      ?auto_16871 - BLOCK
      ?auto_16872 - BLOCK
      ?auto_16873 - BLOCK
      ?auto_16874 - BLOCK
    )
    :vars
    (
      ?auto_16875 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16874 ?auto_16875 ) ( ON-TABLE ?auto_16870 ) ( not ( = ?auto_16870 ?auto_16871 ) ) ( not ( = ?auto_16870 ?auto_16872 ) ) ( not ( = ?auto_16870 ?auto_16873 ) ) ( not ( = ?auto_16870 ?auto_16874 ) ) ( not ( = ?auto_16870 ?auto_16875 ) ) ( not ( = ?auto_16871 ?auto_16872 ) ) ( not ( = ?auto_16871 ?auto_16873 ) ) ( not ( = ?auto_16871 ?auto_16874 ) ) ( not ( = ?auto_16871 ?auto_16875 ) ) ( not ( = ?auto_16872 ?auto_16873 ) ) ( not ( = ?auto_16872 ?auto_16874 ) ) ( not ( = ?auto_16872 ?auto_16875 ) ) ( not ( = ?auto_16873 ?auto_16874 ) ) ( not ( = ?auto_16873 ?auto_16875 ) ) ( not ( = ?auto_16874 ?auto_16875 ) ) ( ON ?auto_16873 ?auto_16874 ) ( ON ?auto_16872 ?auto_16873 ) ( CLEAR ?auto_16870 ) ( ON ?auto_16871 ?auto_16872 ) ( CLEAR ?auto_16871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16870 ?auto_16871 )
      ( MAKE-5PILE ?auto_16870 ?auto_16871 ?auto_16872 ?auto_16873 ?auto_16874 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16881 - BLOCK
      ?auto_16882 - BLOCK
      ?auto_16883 - BLOCK
      ?auto_16884 - BLOCK
      ?auto_16885 - BLOCK
    )
    :vars
    (
      ?auto_16886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16885 ?auto_16886 ) ( not ( = ?auto_16881 ?auto_16882 ) ) ( not ( = ?auto_16881 ?auto_16883 ) ) ( not ( = ?auto_16881 ?auto_16884 ) ) ( not ( = ?auto_16881 ?auto_16885 ) ) ( not ( = ?auto_16881 ?auto_16886 ) ) ( not ( = ?auto_16882 ?auto_16883 ) ) ( not ( = ?auto_16882 ?auto_16884 ) ) ( not ( = ?auto_16882 ?auto_16885 ) ) ( not ( = ?auto_16882 ?auto_16886 ) ) ( not ( = ?auto_16883 ?auto_16884 ) ) ( not ( = ?auto_16883 ?auto_16885 ) ) ( not ( = ?auto_16883 ?auto_16886 ) ) ( not ( = ?auto_16884 ?auto_16885 ) ) ( not ( = ?auto_16884 ?auto_16886 ) ) ( not ( = ?auto_16885 ?auto_16886 ) ) ( ON ?auto_16884 ?auto_16885 ) ( ON ?auto_16883 ?auto_16884 ) ( ON ?auto_16882 ?auto_16883 ) ( ON ?auto_16881 ?auto_16882 ) ( CLEAR ?auto_16881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16881 )
      ( MAKE-5PILE ?auto_16881 ?auto_16882 ?auto_16883 ?auto_16884 ?auto_16885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16892 - BLOCK
      ?auto_16893 - BLOCK
      ?auto_16894 - BLOCK
      ?auto_16895 - BLOCK
      ?auto_16896 - BLOCK
    )
    :vars
    (
      ?auto_16897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16896 ?auto_16897 ) ( not ( = ?auto_16892 ?auto_16893 ) ) ( not ( = ?auto_16892 ?auto_16894 ) ) ( not ( = ?auto_16892 ?auto_16895 ) ) ( not ( = ?auto_16892 ?auto_16896 ) ) ( not ( = ?auto_16892 ?auto_16897 ) ) ( not ( = ?auto_16893 ?auto_16894 ) ) ( not ( = ?auto_16893 ?auto_16895 ) ) ( not ( = ?auto_16893 ?auto_16896 ) ) ( not ( = ?auto_16893 ?auto_16897 ) ) ( not ( = ?auto_16894 ?auto_16895 ) ) ( not ( = ?auto_16894 ?auto_16896 ) ) ( not ( = ?auto_16894 ?auto_16897 ) ) ( not ( = ?auto_16895 ?auto_16896 ) ) ( not ( = ?auto_16895 ?auto_16897 ) ) ( not ( = ?auto_16896 ?auto_16897 ) ) ( ON ?auto_16895 ?auto_16896 ) ( ON ?auto_16894 ?auto_16895 ) ( ON ?auto_16893 ?auto_16894 ) ( ON ?auto_16892 ?auto_16893 ) ( CLEAR ?auto_16892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16892 )
      ( MAKE-5PILE ?auto_16892 ?auto_16893 ?auto_16894 ?auto_16895 ?auto_16896 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16904 - BLOCK
      ?auto_16905 - BLOCK
      ?auto_16906 - BLOCK
      ?auto_16907 - BLOCK
      ?auto_16908 - BLOCK
      ?auto_16909 - BLOCK
    )
    :vars
    (
      ?auto_16910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16908 ) ( ON ?auto_16909 ?auto_16910 ) ( CLEAR ?auto_16909 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16904 ) ( ON ?auto_16905 ?auto_16904 ) ( ON ?auto_16906 ?auto_16905 ) ( ON ?auto_16907 ?auto_16906 ) ( ON ?auto_16908 ?auto_16907 ) ( not ( = ?auto_16904 ?auto_16905 ) ) ( not ( = ?auto_16904 ?auto_16906 ) ) ( not ( = ?auto_16904 ?auto_16907 ) ) ( not ( = ?auto_16904 ?auto_16908 ) ) ( not ( = ?auto_16904 ?auto_16909 ) ) ( not ( = ?auto_16904 ?auto_16910 ) ) ( not ( = ?auto_16905 ?auto_16906 ) ) ( not ( = ?auto_16905 ?auto_16907 ) ) ( not ( = ?auto_16905 ?auto_16908 ) ) ( not ( = ?auto_16905 ?auto_16909 ) ) ( not ( = ?auto_16905 ?auto_16910 ) ) ( not ( = ?auto_16906 ?auto_16907 ) ) ( not ( = ?auto_16906 ?auto_16908 ) ) ( not ( = ?auto_16906 ?auto_16909 ) ) ( not ( = ?auto_16906 ?auto_16910 ) ) ( not ( = ?auto_16907 ?auto_16908 ) ) ( not ( = ?auto_16907 ?auto_16909 ) ) ( not ( = ?auto_16907 ?auto_16910 ) ) ( not ( = ?auto_16908 ?auto_16909 ) ) ( not ( = ?auto_16908 ?auto_16910 ) ) ( not ( = ?auto_16909 ?auto_16910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16909 ?auto_16910 )
      ( !STACK ?auto_16909 ?auto_16908 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16917 - BLOCK
      ?auto_16918 - BLOCK
      ?auto_16919 - BLOCK
      ?auto_16920 - BLOCK
      ?auto_16921 - BLOCK
      ?auto_16922 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16921 ) ( ON-TABLE ?auto_16922 ) ( CLEAR ?auto_16922 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16917 ) ( ON ?auto_16918 ?auto_16917 ) ( ON ?auto_16919 ?auto_16918 ) ( ON ?auto_16920 ?auto_16919 ) ( ON ?auto_16921 ?auto_16920 ) ( not ( = ?auto_16917 ?auto_16918 ) ) ( not ( = ?auto_16917 ?auto_16919 ) ) ( not ( = ?auto_16917 ?auto_16920 ) ) ( not ( = ?auto_16917 ?auto_16921 ) ) ( not ( = ?auto_16917 ?auto_16922 ) ) ( not ( = ?auto_16918 ?auto_16919 ) ) ( not ( = ?auto_16918 ?auto_16920 ) ) ( not ( = ?auto_16918 ?auto_16921 ) ) ( not ( = ?auto_16918 ?auto_16922 ) ) ( not ( = ?auto_16919 ?auto_16920 ) ) ( not ( = ?auto_16919 ?auto_16921 ) ) ( not ( = ?auto_16919 ?auto_16922 ) ) ( not ( = ?auto_16920 ?auto_16921 ) ) ( not ( = ?auto_16920 ?auto_16922 ) ) ( not ( = ?auto_16921 ?auto_16922 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_16922 )
      ( !STACK ?auto_16922 ?auto_16921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16929 - BLOCK
      ?auto_16930 - BLOCK
      ?auto_16931 - BLOCK
      ?auto_16932 - BLOCK
      ?auto_16933 - BLOCK
      ?auto_16934 - BLOCK
    )
    :vars
    (
      ?auto_16935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16934 ?auto_16935 ) ( ON-TABLE ?auto_16929 ) ( ON ?auto_16930 ?auto_16929 ) ( ON ?auto_16931 ?auto_16930 ) ( ON ?auto_16932 ?auto_16931 ) ( not ( = ?auto_16929 ?auto_16930 ) ) ( not ( = ?auto_16929 ?auto_16931 ) ) ( not ( = ?auto_16929 ?auto_16932 ) ) ( not ( = ?auto_16929 ?auto_16933 ) ) ( not ( = ?auto_16929 ?auto_16934 ) ) ( not ( = ?auto_16929 ?auto_16935 ) ) ( not ( = ?auto_16930 ?auto_16931 ) ) ( not ( = ?auto_16930 ?auto_16932 ) ) ( not ( = ?auto_16930 ?auto_16933 ) ) ( not ( = ?auto_16930 ?auto_16934 ) ) ( not ( = ?auto_16930 ?auto_16935 ) ) ( not ( = ?auto_16931 ?auto_16932 ) ) ( not ( = ?auto_16931 ?auto_16933 ) ) ( not ( = ?auto_16931 ?auto_16934 ) ) ( not ( = ?auto_16931 ?auto_16935 ) ) ( not ( = ?auto_16932 ?auto_16933 ) ) ( not ( = ?auto_16932 ?auto_16934 ) ) ( not ( = ?auto_16932 ?auto_16935 ) ) ( not ( = ?auto_16933 ?auto_16934 ) ) ( not ( = ?auto_16933 ?auto_16935 ) ) ( not ( = ?auto_16934 ?auto_16935 ) ) ( CLEAR ?auto_16932 ) ( ON ?auto_16933 ?auto_16934 ) ( CLEAR ?auto_16933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16929 ?auto_16930 ?auto_16931 ?auto_16932 ?auto_16933 )
      ( MAKE-6PILE ?auto_16929 ?auto_16930 ?auto_16931 ?auto_16932 ?auto_16933 ?auto_16934 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16942 - BLOCK
      ?auto_16943 - BLOCK
      ?auto_16944 - BLOCK
      ?auto_16945 - BLOCK
      ?auto_16946 - BLOCK
      ?auto_16947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16947 ) ( ON-TABLE ?auto_16942 ) ( ON ?auto_16943 ?auto_16942 ) ( ON ?auto_16944 ?auto_16943 ) ( ON ?auto_16945 ?auto_16944 ) ( not ( = ?auto_16942 ?auto_16943 ) ) ( not ( = ?auto_16942 ?auto_16944 ) ) ( not ( = ?auto_16942 ?auto_16945 ) ) ( not ( = ?auto_16942 ?auto_16946 ) ) ( not ( = ?auto_16942 ?auto_16947 ) ) ( not ( = ?auto_16943 ?auto_16944 ) ) ( not ( = ?auto_16943 ?auto_16945 ) ) ( not ( = ?auto_16943 ?auto_16946 ) ) ( not ( = ?auto_16943 ?auto_16947 ) ) ( not ( = ?auto_16944 ?auto_16945 ) ) ( not ( = ?auto_16944 ?auto_16946 ) ) ( not ( = ?auto_16944 ?auto_16947 ) ) ( not ( = ?auto_16945 ?auto_16946 ) ) ( not ( = ?auto_16945 ?auto_16947 ) ) ( not ( = ?auto_16946 ?auto_16947 ) ) ( CLEAR ?auto_16945 ) ( ON ?auto_16946 ?auto_16947 ) ( CLEAR ?auto_16946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16942 ?auto_16943 ?auto_16944 ?auto_16945 ?auto_16946 )
      ( MAKE-6PILE ?auto_16942 ?auto_16943 ?auto_16944 ?auto_16945 ?auto_16946 ?auto_16947 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16954 - BLOCK
      ?auto_16955 - BLOCK
      ?auto_16956 - BLOCK
      ?auto_16957 - BLOCK
      ?auto_16958 - BLOCK
      ?auto_16959 - BLOCK
    )
    :vars
    (
      ?auto_16960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16959 ?auto_16960 ) ( ON-TABLE ?auto_16954 ) ( ON ?auto_16955 ?auto_16954 ) ( ON ?auto_16956 ?auto_16955 ) ( not ( = ?auto_16954 ?auto_16955 ) ) ( not ( = ?auto_16954 ?auto_16956 ) ) ( not ( = ?auto_16954 ?auto_16957 ) ) ( not ( = ?auto_16954 ?auto_16958 ) ) ( not ( = ?auto_16954 ?auto_16959 ) ) ( not ( = ?auto_16954 ?auto_16960 ) ) ( not ( = ?auto_16955 ?auto_16956 ) ) ( not ( = ?auto_16955 ?auto_16957 ) ) ( not ( = ?auto_16955 ?auto_16958 ) ) ( not ( = ?auto_16955 ?auto_16959 ) ) ( not ( = ?auto_16955 ?auto_16960 ) ) ( not ( = ?auto_16956 ?auto_16957 ) ) ( not ( = ?auto_16956 ?auto_16958 ) ) ( not ( = ?auto_16956 ?auto_16959 ) ) ( not ( = ?auto_16956 ?auto_16960 ) ) ( not ( = ?auto_16957 ?auto_16958 ) ) ( not ( = ?auto_16957 ?auto_16959 ) ) ( not ( = ?auto_16957 ?auto_16960 ) ) ( not ( = ?auto_16958 ?auto_16959 ) ) ( not ( = ?auto_16958 ?auto_16960 ) ) ( not ( = ?auto_16959 ?auto_16960 ) ) ( ON ?auto_16958 ?auto_16959 ) ( CLEAR ?auto_16956 ) ( ON ?auto_16957 ?auto_16958 ) ( CLEAR ?auto_16957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16954 ?auto_16955 ?auto_16956 ?auto_16957 )
      ( MAKE-6PILE ?auto_16954 ?auto_16955 ?auto_16956 ?auto_16957 ?auto_16958 ?auto_16959 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16967 - BLOCK
      ?auto_16968 - BLOCK
      ?auto_16969 - BLOCK
      ?auto_16970 - BLOCK
      ?auto_16971 - BLOCK
      ?auto_16972 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16972 ) ( ON-TABLE ?auto_16967 ) ( ON ?auto_16968 ?auto_16967 ) ( ON ?auto_16969 ?auto_16968 ) ( not ( = ?auto_16967 ?auto_16968 ) ) ( not ( = ?auto_16967 ?auto_16969 ) ) ( not ( = ?auto_16967 ?auto_16970 ) ) ( not ( = ?auto_16967 ?auto_16971 ) ) ( not ( = ?auto_16967 ?auto_16972 ) ) ( not ( = ?auto_16968 ?auto_16969 ) ) ( not ( = ?auto_16968 ?auto_16970 ) ) ( not ( = ?auto_16968 ?auto_16971 ) ) ( not ( = ?auto_16968 ?auto_16972 ) ) ( not ( = ?auto_16969 ?auto_16970 ) ) ( not ( = ?auto_16969 ?auto_16971 ) ) ( not ( = ?auto_16969 ?auto_16972 ) ) ( not ( = ?auto_16970 ?auto_16971 ) ) ( not ( = ?auto_16970 ?auto_16972 ) ) ( not ( = ?auto_16971 ?auto_16972 ) ) ( ON ?auto_16971 ?auto_16972 ) ( CLEAR ?auto_16969 ) ( ON ?auto_16970 ?auto_16971 ) ( CLEAR ?auto_16970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16967 ?auto_16968 ?auto_16969 ?auto_16970 )
      ( MAKE-6PILE ?auto_16967 ?auto_16968 ?auto_16969 ?auto_16970 ?auto_16971 ?auto_16972 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16979 - BLOCK
      ?auto_16980 - BLOCK
      ?auto_16981 - BLOCK
      ?auto_16982 - BLOCK
      ?auto_16983 - BLOCK
      ?auto_16984 - BLOCK
    )
    :vars
    (
      ?auto_16985 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16984 ?auto_16985 ) ( ON-TABLE ?auto_16979 ) ( ON ?auto_16980 ?auto_16979 ) ( not ( = ?auto_16979 ?auto_16980 ) ) ( not ( = ?auto_16979 ?auto_16981 ) ) ( not ( = ?auto_16979 ?auto_16982 ) ) ( not ( = ?auto_16979 ?auto_16983 ) ) ( not ( = ?auto_16979 ?auto_16984 ) ) ( not ( = ?auto_16979 ?auto_16985 ) ) ( not ( = ?auto_16980 ?auto_16981 ) ) ( not ( = ?auto_16980 ?auto_16982 ) ) ( not ( = ?auto_16980 ?auto_16983 ) ) ( not ( = ?auto_16980 ?auto_16984 ) ) ( not ( = ?auto_16980 ?auto_16985 ) ) ( not ( = ?auto_16981 ?auto_16982 ) ) ( not ( = ?auto_16981 ?auto_16983 ) ) ( not ( = ?auto_16981 ?auto_16984 ) ) ( not ( = ?auto_16981 ?auto_16985 ) ) ( not ( = ?auto_16982 ?auto_16983 ) ) ( not ( = ?auto_16982 ?auto_16984 ) ) ( not ( = ?auto_16982 ?auto_16985 ) ) ( not ( = ?auto_16983 ?auto_16984 ) ) ( not ( = ?auto_16983 ?auto_16985 ) ) ( not ( = ?auto_16984 ?auto_16985 ) ) ( ON ?auto_16983 ?auto_16984 ) ( ON ?auto_16982 ?auto_16983 ) ( CLEAR ?auto_16980 ) ( ON ?auto_16981 ?auto_16982 ) ( CLEAR ?auto_16981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16979 ?auto_16980 ?auto_16981 )
      ( MAKE-6PILE ?auto_16979 ?auto_16980 ?auto_16981 ?auto_16982 ?auto_16983 ?auto_16984 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16992 - BLOCK
      ?auto_16993 - BLOCK
      ?auto_16994 - BLOCK
      ?auto_16995 - BLOCK
      ?auto_16996 - BLOCK
      ?auto_16997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16997 ) ( ON-TABLE ?auto_16992 ) ( ON ?auto_16993 ?auto_16992 ) ( not ( = ?auto_16992 ?auto_16993 ) ) ( not ( = ?auto_16992 ?auto_16994 ) ) ( not ( = ?auto_16992 ?auto_16995 ) ) ( not ( = ?auto_16992 ?auto_16996 ) ) ( not ( = ?auto_16992 ?auto_16997 ) ) ( not ( = ?auto_16993 ?auto_16994 ) ) ( not ( = ?auto_16993 ?auto_16995 ) ) ( not ( = ?auto_16993 ?auto_16996 ) ) ( not ( = ?auto_16993 ?auto_16997 ) ) ( not ( = ?auto_16994 ?auto_16995 ) ) ( not ( = ?auto_16994 ?auto_16996 ) ) ( not ( = ?auto_16994 ?auto_16997 ) ) ( not ( = ?auto_16995 ?auto_16996 ) ) ( not ( = ?auto_16995 ?auto_16997 ) ) ( not ( = ?auto_16996 ?auto_16997 ) ) ( ON ?auto_16996 ?auto_16997 ) ( ON ?auto_16995 ?auto_16996 ) ( CLEAR ?auto_16993 ) ( ON ?auto_16994 ?auto_16995 ) ( CLEAR ?auto_16994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16992 ?auto_16993 ?auto_16994 )
      ( MAKE-6PILE ?auto_16992 ?auto_16993 ?auto_16994 ?auto_16995 ?auto_16996 ?auto_16997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17004 - BLOCK
      ?auto_17005 - BLOCK
      ?auto_17006 - BLOCK
      ?auto_17007 - BLOCK
      ?auto_17008 - BLOCK
      ?auto_17009 - BLOCK
    )
    :vars
    (
      ?auto_17010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17009 ?auto_17010 ) ( ON-TABLE ?auto_17004 ) ( not ( = ?auto_17004 ?auto_17005 ) ) ( not ( = ?auto_17004 ?auto_17006 ) ) ( not ( = ?auto_17004 ?auto_17007 ) ) ( not ( = ?auto_17004 ?auto_17008 ) ) ( not ( = ?auto_17004 ?auto_17009 ) ) ( not ( = ?auto_17004 ?auto_17010 ) ) ( not ( = ?auto_17005 ?auto_17006 ) ) ( not ( = ?auto_17005 ?auto_17007 ) ) ( not ( = ?auto_17005 ?auto_17008 ) ) ( not ( = ?auto_17005 ?auto_17009 ) ) ( not ( = ?auto_17005 ?auto_17010 ) ) ( not ( = ?auto_17006 ?auto_17007 ) ) ( not ( = ?auto_17006 ?auto_17008 ) ) ( not ( = ?auto_17006 ?auto_17009 ) ) ( not ( = ?auto_17006 ?auto_17010 ) ) ( not ( = ?auto_17007 ?auto_17008 ) ) ( not ( = ?auto_17007 ?auto_17009 ) ) ( not ( = ?auto_17007 ?auto_17010 ) ) ( not ( = ?auto_17008 ?auto_17009 ) ) ( not ( = ?auto_17008 ?auto_17010 ) ) ( not ( = ?auto_17009 ?auto_17010 ) ) ( ON ?auto_17008 ?auto_17009 ) ( ON ?auto_17007 ?auto_17008 ) ( ON ?auto_17006 ?auto_17007 ) ( CLEAR ?auto_17004 ) ( ON ?auto_17005 ?auto_17006 ) ( CLEAR ?auto_17005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17004 ?auto_17005 )
      ( MAKE-6PILE ?auto_17004 ?auto_17005 ?auto_17006 ?auto_17007 ?auto_17008 ?auto_17009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17017 - BLOCK
      ?auto_17018 - BLOCK
      ?auto_17019 - BLOCK
      ?auto_17020 - BLOCK
      ?auto_17021 - BLOCK
      ?auto_17022 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17022 ) ( ON-TABLE ?auto_17017 ) ( not ( = ?auto_17017 ?auto_17018 ) ) ( not ( = ?auto_17017 ?auto_17019 ) ) ( not ( = ?auto_17017 ?auto_17020 ) ) ( not ( = ?auto_17017 ?auto_17021 ) ) ( not ( = ?auto_17017 ?auto_17022 ) ) ( not ( = ?auto_17018 ?auto_17019 ) ) ( not ( = ?auto_17018 ?auto_17020 ) ) ( not ( = ?auto_17018 ?auto_17021 ) ) ( not ( = ?auto_17018 ?auto_17022 ) ) ( not ( = ?auto_17019 ?auto_17020 ) ) ( not ( = ?auto_17019 ?auto_17021 ) ) ( not ( = ?auto_17019 ?auto_17022 ) ) ( not ( = ?auto_17020 ?auto_17021 ) ) ( not ( = ?auto_17020 ?auto_17022 ) ) ( not ( = ?auto_17021 ?auto_17022 ) ) ( ON ?auto_17021 ?auto_17022 ) ( ON ?auto_17020 ?auto_17021 ) ( ON ?auto_17019 ?auto_17020 ) ( CLEAR ?auto_17017 ) ( ON ?auto_17018 ?auto_17019 ) ( CLEAR ?auto_17018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_17017 ?auto_17018 )
      ( MAKE-6PILE ?auto_17017 ?auto_17018 ?auto_17019 ?auto_17020 ?auto_17021 ?auto_17022 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17029 - BLOCK
      ?auto_17030 - BLOCK
      ?auto_17031 - BLOCK
      ?auto_17032 - BLOCK
      ?auto_17033 - BLOCK
      ?auto_17034 - BLOCK
    )
    :vars
    (
      ?auto_17035 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17034 ?auto_17035 ) ( not ( = ?auto_17029 ?auto_17030 ) ) ( not ( = ?auto_17029 ?auto_17031 ) ) ( not ( = ?auto_17029 ?auto_17032 ) ) ( not ( = ?auto_17029 ?auto_17033 ) ) ( not ( = ?auto_17029 ?auto_17034 ) ) ( not ( = ?auto_17029 ?auto_17035 ) ) ( not ( = ?auto_17030 ?auto_17031 ) ) ( not ( = ?auto_17030 ?auto_17032 ) ) ( not ( = ?auto_17030 ?auto_17033 ) ) ( not ( = ?auto_17030 ?auto_17034 ) ) ( not ( = ?auto_17030 ?auto_17035 ) ) ( not ( = ?auto_17031 ?auto_17032 ) ) ( not ( = ?auto_17031 ?auto_17033 ) ) ( not ( = ?auto_17031 ?auto_17034 ) ) ( not ( = ?auto_17031 ?auto_17035 ) ) ( not ( = ?auto_17032 ?auto_17033 ) ) ( not ( = ?auto_17032 ?auto_17034 ) ) ( not ( = ?auto_17032 ?auto_17035 ) ) ( not ( = ?auto_17033 ?auto_17034 ) ) ( not ( = ?auto_17033 ?auto_17035 ) ) ( not ( = ?auto_17034 ?auto_17035 ) ) ( ON ?auto_17033 ?auto_17034 ) ( ON ?auto_17032 ?auto_17033 ) ( ON ?auto_17031 ?auto_17032 ) ( ON ?auto_17030 ?auto_17031 ) ( ON ?auto_17029 ?auto_17030 ) ( CLEAR ?auto_17029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17029 )
      ( MAKE-6PILE ?auto_17029 ?auto_17030 ?auto_17031 ?auto_17032 ?auto_17033 ?auto_17034 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17042 - BLOCK
      ?auto_17043 - BLOCK
      ?auto_17044 - BLOCK
      ?auto_17045 - BLOCK
      ?auto_17046 - BLOCK
      ?auto_17047 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_17047 ) ( not ( = ?auto_17042 ?auto_17043 ) ) ( not ( = ?auto_17042 ?auto_17044 ) ) ( not ( = ?auto_17042 ?auto_17045 ) ) ( not ( = ?auto_17042 ?auto_17046 ) ) ( not ( = ?auto_17042 ?auto_17047 ) ) ( not ( = ?auto_17043 ?auto_17044 ) ) ( not ( = ?auto_17043 ?auto_17045 ) ) ( not ( = ?auto_17043 ?auto_17046 ) ) ( not ( = ?auto_17043 ?auto_17047 ) ) ( not ( = ?auto_17044 ?auto_17045 ) ) ( not ( = ?auto_17044 ?auto_17046 ) ) ( not ( = ?auto_17044 ?auto_17047 ) ) ( not ( = ?auto_17045 ?auto_17046 ) ) ( not ( = ?auto_17045 ?auto_17047 ) ) ( not ( = ?auto_17046 ?auto_17047 ) ) ( ON ?auto_17046 ?auto_17047 ) ( ON ?auto_17045 ?auto_17046 ) ( ON ?auto_17044 ?auto_17045 ) ( ON ?auto_17043 ?auto_17044 ) ( ON ?auto_17042 ?auto_17043 ) ( CLEAR ?auto_17042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17042 )
      ( MAKE-6PILE ?auto_17042 ?auto_17043 ?auto_17044 ?auto_17045 ?auto_17046 ?auto_17047 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_17054 - BLOCK
      ?auto_17055 - BLOCK
      ?auto_17056 - BLOCK
      ?auto_17057 - BLOCK
      ?auto_17058 - BLOCK
      ?auto_17059 - BLOCK
    )
    :vars
    (
      ?auto_17060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_17054 ?auto_17055 ) ) ( not ( = ?auto_17054 ?auto_17056 ) ) ( not ( = ?auto_17054 ?auto_17057 ) ) ( not ( = ?auto_17054 ?auto_17058 ) ) ( not ( = ?auto_17054 ?auto_17059 ) ) ( not ( = ?auto_17055 ?auto_17056 ) ) ( not ( = ?auto_17055 ?auto_17057 ) ) ( not ( = ?auto_17055 ?auto_17058 ) ) ( not ( = ?auto_17055 ?auto_17059 ) ) ( not ( = ?auto_17056 ?auto_17057 ) ) ( not ( = ?auto_17056 ?auto_17058 ) ) ( not ( = ?auto_17056 ?auto_17059 ) ) ( not ( = ?auto_17057 ?auto_17058 ) ) ( not ( = ?auto_17057 ?auto_17059 ) ) ( not ( = ?auto_17058 ?auto_17059 ) ) ( ON ?auto_17054 ?auto_17060 ) ( not ( = ?auto_17059 ?auto_17060 ) ) ( not ( = ?auto_17058 ?auto_17060 ) ) ( not ( = ?auto_17057 ?auto_17060 ) ) ( not ( = ?auto_17056 ?auto_17060 ) ) ( not ( = ?auto_17055 ?auto_17060 ) ) ( not ( = ?auto_17054 ?auto_17060 ) ) ( ON ?auto_17055 ?auto_17054 ) ( ON ?auto_17056 ?auto_17055 ) ( ON ?auto_17057 ?auto_17056 ) ( ON ?auto_17058 ?auto_17057 ) ( ON ?auto_17059 ?auto_17058 ) ( CLEAR ?auto_17059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_17059 ?auto_17058 ?auto_17057 ?auto_17056 ?auto_17055 ?auto_17054 )
      ( MAKE-6PILE ?auto_17054 ?auto_17055 ?auto_17056 ?auto_17057 ?auto_17058 ?auto_17059 ) )
  )

)

