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

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29717 - BLOCK
      ?auto_29718 - BLOCK
      ?auto_29719 - BLOCK
      ?auto_29720 - BLOCK
      ?auto_29721 - BLOCK
    )
    :vars
    (
      ?auto_29722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29722 ?auto_29721 ) ( CLEAR ?auto_29722 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29717 ) ( ON ?auto_29718 ?auto_29717 ) ( ON ?auto_29719 ?auto_29718 ) ( ON ?auto_29720 ?auto_29719 ) ( ON ?auto_29721 ?auto_29720 ) ( not ( = ?auto_29717 ?auto_29718 ) ) ( not ( = ?auto_29717 ?auto_29719 ) ) ( not ( = ?auto_29717 ?auto_29720 ) ) ( not ( = ?auto_29717 ?auto_29721 ) ) ( not ( = ?auto_29717 ?auto_29722 ) ) ( not ( = ?auto_29718 ?auto_29719 ) ) ( not ( = ?auto_29718 ?auto_29720 ) ) ( not ( = ?auto_29718 ?auto_29721 ) ) ( not ( = ?auto_29718 ?auto_29722 ) ) ( not ( = ?auto_29719 ?auto_29720 ) ) ( not ( = ?auto_29719 ?auto_29721 ) ) ( not ( = ?auto_29719 ?auto_29722 ) ) ( not ( = ?auto_29720 ?auto_29721 ) ) ( not ( = ?auto_29720 ?auto_29722 ) ) ( not ( = ?auto_29721 ?auto_29722 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29722 ?auto_29721 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29724 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29724 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29725 - BLOCK
    )
    :vars
    (
      ?auto_29726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29725 ?auto_29726 ) ( CLEAR ?auto_29725 ) ( HAND-EMPTY ) ( not ( = ?auto_29725 ?auto_29726 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29725 ?auto_29726 )
      ( MAKE-1PILE ?auto_29725 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29731 - BLOCK
      ?auto_29732 - BLOCK
      ?auto_29733 - BLOCK
      ?auto_29734 - BLOCK
    )
    :vars
    (
      ?auto_29735 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29735 ?auto_29734 ) ( CLEAR ?auto_29735 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29731 ) ( ON ?auto_29732 ?auto_29731 ) ( ON ?auto_29733 ?auto_29732 ) ( ON ?auto_29734 ?auto_29733 ) ( not ( = ?auto_29731 ?auto_29732 ) ) ( not ( = ?auto_29731 ?auto_29733 ) ) ( not ( = ?auto_29731 ?auto_29734 ) ) ( not ( = ?auto_29731 ?auto_29735 ) ) ( not ( = ?auto_29732 ?auto_29733 ) ) ( not ( = ?auto_29732 ?auto_29734 ) ) ( not ( = ?auto_29732 ?auto_29735 ) ) ( not ( = ?auto_29733 ?auto_29734 ) ) ( not ( = ?auto_29733 ?auto_29735 ) ) ( not ( = ?auto_29734 ?auto_29735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29735 ?auto_29734 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29736 - BLOCK
      ?auto_29737 - BLOCK
      ?auto_29738 - BLOCK
      ?auto_29739 - BLOCK
    )
    :vars
    (
      ?auto_29740 - BLOCK
      ?auto_29741 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29740 ?auto_29739 ) ( CLEAR ?auto_29740 ) ( ON-TABLE ?auto_29736 ) ( ON ?auto_29737 ?auto_29736 ) ( ON ?auto_29738 ?auto_29737 ) ( ON ?auto_29739 ?auto_29738 ) ( not ( = ?auto_29736 ?auto_29737 ) ) ( not ( = ?auto_29736 ?auto_29738 ) ) ( not ( = ?auto_29736 ?auto_29739 ) ) ( not ( = ?auto_29736 ?auto_29740 ) ) ( not ( = ?auto_29737 ?auto_29738 ) ) ( not ( = ?auto_29737 ?auto_29739 ) ) ( not ( = ?auto_29737 ?auto_29740 ) ) ( not ( = ?auto_29738 ?auto_29739 ) ) ( not ( = ?auto_29738 ?auto_29740 ) ) ( not ( = ?auto_29739 ?auto_29740 ) ) ( HOLDING ?auto_29741 ) ( not ( = ?auto_29736 ?auto_29741 ) ) ( not ( = ?auto_29737 ?auto_29741 ) ) ( not ( = ?auto_29738 ?auto_29741 ) ) ( not ( = ?auto_29739 ?auto_29741 ) ) ( not ( = ?auto_29740 ?auto_29741 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_29741 )
      ( MAKE-4PILE ?auto_29736 ?auto_29737 ?auto_29738 ?auto_29739 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29742 - BLOCK
      ?auto_29743 - BLOCK
      ?auto_29744 - BLOCK
      ?auto_29745 - BLOCK
    )
    :vars
    (
      ?auto_29747 - BLOCK
      ?auto_29746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29747 ?auto_29745 ) ( ON-TABLE ?auto_29742 ) ( ON ?auto_29743 ?auto_29742 ) ( ON ?auto_29744 ?auto_29743 ) ( ON ?auto_29745 ?auto_29744 ) ( not ( = ?auto_29742 ?auto_29743 ) ) ( not ( = ?auto_29742 ?auto_29744 ) ) ( not ( = ?auto_29742 ?auto_29745 ) ) ( not ( = ?auto_29742 ?auto_29747 ) ) ( not ( = ?auto_29743 ?auto_29744 ) ) ( not ( = ?auto_29743 ?auto_29745 ) ) ( not ( = ?auto_29743 ?auto_29747 ) ) ( not ( = ?auto_29744 ?auto_29745 ) ) ( not ( = ?auto_29744 ?auto_29747 ) ) ( not ( = ?auto_29745 ?auto_29747 ) ) ( not ( = ?auto_29742 ?auto_29746 ) ) ( not ( = ?auto_29743 ?auto_29746 ) ) ( not ( = ?auto_29744 ?auto_29746 ) ) ( not ( = ?auto_29745 ?auto_29746 ) ) ( not ( = ?auto_29747 ?auto_29746 ) ) ( ON ?auto_29746 ?auto_29747 ) ( CLEAR ?auto_29746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29742 ?auto_29743 ?auto_29744 ?auto_29745 ?auto_29747 )
      ( MAKE-4PILE ?auto_29742 ?auto_29743 ?auto_29744 ?auto_29745 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29750 - BLOCK
      ?auto_29751 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29751 ) ( CLEAR ?auto_29750 ) ( ON-TABLE ?auto_29750 ) ( not ( = ?auto_29750 ?auto_29751 ) ) )
    :subtasks
    ( ( !STACK ?auto_29751 ?auto_29750 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29752 - BLOCK
      ?auto_29753 - BLOCK
    )
    :vars
    (
      ?auto_29754 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29752 ) ( ON-TABLE ?auto_29752 ) ( not ( = ?auto_29752 ?auto_29753 ) ) ( ON ?auto_29753 ?auto_29754 ) ( CLEAR ?auto_29753 ) ( HAND-EMPTY ) ( not ( = ?auto_29752 ?auto_29754 ) ) ( not ( = ?auto_29753 ?auto_29754 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29753 ?auto_29754 )
      ( MAKE-2PILE ?auto_29752 ?auto_29753 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29755 - BLOCK
      ?auto_29756 - BLOCK
    )
    :vars
    (
      ?auto_29757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29755 ?auto_29756 ) ) ( ON ?auto_29756 ?auto_29757 ) ( CLEAR ?auto_29756 ) ( not ( = ?auto_29755 ?auto_29757 ) ) ( not ( = ?auto_29756 ?auto_29757 ) ) ( HOLDING ?auto_29755 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29755 )
      ( MAKE-2PILE ?auto_29755 ?auto_29756 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29758 - BLOCK
      ?auto_29759 - BLOCK
    )
    :vars
    (
      ?auto_29760 - BLOCK
      ?auto_29761 - BLOCK
      ?auto_29763 - BLOCK
      ?auto_29762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29758 ?auto_29759 ) ) ( ON ?auto_29759 ?auto_29760 ) ( not ( = ?auto_29758 ?auto_29760 ) ) ( not ( = ?auto_29759 ?auto_29760 ) ) ( ON ?auto_29758 ?auto_29759 ) ( CLEAR ?auto_29758 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29761 ) ( ON ?auto_29763 ?auto_29761 ) ( ON ?auto_29762 ?auto_29763 ) ( ON ?auto_29760 ?auto_29762 ) ( not ( = ?auto_29761 ?auto_29763 ) ) ( not ( = ?auto_29761 ?auto_29762 ) ) ( not ( = ?auto_29761 ?auto_29760 ) ) ( not ( = ?auto_29761 ?auto_29759 ) ) ( not ( = ?auto_29761 ?auto_29758 ) ) ( not ( = ?auto_29763 ?auto_29762 ) ) ( not ( = ?auto_29763 ?auto_29760 ) ) ( not ( = ?auto_29763 ?auto_29759 ) ) ( not ( = ?auto_29763 ?auto_29758 ) ) ( not ( = ?auto_29762 ?auto_29760 ) ) ( not ( = ?auto_29762 ?auto_29759 ) ) ( not ( = ?auto_29762 ?auto_29758 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29761 ?auto_29763 ?auto_29762 ?auto_29760 ?auto_29759 )
      ( MAKE-2PILE ?auto_29758 ?auto_29759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29767 - BLOCK
      ?auto_29768 - BLOCK
      ?auto_29769 - BLOCK
    )
    :vars
    (
      ?auto_29770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29770 ?auto_29769 ) ( CLEAR ?auto_29770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29767 ) ( ON ?auto_29768 ?auto_29767 ) ( ON ?auto_29769 ?auto_29768 ) ( not ( = ?auto_29767 ?auto_29768 ) ) ( not ( = ?auto_29767 ?auto_29769 ) ) ( not ( = ?auto_29767 ?auto_29770 ) ) ( not ( = ?auto_29768 ?auto_29769 ) ) ( not ( = ?auto_29768 ?auto_29770 ) ) ( not ( = ?auto_29769 ?auto_29770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29770 ?auto_29769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29771 - BLOCK
      ?auto_29772 - BLOCK
      ?auto_29773 - BLOCK
    )
    :vars
    (
      ?auto_29774 - BLOCK
      ?auto_29775 - BLOCK
      ?auto_29776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29774 ?auto_29773 ) ( CLEAR ?auto_29774 ) ( ON-TABLE ?auto_29771 ) ( ON ?auto_29772 ?auto_29771 ) ( ON ?auto_29773 ?auto_29772 ) ( not ( = ?auto_29771 ?auto_29772 ) ) ( not ( = ?auto_29771 ?auto_29773 ) ) ( not ( = ?auto_29771 ?auto_29774 ) ) ( not ( = ?auto_29772 ?auto_29773 ) ) ( not ( = ?auto_29772 ?auto_29774 ) ) ( not ( = ?auto_29773 ?auto_29774 ) ) ( HOLDING ?auto_29775 ) ( CLEAR ?auto_29776 ) ( not ( = ?auto_29771 ?auto_29775 ) ) ( not ( = ?auto_29771 ?auto_29776 ) ) ( not ( = ?auto_29772 ?auto_29775 ) ) ( not ( = ?auto_29772 ?auto_29776 ) ) ( not ( = ?auto_29773 ?auto_29775 ) ) ( not ( = ?auto_29773 ?auto_29776 ) ) ( not ( = ?auto_29774 ?auto_29775 ) ) ( not ( = ?auto_29774 ?auto_29776 ) ) ( not ( = ?auto_29775 ?auto_29776 ) ) )
    :subtasks
    ( ( !STACK ?auto_29775 ?auto_29776 )
      ( MAKE-3PILE ?auto_29771 ?auto_29772 ?auto_29773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29777 - BLOCK
      ?auto_29778 - BLOCK
      ?auto_29779 - BLOCK
    )
    :vars
    (
      ?auto_29782 - BLOCK
      ?auto_29780 - BLOCK
      ?auto_29781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29782 ?auto_29779 ) ( ON-TABLE ?auto_29777 ) ( ON ?auto_29778 ?auto_29777 ) ( ON ?auto_29779 ?auto_29778 ) ( not ( = ?auto_29777 ?auto_29778 ) ) ( not ( = ?auto_29777 ?auto_29779 ) ) ( not ( = ?auto_29777 ?auto_29782 ) ) ( not ( = ?auto_29778 ?auto_29779 ) ) ( not ( = ?auto_29778 ?auto_29782 ) ) ( not ( = ?auto_29779 ?auto_29782 ) ) ( CLEAR ?auto_29780 ) ( not ( = ?auto_29777 ?auto_29781 ) ) ( not ( = ?auto_29777 ?auto_29780 ) ) ( not ( = ?auto_29778 ?auto_29781 ) ) ( not ( = ?auto_29778 ?auto_29780 ) ) ( not ( = ?auto_29779 ?auto_29781 ) ) ( not ( = ?auto_29779 ?auto_29780 ) ) ( not ( = ?auto_29782 ?auto_29781 ) ) ( not ( = ?auto_29782 ?auto_29780 ) ) ( not ( = ?auto_29781 ?auto_29780 ) ) ( ON ?auto_29781 ?auto_29782 ) ( CLEAR ?auto_29781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29777 ?auto_29778 ?auto_29779 ?auto_29782 )
      ( MAKE-3PILE ?auto_29777 ?auto_29778 ?auto_29779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29783 - BLOCK
      ?auto_29784 - BLOCK
      ?auto_29785 - BLOCK
    )
    :vars
    (
      ?auto_29787 - BLOCK
      ?auto_29788 - BLOCK
      ?auto_29786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29787 ?auto_29785 ) ( ON-TABLE ?auto_29783 ) ( ON ?auto_29784 ?auto_29783 ) ( ON ?auto_29785 ?auto_29784 ) ( not ( = ?auto_29783 ?auto_29784 ) ) ( not ( = ?auto_29783 ?auto_29785 ) ) ( not ( = ?auto_29783 ?auto_29787 ) ) ( not ( = ?auto_29784 ?auto_29785 ) ) ( not ( = ?auto_29784 ?auto_29787 ) ) ( not ( = ?auto_29785 ?auto_29787 ) ) ( not ( = ?auto_29783 ?auto_29788 ) ) ( not ( = ?auto_29783 ?auto_29786 ) ) ( not ( = ?auto_29784 ?auto_29788 ) ) ( not ( = ?auto_29784 ?auto_29786 ) ) ( not ( = ?auto_29785 ?auto_29788 ) ) ( not ( = ?auto_29785 ?auto_29786 ) ) ( not ( = ?auto_29787 ?auto_29788 ) ) ( not ( = ?auto_29787 ?auto_29786 ) ) ( not ( = ?auto_29788 ?auto_29786 ) ) ( ON ?auto_29788 ?auto_29787 ) ( CLEAR ?auto_29788 ) ( HOLDING ?auto_29786 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29786 )
      ( MAKE-3PILE ?auto_29783 ?auto_29784 ?auto_29785 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29789 - BLOCK
      ?auto_29790 - BLOCK
      ?auto_29791 - BLOCK
    )
    :vars
    (
      ?auto_29793 - BLOCK
      ?auto_29792 - BLOCK
      ?auto_29794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29793 ?auto_29791 ) ( ON-TABLE ?auto_29789 ) ( ON ?auto_29790 ?auto_29789 ) ( ON ?auto_29791 ?auto_29790 ) ( not ( = ?auto_29789 ?auto_29790 ) ) ( not ( = ?auto_29789 ?auto_29791 ) ) ( not ( = ?auto_29789 ?auto_29793 ) ) ( not ( = ?auto_29790 ?auto_29791 ) ) ( not ( = ?auto_29790 ?auto_29793 ) ) ( not ( = ?auto_29791 ?auto_29793 ) ) ( not ( = ?auto_29789 ?auto_29792 ) ) ( not ( = ?auto_29789 ?auto_29794 ) ) ( not ( = ?auto_29790 ?auto_29792 ) ) ( not ( = ?auto_29790 ?auto_29794 ) ) ( not ( = ?auto_29791 ?auto_29792 ) ) ( not ( = ?auto_29791 ?auto_29794 ) ) ( not ( = ?auto_29793 ?auto_29792 ) ) ( not ( = ?auto_29793 ?auto_29794 ) ) ( not ( = ?auto_29792 ?auto_29794 ) ) ( ON ?auto_29792 ?auto_29793 ) ( ON ?auto_29794 ?auto_29792 ) ( CLEAR ?auto_29794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29789 ?auto_29790 ?auto_29791 ?auto_29793 ?auto_29792 )
      ( MAKE-3PILE ?auto_29789 ?auto_29790 ?auto_29791 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29798 - BLOCK
      ?auto_29799 - BLOCK
      ?auto_29800 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29800 ) ( CLEAR ?auto_29799 ) ( ON-TABLE ?auto_29798 ) ( ON ?auto_29799 ?auto_29798 ) ( not ( = ?auto_29798 ?auto_29799 ) ) ( not ( = ?auto_29798 ?auto_29800 ) ) ( not ( = ?auto_29799 ?auto_29800 ) ) )
    :subtasks
    ( ( !STACK ?auto_29800 ?auto_29799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29801 - BLOCK
      ?auto_29802 - BLOCK
      ?auto_29803 - BLOCK
    )
    :vars
    (
      ?auto_29804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29802 ) ( ON-TABLE ?auto_29801 ) ( ON ?auto_29802 ?auto_29801 ) ( not ( = ?auto_29801 ?auto_29802 ) ) ( not ( = ?auto_29801 ?auto_29803 ) ) ( not ( = ?auto_29802 ?auto_29803 ) ) ( ON ?auto_29803 ?auto_29804 ) ( CLEAR ?auto_29803 ) ( HAND-EMPTY ) ( not ( = ?auto_29801 ?auto_29804 ) ) ( not ( = ?auto_29802 ?auto_29804 ) ) ( not ( = ?auto_29803 ?auto_29804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29803 ?auto_29804 )
      ( MAKE-3PILE ?auto_29801 ?auto_29802 ?auto_29803 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29805 - BLOCK
      ?auto_29806 - BLOCK
      ?auto_29807 - BLOCK
    )
    :vars
    (
      ?auto_29808 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29805 ) ( not ( = ?auto_29805 ?auto_29806 ) ) ( not ( = ?auto_29805 ?auto_29807 ) ) ( not ( = ?auto_29806 ?auto_29807 ) ) ( ON ?auto_29807 ?auto_29808 ) ( CLEAR ?auto_29807 ) ( not ( = ?auto_29805 ?auto_29808 ) ) ( not ( = ?auto_29806 ?auto_29808 ) ) ( not ( = ?auto_29807 ?auto_29808 ) ) ( HOLDING ?auto_29806 ) ( CLEAR ?auto_29805 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29805 ?auto_29806 )
      ( MAKE-3PILE ?auto_29805 ?auto_29806 ?auto_29807 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29809 - BLOCK
      ?auto_29810 - BLOCK
      ?auto_29811 - BLOCK
    )
    :vars
    (
      ?auto_29812 - BLOCK
      ?auto_29813 - BLOCK
      ?auto_29814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29809 ) ( not ( = ?auto_29809 ?auto_29810 ) ) ( not ( = ?auto_29809 ?auto_29811 ) ) ( not ( = ?auto_29810 ?auto_29811 ) ) ( ON ?auto_29811 ?auto_29812 ) ( not ( = ?auto_29809 ?auto_29812 ) ) ( not ( = ?auto_29810 ?auto_29812 ) ) ( not ( = ?auto_29811 ?auto_29812 ) ) ( CLEAR ?auto_29809 ) ( ON ?auto_29810 ?auto_29811 ) ( CLEAR ?auto_29810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29813 ) ( ON ?auto_29814 ?auto_29813 ) ( ON ?auto_29812 ?auto_29814 ) ( not ( = ?auto_29813 ?auto_29814 ) ) ( not ( = ?auto_29813 ?auto_29812 ) ) ( not ( = ?auto_29813 ?auto_29811 ) ) ( not ( = ?auto_29813 ?auto_29810 ) ) ( not ( = ?auto_29814 ?auto_29812 ) ) ( not ( = ?auto_29814 ?auto_29811 ) ) ( not ( = ?auto_29814 ?auto_29810 ) ) ( not ( = ?auto_29809 ?auto_29813 ) ) ( not ( = ?auto_29809 ?auto_29814 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29813 ?auto_29814 ?auto_29812 ?auto_29811 )
      ( MAKE-3PILE ?auto_29809 ?auto_29810 ?auto_29811 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29815 - BLOCK
      ?auto_29816 - BLOCK
      ?auto_29817 - BLOCK
    )
    :vars
    (
      ?auto_29818 - BLOCK
      ?auto_29819 - BLOCK
      ?auto_29820 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29815 ?auto_29816 ) ) ( not ( = ?auto_29815 ?auto_29817 ) ) ( not ( = ?auto_29816 ?auto_29817 ) ) ( ON ?auto_29817 ?auto_29818 ) ( not ( = ?auto_29815 ?auto_29818 ) ) ( not ( = ?auto_29816 ?auto_29818 ) ) ( not ( = ?auto_29817 ?auto_29818 ) ) ( ON ?auto_29816 ?auto_29817 ) ( CLEAR ?auto_29816 ) ( ON-TABLE ?auto_29819 ) ( ON ?auto_29820 ?auto_29819 ) ( ON ?auto_29818 ?auto_29820 ) ( not ( = ?auto_29819 ?auto_29820 ) ) ( not ( = ?auto_29819 ?auto_29818 ) ) ( not ( = ?auto_29819 ?auto_29817 ) ) ( not ( = ?auto_29819 ?auto_29816 ) ) ( not ( = ?auto_29820 ?auto_29818 ) ) ( not ( = ?auto_29820 ?auto_29817 ) ) ( not ( = ?auto_29820 ?auto_29816 ) ) ( not ( = ?auto_29815 ?auto_29819 ) ) ( not ( = ?auto_29815 ?auto_29820 ) ) ( HOLDING ?auto_29815 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29815 )
      ( MAKE-3PILE ?auto_29815 ?auto_29816 ?auto_29817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_29821 - BLOCK
      ?auto_29822 - BLOCK
      ?auto_29823 - BLOCK
    )
    :vars
    (
      ?auto_29825 - BLOCK
      ?auto_29824 - BLOCK
      ?auto_29826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29821 ?auto_29822 ) ) ( not ( = ?auto_29821 ?auto_29823 ) ) ( not ( = ?auto_29822 ?auto_29823 ) ) ( ON ?auto_29823 ?auto_29825 ) ( not ( = ?auto_29821 ?auto_29825 ) ) ( not ( = ?auto_29822 ?auto_29825 ) ) ( not ( = ?auto_29823 ?auto_29825 ) ) ( ON ?auto_29822 ?auto_29823 ) ( ON-TABLE ?auto_29824 ) ( ON ?auto_29826 ?auto_29824 ) ( ON ?auto_29825 ?auto_29826 ) ( not ( = ?auto_29824 ?auto_29826 ) ) ( not ( = ?auto_29824 ?auto_29825 ) ) ( not ( = ?auto_29824 ?auto_29823 ) ) ( not ( = ?auto_29824 ?auto_29822 ) ) ( not ( = ?auto_29826 ?auto_29825 ) ) ( not ( = ?auto_29826 ?auto_29823 ) ) ( not ( = ?auto_29826 ?auto_29822 ) ) ( not ( = ?auto_29821 ?auto_29824 ) ) ( not ( = ?auto_29821 ?auto_29826 ) ) ( ON ?auto_29821 ?auto_29822 ) ( CLEAR ?auto_29821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29824 ?auto_29826 ?auto_29825 ?auto_29823 ?auto_29822 )
      ( MAKE-3PILE ?auto_29821 ?auto_29822 ?auto_29823 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29829 - BLOCK
      ?auto_29830 - BLOCK
    )
    :vars
    (
      ?auto_29831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29831 ?auto_29830 ) ( CLEAR ?auto_29831 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29829 ) ( ON ?auto_29830 ?auto_29829 ) ( not ( = ?auto_29829 ?auto_29830 ) ) ( not ( = ?auto_29829 ?auto_29831 ) ) ( not ( = ?auto_29830 ?auto_29831 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29831 ?auto_29830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29832 - BLOCK
      ?auto_29833 - BLOCK
    )
    :vars
    (
      ?auto_29834 - BLOCK
      ?auto_29835 - BLOCK
      ?auto_29836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29834 ?auto_29833 ) ( CLEAR ?auto_29834 ) ( ON-TABLE ?auto_29832 ) ( ON ?auto_29833 ?auto_29832 ) ( not ( = ?auto_29832 ?auto_29833 ) ) ( not ( = ?auto_29832 ?auto_29834 ) ) ( not ( = ?auto_29833 ?auto_29834 ) ) ( HOLDING ?auto_29835 ) ( CLEAR ?auto_29836 ) ( not ( = ?auto_29832 ?auto_29835 ) ) ( not ( = ?auto_29832 ?auto_29836 ) ) ( not ( = ?auto_29833 ?auto_29835 ) ) ( not ( = ?auto_29833 ?auto_29836 ) ) ( not ( = ?auto_29834 ?auto_29835 ) ) ( not ( = ?auto_29834 ?auto_29836 ) ) ( not ( = ?auto_29835 ?auto_29836 ) ) )
    :subtasks
    ( ( !STACK ?auto_29835 ?auto_29836 )
      ( MAKE-2PILE ?auto_29832 ?auto_29833 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29837 - BLOCK
      ?auto_29838 - BLOCK
    )
    :vars
    (
      ?auto_29841 - BLOCK
      ?auto_29839 - BLOCK
      ?auto_29840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29841 ?auto_29838 ) ( ON-TABLE ?auto_29837 ) ( ON ?auto_29838 ?auto_29837 ) ( not ( = ?auto_29837 ?auto_29838 ) ) ( not ( = ?auto_29837 ?auto_29841 ) ) ( not ( = ?auto_29838 ?auto_29841 ) ) ( CLEAR ?auto_29839 ) ( not ( = ?auto_29837 ?auto_29840 ) ) ( not ( = ?auto_29837 ?auto_29839 ) ) ( not ( = ?auto_29838 ?auto_29840 ) ) ( not ( = ?auto_29838 ?auto_29839 ) ) ( not ( = ?auto_29841 ?auto_29840 ) ) ( not ( = ?auto_29841 ?auto_29839 ) ) ( not ( = ?auto_29840 ?auto_29839 ) ) ( ON ?auto_29840 ?auto_29841 ) ( CLEAR ?auto_29840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29837 ?auto_29838 ?auto_29841 )
      ( MAKE-2PILE ?auto_29837 ?auto_29838 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29842 - BLOCK
      ?auto_29843 - BLOCK
    )
    :vars
    (
      ?auto_29845 - BLOCK
      ?auto_29844 - BLOCK
      ?auto_29846 - BLOCK
      ?auto_29847 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29845 ?auto_29843 ) ( ON-TABLE ?auto_29842 ) ( ON ?auto_29843 ?auto_29842 ) ( not ( = ?auto_29842 ?auto_29843 ) ) ( not ( = ?auto_29842 ?auto_29845 ) ) ( not ( = ?auto_29843 ?auto_29845 ) ) ( not ( = ?auto_29842 ?auto_29844 ) ) ( not ( = ?auto_29842 ?auto_29846 ) ) ( not ( = ?auto_29843 ?auto_29844 ) ) ( not ( = ?auto_29843 ?auto_29846 ) ) ( not ( = ?auto_29845 ?auto_29844 ) ) ( not ( = ?auto_29845 ?auto_29846 ) ) ( not ( = ?auto_29844 ?auto_29846 ) ) ( ON ?auto_29844 ?auto_29845 ) ( CLEAR ?auto_29844 ) ( HOLDING ?auto_29846 ) ( CLEAR ?auto_29847 ) ( ON-TABLE ?auto_29847 ) ( not ( = ?auto_29847 ?auto_29846 ) ) ( not ( = ?auto_29842 ?auto_29847 ) ) ( not ( = ?auto_29843 ?auto_29847 ) ) ( not ( = ?auto_29845 ?auto_29847 ) ) ( not ( = ?auto_29844 ?auto_29847 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29847 ?auto_29846 )
      ( MAKE-2PILE ?auto_29842 ?auto_29843 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29848 - BLOCK
      ?auto_29849 - BLOCK
    )
    :vars
    (
      ?auto_29852 - BLOCK
      ?auto_29850 - BLOCK
      ?auto_29851 - BLOCK
      ?auto_29853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29852 ?auto_29849 ) ( ON-TABLE ?auto_29848 ) ( ON ?auto_29849 ?auto_29848 ) ( not ( = ?auto_29848 ?auto_29849 ) ) ( not ( = ?auto_29848 ?auto_29852 ) ) ( not ( = ?auto_29849 ?auto_29852 ) ) ( not ( = ?auto_29848 ?auto_29850 ) ) ( not ( = ?auto_29848 ?auto_29851 ) ) ( not ( = ?auto_29849 ?auto_29850 ) ) ( not ( = ?auto_29849 ?auto_29851 ) ) ( not ( = ?auto_29852 ?auto_29850 ) ) ( not ( = ?auto_29852 ?auto_29851 ) ) ( not ( = ?auto_29850 ?auto_29851 ) ) ( ON ?auto_29850 ?auto_29852 ) ( CLEAR ?auto_29853 ) ( ON-TABLE ?auto_29853 ) ( not ( = ?auto_29853 ?auto_29851 ) ) ( not ( = ?auto_29848 ?auto_29853 ) ) ( not ( = ?auto_29849 ?auto_29853 ) ) ( not ( = ?auto_29852 ?auto_29853 ) ) ( not ( = ?auto_29850 ?auto_29853 ) ) ( ON ?auto_29851 ?auto_29850 ) ( CLEAR ?auto_29851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29848 ?auto_29849 ?auto_29852 ?auto_29850 )
      ( MAKE-2PILE ?auto_29848 ?auto_29849 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29854 - BLOCK
      ?auto_29855 - BLOCK
    )
    :vars
    (
      ?auto_29857 - BLOCK
      ?auto_29856 - BLOCK
      ?auto_29858 - BLOCK
      ?auto_29859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29857 ?auto_29855 ) ( ON-TABLE ?auto_29854 ) ( ON ?auto_29855 ?auto_29854 ) ( not ( = ?auto_29854 ?auto_29855 ) ) ( not ( = ?auto_29854 ?auto_29857 ) ) ( not ( = ?auto_29855 ?auto_29857 ) ) ( not ( = ?auto_29854 ?auto_29856 ) ) ( not ( = ?auto_29854 ?auto_29858 ) ) ( not ( = ?auto_29855 ?auto_29856 ) ) ( not ( = ?auto_29855 ?auto_29858 ) ) ( not ( = ?auto_29857 ?auto_29856 ) ) ( not ( = ?auto_29857 ?auto_29858 ) ) ( not ( = ?auto_29856 ?auto_29858 ) ) ( ON ?auto_29856 ?auto_29857 ) ( not ( = ?auto_29859 ?auto_29858 ) ) ( not ( = ?auto_29854 ?auto_29859 ) ) ( not ( = ?auto_29855 ?auto_29859 ) ) ( not ( = ?auto_29857 ?auto_29859 ) ) ( not ( = ?auto_29856 ?auto_29859 ) ) ( ON ?auto_29858 ?auto_29856 ) ( CLEAR ?auto_29858 ) ( HOLDING ?auto_29859 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29859 )
      ( MAKE-2PILE ?auto_29854 ?auto_29855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_29860 - BLOCK
      ?auto_29861 - BLOCK
    )
    :vars
    (
      ?auto_29863 - BLOCK
      ?auto_29862 - BLOCK
      ?auto_29865 - BLOCK
      ?auto_29864 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29863 ?auto_29861 ) ( ON-TABLE ?auto_29860 ) ( ON ?auto_29861 ?auto_29860 ) ( not ( = ?auto_29860 ?auto_29861 ) ) ( not ( = ?auto_29860 ?auto_29863 ) ) ( not ( = ?auto_29861 ?auto_29863 ) ) ( not ( = ?auto_29860 ?auto_29862 ) ) ( not ( = ?auto_29860 ?auto_29865 ) ) ( not ( = ?auto_29861 ?auto_29862 ) ) ( not ( = ?auto_29861 ?auto_29865 ) ) ( not ( = ?auto_29863 ?auto_29862 ) ) ( not ( = ?auto_29863 ?auto_29865 ) ) ( not ( = ?auto_29862 ?auto_29865 ) ) ( ON ?auto_29862 ?auto_29863 ) ( not ( = ?auto_29864 ?auto_29865 ) ) ( not ( = ?auto_29860 ?auto_29864 ) ) ( not ( = ?auto_29861 ?auto_29864 ) ) ( not ( = ?auto_29863 ?auto_29864 ) ) ( not ( = ?auto_29862 ?auto_29864 ) ) ( ON ?auto_29865 ?auto_29862 ) ( ON ?auto_29864 ?auto_29865 ) ( CLEAR ?auto_29864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29860 ?auto_29861 ?auto_29863 ?auto_29862 ?auto_29865 )
      ( MAKE-2PILE ?auto_29860 ?auto_29861 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29870 - BLOCK
      ?auto_29871 - BLOCK
      ?auto_29872 - BLOCK
      ?auto_29873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29873 ) ( CLEAR ?auto_29872 ) ( ON-TABLE ?auto_29870 ) ( ON ?auto_29871 ?auto_29870 ) ( ON ?auto_29872 ?auto_29871 ) ( not ( = ?auto_29870 ?auto_29871 ) ) ( not ( = ?auto_29870 ?auto_29872 ) ) ( not ( = ?auto_29870 ?auto_29873 ) ) ( not ( = ?auto_29871 ?auto_29872 ) ) ( not ( = ?auto_29871 ?auto_29873 ) ) ( not ( = ?auto_29872 ?auto_29873 ) ) )
    :subtasks
    ( ( !STACK ?auto_29873 ?auto_29872 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29874 - BLOCK
      ?auto_29875 - BLOCK
      ?auto_29876 - BLOCK
      ?auto_29877 - BLOCK
    )
    :vars
    (
      ?auto_29878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29876 ) ( ON-TABLE ?auto_29874 ) ( ON ?auto_29875 ?auto_29874 ) ( ON ?auto_29876 ?auto_29875 ) ( not ( = ?auto_29874 ?auto_29875 ) ) ( not ( = ?auto_29874 ?auto_29876 ) ) ( not ( = ?auto_29874 ?auto_29877 ) ) ( not ( = ?auto_29875 ?auto_29876 ) ) ( not ( = ?auto_29875 ?auto_29877 ) ) ( not ( = ?auto_29876 ?auto_29877 ) ) ( ON ?auto_29877 ?auto_29878 ) ( CLEAR ?auto_29877 ) ( HAND-EMPTY ) ( not ( = ?auto_29874 ?auto_29878 ) ) ( not ( = ?auto_29875 ?auto_29878 ) ) ( not ( = ?auto_29876 ?auto_29878 ) ) ( not ( = ?auto_29877 ?auto_29878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29877 ?auto_29878 )
      ( MAKE-4PILE ?auto_29874 ?auto_29875 ?auto_29876 ?auto_29877 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29879 - BLOCK
      ?auto_29880 - BLOCK
      ?auto_29881 - BLOCK
      ?auto_29882 - BLOCK
    )
    :vars
    (
      ?auto_29883 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29879 ) ( ON ?auto_29880 ?auto_29879 ) ( not ( = ?auto_29879 ?auto_29880 ) ) ( not ( = ?auto_29879 ?auto_29881 ) ) ( not ( = ?auto_29879 ?auto_29882 ) ) ( not ( = ?auto_29880 ?auto_29881 ) ) ( not ( = ?auto_29880 ?auto_29882 ) ) ( not ( = ?auto_29881 ?auto_29882 ) ) ( ON ?auto_29882 ?auto_29883 ) ( CLEAR ?auto_29882 ) ( not ( = ?auto_29879 ?auto_29883 ) ) ( not ( = ?auto_29880 ?auto_29883 ) ) ( not ( = ?auto_29881 ?auto_29883 ) ) ( not ( = ?auto_29882 ?auto_29883 ) ) ( HOLDING ?auto_29881 ) ( CLEAR ?auto_29880 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29879 ?auto_29880 ?auto_29881 )
      ( MAKE-4PILE ?auto_29879 ?auto_29880 ?auto_29881 ?auto_29882 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29884 - BLOCK
      ?auto_29885 - BLOCK
      ?auto_29886 - BLOCK
      ?auto_29887 - BLOCK
    )
    :vars
    (
      ?auto_29888 - BLOCK
      ?auto_29889 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29884 ) ( ON ?auto_29885 ?auto_29884 ) ( not ( = ?auto_29884 ?auto_29885 ) ) ( not ( = ?auto_29884 ?auto_29886 ) ) ( not ( = ?auto_29884 ?auto_29887 ) ) ( not ( = ?auto_29885 ?auto_29886 ) ) ( not ( = ?auto_29885 ?auto_29887 ) ) ( not ( = ?auto_29886 ?auto_29887 ) ) ( ON ?auto_29887 ?auto_29888 ) ( not ( = ?auto_29884 ?auto_29888 ) ) ( not ( = ?auto_29885 ?auto_29888 ) ) ( not ( = ?auto_29886 ?auto_29888 ) ) ( not ( = ?auto_29887 ?auto_29888 ) ) ( CLEAR ?auto_29885 ) ( ON ?auto_29886 ?auto_29887 ) ( CLEAR ?auto_29886 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29889 ) ( ON ?auto_29888 ?auto_29889 ) ( not ( = ?auto_29889 ?auto_29888 ) ) ( not ( = ?auto_29889 ?auto_29887 ) ) ( not ( = ?auto_29889 ?auto_29886 ) ) ( not ( = ?auto_29884 ?auto_29889 ) ) ( not ( = ?auto_29885 ?auto_29889 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29889 ?auto_29888 ?auto_29887 )
      ( MAKE-4PILE ?auto_29884 ?auto_29885 ?auto_29886 ?auto_29887 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29890 - BLOCK
      ?auto_29891 - BLOCK
      ?auto_29892 - BLOCK
      ?auto_29893 - BLOCK
    )
    :vars
    (
      ?auto_29895 - BLOCK
      ?auto_29894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29890 ) ( not ( = ?auto_29890 ?auto_29891 ) ) ( not ( = ?auto_29890 ?auto_29892 ) ) ( not ( = ?auto_29890 ?auto_29893 ) ) ( not ( = ?auto_29891 ?auto_29892 ) ) ( not ( = ?auto_29891 ?auto_29893 ) ) ( not ( = ?auto_29892 ?auto_29893 ) ) ( ON ?auto_29893 ?auto_29895 ) ( not ( = ?auto_29890 ?auto_29895 ) ) ( not ( = ?auto_29891 ?auto_29895 ) ) ( not ( = ?auto_29892 ?auto_29895 ) ) ( not ( = ?auto_29893 ?auto_29895 ) ) ( ON ?auto_29892 ?auto_29893 ) ( CLEAR ?auto_29892 ) ( ON-TABLE ?auto_29894 ) ( ON ?auto_29895 ?auto_29894 ) ( not ( = ?auto_29894 ?auto_29895 ) ) ( not ( = ?auto_29894 ?auto_29893 ) ) ( not ( = ?auto_29894 ?auto_29892 ) ) ( not ( = ?auto_29890 ?auto_29894 ) ) ( not ( = ?auto_29891 ?auto_29894 ) ) ( HOLDING ?auto_29891 ) ( CLEAR ?auto_29890 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29890 ?auto_29891 )
      ( MAKE-4PILE ?auto_29890 ?auto_29891 ?auto_29892 ?auto_29893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29896 - BLOCK
      ?auto_29897 - BLOCK
      ?auto_29898 - BLOCK
      ?auto_29899 - BLOCK
    )
    :vars
    (
      ?auto_29900 - BLOCK
      ?auto_29901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29896 ) ( not ( = ?auto_29896 ?auto_29897 ) ) ( not ( = ?auto_29896 ?auto_29898 ) ) ( not ( = ?auto_29896 ?auto_29899 ) ) ( not ( = ?auto_29897 ?auto_29898 ) ) ( not ( = ?auto_29897 ?auto_29899 ) ) ( not ( = ?auto_29898 ?auto_29899 ) ) ( ON ?auto_29899 ?auto_29900 ) ( not ( = ?auto_29896 ?auto_29900 ) ) ( not ( = ?auto_29897 ?auto_29900 ) ) ( not ( = ?auto_29898 ?auto_29900 ) ) ( not ( = ?auto_29899 ?auto_29900 ) ) ( ON ?auto_29898 ?auto_29899 ) ( ON-TABLE ?auto_29901 ) ( ON ?auto_29900 ?auto_29901 ) ( not ( = ?auto_29901 ?auto_29900 ) ) ( not ( = ?auto_29901 ?auto_29899 ) ) ( not ( = ?auto_29901 ?auto_29898 ) ) ( not ( = ?auto_29896 ?auto_29901 ) ) ( not ( = ?auto_29897 ?auto_29901 ) ) ( CLEAR ?auto_29896 ) ( ON ?auto_29897 ?auto_29898 ) ( CLEAR ?auto_29897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29901 ?auto_29900 ?auto_29899 ?auto_29898 )
      ( MAKE-4PILE ?auto_29896 ?auto_29897 ?auto_29898 ?auto_29899 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29902 - BLOCK
      ?auto_29903 - BLOCK
      ?auto_29904 - BLOCK
      ?auto_29905 - BLOCK
    )
    :vars
    (
      ?auto_29907 - BLOCK
      ?auto_29906 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29902 ?auto_29903 ) ) ( not ( = ?auto_29902 ?auto_29904 ) ) ( not ( = ?auto_29902 ?auto_29905 ) ) ( not ( = ?auto_29903 ?auto_29904 ) ) ( not ( = ?auto_29903 ?auto_29905 ) ) ( not ( = ?auto_29904 ?auto_29905 ) ) ( ON ?auto_29905 ?auto_29907 ) ( not ( = ?auto_29902 ?auto_29907 ) ) ( not ( = ?auto_29903 ?auto_29907 ) ) ( not ( = ?auto_29904 ?auto_29907 ) ) ( not ( = ?auto_29905 ?auto_29907 ) ) ( ON ?auto_29904 ?auto_29905 ) ( ON-TABLE ?auto_29906 ) ( ON ?auto_29907 ?auto_29906 ) ( not ( = ?auto_29906 ?auto_29907 ) ) ( not ( = ?auto_29906 ?auto_29905 ) ) ( not ( = ?auto_29906 ?auto_29904 ) ) ( not ( = ?auto_29902 ?auto_29906 ) ) ( not ( = ?auto_29903 ?auto_29906 ) ) ( ON ?auto_29903 ?auto_29904 ) ( CLEAR ?auto_29903 ) ( HOLDING ?auto_29902 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29902 )
      ( MAKE-4PILE ?auto_29902 ?auto_29903 ?auto_29904 ?auto_29905 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_29908 - BLOCK
      ?auto_29909 - BLOCK
      ?auto_29910 - BLOCK
      ?auto_29911 - BLOCK
    )
    :vars
    (
      ?auto_29913 - BLOCK
      ?auto_29912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_29908 ?auto_29909 ) ) ( not ( = ?auto_29908 ?auto_29910 ) ) ( not ( = ?auto_29908 ?auto_29911 ) ) ( not ( = ?auto_29909 ?auto_29910 ) ) ( not ( = ?auto_29909 ?auto_29911 ) ) ( not ( = ?auto_29910 ?auto_29911 ) ) ( ON ?auto_29911 ?auto_29913 ) ( not ( = ?auto_29908 ?auto_29913 ) ) ( not ( = ?auto_29909 ?auto_29913 ) ) ( not ( = ?auto_29910 ?auto_29913 ) ) ( not ( = ?auto_29911 ?auto_29913 ) ) ( ON ?auto_29910 ?auto_29911 ) ( ON-TABLE ?auto_29912 ) ( ON ?auto_29913 ?auto_29912 ) ( not ( = ?auto_29912 ?auto_29913 ) ) ( not ( = ?auto_29912 ?auto_29911 ) ) ( not ( = ?auto_29912 ?auto_29910 ) ) ( not ( = ?auto_29908 ?auto_29912 ) ) ( not ( = ?auto_29909 ?auto_29912 ) ) ( ON ?auto_29909 ?auto_29910 ) ( ON ?auto_29908 ?auto_29909 ) ( CLEAR ?auto_29908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29912 ?auto_29913 ?auto_29911 ?auto_29910 ?auto_29909 )
      ( MAKE-4PILE ?auto_29908 ?auto_29909 ?auto_29910 ?auto_29911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29915 - BLOCK
    )
    :vars
    (
      ?auto_29916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29916 ?auto_29915 ) ( CLEAR ?auto_29916 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29915 ) ( not ( = ?auto_29915 ?auto_29916 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29916 ?auto_29915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29917 - BLOCK
    )
    :vars
    (
      ?auto_29918 - BLOCK
      ?auto_29919 - BLOCK
      ?auto_29920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29918 ?auto_29917 ) ( CLEAR ?auto_29918 ) ( ON-TABLE ?auto_29917 ) ( not ( = ?auto_29917 ?auto_29918 ) ) ( HOLDING ?auto_29919 ) ( CLEAR ?auto_29920 ) ( not ( = ?auto_29917 ?auto_29919 ) ) ( not ( = ?auto_29917 ?auto_29920 ) ) ( not ( = ?auto_29918 ?auto_29919 ) ) ( not ( = ?auto_29918 ?auto_29920 ) ) ( not ( = ?auto_29919 ?auto_29920 ) ) )
    :subtasks
    ( ( !STACK ?auto_29919 ?auto_29920 )
      ( MAKE-1PILE ?auto_29917 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29921 - BLOCK
    )
    :vars
    (
      ?auto_29922 - BLOCK
      ?auto_29923 - BLOCK
      ?auto_29924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29922 ?auto_29921 ) ( ON-TABLE ?auto_29921 ) ( not ( = ?auto_29921 ?auto_29922 ) ) ( CLEAR ?auto_29923 ) ( not ( = ?auto_29921 ?auto_29924 ) ) ( not ( = ?auto_29921 ?auto_29923 ) ) ( not ( = ?auto_29922 ?auto_29924 ) ) ( not ( = ?auto_29922 ?auto_29923 ) ) ( not ( = ?auto_29924 ?auto_29923 ) ) ( ON ?auto_29924 ?auto_29922 ) ( CLEAR ?auto_29924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29921 ?auto_29922 )
      ( MAKE-1PILE ?auto_29921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29925 - BLOCK
    )
    :vars
    (
      ?auto_29926 - BLOCK
      ?auto_29928 - BLOCK
      ?auto_29927 - BLOCK
      ?auto_29929 - BLOCK
      ?auto_29930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29926 ?auto_29925 ) ( ON-TABLE ?auto_29925 ) ( not ( = ?auto_29925 ?auto_29926 ) ) ( not ( = ?auto_29925 ?auto_29928 ) ) ( not ( = ?auto_29925 ?auto_29927 ) ) ( not ( = ?auto_29926 ?auto_29928 ) ) ( not ( = ?auto_29926 ?auto_29927 ) ) ( not ( = ?auto_29928 ?auto_29927 ) ) ( ON ?auto_29928 ?auto_29926 ) ( CLEAR ?auto_29928 ) ( HOLDING ?auto_29927 ) ( CLEAR ?auto_29929 ) ( ON-TABLE ?auto_29930 ) ( ON ?auto_29929 ?auto_29930 ) ( not ( = ?auto_29930 ?auto_29929 ) ) ( not ( = ?auto_29930 ?auto_29927 ) ) ( not ( = ?auto_29929 ?auto_29927 ) ) ( not ( = ?auto_29925 ?auto_29929 ) ) ( not ( = ?auto_29925 ?auto_29930 ) ) ( not ( = ?auto_29926 ?auto_29929 ) ) ( not ( = ?auto_29926 ?auto_29930 ) ) ( not ( = ?auto_29928 ?auto_29929 ) ) ( not ( = ?auto_29928 ?auto_29930 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29930 ?auto_29929 ?auto_29927 )
      ( MAKE-1PILE ?auto_29925 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29931 - BLOCK
    )
    :vars
    (
      ?auto_29936 - BLOCK
      ?auto_29933 - BLOCK
      ?auto_29932 - BLOCK
      ?auto_29934 - BLOCK
      ?auto_29935 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29936 ?auto_29931 ) ( ON-TABLE ?auto_29931 ) ( not ( = ?auto_29931 ?auto_29936 ) ) ( not ( = ?auto_29931 ?auto_29933 ) ) ( not ( = ?auto_29931 ?auto_29932 ) ) ( not ( = ?auto_29936 ?auto_29933 ) ) ( not ( = ?auto_29936 ?auto_29932 ) ) ( not ( = ?auto_29933 ?auto_29932 ) ) ( ON ?auto_29933 ?auto_29936 ) ( CLEAR ?auto_29934 ) ( ON-TABLE ?auto_29935 ) ( ON ?auto_29934 ?auto_29935 ) ( not ( = ?auto_29935 ?auto_29934 ) ) ( not ( = ?auto_29935 ?auto_29932 ) ) ( not ( = ?auto_29934 ?auto_29932 ) ) ( not ( = ?auto_29931 ?auto_29934 ) ) ( not ( = ?auto_29931 ?auto_29935 ) ) ( not ( = ?auto_29936 ?auto_29934 ) ) ( not ( = ?auto_29936 ?auto_29935 ) ) ( not ( = ?auto_29933 ?auto_29934 ) ) ( not ( = ?auto_29933 ?auto_29935 ) ) ( ON ?auto_29932 ?auto_29933 ) ( CLEAR ?auto_29932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29931 ?auto_29936 ?auto_29933 )
      ( MAKE-1PILE ?auto_29931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29937 - BLOCK
    )
    :vars
    (
      ?auto_29940 - BLOCK
      ?auto_29938 - BLOCK
      ?auto_29942 - BLOCK
      ?auto_29939 - BLOCK
      ?auto_29941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29940 ?auto_29937 ) ( ON-TABLE ?auto_29937 ) ( not ( = ?auto_29937 ?auto_29940 ) ) ( not ( = ?auto_29937 ?auto_29938 ) ) ( not ( = ?auto_29937 ?auto_29942 ) ) ( not ( = ?auto_29940 ?auto_29938 ) ) ( not ( = ?auto_29940 ?auto_29942 ) ) ( not ( = ?auto_29938 ?auto_29942 ) ) ( ON ?auto_29938 ?auto_29940 ) ( ON-TABLE ?auto_29939 ) ( not ( = ?auto_29939 ?auto_29941 ) ) ( not ( = ?auto_29939 ?auto_29942 ) ) ( not ( = ?auto_29941 ?auto_29942 ) ) ( not ( = ?auto_29937 ?auto_29941 ) ) ( not ( = ?auto_29937 ?auto_29939 ) ) ( not ( = ?auto_29940 ?auto_29941 ) ) ( not ( = ?auto_29940 ?auto_29939 ) ) ( not ( = ?auto_29938 ?auto_29941 ) ) ( not ( = ?auto_29938 ?auto_29939 ) ) ( ON ?auto_29942 ?auto_29938 ) ( CLEAR ?auto_29942 ) ( HOLDING ?auto_29941 ) ( CLEAR ?auto_29939 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29939 ?auto_29941 )
      ( MAKE-1PILE ?auto_29937 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29943 - BLOCK
    )
    :vars
    (
      ?auto_29946 - BLOCK
      ?auto_29945 - BLOCK
      ?auto_29948 - BLOCK
      ?auto_29944 - BLOCK
      ?auto_29947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29946 ?auto_29943 ) ( ON-TABLE ?auto_29943 ) ( not ( = ?auto_29943 ?auto_29946 ) ) ( not ( = ?auto_29943 ?auto_29945 ) ) ( not ( = ?auto_29943 ?auto_29948 ) ) ( not ( = ?auto_29946 ?auto_29945 ) ) ( not ( = ?auto_29946 ?auto_29948 ) ) ( not ( = ?auto_29945 ?auto_29948 ) ) ( ON ?auto_29945 ?auto_29946 ) ( ON-TABLE ?auto_29944 ) ( not ( = ?auto_29944 ?auto_29947 ) ) ( not ( = ?auto_29944 ?auto_29948 ) ) ( not ( = ?auto_29947 ?auto_29948 ) ) ( not ( = ?auto_29943 ?auto_29947 ) ) ( not ( = ?auto_29943 ?auto_29944 ) ) ( not ( = ?auto_29946 ?auto_29947 ) ) ( not ( = ?auto_29946 ?auto_29944 ) ) ( not ( = ?auto_29945 ?auto_29947 ) ) ( not ( = ?auto_29945 ?auto_29944 ) ) ( ON ?auto_29948 ?auto_29945 ) ( CLEAR ?auto_29944 ) ( ON ?auto_29947 ?auto_29948 ) ( CLEAR ?auto_29947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29943 ?auto_29946 ?auto_29945 ?auto_29948 )
      ( MAKE-1PILE ?auto_29943 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29949 - BLOCK
    )
    :vars
    (
      ?auto_29954 - BLOCK
      ?auto_29951 - BLOCK
      ?auto_29952 - BLOCK
      ?auto_29950 - BLOCK
      ?auto_29953 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29954 ?auto_29949 ) ( ON-TABLE ?auto_29949 ) ( not ( = ?auto_29949 ?auto_29954 ) ) ( not ( = ?auto_29949 ?auto_29951 ) ) ( not ( = ?auto_29949 ?auto_29952 ) ) ( not ( = ?auto_29954 ?auto_29951 ) ) ( not ( = ?auto_29954 ?auto_29952 ) ) ( not ( = ?auto_29951 ?auto_29952 ) ) ( ON ?auto_29951 ?auto_29954 ) ( not ( = ?auto_29950 ?auto_29953 ) ) ( not ( = ?auto_29950 ?auto_29952 ) ) ( not ( = ?auto_29953 ?auto_29952 ) ) ( not ( = ?auto_29949 ?auto_29953 ) ) ( not ( = ?auto_29949 ?auto_29950 ) ) ( not ( = ?auto_29954 ?auto_29953 ) ) ( not ( = ?auto_29954 ?auto_29950 ) ) ( not ( = ?auto_29951 ?auto_29953 ) ) ( not ( = ?auto_29951 ?auto_29950 ) ) ( ON ?auto_29952 ?auto_29951 ) ( ON ?auto_29953 ?auto_29952 ) ( CLEAR ?auto_29953 ) ( HOLDING ?auto_29950 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_29950 )
      ( MAKE-1PILE ?auto_29949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_29955 - BLOCK
    )
    :vars
    (
      ?auto_29960 - BLOCK
      ?auto_29958 - BLOCK
      ?auto_29959 - BLOCK
      ?auto_29957 - BLOCK
      ?auto_29956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_29960 ?auto_29955 ) ( ON-TABLE ?auto_29955 ) ( not ( = ?auto_29955 ?auto_29960 ) ) ( not ( = ?auto_29955 ?auto_29958 ) ) ( not ( = ?auto_29955 ?auto_29959 ) ) ( not ( = ?auto_29960 ?auto_29958 ) ) ( not ( = ?auto_29960 ?auto_29959 ) ) ( not ( = ?auto_29958 ?auto_29959 ) ) ( ON ?auto_29958 ?auto_29960 ) ( not ( = ?auto_29957 ?auto_29956 ) ) ( not ( = ?auto_29957 ?auto_29959 ) ) ( not ( = ?auto_29956 ?auto_29959 ) ) ( not ( = ?auto_29955 ?auto_29956 ) ) ( not ( = ?auto_29955 ?auto_29957 ) ) ( not ( = ?auto_29960 ?auto_29956 ) ) ( not ( = ?auto_29960 ?auto_29957 ) ) ( not ( = ?auto_29958 ?auto_29956 ) ) ( not ( = ?auto_29958 ?auto_29957 ) ) ( ON ?auto_29959 ?auto_29958 ) ( ON ?auto_29956 ?auto_29959 ) ( ON ?auto_29957 ?auto_29956 ) ( CLEAR ?auto_29957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_29955 ?auto_29960 ?auto_29958 ?auto_29959 ?auto_29956 )
      ( MAKE-1PILE ?auto_29955 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29966 - BLOCK
      ?auto_29967 - BLOCK
      ?auto_29968 - BLOCK
      ?auto_29969 - BLOCK
      ?auto_29970 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_29970 ) ( CLEAR ?auto_29969 ) ( ON-TABLE ?auto_29966 ) ( ON ?auto_29967 ?auto_29966 ) ( ON ?auto_29968 ?auto_29967 ) ( ON ?auto_29969 ?auto_29968 ) ( not ( = ?auto_29966 ?auto_29967 ) ) ( not ( = ?auto_29966 ?auto_29968 ) ) ( not ( = ?auto_29966 ?auto_29969 ) ) ( not ( = ?auto_29966 ?auto_29970 ) ) ( not ( = ?auto_29967 ?auto_29968 ) ) ( not ( = ?auto_29967 ?auto_29969 ) ) ( not ( = ?auto_29967 ?auto_29970 ) ) ( not ( = ?auto_29968 ?auto_29969 ) ) ( not ( = ?auto_29968 ?auto_29970 ) ) ( not ( = ?auto_29969 ?auto_29970 ) ) )
    :subtasks
    ( ( !STACK ?auto_29970 ?auto_29969 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29971 - BLOCK
      ?auto_29972 - BLOCK
      ?auto_29973 - BLOCK
      ?auto_29974 - BLOCK
      ?auto_29975 - BLOCK
    )
    :vars
    (
      ?auto_29976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_29974 ) ( ON-TABLE ?auto_29971 ) ( ON ?auto_29972 ?auto_29971 ) ( ON ?auto_29973 ?auto_29972 ) ( ON ?auto_29974 ?auto_29973 ) ( not ( = ?auto_29971 ?auto_29972 ) ) ( not ( = ?auto_29971 ?auto_29973 ) ) ( not ( = ?auto_29971 ?auto_29974 ) ) ( not ( = ?auto_29971 ?auto_29975 ) ) ( not ( = ?auto_29972 ?auto_29973 ) ) ( not ( = ?auto_29972 ?auto_29974 ) ) ( not ( = ?auto_29972 ?auto_29975 ) ) ( not ( = ?auto_29973 ?auto_29974 ) ) ( not ( = ?auto_29973 ?auto_29975 ) ) ( not ( = ?auto_29974 ?auto_29975 ) ) ( ON ?auto_29975 ?auto_29976 ) ( CLEAR ?auto_29975 ) ( HAND-EMPTY ) ( not ( = ?auto_29971 ?auto_29976 ) ) ( not ( = ?auto_29972 ?auto_29976 ) ) ( not ( = ?auto_29973 ?auto_29976 ) ) ( not ( = ?auto_29974 ?auto_29976 ) ) ( not ( = ?auto_29975 ?auto_29976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_29975 ?auto_29976 )
      ( MAKE-5PILE ?auto_29971 ?auto_29972 ?auto_29973 ?auto_29974 ?auto_29975 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29977 - BLOCK
      ?auto_29978 - BLOCK
      ?auto_29979 - BLOCK
      ?auto_29980 - BLOCK
      ?auto_29981 - BLOCK
    )
    :vars
    (
      ?auto_29982 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29977 ) ( ON ?auto_29978 ?auto_29977 ) ( ON ?auto_29979 ?auto_29978 ) ( not ( = ?auto_29977 ?auto_29978 ) ) ( not ( = ?auto_29977 ?auto_29979 ) ) ( not ( = ?auto_29977 ?auto_29980 ) ) ( not ( = ?auto_29977 ?auto_29981 ) ) ( not ( = ?auto_29978 ?auto_29979 ) ) ( not ( = ?auto_29978 ?auto_29980 ) ) ( not ( = ?auto_29978 ?auto_29981 ) ) ( not ( = ?auto_29979 ?auto_29980 ) ) ( not ( = ?auto_29979 ?auto_29981 ) ) ( not ( = ?auto_29980 ?auto_29981 ) ) ( ON ?auto_29981 ?auto_29982 ) ( CLEAR ?auto_29981 ) ( not ( = ?auto_29977 ?auto_29982 ) ) ( not ( = ?auto_29978 ?auto_29982 ) ) ( not ( = ?auto_29979 ?auto_29982 ) ) ( not ( = ?auto_29980 ?auto_29982 ) ) ( not ( = ?auto_29981 ?auto_29982 ) ) ( HOLDING ?auto_29980 ) ( CLEAR ?auto_29979 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_29977 ?auto_29978 ?auto_29979 ?auto_29980 )
      ( MAKE-5PILE ?auto_29977 ?auto_29978 ?auto_29979 ?auto_29980 ?auto_29981 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29983 - BLOCK
      ?auto_29984 - BLOCK
      ?auto_29985 - BLOCK
      ?auto_29986 - BLOCK
      ?auto_29987 - BLOCK
    )
    :vars
    (
      ?auto_29988 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29983 ) ( ON ?auto_29984 ?auto_29983 ) ( ON ?auto_29985 ?auto_29984 ) ( not ( = ?auto_29983 ?auto_29984 ) ) ( not ( = ?auto_29983 ?auto_29985 ) ) ( not ( = ?auto_29983 ?auto_29986 ) ) ( not ( = ?auto_29983 ?auto_29987 ) ) ( not ( = ?auto_29984 ?auto_29985 ) ) ( not ( = ?auto_29984 ?auto_29986 ) ) ( not ( = ?auto_29984 ?auto_29987 ) ) ( not ( = ?auto_29985 ?auto_29986 ) ) ( not ( = ?auto_29985 ?auto_29987 ) ) ( not ( = ?auto_29986 ?auto_29987 ) ) ( ON ?auto_29987 ?auto_29988 ) ( not ( = ?auto_29983 ?auto_29988 ) ) ( not ( = ?auto_29984 ?auto_29988 ) ) ( not ( = ?auto_29985 ?auto_29988 ) ) ( not ( = ?auto_29986 ?auto_29988 ) ) ( not ( = ?auto_29987 ?auto_29988 ) ) ( CLEAR ?auto_29985 ) ( ON ?auto_29986 ?auto_29987 ) ( CLEAR ?auto_29986 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_29988 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_29988 ?auto_29987 )
      ( MAKE-5PILE ?auto_29983 ?auto_29984 ?auto_29985 ?auto_29986 ?auto_29987 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29989 - BLOCK
      ?auto_29990 - BLOCK
      ?auto_29991 - BLOCK
      ?auto_29992 - BLOCK
      ?auto_29993 - BLOCK
    )
    :vars
    (
      ?auto_29994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29989 ) ( ON ?auto_29990 ?auto_29989 ) ( not ( = ?auto_29989 ?auto_29990 ) ) ( not ( = ?auto_29989 ?auto_29991 ) ) ( not ( = ?auto_29989 ?auto_29992 ) ) ( not ( = ?auto_29989 ?auto_29993 ) ) ( not ( = ?auto_29990 ?auto_29991 ) ) ( not ( = ?auto_29990 ?auto_29992 ) ) ( not ( = ?auto_29990 ?auto_29993 ) ) ( not ( = ?auto_29991 ?auto_29992 ) ) ( not ( = ?auto_29991 ?auto_29993 ) ) ( not ( = ?auto_29992 ?auto_29993 ) ) ( ON ?auto_29993 ?auto_29994 ) ( not ( = ?auto_29989 ?auto_29994 ) ) ( not ( = ?auto_29990 ?auto_29994 ) ) ( not ( = ?auto_29991 ?auto_29994 ) ) ( not ( = ?auto_29992 ?auto_29994 ) ) ( not ( = ?auto_29993 ?auto_29994 ) ) ( ON ?auto_29992 ?auto_29993 ) ( CLEAR ?auto_29992 ) ( ON-TABLE ?auto_29994 ) ( HOLDING ?auto_29991 ) ( CLEAR ?auto_29990 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_29989 ?auto_29990 ?auto_29991 )
      ( MAKE-5PILE ?auto_29989 ?auto_29990 ?auto_29991 ?auto_29992 ?auto_29993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_29995 - BLOCK
      ?auto_29996 - BLOCK
      ?auto_29997 - BLOCK
      ?auto_29998 - BLOCK
      ?auto_29999 - BLOCK
    )
    :vars
    (
      ?auto_30000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_29995 ) ( ON ?auto_29996 ?auto_29995 ) ( not ( = ?auto_29995 ?auto_29996 ) ) ( not ( = ?auto_29995 ?auto_29997 ) ) ( not ( = ?auto_29995 ?auto_29998 ) ) ( not ( = ?auto_29995 ?auto_29999 ) ) ( not ( = ?auto_29996 ?auto_29997 ) ) ( not ( = ?auto_29996 ?auto_29998 ) ) ( not ( = ?auto_29996 ?auto_29999 ) ) ( not ( = ?auto_29997 ?auto_29998 ) ) ( not ( = ?auto_29997 ?auto_29999 ) ) ( not ( = ?auto_29998 ?auto_29999 ) ) ( ON ?auto_29999 ?auto_30000 ) ( not ( = ?auto_29995 ?auto_30000 ) ) ( not ( = ?auto_29996 ?auto_30000 ) ) ( not ( = ?auto_29997 ?auto_30000 ) ) ( not ( = ?auto_29998 ?auto_30000 ) ) ( not ( = ?auto_29999 ?auto_30000 ) ) ( ON ?auto_29998 ?auto_29999 ) ( ON-TABLE ?auto_30000 ) ( CLEAR ?auto_29996 ) ( ON ?auto_29997 ?auto_29998 ) ( CLEAR ?auto_29997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30000 ?auto_29999 ?auto_29998 )
      ( MAKE-5PILE ?auto_29995 ?auto_29996 ?auto_29997 ?auto_29998 ?auto_29999 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30001 - BLOCK
      ?auto_30002 - BLOCK
      ?auto_30003 - BLOCK
      ?auto_30004 - BLOCK
      ?auto_30005 - BLOCK
    )
    :vars
    (
      ?auto_30006 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30001 ) ( not ( = ?auto_30001 ?auto_30002 ) ) ( not ( = ?auto_30001 ?auto_30003 ) ) ( not ( = ?auto_30001 ?auto_30004 ) ) ( not ( = ?auto_30001 ?auto_30005 ) ) ( not ( = ?auto_30002 ?auto_30003 ) ) ( not ( = ?auto_30002 ?auto_30004 ) ) ( not ( = ?auto_30002 ?auto_30005 ) ) ( not ( = ?auto_30003 ?auto_30004 ) ) ( not ( = ?auto_30003 ?auto_30005 ) ) ( not ( = ?auto_30004 ?auto_30005 ) ) ( ON ?auto_30005 ?auto_30006 ) ( not ( = ?auto_30001 ?auto_30006 ) ) ( not ( = ?auto_30002 ?auto_30006 ) ) ( not ( = ?auto_30003 ?auto_30006 ) ) ( not ( = ?auto_30004 ?auto_30006 ) ) ( not ( = ?auto_30005 ?auto_30006 ) ) ( ON ?auto_30004 ?auto_30005 ) ( ON-TABLE ?auto_30006 ) ( ON ?auto_30003 ?auto_30004 ) ( CLEAR ?auto_30003 ) ( HOLDING ?auto_30002 ) ( CLEAR ?auto_30001 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30001 ?auto_30002 )
      ( MAKE-5PILE ?auto_30001 ?auto_30002 ?auto_30003 ?auto_30004 ?auto_30005 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30007 - BLOCK
      ?auto_30008 - BLOCK
      ?auto_30009 - BLOCK
      ?auto_30010 - BLOCK
      ?auto_30011 - BLOCK
    )
    :vars
    (
      ?auto_30012 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30007 ) ( not ( = ?auto_30007 ?auto_30008 ) ) ( not ( = ?auto_30007 ?auto_30009 ) ) ( not ( = ?auto_30007 ?auto_30010 ) ) ( not ( = ?auto_30007 ?auto_30011 ) ) ( not ( = ?auto_30008 ?auto_30009 ) ) ( not ( = ?auto_30008 ?auto_30010 ) ) ( not ( = ?auto_30008 ?auto_30011 ) ) ( not ( = ?auto_30009 ?auto_30010 ) ) ( not ( = ?auto_30009 ?auto_30011 ) ) ( not ( = ?auto_30010 ?auto_30011 ) ) ( ON ?auto_30011 ?auto_30012 ) ( not ( = ?auto_30007 ?auto_30012 ) ) ( not ( = ?auto_30008 ?auto_30012 ) ) ( not ( = ?auto_30009 ?auto_30012 ) ) ( not ( = ?auto_30010 ?auto_30012 ) ) ( not ( = ?auto_30011 ?auto_30012 ) ) ( ON ?auto_30010 ?auto_30011 ) ( ON-TABLE ?auto_30012 ) ( ON ?auto_30009 ?auto_30010 ) ( CLEAR ?auto_30007 ) ( ON ?auto_30008 ?auto_30009 ) ( CLEAR ?auto_30008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30012 ?auto_30011 ?auto_30010 ?auto_30009 )
      ( MAKE-5PILE ?auto_30007 ?auto_30008 ?auto_30009 ?auto_30010 ?auto_30011 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30013 - BLOCK
      ?auto_30014 - BLOCK
      ?auto_30015 - BLOCK
      ?auto_30016 - BLOCK
      ?auto_30017 - BLOCK
    )
    :vars
    (
      ?auto_30018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30013 ?auto_30014 ) ) ( not ( = ?auto_30013 ?auto_30015 ) ) ( not ( = ?auto_30013 ?auto_30016 ) ) ( not ( = ?auto_30013 ?auto_30017 ) ) ( not ( = ?auto_30014 ?auto_30015 ) ) ( not ( = ?auto_30014 ?auto_30016 ) ) ( not ( = ?auto_30014 ?auto_30017 ) ) ( not ( = ?auto_30015 ?auto_30016 ) ) ( not ( = ?auto_30015 ?auto_30017 ) ) ( not ( = ?auto_30016 ?auto_30017 ) ) ( ON ?auto_30017 ?auto_30018 ) ( not ( = ?auto_30013 ?auto_30018 ) ) ( not ( = ?auto_30014 ?auto_30018 ) ) ( not ( = ?auto_30015 ?auto_30018 ) ) ( not ( = ?auto_30016 ?auto_30018 ) ) ( not ( = ?auto_30017 ?auto_30018 ) ) ( ON ?auto_30016 ?auto_30017 ) ( ON-TABLE ?auto_30018 ) ( ON ?auto_30015 ?auto_30016 ) ( ON ?auto_30014 ?auto_30015 ) ( CLEAR ?auto_30014 ) ( HOLDING ?auto_30013 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30013 )
      ( MAKE-5PILE ?auto_30013 ?auto_30014 ?auto_30015 ?auto_30016 ?auto_30017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30019 - BLOCK
      ?auto_30020 - BLOCK
      ?auto_30021 - BLOCK
      ?auto_30022 - BLOCK
      ?auto_30023 - BLOCK
    )
    :vars
    (
      ?auto_30024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30019 ?auto_30020 ) ) ( not ( = ?auto_30019 ?auto_30021 ) ) ( not ( = ?auto_30019 ?auto_30022 ) ) ( not ( = ?auto_30019 ?auto_30023 ) ) ( not ( = ?auto_30020 ?auto_30021 ) ) ( not ( = ?auto_30020 ?auto_30022 ) ) ( not ( = ?auto_30020 ?auto_30023 ) ) ( not ( = ?auto_30021 ?auto_30022 ) ) ( not ( = ?auto_30021 ?auto_30023 ) ) ( not ( = ?auto_30022 ?auto_30023 ) ) ( ON ?auto_30023 ?auto_30024 ) ( not ( = ?auto_30019 ?auto_30024 ) ) ( not ( = ?auto_30020 ?auto_30024 ) ) ( not ( = ?auto_30021 ?auto_30024 ) ) ( not ( = ?auto_30022 ?auto_30024 ) ) ( not ( = ?auto_30023 ?auto_30024 ) ) ( ON ?auto_30022 ?auto_30023 ) ( ON-TABLE ?auto_30024 ) ( ON ?auto_30021 ?auto_30022 ) ( ON ?auto_30020 ?auto_30021 ) ( ON ?auto_30019 ?auto_30020 ) ( CLEAR ?auto_30019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30024 ?auto_30023 ?auto_30022 ?auto_30021 ?auto_30020 )
      ( MAKE-5PILE ?auto_30019 ?auto_30020 ?auto_30021 ?auto_30022 ?auto_30023 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30029 - BLOCK
      ?auto_30030 - BLOCK
      ?auto_30031 - BLOCK
      ?auto_30032 - BLOCK
    )
    :vars
    (
      ?auto_30033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30033 ?auto_30032 ) ( CLEAR ?auto_30033 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30029 ) ( ON ?auto_30030 ?auto_30029 ) ( ON ?auto_30031 ?auto_30030 ) ( ON ?auto_30032 ?auto_30031 ) ( not ( = ?auto_30029 ?auto_30030 ) ) ( not ( = ?auto_30029 ?auto_30031 ) ) ( not ( = ?auto_30029 ?auto_30032 ) ) ( not ( = ?auto_30029 ?auto_30033 ) ) ( not ( = ?auto_30030 ?auto_30031 ) ) ( not ( = ?auto_30030 ?auto_30032 ) ) ( not ( = ?auto_30030 ?auto_30033 ) ) ( not ( = ?auto_30031 ?auto_30032 ) ) ( not ( = ?auto_30031 ?auto_30033 ) ) ( not ( = ?auto_30032 ?auto_30033 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30033 ?auto_30032 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30045 - BLOCK
      ?auto_30046 - BLOCK
      ?auto_30047 - BLOCK
      ?auto_30048 - BLOCK
    )
    :vars
    (
      ?auto_30049 - BLOCK
      ?auto_30050 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30045 ) ( ON ?auto_30046 ?auto_30045 ) ( ON ?auto_30047 ?auto_30046 ) ( not ( = ?auto_30045 ?auto_30046 ) ) ( not ( = ?auto_30045 ?auto_30047 ) ) ( not ( = ?auto_30045 ?auto_30048 ) ) ( not ( = ?auto_30045 ?auto_30049 ) ) ( not ( = ?auto_30046 ?auto_30047 ) ) ( not ( = ?auto_30046 ?auto_30048 ) ) ( not ( = ?auto_30046 ?auto_30049 ) ) ( not ( = ?auto_30047 ?auto_30048 ) ) ( not ( = ?auto_30047 ?auto_30049 ) ) ( not ( = ?auto_30048 ?auto_30049 ) ) ( ON ?auto_30049 ?auto_30050 ) ( CLEAR ?auto_30049 ) ( not ( = ?auto_30045 ?auto_30050 ) ) ( not ( = ?auto_30046 ?auto_30050 ) ) ( not ( = ?auto_30047 ?auto_30050 ) ) ( not ( = ?auto_30048 ?auto_30050 ) ) ( not ( = ?auto_30049 ?auto_30050 ) ) ( HOLDING ?auto_30048 ) ( CLEAR ?auto_30047 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30045 ?auto_30046 ?auto_30047 ?auto_30048 ?auto_30049 )
      ( MAKE-4PILE ?auto_30045 ?auto_30046 ?auto_30047 ?auto_30048 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30051 - BLOCK
      ?auto_30052 - BLOCK
      ?auto_30053 - BLOCK
      ?auto_30054 - BLOCK
    )
    :vars
    (
      ?auto_30055 - BLOCK
      ?auto_30056 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30051 ) ( ON ?auto_30052 ?auto_30051 ) ( ON ?auto_30053 ?auto_30052 ) ( not ( = ?auto_30051 ?auto_30052 ) ) ( not ( = ?auto_30051 ?auto_30053 ) ) ( not ( = ?auto_30051 ?auto_30054 ) ) ( not ( = ?auto_30051 ?auto_30055 ) ) ( not ( = ?auto_30052 ?auto_30053 ) ) ( not ( = ?auto_30052 ?auto_30054 ) ) ( not ( = ?auto_30052 ?auto_30055 ) ) ( not ( = ?auto_30053 ?auto_30054 ) ) ( not ( = ?auto_30053 ?auto_30055 ) ) ( not ( = ?auto_30054 ?auto_30055 ) ) ( ON ?auto_30055 ?auto_30056 ) ( not ( = ?auto_30051 ?auto_30056 ) ) ( not ( = ?auto_30052 ?auto_30056 ) ) ( not ( = ?auto_30053 ?auto_30056 ) ) ( not ( = ?auto_30054 ?auto_30056 ) ) ( not ( = ?auto_30055 ?auto_30056 ) ) ( CLEAR ?auto_30053 ) ( ON ?auto_30054 ?auto_30055 ) ( CLEAR ?auto_30054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30056 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30056 ?auto_30055 )
      ( MAKE-4PILE ?auto_30051 ?auto_30052 ?auto_30053 ?auto_30054 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30057 - BLOCK
      ?auto_30058 - BLOCK
      ?auto_30059 - BLOCK
      ?auto_30060 - BLOCK
    )
    :vars
    (
      ?auto_30061 - BLOCK
      ?auto_30062 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30057 ) ( ON ?auto_30058 ?auto_30057 ) ( not ( = ?auto_30057 ?auto_30058 ) ) ( not ( = ?auto_30057 ?auto_30059 ) ) ( not ( = ?auto_30057 ?auto_30060 ) ) ( not ( = ?auto_30057 ?auto_30061 ) ) ( not ( = ?auto_30058 ?auto_30059 ) ) ( not ( = ?auto_30058 ?auto_30060 ) ) ( not ( = ?auto_30058 ?auto_30061 ) ) ( not ( = ?auto_30059 ?auto_30060 ) ) ( not ( = ?auto_30059 ?auto_30061 ) ) ( not ( = ?auto_30060 ?auto_30061 ) ) ( ON ?auto_30061 ?auto_30062 ) ( not ( = ?auto_30057 ?auto_30062 ) ) ( not ( = ?auto_30058 ?auto_30062 ) ) ( not ( = ?auto_30059 ?auto_30062 ) ) ( not ( = ?auto_30060 ?auto_30062 ) ) ( not ( = ?auto_30061 ?auto_30062 ) ) ( ON ?auto_30060 ?auto_30061 ) ( CLEAR ?auto_30060 ) ( ON-TABLE ?auto_30062 ) ( HOLDING ?auto_30059 ) ( CLEAR ?auto_30058 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30057 ?auto_30058 ?auto_30059 )
      ( MAKE-4PILE ?auto_30057 ?auto_30058 ?auto_30059 ?auto_30060 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30063 - BLOCK
      ?auto_30064 - BLOCK
      ?auto_30065 - BLOCK
      ?auto_30066 - BLOCK
    )
    :vars
    (
      ?auto_30068 - BLOCK
      ?auto_30067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30063 ) ( ON ?auto_30064 ?auto_30063 ) ( not ( = ?auto_30063 ?auto_30064 ) ) ( not ( = ?auto_30063 ?auto_30065 ) ) ( not ( = ?auto_30063 ?auto_30066 ) ) ( not ( = ?auto_30063 ?auto_30068 ) ) ( not ( = ?auto_30064 ?auto_30065 ) ) ( not ( = ?auto_30064 ?auto_30066 ) ) ( not ( = ?auto_30064 ?auto_30068 ) ) ( not ( = ?auto_30065 ?auto_30066 ) ) ( not ( = ?auto_30065 ?auto_30068 ) ) ( not ( = ?auto_30066 ?auto_30068 ) ) ( ON ?auto_30068 ?auto_30067 ) ( not ( = ?auto_30063 ?auto_30067 ) ) ( not ( = ?auto_30064 ?auto_30067 ) ) ( not ( = ?auto_30065 ?auto_30067 ) ) ( not ( = ?auto_30066 ?auto_30067 ) ) ( not ( = ?auto_30068 ?auto_30067 ) ) ( ON ?auto_30066 ?auto_30068 ) ( ON-TABLE ?auto_30067 ) ( CLEAR ?auto_30064 ) ( ON ?auto_30065 ?auto_30066 ) ( CLEAR ?auto_30065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30067 ?auto_30068 ?auto_30066 )
      ( MAKE-4PILE ?auto_30063 ?auto_30064 ?auto_30065 ?auto_30066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30069 - BLOCK
      ?auto_30070 - BLOCK
      ?auto_30071 - BLOCK
      ?auto_30072 - BLOCK
    )
    :vars
    (
      ?auto_30073 - BLOCK
      ?auto_30074 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30069 ) ( not ( = ?auto_30069 ?auto_30070 ) ) ( not ( = ?auto_30069 ?auto_30071 ) ) ( not ( = ?auto_30069 ?auto_30072 ) ) ( not ( = ?auto_30069 ?auto_30073 ) ) ( not ( = ?auto_30070 ?auto_30071 ) ) ( not ( = ?auto_30070 ?auto_30072 ) ) ( not ( = ?auto_30070 ?auto_30073 ) ) ( not ( = ?auto_30071 ?auto_30072 ) ) ( not ( = ?auto_30071 ?auto_30073 ) ) ( not ( = ?auto_30072 ?auto_30073 ) ) ( ON ?auto_30073 ?auto_30074 ) ( not ( = ?auto_30069 ?auto_30074 ) ) ( not ( = ?auto_30070 ?auto_30074 ) ) ( not ( = ?auto_30071 ?auto_30074 ) ) ( not ( = ?auto_30072 ?auto_30074 ) ) ( not ( = ?auto_30073 ?auto_30074 ) ) ( ON ?auto_30072 ?auto_30073 ) ( ON-TABLE ?auto_30074 ) ( ON ?auto_30071 ?auto_30072 ) ( CLEAR ?auto_30071 ) ( HOLDING ?auto_30070 ) ( CLEAR ?auto_30069 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30069 ?auto_30070 )
      ( MAKE-4PILE ?auto_30069 ?auto_30070 ?auto_30071 ?auto_30072 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30075 - BLOCK
      ?auto_30076 - BLOCK
      ?auto_30077 - BLOCK
      ?auto_30078 - BLOCK
    )
    :vars
    (
      ?auto_30080 - BLOCK
      ?auto_30079 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30075 ) ( not ( = ?auto_30075 ?auto_30076 ) ) ( not ( = ?auto_30075 ?auto_30077 ) ) ( not ( = ?auto_30075 ?auto_30078 ) ) ( not ( = ?auto_30075 ?auto_30080 ) ) ( not ( = ?auto_30076 ?auto_30077 ) ) ( not ( = ?auto_30076 ?auto_30078 ) ) ( not ( = ?auto_30076 ?auto_30080 ) ) ( not ( = ?auto_30077 ?auto_30078 ) ) ( not ( = ?auto_30077 ?auto_30080 ) ) ( not ( = ?auto_30078 ?auto_30080 ) ) ( ON ?auto_30080 ?auto_30079 ) ( not ( = ?auto_30075 ?auto_30079 ) ) ( not ( = ?auto_30076 ?auto_30079 ) ) ( not ( = ?auto_30077 ?auto_30079 ) ) ( not ( = ?auto_30078 ?auto_30079 ) ) ( not ( = ?auto_30080 ?auto_30079 ) ) ( ON ?auto_30078 ?auto_30080 ) ( ON-TABLE ?auto_30079 ) ( ON ?auto_30077 ?auto_30078 ) ( CLEAR ?auto_30075 ) ( ON ?auto_30076 ?auto_30077 ) ( CLEAR ?auto_30076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30079 ?auto_30080 ?auto_30078 ?auto_30077 )
      ( MAKE-4PILE ?auto_30075 ?auto_30076 ?auto_30077 ?auto_30078 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30081 - BLOCK
      ?auto_30082 - BLOCK
      ?auto_30083 - BLOCK
      ?auto_30084 - BLOCK
    )
    :vars
    (
      ?auto_30086 - BLOCK
      ?auto_30085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30081 ?auto_30082 ) ) ( not ( = ?auto_30081 ?auto_30083 ) ) ( not ( = ?auto_30081 ?auto_30084 ) ) ( not ( = ?auto_30081 ?auto_30086 ) ) ( not ( = ?auto_30082 ?auto_30083 ) ) ( not ( = ?auto_30082 ?auto_30084 ) ) ( not ( = ?auto_30082 ?auto_30086 ) ) ( not ( = ?auto_30083 ?auto_30084 ) ) ( not ( = ?auto_30083 ?auto_30086 ) ) ( not ( = ?auto_30084 ?auto_30086 ) ) ( ON ?auto_30086 ?auto_30085 ) ( not ( = ?auto_30081 ?auto_30085 ) ) ( not ( = ?auto_30082 ?auto_30085 ) ) ( not ( = ?auto_30083 ?auto_30085 ) ) ( not ( = ?auto_30084 ?auto_30085 ) ) ( not ( = ?auto_30086 ?auto_30085 ) ) ( ON ?auto_30084 ?auto_30086 ) ( ON-TABLE ?auto_30085 ) ( ON ?auto_30083 ?auto_30084 ) ( ON ?auto_30082 ?auto_30083 ) ( CLEAR ?auto_30082 ) ( HOLDING ?auto_30081 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30081 )
      ( MAKE-4PILE ?auto_30081 ?auto_30082 ?auto_30083 ?auto_30084 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30087 - BLOCK
      ?auto_30088 - BLOCK
      ?auto_30089 - BLOCK
      ?auto_30090 - BLOCK
    )
    :vars
    (
      ?auto_30091 - BLOCK
      ?auto_30092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30087 ?auto_30088 ) ) ( not ( = ?auto_30087 ?auto_30089 ) ) ( not ( = ?auto_30087 ?auto_30090 ) ) ( not ( = ?auto_30087 ?auto_30091 ) ) ( not ( = ?auto_30088 ?auto_30089 ) ) ( not ( = ?auto_30088 ?auto_30090 ) ) ( not ( = ?auto_30088 ?auto_30091 ) ) ( not ( = ?auto_30089 ?auto_30090 ) ) ( not ( = ?auto_30089 ?auto_30091 ) ) ( not ( = ?auto_30090 ?auto_30091 ) ) ( ON ?auto_30091 ?auto_30092 ) ( not ( = ?auto_30087 ?auto_30092 ) ) ( not ( = ?auto_30088 ?auto_30092 ) ) ( not ( = ?auto_30089 ?auto_30092 ) ) ( not ( = ?auto_30090 ?auto_30092 ) ) ( not ( = ?auto_30091 ?auto_30092 ) ) ( ON ?auto_30090 ?auto_30091 ) ( ON-TABLE ?auto_30092 ) ( ON ?auto_30089 ?auto_30090 ) ( ON ?auto_30088 ?auto_30089 ) ( ON ?auto_30087 ?auto_30088 ) ( CLEAR ?auto_30087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30092 ?auto_30091 ?auto_30090 ?auto_30089 ?auto_30088 )
      ( MAKE-4PILE ?auto_30087 ?auto_30088 ?auto_30089 ?auto_30090 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30094 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30094 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30094 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30095 - BLOCK
    )
    :vars
    (
      ?auto_30096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30095 ?auto_30096 ) ( CLEAR ?auto_30095 ) ( HAND-EMPTY ) ( not ( = ?auto_30095 ?auto_30096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30095 ?auto_30096 )
      ( MAKE-1PILE ?auto_30095 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30097 - BLOCK
    )
    :vars
    (
      ?auto_30098 - BLOCK
      ?auto_30100 - BLOCK
      ?auto_30099 - BLOCK
      ?auto_30101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30097 ?auto_30098 ) ) ( HOLDING ?auto_30097 ) ( CLEAR ?auto_30098 ) ( ON-TABLE ?auto_30100 ) ( ON ?auto_30099 ?auto_30100 ) ( ON ?auto_30101 ?auto_30099 ) ( ON ?auto_30098 ?auto_30101 ) ( not ( = ?auto_30100 ?auto_30099 ) ) ( not ( = ?auto_30100 ?auto_30101 ) ) ( not ( = ?auto_30100 ?auto_30098 ) ) ( not ( = ?auto_30100 ?auto_30097 ) ) ( not ( = ?auto_30099 ?auto_30101 ) ) ( not ( = ?auto_30099 ?auto_30098 ) ) ( not ( = ?auto_30099 ?auto_30097 ) ) ( not ( = ?auto_30101 ?auto_30098 ) ) ( not ( = ?auto_30101 ?auto_30097 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30100 ?auto_30099 ?auto_30101 ?auto_30098 ?auto_30097 )
      ( MAKE-1PILE ?auto_30097 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30102 - BLOCK
    )
    :vars
    (
      ?auto_30103 - BLOCK
      ?auto_30105 - BLOCK
      ?auto_30104 - BLOCK
      ?auto_30106 - BLOCK
      ?auto_30107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30102 ?auto_30103 ) ) ( CLEAR ?auto_30103 ) ( ON-TABLE ?auto_30105 ) ( ON ?auto_30104 ?auto_30105 ) ( ON ?auto_30106 ?auto_30104 ) ( ON ?auto_30103 ?auto_30106 ) ( not ( = ?auto_30105 ?auto_30104 ) ) ( not ( = ?auto_30105 ?auto_30106 ) ) ( not ( = ?auto_30105 ?auto_30103 ) ) ( not ( = ?auto_30105 ?auto_30102 ) ) ( not ( = ?auto_30104 ?auto_30106 ) ) ( not ( = ?auto_30104 ?auto_30103 ) ) ( not ( = ?auto_30104 ?auto_30102 ) ) ( not ( = ?auto_30106 ?auto_30103 ) ) ( not ( = ?auto_30106 ?auto_30102 ) ) ( ON ?auto_30102 ?auto_30107 ) ( CLEAR ?auto_30102 ) ( HAND-EMPTY ) ( not ( = ?auto_30102 ?auto_30107 ) ) ( not ( = ?auto_30103 ?auto_30107 ) ) ( not ( = ?auto_30105 ?auto_30107 ) ) ( not ( = ?auto_30104 ?auto_30107 ) ) ( not ( = ?auto_30106 ?auto_30107 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30102 ?auto_30107 )
      ( MAKE-1PILE ?auto_30102 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30108 - BLOCK
    )
    :vars
    (
      ?auto_30113 - BLOCK
      ?auto_30112 - BLOCK
      ?auto_30111 - BLOCK
      ?auto_30109 - BLOCK
      ?auto_30110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30108 ?auto_30113 ) ) ( ON-TABLE ?auto_30112 ) ( ON ?auto_30111 ?auto_30112 ) ( ON ?auto_30109 ?auto_30111 ) ( not ( = ?auto_30112 ?auto_30111 ) ) ( not ( = ?auto_30112 ?auto_30109 ) ) ( not ( = ?auto_30112 ?auto_30113 ) ) ( not ( = ?auto_30112 ?auto_30108 ) ) ( not ( = ?auto_30111 ?auto_30109 ) ) ( not ( = ?auto_30111 ?auto_30113 ) ) ( not ( = ?auto_30111 ?auto_30108 ) ) ( not ( = ?auto_30109 ?auto_30113 ) ) ( not ( = ?auto_30109 ?auto_30108 ) ) ( ON ?auto_30108 ?auto_30110 ) ( CLEAR ?auto_30108 ) ( not ( = ?auto_30108 ?auto_30110 ) ) ( not ( = ?auto_30113 ?auto_30110 ) ) ( not ( = ?auto_30112 ?auto_30110 ) ) ( not ( = ?auto_30111 ?auto_30110 ) ) ( not ( = ?auto_30109 ?auto_30110 ) ) ( HOLDING ?auto_30113 ) ( CLEAR ?auto_30109 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30112 ?auto_30111 ?auto_30109 ?auto_30113 )
      ( MAKE-1PILE ?auto_30108 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30114 - BLOCK
    )
    :vars
    (
      ?auto_30117 - BLOCK
      ?auto_30118 - BLOCK
      ?auto_30115 - BLOCK
      ?auto_30119 - BLOCK
      ?auto_30116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30114 ?auto_30117 ) ) ( ON-TABLE ?auto_30118 ) ( ON ?auto_30115 ?auto_30118 ) ( ON ?auto_30119 ?auto_30115 ) ( not ( = ?auto_30118 ?auto_30115 ) ) ( not ( = ?auto_30118 ?auto_30119 ) ) ( not ( = ?auto_30118 ?auto_30117 ) ) ( not ( = ?auto_30118 ?auto_30114 ) ) ( not ( = ?auto_30115 ?auto_30119 ) ) ( not ( = ?auto_30115 ?auto_30117 ) ) ( not ( = ?auto_30115 ?auto_30114 ) ) ( not ( = ?auto_30119 ?auto_30117 ) ) ( not ( = ?auto_30119 ?auto_30114 ) ) ( ON ?auto_30114 ?auto_30116 ) ( not ( = ?auto_30114 ?auto_30116 ) ) ( not ( = ?auto_30117 ?auto_30116 ) ) ( not ( = ?auto_30118 ?auto_30116 ) ) ( not ( = ?auto_30115 ?auto_30116 ) ) ( not ( = ?auto_30119 ?auto_30116 ) ) ( CLEAR ?auto_30119 ) ( ON ?auto_30117 ?auto_30114 ) ( CLEAR ?auto_30117 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30116 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30116 ?auto_30114 )
      ( MAKE-1PILE ?auto_30114 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30120 - BLOCK
    )
    :vars
    (
      ?auto_30121 - BLOCK
      ?auto_30122 - BLOCK
      ?auto_30124 - BLOCK
      ?auto_30123 - BLOCK
      ?auto_30125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30120 ?auto_30121 ) ) ( ON-TABLE ?auto_30122 ) ( ON ?auto_30124 ?auto_30122 ) ( not ( = ?auto_30122 ?auto_30124 ) ) ( not ( = ?auto_30122 ?auto_30123 ) ) ( not ( = ?auto_30122 ?auto_30121 ) ) ( not ( = ?auto_30122 ?auto_30120 ) ) ( not ( = ?auto_30124 ?auto_30123 ) ) ( not ( = ?auto_30124 ?auto_30121 ) ) ( not ( = ?auto_30124 ?auto_30120 ) ) ( not ( = ?auto_30123 ?auto_30121 ) ) ( not ( = ?auto_30123 ?auto_30120 ) ) ( ON ?auto_30120 ?auto_30125 ) ( not ( = ?auto_30120 ?auto_30125 ) ) ( not ( = ?auto_30121 ?auto_30125 ) ) ( not ( = ?auto_30122 ?auto_30125 ) ) ( not ( = ?auto_30124 ?auto_30125 ) ) ( not ( = ?auto_30123 ?auto_30125 ) ) ( ON ?auto_30121 ?auto_30120 ) ( CLEAR ?auto_30121 ) ( ON-TABLE ?auto_30125 ) ( HOLDING ?auto_30123 ) ( CLEAR ?auto_30124 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30122 ?auto_30124 ?auto_30123 )
      ( MAKE-1PILE ?auto_30120 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30126 - BLOCK
    )
    :vars
    (
      ?auto_30129 - BLOCK
      ?auto_30131 - BLOCK
      ?auto_30130 - BLOCK
      ?auto_30128 - BLOCK
      ?auto_30127 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30126 ?auto_30129 ) ) ( ON-TABLE ?auto_30131 ) ( ON ?auto_30130 ?auto_30131 ) ( not ( = ?auto_30131 ?auto_30130 ) ) ( not ( = ?auto_30131 ?auto_30128 ) ) ( not ( = ?auto_30131 ?auto_30129 ) ) ( not ( = ?auto_30131 ?auto_30126 ) ) ( not ( = ?auto_30130 ?auto_30128 ) ) ( not ( = ?auto_30130 ?auto_30129 ) ) ( not ( = ?auto_30130 ?auto_30126 ) ) ( not ( = ?auto_30128 ?auto_30129 ) ) ( not ( = ?auto_30128 ?auto_30126 ) ) ( ON ?auto_30126 ?auto_30127 ) ( not ( = ?auto_30126 ?auto_30127 ) ) ( not ( = ?auto_30129 ?auto_30127 ) ) ( not ( = ?auto_30131 ?auto_30127 ) ) ( not ( = ?auto_30130 ?auto_30127 ) ) ( not ( = ?auto_30128 ?auto_30127 ) ) ( ON ?auto_30129 ?auto_30126 ) ( ON-TABLE ?auto_30127 ) ( CLEAR ?auto_30130 ) ( ON ?auto_30128 ?auto_30129 ) ( CLEAR ?auto_30128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30127 ?auto_30126 ?auto_30129 )
      ( MAKE-1PILE ?auto_30126 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30132 - BLOCK
    )
    :vars
    (
      ?auto_30136 - BLOCK
      ?auto_30133 - BLOCK
      ?auto_30134 - BLOCK
      ?auto_30137 - BLOCK
      ?auto_30135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30132 ?auto_30136 ) ) ( ON-TABLE ?auto_30133 ) ( not ( = ?auto_30133 ?auto_30134 ) ) ( not ( = ?auto_30133 ?auto_30137 ) ) ( not ( = ?auto_30133 ?auto_30136 ) ) ( not ( = ?auto_30133 ?auto_30132 ) ) ( not ( = ?auto_30134 ?auto_30137 ) ) ( not ( = ?auto_30134 ?auto_30136 ) ) ( not ( = ?auto_30134 ?auto_30132 ) ) ( not ( = ?auto_30137 ?auto_30136 ) ) ( not ( = ?auto_30137 ?auto_30132 ) ) ( ON ?auto_30132 ?auto_30135 ) ( not ( = ?auto_30132 ?auto_30135 ) ) ( not ( = ?auto_30136 ?auto_30135 ) ) ( not ( = ?auto_30133 ?auto_30135 ) ) ( not ( = ?auto_30134 ?auto_30135 ) ) ( not ( = ?auto_30137 ?auto_30135 ) ) ( ON ?auto_30136 ?auto_30132 ) ( ON-TABLE ?auto_30135 ) ( ON ?auto_30137 ?auto_30136 ) ( CLEAR ?auto_30137 ) ( HOLDING ?auto_30134 ) ( CLEAR ?auto_30133 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30133 ?auto_30134 )
      ( MAKE-1PILE ?auto_30132 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30138 - BLOCK
    )
    :vars
    (
      ?auto_30143 - BLOCK
      ?auto_30141 - BLOCK
      ?auto_30139 - BLOCK
      ?auto_30142 - BLOCK
      ?auto_30140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30138 ?auto_30143 ) ) ( ON-TABLE ?auto_30141 ) ( not ( = ?auto_30141 ?auto_30139 ) ) ( not ( = ?auto_30141 ?auto_30142 ) ) ( not ( = ?auto_30141 ?auto_30143 ) ) ( not ( = ?auto_30141 ?auto_30138 ) ) ( not ( = ?auto_30139 ?auto_30142 ) ) ( not ( = ?auto_30139 ?auto_30143 ) ) ( not ( = ?auto_30139 ?auto_30138 ) ) ( not ( = ?auto_30142 ?auto_30143 ) ) ( not ( = ?auto_30142 ?auto_30138 ) ) ( ON ?auto_30138 ?auto_30140 ) ( not ( = ?auto_30138 ?auto_30140 ) ) ( not ( = ?auto_30143 ?auto_30140 ) ) ( not ( = ?auto_30141 ?auto_30140 ) ) ( not ( = ?auto_30139 ?auto_30140 ) ) ( not ( = ?auto_30142 ?auto_30140 ) ) ( ON ?auto_30143 ?auto_30138 ) ( ON-TABLE ?auto_30140 ) ( ON ?auto_30142 ?auto_30143 ) ( CLEAR ?auto_30141 ) ( ON ?auto_30139 ?auto_30142 ) ( CLEAR ?auto_30139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30140 ?auto_30138 ?auto_30143 ?auto_30142 )
      ( MAKE-1PILE ?auto_30138 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30144 - BLOCK
    )
    :vars
    (
      ?auto_30147 - BLOCK
      ?auto_30145 - BLOCK
      ?auto_30149 - BLOCK
      ?auto_30148 - BLOCK
      ?auto_30146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30144 ?auto_30147 ) ) ( not ( = ?auto_30145 ?auto_30149 ) ) ( not ( = ?auto_30145 ?auto_30148 ) ) ( not ( = ?auto_30145 ?auto_30147 ) ) ( not ( = ?auto_30145 ?auto_30144 ) ) ( not ( = ?auto_30149 ?auto_30148 ) ) ( not ( = ?auto_30149 ?auto_30147 ) ) ( not ( = ?auto_30149 ?auto_30144 ) ) ( not ( = ?auto_30148 ?auto_30147 ) ) ( not ( = ?auto_30148 ?auto_30144 ) ) ( ON ?auto_30144 ?auto_30146 ) ( not ( = ?auto_30144 ?auto_30146 ) ) ( not ( = ?auto_30147 ?auto_30146 ) ) ( not ( = ?auto_30145 ?auto_30146 ) ) ( not ( = ?auto_30149 ?auto_30146 ) ) ( not ( = ?auto_30148 ?auto_30146 ) ) ( ON ?auto_30147 ?auto_30144 ) ( ON-TABLE ?auto_30146 ) ( ON ?auto_30148 ?auto_30147 ) ( ON ?auto_30149 ?auto_30148 ) ( CLEAR ?auto_30149 ) ( HOLDING ?auto_30145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30145 )
      ( MAKE-1PILE ?auto_30144 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30150 - BLOCK
    )
    :vars
    (
      ?auto_30155 - BLOCK
      ?auto_30151 - BLOCK
      ?auto_30152 - BLOCK
      ?auto_30153 - BLOCK
      ?auto_30154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30150 ?auto_30155 ) ) ( not ( = ?auto_30151 ?auto_30152 ) ) ( not ( = ?auto_30151 ?auto_30153 ) ) ( not ( = ?auto_30151 ?auto_30155 ) ) ( not ( = ?auto_30151 ?auto_30150 ) ) ( not ( = ?auto_30152 ?auto_30153 ) ) ( not ( = ?auto_30152 ?auto_30155 ) ) ( not ( = ?auto_30152 ?auto_30150 ) ) ( not ( = ?auto_30153 ?auto_30155 ) ) ( not ( = ?auto_30153 ?auto_30150 ) ) ( ON ?auto_30150 ?auto_30154 ) ( not ( = ?auto_30150 ?auto_30154 ) ) ( not ( = ?auto_30155 ?auto_30154 ) ) ( not ( = ?auto_30151 ?auto_30154 ) ) ( not ( = ?auto_30152 ?auto_30154 ) ) ( not ( = ?auto_30153 ?auto_30154 ) ) ( ON ?auto_30155 ?auto_30150 ) ( ON-TABLE ?auto_30154 ) ( ON ?auto_30153 ?auto_30155 ) ( ON ?auto_30152 ?auto_30153 ) ( ON ?auto_30151 ?auto_30152 ) ( CLEAR ?auto_30151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30154 ?auto_30150 ?auto_30155 ?auto_30153 ?auto_30152 )
      ( MAKE-1PILE ?auto_30150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30159 - BLOCK
      ?auto_30160 - BLOCK
      ?auto_30161 - BLOCK
    )
    :vars
    (
      ?auto_30162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30162 ?auto_30161 ) ( CLEAR ?auto_30162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30159 ) ( ON ?auto_30160 ?auto_30159 ) ( ON ?auto_30161 ?auto_30160 ) ( not ( = ?auto_30159 ?auto_30160 ) ) ( not ( = ?auto_30159 ?auto_30161 ) ) ( not ( = ?auto_30159 ?auto_30162 ) ) ( not ( = ?auto_30160 ?auto_30161 ) ) ( not ( = ?auto_30160 ?auto_30162 ) ) ( not ( = ?auto_30161 ?auto_30162 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30162 ?auto_30161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30163 - BLOCK
      ?auto_30164 - BLOCK
      ?auto_30165 - BLOCK
    )
    :vars
    (
      ?auto_30166 - BLOCK
      ?auto_30167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30166 ?auto_30165 ) ( CLEAR ?auto_30166 ) ( ON-TABLE ?auto_30163 ) ( ON ?auto_30164 ?auto_30163 ) ( ON ?auto_30165 ?auto_30164 ) ( not ( = ?auto_30163 ?auto_30164 ) ) ( not ( = ?auto_30163 ?auto_30165 ) ) ( not ( = ?auto_30163 ?auto_30166 ) ) ( not ( = ?auto_30164 ?auto_30165 ) ) ( not ( = ?auto_30164 ?auto_30166 ) ) ( not ( = ?auto_30165 ?auto_30166 ) ) ( HOLDING ?auto_30167 ) ( not ( = ?auto_30163 ?auto_30167 ) ) ( not ( = ?auto_30164 ?auto_30167 ) ) ( not ( = ?auto_30165 ?auto_30167 ) ) ( not ( = ?auto_30166 ?auto_30167 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_30167 )
      ( MAKE-3PILE ?auto_30163 ?auto_30164 ?auto_30165 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30168 - BLOCK
      ?auto_30169 - BLOCK
      ?auto_30170 - BLOCK
    )
    :vars
    (
      ?auto_30172 - BLOCK
      ?auto_30171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30172 ?auto_30170 ) ( ON-TABLE ?auto_30168 ) ( ON ?auto_30169 ?auto_30168 ) ( ON ?auto_30170 ?auto_30169 ) ( not ( = ?auto_30168 ?auto_30169 ) ) ( not ( = ?auto_30168 ?auto_30170 ) ) ( not ( = ?auto_30168 ?auto_30172 ) ) ( not ( = ?auto_30169 ?auto_30170 ) ) ( not ( = ?auto_30169 ?auto_30172 ) ) ( not ( = ?auto_30170 ?auto_30172 ) ) ( not ( = ?auto_30168 ?auto_30171 ) ) ( not ( = ?auto_30169 ?auto_30171 ) ) ( not ( = ?auto_30170 ?auto_30171 ) ) ( not ( = ?auto_30172 ?auto_30171 ) ) ( ON ?auto_30171 ?auto_30172 ) ( CLEAR ?auto_30171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30168 ?auto_30169 ?auto_30170 ?auto_30172 )
      ( MAKE-3PILE ?auto_30168 ?auto_30169 ?auto_30170 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30173 - BLOCK
      ?auto_30174 - BLOCK
      ?auto_30175 - BLOCK
    )
    :vars
    (
      ?auto_30177 - BLOCK
      ?auto_30176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30177 ?auto_30175 ) ( ON-TABLE ?auto_30173 ) ( ON ?auto_30174 ?auto_30173 ) ( ON ?auto_30175 ?auto_30174 ) ( not ( = ?auto_30173 ?auto_30174 ) ) ( not ( = ?auto_30173 ?auto_30175 ) ) ( not ( = ?auto_30173 ?auto_30177 ) ) ( not ( = ?auto_30174 ?auto_30175 ) ) ( not ( = ?auto_30174 ?auto_30177 ) ) ( not ( = ?auto_30175 ?auto_30177 ) ) ( not ( = ?auto_30173 ?auto_30176 ) ) ( not ( = ?auto_30174 ?auto_30176 ) ) ( not ( = ?auto_30175 ?auto_30176 ) ) ( not ( = ?auto_30177 ?auto_30176 ) ) ( HOLDING ?auto_30176 ) ( CLEAR ?auto_30177 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30173 ?auto_30174 ?auto_30175 ?auto_30177 ?auto_30176 )
      ( MAKE-3PILE ?auto_30173 ?auto_30174 ?auto_30175 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30178 - BLOCK
      ?auto_30179 - BLOCK
      ?auto_30180 - BLOCK
    )
    :vars
    (
      ?auto_30181 - BLOCK
      ?auto_30182 - BLOCK
      ?auto_30183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30181 ?auto_30180 ) ( ON-TABLE ?auto_30178 ) ( ON ?auto_30179 ?auto_30178 ) ( ON ?auto_30180 ?auto_30179 ) ( not ( = ?auto_30178 ?auto_30179 ) ) ( not ( = ?auto_30178 ?auto_30180 ) ) ( not ( = ?auto_30178 ?auto_30181 ) ) ( not ( = ?auto_30179 ?auto_30180 ) ) ( not ( = ?auto_30179 ?auto_30181 ) ) ( not ( = ?auto_30180 ?auto_30181 ) ) ( not ( = ?auto_30178 ?auto_30182 ) ) ( not ( = ?auto_30179 ?auto_30182 ) ) ( not ( = ?auto_30180 ?auto_30182 ) ) ( not ( = ?auto_30181 ?auto_30182 ) ) ( CLEAR ?auto_30181 ) ( ON ?auto_30182 ?auto_30183 ) ( CLEAR ?auto_30182 ) ( HAND-EMPTY ) ( not ( = ?auto_30178 ?auto_30183 ) ) ( not ( = ?auto_30179 ?auto_30183 ) ) ( not ( = ?auto_30180 ?auto_30183 ) ) ( not ( = ?auto_30181 ?auto_30183 ) ) ( not ( = ?auto_30182 ?auto_30183 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30182 ?auto_30183 )
      ( MAKE-3PILE ?auto_30178 ?auto_30179 ?auto_30180 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30196 - BLOCK
      ?auto_30197 - BLOCK
      ?auto_30198 - BLOCK
    )
    :vars
    (
      ?auto_30201 - BLOCK
      ?auto_30199 - BLOCK
      ?auto_30200 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30196 ) ( ON ?auto_30197 ?auto_30196 ) ( not ( = ?auto_30196 ?auto_30197 ) ) ( not ( = ?auto_30196 ?auto_30198 ) ) ( not ( = ?auto_30196 ?auto_30201 ) ) ( not ( = ?auto_30197 ?auto_30198 ) ) ( not ( = ?auto_30197 ?auto_30201 ) ) ( not ( = ?auto_30198 ?auto_30201 ) ) ( not ( = ?auto_30196 ?auto_30199 ) ) ( not ( = ?auto_30197 ?auto_30199 ) ) ( not ( = ?auto_30198 ?auto_30199 ) ) ( not ( = ?auto_30201 ?auto_30199 ) ) ( ON ?auto_30199 ?auto_30200 ) ( not ( = ?auto_30196 ?auto_30200 ) ) ( not ( = ?auto_30197 ?auto_30200 ) ) ( not ( = ?auto_30198 ?auto_30200 ) ) ( not ( = ?auto_30201 ?auto_30200 ) ) ( not ( = ?auto_30199 ?auto_30200 ) ) ( ON ?auto_30201 ?auto_30199 ) ( CLEAR ?auto_30201 ) ( HOLDING ?auto_30198 ) ( CLEAR ?auto_30197 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30196 ?auto_30197 ?auto_30198 ?auto_30201 )
      ( MAKE-3PILE ?auto_30196 ?auto_30197 ?auto_30198 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30202 - BLOCK
      ?auto_30203 - BLOCK
      ?auto_30204 - BLOCK
    )
    :vars
    (
      ?auto_30205 - BLOCK
      ?auto_30206 - BLOCK
      ?auto_30207 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30202 ) ( ON ?auto_30203 ?auto_30202 ) ( not ( = ?auto_30202 ?auto_30203 ) ) ( not ( = ?auto_30202 ?auto_30204 ) ) ( not ( = ?auto_30202 ?auto_30205 ) ) ( not ( = ?auto_30203 ?auto_30204 ) ) ( not ( = ?auto_30203 ?auto_30205 ) ) ( not ( = ?auto_30204 ?auto_30205 ) ) ( not ( = ?auto_30202 ?auto_30206 ) ) ( not ( = ?auto_30203 ?auto_30206 ) ) ( not ( = ?auto_30204 ?auto_30206 ) ) ( not ( = ?auto_30205 ?auto_30206 ) ) ( ON ?auto_30206 ?auto_30207 ) ( not ( = ?auto_30202 ?auto_30207 ) ) ( not ( = ?auto_30203 ?auto_30207 ) ) ( not ( = ?auto_30204 ?auto_30207 ) ) ( not ( = ?auto_30205 ?auto_30207 ) ) ( not ( = ?auto_30206 ?auto_30207 ) ) ( ON ?auto_30205 ?auto_30206 ) ( CLEAR ?auto_30203 ) ( ON ?auto_30204 ?auto_30205 ) ( CLEAR ?auto_30204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30207 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30207 ?auto_30206 ?auto_30205 )
      ( MAKE-3PILE ?auto_30202 ?auto_30203 ?auto_30204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30208 - BLOCK
      ?auto_30209 - BLOCK
      ?auto_30210 - BLOCK
    )
    :vars
    (
      ?auto_30213 - BLOCK
      ?auto_30211 - BLOCK
      ?auto_30212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30208 ) ( not ( = ?auto_30208 ?auto_30209 ) ) ( not ( = ?auto_30208 ?auto_30210 ) ) ( not ( = ?auto_30208 ?auto_30213 ) ) ( not ( = ?auto_30209 ?auto_30210 ) ) ( not ( = ?auto_30209 ?auto_30213 ) ) ( not ( = ?auto_30210 ?auto_30213 ) ) ( not ( = ?auto_30208 ?auto_30211 ) ) ( not ( = ?auto_30209 ?auto_30211 ) ) ( not ( = ?auto_30210 ?auto_30211 ) ) ( not ( = ?auto_30213 ?auto_30211 ) ) ( ON ?auto_30211 ?auto_30212 ) ( not ( = ?auto_30208 ?auto_30212 ) ) ( not ( = ?auto_30209 ?auto_30212 ) ) ( not ( = ?auto_30210 ?auto_30212 ) ) ( not ( = ?auto_30213 ?auto_30212 ) ) ( not ( = ?auto_30211 ?auto_30212 ) ) ( ON ?auto_30213 ?auto_30211 ) ( ON ?auto_30210 ?auto_30213 ) ( CLEAR ?auto_30210 ) ( ON-TABLE ?auto_30212 ) ( HOLDING ?auto_30209 ) ( CLEAR ?auto_30208 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30208 ?auto_30209 )
      ( MAKE-3PILE ?auto_30208 ?auto_30209 ?auto_30210 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30214 - BLOCK
      ?auto_30215 - BLOCK
      ?auto_30216 - BLOCK
    )
    :vars
    (
      ?auto_30218 - BLOCK
      ?auto_30219 - BLOCK
      ?auto_30217 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30214 ) ( not ( = ?auto_30214 ?auto_30215 ) ) ( not ( = ?auto_30214 ?auto_30216 ) ) ( not ( = ?auto_30214 ?auto_30218 ) ) ( not ( = ?auto_30215 ?auto_30216 ) ) ( not ( = ?auto_30215 ?auto_30218 ) ) ( not ( = ?auto_30216 ?auto_30218 ) ) ( not ( = ?auto_30214 ?auto_30219 ) ) ( not ( = ?auto_30215 ?auto_30219 ) ) ( not ( = ?auto_30216 ?auto_30219 ) ) ( not ( = ?auto_30218 ?auto_30219 ) ) ( ON ?auto_30219 ?auto_30217 ) ( not ( = ?auto_30214 ?auto_30217 ) ) ( not ( = ?auto_30215 ?auto_30217 ) ) ( not ( = ?auto_30216 ?auto_30217 ) ) ( not ( = ?auto_30218 ?auto_30217 ) ) ( not ( = ?auto_30219 ?auto_30217 ) ) ( ON ?auto_30218 ?auto_30219 ) ( ON ?auto_30216 ?auto_30218 ) ( ON-TABLE ?auto_30217 ) ( CLEAR ?auto_30214 ) ( ON ?auto_30215 ?auto_30216 ) ( CLEAR ?auto_30215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30217 ?auto_30219 ?auto_30218 ?auto_30216 )
      ( MAKE-3PILE ?auto_30214 ?auto_30215 ?auto_30216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30220 - BLOCK
      ?auto_30221 - BLOCK
      ?auto_30222 - BLOCK
    )
    :vars
    (
      ?auto_30223 - BLOCK
      ?auto_30225 - BLOCK
      ?auto_30224 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30220 ?auto_30221 ) ) ( not ( = ?auto_30220 ?auto_30222 ) ) ( not ( = ?auto_30220 ?auto_30223 ) ) ( not ( = ?auto_30221 ?auto_30222 ) ) ( not ( = ?auto_30221 ?auto_30223 ) ) ( not ( = ?auto_30222 ?auto_30223 ) ) ( not ( = ?auto_30220 ?auto_30225 ) ) ( not ( = ?auto_30221 ?auto_30225 ) ) ( not ( = ?auto_30222 ?auto_30225 ) ) ( not ( = ?auto_30223 ?auto_30225 ) ) ( ON ?auto_30225 ?auto_30224 ) ( not ( = ?auto_30220 ?auto_30224 ) ) ( not ( = ?auto_30221 ?auto_30224 ) ) ( not ( = ?auto_30222 ?auto_30224 ) ) ( not ( = ?auto_30223 ?auto_30224 ) ) ( not ( = ?auto_30225 ?auto_30224 ) ) ( ON ?auto_30223 ?auto_30225 ) ( ON ?auto_30222 ?auto_30223 ) ( ON-TABLE ?auto_30224 ) ( ON ?auto_30221 ?auto_30222 ) ( CLEAR ?auto_30221 ) ( HOLDING ?auto_30220 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30220 )
      ( MAKE-3PILE ?auto_30220 ?auto_30221 ?auto_30222 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30226 - BLOCK
      ?auto_30227 - BLOCK
      ?auto_30228 - BLOCK
    )
    :vars
    (
      ?auto_30231 - BLOCK
      ?auto_30229 - BLOCK
      ?auto_30230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30226 ?auto_30227 ) ) ( not ( = ?auto_30226 ?auto_30228 ) ) ( not ( = ?auto_30226 ?auto_30231 ) ) ( not ( = ?auto_30227 ?auto_30228 ) ) ( not ( = ?auto_30227 ?auto_30231 ) ) ( not ( = ?auto_30228 ?auto_30231 ) ) ( not ( = ?auto_30226 ?auto_30229 ) ) ( not ( = ?auto_30227 ?auto_30229 ) ) ( not ( = ?auto_30228 ?auto_30229 ) ) ( not ( = ?auto_30231 ?auto_30229 ) ) ( ON ?auto_30229 ?auto_30230 ) ( not ( = ?auto_30226 ?auto_30230 ) ) ( not ( = ?auto_30227 ?auto_30230 ) ) ( not ( = ?auto_30228 ?auto_30230 ) ) ( not ( = ?auto_30231 ?auto_30230 ) ) ( not ( = ?auto_30229 ?auto_30230 ) ) ( ON ?auto_30231 ?auto_30229 ) ( ON ?auto_30228 ?auto_30231 ) ( ON-TABLE ?auto_30230 ) ( ON ?auto_30227 ?auto_30228 ) ( ON ?auto_30226 ?auto_30227 ) ( CLEAR ?auto_30226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30230 ?auto_30229 ?auto_30231 ?auto_30228 ?auto_30227 )
      ( MAKE-3PILE ?auto_30226 ?auto_30227 ?auto_30228 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30234 - BLOCK
      ?auto_30235 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30235 ) ( CLEAR ?auto_30234 ) ( ON-TABLE ?auto_30234 ) ( not ( = ?auto_30234 ?auto_30235 ) ) )
    :subtasks
    ( ( !STACK ?auto_30235 ?auto_30234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30236 - BLOCK
      ?auto_30237 - BLOCK
    )
    :vars
    (
      ?auto_30238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30236 ) ( ON-TABLE ?auto_30236 ) ( not ( = ?auto_30236 ?auto_30237 ) ) ( ON ?auto_30237 ?auto_30238 ) ( CLEAR ?auto_30237 ) ( HAND-EMPTY ) ( not ( = ?auto_30236 ?auto_30238 ) ) ( not ( = ?auto_30237 ?auto_30238 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30237 ?auto_30238 )
      ( MAKE-2PILE ?auto_30236 ?auto_30237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30239 - BLOCK
      ?auto_30240 - BLOCK
    )
    :vars
    (
      ?auto_30241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30239 ?auto_30240 ) ) ( ON ?auto_30240 ?auto_30241 ) ( CLEAR ?auto_30240 ) ( not ( = ?auto_30239 ?auto_30241 ) ) ( not ( = ?auto_30240 ?auto_30241 ) ) ( HOLDING ?auto_30239 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30239 )
      ( MAKE-2PILE ?auto_30239 ?auto_30240 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30242 - BLOCK
      ?auto_30243 - BLOCK
    )
    :vars
    (
      ?auto_30244 - BLOCK
      ?auto_30246 - BLOCK
      ?auto_30245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30242 ?auto_30243 ) ) ( ON ?auto_30243 ?auto_30244 ) ( not ( = ?auto_30242 ?auto_30244 ) ) ( not ( = ?auto_30243 ?auto_30244 ) ) ( ON ?auto_30242 ?auto_30243 ) ( CLEAR ?auto_30242 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30246 ) ( ON ?auto_30245 ?auto_30246 ) ( ON ?auto_30244 ?auto_30245 ) ( not ( = ?auto_30246 ?auto_30245 ) ) ( not ( = ?auto_30246 ?auto_30244 ) ) ( not ( = ?auto_30246 ?auto_30243 ) ) ( not ( = ?auto_30246 ?auto_30242 ) ) ( not ( = ?auto_30245 ?auto_30244 ) ) ( not ( = ?auto_30245 ?auto_30243 ) ) ( not ( = ?auto_30245 ?auto_30242 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30246 ?auto_30245 ?auto_30244 ?auto_30243 )
      ( MAKE-2PILE ?auto_30242 ?auto_30243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30247 - BLOCK
      ?auto_30248 - BLOCK
    )
    :vars
    (
      ?auto_30250 - BLOCK
      ?auto_30251 - BLOCK
      ?auto_30249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30247 ?auto_30248 ) ) ( ON ?auto_30248 ?auto_30250 ) ( not ( = ?auto_30247 ?auto_30250 ) ) ( not ( = ?auto_30248 ?auto_30250 ) ) ( ON-TABLE ?auto_30251 ) ( ON ?auto_30249 ?auto_30251 ) ( ON ?auto_30250 ?auto_30249 ) ( not ( = ?auto_30251 ?auto_30249 ) ) ( not ( = ?auto_30251 ?auto_30250 ) ) ( not ( = ?auto_30251 ?auto_30248 ) ) ( not ( = ?auto_30251 ?auto_30247 ) ) ( not ( = ?auto_30249 ?auto_30250 ) ) ( not ( = ?auto_30249 ?auto_30248 ) ) ( not ( = ?auto_30249 ?auto_30247 ) ) ( HOLDING ?auto_30247 ) ( CLEAR ?auto_30248 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30251 ?auto_30249 ?auto_30250 ?auto_30248 ?auto_30247 )
      ( MAKE-2PILE ?auto_30247 ?auto_30248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30252 - BLOCK
      ?auto_30253 - BLOCK
    )
    :vars
    (
      ?auto_30256 - BLOCK
      ?auto_30254 - BLOCK
      ?auto_30255 - BLOCK
      ?auto_30257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30252 ?auto_30253 ) ) ( ON ?auto_30253 ?auto_30256 ) ( not ( = ?auto_30252 ?auto_30256 ) ) ( not ( = ?auto_30253 ?auto_30256 ) ) ( ON-TABLE ?auto_30254 ) ( ON ?auto_30255 ?auto_30254 ) ( ON ?auto_30256 ?auto_30255 ) ( not ( = ?auto_30254 ?auto_30255 ) ) ( not ( = ?auto_30254 ?auto_30256 ) ) ( not ( = ?auto_30254 ?auto_30253 ) ) ( not ( = ?auto_30254 ?auto_30252 ) ) ( not ( = ?auto_30255 ?auto_30256 ) ) ( not ( = ?auto_30255 ?auto_30253 ) ) ( not ( = ?auto_30255 ?auto_30252 ) ) ( CLEAR ?auto_30253 ) ( ON ?auto_30252 ?auto_30257 ) ( CLEAR ?auto_30252 ) ( HAND-EMPTY ) ( not ( = ?auto_30252 ?auto_30257 ) ) ( not ( = ?auto_30253 ?auto_30257 ) ) ( not ( = ?auto_30256 ?auto_30257 ) ) ( not ( = ?auto_30254 ?auto_30257 ) ) ( not ( = ?auto_30255 ?auto_30257 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30252 ?auto_30257 )
      ( MAKE-2PILE ?auto_30252 ?auto_30253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30258 - BLOCK
      ?auto_30259 - BLOCK
    )
    :vars
    (
      ?auto_30263 - BLOCK
      ?auto_30261 - BLOCK
      ?auto_30260 - BLOCK
      ?auto_30262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30258 ?auto_30259 ) ) ( not ( = ?auto_30258 ?auto_30263 ) ) ( not ( = ?auto_30259 ?auto_30263 ) ) ( ON-TABLE ?auto_30261 ) ( ON ?auto_30260 ?auto_30261 ) ( ON ?auto_30263 ?auto_30260 ) ( not ( = ?auto_30261 ?auto_30260 ) ) ( not ( = ?auto_30261 ?auto_30263 ) ) ( not ( = ?auto_30261 ?auto_30259 ) ) ( not ( = ?auto_30261 ?auto_30258 ) ) ( not ( = ?auto_30260 ?auto_30263 ) ) ( not ( = ?auto_30260 ?auto_30259 ) ) ( not ( = ?auto_30260 ?auto_30258 ) ) ( ON ?auto_30258 ?auto_30262 ) ( CLEAR ?auto_30258 ) ( not ( = ?auto_30258 ?auto_30262 ) ) ( not ( = ?auto_30259 ?auto_30262 ) ) ( not ( = ?auto_30263 ?auto_30262 ) ) ( not ( = ?auto_30261 ?auto_30262 ) ) ( not ( = ?auto_30260 ?auto_30262 ) ) ( HOLDING ?auto_30259 ) ( CLEAR ?auto_30263 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30261 ?auto_30260 ?auto_30263 ?auto_30259 )
      ( MAKE-2PILE ?auto_30258 ?auto_30259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30264 - BLOCK
      ?auto_30265 - BLOCK
    )
    :vars
    (
      ?auto_30267 - BLOCK
      ?auto_30269 - BLOCK
      ?auto_30268 - BLOCK
      ?auto_30266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30264 ?auto_30265 ) ) ( not ( = ?auto_30264 ?auto_30267 ) ) ( not ( = ?auto_30265 ?auto_30267 ) ) ( ON-TABLE ?auto_30269 ) ( ON ?auto_30268 ?auto_30269 ) ( ON ?auto_30267 ?auto_30268 ) ( not ( = ?auto_30269 ?auto_30268 ) ) ( not ( = ?auto_30269 ?auto_30267 ) ) ( not ( = ?auto_30269 ?auto_30265 ) ) ( not ( = ?auto_30269 ?auto_30264 ) ) ( not ( = ?auto_30268 ?auto_30267 ) ) ( not ( = ?auto_30268 ?auto_30265 ) ) ( not ( = ?auto_30268 ?auto_30264 ) ) ( ON ?auto_30264 ?auto_30266 ) ( not ( = ?auto_30264 ?auto_30266 ) ) ( not ( = ?auto_30265 ?auto_30266 ) ) ( not ( = ?auto_30267 ?auto_30266 ) ) ( not ( = ?auto_30269 ?auto_30266 ) ) ( not ( = ?auto_30268 ?auto_30266 ) ) ( CLEAR ?auto_30267 ) ( ON ?auto_30265 ?auto_30264 ) ( CLEAR ?auto_30265 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30266 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30266 ?auto_30264 )
      ( MAKE-2PILE ?auto_30264 ?auto_30265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30270 - BLOCK
      ?auto_30271 - BLOCK
    )
    :vars
    (
      ?auto_30273 - BLOCK
      ?auto_30272 - BLOCK
      ?auto_30275 - BLOCK
      ?auto_30274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30270 ?auto_30271 ) ) ( not ( = ?auto_30270 ?auto_30273 ) ) ( not ( = ?auto_30271 ?auto_30273 ) ) ( ON-TABLE ?auto_30272 ) ( ON ?auto_30275 ?auto_30272 ) ( not ( = ?auto_30272 ?auto_30275 ) ) ( not ( = ?auto_30272 ?auto_30273 ) ) ( not ( = ?auto_30272 ?auto_30271 ) ) ( not ( = ?auto_30272 ?auto_30270 ) ) ( not ( = ?auto_30275 ?auto_30273 ) ) ( not ( = ?auto_30275 ?auto_30271 ) ) ( not ( = ?auto_30275 ?auto_30270 ) ) ( ON ?auto_30270 ?auto_30274 ) ( not ( = ?auto_30270 ?auto_30274 ) ) ( not ( = ?auto_30271 ?auto_30274 ) ) ( not ( = ?auto_30273 ?auto_30274 ) ) ( not ( = ?auto_30272 ?auto_30274 ) ) ( not ( = ?auto_30275 ?auto_30274 ) ) ( ON ?auto_30271 ?auto_30270 ) ( CLEAR ?auto_30271 ) ( ON-TABLE ?auto_30274 ) ( HOLDING ?auto_30273 ) ( CLEAR ?auto_30275 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30272 ?auto_30275 ?auto_30273 )
      ( MAKE-2PILE ?auto_30270 ?auto_30271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30276 - BLOCK
      ?auto_30277 - BLOCK
    )
    :vars
    (
      ?auto_30280 - BLOCK
      ?auto_30279 - BLOCK
      ?auto_30281 - BLOCK
      ?auto_30278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30276 ?auto_30277 ) ) ( not ( = ?auto_30276 ?auto_30280 ) ) ( not ( = ?auto_30277 ?auto_30280 ) ) ( ON-TABLE ?auto_30279 ) ( ON ?auto_30281 ?auto_30279 ) ( not ( = ?auto_30279 ?auto_30281 ) ) ( not ( = ?auto_30279 ?auto_30280 ) ) ( not ( = ?auto_30279 ?auto_30277 ) ) ( not ( = ?auto_30279 ?auto_30276 ) ) ( not ( = ?auto_30281 ?auto_30280 ) ) ( not ( = ?auto_30281 ?auto_30277 ) ) ( not ( = ?auto_30281 ?auto_30276 ) ) ( ON ?auto_30276 ?auto_30278 ) ( not ( = ?auto_30276 ?auto_30278 ) ) ( not ( = ?auto_30277 ?auto_30278 ) ) ( not ( = ?auto_30280 ?auto_30278 ) ) ( not ( = ?auto_30279 ?auto_30278 ) ) ( not ( = ?auto_30281 ?auto_30278 ) ) ( ON ?auto_30277 ?auto_30276 ) ( ON-TABLE ?auto_30278 ) ( CLEAR ?auto_30281 ) ( ON ?auto_30280 ?auto_30277 ) ( CLEAR ?auto_30280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30278 ?auto_30276 ?auto_30277 )
      ( MAKE-2PILE ?auto_30276 ?auto_30277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30282 - BLOCK
      ?auto_30283 - BLOCK
    )
    :vars
    (
      ?auto_30286 - BLOCK
      ?auto_30287 - BLOCK
      ?auto_30284 - BLOCK
      ?auto_30285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30282 ?auto_30283 ) ) ( not ( = ?auto_30282 ?auto_30286 ) ) ( not ( = ?auto_30283 ?auto_30286 ) ) ( ON-TABLE ?auto_30287 ) ( not ( = ?auto_30287 ?auto_30284 ) ) ( not ( = ?auto_30287 ?auto_30286 ) ) ( not ( = ?auto_30287 ?auto_30283 ) ) ( not ( = ?auto_30287 ?auto_30282 ) ) ( not ( = ?auto_30284 ?auto_30286 ) ) ( not ( = ?auto_30284 ?auto_30283 ) ) ( not ( = ?auto_30284 ?auto_30282 ) ) ( ON ?auto_30282 ?auto_30285 ) ( not ( = ?auto_30282 ?auto_30285 ) ) ( not ( = ?auto_30283 ?auto_30285 ) ) ( not ( = ?auto_30286 ?auto_30285 ) ) ( not ( = ?auto_30287 ?auto_30285 ) ) ( not ( = ?auto_30284 ?auto_30285 ) ) ( ON ?auto_30283 ?auto_30282 ) ( ON-TABLE ?auto_30285 ) ( ON ?auto_30286 ?auto_30283 ) ( CLEAR ?auto_30286 ) ( HOLDING ?auto_30284 ) ( CLEAR ?auto_30287 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30287 ?auto_30284 )
      ( MAKE-2PILE ?auto_30282 ?auto_30283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30288 - BLOCK
      ?auto_30289 - BLOCK
    )
    :vars
    (
      ?auto_30293 - BLOCK
      ?auto_30292 - BLOCK
      ?auto_30290 - BLOCK
      ?auto_30291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30288 ?auto_30289 ) ) ( not ( = ?auto_30288 ?auto_30293 ) ) ( not ( = ?auto_30289 ?auto_30293 ) ) ( ON-TABLE ?auto_30292 ) ( not ( = ?auto_30292 ?auto_30290 ) ) ( not ( = ?auto_30292 ?auto_30293 ) ) ( not ( = ?auto_30292 ?auto_30289 ) ) ( not ( = ?auto_30292 ?auto_30288 ) ) ( not ( = ?auto_30290 ?auto_30293 ) ) ( not ( = ?auto_30290 ?auto_30289 ) ) ( not ( = ?auto_30290 ?auto_30288 ) ) ( ON ?auto_30288 ?auto_30291 ) ( not ( = ?auto_30288 ?auto_30291 ) ) ( not ( = ?auto_30289 ?auto_30291 ) ) ( not ( = ?auto_30293 ?auto_30291 ) ) ( not ( = ?auto_30292 ?auto_30291 ) ) ( not ( = ?auto_30290 ?auto_30291 ) ) ( ON ?auto_30289 ?auto_30288 ) ( ON-TABLE ?auto_30291 ) ( ON ?auto_30293 ?auto_30289 ) ( CLEAR ?auto_30292 ) ( ON ?auto_30290 ?auto_30293 ) ( CLEAR ?auto_30290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30291 ?auto_30288 ?auto_30289 ?auto_30293 )
      ( MAKE-2PILE ?auto_30288 ?auto_30289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30294 - BLOCK
      ?auto_30295 - BLOCK
    )
    :vars
    (
      ?auto_30298 - BLOCK
      ?auto_30299 - BLOCK
      ?auto_30297 - BLOCK
      ?auto_30296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30294 ?auto_30295 ) ) ( not ( = ?auto_30294 ?auto_30298 ) ) ( not ( = ?auto_30295 ?auto_30298 ) ) ( not ( = ?auto_30299 ?auto_30297 ) ) ( not ( = ?auto_30299 ?auto_30298 ) ) ( not ( = ?auto_30299 ?auto_30295 ) ) ( not ( = ?auto_30299 ?auto_30294 ) ) ( not ( = ?auto_30297 ?auto_30298 ) ) ( not ( = ?auto_30297 ?auto_30295 ) ) ( not ( = ?auto_30297 ?auto_30294 ) ) ( ON ?auto_30294 ?auto_30296 ) ( not ( = ?auto_30294 ?auto_30296 ) ) ( not ( = ?auto_30295 ?auto_30296 ) ) ( not ( = ?auto_30298 ?auto_30296 ) ) ( not ( = ?auto_30299 ?auto_30296 ) ) ( not ( = ?auto_30297 ?auto_30296 ) ) ( ON ?auto_30295 ?auto_30294 ) ( ON-TABLE ?auto_30296 ) ( ON ?auto_30298 ?auto_30295 ) ( ON ?auto_30297 ?auto_30298 ) ( CLEAR ?auto_30297 ) ( HOLDING ?auto_30299 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30299 )
      ( MAKE-2PILE ?auto_30294 ?auto_30295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30300 - BLOCK
      ?auto_30301 - BLOCK
    )
    :vars
    (
      ?auto_30305 - BLOCK
      ?auto_30303 - BLOCK
      ?auto_30304 - BLOCK
      ?auto_30302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30300 ?auto_30301 ) ) ( not ( = ?auto_30300 ?auto_30305 ) ) ( not ( = ?auto_30301 ?auto_30305 ) ) ( not ( = ?auto_30303 ?auto_30304 ) ) ( not ( = ?auto_30303 ?auto_30305 ) ) ( not ( = ?auto_30303 ?auto_30301 ) ) ( not ( = ?auto_30303 ?auto_30300 ) ) ( not ( = ?auto_30304 ?auto_30305 ) ) ( not ( = ?auto_30304 ?auto_30301 ) ) ( not ( = ?auto_30304 ?auto_30300 ) ) ( ON ?auto_30300 ?auto_30302 ) ( not ( = ?auto_30300 ?auto_30302 ) ) ( not ( = ?auto_30301 ?auto_30302 ) ) ( not ( = ?auto_30305 ?auto_30302 ) ) ( not ( = ?auto_30303 ?auto_30302 ) ) ( not ( = ?auto_30304 ?auto_30302 ) ) ( ON ?auto_30301 ?auto_30300 ) ( ON-TABLE ?auto_30302 ) ( ON ?auto_30305 ?auto_30301 ) ( ON ?auto_30304 ?auto_30305 ) ( ON ?auto_30303 ?auto_30304 ) ( CLEAR ?auto_30303 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30302 ?auto_30300 ?auto_30301 ?auto_30305 ?auto_30304 )
      ( MAKE-2PILE ?auto_30300 ?auto_30301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30308 - BLOCK
      ?auto_30309 - BLOCK
    )
    :vars
    (
      ?auto_30310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30310 ?auto_30309 ) ( CLEAR ?auto_30310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30308 ) ( ON ?auto_30309 ?auto_30308 ) ( not ( = ?auto_30308 ?auto_30309 ) ) ( not ( = ?auto_30308 ?auto_30310 ) ) ( not ( = ?auto_30309 ?auto_30310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30310 ?auto_30309 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30311 - BLOCK
      ?auto_30312 - BLOCK
    )
    :vars
    (
      ?auto_30313 - BLOCK
      ?auto_30314 - BLOCK
      ?auto_30315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30313 ?auto_30312 ) ( CLEAR ?auto_30313 ) ( ON-TABLE ?auto_30311 ) ( ON ?auto_30312 ?auto_30311 ) ( not ( = ?auto_30311 ?auto_30312 ) ) ( not ( = ?auto_30311 ?auto_30313 ) ) ( not ( = ?auto_30312 ?auto_30313 ) ) ( HOLDING ?auto_30314 ) ( CLEAR ?auto_30315 ) ( not ( = ?auto_30311 ?auto_30314 ) ) ( not ( = ?auto_30311 ?auto_30315 ) ) ( not ( = ?auto_30312 ?auto_30314 ) ) ( not ( = ?auto_30312 ?auto_30315 ) ) ( not ( = ?auto_30313 ?auto_30314 ) ) ( not ( = ?auto_30313 ?auto_30315 ) ) ( not ( = ?auto_30314 ?auto_30315 ) ) )
    :subtasks
    ( ( !STACK ?auto_30314 ?auto_30315 )
      ( MAKE-2PILE ?auto_30311 ?auto_30312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30316 - BLOCK
      ?auto_30317 - BLOCK
    )
    :vars
    (
      ?auto_30319 - BLOCK
      ?auto_30318 - BLOCK
      ?auto_30320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30319 ?auto_30317 ) ( ON-TABLE ?auto_30316 ) ( ON ?auto_30317 ?auto_30316 ) ( not ( = ?auto_30316 ?auto_30317 ) ) ( not ( = ?auto_30316 ?auto_30319 ) ) ( not ( = ?auto_30317 ?auto_30319 ) ) ( CLEAR ?auto_30318 ) ( not ( = ?auto_30316 ?auto_30320 ) ) ( not ( = ?auto_30316 ?auto_30318 ) ) ( not ( = ?auto_30317 ?auto_30320 ) ) ( not ( = ?auto_30317 ?auto_30318 ) ) ( not ( = ?auto_30319 ?auto_30320 ) ) ( not ( = ?auto_30319 ?auto_30318 ) ) ( not ( = ?auto_30320 ?auto_30318 ) ) ( ON ?auto_30320 ?auto_30319 ) ( CLEAR ?auto_30320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30316 ?auto_30317 ?auto_30319 )
      ( MAKE-2PILE ?auto_30316 ?auto_30317 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30321 - BLOCK
      ?auto_30322 - BLOCK
    )
    :vars
    (
      ?auto_30324 - BLOCK
      ?auto_30323 - BLOCK
      ?auto_30325 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30324 ?auto_30322 ) ( ON-TABLE ?auto_30321 ) ( ON ?auto_30322 ?auto_30321 ) ( not ( = ?auto_30321 ?auto_30322 ) ) ( not ( = ?auto_30321 ?auto_30324 ) ) ( not ( = ?auto_30322 ?auto_30324 ) ) ( not ( = ?auto_30321 ?auto_30323 ) ) ( not ( = ?auto_30321 ?auto_30325 ) ) ( not ( = ?auto_30322 ?auto_30323 ) ) ( not ( = ?auto_30322 ?auto_30325 ) ) ( not ( = ?auto_30324 ?auto_30323 ) ) ( not ( = ?auto_30324 ?auto_30325 ) ) ( not ( = ?auto_30323 ?auto_30325 ) ) ( ON ?auto_30323 ?auto_30324 ) ( CLEAR ?auto_30323 ) ( HOLDING ?auto_30325 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30325 )
      ( MAKE-2PILE ?auto_30321 ?auto_30322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30326 - BLOCK
      ?auto_30327 - BLOCK
    )
    :vars
    (
      ?auto_30328 - BLOCK
      ?auto_30329 - BLOCK
      ?auto_30330 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30328 ?auto_30327 ) ( ON-TABLE ?auto_30326 ) ( ON ?auto_30327 ?auto_30326 ) ( not ( = ?auto_30326 ?auto_30327 ) ) ( not ( = ?auto_30326 ?auto_30328 ) ) ( not ( = ?auto_30327 ?auto_30328 ) ) ( not ( = ?auto_30326 ?auto_30329 ) ) ( not ( = ?auto_30326 ?auto_30330 ) ) ( not ( = ?auto_30327 ?auto_30329 ) ) ( not ( = ?auto_30327 ?auto_30330 ) ) ( not ( = ?auto_30328 ?auto_30329 ) ) ( not ( = ?auto_30328 ?auto_30330 ) ) ( not ( = ?auto_30329 ?auto_30330 ) ) ( ON ?auto_30329 ?auto_30328 ) ( ON ?auto_30330 ?auto_30329 ) ( CLEAR ?auto_30330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30326 ?auto_30327 ?auto_30328 ?auto_30329 )
      ( MAKE-2PILE ?auto_30326 ?auto_30327 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30331 - BLOCK
      ?auto_30332 - BLOCK
    )
    :vars
    (
      ?auto_30334 - BLOCK
      ?auto_30333 - BLOCK
      ?auto_30335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30334 ?auto_30332 ) ( ON-TABLE ?auto_30331 ) ( ON ?auto_30332 ?auto_30331 ) ( not ( = ?auto_30331 ?auto_30332 ) ) ( not ( = ?auto_30331 ?auto_30334 ) ) ( not ( = ?auto_30332 ?auto_30334 ) ) ( not ( = ?auto_30331 ?auto_30333 ) ) ( not ( = ?auto_30331 ?auto_30335 ) ) ( not ( = ?auto_30332 ?auto_30333 ) ) ( not ( = ?auto_30332 ?auto_30335 ) ) ( not ( = ?auto_30334 ?auto_30333 ) ) ( not ( = ?auto_30334 ?auto_30335 ) ) ( not ( = ?auto_30333 ?auto_30335 ) ) ( ON ?auto_30333 ?auto_30334 ) ( HOLDING ?auto_30335 ) ( CLEAR ?auto_30333 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30331 ?auto_30332 ?auto_30334 ?auto_30333 ?auto_30335 )
      ( MAKE-2PILE ?auto_30331 ?auto_30332 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30336 - BLOCK
      ?auto_30337 - BLOCK
    )
    :vars
    (
      ?auto_30340 - BLOCK
      ?auto_30339 - BLOCK
      ?auto_30338 - BLOCK
      ?auto_30341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30340 ?auto_30337 ) ( ON-TABLE ?auto_30336 ) ( ON ?auto_30337 ?auto_30336 ) ( not ( = ?auto_30336 ?auto_30337 ) ) ( not ( = ?auto_30336 ?auto_30340 ) ) ( not ( = ?auto_30337 ?auto_30340 ) ) ( not ( = ?auto_30336 ?auto_30339 ) ) ( not ( = ?auto_30336 ?auto_30338 ) ) ( not ( = ?auto_30337 ?auto_30339 ) ) ( not ( = ?auto_30337 ?auto_30338 ) ) ( not ( = ?auto_30340 ?auto_30339 ) ) ( not ( = ?auto_30340 ?auto_30338 ) ) ( not ( = ?auto_30339 ?auto_30338 ) ) ( ON ?auto_30339 ?auto_30340 ) ( CLEAR ?auto_30339 ) ( ON ?auto_30338 ?auto_30341 ) ( CLEAR ?auto_30338 ) ( HAND-EMPTY ) ( not ( = ?auto_30336 ?auto_30341 ) ) ( not ( = ?auto_30337 ?auto_30341 ) ) ( not ( = ?auto_30340 ?auto_30341 ) ) ( not ( = ?auto_30339 ?auto_30341 ) ) ( not ( = ?auto_30338 ?auto_30341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30338 ?auto_30341 )
      ( MAKE-2PILE ?auto_30336 ?auto_30337 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30342 - BLOCK
      ?auto_30343 - BLOCK
    )
    :vars
    (
      ?auto_30346 - BLOCK
      ?auto_30344 - BLOCK
      ?auto_30347 - BLOCK
      ?auto_30345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30346 ?auto_30343 ) ( ON-TABLE ?auto_30342 ) ( ON ?auto_30343 ?auto_30342 ) ( not ( = ?auto_30342 ?auto_30343 ) ) ( not ( = ?auto_30342 ?auto_30346 ) ) ( not ( = ?auto_30343 ?auto_30346 ) ) ( not ( = ?auto_30342 ?auto_30344 ) ) ( not ( = ?auto_30342 ?auto_30347 ) ) ( not ( = ?auto_30343 ?auto_30344 ) ) ( not ( = ?auto_30343 ?auto_30347 ) ) ( not ( = ?auto_30346 ?auto_30344 ) ) ( not ( = ?auto_30346 ?auto_30347 ) ) ( not ( = ?auto_30344 ?auto_30347 ) ) ( ON ?auto_30347 ?auto_30345 ) ( CLEAR ?auto_30347 ) ( not ( = ?auto_30342 ?auto_30345 ) ) ( not ( = ?auto_30343 ?auto_30345 ) ) ( not ( = ?auto_30346 ?auto_30345 ) ) ( not ( = ?auto_30344 ?auto_30345 ) ) ( not ( = ?auto_30347 ?auto_30345 ) ) ( HOLDING ?auto_30344 ) ( CLEAR ?auto_30346 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30342 ?auto_30343 ?auto_30346 ?auto_30344 )
      ( MAKE-2PILE ?auto_30342 ?auto_30343 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30348 - BLOCK
      ?auto_30349 - BLOCK
    )
    :vars
    (
      ?auto_30353 - BLOCK
      ?auto_30350 - BLOCK
      ?auto_30352 - BLOCK
      ?auto_30351 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30353 ?auto_30349 ) ( ON-TABLE ?auto_30348 ) ( ON ?auto_30349 ?auto_30348 ) ( not ( = ?auto_30348 ?auto_30349 ) ) ( not ( = ?auto_30348 ?auto_30353 ) ) ( not ( = ?auto_30349 ?auto_30353 ) ) ( not ( = ?auto_30348 ?auto_30350 ) ) ( not ( = ?auto_30348 ?auto_30352 ) ) ( not ( = ?auto_30349 ?auto_30350 ) ) ( not ( = ?auto_30349 ?auto_30352 ) ) ( not ( = ?auto_30353 ?auto_30350 ) ) ( not ( = ?auto_30353 ?auto_30352 ) ) ( not ( = ?auto_30350 ?auto_30352 ) ) ( ON ?auto_30352 ?auto_30351 ) ( not ( = ?auto_30348 ?auto_30351 ) ) ( not ( = ?auto_30349 ?auto_30351 ) ) ( not ( = ?auto_30353 ?auto_30351 ) ) ( not ( = ?auto_30350 ?auto_30351 ) ) ( not ( = ?auto_30352 ?auto_30351 ) ) ( CLEAR ?auto_30353 ) ( ON ?auto_30350 ?auto_30352 ) ( CLEAR ?auto_30350 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30351 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30351 ?auto_30352 )
      ( MAKE-2PILE ?auto_30348 ?auto_30349 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30366 - BLOCK
      ?auto_30367 - BLOCK
    )
    :vars
    (
      ?auto_30370 - BLOCK
      ?auto_30371 - BLOCK
      ?auto_30368 - BLOCK
      ?auto_30369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30366 ) ( not ( = ?auto_30366 ?auto_30367 ) ) ( not ( = ?auto_30366 ?auto_30370 ) ) ( not ( = ?auto_30367 ?auto_30370 ) ) ( not ( = ?auto_30366 ?auto_30371 ) ) ( not ( = ?auto_30366 ?auto_30368 ) ) ( not ( = ?auto_30367 ?auto_30371 ) ) ( not ( = ?auto_30367 ?auto_30368 ) ) ( not ( = ?auto_30370 ?auto_30371 ) ) ( not ( = ?auto_30370 ?auto_30368 ) ) ( not ( = ?auto_30371 ?auto_30368 ) ) ( ON ?auto_30368 ?auto_30369 ) ( not ( = ?auto_30366 ?auto_30369 ) ) ( not ( = ?auto_30367 ?auto_30369 ) ) ( not ( = ?auto_30370 ?auto_30369 ) ) ( not ( = ?auto_30371 ?auto_30369 ) ) ( not ( = ?auto_30368 ?auto_30369 ) ) ( ON ?auto_30371 ?auto_30368 ) ( ON-TABLE ?auto_30369 ) ( ON ?auto_30370 ?auto_30371 ) ( CLEAR ?auto_30370 ) ( HOLDING ?auto_30367 ) ( CLEAR ?auto_30366 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30366 ?auto_30367 ?auto_30370 )
      ( MAKE-2PILE ?auto_30366 ?auto_30367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30372 - BLOCK
      ?auto_30373 - BLOCK
    )
    :vars
    (
      ?auto_30377 - BLOCK
      ?auto_30376 - BLOCK
      ?auto_30374 - BLOCK
      ?auto_30375 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30372 ) ( not ( = ?auto_30372 ?auto_30373 ) ) ( not ( = ?auto_30372 ?auto_30377 ) ) ( not ( = ?auto_30373 ?auto_30377 ) ) ( not ( = ?auto_30372 ?auto_30376 ) ) ( not ( = ?auto_30372 ?auto_30374 ) ) ( not ( = ?auto_30373 ?auto_30376 ) ) ( not ( = ?auto_30373 ?auto_30374 ) ) ( not ( = ?auto_30377 ?auto_30376 ) ) ( not ( = ?auto_30377 ?auto_30374 ) ) ( not ( = ?auto_30376 ?auto_30374 ) ) ( ON ?auto_30374 ?auto_30375 ) ( not ( = ?auto_30372 ?auto_30375 ) ) ( not ( = ?auto_30373 ?auto_30375 ) ) ( not ( = ?auto_30377 ?auto_30375 ) ) ( not ( = ?auto_30376 ?auto_30375 ) ) ( not ( = ?auto_30374 ?auto_30375 ) ) ( ON ?auto_30376 ?auto_30374 ) ( ON-TABLE ?auto_30375 ) ( ON ?auto_30377 ?auto_30376 ) ( CLEAR ?auto_30372 ) ( ON ?auto_30373 ?auto_30377 ) ( CLEAR ?auto_30373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30375 ?auto_30374 ?auto_30376 ?auto_30377 )
      ( MAKE-2PILE ?auto_30372 ?auto_30373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30378 - BLOCK
      ?auto_30379 - BLOCK
    )
    :vars
    (
      ?auto_30383 - BLOCK
      ?auto_30381 - BLOCK
      ?auto_30382 - BLOCK
      ?auto_30380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30378 ?auto_30379 ) ) ( not ( = ?auto_30378 ?auto_30383 ) ) ( not ( = ?auto_30379 ?auto_30383 ) ) ( not ( = ?auto_30378 ?auto_30381 ) ) ( not ( = ?auto_30378 ?auto_30382 ) ) ( not ( = ?auto_30379 ?auto_30381 ) ) ( not ( = ?auto_30379 ?auto_30382 ) ) ( not ( = ?auto_30383 ?auto_30381 ) ) ( not ( = ?auto_30383 ?auto_30382 ) ) ( not ( = ?auto_30381 ?auto_30382 ) ) ( ON ?auto_30382 ?auto_30380 ) ( not ( = ?auto_30378 ?auto_30380 ) ) ( not ( = ?auto_30379 ?auto_30380 ) ) ( not ( = ?auto_30383 ?auto_30380 ) ) ( not ( = ?auto_30381 ?auto_30380 ) ) ( not ( = ?auto_30382 ?auto_30380 ) ) ( ON ?auto_30381 ?auto_30382 ) ( ON-TABLE ?auto_30380 ) ( ON ?auto_30383 ?auto_30381 ) ( ON ?auto_30379 ?auto_30383 ) ( CLEAR ?auto_30379 ) ( HOLDING ?auto_30378 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30378 )
      ( MAKE-2PILE ?auto_30378 ?auto_30379 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_30384 - BLOCK
      ?auto_30385 - BLOCK
    )
    :vars
    (
      ?auto_30386 - BLOCK
      ?auto_30387 - BLOCK
      ?auto_30388 - BLOCK
      ?auto_30389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30384 ?auto_30385 ) ) ( not ( = ?auto_30384 ?auto_30386 ) ) ( not ( = ?auto_30385 ?auto_30386 ) ) ( not ( = ?auto_30384 ?auto_30387 ) ) ( not ( = ?auto_30384 ?auto_30388 ) ) ( not ( = ?auto_30385 ?auto_30387 ) ) ( not ( = ?auto_30385 ?auto_30388 ) ) ( not ( = ?auto_30386 ?auto_30387 ) ) ( not ( = ?auto_30386 ?auto_30388 ) ) ( not ( = ?auto_30387 ?auto_30388 ) ) ( ON ?auto_30388 ?auto_30389 ) ( not ( = ?auto_30384 ?auto_30389 ) ) ( not ( = ?auto_30385 ?auto_30389 ) ) ( not ( = ?auto_30386 ?auto_30389 ) ) ( not ( = ?auto_30387 ?auto_30389 ) ) ( not ( = ?auto_30388 ?auto_30389 ) ) ( ON ?auto_30387 ?auto_30388 ) ( ON-TABLE ?auto_30389 ) ( ON ?auto_30386 ?auto_30387 ) ( ON ?auto_30385 ?auto_30386 ) ( ON ?auto_30384 ?auto_30385 ) ( CLEAR ?auto_30384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30389 ?auto_30388 ?auto_30387 ?auto_30386 ?auto_30385 )
      ( MAKE-2PILE ?auto_30384 ?auto_30385 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30393 - BLOCK
      ?auto_30394 - BLOCK
      ?auto_30395 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30395 ) ( CLEAR ?auto_30394 ) ( ON-TABLE ?auto_30393 ) ( ON ?auto_30394 ?auto_30393 ) ( not ( = ?auto_30393 ?auto_30394 ) ) ( not ( = ?auto_30393 ?auto_30395 ) ) ( not ( = ?auto_30394 ?auto_30395 ) ) )
    :subtasks
    ( ( !STACK ?auto_30395 ?auto_30394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30396 - BLOCK
      ?auto_30397 - BLOCK
      ?auto_30398 - BLOCK
    )
    :vars
    (
      ?auto_30399 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30397 ) ( ON-TABLE ?auto_30396 ) ( ON ?auto_30397 ?auto_30396 ) ( not ( = ?auto_30396 ?auto_30397 ) ) ( not ( = ?auto_30396 ?auto_30398 ) ) ( not ( = ?auto_30397 ?auto_30398 ) ) ( ON ?auto_30398 ?auto_30399 ) ( CLEAR ?auto_30398 ) ( HAND-EMPTY ) ( not ( = ?auto_30396 ?auto_30399 ) ) ( not ( = ?auto_30397 ?auto_30399 ) ) ( not ( = ?auto_30398 ?auto_30399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30398 ?auto_30399 )
      ( MAKE-3PILE ?auto_30396 ?auto_30397 ?auto_30398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30400 - BLOCK
      ?auto_30401 - BLOCK
      ?auto_30402 - BLOCK
    )
    :vars
    (
      ?auto_30403 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30400 ) ( not ( = ?auto_30400 ?auto_30401 ) ) ( not ( = ?auto_30400 ?auto_30402 ) ) ( not ( = ?auto_30401 ?auto_30402 ) ) ( ON ?auto_30402 ?auto_30403 ) ( CLEAR ?auto_30402 ) ( not ( = ?auto_30400 ?auto_30403 ) ) ( not ( = ?auto_30401 ?auto_30403 ) ) ( not ( = ?auto_30402 ?auto_30403 ) ) ( HOLDING ?auto_30401 ) ( CLEAR ?auto_30400 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30400 ?auto_30401 )
      ( MAKE-3PILE ?auto_30400 ?auto_30401 ?auto_30402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30404 - BLOCK
      ?auto_30405 - BLOCK
      ?auto_30406 - BLOCK
    )
    :vars
    (
      ?auto_30407 - BLOCK
      ?auto_30408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30404 ) ( not ( = ?auto_30404 ?auto_30405 ) ) ( not ( = ?auto_30404 ?auto_30406 ) ) ( not ( = ?auto_30405 ?auto_30406 ) ) ( ON ?auto_30406 ?auto_30407 ) ( not ( = ?auto_30404 ?auto_30407 ) ) ( not ( = ?auto_30405 ?auto_30407 ) ) ( not ( = ?auto_30406 ?auto_30407 ) ) ( CLEAR ?auto_30404 ) ( ON ?auto_30405 ?auto_30406 ) ( CLEAR ?auto_30405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30408 ) ( ON ?auto_30407 ?auto_30408 ) ( not ( = ?auto_30408 ?auto_30407 ) ) ( not ( = ?auto_30408 ?auto_30406 ) ) ( not ( = ?auto_30408 ?auto_30405 ) ) ( not ( = ?auto_30404 ?auto_30408 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30408 ?auto_30407 ?auto_30406 )
      ( MAKE-3PILE ?auto_30404 ?auto_30405 ?auto_30406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30409 - BLOCK
      ?auto_30410 - BLOCK
      ?auto_30411 - BLOCK
    )
    :vars
    (
      ?auto_30412 - BLOCK
      ?auto_30413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30409 ?auto_30410 ) ) ( not ( = ?auto_30409 ?auto_30411 ) ) ( not ( = ?auto_30410 ?auto_30411 ) ) ( ON ?auto_30411 ?auto_30412 ) ( not ( = ?auto_30409 ?auto_30412 ) ) ( not ( = ?auto_30410 ?auto_30412 ) ) ( not ( = ?auto_30411 ?auto_30412 ) ) ( ON ?auto_30410 ?auto_30411 ) ( CLEAR ?auto_30410 ) ( ON-TABLE ?auto_30413 ) ( ON ?auto_30412 ?auto_30413 ) ( not ( = ?auto_30413 ?auto_30412 ) ) ( not ( = ?auto_30413 ?auto_30411 ) ) ( not ( = ?auto_30413 ?auto_30410 ) ) ( not ( = ?auto_30409 ?auto_30413 ) ) ( HOLDING ?auto_30409 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30409 )
      ( MAKE-3PILE ?auto_30409 ?auto_30410 ?auto_30411 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30414 - BLOCK
      ?auto_30415 - BLOCK
      ?auto_30416 - BLOCK
    )
    :vars
    (
      ?auto_30417 - BLOCK
      ?auto_30418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30414 ?auto_30415 ) ) ( not ( = ?auto_30414 ?auto_30416 ) ) ( not ( = ?auto_30415 ?auto_30416 ) ) ( ON ?auto_30416 ?auto_30417 ) ( not ( = ?auto_30414 ?auto_30417 ) ) ( not ( = ?auto_30415 ?auto_30417 ) ) ( not ( = ?auto_30416 ?auto_30417 ) ) ( ON ?auto_30415 ?auto_30416 ) ( ON-TABLE ?auto_30418 ) ( ON ?auto_30417 ?auto_30418 ) ( not ( = ?auto_30418 ?auto_30417 ) ) ( not ( = ?auto_30418 ?auto_30416 ) ) ( not ( = ?auto_30418 ?auto_30415 ) ) ( not ( = ?auto_30414 ?auto_30418 ) ) ( ON ?auto_30414 ?auto_30415 ) ( CLEAR ?auto_30414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30418 ?auto_30417 ?auto_30416 ?auto_30415 )
      ( MAKE-3PILE ?auto_30414 ?auto_30415 ?auto_30416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30419 - BLOCK
      ?auto_30420 - BLOCK
      ?auto_30421 - BLOCK
    )
    :vars
    (
      ?auto_30423 - BLOCK
      ?auto_30422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30419 ?auto_30420 ) ) ( not ( = ?auto_30419 ?auto_30421 ) ) ( not ( = ?auto_30420 ?auto_30421 ) ) ( ON ?auto_30421 ?auto_30423 ) ( not ( = ?auto_30419 ?auto_30423 ) ) ( not ( = ?auto_30420 ?auto_30423 ) ) ( not ( = ?auto_30421 ?auto_30423 ) ) ( ON ?auto_30420 ?auto_30421 ) ( ON-TABLE ?auto_30422 ) ( ON ?auto_30423 ?auto_30422 ) ( not ( = ?auto_30422 ?auto_30423 ) ) ( not ( = ?auto_30422 ?auto_30421 ) ) ( not ( = ?auto_30422 ?auto_30420 ) ) ( not ( = ?auto_30419 ?auto_30422 ) ) ( HOLDING ?auto_30419 ) ( CLEAR ?auto_30420 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30422 ?auto_30423 ?auto_30421 ?auto_30420 ?auto_30419 )
      ( MAKE-3PILE ?auto_30419 ?auto_30420 ?auto_30421 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30424 - BLOCK
      ?auto_30425 - BLOCK
      ?auto_30426 - BLOCK
    )
    :vars
    (
      ?auto_30428 - BLOCK
      ?auto_30427 - BLOCK
      ?auto_30429 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30424 ?auto_30425 ) ) ( not ( = ?auto_30424 ?auto_30426 ) ) ( not ( = ?auto_30425 ?auto_30426 ) ) ( ON ?auto_30426 ?auto_30428 ) ( not ( = ?auto_30424 ?auto_30428 ) ) ( not ( = ?auto_30425 ?auto_30428 ) ) ( not ( = ?auto_30426 ?auto_30428 ) ) ( ON ?auto_30425 ?auto_30426 ) ( ON-TABLE ?auto_30427 ) ( ON ?auto_30428 ?auto_30427 ) ( not ( = ?auto_30427 ?auto_30428 ) ) ( not ( = ?auto_30427 ?auto_30426 ) ) ( not ( = ?auto_30427 ?auto_30425 ) ) ( not ( = ?auto_30424 ?auto_30427 ) ) ( CLEAR ?auto_30425 ) ( ON ?auto_30424 ?auto_30429 ) ( CLEAR ?auto_30424 ) ( HAND-EMPTY ) ( not ( = ?auto_30424 ?auto_30429 ) ) ( not ( = ?auto_30425 ?auto_30429 ) ) ( not ( = ?auto_30426 ?auto_30429 ) ) ( not ( = ?auto_30428 ?auto_30429 ) ) ( not ( = ?auto_30427 ?auto_30429 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30424 ?auto_30429 )
      ( MAKE-3PILE ?auto_30424 ?auto_30425 ?auto_30426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30430 - BLOCK
      ?auto_30431 - BLOCK
      ?auto_30432 - BLOCK
    )
    :vars
    (
      ?auto_30434 - BLOCK
      ?auto_30435 - BLOCK
      ?auto_30433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30430 ?auto_30431 ) ) ( not ( = ?auto_30430 ?auto_30432 ) ) ( not ( = ?auto_30431 ?auto_30432 ) ) ( ON ?auto_30432 ?auto_30434 ) ( not ( = ?auto_30430 ?auto_30434 ) ) ( not ( = ?auto_30431 ?auto_30434 ) ) ( not ( = ?auto_30432 ?auto_30434 ) ) ( ON-TABLE ?auto_30435 ) ( ON ?auto_30434 ?auto_30435 ) ( not ( = ?auto_30435 ?auto_30434 ) ) ( not ( = ?auto_30435 ?auto_30432 ) ) ( not ( = ?auto_30435 ?auto_30431 ) ) ( not ( = ?auto_30430 ?auto_30435 ) ) ( ON ?auto_30430 ?auto_30433 ) ( CLEAR ?auto_30430 ) ( not ( = ?auto_30430 ?auto_30433 ) ) ( not ( = ?auto_30431 ?auto_30433 ) ) ( not ( = ?auto_30432 ?auto_30433 ) ) ( not ( = ?auto_30434 ?auto_30433 ) ) ( not ( = ?auto_30435 ?auto_30433 ) ) ( HOLDING ?auto_30431 ) ( CLEAR ?auto_30432 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30435 ?auto_30434 ?auto_30432 ?auto_30431 )
      ( MAKE-3PILE ?auto_30430 ?auto_30431 ?auto_30432 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30436 - BLOCK
      ?auto_30437 - BLOCK
      ?auto_30438 - BLOCK
    )
    :vars
    (
      ?auto_30441 - BLOCK
      ?auto_30439 - BLOCK
      ?auto_30440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30436 ?auto_30437 ) ) ( not ( = ?auto_30436 ?auto_30438 ) ) ( not ( = ?auto_30437 ?auto_30438 ) ) ( ON ?auto_30438 ?auto_30441 ) ( not ( = ?auto_30436 ?auto_30441 ) ) ( not ( = ?auto_30437 ?auto_30441 ) ) ( not ( = ?auto_30438 ?auto_30441 ) ) ( ON-TABLE ?auto_30439 ) ( ON ?auto_30441 ?auto_30439 ) ( not ( = ?auto_30439 ?auto_30441 ) ) ( not ( = ?auto_30439 ?auto_30438 ) ) ( not ( = ?auto_30439 ?auto_30437 ) ) ( not ( = ?auto_30436 ?auto_30439 ) ) ( ON ?auto_30436 ?auto_30440 ) ( not ( = ?auto_30436 ?auto_30440 ) ) ( not ( = ?auto_30437 ?auto_30440 ) ) ( not ( = ?auto_30438 ?auto_30440 ) ) ( not ( = ?auto_30441 ?auto_30440 ) ) ( not ( = ?auto_30439 ?auto_30440 ) ) ( CLEAR ?auto_30438 ) ( ON ?auto_30437 ?auto_30436 ) ( CLEAR ?auto_30437 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30440 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30440 ?auto_30436 )
      ( MAKE-3PILE ?auto_30436 ?auto_30437 ?auto_30438 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30442 - BLOCK
      ?auto_30443 - BLOCK
      ?auto_30444 - BLOCK
    )
    :vars
    (
      ?auto_30447 - BLOCK
      ?auto_30446 - BLOCK
      ?auto_30445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30442 ?auto_30443 ) ) ( not ( = ?auto_30442 ?auto_30444 ) ) ( not ( = ?auto_30443 ?auto_30444 ) ) ( not ( = ?auto_30442 ?auto_30447 ) ) ( not ( = ?auto_30443 ?auto_30447 ) ) ( not ( = ?auto_30444 ?auto_30447 ) ) ( ON-TABLE ?auto_30446 ) ( ON ?auto_30447 ?auto_30446 ) ( not ( = ?auto_30446 ?auto_30447 ) ) ( not ( = ?auto_30446 ?auto_30444 ) ) ( not ( = ?auto_30446 ?auto_30443 ) ) ( not ( = ?auto_30442 ?auto_30446 ) ) ( ON ?auto_30442 ?auto_30445 ) ( not ( = ?auto_30442 ?auto_30445 ) ) ( not ( = ?auto_30443 ?auto_30445 ) ) ( not ( = ?auto_30444 ?auto_30445 ) ) ( not ( = ?auto_30447 ?auto_30445 ) ) ( not ( = ?auto_30446 ?auto_30445 ) ) ( ON ?auto_30443 ?auto_30442 ) ( CLEAR ?auto_30443 ) ( ON-TABLE ?auto_30445 ) ( HOLDING ?auto_30444 ) ( CLEAR ?auto_30447 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30446 ?auto_30447 ?auto_30444 )
      ( MAKE-3PILE ?auto_30442 ?auto_30443 ?auto_30444 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30448 - BLOCK
      ?auto_30449 - BLOCK
      ?auto_30450 - BLOCK
    )
    :vars
    (
      ?auto_30452 - BLOCK
      ?auto_30451 - BLOCK
      ?auto_30453 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30448 ?auto_30449 ) ) ( not ( = ?auto_30448 ?auto_30450 ) ) ( not ( = ?auto_30449 ?auto_30450 ) ) ( not ( = ?auto_30448 ?auto_30452 ) ) ( not ( = ?auto_30449 ?auto_30452 ) ) ( not ( = ?auto_30450 ?auto_30452 ) ) ( ON-TABLE ?auto_30451 ) ( ON ?auto_30452 ?auto_30451 ) ( not ( = ?auto_30451 ?auto_30452 ) ) ( not ( = ?auto_30451 ?auto_30450 ) ) ( not ( = ?auto_30451 ?auto_30449 ) ) ( not ( = ?auto_30448 ?auto_30451 ) ) ( ON ?auto_30448 ?auto_30453 ) ( not ( = ?auto_30448 ?auto_30453 ) ) ( not ( = ?auto_30449 ?auto_30453 ) ) ( not ( = ?auto_30450 ?auto_30453 ) ) ( not ( = ?auto_30452 ?auto_30453 ) ) ( not ( = ?auto_30451 ?auto_30453 ) ) ( ON ?auto_30449 ?auto_30448 ) ( ON-TABLE ?auto_30453 ) ( CLEAR ?auto_30452 ) ( ON ?auto_30450 ?auto_30449 ) ( CLEAR ?auto_30450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30453 ?auto_30448 ?auto_30449 )
      ( MAKE-3PILE ?auto_30448 ?auto_30449 ?auto_30450 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30454 - BLOCK
      ?auto_30455 - BLOCK
      ?auto_30456 - BLOCK
    )
    :vars
    (
      ?auto_30458 - BLOCK
      ?auto_30457 - BLOCK
      ?auto_30459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30454 ?auto_30455 ) ) ( not ( = ?auto_30454 ?auto_30456 ) ) ( not ( = ?auto_30455 ?auto_30456 ) ) ( not ( = ?auto_30454 ?auto_30458 ) ) ( not ( = ?auto_30455 ?auto_30458 ) ) ( not ( = ?auto_30456 ?auto_30458 ) ) ( ON-TABLE ?auto_30457 ) ( not ( = ?auto_30457 ?auto_30458 ) ) ( not ( = ?auto_30457 ?auto_30456 ) ) ( not ( = ?auto_30457 ?auto_30455 ) ) ( not ( = ?auto_30454 ?auto_30457 ) ) ( ON ?auto_30454 ?auto_30459 ) ( not ( = ?auto_30454 ?auto_30459 ) ) ( not ( = ?auto_30455 ?auto_30459 ) ) ( not ( = ?auto_30456 ?auto_30459 ) ) ( not ( = ?auto_30458 ?auto_30459 ) ) ( not ( = ?auto_30457 ?auto_30459 ) ) ( ON ?auto_30455 ?auto_30454 ) ( ON-TABLE ?auto_30459 ) ( ON ?auto_30456 ?auto_30455 ) ( CLEAR ?auto_30456 ) ( HOLDING ?auto_30458 ) ( CLEAR ?auto_30457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30457 ?auto_30458 )
      ( MAKE-3PILE ?auto_30454 ?auto_30455 ?auto_30456 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30460 - BLOCK
      ?auto_30461 - BLOCK
      ?auto_30462 - BLOCK
    )
    :vars
    (
      ?auto_30463 - BLOCK
      ?auto_30464 - BLOCK
      ?auto_30465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30460 ?auto_30461 ) ) ( not ( = ?auto_30460 ?auto_30462 ) ) ( not ( = ?auto_30461 ?auto_30462 ) ) ( not ( = ?auto_30460 ?auto_30463 ) ) ( not ( = ?auto_30461 ?auto_30463 ) ) ( not ( = ?auto_30462 ?auto_30463 ) ) ( ON-TABLE ?auto_30464 ) ( not ( = ?auto_30464 ?auto_30463 ) ) ( not ( = ?auto_30464 ?auto_30462 ) ) ( not ( = ?auto_30464 ?auto_30461 ) ) ( not ( = ?auto_30460 ?auto_30464 ) ) ( ON ?auto_30460 ?auto_30465 ) ( not ( = ?auto_30460 ?auto_30465 ) ) ( not ( = ?auto_30461 ?auto_30465 ) ) ( not ( = ?auto_30462 ?auto_30465 ) ) ( not ( = ?auto_30463 ?auto_30465 ) ) ( not ( = ?auto_30464 ?auto_30465 ) ) ( ON ?auto_30461 ?auto_30460 ) ( ON-TABLE ?auto_30465 ) ( ON ?auto_30462 ?auto_30461 ) ( CLEAR ?auto_30464 ) ( ON ?auto_30463 ?auto_30462 ) ( CLEAR ?auto_30463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30465 ?auto_30460 ?auto_30461 ?auto_30462 )
      ( MAKE-3PILE ?auto_30460 ?auto_30461 ?auto_30462 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30466 - BLOCK
      ?auto_30467 - BLOCK
      ?auto_30468 - BLOCK
    )
    :vars
    (
      ?auto_30469 - BLOCK
      ?auto_30471 - BLOCK
      ?auto_30470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30466 ?auto_30467 ) ) ( not ( = ?auto_30466 ?auto_30468 ) ) ( not ( = ?auto_30467 ?auto_30468 ) ) ( not ( = ?auto_30466 ?auto_30469 ) ) ( not ( = ?auto_30467 ?auto_30469 ) ) ( not ( = ?auto_30468 ?auto_30469 ) ) ( not ( = ?auto_30471 ?auto_30469 ) ) ( not ( = ?auto_30471 ?auto_30468 ) ) ( not ( = ?auto_30471 ?auto_30467 ) ) ( not ( = ?auto_30466 ?auto_30471 ) ) ( ON ?auto_30466 ?auto_30470 ) ( not ( = ?auto_30466 ?auto_30470 ) ) ( not ( = ?auto_30467 ?auto_30470 ) ) ( not ( = ?auto_30468 ?auto_30470 ) ) ( not ( = ?auto_30469 ?auto_30470 ) ) ( not ( = ?auto_30471 ?auto_30470 ) ) ( ON ?auto_30467 ?auto_30466 ) ( ON-TABLE ?auto_30470 ) ( ON ?auto_30468 ?auto_30467 ) ( ON ?auto_30469 ?auto_30468 ) ( CLEAR ?auto_30469 ) ( HOLDING ?auto_30471 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30471 )
      ( MAKE-3PILE ?auto_30466 ?auto_30467 ?auto_30468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_30472 - BLOCK
      ?auto_30473 - BLOCK
      ?auto_30474 - BLOCK
    )
    :vars
    (
      ?auto_30475 - BLOCK
      ?auto_30477 - BLOCK
      ?auto_30476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30472 ?auto_30473 ) ) ( not ( = ?auto_30472 ?auto_30474 ) ) ( not ( = ?auto_30473 ?auto_30474 ) ) ( not ( = ?auto_30472 ?auto_30475 ) ) ( not ( = ?auto_30473 ?auto_30475 ) ) ( not ( = ?auto_30474 ?auto_30475 ) ) ( not ( = ?auto_30477 ?auto_30475 ) ) ( not ( = ?auto_30477 ?auto_30474 ) ) ( not ( = ?auto_30477 ?auto_30473 ) ) ( not ( = ?auto_30472 ?auto_30477 ) ) ( ON ?auto_30472 ?auto_30476 ) ( not ( = ?auto_30472 ?auto_30476 ) ) ( not ( = ?auto_30473 ?auto_30476 ) ) ( not ( = ?auto_30474 ?auto_30476 ) ) ( not ( = ?auto_30475 ?auto_30476 ) ) ( not ( = ?auto_30477 ?auto_30476 ) ) ( ON ?auto_30473 ?auto_30472 ) ( ON-TABLE ?auto_30476 ) ( ON ?auto_30474 ?auto_30473 ) ( ON ?auto_30475 ?auto_30474 ) ( ON ?auto_30477 ?auto_30475 ) ( CLEAR ?auto_30477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30476 ?auto_30472 ?auto_30473 ?auto_30474 ?auto_30475 )
      ( MAKE-3PILE ?auto_30472 ?auto_30473 ?auto_30474 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30479 - BLOCK
    )
    :vars
    (
      ?auto_30480 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30480 ?auto_30479 ) ( CLEAR ?auto_30480 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30479 ) ( not ( = ?auto_30479 ?auto_30480 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30480 ?auto_30479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30481 - BLOCK
    )
    :vars
    (
      ?auto_30482 - BLOCK
      ?auto_30483 - BLOCK
      ?auto_30484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30482 ?auto_30481 ) ( CLEAR ?auto_30482 ) ( ON-TABLE ?auto_30481 ) ( not ( = ?auto_30481 ?auto_30482 ) ) ( HOLDING ?auto_30483 ) ( CLEAR ?auto_30484 ) ( not ( = ?auto_30481 ?auto_30483 ) ) ( not ( = ?auto_30481 ?auto_30484 ) ) ( not ( = ?auto_30482 ?auto_30483 ) ) ( not ( = ?auto_30482 ?auto_30484 ) ) ( not ( = ?auto_30483 ?auto_30484 ) ) )
    :subtasks
    ( ( !STACK ?auto_30483 ?auto_30484 )
      ( MAKE-1PILE ?auto_30481 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30485 - BLOCK
    )
    :vars
    (
      ?auto_30486 - BLOCK
      ?auto_30487 - BLOCK
      ?auto_30488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30486 ?auto_30485 ) ( ON-TABLE ?auto_30485 ) ( not ( = ?auto_30485 ?auto_30486 ) ) ( CLEAR ?auto_30487 ) ( not ( = ?auto_30485 ?auto_30488 ) ) ( not ( = ?auto_30485 ?auto_30487 ) ) ( not ( = ?auto_30486 ?auto_30488 ) ) ( not ( = ?auto_30486 ?auto_30487 ) ) ( not ( = ?auto_30488 ?auto_30487 ) ) ( ON ?auto_30488 ?auto_30486 ) ( CLEAR ?auto_30488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30485 ?auto_30486 )
      ( MAKE-1PILE ?auto_30485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30489 - BLOCK
    )
    :vars
    (
      ?auto_30490 - BLOCK
      ?auto_30492 - BLOCK
      ?auto_30491 - BLOCK
      ?auto_30493 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30490 ?auto_30489 ) ( ON-TABLE ?auto_30489 ) ( not ( = ?auto_30489 ?auto_30490 ) ) ( not ( = ?auto_30489 ?auto_30492 ) ) ( not ( = ?auto_30489 ?auto_30491 ) ) ( not ( = ?auto_30490 ?auto_30492 ) ) ( not ( = ?auto_30490 ?auto_30491 ) ) ( not ( = ?auto_30492 ?auto_30491 ) ) ( ON ?auto_30492 ?auto_30490 ) ( CLEAR ?auto_30492 ) ( HOLDING ?auto_30491 ) ( CLEAR ?auto_30493 ) ( ON-TABLE ?auto_30493 ) ( not ( = ?auto_30493 ?auto_30491 ) ) ( not ( = ?auto_30489 ?auto_30493 ) ) ( not ( = ?auto_30490 ?auto_30493 ) ) ( not ( = ?auto_30492 ?auto_30493 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30493 ?auto_30491 )
      ( MAKE-1PILE ?auto_30489 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30494 - BLOCK
    )
    :vars
    (
      ?auto_30496 - BLOCK
      ?auto_30495 - BLOCK
      ?auto_30498 - BLOCK
      ?auto_30497 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30496 ?auto_30494 ) ( ON-TABLE ?auto_30494 ) ( not ( = ?auto_30494 ?auto_30496 ) ) ( not ( = ?auto_30494 ?auto_30495 ) ) ( not ( = ?auto_30494 ?auto_30498 ) ) ( not ( = ?auto_30496 ?auto_30495 ) ) ( not ( = ?auto_30496 ?auto_30498 ) ) ( not ( = ?auto_30495 ?auto_30498 ) ) ( ON ?auto_30495 ?auto_30496 ) ( CLEAR ?auto_30497 ) ( ON-TABLE ?auto_30497 ) ( not ( = ?auto_30497 ?auto_30498 ) ) ( not ( = ?auto_30494 ?auto_30497 ) ) ( not ( = ?auto_30496 ?auto_30497 ) ) ( not ( = ?auto_30495 ?auto_30497 ) ) ( ON ?auto_30498 ?auto_30495 ) ( CLEAR ?auto_30498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30494 ?auto_30496 ?auto_30495 )
      ( MAKE-1PILE ?auto_30494 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30499 - BLOCK
    )
    :vars
    (
      ?auto_30501 - BLOCK
      ?auto_30503 - BLOCK
      ?auto_30500 - BLOCK
      ?auto_30502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30501 ?auto_30499 ) ( ON-TABLE ?auto_30499 ) ( not ( = ?auto_30499 ?auto_30501 ) ) ( not ( = ?auto_30499 ?auto_30503 ) ) ( not ( = ?auto_30499 ?auto_30500 ) ) ( not ( = ?auto_30501 ?auto_30503 ) ) ( not ( = ?auto_30501 ?auto_30500 ) ) ( not ( = ?auto_30503 ?auto_30500 ) ) ( ON ?auto_30503 ?auto_30501 ) ( not ( = ?auto_30502 ?auto_30500 ) ) ( not ( = ?auto_30499 ?auto_30502 ) ) ( not ( = ?auto_30501 ?auto_30502 ) ) ( not ( = ?auto_30503 ?auto_30502 ) ) ( ON ?auto_30500 ?auto_30503 ) ( CLEAR ?auto_30500 ) ( HOLDING ?auto_30502 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30502 )
      ( MAKE-1PILE ?auto_30499 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30504 - BLOCK
    )
    :vars
    (
      ?auto_30505 - BLOCK
      ?auto_30507 - BLOCK
      ?auto_30508 - BLOCK
      ?auto_30506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30505 ?auto_30504 ) ( ON-TABLE ?auto_30504 ) ( not ( = ?auto_30504 ?auto_30505 ) ) ( not ( = ?auto_30504 ?auto_30507 ) ) ( not ( = ?auto_30504 ?auto_30508 ) ) ( not ( = ?auto_30505 ?auto_30507 ) ) ( not ( = ?auto_30505 ?auto_30508 ) ) ( not ( = ?auto_30507 ?auto_30508 ) ) ( ON ?auto_30507 ?auto_30505 ) ( not ( = ?auto_30506 ?auto_30508 ) ) ( not ( = ?auto_30504 ?auto_30506 ) ) ( not ( = ?auto_30505 ?auto_30506 ) ) ( not ( = ?auto_30507 ?auto_30506 ) ) ( ON ?auto_30508 ?auto_30507 ) ( ON ?auto_30506 ?auto_30508 ) ( CLEAR ?auto_30506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30504 ?auto_30505 ?auto_30507 ?auto_30508 )
      ( MAKE-1PILE ?auto_30504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30509 - BLOCK
    )
    :vars
    (
      ?auto_30511 - BLOCK
      ?auto_30512 - BLOCK
      ?auto_30513 - BLOCK
      ?auto_30510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30511 ?auto_30509 ) ( ON-TABLE ?auto_30509 ) ( not ( = ?auto_30509 ?auto_30511 ) ) ( not ( = ?auto_30509 ?auto_30512 ) ) ( not ( = ?auto_30509 ?auto_30513 ) ) ( not ( = ?auto_30511 ?auto_30512 ) ) ( not ( = ?auto_30511 ?auto_30513 ) ) ( not ( = ?auto_30512 ?auto_30513 ) ) ( ON ?auto_30512 ?auto_30511 ) ( not ( = ?auto_30510 ?auto_30513 ) ) ( not ( = ?auto_30509 ?auto_30510 ) ) ( not ( = ?auto_30511 ?auto_30510 ) ) ( not ( = ?auto_30512 ?auto_30510 ) ) ( ON ?auto_30513 ?auto_30512 ) ( HOLDING ?auto_30510 ) ( CLEAR ?auto_30513 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30509 ?auto_30511 ?auto_30512 ?auto_30513 ?auto_30510 )
      ( MAKE-1PILE ?auto_30509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30514 - BLOCK
    )
    :vars
    (
      ?auto_30517 - BLOCK
      ?auto_30516 - BLOCK
      ?auto_30518 - BLOCK
      ?auto_30515 - BLOCK
      ?auto_30519 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30517 ?auto_30514 ) ( ON-TABLE ?auto_30514 ) ( not ( = ?auto_30514 ?auto_30517 ) ) ( not ( = ?auto_30514 ?auto_30516 ) ) ( not ( = ?auto_30514 ?auto_30518 ) ) ( not ( = ?auto_30517 ?auto_30516 ) ) ( not ( = ?auto_30517 ?auto_30518 ) ) ( not ( = ?auto_30516 ?auto_30518 ) ) ( ON ?auto_30516 ?auto_30517 ) ( not ( = ?auto_30515 ?auto_30518 ) ) ( not ( = ?auto_30514 ?auto_30515 ) ) ( not ( = ?auto_30517 ?auto_30515 ) ) ( not ( = ?auto_30516 ?auto_30515 ) ) ( ON ?auto_30518 ?auto_30516 ) ( CLEAR ?auto_30518 ) ( ON ?auto_30515 ?auto_30519 ) ( CLEAR ?auto_30515 ) ( HAND-EMPTY ) ( not ( = ?auto_30514 ?auto_30519 ) ) ( not ( = ?auto_30517 ?auto_30519 ) ) ( not ( = ?auto_30516 ?auto_30519 ) ) ( not ( = ?auto_30518 ?auto_30519 ) ) ( not ( = ?auto_30515 ?auto_30519 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30515 ?auto_30519 )
      ( MAKE-1PILE ?auto_30514 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30520 - BLOCK
    )
    :vars
    (
      ?auto_30522 - BLOCK
      ?auto_30525 - BLOCK
      ?auto_30521 - BLOCK
      ?auto_30523 - BLOCK
      ?auto_30524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30522 ?auto_30520 ) ( ON-TABLE ?auto_30520 ) ( not ( = ?auto_30520 ?auto_30522 ) ) ( not ( = ?auto_30520 ?auto_30525 ) ) ( not ( = ?auto_30520 ?auto_30521 ) ) ( not ( = ?auto_30522 ?auto_30525 ) ) ( not ( = ?auto_30522 ?auto_30521 ) ) ( not ( = ?auto_30525 ?auto_30521 ) ) ( ON ?auto_30525 ?auto_30522 ) ( not ( = ?auto_30523 ?auto_30521 ) ) ( not ( = ?auto_30520 ?auto_30523 ) ) ( not ( = ?auto_30522 ?auto_30523 ) ) ( not ( = ?auto_30525 ?auto_30523 ) ) ( ON ?auto_30523 ?auto_30524 ) ( CLEAR ?auto_30523 ) ( not ( = ?auto_30520 ?auto_30524 ) ) ( not ( = ?auto_30522 ?auto_30524 ) ) ( not ( = ?auto_30525 ?auto_30524 ) ) ( not ( = ?auto_30521 ?auto_30524 ) ) ( not ( = ?auto_30523 ?auto_30524 ) ) ( HOLDING ?auto_30521 ) ( CLEAR ?auto_30525 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30520 ?auto_30522 ?auto_30525 ?auto_30521 )
      ( MAKE-1PILE ?auto_30520 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30526 - BLOCK
    )
    :vars
    (
      ?auto_30530 - BLOCK
      ?auto_30527 - BLOCK
      ?auto_30529 - BLOCK
      ?auto_30528 - BLOCK
      ?auto_30531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30530 ?auto_30526 ) ( ON-TABLE ?auto_30526 ) ( not ( = ?auto_30526 ?auto_30530 ) ) ( not ( = ?auto_30526 ?auto_30527 ) ) ( not ( = ?auto_30526 ?auto_30529 ) ) ( not ( = ?auto_30530 ?auto_30527 ) ) ( not ( = ?auto_30530 ?auto_30529 ) ) ( not ( = ?auto_30527 ?auto_30529 ) ) ( ON ?auto_30527 ?auto_30530 ) ( not ( = ?auto_30528 ?auto_30529 ) ) ( not ( = ?auto_30526 ?auto_30528 ) ) ( not ( = ?auto_30530 ?auto_30528 ) ) ( not ( = ?auto_30527 ?auto_30528 ) ) ( ON ?auto_30528 ?auto_30531 ) ( not ( = ?auto_30526 ?auto_30531 ) ) ( not ( = ?auto_30530 ?auto_30531 ) ) ( not ( = ?auto_30527 ?auto_30531 ) ) ( not ( = ?auto_30529 ?auto_30531 ) ) ( not ( = ?auto_30528 ?auto_30531 ) ) ( CLEAR ?auto_30527 ) ( ON ?auto_30529 ?auto_30528 ) ( CLEAR ?auto_30529 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30531 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30531 ?auto_30528 )
      ( MAKE-1PILE ?auto_30526 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30532 - BLOCK
    )
    :vars
    (
      ?auto_30536 - BLOCK
      ?auto_30534 - BLOCK
      ?auto_30533 - BLOCK
      ?auto_30537 - BLOCK
      ?auto_30535 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30536 ?auto_30532 ) ( ON-TABLE ?auto_30532 ) ( not ( = ?auto_30532 ?auto_30536 ) ) ( not ( = ?auto_30532 ?auto_30534 ) ) ( not ( = ?auto_30532 ?auto_30533 ) ) ( not ( = ?auto_30536 ?auto_30534 ) ) ( not ( = ?auto_30536 ?auto_30533 ) ) ( not ( = ?auto_30534 ?auto_30533 ) ) ( not ( = ?auto_30537 ?auto_30533 ) ) ( not ( = ?auto_30532 ?auto_30537 ) ) ( not ( = ?auto_30536 ?auto_30537 ) ) ( not ( = ?auto_30534 ?auto_30537 ) ) ( ON ?auto_30537 ?auto_30535 ) ( not ( = ?auto_30532 ?auto_30535 ) ) ( not ( = ?auto_30536 ?auto_30535 ) ) ( not ( = ?auto_30534 ?auto_30535 ) ) ( not ( = ?auto_30533 ?auto_30535 ) ) ( not ( = ?auto_30537 ?auto_30535 ) ) ( ON ?auto_30533 ?auto_30537 ) ( CLEAR ?auto_30533 ) ( ON-TABLE ?auto_30535 ) ( HOLDING ?auto_30534 ) ( CLEAR ?auto_30536 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30532 ?auto_30536 ?auto_30534 )
      ( MAKE-1PILE ?auto_30532 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30538 - BLOCK
    )
    :vars
    (
      ?auto_30539 - BLOCK
      ?auto_30541 - BLOCK
      ?auto_30542 - BLOCK
      ?auto_30540 - BLOCK
      ?auto_30543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30539 ?auto_30538 ) ( ON-TABLE ?auto_30538 ) ( not ( = ?auto_30538 ?auto_30539 ) ) ( not ( = ?auto_30538 ?auto_30541 ) ) ( not ( = ?auto_30538 ?auto_30542 ) ) ( not ( = ?auto_30539 ?auto_30541 ) ) ( not ( = ?auto_30539 ?auto_30542 ) ) ( not ( = ?auto_30541 ?auto_30542 ) ) ( not ( = ?auto_30540 ?auto_30542 ) ) ( not ( = ?auto_30538 ?auto_30540 ) ) ( not ( = ?auto_30539 ?auto_30540 ) ) ( not ( = ?auto_30541 ?auto_30540 ) ) ( ON ?auto_30540 ?auto_30543 ) ( not ( = ?auto_30538 ?auto_30543 ) ) ( not ( = ?auto_30539 ?auto_30543 ) ) ( not ( = ?auto_30541 ?auto_30543 ) ) ( not ( = ?auto_30542 ?auto_30543 ) ) ( not ( = ?auto_30540 ?auto_30543 ) ) ( ON ?auto_30542 ?auto_30540 ) ( ON-TABLE ?auto_30543 ) ( CLEAR ?auto_30539 ) ( ON ?auto_30541 ?auto_30542 ) ( CLEAR ?auto_30541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30543 ?auto_30540 ?auto_30542 )
      ( MAKE-1PILE ?auto_30538 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30556 - BLOCK
    )
    :vars
    (
      ?auto_30561 - BLOCK
      ?auto_30558 - BLOCK
      ?auto_30557 - BLOCK
      ?auto_30560 - BLOCK
      ?auto_30559 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30556 ?auto_30561 ) ) ( not ( = ?auto_30556 ?auto_30558 ) ) ( not ( = ?auto_30556 ?auto_30557 ) ) ( not ( = ?auto_30561 ?auto_30558 ) ) ( not ( = ?auto_30561 ?auto_30557 ) ) ( not ( = ?auto_30558 ?auto_30557 ) ) ( not ( = ?auto_30560 ?auto_30557 ) ) ( not ( = ?auto_30556 ?auto_30560 ) ) ( not ( = ?auto_30561 ?auto_30560 ) ) ( not ( = ?auto_30558 ?auto_30560 ) ) ( ON ?auto_30560 ?auto_30559 ) ( not ( = ?auto_30556 ?auto_30559 ) ) ( not ( = ?auto_30561 ?auto_30559 ) ) ( not ( = ?auto_30558 ?auto_30559 ) ) ( not ( = ?auto_30557 ?auto_30559 ) ) ( not ( = ?auto_30560 ?auto_30559 ) ) ( ON ?auto_30557 ?auto_30560 ) ( ON-TABLE ?auto_30559 ) ( ON ?auto_30558 ?auto_30557 ) ( ON ?auto_30561 ?auto_30558 ) ( CLEAR ?auto_30561 ) ( HOLDING ?auto_30556 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30556 ?auto_30561 )
      ( MAKE-1PILE ?auto_30556 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_30562 - BLOCK
    )
    :vars
    (
      ?auto_30563 - BLOCK
      ?auto_30565 - BLOCK
      ?auto_30566 - BLOCK
      ?auto_30564 - BLOCK
      ?auto_30567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30562 ?auto_30563 ) ) ( not ( = ?auto_30562 ?auto_30565 ) ) ( not ( = ?auto_30562 ?auto_30566 ) ) ( not ( = ?auto_30563 ?auto_30565 ) ) ( not ( = ?auto_30563 ?auto_30566 ) ) ( not ( = ?auto_30565 ?auto_30566 ) ) ( not ( = ?auto_30564 ?auto_30566 ) ) ( not ( = ?auto_30562 ?auto_30564 ) ) ( not ( = ?auto_30563 ?auto_30564 ) ) ( not ( = ?auto_30565 ?auto_30564 ) ) ( ON ?auto_30564 ?auto_30567 ) ( not ( = ?auto_30562 ?auto_30567 ) ) ( not ( = ?auto_30563 ?auto_30567 ) ) ( not ( = ?auto_30565 ?auto_30567 ) ) ( not ( = ?auto_30566 ?auto_30567 ) ) ( not ( = ?auto_30564 ?auto_30567 ) ) ( ON ?auto_30566 ?auto_30564 ) ( ON-TABLE ?auto_30567 ) ( ON ?auto_30565 ?auto_30566 ) ( ON ?auto_30563 ?auto_30565 ) ( ON ?auto_30562 ?auto_30563 ) ( CLEAR ?auto_30562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30567 ?auto_30564 ?auto_30566 ?auto_30565 ?auto_30563 )
      ( MAKE-1PILE ?auto_30562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30572 - BLOCK
      ?auto_30573 - BLOCK
      ?auto_30574 - BLOCK
      ?auto_30575 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30575 ) ( CLEAR ?auto_30574 ) ( ON-TABLE ?auto_30572 ) ( ON ?auto_30573 ?auto_30572 ) ( ON ?auto_30574 ?auto_30573 ) ( not ( = ?auto_30572 ?auto_30573 ) ) ( not ( = ?auto_30572 ?auto_30574 ) ) ( not ( = ?auto_30572 ?auto_30575 ) ) ( not ( = ?auto_30573 ?auto_30574 ) ) ( not ( = ?auto_30573 ?auto_30575 ) ) ( not ( = ?auto_30574 ?auto_30575 ) ) )
    :subtasks
    ( ( !STACK ?auto_30575 ?auto_30574 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30576 - BLOCK
      ?auto_30577 - BLOCK
      ?auto_30578 - BLOCK
      ?auto_30579 - BLOCK
    )
    :vars
    (
      ?auto_30580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30578 ) ( ON-TABLE ?auto_30576 ) ( ON ?auto_30577 ?auto_30576 ) ( ON ?auto_30578 ?auto_30577 ) ( not ( = ?auto_30576 ?auto_30577 ) ) ( not ( = ?auto_30576 ?auto_30578 ) ) ( not ( = ?auto_30576 ?auto_30579 ) ) ( not ( = ?auto_30577 ?auto_30578 ) ) ( not ( = ?auto_30577 ?auto_30579 ) ) ( not ( = ?auto_30578 ?auto_30579 ) ) ( ON ?auto_30579 ?auto_30580 ) ( CLEAR ?auto_30579 ) ( HAND-EMPTY ) ( not ( = ?auto_30576 ?auto_30580 ) ) ( not ( = ?auto_30577 ?auto_30580 ) ) ( not ( = ?auto_30578 ?auto_30580 ) ) ( not ( = ?auto_30579 ?auto_30580 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30579 ?auto_30580 )
      ( MAKE-4PILE ?auto_30576 ?auto_30577 ?auto_30578 ?auto_30579 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30581 - BLOCK
      ?auto_30582 - BLOCK
      ?auto_30583 - BLOCK
      ?auto_30584 - BLOCK
    )
    :vars
    (
      ?auto_30585 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30581 ) ( ON ?auto_30582 ?auto_30581 ) ( not ( = ?auto_30581 ?auto_30582 ) ) ( not ( = ?auto_30581 ?auto_30583 ) ) ( not ( = ?auto_30581 ?auto_30584 ) ) ( not ( = ?auto_30582 ?auto_30583 ) ) ( not ( = ?auto_30582 ?auto_30584 ) ) ( not ( = ?auto_30583 ?auto_30584 ) ) ( ON ?auto_30584 ?auto_30585 ) ( CLEAR ?auto_30584 ) ( not ( = ?auto_30581 ?auto_30585 ) ) ( not ( = ?auto_30582 ?auto_30585 ) ) ( not ( = ?auto_30583 ?auto_30585 ) ) ( not ( = ?auto_30584 ?auto_30585 ) ) ( HOLDING ?auto_30583 ) ( CLEAR ?auto_30582 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30581 ?auto_30582 ?auto_30583 )
      ( MAKE-4PILE ?auto_30581 ?auto_30582 ?auto_30583 ?auto_30584 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30586 - BLOCK
      ?auto_30587 - BLOCK
      ?auto_30588 - BLOCK
      ?auto_30589 - BLOCK
    )
    :vars
    (
      ?auto_30590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30586 ) ( ON ?auto_30587 ?auto_30586 ) ( not ( = ?auto_30586 ?auto_30587 ) ) ( not ( = ?auto_30586 ?auto_30588 ) ) ( not ( = ?auto_30586 ?auto_30589 ) ) ( not ( = ?auto_30587 ?auto_30588 ) ) ( not ( = ?auto_30587 ?auto_30589 ) ) ( not ( = ?auto_30588 ?auto_30589 ) ) ( ON ?auto_30589 ?auto_30590 ) ( not ( = ?auto_30586 ?auto_30590 ) ) ( not ( = ?auto_30587 ?auto_30590 ) ) ( not ( = ?auto_30588 ?auto_30590 ) ) ( not ( = ?auto_30589 ?auto_30590 ) ) ( CLEAR ?auto_30587 ) ( ON ?auto_30588 ?auto_30589 ) ( CLEAR ?auto_30588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30590 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30590 ?auto_30589 )
      ( MAKE-4PILE ?auto_30586 ?auto_30587 ?auto_30588 ?auto_30589 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30591 - BLOCK
      ?auto_30592 - BLOCK
      ?auto_30593 - BLOCK
      ?auto_30594 - BLOCK
    )
    :vars
    (
      ?auto_30595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30591 ) ( not ( = ?auto_30591 ?auto_30592 ) ) ( not ( = ?auto_30591 ?auto_30593 ) ) ( not ( = ?auto_30591 ?auto_30594 ) ) ( not ( = ?auto_30592 ?auto_30593 ) ) ( not ( = ?auto_30592 ?auto_30594 ) ) ( not ( = ?auto_30593 ?auto_30594 ) ) ( ON ?auto_30594 ?auto_30595 ) ( not ( = ?auto_30591 ?auto_30595 ) ) ( not ( = ?auto_30592 ?auto_30595 ) ) ( not ( = ?auto_30593 ?auto_30595 ) ) ( not ( = ?auto_30594 ?auto_30595 ) ) ( ON ?auto_30593 ?auto_30594 ) ( CLEAR ?auto_30593 ) ( ON-TABLE ?auto_30595 ) ( HOLDING ?auto_30592 ) ( CLEAR ?auto_30591 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30591 ?auto_30592 )
      ( MAKE-4PILE ?auto_30591 ?auto_30592 ?auto_30593 ?auto_30594 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30596 - BLOCK
      ?auto_30597 - BLOCK
      ?auto_30598 - BLOCK
      ?auto_30599 - BLOCK
    )
    :vars
    (
      ?auto_30600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30596 ) ( not ( = ?auto_30596 ?auto_30597 ) ) ( not ( = ?auto_30596 ?auto_30598 ) ) ( not ( = ?auto_30596 ?auto_30599 ) ) ( not ( = ?auto_30597 ?auto_30598 ) ) ( not ( = ?auto_30597 ?auto_30599 ) ) ( not ( = ?auto_30598 ?auto_30599 ) ) ( ON ?auto_30599 ?auto_30600 ) ( not ( = ?auto_30596 ?auto_30600 ) ) ( not ( = ?auto_30597 ?auto_30600 ) ) ( not ( = ?auto_30598 ?auto_30600 ) ) ( not ( = ?auto_30599 ?auto_30600 ) ) ( ON ?auto_30598 ?auto_30599 ) ( ON-TABLE ?auto_30600 ) ( CLEAR ?auto_30596 ) ( ON ?auto_30597 ?auto_30598 ) ( CLEAR ?auto_30597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30600 ?auto_30599 ?auto_30598 )
      ( MAKE-4PILE ?auto_30596 ?auto_30597 ?auto_30598 ?auto_30599 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30601 - BLOCK
      ?auto_30602 - BLOCK
      ?auto_30603 - BLOCK
      ?auto_30604 - BLOCK
    )
    :vars
    (
      ?auto_30605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30601 ?auto_30602 ) ) ( not ( = ?auto_30601 ?auto_30603 ) ) ( not ( = ?auto_30601 ?auto_30604 ) ) ( not ( = ?auto_30602 ?auto_30603 ) ) ( not ( = ?auto_30602 ?auto_30604 ) ) ( not ( = ?auto_30603 ?auto_30604 ) ) ( ON ?auto_30604 ?auto_30605 ) ( not ( = ?auto_30601 ?auto_30605 ) ) ( not ( = ?auto_30602 ?auto_30605 ) ) ( not ( = ?auto_30603 ?auto_30605 ) ) ( not ( = ?auto_30604 ?auto_30605 ) ) ( ON ?auto_30603 ?auto_30604 ) ( ON-TABLE ?auto_30605 ) ( ON ?auto_30602 ?auto_30603 ) ( CLEAR ?auto_30602 ) ( HOLDING ?auto_30601 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30601 )
      ( MAKE-4PILE ?auto_30601 ?auto_30602 ?auto_30603 ?auto_30604 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30606 - BLOCK
      ?auto_30607 - BLOCK
      ?auto_30608 - BLOCK
      ?auto_30609 - BLOCK
    )
    :vars
    (
      ?auto_30610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30606 ?auto_30607 ) ) ( not ( = ?auto_30606 ?auto_30608 ) ) ( not ( = ?auto_30606 ?auto_30609 ) ) ( not ( = ?auto_30607 ?auto_30608 ) ) ( not ( = ?auto_30607 ?auto_30609 ) ) ( not ( = ?auto_30608 ?auto_30609 ) ) ( ON ?auto_30609 ?auto_30610 ) ( not ( = ?auto_30606 ?auto_30610 ) ) ( not ( = ?auto_30607 ?auto_30610 ) ) ( not ( = ?auto_30608 ?auto_30610 ) ) ( not ( = ?auto_30609 ?auto_30610 ) ) ( ON ?auto_30608 ?auto_30609 ) ( ON-TABLE ?auto_30610 ) ( ON ?auto_30607 ?auto_30608 ) ( ON ?auto_30606 ?auto_30607 ) ( CLEAR ?auto_30606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30610 ?auto_30609 ?auto_30608 ?auto_30607 )
      ( MAKE-4PILE ?auto_30606 ?auto_30607 ?auto_30608 ?auto_30609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30611 - BLOCK
      ?auto_30612 - BLOCK
      ?auto_30613 - BLOCK
      ?auto_30614 - BLOCK
    )
    :vars
    (
      ?auto_30615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30611 ?auto_30612 ) ) ( not ( = ?auto_30611 ?auto_30613 ) ) ( not ( = ?auto_30611 ?auto_30614 ) ) ( not ( = ?auto_30612 ?auto_30613 ) ) ( not ( = ?auto_30612 ?auto_30614 ) ) ( not ( = ?auto_30613 ?auto_30614 ) ) ( ON ?auto_30614 ?auto_30615 ) ( not ( = ?auto_30611 ?auto_30615 ) ) ( not ( = ?auto_30612 ?auto_30615 ) ) ( not ( = ?auto_30613 ?auto_30615 ) ) ( not ( = ?auto_30614 ?auto_30615 ) ) ( ON ?auto_30613 ?auto_30614 ) ( ON-TABLE ?auto_30615 ) ( ON ?auto_30612 ?auto_30613 ) ( HOLDING ?auto_30611 ) ( CLEAR ?auto_30612 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30615 ?auto_30614 ?auto_30613 ?auto_30612 ?auto_30611 )
      ( MAKE-4PILE ?auto_30611 ?auto_30612 ?auto_30613 ?auto_30614 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30616 - BLOCK
      ?auto_30617 - BLOCK
      ?auto_30618 - BLOCK
      ?auto_30619 - BLOCK
    )
    :vars
    (
      ?auto_30620 - BLOCK
      ?auto_30621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30616 ?auto_30617 ) ) ( not ( = ?auto_30616 ?auto_30618 ) ) ( not ( = ?auto_30616 ?auto_30619 ) ) ( not ( = ?auto_30617 ?auto_30618 ) ) ( not ( = ?auto_30617 ?auto_30619 ) ) ( not ( = ?auto_30618 ?auto_30619 ) ) ( ON ?auto_30619 ?auto_30620 ) ( not ( = ?auto_30616 ?auto_30620 ) ) ( not ( = ?auto_30617 ?auto_30620 ) ) ( not ( = ?auto_30618 ?auto_30620 ) ) ( not ( = ?auto_30619 ?auto_30620 ) ) ( ON ?auto_30618 ?auto_30619 ) ( ON-TABLE ?auto_30620 ) ( ON ?auto_30617 ?auto_30618 ) ( CLEAR ?auto_30617 ) ( ON ?auto_30616 ?auto_30621 ) ( CLEAR ?auto_30616 ) ( HAND-EMPTY ) ( not ( = ?auto_30616 ?auto_30621 ) ) ( not ( = ?auto_30617 ?auto_30621 ) ) ( not ( = ?auto_30618 ?auto_30621 ) ) ( not ( = ?auto_30619 ?auto_30621 ) ) ( not ( = ?auto_30620 ?auto_30621 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30616 ?auto_30621 )
      ( MAKE-4PILE ?auto_30616 ?auto_30617 ?auto_30618 ?auto_30619 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30622 - BLOCK
      ?auto_30623 - BLOCK
      ?auto_30624 - BLOCK
      ?auto_30625 - BLOCK
    )
    :vars
    (
      ?auto_30627 - BLOCK
      ?auto_30626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30622 ?auto_30623 ) ) ( not ( = ?auto_30622 ?auto_30624 ) ) ( not ( = ?auto_30622 ?auto_30625 ) ) ( not ( = ?auto_30623 ?auto_30624 ) ) ( not ( = ?auto_30623 ?auto_30625 ) ) ( not ( = ?auto_30624 ?auto_30625 ) ) ( ON ?auto_30625 ?auto_30627 ) ( not ( = ?auto_30622 ?auto_30627 ) ) ( not ( = ?auto_30623 ?auto_30627 ) ) ( not ( = ?auto_30624 ?auto_30627 ) ) ( not ( = ?auto_30625 ?auto_30627 ) ) ( ON ?auto_30624 ?auto_30625 ) ( ON-TABLE ?auto_30627 ) ( ON ?auto_30622 ?auto_30626 ) ( CLEAR ?auto_30622 ) ( not ( = ?auto_30622 ?auto_30626 ) ) ( not ( = ?auto_30623 ?auto_30626 ) ) ( not ( = ?auto_30624 ?auto_30626 ) ) ( not ( = ?auto_30625 ?auto_30626 ) ) ( not ( = ?auto_30627 ?auto_30626 ) ) ( HOLDING ?auto_30623 ) ( CLEAR ?auto_30624 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30627 ?auto_30625 ?auto_30624 ?auto_30623 )
      ( MAKE-4PILE ?auto_30622 ?auto_30623 ?auto_30624 ?auto_30625 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30628 - BLOCK
      ?auto_30629 - BLOCK
      ?auto_30630 - BLOCK
      ?auto_30631 - BLOCK
    )
    :vars
    (
      ?auto_30632 - BLOCK
      ?auto_30633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30628 ?auto_30629 ) ) ( not ( = ?auto_30628 ?auto_30630 ) ) ( not ( = ?auto_30628 ?auto_30631 ) ) ( not ( = ?auto_30629 ?auto_30630 ) ) ( not ( = ?auto_30629 ?auto_30631 ) ) ( not ( = ?auto_30630 ?auto_30631 ) ) ( ON ?auto_30631 ?auto_30632 ) ( not ( = ?auto_30628 ?auto_30632 ) ) ( not ( = ?auto_30629 ?auto_30632 ) ) ( not ( = ?auto_30630 ?auto_30632 ) ) ( not ( = ?auto_30631 ?auto_30632 ) ) ( ON ?auto_30630 ?auto_30631 ) ( ON-TABLE ?auto_30632 ) ( ON ?auto_30628 ?auto_30633 ) ( not ( = ?auto_30628 ?auto_30633 ) ) ( not ( = ?auto_30629 ?auto_30633 ) ) ( not ( = ?auto_30630 ?auto_30633 ) ) ( not ( = ?auto_30631 ?auto_30633 ) ) ( not ( = ?auto_30632 ?auto_30633 ) ) ( CLEAR ?auto_30630 ) ( ON ?auto_30629 ?auto_30628 ) ( CLEAR ?auto_30629 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30633 ?auto_30628 )
      ( MAKE-4PILE ?auto_30628 ?auto_30629 ?auto_30630 ?auto_30631 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30634 - BLOCK
      ?auto_30635 - BLOCK
      ?auto_30636 - BLOCK
      ?auto_30637 - BLOCK
    )
    :vars
    (
      ?auto_30638 - BLOCK
      ?auto_30639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30634 ?auto_30635 ) ) ( not ( = ?auto_30634 ?auto_30636 ) ) ( not ( = ?auto_30634 ?auto_30637 ) ) ( not ( = ?auto_30635 ?auto_30636 ) ) ( not ( = ?auto_30635 ?auto_30637 ) ) ( not ( = ?auto_30636 ?auto_30637 ) ) ( ON ?auto_30637 ?auto_30638 ) ( not ( = ?auto_30634 ?auto_30638 ) ) ( not ( = ?auto_30635 ?auto_30638 ) ) ( not ( = ?auto_30636 ?auto_30638 ) ) ( not ( = ?auto_30637 ?auto_30638 ) ) ( ON-TABLE ?auto_30638 ) ( ON ?auto_30634 ?auto_30639 ) ( not ( = ?auto_30634 ?auto_30639 ) ) ( not ( = ?auto_30635 ?auto_30639 ) ) ( not ( = ?auto_30636 ?auto_30639 ) ) ( not ( = ?auto_30637 ?auto_30639 ) ) ( not ( = ?auto_30638 ?auto_30639 ) ) ( ON ?auto_30635 ?auto_30634 ) ( CLEAR ?auto_30635 ) ( ON-TABLE ?auto_30639 ) ( HOLDING ?auto_30636 ) ( CLEAR ?auto_30637 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30638 ?auto_30637 ?auto_30636 )
      ( MAKE-4PILE ?auto_30634 ?auto_30635 ?auto_30636 ?auto_30637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30640 - BLOCK
      ?auto_30641 - BLOCK
      ?auto_30642 - BLOCK
      ?auto_30643 - BLOCK
    )
    :vars
    (
      ?auto_30645 - BLOCK
      ?auto_30644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30640 ?auto_30641 ) ) ( not ( = ?auto_30640 ?auto_30642 ) ) ( not ( = ?auto_30640 ?auto_30643 ) ) ( not ( = ?auto_30641 ?auto_30642 ) ) ( not ( = ?auto_30641 ?auto_30643 ) ) ( not ( = ?auto_30642 ?auto_30643 ) ) ( ON ?auto_30643 ?auto_30645 ) ( not ( = ?auto_30640 ?auto_30645 ) ) ( not ( = ?auto_30641 ?auto_30645 ) ) ( not ( = ?auto_30642 ?auto_30645 ) ) ( not ( = ?auto_30643 ?auto_30645 ) ) ( ON-TABLE ?auto_30645 ) ( ON ?auto_30640 ?auto_30644 ) ( not ( = ?auto_30640 ?auto_30644 ) ) ( not ( = ?auto_30641 ?auto_30644 ) ) ( not ( = ?auto_30642 ?auto_30644 ) ) ( not ( = ?auto_30643 ?auto_30644 ) ) ( not ( = ?auto_30645 ?auto_30644 ) ) ( ON ?auto_30641 ?auto_30640 ) ( ON-TABLE ?auto_30644 ) ( CLEAR ?auto_30643 ) ( ON ?auto_30642 ?auto_30641 ) ( CLEAR ?auto_30642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30644 ?auto_30640 ?auto_30641 )
      ( MAKE-4PILE ?auto_30640 ?auto_30641 ?auto_30642 ?auto_30643 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30646 - BLOCK
      ?auto_30647 - BLOCK
      ?auto_30648 - BLOCK
      ?auto_30649 - BLOCK
    )
    :vars
    (
      ?auto_30650 - BLOCK
      ?auto_30651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30646 ?auto_30647 ) ) ( not ( = ?auto_30646 ?auto_30648 ) ) ( not ( = ?auto_30646 ?auto_30649 ) ) ( not ( = ?auto_30647 ?auto_30648 ) ) ( not ( = ?auto_30647 ?auto_30649 ) ) ( not ( = ?auto_30648 ?auto_30649 ) ) ( not ( = ?auto_30646 ?auto_30650 ) ) ( not ( = ?auto_30647 ?auto_30650 ) ) ( not ( = ?auto_30648 ?auto_30650 ) ) ( not ( = ?auto_30649 ?auto_30650 ) ) ( ON-TABLE ?auto_30650 ) ( ON ?auto_30646 ?auto_30651 ) ( not ( = ?auto_30646 ?auto_30651 ) ) ( not ( = ?auto_30647 ?auto_30651 ) ) ( not ( = ?auto_30648 ?auto_30651 ) ) ( not ( = ?auto_30649 ?auto_30651 ) ) ( not ( = ?auto_30650 ?auto_30651 ) ) ( ON ?auto_30647 ?auto_30646 ) ( ON-TABLE ?auto_30651 ) ( ON ?auto_30648 ?auto_30647 ) ( CLEAR ?auto_30648 ) ( HOLDING ?auto_30649 ) ( CLEAR ?auto_30650 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30650 ?auto_30649 )
      ( MAKE-4PILE ?auto_30646 ?auto_30647 ?auto_30648 ?auto_30649 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30652 - BLOCK
      ?auto_30653 - BLOCK
      ?auto_30654 - BLOCK
      ?auto_30655 - BLOCK
    )
    :vars
    (
      ?auto_30656 - BLOCK
      ?auto_30657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30652 ?auto_30653 ) ) ( not ( = ?auto_30652 ?auto_30654 ) ) ( not ( = ?auto_30652 ?auto_30655 ) ) ( not ( = ?auto_30653 ?auto_30654 ) ) ( not ( = ?auto_30653 ?auto_30655 ) ) ( not ( = ?auto_30654 ?auto_30655 ) ) ( not ( = ?auto_30652 ?auto_30656 ) ) ( not ( = ?auto_30653 ?auto_30656 ) ) ( not ( = ?auto_30654 ?auto_30656 ) ) ( not ( = ?auto_30655 ?auto_30656 ) ) ( ON-TABLE ?auto_30656 ) ( ON ?auto_30652 ?auto_30657 ) ( not ( = ?auto_30652 ?auto_30657 ) ) ( not ( = ?auto_30653 ?auto_30657 ) ) ( not ( = ?auto_30654 ?auto_30657 ) ) ( not ( = ?auto_30655 ?auto_30657 ) ) ( not ( = ?auto_30656 ?auto_30657 ) ) ( ON ?auto_30653 ?auto_30652 ) ( ON-TABLE ?auto_30657 ) ( ON ?auto_30654 ?auto_30653 ) ( CLEAR ?auto_30656 ) ( ON ?auto_30655 ?auto_30654 ) ( CLEAR ?auto_30655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30657 ?auto_30652 ?auto_30653 ?auto_30654 )
      ( MAKE-4PILE ?auto_30652 ?auto_30653 ?auto_30654 ?auto_30655 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30658 - BLOCK
      ?auto_30659 - BLOCK
      ?auto_30660 - BLOCK
      ?auto_30661 - BLOCK
    )
    :vars
    (
      ?auto_30663 - BLOCK
      ?auto_30662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30658 ?auto_30659 ) ) ( not ( = ?auto_30658 ?auto_30660 ) ) ( not ( = ?auto_30658 ?auto_30661 ) ) ( not ( = ?auto_30659 ?auto_30660 ) ) ( not ( = ?auto_30659 ?auto_30661 ) ) ( not ( = ?auto_30660 ?auto_30661 ) ) ( not ( = ?auto_30658 ?auto_30663 ) ) ( not ( = ?auto_30659 ?auto_30663 ) ) ( not ( = ?auto_30660 ?auto_30663 ) ) ( not ( = ?auto_30661 ?auto_30663 ) ) ( ON ?auto_30658 ?auto_30662 ) ( not ( = ?auto_30658 ?auto_30662 ) ) ( not ( = ?auto_30659 ?auto_30662 ) ) ( not ( = ?auto_30660 ?auto_30662 ) ) ( not ( = ?auto_30661 ?auto_30662 ) ) ( not ( = ?auto_30663 ?auto_30662 ) ) ( ON ?auto_30659 ?auto_30658 ) ( ON-TABLE ?auto_30662 ) ( ON ?auto_30660 ?auto_30659 ) ( ON ?auto_30661 ?auto_30660 ) ( CLEAR ?auto_30661 ) ( HOLDING ?auto_30663 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30663 )
      ( MAKE-4PILE ?auto_30658 ?auto_30659 ?auto_30660 ?auto_30661 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_30664 - BLOCK
      ?auto_30665 - BLOCK
      ?auto_30666 - BLOCK
      ?auto_30667 - BLOCK
    )
    :vars
    (
      ?auto_30669 - BLOCK
      ?auto_30668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30664 ?auto_30665 ) ) ( not ( = ?auto_30664 ?auto_30666 ) ) ( not ( = ?auto_30664 ?auto_30667 ) ) ( not ( = ?auto_30665 ?auto_30666 ) ) ( not ( = ?auto_30665 ?auto_30667 ) ) ( not ( = ?auto_30666 ?auto_30667 ) ) ( not ( = ?auto_30664 ?auto_30669 ) ) ( not ( = ?auto_30665 ?auto_30669 ) ) ( not ( = ?auto_30666 ?auto_30669 ) ) ( not ( = ?auto_30667 ?auto_30669 ) ) ( ON ?auto_30664 ?auto_30668 ) ( not ( = ?auto_30664 ?auto_30668 ) ) ( not ( = ?auto_30665 ?auto_30668 ) ) ( not ( = ?auto_30666 ?auto_30668 ) ) ( not ( = ?auto_30667 ?auto_30668 ) ) ( not ( = ?auto_30669 ?auto_30668 ) ) ( ON ?auto_30665 ?auto_30664 ) ( ON-TABLE ?auto_30668 ) ( ON ?auto_30666 ?auto_30665 ) ( ON ?auto_30667 ?auto_30666 ) ( ON ?auto_30669 ?auto_30667 ) ( CLEAR ?auto_30669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30668 ?auto_30664 ?auto_30665 ?auto_30666 ?auto_30667 )
      ( MAKE-4PILE ?auto_30664 ?auto_30665 ?auto_30666 ?auto_30667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30675 - BLOCK
      ?auto_30676 - BLOCK
      ?auto_30677 - BLOCK
      ?auto_30678 - BLOCK
      ?auto_30679 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_30679 ) ( CLEAR ?auto_30678 ) ( ON-TABLE ?auto_30675 ) ( ON ?auto_30676 ?auto_30675 ) ( ON ?auto_30677 ?auto_30676 ) ( ON ?auto_30678 ?auto_30677 ) ( not ( = ?auto_30675 ?auto_30676 ) ) ( not ( = ?auto_30675 ?auto_30677 ) ) ( not ( = ?auto_30675 ?auto_30678 ) ) ( not ( = ?auto_30675 ?auto_30679 ) ) ( not ( = ?auto_30676 ?auto_30677 ) ) ( not ( = ?auto_30676 ?auto_30678 ) ) ( not ( = ?auto_30676 ?auto_30679 ) ) ( not ( = ?auto_30677 ?auto_30678 ) ) ( not ( = ?auto_30677 ?auto_30679 ) ) ( not ( = ?auto_30678 ?auto_30679 ) ) )
    :subtasks
    ( ( !STACK ?auto_30679 ?auto_30678 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30680 - BLOCK
      ?auto_30681 - BLOCK
      ?auto_30682 - BLOCK
      ?auto_30683 - BLOCK
      ?auto_30684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_30683 ) ( ON-TABLE ?auto_30680 ) ( ON ?auto_30681 ?auto_30680 ) ( ON ?auto_30682 ?auto_30681 ) ( ON ?auto_30683 ?auto_30682 ) ( not ( = ?auto_30680 ?auto_30681 ) ) ( not ( = ?auto_30680 ?auto_30682 ) ) ( not ( = ?auto_30680 ?auto_30683 ) ) ( not ( = ?auto_30680 ?auto_30684 ) ) ( not ( = ?auto_30681 ?auto_30682 ) ) ( not ( = ?auto_30681 ?auto_30683 ) ) ( not ( = ?auto_30681 ?auto_30684 ) ) ( not ( = ?auto_30682 ?auto_30683 ) ) ( not ( = ?auto_30682 ?auto_30684 ) ) ( not ( = ?auto_30683 ?auto_30684 ) ) ( ON-TABLE ?auto_30684 ) ( CLEAR ?auto_30684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_30684 )
      ( MAKE-5PILE ?auto_30680 ?auto_30681 ?auto_30682 ?auto_30683 ?auto_30684 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30685 - BLOCK
      ?auto_30686 - BLOCK
      ?auto_30687 - BLOCK
      ?auto_30688 - BLOCK
      ?auto_30689 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30685 ) ( ON ?auto_30686 ?auto_30685 ) ( ON ?auto_30687 ?auto_30686 ) ( not ( = ?auto_30685 ?auto_30686 ) ) ( not ( = ?auto_30685 ?auto_30687 ) ) ( not ( = ?auto_30685 ?auto_30688 ) ) ( not ( = ?auto_30685 ?auto_30689 ) ) ( not ( = ?auto_30686 ?auto_30687 ) ) ( not ( = ?auto_30686 ?auto_30688 ) ) ( not ( = ?auto_30686 ?auto_30689 ) ) ( not ( = ?auto_30687 ?auto_30688 ) ) ( not ( = ?auto_30687 ?auto_30689 ) ) ( not ( = ?auto_30688 ?auto_30689 ) ) ( ON-TABLE ?auto_30689 ) ( CLEAR ?auto_30689 ) ( HOLDING ?auto_30688 ) ( CLEAR ?auto_30687 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30685 ?auto_30686 ?auto_30687 ?auto_30688 )
      ( MAKE-5PILE ?auto_30685 ?auto_30686 ?auto_30687 ?auto_30688 ?auto_30689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30690 - BLOCK
      ?auto_30691 - BLOCK
      ?auto_30692 - BLOCK
      ?auto_30693 - BLOCK
      ?auto_30694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30690 ) ( ON ?auto_30691 ?auto_30690 ) ( ON ?auto_30692 ?auto_30691 ) ( not ( = ?auto_30690 ?auto_30691 ) ) ( not ( = ?auto_30690 ?auto_30692 ) ) ( not ( = ?auto_30690 ?auto_30693 ) ) ( not ( = ?auto_30690 ?auto_30694 ) ) ( not ( = ?auto_30691 ?auto_30692 ) ) ( not ( = ?auto_30691 ?auto_30693 ) ) ( not ( = ?auto_30691 ?auto_30694 ) ) ( not ( = ?auto_30692 ?auto_30693 ) ) ( not ( = ?auto_30692 ?auto_30694 ) ) ( not ( = ?auto_30693 ?auto_30694 ) ) ( ON-TABLE ?auto_30694 ) ( CLEAR ?auto_30692 ) ( ON ?auto_30693 ?auto_30694 ) ( CLEAR ?auto_30693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30694 )
      ( MAKE-5PILE ?auto_30690 ?auto_30691 ?auto_30692 ?auto_30693 ?auto_30694 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30695 - BLOCK
      ?auto_30696 - BLOCK
      ?auto_30697 - BLOCK
      ?auto_30698 - BLOCK
      ?auto_30699 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30695 ) ( ON ?auto_30696 ?auto_30695 ) ( not ( = ?auto_30695 ?auto_30696 ) ) ( not ( = ?auto_30695 ?auto_30697 ) ) ( not ( = ?auto_30695 ?auto_30698 ) ) ( not ( = ?auto_30695 ?auto_30699 ) ) ( not ( = ?auto_30696 ?auto_30697 ) ) ( not ( = ?auto_30696 ?auto_30698 ) ) ( not ( = ?auto_30696 ?auto_30699 ) ) ( not ( = ?auto_30697 ?auto_30698 ) ) ( not ( = ?auto_30697 ?auto_30699 ) ) ( not ( = ?auto_30698 ?auto_30699 ) ) ( ON-TABLE ?auto_30699 ) ( ON ?auto_30698 ?auto_30699 ) ( CLEAR ?auto_30698 ) ( HOLDING ?auto_30697 ) ( CLEAR ?auto_30696 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30695 ?auto_30696 ?auto_30697 )
      ( MAKE-5PILE ?auto_30695 ?auto_30696 ?auto_30697 ?auto_30698 ?auto_30699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30700 - BLOCK
      ?auto_30701 - BLOCK
      ?auto_30702 - BLOCK
      ?auto_30703 - BLOCK
      ?auto_30704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30700 ) ( ON ?auto_30701 ?auto_30700 ) ( not ( = ?auto_30700 ?auto_30701 ) ) ( not ( = ?auto_30700 ?auto_30702 ) ) ( not ( = ?auto_30700 ?auto_30703 ) ) ( not ( = ?auto_30700 ?auto_30704 ) ) ( not ( = ?auto_30701 ?auto_30702 ) ) ( not ( = ?auto_30701 ?auto_30703 ) ) ( not ( = ?auto_30701 ?auto_30704 ) ) ( not ( = ?auto_30702 ?auto_30703 ) ) ( not ( = ?auto_30702 ?auto_30704 ) ) ( not ( = ?auto_30703 ?auto_30704 ) ) ( ON-TABLE ?auto_30704 ) ( ON ?auto_30703 ?auto_30704 ) ( CLEAR ?auto_30701 ) ( ON ?auto_30702 ?auto_30703 ) ( CLEAR ?auto_30702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30704 ?auto_30703 )
      ( MAKE-5PILE ?auto_30700 ?auto_30701 ?auto_30702 ?auto_30703 ?auto_30704 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30705 - BLOCK
      ?auto_30706 - BLOCK
      ?auto_30707 - BLOCK
      ?auto_30708 - BLOCK
      ?auto_30709 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30705 ) ( not ( = ?auto_30705 ?auto_30706 ) ) ( not ( = ?auto_30705 ?auto_30707 ) ) ( not ( = ?auto_30705 ?auto_30708 ) ) ( not ( = ?auto_30705 ?auto_30709 ) ) ( not ( = ?auto_30706 ?auto_30707 ) ) ( not ( = ?auto_30706 ?auto_30708 ) ) ( not ( = ?auto_30706 ?auto_30709 ) ) ( not ( = ?auto_30707 ?auto_30708 ) ) ( not ( = ?auto_30707 ?auto_30709 ) ) ( not ( = ?auto_30708 ?auto_30709 ) ) ( ON-TABLE ?auto_30709 ) ( ON ?auto_30708 ?auto_30709 ) ( ON ?auto_30707 ?auto_30708 ) ( CLEAR ?auto_30707 ) ( HOLDING ?auto_30706 ) ( CLEAR ?auto_30705 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30705 ?auto_30706 )
      ( MAKE-5PILE ?auto_30705 ?auto_30706 ?auto_30707 ?auto_30708 ?auto_30709 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30710 - BLOCK
      ?auto_30711 - BLOCK
      ?auto_30712 - BLOCK
      ?auto_30713 - BLOCK
      ?auto_30714 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_30710 ) ( not ( = ?auto_30710 ?auto_30711 ) ) ( not ( = ?auto_30710 ?auto_30712 ) ) ( not ( = ?auto_30710 ?auto_30713 ) ) ( not ( = ?auto_30710 ?auto_30714 ) ) ( not ( = ?auto_30711 ?auto_30712 ) ) ( not ( = ?auto_30711 ?auto_30713 ) ) ( not ( = ?auto_30711 ?auto_30714 ) ) ( not ( = ?auto_30712 ?auto_30713 ) ) ( not ( = ?auto_30712 ?auto_30714 ) ) ( not ( = ?auto_30713 ?auto_30714 ) ) ( ON-TABLE ?auto_30714 ) ( ON ?auto_30713 ?auto_30714 ) ( ON ?auto_30712 ?auto_30713 ) ( CLEAR ?auto_30710 ) ( ON ?auto_30711 ?auto_30712 ) ( CLEAR ?auto_30711 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30714 ?auto_30713 ?auto_30712 )
      ( MAKE-5PILE ?auto_30710 ?auto_30711 ?auto_30712 ?auto_30713 ?auto_30714 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30715 - BLOCK
      ?auto_30716 - BLOCK
      ?auto_30717 - BLOCK
      ?auto_30718 - BLOCK
      ?auto_30719 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30715 ?auto_30716 ) ) ( not ( = ?auto_30715 ?auto_30717 ) ) ( not ( = ?auto_30715 ?auto_30718 ) ) ( not ( = ?auto_30715 ?auto_30719 ) ) ( not ( = ?auto_30716 ?auto_30717 ) ) ( not ( = ?auto_30716 ?auto_30718 ) ) ( not ( = ?auto_30716 ?auto_30719 ) ) ( not ( = ?auto_30717 ?auto_30718 ) ) ( not ( = ?auto_30717 ?auto_30719 ) ) ( not ( = ?auto_30718 ?auto_30719 ) ) ( ON-TABLE ?auto_30719 ) ( ON ?auto_30718 ?auto_30719 ) ( ON ?auto_30717 ?auto_30718 ) ( ON ?auto_30716 ?auto_30717 ) ( CLEAR ?auto_30716 ) ( HOLDING ?auto_30715 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30715 )
      ( MAKE-5PILE ?auto_30715 ?auto_30716 ?auto_30717 ?auto_30718 ?auto_30719 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30720 - BLOCK
      ?auto_30721 - BLOCK
      ?auto_30722 - BLOCK
      ?auto_30723 - BLOCK
      ?auto_30724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30720 ?auto_30721 ) ) ( not ( = ?auto_30720 ?auto_30722 ) ) ( not ( = ?auto_30720 ?auto_30723 ) ) ( not ( = ?auto_30720 ?auto_30724 ) ) ( not ( = ?auto_30721 ?auto_30722 ) ) ( not ( = ?auto_30721 ?auto_30723 ) ) ( not ( = ?auto_30721 ?auto_30724 ) ) ( not ( = ?auto_30722 ?auto_30723 ) ) ( not ( = ?auto_30722 ?auto_30724 ) ) ( not ( = ?auto_30723 ?auto_30724 ) ) ( ON-TABLE ?auto_30724 ) ( ON ?auto_30723 ?auto_30724 ) ( ON ?auto_30722 ?auto_30723 ) ( ON ?auto_30721 ?auto_30722 ) ( ON ?auto_30720 ?auto_30721 ) ( CLEAR ?auto_30720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30724 ?auto_30723 ?auto_30722 ?auto_30721 )
      ( MAKE-5PILE ?auto_30720 ?auto_30721 ?auto_30722 ?auto_30723 ?auto_30724 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30725 - BLOCK
      ?auto_30726 - BLOCK
      ?auto_30727 - BLOCK
      ?auto_30728 - BLOCK
      ?auto_30729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30725 ?auto_30726 ) ) ( not ( = ?auto_30725 ?auto_30727 ) ) ( not ( = ?auto_30725 ?auto_30728 ) ) ( not ( = ?auto_30725 ?auto_30729 ) ) ( not ( = ?auto_30726 ?auto_30727 ) ) ( not ( = ?auto_30726 ?auto_30728 ) ) ( not ( = ?auto_30726 ?auto_30729 ) ) ( not ( = ?auto_30727 ?auto_30728 ) ) ( not ( = ?auto_30727 ?auto_30729 ) ) ( not ( = ?auto_30728 ?auto_30729 ) ) ( ON-TABLE ?auto_30729 ) ( ON ?auto_30728 ?auto_30729 ) ( ON ?auto_30727 ?auto_30728 ) ( ON ?auto_30726 ?auto_30727 ) ( HOLDING ?auto_30725 ) ( CLEAR ?auto_30726 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30729 ?auto_30728 ?auto_30727 ?auto_30726 ?auto_30725 )
      ( MAKE-5PILE ?auto_30725 ?auto_30726 ?auto_30727 ?auto_30728 ?auto_30729 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30730 - BLOCK
      ?auto_30731 - BLOCK
      ?auto_30732 - BLOCK
      ?auto_30733 - BLOCK
      ?auto_30734 - BLOCK
    )
    :vars
    (
      ?auto_30735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30730 ?auto_30731 ) ) ( not ( = ?auto_30730 ?auto_30732 ) ) ( not ( = ?auto_30730 ?auto_30733 ) ) ( not ( = ?auto_30730 ?auto_30734 ) ) ( not ( = ?auto_30731 ?auto_30732 ) ) ( not ( = ?auto_30731 ?auto_30733 ) ) ( not ( = ?auto_30731 ?auto_30734 ) ) ( not ( = ?auto_30732 ?auto_30733 ) ) ( not ( = ?auto_30732 ?auto_30734 ) ) ( not ( = ?auto_30733 ?auto_30734 ) ) ( ON-TABLE ?auto_30734 ) ( ON ?auto_30733 ?auto_30734 ) ( ON ?auto_30732 ?auto_30733 ) ( ON ?auto_30731 ?auto_30732 ) ( CLEAR ?auto_30731 ) ( ON ?auto_30730 ?auto_30735 ) ( CLEAR ?auto_30730 ) ( HAND-EMPTY ) ( not ( = ?auto_30730 ?auto_30735 ) ) ( not ( = ?auto_30731 ?auto_30735 ) ) ( not ( = ?auto_30732 ?auto_30735 ) ) ( not ( = ?auto_30733 ?auto_30735 ) ) ( not ( = ?auto_30734 ?auto_30735 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30730 ?auto_30735 )
      ( MAKE-5PILE ?auto_30730 ?auto_30731 ?auto_30732 ?auto_30733 ?auto_30734 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30736 - BLOCK
      ?auto_30737 - BLOCK
      ?auto_30738 - BLOCK
      ?auto_30739 - BLOCK
      ?auto_30740 - BLOCK
    )
    :vars
    (
      ?auto_30741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30736 ?auto_30737 ) ) ( not ( = ?auto_30736 ?auto_30738 ) ) ( not ( = ?auto_30736 ?auto_30739 ) ) ( not ( = ?auto_30736 ?auto_30740 ) ) ( not ( = ?auto_30737 ?auto_30738 ) ) ( not ( = ?auto_30737 ?auto_30739 ) ) ( not ( = ?auto_30737 ?auto_30740 ) ) ( not ( = ?auto_30738 ?auto_30739 ) ) ( not ( = ?auto_30738 ?auto_30740 ) ) ( not ( = ?auto_30739 ?auto_30740 ) ) ( ON-TABLE ?auto_30740 ) ( ON ?auto_30739 ?auto_30740 ) ( ON ?auto_30738 ?auto_30739 ) ( ON ?auto_30736 ?auto_30741 ) ( CLEAR ?auto_30736 ) ( not ( = ?auto_30736 ?auto_30741 ) ) ( not ( = ?auto_30737 ?auto_30741 ) ) ( not ( = ?auto_30738 ?auto_30741 ) ) ( not ( = ?auto_30739 ?auto_30741 ) ) ( not ( = ?auto_30740 ?auto_30741 ) ) ( HOLDING ?auto_30737 ) ( CLEAR ?auto_30738 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30740 ?auto_30739 ?auto_30738 ?auto_30737 )
      ( MAKE-5PILE ?auto_30736 ?auto_30737 ?auto_30738 ?auto_30739 ?auto_30740 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30742 - BLOCK
      ?auto_30743 - BLOCK
      ?auto_30744 - BLOCK
      ?auto_30745 - BLOCK
      ?auto_30746 - BLOCK
    )
    :vars
    (
      ?auto_30747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30742 ?auto_30743 ) ) ( not ( = ?auto_30742 ?auto_30744 ) ) ( not ( = ?auto_30742 ?auto_30745 ) ) ( not ( = ?auto_30742 ?auto_30746 ) ) ( not ( = ?auto_30743 ?auto_30744 ) ) ( not ( = ?auto_30743 ?auto_30745 ) ) ( not ( = ?auto_30743 ?auto_30746 ) ) ( not ( = ?auto_30744 ?auto_30745 ) ) ( not ( = ?auto_30744 ?auto_30746 ) ) ( not ( = ?auto_30745 ?auto_30746 ) ) ( ON-TABLE ?auto_30746 ) ( ON ?auto_30745 ?auto_30746 ) ( ON ?auto_30744 ?auto_30745 ) ( ON ?auto_30742 ?auto_30747 ) ( not ( = ?auto_30742 ?auto_30747 ) ) ( not ( = ?auto_30743 ?auto_30747 ) ) ( not ( = ?auto_30744 ?auto_30747 ) ) ( not ( = ?auto_30745 ?auto_30747 ) ) ( not ( = ?auto_30746 ?auto_30747 ) ) ( CLEAR ?auto_30744 ) ( ON ?auto_30743 ?auto_30742 ) ( CLEAR ?auto_30743 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30747 ?auto_30742 )
      ( MAKE-5PILE ?auto_30742 ?auto_30743 ?auto_30744 ?auto_30745 ?auto_30746 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30748 - BLOCK
      ?auto_30749 - BLOCK
      ?auto_30750 - BLOCK
      ?auto_30751 - BLOCK
      ?auto_30752 - BLOCK
    )
    :vars
    (
      ?auto_30753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30748 ?auto_30749 ) ) ( not ( = ?auto_30748 ?auto_30750 ) ) ( not ( = ?auto_30748 ?auto_30751 ) ) ( not ( = ?auto_30748 ?auto_30752 ) ) ( not ( = ?auto_30749 ?auto_30750 ) ) ( not ( = ?auto_30749 ?auto_30751 ) ) ( not ( = ?auto_30749 ?auto_30752 ) ) ( not ( = ?auto_30750 ?auto_30751 ) ) ( not ( = ?auto_30750 ?auto_30752 ) ) ( not ( = ?auto_30751 ?auto_30752 ) ) ( ON-TABLE ?auto_30752 ) ( ON ?auto_30751 ?auto_30752 ) ( ON ?auto_30748 ?auto_30753 ) ( not ( = ?auto_30748 ?auto_30753 ) ) ( not ( = ?auto_30749 ?auto_30753 ) ) ( not ( = ?auto_30750 ?auto_30753 ) ) ( not ( = ?auto_30751 ?auto_30753 ) ) ( not ( = ?auto_30752 ?auto_30753 ) ) ( ON ?auto_30749 ?auto_30748 ) ( CLEAR ?auto_30749 ) ( ON-TABLE ?auto_30753 ) ( HOLDING ?auto_30750 ) ( CLEAR ?auto_30751 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30752 ?auto_30751 ?auto_30750 )
      ( MAKE-5PILE ?auto_30748 ?auto_30749 ?auto_30750 ?auto_30751 ?auto_30752 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30754 - BLOCK
      ?auto_30755 - BLOCK
      ?auto_30756 - BLOCK
      ?auto_30757 - BLOCK
      ?auto_30758 - BLOCK
    )
    :vars
    (
      ?auto_30759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30754 ?auto_30755 ) ) ( not ( = ?auto_30754 ?auto_30756 ) ) ( not ( = ?auto_30754 ?auto_30757 ) ) ( not ( = ?auto_30754 ?auto_30758 ) ) ( not ( = ?auto_30755 ?auto_30756 ) ) ( not ( = ?auto_30755 ?auto_30757 ) ) ( not ( = ?auto_30755 ?auto_30758 ) ) ( not ( = ?auto_30756 ?auto_30757 ) ) ( not ( = ?auto_30756 ?auto_30758 ) ) ( not ( = ?auto_30757 ?auto_30758 ) ) ( ON-TABLE ?auto_30758 ) ( ON ?auto_30757 ?auto_30758 ) ( ON ?auto_30754 ?auto_30759 ) ( not ( = ?auto_30754 ?auto_30759 ) ) ( not ( = ?auto_30755 ?auto_30759 ) ) ( not ( = ?auto_30756 ?auto_30759 ) ) ( not ( = ?auto_30757 ?auto_30759 ) ) ( not ( = ?auto_30758 ?auto_30759 ) ) ( ON ?auto_30755 ?auto_30754 ) ( ON-TABLE ?auto_30759 ) ( CLEAR ?auto_30757 ) ( ON ?auto_30756 ?auto_30755 ) ( CLEAR ?auto_30756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_30759 ?auto_30754 ?auto_30755 )
      ( MAKE-5PILE ?auto_30754 ?auto_30755 ?auto_30756 ?auto_30757 ?auto_30758 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30760 - BLOCK
      ?auto_30761 - BLOCK
      ?auto_30762 - BLOCK
      ?auto_30763 - BLOCK
      ?auto_30764 - BLOCK
    )
    :vars
    (
      ?auto_30765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30760 ?auto_30761 ) ) ( not ( = ?auto_30760 ?auto_30762 ) ) ( not ( = ?auto_30760 ?auto_30763 ) ) ( not ( = ?auto_30760 ?auto_30764 ) ) ( not ( = ?auto_30761 ?auto_30762 ) ) ( not ( = ?auto_30761 ?auto_30763 ) ) ( not ( = ?auto_30761 ?auto_30764 ) ) ( not ( = ?auto_30762 ?auto_30763 ) ) ( not ( = ?auto_30762 ?auto_30764 ) ) ( not ( = ?auto_30763 ?auto_30764 ) ) ( ON-TABLE ?auto_30764 ) ( ON ?auto_30760 ?auto_30765 ) ( not ( = ?auto_30760 ?auto_30765 ) ) ( not ( = ?auto_30761 ?auto_30765 ) ) ( not ( = ?auto_30762 ?auto_30765 ) ) ( not ( = ?auto_30763 ?auto_30765 ) ) ( not ( = ?auto_30764 ?auto_30765 ) ) ( ON ?auto_30761 ?auto_30760 ) ( ON-TABLE ?auto_30765 ) ( ON ?auto_30762 ?auto_30761 ) ( CLEAR ?auto_30762 ) ( HOLDING ?auto_30763 ) ( CLEAR ?auto_30764 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30764 ?auto_30763 )
      ( MAKE-5PILE ?auto_30760 ?auto_30761 ?auto_30762 ?auto_30763 ?auto_30764 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30766 - BLOCK
      ?auto_30767 - BLOCK
      ?auto_30768 - BLOCK
      ?auto_30769 - BLOCK
      ?auto_30770 - BLOCK
    )
    :vars
    (
      ?auto_30771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30766 ?auto_30767 ) ) ( not ( = ?auto_30766 ?auto_30768 ) ) ( not ( = ?auto_30766 ?auto_30769 ) ) ( not ( = ?auto_30766 ?auto_30770 ) ) ( not ( = ?auto_30767 ?auto_30768 ) ) ( not ( = ?auto_30767 ?auto_30769 ) ) ( not ( = ?auto_30767 ?auto_30770 ) ) ( not ( = ?auto_30768 ?auto_30769 ) ) ( not ( = ?auto_30768 ?auto_30770 ) ) ( not ( = ?auto_30769 ?auto_30770 ) ) ( ON-TABLE ?auto_30770 ) ( ON ?auto_30766 ?auto_30771 ) ( not ( = ?auto_30766 ?auto_30771 ) ) ( not ( = ?auto_30767 ?auto_30771 ) ) ( not ( = ?auto_30768 ?auto_30771 ) ) ( not ( = ?auto_30769 ?auto_30771 ) ) ( not ( = ?auto_30770 ?auto_30771 ) ) ( ON ?auto_30767 ?auto_30766 ) ( ON-TABLE ?auto_30771 ) ( ON ?auto_30768 ?auto_30767 ) ( CLEAR ?auto_30770 ) ( ON ?auto_30769 ?auto_30768 ) ( CLEAR ?auto_30769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_30771 ?auto_30766 ?auto_30767 ?auto_30768 )
      ( MAKE-5PILE ?auto_30766 ?auto_30767 ?auto_30768 ?auto_30769 ?auto_30770 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30772 - BLOCK
      ?auto_30773 - BLOCK
      ?auto_30774 - BLOCK
      ?auto_30775 - BLOCK
      ?auto_30776 - BLOCK
    )
    :vars
    (
      ?auto_30777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30772 ?auto_30773 ) ) ( not ( = ?auto_30772 ?auto_30774 ) ) ( not ( = ?auto_30772 ?auto_30775 ) ) ( not ( = ?auto_30772 ?auto_30776 ) ) ( not ( = ?auto_30773 ?auto_30774 ) ) ( not ( = ?auto_30773 ?auto_30775 ) ) ( not ( = ?auto_30773 ?auto_30776 ) ) ( not ( = ?auto_30774 ?auto_30775 ) ) ( not ( = ?auto_30774 ?auto_30776 ) ) ( not ( = ?auto_30775 ?auto_30776 ) ) ( ON ?auto_30772 ?auto_30777 ) ( not ( = ?auto_30772 ?auto_30777 ) ) ( not ( = ?auto_30773 ?auto_30777 ) ) ( not ( = ?auto_30774 ?auto_30777 ) ) ( not ( = ?auto_30775 ?auto_30777 ) ) ( not ( = ?auto_30776 ?auto_30777 ) ) ( ON ?auto_30773 ?auto_30772 ) ( ON-TABLE ?auto_30777 ) ( ON ?auto_30774 ?auto_30773 ) ( ON ?auto_30775 ?auto_30774 ) ( CLEAR ?auto_30775 ) ( HOLDING ?auto_30776 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_30776 )
      ( MAKE-5PILE ?auto_30772 ?auto_30773 ?auto_30774 ?auto_30775 ?auto_30776 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_30778 - BLOCK
      ?auto_30779 - BLOCK
      ?auto_30780 - BLOCK
      ?auto_30781 - BLOCK
      ?auto_30782 - BLOCK
    )
    :vars
    (
      ?auto_30783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_30778 ?auto_30779 ) ) ( not ( = ?auto_30778 ?auto_30780 ) ) ( not ( = ?auto_30778 ?auto_30781 ) ) ( not ( = ?auto_30778 ?auto_30782 ) ) ( not ( = ?auto_30779 ?auto_30780 ) ) ( not ( = ?auto_30779 ?auto_30781 ) ) ( not ( = ?auto_30779 ?auto_30782 ) ) ( not ( = ?auto_30780 ?auto_30781 ) ) ( not ( = ?auto_30780 ?auto_30782 ) ) ( not ( = ?auto_30781 ?auto_30782 ) ) ( ON ?auto_30778 ?auto_30783 ) ( not ( = ?auto_30778 ?auto_30783 ) ) ( not ( = ?auto_30779 ?auto_30783 ) ) ( not ( = ?auto_30780 ?auto_30783 ) ) ( not ( = ?auto_30781 ?auto_30783 ) ) ( not ( = ?auto_30782 ?auto_30783 ) ) ( ON ?auto_30779 ?auto_30778 ) ( ON-TABLE ?auto_30783 ) ( ON ?auto_30780 ?auto_30779 ) ( ON ?auto_30781 ?auto_30780 ) ( ON ?auto_30782 ?auto_30781 ) ( CLEAR ?auto_30782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_30783 ?auto_30778 ?auto_30779 ?auto_30780 ?auto_30781 )
      ( MAKE-5PILE ?auto_30778 ?auto_30779 ?auto_30780 ?auto_30781 ?auto_30782 ) )
  )

)

