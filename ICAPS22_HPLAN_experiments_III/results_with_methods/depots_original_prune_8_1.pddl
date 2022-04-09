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
      ?auto_112296 - SURFACE
      ?auto_112297 - SURFACE
    )
    :vars
    (
      ?auto_112298 - HOIST
      ?auto_112299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112298 ?auto_112299 ) ( SURFACE-AT ?auto_112296 ?auto_112299 ) ( CLEAR ?auto_112296 ) ( LIFTING ?auto_112298 ?auto_112297 ) ( IS-CRATE ?auto_112297 ) ( not ( = ?auto_112296 ?auto_112297 ) ) )
    :subtasks
    ( ( !DROP ?auto_112298 ?auto_112297 ?auto_112296 ?auto_112299 )
      ( MAKE-1CRATE-VERIFY ?auto_112296 ?auto_112297 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112300 - SURFACE
      ?auto_112301 - SURFACE
    )
    :vars
    (
      ?auto_112302 - HOIST
      ?auto_112303 - PLACE
      ?auto_112304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112302 ?auto_112303 ) ( SURFACE-AT ?auto_112300 ?auto_112303 ) ( CLEAR ?auto_112300 ) ( IS-CRATE ?auto_112301 ) ( not ( = ?auto_112300 ?auto_112301 ) ) ( TRUCK-AT ?auto_112304 ?auto_112303 ) ( AVAILABLE ?auto_112302 ) ( IN ?auto_112301 ?auto_112304 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112302 ?auto_112301 ?auto_112304 ?auto_112303 )
      ( MAKE-1CRATE ?auto_112300 ?auto_112301 )
      ( MAKE-1CRATE-VERIFY ?auto_112300 ?auto_112301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112305 - SURFACE
      ?auto_112306 - SURFACE
    )
    :vars
    (
      ?auto_112309 - HOIST
      ?auto_112307 - PLACE
      ?auto_112308 - TRUCK
      ?auto_112310 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112309 ?auto_112307 ) ( SURFACE-AT ?auto_112305 ?auto_112307 ) ( CLEAR ?auto_112305 ) ( IS-CRATE ?auto_112306 ) ( not ( = ?auto_112305 ?auto_112306 ) ) ( AVAILABLE ?auto_112309 ) ( IN ?auto_112306 ?auto_112308 ) ( TRUCK-AT ?auto_112308 ?auto_112310 ) ( not ( = ?auto_112310 ?auto_112307 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112308 ?auto_112310 ?auto_112307 )
      ( MAKE-1CRATE ?auto_112305 ?auto_112306 )
      ( MAKE-1CRATE-VERIFY ?auto_112305 ?auto_112306 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112311 - SURFACE
      ?auto_112312 - SURFACE
    )
    :vars
    (
      ?auto_112313 - HOIST
      ?auto_112316 - PLACE
      ?auto_112315 - TRUCK
      ?auto_112314 - PLACE
      ?auto_112317 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112313 ?auto_112316 ) ( SURFACE-AT ?auto_112311 ?auto_112316 ) ( CLEAR ?auto_112311 ) ( IS-CRATE ?auto_112312 ) ( not ( = ?auto_112311 ?auto_112312 ) ) ( AVAILABLE ?auto_112313 ) ( TRUCK-AT ?auto_112315 ?auto_112314 ) ( not ( = ?auto_112314 ?auto_112316 ) ) ( HOIST-AT ?auto_112317 ?auto_112314 ) ( LIFTING ?auto_112317 ?auto_112312 ) ( not ( = ?auto_112313 ?auto_112317 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112317 ?auto_112312 ?auto_112315 ?auto_112314 )
      ( MAKE-1CRATE ?auto_112311 ?auto_112312 )
      ( MAKE-1CRATE-VERIFY ?auto_112311 ?auto_112312 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112318 - SURFACE
      ?auto_112319 - SURFACE
    )
    :vars
    (
      ?auto_112323 - HOIST
      ?auto_112320 - PLACE
      ?auto_112321 - TRUCK
      ?auto_112322 - PLACE
      ?auto_112324 - HOIST
      ?auto_112325 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112323 ?auto_112320 ) ( SURFACE-AT ?auto_112318 ?auto_112320 ) ( CLEAR ?auto_112318 ) ( IS-CRATE ?auto_112319 ) ( not ( = ?auto_112318 ?auto_112319 ) ) ( AVAILABLE ?auto_112323 ) ( TRUCK-AT ?auto_112321 ?auto_112322 ) ( not ( = ?auto_112322 ?auto_112320 ) ) ( HOIST-AT ?auto_112324 ?auto_112322 ) ( not ( = ?auto_112323 ?auto_112324 ) ) ( AVAILABLE ?auto_112324 ) ( SURFACE-AT ?auto_112319 ?auto_112322 ) ( ON ?auto_112319 ?auto_112325 ) ( CLEAR ?auto_112319 ) ( not ( = ?auto_112318 ?auto_112325 ) ) ( not ( = ?auto_112319 ?auto_112325 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112324 ?auto_112319 ?auto_112325 ?auto_112322 )
      ( MAKE-1CRATE ?auto_112318 ?auto_112319 )
      ( MAKE-1CRATE-VERIFY ?auto_112318 ?auto_112319 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112326 - SURFACE
      ?auto_112327 - SURFACE
    )
    :vars
    (
      ?auto_112329 - HOIST
      ?auto_112332 - PLACE
      ?auto_112328 - PLACE
      ?auto_112331 - HOIST
      ?auto_112333 - SURFACE
      ?auto_112330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112329 ?auto_112332 ) ( SURFACE-AT ?auto_112326 ?auto_112332 ) ( CLEAR ?auto_112326 ) ( IS-CRATE ?auto_112327 ) ( not ( = ?auto_112326 ?auto_112327 ) ) ( AVAILABLE ?auto_112329 ) ( not ( = ?auto_112328 ?auto_112332 ) ) ( HOIST-AT ?auto_112331 ?auto_112328 ) ( not ( = ?auto_112329 ?auto_112331 ) ) ( AVAILABLE ?auto_112331 ) ( SURFACE-AT ?auto_112327 ?auto_112328 ) ( ON ?auto_112327 ?auto_112333 ) ( CLEAR ?auto_112327 ) ( not ( = ?auto_112326 ?auto_112333 ) ) ( not ( = ?auto_112327 ?auto_112333 ) ) ( TRUCK-AT ?auto_112330 ?auto_112332 ) )
    :subtasks
    ( ( !DRIVE ?auto_112330 ?auto_112332 ?auto_112328 )
      ( MAKE-1CRATE ?auto_112326 ?auto_112327 )
      ( MAKE-1CRATE-VERIFY ?auto_112326 ?auto_112327 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112343 - SURFACE
      ?auto_112344 - SURFACE
      ?auto_112345 - SURFACE
    )
    :vars
    (
      ?auto_112347 - HOIST
      ?auto_112346 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112347 ?auto_112346 ) ( SURFACE-AT ?auto_112344 ?auto_112346 ) ( CLEAR ?auto_112344 ) ( LIFTING ?auto_112347 ?auto_112345 ) ( IS-CRATE ?auto_112345 ) ( not ( = ?auto_112344 ?auto_112345 ) ) ( ON ?auto_112344 ?auto_112343 ) ( not ( = ?auto_112343 ?auto_112344 ) ) ( not ( = ?auto_112343 ?auto_112345 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112344 ?auto_112345 )
      ( MAKE-2CRATE-VERIFY ?auto_112343 ?auto_112344 ?auto_112345 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112353 - SURFACE
      ?auto_112354 - SURFACE
      ?auto_112355 - SURFACE
    )
    :vars
    (
      ?auto_112357 - HOIST
      ?auto_112356 - PLACE
      ?auto_112358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112357 ?auto_112356 ) ( SURFACE-AT ?auto_112354 ?auto_112356 ) ( CLEAR ?auto_112354 ) ( IS-CRATE ?auto_112355 ) ( not ( = ?auto_112354 ?auto_112355 ) ) ( TRUCK-AT ?auto_112358 ?auto_112356 ) ( AVAILABLE ?auto_112357 ) ( IN ?auto_112355 ?auto_112358 ) ( ON ?auto_112354 ?auto_112353 ) ( not ( = ?auto_112353 ?auto_112354 ) ) ( not ( = ?auto_112353 ?auto_112355 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112354 ?auto_112355 )
      ( MAKE-2CRATE-VERIFY ?auto_112353 ?auto_112354 ?auto_112355 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112359 - SURFACE
      ?auto_112360 - SURFACE
    )
    :vars
    (
      ?auto_112362 - HOIST
      ?auto_112364 - PLACE
      ?auto_112363 - TRUCK
      ?auto_112361 - SURFACE
      ?auto_112365 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112362 ?auto_112364 ) ( SURFACE-AT ?auto_112359 ?auto_112364 ) ( CLEAR ?auto_112359 ) ( IS-CRATE ?auto_112360 ) ( not ( = ?auto_112359 ?auto_112360 ) ) ( AVAILABLE ?auto_112362 ) ( IN ?auto_112360 ?auto_112363 ) ( ON ?auto_112359 ?auto_112361 ) ( not ( = ?auto_112361 ?auto_112359 ) ) ( not ( = ?auto_112361 ?auto_112360 ) ) ( TRUCK-AT ?auto_112363 ?auto_112365 ) ( not ( = ?auto_112365 ?auto_112364 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112363 ?auto_112365 ?auto_112364 )
      ( MAKE-2CRATE ?auto_112361 ?auto_112359 ?auto_112360 )
      ( MAKE-1CRATE-VERIFY ?auto_112359 ?auto_112360 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112366 - SURFACE
      ?auto_112367 - SURFACE
      ?auto_112368 - SURFACE
    )
    :vars
    (
      ?auto_112370 - HOIST
      ?auto_112371 - PLACE
      ?auto_112372 - TRUCK
      ?auto_112369 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112370 ?auto_112371 ) ( SURFACE-AT ?auto_112367 ?auto_112371 ) ( CLEAR ?auto_112367 ) ( IS-CRATE ?auto_112368 ) ( not ( = ?auto_112367 ?auto_112368 ) ) ( AVAILABLE ?auto_112370 ) ( IN ?auto_112368 ?auto_112372 ) ( ON ?auto_112367 ?auto_112366 ) ( not ( = ?auto_112366 ?auto_112367 ) ) ( not ( = ?auto_112366 ?auto_112368 ) ) ( TRUCK-AT ?auto_112372 ?auto_112369 ) ( not ( = ?auto_112369 ?auto_112371 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112367 ?auto_112368 )
      ( MAKE-2CRATE-VERIFY ?auto_112366 ?auto_112367 ?auto_112368 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112373 - SURFACE
      ?auto_112374 - SURFACE
    )
    :vars
    (
      ?auto_112376 - HOIST
      ?auto_112379 - PLACE
      ?auto_112375 - SURFACE
      ?auto_112378 - TRUCK
      ?auto_112377 - PLACE
      ?auto_112380 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112376 ?auto_112379 ) ( SURFACE-AT ?auto_112373 ?auto_112379 ) ( CLEAR ?auto_112373 ) ( IS-CRATE ?auto_112374 ) ( not ( = ?auto_112373 ?auto_112374 ) ) ( AVAILABLE ?auto_112376 ) ( ON ?auto_112373 ?auto_112375 ) ( not ( = ?auto_112375 ?auto_112373 ) ) ( not ( = ?auto_112375 ?auto_112374 ) ) ( TRUCK-AT ?auto_112378 ?auto_112377 ) ( not ( = ?auto_112377 ?auto_112379 ) ) ( HOIST-AT ?auto_112380 ?auto_112377 ) ( LIFTING ?auto_112380 ?auto_112374 ) ( not ( = ?auto_112376 ?auto_112380 ) ) )
    :subtasks
    ( ( !LOAD ?auto_112380 ?auto_112374 ?auto_112378 ?auto_112377 )
      ( MAKE-2CRATE ?auto_112375 ?auto_112373 ?auto_112374 )
      ( MAKE-1CRATE-VERIFY ?auto_112373 ?auto_112374 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112381 - SURFACE
      ?auto_112382 - SURFACE
      ?auto_112383 - SURFACE
    )
    :vars
    (
      ?auto_112387 - HOIST
      ?auto_112384 - PLACE
      ?auto_112386 - TRUCK
      ?auto_112385 - PLACE
      ?auto_112388 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112387 ?auto_112384 ) ( SURFACE-AT ?auto_112382 ?auto_112384 ) ( CLEAR ?auto_112382 ) ( IS-CRATE ?auto_112383 ) ( not ( = ?auto_112382 ?auto_112383 ) ) ( AVAILABLE ?auto_112387 ) ( ON ?auto_112382 ?auto_112381 ) ( not ( = ?auto_112381 ?auto_112382 ) ) ( not ( = ?auto_112381 ?auto_112383 ) ) ( TRUCK-AT ?auto_112386 ?auto_112385 ) ( not ( = ?auto_112385 ?auto_112384 ) ) ( HOIST-AT ?auto_112388 ?auto_112385 ) ( LIFTING ?auto_112388 ?auto_112383 ) ( not ( = ?auto_112387 ?auto_112388 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112382 ?auto_112383 )
      ( MAKE-2CRATE-VERIFY ?auto_112381 ?auto_112382 ?auto_112383 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112389 - SURFACE
      ?auto_112390 - SURFACE
    )
    :vars
    (
      ?auto_112396 - HOIST
      ?auto_112392 - PLACE
      ?auto_112393 - SURFACE
      ?auto_112395 - TRUCK
      ?auto_112394 - PLACE
      ?auto_112391 - HOIST
      ?auto_112397 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112396 ?auto_112392 ) ( SURFACE-AT ?auto_112389 ?auto_112392 ) ( CLEAR ?auto_112389 ) ( IS-CRATE ?auto_112390 ) ( not ( = ?auto_112389 ?auto_112390 ) ) ( AVAILABLE ?auto_112396 ) ( ON ?auto_112389 ?auto_112393 ) ( not ( = ?auto_112393 ?auto_112389 ) ) ( not ( = ?auto_112393 ?auto_112390 ) ) ( TRUCK-AT ?auto_112395 ?auto_112394 ) ( not ( = ?auto_112394 ?auto_112392 ) ) ( HOIST-AT ?auto_112391 ?auto_112394 ) ( not ( = ?auto_112396 ?auto_112391 ) ) ( AVAILABLE ?auto_112391 ) ( SURFACE-AT ?auto_112390 ?auto_112394 ) ( ON ?auto_112390 ?auto_112397 ) ( CLEAR ?auto_112390 ) ( not ( = ?auto_112389 ?auto_112397 ) ) ( not ( = ?auto_112390 ?auto_112397 ) ) ( not ( = ?auto_112393 ?auto_112397 ) ) )
    :subtasks
    ( ( !LIFT ?auto_112391 ?auto_112390 ?auto_112397 ?auto_112394 )
      ( MAKE-2CRATE ?auto_112393 ?auto_112389 ?auto_112390 )
      ( MAKE-1CRATE-VERIFY ?auto_112389 ?auto_112390 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112398 - SURFACE
      ?auto_112399 - SURFACE
      ?auto_112400 - SURFACE
    )
    :vars
    (
      ?auto_112404 - HOIST
      ?auto_112403 - PLACE
      ?auto_112406 - TRUCK
      ?auto_112401 - PLACE
      ?auto_112402 - HOIST
      ?auto_112405 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112404 ?auto_112403 ) ( SURFACE-AT ?auto_112399 ?auto_112403 ) ( CLEAR ?auto_112399 ) ( IS-CRATE ?auto_112400 ) ( not ( = ?auto_112399 ?auto_112400 ) ) ( AVAILABLE ?auto_112404 ) ( ON ?auto_112399 ?auto_112398 ) ( not ( = ?auto_112398 ?auto_112399 ) ) ( not ( = ?auto_112398 ?auto_112400 ) ) ( TRUCK-AT ?auto_112406 ?auto_112401 ) ( not ( = ?auto_112401 ?auto_112403 ) ) ( HOIST-AT ?auto_112402 ?auto_112401 ) ( not ( = ?auto_112404 ?auto_112402 ) ) ( AVAILABLE ?auto_112402 ) ( SURFACE-AT ?auto_112400 ?auto_112401 ) ( ON ?auto_112400 ?auto_112405 ) ( CLEAR ?auto_112400 ) ( not ( = ?auto_112399 ?auto_112405 ) ) ( not ( = ?auto_112400 ?auto_112405 ) ) ( not ( = ?auto_112398 ?auto_112405 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112399 ?auto_112400 )
      ( MAKE-2CRATE-VERIFY ?auto_112398 ?auto_112399 ?auto_112400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112407 - SURFACE
      ?auto_112408 - SURFACE
    )
    :vars
    (
      ?auto_112414 - HOIST
      ?auto_112411 - PLACE
      ?auto_112409 - SURFACE
      ?auto_112413 - PLACE
      ?auto_112410 - HOIST
      ?auto_112412 - SURFACE
      ?auto_112415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112414 ?auto_112411 ) ( SURFACE-AT ?auto_112407 ?auto_112411 ) ( CLEAR ?auto_112407 ) ( IS-CRATE ?auto_112408 ) ( not ( = ?auto_112407 ?auto_112408 ) ) ( AVAILABLE ?auto_112414 ) ( ON ?auto_112407 ?auto_112409 ) ( not ( = ?auto_112409 ?auto_112407 ) ) ( not ( = ?auto_112409 ?auto_112408 ) ) ( not ( = ?auto_112413 ?auto_112411 ) ) ( HOIST-AT ?auto_112410 ?auto_112413 ) ( not ( = ?auto_112414 ?auto_112410 ) ) ( AVAILABLE ?auto_112410 ) ( SURFACE-AT ?auto_112408 ?auto_112413 ) ( ON ?auto_112408 ?auto_112412 ) ( CLEAR ?auto_112408 ) ( not ( = ?auto_112407 ?auto_112412 ) ) ( not ( = ?auto_112408 ?auto_112412 ) ) ( not ( = ?auto_112409 ?auto_112412 ) ) ( TRUCK-AT ?auto_112415 ?auto_112411 ) )
    :subtasks
    ( ( !DRIVE ?auto_112415 ?auto_112411 ?auto_112413 )
      ( MAKE-2CRATE ?auto_112409 ?auto_112407 ?auto_112408 )
      ( MAKE-1CRATE-VERIFY ?auto_112407 ?auto_112408 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112416 - SURFACE
      ?auto_112417 - SURFACE
      ?auto_112418 - SURFACE
    )
    :vars
    (
      ?auto_112420 - HOIST
      ?auto_112419 - PLACE
      ?auto_112422 - PLACE
      ?auto_112423 - HOIST
      ?auto_112424 - SURFACE
      ?auto_112421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112420 ?auto_112419 ) ( SURFACE-AT ?auto_112417 ?auto_112419 ) ( CLEAR ?auto_112417 ) ( IS-CRATE ?auto_112418 ) ( not ( = ?auto_112417 ?auto_112418 ) ) ( AVAILABLE ?auto_112420 ) ( ON ?auto_112417 ?auto_112416 ) ( not ( = ?auto_112416 ?auto_112417 ) ) ( not ( = ?auto_112416 ?auto_112418 ) ) ( not ( = ?auto_112422 ?auto_112419 ) ) ( HOIST-AT ?auto_112423 ?auto_112422 ) ( not ( = ?auto_112420 ?auto_112423 ) ) ( AVAILABLE ?auto_112423 ) ( SURFACE-AT ?auto_112418 ?auto_112422 ) ( ON ?auto_112418 ?auto_112424 ) ( CLEAR ?auto_112418 ) ( not ( = ?auto_112417 ?auto_112424 ) ) ( not ( = ?auto_112418 ?auto_112424 ) ) ( not ( = ?auto_112416 ?auto_112424 ) ) ( TRUCK-AT ?auto_112421 ?auto_112419 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112417 ?auto_112418 )
      ( MAKE-2CRATE-VERIFY ?auto_112416 ?auto_112417 ?auto_112418 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112425 - SURFACE
      ?auto_112426 - SURFACE
    )
    :vars
    (
      ?auto_112427 - HOIST
      ?auto_112432 - PLACE
      ?auto_112429 - SURFACE
      ?auto_112433 - PLACE
      ?auto_112428 - HOIST
      ?auto_112431 - SURFACE
      ?auto_112430 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112427 ?auto_112432 ) ( IS-CRATE ?auto_112426 ) ( not ( = ?auto_112425 ?auto_112426 ) ) ( not ( = ?auto_112429 ?auto_112425 ) ) ( not ( = ?auto_112429 ?auto_112426 ) ) ( not ( = ?auto_112433 ?auto_112432 ) ) ( HOIST-AT ?auto_112428 ?auto_112433 ) ( not ( = ?auto_112427 ?auto_112428 ) ) ( AVAILABLE ?auto_112428 ) ( SURFACE-AT ?auto_112426 ?auto_112433 ) ( ON ?auto_112426 ?auto_112431 ) ( CLEAR ?auto_112426 ) ( not ( = ?auto_112425 ?auto_112431 ) ) ( not ( = ?auto_112426 ?auto_112431 ) ) ( not ( = ?auto_112429 ?auto_112431 ) ) ( TRUCK-AT ?auto_112430 ?auto_112432 ) ( SURFACE-AT ?auto_112429 ?auto_112432 ) ( CLEAR ?auto_112429 ) ( LIFTING ?auto_112427 ?auto_112425 ) ( IS-CRATE ?auto_112425 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112429 ?auto_112425 )
      ( MAKE-2CRATE ?auto_112429 ?auto_112425 ?auto_112426 )
      ( MAKE-1CRATE-VERIFY ?auto_112425 ?auto_112426 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112434 - SURFACE
      ?auto_112435 - SURFACE
      ?auto_112436 - SURFACE
    )
    :vars
    (
      ?auto_112442 - HOIST
      ?auto_112440 - PLACE
      ?auto_112438 - PLACE
      ?auto_112439 - HOIST
      ?auto_112441 - SURFACE
      ?auto_112437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112442 ?auto_112440 ) ( IS-CRATE ?auto_112436 ) ( not ( = ?auto_112435 ?auto_112436 ) ) ( not ( = ?auto_112434 ?auto_112435 ) ) ( not ( = ?auto_112434 ?auto_112436 ) ) ( not ( = ?auto_112438 ?auto_112440 ) ) ( HOIST-AT ?auto_112439 ?auto_112438 ) ( not ( = ?auto_112442 ?auto_112439 ) ) ( AVAILABLE ?auto_112439 ) ( SURFACE-AT ?auto_112436 ?auto_112438 ) ( ON ?auto_112436 ?auto_112441 ) ( CLEAR ?auto_112436 ) ( not ( = ?auto_112435 ?auto_112441 ) ) ( not ( = ?auto_112436 ?auto_112441 ) ) ( not ( = ?auto_112434 ?auto_112441 ) ) ( TRUCK-AT ?auto_112437 ?auto_112440 ) ( SURFACE-AT ?auto_112434 ?auto_112440 ) ( CLEAR ?auto_112434 ) ( LIFTING ?auto_112442 ?auto_112435 ) ( IS-CRATE ?auto_112435 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112435 ?auto_112436 )
      ( MAKE-2CRATE-VERIFY ?auto_112434 ?auto_112435 ?auto_112436 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112443 - SURFACE
      ?auto_112444 - SURFACE
    )
    :vars
    (
      ?auto_112445 - HOIST
      ?auto_112448 - PLACE
      ?auto_112449 - SURFACE
      ?auto_112446 - PLACE
      ?auto_112450 - HOIST
      ?auto_112451 - SURFACE
      ?auto_112447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112445 ?auto_112448 ) ( IS-CRATE ?auto_112444 ) ( not ( = ?auto_112443 ?auto_112444 ) ) ( not ( = ?auto_112449 ?auto_112443 ) ) ( not ( = ?auto_112449 ?auto_112444 ) ) ( not ( = ?auto_112446 ?auto_112448 ) ) ( HOIST-AT ?auto_112450 ?auto_112446 ) ( not ( = ?auto_112445 ?auto_112450 ) ) ( AVAILABLE ?auto_112450 ) ( SURFACE-AT ?auto_112444 ?auto_112446 ) ( ON ?auto_112444 ?auto_112451 ) ( CLEAR ?auto_112444 ) ( not ( = ?auto_112443 ?auto_112451 ) ) ( not ( = ?auto_112444 ?auto_112451 ) ) ( not ( = ?auto_112449 ?auto_112451 ) ) ( TRUCK-AT ?auto_112447 ?auto_112448 ) ( SURFACE-AT ?auto_112449 ?auto_112448 ) ( CLEAR ?auto_112449 ) ( IS-CRATE ?auto_112443 ) ( AVAILABLE ?auto_112445 ) ( IN ?auto_112443 ?auto_112447 ) )
    :subtasks
    ( ( !UNLOAD ?auto_112445 ?auto_112443 ?auto_112447 ?auto_112448 )
      ( MAKE-2CRATE ?auto_112449 ?auto_112443 ?auto_112444 )
      ( MAKE-1CRATE-VERIFY ?auto_112443 ?auto_112444 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_112452 - SURFACE
      ?auto_112453 - SURFACE
      ?auto_112454 - SURFACE
    )
    :vars
    (
      ?auto_112460 - HOIST
      ?auto_112457 - PLACE
      ?auto_112455 - PLACE
      ?auto_112459 - HOIST
      ?auto_112458 - SURFACE
      ?auto_112456 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112460 ?auto_112457 ) ( IS-CRATE ?auto_112454 ) ( not ( = ?auto_112453 ?auto_112454 ) ) ( not ( = ?auto_112452 ?auto_112453 ) ) ( not ( = ?auto_112452 ?auto_112454 ) ) ( not ( = ?auto_112455 ?auto_112457 ) ) ( HOIST-AT ?auto_112459 ?auto_112455 ) ( not ( = ?auto_112460 ?auto_112459 ) ) ( AVAILABLE ?auto_112459 ) ( SURFACE-AT ?auto_112454 ?auto_112455 ) ( ON ?auto_112454 ?auto_112458 ) ( CLEAR ?auto_112454 ) ( not ( = ?auto_112453 ?auto_112458 ) ) ( not ( = ?auto_112454 ?auto_112458 ) ) ( not ( = ?auto_112452 ?auto_112458 ) ) ( TRUCK-AT ?auto_112456 ?auto_112457 ) ( SURFACE-AT ?auto_112452 ?auto_112457 ) ( CLEAR ?auto_112452 ) ( IS-CRATE ?auto_112453 ) ( AVAILABLE ?auto_112460 ) ( IN ?auto_112453 ?auto_112456 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112453 ?auto_112454 )
      ( MAKE-2CRATE-VERIFY ?auto_112452 ?auto_112453 ?auto_112454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_112497 - SURFACE
      ?auto_112498 - SURFACE
    )
    :vars
    (
      ?auto_112504 - HOIST
      ?auto_112500 - PLACE
      ?auto_112505 - SURFACE
      ?auto_112501 - PLACE
      ?auto_112503 - HOIST
      ?auto_112499 - SURFACE
      ?auto_112502 - TRUCK
      ?auto_112506 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112504 ?auto_112500 ) ( SURFACE-AT ?auto_112497 ?auto_112500 ) ( CLEAR ?auto_112497 ) ( IS-CRATE ?auto_112498 ) ( not ( = ?auto_112497 ?auto_112498 ) ) ( AVAILABLE ?auto_112504 ) ( ON ?auto_112497 ?auto_112505 ) ( not ( = ?auto_112505 ?auto_112497 ) ) ( not ( = ?auto_112505 ?auto_112498 ) ) ( not ( = ?auto_112501 ?auto_112500 ) ) ( HOIST-AT ?auto_112503 ?auto_112501 ) ( not ( = ?auto_112504 ?auto_112503 ) ) ( AVAILABLE ?auto_112503 ) ( SURFACE-AT ?auto_112498 ?auto_112501 ) ( ON ?auto_112498 ?auto_112499 ) ( CLEAR ?auto_112498 ) ( not ( = ?auto_112497 ?auto_112499 ) ) ( not ( = ?auto_112498 ?auto_112499 ) ) ( not ( = ?auto_112505 ?auto_112499 ) ) ( TRUCK-AT ?auto_112502 ?auto_112506 ) ( not ( = ?auto_112506 ?auto_112500 ) ) ( not ( = ?auto_112501 ?auto_112506 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_112502 ?auto_112506 ?auto_112500 )
      ( MAKE-1CRATE ?auto_112497 ?auto_112498 )
      ( MAKE-1CRATE-VERIFY ?auto_112497 ?auto_112498 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112536 - SURFACE
      ?auto_112537 - SURFACE
      ?auto_112538 - SURFACE
      ?auto_112539 - SURFACE
    )
    :vars
    (
      ?auto_112541 - HOIST
      ?auto_112540 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112541 ?auto_112540 ) ( SURFACE-AT ?auto_112538 ?auto_112540 ) ( CLEAR ?auto_112538 ) ( LIFTING ?auto_112541 ?auto_112539 ) ( IS-CRATE ?auto_112539 ) ( not ( = ?auto_112538 ?auto_112539 ) ) ( ON ?auto_112537 ?auto_112536 ) ( ON ?auto_112538 ?auto_112537 ) ( not ( = ?auto_112536 ?auto_112537 ) ) ( not ( = ?auto_112536 ?auto_112538 ) ) ( not ( = ?auto_112536 ?auto_112539 ) ) ( not ( = ?auto_112537 ?auto_112538 ) ) ( not ( = ?auto_112537 ?auto_112539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_112538 ?auto_112539 )
      ( MAKE-3CRATE-VERIFY ?auto_112536 ?auto_112537 ?auto_112538 ?auto_112539 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112553 - SURFACE
      ?auto_112554 - SURFACE
      ?auto_112555 - SURFACE
      ?auto_112556 - SURFACE
    )
    :vars
    (
      ?auto_112559 - HOIST
      ?auto_112557 - PLACE
      ?auto_112558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112559 ?auto_112557 ) ( SURFACE-AT ?auto_112555 ?auto_112557 ) ( CLEAR ?auto_112555 ) ( IS-CRATE ?auto_112556 ) ( not ( = ?auto_112555 ?auto_112556 ) ) ( TRUCK-AT ?auto_112558 ?auto_112557 ) ( AVAILABLE ?auto_112559 ) ( IN ?auto_112556 ?auto_112558 ) ( ON ?auto_112555 ?auto_112554 ) ( not ( = ?auto_112554 ?auto_112555 ) ) ( not ( = ?auto_112554 ?auto_112556 ) ) ( ON ?auto_112554 ?auto_112553 ) ( not ( = ?auto_112553 ?auto_112554 ) ) ( not ( = ?auto_112553 ?auto_112555 ) ) ( not ( = ?auto_112553 ?auto_112556 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112554 ?auto_112555 ?auto_112556 )
      ( MAKE-3CRATE-VERIFY ?auto_112553 ?auto_112554 ?auto_112555 ?auto_112556 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112574 - SURFACE
      ?auto_112575 - SURFACE
      ?auto_112576 - SURFACE
      ?auto_112577 - SURFACE
    )
    :vars
    (
      ?auto_112579 - HOIST
      ?auto_112578 - PLACE
      ?auto_112581 - TRUCK
      ?auto_112580 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112579 ?auto_112578 ) ( SURFACE-AT ?auto_112576 ?auto_112578 ) ( CLEAR ?auto_112576 ) ( IS-CRATE ?auto_112577 ) ( not ( = ?auto_112576 ?auto_112577 ) ) ( AVAILABLE ?auto_112579 ) ( IN ?auto_112577 ?auto_112581 ) ( ON ?auto_112576 ?auto_112575 ) ( not ( = ?auto_112575 ?auto_112576 ) ) ( not ( = ?auto_112575 ?auto_112577 ) ) ( TRUCK-AT ?auto_112581 ?auto_112580 ) ( not ( = ?auto_112580 ?auto_112578 ) ) ( ON ?auto_112575 ?auto_112574 ) ( not ( = ?auto_112574 ?auto_112575 ) ) ( not ( = ?auto_112574 ?auto_112576 ) ) ( not ( = ?auto_112574 ?auto_112577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112575 ?auto_112576 ?auto_112577 )
      ( MAKE-3CRATE-VERIFY ?auto_112574 ?auto_112575 ?auto_112576 ?auto_112577 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112598 - SURFACE
      ?auto_112599 - SURFACE
      ?auto_112600 - SURFACE
      ?auto_112601 - SURFACE
    )
    :vars
    (
      ?auto_112604 - HOIST
      ?auto_112605 - PLACE
      ?auto_112603 - TRUCK
      ?auto_112602 - PLACE
      ?auto_112606 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_112604 ?auto_112605 ) ( SURFACE-AT ?auto_112600 ?auto_112605 ) ( CLEAR ?auto_112600 ) ( IS-CRATE ?auto_112601 ) ( not ( = ?auto_112600 ?auto_112601 ) ) ( AVAILABLE ?auto_112604 ) ( ON ?auto_112600 ?auto_112599 ) ( not ( = ?auto_112599 ?auto_112600 ) ) ( not ( = ?auto_112599 ?auto_112601 ) ) ( TRUCK-AT ?auto_112603 ?auto_112602 ) ( not ( = ?auto_112602 ?auto_112605 ) ) ( HOIST-AT ?auto_112606 ?auto_112602 ) ( LIFTING ?auto_112606 ?auto_112601 ) ( not ( = ?auto_112604 ?auto_112606 ) ) ( ON ?auto_112599 ?auto_112598 ) ( not ( = ?auto_112598 ?auto_112599 ) ) ( not ( = ?auto_112598 ?auto_112600 ) ) ( not ( = ?auto_112598 ?auto_112601 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112599 ?auto_112600 ?auto_112601 )
      ( MAKE-3CRATE-VERIFY ?auto_112598 ?auto_112599 ?auto_112600 ?auto_112601 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112625 - SURFACE
      ?auto_112626 - SURFACE
      ?auto_112627 - SURFACE
      ?auto_112628 - SURFACE
    )
    :vars
    (
      ?auto_112630 - HOIST
      ?auto_112634 - PLACE
      ?auto_112629 - TRUCK
      ?auto_112632 - PLACE
      ?auto_112631 - HOIST
      ?auto_112633 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_112630 ?auto_112634 ) ( SURFACE-AT ?auto_112627 ?auto_112634 ) ( CLEAR ?auto_112627 ) ( IS-CRATE ?auto_112628 ) ( not ( = ?auto_112627 ?auto_112628 ) ) ( AVAILABLE ?auto_112630 ) ( ON ?auto_112627 ?auto_112626 ) ( not ( = ?auto_112626 ?auto_112627 ) ) ( not ( = ?auto_112626 ?auto_112628 ) ) ( TRUCK-AT ?auto_112629 ?auto_112632 ) ( not ( = ?auto_112632 ?auto_112634 ) ) ( HOIST-AT ?auto_112631 ?auto_112632 ) ( not ( = ?auto_112630 ?auto_112631 ) ) ( AVAILABLE ?auto_112631 ) ( SURFACE-AT ?auto_112628 ?auto_112632 ) ( ON ?auto_112628 ?auto_112633 ) ( CLEAR ?auto_112628 ) ( not ( = ?auto_112627 ?auto_112633 ) ) ( not ( = ?auto_112628 ?auto_112633 ) ) ( not ( = ?auto_112626 ?auto_112633 ) ) ( ON ?auto_112626 ?auto_112625 ) ( not ( = ?auto_112625 ?auto_112626 ) ) ( not ( = ?auto_112625 ?auto_112627 ) ) ( not ( = ?auto_112625 ?auto_112628 ) ) ( not ( = ?auto_112625 ?auto_112633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112626 ?auto_112627 ?auto_112628 )
      ( MAKE-3CRATE-VERIFY ?auto_112625 ?auto_112626 ?auto_112627 ?auto_112628 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112653 - SURFACE
      ?auto_112654 - SURFACE
      ?auto_112655 - SURFACE
      ?auto_112656 - SURFACE
    )
    :vars
    (
      ?auto_112660 - HOIST
      ?auto_112657 - PLACE
      ?auto_112659 - PLACE
      ?auto_112662 - HOIST
      ?auto_112661 - SURFACE
      ?auto_112658 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112660 ?auto_112657 ) ( SURFACE-AT ?auto_112655 ?auto_112657 ) ( CLEAR ?auto_112655 ) ( IS-CRATE ?auto_112656 ) ( not ( = ?auto_112655 ?auto_112656 ) ) ( AVAILABLE ?auto_112660 ) ( ON ?auto_112655 ?auto_112654 ) ( not ( = ?auto_112654 ?auto_112655 ) ) ( not ( = ?auto_112654 ?auto_112656 ) ) ( not ( = ?auto_112659 ?auto_112657 ) ) ( HOIST-AT ?auto_112662 ?auto_112659 ) ( not ( = ?auto_112660 ?auto_112662 ) ) ( AVAILABLE ?auto_112662 ) ( SURFACE-AT ?auto_112656 ?auto_112659 ) ( ON ?auto_112656 ?auto_112661 ) ( CLEAR ?auto_112656 ) ( not ( = ?auto_112655 ?auto_112661 ) ) ( not ( = ?auto_112656 ?auto_112661 ) ) ( not ( = ?auto_112654 ?auto_112661 ) ) ( TRUCK-AT ?auto_112658 ?auto_112657 ) ( ON ?auto_112654 ?auto_112653 ) ( not ( = ?auto_112653 ?auto_112654 ) ) ( not ( = ?auto_112653 ?auto_112655 ) ) ( not ( = ?auto_112653 ?auto_112656 ) ) ( not ( = ?auto_112653 ?auto_112661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112654 ?auto_112655 ?auto_112656 )
      ( MAKE-3CRATE-VERIFY ?auto_112653 ?auto_112654 ?auto_112655 ?auto_112656 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112681 - SURFACE
      ?auto_112682 - SURFACE
      ?auto_112683 - SURFACE
      ?auto_112684 - SURFACE
    )
    :vars
    (
      ?auto_112690 - HOIST
      ?auto_112689 - PLACE
      ?auto_112685 - PLACE
      ?auto_112686 - HOIST
      ?auto_112688 - SURFACE
      ?auto_112687 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112690 ?auto_112689 ) ( IS-CRATE ?auto_112684 ) ( not ( = ?auto_112683 ?auto_112684 ) ) ( not ( = ?auto_112682 ?auto_112683 ) ) ( not ( = ?auto_112682 ?auto_112684 ) ) ( not ( = ?auto_112685 ?auto_112689 ) ) ( HOIST-AT ?auto_112686 ?auto_112685 ) ( not ( = ?auto_112690 ?auto_112686 ) ) ( AVAILABLE ?auto_112686 ) ( SURFACE-AT ?auto_112684 ?auto_112685 ) ( ON ?auto_112684 ?auto_112688 ) ( CLEAR ?auto_112684 ) ( not ( = ?auto_112683 ?auto_112688 ) ) ( not ( = ?auto_112684 ?auto_112688 ) ) ( not ( = ?auto_112682 ?auto_112688 ) ) ( TRUCK-AT ?auto_112687 ?auto_112689 ) ( SURFACE-AT ?auto_112682 ?auto_112689 ) ( CLEAR ?auto_112682 ) ( LIFTING ?auto_112690 ?auto_112683 ) ( IS-CRATE ?auto_112683 ) ( ON ?auto_112682 ?auto_112681 ) ( not ( = ?auto_112681 ?auto_112682 ) ) ( not ( = ?auto_112681 ?auto_112683 ) ) ( not ( = ?auto_112681 ?auto_112684 ) ) ( not ( = ?auto_112681 ?auto_112688 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112682 ?auto_112683 ?auto_112684 )
      ( MAKE-3CRATE-VERIFY ?auto_112681 ?auto_112682 ?auto_112683 ?auto_112684 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_112709 - SURFACE
      ?auto_112710 - SURFACE
      ?auto_112711 - SURFACE
      ?auto_112712 - SURFACE
    )
    :vars
    (
      ?auto_112717 - HOIST
      ?auto_112716 - PLACE
      ?auto_112714 - PLACE
      ?auto_112713 - HOIST
      ?auto_112718 - SURFACE
      ?auto_112715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_112717 ?auto_112716 ) ( IS-CRATE ?auto_112712 ) ( not ( = ?auto_112711 ?auto_112712 ) ) ( not ( = ?auto_112710 ?auto_112711 ) ) ( not ( = ?auto_112710 ?auto_112712 ) ) ( not ( = ?auto_112714 ?auto_112716 ) ) ( HOIST-AT ?auto_112713 ?auto_112714 ) ( not ( = ?auto_112717 ?auto_112713 ) ) ( AVAILABLE ?auto_112713 ) ( SURFACE-AT ?auto_112712 ?auto_112714 ) ( ON ?auto_112712 ?auto_112718 ) ( CLEAR ?auto_112712 ) ( not ( = ?auto_112711 ?auto_112718 ) ) ( not ( = ?auto_112712 ?auto_112718 ) ) ( not ( = ?auto_112710 ?auto_112718 ) ) ( TRUCK-AT ?auto_112715 ?auto_112716 ) ( SURFACE-AT ?auto_112710 ?auto_112716 ) ( CLEAR ?auto_112710 ) ( IS-CRATE ?auto_112711 ) ( AVAILABLE ?auto_112717 ) ( IN ?auto_112711 ?auto_112715 ) ( ON ?auto_112710 ?auto_112709 ) ( not ( = ?auto_112709 ?auto_112710 ) ) ( not ( = ?auto_112709 ?auto_112711 ) ) ( not ( = ?auto_112709 ?auto_112712 ) ) ( not ( = ?auto_112709 ?auto_112718 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_112710 ?auto_112711 ?auto_112712 )
      ( MAKE-3CRATE-VERIFY ?auto_112709 ?auto_112710 ?auto_112711 ?auto_112712 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113000 - SURFACE
      ?auto_113001 - SURFACE
      ?auto_113002 - SURFACE
      ?auto_113004 - SURFACE
      ?auto_113003 - SURFACE
    )
    :vars
    (
      ?auto_113005 - HOIST
      ?auto_113006 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113005 ?auto_113006 ) ( SURFACE-AT ?auto_113004 ?auto_113006 ) ( CLEAR ?auto_113004 ) ( LIFTING ?auto_113005 ?auto_113003 ) ( IS-CRATE ?auto_113003 ) ( not ( = ?auto_113004 ?auto_113003 ) ) ( ON ?auto_113001 ?auto_113000 ) ( ON ?auto_113002 ?auto_113001 ) ( ON ?auto_113004 ?auto_113002 ) ( not ( = ?auto_113000 ?auto_113001 ) ) ( not ( = ?auto_113000 ?auto_113002 ) ) ( not ( = ?auto_113000 ?auto_113004 ) ) ( not ( = ?auto_113000 ?auto_113003 ) ) ( not ( = ?auto_113001 ?auto_113002 ) ) ( not ( = ?auto_113001 ?auto_113004 ) ) ( not ( = ?auto_113001 ?auto_113003 ) ) ( not ( = ?auto_113002 ?auto_113004 ) ) ( not ( = ?auto_113002 ?auto_113003 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113004 ?auto_113003 )
      ( MAKE-4CRATE-VERIFY ?auto_113000 ?auto_113001 ?auto_113002 ?auto_113004 ?auto_113003 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113025 - SURFACE
      ?auto_113026 - SURFACE
      ?auto_113027 - SURFACE
      ?auto_113029 - SURFACE
      ?auto_113028 - SURFACE
    )
    :vars
    (
      ?auto_113030 - HOIST
      ?auto_113031 - PLACE
      ?auto_113032 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113030 ?auto_113031 ) ( SURFACE-AT ?auto_113029 ?auto_113031 ) ( CLEAR ?auto_113029 ) ( IS-CRATE ?auto_113028 ) ( not ( = ?auto_113029 ?auto_113028 ) ) ( TRUCK-AT ?auto_113032 ?auto_113031 ) ( AVAILABLE ?auto_113030 ) ( IN ?auto_113028 ?auto_113032 ) ( ON ?auto_113029 ?auto_113027 ) ( not ( = ?auto_113027 ?auto_113029 ) ) ( not ( = ?auto_113027 ?auto_113028 ) ) ( ON ?auto_113026 ?auto_113025 ) ( ON ?auto_113027 ?auto_113026 ) ( not ( = ?auto_113025 ?auto_113026 ) ) ( not ( = ?auto_113025 ?auto_113027 ) ) ( not ( = ?auto_113025 ?auto_113029 ) ) ( not ( = ?auto_113025 ?auto_113028 ) ) ( not ( = ?auto_113026 ?auto_113027 ) ) ( not ( = ?auto_113026 ?auto_113029 ) ) ( not ( = ?auto_113026 ?auto_113028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113027 ?auto_113029 ?auto_113028 )
      ( MAKE-4CRATE-VERIFY ?auto_113025 ?auto_113026 ?auto_113027 ?auto_113029 ?auto_113028 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113055 - SURFACE
      ?auto_113056 - SURFACE
      ?auto_113057 - SURFACE
      ?auto_113059 - SURFACE
      ?auto_113058 - SURFACE
    )
    :vars
    (
      ?auto_113062 - HOIST
      ?auto_113063 - PLACE
      ?auto_113060 - TRUCK
      ?auto_113061 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113062 ?auto_113063 ) ( SURFACE-AT ?auto_113059 ?auto_113063 ) ( CLEAR ?auto_113059 ) ( IS-CRATE ?auto_113058 ) ( not ( = ?auto_113059 ?auto_113058 ) ) ( AVAILABLE ?auto_113062 ) ( IN ?auto_113058 ?auto_113060 ) ( ON ?auto_113059 ?auto_113057 ) ( not ( = ?auto_113057 ?auto_113059 ) ) ( not ( = ?auto_113057 ?auto_113058 ) ) ( TRUCK-AT ?auto_113060 ?auto_113061 ) ( not ( = ?auto_113061 ?auto_113063 ) ) ( ON ?auto_113056 ?auto_113055 ) ( ON ?auto_113057 ?auto_113056 ) ( not ( = ?auto_113055 ?auto_113056 ) ) ( not ( = ?auto_113055 ?auto_113057 ) ) ( not ( = ?auto_113055 ?auto_113059 ) ) ( not ( = ?auto_113055 ?auto_113058 ) ) ( not ( = ?auto_113056 ?auto_113057 ) ) ( not ( = ?auto_113056 ?auto_113059 ) ) ( not ( = ?auto_113056 ?auto_113058 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113057 ?auto_113059 ?auto_113058 )
      ( MAKE-4CRATE-VERIFY ?auto_113055 ?auto_113056 ?auto_113057 ?auto_113059 ?auto_113058 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113089 - SURFACE
      ?auto_113090 - SURFACE
      ?auto_113091 - SURFACE
      ?auto_113093 - SURFACE
      ?auto_113092 - SURFACE
    )
    :vars
    (
      ?auto_113095 - HOIST
      ?auto_113094 - PLACE
      ?auto_113098 - TRUCK
      ?auto_113097 - PLACE
      ?auto_113096 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_113095 ?auto_113094 ) ( SURFACE-AT ?auto_113093 ?auto_113094 ) ( CLEAR ?auto_113093 ) ( IS-CRATE ?auto_113092 ) ( not ( = ?auto_113093 ?auto_113092 ) ) ( AVAILABLE ?auto_113095 ) ( ON ?auto_113093 ?auto_113091 ) ( not ( = ?auto_113091 ?auto_113093 ) ) ( not ( = ?auto_113091 ?auto_113092 ) ) ( TRUCK-AT ?auto_113098 ?auto_113097 ) ( not ( = ?auto_113097 ?auto_113094 ) ) ( HOIST-AT ?auto_113096 ?auto_113097 ) ( LIFTING ?auto_113096 ?auto_113092 ) ( not ( = ?auto_113095 ?auto_113096 ) ) ( ON ?auto_113090 ?auto_113089 ) ( ON ?auto_113091 ?auto_113090 ) ( not ( = ?auto_113089 ?auto_113090 ) ) ( not ( = ?auto_113089 ?auto_113091 ) ) ( not ( = ?auto_113089 ?auto_113093 ) ) ( not ( = ?auto_113089 ?auto_113092 ) ) ( not ( = ?auto_113090 ?auto_113091 ) ) ( not ( = ?auto_113090 ?auto_113093 ) ) ( not ( = ?auto_113090 ?auto_113092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113091 ?auto_113093 ?auto_113092 )
      ( MAKE-4CRATE-VERIFY ?auto_113089 ?auto_113090 ?auto_113091 ?auto_113093 ?auto_113092 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113127 - SURFACE
      ?auto_113128 - SURFACE
      ?auto_113129 - SURFACE
      ?auto_113131 - SURFACE
      ?auto_113130 - SURFACE
    )
    :vars
    (
      ?auto_113134 - HOIST
      ?auto_113137 - PLACE
      ?auto_113136 - TRUCK
      ?auto_113133 - PLACE
      ?auto_113135 - HOIST
      ?auto_113132 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113134 ?auto_113137 ) ( SURFACE-AT ?auto_113131 ?auto_113137 ) ( CLEAR ?auto_113131 ) ( IS-CRATE ?auto_113130 ) ( not ( = ?auto_113131 ?auto_113130 ) ) ( AVAILABLE ?auto_113134 ) ( ON ?auto_113131 ?auto_113129 ) ( not ( = ?auto_113129 ?auto_113131 ) ) ( not ( = ?auto_113129 ?auto_113130 ) ) ( TRUCK-AT ?auto_113136 ?auto_113133 ) ( not ( = ?auto_113133 ?auto_113137 ) ) ( HOIST-AT ?auto_113135 ?auto_113133 ) ( not ( = ?auto_113134 ?auto_113135 ) ) ( AVAILABLE ?auto_113135 ) ( SURFACE-AT ?auto_113130 ?auto_113133 ) ( ON ?auto_113130 ?auto_113132 ) ( CLEAR ?auto_113130 ) ( not ( = ?auto_113131 ?auto_113132 ) ) ( not ( = ?auto_113130 ?auto_113132 ) ) ( not ( = ?auto_113129 ?auto_113132 ) ) ( ON ?auto_113128 ?auto_113127 ) ( ON ?auto_113129 ?auto_113128 ) ( not ( = ?auto_113127 ?auto_113128 ) ) ( not ( = ?auto_113127 ?auto_113129 ) ) ( not ( = ?auto_113127 ?auto_113131 ) ) ( not ( = ?auto_113127 ?auto_113130 ) ) ( not ( = ?auto_113127 ?auto_113132 ) ) ( not ( = ?auto_113128 ?auto_113129 ) ) ( not ( = ?auto_113128 ?auto_113131 ) ) ( not ( = ?auto_113128 ?auto_113130 ) ) ( not ( = ?auto_113128 ?auto_113132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113129 ?auto_113131 ?auto_113130 )
      ( MAKE-4CRATE-VERIFY ?auto_113127 ?auto_113128 ?auto_113129 ?auto_113131 ?auto_113130 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113166 - SURFACE
      ?auto_113167 - SURFACE
      ?auto_113168 - SURFACE
      ?auto_113170 - SURFACE
      ?auto_113169 - SURFACE
    )
    :vars
    (
      ?auto_113175 - HOIST
      ?auto_113174 - PLACE
      ?auto_113171 - PLACE
      ?auto_113173 - HOIST
      ?auto_113176 - SURFACE
      ?auto_113172 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113175 ?auto_113174 ) ( SURFACE-AT ?auto_113170 ?auto_113174 ) ( CLEAR ?auto_113170 ) ( IS-CRATE ?auto_113169 ) ( not ( = ?auto_113170 ?auto_113169 ) ) ( AVAILABLE ?auto_113175 ) ( ON ?auto_113170 ?auto_113168 ) ( not ( = ?auto_113168 ?auto_113170 ) ) ( not ( = ?auto_113168 ?auto_113169 ) ) ( not ( = ?auto_113171 ?auto_113174 ) ) ( HOIST-AT ?auto_113173 ?auto_113171 ) ( not ( = ?auto_113175 ?auto_113173 ) ) ( AVAILABLE ?auto_113173 ) ( SURFACE-AT ?auto_113169 ?auto_113171 ) ( ON ?auto_113169 ?auto_113176 ) ( CLEAR ?auto_113169 ) ( not ( = ?auto_113170 ?auto_113176 ) ) ( not ( = ?auto_113169 ?auto_113176 ) ) ( not ( = ?auto_113168 ?auto_113176 ) ) ( TRUCK-AT ?auto_113172 ?auto_113174 ) ( ON ?auto_113167 ?auto_113166 ) ( ON ?auto_113168 ?auto_113167 ) ( not ( = ?auto_113166 ?auto_113167 ) ) ( not ( = ?auto_113166 ?auto_113168 ) ) ( not ( = ?auto_113166 ?auto_113170 ) ) ( not ( = ?auto_113166 ?auto_113169 ) ) ( not ( = ?auto_113166 ?auto_113176 ) ) ( not ( = ?auto_113167 ?auto_113168 ) ) ( not ( = ?auto_113167 ?auto_113170 ) ) ( not ( = ?auto_113167 ?auto_113169 ) ) ( not ( = ?auto_113167 ?auto_113176 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113168 ?auto_113170 ?auto_113169 )
      ( MAKE-4CRATE-VERIFY ?auto_113166 ?auto_113167 ?auto_113168 ?auto_113170 ?auto_113169 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113205 - SURFACE
      ?auto_113206 - SURFACE
      ?auto_113207 - SURFACE
      ?auto_113209 - SURFACE
      ?auto_113208 - SURFACE
    )
    :vars
    (
      ?auto_113213 - HOIST
      ?auto_113210 - PLACE
      ?auto_113215 - PLACE
      ?auto_113214 - HOIST
      ?auto_113211 - SURFACE
      ?auto_113212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113213 ?auto_113210 ) ( IS-CRATE ?auto_113208 ) ( not ( = ?auto_113209 ?auto_113208 ) ) ( not ( = ?auto_113207 ?auto_113209 ) ) ( not ( = ?auto_113207 ?auto_113208 ) ) ( not ( = ?auto_113215 ?auto_113210 ) ) ( HOIST-AT ?auto_113214 ?auto_113215 ) ( not ( = ?auto_113213 ?auto_113214 ) ) ( AVAILABLE ?auto_113214 ) ( SURFACE-AT ?auto_113208 ?auto_113215 ) ( ON ?auto_113208 ?auto_113211 ) ( CLEAR ?auto_113208 ) ( not ( = ?auto_113209 ?auto_113211 ) ) ( not ( = ?auto_113208 ?auto_113211 ) ) ( not ( = ?auto_113207 ?auto_113211 ) ) ( TRUCK-AT ?auto_113212 ?auto_113210 ) ( SURFACE-AT ?auto_113207 ?auto_113210 ) ( CLEAR ?auto_113207 ) ( LIFTING ?auto_113213 ?auto_113209 ) ( IS-CRATE ?auto_113209 ) ( ON ?auto_113206 ?auto_113205 ) ( ON ?auto_113207 ?auto_113206 ) ( not ( = ?auto_113205 ?auto_113206 ) ) ( not ( = ?auto_113205 ?auto_113207 ) ) ( not ( = ?auto_113205 ?auto_113209 ) ) ( not ( = ?auto_113205 ?auto_113208 ) ) ( not ( = ?auto_113205 ?auto_113211 ) ) ( not ( = ?auto_113206 ?auto_113207 ) ) ( not ( = ?auto_113206 ?auto_113209 ) ) ( not ( = ?auto_113206 ?auto_113208 ) ) ( not ( = ?auto_113206 ?auto_113211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113207 ?auto_113209 ?auto_113208 )
      ( MAKE-4CRATE-VERIFY ?auto_113205 ?auto_113206 ?auto_113207 ?auto_113209 ?auto_113208 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_113244 - SURFACE
      ?auto_113245 - SURFACE
      ?auto_113246 - SURFACE
      ?auto_113248 - SURFACE
      ?auto_113247 - SURFACE
    )
    :vars
    (
      ?auto_113252 - HOIST
      ?auto_113250 - PLACE
      ?auto_113253 - PLACE
      ?auto_113254 - HOIST
      ?auto_113249 - SURFACE
      ?auto_113251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113252 ?auto_113250 ) ( IS-CRATE ?auto_113247 ) ( not ( = ?auto_113248 ?auto_113247 ) ) ( not ( = ?auto_113246 ?auto_113248 ) ) ( not ( = ?auto_113246 ?auto_113247 ) ) ( not ( = ?auto_113253 ?auto_113250 ) ) ( HOIST-AT ?auto_113254 ?auto_113253 ) ( not ( = ?auto_113252 ?auto_113254 ) ) ( AVAILABLE ?auto_113254 ) ( SURFACE-AT ?auto_113247 ?auto_113253 ) ( ON ?auto_113247 ?auto_113249 ) ( CLEAR ?auto_113247 ) ( not ( = ?auto_113248 ?auto_113249 ) ) ( not ( = ?auto_113247 ?auto_113249 ) ) ( not ( = ?auto_113246 ?auto_113249 ) ) ( TRUCK-AT ?auto_113251 ?auto_113250 ) ( SURFACE-AT ?auto_113246 ?auto_113250 ) ( CLEAR ?auto_113246 ) ( IS-CRATE ?auto_113248 ) ( AVAILABLE ?auto_113252 ) ( IN ?auto_113248 ?auto_113251 ) ( ON ?auto_113245 ?auto_113244 ) ( ON ?auto_113246 ?auto_113245 ) ( not ( = ?auto_113244 ?auto_113245 ) ) ( not ( = ?auto_113244 ?auto_113246 ) ) ( not ( = ?auto_113244 ?auto_113248 ) ) ( not ( = ?auto_113244 ?auto_113247 ) ) ( not ( = ?auto_113244 ?auto_113249 ) ) ( not ( = ?auto_113245 ?auto_113246 ) ) ( not ( = ?auto_113245 ?auto_113248 ) ) ( not ( = ?auto_113245 ?auto_113247 ) ) ( not ( = ?auto_113245 ?auto_113249 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113246 ?auto_113248 ?auto_113247 )
      ( MAKE-4CRATE-VERIFY ?auto_113244 ?auto_113245 ?auto_113246 ?auto_113248 ?auto_113247 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_113904 - SURFACE
      ?auto_113905 - SURFACE
      ?auto_113906 - SURFACE
      ?auto_113908 - SURFACE
      ?auto_113907 - SURFACE
      ?auto_113909 - SURFACE
    )
    :vars
    (
      ?auto_113911 - HOIST
      ?auto_113910 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113911 ?auto_113910 ) ( SURFACE-AT ?auto_113907 ?auto_113910 ) ( CLEAR ?auto_113907 ) ( LIFTING ?auto_113911 ?auto_113909 ) ( IS-CRATE ?auto_113909 ) ( not ( = ?auto_113907 ?auto_113909 ) ) ( ON ?auto_113905 ?auto_113904 ) ( ON ?auto_113906 ?auto_113905 ) ( ON ?auto_113908 ?auto_113906 ) ( ON ?auto_113907 ?auto_113908 ) ( not ( = ?auto_113904 ?auto_113905 ) ) ( not ( = ?auto_113904 ?auto_113906 ) ) ( not ( = ?auto_113904 ?auto_113908 ) ) ( not ( = ?auto_113904 ?auto_113907 ) ) ( not ( = ?auto_113904 ?auto_113909 ) ) ( not ( = ?auto_113905 ?auto_113906 ) ) ( not ( = ?auto_113905 ?auto_113908 ) ) ( not ( = ?auto_113905 ?auto_113907 ) ) ( not ( = ?auto_113905 ?auto_113909 ) ) ( not ( = ?auto_113906 ?auto_113908 ) ) ( not ( = ?auto_113906 ?auto_113907 ) ) ( not ( = ?auto_113906 ?auto_113909 ) ) ( not ( = ?auto_113908 ?auto_113907 ) ) ( not ( = ?auto_113908 ?auto_113909 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_113907 ?auto_113909 )
      ( MAKE-5CRATE-VERIFY ?auto_113904 ?auto_113905 ?auto_113906 ?auto_113908 ?auto_113907 ?auto_113909 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_113938 - SURFACE
      ?auto_113939 - SURFACE
      ?auto_113940 - SURFACE
      ?auto_113942 - SURFACE
      ?auto_113941 - SURFACE
      ?auto_113943 - SURFACE
    )
    :vars
    (
      ?auto_113946 - HOIST
      ?auto_113945 - PLACE
      ?auto_113944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_113946 ?auto_113945 ) ( SURFACE-AT ?auto_113941 ?auto_113945 ) ( CLEAR ?auto_113941 ) ( IS-CRATE ?auto_113943 ) ( not ( = ?auto_113941 ?auto_113943 ) ) ( TRUCK-AT ?auto_113944 ?auto_113945 ) ( AVAILABLE ?auto_113946 ) ( IN ?auto_113943 ?auto_113944 ) ( ON ?auto_113941 ?auto_113942 ) ( not ( = ?auto_113942 ?auto_113941 ) ) ( not ( = ?auto_113942 ?auto_113943 ) ) ( ON ?auto_113939 ?auto_113938 ) ( ON ?auto_113940 ?auto_113939 ) ( ON ?auto_113942 ?auto_113940 ) ( not ( = ?auto_113938 ?auto_113939 ) ) ( not ( = ?auto_113938 ?auto_113940 ) ) ( not ( = ?auto_113938 ?auto_113942 ) ) ( not ( = ?auto_113938 ?auto_113941 ) ) ( not ( = ?auto_113938 ?auto_113943 ) ) ( not ( = ?auto_113939 ?auto_113940 ) ) ( not ( = ?auto_113939 ?auto_113942 ) ) ( not ( = ?auto_113939 ?auto_113941 ) ) ( not ( = ?auto_113939 ?auto_113943 ) ) ( not ( = ?auto_113940 ?auto_113942 ) ) ( not ( = ?auto_113940 ?auto_113941 ) ) ( not ( = ?auto_113940 ?auto_113943 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113942 ?auto_113941 ?auto_113943 )
      ( MAKE-5CRATE-VERIFY ?auto_113938 ?auto_113939 ?auto_113940 ?auto_113942 ?auto_113941 ?auto_113943 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_113978 - SURFACE
      ?auto_113979 - SURFACE
      ?auto_113980 - SURFACE
      ?auto_113982 - SURFACE
      ?auto_113981 - SURFACE
      ?auto_113983 - SURFACE
    )
    :vars
    (
      ?auto_113987 - HOIST
      ?auto_113984 - PLACE
      ?auto_113985 - TRUCK
      ?auto_113986 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_113987 ?auto_113984 ) ( SURFACE-AT ?auto_113981 ?auto_113984 ) ( CLEAR ?auto_113981 ) ( IS-CRATE ?auto_113983 ) ( not ( = ?auto_113981 ?auto_113983 ) ) ( AVAILABLE ?auto_113987 ) ( IN ?auto_113983 ?auto_113985 ) ( ON ?auto_113981 ?auto_113982 ) ( not ( = ?auto_113982 ?auto_113981 ) ) ( not ( = ?auto_113982 ?auto_113983 ) ) ( TRUCK-AT ?auto_113985 ?auto_113986 ) ( not ( = ?auto_113986 ?auto_113984 ) ) ( ON ?auto_113979 ?auto_113978 ) ( ON ?auto_113980 ?auto_113979 ) ( ON ?auto_113982 ?auto_113980 ) ( not ( = ?auto_113978 ?auto_113979 ) ) ( not ( = ?auto_113978 ?auto_113980 ) ) ( not ( = ?auto_113978 ?auto_113982 ) ) ( not ( = ?auto_113978 ?auto_113981 ) ) ( not ( = ?auto_113978 ?auto_113983 ) ) ( not ( = ?auto_113979 ?auto_113980 ) ) ( not ( = ?auto_113979 ?auto_113982 ) ) ( not ( = ?auto_113979 ?auto_113981 ) ) ( not ( = ?auto_113979 ?auto_113983 ) ) ( not ( = ?auto_113980 ?auto_113982 ) ) ( not ( = ?auto_113980 ?auto_113981 ) ) ( not ( = ?auto_113980 ?auto_113983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_113982 ?auto_113981 ?auto_113983 )
      ( MAKE-5CRATE-VERIFY ?auto_113978 ?auto_113979 ?auto_113980 ?auto_113982 ?auto_113981 ?auto_113983 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114023 - SURFACE
      ?auto_114024 - SURFACE
      ?auto_114025 - SURFACE
      ?auto_114027 - SURFACE
      ?auto_114026 - SURFACE
      ?auto_114028 - SURFACE
    )
    :vars
    (
      ?auto_114032 - HOIST
      ?auto_114031 - PLACE
      ?auto_114029 - TRUCK
      ?auto_114033 - PLACE
      ?auto_114030 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_114032 ?auto_114031 ) ( SURFACE-AT ?auto_114026 ?auto_114031 ) ( CLEAR ?auto_114026 ) ( IS-CRATE ?auto_114028 ) ( not ( = ?auto_114026 ?auto_114028 ) ) ( AVAILABLE ?auto_114032 ) ( ON ?auto_114026 ?auto_114027 ) ( not ( = ?auto_114027 ?auto_114026 ) ) ( not ( = ?auto_114027 ?auto_114028 ) ) ( TRUCK-AT ?auto_114029 ?auto_114033 ) ( not ( = ?auto_114033 ?auto_114031 ) ) ( HOIST-AT ?auto_114030 ?auto_114033 ) ( LIFTING ?auto_114030 ?auto_114028 ) ( not ( = ?auto_114032 ?auto_114030 ) ) ( ON ?auto_114024 ?auto_114023 ) ( ON ?auto_114025 ?auto_114024 ) ( ON ?auto_114027 ?auto_114025 ) ( not ( = ?auto_114023 ?auto_114024 ) ) ( not ( = ?auto_114023 ?auto_114025 ) ) ( not ( = ?auto_114023 ?auto_114027 ) ) ( not ( = ?auto_114023 ?auto_114026 ) ) ( not ( = ?auto_114023 ?auto_114028 ) ) ( not ( = ?auto_114024 ?auto_114025 ) ) ( not ( = ?auto_114024 ?auto_114027 ) ) ( not ( = ?auto_114024 ?auto_114026 ) ) ( not ( = ?auto_114024 ?auto_114028 ) ) ( not ( = ?auto_114025 ?auto_114027 ) ) ( not ( = ?auto_114025 ?auto_114026 ) ) ( not ( = ?auto_114025 ?auto_114028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114027 ?auto_114026 ?auto_114028 )
      ( MAKE-5CRATE-VERIFY ?auto_114023 ?auto_114024 ?auto_114025 ?auto_114027 ?auto_114026 ?auto_114028 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114073 - SURFACE
      ?auto_114074 - SURFACE
      ?auto_114075 - SURFACE
      ?auto_114077 - SURFACE
      ?auto_114076 - SURFACE
      ?auto_114078 - SURFACE
    )
    :vars
    (
      ?auto_114079 - HOIST
      ?auto_114083 - PLACE
      ?auto_114080 - TRUCK
      ?auto_114084 - PLACE
      ?auto_114082 - HOIST
      ?auto_114081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_114079 ?auto_114083 ) ( SURFACE-AT ?auto_114076 ?auto_114083 ) ( CLEAR ?auto_114076 ) ( IS-CRATE ?auto_114078 ) ( not ( = ?auto_114076 ?auto_114078 ) ) ( AVAILABLE ?auto_114079 ) ( ON ?auto_114076 ?auto_114077 ) ( not ( = ?auto_114077 ?auto_114076 ) ) ( not ( = ?auto_114077 ?auto_114078 ) ) ( TRUCK-AT ?auto_114080 ?auto_114084 ) ( not ( = ?auto_114084 ?auto_114083 ) ) ( HOIST-AT ?auto_114082 ?auto_114084 ) ( not ( = ?auto_114079 ?auto_114082 ) ) ( AVAILABLE ?auto_114082 ) ( SURFACE-AT ?auto_114078 ?auto_114084 ) ( ON ?auto_114078 ?auto_114081 ) ( CLEAR ?auto_114078 ) ( not ( = ?auto_114076 ?auto_114081 ) ) ( not ( = ?auto_114078 ?auto_114081 ) ) ( not ( = ?auto_114077 ?auto_114081 ) ) ( ON ?auto_114074 ?auto_114073 ) ( ON ?auto_114075 ?auto_114074 ) ( ON ?auto_114077 ?auto_114075 ) ( not ( = ?auto_114073 ?auto_114074 ) ) ( not ( = ?auto_114073 ?auto_114075 ) ) ( not ( = ?auto_114073 ?auto_114077 ) ) ( not ( = ?auto_114073 ?auto_114076 ) ) ( not ( = ?auto_114073 ?auto_114078 ) ) ( not ( = ?auto_114073 ?auto_114081 ) ) ( not ( = ?auto_114074 ?auto_114075 ) ) ( not ( = ?auto_114074 ?auto_114077 ) ) ( not ( = ?auto_114074 ?auto_114076 ) ) ( not ( = ?auto_114074 ?auto_114078 ) ) ( not ( = ?auto_114074 ?auto_114081 ) ) ( not ( = ?auto_114075 ?auto_114077 ) ) ( not ( = ?auto_114075 ?auto_114076 ) ) ( not ( = ?auto_114075 ?auto_114078 ) ) ( not ( = ?auto_114075 ?auto_114081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114077 ?auto_114076 ?auto_114078 )
      ( MAKE-5CRATE-VERIFY ?auto_114073 ?auto_114074 ?auto_114075 ?auto_114077 ?auto_114076 ?auto_114078 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114124 - SURFACE
      ?auto_114125 - SURFACE
      ?auto_114126 - SURFACE
      ?auto_114128 - SURFACE
      ?auto_114127 - SURFACE
      ?auto_114129 - SURFACE
    )
    :vars
    (
      ?auto_114132 - HOIST
      ?auto_114134 - PLACE
      ?auto_114133 - PLACE
      ?auto_114131 - HOIST
      ?auto_114130 - SURFACE
      ?auto_114135 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114132 ?auto_114134 ) ( SURFACE-AT ?auto_114127 ?auto_114134 ) ( CLEAR ?auto_114127 ) ( IS-CRATE ?auto_114129 ) ( not ( = ?auto_114127 ?auto_114129 ) ) ( AVAILABLE ?auto_114132 ) ( ON ?auto_114127 ?auto_114128 ) ( not ( = ?auto_114128 ?auto_114127 ) ) ( not ( = ?auto_114128 ?auto_114129 ) ) ( not ( = ?auto_114133 ?auto_114134 ) ) ( HOIST-AT ?auto_114131 ?auto_114133 ) ( not ( = ?auto_114132 ?auto_114131 ) ) ( AVAILABLE ?auto_114131 ) ( SURFACE-AT ?auto_114129 ?auto_114133 ) ( ON ?auto_114129 ?auto_114130 ) ( CLEAR ?auto_114129 ) ( not ( = ?auto_114127 ?auto_114130 ) ) ( not ( = ?auto_114129 ?auto_114130 ) ) ( not ( = ?auto_114128 ?auto_114130 ) ) ( TRUCK-AT ?auto_114135 ?auto_114134 ) ( ON ?auto_114125 ?auto_114124 ) ( ON ?auto_114126 ?auto_114125 ) ( ON ?auto_114128 ?auto_114126 ) ( not ( = ?auto_114124 ?auto_114125 ) ) ( not ( = ?auto_114124 ?auto_114126 ) ) ( not ( = ?auto_114124 ?auto_114128 ) ) ( not ( = ?auto_114124 ?auto_114127 ) ) ( not ( = ?auto_114124 ?auto_114129 ) ) ( not ( = ?auto_114124 ?auto_114130 ) ) ( not ( = ?auto_114125 ?auto_114126 ) ) ( not ( = ?auto_114125 ?auto_114128 ) ) ( not ( = ?auto_114125 ?auto_114127 ) ) ( not ( = ?auto_114125 ?auto_114129 ) ) ( not ( = ?auto_114125 ?auto_114130 ) ) ( not ( = ?auto_114126 ?auto_114128 ) ) ( not ( = ?auto_114126 ?auto_114127 ) ) ( not ( = ?auto_114126 ?auto_114129 ) ) ( not ( = ?auto_114126 ?auto_114130 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114128 ?auto_114127 ?auto_114129 )
      ( MAKE-5CRATE-VERIFY ?auto_114124 ?auto_114125 ?auto_114126 ?auto_114128 ?auto_114127 ?auto_114129 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114175 - SURFACE
      ?auto_114176 - SURFACE
      ?auto_114177 - SURFACE
      ?auto_114179 - SURFACE
      ?auto_114178 - SURFACE
      ?auto_114180 - SURFACE
    )
    :vars
    (
      ?auto_114184 - HOIST
      ?auto_114183 - PLACE
      ?auto_114181 - PLACE
      ?auto_114186 - HOIST
      ?auto_114182 - SURFACE
      ?auto_114185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114184 ?auto_114183 ) ( IS-CRATE ?auto_114180 ) ( not ( = ?auto_114178 ?auto_114180 ) ) ( not ( = ?auto_114179 ?auto_114178 ) ) ( not ( = ?auto_114179 ?auto_114180 ) ) ( not ( = ?auto_114181 ?auto_114183 ) ) ( HOIST-AT ?auto_114186 ?auto_114181 ) ( not ( = ?auto_114184 ?auto_114186 ) ) ( AVAILABLE ?auto_114186 ) ( SURFACE-AT ?auto_114180 ?auto_114181 ) ( ON ?auto_114180 ?auto_114182 ) ( CLEAR ?auto_114180 ) ( not ( = ?auto_114178 ?auto_114182 ) ) ( not ( = ?auto_114180 ?auto_114182 ) ) ( not ( = ?auto_114179 ?auto_114182 ) ) ( TRUCK-AT ?auto_114185 ?auto_114183 ) ( SURFACE-AT ?auto_114179 ?auto_114183 ) ( CLEAR ?auto_114179 ) ( LIFTING ?auto_114184 ?auto_114178 ) ( IS-CRATE ?auto_114178 ) ( ON ?auto_114176 ?auto_114175 ) ( ON ?auto_114177 ?auto_114176 ) ( ON ?auto_114179 ?auto_114177 ) ( not ( = ?auto_114175 ?auto_114176 ) ) ( not ( = ?auto_114175 ?auto_114177 ) ) ( not ( = ?auto_114175 ?auto_114179 ) ) ( not ( = ?auto_114175 ?auto_114178 ) ) ( not ( = ?auto_114175 ?auto_114180 ) ) ( not ( = ?auto_114175 ?auto_114182 ) ) ( not ( = ?auto_114176 ?auto_114177 ) ) ( not ( = ?auto_114176 ?auto_114179 ) ) ( not ( = ?auto_114176 ?auto_114178 ) ) ( not ( = ?auto_114176 ?auto_114180 ) ) ( not ( = ?auto_114176 ?auto_114182 ) ) ( not ( = ?auto_114177 ?auto_114179 ) ) ( not ( = ?auto_114177 ?auto_114178 ) ) ( not ( = ?auto_114177 ?auto_114180 ) ) ( not ( = ?auto_114177 ?auto_114182 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114179 ?auto_114178 ?auto_114180 )
      ( MAKE-5CRATE-VERIFY ?auto_114175 ?auto_114176 ?auto_114177 ?auto_114179 ?auto_114178 ?auto_114180 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_114226 - SURFACE
      ?auto_114227 - SURFACE
      ?auto_114228 - SURFACE
      ?auto_114230 - SURFACE
      ?auto_114229 - SURFACE
      ?auto_114231 - SURFACE
    )
    :vars
    (
      ?auto_114233 - HOIST
      ?auto_114237 - PLACE
      ?auto_114236 - PLACE
      ?auto_114234 - HOIST
      ?auto_114235 - SURFACE
      ?auto_114232 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_114233 ?auto_114237 ) ( IS-CRATE ?auto_114231 ) ( not ( = ?auto_114229 ?auto_114231 ) ) ( not ( = ?auto_114230 ?auto_114229 ) ) ( not ( = ?auto_114230 ?auto_114231 ) ) ( not ( = ?auto_114236 ?auto_114237 ) ) ( HOIST-AT ?auto_114234 ?auto_114236 ) ( not ( = ?auto_114233 ?auto_114234 ) ) ( AVAILABLE ?auto_114234 ) ( SURFACE-AT ?auto_114231 ?auto_114236 ) ( ON ?auto_114231 ?auto_114235 ) ( CLEAR ?auto_114231 ) ( not ( = ?auto_114229 ?auto_114235 ) ) ( not ( = ?auto_114231 ?auto_114235 ) ) ( not ( = ?auto_114230 ?auto_114235 ) ) ( TRUCK-AT ?auto_114232 ?auto_114237 ) ( SURFACE-AT ?auto_114230 ?auto_114237 ) ( CLEAR ?auto_114230 ) ( IS-CRATE ?auto_114229 ) ( AVAILABLE ?auto_114233 ) ( IN ?auto_114229 ?auto_114232 ) ( ON ?auto_114227 ?auto_114226 ) ( ON ?auto_114228 ?auto_114227 ) ( ON ?auto_114230 ?auto_114228 ) ( not ( = ?auto_114226 ?auto_114227 ) ) ( not ( = ?auto_114226 ?auto_114228 ) ) ( not ( = ?auto_114226 ?auto_114230 ) ) ( not ( = ?auto_114226 ?auto_114229 ) ) ( not ( = ?auto_114226 ?auto_114231 ) ) ( not ( = ?auto_114226 ?auto_114235 ) ) ( not ( = ?auto_114227 ?auto_114228 ) ) ( not ( = ?auto_114227 ?auto_114230 ) ) ( not ( = ?auto_114227 ?auto_114229 ) ) ( not ( = ?auto_114227 ?auto_114231 ) ) ( not ( = ?auto_114227 ?auto_114235 ) ) ( not ( = ?auto_114228 ?auto_114230 ) ) ( not ( = ?auto_114228 ?auto_114229 ) ) ( not ( = ?auto_114228 ?auto_114231 ) ) ( not ( = ?auto_114228 ?auto_114235 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_114230 ?auto_114229 ?auto_114231 )
      ( MAKE-5CRATE-VERIFY ?auto_114226 ?auto_114227 ?auto_114228 ?auto_114230 ?auto_114229 ?auto_114231 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115435 - SURFACE
      ?auto_115436 - SURFACE
      ?auto_115437 - SURFACE
      ?auto_115439 - SURFACE
      ?auto_115438 - SURFACE
      ?auto_115440 - SURFACE
      ?auto_115441 - SURFACE
    )
    :vars
    (
      ?auto_115442 - HOIST
      ?auto_115443 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115442 ?auto_115443 ) ( SURFACE-AT ?auto_115440 ?auto_115443 ) ( CLEAR ?auto_115440 ) ( LIFTING ?auto_115442 ?auto_115441 ) ( IS-CRATE ?auto_115441 ) ( not ( = ?auto_115440 ?auto_115441 ) ) ( ON ?auto_115436 ?auto_115435 ) ( ON ?auto_115437 ?auto_115436 ) ( ON ?auto_115439 ?auto_115437 ) ( ON ?auto_115438 ?auto_115439 ) ( ON ?auto_115440 ?auto_115438 ) ( not ( = ?auto_115435 ?auto_115436 ) ) ( not ( = ?auto_115435 ?auto_115437 ) ) ( not ( = ?auto_115435 ?auto_115439 ) ) ( not ( = ?auto_115435 ?auto_115438 ) ) ( not ( = ?auto_115435 ?auto_115440 ) ) ( not ( = ?auto_115435 ?auto_115441 ) ) ( not ( = ?auto_115436 ?auto_115437 ) ) ( not ( = ?auto_115436 ?auto_115439 ) ) ( not ( = ?auto_115436 ?auto_115438 ) ) ( not ( = ?auto_115436 ?auto_115440 ) ) ( not ( = ?auto_115436 ?auto_115441 ) ) ( not ( = ?auto_115437 ?auto_115439 ) ) ( not ( = ?auto_115437 ?auto_115438 ) ) ( not ( = ?auto_115437 ?auto_115440 ) ) ( not ( = ?auto_115437 ?auto_115441 ) ) ( not ( = ?auto_115439 ?auto_115438 ) ) ( not ( = ?auto_115439 ?auto_115440 ) ) ( not ( = ?auto_115439 ?auto_115441 ) ) ( not ( = ?auto_115438 ?auto_115440 ) ) ( not ( = ?auto_115438 ?auto_115441 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_115440 ?auto_115441 )
      ( MAKE-6CRATE-VERIFY ?auto_115435 ?auto_115436 ?auto_115437 ?auto_115439 ?auto_115438 ?auto_115440 ?auto_115441 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115479 - SURFACE
      ?auto_115480 - SURFACE
      ?auto_115481 - SURFACE
      ?auto_115483 - SURFACE
      ?auto_115482 - SURFACE
      ?auto_115484 - SURFACE
      ?auto_115485 - SURFACE
    )
    :vars
    (
      ?auto_115486 - HOIST
      ?auto_115488 - PLACE
      ?auto_115487 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115486 ?auto_115488 ) ( SURFACE-AT ?auto_115484 ?auto_115488 ) ( CLEAR ?auto_115484 ) ( IS-CRATE ?auto_115485 ) ( not ( = ?auto_115484 ?auto_115485 ) ) ( TRUCK-AT ?auto_115487 ?auto_115488 ) ( AVAILABLE ?auto_115486 ) ( IN ?auto_115485 ?auto_115487 ) ( ON ?auto_115484 ?auto_115482 ) ( not ( = ?auto_115482 ?auto_115484 ) ) ( not ( = ?auto_115482 ?auto_115485 ) ) ( ON ?auto_115480 ?auto_115479 ) ( ON ?auto_115481 ?auto_115480 ) ( ON ?auto_115483 ?auto_115481 ) ( ON ?auto_115482 ?auto_115483 ) ( not ( = ?auto_115479 ?auto_115480 ) ) ( not ( = ?auto_115479 ?auto_115481 ) ) ( not ( = ?auto_115479 ?auto_115483 ) ) ( not ( = ?auto_115479 ?auto_115482 ) ) ( not ( = ?auto_115479 ?auto_115484 ) ) ( not ( = ?auto_115479 ?auto_115485 ) ) ( not ( = ?auto_115480 ?auto_115481 ) ) ( not ( = ?auto_115480 ?auto_115483 ) ) ( not ( = ?auto_115480 ?auto_115482 ) ) ( not ( = ?auto_115480 ?auto_115484 ) ) ( not ( = ?auto_115480 ?auto_115485 ) ) ( not ( = ?auto_115481 ?auto_115483 ) ) ( not ( = ?auto_115481 ?auto_115482 ) ) ( not ( = ?auto_115481 ?auto_115484 ) ) ( not ( = ?auto_115481 ?auto_115485 ) ) ( not ( = ?auto_115483 ?auto_115482 ) ) ( not ( = ?auto_115483 ?auto_115484 ) ) ( not ( = ?auto_115483 ?auto_115485 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115482 ?auto_115484 ?auto_115485 )
      ( MAKE-6CRATE-VERIFY ?auto_115479 ?auto_115480 ?auto_115481 ?auto_115483 ?auto_115482 ?auto_115484 ?auto_115485 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115530 - SURFACE
      ?auto_115531 - SURFACE
      ?auto_115532 - SURFACE
      ?auto_115534 - SURFACE
      ?auto_115533 - SURFACE
      ?auto_115535 - SURFACE
      ?auto_115536 - SURFACE
    )
    :vars
    (
      ?auto_115537 - HOIST
      ?auto_115539 - PLACE
      ?auto_115540 - TRUCK
      ?auto_115538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115537 ?auto_115539 ) ( SURFACE-AT ?auto_115535 ?auto_115539 ) ( CLEAR ?auto_115535 ) ( IS-CRATE ?auto_115536 ) ( not ( = ?auto_115535 ?auto_115536 ) ) ( AVAILABLE ?auto_115537 ) ( IN ?auto_115536 ?auto_115540 ) ( ON ?auto_115535 ?auto_115533 ) ( not ( = ?auto_115533 ?auto_115535 ) ) ( not ( = ?auto_115533 ?auto_115536 ) ) ( TRUCK-AT ?auto_115540 ?auto_115538 ) ( not ( = ?auto_115538 ?auto_115539 ) ) ( ON ?auto_115531 ?auto_115530 ) ( ON ?auto_115532 ?auto_115531 ) ( ON ?auto_115534 ?auto_115532 ) ( ON ?auto_115533 ?auto_115534 ) ( not ( = ?auto_115530 ?auto_115531 ) ) ( not ( = ?auto_115530 ?auto_115532 ) ) ( not ( = ?auto_115530 ?auto_115534 ) ) ( not ( = ?auto_115530 ?auto_115533 ) ) ( not ( = ?auto_115530 ?auto_115535 ) ) ( not ( = ?auto_115530 ?auto_115536 ) ) ( not ( = ?auto_115531 ?auto_115532 ) ) ( not ( = ?auto_115531 ?auto_115534 ) ) ( not ( = ?auto_115531 ?auto_115533 ) ) ( not ( = ?auto_115531 ?auto_115535 ) ) ( not ( = ?auto_115531 ?auto_115536 ) ) ( not ( = ?auto_115532 ?auto_115534 ) ) ( not ( = ?auto_115532 ?auto_115533 ) ) ( not ( = ?auto_115532 ?auto_115535 ) ) ( not ( = ?auto_115532 ?auto_115536 ) ) ( not ( = ?auto_115534 ?auto_115533 ) ) ( not ( = ?auto_115534 ?auto_115535 ) ) ( not ( = ?auto_115534 ?auto_115536 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115533 ?auto_115535 ?auto_115536 )
      ( MAKE-6CRATE-VERIFY ?auto_115530 ?auto_115531 ?auto_115532 ?auto_115534 ?auto_115533 ?auto_115535 ?auto_115536 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115587 - SURFACE
      ?auto_115588 - SURFACE
      ?auto_115589 - SURFACE
      ?auto_115591 - SURFACE
      ?auto_115590 - SURFACE
      ?auto_115592 - SURFACE
      ?auto_115593 - SURFACE
    )
    :vars
    (
      ?auto_115595 - HOIST
      ?auto_115597 - PLACE
      ?auto_115594 - TRUCK
      ?auto_115596 - PLACE
      ?auto_115598 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_115595 ?auto_115597 ) ( SURFACE-AT ?auto_115592 ?auto_115597 ) ( CLEAR ?auto_115592 ) ( IS-CRATE ?auto_115593 ) ( not ( = ?auto_115592 ?auto_115593 ) ) ( AVAILABLE ?auto_115595 ) ( ON ?auto_115592 ?auto_115590 ) ( not ( = ?auto_115590 ?auto_115592 ) ) ( not ( = ?auto_115590 ?auto_115593 ) ) ( TRUCK-AT ?auto_115594 ?auto_115596 ) ( not ( = ?auto_115596 ?auto_115597 ) ) ( HOIST-AT ?auto_115598 ?auto_115596 ) ( LIFTING ?auto_115598 ?auto_115593 ) ( not ( = ?auto_115595 ?auto_115598 ) ) ( ON ?auto_115588 ?auto_115587 ) ( ON ?auto_115589 ?auto_115588 ) ( ON ?auto_115591 ?auto_115589 ) ( ON ?auto_115590 ?auto_115591 ) ( not ( = ?auto_115587 ?auto_115588 ) ) ( not ( = ?auto_115587 ?auto_115589 ) ) ( not ( = ?auto_115587 ?auto_115591 ) ) ( not ( = ?auto_115587 ?auto_115590 ) ) ( not ( = ?auto_115587 ?auto_115592 ) ) ( not ( = ?auto_115587 ?auto_115593 ) ) ( not ( = ?auto_115588 ?auto_115589 ) ) ( not ( = ?auto_115588 ?auto_115591 ) ) ( not ( = ?auto_115588 ?auto_115590 ) ) ( not ( = ?auto_115588 ?auto_115592 ) ) ( not ( = ?auto_115588 ?auto_115593 ) ) ( not ( = ?auto_115589 ?auto_115591 ) ) ( not ( = ?auto_115589 ?auto_115590 ) ) ( not ( = ?auto_115589 ?auto_115592 ) ) ( not ( = ?auto_115589 ?auto_115593 ) ) ( not ( = ?auto_115591 ?auto_115590 ) ) ( not ( = ?auto_115591 ?auto_115592 ) ) ( not ( = ?auto_115591 ?auto_115593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115590 ?auto_115592 ?auto_115593 )
      ( MAKE-6CRATE-VERIFY ?auto_115587 ?auto_115588 ?auto_115589 ?auto_115591 ?auto_115590 ?auto_115592 ?auto_115593 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115650 - SURFACE
      ?auto_115651 - SURFACE
      ?auto_115652 - SURFACE
      ?auto_115654 - SURFACE
      ?auto_115653 - SURFACE
      ?auto_115655 - SURFACE
      ?auto_115656 - SURFACE
    )
    :vars
    (
      ?auto_115659 - HOIST
      ?auto_115661 - PLACE
      ?auto_115660 - TRUCK
      ?auto_115658 - PLACE
      ?auto_115662 - HOIST
      ?auto_115657 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_115659 ?auto_115661 ) ( SURFACE-AT ?auto_115655 ?auto_115661 ) ( CLEAR ?auto_115655 ) ( IS-CRATE ?auto_115656 ) ( not ( = ?auto_115655 ?auto_115656 ) ) ( AVAILABLE ?auto_115659 ) ( ON ?auto_115655 ?auto_115653 ) ( not ( = ?auto_115653 ?auto_115655 ) ) ( not ( = ?auto_115653 ?auto_115656 ) ) ( TRUCK-AT ?auto_115660 ?auto_115658 ) ( not ( = ?auto_115658 ?auto_115661 ) ) ( HOIST-AT ?auto_115662 ?auto_115658 ) ( not ( = ?auto_115659 ?auto_115662 ) ) ( AVAILABLE ?auto_115662 ) ( SURFACE-AT ?auto_115656 ?auto_115658 ) ( ON ?auto_115656 ?auto_115657 ) ( CLEAR ?auto_115656 ) ( not ( = ?auto_115655 ?auto_115657 ) ) ( not ( = ?auto_115656 ?auto_115657 ) ) ( not ( = ?auto_115653 ?auto_115657 ) ) ( ON ?auto_115651 ?auto_115650 ) ( ON ?auto_115652 ?auto_115651 ) ( ON ?auto_115654 ?auto_115652 ) ( ON ?auto_115653 ?auto_115654 ) ( not ( = ?auto_115650 ?auto_115651 ) ) ( not ( = ?auto_115650 ?auto_115652 ) ) ( not ( = ?auto_115650 ?auto_115654 ) ) ( not ( = ?auto_115650 ?auto_115653 ) ) ( not ( = ?auto_115650 ?auto_115655 ) ) ( not ( = ?auto_115650 ?auto_115656 ) ) ( not ( = ?auto_115650 ?auto_115657 ) ) ( not ( = ?auto_115651 ?auto_115652 ) ) ( not ( = ?auto_115651 ?auto_115654 ) ) ( not ( = ?auto_115651 ?auto_115653 ) ) ( not ( = ?auto_115651 ?auto_115655 ) ) ( not ( = ?auto_115651 ?auto_115656 ) ) ( not ( = ?auto_115651 ?auto_115657 ) ) ( not ( = ?auto_115652 ?auto_115654 ) ) ( not ( = ?auto_115652 ?auto_115653 ) ) ( not ( = ?auto_115652 ?auto_115655 ) ) ( not ( = ?auto_115652 ?auto_115656 ) ) ( not ( = ?auto_115652 ?auto_115657 ) ) ( not ( = ?auto_115654 ?auto_115653 ) ) ( not ( = ?auto_115654 ?auto_115655 ) ) ( not ( = ?auto_115654 ?auto_115656 ) ) ( not ( = ?auto_115654 ?auto_115657 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115653 ?auto_115655 ?auto_115656 )
      ( MAKE-6CRATE-VERIFY ?auto_115650 ?auto_115651 ?auto_115652 ?auto_115654 ?auto_115653 ?auto_115655 ?auto_115656 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115714 - SURFACE
      ?auto_115715 - SURFACE
      ?auto_115716 - SURFACE
      ?auto_115718 - SURFACE
      ?auto_115717 - SURFACE
      ?auto_115719 - SURFACE
      ?auto_115720 - SURFACE
    )
    :vars
    (
      ?auto_115726 - HOIST
      ?auto_115725 - PLACE
      ?auto_115724 - PLACE
      ?auto_115723 - HOIST
      ?auto_115721 - SURFACE
      ?auto_115722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115726 ?auto_115725 ) ( SURFACE-AT ?auto_115719 ?auto_115725 ) ( CLEAR ?auto_115719 ) ( IS-CRATE ?auto_115720 ) ( not ( = ?auto_115719 ?auto_115720 ) ) ( AVAILABLE ?auto_115726 ) ( ON ?auto_115719 ?auto_115717 ) ( not ( = ?auto_115717 ?auto_115719 ) ) ( not ( = ?auto_115717 ?auto_115720 ) ) ( not ( = ?auto_115724 ?auto_115725 ) ) ( HOIST-AT ?auto_115723 ?auto_115724 ) ( not ( = ?auto_115726 ?auto_115723 ) ) ( AVAILABLE ?auto_115723 ) ( SURFACE-AT ?auto_115720 ?auto_115724 ) ( ON ?auto_115720 ?auto_115721 ) ( CLEAR ?auto_115720 ) ( not ( = ?auto_115719 ?auto_115721 ) ) ( not ( = ?auto_115720 ?auto_115721 ) ) ( not ( = ?auto_115717 ?auto_115721 ) ) ( TRUCK-AT ?auto_115722 ?auto_115725 ) ( ON ?auto_115715 ?auto_115714 ) ( ON ?auto_115716 ?auto_115715 ) ( ON ?auto_115718 ?auto_115716 ) ( ON ?auto_115717 ?auto_115718 ) ( not ( = ?auto_115714 ?auto_115715 ) ) ( not ( = ?auto_115714 ?auto_115716 ) ) ( not ( = ?auto_115714 ?auto_115718 ) ) ( not ( = ?auto_115714 ?auto_115717 ) ) ( not ( = ?auto_115714 ?auto_115719 ) ) ( not ( = ?auto_115714 ?auto_115720 ) ) ( not ( = ?auto_115714 ?auto_115721 ) ) ( not ( = ?auto_115715 ?auto_115716 ) ) ( not ( = ?auto_115715 ?auto_115718 ) ) ( not ( = ?auto_115715 ?auto_115717 ) ) ( not ( = ?auto_115715 ?auto_115719 ) ) ( not ( = ?auto_115715 ?auto_115720 ) ) ( not ( = ?auto_115715 ?auto_115721 ) ) ( not ( = ?auto_115716 ?auto_115718 ) ) ( not ( = ?auto_115716 ?auto_115717 ) ) ( not ( = ?auto_115716 ?auto_115719 ) ) ( not ( = ?auto_115716 ?auto_115720 ) ) ( not ( = ?auto_115716 ?auto_115721 ) ) ( not ( = ?auto_115718 ?auto_115717 ) ) ( not ( = ?auto_115718 ?auto_115719 ) ) ( not ( = ?auto_115718 ?auto_115720 ) ) ( not ( = ?auto_115718 ?auto_115721 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115717 ?auto_115719 ?auto_115720 )
      ( MAKE-6CRATE-VERIFY ?auto_115714 ?auto_115715 ?auto_115716 ?auto_115718 ?auto_115717 ?auto_115719 ?auto_115720 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115778 - SURFACE
      ?auto_115779 - SURFACE
      ?auto_115780 - SURFACE
      ?auto_115782 - SURFACE
      ?auto_115781 - SURFACE
      ?auto_115783 - SURFACE
      ?auto_115784 - SURFACE
    )
    :vars
    (
      ?auto_115785 - HOIST
      ?auto_115787 - PLACE
      ?auto_115790 - PLACE
      ?auto_115786 - HOIST
      ?auto_115789 - SURFACE
      ?auto_115788 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115785 ?auto_115787 ) ( IS-CRATE ?auto_115784 ) ( not ( = ?auto_115783 ?auto_115784 ) ) ( not ( = ?auto_115781 ?auto_115783 ) ) ( not ( = ?auto_115781 ?auto_115784 ) ) ( not ( = ?auto_115790 ?auto_115787 ) ) ( HOIST-AT ?auto_115786 ?auto_115790 ) ( not ( = ?auto_115785 ?auto_115786 ) ) ( AVAILABLE ?auto_115786 ) ( SURFACE-AT ?auto_115784 ?auto_115790 ) ( ON ?auto_115784 ?auto_115789 ) ( CLEAR ?auto_115784 ) ( not ( = ?auto_115783 ?auto_115789 ) ) ( not ( = ?auto_115784 ?auto_115789 ) ) ( not ( = ?auto_115781 ?auto_115789 ) ) ( TRUCK-AT ?auto_115788 ?auto_115787 ) ( SURFACE-AT ?auto_115781 ?auto_115787 ) ( CLEAR ?auto_115781 ) ( LIFTING ?auto_115785 ?auto_115783 ) ( IS-CRATE ?auto_115783 ) ( ON ?auto_115779 ?auto_115778 ) ( ON ?auto_115780 ?auto_115779 ) ( ON ?auto_115782 ?auto_115780 ) ( ON ?auto_115781 ?auto_115782 ) ( not ( = ?auto_115778 ?auto_115779 ) ) ( not ( = ?auto_115778 ?auto_115780 ) ) ( not ( = ?auto_115778 ?auto_115782 ) ) ( not ( = ?auto_115778 ?auto_115781 ) ) ( not ( = ?auto_115778 ?auto_115783 ) ) ( not ( = ?auto_115778 ?auto_115784 ) ) ( not ( = ?auto_115778 ?auto_115789 ) ) ( not ( = ?auto_115779 ?auto_115780 ) ) ( not ( = ?auto_115779 ?auto_115782 ) ) ( not ( = ?auto_115779 ?auto_115781 ) ) ( not ( = ?auto_115779 ?auto_115783 ) ) ( not ( = ?auto_115779 ?auto_115784 ) ) ( not ( = ?auto_115779 ?auto_115789 ) ) ( not ( = ?auto_115780 ?auto_115782 ) ) ( not ( = ?auto_115780 ?auto_115781 ) ) ( not ( = ?auto_115780 ?auto_115783 ) ) ( not ( = ?auto_115780 ?auto_115784 ) ) ( not ( = ?auto_115780 ?auto_115789 ) ) ( not ( = ?auto_115782 ?auto_115781 ) ) ( not ( = ?auto_115782 ?auto_115783 ) ) ( not ( = ?auto_115782 ?auto_115784 ) ) ( not ( = ?auto_115782 ?auto_115789 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115781 ?auto_115783 ?auto_115784 )
      ( MAKE-6CRATE-VERIFY ?auto_115778 ?auto_115779 ?auto_115780 ?auto_115782 ?auto_115781 ?auto_115783 ?auto_115784 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_115842 - SURFACE
      ?auto_115843 - SURFACE
      ?auto_115844 - SURFACE
      ?auto_115846 - SURFACE
      ?auto_115845 - SURFACE
      ?auto_115847 - SURFACE
      ?auto_115848 - SURFACE
    )
    :vars
    (
      ?auto_115853 - HOIST
      ?auto_115852 - PLACE
      ?auto_115851 - PLACE
      ?auto_115849 - HOIST
      ?auto_115854 - SURFACE
      ?auto_115850 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_115853 ?auto_115852 ) ( IS-CRATE ?auto_115848 ) ( not ( = ?auto_115847 ?auto_115848 ) ) ( not ( = ?auto_115845 ?auto_115847 ) ) ( not ( = ?auto_115845 ?auto_115848 ) ) ( not ( = ?auto_115851 ?auto_115852 ) ) ( HOIST-AT ?auto_115849 ?auto_115851 ) ( not ( = ?auto_115853 ?auto_115849 ) ) ( AVAILABLE ?auto_115849 ) ( SURFACE-AT ?auto_115848 ?auto_115851 ) ( ON ?auto_115848 ?auto_115854 ) ( CLEAR ?auto_115848 ) ( not ( = ?auto_115847 ?auto_115854 ) ) ( not ( = ?auto_115848 ?auto_115854 ) ) ( not ( = ?auto_115845 ?auto_115854 ) ) ( TRUCK-AT ?auto_115850 ?auto_115852 ) ( SURFACE-AT ?auto_115845 ?auto_115852 ) ( CLEAR ?auto_115845 ) ( IS-CRATE ?auto_115847 ) ( AVAILABLE ?auto_115853 ) ( IN ?auto_115847 ?auto_115850 ) ( ON ?auto_115843 ?auto_115842 ) ( ON ?auto_115844 ?auto_115843 ) ( ON ?auto_115846 ?auto_115844 ) ( ON ?auto_115845 ?auto_115846 ) ( not ( = ?auto_115842 ?auto_115843 ) ) ( not ( = ?auto_115842 ?auto_115844 ) ) ( not ( = ?auto_115842 ?auto_115846 ) ) ( not ( = ?auto_115842 ?auto_115845 ) ) ( not ( = ?auto_115842 ?auto_115847 ) ) ( not ( = ?auto_115842 ?auto_115848 ) ) ( not ( = ?auto_115842 ?auto_115854 ) ) ( not ( = ?auto_115843 ?auto_115844 ) ) ( not ( = ?auto_115843 ?auto_115846 ) ) ( not ( = ?auto_115843 ?auto_115845 ) ) ( not ( = ?auto_115843 ?auto_115847 ) ) ( not ( = ?auto_115843 ?auto_115848 ) ) ( not ( = ?auto_115843 ?auto_115854 ) ) ( not ( = ?auto_115844 ?auto_115846 ) ) ( not ( = ?auto_115844 ?auto_115845 ) ) ( not ( = ?auto_115844 ?auto_115847 ) ) ( not ( = ?auto_115844 ?auto_115848 ) ) ( not ( = ?auto_115844 ?auto_115854 ) ) ( not ( = ?auto_115846 ?auto_115845 ) ) ( not ( = ?auto_115846 ?auto_115847 ) ) ( not ( = ?auto_115846 ?auto_115848 ) ) ( not ( = ?auto_115846 ?auto_115854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_115845 ?auto_115847 ?auto_115848 )
      ( MAKE-6CRATE-VERIFY ?auto_115842 ?auto_115843 ?auto_115844 ?auto_115846 ?auto_115845 ?auto_115847 ?auto_115848 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_117518 - SURFACE
      ?auto_117519 - SURFACE
    )
    :vars
    (
      ?auto_117525 - HOIST
      ?auto_117520 - PLACE
      ?auto_117524 - SURFACE
      ?auto_117521 - TRUCK
      ?auto_117526 - PLACE
      ?auto_117523 - HOIST
      ?auto_117522 - SURFACE
      ?auto_117527 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117525 ?auto_117520 ) ( SURFACE-AT ?auto_117518 ?auto_117520 ) ( CLEAR ?auto_117518 ) ( IS-CRATE ?auto_117519 ) ( not ( = ?auto_117518 ?auto_117519 ) ) ( AVAILABLE ?auto_117525 ) ( ON ?auto_117518 ?auto_117524 ) ( not ( = ?auto_117524 ?auto_117518 ) ) ( not ( = ?auto_117524 ?auto_117519 ) ) ( TRUCK-AT ?auto_117521 ?auto_117526 ) ( not ( = ?auto_117526 ?auto_117520 ) ) ( HOIST-AT ?auto_117523 ?auto_117526 ) ( not ( = ?auto_117525 ?auto_117523 ) ) ( SURFACE-AT ?auto_117519 ?auto_117526 ) ( ON ?auto_117519 ?auto_117522 ) ( CLEAR ?auto_117519 ) ( not ( = ?auto_117518 ?auto_117522 ) ) ( not ( = ?auto_117519 ?auto_117522 ) ) ( not ( = ?auto_117524 ?auto_117522 ) ) ( LIFTING ?auto_117523 ?auto_117527 ) ( IS-CRATE ?auto_117527 ) ( not ( = ?auto_117518 ?auto_117527 ) ) ( not ( = ?auto_117519 ?auto_117527 ) ) ( not ( = ?auto_117524 ?auto_117527 ) ) ( not ( = ?auto_117522 ?auto_117527 ) ) )
    :subtasks
    ( ( !LOAD ?auto_117523 ?auto_117527 ?auto_117521 ?auto_117526 )
      ( MAKE-1CRATE ?auto_117518 ?auto_117519 )
      ( MAKE-1CRATE-VERIFY ?auto_117518 ?auto_117519 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117794 - SURFACE
      ?auto_117795 - SURFACE
      ?auto_117796 - SURFACE
      ?auto_117798 - SURFACE
      ?auto_117797 - SURFACE
      ?auto_117799 - SURFACE
      ?auto_117800 - SURFACE
      ?auto_117801 - SURFACE
    )
    :vars
    (
      ?auto_117802 - HOIST
      ?auto_117803 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117802 ?auto_117803 ) ( SURFACE-AT ?auto_117800 ?auto_117803 ) ( CLEAR ?auto_117800 ) ( LIFTING ?auto_117802 ?auto_117801 ) ( IS-CRATE ?auto_117801 ) ( not ( = ?auto_117800 ?auto_117801 ) ) ( ON ?auto_117795 ?auto_117794 ) ( ON ?auto_117796 ?auto_117795 ) ( ON ?auto_117798 ?auto_117796 ) ( ON ?auto_117797 ?auto_117798 ) ( ON ?auto_117799 ?auto_117797 ) ( ON ?auto_117800 ?auto_117799 ) ( not ( = ?auto_117794 ?auto_117795 ) ) ( not ( = ?auto_117794 ?auto_117796 ) ) ( not ( = ?auto_117794 ?auto_117798 ) ) ( not ( = ?auto_117794 ?auto_117797 ) ) ( not ( = ?auto_117794 ?auto_117799 ) ) ( not ( = ?auto_117794 ?auto_117800 ) ) ( not ( = ?auto_117794 ?auto_117801 ) ) ( not ( = ?auto_117795 ?auto_117796 ) ) ( not ( = ?auto_117795 ?auto_117798 ) ) ( not ( = ?auto_117795 ?auto_117797 ) ) ( not ( = ?auto_117795 ?auto_117799 ) ) ( not ( = ?auto_117795 ?auto_117800 ) ) ( not ( = ?auto_117795 ?auto_117801 ) ) ( not ( = ?auto_117796 ?auto_117798 ) ) ( not ( = ?auto_117796 ?auto_117797 ) ) ( not ( = ?auto_117796 ?auto_117799 ) ) ( not ( = ?auto_117796 ?auto_117800 ) ) ( not ( = ?auto_117796 ?auto_117801 ) ) ( not ( = ?auto_117798 ?auto_117797 ) ) ( not ( = ?auto_117798 ?auto_117799 ) ) ( not ( = ?auto_117798 ?auto_117800 ) ) ( not ( = ?auto_117798 ?auto_117801 ) ) ( not ( = ?auto_117797 ?auto_117799 ) ) ( not ( = ?auto_117797 ?auto_117800 ) ) ( not ( = ?auto_117797 ?auto_117801 ) ) ( not ( = ?auto_117799 ?auto_117800 ) ) ( not ( = ?auto_117799 ?auto_117801 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_117800 ?auto_117801 )
      ( MAKE-7CRATE-VERIFY ?auto_117794 ?auto_117795 ?auto_117796 ?auto_117798 ?auto_117797 ?auto_117799 ?auto_117800 ?auto_117801 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117849 - SURFACE
      ?auto_117850 - SURFACE
      ?auto_117851 - SURFACE
      ?auto_117853 - SURFACE
      ?auto_117852 - SURFACE
      ?auto_117854 - SURFACE
      ?auto_117855 - SURFACE
      ?auto_117856 - SURFACE
    )
    :vars
    (
      ?auto_117858 - HOIST
      ?auto_117859 - PLACE
      ?auto_117857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_117858 ?auto_117859 ) ( SURFACE-AT ?auto_117855 ?auto_117859 ) ( CLEAR ?auto_117855 ) ( IS-CRATE ?auto_117856 ) ( not ( = ?auto_117855 ?auto_117856 ) ) ( TRUCK-AT ?auto_117857 ?auto_117859 ) ( AVAILABLE ?auto_117858 ) ( IN ?auto_117856 ?auto_117857 ) ( ON ?auto_117855 ?auto_117854 ) ( not ( = ?auto_117854 ?auto_117855 ) ) ( not ( = ?auto_117854 ?auto_117856 ) ) ( ON ?auto_117850 ?auto_117849 ) ( ON ?auto_117851 ?auto_117850 ) ( ON ?auto_117853 ?auto_117851 ) ( ON ?auto_117852 ?auto_117853 ) ( ON ?auto_117854 ?auto_117852 ) ( not ( = ?auto_117849 ?auto_117850 ) ) ( not ( = ?auto_117849 ?auto_117851 ) ) ( not ( = ?auto_117849 ?auto_117853 ) ) ( not ( = ?auto_117849 ?auto_117852 ) ) ( not ( = ?auto_117849 ?auto_117854 ) ) ( not ( = ?auto_117849 ?auto_117855 ) ) ( not ( = ?auto_117849 ?auto_117856 ) ) ( not ( = ?auto_117850 ?auto_117851 ) ) ( not ( = ?auto_117850 ?auto_117853 ) ) ( not ( = ?auto_117850 ?auto_117852 ) ) ( not ( = ?auto_117850 ?auto_117854 ) ) ( not ( = ?auto_117850 ?auto_117855 ) ) ( not ( = ?auto_117850 ?auto_117856 ) ) ( not ( = ?auto_117851 ?auto_117853 ) ) ( not ( = ?auto_117851 ?auto_117852 ) ) ( not ( = ?auto_117851 ?auto_117854 ) ) ( not ( = ?auto_117851 ?auto_117855 ) ) ( not ( = ?auto_117851 ?auto_117856 ) ) ( not ( = ?auto_117853 ?auto_117852 ) ) ( not ( = ?auto_117853 ?auto_117854 ) ) ( not ( = ?auto_117853 ?auto_117855 ) ) ( not ( = ?auto_117853 ?auto_117856 ) ) ( not ( = ?auto_117852 ?auto_117854 ) ) ( not ( = ?auto_117852 ?auto_117855 ) ) ( not ( = ?auto_117852 ?auto_117856 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_117854 ?auto_117855 ?auto_117856 )
      ( MAKE-7CRATE-VERIFY ?auto_117849 ?auto_117850 ?auto_117851 ?auto_117853 ?auto_117852 ?auto_117854 ?auto_117855 ?auto_117856 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117912 - SURFACE
      ?auto_117913 - SURFACE
      ?auto_117914 - SURFACE
      ?auto_117916 - SURFACE
      ?auto_117915 - SURFACE
      ?auto_117917 - SURFACE
      ?auto_117918 - SURFACE
      ?auto_117919 - SURFACE
    )
    :vars
    (
      ?auto_117921 - HOIST
      ?auto_117920 - PLACE
      ?auto_117923 - TRUCK
      ?auto_117922 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_117921 ?auto_117920 ) ( SURFACE-AT ?auto_117918 ?auto_117920 ) ( CLEAR ?auto_117918 ) ( IS-CRATE ?auto_117919 ) ( not ( = ?auto_117918 ?auto_117919 ) ) ( AVAILABLE ?auto_117921 ) ( IN ?auto_117919 ?auto_117923 ) ( ON ?auto_117918 ?auto_117917 ) ( not ( = ?auto_117917 ?auto_117918 ) ) ( not ( = ?auto_117917 ?auto_117919 ) ) ( TRUCK-AT ?auto_117923 ?auto_117922 ) ( not ( = ?auto_117922 ?auto_117920 ) ) ( ON ?auto_117913 ?auto_117912 ) ( ON ?auto_117914 ?auto_117913 ) ( ON ?auto_117916 ?auto_117914 ) ( ON ?auto_117915 ?auto_117916 ) ( ON ?auto_117917 ?auto_117915 ) ( not ( = ?auto_117912 ?auto_117913 ) ) ( not ( = ?auto_117912 ?auto_117914 ) ) ( not ( = ?auto_117912 ?auto_117916 ) ) ( not ( = ?auto_117912 ?auto_117915 ) ) ( not ( = ?auto_117912 ?auto_117917 ) ) ( not ( = ?auto_117912 ?auto_117918 ) ) ( not ( = ?auto_117912 ?auto_117919 ) ) ( not ( = ?auto_117913 ?auto_117914 ) ) ( not ( = ?auto_117913 ?auto_117916 ) ) ( not ( = ?auto_117913 ?auto_117915 ) ) ( not ( = ?auto_117913 ?auto_117917 ) ) ( not ( = ?auto_117913 ?auto_117918 ) ) ( not ( = ?auto_117913 ?auto_117919 ) ) ( not ( = ?auto_117914 ?auto_117916 ) ) ( not ( = ?auto_117914 ?auto_117915 ) ) ( not ( = ?auto_117914 ?auto_117917 ) ) ( not ( = ?auto_117914 ?auto_117918 ) ) ( not ( = ?auto_117914 ?auto_117919 ) ) ( not ( = ?auto_117916 ?auto_117915 ) ) ( not ( = ?auto_117916 ?auto_117917 ) ) ( not ( = ?auto_117916 ?auto_117918 ) ) ( not ( = ?auto_117916 ?auto_117919 ) ) ( not ( = ?auto_117915 ?auto_117917 ) ) ( not ( = ?auto_117915 ?auto_117918 ) ) ( not ( = ?auto_117915 ?auto_117919 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_117917 ?auto_117918 ?auto_117919 )
      ( MAKE-7CRATE-VERIFY ?auto_117912 ?auto_117913 ?auto_117914 ?auto_117916 ?auto_117915 ?auto_117917 ?auto_117918 ?auto_117919 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_117982 - SURFACE
      ?auto_117983 - SURFACE
      ?auto_117984 - SURFACE
      ?auto_117986 - SURFACE
      ?auto_117985 - SURFACE
      ?auto_117987 - SURFACE
      ?auto_117988 - SURFACE
      ?auto_117989 - SURFACE
    )
    :vars
    (
      ?auto_117994 - HOIST
      ?auto_117990 - PLACE
      ?auto_117991 - TRUCK
      ?auto_117993 - PLACE
      ?auto_117992 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_117994 ?auto_117990 ) ( SURFACE-AT ?auto_117988 ?auto_117990 ) ( CLEAR ?auto_117988 ) ( IS-CRATE ?auto_117989 ) ( not ( = ?auto_117988 ?auto_117989 ) ) ( AVAILABLE ?auto_117994 ) ( ON ?auto_117988 ?auto_117987 ) ( not ( = ?auto_117987 ?auto_117988 ) ) ( not ( = ?auto_117987 ?auto_117989 ) ) ( TRUCK-AT ?auto_117991 ?auto_117993 ) ( not ( = ?auto_117993 ?auto_117990 ) ) ( HOIST-AT ?auto_117992 ?auto_117993 ) ( LIFTING ?auto_117992 ?auto_117989 ) ( not ( = ?auto_117994 ?auto_117992 ) ) ( ON ?auto_117983 ?auto_117982 ) ( ON ?auto_117984 ?auto_117983 ) ( ON ?auto_117986 ?auto_117984 ) ( ON ?auto_117985 ?auto_117986 ) ( ON ?auto_117987 ?auto_117985 ) ( not ( = ?auto_117982 ?auto_117983 ) ) ( not ( = ?auto_117982 ?auto_117984 ) ) ( not ( = ?auto_117982 ?auto_117986 ) ) ( not ( = ?auto_117982 ?auto_117985 ) ) ( not ( = ?auto_117982 ?auto_117987 ) ) ( not ( = ?auto_117982 ?auto_117988 ) ) ( not ( = ?auto_117982 ?auto_117989 ) ) ( not ( = ?auto_117983 ?auto_117984 ) ) ( not ( = ?auto_117983 ?auto_117986 ) ) ( not ( = ?auto_117983 ?auto_117985 ) ) ( not ( = ?auto_117983 ?auto_117987 ) ) ( not ( = ?auto_117983 ?auto_117988 ) ) ( not ( = ?auto_117983 ?auto_117989 ) ) ( not ( = ?auto_117984 ?auto_117986 ) ) ( not ( = ?auto_117984 ?auto_117985 ) ) ( not ( = ?auto_117984 ?auto_117987 ) ) ( not ( = ?auto_117984 ?auto_117988 ) ) ( not ( = ?auto_117984 ?auto_117989 ) ) ( not ( = ?auto_117986 ?auto_117985 ) ) ( not ( = ?auto_117986 ?auto_117987 ) ) ( not ( = ?auto_117986 ?auto_117988 ) ) ( not ( = ?auto_117986 ?auto_117989 ) ) ( not ( = ?auto_117985 ?auto_117987 ) ) ( not ( = ?auto_117985 ?auto_117988 ) ) ( not ( = ?auto_117985 ?auto_117989 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_117987 ?auto_117988 ?auto_117989 )
      ( MAKE-7CRATE-VERIFY ?auto_117982 ?auto_117983 ?auto_117984 ?auto_117986 ?auto_117985 ?auto_117987 ?auto_117988 ?auto_117989 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118059 - SURFACE
      ?auto_118060 - SURFACE
      ?auto_118061 - SURFACE
      ?auto_118063 - SURFACE
      ?auto_118062 - SURFACE
      ?auto_118064 - SURFACE
      ?auto_118065 - SURFACE
      ?auto_118066 - SURFACE
    )
    :vars
    (
      ?auto_118067 - HOIST
      ?auto_118070 - PLACE
      ?auto_118069 - TRUCK
      ?auto_118071 - PLACE
      ?auto_118072 - HOIST
      ?auto_118068 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_118067 ?auto_118070 ) ( SURFACE-AT ?auto_118065 ?auto_118070 ) ( CLEAR ?auto_118065 ) ( IS-CRATE ?auto_118066 ) ( not ( = ?auto_118065 ?auto_118066 ) ) ( AVAILABLE ?auto_118067 ) ( ON ?auto_118065 ?auto_118064 ) ( not ( = ?auto_118064 ?auto_118065 ) ) ( not ( = ?auto_118064 ?auto_118066 ) ) ( TRUCK-AT ?auto_118069 ?auto_118071 ) ( not ( = ?auto_118071 ?auto_118070 ) ) ( HOIST-AT ?auto_118072 ?auto_118071 ) ( not ( = ?auto_118067 ?auto_118072 ) ) ( AVAILABLE ?auto_118072 ) ( SURFACE-AT ?auto_118066 ?auto_118071 ) ( ON ?auto_118066 ?auto_118068 ) ( CLEAR ?auto_118066 ) ( not ( = ?auto_118065 ?auto_118068 ) ) ( not ( = ?auto_118066 ?auto_118068 ) ) ( not ( = ?auto_118064 ?auto_118068 ) ) ( ON ?auto_118060 ?auto_118059 ) ( ON ?auto_118061 ?auto_118060 ) ( ON ?auto_118063 ?auto_118061 ) ( ON ?auto_118062 ?auto_118063 ) ( ON ?auto_118064 ?auto_118062 ) ( not ( = ?auto_118059 ?auto_118060 ) ) ( not ( = ?auto_118059 ?auto_118061 ) ) ( not ( = ?auto_118059 ?auto_118063 ) ) ( not ( = ?auto_118059 ?auto_118062 ) ) ( not ( = ?auto_118059 ?auto_118064 ) ) ( not ( = ?auto_118059 ?auto_118065 ) ) ( not ( = ?auto_118059 ?auto_118066 ) ) ( not ( = ?auto_118059 ?auto_118068 ) ) ( not ( = ?auto_118060 ?auto_118061 ) ) ( not ( = ?auto_118060 ?auto_118063 ) ) ( not ( = ?auto_118060 ?auto_118062 ) ) ( not ( = ?auto_118060 ?auto_118064 ) ) ( not ( = ?auto_118060 ?auto_118065 ) ) ( not ( = ?auto_118060 ?auto_118066 ) ) ( not ( = ?auto_118060 ?auto_118068 ) ) ( not ( = ?auto_118061 ?auto_118063 ) ) ( not ( = ?auto_118061 ?auto_118062 ) ) ( not ( = ?auto_118061 ?auto_118064 ) ) ( not ( = ?auto_118061 ?auto_118065 ) ) ( not ( = ?auto_118061 ?auto_118066 ) ) ( not ( = ?auto_118061 ?auto_118068 ) ) ( not ( = ?auto_118063 ?auto_118062 ) ) ( not ( = ?auto_118063 ?auto_118064 ) ) ( not ( = ?auto_118063 ?auto_118065 ) ) ( not ( = ?auto_118063 ?auto_118066 ) ) ( not ( = ?auto_118063 ?auto_118068 ) ) ( not ( = ?auto_118062 ?auto_118064 ) ) ( not ( = ?auto_118062 ?auto_118065 ) ) ( not ( = ?auto_118062 ?auto_118066 ) ) ( not ( = ?auto_118062 ?auto_118068 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118064 ?auto_118065 ?auto_118066 )
      ( MAKE-7CRATE-VERIFY ?auto_118059 ?auto_118060 ?auto_118061 ?auto_118063 ?auto_118062 ?auto_118064 ?auto_118065 ?auto_118066 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118137 - SURFACE
      ?auto_118138 - SURFACE
      ?auto_118139 - SURFACE
      ?auto_118141 - SURFACE
      ?auto_118140 - SURFACE
      ?auto_118142 - SURFACE
      ?auto_118143 - SURFACE
      ?auto_118144 - SURFACE
    )
    :vars
    (
      ?auto_118148 - HOIST
      ?auto_118149 - PLACE
      ?auto_118145 - PLACE
      ?auto_118147 - HOIST
      ?auto_118150 - SURFACE
      ?auto_118146 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118148 ?auto_118149 ) ( SURFACE-AT ?auto_118143 ?auto_118149 ) ( CLEAR ?auto_118143 ) ( IS-CRATE ?auto_118144 ) ( not ( = ?auto_118143 ?auto_118144 ) ) ( AVAILABLE ?auto_118148 ) ( ON ?auto_118143 ?auto_118142 ) ( not ( = ?auto_118142 ?auto_118143 ) ) ( not ( = ?auto_118142 ?auto_118144 ) ) ( not ( = ?auto_118145 ?auto_118149 ) ) ( HOIST-AT ?auto_118147 ?auto_118145 ) ( not ( = ?auto_118148 ?auto_118147 ) ) ( AVAILABLE ?auto_118147 ) ( SURFACE-AT ?auto_118144 ?auto_118145 ) ( ON ?auto_118144 ?auto_118150 ) ( CLEAR ?auto_118144 ) ( not ( = ?auto_118143 ?auto_118150 ) ) ( not ( = ?auto_118144 ?auto_118150 ) ) ( not ( = ?auto_118142 ?auto_118150 ) ) ( TRUCK-AT ?auto_118146 ?auto_118149 ) ( ON ?auto_118138 ?auto_118137 ) ( ON ?auto_118139 ?auto_118138 ) ( ON ?auto_118141 ?auto_118139 ) ( ON ?auto_118140 ?auto_118141 ) ( ON ?auto_118142 ?auto_118140 ) ( not ( = ?auto_118137 ?auto_118138 ) ) ( not ( = ?auto_118137 ?auto_118139 ) ) ( not ( = ?auto_118137 ?auto_118141 ) ) ( not ( = ?auto_118137 ?auto_118140 ) ) ( not ( = ?auto_118137 ?auto_118142 ) ) ( not ( = ?auto_118137 ?auto_118143 ) ) ( not ( = ?auto_118137 ?auto_118144 ) ) ( not ( = ?auto_118137 ?auto_118150 ) ) ( not ( = ?auto_118138 ?auto_118139 ) ) ( not ( = ?auto_118138 ?auto_118141 ) ) ( not ( = ?auto_118138 ?auto_118140 ) ) ( not ( = ?auto_118138 ?auto_118142 ) ) ( not ( = ?auto_118138 ?auto_118143 ) ) ( not ( = ?auto_118138 ?auto_118144 ) ) ( not ( = ?auto_118138 ?auto_118150 ) ) ( not ( = ?auto_118139 ?auto_118141 ) ) ( not ( = ?auto_118139 ?auto_118140 ) ) ( not ( = ?auto_118139 ?auto_118142 ) ) ( not ( = ?auto_118139 ?auto_118143 ) ) ( not ( = ?auto_118139 ?auto_118144 ) ) ( not ( = ?auto_118139 ?auto_118150 ) ) ( not ( = ?auto_118141 ?auto_118140 ) ) ( not ( = ?auto_118141 ?auto_118142 ) ) ( not ( = ?auto_118141 ?auto_118143 ) ) ( not ( = ?auto_118141 ?auto_118144 ) ) ( not ( = ?auto_118141 ?auto_118150 ) ) ( not ( = ?auto_118140 ?auto_118142 ) ) ( not ( = ?auto_118140 ?auto_118143 ) ) ( not ( = ?auto_118140 ?auto_118144 ) ) ( not ( = ?auto_118140 ?auto_118150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118142 ?auto_118143 ?auto_118144 )
      ( MAKE-7CRATE-VERIFY ?auto_118137 ?auto_118138 ?auto_118139 ?auto_118141 ?auto_118140 ?auto_118142 ?auto_118143 ?auto_118144 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118215 - SURFACE
      ?auto_118216 - SURFACE
      ?auto_118217 - SURFACE
      ?auto_118219 - SURFACE
      ?auto_118218 - SURFACE
      ?auto_118220 - SURFACE
      ?auto_118221 - SURFACE
      ?auto_118222 - SURFACE
    )
    :vars
    (
      ?auto_118223 - HOIST
      ?auto_118224 - PLACE
      ?auto_118228 - PLACE
      ?auto_118226 - HOIST
      ?auto_118225 - SURFACE
      ?auto_118227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118223 ?auto_118224 ) ( IS-CRATE ?auto_118222 ) ( not ( = ?auto_118221 ?auto_118222 ) ) ( not ( = ?auto_118220 ?auto_118221 ) ) ( not ( = ?auto_118220 ?auto_118222 ) ) ( not ( = ?auto_118228 ?auto_118224 ) ) ( HOIST-AT ?auto_118226 ?auto_118228 ) ( not ( = ?auto_118223 ?auto_118226 ) ) ( AVAILABLE ?auto_118226 ) ( SURFACE-AT ?auto_118222 ?auto_118228 ) ( ON ?auto_118222 ?auto_118225 ) ( CLEAR ?auto_118222 ) ( not ( = ?auto_118221 ?auto_118225 ) ) ( not ( = ?auto_118222 ?auto_118225 ) ) ( not ( = ?auto_118220 ?auto_118225 ) ) ( TRUCK-AT ?auto_118227 ?auto_118224 ) ( SURFACE-AT ?auto_118220 ?auto_118224 ) ( CLEAR ?auto_118220 ) ( LIFTING ?auto_118223 ?auto_118221 ) ( IS-CRATE ?auto_118221 ) ( ON ?auto_118216 ?auto_118215 ) ( ON ?auto_118217 ?auto_118216 ) ( ON ?auto_118219 ?auto_118217 ) ( ON ?auto_118218 ?auto_118219 ) ( ON ?auto_118220 ?auto_118218 ) ( not ( = ?auto_118215 ?auto_118216 ) ) ( not ( = ?auto_118215 ?auto_118217 ) ) ( not ( = ?auto_118215 ?auto_118219 ) ) ( not ( = ?auto_118215 ?auto_118218 ) ) ( not ( = ?auto_118215 ?auto_118220 ) ) ( not ( = ?auto_118215 ?auto_118221 ) ) ( not ( = ?auto_118215 ?auto_118222 ) ) ( not ( = ?auto_118215 ?auto_118225 ) ) ( not ( = ?auto_118216 ?auto_118217 ) ) ( not ( = ?auto_118216 ?auto_118219 ) ) ( not ( = ?auto_118216 ?auto_118218 ) ) ( not ( = ?auto_118216 ?auto_118220 ) ) ( not ( = ?auto_118216 ?auto_118221 ) ) ( not ( = ?auto_118216 ?auto_118222 ) ) ( not ( = ?auto_118216 ?auto_118225 ) ) ( not ( = ?auto_118217 ?auto_118219 ) ) ( not ( = ?auto_118217 ?auto_118218 ) ) ( not ( = ?auto_118217 ?auto_118220 ) ) ( not ( = ?auto_118217 ?auto_118221 ) ) ( not ( = ?auto_118217 ?auto_118222 ) ) ( not ( = ?auto_118217 ?auto_118225 ) ) ( not ( = ?auto_118219 ?auto_118218 ) ) ( not ( = ?auto_118219 ?auto_118220 ) ) ( not ( = ?auto_118219 ?auto_118221 ) ) ( not ( = ?auto_118219 ?auto_118222 ) ) ( not ( = ?auto_118219 ?auto_118225 ) ) ( not ( = ?auto_118218 ?auto_118220 ) ) ( not ( = ?auto_118218 ?auto_118221 ) ) ( not ( = ?auto_118218 ?auto_118222 ) ) ( not ( = ?auto_118218 ?auto_118225 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118220 ?auto_118221 ?auto_118222 )
      ( MAKE-7CRATE-VERIFY ?auto_118215 ?auto_118216 ?auto_118217 ?auto_118219 ?auto_118218 ?auto_118220 ?auto_118221 ?auto_118222 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_118293 - SURFACE
      ?auto_118294 - SURFACE
      ?auto_118295 - SURFACE
      ?auto_118297 - SURFACE
      ?auto_118296 - SURFACE
      ?auto_118298 - SURFACE
      ?auto_118299 - SURFACE
      ?auto_118300 - SURFACE
    )
    :vars
    (
      ?auto_118306 - HOIST
      ?auto_118305 - PLACE
      ?auto_118301 - PLACE
      ?auto_118303 - HOIST
      ?auto_118302 - SURFACE
      ?auto_118304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_118306 ?auto_118305 ) ( IS-CRATE ?auto_118300 ) ( not ( = ?auto_118299 ?auto_118300 ) ) ( not ( = ?auto_118298 ?auto_118299 ) ) ( not ( = ?auto_118298 ?auto_118300 ) ) ( not ( = ?auto_118301 ?auto_118305 ) ) ( HOIST-AT ?auto_118303 ?auto_118301 ) ( not ( = ?auto_118306 ?auto_118303 ) ) ( AVAILABLE ?auto_118303 ) ( SURFACE-AT ?auto_118300 ?auto_118301 ) ( ON ?auto_118300 ?auto_118302 ) ( CLEAR ?auto_118300 ) ( not ( = ?auto_118299 ?auto_118302 ) ) ( not ( = ?auto_118300 ?auto_118302 ) ) ( not ( = ?auto_118298 ?auto_118302 ) ) ( TRUCK-AT ?auto_118304 ?auto_118305 ) ( SURFACE-AT ?auto_118298 ?auto_118305 ) ( CLEAR ?auto_118298 ) ( IS-CRATE ?auto_118299 ) ( AVAILABLE ?auto_118306 ) ( IN ?auto_118299 ?auto_118304 ) ( ON ?auto_118294 ?auto_118293 ) ( ON ?auto_118295 ?auto_118294 ) ( ON ?auto_118297 ?auto_118295 ) ( ON ?auto_118296 ?auto_118297 ) ( ON ?auto_118298 ?auto_118296 ) ( not ( = ?auto_118293 ?auto_118294 ) ) ( not ( = ?auto_118293 ?auto_118295 ) ) ( not ( = ?auto_118293 ?auto_118297 ) ) ( not ( = ?auto_118293 ?auto_118296 ) ) ( not ( = ?auto_118293 ?auto_118298 ) ) ( not ( = ?auto_118293 ?auto_118299 ) ) ( not ( = ?auto_118293 ?auto_118300 ) ) ( not ( = ?auto_118293 ?auto_118302 ) ) ( not ( = ?auto_118294 ?auto_118295 ) ) ( not ( = ?auto_118294 ?auto_118297 ) ) ( not ( = ?auto_118294 ?auto_118296 ) ) ( not ( = ?auto_118294 ?auto_118298 ) ) ( not ( = ?auto_118294 ?auto_118299 ) ) ( not ( = ?auto_118294 ?auto_118300 ) ) ( not ( = ?auto_118294 ?auto_118302 ) ) ( not ( = ?auto_118295 ?auto_118297 ) ) ( not ( = ?auto_118295 ?auto_118296 ) ) ( not ( = ?auto_118295 ?auto_118298 ) ) ( not ( = ?auto_118295 ?auto_118299 ) ) ( not ( = ?auto_118295 ?auto_118300 ) ) ( not ( = ?auto_118295 ?auto_118302 ) ) ( not ( = ?auto_118297 ?auto_118296 ) ) ( not ( = ?auto_118297 ?auto_118298 ) ) ( not ( = ?auto_118297 ?auto_118299 ) ) ( not ( = ?auto_118297 ?auto_118300 ) ) ( not ( = ?auto_118297 ?auto_118302 ) ) ( not ( = ?auto_118296 ?auto_118298 ) ) ( not ( = ?auto_118296 ?auto_118299 ) ) ( not ( = ?auto_118296 ?auto_118300 ) ) ( not ( = ?auto_118296 ?auto_118302 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_118298 ?auto_118299 ?auto_118300 )
      ( MAKE-7CRATE-VERIFY ?auto_118293 ?auto_118294 ?auto_118295 ?auto_118297 ?auto_118296 ?auto_118298 ?auto_118299 ?auto_118300 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_120854 - SURFACE
      ?auto_120855 - SURFACE
    )
    :vars
    (
      ?auto_120862 - HOIST
      ?auto_120861 - PLACE
      ?auto_120857 - SURFACE
      ?auto_120859 - PLACE
      ?auto_120860 - HOIST
      ?auto_120858 - SURFACE
      ?auto_120856 - TRUCK
      ?auto_120863 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_120862 ?auto_120861 ) ( SURFACE-AT ?auto_120854 ?auto_120861 ) ( CLEAR ?auto_120854 ) ( IS-CRATE ?auto_120855 ) ( not ( = ?auto_120854 ?auto_120855 ) ) ( ON ?auto_120854 ?auto_120857 ) ( not ( = ?auto_120857 ?auto_120854 ) ) ( not ( = ?auto_120857 ?auto_120855 ) ) ( not ( = ?auto_120859 ?auto_120861 ) ) ( HOIST-AT ?auto_120860 ?auto_120859 ) ( not ( = ?auto_120862 ?auto_120860 ) ) ( AVAILABLE ?auto_120860 ) ( SURFACE-AT ?auto_120855 ?auto_120859 ) ( ON ?auto_120855 ?auto_120858 ) ( CLEAR ?auto_120855 ) ( not ( = ?auto_120854 ?auto_120858 ) ) ( not ( = ?auto_120855 ?auto_120858 ) ) ( not ( = ?auto_120857 ?auto_120858 ) ) ( TRUCK-AT ?auto_120856 ?auto_120861 ) ( LIFTING ?auto_120862 ?auto_120863 ) ( IS-CRATE ?auto_120863 ) ( not ( = ?auto_120854 ?auto_120863 ) ) ( not ( = ?auto_120855 ?auto_120863 ) ) ( not ( = ?auto_120857 ?auto_120863 ) ) ( not ( = ?auto_120858 ?auto_120863 ) ) )
    :subtasks
    ( ( !LOAD ?auto_120862 ?auto_120863 ?auto_120856 ?auto_120861 )
      ( MAKE-1CRATE ?auto_120854 ?auto_120855 )
      ( MAKE-1CRATE-VERIFY ?auto_120854 ?auto_120855 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121196 - SURFACE
      ?auto_121197 - SURFACE
      ?auto_121198 - SURFACE
      ?auto_121200 - SURFACE
      ?auto_121199 - SURFACE
      ?auto_121201 - SURFACE
      ?auto_121202 - SURFACE
      ?auto_121203 - SURFACE
      ?auto_121204 - SURFACE
    )
    :vars
    (
      ?auto_121206 - HOIST
      ?auto_121205 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121206 ?auto_121205 ) ( SURFACE-AT ?auto_121203 ?auto_121205 ) ( CLEAR ?auto_121203 ) ( LIFTING ?auto_121206 ?auto_121204 ) ( IS-CRATE ?auto_121204 ) ( not ( = ?auto_121203 ?auto_121204 ) ) ( ON ?auto_121197 ?auto_121196 ) ( ON ?auto_121198 ?auto_121197 ) ( ON ?auto_121200 ?auto_121198 ) ( ON ?auto_121199 ?auto_121200 ) ( ON ?auto_121201 ?auto_121199 ) ( ON ?auto_121202 ?auto_121201 ) ( ON ?auto_121203 ?auto_121202 ) ( not ( = ?auto_121196 ?auto_121197 ) ) ( not ( = ?auto_121196 ?auto_121198 ) ) ( not ( = ?auto_121196 ?auto_121200 ) ) ( not ( = ?auto_121196 ?auto_121199 ) ) ( not ( = ?auto_121196 ?auto_121201 ) ) ( not ( = ?auto_121196 ?auto_121202 ) ) ( not ( = ?auto_121196 ?auto_121203 ) ) ( not ( = ?auto_121196 ?auto_121204 ) ) ( not ( = ?auto_121197 ?auto_121198 ) ) ( not ( = ?auto_121197 ?auto_121200 ) ) ( not ( = ?auto_121197 ?auto_121199 ) ) ( not ( = ?auto_121197 ?auto_121201 ) ) ( not ( = ?auto_121197 ?auto_121202 ) ) ( not ( = ?auto_121197 ?auto_121203 ) ) ( not ( = ?auto_121197 ?auto_121204 ) ) ( not ( = ?auto_121198 ?auto_121200 ) ) ( not ( = ?auto_121198 ?auto_121199 ) ) ( not ( = ?auto_121198 ?auto_121201 ) ) ( not ( = ?auto_121198 ?auto_121202 ) ) ( not ( = ?auto_121198 ?auto_121203 ) ) ( not ( = ?auto_121198 ?auto_121204 ) ) ( not ( = ?auto_121200 ?auto_121199 ) ) ( not ( = ?auto_121200 ?auto_121201 ) ) ( not ( = ?auto_121200 ?auto_121202 ) ) ( not ( = ?auto_121200 ?auto_121203 ) ) ( not ( = ?auto_121200 ?auto_121204 ) ) ( not ( = ?auto_121199 ?auto_121201 ) ) ( not ( = ?auto_121199 ?auto_121202 ) ) ( not ( = ?auto_121199 ?auto_121203 ) ) ( not ( = ?auto_121199 ?auto_121204 ) ) ( not ( = ?auto_121201 ?auto_121202 ) ) ( not ( = ?auto_121201 ?auto_121203 ) ) ( not ( = ?auto_121201 ?auto_121204 ) ) ( not ( = ?auto_121202 ?auto_121203 ) ) ( not ( = ?auto_121202 ?auto_121204 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_121203 ?auto_121204 )
      ( MAKE-8CRATE-VERIFY ?auto_121196 ?auto_121197 ?auto_121198 ?auto_121200 ?auto_121199 ?auto_121201 ?auto_121202 ?auto_121203 ?auto_121204 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121263 - SURFACE
      ?auto_121264 - SURFACE
      ?auto_121265 - SURFACE
      ?auto_121267 - SURFACE
      ?auto_121266 - SURFACE
      ?auto_121268 - SURFACE
      ?auto_121269 - SURFACE
      ?auto_121270 - SURFACE
      ?auto_121271 - SURFACE
    )
    :vars
    (
      ?auto_121273 - HOIST
      ?auto_121272 - PLACE
      ?auto_121274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121273 ?auto_121272 ) ( SURFACE-AT ?auto_121270 ?auto_121272 ) ( CLEAR ?auto_121270 ) ( IS-CRATE ?auto_121271 ) ( not ( = ?auto_121270 ?auto_121271 ) ) ( TRUCK-AT ?auto_121274 ?auto_121272 ) ( AVAILABLE ?auto_121273 ) ( IN ?auto_121271 ?auto_121274 ) ( ON ?auto_121270 ?auto_121269 ) ( not ( = ?auto_121269 ?auto_121270 ) ) ( not ( = ?auto_121269 ?auto_121271 ) ) ( ON ?auto_121264 ?auto_121263 ) ( ON ?auto_121265 ?auto_121264 ) ( ON ?auto_121267 ?auto_121265 ) ( ON ?auto_121266 ?auto_121267 ) ( ON ?auto_121268 ?auto_121266 ) ( ON ?auto_121269 ?auto_121268 ) ( not ( = ?auto_121263 ?auto_121264 ) ) ( not ( = ?auto_121263 ?auto_121265 ) ) ( not ( = ?auto_121263 ?auto_121267 ) ) ( not ( = ?auto_121263 ?auto_121266 ) ) ( not ( = ?auto_121263 ?auto_121268 ) ) ( not ( = ?auto_121263 ?auto_121269 ) ) ( not ( = ?auto_121263 ?auto_121270 ) ) ( not ( = ?auto_121263 ?auto_121271 ) ) ( not ( = ?auto_121264 ?auto_121265 ) ) ( not ( = ?auto_121264 ?auto_121267 ) ) ( not ( = ?auto_121264 ?auto_121266 ) ) ( not ( = ?auto_121264 ?auto_121268 ) ) ( not ( = ?auto_121264 ?auto_121269 ) ) ( not ( = ?auto_121264 ?auto_121270 ) ) ( not ( = ?auto_121264 ?auto_121271 ) ) ( not ( = ?auto_121265 ?auto_121267 ) ) ( not ( = ?auto_121265 ?auto_121266 ) ) ( not ( = ?auto_121265 ?auto_121268 ) ) ( not ( = ?auto_121265 ?auto_121269 ) ) ( not ( = ?auto_121265 ?auto_121270 ) ) ( not ( = ?auto_121265 ?auto_121271 ) ) ( not ( = ?auto_121267 ?auto_121266 ) ) ( not ( = ?auto_121267 ?auto_121268 ) ) ( not ( = ?auto_121267 ?auto_121269 ) ) ( not ( = ?auto_121267 ?auto_121270 ) ) ( not ( = ?auto_121267 ?auto_121271 ) ) ( not ( = ?auto_121266 ?auto_121268 ) ) ( not ( = ?auto_121266 ?auto_121269 ) ) ( not ( = ?auto_121266 ?auto_121270 ) ) ( not ( = ?auto_121266 ?auto_121271 ) ) ( not ( = ?auto_121268 ?auto_121269 ) ) ( not ( = ?auto_121268 ?auto_121270 ) ) ( not ( = ?auto_121268 ?auto_121271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121269 ?auto_121270 ?auto_121271 )
      ( MAKE-8CRATE-VERIFY ?auto_121263 ?auto_121264 ?auto_121265 ?auto_121267 ?auto_121266 ?auto_121268 ?auto_121269 ?auto_121270 ?auto_121271 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121339 - SURFACE
      ?auto_121340 - SURFACE
      ?auto_121341 - SURFACE
      ?auto_121343 - SURFACE
      ?auto_121342 - SURFACE
      ?auto_121344 - SURFACE
      ?auto_121345 - SURFACE
      ?auto_121346 - SURFACE
      ?auto_121347 - SURFACE
    )
    :vars
    (
      ?auto_121351 - HOIST
      ?auto_121350 - PLACE
      ?auto_121348 - TRUCK
      ?auto_121349 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121351 ?auto_121350 ) ( SURFACE-AT ?auto_121346 ?auto_121350 ) ( CLEAR ?auto_121346 ) ( IS-CRATE ?auto_121347 ) ( not ( = ?auto_121346 ?auto_121347 ) ) ( AVAILABLE ?auto_121351 ) ( IN ?auto_121347 ?auto_121348 ) ( ON ?auto_121346 ?auto_121345 ) ( not ( = ?auto_121345 ?auto_121346 ) ) ( not ( = ?auto_121345 ?auto_121347 ) ) ( TRUCK-AT ?auto_121348 ?auto_121349 ) ( not ( = ?auto_121349 ?auto_121350 ) ) ( ON ?auto_121340 ?auto_121339 ) ( ON ?auto_121341 ?auto_121340 ) ( ON ?auto_121343 ?auto_121341 ) ( ON ?auto_121342 ?auto_121343 ) ( ON ?auto_121344 ?auto_121342 ) ( ON ?auto_121345 ?auto_121344 ) ( not ( = ?auto_121339 ?auto_121340 ) ) ( not ( = ?auto_121339 ?auto_121341 ) ) ( not ( = ?auto_121339 ?auto_121343 ) ) ( not ( = ?auto_121339 ?auto_121342 ) ) ( not ( = ?auto_121339 ?auto_121344 ) ) ( not ( = ?auto_121339 ?auto_121345 ) ) ( not ( = ?auto_121339 ?auto_121346 ) ) ( not ( = ?auto_121339 ?auto_121347 ) ) ( not ( = ?auto_121340 ?auto_121341 ) ) ( not ( = ?auto_121340 ?auto_121343 ) ) ( not ( = ?auto_121340 ?auto_121342 ) ) ( not ( = ?auto_121340 ?auto_121344 ) ) ( not ( = ?auto_121340 ?auto_121345 ) ) ( not ( = ?auto_121340 ?auto_121346 ) ) ( not ( = ?auto_121340 ?auto_121347 ) ) ( not ( = ?auto_121341 ?auto_121343 ) ) ( not ( = ?auto_121341 ?auto_121342 ) ) ( not ( = ?auto_121341 ?auto_121344 ) ) ( not ( = ?auto_121341 ?auto_121345 ) ) ( not ( = ?auto_121341 ?auto_121346 ) ) ( not ( = ?auto_121341 ?auto_121347 ) ) ( not ( = ?auto_121343 ?auto_121342 ) ) ( not ( = ?auto_121343 ?auto_121344 ) ) ( not ( = ?auto_121343 ?auto_121345 ) ) ( not ( = ?auto_121343 ?auto_121346 ) ) ( not ( = ?auto_121343 ?auto_121347 ) ) ( not ( = ?auto_121342 ?auto_121344 ) ) ( not ( = ?auto_121342 ?auto_121345 ) ) ( not ( = ?auto_121342 ?auto_121346 ) ) ( not ( = ?auto_121342 ?auto_121347 ) ) ( not ( = ?auto_121344 ?auto_121345 ) ) ( not ( = ?auto_121344 ?auto_121346 ) ) ( not ( = ?auto_121344 ?auto_121347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121345 ?auto_121346 ?auto_121347 )
      ( MAKE-8CRATE-VERIFY ?auto_121339 ?auto_121340 ?auto_121341 ?auto_121343 ?auto_121342 ?auto_121344 ?auto_121345 ?auto_121346 ?auto_121347 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121423 - SURFACE
      ?auto_121424 - SURFACE
      ?auto_121425 - SURFACE
      ?auto_121427 - SURFACE
      ?auto_121426 - SURFACE
      ?auto_121428 - SURFACE
      ?auto_121429 - SURFACE
      ?auto_121430 - SURFACE
      ?auto_121431 - SURFACE
    )
    :vars
    (
      ?auto_121432 - HOIST
      ?auto_121435 - PLACE
      ?auto_121436 - TRUCK
      ?auto_121434 - PLACE
      ?auto_121433 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_121432 ?auto_121435 ) ( SURFACE-AT ?auto_121430 ?auto_121435 ) ( CLEAR ?auto_121430 ) ( IS-CRATE ?auto_121431 ) ( not ( = ?auto_121430 ?auto_121431 ) ) ( AVAILABLE ?auto_121432 ) ( ON ?auto_121430 ?auto_121429 ) ( not ( = ?auto_121429 ?auto_121430 ) ) ( not ( = ?auto_121429 ?auto_121431 ) ) ( TRUCK-AT ?auto_121436 ?auto_121434 ) ( not ( = ?auto_121434 ?auto_121435 ) ) ( HOIST-AT ?auto_121433 ?auto_121434 ) ( LIFTING ?auto_121433 ?auto_121431 ) ( not ( = ?auto_121432 ?auto_121433 ) ) ( ON ?auto_121424 ?auto_121423 ) ( ON ?auto_121425 ?auto_121424 ) ( ON ?auto_121427 ?auto_121425 ) ( ON ?auto_121426 ?auto_121427 ) ( ON ?auto_121428 ?auto_121426 ) ( ON ?auto_121429 ?auto_121428 ) ( not ( = ?auto_121423 ?auto_121424 ) ) ( not ( = ?auto_121423 ?auto_121425 ) ) ( not ( = ?auto_121423 ?auto_121427 ) ) ( not ( = ?auto_121423 ?auto_121426 ) ) ( not ( = ?auto_121423 ?auto_121428 ) ) ( not ( = ?auto_121423 ?auto_121429 ) ) ( not ( = ?auto_121423 ?auto_121430 ) ) ( not ( = ?auto_121423 ?auto_121431 ) ) ( not ( = ?auto_121424 ?auto_121425 ) ) ( not ( = ?auto_121424 ?auto_121427 ) ) ( not ( = ?auto_121424 ?auto_121426 ) ) ( not ( = ?auto_121424 ?auto_121428 ) ) ( not ( = ?auto_121424 ?auto_121429 ) ) ( not ( = ?auto_121424 ?auto_121430 ) ) ( not ( = ?auto_121424 ?auto_121431 ) ) ( not ( = ?auto_121425 ?auto_121427 ) ) ( not ( = ?auto_121425 ?auto_121426 ) ) ( not ( = ?auto_121425 ?auto_121428 ) ) ( not ( = ?auto_121425 ?auto_121429 ) ) ( not ( = ?auto_121425 ?auto_121430 ) ) ( not ( = ?auto_121425 ?auto_121431 ) ) ( not ( = ?auto_121427 ?auto_121426 ) ) ( not ( = ?auto_121427 ?auto_121428 ) ) ( not ( = ?auto_121427 ?auto_121429 ) ) ( not ( = ?auto_121427 ?auto_121430 ) ) ( not ( = ?auto_121427 ?auto_121431 ) ) ( not ( = ?auto_121426 ?auto_121428 ) ) ( not ( = ?auto_121426 ?auto_121429 ) ) ( not ( = ?auto_121426 ?auto_121430 ) ) ( not ( = ?auto_121426 ?auto_121431 ) ) ( not ( = ?auto_121428 ?auto_121429 ) ) ( not ( = ?auto_121428 ?auto_121430 ) ) ( not ( = ?auto_121428 ?auto_121431 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121429 ?auto_121430 ?auto_121431 )
      ( MAKE-8CRATE-VERIFY ?auto_121423 ?auto_121424 ?auto_121425 ?auto_121427 ?auto_121426 ?auto_121428 ?auto_121429 ?auto_121430 ?auto_121431 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121515 - SURFACE
      ?auto_121516 - SURFACE
      ?auto_121517 - SURFACE
      ?auto_121519 - SURFACE
      ?auto_121518 - SURFACE
      ?auto_121520 - SURFACE
      ?auto_121521 - SURFACE
      ?auto_121522 - SURFACE
      ?auto_121523 - SURFACE
    )
    :vars
    (
      ?auto_121524 - HOIST
      ?auto_121525 - PLACE
      ?auto_121527 - TRUCK
      ?auto_121528 - PLACE
      ?auto_121529 - HOIST
      ?auto_121526 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_121524 ?auto_121525 ) ( SURFACE-AT ?auto_121522 ?auto_121525 ) ( CLEAR ?auto_121522 ) ( IS-CRATE ?auto_121523 ) ( not ( = ?auto_121522 ?auto_121523 ) ) ( AVAILABLE ?auto_121524 ) ( ON ?auto_121522 ?auto_121521 ) ( not ( = ?auto_121521 ?auto_121522 ) ) ( not ( = ?auto_121521 ?auto_121523 ) ) ( TRUCK-AT ?auto_121527 ?auto_121528 ) ( not ( = ?auto_121528 ?auto_121525 ) ) ( HOIST-AT ?auto_121529 ?auto_121528 ) ( not ( = ?auto_121524 ?auto_121529 ) ) ( AVAILABLE ?auto_121529 ) ( SURFACE-AT ?auto_121523 ?auto_121528 ) ( ON ?auto_121523 ?auto_121526 ) ( CLEAR ?auto_121523 ) ( not ( = ?auto_121522 ?auto_121526 ) ) ( not ( = ?auto_121523 ?auto_121526 ) ) ( not ( = ?auto_121521 ?auto_121526 ) ) ( ON ?auto_121516 ?auto_121515 ) ( ON ?auto_121517 ?auto_121516 ) ( ON ?auto_121519 ?auto_121517 ) ( ON ?auto_121518 ?auto_121519 ) ( ON ?auto_121520 ?auto_121518 ) ( ON ?auto_121521 ?auto_121520 ) ( not ( = ?auto_121515 ?auto_121516 ) ) ( not ( = ?auto_121515 ?auto_121517 ) ) ( not ( = ?auto_121515 ?auto_121519 ) ) ( not ( = ?auto_121515 ?auto_121518 ) ) ( not ( = ?auto_121515 ?auto_121520 ) ) ( not ( = ?auto_121515 ?auto_121521 ) ) ( not ( = ?auto_121515 ?auto_121522 ) ) ( not ( = ?auto_121515 ?auto_121523 ) ) ( not ( = ?auto_121515 ?auto_121526 ) ) ( not ( = ?auto_121516 ?auto_121517 ) ) ( not ( = ?auto_121516 ?auto_121519 ) ) ( not ( = ?auto_121516 ?auto_121518 ) ) ( not ( = ?auto_121516 ?auto_121520 ) ) ( not ( = ?auto_121516 ?auto_121521 ) ) ( not ( = ?auto_121516 ?auto_121522 ) ) ( not ( = ?auto_121516 ?auto_121523 ) ) ( not ( = ?auto_121516 ?auto_121526 ) ) ( not ( = ?auto_121517 ?auto_121519 ) ) ( not ( = ?auto_121517 ?auto_121518 ) ) ( not ( = ?auto_121517 ?auto_121520 ) ) ( not ( = ?auto_121517 ?auto_121521 ) ) ( not ( = ?auto_121517 ?auto_121522 ) ) ( not ( = ?auto_121517 ?auto_121523 ) ) ( not ( = ?auto_121517 ?auto_121526 ) ) ( not ( = ?auto_121519 ?auto_121518 ) ) ( not ( = ?auto_121519 ?auto_121520 ) ) ( not ( = ?auto_121519 ?auto_121521 ) ) ( not ( = ?auto_121519 ?auto_121522 ) ) ( not ( = ?auto_121519 ?auto_121523 ) ) ( not ( = ?auto_121519 ?auto_121526 ) ) ( not ( = ?auto_121518 ?auto_121520 ) ) ( not ( = ?auto_121518 ?auto_121521 ) ) ( not ( = ?auto_121518 ?auto_121522 ) ) ( not ( = ?auto_121518 ?auto_121523 ) ) ( not ( = ?auto_121518 ?auto_121526 ) ) ( not ( = ?auto_121520 ?auto_121521 ) ) ( not ( = ?auto_121520 ?auto_121522 ) ) ( not ( = ?auto_121520 ?auto_121523 ) ) ( not ( = ?auto_121520 ?auto_121526 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121521 ?auto_121522 ?auto_121523 )
      ( MAKE-8CRATE-VERIFY ?auto_121515 ?auto_121516 ?auto_121517 ?auto_121519 ?auto_121518 ?auto_121520 ?auto_121521 ?auto_121522 ?auto_121523 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121608 - SURFACE
      ?auto_121609 - SURFACE
      ?auto_121610 - SURFACE
      ?auto_121612 - SURFACE
      ?auto_121611 - SURFACE
      ?auto_121613 - SURFACE
      ?auto_121614 - SURFACE
      ?auto_121615 - SURFACE
      ?auto_121616 - SURFACE
    )
    :vars
    (
      ?auto_121619 - HOIST
      ?auto_121622 - PLACE
      ?auto_121618 - PLACE
      ?auto_121621 - HOIST
      ?auto_121620 - SURFACE
      ?auto_121617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121619 ?auto_121622 ) ( SURFACE-AT ?auto_121615 ?auto_121622 ) ( CLEAR ?auto_121615 ) ( IS-CRATE ?auto_121616 ) ( not ( = ?auto_121615 ?auto_121616 ) ) ( AVAILABLE ?auto_121619 ) ( ON ?auto_121615 ?auto_121614 ) ( not ( = ?auto_121614 ?auto_121615 ) ) ( not ( = ?auto_121614 ?auto_121616 ) ) ( not ( = ?auto_121618 ?auto_121622 ) ) ( HOIST-AT ?auto_121621 ?auto_121618 ) ( not ( = ?auto_121619 ?auto_121621 ) ) ( AVAILABLE ?auto_121621 ) ( SURFACE-AT ?auto_121616 ?auto_121618 ) ( ON ?auto_121616 ?auto_121620 ) ( CLEAR ?auto_121616 ) ( not ( = ?auto_121615 ?auto_121620 ) ) ( not ( = ?auto_121616 ?auto_121620 ) ) ( not ( = ?auto_121614 ?auto_121620 ) ) ( TRUCK-AT ?auto_121617 ?auto_121622 ) ( ON ?auto_121609 ?auto_121608 ) ( ON ?auto_121610 ?auto_121609 ) ( ON ?auto_121612 ?auto_121610 ) ( ON ?auto_121611 ?auto_121612 ) ( ON ?auto_121613 ?auto_121611 ) ( ON ?auto_121614 ?auto_121613 ) ( not ( = ?auto_121608 ?auto_121609 ) ) ( not ( = ?auto_121608 ?auto_121610 ) ) ( not ( = ?auto_121608 ?auto_121612 ) ) ( not ( = ?auto_121608 ?auto_121611 ) ) ( not ( = ?auto_121608 ?auto_121613 ) ) ( not ( = ?auto_121608 ?auto_121614 ) ) ( not ( = ?auto_121608 ?auto_121615 ) ) ( not ( = ?auto_121608 ?auto_121616 ) ) ( not ( = ?auto_121608 ?auto_121620 ) ) ( not ( = ?auto_121609 ?auto_121610 ) ) ( not ( = ?auto_121609 ?auto_121612 ) ) ( not ( = ?auto_121609 ?auto_121611 ) ) ( not ( = ?auto_121609 ?auto_121613 ) ) ( not ( = ?auto_121609 ?auto_121614 ) ) ( not ( = ?auto_121609 ?auto_121615 ) ) ( not ( = ?auto_121609 ?auto_121616 ) ) ( not ( = ?auto_121609 ?auto_121620 ) ) ( not ( = ?auto_121610 ?auto_121612 ) ) ( not ( = ?auto_121610 ?auto_121611 ) ) ( not ( = ?auto_121610 ?auto_121613 ) ) ( not ( = ?auto_121610 ?auto_121614 ) ) ( not ( = ?auto_121610 ?auto_121615 ) ) ( not ( = ?auto_121610 ?auto_121616 ) ) ( not ( = ?auto_121610 ?auto_121620 ) ) ( not ( = ?auto_121612 ?auto_121611 ) ) ( not ( = ?auto_121612 ?auto_121613 ) ) ( not ( = ?auto_121612 ?auto_121614 ) ) ( not ( = ?auto_121612 ?auto_121615 ) ) ( not ( = ?auto_121612 ?auto_121616 ) ) ( not ( = ?auto_121612 ?auto_121620 ) ) ( not ( = ?auto_121611 ?auto_121613 ) ) ( not ( = ?auto_121611 ?auto_121614 ) ) ( not ( = ?auto_121611 ?auto_121615 ) ) ( not ( = ?auto_121611 ?auto_121616 ) ) ( not ( = ?auto_121611 ?auto_121620 ) ) ( not ( = ?auto_121613 ?auto_121614 ) ) ( not ( = ?auto_121613 ?auto_121615 ) ) ( not ( = ?auto_121613 ?auto_121616 ) ) ( not ( = ?auto_121613 ?auto_121620 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121614 ?auto_121615 ?auto_121616 )
      ( MAKE-8CRATE-VERIFY ?auto_121608 ?auto_121609 ?auto_121610 ?auto_121612 ?auto_121611 ?auto_121613 ?auto_121614 ?auto_121615 ?auto_121616 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121701 - SURFACE
      ?auto_121702 - SURFACE
      ?auto_121703 - SURFACE
      ?auto_121705 - SURFACE
      ?auto_121704 - SURFACE
      ?auto_121706 - SURFACE
      ?auto_121707 - SURFACE
      ?auto_121708 - SURFACE
      ?auto_121709 - SURFACE
    )
    :vars
    (
      ?auto_121714 - HOIST
      ?auto_121713 - PLACE
      ?auto_121712 - PLACE
      ?auto_121710 - HOIST
      ?auto_121715 - SURFACE
      ?auto_121711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121714 ?auto_121713 ) ( IS-CRATE ?auto_121709 ) ( not ( = ?auto_121708 ?auto_121709 ) ) ( not ( = ?auto_121707 ?auto_121708 ) ) ( not ( = ?auto_121707 ?auto_121709 ) ) ( not ( = ?auto_121712 ?auto_121713 ) ) ( HOIST-AT ?auto_121710 ?auto_121712 ) ( not ( = ?auto_121714 ?auto_121710 ) ) ( AVAILABLE ?auto_121710 ) ( SURFACE-AT ?auto_121709 ?auto_121712 ) ( ON ?auto_121709 ?auto_121715 ) ( CLEAR ?auto_121709 ) ( not ( = ?auto_121708 ?auto_121715 ) ) ( not ( = ?auto_121709 ?auto_121715 ) ) ( not ( = ?auto_121707 ?auto_121715 ) ) ( TRUCK-AT ?auto_121711 ?auto_121713 ) ( SURFACE-AT ?auto_121707 ?auto_121713 ) ( CLEAR ?auto_121707 ) ( LIFTING ?auto_121714 ?auto_121708 ) ( IS-CRATE ?auto_121708 ) ( ON ?auto_121702 ?auto_121701 ) ( ON ?auto_121703 ?auto_121702 ) ( ON ?auto_121705 ?auto_121703 ) ( ON ?auto_121704 ?auto_121705 ) ( ON ?auto_121706 ?auto_121704 ) ( ON ?auto_121707 ?auto_121706 ) ( not ( = ?auto_121701 ?auto_121702 ) ) ( not ( = ?auto_121701 ?auto_121703 ) ) ( not ( = ?auto_121701 ?auto_121705 ) ) ( not ( = ?auto_121701 ?auto_121704 ) ) ( not ( = ?auto_121701 ?auto_121706 ) ) ( not ( = ?auto_121701 ?auto_121707 ) ) ( not ( = ?auto_121701 ?auto_121708 ) ) ( not ( = ?auto_121701 ?auto_121709 ) ) ( not ( = ?auto_121701 ?auto_121715 ) ) ( not ( = ?auto_121702 ?auto_121703 ) ) ( not ( = ?auto_121702 ?auto_121705 ) ) ( not ( = ?auto_121702 ?auto_121704 ) ) ( not ( = ?auto_121702 ?auto_121706 ) ) ( not ( = ?auto_121702 ?auto_121707 ) ) ( not ( = ?auto_121702 ?auto_121708 ) ) ( not ( = ?auto_121702 ?auto_121709 ) ) ( not ( = ?auto_121702 ?auto_121715 ) ) ( not ( = ?auto_121703 ?auto_121705 ) ) ( not ( = ?auto_121703 ?auto_121704 ) ) ( not ( = ?auto_121703 ?auto_121706 ) ) ( not ( = ?auto_121703 ?auto_121707 ) ) ( not ( = ?auto_121703 ?auto_121708 ) ) ( not ( = ?auto_121703 ?auto_121709 ) ) ( not ( = ?auto_121703 ?auto_121715 ) ) ( not ( = ?auto_121705 ?auto_121704 ) ) ( not ( = ?auto_121705 ?auto_121706 ) ) ( not ( = ?auto_121705 ?auto_121707 ) ) ( not ( = ?auto_121705 ?auto_121708 ) ) ( not ( = ?auto_121705 ?auto_121709 ) ) ( not ( = ?auto_121705 ?auto_121715 ) ) ( not ( = ?auto_121704 ?auto_121706 ) ) ( not ( = ?auto_121704 ?auto_121707 ) ) ( not ( = ?auto_121704 ?auto_121708 ) ) ( not ( = ?auto_121704 ?auto_121709 ) ) ( not ( = ?auto_121704 ?auto_121715 ) ) ( not ( = ?auto_121706 ?auto_121707 ) ) ( not ( = ?auto_121706 ?auto_121708 ) ) ( not ( = ?auto_121706 ?auto_121709 ) ) ( not ( = ?auto_121706 ?auto_121715 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121707 ?auto_121708 ?auto_121709 )
      ( MAKE-8CRATE-VERIFY ?auto_121701 ?auto_121702 ?auto_121703 ?auto_121705 ?auto_121704 ?auto_121706 ?auto_121707 ?auto_121708 ?auto_121709 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_121794 - SURFACE
      ?auto_121795 - SURFACE
      ?auto_121796 - SURFACE
      ?auto_121798 - SURFACE
      ?auto_121797 - SURFACE
      ?auto_121799 - SURFACE
      ?auto_121800 - SURFACE
      ?auto_121801 - SURFACE
      ?auto_121802 - SURFACE
    )
    :vars
    (
      ?auto_121804 - HOIST
      ?auto_121803 - PLACE
      ?auto_121807 - PLACE
      ?auto_121805 - HOIST
      ?auto_121808 - SURFACE
      ?auto_121806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_121804 ?auto_121803 ) ( IS-CRATE ?auto_121802 ) ( not ( = ?auto_121801 ?auto_121802 ) ) ( not ( = ?auto_121800 ?auto_121801 ) ) ( not ( = ?auto_121800 ?auto_121802 ) ) ( not ( = ?auto_121807 ?auto_121803 ) ) ( HOIST-AT ?auto_121805 ?auto_121807 ) ( not ( = ?auto_121804 ?auto_121805 ) ) ( AVAILABLE ?auto_121805 ) ( SURFACE-AT ?auto_121802 ?auto_121807 ) ( ON ?auto_121802 ?auto_121808 ) ( CLEAR ?auto_121802 ) ( not ( = ?auto_121801 ?auto_121808 ) ) ( not ( = ?auto_121802 ?auto_121808 ) ) ( not ( = ?auto_121800 ?auto_121808 ) ) ( TRUCK-AT ?auto_121806 ?auto_121803 ) ( SURFACE-AT ?auto_121800 ?auto_121803 ) ( CLEAR ?auto_121800 ) ( IS-CRATE ?auto_121801 ) ( AVAILABLE ?auto_121804 ) ( IN ?auto_121801 ?auto_121806 ) ( ON ?auto_121795 ?auto_121794 ) ( ON ?auto_121796 ?auto_121795 ) ( ON ?auto_121798 ?auto_121796 ) ( ON ?auto_121797 ?auto_121798 ) ( ON ?auto_121799 ?auto_121797 ) ( ON ?auto_121800 ?auto_121799 ) ( not ( = ?auto_121794 ?auto_121795 ) ) ( not ( = ?auto_121794 ?auto_121796 ) ) ( not ( = ?auto_121794 ?auto_121798 ) ) ( not ( = ?auto_121794 ?auto_121797 ) ) ( not ( = ?auto_121794 ?auto_121799 ) ) ( not ( = ?auto_121794 ?auto_121800 ) ) ( not ( = ?auto_121794 ?auto_121801 ) ) ( not ( = ?auto_121794 ?auto_121802 ) ) ( not ( = ?auto_121794 ?auto_121808 ) ) ( not ( = ?auto_121795 ?auto_121796 ) ) ( not ( = ?auto_121795 ?auto_121798 ) ) ( not ( = ?auto_121795 ?auto_121797 ) ) ( not ( = ?auto_121795 ?auto_121799 ) ) ( not ( = ?auto_121795 ?auto_121800 ) ) ( not ( = ?auto_121795 ?auto_121801 ) ) ( not ( = ?auto_121795 ?auto_121802 ) ) ( not ( = ?auto_121795 ?auto_121808 ) ) ( not ( = ?auto_121796 ?auto_121798 ) ) ( not ( = ?auto_121796 ?auto_121797 ) ) ( not ( = ?auto_121796 ?auto_121799 ) ) ( not ( = ?auto_121796 ?auto_121800 ) ) ( not ( = ?auto_121796 ?auto_121801 ) ) ( not ( = ?auto_121796 ?auto_121802 ) ) ( not ( = ?auto_121796 ?auto_121808 ) ) ( not ( = ?auto_121798 ?auto_121797 ) ) ( not ( = ?auto_121798 ?auto_121799 ) ) ( not ( = ?auto_121798 ?auto_121800 ) ) ( not ( = ?auto_121798 ?auto_121801 ) ) ( not ( = ?auto_121798 ?auto_121802 ) ) ( not ( = ?auto_121798 ?auto_121808 ) ) ( not ( = ?auto_121797 ?auto_121799 ) ) ( not ( = ?auto_121797 ?auto_121800 ) ) ( not ( = ?auto_121797 ?auto_121801 ) ) ( not ( = ?auto_121797 ?auto_121802 ) ) ( not ( = ?auto_121797 ?auto_121808 ) ) ( not ( = ?auto_121799 ?auto_121800 ) ) ( not ( = ?auto_121799 ?auto_121801 ) ) ( not ( = ?auto_121799 ?auto_121802 ) ) ( not ( = ?auto_121799 ?auto_121808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_121800 ?auto_121801 ?auto_121802 )
      ( MAKE-8CRATE-VERIFY ?auto_121794 ?auto_121795 ?auto_121796 ?auto_121798 ?auto_121797 ?auto_121799 ?auto_121800 ?auto_121801 ?auto_121802 ) )
  )

)

