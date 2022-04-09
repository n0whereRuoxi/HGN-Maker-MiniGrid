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
      ?auto_4198 - SURFACE
      ?auto_4199 - SURFACE
    )
    :vars
    (
      ?auto_4200 - HOIST
      ?auto_4201 - PLACE
      ?auto_4203 - PLACE
      ?auto_4204 - HOIST
      ?auto_4205 - SURFACE
      ?auto_4202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4200 ?auto_4201 ) ( SURFACE-AT ?auto_4198 ?auto_4201 ) ( CLEAR ?auto_4198 ) ( IS-CRATE ?auto_4199 ) ( AVAILABLE ?auto_4200 ) ( not ( = ?auto_4203 ?auto_4201 ) ) ( HOIST-AT ?auto_4204 ?auto_4203 ) ( AVAILABLE ?auto_4204 ) ( SURFACE-AT ?auto_4199 ?auto_4203 ) ( ON ?auto_4199 ?auto_4205 ) ( CLEAR ?auto_4199 ) ( TRUCK-AT ?auto_4202 ?auto_4201 ) ( not ( = ?auto_4198 ?auto_4199 ) ) ( not ( = ?auto_4198 ?auto_4205 ) ) ( not ( = ?auto_4199 ?auto_4205 ) ) ( not ( = ?auto_4200 ?auto_4204 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4202 ?auto_4201 ?auto_4203 )
      ( !LIFT ?auto_4204 ?auto_4199 ?auto_4205 ?auto_4203 )
      ( !LOAD ?auto_4204 ?auto_4199 ?auto_4202 ?auto_4203 )
      ( !DRIVE ?auto_4202 ?auto_4203 ?auto_4201 )
      ( !UNLOAD ?auto_4200 ?auto_4199 ?auto_4202 ?auto_4201 )
      ( !DROP ?auto_4200 ?auto_4199 ?auto_4198 ?auto_4201 )
      ( MAKE-1CRATE-VERIFY ?auto_4198 ?auto_4199 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4208 - SURFACE
      ?auto_4209 - SURFACE
    )
    :vars
    (
      ?auto_4210 - HOIST
      ?auto_4211 - PLACE
      ?auto_4213 - PLACE
      ?auto_4214 - HOIST
      ?auto_4215 - SURFACE
      ?auto_4212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4210 ?auto_4211 ) ( SURFACE-AT ?auto_4208 ?auto_4211 ) ( CLEAR ?auto_4208 ) ( IS-CRATE ?auto_4209 ) ( AVAILABLE ?auto_4210 ) ( not ( = ?auto_4213 ?auto_4211 ) ) ( HOIST-AT ?auto_4214 ?auto_4213 ) ( AVAILABLE ?auto_4214 ) ( SURFACE-AT ?auto_4209 ?auto_4213 ) ( ON ?auto_4209 ?auto_4215 ) ( CLEAR ?auto_4209 ) ( TRUCK-AT ?auto_4212 ?auto_4211 ) ( not ( = ?auto_4208 ?auto_4209 ) ) ( not ( = ?auto_4208 ?auto_4215 ) ) ( not ( = ?auto_4209 ?auto_4215 ) ) ( not ( = ?auto_4210 ?auto_4214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4212 ?auto_4211 ?auto_4213 )
      ( !LIFT ?auto_4214 ?auto_4209 ?auto_4215 ?auto_4213 )
      ( !LOAD ?auto_4214 ?auto_4209 ?auto_4212 ?auto_4213 )
      ( !DRIVE ?auto_4212 ?auto_4213 ?auto_4211 )
      ( !UNLOAD ?auto_4210 ?auto_4209 ?auto_4212 ?auto_4211 )
      ( !DROP ?auto_4210 ?auto_4209 ?auto_4208 ?auto_4211 )
      ( MAKE-1CRATE-VERIFY ?auto_4208 ?auto_4209 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
      ?auto_4221 - SURFACE
    )
    :vars
    (
      ?auto_4224 - HOIST
      ?auto_4222 - PLACE
      ?auto_4225 - PLACE
      ?auto_4223 - HOIST
      ?auto_4226 - SURFACE
      ?auto_4230 - PLACE
      ?auto_4228 - HOIST
      ?auto_4229 - SURFACE
      ?auto_4227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4224 ?auto_4222 ) ( IS-CRATE ?auto_4221 ) ( not ( = ?auto_4225 ?auto_4222 ) ) ( HOIST-AT ?auto_4223 ?auto_4225 ) ( AVAILABLE ?auto_4223 ) ( SURFACE-AT ?auto_4221 ?auto_4225 ) ( ON ?auto_4221 ?auto_4226 ) ( CLEAR ?auto_4221 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4226 ) ) ( not ( = ?auto_4221 ?auto_4226 ) ) ( not ( = ?auto_4224 ?auto_4223 ) ) ( SURFACE-AT ?auto_4219 ?auto_4222 ) ( CLEAR ?auto_4219 ) ( IS-CRATE ?auto_4220 ) ( AVAILABLE ?auto_4224 ) ( not ( = ?auto_4230 ?auto_4222 ) ) ( HOIST-AT ?auto_4228 ?auto_4230 ) ( AVAILABLE ?auto_4228 ) ( SURFACE-AT ?auto_4220 ?auto_4230 ) ( ON ?auto_4220 ?auto_4229 ) ( CLEAR ?auto_4220 ) ( TRUCK-AT ?auto_4227 ?auto_4222 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4229 ) ) ( not ( = ?auto_4220 ?auto_4229 ) ) ( not ( = ?auto_4224 ?auto_4228 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4226 ) ) ( not ( = ?auto_4221 ?auto_4229 ) ) ( not ( = ?auto_4225 ?auto_4230 ) ) ( not ( = ?auto_4223 ?auto_4228 ) ) ( not ( = ?auto_4226 ?auto_4229 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4219 ?auto_4220 )
      ( MAKE-1CRATE ?auto_4220 ?auto_4221 )
      ( MAKE-2CRATE-VERIFY ?auto_4219 ?auto_4220 ?auto_4221 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4233 - SURFACE
      ?auto_4234 - SURFACE
    )
    :vars
    (
      ?auto_4235 - HOIST
      ?auto_4236 - PLACE
      ?auto_4238 - PLACE
      ?auto_4239 - HOIST
      ?auto_4240 - SURFACE
      ?auto_4237 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4235 ?auto_4236 ) ( SURFACE-AT ?auto_4233 ?auto_4236 ) ( CLEAR ?auto_4233 ) ( IS-CRATE ?auto_4234 ) ( AVAILABLE ?auto_4235 ) ( not ( = ?auto_4238 ?auto_4236 ) ) ( HOIST-AT ?auto_4239 ?auto_4238 ) ( AVAILABLE ?auto_4239 ) ( SURFACE-AT ?auto_4234 ?auto_4238 ) ( ON ?auto_4234 ?auto_4240 ) ( CLEAR ?auto_4234 ) ( TRUCK-AT ?auto_4237 ?auto_4236 ) ( not ( = ?auto_4233 ?auto_4234 ) ) ( not ( = ?auto_4233 ?auto_4240 ) ) ( not ( = ?auto_4234 ?auto_4240 ) ) ( not ( = ?auto_4235 ?auto_4239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4237 ?auto_4236 ?auto_4238 )
      ( !LIFT ?auto_4239 ?auto_4234 ?auto_4240 ?auto_4238 )
      ( !LOAD ?auto_4239 ?auto_4234 ?auto_4237 ?auto_4238 )
      ( !DRIVE ?auto_4237 ?auto_4238 ?auto_4236 )
      ( !UNLOAD ?auto_4235 ?auto_4234 ?auto_4237 ?auto_4236 )
      ( !DROP ?auto_4235 ?auto_4234 ?auto_4233 ?auto_4236 )
      ( MAKE-1CRATE-VERIFY ?auto_4233 ?auto_4234 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_4245 - SURFACE
      ?auto_4246 - SURFACE
      ?auto_4247 - SURFACE
      ?auto_4248 - SURFACE
    )
    :vars
    (
      ?auto_4251 - HOIST
      ?auto_4253 - PLACE
      ?auto_4249 - PLACE
      ?auto_4252 - HOIST
      ?auto_4250 - SURFACE
      ?auto_4255 - PLACE
      ?auto_4259 - HOIST
      ?auto_4258 - SURFACE
      ?auto_4257 - PLACE
      ?auto_4260 - HOIST
      ?auto_4256 - SURFACE
      ?auto_4254 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4251 ?auto_4253 ) ( IS-CRATE ?auto_4248 ) ( not ( = ?auto_4249 ?auto_4253 ) ) ( HOIST-AT ?auto_4252 ?auto_4249 ) ( AVAILABLE ?auto_4252 ) ( SURFACE-AT ?auto_4248 ?auto_4249 ) ( ON ?auto_4248 ?auto_4250 ) ( CLEAR ?auto_4248 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4250 ) ) ( not ( = ?auto_4248 ?auto_4250 ) ) ( not ( = ?auto_4251 ?auto_4252 ) ) ( IS-CRATE ?auto_4247 ) ( not ( = ?auto_4255 ?auto_4253 ) ) ( HOIST-AT ?auto_4259 ?auto_4255 ) ( AVAILABLE ?auto_4259 ) ( SURFACE-AT ?auto_4247 ?auto_4255 ) ( ON ?auto_4247 ?auto_4258 ) ( CLEAR ?auto_4247 ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4258 ) ) ( not ( = ?auto_4247 ?auto_4258 ) ) ( not ( = ?auto_4251 ?auto_4259 ) ) ( SURFACE-AT ?auto_4245 ?auto_4253 ) ( CLEAR ?auto_4245 ) ( IS-CRATE ?auto_4246 ) ( AVAILABLE ?auto_4251 ) ( not ( = ?auto_4257 ?auto_4253 ) ) ( HOIST-AT ?auto_4260 ?auto_4257 ) ( AVAILABLE ?auto_4260 ) ( SURFACE-AT ?auto_4246 ?auto_4257 ) ( ON ?auto_4246 ?auto_4256 ) ( CLEAR ?auto_4246 ) ( TRUCK-AT ?auto_4254 ?auto_4253 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4256 ) ) ( not ( = ?auto_4246 ?auto_4256 ) ) ( not ( = ?auto_4251 ?auto_4260 ) ) ( not ( = ?auto_4245 ?auto_4247 ) ) ( not ( = ?auto_4245 ?auto_4258 ) ) ( not ( = ?auto_4247 ?auto_4256 ) ) ( not ( = ?auto_4255 ?auto_4257 ) ) ( not ( = ?auto_4259 ?auto_4260 ) ) ( not ( = ?auto_4258 ?auto_4256 ) ) ( not ( = ?auto_4245 ?auto_4248 ) ) ( not ( = ?auto_4245 ?auto_4250 ) ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4246 ?auto_4250 ) ) ( not ( = ?auto_4248 ?auto_4258 ) ) ( not ( = ?auto_4248 ?auto_4256 ) ) ( not ( = ?auto_4249 ?auto_4255 ) ) ( not ( = ?auto_4249 ?auto_4257 ) ) ( not ( = ?auto_4252 ?auto_4259 ) ) ( not ( = ?auto_4252 ?auto_4260 ) ) ( not ( = ?auto_4250 ?auto_4258 ) ) ( not ( = ?auto_4250 ?auto_4256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4245 ?auto_4246 ?auto_4247 )
      ( MAKE-1CRATE ?auto_4247 ?auto_4248 )
      ( MAKE-3CRATE-VERIFY ?auto_4245 ?auto_4246 ?auto_4247 ?auto_4248 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4263 - SURFACE
      ?auto_4264 - SURFACE
    )
    :vars
    (
      ?auto_4265 - HOIST
      ?auto_4266 - PLACE
      ?auto_4268 - PLACE
      ?auto_4269 - HOIST
      ?auto_4270 - SURFACE
      ?auto_4267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4265 ?auto_4266 ) ( SURFACE-AT ?auto_4263 ?auto_4266 ) ( CLEAR ?auto_4263 ) ( IS-CRATE ?auto_4264 ) ( AVAILABLE ?auto_4265 ) ( not ( = ?auto_4268 ?auto_4266 ) ) ( HOIST-AT ?auto_4269 ?auto_4268 ) ( AVAILABLE ?auto_4269 ) ( SURFACE-AT ?auto_4264 ?auto_4268 ) ( ON ?auto_4264 ?auto_4270 ) ( CLEAR ?auto_4264 ) ( TRUCK-AT ?auto_4267 ?auto_4266 ) ( not ( = ?auto_4263 ?auto_4264 ) ) ( not ( = ?auto_4263 ?auto_4270 ) ) ( not ( = ?auto_4264 ?auto_4270 ) ) ( not ( = ?auto_4265 ?auto_4269 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4267 ?auto_4266 ?auto_4268 )
      ( !LIFT ?auto_4269 ?auto_4264 ?auto_4270 ?auto_4268 )
      ( !LOAD ?auto_4269 ?auto_4264 ?auto_4267 ?auto_4268 )
      ( !DRIVE ?auto_4267 ?auto_4268 ?auto_4266 )
      ( !UNLOAD ?auto_4265 ?auto_4264 ?auto_4267 ?auto_4266 )
      ( !DROP ?auto_4265 ?auto_4264 ?auto_4263 ?auto_4266 )
      ( MAKE-1CRATE-VERIFY ?auto_4263 ?auto_4264 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_4276 - SURFACE
      ?auto_4277 - SURFACE
      ?auto_4278 - SURFACE
      ?auto_4279 - SURFACE
      ?auto_4280 - SURFACE
    )
    :vars
    (
      ?auto_4284 - HOIST
      ?auto_4286 - PLACE
      ?auto_4282 - PLACE
      ?auto_4285 - HOIST
      ?auto_4281 - SURFACE
      ?auto_4293 - SURFACE
      ?auto_4291 - PLACE
      ?auto_4289 - HOIST
      ?auto_4292 - SURFACE
      ?auto_4288 - PLACE
      ?auto_4287 - HOIST
      ?auto_4290 - SURFACE
      ?auto_4283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4284 ?auto_4286 ) ( IS-CRATE ?auto_4280 ) ( not ( = ?auto_4282 ?auto_4286 ) ) ( HOIST-AT ?auto_4285 ?auto_4282 ) ( SURFACE-AT ?auto_4280 ?auto_4282 ) ( ON ?auto_4280 ?auto_4281 ) ( CLEAR ?auto_4280 ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4281 ) ) ( not ( = ?auto_4280 ?auto_4281 ) ) ( not ( = ?auto_4284 ?auto_4285 ) ) ( IS-CRATE ?auto_4279 ) ( AVAILABLE ?auto_4285 ) ( SURFACE-AT ?auto_4279 ?auto_4282 ) ( ON ?auto_4279 ?auto_4293 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4293 ) ) ( not ( = ?auto_4279 ?auto_4293 ) ) ( IS-CRATE ?auto_4278 ) ( not ( = ?auto_4291 ?auto_4286 ) ) ( HOIST-AT ?auto_4289 ?auto_4291 ) ( AVAILABLE ?auto_4289 ) ( SURFACE-AT ?auto_4278 ?auto_4291 ) ( ON ?auto_4278 ?auto_4292 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4292 ) ) ( not ( = ?auto_4278 ?auto_4292 ) ) ( not ( = ?auto_4284 ?auto_4289 ) ) ( SURFACE-AT ?auto_4276 ?auto_4286 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( AVAILABLE ?auto_4284 ) ( not ( = ?auto_4288 ?auto_4286 ) ) ( HOIST-AT ?auto_4287 ?auto_4288 ) ( AVAILABLE ?auto_4287 ) ( SURFACE-AT ?auto_4277 ?auto_4288 ) ( ON ?auto_4277 ?auto_4290 ) ( CLEAR ?auto_4277 ) ( TRUCK-AT ?auto_4283 ?auto_4286 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4290 ) ) ( not ( = ?auto_4277 ?auto_4290 ) ) ( not ( = ?auto_4284 ?auto_4287 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4292 ) ) ( not ( = ?auto_4278 ?auto_4290 ) ) ( not ( = ?auto_4291 ?auto_4288 ) ) ( not ( = ?auto_4289 ?auto_4287 ) ) ( not ( = ?auto_4292 ?auto_4290 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4293 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4293 ) ) ( not ( = ?auto_4279 ?auto_4292 ) ) ( not ( = ?auto_4279 ?auto_4290 ) ) ( not ( = ?auto_4282 ?auto_4291 ) ) ( not ( = ?auto_4282 ?auto_4288 ) ) ( not ( = ?auto_4285 ?auto_4289 ) ) ( not ( = ?auto_4285 ?auto_4287 ) ) ( not ( = ?auto_4293 ?auto_4292 ) ) ( not ( = ?auto_4293 ?auto_4290 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4281 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4281 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4281 ) ) ( not ( = ?auto_4280 ?auto_4293 ) ) ( not ( = ?auto_4280 ?auto_4292 ) ) ( not ( = ?auto_4280 ?auto_4290 ) ) ( not ( = ?auto_4281 ?auto_4293 ) ) ( not ( = ?auto_4281 ?auto_4292 ) ) ( not ( = ?auto_4281 ?auto_4290 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 )
      ( MAKE-1CRATE ?auto_4279 ?auto_4280 )
      ( MAKE-4CRATE-VERIFY ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4296 - SURFACE
      ?auto_4297 - SURFACE
    )
    :vars
    (
      ?auto_4298 - HOIST
      ?auto_4299 - PLACE
      ?auto_4301 - PLACE
      ?auto_4302 - HOIST
      ?auto_4303 - SURFACE
      ?auto_4300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4298 ?auto_4299 ) ( SURFACE-AT ?auto_4296 ?auto_4299 ) ( CLEAR ?auto_4296 ) ( IS-CRATE ?auto_4297 ) ( AVAILABLE ?auto_4298 ) ( not ( = ?auto_4301 ?auto_4299 ) ) ( HOIST-AT ?auto_4302 ?auto_4301 ) ( AVAILABLE ?auto_4302 ) ( SURFACE-AT ?auto_4297 ?auto_4301 ) ( ON ?auto_4297 ?auto_4303 ) ( CLEAR ?auto_4297 ) ( TRUCK-AT ?auto_4300 ?auto_4299 ) ( not ( = ?auto_4296 ?auto_4297 ) ) ( not ( = ?auto_4296 ?auto_4303 ) ) ( not ( = ?auto_4297 ?auto_4303 ) ) ( not ( = ?auto_4298 ?auto_4302 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4300 ?auto_4299 ?auto_4301 )
      ( !LIFT ?auto_4302 ?auto_4297 ?auto_4303 ?auto_4301 )
      ( !LOAD ?auto_4302 ?auto_4297 ?auto_4300 ?auto_4301 )
      ( !DRIVE ?auto_4300 ?auto_4301 ?auto_4299 )
      ( !UNLOAD ?auto_4298 ?auto_4297 ?auto_4300 ?auto_4299 )
      ( !DROP ?auto_4298 ?auto_4297 ?auto_4296 ?auto_4299 )
      ( MAKE-1CRATE-VERIFY ?auto_4296 ?auto_4297 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_4310 - SURFACE
      ?auto_4311 - SURFACE
      ?auto_4312 - SURFACE
      ?auto_4313 - SURFACE
      ?auto_4314 - SURFACE
      ?auto_4315 - SURFACE
    )
    :vars
    (
      ?auto_4320 - HOIST
      ?auto_4318 - PLACE
      ?auto_4319 - PLACE
      ?auto_4317 - HOIST
      ?auto_4316 - SURFACE
      ?auto_4329 - PLACE
      ?auto_4326 - HOIST
      ?auto_4327 - SURFACE
      ?auto_4324 - SURFACE
      ?auto_4322 - SURFACE
      ?auto_4323 - PLACE
      ?auto_4328 - HOIST
      ?auto_4325 - SURFACE
      ?auto_4321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4320 ?auto_4318 ) ( IS-CRATE ?auto_4315 ) ( not ( = ?auto_4319 ?auto_4318 ) ) ( HOIST-AT ?auto_4317 ?auto_4319 ) ( SURFACE-AT ?auto_4315 ?auto_4319 ) ( ON ?auto_4315 ?auto_4316 ) ( CLEAR ?auto_4315 ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4316 ) ) ( not ( = ?auto_4320 ?auto_4317 ) ) ( IS-CRATE ?auto_4314 ) ( not ( = ?auto_4329 ?auto_4318 ) ) ( HOIST-AT ?auto_4326 ?auto_4329 ) ( SURFACE-AT ?auto_4314 ?auto_4329 ) ( ON ?auto_4314 ?auto_4327 ) ( CLEAR ?auto_4314 ) ( not ( = ?auto_4313 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4327 ) ) ( not ( = ?auto_4314 ?auto_4327 ) ) ( not ( = ?auto_4320 ?auto_4326 ) ) ( IS-CRATE ?auto_4313 ) ( AVAILABLE ?auto_4326 ) ( SURFACE-AT ?auto_4313 ?auto_4329 ) ( ON ?auto_4313 ?auto_4324 ) ( CLEAR ?auto_4313 ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4324 ) ) ( not ( = ?auto_4313 ?auto_4324 ) ) ( IS-CRATE ?auto_4312 ) ( AVAILABLE ?auto_4317 ) ( SURFACE-AT ?auto_4312 ?auto_4319 ) ( ON ?auto_4312 ?auto_4322 ) ( CLEAR ?auto_4312 ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4322 ) ) ( SURFACE-AT ?auto_4310 ?auto_4318 ) ( CLEAR ?auto_4310 ) ( IS-CRATE ?auto_4311 ) ( AVAILABLE ?auto_4320 ) ( not ( = ?auto_4323 ?auto_4318 ) ) ( HOIST-AT ?auto_4328 ?auto_4323 ) ( AVAILABLE ?auto_4328 ) ( SURFACE-AT ?auto_4311 ?auto_4323 ) ( ON ?auto_4311 ?auto_4325 ) ( CLEAR ?auto_4311 ) ( TRUCK-AT ?auto_4321 ?auto_4318 ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4325 ) ) ( not ( = ?auto_4311 ?auto_4325 ) ) ( not ( = ?auto_4320 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4325 ) ) ( not ( = ?auto_4319 ?auto_4323 ) ) ( not ( = ?auto_4317 ?auto_4328 ) ) ( not ( = ?auto_4322 ?auto_4325 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4310 ?auto_4324 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4324 ) ) ( not ( = ?auto_4313 ?auto_4322 ) ) ( not ( = ?auto_4313 ?auto_4325 ) ) ( not ( = ?auto_4329 ?auto_4319 ) ) ( not ( = ?auto_4329 ?auto_4323 ) ) ( not ( = ?auto_4326 ?auto_4317 ) ) ( not ( = ?auto_4326 ?auto_4328 ) ) ( not ( = ?auto_4324 ?auto_4322 ) ) ( not ( = ?auto_4324 ?auto_4325 ) ) ( not ( = ?auto_4310 ?auto_4314 ) ) ( not ( = ?auto_4310 ?auto_4327 ) ) ( not ( = ?auto_4311 ?auto_4314 ) ) ( not ( = ?auto_4311 ?auto_4327 ) ) ( not ( = ?auto_4312 ?auto_4314 ) ) ( not ( = ?auto_4312 ?auto_4327 ) ) ( not ( = ?auto_4314 ?auto_4324 ) ) ( not ( = ?auto_4314 ?auto_4322 ) ) ( not ( = ?auto_4314 ?auto_4325 ) ) ( not ( = ?auto_4327 ?auto_4324 ) ) ( not ( = ?auto_4327 ?auto_4322 ) ) ( not ( = ?auto_4327 ?auto_4325 ) ) ( not ( = ?auto_4310 ?auto_4315 ) ) ( not ( = ?auto_4310 ?auto_4316 ) ) ( not ( = ?auto_4311 ?auto_4315 ) ) ( not ( = ?auto_4311 ?auto_4316 ) ) ( not ( = ?auto_4312 ?auto_4315 ) ) ( not ( = ?auto_4312 ?auto_4316 ) ) ( not ( = ?auto_4313 ?auto_4315 ) ) ( not ( = ?auto_4313 ?auto_4316 ) ) ( not ( = ?auto_4315 ?auto_4327 ) ) ( not ( = ?auto_4315 ?auto_4324 ) ) ( not ( = ?auto_4315 ?auto_4322 ) ) ( not ( = ?auto_4315 ?auto_4325 ) ) ( not ( = ?auto_4316 ?auto_4327 ) ) ( not ( = ?auto_4316 ?auto_4324 ) ) ( not ( = ?auto_4316 ?auto_4322 ) ) ( not ( = ?auto_4316 ?auto_4325 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4310 ?auto_4311 ?auto_4312 ?auto_4313 ?auto_4314 )
      ( MAKE-1CRATE ?auto_4314 ?auto_4315 )
      ( MAKE-5CRATE-VERIFY ?auto_4310 ?auto_4311 ?auto_4312 ?auto_4313 ?auto_4314 ?auto_4315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4332 - SURFACE
      ?auto_4333 - SURFACE
    )
    :vars
    (
      ?auto_4334 - HOIST
      ?auto_4335 - PLACE
      ?auto_4337 - PLACE
      ?auto_4338 - HOIST
      ?auto_4339 - SURFACE
      ?auto_4336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4334 ?auto_4335 ) ( SURFACE-AT ?auto_4332 ?auto_4335 ) ( CLEAR ?auto_4332 ) ( IS-CRATE ?auto_4333 ) ( AVAILABLE ?auto_4334 ) ( not ( = ?auto_4337 ?auto_4335 ) ) ( HOIST-AT ?auto_4338 ?auto_4337 ) ( AVAILABLE ?auto_4338 ) ( SURFACE-AT ?auto_4333 ?auto_4337 ) ( ON ?auto_4333 ?auto_4339 ) ( CLEAR ?auto_4333 ) ( TRUCK-AT ?auto_4336 ?auto_4335 ) ( not ( = ?auto_4332 ?auto_4333 ) ) ( not ( = ?auto_4332 ?auto_4339 ) ) ( not ( = ?auto_4333 ?auto_4339 ) ) ( not ( = ?auto_4334 ?auto_4338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4336 ?auto_4335 ?auto_4337 )
      ( !LIFT ?auto_4338 ?auto_4333 ?auto_4339 ?auto_4337 )
      ( !LOAD ?auto_4338 ?auto_4333 ?auto_4336 ?auto_4337 )
      ( !DRIVE ?auto_4336 ?auto_4337 ?auto_4335 )
      ( !UNLOAD ?auto_4334 ?auto_4333 ?auto_4336 ?auto_4335 )
      ( !DROP ?auto_4334 ?auto_4333 ?auto_4332 ?auto_4335 )
      ( MAKE-1CRATE-VERIFY ?auto_4332 ?auto_4333 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_4347 - SURFACE
      ?auto_4348 - SURFACE
      ?auto_4349 - SURFACE
      ?auto_4350 - SURFACE
      ?auto_4351 - SURFACE
      ?auto_4352 - SURFACE
      ?auto_4353 - SURFACE
    )
    :vars
    (
      ?auto_4354 - HOIST
      ?auto_4358 - PLACE
      ?auto_4359 - PLACE
      ?auto_4357 - HOIST
      ?auto_4356 - SURFACE
      ?auto_4364 - PLACE
      ?auto_4365 - HOIST
      ?auto_4367 - SURFACE
      ?auto_4363 - PLACE
      ?auto_4362 - HOIST
      ?auto_4370 - SURFACE
      ?auto_4368 - SURFACE
      ?auto_4361 - SURFACE
      ?auto_4366 - PLACE
      ?auto_4360 - HOIST
      ?auto_4369 - SURFACE
      ?auto_4355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4354 ?auto_4358 ) ( IS-CRATE ?auto_4353 ) ( not ( = ?auto_4359 ?auto_4358 ) ) ( HOIST-AT ?auto_4357 ?auto_4359 ) ( AVAILABLE ?auto_4357 ) ( SURFACE-AT ?auto_4353 ?auto_4359 ) ( ON ?auto_4353 ?auto_4356 ) ( CLEAR ?auto_4353 ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4356 ) ) ( not ( = ?auto_4353 ?auto_4356 ) ) ( not ( = ?auto_4354 ?auto_4357 ) ) ( IS-CRATE ?auto_4352 ) ( not ( = ?auto_4364 ?auto_4358 ) ) ( HOIST-AT ?auto_4365 ?auto_4364 ) ( SURFACE-AT ?auto_4352 ?auto_4364 ) ( ON ?auto_4352 ?auto_4367 ) ( CLEAR ?auto_4352 ) ( not ( = ?auto_4351 ?auto_4352 ) ) ( not ( = ?auto_4351 ?auto_4367 ) ) ( not ( = ?auto_4352 ?auto_4367 ) ) ( not ( = ?auto_4354 ?auto_4365 ) ) ( IS-CRATE ?auto_4351 ) ( not ( = ?auto_4363 ?auto_4358 ) ) ( HOIST-AT ?auto_4362 ?auto_4363 ) ( SURFACE-AT ?auto_4351 ?auto_4363 ) ( ON ?auto_4351 ?auto_4370 ) ( CLEAR ?auto_4351 ) ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4350 ?auto_4370 ) ) ( not ( = ?auto_4351 ?auto_4370 ) ) ( not ( = ?auto_4354 ?auto_4362 ) ) ( IS-CRATE ?auto_4350 ) ( AVAILABLE ?auto_4362 ) ( SURFACE-AT ?auto_4350 ?auto_4363 ) ( ON ?auto_4350 ?auto_4368 ) ( CLEAR ?auto_4350 ) ( not ( = ?auto_4349 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4368 ) ) ( not ( = ?auto_4350 ?auto_4368 ) ) ( IS-CRATE ?auto_4349 ) ( AVAILABLE ?auto_4365 ) ( SURFACE-AT ?auto_4349 ?auto_4364 ) ( ON ?auto_4349 ?auto_4361 ) ( CLEAR ?auto_4349 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4361 ) ) ( not ( = ?auto_4349 ?auto_4361 ) ) ( SURFACE-AT ?auto_4347 ?auto_4358 ) ( CLEAR ?auto_4347 ) ( IS-CRATE ?auto_4348 ) ( AVAILABLE ?auto_4354 ) ( not ( = ?auto_4366 ?auto_4358 ) ) ( HOIST-AT ?auto_4360 ?auto_4366 ) ( AVAILABLE ?auto_4360 ) ( SURFACE-AT ?auto_4348 ?auto_4366 ) ( ON ?auto_4348 ?auto_4369 ) ( CLEAR ?auto_4348 ) ( TRUCK-AT ?auto_4355 ?auto_4358 ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4369 ) ) ( not ( = ?auto_4348 ?auto_4369 ) ) ( not ( = ?auto_4354 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4347 ?auto_4361 ) ) ( not ( = ?auto_4349 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4366 ) ) ( not ( = ?auto_4365 ?auto_4360 ) ) ( not ( = ?auto_4361 ?auto_4369 ) ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( not ( = ?auto_4347 ?auto_4368 ) ) ( not ( = ?auto_4348 ?auto_4350 ) ) ( not ( = ?auto_4348 ?auto_4368 ) ) ( not ( = ?auto_4350 ?auto_4361 ) ) ( not ( = ?auto_4350 ?auto_4369 ) ) ( not ( = ?auto_4363 ?auto_4364 ) ) ( not ( = ?auto_4363 ?auto_4366 ) ) ( not ( = ?auto_4362 ?auto_4365 ) ) ( not ( = ?auto_4362 ?auto_4360 ) ) ( not ( = ?auto_4368 ?auto_4361 ) ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4347 ?auto_4351 ) ) ( not ( = ?auto_4347 ?auto_4370 ) ) ( not ( = ?auto_4348 ?auto_4351 ) ) ( not ( = ?auto_4348 ?auto_4370 ) ) ( not ( = ?auto_4349 ?auto_4351 ) ) ( not ( = ?auto_4349 ?auto_4370 ) ) ( not ( = ?auto_4351 ?auto_4368 ) ) ( not ( = ?auto_4351 ?auto_4361 ) ) ( not ( = ?auto_4351 ?auto_4369 ) ) ( not ( = ?auto_4370 ?auto_4368 ) ) ( not ( = ?auto_4370 ?auto_4361 ) ) ( not ( = ?auto_4370 ?auto_4369 ) ) ( not ( = ?auto_4347 ?auto_4352 ) ) ( not ( = ?auto_4347 ?auto_4367 ) ) ( not ( = ?auto_4348 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4367 ) ) ( not ( = ?auto_4349 ?auto_4352 ) ) ( not ( = ?auto_4349 ?auto_4367 ) ) ( not ( = ?auto_4350 ?auto_4352 ) ) ( not ( = ?auto_4350 ?auto_4367 ) ) ( not ( = ?auto_4352 ?auto_4370 ) ) ( not ( = ?auto_4352 ?auto_4368 ) ) ( not ( = ?auto_4352 ?auto_4361 ) ) ( not ( = ?auto_4352 ?auto_4369 ) ) ( not ( = ?auto_4367 ?auto_4370 ) ) ( not ( = ?auto_4367 ?auto_4368 ) ) ( not ( = ?auto_4367 ?auto_4361 ) ) ( not ( = ?auto_4367 ?auto_4369 ) ) ( not ( = ?auto_4347 ?auto_4353 ) ) ( not ( = ?auto_4347 ?auto_4356 ) ) ( not ( = ?auto_4348 ?auto_4353 ) ) ( not ( = ?auto_4348 ?auto_4356 ) ) ( not ( = ?auto_4349 ?auto_4353 ) ) ( not ( = ?auto_4349 ?auto_4356 ) ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( not ( = ?auto_4350 ?auto_4356 ) ) ( not ( = ?auto_4351 ?auto_4353 ) ) ( not ( = ?auto_4351 ?auto_4356 ) ) ( not ( = ?auto_4353 ?auto_4367 ) ) ( not ( = ?auto_4353 ?auto_4370 ) ) ( not ( = ?auto_4353 ?auto_4368 ) ) ( not ( = ?auto_4353 ?auto_4361 ) ) ( not ( = ?auto_4353 ?auto_4369 ) ) ( not ( = ?auto_4359 ?auto_4364 ) ) ( not ( = ?auto_4359 ?auto_4363 ) ) ( not ( = ?auto_4359 ?auto_4366 ) ) ( not ( = ?auto_4357 ?auto_4365 ) ) ( not ( = ?auto_4357 ?auto_4362 ) ) ( not ( = ?auto_4357 ?auto_4360 ) ) ( not ( = ?auto_4356 ?auto_4367 ) ) ( not ( = ?auto_4356 ?auto_4370 ) ) ( not ( = ?auto_4356 ?auto_4368 ) ) ( not ( = ?auto_4356 ?auto_4361 ) ) ( not ( = ?auto_4356 ?auto_4369 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4347 ?auto_4348 ?auto_4349 ?auto_4350 ?auto_4351 ?auto_4352 )
      ( MAKE-1CRATE ?auto_4352 ?auto_4353 )
      ( MAKE-6CRATE-VERIFY ?auto_4347 ?auto_4348 ?auto_4349 ?auto_4350 ?auto_4351 ?auto_4352 ?auto_4353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4373 - SURFACE
      ?auto_4374 - SURFACE
    )
    :vars
    (
      ?auto_4375 - HOIST
      ?auto_4376 - PLACE
      ?auto_4378 - PLACE
      ?auto_4379 - HOIST
      ?auto_4380 - SURFACE
      ?auto_4377 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4375 ?auto_4376 ) ( SURFACE-AT ?auto_4373 ?auto_4376 ) ( CLEAR ?auto_4373 ) ( IS-CRATE ?auto_4374 ) ( AVAILABLE ?auto_4375 ) ( not ( = ?auto_4378 ?auto_4376 ) ) ( HOIST-AT ?auto_4379 ?auto_4378 ) ( AVAILABLE ?auto_4379 ) ( SURFACE-AT ?auto_4374 ?auto_4378 ) ( ON ?auto_4374 ?auto_4380 ) ( CLEAR ?auto_4374 ) ( TRUCK-AT ?auto_4377 ?auto_4376 ) ( not ( = ?auto_4373 ?auto_4374 ) ) ( not ( = ?auto_4373 ?auto_4380 ) ) ( not ( = ?auto_4374 ?auto_4380 ) ) ( not ( = ?auto_4375 ?auto_4379 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4377 ?auto_4376 ?auto_4378 )
      ( !LIFT ?auto_4379 ?auto_4374 ?auto_4380 ?auto_4378 )
      ( !LOAD ?auto_4379 ?auto_4374 ?auto_4377 ?auto_4378 )
      ( !DRIVE ?auto_4377 ?auto_4378 ?auto_4376 )
      ( !UNLOAD ?auto_4375 ?auto_4374 ?auto_4377 ?auto_4376 )
      ( !DROP ?auto_4375 ?auto_4374 ?auto_4373 ?auto_4376 )
      ( MAKE-1CRATE-VERIFY ?auto_4373 ?auto_4374 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_4389 - SURFACE
      ?auto_4390 - SURFACE
      ?auto_4391 - SURFACE
      ?auto_4392 - SURFACE
      ?auto_4393 - SURFACE
      ?auto_4394 - SURFACE
      ?auto_4396 - SURFACE
      ?auto_4395 - SURFACE
    )
    :vars
    (
      ?auto_4397 - HOIST
      ?auto_4399 - PLACE
      ?auto_4402 - PLACE
      ?auto_4400 - HOIST
      ?auto_4401 - SURFACE
      ?auto_4414 - PLACE
      ?auto_4410 - HOIST
      ?auto_4403 - SURFACE
      ?auto_4408 - SURFACE
      ?auto_4412 - PLACE
      ?auto_4411 - HOIST
      ?auto_4406 - SURFACE
      ?auto_4405 - SURFACE
      ?auto_4413 - SURFACE
      ?auto_4409 - PLACE
      ?auto_4404 - HOIST
      ?auto_4407 - SURFACE
      ?auto_4398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4397 ?auto_4399 ) ( IS-CRATE ?auto_4395 ) ( not ( = ?auto_4402 ?auto_4399 ) ) ( HOIST-AT ?auto_4400 ?auto_4402 ) ( SURFACE-AT ?auto_4395 ?auto_4402 ) ( ON ?auto_4395 ?auto_4401 ) ( CLEAR ?auto_4395 ) ( not ( = ?auto_4396 ?auto_4395 ) ) ( not ( = ?auto_4396 ?auto_4401 ) ) ( not ( = ?auto_4395 ?auto_4401 ) ) ( not ( = ?auto_4397 ?auto_4400 ) ) ( IS-CRATE ?auto_4396 ) ( not ( = ?auto_4414 ?auto_4399 ) ) ( HOIST-AT ?auto_4410 ?auto_4414 ) ( AVAILABLE ?auto_4410 ) ( SURFACE-AT ?auto_4396 ?auto_4414 ) ( ON ?auto_4396 ?auto_4403 ) ( CLEAR ?auto_4396 ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( not ( = ?auto_4394 ?auto_4403 ) ) ( not ( = ?auto_4396 ?auto_4403 ) ) ( not ( = ?auto_4397 ?auto_4410 ) ) ( IS-CRATE ?auto_4394 ) ( SURFACE-AT ?auto_4394 ?auto_4402 ) ( ON ?auto_4394 ?auto_4408 ) ( CLEAR ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( not ( = ?auto_4393 ?auto_4408 ) ) ( not ( = ?auto_4394 ?auto_4408 ) ) ( IS-CRATE ?auto_4393 ) ( not ( = ?auto_4412 ?auto_4399 ) ) ( HOIST-AT ?auto_4411 ?auto_4412 ) ( SURFACE-AT ?auto_4393 ?auto_4412 ) ( ON ?auto_4393 ?auto_4406 ) ( CLEAR ?auto_4393 ) ( not ( = ?auto_4392 ?auto_4393 ) ) ( not ( = ?auto_4392 ?auto_4406 ) ) ( not ( = ?auto_4393 ?auto_4406 ) ) ( not ( = ?auto_4397 ?auto_4411 ) ) ( IS-CRATE ?auto_4392 ) ( AVAILABLE ?auto_4411 ) ( SURFACE-AT ?auto_4392 ?auto_4412 ) ( ON ?auto_4392 ?auto_4405 ) ( CLEAR ?auto_4392 ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4391 ?auto_4405 ) ) ( not ( = ?auto_4392 ?auto_4405 ) ) ( IS-CRATE ?auto_4391 ) ( AVAILABLE ?auto_4400 ) ( SURFACE-AT ?auto_4391 ?auto_4402 ) ( ON ?auto_4391 ?auto_4413 ) ( CLEAR ?auto_4391 ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4413 ) ) ( not ( = ?auto_4391 ?auto_4413 ) ) ( SURFACE-AT ?auto_4389 ?auto_4399 ) ( CLEAR ?auto_4389 ) ( IS-CRATE ?auto_4390 ) ( AVAILABLE ?auto_4397 ) ( not ( = ?auto_4409 ?auto_4399 ) ) ( HOIST-AT ?auto_4404 ?auto_4409 ) ( AVAILABLE ?auto_4404 ) ( SURFACE-AT ?auto_4390 ?auto_4409 ) ( ON ?auto_4390 ?auto_4407 ) ( CLEAR ?auto_4390 ) ( TRUCK-AT ?auto_4398 ?auto_4399 ) ( not ( = ?auto_4389 ?auto_4390 ) ) ( not ( = ?auto_4389 ?auto_4407 ) ) ( not ( = ?auto_4390 ?auto_4407 ) ) ( not ( = ?auto_4397 ?auto_4404 ) ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4389 ?auto_4413 ) ) ( not ( = ?auto_4391 ?auto_4407 ) ) ( not ( = ?auto_4402 ?auto_4409 ) ) ( not ( = ?auto_4400 ?auto_4404 ) ) ( not ( = ?auto_4413 ?auto_4407 ) ) ( not ( = ?auto_4389 ?auto_4392 ) ) ( not ( = ?auto_4389 ?auto_4405 ) ) ( not ( = ?auto_4390 ?auto_4392 ) ) ( not ( = ?auto_4390 ?auto_4405 ) ) ( not ( = ?auto_4392 ?auto_4413 ) ) ( not ( = ?auto_4392 ?auto_4407 ) ) ( not ( = ?auto_4412 ?auto_4402 ) ) ( not ( = ?auto_4412 ?auto_4409 ) ) ( not ( = ?auto_4411 ?auto_4400 ) ) ( not ( = ?auto_4411 ?auto_4404 ) ) ( not ( = ?auto_4405 ?auto_4413 ) ) ( not ( = ?auto_4405 ?auto_4407 ) ) ( not ( = ?auto_4389 ?auto_4393 ) ) ( not ( = ?auto_4389 ?auto_4406 ) ) ( not ( = ?auto_4390 ?auto_4393 ) ) ( not ( = ?auto_4390 ?auto_4406 ) ) ( not ( = ?auto_4391 ?auto_4393 ) ) ( not ( = ?auto_4391 ?auto_4406 ) ) ( not ( = ?auto_4393 ?auto_4405 ) ) ( not ( = ?auto_4393 ?auto_4413 ) ) ( not ( = ?auto_4393 ?auto_4407 ) ) ( not ( = ?auto_4406 ?auto_4405 ) ) ( not ( = ?auto_4406 ?auto_4413 ) ) ( not ( = ?auto_4406 ?auto_4407 ) ) ( not ( = ?auto_4389 ?auto_4394 ) ) ( not ( = ?auto_4389 ?auto_4408 ) ) ( not ( = ?auto_4390 ?auto_4394 ) ) ( not ( = ?auto_4390 ?auto_4408 ) ) ( not ( = ?auto_4391 ?auto_4394 ) ) ( not ( = ?auto_4391 ?auto_4408 ) ) ( not ( = ?auto_4392 ?auto_4394 ) ) ( not ( = ?auto_4392 ?auto_4408 ) ) ( not ( = ?auto_4394 ?auto_4406 ) ) ( not ( = ?auto_4394 ?auto_4405 ) ) ( not ( = ?auto_4394 ?auto_4413 ) ) ( not ( = ?auto_4394 ?auto_4407 ) ) ( not ( = ?auto_4408 ?auto_4406 ) ) ( not ( = ?auto_4408 ?auto_4405 ) ) ( not ( = ?auto_4408 ?auto_4413 ) ) ( not ( = ?auto_4408 ?auto_4407 ) ) ( not ( = ?auto_4389 ?auto_4396 ) ) ( not ( = ?auto_4389 ?auto_4403 ) ) ( not ( = ?auto_4390 ?auto_4396 ) ) ( not ( = ?auto_4390 ?auto_4403 ) ) ( not ( = ?auto_4391 ?auto_4396 ) ) ( not ( = ?auto_4391 ?auto_4403 ) ) ( not ( = ?auto_4392 ?auto_4396 ) ) ( not ( = ?auto_4392 ?auto_4403 ) ) ( not ( = ?auto_4393 ?auto_4396 ) ) ( not ( = ?auto_4393 ?auto_4403 ) ) ( not ( = ?auto_4396 ?auto_4408 ) ) ( not ( = ?auto_4396 ?auto_4406 ) ) ( not ( = ?auto_4396 ?auto_4405 ) ) ( not ( = ?auto_4396 ?auto_4413 ) ) ( not ( = ?auto_4396 ?auto_4407 ) ) ( not ( = ?auto_4414 ?auto_4402 ) ) ( not ( = ?auto_4414 ?auto_4412 ) ) ( not ( = ?auto_4414 ?auto_4409 ) ) ( not ( = ?auto_4410 ?auto_4400 ) ) ( not ( = ?auto_4410 ?auto_4411 ) ) ( not ( = ?auto_4410 ?auto_4404 ) ) ( not ( = ?auto_4403 ?auto_4408 ) ) ( not ( = ?auto_4403 ?auto_4406 ) ) ( not ( = ?auto_4403 ?auto_4405 ) ) ( not ( = ?auto_4403 ?auto_4413 ) ) ( not ( = ?auto_4403 ?auto_4407 ) ) ( not ( = ?auto_4389 ?auto_4395 ) ) ( not ( = ?auto_4389 ?auto_4401 ) ) ( not ( = ?auto_4390 ?auto_4395 ) ) ( not ( = ?auto_4390 ?auto_4401 ) ) ( not ( = ?auto_4391 ?auto_4395 ) ) ( not ( = ?auto_4391 ?auto_4401 ) ) ( not ( = ?auto_4392 ?auto_4395 ) ) ( not ( = ?auto_4392 ?auto_4401 ) ) ( not ( = ?auto_4393 ?auto_4395 ) ) ( not ( = ?auto_4393 ?auto_4401 ) ) ( not ( = ?auto_4394 ?auto_4395 ) ) ( not ( = ?auto_4394 ?auto_4401 ) ) ( not ( = ?auto_4395 ?auto_4403 ) ) ( not ( = ?auto_4395 ?auto_4408 ) ) ( not ( = ?auto_4395 ?auto_4406 ) ) ( not ( = ?auto_4395 ?auto_4405 ) ) ( not ( = ?auto_4395 ?auto_4413 ) ) ( not ( = ?auto_4395 ?auto_4407 ) ) ( not ( = ?auto_4401 ?auto_4403 ) ) ( not ( = ?auto_4401 ?auto_4408 ) ) ( not ( = ?auto_4401 ?auto_4406 ) ) ( not ( = ?auto_4401 ?auto_4405 ) ) ( not ( = ?auto_4401 ?auto_4413 ) ) ( not ( = ?auto_4401 ?auto_4407 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4389 ?auto_4390 ?auto_4391 ?auto_4392 ?auto_4393 ?auto_4394 ?auto_4396 )
      ( MAKE-1CRATE ?auto_4396 ?auto_4395 )
      ( MAKE-7CRATE-VERIFY ?auto_4389 ?auto_4390 ?auto_4391 ?auto_4392 ?auto_4393 ?auto_4394 ?auto_4396 ?auto_4395 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_4417 - SURFACE
      ?auto_4418 - SURFACE
    )
    :vars
    (
      ?auto_4419 - HOIST
      ?auto_4420 - PLACE
      ?auto_4422 - PLACE
      ?auto_4423 - HOIST
      ?auto_4424 - SURFACE
      ?auto_4421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4419 ?auto_4420 ) ( SURFACE-AT ?auto_4417 ?auto_4420 ) ( CLEAR ?auto_4417 ) ( IS-CRATE ?auto_4418 ) ( AVAILABLE ?auto_4419 ) ( not ( = ?auto_4422 ?auto_4420 ) ) ( HOIST-AT ?auto_4423 ?auto_4422 ) ( AVAILABLE ?auto_4423 ) ( SURFACE-AT ?auto_4418 ?auto_4422 ) ( ON ?auto_4418 ?auto_4424 ) ( CLEAR ?auto_4418 ) ( TRUCK-AT ?auto_4421 ?auto_4420 ) ( not ( = ?auto_4417 ?auto_4418 ) ) ( not ( = ?auto_4417 ?auto_4424 ) ) ( not ( = ?auto_4418 ?auto_4424 ) ) ( not ( = ?auto_4419 ?auto_4423 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_4421 ?auto_4420 ?auto_4422 )
      ( !LIFT ?auto_4423 ?auto_4418 ?auto_4424 ?auto_4422 )
      ( !LOAD ?auto_4423 ?auto_4418 ?auto_4421 ?auto_4422 )
      ( !DRIVE ?auto_4421 ?auto_4422 ?auto_4420 )
      ( !UNLOAD ?auto_4419 ?auto_4418 ?auto_4421 ?auto_4420 )
      ( !DROP ?auto_4419 ?auto_4418 ?auto_4417 ?auto_4420 )
      ( MAKE-1CRATE-VERIFY ?auto_4417 ?auto_4418 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_4434 - SURFACE
      ?auto_4435 - SURFACE
      ?auto_4436 - SURFACE
      ?auto_4437 - SURFACE
      ?auto_4438 - SURFACE
      ?auto_4439 - SURFACE
      ?auto_4442 - SURFACE
      ?auto_4441 - SURFACE
      ?auto_4440 - SURFACE
    )
    :vars
    (
      ?auto_4444 - HOIST
      ?auto_4446 - PLACE
      ?auto_4447 - PLACE
      ?auto_4448 - HOIST
      ?auto_4443 - SURFACE
      ?auto_4452 - PLACE
      ?auto_4449 - HOIST
      ?auto_4451 - SURFACE
      ?auto_4459 - PLACE
      ?auto_4460 - HOIST
      ?auto_4455 - SURFACE
      ?auto_4462 - SURFACE
      ?auto_4458 - PLACE
      ?auto_4456 - HOIST
      ?auto_4450 - SURFACE
      ?auto_4454 - SURFACE
      ?auto_4457 - SURFACE
      ?auto_4461 - PLACE
      ?auto_4453 - HOIST
      ?auto_4463 - SURFACE
      ?auto_4445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4444 ?auto_4446 ) ( IS-CRATE ?auto_4440 ) ( not ( = ?auto_4447 ?auto_4446 ) ) ( HOIST-AT ?auto_4448 ?auto_4447 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4440 ?auto_4447 ) ( ON ?auto_4440 ?auto_4443 ) ( CLEAR ?auto_4440 ) ( not ( = ?auto_4441 ?auto_4440 ) ) ( not ( = ?auto_4441 ?auto_4443 ) ) ( not ( = ?auto_4440 ?auto_4443 ) ) ( not ( = ?auto_4444 ?auto_4448 ) ) ( IS-CRATE ?auto_4441 ) ( not ( = ?auto_4452 ?auto_4446 ) ) ( HOIST-AT ?auto_4449 ?auto_4452 ) ( SURFACE-AT ?auto_4441 ?auto_4452 ) ( ON ?auto_4441 ?auto_4451 ) ( CLEAR ?auto_4441 ) ( not ( = ?auto_4442 ?auto_4441 ) ) ( not ( = ?auto_4442 ?auto_4451 ) ) ( not ( = ?auto_4441 ?auto_4451 ) ) ( not ( = ?auto_4444 ?auto_4449 ) ) ( IS-CRATE ?auto_4442 ) ( not ( = ?auto_4459 ?auto_4446 ) ) ( HOIST-AT ?auto_4460 ?auto_4459 ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4442 ?auto_4459 ) ( ON ?auto_4442 ?auto_4455 ) ( CLEAR ?auto_4442 ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4439 ?auto_4455 ) ) ( not ( = ?auto_4442 ?auto_4455 ) ) ( not ( = ?auto_4444 ?auto_4460 ) ) ( IS-CRATE ?auto_4439 ) ( SURFACE-AT ?auto_4439 ?auto_4452 ) ( ON ?auto_4439 ?auto_4462 ) ( CLEAR ?auto_4439 ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4462 ) ) ( not ( = ?auto_4439 ?auto_4462 ) ) ( IS-CRATE ?auto_4438 ) ( not ( = ?auto_4458 ?auto_4446 ) ) ( HOIST-AT ?auto_4456 ?auto_4458 ) ( SURFACE-AT ?auto_4438 ?auto_4458 ) ( ON ?auto_4438 ?auto_4450 ) ( CLEAR ?auto_4438 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( not ( = ?auto_4437 ?auto_4450 ) ) ( not ( = ?auto_4438 ?auto_4450 ) ) ( not ( = ?auto_4444 ?auto_4456 ) ) ( IS-CRATE ?auto_4437 ) ( AVAILABLE ?auto_4456 ) ( SURFACE-AT ?auto_4437 ?auto_4458 ) ( ON ?auto_4437 ?auto_4454 ) ( CLEAR ?auto_4437 ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4454 ) ) ( not ( = ?auto_4437 ?auto_4454 ) ) ( IS-CRATE ?auto_4436 ) ( AVAILABLE ?auto_4449 ) ( SURFACE-AT ?auto_4436 ?auto_4452 ) ( ON ?auto_4436 ?auto_4457 ) ( CLEAR ?auto_4436 ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4457 ) ) ( not ( = ?auto_4436 ?auto_4457 ) ) ( SURFACE-AT ?auto_4434 ?auto_4446 ) ( CLEAR ?auto_4434 ) ( IS-CRATE ?auto_4435 ) ( AVAILABLE ?auto_4444 ) ( not ( = ?auto_4461 ?auto_4446 ) ) ( HOIST-AT ?auto_4453 ?auto_4461 ) ( AVAILABLE ?auto_4453 ) ( SURFACE-AT ?auto_4435 ?auto_4461 ) ( ON ?auto_4435 ?auto_4463 ) ( CLEAR ?auto_4435 ) ( TRUCK-AT ?auto_4445 ?auto_4446 ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4463 ) ) ( not ( = ?auto_4435 ?auto_4463 ) ) ( not ( = ?auto_4444 ?auto_4453 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4434 ?auto_4457 ) ) ( not ( = ?auto_4436 ?auto_4463 ) ) ( not ( = ?auto_4452 ?auto_4461 ) ) ( not ( = ?auto_4449 ?auto_4453 ) ) ( not ( = ?auto_4457 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4454 ) ) ( not ( = ?auto_4435 ?auto_4437 ) ) ( not ( = ?auto_4435 ?auto_4454 ) ) ( not ( = ?auto_4437 ?auto_4457 ) ) ( not ( = ?auto_4437 ?auto_4463 ) ) ( not ( = ?auto_4458 ?auto_4452 ) ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( not ( = ?auto_4456 ?auto_4449 ) ) ( not ( = ?auto_4456 ?auto_4453 ) ) ( not ( = ?auto_4454 ?auto_4457 ) ) ( not ( = ?auto_4454 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4438 ) ) ( not ( = ?auto_4434 ?auto_4450 ) ) ( not ( = ?auto_4435 ?auto_4438 ) ) ( not ( = ?auto_4435 ?auto_4450 ) ) ( not ( = ?auto_4436 ?auto_4438 ) ) ( not ( = ?auto_4436 ?auto_4450 ) ) ( not ( = ?auto_4438 ?auto_4454 ) ) ( not ( = ?auto_4438 ?auto_4457 ) ) ( not ( = ?auto_4438 ?auto_4463 ) ) ( not ( = ?auto_4450 ?auto_4454 ) ) ( not ( = ?auto_4450 ?auto_4457 ) ) ( not ( = ?auto_4450 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4439 ) ) ( not ( = ?auto_4434 ?auto_4462 ) ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( not ( = ?auto_4435 ?auto_4462 ) ) ( not ( = ?auto_4436 ?auto_4439 ) ) ( not ( = ?auto_4436 ?auto_4462 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4437 ?auto_4462 ) ) ( not ( = ?auto_4439 ?auto_4450 ) ) ( not ( = ?auto_4439 ?auto_4454 ) ) ( not ( = ?auto_4439 ?auto_4457 ) ) ( not ( = ?auto_4439 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4450 ) ) ( not ( = ?auto_4462 ?auto_4454 ) ) ( not ( = ?auto_4462 ?auto_4457 ) ) ( not ( = ?auto_4462 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4442 ) ) ( not ( = ?auto_4434 ?auto_4455 ) ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4435 ?auto_4455 ) ) ( not ( = ?auto_4436 ?auto_4442 ) ) ( not ( = ?auto_4436 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4442 ) ) ( not ( = ?auto_4437 ?auto_4455 ) ) ( not ( = ?auto_4438 ?auto_4442 ) ) ( not ( = ?auto_4438 ?auto_4455 ) ) ( not ( = ?auto_4442 ?auto_4462 ) ) ( not ( = ?auto_4442 ?auto_4450 ) ) ( not ( = ?auto_4442 ?auto_4454 ) ) ( not ( = ?auto_4442 ?auto_4457 ) ) ( not ( = ?auto_4442 ?auto_4463 ) ) ( not ( = ?auto_4459 ?auto_4452 ) ) ( not ( = ?auto_4459 ?auto_4458 ) ) ( not ( = ?auto_4459 ?auto_4461 ) ) ( not ( = ?auto_4460 ?auto_4449 ) ) ( not ( = ?auto_4460 ?auto_4456 ) ) ( not ( = ?auto_4460 ?auto_4453 ) ) ( not ( = ?auto_4455 ?auto_4462 ) ) ( not ( = ?auto_4455 ?auto_4450 ) ) ( not ( = ?auto_4455 ?auto_4454 ) ) ( not ( = ?auto_4455 ?auto_4457 ) ) ( not ( = ?auto_4455 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4441 ) ) ( not ( = ?auto_4434 ?auto_4451 ) ) ( not ( = ?auto_4435 ?auto_4441 ) ) ( not ( = ?auto_4435 ?auto_4451 ) ) ( not ( = ?auto_4436 ?auto_4441 ) ) ( not ( = ?auto_4436 ?auto_4451 ) ) ( not ( = ?auto_4437 ?auto_4441 ) ) ( not ( = ?auto_4437 ?auto_4451 ) ) ( not ( = ?auto_4438 ?auto_4441 ) ) ( not ( = ?auto_4438 ?auto_4451 ) ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4451 ) ) ( not ( = ?auto_4441 ?auto_4455 ) ) ( not ( = ?auto_4441 ?auto_4462 ) ) ( not ( = ?auto_4441 ?auto_4450 ) ) ( not ( = ?auto_4441 ?auto_4454 ) ) ( not ( = ?auto_4441 ?auto_4457 ) ) ( not ( = ?auto_4441 ?auto_4463 ) ) ( not ( = ?auto_4451 ?auto_4455 ) ) ( not ( = ?auto_4451 ?auto_4462 ) ) ( not ( = ?auto_4451 ?auto_4450 ) ) ( not ( = ?auto_4451 ?auto_4454 ) ) ( not ( = ?auto_4451 ?auto_4457 ) ) ( not ( = ?auto_4451 ?auto_4463 ) ) ( not ( = ?auto_4434 ?auto_4440 ) ) ( not ( = ?auto_4434 ?auto_4443 ) ) ( not ( = ?auto_4435 ?auto_4440 ) ) ( not ( = ?auto_4435 ?auto_4443 ) ) ( not ( = ?auto_4436 ?auto_4440 ) ) ( not ( = ?auto_4436 ?auto_4443 ) ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( not ( = ?auto_4437 ?auto_4443 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4443 ) ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4443 ) ) ( not ( = ?auto_4442 ?auto_4440 ) ) ( not ( = ?auto_4442 ?auto_4443 ) ) ( not ( = ?auto_4440 ?auto_4451 ) ) ( not ( = ?auto_4440 ?auto_4455 ) ) ( not ( = ?auto_4440 ?auto_4462 ) ) ( not ( = ?auto_4440 ?auto_4450 ) ) ( not ( = ?auto_4440 ?auto_4454 ) ) ( not ( = ?auto_4440 ?auto_4457 ) ) ( not ( = ?auto_4440 ?auto_4463 ) ) ( not ( = ?auto_4447 ?auto_4452 ) ) ( not ( = ?auto_4447 ?auto_4459 ) ) ( not ( = ?auto_4447 ?auto_4458 ) ) ( not ( = ?auto_4447 ?auto_4461 ) ) ( not ( = ?auto_4448 ?auto_4449 ) ) ( not ( = ?auto_4448 ?auto_4460 ) ) ( not ( = ?auto_4448 ?auto_4456 ) ) ( not ( = ?auto_4448 ?auto_4453 ) ) ( not ( = ?auto_4443 ?auto_4451 ) ) ( not ( = ?auto_4443 ?auto_4455 ) ) ( not ( = ?auto_4443 ?auto_4462 ) ) ( not ( = ?auto_4443 ?auto_4450 ) ) ( not ( = ?auto_4443 ?auto_4454 ) ) ( not ( = ?auto_4443 ?auto_4457 ) ) ( not ( = ?auto_4443 ?auto_4463 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4442 ?auto_4441 )
      ( MAKE-1CRATE ?auto_4441 ?auto_4440 )
      ( MAKE-8CRATE-VERIFY ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4442 ?auto_4441 ?auto_4440 ) )
  )

)

