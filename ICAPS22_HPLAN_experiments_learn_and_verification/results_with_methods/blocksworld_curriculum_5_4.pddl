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
      ?auto_5945 - BLOCK
    )
    :vars
    (
      ?auto_5946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5945 ?auto_5946 ) ( CLEAR ?auto_5945 ) ( HAND-EMPTY ) ( not ( = ?auto_5945 ?auto_5946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5945 ?auto_5946 )
      ( !PUTDOWN ?auto_5945 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_5948 - BLOCK
    )
    :vars
    (
      ?auto_5949 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5948 ?auto_5949 ) ( CLEAR ?auto_5948 ) ( HAND-EMPTY ) ( not ( = ?auto_5948 ?auto_5949 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5948 ?auto_5949 )
      ( !PUTDOWN ?auto_5948 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5952 - BLOCK
      ?auto_5953 - BLOCK
    )
    :vars
    (
      ?auto_5954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5952 ) ( ON ?auto_5953 ?auto_5954 ) ( CLEAR ?auto_5953 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5952 ) ( not ( = ?auto_5952 ?auto_5953 ) ) ( not ( = ?auto_5952 ?auto_5954 ) ) ( not ( = ?auto_5953 ?auto_5954 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5953 ?auto_5954 )
      ( !STACK ?auto_5953 ?auto_5952 ) )
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
    ( and ( CLEAR ?auto_5957 ) ( ON ?auto_5958 ?auto_5959 ) ( CLEAR ?auto_5958 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5957 ) ( not ( = ?auto_5957 ?auto_5958 ) ) ( not ( = ?auto_5957 ?auto_5959 ) ) ( not ( = ?auto_5958 ?auto_5959 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5958 ?auto_5959 )
      ( !STACK ?auto_5958 ?auto_5957 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_5962 - BLOCK
      ?auto_5963 - BLOCK
    )
    :vars
    (
      ?auto_5964 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5963 ?auto_5964 ) ( not ( = ?auto_5962 ?auto_5963 ) ) ( not ( = ?auto_5962 ?auto_5964 ) ) ( not ( = ?auto_5963 ?auto_5964 ) ) ( ON ?auto_5962 ?auto_5963 ) ( CLEAR ?auto_5962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5962 )
      ( MAKE-2PILE ?auto_5962 ?auto_5963 ) )
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
    ( and ( ON ?auto_5968 ?auto_5969 ) ( not ( = ?auto_5967 ?auto_5968 ) ) ( not ( = ?auto_5967 ?auto_5969 ) ) ( not ( = ?auto_5968 ?auto_5969 ) ) ( ON ?auto_5967 ?auto_5968 ) ( CLEAR ?auto_5967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_5967 )
      ( MAKE-2PILE ?auto_5967 ?auto_5968 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5973 - BLOCK
      ?auto_5974 - BLOCK
      ?auto_5975 - BLOCK
    )
    :vars
    (
      ?auto_5976 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5974 ) ( ON ?auto_5975 ?auto_5976 ) ( CLEAR ?auto_5975 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5973 ) ( ON ?auto_5974 ?auto_5973 ) ( not ( = ?auto_5973 ?auto_5974 ) ) ( not ( = ?auto_5973 ?auto_5975 ) ) ( not ( = ?auto_5973 ?auto_5976 ) ) ( not ( = ?auto_5974 ?auto_5975 ) ) ( not ( = ?auto_5974 ?auto_5976 ) ) ( not ( = ?auto_5975 ?auto_5976 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5975 ?auto_5976 )
      ( !STACK ?auto_5975 ?auto_5974 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5980 - BLOCK
      ?auto_5981 - BLOCK
      ?auto_5982 - BLOCK
    )
    :vars
    (
      ?auto_5983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_5981 ) ( ON ?auto_5982 ?auto_5983 ) ( CLEAR ?auto_5982 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_5980 ) ( ON ?auto_5981 ?auto_5980 ) ( not ( = ?auto_5980 ?auto_5981 ) ) ( not ( = ?auto_5980 ?auto_5982 ) ) ( not ( = ?auto_5980 ?auto_5983 ) ) ( not ( = ?auto_5981 ?auto_5982 ) ) ( not ( = ?auto_5981 ?auto_5983 ) ) ( not ( = ?auto_5982 ?auto_5983 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_5982 ?auto_5983 )
      ( !STACK ?auto_5982 ?auto_5981 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5987 - BLOCK
      ?auto_5988 - BLOCK
      ?auto_5989 - BLOCK
    )
    :vars
    (
      ?auto_5990 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5989 ?auto_5990 ) ( ON-TABLE ?auto_5987 ) ( not ( = ?auto_5987 ?auto_5988 ) ) ( not ( = ?auto_5987 ?auto_5989 ) ) ( not ( = ?auto_5987 ?auto_5990 ) ) ( not ( = ?auto_5988 ?auto_5989 ) ) ( not ( = ?auto_5988 ?auto_5990 ) ) ( not ( = ?auto_5989 ?auto_5990 ) ) ( CLEAR ?auto_5987 ) ( ON ?auto_5988 ?auto_5989 ) ( CLEAR ?auto_5988 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5987 ?auto_5988 )
      ( MAKE-3PILE ?auto_5987 ?auto_5988 ?auto_5989 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_5994 - BLOCK
      ?auto_5995 - BLOCK
      ?auto_5996 - BLOCK
    )
    :vars
    (
      ?auto_5997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_5996 ?auto_5997 ) ( ON-TABLE ?auto_5994 ) ( not ( = ?auto_5994 ?auto_5995 ) ) ( not ( = ?auto_5994 ?auto_5996 ) ) ( not ( = ?auto_5994 ?auto_5997 ) ) ( not ( = ?auto_5995 ?auto_5996 ) ) ( not ( = ?auto_5995 ?auto_5997 ) ) ( not ( = ?auto_5996 ?auto_5997 ) ) ( CLEAR ?auto_5994 ) ( ON ?auto_5995 ?auto_5996 ) ( CLEAR ?auto_5995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_5994 ?auto_5995 )
      ( MAKE-3PILE ?auto_5994 ?auto_5995 ?auto_5996 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6001 - BLOCK
      ?auto_6002 - BLOCK
      ?auto_6003 - BLOCK
    )
    :vars
    (
      ?auto_6004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6003 ?auto_6004 ) ( not ( = ?auto_6001 ?auto_6002 ) ) ( not ( = ?auto_6001 ?auto_6003 ) ) ( not ( = ?auto_6001 ?auto_6004 ) ) ( not ( = ?auto_6002 ?auto_6003 ) ) ( not ( = ?auto_6002 ?auto_6004 ) ) ( not ( = ?auto_6003 ?auto_6004 ) ) ( ON ?auto_6002 ?auto_6003 ) ( ON ?auto_6001 ?auto_6002 ) ( CLEAR ?auto_6001 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6001 )
      ( MAKE-3PILE ?auto_6001 ?auto_6002 ?auto_6003 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_6008 - BLOCK
      ?auto_6009 - BLOCK
      ?auto_6010 - BLOCK
    )
    :vars
    (
      ?auto_6011 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6010 ?auto_6011 ) ( not ( = ?auto_6008 ?auto_6009 ) ) ( not ( = ?auto_6008 ?auto_6010 ) ) ( not ( = ?auto_6008 ?auto_6011 ) ) ( not ( = ?auto_6009 ?auto_6010 ) ) ( not ( = ?auto_6009 ?auto_6011 ) ) ( not ( = ?auto_6010 ?auto_6011 ) ) ( ON ?auto_6009 ?auto_6010 ) ( ON ?auto_6008 ?auto_6009 ) ( CLEAR ?auto_6008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6008 )
      ( MAKE-3PILE ?auto_6008 ?auto_6009 ?auto_6010 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6016 - BLOCK
      ?auto_6017 - BLOCK
      ?auto_6018 - BLOCK
      ?auto_6019 - BLOCK
    )
    :vars
    (
      ?auto_6020 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6018 ) ( ON ?auto_6019 ?auto_6020 ) ( CLEAR ?auto_6019 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6016 ) ( ON ?auto_6017 ?auto_6016 ) ( ON ?auto_6018 ?auto_6017 ) ( not ( = ?auto_6016 ?auto_6017 ) ) ( not ( = ?auto_6016 ?auto_6018 ) ) ( not ( = ?auto_6016 ?auto_6019 ) ) ( not ( = ?auto_6016 ?auto_6020 ) ) ( not ( = ?auto_6017 ?auto_6018 ) ) ( not ( = ?auto_6017 ?auto_6019 ) ) ( not ( = ?auto_6017 ?auto_6020 ) ) ( not ( = ?auto_6018 ?auto_6019 ) ) ( not ( = ?auto_6018 ?auto_6020 ) ) ( not ( = ?auto_6019 ?auto_6020 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6019 ?auto_6020 )
      ( !STACK ?auto_6019 ?auto_6018 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6025 - BLOCK
      ?auto_6026 - BLOCK
      ?auto_6027 - BLOCK
      ?auto_6028 - BLOCK
    )
    :vars
    (
      ?auto_6029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6027 ) ( ON ?auto_6028 ?auto_6029 ) ( CLEAR ?auto_6028 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6025 ) ( ON ?auto_6026 ?auto_6025 ) ( ON ?auto_6027 ?auto_6026 ) ( not ( = ?auto_6025 ?auto_6026 ) ) ( not ( = ?auto_6025 ?auto_6027 ) ) ( not ( = ?auto_6025 ?auto_6028 ) ) ( not ( = ?auto_6025 ?auto_6029 ) ) ( not ( = ?auto_6026 ?auto_6027 ) ) ( not ( = ?auto_6026 ?auto_6028 ) ) ( not ( = ?auto_6026 ?auto_6029 ) ) ( not ( = ?auto_6027 ?auto_6028 ) ) ( not ( = ?auto_6027 ?auto_6029 ) ) ( not ( = ?auto_6028 ?auto_6029 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6028 ?auto_6029 )
      ( !STACK ?auto_6028 ?auto_6027 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6034 - BLOCK
      ?auto_6035 - BLOCK
      ?auto_6036 - BLOCK
      ?auto_6037 - BLOCK
    )
    :vars
    (
      ?auto_6038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6037 ?auto_6038 ) ( ON-TABLE ?auto_6034 ) ( ON ?auto_6035 ?auto_6034 ) ( not ( = ?auto_6034 ?auto_6035 ) ) ( not ( = ?auto_6034 ?auto_6036 ) ) ( not ( = ?auto_6034 ?auto_6037 ) ) ( not ( = ?auto_6034 ?auto_6038 ) ) ( not ( = ?auto_6035 ?auto_6036 ) ) ( not ( = ?auto_6035 ?auto_6037 ) ) ( not ( = ?auto_6035 ?auto_6038 ) ) ( not ( = ?auto_6036 ?auto_6037 ) ) ( not ( = ?auto_6036 ?auto_6038 ) ) ( not ( = ?auto_6037 ?auto_6038 ) ) ( CLEAR ?auto_6035 ) ( ON ?auto_6036 ?auto_6037 ) ( CLEAR ?auto_6036 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6034 ?auto_6035 ?auto_6036 )
      ( MAKE-4PILE ?auto_6034 ?auto_6035 ?auto_6036 ?auto_6037 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6043 - BLOCK
      ?auto_6044 - BLOCK
      ?auto_6045 - BLOCK
      ?auto_6046 - BLOCK
    )
    :vars
    (
      ?auto_6047 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6046 ?auto_6047 ) ( ON-TABLE ?auto_6043 ) ( ON ?auto_6044 ?auto_6043 ) ( not ( = ?auto_6043 ?auto_6044 ) ) ( not ( = ?auto_6043 ?auto_6045 ) ) ( not ( = ?auto_6043 ?auto_6046 ) ) ( not ( = ?auto_6043 ?auto_6047 ) ) ( not ( = ?auto_6044 ?auto_6045 ) ) ( not ( = ?auto_6044 ?auto_6046 ) ) ( not ( = ?auto_6044 ?auto_6047 ) ) ( not ( = ?auto_6045 ?auto_6046 ) ) ( not ( = ?auto_6045 ?auto_6047 ) ) ( not ( = ?auto_6046 ?auto_6047 ) ) ( CLEAR ?auto_6044 ) ( ON ?auto_6045 ?auto_6046 ) ( CLEAR ?auto_6045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6043 ?auto_6044 ?auto_6045 )
      ( MAKE-4PILE ?auto_6043 ?auto_6044 ?auto_6045 ?auto_6046 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6052 - BLOCK
      ?auto_6053 - BLOCK
      ?auto_6054 - BLOCK
      ?auto_6055 - BLOCK
    )
    :vars
    (
      ?auto_6056 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6055 ?auto_6056 ) ( ON-TABLE ?auto_6052 ) ( not ( = ?auto_6052 ?auto_6053 ) ) ( not ( = ?auto_6052 ?auto_6054 ) ) ( not ( = ?auto_6052 ?auto_6055 ) ) ( not ( = ?auto_6052 ?auto_6056 ) ) ( not ( = ?auto_6053 ?auto_6054 ) ) ( not ( = ?auto_6053 ?auto_6055 ) ) ( not ( = ?auto_6053 ?auto_6056 ) ) ( not ( = ?auto_6054 ?auto_6055 ) ) ( not ( = ?auto_6054 ?auto_6056 ) ) ( not ( = ?auto_6055 ?auto_6056 ) ) ( ON ?auto_6054 ?auto_6055 ) ( CLEAR ?auto_6052 ) ( ON ?auto_6053 ?auto_6054 ) ( CLEAR ?auto_6053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6052 ?auto_6053 )
      ( MAKE-4PILE ?auto_6052 ?auto_6053 ?auto_6054 ?auto_6055 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6061 - BLOCK
      ?auto_6062 - BLOCK
      ?auto_6063 - BLOCK
      ?auto_6064 - BLOCK
    )
    :vars
    (
      ?auto_6065 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6064 ?auto_6065 ) ( ON-TABLE ?auto_6061 ) ( not ( = ?auto_6061 ?auto_6062 ) ) ( not ( = ?auto_6061 ?auto_6063 ) ) ( not ( = ?auto_6061 ?auto_6064 ) ) ( not ( = ?auto_6061 ?auto_6065 ) ) ( not ( = ?auto_6062 ?auto_6063 ) ) ( not ( = ?auto_6062 ?auto_6064 ) ) ( not ( = ?auto_6062 ?auto_6065 ) ) ( not ( = ?auto_6063 ?auto_6064 ) ) ( not ( = ?auto_6063 ?auto_6065 ) ) ( not ( = ?auto_6064 ?auto_6065 ) ) ( ON ?auto_6063 ?auto_6064 ) ( CLEAR ?auto_6061 ) ( ON ?auto_6062 ?auto_6063 ) ( CLEAR ?auto_6062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6061 ?auto_6062 )
      ( MAKE-4PILE ?auto_6061 ?auto_6062 ?auto_6063 ?auto_6064 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6070 - BLOCK
      ?auto_6071 - BLOCK
      ?auto_6072 - BLOCK
      ?auto_6073 - BLOCK
    )
    :vars
    (
      ?auto_6074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6073 ?auto_6074 ) ( not ( = ?auto_6070 ?auto_6071 ) ) ( not ( = ?auto_6070 ?auto_6072 ) ) ( not ( = ?auto_6070 ?auto_6073 ) ) ( not ( = ?auto_6070 ?auto_6074 ) ) ( not ( = ?auto_6071 ?auto_6072 ) ) ( not ( = ?auto_6071 ?auto_6073 ) ) ( not ( = ?auto_6071 ?auto_6074 ) ) ( not ( = ?auto_6072 ?auto_6073 ) ) ( not ( = ?auto_6072 ?auto_6074 ) ) ( not ( = ?auto_6073 ?auto_6074 ) ) ( ON ?auto_6072 ?auto_6073 ) ( ON ?auto_6071 ?auto_6072 ) ( ON ?auto_6070 ?auto_6071 ) ( CLEAR ?auto_6070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6070 )
      ( MAKE-4PILE ?auto_6070 ?auto_6071 ?auto_6072 ?auto_6073 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_6079 - BLOCK
      ?auto_6080 - BLOCK
      ?auto_6081 - BLOCK
      ?auto_6082 - BLOCK
    )
    :vars
    (
      ?auto_6083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6082 ?auto_6083 ) ( not ( = ?auto_6079 ?auto_6080 ) ) ( not ( = ?auto_6079 ?auto_6081 ) ) ( not ( = ?auto_6079 ?auto_6082 ) ) ( not ( = ?auto_6079 ?auto_6083 ) ) ( not ( = ?auto_6080 ?auto_6081 ) ) ( not ( = ?auto_6080 ?auto_6082 ) ) ( not ( = ?auto_6080 ?auto_6083 ) ) ( not ( = ?auto_6081 ?auto_6082 ) ) ( not ( = ?auto_6081 ?auto_6083 ) ) ( not ( = ?auto_6082 ?auto_6083 ) ) ( ON ?auto_6081 ?auto_6082 ) ( ON ?auto_6080 ?auto_6081 ) ( ON ?auto_6079 ?auto_6080 ) ( CLEAR ?auto_6079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6079 )
      ( MAKE-4PILE ?auto_6079 ?auto_6080 ?auto_6081 ?auto_6082 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6089 - BLOCK
      ?auto_6090 - BLOCK
      ?auto_6091 - BLOCK
      ?auto_6092 - BLOCK
      ?auto_6093 - BLOCK
    )
    :vars
    (
      ?auto_6094 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6092 ) ( ON ?auto_6093 ?auto_6094 ) ( CLEAR ?auto_6093 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6089 ) ( ON ?auto_6090 ?auto_6089 ) ( ON ?auto_6091 ?auto_6090 ) ( ON ?auto_6092 ?auto_6091 ) ( not ( = ?auto_6089 ?auto_6090 ) ) ( not ( = ?auto_6089 ?auto_6091 ) ) ( not ( = ?auto_6089 ?auto_6092 ) ) ( not ( = ?auto_6089 ?auto_6093 ) ) ( not ( = ?auto_6089 ?auto_6094 ) ) ( not ( = ?auto_6090 ?auto_6091 ) ) ( not ( = ?auto_6090 ?auto_6092 ) ) ( not ( = ?auto_6090 ?auto_6093 ) ) ( not ( = ?auto_6090 ?auto_6094 ) ) ( not ( = ?auto_6091 ?auto_6092 ) ) ( not ( = ?auto_6091 ?auto_6093 ) ) ( not ( = ?auto_6091 ?auto_6094 ) ) ( not ( = ?auto_6092 ?auto_6093 ) ) ( not ( = ?auto_6092 ?auto_6094 ) ) ( not ( = ?auto_6093 ?auto_6094 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_6093 ?auto_6094 )
      ( !STACK ?auto_6093 ?auto_6092 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6100 - BLOCK
      ?auto_6101 - BLOCK
      ?auto_6102 - BLOCK
      ?auto_6103 - BLOCK
      ?auto_6104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_6103 ) ( ON-TABLE ?auto_6104 ) ( CLEAR ?auto_6104 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_6100 ) ( ON ?auto_6101 ?auto_6100 ) ( ON ?auto_6102 ?auto_6101 ) ( ON ?auto_6103 ?auto_6102 ) ( not ( = ?auto_6100 ?auto_6101 ) ) ( not ( = ?auto_6100 ?auto_6102 ) ) ( not ( = ?auto_6100 ?auto_6103 ) ) ( not ( = ?auto_6100 ?auto_6104 ) ) ( not ( = ?auto_6101 ?auto_6102 ) ) ( not ( = ?auto_6101 ?auto_6103 ) ) ( not ( = ?auto_6101 ?auto_6104 ) ) ( not ( = ?auto_6102 ?auto_6103 ) ) ( not ( = ?auto_6102 ?auto_6104 ) ) ( not ( = ?auto_6103 ?auto_6104 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_6104 )
      ( !STACK ?auto_6104 ?auto_6103 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6110 - BLOCK
      ?auto_6111 - BLOCK
      ?auto_6112 - BLOCK
      ?auto_6113 - BLOCK
      ?auto_6114 - BLOCK
    )
    :vars
    (
      ?auto_6115 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6114 ?auto_6115 ) ( ON-TABLE ?auto_6110 ) ( ON ?auto_6111 ?auto_6110 ) ( ON ?auto_6112 ?auto_6111 ) ( not ( = ?auto_6110 ?auto_6111 ) ) ( not ( = ?auto_6110 ?auto_6112 ) ) ( not ( = ?auto_6110 ?auto_6113 ) ) ( not ( = ?auto_6110 ?auto_6114 ) ) ( not ( = ?auto_6110 ?auto_6115 ) ) ( not ( = ?auto_6111 ?auto_6112 ) ) ( not ( = ?auto_6111 ?auto_6113 ) ) ( not ( = ?auto_6111 ?auto_6114 ) ) ( not ( = ?auto_6111 ?auto_6115 ) ) ( not ( = ?auto_6112 ?auto_6113 ) ) ( not ( = ?auto_6112 ?auto_6114 ) ) ( not ( = ?auto_6112 ?auto_6115 ) ) ( not ( = ?auto_6113 ?auto_6114 ) ) ( not ( = ?auto_6113 ?auto_6115 ) ) ( not ( = ?auto_6114 ?auto_6115 ) ) ( CLEAR ?auto_6112 ) ( ON ?auto_6113 ?auto_6114 ) ( CLEAR ?auto_6113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6110 ?auto_6111 ?auto_6112 ?auto_6113 )
      ( MAKE-5PILE ?auto_6110 ?auto_6111 ?auto_6112 ?auto_6113 ?auto_6114 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6121 - BLOCK
      ?auto_6122 - BLOCK
      ?auto_6123 - BLOCK
      ?auto_6124 - BLOCK
      ?auto_6125 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6125 ) ( ON-TABLE ?auto_6121 ) ( ON ?auto_6122 ?auto_6121 ) ( ON ?auto_6123 ?auto_6122 ) ( not ( = ?auto_6121 ?auto_6122 ) ) ( not ( = ?auto_6121 ?auto_6123 ) ) ( not ( = ?auto_6121 ?auto_6124 ) ) ( not ( = ?auto_6121 ?auto_6125 ) ) ( not ( = ?auto_6122 ?auto_6123 ) ) ( not ( = ?auto_6122 ?auto_6124 ) ) ( not ( = ?auto_6122 ?auto_6125 ) ) ( not ( = ?auto_6123 ?auto_6124 ) ) ( not ( = ?auto_6123 ?auto_6125 ) ) ( not ( = ?auto_6124 ?auto_6125 ) ) ( CLEAR ?auto_6123 ) ( ON ?auto_6124 ?auto_6125 ) ( CLEAR ?auto_6124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 )
      ( MAKE-5PILE ?auto_6121 ?auto_6122 ?auto_6123 ?auto_6124 ?auto_6125 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6131 - BLOCK
      ?auto_6132 - BLOCK
      ?auto_6133 - BLOCK
      ?auto_6134 - BLOCK
      ?auto_6135 - BLOCK
    )
    :vars
    (
      ?auto_6136 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6135 ?auto_6136 ) ( ON-TABLE ?auto_6131 ) ( ON ?auto_6132 ?auto_6131 ) ( not ( = ?auto_6131 ?auto_6132 ) ) ( not ( = ?auto_6131 ?auto_6133 ) ) ( not ( = ?auto_6131 ?auto_6134 ) ) ( not ( = ?auto_6131 ?auto_6135 ) ) ( not ( = ?auto_6131 ?auto_6136 ) ) ( not ( = ?auto_6132 ?auto_6133 ) ) ( not ( = ?auto_6132 ?auto_6134 ) ) ( not ( = ?auto_6132 ?auto_6135 ) ) ( not ( = ?auto_6132 ?auto_6136 ) ) ( not ( = ?auto_6133 ?auto_6134 ) ) ( not ( = ?auto_6133 ?auto_6135 ) ) ( not ( = ?auto_6133 ?auto_6136 ) ) ( not ( = ?auto_6134 ?auto_6135 ) ) ( not ( = ?auto_6134 ?auto_6136 ) ) ( not ( = ?auto_6135 ?auto_6136 ) ) ( ON ?auto_6134 ?auto_6135 ) ( CLEAR ?auto_6132 ) ( ON ?auto_6133 ?auto_6134 ) ( CLEAR ?auto_6133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6131 ?auto_6132 ?auto_6133 )
      ( MAKE-5PILE ?auto_6131 ?auto_6132 ?auto_6133 ?auto_6134 ?auto_6135 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6142 - BLOCK
      ?auto_6143 - BLOCK
      ?auto_6144 - BLOCK
      ?auto_6145 - BLOCK
      ?auto_6146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6146 ) ( ON-TABLE ?auto_6142 ) ( ON ?auto_6143 ?auto_6142 ) ( not ( = ?auto_6142 ?auto_6143 ) ) ( not ( = ?auto_6142 ?auto_6144 ) ) ( not ( = ?auto_6142 ?auto_6145 ) ) ( not ( = ?auto_6142 ?auto_6146 ) ) ( not ( = ?auto_6143 ?auto_6144 ) ) ( not ( = ?auto_6143 ?auto_6145 ) ) ( not ( = ?auto_6143 ?auto_6146 ) ) ( not ( = ?auto_6144 ?auto_6145 ) ) ( not ( = ?auto_6144 ?auto_6146 ) ) ( not ( = ?auto_6145 ?auto_6146 ) ) ( ON ?auto_6145 ?auto_6146 ) ( CLEAR ?auto_6143 ) ( ON ?auto_6144 ?auto_6145 ) ( CLEAR ?auto_6144 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_6142 ?auto_6143 ?auto_6144 )
      ( MAKE-5PILE ?auto_6142 ?auto_6143 ?auto_6144 ?auto_6145 ?auto_6146 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6152 - BLOCK
      ?auto_6153 - BLOCK
      ?auto_6154 - BLOCK
      ?auto_6155 - BLOCK
      ?auto_6156 - BLOCK
    )
    :vars
    (
      ?auto_6157 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6156 ?auto_6157 ) ( ON-TABLE ?auto_6152 ) ( not ( = ?auto_6152 ?auto_6153 ) ) ( not ( = ?auto_6152 ?auto_6154 ) ) ( not ( = ?auto_6152 ?auto_6155 ) ) ( not ( = ?auto_6152 ?auto_6156 ) ) ( not ( = ?auto_6152 ?auto_6157 ) ) ( not ( = ?auto_6153 ?auto_6154 ) ) ( not ( = ?auto_6153 ?auto_6155 ) ) ( not ( = ?auto_6153 ?auto_6156 ) ) ( not ( = ?auto_6153 ?auto_6157 ) ) ( not ( = ?auto_6154 ?auto_6155 ) ) ( not ( = ?auto_6154 ?auto_6156 ) ) ( not ( = ?auto_6154 ?auto_6157 ) ) ( not ( = ?auto_6155 ?auto_6156 ) ) ( not ( = ?auto_6155 ?auto_6157 ) ) ( not ( = ?auto_6156 ?auto_6157 ) ) ( ON ?auto_6155 ?auto_6156 ) ( ON ?auto_6154 ?auto_6155 ) ( CLEAR ?auto_6152 ) ( ON ?auto_6153 ?auto_6154 ) ( CLEAR ?auto_6153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6152 ?auto_6153 )
      ( MAKE-5PILE ?auto_6152 ?auto_6153 ?auto_6154 ?auto_6155 ?auto_6156 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6163 - BLOCK
      ?auto_6164 - BLOCK
      ?auto_6165 - BLOCK
      ?auto_6166 - BLOCK
      ?auto_6167 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6167 ) ( ON-TABLE ?auto_6163 ) ( not ( = ?auto_6163 ?auto_6164 ) ) ( not ( = ?auto_6163 ?auto_6165 ) ) ( not ( = ?auto_6163 ?auto_6166 ) ) ( not ( = ?auto_6163 ?auto_6167 ) ) ( not ( = ?auto_6164 ?auto_6165 ) ) ( not ( = ?auto_6164 ?auto_6166 ) ) ( not ( = ?auto_6164 ?auto_6167 ) ) ( not ( = ?auto_6165 ?auto_6166 ) ) ( not ( = ?auto_6165 ?auto_6167 ) ) ( not ( = ?auto_6166 ?auto_6167 ) ) ( ON ?auto_6166 ?auto_6167 ) ( ON ?auto_6165 ?auto_6166 ) ( CLEAR ?auto_6163 ) ( ON ?auto_6164 ?auto_6165 ) ( CLEAR ?auto_6164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_6163 ?auto_6164 )
      ( MAKE-5PILE ?auto_6163 ?auto_6164 ?auto_6165 ?auto_6166 ?auto_6167 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6173 - BLOCK
      ?auto_6174 - BLOCK
      ?auto_6175 - BLOCK
      ?auto_6176 - BLOCK
      ?auto_6177 - BLOCK
    )
    :vars
    (
      ?auto_6178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_6177 ?auto_6178 ) ( not ( = ?auto_6173 ?auto_6174 ) ) ( not ( = ?auto_6173 ?auto_6175 ) ) ( not ( = ?auto_6173 ?auto_6176 ) ) ( not ( = ?auto_6173 ?auto_6177 ) ) ( not ( = ?auto_6173 ?auto_6178 ) ) ( not ( = ?auto_6174 ?auto_6175 ) ) ( not ( = ?auto_6174 ?auto_6176 ) ) ( not ( = ?auto_6174 ?auto_6177 ) ) ( not ( = ?auto_6174 ?auto_6178 ) ) ( not ( = ?auto_6175 ?auto_6176 ) ) ( not ( = ?auto_6175 ?auto_6177 ) ) ( not ( = ?auto_6175 ?auto_6178 ) ) ( not ( = ?auto_6176 ?auto_6177 ) ) ( not ( = ?auto_6176 ?auto_6178 ) ) ( not ( = ?auto_6177 ?auto_6178 ) ) ( ON ?auto_6176 ?auto_6177 ) ( ON ?auto_6175 ?auto_6176 ) ( ON ?auto_6174 ?auto_6175 ) ( ON ?auto_6173 ?auto_6174 ) ( CLEAR ?auto_6173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6173 )
      ( MAKE-5PILE ?auto_6173 ?auto_6174 ?auto_6175 ?auto_6176 ?auto_6177 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6184 - BLOCK
      ?auto_6185 - BLOCK
      ?auto_6186 - BLOCK
      ?auto_6187 - BLOCK
      ?auto_6188 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_6188 ) ( not ( = ?auto_6184 ?auto_6185 ) ) ( not ( = ?auto_6184 ?auto_6186 ) ) ( not ( = ?auto_6184 ?auto_6187 ) ) ( not ( = ?auto_6184 ?auto_6188 ) ) ( not ( = ?auto_6185 ?auto_6186 ) ) ( not ( = ?auto_6185 ?auto_6187 ) ) ( not ( = ?auto_6185 ?auto_6188 ) ) ( not ( = ?auto_6186 ?auto_6187 ) ) ( not ( = ?auto_6186 ?auto_6188 ) ) ( not ( = ?auto_6187 ?auto_6188 ) ) ( ON ?auto_6187 ?auto_6188 ) ( ON ?auto_6186 ?auto_6187 ) ( ON ?auto_6185 ?auto_6186 ) ( ON ?auto_6184 ?auto_6185 ) ( CLEAR ?auto_6184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_6184 )
      ( MAKE-5PILE ?auto_6184 ?auto_6185 ?auto_6186 ?auto_6187 ?auto_6188 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_6194 - BLOCK
      ?auto_6195 - BLOCK
      ?auto_6196 - BLOCK
      ?auto_6197 - BLOCK
      ?auto_6198 - BLOCK
    )
    :vars
    (
      ?auto_6199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_6194 ?auto_6195 ) ) ( not ( = ?auto_6194 ?auto_6196 ) ) ( not ( = ?auto_6194 ?auto_6197 ) ) ( not ( = ?auto_6194 ?auto_6198 ) ) ( not ( = ?auto_6195 ?auto_6196 ) ) ( not ( = ?auto_6195 ?auto_6197 ) ) ( not ( = ?auto_6195 ?auto_6198 ) ) ( not ( = ?auto_6196 ?auto_6197 ) ) ( not ( = ?auto_6196 ?auto_6198 ) ) ( not ( = ?auto_6197 ?auto_6198 ) ) ( ON ?auto_6194 ?auto_6199 ) ( not ( = ?auto_6198 ?auto_6199 ) ) ( not ( = ?auto_6197 ?auto_6199 ) ) ( not ( = ?auto_6196 ?auto_6199 ) ) ( not ( = ?auto_6195 ?auto_6199 ) ) ( not ( = ?auto_6194 ?auto_6199 ) ) ( ON ?auto_6195 ?auto_6194 ) ( ON ?auto_6196 ?auto_6195 ) ( ON ?auto_6197 ?auto_6196 ) ( ON ?auto_6198 ?auto_6197 ) ( CLEAR ?auto_6198 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_6198 ?auto_6197 ?auto_6196 ?auto_6195 ?auto_6194 )
      ( MAKE-5PILE ?auto_6194 ?auto_6195 ?auto_6196 ?auto_6197 ?auto_6198 ) )
  )

)

