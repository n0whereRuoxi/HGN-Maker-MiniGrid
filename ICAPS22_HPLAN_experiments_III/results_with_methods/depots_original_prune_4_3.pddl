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
      ?auto_9300 - SURFACE
      ?auto_9301 - SURFACE
    )
    :vars
    (
      ?auto_9302 - HOIST
      ?auto_9303 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9302 ?auto_9303 ) ( SURFACE-AT ?auto_9300 ?auto_9303 ) ( CLEAR ?auto_9300 ) ( LIFTING ?auto_9302 ?auto_9301 ) ( IS-CRATE ?auto_9301 ) ( not ( = ?auto_9300 ?auto_9301 ) ) )
    :subtasks
    ( ( !DROP ?auto_9302 ?auto_9301 ?auto_9300 ?auto_9303 )
      ( MAKE-1CRATE-VERIFY ?auto_9300 ?auto_9301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9304 - SURFACE
      ?auto_9305 - SURFACE
    )
    :vars
    (
      ?auto_9307 - HOIST
      ?auto_9306 - PLACE
      ?auto_9308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9307 ?auto_9306 ) ( SURFACE-AT ?auto_9304 ?auto_9306 ) ( CLEAR ?auto_9304 ) ( IS-CRATE ?auto_9305 ) ( not ( = ?auto_9304 ?auto_9305 ) ) ( TRUCK-AT ?auto_9308 ?auto_9306 ) ( AVAILABLE ?auto_9307 ) ( IN ?auto_9305 ?auto_9308 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9307 ?auto_9305 ?auto_9308 ?auto_9306 )
      ( MAKE-1CRATE ?auto_9304 ?auto_9305 )
      ( MAKE-1CRATE-VERIFY ?auto_9304 ?auto_9305 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9309 - SURFACE
      ?auto_9310 - SURFACE
    )
    :vars
    (
      ?auto_9313 - HOIST
      ?auto_9312 - PLACE
      ?auto_9311 - TRUCK
      ?auto_9314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9313 ?auto_9312 ) ( SURFACE-AT ?auto_9309 ?auto_9312 ) ( CLEAR ?auto_9309 ) ( IS-CRATE ?auto_9310 ) ( not ( = ?auto_9309 ?auto_9310 ) ) ( AVAILABLE ?auto_9313 ) ( IN ?auto_9310 ?auto_9311 ) ( TRUCK-AT ?auto_9311 ?auto_9314 ) ( not ( = ?auto_9314 ?auto_9312 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9311 ?auto_9314 ?auto_9312 )
      ( MAKE-1CRATE ?auto_9309 ?auto_9310 )
      ( MAKE-1CRATE-VERIFY ?auto_9309 ?auto_9310 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9315 - SURFACE
      ?auto_9316 - SURFACE
    )
    :vars
    (
      ?auto_9319 - HOIST
      ?auto_9318 - PLACE
      ?auto_9317 - TRUCK
      ?auto_9320 - PLACE
      ?auto_9321 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9319 ?auto_9318 ) ( SURFACE-AT ?auto_9315 ?auto_9318 ) ( CLEAR ?auto_9315 ) ( IS-CRATE ?auto_9316 ) ( not ( = ?auto_9315 ?auto_9316 ) ) ( AVAILABLE ?auto_9319 ) ( TRUCK-AT ?auto_9317 ?auto_9320 ) ( not ( = ?auto_9320 ?auto_9318 ) ) ( HOIST-AT ?auto_9321 ?auto_9320 ) ( LIFTING ?auto_9321 ?auto_9316 ) ( not ( = ?auto_9319 ?auto_9321 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9321 ?auto_9316 ?auto_9317 ?auto_9320 )
      ( MAKE-1CRATE ?auto_9315 ?auto_9316 )
      ( MAKE-1CRATE-VERIFY ?auto_9315 ?auto_9316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9322 - SURFACE
      ?auto_9323 - SURFACE
    )
    :vars
    (
      ?auto_9324 - HOIST
      ?auto_9327 - PLACE
      ?auto_9328 - TRUCK
      ?auto_9326 - PLACE
      ?auto_9325 - HOIST
      ?auto_9329 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9324 ?auto_9327 ) ( SURFACE-AT ?auto_9322 ?auto_9327 ) ( CLEAR ?auto_9322 ) ( IS-CRATE ?auto_9323 ) ( not ( = ?auto_9322 ?auto_9323 ) ) ( AVAILABLE ?auto_9324 ) ( TRUCK-AT ?auto_9328 ?auto_9326 ) ( not ( = ?auto_9326 ?auto_9327 ) ) ( HOIST-AT ?auto_9325 ?auto_9326 ) ( not ( = ?auto_9324 ?auto_9325 ) ) ( AVAILABLE ?auto_9325 ) ( SURFACE-AT ?auto_9323 ?auto_9326 ) ( ON ?auto_9323 ?auto_9329 ) ( CLEAR ?auto_9323 ) ( not ( = ?auto_9322 ?auto_9329 ) ) ( not ( = ?auto_9323 ?auto_9329 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9325 ?auto_9323 ?auto_9329 ?auto_9326 )
      ( MAKE-1CRATE ?auto_9322 ?auto_9323 )
      ( MAKE-1CRATE-VERIFY ?auto_9322 ?auto_9323 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9330 - SURFACE
      ?auto_9331 - SURFACE
    )
    :vars
    (
      ?auto_9332 - HOIST
      ?auto_9334 - PLACE
      ?auto_9337 - PLACE
      ?auto_9336 - HOIST
      ?auto_9335 - SURFACE
      ?auto_9333 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9332 ?auto_9334 ) ( SURFACE-AT ?auto_9330 ?auto_9334 ) ( CLEAR ?auto_9330 ) ( IS-CRATE ?auto_9331 ) ( not ( = ?auto_9330 ?auto_9331 ) ) ( AVAILABLE ?auto_9332 ) ( not ( = ?auto_9337 ?auto_9334 ) ) ( HOIST-AT ?auto_9336 ?auto_9337 ) ( not ( = ?auto_9332 ?auto_9336 ) ) ( AVAILABLE ?auto_9336 ) ( SURFACE-AT ?auto_9331 ?auto_9337 ) ( ON ?auto_9331 ?auto_9335 ) ( CLEAR ?auto_9331 ) ( not ( = ?auto_9330 ?auto_9335 ) ) ( not ( = ?auto_9331 ?auto_9335 ) ) ( TRUCK-AT ?auto_9333 ?auto_9334 ) )
    :subtasks
    ( ( !DRIVE ?auto_9333 ?auto_9334 ?auto_9337 )
      ( MAKE-1CRATE ?auto_9330 ?auto_9331 )
      ( MAKE-1CRATE-VERIFY ?auto_9330 ?auto_9331 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9347 - SURFACE
      ?auto_9348 - SURFACE
      ?auto_9349 - SURFACE
    )
    :vars
    (
      ?auto_9350 - HOIST
      ?auto_9351 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9350 ?auto_9351 ) ( SURFACE-AT ?auto_9348 ?auto_9351 ) ( CLEAR ?auto_9348 ) ( LIFTING ?auto_9350 ?auto_9349 ) ( IS-CRATE ?auto_9349 ) ( not ( = ?auto_9348 ?auto_9349 ) ) ( ON ?auto_9348 ?auto_9347 ) ( not ( = ?auto_9347 ?auto_9348 ) ) ( not ( = ?auto_9347 ?auto_9349 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9348 ?auto_9349 )
      ( MAKE-2CRATE-VERIFY ?auto_9347 ?auto_9348 ?auto_9349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9357 - SURFACE
      ?auto_9358 - SURFACE
      ?auto_9359 - SURFACE
    )
    :vars
    (
      ?auto_9361 - HOIST
      ?auto_9360 - PLACE
      ?auto_9362 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9361 ?auto_9360 ) ( SURFACE-AT ?auto_9358 ?auto_9360 ) ( CLEAR ?auto_9358 ) ( IS-CRATE ?auto_9359 ) ( not ( = ?auto_9358 ?auto_9359 ) ) ( TRUCK-AT ?auto_9362 ?auto_9360 ) ( AVAILABLE ?auto_9361 ) ( IN ?auto_9359 ?auto_9362 ) ( ON ?auto_9358 ?auto_9357 ) ( not ( = ?auto_9357 ?auto_9358 ) ) ( not ( = ?auto_9357 ?auto_9359 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9358 ?auto_9359 )
      ( MAKE-2CRATE-VERIFY ?auto_9357 ?auto_9358 ?auto_9359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9363 - SURFACE
      ?auto_9364 - SURFACE
    )
    :vars
    (
      ?auto_9367 - HOIST
      ?auto_9368 - PLACE
      ?auto_9366 - TRUCK
      ?auto_9365 - SURFACE
      ?auto_9369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9367 ?auto_9368 ) ( SURFACE-AT ?auto_9363 ?auto_9368 ) ( CLEAR ?auto_9363 ) ( IS-CRATE ?auto_9364 ) ( not ( = ?auto_9363 ?auto_9364 ) ) ( AVAILABLE ?auto_9367 ) ( IN ?auto_9364 ?auto_9366 ) ( ON ?auto_9363 ?auto_9365 ) ( not ( = ?auto_9365 ?auto_9363 ) ) ( not ( = ?auto_9365 ?auto_9364 ) ) ( TRUCK-AT ?auto_9366 ?auto_9369 ) ( not ( = ?auto_9369 ?auto_9368 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9366 ?auto_9369 ?auto_9368 )
      ( MAKE-2CRATE ?auto_9365 ?auto_9363 ?auto_9364 )
      ( MAKE-1CRATE-VERIFY ?auto_9363 ?auto_9364 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9370 - SURFACE
      ?auto_9371 - SURFACE
      ?auto_9372 - SURFACE
    )
    :vars
    (
      ?auto_9376 - HOIST
      ?auto_9375 - PLACE
      ?auto_9373 - TRUCK
      ?auto_9374 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9376 ?auto_9375 ) ( SURFACE-AT ?auto_9371 ?auto_9375 ) ( CLEAR ?auto_9371 ) ( IS-CRATE ?auto_9372 ) ( not ( = ?auto_9371 ?auto_9372 ) ) ( AVAILABLE ?auto_9376 ) ( IN ?auto_9372 ?auto_9373 ) ( ON ?auto_9371 ?auto_9370 ) ( not ( = ?auto_9370 ?auto_9371 ) ) ( not ( = ?auto_9370 ?auto_9372 ) ) ( TRUCK-AT ?auto_9373 ?auto_9374 ) ( not ( = ?auto_9374 ?auto_9375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9371 ?auto_9372 )
      ( MAKE-2CRATE-VERIFY ?auto_9370 ?auto_9371 ?auto_9372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9377 - SURFACE
      ?auto_9378 - SURFACE
    )
    :vars
    (
      ?auto_9382 - HOIST
      ?auto_9379 - PLACE
      ?auto_9380 - SURFACE
      ?auto_9383 - TRUCK
      ?auto_9381 - PLACE
      ?auto_9384 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9382 ?auto_9379 ) ( SURFACE-AT ?auto_9377 ?auto_9379 ) ( CLEAR ?auto_9377 ) ( IS-CRATE ?auto_9378 ) ( not ( = ?auto_9377 ?auto_9378 ) ) ( AVAILABLE ?auto_9382 ) ( ON ?auto_9377 ?auto_9380 ) ( not ( = ?auto_9380 ?auto_9377 ) ) ( not ( = ?auto_9380 ?auto_9378 ) ) ( TRUCK-AT ?auto_9383 ?auto_9381 ) ( not ( = ?auto_9381 ?auto_9379 ) ) ( HOIST-AT ?auto_9384 ?auto_9381 ) ( LIFTING ?auto_9384 ?auto_9378 ) ( not ( = ?auto_9382 ?auto_9384 ) ) )
    :subtasks
    ( ( !LOAD ?auto_9384 ?auto_9378 ?auto_9383 ?auto_9381 )
      ( MAKE-2CRATE ?auto_9380 ?auto_9377 ?auto_9378 )
      ( MAKE-1CRATE-VERIFY ?auto_9377 ?auto_9378 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9385 - SURFACE
      ?auto_9386 - SURFACE
      ?auto_9387 - SURFACE
    )
    :vars
    (
      ?auto_9392 - HOIST
      ?auto_9388 - PLACE
      ?auto_9390 - TRUCK
      ?auto_9389 - PLACE
      ?auto_9391 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9392 ?auto_9388 ) ( SURFACE-AT ?auto_9386 ?auto_9388 ) ( CLEAR ?auto_9386 ) ( IS-CRATE ?auto_9387 ) ( not ( = ?auto_9386 ?auto_9387 ) ) ( AVAILABLE ?auto_9392 ) ( ON ?auto_9386 ?auto_9385 ) ( not ( = ?auto_9385 ?auto_9386 ) ) ( not ( = ?auto_9385 ?auto_9387 ) ) ( TRUCK-AT ?auto_9390 ?auto_9389 ) ( not ( = ?auto_9389 ?auto_9388 ) ) ( HOIST-AT ?auto_9391 ?auto_9389 ) ( LIFTING ?auto_9391 ?auto_9387 ) ( not ( = ?auto_9392 ?auto_9391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9386 ?auto_9387 )
      ( MAKE-2CRATE-VERIFY ?auto_9385 ?auto_9386 ?auto_9387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9393 - SURFACE
      ?auto_9394 - SURFACE
    )
    :vars
    (
      ?auto_9398 - HOIST
      ?auto_9399 - PLACE
      ?auto_9400 - SURFACE
      ?auto_9395 - TRUCK
      ?auto_9397 - PLACE
      ?auto_9396 - HOIST
      ?auto_9401 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9398 ?auto_9399 ) ( SURFACE-AT ?auto_9393 ?auto_9399 ) ( CLEAR ?auto_9393 ) ( IS-CRATE ?auto_9394 ) ( not ( = ?auto_9393 ?auto_9394 ) ) ( AVAILABLE ?auto_9398 ) ( ON ?auto_9393 ?auto_9400 ) ( not ( = ?auto_9400 ?auto_9393 ) ) ( not ( = ?auto_9400 ?auto_9394 ) ) ( TRUCK-AT ?auto_9395 ?auto_9397 ) ( not ( = ?auto_9397 ?auto_9399 ) ) ( HOIST-AT ?auto_9396 ?auto_9397 ) ( not ( = ?auto_9398 ?auto_9396 ) ) ( AVAILABLE ?auto_9396 ) ( SURFACE-AT ?auto_9394 ?auto_9397 ) ( ON ?auto_9394 ?auto_9401 ) ( CLEAR ?auto_9394 ) ( not ( = ?auto_9393 ?auto_9401 ) ) ( not ( = ?auto_9394 ?auto_9401 ) ) ( not ( = ?auto_9400 ?auto_9401 ) ) )
    :subtasks
    ( ( !LIFT ?auto_9396 ?auto_9394 ?auto_9401 ?auto_9397 )
      ( MAKE-2CRATE ?auto_9400 ?auto_9393 ?auto_9394 )
      ( MAKE-1CRATE-VERIFY ?auto_9393 ?auto_9394 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9402 - SURFACE
      ?auto_9403 - SURFACE
      ?auto_9404 - SURFACE
    )
    :vars
    (
      ?auto_9410 - HOIST
      ?auto_9406 - PLACE
      ?auto_9405 - TRUCK
      ?auto_9408 - PLACE
      ?auto_9409 - HOIST
      ?auto_9407 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9410 ?auto_9406 ) ( SURFACE-AT ?auto_9403 ?auto_9406 ) ( CLEAR ?auto_9403 ) ( IS-CRATE ?auto_9404 ) ( not ( = ?auto_9403 ?auto_9404 ) ) ( AVAILABLE ?auto_9410 ) ( ON ?auto_9403 ?auto_9402 ) ( not ( = ?auto_9402 ?auto_9403 ) ) ( not ( = ?auto_9402 ?auto_9404 ) ) ( TRUCK-AT ?auto_9405 ?auto_9408 ) ( not ( = ?auto_9408 ?auto_9406 ) ) ( HOIST-AT ?auto_9409 ?auto_9408 ) ( not ( = ?auto_9410 ?auto_9409 ) ) ( AVAILABLE ?auto_9409 ) ( SURFACE-AT ?auto_9404 ?auto_9408 ) ( ON ?auto_9404 ?auto_9407 ) ( CLEAR ?auto_9404 ) ( not ( = ?auto_9403 ?auto_9407 ) ) ( not ( = ?auto_9404 ?auto_9407 ) ) ( not ( = ?auto_9402 ?auto_9407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9403 ?auto_9404 )
      ( MAKE-2CRATE-VERIFY ?auto_9402 ?auto_9403 ?auto_9404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9411 - SURFACE
      ?auto_9412 - SURFACE
    )
    :vars
    (
      ?auto_9417 - HOIST
      ?auto_9418 - PLACE
      ?auto_9415 - SURFACE
      ?auto_9413 - PLACE
      ?auto_9414 - HOIST
      ?auto_9419 - SURFACE
      ?auto_9416 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9417 ?auto_9418 ) ( SURFACE-AT ?auto_9411 ?auto_9418 ) ( CLEAR ?auto_9411 ) ( IS-CRATE ?auto_9412 ) ( not ( = ?auto_9411 ?auto_9412 ) ) ( AVAILABLE ?auto_9417 ) ( ON ?auto_9411 ?auto_9415 ) ( not ( = ?auto_9415 ?auto_9411 ) ) ( not ( = ?auto_9415 ?auto_9412 ) ) ( not ( = ?auto_9413 ?auto_9418 ) ) ( HOIST-AT ?auto_9414 ?auto_9413 ) ( not ( = ?auto_9417 ?auto_9414 ) ) ( AVAILABLE ?auto_9414 ) ( SURFACE-AT ?auto_9412 ?auto_9413 ) ( ON ?auto_9412 ?auto_9419 ) ( CLEAR ?auto_9412 ) ( not ( = ?auto_9411 ?auto_9419 ) ) ( not ( = ?auto_9412 ?auto_9419 ) ) ( not ( = ?auto_9415 ?auto_9419 ) ) ( TRUCK-AT ?auto_9416 ?auto_9418 ) )
    :subtasks
    ( ( !DRIVE ?auto_9416 ?auto_9418 ?auto_9413 )
      ( MAKE-2CRATE ?auto_9415 ?auto_9411 ?auto_9412 )
      ( MAKE-1CRATE-VERIFY ?auto_9411 ?auto_9412 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9420 - SURFACE
      ?auto_9421 - SURFACE
      ?auto_9422 - SURFACE
    )
    :vars
    (
      ?auto_9428 - HOIST
      ?auto_9427 - PLACE
      ?auto_9425 - PLACE
      ?auto_9424 - HOIST
      ?auto_9426 - SURFACE
      ?auto_9423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9428 ?auto_9427 ) ( SURFACE-AT ?auto_9421 ?auto_9427 ) ( CLEAR ?auto_9421 ) ( IS-CRATE ?auto_9422 ) ( not ( = ?auto_9421 ?auto_9422 ) ) ( AVAILABLE ?auto_9428 ) ( ON ?auto_9421 ?auto_9420 ) ( not ( = ?auto_9420 ?auto_9421 ) ) ( not ( = ?auto_9420 ?auto_9422 ) ) ( not ( = ?auto_9425 ?auto_9427 ) ) ( HOIST-AT ?auto_9424 ?auto_9425 ) ( not ( = ?auto_9428 ?auto_9424 ) ) ( AVAILABLE ?auto_9424 ) ( SURFACE-AT ?auto_9422 ?auto_9425 ) ( ON ?auto_9422 ?auto_9426 ) ( CLEAR ?auto_9422 ) ( not ( = ?auto_9421 ?auto_9426 ) ) ( not ( = ?auto_9422 ?auto_9426 ) ) ( not ( = ?auto_9420 ?auto_9426 ) ) ( TRUCK-AT ?auto_9423 ?auto_9427 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9421 ?auto_9422 )
      ( MAKE-2CRATE-VERIFY ?auto_9420 ?auto_9421 ?auto_9422 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9429 - SURFACE
      ?auto_9430 - SURFACE
    )
    :vars
    (
      ?auto_9433 - HOIST
      ?auto_9436 - PLACE
      ?auto_9435 - SURFACE
      ?auto_9432 - PLACE
      ?auto_9437 - HOIST
      ?auto_9434 - SURFACE
      ?auto_9431 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9433 ?auto_9436 ) ( IS-CRATE ?auto_9430 ) ( not ( = ?auto_9429 ?auto_9430 ) ) ( not ( = ?auto_9435 ?auto_9429 ) ) ( not ( = ?auto_9435 ?auto_9430 ) ) ( not ( = ?auto_9432 ?auto_9436 ) ) ( HOIST-AT ?auto_9437 ?auto_9432 ) ( not ( = ?auto_9433 ?auto_9437 ) ) ( AVAILABLE ?auto_9437 ) ( SURFACE-AT ?auto_9430 ?auto_9432 ) ( ON ?auto_9430 ?auto_9434 ) ( CLEAR ?auto_9430 ) ( not ( = ?auto_9429 ?auto_9434 ) ) ( not ( = ?auto_9430 ?auto_9434 ) ) ( not ( = ?auto_9435 ?auto_9434 ) ) ( TRUCK-AT ?auto_9431 ?auto_9436 ) ( SURFACE-AT ?auto_9435 ?auto_9436 ) ( CLEAR ?auto_9435 ) ( LIFTING ?auto_9433 ?auto_9429 ) ( IS-CRATE ?auto_9429 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9435 ?auto_9429 )
      ( MAKE-2CRATE ?auto_9435 ?auto_9429 ?auto_9430 )
      ( MAKE-1CRATE-VERIFY ?auto_9429 ?auto_9430 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_9438 - SURFACE
      ?auto_9439 - SURFACE
      ?auto_9440 - SURFACE
    )
    :vars
    (
      ?auto_9441 - HOIST
      ?auto_9446 - PLACE
      ?auto_9445 - PLACE
      ?auto_9444 - HOIST
      ?auto_9443 - SURFACE
      ?auto_9442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9441 ?auto_9446 ) ( IS-CRATE ?auto_9440 ) ( not ( = ?auto_9439 ?auto_9440 ) ) ( not ( = ?auto_9438 ?auto_9439 ) ) ( not ( = ?auto_9438 ?auto_9440 ) ) ( not ( = ?auto_9445 ?auto_9446 ) ) ( HOIST-AT ?auto_9444 ?auto_9445 ) ( not ( = ?auto_9441 ?auto_9444 ) ) ( AVAILABLE ?auto_9444 ) ( SURFACE-AT ?auto_9440 ?auto_9445 ) ( ON ?auto_9440 ?auto_9443 ) ( CLEAR ?auto_9440 ) ( not ( = ?auto_9439 ?auto_9443 ) ) ( not ( = ?auto_9440 ?auto_9443 ) ) ( not ( = ?auto_9438 ?auto_9443 ) ) ( TRUCK-AT ?auto_9442 ?auto_9446 ) ( SURFACE-AT ?auto_9438 ?auto_9446 ) ( CLEAR ?auto_9438 ) ( LIFTING ?auto_9441 ?auto_9439 ) ( IS-CRATE ?auto_9439 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9439 ?auto_9440 )
      ( MAKE-2CRATE-VERIFY ?auto_9438 ?auto_9439 ?auto_9440 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9447 - SURFACE
      ?auto_9448 - SURFACE
    )
    :vars
    (
      ?auto_9450 - HOIST
      ?auto_9454 - PLACE
      ?auto_9455 - SURFACE
      ?auto_9451 - PLACE
      ?auto_9449 - HOIST
      ?auto_9452 - SURFACE
      ?auto_9453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9450 ?auto_9454 ) ( IS-CRATE ?auto_9448 ) ( not ( = ?auto_9447 ?auto_9448 ) ) ( not ( = ?auto_9455 ?auto_9447 ) ) ( not ( = ?auto_9455 ?auto_9448 ) ) ( not ( = ?auto_9451 ?auto_9454 ) ) ( HOIST-AT ?auto_9449 ?auto_9451 ) ( not ( = ?auto_9450 ?auto_9449 ) ) ( AVAILABLE ?auto_9449 ) ( SURFACE-AT ?auto_9448 ?auto_9451 ) ( ON ?auto_9448 ?auto_9452 ) ( CLEAR ?auto_9448 ) ( not ( = ?auto_9447 ?auto_9452 ) ) ( not ( = ?auto_9448 ?auto_9452 ) ) ( not ( = ?auto_9455 ?auto_9452 ) ) ( TRUCK-AT ?auto_9453 ?auto_9454 ) ( SURFACE-AT ?auto_9455 ?auto_9454 ) ( CLEAR ?auto_9455 ) ( IS-CRATE ?auto_9447 ) ( AVAILABLE ?auto_9450 ) ( IN ?auto_9447 ?auto_9453 ) )
    :subtasks
    ( ( !UNLOAD ?auto_9450 ?auto_9447 ?auto_9453 ?auto_9454 )
      ( MAKE-2CRATE ?auto_9455 ?auto_9447 ?auto_9448 )
      ( MAKE-1CRATE-VERIFY ?auto_9447 ?auto_9448 ) )
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
      ?auto_9461 - HOIST
      ?auto_9462 - PLACE
      ?auto_9464 - PLACE
      ?auto_9460 - HOIST
      ?auto_9459 - SURFACE
      ?auto_9463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9461 ?auto_9462 ) ( IS-CRATE ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9458 ) ) ( not ( = ?auto_9456 ?auto_9457 ) ) ( not ( = ?auto_9456 ?auto_9458 ) ) ( not ( = ?auto_9464 ?auto_9462 ) ) ( HOIST-AT ?auto_9460 ?auto_9464 ) ( not ( = ?auto_9461 ?auto_9460 ) ) ( AVAILABLE ?auto_9460 ) ( SURFACE-AT ?auto_9458 ?auto_9464 ) ( ON ?auto_9458 ?auto_9459 ) ( CLEAR ?auto_9458 ) ( not ( = ?auto_9457 ?auto_9459 ) ) ( not ( = ?auto_9458 ?auto_9459 ) ) ( not ( = ?auto_9456 ?auto_9459 ) ) ( TRUCK-AT ?auto_9463 ?auto_9462 ) ( SURFACE-AT ?auto_9456 ?auto_9462 ) ( CLEAR ?auto_9456 ) ( IS-CRATE ?auto_9457 ) ( AVAILABLE ?auto_9461 ) ( IN ?auto_9457 ?auto_9463 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9457 ?auto_9458 )
      ( MAKE-2CRATE-VERIFY ?auto_9456 ?auto_9457 ?auto_9458 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_9501 - SURFACE
      ?auto_9502 - SURFACE
    )
    :vars
    (
      ?auto_9509 - HOIST
      ?auto_9508 - PLACE
      ?auto_9504 - SURFACE
      ?auto_9507 - PLACE
      ?auto_9505 - HOIST
      ?auto_9503 - SURFACE
      ?auto_9506 - TRUCK
      ?auto_9510 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9509 ?auto_9508 ) ( SURFACE-AT ?auto_9501 ?auto_9508 ) ( CLEAR ?auto_9501 ) ( IS-CRATE ?auto_9502 ) ( not ( = ?auto_9501 ?auto_9502 ) ) ( AVAILABLE ?auto_9509 ) ( ON ?auto_9501 ?auto_9504 ) ( not ( = ?auto_9504 ?auto_9501 ) ) ( not ( = ?auto_9504 ?auto_9502 ) ) ( not ( = ?auto_9507 ?auto_9508 ) ) ( HOIST-AT ?auto_9505 ?auto_9507 ) ( not ( = ?auto_9509 ?auto_9505 ) ) ( AVAILABLE ?auto_9505 ) ( SURFACE-AT ?auto_9502 ?auto_9507 ) ( ON ?auto_9502 ?auto_9503 ) ( CLEAR ?auto_9502 ) ( not ( = ?auto_9501 ?auto_9503 ) ) ( not ( = ?auto_9502 ?auto_9503 ) ) ( not ( = ?auto_9504 ?auto_9503 ) ) ( TRUCK-AT ?auto_9506 ?auto_9510 ) ( not ( = ?auto_9510 ?auto_9508 ) ) ( not ( = ?auto_9507 ?auto_9510 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_9506 ?auto_9510 ?auto_9508 )
      ( MAKE-1CRATE ?auto_9501 ?auto_9502 )
      ( MAKE-1CRATE-VERIFY ?auto_9501 ?auto_9502 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9540 - SURFACE
      ?auto_9541 - SURFACE
      ?auto_9542 - SURFACE
      ?auto_9543 - SURFACE
    )
    :vars
    (
      ?auto_9545 - HOIST
      ?auto_9544 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9545 ?auto_9544 ) ( SURFACE-AT ?auto_9542 ?auto_9544 ) ( CLEAR ?auto_9542 ) ( LIFTING ?auto_9545 ?auto_9543 ) ( IS-CRATE ?auto_9543 ) ( not ( = ?auto_9542 ?auto_9543 ) ) ( ON ?auto_9541 ?auto_9540 ) ( ON ?auto_9542 ?auto_9541 ) ( not ( = ?auto_9540 ?auto_9541 ) ) ( not ( = ?auto_9540 ?auto_9542 ) ) ( not ( = ?auto_9540 ?auto_9543 ) ) ( not ( = ?auto_9541 ?auto_9542 ) ) ( not ( = ?auto_9541 ?auto_9543 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_9542 ?auto_9543 )
      ( MAKE-3CRATE-VERIFY ?auto_9540 ?auto_9541 ?auto_9542 ?auto_9543 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9557 - SURFACE
      ?auto_9558 - SURFACE
      ?auto_9559 - SURFACE
      ?auto_9560 - SURFACE
    )
    :vars
    (
      ?auto_9562 - HOIST
      ?auto_9563 - PLACE
      ?auto_9561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9562 ?auto_9563 ) ( SURFACE-AT ?auto_9559 ?auto_9563 ) ( CLEAR ?auto_9559 ) ( IS-CRATE ?auto_9560 ) ( not ( = ?auto_9559 ?auto_9560 ) ) ( TRUCK-AT ?auto_9561 ?auto_9563 ) ( AVAILABLE ?auto_9562 ) ( IN ?auto_9560 ?auto_9561 ) ( ON ?auto_9559 ?auto_9558 ) ( not ( = ?auto_9558 ?auto_9559 ) ) ( not ( = ?auto_9558 ?auto_9560 ) ) ( ON ?auto_9558 ?auto_9557 ) ( not ( = ?auto_9557 ?auto_9558 ) ) ( not ( = ?auto_9557 ?auto_9559 ) ) ( not ( = ?auto_9557 ?auto_9560 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9558 ?auto_9559 ?auto_9560 )
      ( MAKE-3CRATE-VERIFY ?auto_9557 ?auto_9558 ?auto_9559 ?auto_9560 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9578 - SURFACE
      ?auto_9579 - SURFACE
      ?auto_9580 - SURFACE
      ?auto_9581 - SURFACE
    )
    :vars
    (
      ?auto_9582 - HOIST
      ?auto_9583 - PLACE
      ?auto_9584 - TRUCK
      ?auto_9585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9582 ?auto_9583 ) ( SURFACE-AT ?auto_9580 ?auto_9583 ) ( CLEAR ?auto_9580 ) ( IS-CRATE ?auto_9581 ) ( not ( = ?auto_9580 ?auto_9581 ) ) ( AVAILABLE ?auto_9582 ) ( IN ?auto_9581 ?auto_9584 ) ( ON ?auto_9580 ?auto_9579 ) ( not ( = ?auto_9579 ?auto_9580 ) ) ( not ( = ?auto_9579 ?auto_9581 ) ) ( TRUCK-AT ?auto_9584 ?auto_9585 ) ( not ( = ?auto_9585 ?auto_9583 ) ) ( ON ?auto_9579 ?auto_9578 ) ( not ( = ?auto_9578 ?auto_9579 ) ) ( not ( = ?auto_9578 ?auto_9580 ) ) ( not ( = ?auto_9578 ?auto_9581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9579 ?auto_9580 ?auto_9581 )
      ( MAKE-3CRATE-VERIFY ?auto_9578 ?auto_9579 ?auto_9580 ?auto_9581 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9602 - SURFACE
      ?auto_9603 - SURFACE
      ?auto_9604 - SURFACE
      ?auto_9605 - SURFACE
    )
    :vars
    (
      ?auto_9609 - HOIST
      ?auto_9608 - PLACE
      ?auto_9606 - TRUCK
      ?auto_9610 - PLACE
      ?auto_9607 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_9609 ?auto_9608 ) ( SURFACE-AT ?auto_9604 ?auto_9608 ) ( CLEAR ?auto_9604 ) ( IS-CRATE ?auto_9605 ) ( not ( = ?auto_9604 ?auto_9605 ) ) ( AVAILABLE ?auto_9609 ) ( ON ?auto_9604 ?auto_9603 ) ( not ( = ?auto_9603 ?auto_9604 ) ) ( not ( = ?auto_9603 ?auto_9605 ) ) ( TRUCK-AT ?auto_9606 ?auto_9610 ) ( not ( = ?auto_9610 ?auto_9608 ) ) ( HOIST-AT ?auto_9607 ?auto_9610 ) ( LIFTING ?auto_9607 ?auto_9605 ) ( not ( = ?auto_9609 ?auto_9607 ) ) ( ON ?auto_9603 ?auto_9602 ) ( not ( = ?auto_9602 ?auto_9603 ) ) ( not ( = ?auto_9602 ?auto_9604 ) ) ( not ( = ?auto_9602 ?auto_9605 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9603 ?auto_9604 ?auto_9605 )
      ( MAKE-3CRATE-VERIFY ?auto_9602 ?auto_9603 ?auto_9604 ?auto_9605 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9629 - SURFACE
      ?auto_9630 - SURFACE
      ?auto_9631 - SURFACE
      ?auto_9632 - SURFACE
    )
    :vars
    (
      ?auto_9635 - HOIST
      ?auto_9636 - PLACE
      ?auto_9638 - TRUCK
      ?auto_9637 - PLACE
      ?auto_9633 - HOIST
      ?auto_9634 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_9635 ?auto_9636 ) ( SURFACE-AT ?auto_9631 ?auto_9636 ) ( CLEAR ?auto_9631 ) ( IS-CRATE ?auto_9632 ) ( not ( = ?auto_9631 ?auto_9632 ) ) ( AVAILABLE ?auto_9635 ) ( ON ?auto_9631 ?auto_9630 ) ( not ( = ?auto_9630 ?auto_9631 ) ) ( not ( = ?auto_9630 ?auto_9632 ) ) ( TRUCK-AT ?auto_9638 ?auto_9637 ) ( not ( = ?auto_9637 ?auto_9636 ) ) ( HOIST-AT ?auto_9633 ?auto_9637 ) ( not ( = ?auto_9635 ?auto_9633 ) ) ( AVAILABLE ?auto_9633 ) ( SURFACE-AT ?auto_9632 ?auto_9637 ) ( ON ?auto_9632 ?auto_9634 ) ( CLEAR ?auto_9632 ) ( not ( = ?auto_9631 ?auto_9634 ) ) ( not ( = ?auto_9632 ?auto_9634 ) ) ( not ( = ?auto_9630 ?auto_9634 ) ) ( ON ?auto_9630 ?auto_9629 ) ( not ( = ?auto_9629 ?auto_9630 ) ) ( not ( = ?auto_9629 ?auto_9631 ) ) ( not ( = ?auto_9629 ?auto_9632 ) ) ( not ( = ?auto_9629 ?auto_9634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9630 ?auto_9631 ?auto_9632 )
      ( MAKE-3CRATE-VERIFY ?auto_9629 ?auto_9630 ?auto_9631 ?auto_9632 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9657 - SURFACE
      ?auto_9658 - SURFACE
      ?auto_9659 - SURFACE
      ?auto_9660 - SURFACE
    )
    :vars
    (
      ?auto_9665 - HOIST
      ?auto_9663 - PLACE
      ?auto_9662 - PLACE
      ?auto_9666 - HOIST
      ?auto_9661 - SURFACE
      ?auto_9664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9665 ?auto_9663 ) ( SURFACE-AT ?auto_9659 ?auto_9663 ) ( CLEAR ?auto_9659 ) ( IS-CRATE ?auto_9660 ) ( not ( = ?auto_9659 ?auto_9660 ) ) ( AVAILABLE ?auto_9665 ) ( ON ?auto_9659 ?auto_9658 ) ( not ( = ?auto_9658 ?auto_9659 ) ) ( not ( = ?auto_9658 ?auto_9660 ) ) ( not ( = ?auto_9662 ?auto_9663 ) ) ( HOIST-AT ?auto_9666 ?auto_9662 ) ( not ( = ?auto_9665 ?auto_9666 ) ) ( AVAILABLE ?auto_9666 ) ( SURFACE-AT ?auto_9660 ?auto_9662 ) ( ON ?auto_9660 ?auto_9661 ) ( CLEAR ?auto_9660 ) ( not ( = ?auto_9659 ?auto_9661 ) ) ( not ( = ?auto_9660 ?auto_9661 ) ) ( not ( = ?auto_9658 ?auto_9661 ) ) ( TRUCK-AT ?auto_9664 ?auto_9663 ) ( ON ?auto_9658 ?auto_9657 ) ( not ( = ?auto_9657 ?auto_9658 ) ) ( not ( = ?auto_9657 ?auto_9659 ) ) ( not ( = ?auto_9657 ?auto_9660 ) ) ( not ( = ?auto_9657 ?auto_9661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9658 ?auto_9659 ?auto_9660 )
      ( MAKE-3CRATE-VERIFY ?auto_9657 ?auto_9658 ?auto_9659 ?auto_9660 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9685 - SURFACE
      ?auto_9686 - SURFACE
      ?auto_9687 - SURFACE
      ?auto_9688 - SURFACE
    )
    :vars
    (
      ?auto_9690 - HOIST
      ?auto_9691 - PLACE
      ?auto_9692 - PLACE
      ?auto_9693 - HOIST
      ?auto_9689 - SURFACE
      ?auto_9694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9690 ?auto_9691 ) ( IS-CRATE ?auto_9688 ) ( not ( = ?auto_9687 ?auto_9688 ) ) ( not ( = ?auto_9686 ?auto_9687 ) ) ( not ( = ?auto_9686 ?auto_9688 ) ) ( not ( = ?auto_9692 ?auto_9691 ) ) ( HOIST-AT ?auto_9693 ?auto_9692 ) ( not ( = ?auto_9690 ?auto_9693 ) ) ( AVAILABLE ?auto_9693 ) ( SURFACE-AT ?auto_9688 ?auto_9692 ) ( ON ?auto_9688 ?auto_9689 ) ( CLEAR ?auto_9688 ) ( not ( = ?auto_9687 ?auto_9689 ) ) ( not ( = ?auto_9688 ?auto_9689 ) ) ( not ( = ?auto_9686 ?auto_9689 ) ) ( TRUCK-AT ?auto_9694 ?auto_9691 ) ( SURFACE-AT ?auto_9686 ?auto_9691 ) ( CLEAR ?auto_9686 ) ( LIFTING ?auto_9690 ?auto_9687 ) ( IS-CRATE ?auto_9687 ) ( ON ?auto_9686 ?auto_9685 ) ( not ( = ?auto_9685 ?auto_9686 ) ) ( not ( = ?auto_9685 ?auto_9687 ) ) ( not ( = ?auto_9685 ?auto_9688 ) ) ( not ( = ?auto_9685 ?auto_9689 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9686 ?auto_9687 ?auto_9688 )
      ( MAKE-3CRATE-VERIFY ?auto_9685 ?auto_9686 ?auto_9687 ?auto_9688 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_9713 - SURFACE
      ?auto_9714 - SURFACE
      ?auto_9715 - SURFACE
      ?auto_9716 - SURFACE
    )
    :vars
    (
      ?auto_9717 - HOIST
      ?auto_9718 - PLACE
      ?auto_9721 - PLACE
      ?auto_9722 - HOIST
      ?auto_9720 - SURFACE
      ?auto_9719 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_9717 ?auto_9718 ) ( IS-CRATE ?auto_9716 ) ( not ( = ?auto_9715 ?auto_9716 ) ) ( not ( = ?auto_9714 ?auto_9715 ) ) ( not ( = ?auto_9714 ?auto_9716 ) ) ( not ( = ?auto_9721 ?auto_9718 ) ) ( HOIST-AT ?auto_9722 ?auto_9721 ) ( not ( = ?auto_9717 ?auto_9722 ) ) ( AVAILABLE ?auto_9722 ) ( SURFACE-AT ?auto_9716 ?auto_9721 ) ( ON ?auto_9716 ?auto_9720 ) ( CLEAR ?auto_9716 ) ( not ( = ?auto_9715 ?auto_9720 ) ) ( not ( = ?auto_9716 ?auto_9720 ) ) ( not ( = ?auto_9714 ?auto_9720 ) ) ( TRUCK-AT ?auto_9719 ?auto_9718 ) ( SURFACE-AT ?auto_9714 ?auto_9718 ) ( CLEAR ?auto_9714 ) ( IS-CRATE ?auto_9715 ) ( AVAILABLE ?auto_9717 ) ( IN ?auto_9715 ?auto_9719 ) ( ON ?auto_9714 ?auto_9713 ) ( not ( = ?auto_9713 ?auto_9714 ) ) ( not ( = ?auto_9713 ?auto_9715 ) ) ( not ( = ?auto_9713 ?auto_9716 ) ) ( not ( = ?auto_9713 ?auto_9720 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_9714 ?auto_9715 ?auto_9716 )
      ( MAKE-3CRATE-VERIFY ?auto_9713 ?auto_9714 ?auto_9715 ?auto_9716 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10004 - SURFACE
      ?auto_10005 - SURFACE
      ?auto_10006 - SURFACE
      ?auto_10008 - SURFACE
      ?auto_10007 - SURFACE
    )
    :vars
    (
      ?auto_10009 - HOIST
      ?auto_10010 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10009 ?auto_10010 ) ( SURFACE-AT ?auto_10008 ?auto_10010 ) ( CLEAR ?auto_10008 ) ( LIFTING ?auto_10009 ?auto_10007 ) ( IS-CRATE ?auto_10007 ) ( not ( = ?auto_10008 ?auto_10007 ) ) ( ON ?auto_10005 ?auto_10004 ) ( ON ?auto_10006 ?auto_10005 ) ( ON ?auto_10008 ?auto_10006 ) ( not ( = ?auto_10004 ?auto_10005 ) ) ( not ( = ?auto_10004 ?auto_10006 ) ) ( not ( = ?auto_10004 ?auto_10008 ) ) ( not ( = ?auto_10004 ?auto_10007 ) ) ( not ( = ?auto_10005 ?auto_10006 ) ) ( not ( = ?auto_10005 ?auto_10008 ) ) ( not ( = ?auto_10005 ?auto_10007 ) ) ( not ( = ?auto_10006 ?auto_10008 ) ) ( not ( = ?auto_10006 ?auto_10007 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_10008 ?auto_10007 )
      ( MAKE-4CRATE-VERIFY ?auto_10004 ?auto_10005 ?auto_10006 ?auto_10008 ?auto_10007 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10029 - SURFACE
      ?auto_10030 - SURFACE
      ?auto_10031 - SURFACE
      ?auto_10033 - SURFACE
      ?auto_10032 - SURFACE
    )
    :vars
    (
      ?auto_10036 - HOIST
      ?auto_10034 - PLACE
      ?auto_10035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10036 ?auto_10034 ) ( SURFACE-AT ?auto_10033 ?auto_10034 ) ( CLEAR ?auto_10033 ) ( IS-CRATE ?auto_10032 ) ( not ( = ?auto_10033 ?auto_10032 ) ) ( TRUCK-AT ?auto_10035 ?auto_10034 ) ( AVAILABLE ?auto_10036 ) ( IN ?auto_10032 ?auto_10035 ) ( ON ?auto_10033 ?auto_10031 ) ( not ( = ?auto_10031 ?auto_10033 ) ) ( not ( = ?auto_10031 ?auto_10032 ) ) ( ON ?auto_10030 ?auto_10029 ) ( ON ?auto_10031 ?auto_10030 ) ( not ( = ?auto_10029 ?auto_10030 ) ) ( not ( = ?auto_10029 ?auto_10031 ) ) ( not ( = ?auto_10029 ?auto_10033 ) ) ( not ( = ?auto_10029 ?auto_10032 ) ) ( not ( = ?auto_10030 ?auto_10031 ) ) ( not ( = ?auto_10030 ?auto_10033 ) ) ( not ( = ?auto_10030 ?auto_10032 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10031 ?auto_10033 ?auto_10032 )
      ( MAKE-4CRATE-VERIFY ?auto_10029 ?auto_10030 ?auto_10031 ?auto_10033 ?auto_10032 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10059 - SURFACE
      ?auto_10060 - SURFACE
      ?auto_10061 - SURFACE
      ?auto_10063 - SURFACE
      ?auto_10062 - SURFACE
    )
    :vars
    (
      ?auto_10064 - HOIST
      ?auto_10066 - PLACE
      ?auto_10067 - TRUCK
      ?auto_10065 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10064 ?auto_10066 ) ( SURFACE-AT ?auto_10063 ?auto_10066 ) ( CLEAR ?auto_10063 ) ( IS-CRATE ?auto_10062 ) ( not ( = ?auto_10063 ?auto_10062 ) ) ( AVAILABLE ?auto_10064 ) ( IN ?auto_10062 ?auto_10067 ) ( ON ?auto_10063 ?auto_10061 ) ( not ( = ?auto_10061 ?auto_10063 ) ) ( not ( = ?auto_10061 ?auto_10062 ) ) ( TRUCK-AT ?auto_10067 ?auto_10065 ) ( not ( = ?auto_10065 ?auto_10066 ) ) ( ON ?auto_10060 ?auto_10059 ) ( ON ?auto_10061 ?auto_10060 ) ( not ( = ?auto_10059 ?auto_10060 ) ) ( not ( = ?auto_10059 ?auto_10061 ) ) ( not ( = ?auto_10059 ?auto_10063 ) ) ( not ( = ?auto_10059 ?auto_10062 ) ) ( not ( = ?auto_10060 ?auto_10061 ) ) ( not ( = ?auto_10060 ?auto_10063 ) ) ( not ( = ?auto_10060 ?auto_10062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10061 ?auto_10063 ?auto_10062 )
      ( MAKE-4CRATE-VERIFY ?auto_10059 ?auto_10060 ?auto_10061 ?auto_10063 ?auto_10062 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10093 - SURFACE
      ?auto_10094 - SURFACE
      ?auto_10095 - SURFACE
      ?auto_10097 - SURFACE
      ?auto_10096 - SURFACE
    )
    :vars
    (
      ?auto_10101 - HOIST
      ?auto_10099 - PLACE
      ?auto_10100 - TRUCK
      ?auto_10102 - PLACE
      ?auto_10098 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_10101 ?auto_10099 ) ( SURFACE-AT ?auto_10097 ?auto_10099 ) ( CLEAR ?auto_10097 ) ( IS-CRATE ?auto_10096 ) ( not ( = ?auto_10097 ?auto_10096 ) ) ( AVAILABLE ?auto_10101 ) ( ON ?auto_10097 ?auto_10095 ) ( not ( = ?auto_10095 ?auto_10097 ) ) ( not ( = ?auto_10095 ?auto_10096 ) ) ( TRUCK-AT ?auto_10100 ?auto_10102 ) ( not ( = ?auto_10102 ?auto_10099 ) ) ( HOIST-AT ?auto_10098 ?auto_10102 ) ( LIFTING ?auto_10098 ?auto_10096 ) ( not ( = ?auto_10101 ?auto_10098 ) ) ( ON ?auto_10094 ?auto_10093 ) ( ON ?auto_10095 ?auto_10094 ) ( not ( = ?auto_10093 ?auto_10094 ) ) ( not ( = ?auto_10093 ?auto_10095 ) ) ( not ( = ?auto_10093 ?auto_10097 ) ) ( not ( = ?auto_10093 ?auto_10096 ) ) ( not ( = ?auto_10094 ?auto_10095 ) ) ( not ( = ?auto_10094 ?auto_10097 ) ) ( not ( = ?auto_10094 ?auto_10096 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10095 ?auto_10097 ?auto_10096 )
      ( MAKE-4CRATE-VERIFY ?auto_10093 ?auto_10094 ?auto_10095 ?auto_10097 ?auto_10096 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10131 - SURFACE
      ?auto_10132 - SURFACE
      ?auto_10133 - SURFACE
      ?auto_10135 - SURFACE
      ?auto_10134 - SURFACE
    )
    :vars
    (
      ?auto_10138 - HOIST
      ?auto_10139 - PLACE
      ?auto_10140 - TRUCK
      ?auto_10137 - PLACE
      ?auto_10136 - HOIST
      ?auto_10141 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10138 ?auto_10139 ) ( SURFACE-AT ?auto_10135 ?auto_10139 ) ( CLEAR ?auto_10135 ) ( IS-CRATE ?auto_10134 ) ( not ( = ?auto_10135 ?auto_10134 ) ) ( AVAILABLE ?auto_10138 ) ( ON ?auto_10135 ?auto_10133 ) ( not ( = ?auto_10133 ?auto_10135 ) ) ( not ( = ?auto_10133 ?auto_10134 ) ) ( TRUCK-AT ?auto_10140 ?auto_10137 ) ( not ( = ?auto_10137 ?auto_10139 ) ) ( HOIST-AT ?auto_10136 ?auto_10137 ) ( not ( = ?auto_10138 ?auto_10136 ) ) ( AVAILABLE ?auto_10136 ) ( SURFACE-AT ?auto_10134 ?auto_10137 ) ( ON ?auto_10134 ?auto_10141 ) ( CLEAR ?auto_10134 ) ( not ( = ?auto_10135 ?auto_10141 ) ) ( not ( = ?auto_10134 ?auto_10141 ) ) ( not ( = ?auto_10133 ?auto_10141 ) ) ( ON ?auto_10132 ?auto_10131 ) ( ON ?auto_10133 ?auto_10132 ) ( not ( = ?auto_10131 ?auto_10132 ) ) ( not ( = ?auto_10131 ?auto_10133 ) ) ( not ( = ?auto_10131 ?auto_10135 ) ) ( not ( = ?auto_10131 ?auto_10134 ) ) ( not ( = ?auto_10131 ?auto_10141 ) ) ( not ( = ?auto_10132 ?auto_10133 ) ) ( not ( = ?auto_10132 ?auto_10135 ) ) ( not ( = ?auto_10132 ?auto_10134 ) ) ( not ( = ?auto_10132 ?auto_10141 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10133 ?auto_10135 ?auto_10134 )
      ( MAKE-4CRATE-VERIFY ?auto_10131 ?auto_10132 ?auto_10133 ?auto_10135 ?auto_10134 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10170 - SURFACE
      ?auto_10171 - SURFACE
      ?auto_10172 - SURFACE
      ?auto_10174 - SURFACE
      ?auto_10173 - SURFACE
    )
    :vars
    (
      ?auto_10176 - HOIST
      ?auto_10175 - PLACE
      ?auto_10180 - PLACE
      ?auto_10178 - HOIST
      ?auto_10177 - SURFACE
      ?auto_10179 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10176 ?auto_10175 ) ( SURFACE-AT ?auto_10174 ?auto_10175 ) ( CLEAR ?auto_10174 ) ( IS-CRATE ?auto_10173 ) ( not ( = ?auto_10174 ?auto_10173 ) ) ( AVAILABLE ?auto_10176 ) ( ON ?auto_10174 ?auto_10172 ) ( not ( = ?auto_10172 ?auto_10174 ) ) ( not ( = ?auto_10172 ?auto_10173 ) ) ( not ( = ?auto_10180 ?auto_10175 ) ) ( HOIST-AT ?auto_10178 ?auto_10180 ) ( not ( = ?auto_10176 ?auto_10178 ) ) ( AVAILABLE ?auto_10178 ) ( SURFACE-AT ?auto_10173 ?auto_10180 ) ( ON ?auto_10173 ?auto_10177 ) ( CLEAR ?auto_10173 ) ( not ( = ?auto_10174 ?auto_10177 ) ) ( not ( = ?auto_10173 ?auto_10177 ) ) ( not ( = ?auto_10172 ?auto_10177 ) ) ( TRUCK-AT ?auto_10179 ?auto_10175 ) ( ON ?auto_10171 ?auto_10170 ) ( ON ?auto_10172 ?auto_10171 ) ( not ( = ?auto_10170 ?auto_10171 ) ) ( not ( = ?auto_10170 ?auto_10172 ) ) ( not ( = ?auto_10170 ?auto_10174 ) ) ( not ( = ?auto_10170 ?auto_10173 ) ) ( not ( = ?auto_10170 ?auto_10177 ) ) ( not ( = ?auto_10171 ?auto_10172 ) ) ( not ( = ?auto_10171 ?auto_10174 ) ) ( not ( = ?auto_10171 ?auto_10173 ) ) ( not ( = ?auto_10171 ?auto_10177 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10172 ?auto_10174 ?auto_10173 )
      ( MAKE-4CRATE-VERIFY ?auto_10170 ?auto_10171 ?auto_10172 ?auto_10174 ?auto_10173 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10209 - SURFACE
      ?auto_10210 - SURFACE
      ?auto_10211 - SURFACE
      ?auto_10213 - SURFACE
      ?auto_10212 - SURFACE
    )
    :vars
    (
      ?auto_10218 - HOIST
      ?auto_10214 - PLACE
      ?auto_10216 - PLACE
      ?auto_10217 - HOIST
      ?auto_10219 - SURFACE
      ?auto_10215 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10218 ?auto_10214 ) ( IS-CRATE ?auto_10212 ) ( not ( = ?auto_10213 ?auto_10212 ) ) ( not ( = ?auto_10211 ?auto_10213 ) ) ( not ( = ?auto_10211 ?auto_10212 ) ) ( not ( = ?auto_10216 ?auto_10214 ) ) ( HOIST-AT ?auto_10217 ?auto_10216 ) ( not ( = ?auto_10218 ?auto_10217 ) ) ( AVAILABLE ?auto_10217 ) ( SURFACE-AT ?auto_10212 ?auto_10216 ) ( ON ?auto_10212 ?auto_10219 ) ( CLEAR ?auto_10212 ) ( not ( = ?auto_10213 ?auto_10219 ) ) ( not ( = ?auto_10212 ?auto_10219 ) ) ( not ( = ?auto_10211 ?auto_10219 ) ) ( TRUCK-AT ?auto_10215 ?auto_10214 ) ( SURFACE-AT ?auto_10211 ?auto_10214 ) ( CLEAR ?auto_10211 ) ( LIFTING ?auto_10218 ?auto_10213 ) ( IS-CRATE ?auto_10213 ) ( ON ?auto_10210 ?auto_10209 ) ( ON ?auto_10211 ?auto_10210 ) ( not ( = ?auto_10209 ?auto_10210 ) ) ( not ( = ?auto_10209 ?auto_10211 ) ) ( not ( = ?auto_10209 ?auto_10213 ) ) ( not ( = ?auto_10209 ?auto_10212 ) ) ( not ( = ?auto_10209 ?auto_10219 ) ) ( not ( = ?auto_10210 ?auto_10211 ) ) ( not ( = ?auto_10210 ?auto_10213 ) ) ( not ( = ?auto_10210 ?auto_10212 ) ) ( not ( = ?auto_10210 ?auto_10219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10211 ?auto_10213 ?auto_10212 )
      ( MAKE-4CRATE-VERIFY ?auto_10209 ?auto_10210 ?auto_10211 ?auto_10213 ?auto_10212 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_10248 - SURFACE
      ?auto_10249 - SURFACE
      ?auto_10250 - SURFACE
      ?auto_10252 - SURFACE
      ?auto_10251 - SURFACE
    )
    :vars
    (
      ?auto_10255 - HOIST
      ?auto_10257 - PLACE
      ?auto_10253 - PLACE
      ?auto_10254 - HOIST
      ?auto_10256 - SURFACE
      ?auto_10258 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_10255 ?auto_10257 ) ( IS-CRATE ?auto_10251 ) ( not ( = ?auto_10252 ?auto_10251 ) ) ( not ( = ?auto_10250 ?auto_10252 ) ) ( not ( = ?auto_10250 ?auto_10251 ) ) ( not ( = ?auto_10253 ?auto_10257 ) ) ( HOIST-AT ?auto_10254 ?auto_10253 ) ( not ( = ?auto_10255 ?auto_10254 ) ) ( AVAILABLE ?auto_10254 ) ( SURFACE-AT ?auto_10251 ?auto_10253 ) ( ON ?auto_10251 ?auto_10256 ) ( CLEAR ?auto_10251 ) ( not ( = ?auto_10252 ?auto_10256 ) ) ( not ( = ?auto_10251 ?auto_10256 ) ) ( not ( = ?auto_10250 ?auto_10256 ) ) ( TRUCK-AT ?auto_10258 ?auto_10257 ) ( SURFACE-AT ?auto_10250 ?auto_10257 ) ( CLEAR ?auto_10250 ) ( IS-CRATE ?auto_10252 ) ( AVAILABLE ?auto_10255 ) ( IN ?auto_10252 ?auto_10258 ) ( ON ?auto_10249 ?auto_10248 ) ( ON ?auto_10250 ?auto_10249 ) ( not ( = ?auto_10248 ?auto_10249 ) ) ( not ( = ?auto_10248 ?auto_10250 ) ) ( not ( = ?auto_10248 ?auto_10252 ) ) ( not ( = ?auto_10248 ?auto_10251 ) ) ( not ( = ?auto_10248 ?auto_10256 ) ) ( not ( = ?auto_10249 ?auto_10250 ) ) ( not ( = ?auto_10249 ?auto_10252 ) ) ( not ( = ?auto_10249 ?auto_10251 ) ) ( not ( = ?auto_10249 ?auto_10256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_10250 ?auto_10252 ?auto_10251 )
      ( MAKE-4CRATE-VERIFY ?auto_10248 ?auto_10249 ?auto_10250 ?auto_10252 ?auto_10251 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_10749 - SURFACE
      ?auto_10750 - SURFACE
    )
    :vars
    (
      ?auto_10756 - HOIST
      ?auto_10754 - PLACE
      ?auto_10755 - SURFACE
      ?auto_10752 - TRUCK
      ?auto_10751 - PLACE
      ?auto_10753 - HOIST
      ?auto_10757 - SURFACE
      ?auto_10758 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_10756 ?auto_10754 ) ( SURFACE-AT ?auto_10749 ?auto_10754 ) ( CLEAR ?auto_10749 ) ( IS-CRATE ?auto_10750 ) ( not ( = ?auto_10749 ?auto_10750 ) ) ( AVAILABLE ?auto_10756 ) ( ON ?auto_10749 ?auto_10755 ) ( not ( = ?auto_10755 ?auto_10749 ) ) ( not ( = ?auto_10755 ?auto_10750 ) ) ( TRUCK-AT ?auto_10752 ?auto_10751 ) ( not ( = ?auto_10751 ?auto_10754 ) ) ( HOIST-AT ?auto_10753 ?auto_10751 ) ( not ( = ?auto_10756 ?auto_10753 ) ) ( SURFACE-AT ?auto_10750 ?auto_10751 ) ( ON ?auto_10750 ?auto_10757 ) ( CLEAR ?auto_10750 ) ( not ( = ?auto_10749 ?auto_10757 ) ) ( not ( = ?auto_10750 ?auto_10757 ) ) ( not ( = ?auto_10755 ?auto_10757 ) ) ( LIFTING ?auto_10753 ?auto_10758 ) ( IS-CRATE ?auto_10758 ) ( not ( = ?auto_10749 ?auto_10758 ) ) ( not ( = ?auto_10750 ?auto_10758 ) ) ( not ( = ?auto_10755 ?auto_10758 ) ) ( not ( = ?auto_10757 ?auto_10758 ) ) )
    :subtasks
    ( ( !LOAD ?auto_10753 ?auto_10758 ?auto_10752 ?auto_10751 )
      ( MAKE-1CRATE ?auto_10749 ?auto_10750 )
      ( MAKE-1CRATE-VERIFY ?auto_10749 ?auto_10750 ) )
  )

)

