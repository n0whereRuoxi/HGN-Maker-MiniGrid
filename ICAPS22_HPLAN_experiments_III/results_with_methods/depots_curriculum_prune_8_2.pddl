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
      ?auto_4198 - PLACE
      ?auto_4203 - HOIST
      ?auto_4199 - SURFACE
      ?auto_4204 - PLACE
      ?auto_4206 - HOIST
      ?auto_4205 - SURFACE
      ?auto_4202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4201 ?auto_4200 ) ( IS-CRATE ?auto_4197 ) ( not ( = ?auto_4198 ?auto_4200 ) ) ( HOIST-AT ?auto_4203 ?auto_4198 ) ( AVAILABLE ?auto_4203 ) ( SURFACE-AT ?auto_4197 ?auto_4198 ) ( ON ?auto_4197 ?auto_4199 ) ( CLEAR ?auto_4197 ) ( not ( = ?auto_4196 ?auto_4197 ) ) ( not ( = ?auto_4196 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4199 ) ) ( not ( = ?auto_4201 ?auto_4203 ) ) ( SURFACE-AT ?auto_4195 ?auto_4200 ) ( CLEAR ?auto_4195 ) ( IS-CRATE ?auto_4196 ) ( AVAILABLE ?auto_4201 ) ( not ( = ?auto_4204 ?auto_4200 ) ) ( HOIST-AT ?auto_4206 ?auto_4204 ) ( AVAILABLE ?auto_4206 ) ( SURFACE-AT ?auto_4196 ?auto_4204 ) ( ON ?auto_4196 ?auto_4205 ) ( CLEAR ?auto_4196 ) ( TRUCK-AT ?auto_4202 ?auto_4200 ) ( not ( = ?auto_4195 ?auto_4196 ) ) ( not ( = ?auto_4195 ?auto_4205 ) ) ( not ( = ?auto_4196 ?auto_4205 ) ) ( not ( = ?auto_4201 ?auto_4206 ) ) ( not ( = ?auto_4195 ?auto_4197 ) ) ( not ( = ?auto_4195 ?auto_4199 ) ) ( not ( = ?auto_4197 ?auto_4205 ) ) ( not ( = ?auto_4198 ?auto_4204 ) ) ( not ( = ?auto_4203 ?auto_4206 ) ) ( not ( = ?auto_4199 ?auto_4205 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4195 ?auto_4196 )
      ( MAKE-1CRATE ?auto_4196 ?auto_4197 )
      ( MAKE-2CRATE-VERIFY ?auto_4195 ?auto_4196 ?auto_4197 ) )
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
      ?auto_4225 - HOIST
      ?auto_4227 - PLACE
      ?auto_4229 - PLACE
      ?auto_4226 - HOIST
      ?auto_4230 - SURFACE
      ?auto_4233 - PLACE
      ?auto_4232 - HOIST
      ?auto_4234 - SURFACE
      ?auto_4231 - PLACE
      ?auto_4235 - HOIST
      ?auto_4236 - SURFACE
      ?auto_4228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4225 ?auto_4227 ) ( IS-CRATE ?auto_4224 ) ( not ( = ?auto_4229 ?auto_4227 ) ) ( HOIST-AT ?auto_4226 ?auto_4229 ) ( AVAILABLE ?auto_4226 ) ( SURFACE-AT ?auto_4224 ?auto_4229 ) ( ON ?auto_4224 ?auto_4230 ) ( CLEAR ?auto_4224 ) ( not ( = ?auto_4223 ?auto_4224 ) ) ( not ( = ?auto_4223 ?auto_4230 ) ) ( not ( = ?auto_4224 ?auto_4230 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( IS-CRATE ?auto_4223 ) ( not ( = ?auto_4233 ?auto_4227 ) ) ( HOIST-AT ?auto_4232 ?auto_4233 ) ( AVAILABLE ?auto_4232 ) ( SURFACE-AT ?auto_4223 ?auto_4233 ) ( ON ?auto_4223 ?auto_4234 ) ( CLEAR ?auto_4223 ) ( not ( = ?auto_4222 ?auto_4223 ) ) ( not ( = ?auto_4222 ?auto_4234 ) ) ( not ( = ?auto_4223 ?auto_4234 ) ) ( not ( = ?auto_4225 ?auto_4232 ) ) ( SURFACE-AT ?auto_4221 ?auto_4227 ) ( CLEAR ?auto_4221 ) ( IS-CRATE ?auto_4222 ) ( AVAILABLE ?auto_4225 ) ( not ( = ?auto_4231 ?auto_4227 ) ) ( HOIST-AT ?auto_4235 ?auto_4231 ) ( AVAILABLE ?auto_4235 ) ( SURFACE-AT ?auto_4222 ?auto_4231 ) ( ON ?auto_4222 ?auto_4236 ) ( CLEAR ?auto_4222 ) ( TRUCK-AT ?auto_4228 ?auto_4227 ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4236 ) ) ( not ( = ?auto_4222 ?auto_4236 ) ) ( not ( = ?auto_4225 ?auto_4235 ) ) ( not ( = ?auto_4221 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4234 ) ) ( not ( = ?auto_4223 ?auto_4236 ) ) ( not ( = ?auto_4233 ?auto_4231 ) ) ( not ( = ?auto_4232 ?auto_4235 ) ) ( not ( = ?auto_4234 ?auto_4236 ) ) ( not ( = ?auto_4221 ?auto_4224 ) ) ( not ( = ?auto_4221 ?auto_4230 ) ) ( not ( = ?auto_4222 ?auto_4224 ) ) ( not ( = ?auto_4222 ?auto_4230 ) ) ( not ( = ?auto_4224 ?auto_4234 ) ) ( not ( = ?auto_4224 ?auto_4236 ) ) ( not ( = ?auto_4229 ?auto_4233 ) ) ( not ( = ?auto_4229 ?auto_4231 ) ) ( not ( = ?auto_4226 ?auto_4232 ) ) ( not ( = ?auto_4226 ?auto_4235 ) ) ( not ( = ?auto_4230 ?auto_4234 ) ) ( not ( = ?auto_4230 ?auto_4236 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4221 ?auto_4222 ?auto_4223 )
      ( MAKE-1CRATE ?auto_4223 ?auto_4224 )
      ( MAKE-3CRATE-VERIFY ?auto_4221 ?auto_4222 ?auto_4223 ?auto_4224 ) )
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
      ?auto_4262 - HOIST
      ?auto_4259 - PLACE
      ?auto_4258 - PLACE
      ?auto_4260 - HOIST
      ?auto_4257 - SURFACE
      ?auto_4263 - PLACE
      ?auto_4268 - HOIST
      ?auto_4271 - SURFACE
      ?auto_4265 - PLACE
      ?auto_4270 - HOIST
      ?auto_4267 - SURFACE
      ?auto_4269 - PLACE
      ?auto_4266 - HOIST
      ?auto_4264 - SURFACE
      ?auto_4261 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4262 ?auto_4259 ) ( IS-CRATE ?auto_4256 ) ( not ( = ?auto_4258 ?auto_4259 ) ) ( HOIST-AT ?auto_4260 ?auto_4258 ) ( AVAILABLE ?auto_4260 ) ( SURFACE-AT ?auto_4256 ?auto_4258 ) ( ON ?auto_4256 ?auto_4257 ) ( CLEAR ?auto_4256 ) ( not ( = ?auto_4255 ?auto_4256 ) ) ( not ( = ?auto_4255 ?auto_4257 ) ) ( not ( = ?auto_4256 ?auto_4257 ) ) ( not ( = ?auto_4262 ?auto_4260 ) ) ( IS-CRATE ?auto_4255 ) ( not ( = ?auto_4263 ?auto_4259 ) ) ( HOIST-AT ?auto_4268 ?auto_4263 ) ( AVAILABLE ?auto_4268 ) ( SURFACE-AT ?auto_4255 ?auto_4263 ) ( ON ?auto_4255 ?auto_4271 ) ( CLEAR ?auto_4255 ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4254 ?auto_4271 ) ) ( not ( = ?auto_4255 ?auto_4271 ) ) ( not ( = ?auto_4262 ?auto_4268 ) ) ( IS-CRATE ?auto_4254 ) ( not ( = ?auto_4265 ?auto_4259 ) ) ( HOIST-AT ?auto_4270 ?auto_4265 ) ( AVAILABLE ?auto_4270 ) ( SURFACE-AT ?auto_4254 ?auto_4265 ) ( ON ?auto_4254 ?auto_4267 ) ( CLEAR ?auto_4254 ) ( not ( = ?auto_4253 ?auto_4254 ) ) ( not ( = ?auto_4253 ?auto_4267 ) ) ( not ( = ?auto_4254 ?auto_4267 ) ) ( not ( = ?auto_4262 ?auto_4270 ) ) ( SURFACE-AT ?auto_4252 ?auto_4259 ) ( CLEAR ?auto_4252 ) ( IS-CRATE ?auto_4253 ) ( AVAILABLE ?auto_4262 ) ( not ( = ?auto_4269 ?auto_4259 ) ) ( HOIST-AT ?auto_4266 ?auto_4269 ) ( AVAILABLE ?auto_4266 ) ( SURFACE-AT ?auto_4253 ?auto_4269 ) ( ON ?auto_4253 ?auto_4264 ) ( CLEAR ?auto_4253 ) ( TRUCK-AT ?auto_4261 ?auto_4259 ) ( not ( = ?auto_4252 ?auto_4253 ) ) ( not ( = ?auto_4252 ?auto_4264 ) ) ( not ( = ?auto_4253 ?auto_4264 ) ) ( not ( = ?auto_4262 ?auto_4266 ) ) ( not ( = ?auto_4252 ?auto_4254 ) ) ( not ( = ?auto_4252 ?auto_4267 ) ) ( not ( = ?auto_4254 ?auto_4264 ) ) ( not ( = ?auto_4265 ?auto_4269 ) ) ( not ( = ?auto_4270 ?auto_4266 ) ) ( not ( = ?auto_4267 ?auto_4264 ) ) ( not ( = ?auto_4252 ?auto_4255 ) ) ( not ( = ?auto_4252 ?auto_4271 ) ) ( not ( = ?auto_4253 ?auto_4255 ) ) ( not ( = ?auto_4253 ?auto_4271 ) ) ( not ( = ?auto_4255 ?auto_4267 ) ) ( not ( = ?auto_4255 ?auto_4264 ) ) ( not ( = ?auto_4263 ?auto_4265 ) ) ( not ( = ?auto_4263 ?auto_4269 ) ) ( not ( = ?auto_4268 ?auto_4270 ) ) ( not ( = ?auto_4268 ?auto_4266 ) ) ( not ( = ?auto_4271 ?auto_4267 ) ) ( not ( = ?auto_4271 ?auto_4264 ) ) ( not ( = ?auto_4252 ?auto_4256 ) ) ( not ( = ?auto_4252 ?auto_4257 ) ) ( not ( = ?auto_4253 ?auto_4256 ) ) ( not ( = ?auto_4253 ?auto_4257 ) ) ( not ( = ?auto_4254 ?auto_4256 ) ) ( not ( = ?auto_4254 ?auto_4257 ) ) ( not ( = ?auto_4256 ?auto_4271 ) ) ( not ( = ?auto_4256 ?auto_4267 ) ) ( not ( = ?auto_4256 ?auto_4264 ) ) ( not ( = ?auto_4258 ?auto_4263 ) ) ( not ( = ?auto_4258 ?auto_4265 ) ) ( not ( = ?auto_4258 ?auto_4269 ) ) ( not ( = ?auto_4260 ?auto_4268 ) ) ( not ( = ?auto_4260 ?auto_4270 ) ) ( not ( = ?auto_4260 ?auto_4266 ) ) ( not ( = ?auto_4257 ?auto_4271 ) ) ( not ( = ?auto_4257 ?auto_4267 ) ) ( not ( = ?auto_4257 ?auto_4264 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4252 ?auto_4253 ?auto_4254 ?auto_4255 )
      ( MAKE-1CRATE ?auto_4255 ?auto_4256 )
      ( MAKE-4CRATE-VERIFY ?auto_4252 ?auto_4253 ?auto_4254 ?auto_4255 ?auto_4256 ) )
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
      ?auto_4296 - HOIST
      ?auto_4298 - PLACE
      ?auto_4297 - PLACE
      ?auto_4294 - HOIST
      ?auto_4299 - SURFACE
      ?auto_4301 - PLACE
      ?auto_4311 - HOIST
      ?auto_4300 - SURFACE
      ?auto_4307 - PLACE
      ?auto_4305 - HOIST
      ?auto_4308 - SURFACE
      ?auto_4309 - PLACE
      ?auto_4302 - HOIST
      ?auto_4304 - SURFACE
      ?auto_4306 - PLACE
      ?auto_4303 - HOIST
      ?auto_4310 - SURFACE
      ?auto_4295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4296 ?auto_4298 ) ( IS-CRATE ?auto_4293 ) ( not ( = ?auto_4297 ?auto_4298 ) ) ( HOIST-AT ?auto_4294 ?auto_4297 ) ( AVAILABLE ?auto_4294 ) ( SURFACE-AT ?auto_4293 ?auto_4297 ) ( ON ?auto_4293 ?auto_4299 ) ( CLEAR ?auto_4293 ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4299 ) ) ( not ( = ?auto_4293 ?auto_4299 ) ) ( not ( = ?auto_4296 ?auto_4294 ) ) ( IS-CRATE ?auto_4292 ) ( not ( = ?auto_4301 ?auto_4298 ) ) ( HOIST-AT ?auto_4311 ?auto_4301 ) ( AVAILABLE ?auto_4311 ) ( SURFACE-AT ?auto_4292 ?auto_4301 ) ( ON ?auto_4292 ?auto_4300 ) ( CLEAR ?auto_4292 ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4300 ) ) ( not ( = ?auto_4292 ?auto_4300 ) ) ( not ( = ?auto_4296 ?auto_4311 ) ) ( IS-CRATE ?auto_4291 ) ( not ( = ?auto_4307 ?auto_4298 ) ) ( HOIST-AT ?auto_4305 ?auto_4307 ) ( AVAILABLE ?auto_4305 ) ( SURFACE-AT ?auto_4291 ?auto_4307 ) ( ON ?auto_4291 ?auto_4308 ) ( CLEAR ?auto_4291 ) ( not ( = ?auto_4290 ?auto_4291 ) ) ( not ( = ?auto_4290 ?auto_4308 ) ) ( not ( = ?auto_4291 ?auto_4308 ) ) ( not ( = ?auto_4296 ?auto_4305 ) ) ( IS-CRATE ?auto_4290 ) ( not ( = ?auto_4309 ?auto_4298 ) ) ( HOIST-AT ?auto_4302 ?auto_4309 ) ( AVAILABLE ?auto_4302 ) ( SURFACE-AT ?auto_4290 ?auto_4309 ) ( ON ?auto_4290 ?auto_4304 ) ( CLEAR ?auto_4290 ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4304 ) ) ( not ( = ?auto_4290 ?auto_4304 ) ) ( not ( = ?auto_4296 ?auto_4302 ) ) ( SURFACE-AT ?auto_4288 ?auto_4298 ) ( CLEAR ?auto_4288 ) ( IS-CRATE ?auto_4289 ) ( AVAILABLE ?auto_4296 ) ( not ( = ?auto_4306 ?auto_4298 ) ) ( HOIST-AT ?auto_4303 ?auto_4306 ) ( AVAILABLE ?auto_4303 ) ( SURFACE-AT ?auto_4289 ?auto_4306 ) ( ON ?auto_4289 ?auto_4310 ) ( CLEAR ?auto_4289 ) ( TRUCK-AT ?auto_4295 ?auto_4298 ) ( not ( = ?auto_4288 ?auto_4289 ) ) ( not ( = ?auto_4288 ?auto_4310 ) ) ( not ( = ?auto_4289 ?auto_4310 ) ) ( not ( = ?auto_4296 ?auto_4303 ) ) ( not ( = ?auto_4288 ?auto_4290 ) ) ( not ( = ?auto_4288 ?auto_4304 ) ) ( not ( = ?auto_4290 ?auto_4310 ) ) ( not ( = ?auto_4309 ?auto_4306 ) ) ( not ( = ?auto_4302 ?auto_4303 ) ) ( not ( = ?auto_4304 ?auto_4310 ) ) ( not ( = ?auto_4288 ?auto_4291 ) ) ( not ( = ?auto_4288 ?auto_4308 ) ) ( not ( = ?auto_4289 ?auto_4291 ) ) ( not ( = ?auto_4289 ?auto_4308 ) ) ( not ( = ?auto_4291 ?auto_4304 ) ) ( not ( = ?auto_4291 ?auto_4310 ) ) ( not ( = ?auto_4307 ?auto_4309 ) ) ( not ( = ?auto_4307 ?auto_4306 ) ) ( not ( = ?auto_4305 ?auto_4302 ) ) ( not ( = ?auto_4305 ?auto_4303 ) ) ( not ( = ?auto_4308 ?auto_4304 ) ) ( not ( = ?auto_4308 ?auto_4310 ) ) ( not ( = ?auto_4288 ?auto_4292 ) ) ( not ( = ?auto_4288 ?auto_4300 ) ) ( not ( = ?auto_4289 ?auto_4292 ) ) ( not ( = ?auto_4289 ?auto_4300 ) ) ( not ( = ?auto_4290 ?auto_4292 ) ) ( not ( = ?auto_4290 ?auto_4300 ) ) ( not ( = ?auto_4292 ?auto_4308 ) ) ( not ( = ?auto_4292 ?auto_4304 ) ) ( not ( = ?auto_4292 ?auto_4310 ) ) ( not ( = ?auto_4301 ?auto_4307 ) ) ( not ( = ?auto_4301 ?auto_4309 ) ) ( not ( = ?auto_4301 ?auto_4306 ) ) ( not ( = ?auto_4311 ?auto_4305 ) ) ( not ( = ?auto_4311 ?auto_4302 ) ) ( not ( = ?auto_4311 ?auto_4303 ) ) ( not ( = ?auto_4300 ?auto_4308 ) ) ( not ( = ?auto_4300 ?auto_4304 ) ) ( not ( = ?auto_4300 ?auto_4310 ) ) ( not ( = ?auto_4288 ?auto_4293 ) ) ( not ( = ?auto_4288 ?auto_4299 ) ) ( not ( = ?auto_4289 ?auto_4293 ) ) ( not ( = ?auto_4289 ?auto_4299 ) ) ( not ( = ?auto_4290 ?auto_4293 ) ) ( not ( = ?auto_4290 ?auto_4299 ) ) ( not ( = ?auto_4291 ?auto_4293 ) ) ( not ( = ?auto_4291 ?auto_4299 ) ) ( not ( = ?auto_4293 ?auto_4300 ) ) ( not ( = ?auto_4293 ?auto_4308 ) ) ( not ( = ?auto_4293 ?auto_4304 ) ) ( not ( = ?auto_4293 ?auto_4310 ) ) ( not ( = ?auto_4297 ?auto_4301 ) ) ( not ( = ?auto_4297 ?auto_4307 ) ) ( not ( = ?auto_4297 ?auto_4309 ) ) ( not ( = ?auto_4297 ?auto_4306 ) ) ( not ( = ?auto_4294 ?auto_4311 ) ) ( not ( = ?auto_4294 ?auto_4305 ) ) ( not ( = ?auto_4294 ?auto_4302 ) ) ( not ( = ?auto_4294 ?auto_4303 ) ) ( not ( = ?auto_4299 ?auto_4300 ) ) ( not ( = ?auto_4299 ?auto_4308 ) ) ( not ( = ?auto_4299 ?auto_4304 ) ) ( not ( = ?auto_4299 ?auto_4310 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4288 ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 )
      ( MAKE-1CRATE ?auto_4292 ?auto_4293 )
      ( MAKE-5CRATE-VERIFY ?auto_4288 ?auto_4289 ?auto_4290 ?auto_4291 ?auto_4292 ?auto_4293 ) )
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
      ?auto_4336 - PLACE
      ?auto_4338 - PLACE
      ?auto_4339 - HOIST
      ?auto_4337 - SURFACE
      ?auto_4356 - PLACE
      ?auto_4342 - HOIST
      ?auto_4343 - SURFACE
      ?auto_4354 - PLACE
      ?auto_4347 - HOIST
      ?auto_4349 - SURFACE
      ?auto_4344 - PLACE
      ?auto_4353 - HOIST
      ?auto_4346 - SURFACE
      ?auto_4355 - PLACE
      ?auto_4348 - HOIST
      ?auto_4351 - SURFACE
      ?auto_4352 - PLACE
      ?auto_4350 - HOIST
      ?auto_4345 - SURFACE
      ?auto_4341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4340 ?auto_4336 ) ( IS-CRATE ?auto_4335 ) ( not ( = ?auto_4338 ?auto_4336 ) ) ( HOIST-AT ?auto_4339 ?auto_4338 ) ( AVAILABLE ?auto_4339 ) ( SURFACE-AT ?auto_4335 ?auto_4338 ) ( ON ?auto_4335 ?auto_4337 ) ( CLEAR ?auto_4335 ) ( not ( = ?auto_4334 ?auto_4335 ) ) ( not ( = ?auto_4334 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4337 ) ) ( not ( = ?auto_4340 ?auto_4339 ) ) ( IS-CRATE ?auto_4334 ) ( not ( = ?auto_4356 ?auto_4336 ) ) ( HOIST-AT ?auto_4342 ?auto_4356 ) ( AVAILABLE ?auto_4342 ) ( SURFACE-AT ?auto_4334 ?auto_4356 ) ( ON ?auto_4334 ?auto_4343 ) ( CLEAR ?auto_4334 ) ( not ( = ?auto_4333 ?auto_4334 ) ) ( not ( = ?auto_4333 ?auto_4343 ) ) ( not ( = ?auto_4334 ?auto_4343 ) ) ( not ( = ?auto_4340 ?auto_4342 ) ) ( IS-CRATE ?auto_4333 ) ( not ( = ?auto_4354 ?auto_4336 ) ) ( HOIST-AT ?auto_4347 ?auto_4354 ) ( AVAILABLE ?auto_4347 ) ( SURFACE-AT ?auto_4333 ?auto_4354 ) ( ON ?auto_4333 ?auto_4349 ) ( CLEAR ?auto_4333 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4349 ) ) ( not ( = ?auto_4333 ?auto_4349 ) ) ( not ( = ?auto_4340 ?auto_4347 ) ) ( IS-CRATE ?auto_4332 ) ( not ( = ?auto_4344 ?auto_4336 ) ) ( HOIST-AT ?auto_4353 ?auto_4344 ) ( AVAILABLE ?auto_4353 ) ( SURFACE-AT ?auto_4332 ?auto_4344 ) ( ON ?auto_4332 ?auto_4346 ) ( CLEAR ?auto_4332 ) ( not ( = ?auto_4331 ?auto_4332 ) ) ( not ( = ?auto_4331 ?auto_4346 ) ) ( not ( = ?auto_4332 ?auto_4346 ) ) ( not ( = ?auto_4340 ?auto_4353 ) ) ( IS-CRATE ?auto_4331 ) ( not ( = ?auto_4355 ?auto_4336 ) ) ( HOIST-AT ?auto_4348 ?auto_4355 ) ( AVAILABLE ?auto_4348 ) ( SURFACE-AT ?auto_4331 ?auto_4355 ) ( ON ?auto_4331 ?auto_4351 ) ( CLEAR ?auto_4331 ) ( not ( = ?auto_4330 ?auto_4331 ) ) ( not ( = ?auto_4330 ?auto_4351 ) ) ( not ( = ?auto_4331 ?auto_4351 ) ) ( not ( = ?auto_4340 ?auto_4348 ) ) ( SURFACE-AT ?auto_4329 ?auto_4336 ) ( CLEAR ?auto_4329 ) ( IS-CRATE ?auto_4330 ) ( AVAILABLE ?auto_4340 ) ( not ( = ?auto_4352 ?auto_4336 ) ) ( HOIST-AT ?auto_4350 ?auto_4352 ) ( AVAILABLE ?auto_4350 ) ( SURFACE-AT ?auto_4330 ?auto_4352 ) ( ON ?auto_4330 ?auto_4345 ) ( CLEAR ?auto_4330 ) ( TRUCK-AT ?auto_4341 ?auto_4336 ) ( not ( = ?auto_4329 ?auto_4330 ) ) ( not ( = ?auto_4329 ?auto_4345 ) ) ( not ( = ?auto_4330 ?auto_4345 ) ) ( not ( = ?auto_4340 ?auto_4350 ) ) ( not ( = ?auto_4329 ?auto_4331 ) ) ( not ( = ?auto_4329 ?auto_4351 ) ) ( not ( = ?auto_4331 ?auto_4345 ) ) ( not ( = ?auto_4355 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4350 ) ) ( not ( = ?auto_4351 ?auto_4345 ) ) ( not ( = ?auto_4329 ?auto_4332 ) ) ( not ( = ?auto_4329 ?auto_4346 ) ) ( not ( = ?auto_4330 ?auto_4332 ) ) ( not ( = ?auto_4330 ?auto_4346 ) ) ( not ( = ?auto_4332 ?auto_4351 ) ) ( not ( = ?auto_4332 ?auto_4345 ) ) ( not ( = ?auto_4344 ?auto_4355 ) ) ( not ( = ?auto_4344 ?auto_4352 ) ) ( not ( = ?auto_4353 ?auto_4348 ) ) ( not ( = ?auto_4353 ?auto_4350 ) ) ( not ( = ?auto_4346 ?auto_4351 ) ) ( not ( = ?auto_4346 ?auto_4345 ) ) ( not ( = ?auto_4329 ?auto_4333 ) ) ( not ( = ?auto_4329 ?auto_4349 ) ) ( not ( = ?auto_4330 ?auto_4333 ) ) ( not ( = ?auto_4330 ?auto_4349 ) ) ( not ( = ?auto_4331 ?auto_4333 ) ) ( not ( = ?auto_4331 ?auto_4349 ) ) ( not ( = ?auto_4333 ?auto_4346 ) ) ( not ( = ?auto_4333 ?auto_4351 ) ) ( not ( = ?auto_4333 ?auto_4345 ) ) ( not ( = ?auto_4354 ?auto_4344 ) ) ( not ( = ?auto_4354 ?auto_4355 ) ) ( not ( = ?auto_4354 ?auto_4352 ) ) ( not ( = ?auto_4347 ?auto_4353 ) ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4346 ) ) ( not ( = ?auto_4349 ?auto_4351 ) ) ( not ( = ?auto_4349 ?auto_4345 ) ) ( not ( = ?auto_4329 ?auto_4334 ) ) ( not ( = ?auto_4329 ?auto_4343 ) ) ( not ( = ?auto_4330 ?auto_4334 ) ) ( not ( = ?auto_4330 ?auto_4343 ) ) ( not ( = ?auto_4331 ?auto_4334 ) ) ( not ( = ?auto_4331 ?auto_4343 ) ) ( not ( = ?auto_4332 ?auto_4334 ) ) ( not ( = ?auto_4332 ?auto_4343 ) ) ( not ( = ?auto_4334 ?auto_4349 ) ) ( not ( = ?auto_4334 ?auto_4346 ) ) ( not ( = ?auto_4334 ?auto_4351 ) ) ( not ( = ?auto_4334 ?auto_4345 ) ) ( not ( = ?auto_4356 ?auto_4354 ) ) ( not ( = ?auto_4356 ?auto_4344 ) ) ( not ( = ?auto_4356 ?auto_4355 ) ) ( not ( = ?auto_4356 ?auto_4352 ) ) ( not ( = ?auto_4342 ?auto_4347 ) ) ( not ( = ?auto_4342 ?auto_4353 ) ) ( not ( = ?auto_4342 ?auto_4348 ) ) ( not ( = ?auto_4342 ?auto_4350 ) ) ( not ( = ?auto_4343 ?auto_4349 ) ) ( not ( = ?auto_4343 ?auto_4346 ) ) ( not ( = ?auto_4343 ?auto_4351 ) ) ( not ( = ?auto_4343 ?auto_4345 ) ) ( not ( = ?auto_4329 ?auto_4335 ) ) ( not ( = ?auto_4329 ?auto_4337 ) ) ( not ( = ?auto_4330 ?auto_4335 ) ) ( not ( = ?auto_4330 ?auto_4337 ) ) ( not ( = ?auto_4331 ?auto_4335 ) ) ( not ( = ?auto_4331 ?auto_4337 ) ) ( not ( = ?auto_4332 ?auto_4335 ) ) ( not ( = ?auto_4332 ?auto_4337 ) ) ( not ( = ?auto_4333 ?auto_4335 ) ) ( not ( = ?auto_4333 ?auto_4337 ) ) ( not ( = ?auto_4335 ?auto_4343 ) ) ( not ( = ?auto_4335 ?auto_4349 ) ) ( not ( = ?auto_4335 ?auto_4346 ) ) ( not ( = ?auto_4335 ?auto_4351 ) ) ( not ( = ?auto_4335 ?auto_4345 ) ) ( not ( = ?auto_4338 ?auto_4356 ) ) ( not ( = ?auto_4338 ?auto_4354 ) ) ( not ( = ?auto_4338 ?auto_4344 ) ) ( not ( = ?auto_4338 ?auto_4355 ) ) ( not ( = ?auto_4338 ?auto_4352 ) ) ( not ( = ?auto_4339 ?auto_4342 ) ) ( not ( = ?auto_4339 ?auto_4347 ) ) ( not ( = ?auto_4339 ?auto_4353 ) ) ( not ( = ?auto_4339 ?auto_4348 ) ) ( not ( = ?auto_4339 ?auto_4350 ) ) ( not ( = ?auto_4337 ?auto_4343 ) ) ( not ( = ?auto_4337 ?auto_4349 ) ) ( not ( = ?auto_4337 ?auto_4346 ) ) ( not ( = ?auto_4337 ?auto_4351 ) ) ( not ( = ?auto_4337 ?auto_4345 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4329 ?auto_4330 ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4334 )
      ( MAKE-1CRATE ?auto_4334 ?auto_4335 )
      ( MAKE-6CRATE-VERIFY ?auto_4329 ?auto_4330 ?auto_4331 ?auto_4332 ?auto_4333 ?auto_4334 ?auto_4335 ) )
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
      ?auto_4386 - HOIST
      ?auto_4388 - PLACE
      ?auto_4387 - PLACE
      ?auto_4383 - HOIST
      ?auto_4384 - SURFACE
      ?auto_4397 - PLACE
      ?auto_4406 - HOIST
      ?auto_4401 - SURFACE
      ?auto_4393 - PLACE
      ?auto_4395 - HOIST
      ?auto_4394 - SURFACE
      ?auto_4404 - PLACE
      ?auto_4398 - HOIST
      ?auto_4403 - SURFACE
      ?auto_4390 - PLACE
      ?auto_4396 - HOIST
      ?auto_4402 - SURFACE
      ?auto_4400 - PLACE
      ?auto_4392 - HOIST
      ?auto_4389 - SURFACE
      ?auto_4399 - PLACE
      ?auto_4405 - HOIST
      ?auto_4391 - SURFACE
      ?auto_4385 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4386 ?auto_4388 ) ( IS-CRATE ?auto_4382 ) ( not ( = ?auto_4387 ?auto_4388 ) ) ( HOIST-AT ?auto_4383 ?auto_4387 ) ( AVAILABLE ?auto_4383 ) ( SURFACE-AT ?auto_4382 ?auto_4387 ) ( ON ?auto_4382 ?auto_4384 ) ( CLEAR ?auto_4382 ) ( not ( = ?auto_4381 ?auto_4382 ) ) ( not ( = ?auto_4381 ?auto_4384 ) ) ( not ( = ?auto_4382 ?auto_4384 ) ) ( not ( = ?auto_4386 ?auto_4383 ) ) ( IS-CRATE ?auto_4381 ) ( not ( = ?auto_4397 ?auto_4388 ) ) ( HOIST-AT ?auto_4406 ?auto_4397 ) ( AVAILABLE ?auto_4406 ) ( SURFACE-AT ?auto_4381 ?auto_4397 ) ( ON ?auto_4381 ?auto_4401 ) ( CLEAR ?auto_4381 ) ( not ( = ?auto_4380 ?auto_4381 ) ) ( not ( = ?auto_4380 ?auto_4401 ) ) ( not ( = ?auto_4381 ?auto_4401 ) ) ( not ( = ?auto_4386 ?auto_4406 ) ) ( IS-CRATE ?auto_4380 ) ( not ( = ?auto_4393 ?auto_4388 ) ) ( HOIST-AT ?auto_4395 ?auto_4393 ) ( AVAILABLE ?auto_4395 ) ( SURFACE-AT ?auto_4380 ?auto_4393 ) ( ON ?auto_4380 ?auto_4394 ) ( CLEAR ?auto_4380 ) ( not ( = ?auto_4379 ?auto_4380 ) ) ( not ( = ?auto_4379 ?auto_4394 ) ) ( not ( = ?auto_4380 ?auto_4394 ) ) ( not ( = ?auto_4386 ?auto_4395 ) ) ( IS-CRATE ?auto_4379 ) ( not ( = ?auto_4404 ?auto_4388 ) ) ( HOIST-AT ?auto_4398 ?auto_4404 ) ( AVAILABLE ?auto_4398 ) ( SURFACE-AT ?auto_4379 ?auto_4404 ) ( ON ?auto_4379 ?auto_4403 ) ( CLEAR ?auto_4379 ) ( not ( = ?auto_4378 ?auto_4379 ) ) ( not ( = ?auto_4378 ?auto_4403 ) ) ( not ( = ?auto_4379 ?auto_4403 ) ) ( not ( = ?auto_4386 ?auto_4398 ) ) ( IS-CRATE ?auto_4378 ) ( not ( = ?auto_4390 ?auto_4388 ) ) ( HOIST-AT ?auto_4396 ?auto_4390 ) ( AVAILABLE ?auto_4396 ) ( SURFACE-AT ?auto_4378 ?auto_4390 ) ( ON ?auto_4378 ?auto_4402 ) ( CLEAR ?auto_4378 ) ( not ( = ?auto_4377 ?auto_4378 ) ) ( not ( = ?auto_4377 ?auto_4402 ) ) ( not ( = ?auto_4378 ?auto_4402 ) ) ( not ( = ?auto_4386 ?auto_4396 ) ) ( IS-CRATE ?auto_4377 ) ( not ( = ?auto_4400 ?auto_4388 ) ) ( HOIST-AT ?auto_4392 ?auto_4400 ) ( AVAILABLE ?auto_4392 ) ( SURFACE-AT ?auto_4377 ?auto_4400 ) ( ON ?auto_4377 ?auto_4389 ) ( CLEAR ?auto_4377 ) ( not ( = ?auto_4376 ?auto_4377 ) ) ( not ( = ?auto_4376 ?auto_4389 ) ) ( not ( = ?auto_4377 ?auto_4389 ) ) ( not ( = ?auto_4386 ?auto_4392 ) ) ( SURFACE-AT ?auto_4375 ?auto_4388 ) ( CLEAR ?auto_4375 ) ( IS-CRATE ?auto_4376 ) ( AVAILABLE ?auto_4386 ) ( not ( = ?auto_4399 ?auto_4388 ) ) ( HOIST-AT ?auto_4405 ?auto_4399 ) ( AVAILABLE ?auto_4405 ) ( SURFACE-AT ?auto_4376 ?auto_4399 ) ( ON ?auto_4376 ?auto_4391 ) ( CLEAR ?auto_4376 ) ( TRUCK-AT ?auto_4385 ?auto_4388 ) ( not ( = ?auto_4375 ?auto_4376 ) ) ( not ( = ?auto_4375 ?auto_4391 ) ) ( not ( = ?auto_4376 ?auto_4391 ) ) ( not ( = ?auto_4386 ?auto_4405 ) ) ( not ( = ?auto_4375 ?auto_4377 ) ) ( not ( = ?auto_4375 ?auto_4389 ) ) ( not ( = ?auto_4377 ?auto_4391 ) ) ( not ( = ?auto_4400 ?auto_4399 ) ) ( not ( = ?auto_4392 ?auto_4405 ) ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4375 ?auto_4378 ) ) ( not ( = ?auto_4375 ?auto_4402 ) ) ( not ( = ?auto_4376 ?auto_4378 ) ) ( not ( = ?auto_4376 ?auto_4402 ) ) ( not ( = ?auto_4378 ?auto_4389 ) ) ( not ( = ?auto_4378 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4400 ) ) ( not ( = ?auto_4390 ?auto_4399 ) ) ( not ( = ?auto_4396 ?auto_4392 ) ) ( not ( = ?auto_4396 ?auto_4405 ) ) ( not ( = ?auto_4402 ?auto_4389 ) ) ( not ( = ?auto_4402 ?auto_4391 ) ) ( not ( = ?auto_4375 ?auto_4379 ) ) ( not ( = ?auto_4375 ?auto_4403 ) ) ( not ( = ?auto_4376 ?auto_4379 ) ) ( not ( = ?auto_4376 ?auto_4403 ) ) ( not ( = ?auto_4377 ?auto_4379 ) ) ( not ( = ?auto_4377 ?auto_4403 ) ) ( not ( = ?auto_4379 ?auto_4402 ) ) ( not ( = ?auto_4379 ?auto_4389 ) ) ( not ( = ?auto_4379 ?auto_4391 ) ) ( not ( = ?auto_4404 ?auto_4390 ) ) ( not ( = ?auto_4404 ?auto_4400 ) ) ( not ( = ?auto_4404 ?auto_4399 ) ) ( not ( = ?auto_4398 ?auto_4396 ) ) ( not ( = ?auto_4398 ?auto_4392 ) ) ( not ( = ?auto_4398 ?auto_4405 ) ) ( not ( = ?auto_4403 ?auto_4402 ) ) ( not ( = ?auto_4403 ?auto_4389 ) ) ( not ( = ?auto_4403 ?auto_4391 ) ) ( not ( = ?auto_4375 ?auto_4380 ) ) ( not ( = ?auto_4375 ?auto_4394 ) ) ( not ( = ?auto_4376 ?auto_4380 ) ) ( not ( = ?auto_4376 ?auto_4394 ) ) ( not ( = ?auto_4377 ?auto_4380 ) ) ( not ( = ?auto_4377 ?auto_4394 ) ) ( not ( = ?auto_4378 ?auto_4380 ) ) ( not ( = ?auto_4378 ?auto_4394 ) ) ( not ( = ?auto_4380 ?auto_4403 ) ) ( not ( = ?auto_4380 ?auto_4402 ) ) ( not ( = ?auto_4380 ?auto_4389 ) ) ( not ( = ?auto_4380 ?auto_4391 ) ) ( not ( = ?auto_4393 ?auto_4404 ) ) ( not ( = ?auto_4393 ?auto_4390 ) ) ( not ( = ?auto_4393 ?auto_4400 ) ) ( not ( = ?auto_4393 ?auto_4399 ) ) ( not ( = ?auto_4395 ?auto_4398 ) ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4392 ) ) ( not ( = ?auto_4395 ?auto_4405 ) ) ( not ( = ?auto_4394 ?auto_4403 ) ) ( not ( = ?auto_4394 ?auto_4402 ) ) ( not ( = ?auto_4394 ?auto_4389 ) ) ( not ( = ?auto_4394 ?auto_4391 ) ) ( not ( = ?auto_4375 ?auto_4381 ) ) ( not ( = ?auto_4375 ?auto_4401 ) ) ( not ( = ?auto_4376 ?auto_4381 ) ) ( not ( = ?auto_4376 ?auto_4401 ) ) ( not ( = ?auto_4377 ?auto_4381 ) ) ( not ( = ?auto_4377 ?auto_4401 ) ) ( not ( = ?auto_4378 ?auto_4381 ) ) ( not ( = ?auto_4378 ?auto_4401 ) ) ( not ( = ?auto_4379 ?auto_4381 ) ) ( not ( = ?auto_4379 ?auto_4401 ) ) ( not ( = ?auto_4381 ?auto_4394 ) ) ( not ( = ?auto_4381 ?auto_4403 ) ) ( not ( = ?auto_4381 ?auto_4402 ) ) ( not ( = ?auto_4381 ?auto_4389 ) ) ( not ( = ?auto_4381 ?auto_4391 ) ) ( not ( = ?auto_4397 ?auto_4393 ) ) ( not ( = ?auto_4397 ?auto_4404 ) ) ( not ( = ?auto_4397 ?auto_4390 ) ) ( not ( = ?auto_4397 ?auto_4400 ) ) ( not ( = ?auto_4397 ?auto_4399 ) ) ( not ( = ?auto_4406 ?auto_4395 ) ) ( not ( = ?auto_4406 ?auto_4398 ) ) ( not ( = ?auto_4406 ?auto_4396 ) ) ( not ( = ?auto_4406 ?auto_4392 ) ) ( not ( = ?auto_4406 ?auto_4405 ) ) ( not ( = ?auto_4401 ?auto_4394 ) ) ( not ( = ?auto_4401 ?auto_4403 ) ) ( not ( = ?auto_4401 ?auto_4402 ) ) ( not ( = ?auto_4401 ?auto_4389 ) ) ( not ( = ?auto_4401 ?auto_4391 ) ) ( not ( = ?auto_4375 ?auto_4382 ) ) ( not ( = ?auto_4375 ?auto_4384 ) ) ( not ( = ?auto_4376 ?auto_4382 ) ) ( not ( = ?auto_4376 ?auto_4384 ) ) ( not ( = ?auto_4377 ?auto_4382 ) ) ( not ( = ?auto_4377 ?auto_4384 ) ) ( not ( = ?auto_4378 ?auto_4382 ) ) ( not ( = ?auto_4378 ?auto_4384 ) ) ( not ( = ?auto_4379 ?auto_4382 ) ) ( not ( = ?auto_4379 ?auto_4384 ) ) ( not ( = ?auto_4380 ?auto_4382 ) ) ( not ( = ?auto_4380 ?auto_4384 ) ) ( not ( = ?auto_4382 ?auto_4401 ) ) ( not ( = ?auto_4382 ?auto_4394 ) ) ( not ( = ?auto_4382 ?auto_4403 ) ) ( not ( = ?auto_4382 ?auto_4402 ) ) ( not ( = ?auto_4382 ?auto_4389 ) ) ( not ( = ?auto_4382 ?auto_4391 ) ) ( not ( = ?auto_4387 ?auto_4397 ) ) ( not ( = ?auto_4387 ?auto_4393 ) ) ( not ( = ?auto_4387 ?auto_4404 ) ) ( not ( = ?auto_4387 ?auto_4390 ) ) ( not ( = ?auto_4387 ?auto_4400 ) ) ( not ( = ?auto_4387 ?auto_4399 ) ) ( not ( = ?auto_4383 ?auto_4406 ) ) ( not ( = ?auto_4383 ?auto_4395 ) ) ( not ( = ?auto_4383 ?auto_4398 ) ) ( not ( = ?auto_4383 ?auto_4396 ) ) ( not ( = ?auto_4383 ?auto_4392 ) ) ( not ( = ?auto_4383 ?auto_4405 ) ) ( not ( = ?auto_4384 ?auto_4401 ) ) ( not ( = ?auto_4384 ?auto_4394 ) ) ( not ( = ?auto_4384 ?auto_4403 ) ) ( not ( = ?auto_4384 ?auto_4402 ) ) ( not ( = ?auto_4384 ?auto_4389 ) ) ( not ( = ?auto_4384 ?auto_4391 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4375 ?auto_4376 ?auto_4377 ?auto_4378 ?auto_4379 ?auto_4380 ?auto_4381 )
      ( MAKE-1CRATE ?auto_4381 ?auto_4382 )
      ( MAKE-7CRATE-VERIFY ?auto_4375 ?auto_4376 ?auto_4377 ?auto_4378 ?auto_4379 ?auto_4380 ?auto_4381 ?auto_4382 ) )
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
      ?auto_4433 - SURFACE
      ?auto_4434 - SURFACE
    )
    :vars
    (
      ?auto_4440 - HOIST
      ?auto_4439 - PLACE
      ?auto_4435 - PLACE
      ?auto_4436 - HOIST
      ?auto_4437 - SURFACE
      ?auto_4453 - PLACE
      ?auto_4460 - HOIST
      ?auto_4459 - SURFACE
      ?auto_4442 - PLACE
      ?auto_4458 - HOIST
      ?auto_4444 - SURFACE
      ?auto_4449 - PLACE
      ?auto_4441 - HOIST
      ?auto_4447 - SURFACE
      ?auto_4446 - PLACE
      ?auto_4455 - HOIST
      ?auto_4445 - SURFACE
      ?auto_4457 - PLACE
      ?auto_4448 - HOIST
      ?auto_4443 - SURFACE
      ?auto_4456 - PLACE
      ?auto_4452 - HOIST
      ?auto_4451 - SURFACE
      ?auto_4454 - PLACE
      ?auto_4461 - HOIST
      ?auto_4450 - SURFACE
      ?auto_4438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4440 ?auto_4439 ) ( IS-CRATE ?auto_4434 ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( HOIST-AT ?auto_4436 ?auto_4435 ) ( AVAILABLE ?auto_4436 ) ( SURFACE-AT ?auto_4434 ?auto_4435 ) ( ON ?auto_4434 ?auto_4437 ) ( CLEAR ?auto_4434 ) ( not ( = ?auto_4433 ?auto_4434 ) ) ( not ( = ?auto_4433 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( not ( = ?auto_4440 ?auto_4436 ) ) ( IS-CRATE ?auto_4433 ) ( not ( = ?auto_4453 ?auto_4439 ) ) ( HOIST-AT ?auto_4460 ?auto_4453 ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4433 ?auto_4453 ) ( ON ?auto_4433 ?auto_4459 ) ( CLEAR ?auto_4433 ) ( not ( = ?auto_4432 ?auto_4433 ) ) ( not ( = ?auto_4432 ?auto_4459 ) ) ( not ( = ?auto_4433 ?auto_4459 ) ) ( not ( = ?auto_4440 ?auto_4460 ) ) ( IS-CRATE ?auto_4432 ) ( not ( = ?auto_4442 ?auto_4439 ) ) ( HOIST-AT ?auto_4458 ?auto_4442 ) ( AVAILABLE ?auto_4458 ) ( SURFACE-AT ?auto_4432 ?auto_4442 ) ( ON ?auto_4432 ?auto_4444 ) ( CLEAR ?auto_4432 ) ( not ( = ?auto_4431 ?auto_4432 ) ) ( not ( = ?auto_4431 ?auto_4444 ) ) ( not ( = ?auto_4432 ?auto_4444 ) ) ( not ( = ?auto_4440 ?auto_4458 ) ) ( IS-CRATE ?auto_4431 ) ( not ( = ?auto_4449 ?auto_4439 ) ) ( HOIST-AT ?auto_4441 ?auto_4449 ) ( AVAILABLE ?auto_4441 ) ( SURFACE-AT ?auto_4431 ?auto_4449 ) ( ON ?auto_4431 ?auto_4447 ) ( CLEAR ?auto_4431 ) ( not ( = ?auto_4430 ?auto_4431 ) ) ( not ( = ?auto_4430 ?auto_4447 ) ) ( not ( = ?auto_4431 ?auto_4447 ) ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( IS-CRATE ?auto_4430 ) ( not ( = ?auto_4446 ?auto_4439 ) ) ( HOIST-AT ?auto_4455 ?auto_4446 ) ( AVAILABLE ?auto_4455 ) ( SURFACE-AT ?auto_4430 ?auto_4446 ) ( ON ?auto_4430 ?auto_4445 ) ( CLEAR ?auto_4430 ) ( not ( = ?auto_4429 ?auto_4430 ) ) ( not ( = ?auto_4429 ?auto_4445 ) ) ( not ( = ?auto_4430 ?auto_4445 ) ) ( not ( = ?auto_4440 ?auto_4455 ) ) ( IS-CRATE ?auto_4429 ) ( not ( = ?auto_4457 ?auto_4439 ) ) ( HOIST-AT ?auto_4448 ?auto_4457 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4429 ?auto_4457 ) ( ON ?auto_4429 ?auto_4443 ) ( CLEAR ?auto_4429 ) ( not ( = ?auto_4428 ?auto_4429 ) ) ( not ( = ?auto_4428 ?auto_4443 ) ) ( not ( = ?auto_4429 ?auto_4443 ) ) ( not ( = ?auto_4440 ?auto_4448 ) ) ( IS-CRATE ?auto_4428 ) ( not ( = ?auto_4456 ?auto_4439 ) ) ( HOIST-AT ?auto_4452 ?auto_4456 ) ( AVAILABLE ?auto_4452 ) ( SURFACE-AT ?auto_4428 ?auto_4456 ) ( ON ?auto_4428 ?auto_4451 ) ( CLEAR ?auto_4428 ) ( not ( = ?auto_4427 ?auto_4428 ) ) ( not ( = ?auto_4427 ?auto_4451 ) ) ( not ( = ?auto_4428 ?auto_4451 ) ) ( not ( = ?auto_4440 ?auto_4452 ) ) ( SURFACE-AT ?auto_4426 ?auto_4439 ) ( CLEAR ?auto_4426 ) ( IS-CRATE ?auto_4427 ) ( AVAILABLE ?auto_4440 ) ( not ( = ?auto_4454 ?auto_4439 ) ) ( HOIST-AT ?auto_4461 ?auto_4454 ) ( AVAILABLE ?auto_4461 ) ( SURFACE-AT ?auto_4427 ?auto_4454 ) ( ON ?auto_4427 ?auto_4450 ) ( CLEAR ?auto_4427 ) ( TRUCK-AT ?auto_4438 ?auto_4439 ) ( not ( = ?auto_4426 ?auto_4427 ) ) ( not ( = ?auto_4426 ?auto_4450 ) ) ( not ( = ?auto_4427 ?auto_4450 ) ) ( not ( = ?auto_4440 ?auto_4461 ) ) ( not ( = ?auto_4426 ?auto_4428 ) ) ( not ( = ?auto_4426 ?auto_4451 ) ) ( not ( = ?auto_4428 ?auto_4450 ) ) ( not ( = ?auto_4456 ?auto_4454 ) ) ( not ( = ?auto_4452 ?auto_4461 ) ) ( not ( = ?auto_4451 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4429 ) ) ( not ( = ?auto_4426 ?auto_4443 ) ) ( not ( = ?auto_4427 ?auto_4429 ) ) ( not ( = ?auto_4427 ?auto_4443 ) ) ( not ( = ?auto_4429 ?auto_4451 ) ) ( not ( = ?auto_4429 ?auto_4450 ) ) ( not ( = ?auto_4457 ?auto_4456 ) ) ( not ( = ?auto_4457 ?auto_4454 ) ) ( not ( = ?auto_4448 ?auto_4452 ) ) ( not ( = ?auto_4448 ?auto_4461 ) ) ( not ( = ?auto_4443 ?auto_4451 ) ) ( not ( = ?auto_4443 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4430 ) ) ( not ( = ?auto_4426 ?auto_4445 ) ) ( not ( = ?auto_4427 ?auto_4430 ) ) ( not ( = ?auto_4427 ?auto_4445 ) ) ( not ( = ?auto_4428 ?auto_4430 ) ) ( not ( = ?auto_4428 ?auto_4445 ) ) ( not ( = ?auto_4430 ?auto_4443 ) ) ( not ( = ?auto_4430 ?auto_4451 ) ) ( not ( = ?auto_4430 ?auto_4450 ) ) ( not ( = ?auto_4446 ?auto_4457 ) ) ( not ( = ?auto_4446 ?auto_4456 ) ) ( not ( = ?auto_4446 ?auto_4454 ) ) ( not ( = ?auto_4455 ?auto_4448 ) ) ( not ( = ?auto_4455 ?auto_4452 ) ) ( not ( = ?auto_4455 ?auto_4461 ) ) ( not ( = ?auto_4445 ?auto_4443 ) ) ( not ( = ?auto_4445 ?auto_4451 ) ) ( not ( = ?auto_4445 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4431 ) ) ( not ( = ?auto_4426 ?auto_4447 ) ) ( not ( = ?auto_4427 ?auto_4431 ) ) ( not ( = ?auto_4427 ?auto_4447 ) ) ( not ( = ?auto_4428 ?auto_4431 ) ) ( not ( = ?auto_4428 ?auto_4447 ) ) ( not ( = ?auto_4429 ?auto_4431 ) ) ( not ( = ?auto_4429 ?auto_4447 ) ) ( not ( = ?auto_4431 ?auto_4445 ) ) ( not ( = ?auto_4431 ?auto_4443 ) ) ( not ( = ?auto_4431 ?auto_4451 ) ) ( not ( = ?auto_4431 ?auto_4450 ) ) ( not ( = ?auto_4449 ?auto_4446 ) ) ( not ( = ?auto_4449 ?auto_4457 ) ) ( not ( = ?auto_4449 ?auto_4456 ) ) ( not ( = ?auto_4449 ?auto_4454 ) ) ( not ( = ?auto_4441 ?auto_4455 ) ) ( not ( = ?auto_4441 ?auto_4448 ) ) ( not ( = ?auto_4441 ?auto_4452 ) ) ( not ( = ?auto_4441 ?auto_4461 ) ) ( not ( = ?auto_4447 ?auto_4445 ) ) ( not ( = ?auto_4447 ?auto_4443 ) ) ( not ( = ?auto_4447 ?auto_4451 ) ) ( not ( = ?auto_4447 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4432 ) ) ( not ( = ?auto_4426 ?auto_4444 ) ) ( not ( = ?auto_4427 ?auto_4432 ) ) ( not ( = ?auto_4427 ?auto_4444 ) ) ( not ( = ?auto_4428 ?auto_4432 ) ) ( not ( = ?auto_4428 ?auto_4444 ) ) ( not ( = ?auto_4429 ?auto_4432 ) ) ( not ( = ?auto_4429 ?auto_4444 ) ) ( not ( = ?auto_4430 ?auto_4432 ) ) ( not ( = ?auto_4430 ?auto_4444 ) ) ( not ( = ?auto_4432 ?auto_4447 ) ) ( not ( = ?auto_4432 ?auto_4445 ) ) ( not ( = ?auto_4432 ?auto_4443 ) ) ( not ( = ?auto_4432 ?auto_4451 ) ) ( not ( = ?auto_4432 ?auto_4450 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4442 ?auto_4446 ) ) ( not ( = ?auto_4442 ?auto_4457 ) ) ( not ( = ?auto_4442 ?auto_4456 ) ) ( not ( = ?auto_4442 ?auto_4454 ) ) ( not ( = ?auto_4458 ?auto_4441 ) ) ( not ( = ?auto_4458 ?auto_4455 ) ) ( not ( = ?auto_4458 ?auto_4448 ) ) ( not ( = ?auto_4458 ?auto_4452 ) ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( not ( = ?auto_4444 ?auto_4447 ) ) ( not ( = ?auto_4444 ?auto_4445 ) ) ( not ( = ?auto_4444 ?auto_4443 ) ) ( not ( = ?auto_4444 ?auto_4451 ) ) ( not ( = ?auto_4444 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4433 ) ) ( not ( = ?auto_4426 ?auto_4459 ) ) ( not ( = ?auto_4427 ?auto_4433 ) ) ( not ( = ?auto_4427 ?auto_4459 ) ) ( not ( = ?auto_4428 ?auto_4433 ) ) ( not ( = ?auto_4428 ?auto_4459 ) ) ( not ( = ?auto_4429 ?auto_4433 ) ) ( not ( = ?auto_4429 ?auto_4459 ) ) ( not ( = ?auto_4430 ?auto_4433 ) ) ( not ( = ?auto_4430 ?auto_4459 ) ) ( not ( = ?auto_4431 ?auto_4433 ) ) ( not ( = ?auto_4431 ?auto_4459 ) ) ( not ( = ?auto_4433 ?auto_4444 ) ) ( not ( = ?auto_4433 ?auto_4447 ) ) ( not ( = ?auto_4433 ?auto_4445 ) ) ( not ( = ?auto_4433 ?auto_4443 ) ) ( not ( = ?auto_4433 ?auto_4451 ) ) ( not ( = ?auto_4433 ?auto_4450 ) ) ( not ( = ?auto_4453 ?auto_4442 ) ) ( not ( = ?auto_4453 ?auto_4449 ) ) ( not ( = ?auto_4453 ?auto_4446 ) ) ( not ( = ?auto_4453 ?auto_4457 ) ) ( not ( = ?auto_4453 ?auto_4456 ) ) ( not ( = ?auto_4453 ?auto_4454 ) ) ( not ( = ?auto_4460 ?auto_4458 ) ) ( not ( = ?auto_4460 ?auto_4441 ) ) ( not ( = ?auto_4460 ?auto_4455 ) ) ( not ( = ?auto_4460 ?auto_4448 ) ) ( not ( = ?auto_4460 ?auto_4452 ) ) ( not ( = ?auto_4460 ?auto_4461 ) ) ( not ( = ?auto_4459 ?auto_4444 ) ) ( not ( = ?auto_4459 ?auto_4447 ) ) ( not ( = ?auto_4459 ?auto_4445 ) ) ( not ( = ?auto_4459 ?auto_4443 ) ) ( not ( = ?auto_4459 ?auto_4451 ) ) ( not ( = ?auto_4459 ?auto_4450 ) ) ( not ( = ?auto_4426 ?auto_4434 ) ) ( not ( = ?auto_4426 ?auto_4437 ) ) ( not ( = ?auto_4427 ?auto_4434 ) ) ( not ( = ?auto_4427 ?auto_4437 ) ) ( not ( = ?auto_4428 ?auto_4434 ) ) ( not ( = ?auto_4428 ?auto_4437 ) ) ( not ( = ?auto_4429 ?auto_4434 ) ) ( not ( = ?auto_4429 ?auto_4437 ) ) ( not ( = ?auto_4430 ?auto_4434 ) ) ( not ( = ?auto_4430 ?auto_4437 ) ) ( not ( = ?auto_4431 ?auto_4434 ) ) ( not ( = ?auto_4431 ?auto_4437 ) ) ( not ( = ?auto_4432 ?auto_4434 ) ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4459 ) ) ( not ( = ?auto_4434 ?auto_4444 ) ) ( not ( = ?auto_4434 ?auto_4447 ) ) ( not ( = ?auto_4434 ?auto_4445 ) ) ( not ( = ?auto_4434 ?auto_4443 ) ) ( not ( = ?auto_4434 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4450 ) ) ( not ( = ?auto_4435 ?auto_4453 ) ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4435 ?auto_4449 ) ) ( not ( = ?auto_4435 ?auto_4446 ) ) ( not ( = ?auto_4435 ?auto_4457 ) ) ( not ( = ?auto_4435 ?auto_4456 ) ) ( not ( = ?auto_4435 ?auto_4454 ) ) ( not ( = ?auto_4436 ?auto_4460 ) ) ( not ( = ?auto_4436 ?auto_4458 ) ) ( not ( = ?auto_4436 ?auto_4441 ) ) ( not ( = ?auto_4436 ?auto_4455 ) ) ( not ( = ?auto_4436 ?auto_4448 ) ) ( not ( = ?auto_4436 ?auto_4452 ) ) ( not ( = ?auto_4436 ?auto_4461 ) ) ( not ( = ?auto_4437 ?auto_4459 ) ) ( not ( = ?auto_4437 ?auto_4444 ) ) ( not ( = ?auto_4437 ?auto_4447 ) ) ( not ( = ?auto_4437 ?auto_4445 ) ) ( not ( = ?auto_4437 ?auto_4443 ) ) ( not ( = ?auto_4437 ?auto_4451 ) ) ( not ( = ?auto_4437 ?auto_4450 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4426 ?auto_4427 ?auto_4428 ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4432 ?auto_4433 )
      ( MAKE-1CRATE ?auto_4433 ?auto_4434 )
      ( MAKE-8CRATE-VERIFY ?auto_4426 ?auto_4427 ?auto_4428 ?auto_4429 ?auto_4430 ?auto_4431 ?auto_4432 ?auto_4433 ?auto_4434 ) )
  )

)

