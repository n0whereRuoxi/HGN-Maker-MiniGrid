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
      ?auto_101755 - BLOCK
      ?auto_101756 - BLOCK
      ?auto_101757 - BLOCK
      ?auto_101758 - BLOCK
      ?auto_101759 - BLOCK
      ?auto_101760 - BLOCK
      ?auto_101761 - BLOCK
    )
    :vars
    (
      ?auto_101762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101762 ?auto_101761 ) ( CLEAR ?auto_101762 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101755 ) ( ON ?auto_101756 ?auto_101755 ) ( ON ?auto_101757 ?auto_101756 ) ( ON ?auto_101758 ?auto_101757 ) ( ON ?auto_101759 ?auto_101758 ) ( ON ?auto_101760 ?auto_101759 ) ( ON ?auto_101761 ?auto_101760 ) ( not ( = ?auto_101755 ?auto_101756 ) ) ( not ( = ?auto_101755 ?auto_101757 ) ) ( not ( = ?auto_101755 ?auto_101758 ) ) ( not ( = ?auto_101755 ?auto_101759 ) ) ( not ( = ?auto_101755 ?auto_101760 ) ) ( not ( = ?auto_101755 ?auto_101761 ) ) ( not ( = ?auto_101755 ?auto_101762 ) ) ( not ( = ?auto_101756 ?auto_101757 ) ) ( not ( = ?auto_101756 ?auto_101758 ) ) ( not ( = ?auto_101756 ?auto_101759 ) ) ( not ( = ?auto_101756 ?auto_101760 ) ) ( not ( = ?auto_101756 ?auto_101761 ) ) ( not ( = ?auto_101756 ?auto_101762 ) ) ( not ( = ?auto_101757 ?auto_101758 ) ) ( not ( = ?auto_101757 ?auto_101759 ) ) ( not ( = ?auto_101757 ?auto_101760 ) ) ( not ( = ?auto_101757 ?auto_101761 ) ) ( not ( = ?auto_101757 ?auto_101762 ) ) ( not ( = ?auto_101758 ?auto_101759 ) ) ( not ( = ?auto_101758 ?auto_101760 ) ) ( not ( = ?auto_101758 ?auto_101761 ) ) ( not ( = ?auto_101758 ?auto_101762 ) ) ( not ( = ?auto_101759 ?auto_101760 ) ) ( not ( = ?auto_101759 ?auto_101761 ) ) ( not ( = ?auto_101759 ?auto_101762 ) ) ( not ( = ?auto_101760 ?auto_101761 ) ) ( not ( = ?auto_101760 ?auto_101762 ) ) ( not ( = ?auto_101761 ?auto_101762 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101762 ?auto_101761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101764 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101764 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_101764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_101765 - BLOCK
    )
    :vars
    (
      ?auto_101766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101765 ?auto_101766 ) ( CLEAR ?auto_101765 ) ( HAND-EMPTY ) ( not ( = ?auto_101765 ?auto_101766 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101765 ?auto_101766 )
      ( MAKE-1PILE ?auto_101765 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101773 - BLOCK
      ?auto_101774 - BLOCK
      ?auto_101775 - BLOCK
      ?auto_101776 - BLOCK
      ?auto_101777 - BLOCK
      ?auto_101778 - BLOCK
    )
    :vars
    (
      ?auto_101779 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101779 ?auto_101778 ) ( CLEAR ?auto_101779 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101773 ) ( ON ?auto_101774 ?auto_101773 ) ( ON ?auto_101775 ?auto_101774 ) ( ON ?auto_101776 ?auto_101775 ) ( ON ?auto_101777 ?auto_101776 ) ( ON ?auto_101778 ?auto_101777 ) ( not ( = ?auto_101773 ?auto_101774 ) ) ( not ( = ?auto_101773 ?auto_101775 ) ) ( not ( = ?auto_101773 ?auto_101776 ) ) ( not ( = ?auto_101773 ?auto_101777 ) ) ( not ( = ?auto_101773 ?auto_101778 ) ) ( not ( = ?auto_101773 ?auto_101779 ) ) ( not ( = ?auto_101774 ?auto_101775 ) ) ( not ( = ?auto_101774 ?auto_101776 ) ) ( not ( = ?auto_101774 ?auto_101777 ) ) ( not ( = ?auto_101774 ?auto_101778 ) ) ( not ( = ?auto_101774 ?auto_101779 ) ) ( not ( = ?auto_101775 ?auto_101776 ) ) ( not ( = ?auto_101775 ?auto_101777 ) ) ( not ( = ?auto_101775 ?auto_101778 ) ) ( not ( = ?auto_101775 ?auto_101779 ) ) ( not ( = ?auto_101776 ?auto_101777 ) ) ( not ( = ?auto_101776 ?auto_101778 ) ) ( not ( = ?auto_101776 ?auto_101779 ) ) ( not ( = ?auto_101777 ?auto_101778 ) ) ( not ( = ?auto_101777 ?auto_101779 ) ) ( not ( = ?auto_101778 ?auto_101779 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101779 ?auto_101778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101780 - BLOCK
      ?auto_101781 - BLOCK
      ?auto_101782 - BLOCK
      ?auto_101783 - BLOCK
      ?auto_101784 - BLOCK
      ?auto_101785 - BLOCK
    )
    :vars
    (
      ?auto_101786 - BLOCK
      ?auto_101787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101786 ?auto_101785 ) ( CLEAR ?auto_101786 ) ( ON-TABLE ?auto_101780 ) ( ON ?auto_101781 ?auto_101780 ) ( ON ?auto_101782 ?auto_101781 ) ( ON ?auto_101783 ?auto_101782 ) ( ON ?auto_101784 ?auto_101783 ) ( ON ?auto_101785 ?auto_101784 ) ( not ( = ?auto_101780 ?auto_101781 ) ) ( not ( = ?auto_101780 ?auto_101782 ) ) ( not ( = ?auto_101780 ?auto_101783 ) ) ( not ( = ?auto_101780 ?auto_101784 ) ) ( not ( = ?auto_101780 ?auto_101785 ) ) ( not ( = ?auto_101780 ?auto_101786 ) ) ( not ( = ?auto_101781 ?auto_101782 ) ) ( not ( = ?auto_101781 ?auto_101783 ) ) ( not ( = ?auto_101781 ?auto_101784 ) ) ( not ( = ?auto_101781 ?auto_101785 ) ) ( not ( = ?auto_101781 ?auto_101786 ) ) ( not ( = ?auto_101782 ?auto_101783 ) ) ( not ( = ?auto_101782 ?auto_101784 ) ) ( not ( = ?auto_101782 ?auto_101785 ) ) ( not ( = ?auto_101782 ?auto_101786 ) ) ( not ( = ?auto_101783 ?auto_101784 ) ) ( not ( = ?auto_101783 ?auto_101785 ) ) ( not ( = ?auto_101783 ?auto_101786 ) ) ( not ( = ?auto_101784 ?auto_101785 ) ) ( not ( = ?auto_101784 ?auto_101786 ) ) ( not ( = ?auto_101785 ?auto_101786 ) ) ( HOLDING ?auto_101787 ) ( not ( = ?auto_101780 ?auto_101787 ) ) ( not ( = ?auto_101781 ?auto_101787 ) ) ( not ( = ?auto_101782 ?auto_101787 ) ) ( not ( = ?auto_101783 ?auto_101787 ) ) ( not ( = ?auto_101784 ?auto_101787 ) ) ( not ( = ?auto_101785 ?auto_101787 ) ) ( not ( = ?auto_101786 ?auto_101787 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_101787 )
      ( MAKE-6PILE ?auto_101780 ?auto_101781 ?auto_101782 ?auto_101783 ?auto_101784 ?auto_101785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_101788 - BLOCK
      ?auto_101789 - BLOCK
      ?auto_101790 - BLOCK
      ?auto_101791 - BLOCK
      ?auto_101792 - BLOCK
      ?auto_101793 - BLOCK
    )
    :vars
    (
      ?auto_101794 - BLOCK
      ?auto_101795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101794 ?auto_101793 ) ( ON-TABLE ?auto_101788 ) ( ON ?auto_101789 ?auto_101788 ) ( ON ?auto_101790 ?auto_101789 ) ( ON ?auto_101791 ?auto_101790 ) ( ON ?auto_101792 ?auto_101791 ) ( ON ?auto_101793 ?auto_101792 ) ( not ( = ?auto_101788 ?auto_101789 ) ) ( not ( = ?auto_101788 ?auto_101790 ) ) ( not ( = ?auto_101788 ?auto_101791 ) ) ( not ( = ?auto_101788 ?auto_101792 ) ) ( not ( = ?auto_101788 ?auto_101793 ) ) ( not ( = ?auto_101788 ?auto_101794 ) ) ( not ( = ?auto_101789 ?auto_101790 ) ) ( not ( = ?auto_101789 ?auto_101791 ) ) ( not ( = ?auto_101789 ?auto_101792 ) ) ( not ( = ?auto_101789 ?auto_101793 ) ) ( not ( = ?auto_101789 ?auto_101794 ) ) ( not ( = ?auto_101790 ?auto_101791 ) ) ( not ( = ?auto_101790 ?auto_101792 ) ) ( not ( = ?auto_101790 ?auto_101793 ) ) ( not ( = ?auto_101790 ?auto_101794 ) ) ( not ( = ?auto_101791 ?auto_101792 ) ) ( not ( = ?auto_101791 ?auto_101793 ) ) ( not ( = ?auto_101791 ?auto_101794 ) ) ( not ( = ?auto_101792 ?auto_101793 ) ) ( not ( = ?auto_101792 ?auto_101794 ) ) ( not ( = ?auto_101793 ?auto_101794 ) ) ( not ( = ?auto_101788 ?auto_101795 ) ) ( not ( = ?auto_101789 ?auto_101795 ) ) ( not ( = ?auto_101790 ?auto_101795 ) ) ( not ( = ?auto_101791 ?auto_101795 ) ) ( not ( = ?auto_101792 ?auto_101795 ) ) ( not ( = ?auto_101793 ?auto_101795 ) ) ( not ( = ?auto_101794 ?auto_101795 ) ) ( ON ?auto_101795 ?auto_101794 ) ( CLEAR ?auto_101795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101788 ?auto_101789 ?auto_101790 ?auto_101791 ?auto_101792 ?auto_101793 ?auto_101794 )
      ( MAKE-6PILE ?auto_101788 ?auto_101789 ?auto_101790 ?auto_101791 ?auto_101792 ?auto_101793 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101798 - BLOCK
      ?auto_101799 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101799 ) ( CLEAR ?auto_101798 ) ( ON-TABLE ?auto_101798 ) ( not ( = ?auto_101798 ?auto_101799 ) ) )
    :subtasks
    ( ( !STACK ?auto_101799 ?auto_101798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101800 - BLOCK
      ?auto_101801 - BLOCK
    )
    :vars
    (
      ?auto_101802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101800 ) ( ON-TABLE ?auto_101800 ) ( not ( = ?auto_101800 ?auto_101801 ) ) ( ON ?auto_101801 ?auto_101802 ) ( CLEAR ?auto_101801 ) ( HAND-EMPTY ) ( not ( = ?auto_101800 ?auto_101802 ) ) ( not ( = ?auto_101801 ?auto_101802 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101801 ?auto_101802 )
      ( MAKE-2PILE ?auto_101800 ?auto_101801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101803 - BLOCK
      ?auto_101804 - BLOCK
    )
    :vars
    (
      ?auto_101805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101803 ?auto_101804 ) ) ( ON ?auto_101804 ?auto_101805 ) ( CLEAR ?auto_101804 ) ( not ( = ?auto_101803 ?auto_101805 ) ) ( not ( = ?auto_101804 ?auto_101805 ) ) ( HOLDING ?auto_101803 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101803 )
      ( MAKE-2PILE ?auto_101803 ?auto_101804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_101806 - BLOCK
      ?auto_101807 - BLOCK
    )
    :vars
    (
      ?auto_101808 - BLOCK
      ?auto_101810 - BLOCK
      ?auto_101811 - BLOCK
      ?auto_101809 - BLOCK
      ?auto_101813 - BLOCK
      ?auto_101812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101806 ?auto_101807 ) ) ( ON ?auto_101807 ?auto_101808 ) ( not ( = ?auto_101806 ?auto_101808 ) ) ( not ( = ?auto_101807 ?auto_101808 ) ) ( ON ?auto_101806 ?auto_101807 ) ( CLEAR ?auto_101806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101810 ) ( ON ?auto_101811 ?auto_101810 ) ( ON ?auto_101809 ?auto_101811 ) ( ON ?auto_101813 ?auto_101809 ) ( ON ?auto_101812 ?auto_101813 ) ( ON ?auto_101808 ?auto_101812 ) ( not ( = ?auto_101810 ?auto_101811 ) ) ( not ( = ?auto_101810 ?auto_101809 ) ) ( not ( = ?auto_101810 ?auto_101813 ) ) ( not ( = ?auto_101810 ?auto_101812 ) ) ( not ( = ?auto_101810 ?auto_101808 ) ) ( not ( = ?auto_101810 ?auto_101807 ) ) ( not ( = ?auto_101810 ?auto_101806 ) ) ( not ( = ?auto_101811 ?auto_101809 ) ) ( not ( = ?auto_101811 ?auto_101813 ) ) ( not ( = ?auto_101811 ?auto_101812 ) ) ( not ( = ?auto_101811 ?auto_101808 ) ) ( not ( = ?auto_101811 ?auto_101807 ) ) ( not ( = ?auto_101811 ?auto_101806 ) ) ( not ( = ?auto_101809 ?auto_101813 ) ) ( not ( = ?auto_101809 ?auto_101812 ) ) ( not ( = ?auto_101809 ?auto_101808 ) ) ( not ( = ?auto_101809 ?auto_101807 ) ) ( not ( = ?auto_101809 ?auto_101806 ) ) ( not ( = ?auto_101813 ?auto_101812 ) ) ( not ( = ?auto_101813 ?auto_101808 ) ) ( not ( = ?auto_101813 ?auto_101807 ) ) ( not ( = ?auto_101813 ?auto_101806 ) ) ( not ( = ?auto_101812 ?auto_101808 ) ) ( not ( = ?auto_101812 ?auto_101807 ) ) ( not ( = ?auto_101812 ?auto_101806 ) ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101810 ?auto_101811 ?auto_101809 ?auto_101813 ?auto_101812 ?auto_101808 ?auto_101807 )
      ( MAKE-2PILE ?auto_101806 ?auto_101807 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101819 - BLOCK
      ?auto_101820 - BLOCK
      ?auto_101821 - BLOCK
      ?auto_101822 - BLOCK
      ?auto_101823 - BLOCK
    )
    :vars
    (
      ?auto_101824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101824 ?auto_101823 ) ( CLEAR ?auto_101824 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101819 ) ( ON ?auto_101820 ?auto_101819 ) ( ON ?auto_101821 ?auto_101820 ) ( ON ?auto_101822 ?auto_101821 ) ( ON ?auto_101823 ?auto_101822 ) ( not ( = ?auto_101819 ?auto_101820 ) ) ( not ( = ?auto_101819 ?auto_101821 ) ) ( not ( = ?auto_101819 ?auto_101822 ) ) ( not ( = ?auto_101819 ?auto_101823 ) ) ( not ( = ?auto_101819 ?auto_101824 ) ) ( not ( = ?auto_101820 ?auto_101821 ) ) ( not ( = ?auto_101820 ?auto_101822 ) ) ( not ( = ?auto_101820 ?auto_101823 ) ) ( not ( = ?auto_101820 ?auto_101824 ) ) ( not ( = ?auto_101821 ?auto_101822 ) ) ( not ( = ?auto_101821 ?auto_101823 ) ) ( not ( = ?auto_101821 ?auto_101824 ) ) ( not ( = ?auto_101822 ?auto_101823 ) ) ( not ( = ?auto_101822 ?auto_101824 ) ) ( not ( = ?auto_101823 ?auto_101824 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101824 ?auto_101823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101825 - BLOCK
      ?auto_101826 - BLOCK
      ?auto_101827 - BLOCK
      ?auto_101828 - BLOCK
      ?auto_101829 - BLOCK
    )
    :vars
    (
      ?auto_101830 - BLOCK
      ?auto_101831 - BLOCK
      ?auto_101832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101830 ?auto_101829 ) ( CLEAR ?auto_101830 ) ( ON-TABLE ?auto_101825 ) ( ON ?auto_101826 ?auto_101825 ) ( ON ?auto_101827 ?auto_101826 ) ( ON ?auto_101828 ?auto_101827 ) ( ON ?auto_101829 ?auto_101828 ) ( not ( = ?auto_101825 ?auto_101826 ) ) ( not ( = ?auto_101825 ?auto_101827 ) ) ( not ( = ?auto_101825 ?auto_101828 ) ) ( not ( = ?auto_101825 ?auto_101829 ) ) ( not ( = ?auto_101825 ?auto_101830 ) ) ( not ( = ?auto_101826 ?auto_101827 ) ) ( not ( = ?auto_101826 ?auto_101828 ) ) ( not ( = ?auto_101826 ?auto_101829 ) ) ( not ( = ?auto_101826 ?auto_101830 ) ) ( not ( = ?auto_101827 ?auto_101828 ) ) ( not ( = ?auto_101827 ?auto_101829 ) ) ( not ( = ?auto_101827 ?auto_101830 ) ) ( not ( = ?auto_101828 ?auto_101829 ) ) ( not ( = ?auto_101828 ?auto_101830 ) ) ( not ( = ?auto_101829 ?auto_101830 ) ) ( HOLDING ?auto_101831 ) ( CLEAR ?auto_101832 ) ( not ( = ?auto_101825 ?auto_101831 ) ) ( not ( = ?auto_101825 ?auto_101832 ) ) ( not ( = ?auto_101826 ?auto_101831 ) ) ( not ( = ?auto_101826 ?auto_101832 ) ) ( not ( = ?auto_101827 ?auto_101831 ) ) ( not ( = ?auto_101827 ?auto_101832 ) ) ( not ( = ?auto_101828 ?auto_101831 ) ) ( not ( = ?auto_101828 ?auto_101832 ) ) ( not ( = ?auto_101829 ?auto_101831 ) ) ( not ( = ?auto_101829 ?auto_101832 ) ) ( not ( = ?auto_101830 ?auto_101831 ) ) ( not ( = ?auto_101830 ?auto_101832 ) ) ( not ( = ?auto_101831 ?auto_101832 ) ) )
    :subtasks
    ( ( !STACK ?auto_101831 ?auto_101832 )
      ( MAKE-5PILE ?auto_101825 ?auto_101826 ?auto_101827 ?auto_101828 ?auto_101829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102751 - BLOCK
      ?auto_102752 - BLOCK
      ?auto_102753 - BLOCK
      ?auto_102754 - BLOCK
      ?auto_102755 - BLOCK
    )
    :vars
    (
      ?auto_102756 - BLOCK
      ?auto_102757 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102756 ?auto_102755 ) ( ON-TABLE ?auto_102751 ) ( ON ?auto_102752 ?auto_102751 ) ( ON ?auto_102753 ?auto_102752 ) ( ON ?auto_102754 ?auto_102753 ) ( ON ?auto_102755 ?auto_102754 ) ( not ( = ?auto_102751 ?auto_102752 ) ) ( not ( = ?auto_102751 ?auto_102753 ) ) ( not ( = ?auto_102751 ?auto_102754 ) ) ( not ( = ?auto_102751 ?auto_102755 ) ) ( not ( = ?auto_102751 ?auto_102756 ) ) ( not ( = ?auto_102752 ?auto_102753 ) ) ( not ( = ?auto_102752 ?auto_102754 ) ) ( not ( = ?auto_102752 ?auto_102755 ) ) ( not ( = ?auto_102752 ?auto_102756 ) ) ( not ( = ?auto_102753 ?auto_102754 ) ) ( not ( = ?auto_102753 ?auto_102755 ) ) ( not ( = ?auto_102753 ?auto_102756 ) ) ( not ( = ?auto_102754 ?auto_102755 ) ) ( not ( = ?auto_102754 ?auto_102756 ) ) ( not ( = ?auto_102755 ?auto_102756 ) ) ( not ( = ?auto_102751 ?auto_102757 ) ) ( not ( = ?auto_102752 ?auto_102757 ) ) ( not ( = ?auto_102753 ?auto_102757 ) ) ( not ( = ?auto_102754 ?auto_102757 ) ) ( not ( = ?auto_102755 ?auto_102757 ) ) ( not ( = ?auto_102756 ?auto_102757 ) ) ( ON ?auto_102757 ?auto_102756 ) ( CLEAR ?auto_102757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102751 ?auto_102752 ?auto_102753 ?auto_102754 ?auto_102755 ?auto_102756 )
      ( MAKE-5PILE ?auto_102751 ?auto_102752 ?auto_102753 ?auto_102754 ?auto_102755 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101841 - BLOCK
      ?auto_101842 - BLOCK
      ?auto_101843 - BLOCK
      ?auto_101844 - BLOCK
      ?auto_101845 - BLOCK
    )
    :vars
    (
      ?auto_101846 - BLOCK
      ?auto_101847 - BLOCK
      ?auto_101848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101846 ?auto_101845 ) ( ON-TABLE ?auto_101841 ) ( ON ?auto_101842 ?auto_101841 ) ( ON ?auto_101843 ?auto_101842 ) ( ON ?auto_101844 ?auto_101843 ) ( ON ?auto_101845 ?auto_101844 ) ( not ( = ?auto_101841 ?auto_101842 ) ) ( not ( = ?auto_101841 ?auto_101843 ) ) ( not ( = ?auto_101841 ?auto_101844 ) ) ( not ( = ?auto_101841 ?auto_101845 ) ) ( not ( = ?auto_101841 ?auto_101846 ) ) ( not ( = ?auto_101842 ?auto_101843 ) ) ( not ( = ?auto_101842 ?auto_101844 ) ) ( not ( = ?auto_101842 ?auto_101845 ) ) ( not ( = ?auto_101842 ?auto_101846 ) ) ( not ( = ?auto_101843 ?auto_101844 ) ) ( not ( = ?auto_101843 ?auto_101845 ) ) ( not ( = ?auto_101843 ?auto_101846 ) ) ( not ( = ?auto_101844 ?auto_101845 ) ) ( not ( = ?auto_101844 ?auto_101846 ) ) ( not ( = ?auto_101845 ?auto_101846 ) ) ( not ( = ?auto_101841 ?auto_101847 ) ) ( not ( = ?auto_101841 ?auto_101848 ) ) ( not ( = ?auto_101842 ?auto_101847 ) ) ( not ( = ?auto_101842 ?auto_101848 ) ) ( not ( = ?auto_101843 ?auto_101847 ) ) ( not ( = ?auto_101843 ?auto_101848 ) ) ( not ( = ?auto_101844 ?auto_101847 ) ) ( not ( = ?auto_101844 ?auto_101848 ) ) ( not ( = ?auto_101845 ?auto_101847 ) ) ( not ( = ?auto_101845 ?auto_101848 ) ) ( not ( = ?auto_101846 ?auto_101847 ) ) ( not ( = ?auto_101846 ?auto_101848 ) ) ( not ( = ?auto_101847 ?auto_101848 ) ) ( ON ?auto_101847 ?auto_101846 ) ( CLEAR ?auto_101847 ) ( HOLDING ?auto_101848 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101848 )
      ( MAKE-5PILE ?auto_101841 ?auto_101842 ?auto_101843 ?auto_101844 ?auto_101845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_101849 - BLOCK
      ?auto_101850 - BLOCK
      ?auto_101851 - BLOCK
      ?auto_101852 - BLOCK
      ?auto_101853 - BLOCK
    )
    :vars
    (
      ?auto_101855 - BLOCK
      ?auto_101856 - BLOCK
      ?auto_101854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101855 ?auto_101853 ) ( ON-TABLE ?auto_101849 ) ( ON ?auto_101850 ?auto_101849 ) ( ON ?auto_101851 ?auto_101850 ) ( ON ?auto_101852 ?auto_101851 ) ( ON ?auto_101853 ?auto_101852 ) ( not ( = ?auto_101849 ?auto_101850 ) ) ( not ( = ?auto_101849 ?auto_101851 ) ) ( not ( = ?auto_101849 ?auto_101852 ) ) ( not ( = ?auto_101849 ?auto_101853 ) ) ( not ( = ?auto_101849 ?auto_101855 ) ) ( not ( = ?auto_101850 ?auto_101851 ) ) ( not ( = ?auto_101850 ?auto_101852 ) ) ( not ( = ?auto_101850 ?auto_101853 ) ) ( not ( = ?auto_101850 ?auto_101855 ) ) ( not ( = ?auto_101851 ?auto_101852 ) ) ( not ( = ?auto_101851 ?auto_101853 ) ) ( not ( = ?auto_101851 ?auto_101855 ) ) ( not ( = ?auto_101852 ?auto_101853 ) ) ( not ( = ?auto_101852 ?auto_101855 ) ) ( not ( = ?auto_101853 ?auto_101855 ) ) ( not ( = ?auto_101849 ?auto_101856 ) ) ( not ( = ?auto_101849 ?auto_101854 ) ) ( not ( = ?auto_101850 ?auto_101856 ) ) ( not ( = ?auto_101850 ?auto_101854 ) ) ( not ( = ?auto_101851 ?auto_101856 ) ) ( not ( = ?auto_101851 ?auto_101854 ) ) ( not ( = ?auto_101852 ?auto_101856 ) ) ( not ( = ?auto_101852 ?auto_101854 ) ) ( not ( = ?auto_101853 ?auto_101856 ) ) ( not ( = ?auto_101853 ?auto_101854 ) ) ( not ( = ?auto_101855 ?auto_101856 ) ) ( not ( = ?auto_101855 ?auto_101854 ) ) ( not ( = ?auto_101856 ?auto_101854 ) ) ( ON ?auto_101856 ?auto_101855 ) ( ON ?auto_101854 ?auto_101856 ) ( CLEAR ?auto_101854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101849 ?auto_101850 ?auto_101851 ?auto_101852 ?auto_101853 ?auto_101855 ?auto_101856 )
      ( MAKE-5PILE ?auto_101849 ?auto_101850 ?auto_101851 ?auto_101852 ?auto_101853 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101860 - BLOCK
      ?auto_101861 - BLOCK
      ?auto_101862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101862 ) ( CLEAR ?auto_101861 ) ( ON-TABLE ?auto_101860 ) ( ON ?auto_101861 ?auto_101860 ) ( not ( = ?auto_101860 ?auto_101861 ) ) ( not ( = ?auto_101860 ?auto_101862 ) ) ( not ( = ?auto_101861 ?auto_101862 ) ) )
    :subtasks
    ( ( !STACK ?auto_101862 ?auto_101861 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101863 - BLOCK
      ?auto_101864 - BLOCK
      ?auto_101865 - BLOCK
    )
    :vars
    (
      ?auto_101866 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101864 ) ( ON-TABLE ?auto_101863 ) ( ON ?auto_101864 ?auto_101863 ) ( not ( = ?auto_101863 ?auto_101864 ) ) ( not ( = ?auto_101863 ?auto_101865 ) ) ( not ( = ?auto_101864 ?auto_101865 ) ) ( ON ?auto_101865 ?auto_101866 ) ( CLEAR ?auto_101865 ) ( HAND-EMPTY ) ( not ( = ?auto_101863 ?auto_101866 ) ) ( not ( = ?auto_101864 ?auto_101866 ) ) ( not ( = ?auto_101865 ?auto_101866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101865 ?auto_101866 )
      ( MAKE-3PILE ?auto_101863 ?auto_101864 ?auto_101865 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101867 - BLOCK
      ?auto_101868 - BLOCK
      ?auto_101869 - BLOCK
    )
    :vars
    (
      ?auto_101870 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101867 ) ( not ( = ?auto_101867 ?auto_101868 ) ) ( not ( = ?auto_101867 ?auto_101869 ) ) ( not ( = ?auto_101868 ?auto_101869 ) ) ( ON ?auto_101869 ?auto_101870 ) ( CLEAR ?auto_101869 ) ( not ( = ?auto_101867 ?auto_101870 ) ) ( not ( = ?auto_101868 ?auto_101870 ) ) ( not ( = ?auto_101869 ?auto_101870 ) ) ( HOLDING ?auto_101868 ) ( CLEAR ?auto_101867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101867 ?auto_101868 )
      ( MAKE-3PILE ?auto_101867 ?auto_101868 ?auto_101869 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101871 - BLOCK
      ?auto_101872 - BLOCK
      ?auto_101873 - BLOCK
    )
    :vars
    (
      ?auto_101874 - BLOCK
      ?auto_101877 - BLOCK
      ?auto_101875 - BLOCK
      ?auto_101876 - BLOCK
      ?auto_101878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101871 ) ( not ( = ?auto_101871 ?auto_101872 ) ) ( not ( = ?auto_101871 ?auto_101873 ) ) ( not ( = ?auto_101872 ?auto_101873 ) ) ( ON ?auto_101873 ?auto_101874 ) ( not ( = ?auto_101871 ?auto_101874 ) ) ( not ( = ?auto_101872 ?auto_101874 ) ) ( not ( = ?auto_101873 ?auto_101874 ) ) ( CLEAR ?auto_101871 ) ( ON ?auto_101872 ?auto_101873 ) ( CLEAR ?auto_101872 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101877 ) ( ON ?auto_101875 ?auto_101877 ) ( ON ?auto_101876 ?auto_101875 ) ( ON ?auto_101878 ?auto_101876 ) ( ON ?auto_101874 ?auto_101878 ) ( not ( = ?auto_101877 ?auto_101875 ) ) ( not ( = ?auto_101877 ?auto_101876 ) ) ( not ( = ?auto_101877 ?auto_101878 ) ) ( not ( = ?auto_101877 ?auto_101874 ) ) ( not ( = ?auto_101877 ?auto_101873 ) ) ( not ( = ?auto_101877 ?auto_101872 ) ) ( not ( = ?auto_101875 ?auto_101876 ) ) ( not ( = ?auto_101875 ?auto_101878 ) ) ( not ( = ?auto_101875 ?auto_101874 ) ) ( not ( = ?auto_101875 ?auto_101873 ) ) ( not ( = ?auto_101875 ?auto_101872 ) ) ( not ( = ?auto_101876 ?auto_101878 ) ) ( not ( = ?auto_101876 ?auto_101874 ) ) ( not ( = ?auto_101876 ?auto_101873 ) ) ( not ( = ?auto_101876 ?auto_101872 ) ) ( not ( = ?auto_101878 ?auto_101874 ) ) ( not ( = ?auto_101878 ?auto_101873 ) ) ( not ( = ?auto_101878 ?auto_101872 ) ) ( not ( = ?auto_101871 ?auto_101877 ) ) ( not ( = ?auto_101871 ?auto_101875 ) ) ( not ( = ?auto_101871 ?auto_101876 ) ) ( not ( = ?auto_101871 ?auto_101878 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101877 ?auto_101875 ?auto_101876 ?auto_101878 ?auto_101874 ?auto_101873 )
      ( MAKE-3PILE ?auto_101871 ?auto_101872 ?auto_101873 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101879 - BLOCK
      ?auto_101880 - BLOCK
      ?auto_101881 - BLOCK
    )
    :vars
    (
      ?auto_101886 - BLOCK
      ?auto_101885 - BLOCK
      ?auto_101884 - BLOCK
      ?auto_101882 - BLOCK
      ?auto_101883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101879 ?auto_101880 ) ) ( not ( = ?auto_101879 ?auto_101881 ) ) ( not ( = ?auto_101880 ?auto_101881 ) ) ( ON ?auto_101881 ?auto_101886 ) ( not ( = ?auto_101879 ?auto_101886 ) ) ( not ( = ?auto_101880 ?auto_101886 ) ) ( not ( = ?auto_101881 ?auto_101886 ) ) ( ON ?auto_101880 ?auto_101881 ) ( CLEAR ?auto_101880 ) ( ON-TABLE ?auto_101885 ) ( ON ?auto_101884 ?auto_101885 ) ( ON ?auto_101882 ?auto_101884 ) ( ON ?auto_101883 ?auto_101882 ) ( ON ?auto_101886 ?auto_101883 ) ( not ( = ?auto_101885 ?auto_101884 ) ) ( not ( = ?auto_101885 ?auto_101882 ) ) ( not ( = ?auto_101885 ?auto_101883 ) ) ( not ( = ?auto_101885 ?auto_101886 ) ) ( not ( = ?auto_101885 ?auto_101881 ) ) ( not ( = ?auto_101885 ?auto_101880 ) ) ( not ( = ?auto_101884 ?auto_101882 ) ) ( not ( = ?auto_101884 ?auto_101883 ) ) ( not ( = ?auto_101884 ?auto_101886 ) ) ( not ( = ?auto_101884 ?auto_101881 ) ) ( not ( = ?auto_101884 ?auto_101880 ) ) ( not ( = ?auto_101882 ?auto_101883 ) ) ( not ( = ?auto_101882 ?auto_101886 ) ) ( not ( = ?auto_101882 ?auto_101881 ) ) ( not ( = ?auto_101882 ?auto_101880 ) ) ( not ( = ?auto_101883 ?auto_101886 ) ) ( not ( = ?auto_101883 ?auto_101881 ) ) ( not ( = ?auto_101883 ?auto_101880 ) ) ( not ( = ?auto_101879 ?auto_101885 ) ) ( not ( = ?auto_101879 ?auto_101884 ) ) ( not ( = ?auto_101879 ?auto_101882 ) ) ( not ( = ?auto_101879 ?auto_101883 ) ) ( HOLDING ?auto_101879 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101879 )
      ( MAKE-3PILE ?auto_101879 ?auto_101880 ?auto_101881 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_101887 - BLOCK
      ?auto_101888 - BLOCK
      ?auto_101889 - BLOCK
    )
    :vars
    (
      ?auto_101892 - BLOCK
      ?auto_101894 - BLOCK
      ?auto_101893 - BLOCK
      ?auto_101891 - BLOCK
      ?auto_101890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101887 ?auto_101888 ) ) ( not ( = ?auto_101887 ?auto_101889 ) ) ( not ( = ?auto_101888 ?auto_101889 ) ) ( ON ?auto_101889 ?auto_101892 ) ( not ( = ?auto_101887 ?auto_101892 ) ) ( not ( = ?auto_101888 ?auto_101892 ) ) ( not ( = ?auto_101889 ?auto_101892 ) ) ( ON ?auto_101888 ?auto_101889 ) ( ON-TABLE ?auto_101894 ) ( ON ?auto_101893 ?auto_101894 ) ( ON ?auto_101891 ?auto_101893 ) ( ON ?auto_101890 ?auto_101891 ) ( ON ?auto_101892 ?auto_101890 ) ( not ( = ?auto_101894 ?auto_101893 ) ) ( not ( = ?auto_101894 ?auto_101891 ) ) ( not ( = ?auto_101894 ?auto_101890 ) ) ( not ( = ?auto_101894 ?auto_101892 ) ) ( not ( = ?auto_101894 ?auto_101889 ) ) ( not ( = ?auto_101894 ?auto_101888 ) ) ( not ( = ?auto_101893 ?auto_101891 ) ) ( not ( = ?auto_101893 ?auto_101890 ) ) ( not ( = ?auto_101893 ?auto_101892 ) ) ( not ( = ?auto_101893 ?auto_101889 ) ) ( not ( = ?auto_101893 ?auto_101888 ) ) ( not ( = ?auto_101891 ?auto_101890 ) ) ( not ( = ?auto_101891 ?auto_101892 ) ) ( not ( = ?auto_101891 ?auto_101889 ) ) ( not ( = ?auto_101891 ?auto_101888 ) ) ( not ( = ?auto_101890 ?auto_101892 ) ) ( not ( = ?auto_101890 ?auto_101889 ) ) ( not ( = ?auto_101890 ?auto_101888 ) ) ( not ( = ?auto_101887 ?auto_101894 ) ) ( not ( = ?auto_101887 ?auto_101893 ) ) ( not ( = ?auto_101887 ?auto_101891 ) ) ( not ( = ?auto_101887 ?auto_101890 ) ) ( ON ?auto_101887 ?auto_101888 ) ( CLEAR ?auto_101887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101894 ?auto_101893 ?auto_101891 ?auto_101890 ?auto_101892 ?auto_101889 ?auto_101888 )
      ( MAKE-3PILE ?auto_101887 ?auto_101888 ?auto_101889 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101899 - BLOCK
      ?auto_101900 - BLOCK
      ?auto_101901 - BLOCK
      ?auto_101902 - BLOCK
    )
    :vars
    (
      ?auto_101903 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101903 ?auto_101902 ) ( CLEAR ?auto_101903 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101899 ) ( ON ?auto_101900 ?auto_101899 ) ( ON ?auto_101901 ?auto_101900 ) ( ON ?auto_101902 ?auto_101901 ) ( not ( = ?auto_101899 ?auto_101900 ) ) ( not ( = ?auto_101899 ?auto_101901 ) ) ( not ( = ?auto_101899 ?auto_101902 ) ) ( not ( = ?auto_101899 ?auto_101903 ) ) ( not ( = ?auto_101900 ?auto_101901 ) ) ( not ( = ?auto_101900 ?auto_101902 ) ) ( not ( = ?auto_101900 ?auto_101903 ) ) ( not ( = ?auto_101901 ?auto_101902 ) ) ( not ( = ?auto_101901 ?auto_101903 ) ) ( not ( = ?auto_101902 ?auto_101903 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101903 ?auto_101902 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101904 - BLOCK
      ?auto_101905 - BLOCK
      ?auto_101906 - BLOCK
      ?auto_101907 - BLOCK
    )
    :vars
    (
      ?auto_101908 - BLOCK
      ?auto_101909 - BLOCK
      ?auto_101910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101908 ?auto_101907 ) ( CLEAR ?auto_101908 ) ( ON-TABLE ?auto_101904 ) ( ON ?auto_101905 ?auto_101904 ) ( ON ?auto_101906 ?auto_101905 ) ( ON ?auto_101907 ?auto_101906 ) ( not ( = ?auto_101904 ?auto_101905 ) ) ( not ( = ?auto_101904 ?auto_101906 ) ) ( not ( = ?auto_101904 ?auto_101907 ) ) ( not ( = ?auto_101904 ?auto_101908 ) ) ( not ( = ?auto_101905 ?auto_101906 ) ) ( not ( = ?auto_101905 ?auto_101907 ) ) ( not ( = ?auto_101905 ?auto_101908 ) ) ( not ( = ?auto_101906 ?auto_101907 ) ) ( not ( = ?auto_101906 ?auto_101908 ) ) ( not ( = ?auto_101907 ?auto_101908 ) ) ( HOLDING ?auto_101909 ) ( CLEAR ?auto_101910 ) ( not ( = ?auto_101904 ?auto_101909 ) ) ( not ( = ?auto_101904 ?auto_101910 ) ) ( not ( = ?auto_101905 ?auto_101909 ) ) ( not ( = ?auto_101905 ?auto_101910 ) ) ( not ( = ?auto_101906 ?auto_101909 ) ) ( not ( = ?auto_101906 ?auto_101910 ) ) ( not ( = ?auto_101907 ?auto_101909 ) ) ( not ( = ?auto_101907 ?auto_101910 ) ) ( not ( = ?auto_101908 ?auto_101909 ) ) ( not ( = ?auto_101908 ?auto_101910 ) ) ( not ( = ?auto_101909 ?auto_101910 ) ) )
    :subtasks
    ( ( !STACK ?auto_101909 ?auto_101910 )
      ( MAKE-4PILE ?auto_101904 ?auto_101905 ?auto_101906 ?auto_101907 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101911 - BLOCK
      ?auto_101912 - BLOCK
      ?auto_101913 - BLOCK
      ?auto_101914 - BLOCK
    )
    :vars
    (
      ?auto_101915 - BLOCK
      ?auto_101917 - BLOCK
      ?auto_101916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101915 ?auto_101914 ) ( ON-TABLE ?auto_101911 ) ( ON ?auto_101912 ?auto_101911 ) ( ON ?auto_101913 ?auto_101912 ) ( ON ?auto_101914 ?auto_101913 ) ( not ( = ?auto_101911 ?auto_101912 ) ) ( not ( = ?auto_101911 ?auto_101913 ) ) ( not ( = ?auto_101911 ?auto_101914 ) ) ( not ( = ?auto_101911 ?auto_101915 ) ) ( not ( = ?auto_101912 ?auto_101913 ) ) ( not ( = ?auto_101912 ?auto_101914 ) ) ( not ( = ?auto_101912 ?auto_101915 ) ) ( not ( = ?auto_101913 ?auto_101914 ) ) ( not ( = ?auto_101913 ?auto_101915 ) ) ( not ( = ?auto_101914 ?auto_101915 ) ) ( CLEAR ?auto_101917 ) ( not ( = ?auto_101911 ?auto_101916 ) ) ( not ( = ?auto_101911 ?auto_101917 ) ) ( not ( = ?auto_101912 ?auto_101916 ) ) ( not ( = ?auto_101912 ?auto_101917 ) ) ( not ( = ?auto_101913 ?auto_101916 ) ) ( not ( = ?auto_101913 ?auto_101917 ) ) ( not ( = ?auto_101914 ?auto_101916 ) ) ( not ( = ?auto_101914 ?auto_101917 ) ) ( not ( = ?auto_101915 ?auto_101916 ) ) ( not ( = ?auto_101915 ?auto_101917 ) ) ( not ( = ?auto_101916 ?auto_101917 ) ) ( ON ?auto_101916 ?auto_101915 ) ( CLEAR ?auto_101916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101911 ?auto_101912 ?auto_101913 ?auto_101914 ?auto_101915 )
      ( MAKE-4PILE ?auto_101911 ?auto_101912 ?auto_101913 ?auto_101914 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101918 - BLOCK
      ?auto_101919 - BLOCK
      ?auto_101920 - BLOCK
      ?auto_101921 - BLOCK
    )
    :vars
    (
      ?auto_101923 - BLOCK
      ?auto_101922 - BLOCK
      ?auto_101924 - BLOCK
      ?auto_101925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101923 ?auto_101921 ) ( ON-TABLE ?auto_101918 ) ( ON ?auto_101919 ?auto_101918 ) ( ON ?auto_101920 ?auto_101919 ) ( ON ?auto_101921 ?auto_101920 ) ( not ( = ?auto_101918 ?auto_101919 ) ) ( not ( = ?auto_101918 ?auto_101920 ) ) ( not ( = ?auto_101918 ?auto_101921 ) ) ( not ( = ?auto_101918 ?auto_101923 ) ) ( not ( = ?auto_101919 ?auto_101920 ) ) ( not ( = ?auto_101919 ?auto_101921 ) ) ( not ( = ?auto_101919 ?auto_101923 ) ) ( not ( = ?auto_101920 ?auto_101921 ) ) ( not ( = ?auto_101920 ?auto_101923 ) ) ( not ( = ?auto_101921 ?auto_101923 ) ) ( not ( = ?auto_101918 ?auto_101922 ) ) ( not ( = ?auto_101918 ?auto_101924 ) ) ( not ( = ?auto_101919 ?auto_101922 ) ) ( not ( = ?auto_101919 ?auto_101924 ) ) ( not ( = ?auto_101920 ?auto_101922 ) ) ( not ( = ?auto_101920 ?auto_101924 ) ) ( not ( = ?auto_101921 ?auto_101922 ) ) ( not ( = ?auto_101921 ?auto_101924 ) ) ( not ( = ?auto_101923 ?auto_101922 ) ) ( not ( = ?auto_101923 ?auto_101924 ) ) ( not ( = ?auto_101922 ?auto_101924 ) ) ( ON ?auto_101922 ?auto_101923 ) ( CLEAR ?auto_101922 ) ( HOLDING ?auto_101924 ) ( CLEAR ?auto_101925 ) ( ON-TABLE ?auto_101925 ) ( not ( = ?auto_101925 ?auto_101924 ) ) ( not ( = ?auto_101918 ?auto_101925 ) ) ( not ( = ?auto_101919 ?auto_101925 ) ) ( not ( = ?auto_101920 ?auto_101925 ) ) ( not ( = ?auto_101921 ?auto_101925 ) ) ( not ( = ?auto_101923 ?auto_101925 ) ) ( not ( = ?auto_101922 ?auto_101925 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101925 ?auto_101924 )
      ( MAKE-4PILE ?auto_101918 ?auto_101919 ?auto_101920 ?auto_101921 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102980 - BLOCK
      ?auto_102981 - BLOCK
      ?auto_102982 - BLOCK
      ?auto_102983 - BLOCK
    )
    :vars
    (
      ?auto_102984 - BLOCK
      ?auto_102985 - BLOCK
      ?auto_102986 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102984 ?auto_102983 ) ( ON-TABLE ?auto_102980 ) ( ON ?auto_102981 ?auto_102980 ) ( ON ?auto_102982 ?auto_102981 ) ( ON ?auto_102983 ?auto_102982 ) ( not ( = ?auto_102980 ?auto_102981 ) ) ( not ( = ?auto_102980 ?auto_102982 ) ) ( not ( = ?auto_102980 ?auto_102983 ) ) ( not ( = ?auto_102980 ?auto_102984 ) ) ( not ( = ?auto_102981 ?auto_102982 ) ) ( not ( = ?auto_102981 ?auto_102983 ) ) ( not ( = ?auto_102981 ?auto_102984 ) ) ( not ( = ?auto_102982 ?auto_102983 ) ) ( not ( = ?auto_102982 ?auto_102984 ) ) ( not ( = ?auto_102983 ?auto_102984 ) ) ( not ( = ?auto_102980 ?auto_102985 ) ) ( not ( = ?auto_102980 ?auto_102986 ) ) ( not ( = ?auto_102981 ?auto_102985 ) ) ( not ( = ?auto_102981 ?auto_102986 ) ) ( not ( = ?auto_102982 ?auto_102985 ) ) ( not ( = ?auto_102982 ?auto_102986 ) ) ( not ( = ?auto_102983 ?auto_102985 ) ) ( not ( = ?auto_102983 ?auto_102986 ) ) ( not ( = ?auto_102984 ?auto_102985 ) ) ( not ( = ?auto_102984 ?auto_102986 ) ) ( not ( = ?auto_102985 ?auto_102986 ) ) ( ON ?auto_102985 ?auto_102984 ) ( ON ?auto_102986 ?auto_102985 ) ( CLEAR ?auto_102986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102980 ?auto_102981 ?auto_102982 ?auto_102983 ?auto_102984 ?auto_102985 )
      ( MAKE-4PILE ?auto_102980 ?auto_102981 ?auto_102982 ?auto_102983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101934 - BLOCK
      ?auto_101935 - BLOCK
      ?auto_101936 - BLOCK
      ?auto_101937 - BLOCK
    )
    :vars
    (
      ?auto_101939 - BLOCK
      ?auto_101941 - BLOCK
      ?auto_101938 - BLOCK
      ?auto_101940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101939 ?auto_101937 ) ( ON-TABLE ?auto_101934 ) ( ON ?auto_101935 ?auto_101934 ) ( ON ?auto_101936 ?auto_101935 ) ( ON ?auto_101937 ?auto_101936 ) ( not ( = ?auto_101934 ?auto_101935 ) ) ( not ( = ?auto_101934 ?auto_101936 ) ) ( not ( = ?auto_101934 ?auto_101937 ) ) ( not ( = ?auto_101934 ?auto_101939 ) ) ( not ( = ?auto_101935 ?auto_101936 ) ) ( not ( = ?auto_101935 ?auto_101937 ) ) ( not ( = ?auto_101935 ?auto_101939 ) ) ( not ( = ?auto_101936 ?auto_101937 ) ) ( not ( = ?auto_101936 ?auto_101939 ) ) ( not ( = ?auto_101937 ?auto_101939 ) ) ( not ( = ?auto_101934 ?auto_101941 ) ) ( not ( = ?auto_101934 ?auto_101938 ) ) ( not ( = ?auto_101935 ?auto_101941 ) ) ( not ( = ?auto_101935 ?auto_101938 ) ) ( not ( = ?auto_101936 ?auto_101941 ) ) ( not ( = ?auto_101936 ?auto_101938 ) ) ( not ( = ?auto_101937 ?auto_101941 ) ) ( not ( = ?auto_101937 ?auto_101938 ) ) ( not ( = ?auto_101939 ?auto_101941 ) ) ( not ( = ?auto_101939 ?auto_101938 ) ) ( not ( = ?auto_101941 ?auto_101938 ) ) ( ON ?auto_101941 ?auto_101939 ) ( not ( = ?auto_101940 ?auto_101938 ) ) ( not ( = ?auto_101934 ?auto_101940 ) ) ( not ( = ?auto_101935 ?auto_101940 ) ) ( not ( = ?auto_101936 ?auto_101940 ) ) ( not ( = ?auto_101937 ?auto_101940 ) ) ( not ( = ?auto_101939 ?auto_101940 ) ) ( not ( = ?auto_101941 ?auto_101940 ) ) ( ON ?auto_101938 ?auto_101941 ) ( CLEAR ?auto_101938 ) ( HOLDING ?auto_101940 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101940 )
      ( MAKE-4PILE ?auto_101934 ?auto_101935 ?auto_101936 ?auto_101937 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101942 - BLOCK
      ?auto_101943 - BLOCK
      ?auto_101944 - BLOCK
      ?auto_101945 - BLOCK
    )
    :vars
    (
      ?auto_101949 - BLOCK
      ?auto_101946 - BLOCK
      ?auto_101948 - BLOCK
      ?auto_101947 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_101949 ?auto_101945 ) ( ON-TABLE ?auto_101942 ) ( ON ?auto_101943 ?auto_101942 ) ( ON ?auto_101944 ?auto_101943 ) ( ON ?auto_101945 ?auto_101944 ) ( not ( = ?auto_101942 ?auto_101943 ) ) ( not ( = ?auto_101942 ?auto_101944 ) ) ( not ( = ?auto_101942 ?auto_101945 ) ) ( not ( = ?auto_101942 ?auto_101949 ) ) ( not ( = ?auto_101943 ?auto_101944 ) ) ( not ( = ?auto_101943 ?auto_101945 ) ) ( not ( = ?auto_101943 ?auto_101949 ) ) ( not ( = ?auto_101944 ?auto_101945 ) ) ( not ( = ?auto_101944 ?auto_101949 ) ) ( not ( = ?auto_101945 ?auto_101949 ) ) ( not ( = ?auto_101942 ?auto_101946 ) ) ( not ( = ?auto_101942 ?auto_101948 ) ) ( not ( = ?auto_101943 ?auto_101946 ) ) ( not ( = ?auto_101943 ?auto_101948 ) ) ( not ( = ?auto_101944 ?auto_101946 ) ) ( not ( = ?auto_101944 ?auto_101948 ) ) ( not ( = ?auto_101945 ?auto_101946 ) ) ( not ( = ?auto_101945 ?auto_101948 ) ) ( not ( = ?auto_101949 ?auto_101946 ) ) ( not ( = ?auto_101949 ?auto_101948 ) ) ( not ( = ?auto_101946 ?auto_101948 ) ) ( ON ?auto_101946 ?auto_101949 ) ( not ( = ?auto_101947 ?auto_101948 ) ) ( not ( = ?auto_101942 ?auto_101947 ) ) ( not ( = ?auto_101943 ?auto_101947 ) ) ( not ( = ?auto_101944 ?auto_101947 ) ) ( not ( = ?auto_101945 ?auto_101947 ) ) ( not ( = ?auto_101949 ?auto_101947 ) ) ( not ( = ?auto_101946 ?auto_101947 ) ) ( ON ?auto_101948 ?auto_101946 ) ( ON ?auto_101947 ?auto_101948 ) ( CLEAR ?auto_101947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_101942 ?auto_101943 ?auto_101944 ?auto_101945 ?auto_101949 ?auto_101946 ?auto_101948 )
      ( MAKE-4PILE ?auto_101942 ?auto_101943 ?auto_101944 ?auto_101945 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101954 - BLOCK
      ?auto_101955 - BLOCK
      ?auto_101956 - BLOCK
      ?auto_101957 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_101957 ) ( CLEAR ?auto_101956 ) ( ON-TABLE ?auto_101954 ) ( ON ?auto_101955 ?auto_101954 ) ( ON ?auto_101956 ?auto_101955 ) ( not ( = ?auto_101954 ?auto_101955 ) ) ( not ( = ?auto_101954 ?auto_101956 ) ) ( not ( = ?auto_101954 ?auto_101957 ) ) ( not ( = ?auto_101955 ?auto_101956 ) ) ( not ( = ?auto_101955 ?auto_101957 ) ) ( not ( = ?auto_101956 ?auto_101957 ) ) )
    :subtasks
    ( ( !STACK ?auto_101957 ?auto_101956 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101958 - BLOCK
      ?auto_101959 - BLOCK
      ?auto_101960 - BLOCK
      ?auto_101961 - BLOCK
    )
    :vars
    (
      ?auto_101962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_101960 ) ( ON-TABLE ?auto_101958 ) ( ON ?auto_101959 ?auto_101958 ) ( ON ?auto_101960 ?auto_101959 ) ( not ( = ?auto_101958 ?auto_101959 ) ) ( not ( = ?auto_101958 ?auto_101960 ) ) ( not ( = ?auto_101958 ?auto_101961 ) ) ( not ( = ?auto_101959 ?auto_101960 ) ) ( not ( = ?auto_101959 ?auto_101961 ) ) ( not ( = ?auto_101960 ?auto_101961 ) ) ( ON ?auto_101961 ?auto_101962 ) ( CLEAR ?auto_101961 ) ( HAND-EMPTY ) ( not ( = ?auto_101958 ?auto_101962 ) ) ( not ( = ?auto_101959 ?auto_101962 ) ) ( not ( = ?auto_101960 ?auto_101962 ) ) ( not ( = ?auto_101961 ?auto_101962 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_101961 ?auto_101962 )
      ( MAKE-4PILE ?auto_101958 ?auto_101959 ?auto_101960 ?auto_101961 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101963 - BLOCK
      ?auto_101964 - BLOCK
      ?auto_101965 - BLOCK
      ?auto_101966 - BLOCK
    )
    :vars
    (
      ?auto_101967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101963 ) ( ON ?auto_101964 ?auto_101963 ) ( not ( = ?auto_101963 ?auto_101964 ) ) ( not ( = ?auto_101963 ?auto_101965 ) ) ( not ( = ?auto_101963 ?auto_101966 ) ) ( not ( = ?auto_101964 ?auto_101965 ) ) ( not ( = ?auto_101964 ?auto_101966 ) ) ( not ( = ?auto_101965 ?auto_101966 ) ) ( ON ?auto_101966 ?auto_101967 ) ( CLEAR ?auto_101966 ) ( not ( = ?auto_101963 ?auto_101967 ) ) ( not ( = ?auto_101964 ?auto_101967 ) ) ( not ( = ?auto_101965 ?auto_101967 ) ) ( not ( = ?auto_101966 ?auto_101967 ) ) ( HOLDING ?auto_101965 ) ( CLEAR ?auto_101964 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_101963 ?auto_101964 ?auto_101965 )
      ( MAKE-4PILE ?auto_101963 ?auto_101964 ?auto_101965 ?auto_101966 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101968 - BLOCK
      ?auto_101969 - BLOCK
      ?auto_101970 - BLOCK
      ?auto_101971 - BLOCK
    )
    :vars
    (
      ?auto_101972 - BLOCK
      ?auto_101975 - BLOCK
      ?auto_101974 - BLOCK
      ?auto_101973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101968 ) ( ON ?auto_101969 ?auto_101968 ) ( not ( = ?auto_101968 ?auto_101969 ) ) ( not ( = ?auto_101968 ?auto_101970 ) ) ( not ( = ?auto_101968 ?auto_101971 ) ) ( not ( = ?auto_101969 ?auto_101970 ) ) ( not ( = ?auto_101969 ?auto_101971 ) ) ( not ( = ?auto_101970 ?auto_101971 ) ) ( ON ?auto_101971 ?auto_101972 ) ( not ( = ?auto_101968 ?auto_101972 ) ) ( not ( = ?auto_101969 ?auto_101972 ) ) ( not ( = ?auto_101970 ?auto_101972 ) ) ( not ( = ?auto_101971 ?auto_101972 ) ) ( CLEAR ?auto_101969 ) ( ON ?auto_101970 ?auto_101971 ) ( CLEAR ?auto_101970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_101975 ) ( ON ?auto_101974 ?auto_101975 ) ( ON ?auto_101973 ?auto_101974 ) ( ON ?auto_101972 ?auto_101973 ) ( not ( = ?auto_101975 ?auto_101974 ) ) ( not ( = ?auto_101975 ?auto_101973 ) ) ( not ( = ?auto_101975 ?auto_101972 ) ) ( not ( = ?auto_101975 ?auto_101971 ) ) ( not ( = ?auto_101975 ?auto_101970 ) ) ( not ( = ?auto_101974 ?auto_101973 ) ) ( not ( = ?auto_101974 ?auto_101972 ) ) ( not ( = ?auto_101974 ?auto_101971 ) ) ( not ( = ?auto_101974 ?auto_101970 ) ) ( not ( = ?auto_101973 ?auto_101972 ) ) ( not ( = ?auto_101973 ?auto_101971 ) ) ( not ( = ?auto_101973 ?auto_101970 ) ) ( not ( = ?auto_101968 ?auto_101975 ) ) ( not ( = ?auto_101968 ?auto_101974 ) ) ( not ( = ?auto_101968 ?auto_101973 ) ) ( not ( = ?auto_101969 ?auto_101975 ) ) ( not ( = ?auto_101969 ?auto_101974 ) ) ( not ( = ?auto_101969 ?auto_101973 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_101975 ?auto_101974 ?auto_101973 ?auto_101972 ?auto_101971 )
      ( MAKE-4PILE ?auto_101968 ?auto_101969 ?auto_101970 ?auto_101971 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101976 - BLOCK
      ?auto_101977 - BLOCK
      ?auto_101978 - BLOCK
      ?auto_101979 - BLOCK
    )
    :vars
    (
      ?auto_101983 - BLOCK
      ?auto_101982 - BLOCK
      ?auto_101981 - BLOCK
      ?auto_101980 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101976 ) ( not ( = ?auto_101976 ?auto_101977 ) ) ( not ( = ?auto_101976 ?auto_101978 ) ) ( not ( = ?auto_101976 ?auto_101979 ) ) ( not ( = ?auto_101977 ?auto_101978 ) ) ( not ( = ?auto_101977 ?auto_101979 ) ) ( not ( = ?auto_101978 ?auto_101979 ) ) ( ON ?auto_101979 ?auto_101983 ) ( not ( = ?auto_101976 ?auto_101983 ) ) ( not ( = ?auto_101977 ?auto_101983 ) ) ( not ( = ?auto_101978 ?auto_101983 ) ) ( not ( = ?auto_101979 ?auto_101983 ) ) ( ON ?auto_101978 ?auto_101979 ) ( CLEAR ?auto_101978 ) ( ON-TABLE ?auto_101982 ) ( ON ?auto_101981 ?auto_101982 ) ( ON ?auto_101980 ?auto_101981 ) ( ON ?auto_101983 ?auto_101980 ) ( not ( = ?auto_101982 ?auto_101981 ) ) ( not ( = ?auto_101982 ?auto_101980 ) ) ( not ( = ?auto_101982 ?auto_101983 ) ) ( not ( = ?auto_101982 ?auto_101979 ) ) ( not ( = ?auto_101982 ?auto_101978 ) ) ( not ( = ?auto_101981 ?auto_101980 ) ) ( not ( = ?auto_101981 ?auto_101983 ) ) ( not ( = ?auto_101981 ?auto_101979 ) ) ( not ( = ?auto_101981 ?auto_101978 ) ) ( not ( = ?auto_101980 ?auto_101983 ) ) ( not ( = ?auto_101980 ?auto_101979 ) ) ( not ( = ?auto_101980 ?auto_101978 ) ) ( not ( = ?auto_101976 ?auto_101982 ) ) ( not ( = ?auto_101976 ?auto_101981 ) ) ( not ( = ?auto_101976 ?auto_101980 ) ) ( not ( = ?auto_101977 ?auto_101982 ) ) ( not ( = ?auto_101977 ?auto_101981 ) ) ( not ( = ?auto_101977 ?auto_101980 ) ) ( HOLDING ?auto_101977 ) ( CLEAR ?auto_101976 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_101976 ?auto_101977 )
      ( MAKE-4PILE ?auto_101976 ?auto_101977 ?auto_101978 ?auto_101979 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101984 - BLOCK
      ?auto_101985 - BLOCK
      ?auto_101986 - BLOCK
      ?auto_101987 - BLOCK
    )
    :vars
    (
      ?auto_101988 - BLOCK
      ?auto_101989 - BLOCK
      ?auto_101990 - BLOCK
      ?auto_101991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_101984 ) ( not ( = ?auto_101984 ?auto_101985 ) ) ( not ( = ?auto_101984 ?auto_101986 ) ) ( not ( = ?auto_101984 ?auto_101987 ) ) ( not ( = ?auto_101985 ?auto_101986 ) ) ( not ( = ?auto_101985 ?auto_101987 ) ) ( not ( = ?auto_101986 ?auto_101987 ) ) ( ON ?auto_101987 ?auto_101988 ) ( not ( = ?auto_101984 ?auto_101988 ) ) ( not ( = ?auto_101985 ?auto_101988 ) ) ( not ( = ?auto_101986 ?auto_101988 ) ) ( not ( = ?auto_101987 ?auto_101988 ) ) ( ON ?auto_101986 ?auto_101987 ) ( ON-TABLE ?auto_101989 ) ( ON ?auto_101990 ?auto_101989 ) ( ON ?auto_101991 ?auto_101990 ) ( ON ?auto_101988 ?auto_101991 ) ( not ( = ?auto_101989 ?auto_101990 ) ) ( not ( = ?auto_101989 ?auto_101991 ) ) ( not ( = ?auto_101989 ?auto_101988 ) ) ( not ( = ?auto_101989 ?auto_101987 ) ) ( not ( = ?auto_101989 ?auto_101986 ) ) ( not ( = ?auto_101990 ?auto_101991 ) ) ( not ( = ?auto_101990 ?auto_101988 ) ) ( not ( = ?auto_101990 ?auto_101987 ) ) ( not ( = ?auto_101990 ?auto_101986 ) ) ( not ( = ?auto_101991 ?auto_101988 ) ) ( not ( = ?auto_101991 ?auto_101987 ) ) ( not ( = ?auto_101991 ?auto_101986 ) ) ( not ( = ?auto_101984 ?auto_101989 ) ) ( not ( = ?auto_101984 ?auto_101990 ) ) ( not ( = ?auto_101984 ?auto_101991 ) ) ( not ( = ?auto_101985 ?auto_101989 ) ) ( not ( = ?auto_101985 ?auto_101990 ) ) ( not ( = ?auto_101985 ?auto_101991 ) ) ( CLEAR ?auto_101984 ) ( ON ?auto_101985 ?auto_101986 ) ( CLEAR ?auto_101985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_101989 ?auto_101990 ?auto_101991 ?auto_101988 ?auto_101987 ?auto_101986 )
      ( MAKE-4PILE ?auto_101984 ?auto_101985 ?auto_101986 ?auto_101987 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_101992 - BLOCK
      ?auto_101993 - BLOCK
      ?auto_101994 - BLOCK
      ?auto_101995 - BLOCK
    )
    :vars
    (
      ?auto_101998 - BLOCK
      ?auto_101999 - BLOCK
      ?auto_101996 - BLOCK
      ?auto_101997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_101992 ?auto_101993 ) ) ( not ( = ?auto_101992 ?auto_101994 ) ) ( not ( = ?auto_101992 ?auto_101995 ) ) ( not ( = ?auto_101993 ?auto_101994 ) ) ( not ( = ?auto_101993 ?auto_101995 ) ) ( not ( = ?auto_101994 ?auto_101995 ) ) ( ON ?auto_101995 ?auto_101998 ) ( not ( = ?auto_101992 ?auto_101998 ) ) ( not ( = ?auto_101993 ?auto_101998 ) ) ( not ( = ?auto_101994 ?auto_101998 ) ) ( not ( = ?auto_101995 ?auto_101998 ) ) ( ON ?auto_101994 ?auto_101995 ) ( ON-TABLE ?auto_101999 ) ( ON ?auto_101996 ?auto_101999 ) ( ON ?auto_101997 ?auto_101996 ) ( ON ?auto_101998 ?auto_101997 ) ( not ( = ?auto_101999 ?auto_101996 ) ) ( not ( = ?auto_101999 ?auto_101997 ) ) ( not ( = ?auto_101999 ?auto_101998 ) ) ( not ( = ?auto_101999 ?auto_101995 ) ) ( not ( = ?auto_101999 ?auto_101994 ) ) ( not ( = ?auto_101996 ?auto_101997 ) ) ( not ( = ?auto_101996 ?auto_101998 ) ) ( not ( = ?auto_101996 ?auto_101995 ) ) ( not ( = ?auto_101996 ?auto_101994 ) ) ( not ( = ?auto_101997 ?auto_101998 ) ) ( not ( = ?auto_101997 ?auto_101995 ) ) ( not ( = ?auto_101997 ?auto_101994 ) ) ( not ( = ?auto_101992 ?auto_101999 ) ) ( not ( = ?auto_101992 ?auto_101996 ) ) ( not ( = ?auto_101992 ?auto_101997 ) ) ( not ( = ?auto_101993 ?auto_101999 ) ) ( not ( = ?auto_101993 ?auto_101996 ) ) ( not ( = ?auto_101993 ?auto_101997 ) ) ( ON ?auto_101993 ?auto_101994 ) ( CLEAR ?auto_101993 ) ( HOLDING ?auto_101992 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_101992 )
      ( MAKE-4PILE ?auto_101992 ?auto_101993 ?auto_101994 ?auto_101995 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102000 - BLOCK
      ?auto_102001 - BLOCK
      ?auto_102002 - BLOCK
      ?auto_102003 - BLOCK
    )
    :vars
    (
      ?auto_102004 - BLOCK
      ?auto_102007 - BLOCK
      ?auto_102005 - BLOCK
      ?auto_102006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102000 ?auto_102001 ) ) ( not ( = ?auto_102000 ?auto_102002 ) ) ( not ( = ?auto_102000 ?auto_102003 ) ) ( not ( = ?auto_102001 ?auto_102002 ) ) ( not ( = ?auto_102001 ?auto_102003 ) ) ( not ( = ?auto_102002 ?auto_102003 ) ) ( ON ?auto_102003 ?auto_102004 ) ( not ( = ?auto_102000 ?auto_102004 ) ) ( not ( = ?auto_102001 ?auto_102004 ) ) ( not ( = ?auto_102002 ?auto_102004 ) ) ( not ( = ?auto_102003 ?auto_102004 ) ) ( ON ?auto_102002 ?auto_102003 ) ( ON-TABLE ?auto_102007 ) ( ON ?auto_102005 ?auto_102007 ) ( ON ?auto_102006 ?auto_102005 ) ( ON ?auto_102004 ?auto_102006 ) ( not ( = ?auto_102007 ?auto_102005 ) ) ( not ( = ?auto_102007 ?auto_102006 ) ) ( not ( = ?auto_102007 ?auto_102004 ) ) ( not ( = ?auto_102007 ?auto_102003 ) ) ( not ( = ?auto_102007 ?auto_102002 ) ) ( not ( = ?auto_102005 ?auto_102006 ) ) ( not ( = ?auto_102005 ?auto_102004 ) ) ( not ( = ?auto_102005 ?auto_102003 ) ) ( not ( = ?auto_102005 ?auto_102002 ) ) ( not ( = ?auto_102006 ?auto_102004 ) ) ( not ( = ?auto_102006 ?auto_102003 ) ) ( not ( = ?auto_102006 ?auto_102002 ) ) ( not ( = ?auto_102000 ?auto_102007 ) ) ( not ( = ?auto_102000 ?auto_102005 ) ) ( not ( = ?auto_102000 ?auto_102006 ) ) ( not ( = ?auto_102001 ?auto_102007 ) ) ( not ( = ?auto_102001 ?auto_102005 ) ) ( not ( = ?auto_102001 ?auto_102006 ) ) ( ON ?auto_102001 ?auto_102002 ) ( ON ?auto_102000 ?auto_102001 ) ( CLEAR ?auto_102000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102007 ?auto_102005 ?auto_102006 ?auto_102004 ?auto_102003 ?auto_102002 ?auto_102001 )
      ( MAKE-4PILE ?auto_102000 ?auto_102001 ?auto_102002 ?auto_102003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102011 - BLOCK
      ?auto_102012 - BLOCK
      ?auto_102013 - BLOCK
    )
    :vars
    (
      ?auto_102014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102014 ?auto_102013 ) ( CLEAR ?auto_102014 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102011 ) ( ON ?auto_102012 ?auto_102011 ) ( ON ?auto_102013 ?auto_102012 ) ( not ( = ?auto_102011 ?auto_102012 ) ) ( not ( = ?auto_102011 ?auto_102013 ) ) ( not ( = ?auto_102011 ?auto_102014 ) ) ( not ( = ?auto_102012 ?auto_102013 ) ) ( not ( = ?auto_102012 ?auto_102014 ) ) ( not ( = ?auto_102013 ?auto_102014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102014 ?auto_102013 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102015 - BLOCK
      ?auto_102016 - BLOCK
      ?auto_102017 - BLOCK
    )
    :vars
    (
      ?auto_102018 - BLOCK
      ?auto_102019 - BLOCK
      ?auto_102020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102018 ?auto_102017 ) ( CLEAR ?auto_102018 ) ( ON-TABLE ?auto_102015 ) ( ON ?auto_102016 ?auto_102015 ) ( ON ?auto_102017 ?auto_102016 ) ( not ( = ?auto_102015 ?auto_102016 ) ) ( not ( = ?auto_102015 ?auto_102017 ) ) ( not ( = ?auto_102015 ?auto_102018 ) ) ( not ( = ?auto_102016 ?auto_102017 ) ) ( not ( = ?auto_102016 ?auto_102018 ) ) ( not ( = ?auto_102017 ?auto_102018 ) ) ( HOLDING ?auto_102019 ) ( CLEAR ?auto_102020 ) ( not ( = ?auto_102015 ?auto_102019 ) ) ( not ( = ?auto_102015 ?auto_102020 ) ) ( not ( = ?auto_102016 ?auto_102019 ) ) ( not ( = ?auto_102016 ?auto_102020 ) ) ( not ( = ?auto_102017 ?auto_102019 ) ) ( not ( = ?auto_102017 ?auto_102020 ) ) ( not ( = ?auto_102018 ?auto_102019 ) ) ( not ( = ?auto_102018 ?auto_102020 ) ) ( not ( = ?auto_102019 ?auto_102020 ) ) )
    :subtasks
    ( ( !STACK ?auto_102019 ?auto_102020 )
      ( MAKE-3PILE ?auto_102015 ?auto_102016 ?auto_102017 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102021 - BLOCK
      ?auto_102022 - BLOCK
      ?auto_102023 - BLOCK
    )
    :vars
    (
      ?auto_102024 - BLOCK
      ?auto_102026 - BLOCK
      ?auto_102025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102024 ?auto_102023 ) ( ON-TABLE ?auto_102021 ) ( ON ?auto_102022 ?auto_102021 ) ( ON ?auto_102023 ?auto_102022 ) ( not ( = ?auto_102021 ?auto_102022 ) ) ( not ( = ?auto_102021 ?auto_102023 ) ) ( not ( = ?auto_102021 ?auto_102024 ) ) ( not ( = ?auto_102022 ?auto_102023 ) ) ( not ( = ?auto_102022 ?auto_102024 ) ) ( not ( = ?auto_102023 ?auto_102024 ) ) ( CLEAR ?auto_102026 ) ( not ( = ?auto_102021 ?auto_102025 ) ) ( not ( = ?auto_102021 ?auto_102026 ) ) ( not ( = ?auto_102022 ?auto_102025 ) ) ( not ( = ?auto_102022 ?auto_102026 ) ) ( not ( = ?auto_102023 ?auto_102025 ) ) ( not ( = ?auto_102023 ?auto_102026 ) ) ( not ( = ?auto_102024 ?auto_102025 ) ) ( not ( = ?auto_102024 ?auto_102026 ) ) ( not ( = ?auto_102025 ?auto_102026 ) ) ( ON ?auto_102025 ?auto_102024 ) ( CLEAR ?auto_102025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102021 ?auto_102022 ?auto_102023 ?auto_102024 )
      ( MAKE-3PILE ?auto_102021 ?auto_102022 ?auto_102023 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102027 - BLOCK
      ?auto_102028 - BLOCK
      ?auto_102029 - BLOCK
    )
    :vars
    (
      ?auto_102031 - BLOCK
      ?auto_102030 - BLOCK
      ?auto_102032 - BLOCK
      ?auto_102034 - BLOCK
      ?auto_102033 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102031 ?auto_102029 ) ( ON-TABLE ?auto_102027 ) ( ON ?auto_102028 ?auto_102027 ) ( ON ?auto_102029 ?auto_102028 ) ( not ( = ?auto_102027 ?auto_102028 ) ) ( not ( = ?auto_102027 ?auto_102029 ) ) ( not ( = ?auto_102027 ?auto_102031 ) ) ( not ( = ?auto_102028 ?auto_102029 ) ) ( not ( = ?auto_102028 ?auto_102031 ) ) ( not ( = ?auto_102029 ?auto_102031 ) ) ( not ( = ?auto_102027 ?auto_102030 ) ) ( not ( = ?auto_102027 ?auto_102032 ) ) ( not ( = ?auto_102028 ?auto_102030 ) ) ( not ( = ?auto_102028 ?auto_102032 ) ) ( not ( = ?auto_102029 ?auto_102030 ) ) ( not ( = ?auto_102029 ?auto_102032 ) ) ( not ( = ?auto_102031 ?auto_102030 ) ) ( not ( = ?auto_102031 ?auto_102032 ) ) ( not ( = ?auto_102030 ?auto_102032 ) ) ( ON ?auto_102030 ?auto_102031 ) ( CLEAR ?auto_102030 ) ( HOLDING ?auto_102032 ) ( CLEAR ?auto_102034 ) ( ON-TABLE ?auto_102033 ) ( ON ?auto_102034 ?auto_102033 ) ( not ( = ?auto_102033 ?auto_102034 ) ) ( not ( = ?auto_102033 ?auto_102032 ) ) ( not ( = ?auto_102034 ?auto_102032 ) ) ( not ( = ?auto_102027 ?auto_102034 ) ) ( not ( = ?auto_102027 ?auto_102033 ) ) ( not ( = ?auto_102028 ?auto_102034 ) ) ( not ( = ?auto_102028 ?auto_102033 ) ) ( not ( = ?auto_102029 ?auto_102034 ) ) ( not ( = ?auto_102029 ?auto_102033 ) ) ( not ( = ?auto_102031 ?auto_102034 ) ) ( not ( = ?auto_102031 ?auto_102033 ) ) ( not ( = ?auto_102030 ?auto_102034 ) ) ( not ( = ?auto_102030 ?auto_102033 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102033 ?auto_102034 ?auto_102032 )
      ( MAKE-3PILE ?auto_102027 ?auto_102028 ?auto_102029 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102035 - BLOCK
      ?auto_102036 - BLOCK
      ?auto_102037 - BLOCK
    )
    :vars
    (
      ?auto_102041 - BLOCK
      ?auto_102039 - BLOCK
      ?auto_102042 - BLOCK
      ?auto_102038 - BLOCK
      ?auto_102040 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102041 ?auto_102037 ) ( ON-TABLE ?auto_102035 ) ( ON ?auto_102036 ?auto_102035 ) ( ON ?auto_102037 ?auto_102036 ) ( not ( = ?auto_102035 ?auto_102036 ) ) ( not ( = ?auto_102035 ?auto_102037 ) ) ( not ( = ?auto_102035 ?auto_102041 ) ) ( not ( = ?auto_102036 ?auto_102037 ) ) ( not ( = ?auto_102036 ?auto_102041 ) ) ( not ( = ?auto_102037 ?auto_102041 ) ) ( not ( = ?auto_102035 ?auto_102039 ) ) ( not ( = ?auto_102035 ?auto_102042 ) ) ( not ( = ?auto_102036 ?auto_102039 ) ) ( not ( = ?auto_102036 ?auto_102042 ) ) ( not ( = ?auto_102037 ?auto_102039 ) ) ( not ( = ?auto_102037 ?auto_102042 ) ) ( not ( = ?auto_102041 ?auto_102039 ) ) ( not ( = ?auto_102041 ?auto_102042 ) ) ( not ( = ?auto_102039 ?auto_102042 ) ) ( ON ?auto_102039 ?auto_102041 ) ( CLEAR ?auto_102038 ) ( ON-TABLE ?auto_102040 ) ( ON ?auto_102038 ?auto_102040 ) ( not ( = ?auto_102040 ?auto_102038 ) ) ( not ( = ?auto_102040 ?auto_102042 ) ) ( not ( = ?auto_102038 ?auto_102042 ) ) ( not ( = ?auto_102035 ?auto_102038 ) ) ( not ( = ?auto_102035 ?auto_102040 ) ) ( not ( = ?auto_102036 ?auto_102038 ) ) ( not ( = ?auto_102036 ?auto_102040 ) ) ( not ( = ?auto_102037 ?auto_102038 ) ) ( not ( = ?auto_102037 ?auto_102040 ) ) ( not ( = ?auto_102041 ?auto_102038 ) ) ( not ( = ?auto_102041 ?auto_102040 ) ) ( not ( = ?auto_102039 ?auto_102038 ) ) ( not ( = ?auto_102039 ?auto_102040 ) ) ( ON ?auto_102042 ?auto_102039 ) ( CLEAR ?auto_102042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102035 ?auto_102036 ?auto_102037 ?auto_102041 ?auto_102039 )
      ( MAKE-3PILE ?auto_102035 ?auto_102036 ?auto_102037 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102043 - BLOCK
      ?auto_102044 - BLOCK
      ?auto_102045 - BLOCK
    )
    :vars
    (
      ?auto_102048 - BLOCK
      ?auto_102049 - BLOCK
      ?auto_102047 - BLOCK
      ?auto_102046 - BLOCK
      ?auto_102050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102048 ?auto_102045 ) ( ON-TABLE ?auto_102043 ) ( ON ?auto_102044 ?auto_102043 ) ( ON ?auto_102045 ?auto_102044 ) ( not ( = ?auto_102043 ?auto_102044 ) ) ( not ( = ?auto_102043 ?auto_102045 ) ) ( not ( = ?auto_102043 ?auto_102048 ) ) ( not ( = ?auto_102044 ?auto_102045 ) ) ( not ( = ?auto_102044 ?auto_102048 ) ) ( not ( = ?auto_102045 ?auto_102048 ) ) ( not ( = ?auto_102043 ?auto_102049 ) ) ( not ( = ?auto_102043 ?auto_102047 ) ) ( not ( = ?auto_102044 ?auto_102049 ) ) ( not ( = ?auto_102044 ?auto_102047 ) ) ( not ( = ?auto_102045 ?auto_102049 ) ) ( not ( = ?auto_102045 ?auto_102047 ) ) ( not ( = ?auto_102048 ?auto_102049 ) ) ( not ( = ?auto_102048 ?auto_102047 ) ) ( not ( = ?auto_102049 ?auto_102047 ) ) ( ON ?auto_102049 ?auto_102048 ) ( ON-TABLE ?auto_102046 ) ( not ( = ?auto_102046 ?auto_102050 ) ) ( not ( = ?auto_102046 ?auto_102047 ) ) ( not ( = ?auto_102050 ?auto_102047 ) ) ( not ( = ?auto_102043 ?auto_102050 ) ) ( not ( = ?auto_102043 ?auto_102046 ) ) ( not ( = ?auto_102044 ?auto_102050 ) ) ( not ( = ?auto_102044 ?auto_102046 ) ) ( not ( = ?auto_102045 ?auto_102050 ) ) ( not ( = ?auto_102045 ?auto_102046 ) ) ( not ( = ?auto_102048 ?auto_102050 ) ) ( not ( = ?auto_102048 ?auto_102046 ) ) ( not ( = ?auto_102049 ?auto_102050 ) ) ( not ( = ?auto_102049 ?auto_102046 ) ) ( ON ?auto_102047 ?auto_102049 ) ( CLEAR ?auto_102047 ) ( HOLDING ?auto_102050 ) ( CLEAR ?auto_102046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102046 ?auto_102050 )
      ( MAKE-3PILE ?auto_102043 ?auto_102044 ?auto_102045 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103228 - BLOCK
      ?auto_103229 - BLOCK
      ?auto_103230 - BLOCK
    )
    :vars
    (
      ?auto_103234 - BLOCK
      ?auto_103233 - BLOCK
      ?auto_103231 - BLOCK
      ?auto_103232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103234 ?auto_103230 ) ( ON-TABLE ?auto_103228 ) ( ON ?auto_103229 ?auto_103228 ) ( ON ?auto_103230 ?auto_103229 ) ( not ( = ?auto_103228 ?auto_103229 ) ) ( not ( = ?auto_103228 ?auto_103230 ) ) ( not ( = ?auto_103228 ?auto_103234 ) ) ( not ( = ?auto_103229 ?auto_103230 ) ) ( not ( = ?auto_103229 ?auto_103234 ) ) ( not ( = ?auto_103230 ?auto_103234 ) ) ( not ( = ?auto_103228 ?auto_103233 ) ) ( not ( = ?auto_103228 ?auto_103231 ) ) ( not ( = ?auto_103229 ?auto_103233 ) ) ( not ( = ?auto_103229 ?auto_103231 ) ) ( not ( = ?auto_103230 ?auto_103233 ) ) ( not ( = ?auto_103230 ?auto_103231 ) ) ( not ( = ?auto_103234 ?auto_103233 ) ) ( not ( = ?auto_103234 ?auto_103231 ) ) ( not ( = ?auto_103233 ?auto_103231 ) ) ( ON ?auto_103233 ?auto_103234 ) ( not ( = ?auto_103232 ?auto_103231 ) ) ( not ( = ?auto_103228 ?auto_103232 ) ) ( not ( = ?auto_103229 ?auto_103232 ) ) ( not ( = ?auto_103230 ?auto_103232 ) ) ( not ( = ?auto_103234 ?auto_103232 ) ) ( not ( = ?auto_103233 ?auto_103232 ) ) ( ON ?auto_103231 ?auto_103233 ) ( ON ?auto_103232 ?auto_103231 ) ( CLEAR ?auto_103232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103228 ?auto_103229 ?auto_103230 ?auto_103234 ?auto_103233 ?auto_103231 )
      ( MAKE-3PILE ?auto_103228 ?auto_103229 ?auto_103230 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102059 - BLOCK
      ?auto_102060 - BLOCK
      ?auto_102061 - BLOCK
    )
    :vars
    (
      ?auto_102064 - BLOCK
      ?auto_102063 - BLOCK
      ?auto_102062 - BLOCK
      ?auto_102066 - BLOCK
      ?auto_102065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102064 ?auto_102061 ) ( ON-TABLE ?auto_102059 ) ( ON ?auto_102060 ?auto_102059 ) ( ON ?auto_102061 ?auto_102060 ) ( not ( = ?auto_102059 ?auto_102060 ) ) ( not ( = ?auto_102059 ?auto_102061 ) ) ( not ( = ?auto_102059 ?auto_102064 ) ) ( not ( = ?auto_102060 ?auto_102061 ) ) ( not ( = ?auto_102060 ?auto_102064 ) ) ( not ( = ?auto_102061 ?auto_102064 ) ) ( not ( = ?auto_102059 ?auto_102063 ) ) ( not ( = ?auto_102059 ?auto_102062 ) ) ( not ( = ?auto_102060 ?auto_102063 ) ) ( not ( = ?auto_102060 ?auto_102062 ) ) ( not ( = ?auto_102061 ?auto_102063 ) ) ( not ( = ?auto_102061 ?auto_102062 ) ) ( not ( = ?auto_102064 ?auto_102063 ) ) ( not ( = ?auto_102064 ?auto_102062 ) ) ( not ( = ?auto_102063 ?auto_102062 ) ) ( ON ?auto_102063 ?auto_102064 ) ( not ( = ?auto_102066 ?auto_102065 ) ) ( not ( = ?auto_102066 ?auto_102062 ) ) ( not ( = ?auto_102065 ?auto_102062 ) ) ( not ( = ?auto_102059 ?auto_102065 ) ) ( not ( = ?auto_102059 ?auto_102066 ) ) ( not ( = ?auto_102060 ?auto_102065 ) ) ( not ( = ?auto_102060 ?auto_102066 ) ) ( not ( = ?auto_102061 ?auto_102065 ) ) ( not ( = ?auto_102061 ?auto_102066 ) ) ( not ( = ?auto_102064 ?auto_102065 ) ) ( not ( = ?auto_102064 ?auto_102066 ) ) ( not ( = ?auto_102063 ?auto_102065 ) ) ( not ( = ?auto_102063 ?auto_102066 ) ) ( ON ?auto_102062 ?auto_102063 ) ( ON ?auto_102065 ?auto_102062 ) ( CLEAR ?auto_102065 ) ( HOLDING ?auto_102066 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102066 )
      ( MAKE-3PILE ?auto_102059 ?auto_102060 ?auto_102061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_102067 - BLOCK
      ?auto_102068 - BLOCK
      ?auto_102069 - BLOCK
    )
    :vars
    (
      ?auto_102074 - BLOCK
      ?auto_102071 - BLOCK
      ?auto_102073 - BLOCK
      ?auto_102072 - BLOCK
      ?auto_102070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102074 ?auto_102069 ) ( ON-TABLE ?auto_102067 ) ( ON ?auto_102068 ?auto_102067 ) ( ON ?auto_102069 ?auto_102068 ) ( not ( = ?auto_102067 ?auto_102068 ) ) ( not ( = ?auto_102067 ?auto_102069 ) ) ( not ( = ?auto_102067 ?auto_102074 ) ) ( not ( = ?auto_102068 ?auto_102069 ) ) ( not ( = ?auto_102068 ?auto_102074 ) ) ( not ( = ?auto_102069 ?auto_102074 ) ) ( not ( = ?auto_102067 ?auto_102071 ) ) ( not ( = ?auto_102067 ?auto_102073 ) ) ( not ( = ?auto_102068 ?auto_102071 ) ) ( not ( = ?auto_102068 ?auto_102073 ) ) ( not ( = ?auto_102069 ?auto_102071 ) ) ( not ( = ?auto_102069 ?auto_102073 ) ) ( not ( = ?auto_102074 ?auto_102071 ) ) ( not ( = ?auto_102074 ?auto_102073 ) ) ( not ( = ?auto_102071 ?auto_102073 ) ) ( ON ?auto_102071 ?auto_102074 ) ( not ( = ?auto_102072 ?auto_102070 ) ) ( not ( = ?auto_102072 ?auto_102073 ) ) ( not ( = ?auto_102070 ?auto_102073 ) ) ( not ( = ?auto_102067 ?auto_102070 ) ) ( not ( = ?auto_102067 ?auto_102072 ) ) ( not ( = ?auto_102068 ?auto_102070 ) ) ( not ( = ?auto_102068 ?auto_102072 ) ) ( not ( = ?auto_102069 ?auto_102070 ) ) ( not ( = ?auto_102069 ?auto_102072 ) ) ( not ( = ?auto_102074 ?auto_102070 ) ) ( not ( = ?auto_102074 ?auto_102072 ) ) ( not ( = ?auto_102071 ?auto_102070 ) ) ( not ( = ?auto_102071 ?auto_102072 ) ) ( ON ?auto_102073 ?auto_102071 ) ( ON ?auto_102070 ?auto_102073 ) ( ON ?auto_102072 ?auto_102070 ) ( CLEAR ?auto_102072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102067 ?auto_102068 ?auto_102069 ?auto_102074 ?auto_102071 ?auto_102073 ?auto_102070 )
      ( MAKE-3PILE ?auto_102067 ?auto_102068 ?auto_102069 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102080 - BLOCK
      ?auto_102081 - BLOCK
      ?auto_102082 - BLOCK
      ?auto_102083 - BLOCK
      ?auto_102084 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102084 ) ( CLEAR ?auto_102083 ) ( ON-TABLE ?auto_102080 ) ( ON ?auto_102081 ?auto_102080 ) ( ON ?auto_102082 ?auto_102081 ) ( ON ?auto_102083 ?auto_102082 ) ( not ( = ?auto_102080 ?auto_102081 ) ) ( not ( = ?auto_102080 ?auto_102082 ) ) ( not ( = ?auto_102080 ?auto_102083 ) ) ( not ( = ?auto_102080 ?auto_102084 ) ) ( not ( = ?auto_102081 ?auto_102082 ) ) ( not ( = ?auto_102081 ?auto_102083 ) ) ( not ( = ?auto_102081 ?auto_102084 ) ) ( not ( = ?auto_102082 ?auto_102083 ) ) ( not ( = ?auto_102082 ?auto_102084 ) ) ( not ( = ?auto_102083 ?auto_102084 ) ) )
    :subtasks
    ( ( !STACK ?auto_102084 ?auto_102083 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102085 - BLOCK
      ?auto_102086 - BLOCK
      ?auto_102087 - BLOCK
      ?auto_102088 - BLOCK
      ?auto_102089 - BLOCK
    )
    :vars
    (
      ?auto_102090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102088 ) ( ON-TABLE ?auto_102085 ) ( ON ?auto_102086 ?auto_102085 ) ( ON ?auto_102087 ?auto_102086 ) ( ON ?auto_102088 ?auto_102087 ) ( not ( = ?auto_102085 ?auto_102086 ) ) ( not ( = ?auto_102085 ?auto_102087 ) ) ( not ( = ?auto_102085 ?auto_102088 ) ) ( not ( = ?auto_102085 ?auto_102089 ) ) ( not ( = ?auto_102086 ?auto_102087 ) ) ( not ( = ?auto_102086 ?auto_102088 ) ) ( not ( = ?auto_102086 ?auto_102089 ) ) ( not ( = ?auto_102087 ?auto_102088 ) ) ( not ( = ?auto_102087 ?auto_102089 ) ) ( not ( = ?auto_102088 ?auto_102089 ) ) ( ON ?auto_102089 ?auto_102090 ) ( CLEAR ?auto_102089 ) ( HAND-EMPTY ) ( not ( = ?auto_102085 ?auto_102090 ) ) ( not ( = ?auto_102086 ?auto_102090 ) ) ( not ( = ?auto_102087 ?auto_102090 ) ) ( not ( = ?auto_102088 ?auto_102090 ) ) ( not ( = ?auto_102089 ?auto_102090 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102089 ?auto_102090 )
      ( MAKE-5PILE ?auto_102085 ?auto_102086 ?auto_102087 ?auto_102088 ?auto_102089 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102091 - BLOCK
      ?auto_102092 - BLOCK
      ?auto_102093 - BLOCK
      ?auto_102094 - BLOCK
      ?auto_102095 - BLOCK
    )
    :vars
    (
      ?auto_102096 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102091 ) ( ON ?auto_102092 ?auto_102091 ) ( ON ?auto_102093 ?auto_102092 ) ( not ( = ?auto_102091 ?auto_102092 ) ) ( not ( = ?auto_102091 ?auto_102093 ) ) ( not ( = ?auto_102091 ?auto_102094 ) ) ( not ( = ?auto_102091 ?auto_102095 ) ) ( not ( = ?auto_102092 ?auto_102093 ) ) ( not ( = ?auto_102092 ?auto_102094 ) ) ( not ( = ?auto_102092 ?auto_102095 ) ) ( not ( = ?auto_102093 ?auto_102094 ) ) ( not ( = ?auto_102093 ?auto_102095 ) ) ( not ( = ?auto_102094 ?auto_102095 ) ) ( ON ?auto_102095 ?auto_102096 ) ( CLEAR ?auto_102095 ) ( not ( = ?auto_102091 ?auto_102096 ) ) ( not ( = ?auto_102092 ?auto_102096 ) ) ( not ( = ?auto_102093 ?auto_102096 ) ) ( not ( = ?auto_102094 ?auto_102096 ) ) ( not ( = ?auto_102095 ?auto_102096 ) ) ( HOLDING ?auto_102094 ) ( CLEAR ?auto_102093 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102091 ?auto_102092 ?auto_102093 ?auto_102094 )
      ( MAKE-5PILE ?auto_102091 ?auto_102092 ?auto_102093 ?auto_102094 ?auto_102095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102097 - BLOCK
      ?auto_102098 - BLOCK
      ?auto_102099 - BLOCK
      ?auto_102100 - BLOCK
      ?auto_102101 - BLOCK
    )
    :vars
    (
      ?auto_102102 - BLOCK
      ?auto_102103 - BLOCK
      ?auto_102104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102097 ) ( ON ?auto_102098 ?auto_102097 ) ( ON ?auto_102099 ?auto_102098 ) ( not ( = ?auto_102097 ?auto_102098 ) ) ( not ( = ?auto_102097 ?auto_102099 ) ) ( not ( = ?auto_102097 ?auto_102100 ) ) ( not ( = ?auto_102097 ?auto_102101 ) ) ( not ( = ?auto_102098 ?auto_102099 ) ) ( not ( = ?auto_102098 ?auto_102100 ) ) ( not ( = ?auto_102098 ?auto_102101 ) ) ( not ( = ?auto_102099 ?auto_102100 ) ) ( not ( = ?auto_102099 ?auto_102101 ) ) ( not ( = ?auto_102100 ?auto_102101 ) ) ( ON ?auto_102101 ?auto_102102 ) ( not ( = ?auto_102097 ?auto_102102 ) ) ( not ( = ?auto_102098 ?auto_102102 ) ) ( not ( = ?auto_102099 ?auto_102102 ) ) ( not ( = ?auto_102100 ?auto_102102 ) ) ( not ( = ?auto_102101 ?auto_102102 ) ) ( CLEAR ?auto_102099 ) ( ON ?auto_102100 ?auto_102101 ) ( CLEAR ?auto_102100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102103 ) ( ON ?auto_102104 ?auto_102103 ) ( ON ?auto_102102 ?auto_102104 ) ( not ( = ?auto_102103 ?auto_102104 ) ) ( not ( = ?auto_102103 ?auto_102102 ) ) ( not ( = ?auto_102103 ?auto_102101 ) ) ( not ( = ?auto_102103 ?auto_102100 ) ) ( not ( = ?auto_102104 ?auto_102102 ) ) ( not ( = ?auto_102104 ?auto_102101 ) ) ( not ( = ?auto_102104 ?auto_102100 ) ) ( not ( = ?auto_102097 ?auto_102103 ) ) ( not ( = ?auto_102097 ?auto_102104 ) ) ( not ( = ?auto_102098 ?auto_102103 ) ) ( not ( = ?auto_102098 ?auto_102104 ) ) ( not ( = ?auto_102099 ?auto_102103 ) ) ( not ( = ?auto_102099 ?auto_102104 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102103 ?auto_102104 ?auto_102102 ?auto_102101 )
      ( MAKE-5PILE ?auto_102097 ?auto_102098 ?auto_102099 ?auto_102100 ?auto_102101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102105 - BLOCK
      ?auto_102106 - BLOCK
      ?auto_102107 - BLOCK
      ?auto_102108 - BLOCK
      ?auto_102109 - BLOCK
    )
    :vars
    (
      ?auto_102111 - BLOCK
      ?auto_102112 - BLOCK
      ?auto_102110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102105 ) ( ON ?auto_102106 ?auto_102105 ) ( not ( = ?auto_102105 ?auto_102106 ) ) ( not ( = ?auto_102105 ?auto_102107 ) ) ( not ( = ?auto_102105 ?auto_102108 ) ) ( not ( = ?auto_102105 ?auto_102109 ) ) ( not ( = ?auto_102106 ?auto_102107 ) ) ( not ( = ?auto_102106 ?auto_102108 ) ) ( not ( = ?auto_102106 ?auto_102109 ) ) ( not ( = ?auto_102107 ?auto_102108 ) ) ( not ( = ?auto_102107 ?auto_102109 ) ) ( not ( = ?auto_102108 ?auto_102109 ) ) ( ON ?auto_102109 ?auto_102111 ) ( not ( = ?auto_102105 ?auto_102111 ) ) ( not ( = ?auto_102106 ?auto_102111 ) ) ( not ( = ?auto_102107 ?auto_102111 ) ) ( not ( = ?auto_102108 ?auto_102111 ) ) ( not ( = ?auto_102109 ?auto_102111 ) ) ( ON ?auto_102108 ?auto_102109 ) ( CLEAR ?auto_102108 ) ( ON-TABLE ?auto_102112 ) ( ON ?auto_102110 ?auto_102112 ) ( ON ?auto_102111 ?auto_102110 ) ( not ( = ?auto_102112 ?auto_102110 ) ) ( not ( = ?auto_102112 ?auto_102111 ) ) ( not ( = ?auto_102112 ?auto_102109 ) ) ( not ( = ?auto_102112 ?auto_102108 ) ) ( not ( = ?auto_102110 ?auto_102111 ) ) ( not ( = ?auto_102110 ?auto_102109 ) ) ( not ( = ?auto_102110 ?auto_102108 ) ) ( not ( = ?auto_102105 ?auto_102112 ) ) ( not ( = ?auto_102105 ?auto_102110 ) ) ( not ( = ?auto_102106 ?auto_102112 ) ) ( not ( = ?auto_102106 ?auto_102110 ) ) ( not ( = ?auto_102107 ?auto_102112 ) ) ( not ( = ?auto_102107 ?auto_102110 ) ) ( HOLDING ?auto_102107 ) ( CLEAR ?auto_102106 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102105 ?auto_102106 ?auto_102107 )
      ( MAKE-5PILE ?auto_102105 ?auto_102106 ?auto_102107 ?auto_102108 ?auto_102109 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102113 - BLOCK
      ?auto_102114 - BLOCK
      ?auto_102115 - BLOCK
      ?auto_102116 - BLOCK
      ?auto_102117 - BLOCK
    )
    :vars
    (
      ?auto_102119 - BLOCK
      ?auto_102120 - BLOCK
      ?auto_102118 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102113 ) ( ON ?auto_102114 ?auto_102113 ) ( not ( = ?auto_102113 ?auto_102114 ) ) ( not ( = ?auto_102113 ?auto_102115 ) ) ( not ( = ?auto_102113 ?auto_102116 ) ) ( not ( = ?auto_102113 ?auto_102117 ) ) ( not ( = ?auto_102114 ?auto_102115 ) ) ( not ( = ?auto_102114 ?auto_102116 ) ) ( not ( = ?auto_102114 ?auto_102117 ) ) ( not ( = ?auto_102115 ?auto_102116 ) ) ( not ( = ?auto_102115 ?auto_102117 ) ) ( not ( = ?auto_102116 ?auto_102117 ) ) ( ON ?auto_102117 ?auto_102119 ) ( not ( = ?auto_102113 ?auto_102119 ) ) ( not ( = ?auto_102114 ?auto_102119 ) ) ( not ( = ?auto_102115 ?auto_102119 ) ) ( not ( = ?auto_102116 ?auto_102119 ) ) ( not ( = ?auto_102117 ?auto_102119 ) ) ( ON ?auto_102116 ?auto_102117 ) ( ON-TABLE ?auto_102120 ) ( ON ?auto_102118 ?auto_102120 ) ( ON ?auto_102119 ?auto_102118 ) ( not ( = ?auto_102120 ?auto_102118 ) ) ( not ( = ?auto_102120 ?auto_102119 ) ) ( not ( = ?auto_102120 ?auto_102117 ) ) ( not ( = ?auto_102120 ?auto_102116 ) ) ( not ( = ?auto_102118 ?auto_102119 ) ) ( not ( = ?auto_102118 ?auto_102117 ) ) ( not ( = ?auto_102118 ?auto_102116 ) ) ( not ( = ?auto_102113 ?auto_102120 ) ) ( not ( = ?auto_102113 ?auto_102118 ) ) ( not ( = ?auto_102114 ?auto_102120 ) ) ( not ( = ?auto_102114 ?auto_102118 ) ) ( not ( = ?auto_102115 ?auto_102120 ) ) ( not ( = ?auto_102115 ?auto_102118 ) ) ( CLEAR ?auto_102114 ) ( ON ?auto_102115 ?auto_102116 ) ( CLEAR ?auto_102115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102120 ?auto_102118 ?auto_102119 ?auto_102117 ?auto_102116 )
      ( MAKE-5PILE ?auto_102113 ?auto_102114 ?auto_102115 ?auto_102116 ?auto_102117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102121 - BLOCK
      ?auto_102122 - BLOCK
      ?auto_102123 - BLOCK
      ?auto_102124 - BLOCK
      ?auto_102125 - BLOCK
    )
    :vars
    (
      ?auto_102127 - BLOCK
      ?auto_102128 - BLOCK
      ?auto_102126 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102121 ) ( not ( = ?auto_102121 ?auto_102122 ) ) ( not ( = ?auto_102121 ?auto_102123 ) ) ( not ( = ?auto_102121 ?auto_102124 ) ) ( not ( = ?auto_102121 ?auto_102125 ) ) ( not ( = ?auto_102122 ?auto_102123 ) ) ( not ( = ?auto_102122 ?auto_102124 ) ) ( not ( = ?auto_102122 ?auto_102125 ) ) ( not ( = ?auto_102123 ?auto_102124 ) ) ( not ( = ?auto_102123 ?auto_102125 ) ) ( not ( = ?auto_102124 ?auto_102125 ) ) ( ON ?auto_102125 ?auto_102127 ) ( not ( = ?auto_102121 ?auto_102127 ) ) ( not ( = ?auto_102122 ?auto_102127 ) ) ( not ( = ?auto_102123 ?auto_102127 ) ) ( not ( = ?auto_102124 ?auto_102127 ) ) ( not ( = ?auto_102125 ?auto_102127 ) ) ( ON ?auto_102124 ?auto_102125 ) ( ON-TABLE ?auto_102128 ) ( ON ?auto_102126 ?auto_102128 ) ( ON ?auto_102127 ?auto_102126 ) ( not ( = ?auto_102128 ?auto_102126 ) ) ( not ( = ?auto_102128 ?auto_102127 ) ) ( not ( = ?auto_102128 ?auto_102125 ) ) ( not ( = ?auto_102128 ?auto_102124 ) ) ( not ( = ?auto_102126 ?auto_102127 ) ) ( not ( = ?auto_102126 ?auto_102125 ) ) ( not ( = ?auto_102126 ?auto_102124 ) ) ( not ( = ?auto_102121 ?auto_102128 ) ) ( not ( = ?auto_102121 ?auto_102126 ) ) ( not ( = ?auto_102122 ?auto_102128 ) ) ( not ( = ?auto_102122 ?auto_102126 ) ) ( not ( = ?auto_102123 ?auto_102128 ) ) ( not ( = ?auto_102123 ?auto_102126 ) ) ( ON ?auto_102123 ?auto_102124 ) ( CLEAR ?auto_102123 ) ( HOLDING ?auto_102122 ) ( CLEAR ?auto_102121 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102121 ?auto_102122 )
      ( MAKE-5PILE ?auto_102121 ?auto_102122 ?auto_102123 ?auto_102124 ?auto_102125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102129 - BLOCK
      ?auto_102130 - BLOCK
      ?auto_102131 - BLOCK
      ?auto_102132 - BLOCK
      ?auto_102133 - BLOCK
    )
    :vars
    (
      ?auto_102134 - BLOCK
      ?auto_102136 - BLOCK
      ?auto_102135 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102129 ) ( not ( = ?auto_102129 ?auto_102130 ) ) ( not ( = ?auto_102129 ?auto_102131 ) ) ( not ( = ?auto_102129 ?auto_102132 ) ) ( not ( = ?auto_102129 ?auto_102133 ) ) ( not ( = ?auto_102130 ?auto_102131 ) ) ( not ( = ?auto_102130 ?auto_102132 ) ) ( not ( = ?auto_102130 ?auto_102133 ) ) ( not ( = ?auto_102131 ?auto_102132 ) ) ( not ( = ?auto_102131 ?auto_102133 ) ) ( not ( = ?auto_102132 ?auto_102133 ) ) ( ON ?auto_102133 ?auto_102134 ) ( not ( = ?auto_102129 ?auto_102134 ) ) ( not ( = ?auto_102130 ?auto_102134 ) ) ( not ( = ?auto_102131 ?auto_102134 ) ) ( not ( = ?auto_102132 ?auto_102134 ) ) ( not ( = ?auto_102133 ?auto_102134 ) ) ( ON ?auto_102132 ?auto_102133 ) ( ON-TABLE ?auto_102136 ) ( ON ?auto_102135 ?auto_102136 ) ( ON ?auto_102134 ?auto_102135 ) ( not ( = ?auto_102136 ?auto_102135 ) ) ( not ( = ?auto_102136 ?auto_102134 ) ) ( not ( = ?auto_102136 ?auto_102133 ) ) ( not ( = ?auto_102136 ?auto_102132 ) ) ( not ( = ?auto_102135 ?auto_102134 ) ) ( not ( = ?auto_102135 ?auto_102133 ) ) ( not ( = ?auto_102135 ?auto_102132 ) ) ( not ( = ?auto_102129 ?auto_102136 ) ) ( not ( = ?auto_102129 ?auto_102135 ) ) ( not ( = ?auto_102130 ?auto_102136 ) ) ( not ( = ?auto_102130 ?auto_102135 ) ) ( not ( = ?auto_102131 ?auto_102136 ) ) ( not ( = ?auto_102131 ?auto_102135 ) ) ( ON ?auto_102131 ?auto_102132 ) ( CLEAR ?auto_102129 ) ( ON ?auto_102130 ?auto_102131 ) ( CLEAR ?auto_102130 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102136 ?auto_102135 ?auto_102134 ?auto_102133 ?auto_102132 ?auto_102131 )
      ( MAKE-5PILE ?auto_102129 ?auto_102130 ?auto_102131 ?auto_102132 ?auto_102133 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102137 - BLOCK
      ?auto_102138 - BLOCK
      ?auto_102139 - BLOCK
      ?auto_102140 - BLOCK
      ?auto_102141 - BLOCK
    )
    :vars
    (
      ?auto_102143 - BLOCK
      ?auto_102144 - BLOCK
      ?auto_102142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102137 ?auto_102138 ) ) ( not ( = ?auto_102137 ?auto_102139 ) ) ( not ( = ?auto_102137 ?auto_102140 ) ) ( not ( = ?auto_102137 ?auto_102141 ) ) ( not ( = ?auto_102138 ?auto_102139 ) ) ( not ( = ?auto_102138 ?auto_102140 ) ) ( not ( = ?auto_102138 ?auto_102141 ) ) ( not ( = ?auto_102139 ?auto_102140 ) ) ( not ( = ?auto_102139 ?auto_102141 ) ) ( not ( = ?auto_102140 ?auto_102141 ) ) ( ON ?auto_102141 ?auto_102143 ) ( not ( = ?auto_102137 ?auto_102143 ) ) ( not ( = ?auto_102138 ?auto_102143 ) ) ( not ( = ?auto_102139 ?auto_102143 ) ) ( not ( = ?auto_102140 ?auto_102143 ) ) ( not ( = ?auto_102141 ?auto_102143 ) ) ( ON ?auto_102140 ?auto_102141 ) ( ON-TABLE ?auto_102144 ) ( ON ?auto_102142 ?auto_102144 ) ( ON ?auto_102143 ?auto_102142 ) ( not ( = ?auto_102144 ?auto_102142 ) ) ( not ( = ?auto_102144 ?auto_102143 ) ) ( not ( = ?auto_102144 ?auto_102141 ) ) ( not ( = ?auto_102144 ?auto_102140 ) ) ( not ( = ?auto_102142 ?auto_102143 ) ) ( not ( = ?auto_102142 ?auto_102141 ) ) ( not ( = ?auto_102142 ?auto_102140 ) ) ( not ( = ?auto_102137 ?auto_102144 ) ) ( not ( = ?auto_102137 ?auto_102142 ) ) ( not ( = ?auto_102138 ?auto_102144 ) ) ( not ( = ?auto_102138 ?auto_102142 ) ) ( not ( = ?auto_102139 ?auto_102144 ) ) ( not ( = ?auto_102139 ?auto_102142 ) ) ( ON ?auto_102139 ?auto_102140 ) ( ON ?auto_102138 ?auto_102139 ) ( CLEAR ?auto_102138 ) ( HOLDING ?auto_102137 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102137 )
      ( MAKE-5PILE ?auto_102137 ?auto_102138 ?auto_102139 ?auto_102140 ?auto_102141 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102145 - BLOCK
      ?auto_102146 - BLOCK
      ?auto_102147 - BLOCK
      ?auto_102148 - BLOCK
      ?auto_102149 - BLOCK
    )
    :vars
    (
      ?auto_102150 - BLOCK
      ?auto_102151 - BLOCK
      ?auto_102152 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102145 ?auto_102146 ) ) ( not ( = ?auto_102145 ?auto_102147 ) ) ( not ( = ?auto_102145 ?auto_102148 ) ) ( not ( = ?auto_102145 ?auto_102149 ) ) ( not ( = ?auto_102146 ?auto_102147 ) ) ( not ( = ?auto_102146 ?auto_102148 ) ) ( not ( = ?auto_102146 ?auto_102149 ) ) ( not ( = ?auto_102147 ?auto_102148 ) ) ( not ( = ?auto_102147 ?auto_102149 ) ) ( not ( = ?auto_102148 ?auto_102149 ) ) ( ON ?auto_102149 ?auto_102150 ) ( not ( = ?auto_102145 ?auto_102150 ) ) ( not ( = ?auto_102146 ?auto_102150 ) ) ( not ( = ?auto_102147 ?auto_102150 ) ) ( not ( = ?auto_102148 ?auto_102150 ) ) ( not ( = ?auto_102149 ?auto_102150 ) ) ( ON ?auto_102148 ?auto_102149 ) ( ON-TABLE ?auto_102151 ) ( ON ?auto_102152 ?auto_102151 ) ( ON ?auto_102150 ?auto_102152 ) ( not ( = ?auto_102151 ?auto_102152 ) ) ( not ( = ?auto_102151 ?auto_102150 ) ) ( not ( = ?auto_102151 ?auto_102149 ) ) ( not ( = ?auto_102151 ?auto_102148 ) ) ( not ( = ?auto_102152 ?auto_102150 ) ) ( not ( = ?auto_102152 ?auto_102149 ) ) ( not ( = ?auto_102152 ?auto_102148 ) ) ( not ( = ?auto_102145 ?auto_102151 ) ) ( not ( = ?auto_102145 ?auto_102152 ) ) ( not ( = ?auto_102146 ?auto_102151 ) ) ( not ( = ?auto_102146 ?auto_102152 ) ) ( not ( = ?auto_102147 ?auto_102151 ) ) ( not ( = ?auto_102147 ?auto_102152 ) ) ( ON ?auto_102147 ?auto_102148 ) ( ON ?auto_102146 ?auto_102147 ) ( ON ?auto_102145 ?auto_102146 ) ( CLEAR ?auto_102145 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102151 ?auto_102152 ?auto_102150 ?auto_102149 ?auto_102148 ?auto_102147 ?auto_102146 )
      ( MAKE-5PILE ?auto_102145 ?auto_102146 ?auto_102147 ?auto_102148 ?auto_102149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102155 - BLOCK
      ?auto_102156 - BLOCK
    )
    :vars
    (
      ?auto_102157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102157 ?auto_102156 ) ( CLEAR ?auto_102157 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102155 ) ( ON ?auto_102156 ?auto_102155 ) ( not ( = ?auto_102155 ?auto_102156 ) ) ( not ( = ?auto_102155 ?auto_102157 ) ) ( not ( = ?auto_102156 ?auto_102157 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102157 ?auto_102156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102158 - BLOCK
      ?auto_102159 - BLOCK
    )
    :vars
    (
      ?auto_102160 - BLOCK
      ?auto_102161 - BLOCK
      ?auto_102162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102160 ?auto_102159 ) ( CLEAR ?auto_102160 ) ( ON-TABLE ?auto_102158 ) ( ON ?auto_102159 ?auto_102158 ) ( not ( = ?auto_102158 ?auto_102159 ) ) ( not ( = ?auto_102158 ?auto_102160 ) ) ( not ( = ?auto_102159 ?auto_102160 ) ) ( HOLDING ?auto_102161 ) ( CLEAR ?auto_102162 ) ( not ( = ?auto_102158 ?auto_102161 ) ) ( not ( = ?auto_102158 ?auto_102162 ) ) ( not ( = ?auto_102159 ?auto_102161 ) ) ( not ( = ?auto_102159 ?auto_102162 ) ) ( not ( = ?auto_102160 ?auto_102161 ) ) ( not ( = ?auto_102160 ?auto_102162 ) ) ( not ( = ?auto_102161 ?auto_102162 ) ) )
    :subtasks
    ( ( !STACK ?auto_102161 ?auto_102162 )
      ( MAKE-2PILE ?auto_102158 ?auto_102159 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102163 - BLOCK
      ?auto_102164 - BLOCK
    )
    :vars
    (
      ?auto_102165 - BLOCK
      ?auto_102167 - BLOCK
      ?auto_102166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102165 ?auto_102164 ) ( ON-TABLE ?auto_102163 ) ( ON ?auto_102164 ?auto_102163 ) ( not ( = ?auto_102163 ?auto_102164 ) ) ( not ( = ?auto_102163 ?auto_102165 ) ) ( not ( = ?auto_102164 ?auto_102165 ) ) ( CLEAR ?auto_102167 ) ( not ( = ?auto_102163 ?auto_102166 ) ) ( not ( = ?auto_102163 ?auto_102167 ) ) ( not ( = ?auto_102164 ?auto_102166 ) ) ( not ( = ?auto_102164 ?auto_102167 ) ) ( not ( = ?auto_102165 ?auto_102166 ) ) ( not ( = ?auto_102165 ?auto_102167 ) ) ( not ( = ?auto_102166 ?auto_102167 ) ) ( ON ?auto_102166 ?auto_102165 ) ( CLEAR ?auto_102166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102163 ?auto_102164 ?auto_102165 )
      ( MAKE-2PILE ?auto_102163 ?auto_102164 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102168 - BLOCK
      ?auto_102169 - BLOCK
    )
    :vars
    (
      ?auto_102171 - BLOCK
      ?auto_102170 - BLOCK
      ?auto_102172 - BLOCK
      ?auto_102175 - BLOCK
      ?auto_102173 - BLOCK
      ?auto_102174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102171 ?auto_102169 ) ( ON-TABLE ?auto_102168 ) ( ON ?auto_102169 ?auto_102168 ) ( not ( = ?auto_102168 ?auto_102169 ) ) ( not ( = ?auto_102168 ?auto_102171 ) ) ( not ( = ?auto_102169 ?auto_102171 ) ) ( not ( = ?auto_102168 ?auto_102170 ) ) ( not ( = ?auto_102168 ?auto_102172 ) ) ( not ( = ?auto_102169 ?auto_102170 ) ) ( not ( = ?auto_102169 ?auto_102172 ) ) ( not ( = ?auto_102171 ?auto_102170 ) ) ( not ( = ?auto_102171 ?auto_102172 ) ) ( not ( = ?auto_102170 ?auto_102172 ) ) ( ON ?auto_102170 ?auto_102171 ) ( CLEAR ?auto_102170 ) ( HOLDING ?auto_102172 ) ( CLEAR ?auto_102175 ) ( ON-TABLE ?auto_102173 ) ( ON ?auto_102174 ?auto_102173 ) ( ON ?auto_102175 ?auto_102174 ) ( not ( = ?auto_102173 ?auto_102174 ) ) ( not ( = ?auto_102173 ?auto_102175 ) ) ( not ( = ?auto_102173 ?auto_102172 ) ) ( not ( = ?auto_102174 ?auto_102175 ) ) ( not ( = ?auto_102174 ?auto_102172 ) ) ( not ( = ?auto_102175 ?auto_102172 ) ) ( not ( = ?auto_102168 ?auto_102175 ) ) ( not ( = ?auto_102168 ?auto_102173 ) ) ( not ( = ?auto_102168 ?auto_102174 ) ) ( not ( = ?auto_102169 ?auto_102175 ) ) ( not ( = ?auto_102169 ?auto_102173 ) ) ( not ( = ?auto_102169 ?auto_102174 ) ) ( not ( = ?auto_102171 ?auto_102175 ) ) ( not ( = ?auto_102171 ?auto_102173 ) ) ( not ( = ?auto_102171 ?auto_102174 ) ) ( not ( = ?auto_102170 ?auto_102175 ) ) ( not ( = ?auto_102170 ?auto_102173 ) ) ( not ( = ?auto_102170 ?auto_102174 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102173 ?auto_102174 ?auto_102175 ?auto_102172 )
      ( MAKE-2PILE ?auto_102168 ?auto_102169 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102176 - BLOCK
      ?auto_102177 - BLOCK
    )
    :vars
    (
      ?auto_102179 - BLOCK
      ?auto_102181 - BLOCK
      ?auto_102182 - BLOCK
      ?auto_102178 - BLOCK
      ?auto_102183 - BLOCK
      ?auto_102180 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102179 ?auto_102177 ) ( ON-TABLE ?auto_102176 ) ( ON ?auto_102177 ?auto_102176 ) ( not ( = ?auto_102176 ?auto_102177 ) ) ( not ( = ?auto_102176 ?auto_102179 ) ) ( not ( = ?auto_102177 ?auto_102179 ) ) ( not ( = ?auto_102176 ?auto_102181 ) ) ( not ( = ?auto_102176 ?auto_102182 ) ) ( not ( = ?auto_102177 ?auto_102181 ) ) ( not ( = ?auto_102177 ?auto_102182 ) ) ( not ( = ?auto_102179 ?auto_102181 ) ) ( not ( = ?auto_102179 ?auto_102182 ) ) ( not ( = ?auto_102181 ?auto_102182 ) ) ( ON ?auto_102181 ?auto_102179 ) ( CLEAR ?auto_102178 ) ( ON-TABLE ?auto_102183 ) ( ON ?auto_102180 ?auto_102183 ) ( ON ?auto_102178 ?auto_102180 ) ( not ( = ?auto_102183 ?auto_102180 ) ) ( not ( = ?auto_102183 ?auto_102178 ) ) ( not ( = ?auto_102183 ?auto_102182 ) ) ( not ( = ?auto_102180 ?auto_102178 ) ) ( not ( = ?auto_102180 ?auto_102182 ) ) ( not ( = ?auto_102178 ?auto_102182 ) ) ( not ( = ?auto_102176 ?auto_102178 ) ) ( not ( = ?auto_102176 ?auto_102183 ) ) ( not ( = ?auto_102176 ?auto_102180 ) ) ( not ( = ?auto_102177 ?auto_102178 ) ) ( not ( = ?auto_102177 ?auto_102183 ) ) ( not ( = ?auto_102177 ?auto_102180 ) ) ( not ( = ?auto_102179 ?auto_102178 ) ) ( not ( = ?auto_102179 ?auto_102183 ) ) ( not ( = ?auto_102179 ?auto_102180 ) ) ( not ( = ?auto_102181 ?auto_102178 ) ) ( not ( = ?auto_102181 ?auto_102183 ) ) ( not ( = ?auto_102181 ?auto_102180 ) ) ( ON ?auto_102182 ?auto_102181 ) ( CLEAR ?auto_102182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102176 ?auto_102177 ?auto_102179 ?auto_102181 )
      ( MAKE-2PILE ?auto_102176 ?auto_102177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102184 - BLOCK
      ?auto_102185 - BLOCK
    )
    :vars
    (
      ?auto_102190 - BLOCK
      ?auto_102191 - BLOCK
      ?auto_102187 - BLOCK
      ?auto_102188 - BLOCK
      ?auto_102189 - BLOCK
      ?auto_102186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102190 ?auto_102185 ) ( ON-TABLE ?auto_102184 ) ( ON ?auto_102185 ?auto_102184 ) ( not ( = ?auto_102184 ?auto_102185 ) ) ( not ( = ?auto_102184 ?auto_102190 ) ) ( not ( = ?auto_102185 ?auto_102190 ) ) ( not ( = ?auto_102184 ?auto_102191 ) ) ( not ( = ?auto_102184 ?auto_102187 ) ) ( not ( = ?auto_102185 ?auto_102191 ) ) ( not ( = ?auto_102185 ?auto_102187 ) ) ( not ( = ?auto_102190 ?auto_102191 ) ) ( not ( = ?auto_102190 ?auto_102187 ) ) ( not ( = ?auto_102191 ?auto_102187 ) ) ( ON ?auto_102191 ?auto_102190 ) ( ON-TABLE ?auto_102188 ) ( ON ?auto_102189 ?auto_102188 ) ( not ( = ?auto_102188 ?auto_102189 ) ) ( not ( = ?auto_102188 ?auto_102186 ) ) ( not ( = ?auto_102188 ?auto_102187 ) ) ( not ( = ?auto_102189 ?auto_102186 ) ) ( not ( = ?auto_102189 ?auto_102187 ) ) ( not ( = ?auto_102186 ?auto_102187 ) ) ( not ( = ?auto_102184 ?auto_102186 ) ) ( not ( = ?auto_102184 ?auto_102188 ) ) ( not ( = ?auto_102184 ?auto_102189 ) ) ( not ( = ?auto_102185 ?auto_102186 ) ) ( not ( = ?auto_102185 ?auto_102188 ) ) ( not ( = ?auto_102185 ?auto_102189 ) ) ( not ( = ?auto_102190 ?auto_102186 ) ) ( not ( = ?auto_102190 ?auto_102188 ) ) ( not ( = ?auto_102190 ?auto_102189 ) ) ( not ( = ?auto_102191 ?auto_102186 ) ) ( not ( = ?auto_102191 ?auto_102188 ) ) ( not ( = ?auto_102191 ?auto_102189 ) ) ( ON ?auto_102187 ?auto_102191 ) ( CLEAR ?auto_102187 ) ( HOLDING ?auto_102186 ) ( CLEAR ?auto_102189 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102188 ?auto_102189 ?auto_102186 )
      ( MAKE-2PILE ?auto_102184 ?auto_102185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102192 - BLOCK
      ?auto_102193 - BLOCK
    )
    :vars
    (
      ?auto_102196 - BLOCK
      ?auto_102194 - BLOCK
      ?auto_102197 - BLOCK
      ?auto_102195 - BLOCK
      ?auto_102198 - BLOCK
      ?auto_102199 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102196 ?auto_102193 ) ( ON-TABLE ?auto_102192 ) ( ON ?auto_102193 ?auto_102192 ) ( not ( = ?auto_102192 ?auto_102193 ) ) ( not ( = ?auto_102192 ?auto_102196 ) ) ( not ( = ?auto_102193 ?auto_102196 ) ) ( not ( = ?auto_102192 ?auto_102194 ) ) ( not ( = ?auto_102192 ?auto_102197 ) ) ( not ( = ?auto_102193 ?auto_102194 ) ) ( not ( = ?auto_102193 ?auto_102197 ) ) ( not ( = ?auto_102196 ?auto_102194 ) ) ( not ( = ?auto_102196 ?auto_102197 ) ) ( not ( = ?auto_102194 ?auto_102197 ) ) ( ON ?auto_102194 ?auto_102196 ) ( ON-TABLE ?auto_102195 ) ( ON ?auto_102198 ?auto_102195 ) ( not ( = ?auto_102195 ?auto_102198 ) ) ( not ( = ?auto_102195 ?auto_102199 ) ) ( not ( = ?auto_102195 ?auto_102197 ) ) ( not ( = ?auto_102198 ?auto_102199 ) ) ( not ( = ?auto_102198 ?auto_102197 ) ) ( not ( = ?auto_102199 ?auto_102197 ) ) ( not ( = ?auto_102192 ?auto_102199 ) ) ( not ( = ?auto_102192 ?auto_102195 ) ) ( not ( = ?auto_102192 ?auto_102198 ) ) ( not ( = ?auto_102193 ?auto_102199 ) ) ( not ( = ?auto_102193 ?auto_102195 ) ) ( not ( = ?auto_102193 ?auto_102198 ) ) ( not ( = ?auto_102196 ?auto_102199 ) ) ( not ( = ?auto_102196 ?auto_102195 ) ) ( not ( = ?auto_102196 ?auto_102198 ) ) ( not ( = ?auto_102194 ?auto_102199 ) ) ( not ( = ?auto_102194 ?auto_102195 ) ) ( not ( = ?auto_102194 ?auto_102198 ) ) ( ON ?auto_102197 ?auto_102194 ) ( CLEAR ?auto_102198 ) ( ON ?auto_102199 ?auto_102197 ) ( CLEAR ?auto_102199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102192 ?auto_102193 ?auto_102196 ?auto_102194 ?auto_102197 )
      ( MAKE-2PILE ?auto_102192 ?auto_102193 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102200 - BLOCK
      ?auto_102201 - BLOCK
    )
    :vars
    (
      ?auto_102203 - BLOCK
      ?auto_102202 - BLOCK
      ?auto_102204 - BLOCK
      ?auto_102205 - BLOCK
      ?auto_102207 - BLOCK
      ?auto_102206 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102203 ?auto_102201 ) ( ON-TABLE ?auto_102200 ) ( ON ?auto_102201 ?auto_102200 ) ( not ( = ?auto_102200 ?auto_102201 ) ) ( not ( = ?auto_102200 ?auto_102203 ) ) ( not ( = ?auto_102201 ?auto_102203 ) ) ( not ( = ?auto_102200 ?auto_102202 ) ) ( not ( = ?auto_102200 ?auto_102204 ) ) ( not ( = ?auto_102201 ?auto_102202 ) ) ( not ( = ?auto_102201 ?auto_102204 ) ) ( not ( = ?auto_102203 ?auto_102202 ) ) ( not ( = ?auto_102203 ?auto_102204 ) ) ( not ( = ?auto_102202 ?auto_102204 ) ) ( ON ?auto_102202 ?auto_102203 ) ( ON-TABLE ?auto_102205 ) ( not ( = ?auto_102205 ?auto_102207 ) ) ( not ( = ?auto_102205 ?auto_102206 ) ) ( not ( = ?auto_102205 ?auto_102204 ) ) ( not ( = ?auto_102207 ?auto_102206 ) ) ( not ( = ?auto_102207 ?auto_102204 ) ) ( not ( = ?auto_102206 ?auto_102204 ) ) ( not ( = ?auto_102200 ?auto_102206 ) ) ( not ( = ?auto_102200 ?auto_102205 ) ) ( not ( = ?auto_102200 ?auto_102207 ) ) ( not ( = ?auto_102201 ?auto_102206 ) ) ( not ( = ?auto_102201 ?auto_102205 ) ) ( not ( = ?auto_102201 ?auto_102207 ) ) ( not ( = ?auto_102203 ?auto_102206 ) ) ( not ( = ?auto_102203 ?auto_102205 ) ) ( not ( = ?auto_102203 ?auto_102207 ) ) ( not ( = ?auto_102202 ?auto_102206 ) ) ( not ( = ?auto_102202 ?auto_102205 ) ) ( not ( = ?auto_102202 ?auto_102207 ) ) ( ON ?auto_102204 ?auto_102202 ) ( ON ?auto_102206 ?auto_102204 ) ( CLEAR ?auto_102206 ) ( HOLDING ?auto_102207 ) ( CLEAR ?auto_102205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102205 ?auto_102207 )
      ( MAKE-2PILE ?auto_102200 ?auto_102201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103501 - BLOCK
      ?auto_103502 - BLOCK
    )
    :vars
    (
      ?auto_103507 - BLOCK
      ?auto_103505 - BLOCK
      ?auto_103506 - BLOCK
      ?auto_103504 - BLOCK
      ?auto_103503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103507 ?auto_103502 ) ( ON-TABLE ?auto_103501 ) ( ON ?auto_103502 ?auto_103501 ) ( not ( = ?auto_103501 ?auto_103502 ) ) ( not ( = ?auto_103501 ?auto_103507 ) ) ( not ( = ?auto_103502 ?auto_103507 ) ) ( not ( = ?auto_103501 ?auto_103505 ) ) ( not ( = ?auto_103501 ?auto_103506 ) ) ( not ( = ?auto_103502 ?auto_103505 ) ) ( not ( = ?auto_103502 ?auto_103506 ) ) ( not ( = ?auto_103507 ?auto_103505 ) ) ( not ( = ?auto_103507 ?auto_103506 ) ) ( not ( = ?auto_103505 ?auto_103506 ) ) ( ON ?auto_103505 ?auto_103507 ) ( not ( = ?auto_103504 ?auto_103503 ) ) ( not ( = ?auto_103504 ?auto_103506 ) ) ( not ( = ?auto_103503 ?auto_103506 ) ) ( not ( = ?auto_103501 ?auto_103503 ) ) ( not ( = ?auto_103501 ?auto_103504 ) ) ( not ( = ?auto_103502 ?auto_103503 ) ) ( not ( = ?auto_103502 ?auto_103504 ) ) ( not ( = ?auto_103507 ?auto_103503 ) ) ( not ( = ?auto_103507 ?auto_103504 ) ) ( not ( = ?auto_103505 ?auto_103503 ) ) ( not ( = ?auto_103505 ?auto_103504 ) ) ( ON ?auto_103506 ?auto_103505 ) ( ON ?auto_103503 ?auto_103506 ) ( ON ?auto_103504 ?auto_103503 ) ( CLEAR ?auto_103504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103501 ?auto_103502 ?auto_103507 ?auto_103505 ?auto_103506 ?auto_103503 )
      ( MAKE-2PILE ?auto_103501 ?auto_103502 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102216 - BLOCK
      ?auto_102217 - BLOCK
    )
    :vars
    (
      ?auto_102219 - BLOCK
      ?auto_102221 - BLOCK
      ?auto_102223 - BLOCK
      ?auto_102222 - BLOCK
      ?auto_102218 - BLOCK
      ?auto_102220 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102219 ?auto_102217 ) ( ON-TABLE ?auto_102216 ) ( ON ?auto_102217 ?auto_102216 ) ( not ( = ?auto_102216 ?auto_102217 ) ) ( not ( = ?auto_102216 ?auto_102219 ) ) ( not ( = ?auto_102217 ?auto_102219 ) ) ( not ( = ?auto_102216 ?auto_102221 ) ) ( not ( = ?auto_102216 ?auto_102223 ) ) ( not ( = ?auto_102217 ?auto_102221 ) ) ( not ( = ?auto_102217 ?auto_102223 ) ) ( not ( = ?auto_102219 ?auto_102221 ) ) ( not ( = ?auto_102219 ?auto_102223 ) ) ( not ( = ?auto_102221 ?auto_102223 ) ) ( ON ?auto_102221 ?auto_102219 ) ( not ( = ?auto_102222 ?auto_102218 ) ) ( not ( = ?auto_102222 ?auto_102220 ) ) ( not ( = ?auto_102222 ?auto_102223 ) ) ( not ( = ?auto_102218 ?auto_102220 ) ) ( not ( = ?auto_102218 ?auto_102223 ) ) ( not ( = ?auto_102220 ?auto_102223 ) ) ( not ( = ?auto_102216 ?auto_102220 ) ) ( not ( = ?auto_102216 ?auto_102222 ) ) ( not ( = ?auto_102216 ?auto_102218 ) ) ( not ( = ?auto_102217 ?auto_102220 ) ) ( not ( = ?auto_102217 ?auto_102222 ) ) ( not ( = ?auto_102217 ?auto_102218 ) ) ( not ( = ?auto_102219 ?auto_102220 ) ) ( not ( = ?auto_102219 ?auto_102222 ) ) ( not ( = ?auto_102219 ?auto_102218 ) ) ( not ( = ?auto_102221 ?auto_102220 ) ) ( not ( = ?auto_102221 ?auto_102222 ) ) ( not ( = ?auto_102221 ?auto_102218 ) ) ( ON ?auto_102223 ?auto_102221 ) ( ON ?auto_102220 ?auto_102223 ) ( ON ?auto_102218 ?auto_102220 ) ( CLEAR ?auto_102218 ) ( HOLDING ?auto_102222 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102222 )
      ( MAKE-2PILE ?auto_102216 ?auto_102217 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102224 - BLOCK
      ?auto_102225 - BLOCK
    )
    :vars
    (
      ?auto_102229 - BLOCK
      ?auto_102226 - BLOCK
      ?auto_102227 - BLOCK
      ?auto_102231 - BLOCK
      ?auto_102228 - BLOCK
      ?auto_102230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102229 ?auto_102225 ) ( ON-TABLE ?auto_102224 ) ( ON ?auto_102225 ?auto_102224 ) ( not ( = ?auto_102224 ?auto_102225 ) ) ( not ( = ?auto_102224 ?auto_102229 ) ) ( not ( = ?auto_102225 ?auto_102229 ) ) ( not ( = ?auto_102224 ?auto_102226 ) ) ( not ( = ?auto_102224 ?auto_102227 ) ) ( not ( = ?auto_102225 ?auto_102226 ) ) ( not ( = ?auto_102225 ?auto_102227 ) ) ( not ( = ?auto_102229 ?auto_102226 ) ) ( not ( = ?auto_102229 ?auto_102227 ) ) ( not ( = ?auto_102226 ?auto_102227 ) ) ( ON ?auto_102226 ?auto_102229 ) ( not ( = ?auto_102231 ?auto_102228 ) ) ( not ( = ?auto_102231 ?auto_102230 ) ) ( not ( = ?auto_102231 ?auto_102227 ) ) ( not ( = ?auto_102228 ?auto_102230 ) ) ( not ( = ?auto_102228 ?auto_102227 ) ) ( not ( = ?auto_102230 ?auto_102227 ) ) ( not ( = ?auto_102224 ?auto_102230 ) ) ( not ( = ?auto_102224 ?auto_102231 ) ) ( not ( = ?auto_102224 ?auto_102228 ) ) ( not ( = ?auto_102225 ?auto_102230 ) ) ( not ( = ?auto_102225 ?auto_102231 ) ) ( not ( = ?auto_102225 ?auto_102228 ) ) ( not ( = ?auto_102229 ?auto_102230 ) ) ( not ( = ?auto_102229 ?auto_102231 ) ) ( not ( = ?auto_102229 ?auto_102228 ) ) ( not ( = ?auto_102226 ?auto_102230 ) ) ( not ( = ?auto_102226 ?auto_102231 ) ) ( not ( = ?auto_102226 ?auto_102228 ) ) ( ON ?auto_102227 ?auto_102226 ) ( ON ?auto_102230 ?auto_102227 ) ( ON ?auto_102228 ?auto_102230 ) ( ON ?auto_102231 ?auto_102228 ) ( CLEAR ?auto_102231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102224 ?auto_102225 ?auto_102229 ?auto_102226 ?auto_102227 ?auto_102230 ?auto_102228 )
      ( MAKE-2PILE ?auto_102224 ?auto_102225 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102238 - BLOCK
      ?auto_102239 - BLOCK
      ?auto_102240 - BLOCK
      ?auto_102241 - BLOCK
      ?auto_102242 - BLOCK
      ?auto_102243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102243 ) ( CLEAR ?auto_102242 ) ( ON-TABLE ?auto_102238 ) ( ON ?auto_102239 ?auto_102238 ) ( ON ?auto_102240 ?auto_102239 ) ( ON ?auto_102241 ?auto_102240 ) ( ON ?auto_102242 ?auto_102241 ) ( not ( = ?auto_102238 ?auto_102239 ) ) ( not ( = ?auto_102238 ?auto_102240 ) ) ( not ( = ?auto_102238 ?auto_102241 ) ) ( not ( = ?auto_102238 ?auto_102242 ) ) ( not ( = ?auto_102238 ?auto_102243 ) ) ( not ( = ?auto_102239 ?auto_102240 ) ) ( not ( = ?auto_102239 ?auto_102241 ) ) ( not ( = ?auto_102239 ?auto_102242 ) ) ( not ( = ?auto_102239 ?auto_102243 ) ) ( not ( = ?auto_102240 ?auto_102241 ) ) ( not ( = ?auto_102240 ?auto_102242 ) ) ( not ( = ?auto_102240 ?auto_102243 ) ) ( not ( = ?auto_102241 ?auto_102242 ) ) ( not ( = ?auto_102241 ?auto_102243 ) ) ( not ( = ?auto_102242 ?auto_102243 ) ) )
    :subtasks
    ( ( !STACK ?auto_102243 ?auto_102242 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102244 - BLOCK
      ?auto_102245 - BLOCK
      ?auto_102246 - BLOCK
      ?auto_102247 - BLOCK
      ?auto_102248 - BLOCK
      ?auto_102249 - BLOCK
    )
    :vars
    (
      ?auto_102250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102248 ) ( ON-TABLE ?auto_102244 ) ( ON ?auto_102245 ?auto_102244 ) ( ON ?auto_102246 ?auto_102245 ) ( ON ?auto_102247 ?auto_102246 ) ( ON ?auto_102248 ?auto_102247 ) ( not ( = ?auto_102244 ?auto_102245 ) ) ( not ( = ?auto_102244 ?auto_102246 ) ) ( not ( = ?auto_102244 ?auto_102247 ) ) ( not ( = ?auto_102244 ?auto_102248 ) ) ( not ( = ?auto_102244 ?auto_102249 ) ) ( not ( = ?auto_102245 ?auto_102246 ) ) ( not ( = ?auto_102245 ?auto_102247 ) ) ( not ( = ?auto_102245 ?auto_102248 ) ) ( not ( = ?auto_102245 ?auto_102249 ) ) ( not ( = ?auto_102246 ?auto_102247 ) ) ( not ( = ?auto_102246 ?auto_102248 ) ) ( not ( = ?auto_102246 ?auto_102249 ) ) ( not ( = ?auto_102247 ?auto_102248 ) ) ( not ( = ?auto_102247 ?auto_102249 ) ) ( not ( = ?auto_102248 ?auto_102249 ) ) ( ON ?auto_102249 ?auto_102250 ) ( CLEAR ?auto_102249 ) ( HAND-EMPTY ) ( not ( = ?auto_102244 ?auto_102250 ) ) ( not ( = ?auto_102245 ?auto_102250 ) ) ( not ( = ?auto_102246 ?auto_102250 ) ) ( not ( = ?auto_102247 ?auto_102250 ) ) ( not ( = ?auto_102248 ?auto_102250 ) ) ( not ( = ?auto_102249 ?auto_102250 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102249 ?auto_102250 )
      ( MAKE-6PILE ?auto_102244 ?auto_102245 ?auto_102246 ?auto_102247 ?auto_102248 ?auto_102249 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102251 - BLOCK
      ?auto_102252 - BLOCK
      ?auto_102253 - BLOCK
      ?auto_102254 - BLOCK
      ?auto_102255 - BLOCK
      ?auto_102256 - BLOCK
    )
    :vars
    (
      ?auto_102257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102251 ) ( ON ?auto_102252 ?auto_102251 ) ( ON ?auto_102253 ?auto_102252 ) ( ON ?auto_102254 ?auto_102253 ) ( not ( = ?auto_102251 ?auto_102252 ) ) ( not ( = ?auto_102251 ?auto_102253 ) ) ( not ( = ?auto_102251 ?auto_102254 ) ) ( not ( = ?auto_102251 ?auto_102255 ) ) ( not ( = ?auto_102251 ?auto_102256 ) ) ( not ( = ?auto_102252 ?auto_102253 ) ) ( not ( = ?auto_102252 ?auto_102254 ) ) ( not ( = ?auto_102252 ?auto_102255 ) ) ( not ( = ?auto_102252 ?auto_102256 ) ) ( not ( = ?auto_102253 ?auto_102254 ) ) ( not ( = ?auto_102253 ?auto_102255 ) ) ( not ( = ?auto_102253 ?auto_102256 ) ) ( not ( = ?auto_102254 ?auto_102255 ) ) ( not ( = ?auto_102254 ?auto_102256 ) ) ( not ( = ?auto_102255 ?auto_102256 ) ) ( ON ?auto_102256 ?auto_102257 ) ( CLEAR ?auto_102256 ) ( not ( = ?auto_102251 ?auto_102257 ) ) ( not ( = ?auto_102252 ?auto_102257 ) ) ( not ( = ?auto_102253 ?auto_102257 ) ) ( not ( = ?auto_102254 ?auto_102257 ) ) ( not ( = ?auto_102255 ?auto_102257 ) ) ( not ( = ?auto_102256 ?auto_102257 ) ) ( HOLDING ?auto_102255 ) ( CLEAR ?auto_102254 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102251 ?auto_102252 ?auto_102253 ?auto_102254 ?auto_102255 )
      ( MAKE-6PILE ?auto_102251 ?auto_102252 ?auto_102253 ?auto_102254 ?auto_102255 ?auto_102256 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102258 - BLOCK
      ?auto_102259 - BLOCK
      ?auto_102260 - BLOCK
      ?auto_102261 - BLOCK
      ?auto_102262 - BLOCK
      ?auto_102263 - BLOCK
    )
    :vars
    (
      ?auto_102264 - BLOCK
      ?auto_102265 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102258 ) ( ON ?auto_102259 ?auto_102258 ) ( ON ?auto_102260 ?auto_102259 ) ( ON ?auto_102261 ?auto_102260 ) ( not ( = ?auto_102258 ?auto_102259 ) ) ( not ( = ?auto_102258 ?auto_102260 ) ) ( not ( = ?auto_102258 ?auto_102261 ) ) ( not ( = ?auto_102258 ?auto_102262 ) ) ( not ( = ?auto_102258 ?auto_102263 ) ) ( not ( = ?auto_102259 ?auto_102260 ) ) ( not ( = ?auto_102259 ?auto_102261 ) ) ( not ( = ?auto_102259 ?auto_102262 ) ) ( not ( = ?auto_102259 ?auto_102263 ) ) ( not ( = ?auto_102260 ?auto_102261 ) ) ( not ( = ?auto_102260 ?auto_102262 ) ) ( not ( = ?auto_102260 ?auto_102263 ) ) ( not ( = ?auto_102261 ?auto_102262 ) ) ( not ( = ?auto_102261 ?auto_102263 ) ) ( not ( = ?auto_102262 ?auto_102263 ) ) ( ON ?auto_102263 ?auto_102264 ) ( not ( = ?auto_102258 ?auto_102264 ) ) ( not ( = ?auto_102259 ?auto_102264 ) ) ( not ( = ?auto_102260 ?auto_102264 ) ) ( not ( = ?auto_102261 ?auto_102264 ) ) ( not ( = ?auto_102262 ?auto_102264 ) ) ( not ( = ?auto_102263 ?auto_102264 ) ) ( CLEAR ?auto_102261 ) ( ON ?auto_102262 ?auto_102263 ) ( CLEAR ?auto_102262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102265 ) ( ON ?auto_102264 ?auto_102265 ) ( not ( = ?auto_102265 ?auto_102264 ) ) ( not ( = ?auto_102265 ?auto_102263 ) ) ( not ( = ?auto_102265 ?auto_102262 ) ) ( not ( = ?auto_102258 ?auto_102265 ) ) ( not ( = ?auto_102259 ?auto_102265 ) ) ( not ( = ?auto_102260 ?auto_102265 ) ) ( not ( = ?auto_102261 ?auto_102265 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102265 ?auto_102264 ?auto_102263 )
      ( MAKE-6PILE ?auto_102258 ?auto_102259 ?auto_102260 ?auto_102261 ?auto_102262 ?auto_102263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102266 - BLOCK
      ?auto_102267 - BLOCK
      ?auto_102268 - BLOCK
      ?auto_102269 - BLOCK
      ?auto_102270 - BLOCK
      ?auto_102271 - BLOCK
    )
    :vars
    (
      ?auto_102273 - BLOCK
      ?auto_102272 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102266 ) ( ON ?auto_102267 ?auto_102266 ) ( ON ?auto_102268 ?auto_102267 ) ( not ( = ?auto_102266 ?auto_102267 ) ) ( not ( = ?auto_102266 ?auto_102268 ) ) ( not ( = ?auto_102266 ?auto_102269 ) ) ( not ( = ?auto_102266 ?auto_102270 ) ) ( not ( = ?auto_102266 ?auto_102271 ) ) ( not ( = ?auto_102267 ?auto_102268 ) ) ( not ( = ?auto_102267 ?auto_102269 ) ) ( not ( = ?auto_102267 ?auto_102270 ) ) ( not ( = ?auto_102267 ?auto_102271 ) ) ( not ( = ?auto_102268 ?auto_102269 ) ) ( not ( = ?auto_102268 ?auto_102270 ) ) ( not ( = ?auto_102268 ?auto_102271 ) ) ( not ( = ?auto_102269 ?auto_102270 ) ) ( not ( = ?auto_102269 ?auto_102271 ) ) ( not ( = ?auto_102270 ?auto_102271 ) ) ( ON ?auto_102271 ?auto_102273 ) ( not ( = ?auto_102266 ?auto_102273 ) ) ( not ( = ?auto_102267 ?auto_102273 ) ) ( not ( = ?auto_102268 ?auto_102273 ) ) ( not ( = ?auto_102269 ?auto_102273 ) ) ( not ( = ?auto_102270 ?auto_102273 ) ) ( not ( = ?auto_102271 ?auto_102273 ) ) ( ON ?auto_102270 ?auto_102271 ) ( CLEAR ?auto_102270 ) ( ON-TABLE ?auto_102272 ) ( ON ?auto_102273 ?auto_102272 ) ( not ( = ?auto_102272 ?auto_102273 ) ) ( not ( = ?auto_102272 ?auto_102271 ) ) ( not ( = ?auto_102272 ?auto_102270 ) ) ( not ( = ?auto_102266 ?auto_102272 ) ) ( not ( = ?auto_102267 ?auto_102272 ) ) ( not ( = ?auto_102268 ?auto_102272 ) ) ( not ( = ?auto_102269 ?auto_102272 ) ) ( HOLDING ?auto_102269 ) ( CLEAR ?auto_102268 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102266 ?auto_102267 ?auto_102268 ?auto_102269 )
      ( MAKE-6PILE ?auto_102266 ?auto_102267 ?auto_102268 ?auto_102269 ?auto_102270 ?auto_102271 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102274 - BLOCK
      ?auto_102275 - BLOCK
      ?auto_102276 - BLOCK
      ?auto_102277 - BLOCK
      ?auto_102278 - BLOCK
      ?auto_102279 - BLOCK
    )
    :vars
    (
      ?auto_102280 - BLOCK
      ?auto_102281 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102274 ) ( ON ?auto_102275 ?auto_102274 ) ( ON ?auto_102276 ?auto_102275 ) ( not ( = ?auto_102274 ?auto_102275 ) ) ( not ( = ?auto_102274 ?auto_102276 ) ) ( not ( = ?auto_102274 ?auto_102277 ) ) ( not ( = ?auto_102274 ?auto_102278 ) ) ( not ( = ?auto_102274 ?auto_102279 ) ) ( not ( = ?auto_102275 ?auto_102276 ) ) ( not ( = ?auto_102275 ?auto_102277 ) ) ( not ( = ?auto_102275 ?auto_102278 ) ) ( not ( = ?auto_102275 ?auto_102279 ) ) ( not ( = ?auto_102276 ?auto_102277 ) ) ( not ( = ?auto_102276 ?auto_102278 ) ) ( not ( = ?auto_102276 ?auto_102279 ) ) ( not ( = ?auto_102277 ?auto_102278 ) ) ( not ( = ?auto_102277 ?auto_102279 ) ) ( not ( = ?auto_102278 ?auto_102279 ) ) ( ON ?auto_102279 ?auto_102280 ) ( not ( = ?auto_102274 ?auto_102280 ) ) ( not ( = ?auto_102275 ?auto_102280 ) ) ( not ( = ?auto_102276 ?auto_102280 ) ) ( not ( = ?auto_102277 ?auto_102280 ) ) ( not ( = ?auto_102278 ?auto_102280 ) ) ( not ( = ?auto_102279 ?auto_102280 ) ) ( ON ?auto_102278 ?auto_102279 ) ( ON-TABLE ?auto_102281 ) ( ON ?auto_102280 ?auto_102281 ) ( not ( = ?auto_102281 ?auto_102280 ) ) ( not ( = ?auto_102281 ?auto_102279 ) ) ( not ( = ?auto_102281 ?auto_102278 ) ) ( not ( = ?auto_102274 ?auto_102281 ) ) ( not ( = ?auto_102275 ?auto_102281 ) ) ( not ( = ?auto_102276 ?auto_102281 ) ) ( not ( = ?auto_102277 ?auto_102281 ) ) ( CLEAR ?auto_102276 ) ( ON ?auto_102277 ?auto_102278 ) ( CLEAR ?auto_102277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102281 ?auto_102280 ?auto_102279 ?auto_102278 )
      ( MAKE-6PILE ?auto_102274 ?auto_102275 ?auto_102276 ?auto_102277 ?auto_102278 ?auto_102279 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102282 - BLOCK
      ?auto_102283 - BLOCK
      ?auto_102284 - BLOCK
      ?auto_102285 - BLOCK
      ?auto_102286 - BLOCK
      ?auto_102287 - BLOCK
    )
    :vars
    (
      ?auto_102289 - BLOCK
      ?auto_102288 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102282 ) ( ON ?auto_102283 ?auto_102282 ) ( not ( = ?auto_102282 ?auto_102283 ) ) ( not ( = ?auto_102282 ?auto_102284 ) ) ( not ( = ?auto_102282 ?auto_102285 ) ) ( not ( = ?auto_102282 ?auto_102286 ) ) ( not ( = ?auto_102282 ?auto_102287 ) ) ( not ( = ?auto_102283 ?auto_102284 ) ) ( not ( = ?auto_102283 ?auto_102285 ) ) ( not ( = ?auto_102283 ?auto_102286 ) ) ( not ( = ?auto_102283 ?auto_102287 ) ) ( not ( = ?auto_102284 ?auto_102285 ) ) ( not ( = ?auto_102284 ?auto_102286 ) ) ( not ( = ?auto_102284 ?auto_102287 ) ) ( not ( = ?auto_102285 ?auto_102286 ) ) ( not ( = ?auto_102285 ?auto_102287 ) ) ( not ( = ?auto_102286 ?auto_102287 ) ) ( ON ?auto_102287 ?auto_102289 ) ( not ( = ?auto_102282 ?auto_102289 ) ) ( not ( = ?auto_102283 ?auto_102289 ) ) ( not ( = ?auto_102284 ?auto_102289 ) ) ( not ( = ?auto_102285 ?auto_102289 ) ) ( not ( = ?auto_102286 ?auto_102289 ) ) ( not ( = ?auto_102287 ?auto_102289 ) ) ( ON ?auto_102286 ?auto_102287 ) ( ON-TABLE ?auto_102288 ) ( ON ?auto_102289 ?auto_102288 ) ( not ( = ?auto_102288 ?auto_102289 ) ) ( not ( = ?auto_102288 ?auto_102287 ) ) ( not ( = ?auto_102288 ?auto_102286 ) ) ( not ( = ?auto_102282 ?auto_102288 ) ) ( not ( = ?auto_102283 ?auto_102288 ) ) ( not ( = ?auto_102284 ?auto_102288 ) ) ( not ( = ?auto_102285 ?auto_102288 ) ) ( ON ?auto_102285 ?auto_102286 ) ( CLEAR ?auto_102285 ) ( HOLDING ?auto_102284 ) ( CLEAR ?auto_102283 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102282 ?auto_102283 ?auto_102284 )
      ( MAKE-6PILE ?auto_102282 ?auto_102283 ?auto_102284 ?auto_102285 ?auto_102286 ?auto_102287 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102290 - BLOCK
      ?auto_102291 - BLOCK
      ?auto_102292 - BLOCK
      ?auto_102293 - BLOCK
      ?auto_102294 - BLOCK
      ?auto_102295 - BLOCK
    )
    :vars
    (
      ?auto_102296 - BLOCK
      ?auto_102297 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102290 ) ( ON ?auto_102291 ?auto_102290 ) ( not ( = ?auto_102290 ?auto_102291 ) ) ( not ( = ?auto_102290 ?auto_102292 ) ) ( not ( = ?auto_102290 ?auto_102293 ) ) ( not ( = ?auto_102290 ?auto_102294 ) ) ( not ( = ?auto_102290 ?auto_102295 ) ) ( not ( = ?auto_102291 ?auto_102292 ) ) ( not ( = ?auto_102291 ?auto_102293 ) ) ( not ( = ?auto_102291 ?auto_102294 ) ) ( not ( = ?auto_102291 ?auto_102295 ) ) ( not ( = ?auto_102292 ?auto_102293 ) ) ( not ( = ?auto_102292 ?auto_102294 ) ) ( not ( = ?auto_102292 ?auto_102295 ) ) ( not ( = ?auto_102293 ?auto_102294 ) ) ( not ( = ?auto_102293 ?auto_102295 ) ) ( not ( = ?auto_102294 ?auto_102295 ) ) ( ON ?auto_102295 ?auto_102296 ) ( not ( = ?auto_102290 ?auto_102296 ) ) ( not ( = ?auto_102291 ?auto_102296 ) ) ( not ( = ?auto_102292 ?auto_102296 ) ) ( not ( = ?auto_102293 ?auto_102296 ) ) ( not ( = ?auto_102294 ?auto_102296 ) ) ( not ( = ?auto_102295 ?auto_102296 ) ) ( ON ?auto_102294 ?auto_102295 ) ( ON-TABLE ?auto_102297 ) ( ON ?auto_102296 ?auto_102297 ) ( not ( = ?auto_102297 ?auto_102296 ) ) ( not ( = ?auto_102297 ?auto_102295 ) ) ( not ( = ?auto_102297 ?auto_102294 ) ) ( not ( = ?auto_102290 ?auto_102297 ) ) ( not ( = ?auto_102291 ?auto_102297 ) ) ( not ( = ?auto_102292 ?auto_102297 ) ) ( not ( = ?auto_102293 ?auto_102297 ) ) ( ON ?auto_102293 ?auto_102294 ) ( CLEAR ?auto_102291 ) ( ON ?auto_102292 ?auto_102293 ) ( CLEAR ?auto_102292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102297 ?auto_102296 ?auto_102295 ?auto_102294 ?auto_102293 )
      ( MAKE-6PILE ?auto_102290 ?auto_102291 ?auto_102292 ?auto_102293 ?auto_102294 ?auto_102295 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102298 - BLOCK
      ?auto_102299 - BLOCK
      ?auto_102300 - BLOCK
      ?auto_102301 - BLOCK
      ?auto_102302 - BLOCK
      ?auto_102303 - BLOCK
    )
    :vars
    (
      ?auto_102304 - BLOCK
      ?auto_102305 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102298 ) ( not ( = ?auto_102298 ?auto_102299 ) ) ( not ( = ?auto_102298 ?auto_102300 ) ) ( not ( = ?auto_102298 ?auto_102301 ) ) ( not ( = ?auto_102298 ?auto_102302 ) ) ( not ( = ?auto_102298 ?auto_102303 ) ) ( not ( = ?auto_102299 ?auto_102300 ) ) ( not ( = ?auto_102299 ?auto_102301 ) ) ( not ( = ?auto_102299 ?auto_102302 ) ) ( not ( = ?auto_102299 ?auto_102303 ) ) ( not ( = ?auto_102300 ?auto_102301 ) ) ( not ( = ?auto_102300 ?auto_102302 ) ) ( not ( = ?auto_102300 ?auto_102303 ) ) ( not ( = ?auto_102301 ?auto_102302 ) ) ( not ( = ?auto_102301 ?auto_102303 ) ) ( not ( = ?auto_102302 ?auto_102303 ) ) ( ON ?auto_102303 ?auto_102304 ) ( not ( = ?auto_102298 ?auto_102304 ) ) ( not ( = ?auto_102299 ?auto_102304 ) ) ( not ( = ?auto_102300 ?auto_102304 ) ) ( not ( = ?auto_102301 ?auto_102304 ) ) ( not ( = ?auto_102302 ?auto_102304 ) ) ( not ( = ?auto_102303 ?auto_102304 ) ) ( ON ?auto_102302 ?auto_102303 ) ( ON-TABLE ?auto_102305 ) ( ON ?auto_102304 ?auto_102305 ) ( not ( = ?auto_102305 ?auto_102304 ) ) ( not ( = ?auto_102305 ?auto_102303 ) ) ( not ( = ?auto_102305 ?auto_102302 ) ) ( not ( = ?auto_102298 ?auto_102305 ) ) ( not ( = ?auto_102299 ?auto_102305 ) ) ( not ( = ?auto_102300 ?auto_102305 ) ) ( not ( = ?auto_102301 ?auto_102305 ) ) ( ON ?auto_102301 ?auto_102302 ) ( ON ?auto_102300 ?auto_102301 ) ( CLEAR ?auto_102300 ) ( HOLDING ?auto_102299 ) ( CLEAR ?auto_102298 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102298 ?auto_102299 )
      ( MAKE-6PILE ?auto_102298 ?auto_102299 ?auto_102300 ?auto_102301 ?auto_102302 ?auto_102303 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102306 - BLOCK
      ?auto_102307 - BLOCK
      ?auto_102308 - BLOCK
      ?auto_102309 - BLOCK
      ?auto_102310 - BLOCK
      ?auto_102311 - BLOCK
    )
    :vars
    (
      ?auto_102312 - BLOCK
      ?auto_102313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102306 ) ( not ( = ?auto_102306 ?auto_102307 ) ) ( not ( = ?auto_102306 ?auto_102308 ) ) ( not ( = ?auto_102306 ?auto_102309 ) ) ( not ( = ?auto_102306 ?auto_102310 ) ) ( not ( = ?auto_102306 ?auto_102311 ) ) ( not ( = ?auto_102307 ?auto_102308 ) ) ( not ( = ?auto_102307 ?auto_102309 ) ) ( not ( = ?auto_102307 ?auto_102310 ) ) ( not ( = ?auto_102307 ?auto_102311 ) ) ( not ( = ?auto_102308 ?auto_102309 ) ) ( not ( = ?auto_102308 ?auto_102310 ) ) ( not ( = ?auto_102308 ?auto_102311 ) ) ( not ( = ?auto_102309 ?auto_102310 ) ) ( not ( = ?auto_102309 ?auto_102311 ) ) ( not ( = ?auto_102310 ?auto_102311 ) ) ( ON ?auto_102311 ?auto_102312 ) ( not ( = ?auto_102306 ?auto_102312 ) ) ( not ( = ?auto_102307 ?auto_102312 ) ) ( not ( = ?auto_102308 ?auto_102312 ) ) ( not ( = ?auto_102309 ?auto_102312 ) ) ( not ( = ?auto_102310 ?auto_102312 ) ) ( not ( = ?auto_102311 ?auto_102312 ) ) ( ON ?auto_102310 ?auto_102311 ) ( ON-TABLE ?auto_102313 ) ( ON ?auto_102312 ?auto_102313 ) ( not ( = ?auto_102313 ?auto_102312 ) ) ( not ( = ?auto_102313 ?auto_102311 ) ) ( not ( = ?auto_102313 ?auto_102310 ) ) ( not ( = ?auto_102306 ?auto_102313 ) ) ( not ( = ?auto_102307 ?auto_102313 ) ) ( not ( = ?auto_102308 ?auto_102313 ) ) ( not ( = ?auto_102309 ?auto_102313 ) ) ( ON ?auto_102309 ?auto_102310 ) ( ON ?auto_102308 ?auto_102309 ) ( CLEAR ?auto_102306 ) ( ON ?auto_102307 ?auto_102308 ) ( CLEAR ?auto_102307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102313 ?auto_102312 ?auto_102311 ?auto_102310 ?auto_102309 ?auto_102308 )
      ( MAKE-6PILE ?auto_102306 ?auto_102307 ?auto_102308 ?auto_102309 ?auto_102310 ?auto_102311 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102314 - BLOCK
      ?auto_102315 - BLOCK
      ?auto_102316 - BLOCK
      ?auto_102317 - BLOCK
      ?auto_102318 - BLOCK
      ?auto_102319 - BLOCK
    )
    :vars
    (
      ?auto_102321 - BLOCK
      ?auto_102320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102314 ?auto_102315 ) ) ( not ( = ?auto_102314 ?auto_102316 ) ) ( not ( = ?auto_102314 ?auto_102317 ) ) ( not ( = ?auto_102314 ?auto_102318 ) ) ( not ( = ?auto_102314 ?auto_102319 ) ) ( not ( = ?auto_102315 ?auto_102316 ) ) ( not ( = ?auto_102315 ?auto_102317 ) ) ( not ( = ?auto_102315 ?auto_102318 ) ) ( not ( = ?auto_102315 ?auto_102319 ) ) ( not ( = ?auto_102316 ?auto_102317 ) ) ( not ( = ?auto_102316 ?auto_102318 ) ) ( not ( = ?auto_102316 ?auto_102319 ) ) ( not ( = ?auto_102317 ?auto_102318 ) ) ( not ( = ?auto_102317 ?auto_102319 ) ) ( not ( = ?auto_102318 ?auto_102319 ) ) ( ON ?auto_102319 ?auto_102321 ) ( not ( = ?auto_102314 ?auto_102321 ) ) ( not ( = ?auto_102315 ?auto_102321 ) ) ( not ( = ?auto_102316 ?auto_102321 ) ) ( not ( = ?auto_102317 ?auto_102321 ) ) ( not ( = ?auto_102318 ?auto_102321 ) ) ( not ( = ?auto_102319 ?auto_102321 ) ) ( ON ?auto_102318 ?auto_102319 ) ( ON-TABLE ?auto_102320 ) ( ON ?auto_102321 ?auto_102320 ) ( not ( = ?auto_102320 ?auto_102321 ) ) ( not ( = ?auto_102320 ?auto_102319 ) ) ( not ( = ?auto_102320 ?auto_102318 ) ) ( not ( = ?auto_102314 ?auto_102320 ) ) ( not ( = ?auto_102315 ?auto_102320 ) ) ( not ( = ?auto_102316 ?auto_102320 ) ) ( not ( = ?auto_102317 ?auto_102320 ) ) ( ON ?auto_102317 ?auto_102318 ) ( ON ?auto_102316 ?auto_102317 ) ( ON ?auto_102315 ?auto_102316 ) ( CLEAR ?auto_102315 ) ( HOLDING ?auto_102314 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102314 )
      ( MAKE-6PILE ?auto_102314 ?auto_102315 ?auto_102316 ?auto_102317 ?auto_102318 ?auto_102319 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_102322 - BLOCK
      ?auto_102323 - BLOCK
      ?auto_102324 - BLOCK
      ?auto_102325 - BLOCK
      ?auto_102326 - BLOCK
      ?auto_102327 - BLOCK
    )
    :vars
    (
      ?auto_102328 - BLOCK
      ?auto_102329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102322 ?auto_102323 ) ) ( not ( = ?auto_102322 ?auto_102324 ) ) ( not ( = ?auto_102322 ?auto_102325 ) ) ( not ( = ?auto_102322 ?auto_102326 ) ) ( not ( = ?auto_102322 ?auto_102327 ) ) ( not ( = ?auto_102323 ?auto_102324 ) ) ( not ( = ?auto_102323 ?auto_102325 ) ) ( not ( = ?auto_102323 ?auto_102326 ) ) ( not ( = ?auto_102323 ?auto_102327 ) ) ( not ( = ?auto_102324 ?auto_102325 ) ) ( not ( = ?auto_102324 ?auto_102326 ) ) ( not ( = ?auto_102324 ?auto_102327 ) ) ( not ( = ?auto_102325 ?auto_102326 ) ) ( not ( = ?auto_102325 ?auto_102327 ) ) ( not ( = ?auto_102326 ?auto_102327 ) ) ( ON ?auto_102327 ?auto_102328 ) ( not ( = ?auto_102322 ?auto_102328 ) ) ( not ( = ?auto_102323 ?auto_102328 ) ) ( not ( = ?auto_102324 ?auto_102328 ) ) ( not ( = ?auto_102325 ?auto_102328 ) ) ( not ( = ?auto_102326 ?auto_102328 ) ) ( not ( = ?auto_102327 ?auto_102328 ) ) ( ON ?auto_102326 ?auto_102327 ) ( ON-TABLE ?auto_102329 ) ( ON ?auto_102328 ?auto_102329 ) ( not ( = ?auto_102329 ?auto_102328 ) ) ( not ( = ?auto_102329 ?auto_102327 ) ) ( not ( = ?auto_102329 ?auto_102326 ) ) ( not ( = ?auto_102322 ?auto_102329 ) ) ( not ( = ?auto_102323 ?auto_102329 ) ) ( not ( = ?auto_102324 ?auto_102329 ) ) ( not ( = ?auto_102325 ?auto_102329 ) ) ( ON ?auto_102325 ?auto_102326 ) ( ON ?auto_102324 ?auto_102325 ) ( ON ?auto_102323 ?auto_102324 ) ( ON ?auto_102322 ?auto_102323 ) ( CLEAR ?auto_102322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102329 ?auto_102328 ?auto_102327 ?auto_102326 ?auto_102325 ?auto_102324 ?auto_102323 )
      ( MAKE-6PILE ?auto_102322 ?auto_102323 ?auto_102324 ?auto_102325 ?auto_102326 ?auto_102327 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102331 - BLOCK
    )
    :vars
    (
      ?auto_102332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102332 ?auto_102331 ) ( CLEAR ?auto_102332 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102331 ) ( not ( = ?auto_102331 ?auto_102332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102332 ?auto_102331 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102333 - BLOCK
    )
    :vars
    (
      ?auto_102334 - BLOCK
      ?auto_102335 - BLOCK
      ?auto_102336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102334 ?auto_102333 ) ( CLEAR ?auto_102334 ) ( ON-TABLE ?auto_102333 ) ( not ( = ?auto_102333 ?auto_102334 ) ) ( HOLDING ?auto_102335 ) ( CLEAR ?auto_102336 ) ( not ( = ?auto_102333 ?auto_102335 ) ) ( not ( = ?auto_102333 ?auto_102336 ) ) ( not ( = ?auto_102334 ?auto_102335 ) ) ( not ( = ?auto_102334 ?auto_102336 ) ) ( not ( = ?auto_102335 ?auto_102336 ) ) )
    :subtasks
    ( ( !STACK ?auto_102335 ?auto_102336 )
      ( MAKE-1PILE ?auto_102333 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102337 - BLOCK
    )
    :vars
    (
      ?auto_102339 - BLOCK
      ?auto_102340 - BLOCK
      ?auto_102338 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102339 ?auto_102337 ) ( ON-TABLE ?auto_102337 ) ( not ( = ?auto_102337 ?auto_102339 ) ) ( CLEAR ?auto_102340 ) ( not ( = ?auto_102337 ?auto_102338 ) ) ( not ( = ?auto_102337 ?auto_102340 ) ) ( not ( = ?auto_102339 ?auto_102338 ) ) ( not ( = ?auto_102339 ?auto_102340 ) ) ( not ( = ?auto_102338 ?auto_102340 ) ) ( ON ?auto_102338 ?auto_102339 ) ( CLEAR ?auto_102338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102337 ?auto_102339 )
      ( MAKE-1PILE ?auto_102337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102341 - BLOCK
    )
    :vars
    (
      ?auto_102344 - BLOCK
      ?auto_102343 - BLOCK
      ?auto_102342 - BLOCK
      ?auto_102348 - BLOCK
      ?auto_102346 - BLOCK
      ?auto_102347 - BLOCK
      ?auto_102345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102344 ?auto_102341 ) ( ON-TABLE ?auto_102341 ) ( not ( = ?auto_102341 ?auto_102344 ) ) ( not ( = ?auto_102341 ?auto_102343 ) ) ( not ( = ?auto_102341 ?auto_102342 ) ) ( not ( = ?auto_102344 ?auto_102343 ) ) ( not ( = ?auto_102344 ?auto_102342 ) ) ( not ( = ?auto_102343 ?auto_102342 ) ) ( ON ?auto_102343 ?auto_102344 ) ( CLEAR ?auto_102343 ) ( HOLDING ?auto_102342 ) ( CLEAR ?auto_102348 ) ( ON-TABLE ?auto_102346 ) ( ON ?auto_102347 ?auto_102346 ) ( ON ?auto_102345 ?auto_102347 ) ( ON ?auto_102348 ?auto_102345 ) ( not ( = ?auto_102346 ?auto_102347 ) ) ( not ( = ?auto_102346 ?auto_102345 ) ) ( not ( = ?auto_102346 ?auto_102348 ) ) ( not ( = ?auto_102346 ?auto_102342 ) ) ( not ( = ?auto_102347 ?auto_102345 ) ) ( not ( = ?auto_102347 ?auto_102348 ) ) ( not ( = ?auto_102347 ?auto_102342 ) ) ( not ( = ?auto_102345 ?auto_102348 ) ) ( not ( = ?auto_102345 ?auto_102342 ) ) ( not ( = ?auto_102348 ?auto_102342 ) ) ( not ( = ?auto_102341 ?auto_102348 ) ) ( not ( = ?auto_102341 ?auto_102346 ) ) ( not ( = ?auto_102341 ?auto_102347 ) ) ( not ( = ?auto_102341 ?auto_102345 ) ) ( not ( = ?auto_102344 ?auto_102348 ) ) ( not ( = ?auto_102344 ?auto_102346 ) ) ( not ( = ?auto_102344 ?auto_102347 ) ) ( not ( = ?auto_102344 ?auto_102345 ) ) ( not ( = ?auto_102343 ?auto_102348 ) ) ( not ( = ?auto_102343 ?auto_102346 ) ) ( not ( = ?auto_102343 ?auto_102347 ) ) ( not ( = ?auto_102343 ?auto_102345 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102346 ?auto_102347 ?auto_102345 ?auto_102348 ?auto_102342 )
      ( MAKE-1PILE ?auto_102341 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102349 - BLOCK
    )
    :vars
    (
      ?auto_102354 - BLOCK
      ?auto_102350 - BLOCK
      ?auto_102356 - BLOCK
      ?auto_102351 - BLOCK
      ?auto_102352 - BLOCK
      ?auto_102353 - BLOCK
      ?auto_102355 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102354 ?auto_102349 ) ( ON-TABLE ?auto_102349 ) ( not ( = ?auto_102349 ?auto_102354 ) ) ( not ( = ?auto_102349 ?auto_102350 ) ) ( not ( = ?auto_102349 ?auto_102356 ) ) ( not ( = ?auto_102354 ?auto_102350 ) ) ( not ( = ?auto_102354 ?auto_102356 ) ) ( not ( = ?auto_102350 ?auto_102356 ) ) ( ON ?auto_102350 ?auto_102354 ) ( CLEAR ?auto_102351 ) ( ON-TABLE ?auto_102352 ) ( ON ?auto_102353 ?auto_102352 ) ( ON ?auto_102355 ?auto_102353 ) ( ON ?auto_102351 ?auto_102355 ) ( not ( = ?auto_102352 ?auto_102353 ) ) ( not ( = ?auto_102352 ?auto_102355 ) ) ( not ( = ?auto_102352 ?auto_102351 ) ) ( not ( = ?auto_102352 ?auto_102356 ) ) ( not ( = ?auto_102353 ?auto_102355 ) ) ( not ( = ?auto_102353 ?auto_102351 ) ) ( not ( = ?auto_102353 ?auto_102356 ) ) ( not ( = ?auto_102355 ?auto_102351 ) ) ( not ( = ?auto_102355 ?auto_102356 ) ) ( not ( = ?auto_102351 ?auto_102356 ) ) ( not ( = ?auto_102349 ?auto_102351 ) ) ( not ( = ?auto_102349 ?auto_102352 ) ) ( not ( = ?auto_102349 ?auto_102353 ) ) ( not ( = ?auto_102349 ?auto_102355 ) ) ( not ( = ?auto_102354 ?auto_102351 ) ) ( not ( = ?auto_102354 ?auto_102352 ) ) ( not ( = ?auto_102354 ?auto_102353 ) ) ( not ( = ?auto_102354 ?auto_102355 ) ) ( not ( = ?auto_102350 ?auto_102351 ) ) ( not ( = ?auto_102350 ?auto_102352 ) ) ( not ( = ?auto_102350 ?auto_102353 ) ) ( not ( = ?auto_102350 ?auto_102355 ) ) ( ON ?auto_102356 ?auto_102350 ) ( CLEAR ?auto_102356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102349 ?auto_102354 ?auto_102350 )
      ( MAKE-1PILE ?auto_102349 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102357 - BLOCK
    )
    :vars
    (
      ?auto_102358 - BLOCK
      ?auto_102361 - BLOCK
      ?auto_102359 - BLOCK
      ?auto_102364 - BLOCK
      ?auto_102362 - BLOCK
      ?auto_102360 - BLOCK
      ?auto_102363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102358 ?auto_102357 ) ( ON-TABLE ?auto_102357 ) ( not ( = ?auto_102357 ?auto_102358 ) ) ( not ( = ?auto_102357 ?auto_102361 ) ) ( not ( = ?auto_102357 ?auto_102359 ) ) ( not ( = ?auto_102358 ?auto_102361 ) ) ( not ( = ?auto_102358 ?auto_102359 ) ) ( not ( = ?auto_102361 ?auto_102359 ) ) ( ON ?auto_102361 ?auto_102358 ) ( ON-TABLE ?auto_102364 ) ( ON ?auto_102362 ?auto_102364 ) ( ON ?auto_102360 ?auto_102362 ) ( not ( = ?auto_102364 ?auto_102362 ) ) ( not ( = ?auto_102364 ?auto_102360 ) ) ( not ( = ?auto_102364 ?auto_102363 ) ) ( not ( = ?auto_102364 ?auto_102359 ) ) ( not ( = ?auto_102362 ?auto_102360 ) ) ( not ( = ?auto_102362 ?auto_102363 ) ) ( not ( = ?auto_102362 ?auto_102359 ) ) ( not ( = ?auto_102360 ?auto_102363 ) ) ( not ( = ?auto_102360 ?auto_102359 ) ) ( not ( = ?auto_102363 ?auto_102359 ) ) ( not ( = ?auto_102357 ?auto_102363 ) ) ( not ( = ?auto_102357 ?auto_102364 ) ) ( not ( = ?auto_102357 ?auto_102362 ) ) ( not ( = ?auto_102357 ?auto_102360 ) ) ( not ( = ?auto_102358 ?auto_102363 ) ) ( not ( = ?auto_102358 ?auto_102364 ) ) ( not ( = ?auto_102358 ?auto_102362 ) ) ( not ( = ?auto_102358 ?auto_102360 ) ) ( not ( = ?auto_102361 ?auto_102363 ) ) ( not ( = ?auto_102361 ?auto_102364 ) ) ( not ( = ?auto_102361 ?auto_102362 ) ) ( not ( = ?auto_102361 ?auto_102360 ) ) ( ON ?auto_102359 ?auto_102361 ) ( CLEAR ?auto_102359 ) ( HOLDING ?auto_102363 ) ( CLEAR ?auto_102360 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102364 ?auto_102362 ?auto_102360 ?auto_102363 )
      ( MAKE-1PILE ?auto_102357 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102365 - BLOCK
    )
    :vars
    (
      ?auto_102368 - BLOCK
      ?auto_102371 - BLOCK
      ?auto_102369 - BLOCK
      ?auto_102366 - BLOCK
      ?auto_102372 - BLOCK
      ?auto_102370 - BLOCK
      ?auto_102367 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102368 ?auto_102365 ) ( ON-TABLE ?auto_102365 ) ( not ( = ?auto_102365 ?auto_102368 ) ) ( not ( = ?auto_102365 ?auto_102371 ) ) ( not ( = ?auto_102365 ?auto_102369 ) ) ( not ( = ?auto_102368 ?auto_102371 ) ) ( not ( = ?auto_102368 ?auto_102369 ) ) ( not ( = ?auto_102371 ?auto_102369 ) ) ( ON ?auto_102371 ?auto_102368 ) ( ON-TABLE ?auto_102366 ) ( ON ?auto_102372 ?auto_102366 ) ( ON ?auto_102370 ?auto_102372 ) ( not ( = ?auto_102366 ?auto_102372 ) ) ( not ( = ?auto_102366 ?auto_102370 ) ) ( not ( = ?auto_102366 ?auto_102367 ) ) ( not ( = ?auto_102366 ?auto_102369 ) ) ( not ( = ?auto_102372 ?auto_102370 ) ) ( not ( = ?auto_102372 ?auto_102367 ) ) ( not ( = ?auto_102372 ?auto_102369 ) ) ( not ( = ?auto_102370 ?auto_102367 ) ) ( not ( = ?auto_102370 ?auto_102369 ) ) ( not ( = ?auto_102367 ?auto_102369 ) ) ( not ( = ?auto_102365 ?auto_102367 ) ) ( not ( = ?auto_102365 ?auto_102366 ) ) ( not ( = ?auto_102365 ?auto_102372 ) ) ( not ( = ?auto_102365 ?auto_102370 ) ) ( not ( = ?auto_102368 ?auto_102367 ) ) ( not ( = ?auto_102368 ?auto_102366 ) ) ( not ( = ?auto_102368 ?auto_102372 ) ) ( not ( = ?auto_102368 ?auto_102370 ) ) ( not ( = ?auto_102371 ?auto_102367 ) ) ( not ( = ?auto_102371 ?auto_102366 ) ) ( not ( = ?auto_102371 ?auto_102372 ) ) ( not ( = ?auto_102371 ?auto_102370 ) ) ( ON ?auto_102369 ?auto_102371 ) ( CLEAR ?auto_102370 ) ( ON ?auto_102367 ?auto_102369 ) ( CLEAR ?auto_102367 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102365 ?auto_102368 ?auto_102371 ?auto_102369 )
      ( MAKE-1PILE ?auto_102365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102373 - BLOCK
    )
    :vars
    (
      ?auto_102375 - BLOCK
      ?auto_102379 - BLOCK
      ?auto_102377 - BLOCK
      ?auto_102378 - BLOCK
      ?auto_102380 - BLOCK
      ?auto_102376 - BLOCK
      ?auto_102374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102375 ?auto_102373 ) ( ON-TABLE ?auto_102373 ) ( not ( = ?auto_102373 ?auto_102375 ) ) ( not ( = ?auto_102373 ?auto_102379 ) ) ( not ( = ?auto_102373 ?auto_102377 ) ) ( not ( = ?auto_102375 ?auto_102379 ) ) ( not ( = ?auto_102375 ?auto_102377 ) ) ( not ( = ?auto_102379 ?auto_102377 ) ) ( ON ?auto_102379 ?auto_102375 ) ( ON-TABLE ?auto_102378 ) ( ON ?auto_102380 ?auto_102378 ) ( not ( = ?auto_102378 ?auto_102380 ) ) ( not ( = ?auto_102378 ?auto_102376 ) ) ( not ( = ?auto_102378 ?auto_102374 ) ) ( not ( = ?auto_102378 ?auto_102377 ) ) ( not ( = ?auto_102380 ?auto_102376 ) ) ( not ( = ?auto_102380 ?auto_102374 ) ) ( not ( = ?auto_102380 ?auto_102377 ) ) ( not ( = ?auto_102376 ?auto_102374 ) ) ( not ( = ?auto_102376 ?auto_102377 ) ) ( not ( = ?auto_102374 ?auto_102377 ) ) ( not ( = ?auto_102373 ?auto_102374 ) ) ( not ( = ?auto_102373 ?auto_102378 ) ) ( not ( = ?auto_102373 ?auto_102380 ) ) ( not ( = ?auto_102373 ?auto_102376 ) ) ( not ( = ?auto_102375 ?auto_102374 ) ) ( not ( = ?auto_102375 ?auto_102378 ) ) ( not ( = ?auto_102375 ?auto_102380 ) ) ( not ( = ?auto_102375 ?auto_102376 ) ) ( not ( = ?auto_102379 ?auto_102374 ) ) ( not ( = ?auto_102379 ?auto_102378 ) ) ( not ( = ?auto_102379 ?auto_102380 ) ) ( not ( = ?auto_102379 ?auto_102376 ) ) ( ON ?auto_102377 ?auto_102379 ) ( ON ?auto_102374 ?auto_102377 ) ( CLEAR ?auto_102374 ) ( HOLDING ?auto_102376 ) ( CLEAR ?auto_102380 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102378 ?auto_102380 ?auto_102376 )
      ( MAKE-1PILE ?auto_102373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102381 - BLOCK
    )
    :vars
    (
      ?auto_102384 - BLOCK
      ?auto_102383 - BLOCK
      ?auto_102387 - BLOCK
      ?auto_102385 - BLOCK
      ?auto_102388 - BLOCK
      ?auto_102386 - BLOCK
      ?auto_102382 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102384 ?auto_102381 ) ( ON-TABLE ?auto_102381 ) ( not ( = ?auto_102381 ?auto_102384 ) ) ( not ( = ?auto_102381 ?auto_102383 ) ) ( not ( = ?auto_102381 ?auto_102387 ) ) ( not ( = ?auto_102384 ?auto_102383 ) ) ( not ( = ?auto_102384 ?auto_102387 ) ) ( not ( = ?auto_102383 ?auto_102387 ) ) ( ON ?auto_102383 ?auto_102384 ) ( ON-TABLE ?auto_102385 ) ( ON ?auto_102388 ?auto_102385 ) ( not ( = ?auto_102385 ?auto_102388 ) ) ( not ( = ?auto_102385 ?auto_102386 ) ) ( not ( = ?auto_102385 ?auto_102382 ) ) ( not ( = ?auto_102385 ?auto_102387 ) ) ( not ( = ?auto_102388 ?auto_102386 ) ) ( not ( = ?auto_102388 ?auto_102382 ) ) ( not ( = ?auto_102388 ?auto_102387 ) ) ( not ( = ?auto_102386 ?auto_102382 ) ) ( not ( = ?auto_102386 ?auto_102387 ) ) ( not ( = ?auto_102382 ?auto_102387 ) ) ( not ( = ?auto_102381 ?auto_102382 ) ) ( not ( = ?auto_102381 ?auto_102385 ) ) ( not ( = ?auto_102381 ?auto_102388 ) ) ( not ( = ?auto_102381 ?auto_102386 ) ) ( not ( = ?auto_102384 ?auto_102382 ) ) ( not ( = ?auto_102384 ?auto_102385 ) ) ( not ( = ?auto_102384 ?auto_102388 ) ) ( not ( = ?auto_102384 ?auto_102386 ) ) ( not ( = ?auto_102383 ?auto_102382 ) ) ( not ( = ?auto_102383 ?auto_102385 ) ) ( not ( = ?auto_102383 ?auto_102388 ) ) ( not ( = ?auto_102383 ?auto_102386 ) ) ( ON ?auto_102387 ?auto_102383 ) ( ON ?auto_102382 ?auto_102387 ) ( CLEAR ?auto_102388 ) ( ON ?auto_102386 ?auto_102382 ) ( CLEAR ?auto_102386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102381 ?auto_102384 ?auto_102383 ?auto_102387 ?auto_102382 )
      ( MAKE-1PILE ?auto_102381 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102389 - BLOCK
    )
    :vars
    (
      ?auto_102392 - BLOCK
      ?auto_102391 - BLOCK
      ?auto_102396 - BLOCK
      ?auto_102393 - BLOCK
      ?auto_102390 - BLOCK
      ?auto_102395 - BLOCK
      ?auto_102394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102392 ?auto_102389 ) ( ON-TABLE ?auto_102389 ) ( not ( = ?auto_102389 ?auto_102392 ) ) ( not ( = ?auto_102389 ?auto_102391 ) ) ( not ( = ?auto_102389 ?auto_102396 ) ) ( not ( = ?auto_102392 ?auto_102391 ) ) ( not ( = ?auto_102392 ?auto_102396 ) ) ( not ( = ?auto_102391 ?auto_102396 ) ) ( ON ?auto_102391 ?auto_102392 ) ( ON-TABLE ?auto_102393 ) ( not ( = ?auto_102393 ?auto_102390 ) ) ( not ( = ?auto_102393 ?auto_102395 ) ) ( not ( = ?auto_102393 ?auto_102394 ) ) ( not ( = ?auto_102393 ?auto_102396 ) ) ( not ( = ?auto_102390 ?auto_102395 ) ) ( not ( = ?auto_102390 ?auto_102394 ) ) ( not ( = ?auto_102390 ?auto_102396 ) ) ( not ( = ?auto_102395 ?auto_102394 ) ) ( not ( = ?auto_102395 ?auto_102396 ) ) ( not ( = ?auto_102394 ?auto_102396 ) ) ( not ( = ?auto_102389 ?auto_102394 ) ) ( not ( = ?auto_102389 ?auto_102393 ) ) ( not ( = ?auto_102389 ?auto_102390 ) ) ( not ( = ?auto_102389 ?auto_102395 ) ) ( not ( = ?auto_102392 ?auto_102394 ) ) ( not ( = ?auto_102392 ?auto_102393 ) ) ( not ( = ?auto_102392 ?auto_102390 ) ) ( not ( = ?auto_102392 ?auto_102395 ) ) ( not ( = ?auto_102391 ?auto_102394 ) ) ( not ( = ?auto_102391 ?auto_102393 ) ) ( not ( = ?auto_102391 ?auto_102390 ) ) ( not ( = ?auto_102391 ?auto_102395 ) ) ( ON ?auto_102396 ?auto_102391 ) ( ON ?auto_102394 ?auto_102396 ) ( ON ?auto_102395 ?auto_102394 ) ( CLEAR ?auto_102395 ) ( HOLDING ?auto_102390 ) ( CLEAR ?auto_102393 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102393 ?auto_102390 )
      ( MAKE-1PILE ?auto_102389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103803 - BLOCK
    )
    :vars
    (
      ?auto_103808 - BLOCK
      ?auto_103805 - BLOCK
      ?auto_103804 - BLOCK
      ?auto_103809 - BLOCK
      ?auto_103806 - BLOCK
      ?auto_103807 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103808 ?auto_103803 ) ( ON-TABLE ?auto_103803 ) ( not ( = ?auto_103803 ?auto_103808 ) ) ( not ( = ?auto_103803 ?auto_103805 ) ) ( not ( = ?auto_103803 ?auto_103804 ) ) ( not ( = ?auto_103808 ?auto_103805 ) ) ( not ( = ?auto_103808 ?auto_103804 ) ) ( not ( = ?auto_103805 ?auto_103804 ) ) ( ON ?auto_103805 ?auto_103808 ) ( not ( = ?auto_103809 ?auto_103806 ) ) ( not ( = ?auto_103809 ?auto_103807 ) ) ( not ( = ?auto_103809 ?auto_103804 ) ) ( not ( = ?auto_103806 ?auto_103807 ) ) ( not ( = ?auto_103806 ?auto_103804 ) ) ( not ( = ?auto_103807 ?auto_103804 ) ) ( not ( = ?auto_103803 ?auto_103807 ) ) ( not ( = ?auto_103803 ?auto_103809 ) ) ( not ( = ?auto_103803 ?auto_103806 ) ) ( not ( = ?auto_103808 ?auto_103807 ) ) ( not ( = ?auto_103808 ?auto_103809 ) ) ( not ( = ?auto_103808 ?auto_103806 ) ) ( not ( = ?auto_103805 ?auto_103807 ) ) ( not ( = ?auto_103805 ?auto_103809 ) ) ( not ( = ?auto_103805 ?auto_103806 ) ) ( ON ?auto_103804 ?auto_103805 ) ( ON ?auto_103807 ?auto_103804 ) ( ON ?auto_103806 ?auto_103807 ) ( ON ?auto_103809 ?auto_103806 ) ( CLEAR ?auto_103809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103803 ?auto_103808 ?auto_103805 ?auto_103804 ?auto_103807 ?auto_103806 )
      ( MAKE-1PILE ?auto_103803 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102405 - BLOCK
    )
    :vars
    (
      ?auto_102406 - BLOCK
      ?auto_102411 - BLOCK
      ?auto_102407 - BLOCK
      ?auto_102408 - BLOCK
      ?auto_102412 - BLOCK
      ?auto_102410 - BLOCK
      ?auto_102409 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102406 ?auto_102405 ) ( ON-TABLE ?auto_102405 ) ( not ( = ?auto_102405 ?auto_102406 ) ) ( not ( = ?auto_102405 ?auto_102411 ) ) ( not ( = ?auto_102405 ?auto_102407 ) ) ( not ( = ?auto_102406 ?auto_102411 ) ) ( not ( = ?auto_102406 ?auto_102407 ) ) ( not ( = ?auto_102411 ?auto_102407 ) ) ( ON ?auto_102411 ?auto_102406 ) ( not ( = ?auto_102408 ?auto_102412 ) ) ( not ( = ?auto_102408 ?auto_102410 ) ) ( not ( = ?auto_102408 ?auto_102409 ) ) ( not ( = ?auto_102408 ?auto_102407 ) ) ( not ( = ?auto_102412 ?auto_102410 ) ) ( not ( = ?auto_102412 ?auto_102409 ) ) ( not ( = ?auto_102412 ?auto_102407 ) ) ( not ( = ?auto_102410 ?auto_102409 ) ) ( not ( = ?auto_102410 ?auto_102407 ) ) ( not ( = ?auto_102409 ?auto_102407 ) ) ( not ( = ?auto_102405 ?auto_102409 ) ) ( not ( = ?auto_102405 ?auto_102408 ) ) ( not ( = ?auto_102405 ?auto_102412 ) ) ( not ( = ?auto_102405 ?auto_102410 ) ) ( not ( = ?auto_102406 ?auto_102409 ) ) ( not ( = ?auto_102406 ?auto_102408 ) ) ( not ( = ?auto_102406 ?auto_102412 ) ) ( not ( = ?auto_102406 ?auto_102410 ) ) ( not ( = ?auto_102411 ?auto_102409 ) ) ( not ( = ?auto_102411 ?auto_102408 ) ) ( not ( = ?auto_102411 ?auto_102412 ) ) ( not ( = ?auto_102411 ?auto_102410 ) ) ( ON ?auto_102407 ?auto_102411 ) ( ON ?auto_102409 ?auto_102407 ) ( ON ?auto_102410 ?auto_102409 ) ( ON ?auto_102412 ?auto_102410 ) ( CLEAR ?auto_102412 ) ( HOLDING ?auto_102408 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102408 )
      ( MAKE-1PILE ?auto_102405 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102413 - BLOCK
    )
    :vars
    (
      ?auto_102414 - BLOCK
      ?auto_102416 - BLOCK
      ?auto_102419 - BLOCK
      ?auto_102417 - BLOCK
      ?auto_102420 - BLOCK
      ?auto_102415 - BLOCK
      ?auto_102418 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102414 ?auto_102413 ) ( ON-TABLE ?auto_102413 ) ( not ( = ?auto_102413 ?auto_102414 ) ) ( not ( = ?auto_102413 ?auto_102416 ) ) ( not ( = ?auto_102413 ?auto_102419 ) ) ( not ( = ?auto_102414 ?auto_102416 ) ) ( not ( = ?auto_102414 ?auto_102419 ) ) ( not ( = ?auto_102416 ?auto_102419 ) ) ( ON ?auto_102416 ?auto_102414 ) ( not ( = ?auto_102417 ?auto_102420 ) ) ( not ( = ?auto_102417 ?auto_102415 ) ) ( not ( = ?auto_102417 ?auto_102418 ) ) ( not ( = ?auto_102417 ?auto_102419 ) ) ( not ( = ?auto_102420 ?auto_102415 ) ) ( not ( = ?auto_102420 ?auto_102418 ) ) ( not ( = ?auto_102420 ?auto_102419 ) ) ( not ( = ?auto_102415 ?auto_102418 ) ) ( not ( = ?auto_102415 ?auto_102419 ) ) ( not ( = ?auto_102418 ?auto_102419 ) ) ( not ( = ?auto_102413 ?auto_102418 ) ) ( not ( = ?auto_102413 ?auto_102417 ) ) ( not ( = ?auto_102413 ?auto_102420 ) ) ( not ( = ?auto_102413 ?auto_102415 ) ) ( not ( = ?auto_102414 ?auto_102418 ) ) ( not ( = ?auto_102414 ?auto_102417 ) ) ( not ( = ?auto_102414 ?auto_102420 ) ) ( not ( = ?auto_102414 ?auto_102415 ) ) ( not ( = ?auto_102416 ?auto_102418 ) ) ( not ( = ?auto_102416 ?auto_102417 ) ) ( not ( = ?auto_102416 ?auto_102420 ) ) ( not ( = ?auto_102416 ?auto_102415 ) ) ( ON ?auto_102419 ?auto_102416 ) ( ON ?auto_102418 ?auto_102419 ) ( ON ?auto_102415 ?auto_102418 ) ( ON ?auto_102420 ?auto_102415 ) ( ON ?auto_102417 ?auto_102420 ) ( CLEAR ?auto_102417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102413 ?auto_102414 ?auto_102416 ?auto_102419 ?auto_102418 ?auto_102415 ?auto_102420 )
      ( MAKE-1PILE ?auto_102413 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102428 - BLOCK
      ?auto_102429 - BLOCK
      ?auto_102430 - BLOCK
      ?auto_102431 - BLOCK
      ?auto_102432 - BLOCK
      ?auto_102433 - BLOCK
      ?auto_102434 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_102434 ) ( CLEAR ?auto_102433 ) ( ON-TABLE ?auto_102428 ) ( ON ?auto_102429 ?auto_102428 ) ( ON ?auto_102430 ?auto_102429 ) ( ON ?auto_102431 ?auto_102430 ) ( ON ?auto_102432 ?auto_102431 ) ( ON ?auto_102433 ?auto_102432 ) ( not ( = ?auto_102428 ?auto_102429 ) ) ( not ( = ?auto_102428 ?auto_102430 ) ) ( not ( = ?auto_102428 ?auto_102431 ) ) ( not ( = ?auto_102428 ?auto_102432 ) ) ( not ( = ?auto_102428 ?auto_102433 ) ) ( not ( = ?auto_102428 ?auto_102434 ) ) ( not ( = ?auto_102429 ?auto_102430 ) ) ( not ( = ?auto_102429 ?auto_102431 ) ) ( not ( = ?auto_102429 ?auto_102432 ) ) ( not ( = ?auto_102429 ?auto_102433 ) ) ( not ( = ?auto_102429 ?auto_102434 ) ) ( not ( = ?auto_102430 ?auto_102431 ) ) ( not ( = ?auto_102430 ?auto_102432 ) ) ( not ( = ?auto_102430 ?auto_102433 ) ) ( not ( = ?auto_102430 ?auto_102434 ) ) ( not ( = ?auto_102431 ?auto_102432 ) ) ( not ( = ?auto_102431 ?auto_102433 ) ) ( not ( = ?auto_102431 ?auto_102434 ) ) ( not ( = ?auto_102432 ?auto_102433 ) ) ( not ( = ?auto_102432 ?auto_102434 ) ) ( not ( = ?auto_102433 ?auto_102434 ) ) )
    :subtasks
    ( ( !STACK ?auto_102434 ?auto_102433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102435 - BLOCK
      ?auto_102436 - BLOCK
      ?auto_102437 - BLOCK
      ?auto_102438 - BLOCK
      ?auto_102439 - BLOCK
      ?auto_102440 - BLOCK
      ?auto_102441 - BLOCK
    )
    :vars
    (
      ?auto_102442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_102440 ) ( ON-TABLE ?auto_102435 ) ( ON ?auto_102436 ?auto_102435 ) ( ON ?auto_102437 ?auto_102436 ) ( ON ?auto_102438 ?auto_102437 ) ( ON ?auto_102439 ?auto_102438 ) ( ON ?auto_102440 ?auto_102439 ) ( not ( = ?auto_102435 ?auto_102436 ) ) ( not ( = ?auto_102435 ?auto_102437 ) ) ( not ( = ?auto_102435 ?auto_102438 ) ) ( not ( = ?auto_102435 ?auto_102439 ) ) ( not ( = ?auto_102435 ?auto_102440 ) ) ( not ( = ?auto_102435 ?auto_102441 ) ) ( not ( = ?auto_102436 ?auto_102437 ) ) ( not ( = ?auto_102436 ?auto_102438 ) ) ( not ( = ?auto_102436 ?auto_102439 ) ) ( not ( = ?auto_102436 ?auto_102440 ) ) ( not ( = ?auto_102436 ?auto_102441 ) ) ( not ( = ?auto_102437 ?auto_102438 ) ) ( not ( = ?auto_102437 ?auto_102439 ) ) ( not ( = ?auto_102437 ?auto_102440 ) ) ( not ( = ?auto_102437 ?auto_102441 ) ) ( not ( = ?auto_102438 ?auto_102439 ) ) ( not ( = ?auto_102438 ?auto_102440 ) ) ( not ( = ?auto_102438 ?auto_102441 ) ) ( not ( = ?auto_102439 ?auto_102440 ) ) ( not ( = ?auto_102439 ?auto_102441 ) ) ( not ( = ?auto_102440 ?auto_102441 ) ) ( ON ?auto_102441 ?auto_102442 ) ( CLEAR ?auto_102441 ) ( HAND-EMPTY ) ( not ( = ?auto_102435 ?auto_102442 ) ) ( not ( = ?auto_102436 ?auto_102442 ) ) ( not ( = ?auto_102437 ?auto_102442 ) ) ( not ( = ?auto_102438 ?auto_102442 ) ) ( not ( = ?auto_102439 ?auto_102442 ) ) ( not ( = ?auto_102440 ?auto_102442 ) ) ( not ( = ?auto_102441 ?auto_102442 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102441 ?auto_102442 )
      ( MAKE-7PILE ?auto_102435 ?auto_102436 ?auto_102437 ?auto_102438 ?auto_102439 ?auto_102440 ?auto_102441 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102443 - BLOCK
      ?auto_102444 - BLOCK
      ?auto_102445 - BLOCK
      ?auto_102446 - BLOCK
      ?auto_102447 - BLOCK
      ?auto_102448 - BLOCK
      ?auto_102449 - BLOCK
    )
    :vars
    (
      ?auto_102450 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102443 ) ( ON ?auto_102444 ?auto_102443 ) ( ON ?auto_102445 ?auto_102444 ) ( ON ?auto_102446 ?auto_102445 ) ( ON ?auto_102447 ?auto_102446 ) ( not ( = ?auto_102443 ?auto_102444 ) ) ( not ( = ?auto_102443 ?auto_102445 ) ) ( not ( = ?auto_102443 ?auto_102446 ) ) ( not ( = ?auto_102443 ?auto_102447 ) ) ( not ( = ?auto_102443 ?auto_102448 ) ) ( not ( = ?auto_102443 ?auto_102449 ) ) ( not ( = ?auto_102444 ?auto_102445 ) ) ( not ( = ?auto_102444 ?auto_102446 ) ) ( not ( = ?auto_102444 ?auto_102447 ) ) ( not ( = ?auto_102444 ?auto_102448 ) ) ( not ( = ?auto_102444 ?auto_102449 ) ) ( not ( = ?auto_102445 ?auto_102446 ) ) ( not ( = ?auto_102445 ?auto_102447 ) ) ( not ( = ?auto_102445 ?auto_102448 ) ) ( not ( = ?auto_102445 ?auto_102449 ) ) ( not ( = ?auto_102446 ?auto_102447 ) ) ( not ( = ?auto_102446 ?auto_102448 ) ) ( not ( = ?auto_102446 ?auto_102449 ) ) ( not ( = ?auto_102447 ?auto_102448 ) ) ( not ( = ?auto_102447 ?auto_102449 ) ) ( not ( = ?auto_102448 ?auto_102449 ) ) ( ON ?auto_102449 ?auto_102450 ) ( CLEAR ?auto_102449 ) ( not ( = ?auto_102443 ?auto_102450 ) ) ( not ( = ?auto_102444 ?auto_102450 ) ) ( not ( = ?auto_102445 ?auto_102450 ) ) ( not ( = ?auto_102446 ?auto_102450 ) ) ( not ( = ?auto_102447 ?auto_102450 ) ) ( not ( = ?auto_102448 ?auto_102450 ) ) ( not ( = ?auto_102449 ?auto_102450 ) ) ( HOLDING ?auto_102448 ) ( CLEAR ?auto_102447 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102443 ?auto_102444 ?auto_102445 ?auto_102446 ?auto_102447 ?auto_102448 )
      ( MAKE-7PILE ?auto_102443 ?auto_102444 ?auto_102445 ?auto_102446 ?auto_102447 ?auto_102448 ?auto_102449 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102451 - BLOCK
      ?auto_102452 - BLOCK
      ?auto_102453 - BLOCK
      ?auto_102454 - BLOCK
      ?auto_102455 - BLOCK
      ?auto_102456 - BLOCK
      ?auto_102457 - BLOCK
    )
    :vars
    (
      ?auto_102458 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102451 ) ( ON ?auto_102452 ?auto_102451 ) ( ON ?auto_102453 ?auto_102452 ) ( ON ?auto_102454 ?auto_102453 ) ( ON ?auto_102455 ?auto_102454 ) ( not ( = ?auto_102451 ?auto_102452 ) ) ( not ( = ?auto_102451 ?auto_102453 ) ) ( not ( = ?auto_102451 ?auto_102454 ) ) ( not ( = ?auto_102451 ?auto_102455 ) ) ( not ( = ?auto_102451 ?auto_102456 ) ) ( not ( = ?auto_102451 ?auto_102457 ) ) ( not ( = ?auto_102452 ?auto_102453 ) ) ( not ( = ?auto_102452 ?auto_102454 ) ) ( not ( = ?auto_102452 ?auto_102455 ) ) ( not ( = ?auto_102452 ?auto_102456 ) ) ( not ( = ?auto_102452 ?auto_102457 ) ) ( not ( = ?auto_102453 ?auto_102454 ) ) ( not ( = ?auto_102453 ?auto_102455 ) ) ( not ( = ?auto_102453 ?auto_102456 ) ) ( not ( = ?auto_102453 ?auto_102457 ) ) ( not ( = ?auto_102454 ?auto_102455 ) ) ( not ( = ?auto_102454 ?auto_102456 ) ) ( not ( = ?auto_102454 ?auto_102457 ) ) ( not ( = ?auto_102455 ?auto_102456 ) ) ( not ( = ?auto_102455 ?auto_102457 ) ) ( not ( = ?auto_102456 ?auto_102457 ) ) ( ON ?auto_102457 ?auto_102458 ) ( not ( = ?auto_102451 ?auto_102458 ) ) ( not ( = ?auto_102452 ?auto_102458 ) ) ( not ( = ?auto_102453 ?auto_102458 ) ) ( not ( = ?auto_102454 ?auto_102458 ) ) ( not ( = ?auto_102455 ?auto_102458 ) ) ( not ( = ?auto_102456 ?auto_102458 ) ) ( not ( = ?auto_102457 ?auto_102458 ) ) ( CLEAR ?auto_102455 ) ( ON ?auto_102456 ?auto_102457 ) ( CLEAR ?auto_102456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102458 ?auto_102457 )
      ( MAKE-7PILE ?auto_102451 ?auto_102452 ?auto_102453 ?auto_102454 ?auto_102455 ?auto_102456 ?auto_102457 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102459 - BLOCK
      ?auto_102460 - BLOCK
      ?auto_102461 - BLOCK
      ?auto_102462 - BLOCK
      ?auto_102463 - BLOCK
      ?auto_102464 - BLOCK
      ?auto_102465 - BLOCK
    )
    :vars
    (
      ?auto_102466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102459 ) ( ON ?auto_102460 ?auto_102459 ) ( ON ?auto_102461 ?auto_102460 ) ( ON ?auto_102462 ?auto_102461 ) ( not ( = ?auto_102459 ?auto_102460 ) ) ( not ( = ?auto_102459 ?auto_102461 ) ) ( not ( = ?auto_102459 ?auto_102462 ) ) ( not ( = ?auto_102459 ?auto_102463 ) ) ( not ( = ?auto_102459 ?auto_102464 ) ) ( not ( = ?auto_102459 ?auto_102465 ) ) ( not ( = ?auto_102460 ?auto_102461 ) ) ( not ( = ?auto_102460 ?auto_102462 ) ) ( not ( = ?auto_102460 ?auto_102463 ) ) ( not ( = ?auto_102460 ?auto_102464 ) ) ( not ( = ?auto_102460 ?auto_102465 ) ) ( not ( = ?auto_102461 ?auto_102462 ) ) ( not ( = ?auto_102461 ?auto_102463 ) ) ( not ( = ?auto_102461 ?auto_102464 ) ) ( not ( = ?auto_102461 ?auto_102465 ) ) ( not ( = ?auto_102462 ?auto_102463 ) ) ( not ( = ?auto_102462 ?auto_102464 ) ) ( not ( = ?auto_102462 ?auto_102465 ) ) ( not ( = ?auto_102463 ?auto_102464 ) ) ( not ( = ?auto_102463 ?auto_102465 ) ) ( not ( = ?auto_102464 ?auto_102465 ) ) ( ON ?auto_102465 ?auto_102466 ) ( not ( = ?auto_102459 ?auto_102466 ) ) ( not ( = ?auto_102460 ?auto_102466 ) ) ( not ( = ?auto_102461 ?auto_102466 ) ) ( not ( = ?auto_102462 ?auto_102466 ) ) ( not ( = ?auto_102463 ?auto_102466 ) ) ( not ( = ?auto_102464 ?auto_102466 ) ) ( not ( = ?auto_102465 ?auto_102466 ) ) ( ON ?auto_102464 ?auto_102465 ) ( CLEAR ?auto_102464 ) ( ON-TABLE ?auto_102466 ) ( HOLDING ?auto_102463 ) ( CLEAR ?auto_102462 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102459 ?auto_102460 ?auto_102461 ?auto_102462 ?auto_102463 )
      ( MAKE-7PILE ?auto_102459 ?auto_102460 ?auto_102461 ?auto_102462 ?auto_102463 ?auto_102464 ?auto_102465 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102467 - BLOCK
      ?auto_102468 - BLOCK
      ?auto_102469 - BLOCK
      ?auto_102470 - BLOCK
      ?auto_102471 - BLOCK
      ?auto_102472 - BLOCK
      ?auto_102473 - BLOCK
    )
    :vars
    (
      ?auto_102474 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102467 ) ( ON ?auto_102468 ?auto_102467 ) ( ON ?auto_102469 ?auto_102468 ) ( ON ?auto_102470 ?auto_102469 ) ( not ( = ?auto_102467 ?auto_102468 ) ) ( not ( = ?auto_102467 ?auto_102469 ) ) ( not ( = ?auto_102467 ?auto_102470 ) ) ( not ( = ?auto_102467 ?auto_102471 ) ) ( not ( = ?auto_102467 ?auto_102472 ) ) ( not ( = ?auto_102467 ?auto_102473 ) ) ( not ( = ?auto_102468 ?auto_102469 ) ) ( not ( = ?auto_102468 ?auto_102470 ) ) ( not ( = ?auto_102468 ?auto_102471 ) ) ( not ( = ?auto_102468 ?auto_102472 ) ) ( not ( = ?auto_102468 ?auto_102473 ) ) ( not ( = ?auto_102469 ?auto_102470 ) ) ( not ( = ?auto_102469 ?auto_102471 ) ) ( not ( = ?auto_102469 ?auto_102472 ) ) ( not ( = ?auto_102469 ?auto_102473 ) ) ( not ( = ?auto_102470 ?auto_102471 ) ) ( not ( = ?auto_102470 ?auto_102472 ) ) ( not ( = ?auto_102470 ?auto_102473 ) ) ( not ( = ?auto_102471 ?auto_102472 ) ) ( not ( = ?auto_102471 ?auto_102473 ) ) ( not ( = ?auto_102472 ?auto_102473 ) ) ( ON ?auto_102473 ?auto_102474 ) ( not ( = ?auto_102467 ?auto_102474 ) ) ( not ( = ?auto_102468 ?auto_102474 ) ) ( not ( = ?auto_102469 ?auto_102474 ) ) ( not ( = ?auto_102470 ?auto_102474 ) ) ( not ( = ?auto_102471 ?auto_102474 ) ) ( not ( = ?auto_102472 ?auto_102474 ) ) ( not ( = ?auto_102473 ?auto_102474 ) ) ( ON ?auto_102472 ?auto_102473 ) ( ON-TABLE ?auto_102474 ) ( CLEAR ?auto_102470 ) ( ON ?auto_102471 ?auto_102472 ) ( CLEAR ?auto_102471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102474 ?auto_102473 ?auto_102472 )
      ( MAKE-7PILE ?auto_102467 ?auto_102468 ?auto_102469 ?auto_102470 ?auto_102471 ?auto_102472 ?auto_102473 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102475 - BLOCK
      ?auto_102476 - BLOCK
      ?auto_102477 - BLOCK
      ?auto_102478 - BLOCK
      ?auto_102479 - BLOCK
      ?auto_102480 - BLOCK
      ?auto_102481 - BLOCK
    )
    :vars
    (
      ?auto_102482 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102475 ) ( ON ?auto_102476 ?auto_102475 ) ( ON ?auto_102477 ?auto_102476 ) ( not ( = ?auto_102475 ?auto_102476 ) ) ( not ( = ?auto_102475 ?auto_102477 ) ) ( not ( = ?auto_102475 ?auto_102478 ) ) ( not ( = ?auto_102475 ?auto_102479 ) ) ( not ( = ?auto_102475 ?auto_102480 ) ) ( not ( = ?auto_102475 ?auto_102481 ) ) ( not ( = ?auto_102476 ?auto_102477 ) ) ( not ( = ?auto_102476 ?auto_102478 ) ) ( not ( = ?auto_102476 ?auto_102479 ) ) ( not ( = ?auto_102476 ?auto_102480 ) ) ( not ( = ?auto_102476 ?auto_102481 ) ) ( not ( = ?auto_102477 ?auto_102478 ) ) ( not ( = ?auto_102477 ?auto_102479 ) ) ( not ( = ?auto_102477 ?auto_102480 ) ) ( not ( = ?auto_102477 ?auto_102481 ) ) ( not ( = ?auto_102478 ?auto_102479 ) ) ( not ( = ?auto_102478 ?auto_102480 ) ) ( not ( = ?auto_102478 ?auto_102481 ) ) ( not ( = ?auto_102479 ?auto_102480 ) ) ( not ( = ?auto_102479 ?auto_102481 ) ) ( not ( = ?auto_102480 ?auto_102481 ) ) ( ON ?auto_102481 ?auto_102482 ) ( not ( = ?auto_102475 ?auto_102482 ) ) ( not ( = ?auto_102476 ?auto_102482 ) ) ( not ( = ?auto_102477 ?auto_102482 ) ) ( not ( = ?auto_102478 ?auto_102482 ) ) ( not ( = ?auto_102479 ?auto_102482 ) ) ( not ( = ?auto_102480 ?auto_102482 ) ) ( not ( = ?auto_102481 ?auto_102482 ) ) ( ON ?auto_102480 ?auto_102481 ) ( ON-TABLE ?auto_102482 ) ( ON ?auto_102479 ?auto_102480 ) ( CLEAR ?auto_102479 ) ( HOLDING ?auto_102478 ) ( CLEAR ?auto_102477 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102475 ?auto_102476 ?auto_102477 ?auto_102478 )
      ( MAKE-7PILE ?auto_102475 ?auto_102476 ?auto_102477 ?auto_102478 ?auto_102479 ?auto_102480 ?auto_102481 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102483 - BLOCK
      ?auto_102484 - BLOCK
      ?auto_102485 - BLOCK
      ?auto_102486 - BLOCK
      ?auto_102487 - BLOCK
      ?auto_102488 - BLOCK
      ?auto_102489 - BLOCK
    )
    :vars
    (
      ?auto_102490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102483 ) ( ON ?auto_102484 ?auto_102483 ) ( ON ?auto_102485 ?auto_102484 ) ( not ( = ?auto_102483 ?auto_102484 ) ) ( not ( = ?auto_102483 ?auto_102485 ) ) ( not ( = ?auto_102483 ?auto_102486 ) ) ( not ( = ?auto_102483 ?auto_102487 ) ) ( not ( = ?auto_102483 ?auto_102488 ) ) ( not ( = ?auto_102483 ?auto_102489 ) ) ( not ( = ?auto_102484 ?auto_102485 ) ) ( not ( = ?auto_102484 ?auto_102486 ) ) ( not ( = ?auto_102484 ?auto_102487 ) ) ( not ( = ?auto_102484 ?auto_102488 ) ) ( not ( = ?auto_102484 ?auto_102489 ) ) ( not ( = ?auto_102485 ?auto_102486 ) ) ( not ( = ?auto_102485 ?auto_102487 ) ) ( not ( = ?auto_102485 ?auto_102488 ) ) ( not ( = ?auto_102485 ?auto_102489 ) ) ( not ( = ?auto_102486 ?auto_102487 ) ) ( not ( = ?auto_102486 ?auto_102488 ) ) ( not ( = ?auto_102486 ?auto_102489 ) ) ( not ( = ?auto_102487 ?auto_102488 ) ) ( not ( = ?auto_102487 ?auto_102489 ) ) ( not ( = ?auto_102488 ?auto_102489 ) ) ( ON ?auto_102489 ?auto_102490 ) ( not ( = ?auto_102483 ?auto_102490 ) ) ( not ( = ?auto_102484 ?auto_102490 ) ) ( not ( = ?auto_102485 ?auto_102490 ) ) ( not ( = ?auto_102486 ?auto_102490 ) ) ( not ( = ?auto_102487 ?auto_102490 ) ) ( not ( = ?auto_102488 ?auto_102490 ) ) ( not ( = ?auto_102489 ?auto_102490 ) ) ( ON ?auto_102488 ?auto_102489 ) ( ON-TABLE ?auto_102490 ) ( ON ?auto_102487 ?auto_102488 ) ( CLEAR ?auto_102485 ) ( ON ?auto_102486 ?auto_102487 ) ( CLEAR ?auto_102486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102490 ?auto_102489 ?auto_102488 ?auto_102487 )
      ( MAKE-7PILE ?auto_102483 ?auto_102484 ?auto_102485 ?auto_102486 ?auto_102487 ?auto_102488 ?auto_102489 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102491 - BLOCK
      ?auto_102492 - BLOCK
      ?auto_102493 - BLOCK
      ?auto_102494 - BLOCK
      ?auto_102495 - BLOCK
      ?auto_102496 - BLOCK
      ?auto_102497 - BLOCK
    )
    :vars
    (
      ?auto_102498 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102491 ) ( ON ?auto_102492 ?auto_102491 ) ( not ( = ?auto_102491 ?auto_102492 ) ) ( not ( = ?auto_102491 ?auto_102493 ) ) ( not ( = ?auto_102491 ?auto_102494 ) ) ( not ( = ?auto_102491 ?auto_102495 ) ) ( not ( = ?auto_102491 ?auto_102496 ) ) ( not ( = ?auto_102491 ?auto_102497 ) ) ( not ( = ?auto_102492 ?auto_102493 ) ) ( not ( = ?auto_102492 ?auto_102494 ) ) ( not ( = ?auto_102492 ?auto_102495 ) ) ( not ( = ?auto_102492 ?auto_102496 ) ) ( not ( = ?auto_102492 ?auto_102497 ) ) ( not ( = ?auto_102493 ?auto_102494 ) ) ( not ( = ?auto_102493 ?auto_102495 ) ) ( not ( = ?auto_102493 ?auto_102496 ) ) ( not ( = ?auto_102493 ?auto_102497 ) ) ( not ( = ?auto_102494 ?auto_102495 ) ) ( not ( = ?auto_102494 ?auto_102496 ) ) ( not ( = ?auto_102494 ?auto_102497 ) ) ( not ( = ?auto_102495 ?auto_102496 ) ) ( not ( = ?auto_102495 ?auto_102497 ) ) ( not ( = ?auto_102496 ?auto_102497 ) ) ( ON ?auto_102497 ?auto_102498 ) ( not ( = ?auto_102491 ?auto_102498 ) ) ( not ( = ?auto_102492 ?auto_102498 ) ) ( not ( = ?auto_102493 ?auto_102498 ) ) ( not ( = ?auto_102494 ?auto_102498 ) ) ( not ( = ?auto_102495 ?auto_102498 ) ) ( not ( = ?auto_102496 ?auto_102498 ) ) ( not ( = ?auto_102497 ?auto_102498 ) ) ( ON ?auto_102496 ?auto_102497 ) ( ON-TABLE ?auto_102498 ) ( ON ?auto_102495 ?auto_102496 ) ( ON ?auto_102494 ?auto_102495 ) ( CLEAR ?auto_102494 ) ( HOLDING ?auto_102493 ) ( CLEAR ?auto_102492 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102491 ?auto_102492 ?auto_102493 )
      ( MAKE-7PILE ?auto_102491 ?auto_102492 ?auto_102493 ?auto_102494 ?auto_102495 ?auto_102496 ?auto_102497 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102499 - BLOCK
      ?auto_102500 - BLOCK
      ?auto_102501 - BLOCK
      ?auto_102502 - BLOCK
      ?auto_102503 - BLOCK
      ?auto_102504 - BLOCK
      ?auto_102505 - BLOCK
    )
    :vars
    (
      ?auto_102506 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102499 ) ( ON ?auto_102500 ?auto_102499 ) ( not ( = ?auto_102499 ?auto_102500 ) ) ( not ( = ?auto_102499 ?auto_102501 ) ) ( not ( = ?auto_102499 ?auto_102502 ) ) ( not ( = ?auto_102499 ?auto_102503 ) ) ( not ( = ?auto_102499 ?auto_102504 ) ) ( not ( = ?auto_102499 ?auto_102505 ) ) ( not ( = ?auto_102500 ?auto_102501 ) ) ( not ( = ?auto_102500 ?auto_102502 ) ) ( not ( = ?auto_102500 ?auto_102503 ) ) ( not ( = ?auto_102500 ?auto_102504 ) ) ( not ( = ?auto_102500 ?auto_102505 ) ) ( not ( = ?auto_102501 ?auto_102502 ) ) ( not ( = ?auto_102501 ?auto_102503 ) ) ( not ( = ?auto_102501 ?auto_102504 ) ) ( not ( = ?auto_102501 ?auto_102505 ) ) ( not ( = ?auto_102502 ?auto_102503 ) ) ( not ( = ?auto_102502 ?auto_102504 ) ) ( not ( = ?auto_102502 ?auto_102505 ) ) ( not ( = ?auto_102503 ?auto_102504 ) ) ( not ( = ?auto_102503 ?auto_102505 ) ) ( not ( = ?auto_102504 ?auto_102505 ) ) ( ON ?auto_102505 ?auto_102506 ) ( not ( = ?auto_102499 ?auto_102506 ) ) ( not ( = ?auto_102500 ?auto_102506 ) ) ( not ( = ?auto_102501 ?auto_102506 ) ) ( not ( = ?auto_102502 ?auto_102506 ) ) ( not ( = ?auto_102503 ?auto_102506 ) ) ( not ( = ?auto_102504 ?auto_102506 ) ) ( not ( = ?auto_102505 ?auto_102506 ) ) ( ON ?auto_102504 ?auto_102505 ) ( ON-TABLE ?auto_102506 ) ( ON ?auto_102503 ?auto_102504 ) ( ON ?auto_102502 ?auto_102503 ) ( CLEAR ?auto_102500 ) ( ON ?auto_102501 ?auto_102502 ) ( CLEAR ?auto_102501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102506 ?auto_102505 ?auto_102504 ?auto_102503 ?auto_102502 )
      ( MAKE-7PILE ?auto_102499 ?auto_102500 ?auto_102501 ?auto_102502 ?auto_102503 ?auto_102504 ?auto_102505 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102507 - BLOCK
      ?auto_102508 - BLOCK
      ?auto_102509 - BLOCK
      ?auto_102510 - BLOCK
      ?auto_102511 - BLOCK
      ?auto_102512 - BLOCK
      ?auto_102513 - BLOCK
    )
    :vars
    (
      ?auto_102514 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102507 ) ( not ( = ?auto_102507 ?auto_102508 ) ) ( not ( = ?auto_102507 ?auto_102509 ) ) ( not ( = ?auto_102507 ?auto_102510 ) ) ( not ( = ?auto_102507 ?auto_102511 ) ) ( not ( = ?auto_102507 ?auto_102512 ) ) ( not ( = ?auto_102507 ?auto_102513 ) ) ( not ( = ?auto_102508 ?auto_102509 ) ) ( not ( = ?auto_102508 ?auto_102510 ) ) ( not ( = ?auto_102508 ?auto_102511 ) ) ( not ( = ?auto_102508 ?auto_102512 ) ) ( not ( = ?auto_102508 ?auto_102513 ) ) ( not ( = ?auto_102509 ?auto_102510 ) ) ( not ( = ?auto_102509 ?auto_102511 ) ) ( not ( = ?auto_102509 ?auto_102512 ) ) ( not ( = ?auto_102509 ?auto_102513 ) ) ( not ( = ?auto_102510 ?auto_102511 ) ) ( not ( = ?auto_102510 ?auto_102512 ) ) ( not ( = ?auto_102510 ?auto_102513 ) ) ( not ( = ?auto_102511 ?auto_102512 ) ) ( not ( = ?auto_102511 ?auto_102513 ) ) ( not ( = ?auto_102512 ?auto_102513 ) ) ( ON ?auto_102513 ?auto_102514 ) ( not ( = ?auto_102507 ?auto_102514 ) ) ( not ( = ?auto_102508 ?auto_102514 ) ) ( not ( = ?auto_102509 ?auto_102514 ) ) ( not ( = ?auto_102510 ?auto_102514 ) ) ( not ( = ?auto_102511 ?auto_102514 ) ) ( not ( = ?auto_102512 ?auto_102514 ) ) ( not ( = ?auto_102513 ?auto_102514 ) ) ( ON ?auto_102512 ?auto_102513 ) ( ON-TABLE ?auto_102514 ) ( ON ?auto_102511 ?auto_102512 ) ( ON ?auto_102510 ?auto_102511 ) ( ON ?auto_102509 ?auto_102510 ) ( CLEAR ?auto_102509 ) ( HOLDING ?auto_102508 ) ( CLEAR ?auto_102507 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102507 ?auto_102508 )
      ( MAKE-7PILE ?auto_102507 ?auto_102508 ?auto_102509 ?auto_102510 ?auto_102511 ?auto_102512 ?auto_102513 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102515 - BLOCK
      ?auto_102516 - BLOCK
      ?auto_102517 - BLOCK
      ?auto_102518 - BLOCK
      ?auto_102519 - BLOCK
      ?auto_102520 - BLOCK
      ?auto_102521 - BLOCK
    )
    :vars
    (
      ?auto_102522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_102515 ) ( not ( = ?auto_102515 ?auto_102516 ) ) ( not ( = ?auto_102515 ?auto_102517 ) ) ( not ( = ?auto_102515 ?auto_102518 ) ) ( not ( = ?auto_102515 ?auto_102519 ) ) ( not ( = ?auto_102515 ?auto_102520 ) ) ( not ( = ?auto_102515 ?auto_102521 ) ) ( not ( = ?auto_102516 ?auto_102517 ) ) ( not ( = ?auto_102516 ?auto_102518 ) ) ( not ( = ?auto_102516 ?auto_102519 ) ) ( not ( = ?auto_102516 ?auto_102520 ) ) ( not ( = ?auto_102516 ?auto_102521 ) ) ( not ( = ?auto_102517 ?auto_102518 ) ) ( not ( = ?auto_102517 ?auto_102519 ) ) ( not ( = ?auto_102517 ?auto_102520 ) ) ( not ( = ?auto_102517 ?auto_102521 ) ) ( not ( = ?auto_102518 ?auto_102519 ) ) ( not ( = ?auto_102518 ?auto_102520 ) ) ( not ( = ?auto_102518 ?auto_102521 ) ) ( not ( = ?auto_102519 ?auto_102520 ) ) ( not ( = ?auto_102519 ?auto_102521 ) ) ( not ( = ?auto_102520 ?auto_102521 ) ) ( ON ?auto_102521 ?auto_102522 ) ( not ( = ?auto_102515 ?auto_102522 ) ) ( not ( = ?auto_102516 ?auto_102522 ) ) ( not ( = ?auto_102517 ?auto_102522 ) ) ( not ( = ?auto_102518 ?auto_102522 ) ) ( not ( = ?auto_102519 ?auto_102522 ) ) ( not ( = ?auto_102520 ?auto_102522 ) ) ( not ( = ?auto_102521 ?auto_102522 ) ) ( ON ?auto_102520 ?auto_102521 ) ( ON-TABLE ?auto_102522 ) ( ON ?auto_102519 ?auto_102520 ) ( ON ?auto_102518 ?auto_102519 ) ( ON ?auto_102517 ?auto_102518 ) ( CLEAR ?auto_102515 ) ( ON ?auto_102516 ?auto_102517 ) ( CLEAR ?auto_102516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102522 ?auto_102521 ?auto_102520 ?auto_102519 ?auto_102518 ?auto_102517 )
      ( MAKE-7PILE ?auto_102515 ?auto_102516 ?auto_102517 ?auto_102518 ?auto_102519 ?auto_102520 ?auto_102521 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102523 - BLOCK
      ?auto_102524 - BLOCK
      ?auto_102525 - BLOCK
      ?auto_102526 - BLOCK
      ?auto_102527 - BLOCK
      ?auto_102528 - BLOCK
      ?auto_102529 - BLOCK
    )
    :vars
    (
      ?auto_102530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102523 ?auto_102524 ) ) ( not ( = ?auto_102523 ?auto_102525 ) ) ( not ( = ?auto_102523 ?auto_102526 ) ) ( not ( = ?auto_102523 ?auto_102527 ) ) ( not ( = ?auto_102523 ?auto_102528 ) ) ( not ( = ?auto_102523 ?auto_102529 ) ) ( not ( = ?auto_102524 ?auto_102525 ) ) ( not ( = ?auto_102524 ?auto_102526 ) ) ( not ( = ?auto_102524 ?auto_102527 ) ) ( not ( = ?auto_102524 ?auto_102528 ) ) ( not ( = ?auto_102524 ?auto_102529 ) ) ( not ( = ?auto_102525 ?auto_102526 ) ) ( not ( = ?auto_102525 ?auto_102527 ) ) ( not ( = ?auto_102525 ?auto_102528 ) ) ( not ( = ?auto_102525 ?auto_102529 ) ) ( not ( = ?auto_102526 ?auto_102527 ) ) ( not ( = ?auto_102526 ?auto_102528 ) ) ( not ( = ?auto_102526 ?auto_102529 ) ) ( not ( = ?auto_102527 ?auto_102528 ) ) ( not ( = ?auto_102527 ?auto_102529 ) ) ( not ( = ?auto_102528 ?auto_102529 ) ) ( ON ?auto_102529 ?auto_102530 ) ( not ( = ?auto_102523 ?auto_102530 ) ) ( not ( = ?auto_102524 ?auto_102530 ) ) ( not ( = ?auto_102525 ?auto_102530 ) ) ( not ( = ?auto_102526 ?auto_102530 ) ) ( not ( = ?auto_102527 ?auto_102530 ) ) ( not ( = ?auto_102528 ?auto_102530 ) ) ( not ( = ?auto_102529 ?auto_102530 ) ) ( ON ?auto_102528 ?auto_102529 ) ( ON-TABLE ?auto_102530 ) ( ON ?auto_102527 ?auto_102528 ) ( ON ?auto_102526 ?auto_102527 ) ( ON ?auto_102525 ?auto_102526 ) ( ON ?auto_102524 ?auto_102525 ) ( CLEAR ?auto_102524 ) ( HOLDING ?auto_102523 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102523 )
      ( MAKE-7PILE ?auto_102523 ?auto_102524 ?auto_102525 ?auto_102526 ?auto_102527 ?auto_102528 ?auto_102529 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_102531 - BLOCK
      ?auto_102532 - BLOCK
      ?auto_102533 - BLOCK
      ?auto_102534 - BLOCK
      ?auto_102535 - BLOCK
      ?auto_102536 - BLOCK
      ?auto_102537 - BLOCK
    )
    :vars
    (
      ?auto_102538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102531 ?auto_102532 ) ) ( not ( = ?auto_102531 ?auto_102533 ) ) ( not ( = ?auto_102531 ?auto_102534 ) ) ( not ( = ?auto_102531 ?auto_102535 ) ) ( not ( = ?auto_102531 ?auto_102536 ) ) ( not ( = ?auto_102531 ?auto_102537 ) ) ( not ( = ?auto_102532 ?auto_102533 ) ) ( not ( = ?auto_102532 ?auto_102534 ) ) ( not ( = ?auto_102532 ?auto_102535 ) ) ( not ( = ?auto_102532 ?auto_102536 ) ) ( not ( = ?auto_102532 ?auto_102537 ) ) ( not ( = ?auto_102533 ?auto_102534 ) ) ( not ( = ?auto_102533 ?auto_102535 ) ) ( not ( = ?auto_102533 ?auto_102536 ) ) ( not ( = ?auto_102533 ?auto_102537 ) ) ( not ( = ?auto_102534 ?auto_102535 ) ) ( not ( = ?auto_102534 ?auto_102536 ) ) ( not ( = ?auto_102534 ?auto_102537 ) ) ( not ( = ?auto_102535 ?auto_102536 ) ) ( not ( = ?auto_102535 ?auto_102537 ) ) ( not ( = ?auto_102536 ?auto_102537 ) ) ( ON ?auto_102537 ?auto_102538 ) ( not ( = ?auto_102531 ?auto_102538 ) ) ( not ( = ?auto_102532 ?auto_102538 ) ) ( not ( = ?auto_102533 ?auto_102538 ) ) ( not ( = ?auto_102534 ?auto_102538 ) ) ( not ( = ?auto_102535 ?auto_102538 ) ) ( not ( = ?auto_102536 ?auto_102538 ) ) ( not ( = ?auto_102537 ?auto_102538 ) ) ( ON ?auto_102536 ?auto_102537 ) ( ON-TABLE ?auto_102538 ) ( ON ?auto_102535 ?auto_102536 ) ( ON ?auto_102534 ?auto_102535 ) ( ON ?auto_102533 ?auto_102534 ) ( ON ?auto_102532 ?auto_102533 ) ( ON ?auto_102531 ?auto_102532 ) ( CLEAR ?auto_102531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102538 ?auto_102537 ?auto_102536 ?auto_102535 ?auto_102534 ?auto_102533 ?auto_102532 )
      ( MAKE-7PILE ?auto_102531 ?auto_102532 ?auto_102533 ?auto_102534 ?auto_102535 ?auto_102536 ?auto_102537 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102645 - BLOCK
    )
    :vars
    (
      ?auto_102646 - BLOCK
      ?auto_102647 - BLOCK
      ?auto_102648 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102645 ?auto_102646 ) ( CLEAR ?auto_102645 ) ( not ( = ?auto_102645 ?auto_102646 ) ) ( HOLDING ?auto_102647 ) ( CLEAR ?auto_102648 ) ( not ( = ?auto_102645 ?auto_102647 ) ) ( not ( = ?auto_102645 ?auto_102648 ) ) ( not ( = ?auto_102646 ?auto_102647 ) ) ( not ( = ?auto_102646 ?auto_102648 ) ) ( not ( = ?auto_102647 ?auto_102648 ) ) )
    :subtasks
    ( ( !STACK ?auto_102647 ?auto_102648 )
      ( MAKE-1PILE ?auto_102645 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102649 - BLOCK
    )
    :vars
    (
      ?auto_102651 - BLOCK
      ?auto_102650 - BLOCK
      ?auto_102652 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102649 ?auto_102651 ) ( not ( = ?auto_102649 ?auto_102651 ) ) ( CLEAR ?auto_102650 ) ( not ( = ?auto_102649 ?auto_102652 ) ) ( not ( = ?auto_102649 ?auto_102650 ) ) ( not ( = ?auto_102651 ?auto_102652 ) ) ( not ( = ?auto_102651 ?auto_102650 ) ) ( not ( = ?auto_102652 ?auto_102650 ) ) ( ON ?auto_102652 ?auto_102649 ) ( CLEAR ?auto_102652 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102651 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102651 ?auto_102649 )
      ( MAKE-1PILE ?auto_102649 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102653 - BLOCK
    )
    :vars
    (
      ?auto_102654 - BLOCK
      ?auto_102656 - BLOCK
      ?auto_102655 - BLOCK
      ?auto_102660 - BLOCK
      ?auto_102658 - BLOCK
      ?auto_102659 - BLOCK
      ?auto_102657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102653 ?auto_102654 ) ( not ( = ?auto_102653 ?auto_102654 ) ) ( not ( = ?auto_102653 ?auto_102656 ) ) ( not ( = ?auto_102653 ?auto_102655 ) ) ( not ( = ?auto_102654 ?auto_102656 ) ) ( not ( = ?auto_102654 ?auto_102655 ) ) ( not ( = ?auto_102656 ?auto_102655 ) ) ( ON ?auto_102656 ?auto_102653 ) ( CLEAR ?auto_102656 ) ( ON-TABLE ?auto_102654 ) ( HOLDING ?auto_102655 ) ( CLEAR ?auto_102660 ) ( ON-TABLE ?auto_102658 ) ( ON ?auto_102659 ?auto_102658 ) ( ON ?auto_102657 ?auto_102659 ) ( ON ?auto_102660 ?auto_102657 ) ( not ( = ?auto_102658 ?auto_102659 ) ) ( not ( = ?auto_102658 ?auto_102657 ) ) ( not ( = ?auto_102658 ?auto_102660 ) ) ( not ( = ?auto_102658 ?auto_102655 ) ) ( not ( = ?auto_102659 ?auto_102657 ) ) ( not ( = ?auto_102659 ?auto_102660 ) ) ( not ( = ?auto_102659 ?auto_102655 ) ) ( not ( = ?auto_102657 ?auto_102660 ) ) ( not ( = ?auto_102657 ?auto_102655 ) ) ( not ( = ?auto_102660 ?auto_102655 ) ) ( not ( = ?auto_102653 ?auto_102660 ) ) ( not ( = ?auto_102653 ?auto_102658 ) ) ( not ( = ?auto_102653 ?auto_102659 ) ) ( not ( = ?auto_102653 ?auto_102657 ) ) ( not ( = ?auto_102654 ?auto_102660 ) ) ( not ( = ?auto_102654 ?auto_102658 ) ) ( not ( = ?auto_102654 ?auto_102659 ) ) ( not ( = ?auto_102654 ?auto_102657 ) ) ( not ( = ?auto_102656 ?auto_102660 ) ) ( not ( = ?auto_102656 ?auto_102658 ) ) ( not ( = ?auto_102656 ?auto_102659 ) ) ( not ( = ?auto_102656 ?auto_102657 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102658 ?auto_102659 ?auto_102657 ?auto_102660 ?auto_102655 )
      ( MAKE-1PILE ?auto_102653 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102661 - BLOCK
    )
    :vars
    (
      ?auto_102662 - BLOCK
      ?auto_102665 - BLOCK
      ?auto_102666 - BLOCK
      ?auto_102664 - BLOCK
      ?auto_102663 - BLOCK
      ?auto_102667 - BLOCK
      ?auto_102668 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102661 ?auto_102662 ) ( not ( = ?auto_102661 ?auto_102662 ) ) ( not ( = ?auto_102661 ?auto_102665 ) ) ( not ( = ?auto_102661 ?auto_102666 ) ) ( not ( = ?auto_102662 ?auto_102665 ) ) ( not ( = ?auto_102662 ?auto_102666 ) ) ( not ( = ?auto_102665 ?auto_102666 ) ) ( ON ?auto_102665 ?auto_102661 ) ( ON-TABLE ?auto_102662 ) ( CLEAR ?auto_102664 ) ( ON-TABLE ?auto_102663 ) ( ON ?auto_102667 ?auto_102663 ) ( ON ?auto_102668 ?auto_102667 ) ( ON ?auto_102664 ?auto_102668 ) ( not ( = ?auto_102663 ?auto_102667 ) ) ( not ( = ?auto_102663 ?auto_102668 ) ) ( not ( = ?auto_102663 ?auto_102664 ) ) ( not ( = ?auto_102663 ?auto_102666 ) ) ( not ( = ?auto_102667 ?auto_102668 ) ) ( not ( = ?auto_102667 ?auto_102664 ) ) ( not ( = ?auto_102667 ?auto_102666 ) ) ( not ( = ?auto_102668 ?auto_102664 ) ) ( not ( = ?auto_102668 ?auto_102666 ) ) ( not ( = ?auto_102664 ?auto_102666 ) ) ( not ( = ?auto_102661 ?auto_102664 ) ) ( not ( = ?auto_102661 ?auto_102663 ) ) ( not ( = ?auto_102661 ?auto_102667 ) ) ( not ( = ?auto_102661 ?auto_102668 ) ) ( not ( = ?auto_102662 ?auto_102664 ) ) ( not ( = ?auto_102662 ?auto_102663 ) ) ( not ( = ?auto_102662 ?auto_102667 ) ) ( not ( = ?auto_102662 ?auto_102668 ) ) ( not ( = ?auto_102665 ?auto_102664 ) ) ( not ( = ?auto_102665 ?auto_102663 ) ) ( not ( = ?auto_102665 ?auto_102667 ) ) ( not ( = ?auto_102665 ?auto_102668 ) ) ( ON ?auto_102666 ?auto_102665 ) ( CLEAR ?auto_102666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102662 ?auto_102661 ?auto_102665 )
      ( MAKE-1PILE ?auto_102661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102669 - BLOCK
    )
    :vars
    (
      ?auto_102674 - BLOCK
      ?auto_102670 - BLOCK
      ?auto_102673 - BLOCK
      ?auto_102672 - BLOCK
      ?auto_102676 - BLOCK
      ?auto_102671 - BLOCK
      ?auto_102675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102669 ?auto_102674 ) ( not ( = ?auto_102669 ?auto_102674 ) ) ( not ( = ?auto_102669 ?auto_102670 ) ) ( not ( = ?auto_102669 ?auto_102673 ) ) ( not ( = ?auto_102674 ?auto_102670 ) ) ( not ( = ?auto_102674 ?auto_102673 ) ) ( not ( = ?auto_102670 ?auto_102673 ) ) ( ON ?auto_102670 ?auto_102669 ) ( ON-TABLE ?auto_102674 ) ( ON-TABLE ?auto_102672 ) ( ON ?auto_102676 ?auto_102672 ) ( ON ?auto_102671 ?auto_102676 ) ( not ( = ?auto_102672 ?auto_102676 ) ) ( not ( = ?auto_102672 ?auto_102671 ) ) ( not ( = ?auto_102672 ?auto_102675 ) ) ( not ( = ?auto_102672 ?auto_102673 ) ) ( not ( = ?auto_102676 ?auto_102671 ) ) ( not ( = ?auto_102676 ?auto_102675 ) ) ( not ( = ?auto_102676 ?auto_102673 ) ) ( not ( = ?auto_102671 ?auto_102675 ) ) ( not ( = ?auto_102671 ?auto_102673 ) ) ( not ( = ?auto_102675 ?auto_102673 ) ) ( not ( = ?auto_102669 ?auto_102675 ) ) ( not ( = ?auto_102669 ?auto_102672 ) ) ( not ( = ?auto_102669 ?auto_102676 ) ) ( not ( = ?auto_102669 ?auto_102671 ) ) ( not ( = ?auto_102674 ?auto_102675 ) ) ( not ( = ?auto_102674 ?auto_102672 ) ) ( not ( = ?auto_102674 ?auto_102676 ) ) ( not ( = ?auto_102674 ?auto_102671 ) ) ( not ( = ?auto_102670 ?auto_102675 ) ) ( not ( = ?auto_102670 ?auto_102672 ) ) ( not ( = ?auto_102670 ?auto_102676 ) ) ( not ( = ?auto_102670 ?auto_102671 ) ) ( ON ?auto_102673 ?auto_102670 ) ( CLEAR ?auto_102673 ) ( HOLDING ?auto_102675 ) ( CLEAR ?auto_102671 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102672 ?auto_102676 ?auto_102671 ?auto_102675 )
      ( MAKE-1PILE ?auto_102669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102677 - BLOCK
    )
    :vars
    (
      ?auto_102678 - BLOCK
      ?auto_102681 - BLOCK
      ?auto_102683 - BLOCK
      ?auto_102684 - BLOCK
      ?auto_102679 - BLOCK
      ?auto_102682 - BLOCK
      ?auto_102680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102677 ?auto_102678 ) ( not ( = ?auto_102677 ?auto_102678 ) ) ( not ( = ?auto_102677 ?auto_102681 ) ) ( not ( = ?auto_102677 ?auto_102683 ) ) ( not ( = ?auto_102678 ?auto_102681 ) ) ( not ( = ?auto_102678 ?auto_102683 ) ) ( not ( = ?auto_102681 ?auto_102683 ) ) ( ON ?auto_102681 ?auto_102677 ) ( ON-TABLE ?auto_102678 ) ( ON-TABLE ?auto_102684 ) ( ON ?auto_102679 ?auto_102684 ) ( ON ?auto_102682 ?auto_102679 ) ( not ( = ?auto_102684 ?auto_102679 ) ) ( not ( = ?auto_102684 ?auto_102682 ) ) ( not ( = ?auto_102684 ?auto_102680 ) ) ( not ( = ?auto_102684 ?auto_102683 ) ) ( not ( = ?auto_102679 ?auto_102682 ) ) ( not ( = ?auto_102679 ?auto_102680 ) ) ( not ( = ?auto_102679 ?auto_102683 ) ) ( not ( = ?auto_102682 ?auto_102680 ) ) ( not ( = ?auto_102682 ?auto_102683 ) ) ( not ( = ?auto_102680 ?auto_102683 ) ) ( not ( = ?auto_102677 ?auto_102680 ) ) ( not ( = ?auto_102677 ?auto_102684 ) ) ( not ( = ?auto_102677 ?auto_102679 ) ) ( not ( = ?auto_102677 ?auto_102682 ) ) ( not ( = ?auto_102678 ?auto_102680 ) ) ( not ( = ?auto_102678 ?auto_102684 ) ) ( not ( = ?auto_102678 ?auto_102679 ) ) ( not ( = ?auto_102678 ?auto_102682 ) ) ( not ( = ?auto_102681 ?auto_102680 ) ) ( not ( = ?auto_102681 ?auto_102684 ) ) ( not ( = ?auto_102681 ?auto_102679 ) ) ( not ( = ?auto_102681 ?auto_102682 ) ) ( ON ?auto_102683 ?auto_102681 ) ( CLEAR ?auto_102682 ) ( ON ?auto_102680 ?auto_102683 ) ( CLEAR ?auto_102680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102678 ?auto_102677 ?auto_102681 ?auto_102683 )
      ( MAKE-1PILE ?auto_102677 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102685 - BLOCK
    )
    :vars
    (
      ?auto_102689 - BLOCK
      ?auto_102686 - BLOCK
      ?auto_102692 - BLOCK
      ?auto_102688 - BLOCK
      ?auto_102691 - BLOCK
      ?auto_102690 - BLOCK
      ?auto_102687 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102685 ?auto_102689 ) ( not ( = ?auto_102685 ?auto_102689 ) ) ( not ( = ?auto_102685 ?auto_102686 ) ) ( not ( = ?auto_102685 ?auto_102692 ) ) ( not ( = ?auto_102689 ?auto_102686 ) ) ( not ( = ?auto_102689 ?auto_102692 ) ) ( not ( = ?auto_102686 ?auto_102692 ) ) ( ON ?auto_102686 ?auto_102685 ) ( ON-TABLE ?auto_102689 ) ( ON-TABLE ?auto_102688 ) ( ON ?auto_102691 ?auto_102688 ) ( not ( = ?auto_102688 ?auto_102691 ) ) ( not ( = ?auto_102688 ?auto_102690 ) ) ( not ( = ?auto_102688 ?auto_102687 ) ) ( not ( = ?auto_102688 ?auto_102692 ) ) ( not ( = ?auto_102691 ?auto_102690 ) ) ( not ( = ?auto_102691 ?auto_102687 ) ) ( not ( = ?auto_102691 ?auto_102692 ) ) ( not ( = ?auto_102690 ?auto_102687 ) ) ( not ( = ?auto_102690 ?auto_102692 ) ) ( not ( = ?auto_102687 ?auto_102692 ) ) ( not ( = ?auto_102685 ?auto_102687 ) ) ( not ( = ?auto_102685 ?auto_102688 ) ) ( not ( = ?auto_102685 ?auto_102691 ) ) ( not ( = ?auto_102685 ?auto_102690 ) ) ( not ( = ?auto_102689 ?auto_102687 ) ) ( not ( = ?auto_102689 ?auto_102688 ) ) ( not ( = ?auto_102689 ?auto_102691 ) ) ( not ( = ?auto_102689 ?auto_102690 ) ) ( not ( = ?auto_102686 ?auto_102687 ) ) ( not ( = ?auto_102686 ?auto_102688 ) ) ( not ( = ?auto_102686 ?auto_102691 ) ) ( not ( = ?auto_102686 ?auto_102690 ) ) ( ON ?auto_102692 ?auto_102686 ) ( ON ?auto_102687 ?auto_102692 ) ( CLEAR ?auto_102687 ) ( HOLDING ?auto_102690 ) ( CLEAR ?auto_102691 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102688 ?auto_102691 ?auto_102690 )
      ( MAKE-1PILE ?auto_102685 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102693 - BLOCK
    )
    :vars
    (
      ?auto_102700 - BLOCK
      ?auto_102695 - BLOCK
      ?auto_102698 - BLOCK
      ?auto_102694 - BLOCK
      ?auto_102697 - BLOCK
      ?auto_102696 - BLOCK
      ?auto_102699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102693 ?auto_102700 ) ( not ( = ?auto_102693 ?auto_102700 ) ) ( not ( = ?auto_102693 ?auto_102695 ) ) ( not ( = ?auto_102693 ?auto_102698 ) ) ( not ( = ?auto_102700 ?auto_102695 ) ) ( not ( = ?auto_102700 ?auto_102698 ) ) ( not ( = ?auto_102695 ?auto_102698 ) ) ( ON ?auto_102695 ?auto_102693 ) ( ON-TABLE ?auto_102700 ) ( ON-TABLE ?auto_102694 ) ( ON ?auto_102697 ?auto_102694 ) ( not ( = ?auto_102694 ?auto_102697 ) ) ( not ( = ?auto_102694 ?auto_102696 ) ) ( not ( = ?auto_102694 ?auto_102699 ) ) ( not ( = ?auto_102694 ?auto_102698 ) ) ( not ( = ?auto_102697 ?auto_102696 ) ) ( not ( = ?auto_102697 ?auto_102699 ) ) ( not ( = ?auto_102697 ?auto_102698 ) ) ( not ( = ?auto_102696 ?auto_102699 ) ) ( not ( = ?auto_102696 ?auto_102698 ) ) ( not ( = ?auto_102699 ?auto_102698 ) ) ( not ( = ?auto_102693 ?auto_102699 ) ) ( not ( = ?auto_102693 ?auto_102694 ) ) ( not ( = ?auto_102693 ?auto_102697 ) ) ( not ( = ?auto_102693 ?auto_102696 ) ) ( not ( = ?auto_102700 ?auto_102699 ) ) ( not ( = ?auto_102700 ?auto_102694 ) ) ( not ( = ?auto_102700 ?auto_102697 ) ) ( not ( = ?auto_102700 ?auto_102696 ) ) ( not ( = ?auto_102695 ?auto_102699 ) ) ( not ( = ?auto_102695 ?auto_102694 ) ) ( not ( = ?auto_102695 ?auto_102697 ) ) ( not ( = ?auto_102695 ?auto_102696 ) ) ( ON ?auto_102698 ?auto_102695 ) ( ON ?auto_102699 ?auto_102698 ) ( CLEAR ?auto_102697 ) ( ON ?auto_102696 ?auto_102699 ) ( CLEAR ?auto_102696 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102700 ?auto_102693 ?auto_102695 ?auto_102698 ?auto_102699 )
      ( MAKE-1PILE ?auto_102693 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102701 - BLOCK
    )
    :vars
    (
      ?auto_102703 - BLOCK
      ?auto_102707 - BLOCK
      ?auto_102704 - BLOCK
      ?auto_102702 - BLOCK
      ?auto_102705 - BLOCK
      ?auto_102706 - BLOCK
      ?auto_102708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102701 ?auto_102703 ) ( not ( = ?auto_102701 ?auto_102703 ) ) ( not ( = ?auto_102701 ?auto_102707 ) ) ( not ( = ?auto_102701 ?auto_102704 ) ) ( not ( = ?auto_102703 ?auto_102707 ) ) ( not ( = ?auto_102703 ?auto_102704 ) ) ( not ( = ?auto_102707 ?auto_102704 ) ) ( ON ?auto_102707 ?auto_102701 ) ( ON-TABLE ?auto_102703 ) ( ON-TABLE ?auto_102702 ) ( not ( = ?auto_102702 ?auto_102705 ) ) ( not ( = ?auto_102702 ?auto_102706 ) ) ( not ( = ?auto_102702 ?auto_102708 ) ) ( not ( = ?auto_102702 ?auto_102704 ) ) ( not ( = ?auto_102705 ?auto_102706 ) ) ( not ( = ?auto_102705 ?auto_102708 ) ) ( not ( = ?auto_102705 ?auto_102704 ) ) ( not ( = ?auto_102706 ?auto_102708 ) ) ( not ( = ?auto_102706 ?auto_102704 ) ) ( not ( = ?auto_102708 ?auto_102704 ) ) ( not ( = ?auto_102701 ?auto_102708 ) ) ( not ( = ?auto_102701 ?auto_102702 ) ) ( not ( = ?auto_102701 ?auto_102705 ) ) ( not ( = ?auto_102701 ?auto_102706 ) ) ( not ( = ?auto_102703 ?auto_102708 ) ) ( not ( = ?auto_102703 ?auto_102702 ) ) ( not ( = ?auto_102703 ?auto_102705 ) ) ( not ( = ?auto_102703 ?auto_102706 ) ) ( not ( = ?auto_102707 ?auto_102708 ) ) ( not ( = ?auto_102707 ?auto_102702 ) ) ( not ( = ?auto_102707 ?auto_102705 ) ) ( not ( = ?auto_102707 ?auto_102706 ) ) ( ON ?auto_102704 ?auto_102707 ) ( ON ?auto_102708 ?auto_102704 ) ( ON ?auto_102706 ?auto_102708 ) ( CLEAR ?auto_102706 ) ( HOLDING ?auto_102705 ) ( CLEAR ?auto_102702 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102702 ?auto_102705 )
      ( MAKE-1PILE ?auto_102701 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102709 - BLOCK
    )
    :vars
    (
      ?auto_102710 - BLOCK
      ?auto_102711 - BLOCK
      ?auto_102716 - BLOCK
      ?auto_102713 - BLOCK
      ?auto_102712 - BLOCK
      ?auto_102715 - BLOCK
      ?auto_102714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102709 ?auto_102710 ) ( not ( = ?auto_102709 ?auto_102710 ) ) ( not ( = ?auto_102709 ?auto_102711 ) ) ( not ( = ?auto_102709 ?auto_102716 ) ) ( not ( = ?auto_102710 ?auto_102711 ) ) ( not ( = ?auto_102710 ?auto_102716 ) ) ( not ( = ?auto_102711 ?auto_102716 ) ) ( ON ?auto_102711 ?auto_102709 ) ( ON-TABLE ?auto_102710 ) ( ON-TABLE ?auto_102713 ) ( not ( = ?auto_102713 ?auto_102712 ) ) ( not ( = ?auto_102713 ?auto_102715 ) ) ( not ( = ?auto_102713 ?auto_102714 ) ) ( not ( = ?auto_102713 ?auto_102716 ) ) ( not ( = ?auto_102712 ?auto_102715 ) ) ( not ( = ?auto_102712 ?auto_102714 ) ) ( not ( = ?auto_102712 ?auto_102716 ) ) ( not ( = ?auto_102715 ?auto_102714 ) ) ( not ( = ?auto_102715 ?auto_102716 ) ) ( not ( = ?auto_102714 ?auto_102716 ) ) ( not ( = ?auto_102709 ?auto_102714 ) ) ( not ( = ?auto_102709 ?auto_102713 ) ) ( not ( = ?auto_102709 ?auto_102712 ) ) ( not ( = ?auto_102709 ?auto_102715 ) ) ( not ( = ?auto_102710 ?auto_102714 ) ) ( not ( = ?auto_102710 ?auto_102713 ) ) ( not ( = ?auto_102710 ?auto_102712 ) ) ( not ( = ?auto_102710 ?auto_102715 ) ) ( not ( = ?auto_102711 ?auto_102714 ) ) ( not ( = ?auto_102711 ?auto_102713 ) ) ( not ( = ?auto_102711 ?auto_102712 ) ) ( not ( = ?auto_102711 ?auto_102715 ) ) ( ON ?auto_102716 ?auto_102711 ) ( ON ?auto_102714 ?auto_102716 ) ( ON ?auto_102715 ?auto_102714 ) ( CLEAR ?auto_102713 ) ( ON ?auto_102712 ?auto_102715 ) ( CLEAR ?auto_102712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102710 ?auto_102709 ?auto_102711 ?auto_102716 ?auto_102714 ?auto_102715 )
      ( MAKE-1PILE ?auto_102709 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102717 - BLOCK
    )
    :vars
    (
      ?auto_102721 - BLOCK
      ?auto_102719 - BLOCK
      ?auto_102722 - BLOCK
      ?auto_102723 - BLOCK
      ?auto_102720 - BLOCK
      ?auto_102724 - BLOCK
      ?auto_102718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102717 ?auto_102721 ) ( not ( = ?auto_102717 ?auto_102721 ) ) ( not ( = ?auto_102717 ?auto_102719 ) ) ( not ( = ?auto_102717 ?auto_102722 ) ) ( not ( = ?auto_102721 ?auto_102719 ) ) ( not ( = ?auto_102721 ?auto_102722 ) ) ( not ( = ?auto_102719 ?auto_102722 ) ) ( ON ?auto_102719 ?auto_102717 ) ( ON-TABLE ?auto_102721 ) ( not ( = ?auto_102723 ?auto_102720 ) ) ( not ( = ?auto_102723 ?auto_102724 ) ) ( not ( = ?auto_102723 ?auto_102718 ) ) ( not ( = ?auto_102723 ?auto_102722 ) ) ( not ( = ?auto_102720 ?auto_102724 ) ) ( not ( = ?auto_102720 ?auto_102718 ) ) ( not ( = ?auto_102720 ?auto_102722 ) ) ( not ( = ?auto_102724 ?auto_102718 ) ) ( not ( = ?auto_102724 ?auto_102722 ) ) ( not ( = ?auto_102718 ?auto_102722 ) ) ( not ( = ?auto_102717 ?auto_102718 ) ) ( not ( = ?auto_102717 ?auto_102723 ) ) ( not ( = ?auto_102717 ?auto_102720 ) ) ( not ( = ?auto_102717 ?auto_102724 ) ) ( not ( = ?auto_102721 ?auto_102718 ) ) ( not ( = ?auto_102721 ?auto_102723 ) ) ( not ( = ?auto_102721 ?auto_102720 ) ) ( not ( = ?auto_102721 ?auto_102724 ) ) ( not ( = ?auto_102719 ?auto_102718 ) ) ( not ( = ?auto_102719 ?auto_102723 ) ) ( not ( = ?auto_102719 ?auto_102720 ) ) ( not ( = ?auto_102719 ?auto_102724 ) ) ( ON ?auto_102722 ?auto_102719 ) ( ON ?auto_102718 ?auto_102722 ) ( ON ?auto_102724 ?auto_102718 ) ( ON ?auto_102720 ?auto_102724 ) ( CLEAR ?auto_102720 ) ( HOLDING ?auto_102723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102723 )
      ( MAKE-1PILE ?auto_102717 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_102725 - BLOCK
    )
    :vars
    (
      ?auto_102731 - BLOCK
      ?auto_102729 - BLOCK
      ?auto_102730 - BLOCK
      ?auto_102727 - BLOCK
      ?auto_102728 - BLOCK
      ?auto_102726 - BLOCK
      ?auto_102732 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102725 ?auto_102731 ) ( not ( = ?auto_102725 ?auto_102731 ) ) ( not ( = ?auto_102725 ?auto_102729 ) ) ( not ( = ?auto_102725 ?auto_102730 ) ) ( not ( = ?auto_102731 ?auto_102729 ) ) ( not ( = ?auto_102731 ?auto_102730 ) ) ( not ( = ?auto_102729 ?auto_102730 ) ) ( ON ?auto_102729 ?auto_102725 ) ( ON-TABLE ?auto_102731 ) ( not ( = ?auto_102727 ?auto_102728 ) ) ( not ( = ?auto_102727 ?auto_102726 ) ) ( not ( = ?auto_102727 ?auto_102732 ) ) ( not ( = ?auto_102727 ?auto_102730 ) ) ( not ( = ?auto_102728 ?auto_102726 ) ) ( not ( = ?auto_102728 ?auto_102732 ) ) ( not ( = ?auto_102728 ?auto_102730 ) ) ( not ( = ?auto_102726 ?auto_102732 ) ) ( not ( = ?auto_102726 ?auto_102730 ) ) ( not ( = ?auto_102732 ?auto_102730 ) ) ( not ( = ?auto_102725 ?auto_102732 ) ) ( not ( = ?auto_102725 ?auto_102727 ) ) ( not ( = ?auto_102725 ?auto_102728 ) ) ( not ( = ?auto_102725 ?auto_102726 ) ) ( not ( = ?auto_102731 ?auto_102732 ) ) ( not ( = ?auto_102731 ?auto_102727 ) ) ( not ( = ?auto_102731 ?auto_102728 ) ) ( not ( = ?auto_102731 ?auto_102726 ) ) ( not ( = ?auto_102729 ?auto_102732 ) ) ( not ( = ?auto_102729 ?auto_102727 ) ) ( not ( = ?auto_102729 ?auto_102728 ) ) ( not ( = ?auto_102729 ?auto_102726 ) ) ( ON ?auto_102730 ?auto_102729 ) ( ON ?auto_102732 ?auto_102730 ) ( ON ?auto_102726 ?auto_102732 ) ( ON ?auto_102728 ?auto_102726 ) ( ON ?auto_102727 ?auto_102728 ) ( CLEAR ?auto_102727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102731 ?auto_102725 ?auto_102729 ?auto_102730 ?auto_102732 ?auto_102726 ?auto_102728 )
      ( MAKE-1PILE ?auto_102725 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_102744 - BLOCK
      ?auto_102745 - BLOCK
      ?auto_102746 - BLOCK
      ?auto_102747 - BLOCK
      ?auto_102748 - BLOCK
    )
    :vars
    (
      ?auto_102749 - BLOCK
      ?auto_102750 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102749 ?auto_102748 ) ( CLEAR ?auto_102749 ) ( ON-TABLE ?auto_102744 ) ( ON ?auto_102745 ?auto_102744 ) ( ON ?auto_102746 ?auto_102745 ) ( ON ?auto_102747 ?auto_102746 ) ( ON ?auto_102748 ?auto_102747 ) ( not ( = ?auto_102744 ?auto_102745 ) ) ( not ( = ?auto_102744 ?auto_102746 ) ) ( not ( = ?auto_102744 ?auto_102747 ) ) ( not ( = ?auto_102744 ?auto_102748 ) ) ( not ( = ?auto_102744 ?auto_102749 ) ) ( not ( = ?auto_102745 ?auto_102746 ) ) ( not ( = ?auto_102745 ?auto_102747 ) ) ( not ( = ?auto_102745 ?auto_102748 ) ) ( not ( = ?auto_102745 ?auto_102749 ) ) ( not ( = ?auto_102746 ?auto_102747 ) ) ( not ( = ?auto_102746 ?auto_102748 ) ) ( not ( = ?auto_102746 ?auto_102749 ) ) ( not ( = ?auto_102747 ?auto_102748 ) ) ( not ( = ?auto_102747 ?auto_102749 ) ) ( not ( = ?auto_102748 ?auto_102749 ) ) ( HOLDING ?auto_102750 ) ( not ( = ?auto_102744 ?auto_102750 ) ) ( not ( = ?auto_102745 ?auto_102750 ) ) ( not ( = ?auto_102746 ?auto_102750 ) ) ( not ( = ?auto_102747 ?auto_102750 ) ) ( not ( = ?auto_102748 ?auto_102750 ) ) ( not ( = ?auto_102749 ?auto_102750 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_102750 )
      ( MAKE-5PILE ?auto_102744 ?auto_102745 ?auto_102746 ?auto_102747 ?auto_102748 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102841 - BLOCK
      ?auto_102842 - BLOCK
    )
    :vars
    (
      ?auto_102843 - BLOCK
      ?auto_102846 - BLOCK
      ?auto_102844 - BLOCK
      ?auto_102845 - BLOCK
      ?auto_102847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102841 ?auto_102842 ) ) ( ON ?auto_102842 ?auto_102843 ) ( not ( = ?auto_102841 ?auto_102843 ) ) ( not ( = ?auto_102842 ?auto_102843 ) ) ( ON ?auto_102841 ?auto_102842 ) ( CLEAR ?auto_102841 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102846 ) ( ON ?auto_102844 ?auto_102846 ) ( ON ?auto_102845 ?auto_102844 ) ( ON ?auto_102847 ?auto_102845 ) ( ON ?auto_102843 ?auto_102847 ) ( not ( = ?auto_102846 ?auto_102844 ) ) ( not ( = ?auto_102846 ?auto_102845 ) ) ( not ( = ?auto_102846 ?auto_102847 ) ) ( not ( = ?auto_102846 ?auto_102843 ) ) ( not ( = ?auto_102846 ?auto_102842 ) ) ( not ( = ?auto_102846 ?auto_102841 ) ) ( not ( = ?auto_102844 ?auto_102845 ) ) ( not ( = ?auto_102844 ?auto_102847 ) ) ( not ( = ?auto_102844 ?auto_102843 ) ) ( not ( = ?auto_102844 ?auto_102842 ) ) ( not ( = ?auto_102844 ?auto_102841 ) ) ( not ( = ?auto_102845 ?auto_102847 ) ) ( not ( = ?auto_102845 ?auto_102843 ) ) ( not ( = ?auto_102845 ?auto_102842 ) ) ( not ( = ?auto_102845 ?auto_102841 ) ) ( not ( = ?auto_102847 ?auto_102843 ) ) ( not ( = ?auto_102847 ?auto_102842 ) ) ( not ( = ?auto_102847 ?auto_102841 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102846 ?auto_102844 ?auto_102845 ?auto_102847 ?auto_102843 ?auto_102842 )
      ( MAKE-2PILE ?auto_102841 ?auto_102842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102850 - BLOCK
      ?auto_102851 - BLOCK
    )
    :vars
    (
      ?auto_102852 - BLOCK
      ?auto_102853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102850 ?auto_102851 ) ) ( ON ?auto_102851 ?auto_102852 ) ( CLEAR ?auto_102851 ) ( not ( = ?auto_102850 ?auto_102852 ) ) ( not ( = ?auto_102851 ?auto_102852 ) ) ( ON ?auto_102850 ?auto_102853 ) ( CLEAR ?auto_102850 ) ( HAND-EMPTY ) ( not ( = ?auto_102850 ?auto_102853 ) ) ( not ( = ?auto_102851 ?auto_102853 ) ) ( not ( = ?auto_102852 ?auto_102853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_102850 ?auto_102853 )
      ( MAKE-2PILE ?auto_102850 ?auto_102851 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102854 - BLOCK
      ?auto_102855 - BLOCK
    )
    :vars
    (
      ?auto_102857 - BLOCK
      ?auto_102856 - BLOCK
      ?auto_102858 - BLOCK
      ?auto_102859 - BLOCK
      ?auto_102861 - BLOCK
      ?auto_102860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102854 ?auto_102855 ) ) ( not ( = ?auto_102854 ?auto_102857 ) ) ( not ( = ?auto_102855 ?auto_102857 ) ) ( ON ?auto_102854 ?auto_102856 ) ( CLEAR ?auto_102854 ) ( not ( = ?auto_102854 ?auto_102856 ) ) ( not ( = ?auto_102855 ?auto_102856 ) ) ( not ( = ?auto_102857 ?auto_102856 ) ) ( HOLDING ?auto_102855 ) ( CLEAR ?auto_102857 ) ( ON-TABLE ?auto_102858 ) ( ON ?auto_102859 ?auto_102858 ) ( ON ?auto_102861 ?auto_102859 ) ( ON ?auto_102860 ?auto_102861 ) ( ON ?auto_102857 ?auto_102860 ) ( not ( = ?auto_102858 ?auto_102859 ) ) ( not ( = ?auto_102858 ?auto_102861 ) ) ( not ( = ?auto_102858 ?auto_102860 ) ) ( not ( = ?auto_102858 ?auto_102857 ) ) ( not ( = ?auto_102858 ?auto_102855 ) ) ( not ( = ?auto_102859 ?auto_102861 ) ) ( not ( = ?auto_102859 ?auto_102860 ) ) ( not ( = ?auto_102859 ?auto_102857 ) ) ( not ( = ?auto_102859 ?auto_102855 ) ) ( not ( = ?auto_102861 ?auto_102860 ) ) ( not ( = ?auto_102861 ?auto_102857 ) ) ( not ( = ?auto_102861 ?auto_102855 ) ) ( not ( = ?auto_102860 ?auto_102857 ) ) ( not ( = ?auto_102860 ?auto_102855 ) ) ( not ( = ?auto_102854 ?auto_102858 ) ) ( not ( = ?auto_102854 ?auto_102859 ) ) ( not ( = ?auto_102854 ?auto_102861 ) ) ( not ( = ?auto_102854 ?auto_102860 ) ) ( not ( = ?auto_102856 ?auto_102858 ) ) ( not ( = ?auto_102856 ?auto_102859 ) ) ( not ( = ?auto_102856 ?auto_102861 ) ) ( not ( = ?auto_102856 ?auto_102860 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102858 ?auto_102859 ?auto_102861 ?auto_102860 ?auto_102857 ?auto_102855 )
      ( MAKE-2PILE ?auto_102854 ?auto_102855 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102862 - BLOCK
      ?auto_102863 - BLOCK
    )
    :vars
    (
      ?auto_102869 - BLOCK
      ?auto_102865 - BLOCK
      ?auto_102866 - BLOCK
      ?auto_102868 - BLOCK
      ?auto_102864 - BLOCK
      ?auto_102867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102862 ?auto_102863 ) ) ( not ( = ?auto_102862 ?auto_102869 ) ) ( not ( = ?auto_102863 ?auto_102869 ) ) ( ON ?auto_102862 ?auto_102865 ) ( not ( = ?auto_102862 ?auto_102865 ) ) ( not ( = ?auto_102863 ?auto_102865 ) ) ( not ( = ?auto_102869 ?auto_102865 ) ) ( CLEAR ?auto_102869 ) ( ON-TABLE ?auto_102866 ) ( ON ?auto_102868 ?auto_102866 ) ( ON ?auto_102864 ?auto_102868 ) ( ON ?auto_102867 ?auto_102864 ) ( ON ?auto_102869 ?auto_102867 ) ( not ( = ?auto_102866 ?auto_102868 ) ) ( not ( = ?auto_102866 ?auto_102864 ) ) ( not ( = ?auto_102866 ?auto_102867 ) ) ( not ( = ?auto_102866 ?auto_102869 ) ) ( not ( = ?auto_102866 ?auto_102863 ) ) ( not ( = ?auto_102868 ?auto_102864 ) ) ( not ( = ?auto_102868 ?auto_102867 ) ) ( not ( = ?auto_102868 ?auto_102869 ) ) ( not ( = ?auto_102868 ?auto_102863 ) ) ( not ( = ?auto_102864 ?auto_102867 ) ) ( not ( = ?auto_102864 ?auto_102869 ) ) ( not ( = ?auto_102864 ?auto_102863 ) ) ( not ( = ?auto_102867 ?auto_102869 ) ) ( not ( = ?auto_102867 ?auto_102863 ) ) ( not ( = ?auto_102862 ?auto_102866 ) ) ( not ( = ?auto_102862 ?auto_102868 ) ) ( not ( = ?auto_102862 ?auto_102864 ) ) ( not ( = ?auto_102862 ?auto_102867 ) ) ( not ( = ?auto_102865 ?auto_102866 ) ) ( not ( = ?auto_102865 ?auto_102868 ) ) ( not ( = ?auto_102865 ?auto_102864 ) ) ( not ( = ?auto_102865 ?auto_102867 ) ) ( ON ?auto_102863 ?auto_102862 ) ( CLEAR ?auto_102863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_102865 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102865 ?auto_102862 )
      ( MAKE-2PILE ?auto_102862 ?auto_102863 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102870 - BLOCK
      ?auto_102871 - BLOCK
    )
    :vars
    (
      ?auto_102877 - BLOCK
      ?auto_102876 - BLOCK
      ?auto_102874 - BLOCK
      ?auto_102875 - BLOCK
      ?auto_102872 - BLOCK
      ?auto_102873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102870 ?auto_102871 ) ) ( not ( = ?auto_102870 ?auto_102877 ) ) ( not ( = ?auto_102871 ?auto_102877 ) ) ( ON ?auto_102870 ?auto_102876 ) ( not ( = ?auto_102870 ?auto_102876 ) ) ( not ( = ?auto_102871 ?auto_102876 ) ) ( not ( = ?auto_102877 ?auto_102876 ) ) ( ON-TABLE ?auto_102874 ) ( ON ?auto_102875 ?auto_102874 ) ( ON ?auto_102872 ?auto_102875 ) ( ON ?auto_102873 ?auto_102872 ) ( not ( = ?auto_102874 ?auto_102875 ) ) ( not ( = ?auto_102874 ?auto_102872 ) ) ( not ( = ?auto_102874 ?auto_102873 ) ) ( not ( = ?auto_102874 ?auto_102877 ) ) ( not ( = ?auto_102874 ?auto_102871 ) ) ( not ( = ?auto_102875 ?auto_102872 ) ) ( not ( = ?auto_102875 ?auto_102873 ) ) ( not ( = ?auto_102875 ?auto_102877 ) ) ( not ( = ?auto_102875 ?auto_102871 ) ) ( not ( = ?auto_102872 ?auto_102873 ) ) ( not ( = ?auto_102872 ?auto_102877 ) ) ( not ( = ?auto_102872 ?auto_102871 ) ) ( not ( = ?auto_102873 ?auto_102877 ) ) ( not ( = ?auto_102873 ?auto_102871 ) ) ( not ( = ?auto_102870 ?auto_102874 ) ) ( not ( = ?auto_102870 ?auto_102875 ) ) ( not ( = ?auto_102870 ?auto_102872 ) ) ( not ( = ?auto_102870 ?auto_102873 ) ) ( not ( = ?auto_102876 ?auto_102874 ) ) ( not ( = ?auto_102876 ?auto_102875 ) ) ( not ( = ?auto_102876 ?auto_102872 ) ) ( not ( = ?auto_102876 ?auto_102873 ) ) ( ON ?auto_102871 ?auto_102870 ) ( CLEAR ?auto_102871 ) ( ON-TABLE ?auto_102876 ) ( HOLDING ?auto_102877 ) ( CLEAR ?auto_102873 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102874 ?auto_102875 ?auto_102872 ?auto_102873 ?auto_102877 )
      ( MAKE-2PILE ?auto_102870 ?auto_102871 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102878 - BLOCK
      ?auto_102879 - BLOCK
    )
    :vars
    (
      ?auto_102881 - BLOCK
      ?auto_102882 - BLOCK
      ?auto_102884 - BLOCK
      ?auto_102880 - BLOCK
      ?auto_102883 - BLOCK
      ?auto_102885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102878 ?auto_102879 ) ) ( not ( = ?auto_102878 ?auto_102881 ) ) ( not ( = ?auto_102879 ?auto_102881 ) ) ( ON ?auto_102878 ?auto_102882 ) ( not ( = ?auto_102878 ?auto_102882 ) ) ( not ( = ?auto_102879 ?auto_102882 ) ) ( not ( = ?auto_102881 ?auto_102882 ) ) ( ON-TABLE ?auto_102884 ) ( ON ?auto_102880 ?auto_102884 ) ( ON ?auto_102883 ?auto_102880 ) ( ON ?auto_102885 ?auto_102883 ) ( not ( = ?auto_102884 ?auto_102880 ) ) ( not ( = ?auto_102884 ?auto_102883 ) ) ( not ( = ?auto_102884 ?auto_102885 ) ) ( not ( = ?auto_102884 ?auto_102881 ) ) ( not ( = ?auto_102884 ?auto_102879 ) ) ( not ( = ?auto_102880 ?auto_102883 ) ) ( not ( = ?auto_102880 ?auto_102885 ) ) ( not ( = ?auto_102880 ?auto_102881 ) ) ( not ( = ?auto_102880 ?auto_102879 ) ) ( not ( = ?auto_102883 ?auto_102885 ) ) ( not ( = ?auto_102883 ?auto_102881 ) ) ( not ( = ?auto_102883 ?auto_102879 ) ) ( not ( = ?auto_102885 ?auto_102881 ) ) ( not ( = ?auto_102885 ?auto_102879 ) ) ( not ( = ?auto_102878 ?auto_102884 ) ) ( not ( = ?auto_102878 ?auto_102880 ) ) ( not ( = ?auto_102878 ?auto_102883 ) ) ( not ( = ?auto_102878 ?auto_102885 ) ) ( not ( = ?auto_102882 ?auto_102884 ) ) ( not ( = ?auto_102882 ?auto_102880 ) ) ( not ( = ?auto_102882 ?auto_102883 ) ) ( not ( = ?auto_102882 ?auto_102885 ) ) ( ON ?auto_102879 ?auto_102878 ) ( ON-TABLE ?auto_102882 ) ( CLEAR ?auto_102885 ) ( ON ?auto_102881 ?auto_102879 ) ( CLEAR ?auto_102881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102882 ?auto_102878 ?auto_102879 )
      ( MAKE-2PILE ?auto_102878 ?auto_102879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102886 - BLOCK
      ?auto_102887 - BLOCK
    )
    :vars
    (
      ?auto_102891 - BLOCK
      ?auto_102893 - BLOCK
      ?auto_102888 - BLOCK
      ?auto_102892 - BLOCK
      ?auto_102889 - BLOCK
      ?auto_102890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102886 ?auto_102887 ) ) ( not ( = ?auto_102886 ?auto_102891 ) ) ( not ( = ?auto_102887 ?auto_102891 ) ) ( ON ?auto_102886 ?auto_102893 ) ( not ( = ?auto_102886 ?auto_102893 ) ) ( not ( = ?auto_102887 ?auto_102893 ) ) ( not ( = ?auto_102891 ?auto_102893 ) ) ( ON-TABLE ?auto_102888 ) ( ON ?auto_102892 ?auto_102888 ) ( ON ?auto_102889 ?auto_102892 ) ( not ( = ?auto_102888 ?auto_102892 ) ) ( not ( = ?auto_102888 ?auto_102889 ) ) ( not ( = ?auto_102888 ?auto_102890 ) ) ( not ( = ?auto_102888 ?auto_102891 ) ) ( not ( = ?auto_102888 ?auto_102887 ) ) ( not ( = ?auto_102892 ?auto_102889 ) ) ( not ( = ?auto_102892 ?auto_102890 ) ) ( not ( = ?auto_102892 ?auto_102891 ) ) ( not ( = ?auto_102892 ?auto_102887 ) ) ( not ( = ?auto_102889 ?auto_102890 ) ) ( not ( = ?auto_102889 ?auto_102891 ) ) ( not ( = ?auto_102889 ?auto_102887 ) ) ( not ( = ?auto_102890 ?auto_102891 ) ) ( not ( = ?auto_102890 ?auto_102887 ) ) ( not ( = ?auto_102886 ?auto_102888 ) ) ( not ( = ?auto_102886 ?auto_102892 ) ) ( not ( = ?auto_102886 ?auto_102889 ) ) ( not ( = ?auto_102886 ?auto_102890 ) ) ( not ( = ?auto_102893 ?auto_102888 ) ) ( not ( = ?auto_102893 ?auto_102892 ) ) ( not ( = ?auto_102893 ?auto_102889 ) ) ( not ( = ?auto_102893 ?auto_102890 ) ) ( ON ?auto_102887 ?auto_102886 ) ( ON-TABLE ?auto_102893 ) ( ON ?auto_102891 ?auto_102887 ) ( CLEAR ?auto_102891 ) ( HOLDING ?auto_102890 ) ( CLEAR ?auto_102889 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102888 ?auto_102892 ?auto_102889 ?auto_102890 )
      ( MAKE-2PILE ?auto_102886 ?auto_102887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102894 - BLOCK
      ?auto_102895 - BLOCK
    )
    :vars
    (
      ?auto_102898 - BLOCK
      ?auto_102899 - BLOCK
      ?auto_102901 - BLOCK
      ?auto_102897 - BLOCK
      ?auto_102896 - BLOCK
      ?auto_102900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102894 ?auto_102895 ) ) ( not ( = ?auto_102894 ?auto_102898 ) ) ( not ( = ?auto_102895 ?auto_102898 ) ) ( ON ?auto_102894 ?auto_102899 ) ( not ( = ?auto_102894 ?auto_102899 ) ) ( not ( = ?auto_102895 ?auto_102899 ) ) ( not ( = ?auto_102898 ?auto_102899 ) ) ( ON-TABLE ?auto_102901 ) ( ON ?auto_102897 ?auto_102901 ) ( ON ?auto_102896 ?auto_102897 ) ( not ( = ?auto_102901 ?auto_102897 ) ) ( not ( = ?auto_102901 ?auto_102896 ) ) ( not ( = ?auto_102901 ?auto_102900 ) ) ( not ( = ?auto_102901 ?auto_102898 ) ) ( not ( = ?auto_102901 ?auto_102895 ) ) ( not ( = ?auto_102897 ?auto_102896 ) ) ( not ( = ?auto_102897 ?auto_102900 ) ) ( not ( = ?auto_102897 ?auto_102898 ) ) ( not ( = ?auto_102897 ?auto_102895 ) ) ( not ( = ?auto_102896 ?auto_102900 ) ) ( not ( = ?auto_102896 ?auto_102898 ) ) ( not ( = ?auto_102896 ?auto_102895 ) ) ( not ( = ?auto_102900 ?auto_102898 ) ) ( not ( = ?auto_102900 ?auto_102895 ) ) ( not ( = ?auto_102894 ?auto_102901 ) ) ( not ( = ?auto_102894 ?auto_102897 ) ) ( not ( = ?auto_102894 ?auto_102896 ) ) ( not ( = ?auto_102894 ?auto_102900 ) ) ( not ( = ?auto_102899 ?auto_102901 ) ) ( not ( = ?auto_102899 ?auto_102897 ) ) ( not ( = ?auto_102899 ?auto_102896 ) ) ( not ( = ?auto_102899 ?auto_102900 ) ) ( ON ?auto_102895 ?auto_102894 ) ( ON-TABLE ?auto_102899 ) ( ON ?auto_102898 ?auto_102895 ) ( CLEAR ?auto_102896 ) ( ON ?auto_102900 ?auto_102898 ) ( CLEAR ?auto_102900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_102899 ?auto_102894 ?auto_102895 ?auto_102898 )
      ( MAKE-2PILE ?auto_102894 ?auto_102895 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102902 - BLOCK
      ?auto_102903 - BLOCK
    )
    :vars
    (
      ?auto_102904 - BLOCK
      ?auto_102906 - BLOCK
      ?auto_102908 - BLOCK
      ?auto_102907 - BLOCK
      ?auto_102909 - BLOCK
      ?auto_102905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102902 ?auto_102903 ) ) ( not ( = ?auto_102902 ?auto_102904 ) ) ( not ( = ?auto_102903 ?auto_102904 ) ) ( ON ?auto_102902 ?auto_102906 ) ( not ( = ?auto_102902 ?auto_102906 ) ) ( not ( = ?auto_102903 ?auto_102906 ) ) ( not ( = ?auto_102904 ?auto_102906 ) ) ( ON-TABLE ?auto_102908 ) ( ON ?auto_102907 ?auto_102908 ) ( not ( = ?auto_102908 ?auto_102907 ) ) ( not ( = ?auto_102908 ?auto_102909 ) ) ( not ( = ?auto_102908 ?auto_102905 ) ) ( not ( = ?auto_102908 ?auto_102904 ) ) ( not ( = ?auto_102908 ?auto_102903 ) ) ( not ( = ?auto_102907 ?auto_102909 ) ) ( not ( = ?auto_102907 ?auto_102905 ) ) ( not ( = ?auto_102907 ?auto_102904 ) ) ( not ( = ?auto_102907 ?auto_102903 ) ) ( not ( = ?auto_102909 ?auto_102905 ) ) ( not ( = ?auto_102909 ?auto_102904 ) ) ( not ( = ?auto_102909 ?auto_102903 ) ) ( not ( = ?auto_102905 ?auto_102904 ) ) ( not ( = ?auto_102905 ?auto_102903 ) ) ( not ( = ?auto_102902 ?auto_102908 ) ) ( not ( = ?auto_102902 ?auto_102907 ) ) ( not ( = ?auto_102902 ?auto_102909 ) ) ( not ( = ?auto_102902 ?auto_102905 ) ) ( not ( = ?auto_102906 ?auto_102908 ) ) ( not ( = ?auto_102906 ?auto_102907 ) ) ( not ( = ?auto_102906 ?auto_102909 ) ) ( not ( = ?auto_102906 ?auto_102905 ) ) ( ON ?auto_102903 ?auto_102902 ) ( ON-TABLE ?auto_102906 ) ( ON ?auto_102904 ?auto_102903 ) ( ON ?auto_102905 ?auto_102904 ) ( CLEAR ?auto_102905 ) ( HOLDING ?auto_102909 ) ( CLEAR ?auto_102907 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_102908 ?auto_102907 ?auto_102909 )
      ( MAKE-2PILE ?auto_102902 ?auto_102903 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102910 - BLOCK
      ?auto_102911 - BLOCK
    )
    :vars
    (
      ?auto_102912 - BLOCK
      ?auto_102917 - BLOCK
      ?auto_102914 - BLOCK
      ?auto_102913 - BLOCK
      ?auto_102916 - BLOCK
      ?auto_102915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102910 ?auto_102911 ) ) ( not ( = ?auto_102910 ?auto_102912 ) ) ( not ( = ?auto_102911 ?auto_102912 ) ) ( ON ?auto_102910 ?auto_102917 ) ( not ( = ?auto_102910 ?auto_102917 ) ) ( not ( = ?auto_102911 ?auto_102917 ) ) ( not ( = ?auto_102912 ?auto_102917 ) ) ( ON-TABLE ?auto_102914 ) ( ON ?auto_102913 ?auto_102914 ) ( not ( = ?auto_102914 ?auto_102913 ) ) ( not ( = ?auto_102914 ?auto_102916 ) ) ( not ( = ?auto_102914 ?auto_102915 ) ) ( not ( = ?auto_102914 ?auto_102912 ) ) ( not ( = ?auto_102914 ?auto_102911 ) ) ( not ( = ?auto_102913 ?auto_102916 ) ) ( not ( = ?auto_102913 ?auto_102915 ) ) ( not ( = ?auto_102913 ?auto_102912 ) ) ( not ( = ?auto_102913 ?auto_102911 ) ) ( not ( = ?auto_102916 ?auto_102915 ) ) ( not ( = ?auto_102916 ?auto_102912 ) ) ( not ( = ?auto_102916 ?auto_102911 ) ) ( not ( = ?auto_102915 ?auto_102912 ) ) ( not ( = ?auto_102915 ?auto_102911 ) ) ( not ( = ?auto_102910 ?auto_102914 ) ) ( not ( = ?auto_102910 ?auto_102913 ) ) ( not ( = ?auto_102910 ?auto_102916 ) ) ( not ( = ?auto_102910 ?auto_102915 ) ) ( not ( = ?auto_102917 ?auto_102914 ) ) ( not ( = ?auto_102917 ?auto_102913 ) ) ( not ( = ?auto_102917 ?auto_102916 ) ) ( not ( = ?auto_102917 ?auto_102915 ) ) ( ON ?auto_102911 ?auto_102910 ) ( ON-TABLE ?auto_102917 ) ( ON ?auto_102912 ?auto_102911 ) ( ON ?auto_102915 ?auto_102912 ) ( CLEAR ?auto_102913 ) ( ON ?auto_102916 ?auto_102915 ) ( CLEAR ?auto_102916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_102917 ?auto_102910 ?auto_102911 ?auto_102912 ?auto_102915 )
      ( MAKE-2PILE ?auto_102910 ?auto_102911 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102918 - BLOCK
      ?auto_102919 - BLOCK
    )
    :vars
    (
      ?auto_102924 - BLOCK
      ?auto_102920 - BLOCK
      ?auto_102921 - BLOCK
      ?auto_102925 - BLOCK
      ?auto_102922 - BLOCK
      ?auto_102923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102918 ?auto_102919 ) ) ( not ( = ?auto_102918 ?auto_102924 ) ) ( not ( = ?auto_102919 ?auto_102924 ) ) ( ON ?auto_102918 ?auto_102920 ) ( not ( = ?auto_102918 ?auto_102920 ) ) ( not ( = ?auto_102919 ?auto_102920 ) ) ( not ( = ?auto_102924 ?auto_102920 ) ) ( ON-TABLE ?auto_102921 ) ( not ( = ?auto_102921 ?auto_102925 ) ) ( not ( = ?auto_102921 ?auto_102922 ) ) ( not ( = ?auto_102921 ?auto_102923 ) ) ( not ( = ?auto_102921 ?auto_102924 ) ) ( not ( = ?auto_102921 ?auto_102919 ) ) ( not ( = ?auto_102925 ?auto_102922 ) ) ( not ( = ?auto_102925 ?auto_102923 ) ) ( not ( = ?auto_102925 ?auto_102924 ) ) ( not ( = ?auto_102925 ?auto_102919 ) ) ( not ( = ?auto_102922 ?auto_102923 ) ) ( not ( = ?auto_102922 ?auto_102924 ) ) ( not ( = ?auto_102922 ?auto_102919 ) ) ( not ( = ?auto_102923 ?auto_102924 ) ) ( not ( = ?auto_102923 ?auto_102919 ) ) ( not ( = ?auto_102918 ?auto_102921 ) ) ( not ( = ?auto_102918 ?auto_102925 ) ) ( not ( = ?auto_102918 ?auto_102922 ) ) ( not ( = ?auto_102918 ?auto_102923 ) ) ( not ( = ?auto_102920 ?auto_102921 ) ) ( not ( = ?auto_102920 ?auto_102925 ) ) ( not ( = ?auto_102920 ?auto_102922 ) ) ( not ( = ?auto_102920 ?auto_102923 ) ) ( ON ?auto_102919 ?auto_102918 ) ( ON-TABLE ?auto_102920 ) ( ON ?auto_102924 ?auto_102919 ) ( ON ?auto_102923 ?auto_102924 ) ( ON ?auto_102922 ?auto_102923 ) ( CLEAR ?auto_102922 ) ( HOLDING ?auto_102925 ) ( CLEAR ?auto_102921 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_102921 ?auto_102925 )
      ( MAKE-2PILE ?auto_102918 ?auto_102919 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102926 - BLOCK
      ?auto_102927 - BLOCK
    )
    :vars
    (
      ?auto_102929 - BLOCK
      ?auto_102932 - BLOCK
      ?auto_102928 - BLOCK
      ?auto_102931 - BLOCK
      ?auto_102930 - BLOCK
      ?auto_102933 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102926 ?auto_102927 ) ) ( not ( = ?auto_102926 ?auto_102929 ) ) ( not ( = ?auto_102927 ?auto_102929 ) ) ( ON ?auto_102926 ?auto_102932 ) ( not ( = ?auto_102926 ?auto_102932 ) ) ( not ( = ?auto_102927 ?auto_102932 ) ) ( not ( = ?auto_102929 ?auto_102932 ) ) ( ON-TABLE ?auto_102928 ) ( not ( = ?auto_102928 ?auto_102931 ) ) ( not ( = ?auto_102928 ?auto_102930 ) ) ( not ( = ?auto_102928 ?auto_102933 ) ) ( not ( = ?auto_102928 ?auto_102929 ) ) ( not ( = ?auto_102928 ?auto_102927 ) ) ( not ( = ?auto_102931 ?auto_102930 ) ) ( not ( = ?auto_102931 ?auto_102933 ) ) ( not ( = ?auto_102931 ?auto_102929 ) ) ( not ( = ?auto_102931 ?auto_102927 ) ) ( not ( = ?auto_102930 ?auto_102933 ) ) ( not ( = ?auto_102930 ?auto_102929 ) ) ( not ( = ?auto_102930 ?auto_102927 ) ) ( not ( = ?auto_102933 ?auto_102929 ) ) ( not ( = ?auto_102933 ?auto_102927 ) ) ( not ( = ?auto_102926 ?auto_102928 ) ) ( not ( = ?auto_102926 ?auto_102931 ) ) ( not ( = ?auto_102926 ?auto_102930 ) ) ( not ( = ?auto_102926 ?auto_102933 ) ) ( not ( = ?auto_102932 ?auto_102928 ) ) ( not ( = ?auto_102932 ?auto_102931 ) ) ( not ( = ?auto_102932 ?auto_102930 ) ) ( not ( = ?auto_102932 ?auto_102933 ) ) ( ON ?auto_102927 ?auto_102926 ) ( ON-TABLE ?auto_102932 ) ( ON ?auto_102929 ?auto_102927 ) ( ON ?auto_102933 ?auto_102929 ) ( ON ?auto_102930 ?auto_102933 ) ( CLEAR ?auto_102928 ) ( ON ?auto_102931 ?auto_102930 ) ( CLEAR ?auto_102931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_102932 ?auto_102926 ?auto_102927 ?auto_102929 ?auto_102933 ?auto_102930 )
      ( MAKE-2PILE ?auto_102926 ?auto_102927 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102934 - BLOCK
      ?auto_102935 - BLOCK
    )
    :vars
    (
      ?auto_102936 - BLOCK
      ?auto_102939 - BLOCK
      ?auto_102938 - BLOCK
      ?auto_102940 - BLOCK
      ?auto_102941 - BLOCK
      ?auto_102937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102934 ?auto_102935 ) ) ( not ( = ?auto_102934 ?auto_102936 ) ) ( not ( = ?auto_102935 ?auto_102936 ) ) ( ON ?auto_102934 ?auto_102939 ) ( not ( = ?auto_102934 ?auto_102939 ) ) ( not ( = ?auto_102935 ?auto_102939 ) ) ( not ( = ?auto_102936 ?auto_102939 ) ) ( not ( = ?auto_102938 ?auto_102940 ) ) ( not ( = ?auto_102938 ?auto_102941 ) ) ( not ( = ?auto_102938 ?auto_102937 ) ) ( not ( = ?auto_102938 ?auto_102936 ) ) ( not ( = ?auto_102938 ?auto_102935 ) ) ( not ( = ?auto_102940 ?auto_102941 ) ) ( not ( = ?auto_102940 ?auto_102937 ) ) ( not ( = ?auto_102940 ?auto_102936 ) ) ( not ( = ?auto_102940 ?auto_102935 ) ) ( not ( = ?auto_102941 ?auto_102937 ) ) ( not ( = ?auto_102941 ?auto_102936 ) ) ( not ( = ?auto_102941 ?auto_102935 ) ) ( not ( = ?auto_102937 ?auto_102936 ) ) ( not ( = ?auto_102937 ?auto_102935 ) ) ( not ( = ?auto_102934 ?auto_102938 ) ) ( not ( = ?auto_102934 ?auto_102940 ) ) ( not ( = ?auto_102934 ?auto_102941 ) ) ( not ( = ?auto_102934 ?auto_102937 ) ) ( not ( = ?auto_102939 ?auto_102938 ) ) ( not ( = ?auto_102939 ?auto_102940 ) ) ( not ( = ?auto_102939 ?auto_102941 ) ) ( not ( = ?auto_102939 ?auto_102937 ) ) ( ON ?auto_102935 ?auto_102934 ) ( ON-TABLE ?auto_102939 ) ( ON ?auto_102936 ?auto_102935 ) ( ON ?auto_102937 ?auto_102936 ) ( ON ?auto_102941 ?auto_102937 ) ( ON ?auto_102940 ?auto_102941 ) ( CLEAR ?auto_102940 ) ( HOLDING ?auto_102938 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102938 )
      ( MAKE-2PILE ?auto_102934 ?auto_102935 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_102942 - BLOCK
      ?auto_102943 - BLOCK
    )
    :vars
    (
      ?auto_102945 - BLOCK
      ?auto_102949 - BLOCK
      ?auto_102948 - BLOCK
      ?auto_102947 - BLOCK
      ?auto_102944 - BLOCK
      ?auto_102946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_102942 ?auto_102943 ) ) ( not ( = ?auto_102942 ?auto_102945 ) ) ( not ( = ?auto_102943 ?auto_102945 ) ) ( ON ?auto_102942 ?auto_102949 ) ( not ( = ?auto_102942 ?auto_102949 ) ) ( not ( = ?auto_102943 ?auto_102949 ) ) ( not ( = ?auto_102945 ?auto_102949 ) ) ( not ( = ?auto_102948 ?auto_102947 ) ) ( not ( = ?auto_102948 ?auto_102944 ) ) ( not ( = ?auto_102948 ?auto_102946 ) ) ( not ( = ?auto_102948 ?auto_102945 ) ) ( not ( = ?auto_102948 ?auto_102943 ) ) ( not ( = ?auto_102947 ?auto_102944 ) ) ( not ( = ?auto_102947 ?auto_102946 ) ) ( not ( = ?auto_102947 ?auto_102945 ) ) ( not ( = ?auto_102947 ?auto_102943 ) ) ( not ( = ?auto_102944 ?auto_102946 ) ) ( not ( = ?auto_102944 ?auto_102945 ) ) ( not ( = ?auto_102944 ?auto_102943 ) ) ( not ( = ?auto_102946 ?auto_102945 ) ) ( not ( = ?auto_102946 ?auto_102943 ) ) ( not ( = ?auto_102942 ?auto_102948 ) ) ( not ( = ?auto_102942 ?auto_102947 ) ) ( not ( = ?auto_102942 ?auto_102944 ) ) ( not ( = ?auto_102942 ?auto_102946 ) ) ( not ( = ?auto_102949 ?auto_102948 ) ) ( not ( = ?auto_102949 ?auto_102947 ) ) ( not ( = ?auto_102949 ?auto_102944 ) ) ( not ( = ?auto_102949 ?auto_102946 ) ) ( ON ?auto_102943 ?auto_102942 ) ( ON-TABLE ?auto_102949 ) ( ON ?auto_102945 ?auto_102943 ) ( ON ?auto_102946 ?auto_102945 ) ( ON ?auto_102944 ?auto_102946 ) ( ON ?auto_102947 ?auto_102944 ) ( ON ?auto_102948 ?auto_102947 ) ( CLEAR ?auto_102948 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_102949 ?auto_102942 ?auto_102943 ?auto_102945 ?auto_102946 ?auto_102944 ?auto_102947 )
      ( MAKE-2PILE ?auto_102942 ?auto_102943 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_102973 - BLOCK
      ?auto_102974 - BLOCK
      ?auto_102975 - BLOCK
      ?auto_102976 - BLOCK
    )
    :vars
    (
      ?auto_102978 - BLOCK
      ?auto_102977 - BLOCK
      ?auto_102979 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_102978 ?auto_102976 ) ( ON-TABLE ?auto_102973 ) ( ON ?auto_102974 ?auto_102973 ) ( ON ?auto_102975 ?auto_102974 ) ( ON ?auto_102976 ?auto_102975 ) ( not ( = ?auto_102973 ?auto_102974 ) ) ( not ( = ?auto_102973 ?auto_102975 ) ) ( not ( = ?auto_102973 ?auto_102976 ) ) ( not ( = ?auto_102973 ?auto_102978 ) ) ( not ( = ?auto_102974 ?auto_102975 ) ) ( not ( = ?auto_102974 ?auto_102976 ) ) ( not ( = ?auto_102974 ?auto_102978 ) ) ( not ( = ?auto_102975 ?auto_102976 ) ) ( not ( = ?auto_102975 ?auto_102978 ) ) ( not ( = ?auto_102976 ?auto_102978 ) ) ( not ( = ?auto_102973 ?auto_102977 ) ) ( not ( = ?auto_102973 ?auto_102979 ) ) ( not ( = ?auto_102974 ?auto_102977 ) ) ( not ( = ?auto_102974 ?auto_102979 ) ) ( not ( = ?auto_102975 ?auto_102977 ) ) ( not ( = ?auto_102975 ?auto_102979 ) ) ( not ( = ?auto_102976 ?auto_102977 ) ) ( not ( = ?auto_102976 ?auto_102979 ) ) ( not ( = ?auto_102978 ?auto_102977 ) ) ( not ( = ?auto_102978 ?auto_102979 ) ) ( not ( = ?auto_102977 ?auto_102979 ) ) ( ON ?auto_102977 ?auto_102978 ) ( CLEAR ?auto_102977 ) ( HOLDING ?auto_102979 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_102979 )
      ( MAKE-4PILE ?auto_102973 ?auto_102974 ?auto_102975 ?auto_102976 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103060 - BLOCK
      ?auto_103061 - BLOCK
      ?auto_103062 - BLOCK
    )
    :vars
    (
      ?auto_103063 - BLOCK
      ?auto_103066 - BLOCK
      ?auto_103065 - BLOCK
      ?auto_103064 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103060 ) ( not ( = ?auto_103060 ?auto_103061 ) ) ( not ( = ?auto_103060 ?auto_103062 ) ) ( not ( = ?auto_103061 ?auto_103062 ) ) ( ON ?auto_103062 ?auto_103063 ) ( not ( = ?auto_103060 ?auto_103063 ) ) ( not ( = ?auto_103061 ?auto_103063 ) ) ( not ( = ?auto_103062 ?auto_103063 ) ) ( CLEAR ?auto_103060 ) ( ON ?auto_103061 ?auto_103062 ) ( CLEAR ?auto_103061 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103066 ) ( ON ?auto_103065 ?auto_103066 ) ( ON ?auto_103064 ?auto_103065 ) ( ON ?auto_103063 ?auto_103064 ) ( not ( = ?auto_103066 ?auto_103065 ) ) ( not ( = ?auto_103066 ?auto_103064 ) ) ( not ( = ?auto_103066 ?auto_103063 ) ) ( not ( = ?auto_103066 ?auto_103062 ) ) ( not ( = ?auto_103066 ?auto_103061 ) ) ( not ( = ?auto_103065 ?auto_103064 ) ) ( not ( = ?auto_103065 ?auto_103063 ) ) ( not ( = ?auto_103065 ?auto_103062 ) ) ( not ( = ?auto_103065 ?auto_103061 ) ) ( not ( = ?auto_103064 ?auto_103063 ) ) ( not ( = ?auto_103064 ?auto_103062 ) ) ( not ( = ?auto_103064 ?auto_103061 ) ) ( not ( = ?auto_103060 ?auto_103066 ) ) ( not ( = ?auto_103060 ?auto_103065 ) ) ( not ( = ?auto_103060 ?auto_103064 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103066 ?auto_103065 ?auto_103064 ?auto_103063 ?auto_103062 )
      ( MAKE-3PILE ?auto_103060 ?auto_103061 ?auto_103062 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103067 - BLOCK
      ?auto_103068 - BLOCK
      ?auto_103069 - BLOCK
    )
    :vars
    (
      ?auto_103073 - BLOCK
      ?auto_103071 - BLOCK
      ?auto_103072 - BLOCK
      ?auto_103070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103067 ?auto_103068 ) ) ( not ( = ?auto_103067 ?auto_103069 ) ) ( not ( = ?auto_103068 ?auto_103069 ) ) ( ON ?auto_103069 ?auto_103073 ) ( not ( = ?auto_103067 ?auto_103073 ) ) ( not ( = ?auto_103068 ?auto_103073 ) ) ( not ( = ?auto_103069 ?auto_103073 ) ) ( ON ?auto_103068 ?auto_103069 ) ( CLEAR ?auto_103068 ) ( ON-TABLE ?auto_103071 ) ( ON ?auto_103072 ?auto_103071 ) ( ON ?auto_103070 ?auto_103072 ) ( ON ?auto_103073 ?auto_103070 ) ( not ( = ?auto_103071 ?auto_103072 ) ) ( not ( = ?auto_103071 ?auto_103070 ) ) ( not ( = ?auto_103071 ?auto_103073 ) ) ( not ( = ?auto_103071 ?auto_103069 ) ) ( not ( = ?auto_103071 ?auto_103068 ) ) ( not ( = ?auto_103072 ?auto_103070 ) ) ( not ( = ?auto_103072 ?auto_103073 ) ) ( not ( = ?auto_103072 ?auto_103069 ) ) ( not ( = ?auto_103072 ?auto_103068 ) ) ( not ( = ?auto_103070 ?auto_103073 ) ) ( not ( = ?auto_103070 ?auto_103069 ) ) ( not ( = ?auto_103070 ?auto_103068 ) ) ( not ( = ?auto_103067 ?auto_103071 ) ) ( not ( = ?auto_103067 ?auto_103072 ) ) ( not ( = ?auto_103067 ?auto_103070 ) ) ( HOLDING ?auto_103067 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103067 )
      ( MAKE-3PILE ?auto_103067 ?auto_103068 ?auto_103069 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103074 - BLOCK
      ?auto_103075 - BLOCK
      ?auto_103076 - BLOCK
    )
    :vars
    (
      ?auto_103080 - BLOCK
      ?auto_103079 - BLOCK
      ?auto_103078 - BLOCK
      ?auto_103077 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103074 ?auto_103075 ) ) ( not ( = ?auto_103074 ?auto_103076 ) ) ( not ( = ?auto_103075 ?auto_103076 ) ) ( ON ?auto_103076 ?auto_103080 ) ( not ( = ?auto_103074 ?auto_103080 ) ) ( not ( = ?auto_103075 ?auto_103080 ) ) ( not ( = ?auto_103076 ?auto_103080 ) ) ( ON ?auto_103075 ?auto_103076 ) ( ON-TABLE ?auto_103079 ) ( ON ?auto_103078 ?auto_103079 ) ( ON ?auto_103077 ?auto_103078 ) ( ON ?auto_103080 ?auto_103077 ) ( not ( = ?auto_103079 ?auto_103078 ) ) ( not ( = ?auto_103079 ?auto_103077 ) ) ( not ( = ?auto_103079 ?auto_103080 ) ) ( not ( = ?auto_103079 ?auto_103076 ) ) ( not ( = ?auto_103079 ?auto_103075 ) ) ( not ( = ?auto_103078 ?auto_103077 ) ) ( not ( = ?auto_103078 ?auto_103080 ) ) ( not ( = ?auto_103078 ?auto_103076 ) ) ( not ( = ?auto_103078 ?auto_103075 ) ) ( not ( = ?auto_103077 ?auto_103080 ) ) ( not ( = ?auto_103077 ?auto_103076 ) ) ( not ( = ?auto_103077 ?auto_103075 ) ) ( not ( = ?auto_103074 ?auto_103079 ) ) ( not ( = ?auto_103074 ?auto_103078 ) ) ( not ( = ?auto_103074 ?auto_103077 ) ) ( ON ?auto_103074 ?auto_103075 ) ( CLEAR ?auto_103074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103079 ?auto_103078 ?auto_103077 ?auto_103080 ?auto_103076 ?auto_103075 )
      ( MAKE-3PILE ?auto_103074 ?auto_103075 ?auto_103076 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103084 - BLOCK
      ?auto_103085 - BLOCK
      ?auto_103086 - BLOCK
    )
    :vars
    (
      ?auto_103089 - BLOCK
      ?auto_103090 - BLOCK
      ?auto_103088 - BLOCK
      ?auto_103087 - BLOCK
      ?auto_103091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103084 ?auto_103085 ) ) ( not ( = ?auto_103084 ?auto_103086 ) ) ( not ( = ?auto_103085 ?auto_103086 ) ) ( ON ?auto_103086 ?auto_103089 ) ( not ( = ?auto_103084 ?auto_103089 ) ) ( not ( = ?auto_103085 ?auto_103089 ) ) ( not ( = ?auto_103086 ?auto_103089 ) ) ( ON ?auto_103085 ?auto_103086 ) ( CLEAR ?auto_103085 ) ( ON-TABLE ?auto_103090 ) ( ON ?auto_103088 ?auto_103090 ) ( ON ?auto_103087 ?auto_103088 ) ( ON ?auto_103089 ?auto_103087 ) ( not ( = ?auto_103090 ?auto_103088 ) ) ( not ( = ?auto_103090 ?auto_103087 ) ) ( not ( = ?auto_103090 ?auto_103089 ) ) ( not ( = ?auto_103090 ?auto_103086 ) ) ( not ( = ?auto_103090 ?auto_103085 ) ) ( not ( = ?auto_103088 ?auto_103087 ) ) ( not ( = ?auto_103088 ?auto_103089 ) ) ( not ( = ?auto_103088 ?auto_103086 ) ) ( not ( = ?auto_103088 ?auto_103085 ) ) ( not ( = ?auto_103087 ?auto_103089 ) ) ( not ( = ?auto_103087 ?auto_103086 ) ) ( not ( = ?auto_103087 ?auto_103085 ) ) ( not ( = ?auto_103084 ?auto_103090 ) ) ( not ( = ?auto_103084 ?auto_103088 ) ) ( not ( = ?auto_103084 ?auto_103087 ) ) ( ON ?auto_103084 ?auto_103091 ) ( CLEAR ?auto_103084 ) ( HAND-EMPTY ) ( not ( = ?auto_103084 ?auto_103091 ) ) ( not ( = ?auto_103085 ?auto_103091 ) ) ( not ( = ?auto_103086 ?auto_103091 ) ) ( not ( = ?auto_103089 ?auto_103091 ) ) ( not ( = ?auto_103090 ?auto_103091 ) ) ( not ( = ?auto_103088 ?auto_103091 ) ) ( not ( = ?auto_103087 ?auto_103091 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103084 ?auto_103091 )
      ( MAKE-3PILE ?auto_103084 ?auto_103085 ?auto_103086 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103092 - BLOCK
      ?auto_103093 - BLOCK
      ?auto_103094 - BLOCK
    )
    :vars
    (
      ?auto_103098 - BLOCK
      ?auto_103097 - BLOCK
      ?auto_103099 - BLOCK
      ?auto_103096 - BLOCK
      ?auto_103095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103092 ?auto_103093 ) ) ( not ( = ?auto_103092 ?auto_103094 ) ) ( not ( = ?auto_103093 ?auto_103094 ) ) ( ON ?auto_103094 ?auto_103098 ) ( not ( = ?auto_103092 ?auto_103098 ) ) ( not ( = ?auto_103093 ?auto_103098 ) ) ( not ( = ?auto_103094 ?auto_103098 ) ) ( ON-TABLE ?auto_103097 ) ( ON ?auto_103099 ?auto_103097 ) ( ON ?auto_103096 ?auto_103099 ) ( ON ?auto_103098 ?auto_103096 ) ( not ( = ?auto_103097 ?auto_103099 ) ) ( not ( = ?auto_103097 ?auto_103096 ) ) ( not ( = ?auto_103097 ?auto_103098 ) ) ( not ( = ?auto_103097 ?auto_103094 ) ) ( not ( = ?auto_103097 ?auto_103093 ) ) ( not ( = ?auto_103099 ?auto_103096 ) ) ( not ( = ?auto_103099 ?auto_103098 ) ) ( not ( = ?auto_103099 ?auto_103094 ) ) ( not ( = ?auto_103099 ?auto_103093 ) ) ( not ( = ?auto_103096 ?auto_103098 ) ) ( not ( = ?auto_103096 ?auto_103094 ) ) ( not ( = ?auto_103096 ?auto_103093 ) ) ( not ( = ?auto_103092 ?auto_103097 ) ) ( not ( = ?auto_103092 ?auto_103099 ) ) ( not ( = ?auto_103092 ?auto_103096 ) ) ( ON ?auto_103092 ?auto_103095 ) ( CLEAR ?auto_103092 ) ( not ( = ?auto_103092 ?auto_103095 ) ) ( not ( = ?auto_103093 ?auto_103095 ) ) ( not ( = ?auto_103094 ?auto_103095 ) ) ( not ( = ?auto_103098 ?auto_103095 ) ) ( not ( = ?auto_103097 ?auto_103095 ) ) ( not ( = ?auto_103099 ?auto_103095 ) ) ( not ( = ?auto_103096 ?auto_103095 ) ) ( HOLDING ?auto_103093 ) ( CLEAR ?auto_103094 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103097 ?auto_103099 ?auto_103096 ?auto_103098 ?auto_103094 ?auto_103093 )
      ( MAKE-3PILE ?auto_103092 ?auto_103093 ?auto_103094 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103100 - BLOCK
      ?auto_103101 - BLOCK
      ?auto_103102 - BLOCK
    )
    :vars
    (
      ?auto_103107 - BLOCK
      ?auto_103105 - BLOCK
      ?auto_103103 - BLOCK
      ?auto_103104 - BLOCK
      ?auto_103106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103100 ?auto_103101 ) ) ( not ( = ?auto_103100 ?auto_103102 ) ) ( not ( = ?auto_103101 ?auto_103102 ) ) ( ON ?auto_103102 ?auto_103107 ) ( not ( = ?auto_103100 ?auto_103107 ) ) ( not ( = ?auto_103101 ?auto_103107 ) ) ( not ( = ?auto_103102 ?auto_103107 ) ) ( ON-TABLE ?auto_103105 ) ( ON ?auto_103103 ?auto_103105 ) ( ON ?auto_103104 ?auto_103103 ) ( ON ?auto_103107 ?auto_103104 ) ( not ( = ?auto_103105 ?auto_103103 ) ) ( not ( = ?auto_103105 ?auto_103104 ) ) ( not ( = ?auto_103105 ?auto_103107 ) ) ( not ( = ?auto_103105 ?auto_103102 ) ) ( not ( = ?auto_103105 ?auto_103101 ) ) ( not ( = ?auto_103103 ?auto_103104 ) ) ( not ( = ?auto_103103 ?auto_103107 ) ) ( not ( = ?auto_103103 ?auto_103102 ) ) ( not ( = ?auto_103103 ?auto_103101 ) ) ( not ( = ?auto_103104 ?auto_103107 ) ) ( not ( = ?auto_103104 ?auto_103102 ) ) ( not ( = ?auto_103104 ?auto_103101 ) ) ( not ( = ?auto_103100 ?auto_103105 ) ) ( not ( = ?auto_103100 ?auto_103103 ) ) ( not ( = ?auto_103100 ?auto_103104 ) ) ( ON ?auto_103100 ?auto_103106 ) ( not ( = ?auto_103100 ?auto_103106 ) ) ( not ( = ?auto_103101 ?auto_103106 ) ) ( not ( = ?auto_103102 ?auto_103106 ) ) ( not ( = ?auto_103107 ?auto_103106 ) ) ( not ( = ?auto_103105 ?auto_103106 ) ) ( not ( = ?auto_103103 ?auto_103106 ) ) ( not ( = ?auto_103104 ?auto_103106 ) ) ( CLEAR ?auto_103102 ) ( ON ?auto_103101 ?auto_103100 ) ( CLEAR ?auto_103101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103106 ?auto_103100 )
      ( MAKE-3PILE ?auto_103100 ?auto_103101 ?auto_103102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103108 - BLOCK
      ?auto_103109 - BLOCK
      ?auto_103110 - BLOCK
    )
    :vars
    (
      ?auto_103114 - BLOCK
      ?auto_103115 - BLOCK
      ?auto_103111 - BLOCK
      ?auto_103112 - BLOCK
      ?auto_103113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103108 ?auto_103109 ) ) ( not ( = ?auto_103108 ?auto_103110 ) ) ( not ( = ?auto_103109 ?auto_103110 ) ) ( not ( = ?auto_103108 ?auto_103114 ) ) ( not ( = ?auto_103109 ?auto_103114 ) ) ( not ( = ?auto_103110 ?auto_103114 ) ) ( ON-TABLE ?auto_103115 ) ( ON ?auto_103111 ?auto_103115 ) ( ON ?auto_103112 ?auto_103111 ) ( ON ?auto_103114 ?auto_103112 ) ( not ( = ?auto_103115 ?auto_103111 ) ) ( not ( = ?auto_103115 ?auto_103112 ) ) ( not ( = ?auto_103115 ?auto_103114 ) ) ( not ( = ?auto_103115 ?auto_103110 ) ) ( not ( = ?auto_103115 ?auto_103109 ) ) ( not ( = ?auto_103111 ?auto_103112 ) ) ( not ( = ?auto_103111 ?auto_103114 ) ) ( not ( = ?auto_103111 ?auto_103110 ) ) ( not ( = ?auto_103111 ?auto_103109 ) ) ( not ( = ?auto_103112 ?auto_103114 ) ) ( not ( = ?auto_103112 ?auto_103110 ) ) ( not ( = ?auto_103112 ?auto_103109 ) ) ( not ( = ?auto_103108 ?auto_103115 ) ) ( not ( = ?auto_103108 ?auto_103111 ) ) ( not ( = ?auto_103108 ?auto_103112 ) ) ( ON ?auto_103108 ?auto_103113 ) ( not ( = ?auto_103108 ?auto_103113 ) ) ( not ( = ?auto_103109 ?auto_103113 ) ) ( not ( = ?auto_103110 ?auto_103113 ) ) ( not ( = ?auto_103114 ?auto_103113 ) ) ( not ( = ?auto_103115 ?auto_103113 ) ) ( not ( = ?auto_103111 ?auto_103113 ) ) ( not ( = ?auto_103112 ?auto_103113 ) ) ( ON ?auto_103109 ?auto_103108 ) ( CLEAR ?auto_103109 ) ( ON-TABLE ?auto_103113 ) ( HOLDING ?auto_103110 ) ( CLEAR ?auto_103114 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103115 ?auto_103111 ?auto_103112 ?auto_103114 ?auto_103110 )
      ( MAKE-3PILE ?auto_103108 ?auto_103109 ?auto_103110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103116 - BLOCK
      ?auto_103117 - BLOCK
      ?auto_103118 - BLOCK
    )
    :vars
    (
      ?auto_103119 - BLOCK
      ?auto_103122 - BLOCK
      ?auto_103121 - BLOCK
      ?auto_103123 - BLOCK
      ?auto_103120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103116 ?auto_103117 ) ) ( not ( = ?auto_103116 ?auto_103118 ) ) ( not ( = ?auto_103117 ?auto_103118 ) ) ( not ( = ?auto_103116 ?auto_103119 ) ) ( not ( = ?auto_103117 ?auto_103119 ) ) ( not ( = ?auto_103118 ?auto_103119 ) ) ( ON-TABLE ?auto_103122 ) ( ON ?auto_103121 ?auto_103122 ) ( ON ?auto_103123 ?auto_103121 ) ( ON ?auto_103119 ?auto_103123 ) ( not ( = ?auto_103122 ?auto_103121 ) ) ( not ( = ?auto_103122 ?auto_103123 ) ) ( not ( = ?auto_103122 ?auto_103119 ) ) ( not ( = ?auto_103122 ?auto_103118 ) ) ( not ( = ?auto_103122 ?auto_103117 ) ) ( not ( = ?auto_103121 ?auto_103123 ) ) ( not ( = ?auto_103121 ?auto_103119 ) ) ( not ( = ?auto_103121 ?auto_103118 ) ) ( not ( = ?auto_103121 ?auto_103117 ) ) ( not ( = ?auto_103123 ?auto_103119 ) ) ( not ( = ?auto_103123 ?auto_103118 ) ) ( not ( = ?auto_103123 ?auto_103117 ) ) ( not ( = ?auto_103116 ?auto_103122 ) ) ( not ( = ?auto_103116 ?auto_103121 ) ) ( not ( = ?auto_103116 ?auto_103123 ) ) ( ON ?auto_103116 ?auto_103120 ) ( not ( = ?auto_103116 ?auto_103120 ) ) ( not ( = ?auto_103117 ?auto_103120 ) ) ( not ( = ?auto_103118 ?auto_103120 ) ) ( not ( = ?auto_103119 ?auto_103120 ) ) ( not ( = ?auto_103122 ?auto_103120 ) ) ( not ( = ?auto_103121 ?auto_103120 ) ) ( not ( = ?auto_103123 ?auto_103120 ) ) ( ON ?auto_103117 ?auto_103116 ) ( ON-TABLE ?auto_103120 ) ( CLEAR ?auto_103119 ) ( ON ?auto_103118 ?auto_103117 ) ( CLEAR ?auto_103118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103120 ?auto_103116 ?auto_103117 )
      ( MAKE-3PILE ?auto_103116 ?auto_103117 ?auto_103118 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103124 - BLOCK
      ?auto_103125 - BLOCK
      ?auto_103126 - BLOCK
    )
    :vars
    (
      ?auto_103130 - BLOCK
      ?auto_103127 - BLOCK
      ?auto_103128 - BLOCK
      ?auto_103129 - BLOCK
      ?auto_103131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103124 ?auto_103125 ) ) ( not ( = ?auto_103124 ?auto_103126 ) ) ( not ( = ?auto_103125 ?auto_103126 ) ) ( not ( = ?auto_103124 ?auto_103130 ) ) ( not ( = ?auto_103125 ?auto_103130 ) ) ( not ( = ?auto_103126 ?auto_103130 ) ) ( ON-TABLE ?auto_103127 ) ( ON ?auto_103128 ?auto_103127 ) ( ON ?auto_103129 ?auto_103128 ) ( not ( = ?auto_103127 ?auto_103128 ) ) ( not ( = ?auto_103127 ?auto_103129 ) ) ( not ( = ?auto_103127 ?auto_103130 ) ) ( not ( = ?auto_103127 ?auto_103126 ) ) ( not ( = ?auto_103127 ?auto_103125 ) ) ( not ( = ?auto_103128 ?auto_103129 ) ) ( not ( = ?auto_103128 ?auto_103130 ) ) ( not ( = ?auto_103128 ?auto_103126 ) ) ( not ( = ?auto_103128 ?auto_103125 ) ) ( not ( = ?auto_103129 ?auto_103130 ) ) ( not ( = ?auto_103129 ?auto_103126 ) ) ( not ( = ?auto_103129 ?auto_103125 ) ) ( not ( = ?auto_103124 ?auto_103127 ) ) ( not ( = ?auto_103124 ?auto_103128 ) ) ( not ( = ?auto_103124 ?auto_103129 ) ) ( ON ?auto_103124 ?auto_103131 ) ( not ( = ?auto_103124 ?auto_103131 ) ) ( not ( = ?auto_103125 ?auto_103131 ) ) ( not ( = ?auto_103126 ?auto_103131 ) ) ( not ( = ?auto_103130 ?auto_103131 ) ) ( not ( = ?auto_103127 ?auto_103131 ) ) ( not ( = ?auto_103128 ?auto_103131 ) ) ( not ( = ?auto_103129 ?auto_103131 ) ) ( ON ?auto_103125 ?auto_103124 ) ( ON-TABLE ?auto_103131 ) ( ON ?auto_103126 ?auto_103125 ) ( CLEAR ?auto_103126 ) ( HOLDING ?auto_103130 ) ( CLEAR ?auto_103129 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103127 ?auto_103128 ?auto_103129 ?auto_103130 )
      ( MAKE-3PILE ?auto_103124 ?auto_103125 ?auto_103126 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103132 - BLOCK
      ?auto_103133 - BLOCK
      ?auto_103134 - BLOCK
    )
    :vars
    (
      ?auto_103136 - BLOCK
      ?auto_103139 - BLOCK
      ?auto_103138 - BLOCK
      ?auto_103135 - BLOCK
      ?auto_103137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103132 ?auto_103133 ) ) ( not ( = ?auto_103132 ?auto_103134 ) ) ( not ( = ?auto_103133 ?auto_103134 ) ) ( not ( = ?auto_103132 ?auto_103136 ) ) ( not ( = ?auto_103133 ?auto_103136 ) ) ( not ( = ?auto_103134 ?auto_103136 ) ) ( ON-TABLE ?auto_103139 ) ( ON ?auto_103138 ?auto_103139 ) ( ON ?auto_103135 ?auto_103138 ) ( not ( = ?auto_103139 ?auto_103138 ) ) ( not ( = ?auto_103139 ?auto_103135 ) ) ( not ( = ?auto_103139 ?auto_103136 ) ) ( not ( = ?auto_103139 ?auto_103134 ) ) ( not ( = ?auto_103139 ?auto_103133 ) ) ( not ( = ?auto_103138 ?auto_103135 ) ) ( not ( = ?auto_103138 ?auto_103136 ) ) ( not ( = ?auto_103138 ?auto_103134 ) ) ( not ( = ?auto_103138 ?auto_103133 ) ) ( not ( = ?auto_103135 ?auto_103136 ) ) ( not ( = ?auto_103135 ?auto_103134 ) ) ( not ( = ?auto_103135 ?auto_103133 ) ) ( not ( = ?auto_103132 ?auto_103139 ) ) ( not ( = ?auto_103132 ?auto_103138 ) ) ( not ( = ?auto_103132 ?auto_103135 ) ) ( ON ?auto_103132 ?auto_103137 ) ( not ( = ?auto_103132 ?auto_103137 ) ) ( not ( = ?auto_103133 ?auto_103137 ) ) ( not ( = ?auto_103134 ?auto_103137 ) ) ( not ( = ?auto_103136 ?auto_103137 ) ) ( not ( = ?auto_103139 ?auto_103137 ) ) ( not ( = ?auto_103138 ?auto_103137 ) ) ( not ( = ?auto_103135 ?auto_103137 ) ) ( ON ?auto_103133 ?auto_103132 ) ( ON-TABLE ?auto_103137 ) ( ON ?auto_103134 ?auto_103133 ) ( CLEAR ?auto_103135 ) ( ON ?auto_103136 ?auto_103134 ) ( CLEAR ?auto_103136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103137 ?auto_103132 ?auto_103133 ?auto_103134 )
      ( MAKE-3PILE ?auto_103132 ?auto_103133 ?auto_103134 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103140 - BLOCK
      ?auto_103141 - BLOCK
      ?auto_103142 - BLOCK
    )
    :vars
    (
      ?auto_103143 - BLOCK
      ?auto_103144 - BLOCK
      ?auto_103146 - BLOCK
      ?auto_103145 - BLOCK
      ?auto_103147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103140 ?auto_103141 ) ) ( not ( = ?auto_103140 ?auto_103142 ) ) ( not ( = ?auto_103141 ?auto_103142 ) ) ( not ( = ?auto_103140 ?auto_103143 ) ) ( not ( = ?auto_103141 ?auto_103143 ) ) ( not ( = ?auto_103142 ?auto_103143 ) ) ( ON-TABLE ?auto_103144 ) ( ON ?auto_103146 ?auto_103144 ) ( not ( = ?auto_103144 ?auto_103146 ) ) ( not ( = ?auto_103144 ?auto_103145 ) ) ( not ( = ?auto_103144 ?auto_103143 ) ) ( not ( = ?auto_103144 ?auto_103142 ) ) ( not ( = ?auto_103144 ?auto_103141 ) ) ( not ( = ?auto_103146 ?auto_103145 ) ) ( not ( = ?auto_103146 ?auto_103143 ) ) ( not ( = ?auto_103146 ?auto_103142 ) ) ( not ( = ?auto_103146 ?auto_103141 ) ) ( not ( = ?auto_103145 ?auto_103143 ) ) ( not ( = ?auto_103145 ?auto_103142 ) ) ( not ( = ?auto_103145 ?auto_103141 ) ) ( not ( = ?auto_103140 ?auto_103144 ) ) ( not ( = ?auto_103140 ?auto_103146 ) ) ( not ( = ?auto_103140 ?auto_103145 ) ) ( ON ?auto_103140 ?auto_103147 ) ( not ( = ?auto_103140 ?auto_103147 ) ) ( not ( = ?auto_103141 ?auto_103147 ) ) ( not ( = ?auto_103142 ?auto_103147 ) ) ( not ( = ?auto_103143 ?auto_103147 ) ) ( not ( = ?auto_103144 ?auto_103147 ) ) ( not ( = ?auto_103146 ?auto_103147 ) ) ( not ( = ?auto_103145 ?auto_103147 ) ) ( ON ?auto_103141 ?auto_103140 ) ( ON-TABLE ?auto_103147 ) ( ON ?auto_103142 ?auto_103141 ) ( ON ?auto_103143 ?auto_103142 ) ( CLEAR ?auto_103143 ) ( HOLDING ?auto_103145 ) ( CLEAR ?auto_103146 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103144 ?auto_103146 ?auto_103145 )
      ( MAKE-3PILE ?auto_103140 ?auto_103141 ?auto_103142 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103148 - BLOCK
      ?auto_103149 - BLOCK
      ?auto_103150 - BLOCK
    )
    :vars
    (
      ?auto_103153 - BLOCK
      ?auto_103154 - BLOCK
      ?auto_103152 - BLOCK
      ?auto_103151 - BLOCK
      ?auto_103155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103148 ?auto_103149 ) ) ( not ( = ?auto_103148 ?auto_103150 ) ) ( not ( = ?auto_103149 ?auto_103150 ) ) ( not ( = ?auto_103148 ?auto_103153 ) ) ( not ( = ?auto_103149 ?auto_103153 ) ) ( not ( = ?auto_103150 ?auto_103153 ) ) ( ON-TABLE ?auto_103154 ) ( ON ?auto_103152 ?auto_103154 ) ( not ( = ?auto_103154 ?auto_103152 ) ) ( not ( = ?auto_103154 ?auto_103151 ) ) ( not ( = ?auto_103154 ?auto_103153 ) ) ( not ( = ?auto_103154 ?auto_103150 ) ) ( not ( = ?auto_103154 ?auto_103149 ) ) ( not ( = ?auto_103152 ?auto_103151 ) ) ( not ( = ?auto_103152 ?auto_103153 ) ) ( not ( = ?auto_103152 ?auto_103150 ) ) ( not ( = ?auto_103152 ?auto_103149 ) ) ( not ( = ?auto_103151 ?auto_103153 ) ) ( not ( = ?auto_103151 ?auto_103150 ) ) ( not ( = ?auto_103151 ?auto_103149 ) ) ( not ( = ?auto_103148 ?auto_103154 ) ) ( not ( = ?auto_103148 ?auto_103152 ) ) ( not ( = ?auto_103148 ?auto_103151 ) ) ( ON ?auto_103148 ?auto_103155 ) ( not ( = ?auto_103148 ?auto_103155 ) ) ( not ( = ?auto_103149 ?auto_103155 ) ) ( not ( = ?auto_103150 ?auto_103155 ) ) ( not ( = ?auto_103153 ?auto_103155 ) ) ( not ( = ?auto_103154 ?auto_103155 ) ) ( not ( = ?auto_103152 ?auto_103155 ) ) ( not ( = ?auto_103151 ?auto_103155 ) ) ( ON ?auto_103149 ?auto_103148 ) ( ON-TABLE ?auto_103155 ) ( ON ?auto_103150 ?auto_103149 ) ( ON ?auto_103153 ?auto_103150 ) ( CLEAR ?auto_103152 ) ( ON ?auto_103151 ?auto_103153 ) ( CLEAR ?auto_103151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103155 ?auto_103148 ?auto_103149 ?auto_103150 ?auto_103153 )
      ( MAKE-3PILE ?auto_103148 ?auto_103149 ?auto_103150 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103156 - BLOCK
      ?auto_103157 - BLOCK
      ?auto_103158 - BLOCK
    )
    :vars
    (
      ?auto_103159 - BLOCK
      ?auto_103161 - BLOCK
      ?auto_103163 - BLOCK
      ?auto_103160 - BLOCK
      ?auto_103162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103156 ?auto_103157 ) ) ( not ( = ?auto_103156 ?auto_103158 ) ) ( not ( = ?auto_103157 ?auto_103158 ) ) ( not ( = ?auto_103156 ?auto_103159 ) ) ( not ( = ?auto_103157 ?auto_103159 ) ) ( not ( = ?auto_103158 ?auto_103159 ) ) ( ON-TABLE ?auto_103161 ) ( not ( = ?auto_103161 ?auto_103163 ) ) ( not ( = ?auto_103161 ?auto_103160 ) ) ( not ( = ?auto_103161 ?auto_103159 ) ) ( not ( = ?auto_103161 ?auto_103158 ) ) ( not ( = ?auto_103161 ?auto_103157 ) ) ( not ( = ?auto_103163 ?auto_103160 ) ) ( not ( = ?auto_103163 ?auto_103159 ) ) ( not ( = ?auto_103163 ?auto_103158 ) ) ( not ( = ?auto_103163 ?auto_103157 ) ) ( not ( = ?auto_103160 ?auto_103159 ) ) ( not ( = ?auto_103160 ?auto_103158 ) ) ( not ( = ?auto_103160 ?auto_103157 ) ) ( not ( = ?auto_103156 ?auto_103161 ) ) ( not ( = ?auto_103156 ?auto_103163 ) ) ( not ( = ?auto_103156 ?auto_103160 ) ) ( ON ?auto_103156 ?auto_103162 ) ( not ( = ?auto_103156 ?auto_103162 ) ) ( not ( = ?auto_103157 ?auto_103162 ) ) ( not ( = ?auto_103158 ?auto_103162 ) ) ( not ( = ?auto_103159 ?auto_103162 ) ) ( not ( = ?auto_103161 ?auto_103162 ) ) ( not ( = ?auto_103163 ?auto_103162 ) ) ( not ( = ?auto_103160 ?auto_103162 ) ) ( ON ?auto_103157 ?auto_103156 ) ( ON-TABLE ?auto_103162 ) ( ON ?auto_103158 ?auto_103157 ) ( ON ?auto_103159 ?auto_103158 ) ( ON ?auto_103160 ?auto_103159 ) ( CLEAR ?auto_103160 ) ( HOLDING ?auto_103163 ) ( CLEAR ?auto_103161 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103161 ?auto_103163 )
      ( MAKE-3PILE ?auto_103156 ?auto_103157 ?auto_103158 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103164 - BLOCK
      ?auto_103165 - BLOCK
      ?auto_103166 - BLOCK
    )
    :vars
    (
      ?auto_103169 - BLOCK
      ?auto_103171 - BLOCK
      ?auto_103170 - BLOCK
      ?auto_103168 - BLOCK
      ?auto_103167 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103164 ?auto_103165 ) ) ( not ( = ?auto_103164 ?auto_103166 ) ) ( not ( = ?auto_103165 ?auto_103166 ) ) ( not ( = ?auto_103164 ?auto_103169 ) ) ( not ( = ?auto_103165 ?auto_103169 ) ) ( not ( = ?auto_103166 ?auto_103169 ) ) ( ON-TABLE ?auto_103171 ) ( not ( = ?auto_103171 ?auto_103170 ) ) ( not ( = ?auto_103171 ?auto_103168 ) ) ( not ( = ?auto_103171 ?auto_103169 ) ) ( not ( = ?auto_103171 ?auto_103166 ) ) ( not ( = ?auto_103171 ?auto_103165 ) ) ( not ( = ?auto_103170 ?auto_103168 ) ) ( not ( = ?auto_103170 ?auto_103169 ) ) ( not ( = ?auto_103170 ?auto_103166 ) ) ( not ( = ?auto_103170 ?auto_103165 ) ) ( not ( = ?auto_103168 ?auto_103169 ) ) ( not ( = ?auto_103168 ?auto_103166 ) ) ( not ( = ?auto_103168 ?auto_103165 ) ) ( not ( = ?auto_103164 ?auto_103171 ) ) ( not ( = ?auto_103164 ?auto_103170 ) ) ( not ( = ?auto_103164 ?auto_103168 ) ) ( ON ?auto_103164 ?auto_103167 ) ( not ( = ?auto_103164 ?auto_103167 ) ) ( not ( = ?auto_103165 ?auto_103167 ) ) ( not ( = ?auto_103166 ?auto_103167 ) ) ( not ( = ?auto_103169 ?auto_103167 ) ) ( not ( = ?auto_103171 ?auto_103167 ) ) ( not ( = ?auto_103170 ?auto_103167 ) ) ( not ( = ?auto_103168 ?auto_103167 ) ) ( ON ?auto_103165 ?auto_103164 ) ( ON-TABLE ?auto_103167 ) ( ON ?auto_103166 ?auto_103165 ) ( ON ?auto_103169 ?auto_103166 ) ( ON ?auto_103168 ?auto_103169 ) ( CLEAR ?auto_103171 ) ( ON ?auto_103170 ?auto_103168 ) ( CLEAR ?auto_103170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103167 ?auto_103164 ?auto_103165 ?auto_103166 ?auto_103169 ?auto_103168 )
      ( MAKE-3PILE ?auto_103164 ?auto_103165 ?auto_103166 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103172 - BLOCK
      ?auto_103173 - BLOCK
      ?auto_103174 - BLOCK
    )
    :vars
    (
      ?auto_103179 - BLOCK
      ?auto_103177 - BLOCK
      ?auto_103178 - BLOCK
      ?auto_103175 - BLOCK
      ?auto_103176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103172 ?auto_103173 ) ) ( not ( = ?auto_103172 ?auto_103174 ) ) ( not ( = ?auto_103173 ?auto_103174 ) ) ( not ( = ?auto_103172 ?auto_103179 ) ) ( not ( = ?auto_103173 ?auto_103179 ) ) ( not ( = ?auto_103174 ?auto_103179 ) ) ( not ( = ?auto_103177 ?auto_103178 ) ) ( not ( = ?auto_103177 ?auto_103175 ) ) ( not ( = ?auto_103177 ?auto_103179 ) ) ( not ( = ?auto_103177 ?auto_103174 ) ) ( not ( = ?auto_103177 ?auto_103173 ) ) ( not ( = ?auto_103178 ?auto_103175 ) ) ( not ( = ?auto_103178 ?auto_103179 ) ) ( not ( = ?auto_103178 ?auto_103174 ) ) ( not ( = ?auto_103178 ?auto_103173 ) ) ( not ( = ?auto_103175 ?auto_103179 ) ) ( not ( = ?auto_103175 ?auto_103174 ) ) ( not ( = ?auto_103175 ?auto_103173 ) ) ( not ( = ?auto_103172 ?auto_103177 ) ) ( not ( = ?auto_103172 ?auto_103178 ) ) ( not ( = ?auto_103172 ?auto_103175 ) ) ( ON ?auto_103172 ?auto_103176 ) ( not ( = ?auto_103172 ?auto_103176 ) ) ( not ( = ?auto_103173 ?auto_103176 ) ) ( not ( = ?auto_103174 ?auto_103176 ) ) ( not ( = ?auto_103179 ?auto_103176 ) ) ( not ( = ?auto_103177 ?auto_103176 ) ) ( not ( = ?auto_103178 ?auto_103176 ) ) ( not ( = ?auto_103175 ?auto_103176 ) ) ( ON ?auto_103173 ?auto_103172 ) ( ON-TABLE ?auto_103176 ) ( ON ?auto_103174 ?auto_103173 ) ( ON ?auto_103179 ?auto_103174 ) ( ON ?auto_103175 ?auto_103179 ) ( ON ?auto_103178 ?auto_103175 ) ( CLEAR ?auto_103178 ) ( HOLDING ?auto_103177 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103177 )
      ( MAKE-3PILE ?auto_103172 ?auto_103173 ?auto_103174 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103180 - BLOCK
      ?auto_103181 - BLOCK
      ?auto_103182 - BLOCK
    )
    :vars
    (
      ?auto_103186 - BLOCK
      ?auto_103185 - BLOCK
      ?auto_103184 - BLOCK
      ?auto_103183 - BLOCK
      ?auto_103187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103180 ?auto_103181 ) ) ( not ( = ?auto_103180 ?auto_103182 ) ) ( not ( = ?auto_103181 ?auto_103182 ) ) ( not ( = ?auto_103180 ?auto_103186 ) ) ( not ( = ?auto_103181 ?auto_103186 ) ) ( not ( = ?auto_103182 ?auto_103186 ) ) ( not ( = ?auto_103185 ?auto_103184 ) ) ( not ( = ?auto_103185 ?auto_103183 ) ) ( not ( = ?auto_103185 ?auto_103186 ) ) ( not ( = ?auto_103185 ?auto_103182 ) ) ( not ( = ?auto_103185 ?auto_103181 ) ) ( not ( = ?auto_103184 ?auto_103183 ) ) ( not ( = ?auto_103184 ?auto_103186 ) ) ( not ( = ?auto_103184 ?auto_103182 ) ) ( not ( = ?auto_103184 ?auto_103181 ) ) ( not ( = ?auto_103183 ?auto_103186 ) ) ( not ( = ?auto_103183 ?auto_103182 ) ) ( not ( = ?auto_103183 ?auto_103181 ) ) ( not ( = ?auto_103180 ?auto_103185 ) ) ( not ( = ?auto_103180 ?auto_103184 ) ) ( not ( = ?auto_103180 ?auto_103183 ) ) ( ON ?auto_103180 ?auto_103187 ) ( not ( = ?auto_103180 ?auto_103187 ) ) ( not ( = ?auto_103181 ?auto_103187 ) ) ( not ( = ?auto_103182 ?auto_103187 ) ) ( not ( = ?auto_103186 ?auto_103187 ) ) ( not ( = ?auto_103185 ?auto_103187 ) ) ( not ( = ?auto_103184 ?auto_103187 ) ) ( not ( = ?auto_103183 ?auto_103187 ) ) ( ON ?auto_103181 ?auto_103180 ) ( ON-TABLE ?auto_103187 ) ( ON ?auto_103182 ?auto_103181 ) ( ON ?auto_103186 ?auto_103182 ) ( ON ?auto_103183 ?auto_103186 ) ( ON ?auto_103184 ?auto_103183 ) ( ON ?auto_103185 ?auto_103184 ) ( CLEAR ?auto_103185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103187 ?auto_103180 ?auto_103181 ?auto_103182 ?auto_103186 ?auto_103183 ?auto_103184 )
      ( MAKE-3PILE ?auto_103180 ?auto_103181 ?auto_103182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103207 - BLOCK
      ?auto_103208 - BLOCK
      ?auto_103209 - BLOCK
    )
    :vars
    (
      ?auto_103211 - BLOCK
      ?auto_103212 - BLOCK
      ?auto_103210 - BLOCK
      ?auto_103213 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103211 ?auto_103209 ) ( ON-TABLE ?auto_103207 ) ( ON ?auto_103208 ?auto_103207 ) ( ON ?auto_103209 ?auto_103208 ) ( not ( = ?auto_103207 ?auto_103208 ) ) ( not ( = ?auto_103207 ?auto_103209 ) ) ( not ( = ?auto_103207 ?auto_103211 ) ) ( not ( = ?auto_103208 ?auto_103209 ) ) ( not ( = ?auto_103208 ?auto_103211 ) ) ( not ( = ?auto_103209 ?auto_103211 ) ) ( not ( = ?auto_103207 ?auto_103212 ) ) ( not ( = ?auto_103207 ?auto_103210 ) ) ( not ( = ?auto_103208 ?auto_103212 ) ) ( not ( = ?auto_103208 ?auto_103210 ) ) ( not ( = ?auto_103209 ?auto_103212 ) ) ( not ( = ?auto_103209 ?auto_103210 ) ) ( not ( = ?auto_103211 ?auto_103212 ) ) ( not ( = ?auto_103211 ?auto_103210 ) ) ( not ( = ?auto_103212 ?auto_103210 ) ) ( ON ?auto_103212 ?auto_103211 ) ( CLEAR ?auto_103212 ) ( HOLDING ?auto_103210 ) ( CLEAR ?auto_103213 ) ( ON-TABLE ?auto_103213 ) ( not ( = ?auto_103213 ?auto_103210 ) ) ( not ( = ?auto_103207 ?auto_103213 ) ) ( not ( = ?auto_103208 ?auto_103213 ) ) ( not ( = ?auto_103209 ?auto_103213 ) ) ( not ( = ?auto_103211 ?auto_103213 ) ) ( not ( = ?auto_103212 ?auto_103213 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103213 ?auto_103210 )
      ( MAKE-3PILE ?auto_103207 ?auto_103208 ?auto_103209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103214 - BLOCK
      ?auto_103215 - BLOCK
      ?auto_103216 - BLOCK
    )
    :vars
    (
      ?auto_103218 - BLOCK
      ?auto_103220 - BLOCK
      ?auto_103217 - BLOCK
      ?auto_103219 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103218 ?auto_103216 ) ( ON-TABLE ?auto_103214 ) ( ON ?auto_103215 ?auto_103214 ) ( ON ?auto_103216 ?auto_103215 ) ( not ( = ?auto_103214 ?auto_103215 ) ) ( not ( = ?auto_103214 ?auto_103216 ) ) ( not ( = ?auto_103214 ?auto_103218 ) ) ( not ( = ?auto_103215 ?auto_103216 ) ) ( not ( = ?auto_103215 ?auto_103218 ) ) ( not ( = ?auto_103216 ?auto_103218 ) ) ( not ( = ?auto_103214 ?auto_103220 ) ) ( not ( = ?auto_103214 ?auto_103217 ) ) ( not ( = ?auto_103215 ?auto_103220 ) ) ( not ( = ?auto_103215 ?auto_103217 ) ) ( not ( = ?auto_103216 ?auto_103220 ) ) ( not ( = ?auto_103216 ?auto_103217 ) ) ( not ( = ?auto_103218 ?auto_103220 ) ) ( not ( = ?auto_103218 ?auto_103217 ) ) ( not ( = ?auto_103220 ?auto_103217 ) ) ( ON ?auto_103220 ?auto_103218 ) ( CLEAR ?auto_103219 ) ( ON-TABLE ?auto_103219 ) ( not ( = ?auto_103219 ?auto_103217 ) ) ( not ( = ?auto_103214 ?auto_103219 ) ) ( not ( = ?auto_103215 ?auto_103219 ) ) ( not ( = ?auto_103216 ?auto_103219 ) ) ( not ( = ?auto_103218 ?auto_103219 ) ) ( not ( = ?auto_103220 ?auto_103219 ) ) ( ON ?auto_103217 ?auto_103220 ) ( CLEAR ?auto_103217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103214 ?auto_103215 ?auto_103216 ?auto_103218 ?auto_103220 )
      ( MAKE-3PILE ?auto_103214 ?auto_103215 ?auto_103216 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103221 - BLOCK
      ?auto_103222 - BLOCK
      ?auto_103223 - BLOCK
    )
    :vars
    (
      ?auto_103227 - BLOCK
      ?auto_103225 - BLOCK
      ?auto_103226 - BLOCK
      ?auto_103224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103227 ?auto_103223 ) ( ON-TABLE ?auto_103221 ) ( ON ?auto_103222 ?auto_103221 ) ( ON ?auto_103223 ?auto_103222 ) ( not ( = ?auto_103221 ?auto_103222 ) ) ( not ( = ?auto_103221 ?auto_103223 ) ) ( not ( = ?auto_103221 ?auto_103227 ) ) ( not ( = ?auto_103222 ?auto_103223 ) ) ( not ( = ?auto_103222 ?auto_103227 ) ) ( not ( = ?auto_103223 ?auto_103227 ) ) ( not ( = ?auto_103221 ?auto_103225 ) ) ( not ( = ?auto_103221 ?auto_103226 ) ) ( not ( = ?auto_103222 ?auto_103225 ) ) ( not ( = ?auto_103222 ?auto_103226 ) ) ( not ( = ?auto_103223 ?auto_103225 ) ) ( not ( = ?auto_103223 ?auto_103226 ) ) ( not ( = ?auto_103227 ?auto_103225 ) ) ( not ( = ?auto_103227 ?auto_103226 ) ) ( not ( = ?auto_103225 ?auto_103226 ) ) ( ON ?auto_103225 ?auto_103227 ) ( not ( = ?auto_103224 ?auto_103226 ) ) ( not ( = ?auto_103221 ?auto_103224 ) ) ( not ( = ?auto_103222 ?auto_103224 ) ) ( not ( = ?auto_103223 ?auto_103224 ) ) ( not ( = ?auto_103227 ?auto_103224 ) ) ( not ( = ?auto_103225 ?auto_103224 ) ) ( ON ?auto_103226 ?auto_103225 ) ( CLEAR ?auto_103226 ) ( HOLDING ?auto_103224 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103224 )
      ( MAKE-3PILE ?auto_103221 ?auto_103222 ?auto_103223 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103238 - BLOCK
      ?auto_103239 - BLOCK
      ?auto_103240 - BLOCK
    )
    :vars
    (
      ?auto_103241 - BLOCK
      ?auto_103242 - BLOCK
      ?auto_103243 - BLOCK
      ?auto_103244 - BLOCK
      ?auto_103245 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103241 ?auto_103240 ) ( ON-TABLE ?auto_103238 ) ( ON ?auto_103239 ?auto_103238 ) ( ON ?auto_103240 ?auto_103239 ) ( not ( = ?auto_103238 ?auto_103239 ) ) ( not ( = ?auto_103238 ?auto_103240 ) ) ( not ( = ?auto_103238 ?auto_103241 ) ) ( not ( = ?auto_103239 ?auto_103240 ) ) ( not ( = ?auto_103239 ?auto_103241 ) ) ( not ( = ?auto_103240 ?auto_103241 ) ) ( not ( = ?auto_103238 ?auto_103242 ) ) ( not ( = ?auto_103238 ?auto_103243 ) ) ( not ( = ?auto_103239 ?auto_103242 ) ) ( not ( = ?auto_103239 ?auto_103243 ) ) ( not ( = ?auto_103240 ?auto_103242 ) ) ( not ( = ?auto_103240 ?auto_103243 ) ) ( not ( = ?auto_103241 ?auto_103242 ) ) ( not ( = ?auto_103241 ?auto_103243 ) ) ( not ( = ?auto_103242 ?auto_103243 ) ) ( ON ?auto_103242 ?auto_103241 ) ( not ( = ?auto_103244 ?auto_103243 ) ) ( not ( = ?auto_103238 ?auto_103244 ) ) ( not ( = ?auto_103239 ?auto_103244 ) ) ( not ( = ?auto_103240 ?auto_103244 ) ) ( not ( = ?auto_103241 ?auto_103244 ) ) ( not ( = ?auto_103242 ?auto_103244 ) ) ( ON ?auto_103243 ?auto_103242 ) ( CLEAR ?auto_103243 ) ( ON ?auto_103244 ?auto_103245 ) ( CLEAR ?auto_103244 ) ( HAND-EMPTY ) ( not ( = ?auto_103238 ?auto_103245 ) ) ( not ( = ?auto_103239 ?auto_103245 ) ) ( not ( = ?auto_103240 ?auto_103245 ) ) ( not ( = ?auto_103241 ?auto_103245 ) ) ( not ( = ?auto_103242 ?auto_103245 ) ) ( not ( = ?auto_103243 ?auto_103245 ) ) ( not ( = ?auto_103244 ?auto_103245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103244 ?auto_103245 )
      ( MAKE-3PILE ?auto_103238 ?auto_103239 ?auto_103240 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_103246 - BLOCK
      ?auto_103247 - BLOCK
      ?auto_103248 - BLOCK
    )
    :vars
    (
      ?auto_103251 - BLOCK
      ?auto_103253 - BLOCK
      ?auto_103249 - BLOCK
      ?auto_103250 - BLOCK
      ?auto_103252 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103251 ?auto_103248 ) ( ON-TABLE ?auto_103246 ) ( ON ?auto_103247 ?auto_103246 ) ( ON ?auto_103248 ?auto_103247 ) ( not ( = ?auto_103246 ?auto_103247 ) ) ( not ( = ?auto_103246 ?auto_103248 ) ) ( not ( = ?auto_103246 ?auto_103251 ) ) ( not ( = ?auto_103247 ?auto_103248 ) ) ( not ( = ?auto_103247 ?auto_103251 ) ) ( not ( = ?auto_103248 ?auto_103251 ) ) ( not ( = ?auto_103246 ?auto_103253 ) ) ( not ( = ?auto_103246 ?auto_103249 ) ) ( not ( = ?auto_103247 ?auto_103253 ) ) ( not ( = ?auto_103247 ?auto_103249 ) ) ( not ( = ?auto_103248 ?auto_103253 ) ) ( not ( = ?auto_103248 ?auto_103249 ) ) ( not ( = ?auto_103251 ?auto_103253 ) ) ( not ( = ?auto_103251 ?auto_103249 ) ) ( not ( = ?auto_103253 ?auto_103249 ) ) ( ON ?auto_103253 ?auto_103251 ) ( not ( = ?auto_103250 ?auto_103249 ) ) ( not ( = ?auto_103246 ?auto_103250 ) ) ( not ( = ?auto_103247 ?auto_103250 ) ) ( not ( = ?auto_103248 ?auto_103250 ) ) ( not ( = ?auto_103251 ?auto_103250 ) ) ( not ( = ?auto_103253 ?auto_103250 ) ) ( ON ?auto_103250 ?auto_103252 ) ( CLEAR ?auto_103250 ) ( not ( = ?auto_103246 ?auto_103252 ) ) ( not ( = ?auto_103247 ?auto_103252 ) ) ( not ( = ?auto_103248 ?auto_103252 ) ) ( not ( = ?auto_103251 ?auto_103252 ) ) ( not ( = ?auto_103253 ?auto_103252 ) ) ( not ( = ?auto_103249 ?auto_103252 ) ) ( not ( = ?auto_103250 ?auto_103252 ) ) ( HOLDING ?auto_103249 ) ( CLEAR ?auto_103253 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103246 ?auto_103247 ?auto_103248 ?auto_103251 ?auto_103253 ?auto_103249 )
      ( MAKE-3PILE ?auto_103246 ?auto_103247 ?auto_103248 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103308 - BLOCK
      ?auto_103309 - BLOCK
      ?auto_103310 - BLOCK
      ?auto_103311 - BLOCK
    )
    :vars
    (
      ?auto_103312 - BLOCK
      ?auto_103314 - BLOCK
      ?auto_103313 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103308 ) ( ON ?auto_103309 ?auto_103308 ) ( not ( = ?auto_103308 ?auto_103309 ) ) ( not ( = ?auto_103308 ?auto_103310 ) ) ( not ( = ?auto_103308 ?auto_103311 ) ) ( not ( = ?auto_103309 ?auto_103310 ) ) ( not ( = ?auto_103309 ?auto_103311 ) ) ( not ( = ?auto_103310 ?auto_103311 ) ) ( ON ?auto_103311 ?auto_103312 ) ( not ( = ?auto_103308 ?auto_103312 ) ) ( not ( = ?auto_103309 ?auto_103312 ) ) ( not ( = ?auto_103310 ?auto_103312 ) ) ( not ( = ?auto_103311 ?auto_103312 ) ) ( CLEAR ?auto_103309 ) ( ON ?auto_103310 ?auto_103311 ) ( CLEAR ?auto_103310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103314 ) ( ON ?auto_103313 ?auto_103314 ) ( ON ?auto_103312 ?auto_103313 ) ( not ( = ?auto_103314 ?auto_103313 ) ) ( not ( = ?auto_103314 ?auto_103312 ) ) ( not ( = ?auto_103314 ?auto_103311 ) ) ( not ( = ?auto_103314 ?auto_103310 ) ) ( not ( = ?auto_103313 ?auto_103312 ) ) ( not ( = ?auto_103313 ?auto_103311 ) ) ( not ( = ?auto_103313 ?auto_103310 ) ) ( not ( = ?auto_103308 ?auto_103314 ) ) ( not ( = ?auto_103308 ?auto_103313 ) ) ( not ( = ?auto_103309 ?auto_103314 ) ) ( not ( = ?auto_103309 ?auto_103313 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103314 ?auto_103313 ?auto_103312 ?auto_103311 )
      ( MAKE-4PILE ?auto_103308 ?auto_103309 ?auto_103310 ?auto_103311 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103315 - BLOCK
      ?auto_103316 - BLOCK
      ?auto_103317 - BLOCK
      ?auto_103318 - BLOCK
    )
    :vars
    (
      ?auto_103319 - BLOCK
      ?auto_103321 - BLOCK
      ?auto_103320 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103315 ) ( not ( = ?auto_103315 ?auto_103316 ) ) ( not ( = ?auto_103315 ?auto_103317 ) ) ( not ( = ?auto_103315 ?auto_103318 ) ) ( not ( = ?auto_103316 ?auto_103317 ) ) ( not ( = ?auto_103316 ?auto_103318 ) ) ( not ( = ?auto_103317 ?auto_103318 ) ) ( ON ?auto_103318 ?auto_103319 ) ( not ( = ?auto_103315 ?auto_103319 ) ) ( not ( = ?auto_103316 ?auto_103319 ) ) ( not ( = ?auto_103317 ?auto_103319 ) ) ( not ( = ?auto_103318 ?auto_103319 ) ) ( ON ?auto_103317 ?auto_103318 ) ( CLEAR ?auto_103317 ) ( ON-TABLE ?auto_103321 ) ( ON ?auto_103320 ?auto_103321 ) ( ON ?auto_103319 ?auto_103320 ) ( not ( = ?auto_103321 ?auto_103320 ) ) ( not ( = ?auto_103321 ?auto_103319 ) ) ( not ( = ?auto_103321 ?auto_103318 ) ) ( not ( = ?auto_103321 ?auto_103317 ) ) ( not ( = ?auto_103320 ?auto_103319 ) ) ( not ( = ?auto_103320 ?auto_103318 ) ) ( not ( = ?auto_103320 ?auto_103317 ) ) ( not ( = ?auto_103315 ?auto_103321 ) ) ( not ( = ?auto_103315 ?auto_103320 ) ) ( not ( = ?auto_103316 ?auto_103321 ) ) ( not ( = ?auto_103316 ?auto_103320 ) ) ( HOLDING ?auto_103316 ) ( CLEAR ?auto_103315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103315 ?auto_103316 )
      ( MAKE-4PILE ?auto_103315 ?auto_103316 ?auto_103317 ?auto_103318 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103322 - BLOCK
      ?auto_103323 - BLOCK
      ?auto_103324 - BLOCK
      ?auto_103325 - BLOCK
    )
    :vars
    (
      ?auto_103328 - BLOCK
      ?auto_103327 - BLOCK
      ?auto_103326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103322 ) ( not ( = ?auto_103322 ?auto_103323 ) ) ( not ( = ?auto_103322 ?auto_103324 ) ) ( not ( = ?auto_103322 ?auto_103325 ) ) ( not ( = ?auto_103323 ?auto_103324 ) ) ( not ( = ?auto_103323 ?auto_103325 ) ) ( not ( = ?auto_103324 ?auto_103325 ) ) ( ON ?auto_103325 ?auto_103328 ) ( not ( = ?auto_103322 ?auto_103328 ) ) ( not ( = ?auto_103323 ?auto_103328 ) ) ( not ( = ?auto_103324 ?auto_103328 ) ) ( not ( = ?auto_103325 ?auto_103328 ) ) ( ON ?auto_103324 ?auto_103325 ) ( ON-TABLE ?auto_103327 ) ( ON ?auto_103326 ?auto_103327 ) ( ON ?auto_103328 ?auto_103326 ) ( not ( = ?auto_103327 ?auto_103326 ) ) ( not ( = ?auto_103327 ?auto_103328 ) ) ( not ( = ?auto_103327 ?auto_103325 ) ) ( not ( = ?auto_103327 ?auto_103324 ) ) ( not ( = ?auto_103326 ?auto_103328 ) ) ( not ( = ?auto_103326 ?auto_103325 ) ) ( not ( = ?auto_103326 ?auto_103324 ) ) ( not ( = ?auto_103322 ?auto_103327 ) ) ( not ( = ?auto_103322 ?auto_103326 ) ) ( not ( = ?auto_103323 ?auto_103327 ) ) ( not ( = ?auto_103323 ?auto_103326 ) ) ( CLEAR ?auto_103322 ) ( ON ?auto_103323 ?auto_103324 ) ( CLEAR ?auto_103323 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103327 ?auto_103326 ?auto_103328 ?auto_103325 ?auto_103324 )
      ( MAKE-4PILE ?auto_103322 ?auto_103323 ?auto_103324 ?auto_103325 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103329 - BLOCK
      ?auto_103330 - BLOCK
      ?auto_103331 - BLOCK
      ?auto_103332 - BLOCK
    )
    :vars
    (
      ?auto_103334 - BLOCK
      ?auto_103333 - BLOCK
      ?auto_103335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103329 ?auto_103330 ) ) ( not ( = ?auto_103329 ?auto_103331 ) ) ( not ( = ?auto_103329 ?auto_103332 ) ) ( not ( = ?auto_103330 ?auto_103331 ) ) ( not ( = ?auto_103330 ?auto_103332 ) ) ( not ( = ?auto_103331 ?auto_103332 ) ) ( ON ?auto_103332 ?auto_103334 ) ( not ( = ?auto_103329 ?auto_103334 ) ) ( not ( = ?auto_103330 ?auto_103334 ) ) ( not ( = ?auto_103331 ?auto_103334 ) ) ( not ( = ?auto_103332 ?auto_103334 ) ) ( ON ?auto_103331 ?auto_103332 ) ( ON-TABLE ?auto_103333 ) ( ON ?auto_103335 ?auto_103333 ) ( ON ?auto_103334 ?auto_103335 ) ( not ( = ?auto_103333 ?auto_103335 ) ) ( not ( = ?auto_103333 ?auto_103334 ) ) ( not ( = ?auto_103333 ?auto_103332 ) ) ( not ( = ?auto_103333 ?auto_103331 ) ) ( not ( = ?auto_103335 ?auto_103334 ) ) ( not ( = ?auto_103335 ?auto_103332 ) ) ( not ( = ?auto_103335 ?auto_103331 ) ) ( not ( = ?auto_103329 ?auto_103333 ) ) ( not ( = ?auto_103329 ?auto_103335 ) ) ( not ( = ?auto_103330 ?auto_103333 ) ) ( not ( = ?auto_103330 ?auto_103335 ) ) ( ON ?auto_103330 ?auto_103331 ) ( CLEAR ?auto_103330 ) ( HOLDING ?auto_103329 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103329 )
      ( MAKE-4PILE ?auto_103329 ?auto_103330 ?auto_103331 ?auto_103332 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103336 - BLOCK
      ?auto_103337 - BLOCK
      ?auto_103338 - BLOCK
      ?auto_103339 - BLOCK
    )
    :vars
    (
      ?auto_103342 - BLOCK
      ?auto_103341 - BLOCK
      ?auto_103340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103336 ?auto_103337 ) ) ( not ( = ?auto_103336 ?auto_103338 ) ) ( not ( = ?auto_103336 ?auto_103339 ) ) ( not ( = ?auto_103337 ?auto_103338 ) ) ( not ( = ?auto_103337 ?auto_103339 ) ) ( not ( = ?auto_103338 ?auto_103339 ) ) ( ON ?auto_103339 ?auto_103342 ) ( not ( = ?auto_103336 ?auto_103342 ) ) ( not ( = ?auto_103337 ?auto_103342 ) ) ( not ( = ?auto_103338 ?auto_103342 ) ) ( not ( = ?auto_103339 ?auto_103342 ) ) ( ON ?auto_103338 ?auto_103339 ) ( ON-TABLE ?auto_103341 ) ( ON ?auto_103340 ?auto_103341 ) ( ON ?auto_103342 ?auto_103340 ) ( not ( = ?auto_103341 ?auto_103340 ) ) ( not ( = ?auto_103341 ?auto_103342 ) ) ( not ( = ?auto_103341 ?auto_103339 ) ) ( not ( = ?auto_103341 ?auto_103338 ) ) ( not ( = ?auto_103340 ?auto_103342 ) ) ( not ( = ?auto_103340 ?auto_103339 ) ) ( not ( = ?auto_103340 ?auto_103338 ) ) ( not ( = ?auto_103336 ?auto_103341 ) ) ( not ( = ?auto_103336 ?auto_103340 ) ) ( not ( = ?auto_103337 ?auto_103341 ) ) ( not ( = ?auto_103337 ?auto_103340 ) ) ( ON ?auto_103337 ?auto_103338 ) ( ON ?auto_103336 ?auto_103337 ) ( CLEAR ?auto_103336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103341 ?auto_103340 ?auto_103342 ?auto_103339 ?auto_103338 ?auto_103337 )
      ( MAKE-4PILE ?auto_103336 ?auto_103337 ?auto_103338 ?auto_103339 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103347 - BLOCK
      ?auto_103348 - BLOCK
      ?auto_103349 - BLOCK
      ?auto_103350 - BLOCK
    )
    :vars
    (
      ?auto_103352 - BLOCK
      ?auto_103351 - BLOCK
      ?auto_103353 - BLOCK
      ?auto_103354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103347 ?auto_103348 ) ) ( not ( = ?auto_103347 ?auto_103349 ) ) ( not ( = ?auto_103347 ?auto_103350 ) ) ( not ( = ?auto_103348 ?auto_103349 ) ) ( not ( = ?auto_103348 ?auto_103350 ) ) ( not ( = ?auto_103349 ?auto_103350 ) ) ( ON ?auto_103350 ?auto_103352 ) ( not ( = ?auto_103347 ?auto_103352 ) ) ( not ( = ?auto_103348 ?auto_103352 ) ) ( not ( = ?auto_103349 ?auto_103352 ) ) ( not ( = ?auto_103350 ?auto_103352 ) ) ( ON ?auto_103349 ?auto_103350 ) ( ON-TABLE ?auto_103351 ) ( ON ?auto_103353 ?auto_103351 ) ( ON ?auto_103352 ?auto_103353 ) ( not ( = ?auto_103351 ?auto_103353 ) ) ( not ( = ?auto_103351 ?auto_103352 ) ) ( not ( = ?auto_103351 ?auto_103350 ) ) ( not ( = ?auto_103351 ?auto_103349 ) ) ( not ( = ?auto_103353 ?auto_103352 ) ) ( not ( = ?auto_103353 ?auto_103350 ) ) ( not ( = ?auto_103353 ?auto_103349 ) ) ( not ( = ?auto_103347 ?auto_103351 ) ) ( not ( = ?auto_103347 ?auto_103353 ) ) ( not ( = ?auto_103348 ?auto_103351 ) ) ( not ( = ?auto_103348 ?auto_103353 ) ) ( ON ?auto_103348 ?auto_103349 ) ( CLEAR ?auto_103348 ) ( ON ?auto_103347 ?auto_103354 ) ( CLEAR ?auto_103347 ) ( HAND-EMPTY ) ( not ( = ?auto_103347 ?auto_103354 ) ) ( not ( = ?auto_103348 ?auto_103354 ) ) ( not ( = ?auto_103349 ?auto_103354 ) ) ( not ( = ?auto_103350 ?auto_103354 ) ) ( not ( = ?auto_103352 ?auto_103354 ) ) ( not ( = ?auto_103351 ?auto_103354 ) ) ( not ( = ?auto_103353 ?auto_103354 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103347 ?auto_103354 )
      ( MAKE-4PILE ?auto_103347 ?auto_103348 ?auto_103349 ?auto_103350 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103355 - BLOCK
      ?auto_103356 - BLOCK
      ?auto_103357 - BLOCK
      ?auto_103358 - BLOCK
    )
    :vars
    (
      ?auto_103360 - BLOCK
      ?auto_103361 - BLOCK
      ?auto_103362 - BLOCK
      ?auto_103359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103355 ?auto_103356 ) ) ( not ( = ?auto_103355 ?auto_103357 ) ) ( not ( = ?auto_103355 ?auto_103358 ) ) ( not ( = ?auto_103356 ?auto_103357 ) ) ( not ( = ?auto_103356 ?auto_103358 ) ) ( not ( = ?auto_103357 ?auto_103358 ) ) ( ON ?auto_103358 ?auto_103360 ) ( not ( = ?auto_103355 ?auto_103360 ) ) ( not ( = ?auto_103356 ?auto_103360 ) ) ( not ( = ?auto_103357 ?auto_103360 ) ) ( not ( = ?auto_103358 ?auto_103360 ) ) ( ON ?auto_103357 ?auto_103358 ) ( ON-TABLE ?auto_103361 ) ( ON ?auto_103362 ?auto_103361 ) ( ON ?auto_103360 ?auto_103362 ) ( not ( = ?auto_103361 ?auto_103362 ) ) ( not ( = ?auto_103361 ?auto_103360 ) ) ( not ( = ?auto_103361 ?auto_103358 ) ) ( not ( = ?auto_103361 ?auto_103357 ) ) ( not ( = ?auto_103362 ?auto_103360 ) ) ( not ( = ?auto_103362 ?auto_103358 ) ) ( not ( = ?auto_103362 ?auto_103357 ) ) ( not ( = ?auto_103355 ?auto_103361 ) ) ( not ( = ?auto_103355 ?auto_103362 ) ) ( not ( = ?auto_103356 ?auto_103361 ) ) ( not ( = ?auto_103356 ?auto_103362 ) ) ( ON ?auto_103355 ?auto_103359 ) ( CLEAR ?auto_103355 ) ( not ( = ?auto_103355 ?auto_103359 ) ) ( not ( = ?auto_103356 ?auto_103359 ) ) ( not ( = ?auto_103357 ?auto_103359 ) ) ( not ( = ?auto_103358 ?auto_103359 ) ) ( not ( = ?auto_103360 ?auto_103359 ) ) ( not ( = ?auto_103361 ?auto_103359 ) ) ( not ( = ?auto_103362 ?auto_103359 ) ) ( HOLDING ?auto_103356 ) ( CLEAR ?auto_103357 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103361 ?auto_103362 ?auto_103360 ?auto_103358 ?auto_103357 ?auto_103356 )
      ( MAKE-4PILE ?auto_103355 ?auto_103356 ?auto_103357 ?auto_103358 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103363 - BLOCK
      ?auto_103364 - BLOCK
      ?auto_103365 - BLOCK
      ?auto_103366 - BLOCK
    )
    :vars
    (
      ?auto_103370 - BLOCK
      ?auto_103369 - BLOCK
      ?auto_103368 - BLOCK
      ?auto_103367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103363 ?auto_103364 ) ) ( not ( = ?auto_103363 ?auto_103365 ) ) ( not ( = ?auto_103363 ?auto_103366 ) ) ( not ( = ?auto_103364 ?auto_103365 ) ) ( not ( = ?auto_103364 ?auto_103366 ) ) ( not ( = ?auto_103365 ?auto_103366 ) ) ( ON ?auto_103366 ?auto_103370 ) ( not ( = ?auto_103363 ?auto_103370 ) ) ( not ( = ?auto_103364 ?auto_103370 ) ) ( not ( = ?auto_103365 ?auto_103370 ) ) ( not ( = ?auto_103366 ?auto_103370 ) ) ( ON ?auto_103365 ?auto_103366 ) ( ON-TABLE ?auto_103369 ) ( ON ?auto_103368 ?auto_103369 ) ( ON ?auto_103370 ?auto_103368 ) ( not ( = ?auto_103369 ?auto_103368 ) ) ( not ( = ?auto_103369 ?auto_103370 ) ) ( not ( = ?auto_103369 ?auto_103366 ) ) ( not ( = ?auto_103369 ?auto_103365 ) ) ( not ( = ?auto_103368 ?auto_103370 ) ) ( not ( = ?auto_103368 ?auto_103366 ) ) ( not ( = ?auto_103368 ?auto_103365 ) ) ( not ( = ?auto_103363 ?auto_103369 ) ) ( not ( = ?auto_103363 ?auto_103368 ) ) ( not ( = ?auto_103364 ?auto_103369 ) ) ( not ( = ?auto_103364 ?auto_103368 ) ) ( ON ?auto_103363 ?auto_103367 ) ( not ( = ?auto_103363 ?auto_103367 ) ) ( not ( = ?auto_103364 ?auto_103367 ) ) ( not ( = ?auto_103365 ?auto_103367 ) ) ( not ( = ?auto_103366 ?auto_103367 ) ) ( not ( = ?auto_103370 ?auto_103367 ) ) ( not ( = ?auto_103369 ?auto_103367 ) ) ( not ( = ?auto_103368 ?auto_103367 ) ) ( CLEAR ?auto_103365 ) ( ON ?auto_103364 ?auto_103363 ) ( CLEAR ?auto_103364 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103367 ?auto_103363 )
      ( MAKE-4PILE ?auto_103363 ?auto_103364 ?auto_103365 ?auto_103366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103371 - BLOCK
      ?auto_103372 - BLOCK
      ?auto_103373 - BLOCK
      ?auto_103374 - BLOCK
    )
    :vars
    (
      ?auto_103378 - BLOCK
      ?auto_103376 - BLOCK
      ?auto_103375 - BLOCK
      ?auto_103377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103371 ?auto_103372 ) ) ( not ( = ?auto_103371 ?auto_103373 ) ) ( not ( = ?auto_103371 ?auto_103374 ) ) ( not ( = ?auto_103372 ?auto_103373 ) ) ( not ( = ?auto_103372 ?auto_103374 ) ) ( not ( = ?auto_103373 ?auto_103374 ) ) ( ON ?auto_103374 ?auto_103378 ) ( not ( = ?auto_103371 ?auto_103378 ) ) ( not ( = ?auto_103372 ?auto_103378 ) ) ( not ( = ?auto_103373 ?auto_103378 ) ) ( not ( = ?auto_103374 ?auto_103378 ) ) ( ON-TABLE ?auto_103376 ) ( ON ?auto_103375 ?auto_103376 ) ( ON ?auto_103378 ?auto_103375 ) ( not ( = ?auto_103376 ?auto_103375 ) ) ( not ( = ?auto_103376 ?auto_103378 ) ) ( not ( = ?auto_103376 ?auto_103374 ) ) ( not ( = ?auto_103376 ?auto_103373 ) ) ( not ( = ?auto_103375 ?auto_103378 ) ) ( not ( = ?auto_103375 ?auto_103374 ) ) ( not ( = ?auto_103375 ?auto_103373 ) ) ( not ( = ?auto_103371 ?auto_103376 ) ) ( not ( = ?auto_103371 ?auto_103375 ) ) ( not ( = ?auto_103372 ?auto_103376 ) ) ( not ( = ?auto_103372 ?auto_103375 ) ) ( ON ?auto_103371 ?auto_103377 ) ( not ( = ?auto_103371 ?auto_103377 ) ) ( not ( = ?auto_103372 ?auto_103377 ) ) ( not ( = ?auto_103373 ?auto_103377 ) ) ( not ( = ?auto_103374 ?auto_103377 ) ) ( not ( = ?auto_103378 ?auto_103377 ) ) ( not ( = ?auto_103376 ?auto_103377 ) ) ( not ( = ?auto_103375 ?auto_103377 ) ) ( ON ?auto_103372 ?auto_103371 ) ( CLEAR ?auto_103372 ) ( ON-TABLE ?auto_103377 ) ( HOLDING ?auto_103373 ) ( CLEAR ?auto_103374 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103376 ?auto_103375 ?auto_103378 ?auto_103374 ?auto_103373 )
      ( MAKE-4PILE ?auto_103371 ?auto_103372 ?auto_103373 ?auto_103374 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103379 - BLOCK
      ?auto_103380 - BLOCK
      ?auto_103381 - BLOCK
      ?auto_103382 - BLOCK
    )
    :vars
    (
      ?auto_103384 - BLOCK
      ?auto_103383 - BLOCK
      ?auto_103385 - BLOCK
      ?auto_103386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103379 ?auto_103380 ) ) ( not ( = ?auto_103379 ?auto_103381 ) ) ( not ( = ?auto_103379 ?auto_103382 ) ) ( not ( = ?auto_103380 ?auto_103381 ) ) ( not ( = ?auto_103380 ?auto_103382 ) ) ( not ( = ?auto_103381 ?auto_103382 ) ) ( ON ?auto_103382 ?auto_103384 ) ( not ( = ?auto_103379 ?auto_103384 ) ) ( not ( = ?auto_103380 ?auto_103384 ) ) ( not ( = ?auto_103381 ?auto_103384 ) ) ( not ( = ?auto_103382 ?auto_103384 ) ) ( ON-TABLE ?auto_103383 ) ( ON ?auto_103385 ?auto_103383 ) ( ON ?auto_103384 ?auto_103385 ) ( not ( = ?auto_103383 ?auto_103385 ) ) ( not ( = ?auto_103383 ?auto_103384 ) ) ( not ( = ?auto_103383 ?auto_103382 ) ) ( not ( = ?auto_103383 ?auto_103381 ) ) ( not ( = ?auto_103385 ?auto_103384 ) ) ( not ( = ?auto_103385 ?auto_103382 ) ) ( not ( = ?auto_103385 ?auto_103381 ) ) ( not ( = ?auto_103379 ?auto_103383 ) ) ( not ( = ?auto_103379 ?auto_103385 ) ) ( not ( = ?auto_103380 ?auto_103383 ) ) ( not ( = ?auto_103380 ?auto_103385 ) ) ( ON ?auto_103379 ?auto_103386 ) ( not ( = ?auto_103379 ?auto_103386 ) ) ( not ( = ?auto_103380 ?auto_103386 ) ) ( not ( = ?auto_103381 ?auto_103386 ) ) ( not ( = ?auto_103382 ?auto_103386 ) ) ( not ( = ?auto_103384 ?auto_103386 ) ) ( not ( = ?auto_103383 ?auto_103386 ) ) ( not ( = ?auto_103385 ?auto_103386 ) ) ( ON ?auto_103380 ?auto_103379 ) ( ON-TABLE ?auto_103386 ) ( CLEAR ?auto_103382 ) ( ON ?auto_103381 ?auto_103380 ) ( CLEAR ?auto_103381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103386 ?auto_103379 ?auto_103380 )
      ( MAKE-4PILE ?auto_103379 ?auto_103380 ?auto_103381 ?auto_103382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103387 - BLOCK
      ?auto_103388 - BLOCK
      ?auto_103389 - BLOCK
      ?auto_103390 - BLOCK
    )
    :vars
    (
      ?auto_103394 - BLOCK
      ?auto_103391 - BLOCK
      ?auto_103393 - BLOCK
      ?auto_103392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103387 ?auto_103388 ) ) ( not ( = ?auto_103387 ?auto_103389 ) ) ( not ( = ?auto_103387 ?auto_103390 ) ) ( not ( = ?auto_103388 ?auto_103389 ) ) ( not ( = ?auto_103388 ?auto_103390 ) ) ( not ( = ?auto_103389 ?auto_103390 ) ) ( not ( = ?auto_103387 ?auto_103394 ) ) ( not ( = ?auto_103388 ?auto_103394 ) ) ( not ( = ?auto_103389 ?auto_103394 ) ) ( not ( = ?auto_103390 ?auto_103394 ) ) ( ON-TABLE ?auto_103391 ) ( ON ?auto_103393 ?auto_103391 ) ( ON ?auto_103394 ?auto_103393 ) ( not ( = ?auto_103391 ?auto_103393 ) ) ( not ( = ?auto_103391 ?auto_103394 ) ) ( not ( = ?auto_103391 ?auto_103390 ) ) ( not ( = ?auto_103391 ?auto_103389 ) ) ( not ( = ?auto_103393 ?auto_103394 ) ) ( not ( = ?auto_103393 ?auto_103390 ) ) ( not ( = ?auto_103393 ?auto_103389 ) ) ( not ( = ?auto_103387 ?auto_103391 ) ) ( not ( = ?auto_103387 ?auto_103393 ) ) ( not ( = ?auto_103388 ?auto_103391 ) ) ( not ( = ?auto_103388 ?auto_103393 ) ) ( ON ?auto_103387 ?auto_103392 ) ( not ( = ?auto_103387 ?auto_103392 ) ) ( not ( = ?auto_103388 ?auto_103392 ) ) ( not ( = ?auto_103389 ?auto_103392 ) ) ( not ( = ?auto_103390 ?auto_103392 ) ) ( not ( = ?auto_103394 ?auto_103392 ) ) ( not ( = ?auto_103391 ?auto_103392 ) ) ( not ( = ?auto_103393 ?auto_103392 ) ) ( ON ?auto_103388 ?auto_103387 ) ( ON-TABLE ?auto_103392 ) ( ON ?auto_103389 ?auto_103388 ) ( CLEAR ?auto_103389 ) ( HOLDING ?auto_103390 ) ( CLEAR ?auto_103394 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103391 ?auto_103393 ?auto_103394 ?auto_103390 )
      ( MAKE-4PILE ?auto_103387 ?auto_103388 ?auto_103389 ?auto_103390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103395 - BLOCK
      ?auto_103396 - BLOCK
      ?auto_103397 - BLOCK
      ?auto_103398 - BLOCK
    )
    :vars
    (
      ?auto_103401 - BLOCK
      ?auto_103399 - BLOCK
      ?auto_103402 - BLOCK
      ?auto_103400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103395 ?auto_103396 ) ) ( not ( = ?auto_103395 ?auto_103397 ) ) ( not ( = ?auto_103395 ?auto_103398 ) ) ( not ( = ?auto_103396 ?auto_103397 ) ) ( not ( = ?auto_103396 ?auto_103398 ) ) ( not ( = ?auto_103397 ?auto_103398 ) ) ( not ( = ?auto_103395 ?auto_103401 ) ) ( not ( = ?auto_103396 ?auto_103401 ) ) ( not ( = ?auto_103397 ?auto_103401 ) ) ( not ( = ?auto_103398 ?auto_103401 ) ) ( ON-TABLE ?auto_103399 ) ( ON ?auto_103402 ?auto_103399 ) ( ON ?auto_103401 ?auto_103402 ) ( not ( = ?auto_103399 ?auto_103402 ) ) ( not ( = ?auto_103399 ?auto_103401 ) ) ( not ( = ?auto_103399 ?auto_103398 ) ) ( not ( = ?auto_103399 ?auto_103397 ) ) ( not ( = ?auto_103402 ?auto_103401 ) ) ( not ( = ?auto_103402 ?auto_103398 ) ) ( not ( = ?auto_103402 ?auto_103397 ) ) ( not ( = ?auto_103395 ?auto_103399 ) ) ( not ( = ?auto_103395 ?auto_103402 ) ) ( not ( = ?auto_103396 ?auto_103399 ) ) ( not ( = ?auto_103396 ?auto_103402 ) ) ( ON ?auto_103395 ?auto_103400 ) ( not ( = ?auto_103395 ?auto_103400 ) ) ( not ( = ?auto_103396 ?auto_103400 ) ) ( not ( = ?auto_103397 ?auto_103400 ) ) ( not ( = ?auto_103398 ?auto_103400 ) ) ( not ( = ?auto_103401 ?auto_103400 ) ) ( not ( = ?auto_103399 ?auto_103400 ) ) ( not ( = ?auto_103402 ?auto_103400 ) ) ( ON ?auto_103396 ?auto_103395 ) ( ON-TABLE ?auto_103400 ) ( ON ?auto_103397 ?auto_103396 ) ( CLEAR ?auto_103401 ) ( ON ?auto_103398 ?auto_103397 ) ( CLEAR ?auto_103398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103400 ?auto_103395 ?auto_103396 ?auto_103397 )
      ( MAKE-4PILE ?auto_103395 ?auto_103396 ?auto_103397 ?auto_103398 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103403 - BLOCK
      ?auto_103404 - BLOCK
      ?auto_103405 - BLOCK
      ?auto_103406 - BLOCK
    )
    :vars
    (
      ?auto_103410 - BLOCK
      ?auto_103407 - BLOCK
      ?auto_103408 - BLOCK
      ?auto_103409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103403 ?auto_103404 ) ) ( not ( = ?auto_103403 ?auto_103405 ) ) ( not ( = ?auto_103403 ?auto_103406 ) ) ( not ( = ?auto_103404 ?auto_103405 ) ) ( not ( = ?auto_103404 ?auto_103406 ) ) ( not ( = ?auto_103405 ?auto_103406 ) ) ( not ( = ?auto_103403 ?auto_103410 ) ) ( not ( = ?auto_103404 ?auto_103410 ) ) ( not ( = ?auto_103405 ?auto_103410 ) ) ( not ( = ?auto_103406 ?auto_103410 ) ) ( ON-TABLE ?auto_103407 ) ( ON ?auto_103408 ?auto_103407 ) ( not ( = ?auto_103407 ?auto_103408 ) ) ( not ( = ?auto_103407 ?auto_103410 ) ) ( not ( = ?auto_103407 ?auto_103406 ) ) ( not ( = ?auto_103407 ?auto_103405 ) ) ( not ( = ?auto_103408 ?auto_103410 ) ) ( not ( = ?auto_103408 ?auto_103406 ) ) ( not ( = ?auto_103408 ?auto_103405 ) ) ( not ( = ?auto_103403 ?auto_103407 ) ) ( not ( = ?auto_103403 ?auto_103408 ) ) ( not ( = ?auto_103404 ?auto_103407 ) ) ( not ( = ?auto_103404 ?auto_103408 ) ) ( ON ?auto_103403 ?auto_103409 ) ( not ( = ?auto_103403 ?auto_103409 ) ) ( not ( = ?auto_103404 ?auto_103409 ) ) ( not ( = ?auto_103405 ?auto_103409 ) ) ( not ( = ?auto_103406 ?auto_103409 ) ) ( not ( = ?auto_103410 ?auto_103409 ) ) ( not ( = ?auto_103407 ?auto_103409 ) ) ( not ( = ?auto_103408 ?auto_103409 ) ) ( ON ?auto_103404 ?auto_103403 ) ( ON-TABLE ?auto_103409 ) ( ON ?auto_103405 ?auto_103404 ) ( ON ?auto_103406 ?auto_103405 ) ( CLEAR ?auto_103406 ) ( HOLDING ?auto_103410 ) ( CLEAR ?auto_103408 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103407 ?auto_103408 ?auto_103410 )
      ( MAKE-4PILE ?auto_103403 ?auto_103404 ?auto_103405 ?auto_103406 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103411 - BLOCK
      ?auto_103412 - BLOCK
      ?auto_103413 - BLOCK
      ?auto_103414 - BLOCK
    )
    :vars
    (
      ?auto_103416 - BLOCK
      ?auto_103418 - BLOCK
      ?auto_103415 - BLOCK
      ?auto_103417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103411 ?auto_103412 ) ) ( not ( = ?auto_103411 ?auto_103413 ) ) ( not ( = ?auto_103411 ?auto_103414 ) ) ( not ( = ?auto_103412 ?auto_103413 ) ) ( not ( = ?auto_103412 ?auto_103414 ) ) ( not ( = ?auto_103413 ?auto_103414 ) ) ( not ( = ?auto_103411 ?auto_103416 ) ) ( not ( = ?auto_103412 ?auto_103416 ) ) ( not ( = ?auto_103413 ?auto_103416 ) ) ( not ( = ?auto_103414 ?auto_103416 ) ) ( ON-TABLE ?auto_103418 ) ( ON ?auto_103415 ?auto_103418 ) ( not ( = ?auto_103418 ?auto_103415 ) ) ( not ( = ?auto_103418 ?auto_103416 ) ) ( not ( = ?auto_103418 ?auto_103414 ) ) ( not ( = ?auto_103418 ?auto_103413 ) ) ( not ( = ?auto_103415 ?auto_103416 ) ) ( not ( = ?auto_103415 ?auto_103414 ) ) ( not ( = ?auto_103415 ?auto_103413 ) ) ( not ( = ?auto_103411 ?auto_103418 ) ) ( not ( = ?auto_103411 ?auto_103415 ) ) ( not ( = ?auto_103412 ?auto_103418 ) ) ( not ( = ?auto_103412 ?auto_103415 ) ) ( ON ?auto_103411 ?auto_103417 ) ( not ( = ?auto_103411 ?auto_103417 ) ) ( not ( = ?auto_103412 ?auto_103417 ) ) ( not ( = ?auto_103413 ?auto_103417 ) ) ( not ( = ?auto_103414 ?auto_103417 ) ) ( not ( = ?auto_103416 ?auto_103417 ) ) ( not ( = ?auto_103418 ?auto_103417 ) ) ( not ( = ?auto_103415 ?auto_103417 ) ) ( ON ?auto_103412 ?auto_103411 ) ( ON-TABLE ?auto_103417 ) ( ON ?auto_103413 ?auto_103412 ) ( ON ?auto_103414 ?auto_103413 ) ( CLEAR ?auto_103415 ) ( ON ?auto_103416 ?auto_103414 ) ( CLEAR ?auto_103416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103417 ?auto_103411 ?auto_103412 ?auto_103413 ?auto_103414 )
      ( MAKE-4PILE ?auto_103411 ?auto_103412 ?auto_103413 ?auto_103414 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103419 - BLOCK
      ?auto_103420 - BLOCK
      ?auto_103421 - BLOCK
      ?auto_103422 - BLOCK
    )
    :vars
    (
      ?auto_103426 - BLOCK
      ?auto_103423 - BLOCK
      ?auto_103425 - BLOCK
      ?auto_103424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103419 ?auto_103420 ) ) ( not ( = ?auto_103419 ?auto_103421 ) ) ( not ( = ?auto_103419 ?auto_103422 ) ) ( not ( = ?auto_103420 ?auto_103421 ) ) ( not ( = ?auto_103420 ?auto_103422 ) ) ( not ( = ?auto_103421 ?auto_103422 ) ) ( not ( = ?auto_103419 ?auto_103426 ) ) ( not ( = ?auto_103420 ?auto_103426 ) ) ( not ( = ?auto_103421 ?auto_103426 ) ) ( not ( = ?auto_103422 ?auto_103426 ) ) ( ON-TABLE ?auto_103423 ) ( not ( = ?auto_103423 ?auto_103425 ) ) ( not ( = ?auto_103423 ?auto_103426 ) ) ( not ( = ?auto_103423 ?auto_103422 ) ) ( not ( = ?auto_103423 ?auto_103421 ) ) ( not ( = ?auto_103425 ?auto_103426 ) ) ( not ( = ?auto_103425 ?auto_103422 ) ) ( not ( = ?auto_103425 ?auto_103421 ) ) ( not ( = ?auto_103419 ?auto_103423 ) ) ( not ( = ?auto_103419 ?auto_103425 ) ) ( not ( = ?auto_103420 ?auto_103423 ) ) ( not ( = ?auto_103420 ?auto_103425 ) ) ( ON ?auto_103419 ?auto_103424 ) ( not ( = ?auto_103419 ?auto_103424 ) ) ( not ( = ?auto_103420 ?auto_103424 ) ) ( not ( = ?auto_103421 ?auto_103424 ) ) ( not ( = ?auto_103422 ?auto_103424 ) ) ( not ( = ?auto_103426 ?auto_103424 ) ) ( not ( = ?auto_103423 ?auto_103424 ) ) ( not ( = ?auto_103425 ?auto_103424 ) ) ( ON ?auto_103420 ?auto_103419 ) ( ON-TABLE ?auto_103424 ) ( ON ?auto_103421 ?auto_103420 ) ( ON ?auto_103422 ?auto_103421 ) ( ON ?auto_103426 ?auto_103422 ) ( CLEAR ?auto_103426 ) ( HOLDING ?auto_103425 ) ( CLEAR ?auto_103423 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103423 ?auto_103425 )
      ( MAKE-4PILE ?auto_103419 ?auto_103420 ?auto_103421 ?auto_103422 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103427 - BLOCK
      ?auto_103428 - BLOCK
      ?auto_103429 - BLOCK
      ?auto_103430 - BLOCK
    )
    :vars
    (
      ?auto_103432 - BLOCK
      ?auto_103433 - BLOCK
      ?auto_103434 - BLOCK
      ?auto_103431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103427 ?auto_103428 ) ) ( not ( = ?auto_103427 ?auto_103429 ) ) ( not ( = ?auto_103427 ?auto_103430 ) ) ( not ( = ?auto_103428 ?auto_103429 ) ) ( not ( = ?auto_103428 ?auto_103430 ) ) ( not ( = ?auto_103429 ?auto_103430 ) ) ( not ( = ?auto_103427 ?auto_103432 ) ) ( not ( = ?auto_103428 ?auto_103432 ) ) ( not ( = ?auto_103429 ?auto_103432 ) ) ( not ( = ?auto_103430 ?auto_103432 ) ) ( ON-TABLE ?auto_103433 ) ( not ( = ?auto_103433 ?auto_103434 ) ) ( not ( = ?auto_103433 ?auto_103432 ) ) ( not ( = ?auto_103433 ?auto_103430 ) ) ( not ( = ?auto_103433 ?auto_103429 ) ) ( not ( = ?auto_103434 ?auto_103432 ) ) ( not ( = ?auto_103434 ?auto_103430 ) ) ( not ( = ?auto_103434 ?auto_103429 ) ) ( not ( = ?auto_103427 ?auto_103433 ) ) ( not ( = ?auto_103427 ?auto_103434 ) ) ( not ( = ?auto_103428 ?auto_103433 ) ) ( not ( = ?auto_103428 ?auto_103434 ) ) ( ON ?auto_103427 ?auto_103431 ) ( not ( = ?auto_103427 ?auto_103431 ) ) ( not ( = ?auto_103428 ?auto_103431 ) ) ( not ( = ?auto_103429 ?auto_103431 ) ) ( not ( = ?auto_103430 ?auto_103431 ) ) ( not ( = ?auto_103432 ?auto_103431 ) ) ( not ( = ?auto_103433 ?auto_103431 ) ) ( not ( = ?auto_103434 ?auto_103431 ) ) ( ON ?auto_103428 ?auto_103427 ) ( ON-TABLE ?auto_103431 ) ( ON ?auto_103429 ?auto_103428 ) ( ON ?auto_103430 ?auto_103429 ) ( ON ?auto_103432 ?auto_103430 ) ( CLEAR ?auto_103433 ) ( ON ?auto_103434 ?auto_103432 ) ( CLEAR ?auto_103434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103431 ?auto_103427 ?auto_103428 ?auto_103429 ?auto_103430 ?auto_103432 )
      ( MAKE-4PILE ?auto_103427 ?auto_103428 ?auto_103429 ?auto_103430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103435 - BLOCK
      ?auto_103436 - BLOCK
      ?auto_103437 - BLOCK
      ?auto_103438 - BLOCK
    )
    :vars
    (
      ?auto_103442 - BLOCK
      ?auto_103440 - BLOCK
      ?auto_103441 - BLOCK
      ?auto_103439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103435 ?auto_103436 ) ) ( not ( = ?auto_103435 ?auto_103437 ) ) ( not ( = ?auto_103435 ?auto_103438 ) ) ( not ( = ?auto_103436 ?auto_103437 ) ) ( not ( = ?auto_103436 ?auto_103438 ) ) ( not ( = ?auto_103437 ?auto_103438 ) ) ( not ( = ?auto_103435 ?auto_103442 ) ) ( not ( = ?auto_103436 ?auto_103442 ) ) ( not ( = ?auto_103437 ?auto_103442 ) ) ( not ( = ?auto_103438 ?auto_103442 ) ) ( not ( = ?auto_103440 ?auto_103441 ) ) ( not ( = ?auto_103440 ?auto_103442 ) ) ( not ( = ?auto_103440 ?auto_103438 ) ) ( not ( = ?auto_103440 ?auto_103437 ) ) ( not ( = ?auto_103441 ?auto_103442 ) ) ( not ( = ?auto_103441 ?auto_103438 ) ) ( not ( = ?auto_103441 ?auto_103437 ) ) ( not ( = ?auto_103435 ?auto_103440 ) ) ( not ( = ?auto_103435 ?auto_103441 ) ) ( not ( = ?auto_103436 ?auto_103440 ) ) ( not ( = ?auto_103436 ?auto_103441 ) ) ( ON ?auto_103435 ?auto_103439 ) ( not ( = ?auto_103435 ?auto_103439 ) ) ( not ( = ?auto_103436 ?auto_103439 ) ) ( not ( = ?auto_103437 ?auto_103439 ) ) ( not ( = ?auto_103438 ?auto_103439 ) ) ( not ( = ?auto_103442 ?auto_103439 ) ) ( not ( = ?auto_103440 ?auto_103439 ) ) ( not ( = ?auto_103441 ?auto_103439 ) ) ( ON ?auto_103436 ?auto_103435 ) ( ON-TABLE ?auto_103439 ) ( ON ?auto_103437 ?auto_103436 ) ( ON ?auto_103438 ?auto_103437 ) ( ON ?auto_103442 ?auto_103438 ) ( ON ?auto_103441 ?auto_103442 ) ( CLEAR ?auto_103441 ) ( HOLDING ?auto_103440 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103440 )
      ( MAKE-4PILE ?auto_103435 ?auto_103436 ?auto_103437 ?auto_103438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_103443 - BLOCK
      ?auto_103444 - BLOCK
      ?auto_103445 - BLOCK
      ?auto_103446 - BLOCK
    )
    :vars
    (
      ?auto_103447 - BLOCK
      ?auto_103450 - BLOCK
      ?auto_103449 - BLOCK
      ?auto_103448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103443 ?auto_103444 ) ) ( not ( = ?auto_103443 ?auto_103445 ) ) ( not ( = ?auto_103443 ?auto_103446 ) ) ( not ( = ?auto_103444 ?auto_103445 ) ) ( not ( = ?auto_103444 ?auto_103446 ) ) ( not ( = ?auto_103445 ?auto_103446 ) ) ( not ( = ?auto_103443 ?auto_103447 ) ) ( not ( = ?auto_103444 ?auto_103447 ) ) ( not ( = ?auto_103445 ?auto_103447 ) ) ( not ( = ?auto_103446 ?auto_103447 ) ) ( not ( = ?auto_103450 ?auto_103449 ) ) ( not ( = ?auto_103450 ?auto_103447 ) ) ( not ( = ?auto_103450 ?auto_103446 ) ) ( not ( = ?auto_103450 ?auto_103445 ) ) ( not ( = ?auto_103449 ?auto_103447 ) ) ( not ( = ?auto_103449 ?auto_103446 ) ) ( not ( = ?auto_103449 ?auto_103445 ) ) ( not ( = ?auto_103443 ?auto_103450 ) ) ( not ( = ?auto_103443 ?auto_103449 ) ) ( not ( = ?auto_103444 ?auto_103450 ) ) ( not ( = ?auto_103444 ?auto_103449 ) ) ( ON ?auto_103443 ?auto_103448 ) ( not ( = ?auto_103443 ?auto_103448 ) ) ( not ( = ?auto_103444 ?auto_103448 ) ) ( not ( = ?auto_103445 ?auto_103448 ) ) ( not ( = ?auto_103446 ?auto_103448 ) ) ( not ( = ?auto_103447 ?auto_103448 ) ) ( not ( = ?auto_103450 ?auto_103448 ) ) ( not ( = ?auto_103449 ?auto_103448 ) ) ( ON ?auto_103444 ?auto_103443 ) ( ON-TABLE ?auto_103448 ) ( ON ?auto_103445 ?auto_103444 ) ( ON ?auto_103446 ?auto_103445 ) ( ON ?auto_103447 ?auto_103446 ) ( ON ?auto_103449 ?auto_103447 ) ( ON ?auto_103450 ?auto_103449 ) ( CLEAR ?auto_103450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103448 ?auto_103443 ?auto_103444 ?auto_103445 ?auto_103446 ?auto_103447 ?auto_103449 )
      ( MAKE-4PILE ?auto_103443 ?auto_103444 ?auto_103445 ?auto_103446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103466 - BLOCK
      ?auto_103467 - BLOCK
    )
    :vars
    (
      ?auto_103470 - BLOCK
      ?auto_103468 - BLOCK
      ?auto_103469 - BLOCK
      ?auto_103472 - BLOCK
      ?auto_103471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103470 ?auto_103467 ) ( ON-TABLE ?auto_103466 ) ( ON ?auto_103467 ?auto_103466 ) ( not ( = ?auto_103466 ?auto_103467 ) ) ( not ( = ?auto_103466 ?auto_103470 ) ) ( not ( = ?auto_103467 ?auto_103470 ) ) ( not ( = ?auto_103466 ?auto_103468 ) ) ( not ( = ?auto_103466 ?auto_103469 ) ) ( not ( = ?auto_103467 ?auto_103468 ) ) ( not ( = ?auto_103467 ?auto_103469 ) ) ( not ( = ?auto_103470 ?auto_103468 ) ) ( not ( = ?auto_103470 ?auto_103469 ) ) ( not ( = ?auto_103468 ?auto_103469 ) ) ( ON ?auto_103468 ?auto_103470 ) ( CLEAR ?auto_103468 ) ( HOLDING ?auto_103469 ) ( CLEAR ?auto_103472 ) ( ON-TABLE ?auto_103471 ) ( ON ?auto_103472 ?auto_103471 ) ( not ( = ?auto_103471 ?auto_103472 ) ) ( not ( = ?auto_103471 ?auto_103469 ) ) ( not ( = ?auto_103472 ?auto_103469 ) ) ( not ( = ?auto_103466 ?auto_103472 ) ) ( not ( = ?auto_103466 ?auto_103471 ) ) ( not ( = ?auto_103467 ?auto_103472 ) ) ( not ( = ?auto_103467 ?auto_103471 ) ) ( not ( = ?auto_103470 ?auto_103472 ) ) ( not ( = ?auto_103470 ?auto_103471 ) ) ( not ( = ?auto_103468 ?auto_103472 ) ) ( not ( = ?auto_103468 ?auto_103471 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103471 ?auto_103472 ?auto_103469 )
      ( MAKE-2PILE ?auto_103466 ?auto_103467 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103473 - BLOCK
      ?auto_103474 - BLOCK
    )
    :vars
    (
      ?auto_103479 - BLOCK
      ?auto_103476 - BLOCK
      ?auto_103478 - BLOCK
      ?auto_103475 - BLOCK
      ?auto_103477 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103479 ?auto_103474 ) ( ON-TABLE ?auto_103473 ) ( ON ?auto_103474 ?auto_103473 ) ( not ( = ?auto_103473 ?auto_103474 ) ) ( not ( = ?auto_103473 ?auto_103479 ) ) ( not ( = ?auto_103474 ?auto_103479 ) ) ( not ( = ?auto_103473 ?auto_103476 ) ) ( not ( = ?auto_103473 ?auto_103478 ) ) ( not ( = ?auto_103474 ?auto_103476 ) ) ( not ( = ?auto_103474 ?auto_103478 ) ) ( not ( = ?auto_103479 ?auto_103476 ) ) ( not ( = ?auto_103479 ?auto_103478 ) ) ( not ( = ?auto_103476 ?auto_103478 ) ) ( ON ?auto_103476 ?auto_103479 ) ( CLEAR ?auto_103475 ) ( ON-TABLE ?auto_103477 ) ( ON ?auto_103475 ?auto_103477 ) ( not ( = ?auto_103477 ?auto_103475 ) ) ( not ( = ?auto_103477 ?auto_103478 ) ) ( not ( = ?auto_103475 ?auto_103478 ) ) ( not ( = ?auto_103473 ?auto_103475 ) ) ( not ( = ?auto_103473 ?auto_103477 ) ) ( not ( = ?auto_103474 ?auto_103475 ) ) ( not ( = ?auto_103474 ?auto_103477 ) ) ( not ( = ?auto_103479 ?auto_103475 ) ) ( not ( = ?auto_103479 ?auto_103477 ) ) ( not ( = ?auto_103476 ?auto_103475 ) ) ( not ( = ?auto_103476 ?auto_103477 ) ) ( ON ?auto_103478 ?auto_103476 ) ( CLEAR ?auto_103478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103473 ?auto_103474 ?auto_103479 ?auto_103476 )
      ( MAKE-2PILE ?auto_103473 ?auto_103474 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103480 - BLOCK
      ?auto_103481 - BLOCK
    )
    :vars
    (
      ?auto_103482 - BLOCK
      ?auto_103485 - BLOCK
      ?auto_103486 - BLOCK
      ?auto_103483 - BLOCK
      ?auto_103484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103482 ?auto_103481 ) ( ON-TABLE ?auto_103480 ) ( ON ?auto_103481 ?auto_103480 ) ( not ( = ?auto_103480 ?auto_103481 ) ) ( not ( = ?auto_103480 ?auto_103482 ) ) ( not ( = ?auto_103481 ?auto_103482 ) ) ( not ( = ?auto_103480 ?auto_103485 ) ) ( not ( = ?auto_103480 ?auto_103486 ) ) ( not ( = ?auto_103481 ?auto_103485 ) ) ( not ( = ?auto_103481 ?auto_103486 ) ) ( not ( = ?auto_103482 ?auto_103485 ) ) ( not ( = ?auto_103482 ?auto_103486 ) ) ( not ( = ?auto_103485 ?auto_103486 ) ) ( ON ?auto_103485 ?auto_103482 ) ( ON-TABLE ?auto_103483 ) ( not ( = ?auto_103483 ?auto_103484 ) ) ( not ( = ?auto_103483 ?auto_103486 ) ) ( not ( = ?auto_103484 ?auto_103486 ) ) ( not ( = ?auto_103480 ?auto_103484 ) ) ( not ( = ?auto_103480 ?auto_103483 ) ) ( not ( = ?auto_103481 ?auto_103484 ) ) ( not ( = ?auto_103481 ?auto_103483 ) ) ( not ( = ?auto_103482 ?auto_103484 ) ) ( not ( = ?auto_103482 ?auto_103483 ) ) ( not ( = ?auto_103485 ?auto_103484 ) ) ( not ( = ?auto_103485 ?auto_103483 ) ) ( ON ?auto_103486 ?auto_103485 ) ( CLEAR ?auto_103486 ) ( HOLDING ?auto_103484 ) ( CLEAR ?auto_103483 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103483 ?auto_103484 )
      ( MAKE-2PILE ?auto_103480 ?auto_103481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103487 - BLOCK
      ?auto_103488 - BLOCK
    )
    :vars
    (
      ?auto_103492 - BLOCK
      ?auto_103491 - BLOCK
      ?auto_103493 - BLOCK
      ?auto_103490 - BLOCK
      ?auto_103489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103492 ?auto_103488 ) ( ON-TABLE ?auto_103487 ) ( ON ?auto_103488 ?auto_103487 ) ( not ( = ?auto_103487 ?auto_103488 ) ) ( not ( = ?auto_103487 ?auto_103492 ) ) ( not ( = ?auto_103488 ?auto_103492 ) ) ( not ( = ?auto_103487 ?auto_103491 ) ) ( not ( = ?auto_103487 ?auto_103493 ) ) ( not ( = ?auto_103488 ?auto_103491 ) ) ( not ( = ?auto_103488 ?auto_103493 ) ) ( not ( = ?auto_103492 ?auto_103491 ) ) ( not ( = ?auto_103492 ?auto_103493 ) ) ( not ( = ?auto_103491 ?auto_103493 ) ) ( ON ?auto_103491 ?auto_103492 ) ( ON-TABLE ?auto_103490 ) ( not ( = ?auto_103490 ?auto_103489 ) ) ( not ( = ?auto_103490 ?auto_103493 ) ) ( not ( = ?auto_103489 ?auto_103493 ) ) ( not ( = ?auto_103487 ?auto_103489 ) ) ( not ( = ?auto_103487 ?auto_103490 ) ) ( not ( = ?auto_103488 ?auto_103489 ) ) ( not ( = ?auto_103488 ?auto_103490 ) ) ( not ( = ?auto_103492 ?auto_103489 ) ) ( not ( = ?auto_103492 ?auto_103490 ) ) ( not ( = ?auto_103491 ?auto_103489 ) ) ( not ( = ?auto_103491 ?auto_103490 ) ) ( ON ?auto_103493 ?auto_103491 ) ( CLEAR ?auto_103490 ) ( ON ?auto_103489 ?auto_103493 ) ( CLEAR ?auto_103489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103487 ?auto_103488 ?auto_103492 ?auto_103491 ?auto_103493 )
      ( MAKE-2PILE ?auto_103487 ?auto_103488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103494 - BLOCK
      ?auto_103495 - BLOCK
    )
    :vars
    (
      ?auto_103497 - BLOCK
      ?auto_103498 - BLOCK
      ?auto_103499 - BLOCK
      ?auto_103500 - BLOCK
      ?auto_103496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103497 ?auto_103495 ) ( ON-TABLE ?auto_103494 ) ( ON ?auto_103495 ?auto_103494 ) ( not ( = ?auto_103494 ?auto_103495 ) ) ( not ( = ?auto_103494 ?auto_103497 ) ) ( not ( = ?auto_103495 ?auto_103497 ) ) ( not ( = ?auto_103494 ?auto_103498 ) ) ( not ( = ?auto_103494 ?auto_103499 ) ) ( not ( = ?auto_103495 ?auto_103498 ) ) ( not ( = ?auto_103495 ?auto_103499 ) ) ( not ( = ?auto_103497 ?auto_103498 ) ) ( not ( = ?auto_103497 ?auto_103499 ) ) ( not ( = ?auto_103498 ?auto_103499 ) ) ( ON ?auto_103498 ?auto_103497 ) ( not ( = ?auto_103500 ?auto_103496 ) ) ( not ( = ?auto_103500 ?auto_103499 ) ) ( not ( = ?auto_103496 ?auto_103499 ) ) ( not ( = ?auto_103494 ?auto_103496 ) ) ( not ( = ?auto_103494 ?auto_103500 ) ) ( not ( = ?auto_103495 ?auto_103496 ) ) ( not ( = ?auto_103495 ?auto_103500 ) ) ( not ( = ?auto_103497 ?auto_103496 ) ) ( not ( = ?auto_103497 ?auto_103500 ) ) ( not ( = ?auto_103498 ?auto_103496 ) ) ( not ( = ?auto_103498 ?auto_103500 ) ) ( ON ?auto_103499 ?auto_103498 ) ( ON ?auto_103496 ?auto_103499 ) ( CLEAR ?auto_103496 ) ( HOLDING ?auto_103500 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103500 )
      ( MAKE-2PILE ?auto_103494 ?auto_103495 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103510 - BLOCK
      ?auto_103511 - BLOCK
    )
    :vars
    (
      ?auto_103512 - BLOCK
      ?auto_103513 - BLOCK
      ?auto_103514 - BLOCK
      ?auto_103515 - BLOCK
      ?auto_103516 - BLOCK
      ?auto_103517 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103512 ?auto_103511 ) ( ON-TABLE ?auto_103510 ) ( ON ?auto_103511 ?auto_103510 ) ( not ( = ?auto_103510 ?auto_103511 ) ) ( not ( = ?auto_103510 ?auto_103512 ) ) ( not ( = ?auto_103511 ?auto_103512 ) ) ( not ( = ?auto_103510 ?auto_103513 ) ) ( not ( = ?auto_103510 ?auto_103514 ) ) ( not ( = ?auto_103511 ?auto_103513 ) ) ( not ( = ?auto_103511 ?auto_103514 ) ) ( not ( = ?auto_103512 ?auto_103513 ) ) ( not ( = ?auto_103512 ?auto_103514 ) ) ( not ( = ?auto_103513 ?auto_103514 ) ) ( ON ?auto_103513 ?auto_103512 ) ( not ( = ?auto_103515 ?auto_103516 ) ) ( not ( = ?auto_103515 ?auto_103514 ) ) ( not ( = ?auto_103516 ?auto_103514 ) ) ( not ( = ?auto_103510 ?auto_103516 ) ) ( not ( = ?auto_103510 ?auto_103515 ) ) ( not ( = ?auto_103511 ?auto_103516 ) ) ( not ( = ?auto_103511 ?auto_103515 ) ) ( not ( = ?auto_103512 ?auto_103516 ) ) ( not ( = ?auto_103512 ?auto_103515 ) ) ( not ( = ?auto_103513 ?auto_103516 ) ) ( not ( = ?auto_103513 ?auto_103515 ) ) ( ON ?auto_103514 ?auto_103513 ) ( ON ?auto_103516 ?auto_103514 ) ( CLEAR ?auto_103516 ) ( ON ?auto_103515 ?auto_103517 ) ( CLEAR ?auto_103515 ) ( HAND-EMPTY ) ( not ( = ?auto_103510 ?auto_103517 ) ) ( not ( = ?auto_103511 ?auto_103517 ) ) ( not ( = ?auto_103512 ?auto_103517 ) ) ( not ( = ?auto_103513 ?auto_103517 ) ) ( not ( = ?auto_103514 ?auto_103517 ) ) ( not ( = ?auto_103515 ?auto_103517 ) ) ( not ( = ?auto_103516 ?auto_103517 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103515 ?auto_103517 )
      ( MAKE-2PILE ?auto_103510 ?auto_103511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103518 - BLOCK
      ?auto_103519 - BLOCK
    )
    :vars
    (
      ?auto_103523 - BLOCK
      ?auto_103522 - BLOCK
      ?auto_103521 - BLOCK
      ?auto_103525 - BLOCK
      ?auto_103520 - BLOCK
      ?auto_103524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103523 ?auto_103519 ) ( ON-TABLE ?auto_103518 ) ( ON ?auto_103519 ?auto_103518 ) ( not ( = ?auto_103518 ?auto_103519 ) ) ( not ( = ?auto_103518 ?auto_103523 ) ) ( not ( = ?auto_103519 ?auto_103523 ) ) ( not ( = ?auto_103518 ?auto_103522 ) ) ( not ( = ?auto_103518 ?auto_103521 ) ) ( not ( = ?auto_103519 ?auto_103522 ) ) ( not ( = ?auto_103519 ?auto_103521 ) ) ( not ( = ?auto_103523 ?auto_103522 ) ) ( not ( = ?auto_103523 ?auto_103521 ) ) ( not ( = ?auto_103522 ?auto_103521 ) ) ( ON ?auto_103522 ?auto_103523 ) ( not ( = ?auto_103525 ?auto_103520 ) ) ( not ( = ?auto_103525 ?auto_103521 ) ) ( not ( = ?auto_103520 ?auto_103521 ) ) ( not ( = ?auto_103518 ?auto_103520 ) ) ( not ( = ?auto_103518 ?auto_103525 ) ) ( not ( = ?auto_103519 ?auto_103520 ) ) ( not ( = ?auto_103519 ?auto_103525 ) ) ( not ( = ?auto_103523 ?auto_103520 ) ) ( not ( = ?auto_103523 ?auto_103525 ) ) ( not ( = ?auto_103522 ?auto_103520 ) ) ( not ( = ?auto_103522 ?auto_103525 ) ) ( ON ?auto_103521 ?auto_103522 ) ( ON ?auto_103525 ?auto_103524 ) ( CLEAR ?auto_103525 ) ( not ( = ?auto_103518 ?auto_103524 ) ) ( not ( = ?auto_103519 ?auto_103524 ) ) ( not ( = ?auto_103523 ?auto_103524 ) ) ( not ( = ?auto_103522 ?auto_103524 ) ) ( not ( = ?auto_103521 ?auto_103524 ) ) ( not ( = ?auto_103525 ?auto_103524 ) ) ( not ( = ?auto_103520 ?auto_103524 ) ) ( HOLDING ?auto_103520 ) ( CLEAR ?auto_103521 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103518 ?auto_103519 ?auto_103523 ?auto_103522 ?auto_103521 ?auto_103520 )
      ( MAKE-2PILE ?auto_103518 ?auto_103519 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103526 - BLOCK
      ?auto_103527 - BLOCK
    )
    :vars
    (
      ?auto_103533 - BLOCK
      ?auto_103528 - BLOCK
      ?auto_103532 - BLOCK
      ?auto_103530 - BLOCK
      ?auto_103531 - BLOCK
      ?auto_103529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103533 ?auto_103527 ) ( ON-TABLE ?auto_103526 ) ( ON ?auto_103527 ?auto_103526 ) ( not ( = ?auto_103526 ?auto_103527 ) ) ( not ( = ?auto_103526 ?auto_103533 ) ) ( not ( = ?auto_103527 ?auto_103533 ) ) ( not ( = ?auto_103526 ?auto_103528 ) ) ( not ( = ?auto_103526 ?auto_103532 ) ) ( not ( = ?auto_103527 ?auto_103528 ) ) ( not ( = ?auto_103527 ?auto_103532 ) ) ( not ( = ?auto_103533 ?auto_103528 ) ) ( not ( = ?auto_103533 ?auto_103532 ) ) ( not ( = ?auto_103528 ?auto_103532 ) ) ( ON ?auto_103528 ?auto_103533 ) ( not ( = ?auto_103530 ?auto_103531 ) ) ( not ( = ?auto_103530 ?auto_103532 ) ) ( not ( = ?auto_103531 ?auto_103532 ) ) ( not ( = ?auto_103526 ?auto_103531 ) ) ( not ( = ?auto_103526 ?auto_103530 ) ) ( not ( = ?auto_103527 ?auto_103531 ) ) ( not ( = ?auto_103527 ?auto_103530 ) ) ( not ( = ?auto_103533 ?auto_103531 ) ) ( not ( = ?auto_103533 ?auto_103530 ) ) ( not ( = ?auto_103528 ?auto_103531 ) ) ( not ( = ?auto_103528 ?auto_103530 ) ) ( ON ?auto_103532 ?auto_103528 ) ( ON ?auto_103530 ?auto_103529 ) ( not ( = ?auto_103526 ?auto_103529 ) ) ( not ( = ?auto_103527 ?auto_103529 ) ) ( not ( = ?auto_103533 ?auto_103529 ) ) ( not ( = ?auto_103528 ?auto_103529 ) ) ( not ( = ?auto_103532 ?auto_103529 ) ) ( not ( = ?auto_103530 ?auto_103529 ) ) ( not ( = ?auto_103531 ?auto_103529 ) ) ( CLEAR ?auto_103532 ) ( ON ?auto_103531 ?auto_103530 ) ( CLEAR ?auto_103531 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103529 ?auto_103530 )
      ( MAKE-2PILE ?auto_103526 ?auto_103527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_103534 - BLOCK
      ?auto_103535 - BLOCK
    )
    :vars
    (
      ?auto_103540 - BLOCK
      ?auto_103539 - BLOCK
      ?auto_103541 - BLOCK
      ?auto_103538 - BLOCK
      ?auto_103536 - BLOCK
      ?auto_103537 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103540 ?auto_103535 ) ( ON-TABLE ?auto_103534 ) ( ON ?auto_103535 ?auto_103534 ) ( not ( = ?auto_103534 ?auto_103535 ) ) ( not ( = ?auto_103534 ?auto_103540 ) ) ( not ( = ?auto_103535 ?auto_103540 ) ) ( not ( = ?auto_103534 ?auto_103539 ) ) ( not ( = ?auto_103534 ?auto_103541 ) ) ( not ( = ?auto_103535 ?auto_103539 ) ) ( not ( = ?auto_103535 ?auto_103541 ) ) ( not ( = ?auto_103540 ?auto_103539 ) ) ( not ( = ?auto_103540 ?auto_103541 ) ) ( not ( = ?auto_103539 ?auto_103541 ) ) ( ON ?auto_103539 ?auto_103540 ) ( not ( = ?auto_103538 ?auto_103536 ) ) ( not ( = ?auto_103538 ?auto_103541 ) ) ( not ( = ?auto_103536 ?auto_103541 ) ) ( not ( = ?auto_103534 ?auto_103536 ) ) ( not ( = ?auto_103534 ?auto_103538 ) ) ( not ( = ?auto_103535 ?auto_103536 ) ) ( not ( = ?auto_103535 ?auto_103538 ) ) ( not ( = ?auto_103540 ?auto_103536 ) ) ( not ( = ?auto_103540 ?auto_103538 ) ) ( not ( = ?auto_103539 ?auto_103536 ) ) ( not ( = ?auto_103539 ?auto_103538 ) ) ( ON ?auto_103538 ?auto_103537 ) ( not ( = ?auto_103534 ?auto_103537 ) ) ( not ( = ?auto_103535 ?auto_103537 ) ) ( not ( = ?auto_103540 ?auto_103537 ) ) ( not ( = ?auto_103539 ?auto_103537 ) ) ( not ( = ?auto_103541 ?auto_103537 ) ) ( not ( = ?auto_103538 ?auto_103537 ) ) ( not ( = ?auto_103536 ?auto_103537 ) ) ( ON ?auto_103536 ?auto_103538 ) ( CLEAR ?auto_103536 ) ( ON-TABLE ?auto_103537 ) ( HOLDING ?auto_103541 ) ( CLEAR ?auto_103539 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103534 ?auto_103535 ?auto_103540 ?auto_103539 ?auto_103541 )
      ( MAKE-2PILE ?auto_103534 ?auto_103535 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103585 - BLOCK
      ?auto_103586 - BLOCK
      ?auto_103587 - BLOCK
      ?auto_103588 - BLOCK
      ?auto_103589 - BLOCK
    )
    :vars
    (
      ?auto_103590 - BLOCK
      ?auto_103591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103585 ) ( ON ?auto_103586 ?auto_103585 ) ( ON ?auto_103587 ?auto_103586 ) ( not ( = ?auto_103585 ?auto_103586 ) ) ( not ( = ?auto_103585 ?auto_103587 ) ) ( not ( = ?auto_103585 ?auto_103588 ) ) ( not ( = ?auto_103585 ?auto_103589 ) ) ( not ( = ?auto_103586 ?auto_103587 ) ) ( not ( = ?auto_103586 ?auto_103588 ) ) ( not ( = ?auto_103586 ?auto_103589 ) ) ( not ( = ?auto_103587 ?auto_103588 ) ) ( not ( = ?auto_103587 ?auto_103589 ) ) ( not ( = ?auto_103588 ?auto_103589 ) ) ( ON ?auto_103589 ?auto_103590 ) ( not ( = ?auto_103585 ?auto_103590 ) ) ( not ( = ?auto_103586 ?auto_103590 ) ) ( not ( = ?auto_103587 ?auto_103590 ) ) ( not ( = ?auto_103588 ?auto_103590 ) ) ( not ( = ?auto_103589 ?auto_103590 ) ) ( CLEAR ?auto_103587 ) ( ON ?auto_103588 ?auto_103589 ) ( CLEAR ?auto_103588 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103591 ) ( ON ?auto_103590 ?auto_103591 ) ( not ( = ?auto_103591 ?auto_103590 ) ) ( not ( = ?auto_103591 ?auto_103589 ) ) ( not ( = ?auto_103591 ?auto_103588 ) ) ( not ( = ?auto_103585 ?auto_103591 ) ) ( not ( = ?auto_103586 ?auto_103591 ) ) ( not ( = ?auto_103587 ?auto_103591 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103591 ?auto_103590 ?auto_103589 )
      ( MAKE-5PILE ?auto_103585 ?auto_103586 ?auto_103587 ?auto_103588 ?auto_103589 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103592 - BLOCK
      ?auto_103593 - BLOCK
      ?auto_103594 - BLOCK
      ?auto_103595 - BLOCK
      ?auto_103596 - BLOCK
    )
    :vars
    (
      ?auto_103598 - BLOCK
      ?auto_103597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103592 ) ( ON ?auto_103593 ?auto_103592 ) ( not ( = ?auto_103592 ?auto_103593 ) ) ( not ( = ?auto_103592 ?auto_103594 ) ) ( not ( = ?auto_103592 ?auto_103595 ) ) ( not ( = ?auto_103592 ?auto_103596 ) ) ( not ( = ?auto_103593 ?auto_103594 ) ) ( not ( = ?auto_103593 ?auto_103595 ) ) ( not ( = ?auto_103593 ?auto_103596 ) ) ( not ( = ?auto_103594 ?auto_103595 ) ) ( not ( = ?auto_103594 ?auto_103596 ) ) ( not ( = ?auto_103595 ?auto_103596 ) ) ( ON ?auto_103596 ?auto_103598 ) ( not ( = ?auto_103592 ?auto_103598 ) ) ( not ( = ?auto_103593 ?auto_103598 ) ) ( not ( = ?auto_103594 ?auto_103598 ) ) ( not ( = ?auto_103595 ?auto_103598 ) ) ( not ( = ?auto_103596 ?auto_103598 ) ) ( ON ?auto_103595 ?auto_103596 ) ( CLEAR ?auto_103595 ) ( ON-TABLE ?auto_103597 ) ( ON ?auto_103598 ?auto_103597 ) ( not ( = ?auto_103597 ?auto_103598 ) ) ( not ( = ?auto_103597 ?auto_103596 ) ) ( not ( = ?auto_103597 ?auto_103595 ) ) ( not ( = ?auto_103592 ?auto_103597 ) ) ( not ( = ?auto_103593 ?auto_103597 ) ) ( not ( = ?auto_103594 ?auto_103597 ) ) ( HOLDING ?auto_103594 ) ( CLEAR ?auto_103593 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103592 ?auto_103593 ?auto_103594 )
      ( MAKE-5PILE ?auto_103592 ?auto_103593 ?auto_103594 ?auto_103595 ?auto_103596 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103599 - BLOCK
      ?auto_103600 - BLOCK
      ?auto_103601 - BLOCK
      ?auto_103602 - BLOCK
      ?auto_103603 - BLOCK
    )
    :vars
    (
      ?auto_103604 - BLOCK
      ?auto_103605 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103599 ) ( ON ?auto_103600 ?auto_103599 ) ( not ( = ?auto_103599 ?auto_103600 ) ) ( not ( = ?auto_103599 ?auto_103601 ) ) ( not ( = ?auto_103599 ?auto_103602 ) ) ( not ( = ?auto_103599 ?auto_103603 ) ) ( not ( = ?auto_103600 ?auto_103601 ) ) ( not ( = ?auto_103600 ?auto_103602 ) ) ( not ( = ?auto_103600 ?auto_103603 ) ) ( not ( = ?auto_103601 ?auto_103602 ) ) ( not ( = ?auto_103601 ?auto_103603 ) ) ( not ( = ?auto_103602 ?auto_103603 ) ) ( ON ?auto_103603 ?auto_103604 ) ( not ( = ?auto_103599 ?auto_103604 ) ) ( not ( = ?auto_103600 ?auto_103604 ) ) ( not ( = ?auto_103601 ?auto_103604 ) ) ( not ( = ?auto_103602 ?auto_103604 ) ) ( not ( = ?auto_103603 ?auto_103604 ) ) ( ON ?auto_103602 ?auto_103603 ) ( ON-TABLE ?auto_103605 ) ( ON ?auto_103604 ?auto_103605 ) ( not ( = ?auto_103605 ?auto_103604 ) ) ( not ( = ?auto_103605 ?auto_103603 ) ) ( not ( = ?auto_103605 ?auto_103602 ) ) ( not ( = ?auto_103599 ?auto_103605 ) ) ( not ( = ?auto_103600 ?auto_103605 ) ) ( not ( = ?auto_103601 ?auto_103605 ) ) ( CLEAR ?auto_103600 ) ( ON ?auto_103601 ?auto_103602 ) ( CLEAR ?auto_103601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103605 ?auto_103604 ?auto_103603 ?auto_103602 )
      ( MAKE-5PILE ?auto_103599 ?auto_103600 ?auto_103601 ?auto_103602 ?auto_103603 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103606 - BLOCK
      ?auto_103607 - BLOCK
      ?auto_103608 - BLOCK
      ?auto_103609 - BLOCK
      ?auto_103610 - BLOCK
    )
    :vars
    (
      ?auto_103611 - BLOCK
      ?auto_103612 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103606 ) ( not ( = ?auto_103606 ?auto_103607 ) ) ( not ( = ?auto_103606 ?auto_103608 ) ) ( not ( = ?auto_103606 ?auto_103609 ) ) ( not ( = ?auto_103606 ?auto_103610 ) ) ( not ( = ?auto_103607 ?auto_103608 ) ) ( not ( = ?auto_103607 ?auto_103609 ) ) ( not ( = ?auto_103607 ?auto_103610 ) ) ( not ( = ?auto_103608 ?auto_103609 ) ) ( not ( = ?auto_103608 ?auto_103610 ) ) ( not ( = ?auto_103609 ?auto_103610 ) ) ( ON ?auto_103610 ?auto_103611 ) ( not ( = ?auto_103606 ?auto_103611 ) ) ( not ( = ?auto_103607 ?auto_103611 ) ) ( not ( = ?auto_103608 ?auto_103611 ) ) ( not ( = ?auto_103609 ?auto_103611 ) ) ( not ( = ?auto_103610 ?auto_103611 ) ) ( ON ?auto_103609 ?auto_103610 ) ( ON-TABLE ?auto_103612 ) ( ON ?auto_103611 ?auto_103612 ) ( not ( = ?auto_103612 ?auto_103611 ) ) ( not ( = ?auto_103612 ?auto_103610 ) ) ( not ( = ?auto_103612 ?auto_103609 ) ) ( not ( = ?auto_103606 ?auto_103612 ) ) ( not ( = ?auto_103607 ?auto_103612 ) ) ( not ( = ?auto_103608 ?auto_103612 ) ) ( ON ?auto_103608 ?auto_103609 ) ( CLEAR ?auto_103608 ) ( HOLDING ?auto_103607 ) ( CLEAR ?auto_103606 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103606 ?auto_103607 )
      ( MAKE-5PILE ?auto_103606 ?auto_103607 ?auto_103608 ?auto_103609 ?auto_103610 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103613 - BLOCK
      ?auto_103614 - BLOCK
      ?auto_103615 - BLOCK
      ?auto_103616 - BLOCK
      ?auto_103617 - BLOCK
    )
    :vars
    (
      ?auto_103618 - BLOCK
      ?auto_103619 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103613 ) ( not ( = ?auto_103613 ?auto_103614 ) ) ( not ( = ?auto_103613 ?auto_103615 ) ) ( not ( = ?auto_103613 ?auto_103616 ) ) ( not ( = ?auto_103613 ?auto_103617 ) ) ( not ( = ?auto_103614 ?auto_103615 ) ) ( not ( = ?auto_103614 ?auto_103616 ) ) ( not ( = ?auto_103614 ?auto_103617 ) ) ( not ( = ?auto_103615 ?auto_103616 ) ) ( not ( = ?auto_103615 ?auto_103617 ) ) ( not ( = ?auto_103616 ?auto_103617 ) ) ( ON ?auto_103617 ?auto_103618 ) ( not ( = ?auto_103613 ?auto_103618 ) ) ( not ( = ?auto_103614 ?auto_103618 ) ) ( not ( = ?auto_103615 ?auto_103618 ) ) ( not ( = ?auto_103616 ?auto_103618 ) ) ( not ( = ?auto_103617 ?auto_103618 ) ) ( ON ?auto_103616 ?auto_103617 ) ( ON-TABLE ?auto_103619 ) ( ON ?auto_103618 ?auto_103619 ) ( not ( = ?auto_103619 ?auto_103618 ) ) ( not ( = ?auto_103619 ?auto_103617 ) ) ( not ( = ?auto_103619 ?auto_103616 ) ) ( not ( = ?auto_103613 ?auto_103619 ) ) ( not ( = ?auto_103614 ?auto_103619 ) ) ( not ( = ?auto_103615 ?auto_103619 ) ) ( ON ?auto_103615 ?auto_103616 ) ( CLEAR ?auto_103613 ) ( ON ?auto_103614 ?auto_103615 ) ( CLEAR ?auto_103614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103619 ?auto_103618 ?auto_103617 ?auto_103616 ?auto_103615 )
      ( MAKE-5PILE ?auto_103613 ?auto_103614 ?auto_103615 ?auto_103616 ?auto_103617 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103620 - BLOCK
      ?auto_103621 - BLOCK
      ?auto_103622 - BLOCK
      ?auto_103623 - BLOCK
      ?auto_103624 - BLOCK
    )
    :vars
    (
      ?auto_103626 - BLOCK
      ?auto_103625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103620 ?auto_103621 ) ) ( not ( = ?auto_103620 ?auto_103622 ) ) ( not ( = ?auto_103620 ?auto_103623 ) ) ( not ( = ?auto_103620 ?auto_103624 ) ) ( not ( = ?auto_103621 ?auto_103622 ) ) ( not ( = ?auto_103621 ?auto_103623 ) ) ( not ( = ?auto_103621 ?auto_103624 ) ) ( not ( = ?auto_103622 ?auto_103623 ) ) ( not ( = ?auto_103622 ?auto_103624 ) ) ( not ( = ?auto_103623 ?auto_103624 ) ) ( ON ?auto_103624 ?auto_103626 ) ( not ( = ?auto_103620 ?auto_103626 ) ) ( not ( = ?auto_103621 ?auto_103626 ) ) ( not ( = ?auto_103622 ?auto_103626 ) ) ( not ( = ?auto_103623 ?auto_103626 ) ) ( not ( = ?auto_103624 ?auto_103626 ) ) ( ON ?auto_103623 ?auto_103624 ) ( ON-TABLE ?auto_103625 ) ( ON ?auto_103626 ?auto_103625 ) ( not ( = ?auto_103625 ?auto_103626 ) ) ( not ( = ?auto_103625 ?auto_103624 ) ) ( not ( = ?auto_103625 ?auto_103623 ) ) ( not ( = ?auto_103620 ?auto_103625 ) ) ( not ( = ?auto_103621 ?auto_103625 ) ) ( not ( = ?auto_103622 ?auto_103625 ) ) ( ON ?auto_103622 ?auto_103623 ) ( ON ?auto_103621 ?auto_103622 ) ( CLEAR ?auto_103621 ) ( HOLDING ?auto_103620 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103620 )
      ( MAKE-5PILE ?auto_103620 ?auto_103621 ?auto_103622 ?auto_103623 ?auto_103624 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103627 - BLOCK
      ?auto_103628 - BLOCK
      ?auto_103629 - BLOCK
      ?auto_103630 - BLOCK
      ?auto_103631 - BLOCK
    )
    :vars
    (
      ?auto_103632 - BLOCK
      ?auto_103633 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103627 ?auto_103628 ) ) ( not ( = ?auto_103627 ?auto_103629 ) ) ( not ( = ?auto_103627 ?auto_103630 ) ) ( not ( = ?auto_103627 ?auto_103631 ) ) ( not ( = ?auto_103628 ?auto_103629 ) ) ( not ( = ?auto_103628 ?auto_103630 ) ) ( not ( = ?auto_103628 ?auto_103631 ) ) ( not ( = ?auto_103629 ?auto_103630 ) ) ( not ( = ?auto_103629 ?auto_103631 ) ) ( not ( = ?auto_103630 ?auto_103631 ) ) ( ON ?auto_103631 ?auto_103632 ) ( not ( = ?auto_103627 ?auto_103632 ) ) ( not ( = ?auto_103628 ?auto_103632 ) ) ( not ( = ?auto_103629 ?auto_103632 ) ) ( not ( = ?auto_103630 ?auto_103632 ) ) ( not ( = ?auto_103631 ?auto_103632 ) ) ( ON ?auto_103630 ?auto_103631 ) ( ON-TABLE ?auto_103633 ) ( ON ?auto_103632 ?auto_103633 ) ( not ( = ?auto_103633 ?auto_103632 ) ) ( not ( = ?auto_103633 ?auto_103631 ) ) ( not ( = ?auto_103633 ?auto_103630 ) ) ( not ( = ?auto_103627 ?auto_103633 ) ) ( not ( = ?auto_103628 ?auto_103633 ) ) ( not ( = ?auto_103629 ?auto_103633 ) ) ( ON ?auto_103629 ?auto_103630 ) ( ON ?auto_103628 ?auto_103629 ) ( ON ?auto_103627 ?auto_103628 ) ( CLEAR ?auto_103627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103633 ?auto_103632 ?auto_103631 ?auto_103630 ?auto_103629 ?auto_103628 )
      ( MAKE-5PILE ?auto_103627 ?auto_103628 ?auto_103629 ?auto_103630 ?auto_103631 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103639 - BLOCK
      ?auto_103640 - BLOCK
      ?auto_103641 - BLOCK
      ?auto_103642 - BLOCK
      ?auto_103643 - BLOCK
    )
    :vars
    (
      ?auto_103644 - BLOCK
      ?auto_103645 - BLOCK
      ?auto_103646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103639 ?auto_103640 ) ) ( not ( = ?auto_103639 ?auto_103641 ) ) ( not ( = ?auto_103639 ?auto_103642 ) ) ( not ( = ?auto_103639 ?auto_103643 ) ) ( not ( = ?auto_103640 ?auto_103641 ) ) ( not ( = ?auto_103640 ?auto_103642 ) ) ( not ( = ?auto_103640 ?auto_103643 ) ) ( not ( = ?auto_103641 ?auto_103642 ) ) ( not ( = ?auto_103641 ?auto_103643 ) ) ( not ( = ?auto_103642 ?auto_103643 ) ) ( ON ?auto_103643 ?auto_103644 ) ( not ( = ?auto_103639 ?auto_103644 ) ) ( not ( = ?auto_103640 ?auto_103644 ) ) ( not ( = ?auto_103641 ?auto_103644 ) ) ( not ( = ?auto_103642 ?auto_103644 ) ) ( not ( = ?auto_103643 ?auto_103644 ) ) ( ON ?auto_103642 ?auto_103643 ) ( ON-TABLE ?auto_103645 ) ( ON ?auto_103644 ?auto_103645 ) ( not ( = ?auto_103645 ?auto_103644 ) ) ( not ( = ?auto_103645 ?auto_103643 ) ) ( not ( = ?auto_103645 ?auto_103642 ) ) ( not ( = ?auto_103639 ?auto_103645 ) ) ( not ( = ?auto_103640 ?auto_103645 ) ) ( not ( = ?auto_103641 ?auto_103645 ) ) ( ON ?auto_103641 ?auto_103642 ) ( ON ?auto_103640 ?auto_103641 ) ( CLEAR ?auto_103640 ) ( ON ?auto_103639 ?auto_103646 ) ( CLEAR ?auto_103639 ) ( HAND-EMPTY ) ( not ( = ?auto_103639 ?auto_103646 ) ) ( not ( = ?auto_103640 ?auto_103646 ) ) ( not ( = ?auto_103641 ?auto_103646 ) ) ( not ( = ?auto_103642 ?auto_103646 ) ) ( not ( = ?auto_103643 ?auto_103646 ) ) ( not ( = ?auto_103644 ?auto_103646 ) ) ( not ( = ?auto_103645 ?auto_103646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103639 ?auto_103646 )
      ( MAKE-5PILE ?auto_103639 ?auto_103640 ?auto_103641 ?auto_103642 ?auto_103643 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103647 - BLOCK
      ?auto_103648 - BLOCK
      ?auto_103649 - BLOCK
      ?auto_103650 - BLOCK
      ?auto_103651 - BLOCK
    )
    :vars
    (
      ?auto_103654 - BLOCK
      ?auto_103653 - BLOCK
      ?auto_103652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103647 ?auto_103648 ) ) ( not ( = ?auto_103647 ?auto_103649 ) ) ( not ( = ?auto_103647 ?auto_103650 ) ) ( not ( = ?auto_103647 ?auto_103651 ) ) ( not ( = ?auto_103648 ?auto_103649 ) ) ( not ( = ?auto_103648 ?auto_103650 ) ) ( not ( = ?auto_103648 ?auto_103651 ) ) ( not ( = ?auto_103649 ?auto_103650 ) ) ( not ( = ?auto_103649 ?auto_103651 ) ) ( not ( = ?auto_103650 ?auto_103651 ) ) ( ON ?auto_103651 ?auto_103654 ) ( not ( = ?auto_103647 ?auto_103654 ) ) ( not ( = ?auto_103648 ?auto_103654 ) ) ( not ( = ?auto_103649 ?auto_103654 ) ) ( not ( = ?auto_103650 ?auto_103654 ) ) ( not ( = ?auto_103651 ?auto_103654 ) ) ( ON ?auto_103650 ?auto_103651 ) ( ON-TABLE ?auto_103653 ) ( ON ?auto_103654 ?auto_103653 ) ( not ( = ?auto_103653 ?auto_103654 ) ) ( not ( = ?auto_103653 ?auto_103651 ) ) ( not ( = ?auto_103653 ?auto_103650 ) ) ( not ( = ?auto_103647 ?auto_103653 ) ) ( not ( = ?auto_103648 ?auto_103653 ) ) ( not ( = ?auto_103649 ?auto_103653 ) ) ( ON ?auto_103649 ?auto_103650 ) ( ON ?auto_103647 ?auto_103652 ) ( CLEAR ?auto_103647 ) ( not ( = ?auto_103647 ?auto_103652 ) ) ( not ( = ?auto_103648 ?auto_103652 ) ) ( not ( = ?auto_103649 ?auto_103652 ) ) ( not ( = ?auto_103650 ?auto_103652 ) ) ( not ( = ?auto_103651 ?auto_103652 ) ) ( not ( = ?auto_103654 ?auto_103652 ) ) ( not ( = ?auto_103653 ?auto_103652 ) ) ( HOLDING ?auto_103648 ) ( CLEAR ?auto_103649 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103653 ?auto_103654 ?auto_103651 ?auto_103650 ?auto_103649 ?auto_103648 )
      ( MAKE-5PILE ?auto_103647 ?auto_103648 ?auto_103649 ?auto_103650 ?auto_103651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103655 - BLOCK
      ?auto_103656 - BLOCK
      ?auto_103657 - BLOCK
      ?auto_103658 - BLOCK
      ?auto_103659 - BLOCK
    )
    :vars
    (
      ?auto_103662 - BLOCK
      ?auto_103660 - BLOCK
      ?auto_103661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103655 ?auto_103656 ) ) ( not ( = ?auto_103655 ?auto_103657 ) ) ( not ( = ?auto_103655 ?auto_103658 ) ) ( not ( = ?auto_103655 ?auto_103659 ) ) ( not ( = ?auto_103656 ?auto_103657 ) ) ( not ( = ?auto_103656 ?auto_103658 ) ) ( not ( = ?auto_103656 ?auto_103659 ) ) ( not ( = ?auto_103657 ?auto_103658 ) ) ( not ( = ?auto_103657 ?auto_103659 ) ) ( not ( = ?auto_103658 ?auto_103659 ) ) ( ON ?auto_103659 ?auto_103662 ) ( not ( = ?auto_103655 ?auto_103662 ) ) ( not ( = ?auto_103656 ?auto_103662 ) ) ( not ( = ?auto_103657 ?auto_103662 ) ) ( not ( = ?auto_103658 ?auto_103662 ) ) ( not ( = ?auto_103659 ?auto_103662 ) ) ( ON ?auto_103658 ?auto_103659 ) ( ON-TABLE ?auto_103660 ) ( ON ?auto_103662 ?auto_103660 ) ( not ( = ?auto_103660 ?auto_103662 ) ) ( not ( = ?auto_103660 ?auto_103659 ) ) ( not ( = ?auto_103660 ?auto_103658 ) ) ( not ( = ?auto_103655 ?auto_103660 ) ) ( not ( = ?auto_103656 ?auto_103660 ) ) ( not ( = ?auto_103657 ?auto_103660 ) ) ( ON ?auto_103657 ?auto_103658 ) ( ON ?auto_103655 ?auto_103661 ) ( not ( = ?auto_103655 ?auto_103661 ) ) ( not ( = ?auto_103656 ?auto_103661 ) ) ( not ( = ?auto_103657 ?auto_103661 ) ) ( not ( = ?auto_103658 ?auto_103661 ) ) ( not ( = ?auto_103659 ?auto_103661 ) ) ( not ( = ?auto_103662 ?auto_103661 ) ) ( not ( = ?auto_103660 ?auto_103661 ) ) ( CLEAR ?auto_103657 ) ( ON ?auto_103656 ?auto_103655 ) ( CLEAR ?auto_103656 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103661 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103661 ?auto_103655 )
      ( MAKE-5PILE ?auto_103655 ?auto_103656 ?auto_103657 ?auto_103658 ?auto_103659 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103663 - BLOCK
      ?auto_103664 - BLOCK
      ?auto_103665 - BLOCK
      ?auto_103666 - BLOCK
      ?auto_103667 - BLOCK
    )
    :vars
    (
      ?auto_103668 - BLOCK
      ?auto_103669 - BLOCK
      ?auto_103670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103663 ?auto_103664 ) ) ( not ( = ?auto_103663 ?auto_103665 ) ) ( not ( = ?auto_103663 ?auto_103666 ) ) ( not ( = ?auto_103663 ?auto_103667 ) ) ( not ( = ?auto_103664 ?auto_103665 ) ) ( not ( = ?auto_103664 ?auto_103666 ) ) ( not ( = ?auto_103664 ?auto_103667 ) ) ( not ( = ?auto_103665 ?auto_103666 ) ) ( not ( = ?auto_103665 ?auto_103667 ) ) ( not ( = ?auto_103666 ?auto_103667 ) ) ( ON ?auto_103667 ?auto_103668 ) ( not ( = ?auto_103663 ?auto_103668 ) ) ( not ( = ?auto_103664 ?auto_103668 ) ) ( not ( = ?auto_103665 ?auto_103668 ) ) ( not ( = ?auto_103666 ?auto_103668 ) ) ( not ( = ?auto_103667 ?auto_103668 ) ) ( ON ?auto_103666 ?auto_103667 ) ( ON-TABLE ?auto_103669 ) ( ON ?auto_103668 ?auto_103669 ) ( not ( = ?auto_103669 ?auto_103668 ) ) ( not ( = ?auto_103669 ?auto_103667 ) ) ( not ( = ?auto_103669 ?auto_103666 ) ) ( not ( = ?auto_103663 ?auto_103669 ) ) ( not ( = ?auto_103664 ?auto_103669 ) ) ( not ( = ?auto_103665 ?auto_103669 ) ) ( ON ?auto_103663 ?auto_103670 ) ( not ( = ?auto_103663 ?auto_103670 ) ) ( not ( = ?auto_103664 ?auto_103670 ) ) ( not ( = ?auto_103665 ?auto_103670 ) ) ( not ( = ?auto_103666 ?auto_103670 ) ) ( not ( = ?auto_103667 ?auto_103670 ) ) ( not ( = ?auto_103668 ?auto_103670 ) ) ( not ( = ?auto_103669 ?auto_103670 ) ) ( ON ?auto_103664 ?auto_103663 ) ( CLEAR ?auto_103664 ) ( ON-TABLE ?auto_103670 ) ( HOLDING ?auto_103665 ) ( CLEAR ?auto_103666 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103669 ?auto_103668 ?auto_103667 ?auto_103666 ?auto_103665 )
      ( MAKE-5PILE ?auto_103663 ?auto_103664 ?auto_103665 ?auto_103666 ?auto_103667 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103671 - BLOCK
      ?auto_103672 - BLOCK
      ?auto_103673 - BLOCK
      ?auto_103674 - BLOCK
      ?auto_103675 - BLOCK
    )
    :vars
    (
      ?auto_103676 - BLOCK
      ?auto_103678 - BLOCK
      ?auto_103677 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103671 ?auto_103672 ) ) ( not ( = ?auto_103671 ?auto_103673 ) ) ( not ( = ?auto_103671 ?auto_103674 ) ) ( not ( = ?auto_103671 ?auto_103675 ) ) ( not ( = ?auto_103672 ?auto_103673 ) ) ( not ( = ?auto_103672 ?auto_103674 ) ) ( not ( = ?auto_103672 ?auto_103675 ) ) ( not ( = ?auto_103673 ?auto_103674 ) ) ( not ( = ?auto_103673 ?auto_103675 ) ) ( not ( = ?auto_103674 ?auto_103675 ) ) ( ON ?auto_103675 ?auto_103676 ) ( not ( = ?auto_103671 ?auto_103676 ) ) ( not ( = ?auto_103672 ?auto_103676 ) ) ( not ( = ?auto_103673 ?auto_103676 ) ) ( not ( = ?auto_103674 ?auto_103676 ) ) ( not ( = ?auto_103675 ?auto_103676 ) ) ( ON ?auto_103674 ?auto_103675 ) ( ON-TABLE ?auto_103678 ) ( ON ?auto_103676 ?auto_103678 ) ( not ( = ?auto_103678 ?auto_103676 ) ) ( not ( = ?auto_103678 ?auto_103675 ) ) ( not ( = ?auto_103678 ?auto_103674 ) ) ( not ( = ?auto_103671 ?auto_103678 ) ) ( not ( = ?auto_103672 ?auto_103678 ) ) ( not ( = ?auto_103673 ?auto_103678 ) ) ( ON ?auto_103671 ?auto_103677 ) ( not ( = ?auto_103671 ?auto_103677 ) ) ( not ( = ?auto_103672 ?auto_103677 ) ) ( not ( = ?auto_103673 ?auto_103677 ) ) ( not ( = ?auto_103674 ?auto_103677 ) ) ( not ( = ?auto_103675 ?auto_103677 ) ) ( not ( = ?auto_103676 ?auto_103677 ) ) ( not ( = ?auto_103678 ?auto_103677 ) ) ( ON ?auto_103672 ?auto_103671 ) ( ON-TABLE ?auto_103677 ) ( CLEAR ?auto_103674 ) ( ON ?auto_103673 ?auto_103672 ) ( CLEAR ?auto_103673 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103677 ?auto_103671 ?auto_103672 )
      ( MAKE-5PILE ?auto_103671 ?auto_103672 ?auto_103673 ?auto_103674 ?auto_103675 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103679 - BLOCK
      ?auto_103680 - BLOCK
      ?auto_103681 - BLOCK
      ?auto_103682 - BLOCK
      ?auto_103683 - BLOCK
    )
    :vars
    (
      ?auto_103685 - BLOCK
      ?auto_103684 - BLOCK
      ?auto_103686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103679 ?auto_103680 ) ) ( not ( = ?auto_103679 ?auto_103681 ) ) ( not ( = ?auto_103679 ?auto_103682 ) ) ( not ( = ?auto_103679 ?auto_103683 ) ) ( not ( = ?auto_103680 ?auto_103681 ) ) ( not ( = ?auto_103680 ?auto_103682 ) ) ( not ( = ?auto_103680 ?auto_103683 ) ) ( not ( = ?auto_103681 ?auto_103682 ) ) ( not ( = ?auto_103681 ?auto_103683 ) ) ( not ( = ?auto_103682 ?auto_103683 ) ) ( ON ?auto_103683 ?auto_103685 ) ( not ( = ?auto_103679 ?auto_103685 ) ) ( not ( = ?auto_103680 ?auto_103685 ) ) ( not ( = ?auto_103681 ?auto_103685 ) ) ( not ( = ?auto_103682 ?auto_103685 ) ) ( not ( = ?auto_103683 ?auto_103685 ) ) ( ON-TABLE ?auto_103684 ) ( ON ?auto_103685 ?auto_103684 ) ( not ( = ?auto_103684 ?auto_103685 ) ) ( not ( = ?auto_103684 ?auto_103683 ) ) ( not ( = ?auto_103684 ?auto_103682 ) ) ( not ( = ?auto_103679 ?auto_103684 ) ) ( not ( = ?auto_103680 ?auto_103684 ) ) ( not ( = ?auto_103681 ?auto_103684 ) ) ( ON ?auto_103679 ?auto_103686 ) ( not ( = ?auto_103679 ?auto_103686 ) ) ( not ( = ?auto_103680 ?auto_103686 ) ) ( not ( = ?auto_103681 ?auto_103686 ) ) ( not ( = ?auto_103682 ?auto_103686 ) ) ( not ( = ?auto_103683 ?auto_103686 ) ) ( not ( = ?auto_103685 ?auto_103686 ) ) ( not ( = ?auto_103684 ?auto_103686 ) ) ( ON ?auto_103680 ?auto_103679 ) ( ON-TABLE ?auto_103686 ) ( ON ?auto_103681 ?auto_103680 ) ( CLEAR ?auto_103681 ) ( HOLDING ?auto_103682 ) ( CLEAR ?auto_103683 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103684 ?auto_103685 ?auto_103683 ?auto_103682 )
      ( MAKE-5PILE ?auto_103679 ?auto_103680 ?auto_103681 ?auto_103682 ?auto_103683 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103687 - BLOCK
      ?auto_103688 - BLOCK
      ?auto_103689 - BLOCK
      ?auto_103690 - BLOCK
      ?auto_103691 - BLOCK
    )
    :vars
    (
      ?auto_103694 - BLOCK
      ?auto_103693 - BLOCK
      ?auto_103692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103687 ?auto_103688 ) ) ( not ( = ?auto_103687 ?auto_103689 ) ) ( not ( = ?auto_103687 ?auto_103690 ) ) ( not ( = ?auto_103687 ?auto_103691 ) ) ( not ( = ?auto_103688 ?auto_103689 ) ) ( not ( = ?auto_103688 ?auto_103690 ) ) ( not ( = ?auto_103688 ?auto_103691 ) ) ( not ( = ?auto_103689 ?auto_103690 ) ) ( not ( = ?auto_103689 ?auto_103691 ) ) ( not ( = ?auto_103690 ?auto_103691 ) ) ( ON ?auto_103691 ?auto_103694 ) ( not ( = ?auto_103687 ?auto_103694 ) ) ( not ( = ?auto_103688 ?auto_103694 ) ) ( not ( = ?auto_103689 ?auto_103694 ) ) ( not ( = ?auto_103690 ?auto_103694 ) ) ( not ( = ?auto_103691 ?auto_103694 ) ) ( ON-TABLE ?auto_103693 ) ( ON ?auto_103694 ?auto_103693 ) ( not ( = ?auto_103693 ?auto_103694 ) ) ( not ( = ?auto_103693 ?auto_103691 ) ) ( not ( = ?auto_103693 ?auto_103690 ) ) ( not ( = ?auto_103687 ?auto_103693 ) ) ( not ( = ?auto_103688 ?auto_103693 ) ) ( not ( = ?auto_103689 ?auto_103693 ) ) ( ON ?auto_103687 ?auto_103692 ) ( not ( = ?auto_103687 ?auto_103692 ) ) ( not ( = ?auto_103688 ?auto_103692 ) ) ( not ( = ?auto_103689 ?auto_103692 ) ) ( not ( = ?auto_103690 ?auto_103692 ) ) ( not ( = ?auto_103691 ?auto_103692 ) ) ( not ( = ?auto_103694 ?auto_103692 ) ) ( not ( = ?auto_103693 ?auto_103692 ) ) ( ON ?auto_103688 ?auto_103687 ) ( ON-TABLE ?auto_103692 ) ( ON ?auto_103689 ?auto_103688 ) ( CLEAR ?auto_103691 ) ( ON ?auto_103690 ?auto_103689 ) ( CLEAR ?auto_103690 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103692 ?auto_103687 ?auto_103688 ?auto_103689 )
      ( MAKE-5PILE ?auto_103687 ?auto_103688 ?auto_103689 ?auto_103690 ?auto_103691 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103695 - BLOCK
      ?auto_103696 - BLOCK
      ?auto_103697 - BLOCK
      ?auto_103698 - BLOCK
      ?auto_103699 - BLOCK
    )
    :vars
    (
      ?auto_103702 - BLOCK
      ?auto_103701 - BLOCK
      ?auto_103700 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103695 ?auto_103696 ) ) ( not ( = ?auto_103695 ?auto_103697 ) ) ( not ( = ?auto_103695 ?auto_103698 ) ) ( not ( = ?auto_103695 ?auto_103699 ) ) ( not ( = ?auto_103696 ?auto_103697 ) ) ( not ( = ?auto_103696 ?auto_103698 ) ) ( not ( = ?auto_103696 ?auto_103699 ) ) ( not ( = ?auto_103697 ?auto_103698 ) ) ( not ( = ?auto_103697 ?auto_103699 ) ) ( not ( = ?auto_103698 ?auto_103699 ) ) ( not ( = ?auto_103695 ?auto_103702 ) ) ( not ( = ?auto_103696 ?auto_103702 ) ) ( not ( = ?auto_103697 ?auto_103702 ) ) ( not ( = ?auto_103698 ?auto_103702 ) ) ( not ( = ?auto_103699 ?auto_103702 ) ) ( ON-TABLE ?auto_103701 ) ( ON ?auto_103702 ?auto_103701 ) ( not ( = ?auto_103701 ?auto_103702 ) ) ( not ( = ?auto_103701 ?auto_103699 ) ) ( not ( = ?auto_103701 ?auto_103698 ) ) ( not ( = ?auto_103695 ?auto_103701 ) ) ( not ( = ?auto_103696 ?auto_103701 ) ) ( not ( = ?auto_103697 ?auto_103701 ) ) ( ON ?auto_103695 ?auto_103700 ) ( not ( = ?auto_103695 ?auto_103700 ) ) ( not ( = ?auto_103696 ?auto_103700 ) ) ( not ( = ?auto_103697 ?auto_103700 ) ) ( not ( = ?auto_103698 ?auto_103700 ) ) ( not ( = ?auto_103699 ?auto_103700 ) ) ( not ( = ?auto_103702 ?auto_103700 ) ) ( not ( = ?auto_103701 ?auto_103700 ) ) ( ON ?auto_103696 ?auto_103695 ) ( ON-TABLE ?auto_103700 ) ( ON ?auto_103697 ?auto_103696 ) ( ON ?auto_103698 ?auto_103697 ) ( CLEAR ?auto_103698 ) ( HOLDING ?auto_103699 ) ( CLEAR ?auto_103702 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103701 ?auto_103702 ?auto_103699 )
      ( MAKE-5PILE ?auto_103695 ?auto_103696 ?auto_103697 ?auto_103698 ?auto_103699 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103703 - BLOCK
      ?auto_103704 - BLOCK
      ?auto_103705 - BLOCK
      ?auto_103706 - BLOCK
      ?auto_103707 - BLOCK
    )
    :vars
    (
      ?auto_103710 - BLOCK
      ?auto_103708 - BLOCK
      ?auto_103709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103703 ?auto_103704 ) ) ( not ( = ?auto_103703 ?auto_103705 ) ) ( not ( = ?auto_103703 ?auto_103706 ) ) ( not ( = ?auto_103703 ?auto_103707 ) ) ( not ( = ?auto_103704 ?auto_103705 ) ) ( not ( = ?auto_103704 ?auto_103706 ) ) ( not ( = ?auto_103704 ?auto_103707 ) ) ( not ( = ?auto_103705 ?auto_103706 ) ) ( not ( = ?auto_103705 ?auto_103707 ) ) ( not ( = ?auto_103706 ?auto_103707 ) ) ( not ( = ?auto_103703 ?auto_103710 ) ) ( not ( = ?auto_103704 ?auto_103710 ) ) ( not ( = ?auto_103705 ?auto_103710 ) ) ( not ( = ?auto_103706 ?auto_103710 ) ) ( not ( = ?auto_103707 ?auto_103710 ) ) ( ON-TABLE ?auto_103708 ) ( ON ?auto_103710 ?auto_103708 ) ( not ( = ?auto_103708 ?auto_103710 ) ) ( not ( = ?auto_103708 ?auto_103707 ) ) ( not ( = ?auto_103708 ?auto_103706 ) ) ( not ( = ?auto_103703 ?auto_103708 ) ) ( not ( = ?auto_103704 ?auto_103708 ) ) ( not ( = ?auto_103705 ?auto_103708 ) ) ( ON ?auto_103703 ?auto_103709 ) ( not ( = ?auto_103703 ?auto_103709 ) ) ( not ( = ?auto_103704 ?auto_103709 ) ) ( not ( = ?auto_103705 ?auto_103709 ) ) ( not ( = ?auto_103706 ?auto_103709 ) ) ( not ( = ?auto_103707 ?auto_103709 ) ) ( not ( = ?auto_103710 ?auto_103709 ) ) ( not ( = ?auto_103708 ?auto_103709 ) ) ( ON ?auto_103704 ?auto_103703 ) ( ON-TABLE ?auto_103709 ) ( ON ?auto_103705 ?auto_103704 ) ( ON ?auto_103706 ?auto_103705 ) ( CLEAR ?auto_103710 ) ( ON ?auto_103707 ?auto_103706 ) ( CLEAR ?auto_103707 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103709 ?auto_103703 ?auto_103704 ?auto_103705 ?auto_103706 )
      ( MAKE-5PILE ?auto_103703 ?auto_103704 ?auto_103705 ?auto_103706 ?auto_103707 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103711 - BLOCK
      ?auto_103712 - BLOCK
      ?auto_103713 - BLOCK
      ?auto_103714 - BLOCK
      ?auto_103715 - BLOCK
    )
    :vars
    (
      ?auto_103717 - BLOCK
      ?auto_103716 - BLOCK
      ?auto_103718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103711 ?auto_103712 ) ) ( not ( = ?auto_103711 ?auto_103713 ) ) ( not ( = ?auto_103711 ?auto_103714 ) ) ( not ( = ?auto_103711 ?auto_103715 ) ) ( not ( = ?auto_103712 ?auto_103713 ) ) ( not ( = ?auto_103712 ?auto_103714 ) ) ( not ( = ?auto_103712 ?auto_103715 ) ) ( not ( = ?auto_103713 ?auto_103714 ) ) ( not ( = ?auto_103713 ?auto_103715 ) ) ( not ( = ?auto_103714 ?auto_103715 ) ) ( not ( = ?auto_103711 ?auto_103717 ) ) ( not ( = ?auto_103712 ?auto_103717 ) ) ( not ( = ?auto_103713 ?auto_103717 ) ) ( not ( = ?auto_103714 ?auto_103717 ) ) ( not ( = ?auto_103715 ?auto_103717 ) ) ( ON-TABLE ?auto_103716 ) ( not ( = ?auto_103716 ?auto_103717 ) ) ( not ( = ?auto_103716 ?auto_103715 ) ) ( not ( = ?auto_103716 ?auto_103714 ) ) ( not ( = ?auto_103711 ?auto_103716 ) ) ( not ( = ?auto_103712 ?auto_103716 ) ) ( not ( = ?auto_103713 ?auto_103716 ) ) ( ON ?auto_103711 ?auto_103718 ) ( not ( = ?auto_103711 ?auto_103718 ) ) ( not ( = ?auto_103712 ?auto_103718 ) ) ( not ( = ?auto_103713 ?auto_103718 ) ) ( not ( = ?auto_103714 ?auto_103718 ) ) ( not ( = ?auto_103715 ?auto_103718 ) ) ( not ( = ?auto_103717 ?auto_103718 ) ) ( not ( = ?auto_103716 ?auto_103718 ) ) ( ON ?auto_103712 ?auto_103711 ) ( ON-TABLE ?auto_103718 ) ( ON ?auto_103713 ?auto_103712 ) ( ON ?auto_103714 ?auto_103713 ) ( ON ?auto_103715 ?auto_103714 ) ( CLEAR ?auto_103715 ) ( HOLDING ?auto_103717 ) ( CLEAR ?auto_103716 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103716 ?auto_103717 )
      ( MAKE-5PILE ?auto_103711 ?auto_103712 ?auto_103713 ?auto_103714 ?auto_103715 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103719 - BLOCK
      ?auto_103720 - BLOCK
      ?auto_103721 - BLOCK
      ?auto_103722 - BLOCK
      ?auto_103723 - BLOCK
    )
    :vars
    (
      ?auto_103726 - BLOCK
      ?auto_103724 - BLOCK
      ?auto_103725 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103719 ?auto_103720 ) ) ( not ( = ?auto_103719 ?auto_103721 ) ) ( not ( = ?auto_103719 ?auto_103722 ) ) ( not ( = ?auto_103719 ?auto_103723 ) ) ( not ( = ?auto_103720 ?auto_103721 ) ) ( not ( = ?auto_103720 ?auto_103722 ) ) ( not ( = ?auto_103720 ?auto_103723 ) ) ( not ( = ?auto_103721 ?auto_103722 ) ) ( not ( = ?auto_103721 ?auto_103723 ) ) ( not ( = ?auto_103722 ?auto_103723 ) ) ( not ( = ?auto_103719 ?auto_103726 ) ) ( not ( = ?auto_103720 ?auto_103726 ) ) ( not ( = ?auto_103721 ?auto_103726 ) ) ( not ( = ?auto_103722 ?auto_103726 ) ) ( not ( = ?auto_103723 ?auto_103726 ) ) ( ON-TABLE ?auto_103724 ) ( not ( = ?auto_103724 ?auto_103726 ) ) ( not ( = ?auto_103724 ?auto_103723 ) ) ( not ( = ?auto_103724 ?auto_103722 ) ) ( not ( = ?auto_103719 ?auto_103724 ) ) ( not ( = ?auto_103720 ?auto_103724 ) ) ( not ( = ?auto_103721 ?auto_103724 ) ) ( ON ?auto_103719 ?auto_103725 ) ( not ( = ?auto_103719 ?auto_103725 ) ) ( not ( = ?auto_103720 ?auto_103725 ) ) ( not ( = ?auto_103721 ?auto_103725 ) ) ( not ( = ?auto_103722 ?auto_103725 ) ) ( not ( = ?auto_103723 ?auto_103725 ) ) ( not ( = ?auto_103726 ?auto_103725 ) ) ( not ( = ?auto_103724 ?auto_103725 ) ) ( ON ?auto_103720 ?auto_103719 ) ( ON-TABLE ?auto_103725 ) ( ON ?auto_103721 ?auto_103720 ) ( ON ?auto_103722 ?auto_103721 ) ( ON ?auto_103723 ?auto_103722 ) ( CLEAR ?auto_103724 ) ( ON ?auto_103726 ?auto_103723 ) ( CLEAR ?auto_103726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103725 ?auto_103719 ?auto_103720 ?auto_103721 ?auto_103722 ?auto_103723 )
      ( MAKE-5PILE ?auto_103719 ?auto_103720 ?auto_103721 ?auto_103722 ?auto_103723 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103727 - BLOCK
      ?auto_103728 - BLOCK
      ?auto_103729 - BLOCK
      ?auto_103730 - BLOCK
      ?auto_103731 - BLOCK
    )
    :vars
    (
      ?auto_103733 - BLOCK
      ?auto_103734 - BLOCK
      ?auto_103732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103727 ?auto_103728 ) ) ( not ( = ?auto_103727 ?auto_103729 ) ) ( not ( = ?auto_103727 ?auto_103730 ) ) ( not ( = ?auto_103727 ?auto_103731 ) ) ( not ( = ?auto_103728 ?auto_103729 ) ) ( not ( = ?auto_103728 ?auto_103730 ) ) ( not ( = ?auto_103728 ?auto_103731 ) ) ( not ( = ?auto_103729 ?auto_103730 ) ) ( not ( = ?auto_103729 ?auto_103731 ) ) ( not ( = ?auto_103730 ?auto_103731 ) ) ( not ( = ?auto_103727 ?auto_103733 ) ) ( not ( = ?auto_103728 ?auto_103733 ) ) ( not ( = ?auto_103729 ?auto_103733 ) ) ( not ( = ?auto_103730 ?auto_103733 ) ) ( not ( = ?auto_103731 ?auto_103733 ) ) ( not ( = ?auto_103734 ?auto_103733 ) ) ( not ( = ?auto_103734 ?auto_103731 ) ) ( not ( = ?auto_103734 ?auto_103730 ) ) ( not ( = ?auto_103727 ?auto_103734 ) ) ( not ( = ?auto_103728 ?auto_103734 ) ) ( not ( = ?auto_103729 ?auto_103734 ) ) ( ON ?auto_103727 ?auto_103732 ) ( not ( = ?auto_103727 ?auto_103732 ) ) ( not ( = ?auto_103728 ?auto_103732 ) ) ( not ( = ?auto_103729 ?auto_103732 ) ) ( not ( = ?auto_103730 ?auto_103732 ) ) ( not ( = ?auto_103731 ?auto_103732 ) ) ( not ( = ?auto_103733 ?auto_103732 ) ) ( not ( = ?auto_103734 ?auto_103732 ) ) ( ON ?auto_103728 ?auto_103727 ) ( ON-TABLE ?auto_103732 ) ( ON ?auto_103729 ?auto_103728 ) ( ON ?auto_103730 ?auto_103729 ) ( ON ?auto_103731 ?auto_103730 ) ( ON ?auto_103733 ?auto_103731 ) ( CLEAR ?auto_103733 ) ( HOLDING ?auto_103734 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103734 )
      ( MAKE-5PILE ?auto_103727 ?auto_103728 ?auto_103729 ?auto_103730 ?auto_103731 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_103735 - BLOCK
      ?auto_103736 - BLOCK
      ?auto_103737 - BLOCK
      ?auto_103738 - BLOCK
      ?auto_103739 - BLOCK
    )
    :vars
    (
      ?auto_103741 - BLOCK
      ?auto_103742 - BLOCK
      ?auto_103740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103735 ?auto_103736 ) ) ( not ( = ?auto_103735 ?auto_103737 ) ) ( not ( = ?auto_103735 ?auto_103738 ) ) ( not ( = ?auto_103735 ?auto_103739 ) ) ( not ( = ?auto_103736 ?auto_103737 ) ) ( not ( = ?auto_103736 ?auto_103738 ) ) ( not ( = ?auto_103736 ?auto_103739 ) ) ( not ( = ?auto_103737 ?auto_103738 ) ) ( not ( = ?auto_103737 ?auto_103739 ) ) ( not ( = ?auto_103738 ?auto_103739 ) ) ( not ( = ?auto_103735 ?auto_103741 ) ) ( not ( = ?auto_103736 ?auto_103741 ) ) ( not ( = ?auto_103737 ?auto_103741 ) ) ( not ( = ?auto_103738 ?auto_103741 ) ) ( not ( = ?auto_103739 ?auto_103741 ) ) ( not ( = ?auto_103742 ?auto_103741 ) ) ( not ( = ?auto_103742 ?auto_103739 ) ) ( not ( = ?auto_103742 ?auto_103738 ) ) ( not ( = ?auto_103735 ?auto_103742 ) ) ( not ( = ?auto_103736 ?auto_103742 ) ) ( not ( = ?auto_103737 ?auto_103742 ) ) ( ON ?auto_103735 ?auto_103740 ) ( not ( = ?auto_103735 ?auto_103740 ) ) ( not ( = ?auto_103736 ?auto_103740 ) ) ( not ( = ?auto_103737 ?auto_103740 ) ) ( not ( = ?auto_103738 ?auto_103740 ) ) ( not ( = ?auto_103739 ?auto_103740 ) ) ( not ( = ?auto_103741 ?auto_103740 ) ) ( not ( = ?auto_103742 ?auto_103740 ) ) ( ON ?auto_103736 ?auto_103735 ) ( ON-TABLE ?auto_103740 ) ( ON ?auto_103737 ?auto_103736 ) ( ON ?auto_103738 ?auto_103737 ) ( ON ?auto_103739 ?auto_103738 ) ( ON ?auto_103741 ?auto_103739 ) ( ON ?auto_103742 ?auto_103741 ) ( CLEAR ?auto_103742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_103740 ?auto_103735 ?auto_103736 ?auto_103737 ?auto_103738 ?auto_103739 ?auto_103741 )
      ( MAKE-5PILE ?auto_103735 ?auto_103736 ?auto_103737 ?auto_103738 ?auto_103739 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103754 - BLOCK
    )
    :vars
    (
      ?auto_103756 - BLOCK
      ?auto_103757 - BLOCK
      ?auto_103755 - BLOCK
      ?auto_103758 - BLOCK
      ?auto_103760 - BLOCK
      ?auto_103759 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103756 ?auto_103754 ) ( ON-TABLE ?auto_103754 ) ( not ( = ?auto_103754 ?auto_103756 ) ) ( not ( = ?auto_103754 ?auto_103757 ) ) ( not ( = ?auto_103754 ?auto_103755 ) ) ( not ( = ?auto_103756 ?auto_103757 ) ) ( not ( = ?auto_103756 ?auto_103755 ) ) ( not ( = ?auto_103757 ?auto_103755 ) ) ( ON ?auto_103757 ?auto_103756 ) ( CLEAR ?auto_103757 ) ( HOLDING ?auto_103755 ) ( CLEAR ?auto_103758 ) ( ON-TABLE ?auto_103760 ) ( ON ?auto_103759 ?auto_103760 ) ( ON ?auto_103758 ?auto_103759 ) ( not ( = ?auto_103760 ?auto_103759 ) ) ( not ( = ?auto_103760 ?auto_103758 ) ) ( not ( = ?auto_103760 ?auto_103755 ) ) ( not ( = ?auto_103759 ?auto_103758 ) ) ( not ( = ?auto_103759 ?auto_103755 ) ) ( not ( = ?auto_103758 ?auto_103755 ) ) ( not ( = ?auto_103754 ?auto_103758 ) ) ( not ( = ?auto_103754 ?auto_103760 ) ) ( not ( = ?auto_103754 ?auto_103759 ) ) ( not ( = ?auto_103756 ?auto_103758 ) ) ( not ( = ?auto_103756 ?auto_103760 ) ) ( not ( = ?auto_103756 ?auto_103759 ) ) ( not ( = ?auto_103757 ?auto_103758 ) ) ( not ( = ?auto_103757 ?auto_103760 ) ) ( not ( = ?auto_103757 ?auto_103759 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103760 ?auto_103759 ?auto_103758 ?auto_103755 )
      ( MAKE-1PILE ?auto_103754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103761 - BLOCK
    )
    :vars
    (
      ?auto_103766 - BLOCK
      ?auto_103767 - BLOCK
      ?auto_103765 - BLOCK
      ?auto_103763 - BLOCK
      ?auto_103764 - BLOCK
      ?auto_103762 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103766 ?auto_103761 ) ( ON-TABLE ?auto_103761 ) ( not ( = ?auto_103761 ?auto_103766 ) ) ( not ( = ?auto_103761 ?auto_103767 ) ) ( not ( = ?auto_103761 ?auto_103765 ) ) ( not ( = ?auto_103766 ?auto_103767 ) ) ( not ( = ?auto_103766 ?auto_103765 ) ) ( not ( = ?auto_103767 ?auto_103765 ) ) ( ON ?auto_103767 ?auto_103766 ) ( CLEAR ?auto_103763 ) ( ON-TABLE ?auto_103764 ) ( ON ?auto_103762 ?auto_103764 ) ( ON ?auto_103763 ?auto_103762 ) ( not ( = ?auto_103764 ?auto_103762 ) ) ( not ( = ?auto_103764 ?auto_103763 ) ) ( not ( = ?auto_103764 ?auto_103765 ) ) ( not ( = ?auto_103762 ?auto_103763 ) ) ( not ( = ?auto_103762 ?auto_103765 ) ) ( not ( = ?auto_103763 ?auto_103765 ) ) ( not ( = ?auto_103761 ?auto_103763 ) ) ( not ( = ?auto_103761 ?auto_103764 ) ) ( not ( = ?auto_103761 ?auto_103762 ) ) ( not ( = ?auto_103766 ?auto_103763 ) ) ( not ( = ?auto_103766 ?auto_103764 ) ) ( not ( = ?auto_103766 ?auto_103762 ) ) ( not ( = ?auto_103767 ?auto_103763 ) ) ( not ( = ?auto_103767 ?auto_103764 ) ) ( not ( = ?auto_103767 ?auto_103762 ) ) ( ON ?auto_103765 ?auto_103767 ) ( CLEAR ?auto_103765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103761 ?auto_103766 ?auto_103767 )
      ( MAKE-1PILE ?auto_103761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103768 - BLOCK
    )
    :vars
    (
      ?auto_103773 - BLOCK
      ?auto_103772 - BLOCK
      ?auto_103774 - BLOCK
      ?auto_103770 - BLOCK
      ?auto_103771 - BLOCK
      ?auto_103769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103773 ?auto_103768 ) ( ON-TABLE ?auto_103768 ) ( not ( = ?auto_103768 ?auto_103773 ) ) ( not ( = ?auto_103768 ?auto_103772 ) ) ( not ( = ?auto_103768 ?auto_103774 ) ) ( not ( = ?auto_103773 ?auto_103772 ) ) ( not ( = ?auto_103773 ?auto_103774 ) ) ( not ( = ?auto_103772 ?auto_103774 ) ) ( ON ?auto_103772 ?auto_103773 ) ( ON-TABLE ?auto_103770 ) ( ON ?auto_103771 ?auto_103770 ) ( not ( = ?auto_103770 ?auto_103771 ) ) ( not ( = ?auto_103770 ?auto_103769 ) ) ( not ( = ?auto_103770 ?auto_103774 ) ) ( not ( = ?auto_103771 ?auto_103769 ) ) ( not ( = ?auto_103771 ?auto_103774 ) ) ( not ( = ?auto_103769 ?auto_103774 ) ) ( not ( = ?auto_103768 ?auto_103769 ) ) ( not ( = ?auto_103768 ?auto_103770 ) ) ( not ( = ?auto_103768 ?auto_103771 ) ) ( not ( = ?auto_103773 ?auto_103769 ) ) ( not ( = ?auto_103773 ?auto_103770 ) ) ( not ( = ?auto_103773 ?auto_103771 ) ) ( not ( = ?auto_103772 ?auto_103769 ) ) ( not ( = ?auto_103772 ?auto_103770 ) ) ( not ( = ?auto_103772 ?auto_103771 ) ) ( ON ?auto_103774 ?auto_103772 ) ( CLEAR ?auto_103774 ) ( HOLDING ?auto_103769 ) ( CLEAR ?auto_103771 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103770 ?auto_103771 ?auto_103769 )
      ( MAKE-1PILE ?auto_103768 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103775 - BLOCK
    )
    :vars
    (
      ?auto_103776 - BLOCK
      ?auto_103779 - BLOCK
      ?auto_103778 - BLOCK
      ?auto_103781 - BLOCK
      ?auto_103780 - BLOCK
      ?auto_103777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103776 ?auto_103775 ) ( ON-TABLE ?auto_103775 ) ( not ( = ?auto_103775 ?auto_103776 ) ) ( not ( = ?auto_103775 ?auto_103779 ) ) ( not ( = ?auto_103775 ?auto_103778 ) ) ( not ( = ?auto_103776 ?auto_103779 ) ) ( not ( = ?auto_103776 ?auto_103778 ) ) ( not ( = ?auto_103779 ?auto_103778 ) ) ( ON ?auto_103779 ?auto_103776 ) ( ON-TABLE ?auto_103781 ) ( ON ?auto_103780 ?auto_103781 ) ( not ( = ?auto_103781 ?auto_103780 ) ) ( not ( = ?auto_103781 ?auto_103777 ) ) ( not ( = ?auto_103781 ?auto_103778 ) ) ( not ( = ?auto_103780 ?auto_103777 ) ) ( not ( = ?auto_103780 ?auto_103778 ) ) ( not ( = ?auto_103777 ?auto_103778 ) ) ( not ( = ?auto_103775 ?auto_103777 ) ) ( not ( = ?auto_103775 ?auto_103781 ) ) ( not ( = ?auto_103775 ?auto_103780 ) ) ( not ( = ?auto_103776 ?auto_103777 ) ) ( not ( = ?auto_103776 ?auto_103781 ) ) ( not ( = ?auto_103776 ?auto_103780 ) ) ( not ( = ?auto_103779 ?auto_103777 ) ) ( not ( = ?auto_103779 ?auto_103781 ) ) ( not ( = ?auto_103779 ?auto_103780 ) ) ( ON ?auto_103778 ?auto_103779 ) ( CLEAR ?auto_103780 ) ( ON ?auto_103777 ?auto_103778 ) ( CLEAR ?auto_103777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103775 ?auto_103776 ?auto_103779 ?auto_103778 )
      ( MAKE-1PILE ?auto_103775 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103782 - BLOCK
    )
    :vars
    (
      ?auto_103785 - BLOCK
      ?auto_103784 - BLOCK
      ?auto_103783 - BLOCK
      ?auto_103788 - BLOCK
      ?auto_103786 - BLOCK
      ?auto_103787 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103785 ?auto_103782 ) ( ON-TABLE ?auto_103782 ) ( not ( = ?auto_103782 ?auto_103785 ) ) ( not ( = ?auto_103782 ?auto_103784 ) ) ( not ( = ?auto_103782 ?auto_103783 ) ) ( not ( = ?auto_103785 ?auto_103784 ) ) ( not ( = ?auto_103785 ?auto_103783 ) ) ( not ( = ?auto_103784 ?auto_103783 ) ) ( ON ?auto_103784 ?auto_103785 ) ( ON-TABLE ?auto_103788 ) ( not ( = ?auto_103788 ?auto_103786 ) ) ( not ( = ?auto_103788 ?auto_103787 ) ) ( not ( = ?auto_103788 ?auto_103783 ) ) ( not ( = ?auto_103786 ?auto_103787 ) ) ( not ( = ?auto_103786 ?auto_103783 ) ) ( not ( = ?auto_103787 ?auto_103783 ) ) ( not ( = ?auto_103782 ?auto_103787 ) ) ( not ( = ?auto_103782 ?auto_103788 ) ) ( not ( = ?auto_103782 ?auto_103786 ) ) ( not ( = ?auto_103785 ?auto_103787 ) ) ( not ( = ?auto_103785 ?auto_103788 ) ) ( not ( = ?auto_103785 ?auto_103786 ) ) ( not ( = ?auto_103784 ?auto_103787 ) ) ( not ( = ?auto_103784 ?auto_103788 ) ) ( not ( = ?auto_103784 ?auto_103786 ) ) ( ON ?auto_103783 ?auto_103784 ) ( ON ?auto_103787 ?auto_103783 ) ( CLEAR ?auto_103787 ) ( HOLDING ?auto_103786 ) ( CLEAR ?auto_103788 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103788 ?auto_103786 )
      ( MAKE-1PILE ?auto_103782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103789 - BLOCK
    )
    :vars
    (
      ?auto_103792 - BLOCK
      ?auto_103795 - BLOCK
      ?auto_103793 - BLOCK
      ?auto_103794 - BLOCK
      ?auto_103791 - BLOCK
      ?auto_103790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103792 ?auto_103789 ) ( ON-TABLE ?auto_103789 ) ( not ( = ?auto_103789 ?auto_103792 ) ) ( not ( = ?auto_103789 ?auto_103795 ) ) ( not ( = ?auto_103789 ?auto_103793 ) ) ( not ( = ?auto_103792 ?auto_103795 ) ) ( not ( = ?auto_103792 ?auto_103793 ) ) ( not ( = ?auto_103795 ?auto_103793 ) ) ( ON ?auto_103795 ?auto_103792 ) ( ON-TABLE ?auto_103794 ) ( not ( = ?auto_103794 ?auto_103791 ) ) ( not ( = ?auto_103794 ?auto_103790 ) ) ( not ( = ?auto_103794 ?auto_103793 ) ) ( not ( = ?auto_103791 ?auto_103790 ) ) ( not ( = ?auto_103791 ?auto_103793 ) ) ( not ( = ?auto_103790 ?auto_103793 ) ) ( not ( = ?auto_103789 ?auto_103790 ) ) ( not ( = ?auto_103789 ?auto_103794 ) ) ( not ( = ?auto_103789 ?auto_103791 ) ) ( not ( = ?auto_103792 ?auto_103790 ) ) ( not ( = ?auto_103792 ?auto_103794 ) ) ( not ( = ?auto_103792 ?auto_103791 ) ) ( not ( = ?auto_103795 ?auto_103790 ) ) ( not ( = ?auto_103795 ?auto_103794 ) ) ( not ( = ?auto_103795 ?auto_103791 ) ) ( ON ?auto_103793 ?auto_103795 ) ( ON ?auto_103790 ?auto_103793 ) ( CLEAR ?auto_103794 ) ( ON ?auto_103791 ?auto_103790 ) ( CLEAR ?auto_103791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103789 ?auto_103792 ?auto_103795 ?auto_103793 ?auto_103790 )
      ( MAKE-1PILE ?auto_103789 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103796 - BLOCK
    )
    :vars
    (
      ?auto_103799 - BLOCK
      ?auto_103802 - BLOCK
      ?auto_103800 - BLOCK
      ?auto_103798 - BLOCK
      ?auto_103801 - BLOCK
      ?auto_103797 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103799 ?auto_103796 ) ( ON-TABLE ?auto_103796 ) ( not ( = ?auto_103796 ?auto_103799 ) ) ( not ( = ?auto_103796 ?auto_103802 ) ) ( not ( = ?auto_103796 ?auto_103800 ) ) ( not ( = ?auto_103799 ?auto_103802 ) ) ( not ( = ?auto_103799 ?auto_103800 ) ) ( not ( = ?auto_103802 ?auto_103800 ) ) ( ON ?auto_103802 ?auto_103799 ) ( not ( = ?auto_103798 ?auto_103801 ) ) ( not ( = ?auto_103798 ?auto_103797 ) ) ( not ( = ?auto_103798 ?auto_103800 ) ) ( not ( = ?auto_103801 ?auto_103797 ) ) ( not ( = ?auto_103801 ?auto_103800 ) ) ( not ( = ?auto_103797 ?auto_103800 ) ) ( not ( = ?auto_103796 ?auto_103797 ) ) ( not ( = ?auto_103796 ?auto_103798 ) ) ( not ( = ?auto_103796 ?auto_103801 ) ) ( not ( = ?auto_103799 ?auto_103797 ) ) ( not ( = ?auto_103799 ?auto_103798 ) ) ( not ( = ?auto_103799 ?auto_103801 ) ) ( not ( = ?auto_103802 ?auto_103797 ) ) ( not ( = ?auto_103802 ?auto_103798 ) ) ( not ( = ?auto_103802 ?auto_103801 ) ) ( ON ?auto_103800 ?auto_103802 ) ( ON ?auto_103797 ?auto_103800 ) ( ON ?auto_103801 ?auto_103797 ) ( CLEAR ?auto_103801 ) ( HOLDING ?auto_103798 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103798 )
      ( MAKE-1PILE ?auto_103796 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103811 - BLOCK
    )
    :vars
    (
      ?auto_103816 - BLOCK
      ?auto_103815 - BLOCK
      ?auto_103812 - BLOCK
      ?auto_103817 - BLOCK
      ?auto_103814 - BLOCK
      ?auto_103813 - BLOCK
      ?auto_103818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103816 ?auto_103811 ) ( ON-TABLE ?auto_103811 ) ( not ( = ?auto_103811 ?auto_103816 ) ) ( not ( = ?auto_103811 ?auto_103815 ) ) ( not ( = ?auto_103811 ?auto_103812 ) ) ( not ( = ?auto_103816 ?auto_103815 ) ) ( not ( = ?auto_103816 ?auto_103812 ) ) ( not ( = ?auto_103815 ?auto_103812 ) ) ( ON ?auto_103815 ?auto_103816 ) ( not ( = ?auto_103817 ?auto_103814 ) ) ( not ( = ?auto_103817 ?auto_103813 ) ) ( not ( = ?auto_103817 ?auto_103812 ) ) ( not ( = ?auto_103814 ?auto_103813 ) ) ( not ( = ?auto_103814 ?auto_103812 ) ) ( not ( = ?auto_103813 ?auto_103812 ) ) ( not ( = ?auto_103811 ?auto_103813 ) ) ( not ( = ?auto_103811 ?auto_103817 ) ) ( not ( = ?auto_103811 ?auto_103814 ) ) ( not ( = ?auto_103816 ?auto_103813 ) ) ( not ( = ?auto_103816 ?auto_103817 ) ) ( not ( = ?auto_103816 ?auto_103814 ) ) ( not ( = ?auto_103815 ?auto_103813 ) ) ( not ( = ?auto_103815 ?auto_103817 ) ) ( not ( = ?auto_103815 ?auto_103814 ) ) ( ON ?auto_103812 ?auto_103815 ) ( ON ?auto_103813 ?auto_103812 ) ( ON ?auto_103814 ?auto_103813 ) ( CLEAR ?auto_103814 ) ( ON ?auto_103817 ?auto_103818 ) ( CLEAR ?auto_103817 ) ( HAND-EMPTY ) ( not ( = ?auto_103811 ?auto_103818 ) ) ( not ( = ?auto_103816 ?auto_103818 ) ) ( not ( = ?auto_103815 ?auto_103818 ) ) ( not ( = ?auto_103812 ?auto_103818 ) ) ( not ( = ?auto_103817 ?auto_103818 ) ) ( not ( = ?auto_103814 ?auto_103818 ) ) ( not ( = ?auto_103813 ?auto_103818 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103817 ?auto_103818 )
      ( MAKE-1PILE ?auto_103811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103819 - BLOCK
    )
    :vars
    (
      ?auto_103820 - BLOCK
      ?auto_103823 - BLOCK
      ?auto_103821 - BLOCK
      ?auto_103822 - BLOCK
      ?auto_103825 - BLOCK
      ?auto_103826 - BLOCK
      ?auto_103824 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103820 ?auto_103819 ) ( ON-TABLE ?auto_103819 ) ( not ( = ?auto_103819 ?auto_103820 ) ) ( not ( = ?auto_103819 ?auto_103823 ) ) ( not ( = ?auto_103819 ?auto_103821 ) ) ( not ( = ?auto_103820 ?auto_103823 ) ) ( not ( = ?auto_103820 ?auto_103821 ) ) ( not ( = ?auto_103823 ?auto_103821 ) ) ( ON ?auto_103823 ?auto_103820 ) ( not ( = ?auto_103822 ?auto_103825 ) ) ( not ( = ?auto_103822 ?auto_103826 ) ) ( not ( = ?auto_103822 ?auto_103821 ) ) ( not ( = ?auto_103825 ?auto_103826 ) ) ( not ( = ?auto_103825 ?auto_103821 ) ) ( not ( = ?auto_103826 ?auto_103821 ) ) ( not ( = ?auto_103819 ?auto_103826 ) ) ( not ( = ?auto_103819 ?auto_103822 ) ) ( not ( = ?auto_103819 ?auto_103825 ) ) ( not ( = ?auto_103820 ?auto_103826 ) ) ( not ( = ?auto_103820 ?auto_103822 ) ) ( not ( = ?auto_103820 ?auto_103825 ) ) ( not ( = ?auto_103823 ?auto_103826 ) ) ( not ( = ?auto_103823 ?auto_103822 ) ) ( not ( = ?auto_103823 ?auto_103825 ) ) ( ON ?auto_103821 ?auto_103823 ) ( ON ?auto_103826 ?auto_103821 ) ( ON ?auto_103822 ?auto_103824 ) ( CLEAR ?auto_103822 ) ( not ( = ?auto_103819 ?auto_103824 ) ) ( not ( = ?auto_103820 ?auto_103824 ) ) ( not ( = ?auto_103823 ?auto_103824 ) ) ( not ( = ?auto_103821 ?auto_103824 ) ) ( not ( = ?auto_103822 ?auto_103824 ) ) ( not ( = ?auto_103825 ?auto_103824 ) ) ( not ( = ?auto_103826 ?auto_103824 ) ) ( HOLDING ?auto_103825 ) ( CLEAR ?auto_103826 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103819 ?auto_103820 ?auto_103823 ?auto_103821 ?auto_103826 ?auto_103825 )
      ( MAKE-1PILE ?auto_103819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103827 - BLOCK
    )
    :vars
    (
      ?auto_103831 - BLOCK
      ?auto_103828 - BLOCK
      ?auto_103832 - BLOCK
      ?auto_103833 - BLOCK
      ?auto_103830 - BLOCK
      ?auto_103829 - BLOCK
      ?auto_103834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103831 ?auto_103827 ) ( ON-TABLE ?auto_103827 ) ( not ( = ?auto_103827 ?auto_103831 ) ) ( not ( = ?auto_103827 ?auto_103828 ) ) ( not ( = ?auto_103827 ?auto_103832 ) ) ( not ( = ?auto_103831 ?auto_103828 ) ) ( not ( = ?auto_103831 ?auto_103832 ) ) ( not ( = ?auto_103828 ?auto_103832 ) ) ( ON ?auto_103828 ?auto_103831 ) ( not ( = ?auto_103833 ?auto_103830 ) ) ( not ( = ?auto_103833 ?auto_103829 ) ) ( not ( = ?auto_103833 ?auto_103832 ) ) ( not ( = ?auto_103830 ?auto_103829 ) ) ( not ( = ?auto_103830 ?auto_103832 ) ) ( not ( = ?auto_103829 ?auto_103832 ) ) ( not ( = ?auto_103827 ?auto_103829 ) ) ( not ( = ?auto_103827 ?auto_103833 ) ) ( not ( = ?auto_103827 ?auto_103830 ) ) ( not ( = ?auto_103831 ?auto_103829 ) ) ( not ( = ?auto_103831 ?auto_103833 ) ) ( not ( = ?auto_103831 ?auto_103830 ) ) ( not ( = ?auto_103828 ?auto_103829 ) ) ( not ( = ?auto_103828 ?auto_103833 ) ) ( not ( = ?auto_103828 ?auto_103830 ) ) ( ON ?auto_103832 ?auto_103828 ) ( ON ?auto_103829 ?auto_103832 ) ( ON ?auto_103833 ?auto_103834 ) ( not ( = ?auto_103827 ?auto_103834 ) ) ( not ( = ?auto_103831 ?auto_103834 ) ) ( not ( = ?auto_103828 ?auto_103834 ) ) ( not ( = ?auto_103832 ?auto_103834 ) ) ( not ( = ?auto_103833 ?auto_103834 ) ) ( not ( = ?auto_103830 ?auto_103834 ) ) ( not ( = ?auto_103829 ?auto_103834 ) ) ( CLEAR ?auto_103829 ) ( ON ?auto_103830 ?auto_103833 ) ( CLEAR ?auto_103830 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103834 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103834 ?auto_103833 )
      ( MAKE-1PILE ?auto_103827 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_103835 - BLOCK
    )
    :vars
    (
      ?auto_103838 - BLOCK
      ?auto_103839 - BLOCK
      ?auto_103841 - BLOCK
      ?auto_103840 - BLOCK
      ?auto_103842 - BLOCK
      ?auto_103836 - BLOCK
      ?auto_103837 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_103838 ?auto_103835 ) ( ON-TABLE ?auto_103835 ) ( not ( = ?auto_103835 ?auto_103838 ) ) ( not ( = ?auto_103835 ?auto_103839 ) ) ( not ( = ?auto_103835 ?auto_103841 ) ) ( not ( = ?auto_103838 ?auto_103839 ) ) ( not ( = ?auto_103838 ?auto_103841 ) ) ( not ( = ?auto_103839 ?auto_103841 ) ) ( ON ?auto_103839 ?auto_103838 ) ( not ( = ?auto_103840 ?auto_103842 ) ) ( not ( = ?auto_103840 ?auto_103836 ) ) ( not ( = ?auto_103840 ?auto_103841 ) ) ( not ( = ?auto_103842 ?auto_103836 ) ) ( not ( = ?auto_103842 ?auto_103841 ) ) ( not ( = ?auto_103836 ?auto_103841 ) ) ( not ( = ?auto_103835 ?auto_103836 ) ) ( not ( = ?auto_103835 ?auto_103840 ) ) ( not ( = ?auto_103835 ?auto_103842 ) ) ( not ( = ?auto_103838 ?auto_103836 ) ) ( not ( = ?auto_103838 ?auto_103840 ) ) ( not ( = ?auto_103838 ?auto_103842 ) ) ( not ( = ?auto_103839 ?auto_103836 ) ) ( not ( = ?auto_103839 ?auto_103840 ) ) ( not ( = ?auto_103839 ?auto_103842 ) ) ( ON ?auto_103841 ?auto_103839 ) ( ON ?auto_103840 ?auto_103837 ) ( not ( = ?auto_103835 ?auto_103837 ) ) ( not ( = ?auto_103838 ?auto_103837 ) ) ( not ( = ?auto_103839 ?auto_103837 ) ) ( not ( = ?auto_103841 ?auto_103837 ) ) ( not ( = ?auto_103840 ?auto_103837 ) ) ( not ( = ?auto_103842 ?auto_103837 ) ) ( not ( = ?auto_103836 ?auto_103837 ) ) ( ON ?auto_103842 ?auto_103840 ) ( CLEAR ?auto_103842 ) ( ON-TABLE ?auto_103837 ) ( HOLDING ?auto_103836 ) ( CLEAR ?auto_103841 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103835 ?auto_103838 ?auto_103839 ?auto_103841 ?auto_103836 )
      ( MAKE-1PILE ?auto_103835 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103881 - BLOCK
      ?auto_103882 - BLOCK
      ?auto_103883 - BLOCK
      ?auto_103884 - BLOCK
      ?auto_103885 - BLOCK
      ?auto_103886 - BLOCK
    )
    :vars
    (
      ?auto_103887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103881 ) ( ON ?auto_103882 ?auto_103881 ) ( ON ?auto_103883 ?auto_103882 ) ( ON ?auto_103884 ?auto_103883 ) ( not ( = ?auto_103881 ?auto_103882 ) ) ( not ( = ?auto_103881 ?auto_103883 ) ) ( not ( = ?auto_103881 ?auto_103884 ) ) ( not ( = ?auto_103881 ?auto_103885 ) ) ( not ( = ?auto_103881 ?auto_103886 ) ) ( not ( = ?auto_103882 ?auto_103883 ) ) ( not ( = ?auto_103882 ?auto_103884 ) ) ( not ( = ?auto_103882 ?auto_103885 ) ) ( not ( = ?auto_103882 ?auto_103886 ) ) ( not ( = ?auto_103883 ?auto_103884 ) ) ( not ( = ?auto_103883 ?auto_103885 ) ) ( not ( = ?auto_103883 ?auto_103886 ) ) ( not ( = ?auto_103884 ?auto_103885 ) ) ( not ( = ?auto_103884 ?auto_103886 ) ) ( not ( = ?auto_103885 ?auto_103886 ) ) ( ON ?auto_103886 ?auto_103887 ) ( not ( = ?auto_103881 ?auto_103887 ) ) ( not ( = ?auto_103882 ?auto_103887 ) ) ( not ( = ?auto_103883 ?auto_103887 ) ) ( not ( = ?auto_103884 ?auto_103887 ) ) ( not ( = ?auto_103885 ?auto_103887 ) ) ( not ( = ?auto_103886 ?auto_103887 ) ) ( CLEAR ?auto_103884 ) ( ON ?auto_103885 ?auto_103886 ) ( CLEAR ?auto_103885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103887 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103887 ?auto_103886 )
      ( MAKE-6PILE ?auto_103881 ?auto_103882 ?auto_103883 ?auto_103884 ?auto_103885 ?auto_103886 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103888 - BLOCK
      ?auto_103889 - BLOCK
      ?auto_103890 - BLOCK
      ?auto_103891 - BLOCK
      ?auto_103892 - BLOCK
      ?auto_103893 - BLOCK
    )
    :vars
    (
      ?auto_103894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103888 ) ( ON ?auto_103889 ?auto_103888 ) ( ON ?auto_103890 ?auto_103889 ) ( not ( = ?auto_103888 ?auto_103889 ) ) ( not ( = ?auto_103888 ?auto_103890 ) ) ( not ( = ?auto_103888 ?auto_103891 ) ) ( not ( = ?auto_103888 ?auto_103892 ) ) ( not ( = ?auto_103888 ?auto_103893 ) ) ( not ( = ?auto_103889 ?auto_103890 ) ) ( not ( = ?auto_103889 ?auto_103891 ) ) ( not ( = ?auto_103889 ?auto_103892 ) ) ( not ( = ?auto_103889 ?auto_103893 ) ) ( not ( = ?auto_103890 ?auto_103891 ) ) ( not ( = ?auto_103890 ?auto_103892 ) ) ( not ( = ?auto_103890 ?auto_103893 ) ) ( not ( = ?auto_103891 ?auto_103892 ) ) ( not ( = ?auto_103891 ?auto_103893 ) ) ( not ( = ?auto_103892 ?auto_103893 ) ) ( ON ?auto_103893 ?auto_103894 ) ( not ( = ?auto_103888 ?auto_103894 ) ) ( not ( = ?auto_103889 ?auto_103894 ) ) ( not ( = ?auto_103890 ?auto_103894 ) ) ( not ( = ?auto_103891 ?auto_103894 ) ) ( not ( = ?auto_103892 ?auto_103894 ) ) ( not ( = ?auto_103893 ?auto_103894 ) ) ( ON ?auto_103892 ?auto_103893 ) ( CLEAR ?auto_103892 ) ( ON-TABLE ?auto_103894 ) ( HOLDING ?auto_103891 ) ( CLEAR ?auto_103890 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103888 ?auto_103889 ?auto_103890 ?auto_103891 )
      ( MAKE-6PILE ?auto_103888 ?auto_103889 ?auto_103890 ?auto_103891 ?auto_103892 ?auto_103893 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103895 - BLOCK
      ?auto_103896 - BLOCK
      ?auto_103897 - BLOCK
      ?auto_103898 - BLOCK
      ?auto_103899 - BLOCK
      ?auto_103900 - BLOCK
    )
    :vars
    (
      ?auto_103901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103895 ) ( ON ?auto_103896 ?auto_103895 ) ( ON ?auto_103897 ?auto_103896 ) ( not ( = ?auto_103895 ?auto_103896 ) ) ( not ( = ?auto_103895 ?auto_103897 ) ) ( not ( = ?auto_103895 ?auto_103898 ) ) ( not ( = ?auto_103895 ?auto_103899 ) ) ( not ( = ?auto_103895 ?auto_103900 ) ) ( not ( = ?auto_103896 ?auto_103897 ) ) ( not ( = ?auto_103896 ?auto_103898 ) ) ( not ( = ?auto_103896 ?auto_103899 ) ) ( not ( = ?auto_103896 ?auto_103900 ) ) ( not ( = ?auto_103897 ?auto_103898 ) ) ( not ( = ?auto_103897 ?auto_103899 ) ) ( not ( = ?auto_103897 ?auto_103900 ) ) ( not ( = ?auto_103898 ?auto_103899 ) ) ( not ( = ?auto_103898 ?auto_103900 ) ) ( not ( = ?auto_103899 ?auto_103900 ) ) ( ON ?auto_103900 ?auto_103901 ) ( not ( = ?auto_103895 ?auto_103901 ) ) ( not ( = ?auto_103896 ?auto_103901 ) ) ( not ( = ?auto_103897 ?auto_103901 ) ) ( not ( = ?auto_103898 ?auto_103901 ) ) ( not ( = ?auto_103899 ?auto_103901 ) ) ( not ( = ?auto_103900 ?auto_103901 ) ) ( ON ?auto_103899 ?auto_103900 ) ( ON-TABLE ?auto_103901 ) ( CLEAR ?auto_103897 ) ( ON ?auto_103898 ?auto_103899 ) ( CLEAR ?auto_103898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103901 ?auto_103900 ?auto_103899 )
      ( MAKE-6PILE ?auto_103895 ?auto_103896 ?auto_103897 ?auto_103898 ?auto_103899 ?auto_103900 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103902 - BLOCK
      ?auto_103903 - BLOCK
      ?auto_103904 - BLOCK
      ?auto_103905 - BLOCK
      ?auto_103906 - BLOCK
      ?auto_103907 - BLOCK
    )
    :vars
    (
      ?auto_103908 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103902 ) ( ON ?auto_103903 ?auto_103902 ) ( not ( = ?auto_103902 ?auto_103903 ) ) ( not ( = ?auto_103902 ?auto_103904 ) ) ( not ( = ?auto_103902 ?auto_103905 ) ) ( not ( = ?auto_103902 ?auto_103906 ) ) ( not ( = ?auto_103902 ?auto_103907 ) ) ( not ( = ?auto_103903 ?auto_103904 ) ) ( not ( = ?auto_103903 ?auto_103905 ) ) ( not ( = ?auto_103903 ?auto_103906 ) ) ( not ( = ?auto_103903 ?auto_103907 ) ) ( not ( = ?auto_103904 ?auto_103905 ) ) ( not ( = ?auto_103904 ?auto_103906 ) ) ( not ( = ?auto_103904 ?auto_103907 ) ) ( not ( = ?auto_103905 ?auto_103906 ) ) ( not ( = ?auto_103905 ?auto_103907 ) ) ( not ( = ?auto_103906 ?auto_103907 ) ) ( ON ?auto_103907 ?auto_103908 ) ( not ( = ?auto_103902 ?auto_103908 ) ) ( not ( = ?auto_103903 ?auto_103908 ) ) ( not ( = ?auto_103904 ?auto_103908 ) ) ( not ( = ?auto_103905 ?auto_103908 ) ) ( not ( = ?auto_103906 ?auto_103908 ) ) ( not ( = ?auto_103907 ?auto_103908 ) ) ( ON ?auto_103906 ?auto_103907 ) ( ON-TABLE ?auto_103908 ) ( ON ?auto_103905 ?auto_103906 ) ( CLEAR ?auto_103905 ) ( HOLDING ?auto_103904 ) ( CLEAR ?auto_103903 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103902 ?auto_103903 ?auto_103904 )
      ( MAKE-6PILE ?auto_103902 ?auto_103903 ?auto_103904 ?auto_103905 ?auto_103906 ?auto_103907 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103909 - BLOCK
      ?auto_103910 - BLOCK
      ?auto_103911 - BLOCK
      ?auto_103912 - BLOCK
      ?auto_103913 - BLOCK
      ?auto_103914 - BLOCK
    )
    :vars
    (
      ?auto_103915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103909 ) ( ON ?auto_103910 ?auto_103909 ) ( not ( = ?auto_103909 ?auto_103910 ) ) ( not ( = ?auto_103909 ?auto_103911 ) ) ( not ( = ?auto_103909 ?auto_103912 ) ) ( not ( = ?auto_103909 ?auto_103913 ) ) ( not ( = ?auto_103909 ?auto_103914 ) ) ( not ( = ?auto_103910 ?auto_103911 ) ) ( not ( = ?auto_103910 ?auto_103912 ) ) ( not ( = ?auto_103910 ?auto_103913 ) ) ( not ( = ?auto_103910 ?auto_103914 ) ) ( not ( = ?auto_103911 ?auto_103912 ) ) ( not ( = ?auto_103911 ?auto_103913 ) ) ( not ( = ?auto_103911 ?auto_103914 ) ) ( not ( = ?auto_103912 ?auto_103913 ) ) ( not ( = ?auto_103912 ?auto_103914 ) ) ( not ( = ?auto_103913 ?auto_103914 ) ) ( ON ?auto_103914 ?auto_103915 ) ( not ( = ?auto_103909 ?auto_103915 ) ) ( not ( = ?auto_103910 ?auto_103915 ) ) ( not ( = ?auto_103911 ?auto_103915 ) ) ( not ( = ?auto_103912 ?auto_103915 ) ) ( not ( = ?auto_103913 ?auto_103915 ) ) ( not ( = ?auto_103914 ?auto_103915 ) ) ( ON ?auto_103913 ?auto_103914 ) ( ON-TABLE ?auto_103915 ) ( ON ?auto_103912 ?auto_103913 ) ( CLEAR ?auto_103910 ) ( ON ?auto_103911 ?auto_103912 ) ( CLEAR ?auto_103911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103915 ?auto_103914 ?auto_103913 ?auto_103912 )
      ( MAKE-6PILE ?auto_103909 ?auto_103910 ?auto_103911 ?auto_103912 ?auto_103913 ?auto_103914 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103916 - BLOCK
      ?auto_103917 - BLOCK
      ?auto_103918 - BLOCK
      ?auto_103919 - BLOCK
      ?auto_103920 - BLOCK
      ?auto_103921 - BLOCK
    )
    :vars
    (
      ?auto_103922 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103916 ) ( not ( = ?auto_103916 ?auto_103917 ) ) ( not ( = ?auto_103916 ?auto_103918 ) ) ( not ( = ?auto_103916 ?auto_103919 ) ) ( not ( = ?auto_103916 ?auto_103920 ) ) ( not ( = ?auto_103916 ?auto_103921 ) ) ( not ( = ?auto_103917 ?auto_103918 ) ) ( not ( = ?auto_103917 ?auto_103919 ) ) ( not ( = ?auto_103917 ?auto_103920 ) ) ( not ( = ?auto_103917 ?auto_103921 ) ) ( not ( = ?auto_103918 ?auto_103919 ) ) ( not ( = ?auto_103918 ?auto_103920 ) ) ( not ( = ?auto_103918 ?auto_103921 ) ) ( not ( = ?auto_103919 ?auto_103920 ) ) ( not ( = ?auto_103919 ?auto_103921 ) ) ( not ( = ?auto_103920 ?auto_103921 ) ) ( ON ?auto_103921 ?auto_103922 ) ( not ( = ?auto_103916 ?auto_103922 ) ) ( not ( = ?auto_103917 ?auto_103922 ) ) ( not ( = ?auto_103918 ?auto_103922 ) ) ( not ( = ?auto_103919 ?auto_103922 ) ) ( not ( = ?auto_103920 ?auto_103922 ) ) ( not ( = ?auto_103921 ?auto_103922 ) ) ( ON ?auto_103920 ?auto_103921 ) ( ON-TABLE ?auto_103922 ) ( ON ?auto_103919 ?auto_103920 ) ( ON ?auto_103918 ?auto_103919 ) ( CLEAR ?auto_103918 ) ( HOLDING ?auto_103917 ) ( CLEAR ?auto_103916 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103916 ?auto_103917 )
      ( MAKE-6PILE ?auto_103916 ?auto_103917 ?auto_103918 ?auto_103919 ?auto_103920 ?auto_103921 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103923 - BLOCK
      ?auto_103924 - BLOCK
      ?auto_103925 - BLOCK
      ?auto_103926 - BLOCK
      ?auto_103927 - BLOCK
      ?auto_103928 - BLOCK
    )
    :vars
    (
      ?auto_103929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_103923 ) ( not ( = ?auto_103923 ?auto_103924 ) ) ( not ( = ?auto_103923 ?auto_103925 ) ) ( not ( = ?auto_103923 ?auto_103926 ) ) ( not ( = ?auto_103923 ?auto_103927 ) ) ( not ( = ?auto_103923 ?auto_103928 ) ) ( not ( = ?auto_103924 ?auto_103925 ) ) ( not ( = ?auto_103924 ?auto_103926 ) ) ( not ( = ?auto_103924 ?auto_103927 ) ) ( not ( = ?auto_103924 ?auto_103928 ) ) ( not ( = ?auto_103925 ?auto_103926 ) ) ( not ( = ?auto_103925 ?auto_103927 ) ) ( not ( = ?auto_103925 ?auto_103928 ) ) ( not ( = ?auto_103926 ?auto_103927 ) ) ( not ( = ?auto_103926 ?auto_103928 ) ) ( not ( = ?auto_103927 ?auto_103928 ) ) ( ON ?auto_103928 ?auto_103929 ) ( not ( = ?auto_103923 ?auto_103929 ) ) ( not ( = ?auto_103924 ?auto_103929 ) ) ( not ( = ?auto_103925 ?auto_103929 ) ) ( not ( = ?auto_103926 ?auto_103929 ) ) ( not ( = ?auto_103927 ?auto_103929 ) ) ( not ( = ?auto_103928 ?auto_103929 ) ) ( ON ?auto_103927 ?auto_103928 ) ( ON-TABLE ?auto_103929 ) ( ON ?auto_103926 ?auto_103927 ) ( ON ?auto_103925 ?auto_103926 ) ( CLEAR ?auto_103923 ) ( ON ?auto_103924 ?auto_103925 ) ( CLEAR ?auto_103924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103929 ?auto_103928 ?auto_103927 ?auto_103926 ?auto_103925 )
      ( MAKE-6PILE ?auto_103923 ?auto_103924 ?auto_103925 ?auto_103926 ?auto_103927 ?auto_103928 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103930 - BLOCK
      ?auto_103931 - BLOCK
      ?auto_103932 - BLOCK
      ?auto_103933 - BLOCK
      ?auto_103934 - BLOCK
      ?auto_103935 - BLOCK
    )
    :vars
    (
      ?auto_103936 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103930 ?auto_103931 ) ) ( not ( = ?auto_103930 ?auto_103932 ) ) ( not ( = ?auto_103930 ?auto_103933 ) ) ( not ( = ?auto_103930 ?auto_103934 ) ) ( not ( = ?auto_103930 ?auto_103935 ) ) ( not ( = ?auto_103931 ?auto_103932 ) ) ( not ( = ?auto_103931 ?auto_103933 ) ) ( not ( = ?auto_103931 ?auto_103934 ) ) ( not ( = ?auto_103931 ?auto_103935 ) ) ( not ( = ?auto_103932 ?auto_103933 ) ) ( not ( = ?auto_103932 ?auto_103934 ) ) ( not ( = ?auto_103932 ?auto_103935 ) ) ( not ( = ?auto_103933 ?auto_103934 ) ) ( not ( = ?auto_103933 ?auto_103935 ) ) ( not ( = ?auto_103934 ?auto_103935 ) ) ( ON ?auto_103935 ?auto_103936 ) ( not ( = ?auto_103930 ?auto_103936 ) ) ( not ( = ?auto_103931 ?auto_103936 ) ) ( not ( = ?auto_103932 ?auto_103936 ) ) ( not ( = ?auto_103933 ?auto_103936 ) ) ( not ( = ?auto_103934 ?auto_103936 ) ) ( not ( = ?auto_103935 ?auto_103936 ) ) ( ON ?auto_103934 ?auto_103935 ) ( ON-TABLE ?auto_103936 ) ( ON ?auto_103933 ?auto_103934 ) ( ON ?auto_103932 ?auto_103933 ) ( ON ?auto_103931 ?auto_103932 ) ( CLEAR ?auto_103931 ) ( HOLDING ?auto_103930 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_103930 )
      ( MAKE-6PILE ?auto_103930 ?auto_103931 ?auto_103932 ?auto_103933 ?auto_103934 ?auto_103935 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103937 - BLOCK
      ?auto_103938 - BLOCK
      ?auto_103939 - BLOCK
      ?auto_103940 - BLOCK
      ?auto_103941 - BLOCK
      ?auto_103942 - BLOCK
    )
    :vars
    (
      ?auto_103943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103937 ?auto_103938 ) ) ( not ( = ?auto_103937 ?auto_103939 ) ) ( not ( = ?auto_103937 ?auto_103940 ) ) ( not ( = ?auto_103937 ?auto_103941 ) ) ( not ( = ?auto_103937 ?auto_103942 ) ) ( not ( = ?auto_103938 ?auto_103939 ) ) ( not ( = ?auto_103938 ?auto_103940 ) ) ( not ( = ?auto_103938 ?auto_103941 ) ) ( not ( = ?auto_103938 ?auto_103942 ) ) ( not ( = ?auto_103939 ?auto_103940 ) ) ( not ( = ?auto_103939 ?auto_103941 ) ) ( not ( = ?auto_103939 ?auto_103942 ) ) ( not ( = ?auto_103940 ?auto_103941 ) ) ( not ( = ?auto_103940 ?auto_103942 ) ) ( not ( = ?auto_103941 ?auto_103942 ) ) ( ON ?auto_103942 ?auto_103943 ) ( not ( = ?auto_103937 ?auto_103943 ) ) ( not ( = ?auto_103938 ?auto_103943 ) ) ( not ( = ?auto_103939 ?auto_103943 ) ) ( not ( = ?auto_103940 ?auto_103943 ) ) ( not ( = ?auto_103941 ?auto_103943 ) ) ( not ( = ?auto_103942 ?auto_103943 ) ) ( ON ?auto_103941 ?auto_103942 ) ( ON-TABLE ?auto_103943 ) ( ON ?auto_103940 ?auto_103941 ) ( ON ?auto_103939 ?auto_103940 ) ( ON ?auto_103938 ?auto_103939 ) ( ON ?auto_103937 ?auto_103938 ) ( CLEAR ?auto_103937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103943 ?auto_103942 ?auto_103941 ?auto_103940 ?auto_103939 ?auto_103938 )
      ( MAKE-6PILE ?auto_103937 ?auto_103938 ?auto_103939 ?auto_103940 ?auto_103941 ?auto_103942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103950 - BLOCK
      ?auto_103951 - BLOCK
      ?auto_103952 - BLOCK
      ?auto_103953 - BLOCK
      ?auto_103954 - BLOCK
      ?auto_103955 - BLOCK
    )
    :vars
    (
      ?auto_103956 - BLOCK
      ?auto_103957 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103950 ?auto_103951 ) ) ( not ( = ?auto_103950 ?auto_103952 ) ) ( not ( = ?auto_103950 ?auto_103953 ) ) ( not ( = ?auto_103950 ?auto_103954 ) ) ( not ( = ?auto_103950 ?auto_103955 ) ) ( not ( = ?auto_103951 ?auto_103952 ) ) ( not ( = ?auto_103951 ?auto_103953 ) ) ( not ( = ?auto_103951 ?auto_103954 ) ) ( not ( = ?auto_103951 ?auto_103955 ) ) ( not ( = ?auto_103952 ?auto_103953 ) ) ( not ( = ?auto_103952 ?auto_103954 ) ) ( not ( = ?auto_103952 ?auto_103955 ) ) ( not ( = ?auto_103953 ?auto_103954 ) ) ( not ( = ?auto_103953 ?auto_103955 ) ) ( not ( = ?auto_103954 ?auto_103955 ) ) ( ON ?auto_103955 ?auto_103956 ) ( not ( = ?auto_103950 ?auto_103956 ) ) ( not ( = ?auto_103951 ?auto_103956 ) ) ( not ( = ?auto_103952 ?auto_103956 ) ) ( not ( = ?auto_103953 ?auto_103956 ) ) ( not ( = ?auto_103954 ?auto_103956 ) ) ( not ( = ?auto_103955 ?auto_103956 ) ) ( ON ?auto_103954 ?auto_103955 ) ( ON-TABLE ?auto_103956 ) ( ON ?auto_103953 ?auto_103954 ) ( ON ?auto_103952 ?auto_103953 ) ( ON ?auto_103951 ?auto_103952 ) ( CLEAR ?auto_103951 ) ( ON ?auto_103950 ?auto_103957 ) ( CLEAR ?auto_103950 ) ( HAND-EMPTY ) ( not ( = ?auto_103950 ?auto_103957 ) ) ( not ( = ?auto_103951 ?auto_103957 ) ) ( not ( = ?auto_103952 ?auto_103957 ) ) ( not ( = ?auto_103953 ?auto_103957 ) ) ( not ( = ?auto_103954 ?auto_103957 ) ) ( not ( = ?auto_103955 ?auto_103957 ) ) ( not ( = ?auto_103956 ?auto_103957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_103950 ?auto_103957 )
      ( MAKE-6PILE ?auto_103950 ?auto_103951 ?auto_103952 ?auto_103953 ?auto_103954 ?auto_103955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103958 - BLOCK
      ?auto_103959 - BLOCK
      ?auto_103960 - BLOCK
      ?auto_103961 - BLOCK
      ?auto_103962 - BLOCK
      ?auto_103963 - BLOCK
    )
    :vars
    (
      ?auto_103965 - BLOCK
      ?auto_103964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103958 ?auto_103959 ) ) ( not ( = ?auto_103958 ?auto_103960 ) ) ( not ( = ?auto_103958 ?auto_103961 ) ) ( not ( = ?auto_103958 ?auto_103962 ) ) ( not ( = ?auto_103958 ?auto_103963 ) ) ( not ( = ?auto_103959 ?auto_103960 ) ) ( not ( = ?auto_103959 ?auto_103961 ) ) ( not ( = ?auto_103959 ?auto_103962 ) ) ( not ( = ?auto_103959 ?auto_103963 ) ) ( not ( = ?auto_103960 ?auto_103961 ) ) ( not ( = ?auto_103960 ?auto_103962 ) ) ( not ( = ?auto_103960 ?auto_103963 ) ) ( not ( = ?auto_103961 ?auto_103962 ) ) ( not ( = ?auto_103961 ?auto_103963 ) ) ( not ( = ?auto_103962 ?auto_103963 ) ) ( ON ?auto_103963 ?auto_103965 ) ( not ( = ?auto_103958 ?auto_103965 ) ) ( not ( = ?auto_103959 ?auto_103965 ) ) ( not ( = ?auto_103960 ?auto_103965 ) ) ( not ( = ?auto_103961 ?auto_103965 ) ) ( not ( = ?auto_103962 ?auto_103965 ) ) ( not ( = ?auto_103963 ?auto_103965 ) ) ( ON ?auto_103962 ?auto_103963 ) ( ON-TABLE ?auto_103965 ) ( ON ?auto_103961 ?auto_103962 ) ( ON ?auto_103960 ?auto_103961 ) ( ON ?auto_103958 ?auto_103964 ) ( CLEAR ?auto_103958 ) ( not ( = ?auto_103958 ?auto_103964 ) ) ( not ( = ?auto_103959 ?auto_103964 ) ) ( not ( = ?auto_103960 ?auto_103964 ) ) ( not ( = ?auto_103961 ?auto_103964 ) ) ( not ( = ?auto_103962 ?auto_103964 ) ) ( not ( = ?auto_103963 ?auto_103964 ) ) ( not ( = ?auto_103965 ?auto_103964 ) ) ( HOLDING ?auto_103959 ) ( CLEAR ?auto_103960 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_103965 ?auto_103963 ?auto_103962 ?auto_103961 ?auto_103960 ?auto_103959 )
      ( MAKE-6PILE ?auto_103958 ?auto_103959 ?auto_103960 ?auto_103961 ?auto_103962 ?auto_103963 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103966 - BLOCK
      ?auto_103967 - BLOCK
      ?auto_103968 - BLOCK
      ?auto_103969 - BLOCK
      ?auto_103970 - BLOCK
      ?auto_103971 - BLOCK
    )
    :vars
    (
      ?auto_103973 - BLOCK
      ?auto_103972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103966 ?auto_103967 ) ) ( not ( = ?auto_103966 ?auto_103968 ) ) ( not ( = ?auto_103966 ?auto_103969 ) ) ( not ( = ?auto_103966 ?auto_103970 ) ) ( not ( = ?auto_103966 ?auto_103971 ) ) ( not ( = ?auto_103967 ?auto_103968 ) ) ( not ( = ?auto_103967 ?auto_103969 ) ) ( not ( = ?auto_103967 ?auto_103970 ) ) ( not ( = ?auto_103967 ?auto_103971 ) ) ( not ( = ?auto_103968 ?auto_103969 ) ) ( not ( = ?auto_103968 ?auto_103970 ) ) ( not ( = ?auto_103968 ?auto_103971 ) ) ( not ( = ?auto_103969 ?auto_103970 ) ) ( not ( = ?auto_103969 ?auto_103971 ) ) ( not ( = ?auto_103970 ?auto_103971 ) ) ( ON ?auto_103971 ?auto_103973 ) ( not ( = ?auto_103966 ?auto_103973 ) ) ( not ( = ?auto_103967 ?auto_103973 ) ) ( not ( = ?auto_103968 ?auto_103973 ) ) ( not ( = ?auto_103969 ?auto_103973 ) ) ( not ( = ?auto_103970 ?auto_103973 ) ) ( not ( = ?auto_103971 ?auto_103973 ) ) ( ON ?auto_103970 ?auto_103971 ) ( ON-TABLE ?auto_103973 ) ( ON ?auto_103969 ?auto_103970 ) ( ON ?auto_103968 ?auto_103969 ) ( ON ?auto_103966 ?auto_103972 ) ( not ( = ?auto_103966 ?auto_103972 ) ) ( not ( = ?auto_103967 ?auto_103972 ) ) ( not ( = ?auto_103968 ?auto_103972 ) ) ( not ( = ?auto_103969 ?auto_103972 ) ) ( not ( = ?auto_103970 ?auto_103972 ) ) ( not ( = ?auto_103971 ?auto_103972 ) ) ( not ( = ?auto_103973 ?auto_103972 ) ) ( CLEAR ?auto_103968 ) ( ON ?auto_103967 ?auto_103966 ) ( CLEAR ?auto_103967 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_103972 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_103972 ?auto_103966 )
      ( MAKE-6PILE ?auto_103966 ?auto_103967 ?auto_103968 ?auto_103969 ?auto_103970 ?auto_103971 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103974 - BLOCK
      ?auto_103975 - BLOCK
      ?auto_103976 - BLOCK
      ?auto_103977 - BLOCK
      ?auto_103978 - BLOCK
      ?auto_103979 - BLOCK
    )
    :vars
    (
      ?auto_103980 - BLOCK
      ?auto_103981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103974 ?auto_103975 ) ) ( not ( = ?auto_103974 ?auto_103976 ) ) ( not ( = ?auto_103974 ?auto_103977 ) ) ( not ( = ?auto_103974 ?auto_103978 ) ) ( not ( = ?auto_103974 ?auto_103979 ) ) ( not ( = ?auto_103975 ?auto_103976 ) ) ( not ( = ?auto_103975 ?auto_103977 ) ) ( not ( = ?auto_103975 ?auto_103978 ) ) ( not ( = ?auto_103975 ?auto_103979 ) ) ( not ( = ?auto_103976 ?auto_103977 ) ) ( not ( = ?auto_103976 ?auto_103978 ) ) ( not ( = ?auto_103976 ?auto_103979 ) ) ( not ( = ?auto_103977 ?auto_103978 ) ) ( not ( = ?auto_103977 ?auto_103979 ) ) ( not ( = ?auto_103978 ?auto_103979 ) ) ( ON ?auto_103979 ?auto_103980 ) ( not ( = ?auto_103974 ?auto_103980 ) ) ( not ( = ?auto_103975 ?auto_103980 ) ) ( not ( = ?auto_103976 ?auto_103980 ) ) ( not ( = ?auto_103977 ?auto_103980 ) ) ( not ( = ?auto_103978 ?auto_103980 ) ) ( not ( = ?auto_103979 ?auto_103980 ) ) ( ON ?auto_103978 ?auto_103979 ) ( ON-TABLE ?auto_103980 ) ( ON ?auto_103977 ?auto_103978 ) ( ON ?auto_103974 ?auto_103981 ) ( not ( = ?auto_103974 ?auto_103981 ) ) ( not ( = ?auto_103975 ?auto_103981 ) ) ( not ( = ?auto_103976 ?auto_103981 ) ) ( not ( = ?auto_103977 ?auto_103981 ) ) ( not ( = ?auto_103978 ?auto_103981 ) ) ( not ( = ?auto_103979 ?auto_103981 ) ) ( not ( = ?auto_103980 ?auto_103981 ) ) ( ON ?auto_103975 ?auto_103974 ) ( CLEAR ?auto_103975 ) ( ON-TABLE ?auto_103981 ) ( HOLDING ?auto_103976 ) ( CLEAR ?auto_103977 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_103980 ?auto_103979 ?auto_103978 ?auto_103977 ?auto_103976 )
      ( MAKE-6PILE ?auto_103974 ?auto_103975 ?auto_103976 ?auto_103977 ?auto_103978 ?auto_103979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103982 - BLOCK
      ?auto_103983 - BLOCK
      ?auto_103984 - BLOCK
      ?auto_103985 - BLOCK
      ?auto_103986 - BLOCK
      ?auto_103987 - BLOCK
    )
    :vars
    (
      ?auto_103989 - BLOCK
      ?auto_103988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103982 ?auto_103983 ) ) ( not ( = ?auto_103982 ?auto_103984 ) ) ( not ( = ?auto_103982 ?auto_103985 ) ) ( not ( = ?auto_103982 ?auto_103986 ) ) ( not ( = ?auto_103982 ?auto_103987 ) ) ( not ( = ?auto_103983 ?auto_103984 ) ) ( not ( = ?auto_103983 ?auto_103985 ) ) ( not ( = ?auto_103983 ?auto_103986 ) ) ( not ( = ?auto_103983 ?auto_103987 ) ) ( not ( = ?auto_103984 ?auto_103985 ) ) ( not ( = ?auto_103984 ?auto_103986 ) ) ( not ( = ?auto_103984 ?auto_103987 ) ) ( not ( = ?auto_103985 ?auto_103986 ) ) ( not ( = ?auto_103985 ?auto_103987 ) ) ( not ( = ?auto_103986 ?auto_103987 ) ) ( ON ?auto_103987 ?auto_103989 ) ( not ( = ?auto_103982 ?auto_103989 ) ) ( not ( = ?auto_103983 ?auto_103989 ) ) ( not ( = ?auto_103984 ?auto_103989 ) ) ( not ( = ?auto_103985 ?auto_103989 ) ) ( not ( = ?auto_103986 ?auto_103989 ) ) ( not ( = ?auto_103987 ?auto_103989 ) ) ( ON ?auto_103986 ?auto_103987 ) ( ON-TABLE ?auto_103989 ) ( ON ?auto_103985 ?auto_103986 ) ( ON ?auto_103982 ?auto_103988 ) ( not ( = ?auto_103982 ?auto_103988 ) ) ( not ( = ?auto_103983 ?auto_103988 ) ) ( not ( = ?auto_103984 ?auto_103988 ) ) ( not ( = ?auto_103985 ?auto_103988 ) ) ( not ( = ?auto_103986 ?auto_103988 ) ) ( not ( = ?auto_103987 ?auto_103988 ) ) ( not ( = ?auto_103989 ?auto_103988 ) ) ( ON ?auto_103983 ?auto_103982 ) ( ON-TABLE ?auto_103988 ) ( CLEAR ?auto_103985 ) ( ON ?auto_103984 ?auto_103983 ) ( CLEAR ?auto_103984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_103988 ?auto_103982 ?auto_103983 )
      ( MAKE-6PILE ?auto_103982 ?auto_103983 ?auto_103984 ?auto_103985 ?auto_103986 ?auto_103987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103990 - BLOCK
      ?auto_103991 - BLOCK
      ?auto_103992 - BLOCK
      ?auto_103993 - BLOCK
      ?auto_103994 - BLOCK
      ?auto_103995 - BLOCK
    )
    :vars
    (
      ?auto_103997 - BLOCK
      ?auto_103996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103990 ?auto_103991 ) ) ( not ( = ?auto_103990 ?auto_103992 ) ) ( not ( = ?auto_103990 ?auto_103993 ) ) ( not ( = ?auto_103990 ?auto_103994 ) ) ( not ( = ?auto_103990 ?auto_103995 ) ) ( not ( = ?auto_103991 ?auto_103992 ) ) ( not ( = ?auto_103991 ?auto_103993 ) ) ( not ( = ?auto_103991 ?auto_103994 ) ) ( not ( = ?auto_103991 ?auto_103995 ) ) ( not ( = ?auto_103992 ?auto_103993 ) ) ( not ( = ?auto_103992 ?auto_103994 ) ) ( not ( = ?auto_103992 ?auto_103995 ) ) ( not ( = ?auto_103993 ?auto_103994 ) ) ( not ( = ?auto_103993 ?auto_103995 ) ) ( not ( = ?auto_103994 ?auto_103995 ) ) ( ON ?auto_103995 ?auto_103997 ) ( not ( = ?auto_103990 ?auto_103997 ) ) ( not ( = ?auto_103991 ?auto_103997 ) ) ( not ( = ?auto_103992 ?auto_103997 ) ) ( not ( = ?auto_103993 ?auto_103997 ) ) ( not ( = ?auto_103994 ?auto_103997 ) ) ( not ( = ?auto_103995 ?auto_103997 ) ) ( ON ?auto_103994 ?auto_103995 ) ( ON-TABLE ?auto_103997 ) ( ON ?auto_103990 ?auto_103996 ) ( not ( = ?auto_103990 ?auto_103996 ) ) ( not ( = ?auto_103991 ?auto_103996 ) ) ( not ( = ?auto_103992 ?auto_103996 ) ) ( not ( = ?auto_103993 ?auto_103996 ) ) ( not ( = ?auto_103994 ?auto_103996 ) ) ( not ( = ?auto_103995 ?auto_103996 ) ) ( not ( = ?auto_103997 ?auto_103996 ) ) ( ON ?auto_103991 ?auto_103990 ) ( ON-TABLE ?auto_103996 ) ( ON ?auto_103992 ?auto_103991 ) ( CLEAR ?auto_103992 ) ( HOLDING ?auto_103993 ) ( CLEAR ?auto_103994 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_103997 ?auto_103995 ?auto_103994 ?auto_103993 )
      ( MAKE-6PILE ?auto_103990 ?auto_103991 ?auto_103992 ?auto_103993 ?auto_103994 ?auto_103995 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_103998 - BLOCK
      ?auto_103999 - BLOCK
      ?auto_104000 - BLOCK
      ?auto_104001 - BLOCK
      ?auto_104002 - BLOCK
      ?auto_104003 - BLOCK
    )
    :vars
    (
      ?auto_104005 - BLOCK
      ?auto_104004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_103998 ?auto_103999 ) ) ( not ( = ?auto_103998 ?auto_104000 ) ) ( not ( = ?auto_103998 ?auto_104001 ) ) ( not ( = ?auto_103998 ?auto_104002 ) ) ( not ( = ?auto_103998 ?auto_104003 ) ) ( not ( = ?auto_103999 ?auto_104000 ) ) ( not ( = ?auto_103999 ?auto_104001 ) ) ( not ( = ?auto_103999 ?auto_104002 ) ) ( not ( = ?auto_103999 ?auto_104003 ) ) ( not ( = ?auto_104000 ?auto_104001 ) ) ( not ( = ?auto_104000 ?auto_104002 ) ) ( not ( = ?auto_104000 ?auto_104003 ) ) ( not ( = ?auto_104001 ?auto_104002 ) ) ( not ( = ?auto_104001 ?auto_104003 ) ) ( not ( = ?auto_104002 ?auto_104003 ) ) ( ON ?auto_104003 ?auto_104005 ) ( not ( = ?auto_103998 ?auto_104005 ) ) ( not ( = ?auto_103999 ?auto_104005 ) ) ( not ( = ?auto_104000 ?auto_104005 ) ) ( not ( = ?auto_104001 ?auto_104005 ) ) ( not ( = ?auto_104002 ?auto_104005 ) ) ( not ( = ?auto_104003 ?auto_104005 ) ) ( ON ?auto_104002 ?auto_104003 ) ( ON-TABLE ?auto_104005 ) ( ON ?auto_103998 ?auto_104004 ) ( not ( = ?auto_103998 ?auto_104004 ) ) ( not ( = ?auto_103999 ?auto_104004 ) ) ( not ( = ?auto_104000 ?auto_104004 ) ) ( not ( = ?auto_104001 ?auto_104004 ) ) ( not ( = ?auto_104002 ?auto_104004 ) ) ( not ( = ?auto_104003 ?auto_104004 ) ) ( not ( = ?auto_104005 ?auto_104004 ) ) ( ON ?auto_103999 ?auto_103998 ) ( ON-TABLE ?auto_104004 ) ( ON ?auto_104000 ?auto_103999 ) ( CLEAR ?auto_104002 ) ( ON ?auto_104001 ?auto_104000 ) ( CLEAR ?auto_104001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104004 ?auto_103998 ?auto_103999 ?auto_104000 )
      ( MAKE-6PILE ?auto_103998 ?auto_103999 ?auto_104000 ?auto_104001 ?auto_104002 ?auto_104003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104006 - BLOCK
      ?auto_104007 - BLOCK
      ?auto_104008 - BLOCK
      ?auto_104009 - BLOCK
      ?auto_104010 - BLOCK
      ?auto_104011 - BLOCK
    )
    :vars
    (
      ?auto_104013 - BLOCK
      ?auto_104012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104006 ?auto_104007 ) ) ( not ( = ?auto_104006 ?auto_104008 ) ) ( not ( = ?auto_104006 ?auto_104009 ) ) ( not ( = ?auto_104006 ?auto_104010 ) ) ( not ( = ?auto_104006 ?auto_104011 ) ) ( not ( = ?auto_104007 ?auto_104008 ) ) ( not ( = ?auto_104007 ?auto_104009 ) ) ( not ( = ?auto_104007 ?auto_104010 ) ) ( not ( = ?auto_104007 ?auto_104011 ) ) ( not ( = ?auto_104008 ?auto_104009 ) ) ( not ( = ?auto_104008 ?auto_104010 ) ) ( not ( = ?auto_104008 ?auto_104011 ) ) ( not ( = ?auto_104009 ?auto_104010 ) ) ( not ( = ?auto_104009 ?auto_104011 ) ) ( not ( = ?auto_104010 ?auto_104011 ) ) ( ON ?auto_104011 ?auto_104013 ) ( not ( = ?auto_104006 ?auto_104013 ) ) ( not ( = ?auto_104007 ?auto_104013 ) ) ( not ( = ?auto_104008 ?auto_104013 ) ) ( not ( = ?auto_104009 ?auto_104013 ) ) ( not ( = ?auto_104010 ?auto_104013 ) ) ( not ( = ?auto_104011 ?auto_104013 ) ) ( ON-TABLE ?auto_104013 ) ( ON ?auto_104006 ?auto_104012 ) ( not ( = ?auto_104006 ?auto_104012 ) ) ( not ( = ?auto_104007 ?auto_104012 ) ) ( not ( = ?auto_104008 ?auto_104012 ) ) ( not ( = ?auto_104009 ?auto_104012 ) ) ( not ( = ?auto_104010 ?auto_104012 ) ) ( not ( = ?auto_104011 ?auto_104012 ) ) ( not ( = ?auto_104013 ?auto_104012 ) ) ( ON ?auto_104007 ?auto_104006 ) ( ON-TABLE ?auto_104012 ) ( ON ?auto_104008 ?auto_104007 ) ( ON ?auto_104009 ?auto_104008 ) ( CLEAR ?auto_104009 ) ( HOLDING ?auto_104010 ) ( CLEAR ?auto_104011 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104013 ?auto_104011 ?auto_104010 )
      ( MAKE-6PILE ?auto_104006 ?auto_104007 ?auto_104008 ?auto_104009 ?auto_104010 ?auto_104011 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104014 - BLOCK
      ?auto_104015 - BLOCK
      ?auto_104016 - BLOCK
      ?auto_104017 - BLOCK
      ?auto_104018 - BLOCK
      ?auto_104019 - BLOCK
    )
    :vars
    (
      ?auto_104020 - BLOCK
      ?auto_104021 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104014 ?auto_104015 ) ) ( not ( = ?auto_104014 ?auto_104016 ) ) ( not ( = ?auto_104014 ?auto_104017 ) ) ( not ( = ?auto_104014 ?auto_104018 ) ) ( not ( = ?auto_104014 ?auto_104019 ) ) ( not ( = ?auto_104015 ?auto_104016 ) ) ( not ( = ?auto_104015 ?auto_104017 ) ) ( not ( = ?auto_104015 ?auto_104018 ) ) ( not ( = ?auto_104015 ?auto_104019 ) ) ( not ( = ?auto_104016 ?auto_104017 ) ) ( not ( = ?auto_104016 ?auto_104018 ) ) ( not ( = ?auto_104016 ?auto_104019 ) ) ( not ( = ?auto_104017 ?auto_104018 ) ) ( not ( = ?auto_104017 ?auto_104019 ) ) ( not ( = ?auto_104018 ?auto_104019 ) ) ( ON ?auto_104019 ?auto_104020 ) ( not ( = ?auto_104014 ?auto_104020 ) ) ( not ( = ?auto_104015 ?auto_104020 ) ) ( not ( = ?auto_104016 ?auto_104020 ) ) ( not ( = ?auto_104017 ?auto_104020 ) ) ( not ( = ?auto_104018 ?auto_104020 ) ) ( not ( = ?auto_104019 ?auto_104020 ) ) ( ON-TABLE ?auto_104020 ) ( ON ?auto_104014 ?auto_104021 ) ( not ( = ?auto_104014 ?auto_104021 ) ) ( not ( = ?auto_104015 ?auto_104021 ) ) ( not ( = ?auto_104016 ?auto_104021 ) ) ( not ( = ?auto_104017 ?auto_104021 ) ) ( not ( = ?auto_104018 ?auto_104021 ) ) ( not ( = ?auto_104019 ?auto_104021 ) ) ( not ( = ?auto_104020 ?auto_104021 ) ) ( ON ?auto_104015 ?auto_104014 ) ( ON-TABLE ?auto_104021 ) ( ON ?auto_104016 ?auto_104015 ) ( ON ?auto_104017 ?auto_104016 ) ( CLEAR ?auto_104019 ) ( ON ?auto_104018 ?auto_104017 ) ( CLEAR ?auto_104018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104021 ?auto_104014 ?auto_104015 ?auto_104016 ?auto_104017 )
      ( MAKE-6PILE ?auto_104014 ?auto_104015 ?auto_104016 ?auto_104017 ?auto_104018 ?auto_104019 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104022 - BLOCK
      ?auto_104023 - BLOCK
      ?auto_104024 - BLOCK
      ?auto_104025 - BLOCK
      ?auto_104026 - BLOCK
      ?auto_104027 - BLOCK
    )
    :vars
    (
      ?auto_104028 - BLOCK
      ?auto_104029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104022 ?auto_104023 ) ) ( not ( = ?auto_104022 ?auto_104024 ) ) ( not ( = ?auto_104022 ?auto_104025 ) ) ( not ( = ?auto_104022 ?auto_104026 ) ) ( not ( = ?auto_104022 ?auto_104027 ) ) ( not ( = ?auto_104023 ?auto_104024 ) ) ( not ( = ?auto_104023 ?auto_104025 ) ) ( not ( = ?auto_104023 ?auto_104026 ) ) ( not ( = ?auto_104023 ?auto_104027 ) ) ( not ( = ?auto_104024 ?auto_104025 ) ) ( not ( = ?auto_104024 ?auto_104026 ) ) ( not ( = ?auto_104024 ?auto_104027 ) ) ( not ( = ?auto_104025 ?auto_104026 ) ) ( not ( = ?auto_104025 ?auto_104027 ) ) ( not ( = ?auto_104026 ?auto_104027 ) ) ( not ( = ?auto_104022 ?auto_104028 ) ) ( not ( = ?auto_104023 ?auto_104028 ) ) ( not ( = ?auto_104024 ?auto_104028 ) ) ( not ( = ?auto_104025 ?auto_104028 ) ) ( not ( = ?auto_104026 ?auto_104028 ) ) ( not ( = ?auto_104027 ?auto_104028 ) ) ( ON-TABLE ?auto_104028 ) ( ON ?auto_104022 ?auto_104029 ) ( not ( = ?auto_104022 ?auto_104029 ) ) ( not ( = ?auto_104023 ?auto_104029 ) ) ( not ( = ?auto_104024 ?auto_104029 ) ) ( not ( = ?auto_104025 ?auto_104029 ) ) ( not ( = ?auto_104026 ?auto_104029 ) ) ( not ( = ?auto_104027 ?auto_104029 ) ) ( not ( = ?auto_104028 ?auto_104029 ) ) ( ON ?auto_104023 ?auto_104022 ) ( ON-TABLE ?auto_104029 ) ( ON ?auto_104024 ?auto_104023 ) ( ON ?auto_104025 ?auto_104024 ) ( ON ?auto_104026 ?auto_104025 ) ( CLEAR ?auto_104026 ) ( HOLDING ?auto_104027 ) ( CLEAR ?auto_104028 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104028 ?auto_104027 )
      ( MAKE-6PILE ?auto_104022 ?auto_104023 ?auto_104024 ?auto_104025 ?auto_104026 ?auto_104027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104030 - BLOCK
      ?auto_104031 - BLOCK
      ?auto_104032 - BLOCK
      ?auto_104033 - BLOCK
      ?auto_104034 - BLOCK
      ?auto_104035 - BLOCK
    )
    :vars
    (
      ?auto_104037 - BLOCK
      ?auto_104036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104030 ?auto_104031 ) ) ( not ( = ?auto_104030 ?auto_104032 ) ) ( not ( = ?auto_104030 ?auto_104033 ) ) ( not ( = ?auto_104030 ?auto_104034 ) ) ( not ( = ?auto_104030 ?auto_104035 ) ) ( not ( = ?auto_104031 ?auto_104032 ) ) ( not ( = ?auto_104031 ?auto_104033 ) ) ( not ( = ?auto_104031 ?auto_104034 ) ) ( not ( = ?auto_104031 ?auto_104035 ) ) ( not ( = ?auto_104032 ?auto_104033 ) ) ( not ( = ?auto_104032 ?auto_104034 ) ) ( not ( = ?auto_104032 ?auto_104035 ) ) ( not ( = ?auto_104033 ?auto_104034 ) ) ( not ( = ?auto_104033 ?auto_104035 ) ) ( not ( = ?auto_104034 ?auto_104035 ) ) ( not ( = ?auto_104030 ?auto_104037 ) ) ( not ( = ?auto_104031 ?auto_104037 ) ) ( not ( = ?auto_104032 ?auto_104037 ) ) ( not ( = ?auto_104033 ?auto_104037 ) ) ( not ( = ?auto_104034 ?auto_104037 ) ) ( not ( = ?auto_104035 ?auto_104037 ) ) ( ON-TABLE ?auto_104037 ) ( ON ?auto_104030 ?auto_104036 ) ( not ( = ?auto_104030 ?auto_104036 ) ) ( not ( = ?auto_104031 ?auto_104036 ) ) ( not ( = ?auto_104032 ?auto_104036 ) ) ( not ( = ?auto_104033 ?auto_104036 ) ) ( not ( = ?auto_104034 ?auto_104036 ) ) ( not ( = ?auto_104035 ?auto_104036 ) ) ( not ( = ?auto_104037 ?auto_104036 ) ) ( ON ?auto_104031 ?auto_104030 ) ( ON-TABLE ?auto_104036 ) ( ON ?auto_104032 ?auto_104031 ) ( ON ?auto_104033 ?auto_104032 ) ( ON ?auto_104034 ?auto_104033 ) ( CLEAR ?auto_104037 ) ( ON ?auto_104035 ?auto_104034 ) ( CLEAR ?auto_104035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104036 ?auto_104030 ?auto_104031 ?auto_104032 ?auto_104033 ?auto_104034 )
      ( MAKE-6PILE ?auto_104030 ?auto_104031 ?auto_104032 ?auto_104033 ?auto_104034 ?auto_104035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104038 - BLOCK
      ?auto_104039 - BLOCK
      ?auto_104040 - BLOCK
      ?auto_104041 - BLOCK
      ?auto_104042 - BLOCK
      ?auto_104043 - BLOCK
    )
    :vars
    (
      ?auto_104044 - BLOCK
      ?auto_104045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104038 ?auto_104039 ) ) ( not ( = ?auto_104038 ?auto_104040 ) ) ( not ( = ?auto_104038 ?auto_104041 ) ) ( not ( = ?auto_104038 ?auto_104042 ) ) ( not ( = ?auto_104038 ?auto_104043 ) ) ( not ( = ?auto_104039 ?auto_104040 ) ) ( not ( = ?auto_104039 ?auto_104041 ) ) ( not ( = ?auto_104039 ?auto_104042 ) ) ( not ( = ?auto_104039 ?auto_104043 ) ) ( not ( = ?auto_104040 ?auto_104041 ) ) ( not ( = ?auto_104040 ?auto_104042 ) ) ( not ( = ?auto_104040 ?auto_104043 ) ) ( not ( = ?auto_104041 ?auto_104042 ) ) ( not ( = ?auto_104041 ?auto_104043 ) ) ( not ( = ?auto_104042 ?auto_104043 ) ) ( not ( = ?auto_104038 ?auto_104044 ) ) ( not ( = ?auto_104039 ?auto_104044 ) ) ( not ( = ?auto_104040 ?auto_104044 ) ) ( not ( = ?auto_104041 ?auto_104044 ) ) ( not ( = ?auto_104042 ?auto_104044 ) ) ( not ( = ?auto_104043 ?auto_104044 ) ) ( ON ?auto_104038 ?auto_104045 ) ( not ( = ?auto_104038 ?auto_104045 ) ) ( not ( = ?auto_104039 ?auto_104045 ) ) ( not ( = ?auto_104040 ?auto_104045 ) ) ( not ( = ?auto_104041 ?auto_104045 ) ) ( not ( = ?auto_104042 ?auto_104045 ) ) ( not ( = ?auto_104043 ?auto_104045 ) ) ( not ( = ?auto_104044 ?auto_104045 ) ) ( ON ?auto_104039 ?auto_104038 ) ( ON-TABLE ?auto_104045 ) ( ON ?auto_104040 ?auto_104039 ) ( ON ?auto_104041 ?auto_104040 ) ( ON ?auto_104042 ?auto_104041 ) ( ON ?auto_104043 ?auto_104042 ) ( CLEAR ?auto_104043 ) ( HOLDING ?auto_104044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104044 )
      ( MAKE-6PILE ?auto_104038 ?auto_104039 ?auto_104040 ?auto_104041 ?auto_104042 ?auto_104043 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_104046 - BLOCK
      ?auto_104047 - BLOCK
      ?auto_104048 - BLOCK
      ?auto_104049 - BLOCK
      ?auto_104050 - BLOCK
      ?auto_104051 - BLOCK
    )
    :vars
    (
      ?auto_104053 - BLOCK
      ?auto_104052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104046 ?auto_104047 ) ) ( not ( = ?auto_104046 ?auto_104048 ) ) ( not ( = ?auto_104046 ?auto_104049 ) ) ( not ( = ?auto_104046 ?auto_104050 ) ) ( not ( = ?auto_104046 ?auto_104051 ) ) ( not ( = ?auto_104047 ?auto_104048 ) ) ( not ( = ?auto_104047 ?auto_104049 ) ) ( not ( = ?auto_104047 ?auto_104050 ) ) ( not ( = ?auto_104047 ?auto_104051 ) ) ( not ( = ?auto_104048 ?auto_104049 ) ) ( not ( = ?auto_104048 ?auto_104050 ) ) ( not ( = ?auto_104048 ?auto_104051 ) ) ( not ( = ?auto_104049 ?auto_104050 ) ) ( not ( = ?auto_104049 ?auto_104051 ) ) ( not ( = ?auto_104050 ?auto_104051 ) ) ( not ( = ?auto_104046 ?auto_104053 ) ) ( not ( = ?auto_104047 ?auto_104053 ) ) ( not ( = ?auto_104048 ?auto_104053 ) ) ( not ( = ?auto_104049 ?auto_104053 ) ) ( not ( = ?auto_104050 ?auto_104053 ) ) ( not ( = ?auto_104051 ?auto_104053 ) ) ( ON ?auto_104046 ?auto_104052 ) ( not ( = ?auto_104046 ?auto_104052 ) ) ( not ( = ?auto_104047 ?auto_104052 ) ) ( not ( = ?auto_104048 ?auto_104052 ) ) ( not ( = ?auto_104049 ?auto_104052 ) ) ( not ( = ?auto_104050 ?auto_104052 ) ) ( not ( = ?auto_104051 ?auto_104052 ) ) ( not ( = ?auto_104053 ?auto_104052 ) ) ( ON ?auto_104047 ?auto_104046 ) ( ON-TABLE ?auto_104052 ) ( ON ?auto_104048 ?auto_104047 ) ( ON ?auto_104049 ?auto_104048 ) ( ON ?auto_104050 ?auto_104049 ) ( ON ?auto_104051 ?auto_104050 ) ( ON ?auto_104053 ?auto_104051 ) ( CLEAR ?auto_104053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104052 ?auto_104046 ?auto_104047 ?auto_104048 ?auto_104049 ?auto_104050 ?auto_104051 )
      ( MAKE-6PILE ?auto_104046 ?auto_104047 ?auto_104048 ?auto_104049 ?auto_104050 ?auto_104051 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104068 - BLOCK
      ?auto_104069 - BLOCK
      ?auto_104070 - BLOCK
      ?auto_104071 - BLOCK
      ?auto_104072 - BLOCK
      ?auto_104073 - BLOCK
      ?auto_104074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_104073 ) ( ON-TABLE ?auto_104068 ) ( ON ?auto_104069 ?auto_104068 ) ( ON ?auto_104070 ?auto_104069 ) ( ON ?auto_104071 ?auto_104070 ) ( ON ?auto_104072 ?auto_104071 ) ( ON ?auto_104073 ?auto_104072 ) ( not ( = ?auto_104068 ?auto_104069 ) ) ( not ( = ?auto_104068 ?auto_104070 ) ) ( not ( = ?auto_104068 ?auto_104071 ) ) ( not ( = ?auto_104068 ?auto_104072 ) ) ( not ( = ?auto_104068 ?auto_104073 ) ) ( not ( = ?auto_104068 ?auto_104074 ) ) ( not ( = ?auto_104069 ?auto_104070 ) ) ( not ( = ?auto_104069 ?auto_104071 ) ) ( not ( = ?auto_104069 ?auto_104072 ) ) ( not ( = ?auto_104069 ?auto_104073 ) ) ( not ( = ?auto_104069 ?auto_104074 ) ) ( not ( = ?auto_104070 ?auto_104071 ) ) ( not ( = ?auto_104070 ?auto_104072 ) ) ( not ( = ?auto_104070 ?auto_104073 ) ) ( not ( = ?auto_104070 ?auto_104074 ) ) ( not ( = ?auto_104071 ?auto_104072 ) ) ( not ( = ?auto_104071 ?auto_104073 ) ) ( not ( = ?auto_104071 ?auto_104074 ) ) ( not ( = ?auto_104072 ?auto_104073 ) ) ( not ( = ?auto_104072 ?auto_104074 ) ) ( not ( = ?auto_104073 ?auto_104074 ) ) ( ON-TABLE ?auto_104074 ) ( CLEAR ?auto_104074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_104074 )
      ( MAKE-7PILE ?auto_104068 ?auto_104069 ?auto_104070 ?auto_104071 ?auto_104072 ?auto_104073 ?auto_104074 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104075 - BLOCK
      ?auto_104076 - BLOCK
      ?auto_104077 - BLOCK
      ?auto_104078 - BLOCK
      ?auto_104079 - BLOCK
      ?auto_104080 - BLOCK
      ?auto_104081 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104075 ) ( ON ?auto_104076 ?auto_104075 ) ( ON ?auto_104077 ?auto_104076 ) ( ON ?auto_104078 ?auto_104077 ) ( ON ?auto_104079 ?auto_104078 ) ( not ( = ?auto_104075 ?auto_104076 ) ) ( not ( = ?auto_104075 ?auto_104077 ) ) ( not ( = ?auto_104075 ?auto_104078 ) ) ( not ( = ?auto_104075 ?auto_104079 ) ) ( not ( = ?auto_104075 ?auto_104080 ) ) ( not ( = ?auto_104075 ?auto_104081 ) ) ( not ( = ?auto_104076 ?auto_104077 ) ) ( not ( = ?auto_104076 ?auto_104078 ) ) ( not ( = ?auto_104076 ?auto_104079 ) ) ( not ( = ?auto_104076 ?auto_104080 ) ) ( not ( = ?auto_104076 ?auto_104081 ) ) ( not ( = ?auto_104077 ?auto_104078 ) ) ( not ( = ?auto_104077 ?auto_104079 ) ) ( not ( = ?auto_104077 ?auto_104080 ) ) ( not ( = ?auto_104077 ?auto_104081 ) ) ( not ( = ?auto_104078 ?auto_104079 ) ) ( not ( = ?auto_104078 ?auto_104080 ) ) ( not ( = ?auto_104078 ?auto_104081 ) ) ( not ( = ?auto_104079 ?auto_104080 ) ) ( not ( = ?auto_104079 ?auto_104081 ) ) ( not ( = ?auto_104080 ?auto_104081 ) ) ( ON-TABLE ?auto_104081 ) ( CLEAR ?auto_104081 ) ( HOLDING ?auto_104080 ) ( CLEAR ?auto_104079 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104075 ?auto_104076 ?auto_104077 ?auto_104078 ?auto_104079 ?auto_104080 )
      ( MAKE-7PILE ?auto_104075 ?auto_104076 ?auto_104077 ?auto_104078 ?auto_104079 ?auto_104080 ?auto_104081 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104082 - BLOCK
      ?auto_104083 - BLOCK
      ?auto_104084 - BLOCK
      ?auto_104085 - BLOCK
      ?auto_104086 - BLOCK
      ?auto_104087 - BLOCK
      ?auto_104088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104082 ) ( ON ?auto_104083 ?auto_104082 ) ( ON ?auto_104084 ?auto_104083 ) ( ON ?auto_104085 ?auto_104084 ) ( ON ?auto_104086 ?auto_104085 ) ( not ( = ?auto_104082 ?auto_104083 ) ) ( not ( = ?auto_104082 ?auto_104084 ) ) ( not ( = ?auto_104082 ?auto_104085 ) ) ( not ( = ?auto_104082 ?auto_104086 ) ) ( not ( = ?auto_104082 ?auto_104087 ) ) ( not ( = ?auto_104082 ?auto_104088 ) ) ( not ( = ?auto_104083 ?auto_104084 ) ) ( not ( = ?auto_104083 ?auto_104085 ) ) ( not ( = ?auto_104083 ?auto_104086 ) ) ( not ( = ?auto_104083 ?auto_104087 ) ) ( not ( = ?auto_104083 ?auto_104088 ) ) ( not ( = ?auto_104084 ?auto_104085 ) ) ( not ( = ?auto_104084 ?auto_104086 ) ) ( not ( = ?auto_104084 ?auto_104087 ) ) ( not ( = ?auto_104084 ?auto_104088 ) ) ( not ( = ?auto_104085 ?auto_104086 ) ) ( not ( = ?auto_104085 ?auto_104087 ) ) ( not ( = ?auto_104085 ?auto_104088 ) ) ( not ( = ?auto_104086 ?auto_104087 ) ) ( not ( = ?auto_104086 ?auto_104088 ) ) ( not ( = ?auto_104087 ?auto_104088 ) ) ( ON-TABLE ?auto_104088 ) ( CLEAR ?auto_104086 ) ( ON ?auto_104087 ?auto_104088 ) ( CLEAR ?auto_104087 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104088 )
      ( MAKE-7PILE ?auto_104082 ?auto_104083 ?auto_104084 ?auto_104085 ?auto_104086 ?auto_104087 ?auto_104088 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104089 - BLOCK
      ?auto_104090 - BLOCK
      ?auto_104091 - BLOCK
      ?auto_104092 - BLOCK
      ?auto_104093 - BLOCK
      ?auto_104094 - BLOCK
      ?auto_104095 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104089 ) ( ON ?auto_104090 ?auto_104089 ) ( ON ?auto_104091 ?auto_104090 ) ( ON ?auto_104092 ?auto_104091 ) ( not ( = ?auto_104089 ?auto_104090 ) ) ( not ( = ?auto_104089 ?auto_104091 ) ) ( not ( = ?auto_104089 ?auto_104092 ) ) ( not ( = ?auto_104089 ?auto_104093 ) ) ( not ( = ?auto_104089 ?auto_104094 ) ) ( not ( = ?auto_104089 ?auto_104095 ) ) ( not ( = ?auto_104090 ?auto_104091 ) ) ( not ( = ?auto_104090 ?auto_104092 ) ) ( not ( = ?auto_104090 ?auto_104093 ) ) ( not ( = ?auto_104090 ?auto_104094 ) ) ( not ( = ?auto_104090 ?auto_104095 ) ) ( not ( = ?auto_104091 ?auto_104092 ) ) ( not ( = ?auto_104091 ?auto_104093 ) ) ( not ( = ?auto_104091 ?auto_104094 ) ) ( not ( = ?auto_104091 ?auto_104095 ) ) ( not ( = ?auto_104092 ?auto_104093 ) ) ( not ( = ?auto_104092 ?auto_104094 ) ) ( not ( = ?auto_104092 ?auto_104095 ) ) ( not ( = ?auto_104093 ?auto_104094 ) ) ( not ( = ?auto_104093 ?auto_104095 ) ) ( not ( = ?auto_104094 ?auto_104095 ) ) ( ON-TABLE ?auto_104095 ) ( ON ?auto_104094 ?auto_104095 ) ( CLEAR ?auto_104094 ) ( HOLDING ?auto_104093 ) ( CLEAR ?auto_104092 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104089 ?auto_104090 ?auto_104091 ?auto_104092 ?auto_104093 )
      ( MAKE-7PILE ?auto_104089 ?auto_104090 ?auto_104091 ?auto_104092 ?auto_104093 ?auto_104094 ?auto_104095 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104096 - BLOCK
      ?auto_104097 - BLOCK
      ?auto_104098 - BLOCK
      ?auto_104099 - BLOCK
      ?auto_104100 - BLOCK
      ?auto_104101 - BLOCK
      ?auto_104102 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104096 ) ( ON ?auto_104097 ?auto_104096 ) ( ON ?auto_104098 ?auto_104097 ) ( ON ?auto_104099 ?auto_104098 ) ( not ( = ?auto_104096 ?auto_104097 ) ) ( not ( = ?auto_104096 ?auto_104098 ) ) ( not ( = ?auto_104096 ?auto_104099 ) ) ( not ( = ?auto_104096 ?auto_104100 ) ) ( not ( = ?auto_104096 ?auto_104101 ) ) ( not ( = ?auto_104096 ?auto_104102 ) ) ( not ( = ?auto_104097 ?auto_104098 ) ) ( not ( = ?auto_104097 ?auto_104099 ) ) ( not ( = ?auto_104097 ?auto_104100 ) ) ( not ( = ?auto_104097 ?auto_104101 ) ) ( not ( = ?auto_104097 ?auto_104102 ) ) ( not ( = ?auto_104098 ?auto_104099 ) ) ( not ( = ?auto_104098 ?auto_104100 ) ) ( not ( = ?auto_104098 ?auto_104101 ) ) ( not ( = ?auto_104098 ?auto_104102 ) ) ( not ( = ?auto_104099 ?auto_104100 ) ) ( not ( = ?auto_104099 ?auto_104101 ) ) ( not ( = ?auto_104099 ?auto_104102 ) ) ( not ( = ?auto_104100 ?auto_104101 ) ) ( not ( = ?auto_104100 ?auto_104102 ) ) ( not ( = ?auto_104101 ?auto_104102 ) ) ( ON-TABLE ?auto_104102 ) ( ON ?auto_104101 ?auto_104102 ) ( CLEAR ?auto_104099 ) ( ON ?auto_104100 ?auto_104101 ) ( CLEAR ?auto_104100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104102 ?auto_104101 )
      ( MAKE-7PILE ?auto_104096 ?auto_104097 ?auto_104098 ?auto_104099 ?auto_104100 ?auto_104101 ?auto_104102 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104103 - BLOCK
      ?auto_104104 - BLOCK
      ?auto_104105 - BLOCK
      ?auto_104106 - BLOCK
      ?auto_104107 - BLOCK
      ?auto_104108 - BLOCK
      ?auto_104109 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104103 ) ( ON ?auto_104104 ?auto_104103 ) ( ON ?auto_104105 ?auto_104104 ) ( not ( = ?auto_104103 ?auto_104104 ) ) ( not ( = ?auto_104103 ?auto_104105 ) ) ( not ( = ?auto_104103 ?auto_104106 ) ) ( not ( = ?auto_104103 ?auto_104107 ) ) ( not ( = ?auto_104103 ?auto_104108 ) ) ( not ( = ?auto_104103 ?auto_104109 ) ) ( not ( = ?auto_104104 ?auto_104105 ) ) ( not ( = ?auto_104104 ?auto_104106 ) ) ( not ( = ?auto_104104 ?auto_104107 ) ) ( not ( = ?auto_104104 ?auto_104108 ) ) ( not ( = ?auto_104104 ?auto_104109 ) ) ( not ( = ?auto_104105 ?auto_104106 ) ) ( not ( = ?auto_104105 ?auto_104107 ) ) ( not ( = ?auto_104105 ?auto_104108 ) ) ( not ( = ?auto_104105 ?auto_104109 ) ) ( not ( = ?auto_104106 ?auto_104107 ) ) ( not ( = ?auto_104106 ?auto_104108 ) ) ( not ( = ?auto_104106 ?auto_104109 ) ) ( not ( = ?auto_104107 ?auto_104108 ) ) ( not ( = ?auto_104107 ?auto_104109 ) ) ( not ( = ?auto_104108 ?auto_104109 ) ) ( ON-TABLE ?auto_104109 ) ( ON ?auto_104108 ?auto_104109 ) ( ON ?auto_104107 ?auto_104108 ) ( CLEAR ?auto_104107 ) ( HOLDING ?auto_104106 ) ( CLEAR ?auto_104105 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104103 ?auto_104104 ?auto_104105 ?auto_104106 )
      ( MAKE-7PILE ?auto_104103 ?auto_104104 ?auto_104105 ?auto_104106 ?auto_104107 ?auto_104108 ?auto_104109 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104110 - BLOCK
      ?auto_104111 - BLOCK
      ?auto_104112 - BLOCK
      ?auto_104113 - BLOCK
      ?auto_104114 - BLOCK
      ?auto_104115 - BLOCK
      ?auto_104116 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104110 ) ( ON ?auto_104111 ?auto_104110 ) ( ON ?auto_104112 ?auto_104111 ) ( not ( = ?auto_104110 ?auto_104111 ) ) ( not ( = ?auto_104110 ?auto_104112 ) ) ( not ( = ?auto_104110 ?auto_104113 ) ) ( not ( = ?auto_104110 ?auto_104114 ) ) ( not ( = ?auto_104110 ?auto_104115 ) ) ( not ( = ?auto_104110 ?auto_104116 ) ) ( not ( = ?auto_104111 ?auto_104112 ) ) ( not ( = ?auto_104111 ?auto_104113 ) ) ( not ( = ?auto_104111 ?auto_104114 ) ) ( not ( = ?auto_104111 ?auto_104115 ) ) ( not ( = ?auto_104111 ?auto_104116 ) ) ( not ( = ?auto_104112 ?auto_104113 ) ) ( not ( = ?auto_104112 ?auto_104114 ) ) ( not ( = ?auto_104112 ?auto_104115 ) ) ( not ( = ?auto_104112 ?auto_104116 ) ) ( not ( = ?auto_104113 ?auto_104114 ) ) ( not ( = ?auto_104113 ?auto_104115 ) ) ( not ( = ?auto_104113 ?auto_104116 ) ) ( not ( = ?auto_104114 ?auto_104115 ) ) ( not ( = ?auto_104114 ?auto_104116 ) ) ( not ( = ?auto_104115 ?auto_104116 ) ) ( ON-TABLE ?auto_104116 ) ( ON ?auto_104115 ?auto_104116 ) ( ON ?auto_104114 ?auto_104115 ) ( CLEAR ?auto_104112 ) ( ON ?auto_104113 ?auto_104114 ) ( CLEAR ?auto_104113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104116 ?auto_104115 ?auto_104114 )
      ( MAKE-7PILE ?auto_104110 ?auto_104111 ?auto_104112 ?auto_104113 ?auto_104114 ?auto_104115 ?auto_104116 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104117 - BLOCK
      ?auto_104118 - BLOCK
      ?auto_104119 - BLOCK
      ?auto_104120 - BLOCK
      ?auto_104121 - BLOCK
      ?auto_104122 - BLOCK
      ?auto_104123 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104117 ) ( ON ?auto_104118 ?auto_104117 ) ( not ( = ?auto_104117 ?auto_104118 ) ) ( not ( = ?auto_104117 ?auto_104119 ) ) ( not ( = ?auto_104117 ?auto_104120 ) ) ( not ( = ?auto_104117 ?auto_104121 ) ) ( not ( = ?auto_104117 ?auto_104122 ) ) ( not ( = ?auto_104117 ?auto_104123 ) ) ( not ( = ?auto_104118 ?auto_104119 ) ) ( not ( = ?auto_104118 ?auto_104120 ) ) ( not ( = ?auto_104118 ?auto_104121 ) ) ( not ( = ?auto_104118 ?auto_104122 ) ) ( not ( = ?auto_104118 ?auto_104123 ) ) ( not ( = ?auto_104119 ?auto_104120 ) ) ( not ( = ?auto_104119 ?auto_104121 ) ) ( not ( = ?auto_104119 ?auto_104122 ) ) ( not ( = ?auto_104119 ?auto_104123 ) ) ( not ( = ?auto_104120 ?auto_104121 ) ) ( not ( = ?auto_104120 ?auto_104122 ) ) ( not ( = ?auto_104120 ?auto_104123 ) ) ( not ( = ?auto_104121 ?auto_104122 ) ) ( not ( = ?auto_104121 ?auto_104123 ) ) ( not ( = ?auto_104122 ?auto_104123 ) ) ( ON-TABLE ?auto_104123 ) ( ON ?auto_104122 ?auto_104123 ) ( ON ?auto_104121 ?auto_104122 ) ( ON ?auto_104120 ?auto_104121 ) ( CLEAR ?auto_104120 ) ( HOLDING ?auto_104119 ) ( CLEAR ?auto_104118 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104117 ?auto_104118 ?auto_104119 )
      ( MAKE-7PILE ?auto_104117 ?auto_104118 ?auto_104119 ?auto_104120 ?auto_104121 ?auto_104122 ?auto_104123 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104124 - BLOCK
      ?auto_104125 - BLOCK
      ?auto_104126 - BLOCK
      ?auto_104127 - BLOCK
      ?auto_104128 - BLOCK
      ?auto_104129 - BLOCK
      ?auto_104130 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104124 ) ( ON ?auto_104125 ?auto_104124 ) ( not ( = ?auto_104124 ?auto_104125 ) ) ( not ( = ?auto_104124 ?auto_104126 ) ) ( not ( = ?auto_104124 ?auto_104127 ) ) ( not ( = ?auto_104124 ?auto_104128 ) ) ( not ( = ?auto_104124 ?auto_104129 ) ) ( not ( = ?auto_104124 ?auto_104130 ) ) ( not ( = ?auto_104125 ?auto_104126 ) ) ( not ( = ?auto_104125 ?auto_104127 ) ) ( not ( = ?auto_104125 ?auto_104128 ) ) ( not ( = ?auto_104125 ?auto_104129 ) ) ( not ( = ?auto_104125 ?auto_104130 ) ) ( not ( = ?auto_104126 ?auto_104127 ) ) ( not ( = ?auto_104126 ?auto_104128 ) ) ( not ( = ?auto_104126 ?auto_104129 ) ) ( not ( = ?auto_104126 ?auto_104130 ) ) ( not ( = ?auto_104127 ?auto_104128 ) ) ( not ( = ?auto_104127 ?auto_104129 ) ) ( not ( = ?auto_104127 ?auto_104130 ) ) ( not ( = ?auto_104128 ?auto_104129 ) ) ( not ( = ?auto_104128 ?auto_104130 ) ) ( not ( = ?auto_104129 ?auto_104130 ) ) ( ON-TABLE ?auto_104130 ) ( ON ?auto_104129 ?auto_104130 ) ( ON ?auto_104128 ?auto_104129 ) ( ON ?auto_104127 ?auto_104128 ) ( CLEAR ?auto_104125 ) ( ON ?auto_104126 ?auto_104127 ) ( CLEAR ?auto_104126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104130 ?auto_104129 ?auto_104128 ?auto_104127 )
      ( MAKE-7PILE ?auto_104124 ?auto_104125 ?auto_104126 ?auto_104127 ?auto_104128 ?auto_104129 ?auto_104130 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104131 - BLOCK
      ?auto_104132 - BLOCK
      ?auto_104133 - BLOCK
      ?auto_104134 - BLOCK
      ?auto_104135 - BLOCK
      ?auto_104136 - BLOCK
      ?auto_104137 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104131 ) ( not ( = ?auto_104131 ?auto_104132 ) ) ( not ( = ?auto_104131 ?auto_104133 ) ) ( not ( = ?auto_104131 ?auto_104134 ) ) ( not ( = ?auto_104131 ?auto_104135 ) ) ( not ( = ?auto_104131 ?auto_104136 ) ) ( not ( = ?auto_104131 ?auto_104137 ) ) ( not ( = ?auto_104132 ?auto_104133 ) ) ( not ( = ?auto_104132 ?auto_104134 ) ) ( not ( = ?auto_104132 ?auto_104135 ) ) ( not ( = ?auto_104132 ?auto_104136 ) ) ( not ( = ?auto_104132 ?auto_104137 ) ) ( not ( = ?auto_104133 ?auto_104134 ) ) ( not ( = ?auto_104133 ?auto_104135 ) ) ( not ( = ?auto_104133 ?auto_104136 ) ) ( not ( = ?auto_104133 ?auto_104137 ) ) ( not ( = ?auto_104134 ?auto_104135 ) ) ( not ( = ?auto_104134 ?auto_104136 ) ) ( not ( = ?auto_104134 ?auto_104137 ) ) ( not ( = ?auto_104135 ?auto_104136 ) ) ( not ( = ?auto_104135 ?auto_104137 ) ) ( not ( = ?auto_104136 ?auto_104137 ) ) ( ON-TABLE ?auto_104137 ) ( ON ?auto_104136 ?auto_104137 ) ( ON ?auto_104135 ?auto_104136 ) ( ON ?auto_104134 ?auto_104135 ) ( ON ?auto_104133 ?auto_104134 ) ( CLEAR ?auto_104133 ) ( HOLDING ?auto_104132 ) ( CLEAR ?auto_104131 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104131 ?auto_104132 )
      ( MAKE-7PILE ?auto_104131 ?auto_104132 ?auto_104133 ?auto_104134 ?auto_104135 ?auto_104136 ?auto_104137 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104138 - BLOCK
      ?auto_104139 - BLOCK
      ?auto_104140 - BLOCK
      ?auto_104141 - BLOCK
      ?auto_104142 - BLOCK
      ?auto_104143 - BLOCK
      ?auto_104144 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_104138 ) ( not ( = ?auto_104138 ?auto_104139 ) ) ( not ( = ?auto_104138 ?auto_104140 ) ) ( not ( = ?auto_104138 ?auto_104141 ) ) ( not ( = ?auto_104138 ?auto_104142 ) ) ( not ( = ?auto_104138 ?auto_104143 ) ) ( not ( = ?auto_104138 ?auto_104144 ) ) ( not ( = ?auto_104139 ?auto_104140 ) ) ( not ( = ?auto_104139 ?auto_104141 ) ) ( not ( = ?auto_104139 ?auto_104142 ) ) ( not ( = ?auto_104139 ?auto_104143 ) ) ( not ( = ?auto_104139 ?auto_104144 ) ) ( not ( = ?auto_104140 ?auto_104141 ) ) ( not ( = ?auto_104140 ?auto_104142 ) ) ( not ( = ?auto_104140 ?auto_104143 ) ) ( not ( = ?auto_104140 ?auto_104144 ) ) ( not ( = ?auto_104141 ?auto_104142 ) ) ( not ( = ?auto_104141 ?auto_104143 ) ) ( not ( = ?auto_104141 ?auto_104144 ) ) ( not ( = ?auto_104142 ?auto_104143 ) ) ( not ( = ?auto_104142 ?auto_104144 ) ) ( not ( = ?auto_104143 ?auto_104144 ) ) ( ON-TABLE ?auto_104144 ) ( ON ?auto_104143 ?auto_104144 ) ( ON ?auto_104142 ?auto_104143 ) ( ON ?auto_104141 ?auto_104142 ) ( ON ?auto_104140 ?auto_104141 ) ( CLEAR ?auto_104138 ) ( ON ?auto_104139 ?auto_104140 ) ( CLEAR ?auto_104139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104144 ?auto_104143 ?auto_104142 ?auto_104141 ?auto_104140 )
      ( MAKE-7PILE ?auto_104138 ?auto_104139 ?auto_104140 ?auto_104141 ?auto_104142 ?auto_104143 ?auto_104144 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104145 - BLOCK
      ?auto_104146 - BLOCK
      ?auto_104147 - BLOCK
      ?auto_104148 - BLOCK
      ?auto_104149 - BLOCK
      ?auto_104150 - BLOCK
      ?auto_104151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104145 ?auto_104146 ) ) ( not ( = ?auto_104145 ?auto_104147 ) ) ( not ( = ?auto_104145 ?auto_104148 ) ) ( not ( = ?auto_104145 ?auto_104149 ) ) ( not ( = ?auto_104145 ?auto_104150 ) ) ( not ( = ?auto_104145 ?auto_104151 ) ) ( not ( = ?auto_104146 ?auto_104147 ) ) ( not ( = ?auto_104146 ?auto_104148 ) ) ( not ( = ?auto_104146 ?auto_104149 ) ) ( not ( = ?auto_104146 ?auto_104150 ) ) ( not ( = ?auto_104146 ?auto_104151 ) ) ( not ( = ?auto_104147 ?auto_104148 ) ) ( not ( = ?auto_104147 ?auto_104149 ) ) ( not ( = ?auto_104147 ?auto_104150 ) ) ( not ( = ?auto_104147 ?auto_104151 ) ) ( not ( = ?auto_104148 ?auto_104149 ) ) ( not ( = ?auto_104148 ?auto_104150 ) ) ( not ( = ?auto_104148 ?auto_104151 ) ) ( not ( = ?auto_104149 ?auto_104150 ) ) ( not ( = ?auto_104149 ?auto_104151 ) ) ( not ( = ?auto_104150 ?auto_104151 ) ) ( ON-TABLE ?auto_104151 ) ( ON ?auto_104150 ?auto_104151 ) ( ON ?auto_104149 ?auto_104150 ) ( ON ?auto_104148 ?auto_104149 ) ( ON ?auto_104147 ?auto_104148 ) ( ON ?auto_104146 ?auto_104147 ) ( CLEAR ?auto_104146 ) ( HOLDING ?auto_104145 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104145 )
      ( MAKE-7PILE ?auto_104145 ?auto_104146 ?auto_104147 ?auto_104148 ?auto_104149 ?auto_104150 ?auto_104151 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104152 - BLOCK
      ?auto_104153 - BLOCK
      ?auto_104154 - BLOCK
      ?auto_104155 - BLOCK
      ?auto_104156 - BLOCK
      ?auto_104157 - BLOCK
      ?auto_104158 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104152 ?auto_104153 ) ) ( not ( = ?auto_104152 ?auto_104154 ) ) ( not ( = ?auto_104152 ?auto_104155 ) ) ( not ( = ?auto_104152 ?auto_104156 ) ) ( not ( = ?auto_104152 ?auto_104157 ) ) ( not ( = ?auto_104152 ?auto_104158 ) ) ( not ( = ?auto_104153 ?auto_104154 ) ) ( not ( = ?auto_104153 ?auto_104155 ) ) ( not ( = ?auto_104153 ?auto_104156 ) ) ( not ( = ?auto_104153 ?auto_104157 ) ) ( not ( = ?auto_104153 ?auto_104158 ) ) ( not ( = ?auto_104154 ?auto_104155 ) ) ( not ( = ?auto_104154 ?auto_104156 ) ) ( not ( = ?auto_104154 ?auto_104157 ) ) ( not ( = ?auto_104154 ?auto_104158 ) ) ( not ( = ?auto_104155 ?auto_104156 ) ) ( not ( = ?auto_104155 ?auto_104157 ) ) ( not ( = ?auto_104155 ?auto_104158 ) ) ( not ( = ?auto_104156 ?auto_104157 ) ) ( not ( = ?auto_104156 ?auto_104158 ) ) ( not ( = ?auto_104157 ?auto_104158 ) ) ( ON-TABLE ?auto_104158 ) ( ON ?auto_104157 ?auto_104158 ) ( ON ?auto_104156 ?auto_104157 ) ( ON ?auto_104155 ?auto_104156 ) ( ON ?auto_104154 ?auto_104155 ) ( ON ?auto_104153 ?auto_104154 ) ( ON ?auto_104152 ?auto_104153 ) ( CLEAR ?auto_104152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104158 ?auto_104157 ?auto_104156 ?auto_104155 ?auto_104154 ?auto_104153 )
      ( MAKE-7PILE ?auto_104152 ?auto_104153 ?auto_104154 ?auto_104155 ?auto_104156 ?auto_104157 ?auto_104158 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104166 - BLOCK
      ?auto_104167 - BLOCK
      ?auto_104168 - BLOCK
      ?auto_104169 - BLOCK
      ?auto_104170 - BLOCK
      ?auto_104171 - BLOCK
      ?auto_104172 - BLOCK
    )
    :vars
    (
      ?auto_104173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104166 ?auto_104167 ) ) ( not ( = ?auto_104166 ?auto_104168 ) ) ( not ( = ?auto_104166 ?auto_104169 ) ) ( not ( = ?auto_104166 ?auto_104170 ) ) ( not ( = ?auto_104166 ?auto_104171 ) ) ( not ( = ?auto_104166 ?auto_104172 ) ) ( not ( = ?auto_104167 ?auto_104168 ) ) ( not ( = ?auto_104167 ?auto_104169 ) ) ( not ( = ?auto_104167 ?auto_104170 ) ) ( not ( = ?auto_104167 ?auto_104171 ) ) ( not ( = ?auto_104167 ?auto_104172 ) ) ( not ( = ?auto_104168 ?auto_104169 ) ) ( not ( = ?auto_104168 ?auto_104170 ) ) ( not ( = ?auto_104168 ?auto_104171 ) ) ( not ( = ?auto_104168 ?auto_104172 ) ) ( not ( = ?auto_104169 ?auto_104170 ) ) ( not ( = ?auto_104169 ?auto_104171 ) ) ( not ( = ?auto_104169 ?auto_104172 ) ) ( not ( = ?auto_104170 ?auto_104171 ) ) ( not ( = ?auto_104170 ?auto_104172 ) ) ( not ( = ?auto_104171 ?auto_104172 ) ) ( ON-TABLE ?auto_104172 ) ( ON ?auto_104171 ?auto_104172 ) ( ON ?auto_104170 ?auto_104171 ) ( ON ?auto_104169 ?auto_104170 ) ( ON ?auto_104168 ?auto_104169 ) ( ON ?auto_104167 ?auto_104168 ) ( CLEAR ?auto_104167 ) ( ON ?auto_104166 ?auto_104173 ) ( CLEAR ?auto_104166 ) ( HAND-EMPTY ) ( not ( = ?auto_104166 ?auto_104173 ) ) ( not ( = ?auto_104167 ?auto_104173 ) ) ( not ( = ?auto_104168 ?auto_104173 ) ) ( not ( = ?auto_104169 ?auto_104173 ) ) ( not ( = ?auto_104170 ?auto_104173 ) ) ( not ( = ?auto_104171 ?auto_104173 ) ) ( not ( = ?auto_104172 ?auto_104173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_104166 ?auto_104173 )
      ( MAKE-7PILE ?auto_104166 ?auto_104167 ?auto_104168 ?auto_104169 ?auto_104170 ?auto_104171 ?auto_104172 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104174 - BLOCK
      ?auto_104175 - BLOCK
      ?auto_104176 - BLOCK
      ?auto_104177 - BLOCK
      ?auto_104178 - BLOCK
      ?auto_104179 - BLOCK
      ?auto_104180 - BLOCK
    )
    :vars
    (
      ?auto_104181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104174 ?auto_104175 ) ) ( not ( = ?auto_104174 ?auto_104176 ) ) ( not ( = ?auto_104174 ?auto_104177 ) ) ( not ( = ?auto_104174 ?auto_104178 ) ) ( not ( = ?auto_104174 ?auto_104179 ) ) ( not ( = ?auto_104174 ?auto_104180 ) ) ( not ( = ?auto_104175 ?auto_104176 ) ) ( not ( = ?auto_104175 ?auto_104177 ) ) ( not ( = ?auto_104175 ?auto_104178 ) ) ( not ( = ?auto_104175 ?auto_104179 ) ) ( not ( = ?auto_104175 ?auto_104180 ) ) ( not ( = ?auto_104176 ?auto_104177 ) ) ( not ( = ?auto_104176 ?auto_104178 ) ) ( not ( = ?auto_104176 ?auto_104179 ) ) ( not ( = ?auto_104176 ?auto_104180 ) ) ( not ( = ?auto_104177 ?auto_104178 ) ) ( not ( = ?auto_104177 ?auto_104179 ) ) ( not ( = ?auto_104177 ?auto_104180 ) ) ( not ( = ?auto_104178 ?auto_104179 ) ) ( not ( = ?auto_104178 ?auto_104180 ) ) ( not ( = ?auto_104179 ?auto_104180 ) ) ( ON-TABLE ?auto_104180 ) ( ON ?auto_104179 ?auto_104180 ) ( ON ?auto_104178 ?auto_104179 ) ( ON ?auto_104177 ?auto_104178 ) ( ON ?auto_104176 ?auto_104177 ) ( ON ?auto_104174 ?auto_104181 ) ( CLEAR ?auto_104174 ) ( not ( = ?auto_104174 ?auto_104181 ) ) ( not ( = ?auto_104175 ?auto_104181 ) ) ( not ( = ?auto_104176 ?auto_104181 ) ) ( not ( = ?auto_104177 ?auto_104181 ) ) ( not ( = ?auto_104178 ?auto_104181 ) ) ( not ( = ?auto_104179 ?auto_104181 ) ) ( not ( = ?auto_104180 ?auto_104181 ) ) ( HOLDING ?auto_104175 ) ( CLEAR ?auto_104176 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104180 ?auto_104179 ?auto_104178 ?auto_104177 ?auto_104176 ?auto_104175 )
      ( MAKE-7PILE ?auto_104174 ?auto_104175 ?auto_104176 ?auto_104177 ?auto_104178 ?auto_104179 ?auto_104180 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104182 - BLOCK
      ?auto_104183 - BLOCK
      ?auto_104184 - BLOCK
      ?auto_104185 - BLOCK
      ?auto_104186 - BLOCK
      ?auto_104187 - BLOCK
      ?auto_104188 - BLOCK
    )
    :vars
    (
      ?auto_104189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104182 ?auto_104183 ) ) ( not ( = ?auto_104182 ?auto_104184 ) ) ( not ( = ?auto_104182 ?auto_104185 ) ) ( not ( = ?auto_104182 ?auto_104186 ) ) ( not ( = ?auto_104182 ?auto_104187 ) ) ( not ( = ?auto_104182 ?auto_104188 ) ) ( not ( = ?auto_104183 ?auto_104184 ) ) ( not ( = ?auto_104183 ?auto_104185 ) ) ( not ( = ?auto_104183 ?auto_104186 ) ) ( not ( = ?auto_104183 ?auto_104187 ) ) ( not ( = ?auto_104183 ?auto_104188 ) ) ( not ( = ?auto_104184 ?auto_104185 ) ) ( not ( = ?auto_104184 ?auto_104186 ) ) ( not ( = ?auto_104184 ?auto_104187 ) ) ( not ( = ?auto_104184 ?auto_104188 ) ) ( not ( = ?auto_104185 ?auto_104186 ) ) ( not ( = ?auto_104185 ?auto_104187 ) ) ( not ( = ?auto_104185 ?auto_104188 ) ) ( not ( = ?auto_104186 ?auto_104187 ) ) ( not ( = ?auto_104186 ?auto_104188 ) ) ( not ( = ?auto_104187 ?auto_104188 ) ) ( ON-TABLE ?auto_104188 ) ( ON ?auto_104187 ?auto_104188 ) ( ON ?auto_104186 ?auto_104187 ) ( ON ?auto_104185 ?auto_104186 ) ( ON ?auto_104184 ?auto_104185 ) ( ON ?auto_104182 ?auto_104189 ) ( not ( = ?auto_104182 ?auto_104189 ) ) ( not ( = ?auto_104183 ?auto_104189 ) ) ( not ( = ?auto_104184 ?auto_104189 ) ) ( not ( = ?auto_104185 ?auto_104189 ) ) ( not ( = ?auto_104186 ?auto_104189 ) ) ( not ( = ?auto_104187 ?auto_104189 ) ) ( not ( = ?auto_104188 ?auto_104189 ) ) ( CLEAR ?auto_104184 ) ( ON ?auto_104183 ?auto_104182 ) ( CLEAR ?auto_104183 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_104189 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104189 ?auto_104182 )
      ( MAKE-7PILE ?auto_104182 ?auto_104183 ?auto_104184 ?auto_104185 ?auto_104186 ?auto_104187 ?auto_104188 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104190 - BLOCK
      ?auto_104191 - BLOCK
      ?auto_104192 - BLOCK
      ?auto_104193 - BLOCK
      ?auto_104194 - BLOCK
      ?auto_104195 - BLOCK
      ?auto_104196 - BLOCK
    )
    :vars
    (
      ?auto_104197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104190 ?auto_104191 ) ) ( not ( = ?auto_104190 ?auto_104192 ) ) ( not ( = ?auto_104190 ?auto_104193 ) ) ( not ( = ?auto_104190 ?auto_104194 ) ) ( not ( = ?auto_104190 ?auto_104195 ) ) ( not ( = ?auto_104190 ?auto_104196 ) ) ( not ( = ?auto_104191 ?auto_104192 ) ) ( not ( = ?auto_104191 ?auto_104193 ) ) ( not ( = ?auto_104191 ?auto_104194 ) ) ( not ( = ?auto_104191 ?auto_104195 ) ) ( not ( = ?auto_104191 ?auto_104196 ) ) ( not ( = ?auto_104192 ?auto_104193 ) ) ( not ( = ?auto_104192 ?auto_104194 ) ) ( not ( = ?auto_104192 ?auto_104195 ) ) ( not ( = ?auto_104192 ?auto_104196 ) ) ( not ( = ?auto_104193 ?auto_104194 ) ) ( not ( = ?auto_104193 ?auto_104195 ) ) ( not ( = ?auto_104193 ?auto_104196 ) ) ( not ( = ?auto_104194 ?auto_104195 ) ) ( not ( = ?auto_104194 ?auto_104196 ) ) ( not ( = ?auto_104195 ?auto_104196 ) ) ( ON-TABLE ?auto_104196 ) ( ON ?auto_104195 ?auto_104196 ) ( ON ?auto_104194 ?auto_104195 ) ( ON ?auto_104193 ?auto_104194 ) ( ON ?auto_104190 ?auto_104197 ) ( not ( = ?auto_104190 ?auto_104197 ) ) ( not ( = ?auto_104191 ?auto_104197 ) ) ( not ( = ?auto_104192 ?auto_104197 ) ) ( not ( = ?auto_104193 ?auto_104197 ) ) ( not ( = ?auto_104194 ?auto_104197 ) ) ( not ( = ?auto_104195 ?auto_104197 ) ) ( not ( = ?auto_104196 ?auto_104197 ) ) ( ON ?auto_104191 ?auto_104190 ) ( CLEAR ?auto_104191 ) ( ON-TABLE ?auto_104197 ) ( HOLDING ?auto_104192 ) ( CLEAR ?auto_104193 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104196 ?auto_104195 ?auto_104194 ?auto_104193 ?auto_104192 )
      ( MAKE-7PILE ?auto_104190 ?auto_104191 ?auto_104192 ?auto_104193 ?auto_104194 ?auto_104195 ?auto_104196 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104198 - BLOCK
      ?auto_104199 - BLOCK
      ?auto_104200 - BLOCK
      ?auto_104201 - BLOCK
      ?auto_104202 - BLOCK
      ?auto_104203 - BLOCK
      ?auto_104204 - BLOCK
    )
    :vars
    (
      ?auto_104205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104198 ?auto_104199 ) ) ( not ( = ?auto_104198 ?auto_104200 ) ) ( not ( = ?auto_104198 ?auto_104201 ) ) ( not ( = ?auto_104198 ?auto_104202 ) ) ( not ( = ?auto_104198 ?auto_104203 ) ) ( not ( = ?auto_104198 ?auto_104204 ) ) ( not ( = ?auto_104199 ?auto_104200 ) ) ( not ( = ?auto_104199 ?auto_104201 ) ) ( not ( = ?auto_104199 ?auto_104202 ) ) ( not ( = ?auto_104199 ?auto_104203 ) ) ( not ( = ?auto_104199 ?auto_104204 ) ) ( not ( = ?auto_104200 ?auto_104201 ) ) ( not ( = ?auto_104200 ?auto_104202 ) ) ( not ( = ?auto_104200 ?auto_104203 ) ) ( not ( = ?auto_104200 ?auto_104204 ) ) ( not ( = ?auto_104201 ?auto_104202 ) ) ( not ( = ?auto_104201 ?auto_104203 ) ) ( not ( = ?auto_104201 ?auto_104204 ) ) ( not ( = ?auto_104202 ?auto_104203 ) ) ( not ( = ?auto_104202 ?auto_104204 ) ) ( not ( = ?auto_104203 ?auto_104204 ) ) ( ON-TABLE ?auto_104204 ) ( ON ?auto_104203 ?auto_104204 ) ( ON ?auto_104202 ?auto_104203 ) ( ON ?auto_104201 ?auto_104202 ) ( ON ?auto_104198 ?auto_104205 ) ( not ( = ?auto_104198 ?auto_104205 ) ) ( not ( = ?auto_104199 ?auto_104205 ) ) ( not ( = ?auto_104200 ?auto_104205 ) ) ( not ( = ?auto_104201 ?auto_104205 ) ) ( not ( = ?auto_104202 ?auto_104205 ) ) ( not ( = ?auto_104203 ?auto_104205 ) ) ( not ( = ?auto_104204 ?auto_104205 ) ) ( ON ?auto_104199 ?auto_104198 ) ( ON-TABLE ?auto_104205 ) ( CLEAR ?auto_104201 ) ( ON ?auto_104200 ?auto_104199 ) ( CLEAR ?auto_104200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104205 ?auto_104198 ?auto_104199 )
      ( MAKE-7PILE ?auto_104198 ?auto_104199 ?auto_104200 ?auto_104201 ?auto_104202 ?auto_104203 ?auto_104204 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104206 - BLOCK
      ?auto_104207 - BLOCK
      ?auto_104208 - BLOCK
      ?auto_104209 - BLOCK
      ?auto_104210 - BLOCK
      ?auto_104211 - BLOCK
      ?auto_104212 - BLOCK
    )
    :vars
    (
      ?auto_104213 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104206 ?auto_104207 ) ) ( not ( = ?auto_104206 ?auto_104208 ) ) ( not ( = ?auto_104206 ?auto_104209 ) ) ( not ( = ?auto_104206 ?auto_104210 ) ) ( not ( = ?auto_104206 ?auto_104211 ) ) ( not ( = ?auto_104206 ?auto_104212 ) ) ( not ( = ?auto_104207 ?auto_104208 ) ) ( not ( = ?auto_104207 ?auto_104209 ) ) ( not ( = ?auto_104207 ?auto_104210 ) ) ( not ( = ?auto_104207 ?auto_104211 ) ) ( not ( = ?auto_104207 ?auto_104212 ) ) ( not ( = ?auto_104208 ?auto_104209 ) ) ( not ( = ?auto_104208 ?auto_104210 ) ) ( not ( = ?auto_104208 ?auto_104211 ) ) ( not ( = ?auto_104208 ?auto_104212 ) ) ( not ( = ?auto_104209 ?auto_104210 ) ) ( not ( = ?auto_104209 ?auto_104211 ) ) ( not ( = ?auto_104209 ?auto_104212 ) ) ( not ( = ?auto_104210 ?auto_104211 ) ) ( not ( = ?auto_104210 ?auto_104212 ) ) ( not ( = ?auto_104211 ?auto_104212 ) ) ( ON-TABLE ?auto_104212 ) ( ON ?auto_104211 ?auto_104212 ) ( ON ?auto_104210 ?auto_104211 ) ( ON ?auto_104206 ?auto_104213 ) ( not ( = ?auto_104206 ?auto_104213 ) ) ( not ( = ?auto_104207 ?auto_104213 ) ) ( not ( = ?auto_104208 ?auto_104213 ) ) ( not ( = ?auto_104209 ?auto_104213 ) ) ( not ( = ?auto_104210 ?auto_104213 ) ) ( not ( = ?auto_104211 ?auto_104213 ) ) ( not ( = ?auto_104212 ?auto_104213 ) ) ( ON ?auto_104207 ?auto_104206 ) ( ON-TABLE ?auto_104213 ) ( ON ?auto_104208 ?auto_104207 ) ( CLEAR ?auto_104208 ) ( HOLDING ?auto_104209 ) ( CLEAR ?auto_104210 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104212 ?auto_104211 ?auto_104210 ?auto_104209 )
      ( MAKE-7PILE ?auto_104206 ?auto_104207 ?auto_104208 ?auto_104209 ?auto_104210 ?auto_104211 ?auto_104212 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104214 - BLOCK
      ?auto_104215 - BLOCK
      ?auto_104216 - BLOCK
      ?auto_104217 - BLOCK
      ?auto_104218 - BLOCK
      ?auto_104219 - BLOCK
      ?auto_104220 - BLOCK
    )
    :vars
    (
      ?auto_104221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104214 ?auto_104215 ) ) ( not ( = ?auto_104214 ?auto_104216 ) ) ( not ( = ?auto_104214 ?auto_104217 ) ) ( not ( = ?auto_104214 ?auto_104218 ) ) ( not ( = ?auto_104214 ?auto_104219 ) ) ( not ( = ?auto_104214 ?auto_104220 ) ) ( not ( = ?auto_104215 ?auto_104216 ) ) ( not ( = ?auto_104215 ?auto_104217 ) ) ( not ( = ?auto_104215 ?auto_104218 ) ) ( not ( = ?auto_104215 ?auto_104219 ) ) ( not ( = ?auto_104215 ?auto_104220 ) ) ( not ( = ?auto_104216 ?auto_104217 ) ) ( not ( = ?auto_104216 ?auto_104218 ) ) ( not ( = ?auto_104216 ?auto_104219 ) ) ( not ( = ?auto_104216 ?auto_104220 ) ) ( not ( = ?auto_104217 ?auto_104218 ) ) ( not ( = ?auto_104217 ?auto_104219 ) ) ( not ( = ?auto_104217 ?auto_104220 ) ) ( not ( = ?auto_104218 ?auto_104219 ) ) ( not ( = ?auto_104218 ?auto_104220 ) ) ( not ( = ?auto_104219 ?auto_104220 ) ) ( ON-TABLE ?auto_104220 ) ( ON ?auto_104219 ?auto_104220 ) ( ON ?auto_104218 ?auto_104219 ) ( ON ?auto_104214 ?auto_104221 ) ( not ( = ?auto_104214 ?auto_104221 ) ) ( not ( = ?auto_104215 ?auto_104221 ) ) ( not ( = ?auto_104216 ?auto_104221 ) ) ( not ( = ?auto_104217 ?auto_104221 ) ) ( not ( = ?auto_104218 ?auto_104221 ) ) ( not ( = ?auto_104219 ?auto_104221 ) ) ( not ( = ?auto_104220 ?auto_104221 ) ) ( ON ?auto_104215 ?auto_104214 ) ( ON-TABLE ?auto_104221 ) ( ON ?auto_104216 ?auto_104215 ) ( CLEAR ?auto_104218 ) ( ON ?auto_104217 ?auto_104216 ) ( CLEAR ?auto_104217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_104221 ?auto_104214 ?auto_104215 ?auto_104216 )
      ( MAKE-7PILE ?auto_104214 ?auto_104215 ?auto_104216 ?auto_104217 ?auto_104218 ?auto_104219 ?auto_104220 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104222 - BLOCK
      ?auto_104223 - BLOCK
      ?auto_104224 - BLOCK
      ?auto_104225 - BLOCK
      ?auto_104226 - BLOCK
      ?auto_104227 - BLOCK
      ?auto_104228 - BLOCK
    )
    :vars
    (
      ?auto_104229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104222 ?auto_104223 ) ) ( not ( = ?auto_104222 ?auto_104224 ) ) ( not ( = ?auto_104222 ?auto_104225 ) ) ( not ( = ?auto_104222 ?auto_104226 ) ) ( not ( = ?auto_104222 ?auto_104227 ) ) ( not ( = ?auto_104222 ?auto_104228 ) ) ( not ( = ?auto_104223 ?auto_104224 ) ) ( not ( = ?auto_104223 ?auto_104225 ) ) ( not ( = ?auto_104223 ?auto_104226 ) ) ( not ( = ?auto_104223 ?auto_104227 ) ) ( not ( = ?auto_104223 ?auto_104228 ) ) ( not ( = ?auto_104224 ?auto_104225 ) ) ( not ( = ?auto_104224 ?auto_104226 ) ) ( not ( = ?auto_104224 ?auto_104227 ) ) ( not ( = ?auto_104224 ?auto_104228 ) ) ( not ( = ?auto_104225 ?auto_104226 ) ) ( not ( = ?auto_104225 ?auto_104227 ) ) ( not ( = ?auto_104225 ?auto_104228 ) ) ( not ( = ?auto_104226 ?auto_104227 ) ) ( not ( = ?auto_104226 ?auto_104228 ) ) ( not ( = ?auto_104227 ?auto_104228 ) ) ( ON-TABLE ?auto_104228 ) ( ON ?auto_104227 ?auto_104228 ) ( ON ?auto_104222 ?auto_104229 ) ( not ( = ?auto_104222 ?auto_104229 ) ) ( not ( = ?auto_104223 ?auto_104229 ) ) ( not ( = ?auto_104224 ?auto_104229 ) ) ( not ( = ?auto_104225 ?auto_104229 ) ) ( not ( = ?auto_104226 ?auto_104229 ) ) ( not ( = ?auto_104227 ?auto_104229 ) ) ( not ( = ?auto_104228 ?auto_104229 ) ) ( ON ?auto_104223 ?auto_104222 ) ( ON-TABLE ?auto_104229 ) ( ON ?auto_104224 ?auto_104223 ) ( ON ?auto_104225 ?auto_104224 ) ( CLEAR ?auto_104225 ) ( HOLDING ?auto_104226 ) ( CLEAR ?auto_104227 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_104228 ?auto_104227 ?auto_104226 )
      ( MAKE-7PILE ?auto_104222 ?auto_104223 ?auto_104224 ?auto_104225 ?auto_104226 ?auto_104227 ?auto_104228 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104230 - BLOCK
      ?auto_104231 - BLOCK
      ?auto_104232 - BLOCK
      ?auto_104233 - BLOCK
      ?auto_104234 - BLOCK
      ?auto_104235 - BLOCK
      ?auto_104236 - BLOCK
    )
    :vars
    (
      ?auto_104237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104230 ?auto_104231 ) ) ( not ( = ?auto_104230 ?auto_104232 ) ) ( not ( = ?auto_104230 ?auto_104233 ) ) ( not ( = ?auto_104230 ?auto_104234 ) ) ( not ( = ?auto_104230 ?auto_104235 ) ) ( not ( = ?auto_104230 ?auto_104236 ) ) ( not ( = ?auto_104231 ?auto_104232 ) ) ( not ( = ?auto_104231 ?auto_104233 ) ) ( not ( = ?auto_104231 ?auto_104234 ) ) ( not ( = ?auto_104231 ?auto_104235 ) ) ( not ( = ?auto_104231 ?auto_104236 ) ) ( not ( = ?auto_104232 ?auto_104233 ) ) ( not ( = ?auto_104232 ?auto_104234 ) ) ( not ( = ?auto_104232 ?auto_104235 ) ) ( not ( = ?auto_104232 ?auto_104236 ) ) ( not ( = ?auto_104233 ?auto_104234 ) ) ( not ( = ?auto_104233 ?auto_104235 ) ) ( not ( = ?auto_104233 ?auto_104236 ) ) ( not ( = ?auto_104234 ?auto_104235 ) ) ( not ( = ?auto_104234 ?auto_104236 ) ) ( not ( = ?auto_104235 ?auto_104236 ) ) ( ON-TABLE ?auto_104236 ) ( ON ?auto_104235 ?auto_104236 ) ( ON ?auto_104230 ?auto_104237 ) ( not ( = ?auto_104230 ?auto_104237 ) ) ( not ( = ?auto_104231 ?auto_104237 ) ) ( not ( = ?auto_104232 ?auto_104237 ) ) ( not ( = ?auto_104233 ?auto_104237 ) ) ( not ( = ?auto_104234 ?auto_104237 ) ) ( not ( = ?auto_104235 ?auto_104237 ) ) ( not ( = ?auto_104236 ?auto_104237 ) ) ( ON ?auto_104231 ?auto_104230 ) ( ON-TABLE ?auto_104237 ) ( ON ?auto_104232 ?auto_104231 ) ( ON ?auto_104233 ?auto_104232 ) ( CLEAR ?auto_104235 ) ( ON ?auto_104234 ?auto_104233 ) ( CLEAR ?auto_104234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_104237 ?auto_104230 ?auto_104231 ?auto_104232 ?auto_104233 )
      ( MAKE-7PILE ?auto_104230 ?auto_104231 ?auto_104232 ?auto_104233 ?auto_104234 ?auto_104235 ?auto_104236 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104238 - BLOCK
      ?auto_104239 - BLOCK
      ?auto_104240 - BLOCK
      ?auto_104241 - BLOCK
      ?auto_104242 - BLOCK
      ?auto_104243 - BLOCK
      ?auto_104244 - BLOCK
    )
    :vars
    (
      ?auto_104245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104238 ?auto_104239 ) ) ( not ( = ?auto_104238 ?auto_104240 ) ) ( not ( = ?auto_104238 ?auto_104241 ) ) ( not ( = ?auto_104238 ?auto_104242 ) ) ( not ( = ?auto_104238 ?auto_104243 ) ) ( not ( = ?auto_104238 ?auto_104244 ) ) ( not ( = ?auto_104239 ?auto_104240 ) ) ( not ( = ?auto_104239 ?auto_104241 ) ) ( not ( = ?auto_104239 ?auto_104242 ) ) ( not ( = ?auto_104239 ?auto_104243 ) ) ( not ( = ?auto_104239 ?auto_104244 ) ) ( not ( = ?auto_104240 ?auto_104241 ) ) ( not ( = ?auto_104240 ?auto_104242 ) ) ( not ( = ?auto_104240 ?auto_104243 ) ) ( not ( = ?auto_104240 ?auto_104244 ) ) ( not ( = ?auto_104241 ?auto_104242 ) ) ( not ( = ?auto_104241 ?auto_104243 ) ) ( not ( = ?auto_104241 ?auto_104244 ) ) ( not ( = ?auto_104242 ?auto_104243 ) ) ( not ( = ?auto_104242 ?auto_104244 ) ) ( not ( = ?auto_104243 ?auto_104244 ) ) ( ON-TABLE ?auto_104244 ) ( ON ?auto_104238 ?auto_104245 ) ( not ( = ?auto_104238 ?auto_104245 ) ) ( not ( = ?auto_104239 ?auto_104245 ) ) ( not ( = ?auto_104240 ?auto_104245 ) ) ( not ( = ?auto_104241 ?auto_104245 ) ) ( not ( = ?auto_104242 ?auto_104245 ) ) ( not ( = ?auto_104243 ?auto_104245 ) ) ( not ( = ?auto_104244 ?auto_104245 ) ) ( ON ?auto_104239 ?auto_104238 ) ( ON-TABLE ?auto_104245 ) ( ON ?auto_104240 ?auto_104239 ) ( ON ?auto_104241 ?auto_104240 ) ( ON ?auto_104242 ?auto_104241 ) ( CLEAR ?auto_104242 ) ( HOLDING ?auto_104243 ) ( CLEAR ?auto_104244 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_104244 ?auto_104243 )
      ( MAKE-7PILE ?auto_104238 ?auto_104239 ?auto_104240 ?auto_104241 ?auto_104242 ?auto_104243 ?auto_104244 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104246 - BLOCK
      ?auto_104247 - BLOCK
      ?auto_104248 - BLOCK
      ?auto_104249 - BLOCK
      ?auto_104250 - BLOCK
      ?auto_104251 - BLOCK
      ?auto_104252 - BLOCK
    )
    :vars
    (
      ?auto_104253 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104246 ?auto_104247 ) ) ( not ( = ?auto_104246 ?auto_104248 ) ) ( not ( = ?auto_104246 ?auto_104249 ) ) ( not ( = ?auto_104246 ?auto_104250 ) ) ( not ( = ?auto_104246 ?auto_104251 ) ) ( not ( = ?auto_104246 ?auto_104252 ) ) ( not ( = ?auto_104247 ?auto_104248 ) ) ( not ( = ?auto_104247 ?auto_104249 ) ) ( not ( = ?auto_104247 ?auto_104250 ) ) ( not ( = ?auto_104247 ?auto_104251 ) ) ( not ( = ?auto_104247 ?auto_104252 ) ) ( not ( = ?auto_104248 ?auto_104249 ) ) ( not ( = ?auto_104248 ?auto_104250 ) ) ( not ( = ?auto_104248 ?auto_104251 ) ) ( not ( = ?auto_104248 ?auto_104252 ) ) ( not ( = ?auto_104249 ?auto_104250 ) ) ( not ( = ?auto_104249 ?auto_104251 ) ) ( not ( = ?auto_104249 ?auto_104252 ) ) ( not ( = ?auto_104250 ?auto_104251 ) ) ( not ( = ?auto_104250 ?auto_104252 ) ) ( not ( = ?auto_104251 ?auto_104252 ) ) ( ON-TABLE ?auto_104252 ) ( ON ?auto_104246 ?auto_104253 ) ( not ( = ?auto_104246 ?auto_104253 ) ) ( not ( = ?auto_104247 ?auto_104253 ) ) ( not ( = ?auto_104248 ?auto_104253 ) ) ( not ( = ?auto_104249 ?auto_104253 ) ) ( not ( = ?auto_104250 ?auto_104253 ) ) ( not ( = ?auto_104251 ?auto_104253 ) ) ( not ( = ?auto_104252 ?auto_104253 ) ) ( ON ?auto_104247 ?auto_104246 ) ( ON-TABLE ?auto_104253 ) ( ON ?auto_104248 ?auto_104247 ) ( ON ?auto_104249 ?auto_104248 ) ( ON ?auto_104250 ?auto_104249 ) ( CLEAR ?auto_104252 ) ( ON ?auto_104251 ?auto_104250 ) ( CLEAR ?auto_104251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_104253 ?auto_104246 ?auto_104247 ?auto_104248 ?auto_104249 ?auto_104250 )
      ( MAKE-7PILE ?auto_104246 ?auto_104247 ?auto_104248 ?auto_104249 ?auto_104250 ?auto_104251 ?auto_104252 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104254 - BLOCK
      ?auto_104255 - BLOCK
      ?auto_104256 - BLOCK
      ?auto_104257 - BLOCK
      ?auto_104258 - BLOCK
      ?auto_104259 - BLOCK
      ?auto_104260 - BLOCK
    )
    :vars
    (
      ?auto_104261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104254 ?auto_104255 ) ) ( not ( = ?auto_104254 ?auto_104256 ) ) ( not ( = ?auto_104254 ?auto_104257 ) ) ( not ( = ?auto_104254 ?auto_104258 ) ) ( not ( = ?auto_104254 ?auto_104259 ) ) ( not ( = ?auto_104254 ?auto_104260 ) ) ( not ( = ?auto_104255 ?auto_104256 ) ) ( not ( = ?auto_104255 ?auto_104257 ) ) ( not ( = ?auto_104255 ?auto_104258 ) ) ( not ( = ?auto_104255 ?auto_104259 ) ) ( not ( = ?auto_104255 ?auto_104260 ) ) ( not ( = ?auto_104256 ?auto_104257 ) ) ( not ( = ?auto_104256 ?auto_104258 ) ) ( not ( = ?auto_104256 ?auto_104259 ) ) ( not ( = ?auto_104256 ?auto_104260 ) ) ( not ( = ?auto_104257 ?auto_104258 ) ) ( not ( = ?auto_104257 ?auto_104259 ) ) ( not ( = ?auto_104257 ?auto_104260 ) ) ( not ( = ?auto_104258 ?auto_104259 ) ) ( not ( = ?auto_104258 ?auto_104260 ) ) ( not ( = ?auto_104259 ?auto_104260 ) ) ( ON ?auto_104254 ?auto_104261 ) ( not ( = ?auto_104254 ?auto_104261 ) ) ( not ( = ?auto_104255 ?auto_104261 ) ) ( not ( = ?auto_104256 ?auto_104261 ) ) ( not ( = ?auto_104257 ?auto_104261 ) ) ( not ( = ?auto_104258 ?auto_104261 ) ) ( not ( = ?auto_104259 ?auto_104261 ) ) ( not ( = ?auto_104260 ?auto_104261 ) ) ( ON ?auto_104255 ?auto_104254 ) ( ON-TABLE ?auto_104261 ) ( ON ?auto_104256 ?auto_104255 ) ( ON ?auto_104257 ?auto_104256 ) ( ON ?auto_104258 ?auto_104257 ) ( ON ?auto_104259 ?auto_104258 ) ( CLEAR ?auto_104259 ) ( HOLDING ?auto_104260 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104260 )
      ( MAKE-7PILE ?auto_104254 ?auto_104255 ?auto_104256 ?auto_104257 ?auto_104258 ?auto_104259 ?auto_104260 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_104262 - BLOCK
      ?auto_104263 - BLOCK
      ?auto_104264 - BLOCK
      ?auto_104265 - BLOCK
      ?auto_104266 - BLOCK
      ?auto_104267 - BLOCK
      ?auto_104268 - BLOCK
    )
    :vars
    (
      ?auto_104269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_104262 ?auto_104263 ) ) ( not ( = ?auto_104262 ?auto_104264 ) ) ( not ( = ?auto_104262 ?auto_104265 ) ) ( not ( = ?auto_104262 ?auto_104266 ) ) ( not ( = ?auto_104262 ?auto_104267 ) ) ( not ( = ?auto_104262 ?auto_104268 ) ) ( not ( = ?auto_104263 ?auto_104264 ) ) ( not ( = ?auto_104263 ?auto_104265 ) ) ( not ( = ?auto_104263 ?auto_104266 ) ) ( not ( = ?auto_104263 ?auto_104267 ) ) ( not ( = ?auto_104263 ?auto_104268 ) ) ( not ( = ?auto_104264 ?auto_104265 ) ) ( not ( = ?auto_104264 ?auto_104266 ) ) ( not ( = ?auto_104264 ?auto_104267 ) ) ( not ( = ?auto_104264 ?auto_104268 ) ) ( not ( = ?auto_104265 ?auto_104266 ) ) ( not ( = ?auto_104265 ?auto_104267 ) ) ( not ( = ?auto_104265 ?auto_104268 ) ) ( not ( = ?auto_104266 ?auto_104267 ) ) ( not ( = ?auto_104266 ?auto_104268 ) ) ( not ( = ?auto_104267 ?auto_104268 ) ) ( ON ?auto_104262 ?auto_104269 ) ( not ( = ?auto_104262 ?auto_104269 ) ) ( not ( = ?auto_104263 ?auto_104269 ) ) ( not ( = ?auto_104264 ?auto_104269 ) ) ( not ( = ?auto_104265 ?auto_104269 ) ) ( not ( = ?auto_104266 ?auto_104269 ) ) ( not ( = ?auto_104267 ?auto_104269 ) ) ( not ( = ?auto_104268 ?auto_104269 ) ) ( ON ?auto_104263 ?auto_104262 ) ( ON-TABLE ?auto_104269 ) ( ON ?auto_104264 ?auto_104263 ) ( ON ?auto_104265 ?auto_104264 ) ( ON ?auto_104266 ?auto_104265 ) ( ON ?auto_104267 ?auto_104266 ) ( ON ?auto_104268 ?auto_104267 ) ( CLEAR ?auto_104268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_104269 ?auto_104262 ?auto_104263 ?auto_104264 ?auto_104265 ?auto_104266 ?auto_104267 )
      ( MAKE-7PILE ?auto_104262 ?auto_104263 ?auto_104264 ?auto_104265 ?auto_104266 ?auto_104267 ?auto_104268 ) )
  )

)

