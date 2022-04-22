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
      ?auto_4873 - BLOCK
      ?auto_4874 - BLOCK
      ?auto_4875 - BLOCK
    )
    :vars
    (
      ?auto_4876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4876 ?auto_4875 ) ( CLEAR ?auto_4876 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4873 ) ( ON ?auto_4874 ?auto_4873 ) ( ON ?auto_4875 ?auto_4874 ) ( not ( = ?auto_4873 ?auto_4874 ) ) ( not ( = ?auto_4873 ?auto_4875 ) ) ( not ( = ?auto_4873 ?auto_4876 ) ) ( not ( = ?auto_4874 ?auto_4875 ) ) ( not ( = ?auto_4874 ?auto_4876 ) ) ( not ( = ?auto_4875 ?auto_4876 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4876 ?auto_4875 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4878 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4878 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4879 - BLOCK
    )
    :vars
    (
      ?auto_4880 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4879 ?auto_4880 ) ( CLEAR ?auto_4879 ) ( HAND-EMPTY ) ( not ( = ?auto_4879 ?auto_4880 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4879 ?auto_4880 )
      ( MAKE-1PILE ?auto_4879 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4883 - BLOCK
      ?auto_4884 - BLOCK
    )
    :vars
    (
      ?auto_4885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4885 ?auto_4884 ) ( CLEAR ?auto_4885 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4883 ) ( ON ?auto_4884 ?auto_4883 ) ( not ( = ?auto_4883 ?auto_4884 ) ) ( not ( = ?auto_4883 ?auto_4885 ) ) ( not ( = ?auto_4884 ?auto_4885 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4885 ?auto_4884 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4886 - BLOCK
      ?auto_4887 - BLOCK
    )
    :vars
    (
      ?auto_4888 - BLOCK
      ?auto_4889 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4888 ?auto_4887 ) ( CLEAR ?auto_4888 ) ( ON-TABLE ?auto_4886 ) ( ON ?auto_4887 ?auto_4886 ) ( not ( = ?auto_4886 ?auto_4887 ) ) ( not ( = ?auto_4886 ?auto_4888 ) ) ( not ( = ?auto_4887 ?auto_4888 ) ) ( HOLDING ?auto_4889 ) ( not ( = ?auto_4886 ?auto_4889 ) ) ( not ( = ?auto_4887 ?auto_4889 ) ) ( not ( = ?auto_4888 ?auto_4889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4889 )
      ( MAKE-2PILE ?auto_4886 ?auto_4887 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4890 - BLOCK
      ?auto_4891 - BLOCK
    )
    :vars
    (
      ?auto_4892 - BLOCK
      ?auto_4893 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4892 ?auto_4891 ) ( ON-TABLE ?auto_4890 ) ( ON ?auto_4891 ?auto_4890 ) ( not ( = ?auto_4890 ?auto_4891 ) ) ( not ( = ?auto_4890 ?auto_4892 ) ) ( not ( = ?auto_4891 ?auto_4892 ) ) ( not ( = ?auto_4890 ?auto_4893 ) ) ( not ( = ?auto_4891 ?auto_4893 ) ) ( not ( = ?auto_4892 ?auto_4893 ) ) ( ON ?auto_4893 ?auto_4892 ) ( CLEAR ?auto_4893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4890 ?auto_4891 ?auto_4892 )
      ( MAKE-2PILE ?auto_4890 ?auto_4891 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4896 - BLOCK
      ?auto_4897 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4897 ) ( CLEAR ?auto_4896 ) ( ON-TABLE ?auto_4896 ) ( not ( = ?auto_4896 ?auto_4897 ) ) )
    :subtasks
    ( ( !STACK ?auto_4897 ?auto_4896 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4898 - BLOCK
      ?auto_4899 - BLOCK
    )
    :vars
    (
      ?auto_4900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4898 ) ( ON-TABLE ?auto_4898 ) ( not ( = ?auto_4898 ?auto_4899 ) ) ( ON ?auto_4899 ?auto_4900 ) ( CLEAR ?auto_4899 ) ( HAND-EMPTY ) ( not ( = ?auto_4898 ?auto_4900 ) ) ( not ( = ?auto_4899 ?auto_4900 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4899 ?auto_4900 )
      ( MAKE-2PILE ?auto_4898 ?auto_4899 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4901 - BLOCK
      ?auto_4902 - BLOCK
    )
    :vars
    (
      ?auto_4903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4901 ?auto_4902 ) ) ( ON ?auto_4902 ?auto_4903 ) ( CLEAR ?auto_4902 ) ( not ( = ?auto_4901 ?auto_4903 ) ) ( not ( = ?auto_4902 ?auto_4903 ) ) ( HOLDING ?auto_4901 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4901 )
      ( MAKE-2PILE ?auto_4901 ?auto_4902 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4904 - BLOCK
      ?auto_4905 - BLOCK
    )
    :vars
    (
      ?auto_4906 - BLOCK
      ?auto_4907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4904 ?auto_4905 ) ) ( ON ?auto_4905 ?auto_4906 ) ( not ( = ?auto_4904 ?auto_4906 ) ) ( not ( = ?auto_4905 ?auto_4906 ) ) ( ON ?auto_4904 ?auto_4905 ) ( CLEAR ?auto_4904 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4907 ) ( ON ?auto_4906 ?auto_4907 ) ( not ( = ?auto_4907 ?auto_4906 ) ) ( not ( = ?auto_4907 ?auto_4905 ) ) ( not ( = ?auto_4907 ?auto_4904 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4907 ?auto_4906 ?auto_4905 )
      ( MAKE-2PILE ?auto_4904 ?auto_4905 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4909 - BLOCK
    )
    :vars
    (
      ?auto_4910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4910 ?auto_4909 ) ( CLEAR ?auto_4910 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4909 ) ( not ( = ?auto_4909 ?auto_4910 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4910 ?auto_4909 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4911 - BLOCK
    )
    :vars
    (
      ?auto_4912 - BLOCK
      ?auto_4913 - BLOCK
      ?auto_4914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4912 ?auto_4911 ) ( CLEAR ?auto_4912 ) ( ON-TABLE ?auto_4911 ) ( not ( = ?auto_4911 ?auto_4912 ) ) ( HOLDING ?auto_4913 ) ( CLEAR ?auto_4914 ) ( not ( = ?auto_4911 ?auto_4913 ) ) ( not ( = ?auto_4911 ?auto_4914 ) ) ( not ( = ?auto_4912 ?auto_4913 ) ) ( not ( = ?auto_4912 ?auto_4914 ) ) ( not ( = ?auto_4913 ?auto_4914 ) ) )
    :subtasks
    ( ( !STACK ?auto_4913 ?auto_4914 )
      ( MAKE-1PILE ?auto_4911 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4915 - BLOCK
    )
    :vars
    (
      ?auto_4917 - BLOCK
      ?auto_4918 - BLOCK
      ?auto_4916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4917 ?auto_4915 ) ( ON-TABLE ?auto_4915 ) ( not ( = ?auto_4915 ?auto_4917 ) ) ( CLEAR ?auto_4918 ) ( not ( = ?auto_4915 ?auto_4916 ) ) ( not ( = ?auto_4915 ?auto_4918 ) ) ( not ( = ?auto_4917 ?auto_4916 ) ) ( not ( = ?auto_4917 ?auto_4918 ) ) ( not ( = ?auto_4916 ?auto_4918 ) ) ( ON ?auto_4916 ?auto_4917 ) ( CLEAR ?auto_4916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4915 ?auto_4917 )
      ( MAKE-1PILE ?auto_4915 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4919 - BLOCK
    )
    :vars
    (
      ?auto_4921 - BLOCK
      ?auto_4922 - BLOCK
      ?auto_4920 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4921 ?auto_4919 ) ( ON-TABLE ?auto_4919 ) ( not ( = ?auto_4919 ?auto_4921 ) ) ( not ( = ?auto_4919 ?auto_4922 ) ) ( not ( = ?auto_4919 ?auto_4920 ) ) ( not ( = ?auto_4921 ?auto_4922 ) ) ( not ( = ?auto_4921 ?auto_4920 ) ) ( not ( = ?auto_4922 ?auto_4920 ) ) ( ON ?auto_4922 ?auto_4921 ) ( CLEAR ?auto_4922 ) ( HOLDING ?auto_4920 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4920 )
      ( MAKE-1PILE ?auto_4919 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4923 - BLOCK
    )
    :vars
    (
      ?auto_4925 - BLOCK
      ?auto_4926 - BLOCK
      ?auto_4924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4925 ?auto_4923 ) ( ON-TABLE ?auto_4923 ) ( not ( = ?auto_4923 ?auto_4925 ) ) ( not ( = ?auto_4923 ?auto_4926 ) ) ( not ( = ?auto_4923 ?auto_4924 ) ) ( not ( = ?auto_4925 ?auto_4926 ) ) ( not ( = ?auto_4925 ?auto_4924 ) ) ( not ( = ?auto_4926 ?auto_4924 ) ) ( ON ?auto_4926 ?auto_4925 ) ( ON ?auto_4924 ?auto_4926 ) ( CLEAR ?auto_4924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4923 ?auto_4925 ?auto_4926 )
      ( MAKE-1PILE ?auto_4923 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4930 - BLOCK
      ?auto_4931 - BLOCK
      ?auto_4932 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4932 ) ( CLEAR ?auto_4931 ) ( ON-TABLE ?auto_4930 ) ( ON ?auto_4931 ?auto_4930 ) ( not ( = ?auto_4930 ?auto_4931 ) ) ( not ( = ?auto_4930 ?auto_4932 ) ) ( not ( = ?auto_4931 ?auto_4932 ) ) )
    :subtasks
    ( ( !STACK ?auto_4932 ?auto_4931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4933 - BLOCK
      ?auto_4934 - BLOCK
      ?auto_4935 - BLOCK
    )
    :vars
    (
      ?auto_4936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4934 ) ( ON-TABLE ?auto_4933 ) ( ON ?auto_4934 ?auto_4933 ) ( not ( = ?auto_4933 ?auto_4934 ) ) ( not ( = ?auto_4933 ?auto_4935 ) ) ( not ( = ?auto_4934 ?auto_4935 ) ) ( ON ?auto_4935 ?auto_4936 ) ( CLEAR ?auto_4935 ) ( HAND-EMPTY ) ( not ( = ?auto_4933 ?auto_4936 ) ) ( not ( = ?auto_4934 ?auto_4936 ) ) ( not ( = ?auto_4935 ?auto_4936 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4935 ?auto_4936 )
      ( MAKE-3PILE ?auto_4933 ?auto_4934 ?auto_4935 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4937 - BLOCK
      ?auto_4938 - BLOCK
      ?auto_4939 - BLOCK
    )
    :vars
    (
      ?auto_4940 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4937 ) ( not ( = ?auto_4937 ?auto_4938 ) ) ( not ( = ?auto_4937 ?auto_4939 ) ) ( not ( = ?auto_4938 ?auto_4939 ) ) ( ON ?auto_4939 ?auto_4940 ) ( CLEAR ?auto_4939 ) ( not ( = ?auto_4937 ?auto_4940 ) ) ( not ( = ?auto_4938 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4940 ) ) ( HOLDING ?auto_4938 ) ( CLEAR ?auto_4937 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4937 ?auto_4938 )
      ( MAKE-3PILE ?auto_4937 ?auto_4938 ?auto_4939 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4941 - BLOCK
      ?auto_4942 - BLOCK
      ?auto_4943 - BLOCK
    )
    :vars
    (
      ?auto_4944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4941 ) ( not ( = ?auto_4941 ?auto_4942 ) ) ( not ( = ?auto_4941 ?auto_4943 ) ) ( not ( = ?auto_4942 ?auto_4943 ) ) ( ON ?auto_4943 ?auto_4944 ) ( not ( = ?auto_4941 ?auto_4944 ) ) ( not ( = ?auto_4942 ?auto_4944 ) ) ( not ( = ?auto_4943 ?auto_4944 ) ) ( CLEAR ?auto_4941 ) ( ON ?auto_4942 ?auto_4943 ) ( CLEAR ?auto_4942 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4944 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4944 ?auto_4943 )
      ( MAKE-3PILE ?auto_4941 ?auto_4942 ?auto_4943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4945 - BLOCK
      ?auto_4946 - BLOCK
      ?auto_4947 - BLOCK
    )
    :vars
    (
      ?auto_4948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4945 ?auto_4946 ) ) ( not ( = ?auto_4945 ?auto_4947 ) ) ( not ( = ?auto_4946 ?auto_4947 ) ) ( ON ?auto_4947 ?auto_4948 ) ( not ( = ?auto_4945 ?auto_4948 ) ) ( not ( = ?auto_4946 ?auto_4948 ) ) ( not ( = ?auto_4947 ?auto_4948 ) ) ( ON ?auto_4946 ?auto_4947 ) ( CLEAR ?auto_4946 ) ( ON-TABLE ?auto_4948 ) ( HOLDING ?auto_4945 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4945 )
      ( MAKE-3PILE ?auto_4945 ?auto_4946 ?auto_4947 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4949 - BLOCK
      ?auto_4950 - BLOCK
      ?auto_4951 - BLOCK
    )
    :vars
    (
      ?auto_4952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( ON ?auto_4951 ?auto_4952 ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4952 ) ) ( ON ?auto_4950 ?auto_4951 ) ( ON-TABLE ?auto_4952 ) ( ON ?auto_4949 ?auto_4950 ) ( CLEAR ?auto_4949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4952 ?auto_4951 ?auto_4950 )
      ( MAKE-3PILE ?auto_4949 ?auto_4950 ?auto_4951 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4955 - BLOCK
      ?auto_4956 - BLOCK
    )
    :vars
    (
      ?auto_4957 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4957 ?auto_4956 ) ( CLEAR ?auto_4957 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4955 ) ( ON ?auto_4956 ?auto_4955 ) ( not ( = ?auto_4955 ?auto_4956 ) ) ( not ( = ?auto_4955 ?auto_4957 ) ) ( not ( = ?auto_4956 ?auto_4957 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4957 ?auto_4956 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4965 - BLOCK
      ?auto_4966 - BLOCK
    )
    :vars
    (
      ?auto_4967 - BLOCK
      ?auto_4968 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4965 ) ( not ( = ?auto_4965 ?auto_4966 ) ) ( not ( = ?auto_4965 ?auto_4967 ) ) ( not ( = ?auto_4966 ?auto_4967 ) ) ( ON ?auto_4967 ?auto_4968 ) ( CLEAR ?auto_4967 ) ( not ( = ?auto_4965 ?auto_4968 ) ) ( not ( = ?auto_4966 ?auto_4968 ) ) ( not ( = ?auto_4967 ?auto_4968 ) ) ( HOLDING ?auto_4966 ) ( CLEAR ?auto_4965 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4965 ?auto_4966 ?auto_4967 )
      ( MAKE-2PILE ?auto_4965 ?auto_4966 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4969 - BLOCK
      ?auto_4970 - BLOCK
    )
    :vars
    (
      ?auto_4972 - BLOCK
      ?auto_4971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4969 ) ( not ( = ?auto_4969 ?auto_4970 ) ) ( not ( = ?auto_4969 ?auto_4972 ) ) ( not ( = ?auto_4970 ?auto_4972 ) ) ( ON ?auto_4972 ?auto_4971 ) ( not ( = ?auto_4969 ?auto_4971 ) ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( not ( = ?auto_4972 ?auto_4971 ) ) ( CLEAR ?auto_4969 ) ( ON ?auto_4970 ?auto_4972 ) ( CLEAR ?auto_4970 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4971 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4971 ?auto_4972 )
      ( MAKE-2PILE ?auto_4969 ?auto_4970 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4973 - BLOCK
      ?auto_4974 - BLOCK
    )
    :vars
    (
      ?auto_4976 - BLOCK
      ?auto_4975 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4973 ?auto_4974 ) ) ( not ( = ?auto_4973 ?auto_4976 ) ) ( not ( = ?auto_4974 ?auto_4976 ) ) ( ON ?auto_4976 ?auto_4975 ) ( not ( = ?auto_4973 ?auto_4975 ) ) ( not ( = ?auto_4974 ?auto_4975 ) ) ( not ( = ?auto_4976 ?auto_4975 ) ) ( ON ?auto_4974 ?auto_4976 ) ( CLEAR ?auto_4974 ) ( ON-TABLE ?auto_4975 ) ( HOLDING ?auto_4973 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4973 )
      ( MAKE-2PILE ?auto_4973 ?auto_4974 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4977 - BLOCK
      ?auto_4978 - BLOCK
    )
    :vars
    (
      ?auto_4979 - BLOCK
      ?auto_4980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4977 ?auto_4978 ) ) ( not ( = ?auto_4977 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( ON ?auto_4979 ?auto_4980 ) ( not ( = ?auto_4977 ?auto_4980 ) ) ( not ( = ?auto_4978 ?auto_4980 ) ) ( not ( = ?auto_4979 ?auto_4980 ) ) ( ON ?auto_4978 ?auto_4979 ) ( ON-TABLE ?auto_4980 ) ( ON ?auto_4977 ?auto_4978 ) ( CLEAR ?auto_4977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4980 ?auto_4979 ?auto_4978 )
      ( MAKE-2PILE ?auto_4977 ?auto_4978 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4982 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4982 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4983 - BLOCK
    )
    :vars
    (
      ?auto_4984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4983 ?auto_4984 ) ( CLEAR ?auto_4983 ) ( HAND-EMPTY ) ( not ( = ?auto_4983 ?auto_4984 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4983 ?auto_4984 )
      ( MAKE-1PILE ?auto_4983 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4985 - BLOCK
    )
    :vars
    (
      ?auto_4986 - BLOCK
      ?auto_4987 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4985 ?auto_4986 ) ) ( HOLDING ?auto_4985 ) ( CLEAR ?auto_4986 ) ( ON-TABLE ?auto_4987 ) ( ON ?auto_4986 ?auto_4987 ) ( not ( = ?auto_4987 ?auto_4986 ) ) ( not ( = ?auto_4987 ?auto_4985 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4987 ?auto_4986 ?auto_4985 )
      ( MAKE-1PILE ?auto_4985 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4988 - BLOCK
    )
    :vars
    (
      ?auto_4990 - BLOCK
      ?auto_4989 - BLOCK
      ?auto_4991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4988 ?auto_4990 ) ) ( CLEAR ?auto_4990 ) ( ON-TABLE ?auto_4989 ) ( ON ?auto_4990 ?auto_4989 ) ( not ( = ?auto_4989 ?auto_4990 ) ) ( not ( = ?auto_4989 ?auto_4988 ) ) ( ON ?auto_4988 ?auto_4991 ) ( CLEAR ?auto_4988 ) ( HAND-EMPTY ) ( not ( = ?auto_4988 ?auto_4991 ) ) ( not ( = ?auto_4990 ?auto_4991 ) ) ( not ( = ?auto_4989 ?auto_4991 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4988 ?auto_4991 )
      ( MAKE-1PILE ?auto_4988 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4992 - BLOCK
    )
    :vars
    (
      ?auto_4993 - BLOCK
      ?auto_4994 - BLOCK
      ?auto_4995 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4992 ?auto_4993 ) ) ( ON-TABLE ?auto_4994 ) ( not ( = ?auto_4994 ?auto_4993 ) ) ( not ( = ?auto_4994 ?auto_4992 ) ) ( ON ?auto_4992 ?auto_4995 ) ( CLEAR ?auto_4992 ) ( not ( = ?auto_4992 ?auto_4995 ) ) ( not ( = ?auto_4993 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_4995 ) ) ( HOLDING ?auto_4993 ) ( CLEAR ?auto_4994 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4994 ?auto_4993 )
      ( MAKE-1PILE ?auto_4992 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4996 - BLOCK
    )
    :vars
    (
      ?auto_4999 - BLOCK
      ?auto_4997 - BLOCK
      ?auto_4998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4996 ?auto_4999 ) ) ( ON-TABLE ?auto_4997 ) ( not ( = ?auto_4997 ?auto_4999 ) ) ( not ( = ?auto_4997 ?auto_4996 ) ) ( ON ?auto_4996 ?auto_4998 ) ( not ( = ?auto_4996 ?auto_4998 ) ) ( not ( = ?auto_4999 ?auto_4998 ) ) ( not ( = ?auto_4997 ?auto_4998 ) ) ( CLEAR ?auto_4997 ) ( ON ?auto_4999 ?auto_4996 ) ( CLEAR ?auto_4999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4998 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4998 ?auto_4996 )
      ( MAKE-1PILE ?auto_4996 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5000 - BLOCK
    )
    :vars
    (
      ?auto_5001 - BLOCK
      ?auto_5003 - BLOCK
      ?auto_5002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5000 ?auto_5001 ) ) ( not ( = ?auto_5003 ?auto_5001 ) ) ( not ( = ?auto_5003 ?auto_5000 ) ) ( ON ?auto_5000 ?auto_5002 ) ( not ( = ?auto_5000 ?auto_5002 ) ) ( not ( = ?auto_5001 ?auto_5002 ) ) ( not ( = ?auto_5003 ?auto_5002 ) ) ( ON ?auto_5001 ?auto_5000 ) ( CLEAR ?auto_5001 ) ( ON-TABLE ?auto_5002 ) ( HOLDING ?auto_5003 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5003 )
      ( MAKE-1PILE ?auto_5000 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5004 - BLOCK
    )
    :vars
    (
      ?auto_5005 - BLOCK
      ?auto_5007 - BLOCK
      ?auto_5006 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5004 ?auto_5005 ) ) ( not ( = ?auto_5007 ?auto_5005 ) ) ( not ( = ?auto_5007 ?auto_5004 ) ) ( ON ?auto_5004 ?auto_5006 ) ( not ( = ?auto_5004 ?auto_5006 ) ) ( not ( = ?auto_5005 ?auto_5006 ) ) ( not ( = ?auto_5007 ?auto_5006 ) ) ( ON ?auto_5005 ?auto_5004 ) ( ON-TABLE ?auto_5006 ) ( ON ?auto_5007 ?auto_5005 ) ( CLEAR ?auto_5007 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5006 ?auto_5004 ?auto_5005 )
      ( MAKE-1PILE ?auto_5004 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5009 - BLOCK
    )
    :vars
    (
      ?auto_5010 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5010 ?auto_5009 ) ( CLEAR ?auto_5010 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5009 ) ( not ( = ?auto_5009 ?auto_5010 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5010 ?auto_5009 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5011 - BLOCK
    )
    :vars
    (
      ?auto_5012 - BLOCK
      ?auto_5013 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5012 ?auto_5011 ) ( CLEAR ?auto_5012 ) ( ON-TABLE ?auto_5011 ) ( not ( = ?auto_5011 ?auto_5012 ) ) ( HOLDING ?auto_5013 ) ( not ( = ?auto_5011 ?auto_5013 ) ) ( not ( = ?auto_5012 ?auto_5013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5013 )
      ( MAKE-1PILE ?auto_5011 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5014 - BLOCK
    )
    :vars
    (
      ?auto_5016 - BLOCK
      ?auto_5015 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5016 ?auto_5014 ) ( ON-TABLE ?auto_5014 ) ( not ( = ?auto_5014 ?auto_5016 ) ) ( not ( = ?auto_5014 ?auto_5015 ) ) ( not ( = ?auto_5016 ?auto_5015 ) ) ( ON ?auto_5015 ?auto_5016 ) ( CLEAR ?auto_5015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5014 ?auto_5016 )
      ( MAKE-1PILE ?auto_5014 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5017 - BLOCK
    )
    :vars
    (
      ?auto_5019 - BLOCK
      ?auto_5018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5019 ?auto_5017 ) ( ON-TABLE ?auto_5017 ) ( not ( = ?auto_5017 ?auto_5019 ) ) ( not ( = ?auto_5017 ?auto_5018 ) ) ( not ( = ?auto_5019 ?auto_5018 ) ) ( HOLDING ?auto_5018 ) ( CLEAR ?auto_5019 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5017 ?auto_5019 ?auto_5018 )
      ( MAKE-1PILE ?auto_5017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5020 - BLOCK
    )
    :vars
    (
      ?auto_5022 - BLOCK
      ?auto_5021 - BLOCK
      ?auto_5023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5022 ?auto_5020 ) ( ON-TABLE ?auto_5020 ) ( not ( = ?auto_5020 ?auto_5022 ) ) ( not ( = ?auto_5020 ?auto_5021 ) ) ( not ( = ?auto_5022 ?auto_5021 ) ) ( CLEAR ?auto_5022 ) ( ON ?auto_5021 ?auto_5023 ) ( CLEAR ?auto_5021 ) ( HAND-EMPTY ) ( not ( = ?auto_5020 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( not ( = ?auto_5021 ?auto_5023 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5021 ?auto_5023 )
      ( MAKE-1PILE ?auto_5020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5032 - BLOCK
    )
    :vars
    (
      ?auto_5033 - BLOCK
      ?auto_5034 - BLOCK
      ?auto_5035 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5032 ?auto_5033 ) ) ( not ( = ?auto_5032 ?auto_5034 ) ) ( not ( = ?auto_5033 ?auto_5034 ) ) ( ON ?auto_5034 ?auto_5035 ) ( not ( = ?auto_5032 ?auto_5035 ) ) ( not ( = ?auto_5033 ?auto_5035 ) ) ( not ( = ?auto_5034 ?auto_5035 ) ) ( ON ?auto_5033 ?auto_5034 ) ( CLEAR ?auto_5033 ) ( HOLDING ?auto_5032 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5032 ?auto_5033 )
      ( MAKE-1PILE ?auto_5032 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5036 - BLOCK
    )
    :vars
    (
      ?auto_5038 - BLOCK
      ?auto_5037 - BLOCK
      ?auto_5039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5036 ?auto_5038 ) ) ( not ( = ?auto_5036 ?auto_5037 ) ) ( not ( = ?auto_5038 ?auto_5037 ) ) ( ON ?auto_5037 ?auto_5039 ) ( not ( = ?auto_5036 ?auto_5039 ) ) ( not ( = ?auto_5038 ?auto_5039 ) ) ( not ( = ?auto_5037 ?auto_5039 ) ) ( ON ?auto_5038 ?auto_5037 ) ( ON ?auto_5036 ?auto_5038 ) ( CLEAR ?auto_5036 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5039 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5039 ?auto_5037 ?auto_5038 )
      ( MAKE-1PILE ?auto_5036 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5042 - BLOCK
      ?auto_5043 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5043 ) ( CLEAR ?auto_5042 ) ( ON-TABLE ?auto_5042 ) ( not ( = ?auto_5042 ?auto_5043 ) ) )
    :subtasks
    ( ( !STACK ?auto_5043 ?auto_5042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5044 - BLOCK
      ?auto_5045 - BLOCK
    )
    :vars
    (
      ?auto_5046 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5044 ) ( ON-TABLE ?auto_5044 ) ( not ( = ?auto_5044 ?auto_5045 ) ) ( ON ?auto_5045 ?auto_5046 ) ( CLEAR ?auto_5045 ) ( HAND-EMPTY ) ( not ( = ?auto_5044 ?auto_5046 ) ) ( not ( = ?auto_5045 ?auto_5046 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5045 ?auto_5046 )
      ( MAKE-2PILE ?auto_5044 ?auto_5045 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5047 - BLOCK
      ?auto_5048 - BLOCK
    )
    :vars
    (
      ?auto_5049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5047 ?auto_5048 ) ) ( ON ?auto_5048 ?auto_5049 ) ( CLEAR ?auto_5048 ) ( not ( = ?auto_5047 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( HOLDING ?auto_5047 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5047 )
      ( MAKE-2PILE ?auto_5047 ?auto_5048 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5050 - BLOCK
      ?auto_5051 - BLOCK
    )
    :vars
    (
      ?auto_5052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5050 ?auto_5051 ) ) ( ON ?auto_5051 ?auto_5052 ) ( not ( = ?auto_5050 ?auto_5052 ) ) ( not ( = ?auto_5051 ?auto_5052 ) ) ( ON ?auto_5050 ?auto_5051 ) ( CLEAR ?auto_5050 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5052 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5052 ?auto_5051 )
      ( MAKE-2PILE ?auto_5050 ?auto_5051 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5053 - BLOCK
      ?auto_5054 - BLOCK
    )
    :vars
    (
      ?auto_5055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5053 ?auto_5054 ) ) ( ON ?auto_5054 ?auto_5055 ) ( not ( = ?auto_5053 ?auto_5055 ) ) ( not ( = ?auto_5054 ?auto_5055 ) ) ( ON-TABLE ?auto_5055 ) ( HOLDING ?auto_5053 ) ( CLEAR ?auto_5054 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5055 ?auto_5054 ?auto_5053 )
      ( MAKE-2PILE ?auto_5053 ?auto_5054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5056 - BLOCK
      ?auto_5057 - BLOCK
    )
    :vars
    (
      ?auto_5058 - BLOCK
      ?auto_5059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5056 ?auto_5057 ) ) ( ON ?auto_5057 ?auto_5058 ) ( not ( = ?auto_5056 ?auto_5058 ) ) ( not ( = ?auto_5057 ?auto_5058 ) ) ( ON-TABLE ?auto_5058 ) ( CLEAR ?auto_5057 ) ( ON ?auto_5056 ?auto_5059 ) ( CLEAR ?auto_5056 ) ( HAND-EMPTY ) ( not ( = ?auto_5056 ?auto_5059 ) ) ( not ( = ?auto_5057 ?auto_5059 ) ) ( not ( = ?auto_5058 ?auto_5059 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5056 ?auto_5059 )
      ( MAKE-2PILE ?auto_5056 ?auto_5057 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5060 - BLOCK
      ?auto_5061 - BLOCK
    )
    :vars
    (
      ?auto_5062 - BLOCK
      ?auto_5063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5060 ?auto_5061 ) ) ( not ( = ?auto_5060 ?auto_5062 ) ) ( not ( = ?auto_5061 ?auto_5062 ) ) ( ON-TABLE ?auto_5062 ) ( ON ?auto_5060 ?auto_5063 ) ( CLEAR ?auto_5060 ) ( not ( = ?auto_5060 ?auto_5063 ) ) ( not ( = ?auto_5061 ?auto_5063 ) ) ( not ( = ?auto_5062 ?auto_5063 ) ) ( HOLDING ?auto_5061 ) ( CLEAR ?auto_5062 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5062 ?auto_5061 )
      ( MAKE-2PILE ?auto_5060 ?auto_5061 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5064 - BLOCK
      ?auto_5065 - BLOCK
    )
    :vars
    (
      ?auto_5067 - BLOCK
      ?auto_5066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5064 ?auto_5065 ) ) ( not ( = ?auto_5064 ?auto_5067 ) ) ( not ( = ?auto_5065 ?auto_5067 ) ) ( ON-TABLE ?auto_5067 ) ( ON ?auto_5064 ?auto_5066 ) ( not ( = ?auto_5064 ?auto_5066 ) ) ( not ( = ?auto_5065 ?auto_5066 ) ) ( not ( = ?auto_5067 ?auto_5066 ) ) ( CLEAR ?auto_5067 ) ( ON ?auto_5065 ?auto_5064 ) ( CLEAR ?auto_5065 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5066 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5066 ?auto_5064 )
      ( MAKE-2PILE ?auto_5064 ?auto_5065 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5068 - BLOCK
      ?auto_5069 - BLOCK
    )
    :vars
    (
      ?auto_5070 - BLOCK
      ?auto_5071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5068 ?auto_5069 ) ) ( not ( = ?auto_5068 ?auto_5070 ) ) ( not ( = ?auto_5069 ?auto_5070 ) ) ( ON ?auto_5068 ?auto_5071 ) ( not ( = ?auto_5068 ?auto_5071 ) ) ( not ( = ?auto_5069 ?auto_5071 ) ) ( not ( = ?auto_5070 ?auto_5071 ) ) ( ON ?auto_5069 ?auto_5068 ) ( CLEAR ?auto_5069 ) ( ON-TABLE ?auto_5071 ) ( HOLDING ?auto_5070 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5070 )
      ( MAKE-2PILE ?auto_5068 ?auto_5069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5072 - BLOCK
      ?auto_5073 - BLOCK
    )
    :vars
    (
      ?auto_5074 - BLOCK
      ?auto_5075 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5072 ?auto_5073 ) ) ( not ( = ?auto_5072 ?auto_5074 ) ) ( not ( = ?auto_5073 ?auto_5074 ) ) ( ON ?auto_5072 ?auto_5075 ) ( not ( = ?auto_5072 ?auto_5075 ) ) ( not ( = ?auto_5073 ?auto_5075 ) ) ( not ( = ?auto_5074 ?auto_5075 ) ) ( ON ?auto_5073 ?auto_5072 ) ( ON-TABLE ?auto_5075 ) ( ON ?auto_5074 ?auto_5073 ) ( CLEAR ?auto_5074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5075 ?auto_5072 ?auto_5073 )
      ( MAKE-2PILE ?auto_5072 ?auto_5073 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5079 - BLOCK
      ?auto_5080 - BLOCK
      ?auto_5081 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5081 ) ( CLEAR ?auto_5080 ) ( ON-TABLE ?auto_5079 ) ( ON ?auto_5080 ?auto_5079 ) ( not ( = ?auto_5079 ?auto_5080 ) ) ( not ( = ?auto_5079 ?auto_5081 ) ) ( not ( = ?auto_5080 ?auto_5081 ) ) )
    :subtasks
    ( ( !STACK ?auto_5081 ?auto_5080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5082 - BLOCK
      ?auto_5083 - BLOCK
      ?auto_5084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5083 ) ( ON-TABLE ?auto_5082 ) ( ON ?auto_5083 ?auto_5082 ) ( not ( = ?auto_5082 ?auto_5083 ) ) ( not ( = ?auto_5082 ?auto_5084 ) ) ( not ( = ?auto_5083 ?auto_5084 ) ) ( ON-TABLE ?auto_5084 ) ( CLEAR ?auto_5084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_5084 )
      ( MAKE-3PILE ?auto_5082 ?auto_5083 ?auto_5084 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5085 - BLOCK
      ?auto_5086 - BLOCK
      ?auto_5087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5085 ) ( not ( = ?auto_5085 ?auto_5086 ) ) ( not ( = ?auto_5085 ?auto_5087 ) ) ( not ( = ?auto_5086 ?auto_5087 ) ) ( ON-TABLE ?auto_5087 ) ( CLEAR ?auto_5087 ) ( HOLDING ?auto_5086 ) ( CLEAR ?auto_5085 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5085 ?auto_5086 )
      ( MAKE-3PILE ?auto_5085 ?auto_5086 ?auto_5087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5088 - BLOCK
      ?auto_5089 - BLOCK
      ?auto_5090 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5088 ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( not ( = ?auto_5088 ?auto_5090 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( ON-TABLE ?auto_5090 ) ( CLEAR ?auto_5088 ) ( ON ?auto_5089 ?auto_5090 ) ( CLEAR ?auto_5089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5090 )
      ( MAKE-3PILE ?auto_5088 ?auto_5089 ?auto_5090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5091 - BLOCK
      ?auto_5092 - BLOCK
      ?auto_5093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5091 ?auto_5092 ) ) ( not ( = ?auto_5091 ?auto_5093 ) ) ( not ( = ?auto_5092 ?auto_5093 ) ) ( ON-TABLE ?auto_5093 ) ( ON ?auto_5092 ?auto_5093 ) ( CLEAR ?auto_5092 ) ( HOLDING ?auto_5091 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5091 )
      ( MAKE-3PILE ?auto_5091 ?auto_5092 ?auto_5093 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5094 - BLOCK
      ?auto_5095 - BLOCK
      ?auto_5096 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5094 ?auto_5095 ) ) ( not ( = ?auto_5094 ?auto_5096 ) ) ( not ( = ?auto_5095 ?auto_5096 ) ) ( ON-TABLE ?auto_5096 ) ( ON ?auto_5095 ?auto_5096 ) ( ON ?auto_5094 ?auto_5095 ) ( CLEAR ?auto_5094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5096 ?auto_5095 )
      ( MAKE-3PILE ?auto_5094 ?auto_5095 ?auto_5096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5097 - BLOCK
      ?auto_5098 - BLOCK
      ?auto_5099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5097 ?auto_5098 ) ) ( not ( = ?auto_5097 ?auto_5099 ) ) ( not ( = ?auto_5098 ?auto_5099 ) ) ( ON-TABLE ?auto_5099 ) ( ON ?auto_5098 ?auto_5099 ) ( HOLDING ?auto_5097 ) ( CLEAR ?auto_5098 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5099 ?auto_5098 ?auto_5097 )
      ( MAKE-3PILE ?auto_5097 ?auto_5098 ?auto_5099 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5100 - BLOCK
      ?auto_5101 - BLOCK
      ?auto_5102 - BLOCK
    )
    :vars
    (
      ?auto_5103 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5100 ?auto_5101 ) ) ( not ( = ?auto_5100 ?auto_5102 ) ) ( not ( = ?auto_5101 ?auto_5102 ) ) ( ON-TABLE ?auto_5102 ) ( ON ?auto_5101 ?auto_5102 ) ( CLEAR ?auto_5101 ) ( ON ?auto_5100 ?auto_5103 ) ( CLEAR ?auto_5100 ) ( HAND-EMPTY ) ( not ( = ?auto_5100 ?auto_5103 ) ) ( not ( = ?auto_5101 ?auto_5103 ) ) ( not ( = ?auto_5102 ?auto_5103 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5100 ?auto_5103 )
      ( MAKE-3PILE ?auto_5100 ?auto_5101 ?auto_5102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5104 - BLOCK
      ?auto_5105 - BLOCK
      ?auto_5106 - BLOCK
    )
    :vars
    (
      ?auto_5107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5104 ?auto_5105 ) ) ( not ( = ?auto_5104 ?auto_5106 ) ) ( not ( = ?auto_5105 ?auto_5106 ) ) ( ON-TABLE ?auto_5106 ) ( ON ?auto_5104 ?auto_5107 ) ( CLEAR ?auto_5104 ) ( not ( = ?auto_5104 ?auto_5107 ) ) ( not ( = ?auto_5105 ?auto_5107 ) ) ( not ( = ?auto_5106 ?auto_5107 ) ) ( HOLDING ?auto_5105 ) ( CLEAR ?auto_5106 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5106 ?auto_5105 )
      ( MAKE-3PILE ?auto_5104 ?auto_5105 ?auto_5106 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5108 - BLOCK
      ?auto_5109 - BLOCK
      ?auto_5110 - BLOCK
    )
    :vars
    (
      ?auto_5111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5108 ?auto_5109 ) ) ( not ( = ?auto_5108 ?auto_5110 ) ) ( not ( = ?auto_5109 ?auto_5110 ) ) ( ON-TABLE ?auto_5110 ) ( ON ?auto_5108 ?auto_5111 ) ( not ( = ?auto_5108 ?auto_5111 ) ) ( not ( = ?auto_5109 ?auto_5111 ) ) ( not ( = ?auto_5110 ?auto_5111 ) ) ( CLEAR ?auto_5110 ) ( ON ?auto_5109 ?auto_5108 ) ( CLEAR ?auto_5109 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5111 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5111 ?auto_5108 )
      ( MAKE-3PILE ?auto_5108 ?auto_5109 ?auto_5110 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5112 - BLOCK
      ?auto_5113 - BLOCK
      ?auto_5114 - BLOCK
    )
    :vars
    (
      ?auto_5115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5112 ?auto_5113 ) ) ( not ( = ?auto_5112 ?auto_5114 ) ) ( not ( = ?auto_5113 ?auto_5114 ) ) ( ON ?auto_5112 ?auto_5115 ) ( not ( = ?auto_5112 ?auto_5115 ) ) ( not ( = ?auto_5113 ?auto_5115 ) ) ( not ( = ?auto_5114 ?auto_5115 ) ) ( ON ?auto_5113 ?auto_5112 ) ( CLEAR ?auto_5113 ) ( ON-TABLE ?auto_5115 ) ( HOLDING ?auto_5114 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5114 )
      ( MAKE-3PILE ?auto_5112 ?auto_5113 ?auto_5114 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5116 - BLOCK
      ?auto_5117 - BLOCK
      ?auto_5118 - BLOCK
    )
    :vars
    (
      ?auto_5119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5116 ?auto_5117 ) ) ( not ( = ?auto_5116 ?auto_5118 ) ) ( not ( = ?auto_5117 ?auto_5118 ) ) ( ON ?auto_5116 ?auto_5119 ) ( not ( = ?auto_5116 ?auto_5119 ) ) ( not ( = ?auto_5117 ?auto_5119 ) ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( ON ?auto_5117 ?auto_5116 ) ( ON-TABLE ?auto_5119 ) ( ON ?auto_5118 ?auto_5117 ) ( CLEAR ?auto_5118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5119 ?auto_5116 ?auto_5117 )
      ( MAKE-3PILE ?auto_5116 ?auto_5117 ?auto_5118 ) )
  )

)

