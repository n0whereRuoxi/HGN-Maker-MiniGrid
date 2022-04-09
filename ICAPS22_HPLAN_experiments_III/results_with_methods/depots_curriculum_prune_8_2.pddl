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
      ?auto_4224 - HOIST
      ?auto_4227 - PLACE
      ?auto_4226 - PLACE
      ?auto_4223 - HOIST
      ?auto_4222 - SURFACE
      ?auto_4230 - PLACE
      ?auto_4228 - HOIST
      ?auto_4229 - SURFACE
      ?auto_4225 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4224 ?auto_4227 ) ( IS-CRATE ?auto_4221 ) ( not ( = ?auto_4226 ?auto_4227 ) ) ( HOIST-AT ?auto_4223 ?auto_4226 ) ( AVAILABLE ?auto_4223 ) ( SURFACE-AT ?auto_4221 ?auto_4226 ) ( ON ?auto_4221 ?auto_4222 ) ( CLEAR ?auto_4221 ) ( not ( = ?auto_4220 ?auto_4221 ) ) ( not ( = ?auto_4220 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4222 ) ) ( not ( = ?auto_4224 ?auto_4223 ) ) ( SURFACE-AT ?auto_4219 ?auto_4227 ) ( CLEAR ?auto_4219 ) ( IS-CRATE ?auto_4220 ) ( AVAILABLE ?auto_4224 ) ( not ( = ?auto_4230 ?auto_4227 ) ) ( HOIST-AT ?auto_4228 ?auto_4230 ) ( AVAILABLE ?auto_4228 ) ( SURFACE-AT ?auto_4220 ?auto_4230 ) ( ON ?auto_4220 ?auto_4229 ) ( CLEAR ?auto_4220 ) ( TRUCK-AT ?auto_4225 ?auto_4227 ) ( not ( = ?auto_4219 ?auto_4220 ) ) ( not ( = ?auto_4219 ?auto_4229 ) ) ( not ( = ?auto_4220 ?auto_4229 ) ) ( not ( = ?auto_4224 ?auto_4228 ) ) ( not ( = ?auto_4219 ?auto_4221 ) ) ( not ( = ?auto_4219 ?auto_4222 ) ) ( not ( = ?auto_4221 ?auto_4229 ) ) ( not ( = ?auto_4226 ?auto_4230 ) ) ( not ( = ?auto_4223 ?auto_4228 ) ) ( not ( = ?auto_4222 ?auto_4229 ) ) )
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
      ?auto_4251 - HOIST
      ?auto_4250 - PLACE
      ?auto_4252 - PLACE
      ?auto_4253 - HOIST
      ?auto_4254 - SURFACE
      ?auto_4256 - PLACE
      ?auto_4257 - HOIST
      ?auto_4255 - SURFACE
      ?auto_4258 - PLACE
      ?auto_4260 - HOIST
      ?auto_4259 - SURFACE
      ?auto_4249 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4251 ?auto_4250 ) ( IS-CRATE ?auto_4248 ) ( not ( = ?auto_4252 ?auto_4250 ) ) ( HOIST-AT ?auto_4253 ?auto_4252 ) ( AVAILABLE ?auto_4253 ) ( SURFACE-AT ?auto_4248 ?auto_4252 ) ( ON ?auto_4248 ?auto_4254 ) ( CLEAR ?auto_4248 ) ( not ( = ?auto_4247 ?auto_4248 ) ) ( not ( = ?auto_4247 ?auto_4254 ) ) ( not ( = ?auto_4248 ?auto_4254 ) ) ( not ( = ?auto_4251 ?auto_4253 ) ) ( IS-CRATE ?auto_4247 ) ( not ( = ?auto_4256 ?auto_4250 ) ) ( HOIST-AT ?auto_4257 ?auto_4256 ) ( AVAILABLE ?auto_4257 ) ( SURFACE-AT ?auto_4247 ?auto_4256 ) ( ON ?auto_4247 ?auto_4255 ) ( CLEAR ?auto_4247 ) ( not ( = ?auto_4246 ?auto_4247 ) ) ( not ( = ?auto_4246 ?auto_4255 ) ) ( not ( = ?auto_4247 ?auto_4255 ) ) ( not ( = ?auto_4251 ?auto_4257 ) ) ( SURFACE-AT ?auto_4245 ?auto_4250 ) ( CLEAR ?auto_4245 ) ( IS-CRATE ?auto_4246 ) ( AVAILABLE ?auto_4251 ) ( not ( = ?auto_4258 ?auto_4250 ) ) ( HOIST-AT ?auto_4260 ?auto_4258 ) ( AVAILABLE ?auto_4260 ) ( SURFACE-AT ?auto_4246 ?auto_4258 ) ( ON ?auto_4246 ?auto_4259 ) ( CLEAR ?auto_4246 ) ( TRUCK-AT ?auto_4249 ?auto_4250 ) ( not ( = ?auto_4245 ?auto_4246 ) ) ( not ( = ?auto_4245 ?auto_4259 ) ) ( not ( = ?auto_4246 ?auto_4259 ) ) ( not ( = ?auto_4251 ?auto_4260 ) ) ( not ( = ?auto_4245 ?auto_4247 ) ) ( not ( = ?auto_4245 ?auto_4255 ) ) ( not ( = ?auto_4247 ?auto_4259 ) ) ( not ( = ?auto_4256 ?auto_4258 ) ) ( not ( = ?auto_4257 ?auto_4260 ) ) ( not ( = ?auto_4255 ?auto_4259 ) ) ( not ( = ?auto_4245 ?auto_4248 ) ) ( not ( = ?auto_4245 ?auto_4254 ) ) ( not ( = ?auto_4246 ?auto_4248 ) ) ( not ( = ?auto_4246 ?auto_4254 ) ) ( not ( = ?auto_4248 ?auto_4255 ) ) ( not ( = ?auto_4248 ?auto_4259 ) ) ( not ( = ?auto_4252 ?auto_4256 ) ) ( not ( = ?auto_4252 ?auto_4258 ) ) ( not ( = ?auto_4253 ?auto_4257 ) ) ( not ( = ?auto_4253 ?auto_4260 ) ) ( not ( = ?auto_4254 ?auto_4255 ) ) ( not ( = ?auto_4254 ?auto_4259 ) ) )
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
      ?auto_4282 - HOIST
      ?auto_4283 - PLACE
      ?auto_4284 - PLACE
      ?auto_4286 - HOIST
      ?auto_4285 - SURFACE
      ?auto_4291 - SURFACE
      ?auto_4293 - PLACE
      ?auto_4289 - HOIST
      ?auto_4292 - SURFACE
      ?auto_4290 - PLACE
      ?auto_4287 - HOIST
      ?auto_4288 - SURFACE
      ?auto_4281 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4282 ?auto_4283 ) ( IS-CRATE ?auto_4280 ) ( not ( = ?auto_4284 ?auto_4283 ) ) ( HOIST-AT ?auto_4286 ?auto_4284 ) ( SURFACE-AT ?auto_4280 ?auto_4284 ) ( ON ?auto_4280 ?auto_4285 ) ( CLEAR ?auto_4280 ) ( not ( = ?auto_4279 ?auto_4280 ) ) ( not ( = ?auto_4279 ?auto_4285 ) ) ( not ( = ?auto_4280 ?auto_4285 ) ) ( not ( = ?auto_4282 ?auto_4286 ) ) ( IS-CRATE ?auto_4279 ) ( AVAILABLE ?auto_4286 ) ( SURFACE-AT ?auto_4279 ?auto_4284 ) ( ON ?auto_4279 ?auto_4291 ) ( CLEAR ?auto_4279 ) ( not ( = ?auto_4278 ?auto_4279 ) ) ( not ( = ?auto_4278 ?auto_4291 ) ) ( not ( = ?auto_4279 ?auto_4291 ) ) ( IS-CRATE ?auto_4278 ) ( not ( = ?auto_4293 ?auto_4283 ) ) ( HOIST-AT ?auto_4289 ?auto_4293 ) ( AVAILABLE ?auto_4289 ) ( SURFACE-AT ?auto_4278 ?auto_4293 ) ( ON ?auto_4278 ?auto_4292 ) ( CLEAR ?auto_4278 ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4292 ) ) ( not ( = ?auto_4278 ?auto_4292 ) ) ( not ( = ?auto_4282 ?auto_4289 ) ) ( SURFACE-AT ?auto_4276 ?auto_4283 ) ( CLEAR ?auto_4276 ) ( IS-CRATE ?auto_4277 ) ( AVAILABLE ?auto_4282 ) ( not ( = ?auto_4290 ?auto_4283 ) ) ( HOIST-AT ?auto_4287 ?auto_4290 ) ( AVAILABLE ?auto_4287 ) ( SURFACE-AT ?auto_4277 ?auto_4290 ) ( ON ?auto_4277 ?auto_4288 ) ( CLEAR ?auto_4277 ) ( TRUCK-AT ?auto_4281 ?auto_4283 ) ( not ( = ?auto_4276 ?auto_4277 ) ) ( not ( = ?auto_4276 ?auto_4288 ) ) ( not ( = ?auto_4277 ?auto_4288 ) ) ( not ( = ?auto_4282 ?auto_4287 ) ) ( not ( = ?auto_4276 ?auto_4278 ) ) ( not ( = ?auto_4276 ?auto_4292 ) ) ( not ( = ?auto_4278 ?auto_4288 ) ) ( not ( = ?auto_4293 ?auto_4290 ) ) ( not ( = ?auto_4289 ?auto_4287 ) ) ( not ( = ?auto_4292 ?auto_4288 ) ) ( not ( = ?auto_4276 ?auto_4279 ) ) ( not ( = ?auto_4276 ?auto_4291 ) ) ( not ( = ?auto_4277 ?auto_4279 ) ) ( not ( = ?auto_4277 ?auto_4291 ) ) ( not ( = ?auto_4279 ?auto_4292 ) ) ( not ( = ?auto_4279 ?auto_4288 ) ) ( not ( = ?auto_4284 ?auto_4293 ) ) ( not ( = ?auto_4284 ?auto_4290 ) ) ( not ( = ?auto_4286 ?auto_4289 ) ) ( not ( = ?auto_4286 ?auto_4287 ) ) ( not ( = ?auto_4291 ?auto_4292 ) ) ( not ( = ?auto_4291 ?auto_4288 ) ) ( not ( = ?auto_4276 ?auto_4280 ) ) ( not ( = ?auto_4276 ?auto_4285 ) ) ( not ( = ?auto_4277 ?auto_4280 ) ) ( not ( = ?auto_4277 ?auto_4285 ) ) ( not ( = ?auto_4278 ?auto_4280 ) ) ( not ( = ?auto_4278 ?auto_4285 ) ) ( not ( = ?auto_4280 ?auto_4291 ) ) ( not ( = ?auto_4280 ?auto_4292 ) ) ( not ( = ?auto_4280 ?auto_4288 ) ) ( not ( = ?auto_4285 ?auto_4291 ) ) ( not ( = ?auto_4285 ?auto_4292 ) ) ( not ( = ?auto_4285 ?auto_4288 ) ) )
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
      ?auto_4320 - PLACE
      ?auto_4319 - PLACE
      ?auto_4317 - HOIST
      ?auto_4318 - SURFACE
      ?auto_4324 - PLACE
      ?auto_4326 - HOIST
      ?auto_4323 - SURFACE
      ?auto_4325 - SURFACE
      ?auto_4322 - SURFACE
      ?auto_4329 - PLACE
      ?auto_4327 - HOIST
      ?auto_4328 - SURFACE
      ?auto_4316 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4321 ?auto_4320 ) ( IS-CRATE ?auto_4315 ) ( not ( = ?auto_4319 ?auto_4320 ) ) ( HOIST-AT ?auto_4317 ?auto_4319 ) ( SURFACE-AT ?auto_4315 ?auto_4319 ) ( ON ?auto_4315 ?auto_4318 ) ( CLEAR ?auto_4315 ) ( not ( = ?auto_4314 ?auto_4315 ) ) ( not ( = ?auto_4314 ?auto_4318 ) ) ( not ( = ?auto_4315 ?auto_4318 ) ) ( not ( = ?auto_4321 ?auto_4317 ) ) ( IS-CRATE ?auto_4314 ) ( not ( = ?auto_4324 ?auto_4320 ) ) ( HOIST-AT ?auto_4326 ?auto_4324 ) ( SURFACE-AT ?auto_4314 ?auto_4324 ) ( ON ?auto_4314 ?auto_4323 ) ( CLEAR ?auto_4314 ) ( not ( = ?auto_4313 ?auto_4314 ) ) ( not ( = ?auto_4313 ?auto_4323 ) ) ( not ( = ?auto_4314 ?auto_4323 ) ) ( not ( = ?auto_4321 ?auto_4326 ) ) ( IS-CRATE ?auto_4313 ) ( AVAILABLE ?auto_4326 ) ( SURFACE-AT ?auto_4313 ?auto_4324 ) ( ON ?auto_4313 ?auto_4325 ) ( CLEAR ?auto_4313 ) ( not ( = ?auto_4312 ?auto_4313 ) ) ( not ( = ?auto_4312 ?auto_4325 ) ) ( not ( = ?auto_4313 ?auto_4325 ) ) ( IS-CRATE ?auto_4312 ) ( AVAILABLE ?auto_4317 ) ( SURFACE-AT ?auto_4312 ?auto_4319 ) ( ON ?auto_4312 ?auto_4322 ) ( CLEAR ?auto_4312 ) ( not ( = ?auto_4311 ?auto_4312 ) ) ( not ( = ?auto_4311 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4322 ) ) ( SURFACE-AT ?auto_4310 ?auto_4320 ) ( CLEAR ?auto_4310 ) ( IS-CRATE ?auto_4311 ) ( AVAILABLE ?auto_4321 ) ( not ( = ?auto_4329 ?auto_4320 ) ) ( HOIST-AT ?auto_4327 ?auto_4329 ) ( AVAILABLE ?auto_4327 ) ( SURFACE-AT ?auto_4311 ?auto_4329 ) ( ON ?auto_4311 ?auto_4328 ) ( CLEAR ?auto_4311 ) ( TRUCK-AT ?auto_4316 ?auto_4320 ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4328 ) ) ( not ( = ?auto_4311 ?auto_4328 ) ) ( not ( = ?auto_4321 ?auto_4327 ) ) ( not ( = ?auto_4310 ?auto_4312 ) ) ( not ( = ?auto_4310 ?auto_4322 ) ) ( not ( = ?auto_4312 ?auto_4328 ) ) ( not ( = ?auto_4319 ?auto_4329 ) ) ( not ( = ?auto_4317 ?auto_4327 ) ) ( not ( = ?auto_4322 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4313 ) ) ( not ( = ?auto_4310 ?auto_4325 ) ) ( not ( = ?auto_4311 ?auto_4313 ) ) ( not ( = ?auto_4311 ?auto_4325 ) ) ( not ( = ?auto_4313 ?auto_4322 ) ) ( not ( = ?auto_4313 ?auto_4328 ) ) ( not ( = ?auto_4324 ?auto_4319 ) ) ( not ( = ?auto_4324 ?auto_4329 ) ) ( not ( = ?auto_4326 ?auto_4317 ) ) ( not ( = ?auto_4326 ?auto_4327 ) ) ( not ( = ?auto_4325 ?auto_4322 ) ) ( not ( = ?auto_4325 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4314 ) ) ( not ( = ?auto_4310 ?auto_4323 ) ) ( not ( = ?auto_4311 ?auto_4314 ) ) ( not ( = ?auto_4311 ?auto_4323 ) ) ( not ( = ?auto_4312 ?auto_4314 ) ) ( not ( = ?auto_4312 ?auto_4323 ) ) ( not ( = ?auto_4314 ?auto_4325 ) ) ( not ( = ?auto_4314 ?auto_4322 ) ) ( not ( = ?auto_4314 ?auto_4328 ) ) ( not ( = ?auto_4323 ?auto_4325 ) ) ( not ( = ?auto_4323 ?auto_4322 ) ) ( not ( = ?auto_4323 ?auto_4328 ) ) ( not ( = ?auto_4310 ?auto_4315 ) ) ( not ( = ?auto_4310 ?auto_4318 ) ) ( not ( = ?auto_4311 ?auto_4315 ) ) ( not ( = ?auto_4311 ?auto_4318 ) ) ( not ( = ?auto_4312 ?auto_4315 ) ) ( not ( = ?auto_4312 ?auto_4318 ) ) ( not ( = ?auto_4313 ?auto_4315 ) ) ( not ( = ?auto_4313 ?auto_4318 ) ) ( not ( = ?auto_4315 ?auto_4323 ) ) ( not ( = ?auto_4315 ?auto_4325 ) ) ( not ( = ?auto_4315 ?auto_4322 ) ) ( not ( = ?auto_4315 ?auto_4328 ) ) ( not ( = ?auto_4318 ?auto_4323 ) ) ( not ( = ?auto_4318 ?auto_4325 ) ) ( not ( = ?auto_4318 ?auto_4322 ) ) ( not ( = ?auto_4318 ?auto_4328 ) ) )
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
      ?auto_4354 - HOIST
      ?auto_4355 - PLACE
      ?auto_4359 - PLACE
      ?auto_4357 - HOIST
      ?auto_4358 - SURFACE
      ?auto_4365 - PLACE
      ?auto_4361 - HOIST
      ?auto_4364 - SURFACE
      ?auto_4368 - PLACE
      ?auto_4370 - HOIST
      ?auto_4369 - SURFACE
      ?auto_4366 - SURFACE
      ?auto_4362 - SURFACE
      ?auto_4367 - PLACE
      ?auto_4363 - HOIST
      ?auto_4360 - SURFACE
      ?auto_4356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4354 ?auto_4355 ) ( IS-CRATE ?auto_4353 ) ( not ( = ?auto_4359 ?auto_4355 ) ) ( HOIST-AT ?auto_4357 ?auto_4359 ) ( AVAILABLE ?auto_4357 ) ( SURFACE-AT ?auto_4353 ?auto_4359 ) ( ON ?auto_4353 ?auto_4358 ) ( CLEAR ?auto_4353 ) ( not ( = ?auto_4352 ?auto_4353 ) ) ( not ( = ?auto_4352 ?auto_4358 ) ) ( not ( = ?auto_4353 ?auto_4358 ) ) ( not ( = ?auto_4354 ?auto_4357 ) ) ( IS-CRATE ?auto_4352 ) ( not ( = ?auto_4365 ?auto_4355 ) ) ( HOIST-AT ?auto_4361 ?auto_4365 ) ( SURFACE-AT ?auto_4352 ?auto_4365 ) ( ON ?auto_4352 ?auto_4364 ) ( CLEAR ?auto_4352 ) ( not ( = ?auto_4351 ?auto_4352 ) ) ( not ( = ?auto_4351 ?auto_4364 ) ) ( not ( = ?auto_4352 ?auto_4364 ) ) ( not ( = ?auto_4354 ?auto_4361 ) ) ( IS-CRATE ?auto_4351 ) ( not ( = ?auto_4368 ?auto_4355 ) ) ( HOIST-AT ?auto_4370 ?auto_4368 ) ( SURFACE-AT ?auto_4351 ?auto_4368 ) ( ON ?auto_4351 ?auto_4369 ) ( CLEAR ?auto_4351 ) ( not ( = ?auto_4350 ?auto_4351 ) ) ( not ( = ?auto_4350 ?auto_4369 ) ) ( not ( = ?auto_4351 ?auto_4369 ) ) ( not ( = ?auto_4354 ?auto_4370 ) ) ( IS-CRATE ?auto_4350 ) ( AVAILABLE ?auto_4370 ) ( SURFACE-AT ?auto_4350 ?auto_4368 ) ( ON ?auto_4350 ?auto_4366 ) ( CLEAR ?auto_4350 ) ( not ( = ?auto_4349 ?auto_4350 ) ) ( not ( = ?auto_4349 ?auto_4366 ) ) ( not ( = ?auto_4350 ?auto_4366 ) ) ( IS-CRATE ?auto_4349 ) ( AVAILABLE ?auto_4361 ) ( SURFACE-AT ?auto_4349 ?auto_4365 ) ( ON ?auto_4349 ?auto_4362 ) ( CLEAR ?auto_4349 ) ( not ( = ?auto_4348 ?auto_4349 ) ) ( not ( = ?auto_4348 ?auto_4362 ) ) ( not ( = ?auto_4349 ?auto_4362 ) ) ( SURFACE-AT ?auto_4347 ?auto_4355 ) ( CLEAR ?auto_4347 ) ( IS-CRATE ?auto_4348 ) ( AVAILABLE ?auto_4354 ) ( not ( = ?auto_4367 ?auto_4355 ) ) ( HOIST-AT ?auto_4363 ?auto_4367 ) ( AVAILABLE ?auto_4363 ) ( SURFACE-AT ?auto_4348 ?auto_4367 ) ( ON ?auto_4348 ?auto_4360 ) ( CLEAR ?auto_4348 ) ( TRUCK-AT ?auto_4356 ?auto_4355 ) ( not ( = ?auto_4347 ?auto_4348 ) ) ( not ( = ?auto_4347 ?auto_4360 ) ) ( not ( = ?auto_4348 ?auto_4360 ) ) ( not ( = ?auto_4354 ?auto_4363 ) ) ( not ( = ?auto_4347 ?auto_4349 ) ) ( not ( = ?auto_4347 ?auto_4362 ) ) ( not ( = ?auto_4349 ?auto_4360 ) ) ( not ( = ?auto_4365 ?auto_4367 ) ) ( not ( = ?auto_4361 ?auto_4363 ) ) ( not ( = ?auto_4362 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4350 ) ) ( not ( = ?auto_4347 ?auto_4366 ) ) ( not ( = ?auto_4348 ?auto_4350 ) ) ( not ( = ?auto_4348 ?auto_4366 ) ) ( not ( = ?auto_4350 ?auto_4362 ) ) ( not ( = ?auto_4350 ?auto_4360 ) ) ( not ( = ?auto_4368 ?auto_4365 ) ) ( not ( = ?auto_4368 ?auto_4367 ) ) ( not ( = ?auto_4370 ?auto_4361 ) ) ( not ( = ?auto_4370 ?auto_4363 ) ) ( not ( = ?auto_4366 ?auto_4362 ) ) ( not ( = ?auto_4366 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4351 ) ) ( not ( = ?auto_4347 ?auto_4369 ) ) ( not ( = ?auto_4348 ?auto_4351 ) ) ( not ( = ?auto_4348 ?auto_4369 ) ) ( not ( = ?auto_4349 ?auto_4351 ) ) ( not ( = ?auto_4349 ?auto_4369 ) ) ( not ( = ?auto_4351 ?auto_4366 ) ) ( not ( = ?auto_4351 ?auto_4362 ) ) ( not ( = ?auto_4351 ?auto_4360 ) ) ( not ( = ?auto_4369 ?auto_4366 ) ) ( not ( = ?auto_4369 ?auto_4362 ) ) ( not ( = ?auto_4369 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4352 ) ) ( not ( = ?auto_4347 ?auto_4364 ) ) ( not ( = ?auto_4348 ?auto_4352 ) ) ( not ( = ?auto_4348 ?auto_4364 ) ) ( not ( = ?auto_4349 ?auto_4352 ) ) ( not ( = ?auto_4349 ?auto_4364 ) ) ( not ( = ?auto_4350 ?auto_4352 ) ) ( not ( = ?auto_4350 ?auto_4364 ) ) ( not ( = ?auto_4352 ?auto_4369 ) ) ( not ( = ?auto_4352 ?auto_4366 ) ) ( not ( = ?auto_4352 ?auto_4362 ) ) ( not ( = ?auto_4352 ?auto_4360 ) ) ( not ( = ?auto_4364 ?auto_4369 ) ) ( not ( = ?auto_4364 ?auto_4366 ) ) ( not ( = ?auto_4364 ?auto_4362 ) ) ( not ( = ?auto_4364 ?auto_4360 ) ) ( not ( = ?auto_4347 ?auto_4353 ) ) ( not ( = ?auto_4347 ?auto_4358 ) ) ( not ( = ?auto_4348 ?auto_4353 ) ) ( not ( = ?auto_4348 ?auto_4358 ) ) ( not ( = ?auto_4349 ?auto_4353 ) ) ( not ( = ?auto_4349 ?auto_4358 ) ) ( not ( = ?auto_4350 ?auto_4353 ) ) ( not ( = ?auto_4350 ?auto_4358 ) ) ( not ( = ?auto_4351 ?auto_4353 ) ) ( not ( = ?auto_4351 ?auto_4358 ) ) ( not ( = ?auto_4353 ?auto_4364 ) ) ( not ( = ?auto_4353 ?auto_4369 ) ) ( not ( = ?auto_4353 ?auto_4366 ) ) ( not ( = ?auto_4353 ?auto_4362 ) ) ( not ( = ?auto_4353 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4365 ) ) ( not ( = ?auto_4359 ?auto_4368 ) ) ( not ( = ?auto_4359 ?auto_4367 ) ) ( not ( = ?auto_4357 ?auto_4361 ) ) ( not ( = ?auto_4357 ?auto_4370 ) ) ( not ( = ?auto_4357 ?auto_4363 ) ) ( not ( = ?auto_4358 ?auto_4364 ) ) ( not ( = ?auto_4358 ?auto_4369 ) ) ( not ( = ?auto_4358 ?auto_4366 ) ) ( not ( = ?auto_4358 ?auto_4362 ) ) ( not ( = ?auto_4358 ?auto_4360 ) ) )
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
      ?auto_4400 - PLACE
      ?auto_4401 - PLACE
      ?auto_4398 - HOIST
      ?auto_4397 - SURFACE
      ?auto_4410 - PLACE
      ?auto_4405 - HOIST
      ?auto_4411 - SURFACE
      ?auto_4407 - SURFACE
      ?auto_4414 - PLACE
      ?auto_4406 - HOIST
      ?auto_4403 - SURFACE
      ?auto_4409 - SURFACE
      ?auto_4413 - SURFACE
      ?auto_4404 - PLACE
      ?auto_4408 - HOIST
      ?auto_4412 - SURFACE
      ?auto_4399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4402 ?auto_4400 ) ( IS-CRATE ?auto_4396 ) ( not ( = ?auto_4401 ?auto_4400 ) ) ( HOIST-AT ?auto_4398 ?auto_4401 ) ( SURFACE-AT ?auto_4396 ?auto_4401 ) ( ON ?auto_4396 ?auto_4397 ) ( CLEAR ?auto_4396 ) ( not ( = ?auto_4395 ?auto_4396 ) ) ( not ( = ?auto_4395 ?auto_4397 ) ) ( not ( = ?auto_4396 ?auto_4397 ) ) ( not ( = ?auto_4402 ?auto_4398 ) ) ( IS-CRATE ?auto_4395 ) ( not ( = ?auto_4410 ?auto_4400 ) ) ( HOIST-AT ?auto_4405 ?auto_4410 ) ( AVAILABLE ?auto_4405 ) ( SURFACE-AT ?auto_4395 ?auto_4410 ) ( ON ?auto_4395 ?auto_4411 ) ( CLEAR ?auto_4395 ) ( not ( = ?auto_4394 ?auto_4395 ) ) ( not ( = ?auto_4394 ?auto_4411 ) ) ( not ( = ?auto_4395 ?auto_4411 ) ) ( not ( = ?auto_4402 ?auto_4405 ) ) ( IS-CRATE ?auto_4394 ) ( SURFACE-AT ?auto_4394 ?auto_4401 ) ( ON ?auto_4394 ?auto_4407 ) ( CLEAR ?auto_4394 ) ( not ( = ?auto_4393 ?auto_4394 ) ) ( not ( = ?auto_4393 ?auto_4407 ) ) ( not ( = ?auto_4394 ?auto_4407 ) ) ( IS-CRATE ?auto_4393 ) ( not ( = ?auto_4414 ?auto_4400 ) ) ( HOIST-AT ?auto_4406 ?auto_4414 ) ( SURFACE-AT ?auto_4393 ?auto_4414 ) ( ON ?auto_4393 ?auto_4403 ) ( CLEAR ?auto_4393 ) ( not ( = ?auto_4392 ?auto_4393 ) ) ( not ( = ?auto_4392 ?auto_4403 ) ) ( not ( = ?auto_4393 ?auto_4403 ) ) ( not ( = ?auto_4402 ?auto_4406 ) ) ( IS-CRATE ?auto_4392 ) ( AVAILABLE ?auto_4406 ) ( SURFACE-AT ?auto_4392 ?auto_4414 ) ( ON ?auto_4392 ?auto_4409 ) ( CLEAR ?auto_4392 ) ( not ( = ?auto_4391 ?auto_4392 ) ) ( not ( = ?auto_4391 ?auto_4409 ) ) ( not ( = ?auto_4392 ?auto_4409 ) ) ( IS-CRATE ?auto_4391 ) ( AVAILABLE ?auto_4398 ) ( SURFACE-AT ?auto_4391 ?auto_4401 ) ( ON ?auto_4391 ?auto_4413 ) ( CLEAR ?auto_4391 ) ( not ( = ?auto_4390 ?auto_4391 ) ) ( not ( = ?auto_4390 ?auto_4413 ) ) ( not ( = ?auto_4391 ?auto_4413 ) ) ( SURFACE-AT ?auto_4389 ?auto_4400 ) ( CLEAR ?auto_4389 ) ( IS-CRATE ?auto_4390 ) ( AVAILABLE ?auto_4402 ) ( not ( = ?auto_4404 ?auto_4400 ) ) ( HOIST-AT ?auto_4408 ?auto_4404 ) ( AVAILABLE ?auto_4408 ) ( SURFACE-AT ?auto_4390 ?auto_4404 ) ( ON ?auto_4390 ?auto_4412 ) ( CLEAR ?auto_4390 ) ( TRUCK-AT ?auto_4399 ?auto_4400 ) ( not ( = ?auto_4389 ?auto_4390 ) ) ( not ( = ?auto_4389 ?auto_4412 ) ) ( not ( = ?auto_4390 ?auto_4412 ) ) ( not ( = ?auto_4402 ?auto_4408 ) ) ( not ( = ?auto_4389 ?auto_4391 ) ) ( not ( = ?auto_4389 ?auto_4413 ) ) ( not ( = ?auto_4391 ?auto_4412 ) ) ( not ( = ?auto_4401 ?auto_4404 ) ) ( not ( = ?auto_4398 ?auto_4408 ) ) ( not ( = ?auto_4413 ?auto_4412 ) ) ( not ( = ?auto_4389 ?auto_4392 ) ) ( not ( = ?auto_4389 ?auto_4409 ) ) ( not ( = ?auto_4390 ?auto_4392 ) ) ( not ( = ?auto_4390 ?auto_4409 ) ) ( not ( = ?auto_4392 ?auto_4413 ) ) ( not ( = ?auto_4392 ?auto_4412 ) ) ( not ( = ?auto_4414 ?auto_4401 ) ) ( not ( = ?auto_4414 ?auto_4404 ) ) ( not ( = ?auto_4406 ?auto_4398 ) ) ( not ( = ?auto_4406 ?auto_4408 ) ) ( not ( = ?auto_4409 ?auto_4413 ) ) ( not ( = ?auto_4409 ?auto_4412 ) ) ( not ( = ?auto_4389 ?auto_4393 ) ) ( not ( = ?auto_4389 ?auto_4403 ) ) ( not ( = ?auto_4390 ?auto_4393 ) ) ( not ( = ?auto_4390 ?auto_4403 ) ) ( not ( = ?auto_4391 ?auto_4393 ) ) ( not ( = ?auto_4391 ?auto_4403 ) ) ( not ( = ?auto_4393 ?auto_4409 ) ) ( not ( = ?auto_4393 ?auto_4413 ) ) ( not ( = ?auto_4393 ?auto_4412 ) ) ( not ( = ?auto_4403 ?auto_4409 ) ) ( not ( = ?auto_4403 ?auto_4413 ) ) ( not ( = ?auto_4403 ?auto_4412 ) ) ( not ( = ?auto_4389 ?auto_4394 ) ) ( not ( = ?auto_4389 ?auto_4407 ) ) ( not ( = ?auto_4390 ?auto_4394 ) ) ( not ( = ?auto_4390 ?auto_4407 ) ) ( not ( = ?auto_4391 ?auto_4394 ) ) ( not ( = ?auto_4391 ?auto_4407 ) ) ( not ( = ?auto_4392 ?auto_4394 ) ) ( not ( = ?auto_4392 ?auto_4407 ) ) ( not ( = ?auto_4394 ?auto_4403 ) ) ( not ( = ?auto_4394 ?auto_4409 ) ) ( not ( = ?auto_4394 ?auto_4413 ) ) ( not ( = ?auto_4394 ?auto_4412 ) ) ( not ( = ?auto_4407 ?auto_4403 ) ) ( not ( = ?auto_4407 ?auto_4409 ) ) ( not ( = ?auto_4407 ?auto_4413 ) ) ( not ( = ?auto_4407 ?auto_4412 ) ) ( not ( = ?auto_4389 ?auto_4395 ) ) ( not ( = ?auto_4389 ?auto_4411 ) ) ( not ( = ?auto_4390 ?auto_4395 ) ) ( not ( = ?auto_4390 ?auto_4411 ) ) ( not ( = ?auto_4391 ?auto_4395 ) ) ( not ( = ?auto_4391 ?auto_4411 ) ) ( not ( = ?auto_4392 ?auto_4395 ) ) ( not ( = ?auto_4392 ?auto_4411 ) ) ( not ( = ?auto_4393 ?auto_4395 ) ) ( not ( = ?auto_4393 ?auto_4411 ) ) ( not ( = ?auto_4395 ?auto_4407 ) ) ( not ( = ?auto_4395 ?auto_4403 ) ) ( not ( = ?auto_4395 ?auto_4409 ) ) ( not ( = ?auto_4395 ?auto_4413 ) ) ( not ( = ?auto_4395 ?auto_4412 ) ) ( not ( = ?auto_4410 ?auto_4401 ) ) ( not ( = ?auto_4410 ?auto_4414 ) ) ( not ( = ?auto_4410 ?auto_4404 ) ) ( not ( = ?auto_4405 ?auto_4398 ) ) ( not ( = ?auto_4405 ?auto_4406 ) ) ( not ( = ?auto_4405 ?auto_4408 ) ) ( not ( = ?auto_4411 ?auto_4407 ) ) ( not ( = ?auto_4411 ?auto_4403 ) ) ( not ( = ?auto_4411 ?auto_4409 ) ) ( not ( = ?auto_4411 ?auto_4413 ) ) ( not ( = ?auto_4411 ?auto_4412 ) ) ( not ( = ?auto_4389 ?auto_4396 ) ) ( not ( = ?auto_4389 ?auto_4397 ) ) ( not ( = ?auto_4390 ?auto_4396 ) ) ( not ( = ?auto_4390 ?auto_4397 ) ) ( not ( = ?auto_4391 ?auto_4396 ) ) ( not ( = ?auto_4391 ?auto_4397 ) ) ( not ( = ?auto_4392 ?auto_4396 ) ) ( not ( = ?auto_4392 ?auto_4397 ) ) ( not ( = ?auto_4393 ?auto_4396 ) ) ( not ( = ?auto_4393 ?auto_4397 ) ) ( not ( = ?auto_4394 ?auto_4396 ) ) ( not ( = ?auto_4394 ?auto_4397 ) ) ( not ( = ?auto_4396 ?auto_4411 ) ) ( not ( = ?auto_4396 ?auto_4407 ) ) ( not ( = ?auto_4396 ?auto_4403 ) ) ( not ( = ?auto_4396 ?auto_4409 ) ) ( not ( = ?auto_4396 ?auto_4413 ) ) ( not ( = ?auto_4396 ?auto_4412 ) ) ( not ( = ?auto_4397 ?auto_4411 ) ) ( not ( = ?auto_4397 ?auto_4407 ) ) ( not ( = ?auto_4397 ?auto_4403 ) ) ( not ( = ?auto_4397 ?auto_4409 ) ) ( not ( = ?auto_4397 ?auto_4413 ) ) ( not ( = ?auto_4397 ?auto_4412 ) ) )
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
      ?auto_4446 - HOIST
      ?auto_4444 - PLACE
      ?auto_4443 - PLACE
      ?auto_4448 - HOIST
      ?auto_4445 - SURFACE
      ?auto_4463 - PLACE
      ?auto_4449 - HOIST
      ?auto_4456 - SURFACE
      ?auto_4462 - PLACE
      ?auto_4458 - HOIST
      ?auto_4453 - SURFACE
      ?auto_4457 - SURFACE
      ?auto_4452 - PLACE
      ?auto_4460 - HOIST
      ?auto_4459 - SURFACE
      ?auto_4455 - SURFACE
      ?auto_4454 - SURFACE
      ?auto_4461 - PLACE
      ?auto_4450 - HOIST
      ?auto_4451 - SURFACE
      ?auto_4447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_4446 ?auto_4444 ) ( IS-CRATE ?auto_4442 ) ( not ( = ?auto_4443 ?auto_4444 ) ) ( HOIST-AT ?auto_4448 ?auto_4443 ) ( AVAILABLE ?auto_4448 ) ( SURFACE-AT ?auto_4442 ?auto_4443 ) ( ON ?auto_4442 ?auto_4445 ) ( CLEAR ?auto_4442 ) ( not ( = ?auto_4441 ?auto_4442 ) ) ( not ( = ?auto_4441 ?auto_4445 ) ) ( not ( = ?auto_4442 ?auto_4445 ) ) ( not ( = ?auto_4446 ?auto_4448 ) ) ( IS-CRATE ?auto_4441 ) ( not ( = ?auto_4463 ?auto_4444 ) ) ( HOIST-AT ?auto_4449 ?auto_4463 ) ( SURFACE-AT ?auto_4441 ?auto_4463 ) ( ON ?auto_4441 ?auto_4456 ) ( CLEAR ?auto_4441 ) ( not ( = ?auto_4440 ?auto_4441 ) ) ( not ( = ?auto_4440 ?auto_4456 ) ) ( not ( = ?auto_4441 ?auto_4456 ) ) ( not ( = ?auto_4446 ?auto_4449 ) ) ( IS-CRATE ?auto_4440 ) ( not ( = ?auto_4462 ?auto_4444 ) ) ( HOIST-AT ?auto_4458 ?auto_4462 ) ( AVAILABLE ?auto_4458 ) ( SURFACE-AT ?auto_4440 ?auto_4462 ) ( ON ?auto_4440 ?auto_4453 ) ( CLEAR ?auto_4440 ) ( not ( = ?auto_4439 ?auto_4440 ) ) ( not ( = ?auto_4439 ?auto_4453 ) ) ( not ( = ?auto_4440 ?auto_4453 ) ) ( not ( = ?auto_4446 ?auto_4458 ) ) ( IS-CRATE ?auto_4439 ) ( SURFACE-AT ?auto_4439 ?auto_4463 ) ( ON ?auto_4439 ?auto_4457 ) ( CLEAR ?auto_4439 ) ( not ( = ?auto_4438 ?auto_4439 ) ) ( not ( = ?auto_4438 ?auto_4457 ) ) ( not ( = ?auto_4439 ?auto_4457 ) ) ( IS-CRATE ?auto_4438 ) ( not ( = ?auto_4452 ?auto_4444 ) ) ( HOIST-AT ?auto_4460 ?auto_4452 ) ( SURFACE-AT ?auto_4438 ?auto_4452 ) ( ON ?auto_4438 ?auto_4459 ) ( CLEAR ?auto_4438 ) ( not ( = ?auto_4437 ?auto_4438 ) ) ( not ( = ?auto_4437 ?auto_4459 ) ) ( not ( = ?auto_4438 ?auto_4459 ) ) ( not ( = ?auto_4446 ?auto_4460 ) ) ( IS-CRATE ?auto_4437 ) ( AVAILABLE ?auto_4460 ) ( SURFACE-AT ?auto_4437 ?auto_4452 ) ( ON ?auto_4437 ?auto_4455 ) ( CLEAR ?auto_4437 ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4455 ) ) ( IS-CRATE ?auto_4436 ) ( AVAILABLE ?auto_4449 ) ( SURFACE-AT ?auto_4436 ?auto_4463 ) ( ON ?auto_4436 ?auto_4454 ) ( CLEAR ?auto_4436 ) ( not ( = ?auto_4435 ?auto_4436 ) ) ( not ( = ?auto_4435 ?auto_4454 ) ) ( not ( = ?auto_4436 ?auto_4454 ) ) ( SURFACE-AT ?auto_4434 ?auto_4444 ) ( CLEAR ?auto_4434 ) ( IS-CRATE ?auto_4435 ) ( AVAILABLE ?auto_4446 ) ( not ( = ?auto_4461 ?auto_4444 ) ) ( HOIST-AT ?auto_4450 ?auto_4461 ) ( AVAILABLE ?auto_4450 ) ( SURFACE-AT ?auto_4435 ?auto_4461 ) ( ON ?auto_4435 ?auto_4451 ) ( CLEAR ?auto_4435 ) ( TRUCK-AT ?auto_4447 ?auto_4444 ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4434 ?auto_4451 ) ) ( not ( = ?auto_4435 ?auto_4451 ) ) ( not ( = ?auto_4446 ?auto_4450 ) ) ( not ( = ?auto_4434 ?auto_4436 ) ) ( not ( = ?auto_4434 ?auto_4454 ) ) ( not ( = ?auto_4436 ?auto_4451 ) ) ( not ( = ?auto_4463 ?auto_4461 ) ) ( not ( = ?auto_4449 ?auto_4450 ) ) ( not ( = ?auto_4454 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4437 ) ) ( not ( = ?auto_4434 ?auto_4455 ) ) ( not ( = ?auto_4435 ?auto_4437 ) ) ( not ( = ?auto_4435 ?auto_4455 ) ) ( not ( = ?auto_4437 ?auto_4454 ) ) ( not ( = ?auto_4437 ?auto_4451 ) ) ( not ( = ?auto_4452 ?auto_4463 ) ) ( not ( = ?auto_4452 ?auto_4461 ) ) ( not ( = ?auto_4460 ?auto_4449 ) ) ( not ( = ?auto_4460 ?auto_4450 ) ) ( not ( = ?auto_4455 ?auto_4454 ) ) ( not ( = ?auto_4455 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4438 ) ) ( not ( = ?auto_4434 ?auto_4459 ) ) ( not ( = ?auto_4435 ?auto_4438 ) ) ( not ( = ?auto_4435 ?auto_4459 ) ) ( not ( = ?auto_4436 ?auto_4438 ) ) ( not ( = ?auto_4436 ?auto_4459 ) ) ( not ( = ?auto_4438 ?auto_4455 ) ) ( not ( = ?auto_4438 ?auto_4454 ) ) ( not ( = ?auto_4438 ?auto_4451 ) ) ( not ( = ?auto_4459 ?auto_4455 ) ) ( not ( = ?auto_4459 ?auto_4454 ) ) ( not ( = ?auto_4459 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4439 ) ) ( not ( = ?auto_4434 ?auto_4457 ) ) ( not ( = ?auto_4435 ?auto_4439 ) ) ( not ( = ?auto_4435 ?auto_4457 ) ) ( not ( = ?auto_4436 ?auto_4439 ) ) ( not ( = ?auto_4436 ?auto_4457 ) ) ( not ( = ?auto_4437 ?auto_4439 ) ) ( not ( = ?auto_4437 ?auto_4457 ) ) ( not ( = ?auto_4439 ?auto_4459 ) ) ( not ( = ?auto_4439 ?auto_4455 ) ) ( not ( = ?auto_4439 ?auto_4454 ) ) ( not ( = ?auto_4439 ?auto_4451 ) ) ( not ( = ?auto_4457 ?auto_4459 ) ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( not ( = ?auto_4457 ?auto_4454 ) ) ( not ( = ?auto_4457 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4440 ) ) ( not ( = ?auto_4434 ?auto_4453 ) ) ( not ( = ?auto_4435 ?auto_4440 ) ) ( not ( = ?auto_4435 ?auto_4453 ) ) ( not ( = ?auto_4436 ?auto_4440 ) ) ( not ( = ?auto_4436 ?auto_4453 ) ) ( not ( = ?auto_4437 ?auto_4440 ) ) ( not ( = ?auto_4437 ?auto_4453 ) ) ( not ( = ?auto_4438 ?auto_4440 ) ) ( not ( = ?auto_4438 ?auto_4453 ) ) ( not ( = ?auto_4440 ?auto_4457 ) ) ( not ( = ?auto_4440 ?auto_4459 ) ) ( not ( = ?auto_4440 ?auto_4455 ) ) ( not ( = ?auto_4440 ?auto_4454 ) ) ( not ( = ?auto_4440 ?auto_4451 ) ) ( not ( = ?auto_4462 ?auto_4463 ) ) ( not ( = ?auto_4462 ?auto_4452 ) ) ( not ( = ?auto_4462 ?auto_4461 ) ) ( not ( = ?auto_4458 ?auto_4449 ) ) ( not ( = ?auto_4458 ?auto_4460 ) ) ( not ( = ?auto_4458 ?auto_4450 ) ) ( not ( = ?auto_4453 ?auto_4457 ) ) ( not ( = ?auto_4453 ?auto_4459 ) ) ( not ( = ?auto_4453 ?auto_4455 ) ) ( not ( = ?auto_4453 ?auto_4454 ) ) ( not ( = ?auto_4453 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4441 ) ) ( not ( = ?auto_4434 ?auto_4456 ) ) ( not ( = ?auto_4435 ?auto_4441 ) ) ( not ( = ?auto_4435 ?auto_4456 ) ) ( not ( = ?auto_4436 ?auto_4441 ) ) ( not ( = ?auto_4436 ?auto_4456 ) ) ( not ( = ?auto_4437 ?auto_4441 ) ) ( not ( = ?auto_4437 ?auto_4456 ) ) ( not ( = ?auto_4438 ?auto_4441 ) ) ( not ( = ?auto_4438 ?auto_4456 ) ) ( not ( = ?auto_4439 ?auto_4441 ) ) ( not ( = ?auto_4439 ?auto_4456 ) ) ( not ( = ?auto_4441 ?auto_4453 ) ) ( not ( = ?auto_4441 ?auto_4457 ) ) ( not ( = ?auto_4441 ?auto_4459 ) ) ( not ( = ?auto_4441 ?auto_4455 ) ) ( not ( = ?auto_4441 ?auto_4454 ) ) ( not ( = ?auto_4441 ?auto_4451 ) ) ( not ( = ?auto_4456 ?auto_4453 ) ) ( not ( = ?auto_4456 ?auto_4457 ) ) ( not ( = ?auto_4456 ?auto_4459 ) ) ( not ( = ?auto_4456 ?auto_4455 ) ) ( not ( = ?auto_4456 ?auto_4454 ) ) ( not ( = ?auto_4456 ?auto_4451 ) ) ( not ( = ?auto_4434 ?auto_4442 ) ) ( not ( = ?auto_4434 ?auto_4445 ) ) ( not ( = ?auto_4435 ?auto_4442 ) ) ( not ( = ?auto_4435 ?auto_4445 ) ) ( not ( = ?auto_4436 ?auto_4442 ) ) ( not ( = ?auto_4436 ?auto_4445 ) ) ( not ( = ?auto_4437 ?auto_4442 ) ) ( not ( = ?auto_4437 ?auto_4445 ) ) ( not ( = ?auto_4438 ?auto_4442 ) ) ( not ( = ?auto_4438 ?auto_4445 ) ) ( not ( = ?auto_4439 ?auto_4442 ) ) ( not ( = ?auto_4439 ?auto_4445 ) ) ( not ( = ?auto_4440 ?auto_4442 ) ) ( not ( = ?auto_4440 ?auto_4445 ) ) ( not ( = ?auto_4442 ?auto_4456 ) ) ( not ( = ?auto_4442 ?auto_4453 ) ) ( not ( = ?auto_4442 ?auto_4457 ) ) ( not ( = ?auto_4442 ?auto_4459 ) ) ( not ( = ?auto_4442 ?auto_4455 ) ) ( not ( = ?auto_4442 ?auto_4454 ) ) ( not ( = ?auto_4442 ?auto_4451 ) ) ( not ( = ?auto_4443 ?auto_4463 ) ) ( not ( = ?auto_4443 ?auto_4462 ) ) ( not ( = ?auto_4443 ?auto_4452 ) ) ( not ( = ?auto_4443 ?auto_4461 ) ) ( not ( = ?auto_4448 ?auto_4449 ) ) ( not ( = ?auto_4448 ?auto_4458 ) ) ( not ( = ?auto_4448 ?auto_4460 ) ) ( not ( = ?auto_4448 ?auto_4450 ) ) ( not ( = ?auto_4445 ?auto_4456 ) ) ( not ( = ?auto_4445 ?auto_4453 ) ) ( not ( = ?auto_4445 ?auto_4457 ) ) ( not ( = ?auto_4445 ?auto_4459 ) ) ( not ( = ?auto_4445 ?auto_4455 ) ) ( not ( = ?auto_4445 ?auto_4454 ) ) ( not ( = ?auto_4445 ?auto_4451 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4440 ?auto_4441 )
      ( MAKE-1CRATE ?auto_4441 ?auto_4442 )
      ( MAKE-8CRATE-VERIFY ?auto_4434 ?auto_4435 ?auto_4436 ?auto_4437 ?auto_4438 ?auto_4439 ?auto_4440 ?auto_4441 ?auto_4442 ) )
  )

)

