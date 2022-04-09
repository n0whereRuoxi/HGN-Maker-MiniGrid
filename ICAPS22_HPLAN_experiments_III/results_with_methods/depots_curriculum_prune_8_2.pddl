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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_4219 - SURFACE
      ?auto_4220 - SURFACE
      ?auto_4221 - SURFACE
    )
    :vars
    (
      ?auto_4225 - HOIST
      ?auto_4222 - PLACE
      ?auto_4224 - PLACE
      ?auto_4226 - HOIST
      ?auto_4223 - SURFACE
      ?auto_4229 - PLACE
      ?auto_4230 - HOIST
      ?auto_4228 - SURFACE
      ?auto_4227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4225 ?auto_4222 ) ( IS-CRATE ?auto_4221 ) ( not ( = ?auto_4224 ?auto_4222 ) ) ( HOIST-AT ?auto_4226 ?auto_4224 ) ( AVAILABLE ?auto_4226 ) ( SURFACE-AT ?auto_4221 ?auto_4224 ) ( ON ?auto_4221 ?auto_4223 ) ( CLEAR ?auto_4221 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4223 ) ) ( not ( = ?auto_4225 ?auto_4226 ) ) ( SURFACE-AT ?auto_4219 ?auto_4222 ) ( CLEAR ?auto_4219 ) ( IS-CRATE ?auto_4220 ) ( AVAILABLE ?auto_4225 ) ( not ( = ?auto_4229 ?auto_4222 ) ) ( HOIST-AT ?auto_4230 ?auto_4229 ) ( AVAILABLE ?auto_4230 ) ( SURFACE-AT ?auto_4220 ?auto_4229 ) ( ON ?auto_4220 ?auto_4228 ) ( CLEAR ?auto_4220 ) ( TRUCK-AT ?auto_4227 ?auto_4222 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4228 ) ) ( not ( = ?auto_4220 ?auto_4228 ) ) ( not ( = ?auto_4225 ?auto_4230 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4223 ) ) ( not ( = ?auto_4221 ?auto_4228 ) ) ( not ( = ?auto_4224 ?auto_4229 ) ) ( not ( = ?auto_4226 ?auto_4230 ) ) ( not ( = ?auto_4223 ?auto_4228 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_4219 ?auto_4220 )
      ( MAKE-1CRATE ?auto_4220 ?auto_4221 )
      ( MAKE-2CRATE-VERIFY ?auto_4219 ?auto_4220 ?auto_4221 ) )
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
      ?auto_4254 - HOIST
      ?auto_4253 - PLACE
      ?auto_4249 - PLACE
      ?auto_4251 - HOIST
      ?auto_4250 - SURFACE
      ?auto_4257 - PLACE
      ?auto_4259 - HOIST
      ?auto_4258 - SURFACE
      ?auto_4255 - PLACE
      ?auto_4256 - HOIST
      ?auto_4260 - SURFACE
      ?auto_4252 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4254 ?auto_4253 ) ( IS-CRATE ?auto_4248 ) ( not ( = ?auto_4249 ?auto_4253 ) ) ( HOIST-AT ?auto_4251 ?auto_4249 ) ( AVAILABLE ?auto_4251 ) ( SURFACE-AT ?auto_4248 ?auto_4249 ) ( ON ?auto_4248 ?auto_4250 ) ( CLEAR ?auto_4248 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4250 ) ) ( not ( = ?auto_4248 ?auto_4250 ) ) ( not ( = ?auto_4254 ?auto_4251 ) ) ( IS-CRATE ?auto_4247 ) ( not ( = ?auto_4257 ?auto_4253 ) ) ( HOIST-AT ?auto_4259 ?auto_4257 ) ( AVAILABLE ?auto_4259 ) ( SURFACE-AT ?auto_4247 ?auto_4257 ) ( ON ?auto_4247 ?auto_4258 ) ( CLEAR ?auto_4247 ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4258 ) ) ( not ( = ?auto_4247 ?auto_4258 ) ) ( not ( = ?auto_4254 ?auto_4259 ) ) ( SURFACE-AT ?auto_4245 ?auto_4253 ) ( CLEAR ?auto_4245 ) ( IS-CRATE ?auto_4246 ) ( AVAILABLE ?auto_4254 ) ( not ( = ?auto_4255 ?auto_4253 ) ) ( HOIST-AT ?auto_4256 ?auto_4255 ) ( AVAILABLE ?auto_4256 ) ( SURFACE-AT ?auto_4246 ?auto_4255 ) ( ON ?auto_4246 ?auto_4260 ) ( CLEAR ?auto_4246 ) ( TRUCK-AT ?auto_4252 ?auto_4253 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4260 ) ) ( not ( = ?auto_4246 ?auto_4260 ) ) ( not ( = ?auto_4254 ?auto_4256 ) ) ( not ( = ?auto_4245 ?auto_4247 ) ) ( not ( = ?auto_4245 ?auto_4258 ) ) ( not ( = ?auto_4247 ?auto_4260 ) ) ( not ( = ?auto_4257 ?auto_4255 ) ) ( not ( = ?auto_4259 ?auto_4256 ) ) ( not ( = ?auto_4258 ?auto_4260 ) ) ( not ( = ?auto_4245 ?auto_4248 ) ) ( not ( = ?auto_4245 ?auto_4250 ) ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4246 ?auto_4250 ) ) ( not ( = ?auto_4248 ?auto_4258 ) ) ( not ( = ?auto_4248 ?auto_4260 ) ) ( not ( = ?auto_4249 ?auto_4257 ) ) ( not ( = ?auto_4249 ?auto_4255 ) ) ( not ( = ?auto_4251 ?auto_4259 ) ) ( not ( = ?auto_4251 ?auto_4256 ) ) ( not ( = ?auto_4250 ?auto_4258 ) ) ( not ( = ?auto_4250 ?auto_4260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_4245 ?auto_4246 ?auto_4247 )
      ( MAKE-1CRATE ?auto_4247 ?auto_4248 )
      ( MAKE-3CRATE-VERIFY ?auto_4245 ?auto_4246 ?auto_4247 ?auto_4248 ) )
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
      ?auto_4285 - HOIST
      ?auto_4286 - PLACE
      ?auto_4284 - PLACE
      ?auto_4281 - HOIST
      ?auto_4283 - SURFACE
      ?auto_4289 - SURFACE
      ?auto_4291 - PLACE
      ?auto_4292 - HOIST
      ?auto_4293 - SURFACE
      ?auto_4287 - PLACE
      ?auto_4288 - HOIST
      ?auto_4290 - SURFACE
      ?auto_4282 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4285 ?auto_4286 ) ( IS-CRATE ?auto_4280 ) ( not ( = ?auto_4284 ?auto_4286 ) ) ( HOIST-AT ?auto_4281 ?auto_4284 ) ( SURFACE-AT ?auto_4280 ?auto_4284 ) ( ON ?auto_4280 ?auto_4283 ) ( CLEAR ?auto_4280 ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4283 ) ) ( not ( = ?auto_4280 ?auto_4283 ) ) ( not ( = ?auto_4285 ?auto_4281 ) ) ( IS-CRATE ?auto_4279 ) ( AVAILABLE ?auto_4281 ) ( SURFACE-AT ?auto_4279 ?auto_4284 ) ( ON ?auto_4279 ?auto_4289 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4289 ) ) ( not ( = ?auto_4279 ?auto_4289 ) ) ( IS-CRATE ?auto_4278 ) ( not ( = ?auto_4291 ?auto_4286 ) ) ( HOIST-AT ?auto_4292 ?auto_4291 ) ( AVAILABLE ?auto_4292 ) ( SURFACE-AT ?auto_4278 ?auto_4291 ) ( ON ?auto_4278 ?auto_4293 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4293 ) ) ( not ( = ?auto_4278 ?auto_4293 ) ) ( not ( = ?auto_4285 ?auto_4292 ) ) ( SURFACE-AT ?auto_4276 ?auto_4286 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( AVAILABLE ?auto_4285 ) ( not ( = ?auto_4287 ?auto_4286 ) ) ( HOIST-AT ?auto_4288 ?auto_4287 ) ( AVAILABLE ?auto_4288 ) ( SURFACE-AT ?auto_4277 ?auto_4287 ) ( ON ?auto_4277 ?auto_4290 ) ( CLEAR ?auto_4277 ) ( TRUCK-AT ?auto_4282 ?auto_4286 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4290 ) ) ( not ( = ?auto_4277 ?auto_4290 ) ) ( not ( = ?auto_4285 ?auto_4288 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4293 ) ) ( not ( = ?auto_4278 ?auto_4290 ) ) ( not ( = ?auto_4291 ?auto_4287 ) ) ( not ( = ?auto_4292 ?auto_4288 ) ) ( not ( = ?auto_4293 ?auto_4290 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4289 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4289 ) ) ( not ( = ?auto_4279 ?auto_4293 ) ) ( not ( = ?auto_4279 ?auto_4290 ) ) ( not ( = ?auto_4284 ?auto_4291 ) ) ( not ( = ?auto_4284 ?auto_4287 ) ) ( not ( = ?auto_4281 ?auto_4292 ) ) ( not ( = ?auto_4281 ?auto_4288 ) ) ( not ( = ?auto_4289 ?auto_4293 ) ) ( not ( = ?auto_4289 ?auto_4290 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4283 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4283 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4283 ) ) ( not ( = ?auto_4280 ?auto_4289 ) ) ( not ( = ?auto_4280 ?auto_4293 ) ) ( not ( = ?auto_4280 ?auto_4290 ) ) ( not ( = ?auto_4283 ?auto_4289 ) ) ( not ( = ?auto_4283 ?auto_4293 ) ) ( not ( = ?auto_4283 ?auto_4290 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 )
      ( MAKE-1CRATE ?auto_4279 ?auto_4280 )
      ( MAKE-4CRATE-VERIFY ?auto_4276 ?auto_4277 ?auto_4278 ?auto_4279 ?auto_4280 ) )
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
      ?auto_4321 - HOIST
      ?auto_4319 - PLACE
      ?auto_4318 - PLACE
      ?auto_4317 - HOIST
      ?auto_4320 - SURFACE
      ?auto_4325 - PLACE
      ?auto_4324 - HOIST
      ?auto_4326 - SURFACE
      ?auto_4327 - SURFACE
      ?auto_4322 - SURFACE
      ?auto_4329 - PLACE
      ?auto_4323 - HOIST
      ?auto_4328 - SURFACE
      ?auto_4316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4321 ?auto_4319 ) ( IS-CRATE ?auto_4315 ) ( not ( = ?auto_4318 ?auto_4319 ) ) ( HOIST-AT ?auto_4317 ?auto_4318 ) ( SURFACE-AT ?auto_4315 ?auto_4318 ) ( ON ?auto_4315 ?auto_4320 ) ( CLEAR ?auto_4315 ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4320 ) ) ( not ( = ?auto_4315 ?auto_4320 ) ) ( not ( = ?auto_4321 ?auto_4317 ) ) ( IS-CRATE ?auto_4314 ) ( not ( = ?auto_4325 ?auto_4319 ) ) ( HOIST-AT ?auto_4324 ?auto_4325 ) ( SURFACE-AT ?auto_4314 ?auto_4325 ) ( ON ?auto_4314 ?auto_4326 ) ( CLEAR ?auto_4314 ) ( not ( = ?auto_4313 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4326 ) ) ( not ( = ?auto_4314 ?auto_4326 ) ) ( not ( = ?auto_4321 ?auto_4324 ) ) ( IS-CRATE ?auto_4313 ) ( AVAILABLE ?auto_4324 ) ( SURFACE-AT ?auto_4313 ?auto_4325 ) ( ON ?auto_4313 ?auto_4327 ) ( CLEAR ?auto_4313 ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4327 ) ) ( not ( = ?auto_4313 ?auto_4327 ) ) ( IS-CRATE ?auto_4312 ) ( AVAILABLE ?auto_4317 ) ( SURFACE-AT ?auto_4312 ?auto_4318 ) ( ON ?auto_4312 ?auto_4322 ) ( CLEAR ?auto_4312 ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4322 ) ) ( SURFACE-AT ?auto_4310 ?auto_4319 ) ( CLEAR ?auto_4310 ) ( IS-CRATE ?auto_4311 ) ( AVAILABLE ?auto_4321 ) ( not ( = ?auto_4329 ?auto_4319 ) ) ( HOIST-AT ?auto_4323 ?auto_4329 ) ( AVAILABLE ?auto_4323 ) ( SURFACE-AT ?auto_4311 ?auto_4329 ) ( ON ?auto_4311 ?auto_4328 ) ( CLEAR ?auto_4311 ) ( TRUCK-AT ?auto_4316 ?auto_4319 ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4328 ) ) ( not ( = ?auto_4311 ?auto_4328 ) ) ( not ( = ?auto_4321 ?auto_4323 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4328 ) ) ( not ( = ?auto_4318 ?auto_4329 ) ) ( not ( = ?auto_4317 ?auto_4323 ) ) ( not ( = ?auto_4322 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4310 ?auto_4327 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4327 ) ) ( not ( = ?auto_4313 ?auto_4322 ) ) ( not ( = ?auto_4313 ?auto_4328 ) ) ( not ( = ?auto_4325 ?auto_4318 ) ) ( not ( = ?auto_4325 ?auto_4329 ) ) ( not ( = ?auto_4324 ?auto_4317 ) ) ( not ( = ?auto_4324 ?auto_4323 ) ) ( not ( = ?auto_4327 ?auto_4322 ) ) ( not ( = ?auto_4327 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4314 ) ) ( not ( = ?auto_4310 ?auto_4326 ) ) ( not ( = ?auto_4311 ?auto_4314 ) ) ( not ( = ?auto_4311 ?auto_4326 ) ) ( not ( = ?auto_4312 ?auto_4314 ) ) ( not ( = ?auto_4312 ?auto_4326 ) ) ( not ( = ?auto_4314 ?auto_4327 ) ) ( not ( = ?auto_4314 ?auto_4322 ) ) ( not ( = ?auto_4314 ?auto_4328 ) ) ( not ( = ?auto_4326 ?auto_4327 ) ) ( not ( = ?auto_4326 ?auto_4322 ) ) ( not ( = ?auto_4326 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4315 ) ) ( not ( = ?auto_4310 ?auto_4320 ) ) ( not ( = ?auto_4311 ?auto_4315 ) ) ( not ( = ?auto_4311 ?auto_4320 ) ) ( not ( = ?auto_4312 ?auto_4315 ) ) ( not ( = ?auto_4312 ?auto_4320 ) ) ( not ( = ?auto_4313 ?auto_4315 ) ) ( not ( = ?auto_4313 ?auto_4320 ) ) ( not ( = ?auto_4315 ?auto_4326 ) ) ( not ( = ?auto_4315 ?auto_4327 ) ) ( not ( = ?auto_4315 ?auto_4322 ) ) ( not ( = ?auto_4315 ?auto_4328 ) ) ( not ( = ?auto_4320 ?auto_4326 ) ) ( not ( = ?auto_4320 ?auto_4327 ) ) ( not ( = ?auto_4320 ?auto_4322 ) ) ( not ( = ?auto_4320 ?auto_4328 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_4310 ?auto_4311 ?auto_4312 ?auto_4313 ?auto_4314 )
      ( MAKE-1CRATE ?auto_4314 ?auto_4315 )
      ( MAKE-5CRATE-VERIFY ?auto_4310 ?auto_4311 ?auto_4312 ?auto_4313 ?auto_4314 ?auto_4315 ) )
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
      ?auto_4358 - HOIST
      ?auto_4354 - PLACE
      ?auto_4355 - PLACE
      ?auto_4356 - HOIST
      ?auto_4359 - SURFACE
      ?auto_4361 - PLACE
      ?auto_4370 - HOIST
      ?auto_4365 - SURFACE
      ?auto_4366 - PLACE
      ?auto_4368 - HOIST
      ?auto_4367 - SURFACE
      ?auto_4364 - SURFACE
      ?auto_4363 - SURFACE
      ?auto_4362 - PLACE
      ?auto_4369 - HOIST
      ?auto_4360 - SURFACE
      ?auto_4357 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4358 ?auto_4354 ) ( IS-CRATE ?auto_4353 ) ( not ( = ?auto_4355 ?auto_4354 ) ) ( HOIST-AT ?auto_4356 ?auto_4355 ) ( AVAILABLE ?auto_4356 ) ( SURFACE-AT ?auto_4353 ?auto_4355 ) ( ON ?auto_4353 ?auto_4359 ) ( CLEAR ?auto_4353 ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4359 ) ) ( not ( = ?auto_4353 ?auto_4359 ) ) ( not ( = ?auto_4358 ?auto_4356 ) ) ( IS-CRATE ?auto_4352 ) ( not ( = ?auto_4361 ?auto_4354 ) ) ( HOIST-AT ?auto_4370 ?auto_4361 ) ( SURFACE-AT ?auto_4352 ?auto_4361 ) ( ON ?auto_4352 ?auto_4365 ) ( CLEAR ?auto_4352 ) ( not ( = ?auto_4351 ?auto_4352 ) ) ( not ( = ?auto_4351 ?auto_4365 ) ) ( not ( = ?auto_4352 ?auto_4365 ) ) ( not ( = ?auto_4358 ?auto_4370 ) ) ( IS-CRATE ?auto_4351 ) ( not ( = ?auto_4366 ?auto_4354 ) ) ( HOIST-AT ?auto_4368 ?auto_4366 ) ( SURFACE-AT ?auto_4351 ?auto_4366 ) ( ON ?auto_4351 ?auto_4367 ) ( CLEAR ?auto_4351 ) ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4350 ?auto_4367 ) ) ( not ( = ?auto_4351 ?auto_4367 ) ) ( not ( = ?auto_4358 ?auto_4368 ) ) ( IS-CRATE ?auto_4350 ) ( AVAILABLE ?auto_4368 ) ( SURFACE-AT ?auto_4350 ?auto_4366 ) ( ON ?auto_4350 ?auto_4364 ) ( CLEAR ?auto_4350 ) ( not ( = ?auto_4349 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4364 ) ) ( not ( = ?auto_4350 ?auto_4364 ) ) ( IS-CRATE ?auto_4349 ) ( AVAILABLE ?auto_4370 ) ( SURFACE-AT ?auto_4349 ?auto_4361 ) ( ON ?auto_4349 ?auto_4363 ) ( CLEAR ?auto_4349 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4363 ) ) ( not ( = ?auto_4349 ?auto_4363 ) ) ( SURFACE-AT ?auto_4347 ?auto_4354 ) ( CLEAR ?auto_4347 ) ( IS-CRATE ?auto_4348 ) ( AVAILABLE ?auto_4358 ) ( not ( = ?auto_4362 ?auto_4354 ) ) ( HOIST-AT ?auto_4369 ?auto_4362 ) ( AVAILABLE ?auto_4369 ) ( SURFACE-AT ?auto_4348 ?auto_4362 ) ( ON ?auto_4348 ?auto_4360 ) ( CLEAR ?auto_4348 ) ( TRUCK-AT ?auto_4357 ?auto_4354 ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4360 ) ) ( not ( = ?auto_4348 ?auto_4360 ) ) ( not ( = ?auto_4358 ?auto_4369 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4347 ?auto_4363 ) ) ( not ( = ?auto_4349 ?auto_4360 ) ) ( not ( = ?auto_4361 ?auto_4362 ) ) ( not ( = ?auto_4370 ?auto_4369 ) ) ( not ( = ?auto_4363 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( not ( = ?auto_4347 ?auto_4364 ) ) ( not ( = ?auto_4348 ?auto_4350 ) ) ( not ( = ?auto_4348 ?auto_4364 ) ) ( not ( = ?auto_4350 ?auto_4363 ) ) ( not ( = ?auto_4350 ?auto_4360 ) ) ( not ( = ?auto_4366 ?auto_4361 ) ) ( not ( = ?auto_4366 ?auto_4362 ) ) ( not ( = ?auto_4368 ?auto_4370 ) ) ( not ( = ?auto_4368 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4363 ) ) ( not ( = ?auto_4364 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4351 ) ) ( not ( = ?auto_4347 ?auto_4367 ) ) ( not ( = ?auto_4348 ?auto_4351 ) ) ( not ( = ?auto_4348 ?auto_4367 ) ) ( not ( = ?auto_4349 ?auto_4351 ) ) ( not ( = ?auto_4349 ?auto_4367 ) ) ( not ( = ?auto_4351 ?auto_4364 ) ) ( not ( = ?auto_4351 ?auto_4363 ) ) ( not ( = ?auto_4351 ?auto_4360 ) ) ( not ( = ?auto_4367 ?auto_4364 ) ) ( not ( = ?auto_4367 ?auto_4363 ) ) ( not ( = ?auto_4367 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4352 ) ) ( not ( = ?auto_4347 ?auto_4365 ) ) ( not ( = ?auto_4348 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4365 ) ) ( not ( = ?auto_4349 ?auto_4352 ) ) ( not ( = ?auto_4349 ?auto_4365 ) ) ( not ( = ?auto_4350 ?auto_4352 ) ) ( not ( = ?auto_4350 ?auto_4365 ) ) ( not ( = ?auto_4352 ?auto_4367 ) ) ( not ( = ?auto_4352 ?auto_4364 ) ) ( not ( = ?auto_4352 ?auto_4363 ) ) ( not ( = ?auto_4352 ?auto_4360 ) ) ( not ( = ?auto_4365 ?auto_4367 ) ) ( not ( = ?auto_4365 ?auto_4364 ) ) ( not ( = ?auto_4365 ?auto_4363 ) ) ( not ( = ?auto_4365 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4353 ) ) ( not ( = ?auto_4347 ?auto_4359 ) ) ( not ( = ?auto_4348 ?auto_4353 ) ) ( not ( = ?auto_4348 ?auto_4359 ) ) ( not ( = ?auto_4349 ?auto_4353 ) ) ( not ( = ?auto_4349 ?auto_4359 ) ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( not ( = ?auto_4350 ?auto_4359 ) ) ( not ( = ?auto_4351 ?auto_4353 ) ) ( not ( = ?auto_4351 ?auto_4359 ) ) ( not ( = ?auto_4353 ?auto_4365 ) ) ( not ( = ?auto_4353 ?auto_4367 ) ) ( not ( = ?auto_4353 ?auto_4364 ) ) ( not ( = ?auto_4353 ?auto_4363 ) ) ( not ( = ?auto_4353 ?auto_4360 ) ) ( not ( = ?auto_4355 ?auto_4361 ) ) ( not ( = ?auto_4355 ?auto_4366 ) ) ( not ( = ?auto_4355 ?auto_4362 ) ) ( not ( = ?auto_4356 ?auto_4370 ) ) ( not ( = ?auto_4356 ?auto_4368 ) ) ( not ( = ?auto_4356 ?auto_4369 ) ) ( not ( = ?auto_4359 ?auto_4365 ) ) ( not ( = ?auto_4359 ?auto_4367 ) ) ( not ( = ?auto_4359 ?auto_4364 ) ) ( not ( = ?auto_4359 ?auto_4363 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_4347 ?auto_4348 ?auto_4349 ?auto_4350 ?auto_4351 ?auto_4352 )
      ( MAKE-1CRATE ?auto_4352 ?auto_4353 )
      ( MAKE-6CRATE-VERIFY ?auto_4347 ?auto_4348 ?auto_4349 ?auto_4350 ?auto_4351 ?auto_4352 ?auto_4353 ) )
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
      ?auto_4395 - SURFACE
      ?auto_4396 - SURFACE
    )
    :vars
    (
      ?auto_4402 - HOIST
      ?auto_4401 - PLACE
      ?auto_4397 - PLACE
      ?auto_4398 - HOIST
      ?auto_4399 - SURFACE
      ?auto_4413 - PLACE
      ?auto_4414 - HOIST
      ?auto_4407 - SURFACE
      ?auto_4411 - SURFACE
      ?auto_4405 - PLACE
      ?auto_4406 - HOIST
      ?auto_4412 - SURFACE
      ?auto_4408 - SURFACE
      ?auto_4410 - SURFACE
      ?auto_4403 - PLACE
      ?auto_4404 - HOIST
      ?auto_4409 - SURFACE
      ?auto_4400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4402 ?auto_4401 ) ( IS-CRATE ?auto_4396 ) ( not ( = ?auto_4397 ?auto_4401 ) ) ( HOIST-AT ?auto_4398 ?auto_4397 ) ( SURFACE-AT ?auto_4396 ?auto_4397 ) ( ON ?auto_4396 ?auto_4399 ) ( CLEAR ?auto_4396 ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4399 ) ) ( not ( = ?auto_4396 ?auto_4399 ) ) ( not ( = ?auto_4402 ?auto_4398 ) ) ( IS-CRATE ?auto_4395 ) ( not ( = ?auto_4413 ?auto_4401 ) ) ( HOIST-AT ?auto_4414 ?auto_4413 ) ( AVAILABLE ?auto_4414 ) ( SURFACE-AT ?auto_4395 ?auto_4413 ) ( ON ?auto_4395 ?auto_4407 ) ( CLEAR ?auto_4395 ) ( not ( = ?auto_4394 ?auto_4395 ) ) ( not ( = ?auto_4394 ?auto_4407 ) ) ( not ( = ?auto_4395 ?auto_4407 ) ) ( not ( = ?auto_4402 ?auto_4414 ) ) ( IS-CRATE ?auto_4394 ) ( SURFACE-AT ?auto_4394 ?auto_4397 ) ( ON ?auto_4394 ?auto_4411 ) ( CLEAR ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( not ( = ?auto_4393 ?auto_4411 ) ) ( not ( = ?auto_4394 ?auto_4411 ) ) ( IS-CRATE ?auto_4393 ) ( not ( = ?auto_4405 ?auto_4401 ) ) ( HOIST-AT ?auto_4406 ?auto_4405 ) ( SURFACE-AT ?auto_4393 ?auto_4405 ) ( ON ?auto_4393 ?auto_4412 ) ( CLEAR ?auto_4393 ) ( not ( = ?auto_4392 ?auto_4393 ) ) ( not ( = ?auto_4392 ?auto_4412 ) ) ( not ( = ?auto_4393 ?auto_4412 ) ) ( not ( = ?auto_4402 ?auto_4406 ) ) ( IS-CRATE ?auto_4392 ) ( AVAILABLE ?auto_4406 ) ( SURFACE-AT ?auto_4392 ?auto_4405 ) ( ON ?auto_4392 ?auto_4408 ) ( CLEAR ?auto_4392 ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4391 ?auto_4408 ) ) ( not ( = ?auto_4392 ?auto_4408 ) ) ( IS-CRATE ?auto_4391 ) ( AVAILABLE ?auto_4398 ) ( SURFACE-AT ?auto_4391 ?auto_4397 ) ( ON ?auto_4391 ?auto_4410 ) ( CLEAR ?auto_4391 ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4410 ) ) ( not ( = ?auto_4391 ?auto_4410 ) ) ( SURFACE-AT ?auto_4389 ?auto_4401 ) ( CLEAR ?auto_4389 ) ( IS-CRATE ?auto_4390 ) ( AVAILABLE ?auto_4402 ) ( not ( = ?auto_4403 ?auto_4401 ) ) ( HOIST-AT ?auto_4404 ?auto_4403 ) ( AVAILABLE ?auto_4404 ) ( SURFACE-AT ?auto_4390 ?auto_4403 ) ( ON ?auto_4390 ?auto_4409 ) ( CLEAR ?auto_4390 ) ( TRUCK-AT ?auto_4400 ?auto_4401 ) ( not ( = ?auto_4389 ?auto_4390 ) ) ( not ( = ?auto_4389 ?auto_4409 ) ) ( not ( = ?auto_4390 ?auto_4409 ) ) ( not ( = ?auto_4402 ?auto_4404 ) ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4389 ?auto_4410 ) ) ( not ( = ?auto_4391 ?auto_4409 ) ) ( not ( = ?auto_4397 ?auto_4403 ) ) ( not ( = ?auto_4398 ?auto_4404 ) ) ( not ( = ?auto_4410 ?auto_4409 ) ) ( not ( = ?auto_4389 ?auto_4392 ) ) ( not ( = ?auto_4389 ?auto_4408 ) ) ( not ( = ?auto_4390 ?auto_4392 ) ) ( not ( = ?auto_4390 ?auto_4408 ) ) ( not ( = ?auto_4392 ?auto_4410 ) ) ( not ( = ?auto_4392 ?auto_4409 ) ) ( not ( = ?auto_4405 ?auto_4397 ) ) ( not ( = ?auto_4405 ?auto_4403 ) ) ( not ( = ?auto_4406 ?auto_4398 ) ) ( not ( = ?auto_4406 ?auto_4404 ) ) ( not ( = ?auto_4408 ?auto_4410 ) ) ( not ( = ?auto_4408 ?auto_4409 ) ) ( not ( = ?auto_4389 ?auto_4393 ) ) ( not ( = ?auto_4389 ?auto_4412 ) ) ( not ( = ?auto_4390 ?auto_4393 ) ) ( not ( = ?auto_4390 ?auto_4412 ) ) ( not ( = ?auto_4391 ?auto_4393 ) ) ( not ( = ?auto_4391 ?auto_4412 ) ) ( not ( = ?auto_4393 ?auto_4408 ) ) ( not ( = ?auto_4393 ?auto_4410 ) ) ( not ( = ?auto_4393 ?auto_4409 ) ) ( not ( = ?auto_4412 ?auto_4408 ) ) ( not ( = ?auto_4412 ?auto_4410 ) ) ( not ( = ?auto_4412 ?auto_4409 ) ) ( not ( = ?auto_4389 ?auto_4394 ) ) ( not ( = ?auto_4389 ?auto_4411 ) ) ( not ( = ?auto_4390 ?auto_4394 ) ) ( not ( = ?auto_4390 ?auto_4411 ) ) ( not ( = ?auto_4391 ?auto_4394 ) ) ( not ( = ?auto_4391 ?auto_4411 ) ) ( not ( = ?auto_4392 ?auto_4394 ) ) ( not ( = ?auto_4392 ?auto_4411 ) ) ( not ( = ?auto_4394 ?auto_4412 ) ) ( not ( = ?auto_4394 ?auto_4408 ) ) ( not ( = ?auto_4394 ?auto_4410 ) ) ( not ( = ?auto_4394 ?auto_4409 ) ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( not ( = ?auto_4411 ?auto_4408 ) ) ( not ( = ?auto_4411 ?auto_4410 ) ) ( not ( = ?auto_4411 ?auto_4409 ) ) ( not ( = ?auto_4389 ?auto_4395 ) ) ( not ( = ?auto_4389 ?auto_4407 ) ) ( not ( = ?auto_4390 ?auto_4395 ) ) ( not ( = ?auto_4390 ?auto_4407 ) ) ( not ( = ?auto_4391 ?auto_4395 ) ) ( not ( = ?auto_4391 ?auto_4407 ) ) ( not ( = ?auto_4392 ?auto_4395 ) ) ( not ( = ?auto_4392 ?auto_4407 ) ) ( not ( = ?auto_4393 ?auto_4395 ) ) ( not ( = ?auto_4393 ?auto_4407 ) ) ( not ( = ?auto_4395 ?auto_4411 ) ) ( not ( = ?auto_4395 ?auto_4412 ) ) ( not ( = ?auto_4395 ?auto_4408 ) ) ( not ( = ?auto_4395 ?auto_4410 ) ) ( not ( = ?auto_4395 ?auto_4409 ) ) ( not ( = ?auto_4413 ?auto_4397 ) ) ( not ( = ?auto_4413 ?auto_4405 ) ) ( not ( = ?auto_4413 ?auto_4403 ) ) ( not ( = ?auto_4414 ?auto_4398 ) ) ( not ( = ?auto_4414 ?auto_4406 ) ) ( not ( = ?auto_4414 ?auto_4404 ) ) ( not ( = ?auto_4407 ?auto_4411 ) ) ( not ( = ?auto_4407 ?auto_4412 ) ) ( not ( = ?auto_4407 ?auto_4408 ) ) ( not ( = ?auto_4407 ?auto_4410 ) ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4389 ?auto_4396 ) ) ( not ( = ?auto_4389 ?auto_4399 ) ) ( not ( = ?auto_4390 ?auto_4396 ) ) ( not ( = ?auto_4390 ?auto_4399 ) ) ( not ( = ?auto_4391 ?auto_4396 ) ) ( not ( = ?auto_4391 ?auto_4399 ) ) ( not ( = ?auto_4392 ?auto_4396 ) ) ( not ( = ?auto_4392 ?auto_4399 ) ) ( not ( = ?auto_4393 ?auto_4396 ) ) ( not ( = ?auto_4393 ?auto_4399 ) ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( not ( = ?auto_4394 ?auto_4399 ) ) ( not ( = ?auto_4396 ?auto_4407 ) ) ( not ( = ?auto_4396 ?auto_4411 ) ) ( not ( = ?auto_4396 ?auto_4412 ) ) ( not ( = ?auto_4396 ?auto_4408 ) ) ( not ( = ?auto_4396 ?auto_4410 ) ) ( not ( = ?auto_4396 ?auto_4409 ) ) ( not ( = ?auto_4399 ?auto_4407 ) ) ( not ( = ?auto_4399 ?auto_4411 ) ) ( not ( = ?auto_4399 ?auto_4412 ) ) ( not ( = ?auto_4399 ?auto_4408 ) ) ( not ( = ?auto_4399 ?auto_4410 ) ) ( not ( = ?auto_4399 ?auto_4409 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_4389 ?auto_4390 ?auto_4391 ?auto_4392 ?auto_4393 ?auto_4394 ?auto_4395 )
      ( MAKE-1CRATE ?auto_4395 ?auto_4396 )
      ( MAKE-7CRATE-VERIFY ?auto_4389 ?auto_4390 ?auto_4391 ?auto_4392 ?auto_4393 ?auto_4394 ?auto_4395 ?auto_4396 ) )
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
      ?auto_4440 - SURFACE
      ?auto_4441 - SURFACE
      ?auto_4442 - SURFACE
    )
    :vars
    (
      ?auto_4444 - HOIST
      ?auto_4443 - PLACE
      ?auto_4445 - PLACE
      ?auto_4446 - HOIST
      ?auto_4448 - SURFACE
      ?auto_4463 - PLACE
      ?auto_4459 - HOIST
      ?auto_4460 - SURFACE
      ?auto_4450 - PLACE
      ?auto_4462 - HOIST
      ?auto_4457 - SURFACE
      ?auto_4456 - SURFACE
      ?auto_4454 - PLACE
      ?auto_4458 - HOIST
      ?auto_4449 - SURFACE
      ?auto_4455 - SURFACE
      ?auto_4453 - SURFACE
      ?auto_4452 - PLACE
      ?auto_4461 - HOIST
      ?auto_4451 - SURFACE
      ?auto_4447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4444 ?auto_4443 ) ( IS-CRATE ?auto_4442 ) ( not ( = ?auto_4445 ?auto_4443 ) ) ( HOIST-AT ?auto_4446 ?auto_4445 ) ( AVAILABLE ?auto_4446 ) ( SURFACE-AT ?auto_4442 ?auto_4445 ) ( ON ?auto_4442 ?auto_4448 ) ( CLEAR ?auto_4442 ) ( not ( = ?auto_4441 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4448 ) ) ( not ( = ?auto_4442 ?auto_4448 ) ) ( not ( = ?auto_4444 ?auto_4446 ) ) ( IS-CRATE ?auto_4441 ) ( not ( = ?auto_4463 ?auto_4443 ) ) ( HOIST-AT ?auto_4459 ?auto_4463 ) ( SURFACE-AT ?auto_4441 ?auto_4463 ) ( ON ?auto_4441 ?auto_4460 ) ( CLEAR ?auto_4441 ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( not ( = ?auto_4440 ?auto_4460 ) ) ( not ( = ?auto_4441 ?auto_4460 ) ) ( not ( = ?auto_4444 ?auto_4459 ) ) ( IS-CRATE ?auto_4440 ) ( not ( = ?auto_4450 ?auto_4443 ) ) ( HOIST-AT ?auto_4462 ?auto_4450 ) ( AVAILABLE ?auto_4462 ) ( SURFACE-AT ?auto_4440 ?auto_4450 ) ( ON ?auto_4440 ?auto_4457 ) ( CLEAR ?auto_4440 ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4457 ) ) ( not ( = ?auto_4440 ?auto_4457 ) ) ( not ( = ?auto_4444 ?auto_4462 ) ) ( IS-CRATE ?auto_4439 ) ( SURFACE-AT ?auto_4439 ?auto_4463 ) ( ON ?auto_4439 ?auto_4456 ) ( CLEAR ?auto_4439 ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4456 ) ) ( not ( = ?auto_4439 ?auto_4456 ) ) ( IS-CRATE ?auto_4438 ) ( not ( = ?auto_4454 ?auto_4443 ) ) ( HOIST-AT ?auto_4458 ?auto_4454 ) ( SURFACE-AT ?auto_4438 ?auto_4454 ) ( ON ?auto_4438 ?auto_4449 ) ( CLEAR ?auto_4438 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( not ( = ?auto_4437 ?auto_4449 ) ) ( not ( = ?auto_4438 ?auto_4449 ) ) ( not ( = ?auto_4444 ?auto_4458 ) ) ( IS-CRATE ?auto_4437 ) ( AVAILABLE ?auto_4458 ) ( SURFACE-AT ?auto_4437 ?auto_4454 ) ( ON ?auto_4437 ?auto_4455 ) ( CLEAR ?auto_4437 ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4455 ) ) ( IS-CRATE ?auto_4436 ) ( AVAILABLE ?auto_4459 ) ( SURFACE-AT ?auto_4436 ?auto_4463 ) ( ON ?auto_4436 ?auto_4453 ) ( CLEAR ?auto_4436 ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4453 ) ) ( not ( = ?auto_4436 ?auto_4453 ) ) ( SURFACE-AT ?auto_4434 ?auto_4443 ) ( CLEAR ?auto_4434 ) ( IS-CRATE ?auto_4435 ) ( AVAILABLE ?auto_4444 ) ( not ( = ?auto_4452 ?auto_4443 ) ) ( HOIST-AT ?auto_4461 ?auto_4452 ) ( AVAILABLE ?auto_4461 ) ( SURFACE-AT ?auto_4435 ?auto_4452 ) ( ON ?auto_4435 ?auto_4451 ) ( CLEAR ?auto_4435 ) ( TRUCK-AT ?auto_4447 ?auto_4443 ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4451 ) ) ( not ( = ?auto_4435 ?auto_4451 ) ) ( not ( = ?auto_4444 ?auto_4461 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4434 ?auto_4453 ) ) ( not ( = ?auto_4436 ?auto_4451 ) ) ( not ( = ?auto_4463 ?auto_4452 ) ) ( not ( = ?auto_4459 ?auto_4461 ) ) ( not ( = ?auto_4453 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4455 ) ) ( not ( = ?auto_4435 ?auto_4437 ) ) ( not ( = ?auto_4435 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4453 ) ) ( not ( = ?auto_4437 ?auto_4451 ) ) ( not ( = ?auto_4454 ?auto_4463 ) ) ( not ( = ?auto_4454 ?auto_4452 ) ) ( not ( = ?auto_4458 ?auto_4459 ) ) ( not ( = ?auto_4458 ?auto_4461 ) ) ( not ( = ?auto_4455 ?auto_4453 ) ) ( not ( = ?auto_4455 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4438 ) ) ( not ( = ?auto_4434 ?auto_4449 ) ) ( not ( = ?auto_4435 ?auto_4438 ) ) ( not ( = ?auto_4435 ?auto_4449 ) ) ( not ( = ?auto_4436 ?auto_4438 ) ) ( not ( = ?auto_4436 ?auto_4449 ) ) ( not ( = ?auto_4438 ?auto_4455 ) ) ( not ( = ?auto_4438 ?auto_4453 ) ) ( not ( = ?auto_4438 ?auto_4451 ) ) ( not ( = ?auto_4449 ?auto_4455 ) ) ( not ( = ?auto_4449 ?auto_4453 ) ) ( not ( = ?auto_4449 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4439 ) ) ( not ( = ?auto_4434 ?auto_4456 ) ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( not ( = ?auto_4435 ?auto_4456 ) ) ( not ( = ?auto_4436 ?auto_4439 ) ) ( not ( = ?auto_4436 ?auto_4456 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4437 ?auto_4456 ) ) ( not ( = ?auto_4439 ?auto_4449 ) ) ( not ( = ?auto_4439 ?auto_4455 ) ) ( not ( = ?auto_4439 ?auto_4453 ) ) ( not ( = ?auto_4439 ?auto_4451 ) ) ( not ( = ?auto_4456 ?auto_4449 ) ) ( not ( = ?auto_4456 ?auto_4455 ) ) ( not ( = ?auto_4456 ?auto_4453 ) ) ( not ( = ?auto_4456 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4440 ) ) ( not ( = ?auto_4434 ?auto_4457 ) ) ( not ( = ?auto_4435 ?auto_4440 ) ) ( not ( = ?auto_4435 ?auto_4457 ) ) ( not ( = ?auto_4436 ?auto_4440 ) ) ( not ( = ?auto_4436 ?auto_4457 ) ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( not ( = ?auto_4437 ?auto_4457 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4457 ) ) ( not ( = ?auto_4440 ?auto_4456 ) ) ( not ( = ?auto_4440 ?auto_4449 ) ) ( not ( = ?auto_4440 ?auto_4455 ) ) ( not ( = ?auto_4440 ?auto_4453 ) ) ( not ( = ?auto_4440 ?auto_4451 ) ) ( not ( = ?auto_4450 ?auto_4463 ) ) ( not ( = ?auto_4450 ?auto_4454 ) ) ( not ( = ?auto_4450 ?auto_4452 ) ) ( not ( = ?auto_4462 ?auto_4459 ) ) ( not ( = ?auto_4462 ?auto_4458 ) ) ( not ( = ?auto_4462 ?auto_4461 ) ) ( not ( = ?auto_4457 ?auto_4456 ) ) ( not ( = ?auto_4457 ?auto_4449 ) ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( not ( = ?auto_4457 ?auto_4453 ) ) ( not ( = ?auto_4457 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4441 ) ) ( not ( = ?auto_4434 ?auto_4460 ) ) ( not ( = ?auto_4435 ?auto_4441 ) ) ( not ( = ?auto_4435 ?auto_4460 ) ) ( not ( = ?auto_4436 ?auto_4441 ) ) ( not ( = ?auto_4436 ?auto_4460 ) ) ( not ( = ?auto_4437 ?auto_4441 ) ) ( not ( = ?auto_4437 ?auto_4460 ) ) ( not ( = ?auto_4438 ?auto_4441 ) ) ( not ( = ?auto_4438 ?auto_4460 ) ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4460 ) ) ( not ( = ?auto_4441 ?auto_4457 ) ) ( not ( = ?auto_4441 ?auto_4456 ) ) ( not ( = ?auto_4441 ?auto_4449 ) ) ( not ( = ?auto_4441 ?auto_4455 ) ) ( not ( = ?auto_4441 ?auto_4453 ) ) ( not ( = ?auto_4441 ?auto_4451 ) ) ( not ( = ?auto_4460 ?auto_4457 ) ) ( not ( = ?auto_4460 ?auto_4456 ) ) ( not ( = ?auto_4460 ?auto_4449 ) ) ( not ( = ?auto_4460 ?auto_4455 ) ) ( not ( = ?auto_4460 ?auto_4453 ) ) ( not ( = ?auto_4460 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4442 ) ) ( not ( = ?auto_4434 ?auto_4448 ) ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4435 ?auto_4448 ) ) ( not ( = ?auto_4436 ?auto_4442 ) ) ( not ( = ?auto_4436 ?auto_4448 ) ) ( not ( = ?auto_4437 ?auto_4442 ) ) ( not ( = ?auto_4437 ?auto_4448 ) ) ( not ( = ?auto_4438 ?auto_4442 ) ) ( not ( = ?auto_4438 ?auto_4448 ) ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4439 ?auto_4448 ) ) ( not ( = ?auto_4440 ?auto_4442 ) ) ( not ( = ?auto_4440 ?auto_4448 ) ) ( not ( = ?auto_4442 ?auto_4460 ) ) ( not ( = ?auto_4442 ?auto_4457 ) ) ( not ( = ?auto_4442 ?auto_4456 ) ) ( not ( = ?auto_4442 ?auto_4449 ) ) ( not ( = ?auto_4442 ?auto_4455 ) ) ( not ( = ?auto_4442 ?auto_4453 ) ) ( not ( = ?auto_4442 ?auto_4451 ) ) ( not ( = ?auto_4445 ?auto_4463 ) ) ( not ( = ?auto_4445 ?auto_4450 ) ) ( not ( = ?auto_4445 ?auto_4454 ) ) ( not ( = ?auto_4445 ?auto_4452 ) ) ( not ( = ?auto_4446 ?auto_4459 ) ) ( not ( = ?auto_4446 ?auto_4462 ) ) ( not ( = ?auto_4446 ?auto_4458 ) ) ( not ( = ?auto_4446 ?auto_4461 ) ) ( not ( = ?auto_4448 ?auto_4460 ) ) ( not ( = ?auto_4448 ?auto_4457 ) ) ( not ( = ?auto_4448 ?auto_4456 ) ) ( not ( = ?auto_4448 ?auto_4449 ) ) ( not ( = ?auto_4448 ?auto_4455 ) ) ( not ( = ?auto_4448 ?auto_4453 ) ) ( not ( = ?auto_4448 ?auto_4451 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4440 ?auto_4441 )
      ( MAKE-1CRATE ?auto_4441 ?auto_4442 )
      ( MAKE-8CRATE-VERIFY ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4440 ?auto_4441 ?auto_4442 ) )
  )

)

