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
      ?auto_4147 - BLOCK
      ?auto_4148 - BLOCK
      ?auto_4149 - BLOCK
    )
    :vars
    (
      ?auto_4150 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4150 ?auto_4149 ) ( CLEAR ?auto_4150 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4147 ) ( ON ?auto_4148 ?auto_4147 ) ( ON ?auto_4149 ?auto_4148 ) ( not ( = ?auto_4147 ?auto_4148 ) ) ( not ( = ?auto_4147 ?auto_4149 ) ) ( not ( = ?auto_4147 ?auto_4150 ) ) ( not ( = ?auto_4148 ?auto_4149 ) ) ( not ( = ?auto_4148 ?auto_4150 ) ) ( not ( = ?auto_4149 ?auto_4150 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4150 ?auto_4149 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4152 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4152 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4152 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4153 - BLOCK
    )
    :vars
    (
      ?auto_4154 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4153 ?auto_4154 ) ( CLEAR ?auto_4153 ) ( HAND-EMPTY ) ( not ( = ?auto_4153 ?auto_4154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4153 ?auto_4154 )
      ( MAKE-1PILE ?auto_4153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4157 - BLOCK
      ?auto_4158 - BLOCK
    )
    :vars
    (
      ?auto_4159 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4159 ?auto_4158 ) ( CLEAR ?auto_4159 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4157 ) ( ON ?auto_4158 ?auto_4157 ) ( not ( = ?auto_4157 ?auto_4158 ) ) ( not ( = ?auto_4157 ?auto_4159 ) ) ( not ( = ?auto_4158 ?auto_4159 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4159 ?auto_4158 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4160 - BLOCK
      ?auto_4161 - BLOCK
    )
    :vars
    (
      ?auto_4162 - BLOCK
      ?auto_4163 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4162 ?auto_4161 ) ( CLEAR ?auto_4162 ) ( ON-TABLE ?auto_4160 ) ( ON ?auto_4161 ?auto_4160 ) ( not ( = ?auto_4160 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4162 ) ) ( not ( = ?auto_4161 ?auto_4162 ) ) ( HOLDING ?auto_4163 ) ( not ( = ?auto_4160 ?auto_4163 ) ) ( not ( = ?auto_4161 ?auto_4163 ) ) ( not ( = ?auto_4162 ?auto_4163 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4163 )
      ( MAKE-2PILE ?auto_4160 ?auto_4161 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4164 - BLOCK
      ?auto_4165 - BLOCK
    )
    :vars
    (
      ?auto_4166 - BLOCK
      ?auto_4167 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4166 ?auto_4165 ) ( ON-TABLE ?auto_4164 ) ( ON ?auto_4165 ?auto_4164 ) ( not ( = ?auto_4164 ?auto_4165 ) ) ( not ( = ?auto_4164 ?auto_4166 ) ) ( not ( = ?auto_4165 ?auto_4166 ) ) ( not ( = ?auto_4164 ?auto_4167 ) ) ( not ( = ?auto_4165 ?auto_4167 ) ) ( not ( = ?auto_4166 ?auto_4167 ) ) ( ON ?auto_4167 ?auto_4166 ) ( CLEAR ?auto_4167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4164 ?auto_4165 ?auto_4166 )
      ( MAKE-2PILE ?auto_4164 ?auto_4165 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4170 - BLOCK
      ?auto_4171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4171 ) ( CLEAR ?auto_4170 ) ( ON-TABLE ?auto_4170 ) ( not ( = ?auto_4170 ?auto_4171 ) ) )
    :subtasks
    ( ( !STACK ?auto_4171 ?auto_4170 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4172 - BLOCK
      ?auto_4173 - BLOCK
    )
    :vars
    (
      ?auto_4174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4172 ) ( ON-TABLE ?auto_4172 ) ( not ( = ?auto_4172 ?auto_4173 ) ) ( ON ?auto_4173 ?auto_4174 ) ( CLEAR ?auto_4173 ) ( HAND-EMPTY ) ( not ( = ?auto_4172 ?auto_4174 ) ) ( not ( = ?auto_4173 ?auto_4174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4173 ?auto_4174 )
      ( MAKE-2PILE ?auto_4172 ?auto_4173 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4175 - BLOCK
      ?auto_4176 - BLOCK
    )
    :vars
    (
      ?auto_4177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4175 ?auto_4176 ) ) ( ON ?auto_4176 ?auto_4177 ) ( CLEAR ?auto_4176 ) ( not ( = ?auto_4175 ?auto_4177 ) ) ( not ( = ?auto_4176 ?auto_4177 ) ) ( HOLDING ?auto_4175 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4175 )
      ( MAKE-2PILE ?auto_4175 ?auto_4176 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4178 - BLOCK
      ?auto_4179 - BLOCK
    )
    :vars
    (
      ?auto_4180 - BLOCK
      ?auto_4181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4178 ?auto_4179 ) ) ( ON ?auto_4179 ?auto_4180 ) ( not ( = ?auto_4178 ?auto_4180 ) ) ( not ( = ?auto_4179 ?auto_4180 ) ) ( ON ?auto_4178 ?auto_4179 ) ( CLEAR ?auto_4178 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4181 ) ( ON ?auto_4180 ?auto_4181 ) ( not ( = ?auto_4181 ?auto_4180 ) ) ( not ( = ?auto_4181 ?auto_4179 ) ) ( not ( = ?auto_4181 ?auto_4178 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4181 ?auto_4180 ?auto_4179 )
      ( MAKE-2PILE ?auto_4178 ?auto_4179 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4183 - BLOCK
    )
    :vars
    (
      ?auto_4184 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4184 ?auto_4183 ) ( CLEAR ?auto_4184 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4183 ) ( not ( = ?auto_4183 ?auto_4184 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4184 ?auto_4183 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4185 - BLOCK
    )
    :vars
    (
      ?auto_4186 - BLOCK
      ?auto_4187 - BLOCK
      ?auto_4188 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4186 ?auto_4185 ) ( CLEAR ?auto_4186 ) ( ON-TABLE ?auto_4185 ) ( not ( = ?auto_4185 ?auto_4186 ) ) ( HOLDING ?auto_4187 ) ( CLEAR ?auto_4188 ) ( not ( = ?auto_4185 ?auto_4187 ) ) ( not ( = ?auto_4185 ?auto_4188 ) ) ( not ( = ?auto_4186 ?auto_4187 ) ) ( not ( = ?auto_4186 ?auto_4188 ) ) ( not ( = ?auto_4187 ?auto_4188 ) ) )
    :subtasks
    ( ( !STACK ?auto_4187 ?auto_4188 )
      ( MAKE-1PILE ?auto_4185 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4275 - BLOCK
    )
    :vars
    (
      ?auto_4276 - BLOCK
      ?auto_4277 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4276 ?auto_4275 ) ( ON-TABLE ?auto_4275 ) ( not ( = ?auto_4275 ?auto_4276 ) ) ( not ( = ?auto_4275 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( ON ?auto_4277 ?auto_4276 ) ( CLEAR ?auto_4277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4275 ?auto_4276 )
      ( MAKE-1PILE ?auto_4275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4193 - BLOCK
    )
    :vars
    (
      ?auto_4196 - BLOCK
      ?auto_4194 - BLOCK
      ?auto_4195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4196 ?auto_4193 ) ( ON-TABLE ?auto_4193 ) ( not ( = ?auto_4193 ?auto_4196 ) ) ( not ( = ?auto_4193 ?auto_4194 ) ) ( not ( = ?auto_4193 ?auto_4195 ) ) ( not ( = ?auto_4196 ?auto_4194 ) ) ( not ( = ?auto_4196 ?auto_4195 ) ) ( not ( = ?auto_4194 ?auto_4195 ) ) ( ON ?auto_4194 ?auto_4196 ) ( CLEAR ?auto_4194 ) ( HOLDING ?auto_4195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4195 )
      ( MAKE-1PILE ?auto_4193 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4197 - BLOCK
    )
    :vars
    (
      ?auto_4198 - BLOCK
      ?auto_4199 - BLOCK
      ?auto_4200 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4198 ?auto_4197 ) ( ON-TABLE ?auto_4197 ) ( not ( = ?auto_4197 ?auto_4198 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4200 ) ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4200 ) ) ( not ( = ?auto_4199 ?auto_4200 ) ) ( ON ?auto_4199 ?auto_4198 ) ( ON ?auto_4200 ?auto_4199 ) ( CLEAR ?auto_4200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4197 ?auto_4198 ?auto_4199 )
      ( MAKE-1PILE ?auto_4197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4204 - BLOCK
      ?auto_4205 - BLOCK
      ?auto_4206 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_4206 ) ( CLEAR ?auto_4205 ) ( ON-TABLE ?auto_4204 ) ( ON ?auto_4205 ?auto_4204 ) ( not ( = ?auto_4204 ?auto_4205 ) ) ( not ( = ?auto_4204 ?auto_4206 ) ) ( not ( = ?auto_4205 ?auto_4206 ) ) )
    :subtasks
    ( ( !STACK ?auto_4206 ?auto_4205 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4207 - BLOCK
      ?auto_4208 - BLOCK
      ?auto_4209 - BLOCK
    )
    :vars
    (
      ?auto_4210 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4208 ) ( ON-TABLE ?auto_4207 ) ( ON ?auto_4208 ?auto_4207 ) ( not ( = ?auto_4207 ?auto_4208 ) ) ( not ( = ?auto_4207 ?auto_4209 ) ) ( not ( = ?auto_4208 ?auto_4209 ) ) ( ON ?auto_4209 ?auto_4210 ) ( CLEAR ?auto_4209 ) ( HAND-EMPTY ) ( not ( = ?auto_4207 ?auto_4210 ) ) ( not ( = ?auto_4208 ?auto_4210 ) ) ( not ( = ?auto_4209 ?auto_4210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4209 ?auto_4210 )
      ( MAKE-3PILE ?auto_4207 ?auto_4208 ?auto_4209 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4211 - BLOCK
      ?auto_4212 - BLOCK
      ?auto_4213 - BLOCK
    )
    :vars
    (
      ?auto_4214 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4211 ) ( not ( = ?auto_4211 ?auto_4212 ) ) ( not ( = ?auto_4211 ?auto_4213 ) ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( ON ?auto_4213 ?auto_4214 ) ( CLEAR ?auto_4213 ) ( not ( = ?auto_4211 ?auto_4214 ) ) ( not ( = ?auto_4212 ?auto_4214 ) ) ( not ( = ?auto_4213 ?auto_4214 ) ) ( HOLDING ?auto_4212 ) ( CLEAR ?auto_4211 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4211 ?auto_4212 )
      ( MAKE-3PILE ?auto_4211 ?auto_4212 ?auto_4213 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4215 - BLOCK
      ?auto_4216 - BLOCK
      ?auto_4217 - BLOCK
    )
    :vars
    (
      ?auto_4218 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4215 ) ( not ( = ?auto_4215 ?auto_4216 ) ) ( not ( = ?auto_4215 ?auto_4217 ) ) ( not ( = ?auto_4216 ?auto_4217 ) ) ( ON ?auto_4217 ?auto_4218 ) ( not ( = ?auto_4215 ?auto_4218 ) ) ( not ( = ?auto_4216 ?auto_4218 ) ) ( not ( = ?auto_4217 ?auto_4218 ) ) ( CLEAR ?auto_4215 ) ( ON ?auto_4216 ?auto_4217 ) ( CLEAR ?auto_4216 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4218 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4218 ?auto_4217 )
      ( MAKE-3PILE ?auto_4215 ?auto_4216 ?auto_4217 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4219 - BLOCK
      ?auto_4220 - BLOCK
      ?auto_4221 - BLOCK
    )
    :vars
    (
      ?auto_4222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( ON ?auto_4221 ?auto_4222 ) ( not ( = ?auto_4219 ?auto_4222 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( ON ?auto_4220 ?auto_4221 ) ( CLEAR ?auto_4220 ) ( ON-TABLE ?auto_4222 ) ( HOLDING ?auto_4219 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4219 )
      ( MAKE-3PILE ?auto_4219 ?auto_4220 ?auto_4221 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4223 - BLOCK
      ?auto_4224 - BLOCK
      ?auto_4225 - BLOCK
    )
    :vars
    (
      ?auto_4226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4223 ?auto_4225 ) ) ( not ( = ?auto_4224 ?auto_4225 ) ) ( ON ?auto_4225 ?auto_4226 ) ( not ( = ?auto_4223 ?auto_4226 ) ) ( not ( = ?auto_4224 ?auto_4226 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( ON ?auto_4224 ?auto_4225 ) ( ON-TABLE ?auto_4226 ) ( ON ?auto_4223 ?auto_4224 ) ( CLEAR ?auto_4223 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4226 ?auto_4225 ?auto_4224 )
      ( MAKE-3PILE ?auto_4223 ?auto_4224 ?auto_4225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4253 - BLOCK
    )
    :vars
    (
      ?auto_4254 - BLOCK
      ?auto_4255 - BLOCK
      ?auto_4256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4253 ?auto_4254 ) ( CLEAR ?auto_4253 ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( HOLDING ?auto_4255 ) ( CLEAR ?auto_4256 ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4256 ) ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4254 ?auto_4256 ) ) ( not ( = ?auto_4255 ?auto_4256 ) ) )
    :subtasks
    ( ( !STACK ?auto_4255 ?auto_4256 )
      ( MAKE-1PILE ?auto_4253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4257 - BLOCK
    )
    :vars
    (
      ?auto_4260 - BLOCK
      ?auto_4258 - BLOCK
      ?auto_4259 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4257 ?auto_4260 ) ( not ( = ?auto_4257 ?auto_4260 ) ) ( CLEAR ?auto_4258 ) ( not ( = ?auto_4257 ?auto_4259 ) ) ( not ( = ?auto_4257 ?auto_4258 ) ) ( not ( = ?auto_4260 ?auto_4259 ) ) ( not ( = ?auto_4260 ?auto_4258 ) ) ( not ( = ?auto_4259 ?auto_4258 ) ) ( ON ?auto_4259 ?auto_4257 ) ( CLEAR ?auto_4259 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4260 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4260 ?auto_4257 )
      ( MAKE-1PILE ?auto_4257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4261 - BLOCK
    )
    :vars
    (
      ?auto_4263 - BLOCK
      ?auto_4262 - BLOCK
      ?auto_4264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4261 ?auto_4263 ) ( not ( = ?auto_4261 ?auto_4263 ) ) ( not ( = ?auto_4261 ?auto_4262 ) ) ( not ( = ?auto_4261 ?auto_4264 ) ) ( not ( = ?auto_4263 ?auto_4262 ) ) ( not ( = ?auto_4263 ?auto_4264 ) ) ( not ( = ?auto_4262 ?auto_4264 ) ) ( ON ?auto_4262 ?auto_4261 ) ( CLEAR ?auto_4262 ) ( ON-TABLE ?auto_4263 ) ( HOLDING ?auto_4264 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4264 )
      ( MAKE-1PILE ?auto_4261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4265 - BLOCK
    )
    :vars
    (
      ?auto_4268 - BLOCK
      ?auto_4267 - BLOCK
      ?auto_4266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4265 ?auto_4268 ) ( not ( = ?auto_4265 ?auto_4268 ) ) ( not ( = ?auto_4265 ?auto_4267 ) ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( not ( = ?auto_4268 ?auto_4267 ) ) ( not ( = ?auto_4268 ?auto_4266 ) ) ( not ( = ?auto_4267 ?auto_4266 ) ) ( ON ?auto_4267 ?auto_4265 ) ( ON-TABLE ?auto_4268 ) ( ON ?auto_4266 ?auto_4267 ) ( CLEAR ?auto_4266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4268 ?auto_4265 ?auto_4267 )
      ( MAKE-1PILE ?auto_4265 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4272 - BLOCK
    )
    :vars
    (
      ?auto_4273 - BLOCK
      ?auto_4274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4273 ?auto_4272 ) ( CLEAR ?auto_4273 ) ( ON-TABLE ?auto_4272 ) ( not ( = ?auto_4272 ?auto_4273 ) ) ( HOLDING ?auto_4274 ) ( not ( = ?auto_4272 ?auto_4274 ) ) ( not ( = ?auto_4273 ?auto_4274 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_4274 )
      ( MAKE-1PILE ?auto_4272 ) )
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
    ( and ( not ( = ?auto_4297 ?auto_4298 ) ) ( ON ?auto_4298 ?auto_4299 ) ( not ( = ?auto_4297 ?auto_4299 ) ) ( not ( = ?auto_4298 ?auto_4299 ) ) ( ON ?auto_4297 ?auto_4298 ) ( CLEAR ?auto_4297 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4299 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4299 ?auto_4298 )
      ( MAKE-2PILE ?auto_4297 ?auto_4298 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4302 - BLOCK
      ?auto_4303 - BLOCK
    )
    :vars
    (
      ?auto_4304 - BLOCK
      ?auto_4305 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4302 ?auto_4303 ) ) ( ON ?auto_4303 ?auto_4304 ) ( CLEAR ?auto_4303 ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4304 ) ) ( ON ?auto_4302 ?auto_4305 ) ( CLEAR ?auto_4302 ) ( HAND-EMPTY ) ( not ( = ?auto_4302 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4304 ?auto_4305 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4302 ?auto_4305 )
      ( MAKE-2PILE ?auto_4302 ?auto_4303 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_4306 - BLOCK
      ?auto_4307 - BLOCK
    )
    :vars
    (
      ?auto_4309 - BLOCK
      ?auto_4308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4306 ?auto_4307 ) ) ( not ( = ?auto_4306 ?auto_4309 ) ) ( not ( = ?auto_4307 ?auto_4309 ) ) ( ON ?auto_4306 ?auto_4308 ) ( CLEAR ?auto_4306 ) ( not ( = ?auto_4306 ?auto_4308 ) ) ( not ( = ?auto_4307 ?auto_4308 ) ) ( not ( = ?auto_4309 ?auto_4308 ) ) ( HOLDING ?auto_4307 ) ( CLEAR ?auto_4309 ) ( ON-TABLE ?auto_4309 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4309 ?auto_4307 )
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
      ?auto_4312 - BLOCK
      ?auto_4313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( ON ?auto_4310 ?auto_4313 ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( CLEAR ?auto_4312 ) ( ON-TABLE ?auto_4312 ) ( ON ?auto_4311 ?auto_4310 ) ( CLEAR ?auto_4311 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4313 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4313 ?auto_4310 )
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
    ( and ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4317 ) ) ( not ( = ?auto_4315 ?auto_4317 ) ) ( ON ?auto_4314 ?auto_4316 ) ( not ( = ?auto_4314 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4317 ?auto_4316 ) ) ( ON ?auto_4315 ?auto_4314 ) ( CLEAR ?auto_4315 ) ( ON-TABLE ?auto_4316 ) ( HOLDING ?auto_4317 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4317 )
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
      ?auto_4321 - BLOCK
      ?auto_4320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4318 ?auto_4319 ) ) ( not ( = ?auto_4318 ?auto_4321 ) ) ( not ( = ?auto_4319 ?auto_4321 ) ) ( ON ?auto_4318 ?auto_4320 ) ( not ( = ?auto_4318 ?auto_4320 ) ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( not ( = ?auto_4321 ?auto_4320 ) ) ( ON ?auto_4319 ?auto_4318 ) ( ON-TABLE ?auto_4320 ) ( ON ?auto_4321 ?auto_4319 ) ( CLEAR ?auto_4321 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4320 ?auto_4318 ?auto_4319 )
      ( MAKE-2PILE ?auto_4318 ?auto_4319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4328 - BLOCK
      ?auto_4329 - BLOCK
      ?auto_4330 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_4329 ) ( ON-TABLE ?auto_4328 ) ( ON ?auto_4329 ?auto_4328 ) ( not ( = ?auto_4328 ?auto_4329 ) ) ( not ( = ?auto_4328 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( ON-TABLE ?auto_4330 ) ( CLEAR ?auto_4330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_4330 )
      ( MAKE-3PILE ?auto_4328 ?auto_4329 ?auto_4330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4331 - BLOCK
      ?auto_4332 - BLOCK
      ?auto_4333 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4331 ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( ON-TABLE ?auto_4333 ) ( CLEAR ?auto_4333 ) ( HOLDING ?auto_4332 ) ( CLEAR ?auto_4331 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4331 ?auto_4332 )
      ( MAKE-3PILE ?auto_4331 ?auto_4332 ?auto_4333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4334 - BLOCK
      ?auto_4335 - BLOCK
      ?auto_4336 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_4334 ) ( not ( = ?auto_4334 ?auto_4335 ) ) ( not ( = ?auto_4334 ?auto_4336 ) ) ( not ( = ?auto_4335 ?auto_4336 ) ) ( ON-TABLE ?auto_4336 ) ( CLEAR ?auto_4334 ) ( ON ?auto_4335 ?auto_4336 ) ( CLEAR ?auto_4335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4336 )
      ( MAKE-3PILE ?auto_4334 ?auto_4335 ?auto_4336 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4337 - BLOCK
      ?auto_4338 - BLOCK
      ?auto_4339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4337 ?auto_4338 ) ) ( not ( = ?auto_4337 ?auto_4339 ) ) ( not ( = ?auto_4338 ?auto_4339 ) ) ( ON-TABLE ?auto_4339 ) ( ON ?auto_4338 ?auto_4339 ) ( CLEAR ?auto_4338 ) ( HOLDING ?auto_4337 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4337 )
      ( MAKE-3PILE ?auto_4337 ?auto_4338 ?auto_4339 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4340 - BLOCK
      ?auto_4341 - BLOCK
      ?auto_4342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4340 ?auto_4341 ) ) ( not ( = ?auto_4340 ?auto_4342 ) ) ( not ( = ?auto_4341 ?auto_4342 ) ) ( ON-TABLE ?auto_4342 ) ( ON ?auto_4341 ?auto_4342 ) ( ON ?auto_4340 ?auto_4341 ) ( CLEAR ?auto_4340 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4342 ?auto_4341 )
      ( MAKE-3PILE ?auto_4340 ?auto_4341 ?auto_4342 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_4346 - BLOCK
      ?auto_4347 - BLOCK
      ?auto_4348 - BLOCK
    )
    :vars
    (
      ?auto_4349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_4346 ?auto_4347 ) ) ( not ( = ?auto_4346 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( ON-TABLE ?auto_4348 ) ( ON ?auto_4347 ?auto_4348 ) ( CLEAR ?auto_4347 ) ( ON ?auto_4346 ?auto_4349 ) ( CLEAR ?auto_4346 ) ( HAND-EMPTY ) ( not ( = ?auto_4346 ?auto_4349 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4346 ?auto_4349 )
      ( MAKE-3PILE ?auto_4346 ?auto_4347 ?auto_4348 ) )
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
    ( and ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4350 ?auto_4352 ) ) ( not ( = ?auto_4351 ?auto_4352 ) ) ( ON-TABLE ?auto_4352 ) ( ON ?auto_4350 ?auto_4353 ) ( CLEAR ?auto_4350 ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( not ( = ?auto_4351 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( HOLDING ?auto_4351 ) ( CLEAR ?auto_4352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4352 ?auto_4351 )
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
    ( and ( not ( = ?auto_4354 ?auto_4355 ) ) ( not ( = ?auto_4354 ?auto_4356 ) ) ( not ( = ?auto_4355 ?auto_4356 ) ) ( ON-TABLE ?auto_4356 ) ( ON ?auto_4354 ?auto_4357 ) ( not ( = ?auto_4354 ?auto_4357 ) ) ( not ( = ?auto_4355 ?auto_4357 ) ) ( not ( = ?auto_4356 ?auto_4357 ) ) ( CLEAR ?auto_4356 ) ( ON ?auto_4355 ?auto_4354 ) ( CLEAR ?auto_4355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_4357 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_4357 ?auto_4354 )
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
    ( and ( not ( = ?auto_4358 ?auto_4359 ) ) ( not ( = ?auto_4358 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( ON ?auto_4358 ?auto_4361 ) ( not ( = ?auto_4358 ?auto_4361 ) ) ( not ( = ?auto_4359 ?auto_4361 ) ) ( not ( = ?auto_4360 ?auto_4361 ) ) ( ON ?auto_4359 ?auto_4358 ) ( CLEAR ?auto_4359 ) ( ON-TABLE ?auto_4361 ) ( HOLDING ?auto_4360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_4360 )
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
    ( and ( not ( = ?auto_4362 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( ON ?auto_4362 ?auto_4365 ) ( not ( = ?auto_4362 ?auto_4365 ) ) ( not ( = ?auto_4363 ?auto_4365 ) ) ( not ( = ?auto_4364 ?auto_4365 ) ) ( ON ?auto_4363 ?auto_4362 ) ( ON-TABLE ?auto_4365 ) ( ON ?auto_4364 ?auto_4363 ) ( CLEAR ?auto_4364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_4365 ?auto_4362 ?auto_4363 )
      ( MAKE-3PILE ?auto_4362 ?auto_4363 ?auto_4364 ) )
  )

)

