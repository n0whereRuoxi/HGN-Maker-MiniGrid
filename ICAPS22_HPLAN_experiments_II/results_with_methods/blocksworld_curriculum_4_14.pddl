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
      ?auto_4051 - BLOCK
    )
    :vars
    (
      ?auto_4052 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4051 ?auto_4052 ) ( CLEAR ?auto_4051 ) ( HAND-EMPTY ) ( not ( = ?auto_4051 ?auto_4052 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4051 ?auto_4052 )
      ( !PUTDOWN ?auto_4051 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4054 - BLOCK
    )
    :vars
    (
      ?auto_4055 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4054 ?auto_4055 ) ( CLEAR ?auto_4054 ) ( HAND-EMPTY ) ( not ( = ?auto_4054 ?auto_4055 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4054 ?auto_4055 )
      ( !PUTDOWN ?auto_4054 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4058 - BLOCK
      ?auto_4059 - BLOCK
    )
    :vars
    (
      ?auto_4060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4058 ) ( ON ?auto_4059 ?auto_4060 ) ( CLEAR ?auto_4059 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4058 ) ( not ( = ?auto_4058 ?auto_4059 ) ) ( not ( = ?auto_4058 ?auto_4060 ) ) ( not ( = ?auto_4059 ?auto_4060 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4059 ?auto_4060 )
      ( !STACK ?auto_4059 ?auto_4058 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4063 - BLOCK
      ?auto_4064 - BLOCK
    )
    :vars
    (
      ?auto_4065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4063 ) ( ON ?auto_4064 ?auto_4065 ) ( CLEAR ?auto_4064 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4063 ) ( not ( = ?auto_4063 ?auto_4064 ) ) ( not ( = ?auto_4063 ?auto_4065 ) ) ( not ( = ?auto_4064 ?auto_4065 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4064 ?auto_4065 )
      ( !STACK ?auto_4064 ?auto_4063 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4068 - BLOCK
      ?auto_4069 - BLOCK
    )
    :vars
    (
      ?auto_4070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4069 ?auto_4070 ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( not ( = ?auto_4068 ?auto_4070 ) ) ( not ( = ?auto_4069 ?auto_4070 ) ) ( ON ?auto_4068 ?auto_4069 ) ( CLEAR ?auto_4068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4068 )
      ( MAKE-2PILE ?auto_4068 ?auto_4069 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4073 - BLOCK
      ?auto_4074 - BLOCK
    )
    :vars
    (
      ?auto_4075 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4074 ?auto_4075 ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4075 ) ) ( not ( = ?auto_4074 ?auto_4075 ) ) ( ON ?auto_4073 ?auto_4074 ) ( CLEAR ?auto_4073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4073 )
      ( MAKE-2PILE ?auto_4073 ?auto_4074 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4079 - BLOCK
      ?auto_4080 - BLOCK
      ?auto_4081 - BLOCK
    )
    :vars
    (
      ?auto_4082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4080 ) ( ON ?auto_4081 ?auto_4082 ) ( CLEAR ?auto_4081 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4079 ) ( ON ?auto_4080 ?auto_4079 ) ( not ( = ?auto_4079 ?auto_4080 ) ) ( not ( = ?auto_4079 ?auto_4081 ) ) ( not ( = ?auto_4079 ?auto_4082 ) ) ( not ( = ?auto_4080 ?auto_4081 ) ) ( not ( = ?auto_4080 ?auto_4082 ) ) ( not ( = ?auto_4081 ?auto_4082 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4081 ?auto_4082 )
      ( !STACK ?auto_4081 ?auto_4080 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4086 - BLOCK
      ?auto_4087 - BLOCK
      ?auto_4088 - BLOCK
    )
    :vars
    (
      ?auto_4089 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4087 ) ( ON ?auto_4088 ?auto_4089 ) ( CLEAR ?auto_4088 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4086 ) ( ON ?auto_4087 ?auto_4086 ) ( not ( = ?auto_4086 ?auto_4087 ) ) ( not ( = ?auto_4086 ?auto_4088 ) ) ( not ( = ?auto_4086 ?auto_4089 ) ) ( not ( = ?auto_4087 ?auto_4088 ) ) ( not ( = ?auto_4087 ?auto_4089 ) ) ( not ( = ?auto_4088 ?auto_4089 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4088 ?auto_4089 )
      ( !STACK ?auto_4088 ?auto_4087 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4093 - BLOCK
      ?auto_4094 - BLOCK
      ?auto_4095 - BLOCK
    )
    :vars
    (
      ?auto_4096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4095 ?auto_4096 ) ( ON-TABLE ?auto_4093 ) ( not ( = ?auto_4093 ?auto_4094 ) ) ( not ( = ?auto_4093 ?auto_4095 ) ) ( not ( = ?auto_4093 ?auto_4096 ) ) ( not ( = ?auto_4094 ?auto_4095 ) ) ( not ( = ?auto_4094 ?auto_4096 ) ) ( not ( = ?auto_4095 ?auto_4096 ) ) ( CLEAR ?auto_4093 ) ( ON ?auto_4094 ?auto_4095 ) ( CLEAR ?auto_4094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4093 ?auto_4094 )
      ( MAKE-3PILE ?auto_4093 ?auto_4094 ?auto_4095 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4100 - BLOCK
      ?auto_4101 - BLOCK
      ?auto_4102 - BLOCK
    )
    :vars
    (
      ?auto_4103 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4102 ?auto_4103 ) ( ON-TABLE ?auto_4100 ) ( not ( = ?auto_4100 ?auto_4101 ) ) ( not ( = ?auto_4100 ?auto_4102 ) ) ( not ( = ?auto_4100 ?auto_4103 ) ) ( not ( = ?auto_4101 ?auto_4102 ) ) ( not ( = ?auto_4101 ?auto_4103 ) ) ( not ( = ?auto_4102 ?auto_4103 ) ) ( CLEAR ?auto_4100 ) ( ON ?auto_4101 ?auto_4102 ) ( CLEAR ?auto_4101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4100 ?auto_4101 )
      ( MAKE-3PILE ?auto_4100 ?auto_4101 ?auto_4102 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4107 - BLOCK
      ?auto_4108 - BLOCK
      ?auto_4109 - BLOCK
    )
    :vars
    (
      ?auto_4110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4109 ?auto_4110 ) ( not ( = ?auto_4107 ?auto_4108 ) ) ( not ( = ?auto_4107 ?auto_4109 ) ) ( not ( = ?auto_4107 ?auto_4110 ) ) ( not ( = ?auto_4108 ?auto_4109 ) ) ( not ( = ?auto_4108 ?auto_4110 ) ) ( not ( = ?auto_4109 ?auto_4110 ) ) ( ON ?auto_4108 ?auto_4109 ) ( ON ?auto_4107 ?auto_4108 ) ( CLEAR ?auto_4107 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4107 )
      ( MAKE-3PILE ?auto_4107 ?auto_4108 ?auto_4109 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4114 - BLOCK
      ?auto_4115 - BLOCK
      ?auto_4116 - BLOCK
    )
    :vars
    (
      ?auto_4117 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4116 ?auto_4117 ) ( not ( = ?auto_4114 ?auto_4115 ) ) ( not ( = ?auto_4114 ?auto_4116 ) ) ( not ( = ?auto_4114 ?auto_4117 ) ) ( not ( = ?auto_4115 ?auto_4116 ) ) ( not ( = ?auto_4115 ?auto_4117 ) ) ( not ( = ?auto_4116 ?auto_4117 ) ) ( ON ?auto_4115 ?auto_4116 ) ( ON ?auto_4114 ?auto_4115 ) ( CLEAR ?auto_4114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4114 )
      ( MAKE-3PILE ?auto_4114 ?auto_4115 ?auto_4116 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4122 - BLOCK
      ?auto_4123 - BLOCK
      ?auto_4124 - BLOCK
      ?auto_4125 - BLOCK
    )
    :vars
    (
      ?auto_4126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4124 ) ( ON ?auto_4125 ?auto_4126 ) ( CLEAR ?auto_4125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4122 ) ( ON ?auto_4123 ?auto_4122 ) ( ON ?auto_4124 ?auto_4123 ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4124 ) ) ( not ( = ?auto_4122 ?auto_4125 ) ) ( not ( = ?auto_4122 ?auto_4126 ) ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4123 ?auto_4125 ) ) ( not ( = ?auto_4123 ?auto_4126 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4126 ) ) ( not ( = ?auto_4125 ?auto_4126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4125 ?auto_4126 )
      ( !STACK ?auto_4125 ?auto_4124 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4131 - BLOCK
      ?auto_4132 - BLOCK
      ?auto_4133 - BLOCK
      ?auto_4134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4133 ) ( ON-TABLE ?auto_4134 ) ( CLEAR ?auto_4134 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4131 ) ( ON ?auto_4132 ?auto_4131 ) ( ON ?auto_4133 ?auto_4132 ) ( not ( = ?auto_4131 ?auto_4132 ) ) ( not ( = ?auto_4131 ?auto_4133 ) ) ( not ( = ?auto_4131 ?auto_4134 ) ) ( not ( = ?auto_4132 ?auto_4133 ) ) ( not ( = ?auto_4132 ?auto_4134 ) ) ( not ( = ?auto_4133 ?auto_4134 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_4134 )
      ( !STACK ?auto_4134 ?auto_4133 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4139 - BLOCK
      ?auto_4140 - BLOCK
      ?auto_4141 - BLOCK
      ?auto_4142 - BLOCK
    )
    :vars
    (
      ?auto_4143 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4142 ?auto_4143 ) ( ON-TABLE ?auto_4139 ) ( ON ?auto_4140 ?auto_4139 ) ( not ( = ?auto_4139 ?auto_4140 ) ) ( not ( = ?auto_4139 ?auto_4141 ) ) ( not ( = ?auto_4139 ?auto_4142 ) ) ( not ( = ?auto_4139 ?auto_4143 ) ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4140 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4142 ?auto_4143 ) ) ( CLEAR ?auto_4140 ) ( ON ?auto_4141 ?auto_4142 ) ( CLEAR ?auto_4141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4139 ?auto_4140 ?auto_4141 )
      ( MAKE-4PILE ?auto_4139 ?auto_4140 ?auto_4141 ?auto_4142 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4148 - BLOCK
      ?auto_4149 - BLOCK
      ?auto_4150 - BLOCK
      ?auto_4151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4151 ) ( ON-TABLE ?auto_4148 ) ( ON ?auto_4149 ?auto_4148 ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( not ( = ?auto_4148 ?auto_4150 ) ) ( not ( = ?auto_4148 ?auto_4151 ) ) ( not ( = ?auto_4149 ?auto_4150 ) ) ( not ( = ?auto_4149 ?auto_4151 ) ) ( not ( = ?auto_4150 ?auto_4151 ) ) ( CLEAR ?auto_4149 ) ( ON ?auto_4150 ?auto_4151 ) ( CLEAR ?auto_4150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4148 ?auto_4149 ?auto_4150 )
      ( MAKE-4PILE ?auto_4148 ?auto_4149 ?auto_4150 ?auto_4151 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4156 - BLOCK
      ?auto_4157 - BLOCK
      ?auto_4158 - BLOCK
      ?auto_4159 - BLOCK
    )
    :vars
    (
      ?auto_4160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4159 ?auto_4160 ) ( ON-TABLE ?auto_4156 ) ( not ( = ?auto_4156 ?auto_4157 ) ) ( not ( = ?auto_4156 ?auto_4158 ) ) ( not ( = ?auto_4156 ?auto_4159 ) ) ( not ( = ?auto_4156 ?auto_4160 ) ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4157 ?auto_4160 ) ) ( not ( = ?auto_4158 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4160 ) ) ( not ( = ?auto_4159 ?auto_4160 ) ) ( ON ?auto_4158 ?auto_4159 ) ( CLEAR ?auto_4156 ) ( ON ?auto_4157 ?auto_4158 ) ( CLEAR ?auto_4157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4156 ?auto_4157 )
      ( MAKE-4PILE ?auto_4156 ?auto_4157 ?auto_4158 ?auto_4159 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4165 - BLOCK
      ?auto_4166 - BLOCK
      ?auto_4167 - BLOCK
      ?auto_4168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4168 ) ( ON-TABLE ?auto_4165 ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4168 ) ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4168 ) ) ( not ( = ?auto_4167 ?auto_4168 ) ) ( ON ?auto_4167 ?auto_4168 ) ( CLEAR ?auto_4165 ) ( ON ?auto_4166 ?auto_4167 ) ( CLEAR ?auto_4166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4165 ?auto_4166 )
      ( MAKE-4PILE ?auto_4165 ?auto_4166 ?auto_4167 ?auto_4168 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4173 - BLOCK
      ?auto_4174 - BLOCK
      ?auto_4175 - BLOCK
      ?auto_4176 - BLOCK
    )
    :vars
    (
      ?auto_4177 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4176 ?auto_4177 ) ( not ( = ?auto_4173 ?auto_4174 ) ) ( not ( = ?auto_4173 ?auto_4175 ) ) ( not ( = ?auto_4173 ?auto_4176 ) ) ( not ( = ?auto_4173 ?auto_4177 ) ) ( not ( = ?auto_4174 ?auto_4175 ) ) ( not ( = ?auto_4174 ?auto_4176 ) ) ( not ( = ?auto_4174 ?auto_4177 ) ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( ON ?auto_4175 ?auto_4176 ) ( ON ?auto_4174 ?auto_4175 ) ( ON ?auto_4173 ?auto_4174 ) ( CLEAR ?auto_4173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4173 )
      ( MAKE-4PILE ?auto_4173 ?auto_4174 ?auto_4175 ?auto_4176 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4182 - BLOCK
      ?auto_4183 - BLOCK
      ?auto_4184 - BLOCK
      ?auto_4185 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4185 ) ( not ( = ?auto_4182 ?auto_4183 ) ) ( not ( = ?auto_4182 ?auto_4184 ) ) ( not ( = ?auto_4182 ?auto_4185 ) ) ( not ( = ?auto_4183 ?auto_4184 ) ) ( not ( = ?auto_4183 ?auto_4185 ) ) ( not ( = ?auto_4184 ?auto_4185 ) ) ( ON ?auto_4184 ?auto_4185 ) ( ON ?auto_4183 ?auto_4184 ) ( ON ?auto_4182 ?auto_4183 ) ( CLEAR ?auto_4182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4182 )
      ( MAKE-4PILE ?auto_4182 ?auto_4183 ?auto_4184 ?auto_4185 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_4190 - BLOCK
      ?auto_4191 - BLOCK
      ?auto_4192 - BLOCK
      ?auto_4193 - BLOCK
    )
    :vars
    (
      ?auto_4194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4190 ?auto_4191 ) ) ( not ( = ?auto_4190 ?auto_4192 ) ) ( not ( = ?auto_4190 ?auto_4193 ) ) ( not ( = ?auto_4191 ?auto_4192 ) ) ( not ( = ?auto_4191 ?auto_4193 ) ) ( not ( = ?auto_4192 ?auto_4193 ) ) ( ON ?auto_4190 ?auto_4194 ) ( not ( = ?auto_4193 ?auto_4194 ) ) ( not ( = ?auto_4192 ?auto_4194 ) ) ( not ( = ?auto_4191 ?auto_4194 ) ) ( not ( = ?auto_4190 ?auto_4194 ) ) ( ON ?auto_4191 ?auto_4190 ) ( ON ?auto_4192 ?auto_4191 ) ( ON ?auto_4193 ?auto_4192 ) ( CLEAR ?auto_4193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_4193 ?auto_4192 ?auto_4191 ?auto_4190 )
      ( MAKE-4PILE ?auto_4190 ?auto_4191 ?auto_4192 ?auto_4193 ) )
  )

)

