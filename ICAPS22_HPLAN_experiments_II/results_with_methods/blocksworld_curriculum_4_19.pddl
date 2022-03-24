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
      ?auto_4776 - BLOCK
    )
    :vars
    (
      ?auto_4777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4776 ?auto_4777 ) ( CLEAR ?auto_4776 ) ( HAND-EMPTY ) ( not ( = ?auto_4776 ?auto_4777 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4776 ?auto_4777 )
      ( !PUTDOWN ?auto_4776 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4779 - BLOCK
    )
    :vars
    (
      ?auto_4780 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4779 ?auto_4780 ) ( CLEAR ?auto_4779 ) ( HAND-EMPTY ) ( not ( = ?auto_4779 ?auto_4780 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4779 ?auto_4780 )
      ( !PUTDOWN ?auto_4779 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4783 - BLOCK
      ?auto_4784 - BLOCK
    )
    :vars
    (
      ?auto_4785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4783 ) ( ON ?auto_4784 ?auto_4785 ) ( CLEAR ?auto_4784 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4783 ) ( not ( = ?auto_4783 ?auto_4784 ) ) ( not ( = ?auto_4783 ?auto_4785 ) ) ( not ( = ?auto_4784 ?auto_4785 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4784 ?auto_4785 )
      ( !STACK ?auto_4784 ?auto_4783 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4788 - BLOCK
      ?auto_4789 - BLOCK
    )
    :vars
    (
      ?auto_4790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4788 ) ( ON ?auto_4789 ?auto_4790 ) ( CLEAR ?auto_4789 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4788 ) ( not ( = ?auto_4788 ?auto_4789 ) ) ( not ( = ?auto_4788 ?auto_4790 ) ) ( not ( = ?auto_4789 ?auto_4790 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4789 ?auto_4790 )
      ( !STACK ?auto_4789 ?auto_4788 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4793 - BLOCK
      ?auto_4794 - BLOCK
    )
    :vars
    (
      ?auto_4795 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4794 ?auto_4795 ) ( not ( = ?auto_4793 ?auto_4794 ) ) ( not ( = ?auto_4793 ?auto_4795 ) ) ( not ( = ?auto_4794 ?auto_4795 ) ) ( ON ?auto_4793 ?auto_4794 ) ( CLEAR ?auto_4793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4793 )
      ( MAKE-2PILE ?auto_4793 ?auto_4794 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4798 - BLOCK
      ?auto_4799 - BLOCK
    )
    :vars
    (
      ?auto_4800 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4799 ?auto_4800 ) ( not ( = ?auto_4798 ?auto_4799 ) ) ( not ( = ?auto_4798 ?auto_4800 ) ) ( not ( = ?auto_4799 ?auto_4800 ) ) ( ON ?auto_4798 ?auto_4799 ) ( CLEAR ?auto_4798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4798 )
      ( MAKE-2PILE ?auto_4798 ?auto_4799 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4804 - BLOCK
      ?auto_4805 - BLOCK
      ?auto_4806 - BLOCK
    )
    :vars
    (
      ?auto_4807 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4805 ) ( ON ?auto_4806 ?auto_4807 ) ( CLEAR ?auto_4806 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4804 ) ( ON ?auto_4805 ?auto_4804 ) ( not ( = ?auto_4804 ?auto_4805 ) ) ( not ( = ?auto_4804 ?auto_4806 ) ) ( not ( = ?auto_4804 ?auto_4807 ) ) ( not ( = ?auto_4805 ?auto_4806 ) ) ( not ( = ?auto_4805 ?auto_4807 ) ) ( not ( = ?auto_4806 ?auto_4807 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4806 ?auto_4807 )
      ( !STACK ?auto_4806 ?auto_4805 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4811 - BLOCK
      ?auto_4812 - BLOCK
      ?auto_4813 - BLOCK
    )
    :vars
    (
      ?auto_4814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4812 ) ( ON ?auto_4813 ?auto_4814 ) ( CLEAR ?auto_4813 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4811 ) ( ON ?auto_4812 ?auto_4811 ) ( not ( = ?auto_4811 ?auto_4812 ) ) ( not ( = ?auto_4811 ?auto_4813 ) ) ( not ( = ?auto_4811 ?auto_4814 ) ) ( not ( = ?auto_4812 ?auto_4813 ) ) ( not ( = ?auto_4812 ?auto_4814 ) ) ( not ( = ?auto_4813 ?auto_4814 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4813 ?auto_4814 )
      ( !STACK ?auto_4813 ?auto_4812 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4818 - BLOCK
      ?auto_4819 - BLOCK
      ?auto_4820 - BLOCK
    )
    :vars
    (
      ?auto_4821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4820 ?auto_4821 ) ( ON-TABLE ?auto_4818 ) ( not ( = ?auto_4818 ?auto_4819 ) ) ( not ( = ?auto_4818 ?auto_4820 ) ) ( not ( = ?auto_4818 ?auto_4821 ) ) ( not ( = ?auto_4819 ?auto_4820 ) ) ( not ( = ?auto_4819 ?auto_4821 ) ) ( not ( = ?auto_4820 ?auto_4821 ) ) ( CLEAR ?auto_4818 ) ( ON ?auto_4819 ?auto_4820 ) ( CLEAR ?auto_4819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4818 ?auto_4819 )
      ( MAKE-3PILE ?auto_4818 ?auto_4819 ?auto_4820 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4825 - BLOCK
      ?auto_4826 - BLOCK
      ?auto_4827 - BLOCK
    )
    :vars
    (
      ?auto_4828 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4827 ?auto_4828 ) ( ON-TABLE ?auto_4825 ) ( not ( = ?auto_4825 ?auto_4826 ) ) ( not ( = ?auto_4825 ?auto_4827 ) ) ( not ( = ?auto_4825 ?auto_4828 ) ) ( not ( = ?auto_4826 ?auto_4827 ) ) ( not ( = ?auto_4826 ?auto_4828 ) ) ( not ( = ?auto_4827 ?auto_4828 ) ) ( CLEAR ?auto_4825 ) ( ON ?auto_4826 ?auto_4827 ) ( CLEAR ?auto_4826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4825 ?auto_4826 )
      ( MAKE-3PILE ?auto_4825 ?auto_4826 ?auto_4827 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4832 - BLOCK
      ?auto_4833 - BLOCK
      ?auto_4834 - BLOCK
    )
    :vars
    (
      ?auto_4835 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4834 ?auto_4835 ) ( not ( = ?auto_4832 ?auto_4833 ) ) ( not ( = ?auto_4832 ?auto_4834 ) ) ( not ( = ?auto_4832 ?auto_4835 ) ) ( not ( = ?auto_4833 ?auto_4834 ) ) ( not ( = ?auto_4833 ?auto_4835 ) ) ( not ( = ?auto_4834 ?auto_4835 ) ) ( ON ?auto_4833 ?auto_4834 ) ( ON ?auto_4832 ?auto_4833 ) ( CLEAR ?auto_4832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4832 )
      ( MAKE-3PILE ?auto_4832 ?auto_4833 ?auto_4834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4839 - BLOCK
      ?auto_4840 - BLOCK
      ?auto_4841 - BLOCK
    )
    :vars
    (
      ?auto_4842 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4841 ?auto_4842 ) ( not ( = ?auto_4839 ?auto_4840 ) ) ( not ( = ?auto_4839 ?auto_4841 ) ) ( not ( = ?auto_4839 ?auto_4842 ) ) ( not ( = ?auto_4840 ?auto_4841 ) ) ( not ( = ?auto_4840 ?auto_4842 ) ) ( not ( = ?auto_4841 ?auto_4842 ) ) ( ON ?auto_4840 ?auto_4841 ) ( ON ?auto_4839 ?auto_4840 ) ( CLEAR ?auto_4839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4839 )
      ( MAKE-3PILE ?auto_4839 ?auto_4840 ?auto_4841 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4847 - BLOCK
      ?auto_4848 - BLOCK
      ?auto_4849 - BLOCK
      ?auto_4850 - BLOCK
    )
    :vars
    (
      ?auto_4851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4849 ) ( ON ?auto_4850 ?auto_4851 ) ( CLEAR ?auto_4850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4847 ) ( ON ?auto_4848 ?auto_4847 ) ( ON ?auto_4849 ?auto_4848 ) ( not ( = ?auto_4847 ?auto_4848 ) ) ( not ( = ?auto_4847 ?auto_4849 ) ) ( not ( = ?auto_4847 ?auto_4850 ) ) ( not ( = ?auto_4847 ?auto_4851 ) ) ( not ( = ?auto_4848 ?auto_4849 ) ) ( not ( = ?auto_4848 ?auto_4850 ) ) ( not ( = ?auto_4848 ?auto_4851 ) ) ( not ( = ?auto_4849 ?auto_4850 ) ) ( not ( = ?auto_4849 ?auto_4851 ) ) ( not ( = ?auto_4850 ?auto_4851 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4850 ?auto_4851 )
      ( !STACK ?auto_4850 ?auto_4849 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4856 - BLOCK
      ?auto_4857 - BLOCK
      ?auto_4858 - BLOCK
      ?auto_4859 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4858 ) ( ON-TABLE ?auto_4859 ) ( CLEAR ?auto_4859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4856 ) ( ON ?auto_4857 ?auto_4856 ) ( ON ?auto_4858 ?auto_4857 ) ( not ( = ?auto_4856 ?auto_4857 ) ) ( not ( = ?auto_4856 ?auto_4858 ) ) ( not ( = ?auto_4856 ?auto_4859 ) ) ( not ( = ?auto_4857 ?auto_4858 ) ) ( not ( = ?auto_4857 ?auto_4859 ) ) ( not ( = ?auto_4858 ?auto_4859 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4859 )
      ( !STACK ?auto_4859 ?auto_4858 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4864 - BLOCK
      ?auto_4865 - BLOCK
      ?auto_4866 - BLOCK
      ?auto_4867 - BLOCK
    )
    :vars
    (
      ?auto_4868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4867 ?auto_4868 ) ( ON-TABLE ?auto_4864 ) ( ON ?auto_4865 ?auto_4864 ) ( not ( = ?auto_4864 ?auto_4865 ) ) ( not ( = ?auto_4864 ?auto_4866 ) ) ( not ( = ?auto_4864 ?auto_4867 ) ) ( not ( = ?auto_4864 ?auto_4868 ) ) ( not ( = ?auto_4865 ?auto_4866 ) ) ( not ( = ?auto_4865 ?auto_4867 ) ) ( not ( = ?auto_4865 ?auto_4868 ) ) ( not ( = ?auto_4866 ?auto_4867 ) ) ( not ( = ?auto_4866 ?auto_4868 ) ) ( not ( = ?auto_4867 ?auto_4868 ) ) ( CLEAR ?auto_4865 ) ( ON ?auto_4866 ?auto_4867 ) ( CLEAR ?auto_4866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4864 ?auto_4865 ?auto_4866 )
      ( MAKE-4PILE ?auto_4864 ?auto_4865 ?auto_4866 ?auto_4867 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4873 - BLOCK
      ?auto_4874 - BLOCK
      ?auto_4875 - BLOCK
      ?auto_4876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4876 ) ( ON-TABLE ?auto_4873 ) ( ON ?auto_4874 ?auto_4873 ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4876 ) ) ( CLEAR ?auto_4874 ) ( ON ?auto_4875 ?auto_4876 ) ( CLEAR ?auto_4875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4873 ?auto_4874 ?auto_4875 )
      ( MAKE-4PILE ?auto_4873 ?auto_4874 ?auto_4875 ?auto_4876 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4881 - BLOCK
      ?auto_4882 - BLOCK
      ?auto_4883 - BLOCK
      ?auto_4884 - BLOCK
    )
    :vars
    (
      ?auto_4885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4884 ?auto_4885 ) ( ON-TABLE ?auto_4881 ) ( not ( = ?auto_4881 ?auto_4882 ) ) ( not ( = ?auto_4881 ?auto_4883 ) ) ( not ( = ?auto_4881 ?auto_4884 ) ) ( not ( = ?auto_4881 ?auto_4885 ) ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( not ( = ?auto_4882 ?auto_4884 ) ) ( not ( = ?auto_4882 ?auto_4885 ) ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4885 ) ) ( not ( = ?auto_4884 ?auto_4885 ) ) ( ON ?auto_4883 ?auto_4884 ) ( CLEAR ?auto_4881 ) ( ON ?auto_4882 ?auto_4883 ) ( CLEAR ?auto_4882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4881 ?auto_4882 )
      ( MAKE-4PILE ?auto_4881 ?auto_4882 ?auto_4883 ?auto_4884 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4890 - BLOCK
      ?auto_4891 - BLOCK
      ?auto_4892 - BLOCK
      ?auto_4893 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4893 ) ( ON-TABLE ?auto_4890 ) ( not ( = ?auto_4890 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4892 ) ) ( not ( = ?auto_4890 ?auto_4893 ) ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( not ( = ?auto_4891 ?auto_4893 ) ) ( not ( = ?auto_4892 ?auto_4893 ) ) ( ON ?auto_4892 ?auto_4893 ) ( CLEAR ?auto_4890 ) ( ON ?auto_4891 ?auto_4892 ) ( CLEAR ?auto_4891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4890 ?auto_4891 )
      ( MAKE-4PILE ?auto_4890 ?auto_4891 ?auto_4892 ?auto_4893 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4898 - BLOCK
      ?auto_4899 - BLOCK
      ?auto_4900 - BLOCK
      ?auto_4901 - BLOCK
    )
    :vars
    (
      ?auto_4902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4901 ?auto_4902 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( not ( = ?auto_4898 ?auto_4900 ) ) ( not ( = ?auto_4898 ?auto_4901 ) ) ( not ( = ?auto_4898 ?auto_4902 ) ) ( not ( = ?auto_4899 ?auto_4900 ) ) ( not ( = ?auto_4899 ?auto_4901 ) ) ( not ( = ?auto_4899 ?auto_4902 ) ) ( not ( = ?auto_4900 ?auto_4901 ) ) ( not ( = ?auto_4900 ?auto_4902 ) ) ( not ( = ?auto_4901 ?auto_4902 ) ) ( ON ?auto_4900 ?auto_4901 ) ( ON ?auto_4899 ?auto_4900 ) ( ON ?auto_4898 ?auto_4899 ) ( CLEAR ?auto_4898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4898 )
      ( MAKE-4PILE ?auto_4898 ?auto_4899 ?auto_4900 ?auto_4901 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4907 - BLOCK
      ?auto_4908 - BLOCK
      ?auto_4909 - BLOCK
      ?auto_4910 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4910 ) ( not ( = ?auto_4907 ?auto_4908 ) ) ( not ( = ?auto_4907 ?auto_4909 ) ) ( not ( = ?auto_4907 ?auto_4910 ) ) ( not ( = ?auto_4908 ?auto_4909 ) ) ( not ( = ?auto_4908 ?auto_4910 ) ) ( not ( = ?auto_4909 ?auto_4910 ) ) ( ON ?auto_4909 ?auto_4910 ) ( ON ?auto_4908 ?auto_4909 ) ( ON ?auto_4907 ?auto_4908 ) ( CLEAR ?auto_4907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4907 )
      ( MAKE-4PILE ?auto_4907 ?auto_4908 ?auto_4909 ?auto_4910 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4915 - BLOCK
      ?auto_4916 - BLOCK
      ?auto_4917 - BLOCK
      ?auto_4918 - BLOCK
    )
    :vars
    (
      ?auto_4919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4915 ?auto_4916 ) ) ( not ( = ?auto_4915 ?auto_4917 ) ) ( not ( = ?auto_4915 ?auto_4918 ) ) ( not ( = ?auto_4916 ?auto_4917 ) ) ( not ( = ?auto_4916 ?auto_4918 ) ) ( not ( = ?auto_4917 ?auto_4918 ) ) ( ON ?auto_4915 ?auto_4919 ) ( not ( = ?auto_4918 ?auto_4919 ) ) ( not ( = ?auto_4917 ?auto_4919 ) ) ( not ( = ?auto_4916 ?auto_4919 ) ) ( not ( = ?auto_4915 ?auto_4919 ) ) ( ON ?auto_4916 ?auto_4915 ) ( ON ?auto_4917 ?auto_4916 ) ( ON ?auto_4918 ?auto_4917 ) ( CLEAR ?auto_4918 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4918 ?auto_4917 ?auto_4916 ?auto_4915 )
      ( MAKE-4PILE ?auto_4915 ?auto_4916 ?auto_4917 ?auto_4918 ) )
  )

)

