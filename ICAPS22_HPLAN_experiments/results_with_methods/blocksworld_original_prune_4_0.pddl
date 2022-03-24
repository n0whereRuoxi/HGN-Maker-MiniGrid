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

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_5924 - BLOCK
      ?auto_5925 - BLOCK
      ?auto_5926 - BLOCK
      ?auto_5927 - BLOCK
    )
    :vars
    (
      ?auto_5928 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5928 ?auto_5927 ) ( CLEAR ?auto_5928 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5924 ) ( ON ?auto_5925 ?auto_5924 ) ( ON ?auto_5926 ?auto_5925 ) ( ON ?auto_5927 ?auto_5926 ) ( not ( = ?auto_5924 ?auto_5925 ) ) ( not ( = ?auto_5924 ?auto_5926 ) ) ( not ( = ?auto_5924 ?auto_5927 ) ) ( not ( = ?auto_5924 ?auto_5928 ) ) ( not ( = ?auto_5925 ?auto_5926 ) ) ( not ( = ?auto_5925 ?auto_5927 ) ) ( not ( = ?auto_5925 ?auto_5928 ) ) ( not ( = ?auto_5926 ?auto_5927 ) ) ( not ( = ?auto_5926 ?auto_5928 ) ) ( not ( = ?auto_5927 ?auto_5928 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5928 ?auto_5927 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5930 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5930 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5931 - BLOCK
    )
    :vars
    (
      ?auto_5932 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5931 ?auto_5932 ) ( CLEAR ?auto_5931 ) ( HAND-EMPTY ) ( not ( = ?auto_5931 ?auto_5932 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5931 ?auto_5932 )
      ( MAKE-1PILE ?auto_5931 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5936 - BLOCK
      ?auto_5937 - BLOCK
      ?auto_5938 - BLOCK
    )
    :vars
    (
      ?auto_5939 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5939 ?auto_5938 ) ( CLEAR ?auto_5939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5936 ) ( ON ?auto_5937 ?auto_5936 ) ( ON ?auto_5938 ?auto_5937 ) ( not ( = ?auto_5936 ?auto_5937 ) ) ( not ( = ?auto_5936 ?auto_5938 ) ) ( not ( = ?auto_5936 ?auto_5939 ) ) ( not ( = ?auto_5937 ?auto_5938 ) ) ( not ( = ?auto_5937 ?auto_5939 ) ) ( not ( = ?auto_5938 ?auto_5939 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5939 ?auto_5938 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5940 - BLOCK
      ?auto_5941 - BLOCK
      ?auto_5942 - BLOCK
    )
    :vars
    (
      ?auto_5943 - BLOCK
      ?auto_5944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5943 ?auto_5942 ) ( CLEAR ?auto_5943 ) ( ON-TABLE ?auto_5940 ) ( ON ?auto_5941 ?auto_5940 ) ( ON ?auto_5942 ?auto_5941 ) ( not ( = ?auto_5940 ?auto_5941 ) ) ( not ( = ?auto_5940 ?auto_5942 ) ) ( not ( = ?auto_5940 ?auto_5943 ) ) ( not ( = ?auto_5941 ?auto_5942 ) ) ( not ( = ?auto_5941 ?auto_5943 ) ) ( not ( = ?auto_5942 ?auto_5943 ) ) ( HOLDING ?auto_5944 ) ( not ( = ?auto_5940 ?auto_5944 ) ) ( not ( = ?auto_5941 ?auto_5944 ) ) ( not ( = ?auto_5942 ?auto_5944 ) ) ( not ( = ?auto_5943 ?auto_5944 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_5944 )
      ( MAKE-3PILE ?auto_5940 ?auto_5941 ?auto_5942 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5945 - BLOCK
      ?auto_5946 - BLOCK
      ?auto_5947 - BLOCK
    )
    :vars
    (
      ?auto_5948 - BLOCK
      ?auto_5949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5948 ?auto_5947 ) ( ON-TABLE ?auto_5945 ) ( ON ?auto_5946 ?auto_5945 ) ( ON ?auto_5947 ?auto_5946 ) ( not ( = ?auto_5945 ?auto_5946 ) ) ( not ( = ?auto_5945 ?auto_5947 ) ) ( not ( = ?auto_5945 ?auto_5948 ) ) ( not ( = ?auto_5946 ?auto_5947 ) ) ( not ( = ?auto_5946 ?auto_5948 ) ) ( not ( = ?auto_5947 ?auto_5948 ) ) ( not ( = ?auto_5945 ?auto_5949 ) ) ( not ( = ?auto_5946 ?auto_5949 ) ) ( not ( = ?auto_5947 ?auto_5949 ) ) ( not ( = ?auto_5948 ?auto_5949 ) ) ( ON ?auto_5949 ?auto_5948 ) ( CLEAR ?auto_5949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5945 ?auto_5946 ?auto_5947 ?auto_5948 )
      ( MAKE-3PILE ?auto_5945 ?auto_5946 ?auto_5947 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5952 - BLOCK
      ?auto_5953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5953 ) ( CLEAR ?auto_5952 ) ( ON-TABLE ?auto_5952 ) ( not ( = ?auto_5952 ?auto_5953 ) ) )
    :subtasks
    ( ( !STACK ?auto_5953 ?auto_5952 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5954 - BLOCK
      ?auto_5955 - BLOCK
    )
    :vars
    (
      ?auto_5956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5954 ) ( ON-TABLE ?auto_5954 ) ( not ( = ?auto_5954 ?auto_5955 ) ) ( ON ?auto_5955 ?auto_5956 ) ( CLEAR ?auto_5955 ) ( HAND-EMPTY ) ( not ( = ?auto_5954 ?auto_5956 ) ) ( not ( = ?auto_5955 ?auto_5956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5955 ?auto_5956 )
      ( MAKE-2PILE ?auto_5954 ?auto_5955 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5957 - BLOCK
      ?auto_5958 - BLOCK
    )
    :vars
    (
      ?auto_5959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5957 ?auto_5958 ) ) ( ON ?auto_5958 ?auto_5959 ) ( CLEAR ?auto_5958 ) ( not ( = ?auto_5957 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5959 ) ) ( HOLDING ?auto_5957 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5957 )
      ( MAKE-2PILE ?auto_5957 ?auto_5958 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5960 - BLOCK
      ?auto_5961 - BLOCK
    )
    :vars
    (
      ?auto_5962 - BLOCK
      ?auto_5963 - BLOCK
      ?auto_5964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_5960 ?auto_5961 ) ) ( ON ?auto_5961 ?auto_5962 ) ( not ( = ?auto_5960 ?auto_5962 ) ) ( not ( = ?auto_5961 ?auto_5962 ) ) ( ON ?auto_5960 ?auto_5961 ) ( CLEAR ?auto_5960 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5963 ) ( ON ?auto_5964 ?auto_5963 ) ( ON ?auto_5962 ?auto_5964 ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5962 ) ) ( not ( = ?auto_5963 ?auto_5961 ) ) ( not ( = ?auto_5963 ?auto_5960 ) ) ( not ( = ?auto_5964 ?auto_5962 ) ) ( not ( = ?auto_5964 ?auto_5961 ) ) ( not ( = ?auto_5964 ?auto_5960 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5963 ?auto_5964 ?auto_5962 ?auto_5961 )
      ( MAKE-2PILE ?auto_5960 ?auto_5961 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5967 - BLOCK
      ?auto_5968 - BLOCK
    )
    :vars
    (
      ?auto_5969 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5969 ?auto_5968 ) ( CLEAR ?auto_5969 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5967 ) ( ON ?auto_5968 ?auto_5967 ) ( not ( = ?auto_5967 ?auto_5968 ) ) ( not ( = ?auto_5967 ?auto_5969 ) ) ( not ( = ?auto_5968 ?auto_5969 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5969 ?auto_5968 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5970 - BLOCK
      ?auto_5971 - BLOCK
    )
    :vars
    (
      ?auto_5972 - BLOCK
      ?auto_5973 - BLOCK
      ?auto_5974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5972 ?auto_5971 ) ( CLEAR ?auto_5972 ) ( ON-TABLE ?auto_5970 ) ( ON ?auto_5971 ?auto_5970 ) ( not ( = ?auto_5970 ?auto_5971 ) ) ( not ( = ?auto_5970 ?auto_5972 ) ) ( not ( = ?auto_5971 ?auto_5972 ) ) ( HOLDING ?auto_5973 ) ( CLEAR ?auto_5974 ) ( not ( = ?auto_5970 ?auto_5973 ) ) ( not ( = ?auto_5970 ?auto_5974 ) ) ( not ( = ?auto_5971 ?auto_5973 ) ) ( not ( = ?auto_5971 ?auto_5974 ) ) ( not ( = ?auto_5972 ?auto_5973 ) ) ( not ( = ?auto_5972 ?auto_5974 ) ) ( not ( = ?auto_5973 ?auto_5974 ) ) )
    :subtasks
    ( ( !STACK ?auto_5973 ?auto_5974 )
      ( MAKE-2PILE ?auto_5970 ?auto_5971 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6170 - BLOCK
      ?auto_6171 - BLOCK
    )
    :vars
    (
      ?auto_6173 - BLOCK
      ?auto_6172 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6173 ?auto_6171 ) ( ON-TABLE ?auto_6170 ) ( ON ?auto_6171 ?auto_6170 ) ( not ( = ?auto_6170 ?auto_6171 ) ) ( not ( = ?auto_6170 ?auto_6173 ) ) ( not ( = ?auto_6171 ?auto_6173 ) ) ( not ( = ?auto_6170 ?auto_6172 ) ) ( not ( = ?auto_6171 ?auto_6172 ) ) ( not ( = ?auto_6173 ?auto_6172 ) ) ( ON ?auto_6172 ?auto_6173 ) ( CLEAR ?auto_6172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6170 ?auto_6171 ?auto_6173 )
      ( MAKE-2PILE ?auto_6170 ?auto_6171 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5980 - BLOCK
      ?auto_5981 - BLOCK
    )
    :vars
    (
      ?auto_5984 - BLOCK
      ?auto_5982 - BLOCK
      ?auto_5983 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5984 ?auto_5981 ) ( ON-TABLE ?auto_5980 ) ( ON ?auto_5981 ?auto_5980 ) ( not ( = ?auto_5980 ?auto_5981 ) ) ( not ( = ?auto_5980 ?auto_5984 ) ) ( not ( = ?auto_5981 ?auto_5984 ) ) ( not ( = ?auto_5980 ?auto_5982 ) ) ( not ( = ?auto_5980 ?auto_5983 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5983 ) ) ( not ( = ?auto_5984 ?auto_5982 ) ) ( not ( = ?auto_5984 ?auto_5983 ) ) ( not ( = ?auto_5982 ?auto_5983 ) ) ( ON ?auto_5982 ?auto_5984 ) ( CLEAR ?auto_5982 ) ( HOLDING ?auto_5983 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5983 )
      ( MAKE-2PILE ?auto_5980 ?auto_5981 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5985 - BLOCK
      ?auto_5986 - BLOCK
    )
    :vars
    (
      ?auto_5988 - BLOCK
      ?auto_5989 - BLOCK
      ?auto_5987 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5988 ?auto_5986 ) ( ON-TABLE ?auto_5985 ) ( ON ?auto_5986 ?auto_5985 ) ( not ( = ?auto_5985 ?auto_5986 ) ) ( not ( = ?auto_5985 ?auto_5988 ) ) ( not ( = ?auto_5986 ?auto_5988 ) ) ( not ( = ?auto_5985 ?auto_5989 ) ) ( not ( = ?auto_5985 ?auto_5987 ) ) ( not ( = ?auto_5986 ?auto_5989 ) ) ( not ( = ?auto_5986 ?auto_5987 ) ) ( not ( = ?auto_5988 ?auto_5989 ) ) ( not ( = ?auto_5988 ?auto_5987 ) ) ( not ( = ?auto_5989 ?auto_5987 ) ) ( ON ?auto_5989 ?auto_5988 ) ( ON ?auto_5987 ?auto_5989 ) ( CLEAR ?auto_5987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_5985 ?auto_5986 ?auto_5988 ?auto_5989 )
      ( MAKE-2PILE ?auto_5985 ?auto_5986 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5993 - BLOCK
      ?auto_5994 - BLOCK
      ?auto_5995 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_5995 ) ( CLEAR ?auto_5994 ) ( ON-TABLE ?auto_5993 ) ( ON ?auto_5994 ?auto_5993 ) ( not ( = ?auto_5993 ?auto_5994 ) ) ( not ( = ?auto_5993 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_5995 ) ) )
    :subtasks
    ( ( !STACK ?auto_5995 ?auto_5994 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5996 - BLOCK
      ?auto_5997 - BLOCK
      ?auto_5998 - BLOCK
    )
    :vars
    (
      ?auto_5999 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5997 ) ( ON-TABLE ?auto_5996 ) ( ON ?auto_5997 ?auto_5996 ) ( not ( = ?auto_5996 ?auto_5997 ) ) ( not ( = ?auto_5996 ?auto_5998 ) ) ( not ( = ?auto_5997 ?auto_5998 ) ) ( ON ?auto_5998 ?auto_5999 ) ( CLEAR ?auto_5998 ) ( HAND-EMPTY ) ( not ( = ?auto_5996 ?auto_5999 ) ) ( not ( = ?auto_5997 ?auto_5999 ) ) ( not ( = ?auto_5998 ?auto_5999 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5998 ?auto_5999 )
      ( MAKE-3PILE ?auto_5996 ?auto_5997 ?auto_5998 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6000 - BLOCK
      ?auto_6001 - BLOCK
      ?auto_6002 - BLOCK
    )
    :vars
    (
      ?auto_6003 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6000 ) ( not ( = ?auto_6000 ?auto_6001 ) ) ( not ( = ?auto_6000 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( ON ?auto_6002 ?auto_6003 ) ( CLEAR ?auto_6002 ) ( not ( = ?auto_6000 ?auto_6003 ) ) ( not ( = ?auto_6001 ?auto_6003 ) ) ( not ( = ?auto_6002 ?auto_6003 ) ) ( HOLDING ?auto_6001 ) ( CLEAR ?auto_6000 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6000 ?auto_6001 )
      ( MAKE-3PILE ?auto_6000 ?auto_6001 ?auto_6002 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6004 - BLOCK
      ?auto_6005 - BLOCK
      ?auto_6006 - BLOCK
    )
    :vars
    (
      ?auto_6007 - BLOCK
      ?auto_6008 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6004 ) ( not ( = ?auto_6004 ?auto_6005 ) ) ( not ( = ?auto_6004 ?auto_6006 ) ) ( not ( = ?auto_6005 ?auto_6006 ) ) ( ON ?auto_6006 ?auto_6007 ) ( not ( = ?auto_6004 ?auto_6007 ) ) ( not ( = ?auto_6005 ?auto_6007 ) ) ( not ( = ?auto_6006 ?auto_6007 ) ) ( CLEAR ?auto_6004 ) ( ON ?auto_6005 ?auto_6006 ) ( CLEAR ?auto_6005 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6008 ) ( ON ?auto_6007 ?auto_6008 ) ( not ( = ?auto_6008 ?auto_6007 ) ) ( not ( = ?auto_6008 ?auto_6006 ) ) ( not ( = ?auto_6008 ?auto_6005 ) ) ( not ( = ?auto_6004 ?auto_6008 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6008 ?auto_6007 ?auto_6006 )
      ( MAKE-3PILE ?auto_6004 ?auto_6005 ?auto_6006 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6009 - BLOCK
      ?auto_6010 - BLOCK
      ?auto_6011 - BLOCK
    )
    :vars
    (
      ?auto_6013 - BLOCK
      ?auto_6012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6009 ?auto_6010 ) ) ( not ( = ?auto_6009 ?auto_6011 ) ) ( not ( = ?auto_6010 ?auto_6011 ) ) ( ON ?auto_6011 ?auto_6013 ) ( not ( = ?auto_6009 ?auto_6013 ) ) ( not ( = ?auto_6010 ?auto_6013 ) ) ( not ( = ?auto_6011 ?auto_6013 ) ) ( ON ?auto_6010 ?auto_6011 ) ( CLEAR ?auto_6010 ) ( ON-TABLE ?auto_6012 ) ( ON ?auto_6013 ?auto_6012 ) ( not ( = ?auto_6012 ?auto_6013 ) ) ( not ( = ?auto_6012 ?auto_6011 ) ) ( not ( = ?auto_6012 ?auto_6010 ) ) ( not ( = ?auto_6009 ?auto_6012 ) ) ( HOLDING ?auto_6009 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6009 )
      ( MAKE-3PILE ?auto_6009 ?auto_6010 ?auto_6011 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6014 - BLOCK
      ?auto_6015 - BLOCK
      ?auto_6016 - BLOCK
    )
    :vars
    (
      ?auto_6018 - BLOCK
      ?auto_6017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6014 ?auto_6015 ) ) ( not ( = ?auto_6014 ?auto_6016 ) ) ( not ( = ?auto_6015 ?auto_6016 ) ) ( ON ?auto_6016 ?auto_6018 ) ( not ( = ?auto_6014 ?auto_6018 ) ) ( not ( = ?auto_6015 ?auto_6018 ) ) ( not ( = ?auto_6016 ?auto_6018 ) ) ( ON ?auto_6015 ?auto_6016 ) ( ON-TABLE ?auto_6017 ) ( ON ?auto_6018 ?auto_6017 ) ( not ( = ?auto_6017 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6016 ) ) ( not ( = ?auto_6017 ?auto_6015 ) ) ( not ( = ?auto_6014 ?auto_6017 ) ) ( ON ?auto_6014 ?auto_6015 ) ( CLEAR ?auto_6014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6017 ?auto_6018 ?auto_6016 ?auto_6015 )
      ( MAKE-3PILE ?auto_6014 ?auto_6015 ?auto_6016 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6020 - BLOCK
    )
    :vars
    (
      ?auto_6021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6021 ?auto_6020 ) ( CLEAR ?auto_6021 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6020 ) ( not ( = ?auto_6020 ?auto_6021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6021 ?auto_6020 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6022 - BLOCK
    )
    :vars
    (
      ?auto_6023 - BLOCK
      ?auto_6024 - BLOCK
      ?auto_6025 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6023 ?auto_6022 ) ( CLEAR ?auto_6023 ) ( ON-TABLE ?auto_6022 ) ( not ( = ?auto_6022 ?auto_6023 ) ) ( HOLDING ?auto_6024 ) ( CLEAR ?auto_6025 ) ( not ( = ?auto_6022 ?auto_6024 ) ) ( not ( = ?auto_6022 ?auto_6025 ) ) ( not ( = ?auto_6023 ?auto_6024 ) ) ( not ( = ?auto_6023 ?auto_6025 ) ) ( not ( = ?auto_6024 ?auto_6025 ) ) )
    :subtasks
    ( ( !STACK ?auto_6024 ?auto_6025 )
      ( MAKE-1PILE ?auto_6022 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6026 - BLOCK
    )
    :vars
    (
      ?auto_6029 - BLOCK
      ?auto_6027 - BLOCK
      ?auto_6028 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6029 ?auto_6026 ) ( ON-TABLE ?auto_6026 ) ( not ( = ?auto_6026 ?auto_6029 ) ) ( CLEAR ?auto_6027 ) ( not ( = ?auto_6026 ?auto_6028 ) ) ( not ( = ?auto_6026 ?auto_6027 ) ) ( not ( = ?auto_6029 ?auto_6028 ) ) ( not ( = ?auto_6029 ?auto_6027 ) ) ( not ( = ?auto_6028 ?auto_6027 ) ) ( ON ?auto_6028 ?auto_6029 ) ( CLEAR ?auto_6028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6026 ?auto_6029 )
      ( MAKE-1PILE ?auto_6026 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6030 - BLOCK
    )
    :vars
    (
      ?auto_6031 - BLOCK
      ?auto_6032 - BLOCK
      ?auto_6033 - BLOCK
      ?auto_6034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6031 ?auto_6030 ) ( ON-TABLE ?auto_6030 ) ( not ( = ?auto_6030 ?auto_6031 ) ) ( not ( = ?auto_6030 ?auto_6032 ) ) ( not ( = ?auto_6030 ?auto_6033 ) ) ( not ( = ?auto_6031 ?auto_6032 ) ) ( not ( = ?auto_6031 ?auto_6033 ) ) ( not ( = ?auto_6032 ?auto_6033 ) ) ( ON ?auto_6032 ?auto_6031 ) ( CLEAR ?auto_6032 ) ( HOLDING ?auto_6033 ) ( CLEAR ?auto_6034 ) ( ON-TABLE ?auto_6034 ) ( not ( = ?auto_6034 ?auto_6033 ) ) ( not ( = ?auto_6030 ?auto_6034 ) ) ( not ( = ?auto_6031 ?auto_6034 ) ) ( not ( = ?auto_6032 ?auto_6034 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6034 ?auto_6033 )
      ( MAKE-1PILE ?auto_6030 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6258 - BLOCK
    )
    :vars
    (
      ?auto_6259 - BLOCK
      ?auto_6260 - BLOCK
      ?auto_6261 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6259 ?auto_6258 ) ( ON-TABLE ?auto_6258 ) ( not ( = ?auto_6258 ?auto_6259 ) ) ( not ( = ?auto_6258 ?auto_6260 ) ) ( not ( = ?auto_6258 ?auto_6261 ) ) ( not ( = ?auto_6259 ?auto_6260 ) ) ( not ( = ?auto_6259 ?auto_6261 ) ) ( not ( = ?auto_6260 ?auto_6261 ) ) ( ON ?auto_6260 ?auto_6259 ) ( ON ?auto_6261 ?auto_6260 ) ( CLEAR ?auto_6261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6258 ?auto_6259 ?auto_6260 )
      ( MAKE-1PILE ?auto_6258 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6040 - BLOCK
    )
    :vars
    (
      ?auto_6041 - BLOCK
      ?auto_6043 - BLOCK
      ?auto_6042 - BLOCK
      ?auto_6044 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6041 ?auto_6040 ) ( ON-TABLE ?auto_6040 ) ( not ( = ?auto_6040 ?auto_6041 ) ) ( not ( = ?auto_6040 ?auto_6043 ) ) ( not ( = ?auto_6040 ?auto_6042 ) ) ( not ( = ?auto_6041 ?auto_6043 ) ) ( not ( = ?auto_6041 ?auto_6042 ) ) ( not ( = ?auto_6043 ?auto_6042 ) ) ( ON ?auto_6043 ?auto_6041 ) ( not ( = ?auto_6044 ?auto_6042 ) ) ( not ( = ?auto_6040 ?auto_6044 ) ) ( not ( = ?auto_6041 ?auto_6044 ) ) ( not ( = ?auto_6043 ?auto_6044 ) ) ( ON ?auto_6042 ?auto_6043 ) ( CLEAR ?auto_6042 ) ( HOLDING ?auto_6044 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6044 )
      ( MAKE-1PILE ?auto_6040 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6045 - BLOCK
    )
    :vars
    (
      ?auto_6047 - BLOCK
      ?auto_6049 - BLOCK
      ?auto_6046 - BLOCK
      ?auto_6048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6047 ?auto_6045 ) ( ON-TABLE ?auto_6045 ) ( not ( = ?auto_6045 ?auto_6047 ) ) ( not ( = ?auto_6045 ?auto_6049 ) ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( not ( = ?auto_6047 ?auto_6049 ) ) ( not ( = ?auto_6047 ?auto_6046 ) ) ( not ( = ?auto_6049 ?auto_6046 ) ) ( ON ?auto_6049 ?auto_6047 ) ( not ( = ?auto_6048 ?auto_6046 ) ) ( not ( = ?auto_6045 ?auto_6048 ) ) ( not ( = ?auto_6047 ?auto_6048 ) ) ( not ( = ?auto_6049 ?auto_6048 ) ) ( ON ?auto_6046 ?auto_6049 ) ( ON ?auto_6048 ?auto_6046 ) ( CLEAR ?auto_6048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6045 ?auto_6047 ?auto_6049 ?auto_6046 )
      ( MAKE-1PILE ?auto_6045 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6054 - BLOCK
      ?auto_6055 - BLOCK
      ?auto_6056 - BLOCK
      ?auto_6057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6057 ) ( CLEAR ?auto_6056 ) ( ON-TABLE ?auto_6054 ) ( ON ?auto_6055 ?auto_6054 ) ( ON ?auto_6056 ?auto_6055 ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6056 ) ) ( not ( = ?auto_6054 ?auto_6057 ) ) ( not ( = ?auto_6055 ?auto_6056 ) ) ( not ( = ?auto_6055 ?auto_6057 ) ) ( not ( = ?auto_6056 ?auto_6057 ) ) )
    :subtasks
    ( ( !STACK ?auto_6057 ?auto_6056 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6058 - BLOCK
      ?auto_6059 - BLOCK
      ?auto_6060 - BLOCK
      ?auto_6061 - BLOCK
    )
    :vars
    (
      ?auto_6062 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6060 ) ( ON-TABLE ?auto_6058 ) ( ON ?auto_6059 ?auto_6058 ) ( ON ?auto_6060 ?auto_6059 ) ( not ( = ?auto_6058 ?auto_6059 ) ) ( not ( = ?auto_6058 ?auto_6060 ) ) ( not ( = ?auto_6058 ?auto_6061 ) ) ( not ( = ?auto_6059 ?auto_6060 ) ) ( not ( = ?auto_6059 ?auto_6061 ) ) ( not ( = ?auto_6060 ?auto_6061 ) ) ( ON ?auto_6061 ?auto_6062 ) ( CLEAR ?auto_6061 ) ( HAND-EMPTY ) ( not ( = ?auto_6058 ?auto_6062 ) ) ( not ( = ?auto_6059 ?auto_6062 ) ) ( not ( = ?auto_6060 ?auto_6062 ) ) ( not ( = ?auto_6061 ?auto_6062 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6061 ?auto_6062 )
      ( MAKE-4PILE ?auto_6058 ?auto_6059 ?auto_6060 ?auto_6061 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6063 - BLOCK
      ?auto_6064 - BLOCK
      ?auto_6065 - BLOCK
      ?auto_6066 - BLOCK
    )
    :vars
    (
      ?auto_6067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6063 ) ( ON ?auto_6064 ?auto_6063 ) ( not ( = ?auto_6063 ?auto_6064 ) ) ( not ( = ?auto_6063 ?auto_6065 ) ) ( not ( = ?auto_6063 ?auto_6066 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6066 ) ) ( not ( = ?auto_6065 ?auto_6066 ) ) ( ON ?auto_6066 ?auto_6067 ) ( CLEAR ?auto_6066 ) ( not ( = ?auto_6063 ?auto_6067 ) ) ( not ( = ?auto_6064 ?auto_6067 ) ) ( not ( = ?auto_6065 ?auto_6067 ) ) ( not ( = ?auto_6066 ?auto_6067 ) ) ( HOLDING ?auto_6065 ) ( CLEAR ?auto_6064 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6063 ?auto_6064 ?auto_6065 )
      ( MAKE-4PILE ?auto_6063 ?auto_6064 ?auto_6065 ?auto_6066 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6068 - BLOCK
      ?auto_6069 - BLOCK
      ?auto_6070 - BLOCK
      ?auto_6071 - BLOCK
    )
    :vars
    (
      ?auto_6072 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6068 ) ( ON ?auto_6069 ?auto_6068 ) ( not ( = ?auto_6068 ?auto_6069 ) ) ( not ( = ?auto_6068 ?auto_6070 ) ) ( not ( = ?auto_6068 ?auto_6071 ) ) ( not ( = ?auto_6069 ?auto_6070 ) ) ( not ( = ?auto_6069 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( ON ?auto_6071 ?auto_6072 ) ( not ( = ?auto_6068 ?auto_6072 ) ) ( not ( = ?auto_6069 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( CLEAR ?auto_6069 ) ( ON ?auto_6070 ?auto_6071 ) ( CLEAR ?auto_6070 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6072 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6072 ?auto_6071 )
      ( MAKE-4PILE ?auto_6068 ?auto_6069 ?auto_6070 ?auto_6071 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6073 - BLOCK
      ?auto_6074 - BLOCK
      ?auto_6075 - BLOCK
      ?auto_6076 - BLOCK
    )
    :vars
    (
      ?auto_6077 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6073 ) ( not ( = ?auto_6073 ?auto_6074 ) ) ( not ( = ?auto_6073 ?auto_6075 ) ) ( not ( = ?auto_6073 ?auto_6076 ) ) ( not ( = ?auto_6074 ?auto_6075 ) ) ( not ( = ?auto_6074 ?auto_6076 ) ) ( not ( = ?auto_6075 ?auto_6076 ) ) ( ON ?auto_6076 ?auto_6077 ) ( not ( = ?auto_6073 ?auto_6077 ) ) ( not ( = ?auto_6074 ?auto_6077 ) ) ( not ( = ?auto_6075 ?auto_6077 ) ) ( not ( = ?auto_6076 ?auto_6077 ) ) ( ON ?auto_6075 ?auto_6076 ) ( CLEAR ?auto_6075 ) ( ON-TABLE ?auto_6077 ) ( HOLDING ?auto_6074 ) ( CLEAR ?auto_6073 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6073 ?auto_6074 )
      ( MAKE-4PILE ?auto_6073 ?auto_6074 ?auto_6075 ?auto_6076 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6078 - BLOCK
      ?auto_6079 - BLOCK
      ?auto_6080 - BLOCK
      ?auto_6081 - BLOCK
    )
    :vars
    (
      ?auto_6082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6078 ) ( not ( = ?auto_6078 ?auto_6079 ) ) ( not ( = ?auto_6078 ?auto_6080 ) ) ( not ( = ?auto_6078 ?auto_6081 ) ) ( not ( = ?auto_6079 ?auto_6080 ) ) ( not ( = ?auto_6079 ?auto_6081 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) ( ON ?auto_6081 ?auto_6082 ) ( not ( = ?auto_6078 ?auto_6082 ) ) ( not ( = ?auto_6079 ?auto_6082 ) ) ( not ( = ?auto_6080 ?auto_6082 ) ) ( not ( = ?auto_6081 ?auto_6082 ) ) ( ON ?auto_6080 ?auto_6081 ) ( ON-TABLE ?auto_6082 ) ( CLEAR ?auto_6078 ) ( ON ?auto_6079 ?auto_6080 ) ( CLEAR ?auto_6079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6082 ?auto_6081 ?auto_6080 )
      ( MAKE-4PILE ?auto_6078 ?auto_6079 ?auto_6080 ?auto_6081 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6083 - BLOCK
      ?auto_6084 - BLOCK
      ?auto_6085 - BLOCK
      ?auto_6086 - BLOCK
    )
    :vars
    (
      ?auto_6087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6083 ?auto_6084 ) ) ( not ( = ?auto_6083 ?auto_6085 ) ) ( not ( = ?auto_6083 ?auto_6086 ) ) ( not ( = ?auto_6084 ?auto_6085 ) ) ( not ( = ?auto_6084 ?auto_6086 ) ) ( not ( = ?auto_6085 ?auto_6086 ) ) ( ON ?auto_6086 ?auto_6087 ) ( not ( = ?auto_6083 ?auto_6087 ) ) ( not ( = ?auto_6084 ?auto_6087 ) ) ( not ( = ?auto_6085 ?auto_6087 ) ) ( not ( = ?auto_6086 ?auto_6087 ) ) ( ON ?auto_6085 ?auto_6086 ) ( ON-TABLE ?auto_6087 ) ( ON ?auto_6084 ?auto_6085 ) ( CLEAR ?auto_6084 ) ( HOLDING ?auto_6083 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6083 )
      ( MAKE-4PILE ?auto_6083 ?auto_6084 ?auto_6085 ?auto_6086 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6088 - BLOCK
      ?auto_6089 - BLOCK
      ?auto_6090 - BLOCK
      ?auto_6091 - BLOCK
    )
    :vars
    (
      ?auto_6092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6088 ?auto_6089 ) ) ( not ( = ?auto_6088 ?auto_6090 ) ) ( not ( = ?auto_6088 ?auto_6091 ) ) ( not ( = ?auto_6089 ?auto_6090 ) ) ( not ( = ?auto_6089 ?auto_6091 ) ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( ON ?auto_6091 ?auto_6092 ) ( not ( = ?auto_6088 ?auto_6092 ) ) ( not ( = ?auto_6089 ?auto_6092 ) ) ( not ( = ?auto_6090 ?auto_6092 ) ) ( not ( = ?auto_6091 ?auto_6092 ) ) ( ON ?auto_6090 ?auto_6091 ) ( ON-TABLE ?auto_6092 ) ( ON ?auto_6089 ?auto_6090 ) ( ON ?auto_6088 ?auto_6089 ) ( CLEAR ?auto_6088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6092 ?auto_6091 ?auto_6090 ?auto_6089 )
      ( MAKE-4PILE ?auto_6088 ?auto_6089 ?auto_6090 ?auto_6091 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6133 - BLOCK
    )
    :vars
    (
      ?auto_6134 - BLOCK
      ?auto_6135 - BLOCK
      ?auto_6136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6133 ?auto_6134 ) ( CLEAR ?auto_6133 ) ( not ( = ?auto_6133 ?auto_6134 ) ) ( HOLDING ?auto_6135 ) ( CLEAR ?auto_6136 ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( not ( = ?auto_6133 ?auto_6136 ) ) ( not ( = ?auto_6134 ?auto_6135 ) ) ( not ( = ?auto_6134 ?auto_6136 ) ) ( not ( = ?auto_6135 ?auto_6136 ) ) )
    :subtasks
    ( ( !STACK ?auto_6135 ?auto_6136 )
      ( MAKE-1PILE ?auto_6133 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6137 - BLOCK
    )
    :vars
    (
      ?auto_6139 - BLOCK
      ?auto_6138 - BLOCK
      ?auto_6140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6137 ?auto_6139 ) ( not ( = ?auto_6137 ?auto_6139 ) ) ( CLEAR ?auto_6138 ) ( not ( = ?auto_6137 ?auto_6140 ) ) ( not ( = ?auto_6137 ?auto_6138 ) ) ( not ( = ?auto_6139 ?auto_6140 ) ) ( not ( = ?auto_6139 ?auto_6138 ) ) ( not ( = ?auto_6140 ?auto_6138 ) ) ( ON ?auto_6140 ?auto_6137 ) ( CLEAR ?auto_6140 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6139 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6139 ?auto_6137 )
      ( MAKE-1PILE ?auto_6137 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6141 - BLOCK
    )
    :vars
    (
      ?auto_6142 - BLOCK
      ?auto_6143 - BLOCK
      ?auto_6144 - BLOCK
      ?auto_6145 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6141 ?auto_6142 ) ( not ( = ?auto_6141 ?auto_6142 ) ) ( not ( = ?auto_6141 ?auto_6143 ) ) ( not ( = ?auto_6141 ?auto_6144 ) ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( not ( = ?auto_6142 ?auto_6144 ) ) ( not ( = ?auto_6143 ?auto_6144 ) ) ( ON ?auto_6143 ?auto_6141 ) ( CLEAR ?auto_6143 ) ( ON-TABLE ?auto_6142 ) ( HOLDING ?auto_6144 ) ( CLEAR ?auto_6145 ) ( ON-TABLE ?auto_6145 ) ( not ( = ?auto_6145 ?auto_6144 ) ) ( not ( = ?auto_6141 ?auto_6145 ) ) ( not ( = ?auto_6142 ?auto_6145 ) ) ( not ( = ?auto_6143 ?auto_6145 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6145 ?auto_6144 )
      ( MAKE-1PILE ?auto_6141 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6146 - BLOCK
    )
    :vars
    (
      ?auto_6148 - BLOCK
      ?auto_6147 - BLOCK
      ?auto_6150 - BLOCK
      ?auto_6149 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6146 ?auto_6148 ) ( not ( = ?auto_6146 ?auto_6148 ) ) ( not ( = ?auto_6146 ?auto_6147 ) ) ( not ( = ?auto_6146 ?auto_6150 ) ) ( not ( = ?auto_6148 ?auto_6147 ) ) ( not ( = ?auto_6148 ?auto_6150 ) ) ( not ( = ?auto_6147 ?auto_6150 ) ) ( ON ?auto_6147 ?auto_6146 ) ( ON-TABLE ?auto_6148 ) ( CLEAR ?auto_6149 ) ( ON-TABLE ?auto_6149 ) ( not ( = ?auto_6149 ?auto_6150 ) ) ( not ( = ?auto_6146 ?auto_6149 ) ) ( not ( = ?auto_6148 ?auto_6149 ) ) ( not ( = ?auto_6147 ?auto_6149 ) ) ( ON ?auto_6150 ?auto_6147 ) ( CLEAR ?auto_6150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6148 ?auto_6146 ?auto_6147 )
      ( MAKE-1PILE ?auto_6146 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6151 - BLOCK
    )
    :vars
    (
      ?auto_6153 - BLOCK
      ?auto_6154 - BLOCK
      ?auto_6152 - BLOCK
      ?auto_6155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6151 ?auto_6153 ) ( not ( = ?auto_6151 ?auto_6153 ) ) ( not ( = ?auto_6151 ?auto_6154 ) ) ( not ( = ?auto_6151 ?auto_6152 ) ) ( not ( = ?auto_6153 ?auto_6154 ) ) ( not ( = ?auto_6153 ?auto_6152 ) ) ( not ( = ?auto_6154 ?auto_6152 ) ) ( ON ?auto_6154 ?auto_6151 ) ( ON-TABLE ?auto_6153 ) ( not ( = ?auto_6155 ?auto_6152 ) ) ( not ( = ?auto_6151 ?auto_6155 ) ) ( not ( = ?auto_6153 ?auto_6155 ) ) ( not ( = ?auto_6154 ?auto_6155 ) ) ( ON ?auto_6152 ?auto_6154 ) ( CLEAR ?auto_6152 ) ( HOLDING ?auto_6155 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6155 )
      ( MAKE-1PILE ?auto_6151 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6156 - BLOCK
    )
    :vars
    (
      ?auto_6158 - BLOCK
      ?auto_6157 - BLOCK
      ?auto_6159 - BLOCK
      ?auto_6160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6156 ?auto_6158 ) ( not ( = ?auto_6156 ?auto_6158 ) ) ( not ( = ?auto_6156 ?auto_6157 ) ) ( not ( = ?auto_6156 ?auto_6159 ) ) ( not ( = ?auto_6158 ?auto_6157 ) ) ( not ( = ?auto_6158 ?auto_6159 ) ) ( not ( = ?auto_6157 ?auto_6159 ) ) ( ON ?auto_6157 ?auto_6156 ) ( ON-TABLE ?auto_6158 ) ( not ( = ?auto_6160 ?auto_6159 ) ) ( not ( = ?auto_6156 ?auto_6160 ) ) ( not ( = ?auto_6158 ?auto_6160 ) ) ( not ( = ?auto_6157 ?auto_6160 ) ) ( ON ?auto_6159 ?auto_6157 ) ( ON ?auto_6160 ?auto_6159 ) ( CLEAR ?auto_6160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6158 ?auto_6156 ?auto_6157 ?auto_6159 )
      ( MAKE-1PILE ?auto_6156 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6166 - BLOCK
      ?auto_6167 - BLOCK
    )
    :vars
    (
      ?auto_6168 - BLOCK
      ?auto_6169 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6168 ?auto_6167 ) ( CLEAR ?auto_6168 ) ( ON-TABLE ?auto_6166 ) ( ON ?auto_6167 ?auto_6166 ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6168 ) ) ( not ( = ?auto_6167 ?auto_6168 ) ) ( HOLDING ?auto_6169 ) ( not ( = ?auto_6166 ?auto_6169 ) ) ( not ( = ?auto_6167 ?auto_6169 ) ) ( not ( = ?auto_6168 ?auto_6169 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6169 )
      ( MAKE-2PILE ?auto_6166 ?auto_6167 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6203 - BLOCK
      ?auto_6204 - BLOCK
    )
    :vars
    (
      ?auto_6205 - BLOCK
      ?auto_6206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6203 ?auto_6204 ) ) ( ON ?auto_6204 ?auto_6205 ) ( not ( = ?auto_6203 ?auto_6205 ) ) ( not ( = ?auto_6204 ?auto_6205 ) ) ( ON ?auto_6203 ?auto_6204 ) ( CLEAR ?auto_6203 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6206 ) ( ON ?auto_6205 ?auto_6206 ) ( not ( = ?auto_6206 ?auto_6205 ) ) ( not ( = ?auto_6206 ?auto_6204 ) ) ( not ( = ?auto_6206 ?auto_6203 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6206 ?auto_6205 ?auto_6204 )
      ( MAKE-2PILE ?auto_6203 ?auto_6204 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6209 - BLOCK
      ?auto_6210 - BLOCK
    )
    :vars
    (
      ?auto_6211 - BLOCK
      ?auto_6212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6209 ?auto_6210 ) ) ( ON ?auto_6210 ?auto_6211 ) ( CLEAR ?auto_6210 ) ( not ( = ?auto_6209 ?auto_6211 ) ) ( not ( = ?auto_6210 ?auto_6211 ) ) ( ON ?auto_6209 ?auto_6212 ) ( CLEAR ?auto_6209 ) ( HAND-EMPTY ) ( not ( = ?auto_6209 ?auto_6212 ) ) ( not ( = ?auto_6210 ?auto_6212 ) ) ( not ( = ?auto_6211 ?auto_6212 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6209 ?auto_6212 )
      ( MAKE-2PILE ?auto_6209 ?auto_6210 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6213 - BLOCK
      ?auto_6214 - BLOCK
    )
    :vars
    (
      ?auto_6216 - BLOCK
      ?auto_6215 - BLOCK
      ?auto_6217 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6213 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6216 ) ) ( not ( = ?auto_6214 ?auto_6216 ) ) ( ON ?auto_6213 ?auto_6215 ) ( CLEAR ?auto_6213 ) ( not ( = ?auto_6213 ?auto_6215 ) ) ( not ( = ?auto_6214 ?auto_6215 ) ) ( not ( = ?auto_6216 ?auto_6215 ) ) ( HOLDING ?auto_6214 ) ( CLEAR ?auto_6216 ) ( ON-TABLE ?auto_6217 ) ( ON ?auto_6216 ?auto_6217 ) ( not ( = ?auto_6217 ?auto_6216 ) ) ( not ( = ?auto_6217 ?auto_6214 ) ) ( not ( = ?auto_6213 ?auto_6217 ) ) ( not ( = ?auto_6215 ?auto_6217 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6217 ?auto_6216 ?auto_6214 )
      ( MAKE-2PILE ?auto_6213 ?auto_6214 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6218 - BLOCK
      ?auto_6219 - BLOCK
    )
    :vars
    (
      ?auto_6221 - BLOCK
      ?auto_6222 - BLOCK
      ?auto_6220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6218 ?auto_6219 ) ) ( not ( = ?auto_6218 ?auto_6221 ) ) ( not ( = ?auto_6219 ?auto_6221 ) ) ( ON ?auto_6218 ?auto_6222 ) ( not ( = ?auto_6218 ?auto_6222 ) ) ( not ( = ?auto_6219 ?auto_6222 ) ) ( not ( = ?auto_6221 ?auto_6222 ) ) ( CLEAR ?auto_6221 ) ( ON-TABLE ?auto_6220 ) ( ON ?auto_6221 ?auto_6220 ) ( not ( = ?auto_6220 ?auto_6221 ) ) ( not ( = ?auto_6220 ?auto_6219 ) ) ( not ( = ?auto_6218 ?auto_6220 ) ) ( not ( = ?auto_6222 ?auto_6220 ) ) ( ON ?auto_6219 ?auto_6218 ) ( CLEAR ?auto_6219 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6222 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6222 ?auto_6218 )
      ( MAKE-2PILE ?auto_6218 ?auto_6219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6223 - BLOCK
      ?auto_6224 - BLOCK
    )
    :vars
    (
      ?auto_6227 - BLOCK
      ?auto_6225 - BLOCK
      ?auto_6226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6223 ?auto_6224 ) ) ( not ( = ?auto_6223 ?auto_6227 ) ) ( not ( = ?auto_6224 ?auto_6227 ) ) ( ON ?auto_6223 ?auto_6225 ) ( not ( = ?auto_6223 ?auto_6225 ) ) ( not ( = ?auto_6224 ?auto_6225 ) ) ( not ( = ?auto_6227 ?auto_6225 ) ) ( ON-TABLE ?auto_6226 ) ( not ( = ?auto_6226 ?auto_6227 ) ) ( not ( = ?auto_6226 ?auto_6224 ) ) ( not ( = ?auto_6223 ?auto_6226 ) ) ( not ( = ?auto_6225 ?auto_6226 ) ) ( ON ?auto_6224 ?auto_6223 ) ( CLEAR ?auto_6224 ) ( ON-TABLE ?auto_6225 ) ( HOLDING ?auto_6227 ) ( CLEAR ?auto_6226 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6226 ?auto_6227 )
      ( MAKE-2PILE ?auto_6223 ?auto_6224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6228 - BLOCK
      ?auto_6229 - BLOCK
    )
    :vars
    (
      ?auto_6230 - BLOCK
      ?auto_6231 - BLOCK
      ?auto_6232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6228 ?auto_6229 ) ) ( not ( = ?auto_6228 ?auto_6230 ) ) ( not ( = ?auto_6229 ?auto_6230 ) ) ( ON ?auto_6228 ?auto_6231 ) ( not ( = ?auto_6228 ?auto_6231 ) ) ( not ( = ?auto_6229 ?auto_6231 ) ) ( not ( = ?auto_6230 ?auto_6231 ) ) ( ON-TABLE ?auto_6232 ) ( not ( = ?auto_6232 ?auto_6230 ) ) ( not ( = ?auto_6232 ?auto_6229 ) ) ( not ( = ?auto_6228 ?auto_6232 ) ) ( not ( = ?auto_6231 ?auto_6232 ) ) ( ON ?auto_6229 ?auto_6228 ) ( ON-TABLE ?auto_6231 ) ( CLEAR ?auto_6232 ) ( ON ?auto_6230 ?auto_6229 ) ( CLEAR ?auto_6230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6231 ?auto_6228 ?auto_6229 )
      ( MAKE-2PILE ?auto_6228 ?auto_6229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6233 - BLOCK
      ?auto_6234 - BLOCK
    )
    :vars
    (
      ?auto_6235 - BLOCK
      ?auto_6236 - BLOCK
      ?auto_6237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6233 ?auto_6234 ) ) ( not ( = ?auto_6233 ?auto_6235 ) ) ( not ( = ?auto_6234 ?auto_6235 ) ) ( ON ?auto_6233 ?auto_6236 ) ( not ( = ?auto_6233 ?auto_6236 ) ) ( not ( = ?auto_6234 ?auto_6236 ) ) ( not ( = ?auto_6235 ?auto_6236 ) ) ( not ( = ?auto_6237 ?auto_6235 ) ) ( not ( = ?auto_6237 ?auto_6234 ) ) ( not ( = ?auto_6233 ?auto_6237 ) ) ( not ( = ?auto_6236 ?auto_6237 ) ) ( ON ?auto_6234 ?auto_6233 ) ( ON-TABLE ?auto_6236 ) ( ON ?auto_6235 ?auto_6234 ) ( CLEAR ?auto_6235 ) ( HOLDING ?auto_6237 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6237 )
      ( MAKE-2PILE ?auto_6233 ?auto_6234 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_6238 - BLOCK
      ?auto_6239 - BLOCK
    )
    :vars
    (
      ?auto_6240 - BLOCK
      ?auto_6242 - BLOCK
      ?auto_6241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6238 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6240 ) ) ( not ( = ?auto_6239 ?auto_6240 ) ) ( ON ?auto_6238 ?auto_6242 ) ( not ( = ?auto_6238 ?auto_6242 ) ) ( not ( = ?auto_6239 ?auto_6242 ) ) ( not ( = ?auto_6240 ?auto_6242 ) ) ( not ( = ?auto_6241 ?auto_6240 ) ) ( not ( = ?auto_6241 ?auto_6239 ) ) ( not ( = ?auto_6238 ?auto_6241 ) ) ( not ( = ?auto_6242 ?auto_6241 ) ) ( ON ?auto_6239 ?auto_6238 ) ( ON-TABLE ?auto_6242 ) ( ON ?auto_6240 ?auto_6239 ) ( ON ?auto_6241 ?auto_6240 ) ( CLEAR ?auto_6241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6242 ?auto_6238 ?auto_6239 ?auto_6240 )
      ( MAKE-2PILE ?auto_6238 ?auto_6239 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6254 - BLOCK
    )
    :vars
    (
      ?auto_6257 - BLOCK
      ?auto_6255 - BLOCK
      ?auto_6256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6257 ?auto_6254 ) ( ON-TABLE ?auto_6254 ) ( not ( = ?auto_6254 ?auto_6257 ) ) ( not ( = ?auto_6254 ?auto_6255 ) ) ( not ( = ?auto_6254 ?auto_6256 ) ) ( not ( = ?auto_6257 ?auto_6255 ) ) ( not ( = ?auto_6257 ?auto_6256 ) ) ( not ( = ?auto_6255 ?auto_6256 ) ) ( ON ?auto_6255 ?auto_6257 ) ( CLEAR ?auto_6255 ) ( HOLDING ?auto_6256 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6256 )
      ( MAKE-1PILE ?auto_6254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6287 - BLOCK
      ?auto_6288 - BLOCK
      ?auto_6289 - BLOCK
    )
    :vars
    (
      ?auto_6290 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6287 ) ( not ( = ?auto_6287 ?auto_6288 ) ) ( not ( = ?auto_6287 ?auto_6289 ) ) ( not ( = ?auto_6288 ?auto_6289 ) ) ( ON ?auto_6289 ?auto_6290 ) ( not ( = ?auto_6287 ?auto_6290 ) ) ( not ( = ?auto_6288 ?auto_6290 ) ) ( not ( = ?auto_6289 ?auto_6290 ) ) ( CLEAR ?auto_6287 ) ( ON ?auto_6288 ?auto_6289 ) ( CLEAR ?auto_6288 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6290 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6290 ?auto_6289 )
      ( MAKE-3PILE ?auto_6287 ?auto_6288 ?auto_6289 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6291 - BLOCK
      ?auto_6292 - BLOCK
      ?auto_6293 - BLOCK
    )
    :vars
    (
      ?auto_6294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6291 ?auto_6292 ) ) ( not ( = ?auto_6291 ?auto_6293 ) ) ( not ( = ?auto_6292 ?auto_6293 ) ) ( ON ?auto_6293 ?auto_6294 ) ( not ( = ?auto_6291 ?auto_6294 ) ) ( not ( = ?auto_6292 ?auto_6294 ) ) ( not ( = ?auto_6293 ?auto_6294 ) ) ( ON ?auto_6292 ?auto_6293 ) ( CLEAR ?auto_6292 ) ( ON-TABLE ?auto_6294 ) ( HOLDING ?auto_6291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6291 )
      ( MAKE-3PILE ?auto_6291 ?auto_6292 ?auto_6293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6295 - BLOCK
      ?auto_6296 - BLOCK
      ?auto_6297 - BLOCK
    )
    :vars
    (
      ?auto_6298 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6295 ?auto_6296 ) ) ( not ( = ?auto_6295 ?auto_6297 ) ) ( not ( = ?auto_6296 ?auto_6297 ) ) ( ON ?auto_6297 ?auto_6298 ) ( not ( = ?auto_6295 ?auto_6298 ) ) ( not ( = ?auto_6296 ?auto_6298 ) ) ( not ( = ?auto_6297 ?auto_6298 ) ) ( ON ?auto_6296 ?auto_6297 ) ( ON-TABLE ?auto_6298 ) ( ON ?auto_6295 ?auto_6296 ) ( CLEAR ?auto_6295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6298 ?auto_6297 ?auto_6296 )
      ( MAKE-3PILE ?auto_6295 ?auto_6296 ?auto_6297 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6302 - BLOCK
      ?auto_6303 - BLOCK
      ?auto_6304 - BLOCK
    )
    :vars
    (
      ?auto_6305 - BLOCK
      ?auto_6306 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6302 ?auto_6303 ) ) ( not ( = ?auto_6302 ?auto_6304 ) ) ( not ( = ?auto_6303 ?auto_6304 ) ) ( ON ?auto_6304 ?auto_6305 ) ( not ( = ?auto_6302 ?auto_6305 ) ) ( not ( = ?auto_6303 ?auto_6305 ) ) ( not ( = ?auto_6304 ?auto_6305 ) ) ( ON ?auto_6303 ?auto_6304 ) ( CLEAR ?auto_6303 ) ( ON-TABLE ?auto_6305 ) ( ON ?auto_6302 ?auto_6306 ) ( CLEAR ?auto_6302 ) ( HAND-EMPTY ) ( not ( = ?auto_6302 ?auto_6306 ) ) ( not ( = ?auto_6303 ?auto_6306 ) ) ( not ( = ?auto_6304 ?auto_6306 ) ) ( not ( = ?auto_6305 ?auto_6306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6302 ?auto_6306 )
      ( MAKE-3PILE ?auto_6302 ?auto_6303 ?auto_6304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6307 - BLOCK
      ?auto_6308 - BLOCK
      ?auto_6309 - BLOCK
    )
    :vars
    (
      ?auto_6311 - BLOCK
      ?auto_6310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6307 ?auto_6308 ) ) ( not ( = ?auto_6307 ?auto_6309 ) ) ( not ( = ?auto_6308 ?auto_6309 ) ) ( ON ?auto_6309 ?auto_6311 ) ( not ( = ?auto_6307 ?auto_6311 ) ) ( not ( = ?auto_6308 ?auto_6311 ) ) ( not ( = ?auto_6309 ?auto_6311 ) ) ( ON-TABLE ?auto_6311 ) ( ON ?auto_6307 ?auto_6310 ) ( CLEAR ?auto_6307 ) ( not ( = ?auto_6307 ?auto_6310 ) ) ( not ( = ?auto_6308 ?auto_6310 ) ) ( not ( = ?auto_6309 ?auto_6310 ) ) ( not ( = ?auto_6311 ?auto_6310 ) ) ( HOLDING ?auto_6308 ) ( CLEAR ?auto_6309 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6311 ?auto_6309 ?auto_6308 )
      ( MAKE-3PILE ?auto_6307 ?auto_6308 ?auto_6309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6312 - BLOCK
      ?auto_6313 - BLOCK
      ?auto_6314 - BLOCK
    )
    :vars
    (
      ?auto_6316 - BLOCK
      ?auto_6315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6312 ?auto_6313 ) ) ( not ( = ?auto_6312 ?auto_6314 ) ) ( not ( = ?auto_6313 ?auto_6314 ) ) ( ON ?auto_6314 ?auto_6316 ) ( not ( = ?auto_6312 ?auto_6316 ) ) ( not ( = ?auto_6313 ?auto_6316 ) ) ( not ( = ?auto_6314 ?auto_6316 ) ) ( ON-TABLE ?auto_6316 ) ( ON ?auto_6312 ?auto_6315 ) ( not ( = ?auto_6312 ?auto_6315 ) ) ( not ( = ?auto_6313 ?auto_6315 ) ) ( not ( = ?auto_6314 ?auto_6315 ) ) ( not ( = ?auto_6316 ?auto_6315 ) ) ( CLEAR ?auto_6314 ) ( ON ?auto_6313 ?auto_6312 ) ( CLEAR ?auto_6313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6315 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6315 ?auto_6312 )
      ( MAKE-3PILE ?auto_6312 ?auto_6313 ?auto_6314 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6317 - BLOCK
      ?auto_6318 - BLOCK
      ?auto_6319 - BLOCK
    )
    :vars
    (
      ?auto_6320 - BLOCK
      ?auto_6321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6317 ?auto_6318 ) ) ( not ( = ?auto_6317 ?auto_6319 ) ) ( not ( = ?auto_6318 ?auto_6319 ) ) ( not ( = ?auto_6317 ?auto_6320 ) ) ( not ( = ?auto_6318 ?auto_6320 ) ) ( not ( = ?auto_6319 ?auto_6320 ) ) ( ON-TABLE ?auto_6320 ) ( ON ?auto_6317 ?auto_6321 ) ( not ( = ?auto_6317 ?auto_6321 ) ) ( not ( = ?auto_6318 ?auto_6321 ) ) ( not ( = ?auto_6319 ?auto_6321 ) ) ( not ( = ?auto_6320 ?auto_6321 ) ) ( ON ?auto_6318 ?auto_6317 ) ( CLEAR ?auto_6318 ) ( ON-TABLE ?auto_6321 ) ( HOLDING ?auto_6319 ) ( CLEAR ?auto_6320 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6320 ?auto_6319 )
      ( MAKE-3PILE ?auto_6317 ?auto_6318 ?auto_6319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6322 - BLOCK
      ?auto_6323 - BLOCK
      ?auto_6324 - BLOCK
    )
    :vars
    (
      ?auto_6325 - BLOCK
      ?auto_6326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6322 ?auto_6323 ) ) ( not ( = ?auto_6322 ?auto_6324 ) ) ( not ( = ?auto_6323 ?auto_6324 ) ) ( not ( = ?auto_6322 ?auto_6325 ) ) ( not ( = ?auto_6323 ?auto_6325 ) ) ( not ( = ?auto_6324 ?auto_6325 ) ) ( ON-TABLE ?auto_6325 ) ( ON ?auto_6322 ?auto_6326 ) ( not ( = ?auto_6322 ?auto_6326 ) ) ( not ( = ?auto_6323 ?auto_6326 ) ) ( not ( = ?auto_6324 ?auto_6326 ) ) ( not ( = ?auto_6325 ?auto_6326 ) ) ( ON ?auto_6323 ?auto_6322 ) ( ON-TABLE ?auto_6326 ) ( CLEAR ?auto_6325 ) ( ON ?auto_6324 ?auto_6323 ) ( CLEAR ?auto_6324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6326 ?auto_6322 ?auto_6323 )
      ( MAKE-3PILE ?auto_6322 ?auto_6323 ?auto_6324 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6327 - BLOCK
      ?auto_6328 - BLOCK
      ?auto_6329 - BLOCK
    )
    :vars
    (
      ?auto_6330 - BLOCK
      ?auto_6331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6327 ?auto_6328 ) ) ( not ( = ?auto_6327 ?auto_6329 ) ) ( not ( = ?auto_6328 ?auto_6329 ) ) ( not ( = ?auto_6327 ?auto_6330 ) ) ( not ( = ?auto_6328 ?auto_6330 ) ) ( not ( = ?auto_6329 ?auto_6330 ) ) ( ON ?auto_6327 ?auto_6331 ) ( not ( = ?auto_6327 ?auto_6331 ) ) ( not ( = ?auto_6328 ?auto_6331 ) ) ( not ( = ?auto_6329 ?auto_6331 ) ) ( not ( = ?auto_6330 ?auto_6331 ) ) ( ON ?auto_6328 ?auto_6327 ) ( ON-TABLE ?auto_6331 ) ( ON ?auto_6329 ?auto_6328 ) ( CLEAR ?auto_6329 ) ( HOLDING ?auto_6330 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6330 )
      ( MAKE-3PILE ?auto_6327 ?auto_6328 ?auto_6329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6332 - BLOCK
      ?auto_6333 - BLOCK
      ?auto_6334 - BLOCK
    )
    :vars
    (
      ?auto_6335 - BLOCK
      ?auto_6336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6332 ?auto_6333 ) ) ( not ( = ?auto_6332 ?auto_6334 ) ) ( not ( = ?auto_6333 ?auto_6334 ) ) ( not ( = ?auto_6332 ?auto_6335 ) ) ( not ( = ?auto_6333 ?auto_6335 ) ) ( not ( = ?auto_6334 ?auto_6335 ) ) ( ON ?auto_6332 ?auto_6336 ) ( not ( = ?auto_6332 ?auto_6336 ) ) ( not ( = ?auto_6333 ?auto_6336 ) ) ( not ( = ?auto_6334 ?auto_6336 ) ) ( not ( = ?auto_6335 ?auto_6336 ) ) ( ON ?auto_6333 ?auto_6332 ) ( ON-TABLE ?auto_6336 ) ( ON ?auto_6334 ?auto_6333 ) ( ON ?auto_6335 ?auto_6334 ) ( CLEAR ?auto_6335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6336 ?auto_6332 ?auto_6333 ?auto_6334 )
      ( MAKE-3PILE ?auto_6332 ?auto_6333 ?auto_6334 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6345 - BLOCK
      ?auto_6346 - BLOCK
      ?auto_6347 - BLOCK
      ?auto_6348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6347 ) ( ON-TABLE ?auto_6345 ) ( ON ?auto_6346 ?auto_6345 ) ( ON ?auto_6347 ?auto_6346 ) ( not ( = ?auto_6345 ?auto_6346 ) ) ( not ( = ?auto_6345 ?auto_6347 ) ) ( not ( = ?auto_6345 ?auto_6348 ) ) ( not ( = ?auto_6346 ?auto_6347 ) ) ( not ( = ?auto_6346 ?auto_6348 ) ) ( not ( = ?auto_6347 ?auto_6348 ) ) ( ON-TABLE ?auto_6348 ) ( CLEAR ?auto_6348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_6348 )
      ( MAKE-4PILE ?auto_6345 ?auto_6346 ?auto_6347 ?auto_6348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6349 - BLOCK
      ?auto_6350 - BLOCK
      ?auto_6351 - BLOCK
      ?auto_6352 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6349 ) ( ON ?auto_6350 ?auto_6349 ) ( not ( = ?auto_6349 ?auto_6350 ) ) ( not ( = ?auto_6349 ?auto_6351 ) ) ( not ( = ?auto_6349 ?auto_6352 ) ) ( not ( = ?auto_6350 ?auto_6351 ) ) ( not ( = ?auto_6350 ?auto_6352 ) ) ( not ( = ?auto_6351 ?auto_6352 ) ) ( ON-TABLE ?auto_6352 ) ( CLEAR ?auto_6352 ) ( HOLDING ?auto_6351 ) ( CLEAR ?auto_6350 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6349 ?auto_6350 ?auto_6351 )
      ( MAKE-4PILE ?auto_6349 ?auto_6350 ?auto_6351 ?auto_6352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6353 - BLOCK
      ?auto_6354 - BLOCK
      ?auto_6355 - BLOCK
      ?auto_6356 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6353 ) ( ON ?auto_6354 ?auto_6353 ) ( not ( = ?auto_6353 ?auto_6354 ) ) ( not ( = ?auto_6353 ?auto_6355 ) ) ( not ( = ?auto_6353 ?auto_6356 ) ) ( not ( = ?auto_6354 ?auto_6355 ) ) ( not ( = ?auto_6354 ?auto_6356 ) ) ( not ( = ?auto_6355 ?auto_6356 ) ) ( ON-TABLE ?auto_6356 ) ( CLEAR ?auto_6354 ) ( ON ?auto_6355 ?auto_6356 ) ( CLEAR ?auto_6355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6356 )
      ( MAKE-4PILE ?auto_6353 ?auto_6354 ?auto_6355 ?auto_6356 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6357 - BLOCK
      ?auto_6358 - BLOCK
      ?auto_6359 - BLOCK
      ?auto_6360 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6357 ) ( not ( = ?auto_6357 ?auto_6358 ) ) ( not ( = ?auto_6357 ?auto_6359 ) ) ( not ( = ?auto_6357 ?auto_6360 ) ) ( not ( = ?auto_6358 ?auto_6359 ) ) ( not ( = ?auto_6358 ?auto_6360 ) ) ( not ( = ?auto_6359 ?auto_6360 ) ) ( ON-TABLE ?auto_6360 ) ( ON ?auto_6359 ?auto_6360 ) ( CLEAR ?auto_6359 ) ( HOLDING ?auto_6358 ) ( CLEAR ?auto_6357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6357 ?auto_6358 )
      ( MAKE-4PILE ?auto_6357 ?auto_6358 ?auto_6359 ?auto_6360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6361 - BLOCK
      ?auto_6362 - BLOCK
      ?auto_6363 - BLOCK
      ?auto_6364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6361 ) ( not ( = ?auto_6361 ?auto_6362 ) ) ( not ( = ?auto_6361 ?auto_6363 ) ) ( not ( = ?auto_6361 ?auto_6364 ) ) ( not ( = ?auto_6362 ?auto_6363 ) ) ( not ( = ?auto_6362 ?auto_6364 ) ) ( not ( = ?auto_6363 ?auto_6364 ) ) ( ON-TABLE ?auto_6364 ) ( ON ?auto_6363 ?auto_6364 ) ( CLEAR ?auto_6361 ) ( ON ?auto_6362 ?auto_6363 ) ( CLEAR ?auto_6362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6364 ?auto_6363 )
      ( MAKE-4PILE ?auto_6361 ?auto_6362 ?auto_6363 ?auto_6364 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6365 - BLOCK
      ?auto_6366 - BLOCK
      ?auto_6367 - BLOCK
      ?auto_6368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6365 ?auto_6366 ) ) ( not ( = ?auto_6365 ?auto_6367 ) ) ( not ( = ?auto_6365 ?auto_6368 ) ) ( not ( = ?auto_6366 ?auto_6367 ) ) ( not ( = ?auto_6366 ?auto_6368 ) ) ( not ( = ?auto_6367 ?auto_6368 ) ) ( ON-TABLE ?auto_6368 ) ( ON ?auto_6367 ?auto_6368 ) ( ON ?auto_6366 ?auto_6367 ) ( CLEAR ?auto_6366 ) ( HOLDING ?auto_6365 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6365 )
      ( MAKE-4PILE ?auto_6365 ?auto_6366 ?auto_6367 ?auto_6368 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6369 - BLOCK
      ?auto_6370 - BLOCK
      ?auto_6371 - BLOCK
      ?auto_6372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6369 ?auto_6370 ) ) ( not ( = ?auto_6369 ?auto_6371 ) ) ( not ( = ?auto_6369 ?auto_6372 ) ) ( not ( = ?auto_6370 ?auto_6371 ) ) ( not ( = ?auto_6370 ?auto_6372 ) ) ( not ( = ?auto_6371 ?auto_6372 ) ) ( ON-TABLE ?auto_6372 ) ( ON ?auto_6371 ?auto_6372 ) ( ON ?auto_6370 ?auto_6371 ) ( ON ?auto_6369 ?auto_6370 ) ( CLEAR ?auto_6369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6372 ?auto_6371 ?auto_6370 )
      ( MAKE-4PILE ?auto_6369 ?auto_6370 ?auto_6371 ?auto_6372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6377 - BLOCK
      ?auto_6378 - BLOCK
      ?auto_6379 - BLOCK
      ?auto_6380 - BLOCK
    )
    :vars
    (
      ?auto_6381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6377 ?auto_6378 ) ) ( not ( = ?auto_6377 ?auto_6379 ) ) ( not ( = ?auto_6377 ?auto_6380 ) ) ( not ( = ?auto_6378 ?auto_6379 ) ) ( not ( = ?auto_6378 ?auto_6380 ) ) ( not ( = ?auto_6379 ?auto_6380 ) ) ( ON-TABLE ?auto_6380 ) ( ON ?auto_6379 ?auto_6380 ) ( ON ?auto_6378 ?auto_6379 ) ( CLEAR ?auto_6378 ) ( ON ?auto_6377 ?auto_6381 ) ( CLEAR ?auto_6377 ) ( HAND-EMPTY ) ( not ( = ?auto_6377 ?auto_6381 ) ) ( not ( = ?auto_6378 ?auto_6381 ) ) ( not ( = ?auto_6379 ?auto_6381 ) ) ( not ( = ?auto_6380 ?auto_6381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6377 ?auto_6381 )
      ( MAKE-4PILE ?auto_6377 ?auto_6378 ?auto_6379 ?auto_6380 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6382 - BLOCK
      ?auto_6383 - BLOCK
      ?auto_6384 - BLOCK
      ?auto_6385 - BLOCK
    )
    :vars
    (
      ?auto_6386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6382 ?auto_6383 ) ) ( not ( = ?auto_6382 ?auto_6384 ) ) ( not ( = ?auto_6382 ?auto_6385 ) ) ( not ( = ?auto_6383 ?auto_6384 ) ) ( not ( = ?auto_6383 ?auto_6385 ) ) ( not ( = ?auto_6384 ?auto_6385 ) ) ( ON-TABLE ?auto_6385 ) ( ON ?auto_6384 ?auto_6385 ) ( ON ?auto_6382 ?auto_6386 ) ( CLEAR ?auto_6382 ) ( not ( = ?auto_6382 ?auto_6386 ) ) ( not ( = ?auto_6383 ?auto_6386 ) ) ( not ( = ?auto_6384 ?auto_6386 ) ) ( not ( = ?auto_6385 ?auto_6386 ) ) ( HOLDING ?auto_6383 ) ( CLEAR ?auto_6384 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6385 ?auto_6384 ?auto_6383 )
      ( MAKE-4PILE ?auto_6382 ?auto_6383 ?auto_6384 ?auto_6385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6387 - BLOCK
      ?auto_6388 - BLOCK
      ?auto_6389 - BLOCK
      ?auto_6390 - BLOCK
    )
    :vars
    (
      ?auto_6391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6387 ?auto_6388 ) ) ( not ( = ?auto_6387 ?auto_6389 ) ) ( not ( = ?auto_6387 ?auto_6390 ) ) ( not ( = ?auto_6388 ?auto_6389 ) ) ( not ( = ?auto_6388 ?auto_6390 ) ) ( not ( = ?auto_6389 ?auto_6390 ) ) ( ON-TABLE ?auto_6390 ) ( ON ?auto_6389 ?auto_6390 ) ( ON ?auto_6387 ?auto_6391 ) ( not ( = ?auto_6387 ?auto_6391 ) ) ( not ( = ?auto_6388 ?auto_6391 ) ) ( not ( = ?auto_6389 ?auto_6391 ) ) ( not ( = ?auto_6390 ?auto_6391 ) ) ( CLEAR ?auto_6389 ) ( ON ?auto_6388 ?auto_6387 ) ( CLEAR ?auto_6388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6391 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6391 ?auto_6387 )
      ( MAKE-4PILE ?auto_6387 ?auto_6388 ?auto_6389 ?auto_6390 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6392 - BLOCK
      ?auto_6393 - BLOCK
      ?auto_6394 - BLOCK
      ?auto_6395 - BLOCK
    )
    :vars
    (
      ?auto_6396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6392 ?auto_6393 ) ) ( not ( = ?auto_6392 ?auto_6394 ) ) ( not ( = ?auto_6392 ?auto_6395 ) ) ( not ( = ?auto_6393 ?auto_6394 ) ) ( not ( = ?auto_6393 ?auto_6395 ) ) ( not ( = ?auto_6394 ?auto_6395 ) ) ( ON-TABLE ?auto_6395 ) ( ON ?auto_6392 ?auto_6396 ) ( not ( = ?auto_6392 ?auto_6396 ) ) ( not ( = ?auto_6393 ?auto_6396 ) ) ( not ( = ?auto_6394 ?auto_6396 ) ) ( not ( = ?auto_6395 ?auto_6396 ) ) ( ON ?auto_6393 ?auto_6392 ) ( CLEAR ?auto_6393 ) ( ON-TABLE ?auto_6396 ) ( HOLDING ?auto_6394 ) ( CLEAR ?auto_6395 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6395 ?auto_6394 )
      ( MAKE-4PILE ?auto_6392 ?auto_6393 ?auto_6394 ?auto_6395 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6397 - BLOCK
      ?auto_6398 - BLOCK
      ?auto_6399 - BLOCK
      ?auto_6400 - BLOCK
    )
    :vars
    (
      ?auto_6401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6397 ?auto_6398 ) ) ( not ( = ?auto_6397 ?auto_6399 ) ) ( not ( = ?auto_6397 ?auto_6400 ) ) ( not ( = ?auto_6398 ?auto_6399 ) ) ( not ( = ?auto_6398 ?auto_6400 ) ) ( not ( = ?auto_6399 ?auto_6400 ) ) ( ON-TABLE ?auto_6400 ) ( ON ?auto_6397 ?auto_6401 ) ( not ( = ?auto_6397 ?auto_6401 ) ) ( not ( = ?auto_6398 ?auto_6401 ) ) ( not ( = ?auto_6399 ?auto_6401 ) ) ( not ( = ?auto_6400 ?auto_6401 ) ) ( ON ?auto_6398 ?auto_6397 ) ( ON-TABLE ?auto_6401 ) ( CLEAR ?auto_6400 ) ( ON ?auto_6399 ?auto_6398 ) ( CLEAR ?auto_6399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6401 ?auto_6397 ?auto_6398 )
      ( MAKE-4PILE ?auto_6397 ?auto_6398 ?auto_6399 ?auto_6400 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6402 - BLOCK
      ?auto_6403 - BLOCK
      ?auto_6404 - BLOCK
      ?auto_6405 - BLOCK
    )
    :vars
    (
      ?auto_6406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6402 ?auto_6403 ) ) ( not ( = ?auto_6402 ?auto_6404 ) ) ( not ( = ?auto_6402 ?auto_6405 ) ) ( not ( = ?auto_6403 ?auto_6404 ) ) ( not ( = ?auto_6403 ?auto_6405 ) ) ( not ( = ?auto_6404 ?auto_6405 ) ) ( ON ?auto_6402 ?auto_6406 ) ( not ( = ?auto_6402 ?auto_6406 ) ) ( not ( = ?auto_6403 ?auto_6406 ) ) ( not ( = ?auto_6404 ?auto_6406 ) ) ( not ( = ?auto_6405 ?auto_6406 ) ) ( ON ?auto_6403 ?auto_6402 ) ( ON-TABLE ?auto_6406 ) ( ON ?auto_6404 ?auto_6403 ) ( CLEAR ?auto_6404 ) ( HOLDING ?auto_6405 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6405 )
      ( MAKE-4PILE ?auto_6402 ?auto_6403 ?auto_6404 ?auto_6405 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6407 - BLOCK
      ?auto_6408 - BLOCK
      ?auto_6409 - BLOCK
      ?auto_6410 - BLOCK
    )
    :vars
    (
      ?auto_6411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6407 ?auto_6408 ) ) ( not ( = ?auto_6407 ?auto_6409 ) ) ( not ( = ?auto_6407 ?auto_6410 ) ) ( not ( = ?auto_6408 ?auto_6409 ) ) ( not ( = ?auto_6408 ?auto_6410 ) ) ( not ( = ?auto_6409 ?auto_6410 ) ) ( ON ?auto_6407 ?auto_6411 ) ( not ( = ?auto_6407 ?auto_6411 ) ) ( not ( = ?auto_6408 ?auto_6411 ) ) ( not ( = ?auto_6409 ?auto_6411 ) ) ( not ( = ?auto_6410 ?auto_6411 ) ) ( ON ?auto_6408 ?auto_6407 ) ( ON-TABLE ?auto_6411 ) ( ON ?auto_6409 ?auto_6408 ) ( ON ?auto_6410 ?auto_6409 ) ( CLEAR ?auto_6410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6411 ?auto_6407 ?auto_6408 ?auto_6409 )
      ( MAKE-4PILE ?auto_6407 ?auto_6408 ?auto_6409 ?auto_6410 ) )
  )

)

