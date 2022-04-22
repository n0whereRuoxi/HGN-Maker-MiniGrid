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
      ?auto_4123 - BLOCK
      ?auto_4124 - BLOCK
      ?auto_4125 - BLOCK
    )
    :vars
    (
      ?auto_4126 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4126 ?auto_4125 ) ( CLEAR ?auto_4126 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4123 ) ( ON ?auto_4124 ?auto_4123 ) ( ON ?auto_4125 ?auto_4124 ) ( not ( = ?auto_4123 ?auto_4124 ) ) ( not ( = ?auto_4123 ?auto_4125 ) ) ( not ( = ?auto_4123 ?auto_4126 ) ) ( not ( = ?auto_4124 ?auto_4125 ) ) ( not ( = ?auto_4124 ?auto_4126 ) ) ( not ( = ?auto_4125 ?auto_4126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4126 ?auto_4125 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4128 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4128 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4129 - BLOCK
    )
    :vars
    (
      ?auto_4130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4129 ?auto_4130 ) ( CLEAR ?auto_4129 ) ( HAND-EMPTY ) ( not ( = ?auto_4129 ?auto_4130 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4129 ?auto_4130 )
      ( MAKE-1PILE ?auto_4129 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4133 - BLOCK
      ?auto_4134 - BLOCK
    )
    :vars
    (
      ?auto_4135 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4135 ?auto_4134 ) ( CLEAR ?auto_4135 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4133 ) ( ON ?auto_4134 ?auto_4133 ) ( not ( = ?auto_4133 ?auto_4134 ) ) ( not ( = ?auto_4133 ?auto_4135 ) ) ( not ( = ?auto_4134 ?auto_4135 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4135 ?auto_4134 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4136 - BLOCK
      ?auto_4137 - BLOCK
    )
    :vars
    (
      ?auto_4138 - BLOCK
      ?auto_4139 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4138 ?auto_4137 ) ( CLEAR ?auto_4138 ) ( ON-TABLE ?auto_4136 ) ( ON ?auto_4137 ?auto_4136 ) ( not ( = ?auto_4136 ?auto_4137 ) ) ( not ( = ?auto_4136 ?auto_4138 ) ) ( not ( = ?auto_4137 ?auto_4138 ) ) ( HOLDING ?auto_4139 ) ( not ( = ?auto_4136 ?auto_4139 ) ) ( not ( = ?auto_4137 ?auto_4139 ) ) ( not ( = ?auto_4138 ?auto_4139 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4139 )
      ( MAKE-2PILE ?auto_4136 ?auto_4137 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4140 - BLOCK
      ?auto_4141 - BLOCK
    )
    :vars
    (
      ?auto_4143 - BLOCK
      ?auto_4142 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4143 ?auto_4141 ) ( ON-TABLE ?auto_4140 ) ( ON ?auto_4141 ?auto_4140 ) ( not ( = ?auto_4140 ?auto_4141 ) ) ( not ( = ?auto_4140 ?auto_4143 ) ) ( not ( = ?auto_4141 ?auto_4143 ) ) ( not ( = ?auto_4140 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4143 ?auto_4142 ) ) ( ON ?auto_4142 ?auto_4143 ) ( CLEAR ?auto_4142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4140 ?auto_4141 ?auto_4143 )
      ( MAKE-2PILE ?auto_4140 ?auto_4141 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4146 - BLOCK
      ?auto_4147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4147 ) ( CLEAR ?auto_4146 ) ( ON-TABLE ?auto_4146 ) ( not ( = ?auto_4146 ?auto_4147 ) ) )
    :subtasks
    ( ( !STACK ?auto_4147 ?auto_4146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4148 - BLOCK
      ?auto_4149 - BLOCK
    )
    :vars
    (
      ?auto_4150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4148 ) ( ON-TABLE ?auto_4148 ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( ON ?auto_4149 ?auto_4150 ) ( CLEAR ?auto_4149 ) ( HAND-EMPTY ) ( not ( = ?auto_4148 ?auto_4150 ) ) ( not ( = ?auto_4149 ?auto_4150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4149 ?auto_4150 )
      ( MAKE-2PILE ?auto_4148 ?auto_4149 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4151 - BLOCK
      ?auto_4152 - BLOCK
    )
    :vars
    (
      ?auto_4153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4151 ?auto_4152 ) ) ( ON ?auto_4152 ?auto_4153 ) ( CLEAR ?auto_4152 ) ( not ( = ?auto_4151 ?auto_4153 ) ) ( not ( = ?auto_4152 ?auto_4153 ) ) ( HOLDING ?auto_4151 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4151 )
      ( MAKE-2PILE ?auto_4151 ?auto_4152 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4154 - BLOCK
      ?auto_4155 - BLOCK
    )
    :vars
    (
      ?auto_4156 - BLOCK
      ?auto_4157 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4154 ?auto_4155 ) ) ( ON ?auto_4155 ?auto_4156 ) ( not ( = ?auto_4154 ?auto_4156 ) ) ( not ( = ?auto_4155 ?auto_4156 ) ) ( ON ?auto_4154 ?auto_4155 ) ( CLEAR ?auto_4154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4157 ) ( ON ?auto_4156 ?auto_4157 ) ( not ( = ?auto_4157 ?auto_4156 ) ) ( not ( = ?auto_4157 ?auto_4155 ) ) ( not ( = ?auto_4157 ?auto_4154 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4157 ?auto_4156 ?auto_4155 )
      ( MAKE-2PILE ?auto_4154 ?auto_4155 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4159 - BLOCK
    )
    :vars
    (
      ?auto_4160 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4160 ?auto_4159 ) ( CLEAR ?auto_4160 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4159 ) ( not ( = ?auto_4159 ?auto_4160 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4160 ?auto_4159 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4161 - BLOCK
    )
    :vars
    (
      ?auto_4162 - BLOCK
      ?auto_4163 - BLOCK
      ?auto_4164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4162 ?auto_4161 ) ( CLEAR ?auto_4162 ) ( ON-TABLE ?auto_4161 ) ( not ( = ?auto_4161 ?auto_4162 ) ) ( HOLDING ?auto_4163 ) ( CLEAR ?auto_4164 ) ( not ( = ?auto_4161 ?auto_4163 ) ) ( not ( = ?auto_4161 ?auto_4164 ) ) ( not ( = ?auto_4162 ?auto_4163 ) ) ( not ( = ?auto_4162 ?auto_4164 ) ) ( not ( = ?auto_4163 ?auto_4164 ) ) )
    :subtasks
    ( ( !STACK ?auto_4163 ?auto_4164 )
      ( MAKE-1PILE ?auto_4161 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4165 - BLOCK
    )
    :vars
    (
      ?auto_4168 - BLOCK
      ?auto_4167 - BLOCK
      ?auto_4166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4168 ?auto_4165 ) ( ON-TABLE ?auto_4165 ) ( not ( = ?auto_4165 ?auto_4168 ) ) ( CLEAR ?auto_4167 ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4168 ?auto_4166 ) ) ( not ( = ?auto_4168 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( ON ?auto_4166 ?auto_4168 ) ( CLEAR ?auto_4166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4165 ?auto_4168 )
      ( MAKE-1PILE ?auto_4165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4169 - BLOCK
    )
    :vars
    (
      ?auto_4172 - BLOCK
      ?auto_4170 - BLOCK
      ?auto_4171 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4172 ?auto_4169 ) ( ON-TABLE ?auto_4169 ) ( not ( = ?auto_4169 ?auto_4172 ) ) ( not ( = ?auto_4169 ?auto_4170 ) ) ( not ( = ?auto_4169 ?auto_4171 ) ) ( not ( = ?auto_4172 ?auto_4170 ) ) ( not ( = ?auto_4172 ?auto_4171 ) ) ( not ( = ?auto_4170 ?auto_4171 ) ) ( ON ?auto_4170 ?auto_4172 ) ( CLEAR ?auto_4170 ) ( HOLDING ?auto_4171 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4171 )
      ( MAKE-1PILE ?auto_4169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4173 - BLOCK
    )
    :vars
    (
      ?auto_4175 - BLOCK
      ?auto_4176 - BLOCK
      ?auto_4174 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4175 ?auto_4173 ) ( ON-TABLE ?auto_4173 ) ( not ( = ?auto_4173 ?auto_4175 ) ) ( not ( = ?auto_4173 ?auto_4176 ) ) ( not ( = ?auto_4173 ?auto_4174 ) ) ( not ( = ?auto_4175 ?auto_4176 ) ) ( not ( = ?auto_4175 ?auto_4174 ) ) ( not ( = ?auto_4176 ?auto_4174 ) ) ( ON ?auto_4176 ?auto_4175 ) ( ON ?auto_4174 ?auto_4176 ) ( CLEAR ?auto_4174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4173 ?auto_4175 ?auto_4176 )
      ( MAKE-1PILE ?auto_4173 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4180 - BLOCK
      ?auto_4181 - BLOCK
      ?auto_4182 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4182 ) ( CLEAR ?auto_4181 ) ( ON-TABLE ?auto_4180 ) ( ON ?auto_4181 ?auto_4180 ) ( not ( = ?auto_4180 ?auto_4181 ) ) ( not ( = ?auto_4180 ?auto_4182 ) ) ( not ( = ?auto_4181 ?auto_4182 ) ) )
    :subtasks
    ( ( !STACK ?auto_4182 ?auto_4181 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4183 - BLOCK
      ?auto_4184 - BLOCK
      ?auto_4185 - BLOCK
    )
    :vars
    (
      ?auto_4186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4184 ) ( ON-TABLE ?auto_4183 ) ( ON ?auto_4184 ?auto_4183 ) ( not ( = ?auto_4183 ?auto_4184 ) ) ( not ( = ?auto_4183 ?auto_4185 ) ) ( not ( = ?auto_4184 ?auto_4185 ) ) ( ON ?auto_4185 ?auto_4186 ) ( CLEAR ?auto_4185 ) ( HAND-EMPTY ) ( not ( = ?auto_4183 ?auto_4186 ) ) ( not ( = ?auto_4184 ?auto_4186 ) ) ( not ( = ?auto_4185 ?auto_4186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4185 ?auto_4186 )
      ( MAKE-3PILE ?auto_4183 ?auto_4184 ?auto_4185 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4187 - BLOCK
      ?auto_4188 - BLOCK
      ?auto_4189 - BLOCK
    )
    :vars
    (
      ?auto_4190 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4187 ) ( not ( = ?auto_4187 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4189 ) ) ( not ( = ?auto_4188 ?auto_4189 ) ) ( ON ?auto_4189 ?auto_4190 ) ( CLEAR ?auto_4189 ) ( not ( = ?auto_4187 ?auto_4190 ) ) ( not ( = ?auto_4188 ?auto_4190 ) ) ( not ( = ?auto_4189 ?auto_4190 ) ) ( HOLDING ?auto_4188 ) ( CLEAR ?auto_4187 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4187 ?auto_4188 )
      ( MAKE-3PILE ?auto_4187 ?auto_4188 ?auto_4189 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4191 - BLOCK
      ?auto_4192 - BLOCK
      ?auto_4193 - BLOCK
    )
    :vars
    (
      ?auto_4194 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4191 ) ( not ( = ?auto_4191 ?auto_4192 ) ) ( not ( = ?auto_4191 ?auto_4193 ) ) ( not ( = ?auto_4192 ?auto_4193 ) ) ( ON ?auto_4193 ?auto_4194 ) ( not ( = ?auto_4191 ?auto_4194 ) ) ( not ( = ?auto_4192 ?auto_4194 ) ) ( not ( = ?auto_4193 ?auto_4194 ) ) ( CLEAR ?auto_4191 ) ( ON ?auto_4192 ?auto_4193 ) ( CLEAR ?auto_4192 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4194 ?auto_4193 )
      ( MAKE-3PILE ?auto_4191 ?auto_4192 ?auto_4193 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4195 - BLOCK
      ?auto_4196 - BLOCK
      ?auto_4197 - BLOCK
    )
    :vars
    (
      ?auto_4198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4195 ?auto_4196 ) ) ( not ( = ?auto_4195 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( ON ?auto_4197 ?auto_4198 ) ( not ( = ?auto_4195 ?auto_4198 ) ) ( not ( = ?auto_4196 ?auto_4198 ) ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( ON ?auto_4196 ?auto_4197 ) ( CLEAR ?auto_4196 ) ( ON-TABLE ?auto_4198 ) ( HOLDING ?auto_4195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4195 )
      ( MAKE-3PILE ?auto_4195 ?auto_4196 ?auto_4197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4199 - BLOCK
      ?auto_4200 - BLOCK
      ?auto_4201 - BLOCK
    )
    :vars
    (
      ?auto_4202 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4199 ?auto_4200 ) ) ( not ( = ?auto_4199 ?auto_4201 ) ) ( not ( = ?auto_4200 ?auto_4201 ) ) ( ON ?auto_4201 ?auto_4202 ) ( not ( = ?auto_4199 ?auto_4202 ) ) ( not ( = ?auto_4200 ?auto_4202 ) ) ( not ( = ?auto_4201 ?auto_4202 ) ) ( ON ?auto_4200 ?auto_4201 ) ( ON-TABLE ?auto_4202 ) ( ON ?auto_4199 ?auto_4200 ) ( CLEAR ?auto_4199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4202 ?auto_4201 ?auto_4200 )
      ( MAKE-3PILE ?auto_4199 ?auto_4200 ?auto_4201 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4205 - BLOCK
      ?auto_4206 - BLOCK
    )
    :vars
    (
      ?auto_4207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4207 ?auto_4206 ) ( CLEAR ?auto_4207 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4205 ) ( ON ?auto_4206 ?auto_4205 ) ( not ( = ?auto_4205 ?auto_4206 ) ) ( not ( = ?auto_4205 ?auto_4207 ) ) ( not ( = ?auto_4206 ?auto_4207 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4207 ?auto_4206 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4215 - BLOCK
      ?auto_4216 - BLOCK
    )
    :vars
    (
      ?auto_4217 - BLOCK
      ?auto_4218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4215 ) ( not ( = ?auto_4215 ?auto_4216 ) ) ( not ( = ?auto_4215 ?auto_4217 ) ) ( not ( = ?auto_4216 ?auto_4217 ) ) ( ON ?auto_4217 ?auto_4218 ) ( CLEAR ?auto_4217 ) ( not ( = ?auto_4215 ?auto_4218 ) ) ( not ( = ?auto_4216 ?auto_4218 ) ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( HOLDING ?auto_4216 ) ( CLEAR ?auto_4215 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4215 ?auto_4216 ?auto_4217 )
      ( MAKE-2PILE ?auto_4215 ?auto_4216 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4219 - BLOCK
      ?auto_4220 - BLOCK
    )
    :vars
    (
      ?auto_4222 - BLOCK
      ?auto_4221 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4219 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4222 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( ON ?auto_4222 ?auto_4221 ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4222 ?auto_4221 ) ) ( CLEAR ?auto_4219 ) ( ON ?auto_4220 ?auto_4222 ) ( CLEAR ?auto_4220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4221 ?auto_4222 )
      ( MAKE-2PILE ?auto_4219 ?auto_4220 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4223 - BLOCK
      ?auto_4224 - BLOCK
    )
    :vars
    (
      ?auto_4225 - BLOCK
      ?auto_4226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4223 ?auto_4225 ) ) ( not ( = ?auto_4224 ?auto_4225 ) ) ( ON ?auto_4225 ?auto_4226 ) ( not ( = ?auto_4223 ?auto_4226 ) ) ( not ( = ?auto_4224 ?auto_4226 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( ON ?auto_4224 ?auto_4225 ) ( CLEAR ?auto_4224 ) ( ON-TABLE ?auto_4226 ) ( HOLDING ?auto_4223 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4223 )
      ( MAKE-2PILE ?auto_4223 ?auto_4224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4227 - BLOCK
      ?auto_4228 - BLOCK
    )
    :vars
    (
      ?auto_4229 - BLOCK
      ?auto_4230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4227 ?auto_4228 ) ) ( not ( = ?auto_4227 ?auto_4229 ) ) ( not ( = ?auto_4228 ?auto_4229 ) ) ( ON ?auto_4229 ?auto_4230 ) ( not ( = ?auto_4227 ?auto_4230 ) ) ( not ( = ?auto_4228 ?auto_4230 ) ) ( not ( = ?auto_4229 ?auto_4230 ) ) ( ON ?auto_4228 ?auto_4229 ) ( ON-TABLE ?auto_4230 ) ( ON ?auto_4227 ?auto_4228 ) ( CLEAR ?auto_4227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4230 ?auto_4229 ?auto_4228 )
      ( MAKE-2PILE ?auto_4227 ?auto_4228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4232 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4232 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4233 - BLOCK
    )
    :vars
    (
      ?auto_4234 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4233 ?auto_4234 ) ( CLEAR ?auto_4233 ) ( HAND-EMPTY ) ( not ( = ?auto_4233 ?auto_4234 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4233 ?auto_4234 )
      ( MAKE-1PILE ?auto_4233 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4235 - BLOCK
    )
    :vars
    (
      ?auto_4236 - BLOCK
      ?auto_4237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4235 ?auto_4236 ) ) ( HOLDING ?auto_4235 ) ( CLEAR ?auto_4236 ) ( ON-TABLE ?auto_4237 ) ( ON ?auto_4236 ?auto_4237 ) ( not ( = ?auto_4237 ?auto_4236 ) ) ( not ( = ?auto_4237 ?auto_4235 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4237 ?auto_4236 ?auto_4235 )
      ( MAKE-1PILE ?auto_4235 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4238 - BLOCK
    )
    :vars
    (
      ?auto_4240 - BLOCK
      ?auto_4239 - BLOCK
      ?auto_4241 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4238 ?auto_4240 ) ) ( CLEAR ?auto_4240 ) ( ON-TABLE ?auto_4239 ) ( ON ?auto_4240 ?auto_4239 ) ( not ( = ?auto_4239 ?auto_4240 ) ) ( not ( = ?auto_4239 ?auto_4238 ) ) ( ON ?auto_4238 ?auto_4241 ) ( CLEAR ?auto_4238 ) ( HAND-EMPTY ) ( not ( = ?auto_4238 ?auto_4241 ) ) ( not ( = ?auto_4240 ?auto_4241 ) ) ( not ( = ?auto_4239 ?auto_4241 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4238 ?auto_4241 )
      ( MAKE-1PILE ?auto_4238 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4242 - BLOCK
    )
    :vars
    (
      ?auto_4243 - BLOCK
      ?auto_4245 - BLOCK
      ?auto_4244 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4242 ?auto_4243 ) ) ( ON-TABLE ?auto_4245 ) ( not ( = ?auto_4245 ?auto_4243 ) ) ( not ( = ?auto_4245 ?auto_4242 ) ) ( ON ?auto_4242 ?auto_4244 ) ( CLEAR ?auto_4242 ) ( not ( = ?auto_4242 ?auto_4244 ) ) ( not ( = ?auto_4243 ?auto_4244 ) ) ( not ( = ?auto_4245 ?auto_4244 ) ) ( HOLDING ?auto_4243 ) ( CLEAR ?auto_4245 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4245 ?auto_4243 )
      ( MAKE-1PILE ?auto_4242 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4246 - BLOCK
    )
    :vars
    (
      ?auto_4247 - BLOCK
      ?auto_4249 - BLOCK
      ?auto_4248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4246 ?auto_4247 ) ) ( ON-TABLE ?auto_4249 ) ( not ( = ?auto_4249 ?auto_4247 ) ) ( not ( = ?auto_4249 ?auto_4246 ) ) ( ON ?auto_4246 ?auto_4248 ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4249 ?auto_4248 ) ) ( CLEAR ?auto_4249 ) ( ON ?auto_4247 ?auto_4246 ) ( CLEAR ?auto_4247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4248 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4248 ?auto_4246 )
      ( MAKE-1PILE ?auto_4246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4250 - BLOCK
    )
    :vars
    (
      ?auto_4252 - BLOCK
      ?auto_4253 - BLOCK
      ?auto_4251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4250 ?auto_4252 ) ) ( not ( = ?auto_4253 ?auto_4252 ) ) ( not ( = ?auto_4253 ?auto_4250 ) ) ( ON ?auto_4250 ?auto_4251 ) ( not ( = ?auto_4250 ?auto_4251 ) ) ( not ( = ?auto_4252 ?auto_4251 ) ) ( not ( = ?auto_4253 ?auto_4251 ) ) ( ON ?auto_4252 ?auto_4250 ) ( CLEAR ?auto_4252 ) ( ON-TABLE ?auto_4251 ) ( HOLDING ?auto_4253 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4253 )
      ( MAKE-1PILE ?auto_4250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4254 - BLOCK
    )
    :vars
    (
      ?auto_4255 - BLOCK
      ?auto_4256 - BLOCK
      ?auto_4257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4256 ?auto_4255 ) ) ( not ( = ?auto_4256 ?auto_4254 ) ) ( ON ?auto_4254 ?auto_4257 ) ( not ( = ?auto_4254 ?auto_4257 ) ) ( not ( = ?auto_4255 ?auto_4257 ) ) ( not ( = ?auto_4256 ?auto_4257 ) ) ( ON ?auto_4255 ?auto_4254 ) ( ON-TABLE ?auto_4257 ) ( ON ?auto_4256 ?auto_4255 ) ( CLEAR ?auto_4256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4257 ?auto_4254 ?auto_4255 )
      ( MAKE-1PILE ?auto_4254 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4259 - BLOCK
    )
    :vars
    (
      ?auto_4260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4260 ?auto_4259 ) ( CLEAR ?auto_4260 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4259 ) ( not ( = ?auto_4259 ?auto_4260 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4260 ?auto_4259 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4261 - BLOCK
    )
    :vars
    (
      ?auto_4262 - BLOCK
      ?auto_4263 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4262 ?auto_4261 ) ( CLEAR ?auto_4262 ) ( ON-TABLE ?auto_4261 ) ( not ( = ?auto_4261 ?auto_4262 ) ) ( HOLDING ?auto_4263 ) ( not ( = ?auto_4261 ?auto_4263 ) ) ( not ( = ?auto_4262 ?auto_4263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4263 )
      ( MAKE-1PILE ?auto_4261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4264 - BLOCK
    )
    :vars
    (
      ?auto_4265 - BLOCK
      ?auto_4266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4265 ?auto_4264 ) ( ON-TABLE ?auto_4264 ) ( not ( = ?auto_4264 ?auto_4265 ) ) ( not ( = ?auto_4264 ?auto_4266 ) ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( ON ?auto_4266 ?auto_4265 ) ( CLEAR ?auto_4266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4264 ?auto_4265 )
      ( MAKE-1PILE ?auto_4264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4267 - BLOCK
    )
    :vars
    (
      ?auto_4268 - BLOCK
      ?auto_4269 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4268 ?auto_4267 ) ( ON-TABLE ?auto_4267 ) ( not ( = ?auto_4267 ?auto_4268 ) ) ( not ( = ?auto_4267 ?auto_4269 ) ) ( not ( = ?auto_4268 ?auto_4269 ) ) ( HOLDING ?auto_4269 ) ( CLEAR ?auto_4268 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4267 ?auto_4268 ?auto_4269 )
      ( MAKE-1PILE ?auto_4267 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4270 - BLOCK
    )
    :vars
    (
      ?auto_4271 - BLOCK
      ?auto_4272 - BLOCK
      ?auto_4273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4271 ?auto_4270 ) ( ON-TABLE ?auto_4270 ) ( not ( = ?auto_4270 ?auto_4271 ) ) ( not ( = ?auto_4270 ?auto_4272 ) ) ( not ( = ?auto_4271 ?auto_4272 ) ) ( CLEAR ?auto_4271 ) ( ON ?auto_4272 ?auto_4273 ) ( CLEAR ?auto_4272 ) ( HAND-EMPTY ) ( not ( = ?auto_4270 ?auto_4273 ) ) ( not ( = ?auto_4271 ?auto_4273 ) ) ( not ( = ?auto_4272 ?auto_4273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4272 ?auto_4273 )
      ( MAKE-1PILE ?auto_4270 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4282 - BLOCK
    )
    :vars
    (
      ?auto_4285 - BLOCK
      ?auto_4283 - BLOCK
      ?auto_4284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4282 ?auto_4285 ) ) ( not ( = ?auto_4282 ?auto_4283 ) ) ( not ( = ?auto_4285 ?auto_4283 ) ) ( ON ?auto_4283 ?auto_4284 ) ( not ( = ?auto_4282 ?auto_4284 ) ) ( not ( = ?auto_4285 ?auto_4284 ) ) ( not ( = ?auto_4283 ?auto_4284 ) ) ( ON ?auto_4285 ?auto_4283 ) ( CLEAR ?auto_4285 ) ( HOLDING ?auto_4282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4282 ?auto_4285 )
      ( MAKE-1PILE ?auto_4282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4286 - BLOCK
    )
    :vars
    (
      ?auto_4287 - BLOCK
      ?auto_4288 - BLOCK
      ?auto_4289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4286 ?auto_4287 ) ) ( not ( = ?auto_4286 ?auto_4288 ) ) ( not ( = ?auto_4287 ?auto_4288 ) ) ( ON ?auto_4288 ?auto_4289 ) ( not ( = ?auto_4286 ?auto_4289 ) ) ( not ( = ?auto_4287 ?auto_4289 ) ) ( not ( = ?auto_4288 ?auto_4289 ) ) ( ON ?auto_4287 ?auto_4288 ) ( ON ?auto_4286 ?auto_4287 ) ( CLEAR ?auto_4286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4289 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4289 ?auto_4288 ?auto_4287 )
      ( MAKE-1PILE ?auto_4286 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4292 - BLOCK
      ?auto_4293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4293 ) ( CLEAR ?auto_4292 ) ( ON-TABLE ?auto_4292 ) ( not ( = ?auto_4292 ?auto_4293 ) ) )
    :subtasks
    ( ( !STACK ?auto_4293 ?auto_4292 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4294 - BLOCK
      ?auto_4295 - BLOCK
    )
    :vars
    (
      ?auto_4296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4294 ) ( ON-TABLE ?auto_4294 ) ( not ( = ?auto_4294 ?auto_4295 ) ) ( ON ?auto_4295 ?auto_4296 ) ( CLEAR ?auto_4295 ) ( HAND-EMPTY ) ( not ( = ?auto_4294 ?auto_4296 ) ) ( not ( = ?auto_4295 ?auto_4296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4295 ?auto_4296 )
      ( MAKE-2PILE ?auto_4294 ?auto_4295 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4297 - BLOCK
      ?auto_4298 - BLOCK
    )
    :vars
    (
      ?auto_4299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4297 ?auto_4298 ) ) ( ON ?auto_4298 ?auto_4299 ) ( CLEAR ?auto_4298 ) ( not ( = ?auto_4297 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( HOLDING ?auto_4297 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4297 )
      ( MAKE-2PILE ?auto_4297 ?auto_4298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4300 - BLOCK
      ?auto_4301 - BLOCK
    )
    :vars
    (
      ?auto_4302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4300 ?auto_4301 ) ) ( ON ?auto_4301 ?auto_4302 ) ( not ( = ?auto_4300 ?auto_4302 ) ) ( not ( = ?auto_4301 ?auto_4302 ) ) ( ON ?auto_4300 ?auto_4301 ) ( CLEAR ?auto_4300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4302 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4302 ?auto_4301 )
      ( MAKE-2PILE ?auto_4300 ?auto_4301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4303 - BLOCK
      ?auto_4304 - BLOCK
    )
    :vars
    (
      ?auto_4305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4303 ?auto_4304 ) ) ( ON ?auto_4304 ?auto_4305 ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4304 ?auto_4305 ) ) ( ON-TABLE ?auto_4305 ) ( HOLDING ?auto_4303 ) ( CLEAR ?auto_4304 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4305 ?auto_4304 ?auto_4303 )
      ( MAKE-2PILE ?auto_4303 ?auto_4304 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4306 - BLOCK
      ?auto_4307 - BLOCK
    )
    :vars
    (
      ?auto_4308 - BLOCK
      ?auto_4309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4306 ?auto_4307 ) ) ( ON ?auto_4307 ?auto_4308 ) ( not ( = ?auto_4306 ?auto_4308 ) ) ( not ( = ?auto_4307 ?auto_4308 ) ) ( ON-TABLE ?auto_4308 ) ( CLEAR ?auto_4307 ) ( ON ?auto_4306 ?auto_4309 ) ( CLEAR ?auto_4306 ) ( HAND-EMPTY ) ( not ( = ?auto_4306 ?auto_4309 ) ) ( not ( = ?auto_4307 ?auto_4309 ) ) ( not ( = ?auto_4308 ?auto_4309 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4306 ?auto_4309 )
      ( MAKE-2PILE ?auto_4306 ?auto_4307 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4310 - BLOCK
      ?auto_4311 - BLOCK
    )
    :vars
    (
      ?auto_4313 - BLOCK
      ?auto_4312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( ON-TABLE ?auto_4313 ) ( ON ?auto_4310 ?auto_4312 ) ( CLEAR ?auto_4310 ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4313 ?auto_4312 ) ) ( HOLDING ?auto_4311 ) ( CLEAR ?auto_4313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4313 ?auto_4311 )
      ( MAKE-2PILE ?auto_4310 ?auto_4311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4314 - BLOCK
      ?auto_4315 - BLOCK
    )
    :vars
    (
      ?auto_4317 - BLOCK
      ?auto_4316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4317 ) ) ( not ( = ?auto_4315 ?auto_4317 ) ) ( ON-TABLE ?auto_4317 ) ( ON ?auto_4314 ?auto_4316 ) ( not ( = ?auto_4314 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4317 ?auto_4316 ) ) ( CLEAR ?auto_4317 ) ( ON ?auto_4315 ?auto_4314 ) ( CLEAR ?auto_4315 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4316 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4316 ?auto_4314 )
      ( MAKE-2PILE ?auto_4314 ?auto_4315 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4318 - BLOCK
      ?auto_4319 - BLOCK
    )
    :vars
    (
      ?auto_4320 - BLOCK
      ?auto_4321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( ON ?auto_4318 ?auto_4321 ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( not ( = ?auto_4320 ?auto_4321 ) ) ( ON ?auto_4319 ?auto_4318 ) ( CLEAR ?auto_4319 ) ( ON-TABLE ?auto_4321 ) ( HOLDING ?auto_4320 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4320 )
      ( MAKE-2PILE ?auto_4318 ?auto_4319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4322 - BLOCK
      ?auto_4323 - BLOCK
    )
    :vars
    (
      ?auto_4324 - BLOCK
      ?auto_4325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4322 ?auto_4323 ) ) ( not ( = ?auto_4322 ?auto_4324 ) ) ( not ( = ?auto_4323 ?auto_4324 ) ) ( ON ?auto_4322 ?auto_4325 ) ( not ( = ?auto_4322 ?auto_4325 ) ) ( not ( = ?auto_4323 ?auto_4325 ) ) ( not ( = ?auto_4324 ?auto_4325 ) ) ( ON ?auto_4323 ?auto_4322 ) ( ON-TABLE ?auto_4325 ) ( ON ?auto_4324 ?auto_4323 ) ( CLEAR ?auto_4324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4325 ?auto_4322 ?auto_4323 )
      ( MAKE-2PILE ?auto_4322 ?auto_4323 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4329 - BLOCK
      ?auto_4330 - BLOCK
      ?auto_4331 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4331 ) ( CLEAR ?auto_4330 ) ( ON-TABLE ?auto_4329 ) ( ON ?auto_4330 ?auto_4329 ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4331 ) ) ( not ( = ?auto_4330 ?auto_4331 ) ) )
    :subtasks
    ( ( !STACK ?auto_4331 ?auto_4330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4332 - BLOCK
      ?auto_4333 - BLOCK
      ?auto_4334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4333 ) ( ON-TABLE ?auto_4332 ) ( ON ?auto_4333 ?auto_4332 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4333 ?auto_4334 ) ) ( ON-TABLE ?auto_4334 ) ( CLEAR ?auto_4334 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4334 )
      ( MAKE-3PILE ?auto_4332 ?auto_4333 ?auto_4334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4335 - BLOCK
      ?auto_4336 - BLOCK
      ?auto_4337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4335 ) ( not ( = ?auto_4335 ?auto_4336 ) ) ( not ( = ?auto_4335 ?auto_4337 ) ) ( not ( = ?auto_4336 ?auto_4337 ) ) ( ON-TABLE ?auto_4337 ) ( CLEAR ?auto_4337 ) ( HOLDING ?auto_4336 ) ( CLEAR ?auto_4335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4335 ?auto_4336 )
      ( MAKE-3PILE ?auto_4335 ?auto_4336 ?auto_4337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4338 - BLOCK
      ?auto_4339 - BLOCK
      ?auto_4340 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4338 ) ( not ( = ?auto_4338 ?auto_4339 ) ) ( not ( = ?auto_4338 ?auto_4340 ) ) ( not ( = ?auto_4339 ?auto_4340 ) ) ( ON-TABLE ?auto_4340 ) ( CLEAR ?auto_4338 ) ( ON ?auto_4339 ?auto_4340 ) ( CLEAR ?auto_4339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4340 )
      ( MAKE-3PILE ?auto_4338 ?auto_4339 ?auto_4340 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4341 - BLOCK
      ?auto_4342 - BLOCK
      ?auto_4343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4341 ?auto_4342 ) ) ( not ( = ?auto_4341 ?auto_4343 ) ) ( not ( = ?auto_4342 ?auto_4343 ) ) ( ON-TABLE ?auto_4343 ) ( ON ?auto_4342 ?auto_4343 ) ( CLEAR ?auto_4342 ) ( HOLDING ?auto_4341 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4341 )
      ( MAKE-3PILE ?auto_4341 ?auto_4342 ?auto_4343 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4344 - BLOCK
      ?auto_4345 - BLOCK
      ?auto_4346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4344 ?auto_4345 ) ) ( not ( = ?auto_4344 ?auto_4346 ) ) ( not ( = ?auto_4345 ?auto_4346 ) ) ( ON-TABLE ?auto_4346 ) ( ON ?auto_4345 ?auto_4346 ) ( ON ?auto_4344 ?auto_4345 ) ( CLEAR ?auto_4344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4346 ?auto_4345 )
      ( MAKE-3PILE ?auto_4344 ?auto_4345 ?auto_4346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4347 - BLOCK
      ?auto_4348 - BLOCK
      ?auto_4349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( ON-TABLE ?auto_4349 ) ( ON ?auto_4348 ?auto_4349 ) ( HOLDING ?auto_4347 ) ( CLEAR ?auto_4348 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4349 ?auto_4348 ?auto_4347 )
      ( MAKE-3PILE ?auto_4347 ?auto_4348 ?auto_4349 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4350 - BLOCK
      ?auto_4351 - BLOCK
      ?auto_4352 - BLOCK
    )
    :vars
    (
      ?auto_4353 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4350 ?auto_4352 ) ) ( not ( = ?auto_4351 ?auto_4352 ) ) ( ON-TABLE ?auto_4352 ) ( ON ?auto_4351 ?auto_4352 ) ( CLEAR ?auto_4351 ) ( ON ?auto_4350 ?auto_4353 ) ( CLEAR ?auto_4350 ) ( HAND-EMPTY ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( not ( = ?auto_4351 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4353 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4350 ?auto_4353 )
      ( MAKE-3PILE ?auto_4350 ?auto_4351 ?auto_4352 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4354 - BLOCK
      ?auto_4355 - BLOCK
      ?auto_4356 - BLOCK
    )
    :vars
    (
      ?auto_4357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4354 ?auto_4355 ) ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( not ( = ?auto_4355 ?auto_4356 ) ) ( ON-TABLE ?auto_4356 ) ( ON ?auto_4354 ?auto_4357 ) ( CLEAR ?auto_4354 ) ( not ( = ?auto_4354 ?auto_4357 ) ) ( not ( = ?auto_4355 ?auto_4357 ) ) ( not ( = ?auto_4356 ?auto_4357 ) ) ( HOLDING ?auto_4355 ) ( CLEAR ?auto_4356 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4356 ?auto_4355 )
      ( MAKE-3PILE ?auto_4354 ?auto_4355 ?auto_4356 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4358 - BLOCK
      ?auto_4359 - BLOCK
      ?auto_4360 - BLOCK
    )
    :vars
    (
      ?auto_4361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4358 ?auto_4359 ) ) ( not ( = ?auto_4358 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( ON-TABLE ?auto_4360 ) ( ON ?auto_4358 ?auto_4361 ) ( not ( = ?auto_4358 ?auto_4361 ) ) ( not ( = ?auto_4359 ?auto_4361 ) ) ( not ( = ?auto_4360 ?auto_4361 ) ) ( CLEAR ?auto_4360 ) ( ON ?auto_4359 ?auto_4358 ) ( CLEAR ?auto_4359 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4361 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4361 ?auto_4358 )
      ( MAKE-3PILE ?auto_4358 ?auto_4359 ?auto_4360 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4362 - BLOCK
      ?auto_4363 - BLOCK
      ?auto_4364 - BLOCK
    )
    :vars
    (
      ?auto_4365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( ON ?auto_4362 ?auto_4365 ) ( not ( = ?auto_4362 ?auto_4365 ) ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( ON ?auto_4363 ?auto_4362 ) ( CLEAR ?auto_4363 ) ( ON-TABLE ?auto_4365 ) ( HOLDING ?auto_4364 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4364 )
      ( MAKE-3PILE ?auto_4362 ?auto_4363 ?auto_4364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4366 - BLOCK
      ?auto_4367 - BLOCK
      ?auto_4368 - BLOCK
    )
    :vars
    (
      ?auto_4369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4366 ?auto_4367 ) ) ( not ( = ?auto_4366 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( ON ?auto_4366 ?auto_4369 ) ( not ( = ?auto_4366 ?auto_4369 ) ) ( not ( = ?auto_4367 ?auto_4369 ) ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( ON ?auto_4367 ?auto_4366 ) ( ON-TABLE ?auto_4369 ) ( ON ?auto_4368 ?auto_4367 ) ( CLEAR ?auto_4368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4369 ?auto_4366 ?auto_4367 )
      ( MAKE-3PILE ?auto_4366 ?auto_4367 ?auto_4368 ) )
  )

)

