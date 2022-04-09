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
      ?auto_11317 - SURFACE
      ?auto_11318 - SURFACE
    )
    :vars
    (
      ?auto_11319 - HOIST
      ?auto_11320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11319 ?auto_11320 ) ( SURFACE-AT ?auto_11317 ?auto_11320 ) ( CLEAR ?auto_11317 ) ( LIFTING ?auto_11319 ?auto_11318 ) ( IS-CRATE ?auto_11318 ) ( not ( = ?auto_11317 ?auto_11318 ) ) )
    :subtasks
    ( ( !DROP ?auto_11319 ?auto_11318 ?auto_11317 ?auto_11320 )
      ( MAKE-1CRATE-VERIFY ?auto_11317 ?auto_11318 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11321 - SURFACE
      ?auto_11322 - SURFACE
    )
    :vars
    (
      ?auto_11324 - HOIST
      ?auto_11323 - PLACE
      ?auto_11325 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11324 ?auto_11323 ) ( SURFACE-AT ?auto_11321 ?auto_11323 ) ( CLEAR ?auto_11321 ) ( IS-CRATE ?auto_11322 ) ( not ( = ?auto_11321 ?auto_11322 ) ) ( TRUCK-AT ?auto_11325 ?auto_11323 ) ( AVAILABLE ?auto_11324 ) ( IN ?auto_11322 ?auto_11325 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11324 ?auto_11322 ?auto_11325 ?auto_11323 )
      ( MAKE-1CRATE ?auto_11321 ?auto_11322 )
      ( MAKE-1CRATE-VERIFY ?auto_11321 ?auto_11322 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11326 - SURFACE
      ?auto_11327 - SURFACE
    )
    :vars
    (
      ?auto_11328 - HOIST
      ?auto_11330 - PLACE
      ?auto_11329 - TRUCK
      ?auto_11331 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11328 ?auto_11330 ) ( SURFACE-AT ?auto_11326 ?auto_11330 ) ( CLEAR ?auto_11326 ) ( IS-CRATE ?auto_11327 ) ( not ( = ?auto_11326 ?auto_11327 ) ) ( AVAILABLE ?auto_11328 ) ( IN ?auto_11327 ?auto_11329 ) ( TRUCK-AT ?auto_11329 ?auto_11331 ) ( not ( = ?auto_11331 ?auto_11330 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11329 ?auto_11331 ?auto_11330 )
      ( MAKE-1CRATE ?auto_11326 ?auto_11327 )
      ( MAKE-1CRATE-VERIFY ?auto_11326 ?auto_11327 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11332 - SURFACE
      ?auto_11333 - SURFACE
    )
    :vars
    (
      ?auto_11337 - HOIST
      ?auto_11334 - PLACE
      ?auto_11336 - TRUCK
      ?auto_11335 - PLACE
      ?auto_11338 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11337 ?auto_11334 ) ( SURFACE-AT ?auto_11332 ?auto_11334 ) ( CLEAR ?auto_11332 ) ( IS-CRATE ?auto_11333 ) ( not ( = ?auto_11332 ?auto_11333 ) ) ( AVAILABLE ?auto_11337 ) ( TRUCK-AT ?auto_11336 ?auto_11335 ) ( not ( = ?auto_11335 ?auto_11334 ) ) ( HOIST-AT ?auto_11338 ?auto_11335 ) ( LIFTING ?auto_11338 ?auto_11333 ) ( not ( = ?auto_11337 ?auto_11338 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11338 ?auto_11333 ?auto_11336 ?auto_11335 )
      ( MAKE-1CRATE ?auto_11332 ?auto_11333 )
      ( MAKE-1CRATE-VERIFY ?auto_11332 ?auto_11333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11339 - SURFACE
      ?auto_11340 - SURFACE
    )
    :vars
    (
      ?auto_11342 - HOIST
      ?auto_11341 - PLACE
      ?auto_11343 - TRUCK
      ?auto_11345 - PLACE
      ?auto_11344 - HOIST
      ?auto_11346 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11342 ?auto_11341 ) ( SURFACE-AT ?auto_11339 ?auto_11341 ) ( CLEAR ?auto_11339 ) ( IS-CRATE ?auto_11340 ) ( not ( = ?auto_11339 ?auto_11340 ) ) ( AVAILABLE ?auto_11342 ) ( TRUCK-AT ?auto_11343 ?auto_11345 ) ( not ( = ?auto_11345 ?auto_11341 ) ) ( HOIST-AT ?auto_11344 ?auto_11345 ) ( not ( = ?auto_11342 ?auto_11344 ) ) ( AVAILABLE ?auto_11344 ) ( SURFACE-AT ?auto_11340 ?auto_11345 ) ( ON ?auto_11340 ?auto_11346 ) ( CLEAR ?auto_11340 ) ( not ( = ?auto_11339 ?auto_11346 ) ) ( not ( = ?auto_11340 ?auto_11346 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11344 ?auto_11340 ?auto_11346 ?auto_11345 )
      ( MAKE-1CRATE ?auto_11339 ?auto_11340 )
      ( MAKE-1CRATE-VERIFY ?auto_11339 ?auto_11340 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11347 - SURFACE
      ?auto_11348 - SURFACE
    )
    :vars
    (
      ?auto_11349 - HOIST
      ?auto_11352 - PLACE
      ?auto_11350 - PLACE
      ?auto_11351 - HOIST
      ?auto_11353 - SURFACE
      ?auto_11354 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11349 ?auto_11352 ) ( SURFACE-AT ?auto_11347 ?auto_11352 ) ( CLEAR ?auto_11347 ) ( IS-CRATE ?auto_11348 ) ( not ( = ?auto_11347 ?auto_11348 ) ) ( AVAILABLE ?auto_11349 ) ( not ( = ?auto_11350 ?auto_11352 ) ) ( HOIST-AT ?auto_11351 ?auto_11350 ) ( not ( = ?auto_11349 ?auto_11351 ) ) ( AVAILABLE ?auto_11351 ) ( SURFACE-AT ?auto_11348 ?auto_11350 ) ( ON ?auto_11348 ?auto_11353 ) ( CLEAR ?auto_11348 ) ( not ( = ?auto_11347 ?auto_11353 ) ) ( not ( = ?auto_11348 ?auto_11353 ) ) ( TRUCK-AT ?auto_11354 ?auto_11352 ) )
    :subtasks
    ( ( !DRIVE ?auto_11354 ?auto_11352 ?auto_11350 )
      ( MAKE-1CRATE ?auto_11347 ?auto_11348 )
      ( MAKE-1CRATE-VERIFY ?auto_11347 ?auto_11348 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11360 - SURFACE
      ?auto_11361 - SURFACE
    )
    :vars
    (
      ?auto_11362 - HOIST
      ?auto_11363 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11362 ?auto_11363 ) ( SURFACE-AT ?auto_11360 ?auto_11363 ) ( CLEAR ?auto_11360 ) ( LIFTING ?auto_11362 ?auto_11361 ) ( IS-CRATE ?auto_11361 ) ( not ( = ?auto_11360 ?auto_11361 ) ) )
    :subtasks
    ( ( !DROP ?auto_11362 ?auto_11361 ?auto_11360 ?auto_11363 )
      ( MAKE-1CRATE-VERIFY ?auto_11360 ?auto_11361 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11364 - SURFACE
      ?auto_11365 - SURFACE
      ?auto_11366 - SURFACE
    )
    :vars
    (
      ?auto_11367 - HOIST
      ?auto_11368 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11367 ?auto_11368 ) ( SURFACE-AT ?auto_11365 ?auto_11368 ) ( CLEAR ?auto_11365 ) ( LIFTING ?auto_11367 ?auto_11366 ) ( IS-CRATE ?auto_11366 ) ( not ( = ?auto_11365 ?auto_11366 ) ) ( ON ?auto_11365 ?auto_11364 ) ( not ( = ?auto_11364 ?auto_11365 ) ) ( not ( = ?auto_11364 ?auto_11366 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11365 ?auto_11366 )
      ( MAKE-2CRATE-VERIFY ?auto_11364 ?auto_11365 ?auto_11366 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11369 - SURFACE
      ?auto_11370 - SURFACE
    )
    :vars
    (
      ?auto_11371 - HOIST
      ?auto_11372 - PLACE
      ?auto_11373 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11371 ?auto_11372 ) ( SURFACE-AT ?auto_11369 ?auto_11372 ) ( CLEAR ?auto_11369 ) ( IS-CRATE ?auto_11370 ) ( not ( = ?auto_11369 ?auto_11370 ) ) ( TRUCK-AT ?auto_11373 ?auto_11372 ) ( AVAILABLE ?auto_11371 ) ( IN ?auto_11370 ?auto_11373 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11371 ?auto_11370 ?auto_11373 ?auto_11372 )
      ( MAKE-1CRATE ?auto_11369 ?auto_11370 )
      ( MAKE-1CRATE-VERIFY ?auto_11369 ?auto_11370 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11374 - SURFACE
      ?auto_11375 - SURFACE
      ?auto_11376 - SURFACE
    )
    :vars
    (
      ?auto_11377 - HOIST
      ?auto_11378 - PLACE
      ?auto_11379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11377 ?auto_11378 ) ( SURFACE-AT ?auto_11375 ?auto_11378 ) ( CLEAR ?auto_11375 ) ( IS-CRATE ?auto_11376 ) ( not ( = ?auto_11375 ?auto_11376 ) ) ( TRUCK-AT ?auto_11379 ?auto_11378 ) ( AVAILABLE ?auto_11377 ) ( IN ?auto_11376 ?auto_11379 ) ( ON ?auto_11375 ?auto_11374 ) ( not ( = ?auto_11374 ?auto_11375 ) ) ( not ( = ?auto_11374 ?auto_11376 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11375 ?auto_11376 )
      ( MAKE-2CRATE-VERIFY ?auto_11374 ?auto_11375 ?auto_11376 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11380 - SURFACE
      ?auto_11381 - SURFACE
    )
    :vars
    (
      ?auto_11384 - HOIST
      ?auto_11385 - PLACE
      ?auto_11383 - TRUCK
      ?auto_11382 - SURFACE
      ?auto_11386 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11384 ?auto_11385 ) ( SURFACE-AT ?auto_11380 ?auto_11385 ) ( CLEAR ?auto_11380 ) ( IS-CRATE ?auto_11381 ) ( not ( = ?auto_11380 ?auto_11381 ) ) ( AVAILABLE ?auto_11384 ) ( IN ?auto_11381 ?auto_11383 ) ( ON ?auto_11380 ?auto_11382 ) ( not ( = ?auto_11382 ?auto_11380 ) ) ( not ( = ?auto_11382 ?auto_11381 ) ) ( TRUCK-AT ?auto_11383 ?auto_11386 ) ( not ( = ?auto_11386 ?auto_11385 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11383 ?auto_11386 ?auto_11385 )
      ( MAKE-2CRATE ?auto_11382 ?auto_11380 ?auto_11381 )
      ( MAKE-1CRATE-VERIFY ?auto_11380 ?auto_11381 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11387 - SURFACE
      ?auto_11388 - SURFACE
      ?auto_11389 - SURFACE
    )
    :vars
    (
      ?auto_11390 - HOIST
      ?auto_11391 - PLACE
      ?auto_11393 - TRUCK
      ?auto_11392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11390 ?auto_11391 ) ( SURFACE-AT ?auto_11388 ?auto_11391 ) ( CLEAR ?auto_11388 ) ( IS-CRATE ?auto_11389 ) ( not ( = ?auto_11388 ?auto_11389 ) ) ( AVAILABLE ?auto_11390 ) ( IN ?auto_11389 ?auto_11393 ) ( ON ?auto_11388 ?auto_11387 ) ( not ( = ?auto_11387 ?auto_11388 ) ) ( not ( = ?auto_11387 ?auto_11389 ) ) ( TRUCK-AT ?auto_11393 ?auto_11392 ) ( not ( = ?auto_11392 ?auto_11391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11388 ?auto_11389 )
      ( MAKE-2CRATE-VERIFY ?auto_11387 ?auto_11388 ?auto_11389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11394 - SURFACE
      ?auto_11395 - SURFACE
    )
    :vars
    (
      ?auto_11399 - HOIST
      ?auto_11398 - PLACE
      ?auto_11397 - SURFACE
      ?auto_11400 - TRUCK
      ?auto_11396 - PLACE
      ?auto_11401 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11399 ?auto_11398 ) ( SURFACE-AT ?auto_11394 ?auto_11398 ) ( CLEAR ?auto_11394 ) ( IS-CRATE ?auto_11395 ) ( not ( = ?auto_11394 ?auto_11395 ) ) ( AVAILABLE ?auto_11399 ) ( ON ?auto_11394 ?auto_11397 ) ( not ( = ?auto_11397 ?auto_11394 ) ) ( not ( = ?auto_11397 ?auto_11395 ) ) ( TRUCK-AT ?auto_11400 ?auto_11396 ) ( not ( = ?auto_11396 ?auto_11398 ) ) ( HOIST-AT ?auto_11401 ?auto_11396 ) ( LIFTING ?auto_11401 ?auto_11395 ) ( not ( = ?auto_11399 ?auto_11401 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11401 ?auto_11395 ?auto_11400 ?auto_11396 )
      ( MAKE-2CRATE ?auto_11397 ?auto_11394 ?auto_11395 )
      ( MAKE-1CRATE-VERIFY ?auto_11394 ?auto_11395 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11402 - SURFACE
      ?auto_11403 - SURFACE
      ?auto_11404 - SURFACE
    )
    :vars
    (
      ?auto_11405 - HOIST
      ?auto_11406 - PLACE
      ?auto_11409 - TRUCK
      ?auto_11408 - PLACE
      ?auto_11407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11405 ?auto_11406 ) ( SURFACE-AT ?auto_11403 ?auto_11406 ) ( CLEAR ?auto_11403 ) ( IS-CRATE ?auto_11404 ) ( not ( = ?auto_11403 ?auto_11404 ) ) ( AVAILABLE ?auto_11405 ) ( ON ?auto_11403 ?auto_11402 ) ( not ( = ?auto_11402 ?auto_11403 ) ) ( not ( = ?auto_11402 ?auto_11404 ) ) ( TRUCK-AT ?auto_11409 ?auto_11408 ) ( not ( = ?auto_11408 ?auto_11406 ) ) ( HOIST-AT ?auto_11407 ?auto_11408 ) ( LIFTING ?auto_11407 ?auto_11404 ) ( not ( = ?auto_11405 ?auto_11407 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11403 ?auto_11404 )
      ( MAKE-2CRATE-VERIFY ?auto_11402 ?auto_11403 ?auto_11404 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11410 - SURFACE
      ?auto_11411 - SURFACE
    )
    :vars
    (
      ?auto_11414 - HOIST
      ?auto_11417 - PLACE
      ?auto_11412 - SURFACE
      ?auto_11415 - TRUCK
      ?auto_11413 - PLACE
      ?auto_11416 - HOIST
      ?auto_11418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11414 ?auto_11417 ) ( SURFACE-AT ?auto_11410 ?auto_11417 ) ( CLEAR ?auto_11410 ) ( IS-CRATE ?auto_11411 ) ( not ( = ?auto_11410 ?auto_11411 ) ) ( AVAILABLE ?auto_11414 ) ( ON ?auto_11410 ?auto_11412 ) ( not ( = ?auto_11412 ?auto_11410 ) ) ( not ( = ?auto_11412 ?auto_11411 ) ) ( TRUCK-AT ?auto_11415 ?auto_11413 ) ( not ( = ?auto_11413 ?auto_11417 ) ) ( HOIST-AT ?auto_11416 ?auto_11413 ) ( not ( = ?auto_11414 ?auto_11416 ) ) ( AVAILABLE ?auto_11416 ) ( SURFACE-AT ?auto_11411 ?auto_11413 ) ( ON ?auto_11411 ?auto_11418 ) ( CLEAR ?auto_11411 ) ( not ( = ?auto_11410 ?auto_11418 ) ) ( not ( = ?auto_11411 ?auto_11418 ) ) ( not ( = ?auto_11412 ?auto_11418 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11416 ?auto_11411 ?auto_11418 ?auto_11413 )
      ( MAKE-2CRATE ?auto_11412 ?auto_11410 ?auto_11411 )
      ( MAKE-1CRATE-VERIFY ?auto_11410 ?auto_11411 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11419 - SURFACE
      ?auto_11420 - SURFACE
      ?auto_11421 - SURFACE
    )
    :vars
    (
      ?auto_11423 - HOIST
      ?auto_11427 - PLACE
      ?auto_11422 - TRUCK
      ?auto_11424 - PLACE
      ?auto_11426 - HOIST
      ?auto_11425 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11423 ?auto_11427 ) ( SURFACE-AT ?auto_11420 ?auto_11427 ) ( CLEAR ?auto_11420 ) ( IS-CRATE ?auto_11421 ) ( not ( = ?auto_11420 ?auto_11421 ) ) ( AVAILABLE ?auto_11423 ) ( ON ?auto_11420 ?auto_11419 ) ( not ( = ?auto_11419 ?auto_11420 ) ) ( not ( = ?auto_11419 ?auto_11421 ) ) ( TRUCK-AT ?auto_11422 ?auto_11424 ) ( not ( = ?auto_11424 ?auto_11427 ) ) ( HOIST-AT ?auto_11426 ?auto_11424 ) ( not ( = ?auto_11423 ?auto_11426 ) ) ( AVAILABLE ?auto_11426 ) ( SURFACE-AT ?auto_11421 ?auto_11424 ) ( ON ?auto_11421 ?auto_11425 ) ( CLEAR ?auto_11421 ) ( not ( = ?auto_11420 ?auto_11425 ) ) ( not ( = ?auto_11421 ?auto_11425 ) ) ( not ( = ?auto_11419 ?auto_11425 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11420 ?auto_11421 )
      ( MAKE-2CRATE-VERIFY ?auto_11419 ?auto_11420 ?auto_11421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11428 - SURFACE
      ?auto_11429 - SURFACE
    )
    :vars
    (
      ?auto_11436 - HOIST
      ?auto_11431 - PLACE
      ?auto_11432 - SURFACE
      ?auto_11433 - PLACE
      ?auto_11430 - HOIST
      ?auto_11434 - SURFACE
      ?auto_11435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11436 ?auto_11431 ) ( SURFACE-AT ?auto_11428 ?auto_11431 ) ( CLEAR ?auto_11428 ) ( IS-CRATE ?auto_11429 ) ( not ( = ?auto_11428 ?auto_11429 ) ) ( AVAILABLE ?auto_11436 ) ( ON ?auto_11428 ?auto_11432 ) ( not ( = ?auto_11432 ?auto_11428 ) ) ( not ( = ?auto_11432 ?auto_11429 ) ) ( not ( = ?auto_11433 ?auto_11431 ) ) ( HOIST-AT ?auto_11430 ?auto_11433 ) ( not ( = ?auto_11436 ?auto_11430 ) ) ( AVAILABLE ?auto_11430 ) ( SURFACE-AT ?auto_11429 ?auto_11433 ) ( ON ?auto_11429 ?auto_11434 ) ( CLEAR ?auto_11429 ) ( not ( = ?auto_11428 ?auto_11434 ) ) ( not ( = ?auto_11429 ?auto_11434 ) ) ( not ( = ?auto_11432 ?auto_11434 ) ) ( TRUCK-AT ?auto_11435 ?auto_11431 ) )
    :subtasks
    ( ( !DRIVE ?auto_11435 ?auto_11431 ?auto_11433 )
      ( MAKE-2CRATE ?auto_11432 ?auto_11428 ?auto_11429 )
      ( MAKE-1CRATE-VERIFY ?auto_11428 ?auto_11429 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11437 - SURFACE
      ?auto_11438 - SURFACE
      ?auto_11439 - SURFACE
    )
    :vars
    (
      ?auto_11441 - HOIST
      ?auto_11445 - PLACE
      ?auto_11443 - PLACE
      ?auto_11444 - HOIST
      ?auto_11442 - SURFACE
      ?auto_11440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11441 ?auto_11445 ) ( SURFACE-AT ?auto_11438 ?auto_11445 ) ( CLEAR ?auto_11438 ) ( IS-CRATE ?auto_11439 ) ( not ( = ?auto_11438 ?auto_11439 ) ) ( AVAILABLE ?auto_11441 ) ( ON ?auto_11438 ?auto_11437 ) ( not ( = ?auto_11437 ?auto_11438 ) ) ( not ( = ?auto_11437 ?auto_11439 ) ) ( not ( = ?auto_11443 ?auto_11445 ) ) ( HOIST-AT ?auto_11444 ?auto_11443 ) ( not ( = ?auto_11441 ?auto_11444 ) ) ( AVAILABLE ?auto_11444 ) ( SURFACE-AT ?auto_11439 ?auto_11443 ) ( ON ?auto_11439 ?auto_11442 ) ( CLEAR ?auto_11439 ) ( not ( = ?auto_11438 ?auto_11442 ) ) ( not ( = ?auto_11439 ?auto_11442 ) ) ( not ( = ?auto_11437 ?auto_11442 ) ) ( TRUCK-AT ?auto_11440 ?auto_11445 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11438 ?auto_11439 )
      ( MAKE-2CRATE-VERIFY ?auto_11437 ?auto_11438 ?auto_11439 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11446 - SURFACE
      ?auto_11447 - SURFACE
    )
    :vars
    (
      ?auto_11452 - HOIST
      ?auto_11448 - PLACE
      ?auto_11450 - SURFACE
      ?auto_11454 - PLACE
      ?auto_11453 - HOIST
      ?auto_11449 - SURFACE
      ?auto_11451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11452 ?auto_11448 ) ( IS-CRATE ?auto_11447 ) ( not ( = ?auto_11446 ?auto_11447 ) ) ( not ( = ?auto_11450 ?auto_11446 ) ) ( not ( = ?auto_11450 ?auto_11447 ) ) ( not ( = ?auto_11454 ?auto_11448 ) ) ( HOIST-AT ?auto_11453 ?auto_11454 ) ( not ( = ?auto_11452 ?auto_11453 ) ) ( AVAILABLE ?auto_11453 ) ( SURFACE-AT ?auto_11447 ?auto_11454 ) ( ON ?auto_11447 ?auto_11449 ) ( CLEAR ?auto_11447 ) ( not ( = ?auto_11446 ?auto_11449 ) ) ( not ( = ?auto_11447 ?auto_11449 ) ) ( not ( = ?auto_11450 ?auto_11449 ) ) ( TRUCK-AT ?auto_11451 ?auto_11448 ) ( SURFACE-AT ?auto_11450 ?auto_11448 ) ( CLEAR ?auto_11450 ) ( LIFTING ?auto_11452 ?auto_11446 ) ( IS-CRATE ?auto_11446 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11450 ?auto_11446 )
      ( MAKE-2CRATE ?auto_11450 ?auto_11446 ?auto_11447 )
      ( MAKE-1CRATE-VERIFY ?auto_11446 ?auto_11447 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11455 - SURFACE
      ?auto_11456 - SURFACE
      ?auto_11457 - SURFACE
    )
    :vars
    (
      ?auto_11463 - HOIST
      ?auto_11459 - PLACE
      ?auto_11458 - PLACE
      ?auto_11461 - HOIST
      ?auto_11462 - SURFACE
      ?auto_11460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11463 ?auto_11459 ) ( IS-CRATE ?auto_11457 ) ( not ( = ?auto_11456 ?auto_11457 ) ) ( not ( = ?auto_11455 ?auto_11456 ) ) ( not ( = ?auto_11455 ?auto_11457 ) ) ( not ( = ?auto_11458 ?auto_11459 ) ) ( HOIST-AT ?auto_11461 ?auto_11458 ) ( not ( = ?auto_11463 ?auto_11461 ) ) ( AVAILABLE ?auto_11461 ) ( SURFACE-AT ?auto_11457 ?auto_11458 ) ( ON ?auto_11457 ?auto_11462 ) ( CLEAR ?auto_11457 ) ( not ( = ?auto_11456 ?auto_11462 ) ) ( not ( = ?auto_11457 ?auto_11462 ) ) ( not ( = ?auto_11455 ?auto_11462 ) ) ( TRUCK-AT ?auto_11460 ?auto_11459 ) ( SURFACE-AT ?auto_11455 ?auto_11459 ) ( CLEAR ?auto_11455 ) ( LIFTING ?auto_11463 ?auto_11456 ) ( IS-CRATE ?auto_11456 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11456 ?auto_11457 )
      ( MAKE-2CRATE-VERIFY ?auto_11455 ?auto_11456 ?auto_11457 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11464 - SURFACE
      ?auto_11465 - SURFACE
    )
    :vars
    (
      ?auto_11470 - HOIST
      ?auto_11469 - PLACE
      ?auto_11471 - SURFACE
      ?auto_11467 - PLACE
      ?auto_11466 - HOIST
      ?auto_11468 - SURFACE
      ?auto_11472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11470 ?auto_11469 ) ( IS-CRATE ?auto_11465 ) ( not ( = ?auto_11464 ?auto_11465 ) ) ( not ( = ?auto_11471 ?auto_11464 ) ) ( not ( = ?auto_11471 ?auto_11465 ) ) ( not ( = ?auto_11467 ?auto_11469 ) ) ( HOIST-AT ?auto_11466 ?auto_11467 ) ( not ( = ?auto_11470 ?auto_11466 ) ) ( AVAILABLE ?auto_11466 ) ( SURFACE-AT ?auto_11465 ?auto_11467 ) ( ON ?auto_11465 ?auto_11468 ) ( CLEAR ?auto_11465 ) ( not ( = ?auto_11464 ?auto_11468 ) ) ( not ( = ?auto_11465 ?auto_11468 ) ) ( not ( = ?auto_11471 ?auto_11468 ) ) ( TRUCK-AT ?auto_11472 ?auto_11469 ) ( SURFACE-AT ?auto_11471 ?auto_11469 ) ( CLEAR ?auto_11471 ) ( IS-CRATE ?auto_11464 ) ( AVAILABLE ?auto_11470 ) ( IN ?auto_11464 ?auto_11472 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11470 ?auto_11464 ?auto_11472 ?auto_11469 )
      ( MAKE-2CRATE ?auto_11471 ?auto_11464 ?auto_11465 )
      ( MAKE-1CRATE-VERIFY ?auto_11464 ?auto_11465 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11473 - SURFACE
      ?auto_11474 - SURFACE
      ?auto_11475 - SURFACE
    )
    :vars
    (
      ?auto_11479 - HOIST
      ?auto_11480 - PLACE
      ?auto_11476 - PLACE
      ?auto_11481 - HOIST
      ?auto_11477 - SURFACE
      ?auto_11478 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11479 ?auto_11480 ) ( IS-CRATE ?auto_11475 ) ( not ( = ?auto_11474 ?auto_11475 ) ) ( not ( = ?auto_11473 ?auto_11474 ) ) ( not ( = ?auto_11473 ?auto_11475 ) ) ( not ( = ?auto_11476 ?auto_11480 ) ) ( HOIST-AT ?auto_11481 ?auto_11476 ) ( not ( = ?auto_11479 ?auto_11481 ) ) ( AVAILABLE ?auto_11481 ) ( SURFACE-AT ?auto_11475 ?auto_11476 ) ( ON ?auto_11475 ?auto_11477 ) ( CLEAR ?auto_11475 ) ( not ( = ?auto_11474 ?auto_11477 ) ) ( not ( = ?auto_11475 ?auto_11477 ) ) ( not ( = ?auto_11473 ?auto_11477 ) ) ( TRUCK-AT ?auto_11478 ?auto_11480 ) ( SURFACE-AT ?auto_11473 ?auto_11480 ) ( CLEAR ?auto_11473 ) ( IS-CRATE ?auto_11474 ) ( AVAILABLE ?auto_11479 ) ( IN ?auto_11474 ?auto_11478 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11474 ?auto_11475 )
      ( MAKE-2CRATE-VERIFY ?auto_11473 ?auto_11474 ?auto_11475 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11482 - SURFACE
      ?auto_11483 - SURFACE
    )
    :vars
    (
      ?auto_11490 - HOIST
      ?auto_11484 - PLACE
      ?auto_11489 - SURFACE
      ?auto_11488 - PLACE
      ?auto_11485 - HOIST
      ?auto_11487 - SURFACE
      ?auto_11486 - TRUCK
      ?auto_11491 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11490 ?auto_11484 ) ( IS-CRATE ?auto_11483 ) ( not ( = ?auto_11482 ?auto_11483 ) ) ( not ( = ?auto_11489 ?auto_11482 ) ) ( not ( = ?auto_11489 ?auto_11483 ) ) ( not ( = ?auto_11488 ?auto_11484 ) ) ( HOIST-AT ?auto_11485 ?auto_11488 ) ( not ( = ?auto_11490 ?auto_11485 ) ) ( AVAILABLE ?auto_11485 ) ( SURFACE-AT ?auto_11483 ?auto_11488 ) ( ON ?auto_11483 ?auto_11487 ) ( CLEAR ?auto_11483 ) ( not ( = ?auto_11482 ?auto_11487 ) ) ( not ( = ?auto_11483 ?auto_11487 ) ) ( not ( = ?auto_11489 ?auto_11487 ) ) ( SURFACE-AT ?auto_11489 ?auto_11484 ) ( CLEAR ?auto_11489 ) ( IS-CRATE ?auto_11482 ) ( AVAILABLE ?auto_11490 ) ( IN ?auto_11482 ?auto_11486 ) ( TRUCK-AT ?auto_11486 ?auto_11491 ) ( not ( = ?auto_11491 ?auto_11484 ) ) ( not ( = ?auto_11488 ?auto_11491 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11486 ?auto_11491 ?auto_11484 )
      ( MAKE-2CRATE ?auto_11489 ?auto_11482 ?auto_11483 )
      ( MAKE-1CRATE-VERIFY ?auto_11482 ?auto_11483 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11492 - SURFACE
      ?auto_11493 - SURFACE
      ?auto_11494 - SURFACE
    )
    :vars
    (
      ?auto_11500 - HOIST
      ?auto_11501 - PLACE
      ?auto_11497 - PLACE
      ?auto_11495 - HOIST
      ?auto_11499 - SURFACE
      ?auto_11498 - TRUCK
      ?auto_11496 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11500 ?auto_11501 ) ( IS-CRATE ?auto_11494 ) ( not ( = ?auto_11493 ?auto_11494 ) ) ( not ( = ?auto_11492 ?auto_11493 ) ) ( not ( = ?auto_11492 ?auto_11494 ) ) ( not ( = ?auto_11497 ?auto_11501 ) ) ( HOIST-AT ?auto_11495 ?auto_11497 ) ( not ( = ?auto_11500 ?auto_11495 ) ) ( AVAILABLE ?auto_11495 ) ( SURFACE-AT ?auto_11494 ?auto_11497 ) ( ON ?auto_11494 ?auto_11499 ) ( CLEAR ?auto_11494 ) ( not ( = ?auto_11493 ?auto_11499 ) ) ( not ( = ?auto_11494 ?auto_11499 ) ) ( not ( = ?auto_11492 ?auto_11499 ) ) ( SURFACE-AT ?auto_11492 ?auto_11501 ) ( CLEAR ?auto_11492 ) ( IS-CRATE ?auto_11493 ) ( AVAILABLE ?auto_11500 ) ( IN ?auto_11493 ?auto_11498 ) ( TRUCK-AT ?auto_11498 ?auto_11496 ) ( not ( = ?auto_11496 ?auto_11501 ) ) ( not ( = ?auto_11497 ?auto_11496 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11493 ?auto_11494 )
      ( MAKE-2CRATE-VERIFY ?auto_11492 ?auto_11493 ?auto_11494 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11502 - SURFACE
      ?auto_11503 - SURFACE
    )
    :vars
    (
      ?auto_11504 - HOIST
      ?auto_11506 - PLACE
      ?auto_11505 - SURFACE
      ?auto_11507 - PLACE
      ?auto_11508 - HOIST
      ?auto_11510 - SURFACE
      ?auto_11511 - TRUCK
      ?auto_11509 - PLACE
      ?auto_11512 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11504 ?auto_11506 ) ( IS-CRATE ?auto_11503 ) ( not ( = ?auto_11502 ?auto_11503 ) ) ( not ( = ?auto_11505 ?auto_11502 ) ) ( not ( = ?auto_11505 ?auto_11503 ) ) ( not ( = ?auto_11507 ?auto_11506 ) ) ( HOIST-AT ?auto_11508 ?auto_11507 ) ( not ( = ?auto_11504 ?auto_11508 ) ) ( AVAILABLE ?auto_11508 ) ( SURFACE-AT ?auto_11503 ?auto_11507 ) ( ON ?auto_11503 ?auto_11510 ) ( CLEAR ?auto_11503 ) ( not ( = ?auto_11502 ?auto_11510 ) ) ( not ( = ?auto_11503 ?auto_11510 ) ) ( not ( = ?auto_11505 ?auto_11510 ) ) ( SURFACE-AT ?auto_11505 ?auto_11506 ) ( CLEAR ?auto_11505 ) ( IS-CRATE ?auto_11502 ) ( AVAILABLE ?auto_11504 ) ( TRUCK-AT ?auto_11511 ?auto_11509 ) ( not ( = ?auto_11509 ?auto_11506 ) ) ( not ( = ?auto_11507 ?auto_11509 ) ) ( HOIST-AT ?auto_11512 ?auto_11509 ) ( LIFTING ?auto_11512 ?auto_11502 ) ( not ( = ?auto_11504 ?auto_11512 ) ) ( not ( = ?auto_11508 ?auto_11512 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11512 ?auto_11502 ?auto_11511 ?auto_11509 )
      ( MAKE-2CRATE ?auto_11505 ?auto_11502 ?auto_11503 )
      ( MAKE-1CRATE-VERIFY ?auto_11502 ?auto_11503 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11513 - SURFACE
      ?auto_11514 - SURFACE
      ?auto_11515 - SURFACE
    )
    :vars
    (
      ?auto_11517 - HOIST
      ?auto_11521 - PLACE
      ?auto_11516 - PLACE
      ?auto_11522 - HOIST
      ?auto_11519 - SURFACE
      ?auto_11520 - TRUCK
      ?auto_11523 - PLACE
      ?auto_11518 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11517 ?auto_11521 ) ( IS-CRATE ?auto_11515 ) ( not ( = ?auto_11514 ?auto_11515 ) ) ( not ( = ?auto_11513 ?auto_11514 ) ) ( not ( = ?auto_11513 ?auto_11515 ) ) ( not ( = ?auto_11516 ?auto_11521 ) ) ( HOIST-AT ?auto_11522 ?auto_11516 ) ( not ( = ?auto_11517 ?auto_11522 ) ) ( AVAILABLE ?auto_11522 ) ( SURFACE-AT ?auto_11515 ?auto_11516 ) ( ON ?auto_11515 ?auto_11519 ) ( CLEAR ?auto_11515 ) ( not ( = ?auto_11514 ?auto_11519 ) ) ( not ( = ?auto_11515 ?auto_11519 ) ) ( not ( = ?auto_11513 ?auto_11519 ) ) ( SURFACE-AT ?auto_11513 ?auto_11521 ) ( CLEAR ?auto_11513 ) ( IS-CRATE ?auto_11514 ) ( AVAILABLE ?auto_11517 ) ( TRUCK-AT ?auto_11520 ?auto_11523 ) ( not ( = ?auto_11523 ?auto_11521 ) ) ( not ( = ?auto_11516 ?auto_11523 ) ) ( HOIST-AT ?auto_11518 ?auto_11523 ) ( LIFTING ?auto_11518 ?auto_11514 ) ( not ( = ?auto_11517 ?auto_11518 ) ) ( not ( = ?auto_11522 ?auto_11518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11514 ?auto_11515 )
      ( MAKE-2CRATE-VERIFY ?auto_11513 ?auto_11514 ?auto_11515 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11524 - SURFACE
      ?auto_11525 - SURFACE
    )
    :vars
    (
      ?auto_11534 - HOIST
      ?auto_11528 - PLACE
      ?auto_11531 - SURFACE
      ?auto_11527 - PLACE
      ?auto_11526 - HOIST
      ?auto_11533 - SURFACE
      ?auto_11532 - TRUCK
      ?auto_11530 - PLACE
      ?auto_11529 - HOIST
      ?auto_11535 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11534 ?auto_11528 ) ( IS-CRATE ?auto_11525 ) ( not ( = ?auto_11524 ?auto_11525 ) ) ( not ( = ?auto_11531 ?auto_11524 ) ) ( not ( = ?auto_11531 ?auto_11525 ) ) ( not ( = ?auto_11527 ?auto_11528 ) ) ( HOIST-AT ?auto_11526 ?auto_11527 ) ( not ( = ?auto_11534 ?auto_11526 ) ) ( AVAILABLE ?auto_11526 ) ( SURFACE-AT ?auto_11525 ?auto_11527 ) ( ON ?auto_11525 ?auto_11533 ) ( CLEAR ?auto_11525 ) ( not ( = ?auto_11524 ?auto_11533 ) ) ( not ( = ?auto_11525 ?auto_11533 ) ) ( not ( = ?auto_11531 ?auto_11533 ) ) ( SURFACE-AT ?auto_11531 ?auto_11528 ) ( CLEAR ?auto_11531 ) ( IS-CRATE ?auto_11524 ) ( AVAILABLE ?auto_11534 ) ( TRUCK-AT ?auto_11532 ?auto_11530 ) ( not ( = ?auto_11530 ?auto_11528 ) ) ( not ( = ?auto_11527 ?auto_11530 ) ) ( HOIST-AT ?auto_11529 ?auto_11530 ) ( not ( = ?auto_11534 ?auto_11529 ) ) ( not ( = ?auto_11526 ?auto_11529 ) ) ( AVAILABLE ?auto_11529 ) ( SURFACE-AT ?auto_11524 ?auto_11530 ) ( ON ?auto_11524 ?auto_11535 ) ( CLEAR ?auto_11524 ) ( not ( = ?auto_11524 ?auto_11535 ) ) ( not ( = ?auto_11525 ?auto_11535 ) ) ( not ( = ?auto_11531 ?auto_11535 ) ) ( not ( = ?auto_11533 ?auto_11535 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11529 ?auto_11524 ?auto_11535 ?auto_11530 )
      ( MAKE-2CRATE ?auto_11531 ?auto_11524 ?auto_11525 )
      ( MAKE-1CRATE-VERIFY ?auto_11524 ?auto_11525 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11536 - SURFACE
      ?auto_11537 - SURFACE
      ?auto_11538 - SURFACE
    )
    :vars
    (
      ?auto_11546 - HOIST
      ?auto_11543 - PLACE
      ?auto_11540 - PLACE
      ?auto_11544 - HOIST
      ?auto_11541 - SURFACE
      ?auto_11547 - TRUCK
      ?auto_11545 - PLACE
      ?auto_11542 - HOIST
      ?auto_11539 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11546 ?auto_11543 ) ( IS-CRATE ?auto_11538 ) ( not ( = ?auto_11537 ?auto_11538 ) ) ( not ( = ?auto_11536 ?auto_11537 ) ) ( not ( = ?auto_11536 ?auto_11538 ) ) ( not ( = ?auto_11540 ?auto_11543 ) ) ( HOIST-AT ?auto_11544 ?auto_11540 ) ( not ( = ?auto_11546 ?auto_11544 ) ) ( AVAILABLE ?auto_11544 ) ( SURFACE-AT ?auto_11538 ?auto_11540 ) ( ON ?auto_11538 ?auto_11541 ) ( CLEAR ?auto_11538 ) ( not ( = ?auto_11537 ?auto_11541 ) ) ( not ( = ?auto_11538 ?auto_11541 ) ) ( not ( = ?auto_11536 ?auto_11541 ) ) ( SURFACE-AT ?auto_11536 ?auto_11543 ) ( CLEAR ?auto_11536 ) ( IS-CRATE ?auto_11537 ) ( AVAILABLE ?auto_11546 ) ( TRUCK-AT ?auto_11547 ?auto_11545 ) ( not ( = ?auto_11545 ?auto_11543 ) ) ( not ( = ?auto_11540 ?auto_11545 ) ) ( HOIST-AT ?auto_11542 ?auto_11545 ) ( not ( = ?auto_11546 ?auto_11542 ) ) ( not ( = ?auto_11544 ?auto_11542 ) ) ( AVAILABLE ?auto_11542 ) ( SURFACE-AT ?auto_11537 ?auto_11545 ) ( ON ?auto_11537 ?auto_11539 ) ( CLEAR ?auto_11537 ) ( not ( = ?auto_11537 ?auto_11539 ) ) ( not ( = ?auto_11538 ?auto_11539 ) ) ( not ( = ?auto_11536 ?auto_11539 ) ) ( not ( = ?auto_11541 ?auto_11539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11537 ?auto_11538 )
      ( MAKE-2CRATE-VERIFY ?auto_11536 ?auto_11537 ?auto_11538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11548 - SURFACE
      ?auto_11549 - SURFACE
    )
    :vars
    (
      ?auto_11557 - HOIST
      ?auto_11552 - PLACE
      ?auto_11554 - SURFACE
      ?auto_11559 - PLACE
      ?auto_11553 - HOIST
      ?auto_11558 - SURFACE
      ?auto_11550 - PLACE
      ?auto_11556 - HOIST
      ?auto_11555 - SURFACE
      ?auto_11551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11557 ?auto_11552 ) ( IS-CRATE ?auto_11549 ) ( not ( = ?auto_11548 ?auto_11549 ) ) ( not ( = ?auto_11554 ?auto_11548 ) ) ( not ( = ?auto_11554 ?auto_11549 ) ) ( not ( = ?auto_11559 ?auto_11552 ) ) ( HOIST-AT ?auto_11553 ?auto_11559 ) ( not ( = ?auto_11557 ?auto_11553 ) ) ( AVAILABLE ?auto_11553 ) ( SURFACE-AT ?auto_11549 ?auto_11559 ) ( ON ?auto_11549 ?auto_11558 ) ( CLEAR ?auto_11549 ) ( not ( = ?auto_11548 ?auto_11558 ) ) ( not ( = ?auto_11549 ?auto_11558 ) ) ( not ( = ?auto_11554 ?auto_11558 ) ) ( SURFACE-AT ?auto_11554 ?auto_11552 ) ( CLEAR ?auto_11554 ) ( IS-CRATE ?auto_11548 ) ( AVAILABLE ?auto_11557 ) ( not ( = ?auto_11550 ?auto_11552 ) ) ( not ( = ?auto_11559 ?auto_11550 ) ) ( HOIST-AT ?auto_11556 ?auto_11550 ) ( not ( = ?auto_11557 ?auto_11556 ) ) ( not ( = ?auto_11553 ?auto_11556 ) ) ( AVAILABLE ?auto_11556 ) ( SURFACE-AT ?auto_11548 ?auto_11550 ) ( ON ?auto_11548 ?auto_11555 ) ( CLEAR ?auto_11548 ) ( not ( = ?auto_11548 ?auto_11555 ) ) ( not ( = ?auto_11549 ?auto_11555 ) ) ( not ( = ?auto_11554 ?auto_11555 ) ) ( not ( = ?auto_11558 ?auto_11555 ) ) ( TRUCK-AT ?auto_11551 ?auto_11552 ) )
    :subtasks
    ( ( !DRIVE ?auto_11551 ?auto_11552 ?auto_11550 )
      ( MAKE-2CRATE ?auto_11554 ?auto_11548 ?auto_11549 )
      ( MAKE-1CRATE-VERIFY ?auto_11548 ?auto_11549 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11560 - SURFACE
      ?auto_11561 - SURFACE
      ?auto_11562 - SURFACE
    )
    :vars
    (
      ?auto_11569 - HOIST
      ?auto_11563 - PLACE
      ?auto_11566 - PLACE
      ?auto_11564 - HOIST
      ?auto_11568 - SURFACE
      ?auto_11567 - PLACE
      ?auto_11570 - HOIST
      ?auto_11565 - SURFACE
      ?auto_11571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11569 ?auto_11563 ) ( IS-CRATE ?auto_11562 ) ( not ( = ?auto_11561 ?auto_11562 ) ) ( not ( = ?auto_11560 ?auto_11561 ) ) ( not ( = ?auto_11560 ?auto_11562 ) ) ( not ( = ?auto_11566 ?auto_11563 ) ) ( HOIST-AT ?auto_11564 ?auto_11566 ) ( not ( = ?auto_11569 ?auto_11564 ) ) ( AVAILABLE ?auto_11564 ) ( SURFACE-AT ?auto_11562 ?auto_11566 ) ( ON ?auto_11562 ?auto_11568 ) ( CLEAR ?auto_11562 ) ( not ( = ?auto_11561 ?auto_11568 ) ) ( not ( = ?auto_11562 ?auto_11568 ) ) ( not ( = ?auto_11560 ?auto_11568 ) ) ( SURFACE-AT ?auto_11560 ?auto_11563 ) ( CLEAR ?auto_11560 ) ( IS-CRATE ?auto_11561 ) ( AVAILABLE ?auto_11569 ) ( not ( = ?auto_11567 ?auto_11563 ) ) ( not ( = ?auto_11566 ?auto_11567 ) ) ( HOIST-AT ?auto_11570 ?auto_11567 ) ( not ( = ?auto_11569 ?auto_11570 ) ) ( not ( = ?auto_11564 ?auto_11570 ) ) ( AVAILABLE ?auto_11570 ) ( SURFACE-AT ?auto_11561 ?auto_11567 ) ( ON ?auto_11561 ?auto_11565 ) ( CLEAR ?auto_11561 ) ( not ( = ?auto_11561 ?auto_11565 ) ) ( not ( = ?auto_11562 ?auto_11565 ) ) ( not ( = ?auto_11560 ?auto_11565 ) ) ( not ( = ?auto_11568 ?auto_11565 ) ) ( TRUCK-AT ?auto_11571 ?auto_11563 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11561 ?auto_11562 )
      ( MAKE-2CRATE-VERIFY ?auto_11560 ?auto_11561 ?auto_11562 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11581 - SURFACE
      ?auto_11582 - SURFACE
    )
    :vars
    (
      ?auto_11583 - HOIST
      ?auto_11584 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11583 ?auto_11584 ) ( SURFACE-AT ?auto_11581 ?auto_11584 ) ( CLEAR ?auto_11581 ) ( LIFTING ?auto_11583 ?auto_11582 ) ( IS-CRATE ?auto_11582 ) ( not ( = ?auto_11581 ?auto_11582 ) ) )
    :subtasks
    ( ( !DROP ?auto_11583 ?auto_11582 ?auto_11581 ?auto_11584 )
      ( MAKE-1CRATE-VERIFY ?auto_11581 ?auto_11582 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11585 - SURFACE
      ?auto_11586 - SURFACE
      ?auto_11587 - SURFACE
    )
    :vars
    (
      ?auto_11589 - HOIST
      ?auto_11588 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11589 ?auto_11588 ) ( SURFACE-AT ?auto_11586 ?auto_11588 ) ( CLEAR ?auto_11586 ) ( LIFTING ?auto_11589 ?auto_11587 ) ( IS-CRATE ?auto_11587 ) ( not ( = ?auto_11586 ?auto_11587 ) ) ( ON ?auto_11586 ?auto_11585 ) ( not ( = ?auto_11585 ?auto_11586 ) ) ( not ( = ?auto_11585 ?auto_11587 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11586 ?auto_11587 )
      ( MAKE-2CRATE-VERIFY ?auto_11585 ?auto_11586 ?auto_11587 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11590 - SURFACE
      ?auto_11591 - SURFACE
      ?auto_11592 - SURFACE
      ?auto_11593 - SURFACE
    )
    :vars
    (
      ?auto_11595 - HOIST
      ?auto_11594 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11595 ?auto_11594 ) ( SURFACE-AT ?auto_11592 ?auto_11594 ) ( CLEAR ?auto_11592 ) ( LIFTING ?auto_11595 ?auto_11593 ) ( IS-CRATE ?auto_11593 ) ( not ( = ?auto_11592 ?auto_11593 ) ) ( ON ?auto_11591 ?auto_11590 ) ( ON ?auto_11592 ?auto_11591 ) ( not ( = ?auto_11590 ?auto_11591 ) ) ( not ( = ?auto_11590 ?auto_11592 ) ) ( not ( = ?auto_11590 ?auto_11593 ) ) ( not ( = ?auto_11591 ?auto_11592 ) ) ( not ( = ?auto_11591 ?auto_11593 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11592 ?auto_11593 )
      ( MAKE-3CRATE-VERIFY ?auto_11590 ?auto_11591 ?auto_11592 ?auto_11593 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11596 - SURFACE
      ?auto_11597 - SURFACE
    )
    :vars
    (
      ?auto_11599 - HOIST
      ?auto_11598 - PLACE
      ?auto_11600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11599 ?auto_11598 ) ( SURFACE-AT ?auto_11596 ?auto_11598 ) ( CLEAR ?auto_11596 ) ( IS-CRATE ?auto_11597 ) ( not ( = ?auto_11596 ?auto_11597 ) ) ( TRUCK-AT ?auto_11600 ?auto_11598 ) ( AVAILABLE ?auto_11599 ) ( IN ?auto_11597 ?auto_11600 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11599 ?auto_11597 ?auto_11600 ?auto_11598 )
      ( MAKE-1CRATE ?auto_11596 ?auto_11597 )
      ( MAKE-1CRATE-VERIFY ?auto_11596 ?auto_11597 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11601 - SURFACE
      ?auto_11602 - SURFACE
      ?auto_11603 - SURFACE
    )
    :vars
    (
      ?auto_11604 - HOIST
      ?auto_11606 - PLACE
      ?auto_11605 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11604 ?auto_11606 ) ( SURFACE-AT ?auto_11602 ?auto_11606 ) ( CLEAR ?auto_11602 ) ( IS-CRATE ?auto_11603 ) ( not ( = ?auto_11602 ?auto_11603 ) ) ( TRUCK-AT ?auto_11605 ?auto_11606 ) ( AVAILABLE ?auto_11604 ) ( IN ?auto_11603 ?auto_11605 ) ( ON ?auto_11602 ?auto_11601 ) ( not ( = ?auto_11601 ?auto_11602 ) ) ( not ( = ?auto_11601 ?auto_11603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11602 ?auto_11603 )
      ( MAKE-2CRATE-VERIFY ?auto_11601 ?auto_11602 ?auto_11603 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11607 - SURFACE
      ?auto_11608 - SURFACE
      ?auto_11609 - SURFACE
      ?auto_11610 - SURFACE
    )
    :vars
    (
      ?auto_11613 - HOIST
      ?auto_11612 - PLACE
      ?auto_11611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11613 ?auto_11612 ) ( SURFACE-AT ?auto_11609 ?auto_11612 ) ( CLEAR ?auto_11609 ) ( IS-CRATE ?auto_11610 ) ( not ( = ?auto_11609 ?auto_11610 ) ) ( TRUCK-AT ?auto_11611 ?auto_11612 ) ( AVAILABLE ?auto_11613 ) ( IN ?auto_11610 ?auto_11611 ) ( ON ?auto_11609 ?auto_11608 ) ( not ( = ?auto_11608 ?auto_11609 ) ) ( not ( = ?auto_11608 ?auto_11610 ) ) ( ON ?auto_11608 ?auto_11607 ) ( not ( = ?auto_11607 ?auto_11608 ) ) ( not ( = ?auto_11607 ?auto_11609 ) ) ( not ( = ?auto_11607 ?auto_11610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11608 ?auto_11609 ?auto_11610 )
      ( MAKE-3CRATE-VERIFY ?auto_11607 ?auto_11608 ?auto_11609 ?auto_11610 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11614 - SURFACE
      ?auto_11615 - SURFACE
    )
    :vars
    (
      ?auto_11619 - HOIST
      ?auto_11618 - PLACE
      ?auto_11617 - TRUCK
      ?auto_11616 - SURFACE
      ?auto_11620 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11619 ?auto_11618 ) ( SURFACE-AT ?auto_11614 ?auto_11618 ) ( CLEAR ?auto_11614 ) ( IS-CRATE ?auto_11615 ) ( not ( = ?auto_11614 ?auto_11615 ) ) ( AVAILABLE ?auto_11619 ) ( IN ?auto_11615 ?auto_11617 ) ( ON ?auto_11614 ?auto_11616 ) ( not ( = ?auto_11616 ?auto_11614 ) ) ( not ( = ?auto_11616 ?auto_11615 ) ) ( TRUCK-AT ?auto_11617 ?auto_11620 ) ( not ( = ?auto_11620 ?auto_11618 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11617 ?auto_11620 ?auto_11618 )
      ( MAKE-2CRATE ?auto_11616 ?auto_11614 ?auto_11615 )
      ( MAKE-1CRATE-VERIFY ?auto_11614 ?auto_11615 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11621 - SURFACE
      ?auto_11622 - SURFACE
      ?auto_11623 - SURFACE
    )
    :vars
    (
      ?auto_11624 - HOIST
      ?auto_11625 - PLACE
      ?auto_11626 - TRUCK
      ?auto_11627 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11624 ?auto_11625 ) ( SURFACE-AT ?auto_11622 ?auto_11625 ) ( CLEAR ?auto_11622 ) ( IS-CRATE ?auto_11623 ) ( not ( = ?auto_11622 ?auto_11623 ) ) ( AVAILABLE ?auto_11624 ) ( IN ?auto_11623 ?auto_11626 ) ( ON ?auto_11622 ?auto_11621 ) ( not ( = ?auto_11621 ?auto_11622 ) ) ( not ( = ?auto_11621 ?auto_11623 ) ) ( TRUCK-AT ?auto_11626 ?auto_11627 ) ( not ( = ?auto_11627 ?auto_11625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11622 ?auto_11623 )
      ( MAKE-2CRATE-VERIFY ?auto_11621 ?auto_11622 ?auto_11623 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11628 - SURFACE
      ?auto_11629 - SURFACE
      ?auto_11630 - SURFACE
      ?auto_11631 - SURFACE
    )
    :vars
    (
      ?auto_11635 - HOIST
      ?auto_11633 - PLACE
      ?auto_11634 - TRUCK
      ?auto_11632 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11635 ?auto_11633 ) ( SURFACE-AT ?auto_11630 ?auto_11633 ) ( CLEAR ?auto_11630 ) ( IS-CRATE ?auto_11631 ) ( not ( = ?auto_11630 ?auto_11631 ) ) ( AVAILABLE ?auto_11635 ) ( IN ?auto_11631 ?auto_11634 ) ( ON ?auto_11630 ?auto_11629 ) ( not ( = ?auto_11629 ?auto_11630 ) ) ( not ( = ?auto_11629 ?auto_11631 ) ) ( TRUCK-AT ?auto_11634 ?auto_11632 ) ( not ( = ?auto_11632 ?auto_11633 ) ) ( ON ?auto_11629 ?auto_11628 ) ( not ( = ?auto_11628 ?auto_11629 ) ) ( not ( = ?auto_11628 ?auto_11630 ) ) ( not ( = ?auto_11628 ?auto_11631 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11629 ?auto_11630 ?auto_11631 )
      ( MAKE-3CRATE-VERIFY ?auto_11628 ?auto_11629 ?auto_11630 ?auto_11631 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11636 - SURFACE
      ?auto_11637 - SURFACE
    )
    :vars
    (
      ?auto_11642 - HOIST
      ?auto_11640 - PLACE
      ?auto_11639 - SURFACE
      ?auto_11641 - TRUCK
      ?auto_11638 - PLACE
      ?auto_11643 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11642 ?auto_11640 ) ( SURFACE-AT ?auto_11636 ?auto_11640 ) ( CLEAR ?auto_11636 ) ( IS-CRATE ?auto_11637 ) ( not ( = ?auto_11636 ?auto_11637 ) ) ( AVAILABLE ?auto_11642 ) ( ON ?auto_11636 ?auto_11639 ) ( not ( = ?auto_11639 ?auto_11636 ) ) ( not ( = ?auto_11639 ?auto_11637 ) ) ( TRUCK-AT ?auto_11641 ?auto_11638 ) ( not ( = ?auto_11638 ?auto_11640 ) ) ( HOIST-AT ?auto_11643 ?auto_11638 ) ( LIFTING ?auto_11643 ?auto_11637 ) ( not ( = ?auto_11642 ?auto_11643 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11643 ?auto_11637 ?auto_11641 ?auto_11638 )
      ( MAKE-2CRATE ?auto_11639 ?auto_11636 ?auto_11637 )
      ( MAKE-1CRATE-VERIFY ?auto_11636 ?auto_11637 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11644 - SURFACE
      ?auto_11645 - SURFACE
      ?auto_11646 - SURFACE
    )
    :vars
    (
      ?auto_11650 - HOIST
      ?auto_11648 - PLACE
      ?auto_11649 - TRUCK
      ?auto_11647 - PLACE
      ?auto_11651 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11650 ?auto_11648 ) ( SURFACE-AT ?auto_11645 ?auto_11648 ) ( CLEAR ?auto_11645 ) ( IS-CRATE ?auto_11646 ) ( not ( = ?auto_11645 ?auto_11646 ) ) ( AVAILABLE ?auto_11650 ) ( ON ?auto_11645 ?auto_11644 ) ( not ( = ?auto_11644 ?auto_11645 ) ) ( not ( = ?auto_11644 ?auto_11646 ) ) ( TRUCK-AT ?auto_11649 ?auto_11647 ) ( not ( = ?auto_11647 ?auto_11648 ) ) ( HOIST-AT ?auto_11651 ?auto_11647 ) ( LIFTING ?auto_11651 ?auto_11646 ) ( not ( = ?auto_11650 ?auto_11651 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11645 ?auto_11646 )
      ( MAKE-2CRATE-VERIFY ?auto_11644 ?auto_11645 ?auto_11646 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11652 - SURFACE
      ?auto_11653 - SURFACE
      ?auto_11654 - SURFACE
      ?auto_11655 - SURFACE
    )
    :vars
    (
      ?auto_11657 - HOIST
      ?auto_11659 - PLACE
      ?auto_11656 - TRUCK
      ?auto_11660 - PLACE
      ?auto_11658 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11657 ?auto_11659 ) ( SURFACE-AT ?auto_11654 ?auto_11659 ) ( CLEAR ?auto_11654 ) ( IS-CRATE ?auto_11655 ) ( not ( = ?auto_11654 ?auto_11655 ) ) ( AVAILABLE ?auto_11657 ) ( ON ?auto_11654 ?auto_11653 ) ( not ( = ?auto_11653 ?auto_11654 ) ) ( not ( = ?auto_11653 ?auto_11655 ) ) ( TRUCK-AT ?auto_11656 ?auto_11660 ) ( not ( = ?auto_11660 ?auto_11659 ) ) ( HOIST-AT ?auto_11658 ?auto_11660 ) ( LIFTING ?auto_11658 ?auto_11655 ) ( not ( = ?auto_11657 ?auto_11658 ) ) ( ON ?auto_11653 ?auto_11652 ) ( not ( = ?auto_11652 ?auto_11653 ) ) ( not ( = ?auto_11652 ?auto_11654 ) ) ( not ( = ?auto_11652 ?auto_11655 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11653 ?auto_11654 ?auto_11655 )
      ( MAKE-3CRATE-VERIFY ?auto_11652 ?auto_11653 ?auto_11654 ?auto_11655 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11661 - SURFACE
      ?auto_11662 - SURFACE
    )
    :vars
    (
      ?auto_11665 - HOIST
      ?auto_11667 - PLACE
      ?auto_11663 - SURFACE
      ?auto_11664 - TRUCK
      ?auto_11668 - PLACE
      ?auto_11666 - HOIST
      ?auto_11669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11665 ?auto_11667 ) ( SURFACE-AT ?auto_11661 ?auto_11667 ) ( CLEAR ?auto_11661 ) ( IS-CRATE ?auto_11662 ) ( not ( = ?auto_11661 ?auto_11662 ) ) ( AVAILABLE ?auto_11665 ) ( ON ?auto_11661 ?auto_11663 ) ( not ( = ?auto_11663 ?auto_11661 ) ) ( not ( = ?auto_11663 ?auto_11662 ) ) ( TRUCK-AT ?auto_11664 ?auto_11668 ) ( not ( = ?auto_11668 ?auto_11667 ) ) ( HOIST-AT ?auto_11666 ?auto_11668 ) ( not ( = ?auto_11665 ?auto_11666 ) ) ( AVAILABLE ?auto_11666 ) ( SURFACE-AT ?auto_11662 ?auto_11668 ) ( ON ?auto_11662 ?auto_11669 ) ( CLEAR ?auto_11662 ) ( not ( = ?auto_11661 ?auto_11669 ) ) ( not ( = ?auto_11662 ?auto_11669 ) ) ( not ( = ?auto_11663 ?auto_11669 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11666 ?auto_11662 ?auto_11669 ?auto_11668 )
      ( MAKE-2CRATE ?auto_11663 ?auto_11661 ?auto_11662 )
      ( MAKE-1CRATE-VERIFY ?auto_11661 ?auto_11662 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11670 - SURFACE
      ?auto_11671 - SURFACE
      ?auto_11672 - SURFACE
    )
    :vars
    (
      ?auto_11676 - HOIST
      ?auto_11674 - PLACE
      ?auto_11678 - TRUCK
      ?auto_11675 - PLACE
      ?auto_11673 - HOIST
      ?auto_11677 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11676 ?auto_11674 ) ( SURFACE-AT ?auto_11671 ?auto_11674 ) ( CLEAR ?auto_11671 ) ( IS-CRATE ?auto_11672 ) ( not ( = ?auto_11671 ?auto_11672 ) ) ( AVAILABLE ?auto_11676 ) ( ON ?auto_11671 ?auto_11670 ) ( not ( = ?auto_11670 ?auto_11671 ) ) ( not ( = ?auto_11670 ?auto_11672 ) ) ( TRUCK-AT ?auto_11678 ?auto_11675 ) ( not ( = ?auto_11675 ?auto_11674 ) ) ( HOIST-AT ?auto_11673 ?auto_11675 ) ( not ( = ?auto_11676 ?auto_11673 ) ) ( AVAILABLE ?auto_11673 ) ( SURFACE-AT ?auto_11672 ?auto_11675 ) ( ON ?auto_11672 ?auto_11677 ) ( CLEAR ?auto_11672 ) ( not ( = ?auto_11671 ?auto_11677 ) ) ( not ( = ?auto_11672 ?auto_11677 ) ) ( not ( = ?auto_11670 ?auto_11677 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11671 ?auto_11672 )
      ( MAKE-2CRATE-VERIFY ?auto_11670 ?auto_11671 ?auto_11672 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11679 - SURFACE
      ?auto_11680 - SURFACE
      ?auto_11681 - SURFACE
      ?auto_11682 - SURFACE
    )
    :vars
    (
      ?auto_11683 - HOIST
      ?auto_11686 - PLACE
      ?auto_11687 - TRUCK
      ?auto_11688 - PLACE
      ?auto_11685 - HOIST
      ?auto_11684 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11683 ?auto_11686 ) ( SURFACE-AT ?auto_11681 ?auto_11686 ) ( CLEAR ?auto_11681 ) ( IS-CRATE ?auto_11682 ) ( not ( = ?auto_11681 ?auto_11682 ) ) ( AVAILABLE ?auto_11683 ) ( ON ?auto_11681 ?auto_11680 ) ( not ( = ?auto_11680 ?auto_11681 ) ) ( not ( = ?auto_11680 ?auto_11682 ) ) ( TRUCK-AT ?auto_11687 ?auto_11688 ) ( not ( = ?auto_11688 ?auto_11686 ) ) ( HOIST-AT ?auto_11685 ?auto_11688 ) ( not ( = ?auto_11683 ?auto_11685 ) ) ( AVAILABLE ?auto_11685 ) ( SURFACE-AT ?auto_11682 ?auto_11688 ) ( ON ?auto_11682 ?auto_11684 ) ( CLEAR ?auto_11682 ) ( not ( = ?auto_11681 ?auto_11684 ) ) ( not ( = ?auto_11682 ?auto_11684 ) ) ( not ( = ?auto_11680 ?auto_11684 ) ) ( ON ?auto_11680 ?auto_11679 ) ( not ( = ?auto_11679 ?auto_11680 ) ) ( not ( = ?auto_11679 ?auto_11681 ) ) ( not ( = ?auto_11679 ?auto_11682 ) ) ( not ( = ?auto_11679 ?auto_11684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11680 ?auto_11681 ?auto_11682 )
      ( MAKE-3CRATE-VERIFY ?auto_11679 ?auto_11680 ?auto_11681 ?auto_11682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11689 - SURFACE
      ?auto_11690 - SURFACE
    )
    :vars
    (
      ?auto_11691 - HOIST
      ?auto_11695 - PLACE
      ?auto_11692 - SURFACE
      ?auto_11697 - PLACE
      ?auto_11694 - HOIST
      ?auto_11693 - SURFACE
      ?auto_11696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11691 ?auto_11695 ) ( SURFACE-AT ?auto_11689 ?auto_11695 ) ( CLEAR ?auto_11689 ) ( IS-CRATE ?auto_11690 ) ( not ( = ?auto_11689 ?auto_11690 ) ) ( AVAILABLE ?auto_11691 ) ( ON ?auto_11689 ?auto_11692 ) ( not ( = ?auto_11692 ?auto_11689 ) ) ( not ( = ?auto_11692 ?auto_11690 ) ) ( not ( = ?auto_11697 ?auto_11695 ) ) ( HOIST-AT ?auto_11694 ?auto_11697 ) ( not ( = ?auto_11691 ?auto_11694 ) ) ( AVAILABLE ?auto_11694 ) ( SURFACE-AT ?auto_11690 ?auto_11697 ) ( ON ?auto_11690 ?auto_11693 ) ( CLEAR ?auto_11690 ) ( not ( = ?auto_11689 ?auto_11693 ) ) ( not ( = ?auto_11690 ?auto_11693 ) ) ( not ( = ?auto_11692 ?auto_11693 ) ) ( TRUCK-AT ?auto_11696 ?auto_11695 ) )
    :subtasks
    ( ( !DRIVE ?auto_11696 ?auto_11695 ?auto_11697 )
      ( MAKE-2CRATE ?auto_11692 ?auto_11689 ?auto_11690 )
      ( MAKE-1CRATE-VERIFY ?auto_11689 ?auto_11690 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11698 - SURFACE
      ?auto_11699 - SURFACE
      ?auto_11700 - SURFACE
    )
    :vars
    (
      ?auto_11706 - HOIST
      ?auto_11703 - PLACE
      ?auto_11705 - PLACE
      ?auto_11702 - HOIST
      ?auto_11701 - SURFACE
      ?auto_11704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11706 ?auto_11703 ) ( SURFACE-AT ?auto_11699 ?auto_11703 ) ( CLEAR ?auto_11699 ) ( IS-CRATE ?auto_11700 ) ( not ( = ?auto_11699 ?auto_11700 ) ) ( AVAILABLE ?auto_11706 ) ( ON ?auto_11699 ?auto_11698 ) ( not ( = ?auto_11698 ?auto_11699 ) ) ( not ( = ?auto_11698 ?auto_11700 ) ) ( not ( = ?auto_11705 ?auto_11703 ) ) ( HOIST-AT ?auto_11702 ?auto_11705 ) ( not ( = ?auto_11706 ?auto_11702 ) ) ( AVAILABLE ?auto_11702 ) ( SURFACE-AT ?auto_11700 ?auto_11705 ) ( ON ?auto_11700 ?auto_11701 ) ( CLEAR ?auto_11700 ) ( not ( = ?auto_11699 ?auto_11701 ) ) ( not ( = ?auto_11700 ?auto_11701 ) ) ( not ( = ?auto_11698 ?auto_11701 ) ) ( TRUCK-AT ?auto_11704 ?auto_11703 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11699 ?auto_11700 )
      ( MAKE-2CRATE-VERIFY ?auto_11698 ?auto_11699 ?auto_11700 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11707 - SURFACE
      ?auto_11708 - SURFACE
      ?auto_11709 - SURFACE
      ?auto_11710 - SURFACE
    )
    :vars
    (
      ?auto_11716 - HOIST
      ?auto_11711 - PLACE
      ?auto_11712 - PLACE
      ?auto_11715 - HOIST
      ?auto_11713 - SURFACE
      ?auto_11714 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11716 ?auto_11711 ) ( SURFACE-AT ?auto_11709 ?auto_11711 ) ( CLEAR ?auto_11709 ) ( IS-CRATE ?auto_11710 ) ( not ( = ?auto_11709 ?auto_11710 ) ) ( AVAILABLE ?auto_11716 ) ( ON ?auto_11709 ?auto_11708 ) ( not ( = ?auto_11708 ?auto_11709 ) ) ( not ( = ?auto_11708 ?auto_11710 ) ) ( not ( = ?auto_11712 ?auto_11711 ) ) ( HOIST-AT ?auto_11715 ?auto_11712 ) ( not ( = ?auto_11716 ?auto_11715 ) ) ( AVAILABLE ?auto_11715 ) ( SURFACE-AT ?auto_11710 ?auto_11712 ) ( ON ?auto_11710 ?auto_11713 ) ( CLEAR ?auto_11710 ) ( not ( = ?auto_11709 ?auto_11713 ) ) ( not ( = ?auto_11710 ?auto_11713 ) ) ( not ( = ?auto_11708 ?auto_11713 ) ) ( TRUCK-AT ?auto_11714 ?auto_11711 ) ( ON ?auto_11708 ?auto_11707 ) ( not ( = ?auto_11707 ?auto_11708 ) ) ( not ( = ?auto_11707 ?auto_11709 ) ) ( not ( = ?auto_11707 ?auto_11710 ) ) ( not ( = ?auto_11707 ?auto_11713 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11708 ?auto_11709 ?auto_11710 )
      ( MAKE-3CRATE-VERIFY ?auto_11707 ?auto_11708 ?auto_11709 ?auto_11710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11717 - SURFACE
      ?auto_11718 - SURFACE
    )
    :vars
    (
      ?auto_11724 - HOIST
      ?auto_11719 - PLACE
      ?auto_11725 - SURFACE
      ?auto_11720 - PLACE
      ?auto_11723 - HOIST
      ?auto_11721 - SURFACE
      ?auto_11722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11724 ?auto_11719 ) ( IS-CRATE ?auto_11718 ) ( not ( = ?auto_11717 ?auto_11718 ) ) ( not ( = ?auto_11725 ?auto_11717 ) ) ( not ( = ?auto_11725 ?auto_11718 ) ) ( not ( = ?auto_11720 ?auto_11719 ) ) ( HOIST-AT ?auto_11723 ?auto_11720 ) ( not ( = ?auto_11724 ?auto_11723 ) ) ( AVAILABLE ?auto_11723 ) ( SURFACE-AT ?auto_11718 ?auto_11720 ) ( ON ?auto_11718 ?auto_11721 ) ( CLEAR ?auto_11718 ) ( not ( = ?auto_11717 ?auto_11721 ) ) ( not ( = ?auto_11718 ?auto_11721 ) ) ( not ( = ?auto_11725 ?auto_11721 ) ) ( TRUCK-AT ?auto_11722 ?auto_11719 ) ( SURFACE-AT ?auto_11725 ?auto_11719 ) ( CLEAR ?auto_11725 ) ( LIFTING ?auto_11724 ?auto_11717 ) ( IS-CRATE ?auto_11717 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11725 ?auto_11717 )
      ( MAKE-2CRATE ?auto_11725 ?auto_11717 ?auto_11718 )
      ( MAKE-1CRATE-VERIFY ?auto_11717 ?auto_11718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11726 - SURFACE
      ?auto_11727 - SURFACE
      ?auto_11728 - SURFACE
    )
    :vars
    (
      ?auto_11729 - HOIST
      ?auto_11732 - PLACE
      ?auto_11734 - PLACE
      ?auto_11730 - HOIST
      ?auto_11731 - SURFACE
      ?auto_11733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11729 ?auto_11732 ) ( IS-CRATE ?auto_11728 ) ( not ( = ?auto_11727 ?auto_11728 ) ) ( not ( = ?auto_11726 ?auto_11727 ) ) ( not ( = ?auto_11726 ?auto_11728 ) ) ( not ( = ?auto_11734 ?auto_11732 ) ) ( HOIST-AT ?auto_11730 ?auto_11734 ) ( not ( = ?auto_11729 ?auto_11730 ) ) ( AVAILABLE ?auto_11730 ) ( SURFACE-AT ?auto_11728 ?auto_11734 ) ( ON ?auto_11728 ?auto_11731 ) ( CLEAR ?auto_11728 ) ( not ( = ?auto_11727 ?auto_11731 ) ) ( not ( = ?auto_11728 ?auto_11731 ) ) ( not ( = ?auto_11726 ?auto_11731 ) ) ( TRUCK-AT ?auto_11733 ?auto_11732 ) ( SURFACE-AT ?auto_11726 ?auto_11732 ) ( CLEAR ?auto_11726 ) ( LIFTING ?auto_11729 ?auto_11727 ) ( IS-CRATE ?auto_11727 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11727 ?auto_11728 )
      ( MAKE-2CRATE-VERIFY ?auto_11726 ?auto_11727 ?auto_11728 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11735 - SURFACE
      ?auto_11736 - SURFACE
      ?auto_11737 - SURFACE
      ?auto_11738 - SURFACE
    )
    :vars
    (
      ?auto_11741 - HOIST
      ?auto_11742 - PLACE
      ?auto_11740 - PLACE
      ?auto_11739 - HOIST
      ?auto_11744 - SURFACE
      ?auto_11743 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11741 ?auto_11742 ) ( IS-CRATE ?auto_11738 ) ( not ( = ?auto_11737 ?auto_11738 ) ) ( not ( = ?auto_11736 ?auto_11737 ) ) ( not ( = ?auto_11736 ?auto_11738 ) ) ( not ( = ?auto_11740 ?auto_11742 ) ) ( HOIST-AT ?auto_11739 ?auto_11740 ) ( not ( = ?auto_11741 ?auto_11739 ) ) ( AVAILABLE ?auto_11739 ) ( SURFACE-AT ?auto_11738 ?auto_11740 ) ( ON ?auto_11738 ?auto_11744 ) ( CLEAR ?auto_11738 ) ( not ( = ?auto_11737 ?auto_11744 ) ) ( not ( = ?auto_11738 ?auto_11744 ) ) ( not ( = ?auto_11736 ?auto_11744 ) ) ( TRUCK-AT ?auto_11743 ?auto_11742 ) ( SURFACE-AT ?auto_11736 ?auto_11742 ) ( CLEAR ?auto_11736 ) ( LIFTING ?auto_11741 ?auto_11737 ) ( IS-CRATE ?auto_11737 ) ( ON ?auto_11736 ?auto_11735 ) ( not ( = ?auto_11735 ?auto_11736 ) ) ( not ( = ?auto_11735 ?auto_11737 ) ) ( not ( = ?auto_11735 ?auto_11738 ) ) ( not ( = ?auto_11735 ?auto_11744 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11736 ?auto_11737 ?auto_11738 )
      ( MAKE-3CRATE-VERIFY ?auto_11735 ?auto_11736 ?auto_11737 ?auto_11738 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11745 - SURFACE
      ?auto_11746 - SURFACE
    )
    :vars
    (
      ?auto_11750 - HOIST
      ?auto_11751 - PLACE
      ?auto_11748 - SURFACE
      ?auto_11749 - PLACE
      ?auto_11747 - HOIST
      ?auto_11753 - SURFACE
      ?auto_11752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11750 ?auto_11751 ) ( IS-CRATE ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11746 ) ) ( not ( = ?auto_11748 ?auto_11745 ) ) ( not ( = ?auto_11748 ?auto_11746 ) ) ( not ( = ?auto_11749 ?auto_11751 ) ) ( HOIST-AT ?auto_11747 ?auto_11749 ) ( not ( = ?auto_11750 ?auto_11747 ) ) ( AVAILABLE ?auto_11747 ) ( SURFACE-AT ?auto_11746 ?auto_11749 ) ( ON ?auto_11746 ?auto_11753 ) ( CLEAR ?auto_11746 ) ( not ( = ?auto_11745 ?auto_11753 ) ) ( not ( = ?auto_11746 ?auto_11753 ) ) ( not ( = ?auto_11748 ?auto_11753 ) ) ( TRUCK-AT ?auto_11752 ?auto_11751 ) ( SURFACE-AT ?auto_11748 ?auto_11751 ) ( CLEAR ?auto_11748 ) ( IS-CRATE ?auto_11745 ) ( AVAILABLE ?auto_11750 ) ( IN ?auto_11745 ?auto_11752 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11750 ?auto_11745 ?auto_11752 ?auto_11751 )
      ( MAKE-2CRATE ?auto_11748 ?auto_11745 ?auto_11746 )
      ( MAKE-1CRATE-VERIFY ?auto_11745 ?auto_11746 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11754 - SURFACE
      ?auto_11755 - SURFACE
      ?auto_11756 - SURFACE
    )
    :vars
    (
      ?auto_11760 - HOIST
      ?auto_11757 - PLACE
      ?auto_11762 - PLACE
      ?auto_11758 - HOIST
      ?auto_11759 - SURFACE
      ?auto_11761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11760 ?auto_11757 ) ( IS-CRATE ?auto_11756 ) ( not ( = ?auto_11755 ?auto_11756 ) ) ( not ( = ?auto_11754 ?auto_11755 ) ) ( not ( = ?auto_11754 ?auto_11756 ) ) ( not ( = ?auto_11762 ?auto_11757 ) ) ( HOIST-AT ?auto_11758 ?auto_11762 ) ( not ( = ?auto_11760 ?auto_11758 ) ) ( AVAILABLE ?auto_11758 ) ( SURFACE-AT ?auto_11756 ?auto_11762 ) ( ON ?auto_11756 ?auto_11759 ) ( CLEAR ?auto_11756 ) ( not ( = ?auto_11755 ?auto_11759 ) ) ( not ( = ?auto_11756 ?auto_11759 ) ) ( not ( = ?auto_11754 ?auto_11759 ) ) ( TRUCK-AT ?auto_11761 ?auto_11757 ) ( SURFACE-AT ?auto_11754 ?auto_11757 ) ( CLEAR ?auto_11754 ) ( IS-CRATE ?auto_11755 ) ( AVAILABLE ?auto_11760 ) ( IN ?auto_11755 ?auto_11761 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11755 ?auto_11756 )
      ( MAKE-2CRATE-VERIFY ?auto_11754 ?auto_11755 ?auto_11756 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11763 - SURFACE
      ?auto_11764 - SURFACE
      ?auto_11765 - SURFACE
      ?auto_11766 - SURFACE
    )
    :vars
    (
      ?auto_11770 - HOIST
      ?auto_11767 - PLACE
      ?auto_11769 - PLACE
      ?auto_11768 - HOIST
      ?auto_11772 - SURFACE
      ?auto_11771 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11770 ?auto_11767 ) ( IS-CRATE ?auto_11766 ) ( not ( = ?auto_11765 ?auto_11766 ) ) ( not ( = ?auto_11764 ?auto_11765 ) ) ( not ( = ?auto_11764 ?auto_11766 ) ) ( not ( = ?auto_11769 ?auto_11767 ) ) ( HOIST-AT ?auto_11768 ?auto_11769 ) ( not ( = ?auto_11770 ?auto_11768 ) ) ( AVAILABLE ?auto_11768 ) ( SURFACE-AT ?auto_11766 ?auto_11769 ) ( ON ?auto_11766 ?auto_11772 ) ( CLEAR ?auto_11766 ) ( not ( = ?auto_11765 ?auto_11772 ) ) ( not ( = ?auto_11766 ?auto_11772 ) ) ( not ( = ?auto_11764 ?auto_11772 ) ) ( TRUCK-AT ?auto_11771 ?auto_11767 ) ( SURFACE-AT ?auto_11764 ?auto_11767 ) ( CLEAR ?auto_11764 ) ( IS-CRATE ?auto_11765 ) ( AVAILABLE ?auto_11770 ) ( IN ?auto_11765 ?auto_11771 ) ( ON ?auto_11764 ?auto_11763 ) ( not ( = ?auto_11763 ?auto_11764 ) ) ( not ( = ?auto_11763 ?auto_11765 ) ) ( not ( = ?auto_11763 ?auto_11766 ) ) ( not ( = ?auto_11763 ?auto_11772 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11764 ?auto_11765 ?auto_11766 )
      ( MAKE-3CRATE-VERIFY ?auto_11763 ?auto_11764 ?auto_11765 ?auto_11766 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11773 - SURFACE
      ?auto_11774 - SURFACE
    )
    :vars
    (
      ?auto_11779 - HOIST
      ?auto_11775 - PLACE
      ?auto_11778 - SURFACE
      ?auto_11777 - PLACE
      ?auto_11776 - HOIST
      ?auto_11781 - SURFACE
      ?auto_11780 - TRUCK
      ?auto_11782 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11779 ?auto_11775 ) ( IS-CRATE ?auto_11774 ) ( not ( = ?auto_11773 ?auto_11774 ) ) ( not ( = ?auto_11778 ?auto_11773 ) ) ( not ( = ?auto_11778 ?auto_11774 ) ) ( not ( = ?auto_11777 ?auto_11775 ) ) ( HOIST-AT ?auto_11776 ?auto_11777 ) ( not ( = ?auto_11779 ?auto_11776 ) ) ( AVAILABLE ?auto_11776 ) ( SURFACE-AT ?auto_11774 ?auto_11777 ) ( ON ?auto_11774 ?auto_11781 ) ( CLEAR ?auto_11774 ) ( not ( = ?auto_11773 ?auto_11781 ) ) ( not ( = ?auto_11774 ?auto_11781 ) ) ( not ( = ?auto_11778 ?auto_11781 ) ) ( SURFACE-AT ?auto_11778 ?auto_11775 ) ( CLEAR ?auto_11778 ) ( IS-CRATE ?auto_11773 ) ( AVAILABLE ?auto_11779 ) ( IN ?auto_11773 ?auto_11780 ) ( TRUCK-AT ?auto_11780 ?auto_11782 ) ( not ( = ?auto_11782 ?auto_11775 ) ) ( not ( = ?auto_11777 ?auto_11782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_11780 ?auto_11782 ?auto_11775 )
      ( MAKE-2CRATE ?auto_11778 ?auto_11773 ?auto_11774 )
      ( MAKE-1CRATE-VERIFY ?auto_11773 ?auto_11774 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11783 - SURFACE
      ?auto_11784 - SURFACE
      ?auto_11785 - SURFACE
    )
    :vars
    (
      ?auto_11787 - HOIST
      ?auto_11790 - PLACE
      ?auto_11789 - PLACE
      ?auto_11786 - HOIST
      ?auto_11792 - SURFACE
      ?auto_11791 - TRUCK
      ?auto_11788 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11787 ?auto_11790 ) ( IS-CRATE ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11785 ) ) ( not ( = ?auto_11783 ?auto_11784 ) ) ( not ( = ?auto_11783 ?auto_11785 ) ) ( not ( = ?auto_11789 ?auto_11790 ) ) ( HOIST-AT ?auto_11786 ?auto_11789 ) ( not ( = ?auto_11787 ?auto_11786 ) ) ( AVAILABLE ?auto_11786 ) ( SURFACE-AT ?auto_11785 ?auto_11789 ) ( ON ?auto_11785 ?auto_11792 ) ( CLEAR ?auto_11785 ) ( not ( = ?auto_11784 ?auto_11792 ) ) ( not ( = ?auto_11785 ?auto_11792 ) ) ( not ( = ?auto_11783 ?auto_11792 ) ) ( SURFACE-AT ?auto_11783 ?auto_11790 ) ( CLEAR ?auto_11783 ) ( IS-CRATE ?auto_11784 ) ( AVAILABLE ?auto_11787 ) ( IN ?auto_11784 ?auto_11791 ) ( TRUCK-AT ?auto_11791 ?auto_11788 ) ( not ( = ?auto_11788 ?auto_11790 ) ) ( not ( = ?auto_11789 ?auto_11788 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11784 ?auto_11785 )
      ( MAKE-2CRATE-VERIFY ?auto_11783 ?auto_11784 ?auto_11785 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11793 - SURFACE
      ?auto_11794 - SURFACE
      ?auto_11795 - SURFACE
      ?auto_11796 - SURFACE
    )
    :vars
    (
      ?auto_11802 - HOIST
      ?auto_11799 - PLACE
      ?auto_11800 - PLACE
      ?auto_11797 - HOIST
      ?auto_11803 - SURFACE
      ?auto_11801 - TRUCK
      ?auto_11798 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11802 ?auto_11799 ) ( IS-CRATE ?auto_11796 ) ( not ( = ?auto_11795 ?auto_11796 ) ) ( not ( = ?auto_11794 ?auto_11795 ) ) ( not ( = ?auto_11794 ?auto_11796 ) ) ( not ( = ?auto_11800 ?auto_11799 ) ) ( HOIST-AT ?auto_11797 ?auto_11800 ) ( not ( = ?auto_11802 ?auto_11797 ) ) ( AVAILABLE ?auto_11797 ) ( SURFACE-AT ?auto_11796 ?auto_11800 ) ( ON ?auto_11796 ?auto_11803 ) ( CLEAR ?auto_11796 ) ( not ( = ?auto_11795 ?auto_11803 ) ) ( not ( = ?auto_11796 ?auto_11803 ) ) ( not ( = ?auto_11794 ?auto_11803 ) ) ( SURFACE-AT ?auto_11794 ?auto_11799 ) ( CLEAR ?auto_11794 ) ( IS-CRATE ?auto_11795 ) ( AVAILABLE ?auto_11802 ) ( IN ?auto_11795 ?auto_11801 ) ( TRUCK-AT ?auto_11801 ?auto_11798 ) ( not ( = ?auto_11798 ?auto_11799 ) ) ( not ( = ?auto_11800 ?auto_11798 ) ) ( ON ?auto_11794 ?auto_11793 ) ( not ( = ?auto_11793 ?auto_11794 ) ) ( not ( = ?auto_11793 ?auto_11795 ) ) ( not ( = ?auto_11793 ?auto_11796 ) ) ( not ( = ?auto_11793 ?auto_11803 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11794 ?auto_11795 ?auto_11796 )
      ( MAKE-3CRATE-VERIFY ?auto_11793 ?auto_11794 ?auto_11795 ?auto_11796 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11804 - SURFACE
      ?auto_11805 - SURFACE
    )
    :vars
    (
      ?auto_11812 - HOIST
      ?auto_11809 - PLACE
      ?auto_11806 - SURFACE
      ?auto_11810 - PLACE
      ?auto_11807 - HOIST
      ?auto_11813 - SURFACE
      ?auto_11811 - TRUCK
      ?auto_11808 - PLACE
      ?auto_11814 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11812 ?auto_11809 ) ( IS-CRATE ?auto_11805 ) ( not ( = ?auto_11804 ?auto_11805 ) ) ( not ( = ?auto_11806 ?auto_11804 ) ) ( not ( = ?auto_11806 ?auto_11805 ) ) ( not ( = ?auto_11810 ?auto_11809 ) ) ( HOIST-AT ?auto_11807 ?auto_11810 ) ( not ( = ?auto_11812 ?auto_11807 ) ) ( AVAILABLE ?auto_11807 ) ( SURFACE-AT ?auto_11805 ?auto_11810 ) ( ON ?auto_11805 ?auto_11813 ) ( CLEAR ?auto_11805 ) ( not ( = ?auto_11804 ?auto_11813 ) ) ( not ( = ?auto_11805 ?auto_11813 ) ) ( not ( = ?auto_11806 ?auto_11813 ) ) ( SURFACE-AT ?auto_11806 ?auto_11809 ) ( CLEAR ?auto_11806 ) ( IS-CRATE ?auto_11804 ) ( AVAILABLE ?auto_11812 ) ( TRUCK-AT ?auto_11811 ?auto_11808 ) ( not ( = ?auto_11808 ?auto_11809 ) ) ( not ( = ?auto_11810 ?auto_11808 ) ) ( HOIST-AT ?auto_11814 ?auto_11808 ) ( LIFTING ?auto_11814 ?auto_11804 ) ( not ( = ?auto_11812 ?auto_11814 ) ) ( not ( = ?auto_11807 ?auto_11814 ) ) )
    :subtasks
    ( ( !LOAD ?auto_11814 ?auto_11804 ?auto_11811 ?auto_11808 )
      ( MAKE-2CRATE ?auto_11806 ?auto_11804 ?auto_11805 )
      ( MAKE-1CRATE-VERIFY ?auto_11804 ?auto_11805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11815 - SURFACE
      ?auto_11816 - SURFACE
      ?auto_11817 - SURFACE
    )
    :vars
    (
      ?auto_11819 - HOIST
      ?auto_11825 - PLACE
      ?auto_11820 - PLACE
      ?auto_11818 - HOIST
      ?auto_11821 - SURFACE
      ?auto_11823 - TRUCK
      ?auto_11824 - PLACE
      ?auto_11822 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11819 ?auto_11825 ) ( IS-CRATE ?auto_11817 ) ( not ( = ?auto_11816 ?auto_11817 ) ) ( not ( = ?auto_11815 ?auto_11816 ) ) ( not ( = ?auto_11815 ?auto_11817 ) ) ( not ( = ?auto_11820 ?auto_11825 ) ) ( HOIST-AT ?auto_11818 ?auto_11820 ) ( not ( = ?auto_11819 ?auto_11818 ) ) ( AVAILABLE ?auto_11818 ) ( SURFACE-AT ?auto_11817 ?auto_11820 ) ( ON ?auto_11817 ?auto_11821 ) ( CLEAR ?auto_11817 ) ( not ( = ?auto_11816 ?auto_11821 ) ) ( not ( = ?auto_11817 ?auto_11821 ) ) ( not ( = ?auto_11815 ?auto_11821 ) ) ( SURFACE-AT ?auto_11815 ?auto_11825 ) ( CLEAR ?auto_11815 ) ( IS-CRATE ?auto_11816 ) ( AVAILABLE ?auto_11819 ) ( TRUCK-AT ?auto_11823 ?auto_11824 ) ( not ( = ?auto_11824 ?auto_11825 ) ) ( not ( = ?auto_11820 ?auto_11824 ) ) ( HOIST-AT ?auto_11822 ?auto_11824 ) ( LIFTING ?auto_11822 ?auto_11816 ) ( not ( = ?auto_11819 ?auto_11822 ) ) ( not ( = ?auto_11818 ?auto_11822 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11816 ?auto_11817 )
      ( MAKE-2CRATE-VERIFY ?auto_11815 ?auto_11816 ?auto_11817 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11826 - SURFACE
      ?auto_11827 - SURFACE
      ?auto_11828 - SURFACE
      ?auto_11829 - SURFACE
    )
    :vars
    (
      ?auto_11834 - HOIST
      ?auto_11831 - PLACE
      ?auto_11837 - PLACE
      ?auto_11835 - HOIST
      ?auto_11836 - SURFACE
      ?auto_11830 - TRUCK
      ?auto_11833 - PLACE
      ?auto_11832 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_11834 ?auto_11831 ) ( IS-CRATE ?auto_11829 ) ( not ( = ?auto_11828 ?auto_11829 ) ) ( not ( = ?auto_11827 ?auto_11828 ) ) ( not ( = ?auto_11827 ?auto_11829 ) ) ( not ( = ?auto_11837 ?auto_11831 ) ) ( HOIST-AT ?auto_11835 ?auto_11837 ) ( not ( = ?auto_11834 ?auto_11835 ) ) ( AVAILABLE ?auto_11835 ) ( SURFACE-AT ?auto_11829 ?auto_11837 ) ( ON ?auto_11829 ?auto_11836 ) ( CLEAR ?auto_11829 ) ( not ( = ?auto_11828 ?auto_11836 ) ) ( not ( = ?auto_11829 ?auto_11836 ) ) ( not ( = ?auto_11827 ?auto_11836 ) ) ( SURFACE-AT ?auto_11827 ?auto_11831 ) ( CLEAR ?auto_11827 ) ( IS-CRATE ?auto_11828 ) ( AVAILABLE ?auto_11834 ) ( TRUCK-AT ?auto_11830 ?auto_11833 ) ( not ( = ?auto_11833 ?auto_11831 ) ) ( not ( = ?auto_11837 ?auto_11833 ) ) ( HOIST-AT ?auto_11832 ?auto_11833 ) ( LIFTING ?auto_11832 ?auto_11828 ) ( not ( = ?auto_11834 ?auto_11832 ) ) ( not ( = ?auto_11835 ?auto_11832 ) ) ( ON ?auto_11827 ?auto_11826 ) ( not ( = ?auto_11826 ?auto_11827 ) ) ( not ( = ?auto_11826 ?auto_11828 ) ) ( not ( = ?auto_11826 ?auto_11829 ) ) ( not ( = ?auto_11826 ?auto_11836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11827 ?auto_11828 ?auto_11829 )
      ( MAKE-3CRATE-VERIFY ?auto_11826 ?auto_11827 ?auto_11828 ?auto_11829 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11838 - SURFACE
      ?auto_11839 - SURFACE
    )
    :vars
    (
      ?auto_11845 - HOIST
      ?auto_11841 - PLACE
      ?auto_11842 - SURFACE
      ?auto_11848 - PLACE
      ?auto_11846 - HOIST
      ?auto_11847 - SURFACE
      ?auto_11840 - TRUCK
      ?auto_11844 - PLACE
      ?auto_11843 - HOIST
      ?auto_11849 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11845 ?auto_11841 ) ( IS-CRATE ?auto_11839 ) ( not ( = ?auto_11838 ?auto_11839 ) ) ( not ( = ?auto_11842 ?auto_11838 ) ) ( not ( = ?auto_11842 ?auto_11839 ) ) ( not ( = ?auto_11848 ?auto_11841 ) ) ( HOIST-AT ?auto_11846 ?auto_11848 ) ( not ( = ?auto_11845 ?auto_11846 ) ) ( AVAILABLE ?auto_11846 ) ( SURFACE-AT ?auto_11839 ?auto_11848 ) ( ON ?auto_11839 ?auto_11847 ) ( CLEAR ?auto_11839 ) ( not ( = ?auto_11838 ?auto_11847 ) ) ( not ( = ?auto_11839 ?auto_11847 ) ) ( not ( = ?auto_11842 ?auto_11847 ) ) ( SURFACE-AT ?auto_11842 ?auto_11841 ) ( CLEAR ?auto_11842 ) ( IS-CRATE ?auto_11838 ) ( AVAILABLE ?auto_11845 ) ( TRUCK-AT ?auto_11840 ?auto_11844 ) ( not ( = ?auto_11844 ?auto_11841 ) ) ( not ( = ?auto_11848 ?auto_11844 ) ) ( HOIST-AT ?auto_11843 ?auto_11844 ) ( not ( = ?auto_11845 ?auto_11843 ) ) ( not ( = ?auto_11846 ?auto_11843 ) ) ( AVAILABLE ?auto_11843 ) ( SURFACE-AT ?auto_11838 ?auto_11844 ) ( ON ?auto_11838 ?auto_11849 ) ( CLEAR ?auto_11838 ) ( not ( = ?auto_11838 ?auto_11849 ) ) ( not ( = ?auto_11839 ?auto_11849 ) ) ( not ( = ?auto_11842 ?auto_11849 ) ) ( not ( = ?auto_11847 ?auto_11849 ) ) )
    :subtasks
    ( ( !LIFT ?auto_11843 ?auto_11838 ?auto_11849 ?auto_11844 )
      ( MAKE-2CRATE ?auto_11842 ?auto_11838 ?auto_11839 )
      ( MAKE-1CRATE-VERIFY ?auto_11838 ?auto_11839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11850 - SURFACE
      ?auto_11851 - SURFACE
      ?auto_11852 - SURFACE
    )
    :vars
    (
      ?auto_11857 - HOIST
      ?auto_11854 - PLACE
      ?auto_11853 - PLACE
      ?auto_11860 - HOIST
      ?auto_11859 - SURFACE
      ?auto_11858 - TRUCK
      ?auto_11861 - PLACE
      ?auto_11856 - HOIST
      ?auto_11855 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11857 ?auto_11854 ) ( IS-CRATE ?auto_11852 ) ( not ( = ?auto_11851 ?auto_11852 ) ) ( not ( = ?auto_11850 ?auto_11851 ) ) ( not ( = ?auto_11850 ?auto_11852 ) ) ( not ( = ?auto_11853 ?auto_11854 ) ) ( HOIST-AT ?auto_11860 ?auto_11853 ) ( not ( = ?auto_11857 ?auto_11860 ) ) ( AVAILABLE ?auto_11860 ) ( SURFACE-AT ?auto_11852 ?auto_11853 ) ( ON ?auto_11852 ?auto_11859 ) ( CLEAR ?auto_11852 ) ( not ( = ?auto_11851 ?auto_11859 ) ) ( not ( = ?auto_11852 ?auto_11859 ) ) ( not ( = ?auto_11850 ?auto_11859 ) ) ( SURFACE-AT ?auto_11850 ?auto_11854 ) ( CLEAR ?auto_11850 ) ( IS-CRATE ?auto_11851 ) ( AVAILABLE ?auto_11857 ) ( TRUCK-AT ?auto_11858 ?auto_11861 ) ( not ( = ?auto_11861 ?auto_11854 ) ) ( not ( = ?auto_11853 ?auto_11861 ) ) ( HOIST-AT ?auto_11856 ?auto_11861 ) ( not ( = ?auto_11857 ?auto_11856 ) ) ( not ( = ?auto_11860 ?auto_11856 ) ) ( AVAILABLE ?auto_11856 ) ( SURFACE-AT ?auto_11851 ?auto_11861 ) ( ON ?auto_11851 ?auto_11855 ) ( CLEAR ?auto_11851 ) ( not ( = ?auto_11851 ?auto_11855 ) ) ( not ( = ?auto_11852 ?auto_11855 ) ) ( not ( = ?auto_11850 ?auto_11855 ) ) ( not ( = ?auto_11859 ?auto_11855 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11851 ?auto_11852 )
      ( MAKE-2CRATE-VERIFY ?auto_11850 ?auto_11851 ?auto_11852 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11862 - SURFACE
      ?auto_11863 - SURFACE
      ?auto_11864 - SURFACE
      ?auto_11865 - SURFACE
    )
    :vars
    (
      ?auto_11869 - HOIST
      ?auto_11868 - PLACE
      ?auto_11874 - PLACE
      ?auto_11866 - HOIST
      ?auto_11872 - SURFACE
      ?auto_11870 - TRUCK
      ?auto_11867 - PLACE
      ?auto_11873 - HOIST
      ?auto_11871 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11869 ?auto_11868 ) ( IS-CRATE ?auto_11865 ) ( not ( = ?auto_11864 ?auto_11865 ) ) ( not ( = ?auto_11863 ?auto_11864 ) ) ( not ( = ?auto_11863 ?auto_11865 ) ) ( not ( = ?auto_11874 ?auto_11868 ) ) ( HOIST-AT ?auto_11866 ?auto_11874 ) ( not ( = ?auto_11869 ?auto_11866 ) ) ( AVAILABLE ?auto_11866 ) ( SURFACE-AT ?auto_11865 ?auto_11874 ) ( ON ?auto_11865 ?auto_11872 ) ( CLEAR ?auto_11865 ) ( not ( = ?auto_11864 ?auto_11872 ) ) ( not ( = ?auto_11865 ?auto_11872 ) ) ( not ( = ?auto_11863 ?auto_11872 ) ) ( SURFACE-AT ?auto_11863 ?auto_11868 ) ( CLEAR ?auto_11863 ) ( IS-CRATE ?auto_11864 ) ( AVAILABLE ?auto_11869 ) ( TRUCK-AT ?auto_11870 ?auto_11867 ) ( not ( = ?auto_11867 ?auto_11868 ) ) ( not ( = ?auto_11874 ?auto_11867 ) ) ( HOIST-AT ?auto_11873 ?auto_11867 ) ( not ( = ?auto_11869 ?auto_11873 ) ) ( not ( = ?auto_11866 ?auto_11873 ) ) ( AVAILABLE ?auto_11873 ) ( SURFACE-AT ?auto_11864 ?auto_11867 ) ( ON ?auto_11864 ?auto_11871 ) ( CLEAR ?auto_11864 ) ( not ( = ?auto_11864 ?auto_11871 ) ) ( not ( = ?auto_11865 ?auto_11871 ) ) ( not ( = ?auto_11863 ?auto_11871 ) ) ( not ( = ?auto_11872 ?auto_11871 ) ) ( ON ?auto_11863 ?auto_11862 ) ( not ( = ?auto_11862 ?auto_11863 ) ) ( not ( = ?auto_11862 ?auto_11864 ) ) ( not ( = ?auto_11862 ?auto_11865 ) ) ( not ( = ?auto_11862 ?auto_11872 ) ) ( not ( = ?auto_11862 ?auto_11871 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11863 ?auto_11864 ?auto_11865 )
      ( MAKE-3CRATE-VERIFY ?auto_11862 ?auto_11863 ?auto_11864 ?auto_11865 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11875 - SURFACE
      ?auto_11876 - SURFACE
    )
    :vars
    (
      ?auto_11880 - HOIST
      ?auto_11879 - PLACE
      ?auto_11882 - SURFACE
      ?auto_11886 - PLACE
      ?auto_11877 - HOIST
      ?auto_11884 - SURFACE
      ?auto_11878 - PLACE
      ?auto_11885 - HOIST
      ?auto_11883 - SURFACE
      ?auto_11881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11880 ?auto_11879 ) ( IS-CRATE ?auto_11876 ) ( not ( = ?auto_11875 ?auto_11876 ) ) ( not ( = ?auto_11882 ?auto_11875 ) ) ( not ( = ?auto_11882 ?auto_11876 ) ) ( not ( = ?auto_11886 ?auto_11879 ) ) ( HOIST-AT ?auto_11877 ?auto_11886 ) ( not ( = ?auto_11880 ?auto_11877 ) ) ( AVAILABLE ?auto_11877 ) ( SURFACE-AT ?auto_11876 ?auto_11886 ) ( ON ?auto_11876 ?auto_11884 ) ( CLEAR ?auto_11876 ) ( not ( = ?auto_11875 ?auto_11884 ) ) ( not ( = ?auto_11876 ?auto_11884 ) ) ( not ( = ?auto_11882 ?auto_11884 ) ) ( SURFACE-AT ?auto_11882 ?auto_11879 ) ( CLEAR ?auto_11882 ) ( IS-CRATE ?auto_11875 ) ( AVAILABLE ?auto_11880 ) ( not ( = ?auto_11878 ?auto_11879 ) ) ( not ( = ?auto_11886 ?auto_11878 ) ) ( HOIST-AT ?auto_11885 ?auto_11878 ) ( not ( = ?auto_11880 ?auto_11885 ) ) ( not ( = ?auto_11877 ?auto_11885 ) ) ( AVAILABLE ?auto_11885 ) ( SURFACE-AT ?auto_11875 ?auto_11878 ) ( ON ?auto_11875 ?auto_11883 ) ( CLEAR ?auto_11875 ) ( not ( = ?auto_11875 ?auto_11883 ) ) ( not ( = ?auto_11876 ?auto_11883 ) ) ( not ( = ?auto_11882 ?auto_11883 ) ) ( not ( = ?auto_11884 ?auto_11883 ) ) ( TRUCK-AT ?auto_11881 ?auto_11879 ) )
    :subtasks
    ( ( !DRIVE ?auto_11881 ?auto_11879 ?auto_11878 )
      ( MAKE-2CRATE ?auto_11882 ?auto_11875 ?auto_11876 )
      ( MAKE-1CRATE-VERIFY ?auto_11875 ?auto_11876 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11887 - SURFACE
      ?auto_11888 - SURFACE
      ?auto_11889 - SURFACE
    )
    :vars
    (
      ?auto_11893 - HOIST
      ?auto_11895 - PLACE
      ?auto_11896 - PLACE
      ?auto_11891 - HOIST
      ?auto_11894 - SURFACE
      ?auto_11890 - PLACE
      ?auto_11892 - HOIST
      ?auto_11897 - SURFACE
      ?auto_11898 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11893 ?auto_11895 ) ( IS-CRATE ?auto_11889 ) ( not ( = ?auto_11888 ?auto_11889 ) ) ( not ( = ?auto_11887 ?auto_11888 ) ) ( not ( = ?auto_11887 ?auto_11889 ) ) ( not ( = ?auto_11896 ?auto_11895 ) ) ( HOIST-AT ?auto_11891 ?auto_11896 ) ( not ( = ?auto_11893 ?auto_11891 ) ) ( AVAILABLE ?auto_11891 ) ( SURFACE-AT ?auto_11889 ?auto_11896 ) ( ON ?auto_11889 ?auto_11894 ) ( CLEAR ?auto_11889 ) ( not ( = ?auto_11888 ?auto_11894 ) ) ( not ( = ?auto_11889 ?auto_11894 ) ) ( not ( = ?auto_11887 ?auto_11894 ) ) ( SURFACE-AT ?auto_11887 ?auto_11895 ) ( CLEAR ?auto_11887 ) ( IS-CRATE ?auto_11888 ) ( AVAILABLE ?auto_11893 ) ( not ( = ?auto_11890 ?auto_11895 ) ) ( not ( = ?auto_11896 ?auto_11890 ) ) ( HOIST-AT ?auto_11892 ?auto_11890 ) ( not ( = ?auto_11893 ?auto_11892 ) ) ( not ( = ?auto_11891 ?auto_11892 ) ) ( AVAILABLE ?auto_11892 ) ( SURFACE-AT ?auto_11888 ?auto_11890 ) ( ON ?auto_11888 ?auto_11897 ) ( CLEAR ?auto_11888 ) ( not ( = ?auto_11888 ?auto_11897 ) ) ( not ( = ?auto_11889 ?auto_11897 ) ) ( not ( = ?auto_11887 ?auto_11897 ) ) ( not ( = ?auto_11894 ?auto_11897 ) ) ( TRUCK-AT ?auto_11898 ?auto_11895 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11888 ?auto_11889 )
      ( MAKE-2CRATE-VERIFY ?auto_11887 ?auto_11888 ?auto_11889 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11899 - SURFACE
      ?auto_11900 - SURFACE
      ?auto_11901 - SURFACE
      ?auto_11902 - SURFACE
    )
    :vars
    (
      ?auto_11904 - HOIST
      ?auto_11910 - PLACE
      ?auto_11911 - PLACE
      ?auto_11909 - HOIST
      ?auto_11907 - SURFACE
      ?auto_11903 - PLACE
      ?auto_11908 - HOIST
      ?auto_11906 - SURFACE
      ?auto_11905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11904 ?auto_11910 ) ( IS-CRATE ?auto_11902 ) ( not ( = ?auto_11901 ?auto_11902 ) ) ( not ( = ?auto_11900 ?auto_11901 ) ) ( not ( = ?auto_11900 ?auto_11902 ) ) ( not ( = ?auto_11911 ?auto_11910 ) ) ( HOIST-AT ?auto_11909 ?auto_11911 ) ( not ( = ?auto_11904 ?auto_11909 ) ) ( AVAILABLE ?auto_11909 ) ( SURFACE-AT ?auto_11902 ?auto_11911 ) ( ON ?auto_11902 ?auto_11907 ) ( CLEAR ?auto_11902 ) ( not ( = ?auto_11901 ?auto_11907 ) ) ( not ( = ?auto_11902 ?auto_11907 ) ) ( not ( = ?auto_11900 ?auto_11907 ) ) ( SURFACE-AT ?auto_11900 ?auto_11910 ) ( CLEAR ?auto_11900 ) ( IS-CRATE ?auto_11901 ) ( AVAILABLE ?auto_11904 ) ( not ( = ?auto_11903 ?auto_11910 ) ) ( not ( = ?auto_11911 ?auto_11903 ) ) ( HOIST-AT ?auto_11908 ?auto_11903 ) ( not ( = ?auto_11904 ?auto_11908 ) ) ( not ( = ?auto_11909 ?auto_11908 ) ) ( AVAILABLE ?auto_11908 ) ( SURFACE-AT ?auto_11901 ?auto_11903 ) ( ON ?auto_11901 ?auto_11906 ) ( CLEAR ?auto_11901 ) ( not ( = ?auto_11901 ?auto_11906 ) ) ( not ( = ?auto_11902 ?auto_11906 ) ) ( not ( = ?auto_11900 ?auto_11906 ) ) ( not ( = ?auto_11907 ?auto_11906 ) ) ( TRUCK-AT ?auto_11905 ?auto_11910 ) ( ON ?auto_11900 ?auto_11899 ) ( not ( = ?auto_11899 ?auto_11900 ) ) ( not ( = ?auto_11899 ?auto_11901 ) ) ( not ( = ?auto_11899 ?auto_11902 ) ) ( not ( = ?auto_11899 ?auto_11907 ) ) ( not ( = ?auto_11899 ?auto_11906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11900 ?auto_11901 ?auto_11902 )
      ( MAKE-3CRATE-VERIFY ?auto_11899 ?auto_11900 ?auto_11901 ?auto_11902 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11912 - SURFACE
      ?auto_11913 - SURFACE
    )
    :vars
    (
      ?auto_11915 - HOIST
      ?auto_11922 - PLACE
      ?auto_11918 - SURFACE
      ?auto_11923 - PLACE
      ?auto_11921 - HOIST
      ?auto_11919 - SURFACE
      ?auto_11914 - PLACE
      ?auto_11920 - HOIST
      ?auto_11917 - SURFACE
      ?auto_11916 - TRUCK
      ?auto_11924 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11915 ?auto_11922 ) ( IS-CRATE ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11913 ) ) ( not ( = ?auto_11918 ?auto_11912 ) ) ( not ( = ?auto_11918 ?auto_11913 ) ) ( not ( = ?auto_11923 ?auto_11922 ) ) ( HOIST-AT ?auto_11921 ?auto_11923 ) ( not ( = ?auto_11915 ?auto_11921 ) ) ( AVAILABLE ?auto_11921 ) ( SURFACE-AT ?auto_11913 ?auto_11923 ) ( ON ?auto_11913 ?auto_11919 ) ( CLEAR ?auto_11913 ) ( not ( = ?auto_11912 ?auto_11919 ) ) ( not ( = ?auto_11913 ?auto_11919 ) ) ( not ( = ?auto_11918 ?auto_11919 ) ) ( IS-CRATE ?auto_11912 ) ( not ( = ?auto_11914 ?auto_11922 ) ) ( not ( = ?auto_11923 ?auto_11914 ) ) ( HOIST-AT ?auto_11920 ?auto_11914 ) ( not ( = ?auto_11915 ?auto_11920 ) ) ( not ( = ?auto_11921 ?auto_11920 ) ) ( AVAILABLE ?auto_11920 ) ( SURFACE-AT ?auto_11912 ?auto_11914 ) ( ON ?auto_11912 ?auto_11917 ) ( CLEAR ?auto_11912 ) ( not ( = ?auto_11912 ?auto_11917 ) ) ( not ( = ?auto_11913 ?auto_11917 ) ) ( not ( = ?auto_11918 ?auto_11917 ) ) ( not ( = ?auto_11919 ?auto_11917 ) ) ( TRUCK-AT ?auto_11916 ?auto_11922 ) ( SURFACE-AT ?auto_11924 ?auto_11922 ) ( CLEAR ?auto_11924 ) ( LIFTING ?auto_11915 ?auto_11918 ) ( IS-CRATE ?auto_11918 ) ( not ( = ?auto_11924 ?auto_11918 ) ) ( not ( = ?auto_11912 ?auto_11924 ) ) ( not ( = ?auto_11913 ?auto_11924 ) ) ( not ( = ?auto_11919 ?auto_11924 ) ) ( not ( = ?auto_11917 ?auto_11924 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11924 ?auto_11918 )
      ( MAKE-2CRATE ?auto_11918 ?auto_11912 ?auto_11913 )
      ( MAKE-1CRATE-VERIFY ?auto_11912 ?auto_11913 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11925 - SURFACE
      ?auto_11926 - SURFACE
      ?auto_11927 - SURFACE
    )
    :vars
    (
      ?auto_11929 - HOIST
      ?auto_11932 - PLACE
      ?auto_11928 - PLACE
      ?auto_11936 - HOIST
      ?auto_11931 - SURFACE
      ?auto_11933 - PLACE
      ?auto_11934 - HOIST
      ?auto_11930 - SURFACE
      ?auto_11935 - TRUCK
      ?auto_11937 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11929 ?auto_11932 ) ( IS-CRATE ?auto_11927 ) ( not ( = ?auto_11926 ?auto_11927 ) ) ( not ( = ?auto_11925 ?auto_11926 ) ) ( not ( = ?auto_11925 ?auto_11927 ) ) ( not ( = ?auto_11928 ?auto_11932 ) ) ( HOIST-AT ?auto_11936 ?auto_11928 ) ( not ( = ?auto_11929 ?auto_11936 ) ) ( AVAILABLE ?auto_11936 ) ( SURFACE-AT ?auto_11927 ?auto_11928 ) ( ON ?auto_11927 ?auto_11931 ) ( CLEAR ?auto_11927 ) ( not ( = ?auto_11926 ?auto_11931 ) ) ( not ( = ?auto_11927 ?auto_11931 ) ) ( not ( = ?auto_11925 ?auto_11931 ) ) ( IS-CRATE ?auto_11926 ) ( not ( = ?auto_11933 ?auto_11932 ) ) ( not ( = ?auto_11928 ?auto_11933 ) ) ( HOIST-AT ?auto_11934 ?auto_11933 ) ( not ( = ?auto_11929 ?auto_11934 ) ) ( not ( = ?auto_11936 ?auto_11934 ) ) ( AVAILABLE ?auto_11934 ) ( SURFACE-AT ?auto_11926 ?auto_11933 ) ( ON ?auto_11926 ?auto_11930 ) ( CLEAR ?auto_11926 ) ( not ( = ?auto_11926 ?auto_11930 ) ) ( not ( = ?auto_11927 ?auto_11930 ) ) ( not ( = ?auto_11925 ?auto_11930 ) ) ( not ( = ?auto_11931 ?auto_11930 ) ) ( TRUCK-AT ?auto_11935 ?auto_11932 ) ( SURFACE-AT ?auto_11937 ?auto_11932 ) ( CLEAR ?auto_11937 ) ( LIFTING ?auto_11929 ?auto_11925 ) ( IS-CRATE ?auto_11925 ) ( not ( = ?auto_11937 ?auto_11925 ) ) ( not ( = ?auto_11926 ?auto_11937 ) ) ( not ( = ?auto_11927 ?auto_11937 ) ) ( not ( = ?auto_11931 ?auto_11937 ) ) ( not ( = ?auto_11930 ?auto_11937 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11926 ?auto_11927 )
      ( MAKE-2CRATE-VERIFY ?auto_11925 ?auto_11926 ?auto_11927 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11938 - SURFACE
      ?auto_11939 - SURFACE
      ?auto_11940 - SURFACE
      ?auto_11941 - SURFACE
    )
    :vars
    (
      ?auto_11946 - HOIST
      ?auto_11945 - PLACE
      ?auto_11944 - PLACE
      ?auto_11947 - HOIST
      ?auto_11942 - SURFACE
      ?auto_11949 - PLACE
      ?auto_11948 - HOIST
      ?auto_11943 - SURFACE
      ?auto_11950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11946 ?auto_11945 ) ( IS-CRATE ?auto_11941 ) ( not ( = ?auto_11940 ?auto_11941 ) ) ( not ( = ?auto_11939 ?auto_11940 ) ) ( not ( = ?auto_11939 ?auto_11941 ) ) ( not ( = ?auto_11944 ?auto_11945 ) ) ( HOIST-AT ?auto_11947 ?auto_11944 ) ( not ( = ?auto_11946 ?auto_11947 ) ) ( AVAILABLE ?auto_11947 ) ( SURFACE-AT ?auto_11941 ?auto_11944 ) ( ON ?auto_11941 ?auto_11942 ) ( CLEAR ?auto_11941 ) ( not ( = ?auto_11940 ?auto_11942 ) ) ( not ( = ?auto_11941 ?auto_11942 ) ) ( not ( = ?auto_11939 ?auto_11942 ) ) ( IS-CRATE ?auto_11940 ) ( not ( = ?auto_11949 ?auto_11945 ) ) ( not ( = ?auto_11944 ?auto_11949 ) ) ( HOIST-AT ?auto_11948 ?auto_11949 ) ( not ( = ?auto_11946 ?auto_11948 ) ) ( not ( = ?auto_11947 ?auto_11948 ) ) ( AVAILABLE ?auto_11948 ) ( SURFACE-AT ?auto_11940 ?auto_11949 ) ( ON ?auto_11940 ?auto_11943 ) ( CLEAR ?auto_11940 ) ( not ( = ?auto_11940 ?auto_11943 ) ) ( not ( = ?auto_11941 ?auto_11943 ) ) ( not ( = ?auto_11939 ?auto_11943 ) ) ( not ( = ?auto_11942 ?auto_11943 ) ) ( TRUCK-AT ?auto_11950 ?auto_11945 ) ( SURFACE-AT ?auto_11938 ?auto_11945 ) ( CLEAR ?auto_11938 ) ( LIFTING ?auto_11946 ?auto_11939 ) ( IS-CRATE ?auto_11939 ) ( not ( = ?auto_11938 ?auto_11939 ) ) ( not ( = ?auto_11940 ?auto_11938 ) ) ( not ( = ?auto_11941 ?auto_11938 ) ) ( not ( = ?auto_11942 ?auto_11938 ) ) ( not ( = ?auto_11943 ?auto_11938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11939 ?auto_11940 ?auto_11941 )
      ( MAKE-3CRATE-VERIFY ?auto_11938 ?auto_11939 ?auto_11940 ?auto_11941 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11951 - SURFACE
      ?auto_11952 - SURFACE
    )
    :vars
    (
      ?auto_11957 - HOIST
      ?auto_11956 - PLACE
      ?auto_11963 - SURFACE
      ?auto_11955 - PLACE
      ?auto_11959 - HOIST
      ?auto_11953 - SURFACE
      ?auto_11961 - PLACE
      ?auto_11960 - HOIST
      ?auto_11954 - SURFACE
      ?auto_11962 - TRUCK
      ?auto_11958 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11957 ?auto_11956 ) ( IS-CRATE ?auto_11952 ) ( not ( = ?auto_11951 ?auto_11952 ) ) ( not ( = ?auto_11963 ?auto_11951 ) ) ( not ( = ?auto_11963 ?auto_11952 ) ) ( not ( = ?auto_11955 ?auto_11956 ) ) ( HOIST-AT ?auto_11959 ?auto_11955 ) ( not ( = ?auto_11957 ?auto_11959 ) ) ( AVAILABLE ?auto_11959 ) ( SURFACE-AT ?auto_11952 ?auto_11955 ) ( ON ?auto_11952 ?auto_11953 ) ( CLEAR ?auto_11952 ) ( not ( = ?auto_11951 ?auto_11953 ) ) ( not ( = ?auto_11952 ?auto_11953 ) ) ( not ( = ?auto_11963 ?auto_11953 ) ) ( IS-CRATE ?auto_11951 ) ( not ( = ?auto_11961 ?auto_11956 ) ) ( not ( = ?auto_11955 ?auto_11961 ) ) ( HOIST-AT ?auto_11960 ?auto_11961 ) ( not ( = ?auto_11957 ?auto_11960 ) ) ( not ( = ?auto_11959 ?auto_11960 ) ) ( AVAILABLE ?auto_11960 ) ( SURFACE-AT ?auto_11951 ?auto_11961 ) ( ON ?auto_11951 ?auto_11954 ) ( CLEAR ?auto_11951 ) ( not ( = ?auto_11951 ?auto_11954 ) ) ( not ( = ?auto_11952 ?auto_11954 ) ) ( not ( = ?auto_11963 ?auto_11954 ) ) ( not ( = ?auto_11953 ?auto_11954 ) ) ( TRUCK-AT ?auto_11962 ?auto_11956 ) ( SURFACE-AT ?auto_11958 ?auto_11956 ) ( CLEAR ?auto_11958 ) ( IS-CRATE ?auto_11963 ) ( not ( = ?auto_11958 ?auto_11963 ) ) ( not ( = ?auto_11951 ?auto_11958 ) ) ( not ( = ?auto_11952 ?auto_11958 ) ) ( not ( = ?auto_11953 ?auto_11958 ) ) ( not ( = ?auto_11954 ?auto_11958 ) ) ( AVAILABLE ?auto_11957 ) ( IN ?auto_11963 ?auto_11962 ) )
    :subtasks
    ( ( !UNLOAD ?auto_11957 ?auto_11963 ?auto_11962 ?auto_11956 )
      ( MAKE-2CRATE ?auto_11963 ?auto_11951 ?auto_11952 )
      ( MAKE-1CRATE-VERIFY ?auto_11951 ?auto_11952 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_11964 - SURFACE
      ?auto_11965 - SURFACE
      ?auto_11966 - SURFACE
    )
    :vars
    (
      ?auto_11967 - HOIST
      ?auto_11974 - PLACE
      ?auto_11970 - PLACE
      ?auto_11975 - HOIST
      ?auto_11972 - SURFACE
      ?auto_11969 - PLACE
      ?auto_11968 - HOIST
      ?auto_11971 - SURFACE
      ?auto_11973 - TRUCK
      ?auto_11976 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11967 ?auto_11974 ) ( IS-CRATE ?auto_11966 ) ( not ( = ?auto_11965 ?auto_11966 ) ) ( not ( = ?auto_11964 ?auto_11965 ) ) ( not ( = ?auto_11964 ?auto_11966 ) ) ( not ( = ?auto_11970 ?auto_11974 ) ) ( HOIST-AT ?auto_11975 ?auto_11970 ) ( not ( = ?auto_11967 ?auto_11975 ) ) ( AVAILABLE ?auto_11975 ) ( SURFACE-AT ?auto_11966 ?auto_11970 ) ( ON ?auto_11966 ?auto_11972 ) ( CLEAR ?auto_11966 ) ( not ( = ?auto_11965 ?auto_11972 ) ) ( not ( = ?auto_11966 ?auto_11972 ) ) ( not ( = ?auto_11964 ?auto_11972 ) ) ( IS-CRATE ?auto_11965 ) ( not ( = ?auto_11969 ?auto_11974 ) ) ( not ( = ?auto_11970 ?auto_11969 ) ) ( HOIST-AT ?auto_11968 ?auto_11969 ) ( not ( = ?auto_11967 ?auto_11968 ) ) ( not ( = ?auto_11975 ?auto_11968 ) ) ( AVAILABLE ?auto_11968 ) ( SURFACE-AT ?auto_11965 ?auto_11969 ) ( ON ?auto_11965 ?auto_11971 ) ( CLEAR ?auto_11965 ) ( not ( = ?auto_11965 ?auto_11971 ) ) ( not ( = ?auto_11966 ?auto_11971 ) ) ( not ( = ?auto_11964 ?auto_11971 ) ) ( not ( = ?auto_11972 ?auto_11971 ) ) ( TRUCK-AT ?auto_11973 ?auto_11974 ) ( SURFACE-AT ?auto_11976 ?auto_11974 ) ( CLEAR ?auto_11976 ) ( IS-CRATE ?auto_11964 ) ( not ( = ?auto_11976 ?auto_11964 ) ) ( not ( = ?auto_11965 ?auto_11976 ) ) ( not ( = ?auto_11966 ?auto_11976 ) ) ( not ( = ?auto_11972 ?auto_11976 ) ) ( not ( = ?auto_11971 ?auto_11976 ) ) ( AVAILABLE ?auto_11967 ) ( IN ?auto_11964 ?auto_11973 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_11965 ?auto_11966 )
      ( MAKE-2CRATE-VERIFY ?auto_11964 ?auto_11965 ?auto_11966 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_11977 - SURFACE
      ?auto_11978 - SURFACE
      ?auto_11979 - SURFACE
      ?auto_11980 - SURFACE
    )
    :vars
    (
      ?auto_11985 - HOIST
      ?auto_11984 - PLACE
      ?auto_11986 - PLACE
      ?auto_11989 - HOIST
      ?auto_11981 - SURFACE
      ?auto_11988 - PLACE
      ?auto_11983 - HOIST
      ?auto_11982 - SURFACE
      ?auto_11987 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_11985 ?auto_11984 ) ( IS-CRATE ?auto_11980 ) ( not ( = ?auto_11979 ?auto_11980 ) ) ( not ( = ?auto_11978 ?auto_11979 ) ) ( not ( = ?auto_11978 ?auto_11980 ) ) ( not ( = ?auto_11986 ?auto_11984 ) ) ( HOIST-AT ?auto_11989 ?auto_11986 ) ( not ( = ?auto_11985 ?auto_11989 ) ) ( AVAILABLE ?auto_11989 ) ( SURFACE-AT ?auto_11980 ?auto_11986 ) ( ON ?auto_11980 ?auto_11981 ) ( CLEAR ?auto_11980 ) ( not ( = ?auto_11979 ?auto_11981 ) ) ( not ( = ?auto_11980 ?auto_11981 ) ) ( not ( = ?auto_11978 ?auto_11981 ) ) ( IS-CRATE ?auto_11979 ) ( not ( = ?auto_11988 ?auto_11984 ) ) ( not ( = ?auto_11986 ?auto_11988 ) ) ( HOIST-AT ?auto_11983 ?auto_11988 ) ( not ( = ?auto_11985 ?auto_11983 ) ) ( not ( = ?auto_11989 ?auto_11983 ) ) ( AVAILABLE ?auto_11983 ) ( SURFACE-AT ?auto_11979 ?auto_11988 ) ( ON ?auto_11979 ?auto_11982 ) ( CLEAR ?auto_11979 ) ( not ( = ?auto_11979 ?auto_11982 ) ) ( not ( = ?auto_11980 ?auto_11982 ) ) ( not ( = ?auto_11978 ?auto_11982 ) ) ( not ( = ?auto_11981 ?auto_11982 ) ) ( TRUCK-AT ?auto_11987 ?auto_11984 ) ( SURFACE-AT ?auto_11977 ?auto_11984 ) ( CLEAR ?auto_11977 ) ( IS-CRATE ?auto_11978 ) ( not ( = ?auto_11977 ?auto_11978 ) ) ( not ( = ?auto_11979 ?auto_11977 ) ) ( not ( = ?auto_11980 ?auto_11977 ) ) ( not ( = ?auto_11981 ?auto_11977 ) ) ( not ( = ?auto_11982 ?auto_11977 ) ) ( AVAILABLE ?auto_11985 ) ( IN ?auto_11978 ?auto_11987 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_11978 ?auto_11979 ?auto_11980 )
      ( MAKE-3CRATE-VERIFY ?auto_11977 ?auto_11978 ?auto_11979 ?auto_11980 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_11990 - SURFACE
      ?auto_11991 - SURFACE
    )
    :vars
    (
      ?auto_11997 - HOIST
      ?auto_11995 - PLACE
      ?auto_11998 - SURFACE
      ?auto_11999 - PLACE
      ?auto_12002 - HOIST
      ?auto_11992 - SURFACE
      ?auto_12001 - PLACE
      ?auto_11994 - HOIST
      ?auto_11993 - SURFACE
      ?auto_11996 - SURFACE
      ?auto_12000 - TRUCK
      ?auto_12003 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_11997 ?auto_11995 ) ( IS-CRATE ?auto_11991 ) ( not ( = ?auto_11990 ?auto_11991 ) ) ( not ( = ?auto_11998 ?auto_11990 ) ) ( not ( = ?auto_11998 ?auto_11991 ) ) ( not ( = ?auto_11999 ?auto_11995 ) ) ( HOIST-AT ?auto_12002 ?auto_11999 ) ( not ( = ?auto_11997 ?auto_12002 ) ) ( AVAILABLE ?auto_12002 ) ( SURFACE-AT ?auto_11991 ?auto_11999 ) ( ON ?auto_11991 ?auto_11992 ) ( CLEAR ?auto_11991 ) ( not ( = ?auto_11990 ?auto_11992 ) ) ( not ( = ?auto_11991 ?auto_11992 ) ) ( not ( = ?auto_11998 ?auto_11992 ) ) ( IS-CRATE ?auto_11990 ) ( not ( = ?auto_12001 ?auto_11995 ) ) ( not ( = ?auto_11999 ?auto_12001 ) ) ( HOIST-AT ?auto_11994 ?auto_12001 ) ( not ( = ?auto_11997 ?auto_11994 ) ) ( not ( = ?auto_12002 ?auto_11994 ) ) ( AVAILABLE ?auto_11994 ) ( SURFACE-AT ?auto_11990 ?auto_12001 ) ( ON ?auto_11990 ?auto_11993 ) ( CLEAR ?auto_11990 ) ( not ( = ?auto_11990 ?auto_11993 ) ) ( not ( = ?auto_11991 ?auto_11993 ) ) ( not ( = ?auto_11998 ?auto_11993 ) ) ( not ( = ?auto_11992 ?auto_11993 ) ) ( SURFACE-AT ?auto_11996 ?auto_11995 ) ( CLEAR ?auto_11996 ) ( IS-CRATE ?auto_11998 ) ( not ( = ?auto_11996 ?auto_11998 ) ) ( not ( = ?auto_11990 ?auto_11996 ) ) ( not ( = ?auto_11991 ?auto_11996 ) ) ( not ( = ?auto_11992 ?auto_11996 ) ) ( not ( = ?auto_11993 ?auto_11996 ) ) ( AVAILABLE ?auto_11997 ) ( IN ?auto_11998 ?auto_12000 ) ( TRUCK-AT ?auto_12000 ?auto_12003 ) ( not ( = ?auto_12003 ?auto_11995 ) ) ( not ( = ?auto_11999 ?auto_12003 ) ) ( not ( = ?auto_12001 ?auto_12003 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12000 ?auto_12003 ?auto_11995 )
      ( MAKE-2CRATE ?auto_11998 ?auto_11990 ?auto_11991 )
      ( MAKE-1CRATE-VERIFY ?auto_11990 ?auto_11991 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12004 - SURFACE
      ?auto_12005 - SURFACE
      ?auto_12006 - SURFACE
    )
    :vars
    (
      ?auto_12010 - HOIST
      ?auto_12011 - PLACE
      ?auto_12016 - PLACE
      ?auto_12009 - HOIST
      ?auto_12015 - SURFACE
      ?auto_12013 - PLACE
      ?auto_12012 - HOIST
      ?auto_12007 - SURFACE
      ?auto_12014 - SURFACE
      ?auto_12017 - TRUCK
      ?auto_12008 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12010 ?auto_12011 ) ( IS-CRATE ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12006 ) ) ( not ( = ?auto_12004 ?auto_12005 ) ) ( not ( = ?auto_12004 ?auto_12006 ) ) ( not ( = ?auto_12016 ?auto_12011 ) ) ( HOIST-AT ?auto_12009 ?auto_12016 ) ( not ( = ?auto_12010 ?auto_12009 ) ) ( AVAILABLE ?auto_12009 ) ( SURFACE-AT ?auto_12006 ?auto_12016 ) ( ON ?auto_12006 ?auto_12015 ) ( CLEAR ?auto_12006 ) ( not ( = ?auto_12005 ?auto_12015 ) ) ( not ( = ?auto_12006 ?auto_12015 ) ) ( not ( = ?auto_12004 ?auto_12015 ) ) ( IS-CRATE ?auto_12005 ) ( not ( = ?auto_12013 ?auto_12011 ) ) ( not ( = ?auto_12016 ?auto_12013 ) ) ( HOIST-AT ?auto_12012 ?auto_12013 ) ( not ( = ?auto_12010 ?auto_12012 ) ) ( not ( = ?auto_12009 ?auto_12012 ) ) ( AVAILABLE ?auto_12012 ) ( SURFACE-AT ?auto_12005 ?auto_12013 ) ( ON ?auto_12005 ?auto_12007 ) ( CLEAR ?auto_12005 ) ( not ( = ?auto_12005 ?auto_12007 ) ) ( not ( = ?auto_12006 ?auto_12007 ) ) ( not ( = ?auto_12004 ?auto_12007 ) ) ( not ( = ?auto_12015 ?auto_12007 ) ) ( SURFACE-AT ?auto_12014 ?auto_12011 ) ( CLEAR ?auto_12014 ) ( IS-CRATE ?auto_12004 ) ( not ( = ?auto_12014 ?auto_12004 ) ) ( not ( = ?auto_12005 ?auto_12014 ) ) ( not ( = ?auto_12006 ?auto_12014 ) ) ( not ( = ?auto_12015 ?auto_12014 ) ) ( not ( = ?auto_12007 ?auto_12014 ) ) ( AVAILABLE ?auto_12010 ) ( IN ?auto_12004 ?auto_12017 ) ( TRUCK-AT ?auto_12017 ?auto_12008 ) ( not ( = ?auto_12008 ?auto_12011 ) ) ( not ( = ?auto_12016 ?auto_12008 ) ) ( not ( = ?auto_12013 ?auto_12008 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12005 ?auto_12006 )
      ( MAKE-2CRATE-VERIFY ?auto_12004 ?auto_12005 ?auto_12006 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12018 - SURFACE
      ?auto_12019 - SURFACE
      ?auto_12020 - SURFACE
      ?auto_12021 - SURFACE
    )
    :vars
    (
      ?auto_12024 - HOIST
      ?auto_12026 - PLACE
      ?auto_12025 - PLACE
      ?auto_12030 - HOIST
      ?auto_12029 - SURFACE
      ?auto_12027 - PLACE
      ?auto_12023 - HOIST
      ?auto_12022 - SURFACE
      ?auto_12031 - TRUCK
      ?auto_12028 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12024 ?auto_12026 ) ( IS-CRATE ?auto_12021 ) ( not ( = ?auto_12020 ?auto_12021 ) ) ( not ( = ?auto_12019 ?auto_12020 ) ) ( not ( = ?auto_12019 ?auto_12021 ) ) ( not ( = ?auto_12025 ?auto_12026 ) ) ( HOIST-AT ?auto_12030 ?auto_12025 ) ( not ( = ?auto_12024 ?auto_12030 ) ) ( AVAILABLE ?auto_12030 ) ( SURFACE-AT ?auto_12021 ?auto_12025 ) ( ON ?auto_12021 ?auto_12029 ) ( CLEAR ?auto_12021 ) ( not ( = ?auto_12020 ?auto_12029 ) ) ( not ( = ?auto_12021 ?auto_12029 ) ) ( not ( = ?auto_12019 ?auto_12029 ) ) ( IS-CRATE ?auto_12020 ) ( not ( = ?auto_12027 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12027 ) ) ( HOIST-AT ?auto_12023 ?auto_12027 ) ( not ( = ?auto_12024 ?auto_12023 ) ) ( not ( = ?auto_12030 ?auto_12023 ) ) ( AVAILABLE ?auto_12023 ) ( SURFACE-AT ?auto_12020 ?auto_12027 ) ( ON ?auto_12020 ?auto_12022 ) ( CLEAR ?auto_12020 ) ( not ( = ?auto_12020 ?auto_12022 ) ) ( not ( = ?auto_12021 ?auto_12022 ) ) ( not ( = ?auto_12019 ?auto_12022 ) ) ( not ( = ?auto_12029 ?auto_12022 ) ) ( SURFACE-AT ?auto_12018 ?auto_12026 ) ( CLEAR ?auto_12018 ) ( IS-CRATE ?auto_12019 ) ( not ( = ?auto_12018 ?auto_12019 ) ) ( not ( = ?auto_12020 ?auto_12018 ) ) ( not ( = ?auto_12021 ?auto_12018 ) ) ( not ( = ?auto_12029 ?auto_12018 ) ) ( not ( = ?auto_12022 ?auto_12018 ) ) ( AVAILABLE ?auto_12024 ) ( IN ?auto_12019 ?auto_12031 ) ( TRUCK-AT ?auto_12031 ?auto_12028 ) ( not ( = ?auto_12028 ?auto_12026 ) ) ( not ( = ?auto_12025 ?auto_12028 ) ) ( not ( = ?auto_12027 ?auto_12028 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12019 ?auto_12020 ?auto_12021 )
      ( MAKE-3CRATE-VERIFY ?auto_12018 ?auto_12019 ?auto_12020 ?auto_12021 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12032 - SURFACE
      ?auto_12033 - SURFACE
    )
    :vars
    (
      ?auto_12036 - HOIST
      ?auto_12039 - PLACE
      ?auto_12038 - SURFACE
      ?auto_12037 - PLACE
      ?auto_12044 - HOIST
      ?auto_12043 - SURFACE
      ?auto_12040 - PLACE
      ?auto_12035 - HOIST
      ?auto_12034 - SURFACE
      ?auto_12041 - SURFACE
      ?auto_12045 - TRUCK
      ?auto_12042 - PLACE
      ?auto_12046 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12036 ?auto_12039 ) ( IS-CRATE ?auto_12033 ) ( not ( = ?auto_12032 ?auto_12033 ) ) ( not ( = ?auto_12038 ?auto_12032 ) ) ( not ( = ?auto_12038 ?auto_12033 ) ) ( not ( = ?auto_12037 ?auto_12039 ) ) ( HOIST-AT ?auto_12044 ?auto_12037 ) ( not ( = ?auto_12036 ?auto_12044 ) ) ( AVAILABLE ?auto_12044 ) ( SURFACE-AT ?auto_12033 ?auto_12037 ) ( ON ?auto_12033 ?auto_12043 ) ( CLEAR ?auto_12033 ) ( not ( = ?auto_12032 ?auto_12043 ) ) ( not ( = ?auto_12033 ?auto_12043 ) ) ( not ( = ?auto_12038 ?auto_12043 ) ) ( IS-CRATE ?auto_12032 ) ( not ( = ?auto_12040 ?auto_12039 ) ) ( not ( = ?auto_12037 ?auto_12040 ) ) ( HOIST-AT ?auto_12035 ?auto_12040 ) ( not ( = ?auto_12036 ?auto_12035 ) ) ( not ( = ?auto_12044 ?auto_12035 ) ) ( AVAILABLE ?auto_12035 ) ( SURFACE-AT ?auto_12032 ?auto_12040 ) ( ON ?auto_12032 ?auto_12034 ) ( CLEAR ?auto_12032 ) ( not ( = ?auto_12032 ?auto_12034 ) ) ( not ( = ?auto_12033 ?auto_12034 ) ) ( not ( = ?auto_12038 ?auto_12034 ) ) ( not ( = ?auto_12043 ?auto_12034 ) ) ( SURFACE-AT ?auto_12041 ?auto_12039 ) ( CLEAR ?auto_12041 ) ( IS-CRATE ?auto_12038 ) ( not ( = ?auto_12041 ?auto_12038 ) ) ( not ( = ?auto_12032 ?auto_12041 ) ) ( not ( = ?auto_12033 ?auto_12041 ) ) ( not ( = ?auto_12043 ?auto_12041 ) ) ( not ( = ?auto_12034 ?auto_12041 ) ) ( AVAILABLE ?auto_12036 ) ( TRUCK-AT ?auto_12045 ?auto_12042 ) ( not ( = ?auto_12042 ?auto_12039 ) ) ( not ( = ?auto_12037 ?auto_12042 ) ) ( not ( = ?auto_12040 ?auto_12042 ) ) ( HOIST-AT ?auto_12046 ?auto_12042 ) ( LIFTING ?auto_12046 ?auto_12038 ) ( not ( = ?auto_12036 ?auto_12046 ) ) ( not ( = ?auto_12044 ?auto_12046 ) ) ( not ( = ?auto_12035 ?auto_12046 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12046 ?auto_12038 ?auto_12045 ?auto_12042 )
      ( MAKE-2CRATE ?auto_12038 ?auto_12032 ?auto_12033 )
      ( MAKE-1CRATE-VERIFY ?auto_12032 ?auto_12033 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12047 - SURFACE
      ?auto_12048 - SURFACE
      ?auto_12049 - SURFACE
    )
    :vars
    (
      ?auto_12056 - HOIST
      ?auto_12060 - PLACE
      ?auto_12058 - PLACE
      ?auto_12054 - HOIST
      ?auto_12055 - SURFACE
      ?auto_12051 - PLACE
      ?auto_12050 - HOIST
      ?auto_12059 - SURFACE
      ?auto_12057 - SURFACE
      ?auto_12052 - TRUCK
      ?auto_12061 - PLACE
      ?auto_12053 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12056 ?auto_12060 ) ( IS-CRATE ?auto_12049 ) ( not ( = ?auto_12048 ?auto_12049 ) ) ( not ( = ?auto_12047 ?auto_12048 ) ) ( not ( = ?auto_12047 ?auto_12049 ) ) ( not ( = ?auto_12058 ?auto_12060 ) ) ( HOIST-AT ?auto_12054 ?auto_12058 ) ( not ( = ?auto_12056 ?auto_12054 ) ) ( AVAILABLE ?auto_12054 ) ( SURFACE-AT ?auto_12049 ?auto_12058 ) ( ON ?auto_12049 ?auto_12055 ) ( CLEAR ?auto_12049 ) ( not ( = ?auto_12048 ?auto_12055 ) ) ( not ( = ?auto_12049 ?auto_12055 ) ) ( not ( = ?auto_12047 ?auto_12055 ) ) ( IS-CRATE ?auto_12048 ) ( not ( = ?auto_12051 ?auto_12060 ) ) ( not ( = ?auto_12058 ?auto_12051 ) ) ( HOIST-AT ?auto_12050 ?auto_12051 ) ( not ( = ?auto_12056 ?auto_12050 ) ) ( not ( = ?auto_12054 ?auto_12050 ) ) ( AVAILABLE ?auto_12050 ) ( SURFACE-AT ?auto_12048 ?auto_12051 ) ( ON ?auto_12048 ?auto_12059 ) ( CLEAR ?auto_12048 ) ( not ( = ?auto_12048 ?auto_12059 ) ) ( not ( = ?auto_12049 ?auto_12059 ) ) ( not ( = ?auto_12047 ?auto_12059 ) ) ( not ( = ?auto_12055 ?auto_12059 ) ) ( SURFACE-AT ?auto_12057 ?auto_12060 ) ( CLEAR ?auto_12057 ) ( IS-CRATE ?auto_12047 ) ( not ( = ?auto_12057 ?auto_12047 ) ) ( not ( = ?auto_12048 ?auto_12057 ) ) ( not ( = ?auto_12049 ?auto_12057 ) ) ( not ( = ?auto_12055 ?auto_12057 ) ) ( not ( = ?auto_12059 ?auto_12057 ) ) ( AVAILABLE ?auto_12056 ) ( TRUCK-AT ?auto_12052 ?auto_12061 ) ( not ( = ?auto_12061 ?auto_12060 ) ) ( not ( = ?auto_12058 ?auto_12061 ) ) ( not ( = ?auto_12051 ?auto_12061 ) ) ( HOIST-AT ?auto_12053 ?auto_12061 ) ( LIFTING ?auto_12053 ?auto_12047 ) ( not ( = ?auto_12056 ?auto_12053 ) ) ( not ( = ?auto_12054 ?auto_12053 ) ) ( not ( = ?auto_12050 ?auto_12053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12048 ?auto_12049 )
      ( MAKE-2CRATE-VERIFY ?auto_12047 ?auto_12048 ?auto_12049 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12062 - SURFACE
      ?auto_12063 - SURFACE
      ?auto_12064 - SURFACE
      ?auto_12065 - SURFACE
    )
    :vars
    (
      ?auto_12071 - HOIST
      ?auto_12066 - PLACE
      ?auto_12072 - PLACE
      ?auto_12075 - HOIST
      ?auto_12073 - SURFACE
      ?auto_12068 - PLACE
      ?auto_12067 - HOIST
      ?auto_12076 - SURFACE
      ?auto_12069 - TRUCK
      ?auto_12074 - PLACE
      ?auto_12070 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12071 ?auto_12066 ) ( IS-CRATE ?auto_12065 ) ( not ( = ?auto_12064 ?auto_12065 ) ) ( not ( = ?auto_12063 ?auto_12064 ) ) ( not ( = ?auto_12063 ?auto_12065 ) ) ( not ( = ?auto_12072 ?auto_12066 ) ) ( HOIST-AT ?auto_12075 ?auto_12072 ) ( not ( = ?auto_12071 ?auto_12075 ) ) ( AVAILABLE ?auto_12075 ) ( SURFACE-AT ?auto_12065 ?auto_12072 ) ( ON ?auto_12065 ?auto_12073 ) ( CLEAR ?auto_12065 ) ( not ( = ?auto_12064 ?auto_12073 ) ) ( not ( = ?auto_12065 ?auto_12073 ) ) ( not ( = ?auto_12063 ?auto_12073 ) ) ( IS-CRATE ?auto_12064 ) ( not ( = ?auto_12068 ?auto_12066 ) ) ( not ( = ?auto_12072 ?auto_12068 ) ) ( HOIST-AT ?auto_12067 ?auto_12068 ) ( not ( = ?auto_12071 ?auto_12067 ) ) ( not ( = ?auto_12075 ?auto_12067 ) ) ( AVAILABLE ?auto_12067 ) ( SURFACE-AT ?auto_12064 ?auto_12068 ) ( ON ?auto_12064 ?auto_12076 ) ( CLEAR ?auto_12064 ) ( not ( = ?auto_12064 ?auto_12076 ) ) ( not ( = ?auto_12065 ?auto_12076 ) ) ( not ( = ?auto_12063 ?auto_12076 ) ) ( not ( = ?auto_12073 ?auto_12076 ) ) ( SURFACE-AT ?auto_12062 ?auto_12066 ) ( CLEAR ?auto_12062 ) ( IS-CRATE ?auto_12063 ) ( not ( = ?auto_12062 ?auto_12063 ) ) ( not ( = ?auto_12064 ?auto_12062 ) ) ( not ( = ?auto_12065 ?auto_12062 ) ) ( not ( = ?auto_12073 ?auto_12062 ) ) ( not ( = ?auto_12076 ?auto_12062 ) ) ( AVAILABLE ?auto_12071 ) ( TRUCK-AT ?auto_12069 ?auto_12074 ) ( not ( = ?auto_12074 ?auto_12066 ) ) ( not ( = ?auto_12072 ?auto_12074 ) ) ( not ( = ?auto_12068 ?auto_12074 ) ) ( HOIST-AT ?auto_12070 ?auto_12074 ) ( LIFTING ?auto_12070 ?auto_12063 ) ( not ( = ?auto_12071 ?auto_12070 ) ) ( not ( = ?auto_12075 ?auto_12070 ) ) ( not ( = ?auto_12067 ?auto_12070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12063 ?auto_12064 ?auto_12065 )
      ( MAKE-3CRATE-VERIFY ?auto_12062 ?auto_12063 ?auto_12064 ?auto_12065 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12077 - SURFACE
      ?auto_12078 - SURFACE
    )
    :vars
    (
      ?auto_12085 - HOIST
      ?auto_12079 - PLACE
      ?auto_12088 - SURFACE
      ?auto_12086 - PLACE
      ?auto_12090 - HOIST
      ?auto_12087 - SURFACE
      ?auto_12081 - PLACE
      ?auto_12080 - HOIST
      ?auto_12091 - SURFACE
      ?auto_12083 - SURFACE
      ?auto_12082 - TRUCK
      ?auto_12089 - PLACE
      ?auto_12084 - HOIST
      ?auto_12092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12085 ?auto_12079 ) ( IS-CRATE ?auto_12078 ) ( not ( = ?auto_12077 ?auto_12078 ) ) ( not ( = ?auto_12088 ?auto_12077 ) ) ( not ( = ?auto_12088 ?auto_12078 ) ) ( not ( = ?auto_12086 ?auto_12079 ) ) ( HOIST-AT ?auto_12090 ?auto_12086 ) ( not ( = ?auto_12085 ?auto_12090 ) ) ( AVAILABLE ?auto_12090 ) ( SURFACE-AT ?auto_12078 ?auto_12086 ) ( ON ?auto_12078 ?auto_12087 ) ( CLEAR ?auto_12078 ) ( not ( = ?auto_12077 ?auto_12087 ) ) ( not ( = ?auto_12078 ?auto_12087 ) ) ( not ( = ?auto_12088 ?auto_12087 ) ) ( IS-CRATE ?auto_12077 ) ( not ( = ?auto_12081 ?auto_12079 ) ) ( not ( = ?auto_12086 ?auto_12081 ) ) ( HOIST-AT ?auto_12080 ?auto_12081 ) ( not ( = ?auto_12085 ?auto_12080 ) ) ( not ( = ?auto_12090 ?auto_12080 ) ) ( AVAILABLE ?auto_12080 ) ( SURFACE-AT ?auto_12077 ?auto_12081 ) ( ON ?auto_12077 ?auto_12091 ) ( CLEAR ?auto_12077 ) ( not ( = ?auto_12077 ?auto_12091 ) ) ( not ( = ?auto_12078 ?auto_12091 ) ) ( not ( = ?auto_12088 ?auto_12091 ) ) ( not ( = ?auto_12087 ?auto_12091 ) ) ( SURFACE-AT ?auto_12083 ?auto_12079 ) ( CLEAR ?auto_12083 ) ( IS-CRATE ?auto_12088 ) ( not ( = ?auto_12083 ?auto_12088 ) ) ( not ( = ?auto_12077 ?auto_12083 ) ) ( not ( = ?auto_12078 ?auto_12083 ) ) ( not ( = ?auto_12087 ?auto_12083 ) ) ( not ( = ?auto_12091 ?auto_12083 ) ) ( AVAILABLE ?auto_12085 ) ( TRUCK-AT ?auto_12082 ?auto_12089 ) ( not ( = ?auto_12089 ?auto_12079 ) ) ( not ( = ?auto_12086 ?auto_12089 ) ) ( not ( = ?auto_12081 ?auto_12089 ) ) ( HOIST-AT ?auto_12084 ?auto_12089 ) ( not ( = ?auto_12085 ?auto_12084 ) ) ( not ( = ?auto_12090 ?auto_12084 ) ) ( not ( = ?auto_12080 ?auto_12084 ) ) ( AVAILABLE ?auto_12084 ) ( SURFACE-AT ?auto_12088 ?auto_12089 ) ( ON ?auto_12088 ?auto_12092 ) ( CLEAR ?auto_12088 ) ( not ( = ?auto_12077 ?auto_12092 ) ) ( not ( = ?auto_12078 ?auto_12092 ) ) ( not ( = ?auto_12088 ?auto_12092 ) ) ( not ( = ?auto_12087 ?auto_12092 ) ) ( not ( = ?auto_12091 ?auto_12092 ) ) ( not ( = ?auto_12083 ?auto_12092 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12084 ?auto_12088 ?auto_12092 ?auto_12089 )
      ( MAKE-2CRATE ?auto_12088 ?auto_12077 ?auto_12078 )
      ( MAKE-1CRATE-VERIFY ?auto_12077 ?auto_12078 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12093 - SURFACE
      ?auto_12094 - SURFACE
      ?auto_12095 - SURFACE
    )
    :vars
    (
      ?auto_12096 - HOIST
      ?auto_12100 - PLACE
      ?auto_12106 - PLACE
      ?auto_12102 - HOIST
      ?auto_12103 - SURFACE
      ?auto_12098 - PLACE
      ?auto_12099 - HOIST
      ?auto_12107 - SURFACE
      ?auto_12104 - SURFACE
      ?auto_12105 - TRUCK
      ?auto_12097 - PLACE
      ?auto_12108 - HOIST
      ?auto_12101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12096 ?auto_12100 ) ( IS-CRATE ?auto_12095 ) ( not ( = ?auto_12094 ?auto_12095 ) ) ( not ( = ?auto_12093 ?auto_12094 ) ) ( not ( = ?auto_12093 ?auto_12095 ) ) ( not ( = ?auto_12106 ?auto_12100 ) ) ( HOIST-AT ?auto_12102 ?auto_12106 ) ( not ( = ?auto_12096 ?auto_12102 ) ) ( AVAILABLE ?auto_12102 ) ( SURFACE-AT ?auto_12095 ?auto_12106 ) ( ON ?auto_12095 ?auto_12103 ) ( CLEAR ?auto_12095 ) ( not ( = ?auto_12094 ?auto_12103 ) ) ( not ( = ?auto_12095 ?auto_12103 ) ) ( not ( = ?auto_12093 ?auto_12103 ) ) ( IS-CRATE ?auto_12094 ) ( not ( = ?auto_12098 ?auto_12100 ) ) ( not ( = ?auto_12106 ?auto_12098 ) ) ( HOIST-AT ?auto_12099 ?auto_12098 ) ( not ( = ?auto_12096 ?auto_12099 ) ) ( not ( = ?auto_12102 ?auto_12099 ) ) ( AVAILABLE ?auto_12099 ) ( SURFACE-AT ?auto_12094 ?auto_12098 ) ( ON ?auto_12094 ?auto_12107 ) ( CLEAR ?auto_12094 ) ( not ( = ?auto_12094 ?auto_12107 ) ) ( not ( = ?auto_12095 ?auto_12107 ) ) ( not ( = ?auto_12093 ?auto_12107 ) ) ( not ( = ?auto_12103 ?auto_12107 ) ) ( SURFACE-AT ?auto_12104 ?auto_12100 ) ( CLEAR ?auto_12104 ) ( IS-CRATE ?auto_12093 ) ( not ( = ?auto_12104 ?auto_12093 ) ) ( not ( = ?auto_12094 ?auto_12104 ) ) ( not ( = ?auto_12095 ?auto_12104 ) ) ( not ( = ?auto_12103 ?auto_12104 ) ) ( not ( = ?auto_12107 ?auto_12104 ) ) ( AVAILABLE ?auto_12096 ) ( TRUCK-AT ?auto_12105 ?auto_12097 ) ( not ( = ?auto_12097 ?auto_12100 ) ) ( not ( = ?auto_12106 ?auto_12097 ) ) ( not ( = ?auto_12098 ?auto_12097 ) ) ( HOIST-AT ?auto_12108 ?auto_12097 ) ( not ( = ?auto_12096 ?auto_12108 ) ) ( not ( = ?auto_12102 ?auto_12108 ) ) ( not ( = ?auto_12099 ?auto_12108 ) ) ( AVAILABLE ?auto_12108 ) ( SURFACE-AT ?auto_12093 ?auto_12097 ) ( ON ?auto_12093 ?auto_12101 ) ( CLEAR ?auto_12093 ) ( not ( = ?auto_12094 ?auto_12101 ) ) ( not ( = ?auto_12095 ?auto_12101 ) ) ( not ( = ?auto_12093 ?auto_12101 ) ) ( not ( = ?auto_12103 ?auto_12101 ) ) ( not ( = ?auto_12107 ?auto_12101 ) ) ( not ( = ?auto_12104 ?auto_12101 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12094 ?auto_12095 )
      ( MAKE-2CRATE-VERIFY ?auto_12093 ?auto_12094 ?auto_12095 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12109 - SURFACE
      ?auto_12110 - SURFACE
      ?auto_12111 - SURFACE
      ?auto_12112 - SURFACE
    )
    :vars
    (
      ?auto_12118 - HOIST
      ?auto_12124 - PLACE
      ?auto_12122 - PLACE
      ?auto_12114 - HOIST
      ?auto_12121 - SURFACE
      ?auto_12115 - PLACE
      ?auto_12119 - HOIST
      ?auto_12113 - SURFACE
      ?auto_12123 - TRUCK
      ?auto_12117 - PLACE
      ?auto_12116 - HOIST
      ?auto_12120 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12118 ?auto_12124 ) ( IS-CRATE ?auto_12112 ) ( not ( = ?auto_12111 ?auto_12112 ) ) ( not ( = ?auto_12110 ?auto_12111 ) ) ( not ( = ?auto_12110 ?auto_12112 ) ) ( not ( = ?auto_12122 ?auto_12124 ) ) ( HOIST-AT ?auto_12114 ?auto_12122 ) ( not ( = ?auto_12118 ?auto_12114 ) ) ( AVAILABLE ?auto_12114 ) ( SURFACE-AT ?auto_12112 ?auto_12122 ) ( ON ?auto_12112 ?auto_12121 ) ( CLEAR ?auto_12112 ) ( not ( = ?auto_12111 ?auto_12121 ) ) ( not ( = ?auto_12112 ?auto_12121 ) ) ( not ( = ?auto_12110 ?auto_12121 ) ) ( IS-CRATE ?auto_12111 ) ( not ( = ?auto_12115 ?auto_12124 ) ) ( not ( = ?auto_12122 ?auto_12115 ) ) ( HOIST-AT ?auto_12119 ?auto_12115 ) ( not ( = ?auto_12118 ?auto_12119 ) ) ( not ( = ?auto_12114 ?auto_12119 ) ) ( AVAILABLE ?auto_12119 ) ( SURFACE-AT ?auto_12111 ?auto_12115 ) ( ON ?auto_12111 ?auto_12113 ) ( CLEAR ?auto_12111 ) ( not ( = ?auto_12111 ?auto_12113 ) ) ( not ( = ?auto_12112 ?auto_12113 ) ) ( not ( = ?auto_12110 ?auto_12113 ) ) ( not ( = ?auto_12121 ?auto_12113 ) ) ( SURFACE-AT ?auto_12109 ?auto_12124 ) ( CLEAR ?auto_12109 ) ( IS-CRATE ?auto_12110 ) ( not ( = ?auto_12109 ?auto_12110 ) ) ( not ( = ?auto_12111 ?auto_12109 ) ) ( not ( = ?auto_12112 ?auto_12109 ) ) ( not ( = ?auto_12121 ?auto_12109 ) ) ( not ( = ?auto_12113 ?auto_12109 ) ) ( AVAILABLE ?auto_12118 ) ( TRUCK-AT ?auto_12123 ?auto_12117 ) ( not ( = ?auto_12117 ?auto_12124 ) ) ( not ( = ?auto_12122 ?auto_12117 ) ) ( not ( = ?auto_12115 ?auto_12117 ) ) ( HOIST-AT ?auto_12116 ?auto_12117 ) ( not ( = ?auto_12118 ?auto_12116 ) ) ( not ( = ?auto_12114 ?auto_12116 ) ) ( not ( = ?auto_12119 ?auto_12116 ) ) ( AVAILABLE ?auto_12116 ) ( SURFACE-AT ?auto_12110 ?auto_12117 ) ( ON ?auto_12110 ?auto_12120 ) ( CLEAR ?auto_12110 ) ( not ( = ?auto_12111 ?auto_12120 ) ) ( not ( = ?auto_12112 ?auto_12120 ) ) ( not ( = ?auto_12110 ?auto_12120 ) ) ( not ( = ?auto_12121 ?auto_12120 ) ) ( not ( = ?auto_12113 ?auto_12120 ) ) ( not ( = ?auto_12109 ?auto_12120 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12110 ?auto_12111 ?auto_12112 )
      ( MAKE-3CRATE-VERIFY ?auto_12109 ?auto_12110 ?auto_12111 ?auto_12112 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12125 - SURFACE
      ?auto_12126 - SURFACE
    )
    :vars
    (
      ?auto_12132 - HOIST
      ?auto_12139 - PLACE
      ?auto_12140 - SURFACE
      ?auto_12137 - PLACE
      ?auto_12128 - HOIST
      ?auto_12136 - SURFACE
      ?auto_12129 - PLACE
      ?auto_12133 - HOIST
      ?auto_12127 - SURFACE
      ?auto_12135 - SURFACE
      ?auto_12131 - PLACE
      ?auto_12130 - HOIST
      ?auto_12134 - SURFACE
      ?auto_12138 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12132 ?auto_12139 ) ( IS-CRATE ?auto_12126 ) ( not ( = ?auto_12125 ?auto_12126 ) ) ( not ( = ?auto_12140 ?auto_12125 ) ) ( not ( = ?auto_12140 ?auto_12126 ) ) ( not ( = ?auto_12137 ?auto_12139 ) ) ( HOIST-AT ?auto_12128 ?auto_12137 ) ( not ( = ?auto_12132 ?auto_12128 ) ) ( AVAILABLE ?auto_12128 ) ( SURFACE-AT ?auto_12126 ?auto_12137 ) ( ON ?auto_12126 ?auto_12136 ) ( CLEAR ?auto_12126 ) ( not ( = ?auto_12125 ?auto_12136 ) ) ( not ( = ?auto_12126 ?auto_12136 ) ) ( not ( = ?auto_12140 ?auto_12136 ) ) ( IS-CRATE ?auto_12125 ) ( not ( = ?auto_12129 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12129 ) ) ( HOIST-AT ?auto_12133 ?auto_12129 ) ( not ( = ?auto_12132 ?auto_12133 ) ) ( not ( = ?auto_12128 ?auto_12133 ) ) ( AVAILABLE ?auto_12133 ) ( SURFACE-AT ?auto_12125 ?auto_12129 ) ( ON ?auto_12125 ?auto_12127 ) ( CLEAR ?auto_12125 ) ( not ( = ?auto_12125 ?auto_12127 ) ) ( not ( = ?auto_12126 ?auto_12127 ) ) ( not ( = ?auto_12140 ?auto_12127 ) ) ( not ( = ?auto_12136 ?auto_12127 ) ) ( SURFACE-AT ?auto_12135 ?auto_12139 ) ( CLEAR ?auto_12135 ) ( IS-CRATE ?auto_12140 ) ( not ( = ?auto_12135 ?auto_12140 ) ) ( not ( = ?auto_12125 ?auto_12135 ) ) ( not ( = ?auto_12126 ?auto_12135 ) ) ( not ( = ?auto_12136 ?auto_12135 ) ) ( not ( = ?auto_12127 ?auto_12135 ) ) ( AVAILABLE ?auto_12132 ) ( not ( = ?auto_12131 ?auto_12139 ) ) ( not ( = ?auto_12137 ?auto_12131 ) ) ( not ( = ?auto_12129 ?auto_12131 ) ) ( HOIST-AT ?auto_12130 ?auto_12131 ) ( not ( = ?auto_12132 ?auto_12130 ) ) ( not ( = ?auto_12128 ?auto_12130 ) ) ( not ( = ?auto_12133 ?auto_12130 ) ) ( AVAILABLE ?auto_12130 ) ( SURFACE-AT ?auto_12140 ?auto_12131 ) ( ON ?auto_12140 ?auto_12134 ) ( CLEAR ?auto_12140 ) ( not ( = ?auto_12125 ?auto_12134 ) ) ( not ( = ?auto_12126 ?auto_12134 ) ) ( not ( = ?auto_12140 ?auto_12134 ) ) ( not ( = ?auto_12136 ?auto_12134 ) ) ( not ( = ?auto_12127 ?auto_12134 ) ) ( not ( = ?auto_12135 ?auto_12134 ) ) ( TRUCK-AT ?auto_12138 ?auto_12139 ) )
    :subtasks
    ( ( !DRIVE ?auto_12138 ?auto_12139 ?auto_12131 )
      ( MAKE-2CRATE ?auto_12140 ?auto_12125 ?auto_12126 )
      ( MAKE-1CRATE-VERIFY ?auto_12125 ?auto_12126 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12141 - SURFACE
      ?auto_12142 - SURFACE
      ?auto_12143 - SURFACE
    )
    :vars
    (
      ?auto_12149 - HOIST
      ?auto_12148 - PLACE
      ?auto_12154 - PLACE
      ?auto_12145 - HOIST
      ?auto_12152 - SURFACE
      ?auto_12151 - PLACE
      ?auto_12155 - HOIST
      ?auto_12150 - SURFACE
      ?auto_12147 - SURFACE
      ?auto_12146 - PLACE
      ?auto_12144 - HOIST
      ?auto_12156 - SURFACE
      ?auto_12153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12149 ?auto_12148 ) ( IS-CRATE ?auto_12143 ) ( not ( = ?auto_12142 ?auto_12143 ) ) ( not ( = ?auto_12141 ?auto_12142 ) ) ( not ( = ?auto_12141 ?auto_12143 ) ) ( not ( = ?auto_12154 ?auto_12148 ) ) ( HOIST-AT ?auto_12145 ?auto_12154 ) ( not ( = ?auto_12149 ?auto_12145 ) ) ( AVAILABLE ?auto_12145 ) ( SURFACE-AT ?auto_12143 ?auto_12154 ) ( ON ?auto_12143 ?auto_12152 ) ( CLEAR ?auto_12143 ) ( not ( = ?auto_12142 ?auto_12152 ) ) ( not ( = ?auto_12143 ?auto_12152 ) ) ( not ( = ?auto_12141 ?auto_12152 ) ) ( IS-CRATE ?auto_12142 ) ( not ( = ?auto_12151 ?auto_12148 ) ) ( not ( = ?auto_12154 ?auto_12151 ) ) ( HOIST-AT ?auto_12155 ?auto_12151 ) ( not ( = ?auto_12149 ?auto_12155 ) ) ( not ( = ?auto_12145 ?auto_12155 ) ) ( AVAILABLE ?auto_12155 ) ( SURFACE-AT ?auto_12142 ?auto_12151 ) ( ON ?auto_12142 ?auto_12150 ) ( CLEAR ?auto_12142 ) ( not ( = ?auto_12142 ?auto_12150 ) ) ( not ( = ?auto_12143 ?auto_12150 ) ) ( not ( = ?auto_12141 ?auto_12150 ) ) ( not ( = ?auto_12152 ?auto_12150 ) ) ( SURFACE-AT ?auto_12147 ?auto_12148 ) ( CLEAR ?auto_12147 ) ( IS-CRATE ?auto_12141 ) ( not ( = ?auto_12147 ?auto_12141 ) ) ( not ( = ?auto_12142 ?auto_12147 ) ) ( not ( = ?auto_12143 ?auto_12147 ) ) ( not ( = ?auto_12152 ?auto_12147 ) ) ( not ( = ?auto_12150 ?auto_12147 ) ) ( AVAILABLE ?auto_12149 ) ( not ( = ?auto_12146 ?auto_12148 ) ) ( not ( = ?auto_12154 ?auto_12146 ) ) ( not ( = ?auto_12151 ?auto_12146 ) ) ( HOIST-AT ?auto_12144 ?auto_12146 ) ( not ( = ?auto_12149 ?auto_12144 ) ) ( not ( = ?auto_12145 ?auto_12144 ) ) ( not ( = ?auto_12155 ?auto_12144 ) ) ( AVAILABLE ?auto_12144 ) ( SURFACE-AT ?auto_12141 ?auto_12146 ) ( ON ?auto_12141 ?auto_12156 ) ( CLEAR ?auto_12141 ) ( not ( = ?auto_12142 ?auto_12156 ) ) ( not ( = ?auto_12143 ?auto_12156 ) ) ( not ( = ?auto_12141 ?auto_12156 ) ) ( not ( = ?auto_12152 ?auto_12156 ) ) ( not ( = ?auto_12150 ?auto_12156 ) ) ( not ( = ?auto_12147 ?auto_12156 ) ) ( TRUCK-AT ?auto_12153 ?auto_12148 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12142 ?auto_12143 )
      ( MAKE-2CRATE-VERIFY ?auto_12141 ?auto_12142 ?auto_12143 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12157 - SURFACE
      ?auto_12158 - SURFACE
      ?auto_12159 - SURFACE
      ?auto_12160 - SURFACE
    )
    :vars
    (
      ?auto_12171 - HOIST
      ?auto_12170 - PLACE
      ?auto_12167 - PLACE
      ?auto_12165 - HOIST
      ?auto_12166 - SURFACE
      ?auto_12169 - PLACE
      ?auto_12162 - HOIST
      ?auto_12164 - SURFACE
      ?auto_12161 - PLACE
      ?auto_12163 - HOIST
      ?auto_12172 - SURFACE
      ?auto_12168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12171 ?auto_12170 ) ( IS-CRATE ?auto_12160 ) ( not ( = ?auto_12159 ?auto_12160 ) ) ( not ( = ?auto_12158 ?auto_12159 ) ) ( not ( = ?auto_12158 ?auto_12160 ) ) ( not ( = ?auto_12167 ?auto_12170 ) ) ( HOIST-AT ?auto_12165 ?auto_12167 ) ( not ( = ?auto_12171 ?auto_12165 ) ) ( AVAILABLE ?auto_12165 ) ( SURFACE-AT ?auto_12160 ?auto_12167 ) ( ON ?auto_12160 ?auto_12166 ) ( CLEAR ?auto_12160 ) ( not ( = ?auto_12159 ?auto_12166 ) ) ( not ( = ?auto_12160 ?auto_12166 ) ) ( not ( = ?auto_12158 ?auto_12166 ) ) ( IS-CRATE ?auto_12159 ) ( not ( = ?auto_12169 ?auto_12170 ) ) ( not ( = ?auto_12167 ?auto_12169 ) ) ( HOIST-AT ?auto_12162 ?auto_12169 ) ( not ( = ?auto_12171 ?auto_12162 ) ) ( not ( = ?auto_12165 ?auto_12162 ) ) ( AVAILABLE ?auto_12162 ) ( SURFACE-AT ?auto_12159 ?auto_12169 ) ( ON ?auto_12159 ?auto_12164 ) ( CLEAR ?auto_12159 ) ( not ( = ?auto_12159 ?auto_12164 ) ) ( not ( = ?auto_12160 ?auto_12164 ) ) ( not ( = ?auto_12158 ?auto_12164 ) ) ( not ( = ?auto_12166 ?auto_12164 ) ) ( SURFACE-AT ?auto_12157 ?auto_12170 ) ( CLEAR ?auto_12157 ) ( IS-CRATE ?auto_12158 ) ( not ( = ?auto_12157 ?auto_12158 ) ) ( not ( = ?auto_12159 ?auto_12157 ) ) ( not ( = ?auto_12160 ?auto_12157 ) ) ( not ( = ?auto_12166 ?auto_12157 ) ) ( not ( = ?auto_12164 ?auto_12157 ) ) ( AVAILABLE ?auto_12171 ) ( not ( = ?auto_12161 ?auto_12170 ) ) ( not ( = ?auto_12167 ?auto_12161 ) ) ( not ( = ?auto_12169 ?auto_12161 ) ) ( HOIST-AT ?auto_12163 ?auto_12161 ) ( not ( = ?auto_12171 ?auto_12163 ) ) ( not ( = ?auto_12165 ?auto_12163 ) ) ( not ( = ?auto_12162 ?auto_12163 ) ) ( AVAILABLE ?auto_12163 ) ( SURFACE-AT ?auto_12158 ?auto_12161 ) ( ON ?auto_12158 ?auto_12172 ) ( CLEAR ?auto_12158 ) ( not ( = ?auto_12159 ?auto_12172 ) ) ( not ( = ?auto_12160 ?auto_12172 ) ) ( not ( = ?auto_12158 ?auto_12172 ) ) ( not ( = ?auto_12166 ?auto_12172 ) ) ( not ( = ?auto_12164 ?auto_12172 ) ) ( not ( = ?auto_12157 ?auto_12172 ) ) ( TRUCK-AT ?auto_12168 ?auto_12170 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12158 ?auto_12159 ?auto_12160 )
      ( MAKE-3CRATE-VERIFY ?auto_12157 ?auto_12158 ?auto_12159 ?auto_12160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12187 - SURFACE
      ?auto_12188 - SURFACE
    )
    :vars
    (
      ?auto_12189 - HOIST
      ?auto_12190 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12189 ?auto_12190 ) ( SURFACE-AT ?auto_12187 ?auto_12190 ) ( CLEAR ?auto_12187 ) ( LIFTING ?auto_12189 ?auto_12188 ) ( IS-CRATE ?auto_12188 ) ( not ( = ?auto_12187 ?auto_12188 ) ) )
    :subtasks
    ( ( !DROP ?auto_12189 ?auto_12188 ?auto_12187 ?auto_12190 )
      ( MAKE-1CRATE-VERIFY ?auto_12187 ?auto_12188 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12191 - SURFACE
      ?auto_12192 - SURFACE
      ?auto_12193 - SURFACE
    )
    :vars
    (
      ?auto_12195 - HOIST
      ?auto_12194 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12195 ?auto_12194 ) ( SURFACE-AT ?auto_12192 ?auto_12194 ) ( CLEAR ?auto_12192 ) ( LIFTING ?auto_12195 ?auto_12193 ) ( IS-CRATE ?auto_12193 ) ( not ( = ?auto_12192 ?auto_12193 ) ) ( ON ?auto_12192 ?auto_12191 ) ( not ( = ?auto_12191 ?auto_12192 ) ) ( not ( = ?auto_12191 ?auto_12193 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12192 ?auto_12193 )
      ( MAKE-2CRATE-VERIFY ?auto_12191 ?auto_12192 ?auto_12193 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12196 - SURFACE
      ?auto_12197 - SURFACE
      ?auto_12198 - SURFACE
      ?auto_12199 - SURFACE
    )
    :vars
    (
      ?auto_12201 - HOIST
      ?auto_12200 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12201 ?auto_12200 ) ( SURFACE-AT ?auto_12198 ?auto_12200 ) ( CLEAR ?auto_12198 ) ( LIFTING ?auto_12201 ?auto_12199 ) ( IS-CRATE ?auto_12199 ) ( not ( = ?auto_12198 ?auto_12199 ) ) ( ON ?auto_12197 ?auto_12196 ) ( ON ?auto_12198 ?auto_12197 ) ( not ( = ?auto_12196 ?auto_12197 ) ) ( not ( = ?auto_12196 ?auto_12198 ) ) ( not ( = ?auto_12196 ?auto_12199 ) ) ( not ( = ?auto_12197 ?auto_12198 ) ) ( not ( = ?auto_12197 ?auto_12199 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12198 ?auto_12199 )
      ( MAKE-3CRATE-VERIFY ?auto_12196 ?auto_12197 ?auto_12198 ?auto_12199 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12202 - SURFACE
      ?auto_12203 - SURFACE
      ?auto_12204 - SURFACE
      ?auto_12205 - SURFACE
      ?auto_12206 - SURFACE
    )
    :vars
    (
      ?auto_12208 - HOIST
      ?auto_12207 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12208 ?auto_12207 ) ( SURFACE-AT ?auto_12205 ?auto_12207 ) ( CLEAR ?auto_12205 ) ( LIFTING ?auto_12208 ?auto_12206 ) ( IS-CRATE ?auto_12206 ) ( not ( = ?auto_12205 ?auto_12206 ) ) ( ON ?auto_12203 ?auto_12202 ) ( ON ?auto_12204 ?auto_12203 ) ( ON ?auto_12205 ?auto_12204 ) ( not ( = ?auto_12202 ?auto_12203 ) ) ( not ( = ?auto_12202 ?auto_12204 ) ) ( not ( = ?auto_12202 ?auto_12205 ) ) ( not ( = ?auto_12202 ?auto_12206 ) ) ( not ( = ?auto_12203 ?auto_12204 ) ) ( not ( = ?auto_12203 ?auto_12205 ) ) ( not ( = ?auto_12203 ?auto_12206 ) ) ( not ( = ?auto_12204 ?auto_12205 ) ) ( not ( = ?auto_12204 ?auto_12206 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12205 ?auto_12206 )
      ( MAKE-4CRATE-VERIFY ?auto_12202 ?auto_12203 ?auto_12204 ?auto_12205 ?auto_12206 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12209 - SURFACE
      ?auto_12210 - SURFACE
    )
    :vars
    (
      ?auto_12212 - HOIST
      ?auto_12211 - PLACE
      ?auto_12213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12212 ?auto_12211 ) ( SURFACE-AT ?auto_12209 ?auto_12211 ) ( CLEAR ?auto_12209 ) ( IS-CRATE ?auto_12210 ) ( not ( = ?auto_12209 ?auto_12210 ) ) ( TRUCK-AT ?auto_12213 ?auto_12211 ) ( AVAILABLE ?auto_12212 ) ( IN ?auto_12210 ?auto_12213 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12212 ?auto_12210 ?auto_12213 ?auto_12211 )
      ( MAKE-1CRATE ?auto_12209 ?auto_12210 )
      ( MAKE-1CRATE-VERIFY ?auto_12209 ?auto_12210 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12214 - SURFACE
      ?auto_12215 - SURFACE
      ?auto_12216 - SURFACE
    )
    :vars
    (
      ?auto_12219 - HOIST
      ?auto_12217 - PLACE
      ?auto_12218 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12219 ?auto_12217 ) ( SURFACE-AT ?auto_12215 ?auto_12217 ) ( CLEAR ?auto_12215 ) ( IS-CRATE ?auto_12216 ) ( not ( = ?auto_12215 ?auto_12216 ) ) ( TRUCK-AT ?auto_12218 ?auto_12217 ) ( AVAILABLE ?auto_12219 ) ( IN ?auto_12216 ?auto_12218 ) ( ON ?auto_12215 ?auto_12214 ) ( not ( = ?auto_12214 ?auto_12215 ) ) ( not ( = ?auto_12214 ?auto_12216 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12215 ?auto_12216 )
      ( MAKE-2CRATE-VERIFY ?auto_12214 ?auto_12215 ?auto_12216 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12220 - SURFACE
      ?auto_12221 - SURFACE
      ?auto_12222 - SURFACE
      ?auto_12223 - SURFACE
    )
    :vars
    (
      ?auto_12224 - HOIST
      ?auto_12225 - PLACE
      ?auto_12226 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12224 ?auto_12225 ) ( SURFACE-AT ?auto_12222 ?auto_12225 ) ( CLEAR ?auto_12222 ) ( IS-CRATE ?auto_12223 ) ( not ( = ?auto_12222 ?auto_12223 ) ) ( TRUCK-AT ?auto_12226 ?auto_12225 ) ( AVAILABLE ?auto_12224 ) ( IN ?auto_12223 ?auto_12226 ) ( ON ?auto_12222 ?auto_12221 ) ( not ( = ?auto_12221 ?auto_12222 ) ) ( not ( = ?auto_12221 ?auto_12223 ) ) ( ON ?auto_12221 ?auto_12220 ) ( not ( = ?auto_12220 ?auto_12221 ) ) ( not ( = ?auto_12220 ?auto_12222 ) ) ( not ( = ?auto_12220 ?auto_12223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12221 ?auto_12222 ?auto_12223 )
      ( MAKE-3CRATE-VERIFY ?auto_12220 ?auto_12221 ?auto_12222 ?auto_12223 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12227 - SURFACE
      ?auto_12228 - SURFACE
      ?auto_12229 - SURFACE
      ?auto_12230 - SURFACE
      ?auto_12231 - SURFACE
    )
    :vars
    (
      ?auto_12232 - HOIST
      ?auto_12233 - PLACE
      ?auto_12234 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12232 ?auto_12233 ) ( SURFACE-AT ?auto_12230 ?auto_12233 ) ( CLEAR ?auto_12230 ) ( IS-CRATE ?auto_12231 ) ( not ( = ?auto_12230 ?auto_12231 ) ) ( TRUCK-AT ?auto_12234 ?auto_12233 ) ( AVAILABLE ?auto_12232 ) ( IN ?auto_12231 ?auto_12234 ) ( ON ?auto_12230 ?auto_12229 ) ( not ( = ?auto_12229 ?auto_12230 ) ) ( not ( = ?auto_12229 ?auto_12231 ) ) ( ON ?auto_12228 ?auto_12227 ) ( ON ?auto_12229 ?auto_12228 ) ( not ( = ?auto_12227 ?auto_12228 ) ) ( not ( = ?auto_12227 ?auto_12229 ) ) ( not ( = ?auto_12227 ?auto_12230 ) ) ( not ( = ?auto_12227 ?auto_12231 ) ) ( not ( = ?auto_12228 ?auto_12229 ) ) ( not ( = ?auto_12228 ?auto_12230 ) ) ( not ( = ?auto_12228 ?auto_12231 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12229 ?auto_12230 ?auto_12231 )
      ( MAKE-4CRATE-VERIFY ?auto_12227 ?auto_12228 ?auto_12229 ?auto_12230 ?auto_12231 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12235 - SURFACE
      ?auto_12236 - SURFACE
    )
    :vars
    (
      ?auto_12238 - HOIST
      ?auto_12239 - PLACE
      ?auto_12240 - TRUCK
      ?auto_12237 - SURFACE
      ?auto_12241 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12238 ?auto_12239 ) ( SURFACE-AT ?auto_12235 ?auto_12239 ) ( CLEAR ?auto_12235 ) ( IS-CRATE ?auto_12236 ) ( not ( = ?auto_12235 ?auto_12236 ) ) ( AVAILABLE ?auto_12238 ) ( IN ?auto_12236 ?auto_12240 ) ( ON ?auto_12235 ?auto_12237 ) ( not ( = ?auto_12237 ?auto_12235 ) ) ( not ( = ?auto_12237 ?auto_12236 ) ) ( TRUCK-AT ?auto_12240 ?auto_12241 ) ( not ( = ?auto_12241 ?auto_12239 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12240 ?auto_12241 ?auto_12239 )
      ( MAKE-2CRATE ?auto_12237 ?auto_12235 ?auto_12236 )
      ( MAKE-1CRATE-VERIFY ?auto_12235 ?auto_12236 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12242 - SURFACE
      ?auto_12243 - SURFACE
      ?auto_12244 - SURFACE
    )
    :vars
    (
      ?auto_12247 - HOIST
      ?auto_12246 - PLACE
      ?auto_12248 - TRUCK
      ?auto_12245 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12247 ?auto_12246 ) ( SURFACE-AT ?auto_12243 ?auto_12246 ) ( CLEAR ?auto_12243 ) ( IS-CRATE ?auto_12244 ) ( not ( = ?auto_12243 ?auto_12244 ) ) ( AVAILABLE ?auto_12247 ) ( IN ?auto_12244 ?auto_12248 ) ( ON ?auto_12243 ?auto_12242 ) ( not ( = ?auto_12242 ?auto_12243 ) ) ( not ( = ?auto_12242 ?auto_12244 ) ) ( TRUCK-AT ?auto_12248 ?auto_12245 ) ( not ( = ?auto_12245 ?auto_12246 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12243 ?auto_12244 )
      ( MAKE-2CRATE-VERIFY ?auto_12242 ?auto_12243 ?auto_12244 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12249 - SURFACE
      ?auto_12250 - SURFACE
      ?auto_12251 - SURFACE
      ?auto_12252 - SURFACE
    )
    :vars
    (
      ?auto_12254 - HOIST
      ?auto_12253 - PLACE
      ?auto_12256 - TRUCK
      ?auto_12255 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12254 ?auto_12253 ) ( SURFACE-AT ?auto_12251 ?auto_12253 ) ( CLEAR ?auto_12251 ) ( IS-CRATE ?auto_12252 ) ( not ( = ?auto_12251 ?auto_12252 ) ) ( AVAILABLE ?auto_12254 ) ( IN ?auto_12252 ?auto_12256 ) ( ON ?auto_12251 ?auto_12250 ) ( not ( = ?auto_12250 ?auto_12251 ) ) ( not ( = ?auto_12250 ?auto_12252 ) ) ( TRUCK-AT ?auto_12256 ?auto_12255 ) ( not ( = ?auto_12255 ?auto_12253 ) ) ( ON ?auto_12250 ?auto_12249 ) ( not ( = ?auto_12249 ?auto_12250 ) ) ( not ( = ?auto_12249 ?auto_12251 ) ) ( not ( = ?auto_12249 ?auto_12252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12250 ?auto_12251 ?auto_12252 )
      ( MAKE-3CRATE-VERIFY ?auto_12249 ?auto_12250 ?auto_12251 ?auto_12252 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12257 - SURFACE
      ?auto_12258 - SURFACE
      ?auto_12259 - SURFACE
      ?auto_12260 - SURFACE
      ?auto_12261 - SURFACE
    )
    :vars
    (
      ?auto_12263 - HOIST
      ?auto_12262 - PLACE
      ?auto_12265 - TRUCK
      ?auto_12264 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12263 ?auto_12262 ) ( SURFACE-AT ?auto_12260 ?auto_12262 ) ( CLEAR ?auto_12260 ) ( IS-CRATE ?auto_12261 ) ( not ( = ?auto_12260 ?auto_12261 ) ) ( AVAILABLE ?auto_12263 ) ( IN ?auto_12261 ?auto_12265 ) ( ON ?auto_12260 ?auto_12259 ) ( not ( = ?auto_12259 ?auto_12260 ) ) ( not ( = ?auto_12259 ?auto_12261 ) ) ( TRUCK-AT ?auto_12265 ?auto_12264 ) ( not ( = ?auto_12264 ?auto_12262 ) ) ( ON ?auto_12258 ?auto_12257 ) ( ON ?auto_12259 ?auto_12258 ) ( not ( = ?auto_12257 ?auto_12258 ) ) ( not ( = ?auto_12257 ?auto_12259 ) ) ( not ( = ?auto_12257 ?auto_12260 ) ) ( not ( = ?auto_12257 ?auto_12261 ) ) ( not ( = ?auto_12258 ?auto_12259 ) ) ( not ( = ?auto_12258 ?auto_12260 ) ) ( not ( = ?auto_12258 ?auto_12261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12259 ?auto_12260 ?auto_12261 )
      ( MAKE-4CRATE-VERIFY ?auto_12257 ?auto_12258 ?auto_12259 ?auto_12260 ?auto_12261 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12266 - SURFACE
      ?auto_12267 - SURFACE
    )
    :vars
    (
      ?auto_12269 - HOIST
      ?auto_12268 - PLACE
      ?auto_12270 - SURFACE
      ?auto_12272 - TRUCK
      ?auto_12271 - PLACE
      ?auto_12273 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12269 ?auto_12268 ) ( SURFACE-AT ?auto_12266 ?auto_12268 ) ( CLEAR ?auto_12266 ) ( IS-CRATE ?auto_12267 ) ( not ( = ?auto_12266 ?auto_12267 ) ) ( AVAILABLE ?auto_12269 ) ( ON ?auto_12266 ?auto_12270 ) ( not ( = ?auto_12270 ?auto_12266 ) ) ( not ( = ?auto_12270 ?auto_12267 ) ) ( TRUCK-AT ?auto_12272 ?auto_12271 ) ( not ( = ?auto_12271 ?auto_12268 ) ) ( HOIST-AT ?auto_12273 ?auto_12271 ) ( LIFTING ?auto_12273 ?auto_12267 ) ( not ( = ?auto_12269 ?auto_12273 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12273 ?auto_12267 ?auto_12272 ?auto_12271 )
      ( MAKE-2CRATE ?auto_12270 ?auto_12266 ?auto_12267 )
      ( MAKE-1CRATE-VERIFY ?auto_12266 ?auto_12267 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12274 - SURFACE
      ?auto_12275 - SURFACE
      ?auto_12276 - SURFACE
    )
    :vars
    (
      ?auto_12277 - HOIST
      ?auto_12280 - PLACE
      ?auto_12279 - TRUCK
      ?auto_12281 - PLACE
      ?auto_12278 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12277 ?auto_12280 ) ( SURFACE-AT ?auto_12275 ?auto_12280 ) ( CLEAR ?auto_12275 ) ( IS-CRATE ?auto_12276 ) ( not ( = ?auto_12275 ?auto_12276 ) ) ( AVAILABLE ?auto_12277 ) ( ON ?auto_12275 ?auto_12274 ) ( not ( = ?auto_12274 ?auto_12275 ) ) ( not ( = ?auto_12274 ?auto_12276 ) ) ( TRUCK-AT ?auto_12279 ?auto_12281 ) ( not ( = ?auto_12281 ?auto_12280 ) ) ( HOIST-AT ?auto_12278 ?auto_12281 ) ( LIFTING ?auto_12278 ?auto_12276 ) ( not ( = ?auto_12277 ?auto_12278 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12275 ?auto_12276 )
      ( MAKE-2CRATE-VERIFY ?auto_12274 ?auto_12275 ?auto_12276 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12282 - SURFACE
      ?auto_12283 - SURFACE
      ?auto_12284 - SURFACE
      ?auto_12285 - SURFACE
    )
    :vars
    (
      ?auto_12290 - HOIST
      ?auto_12286 - PLACE
      ?auto_12288 - TRUCK
      ?auto_12289 - PLACE
      ?auto_12287 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12290 ?auto_12286 ) ( SURFACE-AT ?auto_12284 ?auto_12286 ) ( CLEAR ?auto_12284 ) ( IS-CRATE ?auto_12285 ) ( not ( = ?auto_12284 ?auto_12285 ) ) ( AVAILABLE ?auto_12290 ) ( ON ?auto_12284 ?auto_12283 ) ( not ( = ?auto_12283 ?auto_12284 ) ) ( not ( = ?auto_12283 ?auto_12285 ) ) ( TRUCK-AT ?auto_12288 ?auto_12289 ) ( not ( = ?auto_12289 ?auto_12286 ) ) ( HOIST-AT ?auto_12287 ?auto_12289 ) ( LIFTING ?auto_12287 ?auto_12285 ) ( not ( = ?auto_12290 ?auto_12287 ) ) ( ON ?auto_12283 ?auto_12282 ) ( not ( = ?auto_12282 ?auto_12283 ) ) ( not ( = ?auto_12282 ?auto_12284 ) ) ( not ( = ?auto_12282 ?auto_12285 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12283 ?auto_12284 ?auto_12285 )
      ( MAKE-3CRATE-VERIFY ?auto_12282 ?auto_12283 ?auto_12284 ?auto_12285 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12291 - SURFACE
      ?auto_12292 - SURFACE
      ?auto_12293 - SURFACE
      ?auto_12294 - SURFACE
      ?auto_12295 - SURFACE
    )
    :vars
    (
      ?auto_12300 - HOIST
      ?auto_12296 - PLACE
      ?auto_12298 - TRUCK
      ?auto_12299 - PLACE
      ?auto_12297 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12300 ?auto_12296 ) ( SURFACE-AT ?auto_12294 ?auto_12296 ) ( CLEAR ?auto_12294 ) ( IS-CRATE ?auto_12295 ) ( not ( = ?auto_12294 ?auto_12295 ) ) ( AVAILABLE ?auto_12300 ) ( ON ?auto_12294 ?auto_12293 ) ( not ( = ?auto_12293 ?auto_12294 ) ) ( not ( = ?auto_12293 ?auto_12295 ) ) ( TRUCK-AT ?auto_12298 ?auto_12299 ) ( not ( = ?auto_12299 ?auto_12296 ) ) ( HOIST-AT ?auto_12297 ?auto_12299 ) ( LIFTING ?auto_12297 ?auto_12295 ) ( not ( = ?auto_12300 ?auto_12297 ) ) ( ON ?auto_12292 ?auto_12291 ) ( ON ?auto_12293 ?auto_12292 ) ( not ( = ?auto_12291 ?auto_12292 ) ) ( not ( = ?auto_12291 ?auto_12293 ) ) ( not ( = ?auto_12291 ?auto_12294 ) ) ( not ( = ?auto_12291 ?auto_12295 ) ) ( not ( = ?auto_12292 ?auto_12293 ) ) ( not ( = ?auto_12292 ?auto_12294 ) ) ( not ( = ?auto_12292 ?auto_12295 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12293 ?auto_12294 ?auto_12295 )
      ( MAKE-4CRATE-VERIFY ?auto_12291 ?auto_12292 ?auto_12293 ?auto_12294 ?auto_12295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12301 - SURFACE
      ?auto_12302 - SURFACE
    )
    :vars
    (
      ?auto_12307 - HOIST
      ?auto_12303 - PLACE
      ?auto_12308 - SURFACE
      ?auto_12305 - TRUCK
      ?auto_12306 - PLACE
      ?auto_12304 - HOIST
      ?auto_12309 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12307 ?auto_12303 ) ( SURFACE-AT ?auto_12301 ?auto_12303 ) ( CLEAR ?auto_12301 ) ( IS-CRATE ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12302 ) ) ( AVAILABLE ?auto_12307 ) ( ON ?auto_12301 ?auto_12308 ) ( not ( = ?auto_12308 ?auto_12301 ) ) ( not ( = ?auto_12308 ?auto_12302 ) ) ( TRUCK-AT ?auto_12305 ?auto_12306 ) ( not ( = ?auto_12306 ?auto_12303 ) ) ( HOIST-AT ?auto_12304 ?auto_12306 ) ( not ( = ?auto_12307 ?auto_12304 ) ) ( AVAILABLE ?auto_12304 ) ( SURFACE-AT ?auto_12302 ?auto_12306 ) ( ON ?auto_12302 ?auto_12309 ) ( CLEAR ?auto_12302 ) ( not ( = ?auto_12301 ?auto_12309 ) ) ( not ( = ?auto_12302 ?auto_12309 ) ) ( not ( = ?auto_12308 ?auto_12309 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12304 ?auto_12302 ?auto_12309 ?auto_12306 )
      ( MAKE-2CRATE ?auto_12308 ?auto_12301 ?auto_12302 )
      ( MAKE-1CRATE-VERIFY ?auto_12301 ?auto_12302 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12310 - SURFACE
      ?auto_12311 - SURFACE
      ?auto_12312 - SURFACE
    )
    :vars
    (
      ?auto_12313 - HOIST
      ?auto_12317 - PLACE
      ?auto_12318 - TRUCK
      ?auto_12315 - PLACE
      ?auto_12314 - HOIST
      ?auto_12316 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12313 ?auto_12317 ) ( SURFACE-AT ?auto_12311 ?auto_12317 ) ( CLEAR ?auto_12311 ) ( IS-CRATE ?auto_12312 ) ( not ( = ?auto_12311 ?auto_12312 ) ) ( AVAILABLE ?auto_12313 ) ( ON ?auto_12311 ?auto_12310 ) ( not ( = ?auto_12310 ?auto_12311 ) ) ( not ( = ?auto_12310 ?auto_12312 ) ) ( TRUCK-AT ?auto_12318 ?auto_12315 ) ( not ( = ?auto_12315 ?auto_12317 ) ) ( HOIST-AT ?auto_12314 ?auto_12315 ) ( not ( = ?auto_12313 ?auto_12314 ) ) ( AVAILABLE ?auto_12314 ) ( SURFACE-AT ?auto_12312 ?auto_12315 ) ( ON ?auto_12312 ?auto_12316 ) ( CLEAR ?auto_12312 ) ( not ( = ?auto_12311 ?auto_12316 ) ) ( not ( = ?auto_12312 ?auto_12316 ) ) ( not ( = ?auto_12310 ?auto_12316 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12311 ?auto_12312 )
      ( MAKE-2CRATE-VERIFY ?auto_12310 ?auto_12311 ?auto_12312 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12319 - SURFACE
      ?auto_12320 - SURFACE
      ?auto_12321 - SURFACE
      ?auto_12322 - SURFACE
    )
    :vars
    (
      ?auto_12323 - HOIST
      ?auto_12328 - PLACE
      ?auto_12325 - TRUCK
      ?auto_12324 - PLACE
      ?auto_12326 - HOIST
      ?auto_12327 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12323 ?auto_12328 ) ( SURFACE-AT ?auto_12321 ?auto_12328 ) ( CLEAR ?auto_12321 ) ( IS-CRATE ?auto_12322 ) ( not ( = ?auto_12321 ?auto_12322 ) ) ( AVAILABLE ?auto_12323 ) ( ON ?auto_12321 ?auto_12320 ) ( not ( = ?auto_12320 ?auto_12321 ) ) ( not ( = ?auto_12320 ?auto_12322 ) ) ( TRUCK-AT ?auto_12325 ?auto_12324 ) ( not ( = ?auto_12324 ?auto_12328 ) ) ( HOIST-AT ?auto_12326 ?auto_12324 ) ( not ( = ?auto_12323 ?auto_12326 ) ) ( AVAILABLE ?auto_12326 ) ( SURFACE-AT ?auto_12322 ?auto_12324 ) ( ON ?auto_12322 ?auto_12327 ) ( CLEAR ?auto_12322 ) ( not ( = ?auto_12321 ?auto_12327 ) ) ( not ( = ?auto_12322 ?auto_12327 ) ) ( not ( = ?auto_12320 ?auto_12327 ) ) ( ON ?auto_12320 ?auto_12319 ) ( not ( = ?auto_12319 ?auto_12320 ) ) ( not ( = ?auto_12319 ?auto_12321 ) ) ( not ( = ?auto_12319 ?auto_12322 ) ) ( not ( = ?auto_12319 ?auto_12327 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12320 ?auto_12321 ?auto_12322 )
      ( MAKE-3CRATE-VERIFY ?auto_12319 ?auto_12320 ?auto_12321 ?auto_12322 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12329 - SURFACE
      ?auto_12330 - SURFACE
      ?auto_12331 - SURFACE
      ?auto_12332 - SURFACE
      ?auto_12333 - SURFACE
    )
    :vars
    (
      ?auto_12334 - HOIST
      ?auto_12339 - PLACE
      ?auto_12336 - TRUCK
      ?auto_12335 - PLACE
      ?auto_12337 - HOIST
      ?auto_12338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12334 ?auto_12339 ) ( SURFACE-AT ?auto_12332 ?auto_12339 ) ( CLEAR ?auto_12332 ) ( IS-CRATE ?auto_12333 ) ( not ( = ?auto_12332 ?auto_12333 ) ) ( AVAILABLE ?auto_12334 ) ( ON ?auto_12332 ?auto_12331 ) ( not ( = ?auto_12331 ?auto_12332 ) ) ( not ( = ?auto_12331 ?auto_12333 ) ) ( TRUCK-AT ?auto_12336 ?auto_12335 ) ( not ( = ?auto_12335 ?auto_12339 ) ) ( HOIST-AT ?auto_12337 ?auto_12335 ) ( not ( = ?auto_12334 ?auto_12337 ) ) ( AVAILABLE ?auto_12337 ) ( SURFACE-AT ?auto_12333 ?auto_12335 ) ( ON ?auto_12333 ?auto_12338 ) ( CLEAR ?auto_12333 ) ( not ( = ?auto_12332 ?auto_12338 ) ) ( not ( = ?auto_12333 ?auto_12338 ) ) ( not ( = ?auto_12331 ?auto_12338 ) ) ( ON ?auto_12330 ?auto_12329 ) ( ON ?auto_12331 ?auto_12330 ) ( not ( = ?auto_12329 ?auto_12330 ) ) ( not ( = ?auto_12329 ?auto_12331 ) ) ( not ( = ?auto_12329 ?auto_12332 ) ) ( not ( = ?auto_12329 ?auto_12333 ) ) ( not ( = ?auto_12329 ?auto_12338 ) ) ( not ( = ?auto_12330 ?auto_12331 ) ) ( not ( = ?auto_12330 ?auto_12332 ) ) ( not ( = ?auto_12330 ?auto_12333 ) ) ( not ( = ?auto_12330 ?auto_12338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12331 ?auto_12332 ?auto_12333 )
      ( MAKE-4CRATE-VERIFY ?auto_12329 ?auto_12330 ?auto_12331 ?auto_12332 ?auto_12333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12340 - SURFACE
      ?auto_12341 - SURFACE
    )
    :vars
    (
      ?auto_12343 - HOIST
      ?auto_12348 - PLACE
      ?auto_12342 - SURFACE
      ?auto_12344 - PLACE
      ?auto_12346 - HOIST
      ?auto_12347 - SURFACE
      ?auto_12345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12343 ?auto_12348 ) ( SURFACE-AT ?auto_12340 ?auto_12348 ) ( CLEAR ?auto_12340 ) ( IS-CRATE ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12341 ) ) ( AVAILABLE ?auto_12343 ) ( ON ?auto_12340 ?auto_12342 ) ( not ( = ?auto_12342 ?auto_12340 ) ) ( not ( = ?auto_12342 ?auto_12341 ) ) ( not ( = ?auto_12344 ?auto_12348 ) ) ( HOIST-AT ?auto_12346 ?auto_12344 ) ( not ( = ?auto_12343 ?auto_12346 ) ) ( AVAILABLE ?auto_12346 ) ( SURFACE-AT ?auto_12341 ?auto_12344 ) ( ON ?auto_12341 ?auto_12347 ) ( CLEAR ?auto_12341 ) ( not ( = ?auto_12340 ?auto_12347 ) ) ( not ( = ?auto_12341 ?auto_12347 ) ) ( not ( = ?auto_12342 ?auto_12347 ) ) ( TRUCK-AT ?auto_12345 ?auto_12348 ) )
    :subtasks
    ( ( !DRIVE ?auto_12345 ?auto_12348 ?auto_12344 )
      ( MAKE-2CRATE ?auto_12342 ?auto_12340 ?auto_12341 )
      ( MAKE-1CRATE-VERIFY ?auto_12340 ?auto_12341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12349 - SURFACE
      ?auto_12350 - SURFACE
      ?auto_12351 - SURFACE
    )
    :vars
    (
      ?auto_12352 - HOIST
      ?auto_12353 - PLACE
      ?auto_12357 - PLACE
      ?auto_12354 - HOIST
      ?auto_12355 - SURFACE
      ?auto_12356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12352 ?auto_12353 ) ( SURFACE-AT ?auto_12350 ?auto_12353 ) ( CLEAR ?auto_12350 ) ( IS-CRATE ?auto_12351 ) ( not ( = ?auto_12350 ?auto_12351 ) ) ( AVAILABLE ?auto_12352 ) ( ON ?auto_12350 ?auto_12349 ) ( not ( = ?auto_12349 ?auto_12350 ) ) ( not ( = ?auto_12349 ?auto_12351 ) ) ( not ( = ?auto_12357 ?auto_12353 ) ) ( HOIST-AT ?auto_12354 ?auto_12357 ) ( not ( = ?auto_12352 ?auto_12354 ) ) ( AVAILABLE ?auto_12354 ) ( SURFACE-AT ?auto_12351 ?auto_12357 ) ( ON ?auto_12351 ?auto_12355 ) ( CLEAR ?auto_12351 ) ( not ( = ?auto_12350 ?auto_12355 ) ) ( not ( = ?auto_12351 ?auto_12355 ) ) ( not ( = ?auto_12349 ?auto_12355 ) ) ( TRUCK-AT ?auto_12356 ?auto_12353 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12350 ?auto_12351 )
      ( MAKE-2CRATE-VERIFY ?auto_12349 ?auto_12350 ?auto_12351 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12358 - SURFACE
      ?auto_12359 - SURFACE
      ?auto_12360 - SURFACE
      ?auto_12361 - SURFACE
    )
    :vars
    (
      ?auto_12364 - HOIST
      ?auto_12366 - PLACE
      ?auto_12367 - PLACE
      ?auto_12362 - HOIST
      ?auto_12365 - SURFACE
      ?auto_12363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12364 ?auto_12366 ) ( SURFACE-AT ?auto_12360 ?auto_12366 ) ( CLEAR ?auto_12360 ) ( IS-CRATE ?auto_12361 ) ( not ( = ?auto_12360 ?auto_12361 ) ) ( AVAILABLE ?auto_12364 ) ( ON ?auto_12360 ?auto_12359 ) ( not ( = ?auto_12359 ?auto_12360 ) ) ( not ( = ?auto_12359 ?auto_12361 ) ) ( not ( = ?auto_12367 ?auto_12366 ) ) ( HOIST-AT ?auto_12362 ?auto_12367 ) ( not ( = ?auto_12364 ?auto_12362 ) ) ( AVAILABLE ?auto_12362 ) ( SURFACE-AT ?auto_12361 ?auto_12367 ) ( ON ?auto_12361 ?auto_12365 ) ( CLEAR ?auto_12361 ) ( not ( = ?auto_12360 ?auto_12365 ) ) ( not ( = ?auto_12361 ?auto_12365 ) ) ( not ( = ?auto_12359 ?auto_12365 ) ) ( TRUCK-AT ?auto_12363 ?auto_12366 ) ( ON ?auto_12359 ?auto_12358 ) ( not ( = ?auto_12358 ?auto_12359 ) ) ( not ( = ?auto_12358 ?auto_12360 ) ) ( not ( = ?auto_12358 ?auto_12361 ) ) ( not ( = ?auto_12358 ?auto_12365 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12359 ?auto_12360 ?auto_12361 )
      ( MAKE-3CRATE-VERIFY ?auto_12358 ?auto_12359 ?auto_12360 ?auto_12361 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12368 - SURFACE
      ?auto_12369 - SURFACE
      ?auto_12370 - SURFACE
      ?auto_12371 - SURFACE
      ?auto_12372 - SURFACE
    )
    :vars
    (
      ?auto_12375 - HOIST
      ?auto_12377 - PLACE
      ?auto_12378 - PLACE
      ?auto_12373 - HOIST
      ?auto_12376 - SURFACE
      ?auto_12374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12375 ?auto_12377 ) ( SURFACE-AT ?auto_12371 ?auto_12377 ) ( CLEAR ?auto_12371 ) ( IS-CRATE ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12372 ) ) ( AVAILABLE ?auto_12375 ) ( ON ?auto_12371 ?auto_12370 ) ( not ( = ?auto_12370 ?auto_12371 ) ) ( not ( = ?auto_12370 ?auto_12372 ) ) ( not ( = ?auto_12378 ?auto_12377 ) ) ( HOIST-AT ?auto_12373 ?auto_12378 ) ( not ( = ?auto_12375 ?auto_12373 ) ) ( AVAILABLE ?auto_12373 ) ( SURFACE-AT ?auto_12372 ?auto_12378 ) ( ON ?auto_12372 ?auto_12376 ) ( CLEAR ?auto_12372 ) ( not ( = ?auto_12371 ?auto_12376 ) ) ( not ( = ?auto_12372 ?auto_12376 ) ) ( not ( = ?auto_12370 ?auto_12376 ) ) ( TRUCK-AT ?auto_12374 ?auto_12377 ) ( ON ?auto_12369 ?auto_12368 ) ( ON ?auto_12370 ?auto_12369 ) ( not ( = ?auto_12368 ?auto_12369 ) ) ( not ( = ?auto_12368 ?auto_12370 ) ) ( not ( = ?auto_12368 ?auto_12371 ) ) ( not ( = ?auto_12368 ?auto_12372 ) ) ( not ( = ?auto_12368 ?auto_12376 ) ) ( not ( = ?auto_12369 ?auto_12370 ) ) ( not ( = ?auto_12369 ?auto_12371 ) ) ( not ( = ?auto_12369 ?auto_12372 ) ) ( not ( = ?auto_12369 ?auto_12376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12370 ?auto_12371 ?auto_12372 )
      ( MAKE-4CRATE-VERIFY ?auto_12368 ?auto_12369 ?auto_12370 ?auto_12371 ?auto_12372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12379 - SURFACE
      ?auto_12380 - SURFACE
    )
    :vars
    (
      ?auto_12384 - HOIST
      ?auto_12386 - PLACE
      ?auto_12381 - SURFACE
      ?auto_12387 - PLACE
      ?auto_12382 - HOIST
      ?auto_12385 - SURFACE
      ?auto_12383 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12384 ?auto_12386 ) ( IS-CRATE ?auto_12380 ) ( not ( = ?auto_12379 ?auto_12380 ) ) ( not ( = ?auto_12381 ?auto_12379 ) ) ( not ( = ?auto_12381 ?auto_12380 ) ) ( not ( = ?auto_12387 ?auto_12386 ) ) ( HOIST-AT ?auto_12382 ?auto_12387 ) ( not ( = ?auto_12384 ?auto_12382 ) ) ( AVAILABLE ?auto_12382 ) ( SURFACE-AT ?auto_12380 ?auto_12387 ) ( ON ?auto_12380 ?auto_12385 ) ( CLEAR ?auto_12380 ) ( not ( = ?auto_12379 ?auto_12385 ) ) ( not ( = ?auto_12380 ?auto_12385 ) ) ( not ( = ?auto_12381 ?auto_12385 ) ) ( TRUCK-AT ?auto_12383 ?auto_12386 ) ( SURFACE-AT ?auto_12381 ?auto_12386 ) ( CLEAR ?auto_12381 ) ( LIFTING ?auto_12384 ?auto_12379 ) ( IS-CRATE ?auto_12379 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12381 ?auto_12379 )
      ( MAKE-2CRATE ?auto_12381 ?auto_12379 ?auto_12380 )
      ( MAKE-1CRATE-VERIFY ?auto_12379 ?auto_12380 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12388 - SURFACE
      ?auto_12389 - SURFACE
      ?auto_12390 - SURFACE
    )
    :vars
    (
      ?auto_12393 - HOIST
      ?auto_12395 - PLACE
      ?auto_12391 - PLACE
      ?auto_12396 - HOIST
      ?auto_12394 - SURFACE
      ?auto_12392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12393 ?auto_12395 ) ( IS-CRATE ?auto_12390 ) ( not ( = ?auto_12389 ?auto_12390 ) ) ( not ( = ?auto_12388 ?auto_12389 ) ) ( not ( = ?auto_12388 ?auto_12390 ) ) ( not ( = ?auto_12391 ?auto_12395 ) ) ( HOIST-AT ?auto_12396 ?auto_12391 ) ( not ( = ?auto_12393 ?auto_12396 ) ) ( AVAILABLE ?auto_12396 ) ( SURFACE-AT ?auto_12390 ?auto_12391 ) ( ON ?auto_12390 ?auto_12394 ) ( CLEAR ?auto_12390 ) ( not ( = ?auto_12389 ?auto_12394 ) ) ( not ( = ?auto_12390 ?auto_12394 ) ) ( not ( = ?auto_12388 ?auto_12394 ) ) ( TRUCK-AT ?auto_12392 ?auto_12395 ) ( SURFACE-AT ?auto_12388 ?auto_12395 ) ( CLEAR ?auto_12388 ) ( LIFTING ?auto_12393 ?auto_12389 ) ( IS-CRATE ?auto_12389 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12389 ?auto_12390 )
      ( MAKE-2CRATE-VERIFY ?auto_12388 ?auto_12389 ?auto_12390 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12397 - SURFACE
      ?auto_12398 - SURFACE
      ?auto_12399 - SURFACE
      ?auto_12400 - SURFACE
    )
    :vars
    (
      ?auto_12403 - HOIST
      ?auto_12405 - PLACE
      ?auto_12404 - PLACE
      ?auto_12402 - HOIST
      ?auto_12406 - SURFACE
      ?auto_12401 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12403 ?auto_12405 ) ( IS-CRATE ?auto_12400 ) ( not ( = ?auto_12399 ?auto_12400 ) ) ( not ( = ?auto_12398 ?auto_12399 ) ) ( not ( = ?auto_12398 ?auto_12400 ) ) ( not ( = ?auto_12404 ?auto_12405 ) ) ( HOIST-AT ?auto_12402 ?auto_12404 ) ( not ( = ?auto_12403 ?auto_12402 ) ) ( AVAILABLE ?auto_12402 ) ( SURFACE-AT ?auto_12400 ?auto_12404 ) ( ON ?auto_12400 ?auto_12406 ) ( CLEAR ?auto_12400 ) ( not ( = ?auto_12399 ?auto_12406 ) ) ( not ( = ?auto_12400 ?auto_12406 ) ) ( not ( = ?auto_12398 ?auto_12406 ) ) ( TRUCK-AT ?auto_12401 ?auto_12405 ) ( SURFACE-AT ?auto_12398 ?auto_12405 ) ( CLEAR ?auto_12398 ) ( LIFTING ?auto_12403 ?auto_12399 ) ( IS-CRATE ?auto_12399 ) ( ON ?auto_12398 ?auto_12397 ) ( not ( = ?auto_12397 ?auto_12398 ) ) ( not ( = ?auto_12397 ?auto_12399 ) ) ( not ( = ?auto_12397 ?auto_12400 ) ) ( not ( = ?auto_12397 ?auto_12406 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12398 ?auto_12399 ?auto_12400 )
      ( MAKE-3CRATE-VERIFY ?auto_12397 ?auto_12398 ?auto_12399 ?auto_12400 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12407 - SURFACE
      ?auto_12408 - SURFACE
      ?auto_12409 - SURFACE
      ?auto_12410 - SURFACE
      ?auto_12411 - SURFACE
    )
    :vars
    (
      ?auto_12414 - HOIST
      ?auto_12416 - PLACE
      ?auto_12415 - PLACE
      ?auto_12413 - HOIST
      ?auto_12417 - SURFACE
      ?auto_12412 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12414 ?auto_12416 ) ( IS-CRATE ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12411 ) ) ( not ( = ?auto_12409 ?auto_12410 ) ) ( not ( = ?auto_12409 ?auto_12411 ) ) ( not ( = ?auto_12415 ?auto_12416 ) ) ( HOIST-AT ?auto_12413 ?auto_12415 ) ( not ( = ?auto_12414 ?auto_12413 ) ) ( AVAILABLE ?auto_12413 ) ( SURFACE-AT ?auto_12411 ?auto_12415 ) ( ON ?auto_12411 ?auto_12417 ) ( CLEAR ?auto_12411 ) ( not ( = ?auto_12410 ?auto_12417 ) ) ( not ( = ?auto_12411 ?auto_12417 ) ) ( not ( = ?auto_12409 ?auto_12417 ) ) ( TRUCK-AT ?auto_12412 ?auto_12416 ) ( SURFACE-AT ?auto_12409 ?auto_12416 ) ( CLEAR ?auto_12409 ) ( LIFTING ?auto_12414 ?auto_12410 ) ( IS-CRATE ?auto_12410 ) ( ON ?auto_12408 ?auto_12407 ) ( ON ?auto_12409 ?auto_12408 ) ( not ( = ?auto_12407 ?auto_12408 ) ) ( not ( = ?auto_12407 ?auto_12409 ) ) ( not ( = ?auto_12407 ?auto_12410 ) ) ( not ( = ?auto_12407 ?auto_12411 ) ) ( not ( = ?auto_12407 ?auto_12417 ) ) ( not ( = ?auto_12408 ?auto_12409 ) ) ( not ( = ?auto_12408 ?auto_12410 ) ) ( not ( = ?auto_12408 ?auto_12411 ) ) ( not ( = ?auto_12408 ?auto_12417 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12409 ?auto_12410 ?auto_12411 )
      ( MAKE-4CRATE-VERIFY ?auto_12407 ?auto_12408 ?auto_12409 ?auto_12410 ?auto_12411 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12418 - SURFACE
      ?auto_12419 - SURFACE
    )
    :vars
    (
      ?auto_12423 - HOIST
      ?auto_12425 - PLACE
      ?auto_12420 - SURFACE
      ?auto_12424 - PLACE
      ?auto_12422 - HOIST
      ?auto_12426 - SURFACE
      ?auto_12421 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12423 ?auto_12425 ) ( IS-CRATE ?auto_12419 ) ( not ( = ?auto_12418 ?auto_12419 ) ) ( not ( = ?auto_12420 ?auto_12418 ) ) ( not ( = ?auto_12420 ?auto_12419 ) ) ( not ( = ?auto_12424 ?auto_12425 ) ) ( HOIST-AT ?auto_12422 ?auto_12424 ) ( not ( = ?auto_12423 ?auto_12422 ) ) ( AVAILABLE ?auto_12422 ) ( SURFACE-AT ?auto_12419 ?auto_12424 ) ( ON ?auto_12419 ?auto_12426 ) ( CLEAR ?auto_12419 ) ( not ( = ?auto_12418 ?auto_12426 ) ) ( not ( = ?auto_12419 ?auto_12426 ) ) ( not ( = ?auto_12420 ?auto_12426 ) ) ( TRUCK-AT ?auto_12421 ?auto_12425 ) ( SURFACE-AT ?auto_12420 ?auto_12425 ) ( CLEAR ?auto_12420 ) ( IS-CRATE ?auto_12418 ) ( AVAILABLE ?auto_12423 ) ( IN ?auto_12418 ?auto_12421 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12423 ?auto_12418 ?auto_12421 ?auto_12425 )
      ( MAKE-2CRATE ?auto_12420 ?auto_12418 ?auto_12419 )
      ( MAKE-1CRATE-VERIFY ?auto_12418 ?auto_12419 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12427 - SURFACE
      ?auto_12428 - SURFACE
      ?auto_12429 - SURFACE
    )
    :vars
    (
      ?auto_12433 - HOIST
      ?auto_12435 - PLACE
      ?auto_12434 - PLACE
      ?auto_12431 - HOIST
      ?auto_12430 - SURFACE
      ?auto_12432 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12433 ?auto_12435 ) ( IS-CRATE ?auto_12429 ) ( not ( = ?auto_12428 ?auto_12429 ) ) ( not ( = ?auto_12427 ?auto_12428 ) ) ( not ( = ?auto_12427 ?auto_12429 ) ) ( not ( = ?auto_12434 ?auto_12435 ) ) ( HOIST-AT ?auto_12431 ?auto_12434 ) ( not ( = ?auto_12433 ?auto_12431 ) ) ( AVAILABLE ?auto_12431 ) ( SURFACE-AT ?auto_12429 ?auto_12434 ) ( ON ?auto_12429 ?auto_12430 ) ( CLEAR ?auto_12429 ) ( not ( = ?auto_12428 ?auto_12430 ) ) ( not ( = ?auto_12429 ?auto_12430 ) ) ( not ( = ?auto_12427 ?auto_12430 ) ) ( TRUCK-AT ?auto_12432 ?auto_12435 ) ( SURFACE-AT ?auto_12427 ?auto_12435 ) ( CLEAR ?auto_12427 ) ( IS-CRATE ?auto_12428 ) ( AVAILABLE ?auto_12433 ) ( IN ?auto_12428 ?auto_12432 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12428 ?auto_12429 )
      ( MAKE-2CRATE-VERIFY ?auto_12427 ?auto_12428 ?auto_12429 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12436 - SURFACE
      ?auto_12437 - SURFACE
      ?auto_12438 - SURFACE
      ?auto_12439 - SURFACE
    )
    :vars
    (
      ?auto_12445 - HOIST
      ?auto_12441 - PLACE
      ?auto_12444 - PLACE
      ?auto_12443 - HOIST
      ?auto_12440 - SURFACE
      ?auto_12442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12445 ?auto_12441 ) ( IS-CRATE ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12439 ) ) ( not ( = ?auto_12437 ?auto_12438 ) ) ( not ( = ?auto_12437 ?auto_12439 ) ) ( not ( = ?auto_12444 ?auto_12441 ) ) ( HOIST-AT ?auto_12443 ?auto_12444 ) ( not ( = ?auto_12445 ?auto_12443 ) ) ( AVAILABLE ?auto_12443 ) ( SURFACE-AT ?auto_12439 ?auto_12444 ) ( ON ?auto_12439 ?auto_12440 ) ( CLEAR ?auto_12439 ) ( not ( = ?auto_12438 ?auto_12440 ) ) ( not ( = ?auto_12439 ?auto_12440 ) ) ( not ( = ?auto_12437 ?auto_12440 ) ) ( TRUCK-AT ?auto_12442 ?auto_12441 ) ( SURFACE-AT ?auto_12437 ?auto_12441 ) ( CLEAR ?auto_12437 ) ( IS-CRATE ?auto_12438 ) ( AVAILABLE ?auto_12445 ) ( IN ?auto_12438 ?auto_12442 ) ( ON ?auto_12437 ?auto_12436 ) ( not ( = ?auto_12436 ?auto_12437 ) ) ( not ( = ?auto_12436 ?auto_12438 ) ) ( not ( = ?auto_12436 ?auto_12439 ) ) ( not ( = ?auto_12436 ?auto_12440 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12437 ?auto_12438 ?auto_12439 )
      ( MAKE-3CRATE-VERIFY ?auto_12436 ?auto_12437 ?auto_12438 ?auto_12439 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12446 - SURFACE
      ?auto_12447 - SURFACE
      ?auto_12448 - SURFACE
      ?auto_12449 - SURFACE
      ?auto_12450 - SURFACE
    )
    :vars
    (
      ?auto_12456 - HOIST
      ?auto_12452 - PLACE
      ?auto_12455 - PLACE
      ?auto_12454 - HOIST
      ?auto_12451 - SURFACE
      ?auto_12453 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12456 ?auto_12452 ) ( IS-CRATE ?auto_12450 ) ( not ( = ?auto_12449 ?auto_12450 ) ) ( not ( = ?auto_12448 ?auto_12449 ) ) ( not ( = ?auto_12448 ?auto_12450 ) ) ( not ( = ?auto_12455 ?auto_12452 ) ) ( HOIST-AT ?auto_12454 ?auto_12455 ) ( not ( = ?auto_12456 ?auto_12454 ) ) ( AVAILABLE ?auto_12454 ) ( SURFACE-AT ?auto_12450 ?auto_12455 ) ( ON ?auto_12450 ?auto_12451 ) ( CLEAR ?auto_12450 ) ( not ( = ?auto_12449 ?auto_12451 ) ) ( not ( = ?auto_12450 ?auto_12451 ) ) ( not ( = ?auto_12448 ?auto_12451 ) ) ( TRUCK-AT ?auto_12453 ?auto_12452 ) ( SURFACE-AT ?auto_12448 ?auto_12452 ) ( CLEAR ?auto_12448 ) ( IS-CRATE ?auto_12449 ) ( AVAILABLE ?auto_12456 ) ( IN ?auto_12449 ?auto_12453 ) ( ON ?auto_12447 ?auto_12446 ) ( ON ?auto_12448 ?auto_12447 ) ( not ( = ?auto_12446 ?auto_12447 ) ) ( not ( = ?auto_12446 ?auto_12448 ) ) ( not ( = ?auto_12446 ?auto_12449 ) ) ( not ( = ?auto_12446 ?auto_12450 ) ) ( not ( = ?auto_12446 ?auto_12451 ) ) ( not ( = ?auto_12447 ?auto_12448 ) ) ( not ( = ?auto_12447 ?auto_12449 ) ) ( not ( = ?auto_12447 ?auto_12450 ) ) ( not ( = ?auto_12447 ?auto_12451 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12448 ?auto_12449 ?auto_12450 )
      ( MAKE-4CRATE-VERIFY ?auto_12446 ?auto_12447 ?auto_12448 ?auto_12449 ?auto_12450 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12457 - SURFACE
      ?auto_12458 - SURFACE
    )
    :vars
    (
      ?auto_12465 - HOIST
      ?auto_12460 - PLACE
      ?auto_12461 - SURFACE
      ?auto_12464 - PLACE
      ?auto_12463 - HOIST
      ?auto_12459 - SURFACE
      ?auto_12462 - TRUCK
      ?auto_12466 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12465 ?auto_12460 ) ( IS-CRATE ?auto_12458 ) ( not ( = ?auto_12457 ?auto_12458 ) ) ( not ( = ?auto_12461 ?auto_12457 ) ) ( not ( = ?auto_12461 ?auto_12458 ) ) ( not ( = ?auto_12464 ?auto_12460 ) ) ( HOIST-AT ?auto_12463 ?auto_12464 ) ( not ( = ?auto_12465 ?auto_12463 ) ) ( AVAILABLE ?auto_12463 ) ( SURFACE-AT ?auto_12458 ?auto_12464 ) ( ON ?auto_12458 ?auto_12459 ) ( CLEAR ?auto_12458 ) ( not ( = ?auto_12457 ?auto_12459 ) ) ( not ( = ?auto_12458 ?auto_12459 ) ) ( not ( = ?auto_12461 ?auto_12459 ) ) ( SURFACE-AT ?auto_12461 ?auto_12460 ) ( CLEAR ?auto_12461 ) ( IS-CRATE ?auto_12457 ) ( AVAILABLE ?auto_12465 ) ( IN ?auto_12457 ?auto_12462 ) ( TRUCK-AT ?auto_12462 ?auto_12466 ) ( not ( = ?auto_12466 ?auto_12460 ) ) ( not ( = ?auto_12464 ?auto_12466 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12462 ?auto_12466 ?auto_12460 )
      ( MAKE-2CRATE ?auto_12461 ?auto_12457 ?auto_12458 )
      ( MAKE-1CRATE-VERIFY ?auto_12457 ?auto_12458 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12467 - SURFACE
      ?auto_12468 - SURFACE
      ?auto_12469 - SURFACE
    )
    :vars
    (
      ?auto_12472 - HOIST
      ?auto_12476 - PLACE
      ?auto_12471 - PLACE
      ?auto_12473 - HOIST
      ?auto_12470 - SURFACE
      ?auto_12474 - TRUCK
      ?auto_12475 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12472 ?auto_12476 ) ( IS-CRATE ?auto_12469 ) ( not ( = ?auto_12468 ?auto_12469 ) ) ( not ( = ?auto_12467 ?auto_12468 ) ) ( not ( = ?auto_12467 ?auto_12469 ) ) ( not ( = ?auto_12471 ?auto_12476 ) ) ( HOIST-AT ?auto_12473 ?auto_12471 ) ( not ( = ?auto_12472 ?auto_12473 ) ) ( AVAILABLE ?auto_12473 ) ( SURFACE-AT ?auto_12469 ?auto_12471 ) ( ON ?auto_12469 ?auto_12470 ) ( CLEAR ?auto_12469 ) ( not ( = ?auto_12468 ?auto_12470 ) ) ( not ( = ?auto_12469 ?auto_12470 ) ) ( not ( = ?auto_12467 ?auto_12470 ) ) ( SURFACE-AT ?auto_12467 ?auto_12476 ) ( CLEAR ?auto_12467 ) ( IS-CRATE ?auto_12468 ) ( AVAILABLE ?auto_12472 ) ( IN ?auto_12468 ?auto_12474 ) ( TRUCK-AT ?auto_12474 ?auto_12475 ) ( not ( = ?auto_12475 ?auto_12476 ) ) ( not ( = ?auto_12471 ?auto_12475 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12468 ?auto_12469 )
      ( MAKE-2CRATE-VERIFY ?auto_12467 ?auto_12468 ?auto_12469 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12477 - SURFACE
      ?auto_12478 - SURFACE
      ?auto_12479 - SURFACE
      ?auto_12480 - SURFACE
    )
    :vars
    (
      ?auto_12482 - HOIST
      ?auto_12484 - PLACE
      ?auto_12486 - PLACE
      ?auto_12485 - HOIST
      ?auto_12487 - SURFACE
      ?auto_12483 - TRUCK
      ?auto_12481 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12482 ?auto_12484 ) ( IS-CRATE ?auto_12480 ) ( not ( = ?auto_12479 ?auto_12480 ) ) ( not ( = ?auto_12478 ?auto_12479 ) ) ( not ( = ?auto_12478 ?auto_12480 ) ) ( not ( = ?auto_12486 ?auto_12484 ) ) ( HOIST-AT ?auto_12485 ?auto_12486 ) ( not ( = ?auto_12482 ?auto_12485 ) ) ( AVAILABLE ?auto_12485 ) ( SURFACE-AT ?auto_12480 ?auto_12486 ) ( ON ?auto_12480 ?auto_12487 ) ( CLEAR ?auto_12480 ) ( not ( = ?auto_12479 ?auto_12487 ) ) ( not ( = ?auto_12480 ?auto_12487 ) ) ( not ( = ?auto_12478 ?auto_12487 ) ) ( SURFACE-AT ?auto_12478 ?auto_12484 ) ( CLEAR ?auto_12478 ) ( IS-CRATE ?auto_12479 ) ( AVAILABLE ?auto_12482 ) ( IN ?auto_12479 ?auto_12483 ) ( TRUCK-AT ?auto_12483 ?auto_12481 ) ( not ( = ?auto_12481 ?auto_12484 ) ) ( not ( = ?auto_12486 ?auto_12481 ) ) ( ON ?auto_12478 ?auto_12477 ) ( not ( = ?auto_12477 ?auto_12478 ) ) ( not ( = ?auto_12477 ?auto_12479 ) ) ( not ( = ?auto_12477 ?auto_12480 ) ) ( not ( = ?auto_12477 ?auto_12487 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12478 ?auto_12479 ?auto_12480 )
      ( MAKE-3CRATE-VERIFY ?auto_12477 ?auto_12478 ?auto_12479 ?auto_12480 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12488 - SURFACE
      ?auto_12489 - SURFACE
      ?auto_12490 - SURFACE
      ?auto_12491 - SURFACE
      ?auto_12492 - SURFACE
    )
    :vars
    (
      ?auto_12494 - HOIST
      ?auto_12496 - PLACE
      ?auto_12498 - PLACE
      ?auto_12497 - HOIST
      ?auto_12499 - SURFACE
      ?auto_12495 - TRUCK
      ?auto_12493 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12494 ?auto_12496 ) ( IS-CRATE ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12492 ) ) ( not ( = ?auto_12490 ?auto_12491 ) ) ( not ( = ?auto_12490 ?auto_12492 ) ) ( not ( = ?auto_12498 ?auto_12496 ) ) ( HOIST-AT ?auto_12497 ?auto_12498 ) ( not ( = ?auto_12494 ?auto_12497 ) ) ( AVAILABLE ?auto_12497 ) ( SURFACE-AT ?auto_12492 ?auto_12498 ) ( ON ?auto_12492 ?auto_12499 ) ( CLEAR ?auto_12492 ) ( not ( = ?auto_12491 ?auto_12499 ) ) ( not ( = ?auto_12492 ?auto_12499 ) ) ( not ( = ?auto_12490 ?auto_12499 ) ) ( SURFACE-AT ?auto_12490 ?auto_12496 ) ( CLEAR ?auto_12490 ) ( IS-CRATE ?auto_12491 ) ( AVAILABLE ?auto_12494 ) ( IN ?auto_12491 ?auto_12495 ) ( TRUCK-AT ?auto_12495 ?auto_12493 ) ( not ( = ?auto_12493 ?auto_12496 ) ) ( not ( = ?auto_12498 ?auto_12493 ) ) ( ON ?auto_12489 ?auto_12488 ) ( ON ?auto_12490 ?auto_12489 ) ( not ( = ?auto_12488 ?auto_12489 ) ) ( not ( = ?auto_12488 ?auto_12490 ) ) ( not ( = ?auto_12488 ?auto_12491 ) ) ( not ( = ?auto_12488 ?auto_12492 ) ) ( not ( = ?auto_12488 ?auto_12499 ) ) ( not ( = ?auto_12489 ?auto_12490 ) ) ( not ( = ?auto_12489 ?auto_12491 ) ) ( not ( = ?auto_12489 ?auto_12492 ) ) ( not ( = ?auto_12489 ?auto_12499 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12490 ?auto_12491 ?auto_12492 )
      ( MAKE-4CRATE-VERIFY ?auto_12488 ?auto_12489 ?auto_12490 ?auto_12491 ?auto_12492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12500 - SURFACE
      ?auto_12501 - SURFACE
    )
    :vars
    (
      ?auto_12503 - HOIST
      ?auto_12506 - PLACE
      ?auto_12505 - SURFACE
      ?auto_12508 - PLACE
      ?auto_12507 - HOIST
      ?auto_12509 - SURFACE
      ?auto_12504 - TRUCK
      ?auto_12502 - PLACE
      ?auto_12510 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12503 ?auto_12506 ) ( IS-CRATE ?auto_12501 ) ( not ( = ?auto_12500 ?auto_12501 ) ) ( not ( = ?auto_12505 ?auto_12500 ) ) ( not ( = ?auto_12505 ?auto_12501 ) ) ( not ( = ?auto_12508 ?auto_12506 ) ) ( HOIST-AT ?auto_12507 ?auto_12508 ) ( not ( = ?auto_12503 ?auto_12507 ) ) ( AVAILABLE ?auto_12507 ) ( SURFACE-AT ?auto_12501 ?auto_12508 ) ( ON ?auto_12501 ?auto_12509 ) ( CLEAR ?auto_12501 ) ( not ( = ?auto_12500 ?auto_12509 ) ) ( not ( = ?auto_12501 ?auto_12509 ) ) ( not ( = ?auto_12505 ?auto_12509 ) ) ( SURFACE-AT ?auto_12505 ?auto_12506 ) ( CLEAR ?auto_12505 ) ( IS-CRATE ?auto_12500 ) ( AVAILABLE ?auto_12503 ) ( TRUCK-AT ?auto_12504 ?auto_12502 ) ( not ( = ?auto_12502 ?auto_12506 ) ) ( not ( = ?auto_12508 ?auto_12502 ) ) ( HOIST-AT ?auto_12510 ?auto_12502 ) ( LIFTING ?auto_12510 ?auto_12500 ) ( not ( = ?auto_12503 ?auto_12510 ) ) ( not ( = ?auto_12507 ?auto_12510 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12510 ?auto_12500 ?auto_12504 ?auto_12502 )
      ( MAKE-2CRATE ?auto_12505 ?auto_12500 ?auto_12501 )
      ( MAKE-1CRATE-VERIFY ?auto_12500 ?auto_12501 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12511 - SURFACE
      ?auto_12512 - SURFACE
      ?auto_12513 - SURFACE
    )
    :vars
    (
      ?auto_12515 - HOIST
      ?auto_12517 - PLACE
      ?auto_12514 - PLACE
      ?auto_12520 - HOIST
      ?auto_12519 - SURFACE
      ?auto_12518 - TRUCK
      ?auto_12521 - PLACE
      ?auto_12516 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12515 ?auto_12517 ) ( IS-CRATE ?auto_12513 ) ( not ( = ?auto_12512 ?auto_12513 ) ) ( not ( = ?auto_12511 ?auto_12512 ) ) ( not ( = ?auto_12511 ?auto_12513 ) ) ( not ( = ?auto_12514 ?auto_12517 ) ) ( HOIST-AT ?auto_12520 ?auto_12514 ) ( not ( = ?auto_12515 ?auto_12520 ) ) ( AVAILABLE ?auto_12520 ) ( SURFACE-AT ?auto_12513 ?auto_12514 ) ( ON ?auto_12513 ?auto_12519 ) ( CLEAR ?auto_12513 ) ( not ( = ?auto_12512 ?auto_12519 ) ) ( not ( = ?auto_12513 ?auto_12519 ) ) ( not ( = ?auto_12511 ?auto_12519 ) ) ( SURFACE-AT ?auto_12511 ?auto_12517 ) ( CLEAR ?auto_12511 ) ( IS-CRATE ?auto_12512 ) ( AVAILABLE ?auto_12515 ) ( TRUCK-AT ?auto_12518 ?auto_12521 ) ( not ( = ?auto_12521 ?auto_12517 ) ) ( not ( = ?auto_12514 ?auto_12521 ) ) ( HOIST-AT ?auto_12516 ?auto_12521 ) ( LIFTING ?auto_12516 ?auto_12512 ) ( not ( = ?auto_12515 ?auto_12516 ) ) ( not ( = ?auto_12520 ?auto_12516 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12512 ?auto_12513 )
      ( MAKE-2CRATE-VERIFY ?auto_12511 ?auto_12512 ?auto_12513 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12522 - SURFACE
      ?auto_12523 - SURFACE
      ?auto_12524 - SURFACE
      ?auto_12525 - SURFACE
    )
    :vars
    (
      ?auto_12529 - HOIST
      ?auto_12527 - PLACE
      ?auto_12528 - PLACE
      ?auto_12533 - HOIST
      ?auto_12531 - SURFACE
      ?auto_12532 - TRUCK
      ?auto_12526 - PLACE
      ?auto_12530 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12529 ?auto_12527 ) ( IS-CRATE ?auto_12525 ) ( not ( = ?auto_12524 ?auto_12525 ) ) ( not ( = ?auto_12523 ?auto_12524 ) ) ( not ( = ?auto_12523 ?auto_12525 ) ) ( not ( = ?auto_12528 ?auto_12527 ) ) ( HOIST-AT ?auto_12533 ?auto_12528 ) ( not ( = ?auto_12529 ?auto_12533 ) ) ( AVAILABLE ?auto_12533 ) ( SURFACE-AT ?auto_12525 ?auto_12528 ) ( ON ?auto_12525 ?auto_12531 ) ( CLEAR ?auto_12525 ) ( not ( = ?auto_12524 ?auto_12531 ) ) ( not ( = ?auto_12525 ?auto_12531 ) ) ( not ( = ?auto_12523 ?auto_12531 ) ) ( SURFACE-AT ?auto_12523 ?auto_12527 ) ( CLEAR ?auto_12523 ) ( IS-CRATE ?auto_12524 ) ( AVAILABLE ?auto_12529 ) ( TRUCK-AT ?auto_12532 ?auto_12526 ) ( not ( = ?auto_12526 ?auto_12527 ) ) ( not ( = ?auto_12528 ?auto_12526 ) ) ( HOIST-AT ?auto_12530 ?auto_12526 ) ( LIFTING ?auto_12530 ?auto_12524 ) ( not ( = ?auto_12529 ?auto_12530 ) ) ( not ( = ?auto_12533 ?auto_12530 ) ) ( ON ?auto_12523 ?auto_12522 ) ( not ( = ?auto_12522 ?auto_12523 ) ) ( not ( = ?auto_12522 ?auto_12524 ) ) ( not ( = ?auto_12522 ?auto_12525 ) ) ( not ( = ?auto_12522 ?auto_12531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12523 ?auto_12524 ?auto_12525 )
      ( MAKE-3CRATE-VERIFY ?auto_12522 ?auto_12523 ?auto_12524 ?auto_12525 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12534 - SURFACE
      ?auto_12535 - SURFACE
      ?auto_12536 - SURFACE
      ?auto_12537 - SURFACE
      ?auto_12538 - SURFACE
    )
    :vars
    (
      ?auto_12542 - HOIST
      ?auto_12540 - PLACE
      ?auto_12541 - PLACE
      ?auto_12546 - HOIST
      ?auto_12544 - SURFACE
      ?auto_12545 - TRUCK
      ?auto_12539 - PLACE
      ?auto_12543 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12542 ?auto_12540 ) ( IS-CRATE ?auto_12538 ) ( not ( = ?auto_12537 ?auto_12538 ) ) ( not ( = ?auto_12536 ?auto_12537 ) ) ( not ( = ?auto_12536 ?auto_12538 ) ) ( not ( = ?auto_12541 ?auto_12540 ) ) ( HOIST-AT ?auto_12546 ?auto_12541 ) ( not ( = ?auto_12542 ?auto_12546 ) ) ( AVAILABLE ?auto_12546 ) ( SURFACE-AT ?auto_12538 ?auto_12541 ) ( ON ?auto_12538 ?auto_12544 ) ( CLEAR ?auto_12538 ) ( not ( = ?auto_12537 ?auto_12544 ) ) ( not ( = ?auto_12538 ?auto_12544 ) ) ( not ( = ?auto_12536 ?auto_12544 ) ) ( SURFACE-AT ?auto_12536 ?auto_12540 ) ( CLEAR ?auto_12536 ) ( IS-CRATE ?auto_12537 ) ( AVAILABLE ?auto_12542 ) ( TRUCK-AT ?auto_12545 ?auto_12539 ) ( not ( = ?auto_12539 ?auto_12540 ) ) ( not ( = ?auto_12541 ?auto_12539 ) ) ( HOIST-AT ?auto_12543 ?auto_12539 ) ( LIFTING ?auto_12543 ?auto_12537 ) ( not ( = ?auto_12542 ?auto_12543 ) ) ( not ( = ?auto_12546 ?auto_12543 ) ) ( ON ?auto_12535 ?auto_12534 ) ( ON ?auto_12536 ?auto_12535 ) ( not ( = ?auto_12534 ?auto_12535 ) ) ( not ( = ?auto_12534 ?auto_12536 ) ) ( not ( = ?auto_12534 ?auto_12537 ) ) ( not ( = ?auto_12534 ?auto_12538 ) ) ( not ( = ?auto_12534 ?auto_12544 ) ) ( not ( = ?auto_12535 ?auto_12536 ) ) ( not ( = ?auto_12535 ?auto_12537 ) ) ( not ( = ?auto_12535 ?auto_12538 ) ) ( not ( = ?auto_12535 ?auto_12544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12536 ?auto_12537 ?auto_12538 )
      ( MAKE-4CRATE-VERIFY ?auto_12534 ?auto_12535 ?auto_12536 ?auto_12537 ?auto_12538 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12547 - SURFACE
      ?auto_12548 - SURFACE
    )
    :vars
    (
      ?auto_12552 - HOIST
      ?auto_12550 - PLACE
      ?auto_12554 - SURFACE
      ?auto_12551 - PLACE
      ?auto_12557 - HOIST
      ?auto_12555 - SURFACE
      ?auto_12556 - TRUCK
      ?auto_12549 - PLACE
      ?auto_12553 - HOIST
      ?auto_12558 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12552 ?auto_12550 ) ( IS-CRATE ?auto_12548 ) ( not ( = ?auto_12547 ?auto_12548 ) ) ( not ( = ?auto_12554 ?auto_12547 ) ) ( not ( = ?auto_12554 ?auto_12548 ) ) ( not ( = ?auto_12551 ?auto_12550 ) ) ( HOIST-AT ?auto_12557 ?auto_12551 ) ( not ( = ?auto_12552 ?auto_12557 ) ) ( AVAILABLE ?auto_12557 ) ( SURFACE-AT ?auto_12548 ?auto_12551 ) ( ON ?auto_12548 ?auto_12555 ) ( CLEAR ?auto_12548 ) ( not ( = ?auto_12547 ?auto_12555 ) ) ( not ( = ?auto_12548 ?auto_12555 ) ) ( not ( = ?auto_12554 ?auto_12555 ) ) ( SURFACE-AT ?auto_12554 ?auto_12550 ) ( CLEAR ?auto_12554 ) ( IS-CRATE ?auto_12547 ) ( AVAILABLE ?auto_12552 ) ( TRUCK-AT ?auto_12556 ?auto_12549 ) ( not ( = ?auto_12549 ?auto_12550 ) ) ( not ( = ?auto_12551 ?auto_12549 ) ) ( HOIST-AT ?auto_12553 ?auto_12549 ) ( not ( = ?auto_12552 ?auto_12553 ) ) ( not ( = ?auto_12557 ?auto_12553 ) ) ( AVAILABLE ?auto_12553 ) ( SURFACE-AT ?auto_12547 ?auto_12549 ) ( ON ?auto_12547 ?auto_12558 ) ( CLEAR ?auto_12547 ) ( not ( = ?auto_12547 ?auto_12558 ) ) ( not ( = ?auto_12548 ?auto_12558 ) ) ( not ( = ?auto_12554 ?auto_12558 ) ) ( not ( = ?auto_12555 ?auto_12558 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12553 ?auto_12547 ?auto_12558 ?auto_12549 )
      ( MAKE-2CRATE ?auto_12554 ?auto_12547 ?auto_12548 )
      ( MAKE-1CRATE-VERIFY ?auto_12547 ?auto_12548 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12559 - SURFACE
      ?auto_12560 - SURFACE
      ?auto_12561 - SURFACE
    )
    :vars
    (
      ?auto_12570 - HOIST
      ?auto_12562 - PLACE
      ?auto_12566 - PLACE
      ?auto_12565 - HOIST
      ?auto_12563 - SURFACE
      ?auto_12569 - TRUCK
      ?auto_12568 - PLACE
      ?auto_12564 - HOIST
      ?auto_12567 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12570 ?auto_12562 ) ( IS-CRATE ?auto_12561 ) ( not ( = ?auto_12560 ?auto_12561 ) ) ( not ( = ?auto_12559 ?auto_12560 ) ) ( not ( = ?auto_12559 ?auto_12561 ) ) ( not ( = ?auto_12566 ?auto_12562 ) ) ( HOIST-AT ?auto_12565 ?auto_12566 ) ( not ( = ?auto_12570 ?auto_12565 ) ) ( AVAILABLE ?auto_12565 ) ( SURFACE-AT ?auto_12561 ?auto_12566 ) ( ON ?auto_12561 ?auto_12563 ) ( CLEAR ?auto_12561 ) ( not ( = ?auto_12560 ?auto_12563 ) ) ( not ( = ?auto_12561 ?auto_12563 ) ) ( not ( = ?auto_12559 ?auto_12563 ) ) ( SURFACE-AT ?auto_12559 ?auto_12562 ) ( CLEAR ?auto_12559 ) ( IS-CRATE ?auto_12560 ) ( AVAILABLE ?auto_12570 ) ( TRUCK-AT ?auto_12569 ?auto_12568 ) ( not ( = ?auto_12568 ?auto_12562 ) ) ( not ( = ?auto_12566 ?auto_12568 ) ) ( HOIST-AT ?auto_12564 ?auto_12568 ) ( not ( = ?auto_12570 ?auto_12564 ) ) ( not ( = ?auto_12565 ?auto_12564 ) ) ( AVAILABLE ?auto_12564 ) ( SURFACE-AT ?auto_12560 ?auto_12568 ) ( ON ?auto_12560 ?auto_12567 ) ( CLEAR ?auto_12560 ) ( not ( = ?auto_12560 ?auto_12567 ) ) ( not ( = ?auto_12561 ?auto_12567 ) ) ( not ( = ?auto_12559 ?auto_12567 ) ) ( not ( = ?auto_12563 ?auto_12567 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12560 ?auto_12561 )
      ( MAKE-2CRATE-VERIFY ?auto_12559 ?auto_12560 ?auto_12561 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12571 - SURFACE
      ?auto_12572 - SURFACE
      ?auto_12573 - SURFACE
      ?auto_12574 - SURFACE
    )
    :vars
    (
      ?auto_12583 - HOIST
      ?auto_12579 - PLACE
      ?auto_12577 - PLACE
      ?auto_12576 - HOIST
      ?auto_12578 - SURFACE
      ?auto_12581 - TRUCK
      ?auto_12580 - PLACE
      ?auto_12575 - HOIST
      ?auto_12582 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12583 ?auto_12579 ) ( IS-CRATE ?auto_12574 ) ( not ( = ?auto_12573 ?auto_12574 ) ) ( not ( = ?auto_12572 ?auto_12573 ) ) ( not ( = ?auto_12572 ?auto_12574 ) ) ( not ( = ?auto_12577 ?auto_12579 ) ) ( HOIST-AT ?auto_12576 ?auto_12577 ) ( not ( = ?auto_12583 ?auto_12576 ) ) ( AVAILABLE ?auto_12576 ) ( SURFACE-AT ?auto_12574 ?auto_12577 ) ( ON ?auto_12574 ?auto_12578 ) ( CLEAR ?auto_12574 ) ( not ( = ?auto_12573 ?auto_12578 ) ) ( not ( = ?auto_12574 ?auto_12578 ) ) ( not ( = ?auto_12572 ?auto_12578 ) ) ( SURFACE-AT ?auto_12572 ?auto_12579 ) ( CLEAR ?auto_12572 ) ( IS-CRATE ?auto_12573 ) ( AVAILABLE ?auto_12583 ) ( TRUCK-AT ?auto_12581 ?auto_12580 ) ( not ( = ?auto_12580 ?auto_12579 ) ) ( not ( = ?auto_12577 ?auto_12580 ) ) ( HOIST-AT ?auto_12575 ?auto_12580 ) ( not ( = ?auto_12583 ?auto_12575 ) ) ( not ( = ?auto_12576 ?auto_12575 ) ) ( AVAILABLE ?auto_12575 ) ( SURFACE-AT ?auto_12573 ?auto_12580 ) ( ON ?auto_12573 ?auto_12582 ) ( CLEAR ?auto_12573 ) ( not ( = ?auto_12573 ?auto_12582 ) ) ( not ( = ?auto_12574 ?auto_12582 ) ) ( not ( = ?auto_12572 ?auto_12582 ) ) ( not ( = ?auto_12578 ?auto_12582 ) ) ( ON ?auto_12572 ?auto_12571 ) ( not ( = ?auto_12571 ?auto_12572 ) ) ( not ( = ?auto_12571 ?auto_12573 ) ) ( not ( = ?auto_12571 ?auto_12574 ) ) ( not ( = ?auto_12571 ?auto_12578 ) ) ( not ( = ?auto_12571 ?auto_12582 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12572 ?auto_12573 ?auto_12574 )
      ( MAKE-3CRATE-VERIFY ?auto_12571 ?auto_12572 ?auto_12573 ?auto_12574 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12584 - SURFACE
      ?auto_12585 - SURFACE
      ?auto_12586 - SURFACE
      ?auto_12587 - SURFACE
      ?auto_12588 - SURFACE
    )
    :vars
    (
      ?auto_12597 - HOIST
      ?auto_12593 - PLACE
      ?auto_12591 - PLACE
      ?auto_12590 - HOIST
      ?auto_12592 - SURFACE
      ?auto_12595 - TRUCK
      ?auto_12594 - PLACE
      ?auto_12589 - HOIST
      ?auto_12596 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12597 ?auto_12593 ) ( IS-CRATE ?auto_12588 ) ( not ( = ?auto_12587 ?auto_12588 ) ) ( not ( = ?auto_12586 ?auto_12587 ) ) ( not ( = ?auto_12586 ?auto_12588 ) ) ( not ( = ?auto_12591 ?auto_12593 ) ) ( HOIST-AT ?auto_12590 ?auto_12591 ) ( not ( = ?auto_12597 ?auto_12590 ) ) ( AVAILABLE ?auto_12590 ) ( SURFACE-AT ?auto_12588 ?auto_12591 ) ( ON ?auto_12588 ?auto_12592 ) ( CLEAR ?auto_12588 ) ( not ( = ?auto_12587 ?auto_12592 ) ) ( not ( = ?auto_12588 ?auto_12592 ) ) ( not ( = ?auto_12586 ?auto_12592 ) ) ( SURFACE-AT ?auto_12586 ?auto_12593 ) ( CLEAR ?auto_12586 ) ( IS-CRATE ?auto_12587 ) ( AVAILABLE ?auto_12597 ) ( TRUCK-AT ?auto_12595 ?auto_12594 ) ( not ( = ?auto_12594 ?auto_12593 ) ) ( not ( = ?auto_12591 ?auto_12594 ) ) ( HOIST-AT ?auto_12589 ?auto_12594 ) ( not ( = ?auto_12597 ?auto_12589 ) ) ( not ( = ?auto_12590 ?auto_12589 ) ) ( AVAILABLE ?auto_12589 ) ( SURFACE-AT ?auto_12587 ?auto_12594 ) ( ON ?auto_12587 ?auto_12596 ) ( CLEAR ?auto_12587 ) ( not ( = ?auto_12587 ?auto_12596 ) ) ( not ( = ?auto_12588 ?auto_12596 ) ) ( not ( = ?auto_12586 ?auto_12596 ) ) ( not ( = ?auto_12592 ?auto_12596 ) ) ( ON ?auto_12585 ?auto_12584 ) ( ON ?auto_12586 ?auto_12585 ) ( not ( = ?auto_12584 ?auto_12585 ) ) ( not ( = ?auto_12584 ?auto_12586 ) ) ( not ( = ?auto_12584 ?auto_12587 ) ) ( not ( = ?auto_12584 ?auto_12588 ) ) ( not ( = ?auto_12584 ?auto_12592 ) ) ( not ( = ?auto_12584 ?auto_12596 ) ) ( not ( = ?auto_12585 ?auto_12586 ) ) ( not ( = ?auto_12585 ?auto_12587 ) ) ( not ( = ?auto_12585 ?auto_12588 ) ) ( not ( = ?auto_12585 ?auto_12592 ) ) ( not ( = ?auto_12585 ?auto_12596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12586 ?auto_12587 ?auto_12588 )
      ( MAKE-4CRATE-VERIFY ?auto_12584 ?auto_12585 ?auto_12586 ?auto_12587 ?auto_12588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12598 - SURFACE
      ?auto_12599 - SURFACE
    )
    :vars
    (
      ?auto_12608 - HOIST
      ?auto_12604 - PLACE
      ?auto_12609 - SURFACE
      ?auto_12602 - PLACE
      ?auto_12601 - HOIST
      ?auto_12603 - SURFACE
      ?auto_12605 - PLACE
      ?auto_12600 - HOIST
      ?auto_12607 - SURFACE
      ?auto_12606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12608 ?auto_12604 ) ( IS-CRATE ?auto_12599 ) ( not ( = ?auto_12598 ?auto_12599 ) ) ( not ( = ?auto_12609 ?auto_12598 ) ) ( not ( = ?auto_12609 ?auto_12599 ) ) ( not ( = ?auto_12602 ?auto_12604 ) ) ( HOIST-AT ?auto_12601 ?auto_12602 ) ( not ( = ?auto_12608 ?auto_12601 ) ) ( AVAILABLE ?auto_12601 ) ( SURFACE-AT ?auto_12599 ?auto_12602 ) ( ON ?auto_12599 ?auto_12603 ) ( CLEAR ?auto_12599 ) ( not ( = ?auto_12598 ?auto_12603 ) ) ( not ( = ?auto_12599 ?auto_12603 ) ) ( not ( = ?auto_12609 ?auto_12603 ) ) ( SURFACE-AT ?auto_12609 ?auto_12604 ) ( CLEAR ?auto_12609 ) ( IS-CRATE ?auto_12598 ) ( AVAILABLE ?auto_12608 ) ( not ( = ?auto_12605 ?auto_12604 ) ) ( not ( = ?auto_12602 ?auto_12605 ) ) ( HOIST-AT ?auto_12600 ?auto_12605 ) ( not ( = ?auto_12608 ?auto_12600 ) ) ( not ( = ?auto_12601 ?auto_12600 ) ) ( AVAILABLE ?auto_12600 ) ( SURFACE-AT ?auto_12598 ?auto_12605 ) ( ON ?auto_12598 ?auto_12607 ) ( CLEAR ?auto_12598 ) ( not ( = ?auto_12598 ?auto_12607 ) ) ( not ( = ?auto_12599 ?auto_12607 ) ) ( not ( = ?auto_12609 ?auto_12607 ) ) ( not ( = ?auto_12603 ?auto_12607 ) ) ( TRUCK-AT ?auto_12606 ?auto_12604 ) )
    :subtasks
    ( ( !DRIVE ?auto_12606 ?auto_12604 ?auto_12605 )
      ( MAKE-2CRATE ?auto_12609 ?auto_12598 ?auto_12599 )
      ( MAKE-1CRATE-VERIFY ?auto_12598 ?auto_12599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12610 - SURFACE
      ?auto_12611 - SURFACE
      ?auto_12612 - SURFACE
    )
    :vars
    (
      ?auto_12617 - HOIST
      ?auto_12619 - PLACE
      ?auto_12618 - PLACE
      ?auto_12613 - HOIST
      ?auto_12614 - SURFACE
      ?auto_12615 - PLACE
      ?auto_12616 - HOIST
      ?auto_12620 - SURFACE
      ?auto_12621 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12617 ?auto_12619 ) ( IS-CRATE ?auto_12612 ) ( not ( = ?auto_12611 ?auto_12612 ) ) ( not ( = ?auto_12610 ?auto_12611 ) ) ( not ( = ?auto_12610 ?auto_12612 ) ) ( not ( = ?auto_12618 ?auto_12619 ) ) ( HOIST-AT ?auto_12613 ?auto_12618 ) ( not ( = ?auto_12617 ?auto_12613 ) ) ( AVAILABLE ?auto_12613 ) ( SURFACE-AT ?auto_12612 ?auto_12618 ) ( ON ?auto_12612 ?auto_12614 ) ( CLEAR ?auto_12612 ) ( not ( = ?auto_12611 ?auto_12614 ) ) ( not ( = ?auto_12612 ?auto_12614 ) ) ( not ( = ?auto_12610 ?auto_12614 ) ) ( SURFACE-AT ?auto_12610 ?auto_12619 ) ( CLEAR ?auto_12610 ) ( IS-CRATE ?auto_12611 ) ( AVAILABLE ?auto_12617 ) ( not ( = ?auto_12615 ?auto_12619 ) ) ( not ( = ?auto_12618 ?auto_12615 ) ) ( HOIST-AT ?auto_12616 ?auto_12615 ) ( not ( = ?auto_12617 ?auto_12616 ) ) ( not ( = ?auto_12613 ?auto_12616 ) ) ( AVAILABLE ?auto_12616 ) ( SURFACE-AT ?auto_12611 ?auto_12615 ) ( ON ?auto_12611 ?auto_12620 ) ( CLEAR ?auto_12611 ) ( not ( = ?auto_12611 ?auto_12620 ) ) ( not ( = ?auto_12612 ?auto_12620 ) ) ( not ( = ?auto_12610 ?auto_12620 ) ) ( not ( = ?auto_12614 ?auto_12620 ) ) ( TRUCK-AT ?auto_12621 ?auto_12619 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12611 ?auto_12612 )
      ( MAKE-2CRATE-VERIFY ?auto_12610 ?auto_12611 ?auto_12612 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12622 - SURFACE
      ?auto_12623 - SURFACE
      ?auto_12624 - SURFACE
      ?auto_12625 - SURFACE
    )
    :vars
    (
      ?auto_12633 - HOIST
      ?auto_12632 - PLACE
      ?auto_12630 - PLACE
      ?auto_12627 - HOIST
      ?auto_12626 - SURFACE
      ?auto_12629 - PLACE
      ?auto_12631 - HOIST
      ?auto_12628 - SURFACE
      ?auto_12634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12633 ?auto_12632 ) ( IS-CRATE ?auto_12625 ) ( not ( = ?auto_12624 ?auto_12625 ) ) ( not ( = ?auto_12623 ?auto_12624 ) ) ( not ( = ?auto_12623 ?auto_12625 ) ) ( not ( = ?auto_12630 ?auto_12632 ) ) ( HOIST-AT ?auto_12627 ?auto_12630 ) ( not ( = ?auto_12633 ?auto_12627 ) ) ( AVAILABLE ?auto_12627 ) ( SURFACE-AT ?auto_12625 ?auto_12630 ) ( ON ?auto_12625 ?auto_12626 ) ( CLEAR ?auto_12625 ) ( not ( = ?auto_12624 ?auto_12626 ) ) ( not ( = ?auto_12625 ?auto_12626 ) ) ( not ( = ?auto_12623 ?auto_12626 ) ) ( SURFACE-AT ?auto_12623 ?auto_12632 ) ( CLEAR ?auto_12623 ) ( IS-CRATE ?auto_12624 ) ( AVAILABLE ?auto_12633 ) ( not ( = ?auto_12629 ?auto_12632 ) ) ( not ( = ?auto_12630 ?auto_12629 ) ) ( HOIST-AT ?auto_12631 ?auto_12629 ) ( not ( = ?auto_12633 ?auto_12631 ) ) ( not ( = ?auto_12627 ?auto_12631 ) ) ( AVAILABLE ?auto_12631 ) ( SURFACE-AT ?auto_12624 ?auto_12629 ) ( ON ?auto_12624 ?auto_12628 ) ( CLEAR ?auto_12624 ) ( not ( = ?auto_12624 ?auto_12628 ) ) ( not ( = ?auto_12625 ?auto_12628 ) ) ( not ( = ?auto_12623 ?auto_12628 ) ) ( not ( = ?auto_12626 ?auto_12628 ) ) ( TRUCK-AT ?auto_12634 ?auto_12632 ) ( ON ?auto_12623 ?auto_12622 ) ( not ( = ?auto_12622 ?auto_12623 ) ) ( not ( = ?auto_12622 ?auto_12624 ) ) ( not ( = ?auto_12622 ?auto_12625 ) ) ( not ( = ?auto_12622 ?auto_12626 ) ) ( not ( = ?auto_12622 ?auto_12628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12623 ?auto_12624 ?auto_12625 )
      ( MAKE-3CRATE-VERIFY ?auto_12622 ?auto_12623 ?auto_12624 ?auto_12625 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12635 - SURFACE
      ?auto_12636 - SURFACE
      ?auto_12637 - SURFACE
      ?auto_12638 - SURFACE
      ?auto_12639 - SURFACE
    )
    :vars
    (
      ?auto_12647 - HOIST
      ?auto_12646 - PLACE
      ?auto_12644 - PLACE
      ?auto_12641 - HOIST
      ?auto_12640 - SURFACE
      ?auto_12643 - PLACE
      ?auto_12645 - HOIST
      ?auto_12642 - SURFACE
      ?auto_12648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12647 ?auto_12646 ) ( IS-CRATE ?auto_12639 ) ( not ( = ?auto_12638 ?auto_12639 ) ) ( not ( = ?auto_12637 ?auto_12638 ) ) ( not ( = ?auto_12637 ?auto_12639 ) ) ( not ( = ?auto_12644 ?auto_12646 ) ) ( HOIST-AT ?auto_12641 ?auto_12644 ) ( not ( = ?auto_12647 ?auto_12641 ) ) ( AVAILABLE ?auto_12641 ) ( SURFACE-AT ?auto_12639 ?auto_12644 ) ( ON ?auto_12639 ?auto_12640 ) ( CLEAR ?auto_12639 ) ( not ( = ?auto_12638 ?auto_12640 ) ) ( not ( = ?auto_12639 ?auto_12640 ) ) ( not ( = ?auto_12637 ?auto_12640 ) ) ( SURFACE-AT ?auto_12637 ?auto_12646 ) ( CLEAR ?auto_12637 ) ( IS-CRATE ?auto_12638 ) ( AVAILABLE ?auto_12647 ) ( not ( = ?auto_12643 ?auto_12646 ) ) ( not ( = ?auto_12644 ?auto_12643 ) ) ( HOIST-AT ?auto_12645 ?auto_12643 ) ( not ( = ?auto_12647 ?auto_12645 ) ) ( not ( = ?auto_12641 ?auto_12645 ) ) ( AVAILABLE ?auto_12645 ) ( SURFACE-AT ?auto_12638 ?auto_12643 ) ( ON ?auto_12638 ?auto_12642 ) ( CLEAR ?auto_12638 ) ( not ( = ?auto_12638 ?auto_12642 ) ) ( not ( = ?auto_12639 ?auto_12642 ) ) ( not ( = ?auto_12637 ?auto_12642 ) ) ( not ( = ?auto_12640 ?auto_12642 ) ) ( TRUCK-AT ?auto_12648 ?auto_12646 ) ( ON ?auto_12636 ?auto_12635 ) ( ON ?auto_12637 ?auto_12636 ) ( not ( = ?auto_12635 ?auto_12636 ) ) ( not ( = ?auto_12635 ?auto_12637 ) ) ( not ( = ?auto_12635 ?auto_12638 ) ) ( not ( = ?auto_12635 ?auto_12639 ) ) ( not ( = ?auto_12635 ?auto_12640 ) ) ( not ( = ?auto_12635 ?auto_12642 ) ) ( not ( = ?auto_12636 ?auto_12637 ) ) ( not ( = ?auto_12636 ?auto_12638 ) ) ( not ( = ?auto_12636 ?auto_12639 ) ) ( not ( = ?auto_12636 ?auto_12640 ) ) ( not ( = ?auto_12636 ?auto_12642 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12637 ?auto_12638 ?auto_12639 )
      ( MAKE-4CRATE-VERIFY ?auto_12635 ?auto_12636 ?auto_12637 ?auto_12638 ?auto_12639 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12649 - SURFACE
      ?auto_12650 - SURFACE
    )
    :vars
    (
      ?auto_12658 - HOIST
      ?auto_12657 - PLACE
      ?auto_12660 - SURFACE
      ?auto_12655 - PLACE
      ?auto_12652 - HOIST
      ?auto_12651 - SURFACE
      ?auto_12654 - PLACE
      ?auto_12656 - HOIST
      ?auto_12653 - SURFACE
      ?auto_12659 - TRUCK
      ?auto_12661 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12658 ?auto_12657 ) ( IS-CRATE ?auto_12650 ) ( not ( = ?auto_12649 ?auto_12650 ) ) ( not ( = ?auto_12660 ?auto_12649 ) ) ( not ( = ?auto_12660 ?auto_12650 ) ) ( not ( = ?auto_12655 ?auto_12657 ) ) ( HOIST-AT ?auto_12652 ?auto_12655 ) ( not ( = ?auto_12658 ?auto_12652 ) ) ( AVAILABLE ?auto_12652 ) ( SURFACE-AT ?auto_12650 ?auto_12655 ) ( ON ?auto_12650 ?auto_12651 ) ( CLEAR ?auto_12650 ) ( not ( = ?auto_12649 ?auto_12651 ) ) ( not ( = ?auto_12650 ?auto_12651 ) ) ( not ( = ?auto_12660 ?auto_12651 ) ) ( IS-CRATE ?auto_12649 ) ( not ( = ?auto_12654 ?auto_12657 ) ) ( not ( = ?auto_12655 ?auto_12654 ) ) ( HOIST-AT ?auto_12656 ?auto_12654 ) ( not ( = ?auto_12658 ?auto_12656 ) ) ( not ( = ?auto_12652 ?auto_12656 ) ) ( AVAILABLE ?auto_12656 ) ( SURFACE-AT ?auto_12649 ?auto_12654 ) ( ON ?auto_12649 ?auto_12653 ) ( CLEAR ?auto_12649 ) ( not ( = ?auto_12649 ?auto_12653 ) ) ( not ( = ?auto_12650 ?auto_12653 ) ) ( not ( = ?auto_12660 ?auto_12653 ) ) ( not ( = ?auto_12651 ?auto_12653 ) ) ( TRUCK-AT ?auto_12659 ?auto_12657 ) ( SURFACE-AT ?auto_12661 ?auto_12657 ) ( CLEAR ?auto_12661 ) ( LIFTING ?auto_12658 ?auto_12660 ) ( IS-CRATE ?auto_12660 ) ( not ( = ?auto_12661 ?auto_12660 ) ) ( not ( = ?auto_12649 ?auto_12661 ) ) ( not ( = ?auto_12650 ?auto_12661 ) ) ( not ( = ?auto_12651 ?auto_12661 ) ) ( not ( = ?auto_12653 ?auto_12661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12661 ?auto_12660 )
      ( MAKE-2CRATE ?auto_12660 ?auto_12649 ?auto_12650 )
      ( MAKE-1CRATE-VERIFY ?auto_12649 ?auto_12650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12662 - SURFACE
      ?auto_12663 - SURFACE
      ?auto_12664 - SURFACE
    )
    :vars
    (
      ?auto_12666 - HOIST
      ?auto_12667 - PLACE
      ?auto_12672 - PLACE
      ?auto_12670 - HOIST
      ?auto_12671 - SURFACE
      ?auto_12674 - PLACE
      ?auto_12665 - HOIST
      ?auto_12673 - SURFACE
      ?auto_12668 - TRUCK
      ?auto_12669 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12666 ?auto_12667 ) ( IS-CRATE ?auto_12664 ) ( not ( = ?auto_12663 ?auto_12664 ) ) ( not ( = ?auto_12662 ?auto_12663 ) ) ( not ( = ?auto_12662 ?auto_12664 ) ) ( not ( = ?auto_12672 ?auto_12667 ) ) ( HOIST-AT ?auto_12670 ?auto_12672 ) ( not ( = ?auto_12666 ?auto_12670 ) ) ( AVAILABLE ?auto_12670 ) ( SURFACE-AT ?auto_12664 ?auto_12672 ) ( ON ?auto_12664 ?auto_12671 ) ( CLEAR ?auto_12664 ) ( not ( = ?auto_12663 ?auto_12671 ) ) ( not ( = ?auto_12664 ?auto_12671 ) ) ( not ( = ?auto_12662 ?auto_12671 ) ) ( IS-CRATE ?auto_12663 ) ( not ( = ?auto_12674 ?auto_12667 ) ) ( not ( = ?auto_12672 ?auto_12674 ) ) ( HOIST-AT ?auto_12665 ?auto_12674 ) ( not ( = ?auto_12666 ?auto_12665 ) ) ( not ( = ?auto_12670 ?auto_12665 ) ) ( AVAILABLE ?auto_12665 ) ( SURFACE-AT ?auto_12663 ?auto_12674 ) ( ON ?auto_12663 ?auto_12673 ) ( CLEAR ?auto_12663 ) ( not ( = ?auto_12663 ?auto_12673 ) ) ( not ( = ?auto_12664 ?auto_12673 ) ) ( not ( = ?auto_12662 ?auto_12673 ) ) ( not ( = ?auto_12671 ?auto_12673 ) ) ( TRUCK-AT ?auto_12668 ?auto_12667 ) ( SURFACE-AT ?auto_12669 ?auto_12667 ) ( CLEAR ?auto_12669 ) ( LIFTING ?auto_12666 ?auto_12662 ) ( IS-CRATE ?auto_12662 ) ( not ( = ?auto_12669 ?auto_12662 ) ) ( not ( = ?auto_12663 ?auto_12669 ) ) ( not ( = ?auto_12664 ?auto_12669 ) ) ( not ( = ?auto_12671 ?auto_12669 ) ) ( not ( = ?auto_12673 ?auto_12669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12663 ?auto_12664 )
      ( MAKE-2CRATE-VERIFY ?auto_12662 ?auto_12663 ?auto_12664 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12675 - SURFACE
      ?auto_12676 - SURFACE
      ?auto_12677 - SURFACE
      ?auto_12678 - SURFACE
    )
    :vars
    (
      ?auto_12687 - HOIST
      ?auto_12685 - PLACE
      ?auto_12683 - PLACE
      ?auto_12686 - HOIST
      ?auto_12679 - SURFACE
      ?auto_12684 - PLACE
      ?auto_12682 - HOIST
      ?auto_12681 - SURFACE
      ?auto_12680 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12687 ?auto_12685 ) ( IS-CRATE ?auto_12678 ) ( not ( = ?auto_12677 ?auto_12678 ) ) ( not ( = ?auto_12676 ?auto_12677 ) ) ( not ( = ?auto_12676 ?auto_12678 ) ) ( not ( = ?auto_12683 ?auto_12685 ) ) ( HOIST-AT ?auto_12686 ?auto_12683 ) ( not ( = ?auto_12687 ?auto_12686 ) ) ( AVAILABLE ?auto_12686 ) ( SURFACE-AT ?auto_12678 ?auto_12683 ) ( ON ?auto_12678 ?auto_12679 ) ( CLEAR ?auto_12678 ) ( not ( = ?auto_12677 ?auto_12679 ) ) ( not ( = ?auto_12678 ?auto_12679 ) ) ( not ( = ?auto_12676 ?auto_12679 ) ) ( IS-CRATE ?auto_12677 ) ( not ( = ?auto_12684 ?auto_12685 ) ) ( not ( = ?auto_12683 ?auto_12684 ) ) ( HOIST-AT ?auto_12682 ?auto_12684 ) ( not ( = ?auto_12687 ?auto_12682 ) ) ( not ( = ?auto_12686 ?auto_12682 ) ) ( AVAILABLE ?auto_12682 ) ( SURFACE-AT ?auto_12677 ?auto_12684 ) ( ON ?auto_12677 ?auto_12681 ) ( CLEAR ?auto_12677 ) ( not ( = ?auto_12677 ?auto_12681 ) ) ( not ( = ?auto_12678 ?auto_12681 ) ) ( not ( = ?auto_12676 ?auto_12681 ) ) ( not ( = ?auto_12679 ?auto_12681 ) ) ( TRUCK-AT ?auto_12680 ?auto_12685 ) ( SURFACE-AT ?auto_12675 ?auto_12685 ) ( CLEAR ?auto_12675 ) ( LIFTING ?auto_12687 ?auto_12676 ) ( IS-CRATE ?auto_12676 ) ( not ( = ?auto_12675 ?auto_12676 ) ) ( not ( = ?auto_12677 ?auto_12675 ) ) ( not ( = ?auto_12678 ?auto_12675 ) ) ( not ( = ?auto_12679 ?auto_12675 ) ) ( not ( = ?auto_12681 ?auto_12675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12676 ?auto_12677 ?auto_12678 )
      ( MAKE-3CRATE-VERIFY ?auto_12675 ?auto_12676 ?auto_12677 ?auto_12678 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12688 - SURFACE
      ?auto_12689 - SURFACE
      ?auto_12690 - SURFACE
      ?auto_12691 - SURFACE
      ?auto_12692 - SURFACE
    )
    :vars
    (
      ?auto_12701 - HOIST
      ?auto_12699 - PLACE
      ?auto_12697 - PLACE
      ?auto_12700 - HOIST
      ?auto_12693 - SURFACE
      ?auto_12698 - PLACE
      ?auto_12696 - HOIST
      ?auto_12695 - SURFACE
      ?auto_12694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12701 ?auto_12699 ) ( IS-CRATE ?auto_12692 ) ( not ( = ?auto_12691 ?auto_12692 ) ) ( not ( = ?auto_12690 ?auto_12691 ) ) ( not ( = ?auto_12690 ?auto_12692 ) ) ( not ( = ?auto_12697 ?auto_12699 ) ) ( HOIST-AT ?auto_12700 ?auto_12697 ) ( not ( = ?auto_12701 ?auto_12700 ) ) ( AVAILABLE ?auto_12700 ) ( SURFACE-AT ?auto_12692 ?auto_12697 ) ( ON ?auto_12692 ?auto_12693 ) ( CLEAR ?auto_12692 ) ( not ( = ?auto_12691 ?auto_12693 ) ) ( not ( = ?auto_12692 ?auto_12693 ) ) ( not ( = ?auto_12690 ?auto_12693 ) ) ( IS-CRATE ?auto_12691 ) ( not ( = ?auto_12698 ?auto_12699 ) ) ( not ( = ?auto_12697 ?auto_12698 ) ) ( HOIST-AT ?auto_12696 ?auto_12698 ) ( not ( = ?auto_12701 ?auto_12696 ) ) ( not ( = ?auto_12700 ?auto_12696 ) ) ( AVAILABLE ?auto_12696 ) ( SURFACE-AT ?auto_12691 ?auto_12698 ) ( ON ?auto_12691 ?auto_12695 ) ( CLEAR ?auto_12691 ) ( not ( = ?auto_12691 ?auto_12695 ) ) ( not ( = ?auto_12692 ?auto_12695 ) ) ( not ( = ?auto_12690 ?auto_12695 ) ) ( not ( = ?auto_12693 ?auto_12695 ) ) ( TRUCK-AT ?auto_12694 ?auto_12699 ) ( SURFACE-AT ?auto_12689 ?auto_12699 ) ( CLEAR ?auto_12689 ) ( LIFTING ?auto_12701 ?auto_12690 ) ( IS-CRATE ?auto_12690 ) ( not ( = ?auto_12689 ?auto_12690 ) ) ( not ( = ?auto_12691 ?auto_12689 ) ) ( not ( = ?auto_12692 ?auto_12689 ) ) ( not ( = ?auto_12693 ?auto_12689 ) ) ( not ( = ?auto_12695 ?auto_12689 ) ) ( ON ?auto_12689 ?auto_12688 ) ( not ( = ?auto_12688 ?auto_12689 ) ) ( not ( = ?auto_12688 ?auto_12690 ) ) ( not ( = ?auto_12688 ?auto_12691 ) ) ( not ( = ?auto_12688 ?auto_12692 ) ) ( not ( = ?auto_12688 ?auto_12693 ) ) ( not ( = ?auto_12688 ?auto_12695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12690 ?auto_12691 ?auto_12692 )
      ( MAKE-4CRATE-VERIFY ?auto_12688 ?auto_12689 ?auto_12690 ?auto_12691 ?auto_12692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12702 - SURFACE
      ?auto_12703 - SURFACE
    )
    :vars
    (
      ?auto_12713 - HOIST
      ?auto_12710 - PLACE
      ?auto_12712 - SURFACE
      ?auto_12708 - PLACE
      ?auto_12711 - HOIST
      ?auto_12704 - SURFACE
      ?auto_12709 - PLACE
      ?auto_12707 - HOIST
      ?auto_12706 - SURFACE
      ?auto_12705 - TRUCK
      ?auto_12714 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12713 ?auto_12710 ) ( IS-CRATE ?auto_12703 ) ( not ( = ?auto_12702 ?auto_12703 ) ) ( not ( = ?auto_12712 ?auto_12702 ) ) ( not ( = ?auto_12712 ?auto_12703 ) ) ( not ( = ?auto_12708 ?auto_12710 ) ) ( HOIST-AT ?auto_12711 ?auto_12708 ) ( not ( = ?auto_12713 ?auto_12711 ) ) ( AVAILABLE ?auto_12711 ) ( SURFACE-AT ?auto_12703 ?auto_12708 ) ( ON ?auto_12703 ?auto_12704 ) ( CLEAR ?auto_12703 ) ( not ( = ?auto_12702 ?auto_12704 ) ) ( not ( = ?auto_12703 ?auto_12704 ) ) ( not ( = ?auto_12712 ?auto_12704 ) ) ( IS-CRATE ?auto_12702 ) ( not ( = ?auto_12709 ?auto_12710 ) ) ( not ( = ?auto_12708 ?auto_12709 ) ) ( HOIST-AT ?auto_12707 ?auto_12709 ) ( not ( = ?auto_12713 ?auto_12707 ) ) ( not ( = ?auto_12711 ?auto_12707 ) ) ( AVAILABLE ?auto_12707 ) ( SURFACE-AT ?auto_12702 ?auto_12709 ) ( ON ?auto_12702 ?auto_12706 ) ( CLEAR ?auto_12702 ) ( not ( = ?auto_12702 ?auto_12706 ) ) ( not ( = ?auto_12703 ?auto_12706 ) ) ( not ( = ?auto_12712 ?auto_12706 ) ) ( not ( = ?auto_12704 ?auto_12706 ) ) ( TRUCK-AT ?auto_12705 ?auto_12710 ) ( SURFACE-AT ?auto_12714 ?auto_12710 ) ( CLEAR ?auto_12714 ) ( IS-CRATE ?auto_12712 ) ( not ( = ?auto_12714 ?auto_12712 ) ) ( not ( = ?auto_12702 ?auto_12714 ) ) ( not ( = ?auto_12703 ?auto_12714 ) ) ( not ( = ?auto_12704 ?auto_12714 ) ) ( not ( = ?auto_12706 ?auto_12714 ) ) ( AVAILABLE ?auto_12713 ) ( IN ?auto_12712 ?auto_12705 ) )
    :subtasks
    ( ( !UNLOAD ?auto_12713 ?auto_12712 ?auto_12705 ?auto_12710 )
      ( MAKE-2CRATE ?auto_12712 ?auto_12702 ?auto_12703 )
      ( MAKE-1CRATE-VERIFY ?auto_12702 ?auto_12703 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12715 - SURFACE
      ?auto_12716 - SURFACE
      ?auto_12717 - SURFACE
    )
    :vars
    (
      ?auto_12722 - HOIST
      ?auto_12726 - PLACE
      ?auto_12724 - PLACE
      ?auto_12720 - HOIST
      ?auto_12719 - SURFACE
      ?auto_12718 - PLACE
      ?auto_12725 - HOIST
      ?auto_12727 - SURFACE
      ?auto_12723 - TRUCK
      ?auto_12721 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12722 ?auto_12726 ) ( IS-CRATE ?auto_12717 ) ( not ( = ?auto_12716 ?auto_12717 ) ) ( not ( = ?auto_12715 ?auto_12716 ) ) ( not ( = ?auto_12715 ?auto_12717 ) ) ( not ( = ?auto_12724 ?auto_12726 ) ) ( HOIST-AT ?auto_12720 ?auto_12724 ) ( not ( = ?auto_12722 ?auto_12720 ) ) ( AVAILABLE ?auto_12720 ) ( SURFACE-AT ?auto_12717 ?auto_12724 ) ( ON ?auto_12717 ?auto_12719 ) ( CLEAR ?auto_12717 ) ( not ( = ?auto_12716 ?auto_12719 ) ) ( not ( = ?auto_12717 ?auto_12719 ) ) ( not ( = ?auto_12715 ?auto_12719 ) ) ( IS-CRATE ?auto_12716 ) ( not ( = ?auto_12718 ?auto_12726 ) ) ( not ( = ?auto_12724 ?auto_12718 ) ) ( HOIST-AT ?auto_12725 ?auto_12718 ) ( not ( = ?auto_12722 ?auto_12725 ) ) ( not ( = ?auto_12720 ?auto_12725 ) ) ( AVAILABLE ?auto_12725 ) ( SURFACE-AT ?auto_12716 ?auto_12718 ) ( ON ?auto_12716 ?auto_12727 ) ( CLEAR ?auto_12716 ) ( not ( = ?auto_12716 ?auto_12727 ) ) ( not ( = ?auto_12717 ?auto_12727 ) ) ( not ( = ?auto_12715 ?auto_12727 ) ) ( not ( = ?auto_12719 ?auto_12727 ) ) ( TRUCK-AT ?auto_12723 ?auto_12726 ) ( SURFACE-AT ?auto_12721 ?auto_12726 ) ( CLEAR ?auto_12721 ) ( IS-CRATE ?auto_12715 ) ( not ( = ?auto_12721 ?auto_12715 ) ) ( not ( = ?auto_12716 ?auto_12721 ) ) ( not ( = ?auto_12717 ?auto_12721 ) ) ( not ( = ?auto_12719 ?auto_12721 ) ) ( not ( = ?auto_12727 ?auto_12721 ) ) ( AVAILABLE ?auto_12722 ) ( IN ?auto_12715 ?auto_12723 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12716 ?auto_12717 )
      ( MAKE-2CRATE-VERIFY ?auto_12715 ?auto_12716 ?auto_12717 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12728 - SURFACE
      ?auto_12729 - SURFACE
      ?auto_12730 - SURFACE
      ?auto_12731 - SURFACE
    )
    :vars
    (
      ?auto_12738 - HOIST
      ?auto_12732 - PLACE
      ?auto_12734 - PLACE
      ?auto_12733 - HOIST
      ?auto_12736 - SURFACE
      ?auto_12739 - PLACE
      ?auto_12740 - HOIST
      ?auto_12737 - SURFACE
      ?auto_12735 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12738 ?auto_12732 ) ( IS-CRATE ?auto_12731 ) ( not ( = ?auto_12730 ?auto_12731 ) ) ( not ( = ?auto_12729 ?auto_12730 ) ) ( not ( = ?auto_12729 ?auto_12731 ) ) ( not ( = ?auto_12734 ?auto_12732 ) ) ( HOIST-AT ?auto_12733 ?auto_12734 ) ( not ( = ?auto_12738 ?auto_12733 ) ) ( AVAILABLE ?auto_12733 ) ( SURFACE-AT ?auto_12731 ?auto_12734 ) ( ON ?auto_12731 ?auto_12736 ) ( CLEAR ?auto_12731 ) ( not ( = ?auto_12730 ?auto_12736 ) ) ( not ( = ?auto_12731 ?auto_12736 ) ) ( not ( = ?auto_12729 ?auto_12736 ) ) ( IS-CRATE ?auto_12730 ) ( not ( = ?auto_12739 ?auto_12732 ) ) ( not ( = ?auto_12734 ?auto_12739 ) ) ( HOIST-AT ?auto_12740 ?auto_12739 ) ( not ( = ?auto_12738 ?auto_12740 ) ) ( not ( = ?auto_12733 ?auto_12740 ) ) ( AVAILABLE ?auto_12740 ) ( SURFACE-AT ?auto_12730 ?auto_12739 ) ( ON ?auto_12730 ?auto_12737 ) ( CLEAR ?auto_12730 ) ( not ( = ?auto_12730 ?auto_12737 ) ) ( not ( = ?auto_12731 ?auto_12737 ) ) ( not ( = ?auto_12729 ?auto_12737 ) ) ( not ( = ?auto_12736 ?auto_12737 ) ) ( TRUCK-AT ?auto_12735 ?auto_12732 ) ( SURFACE-AT ?auto_12728 ?auto_12732 ) ( CLEAR ?auto_12728 ) ( IS-CRATE ?auto_12729 ) ( not ( = ?auto_12728 ?auto_12729 ) ) ( not ( = ?auto_12730 ?auto_12728 ) ) ( not ( = ?auto_12731 ?auto_12728 ) ) ( not ( = ?auto_12736 ?auto_12728 ) ) ( not ( = ?auto_12737 ?auto_12728 ) ) ( AVAILABLE ?auto_12738 ) ( IN ?auto_12729 ?auto_12735 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12729 ?auto_12730 ?auto_12731 )
      ( MAKE-3CRATE-VERIFY ?auto_12728 ?auto_12729 ?auto_12730 ?auto_12731 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12741 - SURFACE
      ?auto_12742 - SURFACE
      ?auto_12743 - SURFACE
      ?auto_12744 - SURFACE
      ?auto_12745 - SURFACE
    )
    :vars
    (
      ?auto_12752 - HOIST
      ?auto_12746 - PLACE
      ?auto_12748 - PLACE
      ?auto_12747 - HOIST
      ?auto_12750 - SURFACE
      ?auto_12753 - PLACE
      ?auto_12754 - HOIST
      ?auto_12751 - SURFACE
      ?auto_12749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12752 ?auto_12746 ) ( IS-CRATE ?auto_12745 ) ( not ( = ?auto_12744 ?auto_12745 ) ) ( not ( = ?auto_12743 ?auto_12744 ) ) ( not ( = ?auto_12743 ?auto_12745 ) ) ( not ( = ?auto_12748 ?auto_12746 ) ) ( HOIST-AT ?auto_12747 ?auto_12748 ) ( not ( = ?auto_12752 ?auto_12747 ) ) ( AVAILABLE ?auto_12747 ) ( SURFACE-AT ?auto_12745 ?auto_12748 ) ( ON ?auto_12745 ?auto_12750 ) ( CLEAR ?auto_12745 ) ( not ( = ?auto_12744 ?auto_12750 ) ) ( not ( = ?auto_12745 ?auto_12750 ) ) ( not ( = ?auto_12743 ?auto_12750 ) ) ( IS-CRATE ?auto_12744 ) ( not ( = ?auto_12753 ?auto_12746 ) ) ( not ( = ?auto_12748 ?auto_12753 ) ) ( HOIST-AT ?auto_12754 ?auto_12753 ) ( not ( = ?auto_12752 ?auto_12754 ) ) ( not ( = ?auto_12747 ?auto_12754 ) ) ( AVAILABLE ?auto_12754 ) ( SURFACE-AT ?auto_12744 ?auto_12753 ) ( ON ?auto_12744 ?auto_12751 ) ( CLEAR ?auto_12744 ) ( not ( = ?auto_12744 ?auto_12751 ) ) ( not ( = ?auto_12745 ?auto_12751 ) ) ( not ( = ?auto_12743 ?auto_12751 ) ) ( not ( = ?auto_12750 ?auto_12751 ) ) ( TRUCK-AT ?auto_12749 ?auto_12746 ) ( SURFACE-AT ?auto_12742 ?auto_12746 ) ( CLEAR ?auto_12742 ) ( IS-CRATE ?auto_12743 ) ( not ( = ?auto_12742 ?auto_12743 ) ) ( not ( = ?auto_12744 ?auto_12742 ) ) ( not ( = ?auto_12745 ?auto_12742 ) ) ( not ( = ?auto_12750 ?auto_12742 ) ) ( not ( = ?auto_12751 ?auto_12742 ) ) ( AVAILABLE ?auto_12752 ) ( IN ?auto_12743 ?auto_12749 ) ( ON ?auto_12742 ?auto_12741 ) ( not ( = ?auto_12741 ?auto_12742 ) ) ( not ( = ?auto_12741 ?auto_12743 ) ) ( not ( = ?auto_12741 ?auto_12744 ) ) ( not ( = ?auto_12741 ?auto_12745 ) ) ( not ( = ?auto_12741 ?auto_12750 ) ) ( not ( = ?auto_12741 ?auto_12751 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12743 ?auto_12744 ?auto_12745 )
      ( MAKE-4CRATE-VERIFY ?auto_12741 ?auto_12742 ?auto_12743 ?auto_12744 ?auto_12745 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12755 - SURFACE
      ?auto_12756 - SURFACE
    )
    :vars
    (
      ?auto_12765 - HOIST
      ?auto_12757 - PLACE
      ?auto_12758 - SURFACE
      ?auto_12761 - PLACE
      ?auto_12759 - HOIST
      ?auto_12763 - SURFACE
      ?auto_12766 - PLACE
      ?auto_12767 - HOIST
      ?auto_12764 - SURFACE
      ?auto_12760 - SURFACE
      ?auto_12762 - TRUCK
      ?auto_12768 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12765 ?auto_12757 ) ( IS-CRATE ?auto_12756 ) ( not ( = ?auto_12755 ?auto_12756 ) ) ( not ( = ?auto_12758 ?auto_12755 ) ) ( not ( = ?auto_12758 ?auto_12756 ) ) ( not ( = ?auto_12761 ?auto_12757 ) ) ( HOIST-AT ?auto_12759 ?auto_12761 ) ( not ( = ?auto_12765 ?auto_12759 ) ) ( AVAILABLE ?auto_12759 ) ( SURFACE-AT ?auto_12756 ?auto_12761 ) ( ON ?auto_12756 ?auto_12763 ) ( CLEAR ?auto_12756 ) ( not ( = ?auto_12755 ?auto_12763 ) ) ( not ( = ?auto_12756 ?auto_12763 ) ) ( not ( = ?auto_12758 ?auto_12763 ) ) ( IS-CRATE ?auto_12755 ) ( not ( = ?auto_12766 ?auto_12757 ) ) ( not ( = ?auto_12761 ?auto_12766 ) ) ( HOIST-AT ?auto_12767 ?auto_12766 ) ( not ( = ?auto_12765 ?auto_12767 ) ) ( not ( = ?auto_12759 ?auto_12767 ) ) ( AVAILABLE ?auto_12767 ) ( SURFACE-AT ?auto_12755 ?auto_12766 ) ( ON ?auto_12755 ?auto_12764 ) ( CLEAR ?auto_12755 ) ( not ( = ?auto_12755 ?auto_12764 ) ) ( not ( = ?auto_12756 ?auto_12764 ) ) ( not ( = ?auto_12758 ?auto_12764 ) ) ( not ( = ?auto_12763 ?auto_12764 ) ) ( SURFACE-AT ?auto_12760 ?auto_12757 ) ( CLEAR ?auto_12760 ) ( IS-CRATE ?auto_12758 ) ( not ( = ?auto_12760 ?auto_12758 ) ) ( not ( = ?auto_12755 ?auto_12760 ) ) ( not ( = ?auto_12756 ?auto_12760 ) ) ( not ( = ?auto_12763 ?auto_12760 ) ) ( not ( = ?auto_12764 ?auto_12760 ) ) ( AVAILABLE ?auto_12765 ) ( IN ?auto_12758 ?auto_12762 ) ( TRUCK-AT ?auto_12762 ?auto_12768 ) ( not ( = ?auto_12768 ?auto_12757 ) ) ( not ( = ?auto_12761 ?auto_12768 ) ) ( not ( = ?auto_12766 ?auto_12768 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_12762 ?auto_12768 ?auto_12757 )
      ( MAKE-2CRATE ?auto_12758 ?auto_12755 ?auto_12756 )
      ( MAKE-1CRATE-VERIFY ?auto_12755 ?auto_12756 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12769 - SURFACE
      ?auto_12770 - SURFACE
      ?auto_12771 - SURFACE
    )
    :vars
    (
      ?auto_12775 - HOIST
      ?auto_12778 - PLACE
      ?auto_12774 - PLACE
      ?auto_12772 - HOIST
      ?auto_12782 - SURFACE
      ?auto_12773 - PLACE
      ?auto_12777 - HOIST
      ?auto_12780 - SURFACE
      ?auto_12779 - SURFACE
      ?auto_12781 - TRUCK
      ?auto_12776 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12775 ?auto_12778 ) ( IS-CRATE ?auto_12771 ) ( not ( = ?auto_12770 ?auto_12771 ) ) ( not ( = ?auto_12769 ?auto_12770 ) ) ( not ( = ?auto_12769 ?auto_12771 ) ) ( not ( = ?auto_12774 ?auto_12778 ) ) ( HOIST-AT ?auto_12772 ?auto_12774 ) ( not ( = ?auto_12775 ?auto_12772 ) ) ( AVAILABLE ?auto_12772 ) ( SURFACE-AT ?auto_12771 ?auto_12774 ) ( ON ?auto_12771 ?auto_12782 ) ( CLEAR ?auto_12771 ) ( not ( = ?auto_12770 ?auto_12782 ) ) ( not ( = ?auto_12771 ?auto_12782 ) ) ( not ( = ?auto_12769 ?auto_12782 ) ) ( IS-CRATE ?auto_12770 ) ( not ( = ?auto_12773 ?auto_12778 ) ) ( not ( = ?auto_12774 ?auto_12773 ) ) ( HOIST-AT ?auto_12777 ?auto_12773 ) ( not ( = ?auto_12775 ?auto_12777 ) ) ( not ( = ?auto_12772 ?auto_12777 ) ) ( AVAILABLE ?auto_12777 ) ( SURFACE-AT ?auto_12770 ?auto_12773 ) ( ON ?auto_12770 ?auto_12780 ) ( CLEAR ?auto_12770 ) ( not ( = ?auto_12770 ?auto_12780 ) ) ( not ( = ?auto_12771 ?auto_12780 ) ) ( not ( = ?auto_12769 ?auto_12780 ) ) ( not ( = ?auto_12782 ?auto_12780 ) ) ( SURFACE-AT ?auto_12779 ?auto_12778 ) ( CLEAR ?auto_12779 ) ( IS-CRATE ?auto_12769 ) ( not ( = ?auto_12779 ?auto_12769 ) ) ( not ( = ?auto_12770 ?auto_12779 ) ) ( not ( = ?auto_12771 ?auto_12779 ) ) ( not ( = ?auto_12782 ?auto_12779 ) ) ( not ( = ?auto_12780 ?auto_12779 ) ) ( AVAILABLE ?auto_12775 ) ( IN ?auto_12769 ?auto_12781 ) ( TRUCK-AT ?auto_12781 ?auto_12776 ) ( not ( = ?auto_12776 ?auto_12778 ) ) ( not ( = ?auto_12774 ?auto_12776 ) ) ( not ( = ?auto_12773 ?auto_12776 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12770 ?auto_12771 )
      ( MAKE-2CRATE-VERIFY ?auto_12769 ?auto_12770 ?auto_12771 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12783 - SURFACE
      ?auto_12784 - SURFACE
      ?auto_12785 - SURFACE
      ?auto_12786 - SURFACE
    )
    :vars
    (
      ?auto_12795 - HOIST
      ?auto_12788 - PLACE
      ?auto_12790 - PLACE
      ?auto_12796 - HOIST
      ?auto_12794 - SURFACE
      ?auto_12792 - PLACE
      ?auto_12789 - HOIST
      ?auto_12793 - SURFACE
      ?auto_12791 - TRUCK
      ?auto_12787 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12795 ?auto_12788 ) ( IS-CRATE ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12786 ) ) ( not ( = ?auto_12784 ?auto_12785 ) ) ( not ( = ?auto_12784 ?auto_12786 ) ) ( not ( = ?auto_12790 ?auto_12788 ) ) ( HOIST-AT ?auto_12796 ?auto_12790 ) ( not ( = ?auto_12795 ?auto_12796 ) ) ( AVAILABLE ?auto_12796 ) ( SURFACE-AT ?auto_12786 ?auto_12790 ) ( ON ?auto_12786 ?auto_12794 ) ( CLEAR ?auto_12786 ) ( not ( = ?auto_12785 ?auto_12794 ) ) ( not ( = ?auto_12786 ?auto_12794 ) ) ( not ( = ?auto_12784 ?auto_12794 ) ) ( IS-CRATE ?auto_12785 ) ( not ( = ?auto_12792 ?auto_12788 ) ) ( not ( = ?auto_12790 ?auto_12792 ) ) ( HOIST-AT ?auto_12789 ?auto_12792 ) ( not ( = ?auto_12795 ?auto_12789 ) ) ( not ( = ?auto_12796 ?auto_12789 ) ) ( AVAILABLE ?auto_12789 ) ( SURFACE-AT ?auto_12785 ?auto_12792 ) ( ON ?auto_12785 ?auto_12793 ) ( CLEAR ?auto_12785 ) ( not ( = ?auto_12785 ?auto_12793 ) ) ( not ( = ?auto_12786 ?auto_12793 ) ) ( not ( = ?auto_12784 ?auto_12793 ) ) ( not ( = ?auto_12794 ?auto_12793 ) ) ( SURFACE-AT ?auto_12783 ?auto_12788 ) ( CLEAR ?auto_12783 ) ( IS-CRATE ?auto_12784 ) ( not ( = ?auto_12783 ?auto_12784 ) ) ( not ( = ?auto_12785 ?auto_12783 ) ) ( not ( = ?auto_12786 ?auto_12783 ) ) ( not ( = ?auto_12794 ?auto_12783 ) ) ( not ( = ?auto_12793 ?auto_12783 ) ) ( AVAILABLE ?auto_12795 ) ( IN ?auto_12784 ?auto_12791 ) ( TRUCK-AT ?auto_12791 ?auto_12787 ) ( not ( = ?auto_12787 ?auto_12788 ) ) ( not ( = ?auto_12790 ?auto_12787 ) ) ( not ( = ?auto_12792 ?auto_12787 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12784 ?auto_12785 ?auto_12786 )
      ( MAKE-3CRATE-VERIFY ?auto_12783 ?auto_12784 ?auto_12785 ?auto_12786 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12797 - SURFACE
      ?auto_12798 - SURFACE
      ?auto_12799 - SURFACE
      ?auto_12800 - SURFACE
      ?auto_12801 - SURFACE
    )
    :vars
    (
      ?auto_12810 - HOIST
      ?auto_12803 - PLACE
      ?auto_12805 - PLACE
      ?auto_12811 - HOIST
      ?auto_12809 - SURFACE
      ?auto_12807 - PLACE
      ?auto_12804 - HOIST
      ?auto_12808 - SURFACE
      ?auto_12806 - TRUCK
      ?auto_12802 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12810 ?auto_12803 ) ( IS-CRATE ?auto_12801 ) ( not ( = ?auto_12800 ?auto_12801 ) ) ( not ( = ?auto_12799 ?auto_12800 ) ) ( not ( = ?auto_12799 ?auto_12801 ) ) ( not ( = ?auto_12805 ?auto_12803 ) ) ( HOIST-AT ?auto_12811 ?auto_12805 ) ( not ( = ?auto_12810 ?auto_12811 ) ) ( AVAILABLE ?auto_12811 ) ( SURFACE-AT ?auto_12801 ?auto_12805 ) ( ON ?auto_12801 ?auto_12809 ) ( CLEAR ?auto_12801 ) ( not ( = ?auto_12800 ?auto_12809 ) ) ( not ( = ?auto_12801 ?auto_12809 ) ) ( not ( = ?auto_12799 ?auto_12809 ) ) ( IS-CRATE ?auto_12800 ) ( not ( = ?auto_12807 ?auto_12803 ) ) ( not ( = ?auto_12805 ?auto_12807 ) ) ( HOIST-AT ?auto_12804 ?auto_12807 ) ( not ( = ?auto_12810 ?auto_12804 ) ) ( not ( = ?auto_12811 ?auto_12804 ) ) ( AVAILABLE ?auto_12804 ) ( SURFACE-AT ?auto_12800 ?auto_12807 ) ( ON ?auto_12800 ?auto_12808 ) ( CLEAR ?auto_12800 ) ( not ( = ?auto_12800 ?auto_12808 ) ) ( not ( = ?auto_12801 ?auto_12808 ) ) ( not ( = ?auto_12799 ?auto_12808 ) ) ( not ( = ?auto_12809 ?auto_12808 ) ) ( SURFACE-AT ?auto_12798 ?auto_12803 ) ( CLEAR ?auto_12798 ) ( IS-CRATE ?auto_12799 ) ( not ( = ?auto_12798 ?auto_12799 ) ) ( not ( = ?auto_12800 ?auto_12798 ) ) ( not ( = ?auto_12801 ?auto_12798 ) ) ( not ( = ?auto_12809 ?auto_12798 ) ) ( not ( = ?auto_12808 ?auto_12798 ) ) ( AVAILABLE ?auto_12810 ) ( IN ?auto_12799 ?auto_12806 ) ( TRUCK-AT ?auto_12806 ?auto_12802 ) ( not ( = ?auto_12802 ?auto_12803 ) ) ( not ( = ?auto_12805 ?auto_12802 ) ) ( not ( = ?auto_12807 ?auto_12802 ) ) ( ON ?auto_12798 ?auto_12797 ) ( not ( = ?auto_12797 ?auto_12798 ) ) ( not ( = ?auto_12797 ?auto_12799 ) ) ( not ( = ?auto_12797 ?auto_12800 ) ) ( not ( = ?auto_12797 ?auto_12801 ) ) ( not ( = ?auto_12797 ?auto_12809 ) ) ( not ( = ?auto_12797 ?auto_12808 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12799 ?auto_12800 ?auto_12801 )
      ( MAKE-4CRATE-VERIFY ?auto_12797 ?auto_12798 ?auto_12799 ?auto_12800 ?auto_12801 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12812 - SURFACE
      ?auto_12813 - SURFACE
    )
    :vars
    (
      ?auto_12823 - HOIST
      ?auto_12815 - PLACE
      ?auto_12817 - SURFACE
      ?auto_12818 - PLACE
      ?auto_12825 - HOIST
      ?auto_12822 - SURFACE
      ?auto_12820 - PLACE
      ?auto_12816 - HOIST
      ?auto_12821 - SURFACE
      ?auto_12824 - SURFACE
      ?auto_12819 - TRUCK
      ?auto_12814 - PLACE
      ?auto_12826 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12823 ?auto_12815 ) ( IS-CRATE ?auto_12813 ) ( not ( = ?auto_12812 ?auto_12813 ) ) ( not ( = ?auto_12817 ?auto_12812 ) ) ( not ( = ?auto_12817 ?auto_12813 ) ) ( not ( = ?auto_12818 ?auto_12815 ) ) ( HOIST-AT ?auto_12825 ?auto_12818 ) ( not ( = ?auto_12823 ?auto_12825 ) ) ( AVAILABLE ?auto_12825 ) ( SURFACE-AT ?auto_12813 ?auto_12818 ) ( ON ?auto_12813 ?auto_12822 ) ( CLEAR ?auto_12813 ) ( not ( = ?auto_12812 ?auto_12822 ) ) ( not ( = ?auto_12813 ?auto_12822 ) ) ( not ( = ?auto_12817 ?auto_12822 ) ) ( IS-CRATE ?auto_12812 ) ( not ( = ?auto_12820 ?auto_12815 ) ) ( not ( = ?auto_12818 ?auto_12820 ) ) ( HOIST-AT ?auto_12816 ?auto_12820 ) ( not ( = ?auto_12823 ?auto_12816 ) ) ( not ( = ?auto_12825 ?auto_12816 ) ) ( AVAILABLE ?auto_12816 ) ( SURFACE-AT ?auto_12812 ?auto_12820 ) ( ON ?auto_12812 ?auto_12821 ) ( CLEAR ?auto_12812 ) ( not ( = ?auto_12812 ?auto_12821 ) ) ( not ( = ?auto_12813 ?auto_12821 ) ) ( not ( = ?auto_12817 ?auto_12821 ) ) ( not ( = ?auto_12822 ?auto_12821 ) ) ( SURFACE-AT ?auto_12824 ?auto_12815 ) ( CLEAR ?auto_12824 ) ( IS-CRATE ?auto_12817 ) ( not ( = ?auto_12824 ?auto_12817 ) ) ( not ( = ?auto_12812 ?auto_12824 ) ) ( not ( = ?auto_12813 ?auto_12824 ) ) ( not ( = ?auto_12822 ?auto_12824 ) ) ( not ( = ?auto_12821 ?auto_12824 ) ) ( AVAILABLE ?auto_12823 ) ( TRUCK-AT ?auto_12819 ?auto_12814 ) ( not ( = ?auto_12814 ?auto_12815 ) ) ( not ( = ?auto_12818 ?auto_12814 ) ) ( not ( = ?auto_12820 ?auto_12814 ) ) ( HOIST-AT ?auto_12826 ?auto_12814 ) ( LIFTING ?auto_12826 ?auto_12817 ) ( not ( = ?auto_12823 ?auto_12826 ) ) ( not ( = ?auto_12825 ?auto_12826 ) ) ( not ( = ?auto_12816 ?auto_12826 ) ) )
    :subtasks
    ( ( !LOAD ?auto_12826 ?auto_12817 ?auto_12819 ?auto_12814 )
      ( MAKE-2CRATE ?auto_12817 ?auto_12812 ?auto_12813 )
      ( MAKE-1CRATE-VERIFY ?auto_12812 ?auto_12813 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12827 - SURFACE
      ?auto_12828 - SURFACE
      ?auto_12829 - SURFACE
    )
    :vars
    (
      ?auto_12837 - HOIST
      ?auto_12834 - PLACE
      ?auto_12831 - PLACE
      ?auto_12836 - HOIST
      ?auto_12838 - SURFACE
      ?auto_12840 - PLACE
      ?auto_12832 - HOIST
      ?auto_12841 - SURFACE
      ?auto_12833 - SURFACE
      ?auto_12839 - TRUCK
      ?auto_12830 - PLACE
      ?auto_12835 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12837 ?auto_12834 ) ( IS-CRATE ?auto_12829 ) ( not ( = ?auto_12828 ?auto_12829 ) ) ( not ( = ?auto_12827 ?auto_12828 ) ) ( not ( = ?auto_12827 ?auto_12829 ) ) ( not ( = ?auto_12831 ?auto_12834 ) ) ( HOIST-AT ?auto_12836 ?auto_12831 ) ( not ( = ?auto_12837 ?auto_12836 ) ) ( AVAILABLE ?auto_12836 ) ( SURFACE-AT ?auto_12829 ?auto_12831 ) ( ON ?auto_12829 ?auto_12838 ) ( CLEAR ?auto_12829 ) ( not ( = ?auto_12828 ?auto_12838 ) ) ( not ( = ?auto_12829 ?auto_12838 ) ) ( not ( = ?auto_12827 ?auto_12838 ) ) ( IS-CRATE ?auto_12828 ) ( not ( = ?auto_12840 ?auto_12834 ) ) ( not ( = ?auto_12831 ?auto_12840 ) ) ( HOIST-AT ?auto_12832 ?auto_12840 ) ( not ( = ?auto_12837 ?auto_12832 ) ) ( not ( = ?auto_12836 ?auto_12832 ) ) ( AVAILABLE ?auto_12832 ) ( SURFACE-AT ?auto_12828 ?auto_12840 ) ( ON ?auto_12828 ?auto_12841 ) ( CLEAR ?auto_12828 ) ( not ( = ?auto_12828 ?auto_12841 ) ) ( not ( = ?auto_12829 ?auto_12841 ) ) ( not ( = ?auto_12827 ?auto_12841 ) ) ( not ( = ?auto_12838 ?auto_12841 ) ) ( SURFACE-AT ?auto_12833 ?auto_12834 ) ( CLEAR ?auto_12833 ) ( IS-CRATE ?auto_12827 ) ( not ( = ?auto_12833 ?auto_12827 ) ) ( not ( = ?auto_12828 ?auto_12833 ) ) ( not ( = ?auto_12829 ?auto_12833 ) ) ( not ( = ?auto_12838 ?auto_12833 ) ) ( not ( = ?auto_12841 ?auto_12833 ) ) ( AVAILABLE ?auto_12837 ) ( TRUCK-AT ?auto_12839 ?auto_12830 ) ( not ( = ?auto_12830 ?auto_12834 ) ) ( not ( = ?auto_12831 ?auto_12830 ) ) ( not ( = ?auto_12840 ?auto_12830 ) ) ( HOIST-AT ?auto_12835 ?auto_12830 ) ( LIFTING ?auto_12835 ?auto_12827 ) ( not ( = ?auto_12837 ?auto_12835 ) ) ( not ( = ?auto_12836 ?auto_12835 ) ) ( not ( = ?auto_12832 ?auto_12835 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12828 ?auto_12829 )
      ( MAKE-2CRATE-VERIFY ?auto_12827 ?auto_12828 ?auto_12829 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12842 - SURFACE
      ?auto_12843 - SURFACE
      ?auto_12844 - SURFACE
      ?auto_12845 - SURFACE
    )
    :vars
    (
      ?auto_12852 - HOIST
      ?auto_12850 - PLACE
      ?auto_12851 - PLACE
      ?auto_12847 - HOIST
      ?auto_12848 - SURFACE
      ?auto_12856 - PLACE
      ?auto_12849 - HOIST
      ?auto_12853 - SURFACE
      ?auto_12854 - TRUCK
      ?auto_12855 - PLACE
      ?auto_12846 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12852 ?auto_12850 ) ( IS-CRATE ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12845 ) ) ( not ( = ?auto_12843 ?auto_12844 ) ) ( not ( = ?auto_12843 ?auto_12845 ) ) ( not ( = ?auto_12851 ?auto_12850 ) ) ( HOIST-AT ?auto_12847 ?auto_12851 ) ( not ( = ?auto_12852 ?auto_12847 ) ) ( AVAILABLE ?auto_12847 ) ( SURFACE-AT ?auto_12845 ?auto_12851 ) ( ON ?auto_12845 ?auto_12848 ) ( CLEAR ?auto_12845 ) ( not ( = ?auto_12844 ?auto_12848 ) ) ( not ( = ?auto_12845 ?auto_12848 ) ) ( not ( = ?auto_12843 ?auto_12848 ) ) ( IS-CRATE ?auto_12844 ) ( not ( = ?auto_12856 ?auto_12850 ) ) ( not ( = ?auto_12851 ?auto_12856 ) ) ( HOIST-AT ?auto_12849 ?auto_12856 ) ( not ( = ?auto_12852 ?auto_12849 ) ) ( not ( = ?auto_12847 ?auto_12849 ) ) ( AVAILABLE ?auto_12849 ) ( SURFACE-AT ?auto_12844 ?auto_12856 ) ( ON ?auto_12844 ?auto_12853 ) ( CLEAR ?auto_12844 ) ( not ( = ?auto_12844 ?auto_12853 ) ) ( not ( = ?auto_12845 ?auto_12853 ) ) ( not ( = ?auto_12843 ?auto_12853 ) ) ( not ( = ?auto_12848 ?auto_12853 ) ) ( SURFACE-AT ?auto_12842 ?auto_12850 ) ( CLEAR ?auto_12842 ) ( IS-CRATE ?auto_12843 ) ( not ( = ?auto_12842 ?auto_12843 ) ) ( not ( = ?auto_12844 ?auto_12842 ) ) ( not ( = ?auto_12845 ?auto_12842 ) ) ( not ( = ?auto_12848 ?auto_12842 ) ) ( not ( = ?auto_12853 ?auto_12842 ) ) ( AVAILABLE ?auto_12852 ) ( TRUCK-AT ?auto_12854 ?auto_12855 ) ( not ( = ?auto_12855 ?auto_12850 ) ) ( not ( = ?auto_12851 ?auto_12855 ) ) ( not ( = ?auto_12856 ?auto_12855 ) ) ( HOIST-AT ?auto_12846 ?auto_12855 ) ( LIFTING ?auto_12846 ?auto_12843 ) ( not ( = ?auto_12852 ?auto_12846 ) ) ( not ( = ?auto_12847 ?auto_12846 ) ) ( not ( = ?auto_12849 ?auto_12846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12843 ?auto_12844 ?auto_12845 )
      ( MAKE-3CRATE-VERIFY ?auto_12842 ?auto_12843 ?auto_12844 ?auto_12845 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12857 - SURFACE
      ?auto_12858 - SURFACE
      ?auto_12859 - SURFACE
      ?auto_12860 - SURFACE
      ?auto_12861 - SURFACE
    )
    :vars
    (
      ?auto_12868 - HOIST
      ?auto_12866 - PLACE
      ?auto_12867 - PLACE
      ?auto_12863 - HOIST
      ?auto_12864 - SURFACE
      ?auto_12872 - PLACE
      ?auto_12865 - HOIST
      ?auto_12869 - SURFACE
      ?auto_12870 - TRUCK
      ?auto_12871 - PLACE
      ?auto_12862 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_12868 ?auto_12866 ) ( IS-CRATE ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12861 ) ) ( not ( = ?auto_12859 ?auto_12860 ) ) ( not ( = ?auto_12859 ?auto_12861 ) ) ( not ( = ?auto_12867 ?auto_12866 ) ) ( HOIST-AT ?auto_12863 ?auto_12867 ) ( not ( = ?auto_12868 ?auto_12863 ) ) ( AVAILABLE ?auto_12863 ) ( SURFACE-AT ?auto_12861 ?auto_12867 ) ( ON ?auto_12861 ?auto_12864 ) ( CLEAR ?auto_12861 ) ( not ( = ?auto_12860 ?auto_12864 ) ) ( not ( = ?auto_12861 ?auto_12864 ) ) ( not ( = ?auto_12859 ?auto_12864 ) ) ( IS-CRATE ?auto_12860 ) ( not ( = ?auto_12872 ?auto_12866 ) ) ( not ( = ?auto_12867 ?auto_12872 ) ) ( HOIST-AT ?auto_12865 ?auto_12872 ) ( not ( = ?auto_12868 ?auto_12865 ) ) ( not ( = ?auto_12863 ?auto_12865 ) ) ( AVAILABLE ?auto_12865 ) ( SURFACE-AT ?auto_12860 ?auto_12872 ) ( ON ?auto_12860 ?auto_12869 ) ( CLEAR ?auto_12860 ) ( not ( = ?auto_12860 ?auto_12869 ) ) ( not ( = ?auto_12861 ?auto_12869 ) ) ( not ( = ?auto_12859 ?auto_12869 ) ) ( not ( = ?auto_12864 ?auto_12869 ) ) ( SURFACE-AT ?auto_12858 ?auto_12866 ) ( CLEAR ?auto_12858 ) ( IS-CRATE ?auto_12859 ) ( not ( = ?auto_12858 ?auto_12859 ) ) ( not ( = ?auto_12860 ?auto_12858 ) ) ( not ( = ?auto_12861 ?auto_12858 ) ) ( not ( = ?auto_12864 ?auto_12858 ) ) ( not ( = ?auto_12869 ?auto_12858 ) ) ( AVAILABLE ?auto_12868 ) ( TRUCK-AT ?auto_12870 ?auto_12871 ) ( not ( = ?auto_12871 ?auto_12866 ) ) ( not ( = ?auto_12867 ?auto_12871 ) ) ( not ( = ?auto_12872 ?auto_12871 ) ) ( HOIST-AT ?auto_12862 ?auto_12871 ) ( LIFTING ?auto_12862 ?auto_12859 ) ( not ( = ?auto_12868 ?auto_12862 ) ) ( not ( = ?auto_12863 ?auto_12862 ) ) ( not ( = ?auto_12865 ?auto_12862 ) ) ( ON ?auto_12858 ?auto_12857 ) ( not ( = ?auto_12857 ?auto_12858 ) ) ( not ( = ?auto_12857 ?auto_12859 ) ) ( not ( = ?auto_12857 ?auto_12860 ) ) ( not ( = ?auto_12857 ?auto_12861 ) ) ( not ( = ?auto_12857 ?auto_12864 ) ) ( not ( = ?auto_12857 ?auto_12869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12859 ?auto_12860 ?auto_12861 )
      ( MAKE-4CRATE-VERIFY ?auto_12857 ?auto_12858 ?auto_12859 ?auto_12860 ?auto_12861 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12873 - SURFACE
      ?auto_12874 - SURFACE
    )
    :vars
    (
      ?auto_12883 - HOIST
      ?auto_12880 - PLACE
      ?auto_12877 - SURFACE
      ?auto_12882 - PLACE
      ?auto_12876 - HOIST
      ?auto_12878 - SURFACE
      ?auto_12887 - PLACE
      ?auto_12879 - HOIST
      ?auto_12884 - SURFACE
      ?auto_12881 - SURFACE
      ?auto_12885 - TRUCK
      ?auto_12886 - PLACE
      ?auto_12875 - HOIST
      ?auto_12888 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12883 ?auto_12880 ) ( IS-CRATE ?auto_12874 ) ( not ( = ?auto_12873 ?auto_12874 ) ) ( not ( = ?auto_12877 ?auto_12873 ) ) ( not ( = ?auto_12877 ?auto_12874 ) ) ( not ( = ?auto_12882 ?auto_12880 ) ) ( HOIST-AT ?auto_12876 ?auto_12882 ) ( not ( = ?auto_12883 ?auto_12876 ) ) ( AVAILABLE ?auto_12876 ) ( SURFACE-AT ?auto_12874 ?auto_12882 ) ( ON ?auto_12874 ?auto_12878 ) ( CLEAR ?auto_12874 ) ( not ( = ?auto_12873 ?auto_12878 ) ) ( not ( = ?auto_12874 ?auto_12878 ) ) ( not ( = ?auto_12877 ?auto_12878 ) ) ( IS-CRATE ?auto_12873 ) ( not ( = ?auto_12887 ?auto_12880 ) ) ( not ( = ?auto_12882 ?auto_12887 ) ) ( HOIST-AT ?auto_12879 ?auto_12887 ) ( not ( = ?auto_12883 ?auto_12879 ) ) ( not ( = ?auto_12876 ?auto_12879 ) ) ( AVAILABLE ?auto_12879 ) ( SURFACE-AT ?auto_12873 ?auto_12887 ) ( ON ?auto_12873 ?auto_12884 ) ( CLEAR ?auto_12873 ) ( not ( = ?auto_12873 ?auto_12884 ) ) ( not ( = ?auto_12874 ?auto_12884 ) ) ( not ( = ?auto_12877 ?auto_12884 ) ) ( not ( = ?auto_12878 ?auto_12884 ) ) ( SURFACE-AT ?auto_12881 ?auto_12880 ) ( CLEAR ?auto_12881 ) ( IS-CRATE ?auto_12877 ) ( not ( = ?auto_12881 ?auto_12877 ) ) ( not ( = ?auto_12873 ?auto_12881 ) ) ( not ( = ?auto_12874 ?auto_12881 ) ) ( not ( = ?auto_12878 ?auto_12881 ) ) ( not ( = ?auto_12884 ?auto_12881 ) ) ( AVAILABLE ?auto_12883 ) ( TRUCK-AT ?auto_12885 ?auto_12886 ) ( not ( = ?auto_12886 ?auto_12880 ) ) ( not ( = ?auto_12882 ?auto_12886 ) ) ( not ( = ?auto_12887 ?auto_12886 ) ) ( HOIST-AT ?auto_12875 ?auto_12886 ) ( not ( = ?auto_12883 ?auto_12875 ) ) ( not ( = ?auto_12876 ?auto_12875 ) ) ( not ( = ?auto_12879 ?auto_12875 ) ) ( AVAILABLE ?auto_12875 ) ( SURFACE-AT ?auto_12877 ?auto_12886 ) ( ON ?auto_12877 ?auto_12888 ) ( CLEAR ?auto_12877 ) ( not ( = ?auto_12873 ?auto_12888 ) ) ( not ( = ?auto_12874 ?auto_12888 ) ) ( not ( = ?auto_12877 ?auto_12888 ) ) ( not ( = ?auto_12878 ?auto_12888 ) ) ( not ( = ?auto_12884 ?auto_12888 ) ) ( not ( = ?auto_12881 ?auto_12888 ) ) )
    :subtasks
    ( ( !LIFT ?auto_12875 ?auto_12877 ?auto_12888 ?auto_12886 )
      ( MAKE-2CRATE ?auto_12877 ?auto_12873 ?auto_12874 )
      ( MAKE-1CRATE-VERIFY ?auto_12873 ?auto_12874 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12889 - SURFACE
      ?auto_12890 - SURFACE
      ?auto_12891 - SURFACE
    )
    :vars
    (
      ?auto_12892 - HOIST
      ?auto_12897 - PLACE
      ?auto_12896 - PLACE
      ?auto_12894 - HOIST
      ?auto_12893 - SURFACE
      ?auto_12903 - PLACE
      ?auto_12902 - HOIST
      ?auto_12904 - SURFACE
      ?auto_12898 - SURFACE
      ?auto_12899 - TRUCK
      ?auto_12895 - PLACE
      ?auto_12900 - HOIST
      ?auto_12901 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12892 ?auto_12897 ) ( IS-CRATE ?auto_12891 ) ( not ( = ?auto_12890 ?auto_12891 ) ) ( not ( = ?auto_12889 ?auto_12890 ) ) ( not ( = ?auto_12889 ?auto_12891 ) ) ( not ( = ?auto_12896 ?auto_12897 ) ) ( HOIST-AT ?auto_12894 ?auto_12896 ) ( not ( = ?auto_12892 ?auto_12894 ) ) ( AVAILABLE ?auto_12894 ) ( SURFACE-AT ?auto_12891 ?auto_12896 ) ( ON ?auto_12891 ?auto_12893 ) ( CLEAR ?auto_12891 ) ( not ( = ?auto_12890 ?auto_12893 ) ) ( not ( = ?auto_12891 ?auto_12893 ) ) ( not ( = ?auto_12889 ?auto_12893 ) ) ( IS-CRATE ?auto_12890 ) ( not ( = ?auto_12903 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12903 ) ) ( HOIST-AT ?auto_12902 ?auto_12903 ) ( not ( = ?auto_12892 ?auto_12902 ) ) ( not ( = ?auto_12894 ?auto_12902 ) ) ( AVAILABLE ?auto_12902 ) ( SURFACE-AT ?auto_12890 ?auto_12903 ) ( ON ?auto_12890 ?auto_12904 ) ( CLEAR ?auto_12890 ) ( not ( = ?auto_12890 ?auto_12904 ) ) ( not ( = ?auto_12891 ?auto_12904 ) ) ( not ( = ?auto_12889 ?auto_12904 ) ) ( not ( = ?auto_12893 ?auto_12904 ) ) ( SURFACE-AT ?auto_12898 ?auto_12897 ) ( CLEAR ?auto_12898 ) ( IS-CRATE ?auto_12889 ) ( not ( = ?auto_12898 ?auto_12889 ) ) ( not ( = ?auto_12890 ?auto_12898 ) ) ( not ( = ?auto_12891 ?auto_12898 ) ) ( not ( = ?auto_12893 ?auto_12898 ) ) ( not ( = ?auto_12904 ?auto_12898 ) ) ( AVAILABLE ?auto_12892 ) ( TRUCK-AT ?auto_12899 ?auto_12895 ) ( not ( = ?auto_12895 ?auto_12897 ) ) ( not ( = ?auto_12896 ?auto_12895 ) ) ( not ( = ?auto_12903 ?auto_12895 ) ) ( HOIST-AT ?auto_12900 ?auto_12895 ) ( not ( = ?auto_12892 ?auto_12900 ) ) ( not ( = ?auto_12894 ?auto_12900 ) ) ( not ( = ?auto_12902 ?auto_12900 ) ) ( AVAILABLE ?auto_12900 ) ( SURFACE-AT ?auto_12889 ?auto_12895 ) ( ON ?auto_12889 ?auto_12901 ) ( CLEAR ?auto_12889 ) ( not ( = ?auto_12890 ?auto_12901 ) ) ( not ( = ?auto_12891 ?auto_12901 ) ) ( not ( = ?auto_12889 ?auto_12901 ) ) ( not ( = ?auto_12893 ?auto_12901 ) ) ( not ( = ?auto_12904 ?auto_12901 ) ) ( not ( = ?auto_12898 ?auto_12901 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12890 ?auto_12891 )
      ( MAKE-2CRATE-VERIFY ?auto_12889 ?auto_12890 ?auto_12891 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12905 - SURFACE
      ?auto_12906 - SURFACE
      ?auto_12907 - SURFACE
      ?auto_12908 - SURFACE
    )
    :vars
    (
      ?auto_12918 - HOIST
      ?auto_12913 - PLACE
      ?auto_12917 - PLACE
      ?auto_12916 - HOIST
      ?auto_12914 - SURFACE
      ?auto_12910 - PLACE
      ?auto_12920 - HOIST
      ?auto_12919 - SURFACE
      ?auto_12911 - TRUCK
      ?auto_12912 - PLACE
      ?auto_12915 - HOIST
      ?auto_12909 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12918 ?auto_12913 ) ( IS-CRATE ?auto_12908 ) ( not ( = ?auto_12907 ?auto_12908 ) ) ( not ( = ?auto_12906 ?auto_12907 ) ) ( not ( = ?auto_12906 ?auto_12908 ) ) ( not ( = ?auto_12917 ?auto_12913 ) ) ( HOIST-AT ?auto_12916 ?auto_12917 ) ( not ( = ?auto_12918 ?auto_12916 ) ) ( AVAILABLE ?auto_12916 ) ( SURFACE-AT ?auto_12908 ?auto_12917 ) ( ON ?auto_12908 ?auto_12914 ) ( CLEAR ?auto_12908 ) ( not ( = ?auto_12907 ?auto_12914 ) ) ( not ( = ?auto_12908 ?auto_12914 ) ) ( not ( = ?auto_12906 ?auto_12914 ) ) ( IS-CRATE ?auto_12907 ) ( not ( = ?auto_12910 ?auto_12913 ) ) ( not ( = ?auto_12917 ?auto_12910 ) ) ( HOIST-AT ?auto_12920 ?auto_12910 ) ( not ( = ?auto_12918 ?auto_12920 ) ) ( not ( = ?auto_12916 ?auto_12920 ) ) ( AVAILABLE ?auto_12920 ) ( SURFACE-AT ?auto_12907 ?auto_12910 ) ( ON ?auto_12907 ?auto_12919 ) ( CLEAR ?auto_12907 ) ( not ( = ?auto_12907 ?auto_12919 ) ) ( not ( = ?auto_12908 ?auto_12919 ) ) ( not ( = ?auto_12906 ?auto_12919 ) ) ( not ( = ?auto_12914 ?auto_12919 ) ) ( SURFACE-AT ?auto_12905 ?auto_12913 ) ( CLEAR ?auto_12905 ) ( IS-CRATE ?auto_12906 ) ( not ( = ?auto_12905 ?auto_12906 ) ) ( not ( = ?auto_12907 ?auto_12905 ) ) ( not ( = ?auto_12908 ?auto_12905 ) ) ( not ( = ?auto_12914 ?auto_12905 ) ) ( not ( = ?auto_12919 ?auto_12905 ) ) ( AVAILABLE ?auto_12918 ) ( TRUCK-AT ?auto_12911 ?auto_12912 ) ( not ( = ?auto_12912 ?auto_12913 ) ) ( not ( = ?auto_12917 ?auto_12912 ) ) ( not ( = ?auto_12910 ?auto_12912 ) ) ( HOIST-AT ?auto_12915 ?auto_12912 ) ( not ( = ?auto_12918 ?auto_12915 ) ) ( not ( = ?auto_12916 ?auto_12915 ) ) ( not ( = ?auto_12920 ?auto_12915 ) ) ( AVAILABLE ?auto_12915 ) ( SURFACE-AT ?auto_12906 ?auto_12912 ) ( ON ?auto_12906 ?auto_12909 ) ( CLEAR ?auto_12906 ) ( not ( = ?auto_12907 ?auto_12909 ) ) ( not ( = ?auto_12908 ?auto_12909 ) ) ( not ( = ?auto_12906 ?auto_12909 ) ) ( not ( = ?auto_12914 ?auto_12909 ) ) ( not ( = ?auto_12919 ?auto_12909 ) ) ( not ( = ?auto_12905 ?auto_12909 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12906 ?auto_12907 ?auto_12908 )
      ( MAKE-3CRATE-VERIFY ?auto_12905 ?auto_12906 ?auto_12907 ?auto_12908 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12921 - SURFACE
      ?auto_12922 - SURFACE
      ?auto_12923 - SURFACE
      ?auto_12924 - SURFACE
      ?auto_12925 - SURFACE
    )
    :vars
    (
      ?auto_12935 - HOIST
      ?auto_12930 - PLACE
      ?auto_12934 - PLACE
      ?auto_12933 - HOIST
      ?auto_12931 - SURFACE
      ?auto_12927 - PLACE
      ?auto_12937 - HOIST
      ?auto_12936 - SURFACE
      ?auto_12928 - TRUCK
      ?auto_12929 - PLACE
      ?auto_12932 - HOIST
      ?auto_12926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_12935 ?auto_12930 ) ( IS-CRATE ?auto_12925 ) ( not ( = ?auto_12924 ?auto_12925 ) ) ( not ( = ?auto_12923 ?auto_12924 ) ) ( not ( = ?auto_12923 ?auto_12925 ) ) ( not ( = ?auto_12934 ?auto_12930 ) ) ( HOIST-AT ?auto_12933 ?auto_12934 ) ( not ( = ?auto_12935 ?auto_12933 ) ) ( AVAILABLE ?auto_12933 ) ( SURFACE-AT ?auto_12925 ?auto_12934 ) ( ON ?auto_12925 ?auto_12931 ) ( CLEAR ?auto_12925 ) ( not ( = ?auto_12924 ?auto_12931 ) ) ( not ( = ?auto_12925 ?auto_12931 ) ) ( not ( = ?auto_12923 ?auto_12931 ) ) ( IS-CRATE ?auto_12924 ) ( not ( = ?auto_12927 ?auto_12930 ) ) ( not ( = ?auto_12934 ?auto_12927 ) ) ( HOIST-AT ?auto_12937 ?auto_12927 ) ( not ( = ?auto_12935 ?auto_12937 ) ) ( not ( = ?auto_12933 ?auto_12937 ) ) ( AVAILABLE ?auto_12937 ) ( SURFACE-AT ?auto_12924 ?auto_12927 ) ( ON ?auto_12924 ?auto_12936 ) ( CLEAR ?auto_12924 ) ( not ( = ?auto_12924 ?auto_12936 ) ) ( not ( = ?auto_12925 ?auto_12936 ) ) ( not ( = ?auto_12923 ?auto_12936 ) ) ( not ( = ?auto_12931 ?auto_12936 ) ) ( SURFACE-AT ?auto_12922 ?auto_12930 ) ( CLEAR ?auto_12922 ) ( IS-CRATE ?auto_12923 ) ( not ( = ?auto_12922 ?auto_12923 ) ) ( not ( = ?auto_12924 ?auto_12922 ) ) ( not ( = ?auto_12925 ?auto_12922 ) ) ( not ( = ?auto_12931 ?auto_12922 ) ) ( not ( = ?auto_12936 ?auto_12922 ) ) ( AVAILABLE ?auto_12935 ) ( TRUCK-AT ?auto_12928 ?auto_12929 ) ( not ( = ?auto_12929 ?auto_12930 ) ) ( not ( = ?auto_12934 ?auto_12929 ) ) ( not ( = ?auto_12927 ?auto_12929 ) ) ( HOIST-AT ?auto_12932 ?auto_12929 ) ( not ( = ?auto_12935 ?auto_12932 ) ) ( not ( = ?auto_12933 ?auto_12932 ) ) ( not ( = ?auto_12937 ?auto_12932 ) ) ( AVAILABLE ?auto_12932 ) ( SURFACE-AT ?auto_12923 ?auto_12929 ) ( ON ?auto_12923 ?auto_12926 ) ( CLEAR ?auto_12923 ) ( not ( = ?auto_12924 ?auto_12926 ) ) ( not ( = ?auto_12925 ?auto_12926 ) ) ( not ( = ?auto_12923 ?auto_12926 ) ) ( not ( = ?auto_12931 ?auto_12926 ) ) ( not ( = ?auto_12936 ?auto_12926 ) ) ( not ( = ?auto_12922 ?auto_12926 ) ) ( ON ?auto_12922 ?auto_12921 ) ( not ( = ?auto_12921 ?auto_12922 ) ) ( not ( = ?auto_12921 ?auto_12923 ) ) ( not ( = ?auto_12921 ?auto_12924 ) ) ( not ( = ?auto_12921 ?auto_12925 ) ) ( not ( = ?auto_12921 ?auto_12931 ) ) ( not ( = ?auto_12921 ?auto_12936 ) ) ( not ( = ?auto_12921 ?auto_12926 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12923 ?auto_12924 ?auto_12925 )
      ( MAKE-4CRATE-VERIFY ?auto_12921 ?auto_12922 ?auto_12923 ?auto_12924 ?auto_12925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_12938 - SURFACE
      ?auto_12939 - SURFACE
    )
    :vars
    (
      ?auto_12950 - HOIST
      ?auto_12945 - PLACE
      ?auto_12952 - SURFACE
      ?auto_12949 - PLACE
      ?auto_12948 - HOIST
      ?auto_12946 - SURFACE
      ?auto_12942 - PLACE
      ?auto_12953 - HOIST
      ?auto_12951 - SURFACE
      ?auto_12941 - SURFACE
      ?auto_12944 - PLACE
      ?auto_12947 - HOIST
      ?auto_12940 - SURFACE
      ?auto_12943 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12950 ?auto_12945 ) ( IS-CRATE ?auto_12939 ) ( not ( = ?auto_12938 ?auto_12939 ) ) ( not ( = ?auto_12952 ?auto_12938 ) ) ( not ( = ?auto_12952 ?auto_12939 ) ) ( not ( = ?auto_12949 ?auto_12945 ) ) ( HOIST-AT ?auto_12948 ?auto_12949 ) ( not ( = ?auto_12950 ?auto_12948 ) ) ( AVAILABLE ?auto_12948 ) ( SURFACE-AT ?auto_12939 ?auto_12949 ) ( ON ?auto_12939 ?auto_12946 ) ( CLEAR ?auto_12939 ) ( not ( = ?auto_12938 ?auto_12946 ) ) ( not ( = ?auto_12939 ?auto_12946 ) ) ( not ( = ?auto_12952 ?auto_12946 ) ) ( IS-CRATE ?auto_12938 ) ( not ( = ?auto_12942 ?auto_12945 ) ) ( not ( = ?auto_12949 ?auto_12942 ) ) ( HOIST-AT ?auto_12953 ?auto_12942 ) ( not ( = ?auto_12950 ?auto_12953 ) ) ( not ( = ?auto_12948 ?auto_12953 ) ) ( AVAILABLE ?auto_12953 ) ( SURFACE-AT ?auto_12938 ?auto_12942 ) ( ON ?auto_12938 ?auto_12951 ) ( CLEAR ?auto_12938 ) ( not ( = ?auto_12938 ?auto_12951 ) ) ( not ( = ?auto_12939 ?auto_12951 ) ) ( not ( = ?auto_12952 ?auto_12951 ) ) ( not ( = ?auto_12946 ?auto_12951 ) ) ( SURFACE-AT ?auto_12941 ?auto_12945 ) ( CLEAR ?auto_12941 ) ( IS-CRATE ?auto_12952 ) ( not ( = ?auto_12941 ?auto_12952 ) ) ( not ( = ?auto_12938 ?auto_12941 ) ) ( not ( = ?auto_12939 ?auto_12941 ) ) ( not ( = ?auto_12946 ?auto_12941 ) ) ( not ( = ?auto_12951 ?auto_12941 ) ) ( AVAILABLE ?auto_12950 ) ( not ( = ?auto_12944 ?auto_12945 ) ) ( not ( = ?auto_12949 ?auto_12944 ) ) ( not ( = ?auto_12942 ?auto_12944 ) ) ( HOIST-AT ?auto_12947 ?auto_12944 ) ( not ( = ?auto_12950 ?auto_12947 ) ) ( not ( = ?auto_12948 ?auto_12947 ) ) ( not ( = ?auto_12953 ?auto_12947 ) ) ( AVAILABLE ?auto_12947 ) ( SURFACE-AT ?auto_12952 ?auto_12944 ) ( ON ?auto_12952 ?auto_12940 ) ( CLEAR ?auto_12952 ) ( not ( = ?auto_12938 ?auto_12940 ) ) ( not ( = ?auto_12939 ?auto_12940 ) ) ( not ( = ?auto_12952 ?auto_12940 ) ) ( not ( = ?auto_12946 ?auto_12940 ) ) ( not ( = ?auto_12951 ?auto_12940 ) ) ( not ( = ?auto_12941 ?auto_12940 ) ) ( TRUCK-AT ?auto_12943 ?auto_12945 ) )
    :subtasks
    ( ( !DRIVE ?auto_12943 ?auto_12945 ?auto_12944 )
      ( MAKE-2CRATE ?auto_12952 ?auto_12938 ?auto_12939 )
      ( MAKE-1CRATE-VERIFY ?auto_12938 ?auto_12939 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_12954 - SURFACE
      ?auto_12955 - SURFACE
      ?auto_12956 - SURFACE
    )
    :vars
    (
      ?auto_12968 - HOIST
      ?auto_12964 - PLACE
      ?auto_12969 - PLACE
      ?auto_12965 - HOIST
      ?auto_12967 - SURFACE
      ?auto_12960 - PLACE
      ?auto_12958 - HOIST
      ?auto_12961 - SURFACE
      ?auto_12963 - SURFACE
      ?auto_12957 - PLACE
      ?auto_12962 - HOIST
      ?auto_12959 - SURFACE
      ?auto_12966 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12968 ?auto_12964 ) ( IS-CRATE ?auto_12956 ) ( not ( = ?auto_12955 ?auto_12956 ) ) ( not ( = ?auto_12954 ?auto_12955 ) ) ( not ( = ?auto_12954 ?auto_12956 ) ) ( not ( = ?auto_12969 ?auto_12964 ) ) ( HOIST-AT ?auto_12965 ?auto_12969 ) ( not ( = ?auto_12968 ?auto_12965 ) ) ( AVAILABLE ?auto_12965 ) ( SURFACE-AT ?auto_12956 ?auto_12969 ) ( ON ?auto_12956 ?auto_12967 ) ( CLEAR ?auto_12956 ) ( not ( = ?auto_12955 ?auto_12967 ) ) ( not ( = ?auto_12956 ?auto_12967 ) ) ( not ( = ?auto_12954 ?auto_12967 ) ) ( IS-CRATE ?auto_12955 ) ( not ( = ?auto_12960 ?auto_12964 ) ) ( not ( = ?auto_12969 ?auto_12960 ) ) ( HOIST-AT ?auto_12958 ?auto_12960 ) ( not ( = ?auto_12968 ?auto_12958 ) ) ( not ( = ?auto_12965 ?auto_12958 ) ) ( AVAILABLE ?auto_12958 ) ( SURFACE-AT ?auto_12955 ?auto_12960 ) ( ON ?auto_12955 ?auto_12961 ) ( CLEAR ?auto_12955 ) ( not ( = ?auto_12955 ?auto_12961 ) ) ( not ( = ?auto_12956 ?auto_12961 ) ) ( not ( = ?auto_12954 ?auto_12961 ) ) ( not ( = ?auto_12967 ?auto_12961 ) ) ( SURFACE-AT ?auto_12963 ?auto_12964 ) ( CLEAR ?auto_12963 ) ( IS-CRATE ?auto_12954 ) ( not ( = ?auto_12963 ?auto_12954 ) ) ( not ( = ?auto_12955 ?auto_12963 ) ) ( not ( = ?auto_12956 ?auto_12963 ) ) ( not ( = ?auto_12967 ?auto_12963 ) ) ( not ( = ?auto_12961 ?auto_12963 ) ) ( AVAILABLE ?auto_12968 ) ( not ( = ?auto_12957 ?auto_12964 ) ) ( not ( = ?auto_12969 ?auto_12957 ) ) ( not ( = ?auto_12960 ?auto_12957 ) ) ( HOIST-AT ?auto_12962 ?auto_12957 ) ( not ( = ?auto_12968 ?auto_12962 ) ) ( not ( = ?auto_12965 ?auto_12962 ) ) ( not ( = ?auto_12958 ?auto_12962 ) ) ( AVAILABLE ?auto_12962 ) ( SURFACE-AT ?auto_12954 ?auto_12957 ) ( ON ?auto_12954 ?auto_12959 ) ( CLEAR ?auto_12954 ) ( not ( = ?auto_12955 ?auto_12959 ) ) ( not ( = ?auto_12956 ?auto_12959 ) ) ( not ( = ?auto_12954 ?auto_12959 ) ) ( not ( = ?auto_12967 ?auto_12959 ) ) ( not ( = ?auto_12961 ?auto_12959 ) ) ( not ( = ?auto_12963 ?auto_12959 ) ) ( TRUCK-AT ?auto_12966 ?auto_12964 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_12955 ?auto_12956 )
      ( MAKE-2CRATE-VERIFY ?auto_12954 ?auto_12955 ?auto_12956 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_12970 - SURFACE
      ?auto_12971 - SURFACE
      ?auto_12972 - SURFACE
      ?auto_12973 - SURFACE
    )
    :vars
    (
      ?auto_12974 - HOIST
      ?auto_12980 - PLACE
      ?auto_12979 - PLACE
      ?auto_12975 - HOIST
      ?auto_12984 - SURFACE
      ?auto_12976 - PLACE
      ?auto_12978 - HOIST
      ?auto_12982 - SURFACE
      ?auto_12977 - PLACE
      ?auto_12983 - HOIST
      ?auto_12985 - SURFACE
      ?auto_12981 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12974 ?auto_12980 ) ( IS-CRATE ?auto_12973 ) ( not ( = ?auto_12972 ?auto_12973 ) ) ( not ( = ?auto_12971 ?auto_12972 ) ) ( not ( = ?auto_12971 ?auto_12973 ) ) ( not ( = ?auto_12979 ?auto_12980 ) ) ( HOIST-AT ?auto_12975 ?auto_12979 ) ( not ( = ?auto_12974 ?auto_12975 ) ) ( AVAILABLE ?auto_12975 ) ( SURFACE-AT ?auto_12973 ?auto_12979 ) ( ON ?auto_12973 ?auto_12984 ) ( CLEAR ?auto_12973 ) ( not ( = ?auto_12972 ?auto_12984 ) ) ( not ( = ?auto_12973 ?auto_12984 ) ) ( not ( = ?auto_12971 ?auto_12984 ) ) ( IS-CRATE ?auto_12972 ) ( not ( = ?auto_12976 ?auto_12980 ) ) ( not ( = ?auto_12979 ?auto_12976 ) ) ( HOIST-AT ?auto_12978 ?auto_12976 ) ( not ( = ?auto_12974 ?auto_12978 ) ) ( not ( = ?auto_12975 ?auto_12978 ) ) ( AVAILABLE ?auto_12978 ) ( SURFACE-AT ?auto_12972 ?auto_12976 ) ( ON ?auto_12972 ?auto_12982 ) ( CLEAR ?auto_12972 ) ( not ( = ?auto_12972 ?auto_12982 ) ) ( not ( = ?auto_12973 ?auto_12982 ) ) ( not ( = ?auto_12971 ?auto_12982 ) ) ( not ( = ?auto_12984 ?auto_12982 ) ) ( SURFACE-AT ?auto_12970 ?auto_12980 ) ( CLEAR ?auto_12970 ) ( IS-CRATE ?auto_12971 ) ( not ( = ?auto_12970 ?auto_12971 ) ) ( not ( = ?auto_12972 ?auto_12970 ) ) ( not ( = ?auto_12973 ?auto_12970 ) ) ( not ( = ?auto_12984 ?auto_12970 ) ) ( not ( = ?auto_12982 ?auto_12970 ) ) ( AVAILABLE ?auto_12974 ) ( not ( = ?auto_12977 ?auto_12980 ) ) ( not ( = ?auto_12979 ?auto_12977 ) ) ( not ( = ?auto_12976 ?auto_12977 ) ) ( HOIST-AT ?auto_12983 ?auto_12977 ) ( not ( = ?auto_12974 ?auto_12983 ) ) ( not ( = ?auto_12975 ?auto_12983 ) ) ( not ( = ?auto_12978 ?auto_12983 ) ) ( AVAILABLE ?auto_12983 ) ( SURFACE-AT ?auto_12971 ?auto_12977 ) ( ON ?auto_12971 ?auto_12985 ) ( CLEAR ?auto_12971 ) ( not ( = ?auto_12972 ?auto_12985 ) ) ( not ( = ?auto_12973 ?auto_12985 ) ) ( not ( = ?auto_12971 ?auto_12985 ) ) ( not ( = ?auto_12984 ?auto_12985 ) ) ( not ( = ?auto_12982 ?auto_12985 ) ) ( not ( = ?auto_12970 ?auto_12985 ) ) ( TRUCK-AT ?auto_12981 ?auto_12980 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12971 ?auto_12972 ?auto_12973 )
      ( MAKE-3CRATE-VERIFY ?auto_12970 ?auto_12971 ?auto_12972 ?auto_12973 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_12986 - SURFACE
      ?auto_12987 - SURFACE
      ?auto_12988 - SURFACE
      ?auto_12989 - SURFACE
      ?auto_12990 - SURFACE
    )
    :vars
    (
      ?auto_12991 - HOIST
      ?auto_12997 - PLACE
      ?auto_12996 - PLACE
      ?auto_12992 - HOIST
      ?auto_13001 - SURFACE
      ?auto_12993 - PLACE
      ?auto_12995 - HOIST
      ?auto_12999 - SURFACE
      ?auto_12994 - PLACE
      ?auto_13000 - HOIST
      ?auto_13002 - SURFACE
      ?auto_12998 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_12991 ?auto_12997 ) ( IS-CRATE ?auto_12990 ) ( not ( = ?auto_12989 ?auto_12990 ) ) ( not ( = ?auto_12988 ?auto_12989 ) ) ( not ( = ?auto_12988 ?auto_12990 ) ) ( not ( = ?auto_12996 ?auto_12997 ) ) ( HOIST-AT ?auto_12992 ?auto_12996 ) ( not ( = ?auto_12991 ?auto_12992 ) ) ( AVAILABLE ?auto_12992 ) ( SURFACE-AT ?auto_12990 ?auto_12996 ) ( ON ?auto_12990 ?auto_13001 ) ( CLEAR ?auto_12990 ) ( not ( = ?auto_12989 ?auto_13001 ) ) ( not ( = ?auto_12990 ?auto_13001 ) ) ( not ( = ?auto_12988 ?auto_13001 ) ) ( IS-CRATE ?auto_12989 ) ( not ( = ?auto_12993 ?auto_12997 ) ) ( not ( = ?auto_12996 ?auto_12993 ) ) ( HOIST-AT ?auto_12995 ?auto_12993 ) ( not ( = ?auto_12991 ?auto_12995 ) ) ( not ( = ?auto_12992 ?auto_12995 ) ) ( AVAILABLE ?auto_12995 ) ( SURFACE-AT ?auto_12989 ?auto_12993 ) ( ON ?auto_12989 ?auto_12999 ) ( CLEAR ?auto_12989 ) ( not ( = ?auto_12989 ?auto_12999 ) ) ( not ( = ?auto_12990 ?auto_12999 ) ) ( not ( = ?auto_12988 ?auto_12999 ) ) ( not ( = ?auto_13001 ?auto_12999 ) ) ( SURFACE-AT ?auto_12987 ?auto_12997 ) ( CLEAR ?auto_12987 ) ( IS-CRATE ?auto_12988 ) ( not ( = ?auto_12987 ?auto_12988 ) ) ( not ( = ?auto_12989 ?auto_12987 ) ) ( not ( = ?auto_12990 ?auto_12987 ) ) ( not ( = ?auto_13001 ?auto_12987 ) ) ( not ( = ?auto_12999 ?auto_12987 ) ) ( AVAILABLE ?auto_12991 ) ( not ( = ?auto_12994 ?auto_12997 ) ) ( not ( = ?auto_12996 ?auto_12994 ) ) ( not ( = ?auto_12993 ?auto_12994 ) ) ( HOIST-AT ?auto_13000 ?auto_12994 ) ( not ( = ?auto_12991 ?auto_13000 ) ) ( not ( = ?auto_12992 ?auto_13000 ) ) ( not ( = ?auto_12995 ?auto_13000 ) ) ( AVAILABLE ?auto_13000 ) ( SURFACE-AT ?auto_12988 ?auto_12994 ) ( ON ?auto_12988 ?auto_13002 ) ( CLEAR ?auto_12988 ) ( not ( = ?auto_12989 ?auto_13002 ) ) ( not ( = ?auto_12990 ?auto_13002 ) ) ( not ( = ?auto_12988 ?auto_13002 ) ) ( not ( = ?auto_13001 ?auto_13002 ) ) ( not ( = ?auto_12999 ?auto_13002 ) ) ( not ( = ?auto_12987 ?auto_13002 ) ) ( TRUCK-AT ?auto_12998 ?auto_12997 ) ( ON ?auto_12987 ?auto_12986 ) ( not ( = ?auto_12986 ?auto_12987 ) ) ( not ( = ?auto_12986 ?auto_12988 ) ) ( not ( = ?auto_12986 ?auto_12989 ) ) ( not ( = ?auto_12986 ?auto_12990 ) ) ( not ( = ?auto_12986 ?auto_13001 ) ) ( not ( = ?auto_12986 ?auto_12999 ) ) ( not ( = ?auto_12986 ?auto_13002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_12988 ?auto_12989 ?auto_12990 )
      ( MAKE-4CRATE-VERIFY ?auto_12986 ?auto_12987 ?auto_12988 ?auto_12989 ?auto_12990 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13003 - SURFACE
      ?auto_13004 - SURFACE
    )
    :vars
    (
      ?auto_13005 - HOIST
      ?auto_13012 - PLACE
      ?auto_13013 - SURFACE
      ?auto_13011 - PLACE
      ?auto_13007 - HOIST
      ?auto_13017 - SURFACE
      ?auto_13008 - PLACE
      ?auto_13010 - HOIST
      ?auto_13015 - SURFACE
      ?auto_13006 - SURFACE
      ?auto_13009 - PLACE
      ?auto_13016 - HOIST
      ?auto_13018 - SURFACE
      ?auto_13014 - TRUCK
      ?auto_13019 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13005 ?auto_13012 ) ( IS-CRATE ?auto_13004 ) ( not ( = ?auto_13003 ?auto_13004 ) ) ( not ( = ?auto_13013 ?auto_13003 ) ) ( not ( = ?auto_13013 ?auto_13004 ) ) ( not ( = ?auto_13011 ?auto_13012 ) ) ( HOIST-AT ?auto_13007 ?auto_13011 ) ( not ( = ?auto_13005 ?auto_13007 ) ) ( AVAILABLE ?auto_13007 ) ( SURFACE-AT ?auto_13004 ?auto_13011 ) ( ON ?auto_13004 ?auto_13017 ) ( CLEAR ?auto_13004 ) ( not ( = ?auto_13003 ?auto_13017 ) ) ( not ( = ?auto_13004 ?auto_13017 ) ) ( not ( = ?auto_13013 ?auto_13017 ) ) ( IS-CRATE ?auto_13003 ) ( not ( = ?auto_13008 ?auto_13012 ) ) ( not ( = ?auto_13011 ?auto_13008 ) ) ( HOIST-AT ?auto_13010 ?auto_13008 ) ( not ( = ?auto_13005 ?auto_13010 ) ) ( not ( = ?auto_13007 ?auto_13010 ) ) ( AVAILABLE ?auto_13010 ) ( SURFACE-AT ?auto_13003 ?auto_13008 ) ( ON ?auto_13003 ?auto_13015 ) ( CLEAR ?auto_13003 ) ( not ( = ?auto_13003 ?auto_13015 ) ) ( not ( = ?auto_13004 ?auto_13015 ) ) ( not ( = ?auto_13013 ?auto_13015 ) ) ( not ( = ?auto_13017 ?auto_13015 ) ) ( IS-CRATE ?auto_13013 ) ( not ( = ?auto_13006 ?auto_13013 ) ) ( not ( = ?auto_13003 ?auto_13006 ) ) ( not ( = ?auto_13004 ?auto_13006 ) ) ( not ( = ?auto_13017 ?auto_13006 ) ) ( not ( = ?auto_13015 ?auto_13006 ) ) ( not ( = ?auto_13009 ?auto_13012 ) ) ( not ( = ?auto_13011 ?auto_13009 ) ) ( not ( = ?auto_13008 ?auto_13009 ) ) ( HOIST-AT ?auto_13016 ?auto_13009 ) ( not ( = ?auto_13005 ?auto_13016 ) ) ( not ( = ?auto_13007 ?auto_13016 ) ) ( not ( = ?auto_13010 ?auto_13016 ) ) ( AVAILABLE ?auto_13016 ) ( SURFACE-AT ?auto_13013 ?auto_13009 ) ( ON ?auto_13013 ?auto_13018 ) ( CLEAR ?auto_13013 ) ( not ( = ?auto_13003 ?auto_13018 ) ) ( not ( = ?auto_13004 ?auto_13018 ) ) ( not ( = ?auto_13013 ?auto_13018 ) ) ( not ( = ?auto_13017 ?auto_13018 ) ) ( not ( = ?auto_13015 ?auto_13018 ) ) ( not ( = ?auto_13006 ?auto_13018 ) ) ( TRUCK-AT ?auto_13014 ?auto_13012 ) ( SURFACE-AT ?auto_13019 ?auto_13012 ) ( CLEAR ?auto_13019 ) ( LIFTING ?auto_13005 ?auto_13006 ) ( IS-CRATE ?auto_13006 ) ( not ( = ?auto_13019 ?auto_13006 ) ) ( not ( = ?auto_13003 ?auto_13019 ) ) ( not ( = ?auto_13004 ?auto_13019 ) ) ( not ( = ?auto_13013 ?auto_13019 ) ) ( not ( = ?auto_13017 ?auto_13019 ) ) ( not ( = ?auto_13015 ?auto_13019 ) ) ( not ( = ?auto_13018 ?auto_13019 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13019 ?auto_13006 )
      ( MAKE-2CRATE ?auto_13013 ?auto_13003 ?auto_13004 )
      ( MAKE-1CRATE-VERIFY ?auto_13003 ?auto_13004 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13020 - SURFACE
      ?auto_13021 - SURFACE
      ?auto_13022 - SURFACE
    )
    :vars
    (
      ?auto_13036 - HOIST
      ?auto_13027 - PLACE
      ?auto_13032 - PLACE
      ?auto_13028 - HOIST
      ?auto_13033 - SURFACE
      ?auto_13029 - PLACE
      ?auto_13031 - HOIST
      ?auto_13026 - SURFACE
      ?auto_13035 - SURFACE
      ?auto_13025 - PLACE
      ?auto_13023 - HOIST
      ?auto_13030 - SURFACE
      ?auto_13024 - TRUCK
      ?auto_13034 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13036 ?auto_13027 ) ( IS-CRATE ?auto_13022 ) ( not ( = ?auto_13021 ?auto_13022 ) ) ( not ( = ?auto_13020 ?auto_13021 ) ) ( not ( = ?auto_13020 ?auto_13022 ) ) ( not ( = ?auto_13032 ?auto_13027 ) ) ( HOIST-AT ?auto_13028 ?auto_13032 ) ( not ( = ?auto_13036 ?auto_13028 ) ) ( AVAILABLE ?auto_13028 ) ( SURFACE-AT ?auto_13022 ?auto_13032 ) ( ON ?auto_13022 ?auto_13033 ) ( CLEAR ?auto_13022 ) ( not ( = ?auto_13021 ?auto_13033 ) ) ( not ( = ?auto_13022 ?auto_13033 ) ) ( not ( = ?auto_13020 ?auto_13033 ) ) ( IS-CRATE ?auto_13021 ) ( not ( = ?auto_13029 ?auto_13027 ) ) ( not ( = ?auto_13032 ?auto_13029 ) ) ( HOIST-AT ?auto_13031 ?auto_13029 ) ( not ( = ?auto_13036 ?auto_13031 ) ) ( not ( = ?auto_13028 ?auto_13031 ) ) ( AVAILABLE ?auto_13031 ) ( SURFACE-AT ?auto_13021 ?auto_13029 ) ( ON ?auto_13021 ?auto_13026 ) ( CLEAR ?auto_13021 ) ( not ( = ?auto_13021 ?auto_13026 ) ) ( not ( = ?auto_13022 ?auto_13026 ) ) ( not ( = ?auto_13020 ?auto_13026 ) ) ( not ( = ?auto_13033 ?auto_13026 ) ) ( IS-CRATE ?auto_13020 ) ( not ( = ?auto_13035 ?auto_13020 ) ) ( not ( = ?auto_13021 ?auto_13035 ) ) ( not ( = ?auto_13022 ?auto_13035 ) ) ( not ( = ?auto_13033 ?auto_13035 ) ) ( not ( = ?auto_13026 ?auto_13035 ) ) ( not ( = ?auto_13025 ?auto_13027 ) ) ( not ( = ?auto_13032 ?auto_13025 ) ) ( not ( = ?auto_13029 ?auto_13025 ) ) ( HOIST-AT ?auto_13023 ?auto_13025 ) ( not ( = ?auto_13036 ?auto_13023 ) ) ( not ( = ?auto_13028 ?auto_13023 ) ) ( not ( = ?auto_13031 ?auto_13023 ) ) ( AVAILABLE ?auto_13023 ) ( SURFACE-AT ?auto_13020 ?auto_13025 ) ( ON ?auto_13020 ?auto_13030 ) ( CLEAR ?auto_13020 ) ( not ( = ?auto_13021 ?auto_13030 ) ) ( not ( = ?auto_13022 ?auto_13030 ) ) ( not ( = ?auto_13020 ?auto_13030 ) ) ( not ( = ?auto_13033 ?auto_13030 ) ) ( not ( = ?auto_13026 ?auto_13030 ) ) ( not ( = ?auto_13035 ?auto_13030 ) ) ( TRUCK-AT ?auto_13024 ?auto_13027 ) ( SURFACE-AT ?auto_13034 ?auto_13027 ) ( CLEAR ?auto_13034 ) ( LIFTING ?auto_13036 ?auto_13035 ) ( IS-CRATE ?auto_13035 ) ( not ( = ?auto_13034 ?auto_13035 ) ) ( not ( = ?auto_13021 ?auto_13034 ) ) ( not ( = ?auto_13022 ?auto_13034 ) ) ( not ( = ?auto_13020 ?auto_13034 ) ) ( not ( = ?auto_13033 ?auto_13034 ) ) ( not ( = ?auto_13026 ?auto_13034 ) ) ( not ( = ?auto_13030 ?auto_13034 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13021 ?auto_13022 )
      ( MAKE-2CRATE-VERIFY ?auto_13020 ?auto_13021 ?auto_13022 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13037 - SURFACE
      ?auto_13038 - SURFACE
      ?auto_13039 - SURFACE
      ?auto_13040 - SURFACE
    )
    :vars
    (
      ?auto_13050 - HOIST
      ?auto_13042 - PLACE
      ?auto_13045 - PLACE
      ?auto_13053 - HOIST
      ?auto_13052 - SURFACE
      ?auto_13041 - PLACE
      ?auto_13047 - HOIST
      ?auto_13051 - SURFACE
      ?auto_13046 - PLACE
      ?auto_13048 - HOIST
      ?auto_13043 - SURFACE
      ?auto_13049 - TRUCK
      ?auto_13044 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13050 ?auto_13042 ) ( IS-CRATE ?auto_13040 ) ( not ( = ?auto_13039 ?auto_13040 ) ) ( not ( = ?auto_13038 ?auto_13039 ) ) ( not ( = ?auto_13038 ?auto_13040 ) ) ( not ( = ?auto_13045 ?auto_13042 ) ) ( HOIST-AT ?auto_13053 ?auto_13045 ) ( not ( = ?auto_13050 ?auto_13053 ) ) ( AVAILABLE ?auto_13053 ) ( SURFACE-AT ?auto_13040 ?auto_13045 ) ( ON ?auto_13040 ?auto_13052 ) ( CLEAR ?auto_13040 ) ( not ( = ?auto_13039 ?auto_13052 ) ) ( not ( = ?auto_13040 ?auto_13052 ) ) ( not ( = ?auto_13038 ?auto_13052 ) ) ( IS-CRATE ?auto_13039 ) ( not ( = ?auto_13041 ?auto_13042 ) ) ( not ( = ?auto_13045 ?auto_13041 ) ) ( HOIST-AT ?auto_13047 ?auto_13041 ) ( not ( = ?auto_13050 ?auto_13047 ) ) ( not ( = ?auto_13053 ?auto_13047 ) ) ( AVAILABLE ?auto_13047 ) ( SURFACE-AT ?auto_13039 ?auto_13041 ) ( ON ?auto_13039 ?auto_13051 ) ( CLEAR ?auto_13039 ) ( not ( = ?auto_13039 ?auto_13051 ) ) ( not ( = ?auto_13040 ?auto_13051 ) ) ( not ( = ?auto_13038 ?auto_13051 ) ) ( not ( = ?auto_13052 ?auto_13051 ) ) ( IS-CRATE ?auto_13038 ) ( not ( = ?auto_13037 ?auto_13038 ) ) ( not ( = ?auto_13039 ?auto_13037 ) ) ( not ( = ?auto_13040 ?auto_13037 ) ) ( not ( = ?auto_13052 ?auto_13037 ) ) ( not ( = ?auto_13051 ?auto_13037 ) ) ( not ( = ?auto_13046 ?auto_13042 ) ) ( not ( = ?auto_13045 ?auto_13046 ) ) ( not ( = ?auto_13041 ?auto_13046 ) ) ( HOIST-AT ?auto_13048 ?auto_13046 ) ( not ( = ?auto_13050 ?auto_13048 ) ) ( not ( = ?auto_13053 ?auto_13048 ) ) ( not ( = ?auto_13047 ?auto_13048 ) ) ( AVAILABLE ?auto_13048 ) ( SURFACE-AT ?auto_13038 ?auto_13046 ) ( ON ?auto_13038 ?auto_13043 ) ( CLEAR ?auto_13038 ) ( not ( = ?auto_13039 ?auto_13043 ) ) ( not ( = ?auto_13040 ?auto_13043 ) ) ( not ( = ?auto_13038 ?auto_13043 ) ) ( not ( = ?auto_13052 ?auto_13043 ) ) ( not ( = ?auto_13051 ?auto_13043 ) ) ( not ( = ?auto_13037 ?auto_13043 ) ) ( TRUCK-AT ?auto_13049 ?auto_13042 ) ( SURFACE-AT ?auto_13044 ?auto_13042 ) ( CLEAR ?auto_13044 ) ( LIFTING ?auto_13050 ?auto_13037 ) ( IS-CRATE ?auto_13037 ) ( not ( = ?auto_13044 ?auto_13037 ) ) ( not ( = ?auto_13039 ?auto_13044 ) ) ( not ( = ?auto_13040 ?auto_13044 ) ) ( not ( = ?auto_13038 ?auto_13044 ) ) ( not ( = ?auto_13052 ?auto_13044 ) ) ( not ( = ?auto_13051 ?auto_13044 ) ) ( not ( = ?auto_13043 ?auto_13044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13038 ?auto_13039 ?auto_13040 )
      ( MAKE-3CRATE-VERIFY ?auto_13037 ?auto_13038 ?auto_13039 ?auto_13040 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13054 - SURFACE
      ?auto_13055 - SURFACE
      ?auto_13056 - SURFACE
      ?auto_13057 - SURFACE
      ?auto_13058 - SURFACE
    )
    :vars
    (
      ?auto_13067 - HOIST
      ?auto_13060 - PLACE
      ?auto_13062 - PLACE
      ?auto_13070 - HOIST
      ?auto_13069 - SURFACE
      ?auto_13059 - PLACE
      ?auto_13064 - HOIST
      ?auto_13068 - SURFACE
      ?auto_13063 - PLACE
      ?auto_13065 - HOIST
      ?auto_13061 - SURFACE
      ?auto_13066 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13067 ?auto_13060 ) ( IS-CRATE ?auto_13058 ) ( not ( = ?auto_13057 ?auto_13058 ) ) ( not ( = ?auto_13056 ?auto_13057 ) ) ( not ( = ?auto_13056 ?auto_13058 ) ) ( not ( = ?auto_13062 ?auto_13060 ) ) ( HOIST-AT ?auto_13070 ?auto_13062 ) ( not ( = ?auto_13067 ?auto_13070 ) ) ( AVAILABLE ?auto_13070 ) ( SURFACE-AT ?auto_13058 ?auto_13062 ) ( ON ?auto_13058 ?auto_13069 ) ( CLEAR ?auto_13058 ) ( not ( = ?auto_13057 ?auto_13069 ) ) ( not ( = ?auto_13058 ?auto_13069 ) ) ( not ( = ?auto_13056 ?auto_13069 ) ) ( IS-CRATE ?auto_13057 ) ( not ( = ?auto_13059 ?auto_13060 ) ) ( not ( = ?auto_13062 ?auto_13059 ) ) ( HOIST-AT ?auto_13064 ?auto_13059 ) ( not ( = ?auto_13067 ?auto_13064 ) ) ( not ( = ?auto_13070 ?auto_13064 ) ) ( AVAILABLE ?auto_13064 ) ( SURFACE-AT ?auto_13057 ?auto_13059 ) ( ON ?auto_13057 ?auto_13068 ) ( CLEAR ?auto_13057 ) ( not ( = ?auto_13057 ?auto_13068 ) ) ( not ( = ?auto_13058 ?auto_13068 ) ) ( not ( = ?auto_13056 ?auto_13068 ) ) ( not ( = ?auto_13069 ?auto_13068 ) ) ( IS-CRATE ?auto_13056 ) ( not ( = ?auto_13055 ?auto_13056 ) ) ( not ( = ?auto_13057 ?auto_13055 ) ) ( not ( = ?auto_13058 ?auto_13055 ) ) ( not ( = ?auto_13069 ?auto_13055 ) ) ( not ( = ?auto_13068 ?auto_13055 ) ) ( not ( = ?auto_13063 ?auto_13060 ) ) ( not ( = ?auto_13062 ?auto_13063 ) ) ( not ( = ?auto_13059 ?auto_13063 ) ) ( HOIST-AT ?auto_13065 ?auto_13063 ) ( not ( = ?auto_13067 ?auto_13065 ) ) ( not ( = ?auto_13070 ?auto_13065 ) ) ( not ( = ?auto_13064 ?auto_13065 ) ) ( AVAILABLE ?auto_13065 ) ( SURFACE-AT ?auto_13056 ?auto_13063 ) ( ON ?auto_13056 ?auto_13061 ) ( CLEAR ?auto_13056 ) ( not ( = ?auto_13057 ?auto_13061 ) ) ( not ( = ?auto_13058 ?auto_13061 ) ) ( not ( = ?auto_13056 ?auto_13061 ) ) ( not ( = ?auto_13069 ?auto_13061 ) ) ( not ( = ?auto_13068 ?auto_13061 ) ) ( not ( = ?auto_13055 ?auto_13061 ) ) ( TRUCK-AT ?auto_13066 ?auto_13060 ) ( SURFACE-AT ?auto_13054 ?auto_13060 ) ( CLEAR ?auto_13054 ) ( LIFTING ?auto_13067 ?auto_13055 ) ( IS-CRATE ?auto_13055 ) ( not ( = ?auto_13054 ?auto_13055 ) ) ( not ( = ?auto_13057 ?auto_13054 ) ) ( not ( = ?auto_13058 ?auto_13054 ) ) ( not ( = ?auto_13056 ?auto_13054 ) ) ( not ( = ?auto_13069 ?auto_13054 ) ) ( not ( = ?auto_13068 ?auto_13054 ) ) ( not ( = ?auto_13061 ?auto_13054 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13056 ?auto_13057 ?auto_13058 )
      ( MAKE-4CRATE-VERIFY ?auto_13054 ?auto_13055 ?auto_13056 ?auto_13057 ?auto_13058 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13071 - SURFACE
      ?auto_13072 - SURFACE
    )
    :vars
    (
      ?auto_13082 - HOIST
      ?auto_13074 - PLACE
      ?auto_13083 - SURFACE
      ?auto_13077 - PLACE
      ?auto_13087 - HOIST
      ?auto_13086 - SURFACE
      ?auto_13073 - PLACE
      ?auto_13079 - HOIST
      ?auto_13084 - SURFACE
      ?auto_13085 - SURFACE
      ?auto_13078 - PLACE
      ?auto_13080 - HOIST
      ?auto_13075 - SURFACE
      ?auto_13081 - TRUCK
      ?auto_13076 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13082 ?auto_13074 ) ( IS-CRATE ?auto_13072 ) ( not ( = ?auto_13071 ?auto_13072 ) ) ( not ( = ?auto_13083 ?auto_13071 ) ) ( not ( = ?auto_13083 ?auto_13072 ) ) ( not ( = ?auto_13077 ?auto_13074 ) ) ( HOIST-AT ?auto_13087 ?auto_13077 ) ( not ( = ?auto_13082 ?auto_13087 ) ) ( AVAILABLE ?auto_13087 ) ( SURFACE-AT ?auto_13072 ?auto_13077 ) ( ON ?auto_13072 ?auto_13086 ) ( CLEAR ?auto_13072 ) ( not ( = ?auto_13071 ?auto_13086 ) ) ( not ( = ?auto_13072 ?auto_13086 ) ) ( not ( = ?auto_13083 ?auto_13086 ) ) ( IS-CRATE ?auto_13071 ) ( not ( = ?auto_13073 ?auto_13074 ) ) ( not ( = ?auto_13077 ?auto_13073 ) ) ( HOIST-AT ?auto_13079 ?auto_13073 ) ( not ( = ?auto_13082 ?auto_13079 ) ) ( not ( = ?auto_13087 ?auto_13079 ) ) ( AVAILABLE ?auto_13079 ) ( SURFACE-AT ?auto_13071 ?auto_13073 ) ( ON ?auto_13071 ?auto_13084 ) ( CLEAR ?auto_13071 ) ( not ( = ?auto_13071 ?auto_13084 ) ) ( not ( = ?auto_13072 ?auto_13084 ) ) ( not ( = ?auto_13083 ?auto_13084 ) ) ( not ( = ?auto_13086 ?auto_13084 ) ) ( IS-CRATE ?auto_13083 ) ( not ( = ?auto_13085 ?auto_13083 ) ) ( not ( = ?auto_13071 ?auto_13085 ) ) ( not ( = ?auto_13072 ?auto_13085 ) ) ( not ( = ?auto_13086 ?auto_13085 ) ) ( not ( = ?auto_13084 ?auto_13085 ) ) ( not ( = ?auto_13078 ?auto_13074 ) ) ( not ( = ?auto_13077 ?auto_13078 ) ) ( not ( = ?auto_13073 ?auto_13078 ) ) ( HOIST-AT ?auto_13080 ?auto_13078 ) ( not ( = ?auto_13082 ?auto_13080 ) ) ( not ( = ?auto_13087 ?auto_13080 ) ) ( not ( = ?auto_13079 ?auto_13080 ) ) ( AVAILABLE ?auto_13080 ) ( SURFACE-AT ?auto_13083 ?auto_13078 ) ( ON ?auto_13083 ?auto_13075 ) ( CLEAR ?auto_13083 ) ( not ( = ?auto_13071 ?auto_13075 ) ) ( not ( = ?auto_13072 ?auto_13075 ) ) ( not ( = ?auto_13083 ?auto_13075 ) ) ( not ( = ?auto_13086 ?auto_13075 ) ) ( not ( = ?auto_13084 ?auto_13075 ) ) ( not ( = ?auto_13085 ?auto_13075 ) ) ( TRUCK-AT ?auto_13081 ?auto_13074 ) ( SURFACE-AT ?auto_13076 ?auto_13074 ) ( CLEAR ?auto_13076 ) ( IS-CRATE ?auto_13085 ) ( not ( = ?auto_13076 ?auto_13085 ) ) ( not ( = ?auto_13071 ?auto_13076 ) ) ( not ( = ?auto_13072 ?auto_13076 ) ) ( not ( = ?auto_13083 ?auto_13076 ) ) ( not ( = ?auto_13086 ?auto_13076 ) ) ( not ( = ?auto_13084 ?auto_13076 ) ) ( not ( = ?auto_13075 ?auto_13076 ) ) ( AVAILABLE ?auto_13082 ) ( IN ?auto_13085 ?auto_13081 ) )
    :subtasks
    ( ( !UNLOAD ?auto_13082 ?auto_13085 ?auto_13081 ?auto_13074 )
      ( MAKE-2CRATE ?auto_13083 ?auto_13071 ?auto_13072 )
      ( MAKE-1CRATE-VERIFY ?auto_13071 ?auto_13072 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13088 - SURFACE
      ?auto_13089 - SURFACE
      ?auto_13090 - SURFACE
    )
    :vars
    (
      ?auto_13093 - HOIST
      ?auto_13103 - PLACE
      ?auto_13104 - PLACE
      ?auto_13098 - HOIST
      ?auto_13097 - SURFACE
      ?auto_13094 - PLACE
      ?auto_13100 - HOIST
      ?auto_13102 - SURFACE
      ?auto_13091 - SURFACE
      ?auto_13099 - PLACE
      ?auto_13095 - HOIST
      ?auto_13092 - SURFACE
      ?auto_13096 - TRUCK
      ?auto_13101 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13093 ?auto_13103 ) ( IS-CRATE ?auto_13090 ) ( not ( = ?auto_13089 ?auto_13090 ) ) ( not ( = ?auto_13088 ?auto_13089 ) ) ( not ( = ?auto_13088 ?auto_13090 ) ) ( not ( = ?auto_13104 ?auto_13103 ) ) ( HOIST-AT ?auto_13098 ?auto_13104 ) ( not ( = ?auto_13093 ?auto_13098 ) ) ( AVAILABLE ?auto_13098 ) ( SURFACE-AT ?auto_13090 ?auto_13104 ) ( ON ?auto_13090 ?auto_13097 ) ( CLEAR ?auto_13090 ) ( not ( = ?auto_13089 ?auto_13097 ) ) ( not ( = ?auto_13090 ?auto_13097 ) ) ( not ( = ?auto_13088 ?auto_13097 ) ) ( IS-CRATE ?auto_13089 ) ( not ( = ?auto_13094 ?auto_13103 ) ) ( not ( = ?auto_13104 ?auto_13094 ) ) ( HOIST-AT ?auto_13100 ?auto_13094 ) ( not ( = ?auto_13093 ?auto_13100 ) ) ( not ( = ?auto_13098 ?auto_13100 ) ) ( AVAILABLE ?auto_13100 ) ( SURFACE-AT ?auto_13089 ?auto_13094 ) ( ON ?auto_13089 ?auto_13102 ) ( CLEAR ?auto_13089 ) ( not ( = ?auto_13089 ?auto_13102 ) ) ( not ( = ?auto_13090 ?auto_13102 ) ) ( not ( = ?auto_13088 ?auto_13102 ) ) ( not ( = ?auto_13097 ?auto_13102 ) ) ( IS-CRATE ?auto_13088 ) ( not ( = ?auto_13091 ?auto_13088 ) ) ( not ( = ?auto_13089 ?auto_13091 ) ) ( not ( = ?auto_13090 ?auto_13091 ) ) ( not ( = ?auto_13097 ?auto_13091 ) ) ( not ( = ?auto_13102 ?auto_13091 ) ) ( not ( = ?auto_13099 ?auto_13103 ) ) ( not ( = ?auto_13104 ?auto_13099 ) ) ( not ( = ?auto_13094 ?auto_13099 ) ) ( HOIST-AT ?auto_13095 ?auto_13099 ) ( not ( = ?auto_13093 ?auto_13095 ) ) ( not ( = ?auto_13098 ?auto_13095 ) ) ( not ( = ?auto_13100 ?auto_13095 ) ) ( AVAILABLE ?auto_13095 ) ( SURFACE-AT ?auto_13088 ?auto_13099 ) ( ON ?auto_13088 ?auto_13092 ) ( CLEAR ?auto_13088 ) ( not ( = ?auto_13089 ?auto_13092 ) ) ( not ( = ?auto_13090 ?auto_13092 ) ) ( not ( = ?auto_13088 ?auto_13092 ) ) ( not ( = ?auto_13097 ?auto_13092 ) ) ( not ( = ?auto_13102 ?auto_13092 ) ) ( not ( = ?auto_13091 ?auto_13092 ) ) ( TRUCK-AT ?auto_13096 ?auto_13103 ) ( SURFACE-AT ?auto_13101 ?auto_13103 ) ( CLEAR ?auto_13101 ) ( IS-CRATE ?auto_13091 ) ( not ( = ?auto_13101 ?auto_13091 ) ) ( not ( = ?auto_13089 ?auto_13101 ) ) ( not ( = ?auto_13090 ?auto_13101 ) ) ( not ( = ?auto_13088 ?auto_13101 ) ) ( not ( = ?auto_13097 ?auto_13101 ) ) ( not ( = ?auto_13102 ?auto_13101 ) ) ( not ( = ?auto_13092 ?auto_13101 ) ) ( AVAILABLE ?auto_13093 ) ( IN ?auto_13091 ?auto_13096 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13089 ?auto_13090 )
      ( MAKE-2CRATE-VERIFY ?auto_13088 ?auto_13089 ?auto_13090 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13105 - SURFACE
      ?auto_13106 - SURFACE
      ?auto_13107 - SURFACE
      ?auto_13108 - SURFACE
    )
    :vars
    (
      ?auto_13110 - HOIST
      ?auto_13119 - PLACE
      ?auto_13118 - PLACE
      ?auto_13111 - HOIST
      ?auto_13113 - SURFACE
      ?auto_13112 - PLACE
      ?auto_13109 - HOIST
      ?auto_13120 - SURFACE
      ?auto_13114 - PLACE
      ?auto_13115 - HOIST
      ?auto_13121 - SURFACE
      ?auto_13116 - TRUCK
      ?auto_13117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13110 ?auto_13119 ) ( IS-CRATE ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13108 ) ) ( not ( = ?auto_13106 ?auto_13107 ) ) ( not ( = ?auto_13106 ?auto_13108 ) ) ( not ( = ?auto_13118 ?auto_13119 ) ) ( HOIST-AT ?auto_13111 ?auto_13118 ) ( not ( = ?auto_13110 ?auto_13111 ) ) ( AVAILABLE ?auto_13111 ) ( SURFACE-AT ?auto_13108 ?auto_13118 ) ( ON ?auto_13108 ?auto_13113 ) ( CLEAR ?auto_13108 ) ( not ( = ?auto_13107 ?auto_13113 ) ) ( not ( = ?auto_13108 ?auto_13113 ) ) ( not ( = ?auto_13106 ?auto_13113 ) ) ( IS-CRATE ?auto_13107 ) ( not ( = ?auto_13112 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13112 ) ) ( HOIST-AT ?auto_13109 ?auto_13112 ) ( not ( = ?auto_13110 ?auto_13109 ) ) ( not ( = ?auto_13111 ?auto_13109 ) ) ( AVAILABLE ?auto_13109 ) ( SURFACE-AT ?auto_13107 ?auto_13112 ) ( ON ?auto_13107 ?auto_13120 ) ( CLEAR ?auto_13107 ) ( not ( = ?auto_13107 ?auto_13120 ) ) ( not ( = ?auto_13108 ?auto_13120 ) ) ( not ( = ?auto_13106 ?auto_13120 ) ) ( not ( = ?auto_13113 ?auto_13120 ) ) ( IS-CRATE ?auto_13106 ) ( not ( = ?auto_13105 ?auto_13106 ) ) ( not ( = ?auto_13107 ?auto_13105 ) ) ( not ( = ?auto_13108 ?auto_13105 ) ) ( not ( = ?auto_13113 ?auto_13105 ) ) ( not ( = ?auto_13120 ?auto_13105 ) ) ( not ( = ?auto_13114 ?auto_13119 ) ) ( not ( = ?auto_13118 ?auto_13114 ) ) ( not ( = ?auto_13112 ?auto_13114 ) ) ( HOIST-AT ?auto_13115 ?auto_13114 ) ( not ( = ?auto_13110 ?auto_13115 ) ) ( not ( = ?auto_13111 ?auto_13115 ) ) ( not ( = ?auto_13109 ?auto_13115 ) ) ( AVAILABLE ?auto_13115 ) ( SURFACE-AT ?auto_13106 ?auto_13114 ) ( ON ?auto_13106 ?auto_13121 ) ( CLEAR ?auto_13106 ) ( not ( = ?auto_13107 ?auto_13121 ) ) ( not ( = ?auto_13108 ?auto_13121 ) ) ( not ( = ?auto_13106 ?auto_13121 ) ) ( not ( = ?auto_13113 ?auto_13121 ) ) ( not ( = ?auto_13120 ?auto_13121 ) ) ( not ( = ?auto_13105 ?auto_13121 ) ) ( TRUCK-AT ?auto_13116 ?auto_13119 ) ( SURFACE-AT ?auto_13117 ?auto_13119 ) ( CLEAR ?auto_13117 ) ( IS-CRATE ?auto_13105 ) ( not ( = ?auto_13117 ?auto_13105 ) ) ( not ( = ?auto_13107 ?auto_13117 ) ) ( not ( = ?auto_13108 ?auto_13117 ) ) ( not ( = ?auto_13106 ?auto_13117 ) ) ( not ( = ?auto_13113 ?auto_13117 ) ) ( not ( = ?auto_13120 ?auto_13117 ) ) ( not ( = ?auto_13121 ?auto_13117 ) ) ( AVAILABLE ?auto_13110 ) ( IN ?auto_13105 ?auto_13116 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13106 ?auto_13107 ?auto_13108 )
      ( MAKE-3CRATE-VERIFY ?auto_13105 ?auto_13106 ?auto_13107 ?auto_13108 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13122 - SURFACE
      ?auto_13123 - SURFACE
      ?auto_13124 - SURFACE
      ?auto_13125 - SURFACE
      ?auto_13126 - SURFACE
    )
    :vars
    (
      ?auto_13128 - HOIST
      ?auto_13136 - PLACE
      ?auto_13135 - PLACE
      ?auto_13129 - HOIST
      ?auto_13131 - SURFACE
      ?auto_13130 - PLACE
      ?auto_13127 - HOIST
      ?auto_13137 - SURFACE
      ?auto_13132 - PLACE
      ?auto_13133 - HOIST
      ?auto_13138 - SURFACE
      ?auto_13134 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13128 ?auto_13136 ) ( IS-CRATE ?auto_13126 ) ( not ( = ?auto_13125 ?auto_13126 ) ) ( not ( = ?auto_13124 ?auto_13125 ) ) ( not ( = ?auto_13124 ?auto_13126 ) ) ( not ( = ?auto_13135 ?auto_13136 ) ) ( HOIST-AT ?auto_13129 ?auto_13135 ) ( not ( = ?auto_13128 ?auto_13129 ) ) ( AVAILABLE ?auto_13129 ) ( SURFACE-AT ?auto_13126 ?auto_13135 ) ( ON ?auto_13126 ?auto_13131 ) ( CLEAR ?auto_13126 ) ( not ( = ?auto_13125 ?auto_13131 ) ) ( not ( = ?auto_13126 ?auto_13131 ) ) ( not ( = ?auto_13124 ?auto_13131 ) ) ( IS-CRATE ?auto_13125 ) ( not ( = ?auto_13130 ?auto_13136 ) ) ( not ( = ?auto_13135 ?auto_13130 ) ) ( HOIST-AT ?auto_13127 ?auto_13130 ) ( not ( = ?auto_13128 ?auto_13127 ) ) ( not ( = ?auto_13129 ?auto_13127 ) ) ( AVAILABLE ?auto_13127 ) ( SURFACE-AT ?auto_13125 ?auto_13130 ) ( ON ?auto_13125 ?auto_13137 ) ( CLEAR ?auto_13125 ) ( not ( = ?auto_13125 ?auto_13137 ) ) ( not ( = ?auto_13126 ?auto_13137 ) ) ( not ( = ?auto_13124 ?auto_13137 ) ) ( not ( = ?auto_13131 ?auto_13137 ) ) ( IS-CRATE ?auto_13124 ) ( not ( = ?auto_13123 ?auto_13124 ) ) ( not ( = ?auto_13125 ?auto_13123 ) ) ( not ( = ?auto_13126 ?auto_13123 ) ) ( not ( = ?auto_13131 ?auto_13123 ) ) ( not ( = ?auto_13137 ?auto_13123 ) ) ( not ( = ?auto_13132 ?auto_13136 ) ) ( not ( = ?auto_13135 ?auto_13132 ) ) ( not ( = ?auto_13130 ?auto_13132 ) ) ( HOIST-AT ?auto_13133 ?auto_13132 ) ( not ( = ?auto_13128 ?auto_13133 ) ) ( not ( = ?auto_13129 ?auto_13133 ) ) ( not ( = ?auto_13127 ?auto_13133 ) ) ( AVAILABLE ?auto_13133 ) ( SURFACE-AT ?auto_13124 ?auto_13132 ) ( ON ?auto_13124 ?auto_13138 ) ( CLEAR ?auto_13124 ) ( not ( = ?auto_13125 ?auto_13138 ) ) ( not ( = ?auto_13126 ?auto_13138 ) ) ( not ( = ?auto_13124 ?auto_13138 ) ) ( not ( = ?auto_13131 ?auto_13138 ) ) ( not ( = ?auto_13137 ?auto_13138 ) ) ( not ( = ?auto_13123 ?auto_13138 ) ) ( TRUCK-AT ?auto_13134 ?auto_13136 ) ( SURFACE-AT ?auto_13122 ?auto_13136 ) ( CLEAR ?auto_13122 ) ( IS-CRATE ?auto_13123 ) ( not ( = ?auto_13122 ?auto_13123 ) ) ( not ( = ?auto_13125 ?auto_13122 ) ) ( not ( = ?auto_13126 ?auto_13122 ) ) ( not ( = ?auto_13124 ?auto_13122 ) ) ( not ( = ?auto_13131 ?auto_13122 ) ) ( not ( = ?auto_13137 ?auto_13122 ) ) ( not ( = ?auto_13138 ?auto_13122 ) ) ( AVAILABLE ?auto_13128 ) ( IN ?auto_13123 ?auto_13134 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13124 ?auto_13125 ?auto_13126 )
      ( MAKE-4CRATE-VERIFY ?auto_13122 ?auto_13123 ?auto_13124 ?auto_13125 ?auto_13126 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13139 - SURFACE
      ?auto_13140 - SURFACE
    )
    :vars
    (
      ?auto_13142 - HOIST
      ?auto_13151 - PLACE
      ?auto_13153 - SURFACE
      ?auto_13150 - PLACE
      ?auto_13143 - HOIST
      ?auto_13145 - SURFACE
      ?auto_13144 - PLACE
      ?auto_13141 - HOIST
      ?auto_13152 - SURFACE
      ?auto_13155 - SURFACE
      ?auto_13146 - PLACE
      ?auto_13147 - HOIST
      ?auto_13154 - SURFACE
      ?auto_13149 - SURFACE
      ?auto_13148 - TRUCK
      ?auto_13156 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13142 ?auto_13151 ) ( IS-CRATE ?auto_13140 ) ( not ( = ?auto_13139 ?auto_13140 ) ) ( not ( = ?auto_13153 ?auto_13139 ) ) ( not ( = ?auto_13153 ?auto_13140 ) ) ( not ( = ?auto_13150 ?auto_13151 ) ) ( HOIST-AT ?auto_13143 ?auto_13150 ) ( not ( = ?auto_13142 ?auto_13143 ) ) ( AVAILABLE ?auto_13143 ) ( SURFACE-AT ?auto_13140 ?auto_13150 ) ( ON ?auto_13140 ?auto_13145 ) ( CLEAR ?auto_13140 ) ( not ( = ?auto_13139 ?auto_13145 ) ) ( not ( = ?auto_13140 ?auto_13145 ) ) ( not ( = ?auto_13153 ?auto_13145 ) ) ( IS-CRATE ?auto_13139 ) ( not ( = ?auto_13144 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13144 ) ) ( HOIST-AT ?auto_13141 ?auto_13144 ) ( not ( = ?auto_13142 ?auto_13141 ) ) ( not ( = ?auto_13143 ?auto_13141 ) ) ( AVAILABLE ?auto_13141 ) ( SURFACE-AT ?auto_13139 ?auto_13144 ) ( ON ?auto_13139 ?auto_13152 ) ( CLEAR ?auto_13139 ) ( not ( = ?auto_13139 ?auto_13152 ) ) ( not ( = ?auto_13140 ?auto_13152 ) ) ( not ( = ?auto_13153 ?auto_13152 ) ) ( not ( = ?auto_13145 ?auto_13152 ) ) ( IS-CRATE ?auto_13153 ) ( not ( = ?auto_13155 ?auto_13153 ) ) ( not ( = ?auto_13139 ?auto_13155 ) ) ( not ( = ?auto_13140 ?auto_13155 ) ) ( not ( = ?auto_13145 ?auto_13155 ) ) ( not ( = ?auto_13152 ?auto_13155 ) ) ( not ( = ?auto_13146 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13146 ) ) ( not ( = ?auto_13144 ?auto_13146 ) ) ( HOIST-AT ?auto_13147 ?auto_13146 ) ( not ( = ?auto_13142 ?auto_13147 ) ) ( not ( = ?auto_13143 ?auto_13147 ) ) ( not ( = ?auto_13141 ?auto_13147 ) ) ( AVAILABLE ?auto_13147 ) ( SURFACE-AT ?auto_13153 ?auto_13146 ) ( ON ?auto_13153 ?auto_13154 ) ( CLEAR ?auto_13153 ) ( not ( = ?auto_13139 ?auto_13154 ) ) ( not ( = ?auto_13140 ?auto_13154 ) ) ( not ( = ?auto_13153 ?auto_13154 ) ) ( not ( = ?auto_13145 ?auto_13154 ) ) ( not ( = ?auto_13152 ?auto_13154 ) ) ( not ( = ?auto_13155 ?auto_13154 ) ) ( SURFACE-AT ?auto_13149 ?auto_13151 ) ( CLEAR ?auto_13149 ) ( IS-CRATE ?auto_13155 ) ( not ( = ?auto_13149 ?auto_13155 ) ) ( not ( = ?auto_13139 ?auto_13149 ) ) ( not ( = ?auto_13140 ?auto_13149 ) ) ( not ( = ?auto_13153 ?auto_13149 ) ) ( not ( = ?auto_13145 ?auto_13149 ) ) ( not ( = ?auto_13152 ?auto_13149 ) ) ( not ( = ?auto_13154 ?auto_13149 ) ) ( AVAILABLE ?auto_13142 ) ( IN ?auto_13155 ?auto_13148 ) ( TRUCK-AT ?auto_13148 ?auto_13156 ) ( not ( = ?auto_13156 ?auto_13151 ) ) ( not ( = ?auto_13150 ?auto_13156 ) ) ( not ( = ?auto_13144 ?auto_13156 ) ) ( not ( = ?auto_13146 ?auto_13156 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_13148 ?auto_13156 ?auto_13151 )
      ( MAKE-2CRATE ?auto_13153 ?auto_13139 ?auto_13140 )
      ( MAKE-1CRATE-VERIFY ?auto_13139 ?auto_13140 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13157 - SURFACE
      ?auto_13158 - SURFACE
      ?auto_13159 - SURFACE
    )
    :vars
    (
      ?auto_13170 - HOIST
      ?auto_13172 - PLACE
      ?auto_13166 - PLACE
      ?auto_13168 - HOIST
      ?auto_13167 - SURFACE
      ?auto_13171 - PLACE
      ?auto_13173 - HOIST
      ?auto_13164 - SURFACE
      ?auto_13165 - SURFACE
      ?auto_13162 - PLACE
      ?auto_13163 - HOIST
      ?auto_13169 - SURFACE
      ?auto_13161 - SURFACE
      ?auto_13160 - TRUCK
      ?auto_13174 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13170 ?auto_13172 ) ( IS-CRATE ?auto_13159 ) ( not ( = ?auto_13158 ?auto_13159 ) ) ( not ( = ?auto_13157 ?auto_13158 ) ) ( not ( = ?auto_13157 ?auto_13159 ) ) ( not ( = ?auto_13166 ?auto_13172 ) ) ( HOIST-AT ?auto_13168 ?auto_13166 ) ( not ( = ?auto_13170 ?auto_13168 ) ) ( AVAILABLE ?auto_13168 ) ( SURFACE-AT ?auto_13159 ?auto_13166 ) ( ON ?auto_13159 ?auto_13167 ) ( CLEAR ?auto_13159 ) ( not ( = ?auto_13158 ?auto_13167 ) ) ( not ( = ?auto_13159 ?auto_13167 ) ) ( not ( = ?auto_13157 ?auto_13167 ) ) ( IS-CRATE ?auto_13158 ) ( not ( = ?auto_13171 ?auto_13172 ) ) ( not ( = ?auto_13166 ?auto_13171 ) ) ( HOIST-AT ?auto_13173 ?auto_13171 ) ( not ( = ?auto_13170 ?auto_13173 ) ) ( not ( = ?auto_13168 ?auto_13173 ) ) ( AVAILABLE ?auto_13173 ) ( SURFACE-AT ?auto_13158 ?auto_13171 ) ( ON ?auto_13158 ?auto_13164 ) ( CLEAR ?auto_13158 ) ( not ( = ?auto_13158 ?auto_13164 ) ) ( not ( = ?auto_13159 ?auto_13164 ) ) ( not ( = ?auto_13157 ?auto_13164 ) ) ( not ( = ?auto_13167 ?auto_13164 ) ) ( IS-CRATE ?auto_13157 ) ( not ( = ?auto_13165 ?auto_13157 ) ) ( not ( = ?auto_13158 ?auto_13165 ) ) ( not ( = ?auto_13159 ?auto_13165 ) ) ( not ( = ?auto_13167 ?auto_13165 ) ) ( not ( = ?auto_13164 ?auto_13165 ) ) ( not ( = ?auto_13162 ?auto_13172 ) ) ( not ( = ?auto_13166 ?auto_13162 ) ) ( not ( = ?auto_13171 ?auto_13162 ) ) ( HOIST-AT ?auto_13163 ?auto_13162 ) ( not ( = ?auto_13170 ?auto_13163 ) ) ( not ( = ?auto_13168 ?auto_13163 ) ) ( not ( = ?auto_13173 ?auto_13163 ) ) ( AVAILABLE ?auto_13163 ) ( SURFACE-AT ?auto_13157 ?auto_13162 ) ( ON ?auto_13157 ?auto_13169 ) ( CLEAR ?auto_13157 ) ( not ( = ?auto_13158 ?auto_13169 ) ) ( not ( = ?auto_13159 ?auto_13169 ) ) ( not ( = ?auto_13157 ?auto_13169 ) ) ( not ( = ?auto_13167 ?auto_13169 ) ) ( not ( = ?auto_13164 ?auto_13169 ) ) ( not ( = ?auto_13165 ?auto_13169 ) ) ( SURFACE-AT ?auto_13161 ?auto_13172 ) ( CLEAR ?auto_13161 ) ( IS-CRATE ?auto_13165 ) ( not ( = ?auto_13161 ?auto_13165 ) ) ( not ( = ?auto_13158 ?auto_13161 ) ) ( not ( = ?auto_13159 ?auto_13161 ) ) ( not ( = ?auto_13157 ?auto_13161 ) ) ( not ( = ?auto_13167 ?auto_13161 ) ) ( not ( = ?auto_13164 ?auto_13161 ) ) ( not ( = ?auto_13169 ?auto_13161 ) ) ( AVAILABLE ?auto_13170 ) ( IN ?auto_13165 ?auto_13160 ) ( TRUCK-AT ?auto_13160 ?auto_13174 ) ( not ( = ?auto_13174 ?auto_13172 ) ) ( not ( = ?auto_13166 ?auto_13174 ) ) ( not ( = ?auto_13171 ?auto_13174 ) ) ( not ( = ?auto_13162 ?auto_13174 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13158 ?auto_13159 )
      ( MAKE-2CRATE-VERIFY ?auto_13157 ?auto_13158 ?auto_13159 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13175 - SURFACE
      ?auto_13176 - SURFACE
      ?auto_13177 - SURFACE
      ?auto_13178 - SURFACE
    )
    :vars
    (
      ?auto_13188 - HOIST
      ?auto_13189 - PLACE
      ?auto_13187 - PLACE
      ?auto_13185 - HOIST
      ?auto_13191 - SURFACE
      ?auto_13181 - PLACE
      ?auto_13190 - HOIST
      ?auto_13180 - SURFACE
      ?auto_13182 - PLACE
      ?auto_13179 - HOIST
      ?auto_13186 - SURFACE
      ?auto_13183 - SURFACE
      ?auto_13192 - TRUCK
      ?auto_13184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13188 ?auto_13189 ) ( IS-CRATE ?auto_13178 ) ( not ( = ?auto_13177 ?auto_13178 ) ) ( not ( = ?auto_13176 ?auto_13177 ) ) ( not ( = ?auto_13176 ?auto_13178 ) ) ( not ( = ?auto_13187 ?auto_13189 ) ) ( HOIST-AT ?auto_13185 ?auto_13187 ) ( not ( = ?auto_13188 ?auto_13185 ) ) ( AVAILABLE ?auto_13185 ) ( SURFACE-AT ?auto_13178 ?auto_13187 ) ( ON ?auto_13178 ?auto_13191 ) ( CLEAR ?auto_13178 ) ( not ( = ?auto_13177 ?auto_13191 ) ) ( not ( = ?auto_13178 ?auto_13191 ) ) ( not ( = ?auto_13176 ?auto_13191 ) ) ( IS-CRATE ?auto_13177 ) ( not ( = ?auto_13181 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13181 ) ) ( HOIST-AT ?auto_13190 ?auto_13181 ) ( not ( = ?auto_13188 ?auto_13190 ) ) ( not ( = ?auto_13185 ?auto_13190 ) ) ( AVAILABLE ?auto_13190 ) ( SURFACE-AT ?auto_13177 ?auto_13181 ) ( ON ?auto_13177 ?auto_13180 ) ( CLEAR ?auto_13177 ) ( not ( = ?auto_13177 ?auto_13180 ) ) ( not ( = ?auto_13178 ?auto_13180 ) ) ( not ( = ?auto_13176 ?auto_13180 ) ) ( not ( = ?auto_13191 ?auto_13180 ) ) ( IS-CRATE ?auto_13176 ) ( not ( = ?auto_13175 ?auto_13176 ) ) ( not ( = ?auto_13177 ?auto_13175 ) ) ( not ( = ?auto_13178 ?auto_13175 ) ) ( not ( = ?auto_13191 ?auto_13175 ) ) ( not ( = ?auto_13180 ?auto_13175 ) ) ( not ( = ?auto_13182 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13182 ) ) ( not ( = ?auto_13181 ?auto_13182 ) ) ( HOIST-AT ?auto_13179 ?auto_13182 ) ( not ( = ?auto_13188 ?auto_13179 ) ) ( not ( = ?auto_13185 ?auto_13179 ) ) ( not ( = ?auto_13190 ?auto_13179 ) ) ( AVAILABLE ?auto_13179 ) ( SURFACE-AT ?auto_13176 ?auto_13182 ) ( ON ?auto_13176 ?auto_13186 ) ( CLEAR ?auto_13176 ) ( not ( = ?auto_13177 ?auto_13186 ) ) ( not ( = ?auto_13178 ?auto_13186 ) ) ( not ( = ?auto_13176 ?auto_13186 ) ) ( not ( = ?auto_13191 ?auto_13186 ) ) ( not ( = ?auto_13180 ?auto_13186 ) ) ( not ( = ?auto_13175 ?auto_13186 ) ) ( SURFACE-AT ?auto_13183 ?auto_13189 ) ( CLEAR ?auto_13183 ) ( IS-CRATE ?auto_13175 ) ( not ( = ?auto_13183 ?auto_13175 ) ) ( not ( = ?auto_13177 ?auto_13183 ) ) ( not ( = ?auto_13178 ?auto_13183 ) ) ( not ( = ?auto_13176 ?auto_13183 ) ) ( not ( = ?auto_13191 ?auto_13183 ) ) ( not ( = ?auto_13180 ?auto_13183 ) ) ( not ( = ?auto_13186 ?auto_13183 ) ) ( AVAILABLE ?auto_13188 ) ( IN ?auto_13175 ?auto_13192 ) ( TRUCK-AT ?auto_13192 ?auto_13184 ) ( not ( = ?auto_13184 ?auto_13189 ) ) ( not ( = ?auto_13187 ?auto_13184 ) ) ( not ( = ?auto_13181 ?auto_13184 ) ) ( not ( = ?auto_13182 ?auto_13184 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13176 ?auto_13177 ?auto_13178 )
      ( MAKE-3CRATE-VERIFY ?auto_13175 ?auto_13176 ?auto_13177 ?auto_13178 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13193 - SURFACE
      ?auto_13194 - SURFACE
      ?auto_13195 - SURFACE
      ?auto_13196 - SURFACE
      ?auto_13197 - SURFACE
    )
    :vars
    (
      ?auto_13206 - HOIST
      ?auto_13207 - PLACE
      ?auto_13205 - PLACE
      ?auto_13203 - HOIST
      ?auto_13209 - SURFACE
      ?auto_13200 - PLACE
      ?auto_13208 - HOIST
      ?auto_13199 - SURFACE
      ?auto_13201 - PLACE
      ?auto_13198 - HOIST
      ?auto_13204 - SURFACE
      ?auto_13210 - TRUCK
      ?auto_13202 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13206 ?auto_13207 ) ( IS-CRATE ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13197 ) ) ( not ( = ?auto_13195 ?auto_13196 ) ) ( not ( = ?auto_13195 ?auto_13197 ) ) ( not ( = ?auto_13205 ?auto_13207 ) ) ( HOIST-AT ?auto_13203 ?auto_13205 ) ( not ( = ?auto_13206 ?auto_13203 ) ) ( AVAILABLE ?auto_13203 ) ( SURFACE-AT ?auto_13197 ?auto_13205 ) ( ON ?auto_13197 ?auto_13209 ) ( CLEAR ?auto_13197 ) ( not ( = ?auto_13196 ?auto_13209 ) ) ( not ( = ?auto_13197 ?auto_13209 ) ) ( not ( = ?auto_13195 ?auto_13209 ) ) ( IS-CRATE ?auto_13196 ) ( not ( = ?auto_13200 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13200 ) ) ( HOIST-AT ?auto_13208 ?auto_13200 ) ( not ( = ?auto_13206 ?auto_13208 ) ) ( not ( = ?auto_13203 ?auto_13208 ) ) ( AVAILABLE ?auto_13208 ) ( SURFACE-AT ?auto_13196 ?auto_13200 ) ( ON ?auto_13196 ?auto_13199 ) ( CLEAR ?auto_13196 ) ( not ( = ?auto_13196 ?auto_13199 ) ) ( not ( = ?auto_13197 ?auto_13199 ) ) ( not ( = ?auto_13195 ?auto_13199 ) ) ( not ( = ?auto_13209 ?auto_13199 ) ) ( IS-CRATE ?auto_13195 ) ( not ( = ?auto_13194 ?auto_13195 ) ) ( not ( = ?auto_13196 ?auto_13194 ) ) ( not ( = ?auto_13197 ?auto_13194 ) ) ( not ( = ?auto_13209 ?auto_13194 ) ) ( not ( = ?auto_13199 ?auto_13194 ) ) ( not ( = ?auto_13201 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13201 ) ) ( not ( = ?auto_13200 ?auto_13201 ) ) ( HOIST-AT ?auto_13198 ?auto_13201 ) ( not ( = ?auto_13206 ?auto_13198 ) ) ( not ( = ?auto_13203 ?auto_13198 ) ) ( not ( = ?auto_13208 ?auto_13198 ) ) ( AVAILABLE ?auto_13198 ) ( SURFACE-AT ?auto_13195 ?auto_13201 ) ( ON ?auto_13195 ?auto_13204 ) ( CLEAR ?auto_13195 ) ( not ( = ?auto_13196 ?auto_13204 ) ) ( not ( = ?auto_13197 ?auto_13204 ) ) ( not ( = ?auto_13195 ?auto_13204 ) ) ( not ( = ?auto_13209 ?auto_13204 ) ) ( not ( = ?auto_13199 ?auto_13204 ) ) ( not ( = ?auto_13194 ?auto_13204 ) ) ( SURFACE-AT ?auto_13193 ?auto_13207 ) ( CLEAR ?auto_13193 ) ( IS-CRATE ?auto_13194 ) ( not ( = ?auto_13193 ?auto_13194 ) ) ( not ( = ?auto_13196 ?auto_13193 ) ) ( not ( = ?auto_13197 ?auto_13193 ) ) ( not ( = ?auto_13195 ?auto_13193 ) ) ( not ( = ?auto_13209 ?auto_13193 ) ) ( not ( = ?auto_13199 ?auto_13193 ) ) ( not ( = ?auto_13204 ?auto_13193 ) ) ( AVAILABLE ?auto_13206 ) ( IN ?auto_13194 ?auto_13210 ) ( TRUCK-AT ?auto_13210 ?auto_13202 ) ( not ( = ?auto_13202 ?auto_13207 ) ) ( not ( = ?auto_13205 ?auto_13202 ) ) ( not ( = ?auto_13200 ?auto_13202 ) ) ( not ( = ?auto_13201 ?auto_13202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13195 ?auto_13196 ?auto_13197 )
      ( MAKE-4CRATE-VERIFY ?auto_13193 ?auto_13194 ?auto_13195 ?auto_13196 ?auto_13197 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13211 - SURFACE
      ?auto_13212 - SURFACE
    )
    :vars
    (
      ?auto_13223 - HOIST
      ?auto_13224 - PLACE
      ?auto_13228 - SURFACE
      ?auto_13222 - PLACE
      ?auto_13220 - HOIST
      ?auto_13226 - SURFACE
      ?auto_13215 - PLACE
      ?auto_13225 - HOIST
      ?auto_13214 - SURFACE
      ?auto_13216 - SURFACE
      ?auto_13217 - PLACE
      ?auto_13213 - HOIST
      ?auto_13221 - SURFACE
      ?auto_13218 - SURFACE
      ?auto_13227 - TRUCK
      ?auto_13219 - PLACE
      ?auto_13229 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13223 ?auto_13224 ) ( IS-CRATE ?auto_13212 ) ( not ( = ?auto_13211 ?auto_13212 ) ) ( not ( = ?auto_13228 ?auto_13211 ) ) ( not ( = ?auto_13228 ?auto_13212 ) ) ( not ( = ?auto_13222 ?auto_13224 ) ) ( HOIST-AT ?auto_13220 ?auto_13222 ) ( not ( = ?auto_13223 ?auto_13220 ) ) ( AVAILABLE ?auto_13220 ) ( SURFACE-AT ?auto_13212 ?auto_13222 ) ( ON ?auto_13212 ?auto_13226 ) ( CLEAR ?auto_13212 ) ( not ( = ?auto_13211 ?auto_13226 ) ) ( not ( = ?auto_13212 ?auto_13226 ) ) ( not ( = ?auto_13228 ?auto_13226 ) ) ( IS-CRATE ?auto_13211 ) ( not ( = ?auto_13215 ?auto_13224 ) ) ( not ( = ?auto_13222 ?auto_13215 ) ) ( HOIST-AT ?auto_13225 ?auto_13215 ) ( not ( = ?auto_13223 ?auto_13225 ) ) ( not ( = ?auto_13220 ?auto_13225 ) ) ( AVAILABLE ?auto_13225 ) ( SURFACE-AT ?auto_13211 ?auto_13215 ) ( ON ?auto_13211 ?auto_13214 ) ( CLEAR ?auto_13211 ) ( not ( = ?auto_13211 ?auto_13214 ) ) ( not ( = ?auto_13212 ?auto_13214 ) ) ( not ( = ?auto_13228 ?auto_13214 ) ) ( not ( = ?auto_13226 ?auto_13214 ) ) ( IS-CRATE ?auto_13228 ) ( not ( = ?auto_13216 ?auto_13228 ) ) ( not ( = ?auto_13211 ?auto_13216 ) ) ( not ( = ?auto_13212 ?auto_13216 ) ) ( not ( = ?auto_13226 ?auto_13216 ) ) ( not ( = ?auto_13214 ?auto_13216 ) ) ( not ( = ?auto_13217 ?auto_13224 ) ) ( not ( = ?auto_13222 ?auto_13217 ) ) ( not ( = ?auto_13215 ?auto_13217 ) ) ( HOIST-AT ?auto_13213 ?auto_13217 ) ( not ( = ?auto_13223 ?auto_13213 ) ) ( not ( = ?auto_13220 ?auto_13213 ) ) ( not ( = ?auto_13225 ?auto_13213 ) ) ( AVAILABLE ?auto_13213 ) ( SURFACE-AT ?auto_13228 ?auto_13217 ) ( ON ?auto_13228 ?auto_13221 ) ( CLEAR ?auto_13228 ) ( not ( = ?auto_13211 ?auto_13221 ) ) ( not ( = ?auto_13212 ?auto_13221 ) ) ( not ( = ?auto_13228 ?auto_13221 ) ) ( not ( = ?auto_13226 ?auto_13221 ) ) ( not ( = ?auto_13214 ?auto_13221 ) ) ( not ( = ?auto_13216 ?auto_13221 ) ) ( SURFACE-AT ?auto_13218 ?auto_13224 ) ( CLEAR ?auto_13218 ) ( IS-CRATE ?auto_13216 ) ( not ( = ?auto_13218 ?auto_13216 ) ) ( not ( = ?auto_13211 ?auto_13218 ) ) ( not ( = ?auto_13212 ?auto_13218 ) ) ( not ( = ?auto_13228 ?auto_13218 ) ) ( not ( = ?auto_13226 ?auto_13218 ) ) ( not ( = ?auto_13214 ?auto_13218 ) ) ( not ( = ?auto_13221 ?auto_13218 ) ) ( AVAILABLE ?auto_13223 ) ( TRUCK-AT ?auto_13227 ?auto_13219 ) ( not ( = ?auto_13219 ?auto_13224 ) ) ( not ( = ?auto_13222 ?auto_13219 ) ) ( not ( = ?auto_13215 ?auto_13219 ) ) ( not ( = ?auto_13217 ?auto_13219 ) ) ( HOIST-AT ?auto_13229 ?auto_13219 ) ( LIFTING ?auto_13229 ?auto_13216 ) ( not ( = ?auto_13223 ?auto_13229 ) ) ( not ( = ?auto_13220 ?auto_13229 ) ) ( not ( = ?auto_13225 ?auto_13229 ) ) ( not ( = ?auto_13213 ?auto_13229 ) ) )
    :subtasks
    ( ( !LOAD ?auto_13229 ?auto_13216 ?auto_13227 ?auto_13219 )
      ( MAKE-2CRATE ?auto_13228 ?auto_13211 ?auto_13212 )
      ( MAKE-1CRATE-VERIFY ?auto_13211 ?auto_13212 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13230 - SURFACE
      ?auto_13231 - SURFACE
      ?auto_13232 - SURFACE
    )
    :vars
    (
      ?auto_13234 - HOIST
      ?auto_13233 - PLACE
      ?auto_13242 - PLACE
      ?auto_13240 - HOIST
      ?auto_13235 - SURFACE
      ?auto_13243 - PLACE
      ?auto_13236 - HOIST
      ?auto_13247 - SURFACE
      ?auto_13245 - SURFACE
      ?auto_13237 - PLACE
      ?auto_13239 - HOIST
      ?auto_13238 - SURFACE
      ?auto_13244 - SURFACE
      ?auto_13241 - TRUCK
      ?auto_13246 - PLACE
      ?auto_13248 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13234 ?auto_13233 ) ( IS-CRATE ?auto_13232 ) ( not ( = ?auto_13231 ?auto_13232 ) ) ( not ( = ?auto_13230 ?auto_13231 ) ) ( not ( = ?auto_13230 ?auto_13232 ) ) ( not ( = ?auto_13242 ?auto_13233 ) ) ( HOIST-AT ?auto_13240 ?auto_13242 ) ( not ( = ?auto_13234 ?auto_13240 ) ) ( AVAILABLE ?auto_13240 ) ( SURFACE-AT ?auto_13232 ?auto_13242 ) ( ON ?auto_13232 ?auto_13235 ) ( CLEAR ?auto_13232 ) ( not ( = ?auto_13231 ?auto_13235 ) ) ( not ( = ?auto_13232 ?auto_13235 ) ) ( not ( = ?auto_13230 ?auto_13235 ) ) ( IS-CRATE ?auto_13231 ) ( not ( = ?auto_13243 ?auto_13233 ) ) ( not ( = ?auto_13242 ?auto_13243 ) ) ( HOIST-AT ?auto_13236 ?auto_13243 ) ( not ( = ?auto_13234 ?auto_13236 ) ) ( not ( = ?auto_13240 ?auto_13236 ) ) ( AVAILABLE ?auto_13236 ) ( SURFACE-AT ?auto_13231 ?auto_13243 ) ( ON ?auto_13231 ?auto_13247 ) ( CLEAR ?auto_13231 ) ( not ( = ?auto_13231 ?auto_13247 ) ) ( not ( = ?auto_13232 ?auto_13247 ) ) ( not ( = ?auto_13230 ?auto_13247 ) ) ( not ( = ?auto_13235 ?auto_13247 ) ) ( IS-CRATE ?auto_13230 ) ( not ( = ?auto_13245 ?auto_13230 ) ) ( not ( = ?auto_13231 ?auto_13245 ) ) ( not ( = ?auto_13232 ?auto_13245 ) ) ( not ( = ?auto_13235 ?auto_13245 ) ) ( not ( = ?auto_13247 ?auto_13245 ) ) ( not ( = ?auto_13237 ?auto_13233 ) ) ( not ( = ?auto_13242 ?auto_13237 ) ) ( not ( = ?auto_13243 ?auto_13237 ) ) ( HOIST-AT ?auto_13239 ?auto_13237 ) ( not ( = ?auto_13234 ?auto_13239 ) ) ( not ( = ?auto_13240 ?auto_13239 ) ) ( not ( = ?auto_13236 ?auto_13239 ) ) ( AVAILABLE ?auto_13239 ) ( SURFACE-AT ?auto_13230 ?auto_13237 ) ( ON ?auto_13230 ?auto_13238 ) ( CLEAR ?auto_13230 ) ( not ( = ?auto_13231 ?auto_13238 ) ) ( not ( = ?auto_13232 ?auto_13238 ) ) ( not ( = ?auto_13230 ?auto_13238 ) ) ( not ( = ?auto_13235 ?auto_13238 ) ) ( not ( = ?auto_13247 ?auto_13238 ) ) ( not ( = ?auto_13245 ?auto_13238 ) ) ( SURFACE-AT ?auto_13244 ?auto_13233 ) ( CLEAR ?auto_13244 ) ( IS-CRATE ?auto_13245 ) ( not ( = ?auto_13244 ?auto_13245 ) ) ( not ( = ?auto_13231 ?auto_13244 ) ) ( not ( = ?auto_13232 ?auto_13244 ) ) ( not ( = ?auto_13230 ?auto_13244 ) ) ( not ( = ?auto_13235 ?auto_13244 ) ) ( not ( = ?auto_13247 ?auto_13244 ) ) ( not ( = ?auto_13238 ?auto_13244 ) ) ( AVAILABLE ?auto_13234 ) ( TRUCK-AT ?auto_13241 ?auto_13246 ) ( not ( = ?auto_13246 ?auto_13233 ) ) ( not ( = ?auto_13242 ?auto_13246 ) ) ( not ( = ?auto_13243 ?auto_13246 ) ) ( not ( = ?auto_13237 ?auto_13246 ) ) ( HOIST-AT ?auto_13248 ?auto_13246 ) ( LIFTING ?auto_13248 ?auto_13245 ) ( not ( = ?auto_13234 ?auto_13248 ) ) ( not ( = ?auto_13240 ?auto_13248 ) ) ( not ( = ?auto_13236 ?auto_13248 ) ) ( not ( = ?auto_13239 ?auto_13248 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13231 ?auto_13232 )
      ( MAKE-2CRATE-VERIFY ?auto_13230 ?auto_13231 ?auto_13232 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13249 - SURFACE
      ?auto_13250 - SURFACE
      ?auto_13251 - SURFACE
      ?auto_13252 - SURFACE
    )
    :vars
    (
      ?auto_13255 - HOIST
      ?auto_13253 - PLACE
      ?auto_13265 - PLACE
      ?auto_13267 - HOIST
      ?auto_13266 - SURFACE
      ?auto_13262 - PLACE
      ?auto_13264 - HOIST
      ?auto_13256 - SURFACE
      ?auto_13259 - PLACE
      ?auto_13260 - HOIST
      ?auto_13257 - SURFACE
      ?auto_13258 - SURFACE
      ?auto_13254 - TRUCK
      ?auto_13263 - PLACE
      ?auto_13261 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13255 ?auto_13253 ) ( IS-CRATE ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13252 ) ) ( not ( = ?auto_13250 ?auto_13251 ) ) ( not ( = ?auto_13250 ?auto_13252 ) ) ( not ( = ?auto_13265 ?auto_13253 ) ) ( HOIST-AT ?auto_13267 ?auto_13265 ) ( not ( = ?auto_13255 ?auto_13267 ) ) ( AVAILABLE ?auto_13267 ) ( SURFACE-AT ?auto_13252 ?auto_13265 ) ( ON ?auto_13252 ?auto_13266 ) ( CLEAR ?auto_13252 ) ( not ( = ?auto_13251 ?auto_13266 ) ) ( not ( = ?auto_13252 ?auto_13266 ) ) ( not ( = ?auto_13250 ?auto_13266 ) ) ( IS-CRATE ?auto_13251 ) ( not ( = ?auto_13262 ?auto_13253 ) ) ( not ( = ?auto_13265 ?auto_13262 ) ) ( HOIST-AT ?auto_13264 ?auto_13262 ) ( not ( = ?auto_13255 ?auto_13264 ) ) ( not ( = ?auto_13267 ?auto_13264 ) ) ( AVAILABLE ?auto_13264 ) ( SURFACE-AT ?auto_13251 ?auto_13262 ) ( ON ?auto_13251 ?auto_13256 ) ( CLEAR ?auto_13251 ) ( not ( = ?auto_13251 ?auto_13256 ) ) ( not ( = ?auto_13252 ?auto_13256 ) ) ( not ( = ?auto_13250 ?auto_13256 ) ) ( not ( = ?auto_13266 ?auto_13256 ) ) ( IS-CRATE ?auto_13250 ) ( not ( = ?auto_13249 ?auto_13250 ) ) ( not ( = ?auto_13251 ?auto_13249 ) ) ( not ( = ?auto_13252 ?auto_13249 ) ) ( not ( = ?auto_13266 ?auto_13249 ) ) ( not ( = ?auto_13256 ?auto_13249 ) ) ( not ( = ?auto_13259 ?auto_13253 ) ) ( not ( = ?auto_13265 ?auto_13259 ) ) ( not ( = ?auto_13262 ?auto_13259 ) ) ( HOIST-AT ?auto_13260 ?auto_13259 ) ( not ( = ?auto_13255 ?auto_13260 ) ) ( not ( = ?auto_13267 ?auto_13260 ) ) ( not ( = ?auto_13264 ?auto_13260 ) ) ( AVAILABLE ?auto_13260 ) ( SURFACE-AT ?auto_13250 ?auto_13259 ) ( ON ?auto_13250 ?auto_13257 ) ( CLEAR ?auto_13250 ) ( not ( = ?auto_13251 ?auto_13257 ) ) ( not ( = ?auto_13252 ?auto_13257 ) ) ( not ( = ?auto_13250 ?auto_13257 ) ) ( not ( = ?auto_13266 ?auto_13257 ) ) ( not ( = ?auto_13256 ?auto_13257 ) ) ( not ( = ?auto_13249 ?auto_13257 ) ) ( SURFACE-AT ?auto_13258 ?auto_13253 ) ( CLEAR ?auto_13258 ) ( IS-CRATE ?auto_13249 ) ( not ( = ?auto_13258 ?auto_13249 ) ) ( not ( = ?auto_13251 ?auto_13258 ) ) ( not ( = ?auto_13252 ?auto_13258 ) ) ( not ( = ?auto_13250 ?auto_13258 ) ) ( not ( = ?auto_13266 ?auto_13258 ) ) ( not ( = ?auto_13256 ?auto_13258 ) ) ( not ( = ?auto_13257 ?auto_13258 ) ) ( AVAILABLE ?auto_13255 ) ( TRUCK-AT ?auto_13254 ?auto_13263 ) ( not ( = ?auto_13263 ?auto_13253 ) ) ( not ( = ?auto_13265 ?auto_13263 ) ) ( not ( = ?auto_13262 ?auto_13263 ) ) ( not ( = ?auto_13259 ?auto_13263 ) ) ( HOIST-AT ?auto_13261 ?auto_13263 ) ( LIFTING ?auto_13261 ?auto_13249 ) ( not ( = ?auto_13255 ?auto_13261 ) ) ( not ( = ?auto_13267 ?auto_13261 ) ) ( not ( = ?auto_13264 ?auto_13261 ) ) ( not ( = ?auto_13260 ?auto_13261 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13250 ?auto_13251 ?auto_13252 )
      ( MAKE-3CRATE-VERIFY ?auto_13249 ?auto_13250 ?auto_13251 ?auto_13252 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13268 - SURFACE
      ?auto_13269 - SURFACE
      ?auto_13270 - SURFACE
      ?auto_13271 - SURFACE
      ?auto_13272 - SURFACE
    )
    :vars
    (
      ?auto_13275 - HOIST
      ?auto_13273 - PLACE
      ?auto_13284 - PLACE
      ?auto_13286 - HOIST
      ?auto_13285 - SURFACE
      ?auto_13281 - PLACE
      ?auto_13283 - HOIST
      ?auto_13276 - SURFACE
      ?auto_13278 - PLACE
      ?auto_13279 - HOIST
      ?auto_13277 - SURFACE
      ?auto_13274 - TRUCK
      ?auto_13282 - PLACE
      ?auto_13280 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_13275 ?auto_13273 ) ( IS-CRATE ?auto_13272 ) ( not ( = ?auto_13271 ?auto_13272 ) ) ( not ( = ?auto_13270 ?auto_13271 ) ) ( not ( = ?auto_13270 ?auto_13272 ) ) ( not ( = ?auto_13284 ?auto_13273 ) ) ( HOIST-AT ?auto_13286 ?auto_13284 ) ( not ( = ?auto_13275 ?auto_13286 ) ) ( AVAILABLE ?auto_13286 ) ( SURFACE-AT ?auto_13272 ?auto_13284 ) ( ON ?auto_13272 ?auto_13285 ) ( CLEAR ?auto_13272 ) ( not ( = ?auto_13271 ?auto_13285 ) ) ( not ( = ?auto_13272 ?auto_13285 ) ) ( not ( = ?auto_13270 ?auto_13285 ) ) ( IS-CRATE ?auto_13271 ) ( not ( = ?auto_13281 ?auto_13273 ) ) ( not ( = ?auto_13284 ?auto_13281 ) ) ( HOIST-AT ?auto_13283 ?auto_13281 ) ( not ( = ?auto_13275 ?auto_13283 ) ) ( not ( = ?auto_13286 ?auto_13283 ) ) ( AVAILABLE ?auto_13283 ) ( SURFACE-AT ?auto_13271 ?auto_13281 ) ( ON ?auto_13271 ?auto_13276 ) ( CLEAR ?auto_13271 ) ( not ( = ?auto_13271 ?auto_13276 ) ) ( not ( = ?auto_13272 ?auto_13276 ) ) ( not ( = ?auto_13270 ?auto_13276 ) ) ( not ( = ?auto_13285 ?auto_13276 ) ) ( IS-CRATE ?auto_13270 ) ( not ( = ?auto_13269 ?auto_13270 ) ) ( not ( = ?auto_13271 ?auto_13269 ) ) ( not ( = ?auto_13272 ?auto_13269 ) ) ( not ( = ?auto_13285 ?auto_13269 ) ) ( not ( = ?auto_13276 ?auto_13269 ) ) ( not ( = ?auto_13278 ?auto_13273 ) ) ( not ( = ?auto_13284 ?auto_13278 ) ) ( not ( = ?auto_13281 ?auto_13278 ) ) ( HOIST-AT ?auto_13279 ?auto_13278 ) ( not ( = ?auto_13275 ?auto_13279 ) ) ( not ( = ?auto_13286 ?auto_13279 ) ) ( not ( = ?auto_13283 ?auto_13279 ) ) ( AVAILABLE ?auto_13279 ) ( SURFACE-AT ?auto_13270 ?auto_13278 ) ( ON ?auto_13270 ?auto_13277 ) ( CLEAR ?auto_13270 ) ( not ( = ?auto_13271 ?auto_13277 ) ) ( not ( = ?auto_13272 ?auto_13277 ) ) ( not ( = ?auto_13270 ?auto_13277 ) ) ( not ( = ?auto_13285 ?auto_13277 ) ) ( not ( = ?auto_13276 ?auto_13277 ) ) ( not ( = ?auto_13269 ?auto_13277 ) ) ( SURFACE-AT ?auto_13268 ?auto_13273 ) ( CLEAR ?auto_13268 ) ( IS-CRATE ?auto_13269 ) ( not ( = ?auto_13268 ?auto_13269 ) ) ( not ( = ?auto_13271 ?auto_13268 ) ) ( not ( = ?auto_13272 ?auto_13268 ) ) ( not ( = ?auto_13270 ?auto_13268 ) ) ( not ( = ?auto_13285 ?auto_13268 ) ) ( not ( = ?auto_13276 ?auto_13268 ) ) ( not ( = ?auto_13277 ?auto_13268 ) ) ( AVAILABLE ?auto_13275 ) ( TRUCK-AT ?auto_13274 ?auto_13282 ) ( not ( = ?auto_13282 ?auto_13273 ) ) ( not ( = ?auto_13284 ?auto_13282 ) ) ( not ( = ?auto_13281 ?auto_13282 ) ) ( not ( = ?auto_13278 ?auto_13282 ) ) ( HOIST-AT ?auto_13280 ?auto_13282 ) ( LIFTING ?auto_13280 ?auto_13269 ) ( not ( = ?auto_13275 ?auto_13280 ) ) ( not ( = ?auto_13286 ?auto_13280 ) ) ( not ( = ?auto_13283 ?auto_13280 ) ) ( not ( = ?auto_13279 ?auto_13280 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13270 ?auto_13271 ?auto_13272 )
      ( MAKE-4CRATE-VERIFY ?auto_13268 ?auto_13269 ?auto_13270 ?auto_13271 ?auto_13272 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13287 - SURFACE
      ?auto_13288 - SURFACE
    )
    :vars
    (
      ?auto_13291 - HOIST
      ?auto_13289 - PLACE
      ?auto_13298 - SURFACE
      ?auto_13303 - PLACE
      ?auto_13305 - HOIST
      ?auto_13304 - SURFACE
      ?auto_13300 - PLACE
      ?auto_13302 - HOIST
      ?auto_13292 - SURFACE
      ?auto_13299 - SURFACE
      ?auto_13295 - PLACE
      ?auto_13296 - HOIST
      ?auto_13293 - SURFACE
      ?auto_13294 - SURFACE
      ?auto_13290 - TRUCK
      ?auto_13301 - PLACE
      ?auto_13297 - HOIST
      ?auto_13306 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13291 ?auto_13289 ) ( IS-CRATE ?auto_13288 ) ( not ( = ?auto_13287 ?auto_13288 ) ) ( not ( = ?auto_13298 ?auto_13287 ) ) ( not ( = ?auto_13298 ?auto_13288 ) ) ( not ( = ?auto_13303 ?auto_13289 ) ) ( HOIST-AT ?auto_13305 ?auto_13303 ) ( not ( = ?auto_13291 ?auto_13305 ) ) ( AVAILABLE ?auto_13305 ) ( SURFACE-AT ?auto_13288 ?auto_13303 ) ( ON ?auto_13288 ?auto_13304 ) ( CLEAR ?auto_13288 ) ( not ( = ?auto_13287 ?auto_13304 ) ) ( not ( = ?auto_13288 ?auto_13304 ) ) ( not ( = ?auto_13298 ?auto_13304 ) ) ( IS-CRATE ?auto_13287 ) ( not ( = ?auto_13300 ?auto_13289 ) ) ( not ( = ?auto_13303 ?auto_13300 ) ) ( HOIST-AT ?auto_13302 ?auto_13300 ) ( not ( = ?auto_13291 ?auto_13302 ) ) ( not ( = ?auto_13305 ?auto_13302 ) ) ( AVAILABLE ?auto_13302 ) ( SURFACE-AT ?auto_13287 ?auto_13300 ) ( ON ?auto_13287 ?auto_13292 ) ( CLEAR ?auto_13287 ) ( not ( = ?auto_13287 ?auto_13292 ) ) ( not ( = ?auto_13288 ?auto_13292 ) ) ( not ( = ?auto_13298 ?auto_13292 ) ) ( not ( = ?auto_13304 ?auto_13292 ) ) ( IS-CRATE ?auto_13298 ) ( not ( = ?auto_13299 ?auto_13298 ) ) ( not ( = ?auto_13287 ?auto_13299 ) ) ( not ( = ?auto_13288 ?auto_13299 ) ) ( not ( = ?auto_13304 ?auto_13299 ) ) ( not ( = ?auto_13292 ?auto_13299 ) ) ( not ( = ?auto_13295 ?auto_13289 ) ) ( not ( = ?auto_13303 ?auto_13295 ) ) ( not ( = ?auto_13300 ?auto_13295 ) ) ( HOIST-AT ?auto_13296 ?auto_13295 ) ( not ( = ?auto_13291 ?auto_13296 ) ) ( not ( = ?auto_13305 ?auto_13296 ) ) ( not ( = ?auto_13302 ?auto_13296 ) ) ( AVAILABLE ?auto_13296 ) ( SURFACE-AT ?auto_13298 ?auto_13295 ) ( ON ?auto_13298 ?auto_13293 ) ( CLEAR ?auto_13298 ) ( not ( = ?auto_13287 ?auto_13293 ) ) ( not ( = ?auto_13288 ?auto_13293 ) ) ( not ( = ?auto_13298 ?auto_13293 ) ) ( not ( = ?auto_13304 ?auto_13293 ) ) ( not ( = ?auto_13292 ?auto_13293 ) ) ( not ( = ?auto_13299 ?auto_13293 ) ) ( SURFACE-AT ?auto_13294 ?auto_13289 ) ( CLEAR ?auto_13294 ) ( IS-CRATE ?auto_13299 ) ( not ( = ?auto_13294 ?auto_13299 ) ) ( not ( = ?auto_13287 ?auto_13294 ) ) ( not ( = ?auto_13288 ?auto_13294 ) ) ( not ( = ?auto_13298 ?auto_13294 ) ) ( not ( = ?auto_13304 ?auto_13294 ) ) ( not ( = ?auto_13292 ?auto_13294 ) ) ( not ( = ?auto_13293 ?auto_13294 ) ) ( AVAILABLE ?auto_13291 ) ( TRUCK-AT ?auto_13290 ?auto_13301 ) ( not ( = ?auto_13301 ?auto_13289 ) ) ( not ( = ?auto_13303 ?auto_13301 ) ) ( not ( = ?auto_13300 ?auto_13301 ) ) ( not ( = ?auto_13295 ?auto_13301 ) ) ( HOIST-AT ?auto_13297 ?auto_13301 ) ( not ( = ?auto_13291 ?auto_13297 ) ) ( not ( = ?auto_13305 ?auto_13297 ) ) ( not ( = ?auto_13302 ?auto_13297 ) ) ( not ( = ?auto_13296 ?auto_13297 ) ) ( AVAILABLE ?auto_13297 ) ( SURFACE-AT ?auto_13299 ?auto_13301 ) ( ON ?auto_13299 ?auto_13306 ) ( CLEAR ?auto_13299 ) ( not ( = ?auto_13287 ?auto_13306 ) ) ( not ( = ?auto_13288 ?auto_13306 ) ) ( not ( = ?auto_13298 ?auto_13306 ) ) ( not ( = ?auto_13304 ?auto_13306 ) ) ( not ( = ?auto_13292 ?auto_13306 ) ) ( not ( = ?auto_13299 ?auto_13306 ) ) ( not ( = ?auto_13293 ?auto_13306 ) ) ( not ( = ?auto_13294 ?auto_13306 ) ) )
    :subtasks
    ( ( !LIFT ?auto_13297 ?auto_13299 ?auto_13306 ?auto_13301 )
      ( MAKE-2CRATE ?auto_13298 ?auto_13287 ?auto_13288 )
      ( MAKE-1CRATE-VERIFY ?auto_13287 ?auto_13288 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13307 - SURFACE
      ?auto_13308 - SURFACE
      ?auto_13309 - SURFACE
    )
    :vars
    (
      ?auto_13325 - HOIST
      ?auto_13326 - PLACE
      ?auto_13322 - PLACE
      ?auto_13312 - HOIST
      ?auto_13318 - SURFACE
      ?auto_13316 - PLACE
      ?auto_13317 - HOIST
      ?auto_13324 - SURFACE
      ?auto_13323 - SURFACE
      ?auto_13315 - PLACE
      ?auto_13310 - HOIST
      ?auto_13321 - SURFACE
      ?auto_13311 - SURFACE
      ?auto_13314 - TRUCK
      ?auto_13320 - PLACE
      ?auto_13313 - HOIST
      ?auto_13319 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13325 ?auto_13326 ) ( IS-CRATE ?auto_13309 ) ( not ( = ?auto_13308 ?auto_13309 ) ) ( not ( = ?auto_13307 ?auto_13308 ) ) ( not ( = ?auto_13307 ?auto_13309 ) ) ( not ( = ?auto_13322 ?auto_13326 ) ) ( HOIST-AT ?auto_13312 ?auto_13322 ) ( not ( = ?auto_13325 ?auto_13312 ) ) ( AVAILABLE ?auto_13312 ) ( SURFACE-AT ?auto_13309 ?auto_13322 ) ( ON ?auto_13309 ?auto_13318 ) ( CLEAR ?auto_13309 ) ( not ( = ?auto_13308 ?auto_13318 ) ) ( not ( = ?auto_13309 ?auto_13318 ) ) ( not ( = ?auto_13307 ?auto_13318 ) ) ( IS-CRATE ?auto_13308 ) ( not ( = ?auto_13316 ?auto_13326 ) ) ( not ( = ?auto_13322 ?auto_13316 ) ) ( HOIST-AT ?auto_13317 ?auto_13316 ) ( not ( = ?auto_13325 ?auto_13317 ) ) ( not ( = ?auto_13312 ?auto_13317 ) ) ( AVAILABLE ?auto_13317 ) ( SURFACE-AT ?auto_13308 ?auto_13316 ) ( ON ?auto_13308 ?auto_13324 ) ( CLEAR ?auto_13308 ) ( not ( = ?auto_13308 ?auto_13324 ) ) ( not ( = ?auto_13309 ?auto_13324 ) ) ( not ( = ?auto_13307 ?auto_13324 ) ) ( not ( = ?auto_13318 ?auto_13324 ) ) ( IS-CRATE ?auto_13307 ) ( not ( = ?auto_13323 ?auto_13307 ) ) ( not ( = ?auto_13308 ?auto_13323 ) ) ( not ( = ?auto_13309 ?auto_13323 ) ) ( not ( = ?auto_13318 ?auto_13323 ) ) ( not ( = ?auto_13324 ?auto_13323 ) ) ( not ( = ?auto_13315 ?auto_13326 ) ) ( not ( = ?auto_13322 ?auto_13315 ) ) ( not ( = ?auto_13316 ?auto_13315 ) ) ( HOIST-AT ?auto_13310 ?auto_13315 ) ( not ( = ?auto_13325 ?auto_13310 ) ) ( not ( = ?auto_13312 ?auto_13310 ) ) ( not ( = ?auto_13317 ?auto_13310 ) ) ( AVAILABLE ?auto_13310 ) ( SURFACE-AT ?auto_13307 ?auto_13315 ) ( ON ?auto_13307 ?auto_13321 ) ( CLEAR ?auto_13307 ) ( not ( = ?auto_13308 ?auto_13321 ) ) ( not ( = ?auto_13309 ?auto_13321 ) ) ( not ( = ?auto_13307 ?auto_13321 ) ) ( not ( = ?auto_13318 ?auto_13321 ) ) ( not ( = ?auto_13324 ?auto_13321 ) ) ( not ( = ?auto_13323 ?auto_13321 ) ) ( SURFACE-AT ?auto_13311 ?auto_13326 ) ( CLEAR ?auto_13311 ) ( IS-CRATE ?auto_13323 ) ( not ( = ?auto_13311 ?auto_13323 ) ) ( not ( = ?auto_13308 ?auto_13311 ) ) ( not ( = ?auto_13309 ?auto_13311 ) ) ( not ( = ?auto_13307 ?auto_13311 ) ) ( not ( = ?auto_13318 ?auto_13311 ) ) ( not ( = ?auto_13324 ?auto_13311 ) ) ( not ( = ?auto_13321 ?auto_13311 ) ) ( AVAILABLE ?auto_13325 ) ( TRUCK-AT ?auto_13314 ?auto_13320 ) ( not ( = ?auto_13320 ?auto_13326 ) ) ( not ( = ?auto_13322 ?auto_13320 ) ) ( not ( = ?auto_13316 ?auto_13320 ) ) ( not ( = ?auto_13315 ?auto_13320 ) ) ( HOIST-AT ?auto_13313 ?auto_13320 ) ( not ( = ?auto_13325 ?auto_13313 ) ) ( not ( = ?auto_13312 ?auto_13313 ) ) ( not ( = ?auto_13317 ?auto_13313 ) ) ( not ( = ?auto_13310 ?auto_13313 ) ) ( AVAILABLE ?auto_13313 ) ( SURFACE-AT ?auto_13323 ?auto_13320 ) ( ON ?auto_13323 ?auto_13319 ) ( CLEAR ?auto_13323 ) ( not ( = ?auto_13308 ?auto_13319 ) ) ( not ( = ?auto_13309 ?auto_13319 ) ) ( not ( = ?auto_13307 ?auto_13319 ) ) ( not ( = ?auto_13318 ?auto_13319 ) ) ( not ( = ?auto_13324 ?auto_13319 ) ) ( not ( = ?auto_13323 ?auto_13319 ) ) ( not ( = ?auto_13321 ?auto_13319 ) ) ( not ( = ?auto_13311 ?auto_13319 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13308 ?auto_13309 )
      ( MAKE-2CRATE-VERIFY ?auto_13307 ?auto_13308 ?auto_13309 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13327 - SURFACE
      ?auto_13328 - SURFACE
      ?auto_13329 - SURFACE
      ?auto_13330 - SURFACE
    )
    :vars
    (
      ?auto_13333 - HOIST
      ?auto_13338 - PLACE
      ?auto_13342 - PLACE
      ?auto_13343 - HOIST
      ?auto_13344 - SURFACE
      ?auto_13337 - PLACE
      ?auto_13336 - HOIST
      ?auto_13332 - SURFACE
      ?auto_13334 - PLACE
      ?auto_13346 - HOIST
      ?auto_13345 - SURFACE
      ?auto_13331 - SURFACE
      ?auto_13340 - TRUCK
      ?auto_13341 - PLACE
      ?auto_13335 - HOIST
      ?auto_13339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13333 ?auto_13338 ) ( IS-CRATE ?auto_13330 ) ( not ( = ?auto_13329 ?auto_13330 ) ) ( not ( = ?auto_13328 ?auto_13329 ) ) ( not ( = ?auto_13328 ?auto_13330 ) ) ( not ( = ?auto_13342 ?auto_13338 ) ) ( HOIST-AT ?auto_13343 ?auto_13342 ) ( not ( = ?auto_13333 ?auto_13343 ) ) ( AVAILABLE ?auto_13343 ) ( SURFACE-AT ?auto_13330 ?auto_13342 ) ( ON ?auto_13330 ?auto_13344 ) ( CLEAR ?auto_13330 ) ( not ( = ?auto_13329 ?auto_13344 ) ) ( not ( = ?auto_13330 ?auto_13344 ) ) ( not ( = ?auto_13328 ?auto_13344 ) ) ( IS-CRATE ?auto_13329 ) ( not ( = ?auto_13337 ?auto_13338 ) ) ( not ( = ?auto_13342 ?auto_13337 ) ) ( HOIST-AT ?auto_13336 ?auto_13337 ) ( not ( = ?auto_13333 ?auto_13336 ) ) ( not ( = ?auto_13343 ?auto_13336 ) ) ( AVAILABLE ?auto_13336 ) ( SURFACE-AT ?auto_13329 ?auto_13337 ) ( ON ?auto_13329 ?auto_13332 ) ( CLEAR ?auto_13329 ) ( not ( = ?auto_13329 ?auto_13332 ) ) ( not ( = ?auto_13330 ?auto_13332 ) ) ( not ( = ?auto_13328 ?auto_13332 ) ) ( not ( = ?auto_13344 ?auto_13332 ) ) ( IS-CRATE ?auto_13328 ) ( not ( = ?auto_13327 ?auto_13328 ) ) ( not ( = ?auto_13329 ?auto_13327 ) ) ( not ( = ?auto_13330 ?auto_13327 ) ) ( not ( = ?auto_13344 ?auto_13327 ) ) ( not ( = ?auto_13332 ?auto_13327 ) ) ( not ( = ?auto_13334 ?auto_13338 ) ) ( not ( = ?auto_13342 ?auto_13334 ) ) ( not ( = ?auto_13337 ?auto_13334 ) ) ( HOIST-AT ?auto_13346 ?auto_13334 ) ( not ( = ?auto_13333 ?auto_13346 ) ) ( not ( = ?auto_13343 ?auto_13346 ) ) ( not ( = ?auto_13336 ?auto_13346 ) ) ( AVAILABLE ?auto_13346 ) ( SURFACE-AT ?auto_13328 ?auto_13334 ) ( ON ?auto_13328 ?auto_13345 ) ( CLEAR ?auto_13328 ) ( not ( = ?auto_13329 ?auto_13345 ) ) ( not ( = ?auto_13330 ?auto_13345 ) ) ( not ( = ?auto_13328 ?auto_13345 ) ) ( not ( = ?auto_13344 ?auto_13345 ) ) ( not ( = ?auto_13332 ?auto_13345 ) ) ( not ( = ?auto_13327 ?auto_13345 ) ) ( SURFACE-AT ?auto_13331 ?auto_13338 ) ( CLEAR ?auto_13331 ) ( IS-CRATE ?auto_13327 ) ( not ( = ?auto_13331 ?auto_13327 ) ) ( not ( = ?auto_13329 ?auto_13331 ) ) ( not ( = ?auto_13330 ?auto_13331 ) ) ( not ( = ?auto_13328 ?auto_13331 ) ) ( not ( = ?auto_13344 ?auto_13331 ) ) ( not ( = ?auto_13332 ?auto_13331 ) ) ( not ( = ?auto_13345 ?auto_13331 ) ) ( AVAILABLE ?auto_13333 ) ( TRUCK-AT ?auto_13340 ?auto_13341 ) ( not ( = ?auto_13341 ?auto_13338 ) ) ( not ( = ?auto_13342 ?auto_13341 ) ) ( not ( = ?auto_13337 ?auto_13341 ) ) ( not ( = ?auto_13334 ?auto_13341 ) ) ( HOIST-AT ?auto_13335 ?auto_13341 ) ( not ( = ?auto_13333 ?auto_13335 ) ) ( not ( = ?auto_13343 ?auto_13335 ) ) ( not ( = ?auto_13336 ?auto_13335 ) ) ( not ( = ?auto_13346 ?auto_13335 ) ) ( AVAILABLE ?auto_13335 ) ( SURFACE-AT ?auto_13327 ?auto_13341 ) ( ON ?auto_13327 ?auto_13339 ) ( CLEAR ?auto_13327 ) ( not ( = ?auto_13329 ?auto_13339 ) ) ( not ( = ?auto_13330 ?auto_13339 ) ) ( not ( = ?auto_13328 ?auto_13339 ) ) ( not ( = ?auto_13344 ?auto_13339 ) ) ( not ( = ?auto_13332 ?auto_13339 ) ) ( not ( = ?auto_13327 ?auto_13339 ) ) ( not ( = ?auto_13345 ?auto_13339 ) ) ( not ( = ?auto_13331 ?auto_13339 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13328 ?auto_13329 ?auto_13330 )
      ( MAKE-3CRATE-VERIFY ?auto_13327 ?auto_13328 ?auto_13329 ?auto_13330 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13347 - SURFACE
      ?auto_13348 - SURFACE
      ?auto_13349 - SURFACE
      ?auto_13350 - SURFACE
      ?auto_13351 - SURFACE
    )
    :vars
    (
      ?auto_13353 - HOIST
      ?auto_13358 - PLACE
      ?auto_13362 - PLACE
      ?auto_13363 - HOIST
      ?auto_13364 - SURFACE
      ?auto_13357 - PLACE
      ?auto_13356 - HOIST
      ?auto_13352 - SURFACE
      ?auto_13354 - PLACE
      ?auto_13366 - HOIST
      ?auto_13365 - SURFACE
      ?auto_13360 - TRUCK
      ?auto_13361 - PLACE
      ?auto_13355 - HOIST
      ?auto_13359 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_13353 ?auto_13358 ) ( IS-CRATE ?auto_13351 ) ( not ( = ?auto_13350 ?auto_13351 ) ) ( not ( = ?auto_13349 ?auto_13350 ) ) ( not ( = ?auto_13349 ?auto_13351 ) ) ( not ( = ?auto_13362 ?auto_13358 ) ) ( HOIST-AT ?auto_13363 ?auto_13362 ) ( not ( = ?auto_13353 ?auto_13363 ) ) ( AVAILABLE ?auto_13363 ) ( SURFACE-AT ?auto_13351 ?auto_13362 ) ( ON ?auto_13351 ?auto_13364 ) ( CLEAR ?auto_13351 ) ( not ( = ?auto_13350 ?auto_13364 ) ) ( not ( = ?auto_13351 ?auto_13364 ) ) ( not ( = ?auto_13349 ?auto_13364 ) ) ( IS-CRATE ?auto_13350 ) ( not ( = ?auto_13357 ?auto_13358 ) ) ( not ( = ?auto_13362 ?auto_13357 ) ) ( HOIST-AT ?auto_13356 ?auto_13357 ) ( not ( = ?auto_13353 ?auto_13356 ) ) ( not ( = ?auto_13363 ?auto_13356 ) ) ( AVAILABLE ?auto_13356 ) ( SURFACE-AT ?auto_13350 ?auto_13357 ) ( ON ?auto_13350 ?auto_13352 ) ( CLEAR ?auto_13350 ) ( not ( = ?auto_13350 ?auto_13352 ) ) ( not ( = ?auto_13351 ?auto_13352 ) ) ( not ( = ?auto_13349 ?auto_13352 ) ) ( not ( = ?auto_13364 ?auto_13352 ) ) ( IS-CRATE ?auto_13349 ) ( not ( = ?auto_13348 ?auto_13349 ) ) ( not ( = ?auto_13350 ?auto_13348 ) ) ( not ( = ?auto_13351 ?auto_13348 ) ) ( not ( = ?auto_13364 ?auto_13348 ) ) ( not ( = ?auto_13352 ?auto_13348 ) ) ( not ( = ?auto_13354 ?auto_13358 ) ) ( not ( = ?auto_13362 ?auto_13354 ) ) ( not ( = ?auto_13357 ?auto_13354 ) ) ( HOIST-AT ?auto_13366 ?auto_13354 ) ( not ( = ?auto_13353 ?auto_13366 ) ) ( not ( = ?auto_13363 ?auto_13366 ) ) ( not ( = ?auto_13356 ?auto_13366 ) ) ( AVAILABLE ?auto_13366 ) ( SURFACE-AT ?auto_13349 ?auto_13354 ) ( ON ?auto_13349 ?auto_13365 ) ( CLEAR ?auto_13349 ) ( not ( = ?auto_13350 ?auto_13365 ) ) ( not ( = ?auto_13351 ?auto_13365 ) ) ( not ( = ?auto_13349 ?auto_13365 ) ) ( not ( = ?auto_13364 ?auto_13365 ) ) ( not ( = ?auto_13352 ?auto_13365 ) ) ( not ( = ?auto_13348 ?auto_13365 ) ) ( SURFACE-AT ?auto_13347 ?auto_13358 ) ( CLEAR ?auto_13347 ) ( IS-CRATE ?auto_13348 ) ( not ( = ?auto_13347 ?auto_13348 ) ) ( not ( = ?auto_13350 ?auto_13347 ) ) ( not ( = ?auto_13351 ?auto_13347 ) ) ( not ( = ?auto_13349 ?auto_13347 ) ) ( not ( = ?auto_13364 ?auto_13347 ) ) ( not ( = ?auto_13352 ?auto_13347 ) ) ( not ( = ?auto_13365 ?auto_13347 ) ) ( AVAILABLE ?auto_13353 ) ( TRUCK-AT ?auto_13360 ?auto_13361 ) ( not ( = ?auto_13361 ?auto_13358 ) ) ( not ( = ?auto_13362 ?auto_13361 ) ) ( not ( = ?auto_13357 ?auto_13361 ) ) ( not ( = ?auto_13354 ?auto_13361 ) ) ( HOIST-AT ?auto_13355 ?auto_13361 ) ( not ( = ?auto_13353 ?auto_13355 ) ) ( not ( = ?auto_13363 ?auto_13355 ) ) ( not ( = ?auto_13356 ?auto_13355 ) ) ( not ( = ?auto_13366 ?auto_13355 ) ) ( AVAILABLE ?auto_13355 ) ( SURFACE-AT ?auto_13348 ?auto_13361 ) ( ON ?auto_13348 ?auto_13359 ) ( CLEAR ?auto_13348 ) ( not ( = ?auto_13350 ?auto_13359 ) ) ( not ( = ?auto_13351 ?auto_13359 ) ) ( not ( = ?auto_13349 ?auto_13359 ) ) ( not ( = ?auto_13364 ?auto_13359 ) ) ( not ( = ?auto_13352 ?auto_13359 ) ) ( not ( = ?auto_13348 ?auto_13359 ) ) ( not ( = ?auto_13365 ?auto_13359 ) ) ( not ( = ?auto_13347 ?auto_13359 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13349 ?auto_13350 ?auto_13351 )
      ( MAKE-4CRATE-VERIFY ?auto_13347 ?auto_13348 ?auto_13349 ?auto_13350 ?auto_13351 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_13367 - SURFACE
      ?auto_13368 - SURFACE
    )
    :vars
    (
      ?auto_13371 - HOIST
      ?auto_13376 - PLACE
      ?auto_13378 - SURFACE
      ?auto_13381 - PLACE
      ?auto_13383 - HOIST
      ?auto_13384 - SURFACE
      ?auto_13375 - PLACE
      ?auto_13374 - HOIST
      ?auto_13370 - SURFACE
      ?auto_13382 - SURFACE
      ?auto_13372 - PLACE
      ?auto_13386 - HOIST
      ?auto_13385 - SURFACE
      ?auto_13369 - SURFACE
      ?auto_13380 - PLACE
      ?auto_13373 - HOIST
      ?auto_13377 - SURFACE
      ?auto_13379 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13371 ?auto_13376 ) ( IS-CRATE ?auto_13368 ) ( not ( = ?auto_13367 ?auto_13368 ) ) ( not ( = ?auto_13378 ?auto_13367 ) ) ( not ( = ?auto_13378 ?auto_13368 ) ) ( not ( = ?auto_13381 ?auto_13376 ) ) ( HOIST-AT ?auto_13383 ?auto_13381 ) ( not ( = ?auto_13371 ?auto_13383 ) ) ( AVAILABLE ?auto_13383 ) ( SURFACE-AT ?auto_13368 ?auto_13381 ) ( ON ?auto_13368 ?auto_13384 ) ( CLEAR ?auto_13368 ) ( not ( = ?auto_13367 ?auto_13384 ) ) ( not ( = ?auto_13368 ?auto_13384 ) ) ( not ( = ?auto_13378 ?auto_13384 ) ) ( IS-CRATE ?auto_13367 ) ( not ( = ?auto_13375 ?auto_13376 ) ) ( not ( = ?auto_13381 ?auto_13375 ) ) ( HOIST-AT ?auto_13374 ?auto_13375 ) ( not ( = ?auto_13371 ?auto_13374 ) ) ( not ( = ?auto_13383 ?auto_13374 ) ) ( AVAILABLE ?auto_13374 ) ( SURFACE-AT ?auto_13367 ?auto_13375 ) ( ON ?auto_13367 ?auto_13370 ) ( CLEAR ?auto_13367 ) ( not ( = ?auto_13367 ?auto_13370 ) ) ( not ( = ?auto_13368 ?auto_13370 ) ) ( not ( = ?auto_13378 ?auto_13370 ) ) ( not ( = ?auto_13384 ?auto_13370 ) ) ( IS-CRATE ?auto_13378 ) ( not ( = ?auto_13382 ?auto_13378 ) ) ( not ( = ?auto_13367 ?auto_13382 ) ) ( not ( = ?auto_13368 ?auto_13382 ) ) ( not ( = ?auto_13384 ?auto_13382 ) ) ( not ( = ?auto_13370 ?auto_13382 ) ) ( not ( = ?auto_13372 ?auto_13376 ) ) ( not ( = ?auto_13381 ?auto_13372 ) ) ( not ( = ?auto_13375 ?auto_13372 ) ) ( HOIST-AT ?auto_13386 ?auto_13372 ) ( not ( = ?auto_13371 ?auto_13386 ) ) ( not ( = ?auto_13383 ?auto_13386 ) ) ( not ( = ?auto_13374 ?auto_13386 ) ) ( AVAILABLE ?auto_13386 ) ( SURFACE-AT ?auto_13378 ?auto_13372 ) ( ON ?auto_13378 ?auto_13385 ) ( CLEAR ?auto_13378 ) ( not ( = ?auto_13367 ?auto_13385 ) ) ( not ( = ?auto_13368 ?auto_13385 ) ) ( not ( = ?auto_13378 ?auto_13385 ) ) ( not ( = ?auto_13384 ?auto_13385 ) ) ( not ( = ?auto_13370 ?auto_13385 ) ) ( not ( = ?auto_13382 ?auto_13385 ) ) ( SURFACE-AT ?auto_13369 ?auto_13376 ) ( CLEAR ?auto_13369 ) ( IS-CRATE ?auto_13382 ) ( not ( = ?auto_13369 ?auto_13382 ) ) ( not ( = ?auto_13367 ?auto_13369 ) ) ( not ( = ?auto_13368 ?auto_13369 ) ) ( not ( = ?auto_13378 ?auto_13369 ) ) ( not ( = ?auto_13384 ?auto_13369 ) ) ( not ( = ?auto_13370 ?auto_13369 ) ) ( not ( = ?auto_13385 ?auto_13369 ) ) ( AVAILABLE ?auto_13371 ) ( not ( = ?auto_13380 ?auto_13376 ) ) ( not ( = ?auto_13381 ?auto_13380 ) ) ( not ( = ?auto_13375 ?auto_13380 ) ) ( not ( = ?auto_13372 ?auto_13380 ) ) ( HOIST-AT ?auto_13373 ?auto_13380 ) ( not ( = ?auto_13371 ?auto_13373 ) ) ( not ( = ?auto_13383 ?auto_13373 ) ) ( not ( = ?auto_13374 ?auto_13373 ) ) ( not ( = ?auto_13386 ?auto_13373 ) ) ( AVAILABLE ?auto_13373 ) ( SURFACE-AT ?auto_13382 ?auto_13380 ) ( ON ?auto_13382 ?auto_13377 ) ( CLEAR ?auto_13382 ) ( not ( = ?auto_13367 ?auto_13377 ) ) ( not ( = ?auto_13368 ?auto_13377 ) ) ( not ( = ?auto_13378 ?auto_13377 ) ) ( not ( = ?auto_13384 ?auto_13377 ) ) ( not ( = ?auto_13370 ?auto_13377 ) ) ( not ( = ?auto_13382 ?auto_13377 ) ) ( not ( = ?auto_13385 ?auto_13377 ) ) ( not ( = ?auto_13369 ?auto_13377 ) ) ( TRUCK-AT ?auto_13379 ?auto_13376 ) )
    :subtasks
    ( ( !DRIVE ?auto_13379 ?auto_13376 ?auto_13380 )
      ( MAKE-2CRATE ?auto_13378 ?auto_13367 ?auto_13368 )
      ( MAKE-1CRATE-VERIFY ?auto_13367 ?auto_13368 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_13387 - SURFACE
      ?auto_13388 - SURFACE
      ?auto_13389 - SURFACE
    )
    :vars
    (
      ?auto_13400 - HOIST
      ?auto_13401 - PLACE
      ?auto_13402 - PLACE
      ?auto_13395 - HOIST
      ?auto_13406 - SURFACE
      ?auto_13393 - PLACE
      ?auto_13404 - HOIST
      ?auto_13403 - SURFACE
      ?auto_13392 - SURFACE
      ?auto_13394 - PLACE
      ?auto_13397 - HOIST
      ?auto_13399 - SURFACE
      ?auto_13391 - SURFACE
      ?auto_13396 - PLACE
      ?auto_13398 - HOIST
      ?auto_13390 - SURFACE
      ?auto_13405 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13400 ?auto_13401 ) ( IS-CRATE ?auto_13389 ) ( not ( = ?auto_13388 ?auto_13389 ) ) ( not ( = ?auto_13387 ?auto_13388 ) ) ( not ( = ?auto_13387 ?auto_13389 ) ) ( not ( = ?auto_13402 ?auto_13401 ) ) ( HOIST-AT ?auto_13395 ?auto_13402 ) ( not ( = ?auto_13400 ?auto_13395 ) ) ( AVAILABLE ?auto_13395 ) ( SURFACE-AT ?auto_13389 ?auto_13402 ) ( ON ?auto_13389 ?auto_13406 ) ( CLEAR ?auto_13389 ) ( not ( = ?auto_13388 ?auto_13406 ) ) ( not ( = ?auto_13389 ?auto_13406 ) ) ( not ( = ?auto_13387 ?auto_13406 ) ) ( IS-CRATE ?auto_13388 ) ( not ( = ?auto_13393 ?auto_13401 ) ) ( not ( = ?auto_13402 ?auto_13393 ) ) ( HOIST-AT ?auto_13404 ?auto_13393 ) ( not ( = ?auto_13400 ?auto_13404 ) ) ( not ( = ?auto_13395 ?auto_13404 ) ) ( AVAILABLE ?auto_13404 ) ( SURFACE-AT ?auto_13388 ?auto_13393 ) ( ON ?auto_13388 ?auto_13403 ) ( CLEAR ?auto_13388 ) ( not ( = ?auto_13388 ?auto_13403 ) ) ( not ( = ?auto_13389 ?auto_13403 ) ) ( not ( = ?auto_13387 ?auto_13403 ) ) ( not ( = ?auto_13406 ?auto_13403 ) ) ( IS-CRATE ?auto_13387 ) ( not ( = ?auto_13392 ?auto_13387 ) ) ( not ( = ?auto_13388 ?auto_13392 ) ) ( not ( = ?auto_13389 ?auto_13392 ) ) ( not ( = ?auto_13406 ?auto_13392 ) ) ( not ( = ?auto_13403 ?auto_13392 ) ) ( not ( = ?auto_13394 ?auto_13401 ) ) ( not ( = ?auto_13402 ?auto_13394 ) ) ( not ( = ?auto_13393 ?auto_13394 ) ) ( HOIST-AT ?auto_13397 ?auto_13394 ) ( not ( = ?auto_13400 ?auto_13397 ) ) ( not ( = ?auto_13395 ?auto_13397 ) ) ( not ( = ?auto_13404 ?auto_13397 ) ) ( AVAILABLE ?auto_13397 ) ( SURFACE-AT ?auto_13387 ?auto_13394 ) ( ON ?auto_13387 ?auto_13399 ) ( CLEAR ?auto_13387 ) ( not ( = ?auto_13388 ?auto_13399 ) ) ( not ( = ?auto_13389 ?auto_13399 ) ) ( not ( = ?auto_13387 ?auto_13399 ) ) ( not ( = ?auto_13406 ?auto_13399 ) ) ( not ( = ?auto_13403 ?auto_13399 ) ) ( not ( = ?auto_13392 ?auto_13399 ) ) ( SURFACE-AT ?auto_13391 ?auto_13401 ) ( CLEAR ?auto_13391 ) ( IS-CRATE ?auto_13392 ) ( not ( = ?auto_13391 ?auto_13392 ) ) ( not ( = ?auto_13388 ?auto_13391 ) ) ( not ( = ?auto_13389 ?auto_13391 ) ) ( not ( = ?auto_13387 ?auto_13391 ) ) ( not ( = ?auto_13406 ?auto_13391 ) ) ( not ( = ?auto_13403 ?auto_13391 ) ) ( not ( = ?auto_13399 ?auto_13391 ) ) ( AVAILABLE ?auto_13400 ) ( not ( = ?auto_13396 ?auto_13401 ) ) ( not ( = ?auto_13402 ?auto_13396 ) ) ( not ( = ?auto_13393 ?auto_13396 ) ) ( not ( = ?auto_13394 ?auto_13396 ) ) ( HOIST-AT ?auto_13398 ?auto_13396 ) ( not ( = ?auto_13400 ?auto_13398 ) ) ( not ( = ?auto_13395 ?auto_13398 ) ) ( not ( = ?auto_13404 ?auto_13398 ) ) ( not ( = ?auto_13397 ?auto_13398 ) ) ( AVAILABLE ?auto_13398 ) ( SURFACE-AT ?auto_13392 ?auto_13396 ) ( ON ?auto_13392 ?auto_13390 ) ( CLEAR ?auto_13392 ) ( not ( = ?auto_13388 ?auto_13390 ) ) ( not ( = ?auto_13389 ?auto_13390 ) ) ( not ( = ?auto_13387 ?auto_13390 ) ) ( not ( = ?auto_13406 ?auto_13390 ) ) ( not ( = ?auto_13403 ?auto_13390 ) ) ( not ( = ?auto_13392 ?auto_13390 ) ) ( not ( = ?auto_13399 ?auto_13390 ) ) ( not ( = ?auto_13391 ?auto_13390 ) ) ( TRUCK-AT ?auto_13405 ?auto_13401 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_13388 ?auto_13389 )
      ( MAKE-2CRATE-VERIFY ?auto_13387 ?auto_13388 ?auto_13389 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_13407 - SURFACE
      ?auto_13408 - SURFACE
      ?auto_13409 - SURFACE
      ?auto_13410 - SURFACE
    )
    :vars
    (
      ?auto_13424 - HOIST
      ?auto_13426 - PLACE
      ?auto_13423 - PLACE
      ?auto_13419 - HOIST
      ?auto_13412 - SURFACE
      ?auto_13416 - PLACE
      ?auto_13420 - HOIST
      ?auto_13425 - SURFACE
      ?auto_13418 - PLACE
      ?auto_13414 - HOIST
      ?auto_13421 - SURFACE
      ?auto_13413 - SURFACE
      ?auto_13411 - PLACE
      ?auto_13417 - HOIST
      ?auto_13422 - SURFACE
      ?auto_13415 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13424 ?auto_13426 ) ( IS-CRATE ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13410 ) ) ( not ( = ?auto_13408 ?auto_13409 ) ) ( not ( = ?auto_13408 ?auto_13410 ) ) ( not ( = ?auto_13423 ?auto_13426 ) ) ( HOIST-AT ?auto_13419 ?auto_13423 ) ( not ( = ?auto_13424 ?auto_13419 ) ) ( AVAILABLE ?auto_13419 ) ( SURFACE-AT ?auto_13410 ?auto_13423 ) ( ON ?auto_13410 ?auto_13412 ) ( CLEAR ?auto_13410 ) ( not ( = ?auto_13409 ?auto_13412 ) ) ( not ( = ?auto_13410 ?auto_13412 ) ) ( not ( = ?auto_13408 ?auto_13412 ) ) ( IS-CRATE ?auto_13409 ) ( not ( = ?auto_13416 ?auto_13426 ) ) ( not ( = ?auto_13423 ?auto_13416 ) ) ( HOIST-AT ?auto_13420 ?auto_13416 ) ( not ( = ?auto_13424 ?auto_13420 ) ) ( not ( = ?auto_13419 ?auto_13420 ) ) ( AVAILABLE ?auto_13420 ) ( SURFACE-AT ?auto_13409 ?auto_13416 ) ( ON ?auto_13409 ?auto_13425 ) ( CLEAR ?auto_13409 ) ( not ( = ?auto_13409 ?auto_13425 ) ) ( not ( = ?auto_13410 ?auto_13425 ) ) ( not ( = ?auto_13408 ?auto_13425 ) ) ( not ( = ?auto_13412 ?auto_13425 ) ) ( IS-CRATE ?auto_13408 ) ( not ( = ?auto_13407 ?auto_13408 ) ) ( not ( = ?auto_13409 ?auto_13407 ) ) ( not ( = ?auto_13410 ?auto_13407 ) ) ( not ( = ?auto_13412 ?auto_13407 ) ) ( not ( = ?auto_13425 ?auto_13407 ) ) ( not ( = ?auto_13418 ?auto_13426 ) ) ( not ( = ?auto_13423 ?auto_13418 ) ) ( not ( = ?auto_13416 ?auto_13418 ) ) ( HOIST-AT ?auto_13414 ?auto_13418 ) ( not ( = ?auto_13424 ?auto_13414 ) ) ( not ( = ?auto_13419 ?auto_13414 ) ) ( not ( = ?auto_13420 ?auto_13414 ) ) ( AVAILABLE ?auto_13414 ) ( SURFACE-AT ?auto_13408 ?auto_13418 ) ( ON ?auto_13408 ?auto_13421 ) ( CLEAR ?auto_13408 ) ( not ( = ?auto_13409 ?auto_13421 ) ) ( not ( = ?auto_13410 ?auto_13421 ) ) ( not ( = ?auto_13408 ?auto_13421 ) ) ( not ( = ?auto_13412 ?auto_13421 ) ) ( not ( = ?auto_13425 ?auto_13421 ) ) ( not ( = ?auto_13407 ?auto_13421 ) ) ( SURFACE-AT ?auto_13413 ?auto_13426 ) ( CLEAR ?auto_13413 ) ( IS-CRATE ?auto_13407 ) ( not ( = ?auto_13413 ?auto_13407 ) ) ( not ( = ?auto_13409 ?auto_13413 ) ) ( not ( = ?auto_13410 ?auto_13413 ) ) ( not ( = ?auto_13408 ?auto_13413 ) ) ( not ( = ?auto_13412 ?auto_13413 ) ) ( not ( = ?auto_13425 ?auto_13413 ) ) ( not ( = ?auto_13421 ?auto_13413 ) ) ( AVAILABLE ?auto_13424 ) ( not ( = ?auto_13411 ?auto_13426 ) ) ( not ( = ?auto_13423 ?auto_13411 ) ) ( not ( = ?auto_13416 ?auto_13411 ) ) ( not ( = ?auto_13418 ?auto_13411 ) ) ( HOIST-AT ?auto_13417 ?auto_13411 ) ( not ( = ?auto_13424 ?auto_13417 ) ) ( not ( = ?auto_13419 ?auto_13417 ) ) ( not ( = ?auto_13420 ?auto_13417 ) ) ( not ( = ?auto_13414 ?auto_13417 ) ) ( AVAILABLE ?auto_13417 ) ( SURFACE-AT ?auto_13407 ?auto_13411 ) ( ON ?auto_13407 ?auto_13422 ) ( CLEAR ?auto_13407 ) ( not ( = ?auto_13409 ?auto_13422 ) ) ( not ( = ?auto_13410 ?auto_13422 ) ) ( not ( = ?auto_13408 ?auto_13422 ) ) ( not ( = ?auto_13412 ?auto_13422 ) ) ( not ( = ?auto_13425 ?auto_13422 ) ) ( not ( = ?auto_13407 ?auto_13422 ) ) ( not ( = ?auto_13421 ?auto_13422 ) ) ( not ( = ?auto_13413 ?auto_13422 ) ) ( TRUCK-AT ?auto_13415 ?auto_13426 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13408 ?auto_13409 ?auto_13410 )
      ( MAKE-3CRATE-VERIFY ?auto_13407 ?auto_13408 ?auto_13409 ?auto_13410 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_13427 - SURFACE
      ?auto_13428 - SURFACE
      ?auto_13429 - SURFACE
      ?auto_13430 - SURFACE
      ?auto_13431 - SURFACE
    )
    :vars
    (
      ?auto_13444 - HOIST
      ?auto_13446 - PLACE
      ?auto_13443 - PLACE
      ?auto_13439 - HOIST
      ?auto_13433 - SURFACE
      ?auto_13436 - PLACE
      ?auto_13440 - HOIST
      ?auto_13445 - SURFACE
      ?auto_13438 - PLACE
      ?auto_13434 - HOIST
      ?auto_13441 - SURFACE
      ?auto_13432 - PLACE
      ?auto_13437 - HOIST
      ?auto_13442 - SURFACE
      ?auto_13435 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_13444 ?auto_13446 ) ( IS-CRATE ?auto_13431 ) ( not ( = ?auto_13430 ?auto_13431 ) ) ( not ( = ?auto_13429 ?auto_13430 ) ) ( not ( = ?auto_13429 ?auto_13431 ) ) ( not ( = ?auto_13443 ?auto_13446 ) ) ( HOIST-AT ?auto_13439 ?auto_13443 ) ( not ( = ?auto_13444 ?auto_13439 ) ) ( AVAILABLE ?auto_13439 ) ( SURFACE-AT ?auto_13431 ?auto_13443 ) ( ON ?auto_13431 ?auto_13433 ) ( CLEAR ?auto_13431 ) ( not ( = ?auto_13430 ?auto_13433 ) ) ( not ( = ?auto_13431 ?auto_13433 ) ) ( not ( = ?auto_13429 ?auto_13433 ) ) ( IS-CRATE ?auto_13430 ) ( not ( = ?auto_13436 ?auto_13446 ) ) ( not ( = ?auto_13443 ?auto_13436 ) ) ( HOIST-AT ?auto_13440 ?auto_13436 ) ( not ( = ?auto_13444 ?auto_13440 ) ) ( not ( = ?auto_13439 ?auto_13440 ) ) ( AVAILABLE ?auto_13440 ) ( SURFACE-AT ?auto_13430 ?auto_13436 ) ( ON ?auto_13430 ?auto_13445 ) ( CLEAR ?auto_13430 ) ( not ( = ?auto_13430 ?auto_13445 ) ) ( not ( = ?auto_13431 ?auto_13445 ) ) ( not ( = ?auto_13429 ?auto_13445 ) ) ( not ( = ?auto_13433 ?auto_13445 ) ) ( IS-CRATE ?auto_13429 ) ( not ( = ?auto_13428 ?auto_13429 ) ) ( not ( = ?auto_13430 ?auto_13428 ) ) ( not ( = ?auto_13431 ?auto_13428 ) ) ( not ( = ?auto_13433 ?auto_13428 ) ) ( not ( = ?auto_13445 ?auto_13428 ) ) ( not ( = ?auto_13438 ?auto_13446 ) ) ( not ( = ?auto_13443 ?auto_13438 ) ) ( not ( = ?auto_13436 ?auto_13438 ) ) ( HOIST-AT ?auto_13434 ?auto_13438 ) ( not ( = ?auto_13444 ?auto_13434 ) ) ( not ( = ?auto_13439 ?auto_13434 ) ) ( not ( = ?auto_13440 ?auto_13434 ) ) ( AVAILABLE ?auto_13434 ) ( SURFACE-AT ?auto_13429 ?auto_13438 ) ( ON ?auto_13429 ?auto_13441 ) ( CLEAR ?auto_13429 ) ( not ( = ?auto_13430 ?auto_13441 ) ) ( not ( = ?auto_13431 ?auto_13441 ) ) ( not ( = ?auto_13429 ?auto_13441 ) ) ( not ( = ?auto_13433 ?auto_13441 ) ) ( not ( = ?auto_13445 ?auto_13441 ) ) ( not ( = ?auto_13428 ?auto_13441 ) ) ( SURFACE-AT ?auto_13427 ?auto_13446 ) ( CLEAR ?auto_13427 ) ( IS-CRATE ?auto_13428 ) ( not ( = ?auto_13427 ?auto_13428 ) ) ( not ( = ?auto_13430 ?auto_13427 ) ) ( not ( = ?auto_13431 ?auto_13427 ) ) ( not ( = ?auto_13429 ?auto_13427 ) ) ( not ( = ?auto_13433 ?auto_13427 ) ) ( not ( = ?auto_13445 ?auto_13427 ) ) ( not ( = ?auto_13441 ?auto_13427 ) ) ( AVAILABLE ?auto_13444 ) ( not ( = ?auto_13432 ?auto_13446 ) ) ( not ( = ?auto_13443 ?auto_13432 ) ) ( not ( = ?auto_13436 ?auto_13432 ) ) ( not ( = ?auto_13438 ?auto_13432 ) ) ( HOIST-AT ?auto_13437 ?auto_13432 ) ( not ( = ?auto_13444 ?auto_13437 ) ) ( not ( = ?auto_13439 ?auto_13437 ) ) ( not ( = ?auto_13440 ?auto_13437 ) ) ( not ( = ?auto_13434 ?auto_13437 ) ) ( AVAILABLE ?auto_13437 ) ( SURFACE-AT ?auto_13428 ?auto_13432 ) ( ON ?auto_13428 ?auto_13442 ) ( CLEAR ?auto_13428 ) ( not ( = ?auto_13430 ?auto_13442 ) ) ( not ( = ?auto_13431 ?auto_13442 ) ) ( not ( = ?auto_13429 ?auto_13442 ) ) ( not ( = ?auto_13433 ?auto_13442 ) ) ( not ( = ?auto_13445 ?auto_13442 ) ) ( not ( = ?auto_13428 ?auto_13442 ) ) ( not ( = ?auto_13441 ?auto_13442 ) ) ( not ( = ?auto_13427 ?auto_13442 ) ) ( TRUCK-AT ?auto_13435 ?auto_13446 ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_13429 ?auto_13430 ?auto_13431 )
      ( MAKE-4CRATE-VERIFY ?auto_13427 ?auto_13428 ?auto_13429 ?auto_13430 ?auto_13431 ) )
  )

)

