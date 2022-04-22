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
      ?auto_166715 - BLOCK
    )
    :vars
    (
      ?auto_166716 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166715 ?auto_166716 ) ( CLEAR ?auto_166715 ) ( HAND-EMPTY ) ( not ( = ?auto_166715 ?auto_166716 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166715 ?auto_166716 )
      ( !PUTDOWN ?auto_166715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_166718 - BLOCK
    )
    :vars
    (
      ?auto_166719 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166718 ?auto_166719 ) ( CLEAR ?auto_166718 ) ( HAND-EMPTY ) ( not ( = ?auto_166718 ?auto_166719 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166718 ?auto_166719 )
      ( !PUTDOWN ?auto_166718 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166722 - BLOCK
      ?auto_166723 - BLOCK
    )
    :vars
    (
      ?auto_166724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166722 ) ( ON ?auto_166723 ?auto_166724 ) ( CLEAR ?auto_166723 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166722 ) ( not ( = ?auto_166722 ?auto_166723 ) ) ( not ( = ?auto_166722 ?auto_166724 ) ) ( not ( = ?auto_166723 ?auto_166724 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166723 ?auto_166724 )
      ( !STACK ?auto_166723 ?auto_166722 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166727 - BLOCK
      ?auto_166728 - BLOCK
    )
    :vars
    (
      ?auto_166729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166727 ) ( ON ?auto_166728 ?auto_166729 ) ( CLEAR ?auto_166728 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166727 ) ( not ( = ?auto_166727 ?auto_166728 ) ) ( not ( = ?auto_166727 ?auto_166729 ) ) ( not ( = ?auto_166728 ?auto_166729 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166728 ?auto_166729 )
      ( !STACK ?auto_166728 ?auto_166727 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166732 - BLOCK
      ?auto_166733 - BLOCK
    )
    :vars
    (
      ?auto_166734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166733 ?auto_166734 ) ( not ( = ?auto_166732 ?auto_166733 ) ) ( not ( = ?auto_166732 ?auto_166734 ) ) ( not ( = ?auto_166733 ?auto_166734 ) ) ( ON ?auto_166732 ?auto_166733 ) ( CLEAR ?auto_166732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166732 )
      ( MAKE-2PILE ?auto_166732 ?auto_166733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_166737 - BLOCK
      ?auto_166738 - BLOCK
    )
    :vars
    (
      ?auto_166739 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166738 ?auto_166739 ) ( not ( = ?auto_166737 ?auto_166738 ) ) ( not ( = ?auto_166737 ?auto_166739 ) ) ( not ( = ?auto_166738 ?auto_166739 ) ) ( ON ?auto_166737 ?auto_166738 ) ( CLEAR ?auto_166737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166737 )
      ( MAKE-2PILE ?auto_166737 ?auto_166738 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166743 - BLOCK
      ?auto_166744 - BLOCK
      ?auto_166745 - BLOCK
    )
    :vars
    (
      ?auto_166746 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166744 ) ( ON ?auto_166745 ?auto_166746 ) ( CLEAR ?auto_166745 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166743 ) ( ON ?auto_166744 ?auto_166743 ) ( not ( = ?auto_166743 ?auto_166744 ) ) ( not ( = ?auto_166743 ?auto_166745 ) ) ( not ( = ?auto_166743 ?auto_166746 ) ) ( not ( = ?auto_166744 ?auto_166745 ) ) ( not ( = ?auto_166744 ?auto_166746 ) ) ( not ( = ?auto_166745 ?auto_166746 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166745 ?auto_166746 )
      ( !STACK ?auto_166745 ?auto_166744 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166750 - BLOCK
      ?auto_166751 - BLOCK
      ?auto_166752 - BLOCK
    )
    :vars
    (
      ?auto_166753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166751 ) ( ON ?auto_166752 ?auto_166753 ) ( CLEAR ?auto_166752 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166750 ) ( ON ?auto_166751 ?auto_166750 ) ( not ( = ?auto_166750 ?auto_166751 ) ) ( not ( = ?auto_166750 ?auto_166752 ) ) ( not ( = ?auto_166750 ?auto_166753 ) ) ( not ( = ?auto_166751 ?auto_166752 ) ) ( not ( = ?auto_166751 ?auto_166753 ) ) ( not ( = ?auto_166752 ?auto_166753 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166752 ?auto_166753 )
      ( !STACK ?auto_166752 ?auto_166751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166757 - BLOCK
      ?auto_166758 - BLOCK
      ?auto_166759 - BLOCK
    )
    :vars
    (
      ?auto_166760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166759 ?auto_166760 ) ( ON-TABLE ?auto_166757 ) ( not ( = ?auto_166757 ?auto_166758 ) ) ( not ( = ?auto_166757 ?auto_166759 ) ) ( not ( = ?auto_166757 ?auto_166760 ) ) ( not ( = ?auto_166758 ?auto_166759 ) ) ( not ( = ?auto_166758 ?auto_166760 ) ) ( not ( = ?auto_166759 ?auto_166760 ) ) ( CLEAR ?auto_166757 ) ( ON ?auto_166758 ?auto_166759 ) ( CLEAR ?auto_166758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166757 ?auto_166758 )
      ( MAKE-3PILE ?auto_166757 ?auto_166758 ?auto_166759 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166764 - BLOCK
      ?auto_166765 - BLOCK
      ?auto_166766 - BLOCK
    )
    :vars
    (
      ?auto_166767 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166766 ?auto_166767 ) ( ON-TABLE ?auto_166764 ) ( not ( = ?auto_166764 ?auto_166765 ) ) ( not ( = ?auto_166764 ?auto_166766 ) ) ( not ( = ?auto_166764 ?auto_166767 ) ) ( not ( = ?auto_166765 ?auto_166766 ) ) ( not ( = ?auto_166765 ?auto_166767 ) ) ( not ( = ?auto_166766 ?auto_166767 ) ) ( CLEAR ?auto_166764 ) ( ON ?auto_166765 ?auto_166766 ) ( CLEAR ?auto_166765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166764 ?auto_166765 )
      ( MAKE-3PILE ?auto_166764 ?auto_166765 ?auto_166766 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166771 - BLOCK
      ?auto_166772 - BLOCK
      ?auto_166773 - BLOCK
    )
    :vars
    (
      ?auto_166774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166773 ?auto_166774 ) ( not ( = ?auto_166771 ?auto_166772 ) ) ( not ( = ?auto_166771 ?auto_166773 ) ) ( not ( = ?auto_166771 ?auto_166774 ) ) ( not ( = ?auto_166772 ?auto_166773 ) ) ( not ( = ?auto_166772 ?auto_166774 ) ) ( not ( = ?auto_166773 ?auto_166774 ) ) ( ON ?auto_166772 ?auto_166773 ) ( ON ?auto_166771 ?auto_166772 ) ( CLEAR ?auto_166771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166771 )
      ( MAKE-3PILE ?auto_166771 ?auto_166772 ?auto_166773 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_166778 - BLOCK
      ?auto_166779 - BLOCK
      ?auto_166780 - BLOCK
    )
    :vars
    (
      ?auto_166781 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166780 ?auto_166781 ) ( not ( = ?auto_166778 ?auto_166779 ) ) ( not ( = ?auto_166778 ?auto_166780 ) ) ( not ( = ?auto_166778 ?auto_166781 ) ) ( not ( = ?auto_166779 ?auto_166780 ) ) ( not ( = ?auto_166779 ?auto_166781 ) ) ( not ( = ?auto_166780 ?auto_166781 ) ) ( ON ?auto_166779 ?auto_166780 ) ( ON ?auto_166778 ?auto_166779 ) ( CLEAR ?auto_166778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166778 )
      ( MAKE-3PILE ?auto_166778 ?auto_166779 ?auto_166780 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166786 - BLOCK
      ?auto_166787 - BLOCK
      ?auto_166788 - BLOCK
      ?auto_166789 - BLOCK
    )
    :vars
    (
      ?auto_166790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166788 ) ( ON ?auto_166789 ?auto_166790 ) ( CLEAR ?auto_166789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166786 ) ( ON ?auto_166787 ?auto_166786 ) ( ON ?auto_166788 ?auto_166787 ) ( not ( = ?auto_166786 ?auto_166787 ) ) ( not ( = ?auto_166786 ?auto_166788 ) ) ( not ( = ?auto_166786 ?auto_166789 ) ) ( not ( = ?auto_166786 ?auto_166790 ) ) ( not ( = ?auto_166787 ?auto_166788 ) ) ( not ( = ?auto_166787 ?auto_166789 ) ) ( not ( = ?auto_166787 ?auto_166790 ) ) ( not ( = ?auto_166788 ?auto_166789 ) ) ( not ( = ?auto_166788 ?auto_166790 ) ) ( not ( = ?auto_166789 ?auto_166790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166789 ?auto_166790 )
      ( !STACK ?auto_166789 ?auto_166788 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166795 - BLOCK
      ?auto_166796 - BLOCK
      ?auto_166797 - BLOCK
      ?auto_166798 - BLOCK
    )
    :vars
    (
      ?auto_166799 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166797 ) ( ON ?auto_166798 ?auto_166799 ) ( CLEAR ?auto_166798 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166795 ) ( ON ?auto_166796 ?auto_166795 ) ( ON ?auto_166797 ?auto_166796 ) ( not ( = ?auto_166795 ?auto_166796 ) ) ( not ( = ?auto_166795 ?auto_166797 ) ) ( not ( = ?auto_166795 ?auto_166798 ) ) ( not ( = ?auto_166795 ?auto_166799 ) ) ( not ( = ?auto_166796 ?auto_166797 ) ) ( not ( = ?auto_166796 ?auto_166798 ) ) ( not ( = ?auto_166796 ?auto_166799 ) ) ( not ( = ?auto_166797 ?auto_166798 ) ) ( not ( = ?auto_166797 ?auto_166799 ) ) ( not ( = ?auto_166798 ?auto_166799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166798 ?auto_166799 )
      ( !STACK ?auto_166798 ?auto_166797 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166804 - BLOCK
      ?auto_166805 - BLOCK
      ?auto_166806 - BLOCK
      ?auto_166807 - BLOCK
    )
    :vars
    (
      ?auto_166808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166807 ?auto_166808 ) ( ON-TABLE ?auto_166804 ) ( ON ?auto_166805 ?auto_166804 ) ( not ( = ?auto_166804 ?auto_166805 ) ) ( not ( = ?auto_166804 ?auto_166806 ) ) ( not ( = ?auto_166804 ?auto_166807 ) ) ( not ( = ?auto_166804 ?auto_166808 ) ) ( not ( = ?auto_166805 ?auto_166806 ) ) ( not ( = ?auto_166805 ?auto_166807 ) ) ( not ( = ?auto_166805 ?auto_166808 ) ) ( not ( = ?auto_166806 ?auto_166807 ) ) ( not ( = ?auto_166806 ?auto_166808 ) ) ( not ( = ?auto_166807 ?auto_166808 ) ) ( CLEAR ?auto_166805 ) ( ON ?auto_166806 ?auto_166807 ) ( CLEAR ?auto_166806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166804 ?auto_166805 ?auto_166806 )
      ( MAKE-4PILE ?auto_166804 ?auto_166805 ?auto_166806 ?auto_166807 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166813 - BLOCK
      ?auto_166814 - BLOCK
      ?auto_166815 - BLOCK
      ?auto_166816 - BLOCK
    )
    :vars
    (
      ?auto_166817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166816 ?auto_166817 ) ( ON-TABLE ?auto_166813 ) ( ON ?auto_166814 ?auto_166813 ) ( not ( = ?auto_166813 ?auto_166814 ) ) ( not ( = ?auto_166813 ?auto_166815 ) ) ( not ( = ?auto_166813 ?auto_166816 ) ) ( not ( = ?auto_166813 ?auto_166817 ) ) ( not ( = ?auto_166814 ?auto_166815 ) ) ( not ( = ?auto_166814 ?auto_166816 ) ) ( not ( = ?auto_166814 ?auto_166817 ) ) ( not ( = ?auto_166815 ?auto_166816 ) ) ( not ( = ?auto_166815 ?auto_166817 ) ) ( not ( = ?auto_166816 ?auto_166817 ) ) ( CLEAR ?auto_166814 ) ( ON ?auto_166815 ?auto_166816 ) ( CLEAR ?auto_166815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166813 ?auto_166814 ?auto_166815 )
      ( MAKE-4PILE ?auto_166813 ?auto_166814 ?auto_166815 ?auto_166816 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166822 - BLOCK
      ?auto_166823 - BLOCK
      ?auto_166824 - BLOCK
      ?auto_166825 - BLOCK
    )
    :vars
    (
      ?auto_166826 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166825 ?auto_166826 ) ( ON-TABLE ?auto_166822 ) ( not ( = ?auto_166822 ?auto_166823 ) ) ( not ( = ?auto_166822 ?auto_166824 ) ) ( not ( = ?auto_166822 ?auto_166825 ) ) ( not ( = ?auto_166822 ?auto_166826 ) ) ( not ( = ?auto_166823 ?auto_166824 ) ) ( not ( = ?auto_166823 ?auto_166825 ) ) ( not ( = ?auto_166823 ?auto_166826 ) ) ( not ( = ?auto_166824 ?auto_166825 ) ) ( not ( = ?auto_166824 ?auto_166826 ) ) ( not ( = ?auto_166825 ?auto_166826 ) ) ( ON ?auto_166824 ?auto_166825 ) ( CLEAR ?auto_166822 ) ( ON ?auto_166823 ?auto_166824 ) ( CLEAR ?auto_166823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166822 ?auto_166823 )
      ( MAKE-4PILE ?auto_166822 ?auto_166823 ?auto_166824 ?auto_166825 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166831 - BLOCK
      ?auto_166832 - BLOCK
      ?auto_166833 - BLOCK
      ?auto_166834 - BLOCK
    )
    :vars
    (
      ?auto_166835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166834 ?auto_166835 ) ( ON-TABLE ?auto_166831 ) ( not ( = ?auto_166831 ?auto_166832 ) ) ( not ( = ?auto_166831 ?auto_166833 ) ) ( not ( = ?auto_166831 ?auto_166834 ) ) ( not ( = ?auto_166831 ?auto_166835 ) ) ( not ( = ?auto_166832 ?auto_166833 ) ) ( not ( = ?auto_166832 ?auto_166834 ) ) ( not ( = ?auto_166832 ?auto_166835 ) ) ( not ( = ?auto_166833 ?auto_166834 ) ) ( not ( = ?auto_166833 ?auto_166835 ) ) ( not ( = ?auto_166834 ?auto_166835 ) ) ( ON ?auto_166833 ?auto_166834 ) ( CLEAR ?auto_166831 ) ( ON ?auto_166832 ?auto_166833 ) ( CLEAR ?auto_166832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166831 ?auto_166832 )
      ( MAKE-4PILE ?auto_166831 ?auto_166832 ?auto_166833 ?auto_166834 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166840 - BLOCK
      ?auto_166841 - BLOCK
      ?auto_166842 - BLOCK
      ?auto_166843 - BLOCK
    )
    :vars
    (
      ?auto_166844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166843 ?auto_166844 ) ( not ( = ?auto_166840 ?auto_166841 ) ) ( not ( = ?auto_166840 ?auto_166842 ) ) ( not ( = ?auto_166840 ?auto_166843 ) ) ( not ( = ?auto_166840 ?auto_166844 ) ) ( not ( = ?auto_166841 ?auto_166842 ) ) ( not ( = ?auto_166841 ?auto_166843 ) ) ( not ( = ?auto_166841 ?auto_166844 ) ) ( not ( = ?auto_166842 ?auto_166843 ) ) ( not ( = ?auto_166842 ?auto_166844 ) ) ( not ( = ?auto_166843 ?auto_166844 ) ) ( ON ?auto_166842 ?auto_166843 ) ( ON ?auto_166841 ?auto_166842 ) ( ON ?auto_166840 ?auto_166841 ) ( CLEAR ?auto_166840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166840 )
      ( MAKE-4PILE ?auto_166840 ?auto_166841 ?auto_166842 ?auto_166843 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_166849 - BLOCK
      ?auto_166850 - BLOCK
      ?auto_166851 - BLOCK
      ?auto_166852 - BLOCK
    )
    :vars
    (
      ?auto_166853 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166852 ?auto_166853 ) ( not ( = ?auto_166849 ?auto_166850 ) ) ( not ( = ?auto_166849 ?auto_166851 ) ) ( not ( = ?auto_166849 ?auto_166852 ) ) ( not ( = ?auto_166849 ?auto_166853 ) ) ( not ( = ?auto_166850 ?auto_166851 ) ) ( not ( = ?auto_166850 ?auto_166852 ) ) ( not ( = ?auto_166850 ?auto_166853 ) ) ( not ( = ?auto_166851 ?auto_166852 ) ) ( not ( = ?auto_166851 ?auto_166853 ) ) ( not ( = ?auto_166852 ?auto_166853 ) ) ( ON ?auto_166851 ?auto_166852 ) ( ON ?auto_166850 ?auto_166851 ) ( ON ?auto_166849 ?auto_166850 ) ( CLEAR ?auto_166849 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166849 )
      ( MAKE-4PILE ?auto_166849 ?auto_166850 ?auto_166851 ?auto_166852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166859 - BLOCK
      ?auto_166860 - BLOCK
      ?auto_166861 - BLOCK
      ?auto_166862 - BLOCK
      ?auto_166863 - BLOCK
    )
    :vars
    (
      ?auto_166864 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166862 ) ( ON ?auto_166863 ?auto_166864 ) ( CLEAR ?auto_166863 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166859 ) ( ON ?auto_166860 ?auto_166859 ) ( ON ?auto_166861 ?auto_166860 ) ( ON ?auto_166862 ?auto_166861 ) ( not ( = ?auto_166859 ?auto_166860 ) ) ( not ( = ?auto_166859 ?auto_166861 ) ) ( not ( = ?auto_166859 ?auto_166862 ) ) ( not ( = ?auto_166859 ?auto_166863 ) ) ( not ( = ?auto_166859 ?auto_166864 ) ) ( not ( = ?auto_166860 ?auto_166861 ) ) ( not ( = ?auto_166860 ?auto_166862 ) ) ( not ( = ?auto_166860 ?auto_166863 ) ) ( not ( = ?auto_166860 ?auto_166864 ) ) ( not ( = ?auto_166861 ?auto_166862 ) ) ( not ( = ?auto_166861 ?auto_166863 ) ) ( not ( = ?auto_166861 ?auto_166864 ) ) ( not ( = ?auto_166862 ?auto_166863 ) ) ( not ( = ?auto_166862 ?auto_166864 ) ) ( not ( = ?auto_166863 ?auto_166864 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166863 ?auto_166864 )
      ( !STACK ?auto_166863 ?auto_166862 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166870 - BLOCK
      ?auto_166871 - BLOCK
      ?auto_166872 - BLOCK
      ?auto_166873 - BLOCK
      ?auto_166874 - BLOCK
    )
    :vars
    (
      ?auto_166875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166873 ) ( ON ?auto_166874 ?auto_166875 ) ( CLEAR ?auto_166874 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166870 ) ( ON ?auto_166871 ?auto_166870 ) ( ON ?auto_166872 ?auto_166871 ) ( ON ?auto_166873 ?auto_166872 ) ( not ( = ?auto_166870 ?auto_166871 ) ) ( not ( = ?auto_166870 ?auto_166872 ) ) ( not ( = ?auto_166870 ?auto_166873 ) ) ( not ( = ?auto_166870 ?auto_166874 ) ) ( not ( = ?auto_166870 ?auto_166875 ) ) ( not ( = ?auto_166871 ?auto_166872 ) ) ( not ( = ?auto_166871 ?auto_166873 ) ) ( not ( = ?auto_166871 ?auto_166874 ) ) ( not ( = ?auto_166871 ?auto_166875 ) ) ( not ( = ?auto_166872 ?auto_166873 ) ) ( not ( = ?auto_166872 ?auto_166874 ) ) ( not ( = ?auto_166872 ?auto_166875 ) ) ( not ( = ?auto_166873 ?auto_166874 ) ) ( not ( = ?auto_166873 ?auto_166875 ) ) ( not ( = ?auto_166874 ?auto_166875 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166874 ?auto_166875 )
      ( !STACK ?auto_166874 ?auto_166873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166881 - BLOCK
      ?auto_166882 - BLOCK
      ?auto_166883 - BLOCK
      ?auto_166884 - BLOCK
      ?auto_166885 - BLOCK
    )
    :vars
    (
      ?auto_166886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166885 ?auto_166886 ) ( ON-TABLE ?auto_166881 ) ( ON ?auto_166882 ?auto_166881 ) ( ON ?auto_166883 ?auto_166882 ) ( not ( = ?auto_166881 ?auto_166882 ) ) ( not ( = ?auto_166881 ?auto_166883 ) ) ( not ( = ?auto_166881 ?auto_166884 ) ) ( not ( = ?auto_166881 ?auto_166885 ) ) ( not ( = ?auto_166881 ?auto_166886 ) ) ( not ( = ?auto_166882 ?auto_166883 ) ) ( not ( = ?auto_166882 ?auto_166884 ) ) ( not ( = ?auto_166882 ?auto_166885 ) ) ( not ( = ?auto_166882 ?auto_166886 ) ) ( not ( = ?auto_166883 ?auto_166884 ) ) ( not ( = ?auto_166883 ?auto_166885 ) ) ( not ( = ?auto_166883 ?auto_166886 ) ) ( not ( = ?auto_166884 ?auto_166885 ) ) ( not ( = ?auto_166884 ?auto_166886 ) ) ( not ( = ?auto_166885 ?auto_166886 ) ) ( CLEAR ?auto_166883 ) ( ON ?auto_166884 ?auto_166885 ) ( CLEAR ?auto_166884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166881 ?auto_166882 ?auto_166883 ?auto_166884 )
      ( MAKE-5PILE ?auto_166881 ?auto_166882 ?auto_166883 ?auto_166884 ?auto_166885 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166892 - BLOCK
      ?auto_166893 - BLOCK
      ?auto_166894 - BLOCK
      ?auto_166895 - BLOCK
      ?auto_166896 - BLOCK
    )
    :vars
    (
      ?auto_166897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166896 ?auto_166897 ) ( ON-TABLE ?auto_166892 ) ( ON ?auto_166893 ?auto_166892 ) ( ON ?auto_166894 ?auto_166893 ) ( not ( = ?auto_166892 ?auto_166893 ) ) ( not ( = ?auto_166892 ?auto_166894 ) ) ( not ( = ?auto_166892 ?auto_166895 ) ) ( not ( = ?auto_166892 ?auto_166896 ) ) ( not ( = ?auto_166892 ?auto_166897 ) ) ( not ( = ?auto_166893 ?auto_166894 ) ) ( not ( = ?auto_166893 ?auto_166895 ) ) ( not ( = ?auto_166893 ?auto_166896 ) ) ( not ( = ?auto_166893 ?auto_166897 ) ) ( not ( = ?auto_166894 ?auto_166895 ) ) ( not ( = ?auto_166894 ?auto_166896 ) ) ( not ( = ?auto_166894 ?auto_166897 ) ) ( not ( = ?auto_166895 ?auto_166896 ) ) ( not ( = ?auto_166895 ?auto_166897 ) ) ( not ( = ?auto_166896 ?auto_166897 ) ) ( CLEAR ?auto_166894 ) ( ON ?auto_166895 ?auto_166896 ) ( CLEAR ?auto_166895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_166892 ?auto_166893 ?auto_166894 ?auto_166895 )
      ( MAKE-5PILE ?auto_166892 ?auto_166893 ?auto_166894 ?auto_166895 ?auto_166896 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166903 - BLOCK
      ?auto_166904 - BLOCK
      ?auto_166905 - BLOCK
      ?auto_166906 - BLOCK
      ?auto_166907 - BLOCK
    )
    :vars
    (
      ?auto_166908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166907 ?auto_166908 ) ( ON-TABLE ?auto_166903 ) ( ON ?auto_166904 ?auto_166903 ) ( not ( = ?auto_166903 ?auto_166904 ) ) ( not ( = ?auto_166903 ?auto_166905 ) ) ( not ( = ?auto_166903 ?auto_166906 ) ) ( not ( = ?auto_166903 ?auto_166907 ) ) ( not ( = ?auto_166903 ?auto_166908 ) ) ( not ( = ?auto_166904 ?auto_166905 ) ) ( not ( = ?auto_166904 ?auto_166906 ) ) ( not ( = ?auto_166904 ?auto_166907 ) ) ( not ( = ?auto_166904 ?auto_166908 ) ) ( not ( = ?auto_166905 ?auto_166906 ) ) ( not ( = ?auto_166905 ?auto_166907 ) ) ( not ( = ?auto_166905 ?auto_166908 ) ) ( not ( = ?auto_166906 ?auto_166907 ) ) ( not ( = ?auto_166906 ?auto_166908 ) ) ( not ( = ?auto_166907 ?auto_166908 ) ) ( ON ?auto_166906 ?auto_166907 ) ( CLEAR ?auto_166904 ) ( ON ?auto_166905 ?auto_166906 ) ( CLEAR ?auto_166905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166903 ?auto_166904 ?auto_166905 )
      ( MAKE-5PILE ?auto_166903 ?auto_166904 ?auto_166905 ?auto_166906 ?auto_166907 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166914 - BLOCK
      ?auto_166915 - BLOCK
      ?auto_166916 - BLOCK
      ?auto_166917 - BLOCK
      ?auto_166918 - BLOCK
    )
    :vars
    (
      ?auto_166919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166918 ?auto_166919 ) ( ON-TABLE ?auto_166914 ) ( ON ?auto_166915 ?auto_166914 ) ( not ( = ?auto_166914 ?auto_166915 ) ) ( not ( = ?auto_166914 ?auto_166916 ) ) ( not ( = ?auto_166914 ?auto_166917 ) ) ( not ( = ?auto_166914 ?auto_166918 ) ) ( not ( = ?auto_166914 ?auto_166919 ) ) ( not ( = ?auto_166915 ?auto_166916 ) ) ( not ( = ?auto_166915 ?auto_166917 ) ) ( not ( = ?auto_166915 ?auto_166918 ) ) ( not ( = ?auto_166915 ?auto_166919 ) ) ( not ( = ?auto_166916 ?auto_166917 ) ) ( not ( = ?auto_166916 ?auto_166918 ) ) ( not ( = ?auto_166916 ?auto_166919 ) ) ( not ( = ?auto_166917 ?auto_166918 ) ) ( not ( = ?auto_166917 ?auto_166919 ) ) ( not ( = ?auto_166918 ?auto_166919 ) ) ( ON ?auto_166917 ?auto_166918 ) ( CLEAR ?auto_166915 ) ( ON ?auto_166916 ?auto_166917 ) ( CLEAR ?auto_166916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_166914 ?auto_166915 ?auto_166916 )
      ( MAKE-5PILE ?auto_166914 ?auto_166915 ?auto_166916 ?auto_166917 ?auto_166918 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166925 - BLOCK
      ?auto_166926 - BLOCK
      ?auto_166927 - BLOCK
      ?auto_166928 - BLOCK
      ?auto_166929 - BLOCK
    )
    :vars
    (
      ?auto_166930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166929 ?auto_166930 ) ( ON-TABLE ?auto_166925 ) ( not ( = ?auto_166925 ?auto_166926 ) ) ( not ( = ?auto_166925 ?auto_166927 ) ) ( not ( = ?auto_166925 ?auto_166928 ) ) ( not ( = ?auto_166925 ?auto_166929 ) ) ( not ( = ?auto_166925 ?auto_166930 ) ) ( not ( = ?auto_166926 ?auto_166927 ) ) ( not ( = ?auto_166926 ?auto_166928 ) ) ( not ( = ?auto_166926 ?auto_166929 ) ) ( not ( = ?auto_166926 ?auto_166930 ) ) ( not ( = ?auto_166927 ?auto_166928 ) ) ( not ( = ?auto_166927 ?auto_166929 ) ) ( not ( = ?auto_166927 ?auto_166930 ) ) ( not ( = ?auto_166928 ?auto_166929 ) ) ( not ( = ?auto_166928 ?auto_166930 ) ) ( not ( = ?auto_166929 ?auto_166930 ) ) ( ON ?auto_166928 ?auto_166929 ) ( ON ?auto_166927 ?auto_166928 ) ( CLEAR ?auto_166925 ) ( ON ?auto_166926 ?auto_166927 ) ( CLEAR ?auto_166926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166925 ?auto_166926 )
      ( MAKE-5PILE ?auto_166925 ?auto_166926 ?auto_166927 ?auto_166928 ?auto_166929 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166936 - BLOCK
      ?auto_166937 - BLOCK
      ?auto_166938 - BLOCK
      ?auto_166939 - BLOCK
      ?auto_166940 - BLOCK
    )
    :vars
    (
      ?auto_166941 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166940 ?auto_166941 ) ( ON-TABLE ?auto_166936 ) ( not ( = ?auto_166936 ?auto_166937 ) ) ( not ( = ?auto_166936 ?auto_166938 ) ) ( not ( = ?auto_166936 ?auto_166939 ) ) ( not ( = ?auto_166936 ?auto_166940 ) ) ( not ( = ?auto_166936 ?auto_166941 ) ) ( not ( = ?auto_166937 ?auto_166938 ) ) ( not ( = ?auto_166937 ?auto_166939 ) ) ( not ( = ?auto_166937 ?auto_166940 ) ) ( not ( = ?auto_166937 ?auto_166941 ) ) ( not ( = ?auto_166938 ?auto_166939 ) ) ( not ( = ?auto_166938 ?auto_166940 ) ) ( not ( = ?auto_166938 ?auto_166941 ) ) ( not ( = ?auto_166939 ?auto_166940 ) ) ( not ( = ?auto_166939 ?auto_166941 ) ) ( not ( = ?auto_166940 ?auto_166941 ) ) ( ON ?auto_166939 ?auto_166940 ) ( ON ?auto_166938 ?auto_166939 ) ( CLEAR ?auto_166936 ) ( ON ?auto_166937 ?auto_166938 ) ( CLEAR ?auto_166937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_166936 ?auto_166937 )
      ( MAKE-5PILE ?auto_166936 ?auto_166937 ?auto_166938 ?auto_166939 ?auto_166940 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166947 - BLOCK
      ?auto_166948 - BLOCK
      ?auto_166949 - BLOCK
      ?auto_166950 - BLOCK
      ?auto_166951 - BLOCK
    )
    :vars
    (
      ?auto_166952 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166951 ?auto_166952 ) ( not ( = ?auto_166947 ?auto_166948 ) ) ( not ( = ?auto_166947 ?auto_166949 ) ) ( not ( = ?auto_166947 ?auto_166950 ) ) ( not ( = ?auto_166947 ?auto_166951 ) ) ( not ( = ?auto_166947 ?auto_166952 ) ) ( not ( = ?auto_166948 ?auto_166949 ) ) ( not ( = ?auto_166948 ?auto_166950 ) ) ( not ( = ?auto_166948 ?auto_166951 ) ) ( not ( = ?auto_166948 ?auto_166952 ) ) ( not ( = ?auto_166949 ?auto_166950 ) ) ( not ( = ?auto_166949 ?auto_166951 ) ) ( not ( = ?auto_166949 ?auto_166952 ) ) ( not ( = ?auto_166950 ?auto_166951 ) ) ( not ( = ?auto_166950 ?auto_166952 ) ) ( not ( = ?auto_166951 ?auto_166952 ) ) ( ON ?auto_166950 ?auto_166951 ) ( ON ?auto_166949 ?auto_166950 ) ( ON ?auto_166948 ?auto_166949 ) ( ON ?auto_166947 ?auto_166948 ) ( CLEAR ?auto_166947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166947 )
      ( MAKE-5PILE ?auto_166947 ?auto_166948 ?auto_166949 ?auto_166950 ?auto_166951 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_166958 - BLOCK
      ?auto_166959 - BLOCK
      ?auto_166960 - BLOCK
      ?auto_166961 - BLOCK
      ?auto_166962 - BLOCK
    )
    :vars
    (
      ?auto_166963 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166962 ?auto_166963 ) ( not ( = ?auto_166958 ?auto_166959 ) ) ( not ( = ?auto_166958 ?auto_166960 ) ) ( not ( = ?auto_166958 ?auto_166961 ) ) ( not ( = ?auto_166958 ?auto_166962 ) ) ( not ( = ?auto_166958 ?auto_166963 ) ) ( not ( = ?auto_166959 ?auto_166960 ) ) ( not ( = ?auto_166959 ?auto_166961 ) ) ( not ( = ?auto_166959 ?auto_166962 ) ) ( not ( = ?auto_166959 ?auto_166963 ) ) ( not ( = ?auto_166960 ?auto_166961 ) ) ( not ( = ?auto_166960 ?auto_166962 ) ) ( not ( = ?auto_166960 ?auto_166963 ) ) ( not ( = ?auto_166961 ?auto_166962 ) ) ( not ( = ?auto_166961 ?auto_166963 ) ) ( not ( = ?auto_166962 ?auto_166963 ) ) ( ON ?auto_166961 ?auto_166962 ) ( ON ?auto_166960 ?auto_166961 ) ( ON ?auto_166959 ?auto_166960 ) ( ON ?auto_166958 ?auto_166959 ) ( CLEAR ?auto_166958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_166958 )
      ( MAKE-5PILE ?auto_166958 ?auto_166959 ?auto_166960 ?auto_166961 ?auto_166962 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166970 - BLOCK
      ?auto_166971 - BLOCK
      ?auto_166972 - BLOCK
      ?auto_166973 - BLOCK
      ?auto_166974 - BLOCK
      ?auto_166975 - BLOCK
    )
    :vars
    (
      ?auto_166976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166974 ) ( ON ?auto_166975 ?auto_166976 ) ( CLEAR ?auto_166975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166970 ) ( ON ?auto_166971 ?auto_166970 ) ( ON ?auto_166972 ?auto_166971 ) ( ON ?auto_166973 ?auto_166972 ) ( ON ?auto_166974 ?auto_166973 ) ( not ( = ?auto_166970 ?auto_166971 ) ) ( not ( = ?auto_166970 ?auto_166972 ) ) ( not ( = ?auto_166970 ?auto_166973 ) ) ( not ( = ?auto_166970 ?auto_166974 ) ) ( not ( = ?auto_166970 ?auto_166975 ) ) ( not ( = ?auto_166970 ?auto_166976 ) ) ( not ( = ?auto_166971 ?auto_166972 ) ) ( not ( = ?auto_166971 ?auto_166973 ) ) ( not ( = ?auto_166971 ?auto_166974 ) ) ( not ( = ?auto_166971 ?auto_166975 ) ) ( not ( = ?auto_166971 ?auto_166976 ) ) ( not ( = ?auto_166972 ?auto_166973 ) ) ( not ( = ?auto_166972 ?auto_166974 ) ) ( not ( = ?auto_166972 ?auto_166975 ) ) ( not ( = ?auto_166972 ?auto_166976 ) ) ( not ( = ?auto_166973 ?auto_166974 ) ) ( not ( = ?auto_166973 ?auto_166975 ) ) ( not ( = ?auto_166973 ?auto_166976 ) ) ( not ( = ?auto_166974 ?auto_166975 ) ) ( not ( = ?auto_166974 ?auto_166976 ) ) ( not ( = ?auto_166975 ?auto_166976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166975 ?auto_166976 )
      ( !STACK ?auto_166975 ?auto_166974 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166983 - BLOCK
      ?auto_166984 - BLOCK
      ?auto_166985 - BLOCK
      ?auto_166986 - BLOCK
      ?auto_166987 - BLOCK
      ?auto_166988 - BLOCK
    )
    :vars
    (
      ?auto_166989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_166987 ) ( ON ?auto_166988 ?auto_166989 ) ( CLEAR ?auto_166988 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_166983 ) ( ON ?auto_166984 ?auto_166983 ) ( ON ?auto_166985 ?auto_166984 ) ( ON ?auto_166986 ?auto_166985 ) ( ON ?auto_166987 ?auto_166986 ) ( not ( = ?auto_166983 ?auto_166984 ) ) ( not ( = ?auto_166983 ?auto_166985 ) ) ( not ( = ?auto_166983 ?auto_166986 ) ) ( not ( = ?auto_166983 ?auto_166987 ) ) ( not ( = ?auto_166983 ?auto_166988 ) ) ( not ( = ?auto_166983 ?auto_166989 ) ) ( not ( = ?auto_166984 ?auto_166985 ) ) ( not ( = ?auto_166984 ?auto_166986 ) ) ( not ( = ?auto_166984 ?auto_166987 ) ) ( not ( = ?auto_166984 ?auto_166988 ) ) ( not ( = ?auto_166984 ?auto_166989 ) ) ( not ( = ?auto_166985 ?auto_166986 ) ) ( not ( = ?auto_166985 ?auto_166987 ) ) ( not ( = ?auto_166985 ?auto_166988 ) ) ( not ( = ?auto_166985 ?auto_166989 ) ) ( not ( = ?auto_166986 ?auto_166987 ) ) ( not ( = ?auto_166986 ?auto_166988 ) ) ( not ( = ?auto_166986 ?auto_166989 ) ) ( not ( = ?auto_166987 ?auto_166988 ) ) ( not ( = ?auto_166987 ?auto_166989 ) ) ( not ( = ?auto_166988 ?auto_166989 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166988 ?auto_166989 )
      ( !STACK ?auto_166988 ?auto_166987 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_166996 - BLOCK
      ?auto_166997 - BLOCK
      ?auto_166998 - BLOCK
      ?auto_166999 - BLOCK
      ?auto_167000 - BLOCK
      ?auto_167001 - BLOCK
    )
    :vars
    (
      ?auto_167002 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167001 ?auto_167002 ) ( ON-TABLE ?auto_166996 ) ( ON ?auto_166997 ?auto_166996 ) ( ON ?auto_166998 ?auto_166997 ) ( ON ?auto_166999 ?auto_166998 ) ( not ( = ?auto_166996 ?auto_166997 ) ) ( not ( = ?auto_166996 ?auto_166998 ) ) ( not ( = ?auto_166996 ?auto_166999 ) ) ( not ( = ?auto_166996 ?auto_167000 ) ) ( not ( = ?auto_166996 ?auto_167001 ) ) ( not ( = ?auto_166996 ?auto_167002 ) ) ( not ( = ?auto_166997 ?auto_166998 ) ) ( not ( = ?auto_166997 ?auto_166999 ) ) ( not ( = ?auto_166997 ?auto_167000 ) ) ( not ( = ?auto_166997 ?auto_167001 ) ) ( not ( = ?auto_166997 ?auto_167002 ) ) ( not ( = ?auto_166998 ?auto_166999 ) ) ( not ( = ?auto_166998 ?auto_167000 ) ) ( not ( = ?auto_166998 ?auto_167001 ) ) ( not ( = ?auto_166998 ?auto_167002 ) ) ( not ( = ?auto_166999 ?auto_167000 ) ) ( not ( = ?auto_166999 ?auto_167001 ) ) ( not ( = ?auto_166999 ?auto_167002 ) ) ( not ( = ?auto_167000 ?auto_167001 ) ) ( not ( = ?auto_167000 ?auto_167002 ) ) ( not ( = ?auto_167001 ?auto_167002 ) ) ( CLEAR ?auto_166999 ) ( ON ?auto_167000 ?auto_167001 ) ( CLEAR ?auto_167000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_166996 ?auto_166997 ?auto_166998 ?auto_166999 ?auto_167000 )
      ( MAKE-6PILE ?auto_166996 ?auto_166997 ?auto_166998 ?auto_166999 ?auto_167000 ?auto_167001 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167009 - BLOCK
      ?auto_167010 - BLOCK
      ?auto_167011 - BLOCK
      ?auto_167012 - BLOCK
      ?auto_167013 - BLOCK
      ?auto_167014 - BLOCK
    )
    :vars
    (
      ?auto_167015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167014 ?auto_167015 ) ( ON-TABLE ?auto_167009 ) ( ON ?auto_167010 ?auto_167009 ) ( ON ?auto_167011 ?auto_167010 ) ( ON ?auto_167012 ?auto_167011 ) ( not ( = ?auto_167009 ?auto_167010 ) ) ( not ( = ?auto_167009 ?auto_167011 ) ) ( not ( = ?auto_167009 ?auto_167012 ) ) ( not ( = ?auto_167009 ?auto_167013 ) ) ( not ( = ?auto_167009 ?auto_167014 ) ) ( not ( = ?auto_167009 ?auto_167015 ) ) ( not ( = ?auto_167010 ?auto_167011 ) ) ( not ( = ?auto_167010 ?auto_167012 ) ) ( not ( = ?auto_167010 ?auto_167013 ) ) ( not ( = ?auto_167010 ?auto_167014 ) ) ( not ( = ?auto_167010 ?auto_167015 ) ) ( not ( = ?auto_167011 ?auto_167012 ) ) ( not ( = ?auto_167011 ?auto_167013 ) ) ( not ( = ?auto_167011 ?auto_167014 ) ) ( not ( = ?auto_167011 ?auto_167015 ) ) ( not ( = ?auto_167012 ?auto_167013 ) ) ( not ( = ?auto_167012 ?auto_167014 ) ) ( not ( = ?auto_167012 ?auto_167015 ) ) ( not ( = ?auto_167013 ?auto_167014 ) ) ( not ( = ?auto_167013 ?auto_167015 ) ) ( not ( = ?auto_167014 ?auto_167015 ) ) ( CLEAR ?auto_167012 ) ( ON ?auto_167013 ?auto_167014 ) ( CLEAR ?auto_167013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167009 ?auto_167010 ?auto_167011 ?auto_167012 ?auto_167013 )
      ( MAKE-6PILE ?auto_167009 ?auto_167010 ?auto_167011 ?auto_167012 ?auto_167013 ?auto_167014 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167022 - BLOCK
      ?auto_167023 - BLOCK
      ?auto_167024 - BLOCK
      ?auto_167025 - BLOCK
      ?auto_167026 - BLOCK
      ?auto_167027 - BLOCK
    )
    :vars
    (
      ?auto_167028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167027 ?auto_167028 ) ( ON-TABLE ?auto_167022 ) ( ON ?auto_167023 ?auto_167022 ) ( ON ?auto_167024 ?auto_167023 ) ( not ( = ?auto_167022 ?auto_167023 ) ) ( not ( = ?auto_167022 ?auto_167024 ) ) ( not ( = ?auto_167022 ?auto_167025 ) ) ( not ( = ?auto_167022 ?auto_167026 ) ) ( not ( = ?auto_167022 ?auto_167027 ) ) ( not ( = ?auto_167022 ?auto_167028 ) ) ( not ( = ?auto_167023 ?auto_167024 ) ) ( not ( = ?auto_167023 ?auto_167025 ) ) ( not ( = ?auto_167023 ?auto_167026 ) ) ( not ( = ?auto_167023 ?auto_167027 ) ) ( not ( = ?auto_167023 ?auto_167028 ) ) ( not ( = ?auto_167024 ?auto_167025 ) ) ( not ( = ?auto_167024 ?auto_167026 ) ) ( not ( = ?auto_167024 ?auto_167027 ) ) ( not ( = ?auto_167024 ?auto_167028 ) ) ( not ( = ?auto_167025 ?auto_167026 ) ) ( not ( = ?auto_167025 ?auto_167027 ) ) ( not ( = ?auto_167025 ?auto_167028 ) ) ( not ( = ?auto_167026 ?auto_167027 ) ) ( not ( = ?auto_167026 ?auto_167028 ) ) ( not ( = ?auto_167027 ?auto_167028 ) ) ( ON ?auto_167026 ?auto_167027 ) ( CLEAR ?auto_167024 ) ( ON ?auto_167025 ?auto_167026 ) ( CLEAR ?auto_167025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167022 ?auto_167023 ?auto_167024 ?auto_167025 )
      ( MAKE-6PILE ?auto_167022 ?auto_167023 ?auto_167024 ?auto_167025 ?auto_167026 ?auto_167027 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167035 - BLOCK
      ?auto_167036 - BLOCK
      ?auto_167037 - BLOCK
      ?auto_167038 - BLOCK
      ?auto_167039 - BLOCK
      ?auto_167040 - BLOCK
    )
    :vars
    (
      ?auto_167041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167040 ?auto_167041 ) ( ON-TABLE ?auto_167035 ) ( ON ?auto_167036 ?auto_167035 ) ( ON ?auto_167037 ?auto_167036 ) ( not ( = ?auto_167035 ?auto_167036 ) ) ( not ( = ?auto_167035 ?auto_167037 ) ) ( not ( = ?auto_167035 ?auto_167038 ) ) ( not ( = ?auto_167035 ?auto_167039 ) ) ( not ( = ?auto_167035 ?auto_167040 ) ) ( not ( = ?auto_167035 ?auto_167041 ) ) ( not ( = ?auto_167036 ?auto_167037 ) ) ( not ( = ?auto_167036 ?auto_167038 ) ) ( not ( = ?auto_167036 ?auto_167039 ) ) ( not ( = ?auto_167036 ?auto_167040 ) ) ( not ( = ?auto_167036 ?auto_167041 ) ) ( not ( = ?auto_167037 ?auto_167038 ) ) ( not ( = ?auto_167037 ?auto_167039 ) ) ( not ( = ?auto_167037 ?auto_167040 ) ) ( not ( = ?auto_167037 ?auto_167041 ) ) ( not ( = ?auto_167038 ?auto_167039 ) ) ( not ( = ?auto_167038 ?auto_167040 ) ) ( not ( = ?auto_167038 ?auto_167041 ) ) ( not ( = ?auto_167039 ?auto_167040 ) ) ( not ( = ?auto_167039 ?auto_167041 ) ) ( not ( = ?auto_167040 ?auto_167041 ) ) ( ON ?auto_167039 ?auto_167040 ) ( CLEAR ?auto_167037 ) ( ON ?auto_167038 ?auto_167039 ) ( CLEAR ?auto_167038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167035 ?auto_167036 ?auto_167037 ?auto_167038 )
      ( MAKE-6PILE ?auto_167035 ?auto_167036 ?auto_167037 ?auto_167038 ?auto_167039 ?auto_167040 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167048 - BLOCK
      ?auto_167049 - BLOCK
      ?auto_167050 - BLOCK
      ?auto_167051 - BLOCK
      ?auto_167052 - BLOCK
      ?auto_167053 - BLOCK
    )
    :vars
    (
      ?auto_167054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167053 ?auto_167054 ) ( ON-TABLE ?auto_167048 ) ( ON ?auto_167049 ?auto_167048 ) ( not ( = ?auto_167048 ?auto_167049 ) ) ( not ( = ?auto_167048 ?auto_167050 ) ) ( not ( = ?auto_167048 ?auto_167051 ) ) ( not ( = ?auto_167048 ?auto_167052 ) ) ( not ( = ?auto_167048 ?auto_167053 ) ) ( not ( = ?auto_167048 ?auto_167054 ) ) ( not ( = ?auto_167049 ?auto_167050 ) ) ( not ( = ?auto_167049 ?auto_167051 ) ) ( not ( = ?auto_167049 ?auto_167052 ) ) ( not ( = ?auto_167049 ?auto_167053 ) ) ( not ( = ?auto_167049 ?auto_167054 ) ) ( not ( = ?auto_167050 ?auto_167051 ) ) ( not ( = ?auto_167050 ?auto_167052 ) ) ( not ( = ?auto_167050 ?auto_167053 ) ) ( not ( = ?auto_167050 ?auto_167054 ) ) ( not ( = ?auto_167051 ?auto_167052 ) ) ( not ( = ?auto_167051 ?auto_167053 ) ) ( not ( = ?auto_167051 ?auto_167054 ) ) ( not ( = ?auto_167052 ?auto_167053 ) ) ( not ( = ?auto_167052 ?auto_167054 ) ) ( not ( = ?auto_167053 ?auto_167054 ) ) ( ON ?auto_167052 ?auto_167053 ) ( ON ?auto_167051 ?auto_167052 ) ( CLEAR ?auto_167049 ) ( ON ?auto_167050 ?auto_167051 ) ( CLEAR ?auto_167050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167048 ?auto_167049 ?auto_167050 )
      ( MAKE-6PILE ?auto_167048 ?auto_167049 ?auto_167050 ?auto_167051 ?auto_167052 ?auto_167053 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167061 - BLOCK
      ?auto_167062 - BLOCK
      ?auto_167063 - BLOCK
      ?auto_167064 - BLOCK
      ?auto_167065 - BLOCK
      ?auto_167066 - BLOCK
    )
    :vars
    (
      ?auto_167067 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167066 ?auto_167067 ) ( ON-TABLE ?auto_167061 ) ( ON ?auto_167062 ?auto_167061 ) ( not ( = ?auto_167061 ?auto_167062 ) ) ( not ( = ?auto_167061 ?auto_167063 ) ) ( not ( = ?auto_167061 ?auto_167064 ) ) ( not ( = ?auto_167061 ?auto_167065 ) ) ( not ( = ?auto_167061 ?auto_167066 ) ) ( not ( = ?auto_167061 ?auto_167067 ) ) ( not ( = ?auto_167062 ?auto_167063 ) ) ( not ( = ?auto_167062 ?auto_167064 ) ) ( not ( = ?auto_167062 ?auto_167065 ) ) ( not ( = ?auto_167062 ?auto_167066 ) ) ( not ( = ?auto_167062 ?auto_167067 ) ) ( not ( = ?auto_167063 ?auto_167064 ) ) ( not ( = ?auto_167063 ?auto_167065 ) ) ( not ( = ?auto_167063 ?auto_167066 ) ) ( not ( = ?auto_167063 ?auto_167067 ) ) ( not ( = ?auto_167064 ?auto_167065 ) ) ( not ( = ?auto_167064 ?auto_167066 ) ) ( not ( = ?auto_167064 ?auto_167067 ) ) ( not ( = ?auto_167065 ?auto_167066 ) ) ( not ( = ?auto_167065 ?auto_167067 ) ) ( not ( = ?auto_167066 ?auto_167067 ) ) ( ON ?auto_167065 ?auto_167066 ) ( ON ?auto_167064 ?auto_167065 ) ( CLEAR ?auto_167062 ) ( ON ?auto_167063 ?auto_167064 ) ( CLEAR ?auto_167063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167061 ?auto_167062 ?auto_167063 )
      ( MAKE-6PILE ?auto_167061 ?auto_167062 ?auto_167063 ?auto_167064 ?auto_167065 ?auto_167066 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167074 - BLOCK
      ?auto_167075 - BLOCK
      ?auto_167076 - BLOCK
      ?auto_167077 - BLOCK
      ?auto_167078 - BLOCK
      ?auto_167079 - BLOCK
    )
    :vars
    (
      ?auto_167080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167079 ?auto_167080 ) ( ON-TABLE ?auto_167074 ) ( not ( = ?auto_167074 ?auto_167075 ) ) ( not ( = ?auto_167074 ?auto_167076 ) ) ( not ( = ?auto_167074 ?auto_167077 ) ) ( not ( = ?auto_167074 ?auto_167078 ) ) ( not ( = ?auto_167074 ?auto_167079 ) ) ( not ( = ?auto_167074 ?auto_167080 ) ) ( not ( = ?auto_167075 ?auto_167076 ) ) ( not ( = ?auto_167075 ?auto_167077 ) ) ( not ( = ?auto_167075 ?auto_167078 ) ) ( not ( = ?auto_167075 ?auto_167079 ) ) ( not ( = ?auto_167075 ?auto_167080 ) ) ( not ( = ?auto_167076 ?auto_167077 ) ) ( not ( = ?auto_167076 ?auto_167078 ) ) ( not ( = ?auto_167076 ?auto_167079 ) ) ( not ( = ?auto_167076 ?auto_167080 ) ) ( not ( = ?auto_167077 ?auto_167078 ) ) ( not ( = ?auto_167077 ?auto_167079 ) ) ( not ( = ?auto_167077 ?auto_167080 ) ) ( not ( = ?auto_167078 ?auto_167079 ) ) ( not ( = ?auto_167078 ?auto_167080 ) ) ( not ( = ?auto_167079 ?auto_167080 ) ) ( ON ?auto_167078 ?auto_167079 ) ( ON ?auto_167077 ?auto_167078 ) ( ON ?auto_167076 ?auto_167077 ) ( CLEAR ?auto_167074 ) ( ON ?auto_167075 ?auto_167076 ) ( CLEAR ?auto_167075 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167074 ?auto_167075 )
      ( MAKE-6PILE ?auto_167074 ?auto_167075 ?auto_167076 ?auto_167077 ?auto_167078 ?auto_167079 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167087 - BLOCK
      ?auto_167088 - BLOCK
      ?auto_167089 - BLOCK
      ?auto_167090 - BLOCK
      ?auto_167091 - BLOCK
      ?auto_167092 - BLOCK
    )
    :vars
    (
      ?auto_167093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167092 ?auto_167093 ) ( ON-TABLE ?auto_167087 ) ( not ( = ?auto_167087 ?auto_167088 ) ) ( not ( = ?auto_167087 ?auto_167089 ) ) ( not ( = ?auto_167087 ?auto_167090 ) ) ( not ( = ?auto_167087 ?auto_167091 ) ) ( not ( = ?auto_167087 ?auto_167092 ) ) ( not ( = ?auto_167087 ?auto_167093 ) ) ( not ( = ?auto_167088 ?auto_167089 ) ) ( not ( = ?auto_167088 ?auto_167090 ) ) ( not ( = ?auto_167088 ?auto_167091 ) ) ( not ( = ?auto_167088 ?auto_167092 ) ) ( not ( = ?auto_167088 ?auto_167093 ) ) ( not ( = ?auto_167089 ?auto_167090 ) ) ( not ( = ?auto_167089 ?auto_167091 ) ) ( not ( = ?auto_167089 ?auto_167092 ) ) ( not ( = ?auto_167089 ?auto_167093 ) ) ( not ( = ?auto_167090 ?auto_167091 ) ) ( not ( = ?auto_167090 ?auto_167092 ) ) ( not ( = ?auto_167090 ?auto_167093 ) ) ( not ( = ?auto_167091 ?auto_167092 ) ) ( not ( = ?auto_167091 ?auto_167093 ) ) ( not ( = ?auto_167092 ?auto_167093 ) ) ( ON ?auto_167091 ?auto_167092 ) ( ON ?auto_167090 ?auto_167091 ) ( ON ?auto_167089 ?auto_167090 ) ( CLEAR ?auto_167087 ) ( ON ?auto_167088 ?auto_167089 ) ( CLEAR ?auto_167088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167087 ?auto_167088 )
      ( MAKE-6PILE ?auto_167087 ?auto_167088 ?auto_167089 ?auto_167090 ?auto_167091 ?auto_167092 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167100 - BLOCK
      ?auto_167101 - BLOCK
      ?auto_167102 - BLOCK
      ?auto_167103 - BLOCK
      ?auto_167104 - BLOCK
      ?auto_167105 - BLOCK
    )
    :vars
    (
      ?auto_167106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167105 ?auto_167106 ) ( not ( = ?auto_167100 ?auto_167101 ) ) ( not ( = ?auto_167100 ?auto_167102 ) ) ( not ( = ?auto_167100 ?auto_167103 ) ) ( not ( = ?auto_167100 ?auto_167104 ) ) ( not ( = ?auto_167100 ?auto_167105 ) ) ( not ( = ?auto_167100 ?auto_167106 ) ) ( not ( = ?auto_167101 ?auto_167102 ) ) ( not ( = ?auto_167101 ?auto_167103 ) ) ( not ( = ?auto_167101 ?auto_167104 ) ) ( not ( = ?auto_167101 ?auto_167105 ) ) ( not ( = ?auto_167101 ?auto_167106 ) ) ( not ( = ?auto_167102 ?auto_167103 ) ) ( not ( = ?auto_167102 ?auto_167104 ) ) ( not ( = ?auto_167102 ?auto_167105 ) ) ( not ( = ?auto_167102 ?auto_167106 ) ) ( not ( = ?auto_167103 ?auto_167104 ) ) ( not ( = ?auto_167103 ?auto_167105 ) ) ( not ( = ?auto_167103 ?auto_167106 ) ) ( not ( = ?auto_167104 ?auto_167105 ) ) ( not ( = ?auto_167104 ?auto_167106 ) ) ( not ( = ?auto_167105 ?auto_167106 ) ) ( ON ?auto_167104 ?auto_167105 ) ( ON ?auto_167103 ?auto_167104 ) ( ON ?auto_167102 ?auto_167103 ) ( ON ?auto_167101 ?auto_167102 ) ( ON ?auto_167100 ?auto_167101 ) ( CLEAR ?auto_167100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167100 )
      ( MAKE-6PILE ?auto_167100 ?auto_167101 ?auto_167102 ?auto_167103 ?auto_167104 ?auto_167105 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_167113 - BLOCK
      ?auto_167114 - BLOCK
      ?auto_167115 - BLOCK
      ?auto_167116 - BLOCK
      ?auto_167117 - BLOCK
      ?auto_167118 - BLOCK
    )
    :vars
    (
      ?auto_167119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167118 ?auto_167119 ) ( not ( = ?auto_167113 ?auto_167114 ) ) ( not ( = ?auto_167113 ?auto_167115 ) ) ( not ( = ?auto_167113 ?auto_167116 ) ) ( not ( = ?auto_167113 ?auto_167117 ) ) ( not ( = ?auto_167113 ?auto_167118 ) ) ( not ( = ?auto_167113 ?auto_167119 ) ) ( not ( = ?auto_167114 ?auto_167115 ) ) ( not ( = ?auto_167114 ?auto_167116 ) ) ( not ( = ?auto_167114 ?auto_167117 ) ) ( not ( = ?auto_167114 ?auto_167118 ) ) ( not ( = ?auto_167114 ?auto_167119 ) ) ( not ( = ?auto_167115 ?auto_167116 ) ) ( not ( = ?auto_167115 ?auto_167117 ) ) ( not ( = ?auto_167115 ?auto_167118 ) ) ( not ( = ?auto_167115 ?auto_167119 ) ) ( not ( = ?auto_167116 ?auto_167117 ) ) ( not ( = ?auto_167116 ?auto_167118 ) ) ( not ( = ?auto_167116 ?auto_167119 ) ) ( not ( = ?auto_167117 ?auto_167118 ) ) ( not ( = ?auto_167117 ?auto_167119 ) ) ( not ( = ?auto_167118 ?auto_167119 ) ) ( ON ?auto_167117 ?auto_167118 ) ( ON ?auto_167116 ?auto_167117 ) ( ON ?auto_167115 ?auto_167116 ) ( ON ?auto_167114 ?auto_167115 ) ( ON ?auto_167113 ?auto_167114 ) ( CLEAR ?auto_167113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167113 )
      ( MAKE-6PILE ?auto_167113 ?auto_167114 ?auto_167115 ?auto_167116 ?auto_167117 ?auto_167118 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167127 - BLOCK
      ?auto_167128 - BLOCK
      ?auto_167129 - BLOCK
      ?auto_167130 - BLOCK
      ?auto_167131 - BLOCK
      ?auto_167132 - BLOCK
      ?auto_167133 - BLOCK
    )
    :vars
    (
      ?auto_167134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167132 ) ( ON ?auto_167133 ?auto_167134 ) ( CLEAR ?auto_167133 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167127 ) ( ON ?auto_167128 ?auto_167127 ) ( ON ?auto_167129 ?auto_167128 ) ( ON ?auto_167130 ?auto_167129 ) ( ON ?auto_167131 ?auto_167130 ) ( ON ?auto_167132 ?auto_167131 ) ( not ( = ?auto_167127 ?auto_167128 ) ) ( not ( = ?auto_167127 ?auto_167129 ) ) ( not ( = ?auto_167127 ?auto_167130 ) ) ( not ( = ?auto_167127 ?auto_167131 ) ) ( not ( = ?auto_167127 ?auto_167132 ) ) ( not ( = ?auto_167127 ?auto_167133 ) ) ( not ( = ?auto_167127 ?auto_167134 ) ) ( not ( = ?auto_167128 ?auto_167129 ) ) ( not ( = ?auto_167128 ?auto_167130 ) ) ( not ( = ?auto_167128 ?auto_167131 ) ) ( not ( = ?auto_167128 ?auto_167132 ) ) ( not ( = ?auto_167128 ?auto_167133 ) ) ( not ( = ?auto_167128 ?auto_167134 ) ) ( not ( = ?auto_167129 ?auto_167130 ) ) ( not ( = ?auto_167129 ?auto_167131 ) ) ( not ( = ?auto_167129 ?auto_167132 ) ) ( not ( = ?auto_167129 ?auto_167133 ) ) ( not ( = ?auto_167129 ?auto_167134 ) ) ( not ( = ?auto_167130 ?auto_167131 ) ) ( not ( = ?auto_167130 ?auto_167132 ) ) ( not ( = ?auto_167130 ?auto_167133 ) ) ( not ( = ?auto_167130 ?auto_167134 ) ) ( not ( = ?auto_167131 ?auto_167132 ) ) ( not ( = ?auto_167131 ?auto_167133 ) ) ( not ( = ?auto_167131 ?auto_167134 ) ) ( not ( = ?auto_167132 ?auto_167133 ) ) ( not ( = ?auto_167132 ?auto_167134 ) ) ( not ( = ?auto_167133 ?auto_167134 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167133 ?auto_167134 )
      ( !STACK ?auto_167133 ?auto_167132 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167142 - BLOCK
      ?auto_167143 - BLOCK
      ?auto_167144 - BLOCK
      ?auto_167145 - BLOCK
      ?auto_167146 - BLOCK
      ?auto_167147 - BLOCK
      ?auto_167148 - BLOCK
    )
    :vars
    (
      ?auto_167149 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167147 ) ( ON ?auto_167148 ?auto_167149 ) ( CLEAR ?auto_167148 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167142 ) ( ON ?auto_167143 ?auto_167142 ) ( ON ?auto_167144 ?auto_167143 ) ( ON ?auto_167145 ?auto_167144 ) ( ON ?auto_167146 ?auto_167145 ) ( ON ?auto_167147 ?auto_167146 ) ( not ( = ?auto_167142 ?auto_167143 ) ) ( not ( = ?auto_167142 ?auto_167144 ) ) ( not ( = ?auto_167142 ?auto_167145 ) ) ( not ( = ?auto_167142 ?auto_167146 ) ) ( not ( = ?auto_167142 ?auto_167147 ) ) ( not ( = ?auto_167142 ?auto_167148 ) ) ( not ( = ?auto_167142 ?auto_167149 ) ) ( not ( = ?auto_167143 ?auto_167144 ) ) ( not ( = ?auto_167143 ?auto_167145 ) ) ( not ( = ?auto_167143 ?auto_167146 ) ) ( not ( = ?auto_167143 ?auto_167147 ) ) ( not ( = ?auto_167143 ?auto_167148 ) ) ( not ( = ?auto_167143 ?auto_167149 ) ) ( not ( = ?auto_167144 ?auto_167145 ) ) ( not ( = ?auto_167144 ?auto_167146 ) ) ( not ( = ?auto_167144 ?auto_167147 ) ) ( not ( = ?auto_167144 ?auto_167148 ) ) ( not ( = ?auto_167144 ?auto_167149 ) ) ( not ( = ?auto_167145 ?auto_167146 ) ) ( not ( = ?auto_167145 ?auto_167147 ) ) ( not ( = ?auto_167145 ?auto_167148 ) ) ( not ( = ?auto_167145 ?auto_167149 ) ) ( not ( = ?auto_167146 ?auto_167147 ) ) ( not ( = ?auto_167146 ?auto_167148 ) ) ( not ( = ?auto_167146 ?auto_167149 ) ) ( not ( = ?auto_167147 ?auto_167148 ) ) ( not ( = ?auto_167147 ?auto_167149 ) ) ( not ( = ?auto_167148 ?auto_167149 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167148 ?auto_167149 )
      ( !STACK ?auto_167148 ?auto_167147 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167157 - BLOCK
      ?auto_167158 - BLOCK
      ?auto_167159 - BLOCK
      ?auto_167160 - BLOCK
      ?auto_167161 - BLOCK
      ?auto_167162 - BLOCK
      ?auto_167163 - BLOCK
    )
    :vars
    (
      ?auto_167164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167163 ?auto_167164 ) ( ON-TABLE ?auto_167157 ) ( ON ?auto_167158 ?auto_167157 ) ( ON ?auto_167159 ?auto_167158 ) ( ON ?auto_167160 ?auto_167159 ) ( ON ?auto_167161 ?auto_167160 ) ( not ( = ?auto_167157 ?auto_167158 ) ) ( not ( = ?auto_167157 ?auto_167159 ) ) ( not ( = ?auto_167157 ?auto_167160 ) ) ( not ( = ?auto_167157 ?auto_167161 ) ) ( not ( = ?auto_167157 ?auto_167162 ) ) ( not ( = ?auto_167157 ?auto_167163 ) ) ( not ( = ?auto_167157 ?auto_167164 ) ) ( not ( = ?auto_167158 ?auto_167159 ) ) ( not ( = ?auto_167158 ?auto_167160 ) ) ( not ( = ?auto_167158 ?auto_167161 ) ) ( not ( = ?auto_167158 ?auto_167162 ) ) ( not ( = ?auto_167158 ?auto_167163 ) ) ( not ( = ?auto_167158 ?auto_167164 ) ) ( not ( = ?auto_167159 ?auto_167160 ) ) ( not ( = ?auto_167159 ?auto_167161 ) ) ( not ( = ?auto_167159 ?auto_167162 ) ) ( not ( = ?auto_167159 ?auto_167163 ) ) ( not ( = ?auto_167159 ?auto_167164 ) ) ( not ( = ?auto_167160 ?auto_167161 ) ) ( not ( = ?auto_167160 ?auto_167162 ) ) ( not ( = ?auto_167160 ?auto_167163 ) ) ( not ( = ?auto_167160 ?auto_167164 ) ) ( not ( = ?auto_167161 ?auto_167162 ) ) ( not ( = ?auto_167161 ?auto_167163 ) ) ( not ( = ?auto_167161 ?auto_167164 ) ) ( not ( = ?auto_167162 ?auto_167163 ) ) ( not ( = ?auto_167162 ?auto_167164 ) ) ( not ( = ?auto_167163 ?auto_167164 ) ) ( CLEAR ?auto_167161 ) ( ON ?auto_167162 ?auto_167163 ) ( CLEAR ?auto_167162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167157 ?auto_167158 ?auto_167159 ?auto_167160 ?auto_167161 ?auto_167162 )
      ( MAKE-7PILE ?auto_167157 ?auto_167158 ?auto_167159 ?auto_167160 ?auto_167161 ?auto_167162 ?auto_167163 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167172 - BLOCK
      ?auto_167173 - BLOCK
      ?auto_167174 - BLOCK
      ?auto_167175 - BLOCK
      ?auto_167176 - BLOCK
      ?auto_167177 - BLOCK
      ?auto_167178 - BLOCK
    )
    :vars
    (
      ?auto_167179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167178 ?auto_167179 ) ( ON-TABLE ?auto_167172 ) ( ON ?auto_167173 ?auto_167172 ) ( ON ?auto_167174 ?auto_167173 ) ( ON ?auto_167175 ?auto_167174 ) ( ON ?auto_167176 ?auto_167175 ) ( not ( = ?auto_167172 ?auto_167173 ) ) ( not ( = ?auto_167172 ?auto_167174 ) ) ( not ( = ?auto_167172 ?auto_167175 ) ) ( not ( = ?auto_167172 ?auto_167176 ) ) ( not ( = ?auto_167172 ?auto_167177 ) ) ( not ( = ?auto_167172 ?auto_167178 ) ) ( not ( = ?auto_167172 ?auto_167179 ) ) ( not ( = ?auto_167173 ?auto_167174 ) ) ( not ( = ?auto_167173 ?auto_167175 ) ) ( not ( = ?auto_167173 ?auto_167176 ) ) ( not ( = ?auto_167173 ?auto_167177 ) ) ( not ( = ?auto_167173 ?auto_167178 ) ) ( not ( = ?auto_167173 ?auto_167179 ) ) ( not ( = ?auto_167174 ?auto_167175 ) ) ( not ( = ?auto_167174 ?auto_167176 ) ) ( not ( = ?auto_167174 ?auto_167177 ) ) ( not ( = ?auto_167174 ?auto_167178 ) ) ( not ( = ?auto_167174 ?auto_167179 ) ) ( not ( = ?auto_167175 ?auto_167176 ) ) ( not ( = ?auto_167175 ?auto_167177 ) ) ( not ( = ?auto_167175 ?auto_167178 ) ) ( not ( = ?auto_167175 ?auto_167179 ) ) ( not ( = ?auto_167176 ?auto_167177 ) ) ( not ( = ?auto_167176 ?auto_167178 ) ) ( not ( = ?auto_167176 ?auto_167179 ) ) ( not ( = ?auto_167177 ?auto_167178 ) ) ( not ( = ?auto_167177 ?auto_167179 ) ) ( not ( = ?auto_167178 ?auto_167179 ) ) ( CLEAR ?auto_167176 ) ( ON ?auto_167177 ?auto_167178 ) ( CLEAR ?auto_167177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167172 ?auto_167173 ?auto_167174 ?auto_167175 ?auto_167176 ?auto_167177 )
      ( MAKE-7PILE ?auto_167172 ?auto_167173 ?auto_167174 ?auto_167175 ?auto_167176 ?auto_167177 ?auto_167178 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167187 - BLOCK
      ?auto_167188 - BLOCK
      ?auto_167189 - BLOCK
      ?auto_167190 - BLOCK
      ?auto_167191 - BLOCK
      ?auto_167192 - BLOCK
      ?auto_167193 - BLOCK
    )
    :vars
    (
      ?auto_167194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167193 ?auto_167194 ) ( ON-TABLE ?auto_167187 ) ( ON ?auto_167188 ?auto_167187 ) ( ON ?auto_167189 ?auto_167188 ) ( ON ?auto_167190 ?auto_167189 ) ( not ( = ?auto_167187 ?auto_167188 ) ) ( not ( = ?auto_167187 ?auto_167189 ) ) ( not ( = ?auto_167187 ?auto_167190 ) ) ( not ( = ?auto_167187 ?auto_167191 ) ) ( not ( = ?auto_167187 ?auto_167192 ) ) ( not ( = ?auto_167187 ?auto_167193 ) ) ( not ( = ?auto_167187 ?auto_167194 ) ) ( not ( = ?auto_167188 ?auto_167189 ) ) ( not ( = ?auto_167188 ?auto_167190 ) ) ( not ( = ?auto_167188 ?auto_167191 ) ) ( not ( = ?auto_167188 ?auto_167192 ) ) ( not ( = ?auto_167188 ?auto_167193 ) ) ( not ( = ?auto_167188 ?auto_167194 ) ) ( not ( = ?auto_167189 ?auto_167190 ) ) ( not ( = ?auto_167189 ?auto_167191 ) ) ( not ( = ?auto_167189 ?auto_167192 ) ) ( not ( = ?auto_167189 ?auto_167193 ) ) ( not ( = ?auto_167189 ?auto_167194 ) ) ( not ( = ?auto_167190 ?auto_167191 ) ) ( not ( = ?auto_167190 ?auto_167192 ) ) ( not ( = ?auto_167190 ?auto_167193 ) ) ( not ( = ?auto_167190 ?auto_167194 ) ) ( not ( = ?auto_167191 ?auto_167192 ) ) ( not ( = ?auto_167191 ?auto_167193 ) ) ( not ( = ?auto_167191 ?auto_167194 ) ) ( not ( = ?auto_167192 ?auto_167193 ) ) ( not ( = ?auto_167192 ?auto_167194 ) ) ( not ( = ?auto_167193 ?auto_167194 ) ) ( ON ?auto_167192 ?auto_167193 ) ( CLEAR ?auto_167190 ) ( ON ?auto_167191 ?auto_167192 ) ( CLEAR ?auto_167191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167187 ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 )
      ( MAKE-7PILE ?auto_167187 ?auto_167188 ?auto_167189 ?auto_167190 ?auto_167191 ?auto_167192 ?auto_167193 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167202 - BLOCK
      ?auto_167203 - BLOCK
      ?auto_167204 - BLOCK
      ?auto_167205 - BLOCK
      ?auto_167206 - BLOCK
      ?auto_167207 - BLOCK
      ?auto_167208 - BLOCK
    )
    :vars
    (
      ?auto_167209 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167208 ?auto_167209 ) ( ON-TABLE ?auto_167202 ) ( ON ?auto_167203 ?auto_167202 ) ( ON ?auto_167204 ?auto_167203 ) ( ON ?auto_167205 ?auto_167204 ) ( not ( = ?auto_167202 ?auto_167203 ) ) ( not ( = ?auto_167202 ?auto_167204 ) ) ( not ( = ?auto_167202 ?auto_167205 ) ) ( not ( = ?auto_167202 ?auto_167206 ) ) ( not ( = ?auto_167202 ?auto_167207 ) ) ( not ( = ?auto_167202 ?auto_167208 ) ) ( not ( = ?auto_167202 ?auto_167209 ) ) ( not ( = ?auto_167203 ?auto_167204 ) ) ( not ( = ?auto_167203 ?auto_167205 ) ) ( not ( = ?auto_167203 ?auto_167206 ) ) ( not ( = ?auto_167203 ?auto_167207 ) ) ( not ( = ?auto_167203 ?auto_167208 ) ) ( not ( = ?auto_167203 ?auto_167209 ) ) ( not ( = ?auto_167204 ?auto_167205 ) ) ( not ( = ?auto_167204 ?auto_167206 ) ) ( not ( = ?auto_167204 ?auto_167207 ) ) ( not ( = ?auto_167204 ?auto_167208 ) ) ( not ( = ?auto_167204 ?auto_167209 ) ) ( not ( = ?auto_167205 ?auto_167206 ) ) ( not ( = ?auto_167205 ?auto_167207 ) ) ( not ( = ?auto_167205 ?auto_167208 ) ) ( not ( = ?auto_167205 ?auto_167209 ) ) ( not ( = ?auto_167206 ?auto_167207 ) ) ( not ( = ?auto_167206 ?auto_167208 ) ) ( not ( = ?auto_167206 ?auto_167209 ) ) ( not ( = ?auto_167207 ?auto_167208 ) ) ( not ( = ?auto_167207 ?auto_167209 ) ) ( not ( = ?auto_167208 ?auto_167209 ) ) ( ON ?auto_167207 ?auto_167208 ) ( CLEAR ?auto_167205 ) ( ON ?auto_167206 ?auto_167207 ) ( CLEAR ?auto_167206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167202 ?auto_167203 ?auto_167204 ?auto_167205 ?auto_167206 )
      ( MAKE-7PILE ?auto_167202 ?auto_167203 ?auto_167204 ?auto_167205 ?auto_167206 ?auto_167207 ?auto_167208 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167217 - BLOCK
      ?auto_167218 - BLOCK
      ?auto_167219 - BLOCK
      ?auto_167220 - BLOCK
      ?auto_167221 - BLOCK
      ?auto_167222 - BLOCK
      ?auto_167223 - BLOCK
    )
    :vars
    (
      ?auto_167224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167223 ?auto_167224 ) ( ON-TABLE ?auto_167217 ) ( ON ?auto_167218 ?auto_167217 ) ( ON ?auto_167219 ?auto_167218 ) ( not ( = ?auto_167217 ?auto_167218 ) ) ( not ( = ?auto_167217 ?auto_167219 ) ) ( not ( = ?auto_167217 ?auto_167220 ) ) ( not ( = ?auto_167217 ?auto_167221 ) ) ( not ( = ?auto_167217 ?auto_167222 ) ) ( not ( = ?auto_167217 ?auto_167223 ) ) ( not ( = ?auto_167217 ?auto_167224 ) ) ( not ( = ?auto_167218 ?auto_167219 ) ) ( not ( = ?auto_167218 ?auto_167220 ) ) ( not ( = ?auto_167218 ?auto_167221 ) ) ( not ( = ?auto_167218 ?auto_167222 ) ) ( not ( = ?auto_167218 ?auto_167223 ) ) ( not ( = ?auto_167218 ?auto_167224 ) ) ( not ( = ?auto_167219 ?auto_167220 ) ) ( not ( = ?auto_167219 ?auto_167221 ) ) ( not ( = ?auto_167219 ?auto_167222 ) ) ( not ( = ?auto_167219 ?auto_167223 ) ) ( not ( = ?auto_167219 ?auto_167224 ) ) ( not ( = ?auto_167220 ?auto_167221 ) ) ( not ( = ?auto_167220 ?auto_167222 ) ) ( not ( = ?auto_167220 ?auto_167223 ) ) ( not ( = ?auto_167220 ?auto_167224 ) ) ( not ( = ?auto_167221 ?auto_167222 ) ) ( not ( = ?auto_167221 ?auto_167223 ) ) ( not ( = ?auto_167221 ?auto_167224 ) ) ( not ( = ?auto_167222 ?auto_167223 ) ) ( not ( = ?auto_167222 ?auto_167224 ) ) ( not ( = ?auto_167223 ?auto_167224 ) ) ( ON ?auto_167222 ?auto_167223 ) ( ON ?auto_167221 ?auto_167222 ) ( CLEAR ?auto_167219 ) ( ON ?auto_167220 ?auto_167221 ) ( CLEAR ?auto_167220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167217 ?auto_167218 ?auto_167219 ?auto_167220 )
      ( MAKE-7PILE ?auto_167217 ?auto_167218 ?auto_167219 ?auto_167220 ?auto_167221 ?auto_167222 ?auto_167223 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167232 - BLOCK
      ?auto_167233 - BLOCK
      ?auto_167234 - BLOCK
      ?auto_167235 - BLOCK
      ?auto_167236 - BLOCK
      ?auto_167237 - BLOCK
      ?auto_167238 - BLOCK
    )
    :vars
    (
      ?auto_167239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167238 ?auto_167239 ) ( ON-TABLE ?auto_167232 ) ( ON ?auto_167233 ?auto_167232 ) ( ON ?auto_167234 ?auto_167233 ) ( not ( = ?auto_167232 ?auto_167233 ) ) ( not ( = ?auto_167232 ?auto_167234 ) ) ( not ( = ?auto_167232 ?auto_167235 ) ) ( not ( = ?auto_167232 ?auto_167236 ) ) ( not ( = ?auto_167232 ?auto_167237 ) ) ( not ( = ?auto_167232 ?auto_167238 ) ) ( not ( = ?auto_167232 ?auto_167239 ) ) ( not ( = ?auto_167233 ?auto_167234 ) ) ( not ( = ?auto_167233 ?auto_167235 ) ) ( not ( = ?auto_167233 ?auto_167236 ) ) ( not ( = ?auto_167233 ?auto_167237 ) ) ( not ( = ?auto_167233 ?auto_167238 ) ) ( not ( = ?auto_167233 ?auto_167239 ) ) ( not ( = ?auto_167234 ?auto_167235 ) ) ( not ( = ?auto_167234 ?auto_167236 ) ) ( not ( = ?auto_167234 ?auto_167237 ) ) ( not ( = ?auto_167234 ?auto_167238 ) ) ( not ( = ?auto_167234 ?auto_167239 ) ) ( not ( = ?auto_167235 ?auto_167236 ) ) ( not ( = ?auto_167235 ?auto_167237 ) ) ( not ( = ?auto_167235 ?auto_167238 ) ) ( not ( = ?auto_167235 ?auto_167239 ) ) ( not ( = ?auto_167236 ?auto_167237 ) ) ( not ( = ?auto_167236 ?auto_167238 ) ) ( not ( = ?auto_167236 ?auto_167239 ) ) ( not ( = ?auto_167237 ?auto_167238 ) ) ( not ( = ?auto_167237 ?auto_167239 ) ) ( not ( = ?auto_167238 ?auto_167239 ) ) ( ON ?auto_167237 ?auto_167238 ) ( ON ?auto_167236 ?auto_167237 ) ( CLEAR ?auto_167234 ) ( ON ?auto_167235 ?auto_167236 ) ( CLEAR ?auto_167235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167232 ?auto_167233 ?auto_167234 ?auto_167235 )
      ( MAKE-7PILE ?auto_167232 ?auto_167233 ?auto_167234 ?auto_167235 ?auto_167236 ?auto_167237 ?auto_167238 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167247 - BLOCK
      ?auto_167248 - BLOCK
      ?auto_167249 - BLOCK
      ?auto_167250 - BLOCK
      ?auto_167251 - BLOCK
      ?auto_167252 - BLOCK
      ?auto_167253 - BLOCK
    )
    :vars
    (
      ?auto_167254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167253 ?auto_167254 ) ( ON-TABLE ?auto_167247 ) ( ON ?auto_167248 ?auto_167247 ) ( not ( = ?auto_167247 ?auto_167248 ) ) ( not ( = ?auto_167247 ?auto_167249 ) ) ( not ( = ?auto_167247 ?auto_167250 ) ) ( not ( = ?auto_167247 ?auto_167251 ) ) ( not ( = ?auto_167247 ?auto_167252 ) ) ( not ( = ?auto_167247 ?auto_167253 ) ) ( not ( = ?auto_167247 ?auto_167254 ) ) ( not ( = ?auto_167248 ?auto_167249 ) ) ( not ( = ?auto_167248 ?auto_167250 ) ) ( not ( = ?auto_167248 ?auto_167251 ) ) ( not ( = ?auto_167248 ?auto_167252 ) ) ( not ( = ?auto_167248 ?auto_167253 ) ) ( not ( = ?auto_167248 ?auto_167254 ) ) ( not ( = ?auto_167249 ?auto_167250 ) ) ( not ( = ?auto_167249 ?auto_167251 ) ) ( not ( = ?auto_167249 ?auto_167252 ) ) ( not ( = ?auto_167249 ?auto_167253 ) ) ( not ( = ?auto_167249 ?auto_167254 ) ) ( not ( = ?auto_167250 ?auto_167251 ) ) ( not ( = ?auto_167250 ?auto_167252 ) ) ( not ( = ?auto_167250 ?auto_167253 ) ) ( not ( = ?auto_167250 ?auto_167254 ) ) ( not ( = ?auto_167251 ?auto_167252 ) ) ( not ( = ?auto_167251 ?auto_167253 ) ) ( not ( = ?auto_167251 ?auto_167254 ) ) ( not ( = ?auto_167252 ?auto_167253 ) ) ( not ( = ?auto_167252 ?auto_167254 ) ) ( not ( = ?auto_167253 ?auto_167254 ) ) ( ON ?auto_167252 ?auto_167253 ) ( ON ?auto_167251 ?auto_167252 ) ( ON ?auto_167250 ?auto_167251 ) ( CLEAR ?auto_167248 ) ( ON ?auto_167249 ?auto_167250 ) ( CLEAR ?auto_167249 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167247 ?auto_167248 ?auto_167249 )
      ( MAKE-7PILE ?auto_167247 ?auto_167248 ?auto_167249 ?auto_167250 ?auto_167251 ?auto_167252 ?auto_167253 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167262 - BLOCK
      ?auto_167263 - BLOCK
      ?auto_167264 - BLOCK
      ?auto_167265 - BLOCK
      ?auto_167266 - BLOCK
      ?auto_167267 - BLOCK
      ?auto_167268 - BLOCK
    )
    :vars
    (
      ?auto_167269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167268 ?auto_167269 ) ( ON-TABLE ?auto_167262 ) ( ON ?auto_167263 ?auto_167262 ) ( not ( = ?auto_167262 ?auto_167263 ) ) ( not ( = ?auto_167262 ?auto_167264 ) ) ( not ( = ?auto_167262 ?auto_167265 ) ) ( not ( = ?auto_167262 ?auto_167266 ) ) ( not ( = ?auto_167262 ?auto_167267 ) ) ( not ( = ?auto_167262 ?auto_167268 ) ) ( not ( = ?auto_167262 ?auto_167269 ) ) ( not ( = ?auto_167263 ?auto_167264 ) ) ( not ( = ?auto_167263 ?auto_167265 ) ) ( not ( = ?auto_167263 ?auto_167266 ) ) ( not ( = ?auto_167263 ?auto_167267 ) ) ( not ( = ?auto_167263 ?auto_167268 ) ) ( not ( = ?auto_167263 ?auto_167269 ) ) ( not ( = ?auto_167264 ?auto_167265 ) ) ( not ( = ?auto_167264 ?auto_167266 ) ) ( not ( = ?auto_167264 ?auto_167267 ) ) ( not ( = ?auto_167264 ?auto_167268 ) ) ( not ( = ?auto_167264 ?auto_167269 ) ) ( not ( = ?auto_167265 ?auto_167266 ) ) ( not ( = ?auto_167265 ?auto_167267 ) ) ( not ( = ?auto_167265 ?auto_167268 ) ) ( not ( = ?auto_167265 ?auto_167269 ) ) ( not ( = ?auto_167266 ?auto_167267 ) ) ( not ( = ?auto_167266 ?auto_167268 ) ) ( not ( = ?auto_167266 ?auto_167269 ) ) ( not ( = ?auto_167267 ?auto_167268 ) ) ( not ( = ?auto_167267 ?auto_167269 ) ) ( not ( = ?auto_167268 ?auto_167269 ) ) ( ON ?auto_167267 ?auto_167268 ) ( ON ?auto_167266 ?auto_167267 ) ( ON ?auto_167265 ?auto_167266 ) ( CLEAR ?auto_167263 ) ( ON ?auto_167264 ?auto_167265 ) ( CLEAR ?auto_167264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167262 ?auto_167263 ?auto_167264 )
      ( MAKE-7PILE ?auto_167262 ?auto_167263 ?auto_167264 ?auto_167265 ?auto_167266 ?auto_167267 ?auto_167268 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167277 - BLOCK
      ?auto_167278 - BLOCK
      ?auto_167279 - BLOCK
      ?auto_167280 - BLOCK
      ?auto_167281 - BLOCK
      ?auto_167282 - BLOCK
      ?auto_167283 - BLOCK
    )
    :vars
    (
      ?auto_167284 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167283 ?auto_167284 ) ( ON-TABLE ?auto_167277 ) ( not ( = ?auto_167277 ?auto_167278 ) ) ( not ( = ?auto_167277 ?auto_167279 ) ) ( not ( = ?auto_167277 ?auto_167280 ) ) ( not ( = ?auto_167277 ?auto_167281 ) ) ( not ( = ?auto_167277 ?auto_167282 ) ) ( not ( = ?auto_167277 ?auto_167283 ) ) ( not ( = ?auto_167277 ?auto_167284 ) ) ( not ( = ?auto_167278 ?auto_167279 ) ) ( not ( = ?auto_167278 ?auto_167280 ) ) ( not ( = ?auto_167278 ?auto_167281 ) ) ( not ( = ?auto_167278 ?auto_167282 ) ) ( not ( = ?auto_167278 ?auto_167283 ) ) ( not ( = ?auto_167278 ?auto_167284 ) ) ( not ( = ?auto_167279 ?auto_167280 ) ) ( not ( = ?auto_167279 ?auto_167281 ) ) ( not ( = ?auto_167279 ?auto_167282 ) ) ( not ( = ?auto_167279 ?auto_167283 ) ) ( not ( = ?auto_167279 ?auto_167284 ) ) ( not ( = ?auto_167280 ?auto_167281 ) ) ( not ( = ?auto_167280 ?auto_167282 ) ) ( not ( = ?auto_167280 ?auto_167283 ) ) ( not ( = ?auto_167280 ?auto_167284 ) ) ( not ( = ?auto_167281 ?auto_167282 ) ) ( not ( = ?auto_167281 ?auto_167283 ) ) ( not ( = ?auto_167281 ?auto_167284 ) ) ( not ( = ?auto_167282 ?auto_167283 ) ) ( not ( = ?auto_167282 ?auto_167284 ) ) ( not ( = ?auto_167283 ?auto_167284 ) ) ( ON ?auto_167282 ?auto_167283 ) ( ON ?auto_167281 ?auto_167282 ) ( ON ?auto_167280 ?auto_167281 ) ( ON ?auto_167279 ?auto_167280 ) ( CLEAR ?auto_167277 ) ( ON ?auto_167278 ?auto_167279 ) ( CLEAR ?auto_167278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167277 ?auto_167278 )
      ( MAKE-7PILE ?auto_167277 ?auto_167278 ?auto_167279 ?auto_167280 ?auto_167281 ?auto_167282 ?auto_167283 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167292 - BLOCK
      ?auto_167293 - BLOCK
      ?auto_167294 - BLOCK
      ?auto_167295 - BLOCK
      ?auto_167296 - BLOCK
      ?auto_167297 - BLOCK
      ?auto_167298 - BLOCK
    )
    :vars
    (
      ?auto_167299 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167298 ?auto_167299 ) ( ON-TABLE ?auto_167292 ) ( not ( = ?auto_167292 ?auto_167293 ) ) ( not ( = ?auto_167292 ?auto_167294 ) ) ( not ( = ?auto_167292 ?auto_167295 ) ) ( not ( = ?auto_167292 ?auto_167296 ) ) ( not ( = ?auto_167292 ?auto_167297 ) ) ( not ( = ?auto_167292 ?auto_167298 ) ) ( not ( = ?auto_167292 ?auto_167299 ) ) ( not ( = ?auto_167293 ?auto_167294 ) ) ( not ( = ?auto_167293 ?auto_167295 ) ) ( not ( = ?auto_167293 ?auto_167296 ) ) ( not ( = ?auto_167293 ?auto_167297 ) ) ( not ( = ?auto_167293 ?auto_167298 ) ) ( not ( = ?auto_167293 ?auto_167299 ) ) ( not ( = ?auto_167294 ?auto_167295 ) ) ( not ( = ?auto_167294 ?auto_167296 ) ) ( not ( = ?auto_167294 ?auto_167297 ) ) ( not ( = ?auto_167294 ?auto_167298 ) ) ( not ( = ?auto_167294 ?auto_167299 ) ) ( not ( = ?auto_167295 ?auto_167296 ) ) ( not ( = ?auto_167295 ?auto_167297 ) ) ( not ( = ?auto_167295 ?auto_167298 ) ) ( not ( = ?auto_167295 ?auto_167299 ) ) ( not ( = ?auto_167296 ?auto_167297 ) ) ( not ( = ?auto_167296 ?auto_167298 ) ) ( not ( = ?auto_167296 ?auto_167299 ) ) ( not ( = ?auto_167297 ?auto_167298 ) ) ( not ( = ?auto_167297 ?auto_167299 ) ) ( not ( = ?auto_167298 ?auto_167299 ) ) ( ON ?auto_167297 ?auto_167298 ) ( ON ?auto_167296 ?auto_167297 ) ( ON ?auto_167295 ?auto_167296 ) ( ON ?auto_167294 ?auto_167295 ) ( CLEAR ?auto_167292 ) ( ON ?auto_167293 ?auto_167294 ) ( CLEAR ?auto_167293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167292 ?auto_167293 )
      ( MAKE-7PILE ?auto_167292 ?auto_167293 ?auto_167294 ?auto_167295 ?auto_167296 ?auto_167297 ?auto_167298 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167307 - BLOCK
      ?auto_167308 - BLOCK
      ?auto_167309 - BLOCK
      ?auto_167310 - BLOCK
      ?auto_167311 - BLOCK
      ?auto_167312 - BLOCK
      ?auto_167313 - BLOCK
    )
    :vars
    (
      ?auto_167314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167313 ?auto_167314 ) ( not ( = ?auto_167307 ?auto_167308 ) ) ( not ( = ?auto_167307 ?auto_167309 ) ) ( not ( = ?auto_167307 ?auto_167310 ) ) ( not ( = ?auto_167307 ?auto_167311 ) ) ( not ( = ?auto_167307 ?auto_167312 ) ) ( not ( = ?auto_167307 ?auto_167313 ) ) ( not ( = ?auto_167307 ?auto_167314 ) ) ( not ( = ?auto_167308 ?auto_167309 ) ) ( not ( = ?auto_167308 ?auto_167310 ) ) ( not ( = ?auto_167308 ?auto_167311 ) ) ( not ( = ?auto_167308 ?auto_167312 ) ) ( not ( = ?auto_167308 ?auto_167313 ) ) ( not ( = ?auto_167308 ?auto_167314 ) ) ( not ( = ?auto_167309 ?auto_167310 ) ) ( not ( = ?auto_167309 ?auto_167311 ) ) ( not ( = ?auto_167309 ?auto_167312 ) ) ( not ( = ?auto_167309 ?auto_167313 ) ) ( not ( = ?auto_167309 ?auto_167314 ) ) ( not ( = ?auto_167310 ?auto_167311 ) ) ( not ( = ?auto_167310 ?auto_167312 ) ) ( not ( = ?auto_167310 ?auto_167313 ) ) ( not ( = ?auto_167310 ?auto_167314 ) ) ( not ( = ?auto_167311 ?auto_167312 ) ) ( not ( = ?auto_167311 ?auto_167313 ) ) ( not ( = ?auto_167311 ?auto_167314 ) ) ( not ( = ?auto_167312 ?auto_167313 ) ) ( not ( = ?auto_167312 ?auto_167314 ) ) ( not ( = ?auto_167313 ?auto_167314 ) ) ( ON ?auto_167312 ?auto_167313 ) ( ON ?auto_167311 ?auto_167312 ) ( ON ?auto_167310 ?auto_167311 ) ( ON ?auto_167309 ?auto_167310 ) ( ON ?auto_167308 ?auto_167309 ) ( ON ?auto_167307 ?auto_167308 ) ( CLEAR ?auto_167307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167307 )
      ( MAKE-7PILE ?auto_167307 ?auto_167308 ?auto_167309 ?auto_167310 ?auto_167311 ?auto_167312 ?auto_167313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_167322 - BLOCK
      ?auto_167323 - BLOCK
      ?auto_167324 - BLOCK
      ?auto_167325 - BLOCK
      ?auto_167326 - BLOCK
      ?auto_167327 - BLOCK
      ?auto_167328 - BLOCK
    )
    :vars
    (
      ?auto_167329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167328 ?auto_167329 ) ( not ( = ?auto_167322 ?auto_167323 ) ) ( not ( = ?auto_167322 ?auto_167324 ) ) ( not ( = ?auto_167322 ?auto_167325 ) ) ( not ( = ?auto_167322 ?auto_167326 ) ) ( not ( = ?auto_167322 ?auto_167327 ) ) ( not ( = ?auto_167322 ?auto_167328 ) ) ( not ( = ?auto_167322 ?auto_167329 ) ) ( not ( = ?auto_167323 ?auto_167324 ) ) ( not ( = ?auto_167323 ?auto_167325 ) ) ( not ( = ?auto_167323 ?auto_167326 ) ) ( not ( = ?auto_167323 ?auto_167327 ) ) ( not ( = ?auto_167323 ?auto_167328 ) ) ( not ( = ?auto_167323 ?auto_167329 ) ) ( not ( = ?auto_167324 ?auto_167325 ) ) ( not ( = ?auto_167324 ?auto_167326 ) ) ( not ( = ?auto_167324 ?auto_167327 ) ) ( not ( = ?auto_167324 ?auto_167328 ) ) ( not ( = ?auto_167324 ?auto_167329 ) ) ( not ( = ?auto_167325 ?auto_167326 ) ) ( not ( = ?auto_167325 ?auto_167327 ) ) ( not ( = ?auto_167325 ?auto_167328 ) ) ( not ( = ?auto_167325 ?auto_167329 ) ) ( not ( = ?auto_167326 ?auto_167327 ) ) ( not ( = ?auto_167326 ?auto_167328 ) ) ( not ( = ?auto_167326 ?auto_167329 ) ) ( not ( = ?auto_167327 ?auto_167328 ) ) ( not ( = ?auto_167327 ?auto_167329 ) ) ( not ( = ?auto_167328 ?auto_167329 ) ) ( ON ?auto_167327 ?auto_167328 ) ( ON ?auto_167326 ?auto_167327 ) ( ON ?auto_167325 ?auto_167326 ) ( ON ?auto_167324 ?auto_167325 ) ( ON ?auto_167323 ?auto_167324 ) ( ON ?auto_167322 ?auto_167323 ) ( CLEAR ?auto_167322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167322 )
      ( MAKE-7PILE ?auto_167322 ?auto_167323 ?auto_167324 ?auto_167325 ?auto_167326 ?auto_167327 ?auto_167328 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167338 - BLOCK
      ?auto_167339 - BLOCK
      ?auto_167340 - BLOCK
      ?auto_167341 - BLOCK
      ?auto_167342 - BLOCK
      ?auto_167343 - BLOCK
      ?auto_167344 - BLOCK
      ?auto_167345 - BLOCK
    )
    :vars
    (
      ?auto_167346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167344 ) ( ON ?auto_167345 ?auto_167346 ) ( CLEAR ?auto_167345 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167338 ) ( ON ?auto_167339 ?auto_167338 ) ( ON ?auto_167340 ?auto_167339 ) ( ON ?auto_167341 ?auto_167340 ) ( ON ?auto_167342 ?auto_167341 ) ( ON ?auto_167343 ?auto_167342 ) ( ON ?auto_167344 ?auto_167343 ) ( not ( = ?auto_167338 ?auto_167339 ) ) ( not ( = ?auto_167338 ?auto_167340 ) ) ( not ( = ?auto_167338 ?auto_167341 ) ) ( not ( = ?auto_167338 ?auto_167342 ) ) ( not ( = ?auto_167338 ?auto_167343 ) ) ( not ( = ?auto_167338 ?auto_167344 ) ) ( not ( = ?auto_167338 ?auto_167345 ) ) ( not ( = ?auto_167338 ?auto_167346 ) ) ( not ( = ?auto_167339 ?auto_167340 ) ) ( not ( = ?auto_167339 ?auto_167341 ) ) ( not ( = ?auto_167339 ?auto_167342 ) ) ( not ( = ?auto_167339 ?auto_167343 ) ) ( not ( = ?auto_167339 ?auto_167344 ) ) ( not ( = ?auto_167339 ?auto_167345 ) ) ( not ( = ?auto_167339 ?auto_167346 ) ) ( not ( = ?auto_167340 ?auto_167341 ) ) ( not ( = ?auto_167340 ?auto_167342 ) ) ( not ( = ?auto_167340 ?auto_167343 ) ) ( not ( = ?auto_167340 ?auto_167344 ) ) ( not ( = ?auto_167340 ?auto_167345 ) ) ( not ( = ?auto_167340 ?auto_167346 ) ) ( not ( = ?auto_167341 ?auto_167342 ) ) ( not ( = ?auto_167341 ?auto_167343 ) ) ( not ( = ?auto_167341 ?auto_167344 ) ) ( not ( = ?auto_167341 ?auto_167345 ) ) ( not ( = ?auto_167341 ?auto_167346 ) ) ( not ( = ?auto_167342 ?auto_167343 ) ) ( not ( = ?auto_167342 ?auto_167344 ) ) ( not ( = ?auto_167342 ?auto_167345 ) ) ( not ( = ?auto_167342 ?auto_167346 ) ) ( not ( = ?auto_167343 ?auto_167344 ) ) ( not ( = ?auto_167343 ?auto_167345 ) ) ( not ( = ?auto_167343 ?auto_167346 ) ) ( not ( = ?auto_167344 ?auto_167345 ) ) ( not ( = ?auto_167344 ?auto_167346 ) ) ( not ( = ?auto_167345 ?auto_167346 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167345 ?auto_167346 )
      ( !STACK ?auto_167345 ?auto_167344 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167355 - BLOCK
      ?auto_167356 - BLOCK
      ?auto_167357 - BLOCK
      ?auto_167358 - BLOCK
      ?auto_167359 - BLOCK
      ?auto_167360 - BLOCK
      ?auto_167361 - BLOCK
      ?auto_167362 - BLOCK
    )
    :vars
    (
      ?auto_167363 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167361 ) ( ON ?auto_167362 ?auto_167363 ) ( CLEAR ?auto_167362 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167355 ) ( ON ?auto_167356 ?auto_167355 ) ( ON ?auto_167357 ?auto_167356 ) ( ON ?auto_167358 ?auto_167357 ) ( ON ?auto_167359 ?auto_167358 ) ( ON ?auto_167360 ?auto_167359 ) ( ON ?auto_167361 ?auto_167360 ) ( not ( = ?auto_167355 ?auto_167356 ) ) ( not ( = ?auto_167355 ?auto_167357 ) ) ( not ( = ?auto_167355 ?auto_167358 ) ) ( not ( = ?auto_167355 ?auto_167359 ) ) ( not ( = ?auto_167355 ?auto_167360 ) ) ( not ( = ?auto_167355 ?auto_167361 ) ) ( not ( = ?auto_167355 ?auto_167362 ) ) ( not ( = ?auto_167355 ?auto_167363 ) ) ( not ( = ?auto_167356 ?auto_167357 ) ) ( not ( = ?auto_167356 ?auto_167358 ) ) ( not ( = ?auto_167356 ?auto_167359 ) ) ( not ( = ?auto_167356 ?auto_167360 ) ) ( not ( = ?auto_167356 ?auto_167361 ) ) ( not ( = ?auto_167356 ?auto_167362 ) ) ( not ( = ?auto_167356 ?auto_167363 ) ) ( not ( = ?auto_167357 ?auto_167358 ) ) ( not ( = ?auto_167357 ?auto_167359 ) ) ( not ( = ?auto_167357 ?auto_167360 ) ) ( not ( = ?auto_167357 ?auto_167361 ) ) ( not ( = ?auto_167357 ?auto_167362 ) ) ( not ( = ?auto_167357 ?auto_167363 ) ) ( not ( = ?auto_167358 ?auto_167359 ) ) ( not ( = ?auto_167358 ?auto_167360 ) ) ( not ( = ?auto_167358 ?auto_167361 ) ) ( not ( = ?auto_167358 ?auto_167362 ) ) ( not ( = ?auto_167358 ?auto_167363 ) ) ( not ( = ?auto_167359 ?auto_167360 ) ) ( not ( = ?auto_167359 ?auto_167361 ) ) ( not ( = ?auto_167359 ?auto_167362 ) ) ( not ( = ?auto_167359 ?auto_167363 ) ) ( not ( = ?auto_167360 ?auto_167361 ) ) ( not ( = ?auto_167360 ?auto_167362 ) ) ( not ( = ?auto_167360 ?auto_167363 ) ) ( not ( = ?auto_167361 ?auto_167362 ) ) ( not ( = ?auto_167361 ?auto_167363 ) ) ( not ( = ?auto_167362 ?auto_167363 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167362 ?auto_167363 )
      ( !STACK ?auto_167362 ?auto_167361 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167372 - BLOCK
      ?auto_167373 - BLOCK
      ?auto_167374 - BLOCK
      ?auto_167375 - BLOCK
      ?auto_167376 - BLOCK
      ?auto_167377 - BLOCK
      ?auto_167378 - BLOCK
      ?auto_167379 - BLOCK
    )
    :vars
    (
      ?auto_167380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167379 ?auto_167380 ) ( ON-TABLE ?auto_167372 ) ( ON ?auto_167373 ?auto_167372 ) ( ON ?auto_167374 ?auto_167373 ) ( ON ?auto_167375 ?auto_167374 ) ( ON ?auto_167376 ?auto_167375 ) ( ON ?auto_167377 ?auto_167376 ) ( not ( = ?auto_167372 ?auto_167373 ) ) ( not ( = ?auto_167372 ?auto_167374 ) ) ( not ( = ?auto_167372 ?auto_167375 ) ) ( not ( = ?auto_167372 ?auto_167376 ) ) ( not ( = ?auto_167372 ?auto_167377 ) ) ( not ( = ?auto_167372 ?auto_167378 ) ) ( not ( = ?auto_167372 ?auto_167379 ) ) ( not ( = ?auto_167372 ?auto_167380 ) ) ( not ( = ?auto_167373 ?auto_167374 ) ) ( not ( = ?auto_167373 ?auto_167375 ) ) ( not ( = ?auto_167373 ?auto_167376 ) ) ( not ( = ?auto_167373 ?auto_167377 ) ) ( not ( = ?auto_167373 ?auto_167378 ) ) ( not ( = ?auto_167373 ?auto_167379 ) ) ( not ( = ?auto_167373 ?auto_167380 ) ) ( not ( = ?auto_167374 ?auto_167375 ) ) ( not ( = ?auto_167374 ?auto_167376 ) ) ( not ( = ?auto_167374 ?auto_167377 ) ) ( not ( = ?auto_167374 ?auto_167378 ) ) ( not ( = ?auto_167374 ?auto_167379 ) ) ( not ( = ?auto_167374 ?auto_167380 ) ) ( not ( = ?auto_167375 ?auto_167376 ) ) ( not ( = ?auto_167375 ?auto_167377 ) ) ( not ( = ?auto_167375 ?auto_167378 ) ) ( not ( = ?auto_167375 ?auto_167379 ) ) ( not ( = ?auto_167375 ?auto_167380 ) ) ( not ( = ?auto_167376 ?auto_167377 ) ) ( not ( = ?auto_167376 ?auto_167378 ) ) ( not ( = ?auto_167376 ?auto_167379 ) ) ( not ( = ?auto_167376 ?auto_167380 ) ) ( not ( = ?auto_167377 ?auto_167378 ) ) ( not ( = ?auto_167377 ?auto_167379 ) ) ( not ( = ?auto_167377 ?auto_167380 ) ) ( not ( = ?auto_167378 ?auto_167379 ) ) ( not ( = ?auto_167378 ?auto_167380 ) ) ( not ( = ?auto_167379 ?auto_167380 ) ) ( CLEAR ?auto_167377 ) ( ON ?auto_167378 ?auto_167379 ) ( CLEAR ?auto_167378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167372 ?auto_167373 ?auto_167374 ?auto_167375 ?auto_167376 ?auto_167377 ?auto_167378 )
      ( MAKE-8PILE ?auto_167372 ?auto_167373 ?auto_167374 ?auto_167375 ?auto_167376 ?auto_167377 ?auto_167378 ?auto_167379 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167389 - BLOCK
      ?auto_167390 - BLOCK
      ?auto_167391 - BLOCK
      ?auto_167392 - BLOCK
      ?auto_167393 - BLOCK
      ?auto_167394 - BLOCK
      ?auto_167395 - BLOCK
      ?auto_167396 - BLOCK
    )
    :vars
    (
      ?auto_167397 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167396 ?auto_167397 ) ( ON-TABLE ?auto_167389 ) ( ON ?auto_167390 ?auto_167389 ) ( ON ?auto_167391 ?auto_167390 ) ( ON ?auto_167392 ?auto_167391 ) ( ON ?auto_167393 ?auto_167392 ) ( ON ?auto_167394 ?auto_167393 ) ( not ( = ?auto_167389 ?auto_167390 ) ) ( not ( = ?auto_167389 ?auto_167391 ) ) ( not ( = ?auto_167389 ?auto_167392 ) ) ( not ( = ?auto_167389 ?auto_167393 ) ) ( not ( = ?auto_167389 ?auto_167394 ) ) ( not ( = ?auto_167389 ?auto_167395 ) ) ( not ( = ?auto_167389 ?auto_167396 ) ) ( not ( = ?auto_167389 ?auto_167397 ) ) ( not ( = ?auto_167390 ?auto_167391 ) ) ( not ( = ?auto_167390 ?auto_167392 ) ) ( not ( = ?auto_167390 ?auto_167393 ) ) ( not ( = ?auto_167390 ?auto_167394 ) ) ( not ( = ?auto_167390 ?auto_167395 ) ) ( not ( = ?auto_167390 ?auto_167396 ) ) ( not ( = ?auto_167390 ?auto_167397 ) ) ( not ( = ?auto_167391 ?auto_167392 ) ) ( not ( = ?auto_167391 ?auto_167393 ) ) ( not ( = ?auto_167391 ?auto_167394 ) ) ( not ( = ?auto_167391 ?auto_167395 ) ) ( not ( = ?auto_167391 ?auto_167396 ) ) ( not ( = ?auto_167391 ?auto_167397 ) ) ( not ( = ?auto_167392 ?auto_167393 ) ) ( not ( = ?auto_167392 ?auto_167394 ) ) ( not ( = ?auto_167392 ?auto_167395 ) ) ( not ( = ?auto_167392 ?auto_167396 ) ) ( not ( = ?auto_167392 ?auto_167397 ) ) ( not ( = ?auto_167393 ?auto_167394 ) ) ( not ( = ?auto_167393 ?auto_167395 ) ) ( not ( = ?auto_167393 ?auto_167396 ) ) ( not ( = ?auto_167393 ?auto_167397 ) ) ( not ( = ?auto_167394 ?auto_167395 ) ) ( not ( = ?auto_167394 ?auto_167396 ) ) ( not ( = ?auto_167394 ?auto_167397 ) ) ( not ( = ?auto_167395 ?auto_167396 ) ) ( not ( = ?auto_167395 ?auto_167397 ) ) ( not ( = ?auto_167396 ?auto_167397 ) ) ( CLEAR ?auto_167394 ) ( ON ?auto_167395 ?auto_167396 ) ( CLEAR ?auto_167395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167389 ?auto_167390 ?auto_167391 ?auto_167392 ?auto_167393 ?auto_167394 ?auto_167395 )
      ( MAKE-8PILE ?auto_167389 ?auto_167390 ?auto_167391 ?auto_167392 ?auto_167393 ?auto_167394 ?auto_167395 ?auto_167396 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167406 - BLOCK
      ?auto_167407 - BLOCK
      ?auto_167408 - BLOCK
      ?auto_167409 - BLOCK
      ?auto_167410 - BLOCK
      ?auto_167411 - BLOCK
      ?auto_167412 - BLOCK
      ?auto_167413 - BLOCK
    )
    :vars
    (
      ?auto_167414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167413 ?auto_167414 ) ( ON-TABLE ?auto_167406 ) ( ON ?auto_167407 ?auto_167406 ) ( ON ?auto_167408 ?auto_167407 ) ( ON ?auto_167409 ?auto_167408 ) ( ON ?auto_167410 ?auto_167409 ) ( not ( = ?auto_167406 ?auto_167407 ) ) ( not ( = ?auto_167406 ?auto_167408 ) ) ( not ( = ?auto_167406 ?auto_167409 ) ) ( not ( = ?auto_167406 ?auto_167410 ) ) ( not ( = ?auto_167406 ?auto_167411 ) ) ( not ( = ?auto_167406 ?auto_167412 ) ) ( not ( = ?auto_167406 ?auto_167413 ) ) ( not ( = ?auto_167406 ?auto_167414 ) ) ( not ( = ?auto_167407 ?auto_167408 ) ) ( not ( = ?auto_167407 ?auto_167409 ) ) ( not ( = ?auto_167407 ?auto_167410 ) ) ( not ( = ?auto_167407 ?auto_167411 ) ) ( not ( = ?auto_167407 ?auto_167412 ) ) ( not ( = ?auto_167407 ?auto_167413 ) ) ( not ( = ?auto_167407 ?auto_167414 ) ) ( not ( = ?auto_167408 ?auto_167409 ) ) ( not ( = ?auto_167408 ?auto_167410 ) ) ( not ( = ?auto_167408 ?auto_167411 ) ) ( not ( = ?auto_167408 ?auto_167412 ) ) ( not ( = ?auto_167408 ?auto_167413 ) ) ( not ( = ?auto_167408 ?auto_167414 ) ) ( not ( = ?auto_167409 ?auto_167410 ) ) ( not ( = ?auto_167409 ?auto_167411 ) ) ( not ( = ?auto_167409 ?auto_167412 ) ) ( not ( = ?auto_167409 ?auto_167413 ) ) ( not ( = ?auto_167409 ?auto_167414 ) ) ( not ( = ?auto_167410 ?auto_167411 ) ) ( not ( = ?auto_167410 ?auto_167412 ) ) ( not ( = ?auto_167410 ?auto_167413 ) ) ( not ( = ?auto_167410 ?auto_167414 ) ) ( not ( = ?auto_167411 ?auto_167412 ) ) ( not ( = ?auto_167411 ?auto_167413 ) ) ( not ( = ?auto_167411 ?auto_167414 ) ) ( not ( = ?auto_167412 ?auto_167413 ) ) ( not ( = ?auto_167412 ?auto_167414 ) ) ( not ( = ?auto_167413 ?auto_167414 ) ) ( ON ?auto_167412 ?auto_167413 ) ( CLEAR ?auto_167410 ) ( ON ?auto_167411 ?auto_167412 ) ( CLEAR ?auto_167411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167406 ?auto_167407 ?auto_167408 ?auto_167409 ?auto_167410 ?auto_167411 )
      ( MAKE-8PILE ?auto_167406 ?auto_167407 ?auto_167408 ?auto_167409 ?auto_167410 ?auto_167411 ?auto_167412 ?auto_167413 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167423 - BLOCK
      ?auto_167424 - BLOCK
      ?auto_167425 - BLOCK
      ?auto_167426 - BLOCK
      ?auto_167427 - BLOCK
      ?auto_167428 - BLOCK
      ?auto_167429 - BLOCK
      ?auto_167430 - BLOCK
    )
    :vars
    (
      ?auto_167431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167430 ?auto_167431 ) ( ON-TABLE ?auto_167423 ) ( ON ?auto_167424 ?auto_167423 ) ( ON ?auto_167425 ?auto_167424 ) ( ON ?auto_167426 ?auto_167425 ) ( ON ?auto_167427 ?auto_167426 ) ( not ( = ?auto_167423 ?auto_167424 ) ) ( not ( = ?auto_167423 ?auto_167425 ) ) ( not ( = ?auto_167423 ?auto_167426 ) ) ( not ( = ?auto_167423 ?auto_167427 ) ) ( not ( = ?auto_167423 ?auto_167428 ) ) ( not ( = ?auto_167423 ?auto_167429 ) ) ( not ( = ?auto_167423 ?auto_167430 ) ) ( not ( = ?auto_167423 ?auto_167431 ) ) ( not ( = ?auto_167424 ?auto_167425 ) ) ( not ( = ?auto_167424 ?auto_167426 ) ) ( not ( = ?auto_167424 ?auto_167427 ) ) ( not ( = ?auto_167424 ?auto_167428 ) ) ( not ( = ?auto_167424 ?auto_167429 ) ) ( not ( = ?auto_167424 ?auto_167430 ) ) ( not ( = ?auto_167424 ?auto_167431 ) ) ( not ( = ?auto_167425 ?auto_167426 ) ) ( not ( = ?auto_167425 ?auto_167427 ) ) ( not ( = ?auto_167425 ?auto_167428 ) ) ( not ( = ?auto_167425 ?auto_167429 ) ) ( not ( = ?auto_167425 ?auto_167430 ) ) ( not ( = ?auto_167425 ?auto_167431 ) ) ( not ( = ?auto_167426 ?auto_167427 ) ) ( not ( = ?auto_167426 ?auto_167428 ) ) ( not ( = ?auto_167426 ?auto_167429 ) ) ( not ( = ?auto_167426 ?auto_167430 ) ) ( not ( = ?auto_167426 ?auto_167431 ) ) ( not ( = ?auto_167427 ?auto_167428 ) ) ( not ( = ?auto_167427 ?auto_167429 ) ) ( not ( = ?auto_167427 ?auto_167430 ) ) ( not ( = ?auto_167427 ?auto_167431 ) ) ( not ( = ?auto_167428 ?auto_167429 ) ) ( not ( = ?auto_167428 ?auto_167430 ) ) ( not ( = ?auto_167428 ?auto_167431 ) ) ( not ( = ?auto_167429 ?auto_167430 ) ) ( not ( = ?auto_167429 ?auto_167431 ) ) ( not ( = ?auto_167430 ?auto_167431 ) ) ( ON ?auto_167429 ?auto_167430 ) ( CLEAR ?auto_167427 ) ( ON ?auto_167428 ?auto_167429 ) ( CLEAR ?auto_167428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167423 ?auto_167424 ?auto_167425 ?auto_167426 ?auto_167427 ?auto_167428 )
      ( MAKE-8PILE ?auto_167423 ?auto_167424 ?auto_167425 ?auto_167426 ?auto_167427 ?auto_167428 ?auto_167429 ?auto_167430 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167440 - BLOCK
      ?auto_167441 - BLOCK
      ?auto_167442 - BLOCK
      ?auto_167443 - BLOCK
      ?auto_167444 - BLOCK
      ?auto_167445 - BLOCK
      ?auto_167446 - BLOCK
      ?auto_167447 - BLOCK
    )
    :vars
    (
      ?auto_167448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167447 ?auto_167448 ) ( ON-TABLE ?auto_167440 ) ( ON ?auto_167441 ?auto_167440 ) ( ON ?auto_167442 ?auto_167441 ) ( ON ?auto_167443 ?auto_167442 ) ( not ( = ?auto_167440 ?auto_167441 ) ) ( not ( = ?auto_167440 ?auto_167442 ) ) ( not ( = ?auto_167440 ?auto_167443 ) ) ( not ( = ?auto_167440 ?auto_167444 ) ) ( not ( = ?auto_167440 ?auto_167445 ) ) ( not ( = ?auto_167440 ?auto_167446 ) ) ( not ( = ?auto_167440 ?auto_167447 ) ) ( not ( = ?auto_167440 ?auto_167448 ) ) ( not ( = ?auto_167441 ?auto_167442 ) ) ( not ( = ?auto_167441 ?auto_167443 ) ) ( not ( = ?auto_167441 ?auto_167444 ) ) ( not ( = ?auto_167441 ?auto_167445 ) ) ( not ( = ?auto_167441 ?auto_167446 ) ) ( not ( = ?auto_167441 ?auto_167447 ) ) ( not ( = ?auto_167441 ?auto_167448 ) ) ( not ( = ?auto_167442 ?auto_167443 ) ) ( not ( = ?auto_167442 ?auto_167444 ) ) ( not ( = ?auto_167442 ?auto_167445 ) ) ( not ( = ?auto_167442 ?auto_167446 ) ) ( not ( = ?auto_167442 ?auto_167447 ) ) ( not ( = ?auto_167442 ?auto_167448 ) ) ( not ( = ?auto_167443 ?auto_167444 ) ) ( not ( = ?auto_167443 ?auto_167445 ) ) ( not ( = ?auto_167443 ?auto_167446 ) ) ( not ( = ?auto_167443 ?auto_167447 ) ) ( not ( = ?auto_167443 ?auto_167448 ) ) ( not ( = ?auto_167444 ?auto_167445 ) ) ( not ( = ?auto_167444 ?auto_167446 ) ) ( not ( = ?auto_167444 ?auto_167447 ) ) ( not ( = ?auto_167444 ?auto_167448 ) ) ( not ( = ?auto_167445 ?auto_167446 ) ) ( not ( = ?auto_167445 ?auto_167447 ) ) ( not ( = ?auto_167445 ?auto_167448 ) ) ( not ( = ?auto_167446 ?auto_167447 ) ) ( not ( = ?auto_167446 ?auto_167448 ) ) ( not ( = ?auto_167447 ?auto_167448 ) ) ( ON ?auto_167446 ?auto_167447 ) ( ON ?auto_167445 ?auto_167446 ) ( CLEAR ?auto_167443 ) ( ON ?auto_167444 ?auto_167445 ) ( CLEAR ?auto_167444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167440 ?auto_167441 ?auto_167442 ?auto_167443 ?auto_167444 )
      ( MAKE-8PILE ?auto_167440 ?auto_167441 ?auto_167442 ?auto_167443 ?auto_167444 ?auto_167445 ?auto_167446 ?auto_167447 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167457 - BLOCK
      ?auto_167458 - BLOCK
      ?auto_167459 - BLOCK
      ?auto_167460 - BLOCK
      ?auto_167461 - BLOCK
      ?auto_167462 - BLOCK
      ?auto_167463 - BLOCK
      ?auto_167464 - BLOCK
    )
    :vars
    (
      ?auto_167465 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167464 ?auto_167465 ) ( ON-TABLE ?auto_167457 ) ( ON ?auto_167458 ?auto_167457 ) ( ON ?auto_167459 ?auto_167458 ) ( ON ?auto_167460 ?auto_167459 ) ( not ( = ?auto_167457 ?auto_167458 ) ) ( not ( = ?auto_167457 ?auto_167459 ) ) ( not ( = ?auto_167457 ?auto_167460 ) ) ( not ( = ?auto_167457 ?auto_167461 ) ) ( not ( = ?auto_167457 ?auto_167462 ) ) ( not ( = ?auto_167457 ?auto_167463 ) ) ( not ( = ?auto_167457 ?auto_167464 ) ) ( not ( = ?auto_167457 ?auto_167465 ) ) ( not ( = ?auto_167458 ?auto_167459 ) ) ( not ( = ?auto_167458 ?auto_167460 ) ) ( not ( = ?auto_167458 ?auto_167461 ) ) ( not ( = ?auto_167458 ?auto_167462 ) ) ( not ( = ?auto_167458 ?auto_167463 ) ) ( not ( = ?auto_167458 ?auto_167464 ) ) ( not ( = ?auto_167458 ?auto_167465 ) ) ( not ( = ?auto_167459 ?auto_167460 ) ) ( not ( = ?auto_167459 ?auto_167461 ) ) ( not ( = ?auto_167459 ?auto_167462 ) ) ( not ( = ?auto_167459 ?auto_167463 ) ) ( not ( = ?auto_167459 ?auto_167464 ) ) ( not ( = ?auto_167459 ?auto_167465 ) ) ( not ( = ?auto_167460 ?auto_167461 ) ) ( not ( = ?auto_167460 ?auto_167462 ) ) ( not ( = ?auto_167460 ?auto_167463 ) ) ( not ( = ?auto_167460 ?auto_167464 ) ) ( not ( = ?auto_167460 ?auto_167465 ) ) ( not ( = ?auto_167461 ?auto_167462 ) ) ( not ( = ?auto_167461 ?auto_167463 ) ) ( not ( = ?auto_167461 ?auto_167464 ) ) ( not ( = ?auto_167461 ?auto_167465 ) ) ( not ( = ?auto_167462 ?auto_167463 ) ) ( not ( = ?auto_167462 ?auto_167464 ) ) ( not ( = ?auto_167462 ?auto_167465 ) ) ( not ( = ?auto_167463 ?auto_167464 ) ) ( not ( = ?auto_167463 ?auto_167465 ) ) ( not ( = ?auto_167464 ?auto_167465 ) ) ( ON ?auto_167463 ?auto_167464 ) ( ON ?auto_167462 ?auto_167463 ) ( CLEAR ?auto_167460 ) ( ON ?auto_167461 ?auto_167462 ) ( CLEAR ?auto_167461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167457 ?auto_167458 ?auto_167459 ?auto_167460 ?auto_167461 )
      ( MAKE-8PILE ?auto_167457 ?auto_167458 ?auto_167459 ?auto_167460 ?auto_167461 ?auto_167462 ?auto_167463 ?auto_167464 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167474 - BLOCK
      ?auto_167475 - BLOCK
      ?auto_167476 - BLOCK
      ?auto_167477 - BLOCK
      ?auto_167478 - BLOCK
      ?auto_167479 - BLOCK
      ?auto_167480 - BLOCK
      ?auto_167481 - BLOCK
    )
    :vars
    (
      ?auto_167482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167481 ?auto_167482 ) ( ON-TABLE ?auto_167474 ) ( ON ?auto_167475 ?auto_167474 ) ( ON ?auto_167476 ?auto_167475 ) ( not ( = ?auto_167474 ?auto_167475 ) ) ( not ( = ?auto_167474 ?auto_167476 ) ) ( not ( = ?auto_167474 ?auto_167477 ) ) ( not ( = ?auto_167474 ?auto_167478 ) ) ( not ( = ?auto_167474 ?auto_167479 ) ) ( not ( = ?auto_167474 ?auto_167480 ) ) ( not ( = ?auto_167474 ?auto_167481 ) ) ( not ( = ?auto_167474 ?auto_167482 ) ) ( not ( = ?auto_167475 ?auto_167476 ) ) ( not ( = ?auto_167475 ?auto_167477 ) ) ( not ( = ?auto_167475 ?auto_167478 ) ) ( not ( = ?auto_167475 ?auto_167479 ) ) ( not ( = ?auto_167475 ?auto_167480 ) ) ( not ( = ?auto_167475 ?auto_167481 ) ) ( not ( = ?auto_167475 ?auto_167482 ) ) ( not ( = ?auto_167476 ?auto_167477 ) ) ( not ( = ?auto_167476 ?auto_167478 ) ) ( not ( = ?auto_167476 ?auto_167479 ) ) ( not ( = ?auto_167476 ?auto_167480 ) ) ( not ( = ?auto_167476 ?auto_167481 ) ) ( not ( = ?auto_167476 ?auto_167482 ) ) ( not ( = ?auto_167477 ?auto_167478 ) ) ( not ( = ?auto_167477 ?auto_167479 ) ) ( not ( = ?auto_167477 ?auto_167480 ) ) ( not ( = ?auto_167477 ?auto_167481 ) ) ( not ( = ?auto_167477 ?auto_167482 ) ) ( not ( = ?auto_167478 ?auto_167479 ) ) ( not ( = ?auto_167478 ?auto_167480 ) ) ( not ( = ?auto_167478 ?auto_167481 ) ) ( not ( = ?auto_167478 ?auto_167482 ) ) ( not ( = ?auto_167479 ?auto_167480 ) ) ( not ( = ?auto_167479 ?auto_167481 ) ) ( not ( = ?auto_167479 ?auto_167482 ) ) ( not ( = ?auto_167480 ?auto_167481 ) ) ( not ( = ?auto_167480 ?auto_167482 ) ) ( not ( = ?auto_167481 ?auto_167482 ) ) ( ON ?auto_167480 ?auto_167481 ) ( ON ?auto_167479 ?auto_167480 ) ( ON ?auto_167478 ?auto_167479 ) ( CLEAR ?auto_167476 ) ( ON ?auto_167477 ?auto_167478 ) ( CLEAR ?auto_167477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167474 ?auto_167475 ?auto_167476 ?auto_167477 )
      ( MAKE-8PILE ?auto_167474 ?auto_167475 ?auto_167476 ?auto_167477 ?auto_167478 ?auto_167479 ?auto_167480 ?auto_167481 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167491 - BLOCK
      ?auto_167492 - BLOCK
      ?auto_167493 - BLOCK
      ?auto_167494 - BLOCK
      ?auto_167495 - BLOCK
      ?auto_167496 - BLOCK
      ?auto_167497 - BLOCK
      ?auto_167498 - BLOCK
    )
    :vars
    (
      ?auto_167499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167498 ?auto_167499 ) ( ON-TABLE ?auto_167491 ) ( ON ?auto_167492 ?auto_167491 ) ( ON ?auto_167493 ?auto_167492 ) ( not ( = ?auto_167491 ?auto_167492 ) ) ( not ( = ?auto_167491 ?auto_167493 ) ) ( not ( = ?auto_167491 ?auto_167494 ) ) ( not ( = ?auto_167491 ?auto_167495 ) ) ( not ( = ?auto_167491 ?auto_167496 ) ) ( not ( = ?auto_167491 ?auto_167497 ) ) ( not ( = ?auto_167491 ?auto_167498 ) ) ( not ( = ?auto_167491 ?auto_167499 ) ) ( not ( = ?auto_167492 ?auto_167493 ) ) ( not ( = ?auto_167492 ?auto_167494 ) ) ( not ( = ?auto_167492 ?auto_167495 ) ) ( not ( = ?auto_167492 ?auto_167496 ) ) ( not ( = ?auto_167492 ?auto_167497 ) ) ( not ( = ?auto_167492 ?auto_167498 ) ) ( not ( = ?auto_167492 ?auto_167499 ) ) ( not ( = ?auto_167493 ?auto_167494 ) ) ( not ( = ?auto_167493 ?auto_167495 ) ) ( not ( = ?auto_167493 ?auto_167496 ) ) ( not ( = ?auto_167493 ?auto_167497 ) ) ( not ( = ?auto_167493 ?auto_167498 ) ) ( not ( = ?auto_167493 ?auto_167499 ) ) ( not ( = ?auto_167494 ?auto_167495 ) ) ( not ( = ?auto_167494 ?auto_167496 ) ) ( not ( = ?auto_167494 ?auto_167497 ) ) ( not ( = ?auto_167494 ?auto_167498 ) ) ( not ( = ?auto_167494 ?auto_167499 ) ) ( not ( = ?auto_167495 ?auto_167496 ) ) ( not ( = ?auto_167495 ?auto_167497 ) ) ( not ( = ?auto_167495 ?auto_167498 ) ) ( not ( = ?auto_167495 ?auto_167499 ) ) ( not ( = ?auto_167496 ?auto_167497 ) ) ( not ( = ?auto_167496 ?auto_167498 ) ) ( not ( = ?auto_167496 ?auto_167499 ) ) ( not ( = ?auto_167497 ?auto_167498 ) ) ( not ( = ?auto_167497 ?auto_167499 ) ) ( not ( = ?auto_167498 ?auto_167499 ) ) ( ON ?auto_167497 ?auto_167498 ) ( ON ?auto_167496 ?auto_167497 ) ( ON ?auto_167495 ?auto_167496 ) ( CLEAR ?auto_167493 ) ( ON ?auto_167494 ?auto_167495 ) ( CLEAR ?auto_167494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167491 ?auto_167492 ?auto_167493 ?auto_167494 )
      ( MAKE-8PILE ?auto_167491 ?auto_167492 ?auto_167493 ?auto_167494 ?auto_167495 ?auto_167496 ?auto_167497 ?auto_167498 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167508 - BLOCK
      ?auto_167509 - BLOCK
      ?auto_167510 - BLOCK
      ?auto_167511 - BLOCK
      ?auto_167512 - BLOCK
      ?auto_167513 - BLOCK
      ?auto_167514 - BLOCK
      ?auto_167515 - BLOCK
    )
    :vars
    (
      ?auto_167516 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167515 ?auto_167516 ) ( ON-TABLE ?auto_167508 ) ( ON ?auto_167509 ?auto_167508 ) ( not ( = ?auto_167508 ?auto_167509 ) ) ( not ( = ?auto_167508 ?auto_167510 ) ) ( not ( = ?auto_167508 ?auto_167511 ) ) ( not ( = ?auto_167508 ?auto_167512 ) ) ( not ( = ?auto_167508 ?auto_167513 ) ) ( not ( = ?auto_167508 ?auto_167514 ) ) ( not ( = ?auto_167508 ?auto_167515 ) ) ( not ( = ?auto_167508 ?auto_167516 ) ) ( not ( = ?auto_167509 ?auto_167510 ) ) ( not ( = ?auto_167509 ?auto_167511 ) ) ( not ( = ?auto_167509 ?auto_167512 ) ) ( not ( = ?auto_167509 ?auto_167513 ) ) ( not ( = ?auto_167509 ?auto_167514 ) ) ( not ( = ?auto_167509 ?auto_167515 ) ) ( not ( = ?auto_167509 ?auto_167516 ) ) ( not ( = ?auto_167510 ?auto_167511 ) ) ( not ( = ?auto_167510 ?auto_167512 ) ) ( not ( = ?auto_167510 ?auto_167513 ) ) ( not ( = ?auto_167510 ?auto_167514 ) ) ( not ( = ?auto_167510 ?auto_167515 ) ) ( not ( = ?auto_167510 ?auto_167516 ) ) ( not ( = ?auto_167511 ?auto_167512 ) ) ( not ( = ?auto_167511 ?auto_167513 ) ) ( not ( = ?auto_167511 ?auto_167514 ) ) ( not ( = ?auto_167511 ?auto_167515 ) ) ( not ( = ?auto_167511 ?auto_167516 ) ) ( not ( = ?auto_167512 ?auto_167513 ) ) ( not ( = ?auto_167512 ?auto_167514 ) ) ( not ( = ?auto_167512 ?auto_167515 ) ) ( not ( = ?auto_167512 ?auto_167516 ) ) ( not ( = ?auto_167513 ?auto_167514 ) ) ( not ( = ?auto_167513 ?auto_167515 ) ) ( not ( = ?auto_167513 ?auto_167516 ) ) ( not ( = ?auto_167514 ?auto_167515 ) ) ( not ( = ?auto_167514 ?auto_167516 ) ) ( not ( = ?auto_167515 ?auto_167516 ) ) ( ON ?auto_167514 ?auto_167515 ) ( ON ?auto_167513 ?auto_167514 ) ( ON ?auto_167512 ?auto_167513 ) ( ON ?auto_167511 ?auto_167512 ) ( CLEAR ?auto_167509 ) ( ON ?auto_167510 ?auto_167511 ) ( CLEAR ?auto_167510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167508 ?auto_167509 ?auto_167510 )
      ( MAKE-8PILE ?auto_167508 ?auto_167509 ?auto_167510 ?auto_167511 ?auto_167512 ?auto_167513 ?auto_167514 ?auto_167515 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167525 - BLOCK
      ?auto_167526 - BLOCK
      ?auto_167527 - BLOCK
      ?auto_167528 - BLOCK
      ?auto_167529 - BLOCK
      ?auto_167530 - BLOCK
      ?auto_167531 - BLOCK
      ?auto_167532 - BLOCK
    )
    :vars
    (
      ?auto_167533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167532 ?auto_167533 ) ( ON-TABLE ?auto_167525 ) ( ON ?auto_167526 ?auto_167525 ) ( not ( = ?auto_167525 ?auto_167526 ) ) ( not ( = ?auto_167525 ?auto_167527 ) ) ( not ( = ?auto_167525 ?auto_167528 ) ) ( not ( = ?auto_167525 ?auto_167529 ) ) ( not ( = ?auto_167525 ?auto_167530 ) ) ( not ( = ?auto_167525 ?auto_167531 ) ) ( not ( = ?auto_167525 ?auto_167532 ) ) ( not ( = ?auto_167525 ?auto_167533 ) ) ( not ( = ?auto_167526 ?auto_167527 ) ) ( not ( = ?auto_167526 ?auto_167528 ) ) ( not ( = ?auto_167526 ?auto_167529 ) ) ( not ( = ?auto_167526 ?auto_167530 ) ) ( not ( = ?auto_167526 ?auto_167531 ) ) ( not ( = ?auto_167526 ?auto_167532 ) ) ( not ( = ?auto_167526 ?auto_167533 ) ) ( not ( = ?auto_167527 ?auto_167528 ) ) ( not ( = ?auto_167527 ?auto_167529 ) ) ( not ( = ?auto_167527 ?auto_167530 ) ) ( not ( = ?auto_167527 ?auto_167531 ) ) ( not ( = ?auto_167527 ?auto_167532 ) ) ( not ( = ?auto_167527 ?auto_167533 ) ) ( not ( = ?auto_167528 ?auto_167529 ) ) ( not ( = ?auto_167528 ?auto_167530 ) ) ( not ( = ?auto_167528 ?auto_167531 ) ) ( not ( = ?auto_167528 ?auto_167532 ) ) ( not ( = ?auto_167528 ?auto_167533 ) ) ( not ( = ?auto_167529 ?auto_167530 ) ) ( not ( = ?auto_167529 ?auto_167531 ) ) ( not ( = ?auto_167529 ?auto_167532 ) ) ( not ( = ?auto_167529 ?auto_167533 ) ) ( not ( = ?auto_167530 ?auto_167531 ) ) ( not ( = ?auto_167530 ?auto_167532 ) ) ( not ( = ?auto_167530 ?auto_167533 ) ) ( not ( = ?auto_167531 ?auto_167532 ) ) ( not ( = ?auto_167531 ?auto_167533 ) ) ( not ( = ?auto_167532 ?auto_167533 ) ) ( ON ?auto_167531 ?auto_167532 ) ( ON ?auto_167530 ?auto_167531 ) ( ON ?auto_167529 ?auto_167530 ) ( ON ?auto_167528 ?auto_167529 ) ( CLEAR ?auto_167526 ) ( ON ?auto_167527 ?auto_167528 ) ( CLEAR ?auto_167527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167525 ?auto_167526 ?auto_167527 )
      ( MAKE-8PILE ?auto_167525 ?auto_167526 ?auto_167527 ?auto_167528 ?auto_167529 ?auto_167530 ?auto_167531 ?auto_167532 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167542 - BLOCK
      ?auto_167543 - BLOCK
      ?auto_167544 - BLOCK
      ?auto_167545 - BLOCK
      ?auto_167546 - BLOCK
      ?auto_167547 - BLOCK
      ?auto_167548 - BLOCK
      ?auto_167549 - BLOCK
    )
    :vars
    (
      ?auto_167550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167549 ?auto_167550 ) ( ON-TABLE ?auto_167542 ) ( not ( = ?auto_167542 ?auto_167543 ) ) ( not ( = ?auto_167542 ?auto_167544 ) ) ( not ( = ?auto_167542 ?auto_167545 ) ) ( not ( = ?auto_167542 ?auto_167546 ) ) ( not ( = ?auto_167542 ?auto_167547 ) ) ( not ( = ?auto_167542 ?auto_167548 ) ) ( not ( = ?auto_167542 ?auto_167549 ) ) ( not ( = ?auto_167542 ?auto_167550 ) ) ( not ( = ?auto_167543 ?auto_167544 ) ) ( not ( = ?auto_167543 ?auto_167545 ) ) ( not ( = ?auto_167543 ?auto_167546 ) ) ( not ( = ?auto_167543 ?auto_167547 ) ) ( not ( = ?auto_167543 ?auto_167548 ) ) ( not ( = ?auto_167543 ?auto_167549 ) ) ( not ( = ?auto_167543 ?auto_167550 ) ) ( not ( = ?auto_167544 ?auto_167545 ) ) ( not ( = ?auto_167544 ?auto_167546 ) ) ( not ( = ?auto_167544 ?auto_167547 ) ) ( not ( = ?auto_167544 ?auto_167548 ) ) ( not ( = ?auto_167544 ?auto_167549 ) ) ( not ( = ?auto_167544 ?auto_167550 ) ) ( not ( = ?auto_167545 ?auto_167546 ) ) ( not ( = ?auto_167545 ?auto_167547 ) ) ( not ( = ?auto_167545 ?auto_167548 ) ) ( not ( = ?auto_167545 ?auto_167549 ) ) ( not ( = ?auto_167545 ?auto_167550 ) ) ( not ( = ?auto_167546 ?auto_167547 ) ) ( not ( = ?auto_167546 ?auto_167548 ) ) ( not ( = ?auto_167546 ?auto_167549 ) ) ( not ( = ?auto_167546 ?auto_167550 ) ) ( not ( = ?auto_167547 ?auto_167548 ) ) ( not ( = ?auto_167547 ?auto_167549 ) ) ( not ( = ?auto_167547 ?auto_167550 ) ) ( not ( = ?auto_167548 ?auto_167549 ) ) ( not ( = ?auto_167548 ?auto_167550 ) ) ( not ( = ?auto_167549 ?auto_167550 ) ) ( ON ?auto_167548 ?auto_167549 ) ( ON ?auto_167547 ?auto_167548 ) ( ON ?auto_167546 ?auto_167547 ) ( ON ?auto_167545 ?auto_167546 ) ( ON ?auto_167544 ?auto_167545 ) ( CLEAR ?auto_167542 ) ( ON ?auto_167543 ?auto_167544 ) ( CLEAR ?auto_167543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167542 ?auto_167543 )
      ( MAKE-8PILE ?auto_167542 ?auto_167543 ?auto_167544 ?auto_167545 ?auto_167546 ?auto_167547 ?auto_167548 ?auto_167549 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167559 - BLOCK
      ?auto_167560 - BLOCK
      ?auto_167561 - BLOCK
      ?auto_167562 - BLOCK
      ?auto_167563 - BLOCK
      ?auto_167564 - BLOCK
      ?auto_167565 - BLOCK
      ?auto_167566 - BLOCK
    )
    :vars
    (
      ?auto_167567 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167566 ?auto_167567 ) ( ON-TABLE ?auto_167559 ) ( not ( = ?auto_167559 ?auto_167560 ) ) ( not ( = ?auto_167559 ?auto_167561 ) ) ( not ( = ?auto_167559 ?auto_167562 ) ) ( not ( = ?auto_167559 ?auto_167563 ) ) ( not ( = ?auto_167559 ?auto_167564 ) ) ( not ( = ?auto_167559 ?auto_167565 ) ) ( not ( = ?auto_167559 ?auto_167566 ) ) ( not ( = ?auto_167559 ?auto_167567 ) ) ( not ( = ?auto_167560 ?auto_167561 ) ) ( not ( = ?auto_167560 ?auto_167562 ) ) ( not ( = ?auto_167560 ?auto_167563 ) ) ( not ( = ?auto_167560 ?auto_167564 ) ) ( not ( = ?auto_167560 ?auto_167565 ) ) ( not ( = ?auto_167560 ?auto_167566 ) ) ( not ( = ?auto_167560 ?auto_167567 ) ) ( not ( = ?auto_167561 ?auto_167562 ) ) ( not ( = ?auto_167561 ?auto_167563 ) ) ( not ( = ?auto_167561 ?auto_167564 ) ) ( not ( = ?auto_167561 ?auto_167565 ) ) ( not ( = ?auto_167561 ?auto_167566 ) ) ( not ( = ?auto_167561 ?auto_167567 ) ) ( not ( = ?auto_167562 ?auto_167563 ) ) ( not ( = ?auto_167562 ?auto_167564 ) ) ( not ( = ?auto_167562 ?auto_167565 ) ) ( not ( = ?auto_167562 ?auto_167566 ) ) ( not ( = ?auto_167562 ?auto_167567 ) ) ( not ( = ?auto_167563 ?auto_167564 ) ) ( not ( = ?auto_167563 ?auto_167565 ) ) ( not ( = ?auto_167563 ?auto_167566 ) ) ( not ( = ?auto_167563 ?auto_167567 ) ) ( not ( = ?auto_167564 ?auto_167565 ) ) ( not ( = ?auto_167564 ?auto_167566 ) ) ( not ( = ?auto_167564 ?auto_167567 ) ) ( not ( = ?auto_167565 ?auto_167566 ) ) ( not ( = ?auto_167565 ?auto_167567 ) ) ( not ( = ?auto_167566 ?auto_167567 ) ) ( ON ?auto_167565 ?auto_167566 ) ( ON ?auto_167564 ?auto_167565 ) ( ON ?auto_167563 ?auto_167564 ) ( ON ?auto_167562 ?auto_167563 ) ( ON ?auto_167561 ?auto_167562 ) ( CLEAR ?auto_167559 ) ( ON ?auto_167560 ?auto_167561 ) ( CLEAR ?auto_167560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167559 ?auto_167560 )
      ( MAKE-8PILE ?auto_167559 ?auto_167560 ?auto_167561 ?auto_167562 ?auto_167563 ?auto_167564 ?auto_167565 ?auto_167566 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167576 - BLOCK
      ?auto_167577 - BLOCK
      ?auto_167578 - BLOCK
      ?auto_167579 - BLOCK
      ?auto_167580 - BLOCK
      ?auto_167581 - BLOCK
      ?auto_167582 - BLOCK
      ?auto_167583 - BLOCK
    )
    :vars
    (
      ?auto_167584 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167583 ?auto_167584 ) ( not ( = ?auto_167576 ?auto_167577 ) ) ( not ( = ?auto_167576 ?auto_167578 ) ) ( not ( = ?auto_167576 ?auto_167579 ) ) ( not ( = ?auto_167576 ?auto_167580 ) ) ( not ( = ?auto_167576 ?auto_167581 ) ) ( not ( = ?auto_167576 ?auto_167582 ) ) ( not ( = ?auto_167576 ?auto_167583 ) ) ( not ( = ?auto_167576 ?auto_167584 ) ) ( not ( = ?auto_167577 ?auto_167578 ) ) ( not ( = ?auto_167577 ?auto_167579 ) ) ( not ( = ?auto_167577 ?auto_167580 ) ) ( not ( = ?auto_167577 ?auto_167581 ) ) ( not ( = ?auto_167577 ?auto_167582 ) ) ( not ( = ?auto_167577 ?auto_167583 ) ) ( not ( = ?auto_167577 ?auto_167584 ) ) ( not ( = ?auto_167578 ?auto_167579 ) ) ( not ( = ?auto_167578 ?auto_167580 ) ) ( not ( = ?auto_167578 ?auto_167581 ) ) ( not ( = ?auto_167578 ?auto_167582 ) ) ( not ( = ?auto_167578 ?auto_167583 ) ) ( not ( = ?auto_167578 ?auto_167584 ) ) ( not ( = ?auto_167579 ?auto_167580 ) ) ( not ( = ?auto_167579 ?auto_167581 ) ) ( not ( = ?auto_167579 ?auto_167582 ) ) ( not ( = ?auto_167579 ?auto_167583 ) ) ( not ( = ?auto_167579 ?auto_167584 ) ) ( not ( = ?auto_167580 ?auto_167581 ) ) ( not ( = ?auto_167580 ?auto_167582 ) ) ( not ( = ?auto_167580 ?auto_167583 ) ) ( not ( = ?auto_167580 ?auto_167584 ) ) ( not ( = ?auto_167581 ?auto_167582 ) ) ( not ( = ?auto_167581 ?auto_167583 ) ) ( not ( = ?auto_167581 ?auto_167584 ) ) ( not ( = ?auto_167582 ?auto_167583 ) ) ( not ( = ?auto_167582 ?auto_167584 ) ) ( not ( = ?auto_167583 ?auto_167584 ) ) ( ON ?auto_167582 ?auto_167583 ) ( ON ?auto_167581 ?auto_167582 ) ( ON ?auto_167580 ?auto_167581 ) ( ON ?auto_167579 ?auto_167580 ) ( ON ?auto_167578 ?auto_167579 ) ( ON ?auto_167577 ?auto_167578 ) ( ON ?auto_167576 ?auto_167577 ) ( CLEAR ?auto_167576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167576 )
      ( MAKE-8PILE ?auto_167576 ?auto_167577 ?auto_167578 ?auto_167579 ?auto_167580 ?auto_167581 ?auto_167582 ?auto_167583 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_167593 - BLOCK
      ?auto_167594 - BLOCK
      ?auto_167595 - BLOCK
      ?auto_167596 - BLOCK
      ?auto_167597 - BLOCK
      ?auto_167598 - BLOCK
      ?auto_167599 - BLOCK
      ?auto_167600 - BLOCK
    )
    :vars
    (
      ?auto_167601 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167600 ?auto_167601 ) ( not ( = ?auto_167593 ?auto_167594 ) ) ( not ( = ?auto_167593 ?auto_167595 ) ) ( not ( = ?auto_167593 ?auto_167596 ) ) ( not ( = ?auto_167593 ?auto_167597 ) ) ( not ( = ?auto_167593 ?auto_167598 ) ) ( not ( = ?auto_167593 ?auto_167599 ) ) ( not ( = ?auto_167593 ?auto_167600 ) ) ( not ( = ?auto_167593 ?auto_167601 ) ) ( not ( = ?auto_167594 ?auto_167595 ) ) ( not ( = ?auto_167594 ?auto_167596 ) ) ( not ( = ?auto_167594 ?auto_167597 ) ) ( not ( = ?auto_167594 ?auto_167598 ) ) ( not ( = ?auto_167594 ?auto_167599 ) ) ( not ( = ?auto_167594 ?auto_167600 ) ) ( not ( = ?auto_167594 ?auto_167601 ) ) ( not ( = ?auto_167595 ?auto_167596 ) ) ( not ( = ?auto_167595 ?auto_167597 ) ) ( not ( = ?auto_167595 ?auto_167598 ) ) ( not ( = ?auto_167595 ?auto_167599 ) ) ( not ( = ?auto_167595 ?auto_167600 ) ) ( not ( = ?auto_167595 ?auto_167601 ) ) ( not ( = ?auto_167596 ?auto_167597 ) ) ( not ( = ?auto_167596 ?auto_167598 ) ) ( not ( = ?auto_167596 ?auto_167599 ) ) ( not ( = ?auto_167596 ?auto_167600 ) ) ( not ( = ?auto_167596 ?auto_167601 ) ) ( not ( = ?auto_167597 ?auto_167598 ) ) ( not ( = ?auto_167597 ?auto_167599 ) ) ( not ( = ?auto_167597 ?auto_167600 ) ) ( not ( = ?auto_167597 ?auto_167601 ) ) ( not ( = ?auto_167598 ?auto_167599 ) ) ( not ( = ?auto_167598 ?auto_167600 ) ) ( not ( = ?auto_167598 ?auto_167601 ) ) ( not ( = ?auto_167599 ?auto_167600 ) ) ( not ( = ?auto_167599 ?auto_167601 ) ) ( not ( = ?auto_167600 ?auto_167601 ) ) ( ON ?auto_167599 ?auto_167600 ) ( ON ?auto_167598 ?auto_167599 ) ( ON ?auto_167597 ?auto_167598 ) ( ON ?auto_167596 ?auto_167597 ) ( ON ?auto_167595 ?auto_167596 ) ( ON ?auto_167594 ?auto_167595 ) ( ON ?auto_167593 ?auto_167594 ) ( CLEAR ?auto_167593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167593 )
      ( MAKE-8PILE ?auto_167593 ?auto_167594 ?auto_167595 ?auto_167596 ?auto_167597 ?auto_167598 ?auto_167599 ?auto_167600 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167611 - BLOCK
      ?auto_167612 - BLOCK
      ?auto_167613 - BLOCK
      ?auto_167614 - BLOCK
      ?auto_167615 - BLOCK
      ?auto_167616 - BLOCK
      ?auto_167617 - BLOCK
      ?auto_167618 - BLOCK
      ?auto_167619 - BLOCK
    )
    :vars
    (
      ?auto_167620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167618 ) ( ON ?auto_167619 ?auto_167620 ) ( CLEAR ?auto_167619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167611 ) ( ON ?auto_167612 ?auto_167611 ) ( ON ?auto_167613 ?auto_167612 ) ( ON ?auto_167614 ?auto_167613 ) ( ON ?auto_167615 ?auto_167614 ) ( ON ?auto_167616 ?auto_167615 ) ( ON ?auto_167617 ?auto_167616 ) ( ON ?auto_167618 ?auto_167617 ) ( not ( = ?auto_167611 ?auto_167612 ) ) ( not ( = ?auto_167611 ?auto_167613 ) ) ( not ( = ?auto_167611 ?auto_167614 ) ) ( not ( = ?auto_167611 ?auto_167615 ) ) ( not ( = ?auto_167611 ?auto_167616 ) ) ( not ( = ?auto_167611 ?auto_167617 ) ) ( not ( = ?auto_167611 ?auto_167618 ) ) ( not ( = ?auto_167611 ?auto_167619 ) ) ( not ( = ?auto_167611 ?auto_167620 ) ) ( not ( = ?auto_167612 ?auto_167613 ) ) ( not ( = ?auto_167612 ?auto_167614 ) ) ( not ( = ?auto_167612 ?auto_167615 ) ) ( not ( = ?auto_167612 ?auto_167616 ) ) ( not ( = ?auto_167612 ?auto_167617 ) ) ( not ( = ?auto_167612 ?auto_167618 ) ) ( not ( = ?auto_167612 ?auto_167619 ) ) ( not ( = ?auto_167612 ?auto_167620 ) ) ( not ( = ?auto_167613 ?auto_167614 ) ) ( not ( = ?auto_167613 ?auto_167615 ) ) ( not ( = ?auto_167613 ?auto_167616 ) ) ( not ( = ?auto_167613 ?auto_167617 ) ) ( not ( = ?auto_167613 ?auto_167618 ) ) ( not ( = ?auto_167613 ?auto_167619 ) ) ( not ( = ?auto_167613 ?auto_167620 ) ) ( not ( = ?auto_167614 ?auto_167615 ) ) ( not ( = ?auto_167614 ?auto_167616 ) ) ( not ( = ?auto_167614 ?auto_167617 ) ) ( not ( = ?auto_167614 ?auto_167618 ) ) ( not ( = ?auto_167614 ?auto_167619 ) ) ( not ( = ?auto_167614 ?auto_167620 ) ) ( not ( = ?auto_167615 ?auto_167616 ) ) ( not ( = ?auto_167615 ?auto_167617 ) ) ( not ( = ?auto_167615 ?auto_167618 ) ) ( not ( = ?auto_167615 ?auto_167619 ) ) ( not ( = ?auto_167615 ?auto_167620 ) ) ( not ( = ?auto_167616 ?auto_167617 ) ) ( not ( = ?auto_167616 ?auto_167618 ) ) ( not ( = ?auto_167616 ?auto_167619 ) ) ( not ( = ?auto_167616 ?auto_167620 ) ) ( not ( = ?auto_167617 ?auto_167618 ) ) ( not ( = ?auto_167617 ?auto_167619 ) ) ( not ( = ?auto_167617 ?auto_167620 ) ) ( not ( = ?auto_167618 ?auto_167619 ) ) ( not ( = ?auto_167618 ?auto_167620 ) ) ( not ( = ?auto_167619 ?auto_167620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167619 ?auto_167620 )
      ( !STACK ?auto_167619 ?auto_167618 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167630 - BLOCK
      ?auto_167631 - BLOCK
      ?auto_167632 - BLOCK
      ?auto_167633 - BLOCK
      ?auto_167634 - BLOCK
      ?auto_167635 - BLOCK
      ?auto_167636 - BLOCK
      ?auto_167637 - BLOCK
      ?auto_167638 - BLOCK
    )
    :vars
    (
      ?auto_167639 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167637 ) ( ON ?auto_167638 ?auto_167639 ) ( CLEAR ?auto_167638 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167630 ) ( ON ?auto_167631 ?auto_167630 ) ( ON ?auto_167632 ?auto_167631 ) ( ON ?auto_167633 ?auto_167632 ) ( ON ?auto_167634 ?auto_167633 ) ( ON ?auto_167635 ?auto_167634 ) ( ON ?auto_167636 ?auto_167635 ) ( ON ?auto_167637 ?auto_167636 ) ( not ( = ?auto_167630 ?auto_167631 ) ) ( not ( = ?auto_167630 ?auto_167632 ) ) ( not ( = ?auto_167630 ?auto_167633 ) ) ( not ( = ?auto_167630 ?auto_167634 ) ) ( not ( = ?auto_167630 ?auto_167635 ) ) ( not ( = ?auto_167630 ?auto_167636 ) ) ( not ( = ?auto_167630 ?auto_167637 ) ) ( not ( = ?auto_167630 ?auto_167638 ) ) ( not ( = ?auto_167630 ?auto_167639 ) ) ( not ( = ?auto_167631 ?auto_167632 ) ) ( not ( = ?auto_167631 ?auto_167633 ) ) ( not ( = ?auto_167631 ?auto_167634 ) ) ( not ( = ?auto_167631 ?auto_167635 ) ) ( not ( = ?auto_167631 ?auto_167636 ) ) ( not ( = ?auto_167631 ?auto_167637 ) ) ( not ( = ?auto_167631 ?auto_167638 ) ) ( not ( = ?auto_167631 ?auto_167639 ) ) ( not ( = ?auto_167632 ?auto_167633 ) ) ( not ( = ?auto_167632 ?auto_167634 ) ) ( not ( = ?auto_167632 ?auto_167635 ) ) ( not ( = ?auto_167632 ?auto_167636 ) ) ( not ( = ?auto_167632 ?auto_167637 ) ) ( not ( = ?auto_167632 ?auto_167638 ) ) ( not ( = ?auto_167632 ?auto_167639 ) ) ( not ( = ?auto_167633 ?auto_167634 ) ) ( not ( = ?auto_167633 ?auto_167635 ) ) ( not ( = ?auto_167633 ?auto_167636 ) ) ( not ( = ?auto_167633 ?auto_167637 ) ) ( not ( = ?auto_167633 ?auto_167638 ) ) ( not ( = ?auto_167633 ?auto_167639 ) ) ( not ( = ?auto_167634 ?auto_167635 ) ) ( not ( = ?auto_167634 ?auto_167636 ) ) ( not ( = ?auto_167634 ?auto_167637 ) ) ( not ( = ?auto_167634 ?auto_167638 ) ) ( not ( = ?auto_167634 ?auto_167639 ) ) ( not ( = ?auto_167635 ?auto_167636 ) ) ( not ( = ?auto_167635 ?auto_167637 ) ) ( not ( = ?auto_167635 ?auto_167638 ) ) ( not ( = ?auto_167635 ?auto_167639 ) ) ( not ( = ?auto_167636 ?auto_167637 ) ) ( not ( = ?auto_167636 ?auto_167638 ) ) ( not ( = ?auto_167636 ?auto_167639 ) ) ( not ( = ?auto_167637 ?auto_167638 ) ) ( not ( = ?auto_167637 ?auto_167639 ) ) ( not ( = ?auto_167638 ?auto_167639 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167638 ?auto_167639 )
      ( !STACK ?auto_167638 ?auto_167637 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167649 - BLOCK
      ?auto_167650 - BLOCK
      ?auto_167651 - BLOCK
      ?auto_167652 - BLOCK
      ?auto_167653 - BLOCK
      ?auto_167654 - BLOCK
      ?auto_167655 - BLOCK
      ?auto_167656 - BLOCK
      ?auto_167657 - BLOCK
    )
    :vars
    (
      ?auto_167658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167657 ?auto_167658 ) ( ON-TABLE ?auto_167649 ) ( ON ?auto_167650 ?auto_167649 ) ( ON ?auto_167651 ?auto_167650 ) ( ON ?auto_167652 ?auto_167651 ) ( ON ?auto_167653 ?auto_167652 ) ( ON ?auto_167654 ?auto_167653 ) ( ON ?auto_167655 ?auto_167654 ) ( not ( = ?auto_167649 ?auto_167650 ) ) ( not ( = ?auto_167649 ?auto_167651 ) ) ( not ( = ?auto_167649 ?auto_167652 ) ) ( not ( = ?auto_167649 ?auto_167653 ) ) ( not ( = ?auto_167649 ?auto_167654 ) ) ( not ( = ?auto_167649 ?auto_167655 ) ) ( not ( = ?auto_167649 ?auto_167656 ) ) ( not ( = ?auto_167649 ?auto_167657 ) ) ( not ( = ?auto_167649 ?auto_167658 ) ) ( not ( = ?auto_167650 ?auto_167651 ) ) ( not ( = ?auto_167650 ?auto_167652 ) ) ( not ( = ?auto_167650 ?auto_167653 ) ) ( not ( = ?auto_167650 ?auto_167654 ) ) ( not ( = ?auto_167650 ?auto_167655 ) ) ( not ( = ?auto_167650 ?auto_167656 ) ) ( not ( = ?auto_167650 ?auto_167657 ) ) ( not ( = ?auto_167650 ?auto_167658 ) ) ( not ( = ?auto_167651 ?auto_167652 ) ) ( not ( = ?auto_167651 ?auto_167653 ) ) ( not ( = ?auto_167651 ?auto_167654 ) ) ( not ( = ?auto_167651 ?auto_167655 ) ) ( not ( = ?auto_167651 ?auto_167656 ) ) ( not ( = ?auto_167651 ?auto_167657 ) ) ( not ( = ?auto_167651 ?auto_167658 ) ) ( not ( = ?auto_167652 ?auto_167653 ) ) ( not ( = ?auto_167652 ?auto_167654 ) ) ( not ( = ?auto_167652 ?auto_167655 ) ) ( not ( = ?auto_167652 ?auto_167656 ) ) ( not ( = ?auto_167652 ?auto_167657 ) ) ( not ( = ?auto_167652 ?auto_167658 ) ) ( not ( = ?auto_167653 ?auto_167654 ) ) ( not ( = ?auto_167653 ?auto_167655 ) ) ( not ( = ?auto_167653 ?auto_167656 ) ) ( not ( = ?auto_167653 ?auto_167657 ) ) ( not ( = ?auto_167653 ?auto_167658 ) ) ( not ( = ?auto_167654 ?auto_167655 ) ) ( not ( = ?auto_167654 ?auto_167656 ) ) ( not ( = ?auto_167654 ?auto_167657 ) ) ( not ( = ?auto_167654 ?auto_167658 ) ) ( not ( = ?auto_167655 ?auto_167656 ) ) ( not ( = ?auto_167655 ?auto_167657 ) ) ( not ( = ?auto_167655 ?auto_167658 ) ) ( not ( = ?auto_167656 ?auto_167657 ) ) ( not ( = ?auto_167656 ?auto_167658 ) ) ( not ( = ?auto_167657 ?auto_167658 ) ) ( CLEAR ?auto_167655 ) ( ON ?auto_167656 ?auto_167657 ) ( CLEAR ?auto_167656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ?auto_167655 ?auto_167656 )
      ( MAKE-9PILE ?auto_167649 ?auto_167650 ?auto_167651 ?auto_167652 ?auto_167653 ?auto_167654 ?auto_167655 ?auto_167656 ?auto_167657 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167668 - BLOCK
      ?auto_167669 - BLOCK
      ?auto_167670 - BLOCK
      ?auto_167671 - BLOCK
      ?auto_167672 - BLOCK
      ?auto_167673 - BLOCK
      ?auto_167674 - BLOCK
      ?auto_167675 - BLOCK
      ?auto_167676 - BLOCK
    )
    :vars
    (
      ?auto_167677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167676 ?auto_167677 ) ( ON-TABLE ?auto_167668 ) ( ON ?auto_167669 ?auto_167668 ) ( ON ?auto_167670 ?auto_167669 ) ( ON ?auto_167671 ?auto_167670 ) ( ON ?auto_167672 ?auto_167671 ) ( ON ?auto_167673 ?auto_167672 ) ( ON ?auto_167674 ?auto_167673 ) ( not ( = ?auto_167668 ?auto_167669 ) ) ( not ( = ?auto_167668 ?auto_167670 ) ) ( not ( = ?auto_167668 ?auto_167671 ) ) ( not ( = ?auto_167668 ?auto_167672 ) ) ( not ( = ?auto_167668 ?auto_167673 ) ) ( not ( = ?auto_167668 ?auto_167674 ) ) ( not ( = ?auto_167668 ?auto_167675 ) ) ( not ( = ?auto_167668 ?auto_167676 ) ) ( not ( = ?auto_167668 ?auto_167677 ) ) ( not ( = ?auto_167669 ?auto_167670 ) ) ( not ( = ?auto_167669 ?auto_167671 ) ) ( not ( = ?auto_167669 ?auto_167672 ) ) ( not ( = ?auto_167669 ?auto_167673 ) ) ( not ( = ?auto_167669 ?auto_167674 ) ) ( not ( = ?auto_167669 ?auto_167675 ) ) ( not ( = ?auto_167669 ?auto_167676 ) ) ( not ( = ?auto_167669 ?auto_167677 ) ) ( not ( = ?auto_167670 ?auto_167671 ) ) ( not ( = ?auto_167670 ?auto_167672 ) ) ( not ( = ?auto_167670 ?auto_167673 ) ) ( not ( = ?auto_167670 ?auto_167674 ) ) ( not ( = ?auto_167670 ?auto_167675 ) ) ( not ( = ?auto_167670 ?auto_167676 ) ) ( not ( = ?auto_167670 ?auto_167677 ) ) ( not ( = ?auto_167671 ?auto_167672 ) ) ( not ( = ?auto_167671 ?auto_167673 ) ) ( not ( = ?auto_167671 ?auto_167674 ) ) ( not ( = ?auto_167671 ?auto_167675 ) ) ( not ( = ?auto_167671 ?auto_167676 ) ) ( not ( = ?auto_167671 ?auto_167677 ) ) ( not ( = ?auto_167672 ?auto_167673 ) ) ( not ( = ?auto_167672 ?auto_167674 ) ) ( not ( = ?auto_167672 ?auto_167675 ) ) ( not ( = ?auto_167672 ?auto_167676 ) ) ( not ( = ?auto_167672 ?auto_167677 ) ) ( not ( = ?auto_167673 ?auto_167674 ) ) ( not ( = ?auto_167673 ?auto_167675 ) ) ( not ( = ?auto_167673 ?auto_167676 ) ) ( not ( = ?auto_167673 ?auto_167677 ) ) ( not ( = ?auto_167674 ?auto_167675 ) ) ( not ( = ?auto_167674 ?auto_167676 ) ) ( not ( = ?auto_167674 ?auto_167677 ) ) ( not ( = ?auto_167675 ?auto_167676 ) ) ( not ( = ?auto_167675 ?auto_167677 ) ) ( not ( = ?auto_167676 ?auto_167677 ) ) ( CLEAR ?auto_167674 ) ( ON ?auto_167675 ?auto_167676 ) ( CLEAR ?auto_167675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_167668 ?auto_167669 ?auto_167670 ?auto_167671 ?auto_167672 ?auto_167673 ?auto_167674 ?auto_167675 )
      ( MAKE-9PILE ?auto_167668 ?auto_167669 ?auto_167670 ?auto_167671 ?auto_167672 ?auto_167673 ?auto_167674 ?auto_167675 ?auto_167676 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167687 - BLOCK
      ?auto_167688 - BLOCK
      ?auto_167689 - BLOCK
      ?auto_167690 - BLOCK
      ?auto_167691 - BLOCK
      ?auto_167692 - BLOCK
      ?auto_167693 - BLOCK
      ?auto_167694 - BLOCK
      ?auto_167695 - BLOCK
    )
    :vars
    (
      ?auto_167696 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167695 ?auto_167696 ) ( ON-TABLE ?auto_167687 ) ( ON ?auto_167688 ?auto_167687 ) ( ON ?auto_167689 ?auto_167688 ) ( ON ?auto_167690 ?auto_167689 ) ( ON ?auto_167691 ?auto_167690 ) ( ON ?auto_167692 ?auto_167691 ) ( not ( = ?auto_167687 ?auto_167688 ) ) ( not ( = ?auto_167687 ?auto_167689 ) ) ( not ( = ?auto_167687 ?auto_167690 ) ) ( not ( = ?auto_167687 ?auto_167691 ) ) ( not ( = ?auto_167687 ?auto_167692 ) ) ( not ( = ?auto_167687 ?auto_167693 ) ) ( not ( = ?auto_167687 ?auto_167694 ) ) ( not ( = ?auto_167687 ?auto_167695 ) ) ( not ( = ?auto_167687 ?auto_167696 ) ) ( not ( = ?auto_167688 ?auto_167689 ) ) ( not ( = ?auto_167688 ?auto_167690 ) ) ( not ( = ?auto_167688 ?auto_167691 ) ) ( not ( = ?auto_167688 ?auto_167692 ) ) ( not ( = ?auto_167688 ?auto_167693 ) ) ( not ( = ?auto_167688 ?auto_167694 ) ) ( not ( = ?auto_167688 ?auto_167695 ) ) ( not ( = ?auto_167688 ?auto_167696 ) ) ( not ( = ?auto_167689 ?auto_167690 ) ) ( not ( = ?auto_167689 ?auto_167691 ) ) ( not ( = ?auto_167689 ?auto_167692 ) ) ( not ( = ?auto_167689 ?auto_167693 ) ) ( not ( = ?auto_167689 ?auto_167694 ) ) ( not ( = ?auto_167689 ?auto_167695 ) ) ( not ( = ?auto_167689 ?auto_167696 ) ) ( not ( = ?auto_167690 ?auto_167691 ) ) ( not ( = ?auto_167690 ?auto_167692 ) ) ( not ( = ?auto_167690 ?auto_167693 ) ) ( not ( = ?auto_167690 ?auto_167694 ) ) ( not ( = ?auto_167690 ?auto_167695 ) ) ( not ( = ?auto_167690 ?auto_167696 ) ) ( not ( = ?auto_167691 ?auto_167692 ) ) ( not ( = ?auto_167691 ?auto_167693 ) ) ( not ( = ?auto_167691 ?auto_167694 ) ) ( not ( = ?auto_167691 ?auto_167695 ) ) ( not ( = ?auto_167691 ?auto_167696 ) ) ( not ( = ?auto_167692 ?auto_167693 ) ) ( not ( = ?auto_167692 ?auto_167694 ) ) ( not ( = ?auto_167692 ?auto_167695 ) ) ( not ( = ?auto_167692 ?auto_167696 ) ) ( not ( = ?auto_167693 ?auto_167694 ) ) ( not ( = ?auto_167693 ?auto_167695 ) ) ( not ( = ?auto_167693 ?auto_167696 ) ) ( not ( = ?auto_167694 ?auto_167695 ) ) ( not ( = ?auto_167694 ?auto_167696 ) ) ( not ( = ?auto_167695 ?auto_167696 ) ) ( ON ?auto_167694 ?auto_167695 ) ( CLEAR ?auto_167692 ) ( ON ?auto_167693 ?auto_167694 ) ( CLEAR ?auto_167693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ?auto_167691 ?auto_167692 ?auto_167693 )
      ( MAKE-9PILE ?auto_167687 ?auto_167688 ?auto_167689 ?auto_167690 ?auto_167691 ?auto_167692 ?auto_167693 ?auto_167694 ?auto_167695 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167706 - BLOCK
      ?auto_167707 - BLOCK
      ?auto_167708 - BLOCK
      ?auto_167709 - BLOCK
      ?auto_167710 - BLOCK
      ?auto_167711 - BLOCK
      ?auto_167712 - BLOCK
      ?auto_167713 - BLOCK
      ?auto_167714 - BLOCK
    )
    :vars
    (
      ?auto_167715 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167714 ?auto_167715 ) ( ON-TABLE ?auto_167706 ) ( ON ?auto_167707 ?auto_167706 ) ( ON ?auto_167708 ?auto_167707 ) ( ON ?auto_167709 ?auto_167708 ) ( ON ?auto_167710 ?auto_167709 ) ( ON ?auto_167711 ?auto_167710 ) ( not ( = ?auto_167706 ?auto_167707 ) ) ( not ( = ?auto_167706 ?auto_167708 ) ) ( not ( = ?auto_167706 ?auto_167709 ) ) ( not ( = ?auto_167706 ?auto_167710 ) ) ( not ( = ?auto_167706 ?auto_167711 ) ) ( not ( = ?auto_167706 ?auto_167712 ) ) ( not ( = ?auto_167706 ?auto_167713 ) ) ( not ( = ?auto_167706 ?auto_167714 ) ) ( not ( = ?auto_167706 ?auto_167715 ) ) ( not ( = ?auto_167707 ?auto_167708 ) ) ( not ( = ?auto_167707 ?auto_167709 ) ) ( not ( = ?auto_167707 ?auto_167710 ) ) ( not ( = ?auto_167707 ?auto_167711 ) ) ( not ( = ?auto_167707 ?auto_167712 ) ) ( not ( = ?auto_167707 ?auto_167713 ) ) ( not ( = ?auto_167707 ?auto_167714 ) ) ( not ( = ?auto_167707 ?auto_167715 ) ) ( not ( = ?auto_167708 ?auto_167709 ) ) ( not ( = ?auto_167708 ?auto_167710 ) ) ( not ( = ?auto_167708 ?auto_167711 ) ) ( not ( = ?auto_167708 ?auto_167712 ) ) ( not ( = ?auto_167708 ?auto_167713 ) ) ( not ( = ?auto_167708 ?auto_167714 ) ) ( not ( = ?auto_167708 ?auto_167715 ) ) ( not ( = ?auto_167709 ?auto_167710 ) ) ( not ( = ?auto_167709 ?auto_167711 ) ) ( not ( = ?auto_167709 ?auto_167712 ) ) ( not ( = ?auto_167709 ?auto_167713 ) ) ( not ( = ?auto_167709 ?auto_167714 ) ) ( not ( = ?auto_167709 ?auto_167715 ) ) ( not ( = ?auto_167710 ?auto_167711 ) ) ( not ( = ?auto_167710 ?auto_167712 ) ) ( not ( = ?auto_167710 ?auto_167713 ) ) ( not ( = ?auto_167710 ?auto_167714 ) ) ( not ( = ?auto_167710 ?auto_167715 ) ) ( not ( = ?auto_167711 ?auto_167712 ) ) ( not ( = ?auto_167711 ?auto_167713 ) ) ( not ( = ?auto_167711 ?auto_167714 ) ) ( not ( = ?auto_167711 ?auto_167715 ) ) ( not ( = ?auto_167712 ?auto_167713 ) ) ( not ( = ?auto_167712 ?auto_167714 ) ) ( not ( = ?auto_167712 ?auto_167715 ) ) ( not ( = ?auto_167713 ?auto_167714 ) ) ( not ( = ?auto_167713 ?auto_167715 ) ) ( not ( = ?auto_167714 ?auto_167715 ) ) ( ON ?auto_167713 ?auto_167714 ) ( CLEAR ?auto_167711 ) ( ON ?auto_167712 ?auto_167713 ) ( CLEAR ?auto_167712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_167706 ?auto_167707 ?auto_167708 ?auto_167709 ?auto_167710 ?auto_167711 ?auto_167712 )
      ( MAKE-9PILE ?auto_167706 ?auto_167707 ?auto_167708 ?auto_167709 ?auto_167710 ?auto_167711 ?auto_167712 ?auto_167713 ?auto_167714 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167725 - BLOCK
      ?auto_167726 - BLOCK
      ?auto_167727 - BLOCK
      ?auto_167728 - BLOCK
      ?auto_167729 - BLOCK
      ?auto_167730 - BLOCK
      ?auto_167731 - BLOCK
      ?auto_167732 - BLOCK
      ?auto_167733 - BLOCK
    )
    :vars
    (
      ?auto_167734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167733 ?auto_167734 ) ( ON-TABLE ?auto_167725 ) ( ON ?auto_167726 ?auto_167725 ) ( ON ?auto_167727 ?auto_167726 ) ( ON ?auto_167728 ?auto_167727 ) ( ON ?auto_167729 ?auto_167728 ) ( not ( = ?auto_167725 ?auto_167726 ) ) ( not ( = ?auto_167725 ?auto_167727 ) ) ( not ( = ?auto_167725 ?auto_167728 ) ) ( not ( = ?auto_167725 ?auto_167729 ) ) ( not ( = ?auto_167725 ?auto_167730 ) ) ( not ( = ?auto_167725 ?auto_167731 ) ) ( not ( = ?auto_167725 ?auto_167732 ) ) ( not ( = ?auto_167725 ?auto_167733 ) ) ( not ( = ?auto_167725 ?auto_167734 ) ) ( not ( = ?auto_167726 ?auto_167727 ) ) ( not ( = ?auto_167726 ?auto_167728 ) ) ( not ( = ?auto_167726 ?auto_167729 ) ) ( not ( = ?auto_167726 ?auto_167730 ) ) ( not ( = ?auto_167726 ?auto_167731 ) ) ( not ( = ?auto_167726 ?auto_167732 ) ) ( not ( = ?auto_167726 ?auto_167733 ) ) ( not ( = ?auto_167726 ?auto_167734 ) ) ( not ( = ?auto_167727 ?auto_167728 ) ) ( not ( = ?auto_167727 ?auto_167729 ) ) ( not ( = ?auto_167727 ?auto_167730 ) ) ( not ( = ?auto_167727 ?auto_167731 ) ) ( not ( = ?auto_167727 ?auto_167732 ) ) ( not ( = ?auto_167727 ?auto_167733 ) ) ( not ( = ?auto_167727 ?auto_167734 ) ) ( not ( = ?auto_167728 ?auto_167729 ) ) ( not ( = ?auto_167728 ?auto_167730 ) ) ( not ( = ?auto_167728 ?auto_167731 ) ) ( not ( = ?auto_167728 ?auto_167732 ) ) ( not ( = ?auto_167728 ?auto_167733 ) ) ( not ( = ?auto_167728 ?auto_167734 ) ) ( not ( = ?auto_167729 ?auto_167730 ) ) ( not ( = ?auto_167729 ?auto_167731 ) ) ( not ( = ?auto_167729 ?auto_167732 ) ) ( not ( = ?auto_167729 ?auto_167733 ) ) ( not ( = ?auto_167729 ?auto_167734 ) ) ( not ( = ?auto_167730 ?auto_167731 ) ) ( not ( = ?auto_167730 ?auto_167732 ) ) ( not ( = ?auto_167730 ?auto_167733 ) ) ( not ( = ?auto_167730 ?auto_167734 ) ) ( not ( = ?auto_167731 ?auto_167732 ) ) ( not ( = ?auto_167731 ?auto_167733 ) ) ( not ( = ?auto_167731 ?auto_167734 ) ) ( not ( = ?auto_167732 ?auto_167733 ) ) ( not ( = ?auto_167732 ?auto_167734 ) ) ( not ( = ?auto_167733 ?auto_167734 ) ) ( ON ?auto_167732 ?auto_167733 ) ( ON ?auto_167731 ?auto_167732 ) ( CLEAR ?auto_167729 ) ( ON ?auto_167730 ?auto_167731 ) ( CLEAR ?auto_167730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167725 ?auto_167726 ?auto_167727 ?auto_167728 ?auto_167729 ?auto_167730 )
      ( MAKE-9PILE ?auto_167725 ?auto_167726 ?auto_167727 ?auto_167728 ?auto_167729 ?auto_167730 ?auto_167731 ?auto_167732 ?auto_167733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167744 - BLOCK
      ?auto_167745 - BLOCK
      ?auto_167746 - BLOCK
      ?auto_167747 - BLOCK
      ?auto_167748 - BLOCK
      ?auto_167749 - BLOCK
      ?auto_167750 - BLOCK
      ?auto_167751 - BLOCK
      ?auto_167752 - BLOCK
    )
    :vars
    (
      ?auto_167753 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167752 ?auto_167753 ) ( ON-TABLE ?auto_167744 ) ( ON ?auto_167745 ?auto_167744 ) ( ON ?auto_167746 ?auto_167745 ) ( ON ?auto_167747 ?auto_167746 ) ( ON ?auto_167748 ?auto_167747 ) ( not ( = ?auto_167744 ?auto_167745 ) ) ( not ( = ?auto_167744 ?auto_167746 ) ) ( not ( = ?auto_167744 ?auto_167747 ) ) ( not ( = ?auto_167744 ?auto_167748 ) ) ( not ( = ?auto_167744 ?auto_167749 ) ) ( not ( = ?auto_167744 ?auto_167750 ) ) ( not ( = ?auto_167744 ?auto_167751 ) ) ( not ( = ?auto_167744 ?auto_167752 ) ) ( not ( = ?auto_167744 ?auto_167753 ) ) ( not ( = ?auto_167745 ?auto_167746 ) ) ( not ( = ?auto_167745 ?auto_167747 ) ) ( not ( = ?auto_167745 ?auto_167748 ) ) ( not ( = ?auto_167745 ?auto_167749 ) ) ( not ( = ?auto_167745 ?auto_167750 ) ) ( not ( = ?auto_167745 ?auto_167751 ) ) ( not ( = ?auto_167745 ?auto_167752 ) ) ( not ( = ?auto_167745 ?auto_167753 ) ) ( not ( = ?auto_167746 ?auto_167747 ) ) ( not ( = ?auto_167746 ?auto_167748 ) ) ( not ( = ?auto_167746 ?auto_167749 ) ) ( not ( = ?auto_167746 ?auto_167750 ) ) ( not ( = ?auto_167746 ?auto_167751 ) ) ( not ( = ?auto_167746 ?auto_167752 ) ) ( not ( = ?auto_167746 ?auto_167753 ) ) ( not ( = ?auto_167747 ?auto_167748 ) ) ( not ( = ?auto_167747 ?auto_167749 ) ) ( not ( = ?auto_167747 ?auto_167750 ) ) ( not ( = ?auto_167747 ?auto_167751 ) ) ( not ( = ?auto_167747 ?auto_167752 ) ) ( not ( = ?auto_167747 ?auto_167753 ) ) ( not ( = ?auto_167748 ?auto_167749 ) ) ( not ( = ?auto_167748 ?auto_167750 ) ) ( not ( = ?auto_167748 ?auto_167751 ) ) ( not ( = ?auto_167748 ?auto_167752 ) ) ( not ( = ?auto_167748 ?auto_167753 ) ) ( not ( = ?auto_167749 ?auto_167750 ) ) ( not ( = ?auto_167749 ?auto_167751 ) ) ( not ( = ?auto_167749 ?auto_167752 ) ) ( not ( = ?auto_167749 ?auto_167753 ) ) ( not ( = ?auto_167750 ?auto_167751 ) ) ( not ( = ?auto_167750 ?auto_167752 ) ) ( not ( = ?auto_167750 ?auto_167753 ) ) ( not ( = ?auto_167751 ?auto_167752 ) ) ( not ( = ?auto_167751 ?auto_167753 ) ) ( not ( = ?auto_167752 ?auto_167753 ) ) ( ON ?auto_167751 ?auto_167752 ) ( ON ?auto_167750 ?auto_167751 ) ( CLEAR ?auto_167748 ) ( ON ?auto_167749 ?auto_167750 ) ( CLEAR ?auto_167749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_167744 ?auto_167745 ?auto_167746 ?auto_167747 ?auto_167748 ?auto_167749 )
      ( MAKE-9PILE ?auto_167744 ?auto_167745 ?auto_167746 ?auto_167747 ?auto_167748 ?auto_167749 ?auto_167750 ?auto_167751 ?auto_167752 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167763 - BLOCK
      ?auto_167764 - BLOCK
      ?auto_167765 - BLOCK
      ?auto_167766 - BLOCK
      ?auto_167767 - BLOCK
      ?auto_167768 - BLOCK
      ?auto_167769 - BLOCK
      ?auto_167770 - BLOCK
      ?auto_167771 - BLOCK
    )
    :vars
    (
      ?auto_167772 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167771 ?auto_167772 ) ( ON-TABLE ?auto_167763 ) ( ON ?auto_167764 ?auto_167763 ) ( ON ?auto_167765 ?auto_167764 ) ( ON ?auto_167766 ?auto_167765 ) ( not ( = ?auto_167763 ?auto_167764 ) ) ( not ( = ?auto_167763 ?auto_167765 ) ) ( not ( = ?auto_167763 ?auto_167766 ) ) ( not ( = ?auto_167763 ?auto_167767 ) ) ( not ( = ?auto_167763 ?auto_167768 ) ) ( not ( = ?auto_167763 ?auto_167769 ) ) ( not ( = ?auto_167763 ?auto_167770 ) ) ( not ( = ?auto_167763 ?auto_167771 ) ) ( not ( = ?auto_167763 ?auto_167772 ) ) ( not ( = ?auto_167764 ?auto_167765 ) ) ( not ( = ?auto_167764 ?auto_167766 ) ) ( not ( = ?auto_167764 ?auto_167767 ) ) ( not ( = ?auto_167764 ?auto_167768 ) ) ( not ( = ?auto_167764 ?auto_167769 ) ) ( not ( = ?auto_167764 ?auto_167770 ) ) ( not ( = ?auto_167764 ?auto_167771 ) ) ( not ( = ?auto_167764 ?auto_167772 ) ) ( not ( = ?auto_167765 ?auto_167766 ) ) ( not ( = ?auto_167765 ?auto_167767 ) ) ( not ( = ?auto_167765 ?auto_167768 ) ) ( not ( = ?auto_167765 ?auto_167769 ) ) ( not ( = ?auto_167765 ?auto_167770 ) ) ( not ( = ?auto_167765 ?auto_167771 ) ) ( not ( = ?auto_167765 ?auto_167772 ) ) ( not ( = ?auto_167766 ?auto_167767 ) ) ( not ( = ?auto_167766 ?auto_167768 ) ) ( not ( = ?auto_167766 ?auto_167769 ) ) ( not ( = ?auto_167766 ?auto_167770 ) ) ( not ( = ?auto_167766 ?auto_167771 ) ) ( not ( = ?auto_167766 ?auto_167772 ) ) ( not ( = ?auto_167767 ?auto_167768 ) ) ( not ( = ?auto_167767 ?auto_167769 ) ) ( not ( = ?auto_167767 ?auto_167770 ) ) ( not ( = ?auto_167767 ?auto_167771 ) ) ( not ( = ?auto_167767 ?auto_167772 ) ) ( not ( = ?auto_167768 ?auto_167769 ) ) ( not ( = ?auto_167768 ?auto_167770 ) ) ( not ( = ?auto_167768 ?auto_167771 ) ) ( not ( = ?auto_167768 ?auto_167772 ) ) ( not ( = ?auto_167769 ?auto_167770 ) ) ( not ( = ?auto_167769 ?auto_167771 ) ) ( not ( = ?auto_167769 ?auto_167772 ) ) ( not ( = ?auto_167770 ?auto_167771 ) ) ( not ( = ?auto_167770 ?auto_167772 ) ) ( not ( = ?auto_167771 ?auto_167772 ) ) ( ON ?auto_167770 ?auto_167771 ) ( ON ?auto_167769 ?auto_167770 ) ( ON ?auto_167768 ?auto_167769 ) ( CLEAR ?auto_167766 ) ( ON ?auto_167767 ?auto_167768 ) ( CLEAR ?auto_167767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167763 ?auto_167764 ?auto_167765 ?auto_167766 ?auto_167767 )
      ( MAKE-9PILE ?auto_167763 ?auto_167764 ?auto_167765 ?auto_167766 ?auto_167767 ?auto_167768 ?auto_167769 ?auto_167770 ?auto_167771 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167782 - BLOCK
      ?auto_167783 - BLOCK
      ?auto_167784 - BLOCK
      ?auto_167785 - BLOCK
      ?auto_167786 - BLOCK
      ?auto_167787 - BLOCK
      ?auto_167788 - BLOCK
      ?auto_167789 - BLOCK
      ?auto_167790 - BLOCK
    )
    :vars
    (
      ?auto_167791 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167790 ?auto_167791 ) ( ON-TABLE ?auto_167782 ) ( ON ?auto_167783 ?auto_167782 ) ( ON ?auto_167784 ?auto_167783 ) ( ON ?auto_167785 ?auto_167784 ) ( not ( = ?auto_167782 ?auto_167783 ) ) ( not ( = ?auto_167782 ?auto_167784 ) ) ( not ( = ?auto_167782 ?auto_167785 ) ) ( not ( = ?auto_167782 ?auto_167786 ) ) ( not ( = ?auto_167782 ?auto_167787 ) ) ( not ( = ?auto_167782 ?auto_167788 ) ) ( not ( = ?auto_167782 ?auto_167789 ) ) ( not ( = ?auto_167782 ?auto_167790 ) ) ( not ( = ?auto_167782 ?auto_167791 ) ) ( not ( = ?auto_167783 ?auto_167784 ) ) ( not ( = ?auto_167783 ?auto_167785 ) ) ( not ( = ?auto_167783 ?auto_167786 ) ) ( not ( = ?auto_167783 ?auto_167787 ) ) ( not ( = ?auto_167783 ?auto_167788 ) ) ( not ( = ?auto_167783 ?auto_167789 ) ) ( not ( = ?auto_167783 ?auto_167790 ) ) ( not ( = ?auto_167783 ?auto_167791 ) ) ( not ( = ?auto_167784 ?auto_167785 ) ) ( not ( = ?auto_167784 ?auto_167786 ) ) ( not ( = ?auto_167784 ?auto_167787 ) ) ( not ( = ?auto_167784 ?auto_167788 ) ) ( not ( = ?auto_167784 ?auto_167789 ) ) ( not ( = ?auto_167784 ?auto_167790 ) ) ( not ( = ?auto_167784 ?auto_167791 ) ) ( not ( = ?auto_167785 ?auto_167786 ) ) ( not ( = ?auto_167785 ?auto_167787 ) ) ( not ( = ?auto_167785 ?auto_167788 ) ) ( not ( = ?auto_167785 ?auto_167789 ) ) ( not ( = ?auto_167785 ?auto_167790 ) ) ( not ( = ?auto_167785 ?auto_167791 ) ) ( not ( = ?auto_167786 ?auto_167787 ) ) ( not ( = ?auto_167786 ?auto_167788 ) ) ( not ( = ?auto_167786 ?auto_167789 ) ) ( not ( = ?auto_167786 ?auto_167790 ) ) ( not ( = ?auto_167786 ?auto_167791 ) ) ( not ( = ?auto_167787 ?auto_167788 ) ) ( not ( = ?auto_167787 ?auto_167789 ) ) ( not ( = ?auto_167787 ?auto_167790 ) ) ( not ( = ?auto_167787 ?auto_167791 ) ) ( not ( = ?auto_167788 ?auto_167789 ) ) ( not ( = ?auto_167788 ?auto_167790 ) ) ( not ( = ?auto_167788 ?auto_167791 ) ) ( not ( = ?auto_167789 ?auto_167790 ) ) ( not ( = ?auto_167789 ?auto_167791 ) ) ( not ( = ?auto_167790 ?auto_167791 ) ) ( ON ?auto_167789 ?auto_167790 ) ( ON ?auto_167788 ?auto_167789 ) ( ON ?auto_167787 ?auto_167788 ) ( CLEAR ?auto_167785 ) ( ON ?auto_167786 ?auto_167787 ) ( CLEAR ?auto_167786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_167782 ?auto_167783 ?auto_167784 ?auto_167785 ?auto_167786 )
      ( MAKE-9PILE ?auto_167782 ?auto_167783 ?auto_167784 ?auto_167785 ?auto_167786 ?auto_167787 ?auto_167788 ?auto_167789 ?auto_167790 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167801 - BLOCK
      ?auto_167802 - BLOCK
      ?auto_167803 - BLOCK
      ?auto_167804 - BLOCK
      ?auto_167805 - BLOCK
      ?auto_167806 - BLOCK
      ?auto_167807 - BLOCK
      ?auto_167808 - BLOCK
      ?auto_167809 - BLOCK
    )
    :vars
    (
      ?auto_167810 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167809 ?auto_167810 ) ( ON-TABLE ?auto_167801 ) ( ON ?auto_167802 ?auto_167801 ) ( ON ?auto_167803 ?auto_167802 ) ( not ( = ?auto_167801 ?auto_167802 ) ) ( not ( = ?auto_167801 ?auto_167803 ) ) ( not ( = ?auto_167801 ?auto_167804 ) ) ( not ( = ?auto_167801 ?auto_167805 ) ) ( not ( = ?auto_167801 ?auto_167806 ) ) ( not ( = ?auto_167801 ?auto_167807 ) ) ( not ( = ?auto_167801 ?auto_167808 ) ) ( not ( = ?auto_167801 ?auto_167809 ) ) ( not ( = ?auto_167801 ?auto_167810 ) ) ( not ( = ?auto_167802 ?auto_167803 ) ) ( not ( = ?auto_167802 ?auto_167804 ) ) ( not ( = ?auto_167802 ?auto_167805 ) ) ( not ( = ?auto_167802 ?auto_167806 ) ) ( not ( = ?auto_167802 ?auto_167807 ) ) ( not ( = ?auto_167802 ?auto_167808 ) ) ( not ( = ?auto_167802 ?auto_167809 ) ) ( not ( = ?auto_167802 ?auto_167810 ) ) ( not ( = ?auto_167803 ?auto_167804 ) ) ( not ( = ?auto_167803 ?auto_167805 ) ) ( not ( = ?auto_167803 ?auto_167806 ) ) ( not ( = ?auto_167803 ?auto_167807 ) ) ( not ( = ?auto_167803 ?auto_167808 ) ) ( not ( = ?auto_167803 ?auto_167809 ) ) ( not ( = ?auto_167803 ?auto_167810 ) ) ( not ( = ?auto_167804 ?auto_167805 ) ) ( not ( = ?auto_167804 ?auto_167806 ) ) ( not ( = ?auto_167804 ?auto_167807 ) ) ( not ( = ?auto_167804 ?auto_167808 ) ) ( not ( = ?auto_167804 ?auto_167809 ) ) ( not ( = ?auto_167804 ?auto_167810 ) ) ( not ( = ?auto_167805 ?auto_167806 ) ) ( not ( = ?auto_167805 ?auto_167807 ) ) ( not ( = ?auto_167805 ?auto_167808 ) ) ( not ( = ?auto_167805 ?auto_167809 ) ) ( not ( = ?auto_167805 ?auto_167810 ) ) ( not ( = ?auto_167806 ?auto_167807 ) ) ( not ( = ?auto_167806 ?auto_167808 ) ) ( not ( = ?auto_167806 ?auto_167809 ) ) ( not ( = ?auto_167806 ?auto_167810 ) ) ( not ( = ?auto_167807 ?auto_167808 ) ) ( not ( = ?auto_167807 ?auto_167809 ) ) ( not ( = ?auto_167807 ?auto_167810 ) ) ( not ( = ?auto_167808 ?auto_167809 ) ) ( not ( = ?auto_167808 ?auto_167810 ) ) ( not ( = ?auto_167809 ?auto_167810 ) ) ( ON ?auto_167808 ?auto_167809 ) ( ON ?auto_167807 ?auto_167808 ) ( ON ?auto_167806 ?auto_167807 ) ( ON ?auto_167805 ?auto_167806 ) ( CLEAR ?auto_167803 ) ( ON ?auto_167804 ?auto_167805 ) ( CLEAR ?auto_167804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167801 ?auto_167802 ?auto_167803 ?auto_167804 )
      ( MAKE-9PILE ?auto_167801 ?auto_167802 ?auto_167803 ?auto_167804 ?auto_167805 ?auto_167806 ?auto_167807 ?auto_167808 ?auto_167809 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167820 - BLOCK
      ?auto_167821 - BLOCK
      ?auto_167822 - BLOCK
      ?auto_167823 - BLOCK
      ?auto_167824 - BLOCK
      ?auto_167825 - BLOCK
      ?auto_167826 - BLOCK
      ?auto_167827 - BLOCK
      ?auto_167828 - BLOCK
    )
    :vars
    (
      ?auto_167829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167828 ?auto_167829 ) ( ON-TABLE ?auto_167820 ) ( ON ?auto_167821 ?auto_167820 ) ( ON ?auto_167822 ?auto_167821 ) ( not ( = ?auto_167820 ?auto_167821 ) ) ( not ( = ?auto_167820 ?auto_167822 ) ) ( not ( = ?auto_167820 ?auto_167823 ) ) ( not ( = ?auto_167820 ?auto_167824 ) ) ( not ( = ?auto_167820 ?auto_167825 ) ) ( not ( = ?auto_167820 ?auto_167826 ) ) ( not ( = ?auto_167820 ?auto_167827 ) ) ( not ( = ?auto_167820 ?auto_167828 ) ) ( not ( = ?auto_167820 ?auto_167829 ) ) ( not ( = ?auto_167821 ?auto_167822 ) ) ( not ( = ?auto_167821 ?auto_167823 ) ) ( not ( = ?auto_167821 ?auto_167824 ) ) ( not ( = ?auto_167821 ?auto_167825 ) ) ( not ( = ?auto_167821 ?auto_167826 ) ) ( not ( = ?auto_167821 ?auto_167827 ) ) ( not ( = ?auto_167821 ?auto_167828 ) ) ( not ( = ?auto_167821 ?auto_167829 ) ) ( not ( = ?auto_167822 ?auto_167823 ) ) ( not ( = ?auto_167822 ?auto_167824 ) ) ( not ( = ?auto_167822 ?auto_167825 ) ) ( not ( = ?auto_167822 ?auto_167826 ) ) ( not ( = ?auto_167822 ?auto_167827 ) ) ( not ( = ?auto_167822 ?auto_167828 ) ) ( not ( = ?auto_167822 ?auto_167829 ) ) ( not ( = ?auto_167823 ?auto_167824 ) ) ( not ( = ?auto_167823 ?auto_167825 ) ) ( not ( = ?auto_167823 ?auto_167826 ) ) ( not ( = ?auto_167823 ?auto_167827 ) ) ( not ( = ?auto_167823 ?auto_167828 ) ) ( not ( = ?auto_167823 ?auto_167829 ) ) ( not ( = ?auto_167824 ?auto_167825 ) ) ( not ( = ?auto_167824 ?auto_167826 ) ) ( not ( = ?auto_167824 ?auto_167827 ) ) ( not ( = ?auto_167824 ?auto_167828 ) ) ( not ( = ?auto_167824 ?auto_167829 ) ) ( not ( = ?auto_167825 ?auto_167826 ) ) ( not ( = ?auto_167825 ?auto_167827 ) ) ( not ( = ?auto_167825 ?auto_167828 ) ) ( not ( = ?auto_167825 ?auto_167829 ) ) ( not ( = ?auto_167826 ?auto_167827 ) ) ( not ( = ?auto_167826 ?auto_167828 ) ) ( not ( = ?auto_167826 ?auto_167829 ) ) ( not ( = ?auto_167827 ?auto_167828 ) ) ( not ( = ?auto_167827 ?auto_167829 ) ) ( not ( = ?auto_167828 ?auto_167829 ) ) ( ON ?auto_167827 ?auto_167828 ) ( ON ?auto_167826 ?auto_167827 ) ( ON ?auto_167825 ?auto_167826 ) ( ON ?auto_167824 ?auto_167825 ) ( CLEAR ?auto_167822 ) ( ON ?auto_167823 ?auto_167824 ) ( CLEAR ?auto_167823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_167820 ?auto_167821 ?auto_167822 ?auto_167823 )
      ( MAKE-9PILE ?auto_167820 ?auto_167821 ?auto_167822 ?auto_167823 ?auto_167824 ?auto_167825 ?auto_167826 ?auto_167827 ?auto_167828 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167839 - BLOCK
      ?auto_167840 - BLOCK
      ?auto_167841 - BLOCK
      ?auto_167842 - BLOCK
      ?auto_167843 - BLOCK
      ?auto_167844 - BLOCK
      ?auto_167845 - BLOCK
      ?auto_167846 - BLOCK
      ?auto_167847 - BLOCK
    )
    :vars
    (
      ?auto_167848 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167847 ?auto_167848 ) ( ON-TABLE ?auto_167839 ) ( ON ?auto_167840 ?auto_167839 ) ( not ( = ?auto_167839 ?auto_167840 ) ) ( not ( = ?auto_167839 ?auto_167841 ) ) ( not ( = ?auto_167839 ?auto_167842 ) ) ( not ( = ?auto_167839 ?auto_167843 ) ) ( not ( = ?auto_167839 ?auto_167844 ) ) ( not ( = ?auto_167839 ?auto_167845 ) ) ( not ( = ?auto_167839 ?auto_167846 ) ) ( not ( = ?auto_167839 ?auto_167847 ) ) ( not ( = ?auto_167839 ?auto_167848 ) ) ( not ( = ?auto_167840 ?auto_167841 ) ) ( not ( = ?auto_167840 ?auto_167842 ) ) ( not ( = ?auto_167840 ?auto_167843 ) ) ( not ( = ?auto_167840 ?auto_167844 ) ) ( not ( = ?auto_167840 ?auto_167845 ) ) ( not ( = ?auto_167840 ?auto_167846 ) ) ( not ( = ?auto_167840 ?auto_167847 ) ) ( not ( = ?auto_167840 ?auto_167848 ) ) ( not ( = ?auto_167841 ?auto_167842 ) ) ( not ( = ?auto_167841 ?auto_167843 ) ) ( not ( = ?auto_167841 ?auto_167844 ) ) ( not ( = ?auto_167841 ?auto_167845 ) ) ( not ( = ?auto_167841 ?auto_167846 ) ) ( not ( = ?auto_167841 ?auto_167847 ) ) ( not ( = ?auto_167841 ?auto_167848 ) ) ( not ( = ?auto_167842 ?auto_167843 ) ) ( not ( = ?auto_167842 ?auto_167844 ) ) ( not ( = ?auto_167842 ?auto_167845 ) ) ( not ( = ?auto_167842 ?auto_167846 ) ) ( not ( = ?auto_167842 ?auto_167847 ) ) ( not ( = ?auto_167842 ?auto_167848 ) ) ( not ( = ?auto_167843 ?auto_167844 ) ) ( not ( = ?auto_167843 ?auto_167845 ) ) ( not ( = ?auto_167843 ?auto_167846 ) ) ( not ( = ?auto_167843 ?auto_167847 ) ) ( not ( = ?auto_167843 ?auto_167848 ) ) ( not ( = ?auto_167844 ?auto_167845 ) ) ( not ( = ?auto_167844 ?auto_167846 ) ) ( not ( = ?auto_167844 ?auto_167847 ) ) ( not ( = ?auto_167844 ?auto_167848 ) ) ( not ( = ?auto_167845 ?auto_167846 ) ) ( not ( = ?auto_167845 ?auto_167847 ) ) ( not ( = ?auto_167845 ?auto_167848 ) ) ( not ( = ?auto_167846 ?auto_167847 ) ) ( not ( = ?auto_167846 ?auto_167848 ) ) ( not ( = ?auto_167847 ?auto_167848 ) ) ( ON ?auto_167846 ?auto_167847 ) ( ON ?auto_167845 ?auto_167846 ) ( ON ?auto_167844 ?auto_167845 ) ( ON ?auto_167843 ?auto_167844 ) ( ON ?auto_167842 ?auto_167843 ) ( CLEAR ?auto_167840 ) ( ON ?auto_167841 ?auto_167842 ) ( CLEAR ?auto_167841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167839 ?auto_167840 ?auto_167841 )
      ( MAKE-9PILE ?auto_167839 ?auto_167840 ?auto_167841 ?auto_167842 ?auto_167843 ?auto_167844 ?auto_167845 ?auto_167846 ?auto_167847 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167858 - BLOCK
      ?auto_167859 - BLOCK
      ?auto_167860 - BLOCK
      ?auto_167861 - BLOCK
      ?auto_167862 - BLOCK
      ?auto_167863 - BLOCK
      ?auto_167864 - BLOCK
      ?auto_167865 - BLOCK
      ?auto_167866 - BLOCK
    )
    :vars
    (
      ?auto_167867 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167866 ?auto_167867 ) ( ON-TABLE ?auto_167858 ) ( ON ?auto_167859 ?auto_167858 ) ( not ( = ?auto_167858 ?auto_167859 ) ) ( not ( = ?auto_167858 ?auto_167860 ) ) ( not ( = ?auto_167858 ?auto_167861 ) ) ( not ( = ?auto_167858 ?auto_167862 ) ) ( not ( = ?auto_167858 ?auto_167863 ) ) ( not ( = ?auto_167858 ?auto_167864 ) ) ( not ( = ?auto_167858 ?auto_167865 ) ) ( not ( = ?auto_167858 ?auto_167866 ) ) ( not ( = ?auto_167858 ?auto_167867 ) ) ( not ( = ?auto_167859 ?auto_167860 ) ) ( not ( = ?auto_167859 ?auto_167861 ) ) ( not ( = ?auto_167859 ?auto_167862 ) ) ( not ( = ?auto_167859 ?auto_167863 ) ) ( not ( = ?auto_167859 ?auto_167864 ) ) ( not ( = ?auto_167859 ?auto_167865 ) ) ( not ( = ?auto_167859 ?auto_167866 ) ) ( not ( = ?auto_167859 ?auto_167867 ) ) ( not ( = ?auto_167860 ?auto_167861 ) ) ( not ( = ?auto_167860 ?auto_167862 ) ) ( not ( = ?auto_167860 ?auto_167863 ) ) ( not ( = ?auto_167860 ?auto_167864 ) ) ( not ( = ?auto_167860 ?auto_167865 ) ) ( not ( = ?auto_167860 ?auto_167866 ) ) ( not ( = ?auto_167860 ?auto_167867 ) ) ( not ( = ?auto_167861 ?auto_167862 ) ) ( not ( = ?auto_167861 ?auto_167863 ) ) ( not ( = ?auto_167861 ?auto_167864 ) ) ( not ( = ?auto_167861 ?auto_167865 ) ) ( not ( = ?auto_167861 ?auto_167866 ) ) ( not ( = ?auto_167861 ?auto_167867 ) ) ( not ( = ?auto_167862 ?auto_167863 ) ) ( not ( = ?auto_167862 ?auto_167864 ) ) ( not ( = ?auto_167862 ?auto_167865 ) ) ( not ( = ?auto_167862 ?auto_167866 ) ) ( not ( = ?auto_167862 ?auto_167867 ) ) ( not ( = ?auto_167863 ?auto_167864 ) ) ( not ( = ?auto_167863 ?auto_167865 ) ) ( not ( = ?auto_167863 ?auto_167866 ) ) ( not ( = ?auto_167863 ?auto_167867 ) ) ( not ( = ?auto_167864 ?auto_167865 ) ) ( not ( = ?auto_167864 ?auto_167866 ) ) ( not ( = ?auto_167864 ?auto_167867 ) ) ( not ( = ?auto_167865 ?auto_167866 ) ) ( not ( = ?auto_167865 ?auto_167867 ) ) ( not ( = ?auto_167866 ?auto_167867 ) ) ( ON ?auto_167865 ?auto_167866 ) ( ON ?auto_167864 ?auto_167865 ) ( ON ?auto_167863 ?auto_167864 ) ( ON ?auto_167862 ?auto_167863 ) ( ON ?auto_167861 ?auto_167862 ) ( CLEAR ?auto_167859 ) ( ON ?auto_167860 ?auto_167861 ) ( CLEAR ?auto_167860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_167858 ?auto_167859 ?auto_167860 )
      ( MAKE-9PILE ?auto_167858 ?auto_167859 ?auto_167860 ?auto_167861 ?auto_167862 ?auto_167863 ?auto_167864 ?auto_167865 ?auto_167866 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167877 - BLOCK
      ?auto_167878 - BLOCK
      ?auto_167879 - BLOCK
      ?auto_167880 - BLOCK
      ?auto_167881 - BLOCK
      ?auto_167882 - BLOCK
      ?auto_167883 - BLOCK
      ?auto_167884 - BLOCK
      ?auto_167885 - BLOCK
    )
    :vars
    (
      ?auto_167886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167885 ?auto_167886 ) ( ON-TABLE ?auto_167877 ) ( not ( = ?auto_167877 ?auto_167878 ) ) ( not ( = ?auto_167877 ?auto_167879 ) ) ( not ( = ?auto_167877 ?auto_167880 ) ) ( not ( = ?auto_167877 ?auto_167881 ) ) ( not ( = ?auto_167877 ?auto_167882 ) ) ( not ( = ?auto_167877 ?auto_167883 ) ) ( not ( = ?auto_167877 ?auto_167884 ) ) ( not ( = ?auto_167877 ?auto_167885 ) ) ( not ( = ?auto_167877 ?auto_167886 ) ) ( not ( = ?auto_167878 ?auto_167879 ) ) ( not ( = ?auto_167878 ?auto_167880 ) ) ( not ( = ?auto_167878 ?auto_167881 ) ) ( not ( = ?auto_167878 ?auto_167882 ) ) ( not ( = ?auto_167878 ?auto_167883 ) ) ( not ( = ?auto_167878 ?auto_167884 ) ) ( not ( = ?auto_167878 ?auto_167885 ) ) ( not ( = ?auto_167878 ?auto_167886 ) ) ( not ( = ?auto_167879 ?auto_167880 ) ) ( not ( = ?auto_167879 ?auto_167881 ) ) ( not ( = ?auto_167879 ?auto_167882 ) ) ( not ( = ?auto_167879 ?auto_167883 ) ) ( not ( = ?auto_167879 ?auto_167884 ) ) ( not ( = ?auto_167879 ?auto_167885 ) ) ( not ( = ?auto_167879 ?auto_167886 ) ) ( not ( = ?auto_167880 ?auto_167881 ) ) ( not ( = ?auto_167880 ?auto_167882 ) ) ( not ( = ?auto_167880 ?auto_167883 ) ) ( not ( = ?auto_167880 ?auto_167884 ) ) ( not ( = ?auto_167880 ?auto_167885 ) ) ( not ( = ?auto_167880 ?auto_167886 ) ) ( not ( = ?auto_167881 ?auto_167882 ) ) ( not ( = ?auto_167881 ?auto_167883 ) ) ( not ( = ?auto_167881 ?auto_167884 ) ) ( not ( = ?auto_167881 ?auto_167885 ) ) ( not ( = ?auto_167881 ?auto_167886 ) ) ( not ( = ?auto_167882 ?auto_167883 ) ) ( not ( = ?auto_167882 ?auto_167884 ) ) ( not ( = ?auto_167882 ?auto_167885 ) ) ( not ( = ?auto_167882 ?auto_167886 ) ) ( not ( = ?auto_167883 ?auto_167884 ) ) ( not ( = ?auto_167883 ?auto_167885 ) ) ( not ( = ?auto_167883 ?auto_167886 ) ) ( not ( = ?auto_167884 ?auto_167885 ) ) ( not ( = ?auto_167884 ?auto_167886 ) ) ( not ( = ?auto_167885 ?auto_167886 ) ) ( ON ?auto_167884 ?auto_167885 ) ( ON ?auto_167883 ?auto_167884 ) ( ON ?auto_167882 ?auto_167883 ) ( ON ?auto_167881 ?auto_167882 ) ( ON ?auto_167880 ?auto_167881 ) ( ON ?auto_167879 ?auto_167880 ) ( CLEAR ?auto_167877 ) ( ON ?auto_167878 ?auto_167879 ) ( CLEAR ?auto_167878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167877 ?auto_167878 )
      ( MAKE-9PILE ?auto_167877 ?auto_167878 ?auto_167879 ?auto_167880 ?auto_167881 ?auto_167882 ?auto_167883 ?auto_167884 ?auto_167885 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167896 - BLOCK
      ?auto_167897 - BLOCK
      ?auto_167898 - BLOCK
      ?auto_167899 - BLOCK
      ?auto_167900 - BLOCK
      ?auto_167901 - BLOCK
      ?auto_167902 - BLOCK
      ?auto_167903 - BLOCK
      ?auto_167904 - BLOCK
    )
    :vars
    (
      ?auto_167905 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167904 ?auto_167905 ) ( ON-TABLE ?auto_167896 ) ( not ( = ?auto_167896 ?auto_167897 ) ) ( not ( = ?auto_167896 ?auto_167898 ) ) ( not ( = ?auto_167896 ?auto_167899 ) ) ( not ( = ?auto_167896 ?auto_167900 ) ) ( not ( = ?auto_167896 ?auto_167901 ) ) ( not ( = ?auto_167896 ?auto_167902 ) ) ( not ( = ?auto_167896 ?auto_167903 ) ) ( not ( = ?auto_167896 ?auto_167904 ) ) ( not ( = ?auto_167896 ?auto_167905 ) ) ( not ( = ?auto_167897 ?auto_167898 ) ) ( not ( = ?auto_167897 ?auto_167899 ) ) ( not ( = ?auto_167897 ?auto_167900 ) ) ( not ( = ?auto_167897 ?auto_167901 ) ) ( not ( = ?auto_167897 ?auto_167902 ) ) ( not ( = ?auto_167897 ?auto_167903 ) ) ( not ( = ?auto_167897 ?auto_167904 ) ) ( not ( = ?auto_167897 ?auto_167905 ) ) ( not ( = ?auto_167898 ?auto_167899 ) ) ( not ( = ?auto_167898 ?auto_167900 ) ) ( not ( = ?auto_167898 ?auto_167901 ) ) ( not ( = ?auto_167898 ?auto_167902 ) ) ( not ( = ?auto_167898 ?auto_167903 ) ) ( not ( = ?auto_167898 ?auto_167904 ) ) ( not ( = ?auto_167898 ?auto_167905 ) ) ( not ( = ?auto_167899 ?auto_167900 ) ) ( not ( = ?auto_167899 ?auto_167901 ) ) ( not ( = ?auto_167899 ?auto_167902 ) ) ( not ( = ?auto_167899 ?auto_167903 ) ) ( not ( = ?auto_167899 ?auto_167904 ) ) ( not ( = ?auto_167899 ?auto_167905 ) ) ( not ( = ?auto_167900 ?auto_167901 ) ) ( not ( = ?auto_167900 ?auto_167902 ) ) ( not ( = ?auto_167900 ?auto_167903 ) ) ( not ( = ?auto_167900 ?auto_167904 ) ) ( not ( = ?auto_167900 ?auto_167905 ) ) ( not ( = ?auto_167901 ?auto_167902 ) ) ( not ( = ?auto_167901 ?auto_167903 ) ) ( not ( = ?auto_167901 ?auto_167904 ) ) ( not ( = ?auto_167901 ?auto_167905 ) ) ( not ( = ?auto_167902 ?auto_167903 ) ) ( not ( = ?auto_167902 ?auto_167904 ) ) ( not ( = ?auto_167902 ?auto_167905 ) ) ( not ( = ?auto_167903 ?auto_167904 ) ) ( not ( = ?auto_167903 ?auto_167905 ) ) ( not ( = ?auto_167904 ?auto_167905 ) ) ( ON ?auto_167903 ?auto_167904 ) ( ON ?auto_167902 ?auto_167903 ) ( ON ?auto_167901 ?auto_167902 ) ( ON ?auto_167900 ?auto_167901 ) ( ON ?auto_167899 ?auto_167900 ) ( ON ?auto_167898 ?auto_167899 ) ( CLEAR ?auto_167896 ) ( ON ?auto_167897 ?auto_167898 ) ( CLEAR ?auto_167897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_167896 ?auto_167897 )
      ( MAKE-9PILE ?auto_167896 ?auto_167897 ?auto_167898 ?auto_167899 ?auto_167900 ?auto_167901 ?auto_167902 ?auto_167903 ?auto_167904 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167915 - BLOCK
      ?auto_167916 - BLOCK
      ?auto_167917 - BLOCK
      ?auto_167918 - BLOCK
      ?auto_167919 - BLOCK
      ?auto_167920 - BLOCK
      ?auto_167921 - BLOCK
      ?auto_167922 - BLOCK
      ?auto_167923 - BLOCK
    )
    :vars
    (
      ?auto_167924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167923 ?auto_167924 ) ( not ( = ?auto_167915 ?auto_167916 ) ) ( not ( = ?auto_167915 ?auto_167917 ) ) ( not ( = ?auto_167915 ?auto_167918 ) ) ( not ( = ?auto_167915 ?auto_167919 ) ) ( not ( = ?auto_167915 ?auto_167920 ) ) ( not ( = ?auto_167915 ?auto_167921 ) ) ( not ( = ?auto_167915 ?auto_167922 ) ) ( not ( = ?auto_167915 ?auto_167923 ) ) ( not ( = ?auto_167915 ?auto_167924 ) ) ( not ( = ?auto_167916 ?auto_167917 ) ) ( not ( = ?auto_167916 ?auto_167918 ) ) ( not ( = ?auto_167916 ?auto_167919 ) ) ( not ( = ?auto_167916 ?auto_167920 ) ) ( not ( = ?auto_167916 ?auto_167921 ) ) ( not ( = ?auto_167916 ?auto_167922 ) ) ( not ( = ?auto_167916 ?auto_167923 ) ) ( not ( = ?auto_167916 ?auto_167924 ) ) ( not ( = ?auto_167917 ?auto_167918 ) ) ( not ( = ?auto_167917 ?auto_167919 ) ) ( not ( = ?auto_167917 ?auto_167920 ) ) ( not ( = ?auto_167917 ?auto_167921 ) ) ( not ( = ?auto_167917 ?auto_167922 ) ) ( not ( = ?auto_167917 ?auto_167923 ) ) ( not ( = ?auto_167917 ?auto_167924 ) ) ( not ( = ?auto_167918 ?auto_167919 ) ) ( not ( = ?auto_167918 ?auto_167920 ) ) ( not ( = ?auto_167918 ?auto_167921 ) ) ( not ( = ?auto_167918 ?auto_167922 ) ) ( not ( = ?auto_167918 ?auto_167923 ) ) ( not ( = ?auto_167918 ?auto_167924 ) ) ( not ( = ?auto_167919 ?auto_167920 ) ) ( not ( = ?auto_167919 ?auto_167921 ) ) ( not ( = ?auto_167919 ?auto_167922 ) ) ( not ( = ?auto_167919 ?auto_167923 ) ) ( not ( = ?auto_167919 ?auto_167924 ) ) ( not ( = ?auto_167920 ?auto_167921 ) ) ( not ( = ?auto_167920 ?auto_167922 ) ) ( not ( = ?auto_167920 ?auto_167923 ) ) ( not ( = ?auto_167920 ?auto_167924 ) ) ( not ( = ?auto_167921 ?auto_167922 ) ) ( not ( = ?auto_167921 ?auto_167923 ) ) ( not ( = ?auto_167921 ?auto_167924 ) ) ( not ( = ?auto_167922 ?auto_167923 ) ) ( not ( = ?auto_167922 ?auto_167924 ) ) ( not ( = ?auto_167923 ?auto_167924 ) ) ( ON ?auto_167922 ?auto_167923 ) ( ON ?auto_167921 ?auto_167922 ) ( ON ?auto_167920 ?auto_167921 ) ( ON ?auto_167919 ?auto_167920 ) ( ON ?auto_167918 ?auto_167919 ) ( ON ?auto_167917 ?auto_167918 ) ( ON ?auto_167916 ?auto_167917 ) ( ON ?auto_167915 ?auto_167916 ) ( CLEAR ?auto_167915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167915 )
      ( MAKE-9PILE ?auto_167915 ?auto_167916 ?auto_167917 ?auto_167918 ?auto_167919 ?auto_167920 ?auto_167921 ?auto_167922 ?auto_167923 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_167934 - BLOCK
      ?auto_167935 - BLOCK
      ?auto_167936 - BLOCK
      ?auto_167937 - BLOCK
      ?auto_167938 - BLOCK
      ?auto_167939 - BLOCK
      ?auto_167940 - BLOCK
      ?auto_167941 - BLOCK
      ?auto_167942 - BLOCK
    )
    :vars
    (
      ?auto_167943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_167942 ?auto_167943 ) ( not ( = ?auto_167934 ?auto_167935 ) ) ( not ( = ?auto_167934 ?auto_167936 ) ) ( not ( = ?auto_167934 ?auto_167937 ) ) ( not ( = ?auto_167934 ?auto_167938 ) ) ( not ( = ?auto_167934 ?auto_167939 ) ) ( not ( = ?auto_167934 ?auto_167940 ) ) ( not ( = ?auto_167934 ?auto_167941 ) ) ( not ( = ?auto_167934 ?auto_167942 ) ) ( not ( = ?auto_167934 ?auto_167943 ) ) ( not ( = ?auto_167935 ?auto_167936 ) ) ( not ( = ?auto_167935 ?auto_167937 ) ) ( not ( = ?auto_167935 ?auto_167938 ) ) ( not ( = ?auto_167935 ?auto_167939 ) ) ( not ( = ?auto_167935 ?auto_167940 ) ) ( not ( = ?auto_167935 ?auto_167941 ) ) ( not ( = ?auto_167935 ?auto_167942 ) ) ( not ( = ?auto_167935 ?auto_167943 ) ) ( not ( = ?auto_167936 ?auto_167937 ) ) ( not ( = ?auto_167936 ?auto_167938 ) ) ( not ( = ?auto_167936 ?auto_167939 ) ) ( not ( = ?auto_167936 ?auto_167940 ) ) ( not ( = ?auto_167936 ?auto_167941 ) ) ( not ( = ?auto_167936 ?auto_167942 ) ) ( not ( = ?auto_167936 ?auto_167943 ) ) ( not ( = ?auto_167937 ?auto_167938 ) ) ( not ( = ?auto_167937 ?auto_167939 ) ) ( not ( = ?auto_167937 ?auto_167940 ) ) ( not ( = ?auto_167937 ?auto_167941 ) ) ( not ( = ?auto_167937 ?auto_167942 ) ) ( not ( = ?auto_167937 ?auto_167943 ) ) ( not ( = ?auto_167938 ?auto_167939 ) ) ( not ( = ?auto_167938 ?auto_167940 ) ) ( not ( = ?auto_167938 ?auto_167941 ) ) ( not ( = ?auto_167938 ?auto_167942 ) ) ( not ( = ?auto_167938 ?auto_167943 ) ) ( not ( = ?auto_167939 ?auto_167940 ) ) ( not ( = ?auto_167939 ?auto_167941 ) ) ( not ( = ?auto_167939 ?auto_167942 ) ) ( not ( = ?auto_167939 ?auto_167943 ) ) ( not ( = ?auto_167940 ?auto_167941 ) ) ( not ( = ?auto_167940 ?auto_167942 ) ) ( not ( = ?auto_167940 ?auto_167943 ) ) ( not ( = ?auto_167941 ?auto_167942 ) ) ( not ( = ?auto_167941 ?auto_167943 ) ) ( not ( = ?auto_167942 ?auto_167943 ) ) ( ON ?auto_167941 ?auto_167942 ) ( ON ?auto_167940 ?auto_167941 ) ( ON ?auto_167939 ?auto_167940 ) ( ON ?auto_167938 ?auto_167939 ) ( ON ?auto_167937 ?auto_167938 ) ( ON ?auto_167936 ?auto_167937 ) ( ON ?auto_167935 ?auto_167936 ) ( ON ?auto_167934 ?auto_167935 ) ( CLEAR ?auto_167934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_167934 )
      ( MAKE-9PILE ?auto_167934 ?auto_167935 ?auto_167936 ?auto_167937 ?auto_167938 ?auto_167939 ?auto_167940 ?auto_167941 ?auto_167942 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_167954 - BLOCK
      ?auto_167955 - BLOCK
      ?auto_167956 - BLOCK
      ?auto_167957 - BLOCK
      ?auto_167958 - BLOCK
      ?auto_167959 - BLOCK
      ?auto_167960 - BLOCK
      ?auto_167961 - BLOCK
      ?auto_167962 - BLOCK
      ?auto_167963 - BLOCK
    )
    :vars
    (
      ?auto_167964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167962 ) ( ON ?auto_167963 ?auto_167964 ) ( CLEAR ?auto_167963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167954 ) ( ON ?auto_167955 ?auto_167954 ) ( ON ?auto_167956 ?auto_167955 ) ( ON ?auto_167957 ?auto_167956 ) ( ON ?auto_167958 ?auto_167957 ) ( ON ?auto_167959 ?auto_167958 ) ( ON ?auto_167960 ?auto_167959 ) ( ON ?auto_167961 ?auto_167960 ) ( ON ?auto_167962 ?auto_167961 ) ( not ( = ?auto_167954 ?auto_167955 ) ) ( not ( = ?auto_167954 ?auto_167956 ) ) ( not ( = ?auto_167954 ?auto_167957 ) ) ( not ( = ?auto_167954 ?auto_167958 ) ) ( not ( = ?auto_167954 ?auto_167959 ) ) ( not ( = ?auto_167954 ?auto_167960 ) ) ( not ( = ?auto_167954 ?auto_167961 ) ) ( not ( = ?auto_167954 ?auto_167962 ) ) ( not ( = ?auto_167954 ?auto_167963 ) ) ( not ( = ?auto_167954 ?auto_167964 ) ) ( not ( = ?auto_167955 ?auto_167956 ) ) ( not ( = ?auto_167955 ?auto_167957 ) ) ( not ( = ?auto_167955 ?auto_167958 ) ) ( not ( = ?auto_167955 ?auto_167959 ) ) ( not ( = ?auto_167955 ?auto_167960 ) ) ( not ( = ?auto_167955 ?auto_167961 ) ) ( not ( = ?auto_167955 ?auto_167962 ) ) ( not ( = ?auto_167955 ?auto_167963 ) ) ( not ( = ?auto_167955 ?auto_167964 ) ) ( not ( = ?auto_167956 ?auto_167957 ) ) ( not ( = ?auto_167956 ?auto_167958 ) ) ( not ( = ?auto_167956 ?auto_167959 ) ) ( not ( = ?auto_167956 ?auto_167960 ) ) ( not ( = ?auto_167956 ?auto_167961 ) ) ( not ( = ?auto_167956 ?auto_167962 ) ) ( not ( = ?auto_167956 ?auto_167963 ) ) ( not ( = ?auto_167956 ?auto_167964 ) ) ( not ( = ?auto_167957 ?auto_167958 ) ) ( not ( = ?auto_167957 ?auto_167959 ) ) ( not ( = ?auto_167957 ?auto_167960 ) ) ( not ( = ?auto_167957 ?auto_167961 ) ) ( not ( = ?auto_167957 ?auto_167962 ) ) ( not ( = ?auto_167957 ?auto_167963 ) ) ( not ( = ?auto_167957 ?auto_167964 ) ) ( not ( = ?auto_167958 ?auto_167959 ) ) ( not ( = ?auto_167958 ?auto_167960 ) ) ( not ( = ?auto_167958 ?auto_167961 ) ) ( not ( = ?auto_167958 ?auto_167962 ) ) ( not ( = ?auto_167958 ?auto_167963 ) ) ( not ( = ?auto_167958 ?auto_167964 ) ) ( not ( = ?auto_167959 ?auto_167960 ) ) ( not ( = ?auto_167959 ?auto_167961 ) ) ( not ( = ?auto_167959 ?auto_167962 ) ) ( not ( = ?auto_167959 ?auto_167963 ) ) ( not ( = ?auto_167959 ?auto_167964 ) ) ( not ( = ?auto_167960 ?auto_167961 ) ) ( not ( = ?auto_167960 ?auto_167962 ) ) ( not ( = ?auto_167960 ?auto_167963 ) ) ( not ( = ?auto_167960 ?auto_167964 ) ) ( not ( = ?auto_167961 ?auto_167962 ) ) ( not ( = ?auto_167961 ?auto_167963 ) ) ( not ( = ?auto_167961 ?auto_167964 ) ) ( not ( = ?auto_167962 ?auto_167963 ) ) ( not ( = ?auto_167962 ?auto_167964 ) ) ( not ( = ?auto_167963 ?auto_167964 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167963 ?auto_167964 )
      ( !STACK ?auto_167963 ?auto_167962 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_167975 - BLOCK
      ?auto_167976 - BLOCK
      ?auto_167977 - BLOCK
      ?auto_167978 - BLOCK
      ?auto_167979 - BLOCK
      ?auto_167980 - BLOCK
      ?auto_167981 - BLOCK
      ?auto_167982 - BLOCK
      ?auto_167983 - BLOCK
      ?auto_167984 - BLOCK
    )
    :vars
    (
      ?auto_167985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_167983 ) ( ON ?auto_167984 ?auto_167985 ) ( CLEAR ?auto_167984 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_167975 ) ( ON ?auto_167976 ?auto_167975 ) ( ON ?auto_167977 ?auto_167976 ) ( ON ?auto_167978 ?auto_167977 ) ( ON ?auto_167979 ?auto_167978 ) ( ON ?auto_167980 ?auto_167979 ) ( ON ?auto_167981 ?auto_167980 ) ( ON ?auto_167982 ?auto_167981 ) ( ON ?auto_167983 ?auto_167982 ) ( not ( = ?auto_167975 ?auto_167976 ) ) ( not ( = ?auto_167975 ?auto_167977 ) ) ( not ( = ?auto_167975 ?auto_167978 ) ) ( not ( = ?auto_167975 ?auto_167979 ) ) ( not ( = ?auto_167975 ?auto_167980 ) ) ( not ( = ?auto_167975 ?auto_167981 ) ) ( not ( = ?auto_167975 ?auto_167982 ) ) ( not ( = ?auto_167975 ?auto_167983 ) ) ( not ( = ?auto_167975 ?auto_167984 ) ) ( not ( = ?auto_167975 ?auto_167985 ) ) ( not ( = ?auto_167976 ?auto_167977 ) ) ( not ( = ?auto_167976 ?auto_167978 ) ) ( not ( = ?auto_167976 ?auto_167979 ) ) ( not ( = ?auto_167976 ?auto_167980 ) ) ( not ( = ?auto_167976 ?auto_167981 ) ) ( not ( = ?auto_167976 ?auto_167982 ) ) ( not ( = ?auto_167976 ?auto_167983 ) ) ( not ( = ?auto_167976 ?auto_167984 ) ) ( not ( = ?auto_167976 ?auto_167985 ) ) ( not ( = ?auto_167977 ?auto_167978 ) ) ( not ( = ?auto_167977 ?auto_167979 ) ) ( not ( = ?auto_167977 ?auto_167980 ) ) ( not ( = ?auto_167977 ?auto_167981 ) ) ( not ( = ?auto_167977 ?auto_167982 ) ) ( not ( = ?auto_167977 ?auto_167983 ) ) ( not ( = ?auto_167977 ?auto_167984 ) ) ( not ( = ?auto_167977 ?auto_167985 ) ) ( not ( = ?auto_167978 ?auto_167979 ) ) ( not ( = ?auto_167978 ?auto_167980 ) ) ( not ( = ?auto_167978 ?auto_167981 ) ) ( not ( = ?auto_167978 ?auto_167982 ) ) ( not ( = ?auto_167978 ?auto_167983 ) ) ( not ( = ?auto_167978 ?auto_167984 ) ) ( not ( = ?auto_167978 ?auto_167985 ) ) ( not ( = ?auto_167979 ?auto_167980 ) ) ( not ( = ?auto_167979 ?auto_167981 ) ) ( not ( = ?auto_167979 ?auto_167982 ) ) ( not ( = ?auto_167979 ?auto_167983 ) ) ( not ( = ?auto_167979 ?auto_167984 ) ) ( not ( = ?auto_167979 ?auto_167985 ) ) ( not ( = ?auto_167980 ?auto_167981 ) ) ( not ( = ?auto_167980 ?auto_167982 ) ) ( not ( = ?auto_167980 ?auto_167983 ) ) ( not ( = ?auto_167980 ?auto_167984 ) ) ( not ( = ?auto_167980 ?auto_167985 ) ) ( not ( = ?auto_167981 ?auto_167982 ) ) ( not ( = ?auto_167981 ?auto_167983 ) ) ( not ( = ?auto_167981 ?auto_167984 ) ) ( not ( = ?auto_167981 ?auto_167985 ) ) ( not ( = ?auto_167982 ?auto_167983 ) ) ( not ( = ?auto_167982 ?auto_167984 ) ) ( not ( = ?auto_167982 ?auto_167985 ) ) ( not ( = ?auto_167983 ?auto_167984 ) ) ( not ( = ?auto_167983 ?auto_167985 ) ) ( not ( = ?auto_167984 ?auto_167985 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_167984 ?auto_167985 )
      ( !STACK ?auto_167984 ?auto_167983 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_167996 - BLOCK
      ?auto_167997 - BLOCK
      ?auto_167998 - BLOCK
      ?auto_167999 - BLOCK
      ?auto_168000 - BLOCK
      ?auto_168001 - BLOCK
      ?auto_168002 - BLOCK
      ?auto_168003 - BLOCK
      ?auto_168004 - BLOCK
      ?auto_168005 - BLOCK
    )
    :vars
    (
      ?auto_168006 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168005 ?auto_168006 ) ( ON-TABLE ?auto_167996 ) ( ON ?auto_167997 ?auto_167996 ) ( ON ?auto_167998 ?auto_167997 ) ( ON ?auto_167999 ?auto_167998 ) ( ON ?auto_168000 ?auto_167999 ) ( ON ?auto_168001 ?auto_168000 ) ( ON ?auto_168002 ?auto_168001 ) ( ON ?auto_168003 ?auto_168002 ) ( not ( = ?auto_167996 ?auto_167997 ) ) ( not ( = ?auto_167996 ?auto_167998 ) ) ( not ( = ?auto_167996 ?auto_167999 ) ) ( not ( = ?auto_167996 ?auto_168000 ) ) ( not ( = ?auto_167996 ?auto_168001 ) ) ( not ( = ?auto_167996 ?auto_168002 ) ) ( not ( = ?auto_167996 ?auto_168003 ) ) ( not ( = ?auto_167996 ?auto_168004 ) ) ( not ( = ?auto_167996 ?auto_168005 ) ) ( not ( = ?auto_167996 ?auto_168006 ) ) ( not ( = ?auto_167997 ?auto_167998 ) ) ( not ( = ?auto_167997 ?auto_167999 ) ) ( not ( = ?auto_167997 ?auto_168000 ) ) ( not ( = ?auto_167997 ?auto_168001 ) ) ( not ( = ?auto_167997 ?auto_168002 ) ) ( not ( = ?auto_167997 ?auto_168003 ) ) ( not ( = ?auto_167997 ?auto_168004 ) ) ( not ( = ?auto_167997 ?auto_168005 ) ) ( not ( = ?auto_167997 ?auto_168006 ) ) ( not ( = ?auto_167998 ?auto_167999 ) ) ( not ( = ?auto_167998 ?auto_168000 ) ) ( not ( = ?auto_167998 ?auto_168001 ) ) ( not ( = ?auto_167998 ?auto_168002 ) ) ( not ( = ?auto_167998 ?auto_168003 ) ) ( not ( = ?auto_167998 ?auto_168004 ) ) ( not ( = ?auto_167998 ?auto_168005 ) ) ( not ( = ?auto_167998 ?auto_168006 ) ) ( not ( = ?auto_167999 ?auto_168000 ) ) ( not ( = ?auto_167999 ?auto_168001 ) ) ( not ( = ?auto_167999 ?auto_168002 ) ) ( not ( = ?auto_167999 ?auto_168003 ) ) ( not ( = ?auto_167999 ?auto_168004 ) ) ( not ( = ?auto_167999 ?auto_168005 ) ) ( not ( = ?auto_167999 ?auto_168006 ) ) ( not ( = ?auto_168000 ?auto_168001 ) ) ( not ( = ?auto_168000 ?auto_168002 ) ) ( not ( = ?auto_168000 ?auto_168003 ) ) ( not ( = ?auto_168000 ?auto_168004 ) ) ( not ( = ?auto_168000 ?auto_168005 ) ) ( not ( = ?auto_168000 ?auto_168006 ) ) ( not ( = ?auto_168001 ?auto_168002 ) ) ( not ( = ?auto_168001 ?auto_168003 ) ) ( not ( = ?auto_168001 ?auto_168004 ) ) ( not ( = ?auto_168001 ?auto_168005 ) ) ( not ( = ?auto_168001 ?auto_168006 ) ) ( not ( = ?auto_168002 ?auto_168003 ) ) ( not ( = ?auto_168002 ?auto_168004 ) ) ( not ( = ?auto_168002 ?auto_168005 ) ) ( not ( = ?auto_168002 ?auto_168006 ) ) ( not ( = ?auto_168003 ?auto_168004 ) ) ( not ( = ?auto_168003 ?auto_168005 ) ) ( not ( = ?auto_168003 ?auto_168006 ) ) ( not ( = ?auto_168004 ?auto_168005 ) ) ( not ( = ?auto_168004 ?auto_168006 ) ) ( not ( = ?auto_168005 ?auto_168006 ) ) ( CLEAR ?auto_168003 ) ( ON ?auto_168004 ?auto_168005 ) ( CLEAR ?auto_168004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_167996 ?auto_167997 ?auto_167998 ?auto_167999 ?auto_168000 ?auto_168001 ?auto_168002 ?auto_168003 ?auto_168004 )
      ( MAKE-10PILE ?auto_167996 ?auto_167997 ?auto_167998 ?auto_167999 ?auto_168000 ?auto_168001 ?auto_168002 ?auto_168003 ?auto_168004 ?auto_168005 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168017 - BLOCK
      ?auto_168018 - BLOCK
      ?auto_168019 - BLOCK
      ?auto_168020 - BLOCK
      ?auto_168021 - BLOCK
      ?auto_168022 - BLOCK
      ?auto_168023 - BLOCK
      ?auto_168024 - BLOCK
      ?auto_168025 - BLOCK
      ?auto_168026 - BLOCK
    )
    :vars
    (
      ?auto_168027 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168026 ?auto_168027 ) ( ON-TABLE ?auto_168017 ) ( ON ?auto_168018 ?auto_168017 ) ( ON ?auto_168019 ?auto_168018 ) ( ON ?auto_168020 ?auto_168019 ) ( ON ?auto_168021 ?auto_168020 ) ( ON ?auto_168022 ?auto_168021 ) ( ON ?auto_168023 ?auto_168022 ) ( ON ?auto_168024 ?auto_168023 ) ( not ( = ?auto_168017 ?auto_168018 ) ) ( not ( = ?auto_168017 ?auto_168019 ) ) ( not ( = ?auto_168017 ?auto_168020 ) ) ( not ( = ?auto_168017 ?auto_168021 ) ) ( not ( = ?auto_168017 ?auto_168022 ) ) ( not ( = ?auto_168017 ?auto_168023 ) ) ( not ( = ?auto_168017 ?auto_168024 ) ) ( not ( = ?auto_168017 ?auto_168025 ) ) ( not ( = ?auto_168017 ?auto_168026 ) ) ( not ( = ?auto_168017 ?auto_168027 ) ) ( not ( = ?auto_168018 ?auto_168019 ) ) ( not ( = ?auto_168018 ?auto_168020 ) ) ( not ( = ?auto_168018 ?auto_168021 ) ) ( not ( = ?auto_168018 ?auto_168022 ) ) ( not ( = ?auto_168018 ?auto_168023 ) ) ( not ( = ?auto_168018 ?auto_168024 ) ) ( not ( = ?auto_168018 ?auto_168025 ) ) ( not ( = ?auto_168018 ?auto_168026 ) ) ( not ( = ?auto_168018 ?auto_168027 ) ) ( not ( = ?auto_168019 ?auto_168020 ) ) ( not ( = ?auto_168019 ?auto_168021 ) ) ( not ( = ?auto_168019 ?auto_168022 ) ) ( not ( = ?auto_168019 ?auto_168023 ) ) ( not ( = ?auto_168019 ?auto_168024 ) ) ( not ( = ?auto_168019 ?auto_168025 ) ) ( not ( = ?auto_168019 ?auto_168026 ) ) ( not ( = ?auto_168019 ?auto_168027 ) ) ( not ( = ?auto_168020 ?auto_168021 ) ) ( not ( = ?auto_168020 ?auto_168022 ) ) ( not ( = ?auto_168020 ?auto_168023 ) ) ( not ( = ?auto_168020 ?auto_168024 ) ) ( not ( = ?auto_168020 ?auto_168025 ) ) ( not ( = ?auto_168020 ?auto_168026 ) ) ( not ( = ?auto_168020 ?auto_168027 ) ) ( not ( = ?auto_168021 ?auto_168022 ) ) ( not ( = ?auto_168021 ?auto_168023 ) ) ( not ( = ?auto_168021 ?auto_168024 ) ) ( not ( = ?auto_168021 ?auto_168025 ) ) ( not ( = ?auto_168021 ?auto_168026 ) ) ( not ( = ?auto_168021 ?auto_168027 ) ) ( not ( = ?auto_168022 ?auto_168023 ) ) ( not ( = ?auto_168022 ?auto_168024 ) ) ( not ( = ?auto_168022 ?auto_168025 ) ) ( not ( = ?auto_168022 ?auto_168026 ) ) ( not ( = ?auto_168022 ?auto_168027 ) ) ( not ( = ?auto_168023 ?auto_168024 ) ) ( not ( = ?auto_168023 ?auto_168025 ) ) ( not ( = ?auto_168023 ?auto_168026 ) ) ( not ( = ?auto_168023 ?auto_168027 ) ) ( not ( = ?auto_168024 ?auto_168025 ) ) ( not ( = ?auto_168024 ?auto_168026 ) ) ( not ( = ?auto_168024 ?auto_168027 ) ) ( not ( = ?auto_168025 ?auto_168026 ) ) ( not ( = ?auto_168025 ?auto_168027 ) ) ( not ( = ?auto_168026 ?auto_168027 ) ) ( CLEAR ?auto_168024 ) ( ON ?auto_168025 ?auto_168026 ) ( CLEAR ?auto_168025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_168017 ?auto_168018 ?auto_168019 ?auto_168020 ?auto_168021 ?auto_168022 ?auto_168023 ?auto_168024 ?auto_168025 )
      ( MAKE-10PILE ?auto_168017 ?auto_168018 ?auto_168019 ?auto_168020 ?auto_168021 ?auto_168022 ?auto_168023 ?auto_168024 ?auto_168025 ?auto_168026 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168038 - BLOCK
      ?auto_168039 - BLOCK
      ?auto_168040 - BLOCK
      ?auto_168041 - BLOCK
      ?auto_168042 - BLOCK
      ?auto_168043 - BLOCK
      ?auto_168044 - BLOCK
      ?auto_168045 - BLOCK
      ?auto_168046 - BLOCK
      ?auto_168047 - BLOCK
    )
    :vars
    (
      ?auto_168048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168047 ?auto_168048 ) ( ON-TABLE ?auto_168038 ) ( ON ?auto_168039 ?auto_168038 ) ( ON ?auto_168040 ?auto_168039 ) ( ON ?auto_168041 ?auto_168040 ) ( ON ?auto_168042 ?auto_168041 ) ( ON ?auto_168043 ?auto_168042 ) ( ON ?auto_168044 ?auto_168043 ) ( not ( = ?auto_168038 ?auto_168039 ) ) ( not ( = ?auto_168038 ?auto_168040 ) ) ( not ( = ?auto_168038 ?auto_168041 ) ) ( not ( = ?auto_168038 ?auto_168042 ) ) ( not ( = ?auto_168038 ?auto_168043 ) ) ( not ( = ?auto_168038 ?auto_168044 ) ) ( not ( = ?auto_168038 ?auto_168045 ) ) ( not ( = ?auto_168038 ?auto_168046 ) ) ( not ( = ?auto_168038 ?auto_168047 ) ) ( not ( = ?auto_168038 ?auto_168048 ) ) ( not ( = ?auto_168039 ?auto_168040 ) ) ( not ( = ?auto_168039 ?auto_168041 ) ) ( not ( = ?auto_168039 ?auto_168042 ) ) ( not ( = ?auto_168039 ?auto_168043 ) ) ( not ( = ?auto_168039 ?auto_168044 ) ) ( not ( = ?auto_168039 ?auto_168045 ) ) ( not ( = ?auto_168039 ?auto_168046 ) ) ( not ( = ?auto_168039 ?auto_168047 ) ) ( not ( = ?auto_168039 ?auto_168048 ) ) ( not ( = ?auto_168040 ?auto_168041 ) ) ( not ( = ?auto_168040 ?auto_168042 ) ) ( not ( = ?auto_168040 ?auto_168043 ) ) ( not ( = ?auto_168040 ?auto_168044 ) ) ( not ( = ?auto_168040 ?auto_168045 ) ) ( not ( = ?auto_168040 ?auto_168046 ) ) ( not ( = ?auto_168040 ?auto_168047 ) ) ( not ( = ?auto_168040 ?auto_168048 ) ) ( not ( = ?auto_168041 ?auto_168042 ) ) ( not ( = ?auto_168041 ?auto_168043 ) ) ( not ( = ?auto_168041 ?auto_168044 ) ) ( not ( = ?auto_168041 ?auto_168045 ) ) ( not ( = ?auto_168041 ?auto_168046 ) ) ( not ( = ?auto_168041 ?auto_168047 ) ) ( not ( = ?auto_168041 ?auto_168048 ) ) ( not ( = ?auto_168042 ?auto_168043 ) ) ( not ( = ?auto_168042 ?auto_168044 ) ) ( not ( = ?auto_168042 ?auto_168045 ) ) ( not ( = ?auto_168042 ?auto_168046 ) ) ( not ( = ?auto_168042 ?auto_168047 ) ) ( not ( = ?auto_168042 ?auto_168048 ) ) ( not ( = ?auto_168043 ?auto_168044 ) ) ( not ( = ?auto_168043 ?auto_168045 ) ) ( not ( = ?auto_168043 ?auto_168046 ) ) ( not ( = ?auto_168043 ?auto_168047 ) ) ( not ( = ?auto_168043 ?auto_168048 ) ) ( not ( = ?auto_168044 ?auto_168045 ) ) ( not ( = ?auto_168044 ?auto_168046 ) ) ( not ( = ?auto_168044 ?auto_168047 ) ) ( not ( = ?auto_168044 ?auto_168048 ) ) ( not ( = ?auto_168045 ?auto_168046 ) ) ( not ( = ?auto_168045 ?auto_168047 ) ) ( not ( = ?auto_168045 ?auto_168048 ) ) ( not ( = ?auto_168046 ?auto_168047 ) ) ( not ( = ?auto_168046 ?auto_168048 ) ) ( not ( = ?auto_168047 ?auto_168048 ) ) ( ON ?auto_168046 ?auto_168047 ) ( CLEAR ?auto_168044 ) ( ON ?auto_168045 ?auto_168046 ) ( CLEAR ?auto_168045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168038 ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168042 ?auto_168043 ?auto_168044 ?auto_168045 )
      ( MAKE-10PILE ?auto_168038 ?auto_168039 ?auto_168040 ?auto_168041 ?auto_168042 ?auto_168043 ?auto_168044 ?auto_168045 ?auto_168046 ?auto_168047 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168059 - BLOCK
      ?auto_168060 - BLOCK
      ?auto_168061 - BLOCK
      ?auto_168062 - BLOCK
      ?auto_168063 - BLOCK
      ?auto_168064 - BLOCK
      ?auto_168065 - BLOCK
      ?auto_168066 - BLOCK
      ?auto_168067 - BLOCK
      ?auto_168068 - BLOCK
    )
    :vars
    (
      ?auto_168069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168068 ?auto_168069 ) ( ON-TABLE ?auto_168059 ) ( ON ?auto_168060 ?auto_168059 ) ( ON ?auto_168061 ?auto_168060 ) ( ON ?auto_168062 ?auto_168061 ) ( ON ?auto_168063 ?auto_168062 ) ( ON ?auto_168064 ?auto_168063 ) ( ON ?auto_168065 ?auto_168064 ) ( not ( = ?auto_168059 ?auto_168060 ) ) ( not ( = ?auto_168059 ?auto_168061 ) ) ( not ( = ?auto_168059 ?auto_168062 ) ) ( not ( = ?auto_168059 ?auto_168063 ) ) ( not ( = ?auto_168059 ?auto_168064 ) ) ( not ( = ?auto_168059 ?auto_168065 ) ) ( not ( = ?auto_168059 ?auto_168066 ) ) ( not ( = ?auto_168059 ?auto_168067 ) ) ( not ( = ?auto_168059 ?auto_168068 ) ) ( not ( = ?auto_168059 ?auto_168069 ) ) ( not ( = ?auto_168060 ?auto_168061 ) ) ( not ( = ?auto_168060 ?auto_168062 ) ) ( not ( = ?auto_168060 ?auto_168063 ) ) ( not ( = ?auto_168060 ?auto_168064 ) ) ( not ( = ?auto_168060 ?auto_168065 ) ) ( not ( = ?auto_168060 ?auto_168066 ) ) ( not ( = ?auto_168060 ?auto_168067 ) ) ( not ( = ?auto_168060 ?auto_168068 ) ) ( not ( = ?auto_168060 ?auto_168069 ) ) ( not ( = ?auto_168061 ?auto_168062 ) ) ( not ( = ?auto_168061 ?auto_168063 ) ) ( not ( = ?auto_168061 ?auto_168064 ) ) ( not ( = ?auto_168061 ?auto_168065 ) ) ( not ( = ?auto_168061 ?auto_168066 ) ) ( not ( = ?auto_168061 ?auto_168067 ) ) ( not ( = ?auto_168061 ?auto_168068 ) ) ( not ( = ?auto_168061 ?auto_168069 ) ) ( not ( = ?auto_168062 ?auto_168063 ) ) ( not ( = ?auto_168062 ?auto_168064 ) ) ( not ( = ?auto_168062 ?auto_168065 ) ) ( not ( = ?auto_168062 ?auto_168066 ) ) ( not ( = ?auto_168062 ?auto_168067 ) ) ( not ( = ?auto_168062 ?auto_168068 ) ) ( not ( = ?auto_168062 ?auto_168069 ) ) ( not ( = ?auto_168063 ?auto_168064 ) ) ( not ( = ?auto_168063 ?auto_168065 ) ) ( not ( = ?auto_168063 ?auto_168066 ) ) ( not ( = ?auto_168063 ?auto_168067 ) ) ( not ( = ?auto_168063 ?auto_168068 ) ) ( not ( = ?auto_168063 ?auto_168069 ) ) ( not ( = ?auto_168064 ?auto_168065 ) ) ( not ( = ?auto_168064 ?auto_168066 ) ) ( not ( = ?auto_168064 ?auto_168067 ) ) ( not ( = ?auto_168064 ?auto_168068 ) ) ( not ( = ?auto_168064 ?auto_168069 ) ) ( not ( = ?auto_168065 ?auto_168066 ) ) ( not ( = ?auto_168065 ?auto_168067 ) ) ( not ( = ?auto_168065 ?auto_168068 ) ) ( not ( = ?auto_168065 ?auto_168069 ) ) ( not ( = ?auto_168066 ?auto_168067 ) ) ( not ( = ?auto_168066 ?auto_168068 ) ) ( not ( = ?auto_168066 ?auto_168069 ) ) ( not ( = ?auto_168067 ?auto_168068 ) ) ( not ( = ?auto_168067 ?auto_168069 ) ) ( not ( = ?auto_168068 ?auto_168069 ) ) ( ON ?auto_168067 ?auto_168068 ) ( CLEAR ?auto_168065 ) ( ON ?auto_168066 ?auto_168067 ) ( CLEAR ?auto_168066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168059 ?auto_168060 ?auto_168061 ?auto_168062 ?auto_168063 ?auto_168064 ?auto_168065 ?auto_168066 )
      ( MAKE-10PILE ?auto_168059 ?auto_168060 ?auto_168061 ?auto_168062 ?auto_168063 ?auto_168064 ?auto_168065 ?auto_168066 ?auto_168067 ?auto_168068 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168080 - BLOCK
      ?auto_168081 - BLOCK
      ?auto_168082 - BLOCK
      ?auto_168083 - BLOCK
      ?auto_168084 - BLOCK
      ?auto_168085 - BLOCK
      ?auto_168086 - BLOCK
      ?auto_168087 - BLOCK
      ?auto_168088 - BLOCK
      ?auto_168089 - BLOCK
    )
    :vars
    (
      ?auto_168090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168089 ?auto_168090 ) ( ON-TABLE ?auto_168080 ) ( ON ?auto_168081 ?auto_168080 ) ( ON ?auto_168082 ?auto_168081 ) ( ON ?auto_168083 ?auto_168082 ) ( ON ?auto_168084 ?auto_168083 ) ( ON ?auto_168085 ?auto_168084 ) ( not ( = ?auto_168080 ?auto_168081 ) ) ( not ( = ?auto_168080 ?auto_168082 ) ) ( not ( = ?auto_168080 ?auto_168083 ) ) ( not ( = ?auto_168080 ?auto_168084 ) ) ( not ( = ?auto_168080 ?auto_168085 ) ) ( not ( = ?auto_168080 ?auto_168086 ) ) ( not ( = ?auto_168080 ?auto_168087 ) ) ( not ( = ?auto_168080 ?auto_168088 ) ) ( not ( = ?auto_168080 ?auto_168089 ) ) ( not ( = ?auto_168080 ?auto_168090 ) ) ( not ( = ?auto_168081 ?auto_168082 ) ) ( not ( = ?auto_168081 ?auto_168083 ) ) ( not ( = ?auto_168081 ?auto_168084 ) ) ( not ( = ?auto_168081 ?auto_168085 ) ) ( not ( = ?auto_168081 ?auto_168086 ) ) ( not ( = ?auto_168081 ?auto_168087 ) ) ( not ( = ?auto_168081 ?auto_168088 ) ) ( not ( = ?auto_168081 ?auto_168089 ) ) ( not ( = ?auto_168081 ?auto_168090 ) ) ( not ( = ?auto_168082 ?auto_168083 ) ) ( not ( = ?auto_168082 ?auto_168084 ) ) ( not ( = ?auto_168082 ?auto_168085 ) ) ( not ( = ?auto_168082 ?auto_168086 ) ) ( not ( = ?auto_168082 ?auto_168087 ) ) ( not ( = ?auto_168082 ?auto_168088 ) ) ( not ( = ?auto_168082 ?auto_168089 ) ) ( not ( = ?auto_168082 ?auto_168090 ) ) ( not ( = ?auto_168083 ?auto_168084 ) ) ( not ( = ?auto_168083 ?auto_168085 ) ) ( not ( = ?auto_168083 ?auto_168086 ) ) ( not ( = ?auto_168083 ?auto_168087 ) ) ( not ( = ?auto_168083 ?auto_168088 ) ) ( not ( = ?auto_168083 ?auto_168089 ) ) ( not ( = ?auto_168083 ?auto_168090 ) ) ( not ( = ?auto_168084 ?auto_168085 ) ) ( not ( = ?auto_168084 ?auto_168086 ) ) ( not ( = ?auto_168084 ?auto_168087 ) ) ( not ( = ?auto_168084 ?auto_168088 ) ) ( not ( = ?auto_168084 ?auto_168089 ) ) ( not ( = ?auto_168084 ?auto_168090 ) ) ( not ( = ?auto_168085 ?auto_168086 ) ) ( not ( = ?auto_168085 ?auto_168087 ) ) ( not ( = ?auto_168085 ?auto_168088 ) ) ( not ( = ?auto_168085 ?auto_168089 ) ) ( not ( = ?auto_168085 ?auto_168090 ) ) ( not ( = ?auto_168086 ?auto_168087 ) ) ( not ( = ?auto_168086 ?auto_168088 ) ) ( not ( = ?auto_168086 ?auto_168089 ) ) ( not ( = ?auto_168086 ?auto_168090 ) ) ( not ( = ?auto_168087 ?auto_168088 ) ) ( not ( = ?auto_168087 ?auto_168089 ) ) ( not ( = ?auto_168087 ?auto_168090 ) ) ( not ( = ?auto_168088 ?auto_168089 ) ) ( not ( = ?auto_168088 ?auto_168090 ) ) ( not ( = ?auto_168089 ?auto_168090 ) ) ( ON ?auto_168088 ?auto_168089 ) ( ON ?auto_168087 ?auto_168088 ) ( CLEAR ?auto_168085 ) ( ON ?auto_168086 ?auto_168087 ) ( CLEAR ?auto_168086 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168080 ?auto_168081 ?auto_168082 ?auto_168083 ?auto_168084 ?auto_168085 ?auto_168086 )
      ( MAKE-10PILE ?auto_168080 ?auto_168081 ?auto_168082 ?auto_168083 ?auto_168084 ?auto_168085 ?auto_168086 ?auto_168087 ?auto_168088 ?auto_168089 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168101 - BLOCK
      ?auto_168102 - BLOCK
      ?auto_168103 - BLOCK
      ?auto_168104 - BLOCK
      ?auto_168105 - BLOCK
      ?auto_168106 - BLOCK
      ?auto_168107 - BLOCK
      ?auto_168108 - BLOCK
      ?auto_168109 - BLOCK
      ?auto_168110 - BLOCK
    )
    :vars
    (
      ?auto_168111 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168110 ?auto_168111 ) ( ON-TABLE ?auto_168101 ) ( ON ?auto_168102 ?auto_168101 ) ( ON ?auto_168103 ?auto_168102 ) ( ON ?auto_168104 ?auto_168103 ) ( ON ?auto_168105 ?auto_168104 ) ( ON ?auto_168106 ?auto_168105 ) ( not ( = ?auto_168101 ?auto_168102 ) ) ( not ( = ?auto_168101 ?auto_168103 ) ) ( not ( = ?auto_168101 ?auto_168104 ) ) ( not ( = ?auto_168101 ?auto_168105 ) ) ( not ( = ?auto_168101 ?auto_168106 ) ) ( not ( = ?auto_168101 ?auto_168107 ) ) ( not ( = ?auto_168101 ?auto_168108 ) ) ( not ( = ?auto_168101 ?auto_168109 ) ) ( not ( = ?auto_168101 ?auto_168110 ) ) ( not ( = ?auto_168101 ?auto_168111 ) ) ( not ( = ?auto_168102 ?auto_168103 ) ) ( not ( = ?auto_168102 ?auto_168104 ) ) ( not ( = ?auto_168102 ?auto_168105 ) ) ( not ( = ?auto_168102 ?auto_168106 ) ) ( not ( = ?auto_168102 ?auto_168107 ) ) ( not ( = ?auto_168102 ?auto_168108 ) ) ( not ( = ?auto_168102 ?auto_168109 ) ) ( not ( = ?auto_168102 ?auto_168110 ) ) ( not ( = ?auto_168102 ?auto_168111 ) ) ( not ( = ?auto_168103 ?auto_168104 ) ) ( not ( = ?auto_168103 ?auto_168105 ) ) ( not ( = ?auto_168103 ?auto_168106 ) ) ( not ( = ?auto_168103 ?auto_168107 ) ) ( not ( = ?auto_168103 ?auto_168108 ) ) ( not ( = ?auto_168103 ?auto_168109 ) ) ( not ( = ?auto_168103 ?auto_168110 ) ) ( not ( = ?auto_168103 ?auto_168111 ) ) ( not ( = ?auto_168104 ?auto_168105 ) ) ( not ( = ?auto_168104 ?auto_168106 ) ) ( not ( = ?auto_168104 ?auto_168107 ) ) ( not ( = ?auto_168104 ?auto_168108 ) ) ( not ( = ?auto_168104 ?auto_168109 ) ) ( not ( = ?auto_168104 ?auto_168110 ) ) ( not ( = ?auto_168104 ?auto_168111 ) ) ( not ( = ?auto_168105 ?auto_168106 ) ) ( not ( = ?auto_168105 ?auto_168107 ) ) ( not ( = ?auto_168105 ?auto_168108 ) ) ( not ( = ?auto_168105 ?auto_168109 ) ) ( not ( = ?auto_168105 ?auto_168110 ) ) ( not ( = ?auto_168105 ?auto_168111 ) ) ( not ( = ?auto_168106 ?auto_168107 ) ) ( not ( = ?auto_168106 ?auto_168108 ) ) ( not ( = ?auto_168106 ?auto_168109 ) ) ( not ( = ?auto_168106 ?auto_168110 ) ) ( not ( = ?auto_168106 ?auto_168111 ) ) ( not ( = ?auto_168107 ?auto_168108 ) ) ( not ( = ?auto_168107 ?auto_168109 ) ) ( not ( = ?auto_168107 ?auto_168110 ) ) ( not ( = ?auto_168107 ?auto_168111 ) ) ( not ( = ?auto_168108 ?auto_168109 ) ) ( not ( = ?auto_168108 ?auto_168110 ) ) ( not ( = ?auto_168108 ?auto_168111 ) ) ( not ( = ?auto_168109 ?auto_168110 ) ) ( not ( = ?auto_168109 ?auto_168111 ) ) ( not ( = ?auto_168110 ?auto_168111 ) ) ( ON ?auto_168109 ?auto_168110 ) ( ON ?auto_168108 ?auto_168109 ) ( CLEAR ?auto_168106 ) ( ON ?auto_168107 ?auto_168108 ) ( CLEAR ?auto_168107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168101 ?auto_168102 ?auto_168103 ?auto_168104 ?auto_168105 ?auto_168106 ?auto_168107 )
      ( MAKE-10PILE ?auto_168101 ?auto_168102 ?auto_168103 ?auto_168104 ?auto_168105 ?auto_168106 ?auto_168107 ?auto_168108 ?auto_168109 ?auto_168110 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168122 - BLOCK
      ?auto_168123 - BLOCK
      ?auto_168124 - BLOCK
      ?auto_168125 - BLOCK
      ?auto_168126 - BLOCK
      ?auto_168127 - BLOCK
      ?auto_168128 - BLOCK
      ?auto_168129 - BLOCK
      ?auto_168130 - BLOCK
      ?auto_168131 - BLOCK
    )
    :vars
    (
      ?auto_168132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168131 ?auto_168132 ) ( ON-TABLE ?auto_168122 ) ( ON ?auto_168123 ?auto_168122 ) ( ON ?auto_168124 ?auto_168123 ) ( ON ?auto_168125 ?auto_168124 ) ( ON ?auto_168126 ?auto_168125 ) ( not ( = ?auto_168122 ?auto_168123 ) ) ( not ( = ?auto_168122 ?auto_168124 ) ) ( not ( = ?auto_168122 ?auto_168125 ) ) ( not ( = ?auto_168122 ?auto_168126 ) ) ( not ( = ?auto_168122 ?auto_168127 ) ) ( not ( = ?auto_168122 ?auto_168128 ) ) ( not ( = ?auto_168122 ?auto_168129 ) ) ( not ( = ?auto_168122 ?auto_168130 ) ) ( not ( = ?auto_168122 ?auto_168131 ) ) ( not ( = ?auto_168122 ?auto_168132 ) ) ( not ( = ?auto_168123 ?auto_168124 ) ) ( not ( = ?auto_168123 ?auto_168125 ) ) ( not ( = ?auto_168123 ?auto_168126 ) ) ( not ( = ?auto_168123 ?auto_168127 ) ) ( not ( = ?auto_168123 ?auto_168128 ) ) ( not ( = ?auto_168123 ?auto_168129 ) ) ( not ( = ?auto_168123 ?auto_168130 ) ) ( not ( = ?auto_168123 ?auto_168131 ) ) ( not ( = ?auto_168123 ?auto_168132 ) ) ( not ( = ?auto_168124 ?auto_168125 ) ) ( not ( = ?auto_168124 ?auto_168126 ) ) ( not ( = ?auto_168124 ?auto_168127 ) ) ( not ( = ?auto_168124 ?auto_168128 ) ) ( not ( = ?auto_168124 ?auto_168129 ) ) ( not ( = ?auto_168124 ?auto_168130 ) ) ( not ( = ?auto_168124 ?auto_168131 ) ) ( not ( = ?auto_168124 ?auto_168132 ) ) ( not ( = ?auto_168125 ?auto_168126 ) ) ( not ( = ?auto_168125 ?auto_168127 ) ) ( not ( = ?auto_168125 ?auto_168128 ) ) ( not ( = ?auto_168125 ?auto_168129 ) ) ( not ( = ?auto_168125 ?auto_168130 ) ) ( not ( = ?auto_168125 ?auto_168131 ) ) ( not ( = ?auto_168125 ?auto_168132 ) ) ( not ( = ?auto_168126 ?auto_168127 ) ) ( not ( = ?auto_168126 ?auto_168128 ) ) ( not ( = ?auto_168126 ?auto_168129 ) ) ( not ( = ?auto_168126 ?auto_168130 ) ) ( not ( = ?auto_168126 ?auto_168131 ) ) ( not ( = ?auto_168126 ?auto_168132 ) ) ( not ( = ?auto_168127 ?auto_168128 ) ) ( not ( = ?auto_168127 ?auto_168129 ) ) ( not ( = ?auto_168127 ?auto_168130 ) ) ( not ( = ?auto_168127 ?auto_168131 ) ) ( not ( = ?auto_168127 ?auto_168132 ) ) ( not ( = ?auto_168128 ?auto_168129 ) ) ( not ( = ?auto_168128 ?auto_168130 ) ) ( not ( = ?auto_168128 ?auto_168131 ) ) ( not ( = ?auto_168128 ?auto_168132 ) ) ( not ( = ?auto_168129 ?auto_168130 ) ) ( not ( = ?auto_168129 ?auto_168131 ) ) ( not ( = ?auto_168129 ?auto_168132 ) ) ( not ( = ?auto_168130 ?auto_168131 ) ) ( not ( = ?auto_168130 ?auto_168132 ) ) ( not ( = ?auto_168131 ?auto_168132 ) ) ( ON ?auto_168130 ?auto_168131 ) ( ON ?auto_168129 ?auto_168130 ) ( ON ?auto_168128 ?auto_168129 ) ( CLEAR ?auto_168126 ) ( ON ?auto_168127 ?auto_168128 ) ( CLEAR ?auto_168127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168122 ?auto_168123 ?auto_168124 ?auto_168125 ?auto_168126 ?auto_168127 )
      ( MAKE-10PILE ?auto_168122 ?auto_168123 ?auto_168124 ?auto_168125 ?auto_168126 ?auto_168127 ?auto_168128 ?auto_168129 ?auto_168130 ?auto_168131 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168143 - BLOCK
      ?auto_168144 - BLOCK
      ?auto_168145 - BLOCK
      ?auto_168146 - BLOCK
      ?auto_168147 - BLOCK
      ?auto_168148 - BLOCK
      ?auto_168149 - BLOCK
      ?auto_168150 - BLOCK
      ?auto_168151 - BLOCK
      ?auto_168152 - BLOCK
    )
    :vars
    (
      ?auto_168153 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168152 ?auto_168153 ) ( ON-TABLE ?auto_168143 ) ( ON ?auto_168144 ?auto_168143 ) ( ON ?auto_168145 ?auto_168144 ) ( ON ?auto_168146 ?auto_168145 ) ( ON ?auto_168147 ?auto_168146 ) ( not ( = ?auto_168143 ?auto_168144 ) ) ( not ( = ?auto_168143 ?auto_168145 ) ) ( not ( = ?auto_168143 ?auto_168146 ) ) ( not ( = ?auto_168143 ?auto_168147 ) ) ( not ( = ?auto_168143 ?auto_168148 ) ) ( not ( = ?auto_168143 ?auto_168149 ) ) ( not ( = ?auto_168143 ?auto_168150 ) ) ( not ( = ?auto_168143 ?auto_168151 ) ) ( not ( = ?auto_168143 ?auto_168152 ) ) ( not ( = ?auto_168143 ?auto_168153 ) ) ( not ( = ?auto_168144 ?auto_168145 ) ) ( not ( = ?auto_168144 ?auto_168146 ) ) ( not ( = ?auto_168144 ?auto_168147 ) ) ( not ( = ?auto_168144 ?auto_168148 ) ) ( not ( = ?auto_168144 ?auto_168149 ) ) ( not ( = ?auto_168144 ?auto_168150 ) ) ( not ( = ?auto_168144 ?auto_168151 ) ) ( not ( = ?auto_168144 ?auto_168152 ) ) ( not ( = ?auto_168144 ?auto_168153 ) ) ( not ( = ?auto_168145 ?auto_168146 ) ) ( not ( = ?auto_168145 ?auto_168147 ) ) ( not ( = ?auto_168145 ?auto_168148 ) ) ( not ( = ?auto_168145 ?auto_168149 ) ) ( not ( = ?auto_168145 ?auto_168150 ) ) ( not ( = ?auto_168145 ?auto_168151 ) ) ( not ( = ?auto_168145 ?auto_168152 ) ) ( not ( = ?auto_168145 ?auto_168153 ) ) ( not ( = ?auto_168146 ?auto_168147 ) ) ( not ( = ?auto_168146 ?auto_168148 ) ) ( not ( = ?auto_168146 ?auto_168149 ) ) ( not ( = ?auto_168146 ?auto_168150 ) ) ( not ( = ?auto_168146 ?auto_168151 ) ) ( not ( = ?auto_168146 ?auto_168152 ) ) ( not ( = ?auto_168146 ?auto_168153 ) ) ( not ( = ?auto_168147 ?auto_168148 ) ) ( not ( = ?auto_168147 ?auto_168149 ) ) ( not ( = ?auto_168147 ?auto_168150 ) ) ( not ( = ?auto_168147 ?auto_168151 ) ) ( not ( = ?auto_168147 ?auto_168152 ) ) ( not ( = ?auto_168147 ?auto_168153 ) ) ( not ( = ?auto_168148 ?auto_168149 ) ) ( not ( = ?auto_168148 ?auto_168150 ) ) ( not ( = ?auto_168148 ?auto_168151 ) ) ( not ( = ?auto_168148 ?auto_168152 ) ) ( not ( = ?auto_168148 ?auto_168153 ) ) ( not ( = ?auto_168149 ?auto_168150 ) ) ( not ( = ?auto_168149 ?auto_168151 ) ) ( not ( = ?auto_168149 ?auto_168152 ) ) ( not ( = ?auto_168149 ?auto_168153 ) ) ( not ( = ?auto_168150 ?auto_168151 ) ) ( not ( = ?auto_168150 ?auto_168152 ) ) ( not ( = ?auto_168150 ?auto_168153 ) ) ( not ( = ?auto_168151 ?auto_168152 ) ) ( not ( = ?auto_168151 ?auto_168153 ) ) ( not ( = ?auto_168152 ?auto_168153 ) ) ( ON ?auto_168151 ?auto_168152 ) ( ON ?auto_168150 ?auto_168151 ) ( ON ?auto_168149 ?auto_168150 ) ( CLEAR ?auto_168147 ) ( ON ?auto_168148 ?auto_168149 ) ( CLEAR ?auto_168148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168143 ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168147 ?auto_168148 )
      ( MAKE-10PILE ?auto_168143 ?auto_168144 ?auto_168145 ?auto_168146 ?auto_168147 ?auto_168148 ?auto_168149 ?auto_168150 ?auto_168151 ?auto_168152 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168164 - BLOCK
      ?auto_168165 - BLOCK
      ?auto_168166 - BLOCK
      ?auto_168167 - BLOCK
      ?auto_168168 - BLOCK
      ?auto_168169 - BLOCK
      ?auto_168170 - BLOCK
      ?auto_168171 - BLOCK
      ?auto_168172 - BLOCK
      ?auto_168173 - BLOCK
    )
    :vars
    (
      ?auto_168174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168173 ?auto_168174 ) ( ON-TABLE ?auto_168164 ) ( ON ?auto_168165 ?auto_168164 ) ( ON ?auto_168166 ?auto_168165 ) ( ON ?auto_168167 ?auto_168166 ) ( not ( = ?auto_168164 ?auto_168165 ) ) ( not ( = ?auto_168164 ?auto_168166 ) ) ( not ( = ?auto_168164 ?auto_168167 ) ) ( not ( = ?auto_168164 ?auto_168168 ) ) ( not ( = ?auto_168164 ?auto_168169 ) ) ( not ( = ?auto_168164 ?auto_168170 ) ) ( not ( = ?auto_168164 ?auto_168171 ) ) ( not ( = ?auto_168164 ?auto_168172 ) ) ( not ( = ?auto_168164 ?auto_168173 ) ) ( not ( = ?auto_168164 ?auto_168174 ) ) ( not ( = ?auto_168165 ?auto_168166 ) ) ( not ( = ?auto_168165 ?auto_168167 ) ) ( not ( = ?auto_168165 ?auto_168168 ) ) ( not ( = ?auto_168165 ?auto_168169 ) ) ( not ( = ?auto_168165 ?auto_168170 ) ) ( not ( = ?auto_168165 ?auto_168171 ) ) ( not ( = ?auto_168165 ?auto_168172 ) ) ( not ( = ?auto_168165 ?auto_168173 ) ) ( not ( = ?auto_168165 ?auto_168174 ) ) ( not ( = ?auto_168166 ?auto_168167 ) ) ( not ( = ?auto_168166 ?auto_168168 ) ) ( not ( = ?auto_168166 ?auto_168169 ) ) ( not ( = ?auto_168166 ?auto_168170 ) ) ( not ( = ?auto_168166 ?auto_168171 ) ) ( not ( = ?auto_168166 ?auto_168172 ) ) ( not ( = ?auto_168166 ?auto_168173 ) ) ( not ( = ?auto_168166 ?auto_168174 ) ) ( not ( = ?auto_168167 ?auto_168168 ) ) ( not ( = ?auto_168167 ?auto_168169 ) ) ( not ( = ?auto_168167 ?auto_168170 ) ) ( not ( = ?auto_168167 ?auto_168171 ) ) ( not ( = ?auto_168167 ?auto_168172 ) ) ( not ( = ?auto_168167 ?auto_168173 ) ) ( not ( = ?auto_168167 ?auto_168174 ) ) ( not ( = ?auto_168168 ?auto_168169 ) ) ( not ( = ?auto_168168 ?auto_168170 ) ) ( not ( = ?auto_168168 ?auto_168171 ) ) ( not ( = ?auto_168168 ?auto_168172 ) ) ( not ( = ?auto_168168 ?auto_168173 ) ) ( not ( = ?auto_168168 ?auto_168174 ) ) ( not ( = ?auto_168169 ?auto_168170 ) ) ( not ( = ?auto_168169 ?auto_168171 ) ) ( not ( = ?auto_168169 ?auto_168172 ) ) ( not ( = ?auto_168169 ?auto_168173 ) ) ( not ( = ?auto_168169 ?auto_168174 ) ) ( not ( = ?auto_168170 ?auto_168171 ) ) ( not ( = ?auto_168170 ?auto_168172 ) ) ( not ( = ?auto_168170 ?auto_168173 ) ) ( not ( = ?auto_168170 ?auto_168174 ) ) ( not ( = ?auto_168171 ?auto_168172 ) ) ( not ( = ?auto_168171 ?auto_168173 ) ) ( not ( = ?auto_168171 ?auto_168174 ) ) ( not ( = ?auto_168172 ?auto_168173 ) ) ( not ( = ?auto_168172 ?auto_168174 ) ) ( not ( = ?auto_168173 ?auto_168174 ) ) ( ON ?auto_168172 ?auto_168173 ) ( ON ?auto_168171 ?auto_168172 ) ( ON ?auto_168170 ?auto_168171 ) ( ON ?auto_168169 ?auto_168170 ) ( CLEAR ?auto_168167 ) ( ON ?auto_168168 ?auto_168169 ) ( CLEAR ?auto_168168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168164 ?auto_168165 ?auto_168166 ?auto_168167 ?auto_168168 )
      ( MAKE-10PILE ?auto_168164 ?auto_168165 ?auto_168166 ?auto_168167 ?auto_168168 ?auto_168169 ?auto_168170 ?auto_168171 ?auto_168172 ?auto_168173 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168185 - BLOCK
      ?auto_168186 - BLOCK
      ?auto_168187 - BLOCK
      ?auto_168188 - BLOCK
      ?auto_168189 - BLOCK
      ?auto_168190 - BLOCK
      ?auto_168191 - BLOCK
      ?auto_168192 - BLOCK
      ?auto_168193 - BLOCK
      ?auto_168194 - BLOCK
    )
    :vars
    (
      ?auto_168195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168194 ?auto_168195 ) ( ON-TABLE ?auto_168185 ) ( ON ?auto_168186 ?auto_168185 ) ( ON ?auto_168187 ?auto_168186 ) ( ON ?auto_168188 ?auto_168187 ) ( not ( = ?auto_168185 ?auto_168186 ) ) ( not ( = ?auto_168185 ?auto_168187 ) ) ( not ( = ?auto_168185 ?auto_168188 ) ) ( not ( = ?auto_168185 ?auto_168189 ) ) ( not ( = ?auto_168185 ?auto_168190 ) ) ( not ( = ?auto_168185 ?auto_168191 ) ) ( not ( = ?auto_168185 ?auto_168192 ) ) ( not ( = ?auto_168185 ?auto_168193 ) ) ( not ( = ?auto_168185 ?auto_168194 ) ) ( not ( = ?auto_168185 ?auto_168195 ) ) ( not ( = ?auto_168186 ?auto_168187 ) ) ( not ( = ?auto_168186 ?auto_168188 ) ) ( not ( = ?auto_168186 ?auto_168189 ) ) ( not ( = ?auto_168186 ?auto_168190 ) ) ( not ( = ?auto_168186 ?auto_168191 ) ) ( not ( = ?auto_168186 ?auto_168192 ) ) ( not ( = ?auto_168186 ?auto_168193 ) ) ( not ( = ?auto_168186 ?auto_168194 ) ) ( not ( = ?auto_168186 ?auto_168195 ) ) ( not ( = ?auto_168187 ?auto_168188 ) ) ( not ( = ?auto_168187 ?auto_168189 ) ) ( not ( = ?auto_168187 ?auto_168190 ) ) ( not ( = ?auto_168187 ?auto_168191 ) ) ( not ( = ?auto_168187 ?auto_168192 ) ) ( not ( = ?auto_168187 ?auto_168193 ) ) ( not ( = ?auto_168187 ?auto_168194 ) ) ( not ( = ?auto_168187 ?auto_168195 ) ) ( not ( = ?auto_168188 ?auto_168189 ) ) ( not ( = ?auto_168188 ?auto_168190 ) ) ( not ( = ?auto_168188 ?auto_168191 ) ) ( not ( = ?auto_168188 ?auto_168192 ) ) ( not ( = ?auto_168188 ?auto_168193 ) ) ( not ( = ?auto_168188 ?auto_168194 ) ) ( not ( = ?auto_168188 ?auto_168195 ) ) ( not ( = ?auto_168189 ?auto_168190 ) ) ( not ( = ?auto_168189 ?auto_168191 ) ) ( not ( = ?auto_168189 ?auto_168192 ) ) ( not ( = ?auto_168189 ?auto_168193 ) ) ( not ( = ?auto_168189 ?auto_168194 ) ) ( not ( = ?auto_168189 ?auto_168195 ) ) ( not ( = ?auto_168190 ?auto_168191 ) ) ( not ( = ?auto_168190 ?auto_168192 ) ) ( not ( = ?auto_168190 ?auto_168193 ) ) ( not ( = ?auto_168190 ?auto_168194 ) ) ( not ( = ?auto_168190 ?auto_168195 ) ) ( not ( = ?auto_168191 ?auto_168192 ) ) ( not ( = ?auto_168191 ?auto_168193 ) ) ( not ( = ?auto_168191 ?auto_168194 ) ) ( not ( = ?auto_168191 ?auto_168195 ) ) ( not ( = ?auto_168192 ?auto_168193 ) ) ( not ( = ?auto_168192 ?auto_168194 ) ) ( not ( = ?auto_168192 ?auto_168195 ) ) ( not ( = ?auto_168193 ?auto_168194 ) ) ( not ( = ?auto_168193 ?auto_168195 ) ) ( not ( = ?auto_168194 ?auto_168195 ) ) ( ON ?auto_168193 ?auto_168194 ) ( ON ?auto_168192 ?auto_168193 ) ( ON ?auto_168191 ?auto_168192 ) ( ON ?auto_168190 ?auto_168191 ) ( CLEAR ?auto_168188 ) ( ON ?auto_168189 ?auto_168190 ) ( CLEAR ?auto_168189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168185 ?auto_168186 ?auto_168187 ?auto_168188 ?auto_168189 )
      ( MAKE-10PILE ?auto_168185 ?auto_168186 ?auto_168187 ?auto_168188 ?auto_168189 ?auto_168190 ?auto_168191 ?auto_168192 ?auto_168193 ?auto_168194 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168206 - BLOCK
      ?auto_168207 - BLOCK
      ?auto_168208 - BLOCK
      ?auto_168209 - BLOCK
      ?auto_168210 - BLOCK
      ?auto_168211 - BLOCK
      ?auto_168212 - BLOCK
      ?auto_168213 - BLOCK
      ?auto_168214 - BLOCK
      ?auto_168215 - BLOCK
    )
    :vars
    (
      ?auto_168216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168215 ?auto_168216 ) ( ON-TABLE ?auto_168206 ) ( ON ?auto_168207 ?auto_168206 ) ( ON ?auto_168208 ?auto_168207 ) ( not ( = ?auto_168206 ?auto_168207 ) ) ( not ( = ?auto_168206 ?auto_168208 ) ) ( not ( = ?auto_168206 ?auto_168209 ) ) ( not ( = ?auto_168206 ?auto_168210 ) ) ( not ( = ?auto_168206 ?auto_168211 ) ) ( not ( = ?auto_168206 ?auto_168212 ) ) ( not ( = ?auto_168206 ?auto_168213 ) ) ( not ( = ?auto_168206 ?auto_168214 ) ) ( not ( = ?auto_168206 ?auto_168215 ) ) ( not ( = ?auto_168206 ?auto_168216 ) ) ( not ( = ?auto_168207 ?auto_168208 ) ) ( not ( = ?auto_168207 ?auto_168209 ) ) ( not ( = ?auto_168207 ?auto_168210 ) ) ( not ( = ?auto_168207 ?auto_168211 ) ) ( not ( = ?auto_168207 ?auto_168212 ) ) ( not ( = ?auto_168207 ?auto_168213 ) ) ( not ( = ?auto_168207 ?auto_168214 ) ) ( not ( = ?auto_168207 ?auto_168215 ) ) ( not ( = ?auto_168207 ?auto_168216 ) ) ( not ( = ?auto_168208 ?auto_168209 ) ) ( not ( = ?auto_168208 ?auto_168210 ) ) ( not ( = ?auto_168208 ?auto_168211 ) ) ( not ( = ?auto_168208 ?auto_168212 ) ) ( not ( = ?auto_168208 ?auto_168213 ) ) ( not ( = ?auto_168208 ?auto_168214 ) ) ( not ( = ?auto_168208 ?auto_168215 ) ) ( not ( = ?auto_168208 ?auto_168216 ) ) ( not ( = ?auto_168209 ?auto_168210 ) ) ( not ( = ?auto_168209 ?auto_168211 ) ) ( not ( = ?auto_168209 ?auto_168212 ) ) ( not ( = ?auto_168209 ?auto_168213 ) ) ( not ( = ?auto_168209 ?auto_168214 ) ) ( not ( = ?auto_168209 ?auto_168215 ) ) ( not ( = ?auto_168209 ?auto_168216 ) ) ( not ( = ?auto_168210 ?auto_168211 ) ) ( not ( = ?auto_168210 ?auto_168212 ) ) ( not ( = ?auto_168210 ?auto_168213 ) ) ( not ( = ?auto_168210 ?auto_168214 ) ) ( not ( = ?auto_168210 ?auto_168215 ) ) ( not ( = ?auto_168210 ?auto_168216 ) ) ( not ( = ?auto_168211 ?auto_168212 ) ) ( not ( = ?auto_168211 ?auto_168213 ) ) ( not ( = ?auto_168211 ?auto_168214 ) ) ( not ( = ?auto_168211 ?auto_168215 ) ) ( not ( = ?auto_168211 ?auto_168216 ) ) ( not ( = ?auto_168212 ?auto_168213 ) ) ( not ( = ?auto_168212 ?auto_168214 ) ) ( not ( = ?auto_168212 ?auto_168215 ) ) ( not ( = ?auto_168212 ?auto_168216 ) ) ( not ( = ?auto_168213 ?auto_168214 ) ) ( not ( = ?auto_168213 ?auto_168215 ) ) ( not ( = ?auto_168213 ?auto_168216 ) ) ( not ( = ?auto_168214 ?auto_168215 ) ) ( not ( = ?auto_168214 ?auto_168216 ) ) ( not ( = ?auto_168215 ?auto_168216 ) ) ( ON ?auto_168214 ?auto_168215 ) ( ON ?auto_168213 ?auto_168214 ) ( ON ?auto_168212 ?auto_168213 ) ( ON ?auto_168211 ?auto_168212 ) ( ON ?auto_168210 ?auto_168211 ) ( CLEAR ?auto_168208 ) ( ON ?auto_168209 ?auto_168210 ) ( CLEAR ?auto_168209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168206 ?auto_168207 ?auto_168208 ?auto_168209 )
      ( MAKE-10PILE ?auto_168206 ?auto_168207 ?auto_168208 ?auto_168209 ?auto_168210 ?auto_168211 ?auto_168212 ?auto_168213 ?auto_168214 ?auto_168215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168227 - BLOCK
      ?auto_168228 - BLOCK
      ?auto_168229 - BLOCK
      ?auto_168230 - BLOCK
      ?auto_168231 - BLOCK
      ?auto_168232 - BLOCK
      ?auto_168233 - BLOCK
      ?auto_168234 - BLOCK
      ?auto_168235 - BLOCK
      ?auto_168236 - BLOCK
    )
    :vars
    (
      ?auto_168237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168236 ?auto_168237 ) ( ON-TABLE ?auto_168227 ) ( ON ?auto_168228 ?auto_168227 ) ( ON ?auto_168229 ?auto_168228 ) ( not ( = ?auto_168227 ?auto_168228 ) ) ( not ( = ?auto_168227 ?auto_168229 ) ) ( not ( = ?auto_168227 ?auto_168230 ) ) ( not ( = ?auto_168227 ?auto_168231 ) ) ( not ( = ?auto_168227 ?auto_168232 ) ) ( not ( = ?auto_168227 ?auto_168233 ) ) ( not ( = ?auto_168227 ?auto_168234 ) ) ( not ( = ?auto_168227 ?auto_168235 ) ) ( not ( = ?auto_168227 ?auto_168236 ) ) ( not ( = ?auto_168227 ?auto_168237 ) ) ( not ( = ?auto_168228 ?auto_168229 ) ) ( not ( = ?auto_168228 ?auto_168230 ) ) ( not ( = ?auto_168228 ?auto_168231 ) ) ( not ( = ?auto_168228 ?auto_168232 ) ) ( not ( = ?auto_168228 ?auto_168233 ) ) ( not ( = ?auto_168228 ?auto_168234 ) ) ( not ( = ?auto_168228 ?auto_168235 ) ) ( not ( = ?auto_168228 ?auto_168236 ) ) ( not ( = ?auto_168228 ?auto_168237 ) ) ( not ( = ?auto_168229 ?auto_168230 ) ) ( not ( = ?auto_168229 ?auto_168231 ) ) ( not ( = ?auto_168229 ?auto_168232 ) ) ( not ( = ?auto_168229 ?auto_168233 ) ) ( not ( = ?auto_168229 ?auto_168234 ) ) ( not ( = ?auto_168229 ?auto_168235 ) ) ( not ( = ?auto_168229 ?auto_168236 ) ) ( not ( = ?auto_168229 ?auto_168237 ) ) ( not ( = ?auto_168230 ?auto_168231 ) ) ( not ( = ?auto_168230 ?auto_168232 ) ) ( not ( = ?auto_168230 ?auto_168233 ) ) ( not ( = ?auto_168230 ?auto_168234 ) ) ( not ( = ?auto_168230 ?auto_168235 ) ) ( not ( = ?auto_168230 ?auto_168236 ) ) ( not ( = ?auto_168230 ?auto_168237 ) ) ( not ( = ?auto_168231 ?auto_168232 ) ) ( not ( = ?auto_168231 ?auto_168233 ) ) ( not ( = ?auto_168231 ?auto_168234 ) ) ( not ( = ?auto_168231 ?auto_168235 ) ) ( not ( = ?auto_168231 ?auto_168236 ) ) ( not ( = ?auto_168231 ?auto_168237 ) ) ( not ( = ?auto_168232 ?auto_168233 ) ) ( not ( = ?auto_168232 ?auto_168234 ) ) ( not ( = ?auto_168232 ?auto_168235 ) ) ( not ( = ?auto_168232 ?auto_168236 ) ) ( not ( = ?auto_168232 ?auto_168237 ) ) ( not ( = ?auto_168233 ?auto_168234 ) ) ( not ( = ?auto_168233 ?auto_168235 ) ) ( not ( = ?auto_168233 ?auto_168236 ) ) ( not ( = ?auto_168233 ?auto_168237 ) ) ( not ( = ?auto_168234 ?auto_168235 ) ) ( not ( = ?auto_168234 ?auto_168236 ) ) ( not ( = ?auto_168234 ?auto_168237 ) ) ( not ( = ?auto_168235 ?auto_168236 ) ) ( not ( = ?auto_168235 ?auto_168237 ) ) ( not ( = ?auto_168236 ?auto_168237 ) ) ( ON ?auto_168235 ?auto_168236 ) ( ON ?auto_168234 ?auto_168235 ) ( ON ?auto_168233 ?auto_168234 ) ( ON ?auto_168232 ?auto_168233 ) ( ON ?auto_168231 ?auto_168232 ) ( CLEAR ?auto_168229 ) ( ON ?auto_168230 ?auto_168231 ) ( CLEAR ?auto_168230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168227 ?auto_168228 ?auto_168229 ?auto_168230 )
      ( MAKE-10PILE ?auto_168227 ?auto_168228 ?auto_168229 ?auto_168230 ?auto_168231 ?auto_168232 ?auto_168233 ?auto_168234 ?auto_168235 ?auto_168236 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168248 - BLOCK
      ?auto_168249 - BLOCK
      ?auto_168250 - BLOCK
      ?auto_168251 - BLOCK
      ?auto_168252 - BLOCK
      ?auto_168253 - BLOCK
      ?auto_168254 - BLOCK
      ?auto_168255 - BLOCK
      ?auto_168256 - BLOCK
      ?auto_168257 - BLOCK
    )
    :vars
    (
      ?auto_168258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168257 ?auto_168258 ) ( ON-TABLE ?auto_168248 ) ( ON ?auto_168249 ?auto_168248 ) ( not ( = ?auto_168248 ?auto_168249 ) ) ( not ( = ?auto_168248 ?auto_168250 ) ) ( not ( = ?auto_168248 ?auto_168251 ) ) ( not ( = ?auto_168248 ?auto_168252 ) ) ( not ( = ?auto_168248 ?auto_168253 ) ) ( not ( = ?auto_168248 ?auto_168254 ) ) ( not ( = ?auto_168248 ?auto_168255 ) ) ( not ( = ?auto_168248 ?auto_168256 ) ) ( not ( = ?auto_168248 ?auto_168257 ) ) ( not ( = ?auto_168248 ?auto_168258 ) ) ( not ( = ?auto_168249 ?auto_168250 ) ) ( not ( = ?auto_168249 ?auto_168251 ) ) ( not ( = ?auto_168249 ?auto_168252 ) ) ( not ( = ?auto_168249 ?auto_168253 ) ) ( not ( = ?auto_168249 ?auto_168254 ) ) ( not ( = ?auto_168249 ?auto_168255 ) ) ( not ( = ?auto_168249 ?auto_168256 ) ) ( not ( = ?auto_168249 ?auto_168257 ) ) ( not ( = ?auto_168249 ?auto_168258 ) ) ( not ( = ?auto_168250 ?auto_168251 ) ) ( not ( = ?auto_168250 ?auto_168252 ) ) ( not ( = ?auto_168250 ?auto_168253 ) ) ( not ( = ?auto_168250 ?auto_168254 ) ) ( not ( = ?auto_168250 ?auto_168255 ) ) ( not ( = ?auto_168250 ?auto_168256 ) ) ( not ( = ?auto_168250 ?auto_168257 ) ) ( not ( = ?auto_168250 ?auto_168258 ) ) ( not ( = ?auto_168251 ?auto_168252 ) ) ( not ( = ?auto_168251 ?auto_168253 ) ) ( not ( = ?auto_168251 ?auto_168254 ) ) ( not ( = ?auto_168251 ?auto_168255 ) ) ( not ( = ?auto_168251 ?auto_168256 ) ) ( not ( = ?auto_168251 ?auto_168257 ) ) ( not ( = ?auto_168251 ?auto_168258 ) ) ( not ( = ?auto_168252 ?auto_168253 ) ) ( not ( = ?auto_168252 ?auto_168254 ) ) ( not ( = ?auto_168252 ?auto_168255 ) ) ( not ( = ?auto_168252 ?auto_168256 ) ) ( not ( = ?auto_168252 ?auto_168257 ) ) ( not ( = ?auto_168252 ?auto_168258 ) ) ( not ( = ?auto_168253 ?auto_168254 ) ) ( not ( = ?auto_168253 ?auto_168255 ) ) ( not ( = ?auto_168253 ?auto_168256 ) ) ( not ( = ?auto_168253 ?auto_168257 ) ) ( not ( = ?auto_168253 ?auto_168258 ) ) ( not ( = ?auto_168254 ?auto_168255 ) ) ( not ( = ?auto_168254 ?auto_168256 ) ) ( not ( = ?auto_168254 ?auto_168257 ) ) ( not ( = ?auto_168254 ?auto_168258 ) ) ( not ( = ?auto_168255 ?auto_168256 ) ) ( not ( = ?auto_168255 ?auto_168257 ) ) ( not ( = ?auto_168255 ?auto_168258 ) ) ( not ( = ?auto_168256 ?auto_168257 ) ) ( not ( = ?auto_168256 ?auto_168258 ) ) ( not ( = ?auto_168257 ?auto_168258 ) ) ( ON ?auto_168256 ?auto_168257 ) ( ON ?auto_168255 ?auto_168256 ) ( ON ?auto_168254 ?auto_168255 ) ( ON ?auto_168253 ?auto_168254 ) ( ON ?auto_168252 ?auto_168253 ) ( ON ?auto_168251 ?auto_168252 ) ( CLEAR ?auto_168249 ) ( ON ?auto_168250 ?auto_168251 ) ( CLEAR ?auto_168250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168248 ?auto_168249 ?auto_168250 )
      ( MAKE-10PILE ?auto_168248 ?auto_168249 ?auto_168250 ?auto_168251 ?auto_168252 ?auto_168253 ?auto_168254 ?auto_168255 ?auto_168256 ?auto_168257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168269 - BLOCK
      ?auto_168270 - BLOCK
      ?auto_168271 - BLOCK
      ?auto_168272 - BLOCK
      ?auto_168273 - BLOCK
      ?auto_168274 - BLOCK
      ?auto_168275 - BLOCK
      ?auto_168276 - BLOCK
      ?auto_168277 - BLOCK
      ?auto_168278 - BLOCK
    )
    :vars
    (
      ?auto_168279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168278 ?auto_168279 ) ( ON-TABLE ?auto_168269 ) ( ON ?auto_168270 ?auto_168269 ) ( not ( = ?auto_168269 ?auto_168270 ) ) ( not ( = ?auto_168269 ?auto_168271 ) ) ( not ( = ?auto_168269 ?auto_168272 ) ) ( not ( = ?auto_168269 ?auto_168273 ) ) ( not ( = ?auto_168269 ?auto_168274 ) ) ( not ( = ?auto_168269 ?auto_168275 ) ) ( not ( = ?auto_168269 ?auto_168276 ) ) ( not ( = ?auto_168269 ?auto_168277 ) ) ( not ( = ?auto_168269 ?auto_168278 ) ) ( not ( = ?auto_168269 ?auto_168279 ) ) ( not ( = ?auto_168270 ?auto_168271 ) ) ( not ( = ?auto_168270 ?auto_168272 ) ) ( not ( = ?auto_168270 ?auto_168273 ) ) ( not ( = ?auto_168270 ?auto_168274 ) ) ( not ( = ?auto_168270 ?auto_168275 ) ) ( not ( = ?auto_168270 ?auto_168276 ) ) ( not ( = ?auto_168270 ?auto_168277 ) ) ( not ( = ?auto_168270 ?auto_168278 ) ) ( not ( = ?auto_168270 ?auto_168279 ) ) ( not ( = ?auto_168271 ?auto_168272 ) ) ( not ( = ?auto_168271 ?auto_168273 ) ) ( not ( = ?auto_168271 ?auto_168274 ) ) ( not ( = ?auto_168271 ?auto_168275 ) ) ( not ( = ?auto_168271 ?auto_168276 ) ) ( not ( = ?auto_168271 ?auto_168277 ) ) ( not ( = ?auto_168271 ?auto_168278 ) ) ( not ( = ?auto_168271 ?auto_168279 ) ) ( not ( = ?auto_168272 ?auto_168273 ) ) ( not ( = ?auto_168272 ?auto_168274 ) ) ( not ( = ?auto_168272 ?auto_168275 ) ) ( not ( = ?auto_168272 ?auto_168276 ) ) ( not ( = ?auto_168272 ?auto_168277 ) ) ( not ( = ?auto_168272 ?auto_168278 ) ) ( not ( = ?auto_168272 ?auto_168279 ) ) ( not ( = ?auto_168273 ?auto_168274 ) ) ( not ( = ?auto_168273 ?auto_168275 ) ) ( not ( = ?auto_168273 ?auto_168276 ) ) ( not ( = ?auto_168273 ?auto_168277 ) ) ( not ( = ?auto_168273 ?auto_168278 ) ) ( not ( = ?auto_168273 ?auto_168279 ) ) ( not ( = ?auto_168274 ?auto_168275 ) ) ( not ( = ?auto_168274 ?auto_168276 ) ) ( not ( = ?auto_168274 ?auto_168277 ) ) ( not ( = ?auto_168274 ?auto_168278 ) ) ( not ( = ?auto_168274 ?auto_168279 ) ) ( not ( = ?auto_168275 ?auto_168276 ) ) ( not ( = ?auto_168275 ?auto_168277 ) ) ( not ( = ?auto_168275 ?auto_168278 ) ) ( not ( = ?auto_168275 ?auto_168279 ) ) ( not ( = ?auto_168276 ?auto_168277 ) ) ( not ( = ?auto_168276 ?auto_168278 ) ) ( not ( = ?auto_168276 ?auto_168279 ) ) ( not ( = ?auto_168277 ?auto_168278 ) ) ( not ( = ?auto_168277 ?auto_168279 ) ) ( not ( = ?auto_168278 ?auto_168279 ) ) ( ON ?auto_168277 ?auto_168278 ) ( ON ?auto_168276 ?auto_168277 ) ( ON ?auto_168275 ?auto_168276 ) ( ON ?auto_168274 ?auto_168275 ) ( ON ?auto_168273 ?auto_168274 ) ( ON ?auto_168272 ?auto_168273 ) ( CLEAR ?auto_168270 ) ( ON ?auto_168271 ?auto_168272 ) ( CLEAR ?auto_168271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168269 ?auto_168270 ?auto_168271 )
      ( MAKE-10PILE ?auto_168269 ?auto_168270 ?auto_168271 ?auto_168272 ?auto_168273 ?auto_168274 ?auto_168275 ?auto_168276 ?auto_168277 ?auto_168278 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168290 - BLOCK
      ?auto_168291 - BLOCK
      ?auto_168292 - BLOCK
      ?auto_168293 - BLOCK
      ?auto_168294 - BLOCK
      ?auto_168295 - BLOCK
      ?auto_168296 - BLOCK
      ?auto_168297 - BLOCK
      ?auto_168298 - BLOCK
      ?auto_168299 - BLOCK
    )
    :vars
    (
      ?auto_168300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168299 ?auto_168300 ) ( ON-TABLE ?auto_168290 ) ( not ( = ?auto_168290 ?auto_168291 ) ) ( not ( = ?auto_168290 ?auto_168292 ) ) ( not ( = ?auto_168290 ?auto_168293 ) ) ( not ( = ?auto_168290 ?auto_168294 ) ) ( not ( = ?auto_168290 ?auto_168295 ) ) ( not ( = ?auto_168290 ?auto_168296 ) ) ( not ( = ?auto_168290 ?auto_168297 ) ) ( not ( = ?auto_168290 ?auto_168298 ) ) ( not ( = ?auto_168290 ?auto_168299 ) ) ( not ( = ?auto_168290 ?auto_168300 ) ) ( not ( = ?auto_168291 ?auto_168292 ) ) ( not ( = ?auto_168291 ?auto_168293 ) ) ( not ( = ?auto_168291 ?auto_168294 ) ) ( not ( = ?auto_168291 ?auto_168295 ) ) ( not ( = ?auto_168291 ?auto_168296 ) ) ( not ( = ?auto_168291 ?auto_168297 ) ) ( not ( = ?auto_168291 ?auto_168298 ) ) ( not ( = ?auto_168291 ?auto_168299 ) ) ( not ( = ?auto_168291 ?auto_168300 ) ) ( not ( = ?auto_168292 ?auto_168293 ) ) ( not ( = ?auto_168292 ?auto_168294 ) ) ( not ( = ?auto_168292 ?auto_168295 ) ) ( not ( = ?auto_168292 ?auto_168296 ) ) ( not ( = ?auto_168292 ?auto_168297 ) ) ( not ( = ?auto_168292 ?auto_168298 ) ) ( not ( = ?auto_168292 ?auto_168299 ) ) ( not ( = ?auto_168292 ?auto_168300 ) ) ( not ( = ?auto_168293 ?auto_168294 ) ) ( not ( = ?auto_168293 ?auto_168295 ) ) ( not ( = ?auto_168293 ?auto_168296 ) ) ( not ( = ?auto_168293 ?auto_168297 ) ) ( not ( = ?auto_168293 ?auto_168298 ) ) ( not ( = ?auto_168293 ?auto_168299 ) ) ( not ( = ?auto_168293 ?auto_168300 ) ) ( not ( = ?auto_168294 ?auto_168295 ) ) ( not ( = ?auto_168294 ?auto_168296 ) ) ( not ( = ?auto_168294 ?auto_168297 ) ) ( not ( = ?auto_168294 ?auto_168298 ) ) ( not ( = ?auto_168294 ?auto_168299 ) ) ( not ( = ?auto_168294 ?auto_168300 ) ) ( not ( = ?auto_168295 ?auto_168296 ) ) ( not ( = ?auto_168295 ?auto_168297 ) ) ( not ( = ?auto_168295 ?auto_168298 ) ) ( not ( = ?auto_168295 ?auto_168299 ) ) ( not ( = ?auto_168295 ?auto_168300 ) ) ( not ( = ?auto_168296 ?auto_168297 ) ) ( not ( = ?auto_168296 ?auto_168298 ) ) ( not ( = ?auto_168296 ?auto_168299 ) ) ( not ( = ?auto_168296 ?auto_168300 ) ) ( not ( = ?auto_168297 ?auto_168298 ) ) ( not ( = ?auto_168297 ?auto_168299 ) ) ( not ( = ?auto_168297 ?auto_168300 ) ) ( not ( = ?auto_168298 ?auto_168299 ) ) ( not ( = ?auto_168298 ?auto_168300 ) ) ( not ( = ?auto_168299 ?auto_168300 ) ) ( ON ?auto_168298 ?auto_168299 ) ( ON ?auto_168297 ?auto_168298 ) ( ON ?auto_168296 ?auto_168297 ) ( ON ?auto_168295 ?auto_168296 ) ( ON ?auto_168294 ?auto_168295 ) ( ON ?auto_168293 ?auto_168294 ) ( ON ?auto_168292 ?auto_168293 ) ( CLEAR ?auto_168290 ) ( ON ?auto_168291 ?auto_168292 ) ( CLEAR ?auto_168291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168290 ?auto_168291 )
      ( MAKE-10PILE ?auto_168290 ?auto_168291 ?auto_168292 ?auto_168293 ?auto_168294 ?auto_168295 ?auto_168296 ?auto_168297 ?auto_168298 ?auto_168299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168311 - BLOCK
      ?auto_168312 - BLOCK
      ?auto_168313 - BLOCK
      ?auto_168314 - BLOCK
      ?auto_168315 - BLOCK
      ?auto_168316 - BLOCK
      ?auto_168317 - BLOCK
      ?auto_168318 - BLOCK
      ?auto_168319 - BLOCK
      ?auto_168320 - BLOCK
    )
    :vars
    (
      ?auto_168321 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168320 ?auto_168321 ) ( ON-TABLE ?auto_168311 ) ( not ( = ?auto_168311 ?auto_168312 ) ) ( not ( = ?auto_168311 ?auto_168313 ) ) ( not ( = ?auto_168311 ?auto_168314 ) ) ( not ( = ?auto_168311 ?auto_168315 ) ) ( not ( = ?auto_168311 ?auto_168316 ) ) ( not ( = ?auto_168311 ?auto_168317 ) ) ( not ( = ?auto_168311 ?auto_168318 ) ) ( not ( = ?auto_168311 ?auto_168319 ) ) ( not ( = ?auto_168311 ?auto_168320 ) ) ( not ( = ?auto_168311 ?auto_168321 ) ) ( not ( = ?auto_168312 ?auto_168313 ) ) ( not ( = ?auto_168312 ?auto_168314 ) ) ( not ( = ?auto_168312 ?auto_168315 ) ) ( not ( = ?auto_168312 ?auto_168316 ) ) ( not ( = ?auto_168312 ?auto_168317 ) ) ( not ( = ?auto_168312 ?auto_168318 ) ) ( not ( = ?auto_168312 ?auto_168319 ) ) ( not ( = ?auto_168312 ?auto_168320 ) ) ( not ( = ?auto_168312 ?auto_168321 ) ) ( not ( = ?auto_168313 ?auto_168314 ) ) ( not ( = ?auto_168313 ?auto_168315 ) ) ( not ( = ?auto_168313 ?auto_168316 ) ) ( not ( = ?auto_168313 ?auto_168317 ) ) ( not ( = ?auto_168313 ?auto_168318 ) ) ( not ( = ?auto_168313 ?auto_168319 ) ) ( not ( = ?auto_168313 ?auto_168320 ) ) ( not ( = ?auto_168313 ?auto_168321 ) ) ( not ( = ?auto_168314 ?auto_168315 ) ) ( not ( = ?auto_168314 ?auto_168316 ) ) ( not ( = ?auto_168314 ?auto_168317 ) ) ( not ( = ?auto_168314 ?auto_168318 ) ) ( not ( = ?auto_168314 ?auto_168319 ) ) ( not ( = ?auto_168314 ?auto_168320 ) ) ( not ( = ?auto_168314 ?auto_168321 ) ) ( not ( = ?auto_168315 ?auto_168316 ) ) ( not ( = ?auto_168315 ?auto_168317 ) ) ( not ( = ?auto_168315 ?auto_168318 ) ) ( not ( = ?auto_168315 ?auto_168319 ) ) ( not ( = ?auto_168315 ?auto_168320 ) ) ( not ( = ?auto_168315 ?auto_168321 ) ) ( not ( = ?auto_168316 ?auto_168317 ) ) ( not ( = ?auto_168316 ?auto_168318 ) ) ( not ( = ?auto_168316 ?auto_168319 ) ) ( not ( = ?auto_168316 ?auto_168320 ) ) ( not ( = ?auto_168316 ?auto_168321 ) ) ( not ( = ?auto_168317 ?auto_168318 ) ) ( not ( = ?auto_168317 ?auto_168319 ) ) ( not ( = ?auto_168317 ?auto_168320 ) ) ( not ( = ?auto_168317 ?auto_168321 ) ) ( not ( = ?auto_168318 ?auto_168319 ) ) ( not ( = ?auto_168318 ?auto_168320 ) ) ( not ( = ?auto_168318 ?auto_168321 ) ) ( not ( = ?auto_168319 ?auto_168320 ) ) ( not ( = ?auto_168319 ?auto_168321 ) ) ( not ( = ?auto_168320 ?auto_168321 ) ) ( ON ?auto_168319 ?auto_168320 ) ( ON ?auto_168318 ?auto_168319 ) ( ON ?auto_168317 ?auto_168318 ) ( ON ?auto_168316 ?auto_168317 ) ( ON ?auto_168315 ?auto_168316 ) ( ON ?auto_168314 ?auto_168315 ) ( ON ?auto_168313 ?auto_168314 ) ( CLEAR ?auto_168311 ) ( ON ?auto_168312 ?auto_168313 ) ( CLEAR ?auto_168312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168311 ?auto_168312 )
      ( MAKE-10PILE ?auto_168311 ?auto_168312 ?auto_168313 ?auto_168314 ?auto_168315 ?auto_168316 ?auto_168317 ?auto_168318 ?auto_168319 ?auto_168320 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168332 - BLOCK
      ?auto_168333 - BLOCK
      ?auto_168334 - BLOCK
      ?auto_168335 - BLOCK
      ?auto_168336 - BLOCK
      ?auto_168337 - BLOCK
      ?auto_168338 - BLOCK
      ?auto_168339 - BLOCK
      ?auto_168340 - BLOCK
      ?auto_168341 - BLOCK
    )
    :vars
    (
      ?auto_168342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168341 ?auto_168342 ) ( not ( = ?auto_168332 ?auto_168333 ) ) ( not ( = ?auto_168332 ?auto_168334 ) ) ( not ( = ?auto_168332 ?auto_168335 ) ) ( not ( = ?auto_168332 ?auto_168336 ) ) ( not ( = ?auto_168332 ?auto_168337 ) ) ( not ( = ?auto_168332 ?auto_168338 ) ) ( not ( = ?auto_168332 ?auto_168339 ) ) ( not ( = ?auto_168332 ?auto_168340 ) ) ( not ( = ?auto_168332 ?auto_168341 ) ) ( not ( = ?auto_168332 ?auto_168342 ) ) ( not ( = ?auto_168333 ?auto_168334 ) ) ( not ( = ?auto_168333 ?auto_168335 ) ) ( not ( = ?auto_168333 ?auto_168336 ) ) ( not ( = ?auto_168333 ?auto_168337 ) ) ( not ( = ?auto_168333 ?auto_168338 ) ) ( not ( = ?auto_168333 ?auto_168339 ) ) ( not ( = ?auto_168333 ?auto_168340 ) ) ( not ( = ?auto_168333 ?auto_168341 ) ) ( not ( = ?auto_168333 ?auto_168342 ) ) ( not ( = ?auto_168334 ?auto_168335 ) ) ( not ( = ?auto_168334 ?auto_168336 ) ) ( not ( = ?auto_168334 ?auto_168337 ) ) ( not ( = ?auto_168334 ?auto_168338 ) ) ( not ( = ?auto_168334 ?auto_168339 ) ) ( not ( = ?auto_168334 ?auto_168340 ) ) ( not ( = ?auto_168334 ?auto_168341 ) ) ( not ( = ?auto_168334 ?auto_168342 ) ) ( not ( = ?auto_168335 ?auto_168336 ) ) ( not ( = ?auto_168335 ?auto_168337 ) ) ( not ( = ?auto_168335 ?auto_168338 ) ) ( not ( = ?auto_168335 ?auto_168339 ) ) ( not ( = ?auto_168335 ?auto_168340 ) ) ( not ( = ?auto_168335 ?auto_168341 ) ) ( not ( = ?auto_168335 ?auto_168342 ) ) ( not ( = ?auto_168336 ?auto_168337 ) ) ( not ( = ?auto_168336 ?auto_168338 ) ) ( not ( = ?auto_168336 ?auto_168339 ) ) ( not ( = ?auto_168336 ?auto_168340 ) ) ( not ( = ?auto_168336 ?auto_168341 ) ) ( not ( = ?auto_168336 ?auto_168342 ) ) ( not ( = ?auto_168337 ?auto_168338 ) ) ( not ( = ?auto_168337 ?auto_168339 ) ) ( not ( = ?auto_168337 ?auto_168340 ) ) ( not ( = ?auto_168337 ?auto_168341 ) ) ( not ( = ?auto_168337 ?auto_168342 ) ) ( not ( = ?auto_168338 ?auto_168339 ) ) ( not ( = ?auto_168338 ?auto_168340 ) ) ( not ( = ?auto_168338 ?auto_168341 ) ) ( not ( = ?auto_168338 ?auto_168342 ) ) ( not ( = ?auto_168339 ?auto_168340 ) ) ( not ( = ?auto_168339 ?auto_168341 ) ) ( not ( = ?auto_168339 ?auto_168342 ) ) ( not ( = ?auto_168340 ?auto_168341 ) ) ( not ( = ?auto_168340 ?auto_168342 ) ) ( not ( = ?auto_168341 ?auto_168342 ) ) ( ON ?auto_168340 ?auto_168341 ) ( ON ?auto_168339 ?auto_168340 ) ( ON ?auto_168338 ?auto_168339 ) ( ON ?auto_168337 ?auto_168338 ) ( ON ?auto_168336 ?auto_168337 ) ( ON ?auto_168335 ?auto_168336 ) ( ON ?auto_168334 ?auto_168335 ) ( ON ?auto_168333 ?auto_168334 ) ( ON ?auto_168332 ?auto_168333 ) ( CLEAR ?auto_168332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168332 )
      ( MAKE-10PILE ?auto_168332 ?auto_168333 ?auto_168334 ?auto_168335 ?auto_168336 ?auto_168337 ?auto_168338 ?auto_168339 ?auto_168340 ?auto_168341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_168353 - BLOCK
      ?auto_168354 - BLOCK
      ?auto_168355 - BLOCK
      ?auto_168356 - BLOCK
      ?auto_168357 - BLOCK
      ?auto_168358 - BLOCK
      ?auto_168359 - BLOCK
      ?auto_168360 - BLOCK
      ?auto_168361 - BLOCK
      ?auto_168362 - BLOCK
    )
    :vars
    (
      ?auto_168363 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168362 ?auto_168363 ) ( not ( = ?auto_168353 ?auto_168354 ) ) ( not ( = ?auto_168353 ?auto_168355 ) ) ( not ( = ?auto_168353 ?auto_168356 ) ) ( not ( = ?auto_168353 ?auto_168357 ) ) ( not ( = ?auto_168353 ?auto_168358 ) ) ( not ( = ?auto_168353 ?auto_168359 ) ) ( not ( = ?auto_168353 ?auto_168360 ) ) ( not ( = ?auto_168353 ?auto_168361 ) ) ( not ( = ?auto_168353 ?auto_168362 ) ) ( not ( = ?auto_168353 ?auto_168363 ) ) ( not ( = ?auto_168354 ?auto_168355 ) ) ( not ( = ?auto_168354 ?auto_168356 ) ) ( not ( = ?auto_168354 ?auto_168357 ) ) ( not ( = ?auto_168354 ?auto_168358 ) ) ( not ( = ?auto_168354 ?auto_168359 ) ) ( not ( = ?auto_168354 ?auto_168360 ) ) ( not ( = ?auto_168354 ?auto_168361 ) ) ( not ( = ?auto_168354 ?auto_168362 ) ) ( not ( = ?auto_168354 ?auto_168363 ) ) ( not ( = ?auto_168355 ?auto_168356 ) ) ( not ( = ?auto_168355 ?auto_168357 ) ) ( not ( = ?auto_168355 ?auto_168358 ) ) ( not ( = ?auto_168355 ?auto_168359 ) ) ( not ( = ?auto_168355 ?auto_168360 ) ) ( not ( = ?auto_168355 ?auto_168361 ) ) ( not ( = ?auto_168355 ?auto_168362 ) ) ( not ( = ?auto_168355 ?auto_168363 ) ) ( not ( = ?auto_168356 ?auto_168357 ) ) ( not ( = ?auto_168356 ?auto_168358 ) ) ( not ( = ?auto_168356 ?auto_168359 ) ) ( not ( = ?auto_168356 ?auto_168360 ) ) ( not ( = ?auto_168356 ?auto_168361 ) ) ( not ( = ?auto_168356 ?auto_168362 ) ) ( not ( = ?auto_168356 ?auto_168363 ) ) ( not ( = ?auto_168357 ?auto_168358 ) ) ( not ( = ?auto_168357 ?auto_168359 ) ) ( not ( = ?auto_168357 ?auto_168360 ) ) ( not ( = ?auto_168357 ?auto_168361 ) ) ( not ( = ?auto_168357 ?auto_168362 ) ) ( not ( = ?auto_168357 ?auto_168363 ) ) ( not ( = ?auto_168358 ?auto_168359 ) ) ( not ( = ?auto_168358 ?auto_168360 ) ) ( not ( = ?auto_168358 ?auto_168361 ) ) ( not ( = ?auto_168358 ?auto_168362 ) ) ( not ( = ?auto_168358 ?auto_168363 ) ) ( not ( = ?auto_168359 ?auto_168360 ) ) ( not ( = ?auto_168359 ?auto_168361 ) ) ( not ( = ?auto_168359 ?auto_168362 ) ) ( not ( = ?auto_168359 ?auto_168363 ) ) ( not ( = ?auto_168360 ?auto_168361 ) ) ( not ( = ?auto_168360 ?auto_168362 ) ) ( not ( = ?auto_168360 ?auto_168363 ) ) ( not ( = ?auto_168361 ?auto_168362 ) ) ( not ( = ?auto_168361 ?auto_168363 ) ) ( not ( = ?auto_168362 ?auto_168363 ) ) ( ON ?auto_168361 ?auto_168362 ) ( ON ?auto_168360 ?auto_168361 ) ( ON ?auto_168359 ?auto_168360 ) ( ON ?auto_168358 ?auto_168359 ) ( ON ?auto_168357 ?auto_168358 ) ( ON ?auto_168356 ?auto_168357 ) ( ON ?auto_168355 ?auto_168356 ) ( ON ?auto_168354 ?auto_168355 ) ( ON ?auto_168353 ?auto_168354 ) ( CLEAR ?auto_168353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168353 )
      ( MAKE-10PILE ?auto_168353 ?auto_168354 ?auto_168355 ?auto_168356 ?auto_168357 ?auto_168358 ?auto_168359 ?auto_168360 ?auto_168361 ?auto_168362 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168375 - BLOCK
      ?auto_168376 - BLOCK
      ?auto_168377 - BLOCK
      ?auto_168378 - BLOCK
      ?auto_168379 - BLOCK
      ?auto_168380 - BLOCK
      ?auto_168381 - BLOCK
      ?auto_168382 - BLOCK
      ?auto_168383 - BLOCK
      ?auto_168384 - BLOCK
      ?auto_168385 - BLOCK
    )
    :vars
    (
      ?auto_168386 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168384 ) ( ON ?auto_168385 ?auto_168386 ) ( CLEAR ?auto_168385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168375 ) ( ON ?auto_168376 ?auto_168375 ) ( ON ?auto_168377 ?auto_168376 ) ( ON ?auto_168378 ?auto_168377 ) ( ON ?auto_168379 ?auto_168378 ) ( ON ?auto_168380 ?auto_168379 ) ( ON ?auto_168381 ?auto_168380 ) ( ON ?auto_168382 ?auto_168381 ) ( ON ?auto_168383 ?auto_168382 ) ( ON ?auto_168384 ?auto_168383 ) ( not ( = ?auto_168375 ?auto_168376 ) ) ( not ( = ?auto_168375 ?auto_168377 ) ) ( not ( = ?auto_168375 ?auto_168378 ) ) ( not ( = ?auto_168375 ?auto_168379 ) ) ( not ( = ?auto_168375 ?auto_168380 ) ) ( not ( = ?auto_168375 ?auto_168381 ) ) ( not ( = ?auto_168375 ?auto_168382 ) ) ( not ( = ?auto_168375 ?auto_168383 ) ) ( not ( = ?auto_168375 ?auto_168384 ) ) ( not ( = ?auto_168375 ?auto_168385 ) ) ( not ( = ?auto_168375 ?auto_168386 ) ) ( not ( = ?auto_168376 ?auto_168377 ) ) ( not ( = ?auto_168376 ?auto_168378 ) ) ( not ( = ?auto_168376 ?auto_168379 ) ) ( not ( = ?auto_168376 ?auto_168380 ) ) ( not ( = ?auto_168376 ?auto_168381 ) ) ( not ( = ?auto_168376 ?auto_168382 ) ) ( not ( = ?auto_168376 ?auto_168383 ) ) ( not ( = ?auto_168376 ?auto_168384 ) ) ( not ( = ?auto_168376 ?auto_168385 ) ) ( not ( = ?auto_168376 ?auto_168386 ) ) ( not ( = ?auto_168377 ?auto_168378 ) ) ( not ( = ?auto_168377 ?auto_168379 ) ) ( not ( = ?auto_168377 ?auto_168380 ) ) ( not ( = ?auto_168377 ?auto_168381 ) ) ( not ( = ?auto_168377 ?auto_168382 ) ) ( not ( = ?auto_168377 ?auto_168383 ) ) ( not ( = ?auto_168377 ?auto_168384 ) ) ( not ( = ?auto_168377 ?auto_168385 ) ) ( not ( = ?auto_168377 ?auto_168386 ) ) ( not ( = ?auto_168378 ?auto_168379 ) ) ( not ( = ?auto_168378 ?auto_168380 ) ) ( not ( = ?auto_168378 ?auto_168381 ) ) ( not ( = ?auto_168378 ?auto_168382 ) ) ( not ( = ?auto_168378 ?auto_168383 ) ) ( not ( = ?auto_168378 ?auto_168384 ) ) ( not ( = ?auto_168378 ?auto_168385 ) ) ( not ( = ?auto_168378 ?auto_168386 ) ) ( not ( = ?auto_168379 ?auto_168380 ) ) ( not ( = ?auto_168379 ?auto_168381 ) ) ( not ( = ?auto_168379 ?auto_168382 ) ) ( not ( = ?auto_168379 ?auto_168383 ) ) ( not ( = ?auto_168379 ?auto_168384 ) ) ( not ( = ?auto_168379 ?auto_168385 ) ) ( not ( = ?auto_168379 ?auto_168386 ) ) ( not ( = ?auto_168380 ?auto_168381 ) ) ( not ( = ?auto_168380 ?auto_168382 ) ) ( not ( = ?auto_168380 ?auto_168383 ) ) ( not ( = ?auto_168380 ?auto_168384 ) ) ( not ( = ?auto_168380 ?auto_168385 ) ) ( not ( = ?auto_168380 ?auto_168386 ) ) ( not ( = ?auto_168381 ?auto_168382 ) ) ( not ( = ?auto_168381 ?auto_168383 ) ) ( not ( = ?auto_168381 ?auto_168384 ) ) ( not ( = ?auto_168381 ?auto_168385 ) ) ( not ( = ?auto_168381 ?auto_168386 ) ) ( not ( = ?auto_168382 ?auto_168383 ) ) ( not ( = ?auto_168382 ?auto_168384 ) ) ( not ( = ?auto_168382 ?auto_168385 ) ) ( not ( = ?auto_168382 ?auto_168386 ) ) ( not ( = ?auto_168383 ?auto_168384 ) ) ( not ( = ?auto_168383 ?auto_168385 ) ) ( not ( = ?auto_168383 ?auto_168386 ) ) ( not ( = ?auto_168384 ?auto_168385 ) ) ( not ( = ?auto_168384 ?auto_168386 ) ) ( not ( = ?auto_168385 ?auto_168386 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168385 ?auto_168386 )
      ( !STACK ?auto_168385 ?auto_168384 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168398 - BLOCK
      ?auto_168399 - BLOCK
      ?auto_168400 - BLOCK
      ?auto_168401 - BLOCK
      ?auto_168402 - BLOCK
      ?auto_168403 - BLOCK
      ?auto_168404 - BLOCK
      ?auto_168405 - BLOCK
      ?auto_168406 - BLOCK
      ?auto_168407 - BLOCK
      ?auto_168408 - BLOCK
    )
    :vars
    (
      ?auto_168409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168407 ) ( ON ?auto_168408 ?auto_168409 ) ( CLEAR ?auto_168408 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168398 ) ( ON ?auto_168399 ?auto_168398 ) ( ON ?auto_168400 ?auto_168399 ) ( ON ?auto_168401 ?auto_168400 ) ( ON ?auto_168402 ?auto_168401 ) ( ON ?auto_168403 ?auto_168402 ) ( ON ?auto_168404 ?auto_168403 ) ( ON ?auto_168405 ?auto_168404 ) ( ON ?auto_168406 ?auto_168405 ) ( ON ?auto_168407 ?auto_168406 ) ( not ( = ?auto_168398 ?auto_168399 ) ) ( not ( = ?auto_168398 ?auto_168400 ) ) ( not ( = ?auto_168398 ?auto_168401 ) ) ( not ( = ?auto_168398 ?auto_168402 ) ) ( not ( = ?auto_168398 ?auto_168403 ) ) ( not ( = ?auto_168398 ?auto_168404 ) ) ( not ( = ?auto_168398 ?auto_168405 ) ) ( not ( = ?auto_168398 ?auto_168406 ) ) ( not ( = ?auto_168398 ?auto_168407 ) ) ( not ( = ?auto_168398 ?auto_168408 ) ) ( not ( = ?auto_168398 ?auto_168409 ) ) ( not ( = ?auto_168399 ?auto_168400 ) ) ( not ( = ?auto_168399 ?auto_168401 ) ) ( not ( = ?auto_168399 ?auto_168402 ) ) ( not ( = ?auto_168399 ?auto_168403 ) ) ( not ( = ?auto_168399 ?auto_168404 ) ) ( not ( = ?auto_168399 ?auto_168405 ) ) ( not ( = ?auto_168399 ?auto_168406 ) ) ( not ( = ?auto_168399 ?auto_168407 ) ) ( not ( = ?auto_168399 ?auto_168408 ) ) ( not ( = ?auto_168399 ?auto_168409 ) ) ( not ( = ?auto_168400 ?auto_168401 ) ) ( not ( = ?auto_168400 ?auto_168402 ) ) ( not ( = ?auto_168400 ?auto_168403 ) ) ( not ( = ?auto_168400 ?auto_168404 ) ) ( not ( = ?auto_168400 ?auto_168405 ) ) ( not ( = ?auto_168400 ?auto_168406 ) ) ( not ( = ?auto_168400 ?auto_168407 ) ) ( not ( = ?auto_168400 ?auto_168408 ) ) ( not ( = ?auto_168400 ?auto_168409 ) ) ( not ( = ?auto_168401 ?auto_168402 ) ) ( not ( = ?auto_168401 ?auto_168403 ) ) ( not ( = ?auto_168401 ?auto_168404 ) ) ( not ( = ?auto_168401 ?auto_168405 ) ) ( not ( = ?auto_168401 ?auto_168406 ) ) ( not ( = ?auto_168401 ?auto_168407 ) ) ( not ( = ?auto_168401 ?auto_168408 ) ) ( not ( = ?auto_168401 ?auto_168409 ) ) ( not ( = ?auto_168402 ?auto_168403 ) ) ( not ( = ?auto_168402 ?auto_168404 ) ) ( not ( = ?auto_168402 ?auto_168405 ) ) ( not ( = ?auto_168402 ?auto_168406 ) ) ( not ( = ?auto_168402 ?auto_168407 ) ) ( not ( = ?auto_168402 ?auto_168408 ) ) ( not ( = ?auto_168402 ?auto_168409 ) ) ( not ( = ?auto_168403 ?auto_168404 ) ) ( not ( = ?auto_168403 ?auto_168405 ) ) ( not ( = ?auto_168403 ?auto_168406 ) ) ( not ( = ?auto_168403 ?auto_168407 ) ) ( not ( = ?auto_168403 ?auto_168408 ) ) ( not ( = ?auto_168403 ?auto_168409 ) ) ( not ( = ?auto_168404 ?auto_168405 ) ) ( not ( = ?auto_168404 ?auto_168406 ) ) ( not ( = ?auto_168404 ?auto_168407 ) ) ( not ( = ?auto_168404 ?auto_168408 ) ) ( not ( = ?auto_168404 ?auto_168409 ) ) ( not ( = ?auto_168405 ?auto_168406 ) ) ( not ( = ?auto_168405 ?auto_168407 ) ) ( not ( = ?auto_168405 ?auto_168408 ) ) ( not ( = ?auto_168405 ?auto_168409 ) ) ( not ( = ?auto_168406 ?auto_168407 ) ) ( not ( = ?auto_168406 ?auto_168408 ) ) ( not ( = ?auto_168406 ?auto_168409 ) ) ( not ( = ?auto_168407 ?auto_168408 ) ) ( not ( = ?auto_168407 ?auto_168409 ) ) ( not ( = ?auto_168408 ?auto_168409 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168408 ?auto_168409 )
      ( !STACK ?auto_168408 ?auto_168407 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168421 - BLOCK
      ?auto_168422 - BLOCK
      ?auto_168423 - BLOCK
      ?auto_168424 - BLOCK
      ?auto_168425 - BLOCK
      ?auto_168426 - BLOCK
      ?auto_168427 - BLOCK
      ?auto_168428 - BLOCK
      ?auto_168429 - BLOCK
      ?auto_168430 - BLOCK
      ?auto_168431 - BLOCK
    )
    :vars
    (
      ?auto_168432 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168431 ?auto_168432 ) ( ON-TABLE ?auto_168421 ) ( ON ?auto_168422 ?auto_168421 ) ( ON ?auto_168423 ?auto_168422 ) ( ON ?auto_168424 ?auto_168423 ) ( ON ?auto_168425 ?auto_168424 ) ( ON ?auto_168426 ?auto_168425 ) ( ON ?auto_168427 ?auto_168426 ) ( ON ?auto_168428 ?auto_168427 ) ( ON ?auto_168429 ?auto_168428 ) ( not ( = ?auto_168421 ?auto_168422 ) ) ( not ( = ?auto_168421 ?auto_168423 ) ) ( not ( = ?auto_168421 ?auto_168424 ) ) ( not ( = ?auto_168421 ?auto_168425 ) ) ( not ( = ?auto_168421 ?auto_168426 ) ) ( not ( = ?auto_168421 ?auto_168427 ) ) ( not ( = ?auto_168421 ?auto_168428 ) ) ( not ( = ?auto_168421 ?auto_168429 ) ) ( not ( = ?auto_168421 ?auto_168430 ) ) ( not ( = ?auto_168421 ?auto_168431 ) ) ( not ( = ?auto_168421 ?auto_168432 ) ) ( not ( = ?auto_168422 ?auto_168423 ) ) ( not ( = ?auto_168422 ?auto_168424 ) ) ( not ( = ?auto_168422 ?auto_168425 ) ) ( not ( = ?auto_168422 ?auto_168426 ) ) ( not ( = ?auto_168422 ?auto_168427 ) ) ( not ( = ?auto_168422 ?auto_168428 ) ) ( not ( = ?auto_168422 ?auto_168429 ) ) ( not ( = ?auto_168422 ?auto_168430 ) ) ( not ( = ?auto_168422 ?auto_168431 ) ) ( not ( = ?auto_168422 ?auto_168432 ) ) ( not ( = ?auto_168423 ?auto_168424 ) ) ( not ( = ?auto_168423 ?auto_168425 ) ) ( not ( = ?auto_168423 ?auto_168426 ) ) ( not ( = ?auto_168423 ?auto_168427 ) ) ( not ( = ?auto_168423 ?auto_168428 ) ) ( not ( = ?auto_168423 ?auto_168429 ) ) ( not ( = ?auto_168423 ?auto_168430 ) ) ( not ( = ?auto_168423 ?auto_168431 ) ) ( not ( = ?auto_168423 ?auto_168432 ) ) ( not ( = ?auto_168424 ?auto_168425 ) ) ( not ( = ?auto_168424 ?auto_168426 ) ) ( not ( = ?auto_168424 ?auto_168427 ) ) ( not ( = ?auto_168424 ?auto_168428 ) ) ( not ( = ?auto_168424 ?auto_168429 ) ) ( not ( = ?auto_168424 ?auto_168430 ) ) ( not ( = ?auto_168424 ?auto_168431 ) ) ( not ( = ?auto_168424 ?auto_168432 ) ) ( not ( = ?auto_168425 ?auto_168426 ) ) ( not ( = ?auto_168425 ?auto_168427 ) ) ( not ( = ?auto_168425 ?auto_168428 ) ) ( not ( = ?auto_168425 ?auto_168429 ) ) ( not ( = ?auto_168425 ?auto_168430 ) ) ( not ( = ?auto_168425 ?auto_168431 ) ) ( not ( = ?auto_168425 ?auto_168432 ) ) ( not ( = ?auto_168426 ?auto_168427 ) ) ( not ( = ?auto_168426 ?auto_168428 ) ) ( not ( = ?auto_168426 ?auto_168429 ) ) ( not ( = ?auto_168426 ?auto_168430 ) ) ( not ( = ?auto_168426 ?auto_168431 ) ) ( not ( = ?auto_168426 ?auto_168432 ) ) ( not ( = ?auto_168427 ?auto_168428 ) ) ( not ( = ?auto_168427 ?auto_168429 ) ) ( not ( = ?auto_168427 ?auto_168430 ) ) ( not ( = ?auto_168427 ?auto_168431 ) ) ( not ( = ?auto_168427 ?auto_168432 ) ) ( not ( = ?auto_168428 ?auto_168429 ) ) ( not ( = ?auto_168428 ?auto_168430 ) ) ( not ( = ?auto_168428 ?auto_168431 ) ) ( not ( = ?auto_168428 ?auto_168432 ) ) ( not ( = ?auto_168429 ?auto_168430 ) ) ( not ( = ?auto_168429 ?auto_168431 ) ) ( not ( = ?auto_168429 ?auto_168432 ) ) ( not ( = ?auto_168430 ?auto_168431 ) ) ( not ( = ?auto_168430 ?auto_168432 ) ) ( not ( = ?auto_168431 ?auto_168432 ) ) ( CLEAR ?auto_168429 ) ( ON ?auto_168430 ?auto_168431 ) ( CLEAR ?auto_168430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_168421 ?auto_168422 ?auto_168423 ?auto_168424 ?auto_168425 ?auto_168426 ?auto_168427 ?auto_168428 ?auto_168429 ?auto_168430 )
      ( MAKE-11PILE ?auto_168421 ?auto_168422 ?auto_168423 ?auto_168424 ?auto_168425 ?auto_168426 ?auto_168427 ?auto_168428 ?auto_168429 ?auto_168430 ?auto_168431 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168444 - BLOCK
      ?auto_168445 - BLOCK
      ?auto_168446 - BLOCK
      ?auto_168447 - BLOCK
      ?auto_168448 - BLOCK
      ?auto_168449 - BLOCK
      ?auto_168450 - BLOCK
      ?auto_168451 - BLOCK
      ?auto_168452 - BLOCK
      ?auto_168453 - BLOCK
      ?auto_168454 - BLOCK
    )
    :vars
    (
      ?auto_168455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168454 ?auto_168455 ) ( ON-TABLE ?auto_168444 ) ( ON ?auto_168445 ?auto_168444 ) ( ON ?auto_168446 ?auto_168445 ) ( ON ?auto_168447 ?auto_168446 ) ( ON ?auto_168448 ?auto_168447 ) ( ON ?auto_168449 ?auto_168448 ) ( ON ?auto_168450 ?auto_168449 ) ( ON ?auto_168451 ?auto_168450 ) ( ON ?auto_168452 ?auto_168451 ) ( not ( = ?auto_168444 ?auto_168445 ) ) ( not ( = ?auto_168444 ?auto_168446 ) ) ( not ( = ?auto_168444 ?auto_168447 ) ) ( not ( = ?auto_168444 ?auto_168448 ) ) ( not ( = ?auto_168444 ?auto_168449 ) ) ( not ( = ?auto_168444 ?auto_168450 ) ) ( not ( = ?auto_168444 ?auto_168451 ) ) ( not ( = ?auto_168444 ?auto_168452 ) ) ( not ( = ?auto_168444 ?auto_168453 ) ) ( not ( = ?auto_168444 ?auto_168454 ) ) ( not ( = ?auto_168444 ?auto_168455 ) ) ( not ( = ?auto_168445 ?auto_168446 ) ) ( not ( = ?auto_168445 ?auto_168447 ) ) ( not ( = ?auto_168445 ?auto_168448 ) ) ( not ( = ?auto_168445 ?auto_168449 ) ) ( not ( = ?auto_168445 ?auto_168450 ) ) ( not ( = ?auto_168445 ?auto_168451 ) ) ( not ( = ?auto_168445 ?auto_168452 ) ) ( not ( = ?auto_168445 ?auto_168453 ) ) ( not ( = ?auto_168445 ?auto_168454 ) ) ( not ( = ?auto_168445 ?auto_168455 ) ) ( not ( = ?auto_168446 ?auto_168447 ) ) ( not ( = ?auto_168446 ?auto_168448 ) ) ( not ( = ?auto_168446 ?auto_168449 ) ) ( not ( = ?auto_168446 ?auto_168450 ) ) ( not ( = ?auto_168446 ?auto_168451 ) ) ( not ( = ?auto_168446 ?auto_168452 ) ) ( not ( = ?auto_168446 ?auto_168453 ) ) ( not ( = ?auto_168446 ?auto_168454 ) ) ( not ( = ?auto_168446 ?auto_168455 ) ) ( not ( = ?auto_168447 ?auto_168448 ) ) ( not ( = ?auto_168447 ?auto_168449 ) ) ( not ( = ?auto_168447 ?auto_168450 ) ) ( not ( = ?auto_168447 ?auto_168451 ) ) ( not ( = ?auto_168447 ?auto_168452 ) ) ( not ( = ?auto_168447 ?auto_168453 ) ) ( not ( = ?auto_168447 ?auto_168454 ) ) ( not ( = ?auto_168447 ?auto_168455 ) ) ( not ( = ?auto_168448 ?auto_168449 ) ) ( not ( = ?auto_168448 ?auto_168450 ) ) ( not ( = ?auto_168448 ?auto_168451 ) ) ( not ( = ?auto_168448 ?auto_168452 ) ) ( not ( = ?auto_168448 ?auto_168453 ) ) ( not ( = ?auto_168448 ?auto_168454 ) ) ( not ( = ?auto_168448 ?auto_168455 ) ) ( not ( = ?auto_168449 ?auto_168450 ) ) ( not ( = ?auto_168449 ?auto_168451 ) ) ( not ( = ?auto_168449 ?auto_168452 ) ) ( not ( = ?auto_168449 ?auto_168453 ) ) ( not ( = ?auto_168449 ?auto_168454 ) ) ( not ( = ?auto_168449 ?auto_168455 ) ) ( not ( = ?auto_168450 ?auto_168451 ) ) ( not ( = ?auto_168450 ?auto_168452 ) ) ( not ( = ?auto_168450 ?auto_168453 ) ) ( not ( = ?auto_168450 ?auto_168454 ) ) ( not ( = ?auto_168450 ?auto_168455 ) ) ( not ( = ?auto_168451 ?auto_168452 ) ) ( not ( = ?auto_168451 ?auto_168453 ) ) ( not ( = ?auto_168451 ?auto_168454 ) ) ( not ( = ?auto_168451 ?auto_168455 ) ) ( not ( = ?auto_168452 ?auto_168453 ) ) ( not ( = ?auto_168452 ?auto_168454 ) ) ( not ( = ?auto_168452 ?auto_168455 ) ) ( not ( = ?auto_168453 ?auto_168454 ) ) ( not ( = ?auto_168453 ?auto_168455 ) ) ( not ( = ?auto_168454 ?auto_168455 ) ) ( CLEAR ?auto_168452 ) ( ON ?auto_168453 ?auto_168454 ) ( CLEAR ?auto_168453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_168444 ?auto_168445 ?auto_168446 ?auto_168447 ?auto_168448 ?auto_168449 ?auto_168450 ?auto_168451 ?auto_168452 ?auto_168453 )
      ( MAKE-11PILE ?auto_168444 ?auto_168445 ?auto_168446 ?auto_168447 ?auto_168448 ?auto_168449 ?auto_168450 ?auto_168451 ?auto_168452 ?auto_168453 ?auto_168454 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168467 - BLOCK
      ?auto_168468 - BLOCK
      ?auto_168469 - BLOCK
      ?auto_168470 - BLOCK
      ?auto_168471 - BLOCK
      ?auto_168472 - BLOCK
      ?auto_168473 - BLOCK
      ?auto_168474 - BLOCK
      ?auto_168475 - BLOCK
      ?auto_168476 - BLOCK
      ?auto_168477 - BLOCK
    )
    :vars
    (
      ?auto_168478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168477 ?auto_168478 ) ( ON-TABLE ?auto_168467 ) ( ON ?auto_168468 ?auto_168467 ) ( ON ?auto_168469 ?auto_168468 ) ( ON ?auto_168470 ?auto_168469 ) ( ON ?auto_168471 ?auto_168470 ) ( ON ?auto_168472 ?auto_168471 ) ( ON ?auto_168473 ?auto_168472 ) ( ON ?auto_168474 ?auto_168473 ) ( not ( = ?auto_168467 ?auto_168468 ) ) ( not ( = ?auto_168467 ?auto_168469 ) ) ( not ( = ?auto_168467 ?auto_168470 ) ) ( not ( = ?auto_168467 ?auto_168471 ) ) ( not ( = ?auto_168467 ?auto_168472 ) ) ( not ( = ?auto_168467 ?auto_168473 ) ) ( not ( = ?auto_168467 ?auto_168474 ) ) ( not ( = ?auto_168467 ?auto_168475 ) ) ( not ( = ?auto_168467 ?auto_168476 ) ) ( not ( = ?auto_168467 ?auto_168477 ) ) ( not ( = ?auto_168467 ?auto_168478 ) ) ( not ( = ?auto_168468 ?auto_168469 ) ) ( not ( = ?auto_168468 ?auto_168470 ) ) ( not ( = ?auto_168468 ?auto_168471 ) ) ( not ( = ?auto_168468 ?auto_168472 ) ) ( not ( = ?auto_168468 ?auto_168473 ) ) ( not ( = ?auto_168468 ?auto_168474 ) ) ( not ( = ?auto_168468 ?auto_168475 ) ) ( not ( = ?auto_168468 ?auto_168476 ) ) ( not ( = ?auto_168468 ?auto_168477 ) ) ( not ( = ?auto_168468 ?auto_168478 ) ) ( not ( = ?auto_168469 ?auto_168470 ) ) ( not ( = ?auto_168469 ?auto_168471 ) ) ( not ( = ?auto_168469 ?auto_168472 ) ) ( not ( = ?auto_168469 ?auto_168473 ) ) ( not ( = ?auto_168469 ?auto_168474 ) ) ( not ( = ?auto_168469 ?auto_168475 ) ) ( not ( = ?auto_168469 ?auto_168476 ) ) ( not ( = ?auto_168469 ?auto_168477 ) ) ( not ( = ?auto_168469 ?auto_168478 ) ) ( not ( = ?auto_168470 ?auto_168471 ) ) ( not ( = ?auto_168470 ?auto_168472 ) ) ( not ( = ?auto_168470 ?auto_168473 ) ) ( not ( = ?auto_168470 ?auto_168474 ) ) ( not ( = ?auto_168470 ?auto_168475 ) ) ( not ( = ?auto_168470 ?auto_168476 ) ) ( not ( = ?auto_168470 ?auto_168477 ) ) ( not ( = ?auto_168470 ?auto_168478 ) ) ( not ( = ?auto_168471 ?auto_168472 ) ) ( not ( = ?auto_168471 ?auto_168473 ) ) ( not ( = ?auto_168471 ?auto_168474 ) ) ( not ( = ?auto_168471 ?auto_168475 ) ) ( not ( = ?auto_168471 ?auto_168476 ) ) ( not ( = ?auto_168471 ?auto_168477 ) ) ( not ( = ?auto_168471 ?auto_168478 ) ) ( not ( = ?auto_168472 ?auto_168473 ) ) ( not ( = ?auto_168472 ?auto_168474 ) ) ( not ( = ?auto_168472 ?auto_168475 ) ) ( not ( = ?auto_168472 ?auto_168476 ) ) ( not ( = ?auto_168472 ?auto_168477 ) ) ( not ( = ?auto_168472 ?auto_168478 ) ) ( not ( = ?auto_168473 ?auto_168474 ) ) ( not ( = ?auto_168473 ?auto_168475 ) ) ( not ( = ?auto_168473 ?auto_168476 ) ) ( not ( = ?auto_168473 ?auto_168477 ) ) ( not ( = ?auto_168473 ?auto_168478 ) ) ( not ( = ?auto_168474 ?auto_168475 ) ) ( not ( = ?auto_168474 ?auto_168476 ) ) ( not ( = ?auto_168474 ?auto_168477 ) ) ( not ( = ?auto_168474 ?auto_168478 ) ) ( not ( = ?auto_168475 ?auto_168476 ) ) ( not ( = ?auto_168475 ?auto_168477 ) ) ( not ( = ?auto_168475 ?auto_168478 ) ) ( not ( = ?auto_168476 ?auto_168477 ) ) ( not ( = ?auto_168476 ?auto_168478 ) ) ( not ( = ?auto_168477 ?auto_168478 ) ) ( ON ?auto_168476 ?auto_168477 ) ( CLEAR ?auto_168474 ) ( ON ?auto_168475 ?auto_168476 ) ( CLEAR ?auto_168475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_168467 ?auto_168468 ?auto_168469 ?auto_168470 ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 )
      ( MAKE-11PILE ?auto_168467 ?auto_168468 ?auto_168469 ?auto_168470 ?auto_168471 ?auto_168472 ?auto_168473 ?auto_168474 ?auto_168475 ?auto_168476 ?auto_168477 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168490 - BLOCK
      ?auto_168491 - BLOCK
      ?auto_168492 - BLOCK
      ?auto_168493 - BLOCK
      ?auto_168494 - BLOCK
      ?auto_168495 - BLOCK
      ?auto_168496 - BLOCK
      ?auto_168497 - BLOCK
      ?auto_168498 - BLOCK
      ?auto_168499 - BLOCK
      ?auto_168500 - BLOCK
    )
    :vars
    (
      ?auto_168501 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168500 ?auto_168501 ) ( ON-TABLE ?auto_168490 ) ( ON ?auto_168491 ?auto_168490 ) ( ON ?auto_168492 ?auto_168491 ) ( ON ?auto_168493 ?auto_168492 ) ( ON ?auto_168494 ?auto_168493 ) ( ON ?auto_168495 ?auto_168494 ) ( ON ?auto_168496 ?auto_168495 ) ( ON ?auto_168497 ?auto_168496 ) ( not ( = ?auto_168490 ?auto_168491 ) ) ( not ( = ?auto_168490 ?auto_168492 ) ) ( not ( = ?auto_168490 ?auto_168493 ) ) ( not ( = ?auto_168490 ?auto_168494 ) ) ( not ( = ?auto_168490 ?auto_168495 ) ) ( not ( = ?auto_168490 ?auto_168496 ) ) ( not ( = ?auto_168490 ?auto_168497 ) ) ( not ( = ?auto_168490 ?auto_168498 ) ) ( not ( = ?auto_168490 ?auto_168499 ) ) ( not ( = ?auto_168490 ?auto_168500 ) ) ( not ( = ?auto_168490 ?auto_168501 ) ) ( not ( = ?auto_168491 ?auto_168492 ) ) ( not ( = ?auto_168491 ?auto_168493 ) ) ( not ( = ?auto_168491 ?auto_168494 ) ) ( not ( = ?auto_168491 ?auto_168495 ) ) ( not ( = ?auto_168491 ?auto_168496 ) ) ( not ( = ?auto_168491 ?auto_168497 ) ) ( not ( = ?auto_168491 ?auto_168498 ) ) ( not ( = ?auto_168491 ?auto_168499 ) ) ( not ( = ?auto_168491 ?auto_168500 ) ) ( not ( = ?auto_168491 ?auto_168501 ) ) ( not ( = ?auto_168492 ?auto_168493 ) ) ( not ( = ?auto_168492 ?auto_168494 ) ) ( not ( = ?auto_168492 ?auto_168495 ) ) ( not ( = ?auto_168492 ?auto_168496 ) ) ( not ( = ?auto_168492 ?auto_168497 ) ) ( not ( = ?auto_168492 ?auto_168498 ) ) ( not ( = ?auto_168492 ?auto_168499 ) ) ( not ( = ?auto_168492 ?auto_168500 ) ) ( not ( = ?auto_168492 ?auto_168501 ) ) ( not ( = ?auto_168493 ?auto_168494 ) ) ( not ( = ?auto_168493 ?auto_168495 ) ) ( not ( = ?auto_168493 ?auto_168496 ) ) ( not ( = ?auto_168493 ?auto_168497 ) ) ( not ( = ?auto_168493 ?auto_168498 ) ) ( not ( = ?auto_168493 ?auto_168499 ) ) ( not ( = ?auto_168493 ?auto_168500 ) ) ( not ( = ?auto_168493 ?auto_168501 ) ) ( not ( = ?auto_168494 ?auto_168495 ) ) ( not ( = ?auto_168494 ?auto_168496 ) ) ( not ( = ?auto_168494 ?auto_168497 ) ) ( not ( = ?auto_168494 ?auto_168498 ) ) ( not ( = ?auto_168494 ?auto_168499 ) ) ( not ( = ?auto_168494 ?auto_168500 ) ) ( not ( = ?auto_168494 ?auto_168501 ) ) ( not ( = ?auto_168495 ?auto_168496 ) ) ( not ( = ?auto_168495 ?auto_168497 ) ) ( not ( = ?auto_168495 ?auto_168498 ) ) ( not ( = ?auto_168495 ?auto_168499 ) ) ( not ( = ?auto_168495 ?auto_168500 ) ) ( not ( = ?auto_168495 ?auto_168501 ) ) ( not ( = ?auto_168496 ?auto_168497 ) ) ( not ( = ?auto_168496 ?auto_168498 ) ) ( not ( = ?auto_168496 ?auto_168499 ) ) ( not ( = ?auto_168496 ?auto_168500 ) ) ( not ( = ?auto_168496 ?auto_168501 ) ) ( not ( = ?auto_168497 ?auto_168498 ) ) ( not ( = ?auto_168497 ?auto_168499 ) ) ( not ( = ?auto_168497 ?auto_168500 ) ) ( not ( = ?auto_168497 ?auto_168501 ) ) ( not ( = ?auto_168498 ?auto_168499 ) ) ( not ( = ?auto_168498 ?auto_168500 ) ) ( not ( = ?auto_168498 ?auto_168501 ) ) ( not ( = ?auto_168499 ?auto_168500 ) ) ( not ( = ?auto_168499 ?auto_168501 ) ) ( not ( = ?auto_168500 ?auto_168501 ) ) ( ON ?auto_168499 ?auto_168500 ) ( CLEAR ?auto_168497 ) ( ON ?auto_168498 ?auto_168499 ) ( CLEAR ?auto_168498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_168490 ?auto_168491 ?auto_168492 ?auto_168493 ?auto_168494 ?auto_168495 ?auto_168496 ?auto_168497 ?auto_168498 )
      ( MAKE-11PILE ?auto_168490 ?auto_168491 ?auto_168492 ?auto_168493 ?auto_168494 ?auto_168495 ?auto_168496 ?auto_168497 ?auto_168498 ?auto_168499 ?auto_168500 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168513 - BLOCK
      ?auto_168514 - BLOCK
      ?auto_168515 - BLOCK
      ?auto_168516 - BLOCK
      ?auto_168517 - BLOCK
      ?auto_168518 - BLOCK
      ?auto_168519 - BLOCK
      ?auto_168520 - BLOCK
      ?auto_168521 - BLOCK
      ?auto_168522 - BLOCK
      ?auto_168523 - BLOCK
    )
    :vars
    (
      ?auto_168524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168523 ?auto_168524 ) ( ON-TABLE ?auto_168513 ) ( ON ?auto_168514 ?auto_168513 ) ( ON ?auto_168515 ?auto_168514 ) ( ON ?auto_168516 ?auto_168515 ) ( ON ?auto_168517 ?auto_168516 ) ( ON ?auto_168518 ?auto_168517 ) ( ON ?auto_168519 ?auto_168518 ) ( not ( = ?auto_168513 ?auto_168514 ) ) ( not ( = ?auto_168513 ?auto_168515 ) ) ( not ( = ?auto_168513 ?auto_168516 ) ) ( not ( = ?auto_168513 ?auto_168517 ) ) ( not ( = ?auto_168513 ?auto_168518 ) ) ( not ( = ?auto_168513 ?auto_168519 ) ) ( not ( = ?auto_168513 ?auto_168520 ) ) ( not ( = ?auto_168513 ?auto_168521 ) ) ( not ( = ?auto_168513 ?auto_168522 ) ) ( not ( = ?auto_168513 ?auto_168523 ) ) ( not ( = ?auto_168513 ?auto_168524 ) ) ( not ( = ?auto_168514 ?auto_168515 ) ) ( not ( = ?auto_168514 ?auto_168516 ) ) ( not ( = ?auto_168514 ?auto_168517 ) ) ( not ( = ?auto_168514 ?auto_168518 ) ) ( not ( = ?auto_168514 ?auto_168519 ) ) ( not ( = ?auto_168514 ?auto_168520 ) ) ( not ( = ?auto_168514 ?auto_168521 ) ) ( not ( = ?auto_168514 ?auto_168522 ) ) ( not ( = ?auto_168514 ?auto_168523 ) ) ( not ( = ?auto_168514 ?auto_168524 ) ) ( not ( = ?auto_168515 ?auto_168516 ) ) ( not ( = ?auto_168515 ?auto_168517 ) ) ( not ( = ?auto_168515 ?auto_168518 ) ) ( not ( = ?auto_168515 ?auto_168519 ) ) ( not ( = ?auto_168515 ?auto_168520 ) ) ( not ( = ?auto_168515 ?auto_168521 ) ) ( not ( = ?auto_168515 ?auto_168522 ) ) ( not ( = ?auto_168515 ?auto_168523 ) ) ( not ( = ?auto_168515 ?auto_168524 ) ) ( not ( = ?auto_168516 ?auto_168517 ) ) ( not ( = ?auto_168516 ?auto_168518 ) ) ( not ( = ?auto_168516 ?auto_168519 ) ) ( not ( = ?auto_168516 ?auto_168520 ) ) ( not ( = ?auto_168516 ?auto_168521 ) ) ( not ( = ?auto_168516 ?auto_168522 ) ) ( not ( = ?auto_168516 ?auto_168523 ) ) ( not ( = ?auto_168516 ?auto_168524 ) ) ( not ( = ?auto_168517 ?auto_168518 ) ) ( not ( = ?auto_168517 ?auto_168519 ) ) ( not ( = ?auto_168517 ?auto_168520 ) ) ( not ( = ?auto_168517 ?auto_168521 ) ) ( not ( = ?auto_168517 ?auto_168522 ) ) ( not ( = ?auto_168517 ?auto_168523 ) ) ( not ( = ?auto_168517 ?auto_168524 ) ) ( not ( = ?auto_168518 ?auto_168519 ) ) ( not ( = ?auto_168518 ?auto_168520 ) ) ( not ( = ?auto_168518 ?auto_168521 ) ) ( not ( = ?auto_168518 ?auto_168522 ) ) ( not ( = ?auto_168518 ?auto_168523 ) ) ( not ( = ?auto_168518 ?auto_168524 ) ) ( not ( = ?auto_168519 ?auto_168520 ) ) ( not ( = ?auto_168519 ?auto_168521 ) ) ( not ( = ?auto_168519 ?auto_168522 ) ) ( not ( = ?auto_168519 ?auto_168523 ) ) ( not ( = ?auto_168519 ?auto_168524 ) ) ( not ( = ?auto_168520 ?auto_168521 ) ) ( not ( = ?auto_168520 ?auto_168522 ) ) ( not ( = ?auto_168520 ?auto_168523 ) ) ( not ( = ?auto_168520 ?auto_168524 ) ) ( not ( = ?auto_168521 ?auto_168522 ) ) ( not ( = ?auto_168521 ?auto_168523 ) ) ( not ( = ?auto_168521 ?auto_168524 ) ) ( not ( = ?auto_168522 ?auto_168523 ) ) ( not ( = ?auto_168522 ?auto_168524 ) ) ( not ( = ?auto_168523 ?auto_168524 ) ) ( ON ?auto_168522 ?auto_168523 ) ( ON ?auto_168521 ?auto_168522 ) ( CLEAR ?auto_168519 ) ( ON ?auto_168520 ?auto_168521 ) ( CLEAR ?auto_168520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168513 ?auto_168514 ?auto_168515 ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 )
      ( MAKE-11PILE ?auto_168513 ?auto_168514 ?auto_168515 ?auto_168516 ?auto_168517 ?auto_168518 ?auto_168519 ?auto_168520 ?auto_168521 ?auto_168522 ?auto_168523 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168536 - BLOCK
      ?auto_168537 - BLOCK
      ?auto_168538 - BLOCK
      ?auto_168539 - BLOCK
      ?auto_168540 - BLOCK
      ?auto_168541 - BLOCK
      ?auto_168542 - BLOCK
      ?auto_168543 - BLOCK
      ?auto_168544 - BLOCK
      ?auto_168545 - BLOCK
      ?auto_168546 - BLOCK
    )
    :vars
    (
      ?auto_168547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168546 ?auto_168547 ) ( ON-TABLE ?auto_168536 ) ( ON ?auto_168537 ?auto_168536 ) ( ON ?auto_168538 ?auto_168537 ) ( ON ?auto_168539 ?auto_168538 ) ( ON ?auto_168540 ?auto_168539 ) ( ON ?auto_168541 ?auto_168540 ) ( ON ?auto_168542 ?auto_168541 ) ( not ( = ?auto_168536 ?auto_168537 ) ) ( not ( = ?auto_168536 ?auto_168538 ) ) ( not ( = ?auto_168536 ?auto_168539 ) ) ( not ( = ?auto_168536 ?auto_168540 ) ) ( not ( = ?auto_168536 ?auto_168541 ) ) ( not ( = ?auto_168536 ?auto_168542 ) ) ( not ( = ?auto_168536 ?auto_168543 ) ) ( not ( = ?auto_168536 ?auto_168544 ) ) ( not ( = ?auto_168536 ?auto_168545 ) ) ( not ( = ?auto_168536 ?auto_168546 ) ) ( not ( = ?auto_168536 ?auto_168547 ) ) ( not ( = ?auto_168537 ?auto_168538 ) ) ( not ( = ?auto_168537 ?auto_168539 ) ) ( not ( = ?auto_168537 ?auto_168540 ) ) ( not ( = ?auto_168537 ?auto_168541 ) ) ( not ( = ?auto_168537 ?auto_168542 ) ) ( not ( = ?auto_168537 ?auto_168543 ) ) ( not ( = ?auto_168537 ?auto_168544 ) ) ( not ( = ?auto_168537 ?auto_168545 ) ) ( not ( = ?auto_168537 ?auto_168546 ) ) ( not ( = ?auto_168537 ?auto_168547 ) ) ( not ( = ?auto_168538 ?auto_168539 ) ) ( not ( = ?auto_168538 ?auto_168540 ) ) ( not ( = ?auto_168538 ?auto_168541 ) ) ( not ( = ?auto_168538 ?auto_168542 ) ) ( not ( = ?auto_168538 ?auto_168543 ) ) ( not ( = ?auto_168538 ?auto_168544 ) ) ( not ( = ?auto_168538 ?auto_168545 ) ) ( not ( = ?auto_168538 ?auto_168546 ) ) ( not ( = ?auto_168538 ?auto_168547 ) ) ( not ( = ?auto_168539 ?auto_168540 ) ) ( not ( = ?auto_168539 ?auto_168541 ) ) ( not ( = ?auto_168539 ?auto_168542 ) ) ( not ( = ?auto_168539 ?auto_168543 ) ) ( not ( = ?auto_168539 ?auto_168544 ) ) ( not ( = ?auto_168539 ?auto_168545 ) ) ( not ( = ?auto_168539 ?auto_168546 ) ) ( not ( = ?auto_168539 ?auto_168547 ) ) ( not ( = ?auto_168540 ?auto_168541 ) ) ( not ( = ?auto_168540 ?auto_168542 ) ) ( not ( = ?auto_168540 ?auto_168543 ) ) ( not ( = ?auto_168540 ?auto_168544 ) ) ( not ( = ?auto_168540 ?auto_168545 ) ) ( not ( = ?auto_168540 ?auto_168546 ) ) ( not ( = ?auto_168540 ?auto_168547 ) ) ( not ( = ?auto_168541 ?auto_168542 ) ) ( not ( = ?auto_168541 ?auto_168543 ) ) ( not ( = ?auto_168541 ?auto_168544 ) ) ( not ( = ?auto_168541 ?auto_168545 ) ) ( not ( = ?auto_168541 ?auto_168546 ) ) ( not ( = ?auto_168541 ?auto_168547 ) ) ( not ( = ?auto_168542 ?auto_168543 ) ) ( not ( = ?auto_168542 ?auto_168544 ) ) ( not ( = ?auto_168542 ?auto_168545 ) ) ( not ( = ?auto_168542 ?auto_168546 ) ) ( not ( = ?auto_168542 ?auto_168547 ) ) ( not ( = ?auto_168543 ?auto_168544 ) ) ( not ( = ?auto_168543 ?auto_168545 ) ) ( not ( = ?auto_168543 ?auto_168546 ) ) ( not ( = ?auto_168543 ?auto_168547 ) ) ( not ( = ?auto_168544 ?auto_168545 ) ) ( not ( = ?auto_168544 ?auto_168546 ) ) ( not ( = ?auto_168544 ?auto_168547 ) ) ( not ( = ?auto_168545 ?auto_168546 ) ) ( not ( = ?auto_168545 ?auto_168547 ) ) ( not ( = ?auto_168546 ?auto_168547 ) ) ( ON ?auto_168545 ?auto_168546 ) ( ON ?auto_168544 ?auto_168545 ) ( CLEAR ?auto_168542 ) ( ON ?auto_168543 ?auto_168544 ) ( CLEAR ?auto_168543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_168536 ?auto_168537 ?auto_168538 ?auto_168539 ?auto_168540 ?auto_168541 ?auto_168542 ?auto_168543 )
      ( MAKE-11PILE ?auto_168536 ?auto_168537 ?auto_168538 ?auto_168539 ?auto_168540 ?auto_168541 ?auto_168542 ?auto_168543 ?auto_168544 ?auto_168545 ?auto_168546 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168559 - BLOCK
      ?auto_168560 - BLOCK
      ?auto_168561 - BLOCK
      ?auto_168562 - BLOCK
      ?auto_168563 - BLOCK
      ?auto_168564 - BLOCK
      ?auto_168565 - BLOCK
      ?auto_168566 - BLOCK
      ?auto_168567 - BLOCK
      ?auto_168568 - BLOCK
      ?auto_168569 - BLOCK
    )
    :vars
    (
      ?auto_168570 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168569 ?auto_168570 ) ( ON-TABLE ?auto_168559 ) ( ON ?auto_168560 ?auto_168559 ) ( ON ?auto_168561 ?auto_168560 ) ( ON ?auto_168562 ?auto_168561 ) ( ON ?auto_168563 ?auto_168562 ) ( ON ?auto_168564 ?auto_168563 ) ( not ( = ?auto_168559 ?auto_168560 ) ) ( not ( = ?auto_168559 ?auto_168561 ) ) ( not ( = ?auto_168559 ?auto_168562 ) ) ( not ( = ?auto_168559 ?auto_168563 ) ) ( not ( = ?auto_168559 ?auto_168564 ) ) ( not ( = ?auto_168559 ?auto_168565 ) ) ( not ( = ?auto_168559 ?auto_168566 ) ) ( not ( = ?auto_168559 ?auto_168567 ) ) ( not ( = ?auto_168559 ?auto_168568 ) ) ( not ( = ?auto_168559 ?auto_168569 ) ) ( not ( = ?auto_168559 ?auto_168570 ) ) ( not ( = ?auto_168560 ?auto_168561 ) ) ( not ( = ?auto_168560 ?auto_168562 ) ) ( not ( = ?auto_168560 ?auto_168563 ) ) ( not ( = ?auto_168560 ?auto_168564 ) ) ( not ( = ?auto_168560 ?auto_168565 ) ) ( not ( = ?auto_168560 ?auto_168566 ) ) ( not ( = ?auto_168560 ?auto_168567 ) ) ( not ( = ?auto_168560 ?auto_168568 ) ) ( not ( = ?auto_168560 ?auto_168569 ) ) ( not ( = ?auto_168560 ?auto_168570 ) ) ( not ( = ?auto_168561 ?auto_168562 ) ) ( not ( = ?auto_168561 ?auto_168563 ) ) ( not ( = ?auto_168561 ?auto_168564 ) ) ( not ( = ?auto_168561 ?auto_168565 ) ) ( not ( = ?auto_168561 ?auto_168566 ) ) ( not ( = ?auto_168561 ?auto_168567 ) ) ( not ( = ?auto_168561 ?auto_168568 ) ) ( not ( = ?auto_168561 ?auto_168569 ) ) ( not ( = ?auto_168561 ?auto_168570 ) ) ( not ( = ?auto_168562 ?auto_168563 ) ) ( not ( = ?auto_168562 ?auto_168564 ) ) ( not ( = ?auto_168562 ?auto_168565 ) ) ( not ( = ?auto_168562 ?auto_168566 ) ) ( not ( = ?auto_168562 ?auto_168567 ) ) ( not ( = ?auto_168562 ?auto_168568 ) ) ( not ( = ?auto_168562 ?auto_168569 ) ) ( not ( = ?auto_168562 ?auto_168570 ) ) ( not ( = ?auto_168563 ?auto_168564 ) ) ( not ( = ?auto_168563 ?auto_168565 ) ) ( not ( = ?auto_168563 ?auto_168566 ) ) ( not ( = ?auto_168563 ?auto_168567 ) ) ( not ( = ?auto_168563 ?auto_168568 ) ) ( not ( = ?auto_168563 ?auto_168569 ) ) ( not ( = ?auto_168563 ?auto_168570 ) ) ( not ( = ?auto_168564 ?auto_168565 ) ) ( not ( = ?auto_168564 ?auto_168566 ) ) ( not ( = ?auto_168564 ?auto_168567 ) ) ( not ( = ?auto_168564 ?auto_168568 ) ) ( not ( = ?auto_168564 ?auto_168569 ) ) ( not ( = ?auto_168564 ?auto_168570 ) ) ( not ( = ?auto_168565 ?auto_168566 ) ) ( not ( = ?auto_168565 ?auto_168567 ) ) ( not ( = ?auto_168565 ?auto_168568 ) ) ( not ( = ?auto_168565 ?auto_168569 ) ) ( not ( = ?auto_168565 ?auto_168570 ) ) ( not ( = ?auto_168566 ?auto_168567 ) ) ( not ( = ?auto_168566 ?auto_168568 ) ) ( not ( = ?auto_168566 ?auto_168569 ) ) ( not ( = ?auto_168566 ?auto_168570 ) ) ( not ( = ?auto_168567 ?auto_168568 ) ) ( not ( = ?auto_168567 ?auto_168569 ) ) ( not ( = ?auto_168567 ?auto_168570 ) ) ( not ( = ?auto_168568 ?auto_168569 ) ) ( not ( = ?auto_168568 ?auto_168570 ) ) ( not ( = ?auto_168569 ?auto_168570 ) ) ( ON ?auto_168568 ?auto_168569 ) ( ON ?auto_168567 ?auto_168568 ) ( ON ?auto_168566 ?auto_168567 ) ( CLEAR ?auto_168564 ) ( ON ?auto_168565 ?auto_168566 ) ( CLEAR ?auto_168565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168559 ?auto_168560 ?auto_168561 ?auto_168562 ?auto_168563 ?auto_168564 ?auto_168565 )
      ( MAKE-11PILE ?auto_168559 ?auto_168560 ?auto_168561 ?auto_168562 ?auto_168563 ?auto_168564 ?auto_168565 ?auto_168566 ?auto_168567 ?auto_168568 ?auto_168569 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168582 - BLOCK
      ?auto_168583 - BLOCK
      ?auto_168584 - BLOCK
      ?auto_168585 - BLOCK
      ?auto_168586 - BLOCK
      ?auto_168587 - BLOCK
      ?auto_168588 - BLOCK
      ?auto_168589 - BLOCK
      ?auto_168590 - BLOCK
      ?auto_168591 - BLOCK
      ?auto_168592 - BLOCK
    )
    :vars
    (
      ?auto_168593 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168592 ?auto_168593 ) ( ON-TABLE ?auto_168582 ) ( ON ?auto_168583 ?auto_168582 ) ( ON ?auto_168584 ?auto_168583 ) ( ON ?auto_168585 ?auto_168584 ) ( ON ?auto_168586 ?auto_168585 ) ( ON ?auto_168587 ?auto_168586 ) ( not ( = ?auto_168582 ?auto_168583 ) ) ( not ( = ?auto_168582 ?auto_168584 ) ) ( not ( = ?auto_168582 ?auto_168585 ) ) ( not ( = ?auto_168582 ?auto_168586 ) ) ( not ( = ?auto_168582 ?auto_168587 ) ) ( not ( = ?auto_168582 ?auto_168588 ) ) ( not ( = ?auto_168582 ?auto_168589 ) ) ( not ( = ?auto_168582 ?auto_168590 ) ) ( not ( = ?auto_168582 ?auto_168591 ) ) ( not ( = ?auto_168582 ?auto_168592 ) ) ( not ( = ?auto_168582 ?auto_168593 ) ) ( not ( = ?auto_168583 ?auto_168584 ) ) ( not ( = ?auto_168583 ?auto_168585 ) ) ( not ( = ?auto_168583 ?auto_168586 ) ) ( not ( = ?auto_168583 ?auto_168587 ) ) ( not ( = ?auto_168583 ?auto_168588 ) ) ( not ( = ?auto_168583 ?auto_168589 ) ) ( not ( = ?auto_168583 ?auto_168590 ) ) ( not ( = ?auto_168583 ?auto_168591 ) ) ( not ( = ?auto_168583 ?auto_168592 ) ) ( not ( = ?auto_168583 ?auto_168593 ) ) ( not ( = ?auto_168584 ?auto_168585 ) ) ( not ( = ?auto_168584 ?auto_168586 ) ) ( not ( = ?auto_168584 ?auto_168587 ) ) ( not ( = ?auto_168584 ?auto_168588 ) ) ( not ( = ?auto_168584 ?auto_168589 ) ) ( not ( = ?auto_168584 ?auto_168590 ) ) ( not ( = ?auto_168584 ?auto_168591 ) ) ( not ( = ?auto_168584 ?auto_168592 ) ) ( not ( = ?auto_168584 ?auto_168593 ) ) ( not ( = ?auto_168585 ?auto_168586 ) ) ( not ( = ?auto_168585 ?auto_168587 ) ) ( not ( = ?auto_168585 ?auto_168588 ) ) ( not ( = ?auto_168585 ?auto_168589 ) ) ( not ( = ?auto_168585 ?auto_168590 ) ) ( not ( = ?auto_168585 ?auto_168591 ) ) ( not ( = ?auto_168585 ?auto_168592 ) ) ( not ( = ?auto_168585 ?auto_168593 ) ) ( not ( = ?auto_168586 ?auto_168587 ) ) ( not ( = ?auto_168586 ?auto_168588 ) ) ( not ( = ?auto_168586 ?auto_168589 ) ) ( not ( = ?auto_168586 ?auto_168590 ) ) ( not ( = ?auto_168586 ?auto_168591 ) ) ( not ( = ?auto_168586 ?auto_168592 ) ) ( not ( = ?auto_168586 ?auto_168593 ) ) ( not ( = ?auto_168587 ?auto_168588 ) ) ( not ( = ?auto_168587 ?auto_168589 ) ) ( not ( = ?auto_168587 ?auto_168590 ) ) ( not ( = ?auto_168587 ?auto_168591 ) ) ( not ( = ?auto_168587 ?auto_168592 ) ) ( not ( = ?auto_168587 ?auto_168593 ) ) ( not ( = ?auto_168588 ?auto_168589 ) ) ( not ( = ?auto_168588 ?auto_168590 ) ) ( not ( = ?auto_168588 ?auto_168591 ) ) ( not ( = ?auto_168588 ?auto_168592 ) ) ( not ( = ?auto_168588 ?auto_168593 ) ) ( not ( = ?auto_168589 ?auto_168590 ) ) ( not ( = ?auto_168589 ?auto_168591 ) ) ( not ( = ?auto_168589 ?auto_168592 ) ) ( not ( = ?auto_168589 ?auto_168593 ) ) ( not ( = ?auto_168590 ?auto_168591 ) ) ( not ( = ?auto_168590 ?auto_168592 ) ) ( not ( = ?auto_168590 ?auto_168593 ) ) ( not ( = ?auto_168591 ?auto_168592 ) ) ( not ( = ?auto_168591 ?auto_168593 ) ) ( not ( = ?auto_168592 ?auto_168593 ) ) ( ON ?auto_168591 ?auto_168592 ) ( ON ?auto_168590 ?auto_168591 ) ( ON ?auto_168589 ?auto_168590 ) ( CLEAR ?auto_168587 ) ( ON ?auto_168588 ?auto_168589 ) ( CLEAR ?auto_168588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_168582 ?auto_168583 ?auto_168584 ?auto_168585 ?auto_168586 ?auto_168587 ?auto_168588 )
      ( MAKE-11PILE ?auto_168582 ?auto_168583 ?auto_168584 ?auto_168585 ?auto_168586 ?auto_168587 ?auto_168588 ?auto_168589 ?auto_168590 ?auto_168591 ?auto_168592 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168605 - BLOCK
      ?auto_168606 - BLOCK
      ?auto_168607 - BLOCK
      ?auto_168608 - BLOCK
      ?auto_168609 - BLOCK
      ?auto_168610 - BLOCK
      ?auto_168611 - BLOCK
      ?auto_168612 - BLOCK
      ?auto_168613 - BLOCK
      ?auto_168614 - BLOCK
      ?auto_168615 - BLOCK
    )
    :vars
    (
      ?auto_168616 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168615 ?auto_168616 ) ( ON-TABLE ?auto_168605 ) ( ON ?auto_168606 ?auto_168605 ) ( ON ?auto_168607 ?auto_168606 ) ( ON ?auto_168608 ?auto_168607 ) ( ON ?auto_168609 ?auto_168608 ) ( not ( = ?auto_168605 ?auto_168606 ) ) ( not ( = ?auto_168605 ?auto_168607 ) ) ( not ( = ?auto_168605 ?auto_168608 ) ) ( not ( = ?auto_168605 ?auto_168609 ) ) ( not ( = ?auto_168605 ?auto_168610 ) ) ( not ( = ?auto_168605 ?auto_168611 ) ) ( not ( = ?auto_168605 ?auto_168612 ) ) ( not ( = ?auto_168605 ?auto_168613 ) ) ( not ( = ?auto_168605 ?auto_168614 ) ) ( not ( = ?auto_168605 ?auto_168615 ) ) ( not ( = ?auto_168605 ?auto_168616 ) ) ( not ( = ?auto_168606 ?auto_168607 ) ) ( not ( = ?auto_168606 ?auto_168608 ) ) ( not ( = ?auto_168606 ?auto_168609 ) ) ( not ( = ?auto_168606 ?auto_168610 ) ) ( not ( = ?auto_168606 ?auto_168611 ) ) ( not ( = ?auto_168606 ?auto_168612 ) ) ( not ( = ?auto_168606 ?auto_168613 ) ) ( not ( = ?auto_168606 ?auto_168614 ) ) ( not ( = ?auto_168606 ?auto_168615 ) ) ( not ( = ?auto_168606 ?auto_168616 ) ) ( not ( = ?auto_168607 ?auto_168608 ) ) ( not ( = ?auto_168607 ?auto_168609 ) ) ( not ( = ?auto_168607 ?auto_168610 ) ) ( not ( = ?auto_168607 ?auto_168611 ) ) ( not ( = ?auto_168607 ?auto_168612 ) ) ( not ( = ?auto_168607 ?auto_168613 ) ) ( not ( = ?auto_168607 ?auto_168614 ) ) ( not ( = ?auto_168607 ?auto_168615 ) ) ( not ( = ?auto_168607 ?auto_168616 ) ) ( not ( = ?auto_168608 ?auto_168609 ) ) ( not ( = ?auto_168608 ?auto_168610 ) ) ( not ( = ?auto_168608 ?auto_168611 ) ) ( not ( = ?auto_168608 ?auto_168612 ) ) ( not ( = ?auto_168608 ?auto_168613 ) ) ( not ( = ?auto_168608 ?auto_168614 ) ) ( not ( = ?auto_168608 ?auto_168615 ) ) ( not ( = ?auto_168608 ?auto_168616 ) ) ( not ( = ?auto_168609 ?auto_168610 ) ) ( not ( = ?auto_168609 ?auto_168611 ) ) ( not ( = ?auto_168609 ?auto_168612 ) ) ( not ( = ?auto_168609 ?auto_168613 ) ) ( not ( = ?auto_168609 ?auto_168614 ) ) ( not ( = ?auto_168609 ?auto_168615 ) ) ( not ( = ?auto_168609 ?auto_168616 ) ) ( not ( = ?auto_168610 ?auto_168611 ) ) ( not ( = ?auto_168610 ?auto_168612 ) ) ( not ( = ?auto_168610 ?auto_168613 ) ) ( not ( = ?auto_168610 ?auto_168614 ) ) ( not ( = ?auto_168610 ?auto_168615 ) ) ( not ( = ?auto_168610 ?auto_168616 ) ) ( not ( = ?auto_168611 ?auto_168612 ) ) ( not ( = ?auto_168611 ?auto_168613 ) ) ( not ( = ?auto_168611 ?auto_168614 ) ) ( not ( = ?auto_168611 ?auto_168615 ) ) ( not ( = ?auto_168611 ?auto_168616 ) ) ( not ( = ?auto_168612 ?auto_168613 ) ) ( not ( = ?auto_168612 ?auto_168614 ) ) ( not ( = ?auto_168612 ?auto_168615 ) ) ( not ( = ?auto_168612 ?auto_168616 ) ) ( not ( = ?auto_168613 ?auto_168614 ) ) ( not ( = ?auto_168613 ?auto_168615 ) ) ( not ( = ?auto_168613 ?auto_168616 ) ) ( not ( = ?auto_168614 ?auto_168615 ) ) ( not ( = ?auto_168614 ?auto_168616 ) ) ( not ( = ?auto_168615 ?auto_168616 ) ) ( ON ?auto_168614 ?auto_168615 ) ( ON ?auto_168613 ?auto_168614 ) ( ON ?auto_168612 ?auto_168613 ) ( ON ?auto_168611 ?auto_168612 ) ( CLEAR ?auto_168609 ) ( ON ?auto_168610 ?auto_168611 ) ( CLEAR ?auto_168610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168605 ?auto_168606 ?auto_168607 ?auto_168608 ?auto_168609 ?auto_168610 )
      ( MAKE-11PILE ?auto_168605 ?auto_168606 ?auto_168607 ?auto_168608 ?auto_168609 ?auto_168610 ?auto_168611 ?auto_168612 ?auto_168613 ?auto_168614 ?auto_168615 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168628 - BLOCK
      ?auto_168629 - BLOCK
      ?auto_168630 - BLOCK
      ?auto_168631 - BLOCK
      ?auto_168632 - BLOCK
      ?auto_168633 - BLOCK
      ?auto_168634 - BLOCK
      ?auto_168635 - BLOCK
      ?auto_168636 - BLOCK
      ?auto_168637 - BLOCK
      ?auto_168638 - BLOCK
    )
    :vars
    (
      ?auto_168639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168638 ?auto_168639 ) ( ON-TABLE ?auto_168628 ) ( ON ?auto_168629 ?auto_168628 ) ( ON ?auto_168630 ?auto_168629 ) ( ON ?auto_168631 ?auto_168630 ) ( ON ?auto_168632 ?auto_168631 ) ( not ( = ?auto_168628 ?auto_168629 ) ) ( not ( = ?auto_168628 ?auto_168630 ) ) ( not ( = ?auto_168628 ?auto_168631 ) ) ( not ( = ?auto_168628 ?auto_168632 ) ) ( not ( = ?auto_168628 ?auto_168633 ) ) ( not ( = ?auto_168628 ?auto_168634 ) ) ( not ( = ?auto_168628 ?auto_168635 ) ) ( not ( = ?auto_168628 ?auto_168636 ) ) ( not ( = ?auto_168628 ?auto_168637 ) ) ( not ( = ?auto_168628 ?auto_168638 ) ) ( not ( = ?auto_168628 ?auto_168639 ) ) ( not ( = ?auto_168629 ?auto_168630 ) ) ( not ( = ?auto_168629 ?auto_168631 ) ) ( not ( = ?auto_168629 ?auto_168632 ) ) ( not ( = ?auto_168629 ?auto_168633 ) ) ( not ( = ?auto_168629 ?auto_168634 ) ) ( not ( = ?auto_168629 ?auto_168635 ) ) ( not ( = ?auto_168629 ?auto_168636 ) ) ( not ( = ?auto_168629 ?auto_168637 ) ) ( not ( = ?auto_168629 ?auto_168638 ) ) ( not ( = ?auto_168629 ?auto_168639 ) ) ( not ( = ?auto_168630 ?auto_168631 ) ) ( not ( = ?auto_168630 ?auto_168632 ) ) ( not ( = ?auto_168630 ?auto_168633 ) ) ( not ( = ?auto_168630 ?auto_168634 ) ) ( not ( = ?auto_168630 ?auto_168635 ) ) ( not ( = ?auto_168630 ?auto_168636 ) ) ( not ( = ?auto_168630 ?auto_168637 ) ) ( not ( = ?auto_168630 ?auto_168638 ) ) ( not ( = ?auto_168630 ?auto_168639 ) ) ( not ( = ?auto_168631 ?auto_168632 ) ) ( not ( = ?auto_168631 ?auto_168633 ) ) ( not ( = ?auto_168631 ?auto_168634 ) ) ( not ( = ?auto_168631 ?auto_168635 ) ) ( not ( = ?auto_168631 ?auto_168636 ) ) ( not ( = ?auto_168631 ?auto_168637 ) ) ( not ( = ?auto_168631 ?auto_168638 ) ) ( not ( = ?auto_168631 ?auto_168639 ) ) ( not ( = ?auto_168632 ?auto_168633 ) ) ( not ( = ?auto_168632 ?auto_168634 ) ) ( not ( = ?auto_168632 ?auto_168635 ) ) ( not ( = ?auto_168632 ?auto_168636 ) ) ( not ( = ?auto_168632 ?auto_168637 ) ) ( not ( = ?auto_168632 ?auto_168638 ) ) ( not ( = ?auto_168632 ?auto_168639 ) ) ( not ( = ?auto_168633 ?auto_168634 ) ) ( not ( = ?auto_168633 ?auto_168635 ) ) ( not ( = ?auto_168633 ?auto_168636 ) ) ( not ( = ?auto_168633 ?auto_168637 ) ) ( not ( = ?auto_168633 ?auto_168638 ) ) ( not ( = ?auto_168633 ?auto_168639 ) ) ( not ( = ?auto_168634 ?auto_168635 ) ) ( not ( = ?auto_168634 ?auto_168636 ) ) ( not ( = ?auto_168634 ?auto_168637 ) ) ( not ( = ?auto_168634 ?auto_168638 ) ) ( not ( = ?auto_168634 ?auto_168639 ) ) ( not ( = ?auto_168635 ?auto_168636 ) ) ( not ( = ?auto_168635 ?auto_168637 ) ) ( not ( = ?auto_168635 ?auto_168638 ) ) ( not ( = ?auto_168635 ?auto_168639 ) ) ( not ( = ?auto_168636 ?auto_168637 ) ) ( not ( = ?auto_168636 ?auto_168638 ) ) ( not ( = ?auto_168636 ?auto_168639 ) ) ( not ( = ?auto_168637 ?auto_168638 ) ) ( not ( = ?auto_168637 ?auto_168639 ) ) ( not ( = ?auto_168638 ?auto_168639 ) ) ( ON ?auto_168637 ?auto_168638 ) ( ON ?auto_168636 ?auto_168637 ) ( ON ?auto_168635 ?auto_168636 ) ( ON ?auto_168634 ?auto_168635 ) ( CLEAR ?auto_168632 ) ( ON ?auto_168633 ?auto_168634 ) ( CLEAR ?auto_168633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_168628 ?auto_168629 ?auto_168630 ?auto_168631 ?auto_168632 ?auto_168633 )
      ( MAKE-11PILE ?auto_168628 ?auto_168629 ?auto_168630 ?auto_168631 ?auto_168632 ?auto_168633 ?auto_168634 ?auto_168635 ?auto_168636 ?auto_168637 ?auto_168638 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168651 - BLOCK
      ?auto_168652 - BLOCK
      ?auto_168653 - BLOCK
      ?auto_168654 - BLOCK
      ?auto_168655 - BLOCK
      ?auto_168656 - BLOCK
      ?auto_168657 - BLOCK
      ?auto_168658 - BLOCK
      ?auto_168659 - BLOCK
      ?auto_168660 - BLOCK
      ?auto_168661 - BLOCK
    )
    :vars
    (
      ?auto_168662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168661 ?auto_168662 ) ( ON-TABLE ?auto_168651 ) ( ON ?auto_168652 ?auto_168651 ) ( ON ?auto_168653 ?auto_168652 ) ( ON ?auto_168654 ?auto_168653 ) ( not ( = ?auto_168651 ?auto_168652 ) ) ( not ( = ?auto_168651 ?auto_168653 ) ) ( not ( = ?auto_168651 ?auto_168654 ) ) ( not ( = ?auto_168651 ?auto_168655 ) ) ( not ( = ?auto_168651 ?auto_168656 ) ) ( not ( = ?auto_168651 ?auto_168657 ) ) ( not ( = ?auto_168651 ?auto_168658 ) ) ( not ( = ?auto_168651 ?auto_168659 ) ) ( not ( = ?auto_168651 ?auto_168660 ) ) ( not ( = ?auto_168651 ?auto_168661 ) ) ( not ( = ?auto_168651 ?auto_168662 ) ) ( not ( = ?auto_168652 ?auto_168653 ) ) ( not ( = ?auto_168652 ?auto_168654 ) ) ( not ( = ?auto_168652 ?auto_168655 ) ) ( not ( = ?auto_168652 ?auto_168656 ) ) ( not ( = ?auto_168652 ?auto_168657 ) ) ( not ( = ?auto_168652 ?auto_168658 ) ) ( not ( = ?auto_168652 ?auto_168659 ) ) ( not ( = ?auto_168652 ?auto_168660 ) ) ( not ( = ?auto_168652 ?auto_168661 ) ) ( not ( = ?auto_168652 ?auto_168662 ) ) ( not ( = ?auto_168653 ?auto_168654 ) ) ( not ( = ?auto_168653 ?auto_168655 ) ) ( not ( = ?auto_168653 ?auto_168656 ) ) ( not ( = ?auto_168653 ?auto_168657 ) ) ( not ( = ?auto_168653 ?auto_168658 ) ) ( not ( = ?auto_168653 ?auto_168659 ) ) ( not ( = ?auto_168653 ?auto_168660 ) ) ( not ( = ?auto_168653 ?auto_168661 ) ) ( not ( = ?auto_168653 ?auto_168662 ) ) ( not ( = ?auto_168654 ?auto_168655 ) ) ( not ( = ?auto_168654 ?auto_168656 ) ) ( not ( = ?auto_168654 ?auto_168657 ) ) ( not ( = ?auto_168654 ?auto_168658 ) ) ( not ( = ?auto_168654 ?auto_168659 ) ) ( not ( = ?auto_168654 ?auto_168660 ) ) ( not ( = ?auto_168654 ?auto_168661 ) ) ( not ( = ?auto_168654 ?auto_168662 ) ) ( not ( = ?auto_168655 ?auto_168656 ) ) ( not ( = ?auto_168655 ?auto_168657 ) ) ( not ( = ?auto_168655 ?auto_168658 ) ) ( not ( = ?auto_168655 ?auto_168659 ) ) ( not ( = ?auto_168655 ?auto_168660 ) ) ( not ( = ?auto_168655 ?auto_168661 ) ) ( not ( = ?auto_168655 ?auto_168662 ) ) ( not ( = ?auto_168656 ?auto_168657 ) ) ( not ( = ?auto_168656 ?auto_168658 ) ) ( not ( = ?auto_168656 ?auto_168659 ) ) ( not ( = ?auto_168656 ?auto_168660 ) ) ( not ( = ?auto_168656 ?auto_168661 ) ) ( not ( = ?auto_168656 ?auto_168662 ) ) ( not ( = ?auto_168657 ?auto_168658 ) ) ( not ( = ?auto_168657 ?auto_168659 ) ) ( not ( = ?auto_168657 ?auto_168660 ) ) ( not ( = ?auto_168657 ?auto_168661 ) ) ( not ( = ?auto_168657 ?auto_168662 ) ) ( not ( = ?auto_168658 ?auto_168659 ) ) ( not ( = ?auto_168658 ?auto_168660 ) ) ( not ( = ?auto_168658 ?auto_168661 ) ) ( not ( = ?auto_168658 ?auto_168662 ) ) ( not ( = ?auto_168659 ?auto_168660 ) ) ( not ( = ?auto_168659 ?auto_168661 ) ) ( not ( = ?auto_168659 ?auto_168662 ) ) ( not ( = ?auto_168660 ?auto_168661 ) ) ( not ( = ?auto_168660 ?auto_168662 ) ) ( not ( = ?auto_168661 ?auto_168662 ) ) ( ON ?auto_168660 ?auto_168661 ) ( ON ?auto_168659 ?auto_168660 ) ( ON ?auto_168658 ?auto_168659 ) ( ON ?auto_168657 ?auto_168658 ) ( ON ?auto_168656 ?auto_168657 ) ( CLEAR ?auto_168654 ) ( ON ?auto_168655 ?auto_168656 ) ( CLEAR ?auto_168655 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168651 ?auto_168652 ?auto_168653 ?auto_168654 ?auto_168655 )
      ( MAKE-11PILE ?auto_168651 ?auto_168652 ?auto_168653 ?auto_168654 ?auto_168655 ?auto_168656 ?auto_168657 ?auto_168658 ?auto_168659 ?auto_168660 ?auto_168661 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168674 - BLOCK
      ?auto_168675 - BLOCK
      ?auto_168676 - BLOCK
      ?auto_168677 - BLOCK
      ?auto_168678 - BLOCK
      ?auto_168679 - BLOCK
      ?auto_168680 - BLOCK
      ?auto_168681 - BLOCK
      ?auto_168682 - BLOCK
      ?auto_168683 - BLOCK
      ?auto_168684 - BLOCK
    )
    :vars
    (
      ?auto_168685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168684 ?auto_168685 ) ( ON-TABLE ?auto_168674 ) ( ON ?auto_168675 ?auto_168674 ) ( ON ?auto_168676 ?auto_168675 ) ( ON ?auto_168677 ?auto_168676 ) ( not ( = ?auto_168674 ?auto_168675 ) ) ( not ( = ?auto_168674 ?auto_168676 ) ) ( not ( = ?auto_168674 ?auto_168677 ) ) ( not ( = ?auto_168674 ?auto_168678 ) ) ( not ( = ?auto_168674 ?auto_168679 ) ) ( not ( = ?auto_168674 ?auto_168680 ) ) ( not ( = ?auto_168674 ?auto_168681 ) ) ( not ( = ?auto_168674 ?auto_168682 ) ) ( not ( = ?auto_168674 ?auto_168683 ) ) ( not ( = ?auto_168674 ?auto_168684 ) ) ( not ( = ?auto_168674 ?auto_168685 ) ) ( not ( = ?auto_168675 ?auto_168676 ) ) ( not ( = ?auto_168675 ?auto_168677 ) ) ( not ( = ?auto_168675 ?auto_168678 ) ) ( not ( = ?auto_168675 ?auto_168679 ) ) ( not ( = ?auto_168675 ?auto_168680 ) ) ( not ( = ?auto_168675 ?auto_168681 ) ) ( not ( = ?auto_168675 ?auto_168682 ) ) ( not ( = ?auto_168675 ?auto_168683 ) ) ( not ( = ?auto_168675 ?auto_168684 ) ) ( not ( = ?auto_168675 ?auto_168685 ) ) ( not ( = ?auto_168676 ?auto_168677 ) ) ( not ( = ?auto_168676 ?auto_168678 ) ) ( not ( = ?auto_168676 ?auto_168679 ) ) ( not ( = ?auto_168676 ?auto_168680 ) ) ( not ( = ?auto_168676 ?auto_168681 ) ) ( not ( = ?auto_168676 ?auto_168682 ) ) ( not ( = ?auto_168676 ?auto_168683 ) ) ( not ( = ?auto_168676 ?auto_168684 ) ) ( not ( = ?auto_168676 ?auto_168685 ) ) ( not ( = ?auto_168677 ?auto_168678 ) ) ( not ( = ?auto_168677 ?auto_168679 ) ) ( not ( = ?auto_168677 ?auto_168680 ) ) ( not ( = ?auto_168677 ?auto_168681 ) ) ( not ( = ?auto_168677 ?auto_168682 ) ) ( not ( = ?auto_168677 ?auto_168683 ) ) ( not ( = ?auto_168677 ?auto_168684 ) ) ( not ( = ?auto_168677 ?auto_168685 ) ) ( not ( = ?auto_168678 ?auto_168679 ) ) ( not ( = ?auto_168678 ?auto_168680 ) ) ( not ( = ?auto_168678 ?auto_168681 ) ) ( not ( = ?auto_168678 ?auto_168682 ) ) ( not ( = ?auto_168678 ?auto_168683 ) ) ( not ( = ?auto_168678 ?auto_168684 ) ) ( not ( = ?auto_168678 ?auto_168685 ) ) ( not ( = ?auto_168679 ?auto_168680 ) ) ( not ( = ?auto_168679 ?auto_168681 ) ) ( not ( = ?auto_168679 ?auto_168682 ) ) ( not ( = ?auto_168679 ?auto_168683 ) ) ( not ( = ?auto_168679 ?auto_168684 ) ) ( not ( = ?auto_168679 ?auto_168685 ) ) ( not ( = ?auto_168680 ?auto_168681 ) ) ( not ( = ?auto_168680 ?auto_168682 ) ) ( not ( = ?auto_168680 ?auto_168683 ) ) ( not ( = ?auto_168680 ?auto_168684 ) ) ( not ( = ?auto_168680 ?auto_168685 ) ) ( not ( = ?auto_168681 ?auto_168682 ) ) ( not ( = ?auto_168681 ?auto_168683 ) ) ( not ( = ?auto_168681 ?auto_168684 ) ) ( not ( = ?auto_168681 ?auto_168685 ) ) ( not ( = ?auto_168682 ?auto_168683 ) ) ( not ( = ?auto_168682 ?auto_168684 ) ) ( not ( = ?auto_168682 ?auto_168685 ) ) ( not ( = ?auto_168683 ?auto_168684 ) ) ( not ( = ?auto_168683 ?auto_168685 ) ) ( not ( = ?auto_168684 ?auto_168685 ) ) ( ON ?auto_168683 ?auto_168684 ) ( ON ?auto_168682 ?auto_168683 ) ( ON ?auto_168681 ?auto_168682 ) ( ON ?auto_168680 ?auto_168681 ) ( ON ?auto_168679 ?auto_168680 ) ( CLEAR ?auto_168677 ) ( ON ?auto_168678 ?auto_168679 ) ( CLEAR ?auto_168678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_168674 ?auto_168675 ?auto_168676 ?auto_168677 ?auto_168678 )
      ( MAKE-11PILE ?auto_168674 ?auto_168675 ?auto_168676 ?auto_168677 ?auto_168678 ?auto_168679 ?auto_168680 ?auto_168681 ?auto_168682 ?auto_168683 ?auto_168684 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168697 - BLOCK
      ?auto_168698 - BLOCK
      ?auto_168699 - BLOCK
      ?auto_168700 - BLOCK
      ?auto_168701 - BLOCK
      ?auto_168702 - BLOCK
      ?auto_168703 - BLOCK
      ?auto_168704 - BLOCK
      ?auto_168705 - BLOCK
      ?auto_168706 - BLOCK
      ?auto_168707 - BLOCK
    )
    :vars
    (
      ?auto_168708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168707 ?auto_168708 ) ( ON-TABLE ?auto_168697 ) ( ON ?auto_168698 ?auto_168697 ) ( ON ?auto_168699 ?auto_168698 ) ( not ( = ?auto_168697 ?auto_168698 ) ) ( not ( = ?auto_168697 ?auto_168699 ) ) ( not ( = ?auto_168697 ?auto_168700 ) ) ( not ( = ?auto_168697 ?auto_168701 ) ) ( not ( = ?auto_168697 ?auto_168702 ) ) ( not ( = ?auto_168697 ?auto_168703 ) ) ( not ( = ?auto_168697 ?auto_168704 ) ) ( not ( = ?auto_168697 ?auto_168705 ) ) ( not ( = ?auto_168697 ?auto_168706 ) ) ( not ( = ?auto_168697 ?auto_168707 ) ) ( not ( = ?auto_168697 ?auto_168708 ) ) ( not ( = ?auto_168698 ?auto_168699 ) ) ( not ( = ?auto_168698 ?auto_168700 ) ) ( not ( = ?auto_168698 ?auto_168701 ) ) ( not ( = ?auto_168698 ?auto_168702 ) ) ( not ( = ?auto_168698 ?auto_168703 ) ) ( not ( = ?auto_168698 ?auto_168704 ) ) ( not ( = ?auto_168698 ?auto_168705 ) ) ( not ( = ?auto_168698 ?auto_168706 ) ) ( not ( = ?auto_168698 ?auto_168707 ) ) ( not ( = ?auto_168698 ?auto_168708 ) ) ( not ( = ?auto_168699 ?auto_168700 ) ) ( not ( = ?auto_168699 ?auto_168701 ) ) ( not ( = ?auto_168699 ?auto_168702 ) ) ( not ( = ?auto_168699 ?auto_168703 ) ) ( not ( = ?auto_168699 ?auto_168704 ) ) ( not ( = ?auto_168699 ?auto_168705 ) ) ( not ( = ?auto_168699 ?auto_168706 ) ) ( not ( = ?auto_168699 ?auto_168707 ) ) ( not ( = ?auto_168699 ?auto_168708 ) ) ( not ( = ?auto_168700 ?auto_168701 ) ) ( not ( = ?auto_168700 ?auto_168702 ) ) ( not ( = ?auto_168700 ?auto_168703 ) ) ( not ( = ?auto_168700 ?auto_168704 ) ) ( not ( = ?auto_168700 ?auto_168705 ) ) ( not ( = ?auto_168700 ?auto_168706 ) ) ( not ( = ?auto_168700 ?auto_168707 ) ) ( not ( = ?auto_168700 ?auto_168708 ) ) ( not ( = ?auto_168701 ?auto_168702 ) ) ( not ( = ?auto_168701 ?auto_168703 ) ) ( not ( = ?auto_168701 ?auto_168704 ) ) ( not ( = ?auto_168701 ?auto_168705 ) ) ( not ( = ?auto_168701 ?auto_168706 ) ) ( not ( = ?auto_168701 ?auto_168707 ) ) ( not ( = ?auto_168701 ?auto_168708 ) ) ( not ( = ?auto_168702 ?auto_168703 ) ) ( not ( = ?auto_168702 ?auto_168704 ) ) ( not ( = ?auto_168702 ?auto_168705 ) ) ( not ( = ?auto_168702 ?auto_168706 ) ) ( not ( = ?auto_168702 ?auto_168707 ) ) ( not ( = ?auto_168702 ?auto_168708 ) ) ( not ( = ?auto_168703 ?auto_168704 ) ) ( not ( = ?auto_168703 ?auto_168705 ) ) ( not ( = ?auto_168703 ?auto_168706 ) ) ( not ( = ?auto_168703 ?auto_168707 ) ) ( not ( = ?auto_168703 ?auto_168708 ) ) ( not ( = ?auto_168704 ?auto_168705 ) ) ( not ( = ?auto_168704 ?auto_168706 ) ) ( not ( = ?auto_168704 ?auto_168707 ) ) ( not ( = ?auto_168704 ?auto_168708 ) ) ( not ( = ?auto_168705 ?auto_168706 ) ) ( not ( = ?auto_168705 ?auto_168707 ) ) ( not ( = ?auto_168705 ?auto_168708 ) ) ( not ( = ?auto_168706 ?auto_168707 ) ) ( not ( = ?auto_168706 ?auto_168708 ) ) ( not ( = ?auto_168707 ?auto_168708 ) ) ( ON ?auto_168706 ?auto_168707 ) ( ON ?auto_168705 ?auto_168706 ) ( ON ?auto_168704 ?auto_168705 ) ( ON ?auto_168703 ?auto_168704 ) ( ON ?auto_168702 ?auto_168703 ) ( ON ?auto_168701 ?auto_168702 ) ( CLEAR ?auto_168699 ) ( ON ?auto_168700 ?auto_168701 ) ( CLEAR ?auto_168700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 )
      ( MAKE-11PILE ?auto_168697 ?auto_168698 ?auto_168699 ?auto_168700 ?auto_168701 ?auto_168702 ?auto_168703 ?auto_168704 ?auto_168705 ?auto_168706 ?auto_168707 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168720 - BLOCK
      ?auto_168721 - BLOCK
      ?auto_168722 - BLOCK
      ?auto_168723 - BLOCK
      ?auto_168724 - BLOCK
      ?auto_168725 - BLOCK
      ?auto_168726 - BLOCK
      ?auto_168727 - BLOCK
      ?auto_168728 - BLOCK
      ?auto_168729 - BLOCK
      ?auto_168730 - BLOCK
    )
    :vars
    (
      ?auto_168731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168730 ?auto_168731 ) ( ON-TABLE ?auto_168720 ) ( ON ?auto_168721 ?auto_168720 ) ( ON ?auto_168722 ?auto_168721 ) ( not ( = ?auto_168720 ?auto_168721 ) ) ( not ( = ?auto_168720 ?auto_168722 ) ) ( not ( = ?auto_168720 ?auto_168723 ) ) ( not ( = ?auto_168720 ?auto_168724 ) ) ( not ( = ?auto_168720 ?auto_168725 ) ) ( not ( = ?auto_168720 ?auto_168726 ) ) ( not ( = ?auto_168720 ?auto_168727 ) ) ( not ( = ?auto_168720 ?auto_168728 ) ) ( not ( = ?auto_168720 ?auto_168729 ) ) ( not ( = ?auto_168720 ?auto_168730 ) ) ( not ( = ?auto_168720 ?auto_168731 ) ) ( not ( = ?auto_168721 ?auto_168722 ) ) ( not ( = ?auto_168721 ?auto_168723 ) ) ( not ( = ?auto_168721 ?auto_168724 ) ) ( not ( = ?auto_168721 ?auto_168725 ) ) ( not ( = ?auto_168721 ?auto_168726 ) ) ( not ( = ?auto_168721 ?auto_168727 ) ) ( not ( = ?auto_168721 ?auto_168728 ) ) ( not ( = ?auto_168721 ?auto_168729 ) ) ( not ( = ?auto_168721 ?auto_168730 ) ) ( not ( = ?auto_168721 ?auto_168731 ) ) ( not ( = ?auto_168722 ?auto_168723 ) ) ( not ( = ?auto_168722 ?auto_168724 ) ) ( not ( = ?auto_168722 ?auto_168725 ) ) ( not ( = ?auto_168722 ?auto_168726 ) ) ( not ( = ?auto_168722 ?auto_168727 ) ) ( not ( = ?auto_168722 ?auto_168728 ) ) ( not ( = ?auto_168722 ?auto_168729 ) ) ( not ( = ?auto_168722 ?auto_168730 ) ) ( not ( = ?auto_168722 ?auto_168731 ) ) ( not ( = ?auto_168723 ?auto_168724 ) ) ( not ( = ?auto_168723 ?auto_168725 ) ) ( not ( = ?auto_168723 ?auto_168726 ) ) ( not ( = ?auto_168723 ?auto_168727 ) ) ( not ( = ?auto_168723 ?auto_168728 ) ) ( not ( = ?auto_168723 ?auto_168729 ) ) ( not ( = ?auto_168723 ?auto_168730 ) ) ( not ( = ?auto_168723 ?auto_168731 ) ) ( not ( = ?auto_168724 ?auto_168725 ) ) ( not ( = ?auto_168724 ?auto_168726 ) ) ( not ( = ?auto_168724 ?auto_168727 ) ) ( not ( = ?auto_168724 ?auto_168728 ) ) ( not ( = ?auto_168724 ?auto_168729 ) ) ( not ( = ?auto_168724 ?auto_168730 ) ) ( not ( = ?auto_168724 ?auto_168731 ) ) ( not ( = ?auto_168725 ?auto_168726 ) ) ( not ( = ?auto_168725 ?auto_168727 ) ) ( not ( = ?auto_168725 ?auto_168728 ) ) ( not ( = ?auto_168725 ?auto_168729 ) ) ( not ( = ?auto_168725 ?auto_168730 ) ) ( not ( = ?auto_168725 ?auto_168731 ) ) ( not ( = ?auto_168726 ?auto_168727 ) ) ( not ( = ?auto_168726 ?auto_168728 ) ) ( not ( = ?auto_168726 ?auto_168729 ) ) ( not ( = ?auto_168726 ?auto_168730 ) ) ( not ( = ?auto_168726 ?auto_168731 ) ) ( not ( = ?auto_168727 ?auto_168728 ) ) ( not ( = ?auto_168727 ?auto_168729 ) ) ( not ( = ?auto_168727 ?auto_168730 ) ) ( not ( = ?auto_168727 ?auto_168731 ) ) ( not ( = ?auto_168728 ?auto_168729 ) ) ( not ( = ?auto_168728 ?auto_168730 ) ) ( not ( = ?auto_168728 ?auto_168731 ) ) ( not ( = ?auto_168729 ?auto_168730 ) ) ( not ( = ?auto_168729 ?auto_168731 ) ) ( not ( = ?auto_168730 ?auto_168731 ) ) ( ON ?auto_168729 ?auto_168730 ) ( ON ?auto_168728 ?auto_168729 ) ( ON ?auto_168727 ?auto_168728 ) ( ON ?auto_168726 ?auto_168727 ) ( ON ?auto_168725 ?auto_168726 ) ( ON ?auto_168724 ?auto_168725 ) ( CLEAR ?auto_168722 ) ( ON ?auto_168723 ?auto_168724 ) ( CLEAR ?auto_168723 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_168720 ?auto_168721 ?auto_168722 ?auto_168723 )
      ( MAKE-11PILE ?auto_168720 ?auto_168721 ?auto_168722 ?auto_168723 ?auto_168724 ?auto_168725 ?auto_168726 ?auto_168727 ?auto_168728 ?auto_168729 ?auto_168730 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168743 - BLOCK
      ?auto_168744 - BLOCK
      ?auto_168745 - BLOCK
      ?auto_168746 - BLOCK
      ?auto_168747 - BLOCK
      ?auto_168748 - BLOCK
      ?auto_168749 - BLOCK
      ?auto_168750 - BLOCK
      ?auto_168751 - BLOCK
      ?auto_168752 - BLOCK
      ?auto_168753 - BLOCK
    )
    :vars
    (
      ?auto_168754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168753 ?auto_168754 ) ( ON-TABLE ?auto_168743 ) ( ON ?auto_168744 ?auto_168743 ) ( not ( = ?auto_168743 ?auto_168744 ) ) ( not ( = ?auto_168743 ?auto_168745 ) ) ( not ( = ?auto_168743 ?auto_168746 ) ) ( not ( = ?auto_168743 ?auto_168747 ) ) ( not ( = ?auto_168743 ?auto_168748 ) ) ( not ( = ?auto_168743 ?auto_168749 ) ) ( not ( = ?auto_168743 ?auto_168750 ) ) ( not ( = ?auto_168743 ?auto_168751 ) ) ( not ( = ?auto_168743 ?auto_168752 ) ) ( not ( = ?auto_168743 ?auto_168753 ) ) ( not ( = ?auto_168743 ?auto_168754 ) ) ( not ( = ?auto_168744 ?auto_168745 ) ) ( not ( = ?auto_168744 ?auto_168746 ) ) ( not ( = ?auto_168744 ?auto_168747 ) ) ( not ( = ?auto_168744 ?auto_168748 ) ) ( not ( = ?auto_168744 ?auto_168749 ) ) ( not ( = ?auto_168744 ?auto_168750 ) ) ( not ( = ?auto_168744 ?auto_168751 ) ) ( not ( = ?auto_168744 ?auto_168752 ) ) ( not ( = ?auto_168744 ?auto_168753 ) ) ( not ( = ?auto_168744 ?auto_168754 ) ) ( not ( = ?auto_168745 ?auto_168746 ) ) ( not ( = ?auto_168745 ?auto_168747 ) ) ( not ( = ?auto_168745 ?auto_168748 ) ) ( not ( = ?auto_168745 ?auto_168749 ) ) ( not ( = ?auto_168745 ?auto_168750 ) ) ( not ( = ?auto_168745 ?auto_168751 ) ) ( not ( = ?auto_168745 ?auto_168752 ) ) ( not ( = ?auto_168745 ?auto_168753 ) ) ( not ( = ?auto_168745 ?auto_168754 ) ) ( not ( = ?auto_168746 ?auto_168747 ) ) ( not ( = ?auto_168746 ?auto_168748 ) ) ( not ( = ?auto_168746 ?auto_168749 ) ) ( not ( = ?auto_168746 ?auto_168750 ) ) ( not ( = ?auto_168746 ?auto_168751 ) ) ( not ( = ?auto_168746 ?auto_168752 ) ) ( not ( = ?auto_168746 ?auto_168753 ) ) ( not ( = ?auto_168746 ?auto_168754 ) ) ( not ( = ?auto_168747 ?auto_168748 ) ) ( not ( = ?auto_168747 ?auto_168749 ) ) ( not ( = ?auto_168747 ?auto_168750 ) ) ( not ( = ?auto_168747 ?auto_168751 ) ) ( not ( = ?auto_168747 ?auto_168752 ) ) ( not ( = ?auto_168747 ?auto_168753 ) ) ( not ( = ?auto_168747 ?auto_168754 ) ) ( not ( = ?auto_168748 ?auto_168749 ) ) ( not ( = ?auto_168748 ?auto_168750 ) ) ( not ( = ?auto_168748 ?auto_168751 ) ) ( not ( = ?auto_168748 ?auto_168752 ) ) ( not ( = ?auto_168748 ?auto_168753 ) ) ( not ( = ?auto_168748 ?auto_168754 ) ) ( not ( = ?auto_168749 ?auto_168750 ) ) ( not ( = ?auto_168749 ?auto_168751 ) ) ( not ( = ?auto_168749 ?auto_168752 ) ) ( not ( = ?auto_168749 ?auto_168753 ) ) ( not ( = ?auto_168749 ?auto_168754 ) ) ( not ( = ?auto_168750 ?auto_168751 ) ) ( not ( = ?auto_168750 ?auto_168752 ) ) ( not ( = ?auto_168750 ?auto_168753 ) ) ( not ( = ?auto_168750 ?auto_168754 ) ) ( not ( = ?auto_168751 ?auto_168752 ) ) ( not ( = ?auto_168751 ?auto_168753 ) ) ( not ( = ?auto_168751 ?auto_168754 ) ) ( not ( = ?auto_168752 ?auto_168753 ) ) ( not ( = ?auto_168752 ?auto_168754 ) ) ( not ( = ?auto_168753 ?auto_168754 ) ) ( ON ?auto_168752 ?auto_168753 ) ( ON ?auto_168751 ?auto_168752 ) ( ON ?auto_168750 ?auto_168751 ) ( ON ?auto_168749 ?auto_168750 ) ( ON ?auto_168748 ?auto_168749 ) ( ON ?auto_168747 ?auto_168748 ) ( ON ?auto_168746 ?auto_168747 ) ( CLEAR ?auto_168744 ) ( ON ?auto_168745 ?auto_168746 ) ( CLEAR ?auto_168745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168743 ?auto_168744 ?auto_168745 )
      ( MAKE-11PILE ?auto_168743 ?auto_168744 ?auto_168745 ?auto_168746 ?auto_168747 ?auto_168748 ?auto_168749 ?auto_168750 ?auto_168751 ?auto_168752 ?auto_168753 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168766 - BLOCK
      ?auto_168767 - BLOCK
      ?auto_168768 - BLOCK
      ?auto_168769 - BLOCK
      ?auto_168770 - BLOCK
      ?auto_168771 - BLOCK
      ?auto_168772 - BLOCK
      ?auto_168773 - BLOCK
      ?auto_168774 - BLOCK
      ?auto_168775 - BLOCK
      ?auto_168776 - BLOCK
    )
    :vars
    (
      ?auto_168777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168776 ?auto_168777 ) ( ON-TABLE ?auto_168766 ) ( ON ?auto_168767 ?auto_168766 ) ( not ( = ?auto_168766 ?auto_168767 ) ) ( not ( = ?auto_168766 ?auto_168768 ) ) ( not ( = ?auto_168766 ?auto_168769 ) ) ( not ( = ?auto_168766 ?auto_168770 ) ) ( not ( = ?auto_168766 ?auto_168771 ) ) ( not ( = ?auto_168766 ?auto_168772 ) ) ( not ( = ?auto_168766 ?auto_168773 ) ) ( not ( = ?auto_168766 ?auto_168774 ) ) ( not ( = ?auto_168766 ?auto_168775 ) ) ( not ( = ?auto_168766 ?auto_168776 ) ) ( not ( = ?auto_168766 ?auto_168777 ) ) ( not ( = ?auto_168767 ?auto_168768 ) ) ( not ( = ?auto_168767 ?auto_168769 ) ) ( not ( = ?auto_168767 ?auto_168770 ) ) ( not ( = ?auto_168767 ?auto_168771 ) ) ( not ( = ?auto_168767 ?auto_168772 ) ) ( not ( = ?auto_168767 ?auto_168773 ) ) ( not ( = ?auto_168767 ?auto_168774 ) ) ( not ( = ?auto_168767 ?auto_168775 ) ) ( not ( = ?auto_168767 ?auto_168776 ) ) ( not ( = ?auto_168767 ?auto_168777 ) ) ( not ( = ?auto_168768 ?auto_168769 ) ) ( not ( = ?auto_168768 ?auto_168770 ) ) ( not ( = ?auto_168768 ?auto_168771 ) ) ( not ( = ?auto_168768 ?auto_168772 ) ) ( not ( = ?auto_168768 ?auto_168773 ) ) ( not ( = ?auto_168768 ?auto_168774 ) ) ( not ( = ?auto_168768 ?auto_168775 ) ) ( not ( = ?auto_168768 ?auto_168776 ) ) ( not ( = ?auto_168768 ?auto_168777 ) ) ( not ( = ?auto_168769 ?auto_168770 ) ) ( not ( = ?auto_168769 ?auto_168771 ) ) ( not ( = ?auto_168769 ?auto_168772 ) ) ( not ( = ?auto_168769 ?auto_168773 ) ) ( not ( = ?auto_168769 ?auto_168774 ) ) ( not ( = ?auto_168769 ?auto_168775 ) ) ( not ( = ?auto_168769 ?auto_168776 ) ) ( not ( = ?auto_168769 ?auto_168777 ) ) ( not ( = ?auto_168770 ?auto_168771 ) ) ( not ( = ?auto_168770 ?auto_168772 ) ) ( not ( = ?auto_168770 ?auto_168773 ) ) ( not ( = ?auto_168770 ?auto_168774 ) ) ( not ( = ?auto_168770 ?auto_168775 ) ) ( not ( = ?auto_168770 ?auto_168776 ) ) ( not ( = ?auto_168770 ?auto_168777 ) ) ( not ( = ?auto_168771 ?auto_168772 ) ) ( not ( = ?auto_168771 ?auto_168773 ) ) ( not ( = ?auto_168771 ?auto_168774 ) ) ( not ( = ?auto_168771 ?auto_168775 ) ) ( not ( = ?auto_168771 ?auto_168776 ) ) ( not ( = ?auto_168771 ?auto_168777 ) ) ( not ( = ?auto_168772 ?auto_168773 ) ) ( not ( = ?auto_168772 ?auto_168774 ) ) ( not ( = ?auto_168772 ?auto_168775 ) ) ( not ( = ?auto_168772 ?auto_168776 ) ) ( not ( = ?auto_168772 ?auto_168777 ) ) ( not ( = ?auto_168773 ?auto_168774 ) ) ( not ( = ?auto_168773 ?auto_168775 ) ) ( not ( = ?auto_168773 ?auto_168776 ) ) ( not ( = ?auto_168773 ?auto_168777 ) ) ( not ( = ?auto_168774 ?auto_168775 ) ) ( not ( = ?auto_168774 ?auto_168776 ) ) ( not ( = ?auto_168774 ?auto_168777 ) ) ( not ( = ?auto_168775 ?auto_168776 ) ) ( not ( = ?auto_168775 ?auto_168777 ) ) ( not ( = ?auto_168776 ?auto_168777 ) ) ( ON ?auto_168775 ?auto_168776 ) ( ON ?auto_168774 ?auto_168775 ) ( ON ?auto_168773 ?auto_168774 ) ( ON ?auto_168772 ?auto_168773 ) ( ON ?auto_168771 ?auto_168772 ) ( ON ?auto_168770 ?auto_168771 ) ( ON ?auto_168769 ?auto_168770 ) ( CLEAR ?auto_168767 ) ( ON ?auto_168768 ?auto_168769 ) ( CLEAR ?auto_168768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_168766 ?auto_168767 ?auto_168768 )
      ( MAKE-11PILE ?auto_168766 ?auto_168767 ?auto_168768 ?auto_168769 ?auto_168770 ?auto_168771 ?auto_168772 ?auto_168773 ?auto_168774 ?auto_168775 ?auto_168776 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168789 - BLOCK
      ?auto_168790 - BLOCK
      ?auto_168791 - BLOCK
      ?auto_168792 - BLOCK
      ?auto_168793 - BLOCK
      ?auto_168794 - BLOCK
      ?auto_168795 - BLOCK
      ?auto_168796 - BLOCK
      ?auto_168797 - BLOCK
      ?auto_168798 - BLOCK
      ?auto_168799 - BLOCK
    )
    :vars
    (
      ?auto_168800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168799 ?auto_168800 ) ( ON-TABLE ?auto_168789 ) ( not ( = ?auto_168789 ?auto_168790 ) ) ( not ( = ?auto_168789 ?auto_168791 ) ) ( not ( = ?auto_168789 ?auto_168792 ) ) ( not ( = ?auto_168789 ?auto_168793 ) ) ( not ( = ?auto_168789 ?auto_168794 ) ) ( not ( = ?auto_168789 ?auto_168795 ) ) ( not ( = ?auto_168789 ?auto_168796 ) ) ( not ( = ?auto_168789 ?auto_168797 ) ) ( not ( = ?auto_168789 ?auto_168798 ) ) ( not ( = ?auto_168789 ?auto_168799 ) ) ( not ( = ?auto_168789 ?auto_168800 ) ) ( not ( = ?auto_168790 ?auto_168791 ) ) ( not ( = ?auto_168790 ?auto_168792 ) ) ( not ( = ?auto_168790 ?auto_168793 ) ) ( not ( = ?auto_168790 ?auto_168794 ) ) ( not ( = ?auto_168790 ?auto_168795 ) ) ( not ( = ?auto_168790 ?auto_168796 ) ) ( not ( = ?auto_168790 ?auto_168797 ) ) ( not ( = ?auto_168790 ?auto_168798 ) ) ( not ( = ?auto_168790 ?auto_168799 ) ) ( not ( = ?auto_168790 ?auto_168800 ) ) ( not ( = ?auto_168791 ?auto_168792 ) ) ( not ( = ?auto_168791 ?auto_168793 ) ) ( not ( = ?auto_168791 ?auto_168794 ) ) ( not ( = ?auto_168791 ?auto_168795 ) ) ( not ( = ?auto_168791 ?auto_168796 ) ) ( not ( = ?auto_168791 ?auto_168797 ) ) ( not ( = ?auto_168791 ?auto_168798 ) ) ( not ( = ?auto_168791 ?auto_168799 ) ) ( not ( = ?auto_168791 ?auto_168800 ) ) ( not ( = ?auto_168792 ?auto_168793 ) ) ( not ( = ?auto_168792 ?auto_168794 ) ) ( not ( = ?auto_168792 ?auto_168795 ) ) ( not ( = ?auto_168792 ?auto_168796 ) ) ( not ( = ?auto_168792 ?auto_168797 ) ) ( not ( = ?auto_168792 ?auto_168798 ) ) ( not ( = ?auto_168792 ?auto_168799 ) ) ( not ( = ?auto_168792 ?auto_168800 ) ) ( not ( = ?auto_168793 ?auto_168794 ) ) ( not ( = ?auto_168793 ?auto_168795 ) ) ( not ( = ?auto_168793 ?auto_168796 ) ) ( not ( = ?auto_168793 ?auto_168797 ) ) ( not ( = ?auto_168793 ?auto_168798 ) ) ( not ( = ?auto_168793 ?auto_168799 ) ) ( not ( = ?auto_168793 ?auto_168800 ) ) ( not ( = ?auto_168794 ?auto_168795 ) ) ( not ( = ?auto_168794 ?auto_168796 ) ) ( not ( = ?auto_168794 ?auto_168797 ) ) ( not ( = ?auto_168794 ?auto_168798 ) ) ( not ( = ?auto_168794 ?auto_168799 ) ) ( not ( = ?auto_168794 ?auto_168800 ) ) ( not ( = ?auto_168795 ?auto_168796 ) ) ( not ( = ?auto_168795 ?auto_168797 ) ) ( not ( = ?auto_168795 ?auto_168798 ) ) ( not ( = ?auto_168795 ?auto_168799 ) ) ( not ( = ?auto_168795 ?auto_168800 ) ) ( not ( = ?auto_168796 ?auto_168797 ) ) ( not ( = ?auto_168796 ?auto_168798 ) ) ( not ( = ?auto_168796 ?auto_168799 ) ) ( not ( = ?auto_168796 ?auto_168800 ) ) ( not ( = ?auto_168797 ?auto_168798 ) ) ( not ( = ?auto_168797 ?auto_168799 ) ) ( not ( = ?auto_168797 ?auto_168800 ) ) ( not ( = ?auto_168798 ?auto_168799 ) ) ( not ( = ?auto_168798 ?auto_168800 ) ) ( not ( = ?auto_168799 ?auto_168800 ) ) ( ON ?auto_168798 ?auto_168799 ) ( ON ?auto_168797 ?auto_168798 ) ( ON ?auto_168796 ?auto_168797 ) ( ON ?auto_168795 ?auto_168796 ) ( ON ?auto_168794 ?auto_168795 ) ( ON ?auto_168793 ?auto_168794 ) ( ON ?auto_168792 ?auto_168793 ) ( ON ?auto_168791 ?auto_168792 ) ( CLEAR ?auto_168789 ) ( ON ?auto_168790 ?auto_168791 ) ( CLEAR ?auto_168790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168789 ?auto_168790 )
      ( MAKE-11PILE ?auto_168789 ?auto_168790 ?auto_168791 ?auto_168792 ?auto_168793 ?auto_168794 ?auto_168795 ?auto_168796 ?auto_168797 ?auto_168798 ?auto_168799 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168812 - BLOCK
      ?auto_168813 - BLOCK
      ?auto_168814 - BLOCK
      ?auto_168815 - BLOCK
      ?auto_168816 - BLOCK
      ?auto_168817 - BLOCK
      ?auto_168818 - BLOCK
      ?auto_168819 - BLOCK
      ?auto_168820 - BLOCK
      ?auto_168821 - BLOCK
      ?auto_168822 - BLOCK
    )
    :vars
    (
      ?auto_168823 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168822 ?auto_168823 ) ( ON-TABLE ?auto_168812 ) ( not ( = ?auto_168812 ?auto_168813 ) ) ( not ( = ?auto_168812 ?auto_168814 ) ) ( not ( = ?auto_168812 ?auto_168815 ) ) ( not ( = ?auto_168812 ?auto_168816 ) ) ( not ( = ?auto_168812 ?auto_168817 ) ) ( not ( = ?auto_168812 ?auto_168818 ) ) ( not ( = ?auto_168812 ?auto_168819 ) ) ( not ( = ?auto_168812 ?auto_168820 ) ) ( not ( = ?auto_168812 ?auto_168821 ) ) ( not ( = ?auto_168812 ?auto_168822 ) ) ( not ( = ?auto_168812 ?auto_168823 ) ) ( not ( = ?auto_168813 ?auto_168814 ) ) ( not ( = ?auto_168813 ?auto_168815 ) ) ( not ( = ?auto_168813 ?auto_168816 ) ) ( not ( = ?auto_168813 ?auto_168817 ) ) ( not ( = ?auto_168813 ?auto_168818 ) ) ( not ( = ?auto_168813 ?auto_168819 ) ) ( not ( = ?auto_168813 ?auto_168820 ) ) ( not ( = ?auto_168813 ?auto_168821 ) ) ( not ( = ?auto_168813 ?auto_168822 ) ) ( not ( = ?auto_168813 ?auto_168823 ) ) ( not ( = ?auto_168814 ?auto_168815 ) ) ( not ( = ?auto_168814 ?auto_168816 ) ) ( not ( = ?auto_168814 ?auto_168817 ) ) ( not ( = ?auto_168814 ?auto_168818 ) ) ( not ( = ?auto_168814 ?auto_168819 ) ) ( not ( = ?auto_168814 ?auto_168820 ) ) ( not ( = ?auto_168814 ?auto_168821 ) ) ( not ( = ?auto_168814 ?auto_168822 ) ) ( not ( = ?auto_168814 ?auto_168823 ) ) ( not ( = ?auto_168815 ?auto_168816 ) ) ( not ( = ?auto_168815 ?auto_168817 ) ) ( not ( = ?auto_168815 ?auto_168818 ) ) ( not ( = ?auto_168815 ?auto_168819 ) ) ( not ( = ?auto_168815 ?auto_168820 ) ) ( not ( = ?auto_168815 ?auto_168821 ) ) ( not ( = ?auto_168815 ?auto_168822 ) ) ( not ( = ?auto_168815 ?auto_168823 ) ) ( not ( = ?auto_168816 ?auto_168817 ) ) ( not ( = ?auto_168816 ?auto_168818 ) ) ( not ( = ?auto_168816 ?auto_168819 ) ) ( not ( = ?auto_168816 ?auto_168820 ) ) ( not ( = ?auto_168816 ?auto_168821 ) ) ( not ( = ?auto_168816 ?auto_168822 ) ) ( not ( = ?auto_168816 ?auto_168823 ) ) ( not ( = ?auto_168817 ?auto_168818 ) ) ( not ( = ?auto_168817 ?auto_168819 ) ) ( not ( = ?auto_168817 ?auto_168820 ) ) ( not ( = ?auto_168817 ?auto_168821 ) ) ( not ( = ?auto_168817 ?auto_168822 ) ) ( not ( = ?auto_168817 ?auto_168823 ) ) ( not ( = ?auto_168818 ?auto_168819 ) ) ( not ( = ?auto_168818 ?auto_168820 ) ) ( not ( = ?auto_168818 ?auto_168821 ) ) ( not ( = ?auto_168818 ?auto_168822 ) ) ( not ( = ?auto_168818 ?auto_168823 ) ) ( not ( = ?auto_168819 ?auto_168820 ) ) ( not ( = ?auto_168819 ?auto_168821 ) ) ( not ( = ?auto_168819 ?auto_168822 ) ) ( not ( = ?auto_168819 ?auto_168823 ) ) ( not ( = ?auto_168820 ?auto_168821 ) ) ( not ( = ?auto_168820 ?auto_168822 ) ) ( not ( = ?auto_168820 ?auto_168823 ) ) ( not ( = ?auto_168821 ?auto_168822 ) ) ( not ( = ?auto_168821 ?auto_168823 ) ) ( not ( = ?auto_168822 ?auto_168823 ) ) ( ON ?auto_168821 ?auto_168822 ) ( ON ?auto_168820 ?auto_168821 ) ( ON ?auto_168819 ?auto_168820 ) ( ON ?auto_168818 ?auto_168819 ) ( ON ?auto_168817 ?auto_168818 ) ( ON ?auto_168816 ?auto_168817 ) ( ON ?auto_168815 ?auto_168816 ) ( ON ?auto_168814 ?auto_168815 ) ( CLEAR ?auto_168812 ) ( ON ?auto_168813 ?auto_168814 ) ( CLEAR ?auto_168813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_168812 ?auto_168813 )
      ( MAKE-11PILE ?auto_168812 ?auto_168813 ?auto_168814 ?auto_168815 ?auto_168816 ?auto_168817 ?auto_168818 ?auto_168819 ?auto_168820 ?auto_168821 ?auto_168822 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168835 - BLOCK
      ?auto_168836 - BLOCK
      ?auto_168837 - BLOCK
      ?auto_168838 - BLOCK
      ?auto_168839 - BLOCK
      ?auto_168840 - BLOCK
      ?auto_168841 - BLOCK
      ?auto_168842 - BLOCK
      ?auto_168843 - BLOCK
      ?auto_168844 - BLOCK
      ?auto_168845 - BLOCK
    )
    :vars
    (
      ?auto_168846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168845 ?auto_168846 ) ( not ( = ?auto_168835 ?auto_168836 ) ) ( not ( = ?auto_168835 ?auto_168837 ) ) ( not ( = ?auto_168835 ?auto_168838 ) ) ( not ( = ?auto_168835 ?auto_168839 ) ) ( not ( = ?auto_168835 ?auto_168840 ) ) ( not ( = ?auto_168835 ?auto_168841 ) ) ( not ( = ?auto_168835 ?auto_168842 ) ) ( not ( = ?auto_168835 ?auto_168843 ) ) ( not ( = ?auto_168835 ?auto_168844 ) ) ( not ( = ?auto_168835 ?auto_168845 ) ) ( not ( = ?auto_168835 ?auto_168846 ) ) ( not ( = ?auto_168836 ?auto_168837 ) ) ( not ( = ?auto_168836 ?auto_168838 ) ) ( not ( = ?auto_168836 ?auto_168839 ) ) ( not ( = ?auto_168836 ?auto_168840 ) ) ( not ( = ?auto_168836 ?auto_168841 ) ) ( not ( = ?auto_168836 ?auto_168842 ) ) ( not ( = ?auto_168836 ?auto_168843 ) ) ( not ( = ?auto_168836 ?auto_168844 ) ) ( not ( = ?auto_168836 ?auto_168845 ) ) ( not ( = ?auto_168836 ?auto_168846 ) ) ( not ( = ?auto_168837 ?auto_168838 ) ) ( not ( = ?auto_168837 ?auto_168839 ) ) ( not ( = ?auto_168837 ?auto_168840 ) ) ( not ( = ?auto_168837 ?auto_168841 ) ) ( not ( = ?auto_168837 ?auto_168842 ) ) ( not ( = ?auto_168837 ?auto_168843 ) ) ( not ( = ?auto_168837 ?auto_168844 ) ) ( not ( = ?auto_168837 ?auto_168845 ) ) ( not ( = ?auto_168837 ?auto_168846 ) ) ( not ( = ?auto_168838 ?auto_168839 ) ) ( not ( = ?auto_168838 ?auto_168840 ) ) ( not ( = ?auto_168838 ?auto_168841 ) ) ( not ( = ?auto_168838 ?auto_168842 ) ) ( not ( = ?auto_168838 ?auto_168843 ) ) ( not ( = ?auto_168838 ?auto_168844 ) ) ( not ( = ?auto_168838 ?auto_168845 ) ) ( not ( = ?auto_168838 ?auto_168846 ) ) ( not ( = ?auto_168839 ?auto_168840 ) ) ( not ( = ?auto_168839 ?auto_168841 ) ) ( not ( = ?auto_168839 ?auto_168842 ) ) ( not ( = ?auto_168839 ?auto_168843 ) ) ( not ( = ?auto_168839 ?auto_168844 ) ) ( not ( = ?auto_168839 ?auto_168845 ) ) ( not ( = ?auto_168839 ?auto_168846 ) ) ( not ( = ?auto_168840 ?auto_168841 ) ) ( not ( = ?auto_168840 ?auto_168842 ) ) ( not ( = ?auto_168840 ?auto_168843 ) ) ( not ( = ?auto_168840 ?auto_168844 ) ) ( not ( = ?auto_168840 ?auto_168845 ) ) ( not ( = ?auto_168840 ?auto_168846 ) ) ( not ( = ?auto_168841 ?auto_168842 ) ) ( not ( = ?auto_168841 ?auto_168843 ) ) ( not ( = ?auto_168841 ?auto_168844 ) ) ( not ( = ?auto_168841 ?auto_168845 ) ) ( not ( = ?auto_168841 ?auto_168846 ) ) ( not ( = ?auto_168842 ?auto_168843 ) ) ( not ( = ?auto_168842 ?auto_168844 ) ) ( not ( = ?auto_168842 ?auto_168845 ) ) ( not ( = ?auto_168842 ?auto_168846 ) ) ( not ( = ?auto_168843 ?auto_168844 ) ) ( not ( = ?auto_168843 ?auto_168845 ) ) ( not ( = ?auto_168843 ?auto_168846 ) ) ( not ( = ?auto_168844 ?auto_168845 ) ) ( not ( = ?auto_168844 ?auto_168846 ) ) ( not ( = ?auto_168845 ?auto_168846 ) ) ( ON ?auto_168844 ?auto_168845 ) ( ON ?auto_168843 ?auto_168844 ) ( ON ?auto_168842 ?auto_168843 ) ( ON ?auto_168841 ?auto_168842 ) ( ON ?auto_168840 ?auto_168841 ) ( ON ?auto_168839 ?auto_168840 ) ( ON ?auto_168838 ?auto_168839 ) ( ON ?auto_168837 ?auto_168838 ) ( ON ?auto_168836 ?auto_168837 ) ( ON ?auto_168835 ?auto_168836 ) ( CLEAR ?auto_168835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168835 )
      ( MAKE-11PILE ?auto_168835 ?auto_168836 ?auto_168837 ?auto_168838 ?auto_168839 ?auto_168840 ?auto_168841 ?auto_168842 ?auto_168843 ?auto_168844 ?auto_168845 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_168858 - BLOCK
      ?auto_168859 - BLOCK
      ?auto_168860 - BLOCK
      ?auto_168861 - BLOCK
      ?auto_168862 - BLOCK
      ?auto_168863 - BLOCK
      ?auto_168864 - BLOCK
      ?auto_168865 - BLOCK
      ?auto_168866 - BLOCK
      ?auto_168867 - BLOCK
      ?auto_168868 - BLOCK
    )
    :vars
    (
      ?auto_168869 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168868 ?auto_168869 ) ( not ( = ?auto_168858 ?auto_168859 ) ) ( not ( = ?auto_168858 ?auto_168860 ) ) ( not ( = ?auto_168858 ?auto_168861 ) ) ( not ( = ?auto_168858 ?auto_168862 ) ) ( not ( = ?auto_168858 ?auto_168863 ) ) ( not ( = ?auto_168858 ?auto_168864 ) ) ( not ( = ?auto_168858 ?auto_168865 ) ) ( not ( = ?auto_168858 ?auto_168866 ) ) ( not ( = ?auto_168858 ?auto_168867 ) ) ( not ( = ?auto_168858 ?auto_168868 ) ) ( not ( = ?auto_168858 ?auto_168869 ) ) ( not ( = ?auto_168859 ?auto_168860 ) ) ( not ( = ?auto_168859 ?auto_168861 ) ) ( not ( = ?auto_168859 ?auto_168862 ) ) ( not ( = ?auto_168859 ?auto_168863 ) ) ( not ( = ?auto_168859 ?auto_168864 ) ) ( not ( = ?auto_168859 ?auto_168865 ) ) ( not ( = ?auto_168859 ?auto_168866 ) ) ( not ( = ?auto_168859 ?auto_168867 ) ) ( not ( = ?auto_168859 ?auto_168868 ) ) ( not ( = ?auto_168859 ?auto_168869 ) ) ( not ( = ?auto_168860 ?auto_168861 ) ) ( not ( = ?auto_168860 ?auto_168862 ) ) ( not ( = ?auto_168860 ?auto_168863 ) ) ( not ( = ?auto_168860 ?auto_168864 ) ) ( not ( = ?auto_168860 ?auto_168865 ) ) ( not ( = ?auto_168860 ?auto_168866 ) ) ( not ( = ?auto_168860 ?auto_168867 ) ) ( not ( = ?auto_168860 ?auto_168868 ) ) ( not ( = ?auto_168860 ?auto_168869 ) ) ( not ( = ?auto_168861 ?auto_168862 ) ) ( not ( = ?auto_168861 ?auto_168863 ) ) ( not ( = ?auto_168861 ?auto_168864 ) ) ( not ( = ?auto_168861 ?auto_168865 ) ) ( not ( = ?auto_168861 ?auto_168866 ) ) ( not ( = ?auto_168861 ?auto_168867 ) ) ( not ( = ?auto_168861 ?auto_168868 ) ) ( not ( = ?auto_168861 ?auto_168869 ) ) ( not ( = ?auto_168862 ?auto_168863 ) ) ( not ( = ?auto_168862 ?auto_168864 ) ) ( not ( = ?auto_168862 ?auto_168865 ) ) ( not ( = ?auto_168862 ?auto_168866 ) ) ( not ( = ?auto_168862 ?auto_168867 ) ) ( not ( = ?auto_168862 ?auto_168868 ) ) ( not ( = ?auto_168862 ?auto_168869 ) ) ( not ( = ?auto_168863 ?auto_168864 ) ) ( not ( = ?auto_168863 ?auto_168865 ) ) ( not ( = ?auto_168863 ?auto_168866 ) ) ( not ( = ?auto_168863 ?auto_168867 ) ) ( not ( = ?auto_168863 ?auto_168868 ) ) ( not ( = ?auto_168863 ?auto_168869 ) ) ( not ( = ?auto_168864 ?auto_168865 ) ) ( not ( = ?auto_168864 ?auto_168866 ) ) ( not ( = ?auto_168864 ?auto_168867 ) ) ( not ( = ?auto_168864 ?auto_168868 ) ) ( not ( = ?auto_168864 ?auto_168869 ) ) ( not ( = ?auto_168865 ?auto_168866 ) ) ( not ( = ?auto_168865 ?auto_168867 ) ) ( not ( = ?auto_168865 ?auto_168868 ) ) ( not ( = ?auto_168865 ?auto_168869 ) ) ( not ( = ?auto_168866 ?auto_168867 ) ) ( not ( = ?auto_168866 ?auto_168868 ) ) ( not ( = ?auto_168866 ?auto_168869 ) ) ( not ( = ?auto_168867 ?auto_168868 ) ) ( not ( = ?auto_168867 ?auto_168869 ) ) ( not ( = ?auto_168868 ?auto_168869 ) ) ( ON ?auto_168867 ?auto_168868 ) ( ON ?auto_168866 ?auto_168867 ) ( ON ?auto_168865 ?auto_168866 ) ( ON ?auto_168864 ?auto_168865 ) ( ON ?auto_168863 ?auto_168864 ) ( ON ?auto_168862 ?auto_168863 ) ( ON ?auto_168861 ?auto_168862 ) ( ON ?auto_168860 ?auto_168861 ) ( ON ?auto_168859 ?auto_168860 ) ( ON ?auto_168858 ?auto_168859 ) ( CLEAR ?auto_168858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_168858 )
      ( MAKE-11PILE ?auto_168858 ?auto_168859 ?auto_168860 ?auto_168861 ?auto_168862 ?auto_168863 ?auto_168864 ?auto_168865 ?auto_168866 ?auto_168867 ?auto_168868 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168882 - BLOCK
      ?auto_168883 - BLOCK
      ?auto_168884 - BLOCK
      ?auto_168885 - BLOCK
      ?auto_168886 - BLOCK
      ?auto_168887 - BLOCK
      ?auto_168888 - BLOCK
      ?auto_168889 - BLOCK
      ?auto_168890 - BLOCK
      ?auto_168891 - BLOCK
      ?auto_168892 - BLOCK
      ?auto_168893 - BLOCK
    )
    :vars
    (
      ?auto_168894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168892 ) ( ON ?auto_168893 ?auto_168894 ) ( CLEAR ?auto_168893 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168882 ) ( ON ?auto_168883 ?auto_168882 ) ( ON ?auto_168884 ?auto_168883 ) ( ON ?auto_168885 ?auto_168884 ) ( ON ?auto_168886 ?auto_168885 ) ( ON ?auto_168887 ?auto_168886 ) ( ON ?auto_168888 ?auto_168887 ) ( ON ?auto_168889 ?auto_168888 ) ( ON ?auto_168890 ?auto_168889 ) ( ON ?auto_168891 ?auto_168890 ) ( ON ?auto_168892 ?auto_168891 ) ( not ( = ?auto_168882 ?auto_168883 ) ) ( not ( = ?auto_168882 ?auto_168884 ) ) ( not ( = ?auto_168882 ?auto_168885 ) ) ( not ( = ?auto_168882 ?auto_168886 ) ) ( not ( = ?auto_168882 ?auto_168887 ) ) ( not ( = ?auto_168882 ?auto_168888 ) ) ( not ( = ?auto_168882 ?auto_168889 ) ) ( not ( = ?auto_168882 ?auto_168890 ) ) ( not ( = ?auto_168882 ?auto_168891 ) ) ( not ( = ?auto_168882 ?auto_168892 ) ) ( not ( = ?auto_168882 ?auto_168893 ) ) ( not ( = ?auto_168882 ?auto_168894 ) ) ( not ( = ?auto_168883 ?auto_168884 ) ) ( not ( = ?auto_168883 ?auto_168885 ) ) ( not ( = ?auto_168883 ?auto_168886 ) ) ( not ( = ?auto_168883 ?auto_168887 ) ) ( not ( = ?auto_168883 ?auto_168888 ) ) ( not ( = ?auto_168883 ?auto_168889 ) ) ( not ( = ?auto_168883 ?auto_168890 ) ) ( not ( = ?auto_168883 ?auto_168891 ) ) ( not ( = ?auto_168883 ?auto_168892 ) ) ( not ( = ?auto_168883 ?auto_168893 ) ) ( not ( = ?auto_168883 ?auto_168894 ) ) ( not ( = ?auto_168884 ?auto_168885 ) ) ( not ( = ?auto_168884 ?auto_168886 ) ) ( not ( = ?auto_168884 ?auto_168887 ) ) ( not ( = ?auto_168884 ?auto_168888 ) ) ( not ( = ?auto_168884 ?auto_168889 ) ) ( not ( = ?auto_168884 ?auto_168890 ) ) ( not ( = ?auto_168884 ?auto_168891 ) ) ( not ( = ?auto_168884 ?auto_168892 ) ) ( not ( = ?auto_168884 ?auto_168893 ) ) ( not ( = ?auto_168884 ?auto_168894 ) ) ( not ( = ?auto_168885 ?auto_168886 ) ) ( not ( = ?auto_168885 ?auto_168887 ) ) ( not ( = ?auto_168885 ?auto_168888 ) ) ( not ( = ?auto_168885 ?auto_168889 ) ) ( not ( = ?auto_168885 ?auto_168890 ) ) ( not ( = ?auto_168885 ?auto_168891 ) ) ( not ( = ?auto_168885 ?auto_168892 ) ) ( not ( = ?auto_168885 ?auto_168893 ) ) ( not ( = ?auto_168885 ?auto_168894 ) ) ( not ( = ?auto_168886 ?auto_168887 ) ) ( not ( = ?auto_168886 ?auto_168888 ) ) ( not ( = ?auto_168886 ?auto_168889 ) ) ( not ( = ?auto_168886 ?auto_168890 ) ) ( not ( = ?auto_168886 ?auto_168891 ) ) ( not ( = ?auto_168886 ?auto_168892 ) ) ( not ( = ?auto_168886 ?auto_168893 ) ) ( not ( = ?auto_168886 ?auto_168894 ) ) ( not ( = ?auto_168887 ?auto_168888 ) ) ( not ( = ?auto_168887 ?auto_168889 ) ) ( not ( = ?auto_168887 ?auto_168890 ) ) ( not ( = ?auto_168887 ?auto_168891 ) ) ( not ( = ?auto_168887 ?auto_168892 ) ) ( not ( = ?auto_168887 ?auto_168893 ) ) ( not ( = ?auto_168887 ?auto_168894 ) ) ( not ( = ?auto_168888 ?auto_168889 ) ) ( not ( = ?auto_168888 ?auto_168890 ) ) ( not ( = ?auto_168888 ?auto_168891 ) ) ( not ( = ?auto_168888 ?auto_168892 ) ) ( not ( = ?auto_168888 ?auto_168893 ) ) ( not ( = ?auto_168888 ?auto_168894 ) ) ( not ( = ?auto_168889 ?auto_168890 ) ) ( not ( = ?auto_168889 ?auto_168891 ) ) ( not ( = ?auto_168889 ?auto_168892 ) ) ( not ( = ?auto_168889 ?auto_168893 ) ) ( not ( = ?auto_168889 ?auto_168894 ) ) ( not ( = ?auto_168890 ?auto_168891 ) ) ( not ( = ?auto_168890 ?auto_168892 ) ) ( not ( = ?auto_168890 ?auto_168893 ) ) ( not ( = ?auto_168890 ?auto_168894 ) ) ( not ( = ?auto_168891 ?auto_168892 ) ) ( not ( = ?auto_168891 ?auto_168893 ) ) ( not ( = ?auto_168891 ?auto_168894 ) ) ( not ( = ?auto_168892 ?auto_168893 ) ) ( not ( = ?auto_168892 ?auto_168894 ) ) ( not ( = ?auto_168893 ?auto_168894 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_168893 ?auto_168894 )
      ( !STACK ?auto_168893 ?auto_168892 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168907 - BLOCK
      ?auto_168908 - BLOCK
      ?auto_168909 - BLOCK
      ?auto_168910 - BLOCK
      ?auto_168911 - BLOCK
      ?auto_168912 - BLOCK
      ?auto_168913 - BLOCK
      ?auto_168914 - BLOCK
      ?auto_168915 - BLOCK
      ?auto_168916 - BLOCK
      ?auto_168917 - BLOCK
      ?auto_168918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_168917 ) ( ON-TABLE ?auto_168918 ) ( CLEAR ?auto_168918 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_168907 ) ( ON ?auto_168908 ?auto_168907 ) ( ON ?auto_168909 ?auto_168908 ) ( ON ?auto_168910 ?auto_168909 ) ( ON ?auto_168911 ?auto_168910 ) ( ON ?auto_168912 ?auto_168911 ) ( ON ?auto_168913 ?auto_168912 ) ( ON ?auto_168914 ?auto_168913 ) ( ON ?auto_168915 ?auto_168914 ) ( ON ?auto_168916 ?auto_168915 ) ( ON ?auto_168917 ?auto_168916 ) ( not ( = ?auto_168907 ?auto_168908 ) ) ( not ( = ?auto_168907 ?auto_168909 ) ) ( not ( = ?auto_168907 ?auto_168910 ) ) ( not ( = ?auto_168907 ?auto_168911 ) ) ( not ( = ?auto_168907 ?auto_168912 ) ) ( not ( = ?auto_168907 ?auto_168913 ) ) ( not ( = ?auto_168907 ?auto_168914 ) ) ( not ( = ?auto_168907 ?auto_168915 ) ) ( not ( = ?auto_168907 ?auto_168916 ) ) ( not ( = ?auto_168907 ?auto_168917 ) ) ( not ( = ?auto_168907 ?auto_168918 ) ) ( not ( = ?auto_168908 ?auto_168909 ) ) ( not ( = ?auto_168908 ?auto_168910 ) ) ( not ( = ?auto_168908 ?auto_168911 ) ) ( not ( = ?auto_168908 ?auto_168912 ) ) ( not ( = ?auto_168908 ?auto_168913 ) ) ( not ( = ?auto_168908 ?auto_168914 ) ) ( not ( = ?auto_168908 ?auto_168915 ) ) ( not ( = ?auto_168908 ?auto_168916 ) ) ( not ( = ?auto_168908 ?auto_168917 ) ) ( not ( = ?auto_168908 ?auto_168918 ) ) ( not ( = ?auto_168909 ?auto_168910 ) ) ( not ( = ?auto_168909 ?auto_168911 ) ) ( not ( = ?auto_168909 ?auto_168912 ) ) ( not ( = ?auto_168909 ?auto_168913 ) ) ( not ( = ?auto_168909 ?auto_168914 ) ) ( not ( = ?auto_168909 ?auto_168915 ) ) ( not ( = ?auto_168909 ?auto_168916 ) ) ( not ( = ?auto_168909 ?auto_168917 ) ) ( not ( = ?auto_168909 ?auto_168918 ) ) ( not ( = ?auto_168910 ?auto_168911 ) ) ( not ( = ?auto_168910 ?auto_168912 ) ) ( not ( = ?auto_168910 ?auto_168913 ) ) ( not ( = ?auto_168910 ?auto_168914 ) ) ( not ( = ?auto_168910 ?auto_168915 ) ) ( not ( = ?auto_168910 ?auto_168916 ) ) ( not ( = ?auto_168910 ?auto_168917 ) ) ( not ( = ?auto_168910 ?auto_168918 ) ) ( not ( = ?auto_168911 ?auto_168912 ) ) ( not ( = ?auto_168911 ?auto_168913 ) ) ( not ( = ?auto_168911 ?auto_168914 ) ) ( not ( = ?auto_168911 ?auto_168915 ) ) ( not ( = ?auto_168911 ?auto_168916 ) ) ( not ( = ?auto_168911 ?auto_168917 ) ) ( not ( = ?auto_168911 ?auto_168918 ) ) ( not ( = ?auto_168912 ?auto_168913 ) ) ( not ( = ?auto_168912 ?auto_168914 ) ) ( not ( = ?auto_168912 ?auto_168915 ) ) ( not ( = ?auto_168912 ?auto_168916 ) ) ( not ( = ?auto_168912 ?auto_168917 ) ) ( not ( = ?auto_168912 ?auto_168918 ) ) ( not ( = ?auto_168913 ?auto_168914 ) ) ( not ( = ?auto_168913 ?auto_168915 ) ) ( not ( = ?auto_168913 ?auto_168916 ) ) ( not ( = ?auto_168913 ?auto_168917 ) ) ( not ( = ?auto_168913 ?auto_168918 ) ) ( not ( = ?auto_168914 ?auto_168915 ) ) ( not ( = ?auto_168914 ?auto_168916 ) ) ( not ( = ?auto_168914 ?auto_168917 ) ) ( not ( = ?auto_168914 ?auto_168918 ) ) ( not ( = ?auto_168915 ?auto_168916 ) ) ( not ( = ?auto_168915 ?auto_168917 ) ) ( not ( = ?auto_168915 ?auto_168918 ) ) ( not ( = ?auto_168916 ?auto_168917 ) ) ( not ( = ?auto_168916 ?auto_168918 ) ) ( not ( = ?auto_168917 ?auto_168918 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_168918 )
      ( !STACK ?auto_168918 ?auto_168917 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168931 - BLOCK
      ?auto_168932 - BLOCK
      ?auto_168933 - BLOCK
      ?auto_168934 - BLOCK
      ?auto_168935 - BLOCK
      ?auto_168936 - BLOCK
      ?auto_168937 - BLOCK
      ?auto_168938 - BLOCK
      ?auto_168939 - BLOCK
      ?auto_168940 - BLOCK
      ?auto_168941 - BLOCK
      ?auto_168942 - BLOCK
    )
    :vars
    (
      ?auto_168943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168942 ?auto_168943 ) ( ON-TABLE ?auto_168931 ) ( ON ?auto_168932 ?auto_168931 ) ( ON ?auto_168933 ?auto_168932 ) ( ON ?auto_168934 ?auto_168933 ) ( ON ?auto_168935 ?auto_168934 ) ( ON ?auto_168936 ?auto_168935 ) ( ON ?auto_168937 ?auto_168936 ) ( ON ?auto_168938 ?auto_168937 ) ( ON ?auto_168939 ?auto_168938 ) ( ON ?auto_168940 ?auto_168939 ) ( not ( = ?auto_168931 ?auto_168932 ) ) ( not ( = ?auto_168931 ?auto_168933 ) ) ( not ( = ?auto_168931 ?auto_168934 ) ) ( not ( = ?auto_168931 ?auto_168935 ) ) ( not ( = ?auto_168931 ?auto_168936 ) ) ( not ( = ?auto_168931 ?auto_168937 ) ) ( not ( = ?auto_168931 ?auto_168938 ) ) ( not ( = ?auto_168931 ?auto_168939 ) ) ( not ( = ?auto_168931 ?auto_168940 ) ) ( not ( = ?auto_168931 ?auto_168941 ) ) ( not ( = ?auto_168931 ?auto_168942 ) ) ( not ( = ?auto_168931 ?auto_168943 ) ) ( not ( = ?auto_168932 ?auto_168933 ) ) ( not ( = ?auto_168932 ?auto_168934 ) ) ( not ( = ?auto_168932 ?auto_168935 ) ) ( not ( = ?auto_168932 ?auto_168936 ) ) ( not ( = ?auto_168932 ?auto_168937 ) ) ( not ( = ?auto_168932 ?auto_168938 ) ) ( not ( = ?auto_168932 ?auto_168939 ) ) ( not ( = ?auto_168932 ?auto_168940 ) ) ( not ( = ?auto_168932 ?auto_168941 ) ) ( not ( = ?auto_168932 ?auto_168942 ) ) ( not ( = ?auto_168932 ?auto_168943 ) ) ( not ( = ?auto_168933 ?auto_168934 ) ) ( not ( = ?auto_168933 ?auto_168935 ) ) ( not ( = ?auto_168933 ?auto_168936 ) ) ( not ( = ?auto_168933 ?auto_168937 ) ) ( not ( = ?auto_168933 ?auto_168938 ) ) ( not ( = ?auto_168933 ?auto_168939 ) ) ( not ( = ?auto_168933 ?auto_168940 ) ) ( not ( = ?auto_168933 ?auto_168941 ) ) ( not ( = ?auto_168933 ?auto_168942 ) ) ( not ( = ?auto_168933 ?auto_168943 ) ) ( not ( = ?auto_168934 ?auto_168935 ) ) ( not ( = ?auto_168934 ?auto_168936 ) ) ( not ( = ?auto_168934 ?auto_168937 ) ) ( not ( = ?auto_168934 ?auto_168938 ) ) ( not ( = ?auto_168934 ?auto_168939 ) ) ( not ( = ?auto_168934 ?auto_168940 ) ) ( not ( = ?auto_168934 ?auto_168941 ) ) ( not ( = ?auto_168934 ?auto_168942 ) ) ( not ( = ?auto_168934 ?auto_168943 ) ) ( not ( = ?auto_168935 ?auto_168936 ) ) ( not ( = ?auto_168935 ?auto_168937 ) ) ( not ( = ?auto_168935 ?auto_168938 ) ) ( not ( = ?auto_168935 ?auto_168939 ) ) ( not ( = ?auto_168935 ?auto_168940 ) ) ( not ( = ?auto_168935 ?auto_168941 ) ) ( not ( = ?auto_168935 ?auto_168942 ) ) ( not ( = ?auto_168935 ?auto_168943 ) ) ( not ( = ?auto_168936 ?auto_168937 ) ) ( not ( = ?auto_168936 ?auto_168938 ) ) ( not ( = ?auto_168936 ?auto_168939 ) ) ( not ( = ?auto_168936 ?auto_168940 ) ) ( not ( = ?auto_168936 ?auto_168941 ) ) ( not ( = ?auto_168936 ?auto_168942 ) ) ( not ( = ?auto_168936 ?auto_168943 ) ) ( not ( = ?auto_168937 ?auto_168938 ) ) ( not ( = ?auto_168937 ?auto_168939 ) ) ( not ( = ?auto_168937 ?auto_168940 ) ) ( not ( = ?auto_168937 ?auto_168941 ) ) ( not ( = ?auto_168937 ?auto_168942 ) ) ( not ( = ?auto_168937 ?auto_168943 ) ) ( not ( = ?auto_168938 ?auto_168939 ) ) ( not ( = ?auto_168938 ?auto_168940 ) ) ( not ( = ?auto_168938 ?auto_168941 ) ) ( not ( = ?auto_168938 ?auto_168942 ) ) ( not ( = ?auto_168938 ?auto_168943 ) ) ( not ( = ?auto_168939 ?auto_168940 ) ) ( not ( = ?auto_168939 ?auto_168941 ) ) ( not ( = ?auto_168939 ?auto_168942 ) ) ( not ( = ?auto_168939 ?auto_168943 ) ) ( not ( = ?auto_168940 ?auto_168941 ) ) ( not ( = ?auto_168940 ?auto_168942 ) ) ( not ( = ?auto_168940 ?auto_168943 ) ) ( not ( = ?auto_168941 ?auto_168942 ) ) ( not ( = ?auto_168941 ?auto_168943 ) ) ( not ( = ?auto_168942 ?auto_168943 ) ) ( CLEAR ?auto_168940 ) ( ON ?auto_168941 ?auto_168942 ) ( CLEAR ?auto_168941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_168931 ?auto_168932 ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168936 ?auto_168937 ?auto_168938 ?auto_168939 ?auto_168940 ?auto_168941 )
      ( MAKE-12PILE ?auto_168931 ?auto_168932 ?auto_168933 ?auto_168934 ?auto_168935 ?auto_168936 ?auto_168937 ?auto_168938 ?auto_168939 ?auto_168940 ?auto_168941 ?auto_168942 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168956 - BLOCK
      ?auto_168957 - BLOCK
      ?auto_168958 - BLOCK
      ?auto_168959 - BLOCK
      ?auto_168960 - BLOCK
      ?auto_168961 - BLOCK
      ?auto_168962 - BLOCK
      ?auto_168963 - BLOCK
      ?auto_168964 - BLOCK
      ?auto_168965 - BLOCK
      ?auto_168966 - BLOCK
      ?auto_168967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_168967 ) ( ON-TABLE ?auto_168956 ) ( ON ?auto_168957 ?auto_168956 ) ( ON ?auto_168958 ?auto_168957 ) ( ON ?auto_168959 ?auto_168958 ) ( ON ?auto_168960 ?auto_168959 ) ( ON ?auto_168961 ?auto_168960 ) ( ON ?auto_168962 ?auto_168961 ) ( ON ?auto_168963 ?auto_168962 ) ( ON ?auto_168964 ?auto_168963 ) ( ON ?auto_168965 ?auto_168964 ) ( not ( = ?auto_168956 ?auto_168957 ) ) ( not ( = ?auto_168956 ?auto_168958 ) ) ( not ( = ?auto_168956 ?auto_168959 ) ) ( not ( = ?auto_168956 ?auto_168960 ) ) ( not ( = ?auto_168956 ?auto_168961 ) ) ( not ( = ?auto_168956 ?auto_168962 ) ) ( not ( = ?auto_168956 ?auto_168963 ) ) ( not ( = ?auto_168956 ?auto_168964 ) ) ( not ( = ?auto_168956 ?auto_168965 ) ) ( not ( = ?auto_168956 ?auto_168966 ) ) ( not ( = ?auto_168956 ?auto_168967 ) ) ( not ( = ?auto_168957 ?auto_168958 ) ) ( not ( = ?auto_168957 ?auto_168959 ) ) ( not ( = ?auto_168957 ?auto_168960 ) ) ( not ( = ?auto_168957 ?auto_168961 ) ) ( not ( = ?auto_168957 ?auto_168962 ) ) ( not ( = ?auto_168957 ?auto_168963 ) ) ( not ( = ?auto_168957 ?auto_168964 ) ) ( not ( = ?auto_168957 ?auto_168965 ) ) ( not ( = ?auto_168957 ?auto_168966 ) ) ( not ( = ?auto_168957 ?auto_168967 ) ) ( not ( = ?auto_168958 ?auto_168959 ) ) ( not ( = ?auto_168958 ?auto_168960 ) ) ( not ( = ?auto_168958 ?auto_168961 ) ) ( not ( = ?auto_168958 ?auto_168962 ) ) ( not ( = ?auto_168958 ?auto_168963 ) ) ( not ( = ?auto_168958 ?auto_168964 ) ) ( not ( = ?auto_168958 ?auto_168965 ) ) ( not ( = ?auto_168958 ?auto_168966 ) ) ( not ( = ?auto_168958 ?auto_168967 ) ) ( not ( = ?auto_168959 ?auto_168960 ) ) ( not ( = ?auto_168959 ?auto_168961 ) ) ( not ( = ?auto_168959 ?auto_168962 ) ) ( not ( = ?auto_168959 ?auto_168963 ) ) ( not ( = ?auto_168959 ?auto_168964 ) ) ( not ( = ?auto_168959 ?auto_168965 ) ) ( not ( = ?auto_168959 ?auto_168966 ) ) ( not ( = ?auto_168959 ?auto_168967 ) ) ( not ( = ?auto_168960 ?auto_168961 ) ) ( not ( = ?auto_168960 ?auto_168962 ) ) ( not ( = ?auto_168960 ?auto_168963 ) ) ( not ( = ?auto_168960 ?auto_168964 ) ) ( not ( = ?auto_168960 ?auto_168965 ) ) ( not ( = ?auto_168960 ?auto_168966 ) ) ( not ( = ?auto_168960 ?auto_168967 ) ) ( not ( = ?auto_168961 ?auto_168962 ) ) ( not ( = ?auto_168961 ?auto_168963 ) ) ( not ( = ?auto_168961 ?auto_168964 ) ) ( not ( = ?auto_168961 ?auto_168965 ) ) ( not ( = ?auto_168961 ?auto_168966 ) ) ( not ( = ?auto_168961 ?auto_168967 ) ) ( not ( = ?auto_168962 ?auto_168963 ) ) ( not ( = ?auto_168962 ?auto_168964 ) ) ( not ( = ?auto_168962 ?auto_168965 ) ) ( not ( = ?auto_168962 ?auto_168966 ) ) ( not ( = ?auto_168962 ?auto_168967 ) ) ( not ( = ?auto_168963 ?auto_168964 ) ) ( not ( = ?auto_168963 ?auto_168965 ) ) ( not ( = ?auto_168963 ?auto_168966 ) ) ( not ( = ?auto_168963 ?auto_168967 ) ) ( not ( = ?auto_168964 ?auto_168965 ) ) ( not ( = ?auto_168964 ?auto_168966 ) ) ( not ( = ?auto_168964 ?auto_168967 ) ) ( not ( = ?auto_168965 ?auto_168966 ) ) ( not ( = ?auto_168965 ?auto_168967 ) ) ( not ( = ?auto_168966 ?auto_168967 ) ) ( CLEAR ?auto_168965 ) ( ON ?auto_168966 ?auto_168967 ) ( CLEAR ?auto_168966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_168956 ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ?auto_168962 ?auto_168963 ?auto_168964 ?auto_168965 ?auto_168966 )
      ( MAKE-12PILE ?auto_168956 ?auto_168957 ?auto_168958 ?auto_168959 ?auto_168960 ?auto_168961 ?auto_168962 ?auto_168963 ?auto_168964 ?auto_168965 ?auto_168966 ?auto_168967 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_168980 - BLOCK
      ?auto_168981 - BLOCK
      ?auto_168982 - BLOCK
      ?auto_168983 - BLOCK
      ?auto_168984 - BLOCK
      ?auto_168985 - BLOCK
      ?auto_168986 - BLOCK
      ?auto_168987 - BLOCK
      ?auto_168988 - BLOCK
      ?auto_168989 - BLOCK
      ?auto_168990 - BLOCK
      ?auto_168991 - BLOCK
    )
    :vars
    (
      ?auto_168992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_168991 ?auto_168992 ) ( ON-TABLE ?auto_168980 ) ( ON ?auto_168981 ?auto_168980 ) ( ON ?auto_168982 ?auto_168981 ) ( ON ?auto_168983 ?auto_168982 ) ( ON ?auto_168984 ?auto_168983 ) ( ON ?auto_168985 ?auto_168984 ) ( ON ?auto_168986 ?auto_168985 ) ( ON ?auto_168987 ?auto_168986 ) ( ON ?auto_168988 ?auto_168987 ) ( not ( = ?auto_168980 ?auto_168981 ) ) ( not ( = ?auto_168980 ?auto_168982 ) ) ( not ( = ?auto_168980 ?auto_168983 ) ) ( not ( = ?auto_168980 ?auto_168984 ) ) ( not ( = ?auto_168980 ?auto_168985 ) ) ( not ( = ?auto_168980 ?auto_168986 ) ) ( not ( = ?auto_168980 ?auto_168987 ) ) ( not ( = ?auto_168980 ?auto_168988 ) ) ( not ( = ?auto_168980 ?auto_168989 ) ) ( not ( = ?auto_168980 ?auto_168990 ) ) ( not ( = ?auto_168980 ?auto_168991 ) ) ( not ( = ?auto_168980 ?auto_168992 ) ) ( not ( = ?auto_168981 ?auto_168982 ) ) ( not ( = ?auto_168981 ?auto_168983 ) ) ( not ( = ?auto_168981 ?auto_168984 ) ) ( not ( = ?auto_168981 ?auto_168985 ) ) ( not ( = ?auto_168981 ?auto_168986 ) ) ( not ( = ?auto_168981 ?auto_168987 ) ) ( not ( = ?auto_168981 ?auto_168988 ) ) ( not ( = ?auto_168981 ?auto_168989 ) ) ( not ( = ?auto_168981 ?auto_168990 ) ) ( not ( = ?auto_168981 ?auto_168991 ) ) ( not ( = ?auto_168981 ?auto_168992 ) ) ( not ( = ?auto_168982 ?auto_168983 ) ) ( not ( = ?auto_168982 ?auto_168984 ) ) ( not ( = ?auto_168982 ?auto_168985 ) ) ( not ( = ?auto_168982 ?auto_168986 ) ) ( not ( = ?auto_168982 ?auto_168987 ) ) ( not ( = ?auto_168982 ?auto_168988 ) ) ( not ( = ?auto_168982 ?auto_168989 ) ) ( not ( = ?auto_168982 ?auto_168990 ) ) ( not ( = ?auto_168982 ?auto_168991 ) ) ( not ( = ?auto_168982 ?auto_168992 ) ) ( not ( = ?auto_168983 ?auto_168984 ) ) ( not ( = ?auto_168983 ?auto_168985 ) ) ( not ( = ?auto_168983 ?auto_168986 ) ) ( not ( = ?auto_168983 ?auto_168987 ) ) ( not ( = ?auto_168983 ?auto_168988 ) ) ( not ( = ?auto_168983 ?auto_168989 ) ) ( not ( = ?auto_168983 ?auto_168990 ) ) ( not ( = ?auto_168983 ?auto_168991 ) ) ( not ( = ?auto_168983 ?auto_168992 ) ) ( not ( = ?auto_168984 ?auto_168985 ) ) ( not ( = ?auto_168984 ?auto_168986 ) ) ( not ( = ?auto_168984 ?auto_168987 ) ) ( not ( = ?auto_168984 ?auto_168988 ) ) ( not ( = ?auto_168984 ?auto_168989 ) ) ( not ( = ?auto_168984 ?auto_168990 ) ) ( not ( = ?auto_168984 ?auto_168991 ) ) ( not ( = ?auto_168984 ?auto_168992 ) ) ( not ( = ?auto_168985 ?auto_168986 ) ) ( not ( = ?auto_168985 ?auto_168987 ) ) ( not ( = ?auto_168985 ?auto_168988 ) ) ( not ( = ?auto_168985 ?auto_168989 ) ) ( not ( = ?auto_168985 ?auto_168990 ) ) ( not ( = ?auto_168985 ?auto_168991 ) ) ( not ( = ?auto_168985 ?auto_168992 ) ) ( not ( = ?auto_168986 ?auto_168987 ) ) ( not ( = ?auto_168986 ?auto_168988 ) ) ( not ( = ?auto_168986 ?auto_168989 ) ) ( not ( = ?auto_168986 ?auto_168990 ) ) ( not ( = ?auto_168986 ?auto_168991 ) ) ( not ( = ?auto_168986 ?auto_168992 ) ) ( not ( = ?auto_168987 ?auto_168988 ) ) ( not ( = ?auto_168987 ?auto_168989 ) ) ( not ( = ?auto_168987 ?auto_168990 ) ) ( not ( = ?auto_168987 ?auto_168991 ) ) ( not ( = ?auto_168987 ?auto_168992 ) ) ( not ( = ?auto_168988 ?auto_168989 ) ) ( not ( = ?auto_168988 ?auto_168990 ) ) ( not ( = ?auto_168988 ?auto_168991 ) ) ( not ( = ?auto_168988 ?auto_168992 ) ) ( not ( = ?auto_168989 ?auto_168990 ) ) ( not ( = ?auto_168989 ?auto_168991 ) ) ( not ( = ?auto_168989 ?auto_168992 ) ) ( not ( = ?auto_168990 ?auto_168991 ) ) ( not ( = ?auto_168990 ?auto_168992 ) ) ( not ( = ?auto_168991 ?auto_168992 ) ) ( ON ?auto_168990 ?auto_168991 ) ( CLEAR ?auto_168988 ) ( ON ?auto_168989 ?auto_168990 ) ( CLEAR ?auto_168989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_168980 ?auto_168981 ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168986 ?auto_168987 ?auto_168988 ?auto_168989 )
      ( MAKE-12PILE ?auto_168980 ?auto_168981 ?auto_168982 ?auto_168983 ?auto_168984 ?auto_168985 ?auto_168986 ?auto_168987 ?auto_168988 ?auto_168989 ?auto_168990 ?auto_168991 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169005 - BLOCK
      ?auto_169006 - BLOCK
      ?auto_169007 - BLOCK
      ?auto_169008 - BLOCK
      ?auto_169009 - BLOCK
      ?auto_169010 - BLOCK
      ?auto_169011 - BLOCK
      ?auto_169012 - BLOCK
      ?auto_169013 - BLOCK
      ?auto_169014 - BLOCK
      ?auto_169015 - BLOCK
      ?auto_169016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169016 ) ( ON-TABLE ?auto_169005 ) ( ON ?auto_169006 ?auto_169005 ) ( ON ?auto_169007 ?auto_169006 ) ( ON ?auto_169008 ?auto_169007 ) ( ON ?auto_169009 ?auto_169008 ) ( ON ?auto_169010 ?auto_169009 ) ( ON ?auto_169011 ?auto_169010 ) ( ON ?auto_169012 ?auto_169011 ) ( ON ?auto_169013 ?auto_169012 ) ( not ( = ?auto_169005 ?auto_169006 ) ) ( not ( = ?auto_169005 ?auto_169007 ) ) ( not ( = ?auto_169005 ?auto_169008 ) ) ( not ( = ?auto_169005 ?auto_169009 ) ) ( not ( = ?auto_169005 ?auto_169010 ) ) ( not ( = ?auto_169005 ?auto_169011 ) ) ( not ( = ?auto_169005 ?auto_169012 ) ) ( not ( = ?auto_169005 ?auto_169013 ) ) ( not ( = ?auto_169005 ?auto_169014 ) ) ( not ( = ?auto_169005 ?auto_169015 ) ) ( not ( = ?auto_169005 ?auto_169016 ) ) ( not ( = ?auto_169006 ?auto_169007 ) ) ( not ( = ?auto_169006 ?auto_169008 ) ) ( not ( = ?auto_169006 ?auto_169009 ) ) ( not ( = ?auto_169006 ?auto_169010 ) ) ( not ( = ?auto_169006 ?auto_169011 ) ) ( not ( = ?auto_169006 ?auto_169012 ) ) ( not ( = ?auto_169006 ?auto_169013 ) ) ( not ( = ?auto_169006 ?auto_169014 ) ) ( not ( = ?auto_169006 ?auto_169015 ) ) ( not ( = ?auto_169006 ?auto_169016 ) ) ( not ( = ?auto_169007 ?auto_169008 ) ) ( not ( = ?auto_169007 ?auto_169009 ) ) ( not ( = ?auto_169007 ?auto_169010 ) ) ( not ( = ?auto_169007 ?auto_169011 ) ) ( not ( = ?auto_169007 ?auto_169012 ) ) ( not ( = ?auto_169007 ?auto_169013 ) ) ( not ( = ?auto_169007 ?auto_169014 ) ) ( not ( = ?auto_169007 ?auto_169015 ) ) ( not ( = ?auto_169007 ?auto_169016 ) ) ( not ( = ?auto_169008 ?auto_169009 ) ) ( not ( = ?auto_169008 ?auto_169010 ) ) ( not ( = ?auto_169008 ?auto_169011 ) ) ( not ( = ?auto_169008 ?auto_169012 ) ) ( not ( = ?auto_169008 ?auto_169013 ) ) ( not ( = ?auto_169008 ?auto_169014 ) ) ( not ( = ?auto_169008 ?auto_169015 ) ) ( not ( = ?auto_169008 ?auto_169016 ) ) ( not ( = ?auto_169009 ?auto_169010 ) ) ( not ( = ?auto_169009 ?auto_169011 ) ) ( not ( = ?auto_169009 ?auto_169012 ) ) ( not ( = ?auto_169009 ?auto_169013 ) ) ( not ( = ?auto_169009 ?auto_169014 ) ) ( not ( = ?auto_169009 ?auto_169015 ) ) ( not ( = ?auto_169009 ?auto_169016 ) ) ( not ( = ?auto_169010 ?auto_169011 ) ) ( not ( = ?auto_169010 ?auto_169012 ) ) ( not ( = ?auto_169010 ?auto_169013 ) ) ( not ( = ?auto_169010 ?auto_169014 ) ) ( not ( = ?auto_169010 ?auto_169015 ) ) ( not ( = ?auto_169010 ?auto_169016 ) ) ( not ( = ?auto_169011 ?auto_169012 ) ) ( not ( = ?auto_169011 ?auto_169013 ) ) ( not ( = ?auto_169011 ?auto_169014 ) ) ( not ( = ?auto_169011 ?auto_169015 ) ) ( not ( = ?auto_169011 ?auto_169016 ) ) ( not ( = ?auto_169012 ?auto_169013 ) ) ( not ( = ?auto_169012 ?auto_169014 ) ) ( not ( = ?auto_169012 ?auto_169015 ) ) ( not ( = ?auto_169012 ?auto_169016 ) ) ( not ( = ?auto_169013 ?auto_169014 ) ) ( not ( = ?auto_169013 ?auto_169015 ) ) ( not ( = ?auto_169013 ?auto_169016 ) ) ( not ( = ?auto_169014 ?auto_169015 ) ) ( not ( = ?auto_169014 ?auto_169016 ) ) ( not ( = ?auto_169015 ?auto_169016 ) ) ( ON ?auto_169015 ?auto_169016 ) ( CLEAR ?auto_169013 ) ( ON ?auto_169014 ?auto_169015 ) ( CLEAR ?auto_169014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_169005 ?auto_169006 ?auto_169007 ?auto_169008 ?auto_169009 ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ?auto_169014 )
      ( MAKE-12PILE ?auto_169005 ?auto_169006 ?auto_169007 ?auto_169008 ?auto_169009 ?auto_169010 ?auto_169011 ?auto_169012 ?auto_169013 ?auto_169014 ?auto_169015 ?auto_169016 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169029 - BLOCK
      ?auto_169030 - BLOCK
      ?auto_169031 - BLOCK
      ?auto_169032 - BLOCK
      ?auto_169033 - BLOCK
      ?auto_169034 - BLOCK
      ?auto_169035 - BLOCK
      ?auto_169036 - BLOCK
      ?auto_169037 - BLOCK
      ?auto_169038 - BLOCK
      ?auto_169039 - BLOCK
      ?auto_169040 - BLOCK
    )
    :vars
    (
      ?auto_169041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169040 ?auto_169041 ) ( ON-TABLE ?auto_169029 ) ( ON ?auto_169030 ?auto_169029 ) ( ON ?auto_169031 ?auto_169030 ) ( ON ?auto_169032 ?auto_169031 ) ( ON ?auto_169033 ?auto_169032 ) ( ON ?auto_169034 ?auto_169033 ) ( ON ?auto_169035 ?auto_169034 ) ( ON ?auto_169036 ?auto_169035 ) ( not ( = ?auto_169029 ?auto_169030 ) ) ( not ( = ?auto_169029 ?auto_169031 ) ) ( not ( = ?auto_169029 ?auto_169032 ) ) ( not ( = ?auto_169029 ?auto_169033 ) ) ( not ( = ?auto_169029 ?auto_169034 ) ) ( not ( = ?auto_169029 ?auto_169035 ) ) ( not ( = ?auto_169029 ?auto_169036 ) ) ( not ( = ?auto_169029 ?auto_169037 ) ) ( not ( = ?auto_169029 ?auto_169038 ) ) ( not ( = ?auto_169029 ?auto_169039 ) ) ( not ( = ?auto_169029 ?auto_169040 ) ) ( not ( = ?auto_169029 ?auto_169041 ) ) ( not ( = ?auto_169030 ?auto_169031 ) ) ( not ( = ?auto_169030 ?auto_169032 ) ) ( not ( = ?auto_169030 ?auto_169033 ) ) ( not ( = ?auto_169030 ?auto_169034 ) ) ( not ( = ?auto_169030 ?auto_169035 ) ) ( not ( = ?auto_169030 ?auto_169036 ) ) ( not ( = ?auto_169030 ?auto_169037 ) ) ( not ( = ?auto_169030 ?auto_169038 ) ) ( not ( = ?auto_169030 ?auto_169039 ) ) ( not ( = ?auto_169030 ?auto_169040 ) ) ( not ( = ?auto_169030 ?auto_169041 ) ) ( not ( = ?auto_169031 ?auto_169032 ) ) ( not ( = ?auto_169031 ?auto_169033 ) ) ( not ( = ?auto_169031 ?auto_169034 ) ) ( not ( = ?auto_169031 ?auto_169035 ) ) ( not ( = ?auto_169031 ?auto_169036 ) ) ( not ( = ?auto_169031 ?auto_169037 ) ) ( not ( = ?auto_169031 ?auto_169038 ) ) ( not ( = ?auto_169031 ?auto_169039 ) ) ( not ( = ?auto_169031 ?auto_169040 ) ) ( not ( = ?auto_169031 ?auto_169041 ) ) ( not ( = ?auto_169032 ?auto_169033 ) ) ( not ( = ?auto_169032 ?auto_169034 ) ) ( not ( = ?auto_169032 ?auto_169035 ) ) ( not ( = ?auto_169032 ?auto_169036 ) ) ( not ( = ?auto_169032 ?auto_169037 ) ) ( not ( = ?auto_169032 ?auto_169038 ) ) ( not ( = ?auto_169032 ?auto_169039 ) ) ( not ( = ?auto_169032 ?auto_169040 ) ) ( not ( = ?auto_169032 ?auto_169041 ) ) ( not ( = ?auto_169033 ?auto_169034 ) ) ( not ( = ?auto_169033 ?auto_169035 ) ) ( not ( = ?auto_169033 ?auto_169036 ) ) ( not ( = ?auto_169033 ?auto_169037 ) ) ( not ( = ?auto_169033 ?auto_169038 ) ) ( not ( = ?auto_169033 ?auto_169039 ) ) ( not ( = ?auto_169033 ?auto_169040 ) ) ( not ( = ?auto_169033 ?auto_169041 ) ) ( not ( = ?auto_169034 ?auto_169035 ) ) ( not ( = ?auto_169034 ?auto_169036 ) ) ( not ( = ?auto_169034 ?auto_169037 ) ) ( not ( = ?auto_169034 ?auto_169038 ) ) ( not ( = ?auto_169034 ?auto_169039 ) ) ( not ( = ?auto_169034 ?auto_169040 ) ) ( not ( = ?auto_169034 ?auto_169041 ) ) ( not ( = ?auto_169035 ?auto_169036 ) ) ( not ( = ?auto_169035 ?auto_169037 ) ) ( not ( = ?auto_169035 ?auto_169038 ) ) ( not ( = ?auto_169035 ?auto_169039 ) ) ( not ( = ?auto_169035 ?auto_169040 ) ) ( not ( = ?auto_169035 ?auto_169041 ) ) ( not ( = ?auto_169036 ?auto_169037 ) ) ( not ( = ?auto_169036 ?auto_169038 ) ) ( not ( = ?auto_169036 ?auto_169039 ) ) ( not ( = ?auto_169036 ?auto_169040 ) ) ( not ( = ?auto_169036 ?auto_169041 ) ) ( not ( = ?auto_169037 ?auto_169038 ) ) ( not ( = ?auto_169037 ?auto_169039 ) ) ( not ( = ?auto_169037 ?auto_169040 ) ) ( not ( = ?auto_169037 ?auto_169041 ) ) ( not ( = ?auto_169038 ?auto_169039 ) ) ( not ( = ?auto_169038 ?auto_169040 ) ) ( not ( = ?auto_169038 ?auto_169041 ) ) ( not ( = ?auto_169039 ?auto_169040 ) ) ( not ( = ?auto_169039 ?auto_169041 ) ) ( not ( = ?auto_169040 ?auto_169041 ) ) ( ON ?auto_169039 ?auto_169040 ) ( ON ?auto_169038 ?auto_169039 ) ( CLEAR ?auto_169036 ) ( ON ?auto_169037 ?auto_169038 ) ( CLEAR ?auto_169037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_169029 ?auto_169030 ?auto_169031 ?auto_169032 ?auto_169033 ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 )
      ( MAKE-12PILE ?auto_169029 ?auto_169030 ?auto_169031 ?auto_169032 ?auto_169033 ?auto_169034 ?auto_169035 ?auto_169036 ?auto_169037 ?auto_169038 ?auto_169039 ?auto_169040 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169054 - BLOCK
      ?auto_169055 - BLOCK
      ?auto_169056 - BLOCK
      ?auto_169057 - BLOCK
      ?auto_169058 - BLOCK
      ?auto_169059 - BLOCK
      ?auto_169060 - BLOCK
      ?auto_169061 - BLOCK
      ?auto_169062 - BLOCK
      ?auto_169063 - BLOCK
      ?auto_169064 - BLOCK
      ?auto_169065 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169065 ) ( ON-TABLE ?auto_169054 ) ( ON ?auto_169055 ?auto_169054 ) ( ON ?auto_169056 ?auto_169055 ) ( ON ?auto_169057 ?auto_169056 ) ( ON ?auto_169058 ?auto_169057 ) ( ON ?auto_169059 ?auto_169058 ) ( ON ?auto_169060 ?auto_169059 ) ( ON ?auto_169061 ?auto_169060 ) ( not ( = ?auto_169054 ?auto_169055 ) ) ( not ( = ?auto_169054 ?auto_169056 ) ) ( not ( = ?auto_169054 ?auto_169057 ) ) ( not ( = ?auto_169054 ?auto_169058 ) ) ( not ( = ?auto_169054 ?auto_169059 ) ) ( not ( = ?auto_169054 ?auto_169060 ) ) ( not ( = ?auto_169054 ?auto_169061 ) ) ( not ( = ?auto_169054 ?auto_169062 ) ) ( not ( = ?auto_169054 ?auto_169063 ) ) ( not ( = ?auto_169054 ?auto_169064 ) ) ( not ( = ?auto_169054 ?auto_169065 ) ) ( not ( = ?auto_169055 ?auto_169056 ) ) ( not ( = ?auto_169055 ?auto_169057 ) ) ( not ( = ?auto_169055 ?auto_169058 ) ) ( not ( = ?auto_169055 ?auto_169059 ) ) ( not ( = ?auto_169055 ?auto_169060 ) ) ( not ( = ?auto_169055 ?auto_169061 ) ) ( not ( = ?auto_169055 ?auto_169062 ) ) ( not ( = ?auto_169055 ?auto_169063 ) ) ( not ( = ?auto_169055 ?auto_169064 ) ) ( not ( = ?auto_169055 ?auto_169065 ) ) ( not ( = ?auto_169056 ?auto_169057 ) ) ( not ( = ?auto_169056 ?auto_169058 ) ) ( not ( = ?auto_169056 ?auto_169059 ) ) ( not ( = ?auto_169056 ?auto_169060 ) ) ( not ( = ?auto_169056 ?auto_169061 ) ) ( not ( = ?auto_169056 ?auto_169062 ) ) ( not ( = ?auto_169056 ?auto_169063 ) ) ( not ( = ?auto_169056 ?auto_169064 ) ) ( not ( = ?auto_169056 ?auto_169065 ) ) ( not ( = ?auto_169057 ?auto_169058 ) ) ( not ( = ?auto_169057 ?auto_169059 ) ) ( not ( = ?auto_169057 ?auto_169060 ) ) ( not ( = ?auto_169057 ?auto_169061 ) ) ( not ( = ?auto_169057 ?auto_169062 ) ) ( not ( = ?auto_169057 ?auto_169063 ) ) ( not ( = ?auto_169057 ?auto_169064 ) ) ( not ( = ?auto_169057 ?auto_169065 ) ) ( not ( = ?auto_169058 ?auto_169059 ) ) ( not ( = ?auto_169058 ?auto_169060 ) ) ( not ( = ?auto_169058 ?auto_169061 ) ) ( not ( = ?auto_169058 ?auto_169062 ) ) ( not ( = ?auto_169058 ?auto_169063 ) ) ( not ( = ?auto_169058 ?auto_169064 ) ) ( not ( = ?auto_169058 ?auto_169065 ) ) ( not ( = ?auto_169059 ?auto_169060 ) ) ( not ( = ?auto_169059 ?auto_169061 ) ) ( not ( = ?auto_169059 ?auto_169062 ) ) ( not ( = ?auto_169059 ?auto_169063 ) ) ( not ( = ?auto_169059 ?auto_169064 ) ) ( not ( = ?auto_169059 ?auto_169065 ) ) ( not ( = ?auto_169060 ?auto_169061 ) ) ( not ( = ?auto_169060 ?auto_169062 ) ) ( not ( = ?auto_169060 ?auto_169063 ) ) ( not ( = ?auto_169060 ?auto_169064 ) ) ( not ( = ?auto_169060 ?auto_169065 ) ) ( not ( = ?auto_169061 ?auto_169062 ) ) ( not ( = ?auto_169061 ?auto_169063 ) ) ( not ( = ?auto_169061 ?auto_169064 ) ) ( not ( = ?auto_169061 ?auto_169065 ) ) ( not ( = ?auto_169062 ?auto_169063 ) ) ( not ( = ?auto_169062 ?auto_169064 ) ) ( not ( = ?auto_169062 ?auto_169065 ) ) ( not ( = ?auto_169063 ?auto_169064 ) ) ( not ( = ?auto_169063 ?auto_169065 ) ) ( not ( = ?auto_169064 ?auto_169065 ) ) ( ON ?auto_169064 ?auto_169065 ) ( ON ?auto_169063 ?auto_169064 ) ( CLEAR ?auto_169061 ) ( ON ?auto_169062 ?auto_169063 ) ( CLEAR ?auto_169062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_169054 ?auto_169055 ?auto_169056 ?auto_169057 ?auto_169058 ?auto_169059 ?auto_169060 ?auto_169061 ?auto_169062 )
      ( MAKE-12PILE ?auto_169054 ?auto_169055 ?auto_169056 ?auto_169057 ?auto_169058 ?auto_169059 ?auto_169060 ?auto_169061 ?auto_169062 ?auto_169063 ?auto_169064 ?auto_169065 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169078 - BLOCK
      ?auto_169079 - BLOCK
      ?auto_169080 - BLOCK
      ?auto_169081 - BLOCK
      ?auto_169082 - BLOCK
      ?auto_169083 - BLOCK
      ?auto_169084 - BLOCK
      ?auto_169085 - BLOCK
      ?auto_169086 - BLOCK
      ?auto_169087 - BLOCK
      ?auto_169088 - BLOCK
      ?auto_169089 - BLOCK
    )
    :vars
    (
      ?auto_169090 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169089 ?auto_169090 ) ( ON-TABLE ?auto_169078 ) ( ON ?auto_169079 ?auto_169078 ) ( ON ?auto_169080 ?auto_169079 ) ( ON ?auto_169081 ?auto_169080 ) ( ON ?auto_169082 ?auto_169081 ) ( ON ?auto_169083 ?auto_169082 ) ( ON ?auto_169084 ?auto_169083 ) ( not ( = ?auto_169078 ?auto_169079 ) ) ( not ( = ?auto_169078 ?auto_169080 ) ) ( not ( = ?auto_169078 ?auto_169081 ) ) ( not ( = ?auto_169078 ?auto_169082 ) ) ( not ( = ?auto_169078 ?auto_169083 ) ) ( not ( = ?auto_169078 ?auto_169084 ) ) ( not ( = ?auto_169078 ?auto_169085 ) ) ( not ( = ?auto_169078 ?auto_169086 ) ) ( not ( = ?auto_169078 ?auto_169087 ) ) ( not ( = ?auto_169078 ?auto_169088 ) ) ( not ( = ?auto_169078 ?auto_169089 ) ) ( not ( = ?auto_169078 ?auto_169090 ) ) ( not ( = ?auto_169079 ?auto_169080 ) ) ( not ( = ?auto_169079 ?auto_169081 ) ) ( not ( = ?auto_169079 ?auto_169082 ) ) ( not ( = ?auto_169079 ?auto_169083 ) ) ( not ( = ?auto_169079 ?auto_169084 ) ) ( not ( = ?auto_169079 ?auto_169085 ) ) ( not ( = ?auto_169079 ?auto_169086 ) ) ( not ( = ?auto_169079 ?auto_169087 ) ) ( not ( = ?auto_169079 ?auto_169088 ) ) ( not ( = ?auto_169079 ?auto_169089 ) ) ( not ( = ?auto_169079 ?auto_169090 ) ) ( not ( = ?auto_169080 ?auto_169081 ) ) ( not ( = ?auto_169080 ?auto_169082 ) ) ( not ( = ?auto_169080 ?auto_169083 ) ) ( not ( = ?auto_169080 ?auto_169084 ) ) ( not ( = ?auto_169080 ?auto_169085 ) ) ( not ( = ?auto_169080 ?auto_169086 ) ) ( not ( = ?auto_169080 ?auto_169087 ) ) ( not ( = ?auto_169080 ?auto_169088 ) ) ( not ( = ?auto_169080 ?auto_169089 ) ) ( not ( = ?auto_169080 ?auto_169090 ) ) ( not ( = ?auto_169081 ?auto_169082 ) ) ( not ( = ?auto_169081 ?auto_169083 ) ) ( not ( = ?auto_169081 ?auto_169084 ) ) ( not ( = ?auto_169081 ?auto_169085 ) ) ( not ( = ?auto_169081 ?auto_169086 ) ) ( not ( = ?auto_169081 ?auto_169087 ) ) ( not ( = ?auto_169081 ?auto_169088 ) ) ( not ( = ?auto_169081 ?auto_169089 ) ) ( not ( = ?auto_169081 ?auto_169090 ) ) ( not ( = ?auto_169082 ?auto_169083 ) ) ( not ( = ?auto_169082 ?auto_169084 ) ) ( not ( = ?auto_169082 ?auto_169085 ) ) ( not ( = ?auto_169082 ?auto_169086 ) ) ( not ( = ?auto_169082 ?auto_169087 ) ) ( not ( = ?auto_169082 ?auto_169088 ) ) ( not ( = ?auto_169082 ?auto_169089 ) ) ( not ( = ?auto_169082 ?auto_169090 ) ) ( not ( = ?auto_169083 ?auto_169084 ) ) ( not ( = ?auto_169083 ?auto_169085 ) ) ( not ( = ?auto_169083 ?auto_169086 ) ) ( not ( = ?auto_169083 ?auto_169087 ) ) ( not ( = ?auto_169083 ?auto_169088 ) ) ( not ( = ?auto_169083 ?auto_169089 ) ) ( not ( = ?auto_169083 ?auto_169090 ) ) ( not ( = ?auto_169084 ?auto_169085 ) ) ( not ( = ?auto_169084 ?auto_169086 ) ) ( not ( = ?auto_169084 ?auto_169087 ) ) ( not ( = ?auto_169084 ?auto_169088 ) ) ( not ( = ?auto_169084 ?auto_169089 ) ) ( not ( = ?auto_169084 ?auto_169090 ) ) ( not ( = ?auto_169085 ?auto_169086 ) ) ( not ( = ?auto_169085 ?auto_169087 ) ) ( not ( = ?auto_169085 ?auto_169088 ) ) ( not ( = ?auto_169085 ?auto_169089 ) ) ( not ( = ?auto_169085 ?auto_169090 ) ) ( not ( = ?auto_169086 ?auto_169087 ) ) ( not ( = ?auto_169086 ?auto_169088 ) ) ( not ( = ?auto_169086 ?auto_169089 ) ) ( not ( = ?auto_169086 ?auto_169090 ) ) ( not ( = ?auto_169087 ?auto_169088 ) ) ( not ( = ?auto_169087 ?auto_169089 ) ) ( not ( = ?auto_169087 ?auto_169090 ) ) ( not ( = ?auto_169088 ?auto_169089 ) ) ( not ( = ?auto_169088 ?auto_169090 ) ) ( not ( = ?auto_169089 ?auto_169090 ) ) ( ON ?auto_169088 ?auto_169089 ) ( ON ?auto_169087 ?auto_169088 ) ( ON ?auto_169086 ?auto_169087 ) ( CLEAR ?auto_169084 ) ( ON ?auto_169085 ?auto_169086 ) ( CLEAR ?auto_169085 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169078 ?auto_169079 ?auto_169080 ?auto_169081 ?auto_169082 ?auto_169083 ?auto_169084 ?auto_169085 )
      ( MAKE-12PILE ?auto_169078 ?auto_169079 ?auto_169080 ?auto_169081 ?auto_169082 ?auto_169083 ?auto_169084 ?auto_169085 ?auto_169086 ?auto_169087 ?auto_169088 ?auto_169089 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169103 - BLOCK
      ?auto_169104 - BLOCK
      ?auto_169105 - BLOCK
      ?auto_169106 - BLOCK
      ?auto_169107 - BLOCK
      ?auto_169108 - BLOCK
      ?auto_169109 - BLOCK
      ?auto_169110 - BLOCK
      ?auto_169111 - BLOCK
      ?auto_169112 - BLOCK
      ?auto_169113 - BLOCK
      ?auto_169114 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169114 ) ( ON-TABLE ?auto_169103 ) ( ON ?auto_169104 ?auto_169103 ) ( ON ?auto_169105 ?auto_169104 ) ( ON ?auto_169106 ?auto_169105 ) ( ON ?auto_169107 ?auto_169106 ) ( ON ?auto_169108 ?auto_169107 ) ( ON ?auto_169109 ?auto_169108 ) ( not ( = ?auto_169103 ?auto_169104 ) ) ( not ( = ?auto_169103 ?auto_169105 ) ) ( not ( = ?auto_169103 ?auto_169106 ) ) ( not ( = ?auto_169103 ?auto_169107 ) ) ( not ( = ?auto_169103 ?auto_169108 ) ) ( not ( = ?auto_169103 ?auto_169109 ) ) ( not ( = ?auto_169103 ?auto_169110 ) ) ( not ( = ?auto_169103 ?auto_169111 ) ) ( not ( = ?auto_169103 ?auto_169112 ) ) ( not ( = ?auto_169103 ?auto_169113 ) ) ( not ( = ?auto_169103 ?auto_169114 ) ) ( not ( = ?auto_169104 ?auto_169105 ) ) ( not ( = ?auto_169104 ?auto_169106 ) ) ( not ( = ?auto_169104 ?auto_169107 ) ) ( not ( = ?auto_169104 ?auto_169108 ) ) ( not ( = ?auto_169104 ?auto_169109 ) ) ( not ( = ?auto_169104 ?auto_169110 ) ) ( not ( = ?auto_169104 ?auto_169111 ) ) ( not ( = ?auto_169104 ?auto_169112 ) ) ( not ( = ?auto_169104 ?auto_169113 ) ) ( not ( = ?auto_169104 ?auto_169114 ) ) ( not ( = ?auto_169105 ?auto_169106 ) ) ( not ( = ?auto_169105 ?auto_169107 ) ) ( not ( = ?auto_169105 ?auto_169108 ) ) ( not ( = ?auto_169105 ?auto_169109 ) ) ( not ( = ?auto_169105 ?auto_169110 ) ) ( not ( = ?auto_169105 ?auto_169111 ) ) ( not ( = ?auto_169105 ?auto_169112 ) ) ( not ( = ?auto_169105 ?auto_169113 ) ) ( not ( = ?auto_169105 ?auto_169114 ) ) ( not ( = ?auto_169106 ?auto_169107 ) ) ( not ( = ?auto_169106 ?auto_169108 ) ) ( not ( = ?auto_169106 ?auto_169109 ) ) ( not ( = ?auto_169106 ?auto_169110 ) ) ( not ( = ?auto_169106 ?auto_169111 ) ) ( not ( = ?auto_169106 ?auto_169112 ) ) ( not ( = ?auto_169106 ?auto_169113 ) ) ( not ( = ?auto_169106 ?auto_169114 ) ) ( not ( = ?auto_169107 ?auto_169108 ) ) ( not ( = ?auto_169107 ?auto_169109 ) ) ( not ( = ?auto_169107 ?auto_169110 ) ) ( not ( = ?auto_169107 ?auto_169111 ) ) ( not ( = ?auto_169107 ?auto_169112 ) ) ( not ( = ?auto_169107 ?auto_169113 ) ) ( not ( = ?auto_169107 ?auto_169114 ) ) ( not ( = ?auto_169108 ?auto_169109 ) ) ( not ( = ?auto_169108 ?auto_169110 ) ) ( not ( = ?auto_169108 ?auto_169111 ) ) ( not ( = ?auto_169108 ?auto_169112 ) ) ( not ( = ?auto_169108 ?auto_169113 ) ) ( not ( = ?auto_169108 ?auto_169114 ) ) ( not ( = ?auto_169109 ?auto_169110 ) ) ( not ( = ?auto_169109 ?auto_169111 ) ) ( not ( = ?auto_169109 ?auto_169112 ) ) ( not ( = ?auto_169109 ?auto_169113 ) ) ( not ( = ?auto_169109 ?auto_169114 ) ) ( not ( = ?auto_169110 ?auto_169111 ) ) ( not ( = ?auto_169110 ?auto_169112 ) ) ( not ( = ?auto_169110 ?auto_169113 ) ) ( not ( = ?auto_169110 ?auto_169114 ) ) ( not ( = ?auto_169111 ?auto_169112 ) ) ( not ( = ?auto_169111 ?auto_169113 ) ) ( not ( = ?auto_169111 ?auto_169114 ) ) ( not ( = ?auto_169112 ?auto_169113 ) ) ( not ( = ?auto_169112 ?auto_169114 ) ) ( not ( = ?auto_169113 ?auto_169114 ) ) ( ON ?auto_169113 ?auto_169114 ) ( ON ?auto_169112 ?auto_169113 ) ( ON ?auto_169111 ?auto_169112 ) ( CLEAR ?auto_169109 ) ( ON ?auto_169110 ?auto_169111 ) ( CLEAR ?auto_169110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_169103 ?auto_169104 ?auto_169105 ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 )
      ( MAKE-12PILE ?auto_169103 ?auto_169104 ?auto_169105 ?auto_169106 ?auto_169107 ?auto_169108 ?auto_169109 ?auto_169110 ?auto_169111 ?auto_169112 ?auto_169113 ?auto_169114 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169127 - BLOCK
      ?auto_169128 - BLOCK
      ?auto_169129 - BLOCK
      ?auto_169130 - BLOCK
      ?auto_169131 - BLOCK
      ?auto_169132 - BLOCK
      ?auto_169133 - BLOCK
      ?auto_169134 - BLOCK
      ?auto_169135 - BLOCK
      ?auto_169136 - BLOCK
      ?auto_169137 - BLOCK
      ?auto_169138 - BLOCK
    )
    :vars
    (
      ?auto_169139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169138 ?auto_169139 ) ( ON-TABLE ?auto_169127 ) ( ON ?auto_169128 ?auto_169127 ) ( ON ?auto_169129 ?auto_169128 ) ( ON ?auto_169130 ?auto_169129 ) ( ON ?auto_169131 ?auto_169130 ) ( ON ?auto_169132 ?auto_169131 ) ( not ( = ?auto_169127 ?auto_169128 ) ) ( not ( = ?auto_169127 ?auto_169129 ) ) ( not ( = ?auto_169127 ?auto_169130 ) ) ( not ( = ?auto_169127 ?auto_169131 ) ) ( not ( = ?auto_169127 ?auto_169132 ) ) ( not ( = ?auto_169127 ?auto_169133 ) ) ( not ( = ?auto_169127 ?auto_169134 ) ) ( not ( = ?auto_169127 ?auto_169135 ) ) ( not ( = ?auto_169127 ?auto_169136 ) ) ( not ( = ?auto_169127 ?auto_169137 ) ) ( not ( = ?auto_169127 ?auto_169138 ) ) ( not ( = ?auto_169127 ?auto_169139 ) ) ( not ( = ?auto_169128 ?auto_169129 ) ) ( not ( = ?auto_169128 ?auto_169130 ) ) ( not ( = ?auto_169128 ?auto_169131 ) ) ( not ( = ?auto_169128 ?auto_169132 ) ) ( not ( = ?auto_169128 ?auto_169133 ) ) ( not ( = ?auto_169128 ?auto_169134 ) ) ( not ( = ?auto_169128 ?auto_169135 ) ) ( not ( = ?auto_169128 ?auto_169136 ) ) ( not ( = ?auto_169128 ?auto_169137 ) ) ( not ( = ?auto_169128 ?auto_169138 ) ) ( not ( = ?auto_169128 ?auto_169139 ) ) ( not ( = ?auto_169129 ?auto_169130 ) ) ( not ( = ?auto_169129 ?auto_169131 ) ) ( not ( = ?auto_169129 ?auto_169132 ) ) ( not ( = ?auto_169129 ?auto_169133 ) ) ( not ( = ?auto_169129 ?auto_169134 ) ) ( not ( = ?auto_169129 ?auto_169135 ) ) ( not ( = ?auto_169129 ?auto_169136 ) ) ( not ( = ?auto_169129 ?auto_169137 ) ) ( not ( = ?auto_169129 ?auto_169138 ) ) ( not ( = ?auto_169129 ?auto_169139 ) ) ( not ( = ?auto_169130 ?auto_169131 ) ) ( not ( = ?auto_169130 ?auto_169132 ) ) ( not ( = ?auto_169130 ?auto_169133 ) ) ( not ( = ?auto_169130 ?auto_169134 ) ) ( not ( = ?auto_169130 ?auto_169135 ) ) ( not ( = ?auto_169130 ?auto_169136 ) ) ( not ( = ?auto_169130 ?auto_169137 ) ) ( not ( = ?auto_169130 ?auto_169138 ) ) ( not ( = ?auto_169130 ?auto_169139 ) ) ( not ( = ?auto_169131 ?auto_169132 ) ) ( not ( = ?auto_169131 ?auto_169133 ) ) ( not ( = ?auto_169131 ?auto_169134 ) ) ( not ( = ?auto_169131 ?auto_169135 ) ) ( not ( = ?auto_169131 ?auto_169136 ) ) ( not ( = ?auto_169131 ?auto_169137 ) ) ( not ( = ?auto_169131 ?auto_169138 ) ) ( not ( = ?auto_169131 ?auto_169139 ) ) ( not ( = ?auto_169132 ?auto_169133 ) ) ( not ( = ?auto_169132 ?auto_169134 ) ) ( not ( = ?auto_169132 ?auto_169135 ) ) ( not ( = ?auto_169132 ?auto_169136 ) ) ( not ( = ?auto_169132 ?auto_169137 ) ) ( not ( = ?auto_169132 ?auto_169138 ) ) ( not ( = ?auto_169132 ?auto_169139 ) ) ( not ( = ?auto_169133 ?auto_169134 ) ) ( not ( = ?auto_169133 ?auto_169135 ) ) ( not ( = ?auto_169133 ?auto_169136 ) ) ( not ( = ?auto_169133 ?auto_169137 ) ) ( not ( = ?auto_169133 ?auto_169138 ) ) ( not ( = ?auto_169133 ?auto_169139 ) ) ( not ( = ?auto_169134 ?auto_169135 ) ) ( not ( = ?auto_169134 ?auto_169136 ) ) ( not ( = ?auto_169134 ?auto_169137 ) ) ( not ( = ?auto_169134 ?auto_169138 ) ) ( not ( = ?auto_169134 ?auto_169139 ) ) ( not ( = ?auto_169135 ?auto_169136 ) ) ( not ( = ?auto_169135 ?auto_169137 ) ) ( not ( = ?auto_169135 ?auto_169138 ) ) ( not ( = ?auto_169135 ?auto_169139 ) ) ( not ( = ?auto_169136 ?auto_169137 ) ) ( not ( = ?auto_169136 ?auto_169138 ) ) ( not ( = ?auto_169136 ?auto_169139 ) ) ( not ( = ?auto_169137 ?auto_169138 ) ) ( not ( = ?auto_169137 ?auto_169139 ) ) ( not ( = ?auto_169138 ?auto_169139 ) ) ( ON ?auto_169137 ?auto_169138 ) ( ON ?auto_169136 ?auto_169137 ) ( ON ?auto_169135 ?auto_169136 ) ( ON ?auto_169134 ?auto_169135 ) ( CLEAR ?auto_169132 ) ( ON ?auto_169133 ?auto_169134 ) ( CLEAR ?auto_169133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169127 ?auto_169128 ?auto_169129 ?auto_169130 ?auto_169131 ?auto_169132 ?auto_169133 )
      ( MAKE-12PILE ?auto_169127 ?auto_169128 ?auto_169129 ?auto_169130 ?auto_169131 ?auto_169132 ?auto_169133 ?auto_169134 ?auto_169135 ?auto_169136 ?auto_169137 ?auto_169138 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169152 - BLOCK
      ?auto_169153 - BLOCK
      ?auto_169154 - BLOCK
      ?auto_169155 - BLOCK
      ?auto_169156 - BLOCK
      ?auto_169157 - BLOCK
      ?auto_169158 - BLOCK
      ?auto_169159 - BLOCK
      ?auto_169160 - BLOCK
      ?auto_169161 - BLOCK
      ?auto_169162 - BLOCK
      ?auto_169163 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169163 ) ( ON-TABLE ?auto_169152 ) ( ON ?auto_169153 ?auto_169152 ) ( ON ?auto_169154 ?auto_169153 ) ( ON ?auto_169155 ?auto_169154 ) ( ON ?auto_169156 ?auto_169155 ) ( ON ?auto_169157 ?auto_169156 ) ( not ( = ?auto_169152 ?auto_169153 ) ) ( not ( = ?auto_169152 ?auto_169154 ) ) ( not ( = ?auto_169152 ?auto_169155 ) ) ( not ( = ?auto_169152 ?auto_169156 ) ) ( not ( = ?auto_169152 ?auto_169157 ) ) ( not ( = ?auto_169152 ?auto_169158 ) ) ( not ( = ?auto_169152 ?auto_169159 ) ) ( not ( = ?auto_169152 ?auto_169160 ) ) ( not ( = ?auto_169152 ?auto_169161 ) ) ( not ( = ?auto_169152 ?auto_169162 ) ) ( not ( = ?auto_169152 ?auto_169163 ) ) ( not ( = ?auto_169153 ?auto_169154 ) ) ( not ( = ?auto_169153 ?auto_169155 ) ) ( not ( = ?auto_169153 ?auto_169156 ) ) ( not ( = ?auto_169153 ?auto_169157 ) ) ( not ( = ?auto_169153 ?auto_169158 ) ) ( not ( = ?auto_169153 ?auto_169159 ) ) ( not ( = ?auto_169153 ?auto_169160 ) ) ( not ( = ?auto_169153 ?auto_169161 ) ) ( not ( = ?auto_169153 ?auto_169162 ) ) ( not ( = ?auto_169153 ?auto_169163 ) ) ( not ( = ?auto_169154 ?auto_169155 ) ) ( not ( = ?auto_169154 ?auto_169156 ) ) ( not ( = ?auto_169154 ?auto_169157 ) ) ( not ( = ?auto_169154 ?auto_169158 ) ) ( not ( = ?auto_169154 ?auto_169159 ) ) ( not ( = ?auto_169154 ?auto_169160 ) ) ( not ( = ?auto_169154 ?auto_169161 ) ) ( not ( = ?auto_169154 ?auto_169162 ) ) ( not ( = ?auto_169154 ?auto_169163 ) ) ( not ( = ?auto_169155 ?auto_169156 ) ) ( not ( = ?auto_169155 ?auto_169157 ) ) ( not ( = ?auto_169155 ?auto_169158 ) ) ( not ( = ?auto_169155 ?auto_169159 ) ) ( not ( = ?auto_169155 ?auto_169160 ) ) ( not ( = ?auto_169155 ?auto_169161 ) ) ( not ( = ?auto_169155 ?auto_169162 ) ) ( not ( = ?auto_169155 ?auto_169163 ) ) ( not ( = ?auto_169156 ?auto_169157 ) ) ( not ( = ?auto_169156 ?auto_169158 ) ) ( not ( = ?auto_169156 ?auto_169159 ) ) ( not ( = ?auto_169156 ?auto_169160 ) ) ( not ( = ?auto_169156 ?auto_169161 ) ) ( not ( = ?auto_169156 ?auto_169162 ) ) ( not ( = ?auto_169156 ?auto_169163 ) ) ( not ( = ?auto_169157 ?auto_169158 ) ) ( not ( = ?auto_169157 ?auto_169159 ) ) ( not ( = ?auto_169157 ?auto_169160 ) ) ( not ( = ?auto_169157 ?auto_169161 ) ) ( not ( = ?auto_169157 ?auto_169162 ) ) ( not ( = ?auto_169157 ?auto_169163 ) ) ( not ( = ?auto_169158 ?auto_169159 ) ) ( not ( = ?auto_169158 ?auto_169160 ) ) ( not ( = ?auto_169158 ?auto_169161 ) ) ( not ( = ?auto_169158 ?auto_169162 ) ) ( not ( = ?auto_169158 ?auto_169163 ) ) ( not ( = ?auto_169159 ?auto_169160 ) ) ( not ( = ?auto_169159 ?auto_169161 ) ) ( not ( = ?auto_169159 ?auto_169162 ) ) ( not ( = ?auto_169159 ?auto_169163 ) ) ( not ( = ?auto_169160 ?auto_169161 ) ) ( not ( = ?auto_169160 ?auto_169162 ) ) ( not ( = ?auto_169160 ?auto_169163 ) ) ( not ( = ?auto_169161 ?auto_169162 ) ) ( not ( = ?auto_169161 ?auto_169163 ) ) ( not ( = ?auto_169162 ?auto_169163 ) ) ( ON ?auto_169162 ?auto_169163 ) ( ON ?auto_169161 ?auto_169162 ) ( ON ?auto_169160 ?auto_169161 ) ( ON ?auto_169159 ?auto_169160 ) ( CLEAR ?auto_169157 ) ( ON ?auto_169158 ?auto_169159 ) ( CLEAR ?auto_169158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_169152 ?auto_169153 ?auto_169154 ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 )
      ( MAKE-12PILE ?auto_169152 ?auto_169153 ?auto_169154 ?auto_169155 ?auto_169156 ?auto_169157 ?auto_169158 ?auto_169159 ?auto_169160 ?auto_169161 ?auto_169162 ?auto_169163 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169176 - BLOCK
      ?auto_169177 - BLOCK
      ?auto_169178 - BLOCK
      ?auto_169179 - BLOCK
      ?auto_169180 - BLOCK
      ?auto_169181 - BLOCK
      ?auto_169182 - BLOCK
      ?auto_169183 - BLOCK
      ?auto_169184 - BLOCK
      ?auto_169185 - BLOCK
      ?auto_169186 - BLOCK
      ?auto_169187 - BLOCK
    )
    :vars
    (
      ?auto_169188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169187 ?auto_169188 ) ( ON-TABLE ?auto_169176 ) ( ON ?auto_169177 ?auto_169176 ) ( ON ?auto_169178 ?auto_169177 ) ( ON ?auto_169179 ?auto_169178 ) ( ON ?auto_169180 ?auto_169179 ) ( not ( = ?auto_169176 ?auto_169177 ) ) ( not ( = ?auto_169176 ?auto_169178 ) ) ( not ( = ?auto_169176 ?auto_169179 ) ) ( not ( = ?auto_169176 ?auto_169180 ) ) ( not ( = ?auto_169176 ?auto_169181 ) ) ( not ( = ?auto_169176 ?auto_169182 ) ) ( not ( = ?auto_169176 ?auto_169183 ) ) ( not ( = ?auto_169176 ?auto_169184 ) ) ( not ( = ?auto_169176 ?auto_169185 ) ) ( not ( = ?auto_169176 ?auto_169186 ) ) ( not ( = ?auto_169176 ?auto_169187 ) ) ( not ( = ?auto_169176 ?auto_169188 ) ) ( not ( = ?auto_169177 ?auto_169178 ) ) ( not ( = ?auto_169177 ?auto_169179 ) ) ( not ( = ?auto_169177 ?auto_169180 ) ) ( not ( = ?auto_169177 ?auto_169181 ) ) ( not ( = ?auto_169177 ?auto_169182 ) ) ( not ( = ?auto_169177 ?auto_169183 ) ) ( not ( = ?auto_169177 ?auto_169184 ) ) ( not ( = ?auto_169177 ?auto_169185 ) ) ( not ( = ?auto_169177 ?auto_169186 ) ) ( not ( = ?auto_169177 ?auto_169187 ) ) ( not ( = ?auto_169177 ?auto_169188 ) ) ( not ( = ?auto_169178 ?auto_169179 ) ) ( not ( = ?auto_169178 ?auto_169180 ) ) ( not ( = ?auto_169178 ?auto_169181 ) ) ( not ( = ?auto_169178 ?auto_169182 ) ) ( not ( = ?auto_169178 ?auto_169183 ) ) ( not ( = ?auto_169178 ?auto_169184 ) ) ( not ( = ?auto_169178 ?auto_169185 ) ) ( not ( = ?auto_169178 ?auto_169186 ) ) ( not ( = ?auto_169178 ?auto_169187 ) ) ( not ( = ?auto_169178 ?auto_169188 ) ) ( not ( = ?auto_169179 ?auto_169180 ) ) ( not ( = ?auto_169179 ?auto_169181 ) ) ( not ( = ?auto_169179 ?auto_169182 ) ) ( not ( = ?auto_169179 ?auto_169183 ) ) ( not ( = ?auto_169179 ?auto_169184 ) ) ( not ( = ?auto_169179 ?auto_169185 ) ) ( not ( = ?auto_169179 ?auto_169186 ) ) ( not ( = ?auto_169179 ?auto_169187 ) ) ( not ( = ?auto_169179 ?auto_169188 ) ) ( not ( = ?auto_169180 ?auto_169181 ) ) ( not ( = ?auto_169180 ?auto_169182 ) ) ( not ( = ?auto_169180 ?auto_169183 ) ) ( not ( = ?auto_169180 ?auto_169184 ) ) ( not ( = ?auto_169180 ?auto_169185 ) ) ( not ( = ?auto_169180 ?auto_169186 ) ) ( not ( = ?auto_169180 ?auto_169187 ) ) ( not ( = ?auto_169180 ?auto_169188 ) ) ( not ( = ?auto_169181 ?auto_169182 ) ) ( not ( = ?auto_169181 ?auto_169183 ) ) ( not ( = ?auto_169181 ?auto_169184 ) ) ( not ( = ?auto_169181 ?auto_169185 ) ) ( not ( = ?auto_169181 ?auto_169186 ) ) ( not ( = ?auto_169181 ?auto_169187 ) ) ( not ( = ?auto_169181 ?auto_169188 ) ) ( not ( = ?auto_169182 ?auto_169183 ) ) ( not ( = ?auto_169182 ?auto_169184 ) ) ( not ( = ?auto_169182 ?auto_169185 ) ) ( not ( = ?auto_169182 ?auto_169186 ) ) ( not ( = ?auto_169182 ?auto_169187 ) ) ( not ( = ?auto_169182 ?auto_169188 ) ) ( not ( = ?auto_169183 ?auto_169184 ) ) ( not ( = ?auto_169183 ?auto_169185 ) ) ( not ( = ?auto_169183 ?auto_169186 ) ) ( not ( = ?auto_169183 ?auto_169187 ) ) ( not ( = ?auto_169183 ?auto_169188 ) ) ( not ( = ?auto_169184 ?auto_169185 ) ) ( not ( = ?auto_169184 ?auto_169186 ) ) ( not ( = ?auto_169184 ?auto_169187 ) ) ( not ( = ?auto_169184 ?auto_169188 ) ) ( not ( = ?auto_169185 ?auto_169186 ) ) ( not ( = ?auto_169185 ?auto_169187 ) ) ( not ( = ?auto_169185 ?auto_169188 ) ) ( not ( = ?auto_169186 ?auto_169187 ) ) ( not ( = ?auto_169186 ?auto_169188 ) ) ( not ( = ?auto_169187 ?auto_169188 ) ) ( ON ?auto_169186 ?auto_169187 ) ( ON ?auto_169185 ?auto_169186 ) ( ON ?auto_169184 ?auto_169185 ) ( ON ?auto_169183 ?auto_169184 ) ( ON ?auto_169182 ?auto_169183 ) ( CLEAR ?auto_169180 ) ( ON ?auto_169181 ?auto_169182 ) ( CLEAR ?auto_169181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169176 ?auto_169177 ?auto_169178 ?auto_169179 ?auto_169180 ?auto_169181 )
      ( MAKE-12PILE ?auto_169176 ?auto_169177 ?auto_169178 ?auto_169179 ?auto_169180 ?auto_169181 ?auto_169182 ?auto_169183 ?auto_169184 ?auto_169185 ?auto_169186 ?auto_169187 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169201 - BLOCK
      ?auto_169202 - BLOCK
      ?auto_169203 - BLOCK
      ?auto_169204 - BLOCK
      ?auto_169205 - BLOCK
      ?auto_169206 - BLOCK
      ?auto_169207 - BLOCK
      ?auto_169208 - BLOCK
      ?auto_169209 - BLOCK
      ?auto_169210 - BLOCK
      ?auto_169211 - BLOCK
      ?auto_169212 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169212 ) ( ON-TABLE ?auto_169201 ) ( ON ?auto_169202 ?auto_169201 ) ( ON ?auto_169203 ?auto_169202 ) ( ON ?auto_169204 ?auto_169203 ) ( ON ?auto_169205 ?auto_169204 ) ( not ( = ?auto_169201 ?auto_169202 ) ) ( not ( = ?auto_169201 ?auto_169203 ) ) ( not ( = ?auto_169201 ?auto_169204 ) ) ( not ( = ?auto_169201 ?auto_169205 ) ) ( not ( = ?auto_169201 ?auto_169206 ) ) ( not ( = ?auto_169201 ?auto_169207 ) ) ( not ( = ?auto_169201 ?auto_169208 ) ) ( not ( = ?auto_169201 ?auto_169209 ) ) ( not ( = ?auto_169201 ?auto_169210 ) ) ( not ( = ?auto_169201 ?auto_169211 ) ) ( not ( = ?auto_169201 ?auto_169212 ) ) ( not ( = ?auto_169202 ?auto_169203 ) ) ( not ( = ?auto_169202 ?auto_169204 ) ) ( not ( = ?auto_169202 ?auto_169205 ) ) ( not ( = ?auto_169202 ?auto_169206 ) ) ( not ( = ?auto_169202 ?auto_169207 ) ) ( not ( = ?auto_169202 ?auto_169208 ) ) ( not ( = ?auto_169202 ?auto_169209 ) ) ( not ( = ?auto_169202 ?auto_169210 ) ) ( not ( = ?auto_169202 ?auto_169211 ) ) ( not ( = ?auto_169202 ?auto_169212 ) ) ( not ( = ?auto_169203 ?auto_169204 ) ) ( not ( = ?auto_169203 ?auto_169205 ) ) ( not ( = ?auto_169203 ?auto_169206 ) ) ( not ( = ?auto_169203 ?auto_169207 ) ) ( not ( = ?auto_169203 ?auto_169208 ) ) ( not ( = ?auto_169203 ?auto_169209 ) ) ( not ( = ?auto_169203 ?auto_169210 ) ) ( not ( = ?auto_169203 ?auto_169211 ) ) ( not ( = ?auto_169203 ?auto_169212 ) ) ( not ( = ?auto_169204 ?auto_169205 ) ) ( not ( = ?auto_169204 ?auto_169206 ) ) ( not ( = ?auto_169204 ?auto_169207 ) ) ( not ( = ?auto_169204 ?auto_169208 ) ) ( not ( = ?auto_169204 ?auto_169209 ) ) ( not ( = ?auto_169204 ?auto_169210 ) ) ( not ( = ?auto_169204 ?auto_169211 ) ) ( not ( = ?auto_169204 ?auto_169212 ) ) ( not ( = ?auto_169205 ?auto_169206 ) ) ( not ( = ?auto_169205 ?auto_169207 ) ) ( not ( = ?auto_169205 ?auto_169208 ) ) ( not ( = ?auto_169205 ?auto_169209 ) ) ( not ( = ?auto_169205 ?auto_169210 ) ) ( not ( = ?auto_169205 ?auto_169211 ) ) ( not ( = ?auto_169205 ?auto_169212 ) ) ( not ( = ?auto_169206 ?auto_169207 ) ) ( not ( = ?auto_169206 ?auto_169208 ) ) ( not ( = ?auto_169206 ?auto_169209 ) ) ( not ( = ?auto_169206 ?auto_169210 ) ) ( not ( = ?auto_169206 ?auto_169211 ) ) ( not ( = ?auto_169206 ?auto_169212 ) ) ( not ( = ?auto_169207 ?auto_169208 ) ) ( not ( = ?auto_169207 ?auto_169209 ) ) ( not ( = ?auto_169207 ?auto_169210 ) ) ( not ( = ?auto_169207 ?auto_169211 ) ) ( not ( = ?auto_169207 ?auto_169212 ) ) ( not ( = ?auto_169208 ?auto_169209 ) ) ( not ( = ?auto_169208 ?auto_169210 ) ) ( not ( = ?auto_169208 ?auto_169211 ) ) ( not ( = ?auto_169208 ?auto_169212 ) ) ( not ( = ?auto_169209 ?auto_169210 ) ) ( not ( = ?auto_169209 ?auto_169211 ) ) ( not ( = ?auto_169209 ?auto_169212 ) ) ( not ( = ?auto_169210 ?auto_169211 ) ) ( not ( = ?auto_169210 ?auto_169212 ) ) ( not ( = ?auto_169211 ?auto_169212 ) ) ( ON ?auto_169211 ?auto_169212 ) ( ON ?auto_169210 ?auto_169211 ) ( ON ?auto_169209 ?auto_169210 ) ( ON ?auto_169208 ?auto_169209 ) ( ON ?auto_169207 ?auto_169208 ) ( CLEAR ?auto_169205 ) ( ON ?auto_169206 ?auto_169207 ) ( CLEAR ?auto_169206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_169201 ?auto_169202 ?auto_169203 ?auto_169204 ?auto_169205 ?auto_169206 )
      ( MAKE-12PILE ?auto_169201 ?auto_169202 ?auto_169203 ?auto_169204 ?auto_169205 ?auto_169206 ?auto_169207 ?auto_169208 ?auto_169209 ?auto_169210 ?auto_169211 ?auto_169212 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169225 - BLOCK
      ?auto_169226 - BLOCK
      ?auto_169227 - BLOCK
      ?auto_169228 - BLOCK
      ?auto_169229 - BLOCK
      ?auto_169230 - BLOCK
      ?auto_169231 - BLOCK
      ?auto_169232 - BLOCK
      ?auto_169233 - BLOCK
      ?auto_169234 - BLOCK
      ?auto_169235 - BLOCK
      ?auto_169236 - BLOCK
    )
    :vars
    (
      ?auto_169237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169236 ?auto_169237 ) ( ON-TABLE ?auto_169225 ) ( ON ?auto_169226 ?auto_169225 ) ( ON ?auto_169227 ?auto_169226 ) ( ON ?auto_169228 ?auto_169227 ) ( not ( = ?auto_169225 ?auto_169226 ) ) ( not ( = ?auto_169225 ?auto_169227 ) ) ( not ( = ?auto_169225 ?auto_169228 ) ) ( not ( = ?auto_169225 ?auto_169229 ) ) ( not ( = ?auto_169225 ?auto_169230 ) ) ( not ( = ?auto_169225 ?auto_169231 ) ) ( not ( = ?auto_169225 ?auto_169232 ) ) ( not ( = ?auto_169225 ?auto_169233 ) ) ( not ( = ?auto_169225 ?auto_169234 ) ) ( not ( = ?auto_169225 ?auto_169235 ) ) ( not ( = ?auto_169225 ?auto_169236 ) ) ( not ( = ?auto_169225 ?auto_169237 ) ) ( not ( = ?auto_169226 ?auto_169227 ) ) ( not ( = ?auto_169226 ?auto_169228 ) ) ( not ( = ?auto_169226 ?auto_169229 ) ) ( not ( = ?auto_169226 ?auto_169230 ) ) ( not ( = ?auto_169226 ?auto_169231 ) ) ( not ( = ?auto_169226 ?auto_169232 ) ) ( not ( = ?auto_169226 ?auto_169233 ) ) ( not ( = ?auto_169226 ?auto_169234 ) ) ( not ( = ?auto_169226 ?auto_169235 ) ) ( not ( = ?auto_169226 ?auto_169236 ) ) ( not ( = ?auto_169226 ?auto_169237 ) ) ( not ( = ?auto_169227 ?auto_169228 ) ) ( not ( = ?auto_169227 ?auto_169229 ) ) ( not ( = ?auto_169227 ?auto_169230 ) ) ( not ( = ?auto_169227 ?auto_169231 ) ) ( not ( = ?auto_169227 ?auto_169232 ) ) ( not ( = ?auto_169227 ?auto_169233 ) ) ( not ( = ?auto_169227 ?auto_169234 ) ) ( not ( = ?auto_169227 ?auto_169235 ) ) ( not ( = ?auto_169227 ?auto_169236 ) ) ( not ( = ?auto_169227 ?auto_169237 ) ) ( not ( = ?auto_169228 ?auto_169229 ) ) ( not ( = ?auto_169228 ?auto_169230 ) ) ( not ( = ?auto_169228 ?auto_169231 ) ) ( not ( = ?auto_169228 ?auto_169232 ) ) ( not ( = ?auto_169228 ?auto_169233 ) ) ( not ( = ?auto_169228 ?auto_169234 ) ) ( not ( = ?auto_169228 ?auto_169235 ) ) ( not ( = ?auto_169228 ?auto_169236 ) ) ( not ( = ?auto_169228 ?auto_169237 ) ) ( not ( = ?auto_169229 ?auto_169230 ) ) ( not ( = ?auto_169229 ?auto_169231 ) ) ( not ( = ?auto_169229 ?auto_169232 ) ) ( not ( = ?auto_169229 ?auto_169233 ) ) ( not ( = ?auto_169229 ?auto_169234 ) ) ( not ( = ?auto_169229 ?auto_169235 ) ) ( not ( = ?auto_169229 ?auto_169236 ) ) ( not ( = ?auto_169229 ?auto_169237 ) ) ( not ( = ?auto_169230 ?auto_169231 ) ) ( not ( = ?auto_169230 ?auto_169232 ) ) ( not ( = ?auto_169230 ?auto_169233 ) ) ( not ( = ?auto_169230 ?auto_169234 ) ) ( not ( = ?auto_169230 ?auto_169235 ) ) ( not ( = ?auto_169230 ?auto_169236 ) ) ( not ( = ?auto_169230 ?auto_169237 ) ) ( not ( = ?auto_169231 ?auto_169232 ) ) ( not ( = ?auto_169231 ?auto_169233 ) ) ( not ( = ?auto_169231 ?auto_169234 ) ) ( not ( = ?auto_169231 ?auto_169235 ) ) ( not ( = ?auto_169231 ?auto_169236 ) ) ( not ( = ?auto_169231 ?auto_169237 ) ) ( not ( = ?auto_169232 ?auto_169233 ) ) ( not ( = ?auto_169232 ?auto_169234 ) ) ( not ( = ?auto_169232 ?auto_169235 ) ) ( not ( = ?auto_169232 ?auto_169236 ) ) ( not ( = ?auto_169232 ?auto_169237 ) ) ( not ( = ?auto_169233 ?auto_169234 ) ) ( not ( = ?auto_169233 ?auto_169235 ) ) ( not ( = ?auto_169233 ?auto_169236 ) ) ( not ( = ?auto_169233 ?auto_169237 ) ) ( not ( = ?auto_169234 ?auto_169235 ) ) ( not ( = ?auto_169234 ?auto_169236 ) ) ( not ( = ?auto_169234 ?auto_169237 ) ) ( not ( = ?auto_169235 ?auto_169236 ) ) ( not ( = ?auto_169235 ?auto_169237 ) ) ( not ( = ?auto_169236 ?auto_169237 ) ) ( ON ?auto_169235 ?auto_169236 ) ( ON ?auto_169234 ?auto_169235 ) ( ON ?auto_169233 ?auto_169234 ) ( ON ?auto_169232 ?auto_169233 ) ( ON ?auto_169231 ?auto_169232 ) ( ON ?auto_169230 ?auto_169231 ) ( CLEAR ?auto_169228 ) ( ON ?auto_169229 ?auto_169230 ) ( CLEAR ?auto_169229 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169225 ?auto_169226 ?auto_169227 ?auto_169228 ?auto_169229 )
      ( MAKE-12PILE ?auto_169225 ?auto_169226 ?auto_169227 ?auto_169228 ?auto_169229 ?auto_169230 ?auto_169231 ?auto_169232 ?auto_169233 ?auto_169234 ?auto_169235 ?auto_169236 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169250 - BLOCK
      ?auto_169251 - BLOCK
      ?auto_169252 - BLOCK
      ?auto_169253 - BLOCK
      ?auto_169254 - BLOCK
      ?auto_169255 - BLOCK
      ?auto_169256 - BLOCK
      ?auto_169257 - BLOCK
      ?auto_169258 - BLOCK
      ?auto_169259 - BLOCK
      ?auto_169260 - BLOCK
      ?auto_169261 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169261 ) ( ON-TABLE ?auto_169250 ) ( ON ?auto_169251 ?auto_169250 ) ( ON ?auto_169252 ?auto_169251 ) ( ON ?auto_169253 ?auto_169252 ) ( not ( = ?auto_169250 ?auto_169251 ) ) ( not ( = ?auto_169250 ?auto_169252 ) ) ( not ( = ?auto_169250 ?auto_169253 ) ) ( not ( = ?auto_169250 ?auto_169254 ) ) ( not ( = ?auto_169250 ?auto_169255 ) ) ( not ( = ?auto_169250 ?auto_169256 ) ) ( not ( = ?auto_169250 ?auto_169257 ) ) ( not ( = ?auto_169250 ?auto_169258 ) ) ( not ( = ?auto_169250 ?auto_169259 ) ) ( not ( = ?auto_169250 ?auto_169260 ) ) ( not ( = ?auto_169250 ?auto_169261 ) ) ( not ( = ?auto_169251 ?auto_169252 ) ) ( not ( = ?auto_169251 ?auto_169253 ) ) ( not ( = ?auto_169251 ?auto_169254 ) ) ( not ( = ?auto_169251 ?auto_169255 ) ) ( not ( = ?auto_169251 ?auto_169256 ) ) ( not ( = ?auto_169251 ?auto_169257 ) ) ( not ( = ?auto_169251 ?auto_169258 ) ) ( not ( = ?auto_169251 ?auto_169259 ) ) ( not ( = ?auto_169251 ?auto_169260 ) ) ( not ( = ?auto_169251 ?auto_169261 ) ) ( not ( = ?auto_169252 ?auto_169253 ) ) ( not ( = ?auto_169252 ?auto_169254 ) ) ( not ( = ?auto_169252 ?auto_169255 ) ) ( not ( = ?auto_169252 ?auto_169256 ) ) ( not ( = ?auto_169252 ?auto_169257 ) ) ( not ( = ?auto_169252 ?auto_169258 ) ) ( not ( = ?auto_169252 ?auto_169259 ) ) ( not ( = ?auto_169252 ?auto_169260 ) ) ( not ( = ?auto_169252 ?auto_169261 ) ) ( not ( = ?auto_169253 ?auto_169254 ) ) ( not ( = ?auto_169253 ?auto_169255 ) ) ( not ( = ?auto_169253 ?auto_169256 ) ) ( not ( = ?auto_169253 ?auto_169257 ) ) ( not ( = ?auto_169253 ?auto_169258 ) ) ( not ( = ?auto_169253 ?auto_169259 ) ) ( not ( = ?auto_169253 ?auto_169260 ) ) ( not ( = ?auto_169253 ?auto_169261 ) ) ( not ( = ?auto_169254 ?auto_169255 ) ) ( not ( = ?auto_169254 ?auto_169256 ) ) ( not ( = ?auto_169254 ?auto_169257 ) ) ( not ( = ?auto_169254 ?auto_169258 ) ) ( not ( = ?auto_169254 ?auto_169259 ) ) ( not ( = ?auto_169254 ?auto_169260 ) ) ( not ( = ?auto_169254 ?auto_169261 ) ) ( not ( = ?auto_169255 ?auto_169256 ) ) ( not ( = ?auto_169255 ?auto_169257 ) ) ( not ( = ?auto_169255 ?auto_169258 ) ) ( not ( = ?auto_169255 ?auto_169259 ) ) ( not ( = ?auto_169255 ?auto_169260 ) ) ( not ( = ?auto_169255 ?auto_169261 ) ) ( not ( = ?auto_169256 ?auto_169257 ) ) ( not ( = ?auto_169256 ?auto_169258 ) ) ( not ( = ?auto_169256 ?auto_169259 ) ) ( not ( = ?auto_169256 ?auto_169260 ) ) ( not ( = ?auto_169256 ?auto_169261 ) ) ( not ( = ?auto_169257 ?auto_169258 ) ) ( not ( = ?auto_169257 ?auto_169259 ) ) ( not ( = ?auto_169257 ?auto_169260 ) ) ( not ( = ?auto_169257 ?auto_169261 ) ) ( not ( = ?auto_169258 ?auto_169259 ) ) ( not ( = ?auto_169258 ?auto_169260 ) ) ( not ( = ?auto_169258 ?auto_169261 ) ) ( not ( = ?auto_169259 ?auto_169260 ) ) ( not ( = ?auto_169259 ?auto_169261 ) ) ( not ( = ?auto_169260 ?auto_169261 ) ) ( ON ?auto_169260 ?auto_169261 ) ( ON ?auto_169259 ?auto_169260 ) ( ON ?auto_169258 ?auto_169259 ) ( ON ?auto_169257 ?auto_169258 ) ( ON ?auto_169256 ?auto_169257 ) ( ON ?auto_169255 ?auto_169256 ) ( CLEAR ?auto_169253 ) ( ON ?auto_169254 ?auto_169255 ) ( CLEAR ?auto_169254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_169250 ?auto_169251 ?auto_169252 ?auto_169253 ?auto_169254 )
      ( MAKE-12PILE ?auto_169250 ?auto_169251 ?auto_169252 ?auto_169253 ?auto_169254 ?auto_169255 ?auto_169256 ?auto_169257 ?auto_169258 ?auto_169259 ?auto_169260 ?auto_169261 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169274 - BLOCK
      ?auto_169275 - BLOCK
      ?auto_169276 - BLOCK
      ?auto_169277 - BLOCK
      ?auto_169278 - BLOCK
      ?auto_169279 - BLOCK
      ?auto_169280 - BLOCK
      ?auto_169281 - BLOCK
      ?auto_169282 - BLOCK
      ?auto_169283 - BLOCK
      ?auto_169284 - BLOCK
      ?auto_169285 - BLOCK
    )
    :vars
    (
      ?auto_169286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169285 ?auto_169286 ) ( ON-TABLE ?auto_169274 ) ( ON ?auto_169275 ?auto_169274 ) ( ON ?auto_169276 ?auto_169275 ) ( not ( = ?auto_169274 ?auto_169275 ) ) ( not ( = ?auto_169274 ?auto_169276 ) ) ( not ( = ?auto_169274 ?auto_169277 ) ) ( not ( = ?auto_169274 ?auto_169278 ) ) ( not ( = ?auto_169274 ?auto_169279 ) ) ( not ( = ?auto_169274 ?auto_169280 ) ) ( not ( = ?auto_169274 ?auto_169281 ) ) ( not ( = ?auto_169274 ?auto_169282 ) ) ( not ( = ?auto_169274 ?auto_169283 ) ) ( not ( = ?auto_169274 ?auto_169284 ) ) ( not ( = ?auto_169274 ?auto_169285 ) ) ( not ( = ?auto_169274 ?auto_169286 ) ) ( not ( = ?auto_169275 ?auto_169276 ) ) ( not ( = ?auto_169275 ?auto_169277 ) ) ( not ( = ?auto_169275 ?auto_169278 ) ) ( not ( = ?auto_169275 ?auto_169279 ) ) ( not ( = ?auto_169275 ?auto_169280 ) ) ( not ( = ?auto_169275 ?auto_169281 ) ) ( not ( = ?auto_169275 ?auto_169282 ) ) ( not ( = ?auto_169275 ?auto_169283 ) ) ( not ( = ?auto_169275 ?auto_169284 ) ) ( not ( = ?auto_169275 ?auto_169285 ) ) ( not ( = ?auto_169275 ?auto_169286 ) ) ( not ( = ?auto_169276 ?auto_169277 ) ) ( not ( = ?auto_169276 ?auto_169278 ) ) ( not ( = ?auto_169276 ?auto_169279 ) ) ( not ( = ?auto_169276 ?auto_169280 ) ) ( not ( = ?auto_169276 ?auto_169281 ) ) ( not ( = ?auto_169276 ?auto_169282 ) ) ( not ( = ?auto_169276 ?auto_169283 ) ) ( not ( = ?auto_169276 ?auto_169284 ) ) ( not ( = ?auto_169276 ?auto_169285 ) ) ( not ( = ?auto_169276 ?auto_169286 ) ) ( not ( = ?auto_169277 ?auto_169278 ) ) ( not ( = ?auto_169277 ?auto_169279 ) ) ( not ( = ?auto_169277 ?auto_169280 ) ) ( not ( = ?auto_169277 ?auto_169281 ) ) ( not ( = ?auto_169277 ?auto_169282 ) ) ( not ( = ?auto_169277 ?auto_169283 ) ) ( not ( = ?auto_169277 ?auto_169284 ) ) ( not ( = ?auto_169277 ?auto_169285 ) ) ( not ( = ?auto_169277 ?auto_169286 ) ) ( not ( = ?auto_169278 ?auto_169279 ) ) ( not ( = ?auto_169278 ?auto_169280 ) ) ( not ( = ?auto_169278 ?auto_169281 ) ) ( not ( = ?auto_169278 ?auto_169282 ) ) ( not ( = ?auto_169278 ?auto_169283 ) ) ( not ( = ?auto_169278 ?auto_169284 ) ) ( not ( = ?auto_169278 ?auto_169285 ) ) ( not ( = ?auto_169278 ?auto_169286 ) ) ( not ( = ?auto_169279 ?auto_169280 ) ) ( not ( = ?auto_169279 ?auto_169281 ) ) ( not ( = ?auto_169279 ?auto_169282 ) ) ( not ( = ?auto_169279 ?auto_169283 ) ) ( not ( = ?auto_169279 ?auto_169284 ) ) ( not ( = ?auto_169279 ?auto_169285 ) ) ( not ( = ?auto_169279 ?auto_169286 ) ) ( not ( = ?auto_169280 ?auto_169281 ) ) ( not ( = ?auto_169280 ?auto_169282 ) ) ( not ( = ?auto_169280 ?auto_169283 ) ) ( not ( = ?auto_169280 ?auto_169284 ) ) ( not ( = ?auto_169280 ?auto_169285 ) ) ( not ( = ?auto_169280 ?auto_169286 ) ) ( not ( = ?auto_169281 ?auto_169282 ) ) ( not ( = ?auto_169281 ?auto_169283 ) ) ( not ( = ?auto_169281 ?auto_169284 ) ) ( not ( = ?auto_169281 ?auto_169285 ) ) ( not ( = ?auto_169281 ?auto_169286 ) ) ( not ( = ?auto_169282 ?auto_169283 ) ) ( not ( = ?auto_169282 ?auto_169284 ) ) ( not ( = ?auto_169282 ?auto_169285 ) ) ( not ( = ?auto_169282 ?auto_169286 ) ) ( not ( = ?auto_169283 ?auto_169284 ) ) ( not ( = ?auto_169283 ?auto_169285 ) ) ( not ( = ?auto_169283 ?auto_169286 ) ) ( not ( = ?auto_169284 ?auto_169285 ) ) ( not ( = ?auto_169284 ?auto_169286 ) ) ( not ( = ?auto_169285 ?auto_169286 ) ) ( ON ?auto_169284 ?auto_169285 ) ( ON ?auto_169283 ?auto_169284 ) ( ON ?auto_169282 ?auto_169283 ) ( ON ?auto_169281 ?auto_169282 ) ( ON ?auto_169280 ?auto_169281 ) ( ON ?auto_169279 ?auto_169280 ) ( ON ?auto_169278 ?auto_169279 ) ( CLEAR ?auto_169276 ) ( ON ?auto_169277 ?auto_169278 ) ( CLEAR ?auto_169277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169274 ?auto_169275 ?auto_169276 ?auto_169277 )
      ( MAKE-12PILE ?auto_169274 ?auto_169275 ?auto_169276 ?auto_169277 ?auto_169278 ?auto_169279 ?auto_169280 ?auto_169281 ?auto_169282 ?auto_169283 ?auto_169284 ?auto_169285 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169299 - BLOCK
      ?auto_169300 - BLOCK
      ?auto_169301 - BLOCK
      ?auto_169302 - BLOCK
      ?auto_169303 - BLOCK
      ?auto_169304 - BLOCK
      ?auto_169305 - BLOCK
      ?auto_169306 - BLOCK
      ?auto_169307 - BLOCK
      ?auto_169308 - BLOCK
      ?auto_169309 - BLOCK
      ?auto_169310 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169310 ) ( ON-TABLE ?auto_169299 ) ( ON ?auto_169300 ?auto_169299 ) ( ON ?auto_169301 ?auto_169300 ) ( not ( = ?auto_169299 ?auto_169300 ) ) ( not ( = ?auto_169299 ?auto_169301 ) ) ( not ( = ?auto_169299 ?auto_169302 ) ) ( not ( = ?auto_169299 ?auto_169303 ) ) ( not ( = ?auto_169299 ?auto_169304 ) ) ( not ( = ?auto_169299 ?auto_169305 ) ) ( not ( = ?auto_169299 ?auto_169306 ) ) ( not ( = ?auto_169299 ?auto_169307 ) ) ( not ( = ?auto_169299 ?auto_169308 ) ) ( not ( = ?auto_169299 ?auto_169309 ) ) ( not ( = ?auto_169299 ?auto_169310 ) ) ( not ( = ?auto_169300 ?auto_169301 ) ) ( not ( = ?auto_169300 ?auto_169302 ) ) ( not ( = ?auto_169300 ?auto_169303 ) ) ( not ( = ?auto_169300 ?auto_169304 ) ) ( not ( = ?auto_169300 ?auto_169305 ) ) ( not ( = ?auto_169300 ?auto_169306 ) ) ( not ( = ?auto_169300 ?auto_169307 ) ) ( not ( = ?auto_169300 ?auto_169308 ) ) ( not ( = ?auto_169300 ?auto_169309 ) ) ( not ( = ?auto_169300 ?auto_169310 ) ) ( not ( = ?auto_169301 ?auto_169302 ) ) ( not ( = ?auto_169301 ?auto_169303 ) ) ( not ( = ?auto_169301 ?auto_169304 ) ) ( not ( = ?auto_169301 ?auto_169305 ) ) ( not ( = ?auto_169301 ?auto_169306 ) ) ( not ( = ?auto_169301 ?auto_169307 ) ) ( not ( = ?auto_169301 ?auto_169308 ) ) ( not ( = ?auto_169301 ?auto_169309 ) ) ( not ( = ?auto_169301 ?auto_169310 ) ) ( not ( = ?auto_169302 ?auto_169303 ) ) ( not ( = ?auto_169302 ?auto_169304 ) ) ( not ( = ?auto_169302 ?auto_169305 ) ) ( not ( = ?auto_169302 ?auto_169306 ) ) ( not ( = ?auto_169302 ?auto_169307 ) ) ( not ( = ?auto_169302 ?auto_169308 ) ) ( not ( = ?auto_169302 ?auto_169309 ) ) ( not ( = ?auto_169302 ?auto_169310 ) ) ( not ( = ?auto_169303 ?auto_169304 ) ) ( not ( = ?auto_169303 ?auto_169305 ) ) ( not ( = ?auto_169303 ?auto_169306 ) ) ( not ( = ?auto_169303 ?auto_169307 ) ) ( not ( = ?auto_169303 ?auto_169308 ) ) ( not ( = ?auto_169303 ?auto_169309 ) ) ( not ( = ?auto_169303 ?auto_169310 ) ) ( not ( = ?auto_169304 ?auto_169305 ) ) ( not ( = ?auto_169304 ?auto_169306 ) ) ( not ( = ?auto_169304 ?auto_169307 ) ) ( not ( = ?auto_169304 ?auto_169308 ) ) ( not ( = ?auto_169304 ?auto_169309 ) ) ( not ( = ?auto_169304 ?auto_169310 ) ) ( not ( = ?auto_169305 ?auto_169306 ) ) ( not ( = ?auto_169305 ?auto_169307 ) ) ( not ( = ?auto_169305 ?auto_169308 ) ) ( not ( = ?auto_169305 ?auto_169309 ) ) ( not ( = ?auto_169305 ?auto_169310 ) ) ( not ( = ?auto_169306 ?auto_169307 ) ) ( not ( = ?auto_169306 ?auto_169308 ) ) ( not ( = ?auto_169306 ?auto_169309 ) ) ( not ( = ?auto_169306 ?auto_169310 ) ) ( not ( = ?auto_169307 ?auto_169308 ) ) ( not ( = ?auto_169307 ?auto_169309 ) ) ( not ( = ?auto_169307 ?auto_169310 ) ) ( not ( = ?auto_169308 ?auto_169309 ) ) ( not ( = ?auto_169308 ?auto_169310 ) ) ( not ( = ?auto_169309 ?auto_169310 ) ) ( ON ?auto_169309 ?auto_169310 ) ( ON ?auto_169308 ?auto_169309 ) ( ON ?auto_169307 ?auto_169308 ) ( ON ?auto_169306 ?auto_169307 ) ( ON ?auto_169305 ?auto_169306 ) ( ON ?auto_169304 ?auto_169305 ) ( ON ?auto_169303 ?auto_169304 ) ( CLEAR ?auto_169301 ) ( ON ?auto_169302 ?auto_169303 ) ( CLEAR ?auto_169302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_169299 ?auto_169300 ?auto_169301 ?auto_169302 )
      ( MAKE-12PILE ?auto_169299 ?auto_169300 ?auto_169301 ?auto_169302 ?auto_169303 ?auto_169304 ?auto_169305 ?auto_169306 ?auto_169307 ?auto_169308 ?auto_169309 ?auto_169310 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169323 - BLOCK
      ?auto_169324 - BLOCK
      ?auto_169325 - BLOCK
      ?auto_169326 - BLOCK
      ?auto_169327 - BLOCK
      ?auto_169328 - BLOCK
      ?auto_169329 - BLOCK
      ?auto_169330 - BLOCK
      ?auto_169331 - BLOCK
      ?auto_169332 - BLOCK
      ?auto_169333 - BLOCK
      ?auto_169334 - BLOCK
    )
    :vars
    (
      ?auto_169335 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169334 ?auto_169335 ) ( ON-TABLE ?auto_169323 ) ( ON ?auto_169324 ?auto_169323 ) ( not ( = ?auto_169323 ?auto_169324 ) ) ( not ( = ?auto_169323 ?auto_169325 ) ) ( not ( = ?auto_169323 ?auto_169326 ) ) ( not ( = ?auto_169323 ?auto_169327 ) ) ( not ( = ?auto_169323 ?auto_169328 ) ) ( not ( = ?auto_169323 ?auto_169329 ) ) ( not ( = ?auto_169323 ?auto_169330 ) ) ( not ( = ?auto_169323 ?auto_169331 ) ) ( not ( = ?auto_169323 ?auto_169332 ) ) ( not ( = ?auto_169323 ?auto_169333 ) ) ( not ( = ?auto_169323 ?auto_169334 ) ) ( not ( = ?auto_169323 ?auto_169335 ) ) ( not ( = ?auto_169324 ?auto_169325 ) ) ( not ( = ?auto_169324 ?auto_169326 ) ) ( not ( = ?auto_169324 ?auto_169327 ) ) ( not ( = ?auto_169324 ?auto_169328 ) ) ( not ( = ?auto_169324 ?auto_169329 ) ) ( not ( = ?auto_169324 ?auto_169330 ) ) ( not ( = ?auto_169324 ?auto_169331 ) ) ( not ( = ?auto_169324 ?auto_169332 ) ) ( not ( = ?auto_169324 ?auto_169333 ) ) ( not ( = ?auto_169324 ?auto_169334 ) ) ( not ( = ?auto_169324 ?auto_169335 ) ) ( not ( = ?auto_169325 ?auto_169326 ) ) ( not ( = ?auto_169325 ?auto_169327 ) ) ( not ( = ?auto_169325 ?auto_169328 ) ) ( not ( = ?auto_169325 ?auto_169329 ) ) ( not ( = ?auto_169325 ?auto_169330 ) ) ( not ( = ?auto_169325 ?auto_169331 ) ) ( not ( = ?auto_169325 ?auto_169332 ) ) ( not ( = ?auto_169325 ?auto_169333 ) ) ( not ( = ?auto_169325 ?auto_169334 ) ) ( not ( = ?auto_169325 ?auto_169335 ) ) ( not ( = ?auto_169326 ?auto_169327 ) ) ( not ( = ?auto_169326 ?auto_169328 ) ) ( not ( = ?auto_169326 ?auto_169329 ) ) ( not ( = ?auto_169326 ?auto_169330 ) ) ( not ( = ?auto_169326 ?auto_169331 ) ) ( not ( = ?auto_169326 ?auto_169332 ) ) ( not ( = ?auto_169326 ?auto_169333 ) ) ( not ( = ?auto_169326 ?auto_169334 ) ) ( not ( = ?auto_169326 ?auto_169335 ) ) ( not ( = ?auto_169327 ?auto_169328 ) ) ( not ( = ?auto_169327 ?auto_169329 ) ) ( not ( = ?auto_169327 ?auto_169330 ) ) ( not ( = ?auto_169327 ?auto_169331 ) ) ( not ( = ?auto_169327 ?auto_169332 ) ) ( not ( = ?auto_169327 ?auto_169333 ) ) ( not ( = ?auto_169327 ?auto_169334 ) ) ( not ( = ?auto_169327 ?auto_169335 ) ) ( not ( = ?auto_169328 ?auto_169329 ) ) ( not ( = ?auto_169328 ?auto_169330 ) ) ( not ( = ?auto_169328 ?auto_169331 ) ) ( not ( = ?auto_169328 ?auto_169332 ) ) ( not ( = ?auto_169328 ?auto_169333 ) ) ( not ( = ?auto_169328 ?auto_169334 ) ) ( not ( = ?auto_169328 ?auto_169335 ) ) ( not ( = ?auto_169329 ?auto_169330 ) ) ( not ( = ?auto_169329 ?auto_169331 ) ) ( not ( = ?auto_169329 ?auto_169332 ) ) ( not ( = ?auto_169329 ?auto_169333 ) ) ( not ( = ?auto_169329 ?auto_169334 ) ) ( not ( = ?auto_169329 ?auto_169335 ) ) ( not ( = ?auto_169330 ?auto_169331 ) ) ( not ( = ?auto_169330 ?auto_169332 ) ) ( not ( = ?auto_169330 ?auto_169333 ) ) ( not ( = ?auto_169330 ?auto_169334 ) ) ( not ( = ?auto_169330 ?auto_169335 ) ) ( not ( = ?auto_169331 ?auto_169332 ) ) ( not ( = ?auto_169331 ?auto_169333 ) ) ( not ( = ?auto_169331 ?auto_169334 ) ) ( not ( = ?auto_169331 ?auto_169335 ) ) ( not ( = ?auto_169332 ?auto_169333 ) ) ( not ( = ?auto_169332 ?auto_169334 ) ) ( not ( = ?auto_169332 ?auto_169335 ) ) ( not ( = ?auto_169333 ?auto_169334 ) ) ( not ( = ?auto_169333 ?auto_169335 ) ) ( not ( = ?auto_169334 ?auto_169335 ) ) ( ON ?auto_169333 ?auto_169334 ) ( ON ?auto_169332 ?auto_169333 ) ( ON ?auto_169331 ?auto_169332 ) ( ON ?auto_169330 ?auto_169331 ) ( ON ?auto_169329 ?auto_169330 ) ( ON ?auto_169328 ?auto_169329 ) ( ON ?auto_169327 ?auto_169328 ) ( ON ?auto_169326 ?auto_169327 ) ( CLEAR ?auto_169324 ) ( ON ?auto_169325 ?auto_169326 ) ( CLEAR ?auto_169325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169323 ?auto_169324 ?auto_169325 )
      ( MAKE-12PILE ?auto_169323 ?auto_169324 ?auto_169325 ?auto_169326 ?auto_169327 ?auto_169328 ?auto_169329 ?auto_169330 ?auto_169331 ?auto_169332 ?auto_169333 ?auto_169334 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169348 - BLOCK
      ?auto_169349 - BLOCK
      ?auto_169350 - BLOCK
      ?auto_169351 - BLOCK
      ?auto_169352 - BLOCK
      ?auto_169353 - BLOCK
      ?auto_169354 - BLOCK
      ?auto_169355 - BLOCK
      ?auto_169356 - BLOCK
      ?auto_169357 - BLOCK
      ?auto_169358 - BLOCK
      ?auto_169359 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169359 ) ( ON-TABLE ?auto_169348 ) ( ON ?auto_169349 ?auto_169348 ) ( not ( = ?auto_169348 ?auto_169349 ) ) ( not ( = ?auto_169348 ?auto_169350 ) ) ( not ( = ?auto_169348 ?auto_169351 ) ) ( not ( = ?auto_169348 ?auto_169352 ) ) ( not ( = ?auto_169348 ?auto_169353 ) ) ( not ( = ?auto_169348 ?auto_169354 ) ) ( not ( = ?auto_169348 ?auto_169355 ) ) ( not ( = ?auto_169348 ?auto_169356 ) ) ( not ( = ?auto_169348 ?auto_169357 ) ) ( not ( = ?auto_169348 ?auto_169358 ) ) ( not ( = ?auto_169348 ?auto_169359 ) ) ( not ( = ?auto_169349 ?auto_169350 ) ) ( not ( = ?auto_169349 ?auto_169351 ) ) ( not ( = ?auto_169349 ?auto_169352 ) ) ( not ( = ?auto_169349 ?auto_169353 ) ) ( not ( = ?auto_169349 ?auto_169354 ) ) ( not ( = ?auto_169349 ?auto_169355 ) ) ( not ( = ?auto_169349 ?auto_169356 ) ) ( not ( = ?auto_169349 ?auto_169357 ) ) ( not ( = ?auto_169349 ?auto_169358 ) ) ( not ( = ?auto_169349 ?auto_169359 ) ) ( not ( = ?auto_169350 ?auto_169351 ) ) ( not ( = ?auto_169350 ?auto_169352 ) ) ( not ( = ?auto_169350 ?auto_169353 ) ) ( not ( = ?auto_169350 ?auto_169354 ) ) ( not ( = ?auto_169350 ?auto_169355 ) ) ( not ( = ?auto_169350 ?auto_169356 ) ) ( not ( = ?auto_169350 ?auto_169357 ) ) ( not ( = ?auto_169350 ?auto_169358 ) ) ( not ( = ?auto_169350 ?auto_169359 ) ) ( not ( = ?auto_169351 ?auto_169352 ) ) ( not ( = ?auto_169351 ?auto_169353 ) ) ( not ( = ?auto_169351 ?auto_169354 ) ) ( not ( = ?auto_169351 ?auto_169355 ) ) ( not ( = ?auto_169351 ?auto_169356 ) ) ( not ( = ?auto_169351 ?auto_169357 ) ) ( not ( = ?auto_169351 ?auto_169358 ) ) ( not ( = ?auto_169351 ?auto_169359 ) ) ( not ( = ?auto_169352 ?auto_169353 ) ) ( not ( = ?auto_169352 ?auto_169354 ) ) ( not ( = ?auto_169352 ?auto_169355 ) ) ( not ( = ?auto_169352 ?auto_169356 ) ) ( not ( = ?auto_169352 ?auto_169357 ) ) ( not ( = ?auto_169352 ?auto_169358 ) ) ( not ( = ?auto_169352 ?auto_169359 ) ) ( not ( = ?auto_169353 ?auto_169354 ) ) ( not ( = ?auto_169353 ?auto_169355 ) ) ( not ( = ?auto_169353 ?auto_169356 ) ) ( not ( = ?auto_169353 ?auto_169357 ) ) ( not ( = ?auto_169353 ?auto_169358 ) ) ( not ( = ?auto_169353 ?auto_169359 ) ) ( not ( = ?auto_169354 ?auto_169355 ) ) ( not ( = ?auto_169354 ?auto_169356 ) ) ( not ( = ?auto_169354 ?auto_169357 ) ) ( not ( = ?auto_169354 ?auto_169358 ) ) ( not ( = ?auto_169354 ?auto_169359 ) ) ( not ( = ?auto_169355 ?auto_169356 ) ) ( not ( = ?auto_169355 ?auto_169357 ) ) ( not ( = ?auto_169355 ?auto_169358 ) ) ( not ( = ?auto_169355 ?auto_169359 ) ) ( not ( = ?auto_169356 ?auto_169357 ) ) ( not ( = ?auto_169356 ?auto_169358 ) ) ( not ( = ?auto_169356 ?auto_169359 ) ) ( not ( = ?auto_169357 ?auto_169358 ) ) ( not ( = ?auto_169357 ?auto_169359 ) ) ( not ( = ?auto_169358 ?auto_169359 ) ) ( ON ?auto_169358 ?auto_169359 ) ( ON ?auto_169357 ?auto_169358 ) ( ON ?auto_169356 ?auto_169357 ) ( ON ?auto_169355 ?auto_169356 ) ( ON ?auto_169354 ?auto_169355 ) ( ON ?auto_169353 ?auto_169354 ) ( ON ?auto_169352 ?auto_169353 ) ( ON ?auto_169351 ?auto_169352 ) ( CLEAR ?auto_169349 ) ( ON ?auto_169350 ?auto_169351 ) ( CLEAR ?auto_169350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_169348 ?auto_169349 ?auto_169350 )
      ( MAKE-12PILE ?auto_169348 ?auto_169349 ?auto_169350 ?auto_169351 ?auto_169352 ?auto_169353 ?auto_169354 ?auto_169355 ?auto_169356 ?auto_169357 ?auto_169358 ?auto_169359 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169372 - BLOCK
      ?auto_169373 - BLOCK
      ?auto_169374 - BLOCK
      ?auto_169375 - BLOCK
      ?auto_169376 - BLOCK
      ?auto_169377 - BLOCK
      ?auto_169378 - BLOCK
      ?auto_169379 - BLOCK
      ?auto_169380 - BLOCK
      ?auto_169381 - BLOCK
      ?auto_169382 - BLOCK
      ?auto_169383 - BLOCK
    )
    :vars
    (
      ?auto_169384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169383 ?auto_169384 ) ( ON-TABLE ?auto_169372 ) ( not ( = ?auto_169372 ?auto_169373 ) ) ( not ( = ?auto_169372 ?auto_169374 ) ) ( not ( = ?auto_169372 ?auto_169375 ) ) ( not ( = ?auto_169372 ?auto_169376 ) ) ( not ( = ?auto_169372 ?auto_169377 ) ) ( not ( = ?auto_169372 ?auto_169378 ) ) ( not ( = ?auto_169372 ?auto_169379 ) ) ( not ( = ?auto_169372 ?auto_169380 ) ) ( not ( = ?auto_169372 ?auto_169381 ) ) ( not ( = ?auto_169372 ?auto_169382 ) ) ( not ( = ?auto_169372 ?auto_169383 ) ) ( not ( = ?auto_169372 ?auto_169384 ) ) ( not ( = ?auto_169373 ?auto_169374 ) ) ( not ( = ?auto_169373 ?auto_169375 ) ) ( not ( = ?auto_169373 ?auto_169376 ) ) ( not ( = ?auto_169373 ?auto_169377 ) ) ( not ( = ?auto_169373 ?auto_169378 ) ) ( not ( = ?auto_169373 ?auto_169379 ) ) ( not ( = ?auto_169373 ?auto_169380 ) ) ( not ( = ?auto_169373 ?auto_169381 ) ) ( not ( = ?auto_169373 ?auto_169382 ) ) ( not ( = ?auto_169373 ?auto_169383 ) ) ( not ( = ?auto_169373 ?auto_169384 ) ) ( not ( = ?auto_169374 ?auto_169375 ) ) ( not ( = ?auto_169374 ?auto_169376 ) ) ( not ( = ?auto_169374 ?auto_169377 ) ) ( not ( = ?auto_169374 ?auto_169378 ) ) ( not ( = ?auto_169374 ?auto_169379 ) ) ( not ( = ?auto_169374 ?auto_169380 ) ) ( not ( = ?auto_169374 ?auto_169381 ) ) ( not ( = ?auto_169374 ?auto_169382 ) ) ( not ( = ?auto_169374 ?auto_169383 ) ) ( not ( = ?auto_169374 ?auto_169384 ) ) ( not ( = ?auto_169375 ?auto_169376 ) ) ( not ( = ?auto_169375 ?auto_169377 ) ) ( not ( = ?auto_169375 ?auto_169378 ) ) ( not ( = ?auto_169375 ?auto_169379 ) ) ( not ( = ?auto_169375 ?auto_169380 ) ) ( not ( = ?auto_169375 ?auto_169381 ) ) ( not ( = ?auto_169375 ?auto_169382 ) ) ( not ( = ?auto_169375 ?auto_169383 ) ) ( not ( = ?auto_169375 ?auto_169384 ) ) ( not ( = ?auto_169376 ?auto_169377 ) ) ( not ( = ?auto_169376 ?auto_169378 ) ) ( not ( = ?auto_169376 ?auto_169379 ) ) ( not ( = ?auto_169376 ?auto_169380 ) ) ( not ( = ?auto_169376 ?auto_169381 ) ) ( not ( = ?auto_169376 ?auto_169382 ) ) ( not ( = ?auto_169376 ?auto_169383 ) ) ( not ( = ?auto_169376 ?auto_169384 ) ) ( not ( = ?auto_169377 ?auto_169378 ) ) ( not ( = ?auto_169377 ?auto_169379 ) ) ( not ( = ?auto_169377 ?auto_169380 ) ) ( not ( = ?auto_169377 ?auto_169381 ) ) ( not ( = ?auto_169377 ?auto_169382 ) ) ( not ( = ?auto_169377 ?auto_169383 ) ) ( not ( = ?auto_169377 ?auto_169384 ) ) ( not ( = ?auto_169378 ?auto_169379 ) ) ( not ( = ?auto_169378 ?auto_169380 ) ) ( not ( = ?auto_169378 ?auto_169381 ) ) ( not ( = ?auto_169378 ?auto_169382 ) ) ( not ( = ?auto_169378 ?auto_169383 ) ) ( not ( = ?auto_169378 ?auto_169384 ) ) ( not ( = ?auto_169379 ?auto_169380 ) ) ( not ( = ?auto_169379 ?auto_169381 ) ) ( not ( = ?auto_169379 ?auto_169382 ) ) ( not ( = ?auto_169379 ?auto_169383 ) ) ( not ( = ?auto_169379 ?auto_169384 ) ) ( not ( = ?auto_169380 ?auto_169381 ) ) ( not ( = ?auto_169380 ?auto_169382 ) ) ( not ( = ?auto_169380 ?auto_169383 ) ) ( not ( = ?auto_169380 ?auto_169384 ) ) ( not ( = ?auto_169381 ?auto_169382 ) ) ( not ( = ?auto_169381 ?auto_169383 ) ) ( not ( = ?auto_169381 ?auto_169384 ) ) ( not ( = ?auto_169382 ?auto_169383 ) ) ( not ( = ?auto_169382 ?auto_169384 ) ) ( not ( = ?auto_169383 ?auto_169384 ) ) ( ON ?auto_169382 ?auto_169383 ) ( ON ?auto_169381 ?auto_169382 ) ( ON ?auto_169380 ?auto_169381 ) ( ON ?auto_169379 ?auto_169380 ) ( ON ?auto_169378 ?auto_169379 ) ( ON ?auto_169377 ?auto_169378 ) ( ON ?auto_169376 ?auto_169377 ) ( ON ?auto_169375 ?auto_169376 ) ( ON ?auto_169374 ?auto_169375 ) ( CLEAR ?auto_169372 ) ( ON ?auto_169373 ?auto_169374 ) ( CLEAR ?auto_169373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169372 ?auto_169373 )
      ( MAKE-12PILE ?auto_169372 ?auto_169373 ?auto_169374 ?auto_169375 ?auto_169376 ?auto_169377 ?auto_169378 ?auto_169379 ?auto_169380 ?auto_169381 ?auto_169382 ?auto_169383 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169397 - BLOCK
      ?auto_169398 - BLOCK
      ?auto_169399 - BLOCK
      ?auto_169400 - BLOCK
      ?auto_169401 - BLOCK
      ?auto_169402 - BLOCK
      ?auto_169403 - BLOCK
      ?auto_169404 - BLOCK
      ?auto_169405 - BLOCK
      ?auto_169406 - BLOCK
      ?auto_169407 - BLOCK
      ?auto_169408 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169408 ) ( ON-TABLE ?auto_169397 ) ( not ( = ?auto_169397 ?auto_169398 ) ) ( not ( = ?auto_169397 ?auto_169399 ) ) ( not ( = ?auto_169397 ?auto_169400 ) ) ( not ( = ?auto_169397 ?auto_169401 ) ) ( not ( = ?auto_169397 ?auto_169402 ) ) ( not ( = ?auto_169397 ?auto_169403 ) ) ( not ( = ?auto_169397 ?auto_169404 ) ) ( not ( = ?auto_169397 ?auto_169405 ) ) ( not ( = ?auto_169397 ?auto_169406 ) ) ( not ( = ?auto_169397 ?auto_169407 ) ) ( not ( = ?auto_169397 ?auto_169408 ) ) ( not ( = ?auto_169398 ?auto_169399 ) ) ( not ( = ?auto_169398 ?auto_169400 ) ) ( not ( = ?auto_169398 ?auto_169401 ) ) ( not ( = ?auto_169398 ?auto_169402 ) ) ( not ( = ?auto_169398 ?auto_169403 ) ) ( not ( = ?auto_169398 ?auto_169404 ) ) ( not ( = ?auto_169398 ?auto_169405 ) ) ( not ( = ?auto_169398 ?auto_169406 ) ) ( not ( = ?auto_169398 ?auto_169407 ) ) ( not ( = ?auto_169398 ?auto_169408 ) ) ( not ( = ?auto_169399 ?auto_169400 ) ) ( not ( = ?auto_169399 ?auto_169401 ) ) ( not ( = ?auto_169399 ?auto_169402 ) ) ( not ( = ?auto_169399 ?auto_169403 ) ) ( not ( = ?auto_169399 ?auto_169404 ) ) ( not ( = ?auto_169399 ?auto_169405 ) ) ( not ( = ?auto_169399 ?auto_169406 ) ) ( not ( = ?auto_169399 ?auto_169407 ) ) ( not ( = ?auto_169399 ?auto_169408 ) ) ( not ( = ?auto_169400 ?auto_169401 ) ) ( not ( = ?auto_169400 ?auto_169402 ) ) ( not ( = ?auto_169400 ?auto_169403 ) ) ( not ( = ?auto_169400 ?auto_169404 ) ) ( not ( = ?auto_169400 ?auto_169405 ) ) ( not ( = ?auto_169400 ?auto_169406 ) ) ( not ( = ?auto_169400 ?auto_169407 ) ) ( not ( = ?auto_169400 ?auto_169408 ) ) ( not ( = ?auto_169401 ?auto_169402 ) ) ( not ( = ?auto_169401 ?auto_169403 ) ) ( not ( = ?auto_169401 ?auto_169404 ) ) ( not ( = ?auto_169401 ?auto_169405 ) ) ( not ( = ?auto_169401 ?auto_169406 ) ) ( not ( = ?auto_169401 ?auto_169407 ) ) ( not ( = ?auto_169401 ?auto_169408 ) ) ( not ( = ?auto_169402 ?auto_169403 ) ) ( not ( = ?auto_169402 ?auto_169404 ) ) ( not ( = ?auto_169402 ?auto_169405 ) ) ( not ( = ?auto_169402 ?auto_169406 ) ) ( not ( = ?auto_169402 ?auto_169407 ) ) ( not ( = ?auto_169402 ?auto_169408 ) ) ( not ( = ?auto_169403 ?auto_169404 ) ) ( not ( = ?auto_169403 ?auto_169405 ) ) ( not ( = ?auto_169403 ?auto_169406 ) ) ( not ( = ?auto_169403 ?auto_169407 ) ) ( not ( = ?auto_169403 ?auto_169408 ) ) ( not ( = ?auto_169404 ?auto_169405 ) ) ( not ( = ?auto_169404 ?auto_169406 ) ) ( not ( = ?auto_169404 ?auto_169407 ) ) ( not ( = ?auto_169404 ?auto_169408 ) ) ( not ( = ?auto_169405 ?auto_169406 ) ) ( not ( = ?auto_169405 ?auto_169407 ) ) ( not ( = ?auto_169405 ?auto_169408 ) ) ( not ( = ?auto_169406 ?auto_169407 ) ) ( not ( = ?auto_169406 ?auto_169408 ) ) ( not ( = ?auto_169407 ?auto_169408 ) ) ( ON ?auto_169407 ?auto_169408 ) ( ON ?auto_169406 ?auto_169407 ) ( ON ?auto_169405 ?auto_169406 ) ( ON ?auto_169404 ?auto_169405 ) ( ON ?auto_169403 ?auto_169404 ) ( ON ?auto_169402 ?auto_169403 ) ( ON ?auto_169401 ?auto_169402 ) ( ON ?auto_169400 ?auto_169401 ) ( ON ?auto_169399 ?auto_169400 ) ( CLEAR ?auto_169397 ) ( ON ?auto_169398 ?auto_169399 ) ( CLEAR ?auto_169398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_169397 ?auto_169398 )
      ( MAKE-12PILE ?auto_169397 ?auto_169398 ?auto_169399 ?auto_169400 ?auto_169401 ?auto_169402 ?auto_169403 ?auto_169404 ?auto_169405 ?auto_169406 ?auto_169407 ?auto_169408 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169421 - BLOCK
      ?auto_169422 - BLOCK
      ?auto_169423 - BLOCK
      ?auto_169424 - BLOCK
      ?auto_169425 - BLOCK
      ?auto_169426 - BLOCK
      ?auto_169427 - BLOCK
      ?auto_169428 - BLOCK
      ?auto_169429 - BLOCK
      ?auto_169430 - BLOCK
      ?auto_169431 - BLOCK
      ?auto_169432 - BLOCK
    )
    :vars
    (
      ?auto_169433 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169432 ?auto_169433 ) ( not ( = ?auto_169421 ?auto_169422 ) ) ( not ( = ?auto_169421 ?auto_169423 ) ) ( not ( = ?auto_169421 ?auto_169424 ) ) ( not ( = ?auto_169421 ?auto_169425 ) ) ( not ( = ?auto_169421 ?auto_169426 ) ) ( not ( = ?auto_169421 ?auto_169427 ) ) ( not ( = ?auto_169421 ?auto_169428 ) ) ( not ( = ?auto_169421 ?auto_169429 ) ) ( not ( = ?auto_169421 ?auto_169430 ) ) ( not ( = ?auto_169421 ?auto_169431 ) ) ( not ( = ?auto_169421 ?auto_169432 ) ) ( not ( = ?auto_169421 ?auto_169433 ) ) ( not ( = ?auto_169422 ?auto_169423 ) ) ( not ( = ?auto_169422 ?auto_169424 ) ) ( not ( = ?auto_169422 ?auto_169425 ) ) ( not ( = ?auto_169422 ?auto_169426 ) ) ( not ( = ?auto_169422 ?auto_169427 ) ) ( not ( = ?auto_169422 ?auto_169428 ) ) ( not ( = ?auto_169422 ?auto_169429 ) ) ( not ( = ?auto_169422 ?auto_169430 ) ) ( not ( = ?auto_169422 ?auto_169431 ) ) ( not ( = ?auto_169422 ?auto_169432 ) ) ( not ( = ?auto_169422 ?auto_169433 ) ) ( not ( = ?auto_169423 ?auto_169424 ) ) ( not ( = ?auto_169423 ?auto_169425 ) ) ( not ( = ?auto_169423 ?auto_169426 ) ) ( not ( = ?auto_169423 ?auto_169427 ) ) ( not ( = ?auto_169423 ?auto_169428 ) ) ( not ( = ?auto_169423 ?auto_169429 ) ) ( not ( = ?auto_169423 ?auto_169430 ) ) ( not ( = ?auto_169423 ?auto_169431 ) ) ( not ( = ?auto_169423 ?auto_169432 ) ) ( not ( = ?auto_169423 ?auto_169433 ) ) ( not ( = ?auto_169424 ?auto_169425 ) ) ( not ( = ?auto_169424 ?auto_169426 ) ) ( not ( = ?auto_169424 ?auto_169427 ) ) ( not ( = ?auto_169424 ?auto_169428 ) ) ( not ( = ?auto_169424 ?auto_169429 ) ) ( not ( = ?auto_169424 ?auto_169430 ) ) ( not ( = ?auto_169424 ?auto_169431 ) ) ( not ( = ?auto_169424 ?auto_169432 ) ) ( not ( = ?auto_169424 ?auto_169433 ) ) ( not ( = ?auto_169425 ?auto_169426 ) ) ( not ( = ?auto_169425 ?auto_169427 ) ) ( not ( = ?auto_169425 ?auto_169428 ) ) ( not ( = ?auto_169425 ?auto_169429 ) ) ( not ( = ?auto_169425 ?auto_169430 ) ) ( not ( = ?auto_169425 ?auto_169431 ) ) ( not ( = ?auto_169425 ?auto_169432 ) ) ( not ( = ?auto_169425 ?auto_169433 ) ) ( not ( = ?auto_169426 ?auto_169427 ) ) ( not ( = ?auto_169426 ?auto_169428 ) ) ( not ( = ?auto_169426 ?auto_169429 ) ) ( not ( = ?auto_169426 ?auto_169430 ) ) ( not ( = ?auto_169426 ?auto_169431 ) ) ( not ( = ?auto_169426 ?auto_169432 ) ) ( not ( = ?auto_169426 ?auto_169433 ) ) ( not ( = ?auto_169427 ?auto_169428 ) ) ( not ( = ?auto_169427 ?auto_169429 ) ) ( not ( = ?auto_169427 ?auto_169430 ) ) ( not ( = ?auto_169427 ?auto_169431 ) ) ( not ( = ?auto_169427 ?auto_169432 ) ) ( not ( = ?auto_169427 ?auto_169433 ) ) ( not ( = ?auto_169428 ?auto_169429 ) ) ( not ( = ?auto_169428 ?auto_169430 ) ) ( not ( = ?auto_169428 ?auto_169431 ) ) ( not ( = ?auto_169428 ?auto_169432 ) ) ( not ( = ?auto_169428 ?auto_169433 ) ) ( not ( = ?auto_169429 ?auto_169430 ) ) ( not ( = ?auto_169429 ?auto_169431 ) ) ( not ( = ?auto_169429 ?auto_169432 ) ) ( not ( = ?auto_169429 ?auto_169433 ) ) ( not ( = ?auto_169430 ?auto_169431 ) ) ( not ( = ?auto_169430 ?auto_169432 ) ) ( not ( = ?auto_169430 ?auto_169433 ) ) ( not ( = ?auto_169431 ?auto_169432 ) ) ( not ( = ?auto_169431 ?auto_169433 ) ) ( not ( = ?auto_169432 ?auto_169433 ) ) ( ON ?auto_169431 ?auto_169432 ) ( ON ?auto_169430 ?auto_169431 ) ( ON ?auto_169429 ?auto_169430 ) ( ON ?auto_169428 ?auto_169429 ) ( ON ?auto_169427 ?auto_169428 ) ( ON ?auto_169426 ?auto_169427 ) ( ON ?auto_169425 ?auto_169426 ) ( ON ?auto_169424 ?auto_169425 ) ( ON ?auto_169423 ?auto_169424 ) ( ON ?auto_169422 ?auto_169423 ) ( ON ?auto_169421 ?auto_169422 ) ( CLEAR ?auto_169421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169421 )
      ( MAKE-12PILE ?auto_169421 ?auto_169422 ?auto_169423 ?auto_169424 ?auto_169425 ?auto_169426 ?auto_169427 ?auto_169428 ?auto_169429 ?auto_169430 ?auto_169431 ?auto_169432 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169446 - BLOCK
      ?auto_169447 - BLOCK
      ?auto_169448 - BLOCK
      ?auto_169449 - BLOCK
      ?auto_169450 - BLOCK
      ?auto_169451 - BLOCK
      ?auto_169452 - BLOCK
      ?auto_169453 - BLOCK
      ?auto_169454 - BLOCK
      ?auto_169455 - BLOCK
      ?auto_169456 - BLOCK
      ?auto_169457 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_169457 ) ( not ( = ?auto_169446 ?auto_169447 ) ) ( not ( = ?auto_169446 ?auto_169448 ) ) ( not ( = ?auto_169446 ?auto_169449 ) ) ( not ( = ?auto_169446 ?auto_169450 ) ) ( not ( = ?auto_169446 ?auto_169451 ) ) ( not ( = ?auto_169446 ?auto_169452 ) ) ( not ( = ?auto_169446 ?auto_169453 ) ) ( not ( = ?auto_169446 ?auto_169454 ) ) ( not ( = ?auto_169446 ?auto_169455 ) ) ( not ( = ?auto_169446 ?auto_169456 ) ) ( not ( = ?auto_169446 ?auto_169457 ) ) ( not ( = ?auto_169447 ?auto_169448 ) ) ( not ( = ?auto_169447 ?auto_169449 ) ) ( not ( = ?auto_169447 ?auto_169450 ) ) ( not ( = ?auto_169447 ?auto_169451 ) ) ( not ( = ?auto_169447 ?auto_169452 ) ) ( not ( = ?auto_169447 ?auto_169453 ) ) ( not ( = ?auto_169447 ?auto_169454 ) ) ( not ( = ?auto_169447 ?auto_169455 ) ) ( not ( = ?auto_169447 ?auto_169456 ) ) ( not ( = ?auto_169447 ?auto_169457 ) ) ( not ( = ?auto_169448 ?auto_169449 ) ) ( not ( = ?auto_169448 ?auto_169450 ) ) ( not ( = ?auto_169448 ?auto_169451 ) ) ( not ( = ?auto_169448 ?auto_169452 ) ) ( not ( = ?auto_169448 ?auto_169453 ) ) ( not ( = ?auto_169448 ?auto_169454 ) ) ( not ( = ?auto_169448 ?auto_169455 ) ) ( not ( = ?auto_169448 ?auto_169456 ) ) ( not ( = ?auto_169448 ?auto_169457 ) ) ( not ( = ?auto_169449 ?auto_169450 ) ) ( not ( = ?auto_169449 ?auto_169451 ) ) ( not ( = ?auto_169449 ?auto_169452 ) ) ( not ( = ?auto_169449 ?auto_169453 ) ) ( not ( = ?auto_169449 ?auto_169454 ) ) ( not ( = ?auto_169449 ?auto_169455 ) ) ( not ( = ?auto_169449 ?auto_169456 ) ) ( not ( = ?auto_169449 ?auto_169457 ) ) ( not ( = ?auto_169450 ?auto_169451 ) ) ( not ( = ?auto_169450 ?auto_169452 ) ) ( not ( = ?auto_169450 ?auto_169453 ) ) ( not ( = ?auto_169450 ?auto_169454 ) ) ( not ( = ?auto_169450 ?auto_169455 ) ) ( not ( = ?auto_169450 ?auto_169456 ) ) ( not ( = ?auto_169450 ?auto_169457 ) ) ( not ( = ?auto_169451 ?auto_169452 ) ) ( not ( = ?auto_169451 ?auto_169453 ) ) ( not ( = ?auto_169451 ?auto_169454 ) ) ( not ( = ?auto_169451 ?auto_169455 ) ) ( not ( = ?auto_169451 ?auto_169456 ) ) ( not ( = ?auto_169451 ?auto_169457 ) ) ( not ( = ?auto_169452 ?auto_169453 ) ) ( not ( = ?auto_169452 ?auto_169454 ) ) ( not ( = ?auto_169452 ?auto_169455 ) ) ( not ( = ?auto_169452 ?auto_169456 ) ) ( not ( = ?auto_169452 ?auto_169457 ) ) ( not ( = ?auto_169453 ?auto_169454 ) ) ( not ( = ?auto_169453 ?auto_169455 ) ) ( not ( = ?auto_169453 ?auto_169456 ) ) ( not ( = ?auto_169453 ?auto_169457 ) ) ( not ( = ?auto_169454 ?auto_169455 ) ) ( not ( = ?auto_169454 ?auto_169456 ) ) ( not ( = ?auto_169454 ?auto_169457 ) ) ( not ( = ?auto_169455 ?auto_169456 ) ) ( not ( = ?auto_169455 ?auto_169457 ) ) ( not ( = ?auto_169456 ?auto_169457 ) ) ( ON ?auto_169456 ?auto_169457 ) ( ON ?auto_169455 ?auto_169456 ) ( ON ?auto_169454 ?auto_169455 ) ( ON ?auto_169453 ?auto_169454 ) ( ON ?auto_169452 ?auto_169453 ) ( ON ?auto_169451 ?auto_169452 ) ( ON ?auto_169450 ?auto_169451 ) ( ON ?auto_169449 ?auto_169450 ) ( ON ?auto_169448 ?auto_169449 ) ( ON ?auto_169447 ?auto_169448 ) ( ON ?auto_169446 ?auto_169447 ) ( CLEAR ?auto_169446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_169446 )
      ( MAKE-12PILE ?auto_169446 ?auto_169447 ?auto_169448 ?auto_169449 ?auto_169450 ?auto_169451 ?auto_169452 ?auto_169453 ?auto_169454 ?auto_169455 ?auto_169456 ?auto_169457 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_169470 - BLOCK
      ?auto_169471 - BLOCK
      ?auto_169472 - BLOCK
      ?auto_169473 - BLOCK
      ?auto_169474 - BLOCK
      ?auto_169475 - BLOCK
      ?auto_169476 - BLOCK
      ?auto_169477 - BLOCK
      ?auto_169478 - BLOCK
      ?auto_169479 - BLOCK
      ?auto_169480 - BLOCK
      ?auto_169481 - BLOCK
    )
    :vars
    (
      ?auto_169482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_169470 ?auto_169471 ) ) ( not ( = ?auto_169470 ?auto_169472 ) ) ( not ( = ?auto_169470 ?auto_169473 ) ) ( not ( = ?auto_169470 ?auto_169474 ) ) ( not ( = ?auto_169470 ?auto_169475 ) ) ( not ( = ?auto_169470 ?auto_169476 ) ) ( not ( = ?auto_169470 ?auto_169477 ) ) ( not ( = ?auto_169470 ?auto_169478 ) ) ( not ( = ?auto_169470 ?auto_169479 ) ) ( not ( = ?auto_169470 ?auto_169480 ) ) ( not ( = ?auto_169470 ?auto_169481 ) ) ( not ( = ?auto_169471 ?auto_169472 ) ) ( not ( = ?auto_169471 ?auto_169473 ) ) ( not ( = ?auto_169471 ?auto_169474 ) ) ( not ( = ?auto_169471 ?auto_169475 ) ) ( not ( = ?auto_169471 ?auto_169476 ) ) ( not ( = ?auto_169471 ?auto_169477 ) ) ( not ( = ?auto_169471 ?auto_169478 ) ) ( not ( = ?auto_169471 ?auto_169479 ) ) ( not ( = ?auto_169471 ?auto_169480 ) ) ( not ( = ?auto_169471 ?auto_169481 ) ) ( not ( = ?auto_169472 ?auto_169473 ) ) ( not ( = ?auto_169472 ?auto_169474 ) ) ( not ( = ?auto_169472 ?auto_169475 ) ) ( not ( = ?auto_169472 ?auto_169476 ) ) ( not ( = ?auto_169472 ?auto_169477 ) ) ( not ( = ?auto_169472 ?auto_169478 ) ) ( not ( = ?auto_169472 ?auto_169479 ) ) ( not ( = ?auto_169472 ?auto_169480 ) ) ( not ( = ?auto_169472 ?auto_169481 ) ) ( not ( = ?auto_169473 ?auto_169474 ) ) ( not ( = ?auto_169473 ?auto_169475 ) ) ( not ( = ?auto_169473 ?auto_169476 ) ) ( not ( = ?auto_169473 ?auto_169477 ) ) ( not ( = ?auto_169473 ?auto_169478 ) ) ( not ( = ?auto_169473 ?auto_169479 ) ) ( not ( = ?auto_169473 ?auto_169480 ) ) ( not ( = ?auto_169473 ?auto_169481 ) ) ( not ( = ?auto_169474 ?auto_169475 ) ) ( not ( = ?auto_169474 ?auto_169476 ) ) ( not ( = ?auto_169474 ?auto_169477 ) ) ( not ( = ?auto_169474 ?auto_169478 ) ) ( not ( = ?auto_169474 ?auto_169479 ) ) ( not ( = ?auto_169474 ?auto_169480 ) ) ( not ( = ?auto_169474 ?auto_169481 ) ) ( not ( = ?auto_169475 ?auto_169476 ) ) ( not ( = ?auto_169475 ?auto_169477 ) ) ( not ( = ?auto_169475 ?auto_169478 ) ) ( not ( = ?auto_169475 ?auto_169479 ) ) ( not ( = ?auto_169475 ?auto_169480 ) ) ( not ( = ?auto_169475 ?auto_169481 ) ) ( not ( = ?auto_169476 ?auto_169477 ) ) ( not ( = ?auto_169476 ?auto_169478 ) ) ( not ( = ?auto_169476 ?auto_169479 ) ) ( not ( = ?auto_169476 ?auto_169480 ) ) ( not ( = ?auto_169476 ?auto_169481 ) ) ( not ( = ?auto_169477 ?auto_169478 ) ) ( not ( = ?auto_169477 ?auto_169479 ) ) ( not ( = ?auto_169477 ?auto_169480 ) ) ( not ( = ?auto_169477 ?auto_169481 ) ) ( not ( = ?auto_169478 ?auto_169479 ) ) ( not ( = ?auto_169478 ?auto_169480 ) ) ( not ( = ?auto_169478 ?auto_169481 ) ) ( not ( = ?auto_169479 ?auto_169480 ) ) ( not ( = ?auto_169479 ?auto_169481 ) ) ( not ( = ?auto_169480 ?auto_169481 ) ) ( ON ?auto_169470 ?auto_169482 ) ( not ( = ?auto_169481 ?auto_169482 ) ) ( not ( = ?auto_169480 ?auto_169482 ) ) ( not ( = ?auto_169479 ?auto_169482 ) ) ( not ( = ?auto_169478 ?auto_169482 ) ) ( not ( = ?auto_169477 ?auto_169482 ) ) ( not ( = ?auto_169476 ?auto_169482 ) ) ( not ( = ?auto_169475 ?auto_169482 ) ) ( not ( = ?auto_169474 ?auto_169482 ) ) ( not ( = ?auto_169473 ?auto_169482 ) ) ( not ( = ?auto_169472 ?auto_169482 ) ) ( not ( = ?auto_169471 ?auto_169482 ) ) ( not ( = ?auto_169470 ?auto_169482 ) ) ( ON ?auto_169471 ?auto_169470 ) ( ON ?auto_169472 ?auto_169471 ) ( ON ?auto_169473 ?auto_169472 ) ( ON ?auto_169474 ?auto_169473 ) ( ON ?auto_169475 ?auto_169474 ) ( ON ?auto_169476 ?auto_169475 ) ( ON ?auto_169477 ?auto_169476 ) ( ON ?auto_169478 ?auto_169477 ) ( ON ?auto_169479 ?auto_169478 ) ( ON ?auto_169480 ?auto_169479 ) ( ON ?auto_169481 ?auto_169480 ) ( CLEAR ?auto_169481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_169481 ?auto_169480 ?auto_169479 ?auto_169478 ?auto_169477 ?auto_169476 ?auto_169475 ?auto_169474 ?auto_169473 ?auto_169472 ?auto_169471 ?auto_169470 )
      ( MAKE-12PILE ?auto_169470 ?auto_169471 ?auto_169472 ?auto_169473 ?auto_169474 ?auto_169475 ?auto_169476 ?auto_169477 ?auto_169478 ?auto_169479 ?auto_169480 ?auto_169481 ) )
  )

)

