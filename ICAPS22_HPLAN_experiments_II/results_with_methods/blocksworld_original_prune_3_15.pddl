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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4813 - BLOCK
      ?auto_4814 - BLOCK
      ?auto_4815 - BLOCK
    )
    :vars
    (
      ?auto_4816 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4816 ?auto_4815 ) ( CLEAR ?auto_4816 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4813 ) ( ON ?auto_4814 ?auto_4813 ) ( ON ?auto_4815 ?auto_4814 ) ( not ( = ?auto_4813 ?auto_4814 ) ) ( not ( = ?auto_4813 ?auto_4815 ) ) ( not ( = ?auto_4813 ?auto_4816 ) ) ( not ( = ?auto_4814 ?auto_4815 ) ) ( not ( = ?auto_4814 ?auto_4816 ) ) ( not ( = ?auto_4815 ?auto_4816 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4816 ?auto_4815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4818 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4818 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4819 - BLOCK
    )
    :vars
    (
      ?auto_4820 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4819 ?auto_4820 ) ( CLEAR ?auto_4819 ) ( HAND-EMPTY ) ( not ( = ?auto_4819 ?auto_4820 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4819 ?auto_4820 )
      ( MAKE-1PILE ?auto_4819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4823 - BLOCK
      ?auto_4824 - BLOCK
    )
    :vars
    (
      ?auto_4825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4825 ?auto_4824 ) ( CLEAR ?auto_4825 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4823 ) ( ON ?auto_4824 ?auto_4823 ) ( not ( = ?auto_4823 ?auto_4824 ) ) ( not ( = ?auto_4823 ?auto_4825 ) ) ( not ( = ?auto_4824 ?auto_4825 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4825 ?auto_4824 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4826 - BLOCK
      ?auto_4827 - BLOCK
    )
    :vars
    (
      ?auto_4828 - BLOCK
      ?auto_4829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4828 ?auto_4827 ) ( CLEAR ?auto_4828 ) ( ON-TABLE ?auto_4826 ) ( ON ?auto_4827 ?auto_4826 ) ( not ( = ?auto_4826 ?auto_4827 ) ) ( not ( = ?auto_4826 ?auto_4828 ) ) ( not ( = ?auto_4827 ?auto_4828 ) ) ( HOLDING ?auto_4829 ) ( not ( = ?auto_4826 ?auto_4829 ) ) ( not ( = ?auto_4827 ?auto_4829 ) ) ( not ( = ?auto_4828 ?auto_4829 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4829 )
      ( MAKE-2PILE ?auto_4826 ?auto_4827 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4830 - BLOCK
      ?auto_4831 - BLOCK
    )
    :vars
    (
      ?auto_4833 - BLOCK
      ?auto_4832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4833 ?auto_4831 ) ( ON-TABLE ?auto_4830 ) ( ON ?auto_4831 ?auto_4830 ) ( not ( = ?auto_4830 ?auto_4831 ) ) ( not ( = ?auto_4830 ?auto_4833 ) ) ( not ( = ?auto_4831 ?auto_4833 ) ) ( not ( = ?auto_4830 ?auto_4832 ) ) ( not ( = ?auto_4831 ?auto_4832 ) ) ( not ( = ?auto_4833 ?auto_4832 ) ) ( ON ?auto_4832 ?auto_4833 ) ( CLEAR ?auto_4832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4830 ?auto_4831 ?auto_4833 )
      ( MAKE-2PILE ?auto_4830 ?auto_4831 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4836 - BLOCK
      ?auto_4837 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4837 ) ( CLEAR ?auto_4836 ) ( ON-TABLE ?auto_4836 ) ( not ( = ?auto_4836 ?auto_4837 ) ) )
    :subtasks
    ( ( !STACK ?auto_4837 ?auto_4836 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4838 - BLOCK
      ?auto_4839 - BLOCK
    )
    :vars
    (
      ?auto_4840 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4838 ) ( ON-TABLE ?auto_4838 ) ( not ( = ?auto_4838 ?auto_4839 ) ) ( ON ?auto_4839 ?auto_4840 ) ( CLEAR ?auto_4839 ) ( HAND-EMPTY ) ( not ( = ?auto_4838 ?auto_4840 ) ) ( not ( = ?auto_4839 ?auto_4840 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4839 ?auto_4840 )
      ( MAKE-2PILE ?auto_4838 ?auto_4839 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4841 - BLOCK
      ?auto_4842 - BLOCK
    )
    :vars
    (
      ?auto_4843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4841 ?auto_4842 ) ) ( ON ?auto_4842 ?auto_4843 ) ( CLEAR ?auto_4842 ) ( not ( = ?auto_4841 ?auto_4843 ) ) ( not ( = ?auto_4842 ?auto_4843 ) ) ( HOLDING ?auto_4841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4841 )
      ( MAKE-2PILE ?auto_4841 ?auto_4842 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4844 - BLOCK
      ?auto_4845 - BLOCK
    )
    :vars
    (
      ?auto_4846 - BLOCK
      ?auto_4847 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4844 ?auto_4845 ) ) ( ON ?auto_4845 ?auto_4846 ) ( not ( = ?auto_4844 ?auto_4846 ) ) ( not ( = ?auto_4845 ?auto_4846 ) ) ( ON ?auto_4844 ?auto_4845 ) ( CLEAR ?auto_4844 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4847 ) ( ON ?auto_4846 ?auto_4847 ) ( not ( = ?auto_4847 ?auto_4846 ) ) ( not ( = ?auto_4847 ?auto_4845 ) ) ( not ( = ?auto_4847 ?auto_4844 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4847 ?auto_4846 ?auto_4845 )
      ( MAKE-2PILE ?auto_4844 ?auto_4845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4849 - BLOCK
    )
    :vars
    (
      ?auto_4850 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4850 ?auto_4849 ) ( CLEAR ?auto_4850 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4849 ) ( not ( = ?auto_4849 ?auto_4850 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4850 ?auto_4849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4851 - BLOCK
    )
    :vars
    (
      ?auto_4852 - BLOCK
      ?auto_4853 - BLOCK
      ?auto_4854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4852 ?auto_4851 ) ( CLEAR ?auto_4852 ) ( ON-TABLE ?auto_4851 ) ( not ( = ?auto_4851 ?auto_4852 ) ) ( HOLDING ?auto_4853 ) ( CLEAR ?auto_4854 ) ( not ( = ?auto_4851 ?auto_4853 ) ) ( not ( = ?auto_4851 ?auto_4854 ) ) ( not ( = ?auto_4852 ?auto_4853 ) ) ( not ( = ?auto_4852 ?auto_4854 ) ) ( not ( = ?auto_4853 ?auto_4854 ) ) )
    :subtasks
    ( ( !STACK ?auto_4853 ?auto_4854 )
      ( MAKE-1PILE ?auto_4851 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4941 - BLOCK
    )
    :vars
    (
      ?auto_4942 - BLOCK
      ?auto_4943 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4942 ?auto_4941 ) ( ON-TABLE ?auto_4941 ) ( not ( = ?auto_4941 ?auto_4942 ) ) ( not ( = ?auto_4941 ?auto_4943 ) ) ( not ( = ?auto_4942 ?auto_4943 ) ) ( ON ?auto_4943 ?auto_4942 ) ( CLEAR ?auto_4943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4941 ?auto_4942 )
      ( MAKE-1PILE ?auto_4941 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4859 - BLOCK
    )
    :vars
    (
      ?auto_4860 - BLOCK
      ?auto_4862 - BLOCK
      ?auto_4861 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4860 ?auto_4859 ) ( ON-TABLE ?auto_4859 ) ( not ( = ?auto_4859 ?auto_4860 ) ) ( not ( = ?auto_4859 ?auto_4862 ) ) ( not ( = ?auto_4859 ?auto_4861 ) ) ( not ( = ?auto_4860 ?auto_4862 ) ) ( not ( = ?auto_4860 ?auto_4861 ) ) ( not ( = ?auto_4862 ?auto_4861 ) ) ( ON ?auto_4862 ?auto_4860 ) ( CLEAR ?auto_4862 ) ( HOLDING ?auto_4861 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4861 )
      ( MAKE-1PILE ?auto_4859 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4863 - BLOCK
    )
    :vars
    (
      ?auto_4865 - BLOCK
      ?auto_4864 - BLOCK
      ?auto_4866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4865 ?auto_4863 ) ( ON-TABLE ?auto_4863 ) ( not ( = ?auto_4863 ?auto_4865 ) ) ( not ( = ?auto_4863 ?auto_4864 ) ) ( not ( = ?auto_4863 ?auto_4866 ) ) ( not ( = ?auto_4865 ?auto_4864 ) ) ( not ( = ?auto_4865 ?auto_4866 ) ) ( not ( = ?auto_4864 ?auto_4866 ) ) ( ON ?auto_4864 ?auto_4865 ) ( ON ?auto_4866 ?auto_4864 ) ( CLEAR ?auto_4866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4863 ?auto_4865 ?auto_4864 )
      ( MAKE-1PILE ?auto_4863 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4870 - BLOCK
      ?auto_4871 - BLOCK
      ?auto_4872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4872 ) ( CLEAR ?auto_4871 ) ( ON-TABLE ?auto_4870 ) ( ON ?auto_4871 ?auto_4870 ) ( not ( = ?auto_4870 ?auto_4871 ) ) ( not ( = ?auto_4870 ?auto_4872 ) ) ( not ( = ?auto_4871 ?auto_4872 ) ) )
    :subtasks
    ( ( !STACK ?auto_4872 ?auto_4871 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4873 - BLOCK
      ?auto_4874 - BLOCK
      ?auto_4875 - BLOCK
    )
    :vars
    (
      ?auto_4876 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4874 ) ( ON-TABLE ?auto_4873 ) ( ON ?auto_4874 ?auto_4873 ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( ON ?auto_4875 ?auto_4876 ) ( CLEAR ?auto_4875 ) ( HAND-EMPTY ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4875 ?auto_4876 )
      ( MAKE-3PILE ?auto_4873 ?auto_4874 ?auto_4875 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4877 - BLOCK
      ?auto_4878 - BLOCK
      ?auto_4879 - BLOCK
    )
    :vars
    (
      ?auto_4880 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4877 ) ( not ( = ?auto_4877 ?auto_4878 ) ) ( not ( = ?auto_4877 ?auto_4879 ) ) ( not ( = ?auto_4878 ?auto_4879 ) ) ( ON ?auto_4879 ?auto_4880 ) ( CLEAR ?auto_4879 ) ( not ( = ?auto_4877 ?auto_4880 ) ) ( not ( = ?auto_4878 ?auto_4880 ) ) ( not ( = ?auto_4879 ?auto_4880 ) ) ( HOLDING ?auto_4878 ) ( CLEAR ?auto_4877 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4877 ?auto_4878 )
      ( MAKE-3PILE ?auto_4877 ?auto_4878 ?auto_4879 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4881 - BLOCK
      ?auto_4882 - BLOCK
      ?auto_4883 - BLOCK
    )
    :vars
    (
      ?auto_4884 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4881 ) ( not ( = ?auto_4881 ?auto_4882 ) ) ( not ( = ?auto_4881 ?auto_4883 ) ) ( not ( = ?auto_4882 ?auto_4883 ) ) ( ON ?auto_4883 ?auto_4884 ) ( not ( = ?auto_4881 ?auto_4884 ) ) ( not ( = ?auto_4882 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( CLEAR ?auto_4881 ) ( ON ?auto_4882 ?auto_4883 ) ( CLEAR ?auto_4882 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4884 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4884 ?auto_4883 )
      ( MAKE-3PILE ?auto_4881 ?auto_4882 ?auto_4883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4885 - BLOCK
      ?auto_4886 - BLOCK
      ?auto_4887 - BLOCK
    )
    :vars
    (
      ?auto_4888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4885 ?auto_4886 ) ) ( not ( = ?auto_4885 ?auto_4887 ) ) ( not ( = ?auto_4886 ?auto_4887 ) ) ( ON ?auto_4887 ?auto_4888 ) ( not ( = ?auto_4885 ?auto_4888 ) ) ( not ( = ?auto_4886 ?auto_4888 ) ) ( not ( = ?auto_4887 ?auto_4888 ) ) ( ON ?auto_4886 ?auto_4887 ) ( CLEAR ?auto_4886 ) ( ON-TABLE ?auto_4888 ) ( HOLDING ?auto_4885 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4885 )
      ( MAKE-3PILE ?auto_4885 ?auto_4886 ?auto_4887 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4889 - BLOCK
      ?auto_4890 - BLOCK
      ?auto_4891 - BLOCK
    )
    :vars
    (
      ?auto_4892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4889 ?auto_4890 ) ) ( not ( = ?auto_4889 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4891 ) ) ( ON ?auto_4891 ?auto_4892 ) ( not ( = ?auto_4889 ?auto_4892 ) ) ( not ( = ?auto_4890 ?auto_4892 ) ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( ON ?auto_4890 ?auto_4891 ) ( ON-TABLE ?auto_4892 ) ( ON ?auto_4889 ?auto_4890 ) ( CLEAR ?auto_4889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4892 ?auto_4891 ?auto_4890 )
      ( MAKE-3PILE ?auto_4889 ?auto_4890 ?auto_4891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4919 - BLOCK
    )
    :vars
    (
      ?auto_4920 - BLOCK
      ?auto_4921 - BLOCK
      ?auto_4922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4919 ?auto_4920 ) ( CLEAR ?auto_4919 ) ( not ( = ?auto_4919 ?auto_4920 ) ) ( HOLDING ?auto_4921 ) ( CLEAR ?auto_4922 ) ( not ( = ?auto_4919 ?auto_4921 ) ) ( not ( = ?auto_4919 ?auto_4922 ) ) ( not ( = ?auto_4920 ?auto_4921 ) ) ( not ( = ?auto_4920 ?auto_4922 ) ) ( not ( = ?auto_4921 ?auto_4922 ) ) )
    :subtasks
    ( ( !STACK ?auto_4921 ?auto_4922 )
      ( MAKE-1PILE ?auto_4919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4923 - BLOCK
    )
    :vars
    (
      ?auto_4924 - BLOCK
      ?auto_4926 - BLOCK
      ?auto_4925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4923 ?auto_4924 ) ( not ( = ?auto_4923 ?auto_4924 ) ) ( CLEAR ?auto_4926 ) ( not ( = ?auto_4923 ?auto_4925 ) ) ( not ( = ?auto_4923 ?auto_4926 ) ) ( not ( = ?auto_4924 ?auto_4925 ) ) ( not ( = ?auto_4924 ?auto_4926 ) ) ( not ( = ?auto_4925 ?auto_4926 ) ) ( ON ?auto_4925 ?auto_4923 ) ( CLEAR ?auto_4925 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4924 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4924 ?auto_4923 )
      ( MAKE-1PILE ?auto_4923 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4927 - BLOCK
    )
    :vars
    (
      ?auto_4930 - BLOCK
      ?auto_4928 - BLOCK
      ?auto_4929 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4927 ?auto_4930 ) ( not ( = ?auto_4927 ?auto_4930 ) ) ( not ( = ?auto_4927 ?auto_4928 ) ) ( not ( = ?auto_4927 ?auto_4929 ) ) ( not ( = ?auto_4930 ?auto_4928 ) ) ( not ( = ?auto_4930 ?auto_4929 ) ) ( not ( = ?auto_4928 ?auto_4929 ) ) ( ON ?auto_4928 ?auto_4927 ) ( CLEAR ?auto_4928 ) ( ON-TABLE ?auto_4930 ) ( HOLDING ?auto_4929 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4929 )
      ( MAKE-1PILE ?auto_4927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4931 - BLOCK
    )
    :vars
    (
      ?auto_4934 - BLOCK
      ?auto_4933 - BLOCK
      ?auto_4932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4931 ?auto_4934 ) ( not ( = ?auto_4931 ?auto_4934 ) ) ( not ( = ?auto_4931 ?auto_4933 ) ) ( not ( = ?auto_4931 ?auto_4932 ) ) ( not ( = ?auto_4934 ?auto_4933 ) ) ( not ( = ?auto_4934 ?auto_4932 ) ) ( not ( = ?auto_4933 ?auto_4932 ) ) ( ON ?auto_4933 ?auto_4931 ) ( ON-TABLE ?auto_4934 ) ( ON ?auto_4932 ?auto_4933 ) ( CLEAR ?auto_4932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4934 ?auto_4931 ?auto_4933 )
      ( MAKE-1PILE ?auto_4931 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4938 - BLOCK
    )
    :vars
    (
      ?auto_4939 - BLOCK
      ?auto_4940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4939 ?auto_4938 ) ( CLEAR ?auto_4939 ) ( ON-TABLE ?auto_4938 ) ( not ( = ?auto_4938 ?auto_4939 ) ) ( HOLDING ?auto_4940 ) ( not ( = ?auto_4938 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4940 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4940 )
      ( MAKE-1PILE ?auto_4938 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4963 - BLOCK
      ?auto_4964 - BLOCK
    )
    :vars
    (
      ?auto_4965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4963 ?auto_4964 ) ) ( ON ?auto_4964 ?auto_4965 ) ( not ( = ?auto_4963 ?auto_4965 ) ) ( not ( = ?auto_4964 ?auto_4965 ) ) ( ON ?auto_4963 ?auto_4964 ) ( CLEAR ?auto_4963 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4965 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4965 ?auto_4964 )
      ( MAKE-2PILE ?auto_4963 ?auto_4964 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4968 - BLOCK
      ?auto_4969 - BLOCK
    )
    :vars
    (
      ?auto_4970 - BLOCK
      ?auto_4971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4968 ?auto_4969 ) ) ( ON ?auto_4969 ?auto_4970 ) ( CLEAR ?auto_4969 ) ( not ( = ?auto_4968 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( ON ?auto_4968 ?auto_4971 ) ( CLEAR ?auto_4968 ) ( HAND-EMPTY ) ( not ( = ?auto_4968 ?auto_4971 ) ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( not ( = ?auto_4970 ?auto_4971 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4968 ?auto_4971 )
      ( MAKE-2PILE ?auto_4968 ?auto_4969 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4972 - BLOCK
      ?auto_4973 - BLOCK
    )
    :vars
    (
      ?auto_4975 - BLOCK
      ?auto_4974 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4972 ?auto_4973 ) ) ( not ( = ?auto_4972 ?auto_4975 ) ) ( not ( = ?auto_4973 ?auto_4975 ) ) ( ON ?auto_4972 ?auto_4974 ) ( CLEAR ?auto_4972 ) ( not ( = ?auto_4972 ?auto_4974 ) ) ( not ( = ?auto_4973 ?auto_4974 ) ) ( not ( = ?auto_4975 ?auto_4974 ) ) ( HOLDING ?auto_4973 ) ( CLEAR ?auto_4975 ) ( ON-TABLE ?auto_4975 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4975 ?auto_4973 )
      ( MAKE-2PILE ?auto_4972 ?auto_4973 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4976 - BLOCK
      ?auto_4977 - BLOCK
    )
    :vars
    (
      ?auto_4978 - BLOCK
      ?auto_4979 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4976 ?auto_4977 ) ) ( not ( = ?auto_4976 ?auto_4978 ) ) ( not ( = ?auto_4977 ?auto_4978 ) ) ( ON ?auto_4976 ?auto_4979 ) ( not ( = ?auto_4976 ?auto_4979 ) ) ( not ( = ?auto_4977 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( CLEAR ?auto_4978 ) ( ON-TABLE ?auto_4978 ) ( ON ?auto_4977 ?auto_4976 ) ( CLEAR ?auto_4977 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4979 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4979 ?auto_4976 )
      ( MAKE-2PILE ?auto_4976 ?auto_4977 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4980 - BLOCK
      ?auto_4981 - BLOCK
    )
    :vars
    (
      ?auto_4983 - BLOCK
      ?auto_4982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4980 ?auto_4981 ) ) ( not ( = ?auto_4980 ?auto_4983 ) ) ( not ( = ?auto_4981 ?auto_4983 ) ) ( ON ?auto_4980 ?auto_4982 ) ( not ( = ?auto_4980 ?auto_4982 ) ) ( not ( = ?auto_4981 ?auto_4982 ) ) ( not ( = ?auto_4983 ?auto_4982 ) ) ( ON ?auto_4981 ?auto_4980 ) ( CLEAR ?auto_4981 ) ( ON-TABLE ?auto_4982 ) ( HOLDING ?auto_4983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4983 )
      ( MAKE-2PILE ?auto_4980 ?auto_4981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4984 - BLOCK
      ?auto_4985 - BLOCK
    )
    :vars
    (
      ?auto_4987 - BLOCK
      ?auto_4986 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4984 ?auto_4985 ) ) ( not ( = ?auto_4984 ?auto_4987 ) ) ( not ( = ?auto_4985 ?auto_4987 ) ) ( ON ?auto_4984 ?auto_4986 ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4985 ?auto_4986 ) ) ( not ( = ?auto_4987 ?auto_4986 ) ) ( ON ?auto_4985 ?auto_4984 ) ( ON-TABLE ?auto_4986 ) ( ON ?auto_4987 ?auto_4985 ) ( CLEAR ?auto_4987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4986 ?auto_4984 ?auto_4985 )
      ( MAKE-2PILE ?auto_4984 ?auto_4985 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4994 - BLOCK
      ?auto_4995 - BLOCK
      ?auto_4996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4995 ) ( ON-TABLE ?auto_4994 ) ( ON ?auto_4995 ?auto_4994 ) ( not ( = ?auto_4994 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) ( not ( = ?auto_4995 ?auto_4996 ) ) ( ON-TABLE ?auto_4996 ) ( CLEAR ?auto_4996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4996 )
      ( MAKE-3PILE ?auto_4994 ?auto_4995 ?auto_4996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4997 - BLOCK
      ?auto_4998 - BLOCK
      ?auto_4999 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4997 ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_4998 ?auto_4999 ) ) ( ON-TABLE ?auto_4999 ) ( CLEAR ?auto_4999 ) ( HOLDING ?auto_4998 ) ( CLEAR ?auto_4997 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4997 ?auto_4998 )
      ( MAKE-3PILE ?auto_4997 ?auto_4998 ?auto_4999 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5000 - BLOCK
      ?auto_5001 - BLOCK
      ?auto_5002 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5000 ) ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5000 ?auto_5002 ) ) ( not ( = ?auto_5001 ?auto_5002 ) ) ( ON-TABLE ?auto_5002 ) ( CLEAR ?auto_5000 ) ( ON ?auto_5001 ?auto_5002 ) ( CLEAR ?auto_5001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5002 )
      ( MAKE-3PILE ?auto_5000 ?auto_5001 ?auto_5002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5003 - BLOCK
      ?auto_5004 - BLOCK
      ?auto_5005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5003 ?auto_5004 ) ) ( not ( = ?auto_5003 ?auto_5005 ) ) ( not ( = ?auto_5004 ?auto_5005 ) ) ( ON-TABLE ?auto_5005 ) ( ON ?auto_5004 ?auto_5005 ) ( CLEAR ?auto_5004 ) ( HOLDING ?auto_5003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5003 )
      ( MAKE-3PILE ?auto_5003 ?auto_5004 ?auto_5005 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5006 - BLOCK
      ?auto_5007 - BLOCK
      ?auto_5008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5006 ?auto_5007 ) ) ( not ( = ?auto_5006 ?auto_5008 ) ) ( not ( = ?auto_5007 ?auto_5008 ) ) ( ON-TABLE ?auto_5008 ) ( ON ?auto_5007 ?auto_5008 ) ( ON ?auto_5006 ?auto_5007 ) ( CLEAR ?auto_5006 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5008 ?auto_5007 )
      ( MAKE-3PILE ?auto_5006 ?auto_5007 ?auto_5008 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5012 - BLOCK
      ?auto_5013 - BLOCK
      ?auto_5014 - BLOCK
    )
    :vars
    (
      ?auto_5015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5012 ?auto_5013 ) ) ( not ( = ?auto_5012 ?auto_5014 ) ) ( not ( = ?auto_5013 ?auto_5014 ) ) ( ON-TABLE ?auto_5014 ) ( ON ?auto_5013 ?auto_5014 ) ( CLEAR ?auto_5013 ) ( ON ?auto_5012 ?auto_5015 ) ( CLEAR ?auto_5012 ) ( HAND-EMPTY ) ( not ( = ?auto_5012 ?auto_5015 ) ) ( not ( = ?auto_5013 ?auto_5015 ) ) ( not ( = ?auto_5014 ?auto_5015 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5012 ?auto_5015 )
      ( MAKE-3PILE ?auto_5012 ?auto_5013 ?auto_5014 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5016 - BLOCK
      ?auto_5017 - BLOCK
      ?auto_5018 - BLOCK
    )
    :vars
    (
      ?auto_5019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5016 ?auto_5017 ) ) ( not ( = ?auto_5016 ?auto_5018 ) ) ( not ( = ?auto_5017 ?auto_5018 ) ) ( ON-TABLE ?auto_5018 ) ( ON ?auto_5016 ?auto_5019 ) ( CLEAR ?auto_5016 ) ( not ( = ?auto_5016 ?auto_5019 ) ) ( not ( = ?auto_5017 ?auto_5019 ) ) ( not ( = ?auto_5018 ?auto_5019 ) ) ( HOLDING ?auto_5017 ) ( CLEAR ?auto_5018 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5018 ?auto_5017 )
      ( MAKE-3PILE ?auto_5016 ?auto_5017 ?auto_5018 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5020 - BLOCK
      ?auto_5021 - BLOCK
      ?auto_5022 - BLOCK
    )
    :vars
    (
      ?auto_5023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5020 ?auto_5021 ) ) ( not ( = ?auto_5020 ?auto_5022 ) ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( ON-TABLE ?auto_5022 ) ( ON ?auto_5020 ?auto_5023 ) ( not ( = ?auto_5020 ?auto_5023 ) ) ( not ( = ?auto_5021 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( CLEAR ?auto_5022 ) ( ON ?auto_5021 ?auto_5020 ) ( CLEAR ?auto_5021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5023 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5023 ?auto_5020 )
      ( MAKE-3PILE ?auto_5020 ?auto_5021 ?auto_5022 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5024 - BLOCK
      ?auto_5025 - BLOCK
      ?auto_5026 - BLOCK
    )
    :vars
    (
      ?auto_5027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5024 ?auto_5025 ) ) ( not ( = ?auto_5024 ?auto_5026 ) ) ( not ( = ?auto_5025 ?auto_5026 ) ) ( ON ?auto_5024 ?auto_5027 ) ( not ( = ?auto_5024 ?auto_5027 ) ) ( not ( = ?auto_5025 ?auto_5027 ) ) ( not ( = ?auto_5026 ?auto_5027 ) ) ( ON ?auto_5025 ?auto_5024 ) ( CLEAR ?auto_5025 ) ( ON-TABLE ?auto_5027 ) ( HOLDING ?auto_5026 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5026 )
      ( MAKE-3PILE ?auto_5024 ?auto_5025 ?auto_5026 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5028 - BLOCK
      ?auto_5029 - BLOCK
      ?auto_5030 - BLOCK
    )
    :vars
    (
      ?auto_5031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5028 ?auto_5029 ) ) ( not ( = ?auto_5028 ?auto_5030 ) ) ( not ( = ?auto_5029 ?auto_5030 ) ) ( ON ?auto_5028 ?auto_5031 ) ( not ( = ?auto_5028 ?auto_5031 ) ) ( not ( = ?auto_5029 ?auto_5031 ) ) ( not ( = ?auto_5030 ?auto_5031 ) ) ( ON ?auto_5029 ?auto_5028 ) ( ON-TABLE ?auto_5031 ) ( ON ?auto_5030 ?auto_5029 ) ( CLEAR ?auto_5030 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5031 ?auto_5028 ?auto_5029 )
      ( MAKE-3PILE ?auto_5028 ?auto_5029 ?auto_5030 ) )
  )

)

