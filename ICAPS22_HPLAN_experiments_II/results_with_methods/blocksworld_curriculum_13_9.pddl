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
      ?auto_236729 - BLOCK
    )
    :vars
    (
      ?auto_236730 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236729 ?auto_236730 ) ( CLEAR ?auto_236729 ) ( HAND-EMPTY ) ( not ( = ?auto_236729 ?auto_236730 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236729 ?auto_236730 )
      ( !PUTDOWN ?auto_236729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_236732 - BLOCK
    )
    :vars
    (
      ?auto_236733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236732 ?auto_236733 ) ( CLEAR ?auto_236732 ) ( HAND-EMPTY ) ( not ( = ?auto_236732 ?auto_236733 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236732 ?auto_236733 )
      ( !PUTDOWN ?auto_236732 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_236736 - BLOCK
      ?auto_236737 - BLOCK
    )
    :vars
    (
      ?auto_236738 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236736 ) ( ON ?auto_236737 ?auto_236738 ) ( CLEAR ?auto_236737 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236736 ) ( not ( = ?auto_236736 ?auto_236737 ) ) ( not ( = ?auto_236736 ?auto_236738 ) ) ( not ( = ?auto_236737 ?auto_236738 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236737 ?auto_236738 )
      ( !STACK ?auto_236737 ?auto_236736 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_236741 - BLOCK
      ?auto_236742 - BLOCK
    )
    :vars
    (
      ?auto_236743 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236741 ) ( ON ?auto_236742 ?auto_236743 ) ( CLEAR ?auto_236742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236741 ) ( not ( = ?auto_236741 ?auto_236742 ) ) ( not ( = ?auto_236741 ?auto_236743 ) ) ( not ( = ?auto_236742 ?auto_236743 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236742 ?auto_236743 )
      ( !STACK ?auto_236742 ?auto_236741 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_236746 - BLOCK
      ?auto_236747 - BLOCK
    )
    :vars
    (
      ?auto_236748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236747 ?auto_236748 ) ( not ( = ?auto_236746 ?auto_236747 ) ) ( not ( = ?auto_236746 ?auto_236748 ) ) ( not ( = ?auto_236747 ?auto_236748 ) ) ( ON ?auto_236746 ?auto_236747 ) ( CLEAR ?auto_236746 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236746 )
      ( MAKE-2PILE ?auto_236746 ?auto_236747 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_236751 - BLOCK
      ?auto_236752 - BLOCK
    )
    :vars
    (
      ?auto_236753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236752 ?auto_236753 ) ( not ( = ?auto_236751 ?auto_236752 ) ) ( not ( = ?auto_236751 ?auto_236753 ) ) ( not ( = ?auto_236752 ?auto_236753 ) ) ( ON ?auto_236751 ?auto_236752 ) ( CLEAR ?auto_236751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236751 )
      ( MAKE-2PILE ?auto_236751 ?auto_236752 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236757 - BLOCK
      ?auto_236758 - BLOCK
      ?auto_236759 - BLOCK
    )
    :vars
    (
      ?auto_236760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236758 ) ( ON ?auto_236759 ?auto_236760 ) ( CLEAR ?auto_236759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236757 ) ( ON ?auto_236758 ?auto_236757 ) ( not ( = ?auto_236757 ?auto_236758 ) ) ( not ( = ?auto_236757 ?auto_236759 ) ) ( not ( = ?auto_236757 ?auto_236760 ) ) ( not ( = ?auto_236758 ?auto_236759 ) ) ( not ( = ?auto_236758 ?auto_236760 ) ) ( not ( = ?auto_236759 ?auto_236760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236759 ?auto_236760 )
      ( !STACK ?auto_236759 ?auto_236758 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236764 - BLOCK
      ?auto_236765 - BLOCK
      ?auto_236766 - BLOCK
    )
    :vars
    (
      ?auto_236767 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236765 ) ( ON ?auto_236766 ?auto_236767 ) ( CLEAR ?auto_236766 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236764 ) ( ON ?auto_236765 ?auto_236764 ) ( not ( = ?auto_236764 ?auto_236765 ) ) ( not ( = ?auto_236764 ?auto_236766 ) ) ( not ( = ?auto_236764 ?auto_236767 ) ) ( not ( = ?auto_236765 ?auto_236766 ) ) ( not ( = ?auto_236765 ?auto_236767 ) ) ( not ( = ?auto_236766 ?auto_236767 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236766 ?auto_236767 )
      ( !STACK ?auto_236766 ?auto_236765 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236771 - BLOCK
      ?auto_236772 - BLOCK
      ?auto_236773 - BLOCK
    )
    :vars
    (
      ?auto_236774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236773 ?auto_236774 ) ( ON-TABLE ?auto_236771 ) ( not ( = ?auto_236771 ?auto_236772 ) ) ( not ( = ?auto_236771 ?auto_236773 ) ) ( not ( = ?auto_236771 ?auto_236774 ) ) ( not ( = ?auto_236772 ?auto_236773 ) ) ( not ( = ?auto_236772 ?auto_236774 ) ) ( not ( = ?auto_236773 ?auto_236774 ) ) ( CLEAR ?auto_236771 ) ( ON ?auto_236772 ?auto_236773 ) ( CLEAR ?auto_236772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236771 ?auto_236772 )
      ( MAKE-3PILE ?auto_236771 ?auto_236772 ?auto_236773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236778 - BLOCK
      ?auto_236779 - BLOCK
      ?auto_236780 - BLOCK
    )
    :vars
    (
      ?auto_236781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236780 ?auto_236781 ) ( ON-TABLE ?auto_236778 ) ( not ( = ?auto_236778 ?auto_236779 ) ) ( not ( = ?auto_236778 ?auto_236780 ) ) ( not ( = ?auto_236778 ?auto_236781 ) ) ( not ( = ?auto_236779 ?auto_236780 ) ) ( not ( = ?auto_236779 ?auto_236781 ) ) ( not ( = ?auto_236780 ?auto_236781 ) ) ( CLEAR ?auto_236778 ) ( ON ?auto_236779 ?auto_236780 ) ( CLEAR ?auto_236779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236778 ?auto_236779 )
      ( MAKE-3PILE ?auto_236778 ?auto_236779 ?auto_236780 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236785 - BLOCK
      ?auto_236786 - BLOCK
      ?auto_236787 - BLOCK
    )
    :vars
    (
      ?auto_236788 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236787 ?auto_236788 ) ( not ( = ?auto_236785 ?auto_236786 ) ) ( not ( = ?auto_236785 ?auto_236787 ) ) ( not ( = ?auto_236785 ?auto_236788 ) ) ( not ( = ?auto_236786 ?auto_236787 ) ) ( not ( = ?auto_236786 ?auto_236788 ) ) ( not ( = ?auto_236787 ?auto_236788 ) ) ( ON ?auto_236786 ?auto_236787 ) ( ON ?auto_236785 ?auto_236786 ) ( CLEAR ?auto_236785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236785 )
      ( MAKE-3PILE ?auto_236785 ?auto_236786 ?auto_236787 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_236792 - BLOCK
      ?auto_236793 - BLOCK
      ?auto_236794 - BLOCK
    )
    :vars
    (
      ?auto_236795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236794 ?auto_236795 ) ( not ( = ?auto_236792 ?auto_236793 ) ) ( not ( = ?auto_236792 ?auto_236794 ) ) ( not ( = ?auto_236792 ?auto_236795 ) ) ( not ( = ?auto_236793 ?auto_236794 ) ) ( not ( = ?auto_236793 ?auto_236795 ) ) ( not ( = ?auto_236794 ?auto_236795 ) ) ( ON ?auto_236793 ?auto_236794 ) ( ON ?auto_236792 ?auto_236793 ) ( CLEAR ?auto_236792 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236792 )
      ( MAKE-3PILE ?auto_236792 ?auto_236793 ?auto_236794 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236800 - BLOCK
      ?auto_236801 - BLOCK
      ?auto_236802 - BLOCK
      ?auto_236803 - BLOCK
    )
    :vars
    (
      ?auto_236804 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236802 ) ( ON ?auto_236803 ?auto_236804 ) ( CLEAR ?auto_236803 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236800 ) ( ON ?auto_236801 ?auto_236800 ) ( ON ?auto_236802 ?auto_236801 ) ( not ( = ?auto_236800 ?auto_236801 ) ) ( not ( = ?auto_236800 ?auto_236802 ) ) ( not ( = ?auto_236800 ?auto_236803 ) ) ( not ( = ?auto_236800 ?auto_236804 ) ) ( not ( = ?auto_236801 ?auto_236802 ) ) ( not ( = ?auto_236801 ?auto_236803 ) ) ( not ( = ?auto_236801 ?auto_236804 ) ) ( not ( = ?auto_236802 ?auto_236803 ) ) ( not ( = ?auto_236802 ?auto_236804 ) ) ( not ( = ?auto_236803 ?auto_236804 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236803 ?auto_236804 )
      ( !STACK ?auto_236803 ?auto_236802 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236809 - BLOCK
      ?auto_236810 - BLOCK
      ?auto_236811 - BLOCK
      ?auto_236812 - BLOCK
    )
    :vars
    (
      ?auto_236813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236811 ) ( ON ?auto_236812 ?auto_236813 ) ( CLEAR ?auto_236812 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236809 ) ( ON ?auto_236810 ?auto_236809 ) ( ON ?auto_236811 ?auto_236810 ) ( not ( = ?auto_236809 ?auto_236810 ) ) ( not ( = ?auto_236809 ?auto_236811 ) ) ( not ( = ?auto_236809 ?auto_236812 ) ) ( not ( = ?auto_236809 ?auto_236813 ) ) ( not ( = ?auto_236810 ?auto_236811 ) ) ( not ( = ?auto_236810 ?auto_236812 ) ) ( not ( = ?auto_236810 ?auto_236813 ) ) ( not ( = ?auto_236811 ?auto_236812 ) ) ( not ( = ?auto_236811 ?auto_236813 ) ) ( not ( = ?auto_236812 ?auto_236813 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236812 ?auto_236813 )
      ( !STACK ?auto_236812 ?auto_236811 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236818 - BLOCK
      ?auto_236819 - BLOCK
      ?auto_236820 - BLOCK
      ?auto_236821 - BLOCK
    )
    :vars
    (
      ?auto_236822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236821 ?auto_236822 ) ( ON-TABLE ?auto_236818 ) ( ON ?auto_236819 ?auto_236818 ) ( not ( = ?auto_236818 ?auto_236819 ) ) ( not ( = ?auto_236818 ?auto_236820 ) ) ( not ( = ?auto_236818 ?auto_236821 ) ) ( not ( = ?auto_236818 ?auto_236822 ) ) ( not ( = ?auto_236819 ?auto_236820 ) ) ( not ( = ?auto_236819 ?auto_236821 ) ) ( not ( = ?auto_236819 ?auto_236822 ) ) ( not ( = ?auto_236820 ?auto_236821 ) ) ( not ( = ?auto_236820 ?auto_236822 ) ) ( not ( = ?auto_236821 ?auto_236822 ) ) ( CLEAR ?auto_236819 ) ( ON ?auto_236820 ?auto_236821 ) ( CLEAR ?auto_236820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236818 ?auto_236819 ?auto_236820 )
      ( MAKE-4PILE ?auto_236818 ?auto_236819 ?auto_236820 ?auto_236821 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236827 - BLOCK
      ?auto_236828 - BLOCK
      ?auto_236829 - BLOCK
      ?auto_236830 - BLOCK
    )
    :vars
    (
      ?auto_236831 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236830 ?auto_236831 ) ( ON-TABLE ?auto_236827 ) ( ON ?auto_236828 ?auto_236827 ) ( not ( = ?auto_236827 ?auto_236828 ) ) ( not ( = ?auto_236827 ?auto_236829 ) ) ( not ( = ?auto_236827 ?auto_236830 ) ) ( not ( = ?auto_236827 ?auto_236831 ) ) ( not ( = ?auto_236828 ?auto_236829 ) ) ( not ( = ?auto_236828 ?auto_236830 ) ) ( not ( = ?auto_236828 ?auto_236831 ) ) ( not ( = ?auto_236829 ?auto_236830 ) ) ( not ( = ?auto_236829 ?auto_236831 ) ) ( not ( = ?auto_236830 ?auto_236831 ) ) ( CLEAR ?auto_236828 ) ( ON ?auto_236829 ?auto_236830 ) ( CLEAR ?auto_236829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236827 ?auto_236828 ?auto_236829 )
      ( MAKE-4PILE ?auto_236827 ?auto_236828 ?auto_236829 ?auto_236830 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236836 - BLOCK
      ?auto_236837 - BLOCK
      ?auto_236838 - BLOCK
      ?auto_236839 - BLOCK
    )
    :vars
    (
      ?auto_236840 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236839 ?auto_236840 ) ( ON-TABLE ?auto_236836 ) ( not ( = ?auto_236836 ?auto_236837 ) ) ( not ( = ?auto_236836 ?auto_236838 ) ) ( not ( = ?auto_236836 ?auto_236839 ) ) ( not ( = ?auto_236836 ?auto_236840 ) ) ( not ( = ?auto_236837 ?auto_236838 ) ) ( not ( = ?auto_236837 ?auto_236839 ) ) ( not ( = ?auto_236837 ?auto_236840 ) ) ( not ( = ?auto_236838 ?auto_236839 ) ) ( not ( = ?auto_236838 ?auto_236840 ) ) ( not ( = ?auto_236839 ?auto_236840 ) ) ( ON ?auto_236838 ?auto_236839 ) ( CLEAR ?auto_236836 ) ( ON ?auto_236837 ?auto_236838 ) ( CLEAR ?auto_236837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236836 ?auto_236837 )
      ( MAKE-4PILE ?auto_236836 ?auto_236837 ?auto_236838 ?auto_236839 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236845 - BLOCK
      ?auto_236846 - BLOCK
      ?auto_236847 - BLOCK
      ?auto_236848 - BLOCK
    )
    :vars
    (
      ?auto_236849 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236848 ?auto_236849 ) ( ON-TABLE ?auto_236845 ) ( not ( = ?auto_236845 ?auto_236846 ) ) ( not ( = ?auto_236845 ?auto_236847 ) ) ( not ( = ?auto_236845 ?auto_236848 ) ) ( not ( = ?auto_236845 ?auto_236849 ) ) ( not ( = ?auto_236846 ?auto_236847 ) ) ( not ( = ?auto_236846 ?auto_236848 ) ) ( not ( = ?auto_236846 ?auto_236849 ) ) ( not ( = ?auto_236847 ?auto_236848 ) ) ( not ( = ?auto_236847 ?auto_236849 ) ) ( not ( = ?auto_236848 ?auto_236849 ) ) ( ON ?auto_236847 ?auto_236848 ) ( CLEAR ?auto_236845 ) ( ON ?auto_236846 ?auto_236847 ) ( CLEAR ?auto_236846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236845 ?auto_236846 )
      ( MAKE-4PILE ?auto_236845 ?auto_236846 ?auto_236847 ?auto_236848 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236854 - BLOCK
      ?auto_236855 - BLOCK
      ?auto_236856 - BLOCK
      ?auto_236857 - BLOCK
    )
    :vars
    (
      ?auto_236858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236857 ?auto_236858 ) ( not ( = ?auto_236854 ?auto_236855 ) ) ( not ( = ?auto_236854 ?auto_236856 ) ) ( not ( = ?auto_236854 ?auto_236857 ) ) ( not ( = ?auto_236854 ?auto_236858 ) ) ( not ( = ?auto_236855 ?auto_236856 ) ) ( not ( = ?auto_236855 ?auto_236857 ) ) ( not ( = ?auto_236855 ?auto_236858 ) ) ( not ( = ?auto_236856 ?auto_236857 ) ) ( not ( = ?auto_236856 ?auto_236858 ) ) ( not ( = ?auto_236857 ?auto_236858 ) ) ( ON ?auto_236856 ?auto_236857 ) ( ON ?auto_236855 ?auto_236856 ) ( ON ?auto_236854 ?auto_236855 ) ( CLEAR ?auto_236854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236854 )
      ( MAKE-4PILE ?auto_236854 ?auto_236855 ?auto_236856 ?auto_236857 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_236863 - BLOCK
      ?auto_236864 - BLOCK
      ?auto_236865 - BLOCK
      ?auto_236866 - BLOCK
    )
    :vars
    (
      ?auto_236867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236866 ?auto_236867 ) ( not ( = ?auto_236863 ?auto_236864 ) ) ( not ( = ?auto_236863 ?auto_236865 ) ) ( not ( = ?auto_236863 ?auto_236866 ) ) ( not ( = ?auto_236863 ?auto_236867 ) ) ( not ( = ?auto_236864 ?auto_236865 ) ) ( not ( = ?auto_236864 ?auto_236866 ) ) ( not ( = ?auto_236864 ?auto_236867 ) ) ( not ( = ?auto_236865 ?auto_236866 ) ) ( not ( = ?auto_236865 ?auto_236867 ) ) ( not ( = ?auto_236866 ?auto_236867 ) ) ( ON ?auto_236865 ?auto_236866 ) ( ON ?auto_236864 ?auto_236865 ) ( ON ?auto_236863 ?auto_236864 ) ( CLEAR ?auto_236863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236863 )
      ( MAKE-4PILE ?auto_236863 ?auto_236864 ?auto_236865 ?auto_236866 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236873 - BLOCK
      ?auto_236874 - BLOCK
      ?auto_236875 - BLOCK
      ?auto_236876 - BLOCK
      ?auto_236877 - BLOCK
    )
    :vars
    (
      ?auto_236878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236876 ) ( ON ?auto_236877 ?auto_236878 ) ( CLEAR ?auto_236877 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236873 ) ( ON ?auto_236874 ?auto_236873 ) ( ON ?auto_236875 ?auto_236874 ) ( ON ?auto_236876 ?auto_236875 ) ( not ( = ?auto_236873 ?auto_236874 ) ) ( not ( = ?auto_236873 ?auto_236875 ) ) ( not ( = ?auto_236873 ?auto_236876 ) ) ( not ( = ?auto_236873 ?auto_236877 ) ) ( not ( = ?auto_236873 ?auto_236878 ) ) ( not ( = ?auto_236874 ?auto_236875 ) ) ( not ( = ?auto_236874 ?auto_236876 ) ) ( not ( = ?auto_236874 ?auto_236877 ) ) ( not ( = ?auto_236874 ?auto_236878 ) ) ( not ( = ?auto_236875 ?auto_236876 ) ) ( not ( = ?auto_236875 ?auto_236877 ) ) ( not ( = ?auto_236875 ?auto_236878 ) ) ( not ( = ?auto_236876 ?auto_236877 ) ) ( not ( = ?auto_236876 ?auto_236878 ) ) ( not ( = ?auto_236877 ?auto_236878 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236877 ?auto_236878 )
      ( !STACK ?auto_236877 ?auto_236876 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236884 - BLOCK
      ?auto_236885 - BLOCK
      ?auto_236886 - BLOCK
      ?auto_236887 - BLOCK
      ?auto_236888 - BLOCK
    )
    :vars
    (
      ?auto_236889 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236887 ) ( ON ?auto_236888 ?auto_236889 ) ( CLEAR ?auto_236888 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236884 ) ( ON ?auto_236885 ?auto_236884 ) ( ON ?auto_236886 ?auto_236885 ) ( ON ?auto_236887 ?auto_236886 ) ( not ( = ?auto_236884 ?auto_236885 ) ) ( not ( = ?auto_236884 ?auto_236886 ) ) ( not ( = ?auto_236884 ?auto_236887 ) ) ( not ( = ?auto_236884 ?auto_236888 ) ) ( not ( = ?auto_236884 ?auto_236889 ) ) ( not ( = ?auto_236885 ?auto_236886 ) ) ( not ( = ?auto_236885 ?auto_236887 ) ) ( not ( = ?auto_236885 ?auto_236888 ) ) ( not ( = ?auto_236885 ?auto_236889 ) ) ( not ( = ?auto_236886 ?auto_236887 ) ) ( not ( = ?auto_236886 ?auto_236888 ) ) ( not ( = ?auto_236886 ?auto_236889 ) ) ( not ( = ?auto_236887 ?auto_236888 ) ) ( not ( = ?auto_236887 ?auto_236889 ) ) ( not ( = ?auto_236888 ?auto_236889 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236888 ?auto_236889 )
      ( !STACK ?auto_236888 ?auto_236887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236895 - BLOCK
      ?auto_236896 - BLOCK
      ?auto_236897 - BLOCK
      ?auto_236898 - BLOCK
      ?auto_236899 - BLOCK
    )
    :vars
    (
      ?auto_236900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236899 ?auto_236900 ) ( ON-TABLE ?auto_236895 ) ( ON ?auto_236896 ?auto_236895 ) ( ON ?auto_236897 ?auto_236896 ) ( not ( = ?auto_236895 ?auto_236896 ) ) ( not ( = ?auto_236895 ?auto_236897 ) ) ( not ( = ?auto_236895 ?auto_236898 ) ) ( not ( = ?auto_236895 ?auto_236899 ) ) ( not ( = ?auto_236895 ?auto_236900 ) ) ( not ( = ?auto_236896 ?auto_236897 ) ) ( not ( = ?auto_236896 ?auto_236898 ) ) ( not ( = ?auto_236896 ?auto_236899 ) ) ( not ( = ?auto_236896 ?auto_236900 ) ) ( not ( = ?auto_236897 ?auto_236898 ) ) ( not ( = ?auto_236897 ?auto_236899 ) ) ( not ( = ?auto_236897 ?auto_236900 ) ) ( not ( = ?auto_236898 ?auto_236899 ) ) ( not ( = ?auto_236898 ?auto_236900 ) ) ( not ( = ?auto_236899 ?auto_236900 ) ) ( CLEAR ?auto_236897 ) ( ON ?auto_236898 ?auto_236899 ) ( CLEAR ?auto_236898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236895 ?auto_236896 ?auto_236897 ?auto_236898 )
      ( MAKE-5PILE ?auto_236895 ?auto_236896 ?auto_236897 ?auto_236898 ?auto_236899 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236906 - BLOCK
      ?auto_236907 - BLOCK
      ?auto_236908 - BLOCK
      ?auto_236909 - BLOCK
      ?auto_236910 - BLOCK
    )
    :vars
    (
      ?auto_236911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236910 ?auto_236911 ) ( ON-TABLE ?auto_236906 ) ( ON ?auto_236907 ?auto_236906 ) ( ON ?auto_236908 ?auto_236907 ) ( not ( = ?auto_236906 ?auto_236907 ) ) ( not ( = ?auto_236906 ?auto_236908 ) ) ( not ( = ?auto_236906 ?auto_236909 ) ) ( not ( = ?auto_236906 ?auto_236910 ) ) ( not ( = ?auto_236906 ?auto_236911 ) ) ( not ( = ?auto_236907 ?auto_236908 ) ) ( not ( = ?auto_236907 ?auto_236909 ) ) ( not ( = ?auto_236907 ?auto_236910 ) ) ( not ( = ?auto_236907 ?auto_236911 ) ) ( not ( = ?auto_236908 ?auto_236909 ) ) ( not ( = ?auto_236908 ?auto_236910 ) ) ( not ( = ?auto_236908 ?auto_236911 ) ) ( not ( = ?auto_236909 ?auto_236910 ) ) ( not ( = ?auto_236909 ?auto_236911 ) ) ( not ( = ?auto_236910 ?auto_236911 ) ) ( CLEAR ?auto_236908 ) ( ON ?auto_236909 ?auto_236910 ) ( CLEAR ?auto_236909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_236906 ?auto_236907 ?auto_236908 ?auto_236909 )
      ( MAKE-5PILE ?auto_236906 ?auto_236907 ?auto_236908 ?auto_236909 ?auto_236910 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236917 - BLOCK
      ?auto_236918 - BLOCK
      ?auto_236919 - BLOCK
      ?auto_236920 - BLOCK
      ?auto_236921 - BLOCK
    )
    :vars
    (
      ?auto_236922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236921 ?auto_236922 ) ( ON-TABLE ?auto_236917 ) ( ON ?auto_236918 ?auto_236917 ) ( not ( = ?auto_236917 ?auto_236918 ) ) ( not ( = ?auto_236917 ?auto_236919 ) ) ( not ( = ?auto_236917 ?auto_236920 ) ) ( not ( = ?auto_236917 ?auto_236921 ) ) ( not ( = ?auto_236917 ?auto_236922 ) ) ( not ( = ?auto_236918 ?auto_236919 ) ) ( not ( = ?auto_236918 ?auto_236920 ) ) ( not ( = ?auto_236918 ?auto_236921 ) ) ( not ( = ?auto_236918 ?auto_236922 ) ) ( not ( = ?auto_236919 ?auto_236920 ) ) ( not ( = ?auto_236919 ?auto_236921 ) ) ( not ( = ?auto_236919 ?auto_236922 ) ) ( not ( = ?auto_236920 ?auto_236921 ) ) ( not ( = ?auto_236920 ?auto_236922 ) ) ( not ( = ?auto_236921 ?auto_236922 ) ) ( ON ?auto_236920 ?auto_236921 ) ( CLEAR ?auto_236918 ) ( ON ?auto_236919 ?auto_236920 ) ( CLEAR ?auto_236919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236917 ?auto_236918 ?auto_236919 )
      ( MAKE-5PILE ?auto_236917 ?auto_236918 ?auto_236919 ?auto_236920 ?auto_236921 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236928 - BLOCK
      ?auto_236929 - BLOCK
      ?auto_236930 - BLOCK
      ?auto_236931 - BLOCK
      ?auto_236932 - BLOCK
    )
    :vars
    (
      ?auto_236933 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236932 ?auto_236933 ) ( ON-TABLE ?auto_236928 ) ( ON ?auto_236929 ?auto_236928 ) ( not ( = ?auto_236928 ?auto_236929 ) ) ( not ( = ?auto_236928 ?auto_236930 ) ) ( not ( = ?auto_236928 ?auto_236931 ) ) ( not ( = ?auto_236928 ?auto_236932 ) ) ( not ( = ?auto_236928 ?auto_236933 ) ) ( not ( = ?auto_236929 ?auto_236930 ) ) ( not ( = ?auto_236929 ?auto_236931 ) ) ( not ( = ?auto_236929 ?auto_236932 ) ) ( not ( = ?auto_236929 ?auto_236933 ) ) ( not ( = ?auto_236930 ?auto_236931 ) ) ( not ( = ?auto_236930 ?auto_236932 ) ) ( not ( = ?auto_236930 ?auto_236933 ) ) ( not ( = ?auto_236931 ?auto_236932 ) ) ( not ( = ?auto_236931 ?auto_236933 ) ) ( not ( = ?auto_236932 ?auto_236933 ) ) ( ON ?auto_236931 ?auto_236932 ) ( CLEAR ?auto_236929 ) ( ON ?auto_236930 ?auto_236931 ) ( CLEAR ?auto_236930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_236928 ?auto_236929 ?auto_236930 )
      ( MAKE-5PILE ?auto_236928 ?auto_236929 ?auto_236930 ?auto_236931 ?auto_236932 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236939 - BLOCK
      ?auto_236940 - BLOCK
      ?auto_236941 - BLOCK
      ?auto_236942 - BLOCK
      ?auto_236943 - BLOCK
    )
    :vars
    (
      ?auto_236944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236943 ?auto_236944 ) ( ON-TABLE ?auto_236939 ) ( not ( = ?auto_236939 ?auto_236940 ) ) ( not ( = ?auto_236939 ?auto_236941 ) ) ( not ( = ?auto_236939 ?auto_236942 ) ) ( not ( = ?auto_236939 ?auto_236943 ) ) ( not ( = ?auto_236939 ?auto_236944 ) ) ( not ( = ?auto_236940 ?auto_236941 ) ) ( not ( = ?auto_236940 ?auto_236942 ) ) ( not ( = ?auto_236940 ?auto_236943 ) ) ( not ( = ?auto_236940 ?auto_236944 ) ) ( not ( = ?auto_236941 ?auto_236942 ) ) ( not ( = ?auto_236941 ?auto_236943 ) ) ( not ( = ?auto_236941 ?auto_236944 ) ) ( not ( = ?auto_236942 ?auto_236943 ) ) ( not ( = ?auto_236942 ?auto_236944 ) ) ( not ( = ?auto_236943 ?auto_236944 ) ) ( ON ?auto_236942 ?auto_236943 ) ( ON ?auto_236941 ?auto_236942 ) ( CLEAR ?auto_236939 ) ( ON ?auto_236940 ?auto_236941 ) ( CLEAR ?auto_236940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236939 ?auto_236940 )
      ( MAKE-5PILE ?auto_236939 ?auto_236940 ?auto_236941 ?auto_236942 ?auto_236943 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236950 - BLOCK
      ?auto_236951 - BLOCK
      ?auto_236952 - BLOCK
      ?auto_236953 - BLOCK
      ?auto_236954 - BLOCK
    )
    :vars
    (
      ?auto_236955 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236954 ?auto_236955 ) ( ON-TABLE ?auto_236950 ) ( not ( = ?auto_236950 ?auto_236951 ) ) ( not ( = ?auto_236950 ?auto_236952 ) ) ( not ( = ?auto_236950 ?auto_236953 ) ) ( not ( = ?auto_236950 ?auto_236954 ) ) ( not ( = ?auto_236950 ?auto_236955 ) ) ( not ( = ?auto_236951 ?auto_236952 ) ) ( not ( = ?auto_236951 ?auto_236953 ) ) ( not ( = ?auto_236951 ?auto_236954 ) ) ( not ( = ?auto_236951 ?auto_236955 ) ) ( not ( = ?auto_236952 ?auto_236953 ) ) ( not ( = ?auto_236952 ?auto_236954 ) ) ( not ( = ?auto_236952 ?auto_236955 ) ) ( not ( = ?auto_236953 ?auto_236954 ) ) ( not ( = ?auto_236953 ?auto_236955 ) ) ( not ( = ?auto_236954 ?auto_236955 ) ) ( ON ?auto_236953 ?auto_236954 ) ( ON ?auto_236952 ?auto_236953 ) ( CLEAR ?auto_236950 ) ( ON ?auto_236951 ?auto_236952 ) ( CLEAR ?auto_236951 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_236950 ?auto_236951 )
      ( MAKE-5PILE ?auto_236950 ?auto_236951 ?auto_236952 ?auto_236953 ?auto_236954 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236961 - BLOCK
      ?auto_236962 - BLOCK
      ?auto_236963 - BLOCK
      ?auto_236964 - BLOCK
      ?auto_236965 - BLOCK
    )
    :vars
    (
      ?auto_236966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236965 ?auto_236966 ) ( not ( = ?auto_236961 ?auto_236962 ) ) ( not ( = ?auto_236961 ?auto_236963 ) ) ( not ( = ?auto_236961 ?auto_236964 ) ) ( not ( = ?auto_236961 ?auto_236965 ) ) ( not ( = ?auto_236961 ?auto_236966 ) ) ( not ( = ?auto_236962 ?auto_236963 ) ) ( not ( = ?auto_236962 ?auto_236964 ) ) ( not ( = ?auto_236962 ?auto_236965 ) ) ( not ( = ?auto_236962 ?auto_236966 ) ) ( not ( = ?auto_236963 ?auto_236964 ) ) ( not ( = ?auto_236963 ?auto_236965 ) ) ( not ( = ?auto_236963 ?auto_236966 ) ) ( not ( = ?auto_236964 ?auto_236965 ) ) ( not ( = ?auto_236964 ?auto_236966 ) ) ( not ( = ?auto_236965 ?auto_236966 ) ) ( ON ?auto_236964 ?auto_236965 ) ( ON ?auto_236963 ?auto_236964 ) ( ON ?auto_236962 ?auto_236963 ) ( ON ?auto_236961 ?auto_236962 ) ( CLEAR ?auto_236961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236961 )
      ( MAKE-5PILE ?auto_236961 ?auto_236962 ?auto_236963 ?auto_236964 ?auto_236965 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_236972 - BLOCK
      ?auto_236973 - BLOCK
      ?auto_236974 - BLOCK
      ?auto_236975 - BLOCK
      ?auto_236976 - BLOCK
    )
    :vars
    (
      ?auto_236977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_236976 ?auto_236977 ) ( not ( = ?auto_236972 ?auto_236973 ) ) ( not ( = ?auto_236972 ?auto_236974 ) ) ( not ( = ?auto_236972 ?auto_236975 ) ) ( not ( = ?auto_236972 ?auto_236976 ) ) ( not ( = ?auto_236972 ?auto_236977 ) ) ( not ( = ?auto_236973 ?auto_236974 ) ) ( not ( = ?auto_236973 ?auto_236975 ) ) ( not ( = ?auto_236973 ?auto_236976 ) ) ( not ( = ?auto_236973 ?auto_236977 ) ) ( not ( = ?auto_236974 ?auto_236975 ) ) ( not ( = ?auto_236974 ?auto_236976 ) ) ( not ( = ?auto_236974 ?auto_236977 ) ) ( not ( = ?auto_236975 ?auto_236976 ) ) ( not ( = ?auto_236975 ?auto_236977 ) ) ( not ( = ?auto_236976 ?auto_236977 ) ) ( ON ?auto_236975 ?auto_236976 ) ( ON ?auto_236974 ?auto_236975 ) ( ON ?auto_236973 ?auto_236974 ) ( ON ?auto_236972 ?auto_236973 ) ( CLEAR ?auto_236972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_236972 )
      ( MAKE-5PILE ?auto_236972 ?auto_236973 ?auto_236974 ?auto_236975 ?auto_236976 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_236984 - BLOCK
      ?auto_236985 - BLOCK
      ?auto_236986 - BLOCK
      ?auto_236987 - BLOCK
      ?auto_236988 - BLOCK
      ?auto_236989 - BLOCK
    )
    :vars
    (
      ?auto_236990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_236988 ) ( ON ?auto_236989 ?auto_236990 ) ( CLEAR ?auto_236989 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236984 ) ( ON ?auto_236985 ?auto_236984 ) ( ON ?auto_236986 ?auto_236985 ) ( ON ?auto_236987 ?auto_236986 ) ( ON ?auto_236988 ?auto_236987 ) ( not ( = ?auto_236984 ?auto_236985 ) ) ( not ( = ?auto_236984 ?auto_236986 ) ) ( not ( = ?auto_236984 ?auto_236987 ) ) ( not ( = ?auto_236984 ?auto_236988 ) ) ( not ( = ?auto_236984 ?auto_236989 ) ) ( not ( = ?auto_236984 ?auto_236990 ) ) ( not ( = ?auto_236985 ?auto_236986 ) ) ( not ( = ?auto_236985 ?auto_236987 ) ) ( not ( = ?auto_236985 ?auto_236988 ) ) ( not ( = ?auto_236985 ?auto_236989 ) ) ( not ( = ?auto_236985 ?auto_236990 ) ) ( not ( = ?auto_236986 ?auto_236987 ) ) ( not ( = ?auto_236986 ?auto_236988 ) ) ( not ( = ?auto_236986 ?auto_236989 ) ) ( not ( = ?auto_236986 ?auto_236990 ) ) ( not ( = ?auto_236987 ?auto_236988 ) ) ( not ( = ?auto_236987 ?auto_236989 ) ) ( not ( = ?auto_236987 ?auto_236990 ) ) ( not ( = ?auto_236988 ?auto_236989 ) ) ( not ( = ?auto_236988 ?auto_236990 ) ) ( not ( = ?auto_236989 ?auto_236990 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_236989 ?auto_236990 )
      ( !STACK ?auto_236989 ?auto_236988 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_236997 - BLOCK
      ?auto_236998 - BLOCK
      ?auto_236999 - BLOCK
      ?auto_237000 - BLOCK
      ?auto_237001 - BLOCK
      ?auto_237002 - BLOCK
    )
    :vars
    (
      ?auto_237003 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237001 ) ( ON ?auto_237002 ?auto_237003 ) ( CLEAR ?auto_237002 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_236997 ) ( ON ?auto_236998 ?auto_236997 ) ( ON ?auto_236999 ?auto_236998 ) ( ON ?auto_237000 ?auto_236999 ) ( ON ?auto_237001 ?auto_237000 ) ( not ( = ?auto_236997 ?auto_236998 ) ) ( not ( = ?auto_236997 ?auto_236999 ) ) ( not ( = ?auto_236997 ?auto_237000 ) ) ( not ( = ?auto_236997 ?auto_237001 ) ) ( not ( = ?auto_236997 ?auto_237002 ) ) ( not ( = ?auto_236997 ?auto_237003 ) ) ( not ( = ?auto_236998 ?auto_236999 ) ) ( not ( = ?auto_236998 ?auto_237000 ) ) ( not ( = ?auto_236998 ?auto_237001 ) ) ( not ( = ?auto_236998 ?auto_237002 ) ) ( not ( = ?auto_236998 ?auto_237003 ) ) ( not ( = ?auto_236999 ?auto_237000 ) ) ( not ( = ?auto_236999 ?auto_237001 ) ) ( not ( = ?auto_236999 ?auto_237002 ) ) ( not ( = ?auto_236999 ?auto_237003 ) ) ( not ( = ?auto_237000 ?auto_237001 ) ) ( not ( = ?auto_237000 ?auto_237002 ) ) ( not ( = ?auto_237000 ?auto_237003 ) ) ( not ( = ?auto_237001 ?auto_237002 ) ) ( not ( = ?auto_237001 ?auto_237003 ) ) ( not ( = ?auto_237002 ?auto_237003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237002 ?auto_237003 )
      ( !STACK ?auto_237002 ?auto_237001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237010 - BLOCK
      ?auto_237011 - BLOCK
      ?auto_237012 - BLOCK
      ?auto_237013 - BLOCK
      ?auto_237014 - BLOCK
      ?auto_237015 - BLOCK
    )
    :vars
    (
      ?auto_237016 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237015 ?auto_237016 ) ( ON-TABLE ?auto_237010 ) ( ON ?auto_237011 ?auto_237010 ) ( ON ?auto_237012 ?auto_237011 ) ( ON ?auto_237013 ?auto_237012 ) ( not ( = ?auto_237010 ?auto_237011 ) ) ( not ( = ?auto_237010 ?auto_237012 ) ) ( not ( = ?auto_237010 ?auto_237013 ) ) ( not ( = ?auto_237010 ?auto_237014 ) ) ( not ( = ?auto_237010 ?auto_237015 ) ) ( not ( = ?auto_237010 ?auto_237016 ) ) ( not ( = ?auto_237011 ?auto_237012 ) ) ( not ( = ?auto_237011 ?auto_237013 ) ) ( not ( = ?auto_237011 ?auto_237014 ) ) ( not ( = ?auto_237011 ?auto_237015 ) ) ( not ( = ?auto_237011 ?auto_237016 ) ) ( not ( = ?auto_237012 ?auto_237013 ) ) ( not ( = ?auto_237012 ?auto_237014 ) ) ( not ( = ?auto_237012 ?auto_237015 ) ) ( not ( = ?auto_237012 ?auto_237016 ) ) ( not ( = ?auto_237013 ?auto_237014 ) ) ( not ( = ?auto_237013 ?auto_237015 ) ) ( not ( = ?auto_237013 ?auto_237016 ) ) ( not ( = ?auto_237014 ?auto_237015 ) ) ( not ( = ?auto_237014 ?auto_237016 ) ) ( not ( = ?auto_237015 ?auto_237016 ) ) ( CLEAR ?auto_237013 ) ( ON ?auto_237014 ?auto_237015 ) ( CLEAR ?auto_237014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237010 ?auto_237011 ?auto_237012 ?auto_237013 ?auto_237014 )
      ( MAKE-6PILE ?auto_237010 ?auto_237011 ?auto_237012 ?auto_237013 ?auto_237014 ?auto_237015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237023 - BLOCK
      ?auto_237024 - BLOCK
      ?auto_237025 - BLOCK
      ?auto_237026 - BLOCK
      ?auto_237027 - BLOCK
      ?auto_237028 - BLOCK
    )
    :vars
    (
      ?auto_237029 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237028 ?auto_237029 ) ( ON-TABLE ?auto_237023 ) ( ON ?auto_237024 ?auto_237023 ) ( ON ?auto_237025 ?auto_237024 ) ( ON ?auto_237026 ?auto_237025 ) ( not ( = ?auto_237023 ?auto_237024 ) ) ( not ( = ?auto_237023 ?auto_237025 ) ) ( not ( = ?auto_237023 ?auto_237026 ) ) ( not ( = ?auto_237023 ?auto_237027 ) ) ( not ( = ?auto_237023 ?auto_237028 ) ) ( not ( = ?auto_237023 ?auto_237029 ) ) ( not ( = ?auto_237024 ?auto_237025 ) ) ( not ( = ?auto_237024 ?auto_237026 ) ) ( not ( = ?auto_237024 ?auto_237027 ) ) ( not ( = ?auto_237024 ?auto_237028 ) ) ( not ( = ?auto_237024 ?auto_237029 ) ) ( not ( = ?auto_237025 ?auto_237026 ) ) ( not ( = ?auto_237025 ?auto_237027 ) ) ( not ( = ?auto_237025 ?auto_237028 ) ) ( not ( = ?auto_237025 ?auto_237029 ) ) ( not ( = ?auto_237026 ?auto_237027 ) ) ( not ( = ?auto_237026 ?auto_237028 ) ) ( not ( = ?auto_237026 ?auto_237029 ) ) ( not ( = ?auto_237027 ?auto_237028 ) ) ( not ( = ?auto_237027 ?auto_237029 ) ) ( not ( = ?auto_237028 ?auto_237029 ) ) ( CLEAR ?auto_237026 ) ( ON ?auto_237027 ?auto_237028 ) ( CLEAR ?auto_237027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237023 ?auto_237024 ?auto_237025 ?auto_237026 ?auto_237027 )
      ( MAKE-6PILE ?auto_237023 ?auto_237024 ?auto_237025 ?auto_237026 ?auto_237027 ?auto_237028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237036 - BLOCK
      ?auto_237037 - BLOCK
      ?auto_237038 - BLOCK
      ?auto_237039 - BLOCK
      ?auto_237040 - BLOCK
      ?auto_237041 - BLOCK
    )
    :vars
    (
      ?auto_237042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237041 ?auto_237042 ) ( ON-TABLE ?auto_237036 ) ( ON ?auto_237037 ?auto_237036 ) ( ON ?auto_237038 ?auto_237037 ) ( not ( = ?auto_237036 ?auto_237037 ) ) ( not ( = ?auto_237036 ?auto_237038 ) ) ( not ( = ?auto_237036 ?auto_237039 ) ) ( not ( = ?auto_237036 ?auto_237040 ) ) ( not ( = ?auto_237036 ?auto_237041 ) ) ( not ( = ?auto_237036 ?auto_237042 ) ) ( not ( = ?auto_237037 ?auto_237038 ) ) ( not ( = ?auto_237037 ?auto_237039 ) ) ( not ( = ?auto_237037 ?auto_237040 ) ) ( not ( = ?auto_237037 ?auto_237041 ) ) ( not ( = ?auto_237037 ?auto_237042 ) ) ( not ( = ?auto_237038 ?auto_237039 ) ) ( not ( = ?auto_237038 ?auto_237040 ) ) ( not ( = ?auto_237038 ?auto_237041 ) ) ( not ( = ?auto_237038 ?auto_237042 ) ) ( not ( = ?auto_237039 ?auto_237040 ) ) ( not ( = ?auto_237039 ?auto_237041 ) ) ( not ( = ?auto_237039 ?auto_237042 ) ) ( not ( = ?auto_237040 ?auto_237041 ) ) ( not ( = ?auto_237040 ?auto_237042 ) ) ( not ( = ?auto_237041 ?auto_237042 ) ) ( ON ?auto_237040 ?auto_237041 ) ( CLEAR ?auto_237038 ) ( ON ?auto_237039 ?auto_237040 ) ( CLEAR ?auto_237039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237036 ?auto_237037 ?auto_237038 ?auto_237039 )
      ( MAKE-6PILE ?auto_237036 ?auto_237037 ?auto_237038 ?auto_237039 ?auto_237040 ?auto_237041 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237049 - BLOCK
      ?auto_237050 - BLOCK
      ?auto_237051 - BLOCK
      ?auto_237052 - BLOCK
      ?auto_237053 - BLOCK
      ?auto_237054 - BLOCK
    )
    :vars
    (
      ?auto_237055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237054 ?auto_237055 ) ( ON-TABLE ?auto_237049 ) ( ON ?auto_237050 ?auto_237049 ) ( ON ?auto_237051 ?auto_237050 ) ( not ( = ?auto_237049 ?auto_237050 ) ) ( not ( = ?auto_237049 ?auto_237051 ) ) ( not ( = ?auto_237049 ?auto_237052 ) ) ( not ( = ?auto_237049 ?auto_237053 ) ) ( not ( = ?auto_237049 ?auto_237054 ) ) ( not ( = ?auto_237049 ?auto_237055 ) ) ( not ( = ?auto_237050 ?auto_237051 ) ) ( not ( = ?auto_237050 ?auto_237052 ) ) ( not ( = ?auto_237050 ?auto_237053 ) ) ( not ( = ?auto_237050 ?auto_237054 ) ) ( not ( = ?auto_237050 ?auto_237055 ) ) ( not ( = ?auto_237051 ?auto_237052 ) ) ( not ( = ?auto_237051 ?auto_237053 ) ) ( not ( = ?auto_237051 ?auto_237054 ) ) ( not ( = ?auto_237051 ?auto_237055 ) ) ( not ( = ?auto_237052 ?auto_237053 ) ) ( not ( = ?auto_237052 ?auto_237054 ) ) ( not ( = ?auto_237052 ?auto_237055 ) ) ( not ( = ?auto_237053 ?auto_237054 ) ) ( not ( = ?auto_237053 ?auto_237055 ) ) ( not ( = ?auto_237054 ?auto_237055 ) ) ( ON ?auto_237053 ?auto_237054 ) ( CLEAR ?auto_237051 ) ( ON ?auto_237052 ?auto_237053 ) ( CLEAR ?auto_237052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237049 ?auto_237050 ?auto_237051 ?auto_237052 )
      ( MAKE-6PILE ?auto_237049 ?auto_237050 ?auto_237051 ?auto_237052 ?auto_237053 ?auto_237054 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237062 - BLOCK
      ?auto_237063 - BLOCK
      ?auto_237064 - BLOCK
      ?auto_237065 - BLOCK
      ?auto_237066 - BLOCK
      ?auto_237067 - BLOCK
    )
    :vars
    (
      ?auto_237068 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237067 ?auto_237068 ) ( ON-TABLE ?auto_237062 ) ( ON ?auto_237063 ?auto_237062 ) ( not ( = ?auto_237062 ?auto_237063 ) ) ( not ( = ?auto_237062 ?auto_237064 ) ) ( not ( = ?auto_237062 ?auto_237065 ) ) ( not ( = ?auto_237062 ?auto_237066 ) ) ( not ( = ?auto_237062 ?auto_237067 ) ) ( not ( = ?auto_237062 ?auto_237068 ) ) ( not ( = ?auto_237063 ?auto_237064 ) ) ( not ( = ?auto_237063 ?auto_237065 ) ) ( not ( = ?auto_237063 ?auto_237066 ) ) ( not ( = ?auto_237063 ?auto_237067 ) ) ( not ( = ?auto_237063 ?auto_237068 ) ) ( not ( = ?auto_237064 ?auto_237065 ) ) ( not ( = ?auto_237064 ?auto_237066 ) ) ( not ( = ?auto_237064 ?auto_237067 ) ) ( not ( = ?auto_237064 ?auto_237068 ) ) ( not ( = ?auto_237065 ?auto_237066 ) ) ( not ( = ?auto_237065 ?auto_237067 ) ) ( not ( = ?auto_237065 ?auto_237068 ) ) ( not ( = ?auto_237066 ?auto_237067 ) ) ( not ( = ?auto_237066 ?auto_237068 ) ) ( not ( = ?auto_237067 ?auto_237068 ) ) ( ON ?auto_237066 ?auto_237067 ) ( ON ?auto_237065 ?auto_237066 ) ( CLEAR ?auto_237063 ) ( ON ?auto_237064 ?auto_237065 ) ( CLEAR ?auto_237064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237062 ?auto_237063 ?auto_237064 )
      ( MAKE-6PILE ?auto_237062 ?auto_237063 ?auto_237064 ?auto_237065 ?auto_237066 ?auto_237067 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237075 - BLOCK
      ?auto_237076 - BLOCK
      ?auto_237077 - BLOCK
      ?auto_237078 - BLOCK
      ?auto_237079 - BLOCK
      ?auto_237080 - BLOCK
    )
    :vars
    (
      ?auto_237081 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237080 ?auto_237081 ) ( ON-TABLE ?auto_237075 ) ( ON ?auto_237076 ?auto_237075 ) ( not ( = ?auto_237075 ?auto_237076 ) ) ( not ( = ?auto_237075 ?auto_237077 ) ) ( not ( = ?auto_237075 ?auto_237078 ) ) ( not ( = ?auto_237075 ?auto_237079 ) ) ( not ( = ?auto_237075 ?auto_237080 ) ) ( not ( = ?auto_237075 ?auto_237081 ) ) ( not ( = ?auto_237076 ?auto_237077 ) ) ( not ( = ?auto_237076 ?auto_237078 ) ) ( not ( = ?auto_237076 ?auto_237079 ) ) ( not ( = ?auto_237076 ?auto_237080 ) ) ( not ( = ?auto_237076 ?auto_237081 ) ) ( not ( = ?auto_237077 ?auto_237078 ) ) ( not ( = ?auto_237077 ?auto_237079 ) ) ( not ( = ?auto_237077 ?auto_237080 ) ) ( not ( = ?auto_237077 ?auto_237081 ) ) ( not ( = ?auto_237078 ?auto_237079 ) ) ( not ( = ?auto_237078 ?auto_237080 ) ) ( not ( = ?auto_237078 ?auto_237081 ) ) ( not ( = ?auto_237079 ?auto_237080 ) ) ( not ( = ?auto_237079 ?auto_237081 ) ) ( not ( = ?auto_237080 ?auto_237081 ) ) ( ON ?auto_237079 ?auto_237080 ) ( ON ?auto_237078 ?auto_237079 ) ( CLEAR ?auto_237076 ) ( ON ?auto_237077 ?auto_237078 ) ( CLEAR ?auto_237077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237075 ?auto_237076 ?auto_237077 )
      ( MAKE-6PILE ?auto_237075 ?auto_237076 ?auto_237077 ?auto_237078 ?auto_237079 ?auto_237080 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237088 - BLOCK
      ?auto_237089 - BLOCK
      ?auto_237090 - BLOCK
      ?auto_237091 - BLOCK
      ?auto_237092 - BLOCK
      ?auto_237093 - BLOCK
    )
    :vars
    (
      ?auto_237094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237093 ?auto_237094 ) ( ON-TABLE ?auto_237088 ) ( not ( = ?auto_237088 ?auto_237089 ) ) ( not ( = ?auto_237088 ?auto_237090 ) ) ( not ( = ?auto_237088 ?auto_237091 ) ) ( not ( = ?auto_237088 ?auto_237092 ) ) ( not ( = ?auto_237088 ?auto_237093 ) ) ( not ( = ?auto_237088 ?auto_237094 ) ) ( not ( = ?auto_237089 ?auto_237090 ) ) ( not ( = ?auto_237089 ?auto_237091 ) ) ( not ( = ?auto_237089 ?auto_237092 ) ) ( not ( = ?auto_237089 ?auto_237093 ) ) ( not ( = ?auto_237089 ?auto_237094 ) ) ( not ( = ?auto_237090 ?auto_237091 ) ) ( not ( = ?auto_237090 ?auto_237092 ) ) ( not ( = ?auto_237090 ?auto_237093 ) ) ( not ( = ?auto_237090 ?auto_237094 ) ) ( not ( = ?auto_237091 ?auto_237092 ) ) ( not ( = ?auto_237091 ?auto_237093 ) ) ( not ( = ?auto_237091 ?auto_237094 ) ) ( not ( = ?auto_237092 ?auto_237093 ) ) ( not ( = ?auto_237092 ?auto_237094 ) ) ( not ( = ?auto_237093 ?auto_237094 ) ) ( ON ?auto_237092 ?auto_237093 ) ( ON ?auto_237091 ?auto_237092 ) ( ON ?auto_237090 ?auto_237091 ) ( CLEAR ?auto_237088 ) ( ON ?auto_237089 ?auto_237090 ) ( CLEAR ?auto_237089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237088 ?auto_237089 )
      ( MAKE-6PILE ?auto_237088 ?auto_237089 ?auto_237090 ?auto_237091 ?auto_237092 ?auto_237093 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237101 - BLOCK
      ?auto_237102 - BLOCK
      ?auto_237103 - BLOCK
      ?auto_237104 - BLOCK
      ?auto_237105 - BLOCK
      ?auto_237106 - BLOCK
    )
    :vars
    (
      ?auto_237107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237106 ?auto_237107 ) ( ON-TABLE ?auto_237101 ) ( not ( = ?auto_237101 ?auto_237102 ) ) ( not ( = ?auto_237101 ?auto_237103 ) ) ( not ( = ?auto_237101 ?auto_237104 ) ) ( not ( = ?auto_237101 ?auto_237105 ) ) ( not ( = ?auto_237101 ?auto_237106 ) ) ( not ( = ?auto_237101 ?auto_237107 ) ) ( not ( = ?auto_237102 ?auto_237103 ) ) ( not ( = ?auto_237102 ?auto_237104 ) ) ( not ( = ?auto_237102 ?auto_237105 ) ) ( not ( = ?auto_237102 ?auto_237106 ) ) ( not ( = ?auto_237102 ?auto_237107 ) ) ( not ( = ?auto_237103 ?auto_237104 ) ) ( not ( = ?auto_237103 ?auto_237105 ) ) ( not ( = ?auto_237103 ?auto_237106 ) ) ( not ( = ?auto_237103 ?auto_237107 ) ) ( not ( = ?auto_237104 ?auto_237105 ) ) ( not ( = ?auto_237104 ?auto_237106 ) ) ( not ( = ?auto_237104 ?auto_237107 ) ) ( not ( = ?auto_237105 ?auto_237106 ) ) ( not ( = ?auto_237105 ?auto_237107 ) ) ( not ( = ?auto_237106 ?auto_237107 ) ) ( ON ?auto_237105 ?auto_237106 ) ( ON ?auto_237104 ?auto_237105 ) ( ON ?auto_237103 ?auto_237104 ) ( CLEAR ?auto_237101 ) ( ON ?auto_237102 ?auto_237103 ) ( CLEAR ?auto_237102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237101 ?auto_237102 )
      ( MAKE-6PILE ?auto_237101 ?auto_237102 ?auto_237103 ?auto_237104 ?auto_237105 ?auto_237106 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237114 - BLOCK
      ?auto_237115 - BLOCK
      ?auto_237116 - BLOCK
      ?auto_237117 - BLOCK
      ?auto_237118 - BLOCK
      ?auto_237119 - BLOCK
    )
    :vars
    (
      ?auto_237120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237119 ?auto_237120 ) ( not ( = ?auto_237114 ?auto_237115 ) ) ( not ( = ?auto_237114 ?auto_237116 ) ) ( not ( = ?auto_237114 ?auto_237117 ) ) ( not ( = ?auto_237114 ?auto_237118 ) ) ( not ( = ?auto_237114 ?auto_237119 ) ) ( not ( = ?auto_237114 ?auto_237120 ) ) ( not ( = ?auto_237115 ?auto_237116 ) ) ( not ( = ?auto_237115 ?auto_237117 ) ) ( not ( = ?auto_237115 ?auto_237118 ) ) ( not ( = ?auto_237115 ?auto_237119 ) ) ( not ( = ?auto_237115 ?auto_237120 ) ) ( not ( = ?auto_237116 ?auto_237117 ) ) ( not ( = ?auto_237116 ?auto_237118 ) ) ( not ( = ?auto_237116 ?auto_237119 ) ) ( not ( = ?auto_237116 ?auto_237120 ) ) ( not ( = ?auto_237117 ?auto_237118 ) ) ( not ( = ?auto_237117 ?auto_237119 ) ) ( not ( = ?auto_237117 ?auto_237120 ) ) ( not ( = ?auto_237118 ?auto_237119 ) ) ( not ( = ?auto_237118 ?auto_237120 ) ) ( not ( = ?auto_237119 ?auto_237120 ) ) ( ON ?auto_237118 ?auto_237119 ) ( ON ?auto_237117 ?auto_237118 ) ( ON ?auto_237116 ?auto_237117 ) ( ON ?auto_237115 ?auto_237116 ) ( ON ?auto_237114 ?auto_237115 ) ( CLEAR ?auto_237114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237114 )
      ( MAKE-6PILE ?auto_237114 ?auto_237115 ?auto_237116 ?auto_237117 ?auto_237118 ?auto_237119 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_237127 - BLOCK
      ?auto_237128 - BLOCK
      ?auto_237129 - BLOCK
      ?auto_237130 - BLOCK
      ?auto_237131 - BLOCK
      ?auto_237132 - BLOCK
    )
    :vars
    (
      ?auto_237133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237132 ?auto_237133 ) ( not ( = ?auto_237127 ?auto_237128 ) ) ( not ( = ?auto_237127 ?auto_237129 ) ) ( not ( = ?auto_237127 ?auto_237130 ) ) ( not ( = ?auto_237127 ?auto_237131 ) ) ( not ( = ?auto_237127 ?auto_237132 ) ) ( not ( = ?auto_237127 ?auto_237133 ) ) ( not ( = ?auto_237128 ?auto_237129 ) ) ( not ( = ?auto_237128 ?auto_237130 ) ) ( not ( = ?auto_237128 ?auto_237131 ) ) ( not ( = ?auto_237128 ?auto_237132 ) ) ( not ( = ?auto_237128 ?auto_237133 ) ) ( not ( = ?auto_237129 ?auto_237130 ) ) ( not ( = ?auto_237129 ?auto_237131 ) ) ( not ( = ?auto_237129 ?auto_237132 ) ) ( not ( = ?auto_237129 ?auto_237133 ) ) ( not ( = ?auto_237130 ?auto_237131 ) ) ( not ( = ?auto_237130 ?auto_237132 ) ) ( not ( = ?auto_237130 ?auto_237133 ) ) ( not ( = ?auto_237131 ?auto_237132 ) ) ( not ( = ?auto_237131 ?auto_237133 ) ) ( not ( = ?auto_237132 ?auto_237133 ) ) ( ON ?auto_237131 ?auto_237132 ) ( ON ?auto_237130 ?auto_237131 ) ( ON ?auto_237129 ?auto_237130 ) ( ON ?auto_237128 ?auto_237129 ) ( ON ?auto_237127 ?auto_237128 ) ( CLEAR ?auto_237127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237127 )
      ( MAKE-6PILE ?auto_237127 ?auto_237128 ?auto_237129 ?auto_237130 ?auto_237131 ?auto_237132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237141 - BLOCK
      ?auto_237142 - BLOCK
      ?auto_237143 - BLOCK
      ?auto_237144 - BLOCK
      ?auto_237145 - BLOCK
      ?auto_237146 - BLOCK
      ?auto_237147 - BLOCK
    )
    :vars
    (
      ?auto_237148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237146 ) ( ON ?auto_237147 ?auto_237148 ) ( CLEAR ?auto_237147 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237141 ) ( ON ?auto_237142 ?auto_237141 ) ( ON ?auto_237143 ?auto_237142 ) ( ON ?auto_237144 ?auto_237143 ) ( ON ?auto_237145 ?auto_237144 ) ( ON ?auto_237146 ?auto_237145 ) ( not ( = ?auto_237141 ?auto_237142 ) ) ( not ( = ?auto_237141 ?auto_237143 ) ) ( not ( = ?auto_237141 ?auto_237144 ) ) ( not ( = ?auto_237141 ?auto_237145 ) ) ( not ( = ?auto_237141 ?auto_237146 ) ) ( not ( = ?auto_237141 ?auto_237147 ) ) ( not ( = ?auto_237141 ?auto_237148 ) ) ( not ( = ?auto_237142 ?auto_237143 ) ) ( not ( = ?auto_237142 ?auto_237144 ) ) ( not ( = ?auto_237142 ?auto_237145 ) ) ( not ( = ?auto_237142 ?auto_237146 ) ) ( not ( = ?auto_237142 ?auto_237147 ) ) ( not ( = ?auto_237142 ?auto_237148 ) ) ( not ( = ?auto_237143 ?auto_237144 ) ) ( not ( = ?auto_237143 ?auto_237145 ) ) ( not ( = ?auto_237143 ?auto_237146 ) ) ( not ( = ?auto_237143 ?auto_237147 ) ) ( not ( = ?auto_237143 ?auto_237148 ) ) ( not ( = ?auto_237144 ?auto_237145 ) ) ( not ( = ?auto_237144 ?auto_237146 ) ) ( not ( = ?auto_237144 ?auto_237147 ) ) ( not ( = ?auto_237144 ?auto_237148 ) ) ( not ( = ?auto_237145 ?auto_237146 ) ) ( not ( = ?auto_237145 ?auto_237147 ) ) ( not ( = ?auto_237145 ?auto_237148 ) ) ( not ( = ?auto_237146 ?auto_237147 ) ) ( not ( = ?auto_237146 ?auto_237148 ) ) ( not ( = ?auto_237147 ?auto_237148 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237147 ?auto_237148 )
      ( !STACK ?auto_237147 ?auto_237146 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237156 - BLOCK
      ?auto_237157 - BLOCK
      ?auto_237158 - BLOCK
      ?auto_237159 - BLOCK
      ?auto_237160 - BLOCK
      ?auto_237161 - BLOCK
      ?auto_237162 - BLOCK
    )
    :vars
    (
      ?auto_237163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237161 ) ( ON ?auto_237162 ?auto_237163 ) ( CLEAR ?auto_237162 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237156 ) ( ON ?auto_237157 ?auto_237156 ) ( ON ?auto_237158 ?auto_237157 ) ( ON ?auto_237159 ?auto_237158 ) ( ON ?auto_237160 ?auto_237159 ) ( ON ?auto_237161 ?auto_237160 ) ( not ( = ?auto_237156 ?auto_237157 ) ) ( not ( = ?auto_237156 ?auto_237158 ) ) ( not ( = ?auto_237156 ?auto_237159 ) ) ( not ( = ?auto_237156 ?auto_237160 ) ) ( not ( = ?auto_237156 ?auto_237161 ) ) ( not ( = ?auto_237156 ?auto_237162 ) ) ( not ( = ?auto_237156 ?auto_237163 ) ) ( not ( = ?auto_237157 ?auto_237158 ) ) ( not ( = ?auto_237157 ?auto_237159 ) ) ( not ( = ?auto_237157 ?auto_237160 ) ) ( not ( = ?auto_237157 ?auto_237161 ) ) ( not ( = ?auto_237157 ?auto_237162 ) ) ( not ( = ?auto_237157 ?auto_237163 ) ) ( not ( = ?auto_237158 ?auto_237159 ) ) ( not ( = ?auto_237158 ?auto_237160 ) ) ( not ( = ?auto_237158 ?auto_237161 ) ) ( not ( = ?auto_237158 ?auto_237162 ) ) ( not ( = ?auto_237158 ?auto_237163 ) ) ( not ( = ?auto_237159 ?auto_237160 ) ) ( not ( = ?auto_237159 ?auto_237161 ) ) ( not ( = ?auto_237159 ?auto_237162 ) ) ( not ( = ?auto_237159 ?auto_237163 ) ) ( not ( = ?auto_237160 ?auto_237161 ) ) ( not ( = ?auto_237160 ?auto_237162 ) ) ( not ( = ?auto_237160 ?auto_237163 ) ) ( not ( = ?auto_237161 ?auto_237162 ) ) ( not ( = ?auto_237161 ?auto_237163 ) ) ( not ( = ?auto_237162 ?auto_237163 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237162 ?auto_237163 )
      ( !STACK ?auto_237162 ?auto_237161 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237171 - BLOCK
      ?auto_237172 - BLOCK
      ?auto_237173 - BLOCK
      ?auto_237174 - BLOCK
      ?auto_237175 - BLOCK
      ?auto_237176 - BLOCK
      ?auto_237177 - BLOCK
    )
    :vars
    (
      ?auto_237178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237177 ?auto_237178 ) ( ON-TABLE ?auto_237171 ) ( ON ?auto_237172 ?auto_237171 ) ( ON ?auto_237173 ?auto_237172 ) ( ON ?auto_237174 ?auto_237173 ) ( ON ?auto_237175 ?auto_237174 ) ( not ( = ?auto_237171 ?auto_237172 ) ) ( not ( = ?auto_237171 ?auto_237173 ) ) ( not ( = ?auto_237171 ?auto_237174 ) ) ( not ( = ?auto_237171 ?auto_237175 ) ) ( not ( = ?auto_237171 ?auto_237176 ) ) ( not ( = ?auto_237171 ?auto_237177 ) ) ( not ( = ?auto_237171 ?auto_237178 ) ) ( not ( = ?auto_237172 ?auto_237173 ) ) ( not ( = ?auto_237172 ?auto_237174 ) ) ( not ( = ?auto_237172 ?auto_237175 ) ) ( not ( = ?auto_237172 ?auto_237176 ) ) ( not ( = ?auto_237172 ?auto_237177 ) ) ( not ( = ?auto_237172 ?auto_237178 ) ) ( not ( = ?auto_237173 ?auto_237174 ) ) ( not ( = ?auto_237173 ?auto_237175 ) ) ( not ( = ?auto_237173 ?auto_237176 ) ) ( not ( = ?auto_237173 ?auto_237177 ) ) ( not ( = ?auto_237173 ?auto_237178 ) ) ( not ( = ?auto_237174 ?auto_237175 ) ) ( not ( = ?auto_237174 ?auto_237176 ) ) ( not ( = ?auto_237174 ?auto_237177 ) ) ( not ( = ?auto_237174 ?auto_237178 ) ) ( not ( = ?auto_237175 ?auto_237176 ) ) ( not ( = ?auto_237175 ?auto_237177 ) ) ( not ( = ?auto_237175 ?auto_237178 ) ) ( not ( = ?auto_237176 ?auto_237177 ) ) ( not ( = ?auto_237176 ?auto_237178 ) ) ( not ( = ?auto_237177 ?auto_237178 ) ) ( CLEAR ?auto_237175 ) ( ON ?auto_237176 ?auto_237177 ) ( CLEAR ?auto_237176 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237171 ?auto_237172 ?auto_237173 ?auto_237174 ?auto_237175 ?auto_237176 )
      ( MAKE-7PILE ?auto_237171 ?auto_237172 ?auto_237173 ?auto_237174 ?auto_237175 ?auto_237176 ?auto_237177 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237186 - BLOCK
      ?auto_237187 - BLOCK
      ?auto_237188 - BLOCK
      ?auto_237189 - BLOCK
      ?auto_237190 - BLOCK
      ?auto_237191 - BLOCK
      ?auto_237192 - BLOCK
    )
    :vars
    (
      ?auto_237193 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237192 ?auto_237193 ) ( ON-TABLE ?auto_237186 ) ( ON ?auto_237187 ?auto_237186 ) ( ON ?auto_237188 ?auto_237187 ) ( ON ?auto_237189 ?auto_237188 ) ( ON ?auto_237190 ?auto_237189 ) ( not ( = ?auto_237186 ?auto_237187 ) ) ( not ( = ?auto_237186 ?auto_237188 ) ) ( not ( = ?auto_237186 ?auto_237189 ) ) ( not ( = ?auto_237186 ?auto_237190 ) ) ( not ( = ?auto_237186 ?auto_237191 ) ) ( not ( = ?auto_237186 ?auto_237192 ) ) ( not ( = ?auto_237186 ?auto_237193 ) ) ( not ( = ?auto_237187 ?auto_237188 ) ) ( not ( = ?auto_237187 ?auto_237189 ) ) ( not ( = ?auto_237187 ?auto_237190 ) ) ( not ( = ?auto_237187 ?auto_237191 ) ) ( not ( = ?auto_237187 ?auto_237192 ) ) ( not ( = ?auto_237187 ?auto_237193 ) ) ( not ( = ?auto_237188 ?auto_237189 ) ) ( not ( = ?auto_237188 ?auto_237190 ) ) ( not ( = ?auto_237188 ?auto_237191 ) ) ( not ( = ?auto_237188 ?auto_237192 ) ) ( not ( = ?auto_237188 ?auto_237193 ) ) ( not ( = ?auto_237189 ?auto_237190 ) ) ( not ( = ?auto_237189 ?auto_237191 ) ) ( not ( = ?auto_237189 ?auto_237192 ) ) ( not ( = ?auto_237189 ?auto_237193 ) ) ( not ( = ?auto_237190 ?auto_237191 ) ) ( not ( = ?auto_237190 ?auto_237192 ) ) ( not ( = ?auto_237190 ?auto_237193 ) ) ( not ( = ?auto_237191 ?auto_237192 ) ) ( not ( = ?auto_237191 ?auto_237193 ) ) ( not ( = ?auto_237192 ?auto_237193 ) ) ( CLEAR ?auto_237190 ) ( ON ?auto_237191 ?auto_237192 ) ( CLEAR ?auto_237191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237186 ?auto_237187 ?auto_237188 ?auto_237189 ?auto_237190 ?auto_237191 )
      ( MAKE-7PILE ?auto_237186 ?auto_237187 ?auto_237188 ?auto_237189 ?auto_237190 ?auto_237191 ?auto_237192 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237201 - BLOCK
      ?auto_237202 - BLOCK
      ?auto_237203 - BLOCK
      ?auto_237204 - BLOCK
      ?auto_237205 - BLOCK
      ?auto_237206 - BLOCK
      ?auto_237207 - BLOCK
    )
    :vars
    (
      ?auto_237208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237207 ?auto_237208 ) ( ON-TABLE ?auto_237201 ) ( ON ?auto_237202 ?auto_237201 ) ( ON ?auto_237203 ?auto_237202 ) ( ON ?auto_237204 ?auto_237203 ) ( not ( = ?auto_237201 ?auto_237202 ) ) ( not ( = ?auto_237201 ?auto_237203 ) ) ( not ( = ?auto_237201 ?auto_237204 ) ) ( not ( = ?auto_237201 ?auto_237205 ) ) ( not ( = ?auto_237201 ?auto_237206 ) ) ( not ( = ?auto_237201 ?auto_237207 ) ) ( not ( = ?auto_237201 ?auto_237208 ) ) ( not ( = ?auto_237202 ?auto_237203 ) ) ( not ( = ?auto_237202 ?auto_237204 ) ) ( not ( = ?auto_237202 ?auto_237205 ) ) ( not ( = ?auto_237202 ?auto_237206 ) ) ( not ( = ?auto_237202 ?auto_237207 ) ) ( not ( = ?auto_237202 ?auto_237208 ) ) ( not ( = ?auto_237203 ?auto_237204 ) ) ( not ( = ?auto_237203 ?auto_237205 ) ) ( not ( = ?auto_237203 ?auto_237206 ) ) ( not ( = ?auto_237203 ?auto_237207 ) ) ( not ( = ?auto_237203 ?auto_237208 ) ) ( not ( = ?auto_237204 ?auto_237205 ) ) ( not ( = ?auto_237204 ?auto_237206 ) ) ( not ( = ?auto_237204 ?auto_237207 ) ) ( not ( = ?auto_237204 ?auto_237208 ) ) ( not ( = ?auto_237205 ?auto_237206 ) ) ( not ( = ?auto_237205 ?auto_237207 ) ) ( not ( = ?auto_237205 ?auto_237208 ) ) ( not ( = ?auto_237206 ?auto_237207 ) ) ( not ( = ?auto_237206 ?auto_237208 ) ) ( not ( = ?auto_237207 ?auto_237208 ) ) ( ON ?auto_237206 ?auto_237207 ) ( CLEAR ?auto_237204 ) ( ON ?auto_237205 ?auto_237206 ) ( CLEAR ?auto_237205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237201 ?auto_237202 ?auto_237203 ?auto_237204 ?auto_237205 )
      ( MAKE-7PILE ?auto_237201 ?auto_237202 ?auto_237203 ?auto_237204 ?auto_237205 ?auto_237206 ?auto_237207 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237216 - BLOCK
      ?auto_237217 - BLOCK
      ?auto_237218 - BLOCK
      ?auto_237219 - BLOCK
      ?auto_237220 - BLOCK
      ?auto_237221 - BLOCK
      ?auto_237222 - BLOCK
    )
    :vars
    (
      ?auto_237223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237222 ?auto_237223 ) ( ON-TABLE ?auto_237216 ) ( ON ?auto_237217 ?auto_237216 ) ( ON ?auto_237218 ?auto_237217 ) ( ON ?auto_237219 ?auto_237218 ) ( not ( = ?auto_237216 ?auto_237217 ) ) ( not ( = ?auto_237216 ?auto_237218 ) ) ( not ( = ?auto_237216 ?auto_237219 ) ) ( not ( = ?auto_237216 ?auto_237220 ) ) ( not ( = ?auto_237216 ?auto_237221 ) ) ( not ( = ?auto_237216 ?auto_237222 ) ) ( not ( = ?auto_237216 ?auto_237223 ) ) ( not ( = ?auto_237217 ?auto_237218 ) ) ( not ( = ?auto_237217 ?auto_237219 ) ) ( not ( = ?auto_237217 ?auto_237220 ) ) ( not ( = ?auto_237217 ?auto_237221 ) ) ( not ( = ?auto_237217 ?auto_237222 ) ) ( not ( = ?auto_237217 ?auto_237223 ) ) ( not ( = ?auto_237218 ?auto_237219 ) ) ( not ( = ?auto_237218 ?auto_237220 ) ) ( not ( = ?auto_237218 ?auto_237221 ) ) ( not ( = ?auto_237218 ?auto_237222 ) ) ( not ( = ?auto_237218 ?auto_237223 ) ) ( not ( = ?auto_237219 ?auto_237220 ) ) ( not ( = ?auto_237219 ?auto_237221 ) ) ( not ( = ?auto_237219 ?auto_237222 ) ) ( not ( = ?auto_237219 ?auto_237223 ) ) ( not ( = ?auto_237220 ?auto_237221 ) ) ( not ( = ?auto_237220 ?auto_237222 ) ) ( not ( = ?auto_237220 ?auto_237223 ) ) ( not ( = ?auto_237221 ?auto_237222 ) ) ( not ( = ?auto_237221 ?auto_237223 ) ) ( not ( = ?auto_237222 ?auto_237223 ) ) ( ON ?auto_237221 ?auto_237222 ) ( CLEAR ?auto_237219 ) ( ON ?auto_237220 ?auto_237221 ) ( CLEAR ?auto_237220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237216 ?auto_237217 ?auto_237218 ?auto_237219 ?auto_237220 )
      ( MAKE-7PILE ?auto_237216 ?auto_237217 ?auto_237218 ?auto_237219 ?auto_237220 ?auto_237221 ?auto_237222 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237231 - BLOCK
      ?auto_237232 - BLOCK
      ?auto_237233 - BLOCK
      ?auto_237234 - BLOCK
      ?auto_237235 - BLOCK
      ?auto_237236 - BLOCK
      ?auto_237237 - BLOCK
    )
    :vars
    (
      ?auto_237238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237237 ?auto_237238 ) ( ON-TABLE ?auto_237231 ) ( ON ?auto_237232 ?auto_237231 ) ( ON ?auto_237233 ?auto_237232 ) ( not ( = ?auto_237231 ?auto_237232 ) ) ( not ( = ?auto_237231 ?auto_237233 ) ) ( not ( = ?auto_237231 ?auto_237234 ) ) ( not ( = ?auto_237231 ?auto_237235 ) ) ( not ( = ?auto_237231 ?auto_237236 ) ) ( not ( = ?auto_237231 ?auto_237237 ) ) ( not ( = ?auto_237231 ?auto_237238 ) ) ( not ( = ?auto_237232 ?auto_237233 ) ) ( not ( = ?auto_237232 ?auto_237234 ) ) ( not ( = ?auto_237232 ?auto_237235 ) ) ( not ( = ?auto_237232 ?auto_237236 ) ) ( not ( = ?auto_237232 ?auto_237237 ) ) ( not ( = ?auto_237232 ?auto_237238 ) ) ( not ( = ?auto_237233 ?auto_237234 ) ) ( not ( = ?auto_237233 ?auto_237235 ) ) ( not ( = ?auto_237233 ?auto_237236 ) ) ( not ( = ?auto_237233 ?auto_237237 ) ) ( not ( = ?auto_237233 ?auto_237238 ) ) ( not ( = ?auto_237234 ?auto_237235 ) ) ( not ( = ?auto_237234 ?auto_237236 ) ) ( not ( = ?auto_237234 ?auto_237237 ) ) ( not ( = ?auto_237234 ?auto_237238 ) ) ( not ( = ?auto_237235 ?auto_237236 ) ) ( not ( = ?auto_237235 ?auto_237237 ) ) ( not ( = ?auto_237235 ?auto_237238 ) ) ( not ( = ?auto_237236 ?auto_237237 ) ) ( not ( = ?auto_237236 ?auto_237238 ) ) ( not ( = ?auto_237237 ?auto_237238 ) ) ( ON ?auto_237236 ?auto_237237 ) ( ON ?auto_237235 ?auto_237236 ) ( CLEAR ?auto_237233 ) ( ON ?auto_237234 ?auto_237235 ) ( CLEAR ?auto_237234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237231 ?auto_237232 ?auto_237233 ?auto_237234 )
      ( MAKE-7PILE ?auto_237231 ?auto_237232 ?auto_237233 ?auto_237234 ?auto_237235 ?auto_237236 ?auto_237237 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237246 - BLOCK
      ?auto_237247 - BLOCK
      ?auto_237248 - BLOCK
      ?auto_237249 - BLOCK
      ?auto_237250 - BLOCK
      ?auto_237251 - BLOCK
      ?auto_237252 - BLOCK
    )
    :vars
    (
      ?auto_237253 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237252 ?auto_237253 ) ( ON-TABLE ?auto_237246 ) ( ON ?auto_237247 ?auto_237246 ) ( ON ?auto_237248 ?auto_237247 ) ( not ( = ?auto_237246 ?auto_237247 ) ) ( not ( = ?auto_237246 ?auto_237248 ) ) ( not ( = ?auto_237246 ?auto_237249 ) ) ( not ( = ?auto_237246 ?auto_237250 ) ) ( not ( = ?auto_237246 ?auto_237251 ) ) ( not ( = ?auto_237246 ?auto_237252 ) ) ( not ( = ?auto_237246 ?auto_237253 ) ) ( not ( = ?auto_237247 ?auto_237248 ) ) ( not ( = ?auto_237247 ?auto_237249 ) ) ( not ( = ?auto_237247 ?auto_237250 ) ) ( not ( = ?auto_237247 ?auto_237251 ) ) ( not ( = ?auto_237247 ?auto_237252 ) ) ( not ( = ?auto_237247 ?auto_237253 ) ) ( not ( = ?auto_237248 ?auto_237249 ) ) ( not ( = ?auto_237248 ?auto_237250 ) ) ( not ( = ?auto_237248 ?auto_237251 ) ) ( not ( = ?auto_237248 ?auto_237252 ) ) ( not ( = ?auto_237248 ?auto_237253 ) ) ( not ( = ?auto_237249 ?auto_237250 ) ) ( not ( = ?auto_237249 ?auto_237251 ) ) ( not ( = ?auto_237249 ?auto_237252 ) ) ( not ( = ?auto_237249 ?auto_237253 ) ) ( not ( = ?auto_237250 ?auto_237251 ) ) ( not ( = ?auto_237250 ?auto_237252 ) ) ( not ( = ?auto_237250 ?auto_237253 ) ) ( not ( = ?auto_237251 ?auto_237252 ) ) ( not ( = ?auto_237251 ?auto_237253 ) ) ( not ( = ?auto_237252 ?auto_237253 ) ) ( ON ?auto_237251 ?auto_237252 ) ( ON ?auto_237250 ?auto_237251 ) ( CLEAR ?auto_237248 ) ( ON ?auto_237249 ?auto_237250 ) ( CLEAR ?auto_237249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237246 ?auto_237247 ?auto_237248 ?auto_237249 )
      ( MAKE-7PILE ?auto_237246 ?auto_237247 ?auto_237248 ?auto_237249 ?auto_237250 ?auto_237251 ?auto_237252 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237261 - BLOCK
      ?auto_237262 - BLOCK
      ?auto_237263 - BLOCK
      ?auto_237264 - BLOCK
      ?auto_237265 - BLOCK
      ?auto_237266 - BLOCK
      ?auto_237267 - BLOCK
    )
    :vars
    (
      ?auto_237268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237267 ?auto_237268 ) ( ON-TABLE ?auto_237261 ) ( ON ?auto_237262 ?auto_237261 ) ( not ( = ?auto_237261 ?auto_237262 ) ) ( not ( = ?auto_237261 ?auto_237263 ) ) ( not ( = ?auto_237261 ?auto_237264 ) ) ( not ( = ?auto_237261 ?auto_237265 ) ) ( not ( = ?auto_237261 ?auto_237266 ) ) ( not ( = ?auto_237261 ?auto_237267 ) ) ( not ( = ?auto_237261 ?auto_237268 ) ) ( not ( = ?auto_237262 ?auto_237263 ) ) ( not ( = ?auto_237262 ?auto_237264 ) ) ( not ( = ?auto_237262 ?auto_237265 ) ) ( not ( = ?auto_237262 ?auto_237266 ) ) ( not ( = ?auto_237262 ?auto_237267 ) ) ( not ( = ?auto_237262 ?auto_237268 ) ) ( not ( = ?auto_237263 ?auto_237264 ) ) ( not ( = ?auto_237263 ?auto_237265 ) ) ( not ( = ?auto_237263 ?auto_237266 ) ) ( not ( = ?auto_237263 ?auto_237267 ) ) ( not ( = ?auto_237263 ?auto_237268 ) ) ( not ( = ?auto_237264 ?auto_237265 ) ) ( not ( = ?auto_237264 ?auto_237266 ) ) ( not ( = ?auto_237264 ?auto_237267 ) ) ( not ( = ?auto_237264 ?auto_237268 ) ) ( not ( = ?auto_237265 ?auto_237266 ) ) ( not ( = ?auto_237265 ?auto_237267 ) ) ( not ( = ?auto_237265 ?auto_237268 ) ) ( not ( = ?auto_237266 ?auto_237267 ) ) ( not ( = ?auto_237266 ?auto_237268 ) ) ( not ( = ?auto_237267 ?auto_237268 ) ) ( ON ?auto_237266 ?auto_237267 ) ( ON ?auto_237265 ?auto_237266 ) ( ON ?auto_237264 ?auto_237265 ) ( CLEAR ?auto_237262 ) ( ON ?auto_237263 ?auto_237264 ) ( CLEAR ?auto_237263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237261 ?auto_237262 ?auto_237263 )
      ( MAKE-7PILE ?auto_237261 ?auto_237262 ?auto_237263 ?auto_237264 ?auto_237265 ?auto_237266 ?auto_237267 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237276 - BLOCK
      ?auto_237277 - BLOCK
      ?auto_237278 - BLOCK
      ?auto_237279 - BLOCK
      ?auto_237280 - BLOCK
      ?auto_237281 - BLOCK
      ?auto_237282 - BLOCK
    )
    :vars
    (
      ?auto_237283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237282 ?auto_237283 ) ( ON-TABLE ?auto_237276 ) ( ON ?auto_237277 ?auto_237276 ) ( not ( = ?auto_237276 ?auto_237277 ) ) ( not ( = ?auto_237276 ?auto_237278 ) ) ( not ( = ?auto_237276 ?auto_237279 ) ) ( not ( = ?auto_237276 ?auto_237280 ) ) ( not ( = ?auto_237276 ?auto_237281 ) ) ( not ( = ?auto_237276 ?auto_237282 ) ) ( not ( = ?auto_237276 ?auto_237283 ) ) ( not ( = ?auto_237277 ?auto_237278 ) ) ( not ( = ?auto_237277 ?auto_237279 ) ) ( not ( = ?auto_237277 ?auto_237280 ) ) ( not ( = ?auto_237277 ?auto_237281 ) ) ( not ( = ?auto_237277 ?auto_237282 ) ) ( not ( = ?auto_237277 ?auto_237283 ) ) ( not ( = ?auto_237278 ?auto_237279 ) ) ( not ( = ?auto_237278 ?auto_237280 ) ) ( not ( = ?auto_237278 ?auto_237281 ) ) ( not ( = ?auto_237278 ?auto_237282 ) ) ( not ( = ?auto_237278 ?auto_237283 ) ) ( not ( = ?auto_237279 ?auto_237280 ) ) ( not ( = ?auto_237279 ?auto_237281 ) ) ( not ( = ?auto_237279 ?auto_237282 ) ) ( not ( = ?auto_237279 ?auto_237283 ) ) ( not ( = ?auto_237280 ?auto_237281 ) ) ( not ( = ?auto_237280 ?auto_237282 ) ) ( not ( = ?auto_237280 ?auto_237283 ) ) ( not ( = ?auto_237281 ?auto_237282 ) ) ( not ( = ?auto_237281 ?auto_237283 ) ) ( not ( = ?auto_237282 ?auto_237283 ) ) ( ON ?auto_237281 ?auto_237282 ) ( ON ?auto_237280 ?auto_237281 ) ( ON ?auto_237279 ?auto_237280 ) ( CLEAR ?auto_237277 ) ( ON ?auto_237278 ?auto_237279 ) ( CLEAR ?auto_237278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237276 ?auto_237277 ?auto_237278 )
      ( MAKE-7PILE ?auto_237276 ?auto_237277 ?auto_237278 ?auto_237279 ?auto_237280 ?auto_237281 ?auto_237282 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237291 - BLOCK
      ?auto_237292 - BLOCK
      ?auto_237293 - BLOCK
      ?auto_237294 - BLOCK
      ?auto_237295 - BLOCK
      ?auto_237296 - BLOCK
      ?auto_237297 - BLOCK
    )
    :vars
    (
      ?auto_237298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237297 ?auto_237298 ) ( ON-TABLE ?auto_237291 ) ( not ( = ?auto_237291 ?auto_237292 ) ) ( not ( = ?auto_237291 ?auto_237293 ) ) ( not ( = ?auto_237291 ?auto_237294 ) ) ( not ( = ?auto_237291 ?auto_237295 ) ) ( not ( = ?auto_237291 ?auto_237296 ) ) ( not ( = ?auto_237291 ?auto_237297 ) ) ( not ( = ?auto_237291 ?auto_237298 ) ) ( not ( = ?auto_237292 ?auto_237293 ) ) ( not ( = ?auto_237292 ?auto_237294 ) ) ( not ( = ?auto_237292 ?auto_237295 ) ) ( not ( = ?auto_237292 ?auto_237296 ) ) ( not ( = ?auto_237292 ?auto_237297 ) ) ( not ( = ?auto_237292 ?auto_237298 ) ) ( not ( = ?auto_237293 ?auto_237294 ) ) ( not ( = ?auto_237293 ?auto_237295 ) ) ( not ( = ?auto_237293 ?auto_237296 ) ) ( not ( = ?auto_237293 ?auto_237297 ) ) ( not ( = ?auto_237293 ?auto_237298 ) ) ( not ( = ?auto_237294 ?auto_237295 ) ) ( not ( = ?auto_237294 ?auto_237296 ) ) ( not ( = ?auto_237294 ?auto_237297 ) ) ( not ( = ?auto_237294 ?auto_237298 ) ) ( not ( = ?auto_237295 ?auto_237296 ) ) ( not ( = ?auto_237295 ?auto_237297 ) ) ( not ( = ?auto_237295 ?auto_237298 ) ) ( not ( = ?auto_237296 ?auto_237297 ) ) ( not ( = ?auto_237296 ?auto_237298 ) ) ( not ( = ?auto_237297 ?auto_237298 ) ) ( ON ?auto_237296 ?auto_237297 ) ( ON ?auto_237295 ?auto_237296 ) ( ON ?auto_237294 ?auto_237295 ) ( ON ?auto_237293 ?auto_237294 ) ( CLEAR ?auto_237291 ) ( ON ?auto_237292 ?auto_237293 ) ( CLEAR ?auto_237292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237291 ?auto_237292 )
      ( MAKE-7PILE ?auto_237291 ?auto_237292 ?auto_237293 ?auto_237294 ?auto_237295 ?auto_237296 ?auto_237297 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237306 - BLOCK
      ?auto_237307 - BLOCK
      ?auto_237308 - BLOCK
      ?auto_237309 - BLOCK
      ?auto_237310 - BLOCK
      ?auto_237311 - BLOCK
      ?auto_237312 - BLOCK
    )
    :vars
    (
      ?auto_237313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237312 ?auto_237313 ) ( ON-TABLE ?auto_237306 ) ( not ( = ?auto_237306 ?auto_237307 ) ) ( not ( = ?auto_237306 ?auto_237308 ) ) ( not ( = ?auto_237306 ?auto_237309 ) ) ( not ( = ?auto_237306 ?auto_237310 ) ) ( not ( = ?auto_237306 ?auto_237311 ) ) ( not ( = ?auto_237306 ?auto_237312 ) ) ( not ( = ?auto_237306 ?auto_237313 ) ) ( not ( = ?auto_237307 ?auto_237308 ) ) ( not ( = ?auto_237307 ?auto_237309 ) ) ( not ( = ?auto_237307 ?auto_237310 ) ) ( not ( = ?auto_237307 ?auto_237311 ) ) ( not ( = ?auto_237307 ?auto_237312 ) ) ( not ( = ?auto_237307 ?auto_237313 ) ) ( not ( = ?auto_237308 ?auto_237309 ) ) ( not ( = ?auto_237308 ?auto_237310 ) ) ( not ( = ?auto_237308 ?auto_237311 ) ) ( not ( = ?auto_237308 ?auto_237312 ) ) ( not ( = ?auto_237308 ?auto_237313 ) ) ( not ( = ?auto_237309 ?auto_237310 ) ) ( not ( = ?auto_237309 ?auto_237311 ) ) ( not ( = ?auto_237309 ?auto_237312 ) ) ( not ( = ?auto_237309 ?auto_237313 ) ) ( not ( = ?auto_237310 ?auto_237311 ) ) ( not ( = ?auto_237310 ?auto_237312 ) ) ( not ( = ?auto_237310 ?auto_237313 ) ) ( not ( = ?auto_237311 ?auto_237312 ) ) ( not ( = ?auto_237311 ?auto_237313 ) ) ( not ( = ?auto_237312 ?auto_237313 ) ) ( ON ?auto_237311 ?auto_237312 ) ( ON ?auto_237310 ?auto_237311 ) ( ON ?auto_237309 ?auto_237310 ) ( ON ?auto_237308 ?auto_237309 ) ( CLEAR ?auto_237306 ) ( ON ?auto_237307 ?auto_237308 ) ( CLEAR ?auto_237307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237306 ?auto_237307 )
      ( MAKE-7PILE ?auto_237306 ?auto_237307 ?auto_237308 ?auto_237309 ?auto_237310 ?auto_237311 ?auto_237312 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237321 - BLOCK
      ?auto_237322 - BLOCK
      ?auto_237323 - BLOCK
      ?auto_237324 - BLOCK
      ?auto_237325 - BLOCK
      ?auto_237326 - BLOCK
      ?auto_237327 - BLOCK
    )
    :vars
    (
      ?auto_237328 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237327 ?auto_237328 ) ( not ( = ?auto_237321 ?auto_237322 ) ) ( not ( = ?auto_237321 ?auto_237323 ) ) ( not ( = ?auto_237321 ?auto_237324 ) ) ( not ( = ?auto_237321 ?auto_237325 ) ) ( not ( = ?auto_237321 ?auto_237326 ) ) ( not ( = ?auto_237321 ?auto_237327 ) ) ( not ( = ?auto_237321 ?auto_237328 ) ) ( not ( = ?auto_237322 ?auto_237323 ) ) ( not ( = ?auto_237322 ?auto_237324 ) ) ( not ( = ?auto_237322 ?auto_237325 ) ) ( not ( = ?auto_237322 ?auto_237326 ) ) ( not ( = ?auto_237322 ?auto_237327 ) ) ( not ( = ?auto_237322 ?auto_237328 ) ) ( not ( = ?auto_237323 ?auto_237324 ) ) ( not ( = ?auto_237323 ?auto_237325 ) ) ( not ( = ?auto_237323 ?auto_237326 ) ) ( not ( = ?auto_237323 ?auto_237327 ) ) ( not ( = ?auto_237323 ?auto_237328 ) ) ( not ( = ?auto_237324 ?auto_237325 ) ) ( not ( = ?auto_237324 ?auto_237326 ) ) ( not ( = ?auto_237324 ?auto_237327 ) ) ( not ( = ?auto_237324 ?auto_237328 ) ) ( not ( = ?auto_237325 ?auto_237326 ) ) ( not ( = ?auto_237325 ?auto_237327 ) ) ( not ( = ?auto_237325 ?auto_237328 ) ) ( not ( = ?auto_237326 ?auto_237327 ) ) ( not ( = ?auto_237326 ?auto_237328 ) ) ( not ( = ?auto_237327 ?auto_237328 ) ) ( ON ?auto_237326 ?auto_237327 ) ( ON ?auto_237325 ?auto_237326 ) ( ON ?auto_237324 ?auto_237325 ) ( ON ?auto_237323 ?auto_237324 ) ( ON ?auto_237322 ?auto_237323 ) ( ON ?auto_237321 ?auto_237322 ) ( CLEAR ?auto_237321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237321 )
      ( MAKE-7PILE ?auto_237321 ?auto_237322 ?auto_237323 ?auto_237324 ?auto_237325 ?auto_237326 ?auto_237327 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_237336 - BLOCK
      ?auto_237337 - BLOCK
      ?auto_237338 - BLOCK
      ?auto_237339 - BLOCK
      ?auto_237340 - BLOCK
      ?auto_237341 - BLOCK
      ?auto_237342 - BLOCK
    )
    :vars
    (
      ?auto_237343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237342 ?auto_237343 ) ( not ( = ?auto_237336 ?auto_237337 ) ) ( not ( = ?auto_237336 ?auto_237338 ) ) ( not ( = ?auto_237336 ?auto_237339 ) ) ( not ( = ?auto_237336 ?auto_237340 ) ) ( not ( = ?auto_237336 ?auto_237341 ) ) ( not ( = ?auto_237336 ?auto_237342 ) ) ( not ( = ?auto_237336 ?auto_237343 ) ) ( not ( = ?auto_237337 ?auto_237338 ) ) ( not ( = ?auto_237337 ?auto_237339 ) ) ( not ( = ?auto_237337 ?auto_237340 ) ) ( not ( = ?auto_237337 ?auto_237341 ) ) ( not ( = ?auto_237337 ?auto_237342 ) ) ( not ( = ?auto_237337 ?auto_237343 ) ) ( not ( = ?auto_237338 ?auto_237339 ) ) ( not ( = ?auto_237338 ?auto_237340 ) ) ( not ( = ?auto_237338 ?auto_237341 ) ) ( not ( = ?auto_237338 ?auto_237342 ) ) ( not ( = ?auto_237338 ?auto_237343 ) ) ( not ( = ?auto_237339 ?auto_237340 ) ) ( not ( = ?auto_237339 ?auto_237341 ) ) ( not ( = ?auto_237339 ?auto_237342 ) ) ( not ( = ?auto_237339 ?auto_237343 ) ) ( not ( = ?auto_237340 ?auto_237341 ) ) ( not ( = ?auto_237340 ?auto_237342 ) ) ( not ( = ?auto_237340 ?auto_237343 ) ) ( not ( = ?auto_237341 ?auto_237342 ) ) ( not ( = ?auto_237341 ?auto_237343 ) ) ( not ( = ?auto_237342 ?auto_237343 ) ) ( ON ?auto_237341 ?auto_237342 ) ( ON ?auto_237340 ?auto_237341 ) ( ON ?auto_237339 ?auto_237340 ) ( ON ?auto_237338 ?auto_237339 ) ( ON ?auto_237337 ?auto_237338 ) ( ON ?auto_237336 ?auto_237337 ) ( CLEAR ?auto_237336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237336 )
      ( MAKE-7PILE ?auto_237336 ?auto_237337 ?auto_237338 ?auto_237339 ?auto_237340 ?auto_237341 ?auto_237342 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237352 - BLOCK
      ?auto_237353 - BLOCK
      ?auto_237354 - BLOCK
      ?auto_237355 - BLOCK
      ?auto_237356 - BLOCK
      ?auto_237357 - BLOCK
      ?auto_237358 - BLOCK
      ?auto_237359 - BLOCK
    )
    :vars
    (
      ?auto_237360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237358 ) ( ON ?auto_237359 ?auto_237360 ) ( CLEAR ?auto_237359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237352 ) ( ON ?auto_237353 ?auto_237352 ) ( ON ?auto_237354 ?auto_237353 ) ( ON ?auto_237355 ?auto_237354 ) ( ON ?auto_237356 ?auto_237355 ) ( ON ?auto_237357 ?auto_237356 ) ( ON ?auto_237358 ?auto_237357 ) ( not ( = ?auto_237352 ?auto_237353 ) ) ( not ( = ?auto_237352 ?auto_237354 ) ) ( not ( = ?auto_237352 ?auto_237355 ) ) ( not ( = ?auto_237352 ?auto_237356 ) ) ( not ( = ?auto_237352 ?auto_237357 ) ) ( not ( = ?auto_237352 ?auto_237358 ) ) ( not ( = ?auto_237352 ?auto_237359 ) ) ( not ( = ?auto_237352 ?auto_237360 ) ) ( not ( = ?auto_237353 ?auto_237354 ) ) ( not ( = ?auto_237353 ?auto_237355 ) ) ( not ( = ?auto_237353 ?auto_237356 ) ) ( not ( = ?auto_237353 ?auto_237357 ) ) ( not ( = ?auto_237353 ?auto_237358 ) ) ( not ( = ?auto_237353 ?auto_237359 ) ) ( not ( = ?auto_237353 ?auto_237360 ) ) ( not ( = ?auto_237354 ?auto_237355 ) ) ( not ( = ?auto_237354 ?auto_237356 ) ) ( not ( = ?auto_237354 ?auto_237357 ) ) ( not ( = ?auto_237354 ?auto_237358 ) ) ( not ( = ?auto_237354 ?auto_237359 ) ) ( not ( = ?auto_237354 ?auto_237360 ) ) ( not ( = ?auto_237355 ?auto_237356 ) ) ( not ( = ?auto_237355 ?auto_237357 ) ) ( not ( = ?auto_237355 ?auto_237358 ) ) ( not ( = ?auto_237355 ?auto_237359 ) ) ( not ( = ?auto_237355 ?auto_237360 ) ) ( not ( = ?auto_237356 ?auto_237357 ) ) ( not ( = ?auto_237356 ?auto_237358 ) ) ( not ( = ?auto_237356 ?auto_237359 ) ) ( not ( = ?auto_237356 ?auto_237360 ) ) ( not ( = ?auto_237357 ?auto_237358 ) ) ( not ( = ?auto_237357 ?auto_237359 ) ) ( not ( = ?auto_237357 ?auto_237360 ) ) ( not ( = ?auto_237358 ?auto_237359 ) ) ( not ( = ?auto_237358 ?auto_237360 ) ) ( not ( = ?auto_237359 ?auto_237360 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237359 ?auto_237360 )
      ( !STACK ?auto_237359 ?auto_237358 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237369 - BLOCK
      ?auto_237370 - BLOCK
      ?auto_237371 - BLOCK
      ?auto_237372 - BLOCK
      ?auto_237373 - BLOCK
      ?auto_237374 - BLOCK
      ?auto_237375 - BLOCK
      ?auto_237376 - BLOCK
    )
    :vars
    (
      ?auto_237377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237375 ) ( ON ?auto_237376 ?auto_237377 ) ( CLEAR ?auto_237376 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237369 ) ( ON ?auto_237370 ?auto_237369 ) ( ON ?auto_237371 ?auto_237370 ) ( ON ?auto_237372 ?auto_237371 ) ( ON ?auto_237373 ?auto_237372 ) ( ON ?auto_237374 ?auto_237373 ) ( ON ?auto_237375 ?auto_237374 ) ( not ( = ?auto_237369 ?auto_237370 ) ) ( not ( = ?auto_237369 ?auto_237371 ) ) ( not ( = ?auto_237369 ?auto_237372 ) ) ( not ( = ?auto_237369 ?auto_237373 ) ) ( not ( = ?auto_237369 ?auto_237374 ) ) ( not ( = ?auto_237369 ?auto_237375 ) ) ( not ( = ?auto_237369 ?auto_237376 ) ) ( not ( = ?auto_237369 ?auto_237377 ) ) ( not ( = ?auto_237370 ?auto_237371 ) ) ( not ( = ?auto_237370 ?auto_237372 ) ) ( not ( = ?auto_237370 ?auto_237373 ) ) ( not ( = ?auto_237370 ?auto_237374 ) ) ( not ( = ?auto_237370 ?auto_237375 ) ) ( not ( = ?auto_237370 ?auto_237376 ) ) ( not ( = ?auto_237370 ?auto_237377 ) ) ( not ( = ?auto_237371 ?auto_237372 ) ) ( not ( = ?auto_237371 ?auto_237373 ) ) ( not ( = ?auto_237371 ?auto_237374 ) ) ( not ( = ?auto_237371 ?auto_237375 ) ) ( not ( = ?auto_237371 ?auto_237376 ) ) ( not ( = ?auto_237371 ?auto_237377 ) ) ( not ( = ?auto_237372 ?auto_237373 ) ) ( not ( = ?auto_237372 ?auto_237374 ) ) ( not ( = ?auto_237372 ?auto_237375 ) ) ( not ( = ?auto_237372 ?auto_237376 ) ) ( not ( = ?auto_237372 ?auto_237377 ) ) ( not ( = ?auto_237373 ?auto_237374 ) ) ( not ( = ?auto_237373 ?auto_237375 ) ) ( not ( = ?auto_237373 ?auto_237376 ) ) ( not ( = ?auto_237373 ?auto_237377 ) ) ( not ( = ?auto_237374 ?auto_237375 ) ) ( not ( = ?auto_237374 ?auto_237376 ) ) ( not ( = ?auto_237374 ?auto_237377 ) ) ( not ( = ?auto_237375 ?auto_237376 ) ) ( not ( = ?auto_237375 ?auto_237377 ) ) ( not ( = ?auto_237376 ?auto_237377 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237376 ?auto_237377 )
      ( !STACK ?auto_237376 ?auto_237375 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237386 - BLOCK
      ?auto_237387 - BLOCK
      ?auto_237388 - BLOCK
      ?auto_237389 - BLOCK
      ?auto_237390 - BLOCK
      ?auto_237391 - BLOCK
      ?auto_237392 - BLOCK
      ?auto_237393 - BLOCK
    )
    :vars
    (
      ?auto_237394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237393 ?auto_237394 ) ( ON-TABLE ?auto_237386 ) ( ON ?auto_237387 ?auto_237386 ) ( ON ?auto_237388 ?auto_237387 ) ( ON ?auto_237389 ?auto_237388 ) ( ON ?auto_237390 ?auto_237389 ) ( ON ?auto_237391 ?auto_237390 ) ( not ( = ?auto_237386 ?auto_237387 ) ) ( not ( = ?auto_237386 ?auto_237388 ) ) ( not ( = ?auto_237386 ?auto_237389 ) ) ( not ( = ?auto_237386 ?auto_237390 ) ) ( not ( = ?auto_237386 ?auto_237391 ) ) ( not ( = ?auto_237386 ?auto_237392 ) ) ( not ( = ?auto_237386 ?auto_237393 ) ) ( not ( = ?auto_237386 ?auto_237394 ) ) ( not ( = ?auto_237387 ?auto_237388 ) ) ( not ( = ?auto_237387 ?auto_237389 ) ) ( not ( = ?auto_237387 ?auto_237390 ) ) ( not ( = ?auto_237387 ?auto_237391 ) ) ( not ( = ?auto_237387 ?auto_237392 ) ) ( not ( = ?auto_237387 ?auto_237393 ) ) ( not ( = ?auto_237387 ?auto_237394 ) ) ( not ( = ?auto_237388 ?auto_237389 ) ) ( not ( = ?auto_237388 ?auto_237390 ) ) ( not ( = ?auto_237388 ?auto_237391 ) ) ( not ( = ?auto_237388 ?auto_237392 ) ) ( not ( = ?auto_237388 ?auto_237393 ) ) ( not ( = ?auto_237388 ?auto_237394 ) ) ( not ( = ?auto_237389 ?auto_237390 ) ) ( not ( = ?auto_237389 ?auto_237391 ) ) ( not ( = ?auto_237389 ?auto_237392 ) ) ( not ( = ?auto_237389 ?auto_237393 ) ) ( not ( = ?auto_237389 ?auto_237394 ) ) ( not ( = ?auto_237390 ?auto_237391 ) ) ( not ( = ?auto_237390 ?auto_237392 ) ) ( not ( = ?auto_237390 ?auto_237393 ) ) ( not ( = ?auto_237390 ?auto_237394 ) ) ( not ( = ?auto_237391 ?auto_237392 ) ) ( not ( = ?auto_237391 ?auto_237393 ) ) ( not ( = ?auto_237391 ?auto_237394 ) ) ( not ( = ?auto_237392 ?auto_237393 ) ) ( not ( = ?auto_237392 ?auto_237394 ) ) ( not ( = ?auto_237393 ?auto_237394 ) ) ( CLEAR ?auto_237391 ) ( ON ?auto_237392 ?auto_237393 ) ( CLEAR ?auto_237392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_237386 ?auto_237387 ?auto_237388 ?auto_237389 ?auto_237390 ?auto_237391 ?auto_237392 )
      ( MAKE-8PILE ?auto_237386 ?auto_237387 ?auto_237388 ?auto_237389 ?auto_237390 ?auto_237391 ?auto_237392 ?auto_237393 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237403 - BLOCK
      ?auto_237404 - BLOCK
      ?auto_237405 - BLOCK
      ?auto_237406 - BLOCK
      ?auto_237407 - BLOCK
      ?auto_237408 - BLOCK
      ?auto_237409 - BLOCK
      ?auto_237410 - BLOCK
    )
    :vars
    (
      ?auto_237411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237410 ?auto_237411 ) ( ON-TABLE ?auto_237403 ) ( ON ?auto_237404 ?auto_237403 ) ( ON ?auto_237405 ?auto_237404 ) ( ON ?auto_237406 ?auto_237405 ) ( ON ?auto_237407 ?auto_237406 ) ( ON ?auto_237408 ?auto_237407 ) ( not ( = ?auto_237403 ?auto_237404 ) ) ( not ( = ?auto_237403 ?auto_237405 ) ) ( not ( = ?auto_237403 ?auto_237406 ) ) ( not ( = ?auto_237403 ?auto_237407 ) ) ( not ( = ?auto_237403 ?auto_237408 ) ) ( not ( = ?auto_237403 ?auto_237409 ) ) ( not ( = ?auto_237403 ?auto_237410 ) ) ( not ( = ?auto_237403 ?auto_237411 ) ) ( not ( = ?auto_237404 ?auto_237405 ) ) ( not ( = ?auto_237404 ?auto_237406 ) ) ( not ( = ?auto_237404 ?auto_237407 ) ) ( not ( = ?auto_237404 ?auto_237408 ) ) ( not ( = ?auto_237404 ?auto_237409 ) ) ( not ( = ?auto_237404 ?auto_237410 ) ) ( not ( = ?auto_237404 ?auto_237411 ) ) ( not ( = ?auto_237405 ?auto_237406 ) ) ( not ( = ?auto_237405 ?auto_237407 ) ) ( not ( = ?auto_237405 ?auto_237408 ) ) ( not ( = ?auto_237405 ?auto_237409 ) ) ( not ( = ?auto_237405 ?auto_237410 ) ) ( not ( = ?auto_237405 ?auto_237411 ) ) ( not ( = ?auto_237406 ?auto_237407 ) ) ( not ( = ?auto_237406 ?auto_237408 ) ) ( not ( = ?auto_237406 ?auto_237409 ) ) ( not ( = ?auto_237406 ?auto_237410 ) ) ( not ( = ?auto_237406 ?auto_237411 ) ) ( not ( = ?auto_237407 ?auto_237408 ) ) ( not ( = ?auto_237407 ?auto_237409 ) ) ( not ( = ?auto_237407 ?auto_237410 ) ) ( not ( = ?auto_237407 ?auto_237411 ) ) ( not ( = ?auto_237408 ?auto_237409 ) ) ( not ( = ?auto_237408 ?auto_237410 ) ) ( not ( = ?auto_237408 ?auto_237411 ) ) ( not ( = ?auto_237409 ?auto_237410 ) ) ( not ( = ?auto_237409 ?auto_237411 ) ) ( not ( = ?auto_237410 ?auto_237411 ) ) ( CLEAR ?auto_237408 ) ( ON ?auto_237409 ?auto_237410 ) ( CLEAR ?auto_237409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_237403 ?auto_237404 ?auto_237405 ?auto_237406 ?auto_237407 ?auto_237408 ?auto_237409 )
      ( MAKE-8PILE ?auto_237403 ?auto_237404 ?auto_237405 ?auto_237406 ?auto_237407 ?auto_237408 ?auto_237409 ?auto_237410 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237420 - BLOCK
      ?auto_237421 - BLOCK
      ?auto_237422 - BLOCK
      ?auto_237423 - BLOCK
      ?auto_237424 - BLOCK
      ?auto_237425 - BLOCK
      ?auto_237426 - BLOCK
      ?auto_237427 - BLOCK
    )
    :vars
    (
      ?auto_237428 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237427 ?auto_237428 ) ( ON-TABLE ?auto_237420 ) ( ON ?auto_237421 ?auto_237420 ) ( ON ?auto_237422 ?auto_237421 ) ( ON ?auto_237423 ?auto_237422 ) ( ON ?auto_237424 ?auto_237423 ) ( not ( = ?auto_237420 ?auto_237421 ) ) ( not ( = ?auto_237420 ?auto_237422 ) ) ( not ( = ?auto_237420 ?auto_237423 ) ) ( not ( = ?auto_237420 ?auto_237424 ) ) ( not ( = ?auto_237420 ?auto_237425 ) ) ( not ( = ?auto_237420 ?auto_237426 ) ) ( not ( = ?auto_237420 ?auto_237427 ) ) ( not ( = ?auto_237420 ?auto_237428 ) ) ( not ( = ?auto_237421 ?auto_237422 ) ) ( not ( = ?auto_237421 ?auto_237423 ) ) ( not ( = ?auto_237421 ?auto_237424 ) ) ( not ( = ?auto_237421 ?auto_237425 ) ) ( not ( = ?auto_237421 ?auto_237426 ) ) ( not ( = ?auto_237421 ?auto_237427 ) ) ( not ( = ?auto_237421 ?auto_237428 ) ) ( not ( = ?auto_237422 ?auto_237423 ) ) ( not ( = ?auto_237422 ?auto_237424 ) ) ( not ( = ?auto_237422 ?auto_237425 ) ) ( not ( = ?auto_237422 ?auto_237426 ) ) ( not ( = ?auto_237422 ?auto_237427 ) ) ( not ( = ?auto_237422 ?auto_237428 ) ) ( not ( = ?auto_237423 ?auto_237424 ) ) ( not ( = ?auto_237423 ?auto_237425 ) ) ( not ( = ?auto_237423 ?auto_237426 ) ) ( not ( = ?auto_237423 ?auto_237427 ) ) ( not ( = ?auto_237423 ?auto_237428 ) ) ( not ( = ?auto_237424 ?auto_237425 ) ) ( not ( = ?auto_237424 ?auto_237426 ) ) ( not ( = ?auto_237424 ?auto_237427 ) ) ( not ( = ?auto_237424 ?auto_237428 ) ) ( not ( = ?auto_237425 ?auto_237426 ) ) ( not ( = ?auto_237425 ?auto_237427 ) ) ( not ( = ?auto_237425 ?auto_237428 ) ) ( not ( = ?auto_237426 ?auto_237427 ) ) ( not ( = ?auto_237426 ?auto_237428 ) ) ( not ( = ?auto_237427 ?auto_237428 ) ) ( ON ?auto_237426 ?auto_237427 ) ( CLEAR ?auto_237424 ) ( ON ?auto_237425 ?auto_237426 ) ( CLEAR ?auto_237425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237420 ?auto_237421 ?auto_237422 ?auto_237423 ?auto_237424 ?auto_237425 )
      ( MAKE-8PILE ?auto_237420 ?auto_237421 ?auto_237422 ?auto_237423 ?auto_237424 ?auto_237425 ?auto_237426 ?auto_237427 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237437 - BLOCK
      ?auto_237438 - BLOCK
      ?auto_237439 - BLOCK
      ?auto_237440 - BLOCK
      ?auto_237441 - BLOCK
      ?auto_237442 - BLOCK
      ?auto_237443 - BLOCK
      ?auto_237444 - BLOCK
    )
    :vars
    (
      ?auto_237445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237444 ?auto_237445 ) ( ON-TABLE ?auto_237437 ) ( ON ?auto_237438 ?auto_237437 ) ( ON ?auto_237439 ?auto_237438 ) ( ON ?auto_237440 ?auto_237439 ) ( ON ?auto_237441 ?auto_237440 ) ( not ( = ?auto_237437 ?auto_237438 ) ) ( not ( = ?auto_237437 ?auto_237439 ) ) ( not ( = ?auto_237437 ?auto_237440 ) ) ( not ( = ?auto_237437 ?auto_237441 ) ) ( not ( = ?auto_237437 ?auto_237442 ) ) ( not ( = ?auto_237437 ?auto_237443 ) ) ( not ( = ?auto_237437 ?auto_237444 ) ) ( not ( = ?auto_237437 ?auto_237445 ) ) ( not ( = ?auto_237438 ?auto_237439 ) ) ( not ( = ?auto_237438 ?auto_237440 ) ) ( not ( = ?auto_237438 ?auto_237441 ) ) ( not ( = ?auto_237438 ?auto_237442 ) ) ( not ( = ?auto_237438 ?auto_237443 ) ) ( not ( = ?auto_237438 ?auto_237444 ) ) ( not ( = ?auto_237438 ?auto_237445 ) ) ( not ( = ?auto_237439 ?auto_237440 ) ) ( not ( = ?auto_237439 ?auto_237441 ) ) ( not ( = ?auto_237439 ?auto_237442 ) ) ( not ( = ?auto_237439 ?auto_237443 ) ) ( not ( = ?auto_237439 ?auto_237444 ) ) ( not ( = ?auto_237439 ?auto_237445 ) ) ( not ( = ?auto_237440 ?auto_237441 ) ) ( not ( = ?auto_237440 ?auto_237442 ) ) ( not ( = ?auto_237440 ?auto_237443 ) ) ( not ( = ?auto_237440 ?auto_237444 ) ) ( not ( = ?auto_237440 ?auto_237445 ) ) ( not ( = ?auto_237441 ?auto_237442 ) ) ( not ( = ?auto_237441 ?auto_237443 ) ) ( not ( = ?auto_237441 ?auto_237444 ) ) ( not ( = ?auto_237441 ?auto_237445 ) ) ( not ( = ?auto_237442 ?auto_237443 ) ) ( not ( = ?auto_237442 ?auto_237444 ) ) ( not ( = ?auto_237442 ?auto_237445 ) ) ( not ( = ?auto_237443 ?auto_237444 ) ) ( not ( = ?auto_237443 ?auto_237445 ) ) ( not ( = ?auto_237444 ?auto_237445 ) ) ( ON ?auto_237443 ?auto_237444 ) ( CLEAR ?auto_237441 ) ( ON ?auto_237442 ?auto_237443 ) ( CLEAR ?auto_237442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237437 ?auto_237438 ?auto_237439 ?auto_237440 ?auto_237441 ?auto_237442 )
      ( MAKE-8PILE ?auto_237437 ?auto_237438 ?auto_237439 ?auto_237440 ?auto_237441 ?auto_237442 ?auto_237443 ?auto_237444 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237454 - BLOCK
      ?auto_237455 - BLOCK
      ?auto_237456 - BLOCK
      ?auto_237457 - BLOCK
      ?auto_237458 - BLOCK
      ?auto_237459 - BLOCK
      ?auto_237460 - BLOCK
      ?auto_237461 - BLOCK
    )
    :vars
    (
      ?auto_237462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237461 ?auto_237462 ) ( ON-TABLE ?auto_237454 ) ( ON ?auto_237455 ?auto_237454 ) ( ON ?auto_237456 ?auto_237455 ) ( ON ?auto_237457 ?auto_237456 ) ( not ( = ?auto_237454 ?auto_237455 ) ) ( not ( = ?auto_237454 ?auto_237456 ) ) ( not ( = ?auto_237454 ?auto_237457 ) ) ( not ( = ?auto_237454 ?auto_237458 ) ) ( not ( = ?auto_237454 ?auto_237459 ) ) ( not ( = ?auto_237454 ?auto_237460 ) ) ( not ( = ?auto_237454 ?auto_237461 ) ) ( not ( = ?auto_237454 ?auto_237462 ) ) ( not ( = ?auto_237455 ?auto_237456 ) ) ( not ( = ?auto_237455 ?auto_237457 ) ) ( not ( = ?auto_237455 ?auto_237458 ) ) ( not ( = ?auto_237455 ?auto_237459 ) ) ( not ( = ?auto_237455 ?auto_237460 ) ) ( not ( = ?auto_237455 ?auto_237461 ) ) ( not ( = ?auto_237455 ?auto_237462 ) ) ( not ( = ?auto_237456 ?auto_237457 ) ) ( not ( = ?auto_237456 ?auto_237458 ) ) ( not ( = ?auto_237456 ?auto_237459 ) ) ( not ( = ?auto_237456 ?auto_237460 ) ) ( not ( = ?auto_237456 ?auto_237461 ) ) ( not ( = ?auto_237456 ?auto_237462 ) ) ( not ( = ?auto_237457 ?auto_237458 ) ) ( not ( = ?auto_237457 ?auto_237459 ) ) ( not ( = ?auto_237457 ?auto_237460 ) ) ( not ( = ?auto_237457 ?auto_237461 ) ) ( not ( = ?auto_237457 ?auto_237462 ) ) ( not ( = ?auto_237458 ?auto_237459 ) ) ( not ( = ?auto_237458 ?auto_237460 ) ) ( not ( = ?auto_237458 ?auto_237461 ) ) ( not ( = ?auto_237458 ?auto_237462 ) ) ( not ( = ?auto_237459 ?auto_237460 ) ) ( not ( = ?auto_237459 ?auto_237461 ) ) ( not ( = ?auto_237459 ?auto_237462 ) ) ( not ( = ?auto_237460 ?auto_237461 ) ) ( not ( = ?auto_237460 ?auto_237462 ) ) ( not ( = ?auto_237461 ?auto_237462 ) ) ( ON ?auto_237460 ?auto_237461 ) ( ON ?auto_237459 ?auto_237460 ) ( CLEAR ?auto_237457 ) ( ON ?auto_237458 ?auto_237459 ) ( CLEAR ?auto_237458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237454 ?auto_237455 ?auto_237456 ?auto_237457 ?auto_237458 )
      ( MAKE-8PILE ?auto_237454 ?auto_237455 ?auto_237456 ?auto_237457 ?auto_237458 ?auto_237459 ?auto_237460 ?auto_237461 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237471 - BLOCK
      ?auto_237472 - BLOCK
      ?auto_237473 - BLOCK
      ?auto_237474 - BLOCK
      ?auto_237475 - BLOCK
      ?auto_237476 - BLOCK
      ?auto_237477 - BLOCK
      ?auto_237478 - BLOCK
    )
    :vars
    (
      ?auto_237479 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237478 ?auto_237479 ) ( ON-TABLE ?auto_237471 ) ( ON ?auto_237472 ?auto_237471 ) ( ON ?auto_237473 ?auto_237472 ) ( ON ?auto_237474 ?auto_237473 ) ( not ( = ?auto_237471 ?auto_237472 ) ) ( not ( = ?auto_237471 ?auto_237473 ) ) ( not ( = ?auto_237471 ?auto_237474 ) ) ( not ( = ?auto_237471 ?auto_237475 ) ) ( not ( = ?auto_237471 ?auto_237476 ) ) ( not ( = ?auto_237471 ?auto_237477 ) ) ( not ( = ?auto_237471 ?auto_237478 ) ) ( not ( = ?auto_237471 ?auto_237479 ) ) ( not ( = ?auto_237472 ?auto_237473 ) ) ( not ( = ?auto_237472 ?auto_237474 ) ) ( not ( = ?auto_237472 ?auto_237475 ) ) ( not ( = ?auto_237472 ?auto_237476 ) ) ( not ( = ?auto_237472 ?auto_237477 ) ) ( not ( = ?auto_237472 ?auto_237478 ) ) ( not ( = ?auto_237472 ?auto_237479 ) ) ( not ( = ?auto_237473 ?auto_237474 ) ) ( not ( = ?auto_237473 ?auto_237475 ) ) ( not ( = ?auto_237473 ?auto_237476 ) ) ( not ( = ?auto_237473 ?auto_237477 ) ) ( not ( = ?auto_237473 ?auto_237478 ) ) ( not ( = ?auto_237473 ?auto_237479 ) ) ( not ( = ?auto_237474 ?auto_237475 ) ) ( not ( = ?auto_237474 ?auto_237476 ) ) ( not ( = ?auto_237474 ?auto_237477 ) ) ( not ( = ?auto_237474 ?auto_237478 ) ) ( not ( = ?auto_237474 ?auto_237479 ) ) ( not ( = ?auto_237475 ?auto_237476 ) ) ( not ( = ?auto_237475 ?auto_237477 ) ) ( not ( = ?auto_237475 ?auto_237478 ) ) ( not ( = ?auto_237475 ?auto_237479 ) ) ( not ( = ?auto_237476 ?auto_237477 ) ) ( not ( = ?auto_237476 ?auto_237478 ) ) ( not ( = ?auto_237476 ?auto_237479 ) ) ( not ( = ?auto_237477 ?auto_237478 ) ) ( not ( = ?auto_237477 ?auto_237479 ) ) ( not ( = ?auto_237478 ?auto_237479 ) ) ( ON ?auto_237477 ?auto_237478 ) ( ON ?auto_237476 ?auto_237477 ) ( CLEAR ?auto_237474 ) ( ON ?auto_237475 ?auto_237476 ) ( CLEAR ?auto_237475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237471 ?auto_237472 ?auto_237473 ?auto_237474 ?auto_237475 )
      ( MAKE-8PILE ?auto_237471 ?auto_237472 ?auto_237473 ?auto_237474 ?auto_237475 ?auto_237476 ?auto_237477 ?auto_237478 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237488 - BLOCK
      ?auto_237489 - BLOCK
      ?auto_237490 - BLOCK
      ?auto_237491 - BLOCK
      ?auto_237492 - BLOCK
      ?auto_237493 - BLOCK
      ?auto_237494 - BLOCK
      ?auto_237495 - BLOCK
    )
    :vars
    (
      ?auto_237496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237495 ?auto_237496 ) ( ON-TABLE ?auto_237488 ) ( ON ?auto_237489 ?auto_237488 ) ( ON ?auto_237490 ?auto_237489 ) ( not ( = ?auto_237488 ?auto_237489 ) ) ( not ( = ?auto_237488 ?auto_237490 ) ) ( not ( = ?auto_237488 ?auto_237491 ) ) ( not ( = ?auto_237488 ?auto_237492 ) ) ( not ( = ?auto_237488 ?auto_237493 ) ) ( not ( = ?auto_237488 ?auto_237494 ) ) ( not ( = ?auto_237488 ?auto_237495 ) ) ( not ( = ?auto_237488 ?auto_237496 ) ) ( not ( = ?auto_237489 ?auto_237490 ) ) ( not ( = ?auto_237489 ?auto_237491 ) ) ( not ( = ?auto_237489 ?auto_237492 ) ) ( not ( = ?auto_237489 ?auto_237493 ) ) ( not ( = ?auto_237489 ?auto_237494 ) ) ( not ( = ?auto_237489 ?auto_237495 ) ) ( not ( = ?auto_237489 ?auto_237496 ) ) ( not ( = ?auto_237490 ?auto_237491 ) ) ( not ( = ?auto_237490 ?auto_237492 ) ) ( not ( = ?auto_237490 ?auto_237493 ) ) ( not ( = ?auto_237490 ?auto_237494 ) ) ( not ( = ?auto_237490 ?auto_237495 ) ) ( not ( = ?auto_237490 ?auto_237496 ) ) ( not ( = ?auto_237491 ?auto_237492 ) ) ( not ( = ?auto_237491 ?auto_237493 ) ) ( not ( = ?auto_237491 ?auto_237494 ) ) ( not ( = ?auto_237491 ?auto_237495 ) ) ( not ( = ?auto_237491 ?auto_237496 ) ) ( not ( = ?auto_237492 ?auto_237493 ) ) ( not ( = ?auto_237492 ?auto_237494 ) ) ( not ( = ?auto_237492 ?auto_237495 ) ) ( not ( = ?auto_237492 ?auto_237496 ) ) ( not ( = ?auto_237493 ?auto_237494 ) ) ( not ( = ?auto_237493 ?auto_237495 ) ) ( not ( = ?auto_237493 ?auto_237496 ) ) ( not ( = ?auto_237494 ?auto_237495 ) ) ( not ( = ?auto_237494 ?auto_237496 ) ) ( not ( = ?auto_237495 ?auto_237496 ) ) ( ON ?auto_237494 ?auto_237495 ) ( ON ?auto_237493 ?auto_237494 ) ( ON ?auto_237492 ?auto_237493 ) ( CLEAR ?auto_237490 ) ( ON ?auto_237491 ?auto_237492 ) ( CLEAR ?auto_237491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237488 ?auto_237489 ?auto_237490 ?auto_237491 )
      ( MAKE-8PILE ?auto_237488 ?auto_237489 ?auto_237490 ?auto_237491 ?auto_237492 ?auto_237493 ?auto_237494 ?auto_237495 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237505 - BLOCK
      ?auto_237506 - BLOCK
      ?auto_237507 - BLOCK
      ?auto_237508 - BLOCK
      ?auto_237509 - BLOCK
      ?auto_237510 - BLOCK
      ?auto_237511 - BLOCK
      ?auto_237512 - BLOCK
    )
    :vars
    (
      ?auto_237513 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237512 ?auto_237513 ) ( ON-TABLE ?auto_237505 ) ( ON ?auto_237506 ?auto_237505 ) ( ON ?auto_237507 ?auto_237506 ) ( not ( = ?auto_237505 ?auto_237506 ) ) ( not ( = ?auto_237505 ?auto_237507 ) ) ( not ( = ?auto_237505 ?auto_237508 ) ) ( not ( = ?auto_237505 ?auto_237509 ) ) ( not ( = ?auto_237505 ?auto_237510 ) ) ( not ( = ?auto_237505 ?auto_237511 ) ) ( not ( = ?auto_237505 ?auto_237512 ) ) ( not ( = ?auto_237505 ?auto_237513 ) ) ( not ( = ?auto_237506 ?auto_237507 ) ) ( not ( = ?auto_237506 ?auto_237508 ) ) ( not ( = ?auto_237506 ?auto_237509 ) ) ( not ( = ?auto_237506 ?auto_237510 ) ) ( not ( = ?auto_237506 ?auto_237511 ) ) ( not ( = ?auto_237506 ?auto_237512 ) ) ( not ( = ?auto_237506 ?auto_237513 ) ) ( not ( = ?auto_237507 ?auto_237508 ) ) ( not ( = ?auto_237507 ?auto_237509 ) ) ( not ( = ?auto_237507 ?auto_237510 ) ) ( not ( = ?auto_237507 ?auto_237511 ) ) ( not ( = ?auto_237507 ?auto_237512 ) ) ( not ( = ?auto_237507 ?auto_237513 ) ) ( not ( = ?auto_237508 ?auto_237509 ) ) ( not ( = ?auto_237508 ?auto_237510 ) ) ( not ( = ?auto_237508 ?auto_237511 ) ) ( not ( = ?auto_237508 ?auto_237512 ) ) ( not ( = ?auto_237508 ?auto_237513 ) ) ( not ( = ?auto_237509 ?auto_237510 ) ) ( not ( = ?auto_237509 ?auto_237511 ) ) ( not ( = ?auto_237509 ?auto_237512 ) ) ( not ( = ?auto_237509 ?auto_237513 ) ) ( not ( = ?auto_237510 ?auto_237511 ) ) ( not ( = ?auto_237510 ?auto_237512 ) ) ( not ( = ?auto_237510 ?auto_237513 ) ) ( not ( = ?auto_237511 ?auto_237512 ) ) ( not ( = ?auto_237511 ?auto_237513 ) ) ( not ( = ?auto_237512 ?auto_237513 ) ) ( ON ?auto_237511 ?auto_237512 ) ( ON ?auto_237510 ?auto_237511 ) ( ON ?auto_237509 ?auto_237510 ) ( CLEAR ?auto_237507 ) ( ON ?auto_237508 ?auto_237509 ) ( CLEAR ?auto_237508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237505 ?auto_237506 ?auto_237507 ?auto_237508 )
      ( MAKE-8PILE ?auto_237505 ?auto_237506 ?auto_237507 ?auto_237508 ?auto_237509 ?auto_237510 ?auto_237511 ?auto_237512 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237522 - BLOCK
      ?auto_237523 - BLOCK
      ?auto_237524 - BLOCK
      ?auto_237525 - BLOCK
      ?auto_237526 - BLOCK
      ?auto_237527 - BLOCK
      ?auto_237528 - BLOCK
      ?auto_237529 - BLOCK
    )
    :vars
    (
      ?auto_237530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237529 ?auto_237530 ) ( ON-TABLE ?auto_237522 ) ( ON ?auto_237523 ?auto_237522 ) ( not ( = ?auto_237522 ?auto_237523 ) ) ( not ( = ?auto_237522 ?auto_237524 ) ) ( not ( = ?auto_237522 ?auto_237525 ) ) ( not ( = ?auto_237522 ?auto_237526 ) ) ( not ( = ?auto_237522 ?auto_237527 ) ) ( not ( = ?auto_237522 ?auto_237528 ) ) ( not ( = ?auto_237522 ?auto_237529 ) ) ( not ( = ?auto_237522 ?auto_237530 ) ) ( not ( = ?auto_237523 ?auto_237524 ) ) ( not ( = ?auto_237523 ?auto_237525 ) ) ( not ( = ?auto_237523 ?auto_237526 ) ) ( not ( = ?auto_237523 ?auto_237527 ) ) ( not ( = ?auto_237523 ?auto_237528 ) ) ( not ( = ?auto_237523 ?auto_237529 ) ) ( not ( = ?auto_237523 ?auto_237530 ) ) ( not ( = ?auto_237524 ?auto_237525 ) ) ( not ( = ?auto_237524 ?auto_237526 ) ) ( not ( = ?auto_237524 ?auto_237527 ) ) ( not ( = ?auto_237524 ?auto_237528 ) ) ( not ( = ?auto_237524 ?auto_237529 ) ) ( not ( = ?auto_237524 ?auto_237530 ) ) ( not ( = ?auto_237525 ?auto_237526 ) ) ( not ( = ?auto_237525 ?auto_237527 ) ) ( not ( = ?auto_237525 ?auto_237528 ) ) ( not ( = ?auto_237525 ?auto_237529 ) ) ( not ( = ?auto_237525 ?auto_237530 ) ) ( not ( = ?auto_237526 ?auto_237527 ) ) ( not ( = ?auto_237526 ?auto_237528 ) ) ( not ( = ?auto_237526 ?auto_237529 ) ) ( not ( = ?auto_237526 ?auto_237530 ) ) ( not ( = ?auto_237527 ?auto_237528 ) ) ( not ( = ?auto_237527 ?auto_237529 ) ) ( not ( = ?auto_237527 ?auto_237530 ) ) ( not ( = ?auto_237528 ?auto_237529 ) ) ( not ( = ?auto_237528 ?auto_237530 ) ) ( not ( = ?auto_237529 ?auto_237530 ) ) ( ON ?auto_237528 ?auto_237529 ) ( ON ?auto_237527 ?auto_237528 ) ( ON ?auto_237526 ?auto_237527 ) ( ON ?auto_237525 ?auto_237526 ) ( CLEAR ?auto_237523 ) ( ON ?auto_237524 ?auto_237525 ) ( CLEAR ?auto_237524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237522 ?auto_237523 ?auto_237524 )
      ( MAKE-8PILE ?auto_237522 ?auto_237523 ?auto_237524 ?auto_237525 ?auto_237526 ?auto_237527 ?auto_237528 ?auto_237529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237539 - BLOCK
      ?auto_237540 - BLOCK
      ?auto_237541 - BLOCK
      ?auto_237542 - BLOCK
      ?auto_237543 - BLOCK
      ?auto_237544 - BLOCK
      ?auto_237545 - BLOCK
      ?auto_237546 - BLOCK
    )
    :vars
    (
      ?auto_237547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237546 ?auto_237547 ) ( ON-TABLE ?auto_237539 ) ( ON ?auto_237540 ?auto_237539 ) ( not ( = ?auto_237539 ?auto_237540 ) ) ( not ( = ?auto_237539 ?auto_237541 ) ) ( not ( = ?auto_237539 ?auto_237542 ) ) ( not ( = ?auto_237539 ?auto_237543 ) ) ( not ( = ?auto_237539 ?auto_237544 ) ) ( not ( = ?auto_237539 ?auto_237545 ) ) ( not ( = ?auto_237539 ?auto_237546 ) ) ( not ( = ?auto_237539 ?auto_237547 ) ) ( not ( = ?auto_237540 ?auto_237541 ) ) ( not ( = ?auto_237540 ?auto_237542 ) ) ( not ( = ?auto_237540 ?auto_237543 ) ) ( not ( = ?auto_237540 ?auto_237544 ) ) ( not ( = ?auto_237540 ?auto_237545 ) ) ( not ( = ?auto_237540 ?auto_237546 ) ) ( not ( = ?auto_237540 ?auto_237547 ) ) ( not ( = ?auto_237541 ?auto_237542 ) ) ( not ( = ?auto_237541 ?auto_237543 ) ) ( not ( = ?auto_237541 ?auto_237544 ) ) ( not ( = ?auto_237541 ?auto_237545 ) ) ( not ( = ?auto_237541 ?auto_237546 ) ) ( not ( = ?auto_237541 ?auto_237547 ) ) ( not ( = ?auto_237542 ?auto_237543 ) ) ( not ( = ?auto_237542 ?auto_237544 ) ) ( not ( = ?auto_237542 ?auto_237545 ) ) ( not ( = ?auto_237542 ?auto_237546 ) ) ( not ( = ?auto_237542 ?auto_237547 ) ) ( not ( = ?auto_237543 ?auto_237544 ) ) ( not ( = ?auto_237543 ?auto_237545 ) ) ( not ( = ?auto_237543 ?auto_237546 ) ) ( not ( = ?auto_237543 ?auto_237547 ) ) ( not ( = ?auto_237544 ?auto_237545 ) ) ( not ( = ?auto_237544 ?auto_237546 ) ) ( not ( = ?auto_237544 ?auto_237547 ) ) ( not ( = ?auto_237545 ?auto_237546 ) ) ( not ( = ?auto_237545 ?auto_237547 ) ) ( not ( = ?auto_237546 ?auto_237547 ) ) ( ON ?auto_237545 ?auto_237546 ) ( ON ?auto_237544 ?auto_237545 ) ( ON ?auto_237543 ?auto_237544 ) ( ON ?auto_237542 ?auto_237543 ) ( CLEAR ?auto_237540 ) ( ON ?auto_237541 ?auto_237542 ) ( CLEAR ?auto_237541 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237539 ?auto_237540 ?auto_237541 )
      ( MAKE-8PILE ?auto_237539 ?auto_237540 ?auto_237541 ?auto_237542 ?auto_237543 ?auto_237544 ?auto_237545 ?auto_237546 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237556 - BLOCK
      ?auto_237557 - BLOCK
      ?auto_237558 - BLOCK
      ?auto_237559 - BLOCK
      ?auto_237560 - BLOCK
      ?auto_237561 - BLOCK
      ?auto_237562 - BLOCK
      ?auto_237563 - BLOCK
    )
    :vars
    (
      ?auto_237564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237563 ?auto_237564 ) ( ON-TABLE ?auto_237556 ) ( not ( = ?auto_237556 ?auto_237557 ) ) ( not ( = ?auto_237556 ?auto_237558 ) ) ( not ( = ?auto_237556 ?auto_237559 ) ) ( not ( = ?auto_237556 ?auto_237560 ) ) ( not ( = ?auto_237556 ?auto_237561 ) ) ( not ( = ?auto_237556 ?auto_237562 ) ) ( not ( = ?auto_237556 ?auto_237563 ) ) ( not ( = ?auto_237556 ?auto_237564 ) ) ( not ( = ?auto_237557 ?auto_237558 ) ) ( not ( = ?auto_237557 ?auto_237559 ) ) ( not ( = ?auto_237557 ?auto_237560 ) ) ( not ( = ?auto_237557 ?auto_237561 ) ) ( not ( = ?auto_237557 ?auto_237562 ) ) ( not ( = ?auto_237557 ?auto_237563 ) ) ( not ( = ?auto_237557 ?auto_237564 ) ) ( not ( = ?auto_237558 ?auto_237559 ) ) ( not ( = ?auto_237558 ?auto_237560 ) ) ( not ( = ?auto_237558 ?auto_237561 ) ) ( not ( = ?auto_237558 ?auto_237562 ) ) ( not ( = ?auto_237558 ?auto_237563 ) ) ( not ( = ?auto_237558 ?auto_237564 ) ) ( not ( = ?auto_237559 ?auto_237560 ) ) ( not ( = ?auto_237559 ?auto_237561 ) ) ( not ( = ?auto_237559 ?auto_237562 ) ) ( not ( = ?auto_237559 ?auto_237563 ) ) ( not ( = ?auto_237559 ?auto_237564 ) ) ( not ( = ?auto_237560 ?auto_237561 ) ) ( not ( = ?auto_237560 ?auto_237562 ) ) ( not ( = ?auto_237560 ?auto_237563 ) ) ( not ( = ?auto_237560 ?auto_237564 ) ) ( not ( = ?auto_237561 ?auto_237562 ) ) ( not ( = ?auto_237561 ?auto_237563 ) ) ( not ( = ?auto_237561 ?auto_237564 ) ) ( not ( = ?auto_237562 ?auto_237563 ) ) ( not ( = ?auto_237562 ?auto_237564 ) ) ( not ( = ?auto_237563 ?auto_237564 ) ) ( ON ?auto_237562 ?auto_237563 ) ( ON ?auto_237561 ?auto_237562 ) ( ON ?auto_237560 ?auto_237561 ) ( ON ?auto_237559 ?auto_237560 ) ( ON ?auto_237558 ?auto_237559 ) ( CLEAR ?auto_237556 ) ( ON ?auto_237557 ?auto_237558 ) ( CLEAR ?auto_237557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237556 ?auto_237557 )
      ( MAKE-8PILE ?auto_237556 ?auto_237557 ?auto_237558 ?auto_237559 ?auto_237560 ?auto_237561 ?auto_237562 ?auto_237563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237573 - BLOCK
      ?auto_237574 - BLOCK
      ?auto_237575 - BLOCK
      ?auto_237576 - BLOCK
      ?auto_237577 - BLOCK
      ?auto_237578 - BLOCK
      ?auto_237579 - BLOCK
      ?auto_237580 - BLOCK
    )
    :vars
    (
      ?auto_237581 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237580 ?auto_237581 ) ( ON-TABLE ?auto_237573 ) ( not ( = ?auto_237573 ?auto_237574 ) ) ( not ( = ?auto_237573 ?auto_237575 ) ) ( not ( = ?auto_237573 ?auto_237576 ) ) ( not ( = ?auto_237573 ?auto_237577 ) ) ( not ( = ?auto_237573 ?auto_237578 ) ) ( not ( = ?auto_237573 ?auto_237579 ) ) ( not ( = ?auto_237573 ?auto_237580 ) ) ( not ( = ?auto_237573 ?auto_237581 ) ) ( not ( = ?auto_237574 ?auto_237575 ) ) ( not ( = ?auto_237574 ?auto_237576 ) ) ( not ( = ?auto_237574 ?auto_237577 ) ) ( not ( = ?auto_237574 ?auto_237578 ) ) ( not ( = ?auto_237574 ?auto_237579 ) ) ( not ( = ?auto_237574 ?auto_237580 ) ) ( not ( = ?auto_237574 ?auto_237581 ) ) ( not ( = ?auto_237575 ?auto_237576 ) ) ( not ( = ?auto_237575 ?auto_237577 ) ) ( not ( = ?auto_237575 ?auto_237578 ) ) ( not ( = ?auto_237575 ?auto_237579 ) ) ( not ( = ?auto_237575 ?auto_237580 ) ) ( not ( = ?auto_237575 ?auto_237581 ) ) ( not ( = ?auto_237576 ?auto_237577 ) ) ( not ( = ?auto_237576 ?auto_237578 ) ) ( not ( = ?auto_237576 ?auto_237579 ) ) ( not ( = ?auto_237576 ?auto_237580 ) ) ( not ( = ?auto_237576 ?auto_237581 ) ) ( not ( = ?auto_237577 ?auto_237578 ) ) ( not ( = ?auto_237577 ?auto_237579 ) ) ( not ( = ?auto_237577 ?auto_237580 ) ) ( not ( = ?auto_237577 ?auto_237581 ) ) ( not ( = ?auto_237578 ?auto_237579 ) ) ( not ( = ?auto_237578 ?auto_237580 ) ) ( not ( = ?auto_237578 ?auto_237581 ) ) ( not ( = ?auto_237579 ?auto_237580 ) ) ( not ( = ?auto_237579 ?auto_237581 ) ) ( not ( = ?auto_237580 ?auto_237581 ) ) ( ON ?auto_237579 ?auto_237580 ) ( ON ?auto_237578 ?auto_237579 ) ( ON ?auto_237577 ?auto_237578 ) ( ON ?auto_237576 ?auto_237577 ) ( ON ?auto_237575 ?auto_237576 ) ( CLEAR ?auto_237573 ) ( ON ?auto_237574 ?auto_237575 ) ( CLEAR ?auto_237574 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237573 ?auto_237574 )
      ( MAKE-8PILE ?auto_237573 ?auto_237574 ?auto_237575 ?auto_237576 ?auto_237577 ?auto_237578 ?auto_237579 ?auto_237580 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237590 - BLOCK
      ?auto_237591 - BLOCK
      ?auto_237592 - BLOCK
      ?auto_237593 - BLOCK
      ?auto_237594 - BLOCK
      ?auto_237595 - BLOCK
      ?auto_237596 - BLOCK
      ?auto_237597 - BLOCK
    )
    :vars
    (
      ?auto_237598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237597 ?auto_237598 ) ( not ( = ?auto_237590 ?auto_237591 ) ) ( not ( = ?auto_237590 ?auto_237592 ) ) ( not ( = ?auto_237590 ?auto_237593 ) ) ( not ( = ?auto_237590 ?auto_237594 ) ) ( not ( = ?auto_237590 ?auto_237595 ) ) ( not ( = ?auto_237590 ?auto_237596 ) ) ( not ( = ?auto_237590 ?auto_237597 ) ) ( not ( = ?auto_237590 ?auto_237598 ) ) ( not ( = ?auto_237591 ?auto_237592 ) ) ( not ( = ?auto_237591 ?auto_237593 ) ) ( not ( = ?auto_237591 ?auto_237594 ) ) ( not ( = ?auto_237591 ?auto_237595 ) ) ( not ( = ?auto_237591 ?auto_237596 ) ) ( not ( = ?auto_237591 ?auto_237597 ) ) ( not ( = ?auto_237591 ?auto_237598 ) ) ( not ( = ?auto_237592 ?auto_237593 ) ) ( not ( = ?auto_237592 ?auto_237594 ) ) ( not ( = ?auto_237592 ?auto_237595 ) ) ( not ( = ?auto_237592 ?auto_237596 ) ) ( not ( = ?auto_237592 ?auto_237597 ) ) ( not ( = ?auto_237592 ?auto_237598 ) ) ( not ( = ?auto_237593 ?auto_237594 ) ) ( not ( = ?auto_237593 ?auto_237595 ) ) ( not ( = ?auto_237593 ?auto_237596 ) ) ( not ( = ?auto_237593 ?auto_237597 ) ) ( not ( = ?auto_237593 ?auto_237598 ) ) ( not ( = ?auto_237594 ?auto_237595 ) ) ( not ( = ?auto_237594 ?auto_237596 ) ) ( not ( = ?auto_237594 ?auto_237597 ) ) ( not ( = ?auto_237594 ?auto_237598 ) ) ( not ( = ?auto_237595 ?auto_237596 ) ) ( not ( = ?auto_237595 ?auto_237597 ) ) ( not ( = ?auto_237595 ?auto_237598 ) ) ( not ( = ?auto_237596 ?auto_237597 ) ) ( not ( = ?auto_237596 ?auto_237598 ) ) ( not ( = ?auto_237597 ?auto_237598 ) ) ( ON ?auto_237596 ?auto_237597 ) ( ON ?auto_237595 ?auto_237596 ) ( ON ?auto_237594 ?auto_237595 ) ( ON ?auto_237593 ?auto_237594 ) ( ON ?auto_237592 ?auto_237593 ) ( ON ?auto_237591 ?auto_237592 ) ( ON ?auto_237590 ?auto_237591 ) ( CLEAR ?auto_237590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237590 )
      ( MAKE-8PILE ?auto_237590 ?auto_237591 ?auto_237592 ?auto_237593 ?auto_237594 ?auto_237595 ?auto_237596 ?auto_237597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_237607 - BLOCK
      ?auto_237608 - BLOCK
      ?auto_237609 - BLOCK
      ?auto_237610 - BLOCK
      ?auto_237611 - BLOCK
      ?auto_237612 - BLOCK
      ?auto_237613 - BLOCK
      ?auto_237614 - BLOCK
    )
    :vars
    (
      ?auto_237615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237614 ?auto_237615 ) ( not ( = ?auto_237607 ?auto_237608 ) ) ( not ( = ?auto_237607 ?auto_237609 ) ) ( not ( = ?auto_237607 ?auto_237610 ) ) ( not ( = ?auto_237607 ?auto_237611 ) ) ( not ( = ?auto_237607 ?auto_237612 ) ) ( not ( = ?auto_237607 ?auto_237613 ) ) ( not ( = ?auto_237607 ?auto_237614 ) ) ( not ( = ?auto_237607 ?auto_237615 ) ) ( not ( = ?auto_237608 ?auto_237609 ) ) ( not ( = ?auto_237608 ?auto_237610 ) ) ( not ( = ?auto_237608 ?auto_237611 ) ) ( not ( = ?auto_237608 ?auto_237612 ) ) ( not ( = ?auto_237608 ?auto_237613 ) ) ( not ( = ?auto_237608 ?auto_237614 ) ) ( not ( = ?auto_237608 ?auto_237615 ) ) ( not ( = ?auto_237609 ?auto_237610 ) ) ( not ( = ?auto_237609 ?auto_237611 ) ) ( not ( = ?auto_237609 ?auto_237612 ) ) ( not ( = ?auto_237609 ?auto_237613 ) ) ( not ( = ?auto_237609 ?auto_237614 ) ) ( not ( = ?auto_237609 ?auto_237615 ) ) ( not ( = ?auto_237610 ?auto_237611 ) ) ( not ( = ?auto_237610 ?auto_237612 ) ) ( not ( = ?auto_237610 ?auto_237613 ) ) ( not ( = ?auto_237610 ?auto_237614 ) ) ( not ( = ?auto_237610 ?auto_237615 ) ) ( not ( = ?auto_237611 ?auto_237612 ) ) ( not ( = ?auto_237611 ?auto_237613 ) ) ( not ( = ?auto_237611 ?auto_237614 ) ) ( not ( = ?auto_237611 ?auto_237615 ) ) ( not ( = ?auto_237612 ?auto_237613 ) ) ( not ( = ?auto_237612 ?auto_237614 ) ) ( not ( = ?auto_237612 ?auto_237615 ) ) ( not ( = ?auto_237613 ?auto_237614 ) ) ( not ( = ?auto_237613 ?auto_237615 ) ) ( not ( = ?auto_237614 ?auto_237615 ) ) ( ON ?auto_237613 ?auto_237614 ) ( ON ?auto_237612 ?auto_237613 ) ( ON ?auto_237611 ?auto_237612 ) ( ON ?auto_237610 ?auto_237611 ) ( ON ?auto_237609 ?auto_237610 ) ( ON ?auto_237608 ?auto_237609 ) ( ON ?auto_237607 ?auto_237608 ) ( CLEAR ?auto_237607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237607 )
      ( MAKE-8PILE ?auto_237607 ?auto_237608 ?auto_237609 ?auto_237610 ?auto_237611 ?auto_237612 ?auto_237613 ?auto_237614 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237625 - BLOCK
      ?auto_237626 - BLOCK
      ?auto_237627 - BLOCK
      ?auto_237628 - BLOCK
      ?auto_237629 - BLOCK
      ?auto_237630 - BLOCK
      ?auto_237631 - BLOCK
      ?auto_237632 - BLOCK
      ?auto_237633 - BLOCK
    )
    :vars
    (
      ?auto_237634 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237632 ) ( ON ?auto_237633 ?auto_237634 ) ( CLEAR ?auto_237633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237625 ) ( ON ?auto_237626 ?auto_237625 ) ( ON ?auto_237627 ?auto_237626 ) ( ON ?auto_237628 ?auto_237627 ) ( ON ?auto_237629 ?auto_237628 ) ( ON ?auto_237630 ?auto_237629 ) ( ON ?auto_237631 ?auto_237630 ) ( ON ?auto_237632 ?auto_237631 ) ( not ( = ?auto_237625 ?auto_237626 ) ) ( not ( = ?auto_237625 ?auto_237627 ) ) ( not ( = ?auto_237625 ?auto_237628 ) ) ( not ( = ?auto_237625 ?auto_237629 ) ) ( not ( = ?auto_237625 ?auto_237630 ) ) ( not ( = ?auto_237625 ?auto_237631 ) ) ( not ( = ?auto_237625 ?auto_237632 ) ) ( not ( = ?auto_237625 ?auto_237633 ) ) ( not ( = ?auto_237625 ?auto_237634 ) ) ( not ( = ?auto_237626 ?auto_237627 ) ) ( not ( = ?auto_237626 ?auto_237628 ) ) ( not ( = ?auto_237626 ?auto_237629 ) ) ( not ( = ?auto_237626 ?auto_237630 ) ) ( not ( = ?auto_237626 ?auto_237631 ) ) ( not ( = ?auto_237626 ?auto_237632 ) ) ( not ( = ?auto_237626 ?auto_237633 ) ) ( not ( = ?auto_237626 ?auto_237634 ) ) ( not ( = ?auto_237627 ?auto_237628 ) ) ( not ( = ?auto_237627 ?auto_237629 ) ) ( not ( = ?auto_237627 ?auto_237630 ) ) ( not ( = ?auto_237627 ?auto_237631 ) ) ( not ( = ?auto_237627 ?auto_237632 ) ) ( not ( = ?auto_237627 ?auto_237633 ) ) ( not ( = ?auto_237627 ?auto_237634 ) ) ( not ( = ?auto_237628 ?auto_237629 ) ) ( not ( = ?auto_237628 ?auto_237630 ) ) ( not ( = ?auto_237628 ?auto_237631 ) ) ( not ( = ?auto_237628 ?auto_237632 ) ) ( not ( = ?auto_237628 ?auto_237633 ) ) ( not ( = ?auto_237628 ?auto_237634 ) ) ( not ( = ?auto_237629 ?auto_237630 ) ) ( not ( = ?auto_237629 ?auto_237631 ) ) ( not ( = ?auto_237629 ?auto_237632 ) ) ( not ( = ?auto_237629 ?auto_237633 ) ) ( not ( = ?auto_237629 ?auto_237634 ) ) ( not ( = ?auto_237630 ?auto_237631 ) ) ( not ( = ?auto_237630 ?auto_237632 ) ) ( not ( = ?auto_237630 ?auto_237633 ) ) ( not ( = ?auto_237630 ?auto_237634 ) ) ( not ( = ?auto_237631 ?auto_237632 ) ) ( not ( = ?auto_237631 ?auto_237633 ) ) ( not ( = ?auto_237631 ?auto_237634 ) ) ( not ( = ?auto_237632 ?auto_237633 ) ) ( not ( = ?auto_237632 ?auto_237634 ) ) ( not ( = ?auto_237633 ?auto_237634 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237633 ?auto_237634 )
      ( !STACK ?auto_237633 ?auto_237632 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237644 - BLOCK
      ?auto_237645 - BLOCK
      ?auto_237646 - BLOCK
      ?auto_237647 - BLOCK
      ?auto_237648 - BLOCK
      ?auto_237649 - BLOCK
      ?auto_237650 - BLOCK
      ?auto_237651 - BLOCK
      ?auto_237652 - BLOCK
    )
    :vars
    (
      ?auto_237653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237651 ) ( ON ?auto_237652 ?auto_237653 ) ( CLEAR ?auto_237652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237644 ) ( ON ?auto_237645 ?auto_237644 ) ( ON ?auto_237646 ?auto_237645 ) ( ON ?auto_237647 ?auto_237646 ) ( ON ?auto_237648 ?auto_237647 ) ( ON ?auto_237649 ?auto_237648 ) ( ON ?auto_237650 ?auto_237649 ) ( ON ?auto_237651 ?auto_237650 ) ( not ( = ?auto_237644 ?auto_237645 ) ) ( not ( = ?auto_237644 ?auto_237646 ) ) ( not ( = ?auto_237644 ?auto_237647 ) ) ( not ( = ?auto_237644 ?auto_237648 ) ) ( not ( = ?auto_237644 ?auto_237649 ) ) ( not ( = ?auto_237644 ?auto_237650 ) ) ( not ( = ?auto_237644 ?auto_237651 ) ) ( not ( = ?auto_237644 ?auto_237652 ) ) ( not ( = ?auto_237644 ?auto_237653 ) ) ( not ( = ?auto_237645 ?auto_237646 ) ) ( not ( = ?auto_237645 ?auto_237647 ) ) ( not ( = ?auto_237645 ?auto_237648 ) ) ( not ( = ?auto_237645 ?auto_237649 ) ) ( not ( = ?auto_237645 ?auto_237650 ) ) ( not ( = ?auto_237645 ?auto_237651 ) ) ( not ( = ?auto_237645 ?auto_237652 ) ) ( not ( = ?auto_237645 ?auto_237653 ) ) ( not ( = ?auto_237646 ?auto_237647 ) ) ( not ( = ?auto_237646 ?auto_237648 ) ) ( not ( = ?auto_237646 ?auto_237649 ) ) ( not ( = ?auto_237646 ?auto_237650 ) ) ( not ( = ?auto_237646 ?auto_237651 ) ) ( not ( = ?auto_237646 ?auto_237652 ) ) ( not ( = ?auto_237646 ?auto_237653 ) ) ( not ( = ?auto_237647 ?auto_237648 ) ) ( not ( = ?auto_237647 ?auto_237649 ) ) ( not ( = ?auto_237647 ?auto_237650 ) ) ( not ( = ?auto_237647 ?auto_237651 ) ) ( not ( = ?auto_237647 ?auto_237652 ) ) ( not ( = ?auto_237647 ?auto_237653 ) ) ( not ( = ?auto_237648 ?auto_237649 ) ) ( not ( = ?auto_237648 ?auto_237650 ) ) ( not ( = ?auto_237648 ?auto_237651 ) ) ( not ( = ?auto_237648 ?auto_237652 ) ) ( not ( = ?auto_237648 ?auto_237653 ) ) ( not ( = ?auto_237649 ?auto_237650 ) ) ( not ( = ?auto_237649 ?auto_237651 ) ) ( not ( = ?auto_237649 ?auto_237652 ) ) ( not ( = ?auto_237649 ?auto_237653 ) ) ( not ( = ?auto_237650 ?auto_237651 ) ) ( not ( = ?auto_237650 ?auto_237652 ) ) ( not ( = ?auto_237650 ?auto_237653 ) ) ( not ( = ?auto_237651 ?auto_237652 ) ) ( not ( = ?auto_237651 ?auto_237653 ) ) ( not ( = ?auto_237652 ?auto_237653 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237652 ?auto_237653 )
      ( !STACK ?auto_237652 ?auto_237651 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237663 - BLOCK
      ?auto_237664 - BLOCK
      ?auto_237665 - BLOCK
      ?auto_237666 - BLOCK
      ?auto_237667 - BLOCK
      ?auto_237668 - BLOCK
      ?auto_237669 - BLOCK
      ?auto_237670 - BLOCK
      ?auto_237671 - BLOCK
    )
    :vars
    (
      ?auto_237672 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237671 ?auto_237672 ) ( ON-TABLE ?auto_237663 ) ( ON ?auto_237664 ?auto_237663 ) ( ON ?auto_237665 ?auto_237664 ) ( ON ?auto_237666 ?auto_237665 ) ( ON ?auto_237667 ?auto_237666 ) ( ON ?auto_237668 ?auto_237667 ) ( ON ?auto_237669 ?auto_237668 ) ( not ( = ?auto_237663 ?auto_237664 ) ) ( not ( = ?auto_237663 ?auto_237665 ) ) ( not ( = ?auto_237663 ?auto_237666 ) ) ( not ( = ?auto_237663 ?auto_237667 ) ) ( not ( = ?auto_237663 ?auto_237668 ) ) ( not ( = ?auto_237663 ?auto_237669 ) ) ( not ( = ?auto_237663 ?auto_237670 ) ) ( not ( = ?auto_237663 ?auto_237671 ) ) ( not ( = ?auto_237663 ?auto_237672 ) ) ( not ( = ?auto_237664 ?auto_237665 ) ) ( not ( = ?auto_237664 ?auto_237666 ) ) ( not ( = ?auto_237664 ?auto_237667 ) ) ( not ( = ?auto_237664 ?auto_237668 ) ) ( not ( = ?auto_237664 ?auto_237669 ) ) ( not ( = ?auto_237664 ?auto_237670 ) ) ( not ( = ?auto_237664 ?auto_237671 ) ) ( not ( = ?auto_237664 ?auto_237672 ) ) ( not ( = ?auto_237665 ?auto_237666 ) ) ( not ( = ?auto_237665 ?auto_237667 ) ) ( not ( = ?auto_237665 ?auto_237668 ) ) ( not ( = ?auto_237665 ?auto_237669 ) ) ( not ( = ?auto_237665 ?auto_237670 ) ) ( not ( = ?auto_237665 ?auto_237671 ) ) ( not ( = ?auto_237665 ?auto_237672 ) ) ( not ( = ?auto_237666 ?auto_237667 ) ) ( not ( = ?auto_237666 ?auto_237668 ) ) ( not ( = ?auto_237666 ?auto_237669 ) ) ( not ( = ?auto_237666 ?auto_237670 ) ) ( not ( = ?auto_237666 ?auto_237671 ) ) ( not ( = ?auto_237666 ?auto_237672 ) ) ( not ( = ?auto_237667 ?auto_237668 ) ) ( not ( = ?auto_237667 ?auto_237669 ) ) ( not ( = ?auto_237667 ?auto_237670 ) ) ( not ( = ?auto_237667 ?auto_237671 ) ) ( not ( = ?auto_237667 ?auto_237672 ) ) ( not ( = ?auto_237668 ?auto_237669 ) ) ( not ( = ?auto_237668 ?auto_237670 ) ) ( not ( = ?auto_237668 ?auto_237671 ) ) ( not ( = ?auto_237668 ?auto_237672 ) ) ( not ( = ?auto_237669 ?auto_237670 ) ) ( not ( = ?auto_237669 ?auto_237671 ) ) ( not ( = ?auto_237669 ?auto_237672 ) ) ( not ( = ?auto_237670 ?auto_237671 ) ) ( not ( = ?auto_237670 ?auto_237672 ) ) ( not ( = ?auto_237671 ?auto_237672 ) ) ( CLEAR ?auto_237669 ) ( ON ?auto_237670 ?auto_237671 ) ( CLEAR ?auto_237670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_237663 ?auto_237664 ?auto_237665 ?auto_237666 ?auto_237667 ?auto_237668 ?auto_237669 ?auto_237670 )
      ( MAKE-9PILE ?auto_237663 ?auto_237664 ?auto_237665 ?auto_237666 ?auto_237667 ?auto_237668 ?auto_237669 ?auto_237670 ?auto_237671 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237682 - BLOCK
      ?auto_237683 - BLOCK
      ?auto_237684 - BLOCK
      ?auto_237685 - BLOCK
      ?auto_237686 - BLOCK
      ?auto_237687 - BLOCK
      ?auto_237688 - BLOCK
      ?auto_237689 - BLOCK
      ?auto_237690 - BLOCK
    )
    :vars
    (
      ?auto_237691 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237690 ?auto_237691 ) ( ON-TABLE ?auto_237682 ) ( ON ?auto_237683 ?auto_237682 ) ( ON ?auto_237684 ?auto_237683 ) ( ON ?auto_237685 ?auto_237684 ) ( ON ?auto_237686 ?auto_237685 ) ( ON ?auto_237687 ?auto_237686 ) ( ON ?auto_237688 ?auto_237687 ) ( not ( = ?auto_237682 ?auto_237683 ) ) ( not ( = ?auto_237682 ?auto_237684 ) ) ( not ( = ?auto_237682 ?auto_237685 ) ) ( not ( = ?auto_237682 ?auto_237686 ) ) ( not ( = ?auto_237682 ?auto_237687 ) ) ( not ( = ?auto_237682 ?auto_237688 ) ) ( not ( = ?auto_237682 ?auto_237689 ) ) ( not ( = ?auto_237682 ?auto_237690 ) ) ( not ( = ?auto_237682 ?auto_237691 ) ) ( not ( = ?auto_237683 ?auto_237684 ) ) ( not ( = ?auto_237683 ?auto_237685 ) ) ( not ( = ?auto_237683 ?auto_237686 ) ) ( not ( = ?auto_237683 ?auto_237687 ) ) ( not ( = ?auto_237683 ?auto_237688 ) ) ( not ( = ?auto_237683 ?auto_237689 ) ) ( not ( = ?auto_237683 ?auto_237690 ) ) ( not ( = ?auto_237683 ?auto_237691 ) ) ( not ( = ?auto_237684 ?auto_237685 ) ) ( not ( = ?auto_237684 ?auto_237686 ) ) ( not ( = ?auto_237684 ?auto_237687 ) ) ( not ( = ?auto_237684 ?auto_237688 ) ) ( not ( = ?auto_237684 ?auto_237689 ) ) ( not ( = ?auto_237684 ?auto_237690 ) ) ( not ( = ?auto_237684 ?auto_237691 ) ) ( not ( = ?auto_237685 ?auto_237686 ) ) ( not ( = ?auto_237685 ?auto_237687 ) ) ( not ( = ?auto_237685 ?auto_237688 ) ) ( not ( = ?auto_237685 ?auto_237689 ) ) ( not ( = ?auto_237685 ?auto_237690 ) ) ( not ( = ?auto_237685 ?auto_237691 ) ) ( not ( = ?auto_237686 ?auto_237687 ) ) ( not ( = ?auto_237686 ?auto_237688 ) ) ( not ( = ?auto_237686 ?auto_237689 ) ) ( not ( = ?auto_237686 ?auto_237690 ) ) ( not ( = ?auto_237686 ?auto_237691 ) ) ( not ( = ?auto_237687 ?auto_237688 ) ) ( not ( = ?auto_237687 ?auto_237689 ) ) ( not ( = ?auto_237687 ?auto_237690 ) ) ( not ( = ?auto_237687 ?auto_237691 ) ) ( not ( = ?auto_237688 ?auto_237689 ) ) ( not ( = ?auto_237688 ?auto_237690 ) ) ( not ( = ?auto_237688 ?auto_237691 ) ) ( not ( = ?auto_237689 ?auto_237690 ) ) ( not ( = ?auto_237689 ?auto_237691 ) ) ( not ( = ?auto_237690 ?auto_237691 ) ) ( CLEAR ?auto_237688 ) ( ON ?auto_237689 ?auto_237690 ) ( CLEAR ?auto_237689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_237682 ?auto_237683 ?auto_237684 ?auto_237685 ?auto_237686 ?auto_237687 ?auto_237688 ?auto_237689 )
      ( MAKE-9PILE ?auto_237682 ?auto_237683 ?auto_237684 ?auto_237685 ?auto_237686 ?auto_237687 ?auto_237688 ?auto_237689 ?auto_237690 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237701 - BLOCK
      ?auto_237702 - BLOCK
      ?auto_237703 - BLOCK
      ?auto_237704 - BLOCK
      ?auto_237705 - BLOCK
      ?auto_237706 - BLOCK
      ?auto_237707 - BLOCK
      ?auto_237708 - BLOCK
      ?auto_237709 - BLOCK
    )
    :vars
    (
      ?auto_237710 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237709 ?auto_237710 ) ( ON-TABLE ?auto_237701 ) ( ON ?auto_237702 ?auto_237701 ) ( ON ?auto_237703 ?auto_237702 ) ( ON ?auto_237704 ?auto_237703 ) ( ON ?auto_237705 ?auto_237704 ) ( ON ?auto_237706 ?auto_237705 ) ( not ( = ?auto_237701 ?auto_237702 ) ) ( not ( = ?auto_237701 ?auto_237703 ) ) ( not ( = ?auto_237701 ?auto_237704 ) ) ( not ( = ?auto_237701 ?auto_237705 ) ) ( not ( = ?auto_237701 ?auto_237706 ) ) ( not ( = ?auto_237701 ?auto_237707 ) ) ( not ( = ?auto_237701 ?auto_237708 ) ) ( not ( = ?auto_237701 ?auto_237709 ) ) ( not ( = ?auto_237701 ?auto_237710 ) ) ( not ( = ?auto_237702 ?auto_237703 ) ) ( not ( = ?auto_237702 ?auto_237704 ) ) ( not ( = ?auto_237702 ?auto_237705 ) ) ( not ( = ?auto_237702 ?auto_237706 ) ) ( not ( = ?auto_237702 ?auto_237707 ) ) ( not ( = ?auto_237702 ?auto_237708 ) ) ( not ( = ?auto_237702 ?auto_237709 ) ) ( not ( = ?auto_237702 ?auto_237710 ) ) ( not ( = ?auto_237703 ?auto_237704 ) ) ( not ( = ?auto_237703 ?auto_237705 ) ) ( not ( = ?auto_237703 ?auto_237706 ) ) ( not ( = ?auto_237703 ?auto_237707 ) ) ( not ( = ?auto_237703 ?auto_237708 ) ) ( not ( = ?auto_237703 ?auto_237709 ) ) ( not ( = ?auto_237703 ?auto_237710 ) ) ( not ( = ?auto_237704 ?auto_237705 ) ) ( not ( = ?auto_237704 ?auto_237706 ) ) ( not ( = ?auto_237704 ?auto_237707 ) ) ( not ( = ?auto_237704 ?auto_237708 ) ) ( not ( = ?auto_237704 ?auto_237709 ) ) ( not ( = ?auto_237704 ?auto_237710 ) ) ( not ( = ?auto_237705 ?auto_237706 ) ) ( not ( = ?auto_237705 ?auto_237707 ) ) ( not ( = ?auto_237705 ?auto_237708 ) ) ( not ( = ?auto_237705 ?auto_237709 ) ) ( not ( = ?auto_237705 ?auto_237710 ) ) ( not ( = ?auto_237706 ?auto_237707 ) ) ( not ( = ?auto_237706 ?auto_237708 ) ) ( not ( = ?auto_237706 ?auto_237709 ) ) ( not ( = ?auto_237706 ?auto_237710 ) ) ( not ( = ?auto_237707 ?auto_237708 ) ) ( not ( = ?auto_237707 ?auto_237709 ) ) ( not ( = ?auto_237707 ?auto_237710 ) ) ( not ( = ?auto_237708 ?auto_237709 ) ) ( not ( = ?auto_237708 ?auto_237710 ) ) ( not ( = ?auto_237709 ?auto_237710 ) ) ( ON ?auto_237708 ?auto_237709 ) ( CLEAR ?auto_237706 ) ( ON ?auto_237707 ?auto_237708 ) ( CLEAR ?auto_237707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_237701 ?auto_237702 ?auto_237703 ?auto_237704 ?auto_237705 ?auto_237706 ?auto_237707 )
      ( MAKE-9PILE ?auto_237701 ?auto_237702 ?auto_237703 ?auto_237704 ?auto_237705 ?auto_237706 ?auto_237707 ?auto_237708 ?auto_237709 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237720 - BLOCK
      ?auto_237721 - BLOCK
      ?auto_237722 - BLOCK
      ?auto_237723 - BLOCK
      ?auto_237724 - BLOCK
      ?auto_237725 - BLOCK
      ?auto_237726 - BLOCK
      ?auto_237727 - BLOCK
      ?auto_237728 - BLOCK
    )
    :vars
    (
      ?auto_237729 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237728 ?auto_237729 ) ( ON-TABLE ?auto_237720 ) ( ON ?auto_237721 ?auto_237720 ) ( ON ?auto_237722 ?auto_237721 ) ( ON ?auto_237723 ?auto_237722 ) ( ON ?auto_237724 ?auto_237723 ) ( ON ?auto_237725 ?auto_237724 ) ( not ( = ?auto_237720 ?auto_237721 ) ) ( not ( = ?auto_237720 ?auto_237722 ) ) ( not ( = ?auto_237720 ?auto_237723 ) ) ( not ( = ?auto_237720 ?auto_237724 ) ) ( not ( = ?auto_237720 ?auto_237725 ) ) ( not ( = ?auto_237720 ?auto_237726 ) ) ( not ( = ?auto_237720 ?auto_237727 ) ) ( not ( = ?auto_237720 ?auto_237728 ) ) ( not ( = ?auto_237720 ?auto_237729 ) ) ( not ( = ?auto_237721 ?auto_237722 ) ) ( not ( = ?auto_237721 ?auto_237723 ) ) ( not ( = ?auto_237721 ?auto_237724 ) ) ( not ( = ?auto_237721 ?auto_237725 ) ) ( not ( = ?auto_237721 ?auto_237726 ) ) ( not ( = ?auto_237721 ?auto_237727 ) ) ( not ( = ?auto_237721 ?auto_237728 ) ) ( not ( = ?auto_237721 ?auto_237729 ) ) ( not ( = ?auto_237722 ?auto_237723 ) ) ( not ( = ?auto_237722 ?auto_237724 ) ) ( not ( = ?auto_237722 ?auto_237725 ) ) ( not ( = ?auto_237722 ?auto_237726 ) ) ( not ( = ?auto_237722 ?auto_237727 ) ) ( not ( = ?auto_237722 ?auto_237728 ) ) ( not ( = ?auto_237722 ?auto_237729 ) ) ( not ( = ?auto_237723 ?auto_237724 ) ) ( not ( = ?auto_237723 ?auto_237725 ) ) ( not ( = ?auto_237723 ?auto_237726 ) ) ( not ( = ?auto_237723 ?auto_237727 ) ) ( not ( = ?auto_237723 ?auto_237728 ) ) ( not ( = ?auto_237723 ?auto_237729 ) ) ( not ( = ?auto_237724 ?auto_237725 ) ) ( not ( = ?auto_237724 ?auto_237726 ) ) ( not ( = ?auto_237724 ?auto_237727 ) ) ( not ( = ?auto_237724 ?auto_237728 ) ) ( not ( = ?auto_237724 ?auto_237729 ) ) ( not ( = ?auto_237725 ?auto_237726 ) ) ( not ( = ?auto_237725 ?auto_237727 ) ) ( not ( = ?auto_237725 ?auto_237728 ) ) ( not ( = ?auto_237725 ?auto_237729 ) ) ( not ( = ?auto_237726 ?auto_237727 ) ) ( not ( = ?auto_237726 ?auto_237728 ) ) ( not ( = ?auto_237726 ?auto_237729 ) ) ( not ( = ?auto_237727 ?auto_237728 ) ) ( not ( = ?auto_237727 ?auto_237729 ) ) ( not ( = ?auto_237728 ?auto_237729 ) ) ( ON ?auto_237727 ?auto_237728 ) ( CLEAR ?auto_237725 ) ( ON ?auto_237726 ?auto_237727 ) ( CLEAR ?auto_237726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_237720 ?auto_237721 ?auto_237722 ?auto_237723 ?auto_237724 ?auto_237725 ?auto_237726 )
      ( MAKE-9PILE ?auto_237720 ?auto_237721 ?auto_237722 ?auto_237723 ?auto_237724 ?auto_237725 ?auto_237726 ?auto_237727 ?auto_237728 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237739 - BLOCK
      ?auto_237740 - BLOCK
      ?auto_237741 - BLOCK
      ?auto_237742 - BLOCK
      ?auto_237743 - BLOCK
      ?auto_237744 - BLOCK
      ?auto_237745 - BLOCK
      ?auto_237746 - BLOCK
      ?auto_237747 - BLOCK
    )
    :vars
    (
      ?auto_237748 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237747 ?auto_237748 ) ( ON-TABLE ?auto_237739 ) ( ON ?auto_237740 ?auto_237739 ) ( ON ?auto_237741 ?auto_237740 ) ( ON ?auto_237742 ?auto_237741 ) ( ON ?auto_237743 ?auto_237742 ) ( not ( = ?auto_237739 ?auto_237740 ) ) ( not ( = ?auto_237739 ?auto_237741 ) ) ( not ( = ?auto_237739 ?auto_237742 ) ) ( not ( = ?auto_237739 ?auto_237743 ) ) ( not ( = ?auto_237739 ?auto_237744 ) ) ( not ( = ?auto_237739 ?auto_237745 ) ) ( not ( = ?auto_237739 ?auto_237746 ) ) ( not ( = ?auto_237739 ?auto_237747 ) ) ( not ( = ?auto_237739 ?auto_237748 ) ) ( not ( = ?auto_237740 ?auto_237741 ) ) ( not ( = ?auto_237740 ?auto_237742 ) ) ( not ( = ?auto_237740 ?auto_237743 ) ) ( not ( = ?auto_237740 ?auto_237744 ) ) ( not ( = ?auto_237740 ?auto_237745 ) ) ( not ( = ?auto_237740 ?auto_237746 ) ) ( not ( = ?auto_237740 ?auto_237747 ) ) ( not ( = ?auto_237740 ?auto_237748 ) ) ( not ( = ?auto_237741 ?auto_237742 ) ) ( not ( = ?auto_237741 ?auto_237743 ) ) ( not ( = ?auto_237741 ?auto_237744 ) ) ( not ( = ?auto_237741 ?auto_237745 ) ) ( not ( = ?auto_237741 ?auto_237746 ) ) ( not ( = ?auto_237741 ?auto_237747 ) ) ( not ( = ?auto_237741 ?auto_237748 ) ) ( not ( = ?auto_237742 ?auto_237743 ) ) ( not ( = ?auto_237742 ?auto_237744 ) ) ( not ( = ?auto_237742 ?auto_237745 ) ) ( not ( = ?auto_237742 ?auto_237746 ) ) ( not ( = ?auto_237742 ?auto_237747 ) ) ( not ( = ?auto_237742 ?auto_237748 ) ) ( not ( = ?auto_237743 ?auto_237744 ) ) ( not ( = ?auto_237743 ?auto_237745 ) ) ( not ( = ?auto_237743 ?auto_237746 ) ) ( not ( = ?auto_237743 ?auto_237747 ) ) ( not ( = ?auto_237743 ?auto_237748 ) ) ( not ( = ?auto_237744 ?auto_237745 ) ) ( not ( = ?auto_237744 ?auto_237746 ) ) ( not ( = ?auto_237744 ?auto_237747 ) ) ( not ( = ?auto_237744 ?auto_237748 ) ) ( not ( = ?auto_237745 ?auto_237746 ) ) ( not ( = ?auto_237745 ?auto_237747 ) ) ( not ( = ?auto_237745 ?auto_237748 ) ) ( not ( = ?auto_237746 ?auto_237747 ) ) ( not ( = ?auto_237746 ?auto_237748 ) ) ( not ( = ?auto_237747 ?auto_237748 ) ) ( ON ?auto_237746 ?auto_237747 ) ( ON ?auto_237745 ?auto_237746 ) ( CLEAR ?auto_237743 ) ( ON ?auto_237744 ?auto_237745 ) ( CLEAR ?auto_237744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237739 ?auto_237740 ?auto_237741 ?auto_237742 ?auto_237743 ?auto_237744 )
      ( MAKE-9PILE ?auto_237739 ?auto_237740 ?auto_237741 ?auto_237742 ?auto_237743 ?auto_237744 ?auto_237745 ?auto_237746 ?auto_237747 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237758 - BLOCK
      ?auto_237759 - BLOCK
      ?auto_237760 - BLOCK
      ?auto_237761 - BLOCK
      ?auto_237762 - BLOCK
      ?auto_237763 - BLOCK
      ?auto_237764 - BLOCK
      ?auto_237765 - BLOCK
      ?auto_237766 - BLOCK
    )
    :vars
    (
      ?auto_237767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237766 ?auto_237767 ) ( ON-TABLE ?auto_237758 ) ( ON ?auto_237759 ?auto_237758 ) ( ON ?auto_237760 ?auto_237759 ) ( ON ?auto_237761 ?auto_237760 ) ( ON ?auto_237762 ?auto_237761 ) ( not ( = ?auto_237758 ?auto_237759 ) ) ( not ( = ?auto_237758 ?auto_237760 ) ) ( not ( = ?auto_237758 ?auto_237761 ) ) ( not ( = ?auto_237758 ?auto_237762 ) ) ( not ( = ?auto_237758 ?auto_237763 ) ) ( not ( = ?auto_237758 ?auto_237764 ) ) ( not ( = ?auto_237758 ?auto_237765 ) ) ( not ( = ?auto_237758 ?auto_237766 ) ) ( not ( = ?auto_237758 ?auto_237767 ) ) ( not ( = ?auto_237759 ?auto_237760 ) ) ( not ( = ?auto_237759 ?auto_237761 ) ) ( not ( = ?auto_237759 ?auto_237762 ) ) ( not ( = ?auto_237759 ?auto_237763 ) ) ( not ( = ?auto_237759 ?auto_237764 ) ) ( not ( = ?auto_237759 ?auto_237765 ) ) ( not ( = ?auto_237759 ?auto_237766 ) ) ( not ( = ?auto_237759 ?auto_237767 ) ) ( not ( = ?auto_237760 ?auto_237761 ) ) ( not ( = ?auto_237760 ?auto_237762 ) ) ( not ( = ?auto_237760 ?auto_237763 ) ) ( not ( = ?auto_237760 ?auto_237764 ) ) ( not ( = ?auto_237760 ?auto_237765 ) ) ( not ( = ?auto_237760 ?auto_237766 ) ) ( not ( = ?auto_237760 ?auto_237767 ) ) ( not ( = ?auto_237761 ?auto_237762 ) ) ( not ( = ?auto_237761 ?auto_237763 ) ) ( not ( = ?auto_237761 ?auto_237764 ) ) ( not ( = ?auto_237761 ?auto_237765 ) ) ( not ( = ?auto_237761 ?auto_237766 ) ) ( not ( = ?auto_237761 ?auto_237767 ) ) ( not ( = ?auto_237762 ?auto_237763 ) ) ( not ( = ?auto_237762 ?auto_237764 ) ) ( not ( = ?auto_237762 ?auto_237765 ) ) ( not ( = ?auto_237762 ?auto_237766 ) ) ( not ( = ?auto_237762 ?auto_237767 ) ) ( not ( = ?auto_237763 ?auto_237764 ) ) ( not ( = ?auto_237763 ?auto_237765 ) ) ( not ( = ?auto_237763 ?auto_237766 ) ) ( not ( = ?auto_237763 ?auto_237767 ) ) ( not ( = ?auto_237764 ?auto_237765 ) ) ( not ( = ?auto_237764 ?auto_237766 ) ) ( not ( = ?auto_237764 ?auto_237767 ) ) ( not ( = ?auto_237765 ?auto_237766 ) ) ( not ( = ?auto_237765 ?auto_237767 ) ) ( not ( = ?auto_237766 ?auto_237767 ) ) ( ON ?auto_237765 ?auto_237766 ) ( ON ?auto_237764 ?auto_237765 ) ( CLEAR ?auto_237762 ) ( ON ?auto_237763 ?auto_237764 ) ( CLEAR ?auto_237763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_237758 ?auto_237759 ?auto_237760 ?auto_237761 ?auto_237762 ?auto_237763 )
      ( MAKE-9PILE ?auto_237758 ?auto_237759 ?auto_237760 ?auto_237761 ?auto_237762 ?auto_237763 ?auto_237764 ?auto_237765 ?auto_237766 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237777 - BLOCK
      ?auto_237778 - BLOCK
      ?auto_237779 - BLOCK
      ?auto_237780 - BLOCK
      ?auto_237781 - BLOCK
      ?auto_237782 - BLOCK
      ?auto_237783 - BLOCK
      ?auto_237784 - BLOCK
      ?auto_237785 - BLOCK
    )
    :vars
    (
      ?auto_237786 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237785 ?auto_237786 ) ( ON-TABLE ?auto_237777 ) ( ON ?auto_237778 ?auto_237777 ) ( ON ?auto_237779 ?auto_237778 ) ( ON ?auto_237780 ?auto_237779 ) ( not ( = ?auto_237777 ?auto_237778 ) ) ( not ( = ?auto_237777 ?auto_237779 ) ) ( not ( = ?auto_237777 ?auto_237780 ) ) ( not ( = ?auto_237777 ?auto_237781 ) ) ( not ( = ?auto_237777 ?auto_237782 ) ) ( not ( = ?auto_237777 ?auto_237783 ) ) ( not ( = ?auto_237777 ?auto_237784 ) ) ( not ( = ?auto_237777 ?auto_237785 ) ) ( not ( = ?auto_237777 ?auto_237786 ) ) ( not ( = ?auto_237778 ?auto_237779 ) ) ( not ( = ?auto_237778 ?auto_237780 ) ) ( not ( = ?auto_237778 ?auto_237781 ) ) ( not ( = ?auto_237778 ?auto_237782 ) ) ( not ( = ?auto_237778 ?auto_237783 ) ) ( not ( = ?auto_237778 ?auto_237784 ) ) ( not ( = ?auto_237778 ?auto_237785 ) ) ( not ( = ?auto_237778 ?auto_237786 ) ) ( not ( = ?auto_237779 ?auto_237780 ) ) ( not ( = ?auto_237779 ?auto_237781 ) ) ( not ( = ?auto_237779 ?auto_237782 ) ) ( not ( = ?auto_237779 ?auto_237783 ) ) ( not ( = ?auto_237779 ?auto_237784 ) ) ( not ( = ?auto_237779 ?auto_237785 ) ) ( not ( = ?auto_237779 ?auto_237786 ) ) ( not ( = ?auto_237780 ?auto_237781 ) ) ( not ( = ?auto_237780 ?auto_237782 ) ) ( not ( = ?auto_237780 ?auto_237783 ) ) ( not ( = ?auto_237780 ?auto_237784 ) ) ( not ( = ?auto_237780 ?auto_237785 ) ) ( not ( = ?auto_237780 ?auto_237786 ) ) ( not ( = ?auto_237781 ?auto_237782 ) ) ( not ( = ?auto_237781 ?auto_237783 ) ) ( not ( = ?auto_237781 ?auto_237784 ) ) ( not ( = ?auto_237781 ?auto_237785 ) ) ( not ( = ?auto_237781 ?auto_237786 ) ) ( not ( = ?auto_237782 ?auto_237783 ) ) ( not ( = ?auto_237782 ?auto_237784 ) ) ( not ( = ?auto_237782 ?auto_237785 ) ) ( not ( = ?auto_237782 ?auto_237786 ) ) ( not ( = ?auto_237783 ?auto_237784 ) ) ( not ( = ?auto_237783 ?auto_237785 ) ) ( not ( = ?auto_237783 ?auto_237786 ) ) ( not ( = ?auto_237784 ?auto_237785 ) ) ( not ( = ?auto_237784 ?auto_237786 ) ) ( not ( = ?auto_237785 ?auto_237786 ) ) ( ON ?auto_237784 ?auto_237785 ) ( ON ?auto_237783 ?auto_237784 ) ( ON ?auto_237782 ?auto_237783 ) ( CLEAR ?auto_237780 ) ( ON ?auto_237781 ?auto_237782 ) ( CLEAR ?auto_237781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237777 ?auto_237778 ?auto_237779 ?auto_237780 ?auto_237781 )
      ( MAKE-9PILE ?auto_237777 ?auto_237778 ?auto_237779 ?auto_237780 ?auto_237781 ?auto_237782 ?auto_237783 ?auto_237784 ?auto_237785 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237796 - BLOCK
      ?auto_237797 - BLOCK
      ?auto_237798 - BLOCK
      ?auto_237799 - BLOCK
      ?auto_237800 - BLOCK
      ?auto_237801 - BLOCK
      ?auto_237802 - BLOCK
      ?auto_237803 - BLOCK
      ?auto_237804 - BLOCK
    )
    :vars
    (
      ?auto_237805 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237804 ?auto_237805 ) ( ON-TABLE ?auto_237796 ) ( ON ?auto_237797 ?auto_237796 ) ( ON ?auto_237798 ?auto_237797 ) ( ON ?auto_237799 ?auto_237798 ) ( not ( = ?auto_237796 ?auto_237797 ) ) ( not ( = ?auto_237796 ?auto_237798 ) ) ( not ( = ?auto_237796 ?auto_237799 ) ) ( not ( = ?auto_237796 ?auto_237800 ) ) ( not ( = ?auto_237796 ?auto_237801 ) ) ( not ( = ?auto_237796 ?auto_237802 ) ) ( not ( = ?auto_237796 ?auto_237803 ) ) ( not ( = ?auto_237796 ?auto_237804 ) ) ( not ( = ?auto_237796 ?auto_237805 ) ) ( not ( = ?auto_237797 ?auto_237798 ) ) ( not ( = ?auto_237797 ?auto_237799 ) ) ( not ( = ?auto_237797 ?auto_237800 ) ) ( not ( = ?auto_237797 ?auto_237801 ) ) ( not ( = ?auto_237797 ?auto_237802 ) ) ( not ( = ?auto_237797 ?auto_237803 ) ) ( not ( = ?auto_237797 ?auto_237804 ) ) ( not ( = ?auto_237797 ?auto_237805 ) ) ( not ( = ?auto_237798 ?auto_237799 ) ) ( not ( = ?auto_237798 ?auto_237800 ) ) ( not ( = ?auto_237798 ?auto_237801 ) ) ( not ( = ?auto_237798 ?auto_237802 ) ) ( not ( = ?auto_237798 ?auto_237803 ) ) ( not ( = ?auto_237798 ?auto_237804 ) ) ( not ( = ?auto_237798 ?auto_237805 ) ) ( not ( = ?auto_237799 ?auto_237800 ) ) ( not ( = ?auto_237799 ?auto_237801 ) ) ( not ( = ?auto_237799 ?auto_237802 ) ) ( not ( = ?auto_237799 ?auto_237803 ) ) ( not ( = ?auto_237799 ?auto_237804 ) ) ( not ( = ?auto_237799 ?auto_237805 ) ) ( not ( = ?auto_237800 ?auto_237801 ) ) ( not ( = ?auto_237800 ?auto_237802 ) ) ( not ( = ?auto_237800 ?auto_237803 ) ) ( not ( = ?auto_237800 ?auto_237804 ) ) ( not ( = ?auto_237800 ?auto_237805 ) ) ( not ( = ?auto_237801 ?auto_237802 ) ) ( not ( = ?auto_237801 ?auto_237803 ) ) ( not ( = ?auto_237801 ?auto_237804 ) ) ( not ( = ?auto_237801 ?auto_237805 ) ) ( not ( = ?auto_237802 ?auto_237803 ) ) ( not ( = ?auto_237802 ?auto_237804 ) ) ( not ( = ?auto_237802 ?auto_237805 ) ) ( not ( = ?auto_237803 ?auto_237804 ) ) ( not ( = ?auto_237803 ?auto_237805 ) ) ( not ( = ?auto_237804 ?auto_237805 ) ) ( ON ?auto_237803 ?auto_237804 ) ( ON ?auto_237802 ?auto_237803 ) ( ON ?auto_237801 ?auto_237802 ) ( CLEAR ?auto_237799 ) ( ON ?auto_237800 ?auto_237801 ) ( CLEAR ?auto_237800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_237796 ?auto_237797 ?auto_237798 ?auto_237799 ?auto_237800 )
      ( MAKE-9PILE ?auto_237796 ?auto_237797 ?auto_237798 ?auto_237799 ?auto_237800 ?auto_237801 ?auto_237802 ?auto_237803 ?auto_237804 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237815 - BLOCK
      ?auto_237816 - BLOCK
      ?auto_237817 - BLOCK
      ?auto_237818 - BLOCK
      ?auto_237819 - BLOCK
      ?auto_237820 - BLOCK
      ?auto_237821 - BLOCK
      ?auto_237822 - BLOCK
      ?auto_237823 - BLOCK
    )
    :vars
    (
      ?auto_237824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237823 ?auto_237824 ) ( ON-TABLE ?auto_237815 ) ( ON ?auto_237816 ?auto_237815 ) ( ON ?auto_237817 ?auto_237816 ) ( not ( = ?auto_237815 ?auto_237816 ) ) ( not ( = ?auto_237815 ?auto_237817 ) ) ( not ( = ?auto_237815 ?auto_237818 ) ) ( not ( = ?auto_237815 ?auto_237819 ) ) ( not ( = ?auto_237815 ?auto_237820 ) ) ( not ( = ?auto_237815 ?auto_237821 ) ) ( not ( = ?auto_237815 ?auto_237822 ) ) ( not ( = ?auto_237815 ?auto_237823 ) ) ( not ( = ?auto_237815 ?auto_237824 ) ) ( not ( = ?auto_237816 ?auto_237817 ) ) ( not ( = ?auto_237816 ?auto_237818 ) ) ( not ( = ?auto_237816 ?auto_237819 ) ) ( not ( = ?auto_237816 ?auto_237820 ) ) ( not ( = ?auto_237816 ?auto_237821 ) ) ( not ( = ?auto_237816 ?auto_237822 ) ) ( not ( = ?auto_237816 ?auto_237823 ) ) ( not ( = ?auto_237816 ?auto_237824 ) ) ( not ( = ?auto_237817 ?auto_237818 ) ) ( not ( = ?auto_237817 ?auto_237819 ) ) ( not ( = ?auto_237817 ?auto_237820 ) ) ( not ( = ?auto_237817 ?auto_237821 ) ) ( not ( = ?auto_237817 ?auto_237822 ) ) ( not ( = ?auto_237817 ?auto_237823 ) ) ( not ( = ?auto_237817 ?auto_237824 ) ) ( not ( = ?auto_237818 ?auto_237819 ) ) ( not ( = ?auto_237818 ?auto_237820 ) ) ( not ( = ?auto_237818 ?auto_237821 ) ) ( not ( = ?auto_237818 ?auto_237822 ) ) ( not ( = ?auto_237818 ?auto_237823 ) ) ( not ( = ?auto_237818 ?auto_237824 ) ) ( not ( = ?auto_237819 ?auto_237820 ) ) ( not ( = ?auto_237819 ?auto_237821 ) ) ( not ( = ?auto_237819 ?auto_237822 ) ) ( not ( = ?auto_237819 ?auto_237823 ) ) ( not ( = ?auto_237819 ?auto_237824 ) ) ( not ( = ?auto_237820 ?auto_237821 ) ) ( not ( = ?auto_237820 ?auto_237822 ) ) ( not ( = ?auto_237820 ?auto_237823 ) ) ( not ( = ?auto_237820 ?auto_237824 ) ) ( not ( = ?auto_237821 ?auto_237822 ) ) ( not ( = ?auto_237821 ?auto_237823 ) ) ( not ( = ?auto_237821 ?auto_237824 ) ) ( not ( = ?auto_237822 ?auto_237823 ) ) ( not ( = ?auto_237822 ?auto_237824 ) ) ( not ( = ?auto_237823 ?auto_237824 ) ) ( ON ?auto_237822 ?auto_237823 ) ( ON ?auto_237821 ?auto_237822 ) ( ON ?auto_237820 ?auto_237821 ) ( ON ?auto_237819 ?auto_237820 ) ( CLEAR ?auto_237817 ) ( ON ?auto_237818 ?auto_237819 ) ( CLEAR ?auto_237818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237815 ?auto_237816 ?auto_237817 ?auto_237818 )
      ( MAKE-9PILE ?auto_237815 ?auto_237816 ?auto_237817 ?auto_237818 ?auto_237819 ?auto_237820 ?auto_237821 ?auto_237822 ?auto_237823 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237834 - BLOCK
      ?auto_237835 - BLOCK
      ?auto_237836 - BLOCK
      ?auto_237837 - BLOCK
      ?auto_237838 - BLOCK
      ?auto_237839 - BLOCK
      ?auto_237840 - BLOCK
      ?auto_237841 - BLOCK
      ?auto_237842 - BLOCK
    )
    :vars
    (
      ?auto_237843 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237842 ?auto_237843 ) ( ON-TABLE ?auto_237834 ) ( ON ?auto_237835 ?auto_237834 ) ( ON ?auto_237836 ?auto_237835 ) ( not ( = ?auto_237834 ?auto_237835 ) ) ( not ( = ?auto_237834 ?auto_237836 ) ) ( not ( = ?auto_237834 ?auto_237837 ) ) ( not ( = ?auto_237834 ?auto_237838 ) ) ( not ( = ?auto_237834 ?auto_237839 ) ) ( not ( = ?auto_237834 ?auto_237840 ) ) ( not ( = ?auto_237834 ?auto_237841 ) ) ( not ( = ?auto_237834 ?auto_237842 ) ) ( not ( = ?auto_237834 ?auto_237843 ) ) ( not ( = ?auto_237835 ?auto_237836 ) ) ( not ( = ?auto_237835 ?auto_237837 ) ) ( not ( = ?auto_237835 ?auto_237838 ) ) ( not ( = ?auto_237835 ?auto_237839 ) ) ( not ( = ?auto_237835 ?auto_237840 ) ) ( not ( = ?auto_237835 ?auto_237841 ) ) ( not ( = ?auto_237835 ?auto_237842 ) ) ( not ( = ?auto_237835 ?auto_237843 ) ) ( not ( = ?auto_237836 ?auto_237837 ) ) ( not ( = ?auto_237836 ?auto_237838 ) ) ( not ( = ?auto_237836 ?auto_237839 ) ) ( not ( = ?auto_237836 ?auto_237840 ) ) ( not ( = ?auto_237836 ?auto_237841 ) ) ( not ( = ?auto_237836 ?auto_237842 ) ) ( not ( = ?auto_237836 ?auto_237843 ) ) ( not ( = ?auto_237837 ?auto_237838 ) ) ( not ( = ?auto_237837 ?auto_237839 ) ) ( not ( = ?auto_237837 ?auto_237840 ) ) ( not ( = ?auto_237837 ?auto_237841 ) ) ( not ( = ?auto_237837 ?auto_237842 ) ) ( not ( = ?auto_237837 ?auto_237843 ) ) ( not ( = ?auto_237838 ?auto_237839 ) ) ( not ( = ?auto_237838 ?auto_237840 ) ) ( not ( = ?auto_237838 ?auto_237841 ) ) ( not ( = ?auto_237838 ?auto_237842 ) ) ( not ( = ?auto_237838 ?auto_237843 ) ) ( not ( = ?auto_237839 ?auto_237840 ) ) ( not ( = ?auto_237839 ?auto_237841 ) ) ( not ( = ?auto_237839 ?auto_237842 ) ) ( not ( = ?auto_237839 ?auto_237843 ) ) ( not ( = ?auto_237840 ?auto_237841 ) ) ( not ( = ?auto_237840 ?auto_237842 ) ) ( not ( = ?auto_237840 ?auto_237843 ) ) ( not ( = ?auto_237841 ?auto_237842 ) ) ( not ( = ?auto_237841 ?auto_237843 ) ) ( not ( = ?auto_237842 ?auto_237843 ) ) ( ON ?auto_237841 ?auto_237842 ) ( ON ?auto_237840 ?auto_237841 ) ( ON ?auto_237839 ?auto_237840 ) ( ON ?auto_237838 ?auto_237839 ) ( CLEAR ?auto_237836 ) ( ON ?auto_237837 ?auto_237838 ) ( CLEAR ?auto_237837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_237834 ?auto_237835 ?auto_237836 ?auto_237837 )
      ( MAKE-9PILE ?auto_237834 ?auto_237835 ?auto_237836 ?auto_237837 ?auto_237838 ?auto_237839 ?auto_237840 ?auto_237841 ?auto_237842 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237853 - BLOCK
      ?auto_237854 - BLOCK
      ?auto_237855 - BLOCK
      ?auto_237856 - BLOCK
      ?auto_237857 - BLOCK
      ?auto_237858 - BLOCK
      ?auto_237859 - BLOCK
      ?auto_237860 - BLOCK
      ?auto_237861 - BLOCK
    )
    :vars
    (
      ?auto_237862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237861 ?auto_237862 ) ( ON-TABLE ?auto_237853 ) ( ON ?auto_237854 ?auto_237853 ) ( not ( = ?auto_237853 ?auto_237854 ) ) ( not ( = ?auto_237853 ?auto_237855 ) ) ( not ( = ?auto_237853 ?auto_237856 ) ) ( not ( = ?auto_237853 ?auto_237857 ) ) ( not ( = ?auto_237853 ?auto_237858 ) ) ( not ( = ?auto_237853 ?auto_237859 ) ) ( not ( = ?auto_237853 ?auto_237860 ) ) ( not ( = ?auto_237853 ?auto_237861 ) ) ( not ( = ?auto_237853 ?auto_237862 ) ) ( not ( = ?auto_237854 ?auto_237855 ) ) ( not ( = ?auto_237854 ?auto_237856 ) ) ( not ( = ?auto_237854 ?auto_237857 ) ) ( not ( = ?auto_237854 ?auto_237858 ) ) ( not ( = ?auto_237854 ?auto_237859 ) ) ( not ( = ?auto_237854 ?auto_237860 ) ) ( not ( = ?auto_237854 ?auto_237861 ) ) ( not ( = ?auto_237854 ?auto_237862 ) ) ( not ( = ?auto_237855 ?auto_237856 ) ) ( not ( = ?auto_237855 ?auto_237857 ) ) ( not ( = ?auto_237855 ?auto_237858 ) ) ( not ( = ?auto_237855 ?auto_237859 ) ) ( not ( = ?auto_237855 ?auto_237860 ) ) ( not ( = ?auto_237855 ?auto_237861 ) ) ( not ( = ?auto_237855 ?auto_237862 ) ) ( not ( = ?auto_237856 ?auto_237857 ) ) ( not ( = ?auto_237856 ?auto_237858 ) ) ( not ( = ?auto_237856 ?auto_237859 ) ) ( not ( = ?auto_237856 ?auto_237860 ) ) ( not ( = ?auto_237856 ?auto_237861 ) ) ( not ( = ?auto_237856 ?auto_237862 ) ) ( not ( = ?auto_237857 ?auto_237858 ) ) ( not ( = ?auto_237857 ?auto_237859 ) ) ( not ( = ?auto_237857 ?auto_237860 ) ) ( not ( = ?auto_237857 ?auto_237861 ) ) ( not ( = ?auto_237857 ?auto_237862 ) ) ( not ( = ?auto_237858 ?auto_237859 ) ) ( not ( = ?auto_237858 ?auto_237860 ) ) ( not ( = ?auto_237858 ?auto_237861 ) ) ( not ( = ?auto_237858 ?auto_237862 ) ) ( not ( = ?auto_237859 ?auto_237860 ) ) ( not ( = ?auto_237859 ?auto_237861 ) ) ( not ( = ?auto_237859 ?auto_237862 ) ) ( not ( = ?auto_237860 ?auto_237861 ) ) ( not ( = ?auto_237860 ?auto_237862 ) ) ( not ( = ?auto_237861 ?auto_237862 ) ) ( ON ?auto_237860 ?auto_237861 ) ( ON ?auto_237859 ?auto_237860 ) ( ON ?auto_237858 ?auto_237859 ) ( ON ?auto_237857 ?auto_237858 ) ( ON ?auto_237856 ?auto_237857 ) ( CLEAR ?auto_237854 ) ( ON ?auto_237855 ?auto_237856 ) ( CLEAR ?auto_237855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237853 ?auto_237854 ?auto_237855 )
      ( MAKE-9PILE ?auto_237853 ?auto_237854 ?auto_237855 ?auto_237856 ?auto_237857 ?auto_237858 ?auto_237859 ?auto_237860 ?auto_237861 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237872 - BLOCK
      ?auto_237873 - BLOCK
      ?auto_237874 - BLOCK
      ?auto_237875 - BLOCK
      ?auto_237876 - BLOCK
      ?auto_237877 - BLOCK
      ?auto_237878 - BLOCK
      ?auto_237879 - BLOCK
      ?auto_237880 - BLOCK
    )
    :vars
    (
      ?auto_237881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237880 ?auto_237881 ) ( ON-TABLE ?auto_237872 ) ( ON ?auto_237873 ?auto_237872 ) ( not ( = ?auto_237872 ?auto_237873 ) ) ( not ( = ?auto_237872 ?auto_237874 ) ) ( not ( = ?auto_237872 ?auto_237875 ) ) ( not ( = ?auto_237872 ?auto_237876 ) ) ( not ( = ?auto_237872 ?auto_237877 ) ) ( not ( = ?auto_237872 ?auto_237878 ) ) ( not ( = ?auto_237872 ?auto_237879 ) ) ( not ( = ?auto_237872 ?auto_237880 ) ) ( not ( = ?auto_237872 ?auto_237881 ) ) ( not ( = ?auto_237873 ?auto_237874 ) ) ( not ( = ?auto_237873 ?auto_237875 ) ) ( not ( = ?auto_237873 ?auto_237876 ) ) ( not ( = ?auto_237873 ?auto_237877 ) ) ( not ( = ?auto_237873 ?auto_237878 ) ) ( not ( = ?auto_237873 ?auto_237879 ) ) ( not ( = ?auto_237873 ?auto_237880 ) ) ( not ( = ?auto_237873 ?auto_237881 ) ) ( not ( = ?auto_237874 ?auto_237875 ) ) ( not ( = ?auto_237874 ?auto_237876 ) ) ( not ( = ?auto_237874 ?auto_237877 ) ) ( not ( = ?auto_237874 ?auto_237878 ) ) ( not ( = ?auto_237874 ?auto_237879 ) ) ( not ( = ?auto_237874 ?auto_237880 ) ) ( not ( = ?auto_237874 ?auto_237881 ) ) ( not ( = ?auto_237875 ?auto_237876 ) ) ( not ( = ?auto_237875 ?auto_237877 ) ) ( not ( = ?auto_237875 ?auto_237878 ) ) ( not ( = ?auto_237875 ?auto_237879 ) ) ( not ( = ?auto_237875 ?auto_237880 ) ) ( not ( = ?auto_237875 ?auto_237881 ) ) ( not ( = ?auto_237876 ?auto_237877 ) ) ( not ( = ?auto_237876 ?auto_237878 ) ) ( not ( = ?auto_237876 ?auto_237879 ) ) ( not ( = ?auto_237876 ?auto_237880 ) ) ( not ( = ?auto_237876 ?auto_237881 ) ) ( not ( = ?auto_237877 ?auto_237878 ) ) ( not ( = ?auto_237877 ?auto_237879 ) ) ( not ( = ?auto_237877 ?auto_237880 ) ) ( not ( = ?auto_237877 ?auto_237881 ) ) ( not ( = ?auto_237878 ?auto_237879 ) ) ( not ( = ?auto_237878 ?auto_237880 ) ) ( not ( = ?auto_237878 ?auto_237881 ) ) ( not ( = ?auto_237879 ?auto_237880 ) ) ( not ( = ?auto_237879 ?auto_237881 ) ) ( not ( = ?auto_237880 ?auto_237881 ) ) ( ON ?auto_237879 ?auto_237880 ) ( ON ?auto_237878 ?auto_237879 ) ( ON ?auto_237877 ?auto_237878 ) ( ON ?auto_237876 ?auto_237877 ) ( ON ?auto_237875 ?auto_237876 ) ( CLEAR ?auto_237873 ) ( ON ?auto_237874 ?auto_237875 ) ( CLEAR ?auto_237874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_237872 ?auto_237873 ?auto_237874 )
      ( MAKE-9PILE ?auto_237872 ?auto_237873 ?auto_237874 ?auto_237875 ?auto_237876 ?auto_237877 ?auto_237878 ?auto_237879 ?auto_237880 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237891 - BLOCK
      ?auto_237892 - BLOCK
      ?auto_237893 - BLOCK
      ?auto_237894 - BLOCK
      ?auto_237895 - BLOCK
      ?auto_237896 - BLOCK
      ?auto_237897 - BLOCK
      ?auto_237898 - BLOCK
      ?auto_237899 - BLOCK
    )
    :vars
    (
      ?auto_237900 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237899 ?auto_237900 ) ( ON-TABLE ?auto_237891 ) ( not ( = ?auto_237891 ?auto_237892 ) ) ( not ( = ?auto_237891 ?auto_237893 ) ) ( not ( = ?auto_237891 ?auto_237894 ) ) ( not ( = ?auto_237891 ?auto_237895 ) ) ( not ( = ?auto_237891 ?auto_237896 ) ) ( not ( = ?auto_237891 ?auto_237897 ) ) ( not ( = ?auto_237891 ?auto_237898 ) ) ( not ( = ?auto_237891 ?auto_237899 ) ) ( not ( = ?auto_237891 ?auto_237900 ) ) ( not ( = ?auto_237892 ?auto_237893 ) ) ( not ( = ?auto_237892 ?auto_237894 ) ) ( not ( = ?auto_237892 ?auto_237895 ) ) ( not ( = ?auto_237892 ?auto_237896 ) ) ( not ( = ?auto_237892 ?auto_237897 ) ) ( not ( = ?auto_237892 ?auto_237898 ) ) ( not ( = ?auto_237892 ?auto_237899 ) ) ( not ( = ?auto_237892 ?auto_237900 ) ) ( not ( = ?auto_237893 ?auto_237894 ) ) ( not ( = ?auto_237893 ?auto_237895 ) ) ( not ( = ?auto_237893 ?auto_237896 ) ) ( not ( = ?auto_237893 ?auto_237897 ) ) ( not ( = ?auto_237893 ?auto_237898 ) ) ( not ( = ?auto_237893 ?auto_237899 ) ) ( not ( = ?auto_237893 ?auto_237900 ) ) ( not ( = ?auto_237894 ?auto_237895 ) ) ( not ( = ?auto_237894 ?auto_237896 ) ) ( not ( = ?auto_237894 ?auto_237897 ) ) ( not ( = ?auto_237894 ?auto_237898 ) ) ( not ( = ?auto_237894 ?auto_237899 ) ) ( not ( = ?auto_237894 ?auto_237900 ) ) ( not ( = ?auto_237895 ?auto_237896 ) ) ( not ( = ?auto_237895 ?auto_237897 ) ) ( not ( = ?auto_237895 ?auto_237898 ) ) ( not ( = ?auto_237895 ?auto_237899 ) ) ( not ( = ?auto_237895 ?auto_237900 ) ) ( not ( = ?auto_237896 ?auto_237897 ) ) ( not ( = ?auto_237896 ?auto_237898 ) ) ( not ( = ?auto_237896 ?auto_237899 ) ) ( not ( = ?auto_237896 ?auto_237900 ) ) ( not ( = ?auto_237897 ?auto_237898 ) ) ( not ( = ?auto_237897 ?auto_237899 ) ) ( not ( = ?auto_237897 ?auto_237900 ) ) ( not ( = ?auto_237898 ?auto_237899 ) ) ( not ( = ?auto_237898 ?auto_237900 ) ) ( not ( = ?auto_237899 ?auto_237900 ) ) ( ON ?auto_237898 ?auto_237899 ) ( ON ?auto_237897 ?auto_237898 ) ( ON ?auto_237896 ?auto_237897 ) ( ON ?auto_237895 ?auto_237896 ) ( ON ?auto_237894 ?auto_237895 ) ( ON ?auto_237893 ?auto_237894 ) ( CLEAR ?auto_237891 ) ( ON ?auto_237892 ?auto_237893 ) ( CLEAR ?auto_237892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237891 ?auto_237892 )
      ( MAKE-9PILE ?auto_237891 ?auto_237892 ?auto_237893 ?auto_237894 ?auto_237895 ?auto_237896 ?auto_237897 ?auto_237898 ?auto_237899 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237910 - BLOCK
      ?auto_237911 - BLOCK
      ?auto_237912 - BLOCK
      ?auto_237913 - BLOCK
      ?auto_237914 - BLOCK
      ?auto_237915 - BLOCK
      ?auto_237916 - BLOCK
      ?auto_237917 - BLOCK
      ?auto_237918 - BLOCK
    )
    :vars
    (
      ?auto_237919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237918 ?auto_237919 ) ( ON-TABLE ?auto_237910 ) ( not ( = ?auto_237910 ?auto_237911 ) ) ( not ( = ?auto_237910 ?auto_237912 ) ) ( not ( = ?auto_237910 ?auto_237913 ) ) ( not ( = ?auto_237910 ?auto_237914 ) ) ( not ( = ?auto_237910 ?auto_237915 ) ) ( not ( = ?auto_237910 ?auto_237916 ) ) ( not ( = ?auto_237910 ?auto_237917 ) ) ( not ( = ?auto_237910 ?auto_237918 ) ) ( not ( = ?auto_237910 ?auto_237919 ) ) ( not ( = ?auto_237911 ?auto_237912 ) ) ( not ( = ?auto_237911 ?auto_237913 ) ) ( not ( = ?auto_237911 ?auto_237914 ) ) ( not ( = ?auto_237911 ?auto_237915 ) ) ( not ( = ?auto_237911 ?auto_237916 ) ) ( not ( = ?auto_237911 ?auto_237917 ) ) ( not ( = ?auto_237911 ?auto_237918 ) ) ( not ( = ?auto_237911 ?auto_237919 ) ) ( not ( = ?auto_237912 ?auto_237913 ) ) ( not ( = ?auto_237912 ?auto_237914 ) ) ( not ( = ?auto_237912 ?auto_237915 ) ) ( not ( = ?auto_237912 ?auto_237916 ) ) ( not ( = ?auto_237912 ?auto_237917 ) ) ( not ( = ?auto_237912 ?auto_237918 ) ) ( not ( = ?auto_237912 ?auto_237919 ) ) ( not ( = ?auto_237913 ?auto_237914 ) ) ( not ( = ?auto_237913 ?auto_237915 ) ) ( not ( = ?auto_237913 ?auto_237916 ) ) ( not ( = ?auto_237913 ?auto_237917 ) ) ( not ( = ?auto_237913 ?auto_237918 ) ) ( not ( = ?auto_237913 ?auto_237919 ) ) ( not ( = ?auto_237914 ?auto_237915 ) ) ( not ( = ?auto_237914 ?auto_237916 ) ) ( not ( = ?auto_237914 ?auto_237917 ) ) ( not ( = ?auto_237914 ?auto_237918 ) ) ( not ( = ?auto_237914 ?auto_237919 ) ) ( not ( = ?auto_237915 ?auto_237916 ) ) ( not ( = ?auto_237915 ?auto_237917 ) ) ( not ( = ?auto_237915 ?auto_237918 ) ) ( not ( = ?auto_237915 ?auto_237919 ) ) ( not ( = ?auto_237916 ?auto_237917 ) ) ( not ( = ?auto_237916 ?auto_237918 ) ) ( not ( = ?auto_237916 ?auto_237919 ) ) ( not ( = ?auto_237917 ?auto_237918 ) ) ( not ( = ?auto_237917 ?auto_237919 ) ) ( not ( = ?auto_237918 ?auto_237919 ) ) ( ON ?auto_237917 ?auto_237918 ) ( ON ?auto_237916 ?auto_237917 ) ( ON ?auto_237915 ?auto_237916 ) ( ON ?auto_237914 ?auto_237915 ) ( ON ?auto_237913 ?auto_237914 ) ( ON ?auto_237912 ?auto_237913 ) ( CLEAR ?auto_237910 ) ( ON ?auto_237911 ?auto_237912 ) ( CLEAR ?auto_237911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237910 ?auto_237911 )
      ( MAKE-9PILE ?auto_237910 ?auto_237911 ?auto_237912 ?auto_237913 ?auto_237914 ?auto_237915 ?auto_237916 ?auto_237917 ?auto_237918 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237929 - BLOCK
      ?auto_237930 - BLOCK
      ?auto_237931 - BLOCK
      ?auto_237932 - BLOCK
      ?auto_237933 - BLOCK
      ?auto_237934 - BLOCK
      ?auto_237935 - BLOCK
      ?auto_237936 - BLOCK
      ?auto_237937 - BLOCK
    )
    :vars
    (
      ?auto_237938 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237937 ?auto_237938 ) ( not ( = ?auto_237929 ?auto_237930 ) ) ( not ( = ?auto_237929 ?auto_237931 ) ) ( not ( = ?auto_237929 ?auto_237932 ) ) ( not ( = ?auto_237929 ?auto_237933 ) ) ( not ( = ?auto_237929 ?auto_237934 ) ) ( not ( = ?auto_237929 ?auto_237935 ) ) ( not ( = ?auto_237929 ?auto_237936 ) ) ( not ( = ?auto_237929 ?auto_237937 ) ) ( not ( = ?auto_237929 ?auto_237938 ) ) ( not ( = ?auto_237930 ?auto_237931 ) ) ( not ( = ?auto_237930 ?auto_237932 ) ) ( not ( = ?auto_237930 ?auto_237933 ) ) ( not ( = ?auto_237930 ?auto_237934 ) ) ( not ( = ?auto_237930 ?auto_237935 ) ) ( not ( = ?auto_237930 ?auto_237936 ) ) ( not ( = ?auto_237930 ?auto_237937 ) ) ( not ( = ?auto_237930 ?auto_237938 ) ) ( not ( = ?auto_237931 ?auto_237932 ) ) ( not ( = ?auto_237931 ?auto_237933 ) ) ( not ( = ?auto_237931 ?auto_237934 ) ) ( not ( = ?auto_237931 ?auto_237935 ) ) ( not ( = ?auto_237931 ?auto_237936 ) ) ( not ( = ?auto_237931 ?auto_237937 ) ) ( not ( = ?auto_237931 ?auto_237938 ) ) ( not ( = ?auto_237932 ?auto_237933 ) ) ( not ( = ?auto_237932 ?auto_237934 ) ) ( not ( = ?auto_237932 ?auto_237935 ) ) ( not ( = ?auto_237932 ?auto_237936 ) ) ( not ( = ?auto_237932 ?auto_237937 ) ) ( not ( = ?auto_237932 ?auto_237938 ) ) ( not ( = ?auto_237933 ?auto_237934 ) ) ( not ( = ?auto_237933 ?auto_237935 ) ) ( not ( = ?auto_237933 ?auto_237936 ) ) ( not ( = ?auto_237933 ?auto_237937 ) ) ( not ( = ?auto_237933 ?auto_237938 ) ) ( not ( = ?auto_237934 ?auto_237935 ) ) ( not ( = ?auto_237934 ?auto_237936 ) ) ( not ( = ?auto_237934 ?auto_237937 ) ) ( not ( = ?auto_237934 ?auto_237938 ) ) ( not ( = ?auto_237935 ?auto_237936 ) ) ( not ( = ?auto_237935 ?auto_237937 ) ) ( not ( = ?auto_237935 ?auto_237938 ) ) ( not ( = ?auto_237936 ?auto_237937 ) ) ( not ( = ?auto_237936 ?auto_237938 ) ) ( not ( = ?auto_237937 ?auto_237938 ) ) ( ON ?auto_237936 ?auto_237937 ) ( ON ?auto_237935 ?auto_237936 ) ( ON ?auto_237934 ?auto_237935 ) ( ON ?auto_237933 ?auto_237934 ) ( ON ?auto_237932 ?auto_237933 ) ( ON ?auto_237931 ?auto_237932 ) ( ON ?auto_237930 ?auto_237931 ) ( ON ?auto_237929 ?auto_237930 ) ( CLEAR ?auto_237929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237929 )
      ( MAKE-9PILE ?auto_237929 ?auto_237930 ?auto_237931 ?auto_237932 ?auto_237933 ?auto_237934 ?auto_237935 ?auto_237936 ?auto_237937 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_237948 - BLOCK
      ?auto_237949 - BLOCK
      ?auto_237950 - BLOCK
      ?auto_237951 - BLOCK
      ?auto_237952 - BLOCK
      ?auto_237953 - BLOCK
      ?auto_237954 - BLOCK
      ?auto_237955 - BLOCK
      ?auto_237956 - BLOCK
    )
    :vars
    (
      ?auto_237957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_237956 ?auto_237957 ) ( not ( = ?auto_237948 ?auto_237949 ) ) ( not ( = ?auto_237948 ?auto_237950 ) ) ( not ( = ?auto_237948 ?auto_237951 ) ) ( not ( = ?auto_237948 ?auto_237952 ) ) ( not ( = ?auto_237948 ?auto_237953 ) ) ( not ( = ?auto_237948 ?auto_237954 ) ) ( not ( = ?auto_237948 ?auto_237955 ) ) ( not ( = ?auto_237948 ?auto_237956 ) ) ( not ( = ?auto_237948 ?auto_237957 ) ) ( not ( = ?auto_237949 ?auto_237950 ) ) ( not ( = ?auto_237949 ?auto_237951 ) ) ( not ( = ?auto_237949 ?auto_237952 ) ) ( not ( = ?auto_237949 ?auto_237953 ) ) ( not ( = ?auto_237949 ?auto_237954 ) ) ( not ( = ?auto_237949 ?auto_237955 ) ) ( not ( = ?auto_237949 ?auto_237956 ) ) ( not ( = ?auto_237949 ?auto_237957 ) ) ( not ( = ?auto_237950 ?auto_237951 ) ) ( not ( = ?auto_237950 ?auto_237952 ) ) ( not ( = ?auto_237950 ?auto_237953 ) ) ( not ( = ?auto_237950 ?auto_237954 ) ) ( not ( = ?auto_237950 ?auto_237955 ) ) ( not ( = ?auto_237950 ?auto_237956 ) ) ( not ( = ?auto_237950 ?auto_237957 ) ) ( not ( = ?auto_237951 ?auto_237952 ) ) ( not ( = ?auto_237951 ?auto_237953 ) ) ( not ( = ?auto_237951 ?auto_237954 ) ) ( not ( = ?auto_237951 ?auto_237955 ) ) ( not ( = ?auto_237951 ?auto_237956 ) ) ( not ( = ?auto_237951 ?auto_237957 ) ) ( not ( = ?auto_237952 ?auto_237953 ) ) ( not ( = ?auto_237952 ?auto_237954 ) ) ( not ( = ?auto_237952 ?auto_237955 ) ) ( not ( = ?auto_237952 ?auto_237956 ) ) ( not ( = ?auto_237952 ?auto_237957 ) ) ( not ( = ?auto_237953 ?auto_237954 ) ) ( not ( = ?auto_237953 ?auto_237955 ) ) ( not ( = ?auto_237953 ?auto_237956 ) ) ( not ( = ?auto_237953 ?auto_237957 ) ) ( not ( = ?auto_237954 ?auto_237955 ) ) ( not ( = ?auto_237954 ?auto_237956 ) ) ( not ( = ?auto_237954 ?auto_237957 ) ) ( not ( = ?auto_237955 ?auto_237956 ) ) ( not ( = ?auto_237955 ?auto_237957 ) ) ( not ( = ?auto_237956 ?auto_237957 ) ) ( ON ?auto_237955 ?auto_237956 ) ( ON ?auto_237954 ?auto_237955 ) ( ON ?auto_237953 ?auto_237954 ) ( ON ?auto_237952 ?auto_237953 ) ( ON ?auto_237951 ?auto_237952 ) ( ON ?auto_237950 ?auto_237951 ) ( ON ?auto_237949 ?auto_237950 ) ( ON ?auto_237948 ?auto_237949 ) ( CLEAR ?auto_237948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_237948 )
      ( MAKE-9PILE ?auto_237948 ?auto_237949 ?auto_237950 ?auto_237951 ?auto_237952 ?auto_237953 ?auto_237954 ?auto_237955 ?auto_237956 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_237968 - BLOCK
      ?auto_237969 - BLOCK
      ?auto_237970 - BLOCK
      ?auto_237971 - BLOCK
      ?auto_237972 - BLOCK
      ?auto_237973 - BLOCK
      ?auto_237974 - BLOCK
      ?auto_237975 - BLOCK
      ?auto_237976 - BLOCK
      ?auto_237977 - BLOCK
    )
    :vars
    (
      ?auto_237978 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237976 ) ( ON ?auto_237977 ?auto_237978 ) ( CLEAR ?auto_237977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237968 ) ( ON ?auto_237969 ?auto_237968 ) ( ON ?auto_237970 ?auto_237969 ) ( ON ?auto_237971 ?auto_237970 ) ( ON ?auto_237972 ?auto_237971 ) ( ON ?auto_237973 ?auto_237972 ) ( ON ?auto_237974 ?auto_237973 ) ( ON ?auto_237975 ?auto_237974 ) ( ON ?auto_237976 ?auto_237975 ) ( not ( = ?auto_237968 ?auto_237969 ) ) ( not ( = ?auto_237968 ?auto_237970 ) ) ( not ( = ?auto_237968 ?auto_237971 ) ) ( not ( = ?auto_237968 ?auto_237972 ) ) ( not ( = ?auto_237968 ?auto_237973 ) ) ( not ( = ?auto_237968 ?auto_237974 ) ) ( not ( = ?auto_237968 ?auto_237975 ) ) ( not ( = ?auto_237968 ?auto_237976 ) ) ( not ( = ?auto_237968 ?auto_237977 ) ) ( not ( = ?auto_237968 ?auto_237978 ) ) ( not ( = ?auto_237969 ?auto_237970 ) ) ( not ( = ?auto_237969 ?auto_237971 ) ) ( not ( = ?auto_237969 ?auto_237972 ) ) ( not ( = ?auto_237969 ?auto_237973 ) ) ( not ( = ?auto_237969 ?auto_237974 ) ) ( not ( = ?auto_237969 ?auto_237975 ) ) ( not ( = ?auto_237969 ?auto_237976 ) ) ( not ( = ?auto_237969 ?auto_237977 ) ) ( not ( = ?auto_237969 ?auto_237978 ) ) ( not ( = ?auto_237970 ?auto_237971 ) ) ( not ( = ?auto_237970 ?auto_237972 ) ) ( not ( = ?auto_237970 ?auto_237973 ) ) ( not ( = ?auto_237970 ?auto_237974 ) ) ( not ( = ?auto_237970 ?auto_237975 ) ) ( not ( = ?auto_237970 ?auto_237976 ) ) ( not ( = ?auto_237970 ?auto_237977 ) ) ( not ( = ?auto_237970 ?auto_237978 ) ) ( not ( = ?auto_237971 ?auto_237972 ) ) ( not ( = ?auto_237971 ?auto_237973 ) ) ( not ( = ?auto_237971 ?auto_237974 ) ) ( not ( = ?auto_237971 ?auto_237975 ) ) ( not ( = ?auto_237971 ?auto_237976 ) ) ( not ( = ?auto_237971 ?auto_237977 ) ) ( not ( = ?auto_237971 ?auto_237978 ) ) ( not ( = ?auto_237972 ?auto_237973 ) ) ( not ( = ?auto_237972 ?auto_237974 ) ) ( not ( = ?auto_237972 ?auto_237975 ) ) ( not ( = ?auto_237972 ?auto_237976 ) ) ( not ( = ?auto_237972 ?auto_237977 ) ) ( not ( = ?auto_237972 ?auto_237978 ) ) ( not ( = ?auto_237973 ?auto_237974 ) ) ( not ( = ?auto_237973 ?auto_237975 ) ) ( not ( = ?auto_237973 ?auto_237976 ) ) ( not ( = ?auto_237973 ?auto_237977 ) ) ( not ( = ?auto_237973 ?auto_237978 ) ) ( not ( = ?auto_237974 ?auto_237975 ) ) ( not ( = ?auto_237974 ?auto_237976 ) ) ( not ( = ?auto_237974 ?auto_237977 ) ) ( not ( = ?auto_237974 ?auto_237978 ) ) ( not ( = ?auto_237975 ?auto_237976 ) ) ( not ( = ?auto_237975 ?auto_237977 ) ) ( not ( = ?auto_237975 ?auto_237978 ) ) ( not ( = ?auto_237976 ?auto_237977 ) ) ( not ( = ?auto_237976 ?auto_237978 ) ) ( not ( = ?auto_237977 ?auto_237978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237977 ?auto_237978 )
      ( !STACK ?auto_237977 ?auto_237976 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_237989 - BLOCK
      ?auto_237990 - BLOCK
      ?auto_237991 - BLOCK
      ?auto_237992 - BLOCK
      ?auto_237993 - BLOCK
      ?auto_237994 - BLOCK
      ?auto_237995 - BLOCK
      ?auto_237996 - BLOCK
      ?auto_237997 - BLOCK
      ?auto_237998 - BLOCK
    )
    :vars
    (
      ?auto_237999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_237997 ) ( ON ?auto_237998 ?auto_237999 ) ( CLEAR ?auto_237998 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_237989 ) ( ON ?auto_237990 ?auto_237989 ) ( ON ?auto_237991 ?auto_237990 ) ( ON ?auto_237992 ?auto_237991 ) ( ON ?auto_237993 ?auto_237992 ) ( ON ?auto_237994 ?auto_237993 ) ( ON ?auto_237995 ?auto_237994 ) ( ON ?auto_237996 ?auto_237995 ) ( ON ?auto_237997 ?auto_237996 ) ( not ( = ?auto_237989 ?auto_237990 ) ) ( not ( = ?auto_237989 ?auto_237991 ) ) ( not ( = ?auto_237989 ?auto_237992 ) ) ( not ( = ?auto_237989 ?auto_237993 ) ) ( not ( = ?auto_237989 ?auto_237994 ) ) ( not ( = ?auto_237989 ?auto_237995 ) ) ( not ( = ?auto_237989 ?auto_237996 ) ) ( not ( = ?auto_237989 ?auto_237997 ) ) ( not ( = ?auto_237989 ?auto_237998 ) ) ( not ( = ?auto_237989 ?auto_237999 ) ) ( not ( = ?auto_237990 ?auto_237991 ) ) ( not ( = ?auto_237990 ?auto_237992 ) ) ( not ( = ?auto_237990 ?auto_237993 ) ) ( not ( = ?auto_237990 ?auto_237994 ) ) ( not ( = ?auto_237990 ?auto_237995 ) ) ( not ( = ?auto_237990 ?auto_237996 ) ) ( not ( = ?auto_237990 ?auto_237997 ) ) ( not ( = ?auto_237990 ?auto_237998 ) ) ( not ( = ?auto_237990 ?auto_237999 ) ) ( not ( = ?auto_237991 ?auto_237992 ) ) ( not ( = ?auto_237991 ?auto_237993 ) ) ( not ( = ?auto_237991 ?auto_237994 ) ) ( not ( = ?auto_237991 ?auto_237995 ) ) ( not ( = ?auto_237991 ?auto_237996 ) ) ( not ( = ?auto_237991 ?auto_237997 ) ) ( not ( = ?auto_237991 ?auto_237998 ) ) ( not ( = ?auto_237991 ?auto_237999 ) ) ( not ( = ?auto_237992 ?auto_237993 ) ) ( not ( = ?auto_237992 ?auto_237994 ) ) ( not ( = ?auto_237992 ?auto_237995 ) ) ( not ( = ?auto_237992 ?auto_237996 ) ) ( not ( = ?auto_237992 ?auto_237997 ) ) ( not ( = ?auto_237992 ?auto_237998 ) ) ( not ( = ?auto_237992 ?auto_237999 ) ) ( not ( = ?auto_237993 ?auto_237994 ) ) ( not ( = ?auto_237993 ?auto_237995 ) ) ( not ( = ?auto_237993 ?auto_237996 ) ) ( not ( = ?auto_237993 ?auto_237997 ) ) ( not ( = ?auto_237993 ?auto_237998 ) ) ( not ( = ?auto_237993 ?auto_237999 ) ) ( not ( = ?auto_237994 ?auto_237995 ) ) ( not ( = ?auto_237994 ?auto_237996 ) ) ( not ( = ?auto_237994 ?auto_237997 ) ) ( not ( = ?auto_237994 ?auto_237998 ) ) ( not ( = ?auto_237994 ?auto_237999 ) ) ( not ( = ?auto_237995 ?auto_237996 ) ) ( not ( = ?auto_237995 ?auto_237997 ) ) ( not ( = ?auto_237995 ?auto_237998 ) ) ( not ( = ?auto_237995 ?auto_237999 ) ) ( not ( = ?auto_237996 ?auto_237997 ) ) ( not ( = ?auto_237996 ?auto_237998 ) ) ( not ( = ?auto_237996 ?auto_237999 ) ) ( not ( = ?auto_237997 ?auto_237998 ) ) ( not ( = ?auto_237997 ?auto_237999 ) ) ( not ( = ?auto_237998 ?auto_237999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_237998 ?auto_237999 )
      ( !STACK ?auto_237998 ?auto_237997 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238010 - BLOCK
      ?auto_238011 - BLOCK
      ?auto_238012 - BLOCK
      ?auto_238013 - BLOCK
      ?auto_238014 - BLOCK
      ?auto_238015 - BLOCK
      ?auto_238016 - BLOCK
      ?auto_238017 - BLOCK
      ?auto_238018 - BLOCK
      ?auto_238019 - BLOCK
    )
    :vars
    (
      ?auto_238020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238019 ?auto_238020 ) ( ON-TABLE ?auto_238010 ) ( ON ?auto_238011 ?auto_238010 ) ( ON ?auto_238012 ?auto_238011 ) ( ON ?auto_238013 ?auto_238012 ) ( ON ?auto_238014 ?auto_238013 ) ( ON ?auto_238015 ?auto_238014 ) ( ON ?auto_238016 ?auto_238015 ) ( ON ?auto_238017 ?auto_238016 ) ( not ( = ?auto_238010 ?auto_238011 ) ) ( not ( = ?auto_238010 ?auto_238012 ) ) ( not ( = ?auto_238010 ?auto_238013 ) ) ( not ( = ?auto_238010 ?auto_238014 ) ) ( not ( = ?auto_238010 ?auto_238015 ) ) ( not ( = ?auto_238010 ?auto_238016 ) ) ( not ( = ?auto_238010 ?auto_238017 ) ) ( not ( = ?auto_238010 ?auto_238018 ) ) ( not ( = ?auto_238010 ?auto_238019 ) ) ( not ( = ?auto_238010 ?auto_238020 ) ) ( not ( = ?auto_238011 ?auto_238012 ) ) ( not ( = ?auto_238011 ?auto_238013 ) ) ( not ( = ?auto_238011 ?auto_238014 ) ) ( not ( = ?auto_238011 ?auto_238015 ) ) ( not ( = ?auto_238011 ?auto_238016 ) ) ( not ( = ?auto_238011 ?auto_238017 ) ) ( not ( = ?auto_238011 ?auto_238018 ) ) ( not ( = ?auto_238011 ?auto_238019 ) ) ( not ( = ?auto_238011 ?auto_238020 ) ) ( not ( = ?auto_238012 ?auto_238013 ) ) ( not ( = ?auto_238012 ?auto_238014 ) ) ( not ( = ?auto_238012 ?auto_238015 ) ) ( not ( = ?auto_238012 ?auto_238016 ) ) ( not ( = ?auto_238012 ?auto_238017 ) ) ( not ( = ?auto_238012 ?auto_238018 ) ) ( not ( = ?auto_238012 ?auto_238019 ) ) ( not ( = ?auto_238012 ?auto_238020 ) ) ( not ( = ?auto_238013 ?auto_238014 ) ) ( not ( = ?auto_238013 ?auto_238015 ) ) ( not ( = ?auto_238013 ?auto_238016 ) ) ( not ( = ?auto_238013 ?auto_238017 ) ) ( not ( = ?auto_238013 ?auto_238018 ) ) ( not ( = ?auto_238013 ?auto_238019 ) ) ( not ( = ?auto_238013 ?auto_238020 ) ) ( not ( = ?auto_238014 ?auto_238015 ) ) ( not ( = ?auto_238014 ?auto_238016 ) ) ( not ( = ?auto_238014 ?auto_238017 ) ) ( not ( = ?auto_238014 ?auto_238018 ) ) ( not ( = ?auto_238014 ?auto_238019 ) ) ( not ( = ?auto_238014 ?auto_238020 ) ) ( not ( = ?auto_238015 ?auto_238016 ) ) ( not ( = ?auto_238015 ?auto_238017 ) ) ( not ( = ?auto_238015 ?auto_238018 ) ) ( not ( = ?auto_238015 ?auto_238019 ) ) ( not ( = ?auto_238015 ?auto_238020 ) ) ( not ( = ?auto_238016 ?auto_238017 ) ) ( not ( = ?auto_238016 ?auto_238018 ) ) ( not ( = ?auto_238016 ?auto_238019 ) ) ( not ( = ?auto_238016 ?auto_238020 ) ) ( not ( = ?auto_238017 ?auto_238018 ) ) ( not ( = ?auto_238017 ?auto_238019 ) ) ( not ( = ?auto_238017 ?auto_238020 ) ) ( not ( = ?auto_238018 ?auto_238019 ) ) ( not ( = ?auto_238018 ?auto_238020 ) ) ( not ( = ?auto_238019 ?auto_238020 ) ) ( CLEAR ?auto_238017 ) ( ON ?auto_238018 ?auto_238019 ) ( CLEAR ?auto_238018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_238010 ?auto_238011 ?auto_238012 ?auto_238013 ?auto_238014 ?auto_238015 ?auto_238016 ?auto_238017 ?auto_238018 )
      ( MAKE-10PILE ?auto_238010 ?auto_238011 ?auto_238012 ?auto_238013 ?auto_238014 ?auto_238015 ?auto_238016 ?auto_238017 ?auto_238018 ?auto_238019 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238031 - BLOCK
      ?auto_238032 - BLOCK
      ?auto_238033 - BLOCK
      ?auto_238034 - BLOCK
      ?auto_238035 - BLOCK
      ?auto_238036 - BLOCK
      ?auto_238037 - BLOCK
      ?auto_238038 - BLOCK
      ?auto_238039 - BLOCK
      ?auto_238040 - BLOCK
    )
    :vars
    (
      ?auto_238041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238040 ?auto_238041 ) ( ON-TABLE ?auto_238031 ) ( ON ?auto_238032 ?auto_238031 ) ( ON ?auto_238033 ?auto_238032 ) ( ON ?auto_238034 ?auto_238033 ) ( ON ?auto_238035 ?auto_238034 ) ( ON ?auto_238036 ?auto_238035 ) ( ON ?auto_238037 ?auto_238036 ) ( ON ?auto_238038 ?auto_238037 ) ( not ( = ?auto_238031 ?auto_238032 ) ) ( not ( = ?auto_238031 ?auto_238033 ) ) ( not ( = ?auto_238031 ?auto_238034 ) ) ( not ( = ?auto_238031 ?auto_238035 ) ) ( not ( = ?auto_238031 ?auto_238036 ) ) ( not ( = ?auto_238031 ?auto_238037 ) ) ( not ( = ?auto_238031 ?auto_238038 ) ) ( not ( = ?auto_238031 ?auto_238039 ) ) ( not ( = ?auto_238031 ?auto_238040 ) ) ( not ( = ?auto_238031 ?auto_238041 ) ) ( not ( = ?auto_238032 ?auto_238033 ) ) ( not ( = ?auto_238032 ?auto_238034 ) ) ( not ( = ?auto_238032 ?auto_238035 ) ) ( not ( = ?auto_238032 ?auto_238036 ) ) ( not ( = ?auto_238032 ?auto_238037 ) ) ( not ( = ?auto_238032 ?auto_238038 ) ) ( not ( = ?auto_238032 ?auto_238039 ) ) ( not ( = ?auto_238032 ?auto_238040 ) ) ( not ( = ?auto_238032 ?auto_238041 ) ) ( not ( = ?auto_238033 ?auto_238034 ) ) ( not ( = ?auto_238033 ?auto_238035 ) ) ( not ( = ?auto_238033 ?auto_238036 ) ) ( not ( = ?auto_238033 ?auto_238037 ) ) ( not ( = ?auto_238033 ?auto_238038 ) ) ( not ( = ?auto_238033 ?auto_238039 ) ) ( not ( = ?auto_238033 ?auto_238040 ) ) ( not ( = ?auto_238033 ?auto_238041 ) ) ( not ( = ?auto_238034 ?auto_238035 ) ) ( not ( = ?auto_238034 ?auto_238036 ) ) ( not ( = ?auto_238034 ?auto_238037 ) ) ( not ( = ?auto_238034 ?auto_238038 ) ) ( not ( = ?auto_238034 ?auto_238039 ) ) ( not ( = ?auto_238034 ?auto_238040 ) ) ( not ( = ?auto_238034 ?auto_238041 ) ) ( not ( = ?auto_238035 ?auto_238036 ) ) ( not ( = ?auto_238035 ?auto_238037 ) ) ( not ( = ?auto_238035 ?auto_238038 ) ) ( not ( = ?auto_238035 ?auto_238039 ) ) ( not ( = ?auto_238035 ?auto_238040 ) ) ( not ( = ?auto_238035 ?auto_238041 ) ) ( not ( = ?auto_238036 ?auto_238037 ) ) ( not ( = ?auto_238036 ?auto_238038 ) ) ( not ( = ?auto_238036 ?auto_238039 ) ) ( not ( = ?auto_238036 ?auto_238040 ) ) ( not ( = ?auto_238036 ?auto_238041 ) ) ( not ( = ?auto_238037 ?auto_238038 ) ) ( not ( = ?auto_238037 ?auto_238039 ) ) ( not ( = ?auto_238037 ?auto_238040 ) ) ( not ( = ?auto_238037 ?auto_238041 ) ) ( not ( = ?auto_238038 ?auto_238039 ) ) ( not ( = ?auto_238038 ?auto_238040 ) ) ( not ( = ?auto_238038 ?auto_238041 ) ) ( not ( = ?auto_238039 ?auto_238040 ) ) ( not ( = ?auto_238039 ?auto_238041 ) ) ( not ( = ?auto_238040 ?auto_238041 ) ) ( CLEAR ?auto_238038 ) ( ON ?auto_238039 ?auto_238040 ) ( CLEAR ?auto_238039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_238031 ?auto_238032 ?auto_238033 ?auto_238034 ?auto_238035 ?auto_238036 ?auto_238037 ?auto_238038 ?auto_238039 )
      ( MAKE-10PILE ?auto_238031 ?auto_238032 ?auto_238033 ?auto_238034 ?auto_238035 ?auto_238036 ?auto_238037 ?auto_238038 ?auto_238039 ?auto_238040 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238052 - BLOCK
      ?auto_238053 - BLOCK
      ?auto_238054 - BLOCK
      ?auto_238055 - BLOCK
      ?auto_238056 - BLOCK
      ?auto_238057 - BLOCK
      ?auto_238058 - BLOCK
      ?auto_238059 - BLOCK
      ?auto_238060 - BLOCK
      ?auto_238061 - BLOCK
    )
    :vars
    (
      ?auto_238062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238061 ?auto_238062 ) ( ON-TABLE ?auto_238052 ) ( ON ?auto_238053 ?auto_238052 ) ( ON ?auto_238054 ?auto_238053 ) ( ON ?auto_238055 ?auto_238054 ) ( ON ?auto_238056 ?auto_238055 ) ( ON ?auto_238057 ?auto_238056 ) ( ON ?auto_238058 ?auto_238057 ) ( not ( = ?auto_238052 ?auto_238053 ) ) ( not ( = ?auto_238052 ?auto_238054 ) ) ( not ( = ?auto_238052 ?auto_238055 ) ) ( not ( = ?auto_238052 ?auto_238056 ) ) ( not ( = ?auto_238052 ?auto_238057 ) ) ( not ( = ?auto_238052 ?auto_238058 ) ) ( not ( = ?auto_238052 ?auto_238059 ) ) ( not ( = ?auto_238052 ?auto_238060 ) ) ( not ( = ?auto_238052 ?auto_238061 ) ) ( not ( = ?auto_238052 ?auto_238062 ) ) ( not ( = ?auto_238053 ?auto_238054 ) ) ( not ( = ?auto_238053 ?auto_238055 ) ) ( not ( = ?auto_238053 ?auto_238056 ) ) ( not ( = ?auto_238053 ?auto_238057 ) ) ( not ( = ?auto_238053 ?auto_238058 ) ) ( not ( = ?auto_238053 ?auto_238059 ) ) ( not ( = ?auto_238053 ?auto_238060 ) ) ( not ( = ?auto_238053 ?auto_238061 ) ) ( not ( = ?auto_238053 ?auto_238062 ) ) ( not ( = ?auto_238054 ?auto_238055 ) ) ( not ( = ?auto_238054 ?auto_238056 ) ) ( not ( = ?auto_238054 ?auto_238057 ) ) ( not ( = ?auto_238054 ?auto_238058 ) ) ( not ( = ?auto_238054 ?auto_238059 ) ) ( not ( = ?auto_238054 ?auto_238060 ) ) ( not ( = ?auto_238054 ?auto_238061 ) ) ( not ( = ?auto_238054 ?auto_238062 ) ) ( not ( = ?auto_238055 ?auto_238056 ) ) ( not ( = ?auto_238055 ?auto_238057 ) ) ( not ( = ?auto_238055 ?auto_238058 ) ) ( not ( = ?auto_238055 ?auto_238059 ) ) ( not ( = ?auto_238055 ?auto_238060 ) ) ( not ( = ?auto_238055 ?auto_238061 ) ) ( not ( = ?auto_238055 ?auto_238062 ) ) ( not ( = ?auto_238056 ?auto_238057 ) ) ( not ( = ?auto_238056 ?auto_238058 ) ) ( not ( = ?auto_238056 ?auto_238059 ) ) ( not ( = ?auto_238056 ?auto_238060 ) ) ( not ( = ?auto_238056 ?auto_238061 ) ) ( not ( = ?auto_238056 ?auto_238062 ) ) ( not ( = ?auto_238057 ?auto_238058 ) ) ( not ( = ?auto_238057 ?auto_238059 ) ) ( not ( = ?auto_238057 ?auto_238060 ) ) ( not ( = ?auto_238057 ?auto_238061 ) ) ( not ( = ?auto_238057 ?auto_238062 ) ) ( not ( = ?auto_238058 ?auto_238059 ) ) ( not ( = ?auto_238058 ?auto_238060 ) ) ( not ( = ?auto_238058 ?auto_238061 ) ) ( not ( = ?auto_238058 ?auto_238062 ) ) ( not ( = ?auto_238059 ?auto_238060 ) ) ( not ( = ?auto_238059 ?auto_238061 ) ) ( not ( = ?auto_238059 ?auto_238062 ) ) ( not ( = ?auto_238060 ?auto_238061 ) ) ( not ( = ?auto_238060 ?auto_238062 ) ) ( not ( = ?auto_238061 ?auto_238062 ) ) ( ON ?auto_238060 ?auto_238061 ) ( CLEAR ?auto_238058 ) ( ON ?auto_238059 ?auto_238060 ) ( CLEAR ?auto_238059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_238052 ?auto_238053 ?auto_238054 ?auto_238055 ?auto_238056 ?auto_238057 ?auto_238058 ?auto_238059 )
      ( MAKE-10PILE ?auto_238052 ?auto_238053 ?auto_238054 ?auto_238055 ?auto_238056 ?auto_238057 ?auto_238058 ?auto_238059 ?auto_238060 ?auto_238061 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238073 - BLOCK
      ?auto_238074 - BLOCK
      ?auto_238075 - BLOCK
      ?auto_238076 - BLOCK
      ?auto_238077 - BLOCK
      ?auto_238078 - BLOCK
      ?auto_238079 - BLOCK
      ?auto_238080 - BLOCK
      ?auto_238081 - BLOCK
      ?auto_238082 - BLOCK
    )
    :vars
    (
      ?auto_238083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238082 ?auto_238083 ) ( ON-TABLE ?auto_238073 ) ( ON ?auto_238074 ?auto_238073 ) ( ON ?auto_238075 ?auto_238074 ) ( ON ?auto_238076 ?auto_238075 ) ( ON ?auto_238077 ?auto_238076 ) ( ON ?auto_238078 ?auto_238077 ) ( ON ?auto_238079 ?auto_238078 ) ( not ( = ?auto_238073 ?auto_238074 ) ) ( not ( = ?auto_238073 ?auto_238075 ) ) ( not ( = ?auto_238073 ?auto_238076 ) ) ( not ( = ?auto_238073 ?auto_238077 ) ) ( not ( = ?auto_238073 ?auto_238078 ) ) ( not ( = ?auto_238073 ?auto_238079 ) ) ( not ( = ?auto_238073 ?auto_238080 ) ) ( not ( = ?auto_238073 ?auto_238081 ) ) ( not ( = ?auto_238073 ?auto_238082 ) ) ( not ( = ?auto_238073 ?auto_238083 ) ) ( not ( = ?auto_238074 ?auto_238075 ) ) ( not ( = ?auto_238074 ?auto_238076 ) ) ( not ( = ?auto_238074 ?auto_238077 ) ) ( not ( = ?auto_238074 ?auto_238078 ) ) ( not ( = ?auto_238074 ?auto_238079 ) ) ( not ( = ?auto_238074 ?auto_238080 ) ) ( not ( = ?auto_238074 ?auto_238081 ) ) ( not ( = ?auto_238074 ?auto_238082 ) ) ( not ( = ?auto_238074 ?auto_238083 ) ) ( not ( = ?auto_238075 ?auto_238076 ) ) ( not ( = ?auto_238075 ?auto_238077 ) ) ( not ( = ?auto_238075 ?auto_238078 ) ) ( not ( = ?auto_238075 ?auto_238079 ) ) ( not ( = ?auto_238075 ?auto_238080 ) ) ( not ( = ?auto_238075 ?auto_238081 ) ) ( not ( = ?auto_238075 ?auto_238082 ) ) ( not ( = ?auto_238075 ?auto_238083 ) ) ( not ( = ?auto_238076 ?auto_238077 ) ) ( not ( = ?auto_238076 ?auto_238078 ) ) ( not ( = ?auto_238076 ?auto_238079 ) ) ( not ( = ?auto_238076 ?auto_238080 ) ) ( not ( = ?auto_238076 ?auto_238081 ) ) ( not ( = ?auto_238076 ?auto_238082 ) ) ( not ( = ?auto_238076 ?auto_238083 ) ) ( not ( = ?auto_238077 ?auto_238078 ) ) ( not ( = ?auto_238077 ?auto_238079 ) ) ( not ( = ?auto_238077 ?auto_238080 ) ) ( not ( = ?auto_238077 ?auto_238081 ) ) ( not ( = ?auto_238077 ?auto_238082 ) ) ( not ( = ?auto_238077 ?auto_238083 ) ) ( not ( = ?auto_238078 ?auto_238079 ) ) ( not ( = ?auto_238078 ?auto_238080 ) ) ( not ( = ?auto_238078 ?auto_238081 ) ) ( not ( = ?auto_238078 ?auto_238082 ) ) ( not ( = ?auto_238078 ?auto_238083 ) ) ( not ( = ?auto_238079 ?auto_238080 ) ) ( not ( = ?auto_238079 ?auto_238081 ) ) ( not ( = ?auto_238079 ?auto_238082 ) ) ( not ( = ?auto_238079 ?auto_238083 ) ) ( not ( = ?auto_238080 ?auto_238081 ) ) ( not ( = ?auto_238080 ?auto_238082 ) ) ( not ( = ?auto_238080 ?auto_238083 ) ) ( not ( = ?auto_238081 ?auto_238082 ) ) ( not ( = ?auto_238081 ?auto_238083 ) ) ( not ( = ?auto_238082 ?auto_238083 ) ) ( ON ?auto_238081 ?auto_238082 ) ( CLEAR ?auto_238079 ) ( ON ?auto_238080 ?auto_238081 ) ( CLEAR ?auto_238080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_238073 ?auto_238074 ?auto_238075 ?auto_238076 ?auto_238077 ?auto_238078 ?auto_238079 ?auto_238080 )
      ( MAKE-10PILE ?auto_238073 ?auto_238074 ?auto_238075 ?auto_238076 ?auto_238077 ?auto_238078 ?auto_238079 ?auto_238080 ?auto_238081 ?auto_238082 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238094 - BLOCK
      ?auto_238095 - BLOCK
      ?auto_238096 - BLOCK
      ?auto_238097 - BLOCK
      ?auto_238098 - BLOCK
      ?auto_238099 - BLOCK
      ?auto_238100 - BLOCK
      ?auto_238101 - BLOCK
      ?auto_238102 - BLOCK
      ?auto_238103 - BLOCK
    )
    :vars
    (
      ?auto_238104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238103 ?auto_238104 ) ( ON-TABLE ?auto_238094 ) ( ON ?auto_238095 ?auto_238094 ) ( ON ?auto_238096 ?auto_238095 ) ( ON ?auto_238097 ?auto_238096 ) ( ON ?auto_238098 ?auto_238097 ) ( ON ?auto_238099 ?auto_238098 ) ( not ( = ?auto_238094 ?auto_238095 ) ) ( not ( = ?auto_238094 ?auto_238096 ) ) ( not ( = ?auto_238094 ?auto_238097 ) ) ( not ( = ?auto_238094 ?auto_238098 ) ) ( not ( = ?auto_238094 ?auto_238099 ) ) ( not ( = ?auto_238094 ?auto_238100 ) ) ( not ( = ?auto_238094 ?auto_238101 ) ) ( not ( = ?auto_238094 ?auto_238102 ) ) ( not ( = ?auto_238094 ?auto_238103 ) ) ( not ( = ?auto_238094 ?auto_238104 ) ) ( not ( = ?auto_238095 ?auto_238096 ) ) ( not ( = ?auto_238095 ?auto_238097 ) ) ( not ( = ?auto_238095 ?auto_238098 ) ) ( not ( = ?auto_238095 ?auto_238099 ) ) ( not ( = ?auto_238095 ?auto_238100 ) ) ( not ( = ?auto_238095 ?auto_238101 ) ) ( not ( = ?auto_238095 ?auto_238102 ) ) ( not ( = ?auto_238095 ?auto_238103 ) ) ( not ( = ?auto_238095 ?auto_238104 ) ) ( not ( = ?auto_238096 ?auto_238097 ) ) ( not ( = ?auto_238096 ?auto_238098 ) ) ( not ( = ?auto_238096 ?auto_238099 ) ) ( not ( = ?auto_238096 ?auto_238100 ) ) ( not ( = ?auto_238096 ?auto_238101 ) ) ( not ( = ?auto_238096 ?auto_238102 ) ) ( not ( = ?auto_238096 ?auto_238103 ) ) ( not ( = ?auto_238096 ?auto_238104 ) ) ( not ( = ?auto_238097 ?auto_238098 ) ) ( not ( = ?auto_238097 ?auto_238099 ) ) ( not ( = ?auto_238097 ?auto_238100 ) ) ( not ( = ?auto_238097 ?auto_238101 ) ) ( not ( = ?auto_238097 ?auto_238102 ) ) ( not ( = ?auto_238097 ?auto_238103 ) ) ( not ( = ?auto_238097 ?auto_238104 ) ) ( not ( = ?auto_238098 ?auto_238099 ) ) ( not ( = ?auto_238098 ?auto_238100 ) ) ( not ( = ?auto_238098 ?auto_238101 ) ) ( not ( = ?auto_238098 ?auto_238102 ) ) ( not ( = ?auto_238098 ?auto_238103 ) ) ( not ( = ?auto_238098 ?auto_238104 ) ) ( not ( = ?auto_238099 ?auto_238100 ) ) ( not ( = ?auto_238099 ?auto_238101 ) ) ( not ( = ?auto_238099 ?auto_238102 ) ) ( not ( = ?auto_238099 ?auto_238103 ) ) ( not ( = ?auto_238099 ?auto_238104 ) ) ( not ( = ?auto_238100 ?auto_238101 ) ) ( not ( = ?auto_238100 ?auto_238102 ) ) ( not ( = ?auto_238100 ?auto_238103 ) ) ( not ( = ?auto_238100 ?auto_238104 ) ) ( not ( = ?auto_238101 ?auto_238102 ) ) ( not ( = ?auto_238101 ?auto_238103 ) ) ( not ( = ?auto_238101 ?auto_238104 ) ) ( not ( = ?auto_238102 ?auto_238103 ) ) ( not ( = ?auto_238102 ?auto_238104 ) ) ( not ( = ?auto_238103 ?auto_238104 ) ) ( ON ?auto_238102 ?auto_238103 ) ( ON ?auto_238101 ?auto_238102 ) ( CLEAR ?auto_238099 ) ( ON ?auto_238100 ?auto_238101 ) ( CLEAR ?auto_238100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_238094 ?auto_238095 ?auto_238096 ?auto_238097 ?auto_238098 ?auto_238099 ?auto_238100 )
      ( MAKE-10PILE ?auto_238094 ?auto_238095 ?auto_238096 ?auto_238097 ?auto_238098 ?auto_238099 ?auto_238100 ?auto_238101 ?auto_238102 ?auto_238103 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238115 - BLOCK
      ?auto_238116 - BLOCK
      ?auto_238117 - BLOCK
      ?auto_238118 - BLOCK
      ?auto_238119 - BLOCK
      ?auto_238120 - BLOCK
      ?auto_238121 - BLOCK
      ?auto_238122 - BLOCK
      ?auto_238123 - BLOCK
      ?auto_238124 - BLOCK
    )
    :vars
    (
      ?auto_238125 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238124 ?auto_238125 ) ( ON-TABLE ?auto_238115 ) ( ON ?auto_238116 ?auto_238115 ) ( ON ?auto_238117 ?auto_238116 ) ( ON ?auto_238118 ?auto_238117 ) ( ON ?auto_238119 ?auto_238118 ) ( ON ?auto_238120 ?auto_238119 ) ( not ( = ?auto_238115 ?auto_238116 ) ) ( not ( = ?auto_238115 ?auto_238117 ) ) ( not ( = ?auto_238115 ?auto_238118 ) ) ( not ( = ?auto_238115 ?auto_238119 ) ) ( not ( = ?auto_238115 ?auto_238120 ) ) ( not ( = ?auto_238115 ?auto_238121 ) ) ( not ( = ?auto_238115 ?auto_238122 ) ) ( not ( = ?auto_238115 ?auto_238123 ) ) ( not ( = ?auto_238115 ?auto_238124 ) ) ( not ( = ?auto_238115 ?auto_238125 ) ) ( not ( = ?auto_238116 ?auto_238117 ) ) ( not ( = ?auto_238116 ?auto_238118 ) ) ( not ( = ?auto_238116 ?auto_238119 ) ) ( not ( = ?auto_238116 ?auto_238120 ) ) ( not ( = ?auto_238116 ?auto_238121 ) ) ( not ( = ?auto_238116 ?auto_238122 ) ) ( not ( = ?auto_238116 ?auto_238123 ) ) ( not ( = ?auto_238116 ?auto_238124 ) ) ( not ( = ?auto_238116 ?auto_238125 ) ) ( not ( = ?auto_238117 ?auto_238118 ) ) ( not ( = ?auto_238117 ?auto_238119 ) ) ( not ( = ?auto_238117 ?auto_238120 ) ) ( not ( = ?auto_238117 ?auto_238121 ) ) ( not ( = ?auto_238117 ?auto_238122 ) ) ( not ( = ?auto_238117 ?auto_238123 ) ) ( not ( = ?auto_238117 ?auto_238124 ) ) ( not ( = ?auto_238117 ?auto_238125 ) ) ( not ( = ?auto_238118 ?auto_238119 ) ) ( not ( = ?auto_238118 ?auto_238120 ) ) ( not ( = ?auto_238118 ?auto_238121 ) ) ( not ( = ?auto_238118 ?auto_238122 ) ) ( not ( = ?auto_238118 ?auto_238123 ) ) ( not ( = ?auto_238118 ?auto_238124 ) ) ( not ( = ?auto_238118 ?auto_238125 ) ) ( not ( = ?auto_238119 ?auto_238120 ) ) ( not ( = ?auto_238119 ?auto_238121 ) ) ( not ( = ?auto_238119 ?auto_238122 ) ) ( not ( = ?auto_238119 ?auto_238123 ) ) ( not ( = ?auto_238119 ?auto_238124 ) ) ( not ( = ?auto_238119 ?auto_238125 ) ) ( not ( = ?auto_238120 ?auto_238121 ) ) ( not ( = ?auto_238120 ?auto_238122 ) ) ( not ( = ?auto_238120 ?auto_238123 ) ) ( not ( = ?auto_238120 ?auto_238124 ) ) ( not ( = ?auto_238120 ?auto_238125 ) ) ( not ( = ?auto_238121 ?auto_238122 ) ) ( not ( = ?auto_238121 ?auto_238123 ) ) ( not ( = ?auto_238121 ?auto_238124 ) ) ( not ( = ?auto_238121 ?auto_238125 ) ) ( not ( = ?auto_238122 ?auto_238123 ) ) ( not ( = ?auto_238122 ?auto_238124 ) ) ( not ( = ?auto_238122 ?auto_238125 ) ) ( not ( = ?auto_238123 ?auto_238124 ) ) ( not ( = ?auto_238123 ?auto_238125 ) ) ( not ( = ?auto_238124 ?auto_238125 ) ) ( ON ?auto_238123 ?auto_238124 ) ( ON ?auto_238122 ?auto_238123 ) ( CLEAR ?auto_238120 ) ( ON ?auto_238121 ?auto_238122 ) ( CLEAR ?auto_238121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_238115 ?auto_238116 ?auto_238117 ?auto_238118 ?auto_238119 ?auto_238120 ?auto_238121 )
      ( MAKE-10PILE ?auto_238115 ?auto_238116 ?auto_238117 ?auto_238118 ?auto_238119 ?auto_238120 ?auto_238121 ?auto_238122 ?auto_238123 ?auto_238124 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238136 - BLOCK
      ?auto_238137 - BLOCK
      ?auto_238138 - BLOCK
      ?auto_238139 - BLOCK
      ?auto_238140 - BLOCK
      ?auto_238141 - BLOCK
      ?auto_238142 - BLOCK
      ?auto_238143 - BLOCK
      ?auto_238144 - BLOCK
      ?auto_238145 - BLOCK
    )
    :vars
    (
      ?auto_238146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238145 ?auto_238146 ) ( ON-TABLE ?auto_238136 ) ( ON ?auto_238137 ?auto_238136 ) ( ON ?auto_238138 ?auto_238137 ) ( ON ?auto_238139 ?auto_238138 ) ( ON ?auto_238140 ?auto_238139 ) ( not ( = ?auto_238136 ?auto_238137 ) ) ( not ( = ?auto_238136 ?auto_238138 ) ) ( not ( = ?auto_238136 ?auto_238139 ) ) ( not ( = ?auto_238136 ?auto_238140 ) ) ( not ( = ?auto_238136 ?auto_238141 ) ) ( not ( = ?auto_238136 ?auto_238142 ) ) ( not ( = ?auto_238136 ?auto_238143 ) ) ( not ( = ?auto_238136 ?auto_238144 ) ) ( not ( = ?auto_238136 ?auto_238145 ) ) ( not ( = ?auto_238136 ?auto_238146 ) ) ( not ( = ?auto_238137 ?auto_238138 ) ) ( not ( = ?auto_238137 ?auto_238139 ) ) ( not ( = ?auto_238137 ?auto_238140 ) ) ( not ( = ?auto_238137 ?auto_238141 ) ) ( not ( = ?auto_238137 ?auto_238142 ) ) ( not ( = ?auto_238137 ?auto_238143 ) ) ( not ( = ?auto_238137 ?auto_238144 ) ) ( not ( = ?auto_238137 ?auto_238145 ) ) ( not ( = ?auto_238137 ?auto_238146 ) ) ( not ( = ?auto_238138 ?auto_238139 ) ) ( not ( = ?auto_238138 ?auto_238140 ) ) ( not ( = ?auto_238138 ?auto_238141 ) ) ( not ( = ?auto_238138 ?auto_238142 ) ) ( not ( = ?auto_238138 ?auto_238143 ) ) ( not ( = ?auto_238138 ?auto_238144 ) ) ( not ( = ?auto_238138 ?auto_238145 ) ) ( not ( = ?auto_238138 ?auto_238146 ) ) ( not ( = ?auto_238139 ?auto_238140 ) ) ( not ( = ?auto_238139 ?auto_238141 ) ) ( not ( = ?auto_238139 ?auto_238142 ) ) ( not ( = ?auto_238139 ?auto_238143 ) ) ( not ( = ?auto_238139 ?auto_238144 ) ) ( not ( = ?auto_238139 ?auto_238145 ) ) ( not ( = ?auto_238139 ?auto_238146 ) ) ( not ( = ?auto_238140 ?auto_238141 ) ) ( not ( = ?auto_238140 ?auto_238142 ) ) ( not ( = ?auto_238140 ?auto_238143 ) ) ( not ( = ?auto_238140 ?auto_238144 ) ) ( not ( = ?auto_238140 ?auto_238145 ) ) ( not ( = ?auto_238140 ?auto_238146 ) ) ( not ( = ?auto_238141 ?auto_238142 ) ) ( not ( = ?auto_238141 ?auto_238143 ) ) ( not ( = ?auto_238141 ?auto_238144 ) ) ( not ( = ?auto_238141 ?auto_238145 ) ) ( not ( = ?auto_238141 ?auto_238146 ) ) ( not ( = ?auto_238142 ?auto_238143 ) ) ( not ( = ?auto_238142 ?auto_238144 ) ) ( not ( = ?auto_238142 ?auto_238145 ) ) ( not ( = ?auto_238142 ?auto_238146 ) ) ( not ( = ?auto_238143 ?auto_238144 ) ) ( not ( = ?auto_238143 ?auto_238145 ) ) ( not ( = ?auto_238143 ?auto_238146 ) ) ( not ( = ?auto_238144 ?auto_238145 ) ) ( not ( = ?auto_238144 ?auto_238146 ) ) ( not ( = ?auto_238145 ?auto_238146 ) ) ( ON ?auto_238144 ?auto_238145 ) ( ON ?auto_238143 ?auto_238144 ) ( ON ?auto_238142 ?auto_238143 ) ( CLEAR ?auto_238140 ) ( ON ?auto_238141 ?auto_238142 ) ( CLEAR ?auto_238141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_238136 ?auto_238137 ?auto_238138 ?auto_238139 ?auto_238140 ?auto_238141 )
      ( MAKE-10PILE ?auto_238136 ?auto_238137 ?auto_238138 ?auto_238139 ?auto_238140 ?auto_238141 ?auto_238142 ?auto_238143 ?auto_238144 ?auto_238145 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238157 - BLOCK
      ?auto_238158 - BLOCK
      ?auto_238159 - BLOCK
      ?auto_238160 - BLOCK
      ?auto_238161 - BLOCK
      ?auto_238162 - BLOCK
      ?auto_238163 - BLOCK
      ?auto_238164 - BLOCK
      ?auto_238165 - BLOCK
      ?auto_238166 - BLOCK
    )
    :vars
    (
      ?auto_238167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238166 ?auto_238167 ) ( ON-TABLE ?auto_238157 ) ( ON ?auto_238158 ?auto_238157 ) ( ON ?auto_238159 ?auto_238158 ) ( ON ?auto_238160 ?auto_238159 ) ( ON ?auto_238161 ?auto_238160 ) ( not ( = ?auto_238157 ?auto_238158 ) ) ( not ( = ?auto_238157 ?auto_238159 ) ) ( not ( = ?auto_238157 ?auto_238160 ) ) ( not ( = ?auto_238157 ?auto_238161 ) ) ( not ( = ?auto_238157 ?auto_238162 ) ) ( not ( = ?auto_238157 ?auto_238163 ) ) ( not ( = ?auto_238157 ?auto_238164 ) ) ( not ( = ?auto_238157 ?auto_238165 ) ) ( not ( = ?auto_238157 ?auto_238166 ) ) ( not ( = ?auto_238157 ?auto_238167 ) ) ( not ( = ?auto_238158 ?auto_238159 ) ) ( not ( = ?auto_238158 ?auto_238160 ) ) ( not ( = ?auto_238158 ?auto_238161 ) ) ( not ( = ?auto_238158 ?auto_238162 ) ) ( not ( = ?auto_238158 ?auto_238163 ) ) ( not ( = ?auto_238158 ?auto_238164 ) ) ( not ( = ?auto_238158 ?auto_238165 ) ) ( not ( = ?auto_238158 ?auto_238166 ) ) ( not ( = ?auto_238158 ?auto_238167 ) ) ( not ( = ?auto_238159 ?auto_238160 ) ) ( not ( = ?auto_238159 ?auto_238161 ) ) ( not ( = ?auto_238159 ?auto_238162 ) ) ( not ( = ?auto_238159 ?auto_238163 ) ) ( not ( = ?auto_238159 ?auto_238164 ) ) ( not ( = ?auto_238159 ?auto_238165 ) ) ( not ( = ?auto_238159 ?auto_238166 ) ) ( not ( = ?auto_238159 ?auto_238167 ) ) ( not ( = ?auto_238160 ?auto_238161 ) ) ( not ( = ?auto_238160 ?auto_238162 ) ) ( not ( = ?auto_238160 ?auto_238163 ) ) ( not ( = ?auto_238160 ?auto_238164 ) ) ( not ( = ?auto_238160 ?auto_238165 ) ) ( not ( = ?auto_238160 ?auto_238166 ) ) ( not ( = ?auto_238160 ?auto_238167 ) ) ( not ( = ?auto_238161 ?auto_238162 ) ) ( not ( = ?auto_238161 ?auto_238163 ) ) ( not ( = ?auto_238161 ?auto_238164 ) ) ( not ( = ?auto_238161 ?auto_238165 ) ) ( not ( = ?auto_238161 ?auto_238166 ) ) ( not ( = ?auto_238161 ?auto_238167 ) ) ( not ( = ?auto_238162 ?auto_238163 ) ) ( not ( = ?auto_238162 ?auto_238164 ) ) ( not ( = ?auto_238162 ?auto_238165 ) ) ( not ( = ?auto_238162 ?auto_238166 ) ) ( not ( = ?auto_238162 ?auto_238167 ) ) ( not ( = ?auto_238163 ?auto_238164 ) ) ( not ( = ?auto_238163 ?auto_238165 ) ) ( not ( = ?auto_238163 ?auto_238166 ) ) ( not ( = ?auto_238163 ?auto_238167 ) ) ( not ( = ?auto_238164 ?auto_238165 ) ) ( not ( = ?auto_238164 ?auto_238166 ) ) ( not ( = ?auto_238164 ?auto_238167 ) ) ( not ( = ?auto_238165 ?auto_238166 ) ) ( not ( = ?auto_238165 ?auto_238167 ) ) ( not ( = ?auto_238166 ?auto_238167 ) ) ( ON ?auto_238165 ?auto_238166 ) ( ON ?auto_238164 ?auto_238165 ) ( ON ?auto_238163 ?auto_238164 ) ( CLEAR ?auto_238161 ) ( ON ?auto_238162 ?auto_238163 ) ( CLEAR ?auto_238162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_238157 ?auto_238158 ?auto_238159 ?auto_238160 ?auto_238161 ?auto_238162 )
      ( MAKE-10PILE ?auto_238157 ?auto_238158 ?auto_238159 ?auto_238160 ?auto_238161 ?auto_238162 ?auto_238163 ?auto_238164 ?auto_238165 ?auto_238166 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238178 - BLOCK
      ?auto_238179 - BLOCK
      ?auto_238180 - BLOCK
      ?auto_238181 - BLOCK
      ?auto_238182 - BLOCK
      ?auto_238183 - BLOCK
      ?auto_238184 - BLOCK
      ?auto_238185 - BLOCK
      ?auto_238186 - BLOCK
      ?auto_238187 - BLOCK
    )
    :vars
    (
      ?auto_238188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238187 ?auto_238188 ) ( ON-TABLE ?auto_238178 ) ( ON ?auto_238179 ?auto_238178 ) ( ON ?auto_238180 ?auto_238179 ) ( ON ?auto_238181 ?auto_238180 ) ( not ( = ?auto_238178 ?auto_238179 ) ) ( not ( = ?auto_238178 ?auto_238180 ) ) ( not ( = ?auto_238178 ?auto_238181 ) ) ( not ( = ?auto_238178 ?auto_238182 ) ) ( not ( = ?auto_238178 ?auto_238183 ) ) ( not ( = ?auto_238178 ?auto_238184 ) ) ( not ( = ?auto_238178 ?auto_238185 ) ) ( not ( = ?auto_238178 ?auto_238186 ) ) ( not ( = ?auto_238178 ?auto_238187 ) ) ( not ( = ?auto_238178 ?auto_238188 ) ) ( not ( = ?auto_238179 ?auto_238180 ) ) ( not ( = ?auto_238179 ?auto_238181 ) ) ( not ( = ?auto_238179 ?auto_238182 ) ) ( not ( = ?auto_238179 ?auto_238183 ) ) ( not ( = ?auto_238179 ?auto_238184 ) ) ( not ( = ?auto_238179 ?auto_238185 ) ) ( not ( = ?auto_238179 ?auto_238186 ) ) ( not ( = ?auto_238179 ?auto_238187 ) ) ( not ( = ?auto_238179 ?auto_238188 ) ) ( not ( = ?auto_238180 ?auto_238181 ) ) ( not ( = ?auto_238180 ?auto_238182 ) ) ( not ( = ?auto_238180 ?auto_238183 ) ) ( not ( = ?auto_238180 ?auto_238184 ) ) ( not ( = ?auto_238180 ?auto_238185 ) ) ( not ( = ?auto_238180 ?auto_238186 ) ) ( not ( = ?auto_238180 ?auto_238187 ) ) ( not ( = ?auto_238180 ?auto_238188 ) ) ( not ( = ?auto_238181 ?auto_238182 ) ) ( not ( = ?auto_238181 ?auto_238183 ) ) ( not ( = ?auto_238181 ?auto_238184 ) ) ( not ( = ?auto_238181 ?auto_238185 ) ) ( not ( = ?auto_238181 ?auto_238186 ) ) ( not ( = ?auto_238181 ?auto_238187 ) ) ( not ( = ?auto_238181 ?auto_238188 ) ) ( not ( = ?auto_238182 ?auto_238183 ) ) ( not ( = ?auto_238182 ?auto_238184 ) ) ( not ( = ?auto_238182 ?auto_238185 ) ) ( not ( = ?auto_238182 ?auto_238186 ) ) ( not ( = ?auto_238182 ?auto_238187 ) ) ( not ( = ?auto_238182 ?auto_238188 ) ) ( not ( = ?auto_238183 ?auto_238184 ) ) ( not ( = ?auto_238183 ?auto_238185 ) ) ( not ( = ?auto_238183 ?auto_238186 ) ) ( not ( = ?auto_238183 ?auto_238187 ) ) ( not ( = ?auto_238183 ?auto_238188 ) ) ( not ( = ?auto_238184 ?auto_238185 ) ) ( not ( = ?auto_238184 ?auto_238186 ) ) ( not ( = ?auto_238184 ?auto_238187 ) ) ( not ( = ?auto_238184 ?auto_238188 ) ) ( not ( = ?auto_238185 ?auto_238186 ) ) ( not ( = ?auto_238185 ?auto_238187 ) ) ( not ( = ?auto_238185 ?auto_238188 ) ) ( not ( = ?auto_238186 ?auto_238187 ) ) ( not ( = ?auto_238186 ?auto_238188 ) ) ( not ( = ?auto_238187 ?auto_238188 ) ) ( ON ?auto_238186 ?auto_238187 ) ( ON ?auto_238185 ?auto_238186 ) ( ON ?auto_238184 ?auto_238185 ) ( ON ?auto_238183 ?auto_238184 ) ( CLEAR ?auto_238181 ) ( ON ?auto_238182 ?auto_238183 ) ( CLEAR ?auto_238182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_238178 ?auto_238179 ?auto_238180 ?auto_238181 ?auto_238182 )
      ( MAKE-10PILE ?auto_238178 ?auto_238179 ?auto_238180 ?auto_238181 ?auto_238182 ?auto_238183 ?auto_238184 ?auto_238185 ?auto_238186 ?auto_238187 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238199 - BLOCK
      ?auto_238200 - BLOCK
      ?auto_238201 - BLOCK
      ?auto_238202 - BLOCK
      ?auto_238203 - BLOCK
      ?auto_238204 - BLOCK
      ?auto_238205 - BLOCK
      ?auto_238206 - BLOCK
      ?auto_238207 - BLOCK
      ?auto_238208 - BLOCK
    )
    :vars
    (
      ?auto_238209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238208 ?auto_238209 ) ( ON-TABLE ?auto_238199 ) ( ON ?auto_238200 ?auto_238199 ) ( ON ?auto_238201 ?auto_238200 ) ( ON ?auto_238202 ?auto_238201 ) ( not ( = ?auto_238199 ?auto_238200 ) ) ( not ( = ?auto_238199 ?auto_238201 ) ) ( not ( = ?auto_238199 ?auto_238202 ) ) ( not ( = ?auto_238199 ?auto_238203 ) ) ( not ( = ?auto_238199 ?auto_238204 ) ) ( not ( = ?auto_238199 ?auto_238205 ) ) ( not ( = ?auto_238199 ?auto_238206 ) ) ( not ( = ?auto_238199 ?auto_238207 ) ) ( not ( = ?auto_238199 ?auto_238208 ) ) ( not ( = ?auto_238199 ?auto_238209 ) ) ( not ( = ?auto_238200 ?auto_238201 ) ) ( not ( = ?auto_238200 ?auto_238202 ) ) ( not ( = ?auto_238200 ?auto_238203 ) ) ( not ( = ?auto_238200 ?auto_238204 ) ) ( not ( = ?auto_238200 ?auto_238205 ) ) ( not ( = ?auto_238200 ?auto_238206 ) ) ( not ( = ?auto_238200 ?auto_238207 ) ) ( not ( = ?auto_238200 ?auto_238208 ) ) ( not ( = ?auto_238200 ?auto_238209 ) ) ( not ( = ?auto_238201 ?auto_238202 ) ) ( not ( = ?auto_238201 ?auto_238203 ) ) ( not ( = ?auto_238201 ?auto_238204 ) ) ( not ( = ?auto_238201 ?auto_238205 ) ) ( not ( = ?auto_238201 ?auto_238206 ) ) ( not ( = ?auto_238201 ?auto_238207 ) ) ( not ( = ?auto_238201 ?auto_238208 ) ) ( not ( = ?auto_238201 ?auto_238209 ) ) ( not ( = ?auto_238202 ?auto_238203 ) ) ( not ( = ?auto_238202 ?auto_238204 ) ) ( not ( = ?auto_238202 ?auto_238205 ) ) ( not ( = ?auto_238202 ?auto_238206 ) ) ( not ( = ?auto_238202 ?auto_238207 ) ) ( not ( = ?auto_238202 ?auto_238208 ) ) ( not ( = ?auto_238202 ?auto_238209 ) ) ( not ( = ?auto_238203 ?auto_238204 ) ) ( not ( = ?auto_238203 ?auto_238205 ) ) ( not ( = ?auto_238203 ?auto_238206 ) ) ( not ( = ?auto_238203 ?auto_238207 ) ) ( not ( = ?auto_238203 ?auto_238208 ) ) ( not ( = ?auto_238203 ?auto_238209 ) ) ( not ( = ?auto_238204 ?auto_238205 ) ) ( not ( = ?auto_238204 ?auto_238206 ) ) ( not ( = ?auto_238204 ?auto_238207 ) ) ( not ( = ?auto_238204 ?auto_238208 ) ) ( not ( = ?auto_238204 ?auto_238209 ) ) ( not ( = ?auto_238205 ?auto_238206 ) ) ( not ( = ?auto_238205 ?auto_238207 ) ) ( not ( = ?auto_238205 ?auto_238208 ) ) ( not ( = ?auto_238205 ?auto_238209 ) ) ( not ( = ?auto_238206 ?auto_238207 ) ) ( not ( = ?auto_238206 ?auto_238208 ) ) ( not ( = ?auto_238206 ?auto_238209 ) ) ( not ( = ?auto_238207 ?auto_238208 ) ) ( not ( = ?auto_238207 ?auto_238209 ) ) ( not ( = ?auto_238208 ?auto_238209 ) ) ( ON ?auto_238207 ?auto_238208 ) ( ON ?auto_238206 ?auto_238207 ) ( ON ?auto_238205 ?auto_238206 ) ( ON ?auto_238204 ?auto_238205 ) ( CLEAR ?auto_238202 ) ( ON ?auto_238203 ?auto_238204 ) ( CLEAR ?auto_238203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_238199 ?auto_238200 ?auto_238201 ?auto_238202 ?auto_238203 )
      ( MAKE-10PILE ?auto_238199 ?auto_238200 ?auto_238201 ?auto_238202 ?auto_238203 ?auto_238204 ?auto_238205 ?auto_238206 ?auto_238207 ?auto_238208 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238220 - BLOCK
      ?auto_238221 - BLOCK
      ?auto_238222 - BLOCK
      ?auto_238223 - BLOCK
      ?auto_238224 - BLOCK
      ?auto_238225 - BLOCK
      ?auto_238226 - BLOCK
      ?auto_238227 - BLOCK
      ?auto_238228 - BLOCK
      ?auto_238229 - BLOCK
    )
    :vars
    (
      ?auto_238230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238229 ?auto_238230 ) ( ON-TABLE ?auto_238220 ) ( ON ?auto_238221 ?auto_238220 ) ( ON ?auto_238222 ?auto_238221 ) ( not ( = ?auto_238220 ?auto_238221 ) ) ( not ( = ?auto_238220 ?auto_238222 ) ) ( not ( = ?auto_238220 ?auto_238223 ) ) ( not ( = ?auto_238220 ?auto_238224 ) ) ( not ( = ?auto_238220 ?auto_238225 ) ) ( not ( = ?auto_238220 ?auto_238226 ) ) ( not ( = ?auto_238220 ?auto_238227 ) ) ( not ( = ?auto_238220 ?auto_238228 ) ) ( not ( = ?auto_238220 ?auto_238229 ) ) ( not ( = ?auto_238220 ?auto_238230 ) ) ( not ( = ?auto_238221 ?auto_238222 ) ) ( not ( = ?auto_238221 ?auto_238223 ) ) ( not ( = ?auto_238221 ?auto_238224 ) ) ( not ( = ?auto_238221 ?auto_238225 ) ) ( not ( = ?auto_238221 ?auto_238226 ) ) ( not ( = ?auto_238221 ?auto_238227 ) ) ( not ( = ?auto_238221 ?auto_238228 ) ) ( not ( = ?auto_238221 ?auto_238229 ) ) ( not ( = ?auto_238221 ?auto_238230 ) ) ( not ( = ?auto_238222 ?auto_238223 ) ) ( not ( = ?auto_238222 ?auto_238224 ) ) ( not ( = ?auto_238222 ?auto_238225 ) ) ( not ( = ?auto_238222 ?auto_238226 ) ) ( not ( = ?auto_238222 ?auto_238227 ) ) ( not ( = ?auto_238222 ?auto_238228 ) ) ( not ( = ?auto_238222 ?auto_238229 ) ) ( not ( = ?auto_238222 ?auto_238230 ) ) ( not ( = ?auto_238223 ?auto_238224 ) ) ( not ( = ?auto_238223 ?auto_238225 ) ) ( not ( = ?auto_238223 ?auto_238226 ) ) ( not ( = ?auto_238223 ?auto_238227 ) ) ( not ( = ?auto_238223 ?auto_238228 ) ) ( not ( = ?auto_238223 ?auto_238229 ) ) ( not ( = ?auto_238223 ?auto_238230 ) ) ( not ( = ?auto_238224 ?auto_238225 ) ) ( not ( = ?auto_238224 ?auto_238226 ) ) ( not ( = ?auto_238224 ?auto_238227 ) ) ( not ( = ?auto_238224 ?auto_238228 ) ) ( not ( = ?auto_238224 ?auto_238229 ) ) ( not ( = ?auto_238224 ?auto_238230 ) ) ( not ( = ?auto_238225 ?auto_238226 ) ) ( not ( = ?auto_238225 ?auto_238227 ) ) ( not ( = ?auto_238225 ?auto_238228 ) ) ( not ( = ?auto_238225 ?auto_238229 ) ) ( not ( = ?auto_238225 ?auto_238230 ) ) ( not ( = ?auto_238226 ?auto_238227 ) ) ( not ( = ?auto_238226 ?auto_238228 ) ) ( not ( = ?auto_238226 ?auto_238229 ) ) ( not ( = ?auto_238226 ?auto_238230 ) ) ( not ( = ?auto_238227 ?auto_238228 ) ) ( not ( = ?auto_238227 ?auto_238229 ) ) ( not ( = ?auto_238227 ?auto_238230 ) ) ( not ( = ?auto_238228 ?auto_238229 ) ) ( not ( = ?auto_238228 ?auto_238230 ) ) ( not ( = ?auto_238229 ?auto_238230 ) ) ( ON ?auto_238228 ?auto_238229 ) ( ON ?auto_238227 ?auto_238228 ) ( ON ?auto_238226 ?auto_238227 ) ( ON ?auto_238225 ?auto_238226 ) ( ON ?auto_238224 ?auto_238225 ) ( CLEAR ?auto_238222 ) ( ON ?auto_238223 ?auto_238224 ) ( CLEAR ?auto_238223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_238220 ?auto_238221 ?auto_238222 ?auto_238223 )
      ( MAKE-10PILE ?auto_238220 ?auto_238221 ?auto_238222 ?auto_238223 ?auto_238224 ?auto_238225 ?auto_238226 ?auto_238227 ?auto_238228 ?auto_238229 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238241 - BLOCK
      ?auto_238242 - BLOCK
      ?auto_238243 - BLOCK
      ?auto_238244 - BLOCK
      ?auto_238245 - BLOCK
      ?auto_238246 - BLOCK
      ?auto_238247 - BLOCK
      ?auto_238248 - BLOCK
      ?auto_238249 - BLOCK
      ?auto_238250 - BLOCK
    )
    :vars
    (
      ?auto_238251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238250 ?auto_238251 ) ( ON-TABLE ?auto_238241 ) ( ON ?auto_238242 ?auto_238241 ) ( ON ?auto_238243 ?auto_238242 ) ( not ( = ?auto_238241 ?auto_238242 ) ) ( not ( = ?auto_238241 ?auto_238243 ) ) ( not ( = ?auto_238241 ?auto_238244 ) ) ( not ( = ?auto_238241 ?auto_238245 ) ) ( not ( = ?auto_238241 ?auto_238246 ) ) ( not ( = ?auto_238241 ?auto_238247 ) ) ( not ( = ?auto_238241 ?auto_238248 ) ) ( not ( = ?auto_238241 ?auto_238249 ) ) ( not ( = ?auto_238241 ?auto_238250 ) ) ( not ( = ?auto_238241 ?auto_238251 ) ) ( not ( = ?auto_238242 ?auto_238243 ) ) ( not ( = ?auto_238242 ?auto_238244 ) ) ( not ( = ?auto_238242 ?auto_238245 ) ) ( not ( = ?auto_238242 ?auto_238246 ) ) ( not ( = ?auto_238242 ?auto_238247 ) ) ( not ( = ?auto_238242 ?auto_238248 ) ) ( not ( = ?auto_238242 ?auto_238249 ) ) ( not ( = ?auto_238242 ?auto_238250 ) ) ( not ( = ?auto_238242 ?auto_238251 ) ) ( not ( = ?auto_238243 ?auto_238244 ) ) ( not ( = ?auto_238243 ?auto_238245 ) ) ( not ( = ?auto_238243 ?auto_238246 ) ) ( not ( = ?auto_238243 ?auto_238247 ) ) ( not ( = ?auto_238243 ?auto_238248 ) ) ( not ( = ?auto_238243 ?auto_238249 ) ) ( not ( = ?auto_238243 ?auto_238250 ) ) ( not ( = ?auto_238243 ?auto_238251 ) ) ( not ( = ?auto_238244 ?auto_238245 ) ) ( not ( = ?auto_238244 ?auto_238246 ) ) ( not ( = ?auto_238244 ?auto_238247 ) ) ( not ( = ?auto_238244 ?auto_238248 ) ) ( not ( = ?auto_238244 ?auto_238249 ) ) ( not ( = ?auto_238244 ?auto_238250 ) ) ( not ( = ?auto_238244 ?auto_238251 ) ) ( not ( = ?auto_238245 ?auto_238246 ) ) ( not ( = ?auto_238245 ?auto_238247 ) ) ( not ( = ?auto_238245 ?auto_238248 ) ) ( not ( = ?auto_238245 ?auto_238249 ) ) ( not ( = ?auto_238245 ?auto_238250 ) ) ( not ( = ?auto_238245 ?auto_238251 ) ) ( not ( = ?auto_238246 ?auto_238247 ) ) ( not ( = ?auto_238246 ?auto_238248 ) ) ( not ( = ?auto_238246 ?auto_238249 ) ) ( not ( = ?auto_238246 ?auto_238250 ) ) ( not ( = ?auto_238246 ?auto_238251 ) ) ( not ( = ?auto_238247 ?auto_238248 ) ) ( not ( = ?auto_238247 ?auto_238249 ) ) ( not ( = ?auto_238247 ?auto_238250 ) ) ( not ( = ?auto_238247 ?auto_238251 ) ) ( not ( = ?auto_238248 ?auto_238249 ) ) ( not ( = ?auto_238248 ?auto_238250 ) ) ( not ( = ?auto_238248 ?auto_238251 ) ) ( not ( = ?auto_238249 ?auto_238250 ) ) ( not ( = ?auto_238249 ?auto_238251 ) ) ( not ( = ?auto_238250 ?auto_238251 ) ) ( ON ?auto_238249 ?auto_238250 ) ( ON ?auto_238248 ?auto_238249 ) ( ON ?auto_238247 ?auto_238248 ) ( ON ?auto_238246 ?auto_238247 ) ( ON ?auto_238245 ?auto_238246 ) ( CLEAR ?auto_238243 ) ( ON ?auto_238244 ?auto_238245 ) ( CLEAR ?auto_238244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_238241 ?auto_238242 ?auto_238243 ?auto_238244 )
      ( MAKE-10PILE ?auto_238241 ?auto_238242 ?auto_238243 ?auto_238244 ?auto_238245 ?auto_238246 ?auto_238247 ?auto_238248 ?auto_238249 ?auto_238250 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238262 - BLOCK
      ?auto_238263 - BLOCK
      ?auto_238264 - BLOCK
      ?auto_238265 - BLOCK
      ?auto_238266 - BLOCK
      ?auto_238267 - BLOCK
      ?auto_238268 - BLOCK
      ?auto_238269 - BLOCK
      ?auto_238270 - BLOCK
      ?auto_238271 - BLOCK
    )
    :vars
    (
      ?auto_238272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238271 ?auto_238272 ) ( ON-TABLE ?auto_238262 ) ( ON ?auto_238263 ?auto_238262 ) ( not ( = ?auto_238262 ?auto_238263 ) ) ( not ( = ?auto_238262 ?auto_238264 ) ) ( not ( = ?auto_238262 ?auto_238265 ) ) ( not ( = ?auto_238262 ?auto_238266 ) ) ( not ( = ?auto_238262 ?auto_238267 ) ) ( not ( = ?auto_238262 ?auto_238268 ) ) ( not ( = ?auto_238262 ?auto_238269 ) ) ( not ( = ?auto_238262 ?auto_238270 ) ) ( not ( = ?auto_238262 ?auto_238271 ) ) ( not ( = ?auto_238262 ?auto_238272 ) ) ( not ( = ?auto_238263 ?auto_238264 ) ) ( not ( = ?auto_238263 ?auto_238265 ) ) ( not ( = ?auto_238263 ?auto_238266 ) ) ( not ( = ?auto_238263 ?auto_238267 ) ) ( not ( = ?auto_238263 ?auto_238268 ) ) ( not ( = ?auto_238263 ?auto_238269 ) ) ( not ( = ?auto_238263 ?auto_238270 ) ) ( not ( = ?auto_238263 ?auto_238271 ) ) ( not ( = ?auto_238263 ?auto_238272 ) ) ( not ( = ?auto_238264 ?auto_238265 ) ) ( not ( = ?auto_238264 ?auto_238266 ) ) ( not ( = ?auto_238264 ?auto_238267 ) ) ( not ( = ?auto_238264 ?auto_238268 ) ) ( not ( = ?auto_238264 ?auto_238269 ) ) ( not ( = ?auto_238264 ?auto_238270 ) ) ( not ( = ?auto_238264 ?auto_238271 ) ) ( not ( = ?auto_238264 ?auto_238272 ) ) ( not ( = ?auto_238265 ?auto_238266 ) ) ( not ( = ?auto_238265 ?auto_238267 ) ) ( not ( = ?auto_238265 ?auto_238268 ) ) ( not ( = ?auto_238265 ?auto_238269 ) ) ( not ( = ?auto_238265 ?auto_238270 ) ) ( not ( = ?auto_238265 ?auto_238271 ) ) ( not ( = ?auto_238265 ?auto_238272 ) ) ( not ( = ?auto_238266 ?auto_238267 ) ) ( not ( = ?auto_238266 ?auto_238268 ) ) ( not ( = ?auto_238266 ?auto_238269 ) ) ( not ( = ?auto_238266 ?auto_238270 ) ) ( not ( = ?auto_238266 ?auto_238271 ) ) ( not ( = ?auto_238266 ?auto_238272 ) ) ( not ( = ?auto_238267 ?auto_238268 ) ) ( not ( = ?auto_238267 ?auto_238269 ) ) ( not ( = ?auto_238267 ?auto_238270 ) ) ( not ( = ?auto_238267 ?auto_238271 ) ) ( not ( = ?auto_238267 ?auto_238272 ) ) ( not ( = ?auto_238268 ?auto_238269 ) ) ( not ( = ?auto_238268 ?auto_238270 ) ) ( not ( = ?auto_238268 ?auto_238271 ) ) ( not ( = ?auto_238268 ?auto_238272 ) ) ( not ( = ?auto_238269 ?auto_238270 ) ) ( not ( = ?auto_238269 ?auto_238271 ) ) ( not ( = ?auto_238269 ?auto_238272 ) ) ( not ( = ?auto_238270 ?auto_238271 ) ) ( not ( = ?auto_238270 ?auto_238272 ) ) ( not ( = ?auto_238271 ?auto_238272 ) ) ( ON ?auto_238270 ?auto_238271 ) ( ON ?auto_238269 ?auto_238270 ) ( ON ?auto_238268 ?auto_238269 ) ( ON ?auto_238267 ?auto_238268 ) ( ON ?auto_238266 ?auto_238267 ) ( ON ?auto_238265 ?auto_238266 ) ( CLEAR ?auto_238263 ) ( ON ?auto_238264 ?auto_238265 ) ( CLEAR ?auto_238264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_238262 ?auto_238263 ?auto_238264 )
      ( MAKE-10PILE ?auto_238262 ?auto_238263 ?auto_238264 ?auto_238265 ?auto_238266 ?auto_238267 ?auto_238268 ?auto_238269 ?auto_238270 ?auto_238271 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238283 - BLOCK
      ?auto_238284 - BLOCK
      ?auto_238285 - BLOCK
      ?auto_238286 - BLOCK
      ?auto_238287 - BLOCK
      ?auto_238288 - BLOCK
      ?auto_238289 - BLOCK
      ?auto_238290 - BLOCK
      ?auto_238291 - BLOCK
      ?auto_238292 - BLOCK
    )
    :vars
    (
      ?auto_238293 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238292 ?auto_238293 ) ( ON-TABLE ?auto_238283 ) ( ON ?auto_238284 ?auto_238283 ) ( not ( = ?auto_238283 ?auto_238284 ) ) ( not ( = ?auto_238283 ?auto_238285 ) ) ( not ( = ?auto_238283 ?auto_238286 ) ) ( not ( = ?auto_238283 ?auto_238287 ) ) ( not ( = ?auto_238283 ?auto_238288 ) ) ( not ( = ?auto_238283 ?auto_238289 ) ) ( not ( = ?auto_238283 ?auto_238290 ) ) ( not ( = ?auto_238283 ?auto_238291 ) ) ( not ( = ?auto_238283 ?auto_238292 ) ) ( not ( = ?auto_238283 ?auto_238293 ) ) ( not ( = ?auto_238284 ?auto_238285 ) ) ( not ( = ?auto_238284 ?auto_238286 ) ) ( not ( = ?auto_238284 ?auto_238287 ) ) ( not ( = ?auto_238284 ?auto_238288 ) ) ( not ( = ?auto_238284 ?auto_238289 ) ) ( not ( = ?auto_238284 ?auto_238290 ) ) ( not ( = ?auto_238284 ?auto_238291 ) ) ( not ( = ?auto_238284 ?auto_238292 ) ) ( not ( = ?auto_238284 ?auto_238293 ) ) ( not ( = ?auto_238285 ?auto_238286 ) ) ( not ( = ?auto_238285 ?auto_238287 ) ) ( not ( = ?auto_238285 ?auto_238288 ) ) ( not ( = ?auto_238285 ?auto_238289 ) ) ( not ( = ?auto_238285 ?auto_238290 ) ) ( not ( = ?auto_238285 ?auto_238291 ) ) ( not ( = ?auto_238285 ?auto_238292 ) ) ( not ( = ?auto_238285 ?auto_238293 ) ) ( not ( = ?auto_238286 ?auto_238287 ) ) ( not ( = ?auto_238286 ?auto_238288 ) ) ( not ( = ?auto_238286 ?auto_238289 ) ) ( not ( = ?auto_238286 ?auto_238290 ) ) ( not ( = ?auto_238286 ?auto_238291 ) ) ( not ( = ?auto_238286 ?auto_238292 ) ) ( not ( = ?auto_238286 ?auto_238293 ) ) ( not ( = ?auto_238287 ?auto_238288 ) ) ( not ( = ?auto_238287 ?auto_238289 ) ) ( not ( = ?auto_238287 ?auto_238290 ) ) ( not ( = ?auto_238287 ?auto_238291 ) ) ( not ( = ?auto_238287 ?auto_238292 ) ) ( not ( = ?auto_238287 ?auto_238293 ) ) ( not ( = ?auto_238288 ?auto_238289 ) ) ( not ( = ?auto_238288 ?auto_238290 ) ) ( not ( = ?auto_238288 ?auto_238291 ) ) ( not ( = ?auto_238288 ?auto_238292 ) ) ( not ( = ?auto_238288 ?auto_238293 ) ) ( not ( = ?auto_238289 ?auto_238290 ) ) ( not ( = ?auto_238289 ?auto_238291 ) ) ( not ( = ?auto_238289 ?auto_238292 ) ) ( not ( = ?auto_238289 ?auto_238293 ) ) ( not ( = ?auto_238290 ?auto_238291 ) ) ( not ( = ?auto_238290 ?auto_238292 ) ) ( not ( = ?auto_238290 ?auto_238293 ) ) ( not ( = ?auto_238291 ?auto_238292 ) ) ( not ( = ?auto_238291 ?auto_238293 ) ) ( not ( = ?auto_238292 ?auto_238293 ) ) ( ON ?auto_238291 ?auto_238292 ) ( ON ?auto_238290 ?auto_238291 ) ( ON ?auto_238289 ?auto_238290 ) ( ON ?auto_238288 ?auto_238289 ) ( ON ?auto_238287 ?auto_238288 ) ( ON ?auto_238286 ?auto_238287 ) ( CLEAR ?auto_238284 ) ( ON ?auto_238285 ?auto_238286 ) ( CLEAR ?auto_238285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_238283 ?auto_238284 ?auto_238285 )
      ( MAKE-10PILE ?auto_238283 ?auto_238284 ?auto_238285 ?auto_238286 ?auto_238287 ?auto_238288 ?auto_238289 ?auto_238290 ?auto_238291 ?auto_238292 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238304 - BLOCK
      ?auto_238305 - BLOCK
      ?auto_238306 - BLOCK
      ?auto_238307 - BLOCK
      ?auto_238308 - BLOCK
      ?auto_238309 - BLOCK
      ?auto_238310 - BLOCK
      ?auto_238311 - BLOCK
      ?auto_238312 - BLOCK
      ?auto_238313 - BLOCK
    )
    :vars
    (
      ?auto_238314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238313 ?auto_238314 ) ( ON-TABLE ?auto_238304 ) ( not ( = ?auto_238304 ?auto_238305 ) ) ( not ( = ?auto_238304 ?auto_238306 ) ) ( not ( = ?auto_238304 ?auto_238307 ) ) ( not ( = ?auto_238304 ?auto_238308 ) ) ( not ( = ?auto_238304 ?auto_238309 ) ) ( not ( = ?auto_238304 ?auto_238310 ) ) ( not ( = ?auto_238304 ?auto_238311 ) ) ( not ( = ?auto_238304 ?auto_238312 ) ) ( not ( = ?auto_238304 ?auto_238313 ) ) ( not ( = ?auto_238304 ?auto_238314 ) ) ( not ( = ?auto_238305 ?auto_238306 ) ) ( not ( = ?auto_238305 ?auto_238307 ) ) ( not ( = ?auto_238305 ?auto_238308 ) ) ( not ( = ?auto_238305 ?auto_238309 ) ) ( not ( = ?auto_238305 ?auto_238310 ) ) ( not ( = ?auto_238305 ?auto_238311 ) ) ( not ( = ?auto_238305 ?auto_238312 ) ) ( not ( = ?auto_238305 ?auto_238313 ) ) ( not ( = ?auto_238305 ?auto_238314 ) ) ( not ( = ?auto_238306 ?auto_238307 ) ) ( not ( = ?auto_238306 ?auto_238308 ) ) ( not ( = ?auto_238306 ?auto_238309 ) ) ( not ( = ?auto_238306 ?auto_238310 ) ) ( not ( = ?auto_238306 ?auto_238311 ) ) ( not ( = ?auto_238306 ?auto_238312 ) ) ( not ( = ?auto_238306 ?auto_238313 ) ) ( not ( = ?auto_238306 ?auto_238314 ) ) ( not ( = ?auto_238307 ?auto_238308 ) ) ( not ( = ?auto_238307 ?auto_238309 ) ) ( not ( = ?auto_238307 ?auto_238310 ) ) ( not ( = ?auto_238307 ?auto_238311 ) ) ( not ( = ?auto_238307 ?auto_238312 ) ) ( not ( = ?auto_238307 ?auto_238313 ) ) ( not ( = ?auto_238307 ?auto_238314 ) ) ( not ( = ?auto_238308 ?auto_238309 ) ) ( not ( = ?auto_238308 ?auto_238310 ) ) ( not ( = ?auto_238308 ?auto_238311 ) ) ( not ( = ?auto_238308 ?auto_238312 ) ) ( not ( = ?auto_238308 ?auto_238313 ) ) ( not ( = ?auto_238308 ?auto_238314 ) ) ( not ( = ?auto_238309 ?auto_238310 ) ) ( not ( = ?auto_238309 ?auto_238311 ) ) ( not ( = ?auto_238309 ?auto_238312 ) ) ( not ( = ?auto_238309 ?auto_238313 ) ) ( not ( = ?auto_238309 ?auto_238314 ) ) ( not ( = ?auto_238310 ?auto_238311 ) ) ( not ( = ?auto_238310 ?auto_238312 ) ) ( not ( = ?auto_238310 ?auto_238313 ) ) ( not ( = ?auto_238310 ?auto_238314 ) ) ( not ( = ?auto_238311 ?auto_238312 ) ) ( not ( = ?auto_238311 ?auto_238313 ) ) ( not ( = ?auto_238311 ?auto_238314 ) ) ( not ( = ?auto_238312 ?auto_238313 ) ) ( not ( = ?auto_238312 ?auto_238314 ) ) ( not ( = ?auto_238313 ?auto_238314 ) ) ( ON ?auto_238312 ?auto_238313 ) ( ON ?auto_238311 ?auto_238312 ) ( ON ?auto_238310 ?auto_238311 ) ( ON ?auto_238309 ?auto_238310 ) ( ON ?auto_238308 ?auto_238309 ) ( ON ?auto_238307 ?auto_238308 ) ( ON ?auto_238306 ?auto_238307 ) ( CLEAR ?auto_238304 ) ( ON ?auto_238305 ?auto_238306 ) ( CLEAR ?auto_238305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_238304 ?auto_238305 )
      ( MAKE-10PILE ?auto_238304 ?auto_238305 ?auto_238306 ?auto_238307 ?auto_238308 ?auto_238309 ?auto_238310 ?auto_238311 ?auto_238312 ?auto_238313 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238325 - BLOCK
      ?auto_238326 - BLOCK
      ?auto_238327 - BLOCK
      ?auto_238328 - BLOCK
      ?auto_238329 - BLOCK
      ?auto_238330 - BLOCK
      ?auto_238331 - BLOCK
      ?auto_238332 - BLOCK
      ?auto_238333 - BLOCK
      ?auto_238334 - BLOCK
    )
    :vars
    (
      ?auto_238335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238334 ?auto_238335 ) ( ON-TABLE ?auto_238325 ) ( not ( = ?auto_238325 ?auto_238326 ) ) ( not ( = ?auto_238325 ?auto_238327 ) ) ( not ( = ?auto_238325 ?auto_238328 ) ) ( not ( = ?auto_238325 ?auto_238329 ) ) ( not ( = ?auto_238325 ?auto_238330 ) ) ( not ( = ?auto_238325 ?auto_238331 ) ) ( not ( = ?auto_238325 ?auto_238332 ) ) ( not ( = ?auto_238325 ?auto_238333 ) ) ( not ( = ?auto_238325 ?auto_238334 ) ) ( not ( = ?auto_238325 ?auto_238335 ) ) ( not ( = ?auto_238326 ?auto_238327 ) ) ( not ( = ?auto_238326 ?auto_238328 ) ) ( not ( = ?auto_238326 ?auto_238329 ) ) ( not ( = ?auto_238326 ?auto_238330 ) ) ( not ( = ?auto_238326 ?auto_238331 ) ) ( not ( = ?auto_238326 ?auto_238332 ) ) ( not ( = ?auto_238326 ?auto_238333 ) ) ( not ( = ?auto_238326 ?auto_238334 ) ) ( not ( = ?auto_238326 ?auto_238335 ) ) ( not ( = ?auto_238327 ?auto_238328 ) ) ( not ( = ?auto_238327 ?auto_238329 ) ) ( not ( = ?auto_238327 ?auto_238330 ) ) ( not ( = ?auto_238327 ?auto_238331 ) ) ( not ( = ?auto_238327 ?auto_238332 ) ) ( not ( = ?auto_238327 ?auto_238333 ) ) ( not ( = ?auto_238327 ?auto_238334 ) ) ( not ( = ?auto_238327 ?auto_238335 ) ) ( not ( = ?auto_238328 ?auto_238329 ) ) ( not ( = ?auto_238328 ?auto_238330 ) ) ( not ( = ?auto_238328 ?auto_238331 ) ) ( not ( = ?auto_238328 ?auto_238332 ) ) ( not ( = ?auto_238328 ?auto_238333 ) ) ( not ( = ?auto_238328 ?auto_238334 ) ) ( not ( = ?auto_238328 ?auto_238335 ) ) ( not ( = ?auto_238329 ?auto_238330 ) ) ( not ( = ?auto_238329 ?auto_238331 ) ) ( not ( = ?auto_238329 ?auto_238332 ) ) ( not ( = ?auto_238329 ?auto_238333 ) ) ( not ( = ?auto_238329 ?auto_238334 ) ) ( not ( = ?auto_238329 ?auto_238335 ) ) ( not ( = ?auto_238330 ?auto_238331 ) ) ( not ( = ?auto_238330 ?auto_238332 ) ) ( not ( = ?auto_238330 ?auto_238333 ) ) ( not ( = ?auto_238330 ?auto_238334 ) ) ( not ( = ?auto_238330 ?auto_238335 ) ) ( not ( = ?auto_238331 ?auto_238332 ) ) ( not ( = ?auto_238331 ?auto_238333 ) ) ( not ( = ?auto_238331 ?auto_238334 ) ) ( not ( = ?auto_238331 ?auto_238335 ) ) ( not ( = ?auto_238332 ?auto_238333 ) ) ( not ( = ?auto_238332 ?auto_238334 ) ) ( not ( = ?auto_238332 ?auto_238335 ) ) ( not ( = ?auto_238333 ?auto_238334 ) ) ( not ( = ?auto_238333 ?auto_238335 ) ) ( not ( = ?auto_238334 ?auto_238335 ) ) ( ON ?auto_238333 ?auto_238334 ) ( ON ?auto_238332 ?auto_238333 ) ( ON ?auto_238331 ?auto_238332 ) ( ON ?auto_238330 ?auto_238331 ) ( ON ?auto_238329 ?auto_238330 ) ( ON ?auto_238328 ?auto_238329 ) ( ON ?auto_238327 ?auto_238328 ) ( CLEAR ?auto_238325 ) ( ON ?auto_238326 ?auto_238327 ) ( CLEAR ?auto_238326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_238325 ?auto_238326 )
      ( MAKE-10PILE ?auto_238325 ?auto_238326 ?auto_238327 ?auto_238328 ?auto_238329 ?auto_238330 ?auto_238331 ?auto_238332 ?auto_238333 ?auto_238334 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238346 - BLOCK
      ?auto_238347 - BLOCK
      ?auto_238348 - BLOCK
      ?auto_238349 - BLOCK
      ?auto_238350 - BLOCK
      ?auto_238351 - BLOCK
      ?auto_238352 - BLOCK
      ?auto_238353 - BLOCK
      ?auto_238354 - BLOCK
      ?auto_238355 - BLOCK
    )
    :vars
    (
      ?auto_238356 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238355 ?auto_238356 ) ( not ( = ?auto_238346 ?auto_238347 ) ) ( not ( = ?auto_238346 ?auto_238348 ) ) ( not ( = ?auto_238346 ?auto_238349 ) ) ( not ( = ?auto_238346 ?auto_238350 ) ) ( not ( = ?auto_238346 ?auto_238351 ) ) ( not ( = ?auto_238346 ?auto_238352 ) ) ( not ( = ?auto_238346 ?auto_238353 ) ) ( not ( = ?auto_238346 ?auto_238354 ) ) ( not ( = ?auto_238346 ?auto_238355 ) ) ( not ( = ?auto_238346 ?auto_238356 ) ) ( not ( = ?auto_238347 ?auto_238348 ) ) ( not ( = ?auto_238347 ?auto_238349 ) ) ( not ( = ?auto_238347 ?auto_238350 ) ) ( not ( = ?auto_238347 ?auto_238351 ) ) ( not ( = ?auto_238347 ?auto_238352 ) ) ( not ( = ?auto_238347 ?auto_238353 ) ) ( not ( = ?auto_238347 ?auto_238354 ) ) ( not ( = ?auto_238347 ?auto_238355 ) ) ( not ( = ?auto_238347 ?auto_238356 ) ) ( not ( = ?auto_238348 ?auto_238349 ) ) ( not ( = ?auto_238348 ?auto_238350 ) ) ( not ( = ?auto_238348 ?auto_238351 ) ) ( not ( = ?auto_238348 ?auto_238352 ) ) ( not ( = ?auto_238348 ?auto_238353 ) ) ( not ( = ?auto_238348 ?auto_238354 ) ) ( not ( = ?auto_238348 ?auto_238355 ) ) ( not ( = ?auto_238348 ?auto_238356 ) ) ( not ( = ?auto_238349 ?auto_238350 ) ) ( not ( = ?auto_238349 ?auto_238351 ) ) ( not ( = ?auto_238349 ?auto_238352 ) ) ( not ( = ?auto_238349 ?auto_238353 ) ) ( not ( = ?auto_238349 ?auto_238354 ) ) ( not ( = ?auto_238349 ?auto_238355 ) ) ( not ( = ?auto_238349 ?auto_238356 ) ) ( not ( = ?auto_238350 ?auto_238351 ) ) ( not ( = ?auto_238350 ?auto_238352 ) ) ( not ( = ?auto_238350 ?auto_238353 ) ) ( not ( = ?auto_238350 ?auto_238354 ) ) ( not ( = ?auto_238350 ?auto_238355 ) ) ( not ( = ?auto_238350 ?auto_238356 ) ) ( not ( = ?auto_238351 ?auto_238352 ) ) ( not ( = ?auto_238351 ?auto_238353 ) ) ( not ( = ?auto_238351 ?auto_238354 ) ) ( not ( = ?auto_238351 ?auto_238355 ) ) ( not ( = ?auto_238351 ?auto_238356 ) ) ( not ( = ?auto_238352 ?auto_238353 ) ) ( not ( = ?auto_238352 ?auto_238354 ) ) ( not ( = ?auto_238352 ?auto_238355 ) ) ( not ( = ?auto_238352 ?auto_238356 ) ) ( not ( = ?auto_238353 ?auto_238354 ) ) ( not ( = ?auto_238353 ?auto_238355 ) ) ( not ( = ?auto_238353 ?auto_238356 ) ) ( not ( = ?auto_238354 ?auto_238355 ) ) ( not ( = ?auto_238354 ?auto_238356 ) ) ( not ( = ?auto_238355 ?auto_238356 ) ) ( ON ?auto_238354 ?auto_238355 ) ( ON ?auto_238353 ?auto_238354 ) ( ON ?auto_238352 ?auto_238353 ) ( ON ?auto_238351 ?auto_238352 ) ( ON ?auto_238350 ?auto_238351 ) ( ON ?auto_238349 ?auto_238350 ) ( ON ?auto_238348 ?auto_238349 ) ( ON ?auto_238347 ?auto_238348 ) ( ON ?auto_238346 ?auto_238347 ) ( CLEAR ?auto_238346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_238346 )
      ( MAKE-10PILE ?auto_238346 ?auto_238347 ?auto_238348 ?auto_238349 ?auto_238350 ?auto_238351 ?auto_238352 ?auto_238353 ?auto_238354 ?auto_238355 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_238367 - BLOCK
      ?auto_238368 - BLOCK
      ?auto_238369 - BLOCK
      ?auto_238370 - BLOCK
      ?auto_238371 - BLOCK
      ?auto_238372 - BLOCK
      ?auto_238373 - BLOCK
      ?auto_238374 - BLOCK
      ?auto_238375 - BLOCK
      ?auto_238376 - BLOCK
    )
    :vars
    (
      ?auto_238377 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238376 ?auto_238377 ) ( not ( = ?auto_238367 ?auto_238368 ) ) ( not ( = ?auto_238367 ?auto_238369 ) ) ( not ( = ?auto_238367 ?auto_238370 ) ) ( not ( = ?auto_238367 ?auto_238371 ) ) ( not ( = ?auto_238367 ?auto_238372 ) ) ( not ( = ?auto_238367 ?auto_238373 ) ) ( not ( = ?auto_238367 ?auto_238374 ) ) ( not ( = ?auto_238367 ?auto_238375 ) ) ( not ( = ?auto_238367 ?auto_238376 ) ) ( not ( = ?auto_238367 ?auto_238377 ) ) ( not ( = ?auto_238368 ?auto_238369 ) ) ( not ( = ?auto_238368 ?auto_238370 ) ) ( not ( = ?auto_238368 ?auto_238371 ) ) ( not ( = ?auto_238368 ?auto_238372 ) ) ( not ( = ?auto_238368 ?auto_238373 ) ) ( not ( = ?auto_238368 ?auto_238374 ) ) ( not ( = ?auto_238368 ?auto_238375 ) ) ( not ( = ?auto_238368 ?auto_238376 ) ) ( not ( = ?auto_238368 ?auto_238377 ) ) ( not ( = ?auto_238369 ?auto_238370 ) ) ( not ( = ?auto_238369 ?auto_238371 ) ) ( not ( = ?auto_238369 ?auto_238372 ) ) ( not ( = ?auto_238369 ?auto_238373 ) ) ( not ( = ?auto_238369 ?auto_238374 ) ) ( not ( = ?auto_238369 ?auto_238375 ) ) ( not ( = ?auto_238369 ?auto_238376 ) ) ( not ( = ?auto_238369 ?auto_238377 ) ) ( not ( = ?auto_238370 ?auto_238371 ) ) ( not ( = ?auto_238370 ?auto_238372 ) ) ( not ( = ?auto_238370 ?auto_238373 ) ) ( not ( = ?auto_238370 ?auto_238374 ) ) ( not ( = ?auto_238370 ?auto_238375 ) ) ( not ( = ?auto_238370 ?auto_238376 ) ) ( not ( = ?auto_238370 ?auto_238377 ) ) ( not ( = ?auto_238371 ?auto_238372 ) ) ( not ( = ?auto_238371 ?auto_238373 ) ) ( not ( = ?auto_238371 ?auto_238374 ) ) ( not ( = ?auto_238371 ?auto_238375 ) ) ( not ( = ?auto_238371 ?auto_238376 ) ) ( not ( = ?auto_238371 ?auto_238377 ) ) ( not ( = ?auto_238372 ?auto_238373 ) ) ( not ( = ?auto_238372 ?auto_238374 ) ) ( not ( = ?auto_238372 ?auto_238375 ) ) ( not ( = ?auto_238372 ?auto_238376 ) ) ( not ( = ?auto_238372 ?auto_238377 ) ) ( not ( = ?auto_238373 ?auto_238374 ) ) ( not ( = ?auto_238373 ?auto_238375 ) ) ( not ( = ?auto_238373 ?auto_238376 ) ) ( not ( = ?auto_238373 ?auto_238377 ) ) ( not ( = ?auto_238374 ?auto_238375 ) ) ( not ( = ?auto_238374 ?auto_238376 ) ) ( not ( = ?auto_238374 ?auto_238377 ) ) ( not ( = ?auto_238375 ?auto_238376 ) ) ( not ( = ?auto_238375 ?auto_238377 ) ) ( not ( = ?auto_238376 ?auto_238377 ) ) ( ON ?auto_238375 ?auto_238376 ) ( ON ?auto_238374 ?auto_238375 ) ( ON ?auto_238373 ?auto_238374 ) ( ON ?auto_238372 ?auto_238373 ) ( ON ?auto_238371 ?auto_238372 ) ( ON ?auto_238370 ?auto_238371 ) ( ON ?auto_238369 ?auto_238370 ) ( ON ?auto_238368 ?auto_238369 ) ( ON ?auto_238367 ?auto_238368 ) ( CLEAR ?auto_238367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_238367 )
      ( MAKE-10PILE ?auto_238367 ?auto_238368 ?auto_238369 ?auto_238370 ?auto_238371 ?auto_238372 ?auto_238373 ?auto_238374 ?auto_238375 ?auto_238376 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238389 - BLOCK
      ?auto_238390 - BLOCK
      ?auto_238391 - BLOCK
      ?auto_238392 - BLOCK
      ?auto_238393 - BLOCK
      ?auto_238394 - BLOCK
      ?auto_238395 - BLOCK
      ?auto_238396 - BLOCK
      ?auto_238397 - BLOCK
      ?auto_238398 - BLOCK
      ?auto_238399 - BLOCK
    )
    :vars
    (
      ?auto_238400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_238398 ) ( ON ?auto_238399 ?auto_238400 ) ( CLEAR ?auto_238399 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_238389 ) ( ON ?auto_238390 ?auto_238389 ) ( ON ?auto_238391 ?auto_238390 ) ( ON ?auto_238392 ?auto_238391 ) ( ON ?auto_238393 ?auto_238392 ) ( ON ?auto_238394 ?auto_238393 ) ( ON ?auto_238395 ?auto_238394 ) ( ON ?auto_238396 ?auto_238395 ) ( ON ?auto_238397 ?auto_238396 ) ( ON ?auto_238398 ?auto_238397 ) ( not ( = ?auto_238389 ?auto_238390 ) ) ( not ( = ?auto_238389 ?auto_238391 ) ) ( not ( = ?auto_238389 ?auto_238392 ) ) ( not ( = ?auto_238389 ?auto_238393 ) ) ( not ( = ?auto_238389 ?auto_238394 ) ) ( not ( = ?auto_238389 ?auto_238395 ) ) ( not ( = ?auto_238389 ?auto_238396 ) ) ( not ( = ?auto_238389 ?auto_238397 ) ) ( not ( = ?auto_238389 ?auto_238398 ) ) ( not ( = ?auto_238389 ?auto_238399 ) ) ( not ( = ?auto_238389 ?auto_238400 ) ) ( not ( = ?auto_238390 ?auto_238391 ) ) ( not ( = ?auto_238390 ?auto_238392 ) ) ( not ( = ?auto_238390 ?auto_238393 ) ) ( not ( = ?auto_238390 ?auto_238394 ) ) ( not ( = ?auto_238390 ?auto_238395 ) ) ( not ( = ?auto_238390 ?auto_238396 ) ) ( not ( = ?auto_238390 ?auto_238397 ) ) ( not ( = ?auto_238390 ?auto_238398 ) ) ( not ( = ?auto_238390 ?auto_238399 ) ) ( not ( = ?auto_238390 ?auto_238400 ) ) ( not ( = ?auto_238391 ?auto_238392 ) ) ( not ( = ?auto_238391 ?auto_238393 ) ) ( not ( = ?auto_238391 ?auto_238394 ) ) ( not ( = ?auto_238391 ?auto_238395 ) ) ( not ( = ?auto_238391 ?auto_238396 ) ) ( not ( = ?auto_238391 ?auto_238397 ) ) ( not ( = ?auto_238391 ?auto_238398 ) ) ( not ( = ?auto_238391 ?auto_238399 ) ) ( not ( = ?auto_238391 ?auto_238400 ) ) ( not ( = ?auto_238392 ?auto_238393 ) ) ( not ( = ?auto_238392 ?auto_238394 ) ) ( not ( = ?auto_238392 ?auto_238395 ) ) ( not ( = ?auto_238392 ?auto_238396 ) ) ( not ( = ?auto_238392 ?auto_238397 ) ) ( not ( = ?auto_238392 ?auto_238398 ) ) ( not ( = ?auto_238392 ?auto_238399 ) ) ( not ( = ?auto_238392 ?auto_238400 ) ) ( not ( = ?auto_238393 ?auto_238394 ) ) ( not ( = ?auto_238393 ?auto_238395 ) ) ( not ( = ?auto_238393 ?auto_238396 ) ) ( not ( = ?auto_238393 ?auto_238397 ) ) ( not ( = ?auto_238393 ?auto_238398 ) ) ( not ( = ?auto_238393 ?auto_238399 ) ) ( not ( = ?auto_238393 ?auto_238400 ) ) ( not ( = ?auto_238394 ?auto_238395 ) ) ( not ( = ?auto_238394 ?auto_238396 ) ) ( not ( = ?auto_238394 ?auto_238397 ) ) ( not ( = ?auto_238394 ?auto_238398 ) ) ( not ( = ?auto_238394 ?auto_238399 ) ) ( not ( = ?auto_238394 ?auto_238400 ) ) ( not ( = ?auto_238395 ?auto_238396 ) ) ( not ( = ?auto_238395 ?auto_238397 ) ) ( not ( = ?auto_238395 ?auto_238398 ) ) ( not ( = ?auto_238395 ?auto_238399 ) ) ( not ( = ?auto_238395 ?auto_238400 ) ) ( not ( = ?auto_238396 ?auto_238397 ) ) ( not ( = ?auto_238396 ?auto_238398 ) ) ( not ( = ?auto_238396 ?auto_238399 ) ) ( not ( = ?auto_238396 ?auto_238400 ) ) ( not ( = ?auto_238397 ?auto_238398 ) ) ( not ( = ?auto_238397 ?auto_238399 ) ) ( not ( = ?auto_238397 ?auto_238400 ) ) ( not ( = ?auto_238398 ?auto_238399 ) ) ( not ( = ?auto_238398 ?auto_238400 ) ) ( not ( = ?auto_238399 ?auto_238400 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_238399 ?auto_238400 )
      ( !STACK ?auto_238399 ?auto_238398 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238412 - BLOCK
      ?auto_238413 - BLOCK
      ?auto_238414 - BLOCK
      ?auto_238415 - BLOCK
      ?auto_238416 - BLOCK
      ?auto_238417 - BLOCK
      ?auto_238418 - BLOCK
      ?auto_238419 - BLOCK
      ?auto_238420 - BLOCK
      ?auto_238421 - BLOCK
      ?auto_238422 - BLOCK
    )
    :vars
    (
      ?auto_238423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_238421 ) ( ON ?auto_238422 ?auto_238423 ) ( CLEAR ?auto_238422 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_238412 ) ( ON ?auto_238413 ?auto_238412 ) ( ON ?auto_238414 ?auto_238413 ) ( ON ?auto_238415 ?auto_238414 ) ( ON ?auto_238416 ?auto_238415 ) ( ON ?auto_238417 ?auto_238416 ) ( ON ?auto_238418 ?auto_238417 ) ( ON ?auto_238419 ?auto_238418 ) ( ON ?auto_238420 ?auto_238419 ) ( ON ?auto_238421 ?auto_238420 ) ( not ( = ?auto_238412 ?auto_238413 ) ) ( not ( = ?auto_238412 ?auto_238414 ) ) ( not ( = ?auto_238412 ?auto_238415 ) ) ( not ( = ?auto_238412 ?auto_238416 ) ) ( not ( = ?auto_238412 ?auto_238417 ) ) ( not ( = ?auto_238412 ?auto_238418 ) ) ( not ( = ?auto_238412 ?auto_238419 ) ) ( not ( = ?auto_238412 ?auto_238420 ) ) ( not ( = ?auto_238412 ?auto_238421 ) ) ( not ( = ?auto_238412 ?auto_238422 ) ) ( not ( = ?auto_238412 ?auto_238423 ) ) ( not ( = ?auto_238413 ?auto_238414 ) ) ( not ( = ?auto_238413 ?auto_238415 ) ) ( not ( = ?auto_238413 ?auto_238416 ) ) ( not ( = ?auto_238413 ?auto_238417 ) ) ( not ( = ?auto_238413 ?auto_238418 ) ) ( not ( = ?auto_238413 ?auto_238419 ) ) ( not ( = ?auto_238413 ?auto_238420 ) ) ( not ( = ?auto_238413 ?auto_238421 ) ) ( not ( = ?auto_238413 ?auto_238422 ) ) ( not ( = ?auto_238413 ?auto_238423 ) ) ( not ( = ?auto_238414 ?auto_238415 ) ) ( not ( = ?auto_238414 ?auto_238416 ) ) ( not ( = ?auto_238414 ?auto_238417 ) ) ( not ( = ?auto_238414 ?auto_238418 ) ) ( not ( = ?auto_238414 ?auto_238419 ) ) ( not ( = ?auto_238414 ?auto_238420 ) ) ( not ( = ?auto_238414 ?auto_238421 ) ) ( not ( = ?auto_238414 ?auto_238422 ) ) ( not ( = ?auto_238414 ?auto_238423 ) ) ( not ( = ?auto_238415 ?auto_238416 ) ) ( not ( = ?auto_238415 ?auto_238417 ) ) ( not ( = ?auto_238415 ?auto_238418 ) ) ( not ( = ?auto_238415 ?auto_238419 ) ) ( not ( = ?auto_238415 ?auto_238420 ) ) ( not ( = ?auto_238415 ?auto_238421 ) ) ( not ( = ?auto_238415 ?auto_238422 ) ) ( not ( = ?auto_238415 ?auto_238423 ) ) ( not ( = ?auto_238416 ?auto_238417 ) ) ( not ( = ?auto_238416 ?auto_238418 ) ) ( not ( = ?auto_238416 ?auto_238419 ) ) ( not ( = ?auto_238416 ?auto_238420 ) ) ( not ( = ?auto_238416 ?auto_238421 ) ) ( not ( = ?auto_238416 ?auto_238422 ) ) ( not ( = ?auto_238416 ?auto_238423 ) ) ( not ( = ?auto_238417 ?auto_238418 ) ) ( not ( = ?auto_238417 ?auto_238419 ) ) ( not ( = ?auto_238417 ?auto_238420 ) ) ( not ( = ?auto_238417 ?auto_238421 ) ) ( not ( = ?auto_238417 ?auto_238422 ) ) ( not ( = ?auto_238417 ?auto_238423 ) ) ( not ( = ?auto_238418 ?auto_238419 ) ) ( not ( = ?auto_238418 ?auto_238420 ) ) ( not ( = ?auto_238418 ?auto_238421 ) ) ( not ( = ?auto_238418 ?auto_238422 ) ) ( not ( = ?auto_238418 ?auto_238423 ) ) ( not ( = ?auto_238419 ?auto_238420 ) ) ( not ( = ?auto_238419 ?auto_238421 ) ) ( not ( = ?auto_238419 ?auto_238422 ) ) ( not ( = ?auto_238419 ?auto_238423 ) ) ( not ( = ?auto_238420 ?auto_238421 ) ) ( not ( = ?auto_238420 ?auto_238422 ) ) ( not ( = ?auto_238420 ?auto_238423 ) ) ( not ( = ?auto_238421 ?auto_238422 ) ) ( not ( = ?auto_238421 ?auto_238423 ) ) ( not ( = ?auto_238422 ?auto_238423 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_238422 ?auto_238423 )
      ( !STACK ?auto_238422 ?auto_238421 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238435 - BLOCK
      ?auto_238436 - BLOCK
      ?auto_238437 - BLOCK
      ?auto_238438 - BLOCK
      ?auto_238439 - BLOCK
      ?auto_238440 - BLOCK
      ?auto_238441 - BLOCK
      ?auto_238442 - BLOCK
      ?auto_238443 - BLOCK
      ?auto_238444 - BLOCK
      ?auto_238445 - BLOCK
    )
    :vars
    (
      ?auto_238446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238445 ?auto_238446 ) ( ON-TABLE ?auto_238435 ) ( ON ?auto_238436 ?auto_238435 ) ( ON ?auto_238437 ?auto_238436 ) ( ON ?auto_238438 ?auto_238437 ) ( ON ?auto_238439 ?auto_238438 ) ( ON ?auto_238440 ?auto_238439 ) ( ON ?auto_238441 ?auto_238440 ) ( ON ?auto_238442 ?auto_238441 ) ( ON ?auto_238443 ?auto_238442 ) ( not ( = ?auto_238435 ?auto_238436 ) ) ( not ( = ?auto_238435 ?auto_238437 ) ) ( not ( = ?auto_238435 ?auto_238438 ) ) ( not ( = ?auto_238435 ?auto_238439 ) ) ( not ( = ?auto_238435 ?auto_238440 ) ) ( not ( = ?auto_238435 ?auto_238441 ) ) ( not ( = ?auto_238435 ?auto_238442 ) ) ( not ( = ?auto_238435 ?auto_238443 ) ) ( not ( = ?auto_238435 ?auto_238444 ) ) ( not ( = ?auto_238435 ?auto_238445 ) ) ( not ( = ?auto_238435 ?auto_238446 ) ) ( not ( = ?auto_238436 ?auto_238437 ) ) ( not ( = ?auto_238436 ?auto_238438 ) ) ( not ( = ?auto_238436 ?auto_238439 ) ) ( not ( = ?auto_238436 ?auto_238440 ) ) ( not ( = ?auto_238436 ?auto_238441 ) ) ( not ( = ?auto_238436 ?auto_238442 ) ) ( not ( = ?auto_238436 ?auto_238443 ) ) ( not ( = ?auto_238436 ?auto_238444 ) ) ( not ( = ?auto_238436 ?auto_238445 ) ) ( not ( = ?auto_238436 ?auto_238446 ) ) ( not ( = ?auto_238437 ?auto_238438 ) ) ( not ( = ?auto_238437 ?auto_238439 ) ) ( not ( = ?auto_238437 ?auto_238440 ) ) ( not ( = ?auto_238437 ?auto_238441 ) ) ( not ( = ?auto_238437 ?auto_238442 ) ) ( not ( = ?auto_238437 ?auto_238443 ) ) ( not ( = ?auto_238437 ?auto_238444 ) ) ( not ( = ?auto_238437 ?auto_238445 ) ) ( not ( = ?auto_238437 ?auto_238446 ) ) ( not ( = ?auto_238438 ?auto_238439 ) ) ( not ( = ?auto_238438 ?auto_238440 ) ) ( not ( = ?auto_238438 ?auto_238441 ) ) ( not ( = ?auto_238438 ?auto_238442 ) ) ( not ( = ?auto_238438 ?auto_238443 ) ) ( not ( = ?auto_238438 ?auto_238444 ) ) ( not ( = ?auto_238438 ?auto_238445 ) ) ( not ( = ?auto_238438 ?auto_238446 ) ) ( not ( = ?auto_238439 ?auto_238440 ) ) ( not ( = ?auto_238439 ?auto_238441 ) ) ( not ( = ?auto_238439 ?auto_238442 ) ) ( not ( = ?auto_238439 ?auto_238443 ) ) ( not ( = ?auto_238439 ?auto_238444 ) ) ( not ( = ?auto_238439 ?auto_238445 ) ) ( not ( = ?auto_238439 ?auto_238446 ) ) ( not ( = ?auto_238440 ?auto_238441 ) ) ( not ( = ?auto_238440 ?auto_238442 ) ) ( not ( = ?auto_238440 ?auto_238443 ) ) ( not ( = ?auto_238440 ?auto_238444 ) ) ( not ( = ?auto_238440 ?auto_238445 ) ) ( not ( = ?auto_238440 ?auto_238446 ) ) ( not ( = ?auto_238441 ?auto_238442 ) ) ( not ( = ?auto_238441 ?auto_238443 ) ) ( not ( = ?auto_238441 ?auto_238444 ) ) ( not ( = ?auto_238441 ?auto_238445 ) ) ( not ( = ?auto_238441 ?auto_238446 ) ) ( not ( = ?auto_238442 ?auto_238443 ) ) ( not ( = ?auto_238442 ?auto_238444 ) ) ( not ( = ?auto_238442 ?auto_238445 ) ) ( not ( = ?auto_238442 ?auto_238446 ) ) ( not ( = ?auto_238443 ?auto_238444 ) ) ( not ( = ?auto_238443 ?auto_238445 ) ) ( not ( = ?auto_238443 ?auto_238446 ) ) ( not ( = ?auto_238444 ?auto_238445 ) ) ( not ( = ?auto_238444 ?auto_238446 ) ) ( not ( = ?auto_238445 ?auto_238446 ) ) ( CLEAR ?auto_238443 ) ( ON ?auto_238444 ?auto_238445 ) ( CLEAR ?auto_238444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_238435 ?auto_238436 ?auto_238437 ?auto_238438 ?auto_238439 ?auto_238440 ?auto_238441 ?auto_238442 ?auto_238443 ?auto_238444 )
      ( MAKE-11PILE ?auto_238435 ?auto_238436 ?auto_238437 ?auto_238438 ?auto_238439 ?auto_238440 ?auto_238441 ?auto_238442 ?auto_238443 ?auto_238444 ?auto_238445 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238458 - BLOCK
      ?auto_238459 - BLOCK
      ?auto_238460 - BLOCK
      ?auto_238461 - BLOCK
      ?auto_238462 - BLOCK
      ?auto_238463 - BLOCK
      ?auto_238464 - BLOCK
      ?auto_238465 - BLOCK
      ?auto_238466 - BLOCK
      ?auto_238467 - BLOCK
      ?auto_238468 - BLOCK
    )
    :vars
    (
      ?auto_238469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238468 ?auto_238469 ) ( ON-TABLE ?auto_238458 ) ( ON ?auto_238459 ?auto_238458 ) ( ON ?auto_238460 ?auto_238459 ) ( ON ?auto_238461 ?auto_238460 ) ( ON ?auto_238462 ?auto_238461 ) ( ON ?auto_238463 ?auto_238462 ) ( ON ?auto_238464 ?auto_238463 ) ( ON ?auto_238465 ?auto_238464 ) ( ON ?auto_238466 ?auto_238465 ) ( not ( = ?auto_238458 ?auto_238459 ) ) ( not ( = ?auto_238458 ?auto_238460 ) ) ( not ( = ?auto_238458 ?auto_238461 ) ) ( not ( = ?auto_238458 ?auto_238462 ) ) ( not ( = ?auto_238458 ?auto_238463 ) ) ( not ( = ?auto_238458 ?auto_238464 ) ) ( not ( = ?auto_238458 ?auto_238465 ) ) ( not ( = ?auto_238458 ?auto_238466 ) ) ( not ( = ?auto_238458 ?auto_238467 ) ) ( not ( = ?auto_238458 ?auto_238468 ) ) ( not ( = ?auto_238458 ?auto_238469 ) ) ( not ( = ?auto_238459 ?auto_238460 ) ) ( not ( = ?auto_238459 ?auto_238461 ) ) ( not ( = ?auto_238459 ?auto_238462 ) ) ( not ( = ?auto_238459 ?auto_238463 ) ) ( not ( = ?auto_238459 ?auto_238464 ) ) ( not ( = ?auto_238459 ?auto_238465 ) ) ( not ( = ?auto_238459 ?auto_238466 ) ) ( not ( = ?auto_238459 ?auto_238467 ) ) ( not ( = ?auto_238459 ?auto_238468 ) ) ( not ( = ?auto_238459 ?auto_238469 ) ) ( not ( = ?auto_238460 ?auto_238461 ) ) ( not ( = ?auto_238460 ?auto_238462 ) ) ( not ( = ?auto_238460 ?auto_238463 ) ) ( not ( = ?auto_238460 ?auto_238464 ) ) ( not ( = ?auto_238460 ?auto_238465 ) ) ( not ( = ?auto_238460 ?auto_238466 ) ) ( not ( = ?auto_238460 ?auto_238467 ) ) ( not ( = ?auto_238460 ?auto_238468 ) ) ( not ( = ?auto_238460 ?auto_238469 ) ) ( not ( = ?auto_238461 ?auto_238462 ) ) ( not ( = ?auto_238461 ?auto_238463 ) ) ( not ( = ?auto_238461 ?auto_238464 ) ) ( not ( = ?auto_238461 ?auto_238465 ) ) ( not ( = ?auto_238461 ?auto_238466 ) ) ( not ( = ?auto_238461 ?auto_238467 ) ) ( not ( = ?auto_238461 ?auto_238468 ) ) ( not ( = ?auto_238461 ?auto_238469 ) ) ( not ( = ?auto_238462 ?auto_238463 ) ) ( not ( = ?auto_238462 ?auto_238464 ) ) ( not ( = ?auto_238462 ?auto_238465 ) ) ( not ( = ?auto_238462 ?auto_238466 ) ) ( not ( = ?auto_238462 ?auto_238467 ) ) ( not ( = ?auto_238462 ?auto_238468 ) ) ( not ( = ?auto_238462 ?auto_238469 ) ) ( not ( = ?auto_238463 ?auto_238464 ) ) ( not ( = ?auto_238463 ?auto_238465 ) ) ( not ( = ?auto_238463 ?auto_238466 ) ) ( not ( = ?auto_238463 ?auto_238467 ) ) ( not ( = ?auto_238463 ?auto_238468 ) ) ( not ( = ?auto_238463 ?auto_238469 ) ) ( not ( = ?auto_238464 ?auto_238465 ) ) ( not ( = ?auto_238464 ?auto_238466 ) ) ( not ( = ?auto_238464 ?auto_238467 ) ) ( not ( = ?auto_238464 ?auto_238468 ) ) ( not ( = ?auto_238464 ?auto_238469 ) ) ( not ( = ?auto_238465 ?auto_238466 ) ) ( not ( = ?auto_238465 ?auto_238467 ) ) ( not ( = ?auto_238465 ?auto_238468 ) ) ( not ( = ?auto_238465 ?auto_238469 ) ) ( not ( = ?auto_238466 ?auto_238467 ) ) ( not ( = ?auto_238466 ?auto_238468 ) ) ( not ( = ?auto_238466 ?auto_238469 ) ) ( not ( = ?auto_238467 ?auto_238468 ) ) ( not ( = ?auto_238467 ?auto_238469 ) ) ( not ( = ?auto_238468 ?auto_238469 ) ) ( CLEAR ?auto_238466 ) ( ON ?auto_238467 ?auto_238468 ) ( CLEAR ?auto_238467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_238458 ?auto_238459 ?auto_238460 ?auto_238461 ?auto_238462 ?auto_238463 ?auto_238464 ?auto_238465 ?auto_238466 ?auto_238467 )
      ( MAKE-11PILE ?auto_238458 ?auto_238459 ?auto_238460 ?auto_238461 ?auto_238462 ?auto_238463 ?auto_238464 ?auto_238465 ?auto_238466 ?auto_238467 ?auto_238468 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238481 - BLOCK
      ?auto_238482 - BLOCK
      ?auto_238483 - BLOCK
      ?auto_238484 - BLOCK
      ?auto_238485 - BLOCK
      ?auto_238486 - BLOCK
      ?auto_238487 - BLOCK
      ?auto_238488 - BLOCK
      ?auto_238489 - BLOCK
      ?auto_238490 - BLOCK
      ?auto_238491 - BLOCK
    )
    :vars
    (
      ?auto_238492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238491 ?auto_238492 ) ( ON-TABLE ?auto_238481 ) ( ON ?auto_238482 ?auto_238481 ) ( ON ?auto_238483 ?auto_238482 ) ( ON ?auto_238484 ?auto_238483 ) ( ON ?auto_238485 ?auto_238484 ) ( ON ?auto_238486 ?auto_238485 ) ( ON ?auto_238487 ?auto_238486 ) ( ON ?auto_238488 ?auto_238487 ) ( not ( = ?auto_238481 ?auto_238482 ) ) ( not ( = ?auto_238481 ?auto_238483 ) ) ( not ( = ?auto_238481 ?auto_238484 ) ) ( not ( = ?auto_238481 ?auto_238485 ) ) ( not ( = ?auto_238481 ?auto_238486 ) ) ( not ( = ?auto_238481 ?auto_238487 ) ) ( not ( = ?auto_238481 ?auto_238488 ) ) ( not ( = ?auto_238481 ?auto_238489 ) ) ( not ( = ?auto_238481 ?auto_238490 ) ) ( not ( = ?auto_238481 ?auto_238491 ) ) ( not ( = ?auto_238481 ?auto_238492 ) ) ( not ( = ?auto_238482 ?auto_238483 ) ) ( not ( = ?auto_238482 ?auto_238484 ) ) ( not ( = ?auto_238482 ?auto_238485 ) ) ( not ( = ?auto_238482 ?auto_238486 ) ) ( not ( = ?auto_238482 ?auto_238487 ) ) ( not ( = ?auto_238482 ?auto_238488 ) ) ( not ( = ?auto_238482 ?auto_238489 ) ) ( not ( = ?auto_238482 ?auto_238490 ) ) ( not ( = ?auto_238482 ?auto_238491 ) ) ( not ( = ?auto_238482 ?auto_238492 ) ) ( not ( = ?auto_238483 ?auto_238484 ) ) ( not ( = ?auto_238483 ?auto_238485 ) ) ( not ( = ?auto_238483 ?auto_238486 ) ) ( not ( = ?auto_238483 ?auto_238487 ) ) ( not ( = ?auto_238483 ?auto_238488 ) ) ( not ( = ?auto_238483 ?auto_238489 ) ) ( not ( = ?auto_238483 ?auto_238490 ) ) ( not ( = ?auto_238483 ?auto_238491 ) ) ( not ( = ?auto_238483 ?auto_238492 ) ) ( not ( = ?auto_238484 ?auto_238485 ) ) ( not ( = ?auto_238484 ?auto_238486 ) ) ( not ( = ?auto_238484 ?auto_238487 ) ) ( not ( = ?auto_238484 ?auto_238488 ) ) ( not ( = ?auto_238484 ?auto_238489 ) ) ( not ( = ?auto_238484 ?auto_238490 ) ) ( not ( = ?auto_238484 ?auto_238491 ) ) ( not ( = ?auto_238484 ?auto_238492 ) ) ( not ( = ?auto_238485 ?auto_238486 ) ) ( not ( = ?auto_238485 ?auto_238487 ) ) ( not ( = ?auto_238485 ?auto_238488 ) ) ( not ( = ?auto_238485 ?auto_238489 ) ) ( not ( = ?auto_238485 ?auto_238490 ) ) ( not ( = ?auto_238485 ?auto_238491 ) ) ( not ( = ?auto_238485 ?auto_238492 ) ) ( not ( = ?auto_238486 ?auto_238487 ) ) ( not ( = ?auto_238486 ?auto_238488 ) ) ( not ( = ?auto_238486 ?auto_238489 ) ) ( not ( = ?auto_238486 ?auto_238490 ) ) ( not ( = ?auto_238486 ?auto_238491 ) ) ( not ( = ?auto_238486 ?auto_238492 ) ) ( not ( = ?auto_238487 ?auto_238488 ) ) ( not ( = ?auto_238487 ?auto_238489 ) ) ( not ( = ?auto_238487 ?auto_238490 ) ) ( not ( = ?auto_238487 ?auto_238491 ) ) ( not ( = ?auto_238487 ?auto_238492 ) ) ( not ( = ?auto_238488 ?auto_238489 ) ) ( not ( = ?auto_238488 ?auto_238490 ) ) ( not ( = ?auto_238488 ?auto_238491 ) ) ( not ( = ?auto_238488 ?auto_238492 ) ) ( not ( = ?auto_238489 ?auto_238490 ) ) ( not ( = ?auto_238489 ?auto_238491 ) ) ( not ( = ?auto_238489 ?auto_238492 ) ) ( not ( = ?auto_238490 ?auto_238491 ) ) ( not ( = ?auto_238490 ?auto_238492 ) ) ( not ( = ?auto_238491 ?auto_238492 ) ) ( ON ?auto_238490 ?auto_238491 ) ( CLEAR ?auto_238488 ) ( ON ?auto_238489 ?auto_238490 ) ( CLEAR ?auto_238489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_238481 ?auto_238482 ?auto_238483 ?auto_238484 ?auto_238485 ?auto_238486 ?auto_238487 ?auto_238488 ?auto_238489 )
      ( MAKE-11PILE ?auto_238481 ?auto_238482 ?auto_238483 ?auto_238484 ?auto_238485 ?auto_238486 ?auto_238487 ?auto_238488 ?auto_238489 ?auto_238490 ?auto_238491 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238504 - BLOCK
      ?auto_238505 - BLOCK
      ?auto_238506 - BLOCK
      ?auto_238507 - BLOCK
      ?auto_238508 - BLOCK
      ?auto_238509 - BLOCK
      ?auto_238510 - BLOCK
      ?auto_238511 - BLOCK
      ?auto_238512 - BLOCK
      ?auto_238513 - BLOCK
      ?auto_238514 - BLOCK
    )
    :vars
    (
      ?auto_238515 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238514 ?auto_238515 ) ( ON-TABLE ?auto_238504 ) ( ON ?auto_238505 ?auto_238504 ) ( ON ?auto_238506 ?auto_238505 ) ( ON ?auto_238507 ?auto_238506 ) ( ON ?auto_238508 ?auto_238507 ) ( ON ?auto_238509 ?auto_238508 ) ( ON ?auto_238510 ?auto_238509 ) ( ON ?auto_238511 ?auto_238510 ) ( not ( = ?auto_238504 ?auto_238505 ) ) ( not ( = ?auto_238504 ?auto_238506 ) ) ( not ( = ?auto_238504 ?auto_238507 ) ) ( not ( = ?auto_238504 ?auto_238508 ) ) ( not ( = ?auto_238504 ?auto_238509 ) ) ( not ( = ?auto_238504 ?auto_238510 ) ) ( not ( = ?auto_238504 ?auto_238511 ) ) ( not ( = ?auto_238504 ?auto_238512 ) ) ( not ( = ?auto_238504 ?auto_238513 ) ) ( not ( = ?auto_238504 ?auto_238514 ) ) ( not ( = ?auto_238504 ?auto_238515 ) ) ( not ( = ?auto_238505 ?auto_238506 ) ) ( not ( = ?auto_238505 ?auto_238507 ) ) ( not ( = ?auto_238505 ?auto_238508 ) ) ( not ( = ?auto_238505 ?auto_238509 ) ) ( not ( = ?auto_238505 ?auto_238510 ) ) ( not ( = ?auto_238505 ?auto_238511 ) ) ( not ( = ?auto_238505 ?auto_238512 ) ) ( not ( = ?auto_238505 ?auto_238513 ) ) ( not ( = ?auto_238505 ?auto_238514 ) ) ( not ( = ?auto_238505 ?auto_238515 ) ) ( not ( = ?auto_238506 ?auto_238507 ) ) ( not ( = ?auto_238506 ?auto_238508 ) ) ( not ( = ?auto_238506 ?auto_238509 ) ) ( not ( = ?auto_238506 ?auto_238510 ) ) ( not ( = ?auto_238506 ?auto_238511 ) ) ( not ( = ?auto_238506 ?auto_238512 ) ) ( not ( = ?auto_238506 ?auto_238513 ) ) ( not ( = ?auto_238506 ?auto_238514 ) ) ( not ( = ?auto_238506 ?auto_238515 ) ) ( not ( = ?auto_238507 ?auto_238508 ) ) ( not ( = ?auto_238507 ?auto_238509 ) ) ( not ( = ?auto_238507 ?auto_238510 ) ) ( not ( = ?auto_238507 ?auto_238511 ) ) ( not ( = ?auto_238507 ?auto_238512 ) ) ( not ( = ?auto_238507 ?auto_238513 ) ) ( not ( = ?auto_238507 ?auto_238514 ) ) ( not ( = ?auto_238507 ?auto_238515 ) ) ( not ( = ?auto_238508 ?auto_238509 ) ) ( not ( = ?auto_238508 ?auto_238510 ) ) ( not ( = ?auto_238508 ?auto_238511 ) ) ( not ( = ?auto_238508 ?auto_238512 ) ) ( not ( = ?auto_238508 ?auto_238513 ) ) ( not ( = ?auto_238508 ?auto_238514 ) ) ( not ( = ?auto_238508 ?auto_238515 ) ) ( not ( = ?auto_238509 ?auto_238510 ) ) ( not ( = ?auto_238509 ?auto_238511 ) ) ( not ( = ?auto_238509 ?auto_238512 ) ) ( not ( = ?auto_238509 ?auto_238513 ) ) ( not ( = ?auto_238509 ?auto_238514 ) ) ( not ( = ?auto_238509 ?auto_238515 ) ) ( not ( = ?auto_238510 ?auto_238511 ) ) ( not ( = ?auto_238510 ?auto_238512 ) ) ( not ( = ?auto_238510 ?auto_238513 ) ) ( not ( = ?auto_238510 ?auto_238514 ) ) ( not ( = ?auto_238510 ?auto_238515 ) ) ( not ( = ?auto_238511 ?auto_238512 ) ) ( not ( = ?auto_238511 ?auto_238513 ) ) ( not ( = ?auto_238511 ?auto_238514 ) ) ( not ( = ?auto_238511 ?auto_238515 ) ) ( not ( = ?auto_238512 ?auto_238513 ) ) ( not ( = ?auto_238512 ?auto_238514 ) ) ( not ( = ?auto_238512 ?auto_238515 ) ) ( not ( = ?auto_238513 ?auto_238514 ) ) ( not ( = ?auto_238513 ?auto_238515 ) ) ( not ( = ?auto_238514 ?auto_238515 ) ) ( ON ?auto_238513 ?auto_238514 ) ( CLEAR ?auto_238511 ) ( ON ?auto_238512 ?auto_238513 ) ( CLEAR ?auto_238512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_238504 ?auto_238505 ?auto_238506 ?auto_238507 ?auto_238508 ?auto_238509 ?auto_238510 ?auto_238511 ?auto_238512 )
      ( MAKE-11PILE ?auto_238504 ?auto_238505 ?auto_238506 ?auto_238507 ?auto_238508 ?auto_238509 ?auto_238510 ?auto_238511 ?auto_238512 ?auto_238513 ?auto_238514 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238527 - BLOCK
      ?auto_238528 - BLOCK
      ?auto_238529 - BLOCK
      ?auto_238530 - BLOCK
      ?auto_238531 - BLOCK
      ?auto_238532 - BLOCK
      ?auto_238533 - BLOCK
      ?auto_238534 - BLOCK
      ?auto_238535 - BLOCK
      ?auto_238536 - BLOCK
      ?auto_238537 - BLOCK
    )
    :vars
    (
      ?auto_238538 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238537 ?auto_238538 ) ( ON-TABLE ?auto_238527 ) ( ON ?auto_238528 ?auto_238527 ) ( ON ?auto_238529 ?auto_238528 ) ( ON ?auto_238530 ?auto_238529 ) ( ON ?auto_238531 ?auto_238530 ) ( ON ?auto_238532 ?auto_238531 ) ( ON ?auto_238533 ?auto_238532 ) ( not ( = ?auto_238527 ?auto_238528 ) ) ( not ( = ?auto_238527 ?auto_238529 ) ) ( not ( = ?auto_238527 ?auto_238530 ) ) ( not ( = ?auto_238527 ?auto_238531 ) ) ( not ( = ?auto_238527 ?auto_238532 ) ) ( not ( = ?auto_238527 ?auto_238533 ) ) ( not ( = ?auto_238527 ?auto_238534 ) ) ( not ( = ?auto_238527 ?auto_238535 ) ) ( not ( = ?auto_238527 ?auto_238536 ) ) ( not ( = ?auto_238527 ?auto_238537 ) ) ( not ( = ?auto_238527 ?auto_238538 ) ) ( not ( = ?auto_238528 ?auto_238529 ) ) ( not ( = ?auto_238528 ?auto_238530 ) ) ( not ( = ?auto_238528 ?auto_238531 ) ) ( not ( = ?auto_238528 ?auto_238532 ) ) ( not ( = ?auto_238528 ?auto_238533 ) ) ( not ( = ?auto_238528 ?auto_238534 ) ) ( not ( = ?auto_238528 ?auto_238535 ) ) ( not ( = ?auto_238528 ?auto_238536 ) ) ( not ( = ?auto_238528 ?auto_238537 ) ) ( not ( = ?auto_238528 ?auto_238538 ) ) ( not ( = ?auto_238529 ?auto_238530 ) ) ( not ( = ?auto_238529 ?auto_238531 ) ) ( not ( = ?auto_238529 ?auto_238532 ) ) ( not ( = ?auto_238529 ?auto_238533 ) ) ( not ( = ?auto_238529 ?auto_238534 ) ) ( not ( = ?auto_238529 ?auto_238535 ) ) ( not ( = ?auto_238529 ?auto_238536 ) ) ( not ( = ?auto_238529 ?auto_238537 ) ) ( not ( = ?auto_238529 ?auto_238538 ) ) ( not ( = ?auto_238530 ?auto_238531 ) ) ( not ( = ?auto_238530 ?auto_238532 ) ) ( not ( = ?auto_238530 ?auto_238533 ) ) ( not ( = ?auto_238530 ?auto_238534 ) ) ( not ( = ?auto_238530 ?auto_238535 ) ) ( not ( = ?auto_238530 ?auto_238536 ) ) ( not ( = ?auto_238530 ?auto_238537 ) ) ( not ( = ?auto_238530 ?auto_238538 ) ) ( not ( = ?auto_238531 ?auto_238532 ) ) ( not ( = ?auto_238531 ?auto_238533 ) ) ( not ( = ?auto_238531 ?auto_238534 ) ) ( not ( = ?auto_238531 ?auto_238535 ) ) ( not ( = ?auto_238531 ?auto_238536 ) ) ( not ( = ?auto_238531 ?auto_238537 ) ) ( not ( = ?auto_238531 ?auto_238538 ) ) ( not ( = ?auto_238532 ?auto_238533 ) ) ( not ( = ?auto_238532 ?auto_238534 ) ) ( not ( = ?auto_238532 ?auto_238535 ) ) ( not ( = ?auto_238532 ?auto_238536 ) ) ( not ( = ?auto_238532 ?auto_238537 ) ) ( not ( = ?auto_238532 ?auto_238538 ) ) ( not ( = ?auto_238533 ?auto_238534 ) ) ( not ( = ?auto_238533 ?auto_238535 ) ) ( not ( = ?auto_238533 ?auto_238536 ) ) ( not ( = ?auto_238533 ?auto_238537 ) ) ( not ( = ?auto_238533 ?auto_238538 ) ) ( not ( = ?auto_238534 ?auto_238535 ) ) ( not ( = ?auto_238534 ?auto_238536 ) ) ( not ( = ?auto_238534 ?auto_238537 ) ) ( not ( = ?auto_238534 ?auto_238538 ) ) ( not ( = ?auto_238535 ?auto_238536 ) ) ( not ( = ?auto_238535 ?auto_238537 ) ) ( not ( = ?auto_238535 ?auto_238538 ) ) ( not ( = ?auto_238536 ?auto_238537 ) ) ( not ( = ?auto_238536 ?auto_238538 ) ) ( not ( = ?auto_238537 ?auto_238538 ) ) ( ON ?auto_238536 ?auto_238537 ) ( ON ?auto_238535 ?auto_238536 ) ( CLEAR ?auto_238533 ) ( ON ?auto_238534 ?auto_238535 ) ( CLEAR ?auto_238534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_238527 ?auto_238528 ?auto_238529 ?auto_238530 ?auto_238531 ?auto_238532 ?auto_238533 ?auto_238534 )
      ( MAKE-11PILE ?auto_238527 ?auto_238528 ?auto_238529 ?auto_238530 ?auto_238531 ?auto_238532 ?auto_238533 ?auto_238534 ?auto_238535 ?auto_238536 ?auto_238537 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238550 - BLOCK
      ?auto_238551 - BLOCK
      ?auto_238552 - BLOCK
      ?auto_238553 - BLOCK
      ?auto_238554 - BLOCK
      ?auto_238555 - BLOCK
      ?auto_238556 - BLOCK
      ?auto_238557 - BLOCK
      ?auto_238558 - BLOCK
      ?auto_238559 - BLOCK
      ?auto_238560 - BLOCK
    )
    :vars
    (
      ?auto_238561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238560 ?auto_238561 ) ( ON-TABLE ?auto_238550 ) ( ON ?auto_238551 ?auto_238550 ) ( ON ?auto_238552 ?auto_238551 ) ( ON ?auto_238553 ?auto_238552 ) ( ON ?auto_238554 ?auto_238553 ) ( ON ?auto_238555 ?auto_238554 ) ( ON ?auto_238556 ?auto_238555 ) ( not ( = ?auto_238550 ?auto_238551 ) ) ( not ( = ?auto_238550 ?auto_238552 ) ) ( not ( = ?auto_238550 ?auto_238553 ) ) ( not ( = ?auto_238550 ?auto_238554 ) ) ( not ( = ?auto_238550 ?auto_238555 ) ) ( not ( = ?auto_238550 ?auto_238556 ) ) ( not ( = ?auto_238550 ?auto_238557 ) ) ( not ( = ?auto_238550 ?auto_238558 ) ) ( not ( = ?auto_238550 ?auto_238559 ) ) ( not ( = ?auto_238550 ?auto_238560 ) ) ( not ( = ?auto_238550 ?auto_238561 ) ) ( not ( = ?auto_238551 ?auto_238552 ) ) ( not ( = ?auto_238551 ?auto_238553 ) ) ( not ( = ?auto_238551 ?auto_238554 ) ) ( not ( = ?auto_238551 ?auto_238555 ) ) ( not ( = ?auto_238551 ?auto_238556 ) ) ( not ( = ?auto_238551 ?auto_238557 ) ) ( not ( = ?auto_238551 ?auto_238558 ) ) ( not ( = ?auto_238551 ?auto_238559 ) ) ( not ( = ?auto_238551 ?auto_238560 ) ) ( not ( = ?auto_238551 ?auto_238561 ) ) ( not ( = ?auto_238552 ?auto_238553 ) ) ( not ( = ?auto_238552 ?auto_238554 ) ) ( not ( = ?auto_238552 ?auto_238555 ) ) ( not ( = ?auto_238552 ?auto_238556 ) ) ( not ( = ?auto_238552 ?auto_238557 ) ) ( not ( = ?auto_238552 ?auto_238558 ) ) ( not ( = ?auto_238552 ?auto_238559 ) ) ( not ( = ?auto_238552 ?auto_238560 ) ) ( not ( = ?auto_238552 ?auto_238561 ) ) ( not ( = ?auto_238553 ?auto_238554 ) ) ( not ( = ?auto_238553 ?auto_238555 ) ) ( not ( = ?auto_238553 ?auto_238556 ) ) ( not ( = ?auto_238553 ?auto_238557 ) ) ( not ( = ?auto_238553 ?auto_238558 ) ) ( not ( = ?auto_238553 ?auto_238559 ) ) ( not ( = ?auto_238553 ?auto_238560 ) ) ( not ( = ?auto_238553 ?auto_238561 ) ) ( not ( = ?auto_238554 ?auto_238555 ) ) ( not ( = ?auto_238554 ?auto_238556 ) ) ( not ( = ?auto_238554 ?auto_238557 ) ) ( not ( = ?auto_238554 ?auto_238558 ) ) ( not ( = ?auto_238554 ?auto_238559 ) ) ( not ( = ?auto_238554 ?auto_238560 ) ) ( not ( = ?auto_238554 ?auto_238561 ) ) ( not ( = ?auto_238555 ?auto_238556 ) ) ( not ( = ?auto_238555 ?auto_238557 ) ) ( not ( = ?auto_238555 ?auto_238558 ) ) ( not ( = ?auto_238555 ?auto_238559 ) ) ( not ( = ?auto_238555 ?auto_238560 ) ) ( not ( = ?auto_238555 ?auto_238561 ) ) ( not ( = ?auto_238556 ?auto_238557 ) ) ( not ( = ?auto_238556 ?auto_238558 ) ) ( not ( = ?auto_238556 ?auto_238559 ) ) ( not ( = ?auto_238556 ?auto_238560 ) ) ( not ( = ?auto_238556 ?auto_238561 ) ) ( not ( = ?auto_238557 ?auto_238558 ) ) ( not ( = ?auto_238557 ?auto_238559 ) ) ( not ( = ?auto_238557 ?auto_238560 ) ) ( not ( = ?auto_238557 ?auto_238561 ) ) ( not ( = ?auto_238558 ?auto_238559 ) ) ( not ( = ?auto_238558 ?auto_238560 ) ) ( not ( = ?auto_238558 ?auto_238561 ) ) ( not ( = ?auto_238559 ?auto_238560 ) ) ( not ( = ?auto_238559 ?auto_238561 ) ) ( not ( = ?auto_238560 ?auto_238561 ) ) ( ON ?auto_238559 ?auto_238560 ) ( ON ?auto_238558 ?auto_238559 ) ( CLEAR ?auto_238556 ) ( ON ?auto_238557 ?auto_238558 ) ( CLEAR ?auto_238557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_238550 ?auto_238551 ?auto_238552 ?auto_238553 ?auto_238554 ?auto_238555 ?auto_238556 ?auto_238557 )
      ( MAKE-11PILE ?auto_238550 ?auto_238551 ?auto_238552 ?auto_238553 ?auto_238554 ?auto_238555 ?auto_238556 ?auto_238557 ?auto_238558 ?auto_238559 ?auto_238560 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238573 - BLOCK
      ?auto_238574 - BLOCK
      ?auto_238575 - BLOCK
      ?auto_238576 - BLOCK
      ?auto_238577 - BLOCK
      ?auto_238578 - BLOCK
      ?auto_238579 - BLOCK
      ?auto_238580 - BLOCK
      ?auto_238581 - BLOCK
      ?auto_238582 - BLOCK
      ?auto_238583 - BLOCK
    )
    :vars
    (
      ?auto_238584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238583 ?auto_238584 ) ( ON-TABLE ?auto_238573 ) ( ON ?auto_238574 ?auto_238573 ) ( ON ?auto_238575 ?auto_238574 ) ( ON ?auto_238576 ?auto_238575 ) ( ON ?auto_238577 ?auto_238576 ) ( ON ?auto_238578 ?auto_238577 ) ( not ( = ?auto_238573 ?auto_238574 ) ) ( not ( = ?auto_238573 ?auto_238575 ) ) ( not ( = ?auto_238573 ?auto_238576 ) ) ( not ( = ?auto_238573 ?auto_238577 ) ) ( not ( = ?auto_238573 ?auto_238578 ) ) ( not ( = ?auto_238573 ?auto_238579 ) ) ( not ( = ?auto_238573 ?auto_238580 ) ) ( not ( = ?auto_238573 ?auto_238581 ) ) ( not ( = ?auto_238573 ?auto_238582 ) ) ( not ( = ?auto_238573 ?auto_238583 ) ) ( not ( = ?auto_238573 ?auto_238584 ) ) ( not ( = ?auto_238574 ?auto_238575 ) ) ( not ( = ?auto_238574 ?auto_238576 ) ) ( not ( = ?auto_238574 ?auto_238577 ) ) ( not ( = ?auto_238574 ?auto_238578 ) ) ( not ( = ?auto_238574 ?auto_238579 ) ) ( not ( = ?auto_238574 ?auto_238580 ) ) ( not ( = ?auto_238574 ?auto_238581 ) ) ( not ( = ?auto_238574 ?auto_238582 ) ) ( not ( = ?auto_238574 ?auto_238583 ) ) ( not ( = ?auto_238574 ?auto_238584 ) ) ( not ( = ?auto_238575 ?auto_238576 ) ) ( not ( = ?auto_238575 ?auto_238577 ) ) ( not ( = ?auto_238575 ?auto_238578 ) ) ( not ( = ?auto_238575 ?auto_238579 ) ) ( not ( = ?auto_238575 ?auto_238580 ) ) ( not ( = ?auto_238575 ?auto_238581 ) ) ( not ( = ?auto_238575 ?auto_238582 ) ) ( not ( = ?auto_238575 ?auto_238583 ) ) ( not ( = ?auto_238575 ?auto_238584 ) ) ( not ( = ?auto_238576 ?auto_238577 ) ) ( not ( = ?auto_238576 ?auto_238578 ) ) ( not ( = ?auto_238576 ?auto_238579 ) ) ( not ( = ?auto_238576 ?auto_238580 ) ) ( not ( = ?auto_238576 ?auto_238581 ) ) ( not ( = ?auto_238576 ?auto_238582 ) ) ( not ( = ?auto_238576 ?auto_238583 ) ) ( not ( = ?auto_238576 ?auto_238584 ) ) ( not ( = ?auto_238577 ?auto_238578 ) ) ( not ( = ?auto_238577 ?auto_238579 ) ) ( not ( = ?auto_238577 ?auto_238580 ) ) ( not ( = ?auto_238577 ?auto_238581 ) ) ( not ( = ?auto_238577 ?auto_238582 ) ) ( not ( = ?auto_238577 ?auto_238583 ) ) ( not ( = ?auto_238577 ?auto_238584 ) ) ( not ( = ?auto_238578 ?auto_238579 ) ) ( not ( = ?auto_238578 ?auto_238580 ) ) ( not ( = ?auto_238578 ?auto_238581 ) ) ( not ( = ?auto_238578 ?auto_238582 ) ) ( not ( = ?auto_238578 ?auto_238583 ) ) ( not ( = ?auto_238578 ?auto_238584 ) ) ( not ( = ?auto_238579 ?auto_238580 ) ) ( not ( = ?auto_238579 ?auto_238581 ) ) ( not ( = ?auto_238579 ?auto_238582 ) ) ( not ( = ?auto_238579 ?auto_238583 ) ) ( not ( = ?auto_238579 ?auto_238584 ) ) ( not ( = ?auto_238580 ?auto_238581 ) ) ( not ( = ?auto_238580 ?auto_238582 ) ) ( not ( = ?auto_238580 ?auto_238583 ) ) ( not ( = ?auto_238580 ?auto_238584 ) ) ( not ( = ?auto_238581 ?auto_238582 ) ) ( not ( = ?auto_238581 ?auto_238583 ) ) ( not ( = ?auto_238581 ?auto_238584 ) ) ( not ( = ?auto_238582 ?auto_238583 ) ) ( not ( = ?auto_238582 ?auto_238584 ) ) ( not ( = ?auto_238583 ?auto_238584 ) ) ( ON ?auto_238582 ?auto_238583 ) ( ON ?auto_238581 ?auto_238582 ) ( ON ?auto_238580 ?auto_238581 ) ( CLEAR ?auto_238578 ) ( ON ?auto_238579 ?auto_238580 ) ( CLEAR ?auto_238579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_238573 ?auto_238574 ?auto_238575 ?auto_238576 ?auto_238577 ?auto_238578 ?auto_238579 )
      ( MAKE-11PILE ?auto_238573 ?auto_238574 ?auto_238575 ?auto_238576 ?auto_238577 ?auto_238578 ?auto_238579 ?auto_238580 ?auto_238581 ?auto_238582 ?auto_238583 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238596 - BLOCK
      ?auto_238597 - BLOCK
      ?auto_238598 - BLOCK
      ?auto_238599 - BLOCK
      ?auto_238600 - BLOCK
      ?auto_238601 - BLOCK
      ?auto_238602 - BLOCK
      ?auto_238603 - BLOCK
      ?auto_238604 - BLOCK
      ?auto_238605 - BLOCK
      ?auto_238606 - BLOCK
    )
    :vars
    (
      ?auto_238607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238606 ?auto_238607 ) ( ON-TABLE ?auto_238596 ) ( ON ?auto_238597 ?auto_238596 ) ( ON ?auto_238598 ?auto_238597 ) ( ON ?auto_238599 ?auto_238598 ) ( ON ?auto_238600 ?auto_238599 ) ( ON ?auto_238601 ?auto_238600 ) ( not ( = ?auto_238596 ?auto_238597 ) ) ( not ( = ?auto_238596 ?auto_238598 ) ) ( not ( = ?auto_238596 ?auto_238599 ) ) ( not ( = ?auto_238596 ?auto_238600 ) ) ( not ( = ?auto_238596 ?auto_238601 ) ) ( not ( = ?auto_238596 ?auto_238602 ) ) ( not ( = ?auto_238596 ?auto_238603 ) ) ( not ( = ?auto_238596 ?auto_238604 ) ) ( not ( = ?auto_238596 ?auto_238605 ) ) ( not ( = ?auto_238596 ?auto_238606 ) ) ( not ( = ?auto_238596 ?auto_238607 ) ) ( not ( = ?auto_238597 ?auto_238598 ) ) ( not ( = ?auto_238597 ?auto_238599 ) ) ( not ( = ?auto_238597 ?auto_238600 ) ) ( not ( = ?auto_238597 ?auto_238601 ) ) ( not ( = ?auto_238597 ?auto_238602 ) ) ( not ( = ?auto_238597 ?auto_238603 ) ) ( not ( = ?auto_238597 ?auto_238604 ) ) ( not ( = ?auto_238597 ?auto_238605 ) ) ( not ( = ?auto_238597 ?auto_238606 ) ) ( not ( = ?auto_238597 ?auto_238607 ) ) ( not ( = ?auto_238598 ?auto_238599 ) ) ( not ( = ?auto_238598 ?auto_238600 ) ) ( not ( = ?auto_238598 ?auto_238601 ) ) ( not ( = ?auto_238598 ?auto_238602 ) ) ( not ( = ?auto_238598 ?auto_238603 ) ) ( not ( = ?auto_238598 ?auto_238604 ) ) ( not ( = ?auto_238598 ?auto_238605 ) ) ( not ( = ?auto_238598 ?auto_238606 ) ) ( not ( = ?auto_238598 ?auto_238607 ) ) ( not ( = ?auto_238599 ?auto_238600 ) ) ( not ( = ?auto_238599 ?auto_238601 ) ) ( not ( = ?auto_238599 ?auto_238602 ) ) ( not ( = ?auto_238599 ?auto_238603 ) ) ( not ( = ?auto_238599 ?auto_238604 ) ) ( not ( = ?auto_238599 ?auto_238605 ) ) ( not ( = ?auto_238599 ?auto_238606 ) ) ( not ( = ?auto_238599 ?auto_238607 ) ) ( not ( = ?auto_238600 ?auto_238601 ) ) ( not ( = ?auto_238600 ?auto_238602 ) ) ( not ( = ?auto_238600 ?auto_238603 ) ) ( not ( = ?auto_238600 ?auto_238604 ) ) ( not ( = ?auto_238600 ?auto_238605 ) ) ( not ( = ?auto_238600 ?auto_238606 ) ) ( not ( = ?auto_238600 ?auto_238607 ) ) ( not ( = ?auto_238601 ?auto_238602 ) ) ( not ( = ?auto_238601 ?auto_238603 ) ) ( not ( = ?auto_238601 ?auto_238604 ) ) ( not ( = ?auto_238601 ?auto_238605 ) ) ( not ( = ?auto_238601 ?auto_238606 ) ) ( not ( = ?auto_238601 ?auto_238607 ) ) ( not ( = ?auto_238602 ?auto_238603 ) ) ( not ( = ?auto_238602 ?auto_238604 ) ) ( not ( = ?auto_238602 ?auto_238605 ) ) ( not ( = ?auto_238602 ?auto_238606 ) ) ( not ( = ?auto_238602 ?auto_238607 ) ) ( not ( = ?auto_238603 ?auto_238604 ) ) ( not ( = ?auto_238603 ?auto_238605 ) ) ( not ( = ?auto_238603 ?auto_238606 ) ) ( not ( = ?auto_238603 ?auto_238607 ) ) ( not ( = ?auto_238604 ?auto_238605 ) ) ( not ( = ?auto_238604 ?auto_238606 ) ) ( not ( = ?auto_238604 ?auto_238607 ) ) ( not ( = ?auto_238605 ?auto_238606 ) ) ( not ( = ?auto_238605 ?auto_238607 ) ) ( not ( = ?auto_238606 ?auto_238607 ) ) ( ON ?auto_238605 ?auto_238606 ) ( ON ?auto_238604 ?auto_238605 ) ( ON ?auto_238603 ?auto_238604 ) ( CLEAR ?auto_238601 ) ( ON ?auto_238602 ?auto_238603 ) ( CLEAR ?auto_238602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_238596 ?auto_238597 ?auto_238598 ?auto_238599 ?auto_238600 ?auto_238601 ?auto_238602 )
      ( MAKE-11PILE ?auto_238596 ?auto_238597 ?auto_238598 ?auto_238599 ?auto_238600 ?auto_238601 ?auto_238602 ?auto_238603 ?auto_238604 ?auto_238605 ?auto_238606 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238619 - BLOCK
      ?auto_238620 - BLOCK
      ?auto_238621 - BLOCK
      ?auto_238622 - BLOCK
      ?auto_238623 - BLOCK
      ?auto_238624 - BLOCK
      ?auto_238625 - BLOCK
      ?auto_238626 - BLOCK
      ?auto_238627 - BLOCK
      ?auto_238628 - BLOCK
      ?auto_238629 - BLOCK
    )
    :vars
    (
      ?auto_238630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238629 ?auto_238630 ) ( ON-TABLE ?auto_238619 ) ( ON ?auto_238620 ?auto_238619 ) ( ON ?auto_238621 ?auto_238620 ) ( ON ?auto_238622 ?auto_238621 ) ( ON ?auto_238623 ?auto_238622 ) ( not ( = ?auto_238619 ?auto_238620 ) ) ( not ( = ?auto_238619 ?auto_238621 ) ) ( not ( = ?auto_238619 ?auto_238622 ) ) ( not ( = ?auto_238619 ?auto_238623 ) ) ( not ( = ?auto_238619 ?auto_238624 ) ) ( not ( = ?auto_238619 ?auto_238625 ) ) ( not ( = ?auto_238619 ?auto_238626 ) ) ( not ( = ?auto_238619 ?auto_238627 ) ) ( not ( = ?auto_238619 ?auto_238628 ) ) ( not ( = ?auto_238619 ?auto_238629 ) ) ( not ( = ?auto_238619 ?auto_238630 ) ) ( not ( = ?auto_238620 ?auto_238621 ) ) ( not ( = ?auto_238620 ?auto_238622 ) ) ( not ( = ?auto_238620 ?auto_238623 ) ) ( not ( = ?auto_238620 ?auto_238624 ) ) ( not ( = ?auto_238620 ?auto_238625 ) ) ( not ( = ?auto_238620 ?auto_238626 ) ) ( not ( = ?auto_238620 ?auto_238627 ) ) ( not ( = ?auto_238620 ?auto_238628 ) ) ( not ( = ?auto_238620 ?auto_238629 ) ) ( not ( = ?auto_238620 ?auto_238630 ) ) ( not ( = ?auto_238621 ?auto_238622 ) ) ( not ( = ?auto_238621 ?auto_238623 ) ) ( not ( = ?auto_238621 ?auto_238624 ) ) ( not ( = ?auto_238621 ?auto_238625 ) ) ( not ( = ?auto_238621 ?auto_238626 ) ) ( not ( = ?auto_238621 ?auto_238627 ) ) ( not ( = ?auto_238621 ?auto_238628 ) ) ( not ( = ?auto_238621 ?auto_238629 ) ) ( not ( = ?auto_238621 ?auto_238630 ) ) ( not ( = ?auto_238622 ?auto_238623 ) ) ( not ( = ?auto_238622 ?auto_238624 ) ) ( not ( = ?auto_238622 ?auto_238625 ) ) ( not ( = ?auto_238622 ?auto_238626 ) ) ( not ( = ?auto_238622 ?auto_238627 ) ) ( not ( = ?auto_238622 ?auto_238628 ) ) ( not ( = ?auto_238622 ?auto_238629 ) ) ( not ( = ?auto_238622 ?auto_238630 ) ) ( not ( = ?auto_238623 ?auto_238624 ) ) ( not ( = ?auto_238623 ?auto_238625 ) ) ( not ( = ?auto_238623 ?auto_238626 ) ) ( not ( = ?auto_238623 ?auto_238627 ) ) ( not ( = ?auto_238623 ?auto_238628 ) ) ( not ( = ?auto_238623 ?auto_238629 ) ) ( not ( = ?auto_238623 ?auto_238630 ) ) ( not ( = ?auto_238624 ?auto_238625 ) ) ( not ( = ?auto_238624 ?auto_238626 ) ) ( not ( = ?auto_238624 ?auto_238627 ) ) ( not ( = ?auto_238624 ?auto_238628 ) ) ( not ( = ?auto_238624 ?auto_238629 ) ) ( not ( = ?auto_238624 ?auto_238630 ) ) ( not ( = ?auto_238625 ?auto_238626 ) ) ( not ( = ?auto_238625 ?auto_238627 ) ) ( not ( = ?auto_238625 ?auto_238628 ) ) ( not ( = ?auto_238625 ?auto_238629 ) ) ( not ( = ?auto_238625 ?auto_238630 ) ) ( not ( = ?auto_238626 ?auto_238627 ) ) ( not ( = ?auto_238626 ?auto_238628 ) ) ( not ( = ?auto_238626 ?auto_238629 ) ) ( not ( = ?auto_238626 ?auto_238630 ) ) ( not ( = ?auto_238627 ?auto_238628 ) ) ( not ( = ?auto_238627 ?auto_238629 ) ) ( not ( = ?auto_238627 ?auto_238630 ) ) ( not ( = ?auto_238628 ?auto_238629 ) ) ( not ( = ?auto_238628 ?auto_238630 ) ) ( not ( = ?auto_238629 ?auto_238630 ) ) ( ON ?auto_238628 ?auto_238629 ) ( ON ?auto_238627 ?auto_238628 ) ( ON ?auto_238626 ?auto_238627 ) ( ON ?auto_238625 ?auto_238626 ) ( CLEAR ?auto_238623 ) ( ON ?auto_238624 ?auto_238625 ) ( CLEAR ?auto_238624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_238619 ?auto_238620 ?auto_238621 ?auto_238622 ?auto_238623 ?auto_238624 )
      ( MAKE-11PILE ?auto_238619 ?auto_238620 ?auto_238621 ?auto_238622 ?auto_238623 ?auto_238624 ?auto_238625 ?auto_238626 ?auto_238627 ?auto_238628 ?auto_238629 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238642 - BLOCK
      ?auto_238643 - BLOCK
      ?auto_238644 - BLOCK
      ?auto_238645 - BLOCK
      ?auto_238646 - BLOCK
      ?auto_238647 - BLOCK
      ?auto_238648 - BLOCK
      ?auto_238649 - BLOCK
      ?auto_238650 - BLOCK
      ?auto_238651 - BLOCK
      ?auto_238652 - BLOCK
    )
    :vars
    (
      ?auto_238653 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238652 ?auto_238653 ) ( ON-TABLE ?auto_238642 ) ( ON ?auto_238643 ?auto_238642 ) ( ON ?auto_238644 ?auto_238643 ) ( ON ?auto_238645 ?auto_238644 ) ( ON ?auto_238646 ?auto_238645 ) ( not ( = ?auto_238642 ?auto_238643 ) ) ( not ( = ?auto_238642 ?auto_238644 ) ) ( not ( = ?auto_238642 ?auto_238645 ) ) ( not ( = ?auto_238642 ?auto_238646 ) ) ( not ( = ?auto_238642 ?auto_238647 ) ) ( not ( = ?auto_238642 ?auto_238648 ) ) ( not ( = ?auto_238642 ?auto_238649 ) ) ( not ( = ?auto_238642 ?auto_238650 ) ) ( not ( = ?auto_238642 ?auto_238651 ) ) ( not ( = ?auto_238642 ?auto_238652 ) ) ( not ( = ?auto_238642 ?auto_238653 ) ) ( not ( = ?auto_238643 ?auto_238644 ) ) ( not ( = ?auto_238643 ?auto_238645 ) ) ( not ( = ?auto_238643 ?auto_238646 ) ) ( not ( = ?auto_238643 ?auto_238647 ) ) ( not ( = ?auto_238643 ?auto_238648 ) ) ( not ( = ?auto_238643 ?auto_238649 ) ) ( not ( = ?auto_238643 ?auto_238650 ) ) ( not ( = ?auto_238643 ?auto_238651 ) ) ( not ( = ?auto_238643 ?auto_238652 ) ) ( not ( = ?auto_238643 ?auto_238653 ) ) ( not ( = ?auto_238644 ?auto_238645 ) ) ( not ( = ?auto_238644 ?auto_238646 ) ) ( not ( = ?auto_238644 ?auto_238647 ) ) ( not ( = ?auto_238644 ?auto_238648 ) ) ( not ( = ?auto_238644 ?auto_238649 ) ) ( not ( = ?auto_238644 ?auto_238650 ) ) ( not ( = ?auto_238644 ?auto_238651 ) ) ( not ( = ?auto_238644 ?auto_238652 ) ) ( not ( = ?auto_238644 ?auto_238653 ) ) ( not ( = ?auto_238645 ?auto_238646 ) ) ( not ( = ?auto_238645 ?auto_238647 ) ) ( not ( = ?auto_238645 ?auto_238648 ) ) ( not ( = ?auto_238645 ?auto_238649 ) ) ( not ( = ?auto_238645 ?auto_238650 ) ) ( not ( = ?auto_238645 ?auto_238651 ) ) ( not ( = ?auto_238645 ?auto_238652 ) ) ( not ( = ?auto_238645 ?auto_238653 ) ) ( not ( = ?auto_238646 ?auto_238647 ) ) ( not ( = ?auto_238646 ?auto_238648 ) ) ( not ( = ?auto_238646 ?auto_238649 ) ) ( not ( = ?auto_238646 ?auto_238650 ) ) ( not ( = ?auto_238646 ?auto_238651 ) ) ( not ( = ?auto_238646 ?auto_238652 ) ) ( not ( = ?auto_238646 ?auto_238653 ) ) ( not ( = ?auto_238647 ?auto_238648 ) ) ( not ( = ?auto_238647 ?auto_238649 ) ) ( not ( = ?auto_238647 ?auto_238650 ) ) ( not ( = ?auto_238647 ?auto_238651 ) ) ( not ( = ?auto_238647 ?auto_238652 ) ) ( not ( = ?auto_238647 ?auto_238653 ) ) ( not ( = ?auto_238648 ?auto_238649 ) ) ( not ( = ?auto_238648 ?auto_238650 ) ) ( not ( = ?auto_238648 ?auto_238651 ) ) ( not ( = ?auto_238648 ?auto_238652 ) ) ( not ( = ?auto_238648 ?auto_238653 ) ) ( not ( = ?auto_238649 ?auto_238650 ) ) ( not ( = ?auto_238649 ?auto_238651 ) ) ( not ( = ?auto_238649 ?auto_238652 ) ) ( not ( = ?auto_238649 ?auto_238653 ) ) ( not ( = ?auto_238650 ?auto_238651 ) ) ( not ( = ?auto_238650 ?auto_238652 ) ) ( not ( = ?auto_238650 ?auto_238653 ) ) ( not ( = ?auto_238651 ?auto_238652 ) ) ( not ( = ?auto_238651 ?auto_238653 ) ) ( not ( = ?auto_238652 ?auto_238653 ) ) ( ON ?auto_238651 ?auto_238652 ) ( ON ?auto_238650 ?auto_238651 ) ( ON ?auto_238649 ?auto_238650 ) ( ON ?auto_238648 ?auto_238649 ) ( CLEAR ?auto_238646 ) ( ON ?auto_238647 ?auto_238648 ) ( CLEAR ?auto_238647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_238642 ?auto_238643 ?auto_238644 ?auto_238645 ?auto_238646 ?auto_238647 )
      ( MAKE-11PILE ?auto_238642 ?auto_238643 ?auto_238644 ?auto_238645 ?auto_238646 ?auto_238647 ?auto_238648 ?auto_238649 ?auto_238650 ?auto_238651 ?auto_238652 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238665 - BLOCK
      ?auto_238666 - BLOCK
      ?auto_238667 - BLOCK
      ?auto_238668 - BLOCK
      ?auto_238669 - BLOCK
      ?auto_238670 - BLOCK
      ?auto_238671 - BLOCK
      ?auto_238672 - BLOCK
      ?auto_238673 - BLOCK
      ?auto_238674 - BLOCK
      ?auto_238675 - BLOCK
    )
    :vars
    (
      ?auto_238676 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238675 ?auto_238676 ) ( ON-TABLE ?auto_238665 ) ( ON ?auto_238666 ?auto_238665 ) ( ON ?auto_238667 ?auto_238666 ) ( ON ?auto_238668 ?auto_238667 ) ( not ( = ?auto_238665 ?auto_238666 ) ) ( not ( = ?auto_238665 ?auto_238667 ) ) ( not ( = ?auto_238665 ?auto_238668 ) ) ( not ( = ?auto_238665 ?auto_238669 ) ) ( not ( = ?auto_238665 ?auto_238670 ) ) ( not ( = ?auto_238665 ?auto_238671 ) ) ( not ( = ?auto_238665 ?auto_238672 ) ) ( not ( = ?auto_238665 ?auto_238673 ) ) ( not ( = ?auto_238665 ?auto_238674 ) ) ( not ( = ?auto_238665 ?auto_238675 ) ) ( not ( = ?auto_238665 ?auto_238676 ) ) ( not ( = ?auto_238666 ?auto_238667 ) ) ( not ( = ?auto_238666 ?auto_238668 ) ) ( not ( = ?auto_238666 ?auto_238669 ) ) ( not ( = ?auto_238666 ?auto_238670 ) ) ( not ( = ?auto_238666 ?auto_238671 ) ) ( not ( = ?auto_238666 ?auto_238672 ) ) ( not ( = ?auto_238666 ?auto_238673 ) ) ( not ( = ?auto_238666 ?auto_238674 ) ) ( not ( = ?auto_238666 ?auto_238675 ) ) ( not ( = ?auto_238666 ?auto_238676 ) ) ( not ( = ?auto_238667 ?auto_238668 ) ) ( not ( = ?auto_238667 ?auto_238669 ) ) ( not ( = ?auto_238667 ?auto_238670 ) ) ( not ( = ?auto_238667 ?auto_238671 ) ) ( not ( = ?auto_238667 ?auto_238672 ) ) ( not ( = ?auto_238667 ?auto_238673 ) ) ( not ( = ?auto_238667 ?auto_238674 ) ) ( not ( = ?auto_238667 ?auto_238675 ) ) ( not ( = ?auto_238667 ?auto_238676 ) ) ( not ( = ?auto_238668 ?auto_238669 ) ) ( not ( = ?auto_238668 ?auto_238670 ) ) ( not ( = ?auto_238668 ?auto_238671 ) ) ( not ( = ?auto_238668 ?auto_238672 ) ) ( not ( = ?auto_238668 ?auto_238673 ) ) ( not ( = ?auto_238668 ?auto_238674 ) ) ( not ( = ?auto_238668 ?auto_238675 ) ) ( not ( = ?auto_238668 ?auto_238676 ) ) ( not ( = ?auto_238669 ?auto_238670 ) ) ( not ( = ?auto_238669 ?auto_238671 ) ) ( not ( = ?auto_238669 ?auto_238672 ) ) ( not ( = ?auto_238669 ?auto_238673 ) ) ( not ( = ?auto_238669 ?auto_238674 ) ) ( not ( = ?auto_238669 ?auto_238675 ) ) ( not ( = ?auto_238669 ?auto_238676 ) ) ( not ( = ?auto_238670 ?auto_238671 ) ) ( not ( = ?auto_238670 ?auto_238672 ) ) ( not ( = ?auto_238670 ?auto_238673 ) ) ( not ( = ?auto_238670 ?auto_238674 ) ) ( not ( = ?auto_238670 ?auto_238675 ) ) ( not ( = ?auto_238670 ?auto_238676 ) ) ( not ( = ?auto_238671 ?auto_238672 ) ) ( not ( = ?auto_238671 ?auto_238673 ) ) ( not ( = ?auto_238671 ?auto_238674 ) ) ( not ( = ?auto_238671 ?auto_238675 ) ) ( not ( = ?auto_238671 ?auto_238676 ) ) ( not ( = ?auto_238672 ?auto_238673 ) ) ( not ( = ?auto_238672 ?auto_238674 ) ) ( not ( = ?auto_238672 ?auto_238675 ) ) ( not ( = ?auto_238672 ?auto_238676 ) ) ( not ( = ?auto_238673 ?auto_238674 ) ) ( not ( = ?auto_238673 ?auto_238675 ) ) ( not ( = ?auto_238673 ?auto_238676 ) ) ( not ( = ?auto_238674 ?auto_238675 ) ) ( not ( = ?auto_238674 ?auto_238676 ) ) ( not ( = ?auto_238675 ?auto_238676 ) ) ( ON ?auto_238674 ?auto_238675 ) ( ON ?auto_238673 ?auto_238674 ) ( ON ?auto_238672 ?auto_238673 ) ( ON ?auto_238671 ?auto_238672 ) ( ON ?auto_238670 ?auto_238671 ) ( CLEAR ?auto_238668 ) ( ON ?auto_238669 ?auto_238670 ) ( CLEAR ?auto_238669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_238665 ?auto_238666 ?auto_238667 ?auto_238668 ?auto_238669 )
      ( MAKE-11PILE ?auto_238665 ?auto_238666 ?auto_238667 ?auto_238668 ?auto_238669 ?auto_238670 ?auto_238671 ?auto_238672 ?auto_238673 ?auto_238674 ?auto_238675 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238688 - BLOCK
      ?auto_238689 - BLOCK
      ?auto_238690 - BLOCK
      ?auto_238691 - BLOCK
      ?auto_238692 - BLOCK
      ?auto_238693 - BLOCK
      ?auto_238694 - BLOCK
      ?auto_238695 - BLOCK
      ?auto_238696 - BLOCK
      ?auto_238697 - BLOCK
      ?auto_238698 - BLOCK
    )
    :vars
    (
      ?auto_238699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238698 ?auto_238699 ) ( ON-TABLE ?auto_238688 ) ( ON ?auto_238689 ?auto_238688 ) ( ON ?auto_238690 ?auto_238689 ) ( ON ?auto_238691 ?auto_238690 ) ( not ( = ?auto_238688 ?auto_238689 ) ) ( not ( = ?auto_238688 ?auto_238690 ) ) ( not ( = ?auto_238688 ?auto_238691 ) ) ( not ( = ?auto_238688 ?auto_238692 ) ) ( not ( = ?auto_238688 ?auto_238693 ) ) ( not ( = ?auto_238688 ?auto_238694 ) ) ( not ( = ?auto_238688 ?auto_238695 ) ) ( not ( = ?auto_238688 ?auto_238696 ) ) ( not ( = ?auto_238688 ?auto_238697 ) ) ( not ( = ?auto_238688 ?auto_238698 ) ) ( not ( = ?auto_238688 ?auto_238699 ) ) ( not ( = ?auto_238689 ?auto_238690 ) ) ( not ( = ?auto_238689 ?auto_238691 ) ) ( not ( = ?auto_238689 ?auto_238692 ) ) ( not ( = ?auto_238689 ?auto_238693 ) ) ( not ( = ?auto_238689 ?auto_238694 ) ) ( not ( = ?auto_238689 ?auto_238695 ) ) ( not ( = ?auto_238689 ?auto_238696 ) ) ( not ( = ?auto_238689 ?auto_238697 ) ) ( not ( = ?auto_238689 ?auto_238698 ) ) ( not ( = ?auto_238689 ?auto_238699 ) ) ( not ( = ?auto_238690 ?auto_238691 ) ) ( not ( = ?auto_238690 ?auto_238692 ) ) ( not ( = ?auto_238690 ?auto_238693 ) ) ( not ( = ?auto_238690 ?auto_238694 ) ) ( not ( = ?auto_238690 ?auto_238695 ) ) ( not ( = ?auto_238690 ?auto_238696 ) ) ( not ( = ?auto_238690 ?auto_238697 ) ) ( not ( = ?auto_238690 ?auto_238698 ) ) ( not ( = ?auto_238690 ?auto_238699 ) ) ( not ( = ?auto_238691 ?auto_238692 ) ) ( not ( = ?auto_238691 ?auto_238693 ) ) ( not ( = ?auto_238691 ?auto_238694 ) ) ( not ( = ?auto_238691 ?auto_238695 ) ) ( not ( = ?auto_238691 ?auto_238696 ) ) ( not ( = ?auto_238691 ?auto_238697 ) ) ( not ( = ?auto_238691 ?auto_238698 ) ) ( not ( = ?auto_238691 ?auto_238699 ) ) ( not ( = ?auto_238692 ?auto_238693 ) ) ( not ( = ?auto_238692 ?auto_238694 ) ) ( not ( = ?auto_238692 ?auto_238695 ) ) ( not ( = ?auto_238692 ?auto_238696 ) ) ( not ( = ?auto_238692 ?auto_238697 ) ) ( not ( = ?auto_238692 ?auto_238698 ) ) ( not ( = ?auto_238692 ?auto_238699 ) ) ( not ( = ?auto_238693 ?auto_238694 ) ) ( not ( = ?auto_238693 ?auto_238695 ) ) ( not ( = ?auto_238693 ?auto_238696 ) ) ( not ( = ?auto_238693 ?auto_238697 ) ) ( not ( = ?auto_238693 ?auto_238698 ) ) ( not ( = ?auto_238693 ?auto_238699 ) ) ( not ( = ?auto_238694 ?auto_238695 ) ) ( not ( = ?auto_238694 ?auto_238696 ) ) ( not ( = ?auto_238694 ?auto_238697 ) ) ( not ( = ?auto_238694 ?auto_238698 ) ) ( not ( = ?auto_238694 ?auto_238699 ) ) ( not ( = ?auto_238695 ?auto_238696 ) ) ( not ( = ?auto_238695 ?auto_238697 ) ) ( not ( = ?auto_238695 ?auto_238698 ) ) ( not ( = ?auto_238695 ?auto_238699 ) ) ( not ( = ?auto_238696 ?auto_238697 ) ) ( not ( = ?auto_238696 ?auto_238698 ) ) ( not ( = ?auto_238696 ?auto_238699 ) ) ( not ( = ?auto_238697 ?auto_238698 ) ) ( not ( = ?auto_238697 ?auto_238699 ) ) ( not ( = ?auto_238698 ?auto_238699 ) ) ( ON ?auto_238697 ?auto_238698 ) ( ON ?auto_238696 ?auto_238697 ) ( ON ?auto_238695 ?auto_238696 ) ( ON ?auto_238694 ?auto_238695 ) ( ON ?auto_238693 ?auto_238694 ) ( CLEAR ?auto_238691 ) ( ON ?auto_238692 ?auto_238693 ) ( CLEAR ?auto_238692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_238688 ?auto_238689 ?auto_238690 ?auto_238691 ?auto_238692 )
      ( MAKE-11PILE ?auto_238688 ?auto_238689 ?auto_238690 ?auto_238691 ?auto_238692 ?auto_238693 ?auto_238694 ?auto_238695 ?auto_238696 ?auto_238697 ?auto_238698 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238711 - BLOCK
      ?auto_238712 - BLOCK
      ?auto_238713 - BLOCK
      ?auto_238714 - BLOCK
      ?auto_238715 - BLOCK
      ?auto_238716 - BLOCK
      ?auto_238717 - BLOCK
      ?auto_238718 - BLOCK
      ?auto_238719 - BLOCK
      ?auto_238720 - BLOCK
      ?auto_238721 - BLOCK
    )
    :vars
    (
      ?auto_238722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238721 ?auto_238722 ) ( ON-TABLE ?auto_238711 ) ( ON ?auto_238712 ?auto_238711 ) ( ON ?auto_238713 ?auto_238712 ) ( not ( = ?auto_238711 ?auto_238712 ) ) ( not ( = ?auto_238711 ?auto_238713 ) ) ( not ( = ?auto_238711 ?auto_238714 ) ) ( not ( = ?auto_238711 ?auto_238715 ) ) ( not ( = ?auto_238711 ?auto_238716 ) ) ( not ( = ?auto_238711 ?auto_238717 ) ) ( not ( = ?auto_238711 ?auto_238718 ) ) ( not ( = ?auto_238711 ?auto_238719 ) ) ( not ( = ?auto_238711 ?auto_238720 ) ) ( not ( = ?auto_238711 ?auto_238721 ) ) ( not ( = ?auto_238711 ?auto_238722 ) ) ( not ( = ?auto_238712 ?auto_238713 ) ) ( not ( = ?auto_238712 ?auto_238714 ) ) ( not ( = ?auto_238712 ?auto_238715 ) ) ( not ( = ?auto_238712 ?auto_238716 ) ) ( not ( = ?auto_238712 ?auto_238717 ) ) ( not ( = ?auto_238712 ?auto_238718 ) ) ( not ( = ?auto_238712 ?auto_238719 ) ) ( not ( = ?auto_238712 ?auto_238720 ) ) ( not ( = ?auto_238712 ?auto_238721 ) ) ( not ( = ?auto_238712 ?auto_238722 ) ) ( not ( = ?auto_238713 ?auto_238714 ) ) ( not ( = ?auto_238713 ?auto_238715 ) ) ( not ( = ?auto_238713 ?auto_238716 ) ) ( not ( = ?auto_238713 ?auto_238717 ) ) ( not ( = ?auto_238713 ?auto_238718 ) ) ( not ( = ?auto_238713 ?auto_238719 ) ) ( not ( = ?auto_238713 ?auto_238720 ) ) ( not ( = ?auto_238713 ?auto_238721 ) ) ( not ( = ?auto_238713 ?auto_238722 ) ) ( not ( = ?auto_238714 ?auto_238715 ) ) ( not ( = ?auto_238714 ?auto_238716 ) ) ( not ( = ?auto_238714 ?auto_238717 ) ) ( not ( = ?auto_238714 ?auto_238718 ) ) ( not ( = ?auto_238714 ?auto_238719 ) ) ( not ( = ?auto_238714 ?auto_238720 ) ) ( not ( = ?auto_238714 ?auto_238721 ) ) ( not ( = ?auto_238714 ?auto_238722 ) ) ( not ( = ?auto_238715 ?auto_238716 ) ) ( not ( = ?auto_238715 ?auto_238717 ) ) ( not ( = ?auto_238715 ?auto_238718 ) ) ( not ( = ?auto_238715 ?auto_238719 ) ) ( not ( = ?auto_238715 ?auto_238720 ) ) ( not ( = ?auto_238715 ?auto_238721 ) ) ( not ( = ?auto_238715 ?auto_238722 ) ) ( not ( = ?auto_238716 ?auto_238717 ) ) ( not ( = ?auto_238716 ?auto_238718 ) ) ( not ( = ?auto_238716 ?auto_238719 ) ) ( not ( = ?auto_238716 ?auto_238720 ) ) ( not ( = ?auto_238716 ?auto_238721 ) ) ( not ( = ?auto_238716 ?auto_238722 ) ) ( not ( = ?auto_238717 ?auto_238718 ) ) ( not ( = ?auto_238717 ?auto_238719 ) ) ( not ( = ?auto_238717 ?auto_238720 ) ) ( not ( = ?auto_238717 ?auto_238721 ) ) ( not ( = ?auto_238717 ?auto_238722 ) ) ( not ( = ?auto_238718 ?auto_238719 ) ) ( not ( = ?auto_238718 ?auto_238720 ) ) ( not ( = ?auto_238718 ?auto_238721 ) ) ( not ( = ?auto_238718 ?auto_238722 ) ) ( not ( = ?auto_238719 ?auto_238720 ) ) ( not ( = ?auto_238719 ?auto_238721 ) ) ( not ( = ?auto_238719 ?auto_238722 ) ) ( not ( = ?auto_238720 ?auto_238721 ) ) ( not ( = ?auto_238720 ?auto_238722 ) ) ( not ( = ?auto_238721 ?auto_238722 ) ) ( ON ?auto_238720 ?auto_238721 ) ( ON ?auto_238719 ?auto_238720 ) ( ON ?auto_238718 ?auto_238719 ) ( ON ?auto_238717 ?auto_238718 ) ( ON ?auto_238716 ?auto_238717 ) ( ON ?auto_238715 ?auto_238716 ) ( CLEAR ?auto_238713 ) ( ON ?auto_238714 ?auto_238715 ) ( CLEAR ?auto_238714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_238711 ?auto_238712 ?auto_238713 ?auto_238714 )
      ( MAKE-11PILE ?auto_238711 ?auto_238712 ?auto_238713 ?auto_238714 ?auto_238715 ?auto_238716 ?auto_238717 ?auto_238718 ?auto_238719 ?auto_238720 ?auto_238721 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238734 - BLOCK
      ?auto_238735 - BLOCK
      ?auto_238736 - BLOCK
      ?auto_238737 - BLOCK
      ?auto_238738 - BLOCK
      ?auto_238739 - BLOCK
      ?auto_238740 - BLOCK
      ?auto_238741 - BLOCK
      ?auto_238742 - BLOCK
      ?auto_238743 - BLOCK
      ?auto_238744 - BLOCK
    )
    :vars
    (
      ?auto_238745 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238744 ?auto_238745 ) ( ON-TABLE ?auto_238734 ) ( ON ?auto_238735 ?auto_238734 ) ( ON ?auto_238736 ?auto_238735 ) ( not ( = ?auto_238734 ?auto_238735 ) ) ( not ( = ?auto_238734 ?auto_238736 ) ) ( not ( = ?auto_238734 ?auto_238737 ) ) ( not ( = ?auto_238734 ?auto_238738 ) ) ( not ( = ?auto_238734 ?auto_238739 ) ) ( not ( = ?auto_238734 ?auto_238740 ) ) ( not ( = ?auto_238734 ?auto_238741 ) ) ( not ( = ?auto_238734 ?auto_238742 ) ) ( not ( = ?auto_238734 ?auto_238743 ) ) ( not ( = ?auto_238734 ?auto_238744 ) ) ( not ( = ?auto_238734 ?auto_238745 ) ) ( not ( = ?auto_238735 ?auto_238736 ) ) ( not ( = ?auto_238735 ?auto_238737 ) ) ( not ( = ?auto_238735 ?auto_238738 ) ) ( not ( = ?auto_238735 ?auto_238739 ) ) ( not ( = ?auto_238735 ?auto_238740 ) ) ( not ( = ?auto_238735 ?auto_238741 ) ) ( not ( = ?auto_238735 ?auto_238742 ) ) ( not ( = ?auto_238735 ?auto_238743 ) ) ( not ( = ?auto_238735 ?auto_238744 ) ) ( not ( = ?auto_238735 ?auto_238745 ) ) ( not ( = ?auto_238736 ?auto_238737 ) ) ( not ( = ?auto_238736 ?auto_238738 ) ) ( not ( = ?auto_238736 ?auto_238739 ) ) ( not ( = ?auto_238736 ?auto_238740 ) ) ( not ( = ?auto_238736 ?auto_238741 ) ) ( not ( = ?auto_238736 ?auto_238742 ) ) ( not ( = ?auto_238736 ?auto_238743 ) ) ( not ( = ?auto_238736 ?auto_238744 ) ) ( not ( = ?auto_238736 ?auto_238745 ) ) ( not ( = ?auto_238737 ?auto_238738 ) ) ( not ( = ?auto_238737 ?auto_238739 ) ) ( not ( = ?auto_238737 ?auto_238740 ) ) ( not ( = ?auto_238737 ?auto_238741 ) ) ( not ( = ?auto_238737 ?auto_238742 ) ) ( not ( = ?auto_238737 ?auto_238743 ) ) ( not ( = ?auto_238737 ?auto_238744 ) ) ( not ( = ?auto_238737 ?auto_238745 ) ) ( not ( = ?auto_238738 ?auto_238739 ) ) ( not ( = ?auto_238738 ?auto_238740 ) ) ( not ( = ?auto_238738 ?auto_238741 ) ) ( not ( = ?auto_238738 ?auto_238742 ) ) ( not ( = ?auto_238738 ?auto_238743 ) ) ( not ( = ?auto_238738 ?auto_238744 ) ) ( not ( = ?auto_238738 ?auto_238745 ) ) ( not ( = ?auto_238739 ?auto_238740 ) ) ( not ( = ?auto_238739 ?auto_238741 ) ) ( not ( = ?auto_238739 ?auto_238742 ) ) ( not ( = ?auto_238739 ?auto_238743 ) ) ( not ( = ?auto_238739 ?auto_238744 ) ) ( not ( = ?auto_238739 ?auto_238745 ) ) ( not ( = ?auto_238740 ?auto_238741 ) ) ( not ( = ?auto_238740 ?auto_238742 ) ) ( not ( = ?auto_238740 ?auto_238743 ) ) ( not ( = ?auto_238740 ?auto_238744 ) ) ( not ( = ?auto_238740 ?auto_238745 ) ) ( not ( = ?auto_238741 ?auto_238742 ) ) ( not ( = ?auto_238741 ?auto_238743 ) ) ( not ( = ?auto_238741 ?auto_238744 ) ) ( not ( = ?auto_238741 ?auto_238745 ) ) ( not ( = ?auto_238742 ?auto_238743 ) ) ( not ( = ?auto_238742 ?auto_238744 ) ) ( not ( = ?auto_238742 ?auto_238745 ) ) ( not ( = ?auto_238743 ?auto_238744 ) ) ( not ( = ?auto_238743 ?auto_238745 ) ) ( not ( = ?auto_238744 ?auto_238745 ) ) ( ON ?auto_238743 ?auto_238744 ) ( ON ?auto_238742 ?auto_238743 ) ( ON ?auto_238741 ?auto_238742 ) ( ON ?auto_238740 ?auto_238741 ) ( ON ?auto_238739 ?auto_238740 ) ( ON ?auto_238738 ?auto_238739 ) ( CLEAR ?auto_238736 ) ( ON ?auto_238737 ?auto_238738 ) ( CLEAR ?auto_238737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_238734 ?auto_238735 ?auto_238736 ?auto_238737 )
      ( MAKE-11PILE ?auto_238734 ?auto_238735 ?auto_238736 ?auto_238737 ?auto_238738 ?auto_238739 ?auto_238740 ?auto_238741 ?auto_238742 ?auto_238743 ?auto_238744 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238757 - BLOCK
      ?auto_238758 - BLOCK
      ?auto_238759 - BLOCK
      ?auto_238760 - BLOCK
      ?auto_238761 - BLOCK
      ?auto_238762 - BLOCK
      ?auto_238763 - BLOCK
      ?auto_238764 - BLOCK
      ?auto_238765 - BLOCK
      ?auto_238766 - BLOCK
      ?auto_238767 - BLOCK
    )
    :vars
    (
      ?auto_238768 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238767 ?auto_238768 ) ( ON-TABLE ?auto_238757 ) ( ON ?auto_238758 ?auto_238757 ) ( not ( = ?auto_238757 ?auto_238758 ) ) ( not ( = ?auto_238757 ?auto_238759 ) ) ( not ( = ?auto_238757 ?auto_238760 ) ) ( not ( = ?auto_238757 ?auto_238761 ) ) ( not ( = ?auto_238757 ?auto_238762 ) ) ( not ( = ?auto_238757 ?auto_238763 ) ) ( not ( = ?auto_238757 ?auto_238764 ) ) ( not ( = ?auto_238757 ?auto_238765 ) ) ( not ( = ?auto_238757 ?auto_238766 ) ) ( not ( = ?auto_238757 ?auto_238767 ) ) ( not ( = ?auto_238757 ?auto_238768 ) ) ( not ( = ?auto_238758 ?auto_238759 ) ) ( not ( = ?auto_238758 ?auto_238760 ) ) ( not ( = ?auto_238758 ?auto_238761 ) ) ( not ( = ?auto_238758 ?auto_238762 ) ) ( not ( = ?auto_238758 ?auto_238763 ) ) ( not ( = ?auto_238758 ?auto_238764 ) ) ( not ( = ?auto_238758 ?auto_238765 ) ) ( not ( = ?auto_238758 ?auto_238766 ) ) ( not ( = ?auto_238758 ?auto_238767 ) ) ( not ( = ?auto_238758 ?auto_238768 ) ) ( not ( = ?auto_238759 ?auto_238760 ) ) ( not ( = ?auto_238759 ?auto_238761 ) ) ( not ( = ?auto_238759 ?auto_238762 ) ) ( not ( = ?auto_238759 ?auto_238763 ) ) ( not ( = ?auto_238759 ?auto_238764 ) ) ( not ( = ?auto_238759 ?auto_238765 ) ) ( not ( = ?auto_238759 ?auto_238766 ) ) ( not ( = ?auto_238759 ?auto_238767 ) ) ( not ( = ?auto_238759 ?auto_238768 ) ) ( not ( = ?auto_238760 ?auto_238761 ) ) ( not ( = ?auto_238760 ?auto_238762 ) ) ( not ( = ?auto_238760 ?auto_238763 ) ) ( not ( = ?auto_238760 ?auto_238764 ) ) ( not ( = ?auto_238760 ?auto_238765 ) ) ( not ( = ?auto_238760 ?auto_238766 ) ) ( not ( = ?auto_238760 ?auto_238767 ) ) ( not ( = ?auto_238760 ?auto_238768 ) ) ( not ( = ?auto_238761 ?auto_238762 ) ) ( not ( = ?auto_238761 ?auto_238763 ) ) ( not ( = ?auto_238761 ?auto_238764 ) ) ( not ( = ?auto_238761 ?auto_238765 ) ) ( not ( = ?auto_238761 ?auto_238766 ) ) ( not ( = ?auto_238761 ?auto_238767 ) ) ( not ( = ?auto_238761 ?auto_238768 ) ) ( not ( = ?auto_238762 ?auto_238763 ) ) ( not ( = ?auto_238762 ?auto_238764 ) ) ( not ( = ?auto_238762 ?auto_238765 ) ) ( not ( = ?auto_238762 ?auto_238766 ) ) ( not ( = ?auto_238762 ?auto_238767 ) ) ( not ( = ?auto_238762 ?auto_238768 ) ) ( not ( = ?auto_238763 ?auto_238764 ) ) ( not ( = ?auto_238763 ?auto_238765 ) ) ( not ( = ?auto_238763 ?auto_238766 ) ) ( not ( = ?auto_238763 ?auto_238767 ) ) ( not ( = ?auto_238763 ?auto_238768 ) ) ( not ( = ?auto_238764 ?auto_238765 ) ) ( not ( = ?auto_238764 ?auto_238766 ) ) ( not ( = ?auto_238764 ?auto_238767 ) ) ( not ( = ?auto_238764 ?auto_238768 ) ) ( not ( = ?auto_238765 ?auto_238766 ) ) ( not ( = ?auto_238765 ?auto_238767 ) ) ( not ( = ?auto_238765 ?auto_238768 ) ) ( not ( = ?auto_238766 ?auto_238767 ) ) ( not ( = ?auto_238766 ?auto_238768 ) ) ( not ( = ?auto_238767 ?auto_238768 ) ) ( ON ?auto_238766 ?auto_238767 ) ( ON ?auto_238765 ?auto_238766 ) ( ON ?auto_238764 ?auto_238765 ) ( ON ?auto_238763 ?auto_238764 ) ( ON ?auto_238762 ?auto_238763 ) ( ON ?auto_238761 ?auto_238762 ) ( ON ?auto_238760 ?auto_238761 ) ( CLEAR ?auto_238758 ) ( ON ?auto_238759 ?auto_238760 ) ( CLEAR ?auto_238759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_238757 ?auto_238758 ?auto_238759 )
      ( MAKE-11PILE ?auto_238757 ?auto_238758 ?auto_238759 ?auto_238760 ?auto_238761 ?auto_238762 ?auto_238763 ?auto_238764 ?auto_238765 ?auto_238766 ?auto_238767 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238780 - BLOCK
      ?auto_238781 - BLOCK
      ?auto_238782 - BLOCK
      ?auto_238783 - BLOCK
      ?auto_238784 - BLOCK
      ?auto_238785 - BLOCK
      ?auto_238786 - BLOCK
      ?auto_238787 - BLOCK
      ?auto_238788 - BLOCK
      ?auto_238789 - BLOCK
      ?auto_238790 - BLOCK
    )
    :vars
    (
      ?auto_238791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238790 ?auto_238791 ) ( ON-TABLE ?auto_238780 ) ( ON ?auto_238781 ?auto_238780 ) ( not ( = ?auto_238780 ?auto_238781 ) ) ( not ( = ?auto_238780 ?auto_238782 ) ) ( not ( = ?auto_238780 ?auto_238783 ) ) ( not ( = ?auto_238780 ?auto_238784 ) ) ( not ( = ?auto_238780 ?auto_238785 ) ) ( not ( = ?auto_238780 ?auto_238786 ) ) ( not ( = ?auto_238780 ?auto_238787 ) ) ( not ( = ?auto_238780 ?auto_238788 ) ) ( not ( = ?auto_238780 ?auto_238789 ) ) ( not ( = ?auto_238780 ?auto_238790 ) ) ( not ( = ?auto_238780 ?auto_238791 ) ) ( not ( = ?auto_238781 ?auto_238782 ) ) ( not ( = ?auto_238781 ?auto_238783 ) ) ( not ( = ?auto_238781 ?auto_238784 ) ) ( not ( = ?auto_238781 ?auto_238785 ) ) ( not ( = ?auto_238781 ?auto_238786 ) ) ( not ( = ?auto_238781 ?auto_238787 ) ) ( not ( = ?auto_238781 ?auto_238788 ) ) ( not ( = ?auto_238781 ?auto_238789 ) ) ( not ( = ?auto_238781 ?auto_238790 ) ) ( not ( = ?auto_238781 ?auto_238791 ) ) ( not ( = ?auto_238782 ?auto_238783 ) ) ( not ( = ?auto_238782 ?auto_238784 ) ) ( not ( = ?auto_238782 ?auto_238785 ) ) ( not ( = ?auto_238782 ?auto_238786 ) ) ( not ( = ?auto_238782 ?auto_238787 ) ) ( not ( = ?auto_238782 ?auto_238788 ) ) ( not ( = ?auto_238782 ?auto_238789 ) ) ( not ( = ?auto_238782 ?auto_238790 ) ) ( not ( = ?auto_238782 ?auto_238791 ) ) ( not ( = ?auto_238783 ?auto_238784 ) ) ( not ( = ?auto_238783 ?auto_238785 ) ) ( not ( = ?auto_238783 ?auto_238786 ) ) ( not ( = ?auto_238783 ?auto_238787 ) ) ( not ( = ?auto_238783 ?auto_238788 ) ) ( not ( = ?auto_238783 ?auto_238789 ) ) ( not ( = ?auto_238783 ?auto_238790 ) ) ( not ( = ?auto_238783 ?auto_238791 ) ) ( not ( = ?auto_238784 ?auto_238785 ) ) ( not ( = ?auto_238784 ?auto_238786 ) ) ( not ( = ?auto_238784 ?auto_238787 ) ) ( not ( = ?auto_238784 ?auto_238788 ) ) ( not ( = ?auto_238784 ?auto_238789 ) ) ( not ( = ?auto_238784 ?auto_238790 ) ) ( not ( = ?auto_238784 ?auto_238791 ) ) ( not ( = ?auto_238785 ?auto_238786 ) ) ( not ( = ?auto_238785 ?auto_238787 ) ) ( not ( = ?auto_238785 ?auto_238788 ) ) ( not ( = ?auto_238785 ?auto_238789 ) ) ( not ( = ?auto_238785 ?auto_238790 ) ) ( not ( = ?auto_238785 ?auto_238791 ) ) ( not ( = ?auto_238786 ?auto_238787 ) ) ( not ( = ?auto_238786 ?auto_238788 ) ) ( not ( = ?auto_238786 ?auto_238789 ) ) ( not ( = ?auto_238786 ?auto_238790 ) ) ( not ( = ?auto_238786 ?auto_238791 ) ) ( not ( = ?auto_238787 ?auto_238788 ) ) ( not ( = ?auto_238787 ?auto_238789 ) ) ( not ( = ?auto_238787 ?auto_238790 ) ) ( not ( = ?auto_238787 ?auto_238791 ) ) ( not ( = ?auto_238788 ?auto_238789 ) ) ( not ( = ?auto_238788 ?auto_238790 ) ) ( not ( = ?auto_238788 ?auto_238791 ) ) ( not ( = ?auto_238789 ?auto_238790 ) ) ( not ( = ?auto_238789 ?auto_238791 ) ) ( not ( = ?auto_238790 ?auto_238791 ) ) ( ON ?auto_238789 ?auto_238790 ) ( ON ?auto_238788 ?auto_238789 ) ( ON ?auto_238787 ?auto_238788 ) ( ON ?auto_238786 ?auto_238787 ) ( ON ?auto_238785 ?auto_238786 ) ( ON ?auto_238784 ?auto_238785 ) ( ON ?auto_238783 ?auto_238784 ) ( CLEAR ?auto_238781 ) ( ON ?auto_238782 ?auto_238783 ) ( CLEAR ?auto_238782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_238780 ?auto_238781 ?auto_238782 )
      ( MAKE-11PILE ?auto_238780 ?auto_238781 ?auto_238782 ?auto_238783 ?auto_238784 ?auto_238785 ?auto_238786 ?auto_238787 ?auto_238788 ?auto_238789 ?auto_238790 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238803 - BLOCK
      ?auto_238804 - BLOCK
      ?auto_238805 - BLOCK
      ?auto_238806 - BLOCK
      ?auto_238807 - BLOCK
      ?auto_238808 - BLOCK
      ?auto_238809 - BLOCK
      ?auto_238810 - BLOCK
      ?auto_238811 - BLOCK
      ?auto_238812 - BLOCK
      ?auto_238813 - BLOCK
    )
    :vars
    (
      ?auto_238814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238813 ?auto_238814 ) ( ON-TABLE ?auto_238803 ) ( not ( = ?auto_238803 ?auto_238804 ) ) ( not ( = ?auto_238803 ?auto_238805 ) ) ( not ( = ?auto_238803 ?auto_238806 ) ) ( not ( = ?auto_238803 ?auto_238807 ) ) ( not ( = ?auto_238803 ?auto_238808 ) ) ( not ( = ?auto_238803 ?auto_238809 ) ) ( not ( = ?auto_238803 ?auto_238810 ) ) ( not ( = ?auto_238803 ?auto_238811 ) ) ( not ( = ?auto_238803 ?auto_238812 ) ) ( not ( = ?auto_238803 ?auto_238813 ) ) ( not ( = ?auto_238803 ?auto_238814 ) ) ( not ( = ?auto_238804 ?auto_238805 ) ) ( not ( = ?auto_238804 ?auto_238806 ) ) ( not ( = ?auto_238804 ?auto_238807 ) ) ( not ( = ?auto_238804 ?auto_238808 ) ) ( not ( = ?auto_238804 ?auto_238809 ) ) ( not ( = ?auto_238804 ?auto_238810 ) ) ( not ( = ?auto_238804 ?auto_238811 ) ) ( not ( = ?auto_238804 ?auto_238812 ) ) ( not ( = ?auto_238804 ?auto_238813 ) ) ( not ( = ?auto_238804 ?auto_238814 ) ) ( not ( = ?auto_238805 ?auto_238806 ) ) ( not ( = ?auto_238805 ?auto_238807 ) ) ( not ( = ?auto_238805 ?auto_238808 ) ) ( not ( = ?auto_238805 ?auto_238809 ) ) ( not ( = ?auto_238805 ?auto_238810 ) ) ( not ( = ?auto_238805 ?auto_238811 ) ) ( not ( = ?auto_238805 ?auto_238812 ) ) ( not ( = ?auto_238805 ?auto_238813 ) ) ( not ( = ?auto_238805 ?auto_238814 ) ) ( not ( = ?auto_238806 ?auto_238807 ) ) ( not ( = ?auto_238806 ?auto_238808 ) ) ( not ( = ?auto_238806 ?auto_238809 ) ) ( not ( = ?auto_238806 ?auto_238810 ) ) ( not ( = ?auto_238806 ?auto_238811 ) ) ( not ( = ?auto_238806 ?auto_238812 ) ) ( not ( = ?auto_238806 ?auto_238813 ) ) ( not ( = ?auto_238806 ?auto_238814 ) ) ( not ( = ?auto_238807 ?auto_238808 ) ) ( not ( = ?auto_238807 ?auto_238809 ) ) ( not ( = ?auto_238807 ?auto_238810 ) ) ( not ( = ?auto_238807 ?auto_238811 ) ) ( not ( = ?auto_238807 ?auto_238812 ) ) ( not ( = ?auto_238807 ?auto_238813 ) ) ( not ( = ?auto_238807 ?auto_238814 ) ) ( not ( = ?auto_238808 ?auto_238809 ) ) ( not ( = ?auto_238808 ?auto_238810 ) ) ( not ( = ?auto_238808 ?auto_238811 ) ) ( not ( = ?auto_238808 ?auto_238812 ) ) ( not ( = ?auto_238808 ?auto_238813 ) ) ( not ( = ?auto_238808 ?auto_238814 ) ) ( not ( = ?auto_238809 ?auto_238810 ) ) ( not ( = ?auto_238809 ?auto_238811 ) ) ( not ( = ?auto_238809 ?auto_238812 ) ) ( not ( = ?auto_238809 ?auto_238813 ) ) ( not ( = ?auto_238809 ?auto_238814 ) ) ( not ( = ?auto_238810 ?auto_238811 ) ) ( not ( = ?auto_238810 ?auto_238812 ) ) ( not ( = ?auto_238810 ?auto_238813 ) ) ( not ( = ?auto_238810 ?auto_238814 ) ) ( not ( = ?auto_238811 ?auto_238812 ) ) ( not ( = ?auto_238811 ?auto_238813 ) ) ( not ( = ?auto_238811 ?auto_238814 ) ) ( not ( = ?auto_238812 ?auto_238813 ) ) ( not ( = ?auto_238812 ?auto_238814 ) ) ( not ( = ?auto_238813 ?auto_238814 ) ) ( ON ?auto_238812 ?auto_238813 ) ( ON ?auto_238811 ?auto_238812 ) ( ON ?auto_238810 ?auto_238811 ) ( ON ?auto_238809 ?auto_238810 ) ( ON ?auto_238808 ?auto_238809 ) ( ON ?auto_238807 ?auto_238808 ) ( ON ?auto_238806 ?auto_238807 ) ( ON ?auto_238805 ?auto_238806 ) ( CLEAR ?auto_238803 ) ( ON ?auto_238804 ?auto_238805 ) ( CLEAR ?auto_238804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_238803 ?auto_238804 )
      ( MAKE-11PILE ?auto_238803 ?auto_238804 ?auto_238805 ?auto_238806 ?auto_238807 ?auto_238808 ?auto_238809 ?auto_238810 ?auto_238811 ?auto_238812 ?auto_238813 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238826 - BLOCK
      ?auto_238827 - BLOCK
      ?auto_238828 - BLOCK
      ?auto_238829 - BLOCK
      ?auto_238830 - BLOCK
      ?auto_238831 - BLOCK
      ?auto_238832 - BLOCK
      ?auto_238833 - BLOCK
      ?auto_238834 - BLOCK
      ?auto_238835 - BLOCK
      ?auto_238836 - BLOCK
    )
    :vars
    (
      ?auto_238837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238836 ?auto_238837 ) ( ON-TABLE ?auto_238826 ) ( not ( = ?auto_238826 ?auto_238827 ) ) ( not ( = ?auto_238826 ?auto_238828 ) ) ( not ( = ?auto_238826 ?auto_238829 ) ) ( not ( = ?auto_238826 ?auto_238830 ) ) ( not ( = ?auto_238826 ?auto_238831 ) ) ( not ( = ?auto_238826 ?auto_238832 ) ) ( not ( = ?auto_238826 ?auto_238833 ) ) ( not ( = ?auto_238826 ?auto_238834 ) ) ( not ( = ?auto_238826 ?auto_238835 ) ) ( not ( = ?auto_238826 ?auto_238836 ) ) ( not ( = ?auto_238826 ?auto_238837 ) ) ( not ( = ?auto_238827 ?auto_238828 ) ) ( not ( = ?auto_238827 ?auto_238829 ) ) ( not ( = ?auto_238827 ?auto_238830 ) ) ( not ( = ?auto_238827 ?auto_238831 ) ) ( not ( = ?auto_238827 ?auto_238832 ) ) ( not ( = ?auto_238827 ?auto_238833 ) ) ( not ( = ?auto_238827 ?auto_238834 ) ) ( not ( = ?auto_238827 ?auto_238835 ) ) ( not ( = ?auto_238827 ?auto_238836 ) ) ( not ( = ?auto_238827 ?auto_238837 ) ) ( not ( = ?auto_238828 ?auto_238829 ) ) ( not ( = ?auto_238828 ?auto_238830 ) ) ( not ( = ?auto_238828 ?auto_238831 ) ) ( not ( = ?auto_238828 ?auto_238832 ) ) ( not ( = ?auto_238828 ?auto_238833 ) ) ( not ( = ?auto_238828 ?auto_238834 ) ) ( not ( = ?auto_238828 ?auto_238835 ) ) ( not ( = ?auto_238828 ?auto_238836 ) ) ( not ( = ?auto_238828 ?auto_238837 ) ) ( not ( = ?auto_238829 ?auto_238830 ) ) ( not ( = ?auto_238829 ?auto_238831 ) ) ( not ( = ?auto_238829 ?auto_238832 ) ) ( not ( = ?auto_238829 ?auto_238833 ) ) ( not ( = ?auto_238829 ?auto_238834 ) ) ( not ( = ?auto_238829 ?auto_238835 ) ) ( not ( = ?auto_238829 ?auto_238836 ) ) ( not ( = ?auto_238829 ?auto_238837 ) ) ( not ( = ?auto_238830 ?auto_238831 ) ) ( not ( = ?auto_238830 ?auto_238832 ) ) ( not ( = ?auto_238830 ?auto_238833 ) ) ( not ( = ?auto_238830 ?auto_238834 ) ) ( not ( = ?auto_238830 ?auto_238835 ) ) ( not ( = ?auto_238830 ?auto_238836 ) ) ( not ( = ?auto_238830 ?auto_238837 ) ) ( not ( = ?auto_238831 ?auto_238832 ) ) ( not ( = ?auto_238831 ?auto_238833 ) ) ( not ( = ?auto_238831 ?auto_238834 ) ) ( not ( = ?auto_238831 ?auto_238835 ) ) ( not ( = ?auto_238831 ?auto_238836 ) ) ( not ( = ?auto_238831 ?auto_238837 ) ) ( not ( = ?auto_238832 ?auto_238833 ) ) ( not ( = ?auto_238832 ?auto_238834 ) ) ( not ( = ?auto_238832 ?auto_238835 ) ) ( not ( = ?auto_238832 ?auto_238836 ) ) ( not ( = ?auto_238832 ?auto_238837 ) ) ( not ( = ?auto_238833 ?auto_238834 ) ) ( not ( = ?auto_238833 ?auto_238835 ) ) ( not ( = ?auto_238833 ?auto_238836 ) ) ( not ( = ?auto_238833 ?auto_238837 ) ) ( not ( = ?auto_238834 ?auto_238835 ) ) ( not ( = ?auto_238834 ?auto_238836 ) ) ( not ( = ?auto_238834 ?auto_238837 ) ) ( not ( = ?auto_238835 ?auto_238836 ) ) ( not ( = ?auto_238835 ?auto_238837 ) ) ( not ( = ?auto_238836 ?auto_238837 ) ) ( ON ?auto_238835 ?auto_238836 ) ( ON ?auto_238834 ?auto_238835 ) ( ON ?auto_238833 ?auto_238834 ) ( ON ?auto_238832 ?auto_238833 ) ( ON ?auto_238831 ?auto_238832 ) ( ON ?auto_238830 ?auto_238831 ) ( ON ?auto_238829 ?auto_238830 ) ( ON ?auto_238828 ?auto_238829 ) ( CLEAR ?auto_238826 ) ( ON ?auto_238827 ?auto_238828 ) ( CLEAR ?auto_238827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_238826 ?auto_238827 )
      ( MAKE-11PILE ?auto_238826 ?auto_238827 ?auto_238828 ?auto_238829 ?auto_238830 ?auto_238831 ?auto_238832 ?auto_238833 ?auto_238834 ?auto_238835 ?auto_238836 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238849 - BLOCK
      ?auto_238850 - BLOCK
      ?auto_238851 - BLOCK
      ?auto_238852 - BLOCK
      ?auto_238853 - BLOCK
      ?auto_238854 - BLOCK
      ?auto_238855 - BLOCK
      ?auto_238856 - BLOCK
      ?auto_238857 - BLOCK
      ?auto_238858 - BLOCK
      ?auto_238859 - BLOCK
    )
    :vars
    (
      ?auto_238860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238859 ?auto_238860 ) ( not ( = ?auto_238849 ?auto_238850 ) ) ( not ( = ?auto_238849 ?auto_238851 ) ) ( not ( = ?auto_238849 ?auto_238852 ) ) ( not ( = ?auto_238849 ?auto_238853 ) ) ( not ( = ?auto_238849 ?auto_238854 ) ) ( not ( = ?auto_238849 ?auto_238855 ) ) ( not ( = ?auto_238849 ?auto_238856 ) ) ( not ( = ?auto_238849 ?auto_238857 ) ) ( not ( = ?auto_238849 ?auto_238858 ) ) ( not ( = ?auto_238849 ?auto_238859 ) ) ( not ( = ?auto_238849 ?auto_238860 ) ) ( not ( = ?auto_238850 ?auto_238851 ) ) ( not ( = ?auto_238850 ?auto_238852 ) ) ( not ( = ?auto_238850 ?auto_238853 ) ) ( not ( = ?auto_238850 ?auto_238854 ) ) ( not ( = ?auto_238850 ?auto_238855 ) ) ( not ( = ?auto_238850 ?auto_238856 ) ) ( not ( = ?auto_238850 ?auto_238857 ) ) ( not ( = ?auto_238850 ?auto_238858 ) ) ( not ( = ?auto_238850 ?auto_238859 ) ) ( not ( = ?auto_238850 ?auto_238860 ) ) ( not ( = ?auto_238851 ?auto_238852 ) ) ( not ( = ?auto_238851 ?auto_238853 ) ) ( not ( = ?auto_238851 ?auto_238854 ) ) ( not ( = ?auto_238851 ?auto_238855 ) ) ( not ( = ?auto_238851 ?auto_238856 ) ) ( not ( = ?auto_238851 ?auto_238857 ) ) ( not ( = ?auto_238851 ?auto_238858 ) ) ( not ( = ?auto_238851 ?auto_238859 ) ) ( not ( = ?auto_238851 ?auto_238860 ) ) ( not ( = ?auto_238852 ?auto_238853 ) ) ( not ( = ?auto_238852 ?auto_238854 ) ) ( not ( = ?auto_238852 ?auto_238855 ) ) ( not ( = ?auto_238852 ?auto_238856 ) ) ( not ( = ?auto_238852 ?auto_238857 ) ) ( not ( = ?auto_238852 ?auto_238858 ) ) ( not ( = ?auto_238852 ?auto_238859 ) ) ( not ( = ?auto_238852 ?auto_238860 ) ) ( not ( = ?auto_238853 ?auto_238854 ) ) ( not ( = ?auto_238853 ?auto_238855 ) ) ( not ( = ?auto_238853 ?auto_238856 ) ) ( not ( = ?auto_238853 ?auto_238857 ) ) ( not ( = ?auto_238853 ?auto_238858 ) ) ( not ( = ?auto_238853 ?auto_238859 ) ) ( not ( = ?auto_238853 ?auto_238860 ) ) ( not ( = ?auto_238854 ?auto_238855 ) ) ( not ( = ?auto_238854 ?auto_238856 ) ) ( not ( = ?auto_238854 ?auto_238857 ) ) ( not ( = ?auto_238854 ?auto_238858 ) ) ( not ( = ?auto_238854 ?auto_238859 ) ) ( not ( = ?auto_238854 ?auto_238860 ) ) ( not ( = ?auto_238855 ?auto_238856 ) ) ( not ( = ?auto_238855 ?auto_238857 ) ) ( not ( = ?auto_238855 ?auto_238858 ) ) ( not ( = ?auto_238855 ?auto_238859 ) ) ( not ( = ?auto_238855 ?auto_238860 ) ) ( not ( = ?auto_238856 ?auto_238857 ) ) ( not ( = ?auto_238856 ?auto_238858 ) ) ( not ( = ?auto_238856 ?auto_238859 ) ) ( not ( = ?auto_238856 ?auto_238860 ) ) ( not ( = ?auto_238857 ?auto_238858 ) ) ( not ( = ?auto_238857 ?auto_238859 ) ) ( not ( = ?auto_238857 ?auto_238860 ) ) ( not ( = ?auto_238858 ?auto_238859 ) ) ( not ( = ?auto_238858 ?auto_238860 ) ) ( not ( = ?auto_238859 ?auto_238860 ) ) ( ON ?auto_238858 ?auto_238859 ) ( ON ?auto_238857 ?auto_238858 ) ( ON ?auto_238856 ?auto_238857 ) ( ON ?auto_238855 ?auto_238856 ) ( ON ?auto_238854 ?auto_238855 ) ( ON ?auto_238853 ?auto_238854 ) ( ON ?auto_238852 ?auto_238853 ) ( ON ?auto_238851 ?auto_238852 ) ( ON ?auto_238850 ?auto_238851 ) ( ON ?auto_238849 ?auto_238850 ) ( CLEAR ?auto_238849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_238849 )
      ( MAKE-11PILE ?auto_238849 ?auto_238850 ?auto_238851 ?auto_238852 ?auto_238853 ?auto_238854 ?auto_238855 ?auto_238856 ?auto_238857 ?auto_238858 ?auto_238859 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_238872 - BLOCK
      ?auto_238873 - BLOCK
      ?auto_238874 - BLOCK
      ?auto_238875 - BLOCK
      ?auto_238876 - BLOCK
      ?auto_238877 - BLOCK
      ?auto_238878 - BLOCK
      ?auto_238879 - BLOCK
      ?auto_238880 - BLOCK
      ?auto_238881 - BLOCK
      ?auto_238882 - BLOCK
    )
    :vars
    (
      ?auto_238883 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238882 ?auto_238883 ) ( not ( = ?auto_238872 ?auto_238873 ) ) ( not ( = ?auto_238872 ?auto_238874 ) ) ( not ( = ?auto_238872 ?auto_238875 ) ) ( not ( = ?auto_238872 ?auto_238876 ) ) ( not ( = ?auto_238872 ?auto_238877 ) ) ( not ( = ?auto_238872 ?auto_238878 ) ) ( not ( = ?auto_238872 ?auto_238879 ) ) ( not ( = ?auto_238872 ?auto_238880 ) ) ( not ( = ?auto_238872 ?auto_238881 ) ) ( not ( = ?auto_238872 ?auto_238882 ) ) ( not ( = ?auto_238872 ?auto_238883 ) ) ( not ( = ?auto_238873 ?auto_238874 ) ) ( not ( = ?auto_238873 ?auto_238875 ) ) ( not ( = ?auto_238873 ?auto_238876 ) ) ( not ( = ?auto_238873 ?auto_238877 ) ) ( not ( = ?auto_238873 ?auto_238878 ) ) ( not ( = ?auto_238873 ?auto_238879 ) ) ( not ( = ?auto_238873 ?auto_238880 ) ) ( not ( = ?auto_238873 ?auto_238881 ) ) ( not ( = ?auto_238873 ?auto_238882 ) ) ( not ( = ?auto_238873 ?auto_238883 ) ) ( not ( = ?auto_238874 ?auto_238875 ) ) ( not ( = ?auto_238874 ?auto_238876 ) ) ( not ( = ?auto_238874 ?auto_238877 ) ) ( not ( = ?auto_238874 ?auto_238878 ) ) ( not ( = ?auto_238874 ?auto_238879 ) ) ( not ( = ?auto_238874 ?auto_238880 ) ) ( not ( = ?auto_238874 ?auto_238881 ) ) ( not ( = ?auto_238874 ?auto_238882 ) ) ( not ( = ?auto_238874 ?auto_238883 ) ) ( not ( = ?auto_238875 ?auto_238876 ) ) ( not ( = ?auto_238875 ?auto_238877 ) ) ( not ( = ?auto_238875 ?auto_238878 ) ) ( not ( = ?auto_238875 ?auto_238879 ) ) ( not ( = ?auto_238875 ?auto_238880 ) ) ( not ( = ?auto_238875 ?auto_238881 ) ) ( not ( = ?auto_238875 ?auto_238882 ) ) ( not ( = ?auto_238875 ?auto_238883 ) ) ( not ( = ?auto_238876 ?auto_238877 ) ) ( not ( = ?auto_238876 ?auto_238878 ) ) ( not ( = ?auto_238876 ?auto_238879 ) ) ( not ( = ?auto_238876 ?auto_238880 ) ) ( not ( = ?auto_238876 ?auto_238881 ) ) ( not ( = ?auto_238876 ?auto_238882 ) ) ( not ( = ?auto_238876 ?auto_238883 ) ) ( not ( = ?auto_238877 ?auto_238878 ) ) ( not ( = ?auto_238877 ?auto_238879 ) ) ( not ( = ?auto_238877 ?auto_238880 ) ) ( not ( = ?auto_238877 ?auto_238881 ) ) ( not ( = ?auto_238877 ?auto_238882 ) ) ( not ( = ?auto_238877 ?auto_238883 ) ) ( not ( = ?auto_238878 ?auto_238879 ) ) ( not ( = ?auto_238878 ?auto_238880 ) ) ( not ( = ?auto_238878 ?auto_238881 ) ) ( not ( = ?auto_238878 ?auto_238882 ) ) ( not ( = ?auto_238878 ?auto_238883 ) ) ( not ( = ?auto_238879 ?auto_238880 ) ) ( not ( = ?auto_238879 ?auto_238881 ) ) ( not ( = ?auto_238879 ?auto_238882 ) ) ( not ( = ?auto_238879 ?auto_238883 ) ) ( not ( = ?auto_238880 ?auto_238881 ) ) ( not ( = ?auto_238880 ?auto_238882 ) ) ( not ( = ?auto_238880 ?auto_238883 ) ) ( not ( = ?auto_238881 ?auto_238882 ) ) ( not ( = ?auto_238881 ?auto_238883 ) ) ( not ( = ?auto_238882 ?auto_238883 ) ) ( ON ?auto_238881 ?auto_238882 ) ( ON ?auto_238880 ?auto_238881 ) ( ON ?auto_238879 ?auto_238880 ) ( ON ?auto_238878 ?auto_238879 ) ( ON ?auto_238877 ?auto_238878 ) ( ON ?auto_238876 ?auto_238877 ) ( ON ?auto_238875 ?auto_238876 ) ( ON ?auto_238874 ?auto_238875 ) ( ON ?auto_238873 ?auto_238874 ) ( ON ?auto_238872 ?auto_238873 ) ( CLEAR ?auto_238872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_238872 )
      ( MAKE-11PILE ?auto_238872 ?auto_238873 ?auto_238874 ?auto_238875 ?auto_238876 ?auto_238877 ?auto_238878 ?auto_238879 ?auto_238880 ?auto_238881 ?auto_238882 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_238896 - BLOCK
      ?auto_238897 - BLOCK
      ?auto_238898 - BLOCK
      ?auto_238899 - BLOCK
      ?auto_238900 - BLOCK
      ?auto_238901 - BLOCK
      ?auto_238902 - BLOCK
      ?auto_238903 - BLOCK
      ?auto_238904 - BLOCK
      ?auto_238905 - BLOCK
      ?auto_238906 - BLOCK
      ?auto_238907 - BLOCK
    )
    :vars
    (
      ?auto_238908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_238906 ) ( ON ?auto_238907 ?auto_238908 ) ( CLEAR ?auto_238907 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_238896 ) ( ON ?auto_238897 ?auto_238896 ) ( ON ?auto_238898 ?auto_238897 ) ( ON ?auto_238899 ?auto_238898 ) ( ON ?auto_238900 ?auto_238899 ) ( ON ?auto_238901 ?auto_238900 ) ( ON ?auto_238902 ?auto_238901 ) ( ON ?auto_238903 ?auto_238902 ) ( ON ?auto_238904 ?auto_238903 ) ( ON ?auto_238905 ?auto_238904 ) ( ON ?auto_238906 ?auto_238905 ) ( not ( = ?auto_238896 ?auto_238897 ) ) ( not ( = ?auto_238896 ?auto_238898 ) ) ( not ( = ?auto_238896 ?auto_238899 ) ) ( not ( = ?auto_238896 ?auto_238900 ) ) ( not ( = ?auto_238896 ?auto_238901 ) ) ( not ( = ?auto_238896 ?auto_238902 ) ) ( not ( = ?auto_238896 ?auto_238903 ) ) ( not ( = ?auto_238896 ?auto_238904 ) ) ( not ( = ?auto_238896 ?auto_238905 ) ) ( not ( = ?auto_238896 ?auto_238906 ) ) ( not ( = ?auto_238896 ?auto_238907 ) ) ( not ( = ?auto_238896 ?auto_238908 ) ) ( not ( = ?auto_238897 ?auto_238898 ) ) ( not ( = ?auto_238897 ?auto_238899 ) ) ( not ( = ?auto_238897 ?auto_238900 ) ) ( not ( = ?auto_238897 ?auto_238901 ) ) ( not ( = ?auto_238897 ?auto_238902 ) ) ( not ( = ?auto_238897 ?auto_238903 ) ) ( not ( = ?auto_238897 ?auto_238904 ) ) ( not ( = ?auto_238897 ?auto_238905 ) ) ( not ( = ?auto_238897 ?auto_238906 ) ) ( not ( = ?auto_238897 ?auto_238907 ) ) ( not ( = ?auto_238897 ?auto_238908 ) ) ( not ( = ?auto_238898 ?auto_238899 ) ) ( not ( = ?auto_238898 ?auto_238900 ) ) ( not ( = ?auto_238898 ?auto_238901 ) ) ( not ( = ?auto_238898 ?auto_238902 ) ) ( not ( = ?auto_238898 ?auto_238903 ) ) ( not ( = ?auto_238898 ?auto_238904 ) ) ( not ( = ?auto_238898 ?auto_238905 ) ) ( not ( = ?auto_238898 ?auto_238906 ) ) ( not ( = ?auto_238898 ?auto_238907 ) ) ( not ( = ?auto_238898 ?auto_238908 ) ) ( not ( = ?auto_238899 ?auto_238900 ) ) ( not ( = ?auto_238899 ?auto_238901 ) ) ( not ( = ?auto_238899 ?auto_238902 ) ) ( not ( = ?auto_238899 ?auto_238903 ) ) ( not ( = ?auto_238899 ?auto_238904 ) ) ( not ( = ?auto_238899 ?auto_238905 ) ) ( not ( = ?auto_238899 ?auto_238906 ) ) ( not ( = ?auto_238899 ?auto_238907 ) ) ( not ( = ?auto_238899 ?auto_238908 ) ) ( not ( = ?auto_238900 ?auto_238901 ) ) ( not ( = ?auto_238900 ?auto_238902 ) ) ( not ( = ?auto_238900 ?auto_238903 ) ) ( not ( = ?auto_238900 ?auto_238904 ) ) ( not ( = ?auto_238900 ?auto_238905 ) ) ( not ( = ?auto_238900 ?auto_238906 ) ) ( not ( = ?auto_238900 ?auto_238907 ) ) ( not ( = ?auto_238900 ?auto_238908 ) ) ( not ( = ?auto_238901 ?auto_238902 ) ) ( not ( = ?auto_238901 ?auto_238903 ) ) ( not ( = ?auto_238901 ?auto_238904 ) ) ( not ( = ?auto_238901 ?auto_238905 ) ) ( not ( = ?auto_238901 ?auto_238906 ) ) ( not ( = ?auto_238901 ?auto_238907 ) ) ( not ( = ?auto_238901 ?auto_238908 ) ) ( not ( = ?auto_238902 ?auto_238903 ) ) ( not ( = ?auto_238902 ?auto_238904 ) ) ( not ( = ?auto_238902 ?auto_238905 ) ) ( not ( = ?auto_238902 ?auto_238906 ) ) ( not ( = ?auto_238902 ?auto_238907 ) ) ( not ( = ?auto_238902 ?auto_238908 ) ) ( not ( = ?auto_238903 ?auto_238904 ) ) ( not ( = ?auto_238903 ?auto_238905 ) ) ( not ( = ?auto_238903 ?auto_238906 ) ) ( not ( = ?auto_238903 ?auto_238907 ) ) ( not ( = ?auto_238903 ?auto_238908 ) ) ( not ( = ?auto_238904 ?auto_238905 ) ) ( not ( = ?auto_238904 ?auto_238906 ) ) ( not ( = ?auto_238904 ?auto_238907 ) ) ( not ( = ?auto_238904 ?auto_238908 ) ) ( not ( = ?auto_238905 ?auto_238906 ) ) ( not ( = ?auto_238905 ?auto_238907 ) ) ( not ( = ?auto_238905 ?auto_238908 ) ) ( not ( = ?auto_238906 ?auto_238907 ) ) ( not ( = ?auto_238906 ?auto_238908 ) ) ( not ( = ?auto_238907 ?auto_238908 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_238907 ?auto_238908 )
      ( !STACK ?auto_238907 ?auto_238906 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_238921 - BLOCK
      ?auto_238922 - BLOCK
      ?auto_238923 - BLOCK
      ?auto_238924 - BLOCK
      ?auto_238925 - BLOCK
      ?auto_238926 - BLOCK
      ?auto_238927 - BLOCK
      ?auto_238928 - BLOCK
      ?auto_238929 - BLOCK
      ?auto_238930 - BLOCK
      ?auto_238931 - BLOCK
      ?auto_238932 - BLOCK
    )
    :vars
    (
      ?auto_238933 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_238931 ) ( ON ?auto_238932 ?auto_238933 ) ( CLEAR ?auto_238932 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_238921 ) ( ON ?auto_238922 ?auto_238921 ) ( ON ?auto_238923 ?auto_238922 ) ( ON ?auto_238924 ?auto_238923 ) ( ON ?auto_238925 ?auto_238924 ) ( ON ?auto_238926 ?auto_238925 ) ( ON ?auto_238927 ?auto_238926 ) ( ON ?auto_238928 ?auto_238927 ) ( ON ?auto_238929 ?auto_238928 ) ( ON ?auto_238930 ?auto_238929 ) ( ON ?auto_238931 ?auto_238930 ) ( not ( = ?auto_238921 ?auto_238922 ) ) ( not ( = ?auto_238921 ?auto_238923 ) ) ( not ( = ?auto_238921 ?auto_238924 ) ) ( not ( = ?auto_238921 ?auto_238925 ) ) ( not ( = ?auto_238921 ?auto_238926 ) ) ( not ( = ?auto_238921 ?auto_238927 ) ) ( not ( = ?auto_238921 ?auto_238928 ) ) ( not ( = ?auto_238921 ?auto_238929 ) ) ( not ( = ?auto_238921 ?auto_238930 ) ) ( not ( = ?auto_238921 ?auto_238931 ) ) ( not ( = ?auto_238921 ?auto_238932 ) ) ( not ( = ?auto_238921 ?auto_238933 ) ) ( not ( = ?auto_238922 ?auto_238923 ) ) ( not ( = ?auto_238922 ?auto_238924 ) ) ( not ( = ?auto_238922 ?auto_238925 ) ) ( not ( = ?auto_238922 ?auto_238926 ) ) ( not ( = ?auto_238922 ?auto_238927 ) ) ( not ( = ?auto_238922 ?auto_238928 ) ) ( not ( = ?auto_238922 ?auto_238929 ) ) ( not ( = ?auto_238922 ?auto_238930 ) ) ( not ( = ?auto_238922 ?auto_238931 ) ) ( not ( = ?auto_238922 ?auto_238932 ) ) ( not ( = ?auto_238922 ?auto_238933 ) ) ( not ( = ?auto_238923 ?auto_238924 ) ) ( not ( = ?auto_238923 ?auto_238925 ) ) ( not ( = ?auto_238923 ?auto_238926 ) ) ( not ( = ?auto_238923 ?auto_238927 ) ) ( not ( = ?auto_238923 ?auto_238928 ) ) ( not ( = ?auto_238923 ?auto_238929 ) ) ( not ( = ?auto_238923 ?auto_238930 ) ) ( not ( = ?auto_238923 ?auto_238931 ) ) ( not ( = ?auto_238923 ?auto_238932 ) ) ( not ( = ?auto_238923 ?auto_238933 ) ) ( not ( = ?auto_238924 ?auto_238925 ) ) ( not ( = ?auto_238924 ?auto_238926 ) ) ( not ( = ?auto_238924 ?auto_238927 ) ) ( not ( = ?auto_238924 ?auto_238928 ) ) ( not ( = ?auto_238924 ?auto_238929 ) ) ( not ( = ?auto_238924 ?auto_238930 ) ) ( not ( = ?auto_238924 ?auto_238931 ) ) ( not ( = ?auto_238924 ?auto_238932 ) ) ( not ( = ?auto_238924 ?auto_238933 ) ) ( not ( = ?auto_238925 ?auto_238926 ) ) ( not ( = ?auto_238925 ?auto_238927 ) ) ( not ( = ?auto_238925 ?auto_238928 ) ) ( not ( = ?auto_238925 ?auto_238929 ) ) ( not ( = ?auto_238925 ?auto_238930 ) ) ( not ( = ?auto_238925 ?auto_238931 ) ) ( not ( = ?auto_238925 ?auto_238932 ) ) ( not ( = ?auto_238925 ?auto_238933 ) ) ( not ( = ?auto_238926 ?auto_238927 ) ) ( not ( = ?auto_238926 ?auto_238928 ) ) ( not ( = ?auto_238926 ?auto_238929 ) ) ( not ( = ?auto_238926 ?auto_238930 ) ) ( not ( = ?auto_238926 ?auto_238931 ) ) ( not ( = ?auto_238926 ?auto_238932 ) ) ( not ( = ?auto_238926 ?auto_238933 ) ) ( not ( = ?auto_238927 ?auto_238928 ) ) ( not ( = ?auto_238927 ?auto_238929 ) ) ( not ( = ?auto_238927 ?auto_238930 ) ) ( not ( = ?auto_238927 ?auto_238931 ) ) ( not ( = ?auto_238927 ?auto_238932 ) ) ( not ( = ?auto_238927 ?auto_238933 ) ) ( not ( = ?auto_238928 ?auto_238929 ) ) ( not ( = ?auto_238928 ?auto_238930 ) ) ( not ( = ?auto_238928 ?auto_238931 ) ) ( not ( = ?auto_238928 ?auto_238932 ) ) ( not ( = ?auto_238928 ?auto_238933 ) ) ( not ( = ?auto_238929 ?auto_238930 ) ) ( not ( = ?auto_238929 ?auto_238931 ) ) ( not ( = ?auto_238929 ?auto_238932 ) ) ( not ( = ?auto_238929 ?auto_238933 ) ) ( not ( = ?auto_238930 ?auto_238931 ) ) ( not ( = ?auto_238930 ?auto_238932 ) ) ( not ( = ?auto_238930 ?auto_238933 ) ) ( not ( = ?auto_238931 ?auto_238932 ) ) ( not ( = ?auto_238931 ?auto_238933 ) ) ( not ( = ?auto_238932 ?auto_238933 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_238932 ?auto_238933 )
      ( !STACK ?auto_238932 ?auto_238931 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_238946 - BLOCK
      ?auto_238947 - BLOCK
      ?auto_238948 - BLOCK
      ?auto_238949 - BLOCK
      ?auto_238950 - BLOCK
      ?auto_238951 - BLOCK
      ?auto_238952 - BLOCK
      ?auto_238953 - BLOCK
      ?auto_238954 - BLOCK
      ?auto_238955 - BLOCK
      ?auto_238956 - BLOCK
      ?auto_238957 - BLOCK
    )
    :vars
    (
      ?auto_238958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238957 ?auto_238958 ) ( ON-TABLE ?auto_238946 ) ( ON ?auto_238947 ?auto_238946 ) ( ON ?auto_238948 ?auto_238947 ) ( ON ?auto_238949 ?auto_238948 ) ( ON ?auto_238950 ?auto_238949 ) ( ON ?auto_238951 ?auto_238950 ) ( ON ?auto_238952 ?auto_238951 ) ( ON ?auto_238953 ?auto_238952 ) ( ON ?auto_238954 ?auto_238953 ) ( ON ?auto_238955 ?auto_238954 ) ( not ( = ?auto_238946 ?auto_238947 ) ) ( not ( = ?auto_238946 ?auto_238948 ) ) ( not ( = ?auto_238946 ?auto_238949 ) ) ( not ( = ?auto_238946 ?auto_238950 ) ) ( not ( = ?auto_238946 ?auto_238951 ) ) ( not ( = ?auto_238946 ?auto_238952 ) ) ( not ( = ?auto_238946 ?auto_238953 ) ) ( not ( = ?auto_238946 ?auto_238954 ) ) ( not ( = ?auto_238946 ?auto_238955 ) ) ( not ( = ?auto_238946 ?auto_238956 ) ) ( not ( = ?auto_238946 ?auto_238957 ) ) ( not ( = ?auto_238946 ?auto_238958 ) ) ( not ( = ?auto_238947 ?auto_238948 ) ) ( not ( = ?auto_238947 ?auto_238949 ) ) ( not ( = ?auto_238947 ?auto_238950 ) ) ( not ( = ?auto_238947 ?auto_238951 ) ) ( not ( = ?auto_238947 ?auto_238952 ) ) ( not ( = ?auto_238947 ?auto_238953 ) ) ( not ( = ?auto_238947 ?auto_238954 ) ) ( not ( = ?auto_238947 ?auto_238955 ) ) ( not ( = ?auto_238947 ?auto_238956 ) ) ( not ( = ?auto_238947 ?auto_238957 ) ) ( not ( = ?auto_238947 ?auto_238958 ) ) ( not ( = ?auto_238948 ?auto_238949 ) ) ( not ( = ?auto_238948 ?auto_238950 ) ) ( not ( = ?auto_238948 ?auto_238951 ) ) ( not ( = ?auto_238948 ?auto_238952 ) ) ( not ( = ?auto_238948 ?auto_238953 ) ) ( not ( = ?auto_238948 ?auto_238954 ) ) ( not ( = ?auto_238948 ?auto_238955 ) ) ( not ( = ?auto_238948 ?auto_238956 ) ) ( not ( = ?auto_238948 ?auto_238957 ) ) ( not ( = ?auto_238948 ?auto_238958 ) ) ( not ( = ?auto_238949 ?auto_238950 ) ) ( not ( = ?auto_238949 ?auto_238951 ) ) ( not ( = ?auto_238949 ?auto_238952 ) ) ( not ( = ?auto_238949 ?auto_238953 ) ) ( not ( = ?auto_238949 ?auto_238954 ) ) ( not ( = ?auto_238949 ?auto_238955 ) ) ( not ( = ?auto_238949 ?auto_238956 ) ) ( not ( = ?auto_238949 ?auto_238957 ) ) ( not ( = ?auto_238949 ?auto_238958 ) ) ( not ( = ?auto_238950 ?auto_238951 ) ) ( not ( = ?auto_238950 ?auto_238952 ) ) ( not ( = ?auto_238950 ?auto_238953 ) ) ( not ( = ?auto_238950 ?auto_238954 ) ) ( not ( = ?auto_238950 ?auto_238955 ) ) ( not ( = ?auto_238950 ?auto_238956 ) ) ( not ( = ?auto_238950 ?auto_238957 ) ) ( not ( = ?auto_238950 ?auto_238958 ) ) ( not ( = ?auto_238951 ?auto_238952 ) ) ( not ( = ?auto_238951 ?auto_238953 ) ) ( not ( = ?auto_238951 ?auto_238954 ) ) ( not ( = ?auto_238951 ?auto_238955 ) ) ( not ( = ?auto_238951 ?auto_238956 ) ) ( not ( = ?auto_238951 ?auto_238957 ) ) ( not ( = ?auto_238951 ?auto_238958 ) ) ( not ( = ?auto_238952 ?auto_238953 ) ) ( not ( = ?auto_238952 ?auto_238954 ) ) ( not ( = ?auto_238952 ?auto_238955 ) ) ( not ( = ?auto_238952 ?auto_238956 ) ) ( not ( = ?auto_238952 ?auto_238957 ) ) ( not ( = ?auto_238952 ?auto_238958 ) ) ( not ( = ?auto_238953 ?auto_238954 ) ) ( not ( = ?auto_238953 ?auto_238955 ) ) ( not ( = ?auto_238953 ?auto_238956 ) ) ( not ( = ?auto_238953 ?auto_238957 ) ) ( not ( = ?auto_238953 ?auto_238958 ) ) ( not ( = ?auto_238954 ?auto_238955 ) ) ( not ( = ?auto_238954 ?auto_238956 ) ) ( not ( = ?auto_238954 ?auto_238957 ) ) ( not ( = ?auto_238954 ?auto_238958 ) ) ( not ( = ?auto_238955 ?auto_238956 ) ) ( not ( = ?auto_238955 ?auto_238957 ) ) ( not ( = ?auto_238955 ?auto_238958 ) ) ( not ( = ?auto_238956 ?auto_238957 ) ) ( not ( = ?auto_238956 ?auto_238958 ) ) ( not ( = ?auto_238957 ?auto_238958 ) ) ( CLEAR ?auto_238955 ) ( ON ?auto_238956 ?auto_238957 ) ( CLEAR ?auto_238956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_238946 ?auto_238947 ?auto_238948 ?auto_238949 ?auto_238950 ?auto_238951 ?auto_238952 ?auto_238953 ?auto_238954 ?auto_238955 ?auto_238956 )
      ( MAKE-12PILE ?auto_238946 ?auto_238947 ?auto_238948 ?auto_238949 ?auto_238950 ?auto_238951 ?auto_238952 ?auto_238953 ?auto_238954 ?auto_238955 ?auto_238956 ?auto_238957 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_238971 - BLOCK
      ?auto_238972 - BLOCK
      ?auto_238973 - BLOCK
      ?auto_238974 - BLOCK
      ?auto_238975 - BLOCK
      ?auto_238976 - BLOCK
      ?auto_238977 - BLOCK
      ?auto_238978 - BLOCK
      ?auto_238979 - BLOCK
      ?auto_238980 - BLOCK
      ?auto_238981 - BLOCK
      ?auto_238982 - BLOCK
    )
    :vars
    (
      ?auto_238983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238982 ?auto_238983 ) ( ON-TABLE ?auto_238971 ) ( ON ?auto_238972 ?auto_238971 ) ( ON ?auto_238973 ?auto_238972 ) ( ON ?auto_238974 ?auto_238973 ) ( ON ?auto_238975 ?auto_238974 ) ( ON ?auto_238976 ?auto_238975 ) ( ON ?auto_238977 ?auto_238976 ) ( ON ?auto_238978 ?auto_238977 ) ( ON ?auto_238979 ?auto_238978 ) ( ON ?auto_238980 ?auto_238979 ) ( not ( = ?auto_238971 ?auto_238972 ) ) ( not ( = ?auto_238971 ?auto_238973 ) ) ( not ( = ?auto_238971 ?auto_238974 ) ) ( not ( = ?auto_238971 ?auto_238975 ) ) ( not ( = ?auto_238971 ?auto_238976 ) ) ( not ( = ?auto_238971 ?auto_238977 ) ) ( not ( = ?auto_238971 ?auto_238978 ) ) ( not ( = ?auto_238971 ?auto_238979 ) ) ( not ( = ?auto_238971 ?auto_238980 ) ) ( not ( = ?auto_238971 ?auto_238981 ) ) ( not ( = ?auto_238971 ?auto_238982 ) ) ( not ( = ?auto_238971 ?auto_238983 ) ) ( not ( = ?auto_238972 ?auto_238973 ) ) ( not ( = ?auto_238972 ?auto_238974 ) ) ( not ( = ?auto_238972 ?auto_238975 ) ) ( not ( = ?auto_238972 ?auto_238976 ) ) ( not ( = ?auto_238972 ?auto_238977 ) ) ( not ( = ?auto_238972 ?auto_238978 ) ) ( not ( = ?auto_238972 ?auto_238979 ) ) ( not ( = ?auto_238972 ?auto_238980 ) ) ( not ( = ?auto_238972 ?auto_238981 ) ) ( not ( = ?auto_238972 ?auto_238982 ) ) ( not ( = ?auto_238972 ?auto_238983 ) ) ( not ( = ?auto_238973 ?auto_238974 ) ) ( not ( = ?auto_238973 ?auto_238975 ) ) ( not ( = ?auto_238973 ?auto_238976 ) ) ( not ( = ?auto_238973 ?auto_238977 ) ) ( not ( = ?auto_238973 ?auto_238978 ) ) ( not ( = ?auto_238973 ?auto_238979 ) ) ( not ( = ?auto_238973 ?auto_238980 ) ) ( not ( = ?auto_238973 ?auto_238981 ) ) ( not ( = ?auto_238973 ?auto_238982 ) ) ( not ( = ?auto_238973 ?auto_238983 ) ) ( not ( = ?auto_238974 ?auto_238975 ) ) ( not ( = ?auto_238974 ?auto_238976 ) ) ( not ( = ?auto_238974 ?auto_238977 ) ) ( not ( = ?auto_238974 ?auto_238978 ) ) ( not ( = ?auto_238974 ?auto_238979 ) ) ( not ( = ?auto_238974 ?auto_238980 ) ) ( not ( = ?auto_238974 ?auto_238981 ) ) ( not ( = ?auto_238974 ?auto_238982 ) ) ( not ( = ?auto_238974 ?auto_238983 ) ) ( not ( = ?auto_238975 ?auto_238976 ) ) ( not ( = ?auto_238975 ?auto_238977 ) ) ( not ( = ?auto_238975 ?auto_238978 ) ) ( not ( = ?auto_238975 ?auto_238979 ) ) ( not ( = ?auto_238975 ?auto_238980 ) ) ( not ( = ?auto_238975 ?auto_238981 ) ) ( not ( = ?auto_238975 ?auto_238982 ) ) ( not ( = ?auto_238975 ?auto_238983 ) ) ( not ( = ?auto_238976 ?auto_238977 ) ) ( not ( = ?auto_238976 ?auto_238978 ) ) ( not ( = ?auto_238976 ?auto_238979 ) ) ( not ( = ?auto_238976 ?auto_238980 ) ) ( not ( = ?auto_238976 ?auto_238981 ) ) ( not ( = ?auto_238976 ?auto_238982 ) ) ( not ( = ?auto_238976 ?auto_238983 ) ) ( not ( = ?auto_238977 ?auto_238978 ) ) ( not ( = ?auto_238977 ?auto_238979 ) ) ( not ( = ?auto_238977 ?auto_238980 ) ) ( not ( = ?auto_238977 ?auto_238981 ) ) ( not ( = ?auto_238977 ?auto_238982 ) ) ( not ( = ?auto_238977 ?auto_238983 ) ) ( not ( = ?auto_238978 ?auto_238979 ) ) ( not ( = ?auto_238978 ?auto_238980 ) ) ( not ( = ?auto_238978 ?auto_238981 ) ) ( not ( = ?auto_238978 ?auto_238982 ) ) ( not ( = ?auto_238978 ?auto_238983 ) ) ( not ( = ?auto_238979 ?auto_238980 ) ) ( not ( = ?auto_238979 ?auto_238981 ) ) ( not ( = ?auto_238979 ?auto_238982 ) ) ( not ( = ?auto_238979 ?auto_238983 ) ) ( not ( = ?auto_238980 ?auto_238981 ) ) ( not ( = ?auto_238980 ?auto_238982 ) ) ( not ( = ?auto_238980 ?auto_238983 ) ) ( not ( = ?auto_238981 ?auto_238982 ) ) ( not ( = ?auto_238981 ?auto_238983 ) ) ( not ( = ?auto_238982 ?auto_238983 ) ) ( CLEAR ?auto_238980 ) ( ON ?auto_238981 ?auto_238982 ) ( CLEAR ?auto_238981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_238971 ?auto_238972 ?auto_238973 ?auto_238974 ?auto_238975 ?auto_238976 ?auto_238977 ?auto_238978 ?auto_238979 ?auto_238980 ?auto_238981 )
      ( MAKE-12PILE ?auto_238971 ?auto_238972 ?auto_238973 ?auto_238974 ?auto_238975 ?auto_238976 ?auto_238977 ?auto_238978 ?auto_238979 ?auto_238980 ?auto_238981 ?auto_238982 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_238996 - BLOCK
      ?auto_238997 - BLOCK
      ?auto_238998 - BLOCK
      ?auto_238999 - BLOCK
      ?auto_239000 - BLOCK
      ?auto_239001 - BLOCK
      ?auto_239002 - BLOCK
      ?auto_239003 - BLOCK
      ?auto_239004 - BLOCK
      ?auto_239005 - BLOCK
      ?auto_239006 - BLOCK
      ?auto_239007 - BLOCK
    )
    :vars
    (
      ?auto_239008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239007 ?auto_239008 ) ( ON-TABLE ?auto_238996 ) ( ON ?auto_238997 ?auto_238996 ) ( ON ?auto_238998 ?auto_238997 ) ( ON ?auto_238999 ?auto_238998 ) ( ON ?auto_239000 ?auto_238999 ) ( ON ?auto_239001 ?auto_239000 ) ( ON ?auto_239002 ?auto_239001 ) ( ON ?auto_239003 ?auto_239002 ) ( ON ?auto_239004 ?auto_239003 ) ( not ( = ?auto_238996 ?auto_238997 ) ) ( not ( = ?auto_238996 ?auto_238998 ) ) ( not ( = ?auto_238996 ?auto_238999 ) ) ( not ( = ?auto_238996 ?auto_239000 ) ) ( not ( = ?auto_238996 ?auto_239001 ) ) ( not ( = ?auto_238996 ?auto_239002 ) ) ( not ( = ?auto_238996 ?auto_239003 ) ) ( not ( = ?auto_238996 ?auto_239004 ) ) ( not ( = ?auto_238996 ?auto_239005 ) ) ( not ( = ?auto_238996 ?auto_239006 ) ) ( not ( = ?auto_238996 ?auto_239007 ) ) ( not ( = ?auto_238996 ?auto_239008 ) ) ( not ( = ?auto_238997 ?auto_238998 ) ) ( not ( = ?auto_238997 ?auto_238999 ) ) ( not ( = ?auto_238997 ?auto_239000 ) ) ( not ( = ?auto_238997 ?auto_239001 ) ) ( not ( = ?auto_238997 ?auto_239002 ) ) ( not ( = ?auto_238997 ?auto_239003 ) ) ( not ( = ?auto_238997 ?auto_239004 ) ) ( not ( = ?auto_238997 ?auto_239005 ) ) ( not ( = ?auto_238997 ?auto_239006 ) ) ( not ( = ?auto_238997 ?auto_239007 ) ) ( not ( = ?auto_238997 ?auto_239008 ) ) ( not ( = ?auto_238998 ?auto_238999 ) ) ( not ( = ?auto_238998 ?auto_239000 ) ) ( not ( = ?auto_238998 ?auto_239001 ) ) ( not ( = ?auto_238998 ?auto_239002 ) ) ( not ( = ?auto_238998 ?auto_239003 ) ) ( not ( = ?auto_238998 ?auto_239004 ) ) ( not ( = ?auto_238998 ?auto_239005 ) ) ( not ( = ?auto_238998 ?auto_239006 ) ) ( not ( = ?auto_238998 ?auto_239007 ) ) ( not ( = ?auto_238998 ?auto_239008 ) ) ( not ( = ?auto_238999 ?auto_239000 ) ) ( not ( = ?auto_238999 ?auto_239001 ) ) ( not ( = ?auto_238999 ?auto_239002 ) ) ( not ( = ?auto_238999 ?auto_239003 ) ) ( not ( = ?auto_238999 ?auto_239004 ) ) ( not ( = ?auto_238999 ?auto_239005 ) ) ( not ( = ?auto_238999 ?auto_239006 ) ) ( not ( = ?auto_238999 ?auto_239007 ) ) ( not ( = ?auto_238999 ?auto_239008 ) ) ( not ( = ?auto_239000 ?auto_239001 ) ) ( not ( = ?auto_239000 ?auto_239002 ) ) ( not ( = ?auto_239000 ?auto_239003 ) ) ( not ( = ?auto_239000 ?auto_239004 ) ) ( not ( = ?auto_239000 ?auto_239005 ) ) ( not ( = ?auto_239000 ?auto_239006 ) ) ( not ( = ?auto_239000 ?auto_239007 ) ) ( not ( = ?auto_239000 ?auto_239008 ) ) ( not ( = ?auto_239001 ?auto_239002 ) ) ( not ( = ?auto_239001 ?auto_239003 ) ) ( not ( = ?auto_239001 ?auto_239004 ) ) ( not ( = ?auto_239001 ?auto_239005 ) ) ( not ( = ?auto_239001 ?auto_239006 ) ) ( not ( = ?auto_239001 ?auto_239007 ) ) ( not ( = ?auto_239001 ?auto_239008 ) ) ( not ( = ?auto_239002 ?auto_239003 ) ) ( not ( = ?auto_239002 ?auto_239004 ) ) ( not ( = ?auto_239002 ?auto_239005 ) ) ( not ( = ?auto_239002 ?auto_239006 ) ) ( not ( = ?auto_239002 ?auto_239007 ) ) ( not ( = ?auto_239002 ?auto_239008 ) ) ( not ( = ?auto_239003 ?auto_239004 ) ) ( not ( = ?auto_239003 ?auto_239005 ) ) ( not ( = ?auto_239003 ?auto_239006 ) ) ( not ( = ?auto_239003 ?auto_239007 ) ) ( not ( = ?auto_239003 ?auto_239008 ) ) ( not ( = ?auto_239004 ?auto_239005 ) ) ( not ( = ?auto_239004 ?auto_239006 ) ) ( not ( = ?auto_239004 ?auto_239007 ) ) ( not ( = ?auto_239004 ?auto_239008 ) ) ( not ( = ?auto_239005 ?auto_239006 ) ) ( not ( = ?auto_239005 ?auto_239007 ) ) ( not ( = ?auto_239005 ?auto_239008 ) ) ( not ( = ?auto_239006 ?auto_239007 ) ) ( not ( = ?auto_239006 ?auto_239008 ) ) ( not ( = ?auto_239007 ?auto_239008 ) ) ( ON ?auto_239006 ?auto_239007 ) ( CLEAR ?auto_239004 ) ( ON ?auto_239005 ?auto_239006 ) ( CLEAR ?auto_239005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_238996 ?auto_238997 ?auto_238998 ?auto_238999 ?auto_239000 ?auto_239001 ?auto_239002 ?auto_239003 ?auto_239004 ?auto_239005 )
      ( MAKE-12PILE ?auto_238996 ?auto_238997 ?auto_238998 ?auto_238999 ?auto_239000 ?auto_239001 ?auto_239002 ?auto_239003 ?auto_239004 ?auto_239005 ?auto_239006 ?auto_239007 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239021 - BLOCK
      ?auto_239022 - BLOCK
      ?auto_239023 - BLOCK
      ?auto_239024 - BLOCK
      ?auto_239025 - BLOCK
      ?auto_239026 - BLOCK
      ?auto_239027 - BLOCK
      ?auto_239028 - BLOCK
      ?auto_239029 - BLOCK
      ?auto_239030 - BLOCK
      ?auto_239031 - BLOCK
      ?auto_239032 - BLOCK
    )
    :vars
    (
      ?auto_239033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239032 ?auto_239033 ) ( ON-TABLE ?auto_239021 ) ( ON ?auto_239022 ?auto_239021 ) ( ON ?auto_239023 ?auto_239022 ) ( ON ?auto_239024 ?auto_239023 ) ( ON ?auto_239025 ?auto_239024 ) ( ON ?auto_239026 ?auto_239025 ) ( ON ?auto_239027 ?auto_239026 ) ( ON ?auto_239028 ?auto_239027 ) ( ON ?auto_239029 ?auto_239028 ) ( not ( = ?auto_239021 ?auto_239022 ) ) ( not ( = ?auto_239021 ?auto_239023 ) ) ( not ( = ?auto_239021 ?auto_239024 ) ) ( not ( = ?auto_239021 ?auto_239025 ) ) ( not ( = ?auto_239021 ?auto_239026 ) ) ( not ( = ?auto_239021 ?auto_239027 ) ) ( not ( = ?auto_239021 ?auto_239028 ) ) ( not ( = ?auto_239021 ?auto_239029 ) ) ( not ( = ?auto_239021 ?auto_239030 ) ) ( not ( = ?auto_239021 ?auto_239031 ) ) ( not ( = ?auto_239021 ?auto_239032 ) ) ( not ( = ?auto_239021 ?auto_239033 ) ) ( not ( = ?auto_239022 ?auto_239023 ) ) ( not ( = ?auto_239022 ?auto_239024 ) ) ( not ( = ?auto_239022 ?auto_239025 ) ) ( not ( = ?auto_239022 ?auto_239026 ) ) ( not ( = ?auto_239022 ?auto_239027 ) ) ( not ( = ?auto_239022 ?auto_239028 ) ) ( not ( = ?auto_239022 ?auto_239029 ) ) ( not ( = ?auto_239022 ?auto_239030 ) ) ( not ( = ?auto_239022 ?auto_239031 ) ) ( not ( = ?auto_239022 ?auto_239032 ) ) ( not ( = ?auto_239022 ?auto_239033 ) ) ( not ( = ?auto_239023 ?auto_239024 ) ) ( not ( = ?auto_239023 ?auto_239025 ) ) ( not ( = ?auto_239023 ?auto_239026 ) ) ( not ( = ?auto_239023 ?auto_239027 ) ) ( not ( = ?auto_239023 ?auto_239028 ) ) ( not ( = ?auto_239023 ?auto_239029 ) ) ( not ( = ?auto_239023 ?auto_239030 ) ) ( not ( = ?auto_239023 ?auto_239031 ) ) ( not ( = ?auto_239023 ?auto_239032 ) ) ( not ( = ?auto_239023 ?auto_239033 ) ) ( not ( = ?auto_239024 ?auto_239025 ) ) ( not ( = ?auto_239024 ?auto_239026 ) ) ( not ( = ?auto_239024 ?auto_239027 ) ) ( not ( = ?auto_239024 ?auto_239028 ) ) ( not ( = ?auto_239024 ?auto_239029 ) ) ( not ( = ?auto_239024 ?auto_239030 ) ) ( not ( = ?auto_239024 ?auto_239031 ) ) ( not ( = ?auto_239024 ?auto_239032 ) ) ( not ( = ?auto_239024 ?auto_239033 ) ) ( not ( = ?auto_239025 ?auto_239026 ) ) ( not ( = ?auto_239025 ?auto_239027 ) ) ( not ( = ?auto_239025 ?auto_239028 ) ) ( not ( = ?auto_239025 ?auto_239029 ) ) ( not ( = ?auto_239025 ?auto_239030 ) ) ( not ( = ?auto_239025 ?auto_239031 ) ) ( not ( = ?auto_239025 ?auto_239032 ) ) ( not ( = ?auto_239025 ?auto_239033 ) ) ( not ( = ?auto_239026 ?auto_239027 ) ) ( not ( = ?auto_239026 ?auto_239028 ) ) ( not ( = ?auto_239026 ?auto_239029 ) ) ( not ( = ?auto_239026 ?auto_239030 ) ) ( not ( = ?auto_239026 ?auto_239031 ) ) ( not ( = ?auto_239026 ?auto_239032 ) ) ( not ( = ?auto_239026 ?auto_239033 ) ) ( not ( = ?auto_239027 ?auto_239028 ) ) ( not ( = ?auto_239027 ?auto_239029 ) ) ( not ( = ?auto_239027 ?auto_239030 ) ) ( not ( = ?auto_239027 ?auto_239031 ) ) ( not ( = ?auto_239027 ?auto_239032 ) ) ( not ( = ?auto_239027 ?auto_239033 ) ) ( not ( = ?auto_239028 ?auto_239029 ) ) ( not ( = ?auto_239028 ?auto_239030 ) ) ( not ( = ?auto_239028 ?auto_239031 ) ) ( not ( = ?auto_239028 ?auto_239032 ) ) ( not ( = ?auto_239028 ?auto_239033 ) ) ( not ( = ?auto_239029 ?auto_239030 ) ) ( not ( = ?auto_239029 ?auto_239031 ) ) ( not ( = ?auto_239029 ?auto_239032 ) ) ( not ( = ?auto_239029 ?auto_239033 ) ) ( not ( = ?auto_239030 ?auto_239031 ) ) ( not ( = ?auto_239030 ?auto_239032 ) ) ( not ( = ?auto_239030 ?auto_239033 ) ) ( not ( = ?auto_239031 ?auto_239032 ) ) ( not ( = ?auto_239031 ?auto_239033 ) ) ( not ( = ?auto_239032 ?auto_239033 ) ) ( ON ?auto_239031 ?auto_239032 ) ( CLEAR ?auto_239029 ) ( ON ?auto_239030 ?auto_239031 ) ( CLEAR ?auto_239030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_239021 ?auto_239022 ?auto_239023 ?auto_239024 ?auto_239025 ?auto_239026 ?auto_239027 ?auto_239028 ?auto_239029 ?auto_239030 )
      ( MAKE-12PILE ?auto_239021 ?auto_239022 ?auto_239023 ?auto_239024 ?auto_239025 ?auto_239026 ?auto_239027 ?auto_239028 ?auto_239029 ?auto_239030 ?auto_239031 ?auto_239032 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239046 - BLOCK
      ?auto_239047 - BLOCK
      ?auto_239048 - BLOCK
      ?auto_239049 - BLOCK
      ?auto_239050 - BLOCK
      ?auto_239051 - BLOCK
      ?auto_239052 - BLOCK
      ?auto_239053 - BLOCK
      ?auto_239054 - BLOCK
      ?auto_239055 - BLOCK
      ?auto_239056 - BLOCK
      ?auto_239057 - BLOCK
    )
    :vars
    (
      ?auto_239058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239057 ?auto_239058 ) ( ON-TABLE ?auto_239046 ) ( ON ?auto_239047 ?auto_239046 ) ( ON ?auto_239048 ?auto_239047 ) ( ON ?auto_239049 ?auto_239048 ) ( ON ?auto_239050 ?auto_239049 ) ( ON ?auto_239051 ?auto_239050 ) ( ON ?auto_239052 ?auto_239051 ) ( ON ?auto_239053 ?auto_239052 ) ( not ( = ?auto_239046 ?auto_239047 ) ) ( not ( = ?auto_239046 ?auto_239048 ) ) ( not ( = ?auto_239046 ?auto_239049 ) ) ( not ( = ?auto_239046 ?auto_239050 ) ) ( not ( = ?auto_239046 ?auto_239051 ) ) ( not ( = ?auto_239046 ?auto_239052 ) ) ( not ( = ?auto_239046 ?auto_239053 ) ) ( not ( = ?auto_239046 ?auto_239054 ) ) ( not ( = ?auto_239046 ?auto_239055 ) ) ( not ( = ?auto_239046 ?auto_239056 ) ) ( not ( = ?auto_239046 ?auto_239057 ) ) ( not ( = ?auto_239046 ?auto_239058 ) ) ( not ( = ?auto_239047 ?auto_239048 ) ) ( not ( = ?auto_239047 ?auto_239049 ) ) ( not ( = ?auto_239047 ?auto_239050 ) ) ( not ( = ?auto_239047 ?auto_239051 ) ) ( not ( = ?auto_239047 ?auto_239052 ) ) ( not ( = ?auto_239047 ?auto_239053 ) ) ( not ( = ?auto_239047 ?auto_239054 ) ) ( not ( = ?auto_239047 ?auto_239055 ) ) ( not ( = ?auto_239047 ?auto_239056 ) ) ( not ( = ?auto_239047 ?auto_239057 ) ) ( not ( = ?auto_239047 ?auto_239058 ) ) ( not ( = ?auto_239048 ?auto_239049 ) ) ( not ( = ?auto_239048 ?auto_239050 ) ) ( not ( = ?auto_239048 ?auto_239051 ) ) ( not ( = ?auto_239048 ?auto_239052 ) ) ( not ( = ?auto_239048 ?auto_239053 ) ) ( not ( = ?auto_239048 ?auto_239054 ) ) ( not ( = ?auto_239048 ?auto_239055 ) ) ( not ( = ?auto_239048 ?auto_239056 ) ) ( not ( = ?auto_239048 ?auto_239057 ) ) ( not ( = ?auto_239048 ?auto_239058 ) ) ( not ( = ?auto_239049 ?auto_239050 ) ) ( not ( = ?auto_239049 ?auto_239051 ) ) ( not ( = ?auto_239049 ?auto_239052 ) ) ( not ( = ?auto_239049 ?auto_239053 ) ) ( not ( = ?auto_239049 ?auto_239054 ) ) ( not ( = ?auto_239049 ?auto_239055 ) ) ( not ( = ?auto_239049 ?auto_239056 ) ) ( not ( = ?auto_239049 ?auto_239057 ) ) ( not ( = ?auto_239049 ?auto_239058 ) ) ( not ( = ?auto_239050 ?auto_239051 ) ) ( not ( = ?auto_239050 ?auto_239052 ) ) ( not ( = ?auto_239050 ?auto_239053 ) ) ( not ( = ?auto_239050 ?auto_239054 ) ) ( not ( = ?auto_239050 ?auto_239055 ) ) ( not ( = ?auto_239050 ?auto_239056 ) ) ( not ( = ?auto_239050 ?auto_239057 ) ) ( not ( = ?auto_239050 ?auto_239058 ) ) ( not ( = ?auto_239051 ?auto_239052 ) ) ( not ( = ?auto_239051 ?auto_239053 ) ) ( not ( = ?auto_239051 ?auto_239054 ) ) ( not ( = ?auto_239051 ?auto_239055 ) ) ( not ( = ?auto_239051 ?auto_239056 ) ) ( not ( = ?auto_239051 ?auto_239057 ) ) ( not ( = ?auto_239051 ?auto_239058 ) ) ( not ( = ?auto_239052 ?auto_239053 ) ) ( not ( = ?auto_239052 ?auto_239054 ) ) ( not ( = ?auto_239052 ?auto_239055 ) ) ( not ( = ?auto_239052 ?auto_239056 ) ) ( not ( = ?auto_239052 ?auto_239057 ) ) ( not ( = ?auto_239052 ?auto_239058 ) ) ( not ( = ?auto_239053 ?auto_239054 ) ) ( not ( = ?auto_239053 ?auto_239055 ) ) ( not ( = ?auto_239053 ?auto_239056 ) ) ( not ( = ?auto_239053 ?auto_239057 ) ) ( not ( = ?auto_239053 ?auto_239058 ) ) ( not ( = ?auto_239054 ?auto_239055 ) ) ( not ( = ?auto_239054 ?auto_239056 ) ) ( not ( = ?auto_239054 ?auto_239057 ) ) ( not ( = ?auto_239054 ?auto_239058 ) ) ( not ( = ?auto_239055 ?auto_239056 ) ) ( not ( = ?auto_239055 ?auto_239057 ) ) ( not ( = ?auto_239055 ?auto_239058 ) ) ( not ( = ?auto_239056 ?auto_239057 ) ) ( not ( = ?auto_239056 ?auto_239058 ) ) ( not ( = ?auto_239057 ?auto_239058 ) ) ( ON ?auto_239056 ?auto_239057 ) ( ON ?auto_239055 ?auto_239056 ) ( CLEAR ?auto_239053 ) ( ON ?auto_239054 ?auto_239055 ) ( CLEAR ?auto_239054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_239046 ?auto_239047 ?auto_239048 ?auto_239049 ?auto_239050 ?auto_239051 ?auto_239052 ?auto_239053 ?auto_239054 )
      ( MAKE-12PILE ?auto_239046 ?auto_239047 ?auto_239048 ?auto_239049 ?auto_239050 ?auto_239051 ?auto_239052 ?auto_239053 ?auto_239054 ?auto_239055 ?auto_239056 ?auto_239057 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239071 - BLOCK
      ?auto_239072 - BLOCK
      ?auto_239073 - BLOCK
      ?auto_239074 - BLOCK
      ?auto_239075 - BLOCK
      ?auto_239076 - BLOCK
      ?auto_239077 - BLOCK
      ?auto_239078 - BLOCK
      ?auto_239079 - BLOCK
      ?auto_239080 - BLOCK
      ?auto_239081 - BLOCK
      ?auto_239082 - BLOCK
    )
    :vars
    (
      ?auto_239083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239082 ?auto_239083 ) ( ON-TABLE ?auto_239071 ) ( ON ?auto_239072 ?auto_239071 ) ( ON ?auto_239073 ?auto_239072 ) ( ON ?auto_239074 ?auto_239073 ) ( ON ?auto_239075 ?auto_239074 ) ( ON ?auto_239076 ?auto_239075 ) ( ON ?auto_239077 ?auto_239076 ) ( ON ?auto_239078 ?auto_239077 ) ( not ( = ?auto_239071 ?auto_239072 ) ) ( not ( = ?auto_239071 ?auto_239073 ) ) ( not ( = ?auto_239071 ?auto_239074 ) ) ( not ( = ?auto_239071 ?auto_239075 ) ) ( not ( = ?auto_239071 ?auto_239076 ) ) ( not ( = ?auto_239071 ?auto_239077 ) ) ( not ( = ?auto_239071 ?auto_239078 ) ) ( not ( = ?auto_239071 ?auto_239079 ) ) ( not ( = ?auto_239071 ?auto_239080 ) ) ( not ( = ?auto_239071 ?auto_239081 ) ) ( not ( = ?auto_239071 ?auto_239082 ) ) ( not ( = ?auto_239071 ?auto_239083 ) ) ( not ( = ?auto_239072 ?auto_239073 ) ) ( not ( = ?auto_239072 ?auto_239074 ) ) ( not ( = ?auto_239072 ?auto_239075 ) ) ( not ( = ?auto_239072 ?auto_239076 ) ) ( not ( = ?auto_239072 ?auto_239077 ) ) ( not ( = ?auto_239072 ?auto_239078 ) ) ( not ( = ?auto_239072 ?auto_239079 ) ) ( not ( = ?auto_239072 ?auto_239080 ) ) ( not ( = ?auto_239072 ?auto_239081 ) ) ( not ( = ?auto_239072 ?auto_239082 ) ) ( not ( = ?auto_239072 ?auto_239083 ) ) ( not ( = ?auto_239073 ?auto_239074 ) ) ( not ( = ?auto_239073 ?auto_239075 ) ) ( not ( = ?auto_239073 ?auto_239076 ) ) ( not ( = ?auto_239073 ?auto_239077 ) ) ( not ( = ?auto_239073 ?auto_239078 ) ) ( not ( = ?auto_239073 ?auto_239079 ) ) ( not ( = ?auto_239073 ?auto_239080 ) ) ( not ( = ?auto_239073 ?auto_239081 ) ) ( not ( = ?auto_239073 ?auto_239082 ) ) ( not ( = ?auto_239073 ?auto_239083 ) ) ( not ( = ?auto_239074 ?auto_239075 ) ) ( not ( = ?auto_239074 ?auto_239076 ) ) ( not ( = ?auto_239074 ?auto_239077 ) ) ( not ( = ?auto_239074 ?auto_239078 ) ) ( not ( = ?auto_239074 ?auto_239079 ) ) ( not ( = ?auto_239074 ?auto_239080 ) ) ( not ( = ?auto_239074 ?auto_239081 ) ) ( not ( = ?auto_239074 ?auto_239082 ) ) ( not ( = ?auto_239074 ?auto_239083 ) ) ( not ( = ?auto_239075 ?auto_239076 ) ) ( not ( = ?auto_239075 ?auto_239077 ) ) ( not ( = ?auto_239075 ?auto_239078 ) ) ( not ( = ?auto_239075 ?auto_239079 ) ) ( not ( = ?auto_239075 ?auto_239080 ) ) ( not ( = ?auto_239075 ?auto_239081 ) ) ( not ( = ?auto_239075 ?auto_239082 ) ) ( not ( = ?auto_239075 ?auto_239083 ) ) ( not ( = ?auto_239076 ?auto_239077 ) ) ( not ( = ?auto_239076 ?auto_239078 ) ) ( not ( = ?auto_239076 ?auto_239079 ) ) ( not ( = ?auto_239076 ?auto_239080 ) ) ( not ( = ?auto_239076 ?auto_239081 ) ) ( not ( = ?auto_239076 ?auto_239082 ) ) ( not ( = ?auto_239076 ?auto_239083 ) ) ( not ( = ?auto_239077 ?auto_239078 ) ) ( not ( = ?auto_239077 ?auto_239079 ) ) ( not ( = ?auto_239077 ?auto_239080 ) ) ( not ( = ?auto_239077 ?auto_239081 ) ) ( not ( = ?auto_239077 ?auto_239082 ) ) ( not ( = ?auto_239077 ?auto_239083 ) ) ( not ( = ?auto_239078 ?auto_239079 ) ) ( not ( = ?auto_239078 ?auto_239080 ) ) ( not ( = ?auto_239078 ?auto_239081 ) ) ( not ( = ?auto_239078 ?auto_239082 ) ) ( not ( = ?auto_239078 ?auto_239083 ) ) ( not ( = ?auto_239079 ?auto_239080 ) ) ( not ( = ?auto_239079 ?auto_239081 ) ) ( not ( = ?auto_239079 ?auto_239082 ) ) ( not ( = ?auto_239079 ?auto_239083 ) ) ( not ( = ?auto_239080 ?auto_239081 ) ) ( not ( = ?auto_239080 ?auto_239082 ) ) ( not ( = ?auto_239080 ?auto_239083 ) ) ( not ( = ?auto_239081 ?auto_239082 ) ) ( not ( = ?auto_239081 ?auto_239083 ) ) ( not ( = ?auto_239082 ?auto_239083 ) ) ( ON ?auto_239081 ?auto_239082 ) ( ON ?auto_239080 ?auto_239081 ) ( CLEAR ?auto_239078 ) ( ON ?auto_239079 ?auto_239080 ) ( CLEAR ?auto_239079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_239071 ?auto_239072 ?auto_239073 ?auto_239074 ?auto_239075 ?auto_239076 ?auto_239077 ?auto_239078 ?auto_239079 )
      ( MAKE-12PILE ?auto_239071 ?auto_239072 ?auto_239073 ?auto_239074 ?auto_239075 ?auto_239076 ?auto_239077 ?auto_239078 ?auto_239079 ?auto_239080 ?auto_239081 ?auto_239082 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239096 - BLOCK
      ?auto_239097 - BLOCK
      ?auto_239098 - BLOCK
      ?auto_239099 - BLOCK
      ?auto_239100 - BLOCK
      ?auto_239101 - BLOCK
      ?auto_239102 - BLOCK
      ?auto_239103 - BLOCK
      ?auto_239104 - BLOCK
      ?auto_239105 - BLOCK
      ?auto_239106 - BLOCK
      ?auto_239107 - BLOCK
    )
    :vars
    (
      ?auto_239108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239107 ?auto_239108 ) ( ON-TABLE ?auto_239096 ) ( ON ?auto_239097 ?auto_239096 ) ( ON ?auto_239098 ?auto_239097 ) ( ON ?auto_239099 ?auto_239098 ) ( ON ?auto_239100 ?auto_239099 ) ( ON ?auto_239101 ?auto_239100 ) ( ON ?auto_239102 ?auto_239101 ) ( not ( = ?auto_239096 ?auto_239097 ) ) ( not ( = ?auto_239096 ?auto_239098 ) ) ( not ( = ?auto_239096 ?auto_239099 ) ) ( not ( = ?auto_239096 ?auto_239100 ) ) ( not ( = ?auto_239096 ?auto_239101 ) ) ( not ( = ?auto_239096 ?auto_239102 ) ) ( not ( = ?auto_239096 ?auto_239103 ) ) ( not ( = ?auto_239096 ?auto_239104 ) ) ( not ( = ?auto_239096 ?auto_239105 ) ) ( not ( = ?auto_239096 ?auto_239106 ) ) ( not ( = ?auto_239096 ?auto_239107 ) ) ( not ( = ?auto_239096 ?auto_239108 ) ) ( not ( = ?auto_239097 ?auto_239098 ) ) ( not ( = ?auto_239097 ?auto_239099 ) ) ( not ( = ?auto_239097 ?auto_239100 ) ) ( not ( = ?auto_239097 ?auto_239101 ) ) ( not ( = ?auto_239097 ?auto_239102 ) ) ( not ( = ?auto_239097 ?auto_239103 ) ) ( not ( = ?auto_239097 ?auto_239104 ) ) ( not ( = ?auto_239097 ?auto_239105 ) ) ( not ( = ?auto_239097 ?auto_239106 ) ) ( not ( = ?auto_239097 ?auto_239107 ) ) ( not ( = ?auto_239097 ?auto_239108 ) ) ( not ( = ?auto_239098 ?auto_239099 ) ) ( not ( = ?auto_239098 ?auto_239100 ) ) ( not ( = ?auto_239098 ?auto_239101 ) ) ( not ( = ?auto_239098 ?auto_239102 ) ) ( not ( = ?auto_239098 ?auto_239103 ) ) ( not ( = ?auto_239098 ?auto_239104 ) ) ( not ( = ?auto_239098 ?auto_239105 ) ) ( not ( = ?auto_239098 ?auto_239106 ) ) ( not ( = ?auto_239098 ?auto_239107 ) ) ( not ( = ?auto_239098 ?auto_239108 ) ) ( not ( = ?auto_239099 ?auto_239100 ) ) ( not ( = ?auto_239099 ?auto_239101 ) ) ( not ( = ?auto_239099 ?auto_239102 ) ) ( not ( = ?auto_239099 ?auto_239103 ) ) ( not ( = ?auto_239099 ?auto_239104 ) ) ( not ( = ?auto_239099 ?auto_239105 ) ) ( not ( = ?auto_239099 ?auto_239106 ) ) ( not ( = ?auto_239099 ?auto_239107 ) ) ( not ( = ?auto_239099 ?auto_239108 ) ) ( not ( = ?auto_239100 ?auto_239101 ) ) ( not ( = ?auto_239100 ?auto_239102 ) ) ( not ( = ?auto_239100 ?auto_239103 ) ) ( not ( = ?auto_239100 ?auto_239104 ) ) ( not ( = ?auto_239100 ?auto_239105 ) ) ( not ( = ?auto_239100 ?auto_239106 ) ) ( not ( = ?auto_239100 ?auto_239107 ) ) ( not ( = ?auto_239100 ?auto_239108 ) ) ( not ( = ?auto_239101 ?auto_239102 ) ) ( not ( = ?auto_239101 ?auto_239103 ) ) ( not ( = ?auto_239101 ?auto_239104 ) ) ( not ( = ?auto_239101 ?auto_239105 ) ) ( not ( = ?auto_239101 ?auto_239106 ) ) ( not ( = ?auto_239101 ?auto_239107 ) ) ( not ( = ?auto_239101 ?auto_239108 ) ) ( not ( = ?auto_239102 ?auto_239103 ) ) ( not ( = ?auto_239102 ?auto_239104 ) ) ( not ( = ?auto_239102 ?auto_239105 ) ) ( not ( = ?auto_239102 ?auto_239106 ) ) ( not ( = ?auto_239102 ?auto_239107 ) ) ( not ( = ?auto_239102 ?auto_239108 ) ) ( not ( = ?auto_239103 ?auto_239104 ) ) ( not ( = ?auto_239103 ?auto_239105 ) ) ( not ( = ?auto_239103 ?auto_239106 ) ) ( not ( = ?auto_239103 ?auto_239107 ) ) ( not ( = ?auto_239103 ?auto_239108 ) ) ( not ( = ?auto_239104 ?auto_239105 ) ) ( not ( = ?auto_239104 ?auto_239106 ) ) ( not ( = ?auto_239104 ?auto_239107 ) ) ( not ( = ?auto_239104 ?auto_239108 ) ) ( not ( = ?auto_239105 ?auto_239106 ) ) ( not ( = ?auto_239105 ?auto_239107 ) ) ( not ( = ?auto_239105 ?auto_239108 ) ) ( not ( = ?auto_239106 ?auto_239107 ) ) ( not ( = ?auto_239106 ?auto_239108 ) ) ( not ( = ?auto_239107 ?auto_239108 ) ) ( ON ?auto_239106 ?auto_239107 ) ( ON ?auto_239105 ?auto_239106 ) ( ON ?auto_239104 ?auto_239105 ) ( CLEAR ?auto_239102 ) ( ON ?auto_239103 ?auto_239104 ) ( CLEAR ?auto_239103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_239096 ?auto_239097 ?auto_239098 ?auto_239099 ?auto_239100 ?auto_239101 ?auto_239102 ?auto_239103 )
      ( MAKE-12PILE ?auto_239096 ?auto_239097 ?auto_239098 ?auto_239099 ?auto_239100 ?auto_239101 ?auto_239102 ?auto_239103 ?auto_239104 ?auto_239105 ?auto_239106 ?auto_239107 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239121 - BLOCK
      ?auto_239122 - BLOCK
      ?auto_239123 - BLOCK
      ?auto_239124 - BLOCK
      ?auto_239125 - BLOCK
      ?auto_239126 - BLOCK
      ?auto_239127 - BLOCK
      ?auto_239128 - BLOCK
      ?auto_239129 - BLOCK
      ?auto_239130 - BLOCK
      ?auto_239131 - BLOCK
      ?auto_239132 - BLOCK
    )
    :vars
    (
      ?auto_239133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239132 ?auto_239133 ) ( ON-TABLE ?auto_239121 ) ( ON ?auto_239122 ?auto_239121 ) ( ON ?auto_239123 ?auto_239122 ) ( ON ?auto_239124 ?auto_239123 ) ( ON ?auto_239125 ?auto_239124 ) ( ON ?auto_239126 ?auto_239125 ) ( ON ?auto_239127 ?auto_239126 ) ( not ( = ?auto_239121 ?auto_239122 ) ) ( not ( = ?auto_239121 ?auto_239123 ) ) ( not ( = ?auto_239121 ?auto_239124 ) ) ( not ( = ?auto_239121 ?auto_239125 ) ) ( not ( = ?auto_239121 ?auto_239126 ) ) ( not ( = ?auto_239121 ?auto_239127 ) ) ( not ( = ?auto_239121 ?auto_239128 ) ) ( not ( = ?auto_239121 ?auto_239129 ) ) ( not ( = ?auto_239121 ?auto_239130 ) ) ( not ( = ?auto_239121 ?auto_239131 ) ) ( not ( = ?auto_239121 ?auto_239132 ) ) ( not ( = ?auto_239121 ?auto_239133 ) ) ( not ( = ?auto_239122 ?auto_239123 ) ) ( not ( = ?auto_239122 ?auto_239124 ) ) ( not ( = ?auto_239122 ?auto_239125 ) ) ( not ( = ?auto_239122 ?auto_239126 ) ) ( not ( = ?auto_239122 ?auto_239127 ) ) ( not ( = ?auto_239122 ?auto_239128 ) ) ( not ( = ?auto_239122 ?auto_239129 ) ) ( not ( = ?auto_239122 ?auto_239130 ) ) ( not ( = ?auto_239122 ?auto_239131 ) ) ( not ( = ?auto_239122 ?auto_239132 ) ) ( not ( = ?auto_239122 ?auto_239133 ) ) ( not ( = ?auto_239123 ?auto_239124 ) ) ( not ( = ?auto_239123 ?auto_239125 ) ) ( not ( = ?auto_239123 ?auto_239126 ) ) ( not ( = ?auto_239123 ?auto_239127 ) ) ( not ( = ?auto_239123 ?auto_239128 ) ) ( not ( = ?auto_239123 ?auto_239129 ) ) ( not ( = ?auto_239123 ?auto_239130 ) ) ( not ( = ?auto_239123 ?auto_239131 ) ) ( not ( = ?auto_239123 ?auto_239132 ) ) ( not ( = ?auto_239123 ?auto_239133 ) ) ( not ( = ?auto_239124 ?auto_239125 ) ) ( not ( = ?auto_239124 ?auto_239126 ) ) ( not ( = ?auto_239124 ?auto_239127 ) ) ( not ( = ?auto_239124 ?auto_239128 ) ) ( not ( = ?auto_239124 ?auto_239129 ) ) ( not ( = ?auto_239124 ?auto_239130 ) ) ( not ( = ?auto_239124 ?auto_239131 ) ) ( not ( = ?auto_239124 ?auto_239132 ) ) ( not ( = ?auto_239124 ?auto_239133 ) ) ( not ( = ?auto_239125 ?auto_239126 ) ) ( not ( = ?auto_239125 ?auto_239127 ) ) ( not ( = ?auto_239125 ?auto_239128 ) ) ( not ( = ?auto_239125 ?auto_239129 ) ) ( not ( = ?auto_239125 ?auto_239130 ) ) ( not ( = ?auto_239125 ?auto_239131 ) ) ( not ( = ?auto_239125 ?auto_239132 ) ) ( not ( = ?auto_239125 ?auto_239133 ) ) ( not ( = ?auto_239126 ?auto_239127 ) ) ( not ( = ?auto_239126 ?auto_239128 ) ) ( not ( = ?auto_239126 ?auto_239129 ) ) ( not ( = ?auto_239126 ?auto_239130 ) ) ( not ( = ?auto_239126 ?auto_239131 ) ) ( not ( = ?auto_239126 ?auto_239132 ) ) ( not ( = ?auto_239126 ?auto_239133 ) ) ( not ( = ?auto_239127 ?auto_239128 ) ) ( not ( = ?auto_239127 ?auto_239129 ) ) ( not ( = ?auto_239127 ?auto_239130 ) ) ( not ( = ?auto_239127 ?auto_239131 ) ) ( not ( = ?auto_239127 ?auto_239132 ) ) ( not ( = ?auto_239127 ?auto_239133 ) ) ( not ( = ?auto_239128 ?auto_239129 ) ) ( not ( = ?auto_239128 ?auto_239130 ) ) ( not ( = ?auto_239128 ?auto_239131 ) ) ( not ( = ?auto_239128 ?auto_239132 ) ) ( not ( = ?auto_239128 ?auto_239133 ) ) ( not ( = ?auto_239129 ?auto_239130 ) ) ( not ( = ?auto_239129 ?auto_239131 ) ) ( not ( = ?auto_239129 ?auto_239132 ) ) ( not ( = ?auto_239129 ?auto_239133 ) ) ( not ( = ?auto_239130 ?auto_239131 ) ) ( not ( = ?auto_239130 ?auto_239132 ) ) ( not ( = ?auto_239130 ?auto_239133 ) ) ( not ( = ?auto_239131 ?auto_239132 ) ) ( not ( = ?auto_239131 ?auto_239133 ) ) ( not ( = ?auto_239132 ?auto_239133 ) ) ( ON ?auto_239131 ?auto_239132 ) ( ON ?auto_239130 ?auto_239131 ) ( ON ?auto_239129 ?auto_239130 ) ( CLEAR ?auto_239127 ) ( ON ?auto_239128 ?auto_239129 ) ( CLEAR ?auto_239128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_239121 ?auto_239122 ?auto_239123 ?auto_239124 ?auto_239125 ?auto_239126 ?auto_239127 ?auto_239128 )
      ( MAKE-12PILE ?auto_239121 ?auto_239122 ?auto_239123 ?auto_239124 ?auto_239125 ?auto_239126 ?auto_239127 ?auto_239128 ?auto_239129 ?auto_239130 ?auto_239131 ?auto_239132 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239146 - BLOCK
      ?auto_239147 - BLOCK
      ?auto_239148 - BLOCK
      ?auto_239149 - BLOCK
      ?auto_239150 - BLOCK
      ?auto_239151 - BLOCK
      ?auto_239152 - BLOCK
      ?auto_239153 - BLOCK
      ?auto_239154 - BLOCK
      ?auto_239155 - BLOCK
      ?auto_239156 - BLOCK
      ?auto_239157 - BLOCK
    )
    :vars
    (
      ?auto_239158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239157 ?auto_239158 ) ( ON-TABLE ?auto_239146 ) ( ON ?auto_239147 ?auto_239146 ) ( ON ?auto_239148 ?auto_239147 ) ( ON ?auto_239149 ?auto_239148 ) ( ON ?auto_239150 ?auto_239149 ) ( ON ?auto_239151 ?auto_239150 ) ( not ( = ?auto_239146 ?auto_239147 ) ) ( not ( = ?auto_239146 ?auto_239148 ) ) ( not ( = ?auto_239146 ?auto_239149 ) ) ( not ( = ?auto_239146 ?auto_239150 ) ) ( not ( = ?auto_239146 ?auto_239151 ) ) ( not ( = ?auto_239146 ?auto_239152 ) ) ( not ( = ?auto_239146 ?auto_239153 ) ) ( not ( = ?auto_239146 ?auto_239154 ) ) ( not ( = ?auto_239146 ?auto_239155 ) ) ( not ( = ?auto_239146 ?auto_239156 ) ) ( not ( = ?auto_239146 ?auto_239157 ) ) ( not ( = ?auto_239146 ?auto_239158 ) ) ( not ( = ?auto_239147 ?auto_239148 ) ) ( not ( = ?auto_239147 ?auto_239149 ) ) ( not ( = ?auto_239147 ?auto_239150 ) ) ( not ( = ?auto_239147 ?auto_239151 ) ) ( not ( = ?auto_239147 ?auto_239152 ) ) ( not ( = ?auto_239147 ?auto_239153 ) ) ( not ( = ?auto_239147 ?auto_239154 ) ) ( not ( = ?auto_239147 ?auto_239155 ) ) ( not ( = ?auto_239147 ?auto_239156 ) ) ( not ( = ?auto_239147 ?auto_239157 ) ) ( not ( = ?auto_239147 ?auto_239158 ) ) ( not ( = ?auto_239148 ?auto_239149 ) ) ( not ( = ?auto_239148 ?auto_239150 ) ) ( not ( = ?auto_239148 ?auto_239151 ) ) ( not ( = ?auto_239148 ?auto_239152 ) ) ( not ( = ?auto_239148 ?auto_239153 ) ) ( not ( = ?auto_239148 ?auto_239154 ) ) ( not ( = ?auto_239148 ?auto_239155 ) ) ( not ( = ?auto_239148 ?auto_239156 ) ) ( not ( = ?auto_239148 ?auto_239157 ) ) ( not ( = ?auto_239148 ?auto_239158 ) ) ( not ( = ?auto_239149 ?auto_239150 ) ) ( not ( = ?auto_239149 ?auto_239151 ) ) ( not ( = ?auto_239149 ?auto_239152 ) ) ( not ( = ?auto_239149 ?auto_239153 ) ) ( not ( = ?auto_239149 ?auto_239154 ) ) ( not ( = ?auto_239149 ?auto_239155 ) ) ( not ( = ?auto_239149 ?auto_239156 ) ) ( not ( = ?auto_239149 ?auto_239157 ) ) ( not ( = ?auto_239149 ?auto_239158 ) ) ( not ( = ?auto_239150 ?auto_239151 ) ) ( not ( = ?auto_239150 ?auto_239152 ) ) ( not ( = ?auto_239150 ?auto_239153 ) ) ( not ( = ?auto_239150 ?auto_239154 ) ) ( not ( = ?auto_239150 ?auto_239155 ) ) ( not ( = ?auto_239150 ?auto_239156 ) ) ( not ( = ?auto_239150 ?auto_239157 ) ) ( not ( = ?auto_239150 ?auto_239158 ) ) ( not ( = ?auto_239151 ?auto_239152 ) ) ( not ( = ?auto_239151 ?auto_239153 ) ) ( not ( = ?auto_239151 ?auto_239154 ) ) ( not ( = ?auto_239151 ?auto_239155 ) ) ( not ( = ?auto_239151 ?auto_239156 ) ) ( not ( = ?auto_239151 ?auto_239157 ) ) ( not ( = ?auto_239151 ?auto_239158 ) ) ( not ( = ?auto_239152 ?auto_239153 ) ) ( not ( = ?auto_239152 ?auto_239154 ) ) ( not ( = ?auto_239152 ?auto_239155 ) ) ( not ( = ?auto_239152 ?auto_239156 ) ) ( not ( = ?auto_239152 ?auto_239157 ) ) ( not ( = ?auto_239152 ?auto_239158 ) ) ( not ( = ?auto_239153 ?auto_239154 ) ) ( not ( = ?auto_239153 ?auto_239155 ) ) ( not ( = ?auto_239153 ?auto_239156 ) ) ( not ( = ?auto_239153 ?auto_239157 ) ) ( not ( = ?auto_239153 ?auto_239158 ) ) ( not ( = ?auto_239154 ?auto_239155 ) ) ( not ( = ?auto_239154 ?auto_239156 ) ) ( not ( = ?auto_239154 ?auto_239157 ) ) ( not ( = ?auto_239154 ?auto_239158 ) ) ( not ( = ?auto_239155 ?auto_239156 ) ) ( not ( = ?auto_239155 ?auto_239157 ) ) ( not ( = ?auto_239155 ?auto_239158 ) ) ( not ( = ?auto_239156 ?auto_239157 ) ) ( not ( = ?auto_239156 ?auto_239158 ) ) ( not ( = ?auto_239157 ?auto_239158 ) ) ( ON ?auto_239156 ?auto_239157 ) ( ON ?auto_239155 ?auto_239156 ) ( ON ?auto_239154 ?auto_239155 ) ( ON ?auto_239153 ?auto_239154 ) ( CLEAR ?auto_239151 ) ( ON ?auto_239152 ?auto_239153 ) ( CLEAR ?auto_239152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_239146 ?auto_239147 ?auto_239148 ?auto_239149 ?auto_239150 ?auto_239151 ?auto_239152 )
      ( MAKE-12PILE ?auto_239146 ?auto_239147 ?auto_239148 ?auto_239149 ?auto_239150 ?auto_239151 ?auto_239152 ?auto_239153 ?auto_239154 ?auto_239155 ?auto_239156 ?auto_239157 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239171 - BLOCK
      ?auto_239172 - BLOCK
      ?auto_239173 - BLOCK
      ?auto_239174 - BLOCK
      ?auto_239175 - BLOCK
      ?auto_239176 - BLOCK
      ?auto_239177 - BLOCK
      ?auto_239178 - BLOCK
      ?auto_239179 - BLOCK
      ?auto_239180 - BLOCK
      ?auto_239181 - BLOCK
      ?auto_239182 - BLOCK
    )
    :vars
    (
      ?auto_239183 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239182 ?auto_239183 ) ( ON-TABLE ?auto_239171 ) ( ON ?auto_239172 ?auto_239171 ) ( ON ?auto_239173 ?auto_239172 ) ( ON ?auto_239174 ?auto_239173 ) ( ON ?auto_239175 ?auto_239174 ) ( ON ?auto_239176 ?auto_239175 ) ( not ( = ?auto_239171 ?auto_239172 ) ) ( not ( = ?auto_239171 ?auto_239173 ) ) ( not ( = ?auto_239171 ?auto_239174 ) ) ( not ( = ?auto_239171 ?auto_239175 ) ) ( not ( = ?auto_239171 ?auto_239176 ) ) ( not ( = ?auto_239171 ?auto_239177 ) ) ( not ( = ?auto_239171 ?auto_239178 ) ) ( not ( = ?auto_239171 ?auto_239179 ) ) ( not ( = ?auto_239171 ?auto_239180 ) ) ( not ( = ?auto_239171 ?auto_239181 ) ) ( not ( = ?auto_239171 ?auto_239182 ) ) ( not ( = ?auto_239171 ?auto_239183 ) ) ( not ( = ?auto_239172 ?auto_239173 ) ) ( not ( = ?auto_239172 ?auto_239174 ) ) ( not ( = ?auto_239172 ?auto_239175 ) ) ( not ( = ?auto_239172 ?auto_239176 ) ) ( not ( = ?auto_239172 ?auto_239177 ) ) ( not ( = ?auto_239172 ?auto_239178 ) ) ( not ( = ?auto_239172 ?auto_239179 ) ) ( not ( = ?auto_239172 ?auto_239180 ) ) ( not ( = ?auto_239172 ?auto_239181 ) ) ( not ( = ?auto_239172 ?auto_239182 ) ) ( not ( = ?auto_239172 ?auto_239183 ) ) ( not ( = ?auto_239173 ?auto_239174 ) ) ( not ( = ?auto_239173 ?auto_239175 ) ) ( not ( = ?auto_239173 ?auto_239176 ) ) ( not ( = ?auto_239173 ?auto_239177 ) ) ( not ( = ?auto_239173 ?auto_239178 ) ) ( not ( = ?auto_239173 ?auto_239179 ) ) ( not ( = ?auto_239173 ?auto_239180 ) ) ( not ( = ?auto_239173 ?auto_239181 ) ) ( not ( = ?auto_239173 ?auto_239182 ) ) ( not ( = ?auto_239173 ?auto_239183 ) ) ( not ( = ?auto_239174 ?auto_239175 ) ) ( not ( = ?auto_239174 ?auto_239176 ) ) ( not ( = ?auto_239174 ?auto_239177 ) ) ( not ( = ?auto_239174 ?auto_239178 ) ) ( not ( = ?auto_239174 ?auto_239179 ) ) ( not ( = ?auto_239174 ?auto_239180 ) ) ( not ( = ?auto_239174 ?auto_239181 ) ) ( not ( = ?auto_239174 ?auto_239182 ) ) ( not ( = ?auto_239174 ?auto_239183 ) ) ( not ( = ?auto_239175 ?auto_239176 ) ) ( not ( = ?auto_239175 ?auto_239177 ) ) ( not ( = ?auto_239175 ?auto_239178 ) ) ( not ( = ?auto_239175 ?auto_239179 ) ) ( not ( = ?auto_239175 ?auto_239180 ) ) ( not ( = ?auto_239175 ?auto_239181 ) ) ( not ( = ?auto_239175 ?auto_239182 ) ) ( not ( = ?auto_239175 ?auto_239183 ) ) ( not ( = ?auto_239176 ?auto_239177 ) ) ( not ( = ?auto_239176 ?auto_239178 ) ) ( not ( = ?auto_239176 ?auto_239179 ) ) ( not ( = ?auto_239176 ?auto_239180 ) ) ( not ( = ?auto_239176 ?auto_239181 ) ) ( not ( = ?auto_239176 ?auto_239182 ) ) ( not ( = ?auto_239176 ?auto_239183 ) ) ( not ( = ?auto_239177 ?auto_239178 ) ) ( not ( = ?auto_239177 ?auto_239179 ) ) ( not ( = ?auto_239177 ?auto_239180 ) ) ( not ( = ?auto_239177 ?auto_239181 ) ) ( not ( = ?auto_239177 ?auto_239182 ) ) ( not ( = ?auto_239177 ?auto_239183 ) ) ( not ( = ?auto_239178 ?auto_239179 ) ) ( not ( = ?auto_239178 ?auto_239180 ) ) ( not ( = ?auto_239178 ?auto_239181 ) ) ( not ( = ?auto_239178 ?auto_239182 ) ) ( not ( = ?auto_239178 ?auto_239183 ) ) ( not ( = ?auto_239179 ?auto_239180 ) ) ( not ( = ?auto_239179 ?auto_239181 ) ) ( not ( = ?auto_239179 ?auto_239182 ) ) ( not ( = ?auto_239179 ?auto_239183 ) ) ( not ( = ?auto_239180 ?auto_239181 ) ) ( not ( = ?auto_239180 ?auto_239182 ) ) ( not ( = ?auto_239180 ?auto_239183 ) ) ( not ( = ?auto_239181 ?auto_239182 ) ) ( not ( = ?auto_239181 ?auto_239183 ) ) ( not ( = ?auto_239182 ?auto_239183 ) ) ( ON ?auto_239181 ?auto_239182 ) ( ON ?auto_239180 ?auto_239181 ) ( ON ?auto_239179 ?auto_239180 ) ( ON ?auto_239178 ?auto_239179 ) ( CLEAR ?auto_239176 ) ( ON ?auto_239177 ?auto_239178 ) ( CLEAR ?auto_239177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_239171 ?auto_239172 ?auto_239173 ?auto_239174 ?auto_239175 ?auto_239176 ?auto_239177 )
      ( MAKE-12PILE ?auto_239171 ?auto_239172 ?auto_239173 ?auto_239174 ?auto_239175 ?auto_239176 ?auto_239177 ?auto_239178 ?auto_239179 ?auto_239180 ?auto_239181 ?auto_239182 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239196 - BLOCK
      ?auto_239197 - BLOCK
      ?auto_239198 - BLOCK
      ?auto_239199 - BLOCK
      ?auto_239200 - BLOCK
      ?auto_239201 - BLOCK
      ?auto_239202 - BLOCK
      ?auto_239203 - BLOCK
      ?auto_239204 - BLOCK
      ?auto_239205 - BLOCK
      ?auto_239206 - BLOCK
      ?auto_239207 - BLOCK
    )
    :vars
    (
      ?auto_239208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239207 ?auto_239208 ) ( ON-TABLE ?auto_239196 ) ( ON ?auto_239197 ?auto_239196 ) ( ON ?auto_239198 ?auto_239197 ) ( ON ?auto_239199 ?auto_239198 ) ( ON ?auto_239200 ?auto_239199 ) ( not ( = ?auto_239196 ?auto_239197 ) ) ( not ( = ?auto_239196 ?auto_239198 ) ) ( not ( = ?auto_239196 ?auto_239199 ) ) ( not ( = ?auto_239196 ?auto_239200 ) ) ( not ( = ?auto_239196 ?auto_239201 ) ) ( not ( = ?auto_239196 ?auto_239202 ) ) ( not ( = ?auto_239196 ?auto_239203 ) ) ( not ( = ?auto_239196 ?auto_239204 ) ) ( not ( = ?auto_239196 ?auto_239205 ) ) ( not ( = ?auto_239196 ?auto_239206 ) ) ( not ( = ?auto_239196 ?auto_239207 ) ) ( not ( = ?auto_239196 ?auto_239208 ) ) ( not ( = ?auto_239197 ?auto_239198 ) ) ( not ( = ?auto_239197 ?auto_239199 ) ) ( not ( = ?auto_239197 ?auto_239200 ) ) ( not ( = ?auto_239197 ?auto_239201 ) ) ( not ( = ?auto_239197 ?auto_239202 ) ) ( not ( = ?auto_239197 ?auto_239203 ) ) ( not ( = ?auto_239197 ?auto_239204 ) ) ( not ( = ?auto_239197 ?auto_239205 ) ) ( not ( = ?auto_239197 ?auto_239206 ) ) ( not ( = ?auto_239197 ?auto_239207 ) ) ( not ( = ?auto_239197 ?auto_239208 ) ) ( not ( = ?auto_239198 ?auto_239199 ) ) ( not ( = ?auto_239198 ?auto_239200 ) ) ( not ( = ?auto_239198 ?auto_239201 ) ) ( not ( = ?auto_239198 ?auto_239202 ) ) ( not ( = ?auto_239198 ?auto_239203 ) ) ( not ( = ?auto_239198 ?auto_239204 ) ) ( not ( = ?auto_239198 ?auto_239205 ) ) ( not ( = ?auto_239198 ?auto_239206 ) ) ( not ( = ?auto_239198 ?auto_239207 ) ) ( not ( = ?auto_239198 ?auto_239208 ) ) ( not ( = ?auto_239199 ?auto_239200 ) ) ( not ( = ?auto_239199 ?auto_239201 ) ) ( not ( = ?auto_239199 ?auto_239202 ) ) ( not ( = ?auto_239199 ?auto_239203 ) ) ( not ( = ?auto_239199 ?auto_239204 ) ) ( not ( = ?auto_239199 ?auto_239205 ) ) ( not ( = ?auto_239199 ?auto_239206 ) ) ( not ( = ?auto_239199 ?auto_239207 ) ) ( not ( = ?auto_239199 ?auto_239208 ) ) ( not ( = ?auto_239200 ?auto_239201 ) ) ( not ( = ?auto_239200 ?auto_239202 ) ) ( not ( = ?auto_239200 ?auto_239203 ) ) ( not ( = ?auto_239200 ?auto_239204 ) ) ( not ( = ?auto_239200 ?auto_239205 ) ) ( not ( = ?auto_239200 ?auto_239206 ) ) ( not ( = ?auto_239200 ?auto_239207 ) ) ( not ( = ?auto_239200 ?auto_239208 ) ) ( not ( = ?auto_239201 ?auto_239202 ) ) ( not ( = ?auto_239201 ?auto_239203 ) ) ( not ( = ?auto_239201 ?auto_239204 ) ) ( not ( = ?auto_239201 ?auto_239205 ) ) ( not ( = ?auto_239201 ?auto_239206 ) ) ( not ( = ?auto_239201 ?auto_239207 ) ) ( not ( = ?auto_239201 ?auto_239208 ) ) ( not ( = ?auto_239202 ?auto_239203 ) ) ( not ( = ?auto_239202 ?auto_239204 ) ) ( not ( = ?auto_239202 ?auto_239205 ) ) ( not ( = ?auto_239202 ?auto_239206 ) ) ( not ( = ?auto_239202 ?auto_239207 ) ) ( not ( = ?auto_239202 ?auto_239208 ) ) ( not ( = ?auto_239203 ?auto_239204 ) ) ( not ( = ?auto_239203 ?auto_239205 ) ) ( not ( = ?auto_239203 ?auto_239206 ) ) ( not ( = ?auto_239203 ?auto_239207 ) ) ( not ( = ?auto_239203 ?auto_239208 ) ) ( not ( = ?auto_239204 ?auto_239205 ) ) ( not ( = ?auto_239204 ?auto_239206 ) ) ( not ( = ?auto_239204 ?auto_239207 ) ) ( not ( = ?auto_239204 ?auto_239208 ) ) ( not ( = ?auto_239205 ?auto_239206 ) ) ( not ( = ?auto_239205 ?auto_239207 ) ) ( not ( = ?auto_239205 ?auto_239208 ) ) ( not ( = ?auto_239206 ?auto_239207 ) ) ( not ( = ?auto_239206 ?auto_239208 ) ) ( not ( = ?auto_239207 ?auto_239208 ) ) ( ON ?auto_239206 ?auto_239207 ) ( ON ?auto_239205 ?auto_239206 ) ( ON ?auto_239204 ?auto_239205 ) ( ON ?auto_239203 ?auto_239204 ) ( ON ?auto_239202 ?auto_239203 ) ( CLEAR ?auto_239200 ) ( ON ?auto_239201 ?auto_239202 ) ( CLEAR ?auto_239201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_239196 ?auto_239197 ?auto_239198 ?auto_239199 ?auto_239200 ?auto_239201 )
      ( MAKE-12PILE ?auto_239196 ?auto_239197 ?auto_239198 ?auto_239199 ?auto_239200 ?auto_239201 ?auto_239202 ?auto_239203 ?auto_239204 ?auto_239205 ?auto_239206 ?auto_239207 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239221 - BLOCK
      ?auto_239222 - BLOCK
      ?auto_239223 - BLOCK
      ?auto_239224 - BLOCK
      ?auto_239225 - BLOCK
      ?auto_239226 - BLOCK
      ?auto_239227 - BLOCK
      ?auto_239228 - BLOCK
      ?auto_239229 - BLOCK
      ?auto_239230 - BLOCK
      ?auto_239231 - BLOCK
      ?auto_239232 - BLOCK
    )
    :vars
    (
      ?auto_239233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239232 ?auto_239233 ) ( ON-TABLE ?auto_239221 ) ( ON ?auto_239222 ?auto_239221 ) ( ON ?auto_239223 ?auto_239222 ) ( ON ?auto_239224 ?auto_239223 ) ( ON ?auto_239225 ?auto_239224 ) ( not ( = ?auto_239221 ?auto_239222 ) ) ( not ( = ?auto_239221 ?auto_239223 ) ) ( not ( = ?auto_239221 ?auto_239224 ) ) ( not ( = ?auto_239221 ?auto_239225 ) ) ( not ( = ?auto_239221 ?auto_239226 ) ) ( not ( = ?auto_239221 ?auto_239227 ) ) ( not ( = ?auto_239221 ?auto_239228 ) ) ( not ( = ?auto_239221 ?auto_239229 ) ) ( not ( = ?auto_239221 ?auto_239230 ) ) ( not ( = ?auto_239221 ?auto_239231 ) ) ( not ( = ?auto_239221 ?auto_239232 ) ) ( not ( = ?auto_239221 ?auto_239233 ) ) ( not ( = ?auto_239222 ?auto_239223 ) ) ( not ( = ?auto_239222 ?auto_239224 ) ) ( not ( = ?auto_239222 ?auto_239225 ) ) ( not ( = ?auto_239222 ?auto_239226 ) ) ( not ( = ?auto_239222 ?auto_239227 ) ) ( not ( = ?auto_239222 ?auto_239228 ) ) ( not ( = ?auto_239222 ?auto_239229 ) ) ( not ( = ?auto_239222 ?auto_239230 ) ) ( not ( = ?auto_239222 ?auto_239231 ) ) ( not ( = ?auto_239222 ?auto_239232 ) ) ( not ( = ?auto_239222 ?auto_239233 ) ) ( not ( = ?auto_239223 ?auto_239224 ) ) ( not ( = ?auto_239223 ?auto_239225 ) ) ( not ( = ?auto_239223 ?auto_239226 ) ) ( not ( = ?auto_239223 ?auto_239227 ) ) ( not ( = ?auto_239223 ?auto_239228 ) ) ( not ( = ?auto_239223 ?auto_239229 ) ) ( not ( = ?auto_239223 ?auto_239230 ) ) ( not ( = ?auto_239223 ?auto_239231 ) ) ( not ( = ?auto_239223 ?auto_239232 ) ) ( not ( = ?auto_239223 ?auto_239233 ) ) ( not ( = ?auto_239224 ?auto_239225 ) ) ( not ( = ?auto_239224 ?auto_239226 ) ) ( not ( = ?auto_239224 ?auto_239227 ) ) ( not ( = ?auto_239224 ?auto_239228 ) ) ( not ( = ?auto_239224 ?auto_239229 ) ) ( not ( = ?auto_239224 ?auto_239230 ) ) ( not ( = ?auto_239224 ?auto_239231 ) ) ( not ( = ?auto_239224 ?auto_239232 ) ) ( not ( = ?auto_239224 ?auto_239233 ) ) ( not ( = ?auto_239225 ?auto_239226 ) ) ( not ( = ?auto_239225 ?auto_239227 ) ) ( not ( = ?auto_239225 ?auto_239228 ) ) ( not ( = ?auto_239225 ?auto_239229 ) ) ( not ( = ?auto_239225 ?auto_239230 ) ) ( not ( = ?auto_239225 ?auto_239231 ) ) ( not ( = ?auto_239225 ?auto_239232 ) ) ( not ( = ?auto_239225 ?auto_239233 ) ) ( not ( = ?auto_239226 ?auto_239227 ) ) ( not ( = ?auto_239226 ?auto_239228 ) ) ( not ( = ?auto_239226 ?auto_239229 ) ) ( not ( = ?auto_239226 ?auto_239230 ) ) ( not ( = ?auto_239226 ?auto_239231 ) ) ( not ( = ?auto_239226 ?auto_239232 ) ) ( not ( = ?auto_239226 ?auto_239233 ) ) ( not ( = ?auto_239227 ?auto_239228 ) ) ( not ( = ?auto_239227 ?auto_239229 ) ) ( not ( = ?auto_239227 ?auto_239230 ) ) ( not ( = ?auto_239227 ?auto_239231 ) ) ( not ( = ?auto_239227 ?auto_239232 ) ) ( not ( = ?auto_239227 ?auto_239233 ) ) ( not ( = ?auto_239228 ?auto_239229 ) ) ( not ( = ?auto_239228 ?auto_239230 ) ) ( not ( = ?auto_239228 ?auto_239231 ) ) ( not ( = ?auto_239228 ?auto_239232 ) ) ( not ( = ?auto_239228 ?auto_239233 ) ) ( not ( = ?auto_239229 ?auto_239230 ) ) ( not ( = ?auto_239229 ?auto_239231 ) ) ( not ( = ?auto_239229 ?auto_239232 ) ) ( not ( = ?auto_239229 ?auto_239233 ) ) ( not ( = ?auto_239230 ?auto_239231 ) ) ( not ( = ?auto_239230 ?auto_239232 ) ) ( not ( = ?auto_239230 ?auto_239233 ) ) ( not ( = ?auto_239231 ?auto_239232 ) ) ( not ( = ?auto_239231 ?auto_239233 ) ) ( not ( = ?auto_239232 ?auto_239233 ) ) ( ON ?auto_239231 ?auto_239232 ) ( ON ?auto_239230 ?auto_239231 ) ( ON ?auto_239229 ?auto_239230 ) ( ON ?auto_239228 ?auto_239229 ) ( ON ?auto_239227 ?auto_239228 ) ( CLEAR ?auto_239225 ) ( ON ?auto_239226 ?auto_239227 ) ( CLEAR ?auto_239226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_239221 ?auto_239222 ?auto_239223 ?auto_239224 ?auto_239225 ?auto_239226 )
      ( MAKE-12PILE ?auto_239221 ?auto_239222 ?auto_239223 ?auto_239224 ?auto_239225 ?auto_239226 ?auto_239227 ?auto_239228 ?auto_239229 ?auto_239230 ?auto_239231 ?auto_239232 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239246 - BLOCK
      ?auto_239247 - BLOCK
      ?auto_239248 - BLOCK
      ?auto_239249 - BLOCK
      ?auto_239250 - BLOCK
      ?auto_239251 - BLOCK
      ?auto_239252 - BLOCK
      ?auto_239253 - BLOCK
      ?auto_239254 - BLOCK
      ?auto_239255 - BLOCK
      ?auto_239256 - BLOCK
      ?auto_239257 - BLOCK
    )
    :vars
    (
      ?auto_239258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239257 ?auto_239258 ) ( ON-TABLE ?auto_239246 ) ( ON ?auto_239247 ?auto_239246 ) ( ON ?auto_239248 ?auto_239247 ) ( ON ?auto_239249 ?auto_239248 ) ( not ( = ?auto_239246 ?auto_239247 ) ) ( not ( = ?auto_239246 ?auto_239248 ) ) ( not ( = ?auto_239246 ?auto_239249 ) ) ( not ( = ?auto_239246 ?auto_239250 ) ) ( not ( = ?auto_239246 ?auto_239251 ) ) ( not ( = ?auto_239246 ?auto_239252 ) ) ( not ( = ?auto_239246 ?auto_239253 ) ) ( not ( = ?auto_239246 ?auto_239254 ) ) ( not ( = ?auto_239246 ?auto_239255 ) ) ( not ( = ?auto_239246 ?auto_239256 ) ) ( not ( = ?auto_239246 ?auto_239257 ) ) ( not ( = ?auto_239246 ?auto_239258 ) ) ( not ( = ?auto_239247 ?auto_239248 ) ) ( not ( = ?auto_239247 ?auto_239249 ) ) ( not ( = ?auto_239247 ?auto_239250 ) ) ( not ( = ?auto_239247 ?auto_239251 ) ) ( not ( = ?auto_239247 ?auto_239252 ) ) ( not ( = ?auto_239247 ?auto_239253 ) ) ( not ( = ?auto_239247 ?auto_239254 ) ) ( not ( = ?auto_239247 ?auto_239255 ) ) ( not ( = ?auto_239247 ?auto_239256 ) ) ( not ( = ?auto_239247 ?auto_239257 ) ) ( not ( = ?auto_239247 ?auto_239258 ) ) ( not ( = ?auto_239248 ?auto_239249 ) ) ( not ( = ?auto_239248 ?auto_239250 ) ) ( not ( = ?auto_239248 ?auto_239251 ) ) ( not ( = ?auto_239248 ?auto_239252 ) ) ( not ( = ?auto_239248 ?auto_239253 ) ) ( not ( = ?auto_239248 ?auto_239254 ) ) ( not ( = ?auto_239248 ?auto_239255 ) ) ( not ( = ?auto_239248 ?auto_239256 ) ) ( not ( = ?auto_239248 ?auto_239257 ) ) ( not ( = ?auto_239248 ?auto_239258 ) ) ( not ( = ?auto_239249 ?auto_239250 ) ) ( not ( = ?auto_239249 ?auto_239251 ) ) ( not ( = ?auto_239249 ?auto_239252 ) ) ( not ( = ?auto_239249 ?auto_239253 ) ) ( not ( = ?auto_239249 ?auto_239254 ) ) ( not ( = ?auto_239249 ?auto_239255 ) ) ( not ( = ?auto_239249 ?auto_239256 ) ) ( not ( = ?auto_239249 ?auto_239257 ) ) ( not ( = ?auto_239249 ?auto_239258 ) ) ( not ( = ?auto_239250 ?auto_239251 ) ) ( not ( = ?auto_239250 ?auto_239252 ) ) ( not ( = ?auto_239250 ?auto_239253 ) ) ( not ( = ?auto_239250 ?auto_239254 ) ) ( not ( = ?auto_239250 ?auto_239255 ) ) ( not ( = ?auto_239250 ?auto_239256 ) ) ( not ( = ?auto_239250 ?auto_239257 ) ) ( not ( = ?auto_239250 ?auto_239258 ) ) ( not ( = ?auto_239251 ?auto_239252 ) ) ( not ( = ?auto_239251 ?auto_239253 ) ) ( not ( = ?auto_239251 ?auto_239254 ) ) ( not ( = ?auto_239251 ?auto_239255 ) ) ( not ( = ?auto_239251 ?auto_239256 ) ) ( not ( = ?auto_239251 ?auto_239257 ) ) ( not ( = ?auto_239251 ?auto_239258 ) ) ( not ( = ?auto_239252 ?auto_239253 ) ) ( not ( = ?auto_239252 ?auto_239254 ) ) ( not ( = ?auto_239252 ?auto_239255 ) ) ( not ( = ?auto_239252 ?auto_239256 ) ) ( not ( = ?auto_239252 ?auto_239257 ) ) ( not ( = ?auto_239252 ?auto_239258 ) ) ( not ( = ?auto_239253 ?auto_239254 ) ) ( not ( = ?auto_239253 ?auto_239255 ) ) ( not ( = ?auto_239253 ?auto_239256 ) ) ( not ( = ?auto_239253 ?auto_239257 ) ) ( not ( = ?auto_239253 ?auto_239258 ) ) ( not ( = ?auto_239254 ?auto_239255 ) ) ( not ( = ?auto_239254 ?auto_239256 ) ) ( not ( = ?auto_239254 ?auto_239257 ) ) ( not ( = ?auto_239254 ?auto_239258 ) ) ( not ( = ?auto_239255 ?auto_239256 ) ) ( not ( = ?auto_239255 ?auto_239257 ) ) ( not ( = ?auto_239255 ?auto_239258 ) ) ( not ( = ?auto_239256 ?auto_239257 ) ) ( not ( = ?auto_239256 ?auto_239258 ) ) ( not ( = ?auto_239257 ?auto_239258 ) ) ( ON ?auto_239256 ?auto_239257 ) ( ON ?auto_239255 ?auto_239256 ) ( ON ?auto_239254 ?auto_239255 ) ( ON ?auto_239253 ?auto_239254 ) ( ON ?auto_239252 ?auto_239253 ) ( ON ?auto_239251 ?auto_239252 ) ( CLEAR ?auto_239249 ) ( ON ?auto_239250 ?auto_239251 ) ( CLEAR ?auto_239250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_239246 ?auto_239247 ?auto_239248 ?auto_239249 ?auto_239250 )
      ( MAKE-12PILE ?auto_239246 ?auto_239247 ?auto_239248 ?auto_239249 ?auto_239250 ?auto_239251 ?auto_239252 ?auto_239253 ?auto_239254 ?auto_239255 ?auto_239256 ?auto_239257 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239271 - BLOCK
      ?auto_239272 - BLOCK
      ?auto_239273 - BLOCK
      ?auto_239274 - BLOCK
      ?auto_239275 - BLOCK
      ?auto_239276 - BLOCK
      ?auto_239277 - BLOCK
      ?auto_239278 - BLOCK
      ?auto_239279 - BLOCK
      ?auto_239280 - BLOCK
      ?auto_239281 - BLOCK
      ?auto_239282 - BLOCK
    )
    :vars
    (
      ?auto_239283 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239282 ?auto_239283 ) ( ON-TABLE ?auto_239271 ) ( ON ?auto_239272 ?auto_239271 ) ( ON ?auto_239273 ?auto_239272 ) ( ON ?auto_239274 ?auto_239273 ) ( not ( = ?auto_239271 ?auto_239272 ) ) ( not ( = ?auto_239271 ?auto_239273 ) ) ( not ( = ?auto_239271 ?auto_239274 ) ) ( not ( = ?auto_239271 ?auto_239275 ) ) ( not ( = ?auto_239271 ?auto_239276 ) ) ( not ( = ?auto_239271 ?auto_239277 ) ) ( not ( = ?auto_239271 ?auto_239278 ) ) ( not ( = ?auto_239271 ?auto_239279 ) ) ( not ( = ?auto_239271 ?auto_239280 ) ) ( not ( = ?auto_239271 ?auto_239281 ) ) ( not ( = ?auto_239271 ?auto_239282 ) ) ( not ( = ?auto_239271 ?auto_239283 ) ) ( not ( = ?auto_239272 ?auto_239273 ) ) ( not ( = ?auto_239272 ?auto_239274 ) ) ( not ( = ?auto_239272 ?auto_239275 ) ) ( not ( = ?auto_239272 ?auto_239276 ) ) ( not ( = ?auto_239272 ?auto_239277 ) ) ( not ( = ?auto_239272 ?auto_239278 ) ) ( not ( = ?auto_239272 ?auto_239279 ) ) ( not ( = ?auto_239272 ?auto_239280 ) ) ( not ( = ?auto_239272 ?auto_239281 ) ) ( not ( = ?auto_239272 ?auto_239282 ) ) ( not ( = ?auto_239272 ?auto_239283 ) ) ( not ( = ?auto_239273 ?auto_239274 ) ) ( not ( = ?auto_239273 ?auto_239275 ) ) ( not ( = ?auto_239273 ?auto_239276 ) ) ( not ( = ?auto_239273 ?auto_239277 ) ) ( not ( = ?auto_239273 ?auto_239278 ) ) ( not ( = ?auto_239273 ?auto_239279 ) ) ( not ( = ?auto_239273 ?auto_239280 ) ) ( not ( = ?auto_239273 ?auto_239281 ) ) ( not ( = ?auto_239273 ?auto_239282 ) ) ( not ( = ?auto_239273 ?auto_239283 ) ) ( not ( = ?auto_239274 ?auto_239275 ) ) ( not ( = ?auto_239274 ?auto_239276 ) ) ( not ( = ?auto_239274 ?auto_239277 ) ) ( not ( = ?auto_239274 ?auto_239278 ) ) ( not ( = ?auto_239274 ?auto_239279 ) ) ( not ( = ?auto_239274 ?auto_239280 ) ) ( not ( = ?auto_239274 ?auto_239281 ) ) ( not ( = ?auto_239274 ?auto_239282 ) ) ( not ( = ?auto_239274 ?auto_239283 ) ) ( not ( = ?auto_239275 ?auto_239276 ) ) ( not ( = ?auto_239275 ?auto_239277 ) ) ( not ( = ?auto_239275 ?auto_239278 ) ) ( not ( = ?auto_239275 ?auto_239279 ) ) ( not ( = ?auto_239275 ?auto_239280 ) ) ( not ( = ?auto_239275 ?auto_239281 ) ) ( not ( = ?auto_239275 ?auto_239282 ) ) ( not ( = ?auto_239275 ?auto_239283 ) ) ( not ( = ?auto_239276 ?auto_239277 ) ) ( not ( = ?auto_239276 ?auto_239278 ) ) ( not ( = ?auto_239276 ?auto_239279 ) ) ( not ( = ?auto_239276 ?auto_239280 ) ) ( not ( = ?auto_239276 ?auto_239281 ) ) ( not ( = ?auto_239276 ?auto_239282 ) ) ( not ( = ?auto_239276 ?auto_239283 ) ) ( not ( = ?auto_239277 ?auto_239278 ) ) ( not ( = ?auto_239277 ?auto_239279 ) ) ( not ( = ?auto_239277 ?auto_239280 ) ) ( not ( = ?auto_239277 ?auto_239281 ) ) ( not ( = ?auto_239277 ?auto_239282 ) ) ( not ( = ?auto_239277 ?auto_239283 ) ) ( not ( = ?auto_239278 ?auto_239279 ) ) ( not ( = ?auto_239278 ?auto_239280 ) ) ( not ( = ?auto_239278 ?auto_239281 ) ) ( not ( = ?auto_239278 ?auto_239282 ) ) ( not ( = ?auto_239278 ?auto_239283 ) ) ( not ( = ?auto_239279 ?auto_239280 ) ) ( not ( = ?auto_239279 ?auto_239281 ) ) ( not ( = ?auto_239279 ?auto_239282 ) ) ( not ( = ?auto_239279 ?auto_239283 ) ) ( not ( = ?auto_239280 ?auto_239281 ) ) ( not ( = ?auto_239280 ?auto_239282 ) ) ( not ( = ?auto_239280 ?auto_239283 ) ) ( not ( = ?auto_239281 ?auto_239282 ) ) ( not ( = ?auto_239281 ?auto_239283 ) ) ( not ( = ?auto_239282 ?auto_239283 ) ) ( ON ?auto_239281 ?auto_239282 ) ( ON ?auto_239280 ?auto_239281 ) ( ON ?auto_239279 ?auto_239280 ) ( ON ?auto_239278 ?auto_239279 ) ( ON ?auto_239277 ?auto_239278 ) ( ON ?auto_239276 ?auto_239277 ) ( CLEAR ?auto_239274 ) ( ON ?auto_239275 ?auto_239276 ) ( CLEAR ?auto_239275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_239271 ?auto_239272 ?auto_239273 ?auto_239274 ?auto_239275 )
      ( MAKE-12PILE ?auto_239271 ?auto_239272 ?auto_239273 ?auto_239274 ?auto_239275 ?auto_239276 ?auto_239277 ?auto_239278 ?auto_239279 ?auto_239280 ?auto_239281 ?auto_239282 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239296 - BLOCK
      ?auto_239297 - BLOCK
      ?auto_239298 - BLOCK
      ?auto_239299 - BLOCK
      ?auto_239300 - BLOCK
      ?auto_239301 - BLOCK
      ?auto_239302 - BLOCK
      ?auto_239303 - BLOCK
      ?auto_239304 - BLOCK
      ?auto_239305 - BLOCK
      ?auto_239306 - BLOCK
      ?auto_239307 - BLOCK
    )
    :vars
    (
      ?auto_239308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239307 ?auto_239308 ) ( ON-TABLE ?auto_239296 ) ( ON ?auto_239297 ?auto_239296 ) ( ON ?auto_239298 ?auto_239297 ) ( not ( = ?auto_239296 ?auto_239297 ) ) ( not ( = ?auto_239296 ?auto_239298 ) ) ( not ( = ?auto_239296 ?auto_239299 ) ) ( not ( = ?auto_239296 ?auto_239300 ) ) ( not ( = ?auto_239296 ?auto_239301 ) ) ( not ( = ?auto_239296 ?auto_239302 ) ) ( not ( = ?auto_239296 ?auto_239303 ) ) ( not ( = ?auto_239296 ?auto_239304 ) ) ( not ( = ?auto_239296 ?auto_239305 ) ) ( not ( = ?auto_239296 ?auto_239306 ) ) ( not ( = ?auto_239296 ?auto_239307 ) ) ( not ( = ?auto_239296 ?auto_239308 ) ) ( not ( = ?auto_239297 ?auto_239298 ) ) ( not ( = ?auto_239297 ?auto_239299 ) ) ( not ( = ?auto_239297 ?auto_239300 ) ) ( not ( = ?auto_239297 ?auto_239301 ) ) ( not ( = ?auto_239297 ?auto_239302 ) ) ( not ( = ?auto_239297 ?auto_239303 ) ) ( not ( = ?auto_239297 ?auto_239304 ) ) ( not ( = ?auto_239297 ?auto_239305 ) ) ( not ( = ?auto_239297 ?auto_239306 ) ) ( not ( = ?auto_239297 ?auto_239307 ) ) ( not ( = ?auto_239297 ?auto_239308 ) ) ( not ( = ?auto_239298 ?auto_239299 ) ) ( not ( = ?auto_239298 ?auto_239300 ) ) ( not ( = ?auto_239298 ?auto_239301 ) ) ( not ( = ?auto_239298 ?auto_239302 ) ) ( not ( = ?auto_239298 ?auto_239303 ) ) ( not ( = ?auto_239298 ?auto_239304 ) ) ( not ( = ?auto_239298 ?auto_239305 ) ) ( not ( = ?auto_239298 ?auto_239306 ) ) ( not ( = ?auto_239298 ?auto_239307 ) ) ( not ( = ?auto_239298 ?auto_239308 ) ) ( not ( = ?auto_239299 ?auto_239300 ) ) ( not ( = ?auto_239299 ?auto_239301 ) ) ( not ( = ?auto_239299 ?auto_239302 ) ) ( not ( = ?auto_239299 ?auto_239303 ) ) ( not ( = ?auto_239299 ?auto_239304 ) ) ( not ( = ?auto_239299 ?auto_239305 ) ) ( not ( = ?auto_239299 ?auto_239306 ) ) ( not ( = ?auto_239299 ?auto_239307 ) ) ( not ( = ?auto_239299 ?auto_239308 ) ) ( not ( = ?auto_239300 ?auto_239301 ) ) ( not ( = ?auto_239300 ?auto_239302 ) ) ( not ( = ?auto_239300 ?auto_239303 ) ) ( not ( = ?auto_239300 ?auto_239304 ) ) ( not ( = ?auto_239300 ?auto_239305 ) ) ( not ( = ?auto_239300 ?auto_239306 ) ) ( not ( = ?auto_239300 ?auto_239307 ) ) ( not ( = ?auto_239300 ?auto_239308 ) ) ( not ( = ?auto_239301 ?auto_239302 ) ) ( not ( = ?auto_239301 ?auto_239303 ) ) ( not ( = ?auto_239301 ?auto_239304 ) ) ( not ( = ?auto_239301 ?auto_239305 ) ) ( not ( = ?auto_239301 ?auto_239306 ) ) ( not ( = ?auto_239301 ?auto_239307 ) ) ( not ( = ?auto_239301 ?auto_239308 ) ) ( not ( = ?auto_239302 ?auto_239303 ) ) ( not ( = ?auto_239302 ?auto_239304 ) ) ( not ( = ?auto_239302 ?auto_239305 ) ) ( not ( = ?auto_239302 ?auto_239306 ) ) ( not ( = ?auto_239302 ?auto_239307 ) ) ( not ( = ?auto_239302 ?auto_239308 ) ) ( not ( = ?auto_239303 ?auto_239304 ) ) ( not ( = ?auto_239303 ?auto_239305 ) ) ( not ( = ?auto_239303 ?auto_239306 ) ) ( not ( = ?auto_239303 ?auto_239307 ) ) ( not ( = ?auto_239303 ?auto_239308 ) ) ( not ( = ?auto_239304 ?auto_239305 ) ) ( not ( = ?auto_239304 ?auto_239306 ) ) ( not ( = ?auto_239304 ?auto_239307 ) ) ( not ( = ?auto_239304 ?auto_239308 ) ) ( not ( = ?auto_239305 ?auto_239306 ) ) ( not ( = ?auto_239305 ?auto_239307 ) ) ( not ( = ?auto_239305 ?auto_239308 ) ) ( not ( = ?auto_239306 ?auto_239307 ) ) ( not ( = ?auto_239306 ?auto_239308 ) ) ( not ( = ?auto_239307 ?auto_239308 ) ) ( ON ?auto_239306 ?auto_239307 ) ( ON ?auto_239305 ?auto_239306 ) ( ON ?auto_239304 ?auto_239305 ) ( ON ?auto_239303 ?auto_239304 ) ( ON ?auto_239302 ?auto_239303 ) ( ON ?auto_239301 ?auto_239302 ) ( ON ?auto_239300 ?auto_239301 ) ( CLEAR ?auto_239298 ) ( ON ?auto_239299 ?auto_239300 ) ( CLEAR ?auto_239299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_239296 ?auto_239297 ?auto_239298 ?auto_239299 )
      ( MAKE-12PILE ?auto_239296 ?auto_239297 ?auto_239298 ?auto_239299 ?auto_239300 ?auto_239301 ?auto_239302 ?auto_239303 ?auto_239304 ?auto_239305 ?auto_239306 ?auto_239307 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239321 - BLOCK
      ?auto_239322 - BLOCK
      ?auto_239323 - BLOCK
      ?auto_239324 - BLOCK
      ?auto_239325 - BLOCK
      ?auto_239326 - BLOCK
      ?auto_239327 - BLOCK
      ?auto_239328 - BLOCK
      ?auto_239329 - BLOCK
      ?auto_239330 - BLOCK
      ?auto_239331 - BLOCK
      ?auto_239332 - BLOCK
    )
    :vars
    (
      ?auto_239333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239332 ?auto_239333 ) ( ON-TABLE ?auto_239321 ) ( ON ?auto_239322 ?auto_239321 ) ( ON ?auto_239323 ?auto_239322 ) ( not ( = ?auto_239321 ?auto_239322 ) ) ( not ( = ?auto_239321 ?auto_239323 ) ) ( not ( = ?auto_239321 ?auto_239324 ) ) ( not ( = ?auto_239321 ?auto_239325 ) ) ( not ( = ?auto_239321 ?auto_239326 ) ) ( not ( = ?auto_239321 ?auto_239327 ) ) ( not ( = ?auto_239321 ?auto_239328 ) ) ( not ( = ?auto_239321 ?auto_239329 ) ) ( not ( = ?auto_239321 ?auto_239330 ) ) ( not ( = ?auto_239321 ?auto_239331 ) ) ( not ( = ?auto_239321 ?auto_239332 ) ) ( not ( = ?auto_239321 ?auto_239333 ) ) ( not ( = ?auto_239322 ?auto_239323 ) ) ( not ( = ?auto_239322 ?auto_239324 ) ) ( not ( = ?auto_239322 ?auto_239325 ) ) ( not ( = ?auto_239322 ?auto_239326 ) ) ( not ( = ?auto_239322 ?auto_239327 ) ) ( not ( = ?auto_239322 ?auto_239328 ) ) ( not ( = ?auto_239322 ?auto_239329 ) ) ( not ( = ?auto_239322 ?auto_239330 ) ) ( not ( = ?auto_239322 ?auto_239331 ) ) ( not ( = ?auto_239322 ?auto_239332 ) ) ( not ( = ?auto_239322 ?auto_239333 ) ) ( not ( = ?auto_239323 ?auto_239324 ) ) ( not ( = ?auto_239323 ?auto_239325 ) ) ( not ( = ?auto_239323 ?auto_239326 ) ) ( not ( = ?auto_239323 ?auto_239327 ) ) ( not ( = ?auto_239323 ?auto_239328 ) ) ( not ( = ?auto_239323 ?auto_239329 ) ) ( not ( = ?auto_239323 ?auto_239330 ) ) ( not ( = ?auto_239323 ?auto_239331 ) ) ( not ( = ?auto_239323 ?auto_239332 ) ) ( not ( = ?auto_239323 ?auto_239333 ) ) ( not ( = ?auto_239324 ?auto_239325 ) ) ( not ( = ?auto_239324 ?auto_239326 ) ) ( not ( = ?auto_239324 ?auto_239327 ) ) ( not ( = ?auto_239324 ?auto_239328 ) ) ( not ( = ?auto_239324 ?auto_239329 ) ) ( not ( = ?auto_239324 ?auto_239330 ) ) ( not ( = ?auto_239324 ?auto_239331 ) ) ( not ( = ?auto_239324 ?auto_239332 ) ) ( not ( = ?auto_239324 ?auto_239333 ) ) ( not ( = ?auto_239325 ?auto_239326 ) ) ( not ( = ?auto_239325 ?auto_239327 ) ) ( not ( = ?auto_239325 ?auto_239328 ) ) ( not ( = ?auto_239325 ?auto_239329 ) ) ( not ( = ?auto_239325 ?auto_239330 ) ) ( not ( = ?auto_239325 ?auto_239331 ) ) ( not ( = ?auto_239325 ?auto_239332 ) ) ( not ( = ?auto_239325 ?auto_239333 ) ) ( not ( = ?auto_239326 ?auto_239327 ) ) ( not ( = ?auto_239326 ?auto_239328 ) ) ( not ( = ?auto_239326 ?auto_239329 ) ) ( not ( = ?auto_239326 ?auto_239330 ) ) ( not ( = ?auto_239326 ?auto_239331 ) ) ( not ( = ?auto_239326 ?auto_239332 ) ) ( not ( = ?auto_239326 ?auto_239333 ) ) ( not ( = ?auto_239327 ?auto_239328 ) ) ( not ( = ?auto_239327 ?auto_239329 ) ) ( not ( = ?auto_239327 ?auto_239330 ) ) ( not ( = ?auto_239327 ?auto_239331 ) ) ( not ( = ?auto_239327 ?auto_239332 ) ) ( not ( = ?auto_239327 ?auto_239333 ) ) ( not ( = ?auto_239328 ?auto_239329 ) ) ( not ( = ?auto_239328 ?auto_239330 ) ) ( not ( = ?auto_239328 ?auto_239331 ) ) ( not ( = ?auto_239328 ?auto_239332 ) ) ( not ( = ?auto_239328 ?auto_239333 ) ) ( not ( = ?auto_239329 ?auto_239330 ) ) ( not ( = ?auto_239329 ?auto_239331 ) ) ( not ( = ?auto_239329 ?auto_239332 ) ) ( not ( = ?auto_239329 ?auto_239333 ) ) ( not ( = ?auto_239330 ?auto_239331 ) ) ( not ( = ?auto_239330 ?auto_239332 ) ) ( not ( = ?auto_239330 ?auto_239333 ) ) ( not ( = ?auto_239331 ?auto_239332 ) ) ( not ( = ?auto_239331 ?auto_239333 ) ) ( not ( = ?auto_239332 ?auto_239333 ) ) ( ON ?auto_239331 ?auto_239332 ) ( ON ?auto_239330 ?auto_239331 ) ( ON ?auto_239329 ?auto_239330 ) ( ON ?auto_239328 ?auto_239329 ) ( ON ?auto_239327 ?auto_239328 ) ( ON ?auto_239326 ?auto_239327 ) ( ON ?auto_239325 ?auto_239326 ) ( CLEAR ?auto_239323 ) ( ON ?auto_239324 ?auto_239325 ) ( CLEAR ?auto_239324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_239321 ?auto_239322 ?auto_239323 ?auto_239324 )
      ( MAKE-12PILE ?auto_239321 ?auto_239322 ?auto_239323 ?auto_239324 ?auto_239325 ?auto_239326 ?auto_239327 ?auto_239328 ?auto_239329 ?auto_239330 ?auto_239331 ?auto_239332 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239346 - BLOCK
      ?auto_239347 - BLOCK
      ?auto_239348 - BLOCK
      ?auto_239349 - BLOCK
      ?auto_239350 - BLOCK
      ?auto_239351 - BLOCK
      ?auto_239352 - BLOCK
      ?auto_239353 - BLOCK
      ?auto_239354 - BLOCK
      ?auto_239355 - BLOCK
      ?auto_239356 - BLOCK
      ?auto_239357 - BLOCK
    )
    :vars
    (
      ?auto_239358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239357 ?auto_239358 ) ( ON-TABLE ?auto_239346 ) ( ON ?auto_239347 ?auto_239346 ) ( not ( = ?auto_239346 ?auto_239347 ) ) ( not ( = ?auto_239346 ?auto_239348 ) ) ( not ( = ?auto_239346 ?auto_239349 ) ) ( not ( = ?auto_239346 ?auto_239350 ) ) ( not ( = ?auto_239346 ?auto_239351 ) ) ( not ( = ?auto_239346 ?auto_239352 ) ) ( not ( = ?auto_239346 ?auto_239353 ) ) ( not ( = ?auto_239346 ?auto_239354 ) ) ( not ( = ?auto_239346 ?auto_239355 ) ) ( not ( = ?auto_239346 ?auto_239356 ) ) ( not ( = ?auto_239346 ?auto_239357 ) ) ( not ( = ?auto_239346 ?auto_239358 ) ) ( not ( = ?auto_239347 ?auto_239348 ) ) ( not ( = ?auto_239347 ?auto_239349 ) ) ( not ( = ?auto_239347 ?auto_239350 ) ) ( not ( = ?auto_239347 ?auto_239351 ) ) ( not ( = ?auto_239347 ?auto_239352 ) ) ( not ( = ?auto_239347 ?auto_239353 ) ) ( not ( = ?auto_239347 ?auto_239354 ) ) ( not ( = ?auto_239347 ?auto_239355 ) ) ( not ( = ?auto_239347 ?auto_239356 ) ) ( not ( = ?auto_239347 ?auto_239357 ) ) ( not ( = ?auto_239347 ?auto_239358 ) ) ( not ( = ?auto_239348 ?auto_239349 ) ) ( not ( = ?auto_239348 ?auto_239350 ) ) ( not ( = ?auto_239348 ?auto_239351 ) ) ( not ( = ?auto_239348 ?auto_239352 ) ) ( not ( = ?auto_239348 ?auto_239353 ) ) ( not ( = ?auto_239348 ?auto_239354 ) ) ( not ( = ?auto_239348 ?auto_239355 ) ) ( not ( = ?auto_239348 ?auto_239356 ) ) ( not ( = ?auto_239348 ?auto_239357 ) ) ( not ( = ?auto_239348 ?auto_239358 ) ) ( not ( = ?auto_239349 ?auto_239350 ) ) ( not ( = ?auto_239349 ?auto_239351 ) ) ( not ( = ?auto_239349 ?auto_239352 ) ) ( not ( = ?auto_239349 ?auto_239353 ) ) ( not ( = ?auto_239349 ?auto_239354 ) ) ( not ( = ?auto_239349 ?auto_239355 ) ) ( not ( = ?auto_239349 ?auto_239356 ) ) ( not ( = ?auto_239349 ?auto_239357 ) ) ( not ( = ?auto_239349 ?auto_239358 ) ) ( not ( = ?auto_239350 ?auto_239351 ) ) ( not ( = ?auto_239350 ?auto_239352 ) ) ( not ( = ?auto_239350 ?auto_239353 ) ) ( not ( = ?auto_239350 ?auto_239354 ) ) ( not ( = ?auto_239350 ?auto_239355 ) ) ( not ( = ?auto_239350 ?auto_239356 ) ) ( not ( = ?auto_239350 ?auto_239357 ) ) ( not ( = ?auto_239350 ?auto_239358 ) ) ( not ( = ?auto_239351 ?auto_239352 ) ) ( not ( = ?auto_239351 ?auto_239353 ) ) ( not ( = ?auto_239351 ?auto_239354 ) ) ( not ( = ?auto_239351 ?auto_239355 ) ) ( not ( = ?auto_239351 ?auto_239356 ) ) ( not ( = ?auto_239351 ?auto_239357 ) ) ( not ( = ?auto_239351 ?auto_239358 ) ) ( not ( = ?auto_239352 ?auto_239353 ) ) ( not ( = ?auto_239352 ?auto_239354 ) ) ( not ( = ?auto_239352 ?auto_239355 ) ) ( not ( = ?auto_239352 ?auto_239356 ) ) ( not ( = ?auto_239352 ?auto_239357 ) ) ( not ( = ?auto_239352 ?auto_239358 ) ) ( not ( = ?auto_239353 ?auto_239354 ) ) ( not ( = ?auto_239353 ?auto_239355 ) ) ( not ( = ?auto_239353 ?auto_239356 ) ) ( not ( = ?auto_239353 ?auto_239357 ) ) ( not ( = ?auto_239353 ?auto_239358 ) ) ( not ( = ?auto_239354 ?auto_239355 ) ) ( not ( = ?auto_239354 ?auto_239356 ) ) ( not ( = ?auto_239354 ?auto_239357 ) ) ( not ( = ?auto_239354 ?auto_239358 ) ) ( not ( = ?auto_239355 ?auto_239356 ) ) ( not ( = ?auto_239355 ?auto_239357 ) ) ( not ( = ?auto_239355 ?auto_239358 ) ) ( not ( = ?auto_239356 ?auto_239357 ) ) ( not ( = ?auto_239356 ?auto_239358 ) ) ( not ( = ?auto_239357 ?auto_239358 ) ) ( ON ?auto_239356 ?auto_239357 ) ( ON ?auto_239355 ?auto_239356 ) ( ON ?auto_239354 ?auto_239355 ) ( ON ?auto_239353 ?auto_239354 ) ( ON ?auto_239352 ?auto_239353 ) ( ON ?auto_239351 ?auto_239352 ) ( ON ?auto_239350 ?auto_239351 ) ( ON ?auto_239349 ?auto_239350 ) ( CLEAR ?auto_239347 ) ( ON ?auto_239348 ?auto_239349 ) ( CLEAR ?auto_239348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_239346 ?auto_239347 ?auto_239348 )
      ( MAKE-12PILE ?auto_239346 ?auto_239347 ?auto_239348 ?auto_239349 ?auto_239350 ?auto_239351 ?auto_239352 ?auto_239353 ?auto_239354 ?auto_239355 ?auto_239356 ?auto_239357 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239371 - BLOCK
      ?auto_239372 - BLOCK
      ?auto_239373 - BLOCK
      ?auto_239374 - BLOCK
      ?auto_239375 - BLOCK
      ?auto_239376 - BLOCK
      ?auto_239377 - BLOCK
      ?auto_239378 - BLOCK
      ?auto_239379 - BLOCK
      ?auto_239380 - BLOCK
      ?auto_239381 - BLOCK
      ?auto_239382 - BLOCK
    )
    :vars
    (
      ?auto_239383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239382 ?auto_239383 ) ( ON-TABLE ?auto_239371 ) ( ON ?auto_239372 ?auto_239371 ) ( not ( = ?auto_239371 ?auto_239372 ) ) ( not ( = ?auto_239371 ?auto_239373 ) ) ( not ( = ?auto_239371 ?auto_239374 ) ) ( not ( = ?auto_239371 ?auto_239375 ) ) ( not ( = ?auto_239371 ?auto_239376 ) ) ( not ( = ?auto_239371 ?auto_239377 ) ) ( not ( = ?auto_239371 ?auto_239378 ) ) ( not ( = ?auto_239371 ?auto_239379 ) ) ( not ( = ?auto_239371 ?auto_239380 ) ) ( not ( = ?auto_239371 ?auto_239381 ) ) ( not ( = ?auto_239371 ?auto_239382 ) ) ( not ( = ?auto_239371 ?auto_239383 ) ) ( not ( = ?auto_239372 ?auto_239373 ) ) ( not ( = ?auto_239372 ?auto_239374 ) ) ( not ( = ?auto_239372 ?auto_239375 ) ) ( not ( = ?auto_239372 ?auto_239376 ) ) ( not ( = ?auto_239372 ?auto_239377 ) ) ( not ( = ?auto_239372 ?auto_239378 ) ) ( not ( = ?auto_239372 ?auto_239379 ) ) ( not ( = ?auto_239372 ?auto_239380 ) ) ( not ( = ?auto_239372 ?auto_239381 ) ) ( not ( = ?auto_239372 ?auto_239382 ) ) ( not ( = ?auto_239372 ?auto_239383 ) ) ( not ( = ?auto_239373 ?auto_239374 ) ) ( not ( = ?auto_239373 ?auto_239375 ) ) ( not ( = ?auto_239373 ?auto_239376 ) ) ( not ( = ?auto_239373 ?auto_239377 ) ) ( not ( = ?auto_239373 ?auto_239378 ) ) ( not ( = ?auto_239373 ?auto_239379 ) ) ( not ( = ?auto_239373 ?auto_239380 ) ) ( not ( = ?auto_239373 ?auto_239381 ) ) ( not ( = ?auto_239373 ?auto_239382 ) ) ( not ( = ?auto_239373 ?auto_239383 ) ) ( not ( = ?auto_239374 ?auto_239375 ) ) ( not ( = ?auto_239374 ?auto_239376 ) ) ( not ( = ?auto_239374 ?auto_239377 ) ) ( not ( = ?auto_239374 ?auto_239378 ) ) ( not ( = ?auto_239374 ?auto_239379 ) ) ( not ( = ?auto_239374 ?auto_239380 ) ) ( not ( = ?auto_239374 ?auto_239381 ) ) ( not ( = ?auto_239374 ?auto_239382 ) ) ( not ( = ?auto_239374 ?auto_239383 ) ) ( not ( = ?auto_239375 ?auto_239376 ) ) ( not ( = ?auto_239375 ?auto_239377 ) ) ( not ( = ?auto_239375 ?auto_239378 ) ) ( not ( = ?auto_239375 ?auto_239379 ) ) ( not ( = ?auto_239375 ?auto_239380 ) ) ( not ( = ?auto_239375 ?auto_239381 ) ) ( not ( = ?auto_239375 ?auto_239382 ) ) ( not ( = ?auto_239375 ?auto_239383 ) ) ( not ( = ?auto_239376 ?auto_239377 ) ) ( not ( = ?auto_239376 ?auto_239378 ) ) ( not ( = ?auto_239376 ?auto_239379 ) ) ( not ( = ?auto_239376 ?auto_239380 ) ) ( not ( = ?auto_239376 ?auto_239381 ) ) ( not ( = ?auto_239376 ?auto_239382 ) ) ( not ( = ?auto_239376 ?auto_239383 ) ) ( not ( = ?auto_239377 ?auto_239378 ) ) ( not ( = ?auto_239377 ?auto_239379 ) ) ( not ( = ?auto_239377 ?auto_239380 ) ) ( not ( = ?auto_239377 ?auto_239381 ) ) ( not ( = ?auto_239377 ?auto_239382 ) ) ( not ( = ?auto_239377 ?auto_239383 ) ) ( not ( = ?auto_239378 ?auto_239379 ) ) ( not ( = ?auto_239378 ?auto_239380 ) ) ( not ( = ?auto_239378 ?auto_239381 ) ) ( not ( = ?auto_239378 ?auto_239382 ) ) ( not ( = ?auto_239378 ?auto_239383 ) ) ( not ( = ?auto_239379 ?auto_239380 ) ) ( not ( = ?auto_239379 ?auto_239381 ) ) ( not ( = ?auto_239379 ?auto_239382 ) ) ( not ( = ?auto_239379 ?auto_239383 ) ) ( not ( = ?auto_239380 ?auto_239381 ) ) ( not ( = ?auto_239380 ?auto_239382 ) ) ( not ( = ?auto_239380 ?auto_239383 ) ) ( not ( = ?auto_239381 ?auto_239382 ) ) ( not ( = ?auto_239381 ?auto_239383 ) ) ( not ( = ?auto_239382 ?auto_239383 ) ) ( ON ?auto_239381 ?auto_239382 ) ( ON ?auto_239380 ?auto_239381 ) ( ON ?auto_239379 ?auto_239380 ) ( ON ?auto_239378 ?auto_239379 ) ( ON ?auto_239377 ?auto_239378 ) ( ON ?auto_239376 ?auto_239377 ) ( ON ?auto_239375 ?auto_239376 ) ( ON ?auto_239374 ?auto_239375 ) ( CLEAR ?auto_239372 ) ( ON ?auto_239373 ?auto_239374 ) ( CLEAR ?auto_239373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_239371 ?auto_239372 ?auto_239373 )
      ( MAKE-12PILE ?auto_239371 ?auto_239372 ?auto_239373 ?auto_239374 ?auto_239375 ?auto_239376 ?auto_239377 ?auto_239378 ?auto_239379 ?auto_239380 ?auto_239381 ?auto_239382 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239396 - BLOCK
      ?auto_239397 - BLOCK
      ?auto_239398 - BLOCK
      ?auto_239399 - BLOCK
      ?auto_239400 - BLOCK
      ?auto_239401 - BLOCK
      ?auto_239402 - BLOCK
      ?auto_239403 - BLOCK
      ?auto_239404 - BLOCK
      ?auto_239405 - BLOCK
      ?auto_239406 - BLOCK
      ?auto_239407 - BLOCK
    )
    :vars
    (
      ?auto_239408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239407 ?auto_239408 ) ( ON-TABLE ?auto_239396 ) ( not ( = ?auto_239396 ?auto_239397 ) ) ( not ( = ?auto_239396 ?auto_239398 ) ) ( not ( = ?auto_239396 ?auto_239399 ) ) ( not ( = ?auto_239396 ?auto_239400 ) ) ( not ( = ?auto_239396 ?auto_239401 ) ) ( not ( = ?auto_239396 ?auto_239402 ) ) ( not ( = ?auto_239396 ?auto_239403 ) ) ( not ( = ?auto_239396 ?auto_239404 ) ) ( not ( = ?auto_239396 ?auto_239405 ) ) ( not ( = ?auto_239396 ?auto_239406 ) ) ( not ( = ?auto_239396 ?auto_239407 ) ) ( not ( = ?auto_239396 ?auto_239408 ) ) ( not ( = ?auto_239397 ?auto_239398 ) ) ( not ( = ?auto_239397 ?auto_239399 ) ) ( not ( = ?auto_239397 ?auto_239400 ) ) ( not ( = ?auto_239397 ?auto_239401 ) ) ( not ( = ?auto_239397 ?auto_239402 ) ) ( not ( = ?auto_239397 ?auto_239403 ) ) ( not ( = ?auto_239397 ?auto_239404 ) ) ( not ( = ?auto_239397 ?auto_239405 ) ) ( not ( = ?auto_239397 ?auto_239406 ) ) ( not ( = ?auto_239397 ?auto_239407 ) ) ( not ( = ?auto_239397 ?auto_239408 ) ) ( not ( = ?auto_239398 ?auto_239399 ) ) ( not ( = ?auto_239398 ?auto_239400 ) ) ( not ( = ?auto_239398 ?auto_239401 ) ) ( not ( = ?auto_239398 ?auto_239402 ) ) ( not ( = ?auto_239398 ?auto_239403 ) ) ( not ( = ?auto_239398 ?auto_239404 ) ) ( not ( = ?auto_239398 ?auto_239405 ) ) ( not ( = ?auto_239398 ?auto_239406 ) ) ( not ( = ?auto_239398 ?auto_239407 ) ) ( not ( = ?auto_239398 ?auto_239408 ) ) ( not ( = ?auto_239399 ?auto_239400 ) ) ( not ( = ?auto_239399 ?auto_239401 ) ) ( not ( = ?auto_239399 ?auto_239402 ) ) ( not ( = ?auto_239399 ?auto_239403 ) ) ( not ( = ?auto_239399 ?auto_239404 ) ) ( not ( = ?auto_239399 ?auto_239405 ) ) ( not ( = ?auto_239399 ?auto_239406 ) ) ( not ( = ?auto_239399 ?auto_239407 ) ) ( not ( = ?auto_239399 ?auto_239408 ) ) ( not ( = ?auto_239400 ?auto_239401 ) ) ( not ( = ?auto_239400 ?auto_239402 ) ) ( not ( = ?auto_239400 ?auto_239403 ) ) ( not ( = ?auto_239400 ?auto_239404 ) ) ( not ( = ?auto_239400 ?auto_239405 ) ) ( not ( = ?auto_239400 ?auto_239406 ) ) ( not ( = ?auto_239400 ?auto_239407 ) ) ( not ( = ?auto_239400 ?auto_239408 ) ) ( not ( = ?auto_239401 ?auto_239402 ) ) ( not ( = ?auto_239401 ?auto_239403 ) ) ( not ( = ?auto_239401 ?auto_239404 ) ) ( not ( = ?auto_239401 ?auto_239405 ) ) ( not ( = ?auto_239401 ?auto_239406 ) ) ( not ( = ?auto_239401 ?auto_239407 ) ) ( not ( = ?auto_239401 ?auto_239408 ) ) ( not ( = ?auto_239402 ?auto_239403 ) ) ( not ( = ?auto_239402 ?auto_239404 ) ) ( not ( = ?auto_239402 ?auto_239405 ) ) ( not ( = ?auto_239402 ?auto_239406 ) ) ( not ( = ?auto_239402 ?auto_239407 ) ) ( not ( = ?auto_239402 ?auto_239408 ) ) ( not ( = ?auto_239403 ?auto_239404 ) ) ( not ( = ?auto_239403 ?auto_239405 ) ) ( not ( = ?auto_239403 ?auto_239406 ) ) ( not ( = ?auto_239403 ?auto_239407 ) ) ( not ( = ?auto_239403 ?auto_239408 ) ) ( not ( = ?auto_239404 ?auto_239405 ) ) ( not ( = ?auto_239404 ?auto_239406 ) ) ( not ( = ?auto_239404 ?auto_239407 ) ) ( not ( = ?auto_239404 ?auto_239408 ) ) ( not ( = ?auto_239405 ?auto_239406 ) ) ( not ( = ?auto_239405 ?auto_239407 ) ) ( not ( = ?auto_239405 ?auto_239408 ) ) ( not ( = ?auto_239406 ?auto_239407 ) ) ( not ( = ?auto_239406 ?auto_239408 ) ) ( not ( = ?auto_239407 ?auto_239408 ) ) ( ON ?auto_239406 ?auto_239407 ) ( ON ?auto_239405 ?auto_239406 ) ( ON ?auto_239404 ?auto_239405 ) ( ON ?auto_239403 ?auto_239404 ) ( ON ?auto_239402 ?auto_239403 ) ( ON ?auto_239401 ?auto_239402 ) ( ON ?auto_239400 ?auto_239401 ) ( ON ?auto_239399 ?auto_239400 ) ( ON ?auto_239398 ?auto_239399 ) ( CLEAR ?auto_239396 ) ( ON ?auto_239397 ?auto_239398 ) ( CLEAR ?auto_239397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_239396 ?auto_239397 )
      ( MAKE-12PILE ?auto_239396 ?auto_239397 ?auto_239398 ?auto_239399 ?auto_239400 ?auto_239401 ?auto_239402 ?auto_239403 ?auto_239404 ?auto_239405 ?auto_239406 ?auto_239407 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239421 - BLOCK
      ?auto_239422 - BLOCK
      ?auto_239423 - BLOCK
      ?auto_239424 - BLOCK
      ?auto_239425 - BLOCK
      ?auto_239426 - BLOCK
      ?auto_239427 - BLOCK
      ?auto_239428 - BLOCK
      ?auto_239429 - BLOCK
      ?auto_239430 - BLOCK
      ?auto_239431 - BLOCK
      ?auto_239432 - BLOCK
    )
    :vars
    (
      ?auto_239433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239432 ?auto_239433 ) ( ON-TABLE ?auto_239421 ) ( not ( = ?auto_239421 ?auto_239422 ) ) ( not ( = ?auto_239421 ?auto_239423 ) ) ( not ( = ?auto_239421 ?auto_239424 ) ) ( not ( = ?auto_239421 ?auto_239425 ) ) ( not ( = ?auto_239421 ?auto_239426 ) ) ( not ( = ?auto_239421 ?auto_239427 ) ) ( not ( = ?auto_239421 ?auto_239428 ) ) ( not ( = ?auto_239421 ?auto_239429 ) ) ( not ( = ?auto_239421 ?auto_239430 ) ) ( not ( = ?auto_239421 ?auto_239431 ) ) ( not ( = ?auto_239421 ?auto_239432 ) ) ( not ( = ?auto_239421 ?auto_239433 ) ) ( not ( = ?auto_239422 ?auto_239423 ) ) ( not ( = ?auto_239422 ?auto_239424 ) ) ( not ( = ?auto_239422 ?auto_239425 ) ) ( not ( = ?auto_239422 ?auto_239426 ) ) ( not ( = ?auto_239422 ?auto_239427 ) ) ( not ( = ?auto_239422 ?auto_239428 ) ) ( not ( = ?auto_239422 ?auto_239429 ) ) ( not ( = ?auto_239422 ?auto_239430 ) ) ( not ( = ?auto_239422 ?auto_239431 ) ) ( not ( = ?auto_239422 ?auto_239432 ) ) ( not ( = ?auto_239422 ?auto_239433 ) ) ( not ( = ?auto_239423 ?auto_239424 ) ) ( not ( = ?auto_239423 ?auto_239425 ) ) ( not ( = ?auto_239423 ?auto_239426 ) ) ( not ( = ?auto_239423 ?auto_239427 ) ) ( not ( = ?auto_239423 ?auto_239428 ) ) ( not ( = ?auto_239423 ?auto_239429 ) ) ( not ( = ?auto_239423 ?auto_239430 ) ) ( not ( = ?auto_239423 ?auto_239431 ) ) ( not ( = ?auto_239423 ?auto_239432 ) ) ( not ( = ?auto_239423 ?auto_239433 ) ) ( not ( = ?auto_239424 ?auto_239425 ) ) ( not ( = ?auto_239424 ?auto_239426 ) ) ( not ( = ?auto_239424 ?auto_239427 ) ) ( not ( = ?auto_239424 ?auto_239428 ) ) ( not ( = ?auto_239424 ?auto_239429 ) ) ( not ( = ?auto_239424 ?auto_239430 ) ) ( not ( = ?auto_239424 ?auto_239431 ) ) ( not ( = ?auto_239424 ?auto_239432 ) ) ( not ( = ?auto_239424 ?auto_239433 ) ) ( not ( = ?auto_239425 ?auto_239426 ) ) ( not ( = ?auto_239425 ?auto_239427 ) ) ( not ( = ?auto_239425 ?auto_239428 ) ) ( not ( = ?auto_239425 ?auto_239429 ) ) ( not ( = ?auto_239425 ?auto_239430 ) ) ( not ( = ?auto_239425 ?auto_239431 ) ) ( not ( = ?auto_239425 ?auto_239432 ) ) ( not ( = ?auto_239425 ?auto_239433 ) ) ( not ( = ?auto_239426 ?auto_239427 ) ) ( not ( = ?auto_239426 ?auto_239428 ) ) ( not ( = ?auto_239426 ?auto_239429 ) ) ( not ( = ?auto_239426 ?auto_239430 ) ) ( not ( = ?auto_239426 ?auto_239431 ) ) ( not ( = ?auto_239426 ?auto_239432 ) ) ( not ( = ?auto_239426 ?auto_239433 ) ) ( not ( = ?auto_239427 ?auto_239428 ) ) ( not ( = ?auto_239427 ?auto_239429 ) ) ( not ( = ?auto_239427 ?auto_239430 ) ) ( not ( = ?auto_239427 ?auto_239431 ) ) ( not ( = ?auto_239427 ?auto_239432 ) ) ( not ( = ?auto_239427 ?auto_239433 ) ) ( not ( = ?auto_239428 ?auto_239429 ) ) ( not ( = ?auto_239428 ?auto_239430 ) ) ( not ( = ?auto_239428 ?auto_239431 ) ) ( not ( = ?auto_239428 ?auto_239432 ) ) ( not ( = ?auto_239428 ?auto_239433 ) ) ( not ( = ?auto_239429 ?auto_239430 ) ) ( not ( = ?auto_239429 ?auto_239431 ) ) ( not ( = ?auto_239429 ?auto_239432 ) ) ( not ( = ?auto_239429 ?auto_239433 ) ) ( not ( = ?auto_239430 ?auto_239431 ) ) ( not ( = ?auto_239430 ?auto_239432 ) ) ( not ( = ?auto_239430 ?auto_239433 ) ) ( not ( = ?auto_239431 ?auto_239432 ) ) ( not ( = ?auto_239431 ?auto_239433 ) ) ( not ( = ?auto_239432 ?auto_239433 ) ) ( ON ?auto_239431 ?auto_239432 ) ( ON ?auto_239430 ?auto_239431 ) ( ON ?auto_239429 ?auto_239430 ) ( ON ?auto_239428 ?auto_239429 ) ( ON ?auto_239427 ?auto_239428 ) ( ON ?auto_239426 ?auto_239427 ) ( ON ?auto_239425 ?auto_239426 ) ( ON ?auto_239424 ?auto_239425 ) ( ON ?auto_239423 ?auto_239424 ) ( CLEAR ?auto_239421 ) ( ON ?auto_239422 ?auto_239423 ) ( CLEAR ?auto_239422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_239421 ?auto_239422 )
      ( MAKE-12PILE ?auto_239421 ?auto_239422 ?auto_239423 ?auto_239424 ?auto_239425 ?auto_239426 ?auto_239427 ?auto_239428 ?auto_239429 ?auto_239430 ?auto_239431 ?auto_239432 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239446 - BLOCK
      ?auto_239447 - BLOCK
      ?auto_239448 - BLOCK
      ?auto_239449 - BLOCK
      ?auto_239450 - BLOCK
      ?auto_239451 - BLOCK
      ?auto_239452 - BLOCK
      ?auto_239453 - BLOCK
      ?auto_239454 - BLOCK
      ?auto_239455 - BLOCK
      ?auto_239456 - BLOCK
      ?auto_239457 - BLOCK
    )
    :vars
    (
      ?auto_239458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239457 ?auto_239458 ) ( not ( = ?auto_239446 ?auto_239447 ) ) ( not ( = ?auto_239446 ?auto_239448 ) ) ( not ( = ?auto_239446 ?auto_239449 ) ) ( not ( = ?auto_239446 ?auto_239450 ) ) ( not ( = ?auto_239446 ?auto_239451 ) ) ( not ( = ?auto_239446 ?auto_239452 ) ) ( not ( = ?auto_239446 ?auto_239453 ) ) ( not ( = ?auto_239446 ?auto_239454 ) ) ( not ( = ?auto_239446 ?auto_239455 ) ) ( not ( = ?auto_239446 ?auto_239456 ) ) ( not ( = ?auto_239446 ?auto_239457 ) ) ( not ( = ?auto_239446 ?auto_239458 ) ) ( not ( = ?auto_239447 ?auto_239448 ) ) ( not ( = ?auto_239447 ?auto_239449 ) ) ( not ( = ?auto_239447 ?auto_239450 ) ) ( not ( = ?auto_239447 ?auto_239451 ) ) ( not ( = ?auto_239447 ?auto_239452 ) ) ( not ( = ?auto_239447 ?auto_239453 ) ) ( not ( = ?auto_239447 ?auto_239454 ) ) ( not ( = ?auto_239447 ?auto_239455 ) ) ( not ( = ?auto_239447 ?auto_239456 ) ) ( not ( = ?auto_239447 ?auto_239457 ) ) ( not ( = ?auto_239447 ?auto_239458 ) ) ( not ( = ?auto_239448 ?auto_239449 ) ) ( not ( = ?auto_239448 ?auto_239450 ) ) ( not ( = ?auto_239448 ?auto_239451 ) ) ( not ( = ?auto_239448 ?auto_239452 ) ) ( not ( = ?auto_239448 ?auto_239453 ) ) ( not ( = ?auto_239448 ?auto_239454 ) ) ( not ( = ?auto_239448 ?auto_239455 ) ) ( not ( = ?auto_239448 ?auto_239456 ) ) ( not ( = ?auto_239448 ?auto_239457 ) ) ( not ( = ?auto_239448 ?auto_239458 ) ) ( not ( = ?auto_239449 ?auto_239450 ) ) ( not ( = ?auto_239449 ?auto_239451 ) ) ( not ( = ?auto_239449 ?auto_239452 ) ) ( not ( = ?auto_239449 ?auto_239453 ) ) ( not ( = ?auto_239449 ?auto_239454 ) ) ( not ( = ?auto_239449 ?auto_239455 ) ) ( not ( = ?auto_239449 ?auto_239456 ) ) ( not ( = ?auto_239449 ?auto_239457 ) ) ( not ( = ?auto_239449 ?auto_239458 ) ) ( not ( = ?auto_239450 ?auto_239451 ) ) ( not ( = ?auto_239450 ?auto_239452 ) ) ( not ( = ?auto_239450 ?auto_239453 ) ) ( not ( = ?auto_239450 ?auto_239454 ) ) ( not ( = ?auto_239450 ?auto_239455 ) ) ( not ( = ?auto_239450 ?auto_239456 ) ) ( not ( = ?auto_239450 ?auto_239457 ) ) ( not ( = ?auto_239450 ?auto_239458 ) ) ( not ( = ?auto_239451 ?auto_239452 ) ) ( not ( = ?auto_239451 ?auto_239453 ) ) ( not ( = ?auto_239451 ?auto_239454 ) ) ( not ( = ?auto_239451 ?auto_239455 ) ) ( not ( = ?auto_239451 ?auto_239456 ) ) ( not ( = ?auto_239451 ?auto_239457 ) ) ( not ( = ?auto_239451 ?auto_239458 ) ) ( not ( = ?auto_239452 ?auto_239453 ) ) ( not ( = ?auto_239452 ?auto_239454 ) ) ( not ( = ?auto_239452 ?auto_239455 ) ) ( not ( = ?auto_239452 ?auto_239456 ) ) ( not ( = ?auto_239452 ?auto_239457 ) ) ( not ( = ?auto_239452 ?auto_239458 ) ) ( not ( = ?auto_239453 ?auto_239454 ) ) ( not ( = ?auto_239453 ?auto_239455 ) ) ( not ( = ?auto_239453 ?auto_239456 ) ) ( not ( = ?auto_239453 ?auto_239457 ) ) ( not ( = ?auto_239453 ?auto_239458 ) ) ( not ( = ?auto_239454 ?auto_239455 ) ) ( not ( = ?auto_239454 ?auto_239456 ) ) ( not ( = ?auto_239454 ?auto_239457 ) ) ( not ( = ?auto_239454 ?auto_239458 ) ) ( not ( = ?auto_239455 ?auto_239456 ) ) ( not ( = ?auto_239455 ?auto_239457 ) ) ( not ( = ?auto_239455 ?auto_239458 ) ) ( not ( = ?auto_239456 ?auto_239457 ) ) ( not ( = ?auto_239456 ?auto_239458 ) ) ( not ( = ?auto_239457 ?auto_239458 ) ) ( ON ?auto_239456 ?auto_239457 ) ( ON ?auto_239455 ?auto_239456 ) ( ON ?auto_239454 ?auto_239455 ) ( ON ?auto_239453 ?auto_239454 ) ( ON ?auto_239452 ?auto_239453 ) ( ON ?auto_239451 ?auto_239452 ) ( ON ?auto_239450 ?auto_239451 ) ( ON ?auto_239449 ?auto_239450 ) ( ON ?auto_239448 ?auto_239449 ) ( ON ?auto_239447 ?auto_239448 ) ( ON ?auto_239446 ?auto_239447 ) ( CLEAR ?auto_239446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_239446 )
      ( MAKE-12PILE ?auto_239446 ?auto_239447 ?auto_239448 ?auto_239449 ?auto_239450 ?auto_239451 ?auto_239452 ?auto_239453 ?auto_239454 ?auto_239455 ?auto_239456 ?auto_239457 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_239471 - BLOCK
      ?auto_239472 - BLOCK
      ?auto_239473 - BLOCK
      ?auto_239474 - BLOCK
      ?auto_239475 - BLOCK
      ?auto_239476 - BLOCK
      ?auto_239477 - BLOCK
      ?auto_239478 - BLOCK
      ?auto_239479 - BLOCK
      ?auto_239480 - BLOCK
      ?auto_239481 - BLOCK
      ?auto_239482 - BLOCK
    )
    :vars
    (
      ?auto_239483 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239482 ?auto_239483 ) ( not ( = ?auto_239471 ?auto_239472 ) ) ( not ( = ?auto_239471 ?auto_239473 ) ) ( not ( = ?auto_239471 ?auto_239474 ) ) ( not ( = ?auto_239471 ?auto_239475 ) ) ( not ( = ?auto_239471 ?auto_239476 ) ) ( not ( = ?auto_239471 ?auto_239477 ) ) ( not ( = ?auto_239471 ?auto_239478 ) ) ( not ( = ?auto_239471 ?auto_239479 ) ) ( not ( = ?auto_239471 ?auto_239480 ) ) ( not ( = ?auto_239471 ?auto_239481 ) ) ( not ( = ?auto_239471 ?auto_239482 ) ) ( not ( = ?auto_239471 ?auto_239483 ) ) ( not ( = ?auto_239472 ?auto_239473 ) ) ( not ( = ?auto_239472 ?auto_239474 ) ) ( not ( = ?auto_239472 ?auto_239475 ) ) ( not ( = ?auto_239472 ?auto_239476 ) ) ( not ( = ?auto_239472 ?auto_239477 ) ) ( not ( = ?auto_239472 ?auto_239478 ) ) ( not ( = ?auto_239472 ?auto_239479 ) ) ( not ( = ?auto_239472 ?auto_239480 ) ) ( not ( = ?auto_239472 ?auto_239481 ) ) ( not ( = ?auto_239472 ?auto_239482 ) ) ( not ( = ?auto_239472 ?auto_239483 ) ) ( not ( = ?auto_239473 ?auto_239474 ) ) ( not ( = ?auto_239473 ?auto_239475 ) ) ( not ( = ?auto_239473 ?auto_239476 ) ) ( not ( = ?auto_239473 ?auto_239477 ) ) ( not ( = ?auto_239473 ?auto_239478 ) ) ( not ( = ?auto_239473 ?auto_239479 ) ) ( not ( = ?auto_239473 ?auto_239480 ) ) ( not ( = ?auto_239473 ?auto_239481 ) ) ( not ( = ?auto_239473 ?auto_239482 ) ) ( not ( = ?auto_239473 ?auto_239483 ) ) ( not ( = ?auto_239474 ?auto_239475 ) ) ( not ( = ?auto_239474 ?auto_239476 ) ) ( not ( = ?auto_239474 ?auto_239477 ) ) ( not ( = ?auto_239474 ?auto_239478 ) ) ( not ( = ?auto_239474 ?auto_239479 ) ) ( not ( = ?auto_239474 ?auto_239480 ) ) ( not ( = ?auto_239474 ?auto_239481 ) ) ( not ( = ?auto_239474 ?auto_239482 ) ) ( not ( = ?auto_239474 ?auto_239483 ) ) ( not ( = ?auto_239475 ?auto_239476 ) ) ( not ( = ?auto_239475 ?auto_239477 ) ) ( not ( = ?auto_239475 ?auto_239478 ) ) ( not ( = ?auto_239475 ?auto_239479 ) ) ( not ( = ?auto_239475 ?auto_239480 ) ) ( not ( = ?auto_239475 ?auto_239481 ) ) ( not ( = ?auto_239475 ?auto_239482 ) ) ( not ( = ?auto_239475 ?auto_239483 ) ) ( not ( = ?auto_239476 ?auto_239477 ) ) ( not ( = ?auto_239476 ?auto_239478 ) ) ( not ( = ?auto_239476 ?auto_239479 ) ) ( not ( = ?auto_239476 ?auto_239480 ) ) ( not ( = ?auto_239476 ?auto_239481 ) ) ( not ( = ?auto_239476 ?auto_239482 ) ) ( not ( = ?auto_239476 ?auto_239483 ) ) ( not ( = ?auto_239477 ?auto_239478 ) ) ( not ( = ?auto_239477 ?auto_239479 ) ) ( not ( = ?auto_239477 ?auto_239480 ) ) ( not ( = ?auto_239477 ?auto_239481 ) ) ( not ( = ?auto_239477 ?auto_239482 ) ) ( not ( = ?auto_239477 ?auto_239483 ) ) ( not ( = ?auto_239478 ?auto_239479 ) ) ( not ( = ?auto_239478 ?auto_239480 ) ) ( not ( = ?auto_239478 ?auto_239481 ) ) ( not ( = ?auto_239478 ?auto_239482 ) ) ( not ( = ?auto_239478 ?auto_239483 ) ) ( not ( = ?auto_239479 ?auto_239480 ) ) ( not ( = ?auto_239479 ?auto_239481 ) ) ( not ( = ?auto_239479 ?auto_239482 ) ) ( not ( = ?auto_239479 ?auto_239483 ) ) ( not ( = ?auto_239480 ?auto_239481 ) ) ( not ( = ?auto_239480 ?auto_239482 ) ) ( not ( = ?auto_239480 ?auto_239483 ) ) ( not ( = ?auto_239481 ?auto_239482 ) ) ( not ( = ?auto_239481 ?auto_239483 ) ) ( not ( = ?auto_239482 ?auto_239483 ) ) ( ON ?auto_239481 ?auto_239482 ) ( ON ?auto_239480 ?auto_239481 ) ( ON ?auto_239479 ?auto_239480 ) ( ON ?auto_239478 ?auto_239479 ) ( ON ?auto_239477 ?auto_239478 ) ( ON ?auto_239476 ?auto_239477 ) ( ON ?auto_239475 ?auto_239476 ) ( ON ?auto_239474 ?auto_239475 ) ( ON ?auto_239473 ?auto_239474 ) ( ON ?auto_239472 ?auto_239473 ) ( ON ?auto_239471 ?auto_239472 ) ( CLEAR ?auto_239471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_239471 )
      ( MAKE-12PILE ?auto_239471 ?auto_239472 ?auto_239473 ?auto_239474 ?auto_239475 ?auto_239476 ?auto_239477 ?auto_239478 ?auto_239479 ?auto_239480 ?auto_239481 ?auto_239482 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239497 - BLOCK
      ?auto_239498 - BLOCK
      ?auto_239499 - BLOCK
      ?auto_239500 - BLOCK
      ?auto_239501 - BLOCK
      ?auto_239502 - BLOCK
      ?auto_239503 - BLOCK
      ?auto_239504 - BLOCK
      ?auto_239505 - BLOCK
      ?auto_239506 - BLOCK
      ?auto_239507 - BLOCK
      ?auto_239508 - BLOCK
      ?auto_239509 - BLOCK
    )
    :vars
    (
      ?auto_239510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_239508 ) ( ON ?auto_239509 ?auto_239510 ) ( CLEAR ?auto_239509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_239497 ) ( ON ?auto_239498 ?auto_239497 ) ( ON ?auto_239499 ?auto_239498 ) ( ON ?auto_239500 ?auto_239499 ) ( ON ?auto_239501 ?auto_239500 ) ( ON ?auto_239502 ?auto_239501 ) ( ON ?auto_239503 ?auto_239502 ) ( ON ?auto_239504 ?auto_239503 ) ( ON ?auto_239505 ?auto_239504 ) ( ON ?auto_239506 ?auto_239505 ) ( ON ?auto_239507 ?auto_239506 ) ( ON ?auto_239508 ?auto_239507 ) ( not ( = ?auto_239497 ?auto_239498 ) ) ( not ( = ?auto_239497 ?auto_239499 ) ) ( not ( = ?auto_239497 ?auto_239500 ) ) ( not ( = ?auto_239497 ?auto_239501 ) ) ( not ( = ?auto_239497 ?auto_239502 ) ) ( not ( = ?auto_239497 ?auto_239503 ) ) ( not ( = ?auto_239497 ?auto_239504 ) ) ( not ( = ?auto_239497 ?auto_239505 ) ) ( not ( = ?auto_239497 ?auto_239506 ) ) ( not ( = ?auto_239497 ?auto_239507 ) ) ( not ( = ?auto_239497 ?auto_239508 ) ) ( not ( = ?auto_239497 ?auto_239509 ) ) ( not ( = ?auto_239497 ?auto_239510 ) ) ( not ( = ?auto_239498 ?auto_239499 ) ) ( not ( = ?auto_239498 ?auto_239500 ) ) ( not ( = ?auto_239498 ?auto_239501 ) ) ( not ( = ?auto_239498 ?auto_239502 ) ) ( not ( = ?auto_239498 ?auto_239503 ) ) ( not ( = ?auto_239498 ?auto_239504 ) ) ( not ( = ?auto_239498 ?auto_239505 ) ) ( not ( = ?auto_239498 ?auto_239506 ) ) ( not ( = ?auto_239498 ?auto_239507 ) ) ( not ( = ?auto_239498 ?auto_239508 ) ) ( not ( = ?auto_239498 ?auto_239509 ) ) ( not ( = ?auto_239498 ?auto_239510 ) ) ( not ( = ?auto_239499 ?auto_239500 ) ) ( not ( = ?auto_239499 ?auto_239501 ) ) ( not ( = ?auto_239499 ?auto_239502 ) ) ( not ( = ?auto_239499 ?auto_239503 ) ) ( not ( = ?auto_239499 ?auto_239504 ) ) ( not ( = ?auto_239499 ?auto_239505 ) ) ( not ( = ?auto_239499 ?auto_239506 ) ) ( not ( = ?auto_239499 ?auto_239507 ) ) ( not ( = ?auto_239499 ?auto_239508 ) ) ( not ( = ?auto_239499 ?auto_239509 ) ) ( not ( = ?auto_239499 ?auto_239510 ) ) ( not ( = ?auto_239500 ?auto_239501 ) ) ( not ( = ?auto_239500 ?auto_239502 ) ) ( not ( = ?auto_239500 ?auto_239503 ) ) ( not ( = ?auto_239500 ?auto_239504 ) ) ( not ( = ?auto_239500 ?auto_239505 ) ) ( not ( = ?auto_239500 ?auto_239506 ) ) ( not ( = ?auto_239500 ?auto_239507 ) ) ( not ( = ?auto_239500 ?auto_239508 ) ) ( not ( = ?auto_239500 ?auto_239509 ) ) ( not ( = ?auto_239500 ?auto_239510 ) ) ( not ( = ?auto_239501 ?auto_239502 ) ) ( not ( = ?auto_239501 ?auto_239503 ) ) ( not ( = ?auto_239501 ?auto_239504 ) ) ( not ( = ?auto_239501 ?auto_239505 ) ) ( not ( = ?auto_239501 ?auto_239506 ) ) ( not ( = ?auto_239501 ?auto_239507 ) ) ( not ( = ?auto_239501 ?auto_239508 ) ) ( not ( = ?auto_239501 ?auto_239509 ) ) ( not ( = ?auto_239501 ?auto_239510 ) ) ( not ( = ?auto_239502 ?auto_239503 ) ) ( not ( = ?auto_239502 ?auto_239504 ) ) ( not ( = ?auto_239502 ?auto_239505 ) ) ( not ( = ?auto_239502 ?auto_239506 ) ) ( not ( = ?auto_239502 ?auto_239507 ) ) ( not ( = ?auto_239502 ?auto_239508 ) ) ( not ( = ?auto_239502 ?auto_239509 ) ) ( not ( = ?auto_239502 ?auto_239510 ) ) ( not ( = ?auto_239503 ?auto_239504 ) ) ( not ( = ?auto_239503 ?auto_239505 ) ) ( not ( = ?auto_239503 ?auto_239506 ) ) ( not ( = ?auto_239503 ?auto_239507 ) ) ( not ( = ?auto_239503 ?auto_239508 ) ) ( not ( = ?auto_239503 ?auto_239509 ) ) ( not ( = ?auto_239503 ?auto_239510 ) ) ( not ( = ?auto_239504 ?auto_239505 ) ) ( not ( = ?auto_239504 ?auto_239506 ) ) ( not ( = ?auto_239504 ?auto_239507 ) ) ( not ( = ?auto_239504 ?auto_239508 ) ) ( not ( = ?auto_239504 ?auto_239509 ) ) ( not ( = ?auto_239504 ?auto_239510 ) ) ( not ( = ?auto_239505 ?auto_239506 ) ) ( not ( = ?auto_239505 ?auto_239507 ) ) ( not ( = ?auto_239505 ?auto_239508 ) ) ( not ( = ?auto_239505 ?auto_239509 ) ) ( not ( = ?auto_239505 ?auto_239510 ) ) ( not ( = ?auto_239506 ?auto_239507 ) ) ( not ( = ?auto_239506 ?auto_239508 ) ) ( not ( = ?auto_239506 ?auto_239509 ) ) ( not ( = ?auto_239506 ?auto_239510 ) ) ( not ( = ?auto_239507 ?auto_239508 ) ) ( not ( = ?auto_239507 ?auto_239509 ) ) ( not ( = ?auto_239507 ?auto_239510 ) ) ( not ( = ?auto_239508 ?auto_239509 ) ) ( not ( = ?auto_239508 ?auto_239510 ) ) ( not ( = ?auto_239509 ?auto_239510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_239509 ?auto_239510 )
      ( !STACK ?auto_239509 ?auto_239508 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239524 - BLOCK
      ?auto_239525 - BLOCK
      ?auto_239526 - BLOCK
      ?auto_239527 - BLOCK
      ?auto_239528 - BLOCK
      ?auto_239529 - BLOCK
      ?auto_239530 - BLOCK
      ?auto_239531 - BLOCK
      ?auto_239532 - BLOCK
      ?auto_239533 - BLOCK
      ?auto_239534 - BLOCK
      ?auto_239535 - BLOCK
      ?auto_239536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_239535 ) ( ON-TABLE ?auto_239536 ) ( CLEAR ?auto_239536 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_239524 ) ( ON ?auto_239525 ?auto_239524 ) ( ON ?auto_239526 ?auto_239525 ) ( ON ?auto_239527 ?auto_239526 ) ( ON ?auto_239528 ?auto_239527 ) ( ON ?auto_239529 ?auto_239528 ) ( ON ?auto_239530 ?auto_239529 ) ( ON ?auto_239531 ?auto_239530 ) ( ON ?auto_239532 ?auto_239531 ) ( ON ?auto_239533 ?auto_239532 ) ( ON ?auto_239534 ?auto_239533 ) ( ON ?auto_239535 ?auto_239534 ) ( not ( = ?auto_239524 ?auto_239525 ) ) ( not ( = ?auto_239524 ?auto_239526 ) ) ( not ( = ?auto_239524 ?auto_239527 ) ) ( not ( = ?auto_239524 ?auto_239528 ) ) ( not ( = ?auto_239524 ?auto_239529 ) ) ( not ( = ?auto_239524 ?auto_239530 ) ) ( not ( = ?auto_239524 ?auto_239531 ) ) ( not ( = ?auto_239524 ?auto_239532 ) ) ( not ( = ?auto_239524 ?auto_239533 ) ) ( not ( = ?auto_239524 ?auto_239534 ) ) ( not ( = ?auto_239524 ?auto_239535 ) ) ( not ( = ?auto_239524 ?auto_239536 ) ) ( not ( = ?auto_239525 ?auto_239526 ) ) ( not ( = ?auto_239525 ?auto_239527 ) ) ( not ( = ?auto_239525 ?auto_239528 ) ) ( not ( = ?auto_239525 ?auto_239529 ) ) ( not ( = ?auto_239525 ?auto_239530 ) ) ( not ( = ?auto_239525 ?auto_239531 ) ) ( not ( = ?auto_239525 ?auto_239532 ) ) ( not ( = ?auto_239525 ?auto_239533 ) ) ( not ( = ?auto_239525 ?auto_239534 ) ) ( not ( = ?auto_239525 ?auto_239535 ) ) ( not ( = ?auto_239525 ?auto_239536 ) ) ( not ( = ?auto_239526 ?auto_239527 ) ) ( not ( = ?auto_239526 ?auto_239528 ) ) ( not ( = ?auto_239526 ?auto_239529 ) ) ( not ( = ?auto_239526 ?auto_239530 ) ) ( not ( = ?auto_239526 ?auto_239531 ) ) ( not ( = ?auto_239526 ?auto_239532 ) ) ( not ( = ?auto_239526 ?auto_239533 ) ) ( not ( = ?auto_239526 ?auto_239534 ) ) ( not ( = ?auto_239526 ?auto_239535 ) ) ( not ( = ?auto_239526 ?auto_239536 ) ) ( not ( = ?auto_239527 ?auto_239528 ) ) ( not ( = ?auto_239527 ?auto_239529 ) ) ( not ( = ?auto_239527 ?auto_239530 ) ) ( not ( = ?auto_239527 ?auto_239531 ) ) ( not ( = ?auto_239527 ?auto_239532 ) ) ( not ( = ?auto_239527 ?auto_239533 ) ) ( not ( = ?auto_239527 ?auto_239534 ) ) ( not ( = ?auto_239527 ?auto_239535 ) ) ( not ( = ?auto_239527 ?auto_239536 ) ) ( not ( = ?auto_239528 ?auto_239529 ) ) ( not ( = ?auto_239528 ?auto_239530 ) ) ( not ( = ?auto_239528 ?auto_239531 ) ) ( not ( = ?auto_239528 ?auto_239532 ) ) ( not ( = ?auto_239528 ?auto_239533 ) ) ( not ( = ?auto_239528 ?auto_239534 ) ) ( not ( = ?auto_239528 ?auto_239535 ) ) ( not ( = ?auto_239528 ?auto_239536 ) ) ( not ( = ?auto_239529 ?auto_239530 ) ) ( not ( = ?auto_239529 ?auto_239531 ) ) ( not ( = ?auto_239529 ?auto_239532 ) ) ( not ( = ?auto_239529 ?auto_239533 ) ) ( not ( = ?auto_239529 ?auto_239534 ) ) ( not ( = ?auto_239529 ?auto_239535 ) ) ( not ( = ?auto_239529 ?auto_239536 ) ) ( not ( = ?auto_239530 ?auto_239531 ) ) ( not ( = ?auto_239530 ?auto_239532 ) ) ( not ( = ?auto_239530 ?auto_239533 ) ) ( not ( = ?auto_239530 ?auto_239534 ) ) ( not ( = ?auto_239530 ?auto_239535 ) ) ( not ( = ?auto_239530 ?auto_239536 ) ) ( not ( = ?auto_239531 ?auto_239532 ) ) ( not ( = ?auto_239531 ?auto_239533 ) ) ( not ( = ?auto_239531 ?auto_239534 ) ) ( not ( = ?auto_239531 ?auto_239535 ) ) ( not ( = ?auto_239531 ?auto_239536 ) ) ( not ( = ?auto_239532 ?auto_239533 ) ) ( not ( = ?auto_239532 ?auto_239534 ) ) ( not ( = ?auto_239532 ?auto_239535 ) ) ( not ( = ?auto_239532 ?auto_239536 ) ) ( not ( = ?auto_239533 ?auto_239534 ) ) ( not ( = ?auto_239533 ?auto_239535 ) ) ( not ( = ?auto_239533 ?auto_239536 ) ) ( not ( = ?auto_239534 ?auto_239535 ) ) ( not ( = ?auto_239534 ?auto_239536 ) ) ( not ( = ?auto_239535 ?auto_239536 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_239536 )
      ( !STACK ?auto_239536 ?auto_239535 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239550 - BLOCK
      ?auto_239551 - BLOCK
      ?auto_239552 - BLOCK
      ?auto_239553 - BLOCK
      ?auto_239554 - BLOCK
      ?auto_239555 - BLOCK
      ?auto_239556 - BLOCK
      ?auto_239557 - BLOCK
      ?auto_239558 - BLOCK
      ?auto_239559 - BLOCK
      ?auto_239560 - BLOCK
      ?auto_239561 - BLOCK
      ?auto_239562 - BLOCK
    )
    :vars
    (
      ?auto_239563 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239562 ?auto_239563 ) ( ON-TABLE ?auto_239550 ) ( ON ?auto_239551 ?auto_239550 ) ( ON ?auto_239552 ?auto_239551 ) ( ON ?auto_239553 ?auto_239552 ) ( ON ?auto_239554 ?auto_239553 ) ( ON ?auto_239555 ?auto_239554 ) ( ON ?auto_239556 ?auto_239555 ) ( ON ?auto_239557 ?auto_239556 ) ( ON ?auto_239558 ?auto_239557 ) ( ON ?auto_239559 ?auto_239558 ) ( ON ?auto_239560 ?auto_239559 ) ( not ( = ?auto_239550 ?auto_239551 ) ) ( not ( = ?auto_239550 ?auto_239552 ) ) ( not ( = ?auto_239550 ?auto_239553 ) ) ( not ( = ?auto_239550 ?auto_239554 ) ) ( not ( = ?auto_239550 ?auto_239555 ) ) ( not ( = ?auto_239550 ?auto_239556 ) ) ( not ( = ?auto_239550 ?auto_239557 ) ) ( not ( = ?auto_239550 ?auto_239558 ) ) ( not ( = ?auto_239550 ?auto_239559 ) ) ( not ( = ?auto_239550 ?auto_239560 ) ) ( not ( = ?auto_239550 ?auto_239561 ) ) ( not ( = ?auto_239550 ?auto_239562 ) ) ( not ( = ?auto_239550 ?auto_239563 ) ) ( not ( = ?auto_239551 ?auto_239552 ) ) ( not ( = ?auto_239551 ?auto_239553 ) ) ( not ( = ?auto_239551 ?auto_239554 ) ) ( not ( = ?auto_239551 ?auto_239555 ) ) ( not ( = ?auto_239551 ?auto_239556 ) ) ( not ( = ?auto_239551 ?auto_239557 ) ) ( not ( = ?auto_239551 ?auto_239558 ) ) ( not ( = ?auto_239551 ?auto_239559 ) ) ( not ( = ?auto_239551 ?auto_239560 ) ) ( not ( = ?auto_239551 ?auto_239561 ) ) ( not ( = ?auto_239551 ?auto_239562 ) ) ( not ( = ?auto_239551 ?auto_239563 ) ) ( not ( = ?auto_239552 ?auto_239553 ) ) ( not ( = ?auto_239552 ?auto_239554 ) ) ( not ( = ?auto_239552 ?auto_239555 ) ) ( not ( = ?auto_239552 ?auto_239556 ) ) ( not ( = ?auto_239552 ?auto_239557 ) ) ( not ( = ?auto_239552 ?auto_239558 ) ) ( not ( = ?auto_239552 ?auto_239559 ) ) ( not ( = ?auto_239552 ?auto_239560 ) ) ( not ( = ?auto_239552 ?auto_239561 ) ) ( not ( = ?auto_239552 ?auto_239562 ) ) ( not ( = ?auto_239552 ?auto_239563 ) ) ( not ( = ?auto_239553 ?auto_239554 ) ) ( not ( = ?auto_239553 ?auto_239555 ) ) ( not ( = ?auto_239553 ?auto_239556 ) ) ( not ( = ?auto_239553 ?auto_239557 ) ) ( not ( = ?auto_239553 ?auto_239558 ) ) ( not ( = ?auto_239553 ?auto_239559 ) ) ( not ( = ?auto_239553 ?auto_239560 ) ) ( not ( = ?auto_239553 ?auto_239561 ) ) ( not ( = ?auto_239553 ?auto_239562 ) ) ( not ( = ?auto_239553 ?auto_239563 ) ) ( not ( = ?auto_239554 ?auto_239555 ) ) ( not ( = ?auto_239554 ?auto_239556 ) ) ( not ( = ?auto_239554 ?auto_239557 ) ) ( not ( = ?auto_239554 ?auto_239558 ) ) ( not ( = ?auto_239554 ?auto_239559 ) ) ( not ( = ?auto_239554 ?auto_239560 ) ) ( not ( = ?auto_239554 ?auto_239561 ) ) ( not ( = ?auto_239554 ?auto_239562 ) ) ( not ( = ?auto_239554 ?auto_239563 ) ) ( not ( = ?auto_239555 ?auto_239556 ) ) ( not ( = ?auto_239555 ?auto_239557 ) ) ( not ( = ?auto_239555 ?auto_239558 ) ) ( not ( = ?auto_239555 ?auto_239559 ) ) ( not ( = ?auto_239555 ?auto_239560 ) ) ( not ( = ?auto_239555 ?auto_239561 ) ) ( not ( = ?auto_239555 ?auto_239562 ) ) ( not ( = ?auto_239555 ?auto_239563 ) ) ( not ( = ?auto_239556 ?auto_239557 ) ) ( not ( = ?auto_239556 ?auto_239558 ) ) ( not ( = ?auto_239556 ?auto_239559 ) ) ( not ( = ?auto_239556 ?auto_239560 ) ) ( not ( = ?auto_239556 ?auto_239561 ) ) ( not ( = ?auto_239556 ?auto_239562 ) ) ( not ( = ?auto_239556 ?auto_239563 ) ) ( not ( = ?auto_239557 ?auto_239558 ) ) ( not ( = ?auto_239557 ?auto_239559 ) ) ( not ( = ?auto_239557 ?auto_239560 ) ) ( not ( = ?auto_239557 ?auto_239561 ) ) ( not ( = ?auto_239557 ?auto_239562 ) ) ( not ( = ?auto_239557 ?auto_239563 ) ) ( not ( = ?auto_239558 ?auto_239559 ) ) ( not ( = ?auto_239558 ?auto_239560 ) ) ( not ( = ?auto_239558 ?auto_239561 ) ) ( not ( = ?auto_239558 ?auto_239562 ) ) ( not ( = ?auto_239558 ?auto_239563 ) ) ( not ( = ?auto_239559 ?auto_239560 ) ) ( not ( = ?auto_239559 ?auto_239561 ) ) ( not ( = ?auto_239559 ?auto_239562 ) ) ( not ( = ?auto_239559 ?auto_239563 ) ) ( not ( = ?auto_239560 ?auto_239561 ) ) ( not ( = ?auto_239560 ?auto_239562 ) ) ( not ( = ?auto_239560 ?auto_239563 ) ) ( not ( = ?auto_239561 ?auto_239562 ) ) ( not ( = ?auto_239561 ?auto_239563 ) ) ( not ( = ?auto_239562 ?auto_239563 ) ) ( CLEAR ?auto_239560 ) ( ON ?auto_239561 ?auto_239562 ) ( CLEAR ?auto_239561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_239550 ?auto_239551 ?auto_239552 ?auto_239553 ?auto_239554 ?auto_239555 ?auto_239556 ?auto_239557 ?auto_239558 ?auto_239559 ?auto_239560 ?auto_239561 )
      ( MAKE-13PILE ?auto_239550 ?auto_239551 ?auto_239552 ?auto_239553 ?auto_239554 ?auto_239555 ?auto_239556 ?auto_239557 ?auto_239558 ?auto_239559 ?auto_239560 ?auto_239561 ?auto_239562 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239577 - BLOCK
      ?auto_239578 - BLOCK
      ?auto_239579 - BLOCK
      ?auto_239580 - BLOCK
      ?auto_239581 - BLOCK
      ?auto_239582 - BLOCK
      ?auto_239583 - BLOCK
      ?auto_239584 - BLOCK
      ?auto_239585 - BLOCK
      ?auto_239586 - BLOCK
      ?auto_239587 - BLOCK
      ?auto_239588 - BLOCK
      ?auto_239589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239589 ) ( ON-TABLE ?auto_239577 ) ( ON ?auto_239578 ?auto_239577 ) ( ON ?auto_239579 ?auto_239578 ) ( ON ?auto_239580 ?auto_239579 ) ( ON ?auto_239581 ?auto_239580 ) ( ON ?auto_239582 ?auto_239581 ) ( ON ?auto_239583 ?auto_239582 ) ( ON ?auto_239584 ?auto_239583 ) ( ON ?auto_239585 ?auto_239584 ) ( ON ?auto_239586 ?auto_239585 ) ( ON ?auto_239587 ?auto_239586 ) ( not ( = ?auto_239577 ?auto_239578 ) ) ( not ( = ?auto_239577 ?auto_239579 ) ) ( not ( = ?auto_239577 ?auto_239580 ) ) ( not ( = ?auto_239577 ?auto_239581 ) ) ( not ( = ?auto_239577 ?auto_239582 ) ) ( not ( = ?auto_239577 ?auto_239583 ) ) ( not ( = ?auto_239577 ?auto_239584 ) ) ( not ( = ?auto_239577 ?auto_239585 ) ) ( not ( = ?auto_239577 ?auto_239586 ) ) ( not ( = ?auto_239577 ?auto_239587 ) ) ( not ( = ?auto_239577 ?auto_239588 ) ) ( not ( = ?auto_239577 ?auto_239589 ) ) ( not ( = ?auto_239578 ?auto_239579 ) ) ( not ( = ?auto_239578 ?auto_239580 ) ) ( not ( = ?auto_239578 ?auto_239581 ) ) ( not ( = ?auto_239578 ?auto_239582 ) ) ( not ( = ?auto_239578 ?auto_239583 ) ) ( not ( = ?auto_239578 ?auto_239584 ) ) ( not ( = ?auto_239578 ?auto_239585 ) ) ( not ( = ?auto_239578 ?auto_239586 ) ) ( not ( = ?auto_239578 ?auto_239587 ) ) ( not ( = ?auto_239578 ?auto_239588 ) ) ( not ( = ?auto_239578 ?auto_239589 ) ) ( not ( = ?auto_239579 ?auto_239580 ) ) ( not ( = ?auto_239579 ?auto_239581 ) ) ( not ( = ?auto_239579 ?auto_239582 ) ) ( not ( = ?auto_239579 ?auto_239583 ) ) ( not ( = ?auto_239579 ?auto_239584 ) ) ( not ( = ?auto_239579 ?auto_239585 ) ) ( not ( = ?auto_239579 ?auto_239586 ) ) ( not ( = ?auto_239579 ?auto_239587 ) ) ( not ( = ?auto_239579 ?auto_239588 ) ) ( not ( = ?auto_239579 ?auto_239589 ) ) ( not ( = ?auto_239580 ?auto_239581 ) ) ( not ( = ?auto_239580 ?auto_239582 ) ) ( not ( = ?auto_239580 ?auto_239583 ) ) ( not ( = ?auto_239580 ?auto_239584 ) ) ( not ( = ?auto_239580 ?auto_239585 ) ) ( not ( = ?auto_239580 ?auto_239586 ) ) ( not ( = ?auto_239580 ?auto_239587 ) ) ( not ( = ?auto_239580 ?auto_239588 ) ) ( not ( = ?auto_239580 ?auto_239589 ) ) ( not ( = ?auto_239581 ?auto_239582 ) ) ( not ( = ?auto_239581 ?auto_239583 ) ) ( not ( = ?auto_239581 ?auto_239584 ) ) ( not ( = ?auto_239581 ?auto_239585 ) ) ( not ( = ?auto_239581 ?auto_239586 ) ) ( not ( = ?auto_239581 ?auto_239587 ) ) ( not ( = ?auto_239581 ?auto_239588 ) ) ( not ( = ?auto_239581 ?auto_239589 ) ) ( not ( = ?auto_239582 ?auto_239583 ) ) ( not ( = ?auto_239582 ?auto_239584 ) ) ( not ( = ?auto_239582 ?auto_239585 ) ) ( not ( = ?auto_239582 ?auto_239586 ) ) ( not ( = ?auto_239582 ?auto_239587 ) ) ( not ( = ?auto_239582 ?auto_239588 ) ) ( not ( = ?auto_239582 ?auto_239589 ) ) ( not ( = ?auto_239583 ?auto_239584 ) ) ( not ( = ?auto_239583 ?auto_239585 ) ) ( not ( = ?auto_239583 ?auto_239586 ) ) ( not ( = ?auto_239583 ?auto_239587 ) ) ( not ( = ?auto_239583 ?auto_239588 ) ) ( not ( = ?auto_239583 ?auto_239589 ) ) ( not ( = ?auto_239584 ?auto_239585 ) ) ( not ( = ?auto_239584 ?auto_239586 ) ) ( not ( = ?auto_239584 ?auto_239587 ) ) ( not ( = ?auto_239584 ?auto_239588 ) ) ( not ( = ?auto_239584 ?auto_239589 ) ) ( not ( = ?auto_239585 ?auto_239586 ) ) ( not ( = ?auto_239585 ?auto_239587 ) ) ( not ( = ?auto_239585 ?auto_239588 ) ) ( not ( = ?auto_239585 ?auto_239589 ) ) ( not ( = ?auto_239586 ?auto_239587 ) ) ( not ( = ?auto_239586 ?auto_239588 ) ) ( not ( = ?auto_239586 ?auto_239589 ) ) ( not ( = ?auto_239587 ?auto_239588 ) ) ( not ( = ?auto_239587 ?auto_239589 ) ) ( not ( = ?auto_239588 ?auto_239589 ) ) ( CLEAR ?auto_239587 ) ( ON ?auto_239588 ?auto_239589 ) ( CLEAR ?auto_239588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_239577 ?auto_239578 ?auto_239579 ?auto_239580 ?auto_239581 ?auto_239582 ?auto_239583 ?auto_239584 ?auto_239585 ?auto_239586 ?auto_239587 ?auto_239588 )
      ( MAKE-13PILE ?auto_239577 ?auto_239578 ?auto_239579 ?auto_239580 ?auto_239581 ?auto_239582 ?auto_239583 ?auto_239584 ?auto_239585 ?auto_239586 ?auto_239587 ?auto_239588 ?auto_239589 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239603 - BLOCK
      ?auto_239604 - BLOCK
      ?auto_239605 - BLOCK
      ?auto_239606 - BLOCK
      ?auto_239607 - BLOCK
      ?auto_239608 - BLOCK
      ?auto_239609 - BLOCK
      ?auto_239610 - BLOCK
      ?auto_239611 - BLOCK
      ?auto_239612 - BLOCK
      ?auto_239613 - BLOCK
      ?auto_239614 - BLOCK
      ?auto_239615 - BLOCK
    )
    :vars
    (
      ?auto_239616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239615 ?auto_239616 ) ( ON-TABLE ?auto_239603 ) ( ON ?auto_239604 ?auto_239603 ) ( ON ?auto_239605 ?auto_239604 ) ( ON ?auto_239606 ?auto_239605 ) ( ON ?auto_239607 ?auto_239606 ) ( ON ?auto_239608 ?auto_239607 ) ( ON ?auto_239609 ?auto_239608 ) ( ON ?auto_239610 ?auto_239609 ) ( ON ?auto_239611 ?auto_239610 ) ( ON ?auto_239612 ?auto_239611 ) ( not ( = ?auto_239603 ?auto_239604 ) ) ( not ( = ?auto_239603 ?auto_239605 ) ) ( not ( = ?auto_239603 ?auto_239606 ) ) ( not ( = ?auto_239603 ?auto_239607 ) ) ( not ( = ?auto_239603 ?auto_239608 ) ) ( not ( = ?auto_239603 ?auto_239609 ) ) ( not ( = ?auto_239603 ?auto_239610 ) ) ( not ( = ?auto_239603 ?auto_239611 ) ) ( not ( = ?auto_239603 ?auto_239612 ) ) ( not ( = ?auto_239603 ?auto_239613 ) ) ( not ( = ?auto_239603 ?auto_239614 ) ) ( not ( = ?auto_239603 ?auto_239615 ) ) ( not ( = ?auto_239603 ?auto_239616 ) ) ( not ( = ?auto_239604 ?auto_239605 ) ) ( not ( = ?auto_239604 ?auto_239606 ) ) ( not ( = ?auto_239604 ?auto_239607 ) ) ( not ( = ?auto_239604 ?auto_239608 ) ) ( not ( = ?auto_239604 ?auto_239609 ) ) ( not ( = ?auto_239604 ?auto_239610 ) ) ( not ( = ?auto_239604 ?auto_239611 ) ) ( not ( = ?auto_239604 ?auto_239612 ) ) ( not ( = ?auto_239604 ?auto_239613 ) ) ( not ( = ?auto_239604 ?auto_239614 ) ) ( not ( = ?auto_239604 ?auto_239615 ) ) ( not ( = ?auto_239604 ?auto_239616 ) ) ( not ( = ?auto_239605 ?auto_239606 ) ) ( not ( = ?auto_239605 ?auto_239607 ) ) ( not ( = ?auto_239605 ?auto_239608 ) ) ( not ( = ?auto_239605 ?auto_239609 ) ) ( not ( = ?auto_239605 ?auto_239610 ) ) ( not ( = ?auto_239605 ?auto_239611 ) ) ( not ( = ?auto_239605 ?auto_239612 ) ) ( not ( = ?auto_239605 ?auto_239613 ) ) ( not ( = ?auto_239605 ?auto_239614 ) ) ( not ( = ?auto_239605 ?auto_239615 ) ) ( not ( = ?auto_239605 ?auto_239616 ) ) ( not ( = ?auto_239606 ?auto_239607 ) ) ( not ( = ?auto_239606 ?auto_239608 ) ) ( not ( = ?auto_239606 ?auto_239609 ) ) ( not ( = ?auto_239606 ?auto_239610 ) ) ( not ( = ?auto_239606 ?auto_239611 ) ) ( not ( = ?auto_239606 ?auto_239612 ) ) ( not ( = ?auto_239606 ?auto_239613 ) ) ( not ( = ?auto_239606 ?auto_239614 ) ) ( not ( = ?auto_239606 ?auto_239615 ) ) ( not ( = ?auto_239606 ?auto_239616 ) ) ( not ( = ?auto_239607 ?auto_239608 ) ) ( not ( = ?auto_239607 ?auto_239609 ) ) ( not ( = ?auto_239607 ?auto_239610 ) ) ( not ( = ?auto_239607 ?auto_239611 ) ) ( not ( = ?auto_239607 ?auto_239612 ) ) ( not ( = ?auto_239607 ?auto_239613 ) ) ( not ( = ?auto_239607 ?auto_239614 ) ) ( not ( = ?auto_239607 ?auto_239615 ) ) ( not ( = ?auto_239607 ?auto_239616 ) ) ( not ( = ?auto_239608 ?auto_239609 ) ) ( not ( = ?auto_239608 ?auto_239610 ) ) ( not ( = ?auto_239608 ?auto_239611 ) ) ( not ( = ?auto_239608 ?auto_239612 ) ) ( not ( = ?auto_239608 ?auto_239613 ) ) ( not ( = ?auto_239608 ?auto_239614 ) ) ( not ( = ?auto_239608 ?auto_239615 ) ) ( not ( = ?auto_239608 ?auto_239616 ) ) ( not ( = ?auto_239609 ?auto_239610 ) ) ( not ( = ?auto_239609 ?auto_239611 ) ) ( not ( = ?auto_239609 ?auto_239612 ) ) ( not ( = ?auto_239609 ?auto_239613 ) ) ( not ( = ?auto_239609 ?auto_239614 ) ) ( not ( = ?auto_239609 ?auto_239615 ) ) ( not ( = ?auto_239609 ?auto_239616 ) ) ( not ( = ?auto_239610 ?auto_239611 ) ) ( not ( = ?auto_239610 ?auto_239612 ) ) ( not ( = ?auto_239610 ?auto_239613 ) ) ( not ( = ?auto_239610 ?auto_239614 ) ) ( not ( = ?auto_239610 ?auto_239615 ) ) ( not ( = ?auto_239610 ?auto_239616 ) ) ( not ( = ?auto_239611 ?auto_239612 ) ) ( not ( = ?auto_239611 ?auto_239613 ) ) ( not ( = ?auto_239611 ?auto_239614 ) ) ( not ( = ?auto_239611 ?auto_239615 ) ) ( not ( = ?auto_239611 ?auto_239616 ) ) ( not ( = ?auto_239612 ?auto_239613 ) ) ( not ( = ?auto_239612 ?auto_239614 ) ) ( not ( = ?auto_239612 ?auto_239615 ) ) ( not ( = ?auto_239612 ?auto_239616 ) ) ( not ( = ?auto_239613 ?auto_239614 ) ) ( not ( = ?auto_239613 ?auto_239615 ) ) ( not ( = ?auto_239613 ?auto_239616 ) ) ( not ( = ?auto_239614 ?auto_239615 ) ) ( not ( = ?auto_239614 ?auto_239616 ) ) ( not ( = ?auto_239615 ?auto_239616 ) ) ( ON ?auto_239614 ?auto_239615 ) ( CLEAR ?auto_239612 ) ( ON ?auto_239613 ?auto_239614 ) ( CLEAR ?auto_239613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_239603 ?auto_239604 ?auto_239605 ?auto_239606 ?auto_239607 ?auto_239608 ?auto_239609 ?auto_239610 ?auto_239611 ?auto_239612 ?auto_239613 )
      ( MAKE-13PILE ?auto_239603 ?auto_239604 ?auto_239605 ?auto_239606 ?auto_239607 ?auto_239608 ?auto_239609 ?auto_239610 ?auto_239611 ?auto_239612 ?auto_239613 ?auto_239614 ?auto_239615 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239630 - BLOCK
      ?auto_239631 - BLOCK
      ?auto_239632 - BLOCK
      ?auto_239633 - BLOCK
      ?auto_239634 - BLOCK
      ?auto_239635 - BLOCK
      ?auto_239636 - BLOCK
      ?auto_239637 - BLOCK
      ?auto_239638 - BLOCK
      ?auto_239639 - BLOCK
      ?auto_239640 - BLOCK
      ?auto_239641 - BLOCK
      ?auto_239642 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239642 ) ( ON-TABLE ?auto_239630 ) ( ON ?auto_239631 ?auto_239630 ) ( ON ?auto_239632 ?auto_239631 ) ( ON ?auto_239633 ?auto_239632 ) ( ON ?auto_239634 ?auto_239633 ) ( ON ?auto_239635 ?auto_239634 ) ( ON ?auto_239636 ?auto_239635 ) ( ON ?auto_239637 ?auto_239636 ) ( ON ?auto_239638 ?auto_239637 ) ( ON ?auto_239639 ?auto_239638 ) ( not ( = ?auto_239630 ?auto_239631 ) ) ( not ( = ?auto_239630 ?auto_239632 ) ) ( not ( = ?auto_239630 ?auto_239633 ) ) ( not ( = ?auto_239630 ?auto_239634 ) ) ( not ( = ?auto_239630 ?auto_239635 ) ) ( not ( = ?auto_239630 ?auto_239636 ) ) ( not ( = ?auto_239630 ?auto_239637 ) ) ( not ( = ?auto_239630 ?auto_239638 ) ) ( not ( = ?auto_239630 ?auto_239639 ) ) ( not ( = ?auto_239630 ?auto_239640 ) ) ( not ( = ?auto_239630 ?auto_239641 ) ) ( not ( = ?auto_239630 ?auto_239642 ) ) ( not ( = ?auto_239631 ?auto_239632 ) ) ( not ( = ?auto_239631 ?auto_239633 ) ) ( not ( = ?auto_239631 ?auto_239634 ) ) ( not ( = ?auto_239631 ?auto_239635 ) ) ( not ( = ?auto_239631 ?auto_239636 ) ) ( not ( = ?auto_239631 ?auto_239637 ) ) ( not ( = ?auto_239631 ?auto_239638 ) ) ( not ( = ?auto_239631 ?auto_239639 ) ) ( not ( = ?auto_239631 ?auto_239640 ) ) ( not ( = ?auto_239631 ?auto_239641 ) ) ( not ( = ?auto_239631 ?auto_239642 ) ) ( not ( = ?auto_239632 ?auto_239633 ) ) ( not ( = ?auto_239632 ?auto_239634 ) ) ( not ( = ?auto_239632 ?auto_239635 ) ) ( not ( = ?auto_239632 ?auto_239636 ) ) ( not ( = ?auto_239632 ?auto_239637 ) ) ( not ( = ?auto_239632 ?auto_239638 ) ) ( not ( = ?auto_239632 ?auto_239639 ) ) ( not ( = ?auto_239632 ?auto_239640 ) ) ( not ( = ?auto_239632 ?auto_239641 ) ) ( not ( = ?auto_239632 ?auto_239642 ) ) ( not ( = ?auto_239633 ?auto_239634 ) ) ( not ( = ?auto_239633 ?auto_239635 ) ) ( not ( = ?auto_239633 ?auto_239636 ) ) ( not ( = ?auto_239633 ?auto_239637 ) ) ( not ( = ?auto_239633 ?auto_239638 ) ) ( not ( = ?auto_239633 ?auto_239639 ) ) ( not ( = ?auto_239633 ?auto_239640 ) ) ( not ( = ?auto_239633 ?auto_239641 ) ) ( not ( = ?auto_239633 ?auto_239642 ) ) ( not ( = ?auto_239634 ?auto_239635 ) ) ( not ( = ?auto_239634 ?auto_239636 ) ) ( not ( = ?auto_239634 ?auto_239637 ) ) ( not ( = ?auto_239634 ?auto_239638 ) ) ( not ( = ?auto_239634 ?auto_239639 ) ) ( not ( = ?auto_239634 ?auto_239640 ) ) ( not ( = ?auto_239634 ?auto_239641 ) ) ( not ( = ?auto_239634 ?auto_239642 ) ) ( not ( = ?auto_239635 ?auto_239636 ) ) ( not ( = ?auto_239635 ?auto_239637 ) ) ( not ( = ?auto_239635 ?auto_239638 ) ) ( not ( = ?auto_239635 ?auto_239639 ) ) ( not ( = ?auto_239635 ?auto_239640 ) ) ( not ( = ?auto_239635 ?auto_239641 ) ) ( not ( = ?auto_239635 ?auto_239642 ) ) ( not ( = ?auto_239636 ?auto_239637 ) ) ( not ( = ?auto_239636 ?auto_239638 ) ) ( not ( = ?auto_239636 ?auto_239639 ) ) ( not ( = ?auto_239636 ?auto_239640 ) ) ( not ( = ?auto_239636 ?auto_239641 ) ) ( not ( = ?auto_239636 ?auto_239642 ) ) ( not ( = ?auto_239637 ?auto_239638 ) ) ( not ( = ?auto_239637 ?auto_239639 ) ) ( not ( = ?auto_239637 ?auto_239640 ) ) ( not ( = ?auto_239637 ?auto_239641 ) ) ( not ( = ?auto_239637 ?auto_239642 ) ) ( not ( = ?auto_239638 ?auto_239639 ) ) ( not ( = ?auto_239638 ?auto_239640 ) ) ( not ( = ?auto_239638 ?auto_239641 ) ) ( not ( = ?auto_239638 ?auto_239642 ) ) ( not ( = ?auto_239639 ?auto_239640 ) ) ( not ( = ?auto_239639 ?auto_239641 ) ) ( not ( = ?auto_239639 ?auto_239642 ) ) ( not ( = ?auto_239640 ?auto_239641 ) ) ( not ( = ?auto_239640 ?auto_239642 ) ) ( not ( = ?auto_239641 ?auto_239642 ) ) ( ON ?auto_239641 ?auto_239642 ) ( CLEAR ?auto_239639 ) ( ON ?auto_239640 ?auto_239641 ) ( CLEAR ?auto_239640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_239630 ?auto_239631 ?auto_239632 ?auto_239633 ?auto_239634 ?auto_239635 ?auto_239636 ?auto_239637 ?auto_239638 ?auto_239639 ?auto_239640 )
      ( MAKE-13PILE ?auto_239630 ?auto_239631 ?auto_239632 ?auto_239633 ?auto_239634 ?auto_239635 ?auto_239636 ?auto_239637 ?auto_239638 ?auto_239639 ?auto_239640 ?auto_239641 ?auto_239642 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239656 - BLOCK
      ?auto_239657 - BLOCK
      ?auto_239658 - BLOCK
      ?auto_239659 - BLOCK
      ?auto_239660 - BLOCK
      ?auto_239661 - BLOCK
      ?auto_239662 - BLOCK
      ?auto_239663 - BLOCK
      ?auto_239664 - BLOCK
      ?auto_239665 - BLOCK
      ?auto_239666 - BLOCK
      ?auto_239667 - BLOCK
      ?auto_239668 - BLOCK
    )
    :vars
    (
      ?auto_239669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239668 ?auto_239669 ) ( ON-TABLE ?auto_239656 ) ( ON ?auto_239657 ?auto_239656 ) ( ON ?auto_239658 ?auto_239657 ) ( ON ?auto_239659 ?auto_239658 ) ( ON ?auto_239660 ?auto_239659 ) ( ON ?auto_239661 ?auto_239660 ) ( ON ?auto_239662 ?auto_239661 ) ( ON ?auto_239663 ?auto_239662 ) ( ON ?auto_239664 ?auto_239663 ) ( not ( = ?auto_239656 ?auto_239657 ) ) ( not ( = ?auto_239656 ?auto_239658 ) ) ( not ( = ?auto_239656 ?auto_239659 ) ) ( not ( = ?auto_239656 ?auto_239660 ) ) ( not ( = ?auto_239656 ?auto_239661 ) ) ( not ( = ?auto_239656 ?auto_239662 ) ) ( not ( = ?auto_239656 ?auto_239663 ) ) ( not ( = ?auto_239656 ?auto_239664 ) ) ( not ( = ?auto_239656 ?auto_239665 ) ) ( not ( = ?auto_239656 ?auto_239666 ) ) ( not ( = ?auto_239656 ?auto_239667 ) ) ( not ( = ?auto_239656 ?auto_239668 ) ) ( not ( = ?auto_239656 ?auto_239669 ) ) ( not ( = ?auto_239657 ?auto_239658 ) ) ( not ( = ?auto_239657 ?auto_239659 ) ) ( not ( = ?auto_239657 ?auto_239660 ) ) ( not ( = ?auto_239657 ?auto_239661 ) ) ( not ( = ?auto_239657 ?auto_239662 ) ) ( not ( = ?auto_239657 ?auto_239663 ) ) ( not ( = ?auto_239657 ?auto_239664 ) ) ( not ( = ?auto_239657 ?auto_239665 ) ) ( not ( = ?auto_239657 ?auto_239666 ) ) ( not ( = ?auto_239657 ?auto_239667 ) ) ( not ( = ?auto_239657 ?auto_239668 ) ) ( not ( = ?auto_239657 ?auto_239669 ) ) ( not ( = ?auto_239658 ?auto_239659 ) ) ( not ( = ?auto_239658 ?auto_239660 ) ) ( not ( = ?auto_239658 ?auto_239661 ) ) ( not ( = ?auto_239658 ?auto_239662 ) ) ( not ( = ?auto_239658 ?auto_239663 ) ) ( not ( = ?auto_239658 ?auto_239664 ) ) ( not ( = ?auto_239658 ?auto_239665 ) ) ( not ( = ?auto_239658 ?auto_239666 ) ) ( not ( = ?auto_239658 ?auto_239667 ) ) ( not ( = ?auto_239658 ?auto_239668 ) ) ( not ( = ?auto_239658 ?auto_239669 ) ) ( not ( = ?auto_239659 ?auto_239660 ) ) ( not ( = ?auto_239659 ?auto_239661 ) ) ( not ( = ?auto_239659 ?auto_239662 ) ) ( not ( = ?auto_239659 ?auto_239663 ) ) ( not ( = ?auto_239659 ?auto_239664 ) ) ( not ( = ?auto_239659 ?auto_239665 ) ) ( not ( = ?auto_239659 ?auto_239666 ) ) ( not ( = ?auto_239659 ?auto_239667 ) ) ( not ( = ?auto_239659 ?auto_239668 ) ) ( not ( = ?auto_239659 ?auto_239669 ) ) ( not ( = ?auto_239660 ?auto_239661 ) ) ( not ( = ?auto_239660 ?auto_239662 ) ) ( not ( = ?auto_239660 ?auto_239663 ) ) ( not ( = ?auto_239660 ?auto_239664 ) ) ( not ( = ?auto_239660 ?auto_239665 ) ) ( not ( = ?auto_239660 ?auto_239666 ) ) ( not ( = ?auto_239660 ?auto_239667 ) ) ( not ( = ?auto_239660 ?auto_239668 ) ) ( not ( = ?auto_239660 ?auto_239669 ) ) ( not ( = ?auto_239661 ?auto_239662 ) ) ( not ( = ?auto_239661 ?auto_239663 ) ) ( not ( = ?auto_239661 ?auto_239664 ) ) ( not ( = ?auto_239661 ?auto_239665 ) ) ( not ( = ?auto_239661 ?auto_239666 ) ) ( not ( = ?auto_239661 ?auto_239667 ) ) ( not ( = ?auto_239661 ?auto_239668 ) ) ( not ( = ?auto_239661 ?auto_239669 ) ) ( not ( = ?auto_239662 ?auto_239663 ) ) ( not ( = ?auto_239662 ?auto_239664 ) ) ( not ( = ?auto_239662 ?auto_239665 ) ) ( not ( = ?auto_239662 ?auto_239666 ) ) ( not ( = ?auto_239662 ?auto_239667 ) ) ( not ( = ?auto_239662 ?auto_239668 ) ) ( not ( = ?auto_239662 ?auto_239669 ) ) ( not ( = ?auto_239663 ?auto_239664 ) ) ( not ( = ?auto_239663 ?auto_239665 ) ) ( not ( = ?auto_239663 ?auto_239666 ) ) ( not ( = ?auto_239663 ?auto_239667 ) ) ( not ( = ?auto_239663 ?auto_239668 ) ) ( not ( = ?auto_239663 ?auto_239669 ) ) ( not ( = ?auto_239664 ?auto_239665 ) ) ( not ( = ?auto_239664 ?auto_239666 ) ) ( not ( = ?auto_239664 ?auto_239667 ) ) ( not ( = ?auto_239664 ?auto_239668 ) ) ( not ( = ?auto_239664 ?auto_239669 ) ) ( not ( = ?auto_239665 ?auto_239666 ) ) ( not ( = ?auto_239665 ?auto_239667 ) ) ( not ( = ?auto_239665 ?auto_239668 ) ) ( not ( = ?auto_239665 ?auto_239669 ) ) ( not ( = ?auto_239666 ?auto_239667 ) ) ( not ( = ?auto_239666 ?auto_239668 ) ) ( not ( = ?auto_239666 ?auto_239669 ) ) ( not ( = ?auto_239667 ?auto_239668 ) ) ( not ( = ?auto_239667 ?auto_239669 ) ) ( not ( = ?auto_239668 ?auto_239669 ) ) ( ON ?auto_239667 ?auto_239668 ) ( ON ?auto_239666 ?auto_239667 ) ( CLEAR ?auto_239664 ) ( ON ?auto_239665 ?auto_239666 ) ( CLEAR ?auto_239665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_239656 ?auto_239657 ?auto_239658 ?auto_239659 ?auto_239660 ?auto_239661 ?auto_239662 ?auto_239663 ?auto_239664 ?auto_239665 )
      ( MAKE-13PILE ?auto_239656 ?auto_239657 ?auto_239658 ?auto_239659 ?auto_239660 ?auto_239661 ?auto_239662 ?auto_239663 ?auto_239664 ?auto_239665 ?auto_239666 ?auto_239667 ?auto_239668 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239683 - BLOCK
      ?auto_239684 - BLOCK
      ?auto_239685 - BLOCK
      ?auto_239686 - BLOCK
      ?auto_239687 - BLOCK
      ?auto_239688 - BLOCK
      ?auto_239689 - BLOCK
      ?auto_239690 - BLOCK
      ?auto_239691 - BLOCK
      ?auto_239692 - BLOCK
      ?auto_239693 - BLOCK
      ?auto_239694 - BLOCK
      ?auto_239695 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239695 ) ( ON-TABLE ?auto_239683 ) ( ON ?auto_239684 ?auto_239683 ) ( ON ?auto_239685 ?auto_239684 ) ( ON ?auto_239686 ?auto_239685 ) ( ON ?auto_239687 ?auto_239686 ) ( ON ?auto_239688 ?auto_239687 ) ( ON ?auto_239689 ?auto_239688 ) ( ON ?auto_239690 ?auto_239689 ) ( ON ?auto_239691 ?auto_239690 ) ( not ( = ?auto_239683 ?auto_239684 ) ) ( not ( = ?auto_239683 ?auto_239685 ) ) ( not ( = ?auto_239683 ?auto_239686 ) ) ( not ( = ?auto_239683 ?auto_239687 ) ) ( not ( = ?auto_239683 ?auto_239688 ) ) ( not ( = ?auto_239683 ?auto_239689 ) ) ( not ( = ?auto_239683 ?auto_239690 ) ) ( not ( = ?auto_239683 ?auto_239691 ) ) ( not ( = ?auto_239683 ?auto_239692 ) ) ( not ( = ?auto_239683 ?auto_239693 ) ) ( not ( = ?auto_239683 ?auto_239694 ) ) ( not ( = ?auto_239683 ?auto_239695 ) ) ( not ( = ?auto_239684 ?auto_239685 ) ) ( not ( = ?auto_239684 ?auto_239686 ) ) ( not ( = ?auto_239684 ?auto_239687 ) ) ( not ( = ?auto_239684 ?auto_239688 ) ) ( not ( = ?auto_239684 ?auto_239689 ) ) ( not ( = ?auto_239684 ?auto_239690 ) ) ( not ( = ?auto_239684 ?auto_239691 ) ) ( not ( = ?auto_239684 ?auto_239692 ) ) ( not ( = ?auto_239684 ?auto_239693 ) ) ( not ( = ?auto_239684 ?auto_239694 ) ) ( not ( = ?auto_239684 ?auto_239695 ) ) ( not ( = ?auto_239685 ?auto_239686 ) ) ( not ( = ?auto_239685 ?auto_239687 ) ) ( not ( = ?auto_239685 ?auto_239688 ) ) ( not ( = ?auto_239685 ?auto_239689 ) ) ( not ( = ?auto_239685 ?auto_239690 ) ) ( not ( = ?auto_239685 ?auto_239691 ) ) ( not ( = ?auto_239685 ?auto_239692 ) ) ( not ( = ?auto_239685 ?auto_239693 ) ) ( not ( = ?auto_239685 ?auto_239694 ) ) ( not ( = ?auto_239685 ?auto_239695 ) ) ( not ( = ?auto_239686 ?auto_239687 ) ) ( not ( = ?auto_239686 ?auto_239688 ) ) ( not ( = ?auto_239686 ?auto_239689 ) ) ( not ( = ?auto_239686 ?auto_239690 ) ) ( not ( = ?auto_239686 ?auto_239691 ) ) ( not ( = ?auto_239686 ?auto_239692 ) ) ( not ( = ?auto_239686 ?auto_239693 ) ) ( not ( = ?auto_239686 ?auto_239694 ) ) ( not ( = ?auto_239686 ?auto_239695 ) ) ( not ( = ?auto_239687 ?auto_239688 ) ) ( not ( = ?auto_239687 ?auto_239689 ) ) ( not ( = ?auto_239687 ?auto_239690 ) ) ( not ( = ?auto_239687 ?auto_239691 ) ) ( not ( = ?auto_239687 ?auto_239692 ) ) ( not ( = ?auto_239687 ?auto_239693 ) ) ( not ( = ?auto_239687 ?auto_239694 ) ) ( not ( = ?auto_239687 ?auto_239695 ) ) ( not ( = ?auto_239688 ?auto_239689 ) ) ( not ( = ?auto_239688 ?auto_239690 ) ) ( not ( = ?auto_239688 ?auto_239691 ) ) ( not ( = ?auto_239688 ?auto_239692 ) ) ( not ( = ?auto_239688 ?auto_239693 ) ) ( not ( = ?auto_239688 ?auto_239694 ) ) ( not ( = ?auto_239688 ?auto_239695 ) ) ( not ( = ?auto_239689 ?auto_239690 ) ) ( not ( = ?auto_239689 ?auto_239691 ) ) ( not ( = ?auto_239689 ?auto_239692 ) ) ( not ( = ?auto_239689 ?auto_239693 ) ) ( not ( = ?auto_239689 ?auto_239694 ) ) ( not ( = ?auto_239689 ?auto_239695 ) ) ( not ( = ?auto_239690 ?auto_239691 ) ) ( not ( = ?auto_239690 ?auto_239692 ) ) ( not ( = ?auto_239690 ?auto_239693 ) ) ( not ( = ?auto_239690 ?auto_239694 ) ) ( not ( = ?auto_239690 ?auto_239695 ) ) ( not ( = ?auto_239691 ?auto_239692 ) ) ( not ( = ?auto_239691 ?auto_239693 ) ) ( not ( = ?auto_239691 ?auto_239694 ) ) ( not ( = ?auto_239691 ?auto_239695 ) ) ( not ( = ?auto_239692 ?auto_239693 ) ) ( not ( = ?auto_239692 ?auto_239694 ) ) ( not ( = ?auto_239692 ?auto_239695 ) ) ( not ( = ?auto_239693 ?auto_239694 ) ) ( not ( = ?auto_239693 ?auto_239695 ) ) ( not ( = ?auto_239694 ?auto_239695 ) ) ( ON ?auto_239694 ?auto_239695 ) ( ON ?auto_239693 ?auto_239694 ) ( CLEAR ?auto_239691 ) ( ON ?auto_239692 ?auto_239693 ) ( CLEAR ?auto_239692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_239683 ?auto_239684 ?auto_239685 ?auto_239686 ?auto_239687 ?auto_239688 ?auto_239689 ?auto_239690 ?auto_239691 ?auto_239692 )
      ( MAKE-13PILE ?auto_239683 ?auto_239684 ?auto_239685 ?auto_239686 ?auto_239687 ?auto_239688 ?auto_239689 ?auto_239690 ?auto_239691 ?auto_239692 ?auto_239693 ?auto_239694 ?auto_239695 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239709 - BLOCK
      ?auto_239710 - BLOCK
      ?auto_239711 - BLOCK
      ?auto_239712 - BLOCK
      ?auto_239713 - BLOCK
      ?auto_239714 - BLOCK
      ?auto_239715 - BLOCK
      ?auto_239716 - BLOCK
      ?auto_239717 - BLOCK
      ?auto_239718 - BLOCK
      ?auto_239719 - BLOCK
      ?auto_239720 - BLOCK
      ?auto_239721 - BLOCK
    )
    :vars
    (
      ?auto_239722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239721 ?auto_239722 ) ( ON-TABLE ?auto_239709 ) ( ON ?auto_239710 ?auto_239709 ) ( ON ?auto_239711 ?auto_239710 ) ( ON ?auto_239712 ?auto_239711 ) ( ON ?auto_239713 ?auto_239712 ) ( ON ?auto_239714 ?auto_239713 ) ( ON ?auto_239715 ?auto_239714 ) ( ON ?auto_239716 ?auto_239715 ) ( not ( = ?auto_239709 ?auto_239710 ) ) ( not ( = ?auto_239709 ?auto_239711 ) ) ( not ( = ?auto_239709 ?auto_239712 ) ) ( not ( = ?auto_239709 ?auto_239713 ) ) ( not ( = ?auto_239709 ?auto_239714 ) ) ( not ( = ?auto_239709 ?auto_239715 ) ) ( not ( = ?auto_239709 ?auto_239716 ) ) ( not ( = ?auto_239709 ?auto_239717 ) ) ( not ( = ?auto_239709 ?auto_239718 ) ) ( not ( = ?auto_239709 ?auto_239719 ) ) ( not ( = ?auto_239709 ?auto_239720 ) ) ( not ( = ?auto_239709 ?auto_239721 ) ) ( not ( = ?auto_239709 ?auto_239722 ) ) ( not ( = ?auto_239710 ?auto_239711 ) ) ( not ( = ?auto_239710 ?auto_239712 ) ) ( not ( = ?auto_239710 ?auto_239713 ) ) ( not ( = ?auto_239710 ?auto_239714 ) ) ( not ( = ?auto_239710 ?auto_239715 ) ) ( not ( = ?auto_239710 ?auto_239716 ) ) ( not ( = ?auto_239710 ?auto_239717 ) ) ( not ( = ?auto_239710 ?auto_239718 ) ) ( not ( = ?auto_239710 ?auto_239719 ) ) ( not ( = ?auto_239710 ?auto_239720 ) ) ( not ( = ?auto_239710 ?auto_239721 ) ) ( not ( = ?auto_239710 ?auto_239722 ) ) ( not ( = ?auto_239711 ?auto_239712 ) ) ( not ( = ?auto_239711 ?auto_239713 ) ) ( not ( = ?auto_239711 ?auto_239714 ) ) ( not ( = ?auto_239711 ?auto_239715 ) ) ( not ( = ?auto_239711 ?auto_239716 ) ) ( not ( = ?auto_239711 ?auto_239717 ) ) ( not ( = ?auto_239711 ?auto_239718 ) ) ( not ( = ?auto_239711 ?auto_239719 ) ) ( not ( = ?auto_239711 ?auto_239720 ) ) ( not ( = ?auto_239711 ?auto_239721 ) ) ( not ( = ?auto_239711 ?auto_239722 ) ) ( not ( = ?auto_239712 ?auto_239713 ) ) ( not ( = ?auto_239712 ?auto_239714 ) ) ( not ( = ?auto_239712 ?auto_239715 ) ) ( not ( = ?auto_239712 ?auto_239716 ) ) ( not ( = ?auto_239712 ?auto_239717 ) ) ( not ( = ?auto_239712 ?auto_239718 ) ) ( not ( = ?auto_239712 ?auto_239719 ) ) ( not ( = ?auto_239712 ?auto_239720 ) ) ( not ( = ?auto_239712 ?auto_239721 ) ) ( not ( = ?auto_239712 ?auto_239722 ) ) ( not ( = ?auto_239713 ?auto_239714 ) ) ( not ( = ?auto_239713 ?auto_239715 ) ) ( not ( = ?auto_239713 ?auto_239716 ) ) ( not ( = ?auto_239713 ?auto_239717 ) ) ( not ( = ?auto_239713 ?auto_239718 ) ) ( not ( = ?auto_239713 ?auto_239719 ) ) ( not ( = ?auto_239713 ?auto_239720 ) ) ( not ( = ?auto_239713 ?auto_239721 ) ) ( not ( = ?auto_239713 ?auto_239722 ) ) ( not ( = ?auto_239714 ?auto_239715 ) ) ( not ( = ?auto_239714 ?auto_239716 ) ) ( not ( = ?auto_239714 ?auto_239717 ) ) ( not ( = ?auto_239714 ?auto_239718 ) ) ( not ( = ?auto_239714 ?auto_239719 ) ) ( not ( = ?auto_239714 ?auto_239720 ) ) ( not ( = ?auto_239714 ?auto_239721 ) ) ( not ( = ?auto_239714 ?auto_239722 ) ) ( not ( = ?auto_239715 ?auto_239716 ) ) ( not ( = ?auto_239715 ?auto_239717 ) ) ( not ( = ?auto_239715 ?auto_239718 ) ) ( not ( = ?auto_239715 ?auto_239719 ) ) ( not ( = ?auto_239715 ?auto_239720 ) ) ( not ( = ?auto_239715 ?auto_239721 ) ) ( not ( = ?auto_239715 ?auto_239722 ) ) ( not ( = ?auto_239716 ?auto_239717 ) ) ( not ( = ?auto_239716 ?auto_239718 ) ) ( not ( = ?auto_239716 ?auto_239719 ) ) ( not ( = ?auto_239716 ?auto_239720 ) ) ( not ( = ?auto_239716 ?auto_239721 ) ) ( not ( = ?auto_239716 ?auto_239722 ) ) ( not ( = ?auto_239717 ?auto_239718 ) ) ( not ( = ?auto_239717 ?auto_239719 ) ) ( not ( = ?auto_239717 ?auto_239720 ) ) ( not ( = ?auto_239717 ?auto_239721 ) ) ( not ( = ?auto_239717 ?auto_239722 ) ) ( not ( = ?auto_239718 ?auto_239719 ) ) ( not ( = ?auto_239718 ?auto_239720 ) ) ( not ( = ?auto_239718 ?auto_239721 ) ) ( not ( = ?auto_239718 ?auto_239722 ) ) ( not ( = ?auto_239719 ?auto_239720 ) ) ( not ( = ?auto_239719 ?auto_239721 ) ) ( not ( = ?auto_239719 ?auto_239722 ) ) ( not ( = ?auto_239720 ?auto_239721 ) ) ( not ( = ?auto_239720 ?auto_239722 ) ) ( not ( = ?auto_239721 ?auto_239722 ) ) ( ON ?auto_239720 ?auto_239721 ) ( ON ?auto_239719 ?auto_239720 ) ( ON ?auto_239718 ?auto_239719 ) ( CLEAR ?auto_239716 ) ( ON ?auto_239717 ?auto_239718 ) ( CLEAR ?auto_239717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_239709 ?auto_239710 ?auto_239711 ?auto_239712 ?auto_239713 ?auto_239714 ?auto_239715 ?auto_239716 ?auto_239717 )
      ( MAKE-13PILE ?auto_239709 ?auto_239710 ?auto_239711 ?auto_239712 ?auto_239713 ?auto_239714 ?auto_239715 ?auto_239716 ?auto_239717 ?auto_239718 ?auto_239719 ?auto_239720 ?auto_239721 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239736 - BLOCK
      ?auto_239737 - BLOCK
      ?auto_239738 - BLOCK
      ?auto_239739 - BLOCK
      ?auto_239740 - BLOCK
      ?auto_239741 - BLOCK
      ?auto_239742 - BLOCK
      ?auto_239743 - BLOCK
      ?auto_239744 - BLOCK
      ?auto_239745 - BLOCK
      ?auto_239746 - BLOCK
      ?auto_239747 - BLOCK
      ?auto_239748 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239748 ) ( ON-TABLE ?auto_239736 ) ( ON ?auto_239737 ?auto_239736 ) ( ON ?auto_239738 ?auto_239737 ) ( ON ?auto_239739 ?auto_239738 ) ( ON ?auto_239740 ?auto_239739 ) ( ON ?auto_239741 ?auto_239740 ) ( ON ?auto_239742 ?auto_239741 ) ( ON ?auto_239743 ?auto_239742 ) ( not ( = ?auto_239736 ?auto_239737 ) ) ( not ( = ?auto_239736 ?auto_239738 ) ) ( not ( = ?auto_239736 ?auto_239739 ) ) ( not ( = ?auto_239736 ?auto_239740 ) ) ( not ( = ?auto_239736 ?auto_239741 ) ) ( not ( = ?auto_239736 ?auto_239742 ) ) ( not ( = ?auto_239736 ?auto_239743 ) ) ( not ( = ?auto_239736 ?auto_239744 ) ) ( not ( = ?auto_239736 ?auto_239745 ) ) ( not ( = ?auto_239736 ?auto_239746 ) ) ( not ( = ?auto_239736 ?auto_239747 ) ) ( not ( = ?auto_239736 ?auto_239748 ) ) ( not ( = ?auto_239737 ?auto_239738 ) ) ( not ( = ?auto_239737 ?auto_239739 ) ) ( not ( = ?auto_239737 ?auto_239740 ) ) ( not ( = ?auto_239737 ?auto_239741 ) ) ( not ( = ?auto_239737 ?auto_239742 ) ) ( not ( = ?auto_239737 ?auto_239743 ) ) ( not ( = ?auto_239737 ?auto_239744 ) ) ( not ( = ?auto_239737 ?auto_239745 ) ) ( not ( = ?auto_239737 ?auto_239746 ) ) ( not ( = ?auto_239737 ?auto_239747 ) ) ( not ( = ?auto_239737 ?auto_239748 ) ) ( not ( = ?auto_239738 ?auto_239739 ) ) ( not ( = ?auto_239738 ?auto_239740 ) ) ( not ( = ?auto_239738 ?auto_239741 ) ) ( not ( = ?auto_239738 ?auto_239742 ) ) ( not ( = ?auto_239738 ?auto_239743 ) ) ( not ( = ?auto_239738 ?auto_239744 ) ) ( not ( = ?auto_239738 ?auto_239745 ) ) ( not ( = ?auto_239738 ?auto_239746 ) ) ( not ( = ?auto_239738 ?auto_239747 ) ) ( not ( = ?auto_239738 ?auto_239748 ) ) ( not ( = ?auto_239739 ?auto_239740 ) ) ( not ( = ?auto_239739 ?auto_239741 ) ) ( not ( = ?auto_239739 ?auto_239742 ) ) ( not ( = ?auto_239739 ?auto_239743 ) ) ( not ( = ?auto_239739 ?auto_239744 ) ) ( not ( = ?auto_239739 ?auto_239745 ) ) ( not ( = ?auto_239739 ?auto_239746 ) ) ( not ( = ?auto_239739 ?auto_239747 ) ) ( not ( = ?auto_239739 ?auto_239748 ) ) ( not ( = ?auto_239740 ?auto_239741 ) ) ( not ( = ?auto_239740 ?auto_239742 ) ) ( not ( = ?auto_239740 ?auto_239743 ) ) ( not ( = ?auto_239740 ?auto_239744 ) ) ( not ( = ?auto_239740 ?auto_239745 ) ) ( not ( = ?auto_239740 ?auto_239746 ) ) ( not ( = ?auto_239740 ?auto_239747 ) ) ( not ( = ?auto_239740 ?auto_239748 ) ) ( not ( = ?auto_239741 ?auto_239742 ) ) ( not ( = ?auto_239741 ?auto_239743 ) ) ( not ( = ?auto_239741 ?auto_239744 ) ) ( not ( = ?auto_239741 ?auto_239745 ) ) ( not ( = ?auto_239741 ?auto_239746 ) ) ( not ( = ?auto_239741 ?auto_239747 ) ) ( not ( = ?auto_239741 ?auto_239748 ) ) ( not ( = ?auto_239742 ?auto_239743 ) ) ( not ( = ?auto_239742 ?auto_239744 ) ) ( not ( = ?auto_239742 ?auto_239745 ) ) ( not ( = ?auto_239742 ?auto_239746 ) ) ( not ( = ?auto_239742 ?auto_239747 ) ) ( not ( = ?auto_239742 ?auto_239748 ) ) ( not ( = ?auto_239743 ?auto_239744 ) ) ( not ( = ?auto_239743 ?auto_239745 ) ) ( not ( = ?auto_239743 ?auto_239746 ) ) ( not ( = ?auto_239743 ?auto_239747 ) ) ( not ( = ?auto_239743 ?auto_239748 ) ) ( not ( = ?auto_239744 ?auto_239745 ) ) ( not ( = ?auto_239744 ?auto_239746 ) ) ( not ( = ?auto_239744 ?auto_239747 ) ) ( not ( = ?auto_239744 ?auto_239748 ) ) ( not ( = ?auto_239745 ?auto_239746 ) ) ( not ( = ?auto_239745 ?auto_239747 ) ) ( not ( = ?auto_239745 ?auto_239748 ) ) ( not ( = ?auto_239746 ?auto_239747 ) ) ( not ( = ?auto_239746 ?auto_239748 ) ) ( not ( = ?auto_239747 ?auto_239748 ) ) ( ON ?auto_239747 ?auto_239748 ) ( ON ?auto_239746 ?auto_239747 ) ( ON ?auto_239745 ?auto_239746 ) ( CLEAR ?auto_239743 ) ( ON ?auto_239744 ?auto_239745 ) ( CLEAR ?auto_239744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_239736 ?auto_239737 ?auto_239738 ?auto_239739 ?auto_239740 ?auto_239741 ?auto_239742 ?auto_239743 ?auto_239744 )
      ( MAKE-13PILE ?auto_239736 ?auto_239737 ?auto_239738 ?auto_239739 ?auto_239740 ?auto_239741 ?auto_239742 ?auto_239743 ?auto_239744 ?auto_239745 ?auto_239746 ?auto_239747 ?auto_239748 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239762 - BLOCK
      ?auto_239763 - BLOCK
      ?auto_239764 - BLOCK
      ?auto_239765 - BLOCK
      ?auto_239766 - BLOCK
      ?auto_239767 - BLOCK
      ?auto_239768 - BLOCK
      ?auto_239769 - BLOCK
      ?auto_239770 - BLOCK
      ?auto_239771 - BLOCK
      ?auto_239772 - BLOCK
      ?auto_239773 - BLOCK
      ?auto_239774 - BLOCK
    )
    :vars
    (
      ?auto_239775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239774 ?auto_239775 ) ( ON-TABLE ?auto_239762 ) ( ON ?auto_239763 ?auto_239762 ) ( ON ?auto_239764 ?auto_239763 ) ( ON ?auto_239765 ?auto_239764 ) ( ON ?auto_239766 ?auto_239765 ) ( ON ?auto_239767 ?auto_239766 ) ( ON ?auto_239768 ?auto_239767 ) ( not ( = ?auto_239762 ?auto_239763 ) ) ( not ( = ?auto_239762 ?auto_239764 ) ) ( not ( = ?auto_239762 ?auto_239765 ) ) ( not ( = ?auto_239762 ?auto_239766 ) ) ( not ( = ?auto_239762 ?auto_239767 ) ) ( not ( = ?auto_239762 ?auto_239768 ) ) ( not ( = ?auto_239762 ?auto_239769 ) ) ( not ( = ?auto_239762 ?auto_239770 ) ) ( not ( = ?auto_239762 ?auto_239771 ) ) ( not ( = ?auto_239762 ?auto_239772 ) ) ( not ( = ?auto_239762 ?auto_239773 ) ) ( not ( = ?auto_239762 ?auto_239774 ) ) ( not ( = ?auto_239762 ?auto_239775 ) ) ( not ( = ?auto_239763 ?auto_239764 ) ) ( not ( = ?auto_239763 ?auto_239765 ) ) ( not ( = ?auto_239763 ?auto_239766 ) ) ( not ( = ?auto_239763 ?auto_239767 ) ) ( not ( = ?auto_239763 ?auto_239768 ) ) ( not ( = ?auto_239763 ?auto_239769 ) ) ( not ( = ?auto_239763 ?auto_239770 ) ) ( not ( = ?auto_239763 ?auto_239771 ) ) ( not ( = ?auto_239763 ?auto_239772 ) ) ( not ( = ?auto_239763 ?auto_239773 ) ) ( not ( = ?auto_239763 ?auto_239774 ) ) ( not ( = ?auto_239763 ?auto_239775 ) ) ( not ( = ?auto_239764 ?auto_239765 ) ) ( not ( = ?auto_239764 ?auto_239766 ) ) ( not ( = ?auto_239764 ?auto_239767 ) ) ( not ( = ?auto_239764 ?auto_239768 ) ) ( not ( = ?auto_239764 ?auto_239769 ) ) ( not ( = ?auto_239764 ?auto_239770 ) ) ( not ( = ?auto_239764 ?auto_239771 ) ) ( not ( = ?auto_239764 ?auto_239772 ) ) ( not ( = ?auto_239764 ?auto_239773 ) ) ( not ( = ?auto_239764 ?auto_239774 ) ) ( not ( = ?auto_239764 ?auto_239775 ) ) ( not ( = ?auto_239765 ?auto_239766 ) ) ( not ( = ?auto_239765 ?auto_239767 ) ) ( not ( = ?auto_239765 ?auto_239768 ) ) ( not ( = ?auto_239765 ?auto_239769 ) ) ( not ( = ?auto_239765 ?auto_239770 ) ) ( not ( = ?auto_239765 ?auto_239771 ) ) ( not ( = ?auto_239765 ?auto_239772 ) ) ( not ( = ?auto_239765 ?auto_239773 ) ) ( not ( = ?auto_239765 ?auto_239774 ) ) ( not ( = ?auto_239765 ?auto_239775 ) ) ( not ( = ?auto_239766 ?auto_239767 ) ) ( not ( = ?auto_239766 ?auto_239768 ) ) ( not ( = ?auto_239766 ?auto_239769 ) ) ( not ( = ?auto_239766 ?auto_239770 ) ) ( not ( = ?auto_239766 ?auto_239771 ) ) ( not ( = ?auto_239766 ?auto_239772 ) ) ( not ( = ?auto_239766 ?auto_239773 ) ) ( not ( = ?auto_239766 ?auto_239774 ) ) ( not ( = ?auto_239766 ?auto_239775 ) ) ( not ( = ?auto_239767 ?auto_239768 ) ) ( not ( = ?auto_239767 ?auto_239769 ) ) ( not ( = ?auto_239767 ?auto_239770 ) ) ( not ( = ?auto_239767 ?auto_239771 ) ) ( not ( = ?auto_239767 ?auto_239772 ) ) ( not ( = ?auto_239767 ?auto_239773 ) ) ( not ( = ?auto_239767 ?auto_239774 ) ) ( not ( = ?auto_239767 ?auto_239775 ) ) ( not ( = ?auto_239768 ?auto_239769 ) ) ( not ( = ?auto_239768 ?auto_239770 ) ) ( not ( = ?auto_239768 ?auto_239771 ) ) ( not ( = ?auto_239768 ?auto_239772 ) ) ( not ( = ?auto_239768 ?auto_239773 ) ) ( not ( = ?auto_239768 ?auto_239774 ) ) ( not ( = ?auto_239768 ?auto_239775 ) ) ( not ( = ?auto_239769 ?auto_239770 ) ) ( not ( = ?auto_239769 ?auto_239771 ) ) ( not ( = ?auto_239769 ?auto_239772 ) ) ( not ( = ?auto_239769 ?auto_239773 ) ) ( not ( = ?auto_239769 ?auto_239774 ) ) ( not ( = ?auto_239769 ?auto_239775 ) ) ( not ( = ?auto_239770 ?auto_239771 ) ) ( not ( = ?auto_239770 ?auto_239772 ) ) ( not ( = ?auto_239770 ?auto_239773 ) ) ( not ( = ?auto_239770 ?auto_239774 ) ) ( not ( = ?auto_239770 ?auto_239775 ) ) ( not ( = ?auto_239771 ?auto_239772 ) ) ( not ( = ?auto_239771 ?auto_239773 ) ) ( not ( = ?auto_239771 ?auto_239774 ) ) ( not ( = ?auto_239771 ?auto_239775 ) ) ( not ( = ?auto_239772 ?auto_239773 ) ) ( not ( = ?auto_239772 ?auto_239774 ) ) ( not ( = ?auto_239772 ?auto_239775 ) ) ( not ( = ?auto_239773 ?auto_239774 ) ) ( not ( = ?auto_239773 ?auto_239775 ) ) ( not ( = ?auto_239774 ?auto_239775 ) ) ( ON ?auto_239773 ?auto_239774 ) ( ON ?auto_239772 ?auto_239773 ) ( ON ?auto_239771 ?auto_239772 ) ( ON ?auto_239770 ?auto_239771 ) ( CLEAR ?auto_239768 ) ( ON ?auto_239769 ?auto_239770 ) ( CLEAR ?auto_239769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_239762 ?auto_239763 ?auto_239764 ?auto_239765 ?auto_239766 ?auto_239767 ?auto_239768 ?auto_239769 )
      ( MAKE-13PILE ?auto_239762 ?auto_239763 ?auto_239764 ?auto_239765 ?auto_239766 ?auto_239767 ?auto_239768 ?auto_239769 ?auto_239770 ?auto_239771 ?auto_239772 ?auto_239773 ?auto_239774 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239789 - BLOCK
      ?auto_239790 - BLOCK
      ?auto_239791 - BLOCK
      ?auto_239792 - BLOCK
      ?auto_239793 - BLOCK
      ?auto_239794 - BLOCK
      ?auto_239795 - BLOCK
      ?auto_239796 - BLOCK
      ?auto_239797 - BLOCK
      ?auto_239798 - BLOCK
      ?auto_239799 - BLOCK
      ?auto_239800 - BLOCK
      ?auto_239801 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239801 ) ( ON-TABLE ?auto_239789 ) ( ON ?auto_239790 ?auto_239789 ) ( ON ?auto_239791 ?auto_239790 ) ( ON ?auto_239792 ?auto_239791 ) ( ON ?auto_239793 ?auto_239792 ) ( ON ?auto_239794 ?auto_239793 ) ( ON ?auto_239795 ?auto_239794 ) ( not ( = ?auto_239789 ?auto_239790 ) ) ( not ( = ?auto_239789 ?auto_239791 ) ) ( not ( = ?auto_239789 ?auto_239792 ) ) ( not ( = ?auto_239789 ?auto_239793 ) ) ( not ( = ?auto_239789 ?auto_239794 ) ) ( not ( = ?auto_239789 ?auto_239795 ) ) ( not ( = ?auto_239789 ?auto_239796 ) ) ( not ( = ?auto_239789 ?auto_239797 ) ) ( not ( = ?auto_239789 ?auto_239798 ) ) ( not ( = ?auto_239789 ?auto_239799 ) ) ( not ( = ?auto_239789 ?auto_239800 ) ) ( not ( = ?auto_239789 ?auto_239801 ) ) ( not ( = ?auto_239790 ?auto_239791 ) ) ( not ( = ?auto_239790 ?auto_239792 ) ) ( not ( = ?auto_239790 ?auto_239793 ) ) ( not ( = ?auto_239790 ?auto_239794 ) ) ( not ( = ?auto_239790 ?auto_239795 ) ) ( not ( = ?auto_239790 ?auto_239796 ) ) ( not ( = ?auto_239790 ?auto_239797 ) ) ( not ( = ?auto_239790 ?auto_239798 ) ) ( not ( = ?auto_239790 ?auto_239799 ) ) ( not ( = ?auto_239790 ?auto_239800 ) ) ( not ( = ?auto_239790 ?auto_239801 ) ) ( not ( = ?auto_239791 ?auto_239792 ) ) ( not ( = ?auto_239791 ?auto_239793 ) ) ( not ( = ?auto_239791 ?auto_239794 ) ) ( not ( = ?auto_239791 ?auto_239795 ) ) ( not ( = ?auto_239791 ?auto_239796 ) ) ( not ( = ?auto_239791 ?auto_239797 ) ) ( not ( = ?auto_239791 ?auto_239798 ) ) ( not ( = ?auto_239791 ?auto_239799 ) ) ( not ( = ?auto_239791 ?auto_239800 ) ) ( not ( = ?auto_239791 ?auto_239801 ) ) ( not ( = ?auto_239792 ?auto_239793 ) ) ( not ( = ?auto_239792 ?auto_239794 ) ) ( not ( = ?auto_239792 ?auto_239795 ) ) ( not ( = ?auto_239792 ?auto_239796 ) ) ( not ( = ?auto_239792 ?auto_239797 ) ) ( not ( = ?auto_239792 ?auto_239798 ) ) ( not ( = ?auto_239792 ?auto_239799 ) ) ( not ( = ?auto_239792 ?auto_239800 ) ) ( not ( = ?auto_239792 ?auto_239801 ) ) ( not ( = ?auto_239793 ?auto_239794 ) ) ( not ( = ?auto_239793 ?auto_239795 ) ) ( not ( = ?auto_239793 ?auto_239796 ) ) ( not ( = ?auto_239793 ?auto_239797 ) ) ( not ( = ?auto_239793 ?auto_239798 ) ) ( not ( = ?auto_239793 ?auto_239799 ) ) ( not ( = ?auto_239793 ?auto_239800 ) ) ( not ( = ?auto_239793 ?auto_239801 ) ) ( not ( = ?auto_239794 ?auto_239795 ) ) ( not ( = ?auto_239794 ?auto_239796 ) ) ( not ( = ?auto_239794 ?auto_239797 ) ) ( not ( = ?auto_239794 ?auto_239798 ) ) ( not ( = ?auto_239794 ?auto_239799 ) ) ( not ( = ?auto_239794 ?auto_239800 ) ) ( not ( = ?auto_239794 ?auto_239801 ) ) ( not ( = ?auto_239795 ?auto_239796 ) ) ( not ( = ?auto_239795 ?auto_239797 ) ) ( not ( = ?auto_239795 ?auto_239798 ) ) ( not ( = ?auto_239795 ?auto_239799 ) ) ( not ( = ?auto_239795 ?auto_239800 ) ) ( not ( = ?auto_239795 ?auto_239801 ) ) ( not ( = ?auto_239796 ?auto_239797 ) ) ( not ( = ?auto_239796 ?auto_239798 ) ) ( not ( = ?auto_239796 ?auto_239799 ) ) ( not ( = ?auto_239796 ?auto_239800 ) ) ( not ( = ?auto_239796 ?auto_239801 ) ) ( not ( = ?auto_239797 ?auto_239798 ) ) ( not ( = ?auto_239797 ?auto_239799 ) ) ( not ( = ?auto_239797 ?auto_239800 ) ) ( not ( = ?auto_239797 ?auto_239801 ) ) ( not ( = ?auto_239798 ?auto_239799 ) ) ( not ( = ?auto_239798 ?auto_239800 ) ) ( not ( = ?auto_239798 ?auto_239801 ) ) ( not ( = ?auto_239799 ?auto_239800 ) ) ( not ( = ?auto_239799 ?auto_239801 ) ) ( not ( = ?auto_239800 ?auto_239801 ) ) ( ON ?auto_239800 ?auto_239801 ) ( ON ?auto_239799 ?auto_239800 ) ( ON ?auto_239798 ?auto_239799 ) ( ON ?auto_239797 ?auto_239798 ) ( CLEAR ?auto_239795 ) ( ON ?auto_239796 ?auto_239797 ) ( CLEAR ?auto_239796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_239789 ?auto_239790 ?auto_239791 ?auto_239792 ?auto_239793 ?auto_239794 ?auto_239795 ?auto_239796 )
      ( MAKE-13PILE ?auto_239789 ?auto_239790 ?auto_239791 ?auto_239792 ?auto_239793 ?auto_239794 ?auto_239795 ?auto_239796 ?auto_239797 ?auto_239798 ?auto_239799 ?auto_239800 ?auto_239801 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239815 - BLOCK
      ?auto_239816 - BLOCK
      ?auto_239817 - BLOCK
      ?auto_239818 - BLOCK
      ?auto_239819 - BLOCK
      ?auto_239820 - BLOCK
      ?auto_239821 - BLOCK
      ?auto_239822 - BLOCK
      ?auto_239823 - BLOCK
      ?auto_239824 - BLOCK
      ?auto_239825 - BLOCK
      ?auto_239826 - BLOCK
      ?auto_239827 - BLOCK
    )
    :vars
    (
      ?auto_239828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239827 ?auto_239828 ) ( ON-TABLE ?auto_239815 ) ( ON ?auto_239816 ?auto_239815 ) ( ON ?auto_239817 ?auto_239816 ) ( ON ?auto_239818 ?auto_239817 ) ( ON ?auto_239819 ?auto_239818 ) ( ON ?auto_239820 ?auto_239819 ) ( not ( = ?auto_239815 ?auto_239816 ) ) ( not ( = ?auto_239815 ?auto_239817 ) ) ( not ( = ?auto_239815 ?auto_239818 ) ) ( not ( = ?auto_239815 ?auto_239819 ) ) ( not ( = ?auto_239815 ?auto_239820 ) ) ( not ( = ?auto_239815 ?auto_239821 ) ) ( not ( = ?auto_239815 ?auto_239822 ) ) ( not ( = ?auto_239815 ?auto_239823 ) ) ( not ( = ?auto_239815 ?auto_239824 ) ) ( not ( = ?auto_239815 ?auto_239825 ) ) ( not ( = ?auto_239815 ?auto_239826 ) ) ( not ( = ?auto_239815 ?auto_239827 ) ) ( not ( = ?auto_239815 ?auto_239828 ) ) ( not ( = ?auto_239816 ?auto_239817 ) ) ( not ( = ?auto_239816 ?auto_239818 ) ) ( not ( = ?auto_239816 ?auto_239819 ) ) ( not ( = ?auto_239816 ?auto_239820 ) ) ( not ( = ?auto_239816 ?auto_239821 ) ) ( not ( = ?auto_239816 ?auto_239822 ) ) ( not ( = ?auto_239816 ?auto_239823 ) ) ( not ( = ?auto_239816 ?auto_239824 ) ) ( not ( = ?auto_239816 ?auto_239825 ) ) ( not ( = ?auto_239816 ?auto_239826 ) ) ( not ( = ?auto_239816 ?auto_239827 ) ) ( not ( = ?auto_239816 ?auto_239828 ) ) ( not ( = ?auto_239817 ?auto_239818 ) ) ( not ( = ?auto_239817 ?auto_239819 ) ) ( not ( = ?auto_239817 ?auto_239820 ) ) ( not ( = ?auto_239817 ?auto_239821 ) ) ( not ( = ?auto_239817 ?auto_239822 ) ) ( not ( = ?auto_239817 ?auto_239823 ) ) ( not ( = ?auto_239817 ?auto_239824 ) ) ( not ( = ?auto_239817 ?auto_239825 ) ) ( not ( = ?auto_239817 ?auto_239826 ) ) ( not ( = ?auto_239817 ?auto_239827 ) ) ( not ( = ?auto_239817 ?auto_239828 ) ) ( not ( = ?auto_239818 ?auto_239819 ) ) ( not ( = ?auto_239818 ?auto_239820 ) ) ( not ( = ?auto_239818 ?auto_239821 ) ) ( not ( = ?auto_239818 ?auto_239822 ) ) ( not ( = ?auto_239818 ?auto_239823 ) ) ( not ( = ?auto_239818 ?auto_239824 ) ) ( not ( = ?auto_239818 ?auto_239825 ) ) ( not ( = ?auto_239818 ?auto_239826 ) ) ( not ( = ?auto_239818 ?auto_239827 ) ) ( not ( = ?auto_239818 ?auto_239828 ) ) ( not ( = ?auto_239819 ?auto_239820 ) ) ( not ( = ?auto_239819 ?auto_239821 ) ) ( not ( = ?auto_239819 ?auto_239822 ) ) ( not ( = ?auto_239819 ?auto_239823 ) ) ( not ( = ?auto_239819 ?auto_239824 ) ) ( not ( = ?auto_239819 ?auto_239825 ) ) ( not ( = ?auto_239819 ?auto_239826 ) ) ( not ( = ?auto_239819 ?auto_239827 ) ) ( not ( = ?auto_239819 ?auto_239828 ) ) ( not ( = ?auto_239820 ?auto_239821 ) ) ( not ( = ?auto_239820 ?auto_239822 ) ) ( not ( = ?auto_239820 ?auto_239823 ) ) ( not ( = ?auto_239820 ?auto_239824 ) ) ( not ( = ?auto_239820 ?auto_239825 ) ) ( not ( = ?auto_239820 ?auto_239826 ) ) ( not ( = ?auto_239820 ?auto_239827 ) ) ( not ( = ?auto_239820 ?auto_239828 ) ) ( not ( = ?auto_239821 ?auto_239822 ) ) ( not ( = ?auto_239821 ?auto_239823 ) ) ( not ( = ?auto_239821 ?auto_239824 ) ) ( not ( = ?auto_239821 ?auto_239825 ) ) ( not ( = ?auto_239821 ?auto_239826 ) ) ( not ( = ?auto_239821 ?auto_239827 ) ) ( not ( = ?auto_239821 ?auto_239828 ) ) ( not ( = ?auto_239822 ?auto_239823 ) ) ( not ( = ?auto_239822 ?auto_239824 ) ) ( not ( = ?auto_239822 ?auto_239825 ) ) ( not ( = ?auto_239822 ?auto_239826 ) ) ( not ( = ?auto_239822 ?auto_239827 ) ) ( not ( = ?auto_239822 ?auto_239828 ) ) ( not ( = ?auto_239823 ?auto_239824 ) ) ( not ( = ?auto_239823 ?auto_239825 ) ) ( not ( = ?auto_239823 ?auto_239826 ) ) ( not ( = ?auto_239823 ?auto_239827 ) ) ( not ( = ?auto_239823 ?auto_239828 ) ) ( not ( = ?auto_239824 ?auto_239825 ) ) ( not ( = ?auto_239824 ?auto_239826 ) ) ( not ( = ?auto_239824 ?auto_239827 ) ) ( not ( = ?auto_239824 ?auto_239828 ) ) ( not ( = ?auto_239825 ?auto_239826 ) ) ( not ( = ?auto_239825 ?auto_239827 ) ) ( not ( = ?auto_239825 ?auto_239828 ) ) ( not ( = ?auto_239826 ?auto_239827 ) ) ( not ( = ?auto_239826 ?auto_239828 ) ) ( not ( = ?auto_239827 ?auto_239828 ) ) ( ON ?auto_239826 ?auto_239827 ) ( ON ?auto_239825 ?auto_239826 ) ( ON ?auto_239824 ?auto_239825 ) ( ON ?auto_239823 ?auto_239824 ) ( ON ?auto_239822 ?auto_239823 ) ( CLEAR ?auto_239820 ) ( ON ?auto_239821 ?auto_239822 ) ( CLEAR ?auto_239821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_239815 ?auto_239816 ?auto_239817 ?auto_239818 ?auto_239819 ?auto_239820 ?auto_239821 )
      ( MAKE-13PILE ?auto_239815 ?auto_239816 ?auto_239817 ?auto_239818 ?auto_239819 ?auto_239820 ?auto_239821 ?auto_239822 ?auto_239823 ?auto_239824 ?auto_239825 ?auto_239826 ?auto_239827 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239842 - BLOCK
      ?auto_239843 - BLOCK
      ?auto_239844 - BLOCK
      ?auto_239845 - BLOCK
      ?auto_239846 - BLOCK
      ?auto_239847 - BLOCK
      ?auto_239848 - BLOCK
      ?auto_239849 - BLOCK
      ?auto_239850 - BLOCK
      ?auto_239851 - BLOCK
      ?auto_239852 - BLOCK
      ?auto_239853 - BLOCK
      ?auto_239854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239854 ) ( ON-TABLE ?auto_239842 ) ( ON ?auto_239843 ?auto_239842 ) ( ON ?auto_239844 ?auto_239843 ) ( ON ?auto_239845 ?auto_239844 ) ( ON ?auto_239846 ?auto_239845 ) ( ON ?auto_239847 ?auto_239846 ) ( not ( = ?auto_239842 ?auto_239843 ) ) ( not ( = ?auto_239842 ?auto_239844 ) ) ( not ( = ?auto_239842 ?auto_239845 ) ) ( not ( = ?auto_239842 ?auto_239846 ) ) ( not ( = ?auto_239842 ?auto_239847 ) ) ( not ( = ?auto_239842 ?auto_239848 ) ) ( not ( = ?auto_239842 ?auto_239849 ) ) ( not ( = ?auto_239842 ?auto_239850 ) ) ( not ( = ?auto_239842 ?auto_239851 ) ) ( not ( = ?auto_239842 ?auto_239852 ) ) ( not ( = ?auto_239842 ?auto_239853 ) ) ( not ( = ?auto_239842 ?auto_239854 ) ) ( not ( = ?auto_239843 ?auto_239844 ) ) ( not ( = ?auto_239843 ?auto_239845 ) ) ( not ( = ?auto_239843 ?auto_239846 ) ) ( not ( = ?auto_239843 ?auto_239847 ) ) ( not ( = ?auto_239843 ?auto_239848 ) ) ( not ( = ?auto_239843 ?auto_239849 ) ) ( not ( = ?auto_239843 ?auto_239850 ) ) ( not ( = ?auto_239843 ?auto_239851 ) ) ( not ( = ?auto_239843 ?auto_239852 ) ) ( not ( = ?auto_239843 ?auto_239853 ) ) ( not ( = ?auto_239843 ?auto_239854 ) ) ( not ( = ?auto_239844 ?auto_239845 ) ) ( not ( = ?auto_239844 ?auto_239846 ) ) ( not ( = ?auto_239844 ?auto_239847 ) ) ( not ( = ?auto_239844 ?auto_239848 ) ) ( not ( = ?auto_239844 ?auto_239849 ) ) ( not ( = ?auto_239844 ?auto_239850 ) ) ( not ( = ?auto_239844 ?auto_239851 ) ) ( not ( = ?auto_239844 ?auto_239852 ) ) ( not ( = ?auto_239844 ?auto_239853 ) ) ( not ( = ?auto_239844 ?auto_239854 ) ) ( not ( = ?auto_239845 ?auto_239846 ) ) ( not ( = ?auto_239845 ?auto_239847 ) ) ( not ( = ?auto_239845 ?auto_239848 ) ) ( not ( = ?auto_239845 ?auto_239849 ) ) ( not ( = ?auto_239845 ?auto_239850 ) ) ( not ( = ?auto_239845 ?auto_239851 ) ) ( not ( = ?auto_239845 ?auto_239852 ) ) ( not ( = ?auto_239845 ?auto_239853 ) ) ( not ( = ?auto_239845 ?auto_239854 ) ) ( not ( = ?auto_239846 ?auto_239847 ) ) ( not ( = ?auto_239846 ?auto_239848 ) ) ( not ( = ?auto_239846 ?auto_239849 ) ) ( not ( = ?auto_239846 ?auto_239850 ) ) ( not ( = ?auto_239846 ?auto_239851 ) ) ( not ( = ?auto_239846 ?auto_239852 ) ) ( not ( = ?auto_239846 ?auto_239853 ) ) ( not ( = ?auto_239846 ?auto_239854 ) ) ( not ( = ?auto_239847 ?auto_239848 ) ) ( not ( = ?auto_239847 ?auto_239849 ) ) ( not ( = ?auto_239847 ?auto_239850 ) ) ( not ( = ?auto_239847 ?auto_239851 ) ) ( not ( = ?auto_239847 ?auto_239852 ) ) ( not ( = ?auto_239847 ?auto_239853 ) ) ( not ( = ?auto_239847 ?auto_239854 ) ) ( not ( = ?auto_239848 ?auto_239849 ) ) ( not ( = ?auto_239848 ?auto_239850 ) ) ( not ( = ?auto_239848 ?auto_239851 ) ) ( not ( = ?auto_239848 ?auto_239852 ) ) ( not ( = ?auto_239848 ?auto_239853 ) ) ( not ( = ?auto_239848 ?auto_239854 ) ) ( not ( = ?auto_239849 ?auto_239850 ) ) ( not ( = ?auto_239849 ?auto_239851 ) ) ( not ( = ?auto_239849 ?auto_239852 ) ) ( not ( = ?auto_239849 ?auto_239853 ) ) ( not ( = ?auto_239849 ?auto_239854 ) ) ( not ( = ?auto_239850 ?auto_239851 ) ) ( not ( = ?auto_239850 ?auto_239852 ) ) ( not ( = ?auto_239850 ?auto_239853 ) ) ( not ( = ?auto_239850 ?auto_239854 ) ) ( not ( = ?auto_239851 ?auto_239852 ) ) ( not ( = ?auto_239851 ?auto_239853 ) ) ( not ( = ?auto_239851 ?auto_239854 ) ) ( not ( = ?auto_239852 ?auto_239853 ) ) ( not ( = ?auto_239852 ?auto_239854 ) ) ( not ( = ?auto_239853 ?auto_239854 ) ) ( ON ?auto_239853 ?auto_239854 ) ( ON ?auto_239852 ?auto_239853 ) ( ON ?auto_239851 ?auto_239852 ) ( ON ?auto_239850 ?auto_239851 ) ( ON ?auto_239849 ?auto_239850 ) ( CLEAR ?auto_239847 ) ( ON ?auto_239848 ?auto_239849 ) ( CLEAR ?auto_239848 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_239842 ?auto_239843 ?auto_239844 ?auto_239845 ?auto_239846 ?auto_239847 ?auto_239848 )
      ( MAKE-13PILE ?auto_239842 ?auto_239843 ?auto_239844 ?auto_239845 ?auto_239846 ?auto_239847 ?auto_239848 ?auto_239849 ?auto_239850 ?auto_239851 ?auto_239852 ?auto_239853 ?auto_239854 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239868 - BLOCK
      ?auto_239869 - BLOCK
      ?auto_239870 - BLOCK
      ?auto_239871 - BLOCK
      ?auto_239872 - BLOCK
      ?auto_239873 - BLOCK
      ?auto_239874 - BLOCK
      ?auto_239875 - BLOCK
      ?auto_239876 - BLOCK
      ?auto_239877 - BLOCK
      ?auto_239878 - BLOCK
      ?auto_239879 - BLOCK
      ?auto_239880 - BLOCK
    )
    :vars
    (
      ?auto_239881 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239880 ?auto_239881 ) ( ON-TABLE ?auto_239868 ) ( ON ?auto_239869 ?auto_239868 ) ( ON ?auto_239870 ?auto_239869 ) ( ON ?auto_239871 ?auto_239870 ) ( ON ?auto_239872 ?auto_239871 ) ( not ( = ?auto_239868 ?auto_239869 ) ) ( not ( = ?auto_239868 ?auto_239870 ) ) ( not ( = ?auto_239868 ?auto_239871 ) ) ( not ( = ?auto_239868 ?auto_239872 ) ) ( not ( = ?auto_239868 ?auto_239873 ) ) ( not ( = ?auto_239868 ?auto_239874 ) ) ( not ( = ?auto_239868 ?auto_239875 ) ) ( not ( = ?auto_239868 ?auto_239876 ) ) ( not ( = ?auto_239868 ?auto_239877 ) ) ( not ( = ?auto_239868 ?auto_239878 ) ) ( not ( = ?auto_239868 ?auto_239879 ) ) ( not ( = ?auto_239868 ?auto_239880 ) ) ( not ( = ?auto_239868 ?auto_239881 ) ) ( not ( = ?auto_239869 ?auto_239870 ) ) ( not ( = ?auto_239869 ?auto_239871 ) ) ( not ( = ?auto_239869 ?auto_239872 ) ) ( not ( = ?auto_239869 ?auto_239873 ) ) ( not ( = ?auto_239869 ?auto_239874 ) ) ( not ( = ?auto_239869 ?auto_239875 ) ) ( not ( = ?auto_239869 ?auto_239876 ) ) ( not ( = ?auto_239869 ?auto_239877 ) ) ( not ( = ?auto_239869 ?auto_239878 ) ) ( not ( = ?auto_239869 ?auto_239879 ) ) ( not ( = ?auto_239869 ?auto_239880 ) ) ( not ( = ?auto_239869 ?auto_239881 ) ) ( not ( = ?auto_239870 ?auto_239871 ) ) ( not ( = ?auto_239870 ?auto_239872 ) ) ( not ( = ?auto_239870 ?auto_239873 ) ) ( not ( = ?auto_239870 ?auto_239874 ) ) ( not ( = ?auto_239870 ?auto_239875 ) ) ( not ( = ?auto_239870 ?auto_239876 ) ) ( not ( = ?auto_239870 ?auto_239877 ) ) ( not ( = ?auto_239870 ?auto_239878 ) ) ( not ( = ?auto_239870 ?auto_239879 ) ) ( not ( = ?auto_239870 ?auto_239880 ) ) ( not ( = ?auto_239870 ?auto_239881 ) ) ( not ( = ?auto_239871 ?auto_239872 ) ) ( not ( = ?auto_239871 ?auto_239873 ) ) ( not ( = ?auto_239871 ?auto_239874 ) ) ( not ( = ?auto_239871 ?auto_239875 ) ) ( not ( = ?auto_239871 ?auto_239876 ) ) ( not ( = ?auto_239871 ?auto_239877 ) ) ( not ( = ?auto_239871 ?auto_239878 ) ) ( not ( = ?auto_239871 ?auto_239879 ) ) ( not ( = ?auto_239871 ?auto_239880 ) ) ( not ( = ?auto_239871 ?auto_239881 ) ) ( not ( = ?auto_239872 ?auto_239873 ) ) ( not ( = ?auto_239872 ?auto_239874 ) ) ( not ( = ?auto_239872 ?auto_239875 ) ) ( not ( = ?auto_239872 ?auto_239876 ) ) ( not ( = ?auto_239872 ?auto_239877 ) ) ( not ( = ?auto_239872 ?auto_239878 ) ) ( not ( = ?auto_239872 ?auto_239879 ) ) ( not ( = ?auto_239872 ?auto_239880 ) ) ( not ( = ?auto_239872 ?auto_239881 ) ) ( not ( = ?auto_239873 ?auto_239874 ) ) ( not ( = ?auto_239873 ?auto_239875 ) ) ( not ( = ?auto_239873 ?auto_239876 ) ) ( not ( = ?auto_239873 ?auto_239877 ) ) ( not ( = ?auto_239873 ?auto_239878 ) ) ( not ( = ?auto_239873 ?auto_239879 ) ) ( not ( = ?auto_239873 ?auto_239880 ) ) ( not ( = ?auto_239873 ?auto_239881 ) ) ( not ( = ?auto_239874 ?auto_239875 ) ) ( not ( = ?auto_239874 ?auto_239876 ) ) ( not ( = ?auto_239874 ?auto_239877 ) ) ( not ( = ?auto_239874 ?auto_239878 ) ) ( not ( = ?auto_239874 ?auto_239879 ) ) ( not ( = ?auto_239874 ?auto_239880 ) ) ( not ( = ?auto_239874 ?auto_239881 ) ) ( not ( = ?auto_239875 ?auto_239876 ) ) ( not ( = ?auto_239875 ?auto_239877 ) ) ( not ( = ?auto_239875 ?auto_239878 ) ) ( not ( = ?auto_239875 ?auto_239879 ) ) ( not ( = ?auto_239875 ?auto_239880 ) ) ( not ( = ?auto_239875 ?auto_239881 ) ) ( not ( = ?auto_239876 ?auto_239877 ) ) ( not ( = ?auto_239876 ?auto_239878 ) ) ( not ( = ?auto_239876 ?auto_239879 ) ) ( not ( = ?auto_239876 ?auto_239880 ) ) ( not ( = ?auto_239876 ?auto_239881 ) ) ( not ( = ?auto_239877 ?auto_239878 ) ) ( not ( = ?auto_239877 ?auto_239879 ) ) ( not ( = ?auto_239877 ?auto_239880 ) ) ( not ( = ?auto_239877 ?auto_239881 ) ) ( not ( = ?auto_239878 ?auto_239879 ) ) ( not ( = ?auto_239878 ?auto_239880 ) ) ( not ( = ?auto_239878 ?auto_239881 ) ) ( not ( = ?auto_239879 ?auto_239880 ) ) ( not ( = ?auto_239879 ?auto_239881 ) ) ( not ( = ?auto_239880 ?auto_239881 ) ) ( ON ?auto_239879 ?auto_239880 ) ( ON ?auto_239878 ?auto_239879 ) ( ON ?auto_239877 ?auto_239878 ) ( ON ?auto_239876 ?auto_239877 ) ( ON ?auto_239875 ?auto_239876 ) ( ON ?auto_239874 ?auto_239875 ) ( CLEAR ?auto_239872 ) ( ON ?auto_239873 ?auto_239874 ) ( CLEAR ?auto_239873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_239868 ?auto_239869 ?auto_239870 ?auto_239871 ?auto_239872 ?auto_239873 )
      ( MAKE-13PILE ?auto_239868 ?auto_239869 ?auto_239870 ?auto_239871 ?auto_239872 ?auto_239873 ?auto_239874 ?auto_239875 ?auto_239876 ?auto_239877 ?auto_239878 ?auto_239879 ?auto_239880 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239895 - BLOCK
      ?auto_239896 - BLOCK
      ?auto_239897 - BLOCK
      ?auto_239898 - BLOCK
      ?auto_239899 - BLOCK
      ?auto_239900 - BLOCK
      ?auto_239901 - BLOCK
      ?auto_239902 - BLOCK
      ?auto_239903 - BLOCK
      ?auto_239904 - BLOCK
      ?auto_239905 - BLOCK
      ?auto_239906 - BLOCK
      ?auto_239907 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239907 ) ( ON-TABLE ?auto_239895 ) ( ON ?auto_239896 ?auto_239895 ) ( ON ?auto_239897 ?auto_239896 ) ( ON ?auto_239898 ?auto_239897 ) ( ON ?auto_239899 ?auto_239898 ) ( not ( = ?auto_239895 ?auto_239896 ) ) ( not ( = ?auto_239895 ?auto_239897 ) ) ( not ( = ?auto_239895 ?auto_239898 ) ) ( not ( = ?auto_239895 ?auto_239899 ) ) ( not ( = ?auto_239895 ?auto_239900 ) ) ( not ( = ?auto_239895 ?auto_239901 ) ) ( not ( = ?auto_239895 ?auto_239902 ) ) ( not ( = ?auto_239895 ?auto_239903 ) ) ( not ( = ?auto_239895 ?auto_239904 ) ) ( not ( = ?auto_239895 ?auto_239905 ) ) ( not ( = ?auto_239895 ?auto_239906 ) ) ( not ( = ?auto_239895 ?auto_239907 ) ) ( not ( = ?auto_239896 ?auto_239897 ) ) ( not ( = ?auto_239896 ?auto_239898 ) ) ( not ( = ?auto_239896 ?auto_239899 ) ) ( not ( = ?auto_239896 ?auto_239900 ) ) ( not ( = ?auto_239896 ?auto_239901 ) ) ( not ( = ?auto_239896 ?auto_239902 ) ) ( not ( = ?auto_239896 ?auto_239903 ) ) ( not ( = ?auto_239896 ?auto_239904 ) ) ( not ( = ?auto_239896 ?auto_239905 ) ) ( not ( = ?auto_239896 ?auto_239906 ) ) ( not ( = ?auto_239896 ?auto_239907 ) ) ( not ( = ?auto_239897 ?auto_239898 ) ) ( not ( = ?auto_239897 ?auto_239899 ) ) ( not ( = ?auto_239897 ?auto_239900 ) ) ( not ( = ?auto_239897 ?auto_239901 ) ) ( not ( = ?auto_239897 ?auto_239902 ) ) ( not ( = ?auto_239897 ?auto_239903 ) ) ( not ( = ?auto_239897 ?auto_239904 ) ) ( not ( = ?auto_239897 ?auto_239905 ) ) ( not ( = ?auto_239897 ?auto_239906 ) ) ( not ( = ?auto_239897 ?auto_239907 ) ) ( not ( = ?auto_239898 ?auto_239899 ) ) ( not ( = ?auto_239898 ?auto_239900 ) ) ( not ( = ?auto_239898 ?auto_239901 ) ) ( not ( = ?auto_239898 ?auto_239902 ) ) ( not ( = ?auto_239898 ?auto_239903 ) ) ( not ( = ?auto_239898 ?auto_239904 ) ) ( not ( = ?auto_239898 ?auto_239905 ) ) ( not ( = ?auto_239898 ?auto_239906 ) ) ( not ( = ?auto_239898 ?auto_239907 ) ) ( not ( = ?auto_239899 ?auto_239900 ) ) ( not ( = ?auto_239899 ?auto_239901 ) ) ( not ( = ?auto_239899 ?auto_239902 ) ) ( not ( = ?auto_239899 ?auto_239903 ) ) ( not ( = ?auto_239899 ?auto_239904 ) ) ( not ( = ?auto_239899 ?auto_239905 ) ) ( not ( = ?auto_239899 ?auto_239906 ) ) ( not ( = ?auto_239899 ?auto_239907 ) ) ( not ( = ?auto_239900 ?auto_239901 ) ) ( not ( = ?auto_239900 ?auto_239902 ) ) ( not ( = ?auto_239900 ?auto_239903 ) ) ( not ( = ?auto_239900 ?auto_239904 ) ) ( not ( = ?auto_239900 ?auto_239905 ) ) ( not ( = ?auto_239900 ?auto_239906 ) ) ( not ( = ?auto_239900 ?auto_239907 ) ) ( not ( = ?auto_239901 ?auto_239902 ) ) ( not ( = ?auto_239901 ?auto_239903 ) ) ( not ( = ?auto_239901 ?auto_239904 ) ) ( not ( = ?auto_239901 ?auto_239905 ) ) ( not ( = ?auto_239901 ?auto_239906 ) ) ( not ( = ?auto_239901 ?auto_239907 ) ) ( not ( = ?auto_239902 ?auto_239903 ) ) ( not ( = ?auto_239902 ?auto_239904 ) ) ( not ( = ?auto_239902 ?auto_239905 ) ) ( not ( = ?auto_239902 ?auto_239906 ) ) ( not ( = ?auto_239902 ?auto_239907 ) ) ( not ( = ?auto_239903 ?auto_239904 ) ) ( not ( = ?auto_239903 ?auto_239905 ) ) ( not ( = ?auto_239903 ?auto_239906 ) ) ( not ( = ?auto_239903 ?auto_239907 ) ) ( not ( = ?auto_239904 ?auto_239905 ) ) ( not ( = ?auto_239904 ?auto_239906 ) ) ( not ( = ?auto_239904 ?auto_239907 ) ) ( not ( = ?auto_239905 ?auto_239906 ) ) ( not ( = ?auto_239905 ?auto_239907 ) ) ( not ( = ?auto_239906 ?auto_239907 ) ) ( ON ?auto_239906 ?auto_239907 ) ( ON ?auto_239905 ?auto_239906 ) ( ON ?auto_239904 ?auto_239905 ) ( ON ?auto_239903 ?auto_239904 ) ( ON ?auto_239902 ?auto_239903 ) ( ON ?auto_239901 ?auto_239902 ) ( CLEAR ?auto_239899 ) ( ON ?auto_239900 ?auto_239901 ) ( CLEAR ?auto_239900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_239895 ?auto_239896 ?auto_239897 ?auto_239898 ?auto_239899 ?auto_239900 )
      ( MAKE-13PILE ?auto_239895 ?auto_239896 ?auto_239897 ?auto_239898 ?auto_239899 ?auto_239900 ?auto_239901 ?auto_239902 ?auto_239903 ?auto_239904 ?auto_239905 ?auto_239906 ?auto_239907 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239921 - BLOCK
      ?auto_239922 - BLOCK
      ?auto_239923 - BLOCK
      ?auto_239924 - BLOCK
      ?auto_239925 - BLOCK
      ?auto_239926 - BLOCK
      ?auto_239927 - BLOCK
      ?auto_239928 - BLOCK
      ?auto_239929 - BLOCK
      ?auto_239930 - BLOCK
      ?auto_239931 - BLOCK
      ?auto_239932 - BLOCK
      ?auto_239933 - BLOCK
    )
    :vars
    (
      ?auto_239934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239933 ?auto_239934 ) ( ON-TABLE ?auto_239921 ) ( ON ?auto_239922 ?auto_239921 ) ( ON ?auto_239923 ?auto_239922 ) ( ON ?auto_239924 ?auto_239923 ) ( not ( = ?auto_239921 ?auto_239922 ) ) ( not ( = ?auto_239921 ?auto_239923 ) ) ( not ( = ?auto_239921 ?auto_239924 ) ) ( not ( = ?auto_239921 ?auto_239925 ) ) ( not ( = ?auto_239921 ?auto_239926 ) ) ( not ( = ?auto_239921 ?auto_239927 ) ) ( not ( = ?auto_239921 ?auto_239928 ) ) ( not ( = ?auto_239921 ?auto_239929 ) ) ( not ( = ?auto_239921 ?auto_239930 ) ) ( not ( = ?auto_239921 ?auto_239931 ) ) ( not ( = ?auto_239921 ?auto_239932 ) ) ( not ( = ?auto_239921 ?auto_239933 ) ) ( not ( = ?auto_239921 ?auto_239934 ) ) ( not ( = ?auto_239922 ?auto_239923 ) ) ( not ( = ?auto_239922 ?auto_239924 ) ) ( not ( = ?auto_239922 ?auto_239925 ) ) ( not ( = ?auto_239922 ?auto_239926 ) ) ( not ( = ?auto_239922 ?auto_239927 ) ) ( not ( = ?auto_239922 ?auto_239928 ) ) ( not ( = ?auto_239922 ?auto_239929 ) ) ( not ( = ?auto_239922 ?auto_239930 ) ) ( not ( = ?auto_239922 ?auto_239931 ) ) ( not ( = ?auto_239922 ?auto_239932 ) ) ( not ( = ?auto_239922 ?auto_239933 ) ) ( not ( = ?auto_239922 ?auto_239934 ) ) ( not ( = ?auto_239923 ?auto_239924 ) ) ( not ( = ?auto_239923 ?auto_239925 ) ) ( not ( = ?auto_239923 ?auto_239926 ) ) ( not ( = ?auto_239923 ?auto_239927 ) ) ( not ( = ?auto_239923 ?auto_239928 ) ) ( not ( = ?auto_239923 ?auto_239929 ) ) ( not ( = ?auto_239923 ?auto_239930 ) ) ( not ( = ?auto_239923 ?auto_239931 ) ) ( not ( = ?auto_239923 ?auto_239932 ) ) ( not ( = ?auto_239923 ?auto_239933 ) ) ( not ( = ?auto_239923 ?auto_239934 ) ) ( not ( = ?auto_239924 ?auto_239925 ) ) ( not ( = ?auto_239924 ?auto_239926 ) ) ( not ( = ?auto_239924 ?auto_239927 ) ) ( not ( = ?auto_239924 ?auto_239928 ) ) ( not ( = ?auto_239924 ?auto_239929 ) ) ( not ( = ?auto_239924 ?auto_239930 ) ) ( not ( = ?auto_239924 ?auto_239931 ) ) ( not ( = ?auto_239924 ?auto_239932 ) ) ( not ( = ?auto_239924 ?auto_239933 ) ) ( not ( = ?auto_239924 ?auto_239934 ) ) ( not ( = ?auto_239925 ?auto_239926 ) ) ( not ( = ?auto_239925 ?auto_239927 ) ) ( not ( = ?auto_239925 ?auto_239928 ) ) ( not ( = ?auto_239925 ?auto_239929 ) ) ( not ( = ?auto_239925 ?auto_239930 ) ) ( not ( = ?auto_239925 ?auto_239931 ) ) ( not ( = ?auto_239925 ?auto_239932 ) ) ( not ( = ?auto_239925 ?auto_239933 ) ) ( not ( = ?auto_239925 ?auto_239934 ) ) ( not ( = ?auto_239926 ?auto_239927 ) ) ( not ( = ?auto_239926 ?auto_239928 ) ) ( not ( = ?auto_239926 ?auto_239929 ) ) ( not ( = ?auto_239926 ?auto_239930 ) ) ( not ( = ?auto_239926 ?auto_239931 ) ) ( not ( = ?auto_239926 ?auto_239932 ) ) ( not ( = ?auto_239926 ?auto_239933 ) ) ( not ( = ?auto_239926 ?auto_239934 ) ) ( not ( = ?auto_239927 ?auto_239928 ) ) ( not ( = ?auto_239927 ?auto_239929 ) ) ( not ( = ?auto_239927 ?auto_239930 ) ) ( not ( = ?auto_239927 ?auto_239931 ) ) ( not ( = ?auto_239927 ?auto_239932 ) ) ( not ( = ?auto_239927 ?auto_239933 ) ) ( not ( = ?auto_239927 ?auto_239934 ) ) ( not ( = ?auto_239928 ?auto_239929 ) ) ( not ( = ?auto_239928 ?auto_239930 ) ) ( not ( = ?auto_239928 ?auto_239931 ) ) ( not ( = ?auto_239928 ?auto_239932 ) ) ( not ( = ?auto_239928 ?auto_239933 ) ) ( not ( = ?auto_239928 ?auto_239934 ) ) ( not ( = ?auto_239929 ?auto_239930 ) ) ( not ( = ?auto_239929 ?auto_239931 ) ) ( not ( = ?auto_239929 ?auto_239932 ) ) ( not ( = ?auto_239929 ?auto_239933 ) ) ( not ( = ?auto_239929 ?auto_239934 ) ) ( not ( = ?auto_239930 ?auto_239931 ) ) ( not ( = ?auto_239930 ?auto_239932 ) ) ( not ( = ?auto_239930 ?auto_239933 ) ) ( not ( = ?auto_239930 ?auto_239934 ) ) ( not ( = ?auto_239931 ?auto_239932 ) ) ( not ( = ?auto_239931 ?auto_239933 ) ) ( not ( = ?auto_239931 ?auto_239934 ) ) ( not ( = ?auto_239932 ?auto_239933 ) ) ( not ( = ?auto_239932 ?auto_239934 ) ) ( not ( = ?auto_239933 ?auto_239934 ) ) ( ON ?auto_239932 ?auto_239933 ) ( ON ?auto_239931 ?auto_239932 ) ( ON ?auto_239930 ?auto_239931 ) ( ON ?auto_239929 ?auto_239930 ) ( ON ?auto_239928 ?auto_239929 ) ( ON ?auto_239927 ?auto_239928 ) ( ON ?auto_239926 ?auto_239927 ) ( CLEAR ?auto_239924 ) ( ON ?auto_239925 ?auto_239926 ) ( CLEAR ?auto_239925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_239921 ?auto_239922 ?auto_239923 ?auto_239924 ?auto_239925 )
      ( MAKE-13PILE ?auto_239921 ?auto_239922 ?auto_239923 ?auto_239924 ?auto_239925 ?auto_239926 ?auto_239927 ?auto_239928 ?auto_239929 ?auto_239930 ?auto_239931 ?auto_239932 ?auto_239933 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239948 - BLOCK
      ?auto_239949 - BLOCK
      ?auto_239950 - BLOCK
      ?auto_239951 - BLOCK
      ?auto_239952 - BLOCK
      ?auto_239953 - BLOCK
      ?auto_239954 - BLOCK
      ?auto_239955 - BLOCK
      ?auto_239956 - BLOCK
      ?auto_239957 - BLOCK
      ?auto_239958 - BLOCK
      ?auto_239959 - BLOCK
      ?auto_239960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_239960 ) ( ON-TABLE ?auto_239948 ) ( ON ?auto_239949 ?auto_239948 ) ( ON ?auto_239950 ?auto_239949 ) ( ON ?auto_239951 ?auto_239950 ) ( not ( = ?auto_239948 ?auto_239949 ) ) ( not ( = ?auto_239948 ?auto_239950 ) ) ( not ( = ?auto_239948 ?auto_239951 ) ) ( not ( = ?auto_239948 ?auto_239952 ) ) ( not ( = ?auto_239948 ?auto_239953 ) ) ( not ( = ?auto_239948 ?auto_239954 ) ) ( not ( = ?auto_239948 ?auto_239955 ) ) ( not ( = ?auto_239948 ?auto_239956 ) ) ( not ( = ?auto_239948 ?auto_239957 ) ) ( not ( = ?auto_239948 ?auto_239958 ) ) ( not ( = ?auto_239948 ?auto_239959 ) ) ( not ( = ?auto_239948 ?auto_239960 ) ) ( not ( = ?auto_239949 ?auto_239950 ) ) ( not ( = ?auto_239949 ?auto_239951 ) ) ( not ( = ?auto_239949 ?auto_239952 ) ) ( not ( = ?auto_239949 ?auto_239953 ) ) ( not ( = ?auto_239949 ?auto_239954 ) ) ( not ( = ?auto_239949 ?auto_239955 ) ) ( not ( = ?auto_239949 ?auto_239956 ) ) ( not ( = ?auto_239949 ?auto_239957 ) ) ( not ( = ?auto_239949 ?auto_239958 ) ) ( not ( = ?auto_239949 ?auto_239959 ) ) ( not ( = ?auto_239949 ?auto_239960 ) ) ( not ( = ?auto_239950 ?auto_239951 ) ) ( not ( = ?auto_239950 ?auto_239952 ) ) ( not ( = ?auto_239950 ?auto_239953 ) ) ( not ( = ?auto_239950 ?auto_239954 ) ) ( not ( = ?auto_239950 ?auto_239955 ) ) ( not ( = ?auto_239950 ?auto_239956 ) ) ( not ( = ?auto_239950 ?auto_239957 ) ) ( not ( = ?auto_239950 ?auto_239958 ) ) ( not ( = ?auto_239950 ?auto_239959 ) ) ( not ( = ?auto_239950 ?auto_239960 ) ) ( not ( = ?auto_239951 ?auto_239952 ) ) ( not ( = ?auto_239951 ?auto_239953 ) ) ( not ( = ?auto_239951 ?auto_239954 ) ) ( not ( = ?auto_239951 ?auto_239955 ) ) ( not ( = ?auto_239951 ?auto_239956 ) ) ( not ( = ?auto_239951 ?auto_239957 ) ) ( not ( = ?auto_239951 ?auto_239958 ) ) ( not ( = ?auto_239951 ?auto_239959 ) ) ( not ( = ?auto_239951 ?auto_239960 ) ) ( not ( = ?auto_239952 ?auto_239953 ) ) ( not ( = ?auto_239952 ?auto_239954 ) ) ( not ( = ?auto_239952 ?auto_239955 ) ) ( not ( = ?auto_239952 ?auto_239956 ) ) ( not ( = ?auto_239952 ?auto_239957 ) ) ( not ( = ?auto_239952 ?auto_239958 ) ) ( not ( = ?auto_239952 ?auto_239959 ) ) ( not ( = ?auto_239952 ?auto_239960 ) ) ( not ( = ?auto_239953 ?auto_239954 ) ) ( not ( = ?auto_239953 ?auto_239955 ) ) ( not ( = ?auto_239953 ?auto_239956 ) ) ( not ( = ?auto_239953 ?auto_239957 ) ) ( not ( = ?auto_239953 ?auto_239958 ) ) ( not ( = ?auto_239953 ?auto_239959 ) ) ( not ( = ?auto_239953 ?auto_239960 ) ) ( not ( = ?auto_239954 ?auto_239955 ) ) ( not ( = ?auto_239954 ?auto_239956 ) ) ( not ( = ?auto_239954 ?auto_239957 ) ) ( not ( = ?auto_239954 ?auto_239958 ) ) ( not ( = ?auto_239954 ?auto_239959 ) ) ( not ( = ?auto_239954 ?auto_239960 ) ) ( not ( = ?auto_239955 ?auto_239956 ) ) ( not ( = ?auto_239955 ?auto_239957 ) ) ( not ( = ?auto_239955 ?auto_239958 ) ) ( not ( = ?auto_239955 ?auto_239959 ) ) ( not ( = ?auto_239955 ?auto_239960 ) ) ( not ( = ?auto_239956 ?auto_239957 ) ) ( not ( = ?auto_239956 ?auto_239958 ) ) ( not ( = ?auto_239956 ?auto_239959 ) ) ( not ( = ?auto_239956 ?auto_239960 ) ) ( not ( = ?auto_239957 ?auto_239958 ) ) ( not ( = ?auto_239957 ?auto_239959 ) ) ( not ( = ?auto_239957 ?auto_239960 ) ) ( not ( = ?auto_239958 ?auto_239959 ) ) ( not ( = ?auto_239958 ?auto_239960 ) ) ( not ( = ?auto_239959 ?auto_239960 ) ) ( ON ?auto_239959 ?auto_239960 ) ( ON ?auto_239958 ?auto_239959 ) ( ON ?auto_239957 ?auto_239958 ) ( ON ?auto_239956 ?auto_239957 ) ( ON ?auto_239955 ?auto_239956 ) ( ON ?auto_239954 ?auto_239955 ) ( ON ?auto_239953 ?auto_239954 ) ( CLEAR ?auto_239951 ) ( ON ?auto_239952 ?auto_239953 ) ( CLEAR ?auto_239952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_239948 ?auto_239949 ?auto_239950 ?auto_239951 ?auto_239952 )
      ( MAKE-13PILE ?auto_239948 ?auto_239949 ?auto_239950 ?auto_239951 ?auto_239952 ?auto_239953 ?auto_239954 ?auto_239955 ?auto_239956 ?auto_239957 ?auto_239958 ?auto_239959 ?auto_239960 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_239974 - BLOCK
      ?auto_239975 - BLOCK
      ?auto_239976 - BLOCK
      ?auto_239977 - BLOCK
      ?auto_239978 - BLOCK
      ?auto_239979 - BLOCK
      ?auto_239980 - BLOCK
      ?auto_239981 - BLOCK
      ?auto_239982 - BLOCK
      ?auto_239983 - BLOCK
      ?auto_239984 - BLOCK
      ?auto_239985 - BLOCK
      ?auto_239986 - BLOCK
    )
    :vars
    (
      ?auto_239987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_239986 ?auto_239987 ) ( ON-TABLE ?auto_239974 ) ( ON ?auto_239975 ?auto_239974 ) ( ON ?auto_239976 ?auto_239975 ) ( not ( = ?auto_239974 ?auto_239975 ) ) ( not ( = ?auto_239974 ?auto_239976 ) ) ( not ( = ?auto_239974 ?auto_239977 ) ) ( not ( = ?auto_239974 ?auto_239978 ) ) ( not ( = ?auto_239974 ?auto_239979 ) ) ( not ( = ?auto_239974 ?auto_239980 ) ) ( not ( = ?auto_239974 ?auto_239981 ) ) ( not ( = ?auto_239974 ?auto_239982 ) ) ( not ( = ?auto_239974 ?auto_239983 ) ) ( not ( = ?auto_239974 ?auto_239984 ) ) ( not ( = ?auto_239974 ?auto_239985 ) ) ( not ( = ?auto_239974 ?auto_239986 ) ) ( not ( = ?auto_239974 ?auto_239987 ) ) ( not ( = ?auto_239975 ?auto_239976 ) ) ( not ( = ?auto_239975 ?auto_239977 ) ) ( not ( = ?auto_239975 ?auto_239978 ) ) ( not ( = ?auto_239975 ?auto_239979 ) ) ( not ( = ?auto_239975 ?auto_239980 ) ) ( not ( = ?auto_239975 ?auto_239981 ) ) ( not ( = ?auto_239975 ?auto_239982 ) ) ( not ( = ?auto_239975 ?auto_239983 ) ) ( not ( = ?auto_239975 ?auto_239984 ) ) ( not ( = ?auto_239975 ?auto_239985 ) ) ( not ( = ?auto_239975 ?auto_239986 ) ) ( not ( = ?auto_239975 ?auto_239987 ) ) ( not ( = ?auto_239976 ?auto_239977 ) ) ( not ( = ?auto_239976 ?auto_239978 ) ) ( not ( = ?auto_239976 ?auto_239979 ) ) ( not ( = ?auto_239976 ?auto_239980 ) ) ( not ( = ?auto_239976 ?auto_239981 ) ) ( not ( = ?auto_239976 ?auto_239982 ) ) ( not ( = ?auto_239976 ?auto_239983 ) ) ( not ( = ?auto_239976 ?auto_239984 ) ) ( not ( = ?auto_239976 ?auto_239985 ) ) ( not ( = ?auto_239976 ?auto_239986 ) ) ( not ( = ?auto_239976 ?auto_239987 ) ) ( not ( = ?auto_239977 ?auto_239978 ) ) ( not ( = ?auto_239977 ?auto_239979 ) ) ( not ( = ?auto_239977 ?auto_239980 ) ) ( not ( = ?auto_239977 ?auto_239981 ) ) ( not ( = ?auto_239977 ?auto_239982 ) ) ( not ( = ?auto_239977 ?auto_239983 ) ) ( not ( = ?auto_239977 ?auto_239984 ) ) ( not ( = ?auto_239977 ?auto_239985 ) ) ( not ( = ?auto_239977 ?auto_239986 ) ) ( not ( = ?auto_239977 ?auto_239987 ) ) ( not ( = ?auto_239978 ?auto_239979 ) ) ( not ( = ?auto_239978 ?auto_239980 ) ) ( not ( = ?auto_239978 ?auto_239981 ) ) ( not ( = ?auto_239978 ?auto_239982 ) ) ( not ( = ?auto_239978 ?auto_239983 ) ) ( not ( = ?auto_239978 ?auto_239984 ) ) ( not ( = ?auto_239978 ?auto_239985 ) ) ( not ( = ?auto_239978 ?auto_239986 ) ) ( not ( = ?auto_239978 ?auto_239987 ) ) ( not ( = ?auto_239979 ?auto_239980 ) ) ( not ( = ?auto_239979 ?auto_239981 ) ) ( not ( = ?auto_239979 ?auto_239982 ) ) ( not ( = ?auto_239979 ?auto_239983 ) ) ( not ( = ?auto_239979 ?auto_239984 ) ) ( not ( = ?auto_239979 ?auto_239985 ) ) ( not ( = ?auto_239979 ?auto_239986 ) ) ( not ( = ?auto_239979 ?auto_239987 ) ) ( not ( = ?auto_239980 ?auto_239981 ) ) ( not ( = ?auto_239980 ?auto_239982 ) ) ( not ( = ?auto_239980 ?auto_239983 ) ) ( not ( = ?auto_239980 ?auto_239984 ) ) ( not ( = ?auto_239980 ?auto_239985 ) ) ( not ( = ?auto_239980 ?auto_239986 ) ) ( not ( = ?auto_239980 ?auto_239987 ) ) ( not ( = ?auto_239981 ?auto_239982 ) ) ( not ( = ?auto_239981 ?auto_239983 ) ) ( not ( = ?auto_239981 ?auto_239984 ) ) ( not ( = ?auto_239981 ?auto_239985 ) ) ( not ( = ?auto_239981 ?auto_239986 ) ) ( not ( = ?auto_239981 ?auto_239987 ) ) ( not ( = ?auto_239982 ?auto_239983 ) ) ( not ( = ?auto_239982 ?auto_239984 ) ) ( not ( = ?auto_239982 ?auto_239985 ) ) ( not ( = ?auto_239982 ?auto_239986 ) ) ( not ( = ?auto_239982 ?auto_239987 ) ) ( not ( = ?auto_239983 ?auto_239984 ) ) ( not ( = ?auto_239983 ?auto_239985 ) ) ( not ( = ?auto_239983 ?auto_239986 ) ) ( not ( = ?auto_239983 ?auto_239987 ) ) ( not ( = ?auto_239984 ?auto_239985 ) ) ( not ( = ?auto_239984 ?auto_239986 ) ) ( not ( = ?auto_239984 ?auto_239987 ) ) ( not ( = ?auto_239985 ?auto_239986 ) ) ( not ( = ?auto_239985 ?auto_239987 ) ) ( not ( = ?auto_239986 ?auto_239987 ) ) ( ON ?auto_239985 ?auto_239986 ) ( ON ?auto_239984 ?auto_239985 ) ( ON ?auto_239983 ?auto_239984 ) ( ON ?auto_239982 ?auto_239983 ) ( ON ?auto_239981 ?auto_239982 ) ( ON ?auto_239980 ?auto_239981 ) ( ON ?auto_239979 ?auto_239980 ) ( ON ?auto_239978 ?auto_239979 ) ( CLEAR ?auto_239976 ) ( ON ?auto_239977 ?auto_239978 ) ( CLEAR ?auto_239977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_239974 ?auto_239975 ?auto_239976 ?auto_239977 )
      ( MAKE-13PILE ?auto_239974 ?auto_239975 ?auto_239976 ?auto_239977 ?auto_239978 ?auto_239979 ?auto_239980 ?auto_239981 ?auto_239982 ?auto_239983 ?auto_239984 ?auto_239985 ?auto_239986 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240001 - BLOCK
      ?auto_240002 - BLOCK
      ?auto_240003 - BLOCK
      ?auto_240004 - BLOCK
      ?auto_240005 - BLOCK
      ?auto_240006 - BLOCK
      ?auto_240007 - BLOCK
      ?auto_240008 - BLOCK
      ?auto_240009 - BLOCK
      ?auto_240010 - BLOCK
      ?auto_240011 - BLOCK
      ?auto_240012 - BLOCK
      ?auto_240013 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_240013 ) ( ON-TABLE ?auto_240001 ) ( ON ?auto_240002 ?auto_240001 ) ( ON ?auto_240003 ?auto_240002 ) ( not ( = ?auto_240001 ?auto_240002 ) ) ( not ( = ?auto_240001 ?auto_240003 ) ) ( not ( = ?auto_240001 ?auto_240004 ) ) ( not ( = ?auto_240001 ?auto_240005 ) ) ( not ( = ?auto_240001 ?auto_240006 ) ) ( not ( = ?auto_240001 ?auto_240007 ) ) ( not ( = ?auto_240001 ?auto_240008 ) ) ( not ( = ?auto_240001 ?auto_240009 ) ) ( not ( = ?auto_240001 ?auto_240010 ) ) ( not ( = ?auto_240001 ?auto_240011 ) ) ( not ( = ?auto_240001 ?auto_240012 ) ) ( not ( = ?auto_240001 ?auto_240013 ) ) ( not ( = ?auto_240002 ?auto_240003 ) ) ( not ( = ?auto_240002 ?auto_240004 ) ) ( not ( = ?auto_240002 ?auto_240005 ) ) ( not ( = ?auto_240002 ?auto_240006 ) ) ( not ( = ?auto_240002 ?auto_240007 ) ) ( not ( = ?auto_240002 ?auto_240008 ) ) ( not ( = ?auto_240002 ?auto_240009 ) ) ( not ( = ?auto_240002 ?auto_240010 ) ) ( not ( = ?auto_240002 ?auto_240011 ) ) ( not ( = ?auto_240002 ?auto_240012 ) ) ( not ( = ?auto_240002 ?auto_240013 ) ) ( not ( = ?auto_240003 ?auto_240004 ) ) ( not ( = ?auto_240003 ?auto_240005 ) ) ( not ( = ?auto_240003 ?auto_240006 ) ) ( not ( = ?auto_240003 ?auto_240007 ) ) ( not ( = ?auto_240003 ?auto_240008 ) ) ( not ( = ?auto_240003 ?auto_240009 ) ) ( not ( = ?auto_240003 ?auto_240010 ) ) ( not ( = ?auto_240003 ?auto_240011 ) ) ( not ( = ?auto_240003 ?auto_240012 ) ) ( not ( = ?auto_240003 ?auto_240013 ) ) ( not ( = ?auto_240004 ?auto_240005 ) ) ( not ( = ?auto_240004 ?auto_240006 ) ) ( not ( = ?auto_240004 ?auto_240007 ) ) ( not ( = ?auto_240004 ?auto_240008 ) ) ( not ( = ?auto_240004 ?auto_240009 ) ) ( not ( = ?auto_240004 ?auto_240010 ) ) ( not ( = ?auto_240004 ?auto_240011 ) ) ( not ( = ?auto_240004 ?auto_240012 ) ) ( not ( = ?auto_240004 ?auto_240013 ) ) ( not ( = ?auto_240005 ?auto_240006 ) ) ( not ( = ?auto_240005 ?auto_240007 ) ) ( not ( = ?auto_240005 ?auto_240008 ) ) ( not ( = ?auto_240005 ?auto_240009 ) ) ( not ( = ?auto_240005 ?auto_240010 ) ) ( not ( = ?auto_240005 ?auto_240011 ) ) ( not ( = ?auto_240005 ?auto_240012 ) ) ( not ( = ?auto_240005 ?auto_240013 ) ) ( not ( = ?auto_240006 ?auto_240007 ) ) ( not ( = ?auto_240006 ?auto_240008 ) ) ( not ( = ?auto_240006 ?auto_240009 ) ) ( not ( = ?auto_240006 ?auto_240010 ) ) ( not ( = ?auto_240006 ?auto_240011 ) ) ( not ( = ?auto_240006 ?auto_240012 ) ) ( not ( = ?auto_240006 ?auto_240013 ) ) ( not ( = ?auto_240007 ?auto_240008 ) ) ( not ( = ?auto_240007 ?auto_240009 ) ) ( not ( = ?auto_240007 ?auto_240010 ) ) ( not ( = ?auto_240007 ?auto_240011 ) ) ( not ( = ?auto_240007 ?auto_240012 ) ) ( not ( = ?auto_240007 ?auto_240013 ) ) ( not ( = ?auto_240008 ?auto_240009 ) ) ( not ( = ?auto_240008 ?auto_240010 ) ) ( not ( = ?auto_240008 ?auto_240011 ) ) ( not ( = ?auto_240008 ?auto_240012 ) ) ( not ( = ?auto_240008 ?auto_240013 ) ) ( not ( = ?auto_240009 ?auto_240010 ) ) ( not ( = ?auto_240009 ?auto_240011 ) ) ( not ( = ?auto_240009 ?auto_240012 ) ) ( not ( = ?auto_240009 ?auto_240013 ) ) ( not ( = ?auto_240010 ?auto_240011 ) ) ( not ( = ?auto_240010 ?auto_240012 ) ) ( not ( = ?auto_240010 ?auto_240013 ) ) ( not ( = ?auto_240011 ?auto_240012 ) ) ( not ( = ?auto_240011 ?auto_240013 ) ) ( not ( = ?auto_240012 ?auto_240013 ) ) ( ON ?auto_240012 ?auto_240013 ) ( ON ?auto_240011 ?auto_240012 ) ( ON ?auto_240010 ?auto_240011 ) ( ON ?auto_240009 ?auto_240010 ) ( ON ?auto_240008 ?auto_240009 ) ( ON ?auto_240007 ?auto_240008 ) ( ON ?auto_240006 ?auto_240007 ) ( ON ?auto_240005 ?auto_240006 ) ( CLEAR ?auto_240003 ) ( ON ?auto_240004 ?auto_240005 ) ( CLEAR ?auto_240004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_240001 ?auto_240002 ?auto_240003 ?auto_240004 )
      ( MAKE-13PILE ?auto_240001 ?auto_240002 ?auto_240003 ?auto_240004 ?auto_240005 ?auto_240006 ?auto_240007 ?auto_240008 ?auto_240009 ?auto_240010 ?auto_240011 ?auto_240012 ?auto_240013 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240027 - BLOCK
      ?auto_240028 - BLOCK
      ?auto_240029 - BLOCK
      ?auto_240030 - BLOCK
      ?auto_240031 - BLOCK
      ?auto_240032 - BLOCK
      ?auto_240033 - BLOCK
      ?auto_240034 - BLOCK
      ?auto_240035 - BLOCK
      ?auto_240036 - BLOCK
      ?auto_240037 - BLOCK
      ?auto_240038 - BLOCK
      ?auto_240039 - BLOCK
    )
    :vars
    (
      ?auto_240040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240039 ?auto_240040 ) ( ON-TABLE ?auto_240027 ) ( ON ?auto_240028 ?auto_240027 ) ( not ( = ?auto_240027 ?auto_240028 ) ) ( not ( = ?auto_240027 ?auto_240029 ) ) ( not ( = ?auto_240027 ?auto_240030 ) ) ( not ( = ?auto_240027 ?auto_240031 ) ) ( not ( = ?auto_240027 ?auto_240032 ) ) ( not ( = ?auto_240027 ?auto_240033 ) ) ( not ( = ?auto_240027 ?auto_240034 ) ) ( not ( = ?auto_240027 ?auto_240035 ) ) ( not ( = ?auto_240027 ?auto_240036 ) ) ( not ( = ?auto_240027 ?auto_240037 ) ) ( not ( = ?auto_240027 ?auto_240038 ) ) ( not ( = ?auto_240027 ?auto_240039 ) ) ( not ( = ?auto_240027 ?auto_240040 ) ) ( not ( = ?auto_240028 ?auto_240029 ) ) ( not ( = ?auto_240028 ?auto_240030 ) ) ( not ( = ?auto_240028 ?auto_240031 ) ) ( not ( = ?auto_240028 ?auto_240032 ) ) ( not ( = ?auto_240028 ?auto_240033 ) ) ( not ( = ?auto_240028 ?auto_240034 ) ) ( not ( = ?auto_240028 ?auto_240035 ) ) ( not ( = ?auto_240028 ?auto_240036 ) ) ( not ( = ?auto_240028 ?auto_240037 ) ) ( not ( = ?auto_240028 ?auto_240038 ) ) ( not ( = ?auto_240028 ?auto_240039 ) ) ( not ( = ?auto_240028 ?auto_240040 ) ) ( not ( = ?auto_240029 ?auto_240030 ) ) ( not ( = ?auto_240029 ?auto_240031 ) ) ( not ( = ?auto_240029 ?auto_240032 ) ) ( not ( = ?auto_240029 ?auto_240033 ) ) ( not ( = ?auto_240029 ?auto_240034 ) ) ( not ( = ?auto_240029 ?auto_240035 ) ) ( not ( = ?auto_240029 ?auto_240036 ) ) ( not ( = ?auto_240029 ?auto_240037 ) ) ( not ( = ?auto_240029 ?auto_240038 ) ) ( not ( = ?auto_240029 ?auto_240039 ) ) ( not ( = ?auto_240029 ?auto_240040 ) ) ( not ( = ?auto_240030 ?auto_240031 ) ) ( not ( = ?auto_240030 ?auto_240032 ) ) ( not ( = ?auto_240030 ?auto_240033 ) ) ( not ( = ?auto_240030 ?auto_240034 ) ) ( not ( = ?auto_240030 ?auto_240035 ) ) ( not ( = ?auto_240030 ?auto_240036 ) ) ( not ( = ?auto_240030 ?auto_240037 ) ) ( not ( = ?auto_240030 ?auto_240038 ) ) ( not ( = ?auto_240030 ?auto_240039 ) ) ( not ( = ?auto_240030 ?auto_240040 ) ) ( not ( = ?auto_240031 ?auto_240032 ) ) ( not ( = ?auto_240031 ?auto_240033 ) ) ( not ( = ?auto_240031 ?auto_240034 ) ) ( not ( = ?auto_240031 ?auto_240035 ) ) ( not ( = ?auto_240031 ?auto_240036 ) ) ( not ( = ?auto_240031 ?auto_240037 ) ) ( not ( = ?auto_240031 ?auto_240038 ) ) ( not ( = ?auto_240031 ?auto_240039 ) ) ( not ( = ?auto_240031 ?auto_240040 ) ) ( not ( = ?auto_240032 ?auto_240033 ) ) ( not ( = ?auto_240032 ?auto_240034 ) ) ( not ( = ?auto_240032 ?auto_240035 ) ) ( not ( = ?auto_240032 ?auto_240036 ) ) ( not ( = ?auto_240032 ?auto_240037 ) ) ( not ( = ?auto_240032 ?auto_240038 ) ) ( not ( = ?auto_240032 ?auto_240039 ) ) ( not ( = ?auto_240032 ?auto_240040 ) ) ( not ( = ?auto_240033 ?auto_240034 ) ) ( not ( = ?auto_240033 ?auto_240035 ) ) ( not ( = ?auto_240033 ?auto_240036 ) ) ( not ( = ?auto_240033 ?auto_240037 ) ) ( not ( = ?auto_240033 ?auto_240038 ) ) ( not ( = ?auto_240033 ?auto_240039 ) ) ( not ( = ?auto_240033 ?auto_240040 ) ) ( not ( = ?auto_240034 ?auto_240035 ) ) ( not ( = ?auto_240034 ?auto_240036 ) ) ( not ( = ?auto_240034 ?auto_240037 ) ) ( not ( = ?auto_240034 ?auto_240038 ) ) ( not ( = ?auto_240034 ?auto_240039 ) ) ( not ( = ?auto_240034 ?auto_240040 ) ) ( not ( = ?auto_240035 ?auto_240036 ) ) ( not ( = ?auto_240035 ?auto_240037 ) ) ( not ( = ?auto_240035 ?auto_240038 ) ) ( not ( = ?auto_240035 ?auto_240039 ) ) ( not ( = ?auto_240035 ?auto_240040 ) ) ( not ( = ?auto_240036 ?auto_240037 ) ) ( not ( = ?auto_240036 ?auto_240038 ) ) ( not ( = ?auto_240036 ?auto_240039 ) ) ( not ( = ?auto_240036 ?auto_240040 ) ) ( not ( = ?auto_240037 ?auto_240038 ) ) ( not ( = ?auto_240037 ?auto_240039 ) ) ( not ( = ?auto_240037 ?auto_240040 ) ) ( not ( = ?auto_240038 ?auto_240039 ) ) ( not ( = ?auto_240038 ?auto_240040 ) ) ( not ( = ?auto_240039 ?auto_240040 ) ) ( ON ?auto_240038 ?auto_240039 ) ( ON ?auto_240037 ?auto_240038 ) ( ON ?auto_240036 ?auto_240037 ) ( ON ?auto_240035 ?auto_240036 ) ( ON ?auto_240034 ?auto_240035 ) ( ON ?auto_240033 ?auto_240034 ) ( ON ?auto_240032 ?auto_240033 ) ( ON ?auto_240031 ?auto_240032 ) ( ON ?auto_240030 ?auto_240031 ) ( CLEAR ?auto_240028 ) ( ON ?auto_240029 ?auto_240030 ) ( CLEAR ?auto_240029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240027 ?auto_240028 ?auto_240029 )
      ( MAKE-13PILE ?auto_240027 ?auto_240028 ?auto_240029 ?auto_240030 ?auto_240031 ?auto_240032 ?auto_240033 ?auto_240034 ?auto_240035 ?auto_240036 ?auto_240037 ?auto_240038 ?auto_240039 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240054 - BLOCK
      ?auto_240055 - BLOCK
      ?auto_240056 - BLOCK
      ?auto_240057 - BLOCK
      ?auto_240058 - BLOCK
      ?auto_240059 - BLOCK
      ?auto_240060 - BLOCK
      ?auto_240061 - BLOCK
      ?auto_240062 - BLOCK
      ?auto_240063 - BLOCK
      ?auto_240064 - BLOCK
      ?auto_240065 - BLOCK
      ?auto_240066 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_240066 ) ( ON-TABLE ?auto_240054 ) ( ON ?auto_240055 ?auto_240054 ) ( not ( = ?auto_240054 ?auto_240055 ) ) ( not ( = ?auto_240054 ?auto_240056 ) ) ( not ( = ?auto_240054 ?auto_240057 ) ) ( not ( = ?auto_240054 ?auto_240058 ) ) ( not ( = ?auto_240054 ?auto_240059 ) ) ( not ( = ?auto_240054 ?auto_240060 ) ) ( not ( = ?auto_240054 ?auto_240061 ) ) ( not ( = ?auto_240054 ?auto_240062 ) ) ( not ( = ?auto_240054 ?auto_240063 ) ) ( not ( = ?auto_240054 ?auto_240064 ) ) ( not ( = ?auto_240054 ?auto_240065 ) ) ( not ( = ?auto_240054 ?auto_240066 ) ) ( not ( = ?auto_240055 ?auto_240056 ) ) ( not ( = ?auto_240055 ?auto_240057 ) ) ( not ( = ?auto_240055 ?auto_240058 ) ) ( not ( = ?auto_240055 ?auto_240059 ) ) ( not ( = ?auto_240055 ?auto_240060 ) ) ( not ( = ?auto_240055 ?auto_240061 ) ) ( not ( = ?auto_240055 ?auto_240062 ) ) ( not ( = ?auto_240055 ?auto_240063 ) ) ( not ( = ?auto_240055 ?auto_240064 ) ) ( not ( = ?auto_240055 ?auto_240065 ) ) ( not ( = ?auto_240055 ?auto_240066 ) ) ( not ( = ?auto_240056 ?auto_240057 ) ) ( not ( = ?auto_240056 ?auto_240058 ) ) ( not ( = ?auto_240056 ?auto_240059 ) ) ( not ( = ?auto_240056 ?auto_240060 ) ) ( not ( = ?auto_240056 ?auto_240061 ) ) ( not ( = ?auto_240056 ?auto_240062 ) ) ( not ( = ?auto_240056 ?auto_240063 ) ) ( not ( = ?auto_240056 ?auto_240064 ) ) ( not ( = ?auto_240056 ?auto_240065 ) ) ( not ( = ?auto_240056 ?auto_240066 ) ) ( not ( = ?auto_240057 ?auto_240058 ) ) ( not ( = ?auto_240057 ?auto_240059 ) ) ( not ( = ?auto_240057 ?auto_240060 ) ) ( not ( = ?auto_240057 ?auto_240061 ) ) ( not ( = ?auto_240057 ?auto_240062 ) ) ( not ( = ?auto_240057 ?auto_240063 ) ) ( not ( = ?auto_240057 ?auto_240064 ) ) ( not ( = ?auto_240057 ?auto_240065 ) ) ( not ( = ?auto_240057 ?auto_240066 ) ) ( not ( = ?auto_240058 ?auto_240059 ) ) ( not ( = ?auto_240058 ?auto_240060 ) ) ( not ( = ?auto_240058 ?auto_240061 ) ) ( not ( = ?auto_240058 ?auto_240062 ) ) ( not ( = ?auto_240058 ?auto_240063 ) ) ( not ( = ?auto_240058 ?auto_240064 ) ) ( not ( = ?auto_240058 ?auto_240065 ) ) ( not ( = ?auto_240058 ?auto_240066 ) ) ( not ( = ?auto_240059 ?auto_240060 ) ) ( not ( = ?auto_240059 ?auto_240061 ) ) ( not ( = ?auto_240059 ?auto_240062 ) ) ( not ( = ?auto_240059 ?auto_240063 ) ) ( not ( = ?auto_240059 ?auto_240064 ) ) ( not ( = ?auto_240059 ?auto_240065 ) ) ( not ( = ?auto_240059 ?auto_240066 ) ) ( not ( = ?auto_240060 ?auto_240061 ) ) ( not ( = ?auto_240060 ?auto_240062 ) ) ( not ( = ?auto_240060 ?auto_240063 ) ) ( not ( = ?auto_240060 ?auto_240064 ) ) ( not ( = ?auto_240060 ?auto_240065 ) ) ( not ( = ?auto_240060 ?auto_240066 ) ) ( not ( = ?auto_240061 ?auto_240062 ) ) ( not ( = ?auto_240061 ?auto_240063 ) ) ( not ( = ?auto_240061 ?auto_240064 ) ) ( not ( = ?auto_240061 ?auto_240065 ) ) ( not ( = ?auto_240061 ?auto_240066 ) ) ( not ( = ?auto_240062 ?auto_240063 ) ) ( not ( = ?auto_240062 ?auto_240064 ) ) ( not ( = ?auto_240062 ?auto_240065 ) ) ( not ( = ?auto_240062 ?auto_240066 ) ) ( not ( = ?auto_240063 ?auto_240064 ) ) ( not ( = ?auto_240063 ?auto_240065 ) ) ( not ( = ?auto_240063 ?auto_240066 ) ) ( not ( = ?auto_240064 ?auto_240065 ) ) ( not ( = ?auto_240064 ?auto_240066 ) ) ( not ( = ?auto_240065 ?auto_240066 ) ) ( ON ?auto_240065 ?auto_240066 ) ( ON ?auto_240064 ?auto_240065 ) ( ON ?auto_240063 ?auto_240064 ) ( ON ?auto_240062 ?auto_240063 ) ( ON ?auto_240061 ?auto_240062 ) ( ON ?auto_240060 ?auto_240061 ) ( ON ?auto_240059 ?auto_240060 ) ( ON ?auto_240058 ?auto_240059 ) ( ON ?auto_240057 ?auto_240058 ) ( CLEAR ?auto_240055 ) ( ON ?auto_240056 ?auto_240057 ) ( CLEAR ?auto_240056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_240054 ?auto_240055 ?auto_240056 )
      ( MAKE-13PILE ?auto_240054 ?auto_240055 ?auto_240056 ?auto_240057 ?auto_240058 ?auto_240059 ?auto_240060 ?auto_240061 ?auto_240062 ?auto_240063 ?auto_240064 ?auto_240065 ?auto_240066 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240080 - BLOCK
      ?auto_240081 - BLOCK
      ?auto_240082 - BLOCK
      ?auto_240083 - BLOCK
      ?auto_240084 - BLOCK
      ?auto_240085 - BLOCK
      ?auto_240086 - BLOCK
      ?auto_240087 - BLOCK
      ?auto_240088 - BLOCK
      ?auto_240089 - BLOCK
      ?auto_240090 - BLOCK
      ?auto_240091 - BLOCK
      ?auto_240092 - BLOCK
    )
    :vars
    (
      ?auto_240093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240092 ?auto_240093 ) ( ON-TABLE ?auto_240080 ) ( not ( = ?auto_240080 ?auto_240081 ) ) ( not ( = ?auto_240080 ?auto_240082 ) ) ( not ( = ?auto_240080 ?auto_240083 ) ) ( not ( = ?auto_240080 ?auto_240084 ) ) ( not ( = ?auto_240080 ?auto_240085 ) ) ( not ( = ?auto_240080 ?auto_240086 ) ) ( not ( = ?auto_240080 ?auto_240087 ) ) ( not ( = ?auto_240080 ?auto_240088 ) ) ( not ( = ?auto_240080 ?auto_240089 ) ) ( not ( = ?auto_240080 ?auto_240090 ) ) ( not ( = ?auto_240080 ?auto_240091 ) ) ( not ( = ?auto_240080 ?auto_240092 ) ) ( not ( = ?auto_240080 ?auto_240093 ) ) ( not ( = ?auto_240081 ?auto_240082 ) ) ( not ( = ?auto_240081 ?auto_240083 ) ) ( not ( = ?auto_240081 ?auto_240084 ) ) ( not ( = ?auto_240081 ?auto_240085 ) ) ( not ( = ?auto_240081 ?auto_240086 ) ) ( not ( = ?auto_240081 ?auto_240087 ) ) ( not ( = ?auto_240081 ?auto_240088 ) ) ( not ( = ?auto_240081 ?auto_240089 ) ) ( not ( = ?auto_240081 ?auto_240090 ) ) ( not ( = ?auto_240081 ?auto_240091 ) ) ( not ( = ?auto_240081 ?auto_240092 ) ) ( not ( = ?auto_240081 ?auto_240093 ) ) ( not ( = ?auto_240082 ?auto_240083 ) ) ( not ( = ?auto_240082 ?auto_240084 ) ) ( not ( = ?auto_240082 ?auto_240085 ) ) ( not ( = ?auto_240082 ?auto_240086 ) ) ( not ( = ?auto_240082 ?auto_240087 ) ) ( not ( = ?auto_240082 ?auto_240088 ) ) ( not ( = ?auto_240082 ?auto_240089 ) ) ( not ( = ?auto_240082 ?auto_240090 ) ) ( not ( = ?auto_240082 ?auto_240091 ) ) ( not ( = ?auto_240082 ?auto_240092 ) ) ( not ( = ?auto_240082 ?auto_240093 ) ) ( not ( = ?auto_240083 ?auto_240084 ) ) ( not ( = ?auto_240083 ?auto_240085 ) ) ( not ( = ?auto_240083 ?auto_240086 ) ) ( not ( = ?auto_240083 ?auto_240087 ) ) ( not ( = ?auto_240083 ?auto_240088 ) ) ( not ( = ?auto_240083 ?auto_240089 ) ) ( not ( = ?auto_240083 ?auto_240090 ) ) ( not ( = ?auto_240083 ?auto_240091 ) ) ( not ( = ?auto_240083 ?auto_240092 ) ) ( not ( = ?auto_240083 ?auto_240093 ) ) ( not ( = ?auto_240084 ?auto_240085 ) ) ( not ( = ?auto_240084 ?auto_240086 ) ) ( not ( = ?auto_240084 ?auto_240087 ) ) ( not ( = ?auto_240084 ?auto_240088 ) ) ( not ( = ?auto_240084 ?auto_240089 ) ) ( not ( = ?auto_240084 ?auto_240090 ) ) ( not ( = ?auto_240084 ?auto_240091 ) ) ( not ( = ?auto_240084 ?auto_240092 ) ) ( not ( = ?auto_240084 ?auto_240093 ) ) ( not ( = ?auto_240085 ?auto_240086 ) ) ( not ( = ?auto_240085 ?auto_240087 ) ) ( not ( = ?auto_240085 ?auto_240088 ) ) ( not ( = ?auto_240085 ?auto_240089 ) ) ( not ( = ?auto_240085 ?auto_240090 ) ) ( not ( = ?auto_240085 ?auto_240091 ) ) ( not ( = ?auto_240085 ?auto_240092 ) ) ( not ( = ?auto_240085 ?auto_240093 ) ) ( not ( = ?auto_240086 ?auto_240087 ) ) ( not ( = ?auto_240086 ?auto_240088 ) ) ( not ( = ?auto_240086 ?auto_240089 ) ) ( not ( = ?auto_240086 ?auto_240090 ) ) ( not ( = ?auto_240086 ?auto_240091 ) ) ( not ( = ?auto_240086 ?auto_240092 ) ) ( not ( = ?auto_240086 ?auto_240093 ) ) ( not ( = ?auto_240087 ?auto_240088 ) ) ( not ( = ?auto_240087 ?auto_240089 ) ) ( not ( = ?auto_240087 ?auto_240090 ) ) ( not ( = ?auto_240087 ?auto_240091 ) ) ( not ( = ?auto_240087 ?auto_240092 ) ) ( not ( = ?auto_240087 ?auto_240093 ) ) ( not ( = ?auto_240088 ?auto_240089 ) ) ( not ( = ?auto_240088 ?auto_240090 ) ) ( not ( = ?auto_240088 ?auto_240091 ) ) ( not ( = ?auto_240088 ?auto_240092 ) ) ( not ( = ?auto_240088 ?auto_240093 ) ) ( not ( = ?auto_240089 ?auto_240090 ) ) ( not ( = ?auto_240089 ?auto_240091 ) ) ( not ( = ?auto_240089 ?auto_240092 ) ) ( not ( = ?auto_240089 ?auto_240093 ) ) ( not ( = ?auto_240090 ?auto_240091 ) ) ( not ( = ?auto_240090 ?auto_240092 ) ) ( not ( = ?auto_240090 ?auto_240093 ) ) ( not ( = ?auto_240091 ?auto_240092 ) ) ( not ( = ?auto_240091 ?auto_240093 ) ) ( not ( = ?auto_240092 ?auto_240093 ) ) ( ON ?auto_240091 ?auto_240092 ) ( ON ?auto_240090 ?auto_240091 ) ( ON ?auto_240089 ?auto_240090 ) ( ON ?auto_240088 ?auto_240089 ) ( ON ?auto_240087 ?auto_240088 ) ( ON ?auto_240086 ?auto_240087 ) ( ON ?auto_240085 ?auto_240086 ) ( ON ?auto_240084 ?auto_240085 ) ( ON ?auto_240083 ?auto_240084 ) ( ON ?auto_240082 ?auto_240083 ) ( CLEAR ?auto_240080 ) ( ON ?auto_240081 ?auto_240082 ) ( CLEAR ?auto_240081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240080 ?auto_240081 )
      ( MAKE-13PILE ?auto_240080 ?auto_240081 ?auto_240082 ?auto_240083 ?auto_240084 ?auto_240085 ?auto_240086 ?auto_240087 ?auto_240088 ?auto_240089 ?auto_240090 ?auto_240091 ?auto_240092 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240107 - BLOCK
      ?auto_240108 - BLOCK
      ?auto_240109 - BLOCK
      ?auto_240110 - BLOCK
      ?auto_240111 - BLOCK
      ?auto_240112 - BLOCK
      ?auto_240113 - BLOCK
      ?auto_240114 - BLOCK
      ?auto_240115 - BLOCK
      ?auto_240116 - BLOCK
      ?auto_240117 - BLOCK
      ?auto_240118 - BLOCK
      ?auto_240119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_240119 ) ( ON-TABLE ?auto_240107 ) ( not ( = ?auto_240107 ?auto_240108 ) ) ( not ( = ?auto_240107 ?auto_240109 ) ) ( not ( = ?auto_240107 ?auto_240110 ) ) ( not ( = ?auto_240107 ?auto_240111 ) ) ( not ( = ?auto_240107 ?auto_240112 ) ) ( not ( = ?auto_240107 ?auto_240113 ) ) ( not ( = ?auto_240107 ?auto_240114 ) ) ( not ( = ?auto_240107 ?auto_240115 ) ) ( not ( = ?auto_240107 ?auto_240116 ) ) ( not ( = ?auto_240107 ?auto_240117 ) ) ( not ( = ?auto_240107 ?auto_240118 ) ) ( not ( = ?auto_240107 ?auto_240119 ) ) ( not ( = ?auto_240108 ?auto_240109 ) ) ( not ( = ?auto_240108 ?auto_240110 ) ) ( not ( = ?auto_240108 ?auto_240111 ) ) ( not ( = ?auto_240108 ?auto_240112 ) ) ( not ( = ?auto_240108 ?auto_240113 ) ) ( not ( = ?auto_240108 ?auto_240114 ) ) ( not ( = ?auto_240108 ?auto_240115 ) ) ( not ( = ?auto_240108 ?auto_240116 ) ) ( not ( = ?auto_240108 ?auto_240117 ) ) ( not ( = ?auto_240108 ?auto_240118 ) ) ( not ( = ?auto_240108 ?auto_240119 ) ) ( not ( = ?auto_240109 ?auto_240110 ) ) ( not ( = ?auto_240109 ?auto_240111 ) ) ( not ( = ?auto_240109 ?auto_240112 ) ) ( not ( = ?auto_240109 ?auto_240113 ) ) ( not ( = ?auto_240109 ?auto_240114 ) ) ( not ( = ?auto_240109 ?auto_240115 ) ) ( not ( = ?auto_240109 ?auto_240116 ) ) ( not ( = ?auto_240109 ?auto_240117 ) ) ( not ( = ?auto_240109 ?auto_240118 ) ) ( not ( = ?auto_240109 ?auto_240119 ) ) ( not ( = ?auto_240110 ?auto_240111 ) ) ( not ( = ?auto_240110 ?auto_240112 ) ) ( not ( = ?auto_240110 ?auto_240113 ) ) ( not ( = ?auto_240110 ?auto_240114 ) ) ( not ( = ?auto_240110 ?auto_240115 ) ) ( not ( = ?auto_240110 ?auto_240116 ) ) ( not ( = ?auto_240110 ?auto_240117 ) ) ( not ( = ?auto_240110 ?auto_240118 ) ) ( not ( = ?auto_240110 ?auto_240119 ) ) ( not ( = ?auto_240111 ?auto_240112 ) ) ( not ( = ?auto_240111 ?auto_240113 ) ) ( not ( = ?auto_240111 ?auto_240114 ) ) ( not ( = ?auto_240111 ?auto_240115 ) ) ( not ( = ?auto_240111 ?auto_240116 ) ) ( not ( = ?auto_240111 ?auto_240117 ) ) ( not ( = ?auto_240111 ?auto_240118 ) ) ( not ( = ?auto_240111 ?auto_240119 ) ) ( not ( = ?auto_240112 ?auto_240113 ) ) ( not ( = ?auto_240112 ?auto_240114 ) ) ( not ( = ?auto_240112 ?auto_240115 ) ) ( not ( = ?auto_240112 ?auto_240116 ) ) ( not ( = ?auto_240112 ?auto_240117 ) ) ( not ( = ?auto_240112 ?auto_240118 ) ) ( not ( = ?auto_240112 ?auto_240119 ) ) ( not ( = ?auto_240113 ?auto_240114 ) ) ( not ( = ?auto_240113 ?auto_240115 ) ) ( not ( = ?auto_240113 ?auto_240116 ) ) ( not ( = ?auto_240113 ?auto_240117 ) ) ( not ( = ?auto_240113 ?auto_240118 ) ) ( not ( = ?auto_240113 ?auto_240119 ) ) ( not ( = ?auto_240114 ?auto_240115 ) ) ( not ( = ?auto_240114 ?auto_240116 ) ) ( not ( = ?auto_240114 ?auto_240117 ) ) ( not ( = ?auto_240114 ?auto_240118 ) ) ( not ( = ?auto_240114 ?auto_240119 ) ) ( not ( = ?auto_240115 ?auto_240116 ) ) ( not ( = ?auto_240115 ?auto_240117 ) ) ( not ( = ?auto_240115 ?auto_240118 ) ) ( not ( = ?auto_240115 ?auto_240119 ) ) ( not ( = ?auto_240116 ?auto_240117 ) ) ( not ( = ?auto_240116 ?auto_240118 ) ) ( not ( = ?auto_240116 ?auto_240119 ) ) ( not ( = ?auto_240117 ?auto_240118 ) ) ( not ( = ?auto_240117 ?auto_240119 ) ) ( not ( = ?auto_240118 ?auto_240119 ) ) ( ON ?auto_240118 ?auto_240119 ) ( ON ?auto_240117 ?auto_240118 ) ( ON ?auto_240116 ?auto_240117 ) ( ON ?auto_240115 ?auto_240116 ) ( ON ?auto_240114 ?auto_240115 ) ( ON ?auto_240113 ?auto_240114 ) ( ON ?auto_240112 ?auto_240113 ) ( ON ?auto_240111 ?auto_240112 ) ( ON ?auto_240110 ?auto_240111 ) ( ON ?auto_240109 ?auto_240110 ) ( CLEAR ?auto_240107 ) ( ON ?auto_240108 ?auto_240109 ) ( CLEAR ?auto_240108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_240107 ?auto_240108 )
      ( MAKE-13PILE ?auto_240107 ?auto_240108 ?auto_240109 ?auto_240110 ?auto_240111 ?auto_240112 ?auto_240113 ?auto_240114 ?auto_240115 ?auto_240116 ?auto_240117 ?auto_240118 ?auto_240119 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240133 - BLOCK
      ?auto_240134 - BLOCK
      ?auto_240135 - BLOCK
      ?auto_240136 - BLOCK
      ?auto_240137 - BLOCK
      ?auto_240138 - BLOCK
      ?auto_240139 - BLOCK
      ?auto_240140 - BLOCK
      ?auto_240141 - BLOCK
      ?auto_240142 - BLOCK
      ?auto_240143 - BLOCK
      ?auto_240144 - BLOCK
      ?auto_240145 - BLOCK
    )
    :vars
    (
      ?auto_240146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_240145 ?auto_240146 ) ( not ( = ?auto_240133 ?auto_240134 ) ) ( not ( = ?auto_240133 ?auto_240135 ) ) ( not ( = ?auto_240133 ?auto_240136 ) ) ( not ( = ?auto_240133 ?auto_240137 ) ) ( not ( = ?auto_240133 ?auto_240138 ) ) ( not ( = ?auto_240133 ?auto_240139 ) ) ( not ( = ?auto_240133 ?auto_240140 ) ) ( not ( = ?auto_240133 ?auto_240141 ) ) ( not ( = ?auto_240133 ?auto_240142 ) ) ( not ( = ?auto_240133 ?auto_240143 ) ) ( not ( = ?auto_240133 ?auto_240144 ) ) ( not ( = ?auto_240133 ?auto_240145 ) ) ( not ( = ?auto_240133 ?auto_240146 ) ) ( not ( = ?auto_240134 ?auto_240135 ) ) ( not ( = ?auto_240134 ?auto_240136 ) ) ( not ( = ?auto_240134 ?auto_240137 ) ) ( not ( = ?auto_240134 ?auto_240138 ) ) ( not ( = ?auto_240134 ?auto_240139 ) ) ( not ( = ?auto_240134 ?auto_240140 ) ) ( not ( = ?auto_240134 ?auto_240141 ) ) ( not ( = ?auto_240134 ?auto_240142 ) ) ( not ( = ?auto_240134 ?auto_240143 ) ) ( not ( = ?auto_240134 ?auto_240144 ) ) ( not ( = ?auto_240134 ?auto_240145 ) ) ( not ( = ?auto_240134 ?auto_240146 ) ) ( not ( = ?auto_240135 ?auto_240136 ) ) ( not ( = ?auto_240135 ?auto_240137 ) ) ( not ( = ?auto_240135 ?auto_240138 ) ) ( not ( = ?auto_240135 ?auto_240139 ) ) ( not ( = ?auto_240135 ?auto_240140 ) ) ( not ( = ?auto_240135 ?auto_240141 ) ) ( not ( = ?auto_240135 ?auto_240142 ) ) ( not ( = ?auto_240135 ?auto_240143 ) ) ( not ( = ?auto_240135 ?auto_240144 ) ) ( not ( = ?auto_240135 ?auto_240145 ) ) ( not ( = ?auto_240135 ?auto_240146 ) ) ( not ( = ?auto_240136 ?auto_240137 ) ) ( not ( = ?auto_240136 ?auto_240138 ) ) ( not ( = ?auto_240136 ?auto_240139 ) ) ( not ( = ?auto_240136 ?auto_240140 ) ) ( not ( = ?auto_240136 ?auto_240141 ) ) ( not ( = ?auto_240136 ?auto_240142 ) ) ( not ( = ?auto_240136 ?auto_240143 ) ) ( not ( = ?auto_240136 ?auto_240144 ) ) ( not ( = ?auto_240136 ?auto_240145 ) ) ( not ( = ?auto_240136 ?auto_240146 ) ) ( not ( = ?auto_240137 ?auto_240138 ) ) ( not ( = ?auto_240137 ?auto_240139 ) ) ( not ( = ?auto_240137 ?auto_240140 ) ) ( not ( = ?auto_240137 ?auto_240141 ) ) ( not ( = ?auto_240137 ?auto_240142 ) ) ( not ( = ?auto_240137 ?auto_240143 ) ) ( not ( = ?auto_240137 ?auto_240144 ) ) ( not ( = ?auto_240137 ?auto_240145 ) ) ( not ( = ?auto_240137 ?auto_240146 ) ) ( not ( = ?auto_240138 ?auto_240139 ) ) ( not ( = ?auto_240138 ?auto_240140 ) ) ( not ( = ?auto_240138 ?auto_240141 ) ) ( not ( = ?auto_240138 ?auto_240142 ) ) ( not ( = ?auto_240138 ?auto_240143 ) ) ( not ( = ?auto_240138 ?auto_240144 ) ) ( not ( = ?auto_240138 ?auto_240145 ) ) ( not ( = ?auto_240138 ?auto_240146 ) ) ( not ( = ?auto_240139 ?auto_240140 ) ) ( not ( = ?auto_240139 ?auto_240141 ) ) ( not ( = ?auto_240139 ?auto_240142 ) ) ( not ( = ?auto_240139 ?auto_240143 ) ) ( not ( = ?auto_240139 ?auto_240144 ) ) ( not ( = ?auto_240139 ?auto_240145 ) ) ( not ( = ?auto_240139 ?auto_240146 ) ) ( not ( = ?auto_240140 ?auto_240141 ) ) ( not ( = ?auto_240140 ?auto_240142 ) ) ( not ( = ?auto_240140 ?auto_240143 ) ) ( not ( = ?auto_240140 ?auto_240144 ) ) ( not ( = ?auto_240140 ?auto_240145 ) ) ( not ( = ?auto_240140 ?auto_240146 ) ) ( not ( = ?auto_240141 ?auto_240142 ) ) ( not ( = ?auto_240141 ?auto_240143 ) ) ( not ( = ?auto_240141 ?auto_240144 ) ) ( not ( = ?auto_240141 ?auto_240145 ) ) ( not ( = ?auto_240141 ?auto_240146 ) ) ( not ( = ?auto_240142 ?auto_240143 ) ) ( not ( = ?auto_240142 ?auto_240144 ) ) ( not ( = ?auto_240142 ?auto_240145 ) ) ( not ( = ?auto_240142 ?auto_240146 ) ) ( not ( = ?auto_240143 ?auto_240144 ) ) ( not ( = ?auto_240143 ?auto_240145 ) ) ( not ( = ?auto_240143 ?auto_240146 ) ) ( not ( = ?auto_240144 ?auto_240145 ) ) ( not ( = ?auto_240144 ?auto_240146 ) ) ( not ( = ?auto_240145 ?auto_240146 ) ) ( ON ?auto_240144 ?auto_240145 ) ( ON ?auto_240143 ?auto_240144 ) ( ON ?auto_240142 ?auto_240143 ) ( ON ?auto_240141 ?auto_240142 ) ( ON ?auto_240140 ?auto_240141 ) ( ON ?auto_240139 ?auto_240140 ) ( ON ?auto_240138 ?auto_240139 ) ( ON ?auto_240137 ?auto_240138 ) ( ON ?auto_240136 ?auto_240137 ) ( ON ?auto_240135 ?auto_240136 ) ( ON ?auto_240134 ?auto_240135 ) ( ON ?auto_240133 ?auto_240134 ) ( CLEAR ?auto_240133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240133 )
      ( MAKE-13PILE ?auto_240133 ?auto_240134 ?auto_240135 ?auto_240136 ?auto_240137 ?auto_240138 ?auto_240139 ?auto_240140 ?auto_240141 ?auto_240142 ?auto_240143 ?auto_240144 ?auto_240145 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240160 - BLOCK
      ?auto_240161 - BLOCK
      ?auto_240162 - BLOCK
      ?auto_240163 - BLOCK
      ?auto_240164 - BLOCK
      ?auto_240165 - BLOCK
      ?auto_240166 - BLOCK
      ?auto_240167 - BLOCK
      ?auto_240168 - BLOCK
      ?auto_240169 - BLOCK
      ?auto_240170 - BLOCK
      ?auto_240171 - BLOCK
      ?auto_240172 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_240172 ) ( not ( = ?auto_240160 ?auto_240161 ) ) ( not ( = ?auto_240160 ?auto_240162 ) ) ( not ( = ?auto_240160 ?auto_240163 ) ) ( not ( = ?auto_240160 ?auto_240164 ) ) ( not ( = ?auto_240160 ?auto_240165 ) ) ( not ( = ?auto_240160 ?auto_240166 ) ) ( not ( = ?auto_240160 ?auto_240167 ) ) ( not ( = ?auto_240160 ?auto_240168 ) ) ( not ( = ?auto_240160 ?auto_240169 ) ) ( not ( = ?auto_240160 ?auto_240170 ) ) ( not ( = ?auto_240160 ?auto_240171 ) ) ( not ( = ?auto_240160 ?auto_240172 ) ) ( not ( = ?auto_240161 ?auto_240162 ) ) ( not ( = ?auto_240161 ?auto_240163 ) ) ( not ( = ?auto_240161 ?auto_240164 ) ) ( not ( = ?auto_240161 ?auto_240165 ) ) ( not ( = ?auto_240161 ?auto_240166 ) ) ( not ( = ?auto_240161 ?auto_240167 ) ) ( not ( = ?auto_240161 ?auto_240168 ) ) ( not ( = ?auto_240161 ?auto_240169 ) ) ( not ( = ?auto_240161 ?auto_240170 ) ) ( not ( = ?auto_240161 ?auto_240171 ) ) ( not ( = ?auto_240161 ?auto_240172 ) ) ( not ( = ?auto_240162 ?auto_240163 ) ) ( not ( = ?auto_240162 ?auto_240164 ) ) ( not ( = ?auto_240162 ?auto_240165 ) ) ( not ( = ?auto_240162 ?auto_240166 ) ) ( not ( = ?auto_240162 ?auto_240167 ) ) ( not ( = ?auto_240162 ?auto_240168 ) ) ( not ( = ?auto_240162 ?auto_240169 ) ) ( not ( = ?auto_240162 ?auto_240170 ) ) ( not ( = ?auto_240162 ?auto_240171 ) ) ( not ( = ?auto_240162 ?auto_240172 ) ) ( not ( = ?auto_240163 ?auto_240164 ) ) ( not ( = ?auto_240163 ?auto_240165 ) ) ( not ( = ?auto_240163 ?auto_240166 ) ) ( not ( = ?auto_240163 ?auto_240167 ) ) ( not ( = ?auto_240163 ?auto_240168 ) ) ( not ( = ?auto_240163 ?auto_240169 ) ) ( not ( = ?auto_240163 ?auto_240170 ) ) ( not ( = ?auto_240163 ?auto_240171 ) ) ( not ( = ?auto_240163 ?auto_240172 ) ) ( not ( = ?auto_240164 ?auto_240165 ) ) ( not ( = ?auto_240164 ?auto_240166 ) ) ( not ( = ?auto_240164 ?auto_240167 ) ) ( not ( = ?auto_240164 ?auto_240168 ) ) ( not ( = ?auto_240164 ?auto_240169 ) ) ( not ( = ?auto_240164 ?auto_240170 ) ) ( not ( = ?auto_240164 ?auto_240171 ) ) ( not ( = ?auto_240164 ?auto_240172 ) ) ( not ( = ?auto_240165 ?auto_240166 ) ) ( not ( = ?auto_240165 ?auto_240167 ) ) ( not ( = ?auto_240165 ?auto_240168 ) ) ( not ( = ?auto_240165 ?auto_240169 ) ) ( not ( = ?auto_240165 ?auto_240170 ) ) ( not ( = ?auto_240165 ?auto_240171 ) ) ( not ( = ?auto_240165 ?auto_240172 ) ) ( not ( = ?auto_240166 ?auto_240167 ) ) ( not ( = ?auto_240166 ?auto_240168 ) ) ( not ( = ?auto_240166 ?auto_240169 ) ) ( not ( = ?auto_240166 ?auto_240170 ) ) ( not ( = ?auto_240166 ?auto_240171 ) ) ( not ( = ?auto_240166 ?auto_240172 ) ) ( not ( = ?auto_240167 ?auto_240168 ) ) ( not ( = ?auto_240167 ?auto_240169 ) ) ( not ( = ?auto_240167 ?auto_240170 ) ) ( not ( = ?auto_240167 ?auto_240171 ) ) ( not ( = ?auto_240167 ?auto_240172 ) ) ( not ( = ?auto_240168 ?auto_240169 ) ) ( not ( = ?auto_240168 ?auto_240170 ) ) ( not ( = ?auto_240168 ?auto_240171 ) ) ( not ( = ?auto_240168 ?auto_240172 ) ) ( not ( = ?auto_240169 ?auto_240170 ) ) ( not ( = ?auto_240169 ?auto_240171 ) ) ( not ( = ?auto_240169 ?auto_240172 ) ) ( not ( = ?auto_240170 ?auto_240171 ) ) ( not ( = ?auto_240170 ?auto_240172 ) ) ( not ( = ?auto_240171 ?auto_240172 ) ) ( ON ?auto_240171 ?auto_240172 ) ( ON ?auto_240170 ?auto_240171 ) ( ON ?auto_240169 ?auto_240170 ) ( ON ?auto_240168 ?auto_240169 ) ( ON ?auto_240167 ?auto_240168 ) ( ON ?auto_240166 ?auto_240167 ) ( ON ?auto_240165 ?auto_240166 ) ( ON ?auto_240164 ?auto_240165 ) ( ON ?auto_240163 ?auto_240164 ) ( ON ?auto_240162 ?auto_240163 ) ( ON ?auto_240161 ?auto_240162 ) ( ON ?auto_240160 ?auto_240161 ) ( CLEAR ?auto_240160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_240160 )
      ( MAKE-13PILE ?auto_240160 ?auto_240161 ?auto_240162 ?auto_240163 ?auto_240164 ?auto_240165 ?auto_240166 ?auto_240167 ?auto_240168 ?auto_240169 ?auto_240170 ?auto_240171 ?auto_240172 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_240186 - BLOCK
      ?auto_240187 - BLOCK
      ?auto_240188 - BLOCK
      ?auto_240189 - BLOCK
      ?auto_240190 - BLOCK
      ?auto_240191 - BLOCK
      ?auto_240192 - BLOCK
      ?auto_240193 - BLOCK
      ?auto_240194 - BLOCK
      ?auto_240195 - BLOCK
      ?auto_240196 - BLOCK
      ?auto_240197 - BLOCK
      ?auto_240198 - BLOCK
    )
    :vars
    (
      ?auto_240199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_240186 ?auto_240187 ) ) ( not ( = ?auto_240186 ?auto_240188 ) ) ( not ( = ?auto_240186 ?auto_240189 ) ) ( not ( = ?auto_240186 ?auto_240190 ) ) ( not ( = ?auto_240186 ?auto_240191 ) ) ( not ( = ?auto_240186 ?auto_240192 ) ) ( not ( = ?auto_240186 ?auto_240193 ) ) ( not ( = ?auto_240186 ?auto_240194 ) ) ( not ( = ?auto_240186 ?auto_240195 ) ) ( not ( = ?auto_240186 ?auto_240196 ) ) ( not ( = ?auto_240186 ?auto_240197 ) ) ( not ( = ?auto_240186 ?auto_240198 ) ) ( not ( = ?auto_240187 ?auto_240188 ) ) ( not ( = ?auto_240187 ?auto_240189 ) ) ( not ( = ?auto_240187 ?auto_240190 ) ) ( not ( = ?auto_240187 ?auto_240191 ) ) ( not ( = ?auto_240187 ?auto_240192 ) ) ( not ( = ?auto_240187 ?auto_240193 ) ) ( not ( = ?auto_240187 ?auto_240194 ) ) ( not ( = ?auto_240187 ?auto_240195 ) ) ( not ( = ?auto_240187 ?auto_240196 ) ) ( not ( = ?auto_240187 ?auto_240197 ) ) ( not ( = ?auto_240187 ?auto_240198 ) ) ( not ( = ?auto_240188 ?auto_240189 ) ) ( not ( = ?auto_240188 ?auto_240190 ) ) ( not ( = ?auto_240188 ?auto_240191 ) ) ( not ( = ?auto_240188 ?auto_240192 ) ) ( not ( = ?auto_240188 ?auto_240193 ) ) ( not ( = ?auto_240188 ?auto_240194 ) ) ( not ( = ?auto_240188 ?auto_240195 ) ) ( not ( = ?auto_240188 ?auto_240196 ) ) ( not ( = ?auto_240188 ?auto_240197 ) ) ( not ( = ?auto_240188 ?auto_240198 ) ) ( not ( = ?auto_240189 ?auto_240190 ) ) ( not ( = ?auto_240189 ?auto_240191 ) ) ( not ( = ?auto_240189 ?auto_240192 ) ) ( not ( = ?auto_240189 ?auto_240193 ) ) ( not ( = ?auto_240189 ?auto_240194 ) ) ( not ( = ?auto_240189 ?auto_240195 ) ) ( not ( = ?auto_240189 ?auto_240196 ) ) ( not ( = ?auto_240189 ?auto_240197 ) ) ( not ( = ?auto_240189 ?auto_240198 ) ) ( not ( = ?auto_240190 ?auto_240191 ) ) ( not ( = ?auto_240190 ?auto_240192 ) ) ( not ( = ?auto_240190 ?auto_240193 ) ) ( not ( = ?auto_240190 ?auto_240194 ) ) ( not ( = ?auto_240190 ?auto_240195 ) ) ( not ( = ?auto_240190 ?auto_240196 ) ) ( not ( = ?auto_240190 ?auto_240197 ) ) ( not ( = ?auto_240190 ?auto_240198 ) ) ( not ( = ?auto_240191 ?auto_240192 ) ) ( not ( = ?auto_240191 ?auto_240193 ) ) ( not ( = ?auto_240191 ?auto_240194 ) ) ( not ( = ?auto_240191 ?auto_240195 ) ) ( not ( = ?auto_240191 ?auto_240196 ) ) ( not ( = ?auto_240191 ?auto_240197 ) ) ( not ( = ?auto_240191 ?auto_240198 ) ) ( not ( = ?auto_240192 ?auto_240193 ) ) ( not ( = ?auto_240192 ?auto_240194 ) ) ( not ( = ?auto_240192 ?auto_240195 ) ) ( not ( = ?auto_240192 ?auto_240196 ) ) ( not ( = ?auto_240192 ?auto_240197 ) ) ( not ( = ?auto_240192 ?auto_240198 ) ) ( not ( = ?auto_240193 ?auto_240194 ) ) ( not ( = ?auto_240193 ?auto_240195 ) ) ( not ( = ?auto_240193 ?auto_240196 ) ) ( not ( = ?auto_240193 ?auto_240197 ) ) ( not ( = ?auto_240193 ?auto_240198 ) ) ( not ( = ?auto_240194 ?auto_240195 ) ) ( not ( = ?auto_240194 ?auto_240196 ) ) ( not ( = ?auto_240194 ?auto_240197 ) ) ( not ( = ?auto_240194 ?auto_240198 ) ) ( not ( = ?auto_240195 ?auto_240196 ) ) ( not ( = ?auto_240195 ?auto_240197 ) ) ( not ( = ?auto_240195 ?auto_240198 ) ) ( not ( = ?auto_240196 ?auto_240197 ) ) ( not ( = ?auto_240196 ?auto_240198 ) ) ( not ( = ?auto_240197 ?auto_240198 ) ) ( ON ?auto_240186 ?auto_240199 ) ( not ( = ?auto_240198 ?auto_240199 ) ) ( not ( = ?auto_240197 ?auto_240199 ) ) ( not ( = ?auto_240196 ?auto_240199 ) ) ( not ( = ?auto_240195 ?auto_240199 ) ) ( not ( = ?auto_240194 ?auto_240199 ) ) ( not ( = ?auto_240193 ?auto_240199 ) ) ( not ( = ?auto_240192 ?auto_240199 ) ) ( not ( = ?auto_240191 ?auto_240199 ) ) ( not ( = ?auto_240190 ?auto_240199 ) ) ( not ( = ?auto_240189 ?auto_240199 ) ) ( not ( = ?auto_240188 ?auto_240199 ) ) ( not ( = ?auto_240187 ?auto_240199 ) ) ( not ( = ?auto_240186 ?auto_240199 ) ) ( ON ?auto_240187 ?auto_240186 ) ( ON ?auto_240188 ?auto_240187 ) ( ON ?auto_240189 ?auto_240188 ) ( ON ?auto_240190 ?auto_240189 ) ( ON ?auto_240191 ?auto_240190 ) ( ON ?auto_240192 ?auto_240191 ) ( ON ?auto_240193 ?auto_240192 ) ( ON ?auto_240194 ?auto_240193 ) ( ON ?auto_240195 ?auto_240194 ) ( ON ?auto_240196 ?auto_240195 ) ( ON ?auto_240197 ?auto_240196 ) ( ON ?auto_240198 ?auto_240197 ) ( CLEAR ?auto_240198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_240198 ?auto_240197 ?auto_240196 ?auto_240195 ?auto_240194 ?auto_240193 ?auto_240192 ?auto_240191 ?auto_240190 ?auto_240189 ?auto_240188 ?auto_240187 ?auto_240186 )
      ( MAKE-13PILE ?auto_240186 ?auto_240187 ?auto_240188 ?auto_240189 ?auto_240190 ?auto_240191 ?auto_240192 ?auto_240193 ?auto_240194 ?auto_240195 ?auto_240196 ?auto_240197 ?auto_240198 ) )
  )

)

