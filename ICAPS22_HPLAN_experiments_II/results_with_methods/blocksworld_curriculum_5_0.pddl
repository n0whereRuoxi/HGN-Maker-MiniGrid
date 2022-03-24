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
      ?auto_4921 - BLOCK
    )
    :vars
    (
      ?auto_4922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4921 ?auto_4922 ) ( CLEAR ?auto_4921 ) ( HAND-EMPTY ) ( not ( = ?auto_4921 ?auto_4922 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4921 ?auto_4922 )
      ( !PUTDOWN ?auto_4921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4924 - BLOCK
    )
    :vars
    (
      ?auto_4925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4924 ?auto_4925 ) ( CLEAR ?auto_4924 ) ( HAND-EMPTY ) ( not ( = ?auto_4924 ?auto_4925 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4924 ?auto_4925 )
      ( !PUTDOWN ?auto_4924 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4928 - BLOCK
      ?auto_4929 - BLOCK
    )
    :vars
    (
      ?auto_4930 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4928 ) ( ON ?auto_4929 ?auto_4930 ) ( CLEAR ?auto_4929 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4928 ) ( not ( = ?auto_4928 ?auto_4929 ) ) ( not ( = ?auto_4928 ?auto_4930 ) ) ( not ( = ?auto_4929 ?auto_4930 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4929 ?auto_4930 )
      ( !STACK ?auto_4929 ?auto_4928 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4933 - BLOCK
      ?auto_4934 - BLOCK
    )
    :vars
    (
      ?auto_4935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4933 ) ( ON ?auto_4934 ?auto_4935 ) ( CLEAR ?auto_4934 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4933 ) ( not ( = ?auto_4933 ?auto_4934 ) ) ( not ( = ?auto_4933 ?auto_4935 ) ) ( not ( = ?auto_4934 ?auto_4935 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4934 ?auto_4935 )
      ( !STACK ?auto_4934 ?auto_4933 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4938 - BLOCK
      ?auto_4939 - BLOCK
    )
    :vars
    (
      ?auto_4940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4939 ?auto_4940 ) ( not ( = ?auto_4938 ?auto_4939 ) ) ( not ( = ?auto_4938 ?auto_4940 ) ) ( not ( = ?auto_4939 ?auto_4940 ) ) ( ON ?auto_4938 ?auto_4939 ) ( CLEAR ?auto_4938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4938 )
      ( MAKE-2PILE ?auto_4938 ?auto_4939 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4943 - BLOCK
      ?auto_4944 - BLOCK
    )
    :vars
    (
      ?auto_4945 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4944 ?auto_4945 ) ( not ( = ?auto_4943 ?auto_4944 ) ) ( not ( = ?auto_4943 ?auto_4945 ) ) ( not ( = ?auto_4944 ?auto_4945 ) ) ( ON ?auto_4943 ?auto_4944 ) ( CLEAR ?auto_4943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4943 )
      ( MAKE-2PILE ?auto_4943 ?auto_4944 ) )
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
    ( and ( CLEAR ?auto_4950 ) ( ON ?auto_4951 ?auto_4952 ) ( CLEAR ?auto_4951 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4949 ) ( ON ?auto_4950 ?auto_4949 ) ( not ( = ?auto_4949 ?auto_4950 ) ) ( not ( = ?auto_4949 ?auto_4951 ) ) ( not ( = ?auto_4949 ?auto_4952 ) ) ( not ( = ?auto_4950 ?auto_4951 ) ) ( not ( = ?auto_4950 ?auto_4952 ) ) ( not ( = ?auto_4951 ?auto_4952 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4951 ?auto_4952 )
      ( !STACK ?auto_4951 ?auto_4950 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4956 - BLOCK
      ?auto_4957 - BLOCK
      ?auto_4958 - BLOCK
    )
    :vars
    (
      ?auto_4959 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4957 ) ( ON ?auto_4958 ?auto_4959 ) ( CLEAR ?auto_4958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4956 ) ( ON ?auto_4957 ?auto_4956 ) ( not ( = ?auto_4956 ?auto_4957 ) ) ( not ( = ?auto_4956 ?auto_4958 ) ) ( not ( = ?auto_4956 ?auto_4959 ) ) ( not ( = ?auto_4957 ?auto_4958 ) ) ( not ( = ?auto_4957 ?auto_4959 ) ) ( not ( = ?auto_4958 ?auto_4959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4958 ?auto_4959 )
      ( !STACK ?auto_4958 ?auto_4957 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4963 - BLOCK
      ?auto_4964 - BLOCK
      ?auto_4965 - BLOCK
    )
    :vars
    (
      ?auto_4966 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4965 ?auto_4966 ) ( ON-TABLE ?auto_4963 ) ( not ( = ?auto_4963 ?auto_4964 ) ) ( not ( = ?auto_4963 ?auto_4965 ) ) ( not ( = ?auto_4963 ?auto_4966 ) ) ( not ( = ?auto_4964 ?auto_4965 ) ) ( not ( = ?auto_4964 ?auto_4966 ) ) ( not ( = ?auto_4965 ?auto_4966 ) ) ( CLEAR ?auto_4963 ) ( ON ?auto_4964 ?auto_4965 ) ( CLEAR ?auto_4964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4963 ?auto_4964 )
      ( MAKE-3PILE ?auto_4963 ?auto_4964 ?auto_4965 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4970 - BLOCK
      ?auto_4971 - BLOCK
      ?auto_4972 - BLOCK
    )
    :vars
    (
      ?auto_4973 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4972 ?auto_4973 ) ( ON-TABLE ?auto_4970 ) ( not ( = ?auto_4970 ?auto_4971 ) ) ( not ( = ?auto_4970 ?auto_4972 ) ) ( not ( = ?auto_4970 ?auto_4973 ) ) ( not ( = ?auto_4971 ?auto_4972 ) ) ( not ( = ?auto_4971 ?auto_4973 ) ) ( not ( = ?auto_4972 ?auto_4973 ) ) ( CLEAR ?auto_4970 ) ( ON ?auto_4971 ?auto_4972 ) ( CLEAR ?auto_4971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4970 ?auto_4971 )
      ( MAKE-3PILE ?auto_4970 ?auto_4971 ?auto_4972 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4977 - BLOCK
      ?auto_4978 - BLOCK
      ?auto_4979 - BLOCK
    )
    :vars
    (
      ?auto_4980 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4979 ?auto_4980 ) ( not ( = ?auto_4977 ?auto_4978 ) ) ( not ( = ?auto_4977 ?auto_4979 ) ) ( not ( = ?auto_4977 ?auto_4980 ) ) ( not ( = ?auto_4978 ?auto_4979 ) ) ( not ( = ?auto_4978 ?auto_4980 ) ) ( not ( = ?auto_4979 ?auto_4980 ) ) ( ON ?auto_4978 ?auto_4979 ) ( ON ?auto_4977 ?auto_4978 ) ( CLEAR ?auto_4977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4977 )
      ( MAKE-3PILE ?auto_4977 ?auto_4978 ?auto_4979 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4984 - BLOCK
      ?auto_4985 - BLOCK
      ?auto_4986 - BLOCK
    )
    :vars
    (
      ?auto_4987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4986 ?auto_4987 ) ( not ( = ?auto_4984 ?auto_4985 ) ) ( not ( = ?auto_4984 ?auto_4986 ) ) ( not ( = ?auto_4984 ?auto_4987 ) ) ( not ( = ?auto_4985 ?auto_4986 ) ) ( not ( = ?auto_4985 ?auto_4987 ) ) ( not ( = ?auto_4986 ?auto_4987 ) ) ( ON ?auto_4985 ?auto_4986 ) ( ON ?auto_4984 ?auto_4985 ) ( CLEAR ?auto_4984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4984 )
      ( MAKE-3PILE ?auto_4984 ?auto_4985 ?auto_4986 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4992 - BLOCK
      ?auto_4993 - BLOCK
      ?auto_4994 - BLOCK
      ?auto_4995 - BLOCK
    )
    :vars
    (
      ?auto_4996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4994 ) ( ON ?auto_4995 ?auto_4996 ) ( CLEAR ?auto_4995 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4992 ) ( ON ?auto_4993 ?auto_4992 ) ( ON ?auto_4994 ?auto_4993 ) ( not ( = ?auto_4992 ?auto_4993 ) ) ( not ( = ?auto_4992 ?auto_4994 ) ) ( not ( = ?auto_4992 ?auto_4995 ) ) ( not ( = ?auto_4992 ?auto_4996 ) ) ( not ( = ?auto_4993 ?auto_4994 ) ) ( not ( = ?auto_4993 ?auto_4995 ) ) ( not ( = ?auto_4993 ?auto_4996 ) ) ( not ( = ?auto_4994 ?auto_4995 ) ) ( not ( = ?auto_4994 ?auto_4996 ) ) ( not ( = ?auto_4995 ?auto_4996 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4995 ?auto_4996 )
      ( !STACK ?auto_4995 ?auto_4994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5001 - BLOCK
      ?auto_5002 - BLOCK
      ?auto_5003 - BLOCK
      ?auto_5004 - BLOCK
    )
    :vars
    (
      ?auto_5005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5003 ) ( ON ?auto_5004 ?auto_5005 ) ( CLEAR ?auto_5004 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5001 ) ( ON ?auto_5002 ?auto_5001 ) ( ON ?auto_5003 ?auto_5002 ) ( not ( = ?auto_5001 ?auto_5002 ) ) ( not ( = ?auto_5001 ?auto_5003 ) ) ( not ( = ?auto_5001 ?auto_5004 ) ) ( not ( = ?auto_5001 ?auto_5005 ) ) ( not ( = ?auto_5002 ?auto_5003 ) ) ( not ( = ?auto_5002 ?auto_5004 ) ) ( not ( = ?auto_5002 ?auto_5005 ) ) ( not ( = ?auto_5003 ?auto_5004 ) ) ( not ( = ?auto_5003 ?auto_5005 ) ) ( not ( = ?auto_5004 ?auto_5005 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5004 ?auto_5005 )
      ( !STACK ?auto_5004 ?auto_5003 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5010 - BLOCK
      ?auto_5011 - BLOCK
      ?auto_5012 - BLOCK
      ?auto_5013 - BLOCK
    )
    :vars
    (
      ?auto_5014 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5013 ?auto_5014 ) ( ON-TABLE ?auto_5010 ) ( ON ?auto_5011 ?auto_5010 ) ( not ( = ?auto_5010 ?auto_5011 ) ) ( not ( = ?auto_5010 ?auto_5012 ) ) ( not ( = ?auto_5010 ?auto_5013 ) ) ( not ( = ?auto_5010 ?auto_5014 ) ) ( not ( = ?auto_5011 ?auto_5012 ) ) ( not ( = ?auto_5011 ?auto_5013 ) ) ( not ( = ?auto_5011 ?auto_5014 ) ) ( not ( = ?auto_5012 ?auto_5013 ) ) ( not ( = ?auto_5012 ?auto_5014 ) ) ( not ( = ?auto_5013 ?auto_5014 ) ) ( CLEAR ?auto_5011 ) ( ON ?auto_5012 ?auto_5013 ) ( CLEAR ?auto_5012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5010 ?auto_5011 ?auto_5012 )
      ( MAKE-4PILE ?auto_5010 ?auto_5011 ?auto_5012 ?auto_5013 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5019 - BLOCK
      ?auto_5020 - BLOCK
      ?auto_5021 - BLOCK
      ?auto_5022 - BLOCK
    )
    :vars
    (
      ?auto_5023 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5022 ?auto_5023 ) ( ON-TABLE ?auto_5019 ) ( ON ?auto_5020 ?auto_5019 ) ( not ( = ?auto_5019 ?auto_5020 ) ) ( not ( = ?auto_5019 ?auto_5021 ) ) ( not ( = ?auto_5019 ?auto_5022 ) ) ( not ( = ?auto_5019 ?auto_5023 ) ) ( not ( = ?auto_5020 ?auto_5021 ) ) ( not ( = ?auto_5020 ?auto_5022 ) ) ( not ( = ?auto_5020 ?auto_5023 ) ) ( not ( = ?auto_5021 ?auto_5022 ) ) ( not ( = ?auto_5021 ?auto_5023 ) ) ( not ( = ?auto_5022 ?auto_5023 ) ) ( CLEAR ?auto_5020 ) ( ON ?auto_5021 ?auto_5022 ) ( CLEAR ?auto_5021 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5019 ?auto_5020 ?auto_5021 )
      ( MAKE-4PILE ?auto_5019 ?auto_5020 ?auto_5021 ?auto_5022 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5028 - BLOCK
      ?auto_5029 - BLOCK
      ?auto_5030 - BLOCK
      ?auto_5031 - BLOCK
    )
    :vars
    (
      ?auto_5032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5031 ?auto_5032 ) ( ON-TABLE ?auto_5028 ) ( not ( = ?auto_5028 ?auto_5029 ) ) ( not ( = ?auto_5028 ?auto_5030 ) ) ( not ( = ?auto_5028 ?auto_5031 ) ) ( not ( = ?auto_5028 ?auto_5032 ) ) ( not ( = ?auto_5029 ?auto_5030 ) ) ( not ( = ?auto_5029 ?auto_5031 ) ) ( not ( = ?auto_5029 ?auto_5032 ) ) ( not ( = ?auto_5030 ?auto_5031 ) ) ( not ( = ?auto_5030 ?auto_5032 ) ) ( not ( = ?auto_5031 ?auto_5032 ) ) ( ON ?auto_5030 ?auto_5031 ) ( CLEAR ?auto_5028 ) ( ON ?auto_5029 ?auto_5030 ) ( CLEAR ?auto_5029 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5028 ?auto_5029 )
      ( MAKE-4PILE ?auto_5028 ?auto_5029 ?auto_5030 ?auto_5031 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5037 - BLOCK
      ?auto_5038 - BLOCK
      ?auto_5039 - BLOCK
      ?auto_5040 - BLOCK
    )
    :vars
    (
      ?auto_5041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5040 ?auto_5041 ) ( ON-TABLE ?auto_5037 ) ( not ( = ?auto_5037 ?auto_5038 ) ) ( not ( = ?auto_5037 ?auto_5039 ) ) ( not ( = ?auto_5037 ?auto_5040 ) ) ( not ( = ?auto_5037 ?auto_5041 ) ) ( not ( = ?auto_5038 ?auto_5039 ) ) ( not ( = ?auto_5038 ?auto_5040 ) ) ( not ( = ?auto_5038 ?auto_5041 ) ) ( not ( = ?auto_5039 ?auto_5040 ) ) ( not ( = ?auto_5039 ?auto_5041 ) ) ( not ( = ?auto_5040 ?auto_5041 ) ) ( ON ?auto_5039 ?auto_5040 ) ( CLEAR ?auto_5037 ) ( ON ?auto_5038 ?auto_5039 ) ( CLEAR ?auto_5038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5037 ?auto_5038 )
      ( MAKE-4PILE ?auto_5037 ?auto_5038 ?auto_5039 ?auto_5040 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5046 - BLOCK
      ?auto_5047 - BLOCK
      ?auto_5048 - BLOCK
      ?auto_5049 - BLOCK
    )
    :vars
    (
      ?auto_5050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5049 ?auto_5050 ) ( not ( = ?auto_5046 ?auto_5047 ) ) ( not ( = ?auto_5046 ?auto_5048 ) ) ( not ( = ?auto_5046 ?auto_5049 ) ) ( not ( = ?auto_5046 ?auto_5050 ) ) ( not ( = ?auto_5047 ?auto_5048 ) ) ( not ( = ?auto_5047 ?auto_5049 ) ) ( not ( = ?auto_5047 ?auto_5050 ) ) ( not ( = ?auto_5048 ?auto_5049 ) ) ( not ( = ?auto_5048 ?auto_5050 ) ) ( not ( = ?auto_5049 ?auto_5050 ) ) ( ON ?auto_5048 ?auto_5049 ) ( ON ?auto_5047 ?auto_5048 ) ( ON ?auto_5046 ?auto_5047 ) ( CLEAR ?auto_5046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5046 )
      ( MAKE-4PILE ?auto_5046 ?auto_5047 ?auto_5048 ?auto_5049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5055 - BLOCK
      ?auto_5056 - BLOCK
      ?auto_5057 - BLOCK
      ?auto_5058 - BLOCK
    )
    :vars
    (
      ?auto_5059 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5058 ?auto_5059 ) ( not ( = ?auto_5055 ?auto_5056 ) ) ( not ( = ?auto_5055 ?auto_5057 ) ) ( not ( = ?auto_5055 ?auto_5058 ) ) ( not ( = ?auto_5055 ?auto_5059 ) ) ( not ( = ?auto_5056 ?auto_5057 ) ) ( not ( = ?auto_5056 ?auto_5058 ) ) ( not ( = ?auto_5056 ?auto_5059 ) ) ( not ( = ?auto_5057 ?auto_5058 ) ) ( not ( = ?auto_5057 ?auto_5059 ) ) ( not ( = ?auto_5058 ?auto_5059 ) ) ( ON ?auto_5057 ?auto_5058 ) ( ON ?auto_5056 ?auto_5057 ) ( ON ?auto_5055 ?auto_5056 ) ( CLEAR ?auto_5055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5055 )
      ( MAKE-4PILE ?auto_5055 ?auto_5056 ?auto_5057 ?auto_5058 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5065 - BLOCK
      ?auto_5066 - BLOCK
      ?auto_5067 - BLOCK
      ?auto_5068 - BLOCK
      ?auto_5069 - BLOCK
    )
    :vars
    (
      ?auto_5070 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5068 ) ( ON ?auto_5069 ?auto_5070 ) ( CLEAR ?auto_5069 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5065 ) ( ON ?auto_5066 ?auto_5065 ) ( ON ?auto_5067 ?auto_5066 ) ( ON ?auto_5068 ?auto_5067 ) ( not ( = ?auto_5065 ?auto_5066 ) ) ( not ( = ?auto_5065 ?auto_5067 ) ) ( not ( = ?auto_5065 ?auto_5068 ) ) ( not ( = ?auto_5065 ?auto_5069 ) ) ( not ( = ?auto_5065 ?auto_5070 ) ) ( not ( = ?auto_5066 ?auto_5067 ) ) ( not ( = ?auto_5066 ?auto_5068 ) ) ( not ( = ?auto_5066 ?auto_5069 ) ) ( not ( = ?auto_5066 ?auto_5070 ) ) ( not ( = ?auto_5067 ?auto_5068 ) ) ( not ( = ?auto_5067 ?auto_5069 ) ) ( not ( = ?auto_5067 ?auto_5070 ) ) ( not ( = ?auto_5068 ?auto_5069 ) ) ( not ( = ?auto_5068 ?auto_5070 ) ) ( not ( = ?auto_5069 ?auto_5070 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5069 ?auto_5070 )
      ( !STACK ?auto_5069 ?auto_5068 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5076 - BLOCK
      ?auto_5077 - BLOCK
      ?auto_5078 - BLOCK
      ?auto_5079 - BLOCK
      ?auto_5080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5079 ) ( ON-TABLE ?auto_5080 ) ( CLEAR ?auto_5080 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5076 ) ( ON ?auto_5077 ?auto_5076 ) ( ON ?auto_5078 ?auto_5077 ) ( ON ?auto_5079 ?auto_5078 ) ( not ( = ?auto_5076 ?auto_5077 ) ) ( not ( = ?auto_5076 ?auto_5078 ) ) ( not ( = ?auto_5076 ?auto_5079 ) ) ( not ( = ?auto_5076 ?auto_5080 ) ) ( not ( = ?auto_5077 ?auto_5078 ) ) ( not ( = ?auto_5077 ?auto_5079 ) ) ( not ( = ?auto_5077 ?auto_5080 ) ) ( not ( = ?auto_5078 ?auto_5079 ) ) ( not ( = ?auto_5078 ?auto_5080 ) ) ( not ( = ?auto_5079 ?auto_5080 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_5080 )
      ( !STACK ?auto_5080 ?auto_5079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5086 - BLOCK
      ?auto_5087 - BLOCK
      ?auto_5088 - BLOCK
      ?auto_5089 - BLOCK
      ?auto_5090 - BLOCK
    )
    :vars
    (
      ?auto_5091 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5090 ?auto_5091 ) ( ON-TABLE ?auto_5086 ) ( ON ?auto_5087 ?auto_5086 ) ( ON ?auto_5088 ?auto_5087 ) ( not ( = ?auto_5086 ?auto_5087 ) ) ( not ( = ?auto_5086 ?auto_5088 ) ) ( not ( = ?auto_5086 ?auto_5089 ) ) ( not ( = ?auto_5086 ?auto_5090 ) ) ( not ( = ?auto_5086 ?auto_5091 ) ) ( not ( = ?auto_5087 ?auto_5088 ) ) ( not ( = ?auto_5087 ?auto_5089 ) ) ( not ( = ?auto_5087 ?auto_5090 ) ) ( not ( = ?auto_5087 ?auto_5091 ) ) ( not ( = ?auto_5088 ?auto_5089 ) ) ( not ( = ?auto_5088 ?auto_5090 ) ) ( not ( = ?auto_5088 ?auto_5091 ) ) ( not ( = ?auto_5089 ?auto_5090 ) ) ( not ( = ?auto_5089 ?auto_5091 ) ) ( not ( = ?auto_5090 ?auto_5091 ) ) ( CLEAR ?auto_5088 ) ( ON ?auto_5089 ?auto_5090 ) ( CLEAR ?auto_5089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5086 ?auto_5087 ?auto_5088 ?auto_5089 )
      ( MAKE-5PILE ?auto_5086 ?auto_5087 ?auto_5088 ?auto_5089 ?auto_5090 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5097 - BLOCK
      ?auto_5098 - BLOCK
      ?auto_5099 - BLOCK
      ?auto_5100 - BLOCK
      ?auto_5101 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5101 ) ( ON-TABLE ?auto_5097 ) ( ON ?auto_5098 ?auto_5097 ) ( ON ?auto_5099 ?auto_5098 ) ( not ( = ?auto_5097 ?auto_5098 ) ) ( not ( = ?auto_5097 ?auto_5099 ) ) ( not ( = ?auto_5097 ?auto_5100 ) ) ( not ( = ?auto_5097 ?auto_5101 ) ) ( not ( = ?auto_5098 ?auto_5099 ) ) ( not ( = ?auto_5098 ?auto_5100 ) ) ( not ( = ?auto_5098 ?auto_5101 ) ) ( not ( = ?auto_5099 ?auto_5100 ) ) ( not ( = ?auto_5099 ?auto_5101 ) ) ( not ( = ?auto_5100 ?auto_5101 ) ) ( CLEAR ?auto_5099 ) ( ON ?auto_5100 ?auto_5101 ) ( CLEAR ?auto_5100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5097 ?auto_5098 ?auto_5099 ?auto_5100 )
      ( MAKE-5PILE ?auto_5097 ?auto_5098 ?auto_5099 ?auto_5100 ?auto_5101 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5107 - BLOCK
      ?auto_5108 - BLOCK
      ?auto_5109 - BLOCK
      ?auto_5110 - BLOCK
      ?auto_5111 - BLOCK
    )
    :vars
    (
      ?auto_5112 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5111 ?auto_5112 ) ( ON-TABLE ?auto_5107 ) ( ON ?auto_5108 ?auto_5107 ) ( not ( = ?auto_5107 ?auto_5108 ) ) ( not ( = ?auto_5107 ?auto_5109 ) ) ( not ( = ?auto_5107 ?auto_5110 ) ) ( not ( = ?auto_5107 ?auto_5111 ) ) ( not ( = ?auto_5107 ?auto_5112 ) ) ( not ( = ?auto_5108 ?auto_5109 ) ) ( not ( = ?auto_5108 ?auto_5110 ) ) ( not ( = ?auto_5108 ?auto_5111 ) ) ( not ( = ?auto_5108 ?auto_5112 ) ) ( not ( = ?auto_5109 ?auto_5110 ) ) ( not ( = ?auto_5109 ?auto_5111 ) ) ( not ( = ?auto_5109 ?auto_5112 ) ) ( not ( = ?auto_5110 ?auto_5111 ) ) ( not ( = ?auto_5110 ?auto_5112 ) ) ( not ( = ?auto_5111 ?auto_5112 ) ) ( ON ?auto_5110 ?auto_5111 ) ( CLEAR ?auto_5108 ) ( ON ?auto_5109 ?auto_5110 ) ( CLEAR ?auto_5109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5107 ?auto_5108 ?auto_5109 )
      ( MAKE-5PILE ?auto_5107 ?auto_5108 ?auto_5109 ?auto_5110 ?auto_5111 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5118 - BLOCK
      ?auto_5119 - BLOCK
      ?auto_5120 - BLOCK
      ?auto_5121 - BLOCK
      ?auto_5122 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5122 ) ( ON-TABLE ?auto_5118 ) ( ON ?auto_5119 ?auto_5118 ) ( not ( = ?auto_5118 ?auto_5119 ) ) ( not ( = ?auto_5118 ?auto_5120 ) ) ( not ( = ?auto_5118 ?auto_5121 ) ) ( not ( = ?auto_5118 ?auto_5122 ) ) ( not ( = ?auto_5119 ?auto_5120 ) ) ( not ( = ?auto_5119 ?auto_5121 ) ) ( not ( = ?auto_5119 ?auto_5122 ) ) ( not ( = ?auto_5120 ?auto_5121 ) ) ( not ( = ?auto_5120 ?auto_5122 ) ) ( not ( = ?auto_5121 ?auto_5122 ) ) ( ON ?auto_5121 ?auto_5122 ) ( CLEAR ?auto_5119 ) ( ON ?auto_5120 ?auto_5121 ) ( CLEAR ?auto_5120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_5118 ?auto_5119 ?auto_5120 )
      ( MAKE-5PILE ?auto_5118 ?auto_5119 ?auto_5120 ?auto_5121 ?auto_5122 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5128 - BLOCK
      ?auto_5129 - BLOCK
      ?auto_5130 - BLOCK
      ?auto_5131 - BLOCK
      ?auto_5132 - BLOCK
    )
    :vars
    (
      ?auto_5133 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5132 ?auto_5133 ) ( ON-TABLE ?auto_5128 ) ( not ( = ?auto_5128 ?auto_5129 ) ) ( not ( = ?auto_5128 ?auto_5130 ) ) ( not ( = ?auto_5128 ?auto_5131 ) ) ( not ( = ?auto_5128 ?auto_5132 ) ) ( not ( = ?auto_5128 ?auto_5133 ) ) ( not ( = ?auto_5129 ?auto_5130 ) ) ( not ( = ?auto_5129 ?auto_5131 ) ) ( not ( = ?auto_5129 ?auto_5132 ) ) ( not ( = ?auto_5129 ?auto_5133 ) ) ( not ( = ?auto_5130 ?auto_5131 ) ) ( not ( = ?auto_5130 ?auto_5132 ) ) ( not ( = ?auto_5130 ?auto_5133 ) ) ( not ( = ?auto_5131 ?auto_5132 ) ) ( not ( = ?auto_5131 ?auto_5133 ) ) ( not ( = ?auto_5132 ?auto_5133 ) ) ( ON ?auto_5131 ?auto_5132 ) ( ON ?auto_5130 ?auto_5131 ) ( CLEAR ?auto_5128 ) ( ON ?auto_5129 ?auto_5130 ) ( CLEAR ?auto_5129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5128 ?auto_5129 )
      ( MAKE-5PILE ?auto_5128 ?auto_5129 ?auto_5130 ?auto_5131 ?auto_5132 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5139 - BLOCK
      ?auto_5140 - BLOCK
      ?auto_5141 - BLOCK
      ?auto_5142 - BLOCK
      ?auto_5143 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5143 ) ( ON-TABLE ?auto_5139 ) ( not ( = ?auto_5139 ?auto_5140 ) ) ( not ( = ?auto_5139 ?auto_5141 ) ) ( not ( = ?auto_5139 ?auto_5142 ) ) ( not ( = ?auto_5139 ?auto_5143 ) ) ( not ( = ?auto_5140 ?auto_5141 ) ) ( not ( = ?auto_5140 ?auto_5142 ) ) ( not ( = ?auto_5140 ?auto_5143 ) ) ( not ( = ?auto_5141 ?auto_5142 ) ) ( not ( = ?auto_5141 ?auto_5143 ) ) ( not ( = ?auto_5142 ?auto_5143 ) ) ( ON ?auto_5142 ?auto_5143 ) ( ON ?auto_5141 ?auto_5142 ) ( CLEAR ?auto_5139 ) ( ON ?auto_5140 ?auto_5141 ) ( CLEAR ?auto_5140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5139 ?auto_5140 )
      ( MAKE-5PILE ?auto_5139 ?auto_5140 ?auto_5141 ?auto_5142 ?auto_5143 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5149 - BLOCK
      ?auto_5150 - BLOCK
      ?auto_5151 - BLOCK
      ?auto_5152 - BLOCK
      ?auto_5153 - BLOCK
    )
    :vars
    (
      ?auto_5154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5153 ?auto_5154 ) ( not ( = ?auto_5149 ?auto_5150 ) ) ( not ( = ?auto_5149 ?auto_5151 ) ) ( not ( = ?auto_5149 ?auto_5152 ) ) ( not ( = ?auto_5149 ?auto_5153 ) ) ( not ( = ?auto_5149 ?auto_5154 ) ) ( not ( = ?auto_5150 ?auto_5151 ) ) ( not ( = ?auto_5150 ?auto_5152 ) ) ( not ( = ?auto_5150 ?auto_5153 ) ) ( not ( = ?auto_5150 ?auto_5154 ) ) ( not ( = ?auto_5151 ?auto_5152 ) ) ( not ( = ?auto_5151 ?auto_5153 ) ) ( not ( = ?auto_5151 ?auto_5154 ) ) ( not ( = ?auto_5152 ?auto_5153 ) ) ( not ( = ?auto_5152 ?auto_5154 ) ) ( not ( = ?auto_5153 ?auto_5154 ) ) ( ON ?auto_5152 ?auto_5153 ) ( ON ?auto_5151 ?auto_5152 ) ( ON ?auto_5150 ?auto_5151 ) ( ON ?auto_5149 ?auto_5150 ) ( CLEAR ?auto_5149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5149 )
      ( MAKE-5PILE ?auto_5149 ?auto_5150 ?auto_5151 ?auto_5152 ?auto_5153 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5160 - BLOCK
      ?auto_5161 - BLOCK
      ?auto_5162 - BLOCK
      ?auto_5163 - BLOCK
      ?auto_5164 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_5164 ) ( not ( = ?auto_5160 ?auto_5161 ) ) ( not ( = ?auto_5160 ?auto_5162 ) ) ( not ( = ?auto_5160 ?auto_5163 ) ) ( not ( = ?auto_5160 ?auto_5164 ) ) ( not ( = ?auto_5161 ?auto_5162 ) ) ( not ( = ?auto_5161 ?auto_5163 ) ) ( not ( = ?auto_5161 ?auto_5164 ) ) ( not ( = ?auto_5162 ?auto_5163 ) ) ( not ( = ?auto_5162 ?auto_5164 ) ) ( not ( = ?auto_5163 ?auto_5164 ) ) ( ON ?auto_5163 ?auto_5164 ) ( ON ?auto_5162 ?auto_5163 ) ( ON ?auto_5161 ?auto_5162 ) ( ON ?auto_5160 ?auto_5161 ) ( CLEAR ?auto_5160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5160 )
      ( MAKE-5PILE ?auto_5160 ?auto_5161 ?auto_5162 ?auto_5163 ?auto_5164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_5170 - BLOCK
      ?auto_5171 - BLOCK
      ?auto_5172 - BLOCK
      ?auto_5173 - BLOCK
      ?auto_5174 - BLOCK
    )
    :vars
    (
      ?auto_5175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5170 ?auto_5171 ) ) ( not ( = ?auto_5170 ?auto_5172 ) ) ( not ( = ?auto_5170 ?auto_5173 ) ) ( not ( = ?auto_5170 ?auto_5174 ) ) ( not ( = ?auto_5171 ?auto_5172 ) ) ( not ( = ?auto_5171 ?auto_5173 ) ) ( not ( = ?auto_5171 ?auto_5174 ) ) ( not ( = ?auto_5172 ?auto_5173 ) ) ( not ( = ?auto_5172 ?auto_5174 ) ) ( not ( = ?auto_5173 ?auto_5174 ) ) ( ON ?auto_5170 ?auto_5175 ) ( not ( = ?auto_5174 ?auto_5175 ) ) ( not ( = ?auto_5173 ?auto_5175 ) ) ( not ( = ?auto_5172 ?auto_5175 ) ) ( not ( = ?auto_5171 ?auto_5175 ) ) ( not ( = ?auto_5170 ?auto_5175 ) ) ( ON ?auto_5171 ?auto_5170 ) ( ON ?auto_5172 ?auto_5171 ) ( ON ?auto_5173 ?auto_5172 ) ( ON ?auto_5174 ?auto_5173 ) ( CLEAR ?auto_5174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_5174 ?auto_5173 ?auto_5172 ?auto_5171 ?auto_5170 )
      ( MAKE-5PILE ?auto_5170 ?auto_5171 ?auto_5172 ?auto_5173 ?auto_5174 ) )
  )

)

