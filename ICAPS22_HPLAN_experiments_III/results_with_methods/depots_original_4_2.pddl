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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9213 - SURFACE
      ?auto_9214 - SURFACE
    )
    :vars
    (
      ?auto_9215 - HOIST
      ?auto_9216 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9215 ?auto_9216 ) ( SURFACE-AT ?auto_9213 ?auto_9216 ) ( CLEAR ?auto_9213 ) ( LIFTING ?auto_9215 ?auto_9214 ) ( IS-CRATE ?auto_9214 ) ( not ( = ?auto_9213 ?auto_9214 ) ) )
    :subtasks
    ( ( !DROP ?auto_9215 ?auto_9214 ?auto_9213 ?auto_9216 )
      ( MAKE-1CRATE-VERIFY ?auto_9213 ?auto_9214 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9217 - SURFACE
      ?auto_9218 - SURFACE
    )
    :vars
    (
      ?auto_9219 - HOIST
      ?auto_9220 - PLACE
      ?auto_9221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9219 ?auto_9220 ) ( SURFACE-AT ?auto_9217 ?auto_9220 ) ( CLEAR ?auto_9217 ) ( IS-CRATE ?auto_9218 ) ( not ( = ?auto_9217 ?auto_9218 ) ) ( TRUCK-AT ?auto_9221 ?auto_9220 ) ( AVAILABLE ?auto_9219 ) ( IN ?auto_9218 ?auto_9221 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9219 ?auto_9218 ?auto_9221 ?auto_9220 )
      ( MAKE-1CRATE ?auto_9217 ?auto_9218 )
      ( MAKE-1CRATE-VERIFY ?auto_9217 ?auto_9218 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9222 - SURFACE
      ?auto_9223 - SURFACE
    )
    :vars
    (
      ?auto_9224 - HOIST
      ?auto_9225 - PLACE
      ?auto_9226 - TRUCK
      ?auto_9227 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9224 ?auto_9225 ) ( SURFACE-AT ?auto_9222 ?auto_9225 ) ( CLEAR ?auto_9222 ) ( IS-CRATE ?auto_9223 ) ( not ( = ?auto_9222 ?auto_9223 ) ) ( AVAILABLE ?auto_9224 ) ( IN ?auto_9223 ?auto_9226 ) ( TRUCK-AT ?auto_9226 ?auto_9227 ) ( not ( = ?auto_9227 ?auto_9225 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9226 ?auto_9227 ?auto_9225 )
      ( MAKE-1CRATE ?auto_9222 ?auto_9223 )
      ( MAKE-1CRATE-VERIFY ?auto_9222 ?auto_9223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9228 - SURFACE
      ?auto_9229 - SURFACE
    )
    :vars
    (
      ?auto_9232 - HOIST
      ?auto_9230 - PLACE
      ?auto_9231 - TRUCK
      ?auto_9233 - PLACE
      ?auto_9234 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9232 ?auto_9230 ) ( SURFACE-AT ?auto_9228 ?auto_9230 ) ( CLEAR ?auto_9228 ) ( IS-CRATE ?auto_9229 ) ( not ( = ?auto_9228 ?auto_9229 ) ) ( AVAILABLE ?auto_9232 ) ( TRUCK-AT ?auto_9231 ?auto_9233 ) ( not ( = ?auto_9233 ?auto_9230 ) ) ( HOIST-AT ?auto_9234 ?auto_9233 ) ( LIFTING ?auto_9234 ?auto_9229 ) ( not ( = ?auto_9232 ?auto_9234 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9234 ?auto_9229 ?auto_9231 ?auto_9233 )
      ( MAKE-1CRATE ?auto_9228 ?auto_9229 )
      ( MAKE-1CRATE-VERIFY ?auto_9228 ?auto_9229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9235 - SURFACE
      ?auto_9236 - SURFACE
    )
    :vars
    (
      ?auto_9239 - HOIST
      ?auto_9237 - PLACE
      ?auto_9241 - TRUCK
      ?auto_9240 - PLACE
      ?auto_9238 - HOIST
      ?auto_9242 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9239 ?auto_9237 ) ( SURFACE-AT ?auto_9235 ?auto_9237 ) ( CLEAR ?auto_9235 ) ( IS-CRATE ?auto_9236 ) ( not ( = ?auto_9235 ?auto_9236 ) ) ( AVAILABLE ?auto_9239 ) ( TRUCK-AT ?auto_9241 ?auto_9240 ) ( not ( = ?auto_9240 ?auto_9237 ) ) ( HOIST-AT ?auto_9238 ?auto_9240 ) ( not ( = ?auto_9239 ?auto_9238 ) ) ( AVAILABLE ?auto_9238 ) ( SURFACE-AT ?auto_9236 ?auto_9240 ) ( ON ?auto_9236 ?auto_9242 ) ( CLEAR ?auto_9236 ) ( not ( = ?auto_9235 ?auto_9242 ) ) ( not ( = ?auto_9236 ?auto_9242 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9238 ?auto_9236 ?auto_9242 ?auto_9240 )
      ( MAKE-1CRATE ?auto_9235 ?auto_9236 )
      ( MAKE-1CRATE-VERIFY ?auto_9235 ?auto_9236 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9243 - SURFACE
      ?auto_9244 - SURFACE
    )
    :vars
    (
      ?auto_9248 - HOIST
      ?auto_9246 - PLACE
      ?auto_9250 - PLACE
      ?auto_9249 - HOIST
      ?auto_9245 - SURFACE
      ?auto_9247 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9248 ?auto_9246 ) ( SURFACE-AT ?auto_9243 ?auto_9246 ) ( CLEAR ?auto_9243 ) ( IS-CRATE ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9244 ) ) ( AVAILABLE ?auto_9248 ) ( not ( = ?auto_9250 ?auto_9246 ) ) ( HOIST-AT ?auto_9249 ?auto_9250 ) ( not ( = ?auto_9248 ?auto_9249 ) ) ( AVAILABLE ?auto_9249 ) ( SURFACE-AT ?auto_9244 ?auto_9250 ) ( ON ?auto_9244 ?auto_9245 ) ( CLEAR ?auto_9244 ) ( not ( = ?auto_9243 ?auto_9245 ) ) ( not ( = ?auto_9244 ?auto_9245 ) ) ( TRUCK-AT ?auto_9247 ?auto_9246 ) )
    :subtasks
    ( ( !DRIVE ?auto_9247 ?auto_9246 ?auto_9250 )
      ( MAKE-1CRATE ?auto_9243 ?auto_9244 )
      ( MAKE-1CRATE-VERIFY ?auto_9243 ?auto_9244 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9256 - SURFACE
      ?auto_9257 - SURFACE
    )
    :vars
    (
      ?auto_9258 - HOIST
      ?auto_9259 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9258 ?auto_9259 ) ( SURFACE-AT ?auto_9256 ?auto_9259 ) ( CLEAR ?auto_9256 ) ( LIFTING ?auto_9258 ?auto_9257 ) ( IS-CRATE ?auto_9257 ) ( not ( = ?auto_9256 ?auto_9257 ) ) )
    :subtasks
    ( ( !DROP ?auto_9258 ?auto_9257 ?auto_9256 ?auto_9259 )
      ( MAKE-1CRATE-VERIFY ?auto_9256 ?auto_9257 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9260 - SURFACE
      ?auto_9261 - SURFACE
      ?auto_9262 - SURFACE
    )
    :vars
    (
      ?auto_9263 - HOIST
      ?auto_9264 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9263 ?auto_9264 ) ( SURFACE-AT ?auto_9261 ?auto_9264 ) ( CLEAR ?auto_9261 ) ( LIFTING ?auto_9263 ?auto_9262 ) ( IS-CRATE ?auto_9262 ) ( not ( = ?auto_9261 ?auto_9262 ) ) ( ON ?auto_9261 ?auto_9260 ) ( not ( = ?auto_9260 ?auto_9261 ) ) ( not ( = ?auto_9260 ?auto_9262 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9261 ?auto_9262 )
      ( MAKE-2CRATE-VERIFY ?auto_9260 ?auto_9261 ?auto_9262 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9265 - SURFACE
      ?auto_9266 - SURFACE
    )
    :vars
    (
      ?auto_9267 - HOIST
      ?auto_9268 - PLACE
      ?auto_9269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9267 ?auto_9268 ) ( SURFACE-AT ?auto_9265 ?auto_9268 ) ( CLEAR ?auto_9265 ) ( IS-CRATE ?auto_9266 ) ( not ( = ?auto_9265 ?auto_9266 ) ) ( TRUCK-AT ?auto_9269 ?auto_9268 ) ( AVAILABLE ?auto_9267 ) ( IN ?auto_9266 ?auto_9269 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9267 ?auto_9266 ?auto_9269 ?auto_9268 )
      ( MAKE-1CRATE ?auto_9265 ?auto_9266 )
      ( MAKE-1CRATE-VERIFY ?auto_9265 ?auto_9266 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9270 - SURFACE
      ?auto_9271 - SURFACE
      ?auto_9272 - SURFACE
    )
    :vars
    (
      ?auto_9273 - HOIST
      ?auto_9274 - PLACE
      ?auto_9275 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9273 ?auto_9274 ) ( SURFACE-AT ?auto_9271 ?auto_9274 ) ( CLEAR ?auto_9271 ) ( IS-CRATE ?auto_9272 ) ( not ( = ?auto_9271 ?auto_9272 ) ) ( TRUCK-AT ?auto_9275 ?auto_9274 ) ( AVAILABLE ?auto_9273 ) ( IN ?auto_9272 ?auto_9275 ) ( ON ?auto_9271 ?auto_9270 ) ( not ( = ?auto_9270 ?auto_9271 ) ) ( not ( = ?auto_9270 ?auto_9272 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9271 ?auto_9272 )
      ( MAKE-2CRATE-VERIFY ?auto_9270 ?auto_9271 ?auto_9272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9276 - SURFACE
      ?auto_9277 - SURFACE
    )
    :vars
    (
      ?auto_9281 - HOIST
      ?auto_9280 - PLACE
      ?auto_9278 - TRUCK
      ?auto_9279 - SURFACE
      ?auto_9282 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9281 ?auto_9280 ) ( SURFACE-AT ?auto_9276 ?auto_9280 ) ( CLEAR ?auto_9276 ) ( IS-CRATE ?auto_9277 ) ( not ( = ?auto_9276 ?auto_9277 ) ) ( AVAILABLE ?auto_9281 ) ( IN ?auto_9277 ?auto_9278 ) ( ON ?auto_9276 ?auto_9279 ) ( not ( = ?auto_9279 ?auto_9276 ) ) ( not ( = ?auto_9279 ?auto_9277 ) ) ( TRUCK-AT ?auto_9278 ?auto_9282 ) ( not ( = ?auto_9282 ?auto_9280 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9278 ?auto_9282 ?auto_9280 )
      ( MAKE-2CRATE ?auto_9279 ?auto_9276 ?auto_9277 )
      ( MAKE-1CRATE-VERIFY ?auto_9276 ?auto_9277 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9283 - SURFACE
      ?auto_9284 - SURFACE
      ?auto_9285 - SURFACE
    )
    :vars
    (
      ?auto_9289 - HOIST
      ?auto_9287 - PLACE
      ?auto_9286 - TRUCK
      ?auto_9288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9289 ?auto_9287 ) ( SURFACE-AT ?auto_9284 ?auto_9287 ) ( CLEAR ?auto_9284 ) ( IS-CRATE ?auto_9285 ) ( not ( = ?auto_9284 ?auto_9285 ) ) ( AVAILABLE ?auto_9289 ) ( IN ?auto_9285 ?auto_9286 ) ( ON ?auto_9284 ?auto_9283 ) ( not ( = ?auto_9283 ?auto_9284 ) ) ( not ( = ?auto_9283 ?auto_9285 ) ) ( TRUCK-AT ?auto_9286 ?auto_9288 ) ( not ( = ?auto_9288 ?auto_9287 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9284 ?auto_9285 )
      ( MAKE-2CRATE-VERIFY ?auto_9283 ?auto_9284 ?auto_9285 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9290 - SURFACE
      ?auto_9291 - SURFACE
    )
    :vars
    (
      ?auto_9293 - HOIST
      ?auto_9292 - PLACE
      ?auto_9295 - SURFACE
      ?auto_9296 - TRUCK
      ?auto_9294 - PLACE
      ?auto_9297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9293 ?auto_9292 ) ( SURFACE-AT ?auto_9290 ?auto_9292 ) ( CLEAR ?auto_9290 ) ( IS-CRATE ?auto_9291 ) ( not ( = ?auto_9290 ?auto_9291 ) ) ( AVAILABLE ?auto_9293 ) ( ON ?auto_9290 ?auto_9295 ) ( not ( = ?auto_9295 ?auto_9290 ) ) ( not ( = ?auto_9295 ?auto_9291 ) ) ( TRUCK-AT ?auto_9296 ?auto_9294 ) ( not ( = ?auto_9294 ?auto_9292 ) ) ( HOIST-AT ?auto_9297 ?auto_9294 ) ( LIFTING ?auto_9297 ?auto_9291 ) ( not ( = ?auto_9293 ?auto_9297 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9297 ?auto_9291 ?auto_9296 ?auto_9294 )
      ( MAKE-2CRATE ?auto_9295 ?auto_9290 ?auto_9291 )
      ( MAKE-1CRATE-VERIFY ?auto_9290 ?auto_9291 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9298 - SURFACE
      ?auto_9299 - SURFACE
      ?auto_9300 - SURFACE
    )
    :vars
    (
      ?auto_9301 - HOIST
      ?auto_9305 - PLACE
      ?auto_9302 - TRUCK
      ?auto_9304 - PLACE
      ?auto_9303 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9301 ?auto_9305 ) ( SURFACE-AT ?auto_9299 ?auto_9305 ) ( CLEAR ?auto_9299 ) ( IS-CRATE ?auto_9300 ) ( not ( = ?auto_9299 ?auto_9300 ) ) ( AVAILABLE ?auto_9301 ) ( ON ?auto_9299 ?auto_9298 ) ( not ( = ?auto_9298 ?auto_9299 ) ) ( not ( = ?auto_9298 ?auto_9300 ) ) ( TRUCK-AT ?auto_9302 ?auto_9304 ) ( not ( = ?auto_9304 ?auto_9305 ) ) ( HOIST-AT ?auto_9303 ?auto_9304 ) ( LIFTING ?auto_9303 ?auto_9300 ) ( not ( = ?auto_9301 ?auto_9303 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9299 ?auto_9300 )
      ( MAKE-2CRATE-VERIFY ?auto_9298 ?auto_9299 ?auto_9300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9306 - SURFACE
      ?auto_9307 - SURFACE
    )
    :vars
    (
      ?auto_9308 - HOIST
      ?auto_9309 - PLACE
      ?auto_9311 - SURFACE
      ?auto_9313 - TRUCK
      ?auto_9310 - PLACE
      ?auto_9312 - HOIST
      ?auto_9314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9308 ?auto_9309 ) ( SURFACE-AT ?auto_9306 ?auto_9309 ) ( CLEAR ?auto_9306 ) ( IS-CRATE ?auto_9307 ) ( not ( = ?auto_9306 ?auto_9307 ) ) ( AVAILABLE ?auto_9308 ) ( ON ?auto_9306 ?auto_9311 ) ( not ( = ?auto_9311 ?auto_9306 ) ) ( not ( = ?auto_9311 ?auto_9307 ) ) ( TRUCK-AT ?auto_9313 ?auto_9310 ) ( not ( = ?auto_9310 ?auto_9309 ) ) ( HOIST-AT ?auto_9312 ?auto_9310 ) ( not ( = ?auto_9308 ?auto_9312 ) ) ( AVAILABLE ?auto_9312 ) ( SURFACE-AT ?auto_9307 ?auto_9310 ) ( ON ?auto_9307 ?auto_9314 ) ( CLEAR ?auto_9307 ) ( not ( = ?auto_9306 ?auto_9314 ) ) ( not ( = ?auto_9307 ?auto_9314 ) ) ( not ( = ?auto_9311 ?auto_9314 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9312 ?auto_9307 ?auto_9314 ?auto_9310 )
      ( MAKE-2CRATE ?auto_9311 ?auto_9306 ?auto_9307 )
      ( MAKE-1CRATE-VERIFY ?auto_9306 ?auto_9307 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9315 - SURFACE
      ?auto_9316 - SURFACE
      ?auto_9317 - SURFACE
    )
    :vars
    (
      ?auto_9318 - HOIST
      ?auto_9322 - PLACE
      ?auto_9319 - TRUCK
      ?auto_9321 - PLACE
      ?auto_9320 - HOIST
      ?auto_9323 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9318 ?auto_9322 ) ( SURFACE-AT ?auto_9316 ?auto_9322 ) ( CLEAR ?auto_9316 ) ( IS-CRATE ?auto_9317 ) ( not ( = ?auto_9316 ?auto_9317 ) ) ( AVAILABLE ?auto_9318 ) ( ON ?auto_9316 ?auto_9315 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( not ( = ?auto_9315 ?auto_9317 ) ) ( TRUCK-AT ?auto_9319 ?auto_9321 ) ( not ( = ?auto_9321 ?auto_9322 ) ) ( HOIST-AT ?auto_9320 ?auto_9321 ) ( not ( = ?auto_9318 ?auto_9320 ) ) ( AVAILABLE ?auto_9320 ) ( SURFACE-AT ?auto_9317 ?auto_9321 ) ( ON ?auto_9317 ?auto_9323 ) ( CLEAR ?auto_9317 ) ( not ( = ?auto_9316 ?auto_9323 ) ) ( not ( = ?auto_9317 ?auto_9323 ) ) ( not ( = ?auto_9315 ?auto_9323 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9316 ?auto_9317 )
      ( MAKE-2CRATE-VERIFY ?auto_9315 ?auto_9316 ?auto_9317 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9324 - SURFACE
      ?auto_9325 - SURFACE
    )
    :vars
    (
      ?auto_9327 - HOIST
      ?auto_9328 - PLACE
      ?auto_9332 - SURFACE
      ?auto_9330 - PLACE
      ?auto_9326 - HOIST
      ?auto_9329 - SURFACE
      ?auto_9331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9327 ?auto_9328 ) ( SURFACE-AT ?auto_9324 ?auto_9328 ) ( CLEAR ?auto_9324 ) ( IS-CRATE ?auto_9325 ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( AVAILABLE ?auto_9327 ) ( ON ?auto_9324 ?auto_9332 ) ( not ( = ?auto_9332 ?auto_9324 ) ) ( not ( = ?auto_9332 ?auto_9325 ) ) ( not ( = ?auto_9330 ?auto_9328 ) ) ( HOIST-AT ?auto_9326 ?auto_9330 ) ( not ( = ?auto_9327 ?auto_9326 ) ) ( AVAILABLE ?auto_9326 ) ( SURFACE-AT ?auto_9325 ?auto_9330 ) ( ON ?auto_9325 ?auto_9329 ) ( CLEAR ?auto_9325 ) ( not ( = ?auto_9324 ?auto_9329 ) ) ( not ( = ?auto_9325 ?auto_9329 ) ) ( not ( = ?auto_9332 ?auto_9329 ) ) ( TRUCK-AT ?auto_9331 ?auto_9328 ) )
    :subtasks
    ( ( !DRIVE ?auto_9331 ?auto_9328 ?auto_9330 )
      ( MAKE-2CRATE ?auto_9332 ?auto_9324 ?auto_9325 )
      ( MAKE-1CRATE-VERIFY ?auto_9324 ?auto_9325 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9333 - SURFACE
      ?auto_9334 - SURFACE
      ?auto_9335 - SURFACE
    )
    :vars
    (
      ?auto_9341 - HOIST
      ?auto_9338 - PLACE
      ?auto_9339 - PLACE
      ?auto_9336 - HOIST
      ?auto_9340 - SURFACE
      ?auto_9337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9341 ?auto_9338 ) ( SURFACE-AT ?auto_9334 ?auto_9338 ) ( CLEAR ?auto_9334 ) ( IS-CRATE ?auto_9335 ) ( not ( = ?auto_9334 ?auto_9335 ) ) ( AVAILABLE ?auto_9341 ) ( ON ?auto_9334 ?auto_9333 ) ( not ( = ?auto_9333 ?auto_9334 ) ) ( not ( = ?auto_9333 ?auto_9335 ) ) ( not ( = ?auto_9339 ?auto_9338 ) ) ( HOIST-AT ?auto_9336 ?auto_9339 ) ( not ( = ?auto_9341 ?auto_9336 ) ) ( AVAILABLE ?auto_9336 ) ( SURFACE-AT ?auto_9335 ?auto_9339 ) ( ON ?auto_9335 ?auto_9340 ) ( CLEAR ?auto_9335 ) ( not ( = ?auto_9334 ?auto_9340 ) ) ( not ( = ?auto_9335 ?auto_9340 ) ) ( not ( = ?auto_9333 ?auto_9340 ) ) ( TRUCK-AT ?auto_9337 ?auto_9338 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9334 ?auto_9335 )
      ( MAKE-2CRATE-VERIFY ?auto_9333 ?auto_9334 ?auto_9335 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9342 - SURFACE
      ?auto_9343 - SURFACE
    )
    :vars
    (
      ?auto_9348 - HOIST
      ?auto_9350 - PLACE
      ?auto_9349 - SURFACE
      ?auto_9347 - PLACE
      ?auto_9344 - HOIST
      ?auto_9345 - SURFACE
      ?auto_9346 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9348 ?auto_9350 ) ( IS-CRATE ?auto_9343 ) ( not ( = ?auto_9342 ?auto_9343 ) ) ( not ( = ?auto_9349 ?auto_9342 ) ) ( not ( = ?auto_9349 ?auto_9343 ) ) ( not ( = ?auto_9347 ?auto_9350 ) ) ( HOIST-AT ?auto_9344 ?auto_9347 ) ( not ( = ?auto_9348 ?auto_9344 ) ) ( AVAILABLE ?auto_9344 ) ( SURFACE-AT ?auto_9343 ?auto_9347 ) ( ON ?auto_9343 ?auto_9345 ) ( CLEAR ?auto_9343 ) ( not ( = ?auto_9342 ?auto_9345 ) ) ( not ( = ?auto_9343 ?auto_9345 ) ) ( not ( = ?auto_9349 ?auto_9345 ) ) ( TRUCK-AT ?auto_9346 ?auto_9350 ) ( SURFACE-AT ?auto_9349 ?auto_9350 ) ( CLEAR ?auto_9349 ) ( LIFTING ?auto_9348 ?auto_9342 ) ( IS-CRATE ?auto_9342 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9349 ?auto_9342 )
      ( MAKE-2CRATE ?auto_9349 ?auto_9342 ?auto_9343 )
      ( MAKE-1CRATE-VERIFY ?auto_9342 ?auto_9343 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9351 - SURFACE
      ?auto_9352 - SURFACE
      ?auto_9353 - SURFACE
    )
    :vars
    (
      ?auto_9357 - HOIST
      ?auto_9358 - PLACE
      ?auto_9354 - PLACE
      ?auto_9359 - HOIST
      ?auto_9356 - SURFACE
      ?auto_9355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9357 ?auto_9358 ) ( IS-CRATE ?auto_9353 ) ( not ( = ?auto_9352 ?auto_9353 ) ) ( not ( = ?auto_9351 ?auto_9352 ) ) ( not ( = ?auto_9351 ?auto_9353 ) ) ( not ( = ?auto_9354 ?auto_9358 ) ) ( HOIST-AT ?auto_9359 ?auto_9354 ) ( not ( = ?auto_9357 ?auto_9359 ) ) ( AVAILABLE ?auto_9359 ) ( SURFACE-AT ?auto_9353 ?auto_9354 ) ( ON ?auto_9353 ?auto_9356 ) ( CLEAR ?auto_9353 ) ( not ( = ?auto_9352 ?auto_9356 ) ) ( not ( = ?auto_9353 ?auto_9356 ) ) ( not ( = ?auto_9351 ?auto_9356 ) ) ( TRUCK-AT ?auto_9355 ?auto_9358 ) ( SURFACE-AT ?auto_9351 ?auto_9358 ) ( CLEAR ?auto_9351 ) ( LIFTING ?auto_9357 ?auto_9352 ) ( IS-CRATE ?auto_9352 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9352 ?auto_9353 )
      ( MAKE-2CRATE-VERIFY ?auto_9351 ?auto_9352 ?auto_9353 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9360 - SURFACE
      ?auto_9361 - SURFACE
    )
    :vars
    (
      ?auto_9365 - HOIST
      ?auto_9366 - PLACE
      ?auto_9368 - SURFACE
      ?auto_9367 - PLACE
      ?auto_9364 - HOIST
      ?auto_9362 - SURFACE
      ?auto_9363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9365 ?auto_9366 ) ( IS-CRATE ?auto_9361 ) ( not ( = ?auto_9360 ?auto_9361 ) ) ( not ( = ?auto_9368 ?auto_9360 ) ) ( not ( = ?auto_9368 ?auto_9361 ) ) ( not ( = ?auto_9367 ?auto_9366 ) ) ( HOIST-AT ?auto_9364 ?auto_9367 ) ( not ( = ?auto_9365 ?auto_9364 ) ) ( AVAILABLE ?auto_9364 ) ( SURFACE-AT ?auto_9361 ?auto_9367 ) ( ON ?auto_9361 ?auto_9362 ) ( CLEAR ?auto_9361 ) ( not ( = ?auto_9360 ?auto_9362 ) ) ( not ( = ?auto_9361 ?auto_9362 ) ) ( not ( = ?auto_9368 ?auto_9362 ) ) ( TRUCK-AT ?auto_9363 ?auto_9366 ) ( SURFACE-AT ?auto_9368 ?auto_9366 ) ( CLEAR ?auto_9368 ) ( IS-CRATE ?auto_9360 ) ( AVAILABLE ?auto_9365 ) ( IN ?auto_9360 ?auto_9363 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9365 ?auto_9360 ?auto_9363 ?auto_9366 )
      ( MAKE-2CRATE ?auto_9368 ?auto_9360 ?auto_9361 )
      ( MAKE-1CRATE-VERIFY ?auto_9360 ?auto_9361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9369 - SURFACE
      ?auto_9370 - SURFACE
      ?auto_9371 - SURFACE
    )
    :vars
    (
      ?auto_9377 - HOIST
      ?auto_9372 - PLACE
      ?auto_9376 - PLACE
      ?auto_9374 - HOIST
      ?auto_9373 - SURFACE
      ?auto_9375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9377 ?auto_9372 ) ( IS-CRATE ?auto_9371 ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9369 ?auto_9370 ) ) ( not ( = ?auto_9369 ?auto_9371 ) ) ( not ( = ?auto_9376 ?auto_9372 ) ) ( HOIST-AT ?auto_9374 ?auto_9376 ) ( not ( = ?auto_9377 ?auto_9374 ) ) ( AVAILABLE ?auto_9374 ) ( SURFACE-AT ?auto_9371 ?auto_9376 ) ( ON ?auto_9371 ?auto_9373 ) ( CLEAR ?auto_9371 ) ( not ( = ?auto_9370 ?auto_9373 ) ) ( not ( = ?auto_9371 ?auto_9373 ) ) ( not ( = ?auto_9369 ?auto_9373 ) ) ( TRUCK-AT ?auto_9375 ?auto_9372 ) ( SURFACE-AT ?auto_9369 ?auto_9372 ) ( CLEAR ?auto_9369 ) ( IS-CRATE ?auto_9370 ) ( AVAILABLE ?auto_9377 ) ( IN ?auto_9370 ?auto_9375 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9370 ?auto_9371 )
      ( MAKE-2CRATE-VERIFY ?auto_9369 ?auto_9370 ?auto_9371 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9378 - SURFACE
      ?auto_9379 - SURFACE
    )
    :vars
    (
      ?auto_9384 - HOIST
      ?auto_9385 - PLACE
      ?auto_9386 - SURFACE
      ?auto_9382 - PLACE
      ?auto_9383 - HOIST
      ?auto_9381 - SURFACE
      ?auto_9380 - TRUCK
      ?auto_9387 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9384 ?auto_9385 ) ( IS-CRATE ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9379 ) ) ( not ( = ?auto_9386 ?auto_9378 ) ) ( not ( = ?auto_9386 ?auto_9379 ) ) ( not ( = ?auto_9382 ?auto_9385 ) ) ( HOIST-AT ?auto_9383 ?auto_9382 ) ( not ( = ?auto_9384 ?auto_9383 ) ) ( AVAILABLE ?auto_9383 ) ( SURFACE-AT ?auto_9379 ?auto_9382 ) ( ON ?auto_9379 ?auto_9381 ) ( CLEAR ?auto_9379 ) ( not ( = ?auto_9378 ?auto_9381 ) ) ( not ( = ?auto_9379 ?auto_9381 ) ) ( not ( = ?auto_9386 ?auto_9381 ) ) ( SURFACE-AT ?auto_9386 ?auto_9385 ) ( CLEAR ?auto_9386 ) ( IS-CRATE ?auto_9378 ) ( AVAILABLE ?auto_9384 ) ( IN ?auto_9378 ?auto_9380 ) ( TRUCK-AT ?auto_9380 ?auto_9387 ) ( not ( = ?auto_9387 ?auto_9385 ) ) ( not ( = ?auto_9382 ?auto_9387 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9380 ?auto_9387 ?auto_9385 )
      ( MAKE-2CRATE ?auto_9386 ?auto_9378 ?auto_9379 )
      ( MAKE-1CRATE-VERIFY ?auto_9378 ?auto_9379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9388 - SURFACE
      ?auto_9389 - SURFACE
      ?auto_9390 - SURFACE
    )
    :vars
    (
      ?auto_9392 - HOIST
      ?auto_9396 - PLACE
      ?auto_9394 - PLACE
      ?auto_9393 - HOIST
      ?auto_9391 - SURFACE
      ?auto_9397 - TRUCK
      ?auto_9395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9392 ?auto_9396 ) ( IS-CRATE ?auto_9390 ) ( not ( = ?auto_9389 ?auto_9390 ) ) ( not ( = ?auto_9388 ?auto_9389 ) ) ( not ( = ?auto_9388 ?auto_9390 ) ) ( not ( = ?auto_9394 ?auto_9396 ) ) ( HOIST-AT ?auto_9393 ?auto_9394 ) ( not ( = ?auto_9392 ?auto_9393 ) ) ( AVAILABLE ?auto_9393 ) ( SURFACE-AT ?auto_9390 ?auto_9394 ) ( ON ?auto_9390 ?auto_9391 ) ( CLEAR ?auto_9390 ) ( not ( = ?auto_9389 ?auto_9391 ) ) ( not ( = ?auto_9390 ?auto_9391 ) ) ( not ( = ?auto_9388 ?auto_9391 ) ) ( SURFACE-AT ?auto_9388 ?auto_9396 ) ( CLEAR ?auto_9388 ) ( IS-CRATE ?auto_9389 ) ( AVAILABLE ?auto_9392 ) ( IN ?auto_9389 ?auto_9397 ) ( TRUCK-AT ?auto_9397 ?auto_9395 ) ( not ( = ?auto_9395 ?auto_9396 ) ) ( not ( = ?auto_9394 ?auto_9395 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9389 ?auto_9390 )
      ( MAKE-2CRATE-VERIFY ?auto_9388 ?auto_9389 ?auto_9390 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9398 - SURFACE
      ?auto_9399 - SURFACE
    )
    :vars
    (
      ?auto_9403 - HOIST
      ?auto_9406 - PLACE
      ?auto_9400 - SURFACE
      ?auto_9401 - PLACE
      ?auto_9404 - HOIST
      ?auto_9405 - SURFACE
      ?auto_9402 - TRUCK
      ?auto_9407 - PLACE
      ?auto_9408 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9403 ?auto_9406 ) ( IS-CRATE ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9399 ) ) ( not ( = ?auto_9400 ?auto_9398 ) ) ( not ( = ?auto_9400 ?auto_9399 ) ) ( not ( = ?auto_9401 ?auto_9406 ) ) ( HOIST-AT ?auto_9404 ?auto_9401 ) ( not ( = ?auto_9403 ?auto_9404 ) ) ( AVAILABLE ?auto_9404 ) ( SURFACE-AT ?auto_9399 ?auto_9401 ) ( ON ?auto_9399 ?auto_9405 ) ( CLEAR ?auto_9399 ) ( not ( = ?auto_9398 ?auto_9405 ) ) ( not ( = ?auto_9399 ?auto_9405 ) ) ( not ( = ?auto_9400 ?auto_9405 ) ) ( SURFACE-AT ?auto_9400 ?auto_9406 ) ( CLEAR ?auto_9400 ) ( IS-CRATE ?auto_9398 ) ( AVAILABLE ?auto_9403 ) ( TRUCK-AT ?auto_9402 ?auto_9407 ) ( not ( = ?auto_9407 ?auto_9406 ) ) ( not ( = ?auto_9401 ?auto_9407 ) ) ( HOIST-AT ?auto_9408 ?auto_9407 ) ( LIFTING ?auto_9408 ?auto_9398 ) ( not ( = ?auto_9403 ?auto_9408 ) ) ( not ( = ?auto_9404 ?auto_9408 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9408 ?auto_9398 ?auto_9402 ?auto_9407 )
      ( MAKE-2CRATE ?auto_9400 ?auto_9398 ?auto_9399 )
      ( MAKE-1CRATE-VERIFY ?auto_9398 ?auto_9399 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9409 - SURFACE
      ?auto_9410 - SURFACE
      ?auto_9411 - SURFACE
    )
    :vars
    (
      ?auto_9415 - HOIST
      ?auto_9419 - PLACE
      ?auto_9413 - PLACE
      ?auto_9418 - HOIST
      ?auto_9414 - SURFACE
      ?auto_9412 - TRUCK
      ?auto_9417 - PLACE
      ?auto_9416 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9415 ?auto_9419 ) ( IS-CRATE ?auto_9411 ) ( not ( = ?auto_9410 ?auto_9411 ) ) ( not ( = ?auto_9409 ?auto_9410 ) ) ( not ( = ?auto_9409 ?auto_9411 ) ) ( not ( = ?auto_9413 ?auto_9419 ) ) ( HOIST-AT ?auto_9418 ?auto_9413 ) ( not ( = ?auto_9415 ?auto_9418 ) ) ( AVAILABLE ?auto_9418 ) ( SURFACE-AT ?auto_9411 ?auto_9413 ) ( ON ?auto_9411 ?auto_9414 ) ( CLEAR ?auto_9411 ) ( not ( = ?auto_9410 ?auto_9414 ) ) ( not ( = ?auto_9411 ?auto_9414 ) ) ( not ( = ?auto_9409 ?auto_9414 ) ) ( SURFACE-AT ?auto_9409 ?auto_9419 ) ( CLEAR ?auto_9409 ) ( IS-CRATE ?auto_9410 ) ( AVAILABLE ?auto_9415 ) ( TRUCK-AT ?auto_9412 ?auto_9417 ) ( not ( = ?auto_9417 ?auto_9419 ) ) ( not ( = ?auto_9413 ?auto_9417 ) ) ( HOIST-AT ?auto_9416 ?auto_9417 ) ( LIFTING ?auto_9416 ?auto_9410 ) ( not ( = ?auto_9415 ?auto_9416 ) ) ( not ( = ?auto_9418 ?auto_9416 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9410 ?auto_9411 )
      ( MAKE-2CRATE-VERIFY ?auto_9409 ?auto_9410 ?auto_9411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9420 - SURFACE
      ?auto_9421 - SURFACE
    )
    :vars
    (
      ?auto_9423 - HOIST
      ?auto_9429 - PLACE
      ?auto_9424 - SURFACE
      ?auto_9426 - PLACE
      ?auto_9422 - HOIST
      ?auto_9425 - SURFACE
      ?auto_9427 - TRUCK
      ?auto_9428 - PLACE
      ?auto_9430 - HOIST
      ?auto_9431 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9423 ?auto_9429 ) ( IS-CRATE ?auto_9421 ) ( not ( = ?auto_9420 ?auto_9421 ) ) ( not ( = ?auto_9424 ?auto_9420 ) ) ( not ( = ?auto_9424 ?auto_9421 ) ) ( not ( = ?auto_9426 ?auto_9429 ) ) ( HOIST-AT ?auto_9422 ?auto_9426 ) ( not ( = ?auto_9423 ?auto_9422 ) ) ( AVAILABLE ?auto_9422 ) ( SURFACE-AT ?auto_9421 ?auto_9426 ) ( ON ?auto_9421 ?auto_9425 ) ( CLEAR ?auto_9421 ) ( not ( = ?auto_9420 ?auto_9425 ) ) ( not ( = ?auto_9421 ?auto_9425 ) ) ( not ( = ?auto_9424 ?auto_9425 ) ) ( SURFACE-AT ?auto_9424 ?auto_9429 ) ( CLEAR ?auto_9424 ) ( IS-CRATE ?auto_9420 ) ( AVAILABLE ?auto_9423 ) ( TRUCK-AT ?auto_9427 ?auto_9428 ) ( not ( = ?auto_9428 ?auto_9429 ) ) ( not ( = ?auto_9426 ?auto_9428 ) ) ( HOIST-AT ?auto_9430 ?auto_9428 ) ( not ( = ?auto_9423 ?auto_9430 ) ) ( not ( = ?auto_9422 ?auto_9430 ) ) ( AVAILABLE ?auto_9430 ) ( SURFACE-AT ?auto_9420 ?auto_9428 ) ( ON ?auto_9420 ?auto_9431 ) ( CLEAR ?auto_9420 ) ( not ( = ?auto_9420 ?auto_9431 ) ) ( not ( = ?auto_9421 ?auto_9431 ) ) ( not ( = ?auto_9424 ?auto_9431 ) ) ( not ( = ?auto_9425 ?auto_9431 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9430 ?auto_9420 ?auto_9431 ?auto_9428 )
      ( MAKE-2CRATE ?auto_9424 ?auto_9420 ?auto_9421 )
      ( MAKE-1CRATE-VERIFY ?auto_9420 ?auto_9421 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9432 - SURFACE
      ?auto_9433 - SURFACE
      ?auto_9434 - SURFACE
    )
    :vars
    (
      ?auto_9435 - HOIST
      ?auto_9441 - PLACE
      ?auto_9436 - PLACE
      ?auto_9440 - HOIST
      ?auto_9438 - SURFACE
      ?auto_9439 - TRUCK
      ?auto_9443 - PLACE
      ?auto_9437 - HOIST
      ?auto_9442 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9435 ?auto_9441 ) ( IS-CRATE ?auto_9434 ) ( not ( = ?auto_9433 ?auto_9434 ) ) ( not ( = ?auto_9432 ?auto_9433 ) ) ( not ( = ?auto_9432 ?auto_9434 ) ) ( not ( = ?auto_9436 ?auto_9441 ) ) ( HOIST-AT ?auto_9440 ?auto_9436 ) ( not ( = ?auto_9435 ?auto_9440 ) ) ( AVAILABLE ?auto_9440 ) ( SURFACE-AT ?auto_9434 ?auto_9436 ) ( ON ?auto_9434 ?auto_9438 ) ( CLEAR ?auto_9434 ) ( not ( = ?auto_9433 ?auto_9438 ) ) ( not ( = ?auto_9434 ?auto_9438 ) ) ( not ( = ?auto_9432 ?auto_9438 ) ) ( SURFACE-AT ?auto_9432 ?auto_9441 ) ( CLEAR ?auto_9432 ) ( IS-CRATE ?auto_9433 ) ( AVAILABLE ?auto_9435 ) ( TRUCK-AT ?auto_9439 ?auto_9443 ) ( not ( = ?auto_9443 ?auto_9441 ) ) ( not ( = ?auto_9436 ?auto_9443 ) ) ( HOIST-AT ?auto_9437 ?auto_9443 ) ( not ( = ?auto_9435 ?auto_9437 ) ) ( not ( = ?auto_9440 ?auto_9437 ) ) ( AVAILABLE ?auto_9437 ) ( SURFACE-AT ?auto_9433 ?auto_9443 ) ( ON ?auto_9433 ?auto_9442 ) ( CLEAR ?auto_9433 ) ( not ( = ?auto_9433 ?auto_9442 ) ) ( not ( = ?auto_9434 ?auto_9442 ) ) ( not ( = ?auto_9432 ?auto_9442 ) ) ( not ( = ?auto_9438 ?auto_9442 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9433 ?auto_9434 )
      ( MAKE-2CRATE-VERIFY ?auto_9432 ?auto_9433 ?auto_9434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9444 - SURFACE
      ?auto_9445 - SURFACE
    )
    :vars
    (
      ?auto_9447 - HOIST
      ?auto_9446 - PLACE
      ?auto_9449 - SURFACE
      ?auto_9450 - PLACE
      ?auto_9452 - HOIST
      ?auto_9448 - SURFACE
      ?auto_9454 - PLACE
      ?auto_9455 - HOIST
      ?auto_9451 - SURFACE
      ?auto_9453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9447 ?auto_9446 ) ( IS-CRATE ?auto_9445 ) ( not ( = ?auto_9444 ?auto_9445 ) ) ( not ( = ?auto_9449 ?auto_9444 ) ) ( not ( = ?auto_9449 ?auto_9445 ) ) ( not ( = ?auto_9450 ?auto_9446 ) ) ( HOIST-AT ?auto_9452 ?auto_9450 ) ( not ( = ?auto_9447 ?auto_9452 ) ) ( AVAILABLE ?auto_9452 ) ( SURFACE-AT ?auto_9445 ?auto_9450 ) ( ON ?auto_9445 ?auto_9448 ) ( CLEAR ?auto_9445 ) ( not ( = ?auto_9444 ?auto_9448 ) ) ( not ( = ?auto_9445 ?auto_9448 ) ) ( not ( = ?auto_9449 ?auto_9448 ) ) ( SURFACE-AT ?auto_9449 ?auto_9446 ) ( CLEAR ?auto_9449 ) ( IS-CRATE ?auto_9444 ) ( AVAILABLE ?auto_9447 ) ( not ( = ?auto_9454 ?auto_9446 ) ) ( not ( = ?auto_9450 ?auto_9454 ) ) ( HOIST-AT ?auto_9455 ?auto_9454 ) ( not ( = ?auto_9447 ?auto_9455 ) ) ( not ( = ?auto_9452 ?auto_9455 ) ) ( AVAILABLE ?auto_9455 ) ( SURFACE-AT ?auto_9444 ?auto_9454 ) ( ON ?auto_9444 ?auto_9451 ) ( CLEAR ?auto_9444 ) ( not ( = ?auto_9444 ?auto_9451 ) ) ( not ( = ?auto_9445 ?auto_9451 ) ) ( not ( = ?auto_9449 ?auto_9451 ) ) ( not ( = ?auto_9448 ?auto_9451 ) ) ( TRUCK-AT ?auto_9453 ?auto_9446 ) )
    :subtasks
    ( ( !DRIVE ?auto_9453 ?auto_9446 ?auto_9454 )
      ( MAKE-2CRATE ?auto_9449 ?auto_9444 ?auto_9445 )
      ( MAKE-1CRATE-VERIFY ?auto_9444 ?auto_9445 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9456 - SURFACE
      ?auto_9457 - SURFACE
      ?auto_9458 - SURFACE
    )
    :vars
    (
      ?auto_9463 - HOIST
      ?auto_9462 - PLACE
      ?auto_9460 - PLACE
      ?auto_9461 - HOIST
      ?auto_9465 - SURFACE
      ?auto_9464 - PLACE
      ?auto_9466 - HOIST
      ?auto_9467 - SURFACE
      ?auto_9459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9463 ?auto_9462 ) ( IS-CRATE ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9456 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9458 ) ) ( not ( = ?auto_9460 ?auto_9462 ) ) ( HOIST-AT ?auto_9461 ?auto_9460 ) ( not ( = ?auto_9463 ?auto_9461 ) ) ( AVAILABLE ?auto_9461 ) ( SURFACE-AT ?auto_9458 ?auto_9460 ) ( ON ?auto_9458 ?auto_9465 ) ( CLEAR ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9465 ) ) ( not ( = ?auto_9458 ?auto_9465 ) ) ( not ( = ?auto_9456 ?auto_9465 ) ) ( SURFACE-AT ?auto_9456 ?auto_9462 ) ( CLEAR ?auto_9456 ) ( IS-CRATE ?auto_9457 ) ( AVAILABLE ?auto_9463 ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( not ( = ?auto_9460 ?auto_9464 ) ) ( HOIST-AT ?auto_9466 ?auto_9464 ) ( not ( = ?auto_9463 ?auto_9466 ) ) ( not ( = ?auto_9461 ?auto_9466 ) ) ( AVAILABLE ?auto_9466 ) ( SURFACE-AT ?auto_9457 ?auto_9464 ) ( ON ?auto_9457 ?auto_9467 ) ( CLEAR ?auto_9457 ) ( not ( = ?auto_9457 ?auto_9467 ) ) ( not ( = ?auto_9458 ?auto_9467 ) ) ( not ( = ?auto_9456 ?auto_9467 ) ) ( not ( = ?auto_9465 ?auto_9467 ) ) ( TRUCK-AT ?auto_9459 ?auto_9462 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9457 ?auto_9458 )
      ( MAKE-2CRATE-VERIFY ?auto_9456 ?auto_9457 ?auto_9458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9477 - SURFACE
      ?auto_9478 - SURFACE
    )
    :vars
    (
      ?auto_9479 - HOIST
      ?auto_9480 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9479 ?auto_9480 ) ( SURFACE-AT ?auto_9477 ?auto_9480 ) ( CLEAR ?auto_9477 ) ( LIFTING ?auto_9479 ?auto_9478 ) ( IS-CRATE ?auto_9478 ) ( not ( = ?auto_9477 ?auto_9478 ) ) )
    :subtasks
    ( ( !DROP ?auto_9479 ?auto_9478 ?auto_9477 ?auto_9480 )
      ( MAKE-1CRATE-VERIFY ?auto_9477 ?auto_9478 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9481 - SURFACE
      ?auto_9482 - SURFACE
      ?auto_9483 - SURFACE
    )
    :vars
    (
      ?auto_9484 - HOIST
      ?auto_9485 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9484 ?auto_9485 ) ( SURFACE-AT ?auto_9482 ?auto_9485 ) ( CLEAR ?auto_9482 ) ( LIFTING ?auto_9484 ?auto_9483 ) ( IS-CRATE ?auto_9483 ) ( not ( = ?auto_9482 ?auto_9483 ) ) ( ON ?auto_9482 ?auto_9481 ) ( not ( = ?auto_9481 ?auto_9482 ) ) ( not ( = ?auto_9481 ?auto_9483 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9482 ?auto_9483 )
      ( MAKE-2CRATE-VERIFY ?auto_9481 ?auto_9482 ?auto_9483 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9486 - SURFACE
      ?auto_9487 - SURFACE
      ?auto_9488 - SURFACE
      ?auto_9489 - SURFACE
    )
    :vars
    (
      ?auto_9490 - HOIST
      ?auto_9491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9490 ?auto_9491 ) ( SURFACE-AT ?auto_9488 ?auto_9491 ) ( CLEAR ?auto_9488 ) ( LIFTING ?auto_9490 ?auto_9489 ) ( IS-CRATE ?auto_9489 ) ( not ( = ?auto_9488 ?auto_9489 ) ) ( ON ?auto_9487 ?auto_9486 ) ( ON ?auto_9488 ?auto_9487 ) ( not ( = ?auto_9486 ?auto_9487 ) ) ( not ( = ?auto_9486 ?auto_9488 ) ) ( not ( = ?auto_9486 ?auto_9489 ) ) ( not ( = ?auto_9487 ?auto_9488 ) ) ( not ( = ?auto_9487 ?auto_9489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9488 ?auto_9489 )
      ( MAKE-3CRATE-VERIFY ?auto_9486 ?auto_9487 ?auto_9488 ?auto_9489 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9492 - SURFACE
      ?auto_9493 - SURFACE
    )
    :vars
    (
      ?auto_9494 - HOIST
      ?auto_9495 - PLACE
      ?auto_9496 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9494 ?auto_9495 ) ( SURFACE-AT ?auto_9492 ?auto_9495 ) ( CLEAR ?auto_9492 ) ( IS-CRATE ?auto_9493 ) ( not ( = ?auto_9492 ?auto_9493 ) ) ( TRUCK-AT ?auto_9496 ?auto_9495 ) ( AVAILABLE ?auto_9494 ) ( IN ?auto_9493 ?auto_9496 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9494 ?auto_9493 ?auto_9496 ?auto_9495 )
      ( MAKE-1CRATE ?auto_9492 ?auto_9493 )
      ( MAKE-1CRATE-VERIFY ?auto_9492 ?auto_9493 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9497 - SURFACE
      ?auto_9498 - SURFACE
      ?auto_9499 - SURFACE
    )
    :vars
    (
      ?auto_9500 - HOIST
      ?auto_9502 - PLACE
      ?auto_9501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9500 ?auto_9502 ) ( SURFACE-AT ?auto_9498 ?auto_9502 ) ( CLEAR ?auto_9498 ) ( IS-CRATE ?auto_9499 ) ( not ( = ?auto_9498 ?auto_9499 ) ) ( TRUCK-AT ?auto_9501 ?auto_9502 ) ( AVAILABLE ?auto_9500 ) ( IN ?auto_9499 ?auto_9501 ) ( ON ?auto_9498 ?auto_9497 ) ( not ( = ?auto_9497 ?auto_9498 ) ) ( not ( = ?auto_9497 ?auto_9499 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9498 ?auto_9499 )
      ( MAKE-2CRATE-VERIFY ?auto_9497 ?auto_9498 ?auto_9499 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9503 - SURFACE
      ?auto_9504 - SURFACE
      ?auto_9505 - SURFACE
      ?auto_9506 - SURFACE
    )
    :vars
    (
      ?auto_9507 - HOIST
      ?auto_9508 - PLACE
      ?auto_9509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9507 ?auto_9508 ) ( SURFACE-AT ?auto_9505 ?auto_9508 ) ( CLEAR ?auto_9505 ) ( IS-CRATE ?auto_9506 ) ( not ( = ?auto_9505 ?auto_9506 ) ) ( TRUCK-AT ?auto_9509 ?auto_9508 ) ( AVAILABLE ?auto_9507 ) ( IN ?auto_9506 ?auto_9509 ) ( ON ?auto_9505 ?auto_9504 ) ( not ( = ?auto_9504 ?auto_9505 ) ) ( not ( = ?auto_9504 ?auto_9506 ) ) ( ON ?auto_9504 ?auto_9503 ) ( not ( = ?auto_9503 ?auto_9504 ) ) ( not ( = ?auto_9503 ?auto_9505 ) ) ( not ( = ?auto_9503 ?auto_9506 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9504 ?auto_9505 ?auto_9506 )
      ( MAKE-3CRATE-VERIFY ?auto_9503 ?auto_9504 ?auto_9505 ?auto_9506 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9510 - SURFACE
      ?auto_9511 - SURFACE
    )
    :vars
    (
      ?auto_9513 - HOIST
      ?auto_9514 - PLACE
      ?auto_9515 - TRUCK
      ?auto_9512 - SURFACE
      ?auto_9516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9513 ?auto_9514 ) ( SURFACE-AT ?auto_9510 ?auto_9514 ) ( CLEAR ?auto_9510 ) ( IS-CRATE ?auto_9511 ) ( not ( = ?auto_9510 ?auto_9511 ) ) ( AVAILABLE ?auto_9513 ) ( IN ?auto_9511 ?auto_9515 ) ( ON ?auto_9510 ?auto_9512 ) ( not ( = ?auto_9512 ?auto_9510 ) ) ( not ( = ?auto_9512 ?auto_9511 ) ) ( TRUCK-AT ?auto_9515 ?auto_9516 ) ( not ( = ?auto_9516 ?auto_9514 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9515 ?auto_9516 ?auto_9514 )
      ( MAKE-2CRATE ?auto_9512 ?auto_9510 ?auto_9511 )
      ( MAKE-1CRATE-VERIFY ?auto_9510 ?auto_9511 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9517 - SURFACE
      ?auto_9518 - SURFACE
      ?auto_9519 - SURFACE
    )
    :vars
    (
      ?auto_9520 - HOIST
      ?auto_9523 - PLACE
      ?auto_9521 - TRUCK
      ?auto_9522 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9520 ?auto_9523 ) ( SURFACE-AT ?auto_9518 ?auto_9523 ) ( CLEAR ?auto_9518 ) ( IS-CRATE ?auto_9519 ) ( not ( = ?auto_9518 ?auto_9519 ) ) ( AVAILABLE ?auto_9520 ) ( IN ?auto_9519 ?auto_9521 ) ( ON ?auto_9518 ?auto_9517 ) ( not ( = ?auto_9517 ?auto_9518 ) ) ( not ( = ?auto_9517 ?auto_9519 ) ) ( TRUCK-AT ?auto_9521 ?auto_9522 ) ( not ( = ?auto_9522 ?auto_9523 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9518 ?auto_9519 )
      ( MAKE-2CRATE-VERIFY ?auto_9517 ?auto_9518 ?auto_9519 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9524 - SURFACE
      ?auto_9525 - SURFACE
      ?auto_9526 - SURFACE
      ?auto_9527 - SURFACE
    )
    :vars
    (
      ?auto_9528 - HOIST
      ?auto_9530 - PLACE
      ?auto_9529 - TRUCK
      ?auto_9531 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9528 ?auto_9530 ) ( SURFACE-AT ?auto_9526 ?auto_9530 ) ( CLEAR ?auto_9526 ) ( IS-CRATE ?auto_9527 ) ( not ( = ?auto_9526 ?auto_9527 ) ) ( AVAILABLE ?auto_9528 ) ( IN ?auto_9527 ?auto_9529 ) ( ON ?auto_9526 ?auto_9525 ) ( not ( = ?auto_9525 ?auto_9526 ) ) ( not ( = ?auto_9525 ?auto_9527 ) ) ( TRUCK-AT ?auto_9529 ?auto_9531 ) ( not ( = ?auto_9531 ?auto_9530 ) ) ( ON ?auto_9525 ?auto_9524 ) ( not ( = ?auto_9524 ?auto_9525 ) ) ( not ( = ?auto_9524 ?auto_9526 ) ) ( not ( = ?auto_9524 ?auto_9527 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9525 ?auto_9526 ?auto_9527 )
      ( MAKE-3CRATE-VERIFY ?auto_9524 ?auto_9525 ?auto_9526 ?auto_9527 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9532 - SURFACE
      ?auto_9533 - SURFACE
    )
    :vars
    (
      ?auto_9535 - HOIST
      ?auto_9537 - PLACE
      ?auto_9534 - SURFACE
      ?auto_9536 - TRUCK
      ?auto_9538 - PLACE
      ?auto_9539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9535 ?auto_9537 ) ( SURFACE-AT ?auto_9532 ?auto_9537 ) ( CLEAR ?auto_9532 ) ( IS-CRATE ?auto_9533 ) ( not ( = ?auto_9532 ?auto_9533 ) ) ( AVAILABLE ?auto_9535 ) ( ON ?auto_9532 ?auto_9534 ) ( not ( = ?auto_9534 ?auto_9532 ) ) ( not ( = ?auto_9534 ?auto_9533 ) ) ( TRUCK-AT ?auto_9536 ?auto_9538 ) ( not ( = ?auto_9538 ?auto_9537 ) ) ( HOIST-AT ?auto_9539 ?auto_9538 ) ( LIFTING ?auto_9539 ?auto_9533 ) ( not ( = ?auto_9535 ?auto_9539 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9539 ?auto_9533 ?auto_9536 ?auto_9538 )
      ( MAKE-2CRATE ?auto_9534 ?auto_9532 ?auto_9533 )
      ( MAKE-1CRATE-VERIFY ?auto_9532 ?auto_9533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9540 - SURFACE
      ?auto_9541 - SURFACE
      ?auto_9542 - SURFACE
    )
    :vars
    (
      ?auto_9544 - HOIST
      ?auto_9546 - PLACE
      ?auto_9543 - TRUCK
      ?auto_9547 - PLACE
      ?auto_9545 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9544 ?auto_9546 ) ( SURFACE-AT ?auto_9541 ?auto_9546 ) ( CLEAR ?auto_9541 ) ( IS-CRATE ?auto_9542 ) ( not ( = ?auto_9541 ?auto_9542 ) ) ( AVAILABLE ?auto_9544 ) ( ON ?auto_9541 ?auto_9540 ) ( not ( = ?auto_9540 ?auto_9541 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( TRUCK-AT ?auto_9543 ?auto_9547 ) ( not ( = ?auto_9547 ?auto_9546 ) ) ( HOIST-AT ?auto_9545 ?auto_9547 ) ( LIFTING ?auto_9545 ?auto_9542 ) ( not ( = ?auto_9544 ?auto_9545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9541 ?auto_9542 )
      ( MAKE-2CRATE-VERIFY ?auto_9540 ?auto_9541 ?auto_9542 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9548 - SURFACE
      ?auto_9549 - SURFACE
      ?auto_9550 - SURFACE
      ?auto_9551 - SURFACE
    )
    :vars
    (
      ?auto_9553 - HOIST
      ?auto_9555 - PLACE
      ?auto_9554 - TRUCK
      ?auto_9556 - PLACE
      ?auto_9552 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9553 ?auto_9555 ) ( SURFACE-AT ?auto_9550 ?auto_9555 ) ( CLEAR ?auto_9550 ) ( IS-CRATE ?auto_9551 ) ( not ( = ?auto_9550 ?auto_9551 ) ) ( AVAILABLE ?auto_9553 ) ( ON ?auto_9550 ?auto_9549 ) ( not ( = ?auto_9549 ?auto_9550 ) ) ( not ( = ?auto_9549 ?auto_9551 ) ) ( TRUCK-AT ?auto_9554 ?auto_9556 ) ( not ( = ?auto_9556 ?auto_9555 ) ) ( HOIST-AT ?auto_9552 ?auto_9556 ) ( LIFTING ?auto_9552 ?auto_9551 ) ( not ( = ?auto_9553 ?auto_9552 ) ) ( ON ?auto_9549 ?auto_9548 ) ( not ( = ?auto_9548 ?auto_9549 ) ) ( not ( = ?auto_9548 ?auto_9550 ) ) ( not ( = ?auto_9548 ?auto_9551 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9549 ?auto_9550 ?auto_9551 )
      ( MAKE-3CRATE-VERIFY ?auto_9548 ?auto_9549 ?auto_9550 ?auto_9551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9557 - SURFACE
      ?auto_9558 - SURFACE
    )
    :vars
    (
      ?auto_9561 - HOIST
      ?auto_9563 - PLACE
      ?auto_9560 - SURFACE
      ?auto_9562 - TRUCK
      ?auto_9564 - PLACE
      ?auto_9559 - HOIST
      ?auto_9565 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9561 ?auto_9563 ) ( SURFACE-AT ?auto_9557 ?auto_9563 ) ( CLEAR ?auto_9557 ) ( IS-CRATE ?auto_9558 ) ( not ( = ?auto_9557 ?auto_9558 ) ) ( AVAILABLE ?auto_9561 ) ( ON ?auto_9557 ?auto_9560 ) ( not ( = ?auto_9560 ?auto_9557 ) ) ( not ( = ?auto_9560 ?auto_9558 ) ) ( TRUCK-AT ?auto_9562 ?auto_9564 ) ( not ( = ?auto_9564 ?auto_9563 ) ) ( HOIST-AT ?auto_9559 ?auto_9564 ) ( not ( = ?auto_9561 ?auto_9559 ) ) ( AVAILABLE ?auto_9559 ) ( SURFACE-AT ?auto_9558 ?auto_9564 ) ( ON ?auto_9558 ?auto_9565 ) ( CLEAR ?auto_9558 ) ( not ( = ?auto_9557 ?auto_9565 ) ) ( not ( = ?auto_9558 ?auto_9565 ) ) ( not ( = ?auto_9560 ?auto_9565 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9559 ?auto_9558 ?auto_9565 ?auto_9564 )
      ( MAKE-2CRATE ?auto_9560 ?auto_9557 ?auto_9558 )
      ( MAKE-1CRATE-VERIFY ?auto_9557 ?auto_9558 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9566 - SURFACE
      ?auto_9567 - SURFACE
      ?auto_9568 - SURFACE
    )
    :vars
    (
      ?auto_9571 - HOIST
      ?auto_9570 - PLACE
      ?auto_9569 - TRUCK
      ?auto_9574 - PLACE
      ?auto_9573 - HOIST
      ?auto_9572 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9571 ?auto_9570 ) ( SURFACE-AT ?auto_9567 ?auto_9570 ) ( CLEAR ?auto_9567 ) ( IS-CRATE ?auto_9568 ) ( not ( = ?auto_9567 ?auto_9568 ) ) ( AVAILABLE ?auto_9571 ) ( ON ?auto_9567 ?auto_9566 ) ( not ( = ?auto_9566 ?auto_9567 ) ) ( not ( = ?auto_9566 ?auto_9568 ) ) ( TRUCK-AT ?auto_9569 ?auto_9574 ) ( not ( = ?auto_9574 ?auto_9570 ) ) ( HOIST-AT ?auto_9573 ?auto_9574 ) ( not ( = ?auto_9571 ?auto_9573 ) ) ( AVAILABLE ?auto_9573 ) ( SURFACE-AT ?auto_9568 ?auto_9574 ) ( ON ?auto_9568 ?auto_9572 ) ( CLEAR ?auto_9568 ) ( not ( = ?auto_9567 ?auto_9572 ) ) ( not ( = ?auto_9568 ?auto_9572 ) ) ( not ( = ?auto_9566 ?auto_9572 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9567 ?auto_9568 )
      ( MAKE-2CRATE-VERIFY ?auto_9566 ?auto_9567 ?auto_9568 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9575 - SURFACE
      ?auto_9576 - SURFACE
      ?auto_9577 - SURFACE
      ?auto_9578 - SURFACE
    )
    :vars
    (
      ?auto_9584 - HOIST
      ?auto_9580 - PLACE
      ?auto_9582 - TRUCK
      ?auto_9583 - PLACE
      ?auto_9579 - HOIST
      ?auto_9581 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9584 ?auto_9580 ) ( SURFACE-AT ?auto_9577 ?auto_9580 ) ( CLEAR ?auto_9577 ) ( IS-CRATE ?auto_9578 ) ( not ( = ?auto_9577 ?auto_9578 ) ) ( AVAILABLE ?auto_9584 ) ( ON ?auto_9577 ?auto_9576 ) ( not ( = ?auto_9576 ?auto_9577 ) ) ( not ( = ?auto_9576 ?auto_9578 ) ) ( TRUCK-AT ?auto_9582 ?auto_9583 ) ( not ( = ?auto_9583 ?auto_9580 ) ) ( HOIST-AT ?auto_9579 ?auto_9583 ) ( not ( = ?auto_9584 ?auto_9579 ) ) ( AVAILABLE ?auto_9579 ) ( SURFACE-AT ?auto_9578 ?auto_9583 ) ( ON ?auto_9578 ?auto_9581 ) ( CLEAR ?auto_9578 ) ( not ( = ?auto_9577 ?auto_9581 ) ) ( not ( = ?auto_9578 ?auto_9581 ) ) ( not ( = ?auto_9576 ?auto_9581 ) ) ( ON ?auto_9576 ?auto_9575 ) ( not ( = ?auto_9575 ?auto_9576 ) ) ( not ( = ?auto_9575 ?auto_9577 ) ) ( not ( = ?auto_9575 ?auto_9578 ) ) ( not ( = ?auto_9575 ?auto_9581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9576 ?auto_9577 ?auto_9578 )
      ( MAKE-3CRATE-VERIFY ?auto_9575 ?auto_9576 ?auto_9577 ?auto_9578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9585 - SURFACE
      ?auto_9586 - SURFACE
    )
    :vars
    (
      ?auto_9593 - HOIST
      ?auto_9589 - PLACE
      ?auto_9587 - SURFACE
      ?auto_9592 - PLACE
      ?auto_9588 - HOIST
      ?auto_9590 - SURFACE
      ?auto_9591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9593 ?auto_9589 ) ( SURFACE-AT ?auto_9585 ?auto_9589 ) ( CLEAR ?auto_9585 ) ( IS-CRATE ?auto_9586 ) ( not ( = ?auto_9585 ?auto_9586 ) ) ( AVAILABLE ?auto_9593 ) ( ON ?auto_9585 ?auto_9587 ) ( not ( = ?auto_9587 ?auto_9585 ) ) ( not ( = ?auto_9587 ?auto_9586 ) ) ( not ( = ?auto_9592 ?auto_9589 ) ) ( HOIST-AT ?auto_9588 ?auto_9592 ) ( not ( = ?auto_9593 ?auto_9588 ) ) ( AVAILABLE ?auto_9588 ) ( SURFACE-AT ?auto_9586 ?auto_9592 ) ( ON ?auto_9586 ?auto_9590 ) ( CLEAR ?auto_9586 ) ( not ( = ?auto_9585 ?auto_9590 ) ) ( not ( = ?auto_9586 ?auto_9590 ) ) ( not ( = ?auto_9587 ?auto_9590 ) ) ( TRUCK-AT ?auto_9591 ?auto_9589 ) )
    :subtasks
    ( ( !DRIVE ?auto_9591 ?auto_9589 ?auto_9592 )
      ( MAKE-2CRATE ?auto_9587 ?auto_9585 ?auto_9586 )
      ( MAKE-1CRATE-VERIFY ?auto_9585 ?auto_9586 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9594 - SURFACE
      ?auto_9595 - SURFACE
      ?auto_9596 - SURFACE
    )
    :vars
    (
      ?auto_9600 - HOIST
      ?auto_9602 - PLACE
      ?auto_9598 - PLACE
      ?auto_9599 - HOIST
      ?auto_9597 - SURFACE
      ?auto_9601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9600 ?auto_9602 ) ( SURFACE-AT ?auto_9595 ?auto_9602 ) ( CLEAR ?auto_9595 ) ( IS-CRATE ?auto_9596 ) ( not ( = ?auto_9595 ?auto_9596 ) ) ( AVAILABLE ?auto_9600 ) ( ON ?auto_9595 ?auto_9594 ) ( not ( = ?auto_9594 ?auto_9595 ) ) ( not ( = ?auto_9594 ?auto_9596 ) ) ( not ( = ?auto_9598 ?auto_9602 ) ) ( HOIST-AT ?auto_9599 ?auto_9598 ) ( not ( = ?auto_9600 ?auto_9599 ) ) ( AVAILABLE ?auto_9599 ) ( SURFACE-AT ?auto_9596 ?auto_9598 ) ( ON ?auto_9596 ?auto_9597 ) ( CLEAR ?auto_9596 ) ( not ( = ?auto_9595 ?auto_9597 ) ) ( not ( = ?auto_9596 ?auto_9597 ) ) ( not ( = ?auto_9594 ?auto_9597 ) ) ( TRUCK-AT ?auto_9601 ?auto_9602 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9595 ?auto_9596 )
      ( MAKE-2CRATE-VERIFY ?auto_9594 ?auto_9595 ?auto_9596 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9603 - SURFACE
      ?auto_9604 - SURFACE
      ?auto_9605 - SURFACE
      ?auto_9606 - SURFACE
    )
    :vars
    (
      ?auto_9611 - HOIST
      ?auto_9612 - PLACE
      ?auto_9607 - PLACE
      ?auto_9610 - HOIST
      ?auto_9609 - SURFACE
      ?auto_9608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9611 ?auto_9612 ) ( SURFACE-AT ?auto_9605 ?auto_9612 ) ( CLEAR ?auto_9605 ) ( IS-CRATE ?auto_9606 ) ( not ( = ?auto_9605 ?auto_9606 ) ) ( AVAILABLE ?auto_9611 ) ( ON ?auto_9605 ?auto_9604 ) ( not ( = ?auto_9604 ?auto_9605 ) ) ( not ( = ?auto_9604 ?auto_9606 ) ) ( not ( = ?auto_9607 ?auto_9612 ) ) ( HOIST-AT ?auto_9610 ?auto_9607 ) ( not ( = ?auto_9611 ?auto_9610 ) ) ( AVAILABLE ?auto_9610 ) ( SURFACE-AT ?auto_9606 ?auto_9607 ) ( ON ?auto_9606 ?auto_9609 ) ( CLEAR ?auto_9606 ) ( not ( = ?auto_9605 ?auto_9609 ) ) ( not ( = ?auto_9606 ?auto_9609 ) ) ( not ( = ?auto_9604 ?auto_9609 ) ) ( TRUCK-AT ?auto_9608 ?auto_9612 ) ( ON ?auto_9604 ?auto_9603 ) ( not ( = ?auto_9603 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9605 ) ) ( not ( = ?auto_9603 ?auto_9606 ) ) ( not ( = ?auto_9603 ?auto_9609 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9604 ?auto_9605 ?auto_9606 )
      ( MAKE-3CRATE-VERIFY ?auto_9603 ?auto_9604 ?auto_9605 ?auto_9606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9613 - SURFACE
      ?auto_9614 - SURFACE
    )
    :vars
    (
      ?auto_9620 - HOIST
      ?auto_9621 - PLACE
      ?auto_9617 - SURFACE
      ?auto_9615 - PLACE
      ?auto_9619 - HOIST
      ?auto_9618 - SURFACE
      ?auto_9616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9620 ?auto_9621 ) ( IS-CRATE ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9614 ) ) ( not ( = ?auto_9617 ?auto_9613 ) ) ( not ( = ?auto_9617 ?auto_9614 ) ) ( not ( = ?auto_9615 ?auto_9621 ) ) ( HOIST-AT ?auto_9619 ?auto_9615 ) ( not ( = ?auto_9620 ?auto_9619 ) ) ( AVAILABLE ?auto_9619 ) ( SURFACE-AT ?auto_9614 ?auto_9615 ) ( ON ?auto_9614 ?auto_9618 ) ( CLEAR ?auto_9614 ) ( not ( = ?auto_9613 ?auto_9618 ) ) ( not ( = ?auto_9614 ?auto_9618 ) ) ( not ( = ?auto_9617 ?auto_9618 ) ) ( TRUCK-AT ?auto_9616 ?auto_9621 ) ( SURFACE-AT ?auto_9617 ?auto_9621 ) ( CLEAR ?auto_9617 ) ( LIFTING ?auto_9620 ?auto_9613 ) ( IS-CRATE ?auto_9613 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9617 ?auto_9613 )
      ( MAKE-2CRATE ?auto_9617 ?auto_9613 ?auto_9614 )
      ( MAKE-1CRATE-VERIFY ?auto_9613 ?auto_9614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9622 - SURFACE
      ?auto_9623 - SURFACE
      ?auto_9624 - SURFACE
    )
    :vars
    (
      ?auto_9628 - HOIST
      ?auto_9629 - PLACE
      ?auto_9630 - PLACE
      ?auto_9626 - HOIST
      ?auto_9625 - SURFACE
      ?auto_9627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9628 ?auto_9629 ) ( IS-CRATE ?auto_9624 ) ( not ( = ?auto_9623 ?auto_9624 ) ) ( not ( = ?auto_9622 ?auto_9623 ) ) ( not ( = ?auto_9622 ?auto_9624 ) ) ( not ( = ?auto_9630 ?auto_9629 ) ) ( HOIST-AT ?auto_9626 ?auto_9630 ) ( not ( = ?auto_9628 ?auto_9626 ) ) ( AVAILABLE ?auto_9626 ) ( SURFACE-AT ?auto_9624 ?auto_9630 ) ( ON ?auto_9624 ?auto_9625 ) ( CLEAR ?auto_9624 ) ( not ( = ?auto_9623 ?auto_9625 ) ) ( not ( = ?auto_9624 ?auto_9625 ) ) ( not ( = ?auto_9622 ?auto_9625 ) ) ( TRUCK-AT ?auto_9627 ?auto_9629 ) ( SURFACE-AT ?auto_9622 ?auto_9629 ) ( CLEAR ?auto_9622 ) ( LIFTING ?auto_9628 ?auto_9623 ) ( IS-CRATE ?auto_9623 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9623 ?auto_9624 )
      ( MAKE-2CRATE-VERIFY ?auto_9622 ?auto_9623 ?auto_9624 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9631 - SURFACE
      ?auto_9632 - SURFACE
      ?auto_9633 - SURFACE
      ?auto_9634 - SURFACE
    )
    :vars
    (
      ?auto_9635 - HOIST
      ?auto_9638 - PLACE
      ?auto_9636 - PLACE
      ?auto_9639 - HOIST
      ?auto_9637 - SURFACE
      ?auto_9640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9635 ?auto_9638 ) ( IS-CRATE ?auto_9634 ) ( not ( = ?auto_9633 ?auto_9634 ) ) ( not ( = ?auto_9632 ?auto_9633 ) ) ( not ( = ?auto_9632 ?auto_9634 ) ) ( not ( = ?auto_9636 ?auto_9638 ) ) ( HOIST-AT ?auto_9639 ?auto_9636 ) ( not ( = ?auto_9635 ?auto_9639 ) ) ( AVAILABLE ?auto_9639 ) ( SURFACE-AT ?auto_9634 ?auto_9636 ) ( ON ?auto_9634 ?auto_9637 ) ( CLEAR ?auto_9634 ) ( not ( = ?auto_9633 ?auto_9637 ) ) ( not ( = ?auto_9634 ?auto_9637 ) ) ( not ( = ?auto_9632 ?auto_9637 ) ) ( TRUCK-AT ?auto_9640 ?auto_9638 ) ( SURFACE-AT ?auto_9632 ?auto_9638 ) ( CLEAR ?auto_9632 ) ( LIFTING ?auto_9635 ?auto_9633 ) ( IS-CRATE ?auto_9633 ) ( ON ?auto_9632 ?auto_9631 ) ( not ( = ?auto_9631 ?auto_9632 ) ) ( not ( = ?auto_9631 ?auto_9633 ) ) ( not ( = ?auto_9631 ?auto_9634 ) ) ( not ( = ?auto_9631 ?auto_9637 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9632 ?auto_9633 ?auto_9634 )
      ( MAKE-3CRATE-VERIFY ?auto_9631 ?auto_9632 ?auto_9633 ?auto_9634 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9641 - SURFACE
      ?auto_9642 - SURFACE
    )
    :vars
    (
      ?auto_9643 - HOIST
      ?auto_9646 - PLACE
      ?auto_9648 - SURFACE
      ?auto_9644 - PLACE
      ?auto_9647 - HOIST
      ?auto_9645 - SURFACE
      ?auto_9649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9643 ?auto_9646 ) ( IS-CRATE ?auto_9642 ) ( not ( = ?auto_9641 ?auto_9642 ) ) ( not ( = ?auto_9648 ?auto_9641 ) ) ( not ( = ?auto_9648 ?auto_9642 ) ) ( not ( = ?auto_9644 ?auto_9646 ) ) ( HOIST-AT ?auto_9647 ?auto_9644 ) ( not ( = ?auto_9643 ?auto_9647 ) ) ( AVAILABLE ?auto_9647 ) ( SURFACE-AT ?auto_9642 ?auto_9644 ) ( ON ?auto_9642 ?auto_9645 ) ( CLEAR ?auto_9642 ) ( not ( = ?auto_9641 ?auto_9645 ) ) ( not ( = ?auto_9642 ?auto_9645 ) ) ( not ( = ?auto_9648 ?auto_9645 ) ) ( TRUCK-AT ?auto_9649 ?auto_9646 ) ( SURFACE-AT ?auto_9648 ?auto_9646 ) ( CLEAR ?auto_9648 ) ( IS-CRATE ?auto_9641 ) ( AVAILABLE ?auto_9643 ) ( IN ?auto_9641 ?auto_9649 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9643 ?auto_9641 ?auto_9649 ?auto_9646 )
      ( MAKE-2CRATE ?auto_9648 ?auto_9641 ?auto_9642 )
      ( MAKE-1CRATE-VERIFY ?auto_9641 ?auto_9642 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9650 - SURFACE
      ?auto_9651 - SURFACE
      ?auto_9652 - SURFACE
    )
    :vars
    (
      ?auto_9658 - HOIST
      ?auto_9654 - PLACE
      ?auto_9653 - PLACE
      ?auto_9656 - HOIST
      ?auto_9657 - SURFACE
      ?auto_9655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9658 ?auto_9654 ) ( IS-CRATE ?auto_9652 ) ( not ( = ?auto_9651 ?auto_9652 ) ) ( not ( = ?auto_9650 ?auto_9651 ) ) ( not ( = ?auto_9650 ?auto_9652 ) ) ( not ( = ?auto_9653 ?auto_9654 ) ) ( HOIST-AT ?auto_9656 ?auto_9653 ) ( not ( = ?auto_9658 ?auto_9656 ) ) ( AVAILABLE ?auto_9656 ) ( SURFACE-AT ?auto_9652 ?auto_9653 ) ( ON ?auto_9652 ?auto_9657 ) ( CLEAR ?auto_9652 ) ( not ( = ?auto_9651 ?auto_9657 ) ) ( not ( = ?auto_9652 ?auto_9657 ) ) ( not ( = ?auto_9650 ?auto_9657 ) ) ( TRUCK-AT ?auto_9655 ?auto_9654 ) ( SURFACE-AT ?auto_9650 ?auto_9654 ) ( CLEAR ?auto_9650 ) ( IS-CRATE ?auto_9651 ) ( AVAILABLE ?auto_9658 ) ( IN ?auto_9651 ?auto_9655 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9651 ?auto_9652 )
      ( MAKE-2CRATE-VERIFY ?auto_9650 ?auto_9651 ?auto_9652 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
      ?auto_9661 - SURFACE
      ?auto_9662 - SURFACE
    )
    :vars
    (
      ?auto_9666 - HOIST
      ?auto_9665 - PLACE
      ?auto_9664 - PLACE
      ?auto_9667 - HOIST
      ?auto_9663 - SURFACE
      ?auto_9668 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9666 ?auto_9665 ) ( IS-CRATE ?auto_9662 ) ( not ( = ?auto_9661 ?auto_9662 ) ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9660 ?auto_9662 ) ) ( not ( = ?auto_9664 ?auto_9665 ) ) ( HOIST-AT ?auto_9667 ?auto_9664 ) ( not ( = ?auto_9666 ?auto_9667 ) ) ( AVAILABLE ?auto_9667 ) ( SURFACE-AT ?auto_9662 ?auto_9664 ) ( ON ?auto_9662 ?auto_9663 ) ( CLEAR ?auto_9662 ) ( not ( = ?auto_9661 ?auto_9663 ) ) ( not ( = ?auto_9662 ?auto_9663 ) ) ( not ( = ?auto_9660 ?auto_9663 ) ) ( TRUCK-AT ?auto_9668 ?auto_9665 ) ( SURFACE-AT ?auto_9660 ?auto_9665 ) ( CLEAR ?auto_9660 ) ( IS-CRATE ?auto_9661 ) ( AVAILABLE ?auto_9666 ) ( IN ?auto_9661 ?auto_9668 ) ( ON ?auto_9660 ?auto_9659 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9659 ?auto_9662 ) ) ( not ( = ?auto_9659 ?auto_9663 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9660 ?auto_9661 ?auto_9662 )
      ( MAKE-3CRATE-VERIFY ?auto_9659 ?auto_9660 ?auto_9661 ?auto_9662 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9669 - SURFACE
      ?auto_9670 - SURFACE
    )
    :vars
    (
      ?auto_9674 - HOIST
      ?auto_9673 - PLACE
      ?auto_9676 - SURFACE
      ?auto_9672 - PLACE
      ?auto_9675 - HOIST
      ?auto_9671 - SURFACE
      ?auto_9677 - TRUCK
      ?auto_9678 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9674 ?auto_9673 ) ( IS-CRATE ?auto_9670 ) ( not ( = ?auto_9669 ?auto_9670 ) ) ( not ( = ?auto_9676 ?auto_9669 ) ) ( not ( = ?auto_9676 ?auto_9670 ) ) ( not ( = ?auto_9672 ?auto_9673 ) ) ( HOIST-AT ?auto_9675 ?auto_9672 ) ( not ( = ?auto_9674 ?auto_9675 ) ) ( AVAILABLE ?auto_9675 ) ( SURFACE-AT ?auto_9670 ?auto_9672 ) ( ON ?auto_9670 ?auto_9671 ) ( CLEAR ?auto_9670 ) ( not ( = ?auto_9669 ?auto_9671 ) ) ( not ( = ?auto_9670 ?auto_9671 ) ) ( not ( = ?auto_9676 ?auto_9671 ) ) ( SURFACE-AT ?auto_9676 ?auto_9673 ) ( CLEAR ?auto_9676 ) ( IS-CRATE ?auto_9669 ) ( AVAILABLE ?auto_9674 ) ( IN ?auto_9669 ?auto_9677 ) ( TRUCK-AT ?auto_9677 ?auto_9678 ) ( not ( = ?auto_9678 ?auto_9673 ) ) ( not ( = ?auto_9672 ?auto_9678 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9677 ?auto_9678 ?auto_9673 )
      ( MAKE-2CRATE ?auto_9676 ?auto_9669 ?auto_9670 )
      ( MAKE-1CRATE-VERIFY ?auto_9669 ?auto_9670 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9679 - SURFACE
      ?auto_9680 - SURFACE
      ?auto_9681 - SURFACE
    )
    :vars
    (
      ?auto_9686 - HOIST
      ?auto_9687 - PLACE
      ?auto_9688 - PLACE
      ?auto_9682 - HOIST
      ?auto_9684 - SURFACE
      ?auto_9683 - TRUCK
      ?auto_9685 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9686 ?auto_9687 ) ( IS-CRATE ?auto_9681 ) ( not ( = ?auto_9680 ?auto_9681 ) ) ( not ( = ?auto_9679 ?auto_9680 ) ) ( not ( = ?auto_9679 ?auto_9681 ) ) ( not ( = ?auto_9688 ?auto_9687 ) ) ( HOIST-AT ?auto_9682 ?auto_9688 ) ( not ( = ?auto_9686 ?auto_9682 ) ) ( AVAILABLE ?auto_9682 ) ( SURFACE-AT ?auto_9681 ?auto_9688 ) ( ON ?auto_9681 ?auto_9684 ) ( CLEAR ?auto_9681 ) ( not ( = ?auto_9680 ?auto_9684 ) ) ( not ( = ?auto_9681 ?auto_9684 ) ) ( not ( = ?auto_9679 ?auto_9684 ) ) ( SURFACE-AT ?auto_9679 ?auto_9687 ) ( CLEAR ?auto_9679 ) ( IS-CRATE ?auto_9680 ) ( AVAILABLE ?auto_9686 ) ( IN ?auto_9680 ?auto_9683 ) ( TRUCK-AT ?auto_9683 ?auto_9685 ) ( not ( = ?auto_9685 ?auto_9687 ) ) ( not ( = ?auto_9688 ?auto_9685 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9680 ?auto_9681 )
      ( MAKE-2CRATE-VERIFY ?auto_9679 ?auto_9680 ?auto_9681 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9689 - SURFACE
      ?auto_9690 - SURFACE
      ?auto_9691 - SURFACE
      ?auto_9692 - SURFACE
    )
    :vars
    (
      ?auto_9699 - HOIST
      ?auto_9697 - PLACE
      ?auto_9694 - PLACE
      ?auto_9695 - HOIST
      ?auto_9696 - SURFACE
      ?auto_9698 - TRUCK
      ?auto_9693 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9699 ?auto_9697 ) ( IS-CRATE ?auto_9692 ) ( not ( = ?auto_9691 ?auto_9692 ) ) ( not ( = ?auto_9690 ?auto_9691 ) ) ( not ( = ?auto_9690 ?auto_9692 ) ) ( not ( = ?auto_9694 ?auto_9697 ) ) ( HOIST-AT ?auto_9695 ?auto_9694 ) ( not ( = ?auto_9699 ?auto_9695 ) ) ( AVAILABLE ?auto_9695 ) ( SURFACE-AT ?auto_9692 ?auto_9694 ) ( ON ?auto_9692 ?auto_9696 ) ( CLEAR ?auto_9692 ) ( not ( = ?auto_9691 ?auto_9696 ) ) ( not ( = ?auto_9692 ?auto_9696 ) ) ( not ( = ?auto_9690 ?auto_9696 ) ) ( SURFACE-AT ?auto_9690 ?auto_9697 ) ( CLEAR ?auto_9690 ) ( IS-CRATE ?auto_9691 ) ( AVAILABLE ?auto_9699 ) ( IN ?auto_9691 ?auto_9698 ) ( TRUCK-AT ?auto_9698 ?auto_9693 ) ( not ( = ?auto_9693 ?auto_9697 ) ) ( not ( = ?auto_9694 ?auto_9693 ) ) ( ON ?auto_9690 ?auto_9689 ) ( not ( = ?auto_9689 ?auto_9690 ) ) ( not ( = ?auto_9689 ?auto_9691 ) ) ( not ( = ?auto_9689 ?auto_9692 ) ) ( not ( = ?auto_9689 ?auto_9696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9690 ?auto_9691 ?auto_9692 )
      ( MAKE-3CRATE-VERIFY ?auto_9689 ?auto_9690 ?auto_9691 ?auto_9692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9700 - SURFACE
      ?auto_9701 - SURFACE
    )
    :vars
    (
      ?auto_9709 - HOIST
      ?auto_9706 - PLACE
      ?auto_9708 - SURFACE
      ?auto_9703 - PLACE
      ?auto_9704 - HOIST
      ?auto_9705 - SURFACE
      ?auto_9707 - TRUCK
      ?auto_9702 - PLACE
      ?auto_9710 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9709 ?auto_9706 ) ( IS-CRATE ?auto_9701 ) ( not ( = ?auto_9700 ?auto_9701 ) ) ( not ( = ?auto_9708 ?auto_9700 ) ) ( not ( = ?auto_9708 ?auto_9701 ) ) ( not ( = ?auto_9703 ?auto_9706 ) ) ( HOIST-AT ?auto_9704 ?auto_9703 ) ( not ( = ?auto_9709 ?auto_9704 ) ) ( AVAILABLE ?auto_9704 ) ( SURFACE-AT ?auto_9701 ?auto_9703 ) ( ON ?auto_9701 ?auto_9705 ) ( CLEAR ?auto_9701 ) ( not ( = ?auto_9700 ?auto_9705 ) ) ( not ( = ?auto_9701 ?auto_9705 ) ) ( not ( = ?auto_9708 ?auto_9705 ) ) ( SURFACE-AT ?auto_9708 ?auto_9706 ) ( CLEAR ?auto_9708 ) ( IS-CRATE ?auto_9700 ) ( AVAILABLE ?auto_9709 ) ( TRUCK-AT ?auto_9707 ?auto_9702 ) ( not ( = ?auto_9702 ?auto_9706 ) ) ( not ( = ?auto_9703 ?auto_9702 ) ) ( HOIST-AT ?auto_9710 ?auto_9702 ) ( LIFTING ?auto_9710 ?auto_9700 ) ( not ( = ?auto_9709 ?auto_9710 ) ) ( not ( = ?auto_9704 ?auto_9710 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9710 ?auto_9700 ?auto_9707 ?auto_9702 )
      ( MAKE-2CRATE ?auto_9708 ?auto_9700 ?auto_9701 )
      ( MAKE-1CRATE-VERIFY ?auto_9700 ?auto_9701 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9711 - SURFACE
      ?auto_9712 - SURFACE
      ?auto_9713 - SURFACE
    )
    :vars
    (
      ?auto_9715 - HOIST
      ?auto_9718 - PLACE
      ?auto_9719 - PLACE
      ?auto_9721 - HOIST
      ?auto_9714 - SURFACE
      ?auto_9717 - TRUCK
      ?auto_9716 - PLACE
      ?auto_9720 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9715 ?auto_9718 ) ( IS-CRATE ?auto_9713 ) ( not ( = ?auto_9712 ?auto_9713 ) ) ( not ( = ?auto_9711 ?auto_9712 ) ) ( not ( = ?auto_9711 ?auto_9713 ) ) ( not ( = ?auto_9719 ?auto_9718 ) ) ( HOIST-AT ?auto_9721 ?auto_9719 ) ( not ( = ?auto_9715 ?auto_9721 ) ) ( AVAILABLE ?auto_9721 ) ( SURFACE-AT ?auto_9713 ?auto_9719 ) ( ON ?auto_9713 ?auto_9714 ) ( CLEAR ?auto_9713 ) ( not ( = ?auto_9712 ?auto_9714 ) ) ( not ( = ?auto_9713 ?auto_9714 ) ) ( not ( = ?auto_9711 ?auto_9714 ) ) ( SURFACE-AT ?auto_9711 ?auto_9718 ) ( CLEAR ?auto_9711 ) ( IS-CRATE ?auto_9712 ) ( AVAILABLE ?auto_9715 ) ( TRUCK-AT ?auto_9717 ?auto_9716 ) ( not ( = ?auto_9716 ?auto_9718 ) ) ( not ( = ?auto_9719 ?auto_9716 ) ) ( HOIST-AT ?auto_9720 ?auto_9716 ) ( LIFTING ?auto_9720 ?auto_9712 ) ( not ( = ?auto_9715 ?auto_9720 ) ) ( not ( = ?auto_9721 ?auto_9720 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9712 ?auto_9713 )
      ( MAKE-2CRATE-VERIFY ?auto_9711 ?auto_9712 ?auto_9713 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9722 - SURFACE
      ?auto_9723 - SURFACE
      ?auto_9724 - SURFACE
      ?auto_9725 - SURFACE
    )
    :vars
    (
      ?auto_9728 - HOIST
      ?auto_9730 - PLACE
      ?auto_9733 - PLACE
      ?auto_9732 - HOIST
      ?auto_9727 - SURFACE
      ?auto_9726 - TRUCK
      ?auto_9731 - PLACE
      ?auto_9729 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9728 ?auto_9730 ) ( IS-CRATE ?auto_9725 ) ( not ( = ?auto_9724 ?auto_9725 ) ) ( not ( = ?auto_9723 ?auto_9724 ) ) ( not ( = ?auto_9723 ?auto_9725 ) ) ( not ( = ?auto_9733 ?auto_9730 ) ) ( HOIST-AT ?auto_9732 ?auto_9733 ) ( not ( = ?auto_9728 ?auto_9732 ) ) ( AVAILABLE ?auto_9732 ) ( SURFACE-AT ?auto_9725 ?auto_9733 ) ( ON ?auto_9725 ?auto_9727 ) ( CLEAR ?auto_9725 ) ( not ( = ?auto_9724 ?auto_9727 ) ) ( not ( = ?auto_9725 ?auto_9727 ) ) ( not ( = ?auto_9723 ?auto_9727 ) ) ( SURFACE-AT ?auto_9723 ?auto_9730 ) ( CLEAR ?auto_9723 ) ( IS-CRATE ?auto_9724 ) ( AVAILABLE ?auto_9728 ) ( TRUCK-AT ?auto_9726 ?auto_9731 ) ( not ( = ?auto_9731 ?auto_9730 ) ) ( not ( = ?auto_9733 ?auto_9731 ) ) ( HOIST-AT ?auto_9729 ?auto_9731 ) ( LIFTING ?auto_9729 ?auto_9724 ) ( not ( = ?auto_9728 ?auto_9729 ) ) ( not ( = ?auto_9732 ?auto_9729 ) ) ( ON ?auto_9723 ?auto_9722 ) ( not ( = ?auto_9722 ?auto_9723 ) ) ( not ( = ?auto_9722 ?auto_9724 ) ) ( not ( = ?auto_9722 ?auto_9725 ) ) ( not ( = ?auto_9722 ?auto_9727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9723 ?auto_9724 ?auto_9725 )
      ( MAKE-3CRATE-VERIFY ?auto_9722 ?auto_9723 ?auto_9724 ?auto_9725 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9734 - SURFACE
      ?auto_9735 - SURFACE
    )
    :vars
    (
      ?auto_9738 - HOIST
      ?auto_9740 - PLACE
      ?auto_9744 - SURFACE
      ?auto_9743 - PLACE
      ?auto_9742 - HOIST
      ?auto_9737 - SURFACE
      ?auto_9736 - TRUCK
      ?auto_9741 - PLACE
      ?auto_9739 - HOIST
      ?auto_9745 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9738 ?auto_9740 ) ( IS-CRATE ?auto_9735 ) ( not ( = ?auto_9734 ?auto_9735 ) ) ( not ( = ?auto_9744 ?auto_9734 ) ) ( not ( = ?auto_9744 ?auto_9735 ) ) ( not ( = ?auto_9743 ?auto_9740 ) ) ( HOIST-AT ?auto_9742 ?auto_9743 ) ( not ( = ?auto_9738 ?auto_9742 ) ) ( AVAILABLE ?auto_9742 ) ( SURFACE-AT ?auto_9735 ?auto_9743 ) ( ON ?auto_9735 ?auto_9737 ) ( CLEAR ?auto_9735 ) ( not ( = ?auto_9734 ?auto_9737 ) ) ( not ( = ?auto_9735 ?auto_9737 ) ) ( not ( = ?auto_9744 ?auto_9737 ) ) ( SURFACE-AT ?auto_9744 ?auto_9740 ) ( CLEAR ?auto_9744 ) ( IS-CRATE ?auto_9734 ) ( AVAILABLE ?auto_9738 ) ( TRUCK-AT ?auto_9736 ?auto_9741 ) ( not ( = ?auto_9741 ?auto_9740 ) ) ( not ( = ?auto_9743 ?auto_9741 ) ) ( HOIST-AT ?auto_9739 ?auto_9741 ) ( not ( = ?auto_9738 ?auto_9739 ) ) ( not ( = ?auto_9742 ?auto_9739 ) ) ( AVAILABLE ?auto_9739 ) ( SURFACE-AT ?auto_9734 ?auto_9741 ) ( ON ?auto_9734 ?auto_9745 ) ( CLEAR ?auto_9734 ) ( not ( = ?auto_9734 ?auto_9745 ) ) ( not ( = ?auto_9735 ?auto_9745 ) ) ( not ( = ?auto_9744 ?auto_9745 ) ) ( not ( = ?auto_9737 ?auto_9745 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9739 ?auto_9734 ?auto_9745 ?auto_9741 )
      ( MAKE-2CRATE ?auto_9744 ?auto_9734 ?auto_9735 )
      ( MAKE-1CRATE-VERIFY ?auto_9734 ?auto_9735 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9746 - SURFACE
      ?auto_9747 - SURFACE
      ?auto_9748 - SURFACE
    )
    :vars
    (
      ?auto_9749 - HOIST
      ?auto_9754 - PLACE
      ?auto_9757 - PLACE
      ?auto_9756 - HOIST
      ?auto_9753 - SURFACE
      ?auto_9750 - TRUCK
      ?auto_9752 - PLACE
      ?auto_9755 - HOIST
      ?auto_9751 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9749 ?auto_9754 ) ( IS-CRATE ?auto_9748 ) ( not ( = ?auto_9747 ?auto_9748 ) ) ( not ( = ?auto_9746 ?auto_9747 ) ) ( not ( = ?auto_9746 ?auto_9748 ) ) ( not ( = ?auto_9757 ?auto_9754 ) ) ( HOIST-AT ?auto_9756 ?auto_9757 ) ( not ( = ?auto_9749 ?auto_9756 ) ) ( AVAILABLE ?auto_9756 ) ( SURFACE-AT ?auto_9748 ?auto_9757 ) ( ON ?auto_9748 ?auto_9753 ) ( CLEAR ?auto_9748 ) ( not ( = ?auto_9747 ?auto_9753 ) ) ( not ( = ?auto_9748 ?auto_9753 ) ) ( not ( = ?auto_9746 ?auto_9753 ) ) ( SURFACE-AT ?auto_9746 ?auto_9754 ) ( CLEAR ?auto_9746 ) ( IS-CRATE ?auto_9747 ) ( AVAILABLE ?auto_9749 ) ( TRUCK-AT ?auto_9750 ?auto_9752 ) ( not ( = ?auto_9752 ?auto_9754 ) ) ( not ( = ?auto_9757 ?auto_9752 ) ) ( HOIST-AT ?auto_9755 ?auto_9752 ) ( not ( = ?auto_9749 ?auto_9755 ) ) ( not ( = ?auto_9756 ?auto_9755 ) ) ( AVAILABLE ?auto_9755 ) ( SURFACE-AT ?auto_9747 ?auto_9752 ) ( ON ?auto_9747 ?auto_9751 ) ( CLEAR ?auto_9747 ) ( not ( = ?auto_9747 ?auto_9751 ) ) ( not ( = ?auto_9748 ?auto_9751 ) ) ( not ( = ?auto_9746 ?auto_9751 ) ) ( not ( = ?auto_9753 ?auto_9751 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9747 ?auto_9748 )
      ( MAKE-2CRATE-VERIFY ?auto_9746 ?auto_9747 ?auto_9748 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9758 - SURFACE
      ?auto_9759 - SURFACE
      ?auto_9760 - SURFACE
      ?auto_9761 - SURFACE
    )
    :vars
    (
      ?auto_9768 - HOIST
      ?auto_9762 - PLACE
      ?auto_9764 - PLACE
      ?auto_9763 - HOIST
      ?auto_9767 - SURFACE
      ?auto_9765 - TRUCK
      ?auto_9766 - PLACE
      ?auto_9770 - HOIST
      ?auto_9769 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9768 ?auto_9762 ) ( IS-CRATE ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9761 ) ) ( not ( = ?auto_9759 ?auto_9760 ) ) ( not ( = ?auto_9759 ?auto_9761 ) ) ( not ( = ?auto_9764 ?auto_9762 ) ) ( HOIST-AT ?auto_9763 ?auto_9764 ) ( not ( = ?auto_9768 ?auto_9763 ) ) ( AVAILABLE ?auto_9763 ) ( SURFACE-AT ?auto_9761 ?auto_9764 ) ( ON ?auto_9761 ?auto_9767 ) ( CLEAR ?auto_9761 ) ( not ( = ?auto_9760 ?auto_9767 ) ) ( not ( = ?auto_9761 ?auto_9767 ) ) ( not ( = ?auto_9759 ?auto_9767 ) ) ( SURFACE-AT ?auto_9759 ?auto_9762 ) ( CLEAR ?auto_9759 ) ( IS-CRATE ?auto_9760 ) ( AVAILABLE ?auto_9768 ) ( TRUCK-AT ?auto_9765 ?auto_9766 ) ( not ( = ?auto_9766 ?auto_9762 ) ) ( not ( = ?auto_9764 ?auto_9766 ) ) ( HOIST-AT ?auto_9770 ?auto_9766 ) ( not ( = ?auto_9768 ?auto_9770 ) ) ( not ( = ?auto_9763 ?auto_9770 ) ) ( AVAILABLE ?auto_9770 ) ( SURFACE-AT ?auto_9760 ?auto_9766 ) ( ON ?auto_9760 ?auto_9769 ) ( CLEAR ?auto_9760 ) ( not ( = ?auto_9760 ?auto_9769 ) ) ( not ( = ?auto_9761 ?auto_9769 ) ) ( not ( = ?auto_9759 ?auto_9769 ) ) ( not ( = ?auto_9767 ?auto_9769 ) ) ( ON ?auto_9759 ?auto_9758 ) ( not ( = ?auto_9758 ?auto_9759 ) ) ( not ( = ?auto_9758 ?auto_9760 ) ) ( not ( = ?auto_9758 ?auto_9761 ) ) ( not ( = ?auto_9758 ?auto_9767 ) ) ( not ( = ?auto_9758 ?auto_9769 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9759 ?auto_9760 ?auto_9761 )
      ( MAKE-3CRATE-VERIFY ?auto_9758 ?auto_9759 ?auto_9760 ?auto_9761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9771 - SURFACE
      ?auto_9772 - SURFACE
    )
    :vars
    (
      ?auto_9780 - HOIST
      ?auto_9774 - PLACE
      ?auto_9773 - SURFACE
      ?auto_9776 - PLACE
      ?auto_9775 - HOIST
      ?auto_9779 - SURFACE
      ?auto_9778 - PLACE
      ?auto_9782 - HOIST
      ?auto_9781 - SURFACE
      ?auto_9777 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9780 ?auto_9774 ) ( IS-CRATE ?auto_9772 ) ( not ( = ?auto_9771 ?auto_9772 ) ) ( not ( = ?auto_9773 ?auto_9771 ) ) ( not ( = ?auto_9773 ?auto_9772 ) ) ( not ( = ?auto_9776 ?auto_9774 ) ) ( HOIST-AT ?auto_9775 ?auto_9776 ) ( not ( = ?auto_9780 ?auto_9775 ) ) ( AVAILABLE ?auto_9775 ) ( SURFACE-AT ?auto_9772 ?auto_9776 ) ( ON ?auto_9772 ?auto_9779 ) ( CLEAR ?auto_9772 ) ( not ( = ?auto_9771 ?auto_9779 ) ) ( not ( = ?auto_9772 ?auto_9779 ) ) ( not ( = ?auto_9773 ?auto_9779 ) ) ( SURFACE-AT ?auto_9773 ?auto_9774 ) ( CLEAR ?auto_9773 ) ( IS-CRATE ?auto_9771 ) ( AVAILABLE ?auto_9780 ) ( not ( = ?auto_9778 ?auto_9774 ) ) ( not ( = ?auto_9776 ?auto_9778 ) ) ( HOIST-AT ?auto_9782 ?auto_9778 ) ( not ( = ?auto_9780 ?auto_9782 ) ) ( not ( = ?auto_9775 ?auto_9782 ) ) ( AVAILABLE ?auto_9782 ) ( SURFACE-AT ?auto_9771 ?auto_9778 ) ( ON ?auto_9771 ?auto_9781 ) ( CLEAR ?auto_9771 ) ( not ( = ?auto_9771 ?auto_9781 ) ) ( not ( = ?auto_9772 ?auto_9781 ) ) ( not ( = ?auto_9773 ?auto_9781 ) ) ( not ( = ?auto_9779 ?auto_9781 ) ) ( TRUCK-AT ?auto_9777 ?auto_9774 ) )
    :subtasks
    ( ( !DRIVE ?auto_9777 ?auto_9774 ?auto_9778 )
      ( MAKE-2CRATE ?auto_9773 ?auto_9771 ?auto_9772 )
      ( MAKE-1CRATE-VERIFY ?auto_9771 ?auto_9772 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9783 - SURFACE
      ?auto_9784 - SURFACE
      ?auto_9785 - SURFACE
    )
    :vars
    (
      ?auto_9791 - HOIST
      ?auto_9787 - PLACE
      ?auto_9788 - PLACE
      ?auto_9790 - HOIST
      ?auto_9786 - SURFACE
      ?auto_9792 - PLACE
      ?auto_9794 - HOIST
      ?auto_9789 - SURFACE
      ?auto_9793 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9791 ?auto_9787 ) ( IS-CRATE ?auto_9785 ) ( not ( = ?auto_9784 ?auto_9785 ) ) ( not ( = ?auto_9783 ?auto_9784 ) ) ( not ( = ?auto_9783 ?auto_9785 ) ) ( not ( = ?auto_9788 ?auto_9787 ) ) ( HOIST-AT ?auto_9790 ?auto_9788 ) ( not ( = ?auto_9791 ?auto_9790 ) ) ( AVAILABLE ?auto_9790 ) ( SURFACE-AT ?auto_9785 ?auto_9788 ) ( ON ?auto_9785 ?auto_9786 ) ( CLEAR ?auto_9785 ) ( not ( = ?auto_9784 ?auto_9786 ) ) ( not ( = ?auto_9785 ?auto_9786 ) ) ( not ( = ?auto_9783 ?auto_9786 ) ) ( SURFACE-AT ?auto_9783 ?auto_9787 ) ( CLEAR ?auto_9783 ) ( IS-CRATE ?auto_9784 ) ( AVAILABLE ?auto_9791 ) ( not ( = ?auto_9792 ?auto_9787 ) ) ( not ( = ?auto_9788 ?auto_9792 ) ) ( HOIST-AT ?auto_9794 ?auto_9792 ) ( not ( = ?auto_9791 ?auto_9794 ) ) ( not ( = ?auto_9790 ?auto_9794 ) ) ( AVAILABLE ?auto_9794 ) ( SURFACE-AT ?auto_9784 ?auto_9792 ) ( ON ?auto_9784 ?auto_9789 ) ( CLEAR ?auto_9784 ) ( not ( = ?auto_9784 ?auto_9789 ) ) ( not ( = ?auto_9785 ?auto_9789 ) ) ( not ( = ?auto_9783 ?auto_9789 ) ) ( not ( = ?auto_9786 ?auto_9789 ) ) ( TRUCK-AT ?auto_9793 ?auto_9787 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9784 ?auto_9785 )
      ( MAKE-2CRATE-VERIFY ?auto_9783 ?auto_9784 ?auto_9785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9795 - SURFACE
      ?auto_9796 - SURFACE
      ?auto_9797 - SURFACE
      ?auto_9798 - SURFACE
    )
    :vars
    (
      ?auto_9806 - HOIST
      ?auto_9799 - PLACE
      ?auto_9804 - PLACE
      ?auto_9801 - HOIST
      ?auto_9803 - SURFACE
      ?auto_9805 - PLACE
      ?auto_9802 - HOIST
      ?auto_9800 - SURFACE
      ?auto_9807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9806 ?auto_9799 ) ( IS-CRATE ?auto_9798 ) ( not ( = ?auto_9797 ?auto_9798 ) ) ( not ( = ?auto_9796 ?auto_9797 ) ) ( not ( = ?auto_9796 ?auto_9798 ) ) ( not ( = ?auto_9804 ?auto_9799 ) ) ( HOIST-AT ?auto_9801 ?auto_9804 ) ( not ( = ?auto_9806 ?auto_9801 ) ) ( AVAILABLE ?auto_9801 ) ( SURFACE-AT ?auto_9798 ?auto_9804 ) ( ON ?auto_9798 ?auto_9803 ) ( CLEAR ?auto_9798 ) ( not ( = ?auto_9797 ?auto_9803 ) ) ( not ( = ?auto_9798 ?auto_9803 ) ) ( not ( = ?auto_9796 ?auto_9803 ) ) ( SURFACE-AT ?auto_9796 ?auto_9799 ) ( CLEAR ?auto_9796 ) ( IS-CRATE ?auto_9797 ) ( AVAILABLE ?auto_9806 ) ( not ( = ?auto_9805 ?auto_9799 ) ) ( not ( = ?auto_9804 ?auto_9805 ) ) ( HOIST-AT ?auto_9802 ?auto_9805 ) ( not ( = ?auto_9806 ?auto_9802 ) ) ( not ( = ?auto_9801 ?auto_9802 ) ) ( AVAILABLE ?auto_9802 ) ( SURFACE-AT ?auto_9797 ?auto_9805 ) ( ON ?auto_9797 ?auto_9800 ) ( CLEAR ?auto_9797 ) ( not ( = ?auto_9797 ?auto_9800 ) ) ( not ( = ?auto_9798 ?auto_9800 ) ) ( not ( = ?auto_9796 ?auto_9800 ) ) ( not ( = ?auto_9803 ?auto_9800 ) ) ( TRUCK-AT ?auto_9807 ?auto_9799 ) ( ON ?auto_9796 ?auto_9795 ) ( not ( = ?auto_9795 ?auto_9796 ) ) ( not ( = ?auto_9795 ?auto_9797 ) ) ( not ( = ?auto_9795 ?auto_9798 ) ) ( not ( = ?auto_9795 ?auto_9803 ) ) ( not ( = ?auto_9795 ?auto_9800 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9796 ?auto_9797 ?auto_9798 )
      ( MAKE-3CRATE-VERIFY ?auto_9795 ?auto_9796 ?auto_9797 ?auto_9798 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9808 - SURFACE
      ?auto_9809 - SURFACE
    )
    :vars
    (
      ?auto_9817 - HOIST
      ?auto_9810 - PLACE
      ?auto_9819 - SURFACE
      ?auto_9815 - PLACE
      ?auto_9812 - HOIST
      ?auto_9814 - SURFACE
      ?auto_9816 - PLACE
      ?auto_9813 - HOIST
      ?auto_9811 - SURFACE
      ?auto_9818 - TRUCK
      ?auto_9820 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9817 ?auto_9810 ) ( IS-CRATE ?auto_9809 ) ( not ( = ?auto_9808 ?auto_9809 ) ) ( not ( = ?auto_9819 ?auto_9808 ) ) ( not ( = ?auto_9819 ?auto_9809 ) ) ( not ( = ?auto_9815 ?auto_9810 ) ) ( HOIST-AT ?auto_9812 ?auto_9815 ) ( not ( = ?auto_9817 ?auto_9812 ) ) ( AVAILABLE ?auto_9812 ) ( SURFACE-AT ?auto_9809 ?auto_9815 ) ( ON ?auto_9809 ?auto_9814 ) ( CLEAR ?auto_9809 ) ( not ( = ?auto_9808 ?auto_9814 ) ) ( not ( = ?auto_9809 ?auto_9814 ) ) ( not ( = ?auto_9819 ?auto_9814 ) ) ( IS-CRATE ?auto_9808 ) ( not ( = ?auto_9816 ?auto_9810 ) ) ( not ( = ?auto_9815 ?auto_9816 ) ) ( HOIST-AT ?auto_9813 ?auto_9816 ) ( not ( = ?auto_9817 ?auto_9813 ) ) ( not ( = ?auto_9812 ?auto_9813 ) ) ( AVAILABLE ?auto_9813 ) ( SURFACE-AT ?auto_9808 ?auto_9816 ) ( ON ?auto_9808 ?auto_9811 ) ( CLEAR ?auto_9808 ) ( not ( = ?auto_9808 ?auto_9811 ) ) ( not ( = ?auto_9809 ?auto_9811 ) ) ( not ( = ?auto_9819 ?auto_9811 ) ) ( not ( = ?auto_9814 ?auto_9811 ) ) ( TRUCK-AT ?auto_9818 ?auto_9810 ) ( SURFACE-AT ?auto_9820 ?auto_9810 ) ( CLEAR ?auto_9820 ) ( LIFTING ?auto_9817 ?auto_9819 ) ( IS-CRATE ?auto_9819 ) ( not ( = ?auto_9820 ?auto_9819 ) ) ( not ( = ?auto_9808 ?auto_9820 ) ) ( not ( = ?auto_9809 ?auto_9820 ) ) ( not ( = ?auto_9814 ?auto_9820 ) ) ( not ( = ?auto_9811 ?auto_9820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9820 ?auto_9819 )
      ( MAKE-2CRATE ?auto_9819 ?auto_9808 ?auto_9809 )
      ( MAKE-1CRATE-VERIFY ?auto_9808 ?auto_9809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9821 - SURFACE
      ?auto_9822 - SURFACE
      ?auto_9823 - SURFACE
    )
    :vars
    (
      ?auto_9826 - HOIST
      ?auto_9825 - PLACE
      ?auto_9831 - PLACE
      ?auto_9824 - HOIST
      ?auto_9830 - SURFACE
      ?auto_9832 - PLACE
      ?auto_9828 - HOIST
      ?auto_9829 - SURFACE
      ?auto_9833 - TRUCK
      ?auto_9827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9826 ?auto_9825 ) ( IS-CRATE ?auto_9823 ) ( not ( = ?auto_9822 ?auto_9823 ) ) ( not ( = ?auto_9821 ?auto_9822 ) ) ( not ( = ?auto_9821 ?auto_9823 ) ) ( not ( = ?auto_9831 ?auto_9825 ) ) ( HOIST-AT ?auto_9824 ?auto_9831 ) ( not ( = ?auto_9826 ?auto_9824 ) ) ( AVAILABLE ?auto_9824 ) ( SURFACE-AT ?auto_9823 ?auto_9831 ) ( ON ?auto_9823 ?auto_9830 ) ( CLEAR ?auto_9823 ) ( not ( = ?auto_9822 ?auto_9830 ) ) ( not ( = ?auto_9823 ?auto_9830 ) ) ( not ( = ?auto_9821 ?auto_9830 ) ) ( IS-CRATE ?auto_9822 ) ( not ( = ?auto_9832 ?auto_9825 ) ) ( not ( = ?auto_9831 ?auto_9832 ) ) ( HOIST-AT ?auto_9828 ?auto_9832 ) ( not ( = ?auto_9826 ?auto_9828 ) ) ( not ( = ?auto_9824 ?auto_9828 ) ) ( AVAILABLE ?auto_9828 ) ( SURFACE-AT ?auto_9822 ?auto_9832 ) ( ON ?auto_9822 ?auto_9829 ) ( CLEAR ?auto_9822 ) ( not ( = ?auto_9822 ?auto_9829 ) ) ( not ( = ?auto_9823 ?auto_9829 ) ) ( not ( = ?auto_9821 ?auto_9829 ) ) ( not ( = ?auto_9830 ?auto_9829 ) ) ( TRUCK-AT ?auto_9833 ?auto_9825 ) ( SURFACE-AT ?auto_9827 ?auto_9825 ) ( CLEAR ?auto_9827 ) ( LIFTING ?auto_9826 ?auto_9821 ) ( IS-CRATE ?auto_9821 ) ( not ( = ?auto_9827 ?auto_9821 ) ) ( not ( = ?auto_9822 ?auto_9827 ) ) ( not ( = ?auto_9823 ?auto_9827 ) ) ( not ( = ?auto_9830 ?auto_9827 ) ) ( not ( = ?auto_9829 ?auto_9827 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9822 ?auto_9823 )
      ( MAKE-2CRATE-VERIFY ?auto_9821 ?auto_9822 ?auto_9823 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9834 - SURFACE
      ?auto_9835 - SURFACE
      ?auto_9836 - SURFACE
      ?auto_9837 - SURFACE
    )
    :vars
    (
      ?auto_9838 - HOIST
      ?auto_9846 - PLACE
      ?auto_9844 - PLACE
      ?auto_9842 - HOIST
      ?auto_9845 - SURFACE
      ?auto_9841 - PLACE
      ?auto_9840 - HOIST
      ?auto_9839 - SURFACE
      ?auto_9843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9838 ?auto_9846 ) ( IS-CRATE ?auto_9837 ) ( not ( = ?auto_9836 ?auto_9837 ) ) ( not ( = ?auto_9835 ?auto_9836 ) ) ( not ( = ?auto_9835 ?auto_9837 ) ) ( not ( = ?auto_9844 ?auto_9846 ) ) ( HOIST-AT ?auto_9842 ?auto_9844 ) ( not ( = ?auto_9838 ?auto_9842 ) ) ( AVAILABLE ?auto_9842 ) ( SURFACE-AT ?auto_9837 ?auto_9844 ) ( ON ?auto_9837 ?auto_9845 ) ( CLEAR ?auto_9837 ) ( not ( = ?auto_9836 ?auto_9845 ) ) ( not ( = ?auto_9837 ?auto_9845 ) ) ( not ( = ?auto_9835 ?auto_9845 ) ) ( IS-CRATE ?auto_9836 ) ( not ( = ?auto_9841 ?auto_9846 ) ) ( not ( = ?auto_9844 ?auto_9841 ) ) ( HOIST-AT ?auto_9840 ?auto_9841 ) ( not ( = ?auto_9838 ?auto_9840 ) ) ( not ( = ?auto_9842 ?auto_9840 ) ) ( AVAILABLE ?auto_9840 ) ( SURFACE-AT ?auto_9836 ?auto_9841 ) ( ON ?auto_9836 ?auto_9839 ) ( CLEAR ?auto_9836 ) ( not ( = ?auto_9836 ?auto_9839 ) ) ( not ( = ?auto_9837 ?auto_9839 ) ) ( not ( = ?auto_9835 ?auto_9839 ) ) ( not ( = ?auto_9845 ?auto_9839 ) ) ( TRUCK-AT ?auto_9843 ?auto_9846 ) ( SURFACE-AT ?auto_9834 ?auto_9846 ) ( CLEAR ?auto_9834 ) ( LIFTING ?auto_9838 ?auto_9835 ) ( IS-CRATE ?auto_9835 ) ( not ( = ?auto_9834 ?auto_9835 ) ) ( not ( = ?auto_9836 ?auto_9834 ) ) ( not ( = ?auto_9837 ?auto_9834 ) ) ( not ( = ?auto_9845 ?auto_9834 ) ) ( not ( = ?auto_9839 ?auto_9834 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9835 ?auto_9836 ?auto_9837 )
      ( MAKE-3CRATE-VERIFY ?auto_9834 ?auto_9835 ?auto_9836 ?auto_9837 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9847 - SURFACE
      ?auto_9848 - SURFACE
    )
    :vars
    (
      ?auto_9850 - HOIST
      ?auto_9859 - PLACE
      ?auto_9849 - SURFACE
      ?auto_9857 - PLACE
      ?auto_9854 - HOIST
      ?auto_9858 - SURFACE
      ?auto_9853 - PLACE
      ?auto_9852 - HOIST
      ?auto_9851 - SURFACE
      ?auto_9856 - TRUCK
      ?auto_9855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9850 ?auto_9859 ) ( IS-CRATE ?auto_9848 ) ( not ( = ?auto_9847 ?auto_9848 ) ) ( not ( = ?auto_9849 ?auto_9847 ) ) ( not ( = ?auto_9849 ?auto_9848 ) ) ( not ( = ?auto_9857 ?auto_9859 ) ) ( HOIST-AT ?auto_9854 ?auto_9857 ) ( not ( = ?auto_9850 ?auto_9854 ) ) ( AVAILABLE ?auto_9854 ) ( SURFACE-AT ?auto_9848 ?auto_9857 ) ( ON ?auto_9848 ?auto_9858 ) ( CLEAR ?auto_9848 ) ( not ( = ?auto_9847 ?auto_9858 ) ) ( not ( = ?auto_9848 ?auto_9858 ) ) ( not ( = ?auto_9849 ?auto_9858 ) ) ( IS-CRATE ?auto_9847 ) ( not ( = ?auto_9853 ?auto_9859 ) ) ( not ( = ?auto_9857 ?auto_9853 ) ) ( HOIST-AT ?auto_9852 ?auto_9853 ) ( not ( = ?auto_9850 ?auto_9852 ) ) ( not ( = ?auto_9854 ?auto_9852 ) ) ( AVAILABLE ?auto_9852 ) ( SURFACE-AT ?auto_9847 ?auto_9853 ) ( ON ?auto_9847 ?auto_9851 ) ( CLEAR ?auto_9847 ) ( not ( = ?auto_9847 ?auto_9851 ) ) ( not ( = ?auto_9848 ?auto_9851 ) ) ( not ( = ?auto_9849 ?auto_9851 ) ) ( not ( = ?auto_9858 ?auto_9851 ) ) ( TRUCK-AT ?auto_9856 ?auto_9859 ) ( SURFACE-AT ?auto_9855 ?auto_9859 ) ( CLEAR ?auto_9855 ) ( IS-CRATE ?auto_9849 ) ( not ( = ?auto_9855 ?auto_9849 ) ) ( not ( = ?auto_9847 ?auto_9855 ) ) ( not ( = ?auto_9848 ?auto_9855 ) ) ( not ( = ?auto_9858 ?auto_9855 ) ) ( not ( = ?auto_9851 ?auto_9855 ) ) ( AVAILABLE ?auto_9850 ) ( IN ?auto_9849 ?auto_9856 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9850 ?auto_9849 ?auto_9856 ?auto_9859 )
      ( MAKE-2CRATE ?auto_9849 ?auto_9847 ?auto_9848 )
      ( MAKE-1CRATE-VERIFY ?auto_9847 ?auto_9848 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9860 - SURFACE
      ?auto_9861 - SURFACE
      ?auto_9862 - SURFACE
    )
    :vars
    (
      ?auto_9864 - HOIST
      ?auto_9863 - PLACE
      ?auto_9869 - PLACE
      ?auto_9871 - HOIST
      ?auto_9866 - SURFACE
      ?auto_9872 - PLACE
      ?auto_9870 - HOIST
      ?auto_9868 - SURFACE
      ?auto_9867 - TRUCK
      ?auto_9865 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9864 ?auto_9863 ) ( IS-CRATE ?auto_9862 ) ( not ( = ?auto_9861 ?auto_9862 ) ) ( not ( = ?auto_9860 ?auto_9861 ) ) ( not ( = ?auto_9860 ?auto_9862 ) ) ( not ( = ?auto_9869 ?auto_9863 ) ) ( HOIST-AT ?auto_9871 ?auto_9869 ) ( not ( = ?auto_9864 ?auto_9871 ) ) ( AVAILABLE ?auto_9871 ) ( SURFACE-AT ?auto_9862 ?auto_9869 ) ( ON ?auto_9862 ?auto_9866 ) ( CLEAR ?auto_9862 ) ( not ( = ?auto_9861 ?auto_9866 ) ) ( not ( = ?auto_9862 ?auto_9866 ) ) ( not ( = ?auto_9860 ?auto_9866 ) ) ( IS-CRATE ?auto_9861 ) ( not ( = ?auto_9872 ?auto_9863 ) ) ( not ( = ?auto_9869 ?auto_9872 ) ) ( HOIST-AT ?auto_9870 ?auto_9872 ) ( not ( = ?auto_9864 ?auto_9870 ) ) ( not ( = ?auto_9871 ?auto_9870 ) ) ( AVAILABLE ?auto_9870 ) ( SURFACE-AT ?auto_9861 ?auto_9872 ) ( ON ?auto_9861 ?auto_9868 ) ( CLEAR ?auto_9861 ) ( not ( = ?auto_9861 ?auto_9868 ) ) ( not ( = ?auto_9862 ?auto_9868 ) ) ( not ( = ?auto_9860 ?auto_9868 ) ) ( not ( = ?auto_9866 ?auto_9868 ) ) ( TRUCK-AT ?auto_9867 ?auto_9863 ) ( SURFACE-AT ?auto_9865 ?auto_9863 ) ( CLEAR ?auto_9865 ) ( IS-CRATE ?auto_9860 ) ( not ( = ?auto_9865 ?auto_9860 ) ) ( not ( = ?auto_9861 ?auto_9865 ) ) ( not ( = ?auto_9862 ?auto_9865 ) ) ( not ( = ?auto_9866 ?auto_9865 ) ) ( not ( = ?auto_9868 ?auto_9865 ) ) ( AVAILABLE ?auto_9864 ) ( IN ?auto_9860 ?auto_9867 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9861 ?auto_9862 )
      ( MAKE-2CRATE-VERIFY ?auto_9860 ?auto_9861 ?auto_9862 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9873 - SURFACE
      ?auto_9874 - SURFACE
      ?auto_9875 - SURFACE
      ?auto_9876 - SURFACE
    )
    :vars
    (
      ?auto_9885 - HOIST
      ?auto_9882 - PLACE
      ?auto_9883 - PLACE
      ?auto_9880 - HOIST
      ?auto_9881 - SURFACE
      ?auto_9877 - PLACE
      ?auto_9879 - HOIST
      ?auto_9884 - SURFACE
      ?auto_9878 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9885 ?auto_9882 ) ( IS-CRATE ?auto_9876 ) ( not ( = ?auto_9875 ?auto_9876 ) ) ( not ( = ?auto_9874 ?auto_9875 ) ) ( not ( = ?auto_9874 ?auto_9876 ) ) ( not ( = ?auto_9883 ?auto_9882 ) ) ( HOIST-AT ?auto_9880 ?auto_9883 ) ( not ( = ?auto_9885 ?auto_9880 ) ) ( AVAILABLE ?auto_9880 ) ( SURFACE-AT ?auto_9876 ?auto_9883 ) ( ON ?auto_9876 ?auto_9881 ) ( CLEAR ?auto_9876 ) ( not ( = ?auto_9875 ?auto_9881 ) ) ( not ( = ?auto_9876 ?auto_9881 ) ) ( not ( = ?auto_9874 ?auto_9881 ) ) ( IS-CRATE ?auto_9875 ) ( not ( = ?auto_9877 ?auto_9882 ) ) ( not ( = ?auto_9883 ?auto_9877 ) ) ( HOIST-AT ?auto_9879 ?auto_9877 ) ( not ( = ?auto_9885 ?auto_9879 ) ) ( not ( = ?auto_9880 ?auto_9879 ) ) ( AVAILABLE ?auto_9879 ) ( SURFACE-AT ?auto_9875 ?auto_9877 ) ( ON ?auto_9875 ?auto_9884 ) ( CLEAR ?auto_9875 ) ( not ( = ?auto_9875 ?auto_9884 ) ) ( not ( = ?auto_9876 ?auto_9884 ) ) ( not ( = ?auto_9874 ?auto_9884 ) ) ( not ( = ?auto_9881 ?auto_9884 ) ) ( TRUCK-AT ?auto_9878 ?auto_9882 ) ( SURFACE-AT ?auto_9873 ?auto_9882 ) ( CLEAR ?auto_9873 ) ( IS-CRATE ?auto_9874 ) ( not ( = ?auto_9873 ?auto_9874 ) ) ( not ( = ?auto_9875 ?auto_9873 ) ) ( not ( = ?auto_9876 ?auto_9873 ) ) ( not ( = ?auto_9881 ?auto_9873 ) ) ( not ( = ?auto_9884 ?auto_9873 ) ) ( AVAILABLE ?auto_9885 ) ( IN ?auto_9874 ?auto_9878 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9874 ?auto_9875 ?auto_9876 )
      ( MAKE-3CRATE-VERIFY ?auto_9873 ?auto_9874 ?auto_9875 ?auto_9876 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9886 - SURFACE
      ?auto_9887 - SURFACE
    )
    :vars
    (
      ?auto_9898 - HOIST
      ?auto_9895 - PLACE
      ?auto_9888 - SURFACE
      ?auto_9896 - PLACE
      ?auto_9893 - HOIST
      ?auto_9894 - SURFACE
      ?auto_9889 - PLACE
      ?auto_9891 - HOIST
      ?auto_9897 - SURFACE
      ?auto_9892 - SURFACE
      ?auto_9890 - TRUCK
      ?auto_9899 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9898 ?auto_9895 ) ( IS-CRATE ?auto_9887 ) ( not ( = ?auto_9886 ?auto_9887 ) ) ( not ( = ?auto_9888 ?auto_9886 ) ) ( not ( = ?auto_9888 ?auto_9887 ) ) ( not ( = ?auto_9896 ?auto_9895 ) ) ( HOIST-AT ?auto_9893 ?auto_9896 ) ( not ( = ?auto_9898 ?auto_9893 ) ) ( AVAILABLE ?auto_9893 ) ( SURFACE-AT ?auto_9887 ?auto_9896 ) ( ON ?auto_9887 ?auto_9894 ) ( CLEAR ?auto_9887 ) ( not ( = ?auto_9886 ?auto_9894 ) ) ( not ( = ?auto_9887 ?auto_9894 ) ) ( not ( = ?auto_9888 ?auto_9894 ) ) ( IS-CRATE ?auto_9886 ) ( not ( = ?auto_9889 ?auto_9895 ) ) ( not ( = ?auto_9896 ?auto_9889 ) ) ( HOIST-AT ?auto_9891 ?auto_9889 ) ( not ( = ?auto_9898 ?auto_9891 ) ) ( not ( = ?auto_9893 ?auto_9891 ) ) ( AVAILABLE ?auto_9891 ) ( SURFACE-AT ?auto_9886 ?auto_9889 ) ( ON ?auto_9886 ?auto_9897 ) ( CLEAR ?auto_9886 ) ( not ( = ?auto_9886 ?auto_9897 ) ) ( not ( = ?auto_9887 ?auto_9897 ) ) ( not ( = ?auto_9888 ?auto_9897 ) ) ( not ( = ?auto_9894 ?auto_9897 ) ) ( SURFACE-AT ?auto_9892 ?auto_9895 ) ( CLEAR ?auto_9892 ) ( IS-CRATE ?auto_9888 ) ( not ( = ?auto_9892 ?auto_9888 ) ) ( not ( = ?auto_9886 ?auto_9892 ) ) ( not ( = ?auto_9887 ?auto_9892 ) ) ( not ( = ?auto_9894 ?auto_9892 ) ) ( not ( = ?auto_9897 ?auto_9892 ) ) ( AVAILABLE ?auto_9898 ) ( IN ?auto_9888 ?auto_9890 ) ( TRUCK-AT ?auto_9890 ?auto_9899 ) ( not ( = ?auto_9899 ?auto_9895 ) ) ( not ( = ?auto_9896 ?auto_9899 ) ) ( not ( = ?auto_9889 ?auto_9899 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9890 ?auto_9899 ?auto_9895 )
      ( MAKE-2CRATE ?auto_9888 ?auto_9886 ?auto_9887 )
      ( MAKE-1CRATE-VERIFY ?auto_9886 ?auto_9887 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9900 - SURFACE
      ?auto_9901 - SURFACE
      ?auto_9902 - SURFACE
    )
    :vars
    (
      ?auto_9905 - HOIST
      ?auto_9908 - PLACE
      ?auto_9911 - PLACE
      ?auto_9912 - HOIST
      ?auto_9904 - SURFACE
      ?auto_9910 - PLACE
      ?auto_9903 - HOIST
      ?auto_9913 - SURFACE
      ?auto_9906 - SURFACE
      ?auto_9907 - TRUCK
      ?auto_9909 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9905 ?auto_9908 ) ( IS-CRATE ?auto_9902 ) ( not ( = ?auto_9901 ?auto_9902 ) ) ( not ( = ?auto_9900 ?auto_9901 ) ) ( not ( = ?auto_9900 ?auto_9902 ) ) ( not ( = ?auto_9911 ?auto_9908 ) ) ( HOIST-AT ?auto_9912 ?auto_9911 ) ( not ( = ?auto_9905 ?auto_9912 ) ) ( AVAILABLE ?auto_9912 ) ( SURFACE-AT ?auto_9902 ?auto_9911 ) ( ON ?auto_9902 ?auto_9904 ) ( CLEAR ?auto_9902 ) ( not ( = ?auto_9901 ?auto_9904 ) ) ( not ( = ?auto_9902 ?auto_9904 ) ) ( not ( = ?auto_9900 ?auto_9904 ) ) ( IS-CRATE ?auto_9901 ) ( not ( = ?auto_9910 ?auto_9908 ) ) ( not ( = ?auto_9911 ?auto_9910 ) ) ( HOIST-AT ?auto_9903 ?auto_9910 ) ( not ( = ?auto_9905 ?auto_9903 ) ) ( not ( = ?auto_9912 ?auto_9903 ) ) ( AVAILABLE ?auto_9903 ) ( SURFACE-AT ?auto_9901 ?auto_9910 ) ( ON ?auto_9901 ?auto_9913 ) ( CLEAR ?auto_9901 ) ( not ( = ?auto_9901 ?auto_9913 ) ) ( not ( = ?auto_9902 ?auto_9913 ) ) ( not ( = ?auto_9900 ?auto_9913 ) ) ( not ( = ?auto_9904 ?auto_9913 ) ) ( SURFACE-AT ?auto_9906 ?auto_9908 ) ( CLEAR ?auto_9906 ) ( IS-CRATE ?auto_9900 ) ( not ( = ?auto_9906 ?auto_9900 ) ) ( not ( = ?auto_9901 ?auto_9906 ) ) ( not ( = ?auto_9902 ?auto_9906 ) ) ( not ( = ?auto_9904 ?auto_9906 ) ) ( not ( = ?auto_9913 ?auto_9906 ) ) ( AVAILABLE ?auto_9905 ) ( IN ?auto_9900 ?auto_9907 ) ( TRUCK-AT ?auto_9907 ?auto_9909 ) ( not ( = ?auto_9909 ?auto_9908 ) ) ( not ( = ?auto_9911 ?auto_9909 ) ) ( not ( = ?auto_9910 ?auto_9909 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9901 ?auto_9902 )
      ( MAKE-2CRATE-VERIFY ?auto_9900 ?auto_9901 ?auto_9902 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9914 - SURFACE
      ?auto_9915 - SURFACE
      ?auto_9916 - SURFACE
      ?auto_9917 - SURFACE
    )
    :vars
    (
      ?auto_9923 - HOIST
      ?auto_9926 - PLACE
      ?auto_9920 - PLACE
      ?auto_9927 - HOIST
      ?auto_9919 - SURFACE
      ?auto_9925 - PLACE
      ?auto_9922 - HOIST
      ?auto_9921 - SURFACE
      ?auto_9918 - TRUCK
      ?auto_9924 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9923 ?auto_9926 ) ( IS-CRATE ?auto_9917 ) ( not ( = ?auto_9916 ?auto_9917 ) ) ( not ( = ?auto_9915 ?auto_9916 ) ) ( not ( = ?auto_9915 ?auto_9917 ) ) ( not ( = ?auto_9920 ?auto_9926 ) ) ( HOIST-AT ?auto_9927 ?auto_9920 ) ( not ( = ?auto_9923 ?auto_9927 ) ) ( AVAILABLE ?auto_9927 ) ( SURFACE-AT ?auto_9917 ?auto_9920 ) ( ON ?auto_9917 ?auto_9919 ) ( CLEAR ?auto_9917 ) ( not ( = ?auto_9916 ?auto_9919 ) ) ( not ( = ?auto_9917 ?auto_9919 ) ) ( not ( = ?auto_9915 ?auto_9919 ) ) ( IS-CRATE ?auto_9916 ) ( not ( = ?auto_9925 ?auto_9926 ) ) ( not ( = ?auto_9920 ?auto_9925 ) ) ( HOIST-AT ?auto_9922 ?auto_9925 ) ( not ( = ?auto_9923 ?auto_9922 ) ) ( not ( = ?auto_9927 ?auto_9922 ) ) ( AVAILABLE ?auto_9922 ) ( SURFACE-AT ?auto_9916 ?auto_9925 ) ( ON ?auto_9916 ?auto_9921 ) ( CLEAR ?auto_9916 ) ( not ( = ?auto_9916 ?auto_9921 ) ) ( not ( = ?auto_9917 ?auto_9921 ) ) ( not ( = ?auto_9915 ?auto_9921 ) ) ( not ( = ?auto_9919 ?auto_9921 ) ) ( SURFACE-AT ?auto_9914 ?auto_9926 ) ( CLEAR ?auto_9914 ) ( IS-CRATE ?auto_9915 ) ( not ( = ?auto_9914 ?auto_9915 ) ) ( not ( = ?auto_9916 ?auto_9914 ) ) ( not ( = ?auto_9917 ?auto_9914 ) ) ( not ( = ?auto_9919 ?auto_9914 ) ) ( not ( = ?auto_9921 ?auto_9914 ) ) ( AVAILABLE ?auto_9923 ) ( IN ?auto_9915 ?auto_9918 ) ( TRUCK-AT ?auto_9918 ?auto_9924 ) ( not ( = ?auto_9924 ?auto_9926 ) ) ( not ( = ?auto_9920 ?auto_9924 ) ) ( not ( = ?auto_9925 ?auto_9924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9915 ?auto_9916 ?auto_9917 )
      ( MAKE-3CRATE-VERIFY ?auto_9914 ?auto_9915 ?auto_9916 ?auto_9917 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9928 - SURFACE
      ?auto_9929 - SURFACE
    )
    :vars
    (
      ?auto_9935 - HOIST
      ?auto_9938 - PLACE
      ?auto_9940 - SURFACE
      ?auto_9932 - PLACE
      ?auto_9941 - HOIST
      ?auto_9931 - SURFACE
      ?auto_9937 - PLACE
      ?auto_9934 - HOIST
      ?auto_9933 - SURFACE
      ?auto_9939 - SURFACE
      ?auto_9930 - TRUCK
      ?auto_9936 - PLACE
      ?auto_9942 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9935 ?auto_9938 ) ( IS-CRATE ?auto_9929 ) ( not ( = ?auto_9928 ?auto_9929 ) ) ( not ( = ?auto_9940 ?auto_9928 ) ) ( not ( = ?auto_9940 ?auto_9929 ) ) ( not ( = ?auto_9932 ?auto_9938 ) ) ( HOIST-AT ?auto_9941 ?auto_9932 ) ( not ( = ?auto_9935 ?auto_9941 ) ) ( AVAILABLE ?auto_9941 ) ( SURFACE-AT ?auto_9929 ?auto_9932 ) ( ON ?auto_9929 ?auto_9931 ) ( CLEAR ?auto_9929 ) ( not ( = ?auto_9928 ?auto_9931 ) ) ( not ( = ?auto_9929 ?auto_9931 ) ) ( not ( = ?auto_9940 ?auto_9931 ) ) ( IS-CRATE ?auto_9928 ) ( not ( = ?auto_9937 ?auto_9938 ) ) ( not ( = ?auto_9932 ?auto_9937 ) ) ( HOIST-AT ?auto_9934 ?auto_9937 ) ( not ( = ?auto_9935 ?auto_9934 ) ) ( not ( = ?auto_9941 ?auto_9934 ) ) ( AVAILABLE ?auto_9934 ) ( SURFACE-AT ?auto_9928 ?auto_9937 ) ( ON ?auto_9928 ?auto_9933 ) ( CLEAR ?auto_9928 ) ( not ( = ?auto_9928 ?auto_9933 ) ) ( not ( = ?auto_9929 ?auto_9933 ) ) ( not ( = ?auto_9940 ?auto_9933 ) ) ( not ( = ?auto_9931 ?auto_9933 ) ) ( SURFACE-AT ?auto_9939 ?auto_9938 ) ( CLEAR ?auto_9939 ) ( IS-CRATE ?auto_9940 ) ( not ( = ?auto_9939 ?auto_9940 ) ) ( not ( = ?auto_9928 ?auto_9939 ) ) ( not ( = ?auto_9929 ?auto_9939 ) ) ( not ( = ?auto_9931 ?auto_9939 ) ) ( not ( = ?auto_9933 ?auto_9939 ) ) ( AVAILABLE ?auto_9935 ) ( TRUCK-AT ?auto_9930 ?auto_9936 ) ( not ( = ?auto_9936 ?auto_9938 ) ) ( not ( = ?auto_9932 ?auto_9936 ) ) ( not ( = ?auto_9937 ?auto_9936 ) ) ( HOIST-AT ?auto_9942 ?auto_9936 ) ( LIFTING ?auto_9942 ?auto_9940 ) ( not ( = ?auto_9935 ?auto_9942 ) ) ( not ( = ?auto_9941 ?auto_9942 ) ) ( not ( = ?auto_9934 ?auto_9942 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9942 ?auto_9940 ?auto_9930 ?auto_9936 )
      ( MAKE-2CRATE ?auto_9940 ?auto_9928 ?auto_9929 )
      ( MAKE-1CRATE-VERIFY ?auto_9928 ?auto_9929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9943 - SURFACE
      ?auto_9944 - SURFACE
      ?auto_9945 - SURFACE
    )
    :vars
    (
      ?auto_9947 - HOIST
      ?auto_9948 - PLACE
      ?auto_9955 - PLACE
      ?auto_9957 - HOIST
      ?auto_9954 - SURFACE
      ?auto_9949 - PLACE
      ?auto_9956 - HOIST
      ?auto_9950 - SURFACE
      ?auto_9951 - SURFACE
      ?auto_9952 - TRUCK
      ?auto_9946 - PLACE
      ?auto_9953 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9947 ?auto_9948 ) ( IS-CRATE ?auto_9945 ) ( not ( = ?auto_9944 ?auto_9945 ) ) ( not ( = ?auto_9943 ?auto_9944 ) ) ( not ( = ?auto_9943 ?auto_9945 ) ) ( not ( = ?auto_9955 ?auto_9948 ) ) ( HOIST-AT ?auto_9957 ?auto_9955 ) ( not ( = ?auto_9947 ?auto_9957 ) ) ( AVAILABLE ?auto_9957 ) ( SURFACE-AT ?auto_9945 ?auto_9955 ) ( ON ?auto_9945 ?auto_9954 ) ( CLEAR ?auto_9945 ) ( not ( = ?auto_9944 ?auto_9954 ) ) ( not ( = ?auto_9945 ?auto_9954 ) ) ( not ( = ?auto_9943 ?auto_9954 ) ) ( IS-CRATE ?auto_9944 ) ( not ( = ?auto_9949 ?auto_9948 ) ) ( not ( = ?auto_9955 ?auto_9949 ) ) ( HOIST-AT ?auto_9956 ?auto_9949 ) ( not ( = ?auto_9947 ?auto_9956 ) ) ( not ( = ?auto_9957 ?auto_9956 ) ) ( AVAILABLE ?auto_9956 ) ( SURFACE-AT ?auto_9944 ?auto_9949 ) ( ON ?auto_9944 ?auto_9950 ) ( CLEAR ?auto_9944 ) ( not ( = ?auto_9944 ?auto_9950 ) ) ( not ( = ?auto_9945 ?auto_9950 ) ) ( not ( = ?auto_9943 ?auto_9950 ) ) ( not ( = ?auto_9954 ?auto_9950 ) ) ( SURFACE-AT ?auto_9951 ?auto_9948 ) ( CLEAR ?auto_9951 ) ( IS-CRATE ?auto_9943 ) ( not ( = ?auto_9951 ?auto_9943 ) ) ( not ( = ?auto_9944 ?auto_9951 ) ) ( not ( = ?auto_9945 ?auto_9951 ) ) ( not ( = ?auto_9954 ?auto_9951 ) ) ( not ( = ?auto_9950 ?auto_9951 ) ) ( AVAILABLE ?auto_9947 ) ( TRUCK-AT ?auto_9952 ?auto_9946 ) ( not ( = ?auto_9946 ?auto_9948 ) ) ( not ( = ?auto_9955 ?auto_9946 ) ) ( not ( = ?auto_9949 ?auto_9946 ) ) ( HOIST-AT ?auto_9953 ?auto_9946 ) ( LIFTING ?auto_9953 ?auto_9943 ) ( not ( = ?auto_9947 ?auto_9953 ) ) ( not ( = ?auto_9957 ?auto_9953 ) ) ( not ( = ?auto_9956 ?auto_9953 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9944 ?auto_9945 )
      ( MAKE-2CRATE-VERIFY ?auto_9943 ?auto_9944 ?auto_9945 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9958 - SURFACE
      ?auto_9959 - SURFACE
      ?auto_9960 - SURFACE
      ?auto_9961 - SURFACE
    )
    :vars
    (
      ?auto_9963 - HOIST
      ?auto_9964 - PLACE
      ?auto_9969 - PLACE
      ?auto_9966 - HOIST
      ?auto_9972 - SURFACE
      ?auto_9968 - PLACE
      ?auto_9971 - HOIST
      ?auto_9967 - SURFACE
      ?auto_9970 - TRUCK
      ?auto_9962 - PLACE
      ?auto_9965 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9963 ?auto_9964 ) ( IS-CRATE ?auto_9961 ) ( not ( = ?auto_9960 ?auto_9961 ) ) ( not ( = ?auto_9959 ?auto_9960 ) ) ( not ( = ?auto_9959 ?auto_9961 ) ) ( not ( = ?auto_9969 ?auto_9964 ) ) ( HOIST-AT ?auto_9966 ?auto_9969 ) ( not ( = ?auto_9963 ?auto_9966 ) ) ( AVAILABLE ?auto_9966 ) ( SURFACE-AT ?auto_9961 ?auto_9969 ) ( ON ?auto_9961 ?auto_9972 ) ( CLEAR ?auto_9961 ) ( not ( = ?auto_9960 ?auto_9972 ) ) ( not ( = ?auto_9961 ?auto_9972 ) ) ( not ( = ?auto_9959 ?auto_9972 ) ) ( IS-CRATE ?auto_9960 ) ( not ( = ?auto_9968 ?auto_9964 ) ) ( not ( = ?auto_9969 ?auto_9968 ) ) ( HOIST-AT ?auto_9971 ?auto_9968 ) ( not ( = ?auto_9963 ?auto_9971 ) ) ( not ( = ?auto_9966 ?auto_9971 ) ) ( AVAILABLE ?auto_9971 ) ( SURFACE-AT ?auto_9960 ?auto_9968 ) ( ON ?auto_9960 ?auto_9967 ) ( CLEAR ?auto_9960 ) ( not ( = ?auto_9960 ?auto_9967 ) ) ( not ( = ?auto_9961 ?auto_9967 ) ) ( not ( = ?auto_9959 ?auto_9967 ) ) ( not ( = ?auto_9972 ?auto_9967 ) ) ( SURFACE-AT ?auto_9958 ?auto_9964 ) ( CLEAR ?auto_9958 ) ( IS-CRATE ?auto_9959 ) ( not ( = ?auto_9958 ?auto_9959 ) ) ( not ( = ?auto_9960 ?auto_9958 ) ) ( not ( = ?auto_9961 ?auto_9958 ) ) ( not ( = ?auto_9972 ?auto_9958 ) ) ( not ( = ?auto_9967 ?auto_9958 ) ) ( AVAILABLE ?auto_9963 ) ( TRUCK-AT ?auto_9970 ?auto_9962 ) ( not ( = ?auto_9962 ?auto_9964 ) ) ( not ( = ?auto_9969 ?auto_9962 ) ) ( not ( = ?auto_9968 ?auto_9962 ) ) ( HOIST-AT ?auto_9965 ?auto_9962 ) ( LIFTING ?auto_9965 ?auto_9959 ) ( not ( = ?auto_9963 ?auto_9965 ) ) ( not ( = ?auto_9966 ?auto_9965 ) ) ( not ( = ?auto_9971 ?auto_9965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9959 ?auto_9960 ?auto_9961 )
      ( MAKE-3CRATE-VERIFY ?auto_9958 ?auto_9959 ?auto_9960 ?auto_9961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9973 - SURFACE
      ?auto_9974 - SURFACE
    )
    :vars
    (
      ?auto_9976 - HOIST
      ?auto_9977 - PLACE
      ?auto_9982 - SURFACE
      ?auto_9983 - PLACE
      ?auto_9979 - HOIST
      ?auto_9987 - SURFACE
      ?auto_9981 - PLACE
      ?auto_9985 - HOIST
      ?auto_9980 - SURFACE
      ?auto_9986 - SURFACE
      ?auto_9984 - TRUCK
      ?auto_9975 - PLACE
      ?auto_9978 - HOIST
      ?auto_9988 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9976 ?auto_9977 ) ( IS-CRATE ?auto_9974 ) ( not ( = ?auto_9973 ?auto_9974 ) ) ( not ( = ?auto_9982 ?auto_9973 ) ) ( not ( = ?auto_9982 ?auto_9974 ) ) ( not ( = ?auto_9983 ?auto_9977 ) ) ( HOIST-AT ?auto_9979 ?auto_9983 ) ( not ( = ?auto_9976 ?auto_9979 ) ) ( AVAILABLE ?auto_9979 ) ( SURFACE-AT ?auto_9974 ?auto_9983 ) ( ON ?auto_9974 ?auto_9987 ) ( CLEAR ?auto_9974 ) ( not ( = ?auto_9973 ?auto_9987 ) ) ( not ( = ?auto_9974 ?auto_9987 ) ) ( not ( = ?auto_9982 ?auto_9987 ) ) ( IS-CRATE ?auto_9973 ) ( not ( = ?auto_9981 ?auto_9977 ) ) ( not ( = ?auto_9983 ?auto_9981 ) ) ( HOIST-AT ?auto_9985 ?auto_9981 ) ( not ( = ?auto_9976 ?auto_9985 ) ) ( not ( = ?auto_9979 ?auto_9985 ) ) ( AVAILABLE ?auto_9985 ) ( SURFACE-AT ?auto_9973 ?auto_9981 ) ( ON ?auto_9973 ?auto_9980 ) ( CLEAR ?auto_9973 ) ( not ( = ?auto_9973 ?auto_9980 ) ) ( not ( = ?auto_9974 ?auto_9980 ) ) ( not ( = ?auto_9982 ?auto_9980 ) ) ( not ( = ?auto_9987 ?auto_9980 ) ) ( SURFACE-AT ?auto_9986 ?auto_9977 ) ( CLEAR ?auto_9986 ) ( IS-CRATE ?auto_9982 ) ( not ( = ?auto_9986 ?auto_9982 ) ) ( not ( = ?auto_9973 ?auto_9986 ) ) ( not ( = ?auto_9974 ?auto_9986 ) ) ( not ( = ?auto_9987 ?auto_9986 ) ) ( not ( = ?auto_9980 ?auto_9986 ) ) ( AVAILABLE ?auto_9976 ) ( TRUCK-AT ?auto_9984 ?auto_9975 ) ( not ( = ?auto_9975 ?auto_9977 ) ) ( not ( = ?auto_9983 ?auto_9975 ) ) ( not ( = ?auto_9981 ?auto_9975 ) ) ( HOIST-AT ?auto_9978 ?auto_9975 ) ( not ( = ?auto_9976 ?auto_9978 ) ) ( not ( = ?auto_9979 ?auto_9978 ) ) ( not ( = ?auto_9985 ?auto_9978 ) ) ( AVAILABLE ?auto_9978 ) ( SURFACE-AT ?auto_9982 ?auto_9975 ) ( ON ?auto_9982 ?auto_9988 ) ( CLEAR ?auto_9982 ) ( not ( = ?auto_9973 ?auto_9988 ) ) ( not ( = ?auto_9974 ?auto_9988 ) ) ( not ( = ?auto_9982 ?auto_9988 ) ) ( not ( = ?auto_9987 ?auto_9988 ) ) ( not ( = ?auto_9980 ?auto_9988 ) ) ( not ( = ?auto_9986 ?auto_9988 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9978 ?auto_9982 ?auto_9988 ?auto_9975 )
      ( MAKE-2CRATE ?auto_9982 ?auto_9973 ?auto_9974 )
      ( MAKE-1CRATE-VERIFY ?auto_9973 ?auto_9974 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9989 - SURFACE
      ?auto_9990 - SURFACE
      ?auto_9991 - SURFACE
    )
    :vars
    (
      ?auto_10001 - HOIST
      ?auto_9994 - PLACE
      ?auto_10000 - PLACE
      ?auto_9993 - HOIST
      ?auto_9992 - SURFACE
      ?auto_9995 - PLACE
      ?auto_9999 - HOIST
      ?auto_9998 - SURFACE
      ?auto_10003 - SURFACE
      ?auto_9996 - TRUCK
      ?auto_10004 - PLACE
      ?auto_9997 - HOIST
      ?auto_10002 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10001 ?auto_9994 ) ( IS-CRATE ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9991 ) ) ( not ( = ?auto_9989 ?auto_9990 ) ) ( not ( = ?auto_9989 ?auto_9991 ) ) ( not ( = ?auto_10000 ?auto_9994 ) ) ( HOIST-AT ?auto_9993 ?auto_10000 ) ( not ( = ?auto_10001 ?auto_9993 ) ) ( AVAILABLE ?auto_9993 ) ( SURFACE-AT ?auto_9991 ?auto_10000 ) ( ON ?auto_9991 ?auto_9992 ) ( CLEAR ?auto_9991 ) ( not ( = ?auto_9990 ?auto_9992 ) ) ( not ( = ?auto_9991 ?auto_9992 ) ) ( not ( = ?auto_9989 ?auto_9992 ) ) ( IS-CRATE ?auto_9990 ) ( not ( = ?auto_9995 ?auto_9994 ) ) ( not ( = ?auto_10000 ?auto_9995 ) ) ( HOIST-AT ?auto_9999 ?auto_9995 ) ( not ( = ?auto_10001 ?auto_9999 ) ) ( not ( = ?auto_9993 ?auto_9999 ) ) ( AVAILABLE ?auto_9999 ) ( SURFACE-AT ?auto_9990 ?auto_9995 ) ( ON ?auto_9990 ?auto_9998 ) ( CLEAR ?auto_9990 ) ( not ( = ?auto_9990 ?auto_9998 ) ) ( not ( = ?auto_9991 ?auto_9998 ) ) ( not ( = ?auto_9989 ?auto_9998 ) ) ( not ( = ?auto_9992 ?auto_9998 ) ) ( SURFACE-AT ?auto_10003 ?auto_9994 ) ( CLEAR ?auto_10003 ) ( IS-CRATE ?auto_9989 ) ( not ( = ?auto_10003 ?auto_9989 ) ) ( not ( = ?auto_9990 ?auto_10003 ) ) ( not ( = ?auto_9991 ?auto_10003 ) ) ( not ( = ?auto_9992 ?auto_10003 ) ) ( not ( = ?auto_9998 ?auto_10003 ) ) ( AVAILABLE ?auto_10001 ) ( TRUCK-AT ?auto_9996 ?auto_10004 ) ( not ( = ?auto_10004 ?auto_9994 ) ) ( not ( = ?auto_10000 ?auto_10004 ) ) ( not ( = ?auto_9995 ?auto_10004 ) ) ( HOIST-AT ?auto_9997 ?auto_10004 ) ( not ( = ?auto_10001 ?auto_9997 ) ) ( not ( = ?auto_9993 ?auto_9997 ) ) ( not ( = ?auto_9999 ?auto_9997 ) ) ( AVAILABLE ?auto_9997 ) ( SURFACE-AT ?auto_9989 ?auto_10004 ) ( ON ?auto_9989 ?auto_10002 ) ( CLEAR ?auto_9989 ) ( not ( = ?auto_9990 ?auto_10002 ) ) ( not ( = ?auto_9991 ?auto_10002 ) ) ( not ( = ?auto_9989 ?auto_10002 ) ) ( not ( = ?auto_9992 ?auto_10002 ) ) ( not ( = ?auto_9998 ?auto_10002 ) ) ( not ( = ?auto_10003 ?auto_10002 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9990 ?auto_9991 )
      ( MAKE-2CRATE-VERIFY ?auto_9989 ?auto_9990 ?auto_9991 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10005 - SURFACE
      ?auto_10006 - SURFACE
      ?auto_10007 - SURFACE
      ?auto_10008 - SURFACE
    )
    :vars
    (
      ?auto_10011 - HOIST
      ?auto_10018 - PLACE
      ?auto_10012 - PLACE
      ?auto_10014 - HOIST
      ?auto_10015 - SURFACE
      ?auto_10016 - PLACE
      ?auto_10009 - HOIST
      ?auto_10013 - SURFACE
      ?auto_10020 - TRUCK
      ?auto_10019 - PLACE
      ?auto_10017 - HOIST
      ?auto_10010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10011 ?auto_10018 ) ( IS-CRATE ?auto_10008 ) ( not ( = ?auto_10007 ?auto_10008 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10012 ?auto_10018 ) ) ( HOIST-AT ?auto_10014 ?auto_10012 ) ( not ( = ?auto_10011 ?auto_10014 ) ) ( AVAILABLE ?auto_10014 ) ( SURFACE-AT ?auto_10008 ?auto_10012 ) ( ON ?auto_10008 ?auto_10015 ) ( CLEAR ?auto_10008 ) ( not ( = ?auto_10007 ?auto_10015 ) ) ( not ( = ?auto_10008 ?auto_10015 ) ) ( not ( = ?auto_10006 ?auto_10015 ) ) ( IS-CRATE ?auto_10007 ) ( not ( = ?auto_10016 ?auto_10018 ) ) ( not ( = ?auto_10012 ?auto_10016 ) ) ( HOIST-AT ?auto_10009 ?auto_10016 ) ( not ( = ?auto_10011 ?auto_10009 ) ) ( not ( = ?auto_10014 ?auto_10009 ) ) ( AVAILABLE ?auto_10009 ) ( SURFACE-AT ?auto_10007 ?auto_10016 ) ( ON ?auto_10007 ?auto_10013 ) ( CLEAR ?auto_10007 ) ( not ( = ?auto_10007 ?auto_10013 ) ) ( not ( = ?auto_10008 ?auto_10013 ) ) ( not ( = ?auto_10006 ?auto_10013 ) ) ( not ( = ?auto_10015 ?auto_10013 ) ) ( SURFACE-AT ?auto_10005 ?auto_10018 ) ( CLEAR ?auto_10005 ) ( IS-CRATE ?auto_10006 ) ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_10007 ?auto_10005 ) ) ( not ( = ?auto_10008 ?auto_10005 ) ) ( not ( = ?auto_10015 ?auto_10005 ) ) ( not ( = ?auto_10013 ?auto_10005 ) ) ( AVAILABLE ?auto_10011 ) ( TRUCK-AT ?auto_10020 ?auto_10019 ) ( not ( = ?auto_10019 ?auto_10018 ) ) ( not ( = ?auto_10012 ?auto_10019 ) ) ( not ( = ?auto_10016 ?auto_10019 ) ) ( HOIST-AT ?auto_10017 ?auto_10019 ) ( not ( = ?auto_10011 ?auto_10017 ) ) ( not ( = ?auto_10014 ?auto_10017 ) ) ( not ( = ?auto_10009 ?auto_10017 ) ) ( AVAILABLE ?auto_10017 ) ( SURFACE-AT ?auto_10006 ?auto_10019 ) ( ON ?auto_10006 ?auto_10010 ) ( CLEAR ?auto_10006 ) ( not ( = ?auto_10007 ?auto_10010 ) ) ( not ( = ?auto_10008 ?auto_10010 ) ) ( not ( = ?auto_10006 ?auto_10010 ) ) ( not ( = ?auto_10015 ?auto_10010 ) ) ( not ( = ?auto_10013 ?auto_10010 ) ) ( not ( = ?auto_10005 ?auto_10010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10006 ?auto_10007 ?auto_10008 )
      ( MAKE-3CRATE-VERIFY ?auto_10005 ?auto_10006 ?auto_10007 ?auto_10008 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10021 - SURFACE
      ?auto_10022 - SURFACE
    )
    :vars
    (
      ?auto_10025 - HOIST
      ?auto_10032 - PLACE
      ?auto_10034 - SURFACE
      ?auto_10026 - PLACE
      ?auto_10028 - HOIST
      ?auto_10029 - SURFACE
      ?auto_10030 - PLACE
      ?auto_10023 - HOIST
      ?auto_10027 - SURFACE
      ?auto_10035 - SURFACE
      ?auto_10033 - PLACE
      ?auto_10031 - HOIST
      ?auto_10024 - SURFACE
      ?auto_10036 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10025 ?auto_10032 ) ( IS-CRATE ?auto_10022 ) ( not ( = ?auto_10021 ?auto_10022 ) ) ( not ( = ?auto_10034 ?auto_10021 ) ) ( not ( = ?auto_10034 ?auto_10022 ) ) ( not ( = ?auto_10026 ?auto_10032 ) ) ( HOIST-AT ?auto_10028 ?auto_10026 ) ( not ( = ?auto_10025 ?auto_10028 ) ) ( AVAILABLE ?auto_10028 ) ( SURFACE-AT ?auto_10022 ?auto_10026 ) ( ON ?auto_10022 ?auto_10029 ) ( CLEAR ?auto_10022 ) ( not ( = ?auto_10021 ?auto_10029 ) ) ( not ( = ?auto_10022 ?auto_10029 ) ) ( not ( = ?auto_10034 ?auto_10029 ) ) ( IS-CRATE ?auto_10021 ) ( not ( = ?auto_10030 ?auto_10032 ) ) ( not ( = ?auto_10026 ?auto_10030 ) ) ( HOIST-AT ?auto_10023 ?auto_10030 ) ( not ( = ?auto_10025 ?auto_10023 ) ) ( not ( = ?auto_10028 ?auto_10023 ) ) ( AVAILABLE ?auto_10023 ) ( SURFACE-AT ?auto_10021 ?auto_10030 ) ( ON ?auto_10021 ?auto_10027 ) ( CLEAR ?auto_10021 ) ( not ( = ?auto_10021 ?auto_10027 ) ) ( not ( = ?auto_10022 ?auto_10027 ) ) ( not ( = ?auto_10034 ?auto_10027 ) ) ( not ( = ?auto_10029 ?auto_10027 ) ) ( SURFACE-AT ?auto_10035 ?auto_10032 ) ( CLEAR ?auto_10035 ) ( IS-CRATE ?auto_10034 ) ( not ( = ?auto_10035 ?auto_10034 ) ) ( not ( = ?auto_10021 ?auto_10035 ) ) ( not ( = ?auto_10022 ?auto_10035 ) ) ( not ( = ?auto_10029 ?auto_10035 ) ) ( not ( = ?auto_10027 ?auto_10035 ) ) ( AVAILABLE ?auto_10025 ) ( not ( = ?auto_10033 ?auto_10032 ) ) ( not ( = ?auto_10026 ?auto_10033 ) ) ( not ( = ?auto_10030 ?auto_10033 ) ) ( HOIST-AT ?auto_10031 ?auto_10033 ) ( not ( = ?auto_10025 ?auto_10031 ) ) ( not ( = ?auto_10028 ?auto_10031 ) ) ( not ( = ?auto_10023 ?auto_10031 ) ) ( AVAILABLE ?auto_10031 ) ( SURFACE-AT ?auto_10034 ?auto_10033 ) ( ON ?auto_10034 ?auto_10024 ) ( CLEAR ?auto_10034 ) ( not ( = ?auto_10021 ?auto_10024 ) ) ( not ( = ?auto_10022 ?auto_10024 ) ) ( not ( = ?auto_10034 ?auto_10024 ) ) ( not ( = ?auto_10029 ?auto_10024 ) ) ( not ( = ?auto_10027 ?auto_10024 ) ) ( not ( = ?auto_10035 ?auto_10024 ) ) ( TRUCK-AT ?auto_10036 ?auto_10032 ) )
    :subtasks
    ( ( !DRIVE ?auto_10036 ?auto_10032 ?auto_10033 )
      ( MAKE-2CRATE ?auto_10034 ?auto_10021 ?auto_10022 )
      ( MAKE-1CRATE-VERIFY ?auto_10021 ?auto_10022 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10037 - SURFACE
      ?auto_10038 - SURFACE
      ?auto_10039 - SURFACE
    )
    :vars
    (
      ?auto_10049 - HOIST
      ?auto_10041 - PLACE
      ?auto_10052 - PLACE
      ?auto_10044 - HOIST
      ?auto_10051 - SURFACE
      ?auto_10050 - PLACE
      ?auto_10043 - HOIST
      ?auto_10047 - SURFACE
      ?auto_10045 - SURFACE
      ?auto_10042 - PLACE
      ?auto_10048 - HOIST
      ?auto_10046 - SURFACE
      ?auto_10040 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10049 ?auto_10041 ) ( IS-CRATE ?auto_10039 ) ( not ( = ?auto_10038 ?auto_10039 ) ) ( not ( = ?auto_10037 ?auto_10038 ) ) ( not ( = ?auto_10037 ?auto_10039 ) ) ( not ( = ?auto_10052 ?auto_10041 ) ) ( HOIST-AT ?auto_10044 ?auto_10052 ) ( not ( = ?auto_10049 ?auto_10044 ) ) ( AVAILABLE ?auto_10044 ) ( SURFACE-AT ?auto_10039 ?auto_10052 ) ( ON ?auto_10039 ?auto_10051 ) ( CLEAR ?auto_10039 ) ( not ( = ?auto_10038 ?auto_10051 ) ) ( not ( = ?auto_10039 ?auto_10051 ) ) ( not ( = ?auto_10037 ?auto_10051 ) ) ( IS-CRATE ?auto_10038 ) ( not ( = ?auto_10050 ?auto_10041 ) ) ( not ( = ?auto_10052 ?auto_10050 ) ) ( HOIST-AT ?auto_10043 ?auto_10050 ) ( not ( = ?auto_10049 ?auto_10043 ) ) ( not ( = ?auto_10044 ?auto_10043 ) ) ( AVAILABLE ?auto_10043 ) ( SURFACE-AT ?auto_10038 ?auto_10050 ) ( ON ?auto_10038 ?auto_10047 ) ( CLEAR ?auto_10038 ) ( not ( = ?auto_10038 ?auto_10047 ) ) ( not ( = ?auto_10039 ?auto_10047 ) ) ( not ( = ?auto_10037 ?auto_10047 ) ) ( not ( = ?auto_10051 ?auto_10047 ) ) ( SURFACE-AT ?auto_10045 ?auto_10041 ) ( CLEAR ?auto_10045 ) ( IS-CRATE ?auto_10037 ) ( not ( = ?auto_10045 ?auto_10037 ) ) ( not ( = ?auto_10038 ?auto_10045 ) ) ( not ( = ?auto_10039 ?auto_10045 ) ) ( not ( = ?auto_10051 ?auto_10045 ) ) ( not ( = ?auto_10047 ?auto_10045 ) ) ( AVAILABLE ?auto_10049 ) ( not ( = ?auto_10042 ?auto_10041 ) ) ( not ( = ?auto_10052 ?auto_10042 ) ) ( not ( = ?auto_10050 ?auto_10042 ) ) ( HOIST-AT ?auto_10048 ?auto_10042 ) ( not ( = ?auto_10049 ?auto_10048 ) ) ( not ( = ?auto_10044 ?auto_10048 ) ) ( not ( = ?auto_10043 ?auto_10048 ) ) ( AVAILABLE ?auto_10048 ) ( SURFACE-AT ?auto_10037 ?auto_10042 ) ( ON ?auto_10037 ?auto_10046 ) ( CLEAR ?auto_10037 ) ( not ( = ?auto_10038 ?auto_10046 ) ) ( not ( = ?auto_10039 ?auto_10046 ) ) ( not ( = ?auto_10037 ?auto_10046 ) ) ( not ( = ?auto_10051 ?auto_10046 ) ) ( not ( = ?auto_10047 ?auto_10046 ) ) ( not ( = ?auto_10045 ?auto_10046 ) ) ( TRUCK-AT ?auto_10040 ?auto_10041 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10038 ?auto_10039 )
      ( MAKE-2CRATE-VERIFY ?auto_10037 ?auto_10038 ?auto_10039 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10053 - SURFACE
      ?auto_10054 - SURFACE
      ?auto_10055 - SURFACE
      ?auto_10056 - SURFACE
    )
    :vars
    (
      ?auto_10060 - HOIST
      ?auto_10059 - PLACE
      ?auto_10065 - PLACE
      ?auto_10068 - HOIST
      ?auto_10066 - SURFACE
      ?auto_10063 - PLACE
      ?auto_10064 - HOIST
      ?auto_10067 - SURFACE
      ?auto_10061 - PLACE
      ?auto_10062 - HOIST
      ?auto_10058 - SURFACE
      ?auto_10057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10060 ?auto_10059 ) ( IS-CRATE ?auto_10056 ) ( not ( = ?auto_10055 ?auto_10056 ) ) ( not ( = ?auto_10054 ?auto_10055 ) ) ( not ( = ?auto_10054 ?auto_10056 ) ) ( not ( = ?auto_10065 ?auto_10059 ) ) ( HOIST-AT ?auto_10068 ?auto_10065 ) ( not ( = ?auto_10060 ?auto_10068 ) ) ( AVAILABLE ?auto_10068 ) ( SURFACE-AT ?auto_10056 ?auto_10065 ) ( ON ?auto_10056 ?auto_10066 ) ( CLEAR ?auto_10056 ) ( not ( = ?auto_10055 ?auto_10066 ) ) ( not ( = ?auto_10056 ?auto_10066 ) ) ( not ( = ?auto_10054 ?auto_10066 ) ) ( IS-CRATE ?auto_10055 ) ( not ( = ?auto_10063 ?auto_10059 ) ) ( not ( = ?auto_10065 ?auto_10063 ) ) ( HOIST-AT ?auto_10064 ?auto_10063 ) ( not ( = ?auto_10060 ?auto_10064 ) ) ( not ( = ?auto_10068 ?auto_10064 ) ) ( AVAILABLE ?auto_10064 ) ( SURFACE-AT ?auto_10055 ?auto_10063 ) ( ON ?auto_10055 ?auto_10067 ) ( CLEAR ?auto_10055 ) ( not ( = ?auto_10055 ?auto_10067 ) ) ( not ( = ?auto_10056 ?auto_10067 ) ) ( not ( = ?auto_10054 ?auto_10067 ) ) ( not ( = ?auto_10066 ?auto_10067 ) ) ( SURFACE-AT ?auto_10053 ?auto_10059 ) ( CLEAR ?auto_10053 ) ( IS-CRATE ?auto_10054 ) ( not ( = ?auto_10053 ?auto_10054 ) ) ( not ( = ?auto_10055 ?auto_10053 ) ) ( not ( = ?auto_10056 ?auto_10053 ) ) ( not ( = ?auto_10066 ?auto_10053 ) ) ( not ( = ?auto_10067 ?auto_10053 ) ) ( AVAILABLE ?auto_10060 ) ( not ( = ?auto_10061 ?auto_10059 ) ) ( not ( = ?auto_10065 ?auto_10061 ) ) ( not ( = ?auto_10063 ?auto_10061 ) ) ( HOIST-AT ?auto_10062 ?auto_10061 ) ( not ( = ?auto_10060 ?auto_10062 ) ) ( not ( = ?auto_10068 ?auto_10062 ) ) ( not ( = ?auto_10064 ?auto_10062 ) ) ( AVAILABLE ?auto_10062 ) ( SURFACE-AT ?auto_10054 ?auto_10061 ) ( ON ?auto_10054 ?auto_10058 ) ( CLEAR ?auto_10054 ) ( not ( = ?auto_10055 ?auto_10058 ) ) ( not ( = ?auto_10056 ?auto_10058 ) ) ( not ( = ?auto_10054 ?auto_10058 ) ) ( not ( = ?auto_10066 ?auto_10058 ) ) ( not ( = ?auto_10067 ?auto_10058 ) ) ( not ( = ?auto_10053 ?auto_10058 ) ) ( TRUCK-AT ?auto_10057 ?auto_10059 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10054 ?auto_10055 ?auto_10056 )
      ( MAKE-3CRATE-VERIFY ?auto_10053 ?auto_10054 ?auto_10055 ?auto_10056 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10083 - SURFACE
      ?auto_10084 - SURFACE
    )
    :vars
    (
      ?auto_10085 - HOIST
      ?auto_10086 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10085 ?auto_10086 ) ( SURFACE-AT ?auto_10083 ?auto_10086 ) ( CLEAR ?auto_10083 ) ( LIFTING ?auto_10085 ?auto_10084 ) ( IS-CRATE ?auto_10084 ) ( not ( = ?auto_10083 ?auto_10084 ) ) )
    :subtasks
    ( ( !DROP ?auto_10085 ?auto_10084 ?auto_10083 ?auto_10086 )
      ( MAKE-1CRATE-VERIFY ?auto_10083 ?auto_10084 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10087 - SURFACE
      ?auto_10088 - SURFACE
      ?auto_10089 - SURFACE
    )
    :vars
    (
      ?auto_10090 - HOIST
      ?auto_10091 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10090 ?auto_10091 ) ( SURFACE-AT ?auto_10088 ?auto_10091 ) ( CLEAR ?auto_10088 ) ( LIFTING ?auto_10090 ?auto_10089 ) ( IS-CRATE ?auto_10089 ) ( not ( = ?auto_10088 ?auto_10089 ) ) ( ON ?auto_10088 ?auto_10087 ) ( not ( = ?auto_10087 ?auto_10088 ) ) ( not ( = ?auto_10087 ?auto_10089 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10088 ?auto_10089 )
      ( MAKE-2CRATE-VERIFY ?auto_10087 ?auto_10088 ?auto_10089 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10092 - SURFACE
      ?auto_10093 - SURFACE
      ?auto_10094 - SURFACE
      ?auto_10095 - SURFACE
    )
    :vars
    (
      ?auto_10096 - HOIST
      ?auto_10097 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10096 ?auto_10097 ) ( SURFACE-AT ?auto_10094 ?auto_10097 ) ( CLEAR ?auto_10094 ) ( LIFTING ?auto_10096 ?auto_10095 ) ( IS-CRATE ?auto_10095 ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( ON ?auto_10093 ?auto_10092 ) ( ON ?auto_10094 ?auto_10093 ) ( not ( = ?auto_10092 ?auto_10093 ) ) ( not ( = ?auto_10092 ?auto_10094 ) ) ( not ( = ?auto_10092 ?auto_10095 ) ) ( not ( = ?auto_10093 ?auto_10094 ) ) ( not ( = ?auto_10093 ?auto_10095 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10094 ?auto_10095 )
      ( MAKE-3CRATE-VERIFY ?auto_10092 ?auto_10093 ?auto_10094 ?auto_10095 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10098 - SURFACE
      ?auto_10099 - SURFACE
      ?auto_10100 - SURFACE
      ?auto_10101 - SURFACE
      ?auto_10102 - SURFACE
    )
    :vars
    (
      ?auto_10103 - HOIST
      ?auto_10104 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10103 ?auto_10104 ) ( SURFACE-AT ?auto_10101 ?auto_10104 ) ( CLEAR ?auto_10101 ) ( LIFTING ?auto_10103 ?auto_10102 ) ( IS-CRATE ?auto_10102 ) ( not ( = ?auto_10101 ?auto_10102 ) ) ( ON ?auto_10099 ?auto_10098 ) ( ON ?auto_10100 ?auto_10099 ) ( ON ?auto_10101 ?auto_10100 ) ( not ( = ?auto_10098 ?auto_10099 ) ) ( not ( = ?auto_10098 ?auto_10100 ) ) ( not ( = ?auto_10098 ?auto_10101 ) ) ( not ( = ?auto_10098 ?auto_10102 ) ) ( not ( = ?auto_10099 ?auto_10100 ) ) ( not ( = ?auto_10099 ?auto_10101 ) ) ( not ( = ?auto_10099 ?auto_10102 ) ) ( not ( = ?auto_10100 ?auto_10101 ) ) ( not ( = ?auto_10100 ?auto_10102 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10101 ?auto_10102 )
      ( MAKE-4CRATE-VERIFY ?auto_10098 ?auto_10099 ?auto_10100 ?auto_10101 ?auto_10102 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10105 - SURFACE
      ?auto_10106 - SURFACE
    )
    :vars
    (
      ?auto_10107 - HOIST
      ?auto_10108 - PLACE
      ?auto_10109 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10107 ?auto_10108 ) ( SURFACE-AT ?auto_10105 ?auto_10108 ) ( CLEAR ?auto_10105 ) ( IS-CRATE ?auto_10106 ) ( not ( = ?auto_10105 ?auto_10106 ) ) ( TRUCK-AT ?auto_10109 ?auto_10108 ) ( AVAILABLE ?auto_10107 ) ( IN ?auto_10106 ?auto_10109 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10107 ?auto_10106 ?auto_10109 ?auto_10108 )
      ( MAKE-1CRATE ?auto_10105 ?auto_10106 )
      ( MAKE-1CRATE-VERIFY ?auto_10105 ?auto_10106 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10110 - SURFACE
      ?auto_10111 - SURFACE
      ?auto_10112 - SURFACE
    )
    :vars
    (
      ?auto_10114 - HOIST
      ?auto_10115 - PLACE
      ?auto_10113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10114 ?auto_10115 ) ( SURFACE-AT ?auto_10111 ?auto_10115 ) ( CLEAR ?auto_10111 ) ( IS-CRATE ?auto_10112 ) ( not ( = ?auto_10111 ?auto_10112 ) ) ( TRUCK-AT ?auto_10113 ?auto_10115 ) ( AVAILABLE ?auto_10114 ) ( IN ?auto_10112 ?auto_10113 ) ( ON ?auto_10111 ?auto_10110 ) ( not ( = ?auto_10110 ?auto_10111 ) ) ( not ( = ?auto_10110 ?auto_10112 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10111 ?auto_10112 )
      ( MAKE-2CRATE-VERIFY ?auto_10110 ?auto_10111 ?auto_10112 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10116 - SURFACE
      ?auto_10117 - SURFACE
      ?auto_10118 - SURFACE
      ?auto_10119 - SURFACE
    )
    :vars
    (
      ?auto_10122 - HOIST
      ?auto_10121 - PLACE
      ?auto_10120 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10122 ?auto_10121 ) ( SURFACE-AT ?auto_10118 ?auto_10121 ) ( CLEAR ?auto_10118 ) ( IS-CRATE ?auto_10119 ) ( not ( = ?auto_10118 ?auto_10119 ) ) ( TRUCK-AT ?auto_10120 ?auto_10121 ) ( AVAILABLE ?auto_10122 ) ( IN ?auto_10119 ?auto_10120 ) ( ON ?auto_10118 ?auto_10117 ) ( not ( = ?auto_10117 ?auto_10118 ) ) ( not ( = ?auto_10117 ?auto_10119 ) ) ( ON ?auto_10117 ?auto_10116 ) ( not ( = ?auto_10116 ?auto_10117 ) ) ( not ( = ?auto_10116 ?auto_10118 ) ) ( not ( = ?auto_10116 ?auto_10119 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10117 ?auto_10118 ?auto_10119 )
      ( MAKE-3CRATE-VERIFY ?auto_10116 ?auto_10117 ?auto_10118 ?auto_10119 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10123 - SURFACE
      ?auto_10124 - SURFACE
      ?auto_10125 - SURFACE
      ?auto_10126 - SURFACE
      ?auto_10127 - SURFACE
    )
    :vars
    (
      ?auto_10130 - HOIST
      ?auto_10129 - PLACE
      ?auto_10128 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10130 ?auto_10129 ) ( SURFACE-AT ?auto_10126 ?auto_10129 ) ( CLEAR ?auto_10126 ) ( IS-CRATE ?auto_10127 ) ( not ( = ?auto_10126 ?auto_10127 ) ) ( TRUCK-AT ?auto_10128 ?auto_10129 ) ( AVAILABLE ?auto_10130 ) ( IN ?auto_10127 ?auto_10128 ) ( ON ?auto_10126 ?auto_10125 ) ( not ( = ?auto_10125 ?auto_10126 ) ) ( not ( = ?auto_10125 ?auto_10127 ) ) ( ON ?auto_10124 ?auto_10123 ) ( ON ?auto_10125 ?auto_10124 ) ( not ( = ?auto_10123 ?auto_10124 ) ) ( not ( = ?auto_10123 ?auto_10125 ) ) ( not ( = ?auto_10123 ?auto_10126 ) ) ( not ( = ?auto_10123 ?auto_10127 ) ) ( not ( = ?auto_10124 ?auto_10125 ) ) ( not ( = ?auto_10124 ?auto_10126 ) ) ( not ( = ?auto_10124 ?auto_10127 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10125 ?auto_10126 ?auto_10127 )
      ( MAKE-4CRATE-VERIFY ?auto_10123 ?auto_10124 ?auto_10125 ?auto_10126 ?auto_10127 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10131 - SURFACE
      ?auto_10132 - SURFACE
    )
    :vars
    (
      ?auto_10136 - HOIST
      ?auto_10134 - PLACE
      ?auto_10133 - TRUCK
      ?auto_10135 - SURFACE
      ?auto_10137 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10136 ?auto_10134 ) ( SURFACE-AT ?auto_10131 ?auto_10134 ) ( CLEAR ?auto_10131 ) ( IS-CRATE ?auto_10132 ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( AVAILABLE ?auto_10136 ) ( IN ?auto_10132 ?auto_10133 ) ( ON ?auto_10131 ?auto_10135 ) ( not ( = ?auto_10135 ?auto_10131 ) ) ( not ( = ?auto_10135 ?auto_10132 ) ) ( TRUCK-AT ?auto_10133 ?auto_10137 ) ( not ( = ?auto_10137 ?auto_10134 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10133 ?auto_10137 ?auto_10134 )
      ( MAKE-2CRATE ?auto_10135 ?auto_10131 ?auto_10132 )
      ( MAKE-1CRATE-VERIFY ?auto_10131 ?auto_10132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10138 - SURFACE
      ?auto_10139 - SURFACE
      ?auto_10140 - SURFACE
    )
    :vars
    (
      ?auto_10142 - HOIST
      ?auto_10141 - PLACE
      ?auto_10144 - TRUCK
      ?auto_10143 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10142 ?auto_10141 ) ( SURFACE-AT ?auto_10139 ?auto_10141 ) ( CLEAR ?auto_10139 ) ( IS-CRATE ?auto_10140 ) ( not ( = ?auto_10139 ?auto_10140 ) ) ( AVAILABLE ?auto_10142 ) ( IN ?auto_10140 ?auto_10144 ) ( ON ?auto_10139 ?auto_10138 ) ( not ( = ?auto_10138 ?auto_10139 ) ) ( not ( = ?auto_10138 ?auto_10140 ) ) ( TRUCK-AT ?auto_10144 ?auto_10143 ) ( not ( = ?auto_10143 ?auto_10141 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10139 ?auto_10140 )
      ( MAKE-2CRATE-VERIFY ?auto_10138 ?auto_10139 ?auto_10140 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10145 - SURFACE
      ?auto_10146 - SURFACE
      ?auto_10147 - SURFACE
      ?auto_10148 - SURFACE
    )
    :vars
    (
      ?auto_10152 - HOIST
      ?auto_10149 - PLACE
      ?auto_10151 - TRUCK
      ?auto_10150 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10152 ?auto_10149 ) ( SURFACE-AT ?auto_10147 ?auto_10149 ) ( CLEAR ?auto_10147 ) ( IS-CRATE ?auto_10148 ) ( not ( = ?auto_10147 ?auto_10148 ) ) ( AVAILABLE ?auto_10152 ) ( IN ?auto_10148 ?auto_10151 ) ( ON ?auto_10147 ?auto_10146 ) ( not ( = ?auto_10146 ?auto_10147 ) ) ( not ( = ?auto_10146 ?auto_10148 ) ) ( TRUCK-AT ?auto_10151 ?auto_10150 ) ( not ( = ?auto_10150 ?auto_10149 ) ) ( ON ?auto_10146 ?auto_10145 ) ( not ( = ?auto_10145 ?auto_10146 ) ) ( not ( = ?auto_10145 ?auto_10147 ) ) ( not ( = ?auto_10145 ?auto_10148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10146 ?auto_10147 ?auto_10148 )
      ( MAKE-3CRATE-VERIFY ?auto_10145 ?auto_10146 ?auto_10147 ?auto_10148 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10153 - SURFACE
      ?auto_10154 - SURFACE
      ?auto_10155 - SURFACE
      ?auto_10156 - SURFACE
      ?auto_10157 - SURFACE
    )
    :vars
    (
      ?auto_10161 - HOIST
      ?auto_10158 - PLACE
      ?auto_10160 - TRUCK
      ?auto_10159 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10161 ?auto_10158 ) ( SURFACE-AT ?auto_10156 ?auto_10158 ) ( CLEAR ?auto_10156 ) ( IS-CRATE ?auto_10157 ) ( not ( = ?auto_10156 ?auto_10157 ) ) ( AVAILABLE ?auto_10161 ) ( IN ?auto_10157 ?auto_10160 ) ( ON ?auto_10156 ?auto_10155 ) ( not ( = ?auto_10155 ?auto_10156 ) ) ( not ( = ?auto_10155 ?auto_10157 ) ) ( TRUCK-AT ?auto_10160 ?auto_10159 ) ( not ( = ?auto_10159 ?auto_10158 ) ) ( ON ?auto_10154 ?auto_10153 ) ( ON ?auto_10155 ?auto_10154 ) ( not ( = ?auto_10153 ?auto_10154 ) ) ( not ( = ?auto_10153 ?auto_10155 ) ) ( not ( = ?auto_10153 ?auto_10156 ) ) ( not ( = ?auto_10153 ?auto_10157 ) ) ( not ( = ?auto_10154 ?auto_10155 ) ) ( not ( = ?auto_10154 ?auto_10156 ) ) ( not ( = ?auto_10154 ?auto_10157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10155 ?auto_10156 ?auto_10157 )
      ( MAKE-4CRATE-VERIFY ?auto_10153 ?auto_10154 ?auto_10155 ?auto_10156 ?auto_10157 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10162 - SURFACE
      ?auto_10163 - SURFACE
    )
    :vars
    (
      ?auto_10168 - HOIST
      ?auto_10165 - PLACE
      ?auto_10164 - SURFACE
      ?auto_10167 - TRUCK
      ?auto_10166 - PLACE
      ?auto_10169 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10168 ?auto_10165 ) ( SURFACE-AT ?auto_10162 ?auto_10165 ) ( CLEAR ?auto_10162 ) ( IS-CRATE ?auto_10163 ) ( not ( = ?auto_10162 ?auto_10163 ) ) ( AVAILABLE ?auto_10168 ) ( ON ?auto_10162 ?auto_10164 ) ( not ( = ?auto_10164 ?auto_10162 ) ) ( not ( = ?auto_10164 ?auto_10163 ) ) ( TRUCK-AT ?auto_10167 ?auto_10166 ) ( not ( = ?auto_10166 ?auto_10165 ) ) ( HOIST-AT ?auto_10169 ?auto_10166 ) ( LIFTING ?auto_10169 ?auto_10163 ) ( not ( = ?auto_10168 ?auto_10169 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10169 ?auto_10163 ?auto_10167 ?auto_10166 )
      ( MAKE-2CRATE ?auto_10164 ?auto_10162 ?auto_10163 )
      ( MAKE-1CRATE-VERIFY ?auto_10162 ?auto_10163 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10170 - SURFACE
      ?auto_10171 - SURFACE
      ?auto_10172 - SURFACE
    )
    :vars
    (
      ?auto_10175 - HOIST
      ?auto_10173 - PLACE
      ?auto_10177 - TRUCK
      ?auto_10176 - PLACE
      ?auto_10174 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10175 ?auto_10173 ) ( SURFACE-AT ?auto_10171 ?auto_10173 ) ( CLEAR ?auto_10171 ) ( IS-CRATE ?auto_10172 ) ( not ( = ?auto_10171 ?auto_10172 ) ) ( AVAILABLE ?auto_10175 ) ( ON ?auto_10171 ?auto_10170 ) ( not ( = ?auto_10170 ?auto_10171 ) ) ( not ( = ?auto_10170 ?auto_10172 ) ) ( TRUCK-AT ?auto_10177 ?auto_10176 ) ( not ( = ?auto_10176 ?auto_10173 ) ) ( HOIST-AT ?auto_10174 ?auto_10176 ) ( LIFTING ?auto_10174 ?auto_10172 ) ( not ( = ?auto_10175 ?auto_10174 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10171 ?auto_10172 )
      ( MAKE-2CRATE-VERIFY ?auto_10170 ?auto_10171 ?auto_10172 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10178 - SURFACE
      ?auto_10179 - SURFACE
      ?auto_10180 - SURFACE
      ?auto_10181 - SURFACE
    )
    :vars
    (
      ?auto_10186 - HOIST
      ?auto_10184 - PLACE
      ?auto_10185 - TRUCK
      ?auto_10182 - PLACE
      ?auto_10183 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10186 ?auto_10184 ) ( SURFACE-AT ?auto_10180 ?auto_10184 ) ( CLEAR ?auto_10180 ) ( IS-CRATE ?auto_10181 ) ( not ( = ?auto_10180 ?auto_10181 ) ) ( AVAILABLE ?auto_10186 ) ( ON ?auto_10180 ?auto_10179 ) ( not ( = ?auto_10179 ?auto_10180 ) ) ( not ( = ?auto_10179 ?auto_10181 ) ) ( TRUCK-AT ?auto_10185 ?auto_10182 ) ( not ( = ?auto_10182 ?auto_10184 ) ) ( HOIST-AT ?auto_10183 ?auto_10182 ) ( LIFTING ?auto_10183 ?auto_10181 ) ( not ( = ?auto_10186 ?auto_10183 ) ) ( ON ?auto_10179 ?auto_10178 ) ( not ( = ?auto_10178 ?auto_10179 ) ) ( not ( = ?auto_10178 ?auto_10180 ) ) ( not ( = ?auto_10178 ?auto_10181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10179 ?auto_10180 ?auto_10181 )
      ( MAKE-3CRATE-VERIFY ?auto_10178 ?auto_10179 ?auto_10180 ?auto_10181 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10187 - SURFACE
      ?auto_10188 - SURFACE
      ?auto_10189 - SURFACE
      ?auto_10190 - SURFACE
      ?auto_10191 - SURFACE
    )
    :vars
    (
      ?auto_10196 - HOIST
      ?auto_10194 - PLACE
      ?auto_10195 - TRUCK
      ?auto_10192 - PLACE
      ?auto_10193 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10196 ?auto_10194 ) ( SURFACE-AT ?auto_10190 ?auto_10194 ) ( CLEAR ?auto_10190 ) ( IS-CRATE ?auto_10191 ) ( not ( = ?auto_10190 ?auto_10191 ) ) ( AVAILABLE ?auto_10196 ) ( ON ?auto_10190 ?auto_10189 ) ( not ( = ?auto_10189 ?auto_10190 ) ) ( not ( = ?auto_10189 ?auto_10191 ) ) ( TRUCK-AT ?auto_10195 ?auto_10192 ) ( not ( = ?auto_10192 ?auto_10194 ) ) ( HOIST-AT ?auto_10193 ?auto_10192 ) ( LIFTING ?auto_10193 ?auto_10191 ) ( not ( = ?auto_10196 ?auto_10193 ) ) ( ON ?auto_10188 ?auto_10187 ) ( ON ?auto_10189 ?auto_10188 ) ( not ( = ?auto_10187 ?auto_10188 ) ) ( not ( = ?auto_10187 ?auto_10189 ) ) ( not ( = ?auto_10187 ?auto_10190 ) ) ( not ( = ?auto_10187 ?auto_10191 ) ) ( not ( = ?auto_10188 ?auto_10189 ) ) ( not ( = ?auto_10188 ?auto_10190 ) ) ( not ( = ?auto_10188 ?auto_10191 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10189 ?auto_10190 ?auto_10191 )
      ( MAKE-4CRATE-VERIFY ?auto_10187 ?auto_10188 ?auto_10189 ?auto_10190 ?auto_10191 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10197 - SURFACE
      ?auto_10198 - SURFACE
    )
    :vars
    (
      ?auto_10203 - HOIST
      ?auto_10201 - PLACE
      ?auto_10204 - SURFACE
      ?auto_10202 - TRUCK
      ?auto_10199 - PLACE
      ?auto_10200 - HOIST
      ?auto_10205 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10203 ?auto_10201 ) ( SURFACE-AT ?auto_10197 ?auto_10201 ) ( CLEAR ?auto_10197 ) ( IS-CRATE ?auto_10198 ) ( not ( = ?auto_10197 ?auto_10198 ) ) ( AVAILABLE ?auto_10203 ) ( ON ?auto_10197 ?auto_10204 ) ( not ( = ?auto_10204 ?auto_10197 ) ) ( not ( = ?auto_10204 ?auto_10198 ) ) ( TRUCK-AT ?auto_10202 ?auto_10199 ) ( not ( = ?auto_10199 ?auto_10201 ) ) ( HOIST-AT ?auto_10200 ?auto_10199 ) ( not ( = ?auto_10203 ?auto_10200 ) ) ( AVAILABLE ?auto_10200 ) ( SURFACE-AT ?auto_10198 ?auto_10199 ) ( ON ?auto_10198 ?auto_10205 ) ( CLEAR ?auto_10198 ) ( not ( = ?auto_10197 ?auto_10205 ) ) ( not ( = ?auto_10198 ?auto_10205 ) ) ( not ( = ?auto_10204 ?auto_10205 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10200 ?auto_10198 ?auto_10205 ?auto_10199 )
      ( MAKE-2CRATE ?auto_10204 ?auto_10197 ?auto_10198 )
      ( MAKE-1CRATE-VERIFY ?auto_10197 ?auto_10198 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10206 - SURFACE
      ?auto_10207 - SURFACE
      ?auto_10208 - SURFACE
    )
    :vars
    (
      ?auto_10209 - HOIST
      ?auto_10210 - PLACE
      ?auto_10213 - TRUCK
      ?auto_10214 - PLACE
      ?auto_10211 - HOIST
      ?auto_10212 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10209 ?auto_10210 ) ( SURFACE-AT ?auto_10207 ?auto_10210 ) ( CLEAR ?auto_10207 ) ( IS-CRATE ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10208 ) ) ( AVAILABLE ?auto_10209 ) ( ON ?auto_10207 ?auto_10206 ) ( not ( = ?auto_10206 ?auto_10207 ) ) ( not ( = ?auto_10206 ?auto_10208 ) ) ( TRUCK-AT ?auto_10213 ?auto_10214 ) ( not ( = ?auto_10214 ?auto_10210 ) ) ( HOIST-AT ?auto_10211 ?auto_10214 ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( AVAILABLE ?auto_10211 ) ( SURFACE-AT ?auto_10208 ?auto_10214 ) ( ON ?auto_10208 ?auto_10212 ) ( CLEAR ?auto_10208 ) ( not ( = ?auto_10207 ?auto_10212 ) ) ( not ( = ?auto_10208 ?auto_10212 ) ) ( not ( = ?auto_10206 ?auto_10212 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10207 ?auto_10208 )
      ( MAKE-2CRATE-VERIFY ?auto_10206 ?auto_10207 ?auto_10208 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10215 - SURFACE
      ?auto_10216 - SURFACE
      ?auto_10217 - SURFACE
      ?auto_10218 - SURFACE
    )
    :vars
    (
      ?auto_10224 - HOIST
      ?auto_10219 - PLACE
      ?auto_10222 - TRUCK
      ?auto_10221 - PLACE
      ?auto_10220 - HOIST
      ?auto_10223 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10224 ?auto_10219 ) ( SURFACE-AT ?auto_10217 ?auto_10219 ) ( CLEAR ?auto_10217 ) ( IS-CRATE ?auto_10218 ) ( not ( = ?auto_10217 ?auto_10218 ) ) ( AVAILABLE ?auto_10224 ) ( ON ?auto_10217 ?auto_10216 ) ( not ( = ?auto_10216 ?auto_10217 ) ) ( not ( = ?auto_10216 ?auto_10218 ) ) ( TRUCK-AT ?auto_10222 ?auto_10221 ) ( not ( = ?auto_10221 ?auto_10219 ) ) ( HOIST-AT ?auto_10220 ?auto_10221 ) ( not ( = ?auto_10224 ?auto_10220 ) ) ( AVAILABLE ?auto_10220 ) ( SURFACE-AT ?auto_10218 ?auto_10221 ) ( ON ?auto_10218 ?auto_10223 ) ( CLEAR ?auto_10218 ) ( not ( = ?auto_10217 ?auto_10223 ) ) ( not ( = ?auto_10218 ?auto_10223 ) ) ( not ( = ?auto_10216 ?auto_10223 ) ) ( ON ?auto_10216 ?auto_10215 ) ( not ( = ?auto_10215 ?auto_10216 ) ) ( not ( = ?auto_10215 ?auto_10217 ) ) ( not ( = ?auto_10215 ?auto_10218 ) ) ( not ( = ?auto_10215 ?auto_10223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10216 ?auto_10217 ?auto_10218 )
      ( MAKE-3CRATE-VERIFY ?auto_10215 ?auto_10216 ?auto_10217 ?auto_10218 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10225 - SURFACE
      ?auto_10226 - SURFACE
      ?auto_10227 - SURFACE
      ?auto_10228 - SURFACE
      ?auto_10229 - SURFACE
    )
    :vars
    (
      ?auto_10235 - HOIST
      ?auto_10230 - PLACE
      ?auto_10233 - TRUCK
      ?auto_10232 - PLACE
      ?auto_10231 - HOIST
      ?auto_10234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10235 ?auto_10230 ) ( SURFACE-AT ?auto_10228 ?auto_10230 ) ( CLEAR ?auto_10228 ) ( IS-CRATE ?auto_10229 ) ( not ( = ?auto_10228 ?auto_10229 ) ) ( AVAILABLE ?auto_10235 ) ( ON ?auto_10228 ?auto_10227 ) ( not ( = ?auto_10227 ?auto_10228 ) ) ( not ( = ?auto_10227 ?auto_10229 ) ) ( TRUCK-AT ?auto_10233 ?auto_10232 ) ( not ( = ?auto_10232 ?auto_10230 ) ) ( HOIST-AT ?auto_10231 ?auto_10232 ) ( not ( = ?auto_10235 ?auto_10231 ) ) ( AVAILABLE ?auto_10231 ) ( SURFACE-AT ?auto_10229 ?auto_10232 ) ( ON ?auto_10229 ?auto_10234 ) ( CLEAR ?auto_10229 ) ( not ( = ?auto_10228 ?auto_10234 ) ) ( not ( = ?auto_10229 ?auto_10234 ) ) ( not ( = ?auto_10227 ?auto_10234 ) ) ( ON ?auto_10226 ?auto_10225 ) ( ON ?auto_10227 ?auto_10226 ) ( not ( = ?auto_10225 ?auto_10226 ) ) ( not ( = ?auto_10225 ?auto_10227 ) ) ( not ( = ?auto_10225 ?auto_10228 ) ) ( not ( = ?auto_10225 ?auto_10229 ) ) ( not ( = ?auto_10225 ?auto_10234 ) ) ( not ( = ?auto_10226 ?auto_10227 ) ) ( not ( = ?auto_10226 ?auto_10228 ) ) ( not ( = ?auto_10226 ?auto_10229 ) ) ( not ( = ?auto_10226 ?auto_10234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10227 ?auto_10228 ?auto_10229 )
      ( MAKE-4CRATE-VERIFY ?auto_10225 ?auto_10226 ?auto_10227 ?auto_10228 ?auto_10229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10236 - SURFACE
      ?auto_10237 - SURFACE
    )
    :vars
    (
      ?auto_10244 - HOIST
      ?auto_10238 - PLACE
      ?auto_10241 - SURFACE
      ?auto_10240 - PLACE
      ?auto_10239 - HOIST
      ?auto_10243 - SURFACE
      ?auto_10242 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10244 ?auto_10238 ) ( SURFACE-AT ?auto_10236 ?auto_10238 ) ( CLEAR ?auto_10236 ) ( IS-CRATE ?auto_10237 ) ( not ( = ?auto_10236 ?auto_10237 ) ) ( AVAILABLE ?auto_10244 ) ( ON ?auto_10236 ?auto_10241 ) ( not ( = ?auto_10241 ?auto_10236 ) ) ( not ( = ?auto_10241 ?auto_10237 ) ) ( not ( = ?auto_10240 ?auto_10238 ) ) ( HOIST-AT ?auto_10239 ?auto_10240 ) ( not ( = ?auto_10244 ?auto_10239 ) ) ( AVAILABLE ?auto_10239 ) ( SURFACE-AT ?auto_10237 ?auto_10240 ) ( ON ?auto_10237 ?auto_10243 ) ( CLEAR ?auto_10237 ) ( not ( = ?auto_10236 ?auto_10243 ) ) ( not ( = ?auto_10237 ?auto_10243 ) ) ( not ( = ?auto_10241 ?auto_10243 ) ) ( TRUCK-AT ?auto_10242 ?auto_10238 ) )
    :subtasks
    ( ( !DRIVE ?auto_10242 ?auto_10238 ?auto_10240 )
      ( MAKE-2CRATE ?auto_10241 ?auto_10236 ?auto_10237 )
      ( MAKE-1CRATE-VERIFY ?auto_10236 ?auto_10237 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10245 - SURFACE
      ?auto_10246 - SURFACE
      ?auto_10247 - SURFACE
    )
    :vars
    (
      ?auto_10249 - HOIST
      ?auto_10253 - PLACE
      ?auto_10252 - PLACE
      ?auto_10248 - HOIST
      ?auto_10251 - SURFACE
      ?auto_10250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10249 ?auto_10253 ) ( SURFACE-AT ?auto_10246 ?auto_10253 ) ( CLEAR ?auto_10246 ) ( IS-CRATE ?auto_10247 ) ( not ( = ?auto_10246 ?auto_10247 ) ) ( AVAILABLE ?auto_10249 ) ( ON ?auto_10246 ?auto_10245 ) ( not ( = ?auto_10245 ?auto_10246 ) ) ( not ( = ?auto_10245 ?auto_10247 ) ) ( not ( = ?auto_10252 ?auto_10253 ) ) ( HOIST-AT ?auto_10248 ?auto_10252 ) ( not ( = ?auto_10249 ?auto_10248 ) ) ( AVAILABLE ?auto_10248 ) ( SURFACE-AT ?auto_10247 ?auto_10252 ) ( ON ?auto_10247 ?auto_10251 ) ( CLEAR ?auto_10247 ) ( not ( = ?auto_10246 ?auto_10251 ) ) ( not ( = ?auto_10247 ?auto_10251 ) ) ( not ( = ?auto_10245 ?auto_10251 ) ) ( TRUCK-AT ?auto_10250 ?auto_10253 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10246 ?auto_10247 )
      ( MAKE-2CRATE-VERIFY ?auto_10245 ?auto_10246 ?auto_10247 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10254 - SURFACE
      ?auto_10255 - SURFACE
      ?auto_10256 - SURFACE
      ?auto_10257 - SURFACE
    )
    :vars
    (
      ?auto_10261 - HOIST
      ?auto_10262 - PLACE
      ?auto_10258 - PLACE
      ?auto_10260 - HOIST
      ?auto_10263 - SURFACE
      ?auto_10259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10261 ?auto_10262 ) ( SURFACE-AT ?auto_10256 ?auto_10262 ) ( CLEAR ?auto_10256 ) ( IS-CRATE ?auto_10257 ) ( not ( = ?auto_10256 ?auto_10257 ) ) ( AVAILABLE ?auto_10261 ) ( ON ?auto_10256 ?auto_10255 ) ( not ( = ?auto_10255 ?auto_10256 ) ) ( not ( = ?auto_10255 ?auto_10257 ) ) ( not ( = ?auto_10258 ?auto_10262 ) ) ( HOIST-AT ?auto_10260 ?auto_10258 ) ( not ( = ?auto_10261 ?auto_10260 ) ) ( AVAILABLE ?auto_10260 ) ( SURFACE-AT ?auto_10257 ?auto_10258 ) ( ON ?auto_10257 ?auto_10263 ) ( CLEAR ?auto_10257 ) ( not ( = ?auto_10256 ?auto_10263 ) ) ( not ( = ?auto_10257 ?auto_10263 ) ) ( not ( = ?auto_10255 ?auto_10263 ) ) ( TRUCK-AT ?auto_10259 ?auto_10262 ) ( ON ?auto_10255 ?auto_10254 ) ( not ( = ?auto_10254 ?auto_10255 ) ) ( not ( = ?auto_10254 ?auto_10256 ) ) ( not ( = ?auto_10254 ?auto_10257 ) ) ( not ( = ?auto_10254 ?auto_10263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10255 ?auto_10256 ?auto_10257 )
      ( MAKE-3CRATE-VERIFY ?auto_10254 ?auto_10255 ?auto_10256 ?auto_10257 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10264 - SURFACE
      ?auto_10265 - SURFACE
      ?auto_10266 - SURFACE
      ?auto_10267 - SURFACE
      ?auto_10268 - SURFACE
    )
    :vars
    (
      ?auto_10272 - HOIST
      ?auto_10273 - PLACE
      ?auto_10269 - PLACE
      ?auto_10271 - HOIST
      ?auto_10274 - SURFACE
      ?auto_10270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10272 ?auto_10273 ) ( SURFACE-AT ?auto_10267 ?auto_10273 ) ( CLEAR ?auto_10267 ) ( IS-CRATE ?auto_10268 ) ( not ( = ?auto_10267 ?auto_10268 ) ) ( AVAILABLE ?auto_10272 ) ( ON ?auto_10267 ?auto_10266 ) ( not ( = ?auto_10266 ?auto_10267 ) ) ( not ( = ?auto_10266 ?auto_10268 ) ) ( not ( = ?auto_10269 ?auto_10273 ) ) ( HOIST-AT ?auto_10271 ?auto_10269 ) ( not ( = ?auto_10272 ?auto_10271 ) ) ( AVAILABLE ?auto_10271 ) ( SURFACE-AT ?auto_10268 ?auto_10269 ) ( ON ?auto_10268 ?auto_10274 ) ( CLEAR ?auto_10268 ) ( not ( = ?auto_10267 ?auto_10274 ) ) ( not ( = ?auto_10268 ?auto_10274 ) ) ( not ( = ?auto_10266 ?auto_10274 ) ) ( TRUCK-AT ?auto_10270 ?auto_10273 ) ( ON ?auto_10265 ?auto_10264 ) ( ON ?auto_10266 ?auto_10265 ) ( not ( = ?auto_10264 ?auto_10265 ) ) ( not ( = ?auto_10264 ?auto_10266 ) ) ( not ( = ?auto_10264 ?auto_10267 ) ) ( not ( = ?auto_10264 ?auto_10268 ) ) ( not ( = ?auto_10264 ?auto_10274 ) ) ( not ( = ?auto_10265 ?auto_10266 ) ) ( not ( = ?auto_10265 ?auto_10267 ) ) ( not ( = ?auto_10265 ?auto_10268 ) ) ( not ( = ?auto_10265 ?auto_10274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10266 ?auto_10267 ?auto_10268 )
      ( MAKE-4CRATE-VERIFY ?auto_10264 ?auto_10265 ?auto_10266 ?auto_10267 ?auto_10268 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10275 - SURFACE
      ?auto_10276 - SURFACE
    )
    :vars
    (
      ?auto_10281 - HOIST
      ?auto_10282 - PLACE
      ?auto_10279 - SURFACE
      ?auto_10277 - PLACE
      ?auto_10280 - HOIST
      ?auto_10283 - SURFACE
      ?auto_10278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10281 ?auto_10282 ) ( IS-CRATE ?auto_10276 ) ( not ( = ?auto_10275 ?auto_10276 ) ) ( not ( = ?auto_10279 ?auto_10275 ) ) ( not ( = ?auto_10279 ?auto_10276 ) ) ( not ( = ?auto_10277 ?auto_10282 ) ) ( HOIST-AT ?auto_10280 ?auto_10277 ) ( not ( = ?auto_10281 ?auto_10280 ) ) ( AVAILABLE ?auto_10280 ) ( SURFACE-AT ?auto_10276 ?auto_10277 ) ( ON ?auto_10276 ?auto_10283 ) ( CLEAR ?auto_10276 ) ( not ( = ?auto_10275 ?auto_10283 ) ) ( not ( = ?auto_10276 ?auto_10283 ) ) ( not ( = ?auto_10279 ?auto_10283 ) ) ( TRUCK-AT ?auto_10278 ?auto_10282 ) ( SURFACE-AT ?auto_10279 ?auto_10282 ) ( CLEAR ?auto_10279 ) ( LIFTING ?auto_10281 ?auto_10275 ) ( IS-CRATE ?auto_10275 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10279 ?auto_10275 )
      ( MAKE-2CRATE ?auto_10279 ?auto_10275 ?auto_10276 )
      ( MAKE-1CRATE-VERIFY ?auto_10275 ?auto_10276 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10284 - SURFACE
      ?auto_10285 - SURFACE
      ?auto_10286 - SURFACE
    )
    :vars
    (
      ?auto_10288 - HOIST
      ?auto_10290 - PLACE
      ?auto_10287 - PLACE
      ?auto_10289 - HOIST
      ?auto_10291 - SURFACE
      ?auto_10292 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10288 ?auto_10290 ) ( IS-CRATE ?auto_10286 ) ( not ( = ?auto_10285 ?auto_10286 ) ) ( not ( = ?auto_10284 ?auto_10285 ) ) ( not ( = ?auto_10284 ?auto_10286 ) ) ( not ( = ?auto_10287 ?auto_10290 ) ) ( HOIST-AT ?auto_10289 ?auto_10287 ) ( not ( = ?auto_10288 ?auto_10289 ) ) ( AVAILABLE ?auto_10289 ) ( SURFACE-AT ?auto_10286 ?auto_10287 ) ( ON ?auto_10286 ?auto_10291 ) ( CLEAR ?auto_10286 ) ( not ( = ?auto_10285 ?auto_10291 ) ) ( not ( = ?auto_10286 ?auto_10291 ) ) ( not ( = ?auto_10284 ?auto_10291 ) ) ( TRUCK-AT ?auto_10292 ?auto_10290 ) ( SURFACE-AT ?auto_10284 ?auto_10290 ) ( CLEAR ?auto_10284 ) ( LIFTING ?auto_10288 ?auto_10285 ) ( IS-CRATE ?auto_10285 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10285 ?auto_10286 )
      ( MAKE-2CRATE-VERIFY ?auto_10284 ?auto_10285 ?auto_10286 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10293 - SURFACE
      ?auto_10294 - SURFACE
      ?auto_10295 - SURFACE
      ?auto_10296 - SURFACE
    )
    :vars
    (
      ?auto_10297 - HOIST
      ?auto_10301 - PLACE
      ?auto_10302 - PLACE
      ?auto_10299 - HOIST
      ?auto_10300 - SURFACE
      ?auto_10298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10297 ?auto_10301 ) ( IS-CRATE ?auto_10296 ) ( not ( = ?auto_10295 ?auto_10296 ) ) ( not ( = ?auto_10294 ?auto_10295 ) ) ( not ( = ?auto_10294 ?auto_10296 ) ) ( not ( = ?auto_10302 ?auto_10301 ) ) ( HOIST-AT ?auto_10299 ?auto_10302 ) ( not ( = ?auto_10297 ?auto_10299 ) ) ( AVAILABLE ?auto_10299 ) ( SURFACE-AT ?auto_10296 ?auto_10302 ) ( ON ?auto_10296 ?auto_10300 ) ( CLEAR ?auto_10296 ) ( not ( = ?auto_10295 ?auto_10300 ) ) ( not ( = ?auto_10296 ?auto_10300 ) ) ( not ( = ?auto_10294 ?auto_10300 ) ) ( TRUCK-AT ?auto_10298 ?auto_10301 ) ( SURFACE-AT ?auto_10294 ?auto_10301 ) ( CLEAR ?auto_10294 ) ( LIFTING ?auto_10297 ?auto_10295 ) ( IS-CRATE ?auto_10295 ) ( ON ?auto_10294 ?auto_10293 ) ( not ( = ?auto_10293 ?auto_10294 ) ) ( not ( = ?auto_10293 ?auto_10295 ) ) ( not ( = ?auto_10293 ?auto_10296 ) ) ( not ( = ?auto_10293 ?auto_10300 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10294 ?auto_10295 ?auto_10296 )
      ( MAKE-3CRATE-VERIFY ?auto_10293 ?auto_10294 ?auto_10295 ?auto_10296 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10303 - SURFACE
      ?auto_10304 - SURFACE
      ?auto_10305 - SURFACE
      ?auto_10306 - SURFACE
      ?auto_10307 - SURFACE
    )
    :vars
    (
      ?auto_10308 - HOIST
      ?auto_10312 - PLACE
      ?auto_10313 - PLACE
      ?auto_10310 - HOIST
      ?auto_10311 - SURFACE
      ?auto_10309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10308 ?auto_10312 ) ( IS-CRATE ?auto_10307 ) ( not ( = ?auto_10306 ?auto_10307 ) ) ( not ( = ?auto_10305 ?auto_10306 ) ) ( not ( = ?auto_10305 ?auto_10307 ) ) ( not ( = ?auto_10313 ?auto_10312 ) ) ( HOIST-AT ?auto_10310 ?auto_10313 ) ( not ( = ?auto_10308 ?auto_10310 ) ) ( AVAILABLE ?auto_10310 ) ( SURFACE-AT ?auto_10307 ?auto_10313 ) ( ON ?auto_10307 ?auto_10311 ) ( CLEAR ?auto_10307 ) ( not ( = ?auto_10306 ?auto_10311 ) ) ( not ( = ?auto_10307 ?auto_10311 ) ) ( not ( = ?auto_10305 ?auto_10311 ) ) ( TRUCK-AT ?auto_10309 ?auto_10312 ) ( SURFACE-AT ?auto_10305 ?auto_10312 ) ( CLEAR ?auto_10305 ) ( LIFTING ?auto_10308 ?auto_10306 ) ( IS-CRATE ?auto_10306 ) ( ON ?auto_10304 ?auto_10303 ) ( ON ?auto_10305 ?auto_10304 ) ( not ( = ?auto_10303 ?auto_10304 ) ) ( not ( = ?auto_10303 ?auto_10305 ) ) ( not ( = ?auto_10303 ?auto_10306 ) ) ( not ( = ?auto_10303 ?auto_10307 ) ) ( not ( = ?auto_10303 ?auto_10311 ) ) ( not ( = ?auto_10304 ?auto_10305 ) ) ( not ( = ?auto_10304 ?auto_10306 ) ) ( not ( = ?auto_10304 ?auto_10307 ) ) ( not ( = ?auto_10304 ?auto_10311 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10305 ?auto_10306 ?auto_10307 )
      ( MAKE-4CRATE-VERIFY ?auto_10303 ?auto_10304 ?auto_10305 ?auto_10306 ?auto_10307 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10314 - SURFACE
      ?auto_10315 - SURFACE
    )
    :vars
    (
      ?auto_10316 - HOIST
      ?auto_10321 - PLACE
      ?auto_10319 - SURFACE
      ?auto_10322 - PLACE
      ?auto_10318 - HOIST
      ?auto_10320 - SURFACE
      ?auto_10317 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10316 ?auto_10321 ) ( IS-CRATE ?auto_10315 ) ( not ( = ?auto_10314 ?auto_10315 ) ) ( not ( = ?auto_10319 ?auto_10314 ) ) ( not ( = ?auto_10319 ?auto_10315 ) ) ( not ( = ?auto_10322 ?auto_10321 ) ) ( HOIST-AT ?auto_10318 ?auto_10322 ) ( not ( = ?auto_10316 ?auto_10318 ) ) ( AVAILABLE ?auto_10318 ) ( SURFACE-AT ?auto_10315 ?auto_10322 ) ( ON ?auto_10315 ?auto_10320 ) ( CLEAR ?auto_10315 ) ( not ( = ?auto_10314 ?auto_10320 ) ) ( not ( = ?auto_10315 ?auto_10320 ) ) ( not ( = ?auto_10319 ?auto_10320 ) ) ( TRUCK-AT ?auto_10317 ?auto_10321 ) ( SURFACE-AT ?auto_10319 ?auto_10321 ) ( CLEAR ?auto_10319 ) ( IS-CRATE ?auto_10314 ) ( AVAILABLE ?auto_10316 ) ( IN ?auto_10314 ?auto_10317 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10316 ?auto_10314 ?auto_10317 ?auto_10321 )
      ( MAKE-2CRATE ?auto_10319 ?auto_10314 ?auto_10315 )
      ( MAKE-1CRATE-VERIFY ?auto_10314 ?auto_10315 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10323 - SURFACE
      ?auto_10324 - SURFACE
      ?auto_10325 - SURFACE
    )
    :vars
    (
      ?auto_10327 - HOIST
      ?auto_10329 - PLACE
      ?auto_10328 - PLACE
      ?auto_10326 - HOIST
      ?auto_10330 - SURFACE
      ?auto_10331 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10327 ?auto_10329 ) ( IS-CRATE ?auto_10325 ) ( not ( = ?auto_10324 ?auto_10325 ) ) ( not ( = ?auto_10323 ?auto_10324 ) ) ( not ( = ?auto_10323 ?auto_10325 ) ) ( not ( = ?auto_10328 ?auto_10329 ) ) ( HOIST-AT ?auto_10326 ?auto_10328 ) ( not ( = ?auto_10327 ?auto_10326 ) ) ( AVAILABLE ?auto_10326 ) ( SURFACE-AT ?auto_10325 ?auto_10328 ) ( ON ?auto_10325 ?auto_10330 ) ( CLEAR ?auto_10325 ) ( not ( = ?auto_10324 ?auto_10330 ) ) ( not ( = ?auto_10325 ?auto_10330 ) ) ( not ( = ?auto_10323 ?auto_10330 ) ) ( TRUCK-AT ?auto_10331 ?auto_10329 ) ( SURFACE-AT ?auto_10323 ?auto_10329 ) ( CLEAR ?auto_10323 ) ( IS-CRATE ?auto_10324 ) ( AVAILABLE ?auto_10327 ) ( IN ?auto_10324 ?auto_10331 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10324 ?auto_10325 )
      ( MAKE-2CRATE-VERIFY ?auto_10323 ?auto_10324 ?auto_10325 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10332 - SURFACE
      ?auto_10333 - SURFACE
      ?auto_10334 - SURFACE
      ?auto_10335 - SURFACE
    )
    :vars
    (
      ?auto_10337 - HOIST
      ?auto_10338 - PLACE
      ?auto_10340 - PLACE
      ?auto_10336 - HOIST
      ?auto_10341 - SURFACE
      ?auto_10339 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10337 ?auto_10338 ) ( IS-CRATE ?auto_10335 ) ( not ( = ?auto_10334 ?auto_10335 ) ) ( not ( = ?auto_10333 ?auto_10334 ) ) ( not ( = ?auto_10333 ?auto_10335 ) ) ( not ( = ?auto_10340 ?auto_10338 ) ) ( HOIST-AT ?auto_10336 ?auto_10340 ) ( not ( = ?auto_10337 ?auto_10336 ) ) ( AVAILABLE ?auto_10336 ) ( SURFACE-AT ?auto_10335 ?auto_10340 ) ( ON ?auto_10335 ?auto_10341 ) ( CLEAR ?auto_10335 ) ( not ( = ?auto_10334 ?auto_10341 ) ) ( not ( = ?auto_10335 ?auto_10341 ) ) ( not ( = ?auto_10333 ?auto_10341 ) ) ( TRUCK-AT ?auto_10339 ?auto_10338 ) ( SURFACE-AT ?auto_10333 ?auto_10338 ) ( CLEAR ?auto_10333 ) ( IS-CRATE ?auto_10334 ) ( AVAILABLE ?auto_10337 ) ( IN ?auto_10334 ?auto_10339 ) ( ON ?auto_10333 ?auto_10332 ) ( not ( = ?auto_10332 ?auto_10333 ) ) ( not ( = ?auto_10332 ?auto_10334 ) ) ( not ( = ?auto_10332 ?auto_10335 ) ) ( not ( = ?auto_10332 ?auto_10341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10333 ?auto_10334 ?auto_10335 )
      ( MAKE-3CRATE-VERIFY ?auto_10332 ?auto_10333 ?auto_10334 ?auto_10335 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10342 - SURFACE
      ?auto_10343 - SURFACE
      ?auto_10344 - SURFACE
      ?auto_10345 - SURFACE
      ?auto_10346 - SURFACE
    )
    :vars
    (
      ?auto_10348 - HOIST
      ?auto_10349 - PLACE
      ?auto_10351 - PLACE
      ?auto_10347 - HOIST
      ?auto_10352 - SURFACE
      ?auto_10350 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10348 ?auto_10349 ) ( IS-CRATE ?auto_10346 ) ( not ( = ?auto_10345 ?auto_10346 ) ) ( not ( = ?auto_10344 ?auto_10345 ) ) ( not ( = ?auto_10344 ?auto_10346 ) ) ( not ( = ?auto_10351 ?auto_10349 ) ) ( HOIST-AT ?auto_10347 ?auto_10351 ) ( not ( = ?auto_10348 ?auto_10347 ) ) ( AVAILABLE ?auto_10347 ) ( SURFACE-AT ?auto_10346 ?auto_10351 ) ( ON ?auto_10346 ?auto_10352 ) ( CLEAR ?auto_10346 ) ( not ( = ?auto_10345 ?auto_10352 ) ) ( not ( = ?auto_10346 ?auto_10352 ) ) ( not ( = ?auto_10344 ?auto_10352 ) ) ( TRUCK-AT ?auto_10350 ?auto_10349 ) ( SURFACE-AT ?auto_10344 ?auto_10349 ) ( CLEAR ?auto_10344 ) ( IS-CRATE ?auto_10345 ) ( AVAILABLE ?auto_10348 ) ( IN ?auto_10345 ?auto_10350 ) ( ON ?auto_10343 ?auto_10342 ) ( ON ?auto_10344 ?auto_10343 ) ( not ( = ?auto_10342 ?auto_10343 ) ) ( not ( = ?auto_10342 ?auto_10344 ) ) ( not ( = ?auto_10342 ?auto_10345 ) ) ( not ( = ?auto_10342 ?auto_10346 ) ) ( not ( = ?auto_10342 ?auto_10352 ) ) ( not ( = ?auto_10343 ?auto_10344 ) ) ( not ( = ?auto_10343 ?auto_10345 ) ) ( not ( = ?auto_10343 ?auto_10346 ) ) ( not ( = ?auto_10343 ?auto_10352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10344 ?auto_10345 ?auto_10346 )
      ( MAKE-4CRATE-VERIFY ?auto_10342 ?auto_10343 ?auto_10344 ?auto_10345 ?auto_10346 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10353 - SURFACE
      ?auto_10354 - SURFACE
    )
    :vars
    (
      ?auto_10356 - HOIST
      ?auto_10357 - PLACE
      ?auto_10359 - SURFACE
      ?auto_10360 - PLACE
      ?auto_10355 - HOIST
      ?auto_10361 - SURFACE
      ?auto_10358 - TRUCK
      ?auto_10362 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10356 ?auto_10357 ) ( IS-CRATE ?auto_10354 ) ( not ( = ?auto_10353 ?auto_10354 ) ) ( not ( = ?auto_10359 ?auto_10353 ) ) ( not ( = ?auto_10359 ?auto_10354 ) ) ( not ( = ?auto_10360 ?auto_10357 ) ) ( HOIST-AT ?auto_10355 ?auto_10360 ) ( not ( = ?auto_10356 ?auto_10355 ) ) ( AVAILABLE ?auto_10355 ) ( SURFACE-AT ?auto_10354 ?auto_10360 ) ( ON ?auto_10354 ?auto_10361 ) ( CLEAR ?auto_10354 ) ( not ( = ?auto_10353 ?auto_10361 ) ) ( not ( = ?auto_10354 ?auto_10361 ) ) ( not ( = ?auto_10359 ?auto_10361 ) ) ( SURFACE-AT ?auto_10359 ?auto_10357 ) ( CLEAR ?auto_10359 ) ( IS-CRATE ?auto_10353 ) ( AVAILABLE ?auto_10356 ) ( IN ?auto_10353 ?auto_10358 ) ( TRUCK-AT ?auto_10358 ?auto_10362 ) ( not ( = ?auto_10362 ?auto_10357 ) ) ( not ( = ?auto_10360 ?auto_10362 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10358 ?auto_10362 ?auto_10357 )
      ( MAKE-2CRATE ?auto_10359 ?auto_10353 ?auto_10354 )
      ( MAKE-1CRATE-VERIFY ?auto_10353 ?auto_10354 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10363 - SURFACE
      ?auto_10364 - SURFACE
      ?auto_10365 - SURFACE
    )
    :vars
    (
      ?auto_10370 - HOIST
      ?auto_10369 - PLACE
      ?auto_10367 - PLACE
      ?auto_10366 - HOIST
      ?auto_10368 - SURFACE
      ?auto_10371 - TRUCK
      ?auto_10372 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10370 ?auto_10369 ) ( IS-CRATE ?auto_10365 ) ( not ( = ?auto_10364 ?auto_10365 ) ) ( not ( = ?auto_10363 ?auto_10364 ) ) ( not ( = ?auto_10363 ?auto_10365 ) ) ( not ( = ?auto_10367 ?auto_10369 ) ) ( HOIST-AT ?auto_10366 ?auto_10367 ) ( not ( = ?auto_10370 ?auto_10366 ) ) ( AVAILABLE ?auto_10366 ) ( SURFACE-AT ?auto_10365 ?auto_10367 ) ( ON ?auto_10365 ?auto_10368 ) ( CLEAR ?auto_10365 ) ( not ( = ?auto_10364 ?auto_10368 ) ) ( not ( = ?auto_10365 ?auto_10368 ) ) ( not ( = ?auto_10363 ?auto_10368 ) ) ( SURFACE-AT ?auto_10363 ?auto_10369 ) ( CLEAR ?auto_10363 ) ( IS-CRATE ?auto_10364 ) ( AVAILABLE ?auto_10370 ) ( IN ?auto_10364 ?auto_10371 ) ( TRUCK-AT ?auto_10371 ?auto_10372 ) ( not ( = ?auto_10372 ?auto_10369 ) ) ( not ( = ?auto_10367 ?auto_10372 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10364 ?auto_10365 )
      ( MAKE-2CRATE-VERIFY ?auto_10363 ?auto_10364 ?auto_10365 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10373 - SURFACE
      ?auto_10374 - SURFACE
      ?auto_10375 - SURFACE
      ?auto_10376 - SURFACE
    )
    :vars
    (
      ?auto_10380 - HOIST
      ?auto_10377 - PLACE
      ?auto_10383 - PLACE
      ?auto_10378 - HOIST
      ?auto_10379 - SURFACE
      ?auto_10381 - TRUCK
      ?auto_10382 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10380 ?auto_10377 ) ( IS-CRATE ?auto_10376 ) ( not ( = ?auto_10375 ?auto_10376 ) ) ( not ( = ?auto_10374 ?auto_10375 ) ) ( not ( = ?auto_10374 ?auto_10376 ) ) ( not ( = ?auto_10383 ?auto_10377 ) ) ( HOIST-AT ?auto_10378 ?auto_10383 ) ( not ( = ?auto_10380 ?auto_10378 ) ) ( AVAILABLE ?auto_10378 ) ( SURFACE-AT ?auto_10376 ?auto_10383 ) ( ON ?auto_10376 ?auto_10379 ) ( CLEAR ?auto_10376 ) ( not ( = ?auto_10375 ?auto_10379 ) ) ( not ( = ?auto_10376 ?auto_10379 ) ) ( not ( = ?auto_10374 ?auto_10379 ) ) ( SURFACE-AT ?auto_10374 ?auto_10377 ) ( CLEAR ?auto_10374 ) ( IS-CRATE ?auto_10375 ) ( AVAILABLE ?auto_10380 ) ( IN ?auto_10375 ?auto_10381 ) ( TRUCK-AT ?auto_10381 ?auto_10382 ) ( not ( = ?auto_10382 ?auto_10377 ) ) ( not ( = ?auto_10383 ?auto_10382 ) ) ( ON ?auto_10374 ?auto_10373 ) ( not ( = ?auto_10373 ?auto_10374 ) ) ( not ( = ?auto_10373 ?auto_10375 ) ) ( not ( = ?auto_10373 ?auto_10376 ) ) ( not ( = ?auto_10373 ?auto_10379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10374 ?auto_10375 ?auto_10376 )
      ( MAKE-3CRATE-VERIFY ?auto_10373 ?auto_10374 ?auto_10375 ?auto_10376 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10384 - SURFACE
      ?auto_10385 - SURFACE
      ?auto_10386 - SURFACE
      ?auto_10387 - SURFACE
      ?auto_10388 - SURFACE
    )
    :vars
    (
      ?auto_10392 - HOIST
      ?auto_10389 - PLACE
      ?auto_10395 - PLACE
      ?auto_10390 - HOIST
      ?auto_10391 - SURFACE
      ?auto_10393 - TRUCK
      ?auto_10394 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10392 ?auto_10389 ) ( IS-CRATE ?auto_10388 ) ( not ( = ?auto_10387 ?auto_10388 ) ) ( not ( = ?auto_10386 ?auto_10387 ) ) ( not ( = ?auto_10386 ?auto_10388 ) ) ( not ( = ?auto_10395 ?auto_10389 ) ) ( HOIST-AT ?auto_10390 ?auto_10395 ) ( not ( = ?auto_10392 ?auto_10390 ) ) ( AVAILABLE ?auto_10390 ) ( SURFACE-AT ?auto_10388 ?auto_10395 ) ( ON ?auto_10388 ?auto_10391 ) ( CLEAR ?auto_10388 ) ( not ( = ?auto_10387 ?auto_10391 ) ) ( not ( = ?auto_10388 ?auto_10391 ) ) ( not ( = ?auto_10386 ?auto_10391 ) ) ( SURFACE-AT ?auto_10386 ?auto_10389 ) ( CLEAR ?auto_10386 ) ( IS-CRATE ?auto_10387 ) ( AVAILABLE ?auto_10392 ) ( IN ?auto_10387 ?auto_10393 ) ( TRUCK-AT ?auto_10393 ?auto_10394 ) ( not ( = ?auto_10394 ?auto_10389 ) ) ( not ( = ?auto_10395 ?auto_10394 ) ) ( ON ?auto_10385 ?auto_10384 ) ( ON ?auto_10386 ?auto_10385 ) ( not ( = ?auto_10384 ?auto_10385 ) ) ( not ( = ?auto_10384 ?auto_10386 ) ) ( not ( = ?auto_10384 ?auto_10387 ) ) ( not ( = ?auto_10384 ?auto_10388 ) ) ( not ( = ?auto_10384 ?auto_10391 ) ) ( not ( = ?auto_10385 ?auto_10386 ) ) ( not ( = ?auto_10385 ?auto_10387 ) ) ( not ( = ?auto_10385 ?auto_10388 ) ) ( not ( = ?auto_10385 ?auto_10391 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10386 ?auto_10387 ?auto_10388 )
      ( MAKE-4CRATE-VERIFY ?auto_10384 ?auto_10385 ?auto_10386 ?auto_10387 ?auto_10388 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10396 - SURFACE
      ?auto_10397 - SURFACE
    )
    :vars
    (
      ?auto_10401 - HOIST
      ?auto_10398 - PLACE
      ?auto_10403 - SURFACE
      ?auto_10405 - PLACE
      ?auto_10399 - HOIST
      ?auto_10400 - SURFACE
      ?auto_10402 - TRUCK
      ?auto_10404 - PLACE
      ?auto_10406 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10401 ?auto_10398 ) ( IS-CRATE ?auto_10397 ) ( not ( = ?auto_10396 ?auto_10397 ) ) ( not ( = ?auto_10403 ?auto_10396 ) ) ( not ( = ?auto_10403 ?auto_10397 ) ) ( not ( = ?auto_10405 ?auto_10398 ) ) ( HOIST-AT ?auto_10399 ?auto_10405 ) ( not ( = ?auto_10401 ?auto_10399 ) ) ( AVAILABLE ?auto_10399 ) ( SURFACE-AT ?auto_10397 ?auto_10405 ) ( ON ?auto_10397 ?auto_10400 ) ( CLEAR ?auto_10397 ) ( not ( = ?auto_10396 ?auto_10400 ) ) ( not ( = ?auto_10397 ?auto_10400 ) ) ( not ( = ?auto_10403 ?auto_10400 ) ) ( SURFACE-AT ?auto_10403 ?auto_10398 ) ( CLEAR ?auto_10403 ) ( IS-CRATE ?auto_10396 ) ( AVAILABLE ?auto_10401 ) ( TRUCK-AT ?auto_10402 ?auto_10404 ) ( not ( = ?auto_10404 ?auto_10398 ) ) ( not ( = ?auto_10405 ?auto_10404 ) ) ( HOIST-AT ?auto_10406 ?auto_10404 ) ( LIFTING ?auto_10406 ?auto_10396 ) ( not ( = ?auto_10401 ?auto_10406 ) ) ( not ( = ?auto_10399 ?auto_10406 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10406 ?auto_10396 ?auto_10402 ?auto_10404 )
      ( MAKE-2CRATE ?auto_10403 ?auto_10396 ?auto_10397 )
      ( MAKE-1CRATE-VERIFY ?auto_10396 ?auto_10397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10407 - SURFACE
      ?auto_10408 - SURFACE
      ?auto_10409 - SURFACE
    )
    :vars
    (
      ?auto_10411 - HOIST
      ?auto_10412 - PLACE
      ?auto_10410 - PLACE
      ?auto_10414 - HOIST
      ?auto_10417 - SURFACE
      ?auto_10416 - TRUCK
      ?auto_10413 - PLACE
      ?auto_10415 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10411 ?auto_10412 ) ( IS-CRATE ?auto_10409 ) ( not ( = ?auto_10408 ?auto_10409 ) ) ( not ( = ?auto_10407 ?auto_10408 ) ) ( not ( = ?auto_10407 ?auto_10409 ) ) ( not ( = ?auto_10410 ?auto_10412 ) ) ( HOIST-AT ?auto_10414 ?auto_10410 ) ( not ( = ?auto_10411 ?auto_10414 ) ) ( AVAILABLE ?auto_10414 ) ( SURFACE-AT ?auto_10409 ?auto_10410 ) ( ON ?auto_10409 ?auto_10417 ) ( CLEAR ?auto_10409 ) ( not ( = ?auto_10408 ?auto_10417 ) ) ( not ( = ?auto_10409 ?auto_10417 ) ) ( not ( = ?auto_10407 ?auto_10417 ) ) ( SURFACE-AT ?auto_10407 ?auto_10412 ) ( CLEAR ?auto_10407 ) ( IS-CRATE ?auto_10408 ) ( AVAILABLE ?auto_10411 ) ( TRUCK-AT ?auto_10416 ?auto_10413 ) ( not ( = ?auto_10413 ?auto_10412 ) ) ( not ( = ?auto_10410 ?auto_10413 ) ) ( HOIST-AT ?auto_10415 ?auto_10413 ) ( LIFTING ?auto_10415 ?auto_10408 ) ( not ( = ?auto_10411 ?auto_10415 ) ) ( not ( = ?auto_10414 ?auto_10415 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10408 ?auto_10409 )
      ( MAKE-2CRATE-VERIFY ?auto_10407 ?auto_10408 ?auto_10409 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10418 - SURFACE
      ?auto_10419 - SURFACE
      ?auto_10420 - SURFACE
      ?auto_10421 - SURFACE
    )
    :vars
    (
      ?auto_10428 - HOIST
      ?auto_10422 - PLACE
      ?auto_10423 - PLACE
      ?auto_10424 - HOIST
      ?auto_10429 - SURFACE
      ?auto_10427 - TRUCK
      ?auto_10425 - PLACE
      ?auto_10426 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10428 ?auto_10422 ) ( IS-CRATE ?auto_10421 ) ( not ( = ?auto_10420 ?auto_10421 ) ) ( not ( = ?auto_10419 ?auto_10420 ) ) ( not ( = ?auto_10419 ?auto_10421 ) ) ( not ( = ?auto_10423 ?auto_10422 ) ) ( HOIST-AT ?auto_10424 ?auto_10423 ) ( not ( = ?auto_10428 ?auto_10424 ) ) ( AVAILABLE ?auto_10424 ) ( SURFACE-AT ?auto_10421 ?auto_10423 ) ( ON ?auto_10421 ?auto_10429 ) ( CLEAR ?auto_10421 ) ( not ( = ?auto_10420 ?auto_10429 ) ) ( not ( = ?auto_10421 ?auto_10429 ) ) ( not ( = ?auto_10419 ?auto_10429 ) ) ( SURFACE-AT ?auto_10419 ?auto_10422 ) ( CLEAR ?auto_10419 ) ( IS-CRATE ?auto_10420 ) ( AVAILABLE ?auto_10428 ) ( TRUCK-AT ?auto_10427 ?auto_10425 ) ( not ( = ?auto_10425 ?auto_10422 ) ) ( not ( = ?auto_10423 ?auto_10425 ) ) ( HOIST-AT ?auto_10426 ?auto_10425 ) ( LIFTING ?auto_10426 ?auto_10420 ) ( not ( = ?auto_10428 ?auto_10426 ) ) ( not ( = ?auto_10424 ?auto_10426 ) ) ( ON ?auto_10419 ?auto_10418 ) ( not ( = ?auto_10418 ?auto_10419 ) ) ( not ( = ?auto_10418 ?auto_10420 ) ) ( not ( = ?auto_10418 ?auto_10421 ) ) ( not ( = ?auto_10418 ?auto_10429 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10419 ?auto_10420 ?auto_10421 )
      ( MAKE-3CRATE-VERIFY ?auto_10418 ?auto_10419 ?auto_10420 ?auto_10421 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10430 - SURFACE
      ?auto_10431 - SURFACE
      ?auto_10432 - SURFACE
      ?auto_10433 - SURFACE
      ?auto_10434 - SURFACE
    )
    :vars
    (
      ?auto_10441 - HOIST
      ?auto_10435 - PLACE
      ?auto_10436 - PLACE
      ?auto_10437 - HOIST
      ?auto_10442 - SURFACE
      ?auto_10440 - TRUCK
      ?auto_10438 - PLACE
      ?auto_10439 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10441 ?auto_10435 ) ( IS-CRATE ?auto_10434 ) ( not ( = ?auto_10433 ?auto_10434 ) ) ( not ( = ?auto_10432 ?auto_10433 ) ) ( not ( = ?auto_10432 ?auto_10434 ) ) ( not ( = ?auto_10436 ?auto_10435 ) ) ( HOIST-AT ?auto_10437 ?auto_10436 ) ( not ( = ?auto_10441 ?auto_10437 ) ) ( AVAILABLE ?auto_10437 ) ( SURFACE-AT ?auto_10434 ?auto_10436 ) ( ON ?auto_10434 ?auto_10442 ) ( CLEAR ?auto_10434 ) ( not ( = ?auto_10433 ?auto_10442 ) ) ( not ( = ?auto_10434 ?auto_10442 ) ) ( not ( = ?auto_10432 ?auto_10442 ) ) ( SURFACE-AT ?auto_10432 ?auto_10435 ) ( CLEAR ?auto_10432 ) ( IS-CRATE ?auto_10433 ) ( AVAILABLE ?auto_10441 ) ( TRUCK-AT ?auto_10440 ?auto_10438 ) ( not ( = ?auto_10438 ?auto_10435 ) ) ( not ( = ?auto_10436 ?auto_10438 ) ) ( HOIST-AT ?auto_10439 ?auto_10438 ) ( LIFTING ?auto_10439 ?auto_10433 ) ( not ( = ?auto_10441 ?auto_10439 ) ) ( not ( = ?auto_10437 ?auto_10439 ) ) ( ON ?auto_10431 ?auto_10430 ) ( ON ?auto_10432 ?auto_10431 ) ( not ( = ?auto_10430 ?auto_10431 ) ) ( not ( = ?auto_10430 ?auto_10432 ) ) ( not ( = ?auto_10430 ?auto_10433 ) ) ( not ( = ?auto_10430 ?auto_10434 ) ) ( not ( = ?auto_10430 ?auto_10442 ) ) ( not ( = ?auto_10431 ?auto_10432 ) ) ( not ( = ?auto_10431 ?auto_10433 ) ) ( not ( = ?auto_10431 ?auto_10434 ) ) ( not ( = ?auto_10431 ?auto_10442 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10432 ?auto_10433 ?auto_10434 )
      ( MAKE-4CRATE-VERIFY ?auto_10430 ?auto_10431 ?auto_10432 ?auto_10433 ?auto_10434 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10443 - SURFACE
      ?auto_10444 - SURFACE
    )
    :vars
    (
      ?auto_10452 - HOIST
      ?auto_10445 - PLACE
      ?auto_10448 - SURFACE
      ?auto_10446 - PLACE
      ?auto_10447 - HOIST
      ?auto_10453 - SURFACE
      ?auto_10451 - TRUCK
      ?auto_10449 - PLACE
      ?auto_10450 - HOIST
      ?auto_10454 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10452 ?auto_10445 ) ( IS-CRATE ?auto_10444 ) ( not ( = ?auto_10443 ?auto_10444 ) ) ( not ( = ?auto_10448 ?auto_10443 ) ) ( not ( = ?auto_10448 ?auto_10444 ) ) ( not ( = ?auto_10446 ?auto_10445 ) ) ( HOIST-AT ?auto_10447 ?auto_10446 ) ( not ( = ?auto_10452 ?auto_10447 ) ) ( AVAILABLE ?auto_10447 ) ( SURFACE-AT ?auto_10444 ?auto_10446 ) ( ON ?auto_10444 ?auto_10453 ) ( CLEAR ?auto_10444 ) ( not ( = ?auto_10443 ?auto_10453 ) ) ( not ( = ?auto_10444 ?auto_10453 ) ) ( not ( = ?auto_10448 ?auto_10453 ) ) ( SURFACE-AT ?auto_10448 ?auto_10445 ) ( CLEAR ?auto_10448 ) ( IS-CRATE ?auto_10443 ) ( AVAILABLE ?auto_10452 ) ( TRUCK-AT ?auto_10451 ?auto_10449 ) ( not ( = ?auto_10449 ?auto_10445 ) ) ( not ( = ?auto_10446 ?auto_10449 ) ) ( HOIST-AT ?auto_10450 ?auto_10449 ) ( not ( = ?auto_10452 ?auto_10450 ) ) ( not ( = ?auto_10447 ?auto_10450 ) ) ( AVAILABLE ?auto_10450 ) ( SURFACE-AT ?auto_10443 ?auto_10449 ) ( ON ?auto_10443 ?auto_10454 ) ( CLEAR ?auto_10443 ) ( not ( = ?auto_10443 ?auto_10454 ) ) ( not ( = ?auto_10444 ?auto_10454 ) ) ( not ( = ?auto_10448 ?auto_10454 ) ) ( not ( = ?auto_10453 ?auto_10454 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10450 ?auto_10443 ?auto_10454 ?auto_10449 )
      ( MAKE-2CRATE ?auto_10448 ?auto_10443 ?auto_10444 )
      ( MAKE-1CRATE-VERIFY ?auto_10443 ?auto_10444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10455 - SURFACE
      ?auto_10456 - SURFACE
      ?auto_10457 - SURFACE
    )
    :vars
    (
      ?auto_10459 - HOIST
      ?auto_10466 - PLACE
      ?auto_10464 - PLACE
      ?auto_10458 - HOIST
      ?auto_10461 - SURFACE
      ?auto_10462 - TRUCK
      ?auto_10463 - PLACE
      ?auto_10465 - HOIST
      ?auto_10460 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10459 ?auto_10466 ) ( IS-CRATE ?auto_10457 ) ( not ( = ?auto_10456 ?auto_10457 ) ) ( not ( = ?auto_10455 ?auto_10456 ) ) ( not ( = ?auto_10455 ?auto_10457 ) ) ( not ( = ?auto_10464 ?auto_10466 ) ) ( HOIST-AT ?auto_10458 ?auto_10464 ) ( not ( = ?auto_10459 ?auto_10458 ) ) ( AVAILABLE ?auto_10458 ) ( SURFACE-AT ?auto_10457 ?auto_10464 ) ( ON ?auto_10457 ?auto_10461 ) ( CLEAR ?auto_10457 ) ( not ( = ?auto_10456 ?auto_10461 ) ) ( not ( = ?auto_10457 ?auto_10461 ) ) ( not ( = ?auto_10455 ?auto_10461 ) ) ( SURFACE-AT ?auto_10455 ?auto_10466 ) ( CLEAR ?auto_10455 ) ( IS-CRATE ?auto_10456 ) ( AVAILABLE ?auto_10459 ) ( TRUCK-AT ?auto_10462 ?auto_10463 ) ( not ( = ?auto_10463 ?auto_10466 ) ) ( not ( = ?auto_10464 ?auto_10463 ) ) ( HOIST-AT ?auto_10465 ?auto_10463 ) ( not ( = ?auto_10459 ?auto_10465 ) ) ( not ( = ?auto_10458 ?auto_10465 ) ) ( AVAILABLE ?auto_10465 ) ( SURFACE-AT ?auto_10456 ?auto_10463 ) ( ON ?auto_10456 ?auto_10460 ) ( CLEAR ?auto_10456 ) ( not ( = ?auto_10456 ?auto_10460 ) ) ( not ( = ?auto_10457 ?auto_10460 ) ) ( not ( = ?auto_10455 ?auto_10460 ) ) ( not ( = ?auto_10461 ?auto_10460 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10456 ?auto_10457 )
      ( MAKE-2CRATE-VERIFY ?auto_10455 ?auto_10456 ?auto_10457 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10467 - SURFACE
      ?auto_10468 - SURFACE
      ?auto_10469 - SURFACE
      ?auto_10470 - SURFACE
    )
    :vars
    (
      ?auto_10473 - HOIST
      ?auto_10479 - PLACE
      ?auto_10477 - PLACE
      ?auto_10474 - HOIST
      ?auto_10471 - SURFACE
      ?auto_10472 - TRUCK
      ?auto_10476 - PLACE
      ?auto_10478 - HOIST
      ?auto_10475 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10473 ?auto_10479 ) ( IS-CRATE ?auto_10470 ) ( not ( = ?auto_10469 ?auto_10470 ) ) ( not ( = ?auto_10468 ?auto_10469 ) ) ( not ( = ?auto_10468 ?auto_10470 ) ) ( not ( = ?auto_10477 ?auto_10479 ) ) ( HOIST-AT ?auto_10474 ?auto_10477 ) ( not ( = ?auto_10473 ?auto_10474 ) ) ( AVAILABLE ?auto_10474 ) ( SURFACE-AT ?auto_10470 ?auto_10477 ) ( ON ?auto_10470 ?auto_10471 ) ( CLEAR ?auto_10470 ) ( not ( = ?auto_10469 ?auto_10471 ) ) ( not ( = ?auto_10470 ?auto_10471 ) ) ( not ( = ?auto_10468 ?auto_10471 ) ) ( SURFACE-AT ?auto_10468 ?auto_10479 ) ( CLEAR ?auto_10468 ) ( IS-CRATE ?auto_10469 ) ( AVAILABLE ?auto_10473 ) ( TRUCK-AT ?auto_10472 ?auto_10476 ) ( not ( = ?auto_10476 ?auto_10479 ) ) ( not ( = ?auto_10477 ?auto_10476 ) ) ( HOIST-AT ?auto_10478 ?auto_10476 ) ( not ( = ?auto_10473 ?auto_10478 ) ) ( not ( = ?auto_10474 ?auto_10478 ) ) ( AVAILABLE ?auto_10478 ) ( SURFACE-AT ?auto_10469 ?auto_10476 ) ( ON ?auto_10469 ?auto_10475 ) ( CLEAR ?auto_10469 ) ( not ( = ?auto_10469 ?auto_10475 ) ) ( not ( = ?auto_10470 ?auto_10475 ) ) ( not ( = ?auto_10468 ?auto_10475 ) ) ( not ( = ?auto_10471 ?auto_10475 ) ) ( ON ?auto_10468 ?auto_10467 ) ( not ( = ?auto_10467 ?auto_10468 ) ) ( not ( = ?auto_10467 ?auto_10469 ) ) ( not ( = ?auto_10467 ?auto_10470 ) ) ( not ( = ?auto_10467 ?auto_10471 ) ) ( not ( = ?auto_10467 ?auto_10475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10468 ?auto_10469 ?auto_10470 )
      ( MAKE-3CRATE-VERIFY ?auto_10467 ?auto_10468 ?auto_10469 ?auto_10470 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10480 - SURFACE
      ?auto_10481 - SURFACE
      ?auto_10482 - SURFACE
      ?auto_10483 - SURFACE
      ?auto_10484 - SURFACE
    )
    :vars
    (
      ?auto_10487 - HOIST
      ?auto_10493 - PLACE
      ?auto_10491 - PLACE
      ?auto_10488 - HOIST
      ?auto_10485 - SURFACE
      ?auto_10486 - TRUCK
      ?auto_10490 - PLACE
      ?auto_10492 - HOIST
      ?auto_10489 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10487 ?auto_10493 ) ( IS-CRATE ?auto_10484 ) ( not ( = ?auto_10483 ?auto_10484 ) ) ( not ( = ?auto_10482 ?auto_10483 ) ) ( not ( = ?auto_10482 ?auto_10484 ) ) ( not ( = ?auto_10491 ?auto_10493 ) ) ( HOIST-AT ?auto_10488 ?auto_10491 ) ( not ( = ?auto_10487 ?auto_10488 ) ) ( AVAILABLE ?auto_10488 ) ( SURFACE-AT ?auto_10484 ?auto_10491 ) ( ON ?auto_10484 ?auto_10485 ) ( CLEAR ?auto_10484 ) ( not ( = ?auto_10483 ?auto_10485 ) ) ( not ( = ?auto_10484 ?auto_10485 ) ) ( not ( = ?auto_10482 ?auto_10485 ) ) ( SURFACE-AT ?auto_10482 ?auto_10493 ) ( CLEAR ?auto_10482 ) ( IS-CRATE ?auto_10483 ) ( AVAILABLE ?auto_10487 ) ( TRUCK-AT ?auto_10486 ?auto_10490 ) ( not ( = ?auto_10490 ?auto_10493 ) ) ( not ( = ?auto_10491 ?auto_10490 ) ) ( HOIST-AT ?auto_10492 ?auto_10490 ) ( not ( = ?auto_10487 ?auto_10492 ) ) ( not ( = ?auto_10488 ?auto_10492 ) ) ( AVAILABLE ?auto_10492 ) ( SURFACE-AT ?auto_10483 ?auto_10490 ) ( ON ?auto_10483 ?auto_10489 ) ( CLEAR ?auto_10483 ) ( not ( = ?auto_10483 ?auto_10489 ) ) ( not ( = ?auto_10484 ?auto_10489 ) ) ( not ( = ?auto_10482 ?auto_10489 ) ) ( not ( = ?auto_10485 ?auto_10489 ) ) ( ON ?auto_10481 ?auto_10480 ) ( ON ?auto_10482 ?auto_10481 ) ( not ( = ?auto_10480 ?auto_10481 ) ) ( not ( = ?auto_10480 ?auto_10482 ) ) ( not ( = ?auto_10480 ?auto_10483 ) ) ( not ( = ?auto_10480 ?auto_10484 ) ) ( not ( = ?auto_10480 ?auto_10485 ) ) ( not ( = ?auto_10480 ?auto_10489 ) ) ( not ( = ?auto_10481 ?auto_10482 ) ) ( not ( = ?auto_10481 ?auto_10483 ) ) ( not ( = ?auto_10481 ?auto_10484 ) ) ( not ( = ?auto_10481 ?auto_10485 ) ) ( not ( = ?auto_10481 ?auto_10489 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10482 ?auto_10483 ?auto_10484 )
      ( MAKE-4CRATE-VERIFY ?auto_10480 ?auto_10481 ?auto_10482 ?auto_10483 ?auto_10484 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10494 - SURFACE
      ?auto_10495 - SURFACE
    )
    :vars
    (
      ?auto_10499 - HOIST
      ?auto_10505 - PLACE
      ?auto_10496 - SURFACE
      ?auto_10503 - PLACE
      ?auto_10500 - HOIST
      ?auto_10497 - SURFACE
      ?auto_10502 - PLACE
      ?auto_10504 - HOIST
      ?auto_10501 - SURFACE
      ?auto_10498 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10499 ?auto_10505 ) ( IS-CRATE ?auto_10495 ) ( not ( = ?auto_10494 ?auto_10495 ) ) ( not ( = ?auto_10496 ?auto_10494 ) ) ( not ( = ?auto_10496 ?auto_10495 ) ) ( not ( = ?auto_10503 ?auto_10505 ) ) ( HOIST-AT ?auto_10500 ?auto_10503 ) ( not ( = ?auto_10499 ?auto_10500 ) ) ( AVAILABLE ?auto_10500 ) ( SURFACE-AT ?auto_10495 ?auto_10503 ) ( ON ?auto_10495 ?auto_10497 ) ( CLEAR ?auto_10495 ) ( not ( = ?auto_10494 ?auto_10497 ) ) ( not ( = ?auto_10495 ?auto_10497 ) ) ( not ( = ?auto_10496 ?auto_10497 ) ) ( SURFACE-AT ?auto_10496 ?auto_10505 ) ( CLEAR ?auto_10496 ) ( IS-CRATE ?auto_10494 ) ( AVAILABLE ?auto_10499 ) ( not ( = ?auto_10502 ?auto_10505 ) ) ( not ( = ?auto_10503 ?auto_10502 ) ) ( HOIST-AT ?auto_10504 ?auto_10502 ) ( not ( = ?auto_10499 ?auto_10504 ) ) ( not ( = ?auto_10500 ?auto_10504 ) ) ( AVAILABLE ?auto_10504 ) ( SURFACE-AT ?auto_10494 ?auto_10502 ) ( ON ?auto_10494 ?auto_10501 ) ( CLEAR ?auto_10494 ) ( not ( = ?auto_10494 ?auto_10501 ) ) ( not ( = ?auto_10495 ?auto_10501 ) ) ( not ( = ?auto_10496 ?auto_10501 ) ) ( not ( = ?auto_10497 ?auto_10501 ) ) ( TRUCK-AT ?auto_10498 ?auto_10505 ) )
    :subtasks
    ( ( !DRIVE ?auto_10498 ?auto_10505 ?auto_10502 )
      ( MAKE-2CRATE ?auto_10496 ?auto_10494 ?auto_10495 )
      ( MAKE-1CRATE-VERIFY ?auto_10494 ?auto_10495 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10506 - SURFACE
      ?auto_10507 - SURFACE
      ?auto_10508 - SURFACE
    )
    :vars
    (
      ?auto_10513 - HOIST
      ?auto_10516 - PLACE
      ?auto_10514 - PLACE
      ?auto_10511 - HOIST
      ?auto_10515 - SURFACE
      ?auto_10517 - PLACE
      ?auto_10509 - HOIST
      ?auto_10510 - SURFACE
      ?auto_10512 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10513 ?auto_10516 ) ( IS-CRATE ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10508 ) ) ( not ( = ?auto_10506 ?auto_10507 ) ) ( not ( = ?auto_10506 ?auto_10508 ) ) ( not ( = ?auto_10514 ?auto_10516 ) ) ( HOIST-AT ?auto_10511 ?auto_10514 ) ( not ( = ?auto_10513 ?auto_10511 ) ) ( AVAILABLE ?auto_10511 ) ( SURFACE-AT ?auto_10508 ?auto_10514 ) ( ON ?auto_10508 ?auto_10515 ) ( CLEAR ?auto_10508 ) ( not ( = ?auto_10507 ?auto_10515 ) ) ( not ( = ?auto_10508 ?auto_10515 ) ) ( not ( = ?auto_10506 ?auto_10515 ) ) ( SURFACE-AT ?auto_10506 ?auto_10516 ) ( CLEAR ?auto_10506 ) ( IS-CRATE ?auto_10507 ) ( AVAILABLE ?auto_10513 ) ( not ( = ?auto_10517 ?auto_10516 ) ) ( not ( = ?auto_10514 ?auto_10517 ) ) ( HOIST-AT ?auto_10509 ?auto_10517 ) ( not ( = ?auto_10513 ?auto_10509 ) ) ( not ( = ?auto_10511 ?auto_10509 ) ) ( AVAILABLE ?auto_10509 ) ( SURFACE-AT ?auto_10507 ?auto_10517 ) ( ON ?auto_10507 ?auto_10510 ) ( CLEAR ?auto_10507 ) ( not ( = ?auto_10507 ?auto_10510 ) ) ( not ( = ?auto_10508 ?auto_10510 ) ) ( not ( = ?auto_10506 ?auto_10510 ) ) ( not ( = ?auto_10515 ?auto_10510 ) ) ( TRUCK-AT ?auto_10512 ?auto_10516 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10507 ?auto_10508 )
      ( MAKE-2CRATE-VERIFY ?auto_10506 ?auto_10507 ?auto_10508 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10518 - SURFACE
      ?auto_10519 - SURFACE
      ?auto_10520 - SURFACE
      ?auto_10521 - SURFACE
    )
    :vars
    (
      ?auto_10525 - HOIST
      ?auto_10529 - PLACE
      ?auto_10526 - PLACE
      ?auto_10530 - HOIST
      ?auto_10527 - SURFACE
      ?auto_10528 - PLACE
      ?auto_10522 - HOIST
      ?auto_10524 - SURFACE
      ?auto_10523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10525 ?auto_10529 ) ( IS-CRATE ?auto_10521 ) ( not ( = ?auto_10520 ?auto_10521 ) ) ( not ( = ?auto_10519 ?auto_10520 ) ) ( not ( = ?auto_10519 ?auto_10521 ) ) ( not ( = ?auto_10526 ?auto_10529 ) ) ( HOIST-AT ?auto_10530 ?auto_10526 ) ( not ( = ?auto_10525 ?auto_10530 ) ) ( AVAILABLE ?auto_10530 ) ( SURFACE-AT ?auto_10521 ?auto_10526 ) ( ON ?auto_10521 ?auto_10527 ) ( CLEAR ?auto_10521 ) ( not ( = ?auto_10520 ?auto_10527 ) ) ( not ( = ?auto_10521 ?auto_10527 ) ) ( not ( = ?auto_10519 ?auto_10527 ) ) ( SURFACE-AT ?auto_10519 ?auto_10529 ) ( CLEAR ?auto_10519 ) ( IS-CRATE ?auto_10520 ) ( AVAILABLE ?auto_10525 ) ( not ( = ?auto_10528 ?auto_10529 ) ) ( not ( = ?auto_10526 ?auto_10528 ) ) ( HOIST-AT ?auto_10522 ?auto_10528 ) ( not ( = ?auto_10525 ?auto_10522 ) ) ( not ( = ?auto_10530 ?auto_10522 ) ) ( AVAILABLE ?auto_10522 ) ( SURFACE-AT ?auto_10520 ?auto_10528 ) ( ON ?auto_10520 ?auto_10524 ) ( CLEAR ?auto_10520 ) ( not ( = ?auto_10520 ?auto_10524 ) ) ( not ( = ?auto_10521 ?auto_10524 ) ) ( not ( = ?auto_10519 ?auto_10524 ) ) ( not ( = ?auto_10527 ?auto_10524 ) ) ( TRUCK-AT ?auto_10523 ?auto_10529 ) ( ON ?auto_10519 ?auto_10518 ) ( not ( = ?auto_10518 ?auto_10519 ) ) ( not ( = ?auto_10518 ?auto_10520 ) ) ( not ( = ?auto_10518 ?auto_10521 ) ) ( not ( = ?auto_10518 ?auto_10527 ) ) ( not ( = ?auto_10518 ?auto_10524 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10519 ?auto_10520 ?auto_10521 )
      ( MAKE-3CRATE-VERIFY ?auto_10518 ?auto_10519 ?auto_10520 ?auto_10521 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10531 - SURFACE
      ?auto_10532 - SURFACE
      ?auto_10533 - SURFACE
      ?auto_10534 - SURFACE
      ?auto_10535 - SURFACE
    )
    :vars
    (
      ?auto_10539 - HOIST
      ?auto_10543 - PLACE
      ?auto_10540 - PLACE
      ?auto_10544 - HOIST
      ?auto_10541 - SURFACE
      ?auto_10542 - PLACE
      ?auto_10536 - HOIST
      ?auto_10538 - SURFACE
      ?auto_10537 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10539 ?auto_10543 ) ( IS-CRATE ?auto_10535 ) ( not ( = ?auto_10534 ?auto_10535 ) ) ( not ( = ?auto_10533 ?auto_10534 ) ) ( not ( = ?auto_10533 ?auto_10535 ) ) ( not ( = ?auto_10540 ?auto_10543 ) ) ( HOIST-AT ?auto_10544 ?auto_10540 ) ( not ( = ?auto_10539 ?auto_10544 ) ) ( AVAILABLE ?auto_10544 ) ( SURFACE-AT ?auto_10535 ?auto_10540 ) ( ON ?auto_10535 ?auto_10541 ) ( CLEAR ?auto_10535 ) ( not ( = ?auto_10534 ?auto_10541 ) ) ( not ( = ?auto_10535 ?auto_10541 ) ) ( not ( = ?auto_10533 ?auto_10541 ) ) ( SURFACE-AT ?auto_10533 ?auto_10543 ) ( CLEAR ?auto_10533 ) ( IS-CRATE ?auto_10534 ) ( AVAILABLE ?auto_10539 ) ( not ( = ?auto_10542 ?auto_10543 ) ) ( not ( = ?auto_10540 ?auto_10542 ) ) ( HOIST-AT ?auto_10536 ?auto_10542 ) ( not ( = ?auto_10539 ?auto_10536 ) ) ( not ( = ?auto_10544 ?auto_10536 ) ) ( AVAILABLE ?auto_10536 ) ( SURFACE-AT ?auto_10534 ?auto_10542 ) ( ON ?auto_10534 ?auto_10538 ) ( CLEAR ?auto_10534 ) ( not ( = ?auto_10534 ?auto_10538 ) ) ( not ( = ?auto_10535 ?auto_10538 ) ) ( not ( = ?auto_10533 ?auto_10538 ) ) ( not ( = ?auto_10541 ?auto_10538 ) ) ( TRUCK-AT ?auto_10537 ?auto_10543 ) ( ON ?auto_10532 ?auto_10531 ) ( ON ?auto_10533 ?auto_10532 ) ( not ( = ?auto_10531 ?auto_10532 ) ) ( not ( = ?auto_10531 ?auto_10533 ) ) ( not ( = ?auto_10531 ?auto_10534 ) ) ( not ( = ?auto_10531 ?auto_10535 ) ) ( not ( = ?auto_10531 ?auto_10541 ) ) ( not ( = ?auto_10531 ?auto_10538 ) ) ( not ( = ?auto_10532 ?auto_10533 ) ) ( not ( = ?auto_10532 ?auto_10534 ) ) ( not ( = ?auto_10532 ?auto_10535 ) ) ( not ( = ?auto_10532 ?auto_10541 ) ) ( not ( = ?auto_10532 ?auto_10538 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10533 ?auto_10534 ?auto_10535 )
      ( MAKE-4CRATE-VERIFY ?auto_10531 ?auto_10532 ?auto_10533 ?auto_10534 ?auto_10535 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10545 - SURFACE
      ?auto_10546 - SURFACE
    )
    :vars
    (
      ?auto_10550 - HOIST
      ?auto_10555 - PLACE
      ?auto_10553 - SURFACE
      ?auto_10551 - PLACE
      ?auto_10556 - HOIST
      ?auto_10552 - SURFACE
      ?auto_10554 - PLACE
      ?auto_10547 - HOIST
      ?auto_10549 - SURFACE
      ?auto_10548 - TRUCK
      ?auto_10557 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10550 ?auto_10555 ) ( IS-CRATE ?auto_10546 ) ( not ( = ?auto_10545 ?auto_10546 ) ) ( not ( = ?auto_10553 ?auto_10545 ) ) ( not ( = ?auto_10553 ?auto_10546 ) ) ( not ( = ?auto_10551 ?auto_10555 ) ) ( HOIST-AT ?auto_10556 ?auto_10551 ) ( not ( = ?auto_10550 ?auto_10556 ) ) ( AVAILABLE ?auto_10556 ) ( SURFACE-AT ?auto_10546 ?auto_10551 ) ( ON ?auto_10546 ?auto_10552 ) ( CLEAR ?auto_10546 ) ( not ( = ?auto_10545 ?auto_10552 ) ) ( not ( = ?auto_10546 ?auto_10552 ) ) ( not ( = ?auto_10553 ?auto_10552 ) ) ( IS-CRATE ?auto_10545 ) ( not ( = ?auto_10554 ?auto_10555 ) ) ( not ( = ?auto_10551 ?auto_10554 ) ) ( HOIST-AT ?auto_10547 ?auto_10554 ) ( not ( = ?auto_10550 ?auto_10547 ) ) ( not ( = ?auto_10556 ?auto_10547 ) ) ( AVAILABLE ?auto_10547 ) ( SURFACE-AT ?auto_10545 ?auto_10554 ) ( ON ?auto_10545 ?auto_10549 ) ( CLEAR ?auto_10545 ) ( not ( = ?auto_10545 ?auto_10549 ) ) ( not ( = ?auto_10546 ?auto_10549 ) ) ( not ( = ?auto_10553 ?auto_10549 ) ) ( not ( = ?auto_10552 ?auto_10549 ) ) ( TRUCK-AT ?auto_10548 ?auto_10555 ) ( SURFACE-AT ?auto_10557 ?auto_10555 ) ( CLEAR ?auto_10557 ) ( LIFTING ?auto_10550 ?auto_10553 ) ( IS-CRATE ?auto_10553 ) ( not ( = ?auto_10557 ?auto_10553 ) ) ( not ( = ?auto_10545 ?auto_10557 ) ) ( not ( = ?auto_10546 ?auto_10557 ) ) ( not ( = ?auto_10552 ?auto_10557 ) ) ( not ( = ?auto_10549 ?auto_10557 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10557 ?auto_10553 )
      ( MAKE-2CRATE ?auto_10553 ?auto_10545 ?auto_10546 )
      ( MAKE-1CRATE-VERIFY ?auto_10545 ?auto_10546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10558 - SURFACE
      ?auto_10559 - SURFACE
      ?auto_10560 - SURFACE
    )
    :vars
    (
      ?auto_10567 - HOIST
      ?auto_10564 - PLACE
      ?auto_10565 - PLACE
      ?auto_10569 - HOIST
      ?auto_10563 - SURFACE
      ?auto_10568 - PLACE
      ?auto_10562 - HOIST
      ?auto_10566 - SURFACE
      ?auto_10561 - TRUCK
      ?auto_10570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10567 ?auto_10564 ) ( IS-CRATE ?auto_10560 ) ( not ( = ?auto_10559 ?auto_10560 ) ) ( not ( = ?auto_10558 ?auto_10559 ) ) ( not ( = ?auto_10558 ?auto_10560 ) ) ( not ( = ?auto_10565 ?auto_10564 ) ) ( HOIST-AT ?auto_10569 ?auto_10565 ) ( not ( = ?auto_10567 ?auto_10569 ) ) ( AVAILABLE ?auto_10569 ) ( SURFACE-AT ?auto_10560 ?auto_10565 ) ( ON ?auto_10560 ?auto_10563 ) ( CLEAR ?auto_10560 ) ( not ( = ?auto_10559 ?auto_10563 ) ) ( not ( = ?auto_10560 ?auto_10563 ) ) ( not ( = ?auto_10558 ?auto_10563 ) ) ( IS-CRATE ?auto_10559 ) ( not ( = ?auto_10568 ?auto_10564 ) ) ( not ( = ?auto_10565 ?auto_10568 ) ) ( HOIST-AT ?auto_10562 ?auto_10568 ) ( not ( = ?auto_10567 ?auto_10562 ) ) ( not ( = ?auto_10569 ?auto_10562 ) ) ( AVAILABLE ?auto_10562 ) ( SURFACE-AT ?auto_10559 ?auto_10568 ) ( ON ?auto_10559 ?auto_10566 ) ( CLEAR ?auto_10559 ) ( not ( = ?auto_10559 ?auto_10566 ) ) ( not ( = ?auto_10560 ?auto_10566 ) ) ( not ( = ?auto_10558 ?auto_10566 ) ) ( not ( = ?auto_10563 ?auto_10566 ) ) ( TRUCK-AT ?auto_10561 ?auto_10564 ) ( SURFACE-AT ?auto_10570 ?auto_10564 ) ( CLEAR ?auto_10570 ) ( LIFTING ?auto_10567 ?auto_10558 ) ( IS-CRATE ?auto_10558 ) ( not ( = ?auto_10570 ?auto_10558 ) ) ( not ( = ?auto_10559 ?auto_10570 ) ) ( not ( = ?auto_10560 ?auto_10570 ) ) ( not ( = ?auto_10563 ?auto_10570 ) ) ( not ( = ?auto_10566 ?auto_10570 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10559 ?auto_10560 )
      ( MAKE-2CRATE-VERIFY ?auto_10558 ?auto_10559 ?auto_10560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10571 - SURFACE
      ?auto_10572 - SURFACE
      ?auto_10573 - SURFACE
      ?auto_10574 - SURFACE
    )
    :vars
    (
      ?auto_10576 - HOIST
      ?auto_10577 - PLACE
      ?auto_10575 - PLACE
      ?auto_10578 - HOIST
      ?auto_10580 - SURFACE
      ?auto_10582 - PLACE
      ?auto_10583 - HOIST
      ?auto_10581 - SURFACE
      ?auto_10579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10576 ?auto_10577 ) ( IS-CRATE ?auto_10574 ) ( not ( = ?auto_10573 ?auto_10574 ) ) ( not ( = ?auto_10572 ?auto_10573 ) ) ( not ( = ?auto_10572 ?auto_10574 ) ) ( not ( = ?auto_10575 ?auto_10577 ) ) ( HOIST-AT ?auto_10578 ?auto_10575 ) ( not ( = ?auto_10576 ?auto_10578 ) ) ( AVAILABLE ?auto_10578 ) ( SURFACE-AT ?auto_10574 ?auto_10575 ) ( ON ?auto_10574 ?auto_10580 ) ( CLEAR ?auto_10574 ) ( not ( = ?auto_10573 ?auto_10580 ) ) ( not ( = ?auto_10574 ?auto_10580 ) ) ( not ( = ?auto_10572 ?auto_10580 ) ) ( IS-CRATE ?auto_10573 ) ( not ( = ?auto_10582 ?auto_10577 ) ) ( not ( = ?auto_10575 ?auto_10582 ) ) ( HOIST-AT ?auto_10583 ?auto_10582 ) ( not ( = ?auto_10576 ?auto_10583 ) ) ( not ( = ?auto_10578 ?auto_10583 ) ) ( AVAILABLE ?auto_10583 ) ( SURFACE-AT ?auto_10573 ?auto_10582 ) ( ON ?auto_10573 ?auto_10581 ) ( CLEAR ?auto_10573 ) ( not ( = ?auto_10573 ?auto_10581 ) ) ( not ( = ?auto_10574 ?auto_10581 ) ) ( not ( = ?auto_10572 ?auto_10581 ) ) ( not ( = ?auto_10580 ?auto_10581 ) ) ( TRUCK-AT ?auto_10579 ?auto_10577 ) ( SURFACE-AT ?auto_10571 ?auto_10577 ) ( CLEAR ?auto_10571 ) ( LIFTING ?auto_10576 ?auto_10572 ) ( IS-CRATE ?auto_10572 ) ( not ( = ?auto_10571 ?auto_10572 ) ) ( not ( = ?auto_10573 ?auto_10571 ) ) ( not ( = ?auto_10574 ?auto_10571 ) ) ( not ( = ?auto_10580 ?auto_10571 ) ) ( not ( = ?auto_10581 ?auto_10571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10572 ?auto_10573 ?auto_10574 )
      ( MAKE-3CRATE-VERIFY ?auto_10571 ?auto_10572 ?auto_10573 ?auto_10574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10584 - SURFACE
      ?auto_10585 - SURFACE
      ?auto_10586 - SURFACE
      ?auto_10587 - SURFACE
      ?auto_10588 - SURFACE
    )
    :vars
    (
      ?auto_10590 - HOIST
      ?auto_10591 - PLACE
      ?auto_10589 - PLACE
      ?auto_10592 - HOIST
      ?auto_10594 - SURFACE
      ?auto_10596 - PLACE
      ?auto_10597 - HOIST
      ?auto_10595 - SURFACE
      ?auto_10593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10590 ?auto_10591 ) ( IS-CRATE ?auto_10588 ) ( not ( = ?auto_10587 ?auto_10588 ) ) ( not ( = ?auto_10586 ?auto_10587 ) ) ( not ( = ?auto_10586 ?auto_10588 ) ) ( not ( = ?auto_10589 ?auto_10591 ) ) ( HOIST-AT ?auto_10592 ?auto_10589 ) ( not ( = ?auto_10590 ?auto_10592 ) ) ( AVAILABLE ?auto_10592 ) ( SURFACE-AT ?auto_10588 ?auto_10589 ) ( ON ?auto_10588 ?auto_10594 ) ( CLEAR ?auto_10588 ) ( not ( = ?auto_10587 ?auto_10594 ) ) ( not ( = ?auto_10588 ?auto_10594 ) ) ( not ( = ?auto_10586 ?auto_10594 ) ) ( IS-CRATE ?auto_10587 ) ( not ( = ?auto_10596 ?auto_10591 ) ) ( not ( = ?auto_10589 ?auto_10596 ) ) ( HOIST-AT ?auto_10597 ?auto_10596 ) ( not ( = ?auto_10590 ?auto_10597 ) ) ( not ( = ?auto_10592 ?auto_10597 ) ) ( AVAILABLE ?auto_10597 ) ( SURFACE-AT ?auto_10587 ?auto_10596 ) ( ON ?auto_10587 ?auto_10595 ) ( CLEAR ?auto_10587 ) ( not ( = ?auto_10587 ?auto_10595 ) ) ( not ( = ?auto_10588 ?auto_10595 ) ) ( not ( = ?auto_10586 ?auto_10595 ) ) ( not ( = ?auto_10594 ?auto_10595 ) ) ( TRUCK-AT ?auto_10593 ?auto_10591 ) ( SURFACE-AT ?auto_10585 ?auto_10591 ) ( CLEAR ?auto_10585 ) ( LIFTING ?auto_10590 ?auto_10586 ) ( IS-CRATE ?auto_10586 ) ( not ( = ?auto_10585 ?auto_10586 ) ) ( not ( = ?auto_10587 ?auto_10585 ) ) ( not ( = ?auto_10588 ?auto_10585 ) ) ( not ( = ?auto_10594 ?auto_10585 ) ) ( not ( = ?auto_10595 ?auto_10585 ) ) ( ON ?auto_10585 ?auto_10584 ) ( not ( = ?auto_10584 ?auto_10585 ) ) ( not ( = ?auto_10584 ?auto_10586 ) ) ( not ( = ?auto_10584 ?auto_10587 ) ) ( not ( = ?auto_10584 ?auto_10588 ) ) ( not ( = ?auto_10584 ?auto_10594 ) ) ( not ( = ?auto_10584 ?auto_10595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10586 ?auto_10587 ?auto_10588 )
      ( MAKE-4CRATE-VERIFY ?auto_10584 ?auto_10585 ?auto_10586 ?auto_10587 ?auto_10588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10598 - SURFACE
      ?auto_10599 - SURFACE
    )
    :vars
    (
      ?auto_10601 - HOIST
      ?auto_10602 - PLACE
      ?auto_10609 - SURFACE
      ?auto_10600 - PLACE
      ?auto_10603 - HOIST
      ?auto_10605 - SURFACE
      ?auto_10608 - PLACE
      ?auto_10610 - HOIST
      ?auto_10606 - SURFACE
      ?auto_10604 - TRUCK
      ?auto_10607 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10601 ?auto_10602 ) ( IS-CRATE ?auto_10599 ) ( not ( = ?auto_10598 ?auto_10599 ) ) ( not ( = ?auto_10609 ?auto_10598 ) ) ( not ( = ?auto_10609 ?auto_10599 ) ) ( not ( = ?auto_10600 ?auto_10602 ) ) ( HOIST-AT ?auto_10603 ?auto_10600 ) ( not ( = ?auto_10601 ?auto_10603 ) ) ( AVAILABLE ?auto_10603 ) ( SURFACE-AT ?auto_10599 ?auto_10600 ) ( ON ?auto_10599 ?auto_10605 ) ( CLEAR ?auto_10599 ) ( not ( = ?auto_10598 ?auto_10605 ) ) ( not ( = ?auto_10599 ?auto_10605 ) ) ( not ( = ?auto_10609 ?auto_10605 ) ) ( IS-CRATE ?auto_10598 ) ( not ( = ?auto_10608 ?auto_10602 ) ) ( not ( = ?auto_10600 ?auto_10608 ) ) ( HOIST-AT ?auto_10610 ?auto_10608 ) ( not ( = ?auto_10601 ?auto_10610 ) ) ( not ( = ?auto_10603 ?auto_10610 ) ) ( AVAILABLE ?auto_10610 ) ( SURFACE-AT ?auto_10598 ?auto_10608 ) ( ON ?auto_10598 ?auto_10606 ) ( CLEAR ?auto_10598 ) ( not ( = ?auto_10598 ?auto_10606 ) ) ( not ( = ?auto_10599 ?auto_10606 ) ) ( not ( = ?auto_10609 ?auto_10606 ) ) ( not ( = ?auto_10605 ?auto_10606 ) ) ( TRUCK-AT ?auto_10604 ?auto_10602 ) ( SURFACE-AT ?auto_10607 ?auto_10602 ) ( CLEAR ?auto_10607 ) ( IS-CRATE ?auto_10609 ) ( not ( = ?auto_10607 ?auto_10609 ) ) ( not ( = ?auto_10598 ?auto_10607 ) ) ( not ( = ?auto_10599 ?auto_10607 ) ) ( not ( = ?auto_10605 ?auto_10607 ) ) ( not ( = ?auto_10606 ?auto_10607 ) ) ( AVAILABLE ?auto_10601 ) ( IN ?auto_10609 ?auto_10604 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10601 ?auto_10609 ?auto_10604 ?auto_10602 )
      ( MAKE-2CRATE ?auto_10609 ?auto_10598 ?auto_10599 )
      ( MAKE-1CRATE-VERIFY ?auto_10598 ?auto_10599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10611 - SURFACE
      ?auto_10612 - SURFACE
      ?auto_10613 - SURFACE
    )
    :vars
    (
      ?auto_10620 - HOIST
      ?auto_10622 - PLACE
      ?auto_10623 - PLACE
      ?auto_10614 - HOIST
      ?auto_10618 - SURFACE
      ?auto_10615 - PLACE
      ?auto_10619 - HOIST
      ?auto_10617 - SURFACE
      ?auto_10616 - TRUCK
      ?auto_10621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10620 ?auto_10622 ) ( IS-CRATE ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10613 ) ) ( not ( = ?auto_10611 ?auto_10612 ) ) ( not ( = ?auto_10611 ?auto_10613 ) ) ( not ( = ?auto_10623 ?auto_10622 ) ) ( HOIST-AT ?auto_10614 ?auto_10623 ) ( not ( = ?auto_10620 ?auto_10614 ) ) ( AVAILABLE ?auto_10614 ) ( SURFACE-AT ?auto_10613 ?auto_10623 ) ( ON ?auto_10613 ?auto_10618 ) ( CLEAR ?auto_10613 ) ( not ( = ?auto_10612 ?auto_10618 ) ) ( not ( = ?auto_10613 ?auto_10618 ) ) ( not ( = ?auto_10611 ?auto_10618 ) ) ( IS-CRATE ?auto_10612 ) ( not ( = ?auto_10615 ?auto_10622 ) ) ( not ( = ?auto_10623 ?auto_10615 ) ) ( HOIST-AT ?auto_10619 ?auto_10615 ) ( not ( = ?auto_10620 ?auto_10619 ) ) ( not ( = ?auto_10614 ?auto_10619 ) ) ( AVAILABLE ?auto_10619 ) ( SURFACE-AT ?auto_10612 ?auto_10615 ) ( ON ?auto_10612 ?auto_10617 ) ( CLEAR ?auto_10612 ) ( not ( = ?auto_10612 ?auto_10617 ) ) ( not ( = ?auto_10613 ?auto_10617 ) ) ( not ( = ?auto_10611 ?auto_10617 ) ) ( not ( = ?auto_10618 ?auto_10617 ) ) ( TRUCK-AT ?auto_10616 ?auto_10622 ) ( SURFACE-AT ?auto_10621 ?auto_10622 ) ( CLEAR ?auto_10621 ) ( IS-CRATE ?auto_10611 ) ( not ( = ?auto_10621 ?auto_10611 ) ) ( not ( = ?auto_10612 ?auto_10621 ) ) ( not ( = ?auto_10613 ?auto_10621 ) ) ( not ( = ?auto_10618 ?auto_10621 ) ) ( not ( = ?auto_10617 ?auto_10621 ) ) ( AVAILABLE ?auto_10620 ) ( IN ?auto_10611 ?auto_10616 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10612 ?auto_10613 )
      ( MAKE-2CRATE-VERIFY ?auto_10611 ?auto_10612 ?auto_10613 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10624 - SURFACE
      ?auto_10625 - SURFACE
      ?auto_10626 - SURFACE
      ?auto_10627 - SURFACE
    )
    :vars
    (
      ?auto_10634 - HOIST
      ?auto_10628 - PLACE
      ?auto_10636 - PLACE
      ?auto_10632 - HOIST
      ?auto_10629 - SURFACE
      ?auto_10635 - PLACE
      ?auto_10630 - HOIST
      ?auto_10633 - SURFACE
      ?auto_10631 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10634 ?auto_10628 ) ( IS-CRATE ?auto_10627 ) ( not ( = ?auto_10626 ?auto_10627 ) ) ( not ( = ?auto_10625 ?auto_10626 ) ) ( not ( = ?auto_10625 ?auto_10627 ) ) ( not ( = ?auto_10636 ?auto_10628 ) ) ( HOIST-AT ?auto_10632 ?auto_10636 ) ( not ( = ?auto_10634 ?auto_10632 ) ) ( AVAILABLE ?auto_10632 ) ( SURFACE-AT ?auto_10627 ?auto_10636 ) ( ON ?auto_10627 ?auto_10629 ) ( CLEAR ?auto_10627 ) ( not ( = ?auto_10626 ?auto_10629 ) ) ( not ( = ?auto_10627 ?auto_10629 ) ) ( not ( = ?auto_10625 ?auto_10629 ) ) ( IS-CRATE ?auto_10626 ) ( not ( = ?auto_10635 ?auto_10628 ) ) ( not ( = ?auto_10636 ?auto_10635 ) ) ( HOIST-AT ?auto_10630 ?auto_10635 ) ( not ( = ?auto_10634 ?auto_10630 ) ) ( not ( = ?auto_10632 ?auto_10630 ) ) ( AVAILABLE ?auto_10630 ) ( SURFACE-AT ?auto_10626 ?auto_10635 ) ( ON ?auto_10626 ?auto_10633 ) ( CLEAR ?auto_10626 ) ( not ( = ?auto_10626 ?auto_10633 ) ) ( not ( = ?auto_10627 ?auto_10633 ) ) ( not ( = ?auto_10625 ?auto_10633 ) ) ( not ( = ?auto_10629 ?auto_10633 ) ) ( TRUCK-AT ?auto_10631 ?auto_10628 ) ( SURFACE-AT ?auto_10624 ?auto_10628 ) ( CLEAR ?auto_10624 ) ( IS-CRATE ?auto_10625 ) ( not ( = ?auto_10624 ?auto_10625 ) ) ( not ( = ?auto_10626 ?auto_10624 ) ) ( not ( = ?auto_10627 ?auto_10624 ) ) ( not ( = ?auto_10629 ?auto_10624 ) ) ( not ( = ?auto_10633 ?auto_10624 ) ) ( AVAILABLE ?auto_10634 ) ( IN ?auto_10625 ?auto_10631 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10625 ?auto_10626 ?auto_10627 )
      ( MAKE-3CRATE-VERIFY ?auto_10624 ?auto_10625 ?auto_10626 ?auto_10627 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10637 - SURFACE
      ?auto_10638 - SURFACE
      ?auto_10639 - SURFACE
      ?auto_10640 - SURFACE
      ?auto_10641 - SURFACE
    )
    :vars
    (
      ?auto_10648 - HOIST
      ?auto_10642 - PLACE
      ?auto_10650 - PLACE
      ?auto_10646 - HOIST
      ?auto_10643 - SURFACE
      ?auto_10649 - PLACE
      ?auto_10644 - HOIST
      ?auto_10647 - SURFACE
      ?auto_10645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10648 ?auto_10642 ) ( IS-CRATE ?auto_10641 ) ( not ( = ?auto_10640 ?auto_10641 ) ) ( not ( = ?auto_10639 ?auto_10640 ) ) ( not ( = ?auto_10639 ?auto_10641 ) ) ( not ( = ?auto_10650 ?auto_10642 ) ) ( HOIST-AT ?auto_10646 ?auto_10650 ) ( not ( = ?auto_10648 ?auto_10646 ) ) ( AVAILABLE ?auto_10646 ) ( SURFACE-AT ?auto_10641 ?auto_10650 ) ( ON ?auto_10641 ?auto_10643 ) ( CLEAR ?auto_10641 ) ( not ( = ?auto_10640 ?auto_10643 ) ) ( not ( = ?auto_10641 ?auto_10643 ) ) ( not ( = ?auto_10639 ?auto_10643 ) ) ( IS-CRATE ?auto_10640 ) ( not ( = ?auto_10649 ?auto_10642 ) ) ( not ( = ?auto_10650 ?auto_10649 ) ) ( HOIST-AT ?auto_10644 ?auto_10649 ) ( not ( = ?auto_10648 ?auto_10644 ) ) ( not ( = ?auto_10646 ?auto_10644 ) ) ( AVAILABLE ?auto_10644 ) ( SURFACE-AT ?auto_10640 ?auto_10649 ) ( ON ?auto_10640 ?auto_10647 ) ( CLEAR ?auto_10640 ) ( not ( = ?auto_10640 ?auto_10647 ) ) ( not ( = ?auto_10641 ?auto_10647 ) ) ( not ( = ?auto_10639 ?auto_10647 ) ) ( not ( = ?auto_10643 ?auto_10647 ) ) ( TRUCK-AT ?auto_10645 ?auto_10642 ) ( SURFACE-AT ?auto_10638 ?auto_10642 ) ( CLEAR ?auto_10638 ) ( IS-CRATE ?auto_10639 ) ( not ( = ?auto_10638 ?auto_10639 ) ) ( not ( = ?auto_10640 ?auto_10638 ) ) ( not ( = ?auto_10641 ?auto_10638 ) ) ( not ( = ?auto_10643 ?auto_10638 ) ) ( not ( = ?auto_10647 ?auto_10638 ) ) ( AVAILABLE ?auto_10648 ) ( IN ?auto_10639 ?auto_10645 ) ( ON ?auto_10638 ?auto_10637 ) ( not ( = ?auto_10637 ?auto_10638 ) ) ( not ( = ?auto_10637 ?auto_10639 ) ) ( not ( = ?auto_10637 ?auto_10640 ) ) ( not ( = ?auto_10637 ?auto_10641 ) ) ( not ( = ?auto_10637 ?auto_10643 ) ) ( not ( = ?auto_10637 ?auto_10647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10639 ?auto_10640 ?auto_10641 )
      ( MAKE-4CRATE-VERIFY ?auto_10637 ?auto_10638 ?auto_10639 ?auto_10640 ?auto_10641 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10651 - SURFACE
      ?auto_10652 - SURFACE
    )
    :vars
    (
      ?auto_10661 - HOIST
      ?auto_10654 - PLACE
      ?auto_10653 - SURFACE
      ?auto_10663 - PLACE
      ?auto_10658 - HOIST
      ?auto_10655 - SURFACE
      ?auto_10662 - PLACE
      ?auto_10656 - HOIST
      ?auto_10660 - SURFACE
      ?auto_10659 - SURFACE
      ?auto_10657 - TRUCK
      ?auto_10664 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10661 ?auto_10654 ) ( IS-CRATE ?auto_10652 ) ( not ( = ?auto_10651 ?auto_10652 ) ) ( not ( = ?auto_10653 ?auto_10651 ) ) ( not ( = ?auto_10653 ?auto_10652 ) ) ( not ( = ?auto_10663 ?auto_10654 ) ) ( HOIST-AT ?auto_10658 ?auto_10663 ) ( not ( = ?auto_10661 ?auto_10658 ) ) ( AVAILABLE ?auto_10658 ) ( SURFACE-AT ?auto_10652 ?auto_10663 ) ( ON ?auto_10652 ?auto_10655 ) ( CLEAR ?auto_10652 ) ( not ( = ?auto_10651 ?auto_10655 ) ) ( not ( = ?auto_10652 ?auto_10655 ) ) ( not ( = ?auto_10653 ?auto_10655 ) ) ( IS-CRATE ?auto_10651 ) ( not ( = ?auto_10662 ?auto_10654 ) ) ( not ( = ?auto_10663 ?auto_10662 ) ) ( HOIST-AT ?auto_10656 ?auto_10662 ) ( not ( = ?auto_10661 ?auto_10656 ) ) ( not ( = ?auto_10658 ?auto_10656 ) ) ( AVAILABLE ?auto_10656 ) ( SURFACE-AT ?auto_10651 ?auto_10662 ) ( ON ?auto_10651 ?auto_10660 ) ( CLEAR ?auto_10651 ) ( not ( = ?auto_10651 ?auto_10660 ) ) ( not ( = ?auto_10652 ?auto_10660 ) ) ( not ( = ?auto_10653 ?auto_10660 ) ) ( not ( = ?auto_10655 ?auto_10660 ) ) ( SURFACE-AT ?auto_10659 ?auto_10654 ) ( CLEAR ?auto_10659 ) ( IS-CRATE ?auto_10653 ) ( not ( = ?auto_10659 ?auto_10653 ) ) ( not ( = ?auto_10651 ?auto_10659 ) ) ( not ( = ?auto_10652 ?auto_10659 ) ) ( not ( = ?auto_10655 ?auto_10659 ) ) ( not ( = ?auto_10660 ?auto_10659 ) ) ( AVAILABLE ?auto_10661 ) ( IN ?auto_10653 ?auto_10657 ) ( TRUCK-AT ?auto_10657 ?auto_10664 ) ( not ( = ?auto_10664 ?auto_10654 ) ) ( not ( = ?auto_10663 ?auto_10664 ) ) ( not ( = ?auto_10662 ?auto_10664 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_10657 ?auto_10664 ?auto_10654 )
      ( MAKE-2CRATE ?auto_10653 ?auto_10651 ?auto_10652 )
      ( MAKE-1CRATE-VERIFY ?auto_10651 ?auto_10652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10665 - SURFACE
      ?auto_10666 - SURFACE
      ?auto_10667 - SURFACE
    )
    :vars
    (
      ?auto_10671 - HOIST
      ?auto_10674 - PLACE
      ?auto_10668 - PLACE
      ?auto_10677 - HOIST
      ?auto_10673 - SURFACE
      ?auto_10670 - PLACE
      ?auto_10675 - HOIST
      ?auto_10676 - SURFACE
      ?auto_10678 - SURFACE
      ?auto_10672 - TRUCK
      ?auto_10669 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10671 ?auto_10674 ) ( IS-CRATE ?auto_10667 ) ( not ( = ?auto_10666 ?auto_10667 ) ) ( not ( = ?auto_10665 ?auto_10666 ) ) ( not ( = ?auto_10665 ?auto_10667 ) ) ( not ( = ?auto_10668 ?auto_10674 ) ) ( HOIST-AT ?auto_10677 ?auto_10668 ) ( not ( = ?auto_10671 ?auto_10677 ) ) ( AVAILABLE ?auto_10677 ) ( SURFACE-AT ?auto_10667 ?auto_10668 ) ( ON ?auto_10667 ?auto_10673 ) ( CLEAR ?auto_10667 ) ( not ( = ?auto_10666 ?auto_10673 ) ) ( not ( = ?auto_10667 ?auto_10673 ) ) ( not ( = ?auto_10665 ?auto_10673 ) ) ( IS-CRATE ?auto_10666 ) ( not ( = ?auto_10670 ?auto_10674 ) ) ( not ( = ?auto_10668 ?auto_10670 ) ) ( HOIST-AT ?auto_10675 ?auto_10670 ) ( not ( = ?auto_10671 ?auto_10675 ) ) ( not ( = ?auto_10677 ?auto_10675 ) ) ( AVAILABLE ?auto_10675 ) ( SURFACE-AT ?auto_10666 ?auto_10670 ) ( ON ?auto_10666 ?auto_10676 ) ( CLEAR ?auto_10666 ) ( not ( = ?auto_10666 ?auto_10676 ) ) ( not ( = ?auto_10667 ?auto_10676 ) ) ( not ( = ?auto_10665 ?auto_10676 ) ) ( not ( = ?auto_10673 ?auto_10676 ) ) ( SURFACE-AT ?auto_10678 ?auto_10674 ) ( CLEAR ?auto_10678 ) ( IS-CRATE ?auto_10665 ) ( not ( = ?auto_10678 ?auto_10665 ) ) ( not ( = ?auto_10666 ?auto_10678 ) ) ( not ( = ?auto_10667 ?auto_10678 ) ) ( not ( = ?auto_10673 ?auto_10678 ) ) ( not ( = ?auto_10676 ?auto_10678 ) ) ( AVAILABLE ?auto_10671 ) ( IN ?auto_10665 ?auto_10672 ) ( TRUCK-AT ?auto_10672 ?auto_10669 ) ( not ( = ?auto_10669 ?auto_10674 ) ) ( not ( = ?auto_10668 ?auto_10669 ) ) ( not ( = ?auto_10670 ?auto_10669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10666 ?auto_10667 )
      ( MAKE-2CRATE-VERIFY ?auto_10665 ?auto_10666 ?auto_10667 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10679 - SURFACE
      ?auto_10680 - SURFACE
      ?auto_10681 - SURFACE
      ?auto_10682 - SURFACE
    )
    :vars
    (
      ?auto_10684 - HOIST
      ?auto_10687 - PLACE
      ?auto_10689 - PLACE
      ?auto_10691 - HOIST
      ?auto_10688 - SURFACE
      ?auto_10685 - PLACE
      ?auto_10692 - HOIST
      ?auto_10683 - SURFACE
      ?auto_10686 - TRUCK
      ?auto_10690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10684 ?auto_10687 ) ( IS-CRATE ?auto_10682 ) ( not ( = ?auto_10681 ?auto_10682 ) ) ( not ( = ?auto_10680 ?auto_10681 ) ) ( not ( = ?auto_10680 ?auto_10682 ) ) ( not ( = ?auto_10689 ?auto_10687 ) ) ( HOIST-AT ?auto_10691 ?auto_10689 ) ( not ( = ?auto_10684 ?auto_10691 ) ) ( AVAILABLE ?auto_10691 ) ( SURFACE-AT ?auto_10682 ?auto_10689 ) ( ON ?auto_10682 ?auto_10688 ) ( CLEAR ?auto_10682 ) ( not ( = ?auto_10681 ?auto_10688 ) ) ( not ( = ?auto_10682 ?auto_10688 ) ) ( not ( = ?auto_10680 ?auto_10688 ) ) ( IS-CRATE ?auto_10681 ) ( not ( = ?auto_10685 ?auto_10687 ) ) ( not ( = ?auto_10689 ?auto_10685 ) ) ( HOIST-AT ?auto_10692 ?auto_10685 ) ( not ( = ?auto_10684 ?auto_10692 ) ) ( not ( = ?auto_10691 ?auto_10692 ) ) ( AVAILABLE ?auto_10692 ) ( SURFACE-AT ?auto_10681 ?auto_10685 ) ( ON ?auto_10681 ?auto_10683 ) ( CLEAR ?auto_10681 ) ( not ( = ?auto_10681 ?auto_10683 ) ) ( not ( = ?auto_10682 ?auto_10683 ) ) ( not ( = ?auto_10680 ?auto_10683 ) ) ( not ( = ?auto_10688 ?auto_10683 ) ) ( SURFACE-AT ?auto_10679 ?auto_10687 ) ( CLEAR ?auto_10679 ) ( IS-CRATE ?auto_10680 ) ( not ( = ?auto_10679 ?auto_10680 ) ) ( not ( = ?auto_10681 ?auto_10679 ) ) ( not ( = ?auto_10682 ?auto_10679 ) ) ( not ( = ?auto_10688 ?auto_10679 ) ) ( not ( = ?auto_10683 ?auto_10679 ) ) ( AVAILABLE ?auto_10684 ) ( IN ?auto_10680 ?auto_10686 ) ( TRUCK-AT ?auto_10686 ?auto_10690 ) ( not ( = ?auto_10690 ?auto_10687 ) ) ( not ( = ?auto_10689 ?auto_10690 ) ) ( not ( = ?auto_10685 ?auto_10690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10680 ?auto_10681 ?auto_10682 )
      ( MAKE-3CRATE-VERIFY ?auto_10679 ?auto_10680 ?auto_10681 ?auto_10682 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10693 - SURFACE
      ?auto_10694 - SURFACE
      ?auto_10695 - SURFACE
      ?auto_10696 - SURFACE
      ?auto_10697 - SURFACE
    )
    :vars
    (
      ?auto_10699 - HOIST
      ?auto_10702 - PLACE
      ?auto_10704 - PLACE
      ?auto_10706 - HOIST
      ?auto_10703 - SURFACE
      ?auto_10700 - PLACE
      ?auto_10707 - HOIST
      ?auto_10698 - SURFACE
      ?auto_10701 - TRUCK
      ?auto_10705 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10699 ?auto_10702 ) ( IS-CRATE ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10697 ) ) ( not ( = ?auto_10695 ?auto_10696 ) ) ( not ( = ?auto_10695 ?auto_10697 ) ) ( not ( = ?auto_10704 ?auto_10702 ) ) ( HOIST-AT ?auto_10706 ?auto_10704 ) ( not ( = ?auto_10699 ?auto_10706 ) ) ( AVAILABLE ?auto_10706 ) ( SURFACE-AT ?auto_10697 ?auto_10704 ) ( ON ?auto_10697 ?auto_10703 ) ( CLEAR ?auto_10697 ) ( not ( = ?auto_10696 ?auto_10703 ) ) ( not ( = ?auto_10697 ?auto_10703 ) ) ( not ( = ?auto_10695 ?auto_10703 ) ) ( IS-CRATE ?auto_10696 ) ( not ( = ?auto_10700 ?auto_10702 ) ) ( not ( = ?auto_10704 ?auto_10700 ) ) ( HOIST-AT ?auto_10707 ?auto_10700 ) ( not ( = ?auto_10699 ?auto_10707 ) ) ( not ( = ?auto_10706 ?auto_10707 ) ) ( AVAILABLE ?auto_10707 ) ( SURFACE-AT ?auto_10696 ?auto_10700 ) ( ON ?auto_10696 ?auto_10698 ) ( CLEAR ?auto_10696 ) ( not ( = ?auto_10696 ?auto_10698 ) ) ( not ( = ?auto_10697 ?auto_10698 ) ) ( not ( = ?auto_10695 ?auto_10698 ) ) ( not ( = ?auto_10703 ?auto_10698 ) ) ( SURFACE-AT ?auto_10694 ?auto_10702 ) ( CLEAR ?auto_10694 ) ( IS-CRATE ?auto_10695 ) ( not ( = ?auto_10694 ?auto_10695 ) ) ( not ( = ?auto_10696 ?auto_10694 ) ) ( not ( = ?auto_10697 ?auto_10694 ) ) ( not ( = ?auto_10703 ?auto_10694 ) ) ( not ( = ?auto_10698 ?auto_10694 ) ) ( AVAILABLE ?auto_10699 ) ( IN ?auto_10695 ?auto_10701 ) ( TRUCK-AT ?auto_10701 ?auto_10705 ) ( not ( = ?auto_10705 ?auto_10702 ) ) ( not ( = ?auto_10704 ?auto_10705 ) ) ( not ( = ?auto_10700 ?auto_10705 ) ) ( ON ?auto_10694 ?auto_10693 ) ( not ( = ?auto_10693 ?auto_10694 ) ) ( not ( = ?auto_10693 ?auto_10695 ) ) ( not ( = ?auto_10693 ?auto_10696 ) ) ( not ( = ?auto_10693 ?auto_10697 ) ) ( not ( = ?auto_10693 ?auto_10703 ) ) ( not ( = ?auto_10693 ?auto_10698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10695 ?auto_10696 ?auto_10697 )
      ( MAKE-4CRATE-VERIFY ?auto_10693 ?auto_10694 ?auto_10695 ?auto_10696 ?auto_10697 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10708 - SURFACE
      ?auto_10709 - SURFACE
    )
    :vars
    (
      ?auto_10712 - HOIST
      ?auto_10716 - PLACE
      ?auto_10714 - SURFACE
      ?auto_10718 - PLACE
      ?auto_10720 - HOIST
      ?auto_10717 - SURFACE
      ?auto_10713 - PLACE
      ?auto_10721 - HOIST
      ?auto_10710 - SURFACE
      ?auto_10711 - SURFACE
      ?auto_10715 - TRUCK
      ?auto_10719 - PLACE
      ?auto_10722 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10712 ?auto_10716 ) ( IS-CRATE ?auto_10709 ) ( not ( = ?auto_10708 ?auto_10709 ) ) ( not ( = ?auto_10714 ?auto_10708 ) ) ( not ( = ?auto_10714 ?auto_10709 ) ) ( not ( = ?auto_10718 ?auto_10716 ) ) ( HOIST-AT ?auto_10720 ?auto_10718 ) ( not ( = ?auto_10712 ?auto_10720 ) ) ( AVAILABLE ?auto_10720 ) ( SURFACE-AT ?auto_10709 ?auto_10718 ) ( ON ?auto_10709 ?auto_10717 ) ( CLEAR ?auto_10709 ) ( not ( = ?auto_10708 ?auto_10717 ) ) ( not ( = ?auto_10709 ?auto_10717 ) ) ( not ( = ?auto_10714 ?auto_10717 ) ) ( IS-CRATE ?auto_10708 ) ( not ( = ?auto_10713 ?auto_10716 ) ) ( not ( = ?auto_10718 ?auto_10713 ) ) ( HOIST-AT ?auto_10721 ?auto_10713 ) ( not ( = ?auto_10712 ?auto_10721 ) ) ( not ( = ?auto_10720 ?auto_10721 ) ) ( AVAILABLE ?auto_10721 ) ( SURFACE-AT ?auto_10708 ?auto_10713 ) ( ON ?auto_10708 ?auto_10710 ) ( CLEAR ?auto_10708 ) ( not ( = ?auto_10708 ?auto_10710 ) ) ( not ( = ?auto_10709 ?auto_10710 ) ) ( not ( = ?auto_10714 ?auto_10710 ) ) ( not ( = ?auto_10717 ?auto_10710 ) ) ( SURFACE-AT ?auto_10711 ?auto_10716 ) ( CLEAR ?auto_10711 ) ( IS-CRATE ?auto_10714 ) ( not ( = ?auto_10711 ?auto_10714 ) ) ( not ( = ?auto_10708 ?auto_10711 ) ) ( not ( = ?auto_10709 ?auto_10711 ) ) ( not ( = ?auto_10717 ?auto_10711 ) ) ( not ( = ?auto_10710 ?auto_10711 ) ) ( AVAILABLE ?auto_10712 ) ( TRUCK-AT ?auto_10715 ?auto_10719 ) ( not ( = ?auto_10719 ?auto_10716 ) ) ( not ( = ?auto_10718 ?auto_10719 ) ) ( not ( = ?auto_10713 ?auto_10719 ) ) ( HOIST-AT ?auto_10722 ?auto_10719 ) ( LIFTING ?auto_10722 ?auto_10714 ) ( not ( = ?auto_10712 ?auto_10722 ) ) ( not ( = ?auto_10720 ?auto_10722 ) ) ( not ( = ?auto_10721 ?auto_10722 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10722 ?auto_10714 ?auto_10715 ?auto_10719 )
      ( MAKE-2CRATE ?auto_10714 ?auto_10708 ?auto_10709 )
      ( MAKE-1CRATE-VERIFY ?auto_10708 ?auto_10709 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10723 - SURFACE
      ?auto_10724 - SURFACE
      ?auto_10725 - SURFACE
    )
    :vars
    (
      ?auto_10735 - HOIST
      ?auto_10727 - PLACE
      ?auto_10733 - PLACE
      ?auto_10737 - HOIST
      ?auto_10728 - SURFACE
      ?auto_10726 - PLACE
      ?auto_10731 - HOIST
      ?auto_10736 - SURFACE
      ?auto_10730 - SURFACE
      ?auto_10734 - TRUCK
      ?auto_10732 - PLACE
      ?auto_10729 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10735 ?auto_10727 ) ( IS-CRATE ?auto_10725 ) ( not ( = ?auto_10724 ?auto_10725 ) ) ( not ( = ?auto_10723 ?auto_10724 ) ) ( not ( = ?auto_10723 ?auto_10725 ) ) ( not ( = ?auto_10733 ?auto_10727 ) ) ( HOIST-AT ?auto_10737 ?auto_10733 ) ( not ( = ?auto_10735 ?auto_10737 ) ) ( AVAILABLE ?auto_10737 ) ( SURFACE-AT ?auto_10725 ?auto_10733 ) ( ON ?auto_10725 ?auto_10728 ) ( CLEAR ?auto_10725 ) ( not ( = ?auto_10724 ?auto_10728 ) ) ( not ( = ?auto_10725 ?auto_10728 ) ) ( not ( = ?auto_10723 ?auto_10728 ) ) ( IS-CRATE ?auto_10724 ) ( not ( = ?auto_10726 ?auto_10727 ) ) ( not ( = ?auto_10733 ?auto_10726 ) ) ( HOIST-AT ?auto_10731 ?auto_10726 ) ( not ( = ?auto_10735 ?auto_10731 ) ) ( not ( = ?auto_10737 ?auto_10731 ) ) ( AVAILABLE ?auto_10731 ) ( SURFACE-AT ?auto_10724 ?auto_10726 ) ( ON ?auto_10724 ?auto_10736 ) ( CLEAR ?auto_10724 ) ( not ( = ?auto_10724 ?auto_10736 ) ) ( not ( = ?auto_10725 ?auto_10736 ) ) ( not ( = ?auto_10723 ?auto_10736 ) ) ( not ( = ?auto_10728 ?auto_10736 ) ) ( SURFACE-AT ?auto_10730 ?auto_10727 ) ( CLEAR ?auto_10730 ) ( IS-CRATE ?auto_10723 ) ( not ( = ?auto_10730 ?auto_10723 ) ) ( not ( = ?auto_10724 ?auto_10730 ) ) ( not ( = ?auto_10725 ?auto_10730 ) ) ( not ( = ?auto_10728 ?auto_10730 ) ) ( not ( = ?auto_10736 ?auto_10730 ) ) ( AVAILABLE ?auto_10735 ) ( TRUCK-AT ?auto_10734 ?auto_10732 ) ( not ( = ?auto_10732 ?auto_10727 ) ) ( not ( = ?auto_10733 ?auto_10732 ) ) ( not ( = ?auto_10726 ?auto_10732 ) ) ( HOIST-AT ?auto_10729 ?auto_10732 ) ( LIFTING ?auto_10729 ?auto_10723 ) ( not ( = ?auto_10735 ?auto_10729 ) ) ( not ( = ?auto_10737 ?auto_10729 ) ) ( not ( = ?auto_10731 ?auto_10729 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10724 ?auto_10725 )
      ( MAKE-2CRATE-VERIFY ?auto_10723 ?auto_10724 ?auto_10725 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10738 - SURFACE
      ?auto_10739 - SURFACE
      ?auto_10740 - SURFACE
      ?auto_10741 - SURFACE
    )
    :vars
    (
      ?auto_10745 - HOIST
      ?auto_10751 - PLACE
      ?auto_10746 - PLACE
      ?auto_10747 - HOIST
      ?auto_10743 - SURFACE
      ?auto_10744 - PLACE
      ?auto_10749 - HOIST
      ?auto_10752 - SURFACE
      ?auto_10742 - TRUCK
      ?auto_10748 - PLACE
      ?auto_10750 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10745 ?auto_10751 ) ( IS-CRATE ?auto_10741 ) ( not ( = ?auto_10740 ?auto_10741 ) ) ( not ( = ?auto_10739 ?auto_10740 ) ) ( not ( = ?auto_10739 ?auto_10741 ) ) ( not ( = ?auto_10746 ?auto_10751 ) ) ( HOIST-AT ?auto_10747 ?auto_10746 ) ( not ( = ?auto_10745 ?auto_10747 ) ) ( AVAILABLE ?auto_10747 ) ( SURFACE-AT ?auto_10741 ?auto_10746 ) ( ON ?auto_10741 ?auto_10743 ) ( CLEAR ?auto_10741 ) ( not ( = ?auto_10740 ?auto_10743 ) ) ( not ( = ?auto_10741 ?auto_10743 ) ) ( not ( = ?auto_10739 ?auto_10743 ) ) ( IS-CRATE ?auto_10740 ) ( not ( = ?auto_10744 ?auto_10751 ) ) ( not ( = ?auto_10746 ?auto_10744 ) ) ( HOIST-AT ?auto_10749 ?auto_10744 ) ( not ( = ?auto_10745 ?auto_10749 ) ) ( not ( = ?auto_10747 ?auto_10749 ) ) ( AVAILABLE ?auto_10749 ) ( SURFACE-AT ?auto_10740 ?auto_10744 ) ( ON ?auto_10740 ?auto_10752 ) ( CLEAR ?auto_10740 ) ( not ( = ?auto_10740 ?auto_10752 ) ) ( not ( = ?auto_10741 ?auto_10752 ) ) ( not ( = ?auto_10739 ?auto_10752 ) ) ( not ( = ?auto_10743 ?auto_10752 ) ) ( SURFACE-AT ?auto_10738 ?auto_10751 ) ( CLEAR ?auto_10738 ) ( IS-CRATE ?auto_10739 ) ( not ( = ?auto_10738 ?auto_10739 ) ) ( not ( = ?auto_10740 ?auto_10738 ) ) ( not ( = ?auto_10741 ?auto_10738 ) ) ( not ( = ?auto_10743 ?auto_10738 ) ) ( not ( = ?auto_10752 ?auto_10738 ) ) ( AVAILABLE ?auto_10745 ) ( TRUCK-AT ?auto_10742 ?auto_10748 ) ( not ( = ?auto_10748 ?auto_10751 ) ) ( not ( = ?auto_10746 ?auto_10748 ) ) ( not ( = ?auto_10744 ?auto_10748 ) ) ( HOIST-AT ?auto_10750 ?auto_10748 ) ( LIFTING ?auto_10750 ?auto_10739 ) ( not ( = ?auto_10745 ?auto_10750 ) ) ( not ( = ?auto_10747 ?auto_10750 ) ) ( not ( = ?auto_10749 ?auto_10750 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10739 ?auto_10740 ?auto_10741 )
      ( MAKE-3CRATE-VERIFY ?auto_10738 ?auto_10739 ?auto_10740 ?auto_10741 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10753 - SURFACE
      ?auto_10754 - SURFACE
      ?auto_10755 - SURFACE
      ?auto_10756 - SURFACE
      ?auto_10757 - SURFACE
    )
    :vars
    (
      ?auto_10761 - HOIST
      ?auto_10767 - PLACE
      ?auto_10762 - PLACE
      ?auto_10763 - HOIST
      ?auto_10759 - SURFACE
      ?auto_10760 - PLACE
      ?auto_10765 - HOIST
      ?auto_10768 - SURFACE
      ?auto_10758 - TRUCK
      ?auto_10764 - PLACE
      ?auto_10766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10761 ?auto_10767 ) ( IS-CRATE ?auto_10757 ) ( not ( = ?auto_10756 ?auto_10757 ) ) ( not ( = ?auto_10755 ?auto_10756 ) ) ( not ( = ?auto_10755 ?auto_10757 ) ) ( not ( = ?auto_10762 ?auto_10767 ) ) ( HOIST-AT ?auto_10763 ?auto_10762 ) ( not ( = ?auto_10761 ?auto_10763 ) ) ( AVAILABLE ?auto_10763 ) ( SURFACE-AT ?auto_10757 ?auto_10762 ) ( ON ?auto_10757 ?auto_10759 ) ( CLEAR ?auto_10757 ) ( not ( = ?auto_10756 ?auto_10759 ) ) ( not ( = ?auto_10757 ?auto_10759 ) ) ( not ( = ?auto_10755 ?auto_10759 ) ) ( IS-CRATE ?auto_10756 ) ( not ( = ?auto_10760 ?auto_10767 ) ) ( not ( = ?auto_10762 ?auto_10760 ) ) ( HOIST-AT ?auto_10765 ?auto_10760 ) ( not ( = ?auto_10761 ?auto_10765 ) ) ( not ( = ?auto_10763 ?auto_10765 ) ) ( AVAILABLE ?auto_10765 ) ( SURFACE-AT ?auto_10756 ?auto_10760 ) ( ON ?auto_10756 ?auto_10768 ) ( CLEAR ?auto_10756 ) ( not ( = ?auto_10756 ?auto_10768 ) ) ( not ( = ?auto_10757 ?auto_10768 ) ) ( not ( = ?auto_10755 ?auto_10768 ) ) ( not ( = ?auto_10759 ?auto_10768 ) ) ( SURFACE-AT ?auto_10754 ?auto_10767 ) ( CLEAR ?auto_10754 ) ( IS-CRATE ?auto_10755 ) ( not ( = ?auto_10754 ?auto_10755 ) ) ( not ( = ?auto_10756 ?auto_10754 ) ) ( not ( = ?auto_10757 ?auto_10754 ) ) ( not ( = ?auto_10759 ?auto_10754 ) ) ( not ( = ?auto_10768 ?auto_10754 ) ) ( AVAILABLE ?auto_10761 ) ( TRUCK-AT ?auto_10758 ?auto_10764 ) ( not ( = ?auto_10764 ?auto_10767 ) ) ( not ( = ?auto_10762 ?auto_10764 ) ) ( not ( = ?auto_10760 ?auto_10764 ) ) ( HOIST-AT ?auto_10766 ?auto_10764 ) ( LIFTING ?auto_10766 ?auto_10755 ) ( not ( = ?auto_10761 ?auto_10766 ) ) ( not ( = ?auto_10763 ?auto_10766 ) ) ( not ( = ?auto_10765 ?auto_10766 ) ) ( ON ?auto_10754 ?auto_10753 ) ( not ( = ?auto_10753 ?auto_10754 ) ) ( not ( = ?auto_10753 ?auto_10755 ) ) ( not ( = ?auto_10753 ?auto_10756 ) ) ( not ( = ?auto_10753 ?auto_10757 ) ) ( not ( = ?auto_10753 ?auto_10759 ) ) ( not ( = ?auto_10753 ?auto_10768 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10755 ?auto_10756 ?auto_10757 )
      ( MAKE-4CRATE-VERIFY ?auto_10753 ?auto_10754 ?auto_10755 ?auto_10756 ?auto_10757 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10769 - SURFACE
      ?auto_10770 - SURFACE
    )
    :vars
    (
      ?auto_10775 - HOIST
      ?auto_10781 - PLACE
      ?auto_10771 - SURFACE
      ?auto_10776 - PLACE
      ?auto_10777 - HOIST
      ?auto_10773 - SURFACE
      ?auto_10774 - PLACE
      ?auto_10779 - HOIST
      ?auto_10783 - SURFACE
      ?auto_10782 - SURFACE
      ?auto_10772 - TRUCK
      ?auto_10778 - PLACE
      ?auto_10780 - HOIST
      ?auto_10784 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10775 ?auto_10781 ) ( IS-CRATE ?auto_10770 ) ( not ( = ?auto_10769 ?auto_10770 ) ) ( not ( = ?auto_10771 ?auto_10769 ) ) ( not ( = ?auto_10771 ?auto_10770 ) ) ( not ( = ?auto_10776 ?auto_10781 ) ) ( HOIST-AT ?auto_10777 ?auto_10776 ) ( not ( = ?auto_10775 ?auto_10777 ) ) ( AVAILABLE ?auto_10777 ) ( SURFACE-AT ?auto_10770 ?auto_10776 ) ( ON ?auto_10770 ?auto_10773 ) ( CLEAR ?auto_10770 ) ( not ( = ?auto_10769 ?auto_10773 ) ) ( not ( = ?auto_10770 ?auto_10773 ) ) ( not ( = ?auto_10771 ?auto_10773 ) ) ( IS-CRATE ?auto_10769 ) ( not ( = ?auto_10774 ?auto_10781 ) ) ( not ( = ?auto_10776 ?auto_10774 ) ) ( HOIST-AT ?auto_10779 ?auto_10774 ) ( not ( = ?auto_10775 ?auto_10779 ) ) ( not ( = ?auto_10777 ?auto_10779 ) ) ( AVAILABLE ?auto_10779 ) ( SURFACE-AT ?auto_10769 ?auto_10774 ) ( ON ?auto_10769 ?auto_10783 ) ( CLEAR ?auto_10769 ) ( not ( = ?auto_10769 ?auto_10783 ) ) ( not ( = ?auto_10770 ?auto_10783 ) ) ( not ( = ?auto_10771 ?auto_10783 ) ) ( not ( = ?auto_10773 ?auto_10783 ) ) ( SURFACE-AT ?auto_10782 ?auto_10781 ) ( CLEAR ?auto_10782 ) ( IS-CRATE ?auto_10771 ) ( not ( = ?auto_10782 ?auto_10771 ) ) ( not ( = ?auto_10769 ?auto_10782 ) ) ( not ( = ?auto_10770 ?auto_10782 ) ) ( not ( = ?auto_10773 ?auto_10782 ) ) ( not ( = ?auto_10783 ?auto_10782 ) ) ( AVAILABLE ?auto_10775 ) ( TRUCK-AT ?auto_10772 ?auto_10778 ) ( not ( = ?auto_10778 ?auto_10781 ) ) ( not ( = ?auto_10776 ?auto_10778 ) ) ( not ( = ?auto_10774 ?auto_10778 ) ) ( HOIST-AT ?auto_10780 ?auto_10778 ) ( not ( = ?auto_10775 ?auto_10780 ) ) ( not ( = ?auto_10777 ?auto_10780 ) ) ( not ( = ?auto_10779 ?auto_10780 ) ) ( AVAILABLE ?auto_10780 ) ( SURFACE-AT ?auto_10771 ?auto_10778 ) ( ON ?auto_10771 ?auto_10784 ) ( CLEAR ?auto_10771 ) ( not ( = ?auto_10769 ?auto_10784 ) ) ( not ( = ?auto_10770 ?auto_10784 ) ) ( not ( = ?auto_10771 ?auto_10784 ) ) ( not ( = ?auto_10773 ?auto_10784 ) ) ( not ( = ?auto_10783 ?auto_10784 ) ) ( not ( = ?auto_10782 ?auto_10784 ) ) )
    :subtasks
    ( ( !LIFT ?auto_10780 ?auto_10771 ?auto_10784 ?auto_10778 )
      ( MAKE-2CRATE ?auto_10771 ?auto_10769 ?auto_10770 )
      ( MAKE-1CRATE-VERIFY ?auto_10769 ?auto_10770 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10785 - SURFACE
      ?auto_10786 - SURFACE
      ?auto_10787 - SURFACE
    )
    :vars
    (
      ?auto_10793 - HOIST
      ?auto_10788 - PLACE
      ?auto_10799 - PLACE
      ?auto_10800 - HOIST
      ?auto_10789 - SURFACE
      ?auto_10795 - PLACE
      ?auto_10794 - HOIST
      ?auto_10791 - SURFACE
      ?auto_10797 - SURFACE
      ?auto_10796 - TRUCK
      ?auto_10798 - PLACE
      ?auto_10792 - HOIST
      ?auto_10790 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10793 ?auto_10788 ) ( IS-CRATE ?auto_10787 ) ( not ( = ?auto_10786 ?auto_10787 ) ) ( not ( = ?auto_10785 ?auto_10786 ) ) ( not ( = ?auto_10785 ?auto_10787 ) ) ( not ( = ?auto_10799 ?auto_10788 ) ) ( HOIST-AT ?auto_10800 ?auto_10799 ) ( not ( = ?auto_10793 ?auto_10800 ) ) ( AVAILABLE ?auto_10800 ) ( SURFACE-AT ?auto_10787 ?auto_10799 ) ( ON ?auto_10787 ?auto_10789 ) ( CLEAR ?auto_10787 ) ( not ( = ?auto_10786 ?auto_10789 ) ) ( not ( = ?auto_10787 ?auto_10789 ) ) ( not ( = ?auto_10785 ?auto_10789 ) ) ( IS-CRATE ?auto_10786 ) ( not ( = ?auto_10795 ?auto_10788 ) ) ( not ( = ?auto_10799 ?auto_10795 ) ) ( HOIST-AT ?auto_10794 ?auto_10795 ) ( not ( = ?auto_10793 ?auto_10794 ) ) ( not ( = ?auto_10800 ?auto_10794 ) ) ( AVAILABLE ?auto_10794 ) ( SURFACE-AT ?auto_10786 ?auto_10795 ) ( ON ?auto_10786 ?auto_10791 ) ( CLEAR ?auto_10786 ) ( not ( = ?auto_10786 ?auto_10791 ) ) ( not ( = ?auto_10787 ?auto_10791 ) ) ( not ( = ?auto_10785 ?auto_10791 ) ) ( not ( = ?auto_10789 ?auto_10791 ) ) ( SURFACE-AT ?auto_10797 ?auto_10788 ) ( CLEAR ?auto_10797 ) ( IS-CRATE ?auto_10785 ) ( not ( = ?auto_10797 ?auto_10785 ) ) ( not ( = ?auto_10786 ?auto_10797 ) ) ( not ( = ?auto_10787 ?auto_10797 ) ) ( not ( = ?auto_10789 ?auto_10797 ) ) ( not ( = ?auto_10791 ?auto_10797 ) ) ( AVAILABLE ?auto_10793 ) ( TRUCK-AT ?auto_10796 ?auto_10798 ) ( not ( = ?auto_10798 ?auto_10788 ) ) ( not ( = ?auto_10799 ?auto_10798 ) ) ( not ( = ?auto_10795 ?auto_10798 ) ) ( HOIST-AT ?auto_10792 ?auto_10798 ) ( not ( = ?auto_10793 ?auto_10792 ) ) ( not ( = ?auto_10800 ?auto_10792 ) ) ( not ( = ?auto_10794 ?auto_10792 ) ) ( AVAILABLE ?auto_10792 ) ( SURFACE-AT ?auto_10785 ?auto_10798 ) ( ON ?auto_10785 ?auto_10790 ) ( CLEAR ?auto_10785 ) ( not ( = ?auto_10786 ?auto_10790 ) ) ( not ( = ?auto_10787 ?auto_10790 ) ) ( not ( = ?auto_10785 ?auto_10790 ) ) ( not ( = ?auto_10789 ?auto_10790 ) ) ( not ( = ?auto_10791 ?auto_10790 ) ) ( not ( = ?auto_10797 ?auto_10790 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10786 ?auto_10787 )
      ( MAKE-2CRATE-VERIFY ?auto_10785 ?auto_10786 ?auto_10787 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10801 - SURFACE
      ?auto_10802 - SURFACE
      ?auto_10803 - SURFACE
      ?auto_10804 - SURFACE
    )
    :vars
    (
      ?auto_10807 - HOIST
      ?auto_10812 - PLACE
      ?auto_10815 - PLACE
      ?auto_10816 - HOIST
      ?auto_10808 - SURFACE
      ?auto_10805 - PLACE
      ?auto_10813 - HOIST
      ?auto_10806 - SURFACE
      ?auto_10809 - TRUCK
      ?auto_10811 - PLACE
      ?auto_10814 - HOIST
      ?auto_10810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10807 ?auto_10812 ) ( IS-CRATE ?auto_10804 ) ( not ( = ?auto_10803 ?auto_10804 ) ) ( not ( = ?auto_10802 ?auto_10803 ) ) ( not ( = ?auto_10802 ?auto_10804 ) ) ( not ( = ?auto_10815 ?auto_10812 ) ) ( HOIST-AT ?auto_10816 ?auto_10815 ) ( not ( = ?auto_10807 ?auto_10816 ) ) ( AVAILABLE ?auto_10816 ) ( SURFACE-AT ?auto_10804 ?auto_10815 ) ( ON ?auto_10804 ?auto_10808 ) ( CLEAR ?auto_10804 ) ( not ( = ?auto_10803 ?auto_10808 ) ) ( not ( = ?auto_10804 ?auto_10808 ) ) ( not ( = ?auto_10802 ?auto_10808 ) ) ( IS-CRATE ?auto_10803 ) ( not ( = ?auto_10805 ?auto_10812 ) ) ( not ( = ?auto_10815 ?auto_10805 ) ) ( HOIST-AT ?auto_10813 ?auto_10805 ) ( not ( = ?auto_10807 ?auto_10813 ) ) ( not ( = ?auto_10816 ?auto_10813 ) ) ( AVAILABLE ?auto_10813 ) ( SURFACE-AT ?auto_10803 ?auto_10805 ) ( ON ?auto_10803 ?auto_10806 ) ( CLEAR ?auto_10803 ) ( not ( = ?auto_10803 ?auto_10806 ) ) ( not ( = ?auto_10804 ?auto_10806 ) ) ( not ( = ?auto_10802 ?auto_10806 ) ) ( not ( = ?auto_10808 ?auto_10806 ) ) ( SURFACE-AT ?auto_10801 ?auto_10812 ) ( CLEAR ?auto_10801 ) ( IS-CRATE ?auto_10802 ) ( not ( = ?auto_10801 ?auto_10802 ) ) ( not ( = ?auto_10803 ?auto_10801 ) ) ( not ( = ?auto_10804 ?auto_10801 ) ) ( not ( = ?auto_10808 ?auto_10801 ) ) ( not ( = ?auto_10806 ?auto_10801 ) ) ( AVAILABLE ?auto_10807 ) ( TRUCK-AT ?auto_10809 ?auto_10811 ) ( not ( = ?auto_10811 ?auto_10812 ) ) ( not ( = ?auto_10815 ?auto_10811 ) ) ( not ( = ?auto_10805 ?auto_10811 ) ) ( HOIST-AT ?auto_10814 ?auto_10811 ) ( not ( = ?auto_10807 ?auto_10814 ) ) ( not ( = ?auto_10816 ?auto_10814 ) ) ( not ( = ?auto_10813 ?auto_10814 ) ) ( AVAILABLE ?auto_10814 ) ( SURFACE-AT ?auto_10802 ?auto_10811 ) ( ON ?auto_10802 ?auto_10810 ) ( CLEAR ?auto_10802 ) ( not ( = ?auto_10803 ?auto_10810 ) ) ( not ( = ?auto_10804 ?auto_10810 ) ) ( not ( = ?auto_10802 ?auto_10810 ) ) ( not ( = ?auto_10808 ?auto_10810 ) ) ( not ( = ?auto_10806 ?auto_10810 ) ) ( not ( = ?auto_10801 ?auto_10810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10802 ?auto_10803 ?auto_10804 )
      ( MAKE-3CRATE-VERIFY ?auto_10801 ?auto_10802 ?auto_10803 ?auto_10804 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10817 - SURFACE
      ?auto_10818 - SURFACE
      ?auto_10819 - SURFACE
      ?auto_10820 - SURFACE
      ?auto_10821 - SURFACE
    )
    :vars
    (
      ?auto_10824 - HOIST
      ?auto_10829 - PLACE
      ?auto_10832 - PLACE
      ?auto_10833 - HOIST
      ?auto_10825 - SURFACE
      ?auto_10822 - PLACE
      ?auto_10830 - HOIST
      ?auto_10823 - SURFACE
      ?auto_10826 - TRUCK
      ?auto_10828 - PLACE
      ?auto_10831 - HOIST
      ?auto_10827 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10824 ?auto_10829 ) ( IS-CRATE ?auto_10821 ) ( not ( = ?auto_10820 ?auto_10821 ) ) ( not ( = ?auto_10819 ?auto_10820 ) ) ( not ( = ?auto_10819 ?auto_10821 ) ) ( not ( = ?auto_10832 ?auto_10829 ) ) ( HOIST-AT ?auto_10833 ?auto_10832 ) ( not ( = ?auto_10824 ?auto_10833 ) ) ( AVAILABLE ?auto_10833 ) ( SURFACE-AT ?auto_10821 ?auto_10832 ) ( ON ?auto_10821 ?auto_10825 ) ( CLEAR ?auto_10821 ) ( not ( = ?auto_10820 ?auto_10825 ) ) ( not ( = ?auto_10821 ?auto_10825 ) ) ( not ( = ?auto_10819 ?auto_10825 ) ) ( IS-CRATE ?auto_10820 ) ( not ( = ?auto_10822 ?auto_10829 ) ) ( not ( = ?auto_10832 ?auto_10822 ) ) ( HOIST-AT ?auto_10830 ?auto_10822 ) ( not ( = ?auto_10824 ?auto_10830 ) ) ( not ( = ?auto_10833 ?auto_10830 ) ) ( AVAILABLE ?auto_10830 ) ( SURFACE-AT ?auto_10820 ?auto_10822 ) ( ON ?auto_10820 ?auto_10823 ) ( CLEAR ?auto_10820 ) ( not ( = ?auto_10820 ?auto_10823 ) ) ( not ( = ?auto_10821 ?auto_10823 ) ) ( not ( = ?auto_10819 ?auto_10823 ) ) ( not ( = ?auto_10825 ?auto_10823 ) ) ( SURFACE-AT ?auto_10818 ?auto_10829 ) ( CLEAR ?auto_10818 ) ( IS-CRATE ?auto_10819 ) ( not ( = ?auto_10818 ?auto_10819 ) ) ( not ( = ?auto_10820 ?auto_10818 ) ) ( not ( = ?auto_10821 ?auto_10818 ) ) ( not ( = ?auto_10825 ?auto_10818 ) ) ( not ( = ?auto_10823 ?auto_10818 ) ) ( AVAILABLE ?auto_10824 ) ( TRUCK-AT ?auto_10826 ?auto_10828 ) ( not ( = ?auto_10828 ?auto_10829 ) ) ( not ( = ?auto_10832 ?auto_10828 ) ) ( not ( = ?auto_10822 ?auto_10828 ) ) ( HOIST-AT ?auto_10831 ?auto_10828 ) ( not ( = ?auto_10824 ?auto_10831 ) ) ( not ( = ?auto_10833 ?auto_10831 ) ) ( not ( = ?auto_10830 ?auto_10831 ) ) ( AVAILABLE ?auto_10831 ) ( SURFACE-AT ?auto_10819 ?auto_10828 ) ( ON ?auto_10819 ?auto_10827 ) ( CLEAR ?auto_10819 ) ( not ( = ?auto_10820 ?auto_10827 ) ) ( not ( = ?auto_10821 ?auto_10827 ) ) ( not ( = ?auto_10819 ?auto_10827 ) ) ( not ( = ?auto_10825 ?auto_10827 ) ) ( not ( = ?auto_10823 ?auto_10827 ) ) ( not ( = ?auto_10818 ?auto_10827 ) ) ( ON ?auto_10818 ?auto_10817 ) ( not ( = ?auto_10817 ?auto_10818 ) ) ( not ( = ?auto_10817 ?auto_10819 ) ) ( not ( = ?auto_10817 ?auto_10820 ) ) ( not ( = ?auto_10817 ?auto_10821 ) ) ( not ( = ?auto_10817 ?auto_10825 ) ) ( not ( = ?auto_10817 ?auto_10823 ) ) ( not ( = ?auto_10817 ?auto_10827 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10819 ?auto_10820 ?auto_10821 )
      ( MAKE-4CRATE-VERIFY ?auto_10817 ?auto_10818 ?auto_10819 ?auto_10820 ?auto_10821 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10834 - SURFACE
      ?auto_10835 - SURFACE
    )
    :vars
    (
      ?auto_10839 - HOIST
      ?auto_10844 - PLACE
      ?auto_10836 - SURFACE
      ?auto_10848 - PLACE
      ?auto_10849 - HOIST
      ?auto_10840 - SURFACE
      ?auto_10837 - PLACE
      ?auto_10845 - HOIST
      ?auto_10838 - SURFACE
      ?auto_10846 - SURFACE
      ?auto_10843 - PLACE
      ?auto_10847 - HOIST
      ?auto_10842 - SURFACE
      ?auto_10841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10839 ?auto_10844 ) ( IS-CRATE ?auto_10835 ) ( not ( = ?auto_10834 ?auto_10835 ) ) ( not ( = ?auto_10836 ?auto_10834 ) ) ( not ( = ?auto_10836 ?auto_10835 ) ) ( not ( = ?auto_10848 ?auto_10844 ) ) ( HOIST-AT ?auto_10849 ?auto_10848 ) ( not ( = ?auto_10839 ?auto_10849 ) ) ( AVAILABLE ?auto_10849 ) ( SURFACE-AT ?auto_10835 ?auto_10848 ) ( ON ?auto_10835 ?auto_10840 ) ( CLEAR ?auto_10835 ) ( not ( = ?auto_10834 ?auto_10840 ) ) ( not ( = ?auto_10835 ?auto_10840 ) ) ( not ( = ?auto_10836 ?auto_10840 ) ) ( IS-CRATE ?auto_10834 ) ( not ( = ?auto_10837 ?auto_10844 ) ) ( not ( = ?auto_10848 ?auto_10837 ) ) ( HOIST-AT ?auto_10845 ?auto_10837 ) ( not ( = ?auto_10839 ?auto_10845 ) ) ( not ( = ?auto_10849 ?auto_10845 ) ) ( AVAILABLE ?auto_10845 ) ( SURFACE-AT ?auto_10834 ?auto_10837 ) ( ON ?auto_10834 ?auto_10838 ) ( CLEAR ?auto_10834 ) ( not ( = ?auto_10834 ?auto_10838 ) ) ( not ( = ?auto_10835 ?auto_10838 ) ) ( not ( = ?auto_10836 ?auto_10838 ) ) ( not ( = ?auto_10840 ?auto_10838 ) ) ( SURFACE-AT ?auto_10846 ?auto_10844 ) ( CLEAR ?auto_10846 ) ( IS-CRATE ?auto_10836 ) ( not ( = ?auto_10846 ?auto_10836 ) ) ( not ( = ?auto_10834 ?auto_10846 ) ) ( not ( = ?auto_10835 ?auto_10846 ) ) ( not ( = ?auto_10840 ?auto_10846 ) ) ( not ( = ?auto_10838 ?auto_10846 ) ) ( AVAILABLE ?auto_10839 ) ( not ( = ?auto_10843 ?auto_10844 ) ) ( not ( = ?auto_10848 ?auto_10843 ) ) ( not ( = ?auto_10837 ?auto_10843 ) ) ( HOIST-AT ?auto_10847 ?auto_10843 ) ( not ( = ?auto_10839 ?auto_10847 ) ) ( not ( = ?auto_10849 ?auto_10847 ) ) ( not ( = ?auto_10845 ?auto_10847 ) ) ( AVAILABLE ?auto_10847 ) ( SURFACE-AT ?auto_10836 ?auto_10843 ) ( ON ?auto_10836 ?auto_10842 ) ( CLEAR ?auto_10836 ) ( not ( = ?auto_10834 ?auto_10842 ) ) ( not ( = ?auto_10835 ?auto_10842 ) ) ( not ( = ?auto_10836 ?auto_10842 ) ) ( not ( = ?auto_10840 ?auto_10842 ) ) ( not ( = ?auto_10838 ?auto_10842 ) ) ( not ( = ?auto_10846 ?auto_10842 ) ) ( TRUCK-AT ?auto_10841 ?auto_10844 ) )
    :subtasks
    ( ( !DRIVE ?auto_10841 ?auto_10844 ?auto_10843 )
      ( MAKE-2CRATE ?auto_10836 ?auto_10834 ?auto_10835 )
      ( MAKE-1CRATE-VERIFY ?auto_10834 ?auto_10835 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10850 - SURFACE
      ?auto_10851 - SURFACE
      ?auto_10852 - SURFACE
    )
    :vars
    (
      ?auto_10863 - HOIST
      ?auto_10862 - PLACE
      ?auto_10859 - PLACE
      ?auto_10861 - HOIST
      ?auto_10855 - SURFACE
      ?auto_10860 - PLACE
      ?auto_10858 - HOIST
      ?auto_10853 - SURFACE
      ?auto_10865 - SURFACE
      ?auto_10857 - PLACE
      ?auto_10856 - HOIST
      ?auto_10864 - SURFACE
      ?auto_10854 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10863 ?auto_10862 ) ( IS-CRATE ?auto_10852 ) ( not ( = ?auto_10851 ?auto_10852 ) ) ( not ( = ?auto_10850 ?auto_10851 ) ) ( not ( = ?auto_10850 ?auto_10852 ) ) ( not ( = ?auto_10859 ?auto_10862 ) ) ( HOIST-AT ?auto_10861 ?auto_10859 ) ( not ( = ?auto_10863 ?auto_10861 ) ) ( AVAILABLE ?auto_10861 ) ( SURFACE-AT ?auto_10852 ?auto_10859 ) ( ON ?auto_10852 ?auto_10855 ) ( CLEAR ?auto_10852 ) ( not ( = ?auto_10851 ?auto_10855 ) ) ( not ( = ?auto_10852 ?auto_10855 ) ) ( not ( = ?auto_10850 ?auto_10855 ) ) ( IS-CRATE ?auto_10851 ) ( not ( = ?auto_10860 ?auto_10862 ) ) ( not ( = ?auto_10859 ?auto_10860 ) ) ( HOIST-AT ?auto_10858 ?auto_10860 ) ( not ( = ?auto_10863 ?auto_10858 ) ) ( not ( = ?auto_10861 ?auto_10858 ) ) ( AVAILABLE ?auto_10858 ) ( SURFACE-AT ?auto_10851 ?auto_10860 ) ( ON ?auto_10851 ?auto_10853 ) ( CLEAR ?auto_10851 ) ( not ( = ?auto_10851 ?auto_10853 ) ) ( not ( = ?auto_10852 ?auto_10853 ) ) ( not ( = ?auto_10850 ?auto_10853 ) ) ( not ( = ?auto_10855 ?auto_10853 ) ) ( SURFACE-AT ?auto_10865 ?auto_10862 ) ( CLEAR ?auto_10865 ) ( IS-CRATE ?auto_10850 ) ( not ( = ?auto_10865 ?auto_10850 ) ) ( not ( = ?auto_10851 ?auto_10865 ) ) ( not ( = ?auto_10852 ?auto_10865 ) ) ( not ( = ?auto_10855 ?auto_10865 ) ) ( not ( = ?auto_10853 ?auto_10865 ) ) ( AVAILABLE ?auto_10863 ) ( not ( = ?auto_10857 ?auto_10862 ) ) ( not ( = ?auto_10859 ?auto_10857 ) ) ( not ( = ?auto_10860 ?auto_10857 ) ) ( HOIST-AT ?auto_10856 ?auto_10857 ) ( not ( = ?auto_10863 ?auto_10856 ) ) ( not ( = ?auto_10861 ?auto_10856 ) ) ( not ( = ?auto_10858 ?auto_10856 ) ) ( AVAILABLE ?auto_10856 ) ( SURFACE-AT ?auto_10850 ?auto_10857 ) ( ON ?auto_10850 ?auto_10864 ) ( CLEAR ?auto_10850 ) ( not ( = ?auto_10851 ?auto_10864 ) ) ( not ( = ?auto_10852 ?auto_10864 ) ) ( not ( = ?auto_10850 ?auto_10864 ) ) ( not ( = ?auto_10855 ?auto_10864 ) ) ( not ( = ?auto_10853 ?auto_10864 ) ) ( not ( = ?auto_10865 ?auto_10864 ) ) ( TRUCK-AT ?auto_10854 ?auto_10862 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10851 ?auto_10852 )
      ( MAKE-2CRATE-VERIFY ?auto_10850 ?auto_10851 ?auto_10852 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10866 - SURFACE
      ?auto_10867 - SURFACE
      ?auto_10868 - SURFACE
      ?auto_10869 - SURFACE
    )
    :vars
    (
      ?auto_10871 - HOIST
      ?auto_10877 - PLACE
      ?auto_10876 - PLACE
      ?auto_10873 - HOIST
      ?auto_10872 - SURFACE
      ?auto_10881 - PLACE
      ?auto_10870 - HOIST
      ?auto_10875 - SURFACE
      ?auto_10879 - PLACE
      ?auto_10874 - HOIST
      ?auto_10878 - SURFACE
      ?auto_10880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10871 ?auto_10877 ) ( IS-CRATE ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10869 ) ) ( not ( = ?auto_10867 ?auto_10868 ) ) ( not ( = ?auto_10867 ?auto_10869 ) ) ( not ( = ?auto_10876 ?auto_10877 ) ) ( HOIST-AT ?auto_10873 ?auto_10876 ) ( not ( = ?auto_10871 ?auto_10873 ) ) ( AVAILABLE ?auto_10873 ) ( SURFACE-AT ?auto_10869 ?auto_10876 ) ( ON ?auto_10869 ?auto_10872 ) ( CLEAR ?auto_10869 ) ( not ( = ?auto_10868 ?auto_10872 ) ) ( not ( = ?auto_10869 ?auto_10872 ) ) ( not ( = ?auto_10867 ?auto_10872 ) ) ( IS-CRATE ?auto_10868 ) ( not ( = ?auto_10881 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10881 ) ) ( HOIST-AT ?auto_10870 ?auto_10881 ) ( not ( = ?auto_10871 ?auto_10870 ) ) ( not ( = ?auto_10873 ?auto_10870 ) ) ( AVAILABLE ?auto_10870 ) ( SURFACE-AT ?auto_10868 ?auto_10881 ) ( ON ?auto_10868 ?auto_10875 ) ( CLEAR ?auto_10868 ) ( not ( = ?auto_10868 ?auto_10875 ) ) ( not ( = ?auto_10869 ?auto_10875 ) ) ( not ( = ?auto_10867 ?auto_10875 ) ) ( not ( = ?auto_10872 ?auto_10875 ) ) ( SURFACE-AT ?auto_10866 ?auto_10877 ) ( CLEAR ?auto_10866 ) ( IS-CRATE ?auto_10867 ) ( not ( = ?auto_10866 ?auto_10867 ) ) ( not ( = ?auto_10868 ?auto_10866 ) ) ( not ( = ?auto_10869 ?auto_10866 ) ) ( not ( = ?auto_10872 ?auto_10866 ) ) ( not ( = ?auto_10875 ?auto_10866 ) ) ( AVAILABLE ?auto_10871 ) ( not ( = ?auto_10879 ?auto_10877 ) ) ( not ( = ?auto_10876 ?auto_10879 ) ) ( not ( = ?auto_10881 ?auto_10879 ) ) ( HOIST-AT ?auto_10874 ?auto_10879 ) ( not ( = ?auto_10871 ?auto_10874 ) ) ( not ( = ?auto_10873 ?auto_10874 ) ) ( not ( = ?auto_10870 ?auto_10874 ) ) ( AVAILABLE ?auto_10874 ) ( SURFACE-AT ?auto_10867 ?auto_10879 ) ( ON ?auto_10867 ?auto_10878 ) ( CLEAR ?auto_10867 ) ( not ( = ?auto_10868 ?auto_10878 ) ) ( not ( = ?auto_10869 ?auto_10878 ) ) ( not ( = ?auto_10867 ?auto_10878 ) ) ( not ( = ?auto_10872 ?auto_10878 ) ) ( not ( = ?auto_10875 ?auto_10878 ) ) ( not ( = ?auto_10866 ?auto_10878 ) ) ( TRUCK-AT ?auto_10880 ?auto_10877 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10867 ?auto_10868 ?auto_10869 )
      ( MAKE-3CRATE-VERIFY ?auto_10866 ?auto_10867 ?auto_10868 ?auto_10869 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10882 - SURFACE
      ?auto_10883 - SURFACE
      ?auto_10884 - SURFACE
      ?auto_10885 - SURFACE
      ?auto_10886 - SURFACE
    )
    :vars
    (
      ?auto_10888 - HOIST
      ?auto_10894 - PLACE
      ?auto_10893 - PLACE
      ?auto_10890 - HOIST
      ?auto_10889 - SURFACE
      ?auto_10898 - PLACE
      ?auto_10887 - HOIST
      ?auto_10892 - SURFACE
      ?auto_10896 - PLACE
      ?auto_10891 - HOIST
      ?auto_10895 - SURFACE
      ?auto_10897 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10888 ?auto_10894 ) ( IS-CRATE ?auto_10886 ) ( not ( = ?auto_10885 ?auto_10886 ) ) ( not ( = ?auto_10884 ?auto_10885 ) ) ( not ( = ?auto_10884 ?auto_10886 ) ) ( not ( = ?auto_10893 ?auto_10894 ) ) ( HOIST-AT ?auto_10890 ?auto_10893 ) ( not ( = ?auto_10888 ?auto_10890 ) ) ( AVAILABLE ?auto_10890 ) ( SURFACE-AT ?auto_10886 ?auto_10893 ) ( ON ?auto_10886 ?auto_10889 ) ( CLEAR ?auto_10886 ) ( not ( = ?auto_10885 ?auto_10889 ) ) ( not ( = ?auto_10886 ?auto_10889 ) ) ( not ( = ?auto_10884 ?auto_10889 ) ) ( IS-CRATE ?auto_10885 ) ( not ( = ?auto_10898 ?auto_10894 ) ) ( not ( = ?auto_10893 ?auto_10898 ) ) ( HOIST-AT ?auto_10887 ?auto_10898 ) ( not ( = ?auto_10888 ?auto_10887 ) ) ( not ( = ?auto_10890 ?auto_10887 ) ) ( AVAILABLE ?auto_10887 ) ( SURFACE-AT ?auto_10885 ?auto_10898 ) ( ON ?auto_10885 ?auto_10892 ) ( CLEAR ?auto_10885 ) ( not ( = ?auto_10885 ?auto_10892 ) ) ( not ( = ?auto_10886 ?auto_10892 ) ) ( not ( = ?auto_10884 ?auto_10892 ) ) ( not ( = ?auto_10889 ?auto_10892 ) ) ( SURFACE-AT ?auto_10883 ?auto_10894 ) ( CLEAR ?auto_10883 ) ( IS-CRATE ?auto_10884 ) ( not ( = ?auto_10883 ?auto_10884 ) ) ( not ( = ?auto_10885 ?auto_10883 ) ) ( not ( = ?auto_10886 ?auto_10883 ) ) ( not ( = ?auto_10889 ?auto_10883 ) ) ( not ( = ?auto_10892 ?auto_10883 ) ) ( AVAILABLE ?auto_10888 ) ( not ( = ?auto_10896 ?auto_10894 ) ) ( not ( = ?auto_10893 ?auto_10896 ) ) ( not ( = ?auto_10898 ?auto_10896 ) ) ( HOIST-AT ?auto_10891 ?auto_10896 ) ( not ( = ?auto_10888 ?auto_10891 ) ) ( not ( = ?auto_10890 ?auto_10891 ) ) ( not ( = ?auto_10887 ?auto_10891 ) ) ( AVAILABLE ?auto_10891 ) ( SURFACE-AT ?auto_10884 ?auto_10896 ) ( ON ?auto_10884 ?auto_10895 ) ( CLEAR ?auto_10884 ) ( not ( = ?auto_10885 ?auto_10895 ) ) ( not ( = ?auto_10886 ?auto_10895 ) ) ( not ( = ?auto_10884 ?auto_10895 ) ) ( not ( = ?auto_10889 ?auto_10895 ) ) ( not ( = ?auto_10892 ?auto_10895 ) ) ( not ( = ?auto_10883 ?auto_10895 ) ) ( TRUCK-AT ?auto_10897 ?auto_10894 ) ( ON ?auto_10883 ?auto_10882 ) ( not ( = ?auto_10882 ?auto_10883 ) ) ( not ( = ?auto_10882 ?auto_10884 ) ) ( not ( = ?auto_10882 ?auto_10885 ) ) ( not ( = ?auto_10882 ?auto_10886 ) ) ( not ( = ?auto_10882 ?auto_10889 ) ) ( not ( = ?auto_10882 ?auto_10892 ) ) ( not ( = ?auto_10882 ?auto_10895 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10884 ?auto_10885 ?auto_10886 )
      ( MAKE-4CRATE-VERIFY ?auto_10882 ?auto_10883 ?auto_10884 ?auto_10885 ?auto_10886 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10899 - SURFACE
      ?auto_10900 - SURFACE
    )
    :vars
    (
      ?auto_10902 - HOIST
      ?auto_10908 - PLACE
      ?auto_10910 - SURFACE
      ?auto_10907 - PLACE
      ?auto_10904 - HOIST
      ?auto_10903 - SURFACE
      ?auto_10914 - PLACE
      ?auto_10901 - HOIST
      ?auto_10906 - SURFACE
      ?auto_10913 - SURFACE
      ?auto_10911 - PLACE
      ?auto_10905 - HOIST
      ?auto_10909 - SURFACE
      ?auto_10912 - TRUCK
      ?auto_10915 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10902 ?auto_10908 ) ( IS-CRATE ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10900 ) ) ( not ( = ?auto_10910 ?auto_10899 ) ) ( not ( = ?auto_10910 ?auto_10900 ) ) ( not ( = ?auto_10907 ?auto_10908 ) ) ( HOIST-AT ?auto_10904 ?auto_10907 ) ( not ( = ?auto_10902 ?auto_10904 ) ) ( AVAILABLE ?auto_10904 ) ( SURFACE-AT ?auto_10900 ?auto_10907 ) ( ON ?auto_10900 ?auto_10903 ) ( CLEAR ?auto_10900 ) ( not ( = ?auto_10899 ?auto_10903 ) ) ( not ( = ?auto_10900 ?auto_10903 ) ) ( not ( = ?auto_10910 ?auto_10903 ) ) ( IS-CRATE ?auto_10899 ) ( not ( = ?auto_10914 ?auto_10908 ) ) ( not ( = ?auto_10907 ?auto_10914 ) ) ( HOIST-AT ?auto_10901 ?auto_10914 ) ( not ( = ?auto_10902 ?auto_10901 ) ) ( not ( = ?auto_10904 ?auto_10901 ) ) ( AVAILABLE ?auto_10901 ) ( SURFACE-AT ?auto_10899 ?auto_10914 ) ( ON ?auto_10899 ?auto_10906 ) ( CLEAR ?auto_10899 ) ( not ( = ?auto_10899 ?auto_10906 ) ) ( not ( = ?auto_10900 ?auto_10906 ) ) ( not ( = ?auto_10910 ?auto_10906 ) ) ( not ( = ?auto_10903 ?auto_10906 ) ) ( IS-CRATE ?auto_10910 ) ( not ( = ?auto_10913 ?auto_10910 ) ) ( not ( = ?auto_10899 ?auto_10913 ) ) ( not ( = ?auto_10900 ?auto_10913 ) ) ( not ( = ?auto_10903 ?auto_10913 ) ) ( not ( = ?auto_10906 ?auto_10913 ) ) ( not ( = ?auto_10911 ?auto_10908 ) ) ( not ( = ?auto_10907 ?auto_10911 ) ) ( not ( = ?auto_10914 ?auto_10911 ) ) ( HOIST-AT ?auto_10905 ?auto_10911 ) ( not ( = ?auto_10902 ?auto_10905 ) ) ( not ( = ?auto_10904 ?auto_10905 ) ) ( not ( = ?auto_10901 ?auto_10905 ) ) ( AVAILABLE ?auto_10905 ) ( SURFACE-AT ?auto_10910 ?auto_10911 ) ( ON ?auto_10910 ?auto_10909 ) ( CLEAR ?auto_10910 ) ( not ( = ?auto_10899 ?auto_10909 ) ) ( not ( = ?auto_10900 ?auto_10909 ) ) ( not ( = ?auto_10910 ?auto_10909 ) ) ( not ( = ?auto_10903 ?auto_10909 ) ) ( not ( = ?auto_10906 ?auto_10909 ) ) ( not ( = ?auto_10913 ?auto_10909 ) ) ( TRUCK-AT ?auto_10912 ?auto_10908 ) ( SURFACE-AT ?auto_10915 ?auto_10908 ) ( CLEAR ?auto_10915 ) ( LIFTING ?auto_10902 ?auto_10913 ) ( IS-CRATE ?auto_10913 ) ( not ( = ?auto_10915 ?auto_10913 ) ) ( not ( = ?auto_10899 ?auto_10915 ) ) ( not ( = ?auto_10900 ?auto_10915 ) ) ( not ( = ?auto_10910 ?auto_10915 ) ) ( not ( = ?auto_10903 ?auto_10915 ) ) ( not ( = ?auto_10906 ?auto_10915 ) ) ( not ( = ?auto_10909 ?auto_10915 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10915 ?auto_10913 )
      ( MAKE-2CRATE ?auto_10910 ?auto_10899 ?auto_10900 )
      ( MAKE-1CRATE-VERIFY ?auto_10899 ?auto_10900 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10916 - SURFACE
      ?auto_10917 - SURFACE
      ?auto_10918 - SURFACE
    )
    :vars
    (
      ?auto_10919 - HOIST
      ?auto_10926 - PLACE
      ?auto_10931 - PLACE
      ?auto_10928 - HOIST
      ?auto_10927 - SURFACE
      ?auto_10929 - PLACE
      ?auto_10922 - HOIST
      ?auto_10930 - SURFACE
      ?auto_10921 - SURFACE
      ?auto_10925 - PLACE
      ?auto_10932 - HOIST
      ?auto_10924 - SURFACE
      ?auto_10923 - TRUCK
      ?auto_10920 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10919 ?auto_10926 ) ( IS-CRATE ?auto_10918 ) ( not ( = ?auto_10917 ?auto_10918 ) ) ( not ( = ?auto_10916 ?auto_10917 ) ) ( not ( = ?auto_10916 ?auto_10918 ) ) ( not ( = ?auto_10931 ?auto_10926 ) ) ( HOIST-AT ?auto_10928 ?auto_10931 ) ( not ( = ?auto_10919 ?auto_10928 ) ) ( AVAILABLE ?auto_10928 ) ( SURFACE-AT ?auto_10918 ?auto_10931 ) ( ON ?auto_10918 ?auto_10927 ) ( CLEAR ?auto_10918 ) ( not ( = ?auto_10917 ?auto_10927 ) ) ( not ( = ?auto_10918 ?auto_10927 ) ) ( not ( = ?auto_10916 ?auto_10927 ) ) ( IS-CRATE ?auto_10917 ) ( not ( = ?auto_10929 ?auto_10926 ) ) ( not ( = ?auto_10931 ?auto_10929 ) ) ( HOIST-AT ?auto_10922 ?auto_10929 ) ( not ( = ?auto_10919 ?auto_10922 ) ) ( not ( = ?auto_10928 ?auto_10922 ) ) ( AVAILABLE ?auto_10922 ) ( SURFACE-AT ?auto_10917 ?auto_10929 ) ( ON ?auto_10917 ?auto_10930 ) ( CLEAR ?auto_10917 ) ( not ( = ?auto_10917 ?auto_10930 ) ) ( not ( = ?auto_10918 ?auto_10930 ) ) ( not ( = ?auto_10916 ?auto_10930 ) ) ( not ( = ?auto_10927 ?auto_10930 ) ) ( IS-CRATE ?auto_10916 ) ( not ( = ?auto_10921 ?auto_10916 ) ) ( not ( = ?auto_10917 ?auto_10921 ) ) ( not ( = ?auto_10918 ?auto_10921 ) ) ( not ( = ?auto_10927 ?auto_10921 ) ) ( not ( = ?auto_10930 ?auto_10921 ) ) ( not ( = ?auto_10925 ?auto_10926 ) ) ( not ( = ?auto_10931 ?auto_10925 ) ) ( not ( = ?auto_10929 ?auto_10925 ) ) ( HOIST-AT ?auto_10932 ?auto_10925 ) ( not ( = ?auto_10919 ?auto_10932 ) ) ( not ( = ?auto_10928 ?auto_10932 ) ) ( not ( = ?auto_10922 ?auto_10932 ) ) ( AVAILABLE ?auto_10932 ) ( SURFACE-AT ?auto_10916 ?auto_10925 ) ( ON ?auto_10916 ?auto_10924 ) ( CLEAR ?auto_10916 ) ( not ( = ?auto_10917 ?auto_10924 ) ) ( not ( = ?auto_10918 ?auto_10924 ) ) ( not ( = ?auto_10916 ?auto_10924 ) ) ( not ( = ?auto_10927 ?auto_10924 ) ) ( not ( = ?auto_10930 ?auto_10924 ) ) ( not ( = ?auto_10921 ?auto_10924 ) ) ( TRUCK-AT ?auto_10923 ?auto_10926 ) ( SURFACE-AT ?auto_10920 ?auto_10926 ) ( CLEAR ?auto_10920 ) ( LIFTING ?auto_10919 ?auto_10921 ) ( IS-CRATE ?auto_10921 ) ( not ( = ?auto_10920 ?auto_10921 ) ) ( not ( = ?auto_10917 ?auto_10920 ) ) ( not ( = ?auto_10918 ?auto_10920 ) ) ( not ( = ?auto_10916 ?auto_10920 ) ) ( not ( = ?auto_10927 ?auto_10920 ) ) ( not ( = ?auto_10930 ?auto_10920 ) ) ( not ( = ?auto_10924 ?auto_10920 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10917 ?auto_10918 )
      ( MAKE-2CRATE-VERIFY ?auto_10916 ?auto_10917 ?auto_10918 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_10933 - SURFACE
      ?auto_10934 - SURFACE
      ?auto_10935 - SURFACE
      ?auto_10936 - SURFACE
    )
    :vars
    (
      ?auto_10945 - HOIST
      ?auto_10941 - PLACE
      ?auto_10947 - PLACE
      ?auto_10939 - HOIST
      ?auto_10944 - SURFACE
      ?auto_10948 - PLACE
      ?auto_10946 - HOIST
      ?auto_10943 - SURFACE
      ?auto_10940 - PLACE
      ?auto_10938 - HOIST
      ?auto_10949 - SURFACE
      ?auto_10942 - TRUCK
      ?auto_10937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10945 ?auto_10941 ) ( IS-CRATE ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10936 ) ) ( not ( = ?auto_10934 ?auto_10935 ) ) ( not ( = ?auto_10934 ?auto_10936 ) ) ( not ( = ?auto_10947 ?auto_10941 ) ) ( HOIST-AT ?auto_10939 ?auto_10947 ) ( not ( = ?auto_10945 ?auto_10939 ) ) ( AVAILABLE ?auto_10939 ) ( SURFACE-AT ?auto_10936 ?auto_10947 ) ( ON ?auto_10936 ?auto_10944 ) ( CLEAR ?auto_10936 ) ( not ( = ?auto_10935 ?auto_10944 ) ) ( not ( = ?auto_10936 ?auto_10944 ) ) ( not ( = ?auto_10934 ?auto_10944 ) ) ( IS-CRATE ?auto_10935 ) ( not ( = ?auto_10948 ?auto_10941 ) ) ( not ( = ?auto_10947 ?auto_10948 ) ) ( HOIST-AT ?auto_10946 ?auto_10948 ) ( not ( = ?auto_10945 ?auto_10946 ) ) ( not ( = ?auto_10939 ?auto_10946 ) ) ( AVAILABLE ?auto_10946 ) ( SURFACE-AT ?auto_10935 ?auto_10948 ) ( ON ?auto_10935 ?auto_10943 ) ( CLEAR ?auto_10935 ) ( not ( = ?auto_10935 ?auto_10943 ) ) ( not ( = ?auto_10936 ?auto_10943 ) ) ( not ( = ?auto_10934 ?auto_10943 ) ) ( not ( = ?auto_10944 ?auto_10943 ) ) ( IS-CRATE ?auto_10934 ) ( not ( = ?auto_10933 ?auto_10934 ) ) ( not ( = ?auto_10935 ?auto_10933 ) ) ( not ( = ?auto_10936 ?auto_10933 ) ) ( not ( = ?auto_10944 ?auto_10933 ) ) ( not ( = ?auto_10943 ?auto_10933 ) ) ( not ( = ?auto_10940 ?auto_10941 ) ) ( not ( = ?auto_10947 ?auto_10940 ) ) ( not ( = ?auto_10948 ?auto_10940 ) ) ( HOIST-AT ?auto_10938 ?auto_10940 ) ( not ( = ?auto_10945 ?auto_10938 ) ) ( not ( = ?auto_10939 ?auto_10938 ) ) ( not ( = ?auto_10946 ?auto_10938 ) ) ( AVAILABLE ?auto_10938 ) ( SURFACE-AT ?auto_10934 ?auto_10940 ) ( ON ?auto_10934 ?auto_10949 ) ( CLEAR ?auto_10934 ) ( not ( = ?auto_10935 ?auto_10949 ) ) ( not ( = ?auto_10936 ?auto_10949 ) ) ( not ( = ?auto_10934 ?auto_10949 ) ) ( not ( = ?auto_10944 ?auto_10949 ) ) ( not ( = ?auto_10943 ?auto_10949 ) ) ( not ( = ?auto_10933 ?auto_10949 ) ) ( TRUCK-AT ?auto_10942 ?auto_10941 ) ( SURFACE-AT ?auto_10937 ?auto_10941 ) ( CLEAR ?auto_10937 ) ( LIFTING ?auto_10945 ?auto_10933 ) ( IS-CRATE ?auto_10933 ) ( not ( = ?auto_10937 ?auto_10933 ) ) ( not ( = ?auto_10935 ?auto_10937 ) ) ( not ( = ?auto_10936 ?auto_10937 ) ) ( not ( = ?auto_10934 ?auto_10937 ) ) ( not ( = ?auto_10944 ?auto_10937 ) ) ( not ( = ?auto_10943 ?auto_10937 ) ) ( not ( = ?auto_10949 ?auto_10937 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10934 ?auto_10935 ?auto_10936 )
      ( MAKE-3CRATE-VERIFY ?auto_10933 ?auto_10934 ?auto_10935 ?auto_10936 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10950 - SURFACE
      ?auto_10951 - SURFACE
      ?auto_10952 - SURFACE
      ?auto_10953 - SURFACE
      ?auto_10954 - SURFACE
    )
    :vars
    (
      ?auto_10962 - HOIST
      ?auto_10958 - PLACE
      ?auto_10964 - PLACE
      ?auto_10956 - HOIST
      ?auto_10961 - SURFACE
      ?auto_10965 - PLACE
      ?auto_10963 - HOIST
      ?auto_10960 - SURFACE
      ?auto_10957 - PLACE
      ?auto_10955 - HOIST
      ?auto_10966 - SURFACE
      ?auto_10959 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10962 ?auto_10958 ) ( IS-CRATE ?auto_10954 ) ( not ( = ?auto_10953 ?auto_10954 ) ) ( not ( = ?auto_10952 ?auto_10953 ) ) ( not ( = ?auto_10952 ?auto_10954 ) ) ( not ( = ?auto_10964 ?auto_10958 ) ) ( HOIST-AT ?auto_10956 ?auto_10964 ) ( not ( = ?auto_10962 ?auto_10956 ) ) ( AVAILABLE ?auto_10956 ) ( SURFACE-AT ?auto_10954 ?auto_10964 ) ( ON ?auto_10954 ?auto_10961 ) ( CLEAR ?auto_10954 ) ( not ( = ?auto_10953 ?auto_10961 ) ) ( not ( = ?auto_10954 ?auto_10961 ) ) ( not ( = ?auto_10952 ?auto_10961 ) ) ( IS-CRATE ?auto_10953 ) ( not ( = ?auto_10965 ?auto_10958 ) ) ( not ( = ?auto_10964 ?auto_10965 ) ) ( HOIST-AT ?auto_10963 ?auto_10965 ) ( not ( = ?auto_10962 ?auto_10963 ) ) ( not ( = ?auto_10956 ?auto_10963 ) ) ( AVAILABLE ?auto_10963 ) ( SURFACE-AT ?auto_10953 ?auto_10965 ) ( ON ?auto_10953 ?auto_10960 ) ( CLEAR ?auto_10953 ) ( not ( = ?auto_10953 ?auto_10960 ) ) ( not ( = ?auto_10954 ?auto_10960 ) ) ( not ( = ?auto_10952 ?auto_10960 ) ) ( not ( = ?auto_10961 ?auto_10960 ) ) ( IS-CRATE ?auto_10952 ) ( not ( = ?auto_10951 ?auto_10952 ) ) ( not ( = ?auto_10953 ?auto_10951 ) ) ( not ( = ?auto_10954 ?auto_10951 ) ) ( not ( = ?auto_10961 ?auto_10951 ) ) ( not ( = ?auto_10960 ?auto_10951 ) ) ( not ( = ?auto_10957 ?auto_10958 ) ) ( not ( = ?auto_10964 ?auto_10957 ) ) ( not ( = ?auto_10965 ?auto_10957 ) ) ( HOIST-AT ?auto_10955 ?auto_10957 ) ( not ( = ?auto_10962 ?auto_10955 ) ) ( not ( = ?auto_10956 ?auto_10955 ) ) ( not ( = ?auto_10963 ?auto_10955 ) ) ( AVAILABLE ?auto_10955 ) ( SURFACE-AT ?auto_10952 ?auto_10957 ) ( ON ?auto_10952 ?auto_10966 ) ( CLEAR ?auto_10952 ) ( not ( = ?auto_10953 ?auto_10966 ) ) ( not ( = ?auto_10954 ?auto_10966 ) ) ( not ( = ?auto_10952 ?auto_10966 ) ) ( not ( = ?auto_10961 ?auto_10966 ) ) ( not ( = ?auto_10960 ?auto_10966 ) ) ( not ( = ?auto_10951 ?auto_10966 ) ) ( TRUCK-AT ?auto_10959 ?auto_10958 ) ( SURFACE-AT ?auto_10950 ?auto_10958 ) ( CLEAR ?auto_10950 ) ( LIFTING ?auto_10962 ?auto_10951 ) ( IS-CRATE ?auto_10951 ) ( not ( = ?auto_10950 ?auto_10951 ) ) ( not ( = ?auto_10953 ?auto_10950 ) ) ( not ( = ?auto_10954 ?auto_10950 ) ) ( not ( = ?auto_10952 ?auto_10950 ) ) ( not ( = ?auto_10961 ?auto_10950 ) ) ( not ( = ?auto_10960 ?auto_10950 ) ) ( not ( = ?auto_10966 ?auto_10950 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10952 ?auto_10953 ?auto_10954 )
      ( MAKE-4CRATE-VERIFY ?auto_10950 ?auto_10951 ?auto_10952 ?auto_10953 ?auto_10954 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10967 - SURFACE
      ?auto_10968 - SURFACE
    )
    :vars
    (
      ?auto_10978 - HOIST
      ?auto_10973 - PLACE
      ?auto_10983 - SURFACE
      ?auto_10980 - PLACE
      ?auto_10971 - HOIST
      ?auto_10977 - SURFACE
      ?auto_10981 - PLACE
      ?auto_10979 - HOIST
      ?auto_10976 - SURFACE
      ?auto_10975 - SURFACE
      ?auto_10972 - PLACE
      ?auto_10970 - HOIST
      ?auto_10982 - SURFACE
      ?auto_10974 - TRUCK
      ?auto_10969 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10978 ?auto_10973 ) ( IS-CRATE ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10968 ) ) ( not ( = ?auto_10983 ?auto_10967 ) ) ( not ( = ?auto_10983 ?auto_10968 ) ) ( not ( = ?auto_10980 ?auto_10973 ) ) ( HOIST-AT ?auto_10971 ?auto_10980 ) ( not ( = ?auto_10978 ?auto_10971 ) ) ( AVAILABLE ?auto_10971 ) ( SURFACE-AT ?auto_10968 ?auto_10980 ) ( ON ?auto_10968 ?auto_10977 ) ( CLEAR ?auto_10968 ) ( not ( = ?auto_10967 ?auto_10977 ) ) ( not ( = ?auto_10968 ?auto_10977 ) ) ( not ( = ?auto_10983 ?auto_10977 ) ) ( IS-CRATE ?auto_10967 ) ( not ( = ?auto_10981 ?auto_10973 ) ) ( not ( = ?auto_10980 ?auto_10981 ) ) ( HOIST-AT ?auto_10979 ?auto_10981 ) ( not ( = ?auto_10978 ?auto_10979 ) ) ( not ( = ?auto_10971 ?auto_10979 ) ) ( AVAILABLE ?auto_10979 ) ( SURFACE-AT ?auto_10967 ?auto_10981 ) ( ON ?auto_10967 ?auto_10976 ) ( CLEAR ?auto_10967 ) ( not ( = ?auto_10967 ?auto_10976 ) ) ( not ( = ?auto_10968 ?auto_10976 ) ) ( not ( = ?auto_10983 ?auto_10976 ) ) ( not ( = ?auto_10977 ?auto_10976 ) ) ( IS-CRATE ?auto_10983 ) ( not ( = ?auto_10975 ?auto_10983 ) ) ( not ( = ?auto_10967 ?auto_10975 ) ) ( not ( = ?auto_10968 ?auto_10975 ) ) ( not ( = ?auto_10977 ?auto_10975 ) ) ( not ( = ?auto_10976 ?auto_10975 ) ) ( not ( = ?auto_10972 ?auto_10973 ) ) ( not ( = ?auto_10980 ?auto_10972 ) ) ( not ( = ?auto_10981 ?auto_10972 ) ) ( HOIST-AT ?auto_10970 ?auto_10972 ) ( not ( = ?auto_10978 ?auto_10970 ) ) ( not ( = ?auto_10971 ?auto_10970 ) ) ( not ( = ?auto_10979 ?auto_10970 ) ) ( AVAILABLE ?auto_10970 ) ( SURFACE-AT ?auto_10983 ?auto_10972 ) ( ON ?auto_10983 ?auto_10982 ) ( CLEAR ?auto_10983 ) ( not ( = ?auto_10967 ?auto_10982 ) ) ( not ( = ?auto_10968 ?auto_10982 ) ) ( not ( = ?auto_10983 ?auto_10982 ) ) ( not ( = ?auto_10977 ?auto_10982 ) ) ( not ( = ?auto_10976 ?auto_10982 ) ) ( not ( = ?auto_10975 ?auto_10982 ) ) ( TRUCK-AT ?auto_10974 ?auto_10973 ) ( SURFACE-AT ?auto_10969 ?auto_10973 ) ( CLEAR ?auto_10969 ) ( IS-CRATE ?auto_10975 ) ( not ( = ?auto_10969 ?auto_10975 ) ) ( not ( = ?auto_10967 ?auto_10969 ) ) ( not ( = ?auto_10968 ?auto_10969 ) ) ( not ( = ?auto_10983 ?auto_10969 ) ) ( not ( = ?auto_10977 ?auto_10969 ) ) ( not ( = ?auto_10976 ?auto_10969 ) ) ( not ( = ?auto_10982 ?auto_10969 ) ) ( AVAILABLE ?auto_10978 ) ( IN ?auto_10975 ?auto_10974 ) )
    :subtasks
    ( ( !UNLOAD ?auto_10978 ?auto_10975 ?auto_10974 ?auto_10973 )
      ( MAKE-2CRATE ?auto_10983 ?auto_10967 ?auto_10968 )
      ( MAKE-1CRATE-VERIFY ?auto_10967 ?auto_10968 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_10984 - SURFACE
      ?auto_10985 - SURFACE
      ?auto_10986 - SURFACE
    )
    :vars
    (
      ?auto_10990 - HOIST
      ?auto_10988 - PLACE
      ?auto_10992 - PLACE
      ?auto_11000 - HOIST
      ?auto_10994 - SURFACE
      ?auto_10987 - PLACE
      ?auto_10996 - HOIST
      ?auto_10993 - SURFACE
      ?auto_10998 - SURFACE
      ?auto_10999 - PLACE
      ?auto_10989 - HOIST
      ?auto_10995 - SURFACE
      ?auto_10997 - TRUCK
      ?auto_10991 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10990 ?auto_10988 ) ( IS-CRATE ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10986 ) ) ( not ( = ?auto_10984 ?auto_10985 ) ) ( not ( = ?auto_10984 ?auto_10986 ) ) ( not ( = ?auto_10992 ?auto_10988 ) ) ( HOIST-AT ?auto_11000 ?auto_10992 ) ( not ( = ?auto_10990 ?auto_11000 ) ) ( AVAILABLE ?auto_11000 ) ( SURFACE-AT ?auto_10986 ?auto_10992 ) ( ON ?auto_10986 ?auto_10994 ) ( CLEAR ?auto_10986 ) ( not ( = ?auto_10985 ?auto_10994 ) ) ( not ( = ?auto_10986 ?auto_10994 ) ) ( not ( = ?auto_10984 ?auto_10994 ) ) ( IS-CRATE ?auto_10985 ) ( not ( = ?auto_10987 ?auto_10988 ) ) ( not ( = ?auto_10992 ?auto_10987 ) ) ( HOIST-AT ?auto_10996 ?auto_10987 ) ( not ( = ?auto_10990 ?auto_10996 ) ) ( not ( = ?auto_11000 ?auto_10996 ) ) ( AVAILABLE ?auto_10996 ) ( SURFACE-AT ?auto_10985 ?auto_10987 ) ( ON ?auto_10985 ?auto_10993 ) ( CLEAR ?auto_10985 ) ( not ( = ?auto_10985 ?auto_10993 ) ) ( not ( = ?auto_10986 ?auto_10993 ) ) ( not ( = ?auto_10984 ?auto_10993 ) ) ( not ( = ?auto_10994 ?auto_10993 ) ) ( IS-CRATE ?auto_10984 ) ( not ( = ?auto_10998 ?auto_10984 ) ) ( not ( = ?auto_10985 ?auto_10998 ) ) ( not ( = ?auto_10986 ?auto_10998 ) ) ( not ( = ?auto_10994 ?auto_10998 ) ) ( not ( = ?auto_10993 ?auto_10998 ) ) ( not ( = ?auto_10999 ?auto_10988 ) ) ( not ( = ?auto_10992 ?auto_10999 ) ) ( not ( = ?auto_10987 ?auto_10999 ) ) ( HOIST-AT ?auto_10989 ?auto_10999 ) ( not ( = ?auto_10990 ?auto_10989 ) ) ( not ( = ?auto_11000 ?auto_10989 ) ) ( not ( = ?auto_10996 ?auto_10989 ) ) ( AVAILABLE ?auto_10989 ) ( SURFACE-AT ?auto_10984 ?auto_10999 ) ( ON ?auto_10984 ?auto_10995 ) ( CLEAR ?auto_10984 ) ( not ( = ?auto_10985 ?auto_10995 ) ) ( not ( = ?auto_10986 ?auto_10995 ) ) ( not ( = ?auto_10984 ?auto_10995 ) ) ( not ( = ?auto_10994 ?auto_10995 ) ) ( not ( = ?auto_10993 ?auto_10995 ) ) ( not ( = ?auto_10998 ?auto_10995 ) ) ( TRUCK-AT ?auto_10997 ?auto_10988 ) ( SURFACE-AT ?auto_10991 ?auto_10988 ) ( CLEAR ?auto_10991 ) ( IS-CRATE ?auto_10998 ) ( not ( = ?auto_10991 ?auto_10998 ) ) ( not ( = ?auto_10985 ?auto_10991 ) ) ( not ( = ?auto_10986 ?auto_10991 ) ) ( not ( = ?auto_10984 ?auto_10991 ) ) ( not ( = ?auto_10994 ?auto_10991 ) ) ( not ( = ?auto_10993 ?auto_10991 ) ) ( not ( = ?auto_10995 ?auto_10991 ) ) ( AVAILABLE ?auto_10990 ) ( IN ?auto_10998 ?auto_10997 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10985 ?auto_10986 )
      ( MAKE-2CRATE-VERIFY ?auto_10984 ?auto_10985 ?auto_10986 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11001 - SURFACE
      ?auto_11002 - SURFACE
      ?auto_11003 - SURFACE
      ?auto_11004 - SURFACE
    )
    :vars
    (
      ?auto_11017 - HOIST
      ?auto_11006 - PLACE
      ?auto_11011 - PLACE
      ?auto_11013 - HOIST
      ?auto_11016 - SURFACE
      ?auto_11007 - PLACE
      ?auto_11005 - HOIST
      ?auto_11008 - SURFACE
      ?auto_11014 - PLACE
      ?auto_11015 - HOIST
      ?auto_11009 - SURFACE
      ?auto_11012 - TRUCK
      ?auto_11010 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11017 ?auto_11006 ) ( IS-CRATE ?auto_11004 ) ( not ( = ?auto_11003 ?auto_11004 ) ) ( not ( = ?auto_11002 ?auto_11003 ) ) ( not ( = ?auto_11002 ?auto_11004 ) ) ( not ( = ?auto_11011 ?auto_11006 ) ) ( HOIST-AT ?auto_11013 ?auto_11011 ) ( not ( = ?auto_11017 ?auto_11013 ) ) ( AVAILABLE ?auto_11013 ) ( SURFACE-AT ?auto_11004 ?auto_11011 ) ( ON ?auto_11004 ?auto_11016 ) ( CLEAR ?auto_11004 ) ( not ( = ?auto_11003 ?auto_11016 ) ) ( not ( = ?auto_11004 ?auto_11016 ) ) ( not ( = ?auto_11002 ?auto_11016 ) ) ( IS-CRATE ?auto_11003 ) ( not ( = ?auto_11007 ?auto_11006 ) ) ( not ( = ?auto_11011 ?auto_11007 ) ) ( HOIST-AT ?auto_11005 ?auto_11007 ) ( not ( = ?auto_11017 ?auto_11005 ) ) ( not ( = ?auto_11013 ?auto_11005 ) ) ( AVAILABLE ?auto_11005 ) ( SURFACE-AT ?auto_11003 ?auto_11007 ) ( ON ?auto_11003 ?auto_11008 ) ( CLEAR ?auto_11003 ) ( not ( = ?auto_11003 ?auto_11008 ) ) ( not ( = ?auto_11004 ?auto_11008 ) ) ( not ( = ?auto_11002 ?auto_11008 ) ) ( not ( = ?auto_11016 ?auto_11008 ) ) ( IS-CRATE ?auto_11002 ) ( not ( = ?auto_11001 ?auto_11002 ) ) ( not ( = ?auto_11003 ?auto_11001 ) ) ( not ( = ?auto_11004 ?auto_11001 ) ) ( not ( = ?auto_11016 ?auto_11001 ) ) ( not ( = ?auto_11008 ?auto_11001 ) ) ( not ( = ?auto_11014 ?auto_11006 ) ) ( not ( = ?auto_11011 ?auto_11014 ) ) ( not ( = ?auto_11007 ?auto_11014 ) ) ( HOIST-AT ?auto_11015 ?auto_11014 ) ( not ( = ?auto_11017 ?auto_11015 ) ) ( not ( = ?auto_11013 ?auto_11015 ) ) ( not ( = ?auto_11005 ?auto_11015 ) ) ( AVAILABLE ?auto_11015 ) ( SURFACE-AT ?auto_11002 ?auto_11014 ) ( ON ?auto_11002 ?auto_11009 ) ( CLEAR ?auto_11002 ) ( not ( = ?auto_11003 ?auto_11009 ) ) ( not ( = ?auto_11004 ?auto_11009 ) ) ( not ( = ?auto_11002 ?auto_11009 ) ) ( not ( = ?auto_11016 ?auto_11009 ) ) ( not ( = ?auto_11008 ?auto_11009 ) ) ( not ( = ?auto_11001 ?auto_11009 ) ) ( TRUCK-AT ?auto_11012 ?auto_11006 ) ( SURFACE-AT ?auto_11010 ?auto_11006 ) ( CLEAR ?auto_11010 ) ( IS-CRATE ?auto_11001 ) ( not ( = ?auto_11010 ?auto_11001 ) ) ( not ( = ?auto_11003 ?auto_11010 ) ) ( not ( = ?auto_11004 ?auto_11010 ) ) ( not ( = ?auto_11002 ?auto_11010 ) ) ( not ( = ?auto_11016 ?auto_11010 ) ) ( not ( = ?auto_11008 ?auto_11010 ) ) ( not ( = ?auto_11009 ?auto_11010 ) ) ( AVAILABLE ?auto_11017 ) ( IN ?auto_11001 ?auto_11012 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11002 ?auto_11003 ?auto_11004 )
      ( MAKE-3CRATE-VERIFY ?auto_11001 ?auto_11002 ?auto_11003 ?auto_11004 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11018 - SURFACE
      ?auto_11019 - SURFACE
      ?auto_11020 - SURFACE
      ?auto_11021 - SURFACE
      ?auto_11022 - SURFACE
    )
    :vars
    (
      ?auto_11034 - HOIST
      ?auto_11024 - PLACE
      ?auto_11028 - PLACE
      ?auto_11030 - HOIST
      ?auto_11033 - SURFACE
      ?auto_11025 - PLACE
      ?auto_11023 - HOIST
      ?auto_11026 - SURFACE
      ?auto_11031 - PLACE
      ?auto_11032 - HOIST
      ?auto_11027 - SURFACE
      ?auto_11029 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11034 ?auto_11024 ) ( IS-CRATE ?auto_11022 ) ( not ( = ?auto_11021 ?auto_11022 ) ) ( not ( = ?auto_11020 ?auto_11021 ) ) ( not ( = ?auto_11020 ?auto_11022 ) ) ( not ( = ?auto_11028 ?auto_11024 ) ) ( HOIST-AT ?auto_11030 ?auto_11028 ) ( not ( = ?auto_11034 ?auto_11030 ) ) ( AVAILABLE ?auto_11030 ) ( SURFACE-AT ?auto_11022 ?auto_11028 ) ( ON ?auto_11022 ?auto_11033 ) ( CLEAR ?auto_11022 ) ( not ( = ?auto_11021 ?auto_11033 ) ) ( not ( = ?auto_11022 ?auto_11033 ) ) ( not ( = ?auto_11020 ?auto_11033 ) ) ( IS-CRATE ?auto_11021 ) ( not ( = ?auto_11025 ?auto_11024 ) ) ( not ( = ?auto_11028 ?auto_11025 ) ) ( HOIST-AT ?auto_11023 ?auto_11025 ) ( not ( = ?auto_11034 ?auto_11023 ) ) ( not ( = ?auto_11030 ?auto_11023 ) ) ( AVAILABLE ?auto_11023 ) ( SURFACE-AT ?auto_11021 ?auto_11025 ) ( ON ?auto_11021 ?auto_11026 ) ( CLEAR ?auto_11021 ) ( not ( = ?auto_11021 ?auto_11026 ) ) ( not ( = ?auto_11022 ?auto_11026 ) ) ( not ( = ?auto_11020 ?auto_11026 ) ) ( not ( = ?auto_11033 ?auto_11026 ) ) ( IS-CRATE ?auto_11020 ) ( not ( = ?auto_11019 ?auto_11020 ) ) ( not ( = ?auto_11021 ?auto_11019 ) ) ( not ( = ?auto_11022 ?auto_11019 ) ) ( not ( = ?auto_11033 ?auto_11019 ) ) ( not ( = ?auto_11026 ?auto_11019 ) ) ( not ( = ?auto_11031 ?auto_11024 ) ) ( not ( = ?auto_11028 ?auto_11031 ) ) ( not ( = ?auto_11025 ?auto_11031 ) ) ( HOIST-AT ?auto_11032 ?auto_11031 ) ( not ( = ?auto_11034 ?auto_11032 ) ) ( not ( = ?auto_11030 ?auto_11032 ) ) ( not ( = ?auto_11023 ?auto_11032 ) ) ( AVAILABLE ?auto_11032 ) ( SURFACE-AT ?auto_11020 ?auto_11031 ) ( ON ?auto_11020 ?auto_11027 ) ( CLEAR ?auto_11020 ) ( not ( = ?auto_11021 ?auto_11027 ) ) ( not ( = ?auto_11022 ?auto_11027 ) ) ( not ( = ?auto_11020 ?auto_11027 ) ) ( not ( = ?auto_11033 ?auto_11027 ) ) ( not ( = ?auto_11026 ?auto_11027 ) ) ( not ( = ?auto_11019 ?auto_11027 ) ) ( TRUCK-AT ?auto_11029 ?auto_11024 ) ( SURFACE-AT ?auto_11018 ?auto_11024 ) ( CLEAR ?auto_11018 ) ( IS-CRATE ?auto_11019 ) ( not ( = ?auto_11018 ?auto_11019 ) ) ( not ( = ?auto_11021 ?auto_11018 ) ) ( not ( = ?auto_11022 ?auto_11018 ) ) ( not ( = ?auto_11020 ?auto_11018 ) ) ( not ( = ?auto_11033 ?auto_11018 ) ) ( not ( = ?auto_11026 ?auto_11018 ) ) ( not ( = ?auto_11027 ?auto_11018 ) ) ( AVAILABLE ?auto_11034 ) ( IN ?auto_11019 ?auto_11029 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11020 ?auto_11021 ?auto_11022 )
      ( MAKE-4CRATE-VERIFY ?auto_11018 ?auto_11019 ?auto_11020 ?auto_11021 ?auto_11022 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11035 - SURFACE
      ?auto_11036 - SURFACE
    )
    :vars
    (
      ?auto_11050 - HOIST
      ?auto_11038 - PLACE
      ?auto_11051 - SURFACE
      ?auto_11043 - PLACE
      ?auto_11045 - HOIST
      ?auto_11049 - SURFACE
      ?auto_11039 - PLACE
      ?auto_11037 - HOIST
      ?auto_11040 - SURFACE
      ?auto_11047 - SURFACE
      ?auto_11046 - PLACE
      ?auto_11048 - HOIST
      ?auto_11041 - SURFACE
      ?auto_11042 - SURFACE
      ?auto_11044 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11050 ?auto_11038 ) ( IS-CRATE ?auto_11036 ) ( not ( = ?auto_11035 ?auto_11036 ) ) ( not ( = ?auto_11051 ?auto_11035 ) ) ( not ( = ?auto_11051 ?auto_11036 ) ) ( not ( = ?auto_11043 ?auto_11038 ) ) ( HOIST-AT ?auto_11045 ?auto_11043 ) ( not ( = ?auto_11050 ?auto_11045 ) ) ( AVAILABLE ?auto_11045 ) ( SURFACE-AT ?auto_11036 ?auto_11043 ) ( ON ?auto_11036 ?auto_11049 ) ( CLEAR ?auto_11036 ) ( not ( = ?auto_11035 ?auto_11049 ) ) ( not ( = ?auto_11036 ?auto_11049 ) ) ( not ( = ?auto_11051 ?auto_11049 ) ) ( IS-CRATE ?auto_11035 ) ( not ( = ?auto_11039 ?auto_11038 ) ) ( not ( = ?auto_11043 ?auto_11039 ) ) ( HOIST-AT ?auto_11037 ?auto_11039 ) ( not ( = ?auto_11050 ?auto_11037 ) ) ( not ( = ?auto_11045 ?auto_11037 ) ) ( AVAILABLE ?auto_11037 ) ( SURFACE-AT ?auto_11035 ?auto_11039 ) ( ON ?auto_11035 ?auto_11040 ) ( CLEAR ?auto_11035 ) ( not ( = ?auto_11035 ?auto_11040 ) ) ( not ( = ?auto_11036 ?auto_11040 ) ) ( not ( = ?auto_11051 ?auto_11040 ) ) ( not ( = ?auto_11049 ?auto_11040 ) ) ( IS-CRATE ?auto_11051 ) ( not ( = ?auto_11047 ?auto_11051 ) ) ( not ( = ?auto_11035 ?auto_11047 ) ) ( not ( = ?auto_11036 ?auto_11047 ) ) ( not ( = ?auto_11049 ?auto_11047 ) ) ( not ( = ?auto_11040 ?auto_11047 ) ) ( not ( = ?auto_11046 ?auto_11038 ) ) ( not ( = ?auto_11043 ?auto_11046 ) ) ( not ( = ?auto_11039 ?auto_11046 ) ) ( HOIST-AT ?auto_11048 ?auto_11046 ) ( not ( = ?auto_11050 ?auto_11048 ) ) ( not ( = ?auto_11045 ?auto_11048 ) ) ( not ( = ?auto_11037 ?auto_11048 ) ) ( AVAILABLE ?auto_11048 ) ( SURFACE-AT ?auto_11051 ?auto_11046 ) ( ON ?auto_11051 ?auto_11041 ) ( CLEAR ?auto_11051 ) ( not ( = ?auto_11035 ?auto_11041 ) ) ( not ( = ?auto_11036 ?auto_11041 ) ) ( not ( = ?auto_11051 ?auto_11041 ) ) ( not ( = ?auto_11049 ?auto_11041 ) ) ( not ( = ?auto_11040 ?auto_11041 ) ) ( not ( = ?auto_11047 ?auto_11041 ) ) ( SURFACE-AT ?auto_11042 ?auto_11038 ) ( CLEAR ?auto_11042 ) ( IS-CRATE ?auto_11047 ) ( not ( = ?auto_11042 ?auto_11047 ) ) ( not ( = ?auto_11035 ?auto_11042 ) ) ( not ( = ?auto_11036 ?auto_11042 ) ) ( not ( = ?auto_11051 ?auto_11042 ) ) ( not ( = ?auto_11049 ?auto_11042 ) ) ( not ( = ?auto_11040 ?auto_11042 ) ) ( not ( = ?auto_11041 ?auto_11042 ) ) ( AVAILABLE ?auto_11050 ) ( IN ?auto_11047 ?auto_11044 ) ( TRUCK-AT ?auto_11044 ?auto_11043 ) )
    :subtasks
    ( ( !DRIVE ?auto_11044 ?auto_11043 ?auto_11038 )
      ( MAKE-2CRATE ?auto_11051 ?auto_11035 ?auto_11036 )
      ( MAKE-1CRATE-VERIFY ?auto_11035 ?auto_11036 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11052 - SURFACE
      ?auto_11053 - SURFACE
      ?auto_11054 - SURFACE
    )
    :vars
    (
      ?auto_11063 - HOIST
      ?auto_11064 - PLACE
      ?auto_11066 - PLACE
      ?auto_11056 - HOIST
      ?auto_11062 - SURFACE
      ?auto_11060 - PLACE
      ?auto_11068 - HOIST
      ?auto_11065 - SURFACE
      ?auto_11067 - SURFACE
      ?auto_11059 - PLACE
      ?auto_11055 - HOIST
      ?auto_11057 - SURFACE
      ?auto_11058 - SURFACE
      ?auto_11061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11063 ?auto_11064 ) ( IS-CRATE ?auto_11054 ) ( not ( = ?auto_11053 ?auto_11054 ) ) ( not ( = ?auto_11052 ?auto_11053 ) ) ( not ( = ?auto_11052 ?auto_11054 ) ) ( not ( = ?auto_11066 ?auto_11064 ) ) ( HOIST-AT ?auto_11056 ?auto_11066 ) ( not ( = ?auto_11063 ?auto_11056 ) ) ( AVAILABLE ?auto_11056 ) ( SURFACE-AT ?auto_11054 ?auto_11066 ) ( ON ?auto_11054 ?auto_11062 ) ( CLEAR ?auto_11054 ) ( not ( = ?auto_11053 ?auto_11062 ) ) ( not ( = ?auto_11054 ?auto_11062 ) ) ( not ( = ?auto_11052 ?auto_11062 ) ) ( IS-CRATE ?auto_11053 ) ( not ( = ?auto_11060 ?auto_11064 ) ) ( not ( = ?auto_11066 ?auto_11060 ) ) ( HOIST-AT ?auto_11068 ?auto_11060 ) ( not ( = ?auto_11063 ?auto_11068 ) ) ( not ( = ?auto_11056 ?auto_11068 ) ) ( AVAILABLE ?auto_11068 ) ( SURFACE-AT ?auto_11053 ?auto_11060 ) ( ON ?auto_11053 ?auto_11065 ) ( CLEAR ?auto_11053 ) ( not ( = ?auto_11053 ?auto_11065 ) ) ( not ( = ?auto_11054 ?auto_11065 ) ) ( not ( = ?auto_11052 ?auto_11065 ) ) ( not ( = ?auto_11062 ?auto_11065 ) ) ( IS-CRATE ?auto_11052 ) ( not ( = ?auto_11067 ?auto_11052 ) ) ( not ( = ?auto_11053 ?auto_11067 ) ) ( not ( = ?auto_11054 ?auto_11067 ) ) ( not ( = ?auto_11062 ?auto_11067 ) ) ( not ( = ?auto_11065 ?auto_11067 ) ) ( not ( = ?auto_11059 ?auto_11064 ) ) ( not ( = ?auto_11066 ?auto_11059 ) ) ( not ( = ?auto_11060 ?auto_11059 ) ) ( HOIST-AT ?auto_11055 ?auto_11059 ) ( not ( = ?auto_11063 ?auto_11055 ) ) ( not ( = ?auto_11056 ?auto_11055 ) ) ( not ( = ?auto_11068 ?auto_11055 ) ) ( AVAILABLE ?auto_11055 ) ( SURFACE-AT ?auto_11052 ?auto_11059 ) ( ON ?auto_11052 ?auto_11057 ) ( CLEAR ?auto_11052 ) ( not ( = ?auto_11053 ?auto_11057 ) ) ( not ( = ?auto_11054 ?auto_11057 ) ) ( not ( = ?auto_11052 ?auto_11057 ) ) ( not ( = ?auto_11062 ?auto_11057 ) ) ( not ( = ?auto_11065 ?auto_11057 ) ) ( not ( = ?auto_11067 ?auto_11057 ) ) ( SURFACE-AT ?auto_11058 ?auto_11064 ) ( CLEAR ?auto_11058 ) ( IS-CRATE ?auto_11067 ) ( not ( = ?auto_11058 ?auto_11067 ) ) ( not ( = ?auto_11053 ?auto_11058 ) ) ( not ( = ?auto_11054 ?auto_11058 ) ) ( not ( = ?auto_11052 ?auto_11058 ) ) ( not ( = ?auto_11062 ?auto_11058 ) ) ( not ( = ?auto_11065 ?auto_11058 ) ) ( not ( = ?auto_11057 ?auto_11058 ) ) ( AVAILABLE ?auto_11063 ) ( IN ?auto_11067 ?auto_11061 ) ( TRUCK-AT ?auto_11061 ?auto_11066 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11053 ?auto_11054 )
      ( MAKE-2CRATE-VERIFY ?auto_11052 ?auto_11053 ?auto_11054 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11069 - SURFACE
      ?auto_11070 - SURFACE
      ?auto_11071 - SURFACE
      ?auto_11072 - SURFACE
    )
    :vars
    (
      ?auto_11075 - HOIST
      ?auto_11079 - PLACE
      ?auto_11073 - PLACE
      ?auto_11074 - HOIST
      ?auto_11083 - SURFACE
      ?auto_11076 - PLACE
      ?auto_11082 - HOIST
      ?auto_11081 - SURFACE
      ?auto_11078 - PLACE
      ?auto_11084 - HOIST
      ?auto_11077 - SURFACE
      ?auto_11085 - SURFACE
      ?auto_11080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11075 ?auto_11079 ) ( IS-CRATE ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11072 ) ) ( not ( = ?auto_11070 ?auto_11071 ) ) ( not ( = ?auto_11070 ?auto_11072 ) ) ( not ( = ?auto_11073 ?auto_11079 ) ) ( HOIST-AT ?auto_11074 ?auto_11073 ) ( not ( = ?auto_11075 ?auto_11074 ) ) ( AVAILABLE ?auto_11074 ) ( SURFACE-AT ?auto_11072 ?auto_11073 ) ( ON ?auto_11072 ?auto_11083 ) ( CLEAR ?auto_11072 ) ( not ( = ?auto_11071 ?auto_11083 ) ) ( not ( = ?auto_11072 ?auto_11083 ) ) ( not ( = ?auto_11070 ?auto_11083 ) ) ( IS-CRATE ?auto_11071 ) ( not ( = ?auto_11076 ?auto_11079 ) ) ( not ( = ?auto_11073 ?auto_11076 ) ) ( HOIST-AT ?auto_11082 ?auto_11076 ) ( not ( = ?auto_11075 ?auto_11082 ) ) ( not ( = ?auto_11074 ?auto_11082 ) ) ( AVAILABLE ?auto_11082 ) ( SURFACE-AT ?auto_11071 ?auto_11076 ) ( ON ?auto_11071 ?auto_11081 ) ( CLEAR ?auto_11071 ) ( not ( = ?auto_11071 ?auto_11081 ) ) ( not ( = ?auto_11072 ?auto_11081 ) ) ( not ( = ?auto_11070 ?auto_11081 ) ) ( not ( = ?auto_11083 ?auto_11081 ) ) ( IS-CRATE ?auto_11070 ) ( not ( = ?auto_11069 ?auto_11070 ) ) ( not ( = ?auto_11071 ?auto_11069 ) ) ( not ( = ?auto_11072 ?auto_11069 ) ) ( not ( = ?auto_11083 ?auto_11069 ) ) ( not ( = ?auto_11081 ?auto_11069 ) ) ( not ( = ?auto_11078 ?auto_11079 ) ) ( not ( = ?auto_11073 ?auto_11078 ) ) ( not ( = ?auto_11076 ?auto_11078 ) ) ( HOIST-AT ?auto_11084 ?auto_11078 ) ( not ( = ?auto_11075 ?auto_11084 ) ) ( not ( = ?auto_11074 ?auto_11084 ) ) ( not ( = ?auto_11082 ?auto_11084 ) ) ( AVAILABLE ?auto_11084 ) ( SURFACE-AT ?auto_11070 ?auto_11078 ) ( ON ?auto_11070 ?auto_11077 ) ( CLEAR ?auto_11070 ) ( not ( = ?auto_11071 ?auto_11077 ) ) ( not ( = ?auto_11072 ?auto_11077 ) ) ( not ( = ?auto_11070 ?auto_11077 ) ) ( not ( = ?auto_11083 ?auto_11077 ) ) ( not ( = ?auto_11081 ?auto_11077 ) ) ( not ( = ?auto_11069 ?auto_11077 ) ) ( SURFACE-AT ?auto_11085 ?auto_11079 ) ( CLEAR ?auto_11085 ) ( IS-CRATE ?auto_11069 ) ( not ( = ?auto_11085 ?auto_11069 ) ) ( not ( = ?auto_11071 ?auto_11085 ) ) ( not ( = ?auto_11072 ?auto_11085 ) ) ( not ( = ?auto_11070 ?auto_11085 ) ) ( not ( = ?auto_11083 ?auto_11085 ) ) ( not ( = ?auto_11081 ?auto_11085 ) ) ( not ( = ?auto_11077 ?auto_11085 ) ) ( AVAILABLE ?auto_11075 ) ( IN ?auto_11069 ?auto_11080 ) ( TRUCK-AT ?auto_11080 ?auto_11073 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11070 ?auto_11071 ?auto_11072 )
      ( MAKE-3CRATE-VERIFY ?auto_11069 ?auto_11070 ?auto_11071 ?auto_11072 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11086 - SURFACE
      ?auto_11087 - SURFACE
      ?auto_11088 - SURFACE
      ?auto_11089 - SURFACE
      ?auto_11090 - SURFACE
    )
    :vars
    (
      ?auto_11093 - HOIST
      ?auto_11097 - PLACE
      ?auto_11091 - PLACE
      ?auto_11092 - HOIST
      ?auto_11101 - SURFACE
      ?auto_11094 - PLACE
      ?auto_11100 - HOIST
      ?auto_11099 - SURFACE
      ?auto_11096 - PLACE
      ?auto_11102 - HOIST
      ?auto_11095 - SURFACE
      ?auto_11098 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11093 ?auto_11097 ) ( IS-CRATE ?auto_11090 ) ( not ( = ?auto_11089 ?auto_11090 ) ) ( not ( = ?auto_11088 ?auto_11089 ) ) ( not ( = ?auto_11088 ?auto_11090 ) ) ( not ( = ?auto_11091 ?auto_11097 ) ) ( HOIST-AT ?auto_11092 ?auto_11091 ) ( not ( = ?auto_11093 ?auto_11092 ) ) ( AVAILABLE ?auto_11092 ) ( SURFACE-AT ?auto_11090 ?auto_11091 ) ( ON ?auto_11090 ?auto_11101 ) ( CLEAR ?auto_11090 ) ( not ( = ?auto_11089 ?auto_11101 ) ) ( not ( = ?auto_11090 ?auto_11101 ) ) ( not ( = ?auto_11088 ?auto_11101 ) ) ( IS-CRATE ?auto_11089 ) ( not ( = ?auto_11094 ?auto_11097 ) ) ( not ( = ?auto_11091 ?auto_11094 ) ) ( HOIST-AT ?auto_11100 ?auto_11094 ) ( not ( = ?auto_11093 ?auto_11100 ) ) ( not ( = ?auto_11092 ?auto_11100 ) ) ( AVAILABLE ?auto_11100 ) ( SURFACE-AT ?auto_11089 ?auto_11094 ) ( ON ?auto_11089 ?auto_11099 ) ( CLEAR ?auto_11089 ) ( not ( = ?auto_11089 ?auto_11099 ) ) ( not ( = ?auto_11090 ?auto_11099 ) ) ( not ( = ?auto_11088 ?auto_11099 ) ) ( not ( = ?auto_11101 ?auto_11099 ) ) ( IS-CRATE ?auto_11088 ) ( not ( = ?auto_11087 ?auto_11088 ) ) ( not ( = ?auto_11089 ?auto_11087 ) ) ( not ( = ?auto_11090 ?auto_11087 ) ) ( not ( = ?auto_11101 ?auto_11087 ) ) ( not ( = ?auto_11099 ?auto_11087 ) ) ( not ( = ?auto_11096 ?auto_11097 ) ) ( not ( = ?auto_11091 ?auto_11096 ) ) ( not ( = ?auto_11094 ?auto_11096 ) ) ( HOIST-AT ?auto_11102 ?auto_11096 ) ( not ( = ?auto_11093 ?auto_11102 ) ) ( not ( = ?auto_11092 ?auto_11102 ) ) ( not ( = ?auto_11100 ?auto_11102 ) ) ( AVAILABLE ?auto_11102 ) ( SURFACE-AT ?auto_11088 ?auto_11096 ) ( ON ?auto_11088 ?auto_11095 ) ( CLEAR ?auto_11088 ) ( not ( = ?auto_11089 ?auto_11095 ) ) ( not ( = ?auto_11090 ?auto_11095 ) ) ( not ( = ?auto_11088 ?auto_11095 ) ) ( not ( = ?auto_11101 ?auto_11095 ) ) ( not ( = ?auto_11099 ?auto_11095 ) ) ( not ( = ?auto_11087 ?auto_11095 ) ) ( SURFACE-AT ?auto_11086 ?auto_11097 ) ( CLEAR ?auto_11086 ) ( IS-CRATE ?auto_11087 ) ( not ( = ?auto_11086 ?auto_11087 ) ) ( not ( = ?auto_11089 ?auto_11086 ) ) ( not ( = ?auto_11090 ?auto_11086 ) ) ( not ( = ?auto_11088 ?auto_11086 ) ) ( not ( = ?auto_11101 ?auto_11086 ) ) ( not ( = ?auto_11099 ?auto_11086 ) ) ( not ( = ?auto_11095 ?auto_11086 ) ) ( AVAILABLE ?auto_11093 ) ( IN ?auto_11087 ?auto_11098 ) ( TRUCK-AT ?auto_11098 ?auto_11091 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11088 ?auto_11089 ?auto_11090 )
      ( MAKE-4CRATE-VERIFY ?auto_11086 ?auto_11087 ?auto_11088 ?auto_11089 ?auto_11090 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11103 - SURFACE
      ?auto_11104 - SURFACE
    )
    :vars
    (
      ?auto_11107 - HOIST
      ?auto_11112 - PLACE
      ?auto_11111 - SURFACE
      ?auto_11105 - PLACE
      ?auto_11106 - HOIST
      ?auto_11117 - SURFACE
      ?auto_11108 - PLACE
      ?auto_11116 - HOIST
      ?auto_11114 - SURFACE
      ?auto_11115 - SURFACE
      ?auto_11110 - PLACE
      ?auto_11118 - HOIST
      ?auto_11109 - SURFACE
      ?auto_11119 - SURFACE
      ?auto_11113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11107 ?auto_11112 ) ( IS-CRATE ?auto_11104 ) ( not ( = ?auto_11103 ?auto_11104 ) ) ( not ( = ?auto_11111 ?auto_11103 ) ) ( not ( = ?auto_11111 ?auto_11104 ) ) ( not ( = ?auto_11105 ?auto_11112 ) ) ( HOIST-AT ?auto_11106 ?auto_11105 ) ( not ( = ?auto_11107 ?auto_11106 ) ) ( SURFACE-AT ?auto_11104 ?auto_11105 ) ( ON ?auto_11104 ?auto_11117 ) ( CLEAR ?auto_11104 ) ( not ( = ?auto_11103 ?auto_11117 ) ) ( not ( = ?auto_11104 ?auto_11117 ) ) ( not ( = ?auto_11111 ?auto_11117 ) ) ( IS-CRATE ?auto_11103 ) ( not ( = ?auto_11108 ?auto_11112 ) ) ( not ( = ?auto_11105 ?auto_11108 ) ) ( HOIST-AT ?auto_11116 ?auto_11108 ) ( not ( = ?auto_11107 ?auto_11116 ) ) ( not ( = ?auto_11106 ?auto_11116 ) ) ( AVAILABLE ?auto_11116 ) ( SURFACE-AT ?auto_11103 ?auto_11108 ) ( ON ?auto_11103 ?auto_11114 ) ( CLEAR ?auto_11103 ) ( not ( = ?auto_11103 ?auto_11114 ) ) ( not ( = ?auto_11104 ?auto_11114 ) ) ( not ( = ?auto_11111 ?auto_11114 ) ) ( not ( = ?auto_11117 ?auto_11114 ) ) ( IS-CRATE ?auto_11111 ) ( not ( = ?auto_11115 ?auto_11111 ) ) ( not ( = ?auto_11103 ?auto_11115 ) ) ( not ( = ?auto_11104 ?auto_11115 ) ) ( not ( = ?auto_11117 ?auto_11115 ) ) ( not ( = ?auto_11114 ?auto_11115 ) ) ( not ( = ?auto_11110 ?auto_11112 ) ) ( not ( = ?auto_11105 ?auto_11110 ) ) ( not ( = ?auto_11108 ?auto_11110 ) ) ( HOIST-AT ?auto_11118 ?auto_11110 ) ( not ( = ?auto_11107 ?auto_11118 ) ) ( not ( = ?auto_11106 ?auto_11118 ) ) ( not ( = ?auto_11116 ?auto_11118 ) ) ( AVAILABLE ?auto_11118 ) ( SURFACE-AT ?auto_11111 ?auto_11110 ) ( ON ?auto_11111 ?auto_11109 ) ( CLEAR ?auto_11111 ) ( not ( = ?auto_11103 ?auto_11109 ) ) ( not ( = ?auto_11104 ?auto_11109 ) ) ( not ( = ?auto_11111 ?auto_11109 ) ) ( not ( = ?auto_11117 ?auto_11109 ) ) ( not ( = ?auto_11114 ?auto_11109 ) ) ( not ( = ?auto_11115 ?auto_11109 ) ) ( SURFACE-AT ?auto_11119 ?auto_11112 ) ( CLEAR ?auto_11119 ) ( IS-CRATE ?auto_11115 ) ( not ( = ?auto_11119 ?auto_11115 ) ) ( not ( = ?auto_11103 ?auto_11119 ) ) ( not ( = ?auto_11104 ?auto_11119 ) ) ( not ( = ?auto_11111 ?auto_11119 ) ) ( not ( = ?auto_11117 ?auto_11119 ) ) ( not ( = ?auto_11114 ?auto_11119 ) ) ( not ( = ?auto_11109 ?auto_11119 ) ) ( AVAILABLE ?auto_11107 ) ( TRUCK-AT ?auto_11113 ?auto_11105 ) ( LIFTING ?auto_11106 ?auto_11115 ) )
    :subtasks
    ( ( !LOAD ?auto_11106 ?auto_11115 ?auto_11113 ?auto_11105 )
      ( MAKE-2CRATE ?auto_11111 ?auto_11103 ?auto_11104 )
      ( MAKE-1CRATE-VERIFY ?auto_11103 ?auto_11104 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11120 - SURFACE
      ?auto_11121 - SURFACE
      ?auto_11122 - SURFACE
    )
    :vars
    (
      ?auto_11134 - HOIST
      ?auto_11125 - PLACE
      ?auto_11131 - PLACE
      ?auto_11136 - HOIST
      ?auto_11126 - SURFACE
      ?auto_11135 - PLACE
      ?auto_11124 - HOIST
      ?auto_11127 - SURFACE
      ?auto_11129 - SURFACE
      ?auto_11133 - PLACE
      ?auto_11123 - HOIST
      ?auto_11130 - SURFACE
      ?auto_11128 - SURFACE
      ?auto_11132 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11134 ?auto_11125 ) ( IS-CRATE ?auto_11122 ) ( not ( = ?auto_11121 ?auto_11122 ) ) ( not ( = ?auto_11120 ?auto_11121 ) ) ( not ( = ?auto_11120 ?auto_11122 ) ) ( not ( = ?auto_11131 ?auto_11125 ) ) ( HOIST-AT ?auto_11136 ?auto_11131 ) ( not ( = ?auto_11134 ?auto_11136 ) ) ( SURFACE-AT ?auto_11122 ?auto_11131 ) ( ON ?auto_11122 ?auto_11126 ) ( CLEAR ?auto_11122 ) ( not ( = ?auto_11121 ?auto_11126 ) ) ( not ( = ?auto_11122 ?auto_11126 ) ) ( not ( = ?auto_11120 ?auto_11126 ) ) ( IS-CRATE ?auto_11121 ) ( not ( = ?auto_11135 ?auto_11125 ) ) ( not ( = ?auto_11131 ?auto_11135 ) ) ( HOIST-AT ?auto_11124 ?auto_11135 ) ( not ( = ?auto_11134 ?auto_11124 ) ) ( not ( = ?auto_11136 ?auto_11124 ) ) ( AVAILABLE ?auto_11124 ) ( SURFACE-AT ?auto_11121 ?auto_11135 ) ( ON ?auto_11121 ?auto_11127 ) ( CLEAR ?auto_11121 ) ( not ( = ?auto_11121 ?auto_11127 ) ) ( not ( = ?auto_11122 ?auto_11127 ) ) ( not ( = ?auto_11120 ?auto_11127 ) ) ( not ( = ?auto_11126 ?auto_11127 ) ) ( IS-CRATE ?auto_11120 ) ( not ( = ?auto_11129 ?auto_11120 ) ) ( not ( = ?auto_11121 ?auto_11129 ) ) ( not ( = ?auto_11122 ?auto_11129 ) ) ( not ( = ?auto_11126 ?auto_11129 ) ) ( not ( = ?auto_11127 ?auto_11129 ) ) ( not ( = ?auto_11133 ?auto_11125 ) ) ( not ( = ?auto_11131 ?auto_11133 ) ) ( not ( = ?auto_11135 ?auto_11133 ) ) ( HOIST-AT ?auto_11123 ?auto_11133 ) ( not ( = ?auto_11134 ?auto_11123 ) ) ( not ( = ?auto_11136 ?auto_11123 ) ) ( not ( = ?auto_11124 ?auto_11123 ) ) ( AVAILABLE ?auto_11123 ) ( SURFACE-AT ?auto_11120 ?auto_11133 ) ( ON ?auto_11120 ?auto_11130 ) ( CLEAR ?auto_11120 ) ( not ( = ?auto_11121 ?auto_11130 ) ) ( not ( = ?auto_11122 ?auto_11130 ) ) ( not ( = ?auto_11120 ?auto_11130 ) ) ( not ( = ?auto_11126 ?auto_11130 ) ) ( not ( = ?auto_11127 ?auto_11130 ) ) ( not ( = ?auto_11129 ?auto_11130 ) ) ( SURFACE-AT ?auto_11128 ?auto_11125 ) ( CLEAR ?auto_11128 ) ( IS-CRATE ?auto_11129 ) ( not ( = ?auto_11128 ?auto_11129 ) ) ( not ( = ?auto_11121 ?auto_11128 ) ) ( not ( = ?auto_11122 ?auto_11128 ) ) ( not ( = ?auto_11120 ?auto_11128 ) ) ( not ( = ?auto_11126 ?auto_11128 ) ) ( not ( = ?auto_11127 ?auto_11128 ) ) ( not ( = ?auto_11130 ?auto_11128 ) ) ( AVAILABLE ?auto_11134 ) ( TRUCK-AT ?auto_11132 ?auto_11131 ) ( LIFTING ?auto_11136 ?auto_11129 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11121 ?auto_11122 )
      ( MAKE-2CRATE-VERIFY ?auto_11120 ?auto_11121 ?auto_11122 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11137 - SURFACE
      ?auto_11138 - SURFACE
      ?auto_11139 - SURFACE
      ?auto_11140 - SURFACE
    )
    :vars
    (
      ?auto_11141 - HOIST
      ?auto_11146 - PLACE
      ?auto_11144 - PLACE
      ?auto_11145 - HOIST
      ?auto_11150 - SURFACE
      ?auto_11149 - PLACE
      ?auto_11148 - HOIST
      ?auto_11142 - SURFACE
      ?auto_11152 - PLACE
      ?auto_11143 - HOIST
      ?auto_11153 - SURFACE
      ?auto_11147 - SURFACE
      ?auto_11151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11141 ?auto_11146 ) ( IS-CRATE ?auto_11140 ) ( not ( = ?auto_11139 ?auto_11140 ) ) ( not ( = ?auto_11138 ?auto_11139 ) ) ( not ( = ?auto_11138 ?auto_11140 ) ) ( not ( = ?auto_11144 ?auto_11146 ) ) ( HOIST-AT ?auto_11145 ?auto_11144 ) ( not ( = ?auto_11141 ?auto_11145 ) ) ( SURFACE-AT ?auto_11140 ?auto_11144 ) ( ON ?auto_11140 ?auto_11150 ) ( CLEAR ?auto_11140 ) ( not ( = ?auto_11139 ?auto_11150 ) ) ( not ( = ?auto_11140 ?auto_11150 ) ) ( not ( = ?auto_11138 ?auto_11150 ) ) ( IS-CRATE ?auto_11139 ) ( not ( = ?auto_11149 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11149 ) ) ( HOIST-AT ?auto_11148 ?auto_11149 ) ( not ( = ?auto_11141 ?auto_11148 ) ) ( not ( = ?auto_11145 ?auto_11148 ) ) ( AVAILABLE ?auto_11148 ) ( SURFACE-AT ?auto_11139 ?auto_11149 ) ( ON ?auto_11139 ?auto_11142 ) ( CLEAR ?auto_11139 ) ( not ( = ?auto_11139 ?auto_11142 ) ) ( not ( = ?auto_11140 ?auto_11142 ) ) ( not ( = ?auto_11138 ?auto_11142 ) ) ( not ( = ?auto_11150 ?auto_11142 ) ) ( IS-CRATE ?auto_11138 ) ( not ( = ?auto_11137 ?auto_11138 ) ) ( not ( = ?auto_11139 ?auto_11137 ) ) ( not ( = ?auto_11140 ?auto_11137 ) ) ( not ( = ?auto_11150 ?auto_11137 ) ) ( not ( = ?auto_11142 ?auto_11137 ) ) ( not ( = ?auto_11152 ?auto_11146 ) ) ( not ( = ?auto_11144 ?auto_11152 ) ) ( not ( = ?auto_11149 ?auto_11152 ) ) ( HOIST-AT ?auto_11143 ?auto_11152 ) ( not ( = ?auto_11141 ?auto_11143 ) ) ( not ( = ?auto_11145 ?auto_11143 ) ) ( not ( = ?auto_11148 ?auto_11143 ) ) ( AVAILABLE ?auto_11143 ) ( SURFACE-AT ?auto_11138 ?auto_11152 ) ( ON ?auto_11138 ?auto_11153 ) ( CLEAR ?auto_11138 ) ( not ( = ?auto_11139 ?auto_11153 ) ) ( not ( = ?auto_11140 ?auto_11153 ) ) ( not ( = ?auto_11138 ?auto_11153 ) ) ( not ( = ?auto_11150 ?auto_11153 ) ) ( not ( = ?auto_11142 ?auto_11153 ) ) ( not ( = ?auto_11137 ?auto_11153 ) ) ( SURFACE-AT ?auto_11147 ?auto_11146 ) ( CLEAR ?auto_11147 ) ( IS-CRATE ?auto_11137 ) ( not ( = ?auto_11147 ?auto_11137 ) ) ( not ( = ?auto_11139 ?auto_11147 ) ) ( not ( = ?auto_11140 ?auto_11147 ) ) ( not ( = ?auto_11138 ?auto_11147 ) ) ( not ( = ?auto_11150 ?auto_11147 ) ) ( not ( = ?auto_11142 ?auto_11147 ) ) ( not ( = ?auto_11153 ?auto_11147 ) ) ( AVAILABLE ?auto_11141 ) ( TRUCK-AT ?auto_11151 ?auto_11144 ) ( LIFTING ?auto_11145 ?auto_11137 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11138 ?auto_11139 ?auto_11140 )
      ( MAKE-3CRATE-VERIFY ?auto_11137 ?auto_11138 ?auto_11139 ?auto_11140 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11154 - SURFACE
      ?auto_11155 - SURFACE
      ?auto_11156 - SURFACE
      ?auto_11157 - SURFACE
      ?auto_11158 - SURFACE
    )
    :vars
    (
      ?auto_11159 - HOIST
      ?auto_11164 - PLACE
      ?auto_11162 - PLACE
      ?auto_11163 - HOIST
      ?auto_11167 - SURFACE
      ?auto_11166 - PLACE
      ?auto_11165 - HOIST
      ?auto_11160 - SURFACE
      ?auto_11169 - PLACE
      ?auto_11161 - HOIST
      ?auto_11170 - SURFACE
      ?auto_11168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11159 ?auto_11164 ) ( IS-CRATE ?auto_11158 ) ( not ( = ?auto_11157 ?auto_11158 ) ) ( not ( = ?auto_11156 ?auto_11157 ) ) ( not ( = ?auto_11156 ?auto_11158 ) ) ( not ( = ?auto_11162 ?auto_11164 ) ) ( HOIST-AT ?auto_11163 ?auto_11162 ) ( not ( = ?auto_11159 ?auto_11163 ) ) ( SURFACE-AT ?auto_11158 ?auto_11162 ) ( ON ?auto_11158 ?auto_11167 ) ( CLEAR ?auto_11158 ) ( not ( = ?auto_11157 ?auto_11167 ) ) ( not ( = ?auto_11158 ?auto_11167 ) ) ( not ( = ?auto_11156 ?auto_11167 ) ) ( IS-CRATE ?auto_11157 ) ( not ( = ?auto_11166 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11166 ) ) ( HOIST-AT ?auto_11165 ?auto_11166 ) ( not ( = ?auto_11159 ?auto_11165 ) ) ( not ( = ?auto_11163 ?auto_11165 ) ) ( AVAILABLE ?auto_11165 ) ( SURFACE-AT ?auto_11157 ?auto_11166 ) ( ON ?auto_11157 ?auto_11160 ) ( CLEAR ?auto_11157 ) ( not ( = ?auto_11157 ?auto_11160 ) ) ( not ( = ?auto_11158 ?auto_11160 ) ) ( not ( = ?auto_11156 ?auto_11160 ) ) ( not ( = ?auto_11167 ?auto_11160 ) ) ( IS-CRATE ?auto_11156 ) ( not ( = ?auto_11155 ?auto_11156 ) ) ( not ( = ?auto_11157 ?auto_11155 ) ) ( not ( = ?auto_11158 ?auto_11155 ) ) ( not ( = ?auto_11167 ?auto_11155 ) ) ( not ( = ?auto_11160 ?auto_11155 ) ) ( not ( = ?auto_11169 ?auto_11164 ) ) ( not ( = ?auto_11162 ?auto_11169 ) ) ( not ( = ?auto_11166 ?auto_11169 ) ) ( HOIST-AT ?auto_11161 ?auto_11169 ) ( not ( = ?auto_11159 ?auto_11161 ) ) ( not ( = ?auto_11163 ?auto_11161 ) ) ( not ( = ?auto_11165 ?auto_11161 ) ) ( AVAILABLE ?auto_11161 ) ( SURFACE-AT ?auto_11156 ?auto_11169 ) ( ON ?auto_11156 ?auto_11170 ) ( CLEAR ?auto_11156 ) ( not ( = ?auto_11157 ?auto_11170 ) ) ( not ( = ?auto_11158 ?auto_11170 ) ) ( not ( = ?auto_11156 ?auto_11170 ) ) ( not ( = ?auto_11167 ?auto_11170 ) ) ( not ( = ?auto_11160 ?auto_11170 ) ) ( not ( = ?auto_11155 ?auto_11170 ) ) ( SURFACE-AT ?auto_11154 ?auto_11164 ) ( CLEAR ?auto_11154 ) ( IS-CRATE ?auto_11155 ) ( not ( = ?auto_11154 ?auto_11155 ) ) ( not ( = ?auto_11157 ?auto_11154 ) ) ( not ( = ?auto_11158 ?auto_11154 ) ) ( not ( = ?auto_11156 ?auto_11154 ) ) ( not ( = ?auto_11167 ?auto_11154 ) ) ( not ( = ?auto_11160 ?auto_11154 ) ) ( not ( = ?auto_11170 ?auto_11154 ) ) ( AVAILABLE ?auto_11159 ) ( TRUCK-AT ?auto_11168 ?auto_11162 ) ( LIFTING ?auto_11163 ?auto_11155 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11156 ?auto_11157 ?auto_11158 )
      ( MAKE-4CRATE-VERIFY ?auto_11154 ?auto_11155 ?auto_11156 ?auto_11157 ?auto_11158 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11171 - SURFACE
      ?auto_11172 - SURFACE
    )
    :vars
    (
      ?auto_11173 - HOIST
      ?auto_11178 - PLACE
      ?auto_11186 - SURFACE
      ?auto_11176 - PLACE
      ?auto_11177 - HOIST
      ?auto_11183 - SURFACE
      ?auto_11182 - PLACE
      ?auto_11180 - HOIST
      ?auto_11174 - SURFACE
      ?auto_11181 - SURFACE
      ?auto_11185 - PLACE
      ?auto_11175 - HOIST
      ?auto_11187 - SURFACE
      ?auto_11179 - SURFACE
      ?auto_11184 - TRUCK
      ?auto_11188 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11173 ?auto_11178 ) ( IS-CRATE ?auto_11172 ) ( not ( = ?auto_11171 ?auto_11172 ) ) ( not ( = ?auto_11186 ?auto_11171 ) ) ( not ( = ?auto_11186 ?auto_11172 ) ) ( not ( = ?auto_11176 ?auto_11178 ) ) ( HOIST-AT ?auto_11177 ?auto_11176 ) ( not ( = ?auto_11173 ?auto_11177 ) ) ( SURFACE-AT ?auto_11172 ?auto_11176 ) ( ON ?auto_11172 ?auto_11183 ) ( CLEAR ?auto_11172 ) ( not ( = ?auto_11171 ?auto_11183 ) ) ( not ( = ?auto_11172 ?auto_11183 ) ) ( not ( = ?auto_11186 ?auto_11183 ) ) ( IS-CRATE ?auto_11171 ) ( not ( = ?auto_11182 ?auto_11178 ) ) ( not ( = ?auto_11176 ?auto_11182 ) ) ( HOIST-AT ?auto_11180 ?auto_11182 ) ( not ( = ?auto_11173 ?auto_11180 ) ) ( not ( = ?auto_11177 ?auto_11180 ) ) ( AVAILABLE ?auto_11180 ) ( SURFACE-AT ?auto_11171 ?auto_11182 ) ( ON ?auto_11171 ?auto_11174 ) ( CLEAR ?auto_11171 ) ( not ( = ?auto_11171 ?auto_11174 ) ) ( not ( = ?auto_11172 ?auto_11174 ) ) ( not ( = ?auto_11186 ?auto_11174 ) ) ( not ( = ?auto_11183 ?auto_11174 ) ) ( IS-CRATE ?auto_11186 ) ( not ( = ?auto_11181 ?auto_11186 ) ) ( not ( = ?auto_11171 ?auto_11181 ) ) ( not ( = ?auto_11172 ?auto_11181 ) ) ( not ( = ?auto_11183 ?auto_11181 ) ) ( not ( = ?auto_11174 ?auto_11181 ) ) ( not ( = ?auto_11185 ?auto_11178 ) ) ( not ( = ?auto_11176 ?auto_11185 ) ) ( not ( = ?auto_11182 ?auto_11185 ) ) ( HOIST-AT ?auto_11175 ?auto_11185 ) ( not ( = ?auto_11173 ?auto_11175 ) ) ( not ( = ?auto_11177 ?auto_11175 ) ) ( not ( = ?auto_11180 ?auto_11175 ) ) ( AVAILABLE ?auto_11175 ) ( SURFACE-AT ?auto_11186 ?auto_11185 ) ( ON ?auto_11186 ?auto_11187 ) ( CLEAR ?auto_11186 ) ( not ( = ?auto_11171 ?auto_11187 ) ) ( not ( = ?auto_11172 ?auto_11187 ) ) ( not ( = ?auto_11186 ?auto_11187 ) ) ( not ( = ?auto_11183 ?auto_11187 ) ) ( not ( = ?auto_11174 ?auto_11187 ) ) ( not ( = ?auto_11181 ?auto_11187 ) ) ( SURFACE-AT ?auto_11179 ?auto_11178 ) ( CLEAR ?auto_11179 ) ( IS-CRATE ?auto_11181 ) ( not ( = ?auto_11179 ?auto_11181 ) ) ( not ( = ?auto_11171 ?auto_11179 ) ) ( not ( = ?auto_11172 ?auto_11179 ) ) ( not ( = ?auto_11186 ?auto_11179 ) ) ( not ( = ?auto_11183 ?auto_11179 ) ) ( not ( = ?auto_11174 ?auto_11179 ) ) ( not ( = ?auto_11187 ?auto_11179 ) ) ( AVAILABLE ?auto_11173 ) ( TRUCK-AT ?auto_11184 ?auto_11176 ) ( AVAILABLE ?auto_11177 ) ( SURFACE-AT ?auto_11181 ?auto_11176 ) ( ON ?auto_11181 ?auto_11188 ) ( CLEAR ?auto_11181 ) ( not ( = ?auto_11171 ?auto_11188 ) ) ( not ( = ?auto_11172 ?auto_11188 ) ) ( not ( = ?auto_11186 ?auto_11188 ) ) ( not ( = ?auto_11183 ?auto_11188 ) ) ( not ( = ?auto_11174 ?auto_11188 ) ) ( not ( = ?auto_11181 ?auto_11188 ) ) ( not ( = ?auto_11187 ?auto_11188 ) ) ( not ( = ?auto_11179 ?auto_11188 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11177 ?auto_11181 ?auto_11188 ?auto_11176 )
      ( MAKE-2CRATE ?auto_11186 ?auto_11171 ?auto_11172 )
      ( MAKE-1CRATE-VERIFY ?auto_11171 ?auto_11172 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11189 - SURFACE
      ?auto_11190 - SURFACE
      ?auto_11191 - SURFACE
    )
    :vars
    (
      ?auto_11206 - HOIST
      ?auto_11199 - PLACE
      ?auto_11201 - PLACE
      ?auto_11202 - HOIST
      ?auto_11193 - SURFACE
      ?auto_11196 - PLACE
      ?auto_11192 - HOIST
      ?auto_11195 - SURFACE
      ?auto_11194 - SURFACE
      ?auto_11198 - PLACE
      ?auto_11205 - HOIST
      ?auto_11203 - SURFACE
      ?auto_11197 - SURFACE
      ?auto_11200 - TRUCK
      ?auto_11204 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11206 ?auto_11199 ) ( IS-CRATE ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11191 ) ) ( not ( = ?auto_11189 ?auto_11190 ) ) ( not ( = ?auto_11189 ?auto_11191 ) ) ( not ( = ?auto_11201 ?auto_11199 ) ) ( HOIST-AT ?auto_11202 ?auto_11201 ) ( not ( = ?auto_11206 ?auto_11202 ) ) ( SURFACE-AT ?auto_11191 ?auto_11201 ) ( ON ?auto_11191 ?auto_11193 ) ( CLEAR ?auto_11191 ) ( not ( = ?auto_11190 ?auto_11193 ) ) ( not ( = ?auto_11191 ?auto_11193 ) ) ( not ( = ?auto_11189 ?auto_11193 ) ) ( IS-CRATE ?auto_11190 ) ( not ( = ?auto_11196 ?auto_11199 ) ) ( not ( = ?auto_11201 ?auto_11196 ) ) ( HOIST-AT ?auto_11192 ?auto_11196 ) ( not ( = ?auto_11206 ?auto_11192 ) ) ( not ( = ?auto_11202 ?auto_11192 ) ) ( AVAILABLE ?auto_11192 ) ( SURFACE-AT ?auto_11190 ?auto_11196 ) ( ON ?auto_11190 ?auto_11195 ) ( CLEAR ?auto_11190 ) ( not ( = ?auto_11190 ?auto_11195 ) ) ( not ( = ?auto_11191 ?auto_11195 ) ) ( not ( = ?auto_11189 ?auto_11195 ) ) ( not ( = ?auto_11193 ?auto_11195 ) ) ( IS-CRATE ?auto_11189 ) ( not ( = ?auto_11194 ?auto_11189 ) ) ( not ( = ?auto_11190 ?auto_11194 ) ) ( not ( = ?auto_11191 ?auto_11194 ) ) ( not ( = ?auto_11193 ?auto_11194 ) ) ( not ( = ?auto_11195 ?auto_11194 ) ) ( not ( = ?auto_11198 ?auto_11199 ) ) ( not ( = ?auto_11201 ?auto_11198 ) ) ( not ( = ?auto_11196 ?auto_11198 ) ) ( HOIST-AT ?auto_11205 ?auto_11198 ) ( not ( = ?auto_11206 ?auto_11205 ) ) ( not ( = ?auto_11202 ?auto_11205 ) ) ( not ( = ?auto_11192 ?auto_11205 ) ) ( AVAILABLE ?auto_11205 ) ( SURFACE-AT ?auto_11189 ?auto_11198 ) ( ON ?auto_11189 ?auto_11203 ) ( CLEAR ?auto_11189 ) ( not ( = ?auto_11190 ?auto_11203 ) ) ( not ( = ?auto_11191 ?auto_11203 ) ) ( not ( = ?auto_11189 ?auto_11203 ) ) ( not ( = ?auto_11193 ?auto_11203 ) ) ( not ( = ?auto_11195 ?auto_11203 ) ) ( not ( = ?auto_11194 ?auto_11203 ) ) ( SURFACE-AT ?auto_11197 ?auto_11199 ) ( CLEAR ?auto_11197 ) ( IS-CRATE ?auto_11194 ) ( not ( = ?auto_11197 ?auto_11194 ) ) ( not ( = ?auto_11190 ?auto_11197 ) ) ( not ( = ?auto_11191 ?auto_11197 ) ) ( not ( = ?auto_11189 ?auto_11197 ) ) ( not ( = ?auto_11193 ?auto_11197 ) ) ( not ( = ?auto_11195 ?auto_11197 ) ) ( not ( = ?auto_11203 ?auto_11197 ) ) ( AVAILABLE ?auto_11206 ) ( TRUCK-AT ?auto_11200 ?auto_11201 ) ( AVAILABLE ?auto_11202 ) ( SURFACE-AT ?auto_11194 ?auto_11201 ) ( ON ?auto_11194 ?auto_11204 ) ( CLEAR ?auto_11194 ) ( not ( = ?auto_11190 ?auto_11204 ) ) ( not ( = ?auto_11191 ?auto_11204 ) ) ( not ( = ?auto_11189 ?auto_11204 ) ) ( not ( = ?auto_11193 ?auto_11204 ) ) ( not ( = ?auto_11195 ?auto_11204 ) ) ( not ( = ?auto_11194 ?auto_11204 ) ) ( not ( = ?auto_11203 ?auto_11204 ) ) ( not ( = ?auto_11197 ?auto_11204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11190 ?auto_11191 )
      ( MAKE-2CRATE-VERIFY ?auto_11189 ?auto_11190 ?auto_11191 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11207 - SURFACE
      ?auto_11208 - SURFACE
      ?auto_11209 - SURFACE
      ?auto_11210 - SURFACE
    )
    :vars
    (
      ?auto_11220 - HOIST
      ?auto_11223 - PLACE
      ?auto_11222 - PLACE
      ?auto_11212 - HOIST
      ?auto_11214 - SURFACE
      ?auto_11211 - PLACE
      ?auto_11213 - HOIST
      ?auto_11218 - SURFACE
      ?auto_11224 - PLACE
      ?auto_11217 - HOIST
      ?auto_11219 - SURFACE
      ?auto_11215 - SURFACE
      ?auto_11221 - TRUCK
      ?auto_11216 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11220 ?auto_11223 ) ( IS-CRATE ?auto_11210 ) ( not ( = ?auto_11209 ?auto_11210 ) ) ( not ( = ?auto_11208 ?auto_11209 ) ) ( not ( = ?auto_11208 ?auto_11210 ) ) ( not ( = ?auto_11222 ?auto_11223 ) ) ( HOIST-AT ?auto_11212 ?auto_11222 ) ( not ( = ?auto_11220 ?auto_11212 ) ) ( SURFACE-AT ?auto_11210 ?auto_11222 ) ( ON ?auto_11210 ?auto_11214 ) ( CLEAR ?auto_11210 ) ( not ( = ?auto_11209 ?auto_11214 ) ) ( not ( = ?auto_11210 ?auto_11214 ) ) ( not ( = ?auto_11208 ?auto_11214 ) ) ( IS-CRATE ?auto_11209 ) ( not ( = ?auto_11211 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11211 ) ) ( HOIST-AT ?auto_11213 ?auto_11211 ) ( not ( = ?auto_11220 ?auto_11213 ) ) ( not ( = ?auto_11212 ?auto_11213 ) ) ( AVAILABLE ?auto_11213 ) ( SURFACE-AT ?auto_11209 ?auto_11211 ) ( ON ?auto_11209 ?auto_11218 ) ( CLEAR ?auto_11209 ) ( not ( = ?auto_11209 ?auto_11218 ) ) ( not ( = ?auto_11210 ?auto_11218 ) ) ( not ( = ?auto_11208 ?auto_11218 ) ) ( not ( = ?auto_11214 ?auto_11218 ) ) ( IS-CRATE ?auto_11208 ) ( not ( = ?auto_11207 ?auto_11208 ) ) ( not ( = ?auto_11209 ?auto_11207 ) ) ( not ( = ?auto_11210 ?auto_11207 ) ) ( not ( = ?auto_11214 ?auto_11207 ) ) ( not ( = ?auto_11218 ?auto_11207 ) ) ( not ( = ?auto_11224 ?auto_11223 ) ) ( not ( = ?auto_11222 ?auto_11224 ) ) ( not ( = ?auto_11211 ?auto_11224 ) ) ( HOIST-AT ?auto_11217 ?auto_11224 ) ( not ( = ?auto_11220 ?auto_11217 ) ) ( not ( = ?auto_11212 ?auto_11217 ) ) ( not ( = ?auto_11213 ?auto_11217 ) ) ( AVAILABLE ?auto_11217 ) ( SURFACE-AT ?auto_11208 ?auto_11224 ) ( ON ?auto_11208 ?auto_11219 ) ( CLEAR ?auto_11208 ) ( not ( = ?auto_11209 ?auto_11219 ) ) ( not ( = ?auto_11210 ?auto_11219 ) ) ( not ( = ?auto_11208 ?auto_11219 ) ) ( not ( = ?auto_11214 ?auto_11219 ) ) ( not ( = ?auto_11218 ?auto_11219 ) ) ( not ( = ?auto_11207 ?auto_11219 ) ) ( SURFACE-AT ?auto_11215 ?auto_11223 ) ( CLEAR ?auto_11215 ) ( IS-CRATE ?auto_11207 ) ( not ( = ?auto_11215 ?auto_11207 ) ) ( not ( = ?auto_11209 ?auto_11215 ) ) ( not ( = ?auto_11210 ?auto_11215 ) ) ( not ( = ?auto_11208 ?auto_11215 ) ) ( not ( = ?auto_11214 ?auto_11215 ) ) ( not ( = ?auto_11218 ?auto_11215 ) ) ( not ( = ?auto_11219 ?auto_11215 ) ) ( AVAILABLE ?auto_11220 ) ( TRUCK-AT ?auto_11221 ?auto_11222 ) ( AVAILABLE ?auto_11212 ) ( SURFACE-AT ?auto_11207 ?auto_11222 ) ( ON ?auto_11207 ?auto_11216 ) ( CLEAR ?auto_11207 ) ( not ( = ?auto_11209 ?auto_11216 ) ) ( not ( = ?auto_11210 ?auto_11216 ) ) ( not ( = ?auto_11208 ?auto_11216 ) ) ( not ( = ?auto_11214 ?auto_11216 ) ) ( not ( = ?auto_11218 ?auto_11216 ) ) ( not ( = ?auto_11207 ?auto_11216 ) ) ( not ( = ?auto_11219 ?auto_11216 ) ) ( not ( = ?auto_11215 ?auto_11216 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11208 ?auto_11209 ?auto_11210 )
      ( MAKE-3CRATE-VERIFY ?auto_11207 ?auto_11208 ?auto_11209 ?auto_11210 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11225 - SURFACE
      ?auto_11226 - SURFACE
      ?auto_11227 - SURFACE
      ?auto_11228 - SURFACE
      ?auto_11229 - SURFACE
    )
    :vars
    (
      ?auto_11238 - HOIST
      ?auto_11241 - PLACE
      ?auto_11240 - PLACE
      ?auto_11231 - HOIST
      ?auto_11233 - SURFACE
      ?auto_11230 - PLACE
      ?auto_11232 - HOIST
      ?auto_11236 - SURFACE
      ?auto_11242 - PLACE
      ?auto_11235 - HOIST
      ?auto_11237 - SURFACE
      ?auto_11239 - TRUCK
      ?auto_11234 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11238 ?auto_11241 ) ( IS-CRATE ?auto_11229 ) ( not ( = ?auto_11228 ?auto_11229 ) ) ( not ( = ?auto_11227 ?auto_11228 ) ) ( not ( = ?auto_11227 ?auto_11229 ) ) ( not ( = ?auto_11240 ?auto_11241 ) ) ( HOIST-AT ?auto_11231 ?auto_11240 ) ( not ( = ?auto_11238 ?auto_11231 ) ) ( SURFACE-AT ?auto_11229 ?auto_11240 ) ( ON ?auto_11229 ?auto_11233 ) ( CLEAR ?auto_11229 ) ( not ( = ?auto_11228 ?auto_11233 ) ) ( not ( = ?auto_11229 ?auto_11233 ) ) ( not ( = ?auto_11227 ?auto_11233 ) ) ( IS-CRATE ?auto_11228 ) ( not ( = ?auto_11230 ?auto_11241 ) ) ( not ( = ?auto_11240 ?auto_11230 ) ) ( HOIST-AT ?auto_11232 ?auto_11230 ) ( not ( = ?auto_11238 ?auto_11232 ) ) ( not ( = ?auto_11231 ?auto_11232 ) ) ( AVAILABLE ?auto_11232 ) ( SURFACE-AT ?auto_11228 ?auto_11230 ) ( ON ?auto_11228 ?auto_11236 ) ( CLEAR ?auto_11228 ) ( not ( = ?auto_11228 ?auto_11236 ) ) ( not ( = ?auto_11229 ?auto_11236 ) ) ( not ( = ?auto_11227 ?auto_11236 ) ) ( not ( = ?auto_11233 ?auto_11236 ) ) ( IS-CRATE ?auto_11227 ) ( not ( = ?auto_11226 ?auto_11227 ) ) ( not ( = ?auto_11228 ?auto_11226 ) ) ( not ( = ?auto_11229 ?auto_11226 ) ) ( not ( = ?auto_11233 ?auto_11226 ) ) ( not ( = ?auto_11236 ?auto_11226 ) ) ( not ( = ?auto_11242 ?auto_11241 ) ) ( not ( = ?auto_11240 ?auto_11242 ) ) ( not ( = ?auto_11230 ?auto_11242 ) ) ( HOIST-AT ?auto_11235 ?auto_11242 ) ( not ( = ?auto_11238 ?auto_11235 ) ) ( not ( = ?auto_11231 ?auto_11235 ) ) ( not ( = ?auto_11232 ?auto_11235 ) ) ( AVAILABLE ?auto_11235 ) ( SURFACE-AT ?auto_11227 ?auto_11242 ) ( ON ?auto_11227 ?auto_11237 ) ( CLEAR ?auto_11227 ) ( not ( = ?auto_11228 ?auto_11237 ) ) ( not ( = ?auto_11229 ?auto_11237 ) ) ( not ( = ?auto_11227 ?auto_11237 ) ) ( not ( = ?auto_11233 ?auto_11237 ) ) ( not ( = ?auto_11236 ?auto_11237 ) ) ( not ( = ?auto_11226 ?auto_11237 ) ) ( SURFACE-AT ?auto_11225 ?auto_11241 ) ( CLEAR ?auto_11225 ) ( IS-CRATE ?auto_11226 ) ( not ( = ?auto_11225 ?auto_11226 ) ) ( not ( = ?auto_11228 ?auto_11225 ) ) ( not ( = ?auto_11229 ?auto_11225 ) ) ( not ( = ?auto_11227 ?auto_11225 ) ) ( not ( = ?auto_11233 ?auto_11225 ) ) ( not ( = ?auto_11236 ?auto_11225 ) ) ( not ( = ?auto_11237 ?auto_11225 ) ) ( AVAILABLE ?auto_11238 ) ( TRUCK-AT ?auto_11239 ?auto_11240 ) ( AVAILABLE ?auto_11231 ) ( SURFACE-AT ?auto_11226 ?auto_11240 ) ( ON ?auto_11226 ?auto_11234 ) ( CLEAR ?auto_11226 ) ( not ( = ?auto_11228 ?auto_11234 ) ) ( not ( = ?auto_11229 ?auto_11234 ) ) ( not ( = ?auto_11227 ?auto_11234 ) ) ( not ( = ?auto_11233 ?auto_11234 ) ) ( not ( = ?auto_11236 ?auto_11234 ) ) ( not ( = ?auto_11226 ?auto_11234 ) ) ( not ( = ?auto_11237 ?auto_11234 ) ) ( not ( = ?auto_11225 ?auto_11234 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11227 ?auto_11228 ?auto_11229 )
      ( MAKE-4CRATE-VERIFY ?auto_11225 ?auto_11226 ?auto_11227 ?auto_11228 ?auto_11229 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11243 - SURFACE
      ?auto_11244 - SURFACE
    )
    :vars
    (
      ?auto_11255 - HOIST
      ?auto_11258 - PLACE
      ?auto_11260 - SURFACE
      ?auto_11257 - PLACE
      ?auto_11246 - HOIST
      ?auto_11248 - SURFACE
      ?auto_11245 - PLACE
      ?auto_11247 - HOIST
      ?auto_11252 - SURFACE
      ?auto_11254 - SURFACE
      ?auto_11259 - PLACE
      ?auto_11251 - HOIST
      ?auto_11253 - SURFACE
      ?auto_11249 - SURFACE
      ?auto_11250 - SURFACE
      ?auto_11256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11255 ?auto_11258 ) ( IS-CRATE ?auto_11244 ) ( not ( = ?auto_11243 ?auto_11244 ) ) ( not ( = ?auto_11260 ?auto_11243 ) ) ( not ( = ?auto_11260 ?auto_11244 ) ) ( not ( = ?auto_11257 ?auto_11258 ) ) ( HOIST-AT ?auto_11246 ?auto_11257 ) ( not ( = ?auto_11255 ?auto_11246 ) ) ( SURFACE-AT ?auto_11244 ?auto_11257 ) ( ON ?auto_11244 ?auto_11248 ) ( CLEAR ?auto_11244 ) ( not ( = ?auto_11243 ?auto_11248 ) ) ( not ( = ?auto_11244 ?auto_11248 ) ) ( not ( = ?auto_11260 ?auto_11248 ) ) ( IS-CRATE ?auto_11243 ) ( not ( = ?auto_11245 ?auto_11258 ) ) ( not ( = ?auto_11257 ?auto_11245 ) ) ( HOIST-AT ?auto_11247 ?auto_11245 ) ( not ( = ?auto_11255 ?auto_11247 ) ) ( not ( = ?auto_11246 ?auto_11247 ) ) ( AVAILABLE ?auto_11247 ) ( SURFACE-AT ?auto_11243 ?auto_11245 ) ( ON ?auto_11243 ?auto_11252 ) ( CLEAR ?auto_11243 ) ( not ( = ?auto_11243 ?auto_11252 ) ) ( not ( = ?auto_11244 ?auto_11252 ) ) ( not ( = ?auto_11260 ?auto_11252 ) ) ( not ( = ?auto_11248 ?auto_11252 ) ) ( IS-CRATE ?auto_11260 ) ( not ( = ?auto_11254 ?auto_11260 ) ) ( not ( = ?auto_11243 ?auto_11254 ) ) ( not ( = ?auto_11244 ?auto_11254 ) ) ( not ( = ?auto_11248 ?auto_11254 ) ) ( not ( = ?auto_11252 ?auto_11254 ) ) ( not ( = ?auto_11259 ?auto_11258 ) ) ( not ( = ?auto_11257 ?auto_11259 ) ) ( not ( = ?auto_11245 ?auto_11259 ) ) ( HOIST-AT ?auto_11251 ?auto_11259 ) ( not ( = ?auto_11255 ?auto_11251 ) ) ( not ( = ?auto_11246 ?auto_11251 ) ) ( not ( = ?auto_11247 ?auto_11251 ) ) ( AVAILABLE ?auto_11251 ) ( SURFACE-AT ?auto_11260 ?auto_11259 ) ( ON ?auto_11260 ?auto_11253 ) ( CLEAR ?auto_11260 ) ( not ( = ?auto_11243 ?auto_11253 ) ) ( not ( = ?auto_11244 ?auto_11253 ) ) ( not ( = ?auto_11260 ?auto_11253 ) ) ( not ( = ?auto_11248 ?auto_11253 ) ) ( not ( = ?auto_11252 ?auto_11253 ) ) ( not ( = ?auto_11254 ?auto_11253 ) ) ( SURFACE-AT ?auto_11249 ?auto_11258 ) ( CLEAR ?auto_11249 ) ( IS-CRATE ?auto_11254 ) ( not ( = ?auto_11249 ?auto_11254 ) ) ( not ( = ?auto_11243 ?auto_11249 ) ) ( not ( = ?auto_11244 ?auto_11249 ) ) ( not ( = ?auto_11260 ?auto_11249 ) ) ( not ( = ?auto_11248 ?auto_11249 ) ) ( not ( = ?auto_11252 ?auto_11249 ) ) ( not ( = ?auto_11253 ?auto_11249 ) ) ( AVAILABLE ?auto_11255 ) ( AVAILABLE ?auto_11246 ) ( SURFACE-AT ?auto_11254 ?auto_11257 ) ( ON ?auto_11254 ?auto_11250 ) ( CLEAR ?auto_11254 ) ( not ( = ?auto_11243 ?auto_11250 ) ) ( not ( = ?auto_11244 ?auto_11250 ) ) ( not ( = ?auto_11260 ?auto_11250 ) ) ( not ( = ?auto_11248 ?auto_11250 ) ) ( not ( = ?auto_11252 ?auto_11250 ) ) ( not ( = ?auto_11254 ?auto_11250 ) ) ( not ( = ?auto_11253 ?auto_11250 ) ) ( not ( = ?auto_11249 ?auto_11250 ) ) ( TRUCK-AT ?auto_11256 ?auto_11258 ) )
    :subtasks
    ( ( !DRIVE ?auto_11256 ?auto_11258 ?auto_11257 )
      ( MAKE-2CRATE ?auto_11260 ?auto_11243 ?auto_11244 )
      ( MAKE-1CRATE-VERIFY ?auto_11243 ?auto_11244 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11261 - SURFACE
      ?auto_11262 - SURFACE
      ?auto_11263 - SURFACE
    )
    :vars
    (
      ?auto_11278 - HOIST
      ?auto_11269 - PLACE
      ?auto_11275 - PLACE
      ?auto_11276 - HOIST
      ?auto_11264 - SURFACE
      ?auto_11270 - PLACE
      ?auto_11272 - HOIST
      ?auto_11274 - SURFACE
      ?auto_11273 - SURFACE
      ?auto_11267 - PLACE
      ?auto_11268 - HOIST
      ?auto_11266 - SURFACE
      ?auto_11265 - SURFACE
      ?auto_11277 - SURFACE
      ?auto_11271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11278 ?auto_11269 ) ( IS-CRATE ?auto_11263 ) ( not ( = ?auto_11262 ?auto_11263 ) ) ( not ( = ?auto_11261 ?auto_11262 ) ) ( not ( = ?auto_11261 ?auto_11263 ) ) ( not ( = ?auto_11275 ?auto_11269 ) ) ( HOIST-AT ?auto_11276 ?auto_11275 ) ( not ( = ?auto_11278 ?auto_11276 ) ) ( SURFACE-AT ?auto_11263 ?auto_11275 ) ( ON ?auto_11263 ?auto_11264 ) ( CLEAR ?auto_11263 ) ( not ( = ?auto_11262 ?auto_11264 ) ) ( not ( = ?auto_11263 ?auto_11264 ) ) ( not ( = ?auto_11261 ?auto_11264 ) ) ( IS-CRATE ?auto_11262 ) ( not ( = ?auto_11270 ?auto_11269 ) ) ( not ( = ?auto_11275 ?auto_11270 ) ) ( HOIST-AT ?auto_11272 ?auto_11270 ) ( not ( = ?auto_11278 ?auto_11272 ) ) ( not ( = ?auto_11276 ?auto_11272 ) ) ( AVAILABLE ?auto_11272 ) ( SURFACE-AT ?auto_11262 ?auto_11270 ) ( ON ?auto_11262 ?auto_11274 ) ( CLEAR ?auto_11262 ) ( not ( = ?auto_11262 ?auto_11274 ) ) ( not ( = ?auto_11263 ?auto_11274 ) ) ( not ( = ?auto_11261 ?auto_11274 ) ) ( not ( = ?auto_11264 ?auto_11274 ) ) ( IS-CRATE ?auto_11261 ) ( not ( = ?auto_11273 ?auto_11261 ) ) ( not ( = ?auto_11262 ?auto_11273 ) ) ( not ( = ?auto_11263 ?auto_11273 ) ) ( not ( = ?auto_11264 ?auto_11273 ) ) ( not ( = ?auto_11274 ?auto_11273 ) ) ( not ( = ?auto_11267 ?auto_11269 ) ) ( not ( = ?auto_11275 ?auto_11267 ) ) ( not ( = ?auto_11270 ?auto_11267 ) ) ( HOIST-AT ?auto_11268 ?auto_11267 ) ( not ( = ?auto_11278 ?auto_11268 ) ) ( not ( = ?auto_11276 ?auto_11268 ) ) ( not ( = ?auto_11272 ?auto_11268 ) ) ( AVAILABLE ?auto_11268 ) ( SURFACE-AT ?auto_11261 ?auto_11267 ) ( ON ?auto_11261 ?auto_11266 ) ( CLEAR ?auto_11261 ) ( not ( = ?auto_11262 ?auto_11266 ) ) ( not ( = ?auto_11263 ?auto_11266 ) ) ( not ( = ?auto_11261 ?auto_11266 ) ) ( not ( = ?auto_11264 ?auto_11266 ) ) ( not ( = ?auto_11274 ?auto_11266 ) ) ( not ( = ?auto_11273 ?auto_11266 ) ) ( SURFACE-AT ?auto_11265 ?auto_11269 ) ( CLEAR ?auto_11265 ) ( IS-CRATE ?auto_11273 ) ( not ( = ?auto_11265 ?auto_11273 ) ) ( not ( = ?auto_11262 ?auto_11265 ) ) ( not ( = ?auto_11263 ?auto_11265 ) ) ( not ( = ?auto_11261 ?auto_11265 ) ) ( not ( = ?auto_11264 ?auto_11265 ) ) ( not ( = ?auto_11274 ?auto_11265 ) ) ( not ( = ?auto_11266 ?auto_11265 ) ) ( AVAILABLE ?auto_11278 ) ( AVAILABLE ?auto_11276 ) ( SURFACE-AT ?auto_11273 ?auto_11275 ) ( ON ?auto_11273 ?auto_11277 ) ( CLEAR ?auto_11273 ) ( not ( = ?auto_11262 ?auto_11277 ) ) ( not ( = ?auto_11263 ?auto_11277 ) ) ( not ( = ?auto_11261 ?auto_11277 ) ) ( not ( = ?auto_11264 ?auto_11277 ) ) ( not ( = ?auto_11274 ?auto_11277 ) ) ( not ( = ?auto_11273 ?auto_11277 ) ) ( not ( = ?auto_11266 ?auto_11277 ) ) ( not ( = ?auto_11265 ?auto_11277 ) ) ( TRUCK-AT ?auto_11271 ?auto_11269 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11262 ?auto_11263 )
      ( MAKE-2CRATE-VERIFY ?auto_11261 ?auto_11262 ?auto_11263 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11279 - SURFACE
      ?auto_11280 - SURFACE
      ?auto_11281 - SURFACE
      ?auto_11282 - SURFACE
    )
    :vars
    (
      ?auto_11288 - HOIST
      ?auto_11287 - PLACE
      ?auto_11293 - PLACE
      ?auto_11290 - HOIST
      ?auto_11289 - SURFACE
      ?auto_11296 - PLACE
      ?auto_11285 - HOIST
      ?auto_11291 - SURFACE
      ?auto_11286 - PLACE
      ?auto_11284 - HOIST
      ?auto_11283 - SURFACE
      ?auto_11294 - SURFACE
      ?auto_11292 - SURFACE
      ?auto_11295 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11288 ?auto_11287 ) ( IS-CRATE ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11282 ) ) ( not ( = ?auto_11280 ?auto_11281 ) ) ( not ( = ?auto_11280 ?auto_11282 ) ) ( not ( = ?auto_11293 ?auto_11287 ) ) ( HOIST-AT ?auto_11290 ?auto_11293 ) ( not ( = ?auto_11288 ?auto_11290 ) ) ( SURFACE-AT ?auto_11282 ?auto_11293 ) ( ON ?auto_11282 ?auto_11289 ) ( CLEAR ?auto_11282 ) ( not ( = ?auto_11281 ?auto_11289 ) ) ( not ( = ?auto_11282 ?auto_11289 ) ) ( not ( = ?auto_11280 ?auto_11289 ) ) ( IS-CRATE ?auto_11281 ) ( not ( = ?auto_11296 ?auto_11287 ) ) ( not ( = ?auto_11293 ?auto_11296 ) ) ( HOIST-AT ?auto_11285 ?auto_11296 ) ( not ( = ?auto_11288 ?auto_11285 ) ) ( not ( = ?auto_11290 ?auto_11285 ) ) ( AVAILABLE ?auto_11285 ) ( SURFACE-AT ?auto_11281 ?auto_11296 ) ( ON ?auto_11281 ?auto_11291 ) ( CLEAR ?auto_11281 ) ( not ( = ?auto_11281 ?auto_11291 ) ) ( not ( = ?auto_11282 ?auto_11291 ) ) ( not ( = ?auto_11280 ?auto_11291 ) ) ( not ( = ?auto_11289 ?auto_11291 ) ) ( IS-CRATE ?auto_11280 ) ( not ( = ?auto_11279 ?auto_11280 ) ) ( not ( = ?auto_11281 ?auto_11279 ) ) ( not ( = ?auto_11282 ?auto_11279 ) ) ( not ( = ?auto_11289 ?auto_11279 ) ) ( not ( = ?auto_11291 ?auto_11279 ) ) ( not ( = ?auto_11286 ?auto_11287 ) ) ( not ( = ?auto_11293 ?auto_11286 ) ) ( not ( = ?auto_11296 ?auto_11286 ) ) ( HOIST-AT ?auto_11284 ?auto_11286 ) ( not ( = ?auto_11288 ?auto_11284 ) ) ( not ( = ?auto_11290 ?auto_11284 ) ) ( not ( = ?auto_11285 ?auto_11284 ) ) ( AVAILABLE ?auto_11284 ) ( SURFACE-AT ?auto_11280 ?auto_11286 ) ( ON ?auto_11280 ?auto_11283 ) ( CLEAR ?auto_11280 ) ( not ( = ?auto_11281 ?auto_11283 ) ) ( not ( = ?auto_11282 ?auto_11283 ) ) ( not ( = ?auto_11280 ?auto_11283 ) ) ( not ( = ?auto_11289 ?auto_11283 ) ) ( not ( = ?auto_11291 ?auto_11283 ) ) ( not ( = ?auto_11279 ?auto_11283 ) ) ( SURFACE-AT ?auto_11294 ?auto_11287 ) ( CLEAR ?auto_11294 ) ( IS-CRATE ?auto_11279 ) ( not ( = ?auto_11294 ?auto_11279 ) ) ( not ( = ?auto_11281 ?auto_11294 ) ) ( not ( = ?auto_11282 ?auto_11294 ) ) ( not ( = ?auto_11280 ?auto_11294 ) ) ( not ( = ?auto_11289 ?auto_11294 ) ) ( not ( = ?auto_11291 ?auto_11294 ) ) ( not ( = ?auto_11283 ?auto_11294 ) ) ( AVAILABLE ?auto_11288 ) ( AVAILABLE ?auto_11290 ) ( SURFACE-AT ?auto_11279 ?auto_11293 ) ( ON ?auto_11279 ?auto_11292 ) ( CLEAR ?auto_11279 ) ( not ( = ?auto_11281 ?auto_11292 ) ) ( not ( = ?auto_11282 ?auto_11292 ) ) ( not ( = ?auto_11280 ?auto_11292 ) ) ( not ( = ?auto_11289 ?auto_11292 ) ) ( not ( = ?auto_11291 ?auto_11292 ) ) ( not ( = ?auto_11279 ?auto_11292 ) ) ( not ( = ?auto_11283 ?auto_11292 ) ) ( not ( = ?auto_11294 ?auto_11292 ) ) ( TRUCK-AT ?auto_11295 ?auto_11287 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11280 ?auto_11281 ?auto_11282 )
      ( MAKE-3CRATE-VERIFY ?auto_11279 ?auto_11280 ?auto_11281 ?auto_11282 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_11297 - SURFACE
      ?auto_11298 - SURFACE
      ?auto_11299 - SURFACE
      ?auto_11300 - SURFACE
      ?auto_11301 - SURFACE
    )
    :vars
    (
      ?auto_11307 - HOIST
      ?auto_11306 - PLACE
      ?auto_11312 - PLACE
      ?auto_11309 - HOIST
      ?auto_11308 - SURFACE
      ?auto_11314 - PLACE
      ?auto_11304 - HOIST
      ?auto_11310 - SURFACE
      ?auto_11305 - PLACE
      ?auto_11303 - HOIST
      ?auto_11302 - SURFACE
      ?auto_11311 - SURFACE
      ?auto_11313 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11307 ?auto_11306 ) ( IS-CRATE ?auto_11301 ) ( not ( = ?auto_11300 ?auto_11301 ) ) ( not ( = ?auto_11299 ?auto_11300 ) ) ( not ( = ?auto_11299 ?auto_11301 ) ) ( not ( = ?auto_11312 ?auto_11306 ) ) ( HOIST-AT ?auto_11309 ?auto_11312 ) ( not ( = ?auto_11307 ?auto_11309 ) ) ( SURFACE-AT ?auto_11301 ?auto_11312 ) ( ON ?auto_11301 ?auto_11308 ) ( CLEAR ?auto_11301 ) ( not ( = ?auto_11300 ?auto_11308 ) ) ( not ( = ?auto_11301 ?auto_11308 ) ) ( not ( = ?auto_11299 ?auto_11308 ) ) ( IS-CRATE ?auto_11300 ) ( not ( = ?auto_11314 ?auto_11306 ) ) ( not ( = ?auto_11312 ?auto_11314 ) ) ( HOIST-AT ?auto_11304 ?auto_11314 ) ( not ( = ?auto_11307 ?auto_11304 ) ) ( not ( = ?auto_11309 ?auto_11304 ) ) ( AVAILABLE ?auto_11304 ) ( SURFACE-AT ?auto_11300 ?auto_11314 ) ( ON ?auto_11300 ?auto_11310 ) ( CLEAR ?auto_11300 ) ( not ( = ?auto_11300 ?auto_11310 ) ) ( not ( = ?auto_11301 ?auto_11310 ) ) ( not ( = ?auto_11299 ?auto_11310 ) ) ( not ( = ?auto_11308 ?auto_11310 ) ) ( IS-CRATE ?auto_11299 ) ( not ( = ?auto_11298 ?auto_11299 ) ) ( not ( = ?auto_11300 ?auto_11298 ) ) ( not ( = ?auto_11301 ?auto_11298 ) ) ( not ( = ?auto_11308 ?auto_11298 ) ) ( not ( = ?auto_11310 ?auto_11298 ) ) ( not ( = ?auto_11305 ?auto_11306 ) ) ( not ( = ?auto_11312 ?auto_11305 ) ) ( not ( = ?auto_11314 ?auto_11305 ) ) ( HOIST-AT ?auto_11303 ?auto_11305 ) ( not ( = ?auto_11307 ?auto_11303 ) ) ( not ( = ?auto_11309 ?auto_11303 ) ) ( not ( = ?auto_11304 ?auto_11303 ) ) ( AVAILABLE ?auto_11303 ) ( SURFACE-AT ?auto_11299 ?auto_11305 ) ( ON ?auto_11299 ?auto_11302 ) ( CLEAR ?auto_11299 ) ( not ( = ?auto_11300 ?auto_11302 ) ) ( not ( = ?auto_11301 ?auto_11302 ) ) ( not ( = ?auto_11299 ?auto_11302 ) ) ( not ( = ?auto_11308 ?auto_11302 ) ) ( not ( = ?auto_11310 ?auto_11302 ) ) ( not ( = ?auto_11298 ?auto_11302 ) ) ( SURFACE-AT ?auto_11297 ?auto_11306 ) ( CLEAR ?auto_11297 ) ( IS-CRATE ?auto_11298 ) ( not ( = ?auto_11297 ?auto_11298 ) ) ( not ( = ?auto_11300 ?auto_11297 ) ) ( not ( = ?auto_11301 ?auto_11297 ) ) ( not ( = ?auto_11299 ?auto_11297 ) ) ( not ( = ?auto_11308 ?auto_11297 ) ) ( not ( = ?auto_11310 ?auto_11297 ) ) ( not ( = ?auto_11302 ?auto_11297 ) ) ( AVAILABLE ?auto_11307 ) ( AVAILABLE ?auto_11309 ) ( SURFACE-AT ?auto_11298 ?auto_11312 ) ( ON ?auto_11298 ?auto_11311 ) ( CLEAR ?auto_11298 ) ( not ( = ?auto_11300 ?auto_11311 ) ) ( not ( = ?auto_11301 ?auto_11311 ) ) ( not ( = ?auto_11299 ?auto_11311 ) ) ( not ( = ?auto_11308 ?auto_11311 ) ) ( not ( = ?auto_11310 ?auto_11311 ) ) ( not ( = ?auto_11298 ?auto_11311 ) ) ( not ( = ?auto_11302 ?auto_11311 ) ) ( not ( = ?auto_11297 ?auto_11311 ) ) ( TRUCK-AT ?auto_11313 ?auto_11306 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11299 ?auto_11300 ?auto_11301 )
      ( MAKE-4CRATE-VERIFY ?auto_11297 ?auto_11298 ?auto_11299 ?auto_11300 ?auto_11301 ) )
  )

)

