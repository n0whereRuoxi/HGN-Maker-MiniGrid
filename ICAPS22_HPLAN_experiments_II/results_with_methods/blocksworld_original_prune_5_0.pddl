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
      ?auto_15765 - BLOCK
      ?auto_15766 - BLOCK
      ?auto_15767 - BLOCK
      ?auto_15768 - BLOCK
      ?auto_15769 - BLOCK
    )
    :vars
    (
      ?auto_15770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15770 ?auto_15769 ) ( CLEAR ?auto_15770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15765 ) ( ON ?auto_15766 ?auto_15765 ) ( ON ?auto_15767 ?auto_15766 ) ( ON ?auto_15768 ?auto_15767 ) ( ON ?auto_15769 ?auto_15768 ) ( not ( = ?auto_15765 ?auto_15766 ) ) ( not ( = ?auto_15765 ?auto_15767 ) ) ( not ( = ?auto_15765 ?auto_15768 ) ) ( not ( = ?auto_15765 ?auto_15769 ) ) ( not ( = ?auto_15765 ?auto_15770 ) ) ( not ( = ?auto_15766 ?auto_15767 ) ) ( not ( = ?auto_15766 ?auto_15768 ) ) ( not ( = ?auto_15766 ?auto_15769 ) ) ( not ( = ?auto_15766 ?auto_15770 ) ) ( not ( = ?auto_15767 ?auto_15768 ) ) ( not ( = ?auto_15767 ?auto_15769 ) ) ( not ( = ?auto_15767 ?auto_15770 ) ) ( not ( = ?auto_15768 ?auto_15769 ) ) ( not ( = ?auto_15768 ?auto_15770 ) ) ( not ( = ?auto_15769 ?auto_15770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15770 ?auto_15769 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15772 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15772 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15772 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15773 - BLOCK
    )
    :vars
    (
      ?auto_15774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15773 ?auto_15774 ) ( CLEAR ?auto_15773 ) ( HAND-EMPTY ) ( not ( = ?auto_15773 ?auto_15774 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15773 ?auto_15774 )
      ( MAKE-1PILE ?auto_15773 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15779 - BLOCK
      ?auto_15780 - BLOCK
      ?auto_15781 - BLOCK
      ?auto_15782 - BLOCK
    )
    :vars
    (
      ?auto_15783 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15783 ?auto_15782 ) ( CLEAR ?auto_15783 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15779 ) ( ON ?auto_15780 ?auto_15779 ) ( ON ?auto_15781 ?auto_15780 ) ( ON ?auto_15782 ?auto_15781 ) ( not ( = ?auto_15779 ?auto_15780 ) ) ( not ( = ?auto_15779 ?auto_15781 ) ) ( not ( = ?auto_15779 ?auto_15782 ) ) ( not ( = ?auto_15779 ?auto_15783 ) ) ( not ( = ?auto_15780 ?auto_15781 ) ) ( not ( = ?auto_15780 ?auto_15782 ) ) ( not ( = ?auto_15780 ?auto_15783 ) ) ( not ( = ?auto_15781 ?auto_15782 ) ) ( not ( = ?auto_15781 ?auto_15783 ) ) ( not ( = ?auto_15782 ?auto_15783 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15783 ?auto_15782 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15784 - BLOCK
      ?auto_15785 - BLOCK
      ?auto_15786 - BLOCK
      ?auto_15787 - BLOCK
    )
    :vars
    (
      ?auto_15788 - BLOCK
      ?auto_15789 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15788 ?auto_15787 ) ( CLEAR ?auto_15788 ) ( ON-TABLE ?auto_15784 ) ( ON ?auto_15785 ?auto_15784 ) ( ON ?auto_15786 ?auto_15785 ) ( ON ?auto_15787 ?auto_15786 ) ( not ( = ?auto_15784 ?auto_15785 ) ) ( not ( = ?auto_15784 ?auto_15786 ) ) ( not ( = ?auto_15784 ?auto_15787 ) ) ( not ( = ?auto_15784 ?auto_15788 ) ) ( not ( = ?auto_15785 ?auto_15786 ) ) ( not ( = ?auto_15785 ?auto_15787 ) ) ( not ( = ?auto_15785 ?auto_15788 ) ) ( not ( = ?auto_15786 ?auto_15787 ) ) ( not ( = ?auto_15786 ?auto_15788 ) ) ( not ( = ?auto_15787 ?auto_15788 ) ) ( HOLDING ?auto_15789 ) ( not ( = ?auto_15784 ?auto_15789 ) ) ( not ( = ?auto_15785 ?auto_15789 ) ) ( not ( = ?auto_15786 ?auto_15789 ) ) ( not ( = ?auto_15787 ?auto_15789 ) ) ( not ( = ?auto_15788 ?auto_15789 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_15789 )
      ( MAKE-4PILE ?auto_15784 ?auto_15785 ?auto_15786 ?auto_15787 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15790 - BLOCK
      ?auto_15791 - BLOCK
      ?auto_15792 - BLOCK
      ?auto_15793 - BLOCK
    )
    :vars
    (
      ?auto_15794 - BLOCK
      ?auto_15795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15794 ?auto_15793 ) ( ON-TABLE ?auto_15790 ) ( ON ?auto_15791 ?auto_15790 ) ( ON ?auto_15792 ?auto_15791 ) ( ON ?auto_15793 ?auto_15792 ) ( not ( = ?auto_15790 ?auto_15791 ) ) ( not ( = ?auto_15790 ?auto_15792 ) ) ( not ( = ?auto_15790 ?auto_15793 ) ) ( not ( = ?auto_15790 ?auto_15794 ) ) ( not ( = ?auto_15791 ?auto_15792 ) ) ( not ( = ?auto_15791 ?auto_15793 ) ) ( not ( = ?auto_15791 ?auto_15794 ) ) ( not ( = ?auto_15792 ?auto_15793 ) ) ( not ( = ?auto_15792 ?auto_15794 ) ) ( not ( = ?auto_15793 ?auto_15794 ) ) ( not ( = ?auto_15790 ?auto_15795 ) ) ( not ( = ?auto_15791 ?auto_15795 ) ) ( not ( = ?auto_15792 ?auto_15795 ) ) ( not ( = ?auto_15793 ?auto_15795 ) ) ( not ( = ?auto_15794 ?auto_15795 ) ) ( ON ?auto_15795 ?auto_15794 ) ( CLEAR ?auto_15795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15793 ?auto_15794 )
      ( MAKE-4PILE ?auto_15790 ?auto_15791 ?auto_15792 ?auto_15793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15798 - BLOCK
      ?auto_15799 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15799 ) ( CLEAR ?auto_15798 ) ( ON-TABLE ?auto_15798 ) ( not ( = ?auto_15798 ?auto_15799 ) ) )
    :subtasks
    ( ( !STACK ?auto_15799 ?auto_15798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15800 - BLOCK
      ?auto_15801 - BLOCK
    )
    :vars
    (
      ?auto_15802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15800 ) ( ON-TABLE ?auto_15800 ) ( not ( = ?auto_15800 ?auto_15801 ) ) ( ON ?auto_15801 ?auto_15802 ) ( CLEAR ?auto_15801 ) ( HAND-EMPTY ) ( not ( = ?auto_15800 ?auto_15802 ) ) ( not ( = ?auto_15801 ?auto_15802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15801 ?auto_15802 )
      ( MAKE-2PILE ?auto_15800 ?auto_15801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15803 - BLOCK
      ?auto_15804 - BLOCK
    )
    :vars
    (
      ?auto_15805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15803 ?auto_15804 ) ) ( ON ?auto_15804 ?auto_15805 ) ( CLEAR ?auto_15804 ) ( not ( = ?auto_15803 ?auto_15805 ) ) ( not ( = ?auto_15804 ?auto_15805 ) ) ( HOLDING ?auto_15803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15803 )
      ( MAKE-2PILE ?auto_15803 ?auto_15804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15806 - BLOCK
      ?auto_15807 - BLOCK
    )
    :vars
    (
      ?auto_15808 - BLOCK
      ?auto_15811 - BLOCK
      ?auto_15810 - BLOCK
      ?auto_15809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15806 ?auto_15807 ) ) ( ON ?auto_15807 ?auto_15808 ) ( not ( = ?auto_15806 ?auto_15808 ) ) ( not ( = ?auto_15807 ?auto_15808 ) ) ( ON ?auto_15806 ?auto_15807 ) ( CLEAR ?auto_15806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15811 ) ( ON ?auto_15810 ?auto_15811 ) ( ON ?auto_15809 ?auto_15810 ) ( ON ?auto_15808 ?auto_15809 ) ( not ( = ?auto_15811 ?auto_15810 ) ) ( not ( = ?auto_15811 ?auto_15809 ) ) ( not ( = ?auto_15811 ?auto_15808 ) ) ( not ( = ?auto_15811 ?auto_15807 ) ) ( not ( = ?auto_15811 ?auto_15806 ) ) ( not ( = ?auto_15810 ?auto_15809 ) ) ( not ( = ?auto_15810 ?auto_15808 ) ) ( not ( = ?auto_15810 ?auto_15807 ) ) ( not ( = ?auto_15810 ?auto_15806 ) ) ( not ( = ?auto_15809 ?auto_15808 ) ) ( not ( = ?auto_15809 ?auto_15807 ) ) ( not ( = ?auto_15809 ?auto_15806 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15811 ?auto_15810 ?auto_15809 ?auto_15808 ?auto_15807 )
      ( MAKE-2PILE ?auto_15806 ?auto_15807 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15815 - BLOCK
      ?auto_15816 - BLOCK
      ?auto_15817 - BLOCK
    )
    :vars
    (
      ?auto_15818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15818 ?auto_15817 ) ( CLEAR ?auto_15818 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15815 ) ( ON ?auto_15816 ?auto_15815 ) ( ON ?auto_15817 ?auto_15816 ) ( not ( = ?auto_15815 ?auto_15816 ) ) ( not ( = ?auto_15815 ?auto_15817 ) ) ( not ( = ?auto_15815 ?auto_15818 ) ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15816 ?auto_15818 ) ) ( not ( = ?auto_15817 ?auto_15818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15818 ?auto_15817 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15819 - BLOCK
      ?auto_15820 - BLOCK
      ?auto_15821 - BLOCK
    )
    :vars
    (
      ?auto_15822 - BLOCK
      ?auto_15823 - BLOCK
      ?auto_15824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15822 ?auto_15821 ) ( CLEAR ?auto_15822 ) ( ON-TABLE ?auto_15819 ) ( ON ?auto_15820 ?auto_15819 ) ( ON ?auto_15821 ?auto_15820 ) ( not ( = ?auto_15819 ?auto_15820 ) ) ( not ( = ?auto_15819 ?auto_15821 ) ) ( not ( = ?auto_15819 ?auto_15822 ) ) ( not ( = ?auto_15820 ?auto_15821 ) ) ( not ( = ?auto_15820 ?auto_15822 ) ) ( not ( = ?auto_15821 ?auto_15822 ) ) ( HOLDING ?auto_15823 ) ( CLEAR ?auto_15824 ) ( not ( = ?auto_15819 ?auto_15823 ) ) ( not ( = ?auto_15819 ?auto_15824 ) ) ( not ( = ?auto_15820 ?auto_15823 ) ) ( not ( = ?auto_15820 ?auto_15824 ) ) ( not ( = ?auto_15821 ?auto_15823 ) ) ( not ( = ?auto_15821 ?auto_15824 ) ) ( not ( = ?auto_15822 ?auto_15823 ) ) ( not ( = ?auto_15822 ?auto_15824 ) ) ( not ( = ?auto_15823 ?auto_15824 ) ) )
    :subtasks
    ( ( !STACK ?auto_15823 ?auto_15824 )
      ( MAKE-3PILE ?auto_15819 ?auto_15820 ?auto_15821 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16187 - BLOCK
      ?auto_16188 - BLOCK
      ?auto_16189 - BLOCK
    )
    :vars
    (
      ?auto_16191 - BLOCK
      ?auto_16190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16191 ?auto_16189 ) ( ON-TABLE ?auto_16187 ) ( ON ?auto_16188 ?auto_16187 ) ( ON ?auto_16189 ?auto_16188 ) ( not ( = ?auto_16187 ?auto_16188 ) ) ( not ( = ?auto_16187 ?auto_16189 ) ) ( not ( = ?auto_16187 ?auto_16191 ) ) ( not ( = ?auto_16188 ?auto_16189 ) ) ( not ( = ?auto_16188 ?auto_16191 ) ) ( not ( = ?auto_16189 ?auto_16191 ) ) ( not ( = ?auto_16187 ?auto_16190 ) ) ( not ( = ?auto_16188 ?auto_16190 ) ) ( not ( = ?auto_16189 ?auto_16190 ) ) ( not ( = ?auto_16191 ?auto_16190 ) ) ( ON ?auto_16190 ?auto_16191 ) ( CLEAR ?auto_16190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16187 ?auto_16188 ?auto_16189 ?auto_16191 )
      ( MAKE-3PILE ?auto_16187 ?auto_16188 ?auto_16189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15831 - BLOCK
      ?auto_15832 - BLOCK
      ?auto_15833 - BLOCK
    )
    :vars
    (
      ?auto_15836 - BLOCK
      ?auto_15834 - BLOCK
      ?auto_15835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15836 ?auto_15833 ) ( ON-TABLE ?auto_15831 ) ( ON ?auto_15832 ?auto_15831 ) ( ON ?auto_15833 ?auto_15832 ) ( not ( = ?auto_15831 ?auto_15832 ) ) ( not ( = ?auto_15831 ?auto_15833 ) ) ( not ( = ?auto_15831 ?auto_15836 ) ) ( not ( = ?auto_15832 ?auto_15833 ) ) ( not ( = ?auto_15832 ?auto_15836 ) ) ( not ( = ?auto_15833 ?auto_15836 ) ) ( not ( = ?auto_15831 ?auto_15834 ) ) ( not ( = ?auto_15831 ?auto_15835 ) ) ( not ( = ?auto_15832 ?auto_15834 ) ) ( not ( = ?auto_15832 ?auto_15835 ) ) ( not ( = ?auto_15833 ?auto_15834 ) ) ( not ( = ?auto_15833 ?auto_15835 ) ) ( not ( = ?auto_15836 ?auto_15834 ) ) ( not ( = ?auto_15836 ?auto_15835 ) ) ( not ( = ?auto_15834 ?auto_15835 ) ) ( ON ?auto_15834 ?auto_15836 ) ( CLEAR ?auto_15834 ) ( HOLDING ?auto_15835 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15835 )
      ( MAKE-3PILE ?auto_15831 ?auto_15832 ?auto_15833 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15837 - BLOCK
      ?auto_15838 - BLOCK
      ?auto_15839 - BLOCK
    )
    :vars
    (
      ?auto_15841 - BLOCK
      ?auto_15840 - BLOCK
      ?auto_15842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15841 ?auto_15839 ) ( ON-TABLE ?auto_15837 ) ( ON ?auto_15838 ?auto_15837 ) ( ON ?auto_15839 ?auto_15838 ) ( not ( = ?auto_15837 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15839 ) ) ( not ( = ?auto_15837 ?auto_15841 ) ) ( not ( = ?auto_15838 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15841 ) ) ( not ( = ?auto_15839 ?auto_15841 ) ) ( not ( = ?auto_15837 ?auto_15840 ) ) ( not ( = ?auto_15837 ?auto_15842 ) ) ( not ( = ?auto_15838 ?auto_15840 ) ) ( not ( = ?auto_15838 ?auto_15842 ) ) ( not ( = ?auto_15839 ?auto_15840 ) ) ( not ( = ?auto_15839 ?auto_15842 ) ) ( not ( = ?auto_15841 ?auto_15840 ) ) ( not ( = ?auto_15841 ?auto_15842 ) ) ( not ( = ?auto_15840 ?auto_15842 ) ) ( ON ?auto_15840 ?auto_15841 ) ( ON ?auto_15842 ?auto_15840 ) ( CLEAR ?auto_15842 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15837 ?auto_15838 ?auto_15839 ?auto_15841 ?auto_15840 )
      ( MAKE-3PILE ?auto_15837 ?auto_15838 ?auto_15839 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15846 - BLOCK
      ?auto_15847 - BLOCK
      ?auto_15848 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15848 ) ( CLEAR ?auto_15847 ) ( ON-TABLE ?auto_15846 ) ( ON ?auto_15847 ?auto_15846 ) ( not ( = ?auto_15846 ?auto_15847 ) ) ( not ( = ?auto_15846 ?auto_15848 ) ) ( not ( = ?auto_15847 ?auto_15848 ) ) )
    :subtasks
    ( ( !STACK ?auto_15848 ?auto_15847 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15849 - BLOCK
      ?auto_15850 - BLOCK
      ?auto_15851 - BLOCK
    )
    :vars
    (
      ?auto_15852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15850 ) ( ON-TABLE ?auto_15849 ) ( ON ?auto_15850 ?auto_15849 ) ( not ( = ?auto_15849 ?auto_15850 ) ) ( not ( = ?auto_15849 ?auto_15851 ) ) ( not ( = ?auto_15850 ?auto_15851 ) ) ( ON ?auto_15851 ?auto_15852 ) ( CLEAR ?auto_15851 ) ( HAND-EMPTY ) ( not ( = ?auto_15849 ?auto_15852 ) ) ( not ( = ?auto_15850 ?auto_15852 ) ) ( not ( = ?auto_15851 ?auto_15852 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15851 ?auto_15852 )
      ( MAKE-3PILE ?auto_15849 ?auto_15850 ?auto_15851 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15853 - BLOCK
      ?auto_15854 - BLOCK
      ?auto_15855 - BLOCK
    )
    :vars
    (
      ?auto_15856 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15853 ) ( not ( = ?auto_15853 ?auto_15854 ) ) ( not ( = ?auto_15853 ?auto_15855 ) ) ( not ( = ?auto_15854 ?auto_15855 ) ) ( ON ?auto_15855 ?auto_15856 ) ( CLEAR ?auto_15855 ) ( not ( = ?auto_15853 ?auto_15856 ) ) ( not ( = ?auto_15854 ?auto_15856 ) ) ( not ( = ?auto_15855 ?auto_15856 ) ) ( HOLDING ?auto_15854 ) ( CLEAR ?auto_15853 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15853 ?auto_15854 )
      ( MAKE-3PILE ?auto_15853 ?auto_15854 ?auto_15855 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15857 - BLOCK
      ?auto_15858 - BLOCK
      ?auto_15859 - BLOCK
    )
    :vars
    (
      ?auto_15860 - BLOCK
      ?auto_15862 - BLOCK
      ?auto_15861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15857 ) ( not ( = ?auto_15857 ?auto_15858 ) ) ( not ( = ?auto_15857 ?auto_15859 ) ) ( not ( = ?auto_15858 ?auto_15859 ) ) ( ON ?auto_15859 ?auto_15860 ) ( not ( = ?auto_15857 ?auto_15860 ) ) ( not ( = ?auto_15858 ?auto_15860 ) ) ( not ( = ?auto_15859 ?auto_15860 ) ) ( CLEAR ?auto_15857 ) ( ON ?auto_15858 ?auto_15859 ) ( CLEAR ?auto_15858 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15862 ) ( ON ?auto_15861 ?auto_15862 ) ( ON ?auto_15860 ?auto_15861 ) ( not ( = ?auto_15862 ?auto_15861 ) ) ( not ( = ?auto_15862 ?auto_15860 ) ) ( not ( = ?auto_15862 ?auto_15859 ) ) ( not ( = ?auto_15862 ?auto_15858 ) ) ( not ( = ?auto_15861 ?auto_15860 ) ) ( not ( = ?auto_15861 ?auto_15859 ) ) ( not ( = ?auto_15861 ?auto_15858 ) ) ( not ( = ?auto_15857 ?auto_15862 ) ) ( not ( = ?auto_15857 ?auto_15861 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15862 ?auto_15861 ?auto_15860 ?auto_15859 )
      ( MAKE-3PILE ?auto_15857 ?auto_15858 ?auto_15859 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15863 - BLOCK
      ?auto_15864 - BLOCK
      ?auto_15865 - BLOCK
    )
    :vars
    (
      ?auto_15867 - BLOCK
      ?auto_15866 - BLOCK
      ?auto_15868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15863 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( ON ?auto_15865 ?auto_15867 ) ( not ( = ?auto_15863 ?auto_15867 ) ) ( not ( = ?auto_15864 ?auto_15867 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) ( ON ?auto_15864 ?auto_15865 ) ( CLEAR ?auto_15864 ) ( ON-TABLE ?auto_15866 ) ( ON ?auto_15868 ?auto_15866 ) ( ON ?auto_15867 ?auto_15868 ) ( not ( = ?auto_15866 ?auto_15868 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15865 ) ) ( not ( = ?auto_15866 ?auto_15864 ) ) ( not ( = ?auto_15868 ?auto_15867 ) ) ( not ( = ?auto_15868 ?auto_15865 ) ) ( not ( = ?auto_15868 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15866 ) ) ( not ( = ?auto_15863 ?auto_15868 ) ) ( HOLDING ?auto_15863 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15863 )
      ( MAKE-3PILE ?auto_15863 ?auto_15864 ?auto_15865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_15869 - BLOCK
      ?auto_15870 - BLOCK
      ?auto_15871 - BLOCK
    )
    :vars
    (
      ?auto_15872 - BLOCK
      ?auto_15874 - BLOCK
      ?auto_15873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15869 ?auto_15870 ) ) ( not ( = ?auto_15869 ?auto_15871 ) ) ( not ( = ?auto_15870 ?auto_15871 ) ) ( ON ?auto_15871 ?auto_15872 ) ( not ( = ?auto_15869 ?auto_15872 ) ) ( not ( = ?auto_15870 ?auto_15872 ) ) ( not ( = ?auto_15871 ?auto_15872 ) ) ( ON ?auto_15870 ?auto_15871 ) ( ON-TABLE ?auto_15874 ) ( ON ?auto_15873 ?auto_15874 ) ( ON ?auto_15872 ?auto_15873 ) ( not ( = ?auto_15874 ?auto_15873 ) ) ( not ( = ?auto_15874 ?auto_15872 ) ) ( not ( = ?auto_15874 ?auto_15871 ) ) ( not ( = ?auto_15874 ?auto_15870 ) ) ( not ( = ?auto_15873 ?auto_15872 ) ) ( not ( = ?auto_15873 ?auto_15871 ) ) ( not ( = ?auto_15873 ?auto_15870 ) ) ( not ( = ?auto_15869 ?auto_15874 ) ) ( not ( = ?auto_15869 ?auto_15873 ) ) ( ON ?auto_15869 ?auto_15870 ) ( CLEAR ?auto_15869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15874 ?auto_15873 ?auto_15872 ?auto_15871 ?auto_15870 )
      ( MAKE-3PILE ?auto_15869 ?auto_15870 ?auto_15871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15877 - BLOCK
      ?auto_15878 - BLOCK
    )
    :vars
    (
      ?auto_15879 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15879 ?auto_15878 ) ( CLEAR ?auto_15879 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15877 ) ( ON ?auto_15878 ?auto_15877 ) ( not ( = ?auto_15877 ?auto_15878 ) ) ( not ( = ?auto_15877 ?auto_15879 ) ) ( not ( = ?auto_15878 ?auto_15879 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15879 ?auto_15878 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15880 - BLOCK
      ?auto_15881 - BLOCK
    )
    :vars
    (
      ?auto_15882 - BLOCK
      ?auto_15883 - BLOCK
      ?auto_15884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15882 ?auto_15881 ) ( CLEAR ?auto_15882 ) ( ON-TABLE ?auto_15880 ) ( ON ?auto_15881 ?auto_15880 ) ( not ( = ?auto_15880 ?auto_15881 ) ) ( not ( = ?auto_15880 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( HOLDING ?auto_15883 ) ( CLEAR ?auto_15884 ) ( not ( = ?auto_15880 ?auto_15883 ) ) ( not ( = ?auto_15880 ?auto_15884 ) ) ( not ( = ?auto_15881 ?auto_15883 ) ) ( not ( = ?auto_15881 ?auto_15884 ) ) ( not ( = ?auto_15882 ?auto_15883 ) ) ( not ( = ?auto_15882 ?auto_15884 ) ) ( not ( = ?auto_15883 ?auto_15884 ) ) )
    :subtasks
    ( ( !STACK ?auto_15883 ?auto_15884 )
      ( MAKE-2PILE ?auto_15880 ?auto_15881 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15885 - BLOCK
      ?auto_15886 - BLOCK
    )
    :vars
    (
      ?auto_15889 - BLOCK
      ?auto_15887 - BLOCK
      ?auto_15888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15889 ?auto_15886 ) ( ON-TABLE ?auto_15885 ) ( ON ?auto_15886 ?auto_15885 ) ( not ( = ?auto_15885 ?auto_15886 ) ) ( not ( = ?auto_15885 ?auto_15889 ) ) ( not ( = ?auto_15886 ?auto_15889 ) ) ( CLEAR ?auto_15887 ) ( not ( = ?auto_15885 ?auto_15888 ) ) ( not ( = ?auto_15885 ?auto_15887 ) ) ( not ( = ?auto_15886 ?auto_15888 ) ) ( not ( = ?auto_15886 ?auto_15887 ) ) ( not ( = ?auto_15889 ?auto_15888 ) ) ( not ( = ?auto_15889 ?auto_15887 ) ) ( not ( = ?auto_15888 ?auto_15887 ) ) ( ON ?auto_15888 ?auto_15889 ) ( CLEAR ?auto_15888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15885 ?auto_15886 ?auto_15889 )
      ( MAKE-2PILE ?auto_15885 ?auto_15886 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15890 - BLOCK
      ?auto_15891 - BLOCK
    )
    :vars
    (
      ?auto_15894 - BLOCK
      ?auto_15893 - BLOCK
      ?auto_15892 - BLOCK
      ?auto_15895 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15894 ?auto_15891 ) ( ON-TABLE ?auto_15890 ) ( ON ?auto_15891 ?auto_15890 ) ( not ( = ?auto_15890 ?auto_15891 ) ) ( not ( = ?auto_15890 ?auto_15894 ) ) ( not ( = ?auto_15891 ?auto_15894 ) ) ( not ( = ?auto_15890 ?auto_15893 ) ) ( not ( = ?auto_15890 ?auto_15892 ) ) ( not ( = ?auto_15891 ?auto_15893 ) ) ( not ( = ?auto_15891 ?auto_15892 ) ) ( not ( = ?auto_15894 ?auto_15893 ) ) ( not ( = ?auto_15894 ?auto_15892 ) ) ( not ( = ?auto_15893 ?auto_15892 ) ) ( ON ?auto_15893 ?auto_15894 ) ( CLEAR ?auto_15893 ) ( HOLDING ?auto_15892 ) ( CLEAR ?auto_15895 ) ( ON-TABLE ?auto_15895 ) ( not ( = ?auto_15895 ?auto_15892 ) ) ( not ( = ?auto_15890 ?auto_15895 ) ) ( not ( = ?auto_15891 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15893 ?auto_15895 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15895 ?auto_15892 )
      ( MAKE-2PILE ?auto_15890 ?auto_15891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16314 - BLOCK
      ?auto_16315 - BLOCK
    )
    :vars
    (
      ?auto_16318 - BLOCK
      ?auto_16316 - BLOCK
      ?auto_16317 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16318 ?auto_16315 ) ( ON-TABLE ?auto_16314 ) ( ON ?auto_16315 ?auto_16314 ) ( not ( = ?auto_16314 ?auto_16315 ) ) ( not ( = ?auto_16314 ?auto_16318 ) ) ( not ( = ?auto_16315 ?auto_16318 ) ) ( not ( = ?auto_16314 ?auto_16316 ) ) ( not ( = ?auto_16314 ?auto_16317 ) ) ( not ( = ?auto_16315 ?auto_16316 ) ) ( not ( = ?auto_16315 ?auto_16317 ) ) ( not ( = ?auto_16318 ?auto_16316 ) ) ( not ( = ?auto_16318 ?auto_16317 ) ) ( not ( = ?auto_16316 ?auto_16317 ) ) ( ON ?auto_16316 ?auto_16318 ) ( ON ?auto_16317 ?auto_16316 ) ( CLEAR ?auto_16317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16314 ?auto_16315 ?auto_16318 ?auto_16316 )
      ( MAKE-2PILE ?auto_16314 ?auto_16315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15902 - BLOCK
      ?auto_15903 - BLOCK
    )
    :vars
    (
      ?auto_15905 - BLOCK
      ?auto_15907 - BLOCK
      ?auto_15904 - BLOCK
      ?auto_15906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15905 ?auto_15903 ) ( ON-TABLE ?auto_15902 ) ( ON ?auto_15903 ?auto_15902 ) ( not ( = ?auto_15902 ?auto_15903 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15903 ?auto_15905 ) ) ( not ( = ?auto_15902 ?auto_15907 ) ) ( not ( = ?auto_15902 ?auto_15904 ) ) ( not ( = ?auto_15903 ?auto_15907 ) ) ( not ( = ?auto_15903 ?auto_15904 ) ) ( not ( = ?auto_15905 ?auto_15907 ) ) ( not ( = ?auto_15905 ?auto_15904 ) ) ( not ( = ?auto_15907 ?auto_15904 ) ) ( ON ?auto_15907 ?auto_15905 ) ( not ( = ?auto_15906 ?auto_15904 ) ) ( not ( = ?auto_15902 ?auto_15906 ) ) ( not ( = ?auto_15903 ?auto_15906 ) ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15907 ?auto_15906 ) ) ( ON ?auto_15904 ?auto_15907 ) ( CLEAR ?auto_15904 ) ( HOLDING ?auto_15906 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15906 )
      ( MAKE-2PILE ?auto_15902 ?auto_15903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_15908 - BLOCK
      ?auto_15909 - BLOCK
    )
    :vars
    (
      ?auto_15911 - BLOCK
      ?auto_15910 - BLOCK
      ?auto_15913 - BLOCK
      ?auto_15912 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15911 ?auto_15909 ) ( ON-TABLE ?auto_15908 ) ( ON ?auto_15909 ?auto_15908 ) ( not ( = ?auto_15908 ?auto_15909 ) ) ( not ( = ?auto_15908 ?auto_15911 ) ) ( not ( = ?auto_15909 ?auto_15911 ) ) ( not ( = ?auto_15908 ?auto_15910 ) ) ( not ( = ?auto_15908 ?auto_15913 ) ) ( not ( = ?auto_15909 ?auto_15910 ) ) ( not ( = ?auto_15909 ?auto_15913 ) ) ( not ( = ?auto_15911 ?auto_15910 ) ) ( not ( = ?auto_15911 ?auto_15913 ) ) ( not ( = ?auto_15910 ?auto_15913 ) ) ( ON ?auto_15910 ?auto_15911 ) ( not ( = ?auto_15912 ?auto_15913 ) ) ( not ( = ?auto_15908 ?auto_15912 ) ) ( not ( = ?auto_15909 ?auto_15912 ) ) ( not ( = ?auto_15911 ?auto_15912 ) ) ( not ( = ?auto_15910 ?auto_15912 ) ) ( ON ?auto_15913 ?auto_15910 ) ( ON ?auto_15912 ?auto_15913 ) ( CLEAR ?auto_15912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15908 ?auto_15909 ?auto_15911 ?auto_15910 ?auto_15913 )
      ( MAKE-2PILE ?auto_15908 ?auto_15909 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15918 - BLOCK
      ?auto_15919 - BLOCK
      ?auto_15920 - BLOCK
      ?auto_15921 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_15921 ) ( CLEAR ?auto_15920 ) ( ON-TABLE ?auto_15918 ) ( ON ?auto_15919 ?auto_15918 ) ( ON ?auto_15920 ?auto_15919 ) ( not ( = ?auto_15918 ?auto_15919 ) ) ( not ( = ?auto_15918 ?auto_15920 ) ) ( not ( = ?auto_15918 ?auto_15921 ) ) ( not ( = ?auto_15919 ?auto_15920 ) ) ( not ( = ?auto_15919 ?auto_15921 ) ) ( not ( = ?auto_15920 ?auto_15921 ) ) )
    :subtasks
    ( ( !STACK ?auto_15921 ?auto_15920 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15922 - BLOCK
      ?auto_15923 - BLOCK
      ?auto_15924 - BLOCK
      ?auto_15925 - BLOCK
    )
    :vars
    (
      ?auto_15926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_15924 ) ( ON-TABLE ?auto_15922 ) ( ON ?auto_15923 ?auto_15922 ) ( ON ?auto_15924 ?auto_15923 ) ( not ( = ?auto_15922 ?auto_15923 ) ) ( not ( = ?auto_15922 ?auto_15924 ) ) ( not ( = ?auto_15922 ?auto_15925 ) ) ( not ( = ?auto_15923 ?auto_15924 ) ) ( not ( = ?auto_15923 ?auto_15925 ) ) ( not ( = ?auto_15924 ?auto_15925 ) ) ( ON ?auto_15925 ?auto_15926 ) ( CLEAR ?auto_15925 ) ( HAND-EMPTY ) ( not ( = ?auto_15922 ?auto_15926 ) ) ( not ( = ?auto_15923 ?auto_15926 ) ) ( not ( = ?auto_15924 ?auto_15926 ) ) ( not ( = ?auto_15925 ?auto_15926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15925 ?auto_15926 )
      ( MAKE-4PILE ?auto_15922 ?auto_15923 ?auto_15924 ?auto_15925 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15927 - BLOCK
      ?auto_15928 - BLOCK
      ?auto_15929 - BLOCK
      ?auto_15930 - BLOCK
    )
    :vars
    (
      ?auto_15931 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15927 ) ( ON ?auto_15928 ?auto_15927 ) ( not ( = ?auto_15927 ?auto_15928 ) ) ( not ( = ?auto_15927 ?auto_15929 ) ) ( not ( = ?auto_15927 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( ON ?auto_15930 ?auto_15931 ) ( CLEAR ?auto_15930 ) ( not ( = ?auto_15927 ?auto_15931 ) ) ( not ( = ?auto_15928 ?auto_15931 ) ) ( not ( = ?auto_15929 ?auto_15931 ) ) ( not ( = ?auto_15930 ?auto_15931 ) ) ( HOLDING ?auto_15929 ) ( CLEAR ?auto_15928 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15927 ?auto_15928 ?auto_15929 )
      ( MAKE-4PILE ?auto_15927 ?auto_15928 ?auto_15929 ?auto_15930 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15932 - BLOCK
      ?auto_15933 - BLOCK
      ?auto_15934 - BLOCK
      ?auto_15935 - BLOCK
    )
    :vars
    (
      ?auto_15936 - BLOCK
      ?auto_15937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15932 ) ( ON ?auto_15933 ?auto_15932 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15935 ) ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15935 ) ) ( not ( = ?auto_15934 ?auto_15935 ) ) ( ON ?auto_15935 ?auto_15936 ) ( not ( = ?auto_15932 ?auto_15936 ) ) ( not ( = ?auto_15933 ?auto_15936 ) ) ( not ( = ?auto_15934 ?auto_15936 ) ) ( not ( = ?auto_15935 ?auto_15936 ) ) ( CLEAR ?auto_15933 ) ( ON ?auto_15934 ?auto_15935 ) ( CLEAR ?auto_15934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15937 ) ( ON ?auto_15936 ?auto_15937 ) ( not ( = ?auto_15937 ?auto_15936 ) ) ( not ( = ?auto_15937 ?auto_15935 ) ) ( not ( = ?auto_15937 ?auto_15934 ) ) ( not ( = ?auto_15932 ?auto_15937 ) ) ( not ( = ?auto_15933 ?auto_15937 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15937 ?auto_15936 ?auto_15935 )
      ( MAKE-4PILE ?auto_15932 ?auto_15933 ?auto_15934 ?auto_15935 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15938 - BLOCK
      ?auto_15939 - BLOCK
      ?auto_15940 - BLOCK
      ?auto_15941 - BLOCK
    )
    :vars
    (
      ?auto_15943 - BLOCK
      ?auto_15942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15938 ) ( not ( = ?auto_15938 ?auto_15939 ) ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( not ( = ?auto_15938 ?auto_15941 ) ) ( not ( = ?auto_15939 ?auto_15940 ) ) ( not ( = ?auto_15939 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( ON ?auto_15941 ?auto_15943 ) ( not ( = ?auto_15938 ?auto_15943 ) ) ( not ( = ?auto_15939 ?auto_15943 ) ) ( not ( = ?auto_15940 ?auto_15943 ) ) ( not ( = ?auto_15941 ?auto_15943 ) ) ( ON ?auto_15940 ?auto_15941 ) ( CLEAR ?auto_15940 ) ( ON-TABLE ?auto_15942 ) ( ON ?auto_15943 ?auto_15942 ) ( not ( = ?auto_15942 ?auto_15943 ) ) ( not ( = ?auto_15942 ?auto_15941 ) ) ( not ( = ?auto_15942 ?auto_15940 ) ) ( not ( = ?auto_15938 ?auto_15942 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( HOLDING ?auto_15939 ) ( CLEAR ?auto_15938 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15938 ?auto_15939 )
      ( MAKE-4PILE ?auto_15938 ?auto_15939 ?auto_15940 ?auto_15941 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15944 - BLOCK
      ?auto_15945 - BLOCK
      ?auto_15946 - BLOCK
      ?auto_15947 - BLOCK
    )
    :vars
    (
      ?auto_15949 - BLOCK
      ?auto_15948 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_15944 ) ( not ( = ?auto_15944 ?auto_15945 ) ) ( not ( = ?auto_15944 ?auto_15946 ) ) ( not ( = ?auto_15944 ?auto_15947 ) ) ( not ( = ?auto_15945 ?auto_15946 ) ) ( not ( = ?auto_15945 ?auto_15947 ) ) ( not ( = ?auto_15946 ?auto_15947 ) ) ( ON ?auto_15947 ?auto_15949 ) ( not ( = ?auto_15944 ?auto_15949 ) ) ( not ( = ?auto_15945 ?auto_15949 ) ) ( not ( = ?auto_15946 ?auto_15949 ) ) ( not ( = ?auto_15947 ?auto_15949 ) ) ( ON ?auto_15946 ?auto_15947 ) ( ON-TABLE ?auto_15948 ) ( ON ?auto_15949 ?auto_15948 ) ( not ( = ?auto_15948 ?auto_15949 ) ) ( not ( = ?auto_15948 ?auto_15947 ) ) ( not ( = ?auto_15948 ?auto_15946 ) ) ( not ( = ?auto_15944 ?auto_15948 ) ) ( not ( = ?auto_15945 ?auto_15948 ) ) ( CLEAR ?auto_15944 ) ( ON ?auto_15945 ?auto_15946 ) ( CLEAR ?auto_15945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_15948 ?auto_15949 ?auto_15947 ?auto_15946 )
      ( MAKE-4PILE ?auto_15944 ?auto_15945 ?auto_15946 ?auto_15947 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15950 - BLOCK
      ?auto_15951 - BLOCK
      ?auto_15952 - BLOCK
      ?auto_15953 - BLOCK
    )
    :vars
    (
      ?auto_15954 - BLOCK
      ?auto_15955 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15950 ?auto_15952 ) ) ( not ( = ?auto_15950 ?auto_15953 ) ) ( not ( = ?auto_15951 ?auto_15952 ) ) ( not ( = ?auto_15951 ?auto_15953 ) ) ( not ( = ?auto_15952 ?auto_15953 ) ) ( ON ?auto_15953 ?auto_15954 ) ( not ( = ?auto_15950 ?auto_15954 ) ) ( not ( = ?auto_15951 ?auto_15954 ) ) ( not ( = ?auto_15952 ?auto_15954 ) ) ( not ( = ?auto_15953 ?auto_15954 ) ) ( ON ?auto_15952 ?auto_15953 ) ( ON-TABLE ?auto_15955 ) ( ON ?auto_15954 ?auto_15955 ) ( not ( = ?auto_15955 ?auto_15954 ) ) ( not ( = ?auto_15955 ?auto_15953 ) ) ( not ( = ?auto_15955 ?auto_15952 ) ) ( not ( = ?auto_15950 ?auto_15955 ) ) ( not ( = ?auto_15951 ?auto_15955 ) ) ( ON ?auto_15951 ?auto_15952 ) ( CLEAR ?auto_15951 ) ( HOLDING ?auto_15950 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_15950 )
      ( MAKE-4PILE ?auto_15950 ?auto_15951 ?auto_15952 ?auto_15953 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_15956 - BLOCK
      ?auto_15957 - BLOCK
      ?auto_15958 - BLOCK
      ?auto_15959 - BLOCK
    )
    :vars
    (
      ?auto_15961 - BLOCK
      ?auto_15960 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_15956 ?auto_15957 ) ) ( not ( = ?auto_15956 ?auto_15958 ) ) ( not ( = ?auto_15956 ?auto_15959 ) ) ( not ( = ?auto_15957 ?auto_15958 ) ) ( not ( = ?auto_15957 ?auto_15959 ) ) ( not ( = ?auto_15958 ?auto_15959 ) ) ( ON ?auto_15959 ?auto_15961 ) ( not ( = ?auto_15956 ?auto_15961 ) ) ( not ( = ?auto_15957 ?auto_15961 ) ) ( not ( = ?auto_15958 ?auto_15961 ) ) ( not ( = ?auto_15959 ?auto_15961 ) ) ( ON ?auto_15958 ?auto_15959 ) ( ON-TABLE ?auto_15960 ) ( ON ?auto_15961 ?auto_15960 ) ( not ( = ?auto_15960 ?auto_15961 ) ) ( not ( = ?auto_15960 ?auto_15959 ) ) ( not ( = ?auto_15960 ?auto_15958 ) ) ( not ( = ?auto_15956 ?auto_15960 ) ) ( not ( = ?auto_15957 ?auto_15960 ) ) ( ON ?auto_15957 ?auto_15958 ) ( ON ?auto_15956 ?auto_15957 ) ( CLEAR ?auto_15956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_15960 ?auto_15961 ?auto_15959 ?auto_15958 ?auto_15957 )
      ( MAKE-4PILE ?auto_15956 ?auto_15957 ?auto_15958 ?auto_15959 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15963 - BLOCK
    )
    :vars
    (
      ?auto_15964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15964 ?auto_15963 ) ( CLEAR ?auto_15964 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_15963 ) ( not ( = ?auto_15963 ?auto_15964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_15964 ?auto_15963 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15965 - BLOCK
    )
    :vars
    (
      ?auto_15966 - BLOCK
      ?auto_15967 - BLOCK
      ?auto_15968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15966 ?auto_15965 ) ( CLEAR ?auto_15966 ) ( ON-TABLE ?auto_15965 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( HOLDING ?auto_15967 ) ( CLEAR ?auto_15968 ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( not ( = ?auto_15966 ?auto_15967 ) ) ( not ( = ?auto_15966 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15968 ) ) )
    :subtasks
    ( ( !STACK ?auto_15967 ?auto_15968 )
      ( MAKE-1PILE ?auto_15965 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15969 - BLOCK
    )
    :vars
    (
      ?auto_15972 - BLOCK
      ?auto_15970 - BLOCK
      ?auto_15971 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15972 ?auto_15969 ) ( ON-TABLE ?auto_15969 ) ( not ( = ?auto_15969 ?auto_15972 ) ) ( CLEAR ?auto_15970 ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15972 ?auto_15971 ) ) ( not ( = ?auto_15972 ?auto_15970 ) ) ( not ( = ?auto_15971 ?auto_15970 ) ) ( ON ?auto_15971 ?auto_15972 ) ( CLEAR ?auto_15971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15969 ?auto_15972 )
      ( MAKE-1PILE ?auto_15969 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15973 - BLOCK
    )
    :vars
    (
      ?auto_15975 - BLOCK
      ?auto_15974 - BLOCK
      ?auto_15976 - BLOCK
      ?auto_15978 - BLOCK
      ?auto_15977 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15975 ?auto_15973 ) ( ON-TABLE ?auto_15973 ) ( not ( = ?auto_15973 ?auto_15975 ) ) ( not ( = ?auto_15973 ?auto_15974 ) ) ( not ( = ?auto_15973 ?auto_15976 ) ) ( not ( = ?auto_15975 ?auto_15974 ) ) ( not ( = ?auto_15975 ?auto_15976 ) ) ( not ( = ?auto_15974 ?auto_15976 ) ) ( ON ?auto_15974 ?auto_15975 ) ( CLEAR ?auto_15974 ) ( HOLDING ?auto_15976 ) ( CLEAR ?auto_15978 ) ( ON-TABLE ?auto_15977 ) ( ON ?auto_15978 ?auto_15977 ) ( not ( = ?auto_15977 ?auto_15978 ) ) ( not ( = ?auto_15977 ?auto_15976 ) ) ( not ( = ?auto_15978 ?auto_15976 ) ) ( not ( = ?auto_15973 ?auto_15978 ) ) ( not ( = ?auto_15973 ?auto_15977 ) ) ( not ( = ?auto_15975 ?auto_15978 ) ) ( not ( = ?auto_15975 ?auto_15977 ) ) ( not ( = ?auto_15974 ?auto_15978 ) ) ( not ( = ?auto_15974 ?auto_15977 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15977 ?auto_15978 ?auto_15976 )
      ( MAKE-1PILE ?auto_15973 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15979 - BLOCK
    )
    :vars
    (
      ?auto_15983 - BLOCK
      ?auto_15984 - BLOCK
      ?auto_15980 - BLOCK
      ?auto_15982 - BLOCK
      ?auto_15981 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15983 ?auto_15979 ) ( ON-TABLE ?auto_15979 ) ( not ( = ?auto_15979 ?auto_15983 ) ) ( not ( = ?auto_15979 ?auto_15984 ) ) ( not ( = ?auto_15979 ?auto_15980 ) ) ( not ( = ?auto_15983 ?auto_15984 ) ) ( not ( = ?auto_15983 ?auto_15980 ) ) ( not ( = ?auto_15984 ?auto_15980 ) ) ( ON ?auto_15984 ?auto_15983 ) ( CLEAR ?auto_15982 ) ( ON-TABLE ?auto_15981 ) ( ON ?auto_15982 ?auto_15981 ) ( not ( = ?auto_15981 ?auto_15982 ) ) ( not ( = ?auto_15981 ?auto_15980 ) ) ( not ( = ?auto_15982 ?auto_15980 ) ) ( not ( = ?auto_15979 ?auto_15982 ) ) ( not ( = ?auto_15979 ?auto_15981 ) ) ( not ( = ?auto_15983 ?auto_15982 ) ) ( not ( = ?auto_15983 ?auto_15981 ) ) ( not ( = ?auto_15984 ?auto_15982 ) ) ( not ( = ?auto_15984 ?auto_15981 ) ) ( ON ?auto_15980 ?auto_15984 ) ( CLEAR ?auto_15980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_15979 ?auto_15983 ?auto_15984 )
      ( MAKE-1PILE ?auto_15979 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15985 - BLOCK
    )
    :vars
    (
      ?auto_15989 - BLOCK
      ?auto_15988 - BLOCK
      ?auto_15986 - BLOCK
      ?auto_15987 - BLOCK
      ?auto_15990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15989 ?auto_15985 ) ( ON-TABLE ?auto_15985 ) ( not ( = ?auto_15985 ?auto_15989 ) ) ( not ( = ?auto_15985 ?auto_15988 ) ) ( not ( = ?auto_15985 ?auto_15986 ) ) ( not ( = ?auto_15989 ?auto_15988 ) ) ( not ( = ?auto_15989 ?auto_15986 ) ) ( not ( = ?auto_15988 ?auto_15986 ) ) ( ON ?auto_15988 ?auto_15989 ) ( ON-TABLE ?auto_15987 ) ( not ( = ?auto_15987 ?auto_15990 ) ) ( not ( = ?auto_15987 ?auto_15986 ) ) ( not ( = ?auto_15990 ?auto_15986 ) ) ( not ( = ?auto_15985 ?auto_15990 ) ) ( not ( = ?auto_15985 ?auto_15987 ) ) ( not ( = ?auto_15989 ?auto_15990 ) ) ( not ( = ?auto_15989 ?auto_15987 ) ) ( not ( = ?auto_15988 ?auto_15990 ) ) ( not ( = ?auto_15988 ?auto_15987 ) ) ( ON ?auto_15986 ?auto_15988 ) ( CLEAR ?auto_15986 ) ( HOLDING ?auto_15990 ) ( CLEAR ?auto_15987 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15987 ?auto_15990 )
      ( MAKE-1PILE ?auto_15985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16454 - BLOCK
    )
    :vars
    (
      ?auto_16458 - BLOCK
      ?auto_16456 - BLOCK
      ?auto_16455 - BLOCK
      ?auto_16457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16458 ?auto_16454 ) ( ON-TABLE ?auto_16454 ) ( not ( = ?auto_16454 ?auto_16458 ) ) ( not ( = ?auto_16454 ?auto_16456 ) ) ( not ( = ?auto_16454 ?auto_16455 ) ) ( not ( = ?auto_16458 ?auto_16456 ) ) ( not ( = ?auto_16458 ?auto_16455 ) ) ( not ( = ?auto_16456 ?auto_16455 ) ) ( ON ?auto_16456 ?auto_16458 ) ( not ( = ?auto_16457 ?auto_16455 ) ) ( not ( = ?auto_16454 ?auto_16457 ) ) ( not ( = ?auto_16458 ?auto_16457 ) ) ( not ( = ?auto_16456 ?auto_16457 ) ) ( ON ?auto_16455 ?auto_16456 ) ( ON ?auto_16457 ?auto_16455 ) ( CLEAR ?auto_16457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16454 ?auto_16458 ?auto_16456 ?auto_16455 )
      ( MAKE-1PILE ?auto_16454 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15997 - BLOCK
    )
    :vars
    (
      ?auto_15999 - BLOCK
      ?auto_16001 - BLOCK
      ?auto_15998 - BLOCK
      ?auto_16002 - BLOCK
      ?auto_16000 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_15999 ?auto_15997 ) ( ON-TABLE ?auto_15997 ) ( not ( = ?auto_15997 ?auto_15999 ) ) ( not ( = ?auto_15997 ?auto_16001 ) ) ( not ( = ?auto_15997 ?auto_15998 ) ) ( not ( = ?auto_15999 ?auto_16001 ) ) ( not ( = ?auto_15999 ?auto_15998 ) ) ( not ( = ?auto_16001 ?auto_15998 ) ) ( ON ?auto_16001 ?auto_15999 ) ( not ( = ?auto_16002 ?auto_16000 ) ) ( not ( = ?auto_16002 ?auto_15998 ) ) ( not ( = ?auto_16000 ?auto_15998 ) ) ( not ( = ?auto_15997 ?auto_16000 ) ) ( not ( = ?auto_15997 ?auto_16002 ) ) ( not ( = ?auto_15999 ?auto_16000 ) ) ( not ( = ?auto_15999 ?auto_16002 ) ) ( not ( = ?auto_16001 ?auto_16000 ) ) ( not ( = ?auto_16001 ?auto_16002 ) ) ( ON ?auto_15998 ?auto_16001 ) ( ON ?auto_16000 ?auto_15998 ) ( CLEAR ?auto_16000 ) ( HOLDING ?auto_16002 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16002 )
      ( MAKE-1PILE ?auto_15997 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16003 - BLOCK
    )
    :vars
    (
      ?auto_16004 - BLOCK
      ?auto_16006 - BLOCK
      ?auto_16005 - BLOCK
      ?auto_16008 - BLOCK
      ?auto_16007 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16004 ?auto_16003 ) ( ON-TABLE ?auto_16003 ) ( not ( = ?auto_16003 ?auto_16004 ) ) ( not ( = ?auto_16003 ?auto_16006 ) ) ( not ( = ?auto_16003 ?auto_16005 ) ) ( not ( = ?auto_16004 ?auto_16006 ) ) ( not ( = ?auto_16004 ?auto_16005 ) ) ( not ( = ?auto_16006 ?auto_16005 ) ) ( ON ?auto_16006 ?auto_16004 ) ( not ( = ?auto_16008 ?auto_16007 ) ) ( not ( = ?auto_16008 ?auto_16005 ) ) ( not ( = ?auto_16007 ?auto_16005 ) ) ( not ( = ?auto_16003 ?auto_16007 ) ) ( not ( = ?auto_16003 ?auto_16008 ) ) ( not ( = ?auto_16004 ?auto_16007 ) ) ( not ( = ?auto_16004 ?auto_16008 ) ) ( not ( = ?auto_16006 ?auto_16007 ) ) ( not ( = ?auto_16006 ?auto_16008 ) ) ( ON ?auto_16005 ?auto_16006 ) ( ON ?auto_16007 ?auto_16005 ) ( ON ?auto_16008 ?auto_16007 ) ( CLEAR ?auto_16008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16003 ?auto_16004 ?auto_16006 ?auto_16005 ?auto_16007 )
      ( MAKE-1PILE ?auto_16003 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16014 - BLOCK
      ?auto_16015 - BLOCK
      ?auto_16016 - BLOCK
      ?auto_16017 - BLOCK
      ?auto_16018 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_16018 ) ( CLEAR ?auto_16017 ) ( ON-TABLE ?auto_16014 ) ( ON ?auto_16015 ?auto_16014 ) ( ON ?auto_16016 ?auto_16015 ) ( ON ?auto_16017 ?auto_16016 ) ( not ( = ?auto_16014 ?auto_16015 ) ) ( not ( = ?auto_16014 ?auto_16016 ) ) ( not ( = ?auto_16014 ?auto_16017 ) ) ( not ( = ?auto_16014 ?auto_16018 ) ) ( not ( = ?auto_16015 ?auto_16016 ) ) ( not ( = ?auto_16015 ?auto_16017 ) ) ( not ( = ?auto_16015 ?auto_16018 ) ) ( not ( = ?auto_16016 ?auto_16017 ) ) ( not ( = ?auto_16016 ?auto_16018 ) ) ( not ( = ?auto_16017 ?auto_16018 ) ) )
    :subtasks
    ( ( !STACK ?auto_16018 ?auto_16017 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16019 - BLOCK
      ?auto_16020 - BLOCK
      ?auto_16021 - BLOCK
      ?auto_16022 - BLOCK
      ?auto_16023 - BLOCK
    )
    :vars
    (
      ?auto_16024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16022 ) ( ON-TABLE ?auto_16019 ) ( ON ?auto_16020 ?auto_16019 ) ( ON ?auto_16021 ?auto_16020 ) ( ON ?auto_16022 ?auto_16021 ) ( not ( = ?auto_16019 ?auto_16020 ) ) ( not ( = ?auto_16019 ?auto_16021 ) ) ( not ( = ?auto_16019 ?auto_16022 ) ) ( not ( = ?auto_16019 ?auto_16023 ) ) ( not ( = ?auto_16020 ?auto_16021 ) ) ( not ( = ?auto_16020 ?auto_16022 ) ) ( not ( = ?auto_16020 ?auto_16023 ) ) ( not ( = ?auto_16021 ?auto_16022 ) ) ( not ( = ?auto_16021 ?auto_16023 ) ) ( not ( = ?auto_16022 ?auto_16023 ) ) ( ON ?auto_16023 ?auto_16024 ) ( CLEAR ?auto_16023 ) ( HAND-EMPTY ) ( not ( = ?auto_16019 ?auto_16024 ) ) ( not ( = ?auto_16020 ?auto_16024 ) ) ( not ( = ?auto_16021 ?auto_16024 ) ) ( not ( = ?auto_16022 ?auto_16024 ) ) ( not ( = ?auto_16023 ?auto_16024 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16023 ?auto_16024 )
      ( MAKE-5PILE ?auto_16019 ?auto_16020 ?auto_16021 ?auto_16022 ?auto_16023 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16025 - BLOCK
      ?auto_16026 - BLOCK
      ?auto_16027 - BLOCK
      ?auto_16028 - BLOCK
      ?auto_16029 - BLOCK
    )
    :vars
    (
      ?auto_16030 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16025 ) ( ON ?auto_16026 ?auto_16025 ) ( ON ?auto_16027 ?auto_16026 ) ( not ( = ?auto_16025 ?auto_16026 ) ) ( not ( = ?auto_16025 ?auto_16027 ) ) ( not ( = ?auto_16025 ?auto_16028 ) ) ( not ( = ?auto_16025 ?auto_16029 ) ) ( not ( = ?auto_16026 ?auto_16027 ) ) ( not ( = ?auto_16026 ?auto_16028 ) ) ( not ( = ?auto_16026 ?auto_16029 ) ) ( not ( = ?auto_16027 ?auto_16028 ) ) ( not ( = ?auto_16027 ?auto_16029 ) ) ( not ( = ?auto_16028 ?auto_16029 ) ) ( ON ?auto_16029 ?auto_16030 ) ( CLEAR ?auto_16029 ) ( not ( = ?auto_16025 ?auto_16030 ) ) ( not ( = ?auto_16026 ?auto_16030 ) ) ( not ( = ?auto_16027 ?auto_16030 ) ) ( not ( = ?auto_16028 ?auto_16030 ) ) ( not ( = ?auto_16029 ?auto_16030 ) ) ( HOLDING ?auto_16028 ) ( CLEAR ?auto_16027 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16025 ?auto_16026 ?auto_16027 ?auto_16028 )
      ( MAKE-5PILE ?auto_16025 ?auto_16026 ?auto_16027 ?auto_16028 ?auto_16029 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16031 - BLOCK
      ?auto_16032 - BLOCK
      ?auto_16033 - BLOCK
      ?auto_16034 - BLOCK
      ?auto_16035 - BLOCK
    )
    :vars
    (
      ?auto_16036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16031 ) ( ON ?auto_16032 ?auto_16031 ) ( ON ?auto_16033 ?auto_16032 ) ( not ( = ?auto_16031 ?auto_16032 ) ) ( not ( = ?auto_16031 ?auto_16033 ) ) ( not ( = ?auto_16031 ?auto_16034 ) ) ( not ( = ?auto_16031 ?auto_16035 ) ) ( not ( = ?auto_16032 ?auto_16033 ) ) ( not ( = ?auto_16032 ?auto_16034 ) ) ( not ( = ?auto_16032 ?auto_16035 ) ) ( not ( = ?auto_16033 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16035 ) ) ( not ( = ?auto_16034 ?auto_16035 ) ) ( ON ?auto_16035 ?auto_16036 ) ( not ( = ?auto_16031 ?auto_16036 ) ) ( not ( = ?auto_16032 ?auto_16036 ) ) ( not ( = ?auto_16033 ?auto_16036 ) ) ( not ( = ?auto_16034 ?auto_16036 ) ) ( not ( = ?auto_16035 ?auto_16036 ) ) ( CLEAR ?auto_16033 ) ( ON ?auto_16034 ?auto_16035 ) ( CLEAR ?auto_16034 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16036 ?auto_16035 )
      ( MAKE-5PILE ?auto_16031 ?auto_16032 ?auto_16033 ?auto_16034 ?auto_16035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16037 - BLOCK
      ?auto_16038 - BLOCK
      ?auto_16039 - BLOCK
      ?auto_16040 - BLOCK
      ?auto_16041 - BLOCK
    )
    :vars
    (
      ?auto_16042 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16037 ) ( ON ?auto_16038 ?auto_16037 ) ( not ( = ?auto_16037 ?auto_16038 ) ) ( not ( = ?auto_16037 ?auto_16039 ) ) ( not ( = ?auto_16037 ?auto_16040 ) ) ( not ( = ?auto_16037 ?auto_16041 ) ) ( not ( = ?auto_16038 ?auto_16039 ) ) ( not ( = ?auto_16038 ?auto_16040 ) ) ( not ( = ?auto_16038 ?auto_16041 ) ) ( not ( = ?auto_16039 ?auto_16040 ) ) ( not ( = ?auto_16039 ?auto_16041 ) ) ( not ( = ?auto_16040 ?auto_16041 ) ) ( ON ?auto_16041 ?auto_16042 ) ( not ( = ?auto_16037 ?auto_16042 ) ) ( not ( = ?auto_16038 ?auto_16042 ) ) ( not ( = ?auto_16039 ?auto_16042 ) ) ( not ( = ?auto_16040 ?auto_16042 ) ) ( not ( = ?auto_16041 ?auto_16042 ) ) ( ON ?auto_16040 ?auto_16041 ) ( CLEAR ?auto_16040 ) ( ON-TABLE ?auto_16042 ) ( HOLDING ?auto_16039 ) ( CLEAR ?auto_16038 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16037 ?auto_16038 ?auto_16039 )
      ( MAKE-5PILE ?auto_16037 ?auto_16038 ?auto_16039 ?auto_16040 ?auto_16041 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16043 - BLOCK
      ?auto_16044 - BLOCK
      ?auto_16045 - BLOCK
      ?auto_16046 - BLOCK
      ?auto_16047 - BLOCK
    )
    :vars
    (
      ?auto_16048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16043 ) ( ON ?auto_16044 ?auto_16043 ) ( not ( = ?auto_16043 ?auto_16044 ) ) ( not ( = ?auto_16043 ?auto_16045 ) ) ( not ( = ?auto_16043 ?auto_16046 ) ) ( not ( = ?auto_16043 ?auto_16047 ) ) ( not ( = ?auto_16044 ?auto_16045 ) ) ( not ( = ?auto_16044 ?auto_16046 ) ) ( not ( = ?auto_16044 ?auto_16047 ) ) ( not ( = ?auto_16045 ?auto_16046 ) ) ( not ( = ?auto_16045 ?auto_16047 ) ) ( not ( = ?auto_16046 ?auto_16047 ) ) ( ON ?auto_16047 ?auto_16048 ) ( not ( = ?auto_16043 ?auto_16048 ) ) ( not ( = ?auto_16044 ?auto_16048 ) ) ( not ( = ?auto_16045 ?auto_16048 ) ) ( not ( = ?auto_16046 ?auto_16048 ) ) ( not ( = ?auto_16047 ?auto_16048 ) ) ( ON ?auto_16046 ?auto_16047 ) ( ON-TABLE ?auto_16048 ) ( CLEAR ?auto_16044 ) ( ON ?auto_16045 ?auto_16046 ) ( CLEAR ?auto_16045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16048 ?auto_16047 ?auto_16046 )
      ( MAKE-5PILE ?auto_16043 ?auto_16044 ?auto_16045 ?auto_16046 ?auto_16047 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16049 - BLOCK
      ?auto_16050 - BLOCK
      ?auto_16051 - BLOCK
      ?auto_16052 - BLOCK
      ?auto_16053 - BLOCK
    )
    :vars
    (
      ?auto_16054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16049 ) ( not ( = ?auto_16049 ?auto_16050 ) ) ( not ( = ?auto_16049 ?auto_16051 ) ) ( not ( = ?auto_16049 ?auto_16052 ) ) ( not ( = ?auto_16049 ?auto_16053 ) ) ( not ( = ?auto_16050 ?auto_16051 ) ) ( not ( = ?auto_16050 ?auto_16052 ) ) ( not ( = ?auto_16050 ?auto_16053 ) ) ( not ( = ?auto_16051 ?auto_16052 ) ) ( not ( = ?auto_16051 ?auto_16053 ) ) ( not ( = ?auto_16052 ?auto_16053 ) ) ( ON ?auto_16053 ?auto_16054 ) ( not ( = ?auto_16049 ?auto_16054 ) ) ( not ( = ?auto_16050 ?auto_16054 ) ) ( not ( = ?auto_16051 ?auto_16054 ) ) ( not ( = ?auto_16052 ?auto_16054 ) ) ( not ( = ?auto_16053 ?auto_16054 ) ) ( ON ?auto_16052 ?auto_16053 ) ( ON-TABLE ?auto_16054 ) ( ON ?auto_16051 ?auto_16052 ) ( CLEAR ?auto_16051 ) ( HOLDING ?auto_16050 ) ( CLEAR ?auto_16049 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16049 ?auto_16050 )
      ( MAKE-5PILE ?auto_16049 ?auto_16050 ?auto_16051 ?auto_16052 ?auto_16053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16055 - BLOCK
      ?auto_16056 - BLOCK
      ?auto_16057 - BLOCK
      ?auto_16058 - BLOCK
      ?auto_16059 - BLOCK
    )
    :vars
    (
      ?auto_16060 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16055 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16059 ) ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( ON ?auto_16059 ?auto_16060 ) ( not ( = ?auto_16055 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( ON ?auto_16058 ?auto_16059 ) ( ON-TABLE ?auto_16060 ) ( ON ?auto_16057 ?auto_16058 ) ( CLEAR ?auto_16055 ) ( ON ?auto_16056 ?auto_16057 ) ( CLEAR ?auto_16056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16060 ?auto_16059 ?auto_16058 ?auto_16057 )
      ( MAKE-5PILE ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16061 - BLOCK
      ?auto_16062 - BLOCK
      ?auto_16063 - BLOCK
      ?auto_16064 - BLOCK
      ?auto_16065 - BLOCK
    )
    :vars
    (
      ?auto_16066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16061 ?auto_16062 ) ) ( not ( = ?auto_16061 ?auto_16063 ) ) ( not ( = ?auto_16061 ?auto_16064 ) ) ( not ( = ?auto_16061 ?auto_16065 ) ) ( not ( = ?auto_16062 ?auto_16063 ) ) ( not ( = ?auto_16062 ?auto_16064 ) ) ( not ( = ?auto_16062 ?auto_16065 ) ) ( not ( = ?auto_16063 ?auto_16064 ) ) ( not ( = ?auto_16063 ?auto_16065 ) ) ( not ( = ?auto_16064 ?auto_16065 ) ) ( ON ?auto_16065 ?auto_16066 ) ( not ( = ?auto_16061 ?auto_16066 ) ) ( not ( = ?auto_16062 ?auto_16066 ) ) ( not ( = ?auto_16063 ?auto_16066 ) ) ( not ( = ?auto_16064 ?auto_16066 ) ) ( not ( = ?auto_16065 ?auto_16066 ) ) ( ON ?auto_16064 ?auto_16065 ) ( ON-TABLE ?auto_16066 ) ( ON ?auto_16063 ?auto_16064 ) ( ON ?auto_16062 ?auto_16063 ) ( CLEAR ?auto_16062 ) ( HOLDING ?auto_16061 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16061 )
      ( MAKE-5PILE ?auto_16061 ?auto_16062 ?auto_16063 ?auto_16064 ?auto_16065 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16067 - BLOCK
      ?auto_16068 - BLOCK
      ?auto_16069 - BLOCK
      ?auto_16070 - BLOCK
      ?auto_16071 - BLOCK
    )
    :vars
    (
      ?auto_16072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16067 ?auto_16068 ) ) ( not ( = ?auto_16067 ?auto_16069 ) ) ( not ( = ?auto_16067 ?auto_16070 ) ) ( not ( = ?auto_16067 ?auto_16071 ) ) ( not ( = ?auto_16068 ?auto_16069 ) ) ( not ( = ?auto_16068 ?auto_16070 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( not ( = ?auto_16069 ?auto_16070 ) ) ( not ( = ?auto_16069 ?auto_16071 ) ) ( not ( = ?auto_16070 ?auto_16071 ) ) ( ON ?auto_16071 ?auto_16072 ) ( not ( = ?auto_16067 ?auto_16072 ) ) ( not ( = ?auto_16068 ?auto_16072 ) ) ( not ( = ?auto_16069 ?auto_16072 ) ) ( not ( = ?auto_16070 ?auto_16072 ) ) ( not ( = ?auto_16071 ?auto_16072 ) ) ( ON ?auto_16070 ?auto_16071 ) ( ON-TABLE ?auto_16072 ) ( ON ?auto_16069 ?auto_16070 ) ( ON ?auto_16068 ?auto_16069 ) ( ON ?auto_16067 ?auto_16068 ) ( CLEAR ?auto_16067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16072 ?auto_16071 ?auto_16070 ?auto_16069 ?auto_16068 )
      ( MAKE-5PILE ?auto_16067 ?auto_16068 ?auto_16069 ?auto_16070 ?auto_16071 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16131 - BLOCK
    )
    :vars
    (
      ?auto_16132 - BLOCK
      ?auto_16133 - BLOCK
      ?auto_16134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16131 ?auto_16132 ) ( CLEAR ?auto_16131 ) ( not ( = ?auto_16131 ?auto_16132 ) ) ( HOLDING ?auto_16133 ) ( CLEAR ?auto_16134 ) ( not ( = ?auto_16131 ?auto_16133 ) ) ( not ( = ?auto_16131 ?auto_16134 ) ) ( not ( = ?auto_16132 ?auto_16133 ) ) ( not ( = ?auto_16132 ?auto_16134 ) ) ( not ( = ?auto_16133 ?auto_16134 ) ) )
    :subtasks
    ( ( !STACK ?auto_16133 ?auto_16134 )
      ( MAKE-1PILE ?auto_16131 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16135 - BLOCK
    )
    :vars
    (
      ?auto_16137 - BLOCK
      ?auto_16136 - BLOCK
      ?auto_16138 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16135 ?auto_16137 ) ( not ( = ?auto_16135 ?auto_16137 ) ) ( CLEAR ?auto_16136 ) ( not ( = ?auto_16135 ?auto_16138 ) ) ( not ( = ?auto_16135 ?auto_16136 ) ) ( not ( = ?auto_16137 ?auto_16138 ) ) ( not ( = ?auto_16137 ?auto_16136 ) ) ( not ( = ?auto_16138 ?auto_16136 ) ) ( ON ?auto_16138 ?auto_16135 ) ( CLEAR ?auto_16138 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16137 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16137 ?auto_16135 )
      ( MAKE-1PILE ?auto_16135 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16139 - BLOCK
    )
    :vars
    (
      ?auto_16141 - BLOCK
      ?auto_16140 - BLOCK
      ?auto_16142 - BLOCK
      ?auto_16144 - BLOCK
      ?auto_16143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16139 ?auto_16141 ) ( not ( = ?auto_16139 ?auto_16141 ) ) ( not ( = ?auto_16139 ?auto_16140 ) ) ( not ( = ?auto_16139 ?auto_16142 ) ) ( not ( = ?auto_16141 ?auto_16140 ) ) ( not ( = ?auto_16141 ?auto_16142 ) ) ( not ( = ?auto_16140 ?auto_16142 ) ) ( ON ?auto_16140 ?auto_16139 ) ( CLEAR ?auto_16140 ) ( ON-TABLE ?auto_16141 ) ( HOLDING ?auto_16142 ) ( CLEAR ?auto_16144 ) ( ON-TABLE ?auto_16143 ) ( ON ?auto_16144 ?auto_16143 ) ( not ( = ?auto_16143 ?auto_16144 ) ) ( not ( = ?auto_16143 ?auto_16142 ) ) ( not ( = ?auto_16144 ?auto_16142 ) ) ( not ( = ?auto_16139 ?auto_16144 ) ) ( not ( = ?auto_16139 ?auto_16143 ) ) ( not ( = ?auto_16141 ?auto_16144 ) ) ( not ( = ?auto_16141 ?auto_16143 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) ( not ( = ?auto_16140 ?auto_16143 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16143 ?auto_16144 ?auto_16142 )
      ( MAKE-1PILE ?auto_16139 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16145 - BLOCK
    )
    :vars
    (
      ?auto_16149 - BLOCK
      ?auto_16150 - BLOCK
      ?auto_16147 - BLOCK
      ?auto_16146 - BLOCK
      ?auto_16148 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16145 ?auto_16149 ) ( not ( = ?auto_16145 ?auto_16149 ) ) ( not ( = ?auto_16145 ?auto_16150 ) ) ( not ( = ?auto_16145 ?auto_16147 ) ) ( not ( = ?auto_16149 ?auto_16150 ) ) ( not ( = ?auto_16149 ?auto_16147 ) ) ( not ( = ?auto_16150 ?auto_16147 ) ) ( ON ?auto_16150 ?auto_16145 ) ( ON-TABLE ?auto_16149 ) ( CLEAR ?auto_16146 ) ( ON-TABLE ?auto_16148 ) ( ON ?auto_16146 ?auto_16148 ) ( not ( = ?auto_16148 ?auto_16146 ) ) ( not ( = ?auto_16148 ?auto_16147 ) ) ( not ( = ?auto_16146 ?auto_16147 ) ) ( not ( = ?auto_16145 ?auto_16146 ) ) ( not ( = ?auto_16145 ?auto_16148 ) ) ( not ( = ?auto_16149 ?auto_16146 ) ) ( not ( = ?auto_16149 ?auto_16148 ) ) ( not ( = ?auto_16150 ?auto_16146 ) ) ( not ( = ?auto_16150 ?auto_16148 ) ) ( ON ?auto_16147 ?auto_16150 ) ( CLEAR ?auto_16147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16149 ?auto_16145 ?auto_16150 )
      ( MAKE-1PILE ?auto_16145 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16151 - BLOCK
    )
    :vars
    (
      ?auto_16156 - BLOCK
      ?auto_16154 - BLOCK
      ?auto_16155 - BLOCK
      ?auto_16152 - BLOCK
      ?auto_16153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16151 ?auto_16156 ) ( not ( = ?auto_16151 ?auto_16156 ) ) ( not ( = ?auto_16151 ?auto_16154 ) ) ( not ( = ?auto_16151 ?auto_16155 ) ) ( not ( = ?auto_16156 ?auto_16154 ) ) ( not ( = ?auto_16156 ?auto_16155 ) ) ( not ( = ?auto_16154 ?auto_16155 ) ) ( ON ?auto_16154 ?auto_16151 ) ( ON-TABLE ?auto_16156 ) ( ON-TABLE ?auto_16152 ) ( not ( = ?auto_16152 ?auto_16153 ) ) ( not ( = ?auto_16152 ?auto_16155 ) ) ( not ( = ?auto_16153 ?auto_16155 ) ) ( not ( = ?auto_16151 ?auto_16153 ) ) ( not ( = ?auto_16151 ?auto_16152 ) ) ( not ( = ?auto_16156 ?auto_16153 ) ) ( not ( = ?auto_16156 ?auto_16152 ) ) ( not ( = ?auto_16154 ?auto_16153 ) ) ( not ( = ?auto_16154 ?auto_16152 ) ) ( ON ?auto_16155 ?auto_16154 ) ( CLEAR ?auto_16155 ) ( HOLDING ?auto_16153 ) ( CLEAR ?auto_16152 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16152 ?auto_16153 )
      ( MAKE-1PILE ?auto_16151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16157 - BLOCK
    )
    :vars
    (
      ?auto_16161 - BLOCK
      ?auto_16162 - BLOCK
      ?auto_16160 - BLOCK
      ?auto_16159 - BLOCK
      ?auto_16158 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16157 ?auto_16161 ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16161 ?auto_16162 ) ) ( not ( = ?auto_16161 ?auto_16160 ) ) ( not ( = ?auto_16162 ?auto_16160 ) ) ( ON ?auto_16162 ?auto_16157 ) ( ON-TABLE ?auto_16161 ) ( ON-TABLE ?auto_16159 ) ( not ( = ?auto_16159 ?auto_16158 ) ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16161 ?auto_16158 ) ) ( not ( = ?auto_16161 ?auto_16159 ) ) ( not ( = ?auto_16162 ?auto_16158 ) ) ( not ( = ?auto_16162 ?auto_16159 ) ) ( ON ?auto_16160 ?auto_16162 ) ( CLEAR ?auto_16159 ) ( ON ?auto_16158 ?auto_16160 ) ( CLEAR ?auto_16158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16161 ?auto_16157 ?auto_16162 ?auto_16160 )
      ( MAKE-1PILE ?auto_16157 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16163 - BLOCK
    )
    :vars
    (
      ?auto_16164 - BLOCK
      ?auto_16165 - BLOCK
      ?auto_16166 - BLOCK
      ?auto_16167 - BLOCK
      ?auto_16168 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16163 ?auto_16164 ) ( not ( = ?auto_16163 ?auto_16164 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( ON ?auto_16165 ?auto_16163 ) ( ON-TABLE ?auto_16164 ) ( not ( = ?auto_16167 ?auto_16168 ) ) ( not ( = ?auto_16167 ?auto_16166 ) ) ( not ( = ?auto_16168 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16168 ) ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16164 ?auto_16168 ) ) ( not ( = ?auto_16164 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16168 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( ON ?auto_16166 ?auto_16165 ) ( ON ?auto_16168 ?auto_16166 ) ( CLEAR ?auto_16168 ) ( HOLDING ?auto_16167 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16167 )
      ( MAKE-1PILE ?auto_16163 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16169 - BLOCK
    )
    :vars
    (
      ?auto_16173 - BLOCK
      ?auto_16172 - BLOCK
      ?auto_16174 - BLOCK
      ?auto_16170 - BLOCK
      ?auto_16171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16169 ?auto_16173 ) ( not ( = ?auto_16169 ?auto_16173 ) ) ( not ( = ?auto_16169 ?auto_16172 ) ) ( not ( = ?auto_16169 ?auto_16174 ) ) ( not ( = ?auto_16173 ?auto_16172 ) ) ( not ( = ?auto_16173 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16174 ) ) ( ON ?auto_16172 ?auto_16169 ) ( ON-TABLE ?auto_16173 ) ( not ( = ?auto_16170 ?auto_16171 ) ) ( not ( = ?auto_16170 ?auto_16174 ) ) ( not ( = ?auto_16171 ?auto_16174 ) ) ( not ( = ?auto_16169 ?auto_16171 ) ) ( not ( = ?auto_16169 ?auto_16170 ) ) ( not ( = ?auto_16173 ?auto_16171 ) ) ( not ( = ?auto_16173 ?auto_16170 ) ) ( not ( = ?auto_16172 ?auto_16171 ) ) ( not ( = ?auto_16172 ?auto_16170 ) ) ( ON ?auto_16174 ?auto_16172 ) ( ON ?auto_16171 ?auto_16174 ) ( ON ?auto_16170 ?auto_16171 ) ( CLEAR ?auto_16170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16173 ?auto_16169 ?auto_16172 ?auto_16174 ?auto_16171 )
      ( MAKE-1PILE ?auto_16169 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16182 - BLOCK
      ?auto_16183 - BLOCK
      ?auto_16184 - BLOCK
    )
    :vars
    (
      ?auto_16185 - BLOCK
      ?auto_16186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16185 ?auto_16184 ) ( CLEAR ?auto_16185 ) ( ON-TABLE ?auto_16182 ) ( ON ?auto_16183 ?auto_16182 ) ( ON ?auto_16184 ?auto_16183 ) ( not ( = ?auto_16182 ?auto_16183 ) ) ( not ( = ?auto_16182 ?auto_16184 ) ) ( not ( = ?auto_16182 ?auto_16185 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16185 ) ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( HOLDING ?auto_16186 ) ( not ( = ?auto_16182 ?auto_16186 ) ) ( not ( = ?auto_16183 ?auto_16186 ) ) ( not ( = ?auto_16184 ?auto_16186 ) ) ( not ( = ?auto_16185 ?auto_16186 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_16186 )
      ( MAKE-3PILE ?auto_16182 ?auto_16183 ?auto_16184 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16235 - BLOCK
      ?auto_16236 - BLOCK
    )
    :vars
    (
      ?auto_16237 - BLOCK
      ?auto_16238 - BLOCK
      ?auto_16239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16235 ?auto_16236 ) ) ( ON ?auto_16236 ?auto_16237 ) ( not ( = ?auto_16235 ?auto_16237 ) ) ( not ( = ?auto_16236 ?auto_16237 ) ) ( ON ?auto_16235 ?auto_16236 ) ( CLEAR ?auto_16235 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16238 ) ( ON ?auto_16239 ?auto_16238 ) ( ON ?auto_16237 ?auto_16239 ) ( not ( = ?auto_16238 ?auto_16239 ) ) ( not ( = ?auto_16238 ?auto_16237 ) ) ( not ( = ?auto_16238 ?auto_16236 ) ) ( not ( = ?auto_16238 ?auto_16235 ) ) ( not ( = ?auto_16239 ?auto_16237 ) ) ( not ( = ?auto_16239 ?auto_16236 ) ) ( not ( = ?auto_16239 ?auto_16235 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16238 ?auto_16239 ?auto_16237 ?auto_16236 )
      ( MAKE-2PILE ?auto_16235 ?auto_16236 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16242 - BLOCK
      ?auto_16243 - BLOCK
    )
    :vars
    (
      ?auto_16244 - BLOCK
      ?auto_16245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16242 ?auto_16243 ) ) ( ON ?auto_16243 ?auto_16244 ) ( CLEAR ?auto_16243 ) ( not ( = ?auto_16242 ?auto_16244 ) ) ( not ( = ?auto_16243 ?auto_16244 ) ) ( ON ?auto_16242 ?auto_16245 ) ( CLEAR ?auto_16242 ) ( HAND-EMPTY ) ( not ( = ?auto_16242 ?auto_16245 ) ) ( not ( = ?auto_16243 ?auto_16245 ) ) ( not ( = ?auto_16244 ?auto_16245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16242 ?auto_16245 )
      ( MAKE-2PILE ?auto_16242 ?auto_16243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16246 - BLOCK
      ?auto_16247 - BLOCK
    )
    :vars
    (
      ?auto_16249 - BLOCK
      ?auto_16248 - BLOCK
      ?auto_16251 - BLOCK
      ?auto_16250 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16246 ?auto_16247 ) ) ( not ( = ?auto_16246 ?auto_16249 ) ) ( not ( = ?auto_16247 ?auto_16249 ) ) ( ON ?auto_16246 ?auto_16248 ) ( CLEAR ?auto_16246 ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( not ( = ?auto_16249 ?auto_16248 ) ) ( HOLDING ?auto_16247 ) ( CLEAR ?auto_16249 ) ( ON-TABLE ?auto_16251 ) ( ON ?auto_16250 ?auto_16251 ) ( ON ?auto_16249 ?auto_16250 ) ( not ( = ?auto_16251 ?auto_16250 ) ) ( not ( = ?auto_16251 ?auto_16249 ) ) ( not ( = ?auto_16251 ?auto_16247 ) ) ( not ( = ?auto_16250 ?auto_16249 ) ) ( not ( = ?auto_16250 ?auto_16247 ) ) ( not ( = ?auto_16246 ?auto_16251 ) ) ( not ( = ?auto_16246 ?auto_16250 ) ) ( not ( = ?auto_16248 ?auto_16251 ) ) ( not ( = ?auto_16248 ?auto_16250 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16251 ?auto_16250 ?auto_16249 ?auto_16247 )
      ( MAKE-2PILE ?auto_16246 ?auto_16247 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16252 - BLOCK
      ?auto_16253 - BLOCK
    )
    :vars
    (
      ?auto_16256 - BLOCK
      ?auto_16254 - BLOCK
      ?auto_16255 - BLOCK
      ?auto_16257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16252 ?auto_16253 ) ) ( not ( = ?auto_16252 ?auto_16256 ) ) ( not ( = ?auto_16253 ?auto_16256 ) ) ( ON ?auto_16252 ?auto_16254 ) ( not ( = ?auto_16252 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16256 ?auto_16254 ) ) ( CLEAR ?auto_16256 ) ( ON-TABLE ?auto_16255 ) ( ON ?auto_16257 ?auto_16255 ) ( ON ?auto_16256 ?auto_16257 ) ( not ( = ?auto_16255 ?auto_16257 ) ) ( not ( = ?auto_16255 ?auto_16256 ) ) ( not ( = ?auto_16255 ?auto_16253 ) ) ( not ( = ?auto_16257 ?auto_16256 ) ) ( not ( = ?auto_16257 ?auto_16253 ) ) ( not ( = ?auto_16252 ?auto_16255 ) ) ( not ( = ?auto_16252 ?auto_16257 ) ) ( not ( = ?auto_16254 ?auto_16255 ) ) ( not ( = ?auto_16254 ?auto_16257 ) ) ( ON ?auto_16253 ?auto_16252 ) ( CLEAR ?auto_16253 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16254 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16254 ?auto_16252 )
      ( MAKE-2PILE ?auto_16252 ?auto_16253 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16258 - BLOCK
      ?auto_16259 - BLOCK
    )
    :vars
    (
      ?auto_16263 - BLOCK
      ?auto_16262 - BLOCK
      ?auto_16261 - BLOCK
      ?auto_16260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16258 ?auto_16259 ) ) ( not ( = ?auto_16258 ?auto_16263 ) ) ( not ( = ?auto_16259 ?auto_16263 ) ) ( ON ?auto_16258 ?auto_16262 ) ( not ( = ?auto_16258 ?auto_16262 ) ) ( not ( = ?auto_16259 ?auto_16262 ) ) ( not ( = ?auto_16263 ?auto_16262 ) ) ( ON-TABLE ?auto_16261 ) ( ON ?auto_16260 ?auto_16261 ) ( not ( = ?auto_16261 ?auto_16260 ) ) ( not ( = ?auto_16261 ?auto_16263 ) ) ( not ( = ?auto_16261 ?auto_16259 ) ) ( not ( = ?auto_16260 ?auto_16263 ) ) ( not ( = ?auto_16260 ?auto_16259 ) ) ( not ( = ?auto_16258 ?auto_16261 ) ) ( not ( = ?auto_16258 ?auto_16260 ) ) ( not ( = ?auto_16262 ?auto_16261 ) ) ( not ( = ?auto_16262 ?auto_16260 ) ) ( ON ?auto_16259 ?auto_16258 ) ( CLEAR ?auto_16259 ) ( ON-TABLE ?auto_16262 ) ( HOLDING ?auto_16263 ) ( CLEAR ?auto_16260 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16261 ?auto_16260 ?auto_16263 )
      ( MAKE-2PILE ?auto_16258 ?auto_16259 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16264 - BLOCK
      ?auto_16265 - BLOCK
    )
    :vars
    (
      ?auto_16266 - BLOCK
      ?auto_16268 - BLOCK
      ?auto_16267 - BLOCK
      ?auto_16269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16264 ?auto_16265 ) ) ( not ( = ?auto_16264 ?auto_16266 ) ) ( not ( = ?auto_16265 ?auto_16266 ) ) ( ON ?auto_16264 ?auto_16268 ) ( not ( = ?auto_16264 ?auto_16268 ) ) ( not ( = ?auto_16265 ?auto_16268 ) ) ( not ( = ?auto_16266 ?auto_16268 ) ) ( ON-TABLE ?auto_16267 ) ( ON ?auto_16269 ?auto_16267 ) ( not ( = ?auto_16267 ?auto_16269 ) ) ( not ( = ?auto_16267 ?auto_16266 ) ) ( not ( = ?auto_16267 ?auto_16265 ) ) ( not ( = ?auto_16269 ?auto_16266 ) ) ( not ( = ?auto_16269 ?auto_16265 ) ) ( not ( = ?auto_16264 ?auto_16267 ) ) ( not ( = ?auto_16264 ?auto_16269 ) ) ( not ( = ?auto_16268 ?auto_16267 ) ) ( not ( = ?auto_16268 ?auto_16269 ) ) ( ON ?auto_16265 ?auto_16264 ) ( ON-TABLE ?auto_16268 ) ( CLEAR ?auto_16269 ) ( ON ?auto_16266 ?auto_16265 ) ( CLEAR ?auto_16266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16268 ?auto_16264 ?auto_16265 )
      ( MAKE-2PILE ?auto_16264 ?auto_16265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16270 - BLOCK
      ?auto_16271 - BLOCK
    )
    :vars
    (
      ?auto_16273 - BLOCK
      ?auto_16272 - BLOCK
      ?auto_16275 - BLOCK
      ?auto_16274 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16270 ?auto_16271 ) ) ( not ( = ?auto_16270 ?auto_16273 ) ) ( not ( = ?auto_16271 ?auto_16273 ) ) ( ON ?auto_16270 ?auto_16272 ) ( not ( = ?auto_16270 ?auto_16272 ) ) ( not ( = ?auto_16271 ?auto_16272 ) ) ( not ( = ?auto_16273 ?auto_16272 ) ) ( ON-TABLE ?auto_16275 ) ( not ( = ?auto_16275 ?auto_16274 ) ) ( not ( = ?auto_16275 ?auto_16273 ) ) ( not ( = ?auto_16275 ?auto_16271 ) ) ( not ( = ?auto_16274 ?auto_16273 ) ) ( not ( = ?auto_16274 ?auto_16271 ) ) ( not ( = ?auto_16270 ?auto_16275 ) ) ( not ( = ?auto_16270 ?auto_16274 ) ) ( not ( = ?auto_16272 ?auto_16275 ) ) ( not ( = ?auto_16272 ?auto_16274 ) ) ( ON ?auto_16271 ?auto_16270 ) ( ON-TABLE ?auto_16272 ) ( ON ?auto_16273 ?auto_16271 ) ( CLEAR ?auto_16273 ) ( HOLDING ?auto_16274 ) ( CLEAR ?auto_16275 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16275 ?auto_16274 )
      ( MAKE-2PILE ?auto_16270 ?auto_16271 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16276 - BLOCK
      ?auto_16277 - BLOCK
    )
    :vars
    (
      ?auto_16280 - BLOCK
      ?auto_16279 - BLOCK
      ?auto_16281 - BLOCK
      ?auto_16278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16276 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16280 ) ) ( not ( = ?auto_16277 ?auto_16280 ) ) ( ON ?auto_16276 ?auto_16279 ) ( not ( = ?auto_16276 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( not ( = ?auto_16280 ?auto_16279 ) ) ( ON-TABLE ?auto_16281 ) ( not ( = ?auto_16281 ?auto_16278 ) ) ( not ( = ?auto_16281 ?auto_16280 ) ) ( not ( = ?auto_16281 ?auto_16277 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16278 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16281 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16279 ?auto_16278 ) ) ( ON ?auto_16277 ?auto_16276 ) ( ON-TABLE ?auto_16279 ) ( ON ?auto_16280 ?auto_16277 ) ( CLEAR ?auto_16281 ) ( ON ?auto_16278 ?auto_16280 ) ( CLEAR ?auto_16278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16279 ?auto_16276 ?auto_16277 ?auto_16280 )
      ( MAKE-2PILE ?auto_16276 ?auto_16277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16282 - BLOCK
      ?auto_16283 - BLOCK
    )
    :vars
    (
      ?auto_16285 - BLOCK
      ?auto_16284 - BLOCK
      ?auto_16286 - BLOCK
      ?auto_16287 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( ON ?auto_16282 ?auto_16284 ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16285 ?auto_16284 ) ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16285 ) ) ( not ( = ?auto_16286 ?auto_16283 ) ) ( not ( = ?auto_16287 ?auto_16285 ) ) ( not ( = ?auto_16287 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16287 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16287 ) ) ( ON ?auto_16283 ?auto_16282 ) ( ON-TABLE ?auto_16284 ) ( ON ?auto_16285 ?auto_16283 ) ( ON ?auto_16287 ?auto_16285 ) ( CLEAR ?auto_16287 ) ( HOLDING ?auto_16286 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16286 )
      ( MAKE-2PILE ?auto_16282 ?auto_16283 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16288 - BLOCK
      ?auto_16289 - BLOCK
    )
    :vars
    (
      ?auto_16291 - BLOCK
      ?auto_16293 - BLOCK
      ?auto_16292 - BLOCK
      ?auto_16290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16288 ?auto_16289 ) ) ( not ( = ?auto_16288 ?auto_16291 ) ) ( not ( = ?auto_16289 ?auto_16291 ) ) ( ON ?auto_16288 ?auto_16293 ) ( not ( = ?auto_16288 ?auto_16293 ) ) ( not ( = ?auto_16289 ?auto_16293 ) ) ( not ( = ?auto_16291 ?auto_16293 ) ) ( not ( = ?auto_16292 ?auto_16290 ) ) ( not ( = ?auto_16292 ?auto_16291 ) ) ( not ( = ?auto_16292 ?auto_16289 ) ) ( not ( = ?auto_16290 ?auto_16291 ) ) ( not ( = ?auto_16290 ?auto_16289 ) ) ( not ( = ?auto_16288 ?auto_16292 ) ) ( not ( = ?auto_16288 ?auto_16290 ) ) ( not ( = ?auto_16293 ?auto_16292 ) ) ( not ( = ?auto_16293 ?auto_16290 ) ) ( ON ?auto_16289 ?auto_16288 ) ( ON-TABLE ?auto_16293 ) ( ON ?auto_16291 ?auto_16289 ) ( ON ?auto_16290 ?auto_16291 ) ( ON ?auto_16292 ?auto_16290 ) ( CLEAR ?auto_16292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16293 ?auto_16288 ?auto_16289 ?auto_16291 ?auto_16290 )
      ( MAKE-2PILE ?auto_16288 ?auto_16289 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16309 - BLOCK
      ?auto_16310 - BLOCK
    )
    :vars
    (
      ?auto_16311 - BLOCK
      ?auto_16313 - BLOCK
      ?auto_16312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16311 ?auto_16310 ) ( ON-TABLE ?auto_16309 ) ( ON ?auto_16310 ?auto_16309 ) ( not ( = ?auto_16309 ?auto_16310 ) ) ( not ( = ?auto_16309 ?auto_16311 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) ( not ( = ?auto_16309 ?auto_16313 ) ) ( not ( = ?auto_16309 ?auto_16312 ) ) ( not ( = ?auto_16310 ?auto_16313 ) ) ( not ( = ?auto_16310 ?auto_16312 ) ) ( not ( = ?auto_16311 ?auto_16313 ) ) ( not ( = ?auto_16311 ?auto_16312 ) ) ( not ( = ?auto_16313 ?auto_16312 ) ) ( ON ?auto_16313 ?auto_16311 ) ( CLEAR ?auto_16313 ) ( HOLDING ?auto_16312 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16312 )
      ( MAKE-2PILE ?auto_16309 ?auto_16310 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16356 - BLOCK
      ?auto_16357 - BLOCK
      ?auto_16358 - BLOCK
    )
    :vars
    (
      ?auto_16359 - BLOCK
      ?auto_16360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16356 ) ( not ( = ?auto_16356 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16358 ) ) ( not ( = ?auto_16357 ?auto_16358 ) ) ( ON ?auto_16358 ?auto_16359 ) ( not ( = ?auto_16356 ?auto_16359 ) ) ( not ( = ?auto_16357 ?auto_16359 ) ) ( not ( = ?auto_16358 ?auto_16359 ) ) ( CLEAR ?auto_16356 ) ( ON ?auto_16357 ?auto_16358 ) ( CLEAR ?auto_16357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16360 ) ( ON ?auto_16359 ?auto_16360 ) ( not ( = ?auto_16360 ?auto_16359 ) ) ( not ( = ?auto_16360 ?auto_16358 ) ) ( not ( = ?auto_16360 ?auto_16357 ) ) ( not ( = ?auto_16356 ?auto_16360 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16360 ?auto_16359 ?auto_16358 )
      ( MAKE-3PILE ?auto_16356 ?auto_16357 ?auto_16358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16361 - BLOCK
      ?auto_16362 - BLOCK
      ?auto_16363 - BLOCK
    )
    :vars
    (
      ?auto_16364 - BLOCK
      ?auto_16365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16362 ?auto_16363 ) ) ( ON ?auto_16363 ?auto_16364 ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16362 ?auto_16364 ) ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( ON ?auto_16362 ?auto_16363 ) ( CLEAR ?auto_16362 ) ( ON-TABLE ?auto_16365 ) ( ON ?auto_16364 ?auto_16365 ) ( not ( = ?auto_16365 ?auto_16364 ) ) ( not ( = ?auto_16365 ?auto_16363 ) ) ( not ( = ?auto_16365 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( HOLDING ?auto_16361 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16361 )
      ( MAKE-3PILE ?auto_16361 ?auto_16362 ?auto_16363 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16366 - BLOCK
      ?auto_16367 - BLOCK
      ?auto_16368 - BLOCK
    )
    :vars
    (
      ?auto_16369 - BLOCK
      ?auto_16370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16366 ?auto_16367 ) ) ( not ( = ?auto_16366 ?auto_16368 ) ) ( not ( = ?auto_16367 ?auto_16368 ) ) ( ON ?auto_16368 ?auto_16369 ) ( not ( = ?auto_16366 ?auto_16369 ) ) ( not ( = ?auto_16367 ?auto_16369 ) ) ( not ( = ?auto_16368 ?auto_16369 ) ) ( ON ?auto_16367 ?auto_16368 ) ( ON-TABLE ?auto_16370 ) ( ON ?auto_16369 ?auto_16370 ) ( not ( = ?auto_16370 ?auto_16369 ) ) ( not ( = ?auto_16370 ?auto_16368 ) ) ( not ( = ?auto_16370 ?auto_16367 ) ) ( not ( = ?auto_16366 ?auto_16370 ) ) ( ON ?auto_16366 ?auto_16367 ) ( CLEAR ?auto_16366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16370 ?auto_16369 ?auto_16368 ?auto_16367 )
      ( MAKE-3PILE ?auto_16366 ?auto_16367 ?auto_16368 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16374 - BLOCK
      ?auto_16375 - BLOCK
      ?auto_16376 - BLOCK
    )
    :vars
    (
      ?auto_16377 - BLOCK
      ?auto_16378 - BLOCK
      ?auto_16379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16374 ?auto_16375 ) ) ( not ( = ?auto_16374 ?auto_16376 ) ) ( not ( = ?auto_16375 ?auto_16376 ) ) ( ON ?auto_16376 ?auto_16377 ) ( not ( = ?auto_16374 ?auto_16377 ) ) ( not ( = ?auto_16375 ?auto_16377 ) ) ( not ( = ?auto_16376 ?auto_16377 ) ) ( ON ?auto_16375 ?auto_16376 ) ( CLEAR ?auto_16375 ) ( ON-TABLE ?auto_16378 ) ( ON ?auto_16377 ?auto_16378 ) ( not ( = ?auto_16378 ?auto_16377 ) ) ( not ( = ?auto_16378 ?auto_16376 ) ) ( not ( = ?auto_16378 ?auto_16375 ) ) ( not ( = ?auto_16374 ?auto_16378 ) ) ( ON ?auto_16374 ?auto_16379 ) ( CLEAR ?auto_16374 ) ( HAND-EMPTY ) ( not ( = ?auto_16374 ?auto_16379 ) ) ( not ( = ?auto_16375 ?auto_16379 ) ) ( not ( = ?auto_16376 ?auto_16379 ) ) ( not ( = ?auto_16377 ?auto_16379 ) ) ( not ( = ?auto_16378 ?auto_16379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16374 ?auto_16379 )
      ( MAKE-3PILE ?auto_16374 ?auto_16375 ?auto_16376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16380 - BLOCK
      ?auto_16381 - BLOCK
      ?auto_16382 - BLOCK
    )
    :vars
    (
      ?auto_16384 - BLOCK
      ?auto_16383 - BLOCK
      ?auto_16385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16380 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16382 ) ) ( not ( = ?auto_16381 ?auto_16382 ) ) ( ON ?auto_16382 ?auto_16384 ) ( not ( = ?auto_16380 ?auto_16384 ) ) ( not ( = ?auto_16381 ?auto_16384 ) ) ( not ( = ?auto_16382 ?auto_16384 ) ) ( ON-TABLE ?auto_16383 ) ( ON ?auto_16384 ?auto_16383 ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16383 ?auto_16382 ) ) ( not ( = ?auto_16383 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16383 ) ) ( ON ?auto_16380 ?auto_16385 ) ( CLEAR ?auto_16380 ) ( not ( = ?auto_16380 ?auto_16385 ) ) ( not ( = ?auto_16381 ?auto_16385 ) ) ( not ( = ?auto_16382 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) ( not ( = ?auto_16383 ?auto_16385 ) ) ( HOLDING ?auto_16381 ) ( CLEAR ?auto_16382 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16383 ?auto_16384 ?auto_16382 ?auto_16381 )
      ( MAKE-3PILE ?auto_16380 ?auto_16381 ?auto_16382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16386 - BLOCK
      ?auto_16387 - BLOCK
      ?auto_16388 - BLOCK
    )
    :vars
    (
      ?auto_16391 - BLOCK
      ?auto_16389 - BLOCK
      ?auto_16390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16386 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16388 ) ) ( not ( = ?auto_16387 ?auto_16388 ) ) ( ON ?auto_16388 ?auto_16391 ) ( not ( = ?auto_16386 ?auto_16391 ) ) ( not ( = ?auto_16387 ?auto_16391 ) ) ( not ( = ?auto_16388 ?auto_16391 ) ) ( ON-TABLE ?auto_16389 ) ( ON ?auto_16391 ?auto_16389 ) ( not ( = ?auto_16389 ?auto_16391 ) ) ( not ( = ?auto_16389 ?auto_16388 ) ) ( not ( = ?auto_16389 ?auto_16387 ) ) ( not ( = ?auto_16386 ?auto_16389 ) ) ( ON ?auto_16386 ?auto_16390 ) ( not ( = ?auto_16386 ?auto_16390 ) ) ( not ( = ?auto_16387 ?auto_16390 ) ) ( not ( = ?auto_16388 ?auto_16390 ) ) ( not ( = ?auto_16391 ?auto_16390 ) ) ( not ( = ?auto_16389 ?auto_16390 ) ) ( CLEAR ?auto_16388 ) ( ON ?auto_16387 ?auto_16386 ) ( CLEAR ?auto_16387 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16390 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16390 ?auto_16386 )
      ( MAKE-3PILE ?auto_16386 ?auto_16387 ?auto_16388 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16392 - BLOCK
      ?auto_16393 - BLOCK
      ?auto_16394 - BLOCK
    )
    :vars
    (
      ?auto_16396 - BLOCK
      ?auto_16395 - BLOCK
      ?auto_16397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16392 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16394 ) ) ( not ( = ?auto_16393 ?auto_16394 ) ) ( not ( = ?auto_16392 ?auto_16396 ) ) ( not ( = ?auto_16393 ?auto_16396 ) ) ( not ( = ?auto_16394 ?auto_16396 ) ) ( ON-TABLE ?auto_16395 ) ( ON ?auto_16396 ?auto_16395 ) ( not ( = ?auto_16395 ?auto_16396 ) ) ( not ( = ?auto_16395 ?auto_16394 ) ) ( not ( = ?auto_16395 ?auto_16393 ) ) ( not ( = ?auto_16392 ?auto_16395 ) ) ( ON ?auto_16392 ?auto_16397 ) ( not ( = ?auto_16392 ?auto_16397 ) ) ( not ( = ?auto_16393 ?auto_16397 ) ) ( not ( = ?auto_16394 ?auto_16397 ) ) ( not ( = ?auto_16396 ?auto_16397 ) ) ( not ( = ?auto_16395 ?auto_16397 ) ) ( ON ?auto_16393 ?auto_16392 ) ( CLEAR ?auto_16393 ) ( ON-TABLE ?auto_16397 ) ( HOLDING ?auto_16394 ) ( CLEAR ?auto_16396 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16395 ?auto_16396 ?auto_16394 )
      ( MAKE-3PILE ?auto_16392 ?auto_16393 ?auto_16394 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16398 - BLOCK
      ?auto_16399 - BLOCK
      ?auto_16400 - BLOCK
    )
    :vars
    (
      ?auto_16401 - BLOCK
      ?auto_16403 - BLOCK
      ?auto_16402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16398 ?auto_16399 ) ) ( not ( = ?auto_16398 ?auto_16400 ) ) ( not ( = ?auto_16399 ?auto_16400 ) ) ( not ( = ?auto_16398 ?auto_16401 ) ) ( not ( = ?auto_16399 ?auto_16401 ) ) ( not ( = ?auto_16400 ?auto_16401 ) ) ( ON-TABLE ?auto_16403 ) ( ON ?auto_16401 ?auto_16403 ) ( not ( = ?auto_16403 ?auto_16401 ) ) ( not ( = ?auto_16403 ?auto_16400 ) ) ( not ( = ?auto_16403 ?auto_16399 ) ) ( not ( = ?auto_16398 ?auto_16403 ) ) ( ON ?auto_16398 ?auto_16402 ) ( not ( = ?auto_16398 ?auto_16402 ) ) ( not ( = ?auto_16399 ?auto_16402 ) ) ( not ( = ?auto_16400 ?auto_16402 ) ) ( not ( = ?auto_16401 ?auto_16402 ) ) ( not ( = ?auto_16403 ?auto_16402 ) ) ( ON ?auto_16399 ?auto_16398 ) ( ON-TABLE ?auto_16402 ) ( CLEAR ?auto_16401 ) ( ON ?auto_16400 ?auto_16399 ) ( CLEAR ?auto_16400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16402 ?auto_16398 ?auto_16399 )
      ( MAKE-3PILE ?auto_16398 ?auto_16399 ?auto_16400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16404 - BLOCK
      ?auto_16405 - BLOCK
      ?auto_16406 - BLOCK
    )
    :vars
    (
      ?auto_16408 - BLOCK
      ?auto_16407 - BLOCK
      ?auto_16409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( not ( = ?auto_16404 ?auto_16408 ) ) ( not ( = ?auto_16405 ?auto_16408 ) ) ( not ( = ?auto_16406 ?auto_16408 ) ) ( ON-TABLE ?auto_16407 ) ( not ( = ?auto_16407 ?auto_16408 ) ) ( not ( = ?auto_16407 ?auto_16406 ) ) ( not ( = ?auto_16407 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16407 ) ) ( ON ?auto_16404 ?auto_16409 ) ( not ( = ?auto_16404 ?auto_16409 ) ) ( not ( = ?auto_16405 ?auto_16409 ) ) ( not ( = ?auto_16406 ?auto_16409 ) ) ( not ( = ?auto_16408 ?auto_16409 ) ) ( not ( = ?auto_16407 ?auto_16409 ) ) ( ON ?auto_16405 ?auto_16404 ) ( ON-TABLE ?auto_16409 ) ( ON ?auto_16406 ?auto_16405 ) ( CLEAR ?auto_16406 ) ( HOLDING ?auto_16408 ) ( CLEAR ?auto_16407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16407 ?auto_16408 )
      ( MAKE-3PILE ?auto_16404 ?auto_16405 ?auto_16406 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16410 - BLOCK
      ?auto_16411 - BLOCK
      ?auto_16412 - BLOCK
    )
    :vars
    (
      ?auto_16413 - BLOCK
      ?auto_16415 - BLOCK
      ?auto_16414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16410 ?auto_16411 ) ) ( not ( = ?auto_16410 ?auto_16412 ) ) ( not ( = ?auto_16411 ?auto_16412 ) ) ( not ( = ?auto_16410 ?auto_16413 ) ) ( not ( = ?auto_16411 ?auto_16413 ) ) ( not ( = ?auto_16412 ?auto_16413 ) ) ( ON-TABLE ?auto_16415 ) ( not ( = ?auto_16415 ?auto_16413 ) ) ( not ( = ?auto_16415 ?auto_16412 ) ) ( not ( = ?auto_16415 ?auto_16411 ) ) ( not ( = ?auto_16410 ?auto_16415 ) ) ( ON ?auto_16410 ?auto_16414 ) ( not ( = ?auto_16410 ?auto_16414 ) ) ( not ( = ?auto_16411 ?auto_16414 ) ) ( not ( = ?auto_16412 ?auto_16414 ) ) ( not ( = ?auto_16413 ?auto_16414 ) ) ( not ( = ?auto_16415 ?auto_16414 ) ) ( ON ?auto_16411 ?auto_16410 ) ( ON-TABLE ?auto_16414 ) ( ON ?auto_16412 ?auto_16411 ) ( CLEAR ?auto_16415 ) ( ON ?auto_16413 ?auto_16412 ) ( CLEAR ?auto_16413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16414 ?auto_16410 ?auto_16411 ?auto_16412 )
      ( MAKE-3PILE ?auto_16410 ?auto_16411 ?auto_16412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16416 - BLOCK
      ?auto_16417 - BLOCK
      ?auto_16418 - BLOCK
    )
    :vars
    (
      ?auto_16421 - BLOCK
      ?auto_16420 - BLOCK
      ?auto_16419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16416 ?auto_16417 ) ) ( not ( = ?auto_16416 ?auto_16418 ) ) ( not ( = ?auto_16417 ?auto_16418 ) ) ( not ( = ?auto_16416 ?auto_16421 ) ) ( not ( = ?auto_16417 ?auto_16421 ) ) ( not ( = ?auto_16418 ?auto_16421 ) ) ( not ( = ?auto_16420 ?auto_16421 ) ) ( not ( = ?auto_16420 ?auto_16418 ) ) ( not ( = ?auto_16420 ?auto_16417 ) ) ( not ( = ?auto_16416 ?auto_16420 ) ) ( ON ?auto_16416 ?auto_16419 ) ( not ( = ?auto_16416 ?auto_16419 ) ) ( not ( = ?auto_16417 ?auto_16419 ) ) ( not ( = ?auto_16418 ?auto_16419 ) ) ( not ( = ?auto_16421 ?auto_16419 ) ) ( not ( = ?auto_16420 ?auto_16419 ) ) ( ON ?auto_16417 ?auto_16416 ) ( ON-TABLE ?auto_16419 ) ( ON ?auto_16418 ?auto_16417 ) ( ON ?auto_16421 ?auto_16418 ) ( CLEAR ?auto_16421 ) ( HOLDING ?auto_16420 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16420 )
      ( MAKE-3PILE ?auto_16416 ?auto_16417 ?auto_16418 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16422 - BLOCK
      ?auto_16423 - BLOCK
      ?auto_16424 - BLOCK
    )
    :vars
    (
      ?auto_16426 - BLOCK
      ?auto_16425 - BLOCK
      ?auto_16427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16422 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16424 ) ) ( not ( = ?auto_16423 ?auto_16424 ) ) ( not ( = ?auto_16422 ?auto_16426 ) ) ( not ( = ?auto_16423 ?auto_16426 ) ) ( not ( = ?auto_16424 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16424 ) ) ( not ( = ?auto_16425 ?auto_16423 ) ) ( not ( = ?auto_16422 ?auto_16425 ) ) ( ON ?auto_16422 ?auto_16427 ) ( not ( = ?auto_16422 ?auto_16427 ) ) ( not ( = ?auto_16423 ?auto_16427 ) ) ( not ( = ?auto_16424 ?auto_16427 ) ) ( not ( = ?auto_16426 ?auto_16427 ) ) ( not ( = ?auto_16425 ?auto_16427 ) ) ( ON ?auto_16423 ?auto_16422 ) ( ON-TABLE ?auto_16427 ) ( ON ?auto_16424 ?auto_16423 ) ( ON ?auto_16426 ?auto_16424 ) ( ON ?auto_16425 ?auto_16426 ) ( CLEAR ?auto_16425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16427 ?auto_16422 ?auto_16423 ?auto_16424 ?auto_16426 )
      ( MAKE-3PILE ?auto_16422 ?auto_16423 ?auto_16424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16439 - BLOCK
    )
    :vars
    (
      ?auto_16441 - BLOCK
      ?auto_16442 - BLOCK
      ?auto_16440 - BLOCK
      ?auto_16443 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16441 ?auto_16439 ) ( ON-TABLE ?auto_16439 ) ( not ( = ?auto_16439 ?auto_16441 ) ) ( not ( = ?auto_16439 ?auto_16442 ) ) ( not ( = ?auto_16439 ?auto_16440 ) ) ( not ( = ?auto_16441 ?auto_16442 ) ) ( not ( = ?auto_16441 ?auto_16440 ) ) ( not ( = ?auto_16442 ?auto_16440 ) ) ( ON ?auto_16442 ?auto_16441 ) ( CLEAR ?auto_16442 ) ( HOLDING ?auto_16440 ) ( CLEAR ?auto_16443 ) ( ON-TABLE ?auto_16443 ) ( not ( = ?auto_16443 ?auto_16440 ) ) ( not ( = ?auto_16439 ?auto_16443 ) ) ( not ( = ?auto_16441 ?auto_16443 ) ) ( not ( = ?auto_16442 ?auto_16443 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16443 ?auto_16440 )
      ( MAKE-1PILE ?auto_16439 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16444 - BLOCK
    )
    :vars
    (
      ?auto_16446 - BLOCK
      ?auto_16447 - BLOCK
      ?auto_16448 - BLOCK
      ?auto_16445 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16446 ?auto_16444 ) ( ON-TABLE ?auto_16444 ) ( not ( = ?auto_16444 ?auto_16446 ) ) ( not ( = ?auto_16444 ?auto_16447 ) ) ( not ( = ?auto_16444 ?auto_16448 ) ) ( not ( = ?auto_16446 ?auto_16447 ) ) ( not ( = ?auto_16446 ?auto_16448 ) ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( ON ?auto_16447 ?auto_16446 ) ( CLEAR ?auto_16445 ) ( ON-TABLE ?auto_16445 ) ( not ( = ?auto_16445 ?auto_16448 ) ) ( not ( = ?auto_16444 ?auto_16445 ) ) ( not ( = ?auto_16446 ?auto_16445 ) ) ( not ( = ?auto_16447 ?auto_16445 ) ) ( ON ?auto_16448 ?auto_16447 ) ( CLEAR ?auto_16448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16444 ?auto_16446 ?auto_16447 )
      ( MAKE-1PILE ?auto_16444 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16449 - BLOCK
    )
    :vars
    (
      ?auto_16451 - BLOCK
      ?auto_16452 - BLOCK
      ?auto_16450 - BLOCK
      ?auto_16453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16451 ?auto_16449 ) ( ON-TABLE ?auto_16449 ) ( not ( = ?auto_16449 ?auto_16451 ) ) ( not ( = ?auto_16449 ?auto_16452 ) ) ( not ( = ?auto_16449 ?auto_16450 ) ) ( not ( = ?auto_16451 ?auto_16452 ) ) ( not ( = ?auto_16451 ?auto_16450 ) ) ( not ( = ?auto_16452 ?auto_16450 ) ) ( ON ?auto_16452 ?auto_16451 ) ( not ( = ?auto_16453 ?auto_16450 ) ) ( not ( = ?auto_16449 ?auto_16453 ) ) ( not ( = ?auto_16451 ?auto_16453 ) ) ( not ( = ?auto_16452 ?auto_16453 ) ) ( ON ?auto_16450 ?auto_16452 ) ( CLEAR ?auto_16450 ) ( HOLDING ?auto_16453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16453 )
      ( MAKE-1PILE ?auto_16449 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16460 - BLOCK
    )
    :vars
    (
      ?auto_16463 - BLOCK
      ?auto_16462 - BLOCK
      ?auto_16461 - BLOCK
      ?auto_16464 - BLOCK
      ?auto_16465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16463 ?auto_16460 ) ( ON-TABLE ?auto_16460 ) ( not ( = ?auto_16460 ?auto_16463 ) ) ( not ( = ?auto_16460 ?auto_16462 ) ) ( not ( = ?auto_16460 ?auto_16461 ) ) ( not ( = ?auto_16463 ?auto_16462 ) ) ( not ( = ?auto_16463 ?auto_16461 ) ) ( not ( = ?auto_16462 ?auto_16461 ) ) ( ON ?auto_16462 ?auto_16463 ) ( not ( = ?auto_16464 ?auto_16461 ) ) ( not ( = ?auto_16460 ?auto_16464 ) ) ( not ( = ?auto_16463 ?auto_16464 ) ) ( not ( = ?auto_16462 ?auto_16464 ) ) ( ON ?auto_16461 ?auto_16462 ) ( CLEAR ?auto_16461 ) ( ON ?auto_16464 ?auto_16465 ) ( CLEAR ?auto_16464 ) ( HAND-EMPTY ) ( not ( = ?auto_16460 ?auto_16465 ) ) ( not ( = ?auto_16463 ?auto_16465 ) ) ( not ( = ?auto_16462 ?auto_16465 ) ) ( not ( = ?auto_16461 ?auto_16465 ) ) ( not ( = ?auto_16464 ?auto_16465 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16464 ?auto_16465 )
      ( MAKE-1PILE ?auto_16460 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16466 - BLOCK
    )
    :vars
    (
      ?auto_16470 - BLOCK
      ?auto_16469 - BLOCK
      ?auto_16467 - BLOCK
      ?auto_16468 - BLOCK
      ?auto_16471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16470 ?auto_16466 ) ( ON-TABLE ?auto_16466 ) ( not ( = ?auto_16466 ?auto_16470 ) ) ( not ( = ?auto_16466 ?auto_16469 ) ) ( not ( = ?auto_16466 ?auto_16467 ) ) ( not ( = ?auto_16470 ?auto_16469 ) ) ( not ( = ?auto_16470 ?auto_16467 ) ) ( not ( = ?auto_16469 ?auto_16467 ) ) ( ON ?auto_16469 ?auto_16470 ) ( not ( = ?auto_16468 ?auto_16467 ) ) ( not ( = ?auto_16466 ?auto_16468 ) ) ( not ( = ?auto_16470 ?auto_16468 ) ) ( not ( = ?auto_16469 ?auto_16468 ) ) ( ON ?auto_16468 ?auto_16471 ) ( CLEAR ?auto_16468 ) ( not ( = ?auto_16466 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16471 ) ) ( not ( = ?auto_16467 ?auto_16471 ) ) ( not ( = ?auto_16468 ?auto_16471 ) ) ( HOLDING ?auto_16467 ) ( CLEAR ?auto_16469 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16466 ?auto_16470 ?auto_16469 ?auto_16467 )
      ( MAKE-1PILE ?auto_16466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16500 - BLOCK
      ?auto_16501 - BLOCK
      ?auto_16502 - BLOCK
      ?auto_16503 - BLOCK
    )
    :vars
    (
      ?auto_16504 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16500 ) ( ON ?auto_16501 ?auto_16500 ) ( not ( = ?auto_16500 ?auto_16501 ) ) ( not ( = ?auto_16500 ?auto_16502 ) ) ( not ( = ?auto_16500 ?auto_16503 ) ) ( not ( = ?auto_16501 ?auto_16502 ) ) ( not ( = ?auto_16501 ?auto_16503 ) ) ( not ( = ?auto_16502 ?auto_16503 ) ) ( ON ?auto_16503 ?auto_16504 ) ( not ( = ?auto_16500 ?auto_16504 ) ) ( not ( = ?auto_16501 ?auto_16504 ) ) ( not ( = ?auto_16502 ?auto_16504 ) ) ( not ( = ?auto_16503 ?auto_16504 ) ) ( CLEAR ?auto_16501 ) ( ON ?auto_16502 ?auto_16503 ) ( CLEAR ?auto_16502 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16504 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16504 ?auto_16503 )
      ( MAKE-4PILE ?auto_16500 ?auto_16501 ?auto_16502 ?auto_16503 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16505 - BLOCK
      ?auto_16506 - BLOCK
      ?auto_16507 - BLOCK
      ?auto_16508 - BLOCK
    )
    :vars
    (
      ?auto_16509 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16505 ) ( not ( = ?auto_16505 ?auto_16506 ) ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( not ( = ?auto_16505 ?auto_16508 ) ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16508 ) ) ( not ( = ?auto_16507 ?auto_16508 ) ) ( ON ?auto_16508 ?auto_16509 ) ( not ( = ?auto_16505 ?auto_16509 ) ) ( not ( = ?auto_16506 ?auto_16509 ) ) ( not ( = ?auto_16507 ?auto_16509 ) ) ( not ( = ?auto_16508 ?auto_16509 ) ) ( ON ?auto_16507 ?auto_16508 ) ( CLEAR ?auto_16507 ) ( ON-TABLE ?auto_16509 ) ( HOLDING ?auto_16506 ) ( CLEAR ?auto_16505 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16505 ?auto_16506 )
      ( MAKE-4PILE ?auto_16505 ?auto_16506 ?auto_16507 ?auto_16508 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16510 - BLOCK
      ?auto_16511 - BLOCK
      ?auto_16512 - BLOCK
      ?auto_16513 - BLOCK
    )
    :vars
    (
      ?auto_16514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16510 ) ( not ( = ?auto_16510 ?auto_16511 ) ) ( not ( = ?auto_16510 ?auto_16512 ) ) ( not ( = ?auto_16510 ?auto_16513 ) ) ( not ( = ?auto_16511 ?auto_16512 ) ) ( not ( = ?auto_16511 ?auto_16513 ) ) ( not ( = ?auto_16512 ?auto_16513 ) ) ( ON ?auto_16513 ?auto_16514 ) ( not ( = ?auto_16510 ?auto_16514 ) ) ( not ( = ?auto_16511 ?auto_16514 ) ) ( not ( = ?auto_16512 ?auto_16514 ) ) ( not ( = ?auto_16513 ?auto_16514 ) ) ( ON ?auto_16512 ?auto_16513 ) ( ON-TABLE ?auto_16514 ) ( CLEAR ?auto_16510 ) ( ON ?auto_16511 ?auto_16512 ) ( CLEAR ?auto_16511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16514 ?auto_16513 ?auto_16512 )
      ( MAKE-4PILE ?auto_16510 ?auto_16511 ?auto_16512 ?auto_16513 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16515 - BLOCK
      ?auto_16516 - BLOCK
      ?auto_16517 - BLOCK
      ?auto_16518 - BLOCK
    )
    :vars
    (
      ?auto_16519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16515 ?auto_16516 ) ) ( not ( = ?auto_16515 ?auto_16517 ) ) ( not ( = ?auto_16515 ?auto_16518 ) ) ( not ( = ?auto_16516 ?auto_16517 ) ) ( not ( = ?auto_16516 ?auto_16518 ) ) ( not ( = ?auto_16517 ?auto_16518 ) ) ( ON ?auto_16518 ?auto_16519 ) ( not ( = ?auto_16515 ?auto_16519 ) ) ( not ( = ?auto_16516 ?auto_16519 ) ) ( not ( = ?auto_16517 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( ON ?auto_16517 ?auto_16518 ) ( ON-TABLE ?auto_16519 ) ( ON ?auto_16516 ?auto_16517 ) ( CLEAR ?auto_16516 ) ( HOLDING ?auto_16515 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16515 )
      ( MAKE-4PILE ?auto_16515 ?auto_16516 ?auto_16517 ?auto_16518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16520 - BLOCK
      ?auto_16521 - BLOCK
      ?auto_16522 - BLOCK
      ?auto_16523 - BLOCK
    )
    :vars
    (
      ?auto_16524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( not ( = ?auto_16520 ?auto_16523 ) ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16523 ) ) ( not ( = ?auto_16522 ?auto_16523 ) ) ( ON ?auto_16523 ?auto_16524 ) ( not ( = ?auto_16520 ?auto_16524 ) ) ( not ( = ?auto_16521 ?auto_16524 ) ) ( not ( = ?auto_16522 ?auto_16524 ) ) ( not ( = ?auto_16523 ?auto_16524 ) ) ( ON ?auto_16522 ?auto_16523 ) ( ON-TABLE ?auto_16524 ) ( ON ?auto_16521 ?auto_16522 ) ( ON ?auto_16520 ?auto_16521 ) ( CLEAR ?auto_16520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16524 ?auto_16523 ?auto_16522 ?auto_16521 )
      ( MAKE-4PILE ?auto_16520 ?auto_16521 ?auto_16522 ?auto_16523 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16529 - BLOCK
      ?auto_16530 - BLOCK
      ?auto_16531 - BLOCK
      ?auto_16532 - BLOCK
    )
    :vars
    (
      ?auto_16533 - BLOCK
      ?auto_16534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16529 ?auto_16531 ) ) ( not ( = ?auto_16529 ?auto_16532 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16532 ) ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( ON ?auto_16532 ?auto_16533 ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( not ( = ?auto_16530 ?auto_16533 ) ) ( not ( = ?auto_16531 ?auto_16533 ) ) ( not ( = ?auto_16532 ?auto_16533 ) ) ( ON ?auto_16531 ?auto_16532 ) ( ON-TABLE ?auto_16533 ) ( ON ?auto_16530 ?auto_16531 ) ( CLEAR ?auto_16530 ) ( ON ?auto_16529 ?auto_16534 ) ( CLEAR ?auto_16529 ) ( HAND-EMPTY ) ( not ( = ?auto_16529 ?auto_16534 ) ) ( not ( = ?auto_16530 ?auto_16534 ) ) ( not ( = ?auto_16531 ?auto_16534 ) ) ( not ( = ?auto_16532 ?auto_16534 ) ) ( not ( = ?auto_16533 ?auto_16534 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16529 ?auto_16534 )
      ( MAKE-4PILE ?auto_16529 ?auto_16530 ?auto_16531 ?auto_16532 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16535 - BLOCK
      ?auto_16536 - BLOCK
      ?auto_16537 - BLOCK
      ?auto_16538 - BLOCK
    )
    :vars
    (
      ?auto_16539 - BLOCK
      ?auto_16540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16535 ?auto_16536 ) ) ( not ( = ?auto_16535 ?auto_16537 ) ) ( not ( = ?auto_16535 ?auto_16538 ) ) ( not ( = ?auto_16536 ?auto_16537 ) ) ( not ( = ?auto_16536 ?auto_16538 ) ) ( not ( = ?auto_16537 ?auto_16538 ) ) ( ON ?auto_16538 ?auto_16539 ) ( not ( = ?auto_16535 ?auto_16539 ) ) ( not ( = ?auto_16536 ?auto_16539 ) ) ( not ( = ?auto_16537 ?auto_16539 ) ) ( not ( = ?auto_16538 ?auto_16539 ) ) ( ON ?auto_16537 ?auto_16538 ) ( ON-TABLE ?auto_16539 ) ( ON ?auto_16535 ?auto_16540 ) ( CLEAR ?auto_16535 ) ( not ( = ?auto_16535 ?auto_16540 ) ) ( not ( = ?auto_16536 ?auto_16540 ) ) ( not ( = ?auto_16537 ?auto_16540 ) ) ( not ( = ?auto_16538 ?auto_16540 ) ) ( not ( = ?auto_16539 ?auto_16540 ) ) ( HOLDING ?auto_16536 ) ( CLEAR ?auto_16537 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16539 ?auto_16538 ?auto_16537 ?auto_16536 )
      ( MAKE-4PILE ?auto_16535 ?auto_16536 ?auto_16537 ?auto_16538 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16541 - BLOCK
      ?auto_16542 - BLOCK
      ?auto_16543 - BLOCK
      ?auto_16544 - BLOCK
    )
    :vars
    (
      ?auto_16546 - BLOCK
      ?auto_16545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16544 ) ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16544 ) ) ( not ( = ?auto_16543 ?auto_16544 ) ) ( ON ?auto_16544 ?auto_16546 ) ( not ( = ?auto_16541 ?auto_16546 ) ) ( not ( = ?auto_16542 ?auto_16546 ) ) ( not ( = ?auto_16543 ?auto_16546 ) ) ( not ( = ?auto_16544 ?auto_16546 ) ) ( ON ?auto_16543 ?auto_16544 ) ( ON-TABLE ?auto_16546 ) ( ON ?auto_16541 ?auto_16545 ) ( not ( = ?auto_16541 ?auto_16545 ) ) ( not ( = ?auto_16542 ?auto_16545 ) ) ( not ( = ?auto_16543 ?auto_16545 ) ) ( not ( = ?auto_16544 ?auto_16545 ) ) ( not ( = ?auto_16546 ?auto_16545 ) ) ( CLEAR ?auto_16543 ) ( ON ?auto_16542 ?auto_16541 ) ( CLEAR ?auto_16542 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16545 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16545 ?auto_16541 )
      ( MAKE-4PILE ?auto_16541 ?auto_16542 ?auto_16543 ?auto_16544 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16547 - BLOCK
      ?auto_16548 - BLOCK
      ?auto_16549 - BLOCK
      ?auto_16550 - BLOCK
    )
    :vars
    (
      ?auto_16552 - BLOCK
      ?auto_16551 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16547 ?auto_16548 ) ) ( not ( = ?auto_16547 ?auto_16549 ) ) ( not ( = ?auto_16547 ?auto_16550 ) ) ( not ( = ?auto_16548 ?auto_16549 ) ) ( not ( = ?auto_16548 ?auto_16550 ) ) ( not ( = ?auto_16549 ?auto_16550 ) ) ( ON ?auto_16550 ?auto_16552 ) ( not ( = ?auto_16547 ?auto_16552 ) ) ( not ( = ?auto_16548 ?auto_16552 ) ) ( not ( = ?auto_16549 ?auto_16552 ) ) ( not ( = ?auto_16550 ?auto_16552 ) ) ( ON-TABLE ?auto_16552 ) ( ON ?auto_16547 ?auto_16551 ) ( not ( = ?auto_16547 ?auto_16551 ) ) ( not ( = ?auto_16548 ?auto_16551 ) ) ( not ( = ?auto_16549 ?auto_16551 ) ) ( not ( = ?auto_16550 ?auto_16551 ) ) ( not ( = ?auto_16552 ?auto_16551 ) ) ( ON ?auto_16548 ?auto_16547 ) ( CLEAR ?auto_16548 ) ( ON-TABLE ?auto_16551 ) ( HOLDING ?auto_16549 ) ( CLEAR ?auto_16550 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16552 ?auto_16550 ?auto_16549 )
      ( MAKE-4PILE ?auto_16547 ?auto_16548 ?auto_16549 ?auto_16550 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16553 - BLOCK
      ?auto_16554 - BLOCK
      ?auto_16555 - BLOCK
      ?auto_16556 - BLOCK
    )
    :vars
    (
      ?auto_16557 - BLOCK
      ?auto_16558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16553 ?auto_16554 ) ) ( not ( = ?auto_16553 ?auto_16555 ) ) ( not ( = ?auto_16553 ?auto_16556 ) ) ( not ( = ?auto_16554 ?auto_16555 ) ) ( not ( = ?auto_16554 ?auto_16556 ) ) ( not ( = ?auto_16555 ?auto_16556 ) ) ( ON ?auto_16556 ?auto_16557 ) ( not ( = ?auto_16553 ?auto_16557 ) ) ( not ( = ?auto_16554 ?auto_16557 ) ) ( not ( = ?auto_16555 ?auto_16557 ) ) ( not ( = ?auto_16556 ?auto_16557 ) ) ( ON-TABLE ?auto_16557 ) ( ON ?auto_16553 ?auto_16558 ) ( not ( = ?auto_16553 ?auto_16558 ) ) ( not ( = ?auto_16554 ?auto_16558 ) ) ( not ( = ?auto_16555 ?auto_16558 ) ) ( not ( = ?auto_16556 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( ON ?auto_16554 ?auto_16553 ) ( ON-TABLE ?auto_16558 ) ( CLEAR ?auto_16556 ) ( ON ?auto_16555 ?auto_16554 ) ( CLEAR ?auto_16555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16558 ?auto_16553 ?auto_16554 )
      ( MAKE-4PILE ?auto_16553 ?auto_16554 ?auto_16555 ?auto_16556 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16559 - BLOCK
      ?auto_16560 - BLOCK
      ?auto_16561 - BLOCK
      ?auto_16562 - BLOCK
    )
    :vars
    (
      ?auto_16563 - BLOCK
      ?auto_16564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16559 ?auto_16560 ) ) ( not ( = ?auto_16559 ?auto_16561 ) ) ( not ( = ?auto_16559 ?auto_16562 ) ) ( not ( = ?auto_16560 ?auto_16561 ) ) ( not ( = ?auto_16560 ?auto_16562 ) ) ( not ( = ?auto_16561 ?auto_16562 ) ) ( not ( = ?auto_16559 ?auto_16563 ) ) ( not ( = ?auto_16560 ?auto_16563 ) ) ( not ( = ?auto_16561 ?auto_16563 ) ) ( not ( = ?auto_16562 ?auto_16563 ) ) ( ON-TABLE ?auto_16563 ) ( ON ?auto_16559 ?auto_16564 ) ( not ( = ?auto_16559 ?auto_16564 ) ) ( not ( = ?auto_16560 ?auto_16564 ) ) ( not ( = ?auto_16561 ?auto_16564 ) ) ( not ( = ?auto_16562 ?auto_16564 ) ) ( not ( = ?auto_16563 ?auto_16564 ) ) ( ON ?auto_16560 ?auto_16559 ) ( ON-TABLE ?auto_16564 ) ( ON ?auto_16561 ?auto_16560 ) ( CLEAR ?auto_16561 ) ( HOLDING ?auto_16562 ) ( CLEAR ?auto_16563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16563 ?auto_16562 )
      ( MAKE-4PILE ?auto_16559 ?auto_16560 ?auto_16561 ?auto_16562 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16565 - BLOCK
      ?auto_16566 - BLOCK
      ?auto_16567 - BLOCK
      ?auto_16568 - BLOCK
    )
    :vars
    (
      ?auto_16569 - BLOCK
      ?auto_16570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16565 ?auto_16566 ) ) ( not ( = ?auto_16565 ?auto_16567 ) ) ( not ( = ?auto_16565 ?auto_16568 ) ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( not ( = ?auto_16566 ?auto_16568 ) ) ( not ( = ?auto_16567 ?auto_16568 ) ) ( not ( = ?auto_16565 ?auto_16569 ) ) ( not ( = ?auto_16566 ?auto_16569 ) ) ( not ( = ?auto_16567 ?auto_16569 ) ) ( not ( = ?auto_16568 ?auto_16569 ) ) ( ON-TABLE ?auto_16569 ) ( ON ?auto_16565 ?auto_16570 ) ( not ( = ?auto_16565 ?auto_16570 ) ) ( not ( = ?auto_16566 ?auto_16570 ) ) ( not ( = ?auto_16567 ?auto_16570 ) ) ( not ( = ?auto_16568 ?auto_16570 ) ) ( not ( = ?auto_16569 ?auto_16570 ) ) ( ON ?auto_16566 ?auto_16565 ) ( ON-TABLE ?auto_16570 ) ( ON ?auto_16567 ?auto_16566 ) ( CLEAR ?auto_16569 ) ( ON ?auto_16568 ?auto_16567 ) ( CLEAR ?auto_16568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16570 ?auto_16565 ?auto_16566 ?auto_16567 )
      ( MAKE-4PILE ?auto_16565 ?auto_16566 ?auto_16567 ?auto_16568 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16571 - BLOCK
      ?auto_16572 - BLOCK
      ?auto_16573 - BLOCK
      ?auto_16574 - BLOCK
    )
    :vars
    (
      ?auto_16575 - BLOCK
      ?auto_16576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16571 ?auto_16572 ) ) ( not ( = ?auto_16571 ?auto_16573 ) ) ( not ( = ?auto_16571 ?auto_16574 ) ) ( not ( = ?auto_16572 ?auto_16573 ) ) ( not ( = ?auto_16572 ?auto_16574 ) ) ( not ( = ?auto_16573 ?auto_16574 ) ) ( not ( = ?auto_16571 ?auto_16575 ) ) ( not ( = ?auto_16572 ?auto_16575 ) ) ( not ( = ?auto_16573 ?auto_16575 ) ) ( not ( = ?auto_16574 ?auto_16575 ) ) ( ON ?auto_16571 ?auto_16576 ) ( not ( = ?auto_16571 ?auto_16576 ) ) ( not ( = ?auto_16572 ?auto_16576 ) ) ( not ( = ?auto_16573 ?auto_16576 ) ) ( not ( = ?auto_16574 ?auto_16576 ) ) ( not ( = ?auto_16575 ?auto_16576 ) ) ( ON ?auto_16572 ?auto_16571 ) ( ON-TABLE ?auto_16576 ) ( ON ?auto_16573 ?auto_16572 ) ( ON ?auto_16574 ?auto_16573 ) ( CLEAR ?auto_16574 ) ( HOLDING ?auto_16575 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16575 )
      ( MAKE-4PILE ?auto_16571 ?auto_16572 ?auto_16573 ?auto_16574 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16577 - BLOCK
      ?auto_16578 - BLOCK
      ?auto_16579 - BLOCK
      ?auto_16580 - BLOCK
    )
    :vars
    (
      ?auto_16581 - BLOCK
      ?auto_16582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16577 ?auto_16578 ) ) ( not ( = ?auto_16577 ?auto_16579 ) ) ( not ( = ?auto_16577 ?auto_16580 ) ) ( not ( = ?auto_16578 ?auto_16579 ) ) ( not ( = ?auto_16578 ?auto_16580 ) ) ( not ( = ?auto_16579 ?auto_16580 ) ) ( not ( = ?auto_16577 ?auto_16581 ) ) ( not ( = ?auto_16578 ?auto_16581 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( not ( = ?auto_16580 ?auto_16581 ) ) ( ON ?auto_16577 ?auto_16582 ) ( not ( = ?auto_16577 ?auto_16582 ) ) ( not ( = ?auto_16578 ?auto_16582 ) ) ( not ( = ?auto_16579 ?auto_16582 ) ) ( not ( = ?auto_16580 ?auto_16582 ) ) ( not ( = ?auto_16581 ?auto_16582 ) ) ( ON ?auto_16578 ?auto_16577 ) ( ON-TABLE ?auto_16582 ) ( ON ?auto_16579 ?auto_16578 ) ( ON ?auto_16580 ?auto_16579 ) ( ON ?auto_16581 ?auto_16580 ) ( CLEAR ?auto_16581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16582 ?auto_16577 ?auto_16578 ?auto_16579 ?auto_16580 )
      ( MAKE-4PILE ?auto_16577 ?auto_16578 ?auto_16579 ?auto_16580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16593 - BLOCK
      ?auto_16594 - BLOCK
      ?auto_16595 - BLOCK
      ?auto_16596 - BLOCK
      ?auto_16597 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16596 ) ( ON-TABLE ?auto_16593 ) ( ON ?auto_16594 ?auto_16593 ) ( ON ?auto_16595 ?auto_16594 ) ( ON ?auto_16596 ?auto_16595 ) ( not ( = ?auto_16593 ?auto_16594 ) ) ( not ( = ?auto_16593 ?auto_16595 ) ) ( not ( = ?auto_16593 ?auto_16596 ) ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( not ( = ?auto_16594 ?auto_16595 ) ) ( not ( = ?auto_16594 ?auto_16596 ) ) ( not ( = ?auto_16594 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( ON-TABLE ?auto_16597 ) ( CLEAR ?auto_16597 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_16597 )
      ( MAKE-5PILE ?auto_16593 ?auto_16594 ?auto_16595 ?auto_16596 ?auto_16597 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16598 - BLOCK
      ?auto_16599 - BLOCK
      ?auto_16600 - BLOCK
      ?auto_16601 - BLOCK
      ?auto_16602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16598 ) ( ON ?auto_16599 ?auto_16598 ) ( ON ?auto_16600 ?auto_16599 ) ( not ( = ?auto_16598 ?auto_16599 ) ) ( not ( = ?auto_16598 ?auto_16600 ) ) ( not ( = ?auto_16598 ?auto_16601 ) ) ( not ( = ?auto_16598 ?auto_16602 ) ) ( not ( = ?auto_16599 ?auto_16600 ) ) ( not ( = ?auto_16599 ?auto_16601 ) ) ( not ( = ?auto_16599 ?auto_16602 ) ) ( not ( = ?auto_16600 ?auto_16601 ) ) ( not ( = ?auto_16600 ?auto_16602 ) ) ( not ( = ?auto_16601 ?auto_16602 ) ) ( ON-TABLE ?auto_16602 ) ( CLEAR ?auto_16602 ) ( HOLDING ?auto_16601 ) ( CLEAR ?auto_16600 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16598 ?auto_16599 ?auto_16600 ?auto_16601 )
      ( MAKE-5PILE ?auto_16598 ?auto_16599 ?auto_16600 ?auto_16601 ?auto_16602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16603 - BLOCK
      ?auto_16604 - BLOCK
      ?auto_16605 - BLOCK
      ?auto_16606 - BLOCK
      ?auto_16607 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16603 ) ( ON ?auto_16604 ?auto_16603 ) ( ON ?auto_16605 ?auto_16604 ) ( not ( = ?auto_16603 ?auto_16604 ) ) ( not ( = ?auto_16603 ?auto_16605 ) ) ( not ( = ?auto_16603 ?auto_16606 ) ) ( not ( = ?auto_16603 ?auto_16607 ) ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( not ( = ?auto_16604 ?auto_16607 ) ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16607 ) ) ( not ( = ?auto_16606 ?auto_16607 ) ) ( ON-TABLE ?auto_16607 ) ( CLEAR ?auto_16605 ) ( ON ?auto_16606 ?auto_16607 ) ( CLEAR ?auto_16606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16607 )
      ( MAKE-5PILE ?auto_16603 ?auto_16604 ?auto_16605 ?auto_16606 ?auto_16607 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16608 - BLOCK
      ?auto_16609 - BLOCK
      ?auto_16610 - BLOCK
      ?auto_16611 - BLOCK
      ?auto_16612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16608 ) ( ON ?auto_16609 ?auto_16608 ) ( not ( = ?auto_16608 ?auto_16609 ) ) ( not ( = ?auto_16608 ?auto_16610 ) ) ( not ( = ?auto_16608 ?auto_16611 ) ) ( not ( = ?auto_16608 ?auto_16612 ) ) ( not ( = ?auto_16609 ?auto_16610 ) ) ( not ( = ?auto_16609 ?auto_16611 ) ) ( not ( = ?auto_16609 ?auto_16612 ) ) ( not ( = ?auto_16610 ?auto_16611 ) ) ( not ( = ?auto_16610 ?auto_16612 ) ) ( not ( = ?auto_16611 ?auto_16612 ) ) ( ON-TABLE ?auto_16612 ) ( ON ?auto_16611 ?auto_16612 ) ( CLEAR ?auto_16611 ) ( HOLDING ?auto_16610 ) ( CLEAR ?auto_16609 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16608 ?auto_16609 ?auto_16610 )
      ( MAKE-5PILE ?auto_16608 ?auto_16609 ?auto_16610 ?auto_16611 ?auto_16612 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16613 - BLOCK
      ?auto_16614 - BLOCK
      ?auto_16615 - BLOCK
      ?auto_16616 - BLOCK
      ?auto_16617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16613 ) ( ON ?auto_16614 ?auto_16613 ) ( not ( = ?auto_16613 ?auto_16614 ) ) ( not ( = ?auto_16613 ?auto_16615 ) ) ( not ( = ?auto_16613 ?auto_16616 ) ) ( not ( = ?auto_16613 ?auto_16617 ) ) ( not ( = ?auto_16614 ?auto_16615 ) ) ( not ( = ?auto_16614 ?auto_16616 ) ) ( not ( = ?auto_16614 ?auto_16617 ) ) ( not ( = ?auto_16615 ?auto_16616 ) ) ( not ( = ?auto_16615 ?auto_16617 ) ) ( not ( = ?auto_16616 ?auto_16617 ) ) ( ON-TABLE ?auto_16617 ) ( ON ?auto_16616 ?auto_16617 ) ( CLEAR ?auto_16614 ) ( ON ?auto_16615 ?auto_16616 ) ( CLEAR ?auto_16615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16617 ?auto_16616 )
      ( MAKE-5PILE ?auto_16613 ?auto_16614 ?auto_16615 ?auto_16616 ?auto_16617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16618 - BLOCK
      ?auto_16619 - BLOCK
      ?auto_16620 - BLOCK
      ?auto_16621 - BLOCK
      ?auto_16622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16618 ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( not ( = ?auto_16618 ?auto_16621 ) ) ( not ( = ?auto_16618 ?auto_16622 ) ) ( not ( = ?auto_16619 ?auto_16620 ) ) ( not ( = ?auto_16619 ?auto_16621 ) ) ( not ( = ?auto_16619 ?auto_16622 ) ) ( not ( = ?auto_16620 ?auto_16621 ) ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( ON-TABLE ?auto_16622 ) ( ON ?auto_16621 ?auto_16622 ) ( ON ?auto_16620 ?auto_16621 ) ( CLEAR ?auto_16620 ) ( HOLDING ?auto_16619 ) ( CLEAR ?auto_16618 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16618 ?auto_16619 )
      ( MAKE-5PILE ?auto_16618 ?auto_16619 ?auto_16620 ?auto_16621 ?auto_16622 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16623 - BLOCK
      ?auto_16624 - BLOCK
      ?auto_16625 - BLOCK
      ?auto_16626 - BLOCK
      ?auto_16627 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16623 ) ( not ( = ?auto_16623 ?auto_16624 ) ) ( not ( = ?auto_16623 ?auto_16625 ) ) ( not ( = ?auto_16623 ?auto_16626 ) ) ( not ( = ?auto_16623 ?auto_16627 ) ) ( not ( = ?auto_16624 ?auto_16625 ) ) ( not ( = ?auto_16624 ?auto_16626 ) ) ( not ( = ?auto_16624 ?auto_16627 ) ) ( not ( = ?auto_16625 ?auto_16626 ) ) ( not ( = ?auto_16625 ?auto_16627 ) ) ( not ( = ?auto_16626 ?auto_16627 ) ) ( ON-TABLE ?auto_16627 ) ( ON ?auto_16626 ?auto_16627 ) ( ON ?auto_16625 ?auto_16626 ) ( CLEAR ?auto_16623 ) ( ON ?auto_16624 ?auto_16625 ) ( CLEAR ?auto_16624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16627 ?auto_16626 ?auto_16625 )
      ( MAKE-5PILE ?auto_16623 ?auto_16624 ?auto_16625 ?auto_16626 ?auto_16627 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16628 - BLOCK
      ?auto_16629 - BLOCK
      ?auto_16630 - BLOCK
      ?auto_16631 - BLOCK
      ?auto_16632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16628 ?auto_16629 ) ) ( not ( = ?auto_16628 ?auto_16630 ) ) ( not ( = ?auto_16628 ?auto_16631 ) ) ( not ( = ?auto_16628 ?auto_16632 ) ) ( not ( = ?auto_16629 ?auto_16630 ) ) ( not ( = ?auto_16629 ?auto_16631 ) ) ( not ( = ?auto_16629 ?auto_16632 ) ) ( not ( = ?auto_16630 ?auto_16631 ) ) ( not ( = ?auto_16630 ?auto_16632 ) ) ( not ( = ?auto_16631 ?auto_16632 ) ) ( ON-TABLE ?auto_16632 ) ( ON ?auto_16631 ?auto_16632 ) ( ON ?auto_16630 ?auto_16631 ) ( ON ?auto_16629 ?auto_16630 ) ( CLEAR ?auto_16629 ) ( HOLDING ?auto_16628 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16628 )
      ( MAKE-5PILE ?auto_16628 ?auto_16629 ?auto_16630 ?auto_16631 ?auto_16632 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16633 - BLOCK
      ?auto_16634 - BLOCK
      ?auto_16635 - BLOCK
      ?auto_16636 - BLOCK
      ?auto_16637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16633 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16635 ) ) ( not ( = ?auto_16633 ?auto_16636 ) ) ( not ( = ?auto_16633 ?auto_16637 ) ) ( not ( = ?auto_16634 ?auto_16635 ) ) ( not ( = ?auto_16634 ?auto_16636 ) ) ( not ( = ?auto_16634 ?auto_16637 ) ) ( not ( = ?auto_16635 ?auto_16636 ) ) ( not ( = ?auto_16635 ?auto_16637 ) ) ( not ( = ?auto_16636 ?auto_16637 ) ) ( ON-TABLE ?auto_16637 ) ( ON ?auto_16636 ?auto_16637 ) ( ON ?auto_16635 ?auto_16636 ) ( ON ?auto_16634 ?auto_16635 ) ( ON ?auto_16633 ?auto_16634 ) ( CLEAR ?auto_16633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16637 ?auto_16636 ?auto_16635 ?auto_16634 )
      ( MAKE-5PILE ?auto_16633 ?auto_16634 ?auto_16635 ?auto_16636 ?auto_16637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16643 - BLOCK
      ?auto_16644 - BLOCK
      ?auto_16645 - BLOCK
      ?auto_16646 - BLOCK
      ?auto_16647 - BLOCK
    )
    :vars
    (
      ?auto_16648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16643 ?auto_16644 ) ) ( not ( = ?auto_16643 ?auto_16645 ) ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16647 ) ) ( not ( = ?auto_16644 ?auto_16645 ) ) ( not ( = ?auto_16644 ?auto_16646 ) ) ( not ( = ?auto_16644 ?auto_16647 ) ) ( not ( = ?auto_16645 ?auto_16646 ) ) ( not ( = ?auto_16645 ?auto_16647 ) ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( ON-TABLE ?auto_16647 ) ( ON ?auto_16646 ?auto_16647 ) ( ON ?auto_16645 ?auto_16646 ) ( ON ?auto_16644 ?auto_16645 ) ( CLEAR ?auto_16644 ) ( ON ?auto_16643 ?auto_16648 ) ( CLEAR ?auto_16643 ) ( HAND-EMPTY ) ( not ( = ?auto_16643 ?auto_16648 ) ) ( not ( = ?auto_16644 ?auto_16648 ) ) ( not ( = ?auto_16645 ?auto_16648 ) ) ( not ( = ?auto_16646 ?auto_16648 ) ) ( not ( = ?auto_16647 ?auto_16648 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16643 ?auto_16648 )
      ( MAKE-5PILE ?auto_16643 ?auto_16644 ?auto_16645 ?auto_16646 ?auto_16647 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16649 - BLOCK
      ?auto_16650 - BLOCK
      ?auto_16651 - BLOCK
      ?auto_16652 - BLOCK
      ?auto_16653 - BLOCK
    )
    :vars
    (
      ?auto_16654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16649 ?auto_16650 ) ) ( not ( = ?auto_16649 ?auto_16651 ) ) ( not ( = ?auto_16649 ?auto_16652 ) ) ( not ( = ?auto_16649 ?auto_16653 ) ) ( not ( = ?auto_16650 ?auto_16651 ) ) ( not ( = ?auto_16650 ?auto_16652 ) ) ( not ( = ?auto_16650 ?auto_16653 ) ) ( not ( = ?auto_16651 ?auto_16652 ) ) ( not ( = ?auto_16651 ?auto_16653 ) ) ( not ( = ?auto_16652 ?auto_16653 ) ) ( ON-TABLE ?auto_16653 ) ( ON ?auto_16652 ?auto_16653 ) ( ON ?auto_16651 ?auto_16652 ) ( ON ?auto_16649 ?auto_16654 ) ( CLEAR ?auto_16649 ) ( not ( = ?auto_16649 ?auto_16654 ) ) ( not ( = ?auto_16650 ?auto_16654 ) ) ( not ( = ?auto_16651 ?auto_16654 ) ) ( not ( = ?auto_16652 ?auto_16654 ) ) ( not ( = ?auto_16653 ?auto_16654 ) ) ( HOLDING ?auto_16650 ) ( CLEAR ?auto_16651 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16653 ?auto_16652 ?auto_16651 ?auto_16650 )
      ( MAKE-5PILE ?auto_16649 ?auto_16650 ?auto_16651 ?auto_16652 ?auto_16653 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16655 - BLOCK
      ?auto_16656 - BLOCK
      ?auto_16657 - BLOCK
      ?auto_16658 - BLOCK
      ?auto_16659 - BLOCK
    )
    :vars
    (
      ?auto_16660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16655 ?auto_16656 ) ) ( not ( = ?auto_16655 ?auto_16657 ) ) ( not ( = ?auto_16655 ?auto_16658 ) ) ( not ( = ?auto_16655 ?auto_16659 ) ) ( not ( = ?auto_16656 ?auto_16657 ) ) ( not ( = ?auto_16656 ?auto_16658 ) ) ( not ( = ?auto_16656 ?auto_16659 ) ) ( not ( = ?auto_16657 ?auto_16658 ) ) ( not ( = ?auto_16657 ?auto_16659 ) ) ( not ( = ?auto_16658 ?auto_16659 ) ) ( ON-TABLE ?auto_16659 ) ( ON ?auto_16658 ?auto_16659 ) ( ON ?auto_16657 ?auto_16658 ) ( ON ?auto_16655 ?auto_16660 ) ( not ( = ?auto_16655 ?auto_16660 ) ) ( not ( = ?auto_16656 ?auto_16660 ) ) ( not ( = ?auto_16657 ?auto_16660 ) ) ( not ( = ?auto_16658 ?auto_16660 ) ) ( not ( = ?auto_16659 ?auto_16660 ) ) ( CLEAR ?auto_16657 ) ( ON ?auto_16656 ?auto_16655 ) ( CLEAR ?auto_16656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16660 ?auto_16655 )
      ( MAKE-5PILE ?auto_16655 ?auto_16656 ?auto_16657 ?auto_16658 ?auto_16659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16661 - BLOCK
      ?auto_16662 - BLOCK
      ?auto_16663 - BLOCK
      ?auto_16664 - BLOCK
      ?auto_16665 - BLOCK
    )
    :vars
    (
      ?auto_16666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16661 ?auto_16662 ) ) ( not ( = ?auto_16661 ?auto_16663 ) ) ( not ( = ?auto_16661 ?auto_16664 ) ) ( not ( = ?auto_16661 ?auto_16665 ) ) ( not ( = ?auto_16662 ?auto_16663 ) ) ( not ( = ?auto_16662 ?auto_16664 ) ) ( not ( = ?auto_16662 ?auto_16665 ) ) ( not ( = ?auto_16663 ?auto_16664 ) ) ( not ( = ?auto_16663 ?auto_16665 ) ) ( not ( = ?auto_16664 ?auto_16665 ) ) ( ON-TABLE ?auto_16665 ) ( ON ?auto_16664 ?auto_16665 ) ( ON ?auto_16661 ?auto_16666 ) ( not ( = ?auto_16661 ?auto_16666 ) ) ( not ( = ?auto_16662 ?auto_16666 ) ) ( not ( = ?auto_16663 ?auto_16666 ) ) ( not ( = ?auto_16664 ?auto_16666 ) ) ( not ( = ?auto_16665 ?auto_16666 ) ) ( ON ?auto_16662 ?auto_16661 ) ( CLEAR ?auto_16662 ) ( ON-TABLE ?auto_16666 ) ( HOLDING ?auto_16663 ) ( CLEAR ?auto_16664 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16665 ?auto_16664 ?auto_16663 )
      ( MAKE-5PILE ?auto_16661 ?auto_16662 ?auto_16663 ?auto_16664 ?auto_16665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16667 - BLOCK
      ?auto_16668 - BLOCK
      ?auto_16669 - BLOCK
      ?auto_16670 - BLOCK
      ?auto_16671 - BLOCK
    )
    :vars
    (
      ?auto_16672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16667 ?auto_16668 ) ) ( not ( = ?auto_16667 ?auto_16669 ) ) ( not ( = ?auto_16667 ?auto_16670 ) ) ( not ( = ?auto_16667 ?auto_16671 ) ) ( not ( = ?auto_16668 ?auto_16669 ) ) ( not ( = ?auto_16668 ?auto_16670 ) ) ( not ( = ?auto_16668 ?auto_16671 ) ) ( not ( = ?auto_16669 ?auto_16670 ) ) ( not ( = ?auto_16669 ?auto_16671 ) ) ( not ( = ?auto_16670 ?auto_16671 ) ) ( ON-TABLE ?auto_16671 ) ( ON ?auto_16670 ?auto_16671 ) ( ON ?auto_16667 ?auto_16672 ) ( not ( = ?auto_16667 ?auto_16672 ) ) ( not ( = ?auto_16668 ?auto_16672 ) ) ( not ( = ?auto_16669 ?auto_16672 ) ) ( not ( = ?auto_16670 ?auto_16672 ) ) ( not ( = ?auto_16671 ?auto_16672 ) ) ( ON ?auto_16668 ?auto_16667 ) ( ON-TABLE ?auto_16672 ) ( CLEAR ?auto_16670 ) ( ON ?auto_16669 ?auto_16668 ) ( CLEAR ?auto_16669 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16672 ?auto_16667 ?auto_16668 )
      ( MAKE-5PILE ?auto_16667 ?auto_16668 ?auto_16669 ?auto_16670 ?auto_16671 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16673 - BLOCK
      ?auto_16674 - BLOCK
      ?auto_16675 - BLOCK
      ?auto_16676 - BLOCK
      ?auto_16677 - BLOCK
    )
    :vars
    (
      ?auto_16678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16673 ?auto_16674 ) ) ( not ( = ?auto_16673 ?auto_16675 ) ) ( not ( = ?auto_16673 ?auto_16676 ) ) ( not ( = ?auto_16673 ?auto_16677 ) ) ( not ( = ?auto_16674 ?auto_16675 ) ) ( not ( = ?auto_16674 ?auto_16676 ) ) ( not ( = ?auto_16674 ?auto_16677 ) ) ( not ( = ?auto_16675 ?auto_16676 ) ) ( not ( = ?auto_16675 ?auto_16677 ) ) ( not ( = ?auto_16676 ?auto_16677 ) ) ( ON-TABLE ?auto_16677 ) ( ON ?auto_16673 ?auto_16678 ) ( not ( = ?auto_16673 ?auto_16678 ) ) ( not ( = ?auto_16674 ?auto_16678 ) ) ( not ( = ?auto_16675 ?auto_16678 ) ) ( not ( = ?auto_16676 ?auto_16678 ) ) ( not ( = ?auto_16677 ?auto_16678 ) ) ( ON ?auto_16674 ?auto_16673 ) ( ON-TABLE ?auto_16678 ) ( ON ?auto_16675 ?auto_16674 ) ( CLEAR ?auto_16675 ) ( HOLDING ?auto_16676 ) ( CLEAR ?auto_16677 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16677 ?auto_16676 )
      ( MAKE-5PILE ?auto_16673 ?auto_16674 ?auto_16675 ?auto_16676 ?auto_16677 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16679 - BLOCK
      ?auto_16680 - BLOCK
      ?auto_16681 - BLOCK
      ?auto_16682 - BLOCK
      ?auto_16683 - BLOCK
    )
    :vars
    (
      ?auto_16684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16679 ?auto_16680 ) ) ( not ( = ?auto_16679 ?auto_16681 ) ) ( not ( = ?auto_16679 ?auto_16682 ) ) ( not ( = ?auto_16679 ?auto_16683 ) ) ( not ( = ?auto_16680 ?auto_16681 ) ) ( not ( = ?auto_16680 ?auto_16682 ) ) ( not ( = ?auto_16680 ?auto_16683 ) ) ( not ( = ?auto_16681 ?auto_16682 ) ) ( not ( = ?auto_16681 ?auto_16683 ) ) ( not ( = ?auto_16682 ?auto_16683 ) ) ( ON-TABLE ?auto_16683 ) ( ON ?auto_16679 ?auto_16684 ) ( not ( = ?auto_16679 ?auto_16684 ) ) ( not ( = ?auto_16680 ?auto_16684 ) ) ( not ( = ?auto_16681 ?auto_16684 ) ) ( not ( = ?auto_16682 ?auto_16684 ) ) ( not ( = ?auto_16683 ?auto_16684 ) ) ( ON ?auto_16680 ?auto_16679 ) ( ON-TABLE ?auto_16684 ) ( ON ?auto_16681 ?auto_16680 ) ( CLEAR ?auto_16683 ) ( ON ?auto_16682 ?auto_16681 ) ( CLEAR ?auto_16682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16684 ?auto_16679 ?auto_16680 ?auto_16681 )
      ( MAKE-5PILE ?auto_16679 ?auto_16680 ?auto_16681 ?auto_16682 ?auto_16683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16685 - BLOCK
      ?auto_16686 - BLOCK
      ?auto_16687 - BLOCK
      ?auto_16688 - BLOCK
      ?auto_16689 - BLOCK
    )
    :vars
    (
      ?auto_16690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16685 ?auto_16686 ) ) ( not ( = ?auto_16685 ?auto_16687 ) ) ( not ( = ?auto_16685 ?auto_16688 ) ) ( not ( = ?auto_16685 ?auto_16689 ) ) ( not ( = ?auto_16686 ?auto_16687 ) ) ( not ( = ?auto_16686 ?auto_16688 ) ) ( not ( = ?auto_16686 ?auto_16689 ) ) ( not ( = ?auto_16687 ?auto_16688 ) ) ( not ( = ?auto_16687 ?auto_16689 ) ) ( not ( = ?auto_16688 ?auto_16689 ) ) ( ON ?auto_16685 ?auto_16690 ) ( not ( = ?auto_16685 ?auto_16690 ) ) ( not ( = ?auto_16686 ?auto_16690 ) ) ( not ( = ?auto_16687 ?auto_16690 ) ) ( not ( = ?auto_16688 ?auto_16690 ) ) ( not ( = ?auto_16689 ?auto_16690 ) ) ( ON ?auto_16686 ?auto_16685 ) ( ON-TABLE ?auto_16690 ) ( ON ?auto_16687 ?auto_16686 ) ( ON ?auto_16688 ?auto_16687 ) ( CLEAR ?auto_16688 ) ( HOLDING ?auto_16689 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16689 )
      ( MAKE-5PILE ?auto_16685 ?auto_16686 ?auto_16687 ?auto_16688 ?auto_16689 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16691 - BLOCK
      ?auto_16692 - BLOCK
      ?auto_16693 - BLOCK
      ?auto_16694 - BLOCK
      ?auto_16695 - BLOCK
    )
    :vars
    (
      ?auto_16696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16691 ?auto_16692 ) ) ( not ( = ?auto_16691 ?auto_16693 ) ) ( not ( = ?auto_16691 ?auto_16694 ) ) ( not ( = ?auto_16691 ?auto_16695 ) ) ( not ( = ?auto_16692 ?auto_16693 ) ) ( not ( = ?auto_16692 ?auto_16694 ) ) ( not ( = ?auto_16692 ?auto_16695 ) ) ( not ( = ?auto_16693 ?auto_16694 ) ) ( not ( = ?auto_16693 ?auto_16695 ) ) ( not ( = ?auto_16694 ?auto_16695 ) ) ( ON ?auto_16691 ?auto_16696 ) ( not ( = ?auto_16691 ?auto_16696 ) ) ( not ( = ?auto_16692 ?auto_16696 ) ) ( not ( = ?auto_16693 ?auto_16696 ) ) ( not ( = ?auto_16694 ?auto_16696 ) ) ( not ( = ?auto_16695 ?auto_16696 ) ) ( ON ?auto_16692 ?auto_16691 ) ( ON-TABLE ?auto_16696 ) ( ON ?auto_16693 ?auto_16692 ) ( ON ?auto_16694 ?auto_16693 ) ( ON ?auto_16695 ?auto_16694 ) ( CLEAR ?auto_16695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16696 ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 )
      ( MAKE-5PILE ?auto_16691 ?auto_16692 ?auto_16693 ?auto_16694 ?auto_16695 ) )
  )

)

