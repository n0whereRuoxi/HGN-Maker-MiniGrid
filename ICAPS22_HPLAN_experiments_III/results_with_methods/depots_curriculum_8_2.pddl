( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4174 - SURFACE
      ?auto_4175 - SURFACE
    )
    :vars
    (
      ?auto_4176 - HOIST
      ?auto_4177 - PLACE
      ?auto_4179 - PLACE
      ?auto_4180 - HOIST
      ?auto_4181 - SURFACE
      ?auto_4178 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4176 ?auto_4177 ) ( SURFACE-AT ?auto_4174 ?auto_4177 ) ( CLEAR ?auto_4174 ) ( IS-CRATE ?auto_4175 ) ( AVAILABLE ?auto_4176 ) ( not ( = ?auto_4179 ?auto_4177 ) ) ( HOIST-AT ?auto_4180 ?auto_4179 ) ( AVAILABLE ?auto_4180 ) ( SURFACE-AT ?auto_4175 ?auto_4179 ) ( ON ?auto_4175 ?auto_4181 ) ( CLEAR ?auto_4175 ) ( TRUCK-AT ?auto_4178 ?auto_4177 ) ( not ( = ?auto_4174 ?auto_4175 ) ) ( not ( = ?auto_4174 ?auto_4181 ) ) ( not ( = ?auto_4175 ?auto_4181 ) ) ( not ( = ?auto_4176 ?auto_4180 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4178 ?auto_4177 ?auto_4179 )
      ( !LIFT ?auto_4180 ?auto_4175 ?auto_4181 ?auto_4179 )
      ( !LOAD ?auto_4180 ?auto_4175 ?auto_4178 ?auto_4179 )
      ( !DRIVE ?auto_4178 ?auto_4179 ?auto_4177 )
      ( !UNLOAD ?auto_4176 ?auto_4175 ?auto_4178 ?auto_4177 )
      ( !DROP ?auto_4176 ?auto_4175 ?auto_4174 ?auto_4177 )
      ( MAKE-1CRATE-VERIFY ?auto_4174 ?auto_4175 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4184 - SURFACE
      ?auto_4185 - SURFACE
    )
    :vars
    (
      ?auto_4186 - HOIST
      ?auto_4187 - PLACE
      ?auto_4189 - PLACE
      ?auto_4190 - HOIST
      ?auto_4191 - SURFACE
      ?auto_4188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4186 ?auto_4187 ) ( SURFACE-AT ?auto_4184 ?auto_4187 ) ( CLEAR ?auto_4184 ) ( IS-CRATE ?auto_4185 ) ( AVAILABLE ?auto_4186 ) ( not ( = ?auto_4189 ?auto_4187 ) ) ( HOIST-AT ?auto_4190 ?auto_4189 ) ( AVAILABLE ?auto_4190 ) ( SURFACE-AT ?auto_4185 ?auto_4189 ) ( ON ?auto_4185 ?auto_4191 ) ( CLEAR ?auto_4185 ) ( TRUCK-AT ?auto_4188 ?auto_4187 ) ( not ( = ?auto_4184 ?auto_4185 ) ) ( not ( = ?auto_4184 ?auto_4191 ) ) ( not ( = ?auto_4185 ?auto_4191 ) ) ( not ( = ?auto_4186 ?auto_4190 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4188 ?auto_4187 ?auto_4189 )
      ( !LIFT ?auto_4190 ?auto_4185 ?auto_4191 ?auto_4189 )
      ( !LOAD ?auto_4190 ?auto_4185 ?auto_4188 ?auto_4189 )
      ( !DRIVE ?auto_4188 ?auto_4189 ?auto_4187 )
      ( !UNLOAD ?auto_4186 ?auto_4185 ?auto_4188 ?auto_4187 )
      ( !DROP ?auto_4186 ?auto_4185 ?auto_4184 ?auto_4187 )
      ( MAKE-1CRATE-VERIFY ?auto_4184 ?auto_4185 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4195 - SURFACE
      ?auto_4196 - SURFACE
      ?auto_4197 - SURFACE
    )
    :vars
    (
      ?auto_4201 - HOIST
      ?auto_4200 - PLACE
      ?auto_4199 - PLACE
      ?auto_4198 - HOIST
      ?auto_4203 - SURFACE
      ?auto_4205 - PLACE
      ?auto_4206 - HOIST
      ?auto_4204 - SURFACE
      ?auto_4202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4201 ?auto_4200 ) ( IS-CRATE ?auto_4197 ) ( not ( = ?auto_4199 ?auto_4200 ) ) ( HOIST-AT ?auto_4198 ?auto_4199 ) ( AVAILABLE ?auto_4198 ) ( SURFACE-AT ?auto_4197 ?auto_4199 ) ( ON ?auto_4197 ?auto_4203 ) ( CLEAR ?auto_4197 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4203 ) ) ( not ( = ?auto_4197 ?auto_4203 ) ) ( not ( = ?auto_4201 ?auto_4198 ) ) ( SURFACE-AT ?auto_4195 ?auto_4200 ) ( CLEAR ?auto_4195 ) ( IS-CRATE ?auto_4196 ) ( AVAILABLE ?auto_4201 ) ( not ( = ?auto_4205 ?auto_4200 ) ) ( HOIST-AT ?auto_4206 ?auto_4205 ) ( AVAILABLE ?auto_4206 ) ( SURFACE-AT ?auto_4196 ?auto_4205 ) ( ON ?auto_4196 ?auto_4204 ) ( CLEAR ?auto_4196 ) ( TRUCK-AT ?auto_4202 ?auto_4200 ) ( not ( = ?auto_4195 ?auto_4196 ) ) ( not ( = ?auto_4195 ?auto_4204 ) ) ( not ( = ?auto_4196 ?auto_4204 ) ) ( not ( = ?auto_4201 ?auto_4206 ) ) ( not ( = ?auto_4195 ?auto_4197 ) ) ( not ( = ?auto_4195 ?auto_4203 ) ) ( not ( = ?auto_4197 ?auto_4204 ) ) ( not ( = ?auto_4199 ?auto_4205 ) ) ( not ( = ?auto_4198 ?auto_4206 ) ) ( not ( = ?auto_4203 ?auto_4204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4195 ?auto_4196 )
      ( MAKE-1CRATE ?auto_4196 ?auto_4197 )
      ( MAKE-2CRATE-VERIFY ?auto_4195 ?auto_4196 ?auto_4197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4209 - SURFACE
      ?auto_4210 - SURFACE
    )
    :vars
    (
      ?auto_4211 - HOIST
      ?auto_4212 - PLACE
      ?auto_4214 - PLACE
      ?auto_4215 - HOIST
      ?auto_4216 - SURFACE
      ?auto_4213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4211 ?auto_4212 ) ( SURFACE-AT ?auto_4209 ?auto_4212 ) ( CLEAR ?auto_4209 ) ( IS-CRATE ?auto_4210 ) ( AVAILABLE ?auto_4211 ) ( not ( = ?auto_4214 ?auto_4212 ) ) ( HOIST-AT ?auto_4215 ?auto_4214 ) ( AVAILABLE ?auto_4215 ) ( SURFACE-AT ?auto_4210 ?auto_4214 ) ( ON ?auto_4210 ?auto_4216 ) ( CLEAR ?auto_4210 ) ( TRUCK-AT ?auto_4213 ?auto_4212 ) ( not ( = ?auto_4209 ?auto_4210 ) ) ( not ( = ?auto_4209 ?auto_4216 ) ) ( not ( = ?auto_4210 ?auto_4216 ) ) ( not ( = ?auto_4211 ?auto_4215 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4213 ?auto_4212 ?auto_4214 )
      ( !LIFT ?auto_4215 ?auto_4210 ?auto_4216 ?auto_4214 )
      ( !LOAD ?auto_4215 ?auto_4210 ?auto_4213 ?auto_4214 )
      ( !DRIVE ?auto_4213 ?auto_4214 ?auto_4212 )
      ( !UNLOAD ?auto_4211 ?auto_4210 ?auto_4213 ?auto_4212 )
      ( !DROP ?auto_4211 ?auto_4210 ?auto_4209 ?auto_4212 )
      ( MAKE-1CRATE-VERIFY ?auto_4209 ?auto_4210 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4221 - SURFACE
      ?auto_4222 - SURFACE
      ?auto_4223 - SURFACE
      ?auto_4224 - SURFACE
    )
    :vars
    (
      ?auto_4230 - HOIST
      ?auto_4225 - PLACE
      ?auto_4228 - PLACE
      ?auto_4227 - HOIST
      ?auto_4229 - SURFACE
      ?auto_4231 - PLACE
      ?auto_4233 - HOIST
      ?auto_4232 - SURFACE
      ?auto_4235 - PLACE
      ?auto_4236 - HOIST
      ?auto_4234 - SURFACE
      ?auto_4226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4230 ?auto_4225 ) ( IS-CRATE ?auto_4224 ) ( not ( = ?auto_4228 ?auto_4225 ) ) ( HOIST-AT ?auto_4227 ?auto_4228 ) ( AVAILABLE ?auto_4227 ) ( SURFACE-AT ?auto_4224 ?auto_4228 ) ( ON ?auto_4224 ?auto_4229 ) ( CLEAR ?auto_4224 ) ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4223 ?auto_4229 ) ) ( not ( = ?auto_4224 ?auto_4229 ) ) ( not ( = ?auto_4230 ?auto_4227 ) ) ( IS-CRATE ?auto_4223 ) ( not ( = ?auto_4231 ?auto_4225 ) ) ( HOIST-AT ?auto_4233 ?auto_4231 ) ( AVAILABLE ?auto_4233 ) ( SURFACE-AT ?auto_4223 ?auto_4231 ) ( ON ?auto_4223 ?auto_4232 ) ( CLEAR ?auto_4223 ) ( not ( = ?auto_4222 ?auto_4223 ) ) ( not ( = ?auto_4222 ?auto_4232 ) ) ( not ( = ?auto_4223 ?auto_4232 ) ) ( not ( = ?auto_4230 ?auto_4233 ) ) ( SURFACE-AT ?auto_4221 ?auto_4225 ) ( CLEAR ?auto_4221 ) ( IS-CRATE ?auto_4222 ) ( AVAILABLE ?auto_4230 ) ( not ( = ?auto_4235 ?auto_4225 ) ) ( HOIST-AT ?auto_4236 ?auto_4235 ) ( AVAILABLE ?auto_4236 ) ( SURFACE-AT ?auto_4222 ?auto_4235 ) ( ON ?auto_4222 ?auto_4234 ) ( CLEAR ?auto_4222 ) ( TRUCK-AT ?auto_4226 ?auto_4225 ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4234 ) ) ( not ( = ?auto_4222 ?auto_4234 ) ) ( not ( = ?auto_4230 ?auto_4236 ) ) ( not ( = ?auto_4221 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4232 ) ) ( not ( = ?auto_4223 ?auto_4234 ) ) ( not ( = ?auto_4231 ?auto_4235 ) ) ( not ( = ?auto_4233 ?auto_4236 ) ) ( not ( = ?auto_4232 ?auto_4234 ) ) ( not ( = ?auto_4221 ?auto_4224 ) ) ( not ( = ?auto_4221 ?auto_4229 ) ) ( not ( = ?auto_4222 ?auto_4224 ) ) ( not ( = ?auto_4222 ?auto_4229 ) ) ( not ( = ?auto_4224 ?auto_4232 ) ) ( not ( = ?auto_4224 ?auto_4234 ) ) ( not ( = ?auto_4228 ?auto_4231 ) ) ( not ( = ?auto_4228 ?auto_4235 ) ) ( not ( = ?auto_4227 ?auto_4233 ) ) ( not ( = ?auto_4227 ?auto_4236 ) ) ( not ( = ?auto_4229 ?auto_4232 ) ) ( not ( = ?auto_4229 ?auto_4234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4221 ?auto_4222 ?auto_4223 )
      ( MAKE-1CRATE ?auto_4223 ?auto_4224 )
      ( MAKE-3CRATE-VERIFY ?auto_4221 ?auto_4222 ?auto_4223 ?auto_4224 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4239 - SURFACE
      ?auto_4240 - SURFACE
    )
    :vars
    (
      ?auto_4241 - HOIST
      ?auto_4242 - PLACE
      ?auto_4244 - PLACE
      ?auto_4245 - HOIST
      ?auto_4246 - SURFACE
      ?auto_4243 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4241 ?auto_4242 ) ( SURFACE-AT ?auto_4239 ?auto_4242 ) ( CLEAR ?auto_4239 ) ( IS-CRATE ?auto_4240 ) ( AVAILABLE ?auto_4241 ) ( not ( = ?auto_4244 ?auto_4242 ) ) ( HOIST-AT ?auto_4245 ?auto_4244 ) ( AVAILABLE ?auto_4245 ) ( SURFACE-AT ?auto_4240 ?auto_4244 ) ( ON ?auto_4240 ?auto_4246 ) ( CLEAR ?auto_4240 ) ( TRUCK-AT ?auto_4243 ?auto_4242 ) ( not ( = ?auto_4239 ?auto_4240 ) ) ( not ( = ?auto_4239 ?auto_4246 ) ) ( not ( = ?auto_4240 ?auto_4246 ) ) ( not ( = ?auto_4241 ?auto_4245 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4243 ?auto_4242 ?auto_4244 )
      ( !LIFT ?auto_4245 ?auto_4240 ?auto_4246 ?auto_4244 )
      ( !LOAD ?auto_4245 ?auto_4240 ?auto_4243 ?auto_4244 )
      ( !DRIVE ?auto_4243 ?auto_4244 ?auto_4242 )
      ( !UNLOAD ?auto_4241 ?auto_4240 ?auto_4243 ?auto_4242 )
      ( !DROP ?auto_4241 ?auto_4240 ?auto_4239 ?auto_4242 )
      ( MAKE-1CRATE-VERIFY ?auto_4239 ?auto_4240 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4252 - SURFACE
      ?auto_4253 - SURFACE
      ?auto_4254 - SURFACE
      ?auto_4255 - SURFACE
      ?auto_4256 - SURFACE
    )
    :vars
    (
      ?auto_4258 - HOIST
      ?auto_4261 - PLACE
      ?auto_4262 - PLACE
      ?auto_4260 - HOIST
      ?auto_4259 - SURFACE
      ?auto_4264 - PLACE
      ?auto_4268 - HOIST
      ?auto_4265 - SURFACE
      ?auto_4270 - PLACE
      ?auto_4263 - HOIST
      ?auto_4266 - SURFACE
      ?auto_4267 - PLACE
      ?auto_4271 - HOIST
      ?auto_4269 - SURFACE
      ?auto_4257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4258 ?auto_4261 ) ( IS-CRATE ?auto_4256 ) ( not ( = ?auto_4262 ?auto_4261 ) ) ( HOIST-AT ?auto_4260 ?auto_4262 ) ( AVAILABLE ?auto_4260 ) ( SURFACE-AT ?auto_4256 ?auto_4262 ) ( ON ?auto_4256 ?auto_4259 ) ( CLEAR ?auto_4256 ) ( not ( = ?auto_4255 ?auto_4256 ) ) ( not ( = ?auto_4255 ?auto_4259 ) ) ( not ( = ?auto_4256 ?auto_4259 ) ) ( not ( = ?auto_4258 ?auto_4260 ) ) ( IS-CRATE ?auto_4255 ) ( not ( = ?auto_4264 ?auto_4261 ) ) ( HOIST-AT ?auto_4268 ?auto_4264 ) ( AVAILABLE ?auto_4268 ) ( SURFACE-AT ?auto_4255 ?auto_4264 ) ( ON ?auto_4255 ?auto_4265 ) ( CLEAR ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4254 ?auto_4265 ) ) ( not ( = ?auto_4255 ?auto_4265 ) ) ( not ( = ?auto_4258 ?auto_4268 ) ) ( IS-CRATE ?auto_4254 ) ( not ( = ?auto_4270 ?auto_4261 ) ) ( HOIST-AT ?auto_4263 ?auto_4270 ) ( AVAILABLE ?auto_4263 ) ( SURFACE-AT ?auto_4254 ?auto_4270 ) ( ON ?auto_4254 ?auto_4266 ) ( CLEAR ?auto_4254 ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4253 ?auto_4266 ) ) ( not ( = ?auto_4254 ?auto_4266 ) ) ( not ( = ?auto_4258 ?auto_4263 ) ) ( SURFACE-AT ?auto_4252 ?auto_4261 ) ( CLEAR ?auto_4252 ) ( IS-CRATE ?auto_4253 ) ( AVAILABLE ?auto_4258 ) ( not ( = ?auto_4267 ?auto_4261 ) ) ( HOIST-AT ?auto_4271 ?auto_4267 ) ( AVAILABLE ?auto_4271 ) ( SURFACE-AT ?auto_4253 ?auto_4267 ) ( ON ?auto_4253 ?auto_4269 ) ( CLEAR ?auto_4253 ) ( TRUCK-AT ?auto_4257 ?auto_4261 ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4269 ) ) ( not ( = ?auto_4253 ?auto_4269 ) ) ( not ( = ?auto_4258 ?auto_4271 ) ) ( not ( = ?auto_4252 ?auto_4254 ) ) ( not ( = ?auto_4252 ?auto_4266 ) ) ( not ( = ?auto_4254 ?auto_4269 ) ) ( not ( = ?auto_4270 ?auto_4267 ) ) ( not ( = ?auto_4263 ?auto_4271 ) ) ( not ( = ?auto_4266 ?auto_4269 ) ) ( not ( = ?auto_4252 ?auto_4255 ) ) ( not ( = ?auto_4252 ?auto_4265 ) ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4265 ) ) ( not ( = ?auto_4255 ?auto_4266 ) ) ( not ( = ?auto_4255 ?auto_4269 ) ) ( not ( = ?auto_4264 ?auto_4270 ) ) ( not ( = ?auto_4264 ?auto_4267 ) ) ( not ( = ?auto_4268 ?auto_4263 ) ) ( not ( = ?auto_4268 ?auto_4271 ) ) ( not ( = ?auto_4265 ?auto_4266 ) ) ( not ( = ?auto_4265 ?auto_4269 ) ) ( not ( = ?auto_4252 ?auto_4256 ) ) ( not ( = ?auto_4252 ?auto_4259 ) ) ( not ( = ?auto_4253 ?auto_4256 ) ) ( not ( = ?auto_4253 ?auto_4259 ) ) ( not ( = ?auto_4254 ?auto_4256 ) ) ( not ( = ?auto_4254 ?auto_4259 ) ) ( not ( = ?auto_4256 ?auto_4265 ) ) ( not ( = ?auto_4256 ?auto_4266 ) ) ( not ( = ?auto_4256 ?auto_4269 ) ) ( not ( = ?auto_4262 ?auto_4264 ) ) ( not ( = ?auto_4262 ?auto_4270 ) ) ( not ( = ?auto_4262 ?auto_4267 ) ) ( not ( = ?auto_4260 ?auto_4268 ) ) ( not ( = ?auto_4260 ?auto_4263 ) ) ( not ( = ?auto_4260 ?auto_4271 ) ) ( not ( = ?auto_4259 ?auto_4265 ) ) ( not ( = ?auto_4259 ?auto_4266 ) ) ( not ( = ?auto_4259 ?auto_4269 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4252 ?auto_4253 ?auto_4254 ?auto_4255 )
      ( MAKE-1CRATE ?auto_4255 ?auto_4256 )
      ( MAKE-4CRATE-VERIFY ?auto_4252 ?auto_4253 ?auto_4254 ?auto_4255 ?auto_4256 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4274 - SURFACE
      ?auto_4275 - SURFACE
    )
    :vars
    (
      ?auto_4276 - HOIST
      ?auto_4277 - PLACE
      ?auto_4279 - PLACE
      ?auto_4280 - HOIST
      ?auto_4281 - SURFACE
      ?auto_4278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4276 ?auto_4277 ) ( SURFACE-AT ?auto_4274 ?auto_4277 ) ( CLEAR ?auto_4274 ) ( IS-CRATE ?auto_4275 ) ( AVAILABLE ?auto_4276 ) ( not ( = ?auto_4279 ?auto_4277 ) ) ( HOIST-AT ?auto_4280 ?auto_4279 ) ( AVAILABLE ?auto_4280 ) ( SURFACE-AT ?auto_4275 ?auto_4279 ) ( ON ?auto_4275 ?auto_4281 ) ( CLEAR ?auto_4275 ) ( TRUCK-AT ?auto_4278 ?auto_4277 ) ( not ( = ?auto_4274 ?auto_4275 ) ) ( not ( = ?auto_4274 ?auto_4281 ) ) ( not ( = ?auto_4275 ?auto_4281 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4278 ?auto_4277 ?auto_4279 )
      ( !LIFT ?auto_4280 ?auto_4275 ?auto_4281 ?auto_4279 )
      ( !LOAD ?auto_4280 ?auto_4275 ?auto_4278 ?auto_4279 )
      ( !DRIVE ?auto_4278 ?auto_4279 ?auto_4277 )
      ( !UNLOAD ?auto_4276 ?auto_4275 ?auto_4278 ?auto_4277 )
      ( !DROP ?auto_4276 ?auto_4275 ?auto_4274 ?auto_4277 )
      ( MAKE-1CRATE-VERIFY ?auto_4274 ?auto_4275 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4288 - SURFACE
      ?auto_4289 - SURFACE
      ?auto_4290 - SURFACE
      ?auto_4291 - SURFACE
      ?auto_4292 - SURFACE
      ?auto_4293 - SURFACE
    )
    :vars
    (
      ?auto_4298 - HOIST
      ?auto_4294 - PLACE
      ?auto_4299 - PLACE
      ?auto_4297 - HOIST
      ?auto_4296 - SURFACE
      ?auto_4310 - PLACE
      ?auto_4307 - HOIST
      ?auto_4300 - SURFACE
      ?auto_4301 - PLACE
      ?auto_4311 - HOIST
      ?auto_4303 - SURFACE
      ?auto_4308 - PLACE
      ?auto_4302 - HOIST
      ?auto_4305 - SURFACE
      ?auto_4306 - PLACE
      ?auto_4304 - HOIST
      ?auto_4309 - SURFACE
      ?auto_4295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4298 ?auto_4294 ) ( IS-CRATE ?auto_4293 ) ( not ( = ?auto_4299 ?auto_4294 ) ) ( HOIST-AT ?auto_4297 ?auto_4299 ) ( AVAILABLE ?auto_4297 ) ( SURFACE-AT ?auto_4293 ?auto_4299 ) ( ON ?auto_4293 ?auto_4296 ) ( CLEAR ?auto_4293 ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4296 ) ) ( not ( = ?auto_4293 ?auto_4296 ) ) ( not ( = ?auto_4298 ?auto_4297 ) ) ( IS-CRATE ?auto_4292 ) ( not ( = ?auto_4310 ?auto_4294 ) ) ( HOIST-AT ?auto_4307 ?auto_4310 ) ( AVAILABLE ?auto_4307 ) ( SURFACE-AT ?auto_4292 ?auto_4310 ) ( ON ?auto_4292 ?auto_4300 ) ( CLEAR ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4300 ) ) ( not ( = ?auto_4292 ?auto_4300 ) ) ( not ( = ?auto_4298 ?auto_4307 ) ) ( IS-CRATE ?auto_4291 ) ( not ( = ?auto_4301 ?auto_4294 ) ) ( HOIST-AT ?auto_4311 ?auto_4301 ) ( AVAILABLE ?auto_4311 ) ( SURFACE-AT ?auto_4291 ?auto_4301 ) ( ON ?auto_4291 ?auto_4303 ) ( CLEAR ?auto_4291 ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4303 ) ) ( not ( = ?auto_4291 ?auto_4303 ) ) ( not ( = ?auto_4298 ?auto_4311 ) ) ( IS-CRATE ?auto_4290 ) ( not ( = ?auto_4308 ?auto_4294 ) ) ( HOIST-AT ?auto_4302 ?auto_4308 ) ( AVAILABLE ?auto_4302 ) ( SURFACE-AT ?auto_4290 ?auto_4308 ) ( ON ?auto_4290 ?auto_4305 ) ( CLEAR ?auto_4290 ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4305 ) ) ( not ( = ?auto_4290 ?auto_4305 ) ) ( not ( = ?auto_4298 ?auto_4302 ) ) ( SURFACE-AT ?auto_4288 ?auto_4294 ) ( CLEAR ?auto_4288 ) ( IS-CRATE ?auto_4289 ) ( AVAILABLE ?auto_4298 ) ( not ( = ?auto_4306 ?auto_4294 ) ) ( HOIST-AT ?auto_4304 ?auto_4306 ) ( AVAILABLE ?auto_4304 ) ( SURFACE-AT ?auto_4289 ?auto_4306 ) ( ON ?auto_4289 ?auto_4309 ) ( CLEAR ?auto_4289 ) ( TRUCK-AT ?auto_4295 ?auto_4294 ) ( not ( = ?auto_4288 ?auto_4289 ) ) ( not ( = ?auto_4288 ?auto_4309 ) ) ( not ( = ?auto_4289 ?auto_4309 ) ) ( not ( = ?auto_4298 ?auto_4304 ) ) ( not ( = ?auto_4288 ?auto_4290 ) ) ( not ( = ?auto_4288 ?auto_4305 ) ) ( not ( = ?auto_4290 ?auto_4309 ) ) ( not ( = ?auto_4308 ?auto_4306 ) ) ( not ( = ?auto_4302 ?auto_4304 ) ) ( not ( = ?auto_4305 ?auto_4309 ) ) ( not ( = ?auto_4288 ?auto_4291 ) ) ( not ( = ?auto_4288 ?auto_4303 ) ) ( not ( = ?auto_4289 ?auto_4291 ) ) ( not ( = ?auto_4289 ?auto_4303 ) ) ( not ( = ?auto_4291 ?auto_4305 ) ) ( not ( = ?auto_4291 ?auto_4309 ) ) ( not ( = ?auto_4301 ?auto_4308 ) ) ( not ( = ?auto_4301 ?auto_4306 ) ) ( not ( = ?auto_4311 ?auto_4302 ) ) ( not ( = ?auto_4311 ?auto_4304 ) ) ( not ( = ?auto_4303 ?auto_4305 ) ) ( not ( = ?auto_4303 ?auto_4309 ) ) ( not ( = ?auto_4288 ?auto_4292 ) ) ( not ( = ?auto_4288 ?auto_4300 ) ) ( not ( = ?auto_4289 ?auto_4292 ) ) ( not ( = ?auto_4289 ?auto_4300 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( not ( = ?auto_4290 ?auto_4300 ) ) ( not ( = ?auto_4292 ?auto_4303 ) ) ( not ( = ?auto_4292 ?auto_4305 ) ) ( not ( = ?auto_4292 ?auto_4309 ) ) ( not ( = ?auto_4310 ?auto_4301 ) ) ( not ( = ?auto_4310 ?auto_4308 ) ) ( not ( = ?auto_4310 ?auto_4306 ) ) ( not ( = ?auto_4307 ?auto_4311 ) ) ( not ( = ?auto_4307 ?auto_4302 ) ) ( not ( = ?auto_4307 ?auto_4304 ) ) ( not ( = ?auto_4300 ?auto_4303 ) ) ( not ( = ?auto_4300 ?auto_4305 ) ) ( not ( = ?auto_4300 ?auto_4309 ) ) ( not ( = ?auto_4288 ?auto_4293 ) ) ( not ( = ?auto_4288 ?auto_4296 ) ) ( not ( = ?auto_4289 ?auto_4293 ) ) ( not ( = ?auto_4289 ?auto_4296 ) ) ( not ( = ?auto_4290 ?auto_4293 ) ) ( not ( = ?auto_4290 ?auto_4296 ) ) ( not ( = ?auto_4291 ?auto_4293 ) ) ( not ( = ?auto_4291 ?auto_4296 ) ) ( not ( = ?auto_4293 ?auto_4300 ) ) ( not ( = ?auto_4293 ?auto_4303 ) ) ( not ( = ?auto_4293 ?auto_4305 ) ) ( not ( = ?auto_4293 ?auto_4309 ) ) ( not ( = ?auto_4299 ?auto_4310 ) ) ( not ( = ?auto_4299 ?auto_4301 ) ) ( not ( = ?auto_4299 ?auto_4308 ) ) ( not ( = ?auto_4299 ?auto_4306 ) ) ( not ( = ?auto_4297 ?auto_4307 ) ) ( not ( = ?auto_4297 ?auto_4311 ) ) ( not ( = ?auto_4297 ?auto_4302 ) ) ( not ( = ?auto_4297 ?auto_4304 ) ) ( not ( = ?auto_4296 ?auto_4300 ) ) ( not ( = ?auto_4296 ?auto_4303 ) ) ( not ( = ?auto_4296 ?auto_4305 ) ) ( not ( = ?auto_4296 ?auto_4309 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4288 ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 )
      ( MAKE-1CRATE ?auto_4292 ?auto_4293 )
      ( MAKE-5CRATE-VERIFY ?auto_4288 ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 ?auto_4293 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4314 - SURFACE
      ?auto_4315 - SURFACE
    )
    :vars
    (
      ?auto_4316 - HOIST
      ?auto_4317 - PLACE
      ?auto_4319 - PLACE
      ?auto_4320 - HOIST
      ?auto_4321 - SURFACE
      ?auto_4318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4316 ?auto_4317 ) ( SURFACE-AT ?auto_4314 ?auto_4317 ) ( CLEAR ?auto_4314 ) ( IS-CRATE ?auto_4315 ) ( AVAILABLE ?auto_4316 ) ( not ( = ?auto_4319 ?auto_4317 ) ) ( HOIST-AT ?auto_4320 ?auto_4319 ) ( AVAILABLE ?auto_4320 ) ( SURFACE-AT ?auto_4315 ?auto_4319 ) ( ON ?auto_4315 ?auto_4321 ) ( CLEAR ?auto_4315 ) ( TRUCK-AT ?auto_4318 ?auto_4317 ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4321 ) ) ( not ( = ?auto_4315 ?auto_4321 ) ) ( not ( = ?auto_4316 ?auto_4320 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4318 ?auto_4317 ?auto_4319 )
      ( !LIFT ?auto_4320 ?auto_4315 ?auto_4321 ?auto_4319 )
      ( !LOAD ?auto_4320 ?auto_4315 ?auto_4318 ?auto_4319 )
      ( !DRIVE ?auto_4318 ?auto_4319 ?auto_4317 )
      ( !UNLOAD ?auto_4316 ?auto_4315 ?auto_4318 ?auto_4317 )
      ( !DROP ?auto_4316 ?auto_4315 ?auto_4314 ?auto_4317 )
      ( MAKE-1CRATE-VERIFY ?auto_4314 ?auto_4315 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4329 - SURFACE
      ?auto_4330 - SURFACE
      ?auto_4331 - SURFACE
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
      ?auto_4334 - SURFACE
      ?auto_4335 - SURFACE
    )
    :vars
    (
      ?auto_4340 - HOIST
      ?auto_4339 - PLACE
      ?auto_4337 - PLACE
      ?auto_4338 - HOIST
      ?auto_4336 - SURFACE
      ?auto_4345 - PLACE
      ?auto_4344 - HOIST
      ?auto_4346 - SURFACE
      ?auto_4342 - PLACE
      ?auto_4353 - HOIST
      ?auto_4356 - SURFACE
      ?auto_4349 - PLACE
      ?auto_4343 - HOIST
      ?auto_4354 - SURFACE
      ?auto_4355 - PLACE
      ?auto_4348 - HOIST
      ?auto_4351 - SURFACE
      ?auto_4352 - PLACE
      ?auto_4347 - HOIST
      ?auto_4350 - SURFACE
      ?auto_4341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4340 ?auto_4339 ) ( IS-CRATE ?auto_4335 ) ( not ( = ?auto_4337 ?auto_4339 ) ) ( HOIST-AT ?auto_4338 ?auto_4337 ) ( AVAILABLE ?auto_4338 ) ( SURFACE-AT ?auto_4335 ?auto_4337 ) ( ON ?auto_4335 ?auto_4336 ) ( CLEAR ?auto_4335 ) ( not ( = ?auto_4334 ?auto_4335 ) ) ( not ( = ?auto_4334 ?auto_4336 ) ) ( not ( = ?auto_4335 ?auto_4336 ) ) ( not ( = ?auto_4340 ?auto_4338 ) ) ( IS-CRATE ?auto_4334 ) ( not ( = ?auto_4345 ?auto_4339 ) ) ( HOIST-AT ?auto_4344 ?auto_4345 ) ( AVAILABLE ?auto_4344 ) ( SURFACE-AT ?auto_4334 ?auto_4345 ) ( ON ?auto_4334 ?auto_4346 ) ( CLEAR ?auto_4334 ) ( not ( = ?auto_4333 ?auto_4334 ) ) ( not ( = ?auto_4333 ?auto_4346 ) ) ( not ( = ?auto_4334 ?auto_4346 ) ) ( not ( = ?auto_4340 ?auto_4344 ) ) ( IS-CRATE ?auto_4333 ) ( not ( = ?auto_4342 ?auto_4339 ) ) ( HOIST-AT ?auto_4353 ?auto_4342 ) ( AVAILABLE ?auto_4353 ) ( SURFACE-AT ?auto_4333 ?auto_4342 ) ( ON ?auto_4333 ?auto_4356 ) ( CLEAR ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4356 ) ) ( not ( = ?auto_4333 ?auto_4356 ) ) ( not ( = ?auto_4340 ?auto_4353 ) ) ( IS-CRATE ?auto_4332 ) ( not ( = ?auto_4349 ?auto_4339 ) ) ( HOIST-AT ?auto_4343 ?auto_4349 ) ( AVAILABLE ?auto_4343 ) ( SURFACE-AT ?auto_4332 ?auto_4349 ) ( ON ?auto_4332 ?auto_4354 ) ( CLEAR ?auto_4332 ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4354 ) ) ( not ( = ?auto_4332 ?auto_4354 ) ) ( not ( = ?auto_4340 ?auto_4343 ) ) ( IS-CRATE ?auto_4331 ) ( not ( = ?auto_4355 ?auto_4339 ) ) ( HOIST-AT ?auto_4348 ?auto_4355 ) ( AVAILABLE ?auto_4348 ) ( SURFACE-AT ?auto_4331 ?auto_4355 ) ( ON ?auto_4331 ?auto_4351 ) ( CLEAR ?auto_4331 ) ( not ( = ?auto_4330 ?auto_4331 ) ) ( not ( = ?auto_4330 ?auto_4351 ) ) ( not ( = ?auto_4331 ?auto_4351 ) ) ( not ( = ?auto_4340 ?auto_4348 ) ) ( SURFACE-AT ?auto_4329 ?auto_4339 ) ( CLEAR ?auto_4329 ) ( IS-CRATE ?auto_4330 ) ( AVAILABLE ?auto_4340 ) ( not ( = ?auto_4352 ?auto_4339 ) ) ( HOIST-AT ?auto_4347 ?auto_4352 ) ( AVAILABLE ?auto_4347 ) ( SURFACE-AT ?auto_4330 ?auto_4352 ) ( ON ?auto_4330 ?auto_4350 ) ( CLEAR ?auto_4330 ) ( TRUCK-AT ?auto_4341 ?auto_4339 ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4350 ) ) ( not ( = ?auto_4330 ?auto_4350 ) ) ( not ( = ?auto_4340 ?auto_4347 ) ) ( not ( = ?auto_4329 ?auto_4331 ) ) ( not ( = ?auto_4329 ?auto_4351 ) ) ( not ( = ?auto_4331 ?auto_4350 ) ) ( not ( = ?auto_4355 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4347 ) ) ( not ( = ?auto_4351 ?auto_4350 ) ) ( not ( = ?auto_4329 ?auto_4332 ) ) ( not ( = ?auto_4329 ?auto_4354 ) ) ( not ( = ?auto_4330 ?auto_4332 ) ) ( not ( = ?auto_4330 ?auto_4354 ) ) ( not ( = ?auto_4332 ?auto_4351 ) ) ( not ( = ?auto_4332 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4355 ) ) ( not ( = ?auto_4349 ?auto_4352 ) ) ( not ( = ?auto_4343 ?auto_4348 ) ) ( not ( = ?auto_4343 ?auto_4347 ) ) ( not ( = ?auto_4354 ?auto_4351 ) ) ( not ( = ?auto_4354 ?auto_4350 ) ) ( not ( = ?auto_4329 ?auto_4333 ) ) ( not ( = ?auto_4329 ?auto_4356 ) ) ( not ( = ?auto_4330 ?auto_4333 ) ) ( not ( = ?auto_4330 ?auto_4356 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4331 ?auto_4356 ) ) ( not ( = ?auto_4333 ?auto_4354 ) ) ( not ( = ?auto_4333 ?auto_4351 ) ) ( not ( = ?auto_4333 ?auto_4350 ) ) ( not ( = ?auto_4342 ?auto_4349 ) ) ( not ( = ?auto_4342 ?auto_4355 ) ) ( not ( = ?auto_4342 ?auto_4352 ) ) ( not ( = ?auto_4353 ?auto_4343 ) ) ( not ( = ?auto_4353 ?auto_4348 ) ) ( not ( = ?auto_4353 ?auto_4347 ) ) ( not ( = ?auto_4356 ?auto_4354 ) ) ( not ( = ?auto_4356 ?auto_4351 ) ) ( not ( = ?auto_4356 ?auto_4350 ) ) ( not ( = ?auto_4329 ?auto_4334 ) ) ( not ( = ?auto_4329 ?auto_4346 ) ) ( not ( = ?auto_4330 ?auto_4334 ) ) ( not ( = ?auto_4330 ?auto_4346 ) ) ( not ( = ?auto_4331 ?auto_4334 ) ) ( not ( = ?auto_4331 ?auto_4346 ) ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4332 ?auto_4346 ) ) ( not ( = ?auto_4334 ?auto_4356 ) ) ( not ( = ?auto_4334 ?auto_4354 ) ) ( not ( = ?auto_4334 ?auto_4351 ) ) ( not ( = ?auto_4334 ?auto_4350 ) ) ( not ( = ?auto_4345 ?auto_4342 ) ) ( not ( = ?auto_4345 ?auto_4349 ) ) ( not ( = ?auto_4345 ?auto_4355 ) ) ( not ( = ?auto_4345 ?auto_4352 ) ) ( not ( = ?auto_4344 ?auto_4353 ) ) ( not ( = ?auto_4344 ?auto_4343 ) ) ( not ( = ?auto_4344 ?auto_4348 ) ) ( not ( = ?auto_4344 ?auto_4347 ) ) ( not ( = ?auto_4346 ?auto_4356 ) ) ( not ( = ?auto_4346 ?auto_4354 ) ) ( not ( = ?auto_4346 ?auto_4351 ) ) ( not ( = ?auto_4346 ?auto_4350 ) ) ( not ( = ?auto_4329 ?auto_4335 ) ) ( not ( = ?auto_4329 ?auto_4336 ) ) ( not ( = ?auto_4330 ?auto_4335 ) ) ( not ( = ?auto_4330 ?auto_4336 ) ) ( not ( = ?auto_4331 ?auto_4335 ) ) ( not ( = ?auto_4331 ?auto_4336 ) ) ( not ( = ?auto_4332 ?auto_4335 ) ) ( not ( = ?auto_4332 ?auto_4336 ) ) ( not ( = ?auto_4333 ?auto_4335 ) ) ( not ( = ?auto_4333 ?auto_4336 ) ) ( not ( = ?auto_4335 ?auto_4346 ) ) ( not ( = ?auto_4335 ?auto_4356 ) ) ( not ( = ?auto_4335 ?auto_4354 ) ) ( not ( = ?auto_4335 ?auto_4351 ) ) ( not ( = ?auto_4335 ?auto_4350 ) ) ( not ( = ?auto_4337 ?auto_4345 ) ) ( not ( = ?auto_4337 ?auto_4342 ) ) ( not ( = ?auto_4337 ?auto_4349 ) ) ( not ( = ?auto_4337 ?auto_4355 ) ) ( not ( = ?auto_4337 ?auto_4352 ) ) ( not ( = ?auto_4338 ?auto_4344 ) ) ( not ( = ?auto_4338 ?auto_4353 ) ) ( not ( = ?auto_4338 ?auto_4343 ) ) ( not ( = ?auto_4338 ?auto_4348 ) ) ( not ( = ?auto_4338 ?auto_4347 ) ) ( not ( = ?auto_4336 ?auto_4346 ) ) ( not ( = ?auto_4336 ?auto_4356 ) ) ( not ( = ?auto_4336 ?auto_4354 ) ) ( not ( = ?auto_4336 ?auto_4351 ) ) ( not ( = ?auto_4336 ?auto_4350 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4329 ?auto_4330 ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4334 )
      ( MAKE-1CRATE ?auto_4334 ?auto_4335 )
      ( MAKE-6CRATE-VERIFY ?auto_4329 ?auto_4330 ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4334 ?auto_4335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4359 - SURFACE
      ?auto_4360 - SURFACE
    )
    :vars
    (
      ?auto_4361 - HOIST
      ?auto_4362 - PLACE
      ?auto_4364 - PLACE
      ?auto_4365 - HOIST
      ?auto_4366 - SURFACE
      ?auto_4363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4361 ?auto_4362 ) ( SURFACE-AT ?auto_4359 ?auto_4362 ) ( CLEAR ?auto_4359 ) ( IS-CRATE ?auto_4360 ) ( AVAILABLE ?auto_4361 ) ( not ( = ?auto_4364 ?auto_4362 ) ) ( HOIST-AT ?auto_4365 ?auto_4364 ) ( AVAILABLE ?auto_4365 ) ( SURFACE-AT ?auto_4360 ?auto_4364 ) ( ON ?auto_4360 ?auto_4366 ) ( CLEAR ?auto_4360 ) ( TRUCK-AT ?auto_4363 ?auto_4362 ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4366 ) ) ( not ( = ?auto_4360 ?auto_4366 ) ) ( not ( = ?auto_4361 ?auto_4365 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4363 ?auto_4362 ?auto_4364 )
      ( !LIFT ?auto_4365 ?auto_4360 ?auto_4366 ?auto_4364 )
      ( !LOAD ?auto_4365 ?auto_4360 ?auto_4363 ?auto_4364 )
      ( !DRIVE ?auto_4363 ?auto_4364 ?auto_4362 )
      ( !UNLOAD ?auto_4361 ?auto_4360 ?auto_4363 ?auto_4362 )
      ( !DROP ?auto_4361 ?auto_4360 ?auto_4359 ?auto_4362 )
      ( MAKE-1CRATE-VERIFY ?auto_4359 ?auto_4360 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4375 - SURFACE
      ?auto_4376 - SURFACE
      ?auto_4377 - SURFACE
      ?auto_4378 - SURFACE
      ?auto_4379 - SURFACE
      ?auto_4380 - SURFACE
      ?auto_4381 - SURFACE
      ?auto_4382 - SURFACE
    )
    :vars
    (
      ?auto_4384 - HOIST
      ?auto_4387 - PLACE
      ?auto_4385 - PLACE
      ?auto_4386 - HOIST
      ?auto_4388 - SURFACE
      ?auto_4396 - PLACE
      ?auto_4394 - HOIST
      ?auto_4398 - SURFACE
      ?auto_4395 - PLACE
      ?auto_4400 - HOIST
      ?auto_4393 - SURFACE
      ?auto_4401 - PLACE
      ?auto_4402 - HOIST
      ?auto_4397 - SURFACE
      ?auto_4390 - PLACE
      ?auto_4399 - HOIST
      ?auto_4389 - SURFACE
      ?auto_4403 - PLACE
      ?auto_4391 - HOIST
      ?auto_4404 - SURFACE
      ?auto_4405 - PLACE
      ?auto_4392 - HOIST
      ?auto_4406 - SURFACE
      ?auto_4383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4384 ?auto_4387 ) ( IS-CRATE ?auto_4382 ) ( not ( = ?auto_4385 ?auto_4387 ) ) ( HOIST-AT ?auto_4386 ?auto_4385 ) ( AVAILABLE ?auto_4386 ) ( SURFACE-AT ?auto_4382 ?auto_4385 ) ( ON ?auto_4382 ?auto_4388 ) ( CLEAR ?auto_4382 ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( not ( = ?auto_4381 ?auto_4388 ) ) ( not ( = ?auto_4382 ?auto_4388 ) ) ( not ( = ?auto_4384 ?auto_4386 ) ) ( IS-CRATE ?auto_4381 ) ( not ( = ?auto_4396 ?auto_4387 ) ) ( HOIST-AT ?auto_4394 ?auto_4396 ) ( AVAILABLE ?auto_4394 ) ( SURFACE-AT ?auto_4381 ?auto_4396 ) ( ON ?auto_4381 ?auto_4398 ) ( CLEAR ?auto_4381 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4380 ?auto_4398 ) ) ( not ( = ?auto_4381 ?auto_4398 ) ) ( not ( = ?auto_4384 ?auto_4394 ) ) ( IS-CRATE ?auto_4380 ) ( not ( = ?auto_4395 ?auto_4387 ) ) ( HOIST-AT ?auto_4400 ?auto_4395 ) ( AVAILABLE ?auto_4400 ) ( SURFACE-AT ?auto_4380 ?auto_4395 ) ( ON ?auto_4380 ?auto_4393 ) ( CLEAR ?auto_4380 ) ( not ( = ?auto_4379 ?auto_4380 ) ) ( not ( = ?auto_4379 ?auto_4393 ) ) ( not ( = ?auto_4380 ?auto_4393 ) ) ( not ( = ?auto_4384 ?auto_4400 ) ) ( IS-CRATE ?auto_4379 ) ( not ( = ?auto_4401 ?auto_4387 ) ) ( HOIST-AT ?auto_4402 ?auto_4401 ) ( AVAILABLE ?auto_4402 ) ( SURFACE-AT ?auto_4379 ?auto_4401 ) ( ON ?auto_4379 ?auto_4397 ) ( CLEAR ?auto_4379 ) ( not ( = ?auto_4378 ?auto_4379 ) ) ( not ( = ?auto_4378 ?auto_4397 ) ) ( not ( = ?auto_4379 ?auto_4397 ) ) ( not ( = ?auto_4384 ?auto_4402 ) ) ( IS-CRATE ?auto_4378 ) ( not ( = ?auto_4390 ?auto_4387 ) ) ( HOIST-AT ?auto_4399 ?auto_4390 ) ( AVAILABLE ?auto_4399 ) ( SURFACE-AT ?auto_4378 ?auto_4390 ) ( ON ?auto_4378 ?auto_4389 ) ( CLEAR ?auto_4378 ) ( not ( = ?auto_4377 ?auto_4378 ) ) ( not ( = ?auto_4377 ?auto_4389 ) ) ( not ( = ?auto_4378 ?auto_4389 ) ) ( not ( = ?auto_4384 ?auto_4399 ) ) ( IS-CRATE ?auto_4377 ) ( not ( = ?auto_4403 ?auto_4387 ) ) ( HOIST-AT ?auto_4391 ?auto_4403 ) ( AVAILABLE ?auto_4391 ) ( SURFACE-AT ?auto_4377 ?auto_4403 ) ( ON ?auto_4377 ?auto_4404 ) ( CLEAR ?auto_4377 ) ( not ( = ?auto_4376 ?auto_4377 ) ) ( not ( = ?auto_4376 ?auto_4404 ) ) ( not ( = ?auto_4377 ?auto_4404 ) ) ( not ( = ?auto_4384 ?auto_4391 ) ) ( SURFACE-AT ?auto_4375 ?auto_4387 ) ( CLEAR ?auto_4375 ) ( IS-CRATE ?auto_4376 ) ( AVAILABLE ?auto_4384 ) ( not ( = ?auto_4405 ?auto_4387 ) ) ( HOIST-AT ?auto_4392 ?auto_4405 ) ( AVAILABLE ?auto_4392 ) ( SURFACE-AT ?auto_4376 ?auto_4405 ) ( ON ?auto_4376 ?auto_4406 ) ( CLEAR ?auto_4376 ) ( TRUCK-AT ?auto_4383 ?auto_4387 ) ( not ( = ?auto_4375 ?auto_4376 ) ) ( not ( = ?auto_4375 ?auto_4406 ) ) ( not ( = ?auto_4376 ?auto_4406 ) ) ( not ( = ?auto_4384 ?auto_4392 ) ) ( not ( = ?auto_4375 ?auto_4377 ) ) ( not ( = ?auto_4375 ?auto_4404 ) ) ( not ( = ?auto_4377 ?auto_4406 ) ) ( not ( = ?auto_4403 ?auto_4405 ) ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4404 ?auto_4406 ) ) ( not ( = ?auto_4375 ?auto_4378 ) ) ( not ( = ?auto_4375 ?auto_4389 ) ) ( not ( = ?auto_4376 ?auto_4378 ) ) ( not ( = ?auto_4376 ?auto_4389 ) ) ( not ( = ?auto_4378 ?auto_4404 ) ) ( not ( = ?auto_4378 ?auto_4406 ) ) ( not ( = ?auto_4390 ?auto_4403 ) ) ( not ( = ?auto_4390 ?auto_4405 ) ) ( not ( = ?auto_4399 ?auto_4391 ) ) ( not ( = ?auto_4399 ?auto_4392 ) ) ( not ( = ?auto_4389 ?auto_4404 ) ) ( not ( = ?auto_4389 ?auto_4406 ) ) ( not ( = ?auto_4375 ?auto_4379 ) ) ( not ( = ?auto_4375 ?auto_4397 ) ) ( not ( = ?auto_4376 ?auto_4379 ) ) ( not ( = ?auto_4376 ?auto_4397 ) ) ( not ( = ?auto_4377 ?auto_4379 ) ) ( not ( = ?auto_4377 ?auto_4397 ) ) ( not ( = ?auto_4379 ?auto_4389 ) ) ( not ( = ?auto_4379 ?auto_4404 ) ) ( not ( = ?auto_4379 ?auto_4406 ) ) ( not ( = ?auto_4401 ?auto_4390 ) ) ( not ( = ?auto_4401 ?auto_4403 ) ) ( not ( = ?auto_4401 ?auto_4405 ) ) ( not ( = ?auto_4402 ?auto_4399 ) ) ( not ( = ?auto_4402 ?auto_4391 ) ) ( not ( = ?auto_4402 ?auto_4392 ) ) ( not ( = ?auto_4397 ?auto_4389 ) ) ( not ( = ?auto_4397 ?auto_4404 ) ) ( not ( = ?auto_4397 ?auto_4406 ) ) ( not ( = ?auto_4375 ?auto_4380 ) ) ( not ( = ?auto_4375 ?auto_4393 ) ) ( not ( = ?auto_4376 ?auto_4380 ) ) ( not ( = ?auto_4376 ?auto_4393 ) ) ( not ( = ?auto_4377 ?auto_4380 ) ) ( not ( = ?auto_4377 ?auto_4393 ) ) ( not ( = ?auto_4378 ?auto_4380 ) ) ( not ( = ?auto_4378 ?auto_4393 ) ) ( not ( = ?auto_4380 ?auto_4397 ) ) ( not ( = ?auto_4380 ?auto_4389 ) ) ( not ( = ?auto_4380 ?auto_4404 ) ) ( not ( = ?auto_4380 ?auto_4406 ) ) ( not ( = ?auto_4395 ?auto_4401 ) ) ( not ( = ?auto_4395 ?auto_4390 ) ) ( not ( = ?auto_4395 ?auto_4403 ) ) ( not ( = ?auto_4395 ?auto_4405 ) ) ( not ( = ?auto_4400 ?auto_4402 ) ) ( not ( = ?auto_4400 ?auto_4399 ) ) ( not ( = ?auto_4400 ?auto_4391 ) ) ( not ( = ?auto_4400 ?auto_4392 ) ) ( not ( = ?auto_4393 ?auto_4397 ) ) ( not ( = ?auto_4393 ?auto_4389 ) ) ( not ( = ?auto_4393 ?auto_4404 ) ) ( not ( = ?auto_4393 ?auto_4406 ) ) ( not ( = ?auto_4375 ?auto_4381 ) ) ( not ( = ?auto_4375 ?auto_4398 ) ) ( not ( = ?auto_4376 ?auto_4381 ) ) ( not ( = ?auto_4376 ?auto_4398 ) ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( not ( = ?auto_4377 ?auto_4398 ) ) ( not ( = ?auto_4378 ?auto_4381 ) ) ( not ( = ?auto_4378 ?auto_4398 ) ) ( not ( = ?auto_4379 ?auto_4381 ) ) ( not ( = ?auto_4379 ?auto_4398 ) ) ( not ( = ?auto_4381 ?auto_4393 ) ) ( not ( = ?auto_4381 ?auto_4397 ) ) ( not ( = ?auto_4381 ?auto_4389 ) ) ( not ( = ?auto_4381 ?auto_4404 ) ) ( not ( = ?auto_4381 ?auto_4406 ) ) ( not ( = ?auto_4396 ?auto_4395 ) ) ( not ( = ?auto_4396 ?auto_4401 ) ) ( not ( = ?auto_4396 ?auto_4390 ) ) ( not ( = ?auto_4396 ?auto_4403 ) ) ( not ( = ?auto_4396 ?auto_4405 ) ) ( not ( = ?auto_4394 ?auto_4400 ) ) ( not ( = ?auto_4394 ?auto_4402 ) ) ( not ( = ?auto_4394 ?auto_4399 ) ) ( not ( = ?auto_4394 ?auto_4391 ) ) ( not ( = ?auto_4394 ?auto_4392 ) ) ( not ( = ?auto_4398 ?auto_4393 ) ) ( not ( = ?auto_4398 ?auto_4397 ) ) ( not ( = ?auto_4398 ?auto_4389 ) ) ( not ( = ?auto_4398 ?auto_4404 ) ) ( not ( = ?auto_4398 ?auto_4406 ) ) ( not ( = ?auto_4375 ?auto_4382 ) ) ( not ( = ?auto_4375 ?auto_4388 ) ) ( not ( = ?auto_4376 ?auto_4382 ) ) ( not ( = ?auto_4376 ?auto_4388 ) ) ( not ( = ?auto_4377 ?auto_4382 ) ) ( not ( = ?auto_4377 ?auto_4388 ) ) ( not ( = ?auto_4378 ?auto_4382 ) ) ( not ( = ?auto_4378 ?auto_4388 ) ) ( not ( = ?auto_4379 ?auto_4382 ) ) ( not ( = ?auto_4379 ?auto_4388 ) ) ( not ( = ?auto_4380 ?auto_4382 ) ) ( not ( = ?auto_4380 ?auto_4388 ) ) ( not ( = ?auto_4382 ?auto_4398 ) ) ( not ( = ?auto_4382 ?auto_4393 ) ) ( not ( = ?auto_4382 ?auto_4397 ) ) ( not ( = ?auto_4382 ?auto_4389 ) ) ( not ( = ?auto_4382 ?auto_4404 ) ) ( not ( = ?auto_4382 ?auto_4406 ) ) ( not ( = ?auto_4385 ?auto_4396 ) ) ( not ( = ?auto_4385 ?auto_4395 ) ) ( not ( = ?auto_4385 ?auto_4401 ) ) ( not ( = ?auto_4385 ?auto_4390 ) ) ( not ( = ?auto_4385 ?auto_4403 ) ) ( not ( = ?auto_4385 ?auto_4405 ) ) ( not ( = ?auto_4386 ?auto_4394 ) ) ( not ( = ?auto_4386 ?auto_4400 ) ) ( not ( = ?auto_4386 ?auto_4402 ) ) ( not ( = ?auto_4386 ?auto_4399 ) ) ( not ( = ?auto_4386 ?auto_4391 ) ) ( not ( = ?auto_4386 ?auto_4392 ) ) ( not ( = ?auto_4388 ?auto_4398 ) ) ( not ( = ?auto_4388 ?auto_4393 ) ) ( not ( = ?auto_4388 ?auto_4397 ) ) ( not ( = ?auto_4388 ?auto_4389 ) ) ( not ( = ?auto_4388 ?auto_4404 ) ) ( not ( = ?auto_4388 ?auto_4406 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4375 ?auto_4376 ?auto_4377 ?auto_4378 ?auto_4379 ?auto_4380 ?auto_4381 )
      ( MAKE-1CRATE ?auto_4381 ?auto_4382 )
      ( MAKE-7CRATE-VERIFY ?auto_4375 ?auto_4376 ?auto_4377 ?auto_4378 ?auto_4379 ?auto_4380 ?auto_4381 ?auto_4382 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4409 - SURFACE
      ?auto_4410 - SURFACE
    )
    :vars
    (
      ?auto_4411 - HOIST
      ?auto_4412 - PLACE
      ?auto_4414 - PLACE
      ?auto_4415 - HOIST
      ?auto_4416 - SURFACE
      ?auto_4413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4411 ?auto_4412 ) ( SURFACE-AT ?auto_4409 ?auto_4412 ) ( CLEAR ?auto_4409 ) ( IS-CRATE ?auto_4410 ) ( AVAILABLE ?auto_4411 ) ( not ( = ?auto_4414 ?auto_4412 ) ) ( HOIST-AT ?auto_4415 ?auto_4414 ) ( AVAILABLE ?auto_4415 ) ( SURFACE-AT ?auto_4410 ?auto_4414 ) ( ON ?auto_4410 ?auto_4416 ) ( CLEAR ?auto_4410 ) ( TRUCK-AT ?auto_4413 ?auto_4412 ) ( not ( = ?auto_4409 ?auto_4410 ) ) ( not ( = ?auto_4409 ?auto_4416 ) ) ( not ( = ?auto_4410 ?auto_4416 ) ) ( not ( = ?auto_4411 ?auto_4415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4413 ?auto_4412 ?auto_4414 )
      ( !LIFT ?auto_4415 ?auto_4410 ?auto_4416 ?auto_4414 )
      ( !LOAD ?auto_4415 ?auto_4410 ?auto_4413 ?auto_4414 )
      ( !DRIVE ?auto_4413 ?auto_4414 ?auto_4412 )
      ( !UNLOAD ?auto_4411 ?auto_4410 ?auto_4413 ?auto_4412 )
      ( !DROP ?auto_4411 ?auto_4410 ?auto_4409 ?auto_4412 )
      ( MAKE-1CRATE-VERIFY ?auto_4409 ?auto_4410 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4426 - SURFACE
      ?auto_4427 - SURFACE
      ?auto_4428 - SURFACE
      ?auto_4429 - SURFACE
      ?auto_4430 - SURFACE
      ?auto_4431 - SURFACE
      ?auto_4432 - SURFACE
      ?auto_4434 - SURFACE
      ?auto_4433 - SURFACE
    )
    :vars
    (
      ?auto_4439 - HOIST
      ?auto_4438 - PLACE
      ?auto_4437 - PLACE
      ?auto_4435 - HOIST
      ?auto_4436 - SURFACE
      ?auto_4449 - PLACE
      ?auto_4441 - HOIST
      ?auto_4450 - SURFACE
      ?auto_4445 - PLACE
      ?auto_4447 - HOIST
      ?auto_4461 - SURFACE
      ?auto_4446 - PLACE
      ?auto_4442 - HOIST
      ?auto_4448 - SURFACE
      ?auto_4443 - PLACE
      ?auto_4444 - HOIST
      ?auto_4459 - SURFACE
      ?auto_4452 - PLACE
      ?auto_4460 - HOIST
      ?auto_4457 - SURFACE
      ?auto_4454 - PLACE
      ?auto_4453 - HOIST
      ?auto_4458 - SURFACE
      ?auto_4456 - PLACE
      ?auto_4451 - HOIST
      ?auto_4455 - SURFACE
      ?auto_4440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4439 ?auto_4438 ) ( IS-CRATE ?auto_4433 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( HOIST-AT ?auto_4435 ?auto_4437 ) ( AVAILABLE ?auto_4435 ) ( SURFACE-AT ?auto_4433 ?auto_4437 ) ( ON ?auto_4433 ?auto_4436 ) ( CLEAR ?auto_4433 ) ( not ( = ?auto_4434 ?auto_4433 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4433 ?auto_4436 ) ) ( not ( = ?auto_4439 ?auto_4435 ) ) ( IS-CRATE ?auto_4434 ) ( not ( = ?auto_4449 ?auto_4438 ) ) ( HOIST-AT ?auto_4441 ?auto_4449 ) ( AVAILABLE ?auto_4441 ) ( SURFACE-AT ?auto_4434 ?auto_4449 ) ( ON ?auto_4434 ?auto_4450 ) ( CLEAR ?auto_4434 ) ( not ( = ?auto_4432 ?auto_4434 ) ) ( not ( = ?auto_4432 ?auto_4450 ) ) ( not ( = ?auto_4434 ?auto_4450 ) ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( IS-CRATE ?auto_4432 ) ( not ( = ?auto_4445 ?auto_4438 ) ) ( HOIST-AT ?auto_4447 ?auto_4445 ) ( AVAILABLE ?auto_4447 ) ( SURFACE-AT ?auto_4432 ?auto_4445 ) ( ON ?auto_4432 ?auto_4461 ) ( CLEAR ?auto_4432 ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4461 ) ) ( not ( = ?auto_4432 ?auto_4461 ) ) ( not ( = ?auto_4439 ?auto_4447 ) ) ( IS-CRATE ?auto_4431 ) ( not ( = ?auto_4446 ?auto_4438 ) ) ( HOIST-AT ?auto_4442 ?auto_4446 ) ( AVAILABLE ?auto_4442 ) ( SURFACE-AT ?auto_4431 ?auto_4446 ) ( ON ?auto_4431 ?auto_4448 ) ( CLEAR ?auto_4431 ) ( not ( = ?auto_4430 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4448 ) ) ( not ( = ?auto_4431 ?auto_4448 ) ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( IS-CRATE ?auto_4430 ) ( not ( = ?auto_4443 ?auto_4438 ) ) ( HOIST-AT ?auto_4444 ?auto_4443 ) ( AVAILABLE ?auto_4444 ) ( SURFACE-AT ?auto_4430 ?auto_4443 ) ( ON ?auto_4430 ?auto_4459 ) ( CLEAR ?auto_4430 ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4459 ) ) ( not ( = ?auto_4430 ?auto_4459 ) ) ( not ( = ?auto_4439 ?auto_4444 ) ) ( IS-CRATE ?auto_4429 ) ( not ( = ?auto_4452 ?auto_4438 ) ) ( HOIST-AT ?auto_4460 ?auto_4452 ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4429 ?auto_4452 ) ( ON ?auto_4429 ?auto_4457 ) ( CLEAR ?auto_4429 ) ( not ( = ?auto_4428 ?auto_4429 ) ) ( not ( = ?auto_4428 ?auto_4457 ) ) ( not ( = ?auto_4429 ?auto_4457 ) ) ( not ( = ?auto_4439 ?auto_4460 ) ) ( IS-CRATE ?auto_4428 ) ( not ( = ?auto_4454 ?auto_4438 ) ) ( HOIST-AT ?auto_4453 ?auto_4454 ) ( AVAILABLE ?auto_4453 ) ( SURFACE-AT ?auto_4428 ?auto_4454 ) ( ON ?auto_4428 ?auto_4458 ) ( CLEAR ?auto_4428 ) ( not ( = ?auto_4427 ?auto_4428 ) ) ( not ( = ?auto_4427 ?auto_4458 ) ) ( not ( = ?auto_4428 ?auto_4458 ) ) ( not ( = ?auto_4439 ?auto_4453 ) ) ( SURFACE-AT ?auto_4426 ?auto_4438 ) ( CLEAR ?auto_4426 ) ( IS-CRATE ?auto_4427 ) ( AVAILABLE ?auto_4439 ) ( not ( = ?auto_4456 ?auto_4438 ) ) ( HOIST-AT ?auto_4451 ?auto_4456 ) ( AVAILABLE ?auto_4451 ) ( SURFACE-AT ?auto_4427 ?auto_4456 ) ( ON ?auto_4427 ?auto_4455 ) ( CLEAR ?auto_4427 ) ( TRUCK-AT ?auto_4440 ?auto_4438 ) ( not ( = ?auto_4426 ?auto_4427 ) ) ( not ( = ?auto_4426 ?auto_4455 ) ) ( not ( = ?auto_4427 ?auto_4455 ) ) ( not ( = ?auto_4439 ?auto_4451 ) ) ( not ( = ?auto_4426 ?auto_4428 ) ) ( not ( = ?auto_4426 ?auto_4458 ) ) ( not ( = ?auto_4428 ?auto_4455 ) ) ( not ( = ?auto_4454 ?auto_4456 ) ) ( not ( = ?auto_4453 ?auto_4451 ) ) ( not ( = ?auto_4458 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4429 ) ) ( not ( = ?auto_4426 ?auto_4457 ) ) ( not ( = ?auto_4427 ?auto_4429 ) ) ( not ( = ?auto_4427 ?auto_4457 ) ) ( not ( = ?auto_4429 ?auto_4458 ) ) ( not ( = ?auto_4429 ?auto_4455 ) ) ( not ( = ?auto_4452 ?auto_4454 ) ) ( not ( = ?auto_4452 ?auto_4456 ) ) ( not ( = ?auto_4460 ?auto_4453 ) ) ( not ( = ?auto_4460 ?auto_4451 ) ) ( not ( = ?auto_4457 ?auto_4458 ) ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4430 ) ) ( not ( = ?auto_4426 ?auto_4459 ) ) ( not ( = ?auto_4427 ?auto_4430 ) ) ( not ( = ?auto_4427 ?auto_4459 ) ) ( not ( = ?auto_4428 ?auto_4430 ) ) ( not ( = ?auto_4428 ?auto_4459 ) ) ( not ( = ?auto_4430 ?auto_4457 ) ) ( not ( = ?auto_4430 ?auto_4458 ) ) ( not ( = ?auto_4430 ?auto_4455 ) ) ( not ( = ?auto_4443 ?auto_4452 ) ) ( not ( = ?auto_4443 ?auto_4454 ) ) ( not ( = ?auto_4443 ?auto_4456 ) ) ( not ( = ?auto_4444 ?auto_4460 ) ) ( not ( = ?auto_4444 ?auto_4453 ) ) ( not ( = ?auto_4444 ?auto_4451 ) ) ( not ( = ?auto_4459 ?auto_4457 ) ) ( not ( = ?auto_4459 ?auto_4458 ) ) ( not ( = ?auto_4459 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4431 ) ) ( not ( = ?auto_4426 ?auto_4448 ) ) ( not ( = ?auto_4427 ?auto_4431 ) ) ( not ( = ?auto_4427 ?auto_4448 ) ) ( not ( = ?auto_4428 ?auto_4431 ) ) ( not ( = ?auto_4428 ?auto_4448 ) ) ( not ( = ?auto_4429 ?auto_4431 ) ) ( not ( = ?auto_4429 ?auto_4448 ) ) ( not ( = ?auto_4431 ?auto_4459 ) ) ( not ( = ?auto_4431 ?auto_4457 ) ) ( not ( = ?auto_4431 ?auto_4458 ) ) ( not ( = ?auto_4431 ?auto_4455 ) ) ( not ( = ?auto_4446 ?auto_4443 ) ) ( not ( = ?auto_4446 ?auto_4452 ) ) ( not ( = ?auto_4446 ?auto_4454 ) ) ( not ( = ?auto_4446 ?auto_4456 ) ) ( not ( = ?auto_4442 ?auto_4444 ) ) ( not ( = ?auto_4442 ?auto_4460 ) ) ( not ( = ?auto_4442 ?auto_4453 ) ) ( not ( = ?auto_4442 ?auto_4451 ) ) ( not ( = ?auto_4448 ?auto_4459 ) ) ( not ( = ?auto_4448 ?auto_4457 ) ) ( not ( = ?auto_4448 ?auto_4458 ) ) ( not ( = ?auto_4448 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4432 ) ) ( not ( = ?auto_4426 ?auto_4461 ) ) ( not ( = ?auto_4427 ?auto_4432 ) ) ( not ( = ?auto_4427 ?auto_4461 ) ) ( not ( = ?auto_4428 ?auto_4432 ) ) ( not ( = ?auto_4428 ?auto_4461 ) ) ( not ( = ?auto_4429 ?auto_4432 ) ) ( not ( = ?auto_4429 ?auto_4461 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4430 ?auto_4461 ) ) ( not ( = ?auto_4432 ?auto_4448 ) ) ( not ( = ?auto_4432 ?auto_4459 ) ) ( not ( = ?auto_4432 ?auto_4457 ) ) ( not ( = ?auto_4432 ?auto_4458 ) ) ( not ( = ?auto_4432 ?auto_4455 ) ) ( not ( = ?auto_4445 ?auto_4446 ) ) ( not ( = ?auto_4445 ?auto_4443 ) ) ( not ( = ?auto_4445 ?auto_4452 ) ) ( not ( = ?auto_4445 ?auto_4454 ) ) ( not ( = ?auto_4445 ?auto_4456 ) ) ( not ( = ?auto_4447 ?auto_4442 ) ) ( not ( = ?auto_4447 ?auto_4444 ) ) ( not ( = ?auto_4447 ?auto_4460 ) ) ( not ( = ?auto_4447 ?auto_4453 ) ) ( not ( = ?auto_4447 ?auto_4451 ) ) ( not ( = ?auto_4461 ?auto_4448 ) ) ( not ( = ?auto_4461 ?auto_4459 ) ) ( not ( = ?auto_4461 ?auto_4457 ) ) ( not ( = ?auto_4461 ?auto_4458 ) ) ( not ( = ?auto_4461 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4434 ) ) ( not ( = ?auto_4426 ?auto_4450 ) ) ( not ( = ?auto_4427 ?auto_4434 ) ) ( not ( = ?auto_4427 ?auto_4450 ) ) ( not ( = ?auto_4428 ?auto_4434 ) ) ( not ( = ?auto_4428 ?auto_4450 ) ) ( not ( = ?auto_4429 ?auto_4434 ) ) ( not ( = ?auto_4429 ?auto_4450 ) ) ( not ( = ?auto_4430 ?auto_4434 ) ) ( not ( = ?auto_4430 ?auto_4450 ) ) ( not ( = ?auto_4431 ?auto_4434 ) ) ( not ( = ?auto_4431 ?auto_4450 ) ) ( not ( = ?auto_4434 ?auto_4461 ) ) ( not ( = ?auto_4434 ?auto_4448 ) ) ( not ( = ?auto_4434 ?auto_4459 ) ) ( not ( = ?auto_4434 ?auto_4457 ) ) ( not ( = ?auto_4434 ?auto_4458 ) ) ( not ( = ?auto_4434 ?auto_4455 ) ) ( not ( = ?auto_4449 ?auto_4445 ) ) ( not ( = ?auto_4449 ?auto_4446 ) ) ( not ( = ?auto_4449 ?auto_4443 ) ) ( not ( = ?auto_4449 ?auto_4452 ) ) ( not ( = ?auto_4449 ?auto_4454 ) ) ( not ( = ?auto_4449 ?auto_4456 ) ) ( not ( = ?auto_4441 ?auto_4447 ) ) ( not ( = ?auto_4441 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4444 ) ) ( not ( = ?auto_4441 ?auto_4460 ) ) ( not ( = ?auto_4441 ?auto_4453 ) ) ( not ( = ?auto_4441 ?auto_4451 ) ) ( not ( = ?auto_4450 ?auto_4461 ) ) ( not ( = ?auto_4450 ?auto_4448 ) ) ( not ( = ?auto_4450 ?auto_4459 ) ) ( not ( = ?auto_4450 ?auto_4457 ) ) ( not ( = ?auto_4450 ?auto_4458 ) ) ( not ( = ?auto_4450 ?auto_4455 ) ) ( not ( = ?auto_4426 ?auto_4433 ) ) ( not ( = ?auto_4426 ?auto_4436 ) ) ( not ( = ?auto_4427 ?auto_4433 ) ) ( not ( = ?auto_4427 ?auto_4436 ) ) ( not ( = ?auto_4428 ?auto_4433 ) ) ( not ( = ?auto_4428 ?auto_4436 ) ) ( not ( = ?auto_4429 ?auto_4433 ) ) ( not ( = ?auto_4429 ?auto_4436 ) ) ( not ( = ?auto_4430 ?auto_4433 ) ) ( not ( = ?auto_4430 ?auto_4436 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4436 ) ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4432 ?auto_4436 ) ) ( not ( = ?auto_4433 ?auto_4450 ) ) ( not ( = ?auto_4433 ?auto_4461 ) ) ( not ( = ?auto_4433 ?auto_4448 ) ) ( not ( = ?auto_4433 ?auto_4459 ) ) ( not ( = ?auto_4433 ?auto_4457 ) ) ( not ( = ?auto_4433 ?auto_4458 ) ) ( not ( = ?auto_4433 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4449 ) ) ( not ( = ?auto_4437 ?auto_4445 ) ) ( not ( = ?auto_4437 ?auto_4446 ) ) ( not ( = ?auto_4437 ?auto_4443 ) ) ( not ( = ?auto_4437 ?auto_4452 ) ) ( not ( = ?auto_4437 ?auto_4454 ) ) ( not ( = ?auto_4437 ?auto_4456 ) ) ( not ( = ?auto_4435 ?auto_4441 ) ) ( not ( = ?auto_4435 ?auto_4447 ) ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4435 ?auto_4444 ) ) ( not ( = ?auto_4435 ?auto_4460 ) ) ( not ( = ?auto_4435 ?auto_4453 ) ) ( not ( = ?auto_4435 ?auto_4451 ) ) ( not ( = ?auto_4436 ?auto_4450 ) ) ( not ( = ?auto_4436 ?auto_4461 ) ) ( not ( = ?auto_4436 ?auto_4448 ) ) ( not ( = ?auto_4436 ?auto_4459 ) ) ( not ( = ?auto_4436 ?auto_4457 ) ) ( not ( = ?auto_4436 ?auto_4458 ) ) ( not ( = ?auto_4436 ?auto_4455 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4426 ?auto_4427 ?auto_4428 ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4432 ?auto_4434 )
      ( MAKE-1CRATE ?auto_4434 ?auto_4433 )
      ( MAKE-8CRATE-VERIFY ?auto_4426 ?auto_4427 ?auto_4428 ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4432 ?auto_4434 ?auto_4433 ) )
  )

)

