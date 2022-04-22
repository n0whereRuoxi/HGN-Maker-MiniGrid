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
      ?auto_9017 - BLOCK
    )
    :vars
    (
      ?auto_9018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9017 ?auto_9018 ) ( CLEAR ?auto_9017 ) ( HAND-EMPTY ) ( not ( = ?auto_9017 ?auto_9018 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9017 ?auto_9018 )
      ( !PUTDOWN ?auto_9017 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_9020 - BLOCK
    )
    :vars
    (
      ?auto_9021 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9020 ?auto_9021 ) ( CLEAR ?auto_9020 ) ( HAND-EMPTY ) ( not ( = ?auto_9020 ?auto_9021 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9020 ?auto_9021 )
      ( !PUTDOWN ?auto_9020 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9024 - BLOCK
      ?auto_9025 - BLOCK
    )
    :vars
    (
      ?auto_9026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9024 ) ( ON ?auto_9025 ?auto_9026 ) ( CLEAR ?auto_9025 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9024 ) ( not ( = ?auto_9024 ?auto_9025 ) ) ( not ( = ?auto_9024 ?auto_9026 ) ) ( not ( = ?auto_9025 ?auto_9026 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9025 ?auto_9026 )
      ( !STACK ?auto_9025 ?auto_9024 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9029 - BLOCK
      ?auto_9030 - BLOCK
    )
    :vars
    (
      ?auto_9031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9029 ) ( ON ?auto_9030 ?auto_9031 ) ( CLEAR ?auto_9030 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9029 ) ( not ( = ?auto_9029 ?auto_9030 ) ) ( not ( = ?auto_9029 ?auto_9031 ) ) ( not ( = ?auto_9030 ?auto_9031 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9030 ?auto_9031 )
      ( !STACK ?auto_9030 ?auto_9029 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9034 - BLOCK
      ?auto_9035 - BLOCK
    )
    :vars
    (
      ?auto_9036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9035 ?auto_9036 ) ( not ( = ?auto_9034 ?auto_9035 ) ) ( not ( = ?auto_9034 ?auto_9036 ) ) ( not ( = ?auto_9035 ?auto_9036 ) ) ( ON ?auto_9034 ?auto_9035 ) ( CLEAR ?auto_9034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9034 )
      ( MAKE-2PILE ?auto_9034 ?auto_9035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_9039 - BLOCK
      ?auto_9040 - BLOCK
    )
    :vars
    (
      ?auto_9041 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9040 ?auto_9041 ) ( not ( = ?auto_9039 ?auto_9040 ) ) ( not ( = ?auto_9039 ?auto_9041 ) ) ( not ( = ?auto_9040 ?auto_9041 ) ) ( ON ?auto_9039 ?auto_9040 ) ( CLEAR ?auto_9039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9039 )
      ( MAKE-2PILE ?auto_9039 ?auto_9040 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9045 - BLOCK
      ?auto_9046 - BLOCK
      ?auto_9047 - BLOCK
    )
    :vars
    (
      ?auto_9048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9046 ) ( ON ?auto_9047 ?auto_9048 ) ( CLEAR ?auto_9047 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9045 ) ( ON ?auto_9046 ?auto_9045 ) ( not ( = ?auto_9045 ?auto_9046 ) ) ( not ( = ?auto_9045 ?auto_9047 ) ) ( not ( = ?auto_9045 ?auto_9048 ) ) ( not ( = ?auto_9046 ?auto_9047 ) ) ( not ( = ?auto_9046 ?auto_9048 ) ) ( not ( = ?auto_9047 ?auto_9048 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9047 ?auto_9048 )
      ( !STACK ?auto_9047 ?auto_9046 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9052 - BLOCK
      ?auto_9053 - BLOCK
      ?auto_9054 - BLOCK
    )
    :vars
    (
      ?auto_9055 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9053 ) ( ON ?auto_9054 ?auto_9055 ) ( CLEAR ?auto_9054 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9052 ) ( ON ?auto_9053 ?auto_9052 ) ( not ( = ?auto_9052 ?auto_9053 ) ) ( not ( = ?auto_9052 ?auto_9054 ) ) ( not ( = ?auto_9052 ?auto_9055 ) ) ( not ( = ?auto_9053 ?auto_9054 ) ) ( not ( = ?auto_9053 ?auto_9055 ) ) ( not ( = ?auto_9054 ?auto_9055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9054 ?auto_9055 )
      ( !STACK ?auto_9054 ?auto_9053 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9059 - BLOCK
      ?auto_9060 - BLOCK
      ?auto_9061 - BLOCK
    )
    :vars
    (
      ?auto_9062 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9061 ?auto_9062 ) ( ON-TABLE ?auto_9059 ) ( not ( = ?auto_9059 ?auto_9060 ) ) ( not ( = ?auto_9059 ?auto_9061 ) ) ( not ( = ?auto_9059 ?auto_9062 ) ) ( not ( = ?auto_9060 ?auto_9061 ) ) ( not ( = ?auto_9060 ?auto_9062 ) ) ( not ( = ?auto_9061 ?auto_9062 ) ) ( CLEAR ?auto_9059 ) ( ON ?auto_9060 ?auto_9061 ) ( CLEAR ?auto_9060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9059 ?auto_9060 )
      ( MAKE-3PILE ?auto_9059 ?auto_9060 ?auto_9061 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9066 - BLOCK
      ?auto_9067 - BLOCK
      ?auto_9068 - BLOCK
    )
    :vars
    (
      ?auto_9069 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9068 ?auto_9069 ) ( ON-TABLE ?auto_9066 ) ( not ( = ?auto_9066 ?auto_9067 ) ) ( not ( = ?auto_9066 ?auto_9068 ) ) ( not ( = ?auto_9066 ?auto_9069 ) ) ( not ( = ?auto_9067 ?auto_9068 ) ) ( not ( = ?auto_9067 ?auto_9069 ) ) ( not ( = ?auto_9068 ?auto_9069 ) ) ( CLEAR ?auto_9066 ) ( ON ?auto_9067 ?auto_9068 ) ( CLEAR ?auto_9067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9066 ?auto_9067 )
      ( MAKE-3PILE ?auto_9066 ?auto_9067 ?auto_9068 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9073 - BLOCK
      ?auto_9074 - BLOCK
      ?auto_9075 - BLOCK
    )
    :vars
    (
      ?auto_9076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9075 ?auto_9076 ) ( not ( = ?auto_9073 ?auto_9074 ) ) ( not ( = ?auto_9073 ?auto_9075 ) ) ( not ( = ?auto_9073 ?auto_9076 ) ) ( not ( = ?auto_9074 ?auto_9075 ) ) ( not ( = ?auto_9074 ?auto_9076 ) ) ( not ( = ?auto_9075 ?auto_9076 ) ) ( ON ?auto_9074 ?auto_9075 ) ( ON ?auto_9073 ?auto_9074 ) ( CLEAR ?auto_9073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9073 )
      ( MAKE-3PILE ?auto_9073 ?auto_9074 ?auto_9075 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_9080 - BLOCK
      ?auto_9081 - BLOCK
      ?auto_9082 - BLOCK
    )
    :vars
    (
      ?auto_9083 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9082 ?auto_9083 ) ( not ( = ?auto_9080 ?auto_9081 ) ) ( not ( = ?auto_9080 ?auto_9082 ) ) ( not ( = ?auto_9080 ?auto_9083 ) ) ( not ( = ?auto_9081 ?auto_9082 ) ) ( not ( = ?auto_9081 ?auto_9083 ) ) ( not ( = ?auto_9082 ?auto_9083 ) ) ( ON ?auto_9081 ?auto_9082 ) ( ON ?auto_9080 ?auto_9081 ) ( CLEAR ?auto_9080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9080 )
      ( MAKE-3PILE ?auto_9080 ?auto_9081 ?auto_9082 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9088 - BLOCK
      ?auto_9089 - BLOCK
      ?auto_9090 - BLOCK
      ?auto_9091 - BLOCK
    )
    :vars
    (
      ?auto_9092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9090 ) ( ON ?auto_9091 ?auto_9092 ) ( CLEAR ?auto_9091 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9088 ) ( ON ?auto_9089 ?auto_9088 ) ( ON ?auto_9090 ?auto_9089 ) ( not ( = ?auto_9088 ?auto_9089 ) ) ( not ( = ?auto_9088 ?auto_9090 ) ) ( not ( = ?auto_9088 ?auto_9091 ) ) ( not ( = ?auto_9088 ?auto_9092 ) ) ( not ( = ?auto_9089 ?auto_9090 ) ) ( not ( = ?auto_9089 ?auto_9091 ) ) ( not ( = ?auto_9089 ?auto_9092 ) ) ( not ( = ?auto_9090 ?auto_9091 ) ) ( not ( = ?auto_9090 ?auto_9092 ) ) ( not ( = ?auto_9091 ?auto_9092 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9091 ?auto_9092 )
      ( !STACK ?auto_9091 ?auto_9090 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9097 - BLOCK
      ?auto_9098 - BLOCK
      ?auto_9099 - BLOCK
      ?auto_9100 - BLOCK
    )
    :vars
    (
      ?auto_9101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9099 ) ( ON ?auto_9100 ?auto_9101 ) ( CLEAR ?auto_9100 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9097 ) ( ON ?auto_9098 ?auto_9097 ) ( ON ?auto_9099 ?auto_9098 ) ( not ( = ?auto_9097 ?auto_9098 ) ) ( not ( = ?auto_9097 ?auto_9099 ) ) ( not ( = ?auto_9097 ?auto_9100 ) ) ( not ( = ?auto_9097 ?auto_9101 ) ) ( not ( = ?auto_9098 ?auto_9099 ) ) ( not ( = ?auto_9098 ?auto_9100 ) ) ( not ( = ?auto_9098 ?auto_9101 ) ) ( not ( = ?auto_9099 ?auto_9100 ) ) ( not ( = ?auto_9099 ?auto_9101 ) ) ( not ( = ?auto_9100 ?auto_9101 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9100 ?auto_9101 )
      ( !STACK ?auto_9100 ?auto_9099 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9106 - BLOCK
      ?auto_9107 - BLOCK
      ?auto_9108 - BLOCK
      ?auto_9109 - BLOCK
    )
    :vars
    (
      ?auto_9110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9109 ?auto_9110 ) ( ON-TABLE ?auto_9106 ) ( ON ?auto_9107 ?auto_9106 ) ( not ( = ?auto_9106 ?auto_9107 ) ) ( not ( = ?auto_9106 ?auto_9108 ) ) ( not ( = ?auto_9106 ?auto_9109 ) ) ( not ( = ?auto_9106 ?auto_9110 ) ) ( not ( = ?auto_9107 ?auto_9108 ) ) ( not ( = ?auto_9107 ?auto_9109 ) ) ( not ( = ?auto_9107 ?auto_9110 ) ) ( not ( = ?auto_9108 ?auto_9109 ) ) ( not ( = ?auto_9108 ?auto_9110 ) ) ( not ( = ?auto_9109 ?auto_9110 ) ) ( CLEAR ?auto_9107 ) ( ON ?auto_9108 ?auto_9109 ) ( CLEAR ?auto_9108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9106 ?auto_9107 ?auto_9108 )
      ( MAKE-4PILE ?auto_9106 ?auto_9107 ?auto_9108 ?auto_9109 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9115 - BLOCK
      ?auto_9116 - BLOCK
      ?auto_9117 - BLOCK
      ?auto_9118 - BLOCK
    )
    :vars
    (
      ?auto_9119 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9118 ?auto_9119 ) ( ON-TABLE ?auto_9115 ) ( ON ?auto_9116 ?auto_9115 ) ( not ( = ?auto_9115 ?auto_9116 ) ) ( not ( = ?auto_9115 ?auto_9117 ) ) ( not ( = ?auto_9115 ?auto_9118 ) ) ( not ( = ?auto_9115 ?auto_9119 ) ) ( not ( = ?auto_9116 ?auto_9117 ) ) ( not ( = ?auto_9116 ?auto_9118 ) ) ( not ( = ?auto_9116 ?auto_9119 ) ) ( not ( = ?auto_9117 ?auto_9118 ) ) ( not ( = ?auto_9117 ?auto_9119 ) ) ( not ( = ?auto_9118 ?auto_9119 ) ) ( CLEAR ?auto_9116 ) ( ON ?auto_9117 ?auto_9118 ) ( CLEAR ?auto_9117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9115 ?auto_9116 ?auto_9117 )
      ( MAKE-4PILE ?auto_9115 ?auto_9116 ?auto_9117 ?auto_9118 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9124 - BLOCK
      ?auto_9125 - BLOCK
      ?auto_9126 - BLOCK
      ?auto_9127 - BLOCK
    )
    :vars
    (
      ?auto_9128 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9127 ?auto_9128 ) ( ON-TABLE ?auto_9124 ) ( not ( = ?auto_9124 ?auto_9125 ) ) ( not ( = ?auto_9124 ?auto_9126 ) ) ( not ( = ?auto_9124 ?auto_9127 ) ) ( not ( = ?auto_9124 ?auto_9128 ) ) ( not ( = ?auto_9125 ?auto_9126 ) ) ( not ( = ?auto_9125 ?auto_9127 ) ) ( not ( = ?auto_9125 ?auto_9128 ) ) ( not ( = ?auto_9126 ?auto_9127 ) ) ( not ( = ?auto_9126 ?auto_9128 ) ) ( not ( = ?auto_9127 ?auto_9128 ) ) ( ON ?auto_9126 ?auto_9127 ) ( CLEAR ?auto_9124 ) ( ON ?auto_9125 ?auto_9126 ) ( CLEAR ?auto_9125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9124 ?auto_9125 )
      ( MAKE-4PILE ?auto_9124 ?auto_9125 ?auto_9126 ?auto_9127 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9133 - BLOCK
      ?auto_9134 - BLOCK
      ?auto_9135 - BLOCK
      ?auto_9136 - BLOCK
    )
    :vars
    (
      ?auto_9137 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9136 ?auto_9137 ) ( ON-TABLE ?auto_9133 ) ( not ( = ?auto_9133 ?auto_9134 ) ) ( not ( = ?auto_9133 ?auto_9135 ) ) ( not ( = ?auto_9133 ?auto_9136 ) ) ( not ( = ?auto_9133 ?auto_9137 ) ) ( not ( = ?auto_9134 ?auto_9135 ) ) ( not ( = ?auto_9134 ?auto_9136 ) ) ( not ( = ?auto_9134 ?auto_9137 ) ) ( not ( = ?auto_9135 ?auto_9136 ) ) ( not ( = ?auto_9135 ?auto_9137 ) ) ( not ( = ?auto_9136 ?auto_9137 ) ) ( ON ?auto_9135 ?auto_9136 ) ( CLEAR ?auto_9133 ) ( ON ?auto_9134 ?auto_9135 ) ( CLEAR ?auto_9134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9133 ?auto_9134 )
      ( MAKE-4PILE ?auto_9133 ?auto_9134 ?auto_9135 ?auto_9136 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9142 - BLOCK
      ?auto_9143 - BLOCK
      ?auto_9144 - BLOCK
      ?auto_9145 - BLOCK
    )
    :vars
    (
      ?auto_9146 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9145 ?auto_9146 ) ( not ( = ?auto_9142 ?auto_9143 ) ) ( not ( = ?auto_9142 ?auto_9144 ) ) ( not ( = ?auto_9142 ?auto_9145 ) ) ( not ( = ?auto_9142 ?auto_9146 ) ) ( not ( = ?auto_9143 ?auto_9144 ) ) ( not ( = ?auto_9143 ?auto_9145 ) ) ( not ( = ?auto_9143 ?auto_9146 ) ) ( not ( = ?auto_9144 ?auto_9145 ) ) ( not ( = ?auto_9144 ?auto_9146 ) ) ( not ( = ?auto_9145 ?auto_9146 ) ) ( ON ?auto_9144 ?auto_9145 ) ( ON ?auto_9143 ?auto_9144 ) ( ON ?auto_9142 ?auto_9143 ) ( CLEAR ?auto_9142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9142 )
      ( MAKE-4PILE ?auto_9142 ?auto_9143 ?auto_9144 ?auto_9145 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_9151 - BLOCK
      ?auto_9152 - BLOCK
      ?auto_9153 - BLOCK
      ?auto_9154 - BLOCK
    )
    :vars
    (
      ?auto_9155 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9154 ?auto_9155 ) ( not ( = ?auto_9151 ?auto_9152 ) ) ( not ( = ?auto_9151 ?auto_9153 ) ) ( not ( = ?auto_9151 ?auto_9154 ) ) ( not ( = ?auto_9151 ?auto_9155 ) ) ( not ( = ?auto_9152 ?auto_9153 ) ) ( not ( = ?auto_9152 ?auto_9154 ) ) ( not ( = ?auto_9152 ?auto_9155 ) ) ( not ( = ?auto_9153 ?auto_9154 ) ) ( not ( = ?auto_9153 ?auto_9155 ) ) ( not ( = ?auto_9154 ?auto_9155 ) ) ( ON ?auto_9153 ?auto_9154 ) ( ON ?auto_9152 ?auto_9153 ) ( ON ?auto_9151 ?auto_9152 ) ( CLEAR ?auto_9151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9151 )
      ( MAKE-4PILE ?auto_9151 ?auto_9152 ?auto_9153 ?auto_9154 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9161 - BLOCK
      ?auto_9162 - BLOCK
      ?auto_9163 - BLOCK
      ?auto_9164 - BLOCK
      ?auto_9165 - BLOCK
    )
    :vars
    (
      ?auto_9166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9164 ) ( ON ?auto_9165 ?auto_9166 ) ( CLEAR ?auto_9165 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9161 ) ( ON ?auto_9162 ?auto_9161 ) ( ON ?auto_9163 ?auto_9162 ) ( ON ?auto_9164 ?auto_9163 ) ( not ( = ?auto_9161 ?auto_9162 ) ) ( not ( = ?auto_9161 ?auto_9163 ) ) ( not ( = ?auto_9161 ?auto_9164 ) ) ( not ( = ?auto_9161 ?auto_9165 ) ) ( not ( = ?auto_9161 ?auto_9166 ) ) ( not ( = ?auto_9162 ?auto_9163 ) ) ( not ( = ?auto_9162 ?auto_9164 ) ) ( not ( = ?auto_9162 ?auto_9165 ) ) ( not ( = ?auto_9162 ?auto_9166 ) ) ( not ( = ?auto_9163 ?auto_9164 ) ) ( not ( = ?auto_9163 ?auto_9165 ) ) ( not ( = ?auto_9163 ?auto_9166 ) ) ( not ( = ?auto_9164 ?auto_9165 ) ) ( not ( = ?auto_9164 ?auto_9166 ) ) ( not ( = ?auto_9165 ?auto_9166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9165 ?auto_9166 )
      ( !STACK ?auto_9165 ?auto_9164 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9172 - BLOCK
      ?auto_9173 - BLOCK
      ?auto_9174 - BLOCK
      ?auto_9175 - BLOCK
      ?auto_9176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_9175 ) ( ON-TABLE ?auto_9176 ) ( CLEAR ?auto_9176 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_9172 ) ( ON ?auto_9173 ?auto_9172 ) ( ON ?auto_9174 ?auto_9173 ) ( ON ?auto_9175 ?auto_9174 ) ( not ( = ?auto_9172 ?auto_9173 ) ) ( not ( = ?auto_9172 ?auto_9174 ) ) ( not ( = ?auto_9172 ?auto_9175 ) ) ( not ( = ?auto_9172 ?auto_9176 ) ) ( not ( = ?auto_9173 ?auto_9174 ) ) ( not ( = ?auto_9173 ?auto_9175 ) ) ( not ( = ?auto_9173 ?auto_9176 ) ) ( not ( = ?auto_9174 ?auto_9175 ) ) ( not ( = ?auto_9174 ?auto_9176 ) ) ( not ( = ?auto_9175 ?auto_9176 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_9176 )
      ( !STACK ?auto_9176 ?auto_9175 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9182 - BLOCK
      ?auto_9183 - BLOCK
      ?auto_9184 - BLOCK
      ?auto_9185 - BLOCK
      ?auto_9186 - BLOCK
    )
    :vars
    (
      ?auto_9187 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9186 ?auto_9187 ) ( ON-TABLE ?auto_9182 ) ( ON ?auto_9183 ?auto_9182 ) ( ON ?auto_9184 ?auto_9183 ) ( not ( = ?auto_9182 ?auto_9183 ) ) ( not ( = ?auto_9182 ?auto_9184 ) ) ( not ( = ?auto_9182 ?auto_9185 ) ) ( not ( = ?auto_9182 ?auto_9186 ) ) ( not ( = ?auto_9182 ?auto_9187 ) ) ( not ( = ?auto_9183 ?auto_9184 ) ) ( not ( = ?auto_9183 ?auto_9185 ) ) ( not ( = ?auto_9183 ?auto_9186 ) ) ( not ( = ?auto_9183 ?auto_9187 ) ) ( not ( = ?auto_9184 ?auto_9185 ) ) ( not ( = ?auto_9184 ?auto_9186 ) ) ( not ( = ?auto_9184 ?auto_9187 ) ) ( not ( = ?auto_9185 ?auto_9186 ) ) ( not ( = ?auto_9185 ?auto_9187 ) ) ( not ( = ?auto_9186 ?auto_9187 ) ) ( CLEAR ?auto_9184 ) ( ON ?auto_9185 ?auto_9186 ) ( CLEAR ?auto_9185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9182 ?auto_9183 ?auto_9184 ?auto_9185 )
      ( MAKE-5PILE ?auto_9182 ?auto_9183 ?auto_9184 ?auto_9185 ?auto_9186 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9193 - BLOCK
      ?auto_9194 - BLOCK
      ?auto_9195 - BLOCK
      ?auto_9196 - BLOCK
      ?auto_9197 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9197 ) ( ON-TABLE ?auto_9193 ) ( ON ?auto_9194 ?auto_9193 ) ( ON ?auto_9195 ?auto_9194 ) ( not ( = ?auto_9193 ?auto_9194 ) ) ( not ( = ?auto_9193 ?auto_9195 ) ) ( not ( = ?auto_9193 ?auto_9196 ) ) ( not ( = ?auto_9193 ?auto_9197 ) ) ( not ( = ?auto_9194 ?auto_9195 ) ) ( not ( = ?auto_9194 ?auto_9196 ) ) ( not ( = ?auto_9194 ?auto_9197 ) ) ( not ( = ?auto_9195 ?auto_9196 ) ) ( not ( = ?auto_9195 ?auto_9197 ) ) ( not ( = ?auto_9196 ?auto_9197 ) ) ( CLEAR ?auto_9195 ) ( ON ?auto_9196 ?auto_9197 ) ( CLEAR ?auto_9196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_9193 ?auto_9194 ?auto_9195 ?auto_9196 )
      ( MAKE-5PILE ?auto_9193 ?auto_9194 ?auto_9195 ?auto_9196 ?auto_9197 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9203 - BLOCK
      ?auto_9204 - BLOCK
      ?auto_9205 - BLOCK
      ?auto_9206 - BLOCK
      ?auto_9207 - BLOCK
    )
    :vars
    (
      ?auto_9208 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9207 ?auto_9208 ) ( ON-TABLE ?auto_9203 ) ( ON ?auto_9204 ?auto_9203 ) ( not ( = ?auto_9203 ?auto_9204 ) ) ( not ( = ?auto_9203 ?auto_9205 ) ) ( not ( = ?auto_9203 ?auto_9206 ) ) ( not ( = ?auto_9203 ?auto_9207 ) ) ( not ( = ?auto_9203 ?auto_9208 ) ) ( not ( = ?auto_9204 ?auto_9205 ) ) ( not ( = ?auto_9204 ?auto_9206 ) ) ( not ( = ?auto_9204 ?auto_9207 ) ) ( not ( = ?auto_9204 ?auto_9208 ) ) ( not ( = ?auto_9205 ?auto_9206 ) ) ( not ( = ?auto_9205 ?auto_9207 ) ) ( not ( = ?auto_9205 ?auto_9208 ) ) ( not ( = ?auto_9206 ?auto_9207 ) ) ( not ( = ?auto_9206 ?auto_9208 ) ) ( not ( = ?auto_9207 ?auto_9208 ) ) ( ON ?auto_9206 ?auto_9207 ) ( CLEAR ?auto_9204 ) ( ON ?auto_9205 ?auto_9206 ) ( CLEAR ?auto_9205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9203 ?auto_9204 ?auto_9205 )
      ( MAKE-5PILE ?auto_9203 ?auto_9204 ?auto_9205 ?auto_9206 ?auto_9207 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9214 - BLOCK
      ?auto_9215 - BLOCK
      ?auto_9216 - BLOCK
      ?auto_9217 - BLOCK
      ?auto_9218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9218 ) ( ON-TABLE ?auto_9214 ) ( ON ?auto_9215 ?auto_9214 ) ( not ( = ?auto_9214 ?auto_9215 ) ) ( not ( = ?auto_9214 ?auto_9216 ) ) ( not ( = ?auto_9214 ?auto_9217 ) ) ( not ( = ?auto_9214 ?auto_9218 ) ) ( not ( = ?auto_9215 ?auto_9216 ) ) ( not ( = ?auto_9215 ?auto_9217 ) ) ( not ( = ?auto_9215 ?auto_9218 ) ) ( not ( = ?auto_9216 ?auto_9217 ) ) ( not ( = ?auto_9216 ?auto_9218 ) ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( ON ?auto_9217 ?auto_9218 ) ( CLEAR ?auto_9215 ) ( ON ?auto_9216 ?auto_9217 ) ( CLEAR ?auto_9216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_9214 ?auto_9215 ?auto_9216 )
      ( MAKE-5PILE ?auto_9214 ?auto_9215 ?auto_9216 ?auto_9217 ?auto_9218 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9224 - BLOCK
      ?auto_9225 - BLOCK
      ?auto_9226 - BLOCK
      ?auto_9227 - BLOCK
      ?auto_9228 - BLOCK
    )
    :vars
    (
      ?auto_9229 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9228 ?auto_9229 ) ( ON-TABLE ?auto_9224 ) ( not ( = ?auto_9224 ?auto_9225 ) ) ( not ( = ?auto_9224 ?auto_9226 ) ) ( not ( = ?auto_9224 ?auto_9227 ) ) ( not ( = ?auto_9224 ?auto_9228 ) ) ( not ( = ?auto_9224 ?auto_9229 ) ) ( not ( = ?auto_9225 ?auto_9226 ) ) ( not ( = ?auto_9225 ?auto_9227 ) ) ( not ( = ?auto_9225 ?auto_9228 ) ) ( not ( = ?auto_9225 ?auto_9229 ) ) ( not ( = ?auto_9226 ?auto_9227 ) ) ( not ( = ?auto_9226 ?auto_9228 ) ) ( not ( = ?auto_9226 ?auto_9229 ) ) ( not ( = ?auto_9227 ?auto_9228 ) ) ( not ( = ?auto_9227 ?auto_9229 ) ) ( not ( = ?auto_9228 ?auto_9229 ) ) ( ON ?auto_9227 ?auto_9228 ) ( ON ?auto_9226 ?auto_9227 ) ( CLEAR ?auto_9224 ) ( ON ?auto_9225 ?auto_9226 ) ( CLEAR ?auto_9225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9224 ?auto_9225 )
      ( MAKE-5PILE ?auto_9224 ?auto_9225 ?auto_9226 ?auto_9227 ?auto_9228 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9235 - BLOCK
      ?auto_9236 - BLOCK
      ?auto_9237 - BLOCK
      ?auto_9238 - BLOCK
      ?auto_9239 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9239 ) ( ON-TABLE ?auto_9235 ) ( not ( = ?auto_9235 ?auto_9236 ) ) ( not ( = ?auto_9235 ?auto_9237 ) ) ( not ( = ?auto_9235 ?auto_9238 ) ) ( not ( = ?auto_9235 ?auto_9239 ) ) ( not ( = ?auto_9236 ?auto_9237 ) ) ( not ( = ?auto_9236 ?auto_9238 ) ) ( not ( = ?auto_9236 ?auto_9239 ) ) ( not ( = ?auto_9237 ?auto_9238 ) ) ( not ( = ?auto_9237 ?auto_9239 ) ) ( not ( = ?auto_9238 ?auto_9239 ) ) ( ON ?auto_9238 ?auto_9239 ) ( ON ?auto_9237 ?auto_9238 ) ( CLEAR ?auto_9235 ) ( ON ?auto_9236 ?auto_9237 ) ( CLEAR ?auto_9236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_9235 ?auto_9236 )
      ( MAKE-5PILE ?auto_9235 ?auto_9236 ?auto_9237 ?auto_9238 ?auto_9239 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9245 - BLOCK
      ?auto_9246 - BLOCK
      ?auto_9247 - BLOCK
      ?auto_9248 - BLOCK
      ?auto_9249 - BLOCK
    )
    :vars
    (
      ?auto_9250 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_9249 ?auto_9250 ) ( not ( = ?auto_9245 ?auto_9246 ) ) ( not ( = ?auto_9245 ?auto_9247 ) ) ( not ( = ?auto_9245 ?auto_9248 ) ) ( not ( = ?auto_9245 ?auto_9249 ) ) ( not ( = ?auto_9245 ?auto_9250 ) ) ( not ( = ?auto_9246 ?auto_9247 ) ) ( not ( = ?auto_9246 ?auto_9248 ) ) ( not ( = ?auto_9246 ?auto_9249 ) ) ( not ( = ?auto_9246 ?auto_9250 ) ) ( not ( = ?auto_9247 ?auto_9248 ) ) ( not ( = ?auto_9247 ?auto_9249 ) ) ( not ( = ?auto_9247 ?auto_9250 ) ) ( not ( = ?auto_9248 ?auto_9249 ) ) ( not ( = ?auto_9248 ?auto_9250 ) ) ( not ( = ?auto_9249 ?auto_9250 ) ) ( ON ?auto_9248 ?auto_9249 ) ( ON ?auto_9247 ?auto_9248 ) ( ON ?auto_9246 ?auto_9247 ) ( ON ?auto_9245 ?auto_9246 ) ( CLEAR ?auto_9245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9245 )
      ( MAKE-5PILE ?auto_9245 ?auto_9246 ?auto_9247 ?auto_9248 ?auto_9249 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9256 - BLOCK
      ?auto_9257 - BLOCK
      ?auto_9258 - BLOCK
      ?auto_9259 - BLOCK
      ?auto_9260 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_9260 ) ( not ( = ?auto_9256 ?auto_9257 ) ) ( not ( = ?auto_9256 ?auto_9258 ) ) ( not ( = ?auto_9256 ?auto_9259 ) ) ( not ( = ?auto_9256 ?auto_9260 ) ) ( not ( = ?auto_9257 ?auto_9258 ) ) ( not ( = ?auto_9257 ?auto_9259 ) ) ( not ( = ?auto_9257 ?auto_9260 ) ) ( not ( = ?auto_9258 ?auto_9259 ) ) ( not ( = ?auto_9258 ?auto_9260 ) ) ( not ( = ?auto_9259 ?auto_9260 ) ) ( ON ?auto_9259 ?auto_9260 ) ( ON ?auto_9258 ?auto_9259 ) ( ON ?auto_9257 ?auto_9258 ) ( ON ?auto_9256 ?auto_9257 ) ( CLEAR ?auto_9256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_9256 )
      ( MAKE-5PILE ?auto_9256 ?auto_9257 ?auto_9258 ?auto_9259 ?auto_9260 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_9266 - BLOCK
      ?auto_9267 - BLOCK
      ?auto_9268 - BLOCK
      ?auto_9269 - BLOCK
      ?auto_9270 - BLOCK
    )
    :vars
    (
      ?auto_9271 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_9266 ?auto_9267 ) ) ( not ( = ?auto_9266 ?auto_9268 ) ) ( not ( = ?auto_9266 ?auto_9269 ) ) ( not ( = ?auto_9266 ?auto_9270 ) ) ( not ( = ?auto_9267 ?auto_9268 ) ) ( not ( = ?auto_9267 ?auto_9269 ) ) ( not ( = ?auto_9267 ?auto_9270 ) ) ( not ( = ?auto_9268 ?auto_9269 ) ) ( not ( = ?auto_9268 ?auto_9270 ) ) ( not ( = ?auto_9269 ?auto_9270 ) ) ( ON ?auto_9266 ?auto_9271 ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9269 ?auto_9271 ) ) ( not ( = ?auto_9268 ?auto_9271 ) ) ( not ( = ?auto_9267 ?auto_9271 ) ) ( not ( = ?auto_9266 ?auto_9271 ) ) ( ON ?auto_9267 ?auto_9266 ) ( ON ?auto_9268 ?auto_9267 ) ( ON ?auto_9269 ?auto_9268 ) ( ON ?auto_9270 ?auto_9269 ) ( CLEAR ?auto_9270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_9270 ?auto_9269 ?auto_9268 ?auto_9267 ?auto_9266 )
      ( MAKE-5PILE ?auto_9266 ?auto_9267 ?auto_9268 ?auto_9269 ?auto_9270 ) )
  )

)

