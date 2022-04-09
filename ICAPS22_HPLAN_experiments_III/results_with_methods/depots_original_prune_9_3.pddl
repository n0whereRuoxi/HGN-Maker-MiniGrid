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

  ( :method MAKE-9CRATE-VERIFY
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
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225285 - SURFACE
      ?auto_225286 - SURFACE
    )
    :vars
    (
      ?auto_225287 - HOIST
      ?auto_225288 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225287 ?auto_225288 ) ( SURFACE-AT ?auto_225285 ?auto_225288 ) ( CLEAR ?auto_225285 ) ( LIFTING ?auto_225287 ?auto_225286 ) ( IS-CRATE ?auto_225286 ) ( not ( = ?auto_225285 ?auto_225286 ) ) )
    :subtasks
    ( ( !DROP ?auto_225287 ?auto_225286 ?auto_225285 ?auto_225288 )
      ( MAKE-1CRATE-VERIFY ?auto_225285 ?auto_225286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225289 - SURFACE
      ?auto_225290 - SURFACE
    )
    :vars
    (
      ?auto_225291 - HOIST
      ?auto_225292 - PLACE
      ?auto_225293 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225291 ?auto_225292 ) ( SURFACE-AT ?auto_225289 ?auto_225292 ) ( CLEAR ?auto_225289 ) ( IS-CRATE ?auto_225290 ) ( not ( = ?auto_225289 ?auto_225290 ) ) ( TRUCK-AT ?auto_225293 ?auto_225292 ) ( AVAILABLE ?auto_225291 ) ( IN ?auto_225290 ?auto_225293 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225291 ?auto_225290 ?auto_225293 ?auto_225292 )
      ( MAKE-1CRATE ?auto_225289 ?auto_225290 )
      ( MAKE-1CRATE-VERIFY ?auto_225289 ?auto_225290 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225294 - SURFACE
      ?auto_225295 - SURFACE
    )
    :vars
    (
      ?auto_225297 - HOIST
      ?auto_225298 - PLACE
      ?auto_225296 - TRUCK
      ?auto_225299 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225297 ?auto_225298 ) ( SURFACE-AT ?auto_225294 ?auto_225298 ) ( CLEAR ?auto_225294 ) ( IS-CRATE ?auto_225295 ) ( not ( = ?auto_225294 ?auto_225295 ) ) ( AVAILABLE ?auto_225297 ) ( IN ?auto_225295 ?auto_225296 ) ( TRUCK-AT ?auto_225296 ?auto_225299 ) ( not ( = ?auto_225299 ?auto_225298 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225296 ?auto_225299 ?auto_225298 )
      ( MAKE-1CRATE ?auto_225294 ?auto_225295 )
      ( MAKE-1CRATE-VERIFY ?auto_225294 ?auto_225295 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225300 - SURFACE
      ?auto_225301 - SURFACE
    )
    :vars
    (
      ?auto_225304 - HOIST
      ?auto_225303 - PLACE
      ?auto_225305 - TRUCK
      ?auto_225302 - PLACE
      ?auto_225306 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225304 ?auto_225303 ) ( SURFACE-AT ?auto_225300 ?auto_225303 ) ( CLEAR ?auto_225300 ) ( IS-CRATE ?auto_225301 ) ( not ( = ?auto_225300 ?auto_225301 ) ) ( AVAILABLE ?auto_225304 ) ( TRUCK-AT ?auto_225305 ?auto_225302 ) ( not ( = ?auto_225302 ?auto_225303 ) ) ( HOIST-AT ?auto_225306 ?auto_225302 ) ( LIFTING ?auto_225306 ?auto_225301 ) ( not ( = ?auto_225304 ?auto_225306 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225306 ?auto_225301 ?auto_225305 ?auto_225302 )
      ( MAKE-1CRATE ?auto_225300 ?auto_225301 )
      ( MAKE-1CRATE-VERIFY ?auto_225300 ?auto_225301 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225307 - SURFACE
      ?auto_225308 - SURFACE
    )
    :vars
    (
      ?auto_225309 - HOIST
      ?auto_225312 - PLACE
      ?auto_225313 - TRUCK
      ?auto_225310 - PLACE
      ?auto_225311 - HOIST
      ?auto_225314 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225309 ?auto_225312 ) ( SURFACE-AT ?auto_225307 ?auto_225312 ) ( CLEAR ?auto_225307 ) ( IS-CRATE ?auto_225308 ) ( not ( = ?auto_225307 ?auto_225308 ) ) ( AVAILABLE ?auto_225309 ) ( TRUCK-AT ?auto_225313 ?auto_225310 ) ( not ( = ?auto_225310 ?auto_225312 ) ) ( HOIST-AT ?auto_225311 ?auto_225310 ) ( not ( = ?auto_225309 ?auto_225311 ) ) ( AVAILABLE ?auto_225311 ) ( SURFACE-AT ?auto_225308 ?auto_225310 ) ( ON ?auto_225308 ?auto_225314 ) ( CLEAR ?auto_225308 ) ( not ( = ?auto_225307 ?auto_225314 ) ) ( not ( = ?auto_225308 ?auto_225314 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225311 ?auto_225308 ?auto_225314 ?auto_225310 )
      ( MAKE-1CRATE ?auto_225307 ?auto_225308 )
      ( MAKE-1CRATE-VERIFY ?auto_225307 ?auto_225308 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225315 - SURFACE
      ?auto_225316 - SURFACE
    )
    :vars
    (
      ?auto_225317 - HOIST
      ?auto_225321 - PLACE
      ?auto_225318 - PLACE
      ?auto_225319 - HOIST
      ?auto_225320 - SURFACE
      ?auto_225322 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225317 ?auto_225321 ) ( SURFACE-AT ?auto_225315 ?auto_225321 ) ( CLEAR ?auto_225315 ) ( IS-CRATE ?auto_225316 ) ( not ( = ?auto_225315 ?auto_225316 ) ) ( AVAILABLE ?auto_225317 ) ( not ( = ?auto_225318 ?auto_225321 ) ) ( HOIST-AT ?auto_225319 ?auto_225318 ) ( not ( = ?auto_225317 ?auto_225319 ) ) ( AVAILABLE ?auto_225319 ) ( SURFACE-AT ?auto_225316 ?auto_225318 ) ( ON ?auto_225316 ?auto_225320 ) ( CLEAR ?auto_225316 ) ( not ( = ?auto_225315 ?auto_225320 ) ) ( not ( = ?auto_225316 ?auto_225320 ) ) ( TRUCK-AT ?auto_225322 ?auto_225321 ) )
    :subtasks
    ( ( !DRIVE ?auto_225322 ?auto_225321 ?auto_225318 )
      ( MAKE-1CRATE ?auto_225315 ?auto_225316 )
      ( MAKE-1CRATE-VERIFY ?auto_225315 ?auto_225316 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225332 - SURFACE
      ?auto_225333 - SURFACE
      ?auto_225334 - SURFACE
    )
    :vars
    (
      ?auto_225336 - HOIST
      ?auto_225335 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225336 ?auto_225335 ) ( SURFACE-AT ?auto_225333 ?auto_225335 ) ( CLEAR ?auto_225333 ) ( LIFTING ?auto_225336 ?auto_225334 ) ( IS-CRATE ?auto_225334 ) ( not ( = ?auto_225333 ?auto_225334 ) ) ( ON ?auto_225333 ?auto_225332 ) ( not ( = ?auto_225332 ?auto_225333 ) ) ( not ( = ?auto_225332 ?auto_225334 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225333 ?auto_225334 )
      ( MAKE-2CRATE-VERIFY ?auto_225332 ?auto_225333 ?auto_225334 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225342 - SURFACE
      ?auto_225343 - SURFACE
      ?auto_225344 - SURFACE
    )
    :vars
    (
      ?auto_225345 - HOIST
      ?auto_225346 - PLACE
      ?auto_225347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225345 ?auto_225346 ) ( SURFACE-AT ?auto_225343 ?auto_225346 ) ( CLEAR ?auto_225343 ) ( IS-CRATE ?auto_225344 ) ( not ( = ?auto_225343 ?auto_225344 ) ) ( TRUCK-AT ?auto_225347 ?auto_225346 ) ( AVAILABLE ?auto_225345 ) ( IN ?auto_225344 ?auto_225347 ) ( ON ?auto_225343 ?auto_225342 ) ( not ( = ?auto_225342 ?auto_225343 ) ) ( not ( = ?auto_225342 ?auto_225344 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225343 ?auto_225344 )
      ( MAKE-2CRATE-VERIFY ?auto_225342 ?auto_225343 ?auto_225344 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225348 - SURFACE
      ?auto_225349 - SURFACE
    )
    :vars
    (
      ?auto_225350 - HOIST
      ?auto_225353 - PLACE
      ?auto_225352 - TRUCK
      ?auto_225351 - SURFACE
      ?auto_225354 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225350 ?auto_225353 ) ( SURFACE-AT ?auto_225348 ?auto_225353 ) ( CLEAR ?auto_225348 ) ( IS-CRATE ?auto_225349 ) ( not ( = ?auto_225348 ?auto_225349 ) ) ( AVAILABLE ?auto_225350 ) ( IN ?auto_225349 ?auto_225352 ) ( ON ?auto_225348 ?auto_225351 ) ( not ( = ?auto_225351 ?auto_225348 ) ) ( not ( = ?auto_225351 ?auto_225349 ) ) ( TRUCK-AT ?auto_225352 ?auto_225354 ) ( not ( = ?auto_225354 ?auto_225353 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225352 ?auto_225354 ?auto_225353 )
      ( MAKE-2CRATE ?auto_225351 ?auto_225348 ?auto_225349 )
      ( MAKE-1CRATE-VERIFY ?auto_225348 ?auto_225349 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225355 - SURFACE
      ?auto_225356 - SURFACE
      ?auto_225357 - SURFACE
    )
    :vars
    (
      ?auto_225358 - HOIST
      ?auto_225361 - PLACE
      ?auto_225359 - TRUCK
      ?auto_225360 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225358 ?auto_225361 ) ( SURFACE-AT ?auto_225356 ?auto_225361 ) ( CLEAR ?auto_225356 ) ( IS-CRATE ?auto_225357 ) ( not ( = ?auto_225356 ?auto_225357 ) ) ( AVAILABLE ?auto_225358 ) ( IN ?auto_225357 ?auto_225359 ) ( ON ?auto_225356 ?auto_225355 ) ( not ( = ?auto_225355 ?auto_225356 ) ) ( not ( = ?auto_225355 ?auto_225357 ) ) ( TRUCK-AT ?auto_225359 ?auto_225360 ) ( not ( = ?auto_225360 ?auto_225361 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225356 ?auto_225357 )
      ( MAKE-2CRATE-VERIFY ?auto_225355 ?auto_225356 ?auto_225357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225362 - SURFACE
      ?auto_225363 - SURFACE
    )
    :vars
    (
      ?auto_225365 - HOIST
      ?auto_225364 - PLACE
      ?auto_225367 - SURFACE
      ?auto_225366 - TRUCK
      ?auto_225368 - PLACE
      ?auto_225369 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225365 ?auto_225364 ) ( SURFACE-AT ?auto_225362 ?auto_225364 ) ( CLEAR ?auto_225362 ) ( IS-CRATE ?auto_225363 ) ( not ( = ?auto_225362 ?auto_225363 ) ) ( AVAILABLE ?auto_225365 ) ( ON ?auto_225362 ?auto_225367 ) ( not ( = ?auto_225367 ?auto_225362 ) ) ( not ( = ?auto_225367 ?auto_225363 ) ) ( TRUCK-AT ?auto_225366 ?auto_225368 ) ( not ( = ?auto_225368 ?auto_225364 ) ) ( HOIST-AT ?auto_225369 ?auto_225368 ) ( LIFTING ?auto_225369 ?auto_225363 ) ( not ( = ?auto_225365 ?auto_225369 ) ) )
    :subtasks
    ( ( !LOAD ?auto_225369 ?auto_225363 ?auto_225366 ?auto_225368 )
      ( MAKE-2CRATE ?auto_225367 ?auto_225362 ?auto_225363 )
      ( MAKE-1CRATE-VERIFY ?auto_225362 ?auto_225363 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225370 - SURFACE
      ?auto_225371 - SURFACE
      ?auto_225372 - SURFACE
    )
    :vars
    (
      ?auto_225373 - HOIST
      ?auto_225377 - PLACE
      ?auto_225376 - TRUCK
      ?auto_225374 - PLACE
      ?auto_225375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225373 ?auto_225377 ) ( SURFACE-AT ?auto_225371 ?auto_225377 ) ( CLEAR ?auto_225371 ) ( IS-CRATE ?auto_225372 ) ( not ( = ?auto_225371 ?auto_225372 ) ) ( AVAILABLE ?auto_225373 ) ( ON ?auto_225371 ?auto_225370 ) ( not ( = ?auto_225370 ?auto_225371 ) ) ( not ( = ?auto_225370 ?auto_225372 ) ) ( TRUCK-AT ?auto_225376 ?auto_225374 ) ( not ( = ?auto_225374 ?auto_225377 ) ) ( HOIST-AT ?auto_225375 ?auto_225374 ) ( LIFTING ?auto_225375 ?auto_225372 ) ( not ( = ?auto_225373 ?auto_225375 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225371 ?auto_225372 )
      ( MAKE-2CRATE-VERIFY ?auto_225370 ?auto_225371 ?auto_225372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225378 - SURFACE
      ?auto_225379 - SURFACE
    )
    :vars
    (
      ?auto_225382 - HOIST
      ?auto_225383 - PLACE
      ?auto_225380 - SURFACE
      ?auto_225385 - TRUCK
      ?auto_225384 - PLACE
      ?auto_225381 - HOIST
      ?auto_225386 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225382 ?auto_225383 ) ( SURFACE-AT ?auto_225378 ?auto_225383 ) ( CLEAR ?auto_225378 ) ( IS-CRATE ?auto_225379 ) ( not ( = ?auto_225378 ?auto_225379 ) ) ( AVAILABLE ?auto_225382 ) ( ON ?auto_225378 ?auto_225380 ) ( not ( = ?auto_225380 ?auto_225378 ) ) ( not ( = ?auto_225380 ?auto_225379 ) ) ( TRUCK-AT ?auto_225385 ?auto_225384 ) ( not ( = ?auto_225384 ?auto_225383 ) ) ( HOIST-AT ?auto_225381 ?auto_225384 ) ( not ( = ?auto_225382 ?auto_225381 ) ) ( AVAILABLE ?auto_225381 ) ( SURFACE-AT ?auto_225379 ?auto_225384 ) ( ON ?auto_225379 ?auto_225386 ) ( CLEAR ?auto_225379 ) ( not ( = ?auto_225378 ?auto_225386 ) ) ( not ( = ?auto_225379 ?auto_225386 ) ) ( not ( = ?auto_225380 ?auto_225386 ) ) )
    :subtasks
    ( ( !LIFT ?auto_225381 ?auto_225379 ?auto_225386 ?auto_225384 )
      ( MAKE-2CRATE ?auto_225380 ?auto_225378 ?auto_225379 )
      ( MAKE-1CRATE-VERIFY ?auto_225378 ?auto_225379 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225387 - SURFACE
      ?auto_225388 - SURFACE
      ?auto_225389 - SURFACE
    )
    :vars
    (
      ?auto_225394 - HOIST
      ?auto_225393 - PLACE
      ?auto_225392 - TRUCK
      ?auto_225390 - PLACE
      ?auto_225395 - HOIST
      ?auto_225391 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225394 ?auto_225393 ) ( SURFACE-AT ?auto_225388 ?auto_225393 ) ( CLEAR ?auto_225388 ) ( IS-CRATE ?auto_225389 ) ( not ( = ?auto_225388 ?auto_225389 ) ) ( AVAILABLE ?auto_225394 ) ( ON ?auto_225388 ?auto_225387 ) ( not ( = ?auto_225387 ?auto_225388 ) ) ( not ( = ?auto_225387 ?auto_225389 ) ) ( TRUCK-AT ?auto_225392 ?auto_225390 ) ( not ( = ?auto_225390 ?auto_225393 ) ) ( HOIST-AT ?auto_225395 ?auto_225390 ) ( not ( = ?auto_225394 ?auto_225395 ) ) ( AVAILABLE ?auto_225395 ) ( SURFACE-AT ?auto_225389 ?auto_225390 ) ( ON ?auto_225389 ?auto_225391 ) ( CLEAR ?auto_225389 ) ( not ( = ?auto_225388 ?auto_225391 ) ) ( not ( = ?auto_225389 ?auto_225391 ) ) ( not ( = ?auto_225387 ?auto_225391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225388 ?auto_225389 )
      ( MAKE-2CRATE-VERIFY ?auto_225387 ?auto_225388 ?auto_225389 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225396 - SURFACE
      ?auto_225397 - SURFACE
    )
    :vars
    (
      ?auto_225398 - HOIST
      ?auto_225400 - PLACE
      ?auto_225403 - SURFACE
      ?auto_225402 - PLACE
      ?auto_225401 - HOIST
      ?auto_225404 - SURFACE
      ?auto_225399 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225398 ?auto_225400 ) ( SURFACE-AT ?auto_225396 ?auto_225400 ) ( CLEAR ?auto_225396 ) ( IS-CRATE ?auto_225397 ) ( not ( = ?auto_225396 ?auto_225397 ) ) ( AVAILABLE ?auto_225398 ) ( ON ?auto_225396 ?auto_225403 ) ( not ( = ?auto_225403 ?auto_225396 ) ) ( not ( = ?auto_225403 ?auto_225397 ) ) ( not ( = ?auto_225402 ?auto_225400 ) ) ( HOIST-AT ?auto_225401 ?auto_225402 ) ( not ( = ?auto_225398 ?auto_225401 ) ) ( AVAILABLE ?auto_225401 ) ( SURFACE-AT ?auto_225397 ?auto_225402 ) ( ON ?auto_225397 ?auto_225404 ) ( CLEAR ?auto_225397 ) ( not ( = ?auto_225396 ?auto_225404 ) ) ( not ( = ?auto_225397 ?auto_225404 ) ) ( not ( = ?auto_225403 ?auto_225404 ) ) ( TRUCK-AT ?auto_225399 ?auto_225400 ) )
    :subtasks
    ( ( !DRIVE ?auto_225399 ?auto_225400 ?auto_225402 )
      ( MAKE-2CRATE ?auto_225403 ?auto_225396 ?auto_225397 )
      ( MAKE-1CRATE-VERIFY ?auto_225396 ?auto_225397 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225405 - SURFACE
      ?auto_225406 - SURFACE
      ?auto_225407 - SURFACE
    )
    :vars
    (
      ?auto_225409 - HOIST
      ?auto_225412 - PLACE
      ?auto_225408 - PLACE
      ?auto_225411 - HOIST
      ?auto_225413 - SURFACE
      ?auto_225410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225409 ?auto_225412 ) ( SURFACE-AT ?auto_225406 ?auto_225412 ) ( CLEAR ?auto_225406 ) ( IS-CRATE ?auto_225407 ) ( not ( = ?auto_225406 ?auto_225407 ) ) ( AVAILABLE ?auto_225409 ) ( ON ?auto_225406 ?auto_225405 ) ( not ( = ?auto_225405 ?auto_225406 ) ) ( not ( = ?auto_225405 ?auto_225407 ) ) ( not ( = ?auto_225408 ?auto_225412 ) ) ( HOIST-AT ?auto_225411 ?auto_225408 ) ( not ( = ?auto_225409 ?auto_225411 ) ) ( AVAILABLE ?auto_225411 ) ( SURFACE-AT ?auto_225407 ?auto_225408 ) ( ON ?auto_225407 ?auto_225413 ) ( CLEAR ?auto_225407 ) ( not ( = ?auto_225406 ?auto_225413 ) ) ( not ( = ?auto_225407 ?auto_225413 ) ) ( not ( = ?auto_225405 ?auto_225413 ) ) ( TRUCK-AT ?auto_225410 ?auto_225412 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225406 ?auto_225407 )
      ( MAKE-2CRATE-VERIFY ?auto_225405 ?auto_225406 ?auto_225407 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225414 - SURFACE
      ?auto_225415 - SURFACE
    )
    :vars
    (
      ?auto_225419 - HOIST
      ?auto_225422 - PLACE
      ?auto_225418 - SURFACE
      ?auto_225420 - PLACE
      ?auto_225416 - HOIST
      ?auto_225421 - SURFACE
      ?auto_225417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225419 ?auto_225422 ) ( IS-CRATE ?auto_225415 ) ( not ( = ?auto_225414 ?auto_225415 ) ) ( not ( = ?auto_225418 ?auto_225414 ) ) ( not ( = ?auto_225418 ?auto_225415 ) ) ( not ( = ?auto_225420 ?auto_225422 ) ) ( HOIST-AT ?auto_225416 ?auto_225420 ) ( not ( = ?auto_225419 ?auto_225416 ) ) ( AVAILABLE ?auto_225416 ) ( SURFACE-AT ?auto_225415 ?auto_225420 ) ( ON ?auto_225415 ?auto_225421 ) ( CLEAR ?auto_225415 ) ( not ( = ?auto_225414 ?auto_225421 ) ) ( not ( = ?auto_225415 ?auto_225421 ) ) ( not ( = ?auto_225418 ?auto_225421 ) ) ( TRUCK-AT ?auto_225417 ?auto_225422 ) ( SURFACE-AT ?auto_225418 ?auto_225422 ) ( CLEAR ?auto_225418 ) ( LIFTING ?auto_225419 ?auto_225414 ) ( IS-CRATE ?auto_225414 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225418 ?auto_225414 )
      ( MAKE-2CRATE ?auto_225418 ?auto_225414 ?auto_225415 )
      ( MAKE-1CRATE-VERIFY ?auto_225414 ?auto_225415 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225423 - SURFACE
      ?auto_225424 - SURFACE
      ?auto_225425 - SURFACE
    )
    :vars
    (
      ?auto_225429 - HOIST
      ?auto_225431 - PLACE
      ?auto_225430 - PLACE
      ?auto_225427 - HOIST
      ?auto_225426 - SURFACE
      ?auto_225428 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225429 ?auto_225431 ) ( IS-CRATE ?auto_225425 ) ( not ( = ?auto_225424 ?auto_225425 ) ) ( not ( = ?auto_225423 ?auto_225424 ) ) ( not ( = ?auto_225423 ?auto_225425 ) ) ( not ( = ?auto_225430 ?auto_225431 ) ) ( HOIST-AT ?auto_225427 ?auto_225430 ) ( not ( = ?auto_225429 ?auto_225427 ) ) ( AVAILABLE ?auto_225427 ) ( SURFACE-AT ?auto_225425 ?auto_225430 ) ( ON ?auto_225425 ?auto_225426 ) ( CLEAR ?auto_225425 ) ( not ( = ?auto_225424 ?auto_225426 ) ) ( not ( = ?auto_225425 ?auto_225426 ) ) ( not ( = ?auto_225423 ?auto_225426 ) ) ( TRUCK-AT ?auto_225428 ?auto_225431 ) ( SURFACE-AT ?auto_225423 ?auto_225431 ) ( CLEAR ?auto_225423 ) ( LIFTING ?auto_225429 ?auto_225424 ) ( IS-CRATE ?auto_225424 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225424 ?auto_225425 )
      ( MAKE-2CRATE-VERIFY ?auto_225423 ?auto_225424 ?auto_225425 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225432 - SURFACE
      ?auto_225433 - SURFACE
    )
    :vars
    (
      ?auto_225439 - HOIST
      ?auto_225437 - PLACE
      ?auto_225435 - SURFACE
      ?auto_225440 - PLACE
      ?auto_225436 - HOIST
      ?auto_225434 - SURFACE
      ?auto_225438 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225439 ?auto_225437 ) ( IS-CRATE ?auto_225433 ) ( not ( = ?auto_225432 ?auto_225433 ) ) ( not ( = ?auto_225435 ?auto_225432 ) ) ( not ( = ?auto_225435 ?auto_225433 ) ) ( not ( = ?auto_225440 ?auto_225437 ) ) ( HOIST-AT ?auto_225436 ?auto_225440 ) ( not ( = ?auto_225439 ?auto_225436 ) ) ( AVAILABLE ?auto_225436 ) ( SURFACE-AT ?auto_225433 ?auto_225440 ) ( ON ?auto_225433 ?auto_225434 ) ( CLEAR ?auto_225433 ) ( not ( = ?auto_225432 ?auto_225434 ) ) ( not ( = ?auto_225433 ?auto_225434 ) ) ( not ( = ?auto_225435 ?auto_225434 ) ) ( TRUCK-AT ?auto_225438 ?auto_225437 ) ( SURFACE-AT ?auto_225435 ?auto_225437 ) ( CLEAR ?auto_225435 ) ( IS-CRATE ?auto_225432 ) ( AVAILABLE ?auto_225439 ) ( IN ?auto_225432 ?auto_225438 ) )
    :subtasks
    ( ( !UNLOAD ?auto_225439 ?auto_225432 ?auto_225438 ?auto_225437 )
      ( MAKE-2CRATE ?auto_225435 ?auto_225432 ?auto_225433 )
      ( MAKE-1CRATE-VERIFY ?auto_225432 ?auto_225433 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_225441 - SURFACE
      ?auto_225442 - SURFACE
      ?auto_225443 - SURFACE
    )
    :vars
    (
      ?auto_225444 - HOIST
      ?auto_225449 - PLACE
      ?auto_225446 - PLACE
      ?auto_225445 - HOIST
      ?auto_225448 - SURFACE
      ?auto_225447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225444 ?auto_225449 ) ( IS-CRATE ?auto_225443 ) ( not ( = ?auto_225442 ?auto_225443 ) ) ( not ( = ?auto_225441 ?auto_225442 ) ) ( not ( = ?auto_225441 ?auto_225443 ) ) ( not ( = ?auto_225446 ?auto_225449 ) ) ( HOIST-AT ?auto_225445 ?auto_225446 ) ( not ( = ?auto_225444 ?auto_225445 ) ) ( AVAILABLE ?auto_225445 ) ( SURFACE-AT ?auto_225443 ?auto_225446 ) ( ON ?auto_225443 ?auto_225448 ) ( CLEAR ?auto_225443 ) ( not ( = ?auto_225442 ?auto_225448 ) ) ( not ( = ?auto_225443 ?auto_225448 ) ) ( not ( = ?auto_225441 ?auto_225448 ) ) ( TRUCK-AT ?auto_225447 ?auto_225449 ) ( SURFACE-AT ?auto_225441 ?auto_225449 ) ( CLEAR ?auto_225441 ) ( IS-CRATE ?auto_225442 ) ( AVAILABLE ?auto_225444 ) ( IN ?auto_225442 ?auto_225447 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225442 ?auto_225443 )
      ( MAKE-2CRATE-VERIFY ?auto_225441 ?auto_225442 ?auto_225443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_225486 - SURFACE
      ?auto_225487 - SURFACE
    )
    :vars
    (
      ?auto_225492 - HOIST
      ?auto_225488 - PLACE
      ?auto_225490 - SURFACE
      ?auto_225489 - PLACE
      ?auto_225493 - HOIST
      ?auto_225494 - SURFACE
      ?auto_225491 - TRUCK
      ?auto_225495 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225492 ?auto_225488 ) ( SURFACE-AT ?auto_225486 ?auto_225488 ) ( CLEAR ?auto_225486 ) ( IS-CRATE ?auto_225487 ) ( not ( = ?auto_225486 ?auto_225487 ) ) ( AVAILABLE ?auto_225492 ) ( ON ?auto_225486 ?auto_225490 ) ( not ( = ?auto_225490 ?auto_225486 ) ) ( not ( = ?auto_225490 ?auto_225487 ) ) ( not ( = ?auto_225489 ?auto_225488 ) ) ( HOIST-AT ?auto_225493 ?auto_225489 ) ( not ( = ?auto_225492 ?auto_225493 ) ) ( AVAILABLE ?auto_225493 ) ( SURFACE-AT ?auto_225487 ?auto_225489 ) ( ON ?auto_225487 ?auto_225494 ) ( CLEAR ?auto_225487 ) ( not ( = ?auto_225486 ?auto_225494 ) ) ( not ( = ?auto_225487 ?auto_225494 ) ) ( not ( = ?auto_225490 ?auto_225494 ) ) ( TRUCK-AT ?auto_225491 ?auto_225495 ) ( not ( = ?auto_225495 ?auto_225488 ) ) ( not ( = ?auto_225489 ?auto_225495 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_225491 ?auto_225495 ?auto_225488 )
      ( MAKE-1CRATE ?auto_225486 ?auto_225487 )
      ( MAKE-1CRATE-VERIFY ?auto_225486 ?auto_225487 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225525 - SURFACE
      ?auto_225526 - SURFACE
      ?auto_225527 - SURFACE
      ?auto_225528 - SURFACE
    )
    :vars
    (
      ?auto_225529 - HOIST
      ?auto_225530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225529 ?auto_225530 ) ( SURFACE-AT ?auto_225527 ?auto_225530 ) ( CLEAR ?auto_225527 ) ( LIFTING ?auto_225529 ?auto_225528 ) ( IS-CRATE ?auto_225528 ) ( not ( = ?auto_225527 ?auto_225528 ) ) ( ON ?auto_225526 ?auto_225525 ) ( ON ?auto_225527 ?auto_225526 ) ( not ( = ?auto_225525 ?auto_225526 ) ) ( not ( = ?auto_225525 ?auto_225527 ) ) ( not ( = ?auto_225525 ?auto_225528 ) ) ( not ( = ?auto_225526 ?auto_225527 ) ) ( not ( = ?auto_225526 ?auto_225528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225527 ?auto_225528 )
      ( MAKE-3CRATE-VERIFY ?auto_225525 ?auto_225526 ?auto_225527 ?auto_225528 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225542 - SURFACE
      ?auto_225543 - SURFACE
      ?auto_225544 - SURFACE
      ?auto_225545 - SURFACE
    )
    :vars
    (
      ?auto_225546 - HOIST
      ?auto_225547 - PLACE
      ?auto_225548 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225546 ?auto_225547 ) ( SURFACE-AT ?auto_225544 ?auto_225547 ) ( CLEAR ?auto_225544 ) ( IS-CRATE ?auto_225545 ) ( not ( = ?auto_225544 ?auto_225545 ) ) ( TRUCK-AT ?auto_225548 ?auto_225547 ) ( AVAILABLE ?auto_225546 ) ( IN ?auto_225545 ?auto_225548 ) ( ON ?auto_225544 ?auto_225543 ) ( not ( = ?auto_225543 ?auto_225544 ) ) ( not ( = ?auto_225543 ?auto_225545 ) ) ( ON ?auto_225543 ?auto_225542 ) ( not ( = ?auto_225542 ?auto_225543 ) ) ( not ( = ?auto_225542 ?auto_225544 ) ) ( not ( = ?auto_225542 ?auto_225545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225543 ?auto_225544 ?auto_225545 )
      ( MAKE-3CRATE-VERIFY ?auto_225542 ?auto_225543 ?auto_225544 ?auto_225545 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225563 - SURFACE
      ?auto_225564 - SURFACE
      ?auto_225565 - SURFACE
      ?auto_225566 - SURFACE
    )
    :vars
    (
      ?auto_225568 - HOIST
      ?auto_225570 - PLACE
      ?auto_225567 - TRUCK
      ?auto_225569 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225568 ?auto_225570 ) ( SURFACE-AT ?auto_225565 ?auto_225570 ) ( CLEAR ?auto_225565 ) ( IS-CRATE ?auto_225566 ) ( not ( = ?auto_225565 ?auto_225566 ) ) ( AVAILABLE ?auto_225568 ) ( IN ?auto_225566 ?auto_225567 ) ( ON ?auto_225565 ?auto_225564 ) ( not ( = ?auto_225564 ?auto_225565 ) ) ( not ( = ?auto_225564 ?auto_225566 ) ) ( TRUCK-AT ?auto_225567 ?auto_225569 ) ( not ( = ?auto_225569 ?auto_225570 ) ) ( ON ?auto_225564 ?auto_225563 ) ( not ( = ?auto_225563 ?auto_225564 ) ) ( not ( = ?auto_225563 ?auto_225565 ) ) ( not ( = ?auto_225563 ?auto_225566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225564 ?auto_225565 ?auto_225566 )
      ( MAKE-3CRATE-VERIFY ?auto_225563 ?auto_225564 ?auto_225565 ?auto_225566 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225587 - SURFACE
      ?auto_225588 - SURFACE
      ?auto_225589 - SURFACE
      ?auto_225590 - SURFACE
    )
    :vars
    (
      ?auto_225592 - HOIST
      ?auto_225591 - PLACE
      ?auto_225595 - TRUCK
      ?auto_225594 - PLACE
      ?auto_225593 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_225592 ?auto_225591 ) ( SURFACE-AT ?auto_225589 ?auto_225591 ) ( CLEAR ?auto_225589 ) ( IS-CRATE ?auto_225590 ) ( not ( = ?auto_225589 ?auto_225590 ) ) ( AVAILABLE ?auto_225592 ) ( ON ?auto_225589 ?auto_225588 ) ( not ( = ?auto_225588 ?auto_225589 ) ) ( not ( = ?auto_225588 ?auto_225590 ) ) ( TRUCK-AT ?auto_225595 ?auto_225594 ) ( not ( = ?auto_225594 ?auto_225591 ) ) ( HOIST-AT ?auto_225593 ?auto_225594 ) ( LIFTING ?auto_225593 ?auto_225590 ) ( not ( = ?auto_225592 ?auto_225593 ) ) ( ON ?auto_225588 ?auto_225587 ) ( not ( = ?auto_225587 ?auto_225588 ) ) ( not ( = ?auto_225587 ?auto_225589 ) ) ( not ( = ?auto_225587 ?auto_225590 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225588 ?auto_225589 ?auto_225590 )
      ( MAKE-3CRATE-VERIFY ?auto_225587 ?auto_225588 ?auto_225589 ?auto_225590 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225614 - SURFACE
      ?auto_225615 - SURFACE
      ?auto_225616 - SURFACE
      ?auto_225617 - SURFACE
    )
    :vars
    (
      ?auto_225623 - HOIST
      ?auto_225620 - PLACE
      ?auto_225622 - TRUCK
      ?auto_225618 - PLACE
      ?auto_225619 - HOIST
      ?auto_225621 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225623 ?auto_225620 ) ( SURFACE-AT ?auto_225616 ?auto_225620 ) ( CLEAR ?auto_225616 ) ( IS-CRATE ?auto_225617 ) ( not ( = ?auto_225616 ?auto_225617 ) ) ( AVAILABLE ?auto_225623 ) ( ON ?auto_225616 ?auto_225615 ) ( not ( = ?auto_225615 ?auto_225616 ) ) ( not ( = ?auto_225615 ?auto_225617 ) ) ( TRUCK-AT ?auto_225622 ?auto_225618 ) ( not ( = ?auto_225618 ?auto_225620 ) ) ( HOIST-AT ?auto_225619 ?auto_225618 ) ( not ( = ?auto_225623 ?auto_225619 ) ) ( AVAILABLE ?auto_225619 ) ( SURFACE-AT ?auto_225617 ?auto_225618 ) ( ON ?auto_225617 ?auto_225621 ) ( CLEAR ?auto_225617 ) ( not ( = ?auto_225616 ?auto_225621 ) ) ( not ( = ?auto_225617 ?auto_225621 ) ) ( not ( = ?auto_225615 ?auto_225621 ) ) ( ON ?auto_225615 ?auto_225614 ) ( not ( = ?auto_225614 ?auto_225615 ) ) ( not ( = ?auto_225614 ?auto_225616 ) ) ( not ( = ?auto_225614 ?auto_225617 ) ) ( not ( = ?auto_225614 ?auto_225621 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225615 ?auto_225616 ?auto_225617 )
      ( MAKE-3CRATE-VERIFY ?auto_225614 ?auto_225615 ?auto_225616 ?auto_225617 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225642 - SURFACE
      ?auto_225643 - SURFACE
      ?auto_225644 - SURFACE
      ?auto_225645 - SURFACE
    )
    :vars
    (
      ?auto_225647 - HOIST
      ?auto_225650 - PLACE
      ?auto_225648 - PLACE
      ?auto_225651 - HOIST
      ?auto_225646 - SURFACE
      ?auto_225649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225647 ?auto_225650 ) ( SURFACE-AT ?auto_225644 ?auto_225650 ) ( CLEAR ?auto_225644 ) ( IS-CRATE ?auto_225645 ) ( not ( = ?auto_225644 ?auto_225645 ) ) ( AVAILABLE ?auto_225647 ) ( ON ?auto_225644 ?auto_225643 ) ( not ( = ?auto_225643 ?auto_225644 ) ) ( not ( = ?auto_225643 ?auto_225645 ) ) ( not ( = ?auto_225648 ?auto_225650 ) ) ( HOIST-AT ?auto_225651 ?auto_225648 ) ( not ( = ?auto_225647 ?auto_225651 ) ) ( AVAILABLE ?auto_225651 ) ( SURFACE-AT ?auto_225645 ?auto_225648 ) ( ON ?auto_225645 ?auto_225646 ) ( CLEAR ?auto_225645 ) ( not ( = ?auto_225644 ?auto_225646 ) ) ( not ( = ?auto_225645 ?auto_225646 ) ) ( not ( = ?auto_225643 ?auto_225646 ) ) ( TRUCK-AT ?auto_225649 ?auto_225650 ) ( ON ?auto_225643 ?auto_225642 ) ( not ( = ?auto_225642 ?auto_225643 ) ) ( not ( = ?auto_225642 ?auto_225644 ) ) ( not ( = ?auto_225642 ?auto_225645 ) ) ( not ( = ?auto_225642 ?auto_225646 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225643 ?auto_225644 ?auto_225645 )
      ( MAKE-3CRATE-VERIFY ?auto_225642 ?auto_225643 ?auto_225644 ?auto_225645 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225670 - SURFACE
      ?auto_225671 - SURFACE
      ?auto_225672 - SURFACE
      ?auto_225673 - SURFACE
    )
    :vars
    (
      ?auto_225679 - HOIST
      ?auto_225677 - PLACE
      ?auto_225674 - PLACE
      ?auto_225678 - HOIST
      ?auto_225676 - SURFACE
      ?auto_225675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225679 ?auto_225677 ) ( IS-CRATE ?auto_225673 ) ( not ( = ?auto_225672 ?auto_225673 ) ) ( not ( = ?auto_225671 ?auto_225672 ) ) ( not ( = ?auto_225671 ?auto_225673 ) ) ( not ( = ?auto_225674 ?auto_225677 ) ) ( HOIST-AT ?auto_225678 ?auto_225674 ) ( not ( = ?auto_225679 ?auto_225678 ) ) ( AVAILABLE ?auto_225678 ) ( SURFACE-AT ?auto_225673 ?auto_225674 ) ( ON ?auto_225673 ?auto_225676 ) ( CLEAR ?auto_225673 ) ( not ( = ?auto_225672 ?auto_225676 ) ) ( not ( = ?auto_225673 ?auto_225676 ) ) ( not ( = ?auto_225671 ?auto_225676 ) ) ( TRUCK-AT ?auto_225675 ?auto_225677 ) ( SURFACE-AT ?auto_225671 ?auto_225677 ) ( CLEAR ?auto_225671 ) ( LIFTING ?auto_225679 ?auto_225672 ) ( IS-CRATE ?auto_225672 ) ( ON ?auto_225671 ?auto_225670 ) ( not ( = ?auto_225670 ?auto_225671 ) ) ( not ( = ?auto_225670 ?auto_225672 ) ) ( not ( = ?auto_225670 ?auto_225673 ) ) ( not ( = ?auto_225670 ?auto_225676 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225671 ?auto_225672 ?auto_225673 )
      ( MAKE-3CRATE-VERIFY ?auto_225670 ?auto_225671 ?auto_225672 ?auto_225673 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_225698 - SURFACE
      ?auto_225699 - SURFACE
      ?auto_225700 - SURFACE
      ?auto_225701 - SURFACE
    )
    :vars
    (
      ?auto_225707 - HOIST
      ?auto_225703 - PLACE
      ?auto_225702 - PLACE
      ?auto_225706 - HOIST
      ?auto_225705 - SURFACE
      ?auto_225704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_225707 ?auto_225703 ) ( IS-CRATE ?auto_225701 ) ( not ( = ?auto_225700 ?auto_225701 ) ) ( not ( = ?auto_225699 ?auto_225700 ) ) ( not ( = ?auto_225699 ?auto_225701 ) ) ( not ( = ?auto_225702 ?auto_225703 ) ) ( HOIST-AT ?auto_225706 ?auto_225702 ) ( not ( = ?auto_225707 ?auto_225706 ) ) ( AVAILABLE ?auto_225706 ) ( SURFACE-AT ?auto_225701 ?auto_225702 ) ( ON ?auto_225701 ?auto_225705 ) ( CLEAR ?auto_225701 ) ( not ( = ?auto_225700 ?auto_225705 ) ) ( not ( = ?auto_225701 ?auto_225705 ) ) ( not ( = ?auto_225699 ?auto_225705 ) ) ( TRUCK-AT ?auto_225704 ?auto_225703 ) ( SURFACE-AT ?auto_225699 ?auto_225703 ) ( CLEAR ?auto_225699 ) ( IS-CRATE ?auto_225700 ) ( AVAILABLE ?auto_225707 ) ( IN ?auto_225700 ?auto_225704 ) ( ON ?auto_225699 ?auto_225698 ) ( not ( = ?auto_225698 ?auto_225699 ) ) ( not ( = ?auto_225698 ?auto_225700 ) ) ( not ( = ?auto_225698 ?auto_225701 ) ) ( not ( = ?auto_225698 ?auto_225705 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_225699 ?auto_225700 ?auto_225701 )
      ( MAKE-3CRATE-VERIFY ?auto_225698 ?auto_225699 ?auto_225700 ?auto_225701 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_225989 - SURFACE
      ?auto_225990 - SURFACE
      ?auto_225991 - SURFACE
      ?auto_225992 - SURFACE
      ?auto_225993 - SURFACE
    )
    :vars
    (
      ?auto_225995 - HOIST
      ?auto_225994 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_225995 ?auto_225994 ) ( SURFACE-AT ?auto_225992 ?auto_225994 ) ( CLEAR ?auto_225992 ) ( LIFTING ?auto_225995 ?auto_225993 ) ( IS-CRATE ?auto_225993 ) ( not ( = ?auto_225992 ?auto_225993 ) ) ( ON ?auto_225990 ?auto_225989 ) ( ON ?auto_225991 ?auto_225990 ) ( ON ?auto_225992 ?auto_225991 ) ( not ( = ?auto_225989 ?auto_225990 ) ) ( not ( = ?auto_225989 ?auto_225991 ) ) ( not ( = ?auto_225989 ?auto_225992 ) ) ( not ( = ?auto_225989 ?auto_225993 ) ) ( not ( = ?auto_225990 ?auto_225991 ) ) ( not ( = ?auto_225990 ?auto_225992 ) ) ( not ( = ?auto_225990 ?auto_225993 ) ) ( not ( = ?auto_225991 ?auto_225992 ) ) ( not ( = ?auto_225991 ?auto_225993 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_225992 ?auto_225993 )
      ( MAKE-4CRATE-VERIFY ?auto_225989 ?auto_225990 ?auto_225991 ?auto_225992 ?auto_225993 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226014 - SURFACE
      ?auto_226015 - SURFACE
      ?auto_226016 - SURFACE
      ?auto_226017 - SURFACE
      ?auto_226018 - SURFACE
    )
    :vars
    (
      ?auto_226020 - HOIST
      ?auto_226019 - PLACE
      ?auto_226021 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226020 ?auto_226019 ) ( SURFACE-AT ?auto_226017 ?auto_226019 ) ( CLEAR ?auto_226017 ) ( IS-CRATE ?auto_226018 ) ( not ( = ?auto_226017 ?auto_226018 ) ) ( TRUCK-AT ?auto_226021 ?auto_226019 ) ( AVAILABLE ?auto_226020 ) ( IN ?auto_226018 ?auto_226021 ) ( ON ?auto_226017 ?auto_226016 ) ( not ( = ?auto_226016 ?auto_226017 ) ) ( not ( = ?auto_226016 ?auto_226018 ) ) ( ON ?auto_226015 ?auto_226014 ) ( ON ?auto_226016 ?auto_226015 ) ( not ( = ?auto_226014 ?auto_226015 ) ) ( not ( = ?auto_226014 ?auto_226016 ) ) ( not ( = ?auto_226014 ?auto_226017 ) ) ( not ( = ?auto_226014 ?auto_226018 ) ) ( not ( = ?auto_226015 ?auto_226016 ) ) ( not ( = ?auto_226015 ?auto_226017 ) ) ( not ( = ?auto_226015 ?auto_226018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226016 ?auto_226017 ?auto_226018 )
      ( MAKE-4CRATE-VERIFY ?auto_226014 ?auto_226015 ?auto_226016 ?auto_226017 ?auto_226018 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226044 - SURFACE
      ?auto_226045 - SURFACE
      ?auto_226046 - SURFACE
      ?auto_226047 - SURFACE
      ?auto_226048 - SURFACE
    )
    :vars
    (
      ?auto_226049 - HOIST
      ?auto_226051 - PLACE
      ?auto_226052 - TRUCK
      ?auto_226050 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226049 ?auto_226051 ) ( SURFACE-AT ?auto_226047 ?auto_226051 ) ( CLEAR ?auto_226047 ) ( IS-CRATE ?auto_226048 ) ( not ( = ?auto_226047 ?auto_226048 ) ) ( AVAILABLE ?auto_226049 ) ( IN ?auto_226048 ?auto_226052 ) ( ON ?auto_226047 ?auto_226046 ) ( not ( = ?auto_226046 ?auto_226047 ) ) ( not ( = ?auto_226046 ?auto_226048 ) ) ( TRUCK-AT ?auto_226052 ?auto_226050 ) ( not ( = ?auto_226050 ?auto_226051 ) ) ( ON ?auto_226045 ?auto_226044 ) ( ON ?auto_226046 ?auto_226045 ) ( not ( = ?auto_226044 ?auto_226045 ) ) ( not ( = ?auto_226044 ?auto_226046 ) ) ( not ( = ?auto_226044 ?auto_226047 ) ) ( not ( = ?auto_226044 ?auto_226048 ) ) ( not ( = ?auto_226045 ?auto_226046 ) ) ( not ( = ?auto_226045 ?auto_226047 ) ) ( not ( = ?auto_226045 ?auto_226048 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226046 ?auto_226047 ?auto_226048 )
      ( MAKE-4CRATE-VERIFY ?auto_226044 ?auto_226045 ?auto_226046 ?auto_226047 ?auto_226048 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226078 - SURFACE
      ?auto_226079 - SURFACE
      ?auto_226080 - SURFACE
      ?auto_226081 - SURFACE
      ?auto_226082 - SURFACE
    )
    :vars
    (
      ?auto_226084 - HOIST
      ?auto_226085 - PLACE
      ?auto_226083 - TRUCK
      ?auto_226087 - PLACE
      ?auto_226086 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_226084 ?auto_226085 ) ( SURFACE-AT ?auto_226081 ?auto_226085 ) ( CLEAR ?auto_226081 ) ( IS-CRATE ?auto_226082 ) ( not ( = ?auto_226081 ?auto_226082 ) ) ( AVAILABLE ?auto_226084 ) ( ON ?auto_226081 ?auto_226080 ) ( not ( = ?auto_226080 ?auto_226081 ) ) ( not ( = ?auto_226080 ?auto_226082 ) ) ( TRUCK-AT ?auto_226083 ?auto_226087 ) ( not ( = ?auto_226087 ?auto_226085 ) ) ( HOIST-AT ?auto_226086 ?auto_226087 ) ( LIFTING ?auto_226086 ?auto_226082 ) ( not ( = ?auto_226084 ?auto_226086 ) ) ( ON ?auto_226079 ?auto_226078 ) ( ON ?auto_226080 ?auto_226079 ) ( not ( = ?auto_226078 ?auto_226079 ) ) ( not ( = ?auto_226078 ?auto_226080 ) ) ( not ( = ?auto_226078 ?auto_226081 ) ) ( not ( = ?auto_226078 ?auto_226082 ) ) ( not ( = ?auto_226079 ?auto_226080 ) ) ( not ( = ?auto_226079 ?auto_226081 ) ) ( not ( = ?auto_226079 ?auto_226082 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226080 ?auto_226081 ?auto_226082 )
      ( MAKE-4CRATE-VERIFY ?auto_226078 ?auto_226079 ?auto_226080 ?auto_226081 ?auto_226082 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226116 - SURFACE
      ?auto_226117 - SURFACE
      ?auto_226118 - SURFACE
      ?auto_226119 - SURFACE
      ?auto_226120 - SURFACE
    )
    :vars
    (
      ?auto_226121 - HOIST
      ?auto_226124 - PLACE
      ?auto_226122 - TRUCK
      ?auto_226123 - PLACE
      ?auto_226125 - HOIST
      ?auto_226126 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226121 ?auto_226124 ) ( SURFACE-AT ?auto_226119 ?auto_226124 ) ( CLEAR ?auto_226119 ) ( IS-CRATE ?auto_226120 ) ( not ( = ?auto_226119 ?auto_226120 ) ) ( AVAILABLE ?auto_226121 ) ( ON ?auto_226119 ?auto_226118 ) ( not ( = ?auto_226118 ?auto_226119 ) ) ( not ( = ?auto_226118 ?auto_226120 ) ) ( TRUCK-AT ?auto_226122 ?auto_226123 ) ( not ( = ?auto_226123 ?auto_226124 ) ) ( HOIST-AT ?auto_226125 ?auto_226123 ) ( not ( = ?auto_226121 ?auto_226125 ) ) ( AVAILABLE ?auto_226125 ) ( SURFACE-AT ?auto_226120 ?auto_226123 ) ( ON ?auto_226120 ?auto_226126 ) ( CLEAR ?auto_226120 ) ( not ( = ?auto_226119 ?auto_226126 ) ) ( not ( = ?auto_226120 ?auto_226126 ) ) ( not ( = ?auto_226118 ?auto_226126 ) ) ( ON ?auto_226117 ?auto_226116 ) ( ON ?auto_226118 ?auto_226117 ) ( not ( = ?auto_226116 ?auto_226117 ) ) ( not ( = ?auto_226116 ?auto_226118 ) ) ( not ( = ?auto_226116 ?auto_226119 ) ) ( not ( = ?auto_226116 ?auto_226120 ) ) ( not ( = ?auto_226116 ?auto_226126 ) ) ( not ( = ?auto_226117 ?auto_226118 ) ) ( not ( = ?auto_226117 ?auto_226119 ) ) ( not ( = ?auto_226117 ?auto_226120 ) ) ( not ( = ?auto_226117 ?auto_226126 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226118 ?auto_226119 ?auto_226120 )
      ( MAKE-4CRATE-VERIFY ?auto_226116 ?auto_226117 ?auto_226118 ?auto_226119 ?auto_226120 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226155 - SURFACE
      ?auto_226156 - SURFACE
      ?auto_226157 - SURFACE
      ?auto_226158 - SURFACE
      ?auto_226159 - SURFACE
    )
    :vars
    (
      ?auto_226163 - HOIST
      ?auto_226162 - PLACE
      ?auto_226165 - PLACE
      ?auto_226164 - HOIST
      ?auto_226160 - SURFACE
      ?auto_226161 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226163 ?auto_226162 ) ( SURFACE-AT ?auto_226158 ?auto_226162 ) ( CLEAR ?auto_226158 ) ( IS-CRATE ?auto_226159 ) ( not ( = ?auto_226158 ?auto_226159 ) ) ( AVAILABLE ?auto_226163 ) ( ON ?auto_226158 ?auto_226157 ) ( not ( = ?auto_226157 ?auto_226158 ) ) ( not ( = ?auto_226157 ?auto_226159 ) ) ( not ( = ?auto_226165 ?auto_226162 ) ) ( HOIST-AT ?auto_226164 ?auto_226165 ) ( not ( = ?auto_226163 ?auto_226164 ) ) ( AVAILABLE ?auto_226164 ) ( SURFACE-AT ?auto_226159 ?auto_226165 ) ( ON ?auto_226159 ?auto_226160 ) ( CLEAR ?auto_226159 ) ( not ( = ?auto_226158 ?auto_226160 ) ) ( not ( = ?auto_226159 ?auto_226160 ) ) ( not ( = ?auto_226157 ?auto_226160 ) ) ( TRUCK-AT ?auto_226161 ?auto_226162 ) ( ON ?auto_226156 ?auto_226155 ) ( ON ?auto_226157 ?auto_226156 ) ( not ( = ?auto_226155 ?auto_226156 ) ) ( not ( = ?auto_226155 ?auto_226157 ) ) ( not ( = ?auto_226155 ?auto_226158 ) ) ( not ( = ?auto_226155 ?auto_226159 ) ) ( not ( = ?auto_226155 ?auto_226160 ) ) ( not ( = ?auto_226156 ?auto_226157 ) ) ( not ( = ?auto_226156 ?auto_226158 ) ) ( not ( = ?auto_226156 ?auto_226159 ) ) ( not ( = ?auto_226156 ?auto_226160 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226157 ?auto_226158 ?auto_226159 )
      ( MAKE-4CRATE-VERIFY ?auto_226155 ?auto_226156 ?auto_226157 ?auto_226158 ?auto_226159 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226194 - SURFACE
      ?auto_226195 - SURFACE
      ?auto_226196 - SURFACE
      ?auto_226197 - SURFACE
      ?auto_226198 - SURFACE
    )
    :vars
    (
      ?auto_226204 - HOIST
      ?auto_226200 - PLACE
      ?auto_226203 - PLACE
      ?auto_226201 - HOIST
      ?auto_226202 - SURFACE
      ?auto_226199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226204 ?auto_226200 ) ( IS-CRATE ?auto_226198 ) ( not ( = ?auto_226197 ?auto_226198 ) ) ( not ( = ?auto_226196 ?auto_226197 ) ) ( not ( = ?auto_226196 ?auto_226198 ) ) ( not ( = ?auto_226203 ?auto_226200 ) ) ( HOIST-AT ?auto_226201 ?auto_226203 ) ( not ( = ?auto_226204 ?auto_226201 ) ) ( AVAILABLE ?auto_226201 ) ( SURFACE-AT ?auto_226198 ?auto_226203 ) ( ON ?auto_226198 ?auto_226202 ) ( CLEAR ?auto_226198 ) ( not ( = ?auto_226197 ?auto_226202 ) ) ( not ( = ?auto_226198 ?auto_226202 ) ) ( not ( = ?auto_226196 ?auto_226202 ) ) ( TRUCK-AT ?auto_226199 ?auto_226200 ) ( SURFACE-AT ?auto_226196 ?auto_226200 ) ( CLEAR ?auto_226196 ) ( LIFTING ?auto_226204 ?auto_226197 ) ( IS-CRATE ?auto_226197 ) ( ON ?auto_226195 ?auto_226194 ) ( ON ?auto_226196 ?auto_226195 ) ( not ( = ?auto_226194 ?auto_226195 ) ) ( not ( = ?auto_226194 ?auto_226196 ) ) ( not ( = ?auto_226194 ?auto_226197 ) ) ( not ( = ?auto_226194 ?auto_226198 ) ) ( not ( = ?auto_226194 ?auto_226202 ) ) ( not ( = ?auto_226195 ?auto_226196 ) ) ( not ( = ?auto_226195 ?auto_226197 ) ) ( not ( = ?auto_226195 ?auto_226198 ) ) ( not ( = ?auto_226195 ?auto_226202 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226196 ?auto_226197 ?auto_226198 )
      ( MAKE-4CRATE-VERIFY ?auto_226194 ?auto_226195 ?auto_226196 ?auto_226197 ?auto_226198 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226233 - SURFACE
      ?auto_226234 - SURFACE
      ?auto_226235 - SURFACE
      ?auto_226236 - SURFACE
      ?auto_226237 - SURFACE
    )
    :vars
    (
      ?auto_226239 - HOIST
      ?auto_226243 - PLACE
      ?auto_226240 - PLACE
      ?auto_226238 - HOIST
      ?auto_226242 - SURFACE
      ?auto_226241 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226239 ?auto_226243 ) ( IS-CRATE ?auto_226237 ) ( not ( = ?auto_226236 ?auto_226237 ) ) ( not ( = ?auto_226235 ?auto_226236 ) ) ( not ( = ?auto_226235 ?auto_226237 ) ) ( not ( = ?auto_226240 ?auto_226243 ) ) ( HOIST-AT ?auto_226238 ?auto_226240 ) ( not ( = ?auto_226239 ?auto_226238 ) ) ( AVAILABLE ?auto_226238 ) ( SURFACE-AT ?auto_226237 ?auto_226240 ) ( ON ?auto_226237 ?auto_226242 ) ( CLEAR ?auto_226237 ) ( not ( = ?auto_226236 ?auto_226242 ) ) ( not ( = ?auto_226237 ?auto_226242 ) ) ( not ( = ?auto_226235 ?auto_226242 ) ) ( TRUCK-AT ?auto_226241 ?auto_226243 ) ( SURFACE-AT ?auto_226235 ?auto_226243 ) ( CLEAR ?auto_226235 ) ( IS-CRATE ?auto_226236 ) ( AVAILABLE ?auto_226239 ) ( IN ?auto_226236 ?auto_226241 ) ( ON ?auto_226234 ?auto_226233 ) ( ON ?auto_226235 ?auto_226234 ) ( not ( = ?auto_226233 ?auto_226234 ) ) ( not ( = ?auto_226233 ?auto_226235 ) ) ( not ( = ?auto_226233 ?auto_226236 ) ) ( not ( = ?auto_226233 ?auto_226237 ) ) ( not ( = ?auto_226233 ?auto_226242 ) ) ( not ( = ?auto_226234 ?auto_226235 ) ) ( not ( = ?auto_226234 ?auto_226236 ) ) ( not ( = ?auto_226234 ?auto_226237 ) ) ( not ( = ?auto_226234 ?auto_226242 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226235 ?auto_226236 ?auto_226237 )
      ( MAKE-4CRATE-VERIFY ?auto_226233 ?auto_226234 ?auto_226235 ?auto_226236 ?auto_226237 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226244 - SURFACE
      ?auto_226245 - SURFACE
    )
    :vars
    (
      ?auto_226248 - HOIST
      ?auto_226252 - PLACE
      ?auto_226247 - SURFACE
      ?auto_226249 - PLACE
      ?auto_226246 - HOIST
      ?auto_226251 - SURFACE
      ?auto_226250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226248 ?auto_226252 ) ( IS-CRATE ?auto_226245 ) ( not ( = ?auto_226244 ?auto_226245 ) ) ( not ( = ?auto_226247 ?auto_226244 ) ) ( not ( = ?auto_226247 ?auto_226245 ) ) ( not ( = ?auto_226249 ?auto_226252 ) ) ( HOIST-AT ?auto_226246 ?auto_226249 ) ( not ( = ?auto_226248 ?auto_226246 ) ) ( AVAILABLE ?auto_226246 ) ( SURFACE-AT ?auto_226245 ?auto_226249 ) ( ON ?auto_226245 ?auto_226251 ) ( CLEAR ?auto_226245 ) ( not ( = ?auto_226244 ?auto_226251 ) ) ( not ( = ?auto_226245 ?auto_226251 ) ) ( not ( = ?auto_226247 ?auto_226251 ) ) ( SURFACE-AT ?auto_226247 ?auto_226252 ) ( CLEAR ?auto_226247 ) ( IS-CRATE ?auto_226244 ) ( AVAILABLE ?auto_226248 ) ( IN ?auto_226244 ?auto_226250 ) ( TRUCK-AT ?auto_226250 ?auto_226249 ) )
    :subtasks
    ( ( !DRIVE ?auto_226250 ?auto_226249 ?auto_226252 )
      ( MAKE-2CRATE ?auto_226247 ?auto_226244 ?auto_226245 )
      ( MAKE-1CRATE-VERIFY ?auto_226244 ?auto_226245 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_226253 - SURFACE
      ?auto_226254 - SURFACE
      ?auto_226255 - SURFACE
    )
    :vars
    (
      ?auto_226258 - HOIST
      ?auto_226260 - PLACE
      ?auto_226259 - PLACE
      ?auto_226257 - HOIST
      ?auto_226261 - SURFACE
      ?auto_226256 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226258 ?auto_226260 ) ( IS-CRATE ?auto_226255 ) ( not ( = ?auto_226254 ?auto_226255 ) ) ( not ( = ?auto_226253 ?auto_226254 ) ) ( not ( = ?auto_226253 ?auto_226255 ) ) ( not ( = ?auto_226259 ?auto_226260 ) ) ( HOIST-AT ?auto_226257 ?auto_226259 ) ( not ( = ?auto_226258 ?auto_226257 ) ) ( AVAILABLE ?auto_226257 ) ( SURFACE-AT ?auto_226255 ?auto_226259 ) ( ON ?auto_226255 ?auto_226261 ) ( CLEAR ?auto_226255 ) ( not ( = ?auto_226254 ?auto_226261 ) ) ( not ( = ?auto_226255 ?auto_226261 ) ) ( not ( = ?auto_226253 ?auto_226261 ) ) ( SURFACE-AT ?auto_226253 ?auto_226260 ) ( CLEAR ?auto_226253 ) ( IS-CRATE ?auto_226254 ) ( AVAILABLE ?auto_226258 ) ( IN ?auto_226254 ?auto_226256 ) ( TRUCK-AT ?auto_226256 ?auto_226259 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226254 ?auto_226255 )
      ( MAKE-2CRATE-VERIFY ?auto_226253 ?auto_226254 ?auto_226255 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_226262 - SURFACE
      ?auto_226263 - SURFACE
      ?auto_226264 - SURFACE
      ?auto_226265 - SURFACE
    )
    :vars
    (
      ?auto_226271 - HOIST
      ?auto_226269 - PLACE
      ?auto_226270 - PLACE
      ?auto_226266 - HOIST
      ?auto_226268 - SURFACE
      ?auto_226267 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226271 ?auto_226269 ) ( IS-CRATE ?auto_226265 ) ( not ( = ?auto_226264 ?auto_226265 ) ) ( not ( = ?auto_226263 ?auto_226264 ) ) ( not ( = ?auto_226263 ?auto_226265 ) ) ( not ( = ?auto_226270 ?auto_226269 ) ) ( HOIST-AT ?auto_226266 ?auto_226270 ) ( not ( = ?auto_226271 ?auto_226266 ) ) ( AVAILABLE ?auto_226266 ) ( SURFACE-AT ?auto_226265 ?auto_226270 ) ( ON ?auto_226265 ?auto_226268 ) ( CLEAR ?auto_226265 ) ( not ( = ?auto_226264 ?auto_226268 ) ) ( not ( = ?auto_226265 ?auto_226268 ) ) ( not ( = ?auto_226263 ?auto_226268 ) ) ( SURFACE-AT ?auto_226263 ?auto_226269 ) ( CLEAR ?auto_226263 ) ( IS-CRATE ?auto_226264 ) ( AVAILABLE ?auto_226271 ) ( IN ?auto_226264 ?auto_226267 ) ( TRUCK-AT ?auto_226267 ?auto_226270 ) ( ON ?auto_226263 ?auto_226262 ) ( not ( = ?auto_226262 ?auto_226263 ) ) ( not ( = ?auto_226262 ?auto_226264 ) ) ( not ( = ?auto_226262 ?auto_226265 ) ) ( not ( = ?auto_226262 ?auto_226268 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226263 ?auto_226264 ?auto_226265 )
      ( MAKE-3CRATE-VERIFY ?auto_226262 ?auto_226263 ?auto_226264 ?auto_226265 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226272 - SURFACE
      ?auto_226273 - SURFACE
      ?auto_226274 - SURFACE
      ?auto_226275 - SURFACE
      ?auto_226276 - SURFACE
    )
    :vars
    (
      ?auto_226282 - HOIST
      ?auto_226280 - PLACE
      ?auto_226281 - PLACE
      ?auto_226277 - HOIST
      ?auto_226279 - SURFACE
      ?auto_226278 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226282 ?auto_226280 ) ( IS-CRATE ?auto_226276 ) ( not ( = ?auto_226275 ?auto_226276 ) ) ( not ( = ?auto_226274 ?auto_226275 ) ) ( not ( = ?auto_226274 ?auto_226276 ) ) ( not ( = ?auto_226281 ?auto_226280 ) ) ( HOIST-AT ?auto_226277 ?auto_226281 ) ( not ( = ?auto_226282 ?auto_226277 ) ) ( AVAILABLE ?auto_226277 ) ( SURFACE-AT ?auto_226276 ?auto_226281 ) ( ON ?auto_226276 ?auto_226279 ) ( CLEAR ?auto_226276 ) ( not ( = ?auto_226275 ?auto_226279 ) ) ( not ( = ?auto_226276 ?auto_226279 ) ) ( not ( = ?auto_226274 ?auto_226279 ) ) ( SURFACE-AT ?auto_226274 ?auto_226280 ) ( CLEAR ?auto_226274 ) ( IS-CRATE ?auto_226275 ) ( AVAILABLE ?auto_226282 ) ( IN ?auto_226275 ?auto_226278 ) ( TRUCK-AT ?auto_226278 ?auto_226281 ) ( ON ?auto_226273 ?auto_226272 ) ( ON ?auto_226274 ?auto_226273 ) ( not ( = ?auto_226272 ?auto_226273 ) ) ( not ( = ?auto_226272 ?auto_226274 ) ) ( not ( = ?auto_226272 ?auto_226275 ) ) ( not ( = ?auto_226272 ?auto_226276 ) ) ( not ( = ?auto_226272 ?auto_226279 ) ) ( not ( = ?auto_226273 ?auto_226274 ) ) ( not ( = ?auto_226273 ?auto_226275 ) ) ( not ( = ?auto_226273 ?auto_226276 ) ) ( not ( = ?auto_226273 ?auto_226279 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226274 ?auto_226275 ?auto_226276 )
      ( MAKE-4CRATE-VERIFY ?auto_226272 ?auto_226273 ?auto_226274 ?auto_226275 ?auto_226276 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226283 - SURFACE
      ?auto_226284 - SURFACE
    )
    :vars
    (
      ?auto_226290 - HOIST
      ?auto_226288 - PLACE
      ?auto_226291 - SURFACE
      ?auto_226289 - PLACE
      ?auto_226285 - HOIST
      ?auto_226287 - SURFACE
      ?auto_226286 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226290 ?auto_226288 ) ( IS-CRATE ?auto_226284 ) ( not ( = ?auto_226283 ?auto_226284 ) ) ( not ( = ?auto_226291 ?auto_226283 ) ) ( not ( = ?auto_226291 ?auto_226284 ) ) ( not ( = ?auto_226289 ?auto_226288 ) ) ( HOIST-AT ?auto_226285 ?auto_226289 ) ( not ( = ?auto_226290 ?auto_226285 ) ) ( SURFACE-AT ?auto_226284 ?auto_226289 ) ( ON ?auto_226284 ?auto_226287 ) ( CLEAR ?auto_226284 ) ( not ( = ?auto_226283 ?auto_226287 ) ) ( not ( = ?auto_226284 ?auto_226287 ) ) ( not ( = ?auto_226291 ?auto_226287 ) ) ( SURFACE-AT ?auto_226291 ?auto_226288 ) ( CLEAR ?auto_226291 ) ( IS-CRATE ?auto_226283 ) ( AVAILABLE ?auto_226290 ) ( TRUCK-AT ?auto_226286 ?auto_226289 ) ( LIFTING ?auto_226285 ?auto_226283 ) )
    :subtasks
    ( ( !LOAD ?auto_226285 ?auto_226283 ?auto_226286 ?auto_226289 )
      ( MAKE-2CRATE ?auto_226291 ?auto_226283 ?auto_226284 )
      ( MAKE-1CRATE-VERIFY ?auto_226283 ?auto_226284 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_226292 - SURFACE
      ?auto_226293 - SURFACE
      ?auto_226294 - SURFACE
    )
    :vars
    (
      ?auto_226299 - HOIST
      ?auto_226297 - PLACE
      ?auto_226295 - PLACE
      ?auto_226300 - HOIST
      ?auto_226296 - SURFACE
      ?auto_226298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226299 ?auto_226297 ) ( IS-CRATE ?auto_226294 ) ( not ( = ?auto_226293 ?auto_226294 ) ) ( not ( = ?auto_226292 ?auto_226293 ) ) ( not ( = ?auto_226292 ?auto_226294 ) ) ( not ( = ?auto_226295 ?auto_226297 ) ) ( HOIST-AT ?auto_226300 ?auto_226295 ) ( not ( = ?auto_226299 ?auto_226300 ) ) ( SURFACE-AT ?auto_226294 ?auto_226295 ) ( ON ?auto_226294 ?auto_226296 ) ( CLEAR ?auto_226294 ) ( not ( = ?auto_226293 ?auto_226296 ) ) ( not ( = ?auto_226294 ?auto_226296 ) ) ( not ( = ?auto_226292 ?auto_226296 ) ) ( SURFACE-AT ?auto_226292 ?auto_226297 ) ( CLEAR ?auto_226292 ) ( IS-CRATE ?auto_226293 ) ( AVAILABLE ?auto_226299 ) ( TRUCK-AT ?auto_226298 ?auto_226295 ) ( LIFTING ?auto_226300 ?auto_226293 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226293 ?auto_226294 )
      ( MAKE-2CRATE-VERIFY ?auto_226292 ?auto_226293 ?auto_226294 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_226301 - SURFACE
      ?auto_226302 - SURFACE
      ?auto_226303 - SURFACE
      ?auto_226304 - SURFACE
    )
    :vars
    (
      ?auto_226306 - HOIST
      ?auto_226309 - PLACE
      ?auto_226310 - PLACE
      ?auto_226305 - HOIST
      ?auto_226307 - SURFACE
      ?auto_226308 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226306 ?auto_226309 ) ( IS-CRATE ?auto_226304 ) ( not ( = ?auto_226303 ?auto_226304 ) ) ( not ( = ?auto_226302 ?auto_226303 ) ) ( not ( = ?auto_226302 ?auto_226304 ) ) ( not ( = ?auto_226310 ?auto_226309 ) ) ( HOIST-AT ?auto_226305 ?auto_226310 ) ( not ( = ?auto_226306 ?auto_226305 ) ) ( SURFACE-AT ?auto_226304 ?auto_226310 ) ( ON ?auto_226304 ?auto_226307 ) ( CLEAR ?auto_226304 ) ( not ( = ?auto_226303 ?auto_226307 ) ) ( not ( = ?auto_226304 ?auto_226307 ) ) ( not ( = ?auto_226302 ?auto_226307 ) ) ( SURFACE-AT ?auto_226302 ?auto_226309 ) ( CLEAR ?auto_226302 ) ( IS-CRATE ?auto_226303 ) ( AVAILABLE ?auto_226306 ) ( TRUCK-AT ?auto_226308 ?auto_226310 ) ( LIFTING ?auto_226305 ?auto_226303 ) ( ON ?auto_226302 ?auto_226301 ) ( not ( = ?auto_226301 ?auto_226302 ) ) ( not ( = ?auto_226301 ?auto_226303 ) ) ( not ( = ?auto_226301 ?auto_226304 ) ) ( not ( = ?auto_226301 ?auto_226307 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226302 ?auto_226303 ?auto_226304 )
      ( MAKE-3CRATE-VERIFY ?auto_226301 ?auto_226302 ?auto_226303 ?auto_226304 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226311 - SURFACE
      ?auto_226312 - SURFACE
      ?auto_226313 - SURFACE
      ?auto_226314 - SURFACE
      ?auto_226315 - SURFACE
    )
    :vars
    (
      ?auto_226317 - HOIST
      ?auto_226320 - PLACE
      ?auto_226321 - PLACE
      ?auto_226316 - HOIST
      ?auto_226318 - SURFACE
      ?auto_226319 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226317 ?auto_226320 ) ( IS-CRATE ?auto_226315 ) ( not ( = ?auto_226314 ?auto_226315 ) ) ( not ( = ?auto_226313 ?auto_226314 ) ) ( not ( = ?auto_226313 ?auto_226315 ) ) ( not ( = ?auto_226321 ?auto_226320 ) ) ( HOIST-AT ?auto_226316 ?auto_226321 ) ( not ( = ?auto_226317 ?auto_226316 ) ) ( SURFACE-AT ?auto_226315 ?auto_226321 ) ( ON ?auto_226315 ?auto_226318 ) ( CLEAR ?auto_226315 ) ( not ( = ?auto_226314 ?auto_226318 ) ) ( not ( = ?auto_226315 ?auto_226318 ) ) ( not ( = ?auto_226313 ?auto_226318 ) ) ( SURFACE-AT ?auto_226313 ?auto_226320 ) ( CLEAR ?auto_226313 ) ( IS-CRATE ?auto_226314 ) ( AVAILABLE ?auto_226317 ) ( TRUCK-AT ?auto_226319 ?auto_226321 ) ( LIFTING ?auto_226316 ?auto_226314 ) ( ON ?auto_226312 ?auto_226311 ) ( ON ?auto_226313 ?auto_226312 ) ( not ( = ?auto_226311 ?auto_226312 ) ) ( not ( = ?auto_226311 ?auto_226313 ) ) ( not ( = ?auto_226311 ?auto_226314 ) ) ( not ( = ?auto_226311 ?auto_226315 ) ) ( not ( = ?auto_226311 ?auto_226318 ) ) ( not ( = ?auto_226312 ?auto_226313 ) ) ( not ( = ?auto_226312 ?auto_226314 ) ) ( not ( = ?auto_226312 ?auto_226315 ) ) ( not ( = ?auto_226312 ?auto_226318 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226313 ?auto_226314 ?auto_226315 )
      ( MAKE-4CRATE-VERIFY ?auto_226311 ?auto_226312 ?auto_226313 ?auto_226314 ?auto_226315 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226322 - SURFACE
      ?auto_226323 - SURFACE
    )
    :vars
    (
      ?auto_226325 - HOIST
      ?auto_226329 - PLACE
      ?auto_226326 - SURFACE
      ?auto_226330 - PLACE
      ?auto_226324 - HOIST
      ?auto_226327 - SURFACE
      ?auto_226328 - TRUCK
      ?auto_226331 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226325 ?auto_226329 ) ( IS-CRATE ?auto_226323 ) ( not ( = ?auto_226322 ?auto_226323 ) ) ( not ( = ?auto_226326 ?auto_226322 ) ) ( not ( = ?auto_226326 ?auto_226323 ) ) ( not ( = ?auto_226330 ?auto_226329 ) ) ( HOIST-AT ?auto_226324 ?auto_226330 ) ( not ( = ?auto_226325 ?auto_226324 ) ) ( SURFACE-AT ?auto_226323 ?auto_226330 ) ( ON ?auto_226323 ?auto_226327 ) ( CLEAR ?auto_226323 ) ( not ( = ?auto_226322 ?auto_226327 ) ) ( not ( = ?auto_226323 ?auto_226327 ) ) ( not ( = ?auto_226326 ?auto_226327 ) ) ( SURFACE-AT ?auto_226326 ?auto_226329 ) ( CLEAR ?auto_226326 ) ( IS-CRATE ?auto_226322 ) ( AVAILABLE ?auto_226325 ) ( TRUCK-AT ?auto_226328 ?auto_226330 ) ( AVAILABLE ?auto_226324 ) ( SURFACE-AT ?auto_226322 ?auto_226330 ) ( ON ?auto_226322 ?auto_226331 ) ( CLEAR ?auto_226322 ) ( not ( = ?auto_226322 ?auto_226331 ) ) ( not ( = ?auto_226323 ?auto_226331 ) ) ( not ( = ?auto_226326 ?auto_226331 ) ) ( not ( = ?auto_226327 ?auto_226331 ) ) )
    :subtasks
    ( ( !LIFT ?auto_226324 ?auto_226322 ?auto_226331 ?auto_226330 )
      ( MAKE-2CRATE ?auto_226326 ?auto_226322 ?auto_226323 )
      ( MAKE-1CRATE-VERIFY ?auto_226322 ?auto_226323 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_226332 - SURFACE
      ?auto_226333 - SURFACE
      ?auto_226334 - SURFACE
    )
    :vars
    (
      ?auto_226337 - HOIST
      ?auto_226341 - PLACE
      ?auto_226340 - PLACE
      ?auto_226339 - HOIST
      ?auto_226335 - SURFACE
      ?auto_226336 - TRUCK
      ?auto_226338 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226337 ?auto_226341 ) ( IS-CRATE ?auto_226334 ) ( not ( = ?auto_226333 ?auto_226334 ) ) ( not ( = ?auto_226332 ?auto_226333 ) ) ( not ( = ?auto_226332 ?auto_226334 ) ) ( not ( = ?auto_226340 ?auto_226341 ) ) ( HOIST-AT ?auto_226339 ?auto_226340 ) ( not ( = ?auto_226337 ?auto_226339 ) ) ( SURFACE-AT ?auto_226334 ?auto_226340 ) ( ON ?auto_226334 ?auto_226335 ) ( CLEAR ?auto_226334 ) ( not ( = ?auto_226333 ?auto_226335 ) ) ( not ( = ?auto_226334 ?auto_226335 ) ) ( not ( = ?auto_226332 ?auto_226335 ) ) ( SURFACE-AT ?auto_226332 ?auto_226341 ) ( CLEAR ?auto_226332 ) ( IS-CRATE ?auto_226333 ) ( AVAILABLE ?auto_226337 ) ( TRUCK-AT ?auto_226336 ?auto_226340 ) ( AVAILABLE ?auto_226339 ) ( SURFACE-AT ?auto_226333 ?auto_226340 ) ( ON ?auto_226333 ?auto_226338 ) ( CLEAR ?auto_226333 ) ( not ( = ?auto_226333 ?auto_226338 ) ) ( not ( = ?auto_226334 ?auto_226338 ) ) ( not ( = ?auto_226332 ?auto_226338 ) ) ( not ( = ?auto_226335 ?auto_226338 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226333 ?auto_226334 )
      ( MAKE-2CRATE-VERIFY ?auto_226332 ?auto_226333 ?auto_226334 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_226342 - SURFACE
      ?auto_226343 - SURFACE
      ?auto_226344 - SURFACE
      ?auto_226345 - SURFACE
    )
    :vars
    (
      ?auto_226351 - HOIST
      ?auto_226350 - PLACE
      ?auto_226346 - PLACE
      ?auto_226347 - HOIST
      ?auto_226349 - SURFACE
      ?auto_226348 - TRUCK
      ?auto_226352 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226351 ?auto_226350 ) ( IS-CRATE ?auto_226345 ) ( not ( = ?auto_226344 ?auto_226345 ) ) ( not ( = ?auto_226343 ?auto_226344 ) ) ( not ( = ?auto_226343 ?auto_226345 ) ) ( not ( = ?auto_226346 ?auto_226350 ) ) ( HOIST-AT ?auto_226347 ?auto_226346 ) ( not ( = ?auto_226351 ?auto_226347 ) ) ( SURFACE-AT ?auto_226345 ?auto_226346 ) ( ON ?auto_226345 ?auto_226349 ) ( CLEAR ?auto_226345 ) ( not ( = ?auto_226344 ?auto_226349 ) ) ( not ( = ?auto_226345 ?auto_226349 ) ) ( not ( = ?auto_226343 ?auto_226349 ) ) ( SURFACE-AT ?auto_226343 ?auto_226350 ) ( CLEAR ?auto_226343 ) ( IS-CRATE ?auto_226344 ) ( AVAILABLE ?auto_226351 ) ( TRUCK-AT ?auto_226348 ?auto_226346 ) ( AVAILABLE ?auto_226347 ) ( SURFACE-AT ?auto_226344 ?auto_226346 ) ( ON ?auto_226344 ?auto_226352 ) ( CLEAR ?auto_226344 ) ( not ( = ?auto_226344 ?auto_226352 ) ) ( not ( = ?auto_226345 ?auto_226352 ) ) ( not ( = ?auto_226343 ?auto_226352 ) ) ( not ( = ?auto_226349 ?auto_226352 ) ) ( ON ?auto_226343 ?auto_226342 ) ( not ( = ?auto_226342 ?auto_226343 ) ) ( not ( = ?auto_226342 ?auto_226344 ) ) ( not ( = ?auto_226342 ?auto_226345 ) ) ( not ( = ?auto_226342 ?auto_226349 ) ) ( not ( = ?auto_226342 ?auto_226352 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226343 ?auto_226344 ?auto_226345 )
      ( MAKE-3CRATE-VERIFY ?auto_226342 ?auto_226343 ?auto_226344 ?auto_226345 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226353 - SURFACE
      ?auto_226354 - SURFACE
      ?auto_226355 - SURFACE
      ?auto_226356 - SURFACE
      ?auto_226357 - SURFACE
    )
    :vars
    (
      ?auto_226363 - HOIST
      ?auto_226362 - PLACE
      ?auto_226358 - PLACE
      ?auto_226359 - HOIST
      ?auto_226361 - SURFACE
      ?auto_226360 - TRUCK
      ?auto_226364 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226363 ?auto_226362 ) ( IS-CRATE ?auto_226357 ) ( not ( = ?auto_226356 ?auto_226357 ) ) ( not ( = ?auto_226355 ?auto_226356 ) ) ( not ( = ?auto_226355 ?auto_226357 ) ) ( not ( = ?auto_226358 ?auto_226362 ) ) ( HOIST-AT ?auto_226359 ?auto_226358 ) ( not ( = ?auto_226363 ?auto_226359 ) ) ( SURFACE-AT ?auto_226357 ?auto_226358 ) ( ON ?auto_226357 ?auto_226361 ) ( CLEAR ?auto_226357 ) ( not ( = ?auto_226356 ?auto_226361 ) ) ( not ( = ?auto_226357 ?auto_226361 ) ) ( not ( = ?auto_226355 ?auto_226361 ) ) ( SURFACE-AT ?auto_226355 ?auto_226362 ) ( CLEAR ?auto_226355 ) ( IS-CRATE ?auto_226356 ) ( AVAILABLE ?auto_226363 ) ( TRUCK-AT ?auto_226360 ?auto_226358 ) ( AVAILABLE ?auto_226359 ) ( SURFACE-AT ?auto_226356 ?auto_226358 ) ( ON ?auto_226356 ?auto_226364 ) ( CLEAR ?auto_226356 ) ( not ( = ?auto_226356 ?auto_226364 ) ) ( not ( = ?auto_226357 ?auto_226364 ) ) ( not ( = ?auto_226355 ?auto_226364 ) ) ( not ( = ?auto_226361 ?auto_226364 ) ) ( ON ?auto_226354 ?auto_226353 ) ( ON ?auto_226355 ?auto_226354 ) ( not ( = ?auto_226353 ?auto_226354 ) ) ( not ( = ?auto_226353 ?auto_226355 ) ) ( not ( = ?auto_226353 ?auto_226356 ) ) ( not ( = ?auto_226353 ?auto_226357 ) ) ( not ( = ?auto_226353 ?auto_226361 ) ) ( not ( = ?auto_226353 ?auto_226364 ) ) ( not ( = ?auto_226354 ?auto_226355 ) ) ( not ( = ?auto_226354 ?auto_226356 ) ) ( not ( = ?auto_226354 ?auto_226357 ) ) ( not ( = ?auto_226354 ?auto_226361 ) ) ( not ( = ?auto_226354 ?auto_226364 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226355 ?auto_226356 ?auto_226357 )
      ( MAKE-4CRATE-VERIFY ?auto_226353 ?auto_226354 ?auto_226355 ?auto_226356 ?auto_226357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226365 - SURFACE
      ?auto_226366 - SURFACE
    )
    :vars
    (
      ?auto_226373 - HOIST
      ?auto_226372 - PLACE
      ?auto_226367 - SURFACE
      ?auto_226368 - PLACE
      ?auto_226369 - HOIST
      ?auto_226371 - SURFACE
      ?auto_226374 - SURFACE
      ?auto_226370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226373 ?auto_226372 ) ( IS-CRATE ?auto_226366 ) ( not ( = ?auto_226365 ?auto_226366 ) ) ( not ( = ?auto_226367 ?auto_226365 ) ) ( not ( = ?auto_226367 ?auto_226366 ) ) ( not ( = ?auto_226368 ?auto_226372 ) ) ( HOIST-AT ?auto_226369 ?auto_226368 ) ( not ( = ?auto_226373 ?auto_226369 ) ) ( SURFACE-AT ?auto_226366 ?auto_226368 ) ( ON ?auto_226366 ?auto_226371 ) ( CLEAR ?auto_226366 ) ( not ( = ?auto_226365 ?auto_226371 ) ) ( not ( = ?auto_226366 ?auto_226371 ) ) ( not ( = ?auto_226367 ?auto_226371 ) ) ( SURFACE-AT ?auto_226367 ?auto_226372 ) ( CLEAR ?auto_226367 ) ( IS-CRATE ?auto_226365 ) ( AVAILABLE ?auto_226373 ) ( AVAILABLE ?auto_226369 ) ( SURFACE-AT ?auto_226365 ?auto_226368 ) ( ON ?auto_226365 ?auto_226374 ) ( CLEAR ?auto_226365 ) ( not ( = ?auto_226365 ?auto_226374 ) ) ( not ( = ?auto_226366 ?auto_226374 ) ) ( not ( = ?auto_226367 ?auto_226374 ) ) ( not ( = ?auto_226371 ?auto_226374 ) ) ( TRUCK-AT ?auto_226370 ?auto_226372 ) )
    :subtasks
    ( ( !DRIVE ?auto_226370 ?auto_226372 ?auto_226368 )
      ( MAKE-2CRATE ?auto_226367 ?auto_226365 ?auto_226366 )
      ( MAKE-1CRATE-VERIFY ?auto_226365 ?auto_226366 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_226375 - SURFACE
      ?auto_226376 - SURFACE
      ?auto_226377 - SURFACE
    )
    :vars
    (
      ?auto_226384 - HOIST
      ?auto_226378 - PLACE
      ?auto_226381 - PLACE
      ?auto_226379 - HOIST
      ?auto_226382 - SURFACE
      ?auto_226383 - SURFACE
      ?auto_226380 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226384 ?auto_226378 ) ( IS-CRATE ?auto_226377 ) ( not ( = ?auto_226376 ?auto_226377 ) ) ( not ( = ?auto_226375 ?auto_226376 ) ) ( not ( = ?auto_226375 ?auto_226377 ) ) ( not ( = ?auto_226381 ?auto_226378 ) ) ( HOIST-AT ?auto_226379 ?auto_226381 ) ( not ( = ?auto_226384 ?auto_226379 ) ) ( SURFACE-AT ?auto_226377 ?auto_226381 ) ( ON ?auto_226377 ?auto_226382 ) ( CLEAR ?auto_226377 ) ( not ( = ?auto_226376 ?auto_226382 ) ) ( not ( = ?auto_226377 ?auto_226382 ) ) ( not ( = ?auto_226375 ?auto_226382 ) ) ( SURFACE-AT ?auto_226375 ?auto_226378 ) ( CLEAR ?auto_226375 ) ( IS-CRATE ?auto_226376 ) ( AVAILABLE ?auto_226384 ) ( AVAILABLE ?auto_226379 ) ( SURFACE-AT ?auto_226376 ?auto_226381 ) ( ON ?auto_226376 ?auto_226383 ) ( CLEAR ?auto_226376 ) ( not ( = ?auto_226376 ?auto_226383 ) ) ( not ( = ?auto_226377 ?auto_226383 ) ) ( not ( = ?auto_226375 ?auto_226383 ) ) ( not ( = ?auto_226382 ?auto_226383 ) ) ( TRUCK-AT ?auto_226380 ?auto_226378 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226376 ?auto_226377 )
      ( MAKE-2CRATE-VERIFY ?auto_226375 ?auto_226376 ?auto_226377 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_226385 - SURFACE
      ?auto_226386 - SURFACE
      ?auto_226387 - SURFACE
      ?auto_226388 - SURFACE
    )
    :vars
    (
      ?auto_226394 - HOIST
      ?auto_226395 - PLACE
      ?auto_226393 - PLACE
      ?auto_226389 - HOIST
      ?auto_226391 - SURFACE
      ?auto_226390 - SURFACE
      ?auto_226392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226394 ?auto_226395 ) ( IS-CRATE ?auto_226388 ) ( not ( = ?auto_226387 ?auto_226388 ) ) ( not ( = ?auto_226386 ?auto_226387 ) ) ( not ( = ?auto_226386 ?auto_226388 ) ) ( not ( = ?auto_226393 ?auto_226395 ) ) ( HOIST-AT ?auto_226389 ?auto_226393 ) ( not ( = ?auto_226394 ?auto_226389 ) ) ( SURFACE-AT ?auto_226388 ?auto_226393 ) ( ON ?auto_226388 ?auto_226391 ) ( CLEAR ?auto_226388 ) ( not ( = ?auto_226387 ?auto_226391 ) ) ( not ( = ?auto_226388 ?auto_226391 ) ) ( not ( = ?auto_226386 ?auto_226391 ) ) ( SURFACE-AT ?auto_226386 ?auto_226395 ) ( CLEAR ?auto_226386 ) ( IS-CRATE ?auto_226387 ) ( AVAILABLE ?auto_226394 ) ( AVAILABLE ?auto_226389 ) ( SURFACE-AT ?auto_226387 ?auto_226393 ) ( ON ?auto_226387 ?auto_226390 ) ( CLEAR ?auto_226387 ) ( not ( = ?auto_226387 ?auto_226390 ) ) ( not ( = ?auto_226388 ?auto_226390 ) ) ( not ( = ?auto_226386 ?auto_226390 ) ) ( not ( = ?auto_226391 ?auto_226390 ) ) ( TRUCK-AT ?auto_226392 ?auto_226395 ) ( ON ?auto_226386 ?auto_226385 ) ( not ( = ?auto_226385 ?auto_226386 ) ) ( not ( = ?auto_226385 ?auto_226387 ) ) ( not ( = ?auto_226385 ?auto_226388 ) ) ( not ( = ?auto_226385 ?auto_226391 ) ) ( not ( = ?auto_226385 ?auto_226390 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226386 ?auto_226387 ?auto_226388 )
      ( MAKE-3CRATE-VERIFY ?auto_226385 ?auto_226386 ?auto_226387 ?auto_226388 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226396 - SURFACE
      ?auto_226397 - SURFACE
      ?auto_226398 - SURFACE
      ?auto_226399 - SURFACE
      ?auto_226400 - SURFACE
    )
    :vars
    (
      ?auto_226406 - HOIST
      ?auto_226407 - PLACE
      ?auto_226405 - PLACE
      ?auto_226401 - HOIST
      ?auto_226403 - SURFACE
      ?auto_226402 - SURFACE
      ?auto_226404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226406 ?auto_226407 ) ( IS-CRATE ?auto_226400 ) ( not ( = ?auto_226399 ?auto_226400 ) ) ( not ( = ?auto_226398 ?auto_226399 ) ) ( not ( = ?auto_226398 ?auto_226400 ) ) ( not ( = ?auto_226405 ?auto_226407 ) ) ( HOIST-AT ?auto_226401 ?auto_226405 ) ( not ( = ?auto_226406 ?auto_226401 ) ) ( SURFACE-AT ?auto_226400 ?auto_226405 ) ( ON ?auto_226400 ?auto_226403 ) ( CLEAR ?auto_226400 ) ( not ( = ?auto_226399 ?auto_226403 ) ) ( not ( = ?auto_226400 ?auto_226403 ) ) ( not ( = ?auto_226398 ?auto_226403 ) ) ( SURFACE-AT ?auto_226398 ?auto_226407 ) ( CLEAR ?auto_226398 ) ( IS-CRATE ?auto_226399 ) ( AVAILABLE ?auto_226406 ) ( AVAILABLE ?auto_226401 ) ( SURFACE-AT ?auto_226399 ?auto_226405 ) ( ON ?auto_226399 ?auto_226402 ) ( CLEAR ?auto_226399 ) ( not ( = ?auto_226399 ?auto_226402 ) ) ( not ( = ?auto_226400 ?auto_226402 ) ) ( not ( = ?auto_226398 ?auto_226402 ) ) ( not ( = ?auto_226403 ?auto_226402 ) ) ( TRUCK-AT ?auto_226404 ?auto_226407 ) ( ON ?auto_226397 ?auto_226396 ) ( ON ?auto_226398 ?auto_226397 ) ( not ( = ?auto_226396 ?auto_226397 ) ) ( not ( = ?auto_226396 ?auto_226398 ) ) ( not ( = ?auto_226396 ?auto_226399 ) ) ( not ( = ?auto_226396 ?auto_226400 ) ) ( not ( = ?auto_226396 ?auto_226403 ) ) ( not ( = ?auto_226396 ?auto_226402 ) ) ( not ( = ?auto_226397 ?auto_226398 ) ) ( not ( = ?auto_226397 ?auto_226399 ) ) ( not ( = ?auto_226397 ?auto_226400 ) ) ( not ( = ?auto_226397 ?auto_226403 ) ) ( not ( = ?auto_226397 ?auto_226402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226398 ?auto_226399 ?auto_226400 )
      ( MAKE-4CRATE-VERIFY ?auto_226396 ?auto_226397 ?auto_226398 ?auto_226399 ?auto_226400 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_226408 - SURFACE
      ?auto_226409 - SURFACE
    )
    :vars
    (
      ?auto_226415 - HOIST
      ?auto_226416 - PLACE
      ?auto_226417 - SURFACE
      ?auto_226414 - PLACE
      ?auto_226410 - HOIST
      ?auto_226412 - SURFACE
      ?auto_226411 - SURFACE
      ?auto_226413 - TRUCK
      ?auto_226418 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226415 ?auto_226416 ) ( IS-CRATE ?auto_226409 ) ( not ( = ?auto_226408 ?auto_226409 ) ) ( not ( = ?auto_226417 ?auto_226408 ) ) ( not ( = ?auto_226417 ?auto_226409 ) ) ( not ( = ?auto_226414 ?auto_226416 ) ) ( HOIST-AT ?auto_226410 ?auto_226414 ) ( not ( = ?auto_226415 ?auto_226410 ) ) ( SURFACE-AT ?auto_226409 ?auto_226414 ) ( ON ?auto_226409 ?auto_226412 ) ( CLEAR ?auto_226409 ) ( not ( = ?auto_226408 ?auto_226412 ) ) ( not ( = ?auto_226409 ?auto_226412 ) ) ( not ( = ?auto_226417 ?auto_226412 ) ) ( IS-CRATE ?auto_226408 ) ( AVAILABLE ?auto_226410 ) ( SURFACE-AT ?auto_226408 ?auto_226414 ) ( ON ?auto_226408 ?auto_226411 ) ( CLEAR ?auto_226408 ) ( not ( = ?auto_226408 ?auto_226411 ) ) ( not ( = ?auto_226409 ?auto_226411 ) ) ( not ( = ?auto_226417 ?auto_226411 ) ) ( not ( = ?auto_226412 ?auto_226411 ) ) ( TRUCK-AT ?auto_226413 ?auto_226416 ) ( SURFACE-AT ?auto_226418 ?auto_226416 ) ( CLEAR ?auto_226418 ) ( LIFTING ?auto_226415 ?auto_226417 ) ( IS-CRATE ?auto_226417 ) ( not ( = ?auto_226418 ?auto_226417 ) ) ( not ( = ?auto_226408 ?auto_226418 ) ) ( not ( = ?auto_226409 ?auto_226418 ) ) ( not ( = ?auto_226412 ?auto_226418 ) ) ( not ( = ?auto_226411 ?auto_226418 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226418 ?auto_226417 )
      ( MAKE-2CRATE ?auto_226417 ?auto_226408 ?auto_226409 )
      ( MAKE-1CRATE-VERIFY ?auto_226408 ?auto_226409 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_226419 - SURFACE
      ?auto_226420 - SURFACE
      ?auto_226421 - SURFACE
    )
    :vars
    (
      ?auto_226429 - HOIST
      ?auto_226422 - PLACE
      ?auto_226428 - PLACE
      ?auto_226423 - HOIST
      ?auto_226427 - SURFACE
      ?auto_226425 - SURFACE
      ?auto_226426 - TRUCK
      ?auto_226424 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226429 ?auto_226422 ) ( IS-CRATE ?auto_226421 ) ( not ( = ?auto_226420 ?auto_226421 ) ) ( not ( = ?auto_226419 ?auto_226420 ) ) ( not ( = ?auto_226419 ?auto_226421 ) ) ( not ( = ?auto_226428 ?auto_226422 ) ) ( HOIST-AT ?auto_226423 ?auto_226428 ) ( not ( = ?auto_226429 ?auto_226423 ) ) ( SURFACE-AT ?auto_226421 ?auto_226428 ) ( ON ?auto_226421 ?auto_226427 ) ( CLEAR ?auto_226421 ) ( not ( = ?auto_226420 ?auto_226427 ) ) ( not ( = ?auto_226421 ?auto_226427 ) ) ( not ( = ?auto_226419 ?auto_226427 ) ) ( IS-CRATE ?auto_226420 ) ( AVAILABLE ?auto_226423 ) ( SURFACE-AT ?auto_226420 ?auto_226428 ) ( ON ?auto_226420 ?auto_226425 ) ( CLEAR ?auto_226420 ) ( not ( = ?auto_226420 ?auto_226425 ) ) ( not ( = ?auto_226421 ?auto_226425 ) ) ( not ( = ?auto_226419 ?auto_226425 ) ) ( not ( = ?auto_226427 ?auto_226425 ) ) ( TRUCK-AT ?auto_226426 ?auto_226422 ) ( SURFACE-AT ?auto_226424 ?auto_226422 ) ( CLEAR ?auto_226424 ) ( LIFTING ?auto_226429 ?auto_226419 ) ( IS-CRATE ?auto_226419 ) ( not ( = ?auto_226424 ?auto_226419 ) ) ( not ( = ?auto_226420 ?auto_226424 ) ) ( not ( = ?auto_226421 ?auto_226424 ) ) ( not ( = ?auto_226427 ?auto_226424 ) ) ( not ( = ?auto_226425 ?auto_226424 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226420 ?auto_226421 )
      ( MAKE-2CRATE-VERIFY ?auto_226419 ?auto_226420 ?auto_226421 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_226430 - SURFACE
      ?auto_226431 - SURFACE
      ?auto_226432 - SURFACE
      ?auto_226433 - SURFACE
    )
    :vars
    (
      ?auto_226435 - HOIST
      ?auto_226439 - PLACE
      ?auto_226436 - PLACE
      ?auto_226438 - HOIST
      ?auto_226440 - SURFACE
      ?auto_226434 - SURFACE
      ?auto_226437 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226435 ?auto_226439 ) ( IS-CRATE ?auto_226433 ) ( not ( = ?auto_226432 ?auto_226433 ) ) ( not ( = ?auto_226431 ?auto_226432 ) ) ( not ( = ?auto_226431 ?auto_226433 ) ) ( not ( = ?auto_226436 ?auto_226439 ) ) ( HOIST-AT ?auto_226438 ?auto_226436 ) ( not ( = ?auto_226435 ?auto_226438 ) ) ( SURFACE-AT ?auto_226433 ?auto_226436 ) ( ON ?auto_226433 ?auto_226440 ) ( CLEAR ?auto_226433 ) ( not ( = ?auto_226432 ?auto_226440 ) ) ( not ( = ?auto_226433 ?auto_226440 ) ) ( not ( = ?auto_226431 ?auto_226440 ) ) ( IS-CRATE ?auto_226432 ) ( AVAILABLE ?auto_226438 ) ( SURFACE-AT ?auto_226432 ?auto_226436 ) ( ON ?auto_226432 ?auto_226434 ) ( CLEAR ?auto_226432 ) ( not ( = ?auto_226432 ?auto_226434 ) ) ( not ( = ?auto_226433 ?auto_226434 ) ) ( not ( = ?auto_226431 ?auto_226434 ) ) ( not ( = ?auto_226440 ?auto_226434 ) ) ( TRUCK-AT ?auto_226437 ?auto_226439 ) ( SURFACE-AT ?auto_226430 ?auto_226439 ) ( CLEAR ?auto_226430 ) ( LIFTING ?auto_226435 ?auto_226431 ) ( IS-CRATE ?auto_226431 ) ( not ( = ?auto_226430 ?auto_226431 ) ) ( not ( = ?auto_226432 ?auto_226430 ) ) ( not ( = ?auto_226433 ?auto_226430 ) ) ( not ( = ?auto_226440 ?auto_226430 ) ) ( not ( = ?auto_226434 ?auto_226430 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226431 ?auto_226432 ?auto_226433 )
      ( MAKE-3CRATE-VERIFY ?auto_226430 ?auto_226431 ?auto_226432 ?auto_226433 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_226441 - SURFACE
      ?auto_226442 - SURFACE
      ?auto_226443 - SURFACE
      ?auto_226444 - SURFACE
      ?auto_226445 - SURFACE
    )
    :vars
    (
      ?auto_226447 - HOIST
      ?auto_226451 - PLACE
      ?auto_226448 - PLACE
      ?auto_226450 - HOIST
      ?auto_226452 - SURFACE
      ?auto_226446 - SURFACE
      ?auto_226449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226447 ?auto_226451 ) ( IS-CRATE ?auto_226445 ) ( not ( = ?auto_226444 ?auto_226445 ) ) ( not ( = ?auto_226443 ?auto_226444 ) ) ( not ( = ?auto_226443 ?auto_226445 ) ) ( not ( = ?auto_226448 ?auto_226451 ) ) ( HOIST-AT ?auto_226450 ?auto_226448 ) ( not ( = ?auto_226447 ?auto_226450 ) ) ( SURFACE-AT ?auto_226445 ?auto_226448 ) ( ON ?auto_226445 ?auto_226452 ) ( CLEAR ?auto_226445 ) ( not ( = ?auto_226444 ?auto_226452 ) ) ( not ( = ?auto_226445 ?auto_226452 ) ) ( not ( = ?auto_226443 ?auto_226452 ) ) ( IS-CRATE ?auto_226444 ) ( AVAILABLE ?auto_226450 ) ( SURFACE-AT ?auto_226444 ?auto_226448 ) ( ON ?auto_226444 ?auto_226446 ) ( CLEAR ?auto_226444 ) ( not ( = ?auto_226444 ?auto_226446 ) ) ( not ( = ?auto_226445 ?auto_226446 ) ) ( not ( = ?auto_226443 ?auto_226446 ) ) ( not ( = ?auto_226452 ?auto_226446 ) ) ( TRUCK-AT ?auto_226449 ?auto_226451 ) ( SURFACE-AT ?auto_226442 ?auto_226451 ) ( CLEAR ?auto_226442 ) ( LIFTING ?auto_226447 ?auto_226443 ) ( IS-CRATE ?auto_226443 ) ( not ( = ?auto_226442 ?auto_226443 ) ) ( not ( = ?auto_226444 ?auto_226442 ) ) ( not ( = ?auto_226445 ?auto_226442 ) ) ( not ( = ?auto_226452 ?auto_226442 ) ) ( not ( = ?auto_226446 ?auto_226442 ) ) ( ON ?auto_226442 ?auto_226441 ) ( not ( = ?auto_226441 ?auto_226442 ) ) ( not ( = ?auto_226441 ?auto_226443 ) ) ( not ( = ?auto_226441 ?auto_226444 ) ) ( not ( = ?auto_226441 ?auto_226445 ) ) ( not ( = ?auto_226441 ?auto_226452 ) ) ( not ( = ?auto_226441 ?auto_226446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226443 ?auto_226444 ?auto_226445 )
      ( MAKE-4CRATE-VERIFY ?auto_226441 ?auto_226442 ?auto_226443 ?auto_226444 ?auto_226445 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226888 - SURFACE
      ?auto_226889 - SURFACE
      ?auto_226890 - SURFACE
      ?auto_226891 - SURFACE
      ?auto_226892 - SURFACE
      ?auto_226893 - SURFACE
    )
    :vars
    (
      ?auto_226895 - HOIST
      ?auto_226894 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226895 ?auto_226894 ) ( SURFACE-AT ?auto_226892 ?auto_226894 ) ( CLEAR ?auto_226892 ) ( LIFTING ?auto_226895 ?auto_226893 ) ( IS-CRATE ?auto_226893 ) ( not ( = ?auto_226892 ?auto_226893 ) ) ( ON ?auto_226889 ?auto_226888 ) ( ON ?auto_226890 ?auto_226889 ) ( ON ?auto_226891 ?auto_226890 ) ( ON ?auto_226892 ?auto_226891 ) ( not ( = ?auto_226888 ?auto_226889 ) ) ( not ( = ?auto_226888 ?auto_226890 ) ) ( not ( = ?auto_226888 ?auto_226891 ) ) ( not ( = ?auto_226888 ?auto_226892 ) ) ( not ( = ?auto_226888 ?auto_226893 ) ) ( not ( = ?auto_226889 ?auto_226890 ) ) ( not ( = ?auto_226889 ?auto_226891 ) ) ( not ( = ?auto_226889 ?auto_226892 ) ) ( not ( = ?auto_226889 ?auto_226893 ) ) ( not ( = ?auto_226890 ?auto_226891 ) ) ( not ( = ?auto_226890 ?auto_226892 ) ) ( not ( = ?auto_226890 ?auto_226893 ) ) ( not ( = ?auto_226891 ?auto_226892 ) ) ( not ( = ?auto_226891 ?auto_226893 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_226892 ?auto_226893 )
      ( MAKE-5CRATE-VERIFY ?auto_226888 ?auto_226889 ?auto_226890 ?auto_226891 ?auto_226892 ?auto_226893 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226922 - SURFACE
      ?auto_226923 - SURFACE
      ?auto_226924 - SURFACE
      ?auto_226925 - SURFACE
      ?auto_226926 - SURFACE
      ?auto_226927 - SURFACE
    )
    :vars
    (
      ?auto_226928 - HOIST
      ?auto_226929 - PLACE
      ?auto_226930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_226928 ?auto_226929 ) ( SURFACE-AT ?auto_226926 ?auto_226929 ) ( CLEAR ?auto_226926 ) ( IS-CRATE ?auto_226927 ) ( not ( = ?auto_226926 ?auto_226927 ) ) ( TRUCK-AT ?auto_226930 ?auto_226929 ) ( AVAILABLE ?auto_226928 ) ( IN ?auto_226927 ?auto_226930 ) ( ON ?auto_226926 ?auto_226925 ) ( not ( = ?auto_226925 ?auto_226926 ) ) ( not ( = ?auto_226925 ?auto_226927 ) ) ( ON ?auto_226923 ?auto_226922 ) ( ON ?auto_226924 ?auto_226923 ) ( ON ?auto_226925 ?auto_226924 ) ( not ( = ?auto_226922 ?auto_226923 ) ) ( not ( = ?auto_226922 ?auto_226924 ) ) ( not ( = ?auto_226922 ?auto_226925 ) ) ( not ( = ?auto_226922 ?auto_226926 ) ) ( not ( = ?auto_226922 ?auto_226927 ) ) ( not ( = ?auto_226923 ?auto_226924 ) ) ( not ( = ?auto_226923 ?auto_226925 ) ) ( not ( = ?auto_226923 ?auto_226926 ) ) ( not ( = ?auto_226923 ?auto_226927 ) ) ( not ( = ?auto_226924 ?auto_226925 ) ) ( not ( = ?auto_226924 ?auto_226926 ) ) ( not ( = ?auto_226924 ?auto_226927 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226925 ?auto_226926 ?auto_226927 )
      ( MAKE-5CRATE-VERIFY ?auto_226922 ?auto_226923 ?auto_226924 ?auto_226925 ?auto_226926 ?auto_226927 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_226962 - SURFACE
      ?auto_226963 - SURFACE
      ?auto_226964 - SURFACE
      ?auto_226965 - SURFACE
      ?auto_226966 - SURFACE
      ?auto_226967 - SURFACE
    )
    :vars
    (
      ?auto_226970 - HOIST
      ?auto_226969 - PLACE
      ?auto_226971 - TRUCK
      ?auto_226968 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_226970 ?auto_226969 ) ( SURFACE-AT ?auto_226966 ?auto_226969 ) ( CLEAR ?auto_226966 ) ( IS-CRATE ?auto_226967 ) ( not ( = ?auto_226966 ?auto_226967 ) ) ( AVAILABLE ?auto_226970 ) ( IN ?auto_226967 ?auto_226971 ) ( ON ?auto_226966 ?auto_226965 ) ( not ( = ?auto_226965 ?auto_226966 ) ) ( not ( = ?auto_226965 ?auto_226967 ) ) ( TRUCK-AT ?auto_226971 ?auto_226968 ) ( not ( = ?auto_226968 ?auto_226969 ) ) ( ON ?auto_226963 ?auto_226962 ) ( ON ?auto_226964 ?auto_226963 ) ( ON ?auto_226965 ?auto_226964 ) ( not ( = ?auto_226962 ?auto_226963 ) ) ( not ( = ?auto_226962 ?auto_226964 ) ) ( not ( = ?auto_226962 ?auto_226965 ) ) ( not ( = ?auto_226962 ?auto_226966 ) ) ( not ( = ?auto_226962 ?auto_226967 ) ) ( not ( = ?auto_226963 ?auto_226964 ) ) ( not ( = ?auto_226963 ?auto_226965 ) ) ( not ( = ?auto_226963 ?auto_226966 ) ) ( not ( = ?auto_226963 ?auto_226967 ) ) ( not ( = ?auto_226964 ?auto_226965 ) ) ( not ( = ?auto_226964 ?auto_226966 ) ) ( not ( = ?auto_226964 ?auto_226967 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_226965 ?auto_226966 ?auto_226967 )
      ( MAKE-5CRATE-VERIFY ?auto_226962 ?auto_226963 ?auto_226964 ?auto_226965 ?auto_226966 ?auto_226967 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227007 - SURFACE
      ?auto_227008 - SURFACE
      ?auto_227009 - SURFACE
      ?auto_227010 - SURFACE
      ?auto_227011 - SURFACE
      ?auto_227012 - SURFACE
    )
    :vars
    (
      ?auto_227015 - HOIST
      ?auto_227017 - PLACE
      ?auto_227014 - TRUCK
      ?auto_227016 - PLACE
      ?auto_227013 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_227015 ?auto_227017 ) ( SURFACE-AT ?auto_227011 ?auto_227017 ) ( CLEAR ?auto_227011 ) ( IS-CRATE ?auto_227012 ) ( not ( = ?auto_227011 ?auto_227012 ) ) ( AVAILABLE ?auto_227015 ) ( ON ?auto_227011 ?auto_227010 ) ( not ( = ?auto_227010 ?auto_227011 ) ) ( not ( = ?auto_227010 ?auto_227012 ) ) ( TRUCK-AT ?auto_227014 ?auto_227016 ) ( not ( = ?auto_227016 ?auto_227017 ) ) ( HOIST-AT ?auto_227013 ?auto_227016 ) ( LIFTING ?auto_227013 ?auto_227012 ) ( not ( = ?auto_227015 ?auto_227013 ) ) ( ON ?auto_227008 ?auto_227007 ) ( ON ?auto_227009 ?auto_227008 ) ( ON ?auto_227010 ?auto_227009 ) ( not ( = ?auto_227007 ?auto_227008 ) ) ( not ( = ?auto_227007 ?auto_227009 ) ) ( not ( = ?auto_227007 ?auto_227010 ) ) ( not ( = ?auto_227007 ?auto_227011 ) ) ( not ( = ?auto_227007 ?auto_227012 ) ) ( not ( = ?auto_227008 ?auto_227009 ) ) ( not ( = ?auto_227008 ?auto_227010 ) ) ( not ( = ?auto_227008 ?auto_227011 ) ) ( not ( = ?auto_227008 ?auto_227012 ) ) ( not ( = ?auto_227009 ?auto_227010 ) ) ( not ( = ?auto_227009 ?auto_227011 ) ) ( not ( = ?auto_227009 ?auto_227012 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227010 ?auto_227011 ?auto_227012 )
      ( MAKE-5CRATE-VERIFY ?auto_227007 ?auto_227008 ?auto_227009 ?auto_227010 ?auto_227011 ?auto_227012 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227057 - SURFACE
      ?auto_227058 - SURFACE
      ?auto_227059 - SURFACE
      ?auto_227060 - SURFACE
      ?auto_227061 - SURFACE
      ?auto_227062 - SURFACE
    )
    :vars
    (
      ?auto_227064 - HOIST
      ?auto_227065 - PLACE
      ?auto_227068 - TRUCK
      ?auto_227067 - PLACE
      ?auto_227066 - HOIST
      ?auto_227063 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_227064 ?auto_227065 ) ( SURFACE-AT ?auto_227061 ?auto_227065 ) ( CLEAR ?auto_227061 ) ( IS-CRATE ?auto_227062 ) ( not ( = ?auto_227061 ?auto_227062 ) ) ( AVAILABLE ?auto_227064 ) ( ON ?auto_227061 ?auto_227060 ) ( not ( = ?auto_227060 ?auto_227061 ) ) ( not ( = ?auto_227060 ?auto_227062 ) ) ( TRUCK-AT ?auto_227068 ?auto_227067 ) ( not ( = ?auto_227067 ?auto_227065 ) ) ( HOIST-AT ?auto_227066 ?auto_227067 ) ( not ( = ?auto_227064 ?auto_227066 ) ) ( AVAILABLE ?auto_227066 ) ( SURFACE-AT ?auto_227062 ?auto_227067 ) ( ON ?auto_227062 ?auto_227063 ) ( CLEAR ?auto_227062 ) ( not ( = ?auto_227061 ?auto_227063 ) ) ( not ( = ?auto_227062 ?auto_227063 ) ) ( not ( = ?auto_227060 ?auto_227063 ) ) ( ON ?auto_227058 ?auto_227057 ) ( ON ?auto_227059 ?auto_227058 ) ( ON ?auto_227060 ?auto_227059 ) ( not ( = ?auto_227057 ?auto_227058 ) ) ( not ( = ?auto_227057 ?auto_227059 ) ) ( not ( = ?auto_227057 ?auto_227060 ) ) ( not ( = ?auto_227057 ?auto_227061 ) ) ( not ( = ?auto_227057 ?auto_227062 ) ) ( not ( = ?auto_227057 ?auto_227063 ) ) ( not ( = ?auto_227058 ?auto_227059 ) ) ( not ( = ?auto_227058 ?auto_227060 ) ) ( not ( = ?auto_227058 ?auto_227061 ) ) ( not ( = ?auto_227058 ?auto_227062 ) ) ( not ( = ?auto_227058 ?auto_227063 ) ) ( not ( = ?auto_227059 ?auto_227060 ) ) ( not ( = ?auto_227059 ?auto_227061 ) ) ( not ( = ?auto_227059 ?auto_227062 ) ) ( not ( = ?auto_227059 ?auto_227063 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227060 ?auto_227061 ?auto_227062 )
      ( MAKE-5CRATE-VERIFY ?auto_227057 ?auto_227058 ?auto_227059 ?auto_227060 ?auto_227061 ?auto_227062 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227108 - SURFACE
      ?auto_227109 - SURFACE
      ?auto_227110 - SURFACE
      ?auto_227111 - SURFACE
      ?auto_227112 - SURFACE
      ?auto_227113 - SURFACE
    )
    :vars
    (
      ?auto_227119 - HOIST
      ?auto_227118 - PLACE
      ?auto_227116 - PLACE
      ?auto_227114 - HOIST
      ?auto_227115 - SURFACE
      ?auto_227117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227119 ?auto_227118 ) ( SURFACE-AT ?auto_227112 ?auto_227118 ) ( CLEAR ?auto_227112 ) ( IS-CRATE ?auto_227113 ) ( not ( = ?auto_227112 ?auto_227113 ) ) ( AVAILABLE ?auto_227119 ) ( ON ?auto_227112 ?auto_227111 ) ( not ( = ?auto_227111 ?auto_227112 ) ) ( not ( = ?auto_227111 ?auto_227113 ) ) ( not ( = ?auto_227116 ?auto_227118 ) ) ( HOIST-AT ?auto_227114 ?auto_227116 ) ( not ( = ?auto_227119 ?auto_227114 ) ) ( AVAILABLE ?auto_227114 ) ( SURFACE-AT ?auto_227113 ?auto_227116 ) ( ON ?auto_227113 ?auto_227115 ) ( CLEAR ?auto_227113 ) ( not ( = ?auto_227112 ?auto_227115 ) ) ( not ( = ?auto_227113 ?auto_227115 ) ) ( not ( = ?auto_227111 ?auto_227115 ) ) ( TRUCK-AT ?auto_227117 ?auto_227118 ) ( ON ?auto_227109 ?auto_227108 ) ( ON ?auto_227110 ?auto_227109 ) ( ON ?auto_227111 ?auto_227110 ) ( not ( = ?auto_227108 ?auto_227109 ) ) ( not ( = ?auto_227108 ?auto_227110 ) ) ( not ( = ?auto_227108 ?auto_227111 ) ) ( not ( = ?auto_227108 ?auto_227112 ) ) ( not ( = ?auto_227108 ?auto_227113 ) ) ( not ( = ?auto_227108 ?auto_227115 ) ) ( not ( = ?auto_227109 ?auto_227110 ) ) ( not ( = ?auto_227109 ?auto_227111 ) ) ( not ( = ?auto_227109 ?auto_227112 ) ) ( not ( = ?auto_227109 ?auto_227113 ) ) ( not ( = ?auto_227109 ?auto_227115 ) ) ( not ( = ?auto_227110 ?auto_227111 ) ) ( not ( = ?auto_227110 ?auto_227112 ) ) ( not ( = ?auto_227110 ?auto_227113 ) ) ( not ( = ?auto_227110 ?auto_227115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227111 ?auto_227112 ?auto_227113 )
      ( MAKE-5CRATE-VERIFY ?auto_227108 ?auto_227109 ?auto_227110 ?auto_227111 ?auto_227112 ?auto_227113 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227159 - SURFACE
      ?auto_227160 - SURFACE
      ?auto_227161 - SURFACE
      ?auto_227162 - SURFACE
      ?auto_227163 - SURFACE
      ?auto_227164 - SURFACE
    )
    :vars
    (
      ?auto_227167 - HOIST
      ?auto_227170 - PLACE
      ?auto_227169 - PLACE
      ?auto_227166 - HOIST
      ?auto_227168 - SURFACE
      ?auto_227165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227167 ?auto_227170 ) ( IS-CRATE ?auto_227164 ) ( not ( = ?auto_227163 ?auto_227164 ) ) ( not ( = ?auto_227162 ?auto_227163 ) ) ( not ( = ?auto_227162 ?auto_227164 ) ) ( not ( = ?auto_227169 ?auto_227170 ) ) ( HOIST-AT ?auto_227166 ?auto_227169 ) ( not ( = ?auto_227167 ?auto_227166 ) ) ( AVAILABLE ?auto_227166 ) ( SURFACE-AT ?auto_227164 ?auto_227169 ) ( ON ?auto_227164 ?auto_227168 ) ( CLEAR ?auto_227164 ) ( not ( = ?auto_227163 ?auto_227168 ) ) ( not ( = ?auto_227164 ?auto_227168 ) ) ( not ( = ?auto_227162 ?auto_227168 ) ) ( TRUCK-AT ?auto_227165 ?auto_227170 ) ( SURFACE-AT ?auto_227162 ?auto_227170 ) ( CLEAR ?auto_227162 ) ( LIFTING ?auto_227167 ?auto_227163 ) ( IS-CRATE ?auto_227163 ) ( ON ?auto_227160 ?auto_227159 ) ( ON ?auto_227161 ?auto_227160 ) ( ON ?auto_227162 ?auto_227161 ) ( not ( = ?auto_227159 ?auto_227160 ) ) ( not ( = ?auto_227159 ?auto_227161 ) ) ( not ( = ?auto_227159 ?auto_227162 ) ) ( not ( = ?auto_227159 ?auto_227163 ) ) ( not ( = ?auto_227159 ?auto_227164 ) ) ( not ( = ?auto_227159 ?auto_227168 ) ) ( not ( = ?auto_227160 ?auto_227161 ) ) ( not ( = ?auto_227160 ?auto_227162 ) ) ( not ( = ?auto_227160 ?auto_227163 ) ) ( not ( = ?auto_227160 ?auto_227164 ) ) ( not ( = ?auto_227160 ?auto_227168 ) ) ( not ( = ?auto_227161 ?auto_227162 ) ) ( not ( = ?auto_227161 ?auto_227163 ) ) ( not ( = ?auto_227161 ?auto_227164 ) ) ( not ( = ?auto_227161 ?auto_227168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227162 ?auto_227163 ?auto_227164 )
      ( MAKE-5CRATE-VERIFY ?auto_227159 ?auto_227160 ?auto_227161 ?auto_227162 ?auto_227163 ?auto_227164 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_227210 - SURFACE
      ?auto_227211 - SURFACE
      ?auto_227212 - SURFACE
      ?auto_227213 - SURFACE
      ?auto_227214 - SURFACE
      ?auto_227215 - SURFACE
    )
    :vars
    (
      ?auto_227217 - HOIST
      ?auto_227220 - PLACE
      ?auto_227216 - PLACE
      ?auto_227218 - HOIST
      ?auto_227219 - SURFACE
      ?auto_227221 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_227217 ?auto_227220 ) ( IS-CRATE ?auto_227215 ) ( not ( = ?auto_227214 ?auto_227215 ) ) ( not ( = ?auto_227213 ?auto_227214 ) ) ( not ( = ?auto_227213 ?auto_227215 ) ) ( not ( = ?auto_227216 ?auto_227220 ) ) ( HOIST-AT ?auto_227218 ?auto_227216 ) ( not ( = ?auto_227217 ?auto_227218 ) ) ( AVAILABLE ?auto_227218 ) ( SURFACE-AT ?auto_227215 ?auto_227216 ) ( ON ?auto_227215 ?auto_227219 ) ( CLEAR ?auto_227215 ) ( not ( = ?auto_227214 ?auto_227219 ) ) ( not ( = ?auto_227215 ?auto_227219 ) ) ( not ( = ?auto_227213 ?auto_227219 ) ) ( TRUCK-AT ?auto_227221 ?auto_227220 ) ( SURFACE-AT ?auto_227213 ?auto_227220 ) ( CLEAR ?auto_227213 ) ( IS-CRATE ?auto_227214 ) ( AVAILABLE ?auto_227217 ) ( IN ?auto_227214 ?auto_227221 ) ( ON ?auto_227211 ?auto_227210 ) ( ON ?auto_227212 ?auto_227211 ) ( ON ?auto_227213 ?auto_227212 ) ( not ( = ?auto_227210 ?auto_227211 ) ) ( not ( = ?auto_227210 ?auto_227212 ) ) ( not ( = ?auto_227210 ?auto_227213 ) ) ( not ( = ?auto_227210 ?auto_227214 ) ) ( not ( = ?auto_227210 ?auto_227215 ) ) ( not ( = ?auto_227210 ?auto_227219 ) ) ( not ( = ?auto_227211 ?auto_227212 ) ) ( not ( = ?auto_227211 ?auto_227213 ) ) ( not ( = ?auto_227211 ?auto_227214 ) ) ( not ( = ?auto_227211 ?auto_227215 ) ) ( not ( = ?auto_227211 ?auto_227219 ) ) ( not ( = ?auto_227212 ?auto_227213 ) ) ( not ( = ?auto_227212 ?auto_227214 ) ) ( not ( = ?auto_227212 ?auto_227215 ) ) ( not ( = ?auto_227212 ?auto_227219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_227213 ?auto_227214 ?auto_227215 )
      ( MAKE-5CRATE-VERIFY ?auto_227210 ?auto_227211 ?auto_227212 ?auto_227213 ?auto_227214 ?auto_227215 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_227578 - SURFACE
      ?auto_227579 - SURFACE
    )
    :vars
    (
      ?auto_227583 - HOIST
      ?auto_227585 - PLACE
      ?auto_227582 - SURFACE
      ?auto_227586 - PLACE
      ?auto_227584 - HOIST
      ?auto_227580 - SURFACE
      ?auto_227581 - TRUCK
      ?auto_227587 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_227583 ?auto_227585 ) ( SURFACE-AT ?auto_227578 ?auto_227585 ) ( CLEAR ?auto_227578 ) ( IS-CRATE ?auto_227579 ) ( not ( = ?auto_227578 ?auto_227579 ) ) ( ON ?auto_227578 ?auto_227582 ) ( not ( = ?auto_227582 ?auto_227578 ) ) ( not ( = ?auto_227582 ?auto_227579 ) ) ( not ( = ?auto_227586 ?auto_227585 ) ) ( HOIST-AT ?auto_227584 ?auto_227586 ) ( not ( = ?auto_227583 ?auto_227584 ) ) ( AVAILABLE ?auto_227584 ) ( SURFACE-AT ?auto_227579 ?auto_227586 ) ( ON ?auto_227579 ?auto_227580 ) ( CLEAR ?auto_227579 ) ( not ( = ?auto_227578 ?auto_227580 ) ) ( not ( = ?auto_227579 ?auto_227580 ) ) ( not ( = ?auto_227582 ?auto_227580 ) ) ( TRUCK-AT ?auto_227581 ?auto_227585 ) ( LIFTING ?auto_227583 ?auto_227587 ) ( IS-CRATE ?auto_227587 ) ( not ( = ?auto_227578 ?auto_227587 ) ) ( not ( = ?auto_227579 ?auto_227587 ) ) ( not ( = ?auto_227582 ?auto_227587 ) ) ( not ( = ?auto_227580 ?auto_227587 ) ) )
    :subtasks
    ( ( !LOAD ?auto_227583 ?auto_227587 ?auto_227581 ?auto_227585 )
      ( MAKE-1CRATE ?auto_227578 ?auto_227579 )
      ( MAKE-1CRATE-VERIFY ?auto_227578 ?auto_227579 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_228198 - SURFACE
      ?auto_228199 - SURFACE
    )
    :vars
    (
      ?auto_228201 - HOIST
      ?auto_228200 - PLACE
      ?auto_228206 - SURFACE
      ?auto_228202 - TRUCK
      ?auto_228203 - PLACE
      ?auto_228204 - HOIST
      ?auto_228205 - SURFACE
      ?auto_228207 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228201 ?auto_228200 ) ( SURFACE-AT ?auto_228198 ?auto_228200 ) ( CLEAR ?auto_228198 ) ( IS-CRATE ?auto_228199 ) ( not ( = ?auto_228198 ?auto_228199 ) ) ( AVAILABLE ?auto_228201 ) ( ON ?auto_228198 ?auto_228206 ) ( not ( = ?auto_228206 ?auto_228198 ) ) ( not ( = ?auto_228206 ?auto_228199 ) ) ( TRUCK-AT ?auto_228202 ?auto_228203 ) ( not ( = ?auto_228203 ?auto_228200 ) ) ( HOIST-AT ?auto_228204 ?auto_228203 ) ( not ( = ?auto_228201 ?auto_228204 ) ) ( SURFACE-AT ?auto_228199 ?auto_228203 ) ( ON ?auto_228199 ?auto_228205 ) ( CLEAR ?auto_228199 ) ( not ( = ?auto_228198 ?auto_228205 ) ) ( not ( = ?auto_228199 ?auto_228205 ) ) ( not ( = ?auto_228206 ?auto_228205 ) ) ( LIFTING ?auto_228204 ?auto_228207 ) ( IS-CRATE ?auto_228207 ) ( not ( = ?auto_228198 ?auto_228207 ) ) ( not ( = ?auto_228199 ?auto_228207 ) ) ( not ( = ?auto_228206 ?auto_228207 ) ) ( not ( = ?auto_228205 ?auto_228207 ) ) )
    :subtasks
    ( ( !LOAD ?auto_228204 ?auto_228207 ?auto_228202 ?auto_228203 )
      ( MAKE-1CRATE ?auto_228198 ?auto_228199 )
      ( MAKE-1CRATE-VERIFY ?auto_228198 ?auto_228199 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228413 - SURFACE
      ?auto_228414 - SURFACE
      ?auto_228415 - SURFACE
      ?auto_228416 - SURFACE
      ?auto_228417 - SURFACE
      ?auto_228418 - SURFACE
      ?auto_228419 - SURFACE
    )
    :vars
    (
      ?auto_228421 - HOIST
      ?auto_228420 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228421 ?auto_228420 ) ( SURFACE-AT ?auto_228418 ?auto_228420 ) ( CLEAR ?auto_228418 ) ( LIFTING ?auto_228421 ?auto_228419 ) ( IS-CRATE ?auto_228419 ) ( not ( = ?auto_228418 ?auto_228419 ) ) ( ON ?auto_228414 ?auto_228413 ) ( ON ?auto_228415 ?auto_228414 ) ( ON ?auto_228416 ?auto_228415 ) ( ON ?auto_228417 ?auto_228416 ) ( ON ?auto_228418 ?auto_228417 ) ( not ( = ?auto_228413 ?auto_228414 ) ) ( not ( = ?auto_228413 ?auto_228415 ) ) ( not ( = ?auto_228413 ?auto_228416 ) ) ( not ( = ?auto_228413 ?auto_228417 ) ) ( not ( = ?auto_228413 ?auto_228418 ) ) ( not ( = ?auto_228413 ?auto_228419 ) ) ( not ( = ?auto_228414 ?auto_228415 ) ) ( not ( = ?auto_228414 ?auto_228416 ) ) ( not ( = ?auto_228414 ?auto_228417 ) ) ( not ( = ?auto_228414 ?auto_228418 ) ) ( not ( = ?auto_228414 ?auto_228419 ) ) ( not ( = ?auto_228415 ?auto_228416 ) ) ( not ( = ?auto_228415 ?auto_228417 ) ) ( not ( = ?auto_228415 ?auto_228418 ) ) ( not ( = ?auto_228415 ?auto_228419 ) ) ( not ( = ?auto_228416 ?auto_228417 ) ) ( not ( = ?auto_228416 ?auto_228418 ) ) ( not ( = ?auto_228416 ?auto_228419 ) ) ( not ( = ?auto_228417 ?auto_228418 ) ) ( not ( = ?auto_228417 ?auto_228419 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_228418 ?auto_228419 )
      ( MAKE-6CRATE-VERIFY ?auto_228413 ?auto_228414 ?auto_228415 ?auto_228416 ?auto_228417 ?auto_228418 ?auto_228419 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228457 - SURFACE
      ?auto_228458 - SURFACE
      ?auto_228459 - SURFACE
      ?auto_228460 - SURFACE
      ?auto_228461 - SURFACE
      ?auto_228462 - SURFACE
      ?auto_228463 - SURFACE
    )
    :vars
    (
      ?auto_228466 - HOIST
      ?auto_228465 - PLACE
      ?auto_228464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228466 ?auto_228465 ) ( SURFACE-AT ?auto_228462 ?auto_228465 ) ( CLEAR ?auto_228462 ) ( IS-CRATE ?auto_228463 ) ( not ( = ?auto_228462 ?auto_228463 ) ) ( TRUCK-AT ?auto_228464 ?auto_228465 ) ( AVAILABLE ?auto_228466 ) ( IN ?auto_228463 ?auto_228464 ) ( ON ?auto_228462 ?auto_228461 ) ( not ( = ?auto_228461 ?auto_228462 ) ) ( not ( = ?auto_228461 ?auto_228463 ) ) ( ON ?auto_228458 ?auto_228457 ) ( ON ?auto_228459 ?auto_228458 ) ( ON ?auto_228460 ?auto_228459 ) ( ON ?auto_228461 ?auto_228460 ) ( not ( = ?auto_228457 ?auto_228458 ) ) ( not ( = ?auto_228457 ?auto_228459 ) ) ( not ( = ?auto_228457 ?auto_228460 ) ) ( not ( = ?auto_228457 ?auto_228461 ) ) ( not ( = ?auto_228457 ?auto_228462 ) ) ( not ( = ?auto_228457 ?auto_228463 ) ) ( not ( = ?auto_228458 ?auto_228459 ) ) ( not ( = ?auto_228458 ?auto_228460 ) ) ( not ( = ?auto_228458 ?auto_228461 ) ) ( not ( = ?auto_228458 ?auto_228462 ) ) ( not ( = ?auto_228458 ?auto_228463 ) ) ( not ( = ?auto_228459 ?auto_228460 ) ) ( not ( = ?auto_228459 ?auto_228461 ) ) ( not ( = ?auto_228459 ?auto_228462 ) ) ( not ( = ?auto_228459 ?auto_228463 ) ) ( not ( = ?auto_228460 ?auto_228461 ) ) ( not ( = ?auto_228460 ?auto_228462 ) ) ( not ( = ?auto_228460 ?auto_228463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228461 ?auto_228462 ?auto_228463 )
      ( MAKE-6CRATE-VERIFY ?auto_228457 ?auto_228458 ?auto_228459 ?auto_228460 ?auto_228461 ?auto_228462 ?auto_228463 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228508 - SURFACE
      ?auto_228509 - SURFACE
      ?auto_228510 - SURFACE
      ?auto_228511 - SURFACE
      ?auto_228512 - SURFACE
      ?auto_228513 - SURFACE
      ?auto_228514 - SURFACE
    )
    :vars
    (
      ?auto_228518 - HOIST
      ?auto_228515 - PLACE
      ?auto_228516 - TRUCK
      ?auto_228517 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228518 ?auto_228515 ) ( SURFACE-AT ?auto_228513 ?auto_228515 ) ( CLEAR ?auto_228513 ) ( IS-CRATE ?auto_228514 ) ( not ( = ?auto_228513 ?auto_228514 ) ) ( AVAILABLE ?auto_228518 ) ( IN ?auto_228514 ?auto_228516 ) ( ON ?auto_228513 ?auto_228512 ) ( not ( = ?auto_228512 ?auto_228513 ) ) ( not ( = ?auto_228512 ?auto_228514 ) ) ( TRUCK-AT ?auto_228516 ?auto_228517 ) ( not ( = ?auto_228517 ?auto_228515 ) ) ( ON ?auto_228509 ?auto_228508 ) ( ON ?auto_228510 ?auto_228509 ) ( ON ?auto_228511 ?auto_228510 ) ( ON ?auto_228512 ?auto_228511 ) ( not ( = ?auto_228508 ?auto_228509 ) ) ( not ( = ?auto_228508 ?auto_228510 ) ) ( not ( = ?auto_228508 ?auto_228511 ) ) ( not ( = ?auto_228508 ?auto_228512 ) ) ( not ( = ?auto_228508 ?auto_228513 ) ) ( not ( = ?auto_228508 ?auto_228514 ) ) ( not ( = ?auto_228509 ?auto_228510 ) ) ( not ( = ?auto_228509 ?auto_228511 ) ) ( not ( = ?auto_228509 ?auto_228512 ) ) ( not ( = ?auto_228509 ?auto_228513 ) ) ( not ( = ?auto_228509 ?auto_228514 ) ) ( not ( = ?auto_228510 ?auto_228511 ) ) ( not ( = ?auto_228510 ?auto_228512 ) ) ( not ( = ?auto_228510 ?auto_228513 ) ) ( not ( = ?auto_228510 ?auto_228514 ) ) ( not ( = ?auto_228511 ?auto_228512 ) ) ( not ( = ?auto_228511 ?auto_228513 ) ) ( not ( = ?auto_228511 ?auto_228514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228512 ?auto_228513 ?auto_228514 )
      ( MAKE-6CRATE-VERIFY ?auto_228508 ?auto_228509 ?auto_228510 ?auto_228511 ?auto_228512 ?auto_228513 ?auto_228514 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228565 - SURFACE
      ?auto_228566 - SURFACE
      ?auto_228567 - SURFACE
      ?auto_228568 - SURFACE
      ?auto_228569 - SURFACE
      ?auto_228570 - SURFACE
      ?auto_228571 - SURFACE
    )
    :vars
    (
      ?auto_228572 - HOIST
      ?auto_228574 - PLACE
      ?auto_228576 - TRUCK
      ?auto_228573 - PLACE
      ?auto_228575 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_228572 ?auto_228574 ) ( SURFACE-AT ?auto_228570 ?auto_228574 ) ( CLEAR ?auto_228570 ) ( IS-CRATE ?auto_228571 ) ( not ( = ?auto_228570 ?auto_228571 ) ) ( AVAILABLE ?auto_228572 ) ( ON ?auto_228570 ?auto_228569 ) ( not ( = ?auto_228569 ?auto_228570 ) ) ( not ( = ?auto_228569 ?auto_228571 ) ) ( TRUCK-AT ?auto_228576 ?auto_228573 ) ( not ( = ?auto_228573 ?auto_228574 ) ) ( HOIST-AT ?auto_228575 ?auto_228573 ) ( LIFTING ?auto_228575 ?auto_228571 ) ( not ( = ?auto_228572 ?auto_228575 ) ) ( ON ?auto_228566 ?auto_228565 ) ( ON ?auto_228567 ?auto_228566 ) ( ON ?auto_228568 ?auto_228567 ) ( ON ?auto_228569 ?auto_228568 ) ( not ( = ?auto_228565 ?auto_228566 ) ) ( not ( = ?auto_228565 ?auto_228567 ) ) ( not ( = ?auto_228565 ?auto_228568 ) ) ( not ( = ?auto_228565 ?auto_228569 ) ) ( not ( = ?auto_228565 ?auto_228570 ) ) ( not ( = ?auto_228565 ?auto_228571 ) ) ( not ( = ?auto_228566 ?auto_228567 ) ) ( not ( = ?auto_228566 ?auto_228568 ) ) ( not ( = ?auto_228566 ?auto_228569 ) ) ( not ( = ?auto_228566 ?auto_228570 ) ) ( not ( = ?auto_228566 ?auto_228571 ) ) ( not ( = ?auto_228567 ?auto_228568 ) ) ( not ( = ?auto_228567 ?auto_228569 ) ) ( not ( = ?auto_228567 ?auto_228570 ) ) ( not ( = ?auto_228567 ?auto_228571 ) ) ( not ( = ?auto_228568 ?auto_228569 ) ) ( not ( = ?auto_228568 ?auto_228570 ) ) ( not ( = ?auto_228568 ?auto_228571 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228569 ?auto_228570 ?auto_228571 )
      ( MAKE-6CRATE-VERIFY ?auto_228565 ?auto_228566 ?auto_228567 ?auto_228568 ?auto_228569 ?auto_228570 ?auto_228571 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228628 - SURFACE
      ?auto_228629 - SURFACE
      ?auto_228630 - SURFACE
      ?auto_228631 - SURFACE
      ?auto_228632 - SURFACE
      ?auto_228633 - SURFACE
      ?auto_228634 - SURFACE
    )
    :vars
    (
      ?auto_228640 - HOIST
      ?auto_228636 - PLACE
      ?auto_228638 - TRUCK
      ?auto_228637 - PLACE
      ?auto_228635 - HOIST
      ?auto_228639 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_228640 ?auto_228636 ) ( SURFACE-AT ?auto_228633 ?auto_228636 ) ( CLEAR ?auto_228633 ) ( IS-CRATE ?auto_228634 ) ( not ( = ?auto_228633 ?auto_228634 ) ) ( AVAILABLE ?auto_228640 ) ( ON ?auto_228633 ?auto_228632 ) ( not ( = ?auto_228632 ?auto_228633 ) ) ( not ( = ?auto_228632 ?auto_228634 ) ) ( TRUCK-AT ?auto_228638 ?auto_228637 ) ( not ( = ?auto_228637 ?auto_228636 ) ) ( HOIST-AT ?auto_228635 ?auto_228637 ) ( not ( = ?auto_228640 ?auto_228635 ) ) ( AVAILABLE ?auto_228635 ) ( SURFACE-AT ?auto_228634 ?auto_228637 ) ( ON ?auto_228634 ?auto_228639 ) ( CLEAR ?auto_228634 ) ( not ( = ?auto_228633 ?auto_228639 ) ) ( not ( = ?auto_228634 ?auto_228639 ) ) ( not ( = ?auto_228632 ?auto_228639 ) ) ( ON ?auto_228629 ?auto_228628 ) ( ON ?auto_228630 ?auto_228629 ) ( ON ?auto_228631 ?auto_228630 ) ( ON ?auto_228632 ?auto_228631 ) ( not ( = ?auto_228628 ?auto_228629 ) ) ( not ( = ?auto_228628 ?auto_228630 ) ) ( not ( = ?auto_228628 ?auto_228631 ) ) ( not ( = ?auto_228628 ?auto_228632 ) ) ( not ( = ?auto_228628 ?auto_228633 ) ) ( not ( = ?auto_228628 ?auto_228634 ) ) ( not ( = ?auto_228628 ?auto_228639 ) ) ( not ( = ?auto_228629 ?auto_228630 ) ) ( not ( = ?auto_228629 ?auto_228631 ) ) ( not ( = ?auto_228629 ?auto_228632 ) ) ( not ( = ?auto_228629 ?auto_228633 ) ) ( not ( = ?auto_228629 ?auto_228634 ) ) ( not ( = ?auto_228629 ?auto_228639 ) ) ( not ( = ?auto_228630 ?auto_228631 ) ) ( not ( = ?auto_228630 ?auto_228632 ) ) ( not ( = ?auto_228630 ?auto_228633 ) ) ( not ( = ?auto_228630 ?auto_228634 ) ) ( not ( = ?auto_228630 ?auto_228639 ) ) ( not ( = ?auto_228631 ?auto_228632 ) ) ( not ( = ?auto_228631 ?auto_228633 ) ) ( not ( = ?auto_228631 ?auto_228634 ) ) ( not ( = ?auto_228631 ?auto_228639 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228632 ?auto_228633 ?auto_228634 )
      ( MAKE-6CRATE-VERIFY ?auto_228628 ?auto_228629 ?auto_228630 ?auto_228631 ?auto_228632 ?auto_228633 ?auto_228634 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228692 - SURFACE
      ?auto_228693 - SURFACE
      ?auto_228694 - SURFACE
      ?auto_228695 - SURFACE
      ?auto_228696 - SURFACE
      ?auto_228697 - SURFACE
      ?auto_228698 - SURFACE
    )
    :vars
    (
      ?auto_228699 - HOIST
      ?auto_228701 - PLACE
      ?auto_228700 - PLACE
      ?auto_228702 - HOIST
      ?auto_228703 - SURFACE
      ?auto_228704 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228699 ?auto_228701 ) ( SURFACE-AT ?auto_228697 ?auto_228701 ) ( CLEAR ?auto_228697 ) ( IS-CRATE ?auto_228698 ) ( not ( = ?auto_228697 ?auto_228698 ) ) ( AVAILABLE ?auto_228699 ) ( ON ?auto_228697 ?auto_228696 ) ( not ( = ?auto_228696 ?auto_228697 ) ) ( not ( = ?auto_228696 ?auto_228698 ) ) ( not ( = ?auto_228700 ?auto_228701 ) ) ( HOIST-AT ?auto_228702 ?auto_228700 ) ( not ( = ?auto_228699 ?auto_228702 ) ) ( AVAILABLE ?auto_228702 ) ( SURFACE-AT ?auto_228698 ?auto_228700 ) ( ON ?auto_228698 ?auto_228703 ) ( CLEAR ?auto_228698 ) ( not ( = ?auto_228697 ?auto_228703 ) ) ( not ( = ?auto_228698 ?auto_228703 ) ) ( not ( = ?auto_228696 ?auto_228703 ) ) ( TRUCK-AT ?auto_228704 ?auto_228701 ) ( ON ?auto_228693 ?auto_228692 ) ( ON ?auto_228694 ?auto_228693 ) ( ON ?auto_228695 ?auto_228694 ) ( ON ?auto_228696 ?auto_228695 ) ( not ( = ?auto_228692 ?auto_228693 ) ) ( not ( = ?auto_228692 ?auto_228694 ) ) ( not ( = ?auto_228692 ?auto_228695 ) ) ( not ( = ?auto_228692 ?auto_228696 ) ) ( not ( = ?auto_228692 ?auto_228697 ) ) ( not ( = ?auto_228692 ?auto_228698 ) ) ( not ( = ?auto_228692 ?auto_228703 ) ) ( not ( = ?auto_228693 ?auto_228694 ) ) ( not ( = ?auto_228693 ?auto_228695 ) ) ( not ( = ?auto_228693 ?auto_228696 ) ) ( not ( = ?auto_228693 ?auto_228697 ) ) ( not ( = ?auto_228693 ?auto_228698 ) ) ( not ( = ?auto_228693 ?auto_228703 ) ) ( not ( = ?auto_228694 ?auto_228695 ) ) ( not ( = ?auto_228694 ?auto_228696 ) ) ( not ( = ?auto_228694 ?auto_228697 ) ) ( not ( = ?auto_228694 ?auto_228698 ) ) ( not ( = ?auto_228694 ?auto_228703 ) ) ( not ( = ?auto_228695 ?auto_228696 ) ) ( not ( = ?auto_228695 ?auto_228697 ) ) ( not ( = ?auto_228695 ?auto_228698 ) ) ( not ( = ?auto_228695 ?auto_228703 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228696 ?auto_228697 ?auto_228698 )
      ( MAKE-6CRATE-VERIFY ?auto_228692 ?auto_228693 ?auto_228694 ?auto_228695 ?auto_228696 ?auto_228697 ?auto_228698 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228756 - SURFACE
      ?auto_228757 - SURFACE
      ?auto_228758 - SURFACE
      ?auto_228759 - SURFACE
      ?auto_228760 - SURFACE
      ?auto_228761 - SURFACE
      ?auto_228762 - SURFACE
    )
    :vars
    (
      ?auto_228763 - HOIST
      ?auto_228768 - PLACE
      ?auto_228767 - PLACE
      ?auto_228766 - HOIST
      ?auto_228765 - SURFACE
      ?auto_228764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228763 ?auto_228768 ) ( IS-CRATE ?auto_228762 ) ( not ( = ?auto_228761 ?auto_228762 ) ) ( not ( = ?auto_228760 ?auto_228761 ) ) ( not ( = ?auto_228760 ?auto_228762 ) ) ( not ( = ?auto_228767 ?auto_228768 ) ) ( HOIST-AT ?auto_228766 ?auto_228767 ) ( not ( = ?auto_228763 ?auto_228766 ) ) ( AVAILABLE ?auto_228766 ) ( SURFACE-AT ?auto_228762 ?auto_228767 ) ( ON ?auto_228762 ?auto_228765 ) ( CLEAR ?auto_228762 ) ( not ( = ?auto_228761 ?auto_228765 ) ) ( not ( = ?auto_228762 ?auto_228765 ) ) ( not ( = ?auto_228760 ?auto_228765 ) ) ( TRUCK-AT ?auto_228764 ?auto_228768 ) ( SURFACE-AT ?auto_228760 ?auto_228768 ) ( CLEAR ?auto_228760 ) ( LIFTING ?auto_228763 ?auto_228761 ) ( IS-CRATE ?auto_228761 ) ( ON ?auto_228757 ?auto_228756 ) ( ON ?auto_228758 ?auto_228757 ) ( ON ?auto_228759 ?auto_228758 ) ( ON ?auto_228760 ?auto_228759 ) ( not ( = ?auto_228756 ?auto_228757 ) ) ( not ( = ?auto_228756 ?auto_228758 ) ) ( not ( = ?auto_228756 ?auto_228759 ) ) ( not ( = ?auto_228756 ?auto_228760 ) ) ( not ( = ?auto_228756 ?auto_228761 ) ) ( not ( = ?auto_228756 ?auto_228762 ) ) ( not ( = ?auto_228756 ?auto_228765 ) ) ( not ( = ?auto_228757 ?auto_228758 ) ) ( not ( = ?auto_228757 ?auto_228759 ) ) ( not ( = ?auto_228757 ?auto_228760 ) ) ( not ( = ?auto_228757 ?auto_228761 ) ) ( not ( = ?auto_228757 ?auto_228762 ) ) ( not ( = ?auto_228757 ?auto_228765 ) ) ( not ( = ?auto_228758 ?auto_228759 ) ) ( not ( = ?auto_228758 ?auto_228760 ) ) ( not ( = ?auto_228758 ?auto_228761 ) ) ( not ( = ?auto_228758 ?auto_228762 ) ) ( not ( = ?auto_228758 ?auto_228765 ) ) ( not ( = ?auto_228759 ?auto_228760 ) ) ( not ( = ?auto_228759 ?auto_228761 ) ) ( not ( = ?auto_228759 ?auto_228762 ) ) ( not ( = ?auto_228759 ?auto_228765 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228760 ?auto_228761 ?auto_228762 )
      ( MAKE-6CRATE-VERIFY ?auto_228756 ?auto_228757 ?auto_228758 ?auto_228759 ?auto_228760 ?auto_228761 ?auto_228762 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_228820 - SURFACE
      ?auto_228821 - SURFACE
      ?auto_228822 - SURFACE
      ?auto_228823 - SURFACE
      ?auto_228824 - SURFACE
      ?auto_228825 - SURFACE
      ?auto_228826 - SURFACE
    )
    :vars
    (
      ?auto_228830 - HOIST
      ?auto_228827 - PLACE
      ?auto_228831 - PLACE
      ?auto_228829 - HOIST
      ?auto_228832 - SURFACE
      ?auto_228828 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_228830 ?auto_228827 ) ( IS-CRATE ?auto_228826 ) ( not ( = ?auto_228825 ?auto_228826 ) ) ( not ( = ?auto_228824 ?auto_228825 ) ) ( not ( = ?auto_228824 ?auto_228826 ) ) ( not ( = ?auto_228831 ?auto_228827 ) ) ( HOIST-AT ?auto_228829 ?auto_228831 ) ( not ( = ?auto_228830 ?auto_228829 ) ) ( AVAILABLE ?auto_228829 ) ( SURFACE-AT ?auto_228826 ?auto_228831 ) ( ON ?auto_228826 ?auto_228832 ) ( CLEAR ?auto_228826 ) ( not ( = ?auto_228825 ?auto_228832 ) ) ( not ( = ?auto_228826 ?auto_228832 ) ) ( not ( = ?auto_228824 ?auto_228832 ) ) ( TRUCK-AT ?auto_228828 ?auto_228827 ) ( SURFACE-AT ?auto_228824 ?auto_228827 ) ( CLEAR ?auto_228824 ) ( IS-CRATE ?auto_228825 ) ( AVAILABLE ?auto_228830 ) ( IN ?auto_228825 ?auto_228828 ) ( ON ?auto_228821 ?auto_228820 ) ( ON ?auto_228822 ?auto_228821 ) ( ON ?auto_228823 ?auto_228822 ) ( ON ?auto_228824 ?auto_228823 ) ( not ( = ?auto_228820 ?auto_228821 ) ) ( not ( = ?auto_228820 ?auto_228822 ) ) ( not ( = ?auto_228820 ?auto_228823 ) ) ( not ( = ?auto_228820 ?auto_228824 ) ) ( not ( = ?auto_228820 ?auto_228825 ) ) ( not ( = ?auto_228820 ?auto_228826 ) ) ( not ( = ?auto_228820 ?auto_228832 ) ) ( not ( = ?auto_228821 ?auto_228822 ) ) ( not ( = ?auto_228821 ?auto_228823 ) ) ( not ( = ?auto_228821 ?auto_228824 ) ) ( not ( = ?auto_228821 ?auto_228825 ) ) ( not ( = ?auto_228821 ?auto_228826 ) ) ( not ( = ?auto_228821 ?auto_228832 ) ) ( not ( = ?auto_228822 ?auto_228823 ) ) ( not ( = ?auto_228822 ?auto_228824 ) ) ( not ( = ?auto_228822 ?auto_228825 ) ) ( not ( = ?auto_228822 ?auto_228826 ) ) ( not ( = ?auto_228822 ?auto_228832 ) ) ( not ( = ?auto_228823 ?auto_228824 ) ) ( not ( = ?auto_228823 ?auto_228825 ) ) ( not ( = ?auto_228823 ?auto_228826 ) ) ( not ( = ?auto_228823 ?auto_228832 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_228824 ?auto_228825 ?auto_228826 )
      ( MAKE-6CRATE-VERIFY ?auto_228820 ?auto_228821 ?auto_228822 ?auto_228823 ?auto_228824 ?auto_228825 ?auto_228826 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230743 - SURFACE
      ?auto_230744 - SURFACE
      ?auto_230745 - SURFACE
      ?auto_230746 - SURFACE
      ?auto_230747 - SURFACE
      ?auto_230748 - SURFACE
      ?auto_230749 - SURFACE
      ?auto_230750 - SURFACE
    )
    :vars
    (
      ?auto_230752 - HOIST
      ?auto_230751 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230752 ?auto_230751 ) ( SURFACE-AT ?auto_230749 ?auto_230751 ) ( CLEAR ?auto_230749 ) ( LIFTING ?auto_230752 ?auto_230750 ) ( IS-CRATE ?auto_230750 ) ( not ( = ?auto_230749 ?auto_230750 ) ) ( ON ?auto_230744 ?auto_230743 ) ( ON ?auto_230745 ?auto_230744 ) ( ON ?auto_230746 ?auto_230745 ) ( ON ?auto_230747 ?auto_230746 ) ( ON ?auto_230748 ?auto_230747 ) ( ON ?auto_230749 ?auto_230748 ) ( not ( = ?auto_230743 ?auto_230744 ) ) ( not ( = ?auto_230743 ?auto_230745 ) ) ( not ( = ?auto_230743 ?auto_230746 ) ) ( not ( = ?auto_230743 ?auto_230747 ) ) ( not ( = ?auto_230743 ?auto_230748 ) ) ( not ( = ?auto_230743 ?auto_230749 ) ) ( not ( = ?auto_230743 ?auto_230750 ) ) ( not ( = ?auto_230744 ?auto_230745 ) ) ( not ( = ?auto_230744 ?auto_230746 ) ) ( not ( = ?auto_230744 ?auto_230747 ) ) ( not ( = ?auto_230744 ?auto_230748 ) ) ( not ( = ?auto_230744 ?auto_230749 ) ) ( not ( = ?auto_230744 ?auto_230750 ) ) ( not ( = ?auto_230745 ?auto_230746 ) ) ( not ( = ?auto_230745 ?auto_230747 ) ) ( not ( = ?auto_230745 ?auto_230748 ) ) ( not ( = ?auto_230745 ?auto_230749 ) ) ( not ( = ?auto_230745 ?auto_230750 ) ) ( not ( = ?auto_230746 ?auto_230747 ) ) ( not ( = ?auto_230746 ?auto_230748 ) ) ( not ( = ?auto_230746 ?auto_230749 ) ) ( not ( = ?auto_230746 ?auto_230750 ) ) ( not ( = ?auto_230747 ?auto_230748 ) ) ( not ( = ?auto_230747 ?auto_230749 ) ) ( not ( = ?auto_230747 ?auto_230750 ) ) ( not ( = ?auto_230748 ?auto_230749 ) ) ( not ( = ?auto_230748 ?auto_230750 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_230749 ?auto_230750 )
      ( MAKE-7CRATE-VERIFY ?auto_230743 ?auto_230744 ?auto_230745 ?auto_230746 ?auto_230747 ?auto_230748 ?auto_230749 ?auto_230750 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230798 - SURFACE
      ?auto_230799 - SURFACE
      ?auto_230800 - SURFACE
      ?auto_230801 - SURFACE
      ?auto_230802 - SURFACE
      ?auto_230803 - SURFACE
      ?auto_230804 - SURFACE
      ?auto_230805 - SURFACE
    )
    :vars
    (
      ?auto_230808 - HOIST
      ?auto_230807 - PLACE
      ?auto_230806 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_230808 ?auto_230807 ) ( SURFACE-AT ?auto_230804 ?auto_230807 ) ( CLEAR ?auto_230804 ) ( IS-CRATE ?auto_230805 ) ( not ( = ?auto_230804 ?auto_230805 ) ) ( TRUCK-AT ?auto_230806 ?auto_230807 ) ( AVAILABLE ?auto_230808 ) ( IN ?auto_230805 ?auto_230806 ) ( ON ?auto_230804 ?auto_230803 ) ( not ( = ?auto_230803 ?auto_230804 ) ) ( not ( = ?auto_230803 ?auto_230805 ) ) ( ON ?auto_230799 ?auto_230798 ) ( ON ?auto_230800 ?auto_230799 ) ( ON ?auto_230801 ?auto_230800 ) ( ON ?auto_230802 ?auto_230801 ) ( ON ?auto_230803 ?auto_230802 ) ( not ( = ?auto_230798 ?auto_230799 ) ) ( not ( = ?auto_230798 ?auto_230800 ) ) ( not ( = ?auto_230798 ?auto_230801 ) ) ( not ( = ?auto_230798 ?auto_230802 ) ) ( not ( = ?auto_230798 ?auto_230803 ) ) ( not ( = ?auto_230798 ?auto_230804 ) ) ( not ( = ?auto_230798 ?auto_230805 ) ) ( not ( = ?auto_230799 ?auto_230800 ) ) ( not ( = ?auto_230799 ?auto_230801 ) ) ( not ( = ?auto_230799 ?auto_230802 ) ) ( not ( = ?auto_230799 ?auto_230803 ) ) ( not ( = ?auto_230799 ?auto_230804 ) ) ( not ( = ?auto_230799 ?auto_230805 ) ) ( not ( = ?auto_230800 ?auto_230801 ) ) ( not ( = ?auto_230800 ?auto_230802 ) ) ( not ( = ?auto_230800 ?auto_230803 ) ) ( not ( = ?auto_230800 ?auto_230804 ) ) ( not ( = ?auto_230800 ?auto_230805 ) ) ( not ( = ?auto_230801 ?auto_230802 ) ) ( not ( = ?auto_230801 ?auto_230803 ) ) ( not ( = ?auto_230801 ?auto_230804 ) ) ( not ( = ?auto_230801 ?auto_230805 ) ) ( not ( = ?auto_230802 ?auto_230803 ) ) ( not ( = ?auto_230802 ?auto_230804 ) ) ( not ( = ?auto_230802 ?auto_230805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230803 ?auto_230804 ?auto_230805 )
      ( MAKE-7CRATE-VERIFY ?auto_230798 ?auto_230799 ?auto_230800 ?auto_230801 ?auto_230802 ?auto_230803 ?auto_230804 ?auto_230805 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230861 - SURFACE
      ?auto_230862 - SURFACE
      ?auto_230863 - SURFACE
      ?auto_230864 - SURFACE
      ?auto_230865 - SURFACE
      ?auto_230866 - SURFACE
      ?auto_230867 - SURFACE
      ?auto_230868 - SURFACE
    )
    :vars
    (
      ?auto_230871 - HOIST
      ?auto_230869 - PLACE
      ?auto_230872 - TRUCK
      ?auto_230870 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_230871 ?auto_230869 ) ( SURFACE-AT ?auto_230867 ?auto_230869 ) ( CLEAR ?auto_230867 ) ( IS-CRATE ?auto_230868 ) ( not ( = ?auto_230867 ?auto_230868 ) ) ( AVAILABLE ?auto_230871 ) ( IN ?auto_230868 ?auto_230872 ) ( ON ?auto_230867 ?auto_230866 ) ( not ( = ?auto_230866 ?auto_230867 ) ) ( not ( = ?auto_230866 ?auto_230868 ) ) ( TRUCK-AT ?auto_230872 ?auto_230870 ) ( not ( = ?auto_230870 ?auto_230869 ) ) ( ON ?auto_230862 ?auto_230861 ) ( ON ?auto_230863 ?auto_230862 ) ( ON ?auto_230864 ?auto_230863 ) ( ON ?auto_230865 ?auto_230864 ) ( ON ?auto_230866 ?auto_230865 ) ( not ( = ?auto_230861 ?auto_230862 ) ) ( not ( = ?auto_230861 ?auto_230863 ) ) ( not ( = ?auto_230861 ?auto_230864 ) ) ( not ( = ?auto_230861 ?auto_230865 ) ) ( not ( = ?auto_230861 ?auto_230866 ) ) ( not ( = ?auto_230861 ?auto_230867 ) ) ( not ( = ?auto_230861 ?auto_230868 ) ) ( not ( = ?auto_230862 ?auto_230863 ) ) ( not ( = ?auto_230862 ?auto_230864 ) ) ( not ( = ?auto_230862 ?auto_230865 ) ) ( not ( = ?auto_230862 ?auto_230866 ) ) ( not ( = ?auto_230862 ?auto_230867 ) ) ( not ( = ?auto_230862 ?auto_230868 ) ) ( not ( = ?auto_230863 ?auto_230864 ) ) ( not ( = ?auto_230863 ?auto_230865 ) ) ( not ( = ?auto_230863 ?auto_230866 ) ) ( not ( = ?auto_230863 ?auto_230867 ) ) ( not ( = ?auto_230863 ?auto_230868 ) ) ( not ( = ?auto_230864 ?auto_230865 ) ) ( not ( = ?auto_230864 ?auto_230866 ) ) ( not ( = ?auto_230864 ?auto_230867 ) ) ( not ( = ?auto_230864 ?auto_230868 ) ) ( not ( = ?auto_230865 ?auto_230866 ) ) ( not ( = ?auto_230865 ?auto_230867 ) ) ( not ( = ?auto_230865 ?auto_230868 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230866 ?auto_230867 ?auto_230868 )
      ( MAKE-7CRATE-VERIFY ?auto_230861 ?auto_230862 ?auto_230863 ?auto_230864 ?auto_230865 ?auto_230866 ?auto_230867 ?auto_230868 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_230931 - SURFACE
      ?auto_230932 - SURFACE
      ?auto_230933 - SURFACE
      ?auto_230934 - SURFACE
      ?auto_230935 - SURFACE
      ?auto_230936 - SURFACE
      ?auto_230937 - SURFACE
      ?auto_230938 - SURFACE
    )
    :vars
    (
      ?auto_230942 - HOIST
      ?auto_230940 - PLACE
      ?auto_230939 - TRUCK
      ?auto_230943 - PLACE
      ?auto_230941 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_230942 ?auto_230940 ) ( SURFACE-AT ?auto_230937 ?auto_230940 ) ( CLEAR ?auto_230937 ) ( IS-CRATE ?auto_230938 ) ( not ( = ?auto_230937 ?auto_230938 ) ) ( AVAILABLE ?auto_230942 ) ( ON ?auto_230937 ?auto_230936 ) ( not ( = ?auto_230936 ?auto_230937 ) ) ( not ( = ?auto_230936 ?auto_230938 ) ) ( TRUCK-AT ?auto_230939 ?auto_230943 ) ( not ( = ?auto_230943 ?auto_230940 ) ) ( HOIST-AT ?auto_230941 ?auto_230943 ) ( LIFTING ?auto_230941 ?auto_230938 ) ( not ( = ?auto_230942 ?auto_230941 ) ) ( ON ?auto_230932 ?auto_230931 ) ( ON ?auto_230933 ?auto_230932 ) ( ON ?auto_230934 ?auto_230933 ) ( ON ?auto_230935 ?auto_230934 ) ( ON ?auto_230936 ?auto_230935 ) ( not ( = ?auto_230931 ?auto_230932 ) ) ( not ( = ?auto_230931 ?auto_230933 ) ) ( not ( = ?auto_230931 ?auto_230934 ) ) ( not ( = ?auto_230931 ?auto_230935 ) ) ( not ( = ?auto_230931 ?auto_230936 ) ) ( not ( = ?auto_230931 ?auto_230937 ) ) ( not ( = ?auto_230931 ?auto_230938 ) ) ( not ( = ?auto_230932 ?auto_230933 ) ) ( not ( = ?auto_230932 ?auto_230934 ) ) ( not ( = ?auto_230932 ?auto_230935 ) ) ( not ( = ?auto_230932 ?auto_230936 ) ) ( not ( = ?auto_230932 ?auto_230937 ) ) ( not ( = ?auto_230932 ?auto_230938 ) ) ( not ( = ?auto_230933 ?auto_230934 ) ) ( not ( = ?auto_230933 ?auto_230935 ) ) ( not ( = ?auto_230933 ?auto_230936 ) ) ( not ( = ?auto_230933 ?auto_230937 ) ) ( not ( = ?auto_230933 ?auto_230938 ) ) ( not ( = ?auto_230934 ?auto_230935 ) ) ( not ( = ?auto_230934 ?auto_230936 ) ) ( not ( = ?auto_230934 ?auto_230937 ) ) ( not ( = ?auto_230934 ?auto_230938 ) ) ( not ( = ?auto_230935 ?auto_230936 ) ) ( not ( = ?auto_230935 ?auto_230937 ) ) ( not ( = ?auto_230935 ?auto_230938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_230936 ?auto_230937 ?auto_230938 )
      ( MAKE-7CRATE-VERIFY ?auto_230931 ?auto_230932 ?auto_230933 ?auto_230934 ?auto_230935 ?auto_230936 ?auto_230937 ?auto_230938 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231008 - SURFACE
      ?auto_231009 - SURFACE
      ?auto_231010 - SURFACE
      ?auto_231011 - SURFACE
      ?auto_231012 - SURFACE
      ?auto_231013 - SURFACE
      ?auto_231014 - SURFACE
      ?auto_231015 - SURFACE
    )
    :vars
    (
      ?auto_231021 - HOIST
      ?auto_231020 - PLACE
      ?auto_231017 - TRUCK
      ?auto_231019 - PLACE
      ?auto_231016 - HOIST
      ?auto_231018 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_231021 ?auto_231020 ) ( SURFACE-AT ?auto_231014 ?auto_231020 ) ( CLEAR ?auto_231014 ) ( IS-CRATE ?auto_231015 ) ( not ( = ?auto_231014 ?auto_231015 ) ) ( AVAILABLE ?auto_231021 ) ( ON ?auto_231014 ?auto_231013 ) ( not ( = ?auto_231013 ?auto_231014 ) ) ( not ( = ?auto_231013 ?auto_231015 ) ) ( TRUCK-AT ?auto_231017 ?auto_231019 ) ( not ( = ?auto_231019 ?auto_231020 ) ) ( HOIST-AT ?auto_231016 ?auto_231019 ) ( not ( = ?auto_231021 ?auto_231016 ) ) ( AVAILABLE ?auto_231016 ) ( SURFACE-AT ?auto_231015 ?auto_231019 ) ( ON ?auto_231015 ?auto_231018 ) ( CLEAR ?auto_231015 ) ( not ( = ?auto_231014 ?auto_231018 ) ) ( not ( = ?auto_231015 ?auto_231018 ) ) ( not ( = ?auto_231013 ?auto_231018 ) ) ( ON ?auto_231009 ?auto_231008 ) ( ON ?auto_231010 ?auto_231009 ) ( ON ?auto_231011 ?auto_231010 ) ( ON ?auto_231012 ?auto_231011 ) ( ON ?auto_231013 ?auto_231012 ) ( not ( = ?auto_231008 ?auto_231009 ) ) ( not ( = ?auto_231008 ?auto_231010 ) ) ( not ( = ?auto_231008 ?auto_231011 ) ) ( not ( = ?auto_231008 ?auto_231012 ) ) ( not ( = ?auto_231008 ?auto_231013 ) ) ( not ( = ?auto_231008 ?auto_231014 ) ) ( not ( = ?auto_231008 ?auto_231015 ) ) ( not ( = ?auto_231008 ?auto_231018 ) ) ( not ( = ?auto_231009 ?auto_231010 ) ) ( not ( = ?auto_231009 ?auto_231011 ) ) ( not ( = ?auto_231009 ?auto_231012 ) ) ( not ( = ?auto_231009 ?auto_231013 ) ) ( not ( = ?auto_231009 ?auto_231014 ) ) ( not ( = ?auto_231009 ?auto_231015 ) ) ( not ( = ?auto_231009 ?auto_231018 ) ) ( not ( = ?auto_231010 ?auto_231011 ) ) ( not ( = ?auto_231010 ?auto_231012 ) ) ( not ( = ?auto_231010 ?auto_231013 ) ) ( not ( = ?auto_231010 ?auto_231014 ) ) ( not ( = ?auto_231010 ?auto_231015 ) ) ( not ( = ?auto_231010 ?auto_231018 ) ) ( not ( = ?auto_231011 ?auto_231012 ) ) ( not ( = ?auto_231011 ?auto_231013 ) ) ( not ( = ?auto_231011 ?auto_231014 ) ) ( not ( = ?auto_231011 ?auto_231015 ) ) ( not ( = ?auto_231011 ?auto_231018 ) ) ( not ( = ?auto_231012 ?auto_231013 ) ) ( not ( = ?auto_231012 ?auto_231014 ) ) ( not ( = ?auto_231012 ?auto_231015 ) ) ( not ( = ?auto_231012 ?auto_231018 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231013 ?auto_231014 ?auto_231015 )
      ( MAKE-7CRATE-VERIFY ?auto_231008 ?auto_231009 ?auto_231010 ?auto_231011 ?auto_231012 ?auto_231013 ?auto_231014 ?auto_231015 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231086 - SURFACE
      ?auto_231087 - SURFACE
      ?auto_231088 - SURFACE
      ?auto_231089 - SURFACE
      ?auto_231090 - SURFACE
      ?auto_231091 - SURFACE
      ?auto_231092 - SURFACE
      ?auto_231093 - SURFACE
    )
    :vars
    (
      ?auto_231098 - HOIST
      ?auto_231094 - PLACE
      ?auto_231097 - PLACE
      ?auto_231099 - HOIST
      ?auto_231095 - SURFACE
      ?auto_231096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231098 ?auto_231094 ) ( SURFACE-AT ?auto_231092 ?auto_231094 ) ( CLEAR ?auto_231092 ) ( IS-CRATE ?auto_231093 ) ( not ( = ?auto_231092 ?auto_231093 ) ) ( AVAILABLE ?auto_231098 ) ( ON ?auto_231092 ?auto_231091 ) ( not ( = ?auto_231091 ?auto_231092 ) ) ( not ( = ?auto_231091 ?auto_231093 ) ) ( not ( = ?auto_231097 ?auto_231094 ) ) ( HOIST-AT ?auto_231099 ?auto_231097 ) ( not ( = ?auto_231098 ?auto_231099 ) ) ( AVAILABLE ?auto_231099 ) ( SURFACE-AT ?auto_231093 ?auto_231097 ) ( ON ?auto_231093 ?auto_231095 ) ( CLEAR ?auto_231093 ) ( not ( = ?auto_231092 ?auto_231095 ) ) ( not ( = ?auto_231093 ?auto_231095 ) ) ( not ( = ?auto_231091 ?auto_231095 ) ) ( TRUCK-AT ?auto_231096 ?auto_231094 ) ( ON ?auto_231087 ?auto_231086 ) ( ON ?auto_231088 ?auto_231087 ) ( ON ?auto_231089 ?auto_231088 ) ( ON ?auto_231090 ?auto_231089 ) ( ON ?auto_231091 ?auto_231090 ) ( not ( = ?auto_231086 ?auto_231087 ) ) ( not ( = ?auto_231086 ?auto_231088 ) ) ( not ( = ?auto_231086 ?auto_231089 ) ) ( not ( = ?auto_231086 ?auto_231090 ) ) ( not ( = ?auto_231086 ?auto_231091 ) ) ( not ( = ?auto_231086 ?auto_231092 ) ) ( not ( = ?auto_231086 ?auto_231093 ) ) ( not ( = ?auto_231086 ?auto_231095 ) ) ( not ( = ?auto_231087 ?auto_231088 ) ) ( not ( = ?auto_231087 ?auto_231089 ) ) ( not ( = ?auto_231087 ?auto_231090 ) ) ( not ( = ?auto_231087 ?auto_231091 ) ) ( not ( = ?auto_231087 ?auto_231092 ) ) ( not ( = ?auto_231087 ?auto_231093 ) ) ( not ( = ?auto_231087 ?auto_231095 ) ) ( not ( = ?auto_231088 ?auto_231089 ) ) ( not ( = ?auto_231088 ?auto_231090 ) ) ( not ( = ?auto_231088 ?auto_231091 ) ) ( not ( = ?auto_231088 ?auto_231092 ) ) ( not ( = ?auto_231088 ?auto_231093 ) ) ( not ( = ?auto_231088 ?auto_231095 ) ) ( not ( = ?auto_231089 ?auto_231090 ) ) ( not ( = ?auto_231089 ?auto_231091 ) ) ( not ( = ?auto_231089 ?auto_231092 ) ) ( not ( = ?auto_231089 ?auto_231093 ) ) ( not ( = ?auto_231089 ?auto_231095 ) ) ( not ( = ?auto_231090 ?auto_231091 ) ) ( not ( = ?auto_231090 ?auto_231092 ) ) ( not ( = ?auto_231090 ?auto_231093 ) ) ( not ( = ?auto_231090 ?auto_231095 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231091 ?auto_231092 ?auto_231093 )
      ( MAKE-7CRATE-VERIFY ?auto_231086 ?auto_231087 ?auto_231088 ?auto_231089 ?auto_231090 ?auto_231091 ?auto_231092 ?auto_231093 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231164 - SURFACE
      ?auto_231165 - SURFACE
      ?auto_231166 - SURFACE
      ?auto_231167 - SURFACE
      ?auto_231168 - SURFACE
      ?auto_231169 - SURFACE
      ?auto_231170 - SURFACE
      ?auto_231171 - SURFACE
    )
    :vars
    (
      ?auto_231174 - HOIST
      ?auto_231176 - PLACE
      ?auto_231175 - PLACE
      ?auto_231173 - HOIST
      ?auto_231172 - SURFACE
      ?auto_231177 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231174 ?auto_231176 ) ( IS-CRATE ?auto_231171 ) ( not ( = ?auto_231170 ?auto_231171 ) ) ( not ( = ?auto_231169 ?auto_231170 ) ) ( not ( = ?auto_231169 ?auto_231171 ) ) ( not ( = ?auto_231175 ?auto_231176 ) ) ( HOIST-AT ?auto_231173 ?auto_231175 ) ( not ( = ?auto_231174 ?auto_231173 ) ) ( AVAILABLE ?auto_231173 ) ( SURFACE-AT ?auto_231171 ?auto_231175 ) ( ON ?auto_231171 ?auto_231172 ) ( CLEAR ?auto_231171 ) ( not ( = ?auto_231170 ?auto_231172 ) ) ( not ( = ?auto_231171 ?auto_231172 ) ) ( not ( = ?auto_231169 ?auto_231172 ) ) ( TRUCK-AT ?auto_231177 ?auto_231176 ) ( SURFACE-AT ?auto_231169 ?auto_231176 ) ( CLEAR ?auto_231169 ) ( LIFTING ?auto_231174 ?auto_231170 ) ( IS-CRATE ?auto_231170 ) ( ON ?auto_231165 ?auto_231164 ) ( ON ?auto_231166 ?auto_231165 ) ( ON ?auto_231167 ?auto_231166 ) ( ON ?auto_231168 ?auto_231167 ) ( ON ?auto_231169 ?auto_231168 ) ( not ( = ?auto_231164 ?auto_231165 ) ) ( not ( = ?auto_231164 ?auto_231166 ) ) ( not ( = ?auto_231164 ?auto_231167 ) ) ( not ( = ?auto_231164 ?auto_231168 ) ) ( not ( = ?auto_231164 ?auto_231169 ) ) ( not ( = ?auto_231164 ?auto_231170 ) ) ( not ( = ?auto_231164 ?auto_231171 ) ) ( not ( = ?auto_231164 ?auto_231172 ) ) ( not ( = ?auto_231165 ?auto_231166 ) ) ( not ( = ?auto_231165 ?auto_231167 ) ) ( not ( = ?auto_231165 ?auto_231168 ) ) ( not ( = ?auto_231165 ?auto_231169 ) ) ( not ( = ?auto_231165 ?auto_231170 ) ) ( not ( = ?auto_231165 ?auto_231171 ) ) ( not ( = ?auto_231165 ?auto_231172 ) ) ( not ( = ?auto_231166 ?auto_231167 ) ) ( not ( = ?auto_231166 ?auto_231168 ) ) ( not ( = ?auto_231166 ?auto_231169 ) ) ( not ( = ?auto_231166 ?auto_231170 ) ) ( not ( = ?auto_231166 ?auto_231171 ) ) ( not ( = ?auto_231166 ?auto_231172 ) ) ( not ( = ?auto_231167 ?auto_231168 ) ) ( not ( = ?auto_231167 ?auto_231169 ) ) ( not ( = ?auto_231167 ?auto_231170 ) ) ( not ( = ?auto_231167 ?auto_231171 ) ) ( not ( = ?auto_231167 ?auto_231172 ) ) ( not ( = ?auto_231168 ?auto_231169 ) ) ( not ( = ?auto_231168 ?auto_231170 ) ) ( not ( = ?auto_231168 ?auto_231171 ) ) ( not ( = ?auto_231168 ?auto_231172 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231169 ?auto_231170 ?auto_231171 )
      ( MAKE-7CRATE-VERIFY ?auto_231164 ?auto_231165 ?auto_231166 ?auto_231167 ?auto_231168 ?auto_231169 ?auto_231170 ?auto_231171 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_231242 - SURFACE
      ?auto_231243 - SURFACE
      ?auto_231244 - SURFACE
      ?auto_231245 - SURFACE
      ?auto_231246 - SURFACE
      ?auto_231247 - SURFACE
      ?auto_231248 - SURFACE
      ?auto_231249 - SURFACE
    )
    :vars
    (
      ?auto_231251 - HOIST
      ?auto_231254 - PLACE
      ?auto_231253 - PLACE
      ?auto_231252 - HOIST
      ?auto_231255 - SURFACE
      ?auto_231250 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_231251 ?auto_231254 ) ( IS-CRATE ?auto_231249 ) ( not ( = ?auto_231248 ?auto_231249 ) ) ( not ( = ?auto_231247 ?auto_231248 ) ) ( not ( = ?auto_231247 ?auto_231249 ) ) ( not ( = ?auto_231253 ?auto_231254 ) ) ( HOIST-AT ?auto_231252 ?auto_231253 ) ( not ( = ?auto_231251 ?auto_231252 ) ) ( AVAILABLE ?auto_231252 ) ( SURFACE-AT ?auto_231249 ?auto_231253 ) ( ON ?auto_231249 ?auto_231255 ) ( CLEAR ?auto_231249 ) ( not ( = ?auto_231248 ?auto_231255 ) ) ( not ( = ?auto_231249 ?auto_231255 ) ) ( not ( = ?auto_231247 ?auto_231255 ) ) ( TRUCK-AT ?auto_231250 ?auto_231254 ) ( SURFACE-AT ?auto_231247 ?auto_231254 ) ( CLEAR ?auto_231247 ) ( IS-CRATE ?auto_231248 ) ( AVAILABLE ?auto_231251 ) ( IN ?auto_231248 ?auto_231250 ) ( ON ?auto_231243 ?auto_231242 ) ( ON ?auto_231244 ?auto_231243 ) ( ON ?auto_231245 ?auto_231244 ) ( ON ?auto_231246 ?auto_231245 ) ( ON ?auto_231247 ?auto_231246 ) ( not ( = ?auto_231242 ?auto_231243 ) ) ( not ( = ?auto_231242 ?auto_231244 ) ) ( not ( = ?auto_231242 ?auto_231245 ) ) ( not ( = ?auto_231242 ?auto_231246 ) ) ( not ( = ?auto_231242 ?auto_231247 ) ) ( not ( = ?auto_231242 ?auto_231248 ) ) ( not ( = ?auto_231242 ?auto_231249 ) ) ( not ( = ?auto_231242 ?auto_231255 ) ) ( not ( = ?auto_231243 ?auto_231244 ) ) ( not ( = ?auto_231243 ?auto_231245 ) ) ( not ( = ?auto_231243 ?auto_231246 ) ) ( not ( = ?auto_231243 ?auto_231247 ) ) ( not ( = ?auto_231243 ?auto_231248 ) ) ( not ( = ?auto_231243 ?auto_231249 ) ) ( not ( = ?auto_231243 ?auto_231255 ) ) ( not ( = ?auto_231244 ?auto_231245 ) ) ( not ( = ?auto_231244 ?auto_231246 ) ) ( not ( = ?auto_231244 ?auto_231247 ) ) ( not ( = ?auto_231244 ?auto_231248 ) ) ( not ( = ?auto_231244 ?auto_231249 ) ) ( not ( = ?auto_231244 ?auto_231255 ) ) ( not ( = ?auto_231245 ?auto_231246 ) ) ( not ( = ?auto_231245 ?auto_231247 ) ) ( not ( = ?auto_231245 ?auto_231248 ) ) ( not ( = ?auto_231245 ?auto_231249 ) ) ( not ( = ?auto_231245 ?auto_231255 ) ) ( not ( = ?auto_231246 ?auto_231247 ) ) ( not ( = ?auto_231246 ?auto_231248 ) ) ( not ( = ?auto_231246 ?auto_231249 ) ) ( not ( = ?auto_231246 ?auto_231255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_231247 ?auto_231248 ?auto_231249 )
      ( MAKE-7CRATE-VERIFY ?auto_231242 ?auto_231243 ?auto_231244 ?auto_231245 ?auto_231246 ?auto_231247 ?auto_231248 ?auto_231249 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234136 - SURFACE
      ?auto_234137 - SURFACE
      ?auto_234138 - SURFACE
      ?auto_234139 - SURFACE
      ?auto_234140 - SURFACE
      ?auto_234141 - SURFACE
      ?auto_234142 - SURFACE
      ?auto_234143 - SURFACE
      ?auto_234144 - SURFACE
    )
    :vars
    (
      ?auto_234146 - HOIST
      ?auto_234145 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234146 ?auto_234145 ) ( SURFACE-AT ?auto_234143 ?auto_234145 ) ( CLEAR ?auto_234143 ) ( LIFTING ?auto_234146 ?auto_234144 ) ( IS-CRATE ?auto_234144 ) ( not ( = ?auto_234143 ?auto_234144 ) ) ( ON ?auto_234137 ?auto_234136 ) ( ON ?auto_234138 ?auto_234137 ) ( ON ?auto_234139 ?auto_234138 ) ( ON ?auto_234140 ?auto_234139 ) ( ON ?auto_234141 ?auto_234140 ) ( ON ?auto_234142 ?auto_234141 ) ( ON ?auto_234143 ?auto_234142 ) ( not ( = ?auto_234136 ?auto_234137 ) ) ( not ( = ?auto_234136 ?auto_234138 ) ) ( not ( = ?auto_234136 ?auto_234139 ) ) ( not ( = ?auto_234136 ?auto_234140 ) ) ( not ( = ?auto_234136 ?auto_234141 ) ) ( not ( = ?auto_234136 ?auto_234142 ) ) ( not ( = ?auto_234136 ?auto_234143 ) ) ( not ( = ?auto_234136 ?auto_234144 ) ) ( not ( = ?auto_234137 ?auto_234138 ) ) ( not ( = ?auto_234137 ?auto_234139 ) ) ( not ( = ?auto_234137 ?auto_234140 ) ) ( not ( = ?auto_234137 ?auto_234141 ) ) ( not ( = ?auto_234137 ?auto_234142 ) ) ( not ( = ?auto_234137 ?auto_234143 ) ) ( not ( = ?auto_234137 ?auto_234144 ) ) ( not ( = ?auto_234138 ?auto_234139 ) ) ( not ( = ?auto_234138 ?auto_234140 ) ) ( not ( = ?auto_234138 ?auto_234141 ) ) ( not ( = ?auto_234138 ?auto_234142 ) ) ( not ( = ?auto_234138 ?auto_234143 ) ) ( not ( = ?auto_234138 ?auto_234144 ) ) ( not ( = ?auto_234139 ?auto_234140 ) ) ( not ( = ?auto_234139 ?auto_234141 ) ) ( not ( = ?auto_234139 ?auto_234142 ) ) ( not ( = ?auto_234139 ?auto_234143 ) ) ( not ( = ?auto_234139 ?auto_234144 ) ) ( not ( = ?auto_234140 ?auto_234141 ) ) ( not ( = ?auto_234140 ?auto_234142 ) ) ( not ( = ?auto_234140 ?auto_234143 ) ) ( not ( = ?auto_234140 ?auto_234144 ) ) ( not ( = ?auto_234141 ?auto_234142 ) ) ( not ( = ?auto_234141 ?auto_234143 ) ) ( not ( = ?auto_234141 ?auto_234144 ) ) ( not ( = ?auto_234142 ?auto_234143 ) ) ( not ( = ?auto_234142 ?auto_234144 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_234143 ?auto_234144 )
      ( MAKE-8CRATE-VERIFY ?auto_234136 ?auto_234137 ?auto_234138 ?auto_234139 ?auto_234140 ?auto_234141 ?auto_234142 ?auto_234143 ?auto_234144 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234203 - SURFACE
      ?auto_234204 - SURFACE
      ?auto_234205 - SURFACE
      ?auto_234206 - SURFACE
      ?auto_234207 - SURFACE
      ?auto_234208 - SURFACE
      ?auto_234209 - SURFACE
      ?auto_234210 - SURFACE
      ?auto_234211 - SURFACE
    )
    :vars
    (
      ?auto_234214 - HOIST
      ?auto_234213 - PLACE
      ?auto_234212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234214 ?auto_234213 ) ( SURFACE-AT ?auto_234210 ?auto_234213 ) ( CLEAR ?auto_234210 ) ( IS-CRATE ?auto_234211 ) ( not ( = ?auto_234210 ?auto_234211 ) ) ( TRUCK-AT ?auto_234212 ?auto_234213 ) ( AVAILABLE ?auto_234214 ) ( IN ?auto_234211 ?auto_234212 ) ( ON ?auto_234210 ?auto_234209 ) ( not ( = ?auto_234209 ?auto_234210 ) ) ( not ( = ?auto_234209 ?auto_234211 ) ) ( ON ?auto_234204 ?auto_234203 ) ( ON ?auto_234205 ?auto_234204 ) ( ON ?auto_234206 ?auto_234205 ) ( ON ?auto_234207 ?auto_234206 ) ( ON ?auto_234208 ?auto_234207 ) ( ON ?auto_234209 ?auto_234208 ) ( not ( = ?auto_234203 ?auto_234204 ) ) ( not ( = ?auto_234203 ?auto_234205 ) ) ( not ( = ?auto_234203 ?auto_234206 ) ) ( not ( = ?auto_234203 ?auto_234207 ) ) ( not ( = ?auto_234203 ?auto_234208 ) ) ( not ( = ?auto_234203 ?auto_234209 ) ) ( not ( = ?auto_234203 ?auto_234210 ) ) ( not ( = ?auto_234203 ?auto_234211 ) ) ( not ( = ?auto_234204 ?auto_234205 ) ) ( not ( = ?auto_234204 ?auto_234206 ) ) ( not ( = ?auto_234204 ?auto_234207 ) ) ( not ( = ?auto_234204 ?auto_234208 ) ) ( not ( = ?auto_234204 ?auto_234209 ) ) ( not ( = ?auto_234204 ?auto_234210 ) ) ( not ( = ?auto_234204 ?auto_234211 ) ) ( not ( = ?auto_234205 ?auto_234206 ) ) ( not ( = ?auto_234205 ?auto_234207 ) ) ( not ( = ?auto_234205 ?auto_234208 ) ) ( not ( = ?auto_234205 ?auto_234209 ) ) ( not ( = ?auto_234205 ?auto_234210 ) ) ( not ( = ?auto_234205 ?auto_234211 ) ) ( not ( = ?auto_234206 ?auto_234207 ) ) ( not ( = ?auto_234206 ?auto_234208 ) ) ( not ( = ?auto_234206 ?auto_234209 ) ) ( not ( = ?auto_234206 ?auto_234210 ) ) ( not ( = ?auto_234206 ?auto_234211 ) ) ( not ( = ?auto_234207 ?auto_234208 ) ) ( not ( = ?auto_234207 ?auto_234209 ) ) ( not ( = ?auto_234207 ?auto_234210 ) ) ( not ( = ?auto_234207 ?auto_234211 ) ) ( not ( = ?auto_234208 ?auto_234209 ) ) ( not ( = ?auto_234208 ?auto_234210 ) ) ( not ( = ?auto_234208 ?auto_234211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234209 ?auto_234210 ?auto_234211 )
      ( MAKE-8CRATE-VERIFY ?auto_234203 ?auto_234204 ?auto_234205 ?auto_234206 ?auto_234207 ?auto_234208 ?auto_234209 ?auto_234210 ?auto_234211 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234279 - SURFACE
      ?auto_234280 - SURFACE
      ?auto_234281 - SURFACE
      ?auto_234282 - SURFACE
      ?auto_234283 - SURFACE
      ?auto_234284 - SURFACE
      ?auto_234285 - SURFACE
      ?auto_234286 - SURFACE
      ?auto_234287 - SURFACE
    )
    :vars
    (
      ?auto_234291 - HOIST
      ?auto_234288 - PLACE
      ?auto_234290 - TRUCK
      ?auto_234289 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234291 ?auto_234288 ) ( SURFACE-AT ?auto_234286 ?auto_234288 ) ( CLEAR ?auto_234286 ) ( IS-CRATE ?auto_234287 ) ( not ( = ?auto_234286 ?auto_234287 ) ) ( AVAILABLE ?auto_234291 ) ( IN ?auto_234287 ?auto_234290 ) ( ON ?auto_234286 ?auto_234285 ) ( not ( = ?auto_234285 ?auto_234286 ) ) ( not ( = ?auto_234285 ?auto_234287 ) ) ( TRUCK-AT ?auto_234290 ?auto_234289 ) ( not ( = ?auto_234289 ?auto_234288 ) ) ( ON ?auto_234280 ?auto_234279 ) ( ON ?auto_234281 ?auto_234280 ) ( ON ?auto_234282 ?auto_234281 ) ( ON ?auto_234283 ?auto_234282 ) ( ON ?auto_234284 ?auto_234283 ) ( ON ?auto_234285 ?auto_234284 ) ( not ( = ?auto_234279 ?auto_234280 ) ) ( not ( = ?auto_234279 ?auto_234281 ) ) ( not ( = ?auto_234279 ?auto_234282 ) ) ( not ( = ?auto_234279 ?auto_234283 ) ) ( not ( = ?auto_234279 ?auto_234284 ) ) ( not ( = ?auto_234279 ?auto_234285 ) ) ( not ( = ?auto_234279 ?auto_234286 ) ) ( not ( = ?auto_234279 ?auto_234287 ) ) ( not ( = ?auto_234280 ?auto_234281 ) ) ( not ( = ?auto_234280 ?auto_234282 ) ) ( not ( = ?auto_234280 ?auto_234283 ) ) ( not ( = ?auto_234280 ?auto_234284 ) ) ( not ( = ?auto_234280 ?auto_234285 ) ) ( not ( = ?auto_234280 ?auto_234286 ) ) ( not ( = ?auto_234280 ?auto_234287 ) ) ( not ( = ?auto_234281 ?auto_234282 ) ) ( not ( = ?auto_234281 ?auto_234283 ) ) ( not ( = ?auto_234281 ?auto_234284 ) ) ( not ( = ?auto_234281 ?auto_234285 ) ) ( not ( = ?auto_234281 ?auto_234286 ) ) ( not ( = ?auto_234281 ?auto_234287 ) ) ( not ( = ?auto_234282 ?auto_234283 ) ) ( not ( = ?auto_234282 ?auto_234284 ) ) ( not ( = ?auto_234282 ?auto_234285 ) ) ( not ( = ?auto_234282 ?auto_234286 ) ) ( not ( = ?auto_234282 ?auto_234287 ) ) ( not ( = ?auto_234283 ?auto_234284 ) ) ( not ( = ?auto_234283 ?auto_234285 ) ) ( not ( = ?auto_234283 ?auto_234286 ) ) ( not ( = ?auto_234283 ?auto_234287 ) ) ( not ( = ?auto_234284 ?auto_234285 ) ) ( not ( = ?auto_234284 ?auto_234286 ) ) ( not ( = ?auto_234284 ?auto_234287 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234285 ?auto_234286 ?auto_234287 )
      ( MAKE-8CRATE-VERIFY ?auto_234279 ?auto_234280 ?auto_234281 ?auto_234282 ?auto_234283 ?auto_234284 ?auto_234285 ?auto_234286 ?auto_234287 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234363 - SURFACE
      ?auto_234364 - SURFACE
      ?auto_234365 - SURFACE
      ?auto_234366 - SURFACE
      ?auto_234367 - SURFACE
      ?auto_234368 - SURFACE
      ?auto_234369 - SURFACE
      ?auto_234370 - SURFACE
      ?auto_234371 - SURFACE
    )
    :vars
    (
      ?auto_234372 - HOIST
      ?auto_234373 - PLACE
      ?auto_234376 - TRUCK
      ?auto_234374 - PLACE
      ?auto_234375 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_234372 ?auto_234373 ) ( SURFACE-AT ?auto_234370 ?auto_234373 ) ( CLEAR ?auto_234370 ) ( IS-CRATE ?auto_234371 ) ( not ( = ?auto_234370 ?auto_234371 ) ) ( AVAILABLE ?auto_234372 ) ( ON ?auto_234370 ?auto_234369 ) ( not ( = ?auto_234369 ?auto_234370 ) ) ( not ( = ?auto_234369 ?auto_234371 ) ) ( TRUCK-AT ?auto_234376 ?auto_234374 ) ( not ( = ?auto_234374 ?auto_234373 ) ) ( HOIST-AT ?auto_234375 ?auto_234374 ) ( LIFTING ?auto_234375 ?auto_234371 ) ( not ( = ?auto_234372 ?auto_234375 ) ) ( ON ?auto_234364 ?auto_234363 ) ( ON ?auto_234365 ?auto_234364 ) ( ON ?auto_234366 ?auto_234365 ) ( ON ?auto_234367 ?auto_234366 ) ( ON ?auto_234368 ?auto_234367 ) ( ON ?auto_234369 ?auto_234368 ) ( not ( = ?auto_234363 ?auto_234364 ) ) ( not ( = ?auto_234363 ?auto_234365 ) ) ( not ( = ?auto_234363 ?auto_234366 ) ) ( not ( = ?auto_234363 ?auto_234367 ) ) ( not ( = ?auto_234363 ?auto_234368 ) ) ( not ( = ?auto_234363 ?auto_234369 ) ) ( not ( = ?auto_234363 ?auto_234370 ) ) ( not ( = ?auto_234363 ?auto_234371 ) ) ( not ( = ?auto_234364 ?auto_234365 ) ) ( not ( = ?auto_234364 ?auto_234366 ) ) ( not ( = ?auto_234364 ?auto_234367 ) ) ( not ( = ?auto_234364 ?auto_234368 ) ) ( not ( = ?auto_234364 ?auto_234369 ) ) ( not ( = ?auto_234364 ?auto_234370 ) ) ( not ( = ?auto_234364 ?auto_234371 ) ) ( not ( = ?auto_234365 ?auto_234366 ) ) ( not ( = ?auto_234365 ?auto_234367 ) ) ( not ( = ?auto_234365 ?auto_234368 ) ) ( not ( = ?auto_234365 ?auto_234369 ) ) ( not ( = ?auto_234365 ?auto_234370 ) ) ( not ( = ?auto_234365 ?auto_234371 ) ) ( not ( = ?auto_234366 ?auto_234367 ) ) ( not ( = ?auto_234366 ?auto_234368 ) ) ( not ( = ?auto_234366 ?auto_234369 ) ) ( not ( = ?auto_234366 ?auto_234370 ) ) ( not ( = ?auto_234366 ?auto_234371 ) ) ( not ( = ?auto_234367 ?auto_234368 ) ) ( not ( = ?auto_234367 ?auto_234369 ) ) ( not ( = ?auto_234367 ?auto_234370 ) ) ( not ( = ?auto_234367 ?auto_234371 ) ) ( not ( = ?auto_234368 ?auto_234369 ) ) ( not ( = ?auto_234368 ?auto_234370 ) ) ( not ( = ?auto_234368 ?auto_234371 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234369 ?auto_234370 ?auto_234371 )
      ( MAKE-8CRATE-VERIFY ?auto_234363 ?auto_234364 ?auto_234365 ?auto_234366 ?auto_234367 ?auto_234368 ?auto_234369 ?auto_234370 ?auto_234371 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234455 - SURFACE
      ?auto_234456 - SURFACE
      ?auto_234457 - SURFACE
      ?auto_234458 - SURFACE
      ?auto_234459 - SURFACE
      ?auto_234460 - SURFACE
      ?auto_234461 - SURFACE
      ?auto_234462 - SURFACE
      ?auto_234463 - SURFACE
    )
    :vars
    (
      ?auto_234467 - HOIST
      ?auto_234465 - PLACE
      ?auto_234466 - TRUCK
      ?auto_234469 - PLACE
      ?auto_234464 - HOIST
      ?auto_234468 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_234467 ?auto_234465 ) ( SURFACE-AT ?auto_234462 ?auto_234465 ) ( CLEAR ?auto_234462 ) ( IS-CRATE ?auto_234463 ) ( not ( = ?auto_234462 ?auto_234463 ) ) ( AVAILABLE ?auto_234467 ) ( ON ?auto_234462 ?auto_234461 ) ( not ( = ?auto_234461 ?auto_234462 ) ) ( not ( = ?auto_234461 ?auto_234463 ) ) ( TRUCK-AT ?auto_234466 ?auto_234469 ) ( not ( = ?auto_234469 ?auto_234465 ) ) ( HOIST-AT ?auto_234464 ?auto_234469 ) ( not ( = ?auto_234467 ?auto_234464 ) ) ( AVAILABLE ?auto_234464 ) ( SURFACE-AT ?auto_234463 ?auto_234469 ) ( ON ?auto_234463 ?auto_234468 ) ( CLEAR ?auto_234463 ) ( not ( = ?auto_234462 ?auto_234468 ) ) ( not ( = ?auto_234463 ?auto_234468 ) ) ( not ( = ?auto_234461 ?auto_234468 ) ) ( ON ?auto_234456 ?auto_234455 ) ( ON ?auto_234457 ?auto_234456 ) ( ON ?auto_234458 ?auto_234457 ) ( ON ?auto_234459 ?auto_234458 ) ( ON ?auto_234460 ?auto_234459 ) ( ON ?auto_234461 ?auto_234460 ) ( not ( = ?auto_234455 ?auto_234456 ) ) ( not ( = ?auto_234455 ?auto_234457 ) ) ( not ( = ?auto_234455 ?auto_234458 ) ) ( not ( = ?auto_234455 ?auto_234459 ) ) ( not ( = ?auto_234455 ?auto_234460 ) ) ( not ( = ?auto_234455 ?auto_234461 ) ) ( not ( = ?auto_234455 ?auto_234462 ) ) ( not ( = ?auto_234455 ?auto_234463 ) ) ( not ( = ?auto_234455 ?auto_234468 ) ) ( not ( = ?auto_234456 ?auto_234457 ) ) ( not ( = ?auto_234456 ?auto_234458 ) ) ( not ( = ?auto_234456 ?auto_234459 ) ) ( not ( = ?auto_234456 ?auto_234460 ) ) ( not ( = ?auto_234456 ?auto_234461 ) ) ( not ( = ?auto_234456 ?auto_234462 ) ) ( not ( = ?auto_234456 ?auto_234463 ) ) ( not ( = ?auto_234456 ?auto_234468 ) ) ( not ( = ?auto_234457 ?auto_234458 ) ) ( not ( = ?auto_234457 ?auto_234459 ) ) ( not ( = ?auto_234457 ?auto_234460 ) ) ( not ( = ?auto_234457 ?auto_234461 ) ) ( not ( = ?auto_234457 ?auto_234462 ) ) ( not ( = ?auto_234457 ?auto_234463 ) ) ( not ( = ?auto_234457 ?auto_234468 ) ) ( not ( = ?auto_234458 ?auto_234459 ) ) ( not ( = ?auto_234458 ?auto_234460 ) ) ( not ( = ?auto_234458 ?auto_234461 ) ) ( not ( = ?auto_234458 ?auto_234462 ) ) ( not ( = ?auto_234458 ?auto_234463 ) ) ( not ( = ?auto_234458 ?auto_234468 ) ) ( not ( = ?auto_234459 ?auto_234460 ) ) ( not ( = ?auto_234459 ?auto_234461 ) ) ( not ( = ?auto_234459 ?auto_234462 ) ) ( not ( = ?auto_234459 ?auto_234463 ) ) ( not ( = ?auto_234459 ?auto_234468 ) ) ( not ( = ?auto_234460 ?auto_234461 ) ) ( not ( = ?auto_234460 ?auto_234462 ) ) ( not ( = ?auto_234460 ?auto_234463 ) ) ( not ( = ?auto_234460 ?auto_234468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234461 ?auto_234462 ?auto_234463 )
      ( MAKE-8CRATE-VERIFY ?auto_234455 ?auto_234456 ?auto_234457 ?auto_234458 ?auto_234459 ?auto_234460 ?auto_234461 ?auto_234462 ?auto_234463 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234548 - SURFACE
      ?auto_234549 - SURFACE
      ?auto_234550 - SURFACE
      ?auto_234551 - SURFACE
      ?auto_234552 - SURFACE
      ?auto_234553 - SURFACE
      ?auto_234554 - SURFACE
      ?auto_234555 - SURFACE
      ?auto_234556 - SURFACE
    )
    :vars
    (
      ?auto_234562 - HOIST
      ?auto_234560 - PLACE
      ?auto_234557 - PLACE
      ?auto_234558 - HOIST
      ?auto_234559 - SURFACE
      ?auto_234561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234562 ?auto_234560 ) ( SURFACE-AT ?auto_234555 ?auto_234560 ) ( CLEAR ?auto_234555 ) ( IS-CRATE ?auto_234556 ) ( not ( = ?auto_234555 ?auto_234556 ) ) ( AVAILABLE ?auto_234562 ) ( ON ?auto_234555 ?auto_234554 ) ( not ( = ?auto_234554 ?auto_234555 ) ) ( not ( = ?auto_234554 ?auto_234556 ) ) ( not ( = ?auto_234557 ?auto_234560 ) ) ( HOIST-AT ?auto_234558 ?auto_234557 ) ( not ( = ?auto_234562 ?auto_234558 ) ) ( AVAILABLE ?auto_234558 ) ( SURFACE-AT ?auto_234556 ?auto_234557 ) ( ON ?auto_234556 ?auto_234559 ) ( CLEAR ?auto_234556 ) ( not ( = ?auto_234555 ?auto_234559 ) ) ( not ( = ?auto_234556 ?auto_234559 ) ) ( not ( = ?auto_234554 ?auto_234559 ) ) ( TRUCK-AT ?auto_234561 ?auto_234560 ) ( ON ?auto_234549 ?auto_234548 ) ( ON ?auto_234550 ?auto_234549 ) ( ON ?auto_234551 ?auto_234550 ) ( ON ?auto_234552 ?auto_234551 ) ( ON ?auto_234553 ?auto_234552 ) ( ON ?auto_234554 ?auto_234553 ) ( not ( = ?auto_234548 ?auto_234549 ) ) ( not ( = ?auto_234548 ?auto_234550 ) ) ( not ( = ?auto_234548 ?auto_234551 ) ) ( not ( = ?auto_234548 ?auto_234552 ) ) ( not ( = ?auto_234548 ?auto_234553 ) ) ( not ( = ?auto_234548 ?auto_234554 ) ) ( not ( = ?auto_234548 ?auto_234555 ) ) ( not ( = ?auto_234548 ?auto_234556 ) ) ( not ( = ?auto_234548 ?auto_234559 ) ) ( not ( = ?auto_234549 ?auto_234550 ) ) ( not ( = ?auto_234549 ?auto_234551 ) ) ( not ( = ?auto_234549 ?auto_234552 ) ) ( not ( = ?auto_234549 ?auto_234553 ) ) ( not ( = ?auto_234549 ?auto_234554 ) ) ( not ( = ?auto_234549 ?auto_234555 ) ) ( not ( = ?auto_234549 ?auto_234556 ) ) ( not ( = ?auto_234549 ?auto_234559 ) ) ( not ( = ?auto_234550 ?auto_234551 ) ) ( not ( = ?auto_234550 ?auto_234552 ) ) ( not ( = ?auto_234550 ?auto_234553 ) ) ( not ( = ?auto_234550 ?auto_234554 ) ) ( not ( = ?auto_234550 ?auto_234555 ) ) ( not ( = ?auto_234550 ?auto_234556 ) ) ( not ( = ?auto_234550 ?auto_234559 ) ) ( not ( = ?auto_234551 ?auto_234552 ) ) ( not ( = ?auto_234551 ?auto_234553 ) ) ( not ( = ?auto_234551 ?auto_234554 ) ) ( not ( = ?auto_234551 ?auto_234555 ) ) ( not ( = ?auto_234551 ?auto_234556 ) ) ( not ( = ?auto_234551 ?auto_234559 ) ) ( not ( = ?auto_234552 ?auto_234553 ) ) ( not ( = ?auto_234552 ?auto_234554 ) ) ( not ( = ?auto_234552 ?auto_234555 ) ) ( not ( = ?auto_234552 ?auto_234556 ) ) ( not ( = ?auto_234552 ?auto_234559 ) ) ( not ( = ?auto_234553 ?auto_234554 ) ) ( not ( = ?auto_234553 ?auto_234555 ) ) ( not ( = ?auto_234553 ?auto_234556 ) ) ( not ( = ?auto_234553 ?auto_234559 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234554 ?auto_234555 ?auto_234556 )
      ( MAKE-8CRATE-VERIFY ?auto_234548 ?auto_234549 ?auto_234550 ?auto_234551 ?auto_234552 ?auto_234553 ?auto_234554 ?auto_234555 ?auto_234556 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234641 - SURFACE
      ?auto_234642 - SURFACE
      ?auto_234643 - SURFACE
      ?auto_234644 - SURFACE
      ?auto_234645 - SURFACE
      ?auto_234646 - SURFACE
      ?auto_234647 - SURFACE
      ?auto_234648 - SURFACE
      ?auto_234649 - SURFACE
    )
    :vars
    (
      ?auto_234651 - HOIST
      ?auto_234655 - PLACE
      ?auto_234652 - PLACE
      ?auto_234654 - HOIST
      ?auto_234650 - SURFACE
      ?auto_234653 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234651 ?auto_234655 ) ( IS-CRATE ?auto_234649 ) ( not ( = ?auto_234648 ?auto_234649 ) ) ( not ( = ?auto_234647 ?auto_234648 ) ) ( not ( = ?auto_234647 ?auto_234649 ) ) ( not ( = ?auto_234652 ?auto_234655 ) ) ( HOIST-AT ?auto_234654 ?auto_234652 ) ( not ( = ?auto_234651 ?auto_234654 ) ) ( AVAILABLE ?auto_234654 ) ( SURFACE-AT ?auto_234649 ?auto_234652 ) ( ON ?auto_234649 ?auto_234650 ) ( CLEAR ?auto_234649 ) ( not ( = ?auto_234648 ?auto_234650 ) ) ( not ( = ?auto_234649 ?auto_234650 ) ) ( not ( = ?auto_234647 ?auto_234650 ) ) ( TRUCK-AT ?auto_234653 ?auto_234655 ) ( SURFACE-AT ?auto_234647 ?auto_234655 ) ( CLEAR ?auto_234647 ) ( LIFTING ?auto_234651 ?auto_234648 ) ( IS-CRATE ?auto_234648 ) ( ON ?auto_234642 ?auto_234641 ) ( ON ?auto_234643 ?auto_234642 ) ( ON ?auto_234644 ?auto_234643 ) ( ON ?auto_234645 ?auto_234644 ) ( ON ?auto_234646 ?auto_234645 ) ( ON ?auto_234647 ?auto_234646 ) ( not ( = ?auto_234641 ?auto_234642 ) ) ( not ( = ?auto_234641 ?auto_234643 ) ) ( not ( = ?auto_234641 ?auto_234644 ) ) ( not ( = ?auto_234641 ?auto_234645 ) ) ( not ( = ?auto_234641 ?auto_234646 ) ) ( not ( = ?auto_234641 ?auto_234647 ) ) ( not ( = ?auto_234641 ?auto_234648 ) ) ( not ( = ?auto_234641 ?auto_234649 ) ) ( not ( = ?auto_234641 ?auto_234650 ) ) ( not ( = ?auto_234642 ?auto_234643 ) ) ( not ( = ?auto_234642 ?auto_234644 ) ) ( not ( = ?auto_234642 ?auto_234645 ) ) ( not ( = ?auto_234642 ?auto_234646 ) ) ( not ( = ?auto_234642 ?auto_234647 ) ) ( not ( = ?auto_234642 ?auto_234648 ) ) ( not ( = ?auto_234642 ?auto_234649 ) ) ( not ( = ?auto_234642 ?auto_234650 ) ) ( not ( = ?auto_234643 ?auto_234644 ) ) ( not ( = ?auto_234643 ?auto_234645 ) ) ( not ( = ?auto_234643 ?auto_234646 ) ) ( not ( = ?auto_234643 ?auto_234647 ) ) ( not ( = ?auto_234643 ?auto_234648 ) ) ( not ( = ?auto_234643 ?auto_234649 ) ) ( not ( = ?auto_234643 ?auto_234650 ) ) ( not ( = ?auto_234644 ?auto_234645 ) ) ( not ( = ?auto_234644 ?auto_234646 ) ) ( not ( = ?auto_234644 ?auto_234647 ) ) ( not ( = ?auto_234644 ?auto_234648 ) ) ( not ( = ?auto_234644 ?auto_234649 ) ) ( not ( = ?auto_234644 ?auto_234650 ) ) ( not ( = ?auto_234645 ?auto_234646 ) ) ( not ( = ?auto_234645 ?auto_234647 ) ) ( not ( = ?auto_234645 ?auto_234648 ) ) ( not ( = ?auto_234645 ?auto_234649 ) ) ( not ( = ?auto_234645 ?auto_234650 ) ) ( not ( = ?auto_234646 ?auto_234647 ) ) ( not ( = ?auto_234646 ?auto_234648 ) ) ( not ( = ?auto_234646 ?auto_234649 ) ) ( not ( = ?auto_234646 ?auto_234650 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234647 ?auto_234648 ?auto_234649 )
      ( MAKE-8CRATE-VERIFY ?auto_234641 ?auto_234642 ?auto_234643 ?auto_234644 ?auto_234645 ?auto_234646 ?auto_234647 ?auto_234648 ?auto_234649 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_234734 - SURFACE
      ?auto_234735 - SURFACE
      ?auto_234736 - SURFACE
      ?auto_234737 - SURFACE
      ?auto_234738 - SURFACE
      ?auto_234739 - SURFACE
      ?auto_234740 - SURFACE
      ?auto_234741 - SURFACE
      ?auto_234742 - SURFACE
    )
    :vars
    (
      ?auto_234744 - HOIST
      ?auto_234745 - PLACE
      ?auto_234743 - PLACE
      ?auto_234748 - HOIST
      ?auto_234746 - SURFACE
      ?auto_234747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_234744 ?auto_234745 ) ( IS-CRATE ?auto_234742 ) ( not ( = ?auto_234741 ?auto_234742 ) ) ( not ( = ?auto_234740 ?auto_234741 ) ) ( not ( = ?auto_234740 ?auto_234742 ) ) ( not ( = ?auto_234743 ?auto_234745 ) ) ( HOIST-AT ?auto_234748 ?auto_234743 ) ( not ( = ?auto_234744 ?auto_234748 ) ) ( AVAILABLE ?auto_234748 ) ( SURFACE-AT ?auto_234742 ?auto_234743 ) ( ON ?auto_234742 ?auto_234746 ) ( CLEAR ?auto_234742 ) ( not ( = ?auto_234741 ?auto_234746 ) ) ( not ( = ?auto_234742 ?auto_234746 ) ) ( not ( = ?auto_234740 ?auto_234746 ) ) ( TRUCK-AT ?auto_234747 ?auto_234745 ) ( SURFACE-AT ?auto_234740 ?auto_234745 ) ( CLEAR ?auto_234740 ) ( IS-CRATE ?auto_234741 ) ( AVAILABLE ?auto_234744 ) ( IN ?auto_234741 ?auto_234747 ) ( ON ?auto_234735 ?auto_234734 ) ( ON ?auto_234736 ?auto_234735 ) ( ON ?auto_234737 ?auto_234736 ) ( ON ?auto_234738 ?auto_234737 ) ( ON ?auto_234739 ?auto_234738 ) ( ON ?auto_234740 ?auto_234739 ) ( not ( = ?auto_234734 ?auto_234735 ) ) ( not ( = ?auto_234734 ?auto_234736 ) ) ( not ( = ?auto_234734 ?auto_234737 ) ) ( not ( = ?auto_234734 ?auto_234738 ) ) ( not ( = ?auto_234734 ?auto_234739 ) ) ( not ( = ?auto_234734 ?auto_234740 ) ) ( not ( = ?auto_234734 ?auto_234741 ) ) ( not ( = ?auto_234734 ?auto_234742 ) ) ( not ( = ?auto_234734 ?auto_234746 ) ) ( not ( = ?auto_234735 ?auto_234736 ) ) ( not ( = ?auto_234735 ?auto_234737 ) ) ( not ( = ?auto_234735 ?auto_234738 ) ) ( not ( = ?auto_234735 ?auto_234739 ) ) ( not ( = ?auto_234735 ?auto_234740 ) ) ( not ( = ?auto_234735 ?auto_234741 ) ) ( not ( = ?auto_234735 ?auto_234742 ) ) ( not ( = ?auto_234735 ?auto_234746 ) ) ( not ( = ?auto_234736 ?auto_234737 ) ) ( not ( = ?auto_234736 ?auto_234738 ) ) ( not ( = ?auto_234736 ?auto_234739 ) ) ( not ( = ?auto_234736 ?auto_234740 ) ) ( not ( = ?auto_234736 ?auto_234741 ) ) ( not ( = ?auto_234736 ?auto_234742 ) ) ( not ( = ?auto_234736 ?auto_234746 ) ) ( not ( = ?auto_234737 ?auto_234738 ) ) ( not ( = ?auto_234737 ?auto_234739 ) ) ( not ( = ?auto_234737 ?auto_234740 ) ) ( not ( = ?auto_234737 ?auto_234741 ) ) ( not ( = ?auto_234737 ?auto_234742 ) ) ( not ( = ?auto_234737 ?auto_234746 ) ) ( not ( = ?auto_234738 ?auto_234739 ) ) ( not ( = ?auto_234738 ?auto_234740 ) ) ( not ( = ?auto_234738 ?auto_234741 ) ) ( not ( = ?auto_234738 ?auto_234742 ) ) ( not ( = ?auto_234738 ?auto_234746 ) ) ( not ( = ?auto_234739 ?auto_234740 ) ) ( not ( = ?auto_234739 ?auto_234741 ) ) ( not ( = ?auto_234739 ?auto_234742 ) ) ( not ( = ?auto_234739 ?auto_234746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_234740 ?auto_234741 ?auto_234742 )
      ( MAKE-8CRATE-VERIFY ?auto_234734 ?auto_234735 ?auto_234736 ?auto_234737 ?auto_234738 ?auto_234739 ?auto_234740 ?auto_234741 ?auto_234742 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238800 - SURFACE
      ?auto_238801 - SURFACE
      ?auto_238802 - SURFACE
      ?auto_238803 - SURFACE
      ?auto_238804 - SURFACE
      ?auto_238805 - SURFACE
      ?auto_238806 - SURFACE
      ?auto_238807 - SURFACE
      ?auto_238808 - SURFACE
      ?auto_238809 - SURFACE
    )
    :vars
    (
      ?auto_238811 - HOIST
      ?auto_238810 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238811 ?auto_238810 ) ( SURFACE-AT ?auto_238808 ?auto_238810 ) ( CLEAR ?auto_238808 ) ( LIFTING ?auto_238811 ?auto_238809 ) ( IS-CRATE ?auto_238809 ) ( not ( = ?auto_238808 ?auto_238809 ) ) ( ON ?auto_238801 ?auto_238800 ) ( ON ?auto_238802 ?auto_238801 ) ( ON ?auto_238803 ?auto_238802 ) ( ON ?auto_238804 ?auto_238803 ) ( ON ?auto_238805 ?auto_238804 ) ( ON ?auto_238806 ?auto_238805 ) ( ON ?auto_238807 ?auto_238806 ) ( ON ?auto_238808 ?auto_238807 ) ( not ( = ?auto_238800 ?auto_238801 ) ) ( not ( = ?auto_238800 ?auto_238802 ) ) ( not ( = ?auto_238800 ?auto_238803 ) ) ( not ( = ?auto_238800 ?auto_238804 ) ) ( not ( = ?auto_238800 ?auto_238805 ) ) ( not ( = ?auto_238800 ?auto_238806 ) ) ( not ( = ?auto_238800 ?auto_238807 ) ) ( not ( = ?auto_238800 ?auto_238808 ) ) ( not ( = ?auto_238800 ?auto_238809 ) ) ( not ( = ?auto_238801 ?auto_238802 ) ) ( not ( = ?auto_238801 ?auto_238803 ) ) ( not ( = ?auto_238801 ?auto_238804 ) ) ( not ( = ?auto_238801 ?auto_238805 ) ) ( not ( = ?auto_238801 ?auto_238806 ) ) ( not ( = ?auto_238801 ?auto_238807 ) ) ( not ( = ?auto_238801 ?auto_238808 ) ) ( not ( = ?auto_238801 ?auto_238809 ) ) ( not ( = ?auto_238802 ?auto_238803 ) ) ( not ( = ?auto_238802 ?auto_238804 ) ) ( not ( = ?auto_238802 ?auto_238805 ) ) ( not ( = ?auto_238802 ?auto_238806 ) ) ( not ( = ?auto_238802 ?auto_238807 ) ) ( not ( = ?auto_238802 ?auto_238808 ) ) ( not ( = ?auto_238802 ?auto_238809 ) ) ( not ( = ?auto_238803 ?auto_238804 ) ) ( not ( = ?auto_238803 ?auto_238805 ) ) ( not ( = ?auto_238803 ?auto_238806 ) ) ( not ( = ?auto_238803 ?auto_238807 ) ) ( not ( = ?auto_238803 ?auto_238808 ) ) ( not ( = ?auto_238803 ?auto_238809 ) ) ( not ( = ?auto_238804 ?auto_238805 ) ) ( not ( = ?auto_238804 ?auto_238806 ) ) ( not ( = ?auto_238804 ?auto_238807 ) ) ( not ( = ?auto_238804 ?auto_238808 ) ) ( not ( = ?auto_238804 ?auto_238809 ) ) ( not ( = ?auto_238805 ?auto_238806 ) ) ( not ( = ?auto_238805 ?auto_238807 ) ) ( not ( = ?auto_238805 ?auto_238808 ) ) ( not ( = ?auto_238805 ?auto_238809 ) ) ( not ( = ?auto_238806 ?auto_238807 ) ) ( not ( = ?auto_238806 ?auto_238808 ) ) ( not ( = ?auto_238806 ?auto_238809 ) ) ( not ( = ?auto_238807 ?auto_238808 ) ) ( not ( = ?auto_238807 ?auto_238809 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_238808 ?auto_238809 )
      ( MAKE-9CRATE-VERIFY ?auto_238800 ?auto_238801 ?auto_238802 ?auto_238803 ?auto_238804 ?auto_238805 ?auto_238806 ?auto_238807 ?auto_238808 ?auto_238809 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238880 - SURFACE
      ?auto_238881 - SURFACE
      ?auto_238882 - SURFACE
      ?auto_238883 - SURFACE
      ?auto_238884 - SURFACE
      ?auto_238885 - SURFACE
      ?auto_238886 - SURFACE
      ?auto_238887 - SURFACE
      ?auto_238888 - SURFACE
      ?auto_238889 - SURFACE
    )
    :vars
    (
      ?auto_238890 - HOIST
      ?auto_238891 - PLACE
      ?auto_238892 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_238890 ?auto_238891 ) ( SURFACE-AT ?auto_238888 ?auto_238891 ) ( CLEAR ?auto_238888 ) ( IS-CRATE ?auto_238889 ) ( not ( = ?auto_238888 ?auto_238889 ) ) ( TRUCK-AT ?auto_238892 ?auto_238891 ) ( AVAILABLE ?auto_238890 ) ( IN ?auto_238889 ?auto_238892 ) ( ON ?auto_238888 ?auto_238887 ) ( not ( = ?auto_238887 ?auto_238888 ) ) ( not ( = ?auto_238887 ?auto_238889 ) ) ( ON ?auto_238881 ?auto_238880 ) ( ON ?auto_238882 ?auto_238881 ) ( ON ?auto_238883 ?auto_238882 ) ( ON ?auto_238884 ?auto_238883 ) ( ON ?auto_238885 ?auto_238884 ) ( ON ?auto_238886 ?auto_238885 ) ( ON ?auto_238887 ?auto_238886 ) ( not ( = ?auto_238880 ?auto_238881 ) ) ( not ( = ?auto_238880 ?auto_238882 ) ) ( not ( = ?auto_238880 ?auto_238883 ) ) ( not ( = ?auto_238880 ?auto_238884 ) ) ( not ( = ?auto_238880 ?auto_238885 ) ) ( not ( = ?auto_238880 ?auto_238886 ) ) ( not ( = ?auto_238880 ?auto_238887 ) ) ( not ( = ?auto_238880 ?auto_238888 ) ) ( not ( = ?auto_238880 ?auto_238889 ) ) ( not ( = ?auto_238881 ?auto_238882 ) ) ( not ( = ?auto_238881 ?auto_238883 ) ) ( not ( = ?auto_238881 ?auto_238884 ) ) ( not ( = ?auto_238881 ?auto_238885 ) ) ( not ( = ?auto_238881 ?auto_238886 ) ) ( not ( = ?auto_238881 ?auto_238887 ) ) ( not ( = ?auto_238881 ?auto_238888 ) ) ( not ( = ?auto_238881 ?auto_238889 ) ) ( not ( = ?auto_238882 ?auto_238883 ) ) ( not ( = ?auto_238882 ?auto_238884 ) ) ( not ( = ?auto_238882 ?auto_238885 ) ) ( not ( = ?auto_238882 ?auto_238886 ) ) ( not ( = ?auto_238882 ?auto_238887 ) ) ( not ( = ?auto_238882 ?auto_238888 ) ) ( not ( = ?auto_238882 ?auto_238889 ) ) ( not ( = ?auto_238883 ?auto_238884 ) ) ( not ( = ?auto_238883 ?auto_238885 ) ) ( not ( = ?auto_238883 ?auto_238886 ) ) ( not ( = ?auto_238883 ?auto_238887 ) ) ( not ( = ?auto_238883 ?auto_238888 ) ) ( not ( = ?auto_238883 ?auto_238889 ) ) ( not ( = ?auto_238884 ?auto_238885 ) ) ( not ( = ?auto_238884 ?auto_238886 ) ) ( not ( = ?auto_238884 ?auto_238887 ) ) ( not ( = ?auto_238884 ?auto_238888 ) ) ( not ( = ?auto_238884 ?auto_238889 ) ) ( not ( = ?auto_238885 ?auto_238886 ) ) ( not ( = ?auto_238885 ?auto_238887 ) ) ( not ( = ?auto_238885 ?auto_238888 ) ) ( not ( = ?auto_238885 ?auto_238889 ) ) ( not ( = ?auto_238886 ?auto_238887 ) ) ( not ( = ?auto_238886 ?auto_238888 ) ) ( not ( = ?auto_238886 ?auto_238889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_238887 ?auto_238888 ?auto_238889 )
      ( MAKE-9CRATE-VERIFY ?auto_238880 ?auto_238881 ?auto_238882 ?auto_238883 ?auto_238884 ?auto_238885 ?auto_238886 ?auto_238887 ?auto_238888 ?auto_238889 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_238970 - SURFACE
      ?auto_238971 - SURFACE
      ?auto_238972 - SURFACE
      ?auto_238973 - SURFACE
      ?auto_238974 - SURFACE
      ?auto_238975 - SURFACE
      ?auto_238976 - SURFACE
      ?auto_238977 - SURFACE
      ?auto_238978 - SURFACE
      ?auto_238979 - SURFACE
    )
    :vars
    (
      ?auto_238981 - HOIST
      ?auto_238980 - PLACE
      ?auto_238983 - TRUCK
      ?auto_238982 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_238981 ?auto_238980 ) ( SURFACE-AT ?auto_238978 ?auto_238980 ) ( CLEAR ?auto_238978 ) ( IS-CRATE ?auto_238979 ) ( not ( = ?auto_238978 ?auto_238979 ) ) ( AVAILABLE ?auto_238981 ) ( IN ?auto_238979 ?auto_238983 ) ( ON ?auto_238978 ?auto_238977 ) ( not ( = ?auto_238977 ?auto_238978 ) ) ( not ( = ?auto_238977 ?auto_238979 ) ) ( TRUCK-AT ?auto_238983 ?auto_238982 ) ( not ( = ?auto_238982 ?auto_238980 ) ) ( ON ?auto_238971 ?auto_238970 ) ( ON ?auto_238972 ?auto_238971 ) ( ON ?auto_238973 ?auto_238972 ) ( ON ?auto_238974 ?auto_238973 ) ( ON ?auto_238975 ?auto_238974 ) ( ON ?auto_238976 ?auto_238975 ) ( ON ?auto_238977 ?auto_238976 ) ( not ( = ?auto_238970 ?auto_238971 ) ) ( not ( = ?auto_238970 ?auto_238972 ) ) ( not ( = ?auto_238970 ?auto_238973 ) ) ( not ( = ?auto_238970 ?auto_238974 ) ) ( not ( = ?auto_238970 ?auto_238975 ) ) ( not ( = ?auto_238970 ?auto_238976 ) ) ( not ( = ?auto_238970 ?auto_238977 ) ) ( not ( = ?auto_238970 ?auto_238978 ) ) ( not ( = ?auto_238970 ?auto_238979 ) ) ( not ( = ?auto_238971 ?auto_238972 ) ) ( not ( = ?auto_238971 ?auto_238973 ) ) ( not ( = ?auto_238971 ?auto_238974 ) ) ( not ( = ?auto_238971 ?auto_238975 ) ) ( not ( = ?auto_238971 ?auto_238976 ) ) ( not ( = ?auto_238971 ?auto_238977 ) ) ( not ( = ?auto_238971 ?auto_238978 ) ) ( not ( = ?auto_238971 ?auto_238979 ) ) ( not ( = ?auto_238972 ?auto_238973 ) ) ( not ( = ?auto_238972 ?auto_238974 ) ) ( not ( = ?auto_238972 ?auto_238975 ) ) ( not ( = ?auto_238972 ?auto_238976 ) ) ( not ( = ?auto_238972 ?auto_238977 ) ) ( not ( = ?auto_238972 ?auto_238978 ) ) ( not ( = ?auto_238972 ?auto_238979 ) ) ( not ( = ?auto_238973 ?auto_238974 ) ) ( not ( = ?auto_238973 ?auto_238975 ) ) ( not ( = ?auto_238973 ?auto_238976 ) ) ( not ( = ?auto_238973 ?auto_238977 ) ) ( not ( = ?auto_238973 ?auto_238978 ) ) ( not ( = ?auto_238973 ?auto_238979 ) ) ( not ( = ?auto_238974 ?auto_238975 ) ) ( not ( = ?auto_238974 ?auto_238976 ) ) ( not ( = ?auto_238974 ?auto_238977 ) ) ( not ( = ?auto_238974 ?auto_238978 ) ) ( not ( = ?auto_238974 ?auto_238979 ) ) ( not ( = ?auto_238975 ?auto_238976 ) ) ( not ( = ?auto_238975 ?auto_238977 ) ) ( not ( = ?auto_238975 ?auto_238978 ) ) ( not ( = ?auto_238975 ?auto_238979 ) ) ( not ( = ?auto_238976 ?auto_238977 ) ) ( not ( = ?auto_238976 ?auto_238978 ) ) ( not ( = ?auto_238976 ?auto_238979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_238977 ?auto_238978 ?auto_238979 )
      ( MAKE-9CRATE-VERIFY ?auto_238970 ?auto_238971 ?auto_238972 ?auto_238973 ?auto_238974 ?auto_238975 ?auto_238976 ?auto_238977 ?auto_238978 ?auto_238979 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239069 - SURFACE
      ?auto_239070 - SURFACE
      ?auto_239071 - SURFACE
      ?auto_239072 - SURFACE
      ?auto_239073 - SURFACE
      ?auto_239074 - SURFACE
      ?auto_239075 - SURFACE
      ?auto_239076 - SURFACE
      ?auto_239077 - SURFACE
      ?auto_239078 - SURFACE
    )
    :vars
    (
      ?auto_239082 - HOIST
      ?auto_239080 - PLACE
      ?auto_239079 - TRUCK
      ?auto_239081 - PLACE
      ?auto_239083 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_239082 ?auto_239080 ) ( SURFACE-AT ?auto_239077 ?auto_239080 ) ( CLEAR ?auto_239077 ) ( IS-CRATE ?auto_239078 ) ( not ( = ?auto_239077 ?auto_239078 ) ) ( AVAILABLE ?auto_239082 ) ( ON ?auto_239077 ?auto_239076 ) ( not ( = ?auto_239076 ?auto_239077 ) ) ( not ( = ?auto_239076 ?auto_239078 ) ) ( TRUCK-AT ?auto_239079 ?auto_239081 ) ( not ( = ?auto_239081 ?auto_239080 ) ) ( HOIST-AT ?auto_239083 ?auto_239081 ) ( LIFTING ?auto_239083 ?auto_239078 ) ( not ( = ?auto_239082 ?auto_239083 ) ) ( ON ?auto_239070 ?auto_239069 ) ( ON ?auto_239071 ?auto_239070 ) ( ON ?auto_239072 ?auto_239071 ) ( ON ?auto_239073 ?auto_239072 ) ( ON ?auto_239074 ?auto_239073 ) ( ON ?auto_239075 ?auto_239074 ) ( ON ?auto_239076 ?auto_239075 ) ( not ( = ?auto_239069 ?auto_239070 ) ) ( not ( = ?auto_239069 ?auto_239071 ) ) ( not ( = ?auto_239069 ?auto_239072 ) ) ( not ( = ?auto_239069 ?auto_239073 ) ) ( not ( = ?auto_239069 ?auto_239074 ) ) ( not ( = ?auto_239069 ?auto_239075 ) ) ( not ( = ?auto_239069 ?auto_239076 ) ) ( not ( = ?auto_239069 ?auto_239077 ) ) ( not ( = ?auto_239069 ?auto_239078 ) ) ( not ( = ?auto_239070 ?auto_239071 ) ) ( not ( = ?auto_239070 ?auto_239072 ) ) ( not ( = ?auto_239070 ?auto_239073 ) ) ( not ( = ?auto_239070 ?auto_239074 ) ) ( not ( = ?auto_239070 ?auto_239075 ) ) ( not ( = ?auto_239070 ?auto_239076 ) ) ( not ( = ?auto_239070 ?auto_239077 ) ) ( not ( = ?auto_239070 ?auto_239078 ) ) ( not ( = ?auto_239071 ?auto_239072 ) ) ( not ( = ?auto_239071 ?auto_239073 ) ) ( not ( = ?auto_239071 ?auto_239074 ) ) ( not ( = ?auto_239071 ?auto_239075 ) ) ( not ( = ?auto_239071 ?auto_239076 ) ) ( not ( = ?auto_239071 ?auto_239077 ) ) ( not ( = ?auto_239071 ?auto_239078 ) ) ( not ( = ?auto_239072 ?auto_239073 ) ) ( not ( = ?auto_239072 ?auto_239074 ) ) ( not ( = ?auto_239072 ?auto_239075 ) ) ( not ( = ?auto_239072 ?auto_239076 ) ) ( not ( = ?auto_239072 ?auto_239077 ) ) ( not ( = ?auto_239072 ?auto_239078 ) ) ( not ( = ?auto_239073 ?auto_239074 ) ) ( not ( = ?auto_239073 ?auto_239075 ) ) ( not ( = ?auto_239073 ?auto_239076 ) ) ( not ( = ?auto_239073 ?auto_239077 ) ) ( not ( = ?auto_239073 ?auto_239078 ) ) ( not ( = ?auto_239074 ?auto_239075 ) ) ( not ( = ?auto_239074 ?auto_239076 ) ) ( not ( = ?auto_239074 ?auto_239077 ) ) ( not ( = ?auto_239074 ?auto_239078 ) ) ( not ( = ?auto_239075 ?auto_239076 ) ) ( not ( = ?auto_239075 ?auto_239077 ) ) ( not ( = ?auto_239075 ?auto_239078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239076 ?auto_239077 ?auto_239078 )
      ( MAKE-9CRATE-VERIFY ?auto_239069 ?auto_239070 ?auto_239071 ?auto_239072 ?auto_239073 ?auto_239074 ?auto_239075 ?auto_239076 ?auto_239077 ?auto_239078 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239177 - SURFACE
      ?auto_239178 - SURFACE
      ?auto_239179 - SURFACE
      ?auto_239180 - SURFACE
      ?auto_239181 - SURFACE
      ?auto_239182 - SURFACE
      ?auto_239183 - SURFACE
      ?auto_239184 - SURFACE
      ?auto_239185 - SURFACE
      ?auto_239186 - SURFACE
    )
    :vars
    (
      ?auto_239187 - HOIST
      ?auto_239191 - PLACE
      ?auto_239192 - TRUCK
      ?auto_239190 - PLACE
      ?auto_239188 - HOIST
      ?auto_239189 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239187 ?auto_239191 ) ( SURFACE-AT ?auto_239185 ?auto_239191 ) ( CLEAR ?auto_239185 ) ( IS-CRATE ?auto_239186 ) ( not ( = ?auto_239185 ?auto_239186 ) ) ( AVAILABLE ?auto_239187 ) ( ON ?auto_239185 ?auto_239184 ) ( not ( = ?auto_239184 ?auto_239185 ) ) ( not ( = ?auto_239184 ?auto_239186 ) ) ( TRUCK-AT ?auto_239192 ?auto_239190 ) ( not ( = ?auto_239190 ?auto_239191 ) ) ( HOIST-AT ?auto_239188 ?auto_239190 ) ( not ( = ?auto_239187 ?auto_239188 ) ) ( AVAILABLE ?auto_239188 ) ( SURFACE-AT ?auto_239186 ?auto_239190 ) ( ON ?auto_239186 ?auto_239189 ) ( CLEAR ?auto_239186 ) ( not ( = ?auto_239185 ?auto_239189 ) ) ( not ( = ?auto_239186 ?auto_239189 ) ) ( not ( = ?auto_239184 ?auto_239189 ) ) ( ON ?auto_239178 ?auto_239177 ) ( ON ?auto_239179 ?auto_239178 ) ( ON ?auto_239180 ?auto_239179 ) ( ON ?auto_239181 ?auto_239180 ) ( ON ?auto_239182 ?auto_239181 ) ( ON ?auto_239183 ?auto_239182 ) ( ON ?auto_239184 ?auto_239183 ) ( not ( = ?auto_239177 ?auto_239178 ) ) ( not ( = ?auto_239177 ?auto_239179 ) ) ( not ( = ?auto_239177 ?auto_239180 ) ) ( not ( = ?auto_239177 ?auto_239181 ) ) ( not ( = ?auto_239177 ?auto_239182 ) ) ( not ( = ?auto_239177 ?auto_239183 ) ) ( not ( = ?auto_239177 ?auto_239184 ) ) ( not ( = ?auto_239177 ?auto_239185 ) ) ( not ( = ?auto_239177 ?auto_239186 ) ) ( not ( = ?auto_239177 ?auto_239189 ) ) ( not ( = ?auto_239178 ?auto_239179 ) ) ( not ( = ?auto_239178 ?auto_239180 ) ) ( not ( = ?auto_239178 ?auto_239181 ) ) ( not ( = ?auto_239178 ?auto_239182 ) ) ( not ( = ?auto_239178 ?auto_239183 ) ) ( not ( = ?auto_239178 ?auto_239184 ) ) ( not ( = ?auto_239178 ?auto_239185 ) ) ( not ( = ?auto_239178 ?auto_239186 ) ) ( not ( = ?auto_239178 ?auto_239189 ) ) ( not ( = ?auto_239179 ?auto_239180 ) ) ( not ( = ?auto_239179 ?auto_239181 ) ) ( not ( = ?auto_239179 ?auto_239182 ) ) ( not ( = ?auto_239179 ?auto_239183 ) ) ( not ( = ?auto_239179 ?auto_239184 ) ) ( not ( = ?auto_239179 ?auto_239185 ) ) ( not ( = ?auto_239179 ?auto_239186 ) ) ( not ( = ?auto_239179 ?auto_239189 ) ) ( not ( = ?auto_239180 ?auto_239181 ) ) ( not ( = ?auto_239180 ?auto_239182 ) ) ( not ( = ?auto_239180 ?auto_239183 ) ) ( not ( = ?auto_239180 ?auto_239184 ) ) ( not ( = ?auto_239180 ?auto_239185 ) ) ( not ( = ?auto_239180 ?auto_239186 ) ) ( not ( = ?auto_239180 ?auto_239189 ) ) ( not ( = ?auto_239181 ?auto_239182 ) ) ( not ( = ?auto_239181 ?auto_239183 ) ) ( not ( = ?auto_239181 ?auto_239184 ) ) ( not ( = ?auto_239181 ?auto_239185 ) ) ( not ( = ?auto_239181 ?auto_239186 ) ) ( not ( = ?auto_239181 ?auto_239189 ) ) ( not ( = ?auto_239182 ?auto_239183 ) ) ( not ( = ?auto_239182 ?auto_239184 ) ) ( not ( = ?auto_239182 ?auto_239185 ) ) ( not ( = ?auto_239182 ?auto_239186 ) ) ( not ( = ?auto_239182 ?auto_239189 ) ) ( not ( = ?auto_239183 ?auto_239184 ) ) ( not ( = ?auto_239183 ?auto_239185 ) ) ( not ( = ?auto_239183 ?auto_239186 ) ) ( not ( = ?auto_239183 ?auto_239189 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239184 ?auto_239185 ?auto_239186 )
      ( MAKE-9CRATE-VERIFY ?auto_239177 ?auto_239178 ?auto_239179 ?auto_239180 ?auto_239181 ?auto_239182 ?auto_239183 ?auto_239184 ?auto_239185 ?auto_239186 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239286 - SURFACE
      ?auto_239287 - SURFACE
      ?auto_239288 - SURFACE
      ?auto_239289 - SURFACE
      ?auto_239290 - SURFACE
      ?auto_239291 - SURFACE
      ?auto_239292 - SURFACE
      ?auto_239293 - SURFACE
      ?auto_239294 - SURFACE
      ?auto_239295 - SURFACE
    )
    :vars
    (
      ?auto_239297 - HOIST
      ?auto_239301 - PLACE
      ?auto_239298 - PLACE
      ?auto_239296 - HOIST
      ?auto_239299 - SURFACE
      ?auto_239300 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239297 ?auto_239301 ) ( SURFACE-AT ?auto_239294 ?auto_239301 ) ( CLEAR ?auto_239294 ) ( IS-CRATE ?auto_239295 ) ( not ( = ?auto_239294 ?auto_239295 ) ) ( AVAILABLE ?auto_239297 ) ( ON ?auto_239294 ?auto_239293 ) ( not ( = ?auto_239293 ?auto_239294 ) ) ( not ( = ?auto_239293 ?auto_239295 ) ) ( not ( = ?auto_239298 ?auto_239301 ) ) ( HOIST-AT ?auto_239296 ?auto_239298 ) ( not ( = ?auto_239297 ?auto_239296 ) ) ( AVAILABLE ?auto_239296 ) ( SURFACE-AT ?auto_239295 ?auto_239298 ) ( ON ?auto_239295 ?auto_239299 ) ( CLEAR ?auto_239295 ) ( not ( = ?auto_239294 ?auto_239299 ) ) ( not ( = ?auto_239295 ?auto_239299 ) ) ( not ( = ?auto_239293 ?auto_239299 ) ) ( TRUCK-AT ?auto_239300 ?auto_239301 ) ( ON ?auto_239287 ?auto_239286 ) ( ON ?auto_239288 ?auto_239287 ) ( ON ?auto_239289 ?auto_239288 ) ( ON ?auto_239290 ?auto_239289 ) ( ON ?auto_239291 ?auto_239290 ) ( ON ?auto_239292 ?auto_239291 ) ( ON ?auto_239293 ?auto_239292 ) ( not ( = ?auto_239286 ?auto_239287 ) ) ( not ( = ?auto_239286 ?auto_239288 ) ) ( not ( = ?auto_239286 ?auto_239289 ) ) ( not ( = ?auto_239286 ?auto_239290 ) ) ( not ( = ?auto_239286 ?auto_239291 ) ) ( not ( = ?auto_239286 ?auto_239292 ) ) ( not ( = ?auto_239286 ?auto_239293 ) ) ( not ( = ?auto_239286 ?auto_239294 ) ) ( not ( = ?auto_239286 ?auto_239295 ) ) ( not ( = ?auto_239286 ?auto_239299 ) ) ( not ( = ?auto_239287 ?auto_239288 ) ) ( not ( = ?auto_239287 ?auto_239289 ) ) ( not ( = ?auto_239287 ?auto_239290 ) ) ( not ( = ?auto_239287 ?auto_239291 ) ) ( not ( = ?auto_239287 ?auto_239292 ) ) ( not ( = ?auto_239287 ?auto_239293 ) ) ( not ( = ?auto_239287 ?auto_239294 ) ) ( not ( = ?auto_239287 ?auto_239295 ) ) ( not ( = ?auto_239287 ?auto_239299 ) ) ( not ( = ?auto_239288 ?auto_239289 ) ) ( not ( = ?auto_239288 ?auto_239290 ) ) ( not ( = ?auto_239288 ?auto_239291 ) ) ( not ( = ?auto_239288 ?auto_239292 ) ) ( not ( = ?auto_239288 ?auto_239293 ) ) ( not ( = ?auto_239288 ?auto_239294 ) ) ( not ( = ?auto_239288 ?auto_239295 ) ) ( not ( = ?auto_239288 ?auto_239299 ) ) ( not ( = ?auto_239289 ?auto_239290 ) ) ( not ( = ?auto_239289 ?auto_239291 ) ) ( not ( = ?auto_239289 ?auto_239292 ) ) ( not ( = ?auto_239289 ?auto_239293 ) ) ( not ( = ?auto_239289 ?auto_239294 ) ) ( not ( = ?auto_239289 ?auto_239295 ) ) ( not ( = ?auto_239289 ?auto_239299 ) ) ( not ( = ?auto_239290 ?auto_239291 ) ) ( not ( = ?auto_239290 ?auto_239292 ) ) ( not ( = ?auto_239290 ?auto_239293 ) ) ( not ( = ?auto_239290 ?auto_239294 ) ) ( not ( = ?auto_239290 ?auto_239295 ) ) ( not ( = ?auto_239290 ?auto_239299 ) ) ( not ( = ?auto_239291 ?auto_239292 ) ) ( not ( = ?auto_239291 ?auto_239293 ) ) ( not ( = ?auto_239291 ?auto_239294 ) ) ( not ( = ?auto_239291 ?auto_239295 ) ) ( not ( = ?auto_239291 ?auto_239299 ) ) ( not ( = ?auto_239292 ?auto_239293 ) ) ( not ( = ?auto_239292 ?auto_239294 ) ) ( not ( = ?auto_239292 ?auto_239295 ) ) ( not ( = ?auto_239292 ?auto_239299 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239293 ?auto_239294 ?auto_239295 )
      ( MAKE-9CRATE-VERIFY ?auto_239286 ?auto_239287 ?auto_239288 ?auto_239289 ?auto_239290 ?auto_239291 ?auto_239292 ?auto_239293 ?auto_239294 ?auto_239295 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239395 - SURFACE
      ?auto_239396 - SURFACE
      ?auto_239397 - SURFACE
      ?auto_239398 - SURFACE
      ?auto_239399 - SURFACE
      ?auto_239400 - SURFACE
      ?auto_239401 - SURFACE
      ?auto_239402 - SURFACE
      ?auto_239403 - SURFACE
      ?auto_239404 - SURFACE
    )
    :vars
    (
      ?auto_239408 - HOIST
      ?auto_239405 - PLACE
      ?auto_239409 - PLACE
      ?auto_239407 - HOIST
      ?auto_239410 - SURFACE
      ?auto_239406 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239408 ?auto_239405 ) ( IS-CRATE ?auto_239404 ) ( not ( = ?auto_239403 ?auto_239404 ) ) ( not ( = ?auto_239402 ?auto_239403 ) ) ( not ( = ?auto_239402 ?auto_239404 ) ) ( not ( = ?auto_239409 ?auto_239405 ) ) ( HOIST-AT ?auto_239407 ?auto_239409 ) ( not ( = ?auto_239408 ?auto_239407 ) ) ( AVAILABLE ?auto_239407 ) ( SURFACE-AT ?auto_239404 ?auto_239409 ) ( ON ?auto_239404 ?auto_239410 ) ( CLEAR ?auto_239404 ) ( not ( = ?auto_239403 ?auto_239410 ) ) ( not ( = ?auto_239404 ?auto_239410 ) ) ( not ( = ?auto_239402 ?auto_239410 ) ) ( TRUCK-AT ?auto_239406 ?auto_239405 ) ( SURFACE-AT ?auto_239402 ?auto_239405 ) ( CLEAR ?auto_239402 ) ( LIFTING ?auto_239408 ?auto_239403 ) ( IS-CRATE ?auto_239403 ) ( ON ?auto_239396 ?auto_239395 ) ( ON ?auto_239397 ?auto_239396 ) ( ON ?auto_239398 ?auto_239397 ) ( ON ?auto_239399 ?auto_239398 ) ( ON ?auto_239400 ?auto_239399 ) ( ON ?auto_239401 ?auto_239400 ) ( ON ?auto_239402 ?auto_239401 ) ( not ( = ?auto_239395 ?auto_239396 ) ) ( not ( = ?auto_239395 ?auto_239397 ) ) ( not ( = ?auto_239395 ?auto_239398 ) ) ( not ( = ?auto_239395 ?auto_239399 ) ) ( not ( = ?auto_239395 ?auto_239400 ) ) ( not ( = ?auto_239395 ?auto_239401 ) ) ( not ( = ?auto_239395 ?auto_239402 ) ) ( not ( = ?auto_239395 ?auto_239403 ) ) ( not ( = ?auto_239395 ?auto_239404 ) ) ( not ( = ?auto_239395 ?auto_239410 ) ) ( not ( = ?auto_239396 ?auto_239397 ) ) ( not ( = ?auto_239396 ?auto_239398 ) ) ( not ( = ?auto_239396 ?auto_239399 ) ) ( not ( = ?auto_239396 ?auto_239400 ) ) ( not ( = ?auto_239396 ?auto_239401 ) ) ( not ( = ?auto_239396 ?auto_239402 ) ) ( not ( = ?auto_239396 ?auto_239403 ) ) ( not ( = ?auto_239396 ?auto_239404 ) ) ( not ( = ?auto_239396 ?auto_239410 ) ) ( not ( = ?auto_239397 ?auto_239398 ) ) ( not ( = ?auto_239397 ?auto_239399 ) ) ( not ( = ?auto_239397 ?auto_239400 ) ) ( not ( = ?auto_239397 ?auto_239401 ) ) ( not ( = ?auto_239397 ?auto_239402 ) ) ( not ( = ?auto_239397 ?auto_239403 ) ) ( not ( = ?auto_239397 ?auto_239404 ) ) ( not ( = ?auto_239397 ?auto_239410 ) ) ( not ( = ?auto_239398 ?auto_239399 ) ) ( not ( = ?auto_239398 ?auto_239400 ) ) ( not ( = ?auto_239398 ?auto_239401 ) ) ( not ( = ?auto_239398 ?auto_239402 ) ) ( not ( = ?auto_239398 ?auto_239403 ) ) ( not ( = ?auto_239398 ?auto_239404 ) ) ( not ( = ?auto_239398 ?auto_239410 ) ) ( not ( = ?auto_239399 ?auto_239400 ) ) ( not ( = ?auto_239399 ?auto_239401 ) ) ( not ( = ?auto_239399 ?auto_239402 ) ) ( not ( = ?auto_239399 ?auto_239403 ) ) ( not ( = ?auto_239399 ?auto_239404 ) ) ( not ( = ?auto_239399 ?auto_239410 ) ) ( not ( = ?auto_239400 ?auto_239401 ) ) ( not ( = ?auto_239400 ?auto_239402 ) ) ( not ( = ?auto_239400 ?auto_239403 ) ) ( not ( = ?auto_239400 ?auto_239404 ) ) ( not ( = ?auto_239400 ?auto_239410 ) ) ( not ( = ?auto_239401 ?auto_239402 ) ) ( not ( = ?auto_239401 ?auto_239403 ) ) ( not ( = ?auto_239401 ?auto_239404 ) ) ( not ( = ?auto_239401 ?auto_239410 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239402 ?auto_239403 ?auto_239404 )
      ( MAKE-9CRATE-VERIFY ?auto_239395 ?auto_239396 ?auto_239397 ?auto_239398 ?auto_239399 ?auto_239400 ?auto_239401 ?auto_239402 ?auto_239403 ?auto_239404 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239504 - SURFACE
      ?auto_239505 - SURFACE
      ?auto_239506 - SURFACE
      ?auto_239507 - SURFACE
      ?auto_239508 - SURFACE
      ?auto_239509 - SURFACE
      ?auto_239510 - SURFACE
      ?auto_239511 - SURFACE
      ?auto_239512 - SURFACE
      ?auto_239513 - SURFACE
    )
    :vars
    (
      ?auto_239514 - HOIST
      ?auto_239515 - PLACE
      ?auto_239518 - PLACE
      ?auto_239517 - HOIST
      ?auto_239516 - SURFACE
      ?auto_239519 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239514 ?auto_239515 ) ( IS-CRATE ?auto_239513 ) ( not ( = ?auto_239512 ?auto_239513 ) ) ( not ( = ?auto_239511 ?auto_239512 ) ) ( not ( = ?auto_239511 ?auto_239513 ) ) ( not ( = ?auto_239518 ?auto_239515 ) ) ( HOIST-AT ?auto_239517 ?auto_239518 ) ( not ( = ?auto_239514 ?auto_239517 ) ) ( AVAILABLE ?auto_239517 ) ( SURFACE-AT ?auto_239513 ?auto_239518 ) ( ON ?auto_239513 ?auto_239516 ) ( CLEAR ?auto_239513 ) ( not ( = ?auto_239512 ?auto_239516 ) ) ( not ( = ?auto_239513 ?auto_239516 ) ) ( not ( = ?auto_239511 ?auto_239516 ) ) ( TRUCK-AT ?auto_239519 ?auto_239515 ) ( SURFACE-AT ?auto_239511 ?auto_239515 ) ( CLEAR ?auto_239511 ) ( IS-CRATE ?auto_239512 ) ( AVAILABLE ?auto_239514 ) ( IN ?auto_239512 ?auto_239519 ) ( ON ?auto_239505 ?auto_239504 ) ( ON ?auto_239506 ?auto_239505 ) ( ON ?auto_239507 ?auto_239506 ) ( ON ?auto_239508 ?auto_239507 ) ( ON ?auto_239509 ?auto_239508 ) ( ON ?auto_239510 ?auto_239509 ) ( ON ?auto_239511 ?auto_239510 ) ( not ( = ?auto_239504 ?auto_239505 ) ) ( not ( = ?auto_239504 ?auto_239506 ) ) ( not ( = ?auto_239504 ?auto_239507 ) ) ( not ( = ?auto_239504 ?auto_239508 ) ) ( not ( = ?auto_239504 ?auto_239509 ) ) ( not ( = ?auto_239504 ?auto_239510 ) ) ( not ( = ?auto_239504 ?auto_239511 ) ) ( not ( = ?auto_239504 ?auto_239512 ) ) ( not ( = ?auto_239504 ?auto_239513 ) ) ( not ( = ?auto_239504 ?auto_239516 ) ) ( not ( = ?auto_239505 ?auto_239506 ) ) ( not ( = ?auto_239505 ?auto_239507 ) ) ( not ( = ?auto_239505 ?auto_239508 ) ) ( not ( = ?auto_239505 ?auto_239509 ) ) ( not ( = ?auto_239505 ?auto_239510 ) ) ( not ( = ?auto_239505 ?auto_239511 ) ) ( not ( = ?auto_239505 ?auto_239512 ) ) ( not ( = ?auto_239505 ?auto_239513 ) ) ( not ( = ?auto_239505 ?auto_239516 ) ) ( not ( = ?auto_239506 ?auto_239507 ) ) ( not ( = ?auto_239506 ?auto_239508 ) ) ( not ( = ?auto_239506 ?auto_239509 ) ) ( not ( = ?auto_239506 ?auto_239510 ) ) ( not ( = ?auto_239506 ?auto_239511 ) ) ( not ( = ?auto_239506 ?auto_239512 ) ) ( not ( = ?auto_239506 ?auto_239513 ) ) ( not ( = ?auto_239506 ?auto_239516 ) ) ( not ( = ?auto_239507 ?auto_239508 ) ) ( not ( = ?auto_239507 ?auto_239509 ) ) ( not ( = ?auto_239507 ?auto_239510 ) ) ( not ( = ?auto_239507 ?auto_239511 ) ) ( not ( = ?auto_239507 ?auto_239512 ) ) ( not ( = ?auto_239507 ?auto_239513 ) ) ( not ( = ?auto_239507 ?auto_239516 ) ) ( not ( = ?auto_239508 ?auto_239509 ) ) ( not ( = ?auto_239508 ?auto_239510 ) ) ( not ( = ?auto_239508 ?auto_239511 ) ) ( not ( = ?auto_239508 ?auto_239512 ) ) ( not ( = ?auto_239508 ?auto_239513 ) ) ( not ( = ?auto_239508 ?auto_239516 ) ) ( not ( = ?auto_239509 ?auto_239510 ) ) ( not ( = ?auto_239509 ?auto_239511 ) ) ( not ( = ?auto_239509 ?auto_239512 ) ) ( not ( = ?auto_239509 ?auto_239513 ) ) ( not ( = ?auto_239509 ?auto_239516 ) ) ( not ( = ?auto_239510 ?auto_239511 ) ) ( not ( = ?auto_239510 ?auto_239512 ) ) ( not ( = ?auto_239510 ?auto_239513 ) ) ( not ( = ?auto_239510 ?auto_239516 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239511 ?auto_239512 ?auto_239513 )
      ( MAKE-9CRATE-VERIFY ?auto_239504 ?auto_239505 ?auto_239506 ?auto_239507 ?auto_239508 ?auto_239509 ?auto_239510 ?auto_239511 ?auto_239512 ?auto_239513 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_239559 - SURFACE
      ?auto_239560 - SURFACE
      ?auto_239561 - SURFACE
      ?auto_239562 - SURFACE
      ?auto_239563 - SURFACE
      ?auto_239564 - SURFACE
    )
    :vars
    (
      ?auto_239567 - HOIST
      ?auto_239570 - PLACE
      ?auto_239565 - PLACE
      ?auto_239569 - HOIST
      ?auto_239568 - SURFACE
      ?auto_239566 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239567 ?auto_239570 ) ( IS-CRATE ?auto_239564 ) ( not ( = ?auto_239563 ?auto_239564 ) ) ( not ( = ?auto_239562 ?auto_239563 ) ) ( not ( = ?auto_239562 ?auto_239564 ) ) ( not ( = ?auto_239565 ?auto_239570 ) ) ( HOIST-AT ?auto_239569 ?auto_239565 ) ( not ( = ?auto_239567 ?auto_239569 ) ) ( AVAILABLE ?auto_239569 ) ( SURFACE-AT ?auto_239564 ?auto_239565 ) ( ON ?auto_239564 ?auto_239568 ) ( CLEAR ?auto_239564 ) ( not ( = ?auto_239563 ?auto_239568 ) ) ( not ( = ?auto_239564 ?auto_239568 ) ) ( not ( = ?auto_239562 ?auto_239568 ) ) ( SURFACE-AT ?auto_239562 ?auto_239570 ) ( CLEAR ?auto_239562 ) ( IS-CRATE ?auto_239563 ) ( AVAILABLE ?auto_239567 ) ( IN ?auto_239563 ?auto_239566 ) ( TRUCK-AT ?auto_239566 ?auto_239565 ) ( ON ?auto_239560 ?auto_239559 ) ( ON ?auto_239561 ?auto_239560 ) ( ON ?auto_239562 ?auto_239561 ) ( not ( = ?auto_239559 ?auto_239560 ) ) ( not ( = ?auto_239559 ?auto_239561 ) ) ( not ( = ?auto_239559 ?auto_239562 ) ) ( not ( = ?auto_239559 ?auto_239563 ) ) ( not ( = ?auto_239559 ?auto_239564 ) ) ( not ( = ?auto_239559 ?auto_239568 ) ) ( not ( = ?auto_239560 ?auto_239561 ) ) ( not ( = ?auto_239560 ?auto_239562 ) ) ( not ( = ?auto_239560 ?auto_239563 ) ) ( not ( = ?auto_239560 ?auto_239564 ) ) ( not ( = ?auto_239560 ?auto_239568 ) ) ( not ( = ?auto_239561 ?auto_239562 ) ) ( not ( = ?auto_239561 ?auto_239563 ) ) ( not ( = ?auto_239561 ?auto_239564 ) ) ( not ( = ?auto_239561 ?auto_239568 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239562 ?auto_239563 ?auto_239564 )
      ( MAKE-5CRATE-VERIFY ?auto_239559 ?auto_239560 ?auto_239561 ?auto_239562 ?auto_239563 ?auto_239564 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_239571 - SURFACE
      ?auto_239572 - SURFACE
      ?auto_239573 - SURFACE
      ?auto_239574 - SURFACE
      ?auto_239575 - SURFACE
      ?auto_239576 - SURFACE
      ?auto_239577 - SURFACE
    )
    :vars
    (
      ?auto_239580 - HOIST
      ?auto_239583 - PLACE
      ?auto_239578 - PLACE
      ?auto_239582 - HOIST
      ?auto_239581 - SURFACE
      ?auto_239579 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239580 ?auto_239583 ) ( IS-CRATE ?auto_239577 ) ( not ( = ?auto_239576 ?auto_239577 ) ) ( not ( = ?auto_239575 ?auto_239576 ) ) ( not ( = ?auto_239575 ?auto_239577 ) ) ( not ( = ?auto_239578 ?auto_239583 ) ) ( HOIST-AT ?auto_239582 ?auto_239578 ) ( not ( = ?auto_239580 ?auto_239582 ) ) ( AVAILABLE ?auto_239582 ) ( SURFACE-AT ?auto_239577 ?auto_239578 ) ( ON ?auto_239577 ?auto_239581 ) ( CLEAR ?auto_239577 ) ( not ( = ?auto_239576 ?auto_239581 ) ) ( not ( = ?auto_239577 ?auto_239581 ) ) ( not ( = ?auto_239575 ?auto_239581 ) ) ( SURFACE-AT ?auto_239575 ?auto_239583 ) ( CLEAR ?auto_239575 ) ( IS-CRATE ?auto_239576 ) ( AVAILABLE ?auto_239580 ) ( IN ?auto_239576 ?auto_239579 ) ( TRUCK-AT ?auto_239579 ?auto_239578 ) ( ON ?auto_239572 ?auto_239571 ) ( ON ?auto_239573 ?auto_239572 ) ( ON ?auto_239574 ?auto_239573 ) ( ON ?auto_239575 ?auto_239574 ) ( not ( = ?auto_239571 ?auto_239572 ) ) ( not ( = ?auto_239571 ?auto_239573 ) ) ( not ( = ?auto_239571 ?auto_239574 ) ) ( not ( = ?auto_239571 ?auto_239575 ) ) ( not ( = ?auto_239571 ?auto_239576 ) ) ( not ( = ?auto_239571 ?auto_239577 ) ) ( not ( = ?auto_239571 ?auto_239581 ) ) ( not ( = ?auto_239572 ?auto_239573 ) ) ( not ( = ?auto_239572 ?auto_239574 ) ) ( not ( = ?auto_239572 ?auto_239575 ) ) ( not ( = ?auto_239572 ?auto_239576 ) ) ( not ( = ?auto_239572 ?auto_239577 ) ) ( not ( = ?auto_239572 ?auto_239581 ) ) ( not ( = ?auto_239573 ?auto_239574 ) ) ( not ( = ?auto_239573 ?auto_239575 ) ) ( not ( = ?auto_239573 ?auto_239576 ) ) ( not ( = ?auto_239573 ?auto_239577 ) ) ( not ( = ?auto_239573 ?auto_239581 ) ) ( not ( = ?auto_239574 ?auto_239575 ) ) ( not ( = ?auto_239574 ?auto_239576 ) ) ( not ( = ?auto_239574 ?auto_239577 ) ) ( not ( = ?auto_239574 ?auto_239581 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239575 ?auto_239576 ?auto_239577 )
      ( MAKE-6CRATE-VERIFY ?auto_239571 ?auto_239572 ?auto_239573 ?auto_239574 ?auto_239575 ?auto_239576 ?auto_239577 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_239584 - SURFACE
      ?auto_239585 - SURFACE
      ?auto_239586 - SURFACE
      ?auto_239587 - SURFACE
      ?auto_239588 - SURFACE
      ?auto_239589 - SURFACE
      ?auto_239590 - SURFACE
      ?auto_239591 - SURFACE
    )
    :vars
    (
      ?auto_239594 - HOIST
      ?auto_239597 - PLACE
      ?auto_239592 - PLACE
      ?auto_239596 - HOIST
      ?auto_239595 - SURFACE
      ?auto_239593 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239594 ?auto_239597 ) ( IS-CRATE ?auto_239591 ) ( not ( = ?auto_239590 ?auto_239591 ) ) ( not ( = ?auto_239589 ?auto_239590 ) ) ( not ( = ?auto_239589 ?auto_239591 ) ) ( not ( = ?auto_239592 ?auto_239597 ) ) ( HOIST-AT ?auto_239596 ?auto_239592 ) ( not ( = ?auto_239594 ?auto_239596 ) ) ( AVAILABLE ?auto_239596 ) ( SURFACE-AT ?auto_239591 ?auto_239592 ) ( ON ?auto_239591 ?auto_239595 ) ( CLEAR ?auto_239591 ) ( not ( = ?auto_239590 ?auto_239595 ) ) ( not ( = ?auto_239591 ?auto_239595 ) ) ( not ( = ?auto_239589 ?auto_239595 ) ) ( SURFACE-AT ?auto_239589 ?auto_239597 ) ( CLEAR ?auto_239589 ) ( IS-CRATE ?auto_239590 ) ( AVAILABLE ?auto_239594 ) ( IN ?auto_239590 ?auto_239593 ) ( TRUCK-AT ?auto_239593 ?auto_239592 ) ( ON ?auto_239585 ?auto_239584 ) ( ON ?auto_239586 ?auto_239585 ) ( ON ?auto_239587 ?auto_239586 ) ( ON ?auto_239588 ?auto_239587 ) ( ON ?auto_239589 ?auto_239588 ) ( not ( = ?auto_239584 ?auto_239585 ) ) ( not ( = ?auto_239584 ?auto_239586 ) ) ( not ( = ?auto_239584 ?auto_239587 ) ) ( not ( = ?auto_239584 ?auto_239588 ) ) ( not ( = ?auto_239584 ?auto_239589 ) ) ( not ( = ?auto_239584 ?auto_239590 ) ) ( not ( = ?auto_239584 ?auto_239591 ) ) ( not ( = ?auto_239584 ?auto_239595 ) ) ( not ( = ?auto_239585 ?auto_239586 ) ) ( not ( = ?auto_239585 ?auto_239587 ) ) ( not ( = ?auto_239585 ?auto_239588 ) ) ( not ( = ?auto_239585 ?auto_239589 ) ) ( not ( = ?auto_239585 ?auto_239590 ) ) ( not ( = ?auto_239585 ?auto_239591 ) ) ( not ( = ?auto_239585 ?auto_239595 ) ) ( not ( = ?auto_239586 ?auto_239587 ) ) ( not ( = ?auto_239586 ?auto_239588 ) ) ( not ( = ?auto_239586 ?auto_239589 ) ) ( not ( = ?auto_239586 ?auto_239590 ) ) ( not ( = ?auto_239586 ?auto_239591 ) ) ( not ( = ?auto_239586 ?auto_239595 ) ) ( not ( = ?auto_239587 ?auto_239588 ) ) ( not ( = ?auto_239587 ?auto_239589 ) ) ( not ( = ?auto_239587 ?auto_239590 ) ) ( not ( = ?auto_239587 ?auto_239591 ) ) ( not ( = ?auto_239587 ?auto_239595 ) ) ( not ( = ?auto_239588 ?auto_239589 ) ) ( not ( = ?auto_239588 ?auto_239590 ) ) ( not ( = ?auto_239588 ?auto_239591 ) ) ( not ( = ?auto_239588 ?auto_239595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239589 ?auto_239590 ?auto_239591 )
      ( MAKE-7CRATE-VERIFY ?auto_239584 ?auto_239585 ?auto_239586 ?auto_239587 ?auto_239588 ?auto_239589 ?auto_239590 ?auto_239591 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_239598 - SURFACE
      ?auto_239599 - SURFACE
      ?auto_239600 - SURFACE
      ?auto_239601 - SURFACE
      ?auto_239602 - SURFACE
      ?auto_239603 - SURFACE
      ?auto_239604 - SURFACE
      ?auto_239605 - SURFACE
      ?auto_239606 - SURFACE
    )
    :vars
    (
      ?auto_239609 - HOIST
      ?auto_239612 - PLACE
      ?auto_239607 - PLACE
      ?auto_239611 - HOIST
      ?auto_239610 - SURFACE
      ?auto_239608 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239609 ?auto_239612 ) ( IS-CRATE ?auto_239606 ) ( not ( = ?auto_239605 ?auto_239606 ) ) ( not ( = ?auto_239604 ?auto_239605 ) ) ( not ( = ?auto_239604 ?auto_239606 ) ) ( not ( = ?auto_239607 ?auto_239612 ) ) ( HOIST-AT ?auto_239611 ?auto_239607 ) ( not ( = ?auto_239609 ?auto_239611 ) ) ( AVAILABLE ?auto_239611 ) ( SURFACE-AT ?auto_239606 ?auto_239607 ) ( ON ?auto_239606 ?auto_239610 ) ( CLEAR ?auto_239606 ) ( not ( = ?auto_239605 ?auto_239610 ) ) ( not ( = ?auto_239606 ?auto_239610 ) ) ( not ( = ?auto_239604 ?auto_239610 ) ) ( SURFACE-AT ?auto_239604 ?auto_239612 ) ( CLEAR ?auto_239604 ) ( IS-CRATE ?auto_239605 ) ( AVAILABLE ?auto_239609 ) ( IN ?auto_239605 ?auto_239608 ) ( TRUCK-AT ?auto_239608 ?auto_239607 ) ( ON ?auto_239599 ?auto_239598 ) ( ON ?auto_239600 ?auto_239599 ) ( ON ?auto_239601 ?auto_239600 ) ( ON ?auto_239602 ?auto_239601 ) ( ON ?auto_239603 ?auto_239602 ) ( ON ?auto_239604 ?auto_239603 ) ( not ( = ?auto_239598 ?auto_239599 ) ) ( not ( = ?auto_239598 ?auto_239600 ) ) ( not ( = ?auto_239598 ?auto_239601 ) ) ( not ( = ?auto_239598 ?auto_239602 ) ) ( not ( = ?auto_239598 ?auto_239603 ) ) ( not ( = ?auto_239598 ?auto_239604 ) ) ( not ( = ?auto_239598 ?auto_239605 ) ) ( not ( = ?auto_239598 ?auto_239606 ) ) ( not ( = ?auto_239598 ?auto_239610 ) ) ( not ( = ?auto_239599 ?auto_239600 ) ) ( not ( = ?auto_239599 ?auto_239601 ) ) ( not ( = ?auto_239599 ?auto_239602 ) ) ( not ( = ?auto_239599 ?auto_239603 ) ) ( not ( = ?auto_239599 ?auto_239604 ) ) ( not ( = ?auto_239599 ?auto_239605 ) ) ( not ( = ?auto_239599 ?auto_239606 ) ) ( not ( = ?auto_239599 ?auto_239610 ) ) ( not ( = ?auto_239600 ?auto_239601 ) ) ( not ( = ?auto_239600 ?auto_239602 ) ) ( not ( = ?auto_239600 ?auto_239603 ) ) ( not ( = ?auto_239600 ?auto_239604 ) ) ( not ( = ?auto_239600 ?auto_239605 ) ) ( not ( = ?auto_239600 ?auto_239606 ) ) ( not ( = ?auto_239600 ?auto_239610 ) ) ( not ( = ?auto_239601 ?auto_239602 ) ) ( not ( = ?auto_239601 ?auto_239603 ) ) ( not ( = ?auto_239601 ?auto_239604 ) ) ( not ( = ?auto_239601 ?auto_239605 ) ) ( not ( = ?auto_239601 ?auto_239606 ) ) ( not ( = ?auto_239601 ?auto_239610 ) ) ( not ( = ?auto_239602 ?auto_239603 ) ) ( not ( = ?auto_239602 ?auto_239604 ) ) ( not ( = ?auto_239602 ?auto_239605 ) ) ( not ( = ?auto_239602 ?auto_239606 ) ) ( not ( = ?auto_239602 ?auto_239610 ) ) ( not ( = ?auto_239603 ?auto_239604 ) ) ( not ( = ?auto_239603 ?auto_239605 ) ) ( not ( = ?auto_239603 ?auto_239606 ) ) ( not ( = ?auto_239603 ?auto_239610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239604 ?auto_239605 ?auto_239606 )
      ( MAKE-8CRATE-VERIFY ?auto_239598 ?auto_239599 ?auto_239600 ?auto_239601 ?auto_239602 ?auto_239603 ?auto_239604 ?auto_239605 ?auto_239606 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239613 - SURFACE
      ?auto_239614 - SURFACE
      ?auto_239615 - SURFACE
      ?auto_239616 - SURFACE
      ?auto_239617 - SURFACE
      ?auto_239618 - SURFACE
      ?auto_239619 - SURFACE
      ?auto_239620 - SURFACE
      ?auto_239621 - SURFACE
      ?auto_239622 - SURFACE
    )
    :vars
    (
      ?auto_239625 - HOIST
      ?auto_239628 - PLACE
      ?auto_239623 - PLACE
      ?auto_239627 - HOIST
      ?auto_239626 - SURFACE
      ?auto_239624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239625 ?auto_239628 ) ( IS-CRATE ?auto_239622 ) ( not ( = ?auto_239621 ?auto_239622 ) ) ( not ( = ?auto_239620 ?auto_239621 ) ) ( not ( = ?auto_239620 ?auto_239622 ) ) ( not ( = ?auto_239623 ?auto_239628 ) ) ( HOIST-AT ?auto_239627 ?auto_239623 ) ( not ( = ?auto_239625 ?auto_239627 ) ) ( AVAILABLE ?auto_239627 ) ( SURFACE-AT ?auto_239622 ?auto_239623 ) ( ON ?auto_239622 ?auto_239626 ) ( CLEAR ?auto_239622 ) ( not ( = ?auto_239621 ?auto_239626 ) ) ( not ( = ?auto_239622 ?auto_239626 ) ) ( not ( = ?auto_239620 ?auto_239626 ) ) ( SURFACE-AT ?auto_239620 ?auto_239628 ) ( CLEAR ?auto_239620 ) ( IS-CRATE ?auto_239621 ) ( AVAILABLE ?auto_239625 ) ( IN ?auto_239621 ?auto_239624 ) ( TRUCK-AT ?auto_239624 ?auto_239623 ) ( ON ?auto_239614 ?auto_239613 ) ( ON ?auto_239615 ?auto_239614 ) ( ON ?auto_239616 ?auto_239615 ) ( ON ?auto_239617 ?auto_239616 ) ( ON ?auto_239618 ?auto_239617 ) ( ON ?auto_239619 ?auto_239618 ) ( ON ?auto_239620 ?auto_239619 ) ( not ( = ?auto_239613 ?auto_239614 ) ) ( not ( = ?auto_239613 ?auto_239615 ) ) ( not ( = ?auto_239613 ?auto_239616 ) ) ( not ( = ?auto_239613 ?auto_239617 ) ) ( not ( = ?auto_239613 ?auto_239618 ) ) ( not ( = ?auto_239613 ?auto_239619 ) ) ( not ( = ?auto_239613 ?auto_239620 ) ) ( not ( = ?auto_239613 ?auto_239621 ) ) ( not ( = ?auto_239613 ?auto_239622 ) ) ( not ( = ?auto_239613 ?auto_239626 ) ) ( not ( = ?auto_239614 ?auto_239615 ) ) ( not ( = ?auto_239614 ?auto_239616 ) ) ( not ( = ?auto_239614 ?auto_239617 ) ) ( not ( = ?auto_239614 ?auto_239618 ) ) ( not ( = ?auto_239614 ?auto_239619 ) ) ( not ( = ?auto_239614 ?auto_239620 ) ) ( not ( = ?auto_239614 ?auto_239621 ) ) ( not ( = ?auto_239614 ?auto_239622 ) ) ( not ( = ?auto_239614 ?auto_239626 ) ) ( not ( = ?auto_239615 ?auto_239616 ) ) ( not ( = ?auto_239615 ?auto_239617 ) ) ( not ( = ?auto_239615 ?auto_239618 ) ) ( not ( = ?auto_239615 ?auto_239619 ) ) ( not ( = ?auto_239615 ?auto_239620 ) ) ( not ( = ?auto_239615 ?auto_239621 ) ) ( not ( = ?auto_239615 ?auto_239622 ) ) ( not ( = ?auto_239615 ?auto_239626 ) ) ( not ( = ?auto_239616 ?auto_239617 ) ) ( not ( = ?auto_239616 ?auto_239618 ) ) ( not ( = ?auto_239616 ?auto_239619 ) ) ( not ( = ?auto_239616 ?auto_239620 ) ) ( not ( = ?auto_239616 ?auto_239621 ) ) ( not ( = ?auto_239616 ?auto_239622 ) ) ( not ( = ?auto_239616 ?auto_239626 ) ) ( not ( = ?auto_239617 ?auto_239618 ) ) ( not ( = ?auto_239617 ?auto_239619 ) ) ( not ( = ?auto_239617 ?auto_239620 ) ) ( not ( = ?auto_239617 ?auto_239621 ) ) ( not ( = ?auto_239617 ?auto_239622 ) ) ( not ( = ?auto_239617 ?auto_239626 ) ) ( not ( = ?auto_239618 ?auto_239619 ) ) ( not ( = ?auto_239618 ?auto_239620 ) ) ( not ( = ?auto_239618 ?auto_239621 ) ) ( not ( = ?auto_239618 ?auto_239622 ) ) ( not ( = ?auto_239618 ?auto_239626 ) ) ( not ( = ?auto_239619 ?auto_239620 ) ) ( not ( = ?auto_239619 ?auto_239621 ) ) ( not ( = ?auto_239619 ?auto_239622 ) ) ( not ( = ?auto_239619 ?auto_239626 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239620 ?auto_239621 ?auto_239622 )
      ( MAKE-9CRATE-VERIFY ?auto_239613 ?auto_239614 ?auto_239615 ?auto_239616 ?auto_239617 ?auto_239618 ?auto_239619 ?auto_239620 ?auto_239621 ?auto_239622 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_239668 - SURFACE
      ?auto_239669 - SURFACE
      ?auto_239670 - SURFACE
      ?auto_239671 - SURFACE
      ?auto_239672 - SURFACE
      ?auto_239673 - SURFACE
    )
    :vars
    (
      ?auto_239678 - HOIST
      ?auto_239676 - PLACE
      ?auto_239679 - PLACE
      ?auto_239674 - HOIST
      ?auto_239677 - SURFACE
      ?auto_239675 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239678 ?auto_239676 ) ( IS-CRATE ?auto_239673 ) ( not ( = ?auto_239672 ?auto_239673 ) ) ( not ( = ?auto_239671 ?auto_239672 ) ) ( not ( = ?auto_239671 ?auto_239673 ) ) ( not ( = ?auto_239679 ?auto_239676 ) ) ( HOIST-AT ?auto_239674 ?auto_239679 ) ( not ( = ?auto_239678 ?auto_239674 ) ) ( SURFACE-AT ?auto_239673 ?auto_239679 ) ( ON ?auto_239673 ?auto_239677 ) ( CLEAR ?auto_239673 ) ( not ( = ?auto_239672 ?auto_239677 ) ) ( not ( = ?auto_239673 ?auto_239677 ) ) ( not ( = ?auto_239671 ?auto_239677 ) ) ( SURFACE-AT ?auto_239671 ?auto_239676 ) ( CLEAR ?auto_239671 ) ( IS-CRATE ?auto_239672 ) ( AVAILABLE ?auto_239678 ) ( TRUCK-AT ?auto_239675 ?auto_239679 ) ( LIFTING ?auto_239674 ?auto_239672 ) ( ON ?auto_239669 ?auto_239668 ) ( ON ?auto_239670 ?auto_239669 ) ( ON ?auto_239671 ?auto_239670 ) ( not ( = ?auto_239668 ?auto_239669 ) ) ( not ( = ?auto_239668 ?auto_239670 ) ) ( not ( = ?auto_239668 ?auto_239671 ) ) ( not ( = ?auto_239668 ?auto_239672 ) ) ( not ( = ?auto_239668 ?auto_239673 ) ) ( not ( = ?auto_239668 ?auto_239677 ) ) ( not ( = ?auto_239669 ?auto_239670 ) ) ( not ( = ?auto_239669 ?auto_239671 ) ) ( not ( = ?auto_239669 ?auto_239672 ) ) ( not ( = ?auto_239669 ?auto_239673 ) ) ( not ( = ?auto_239669 ?auto_239677 ) ) ( not ( = ?auto_239670 ?auto_239671 ) ) ( not ( = ?auto_239670 ?auto_239672 ) ) ( not ( = ?auto_239670 ?auto_239673 ) ) ( not ( = ?auto_239670 ?auto_239677 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239671 ?auto_239672 ?auto_239673 )
      ( MAKE-5CRATE-VERIFY ?auto_239668 ?auto_239669 ?auto_239670 ?auto_239671 ?auto_239672 ?auto_239673 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_239680 - SURFACE
      ?auto_239681 - SURFACE
      ?auto_239682 - SURFACE
      ?auto_239683 - SURFACE
      ?auto_239684 - SURFACE
      ?auto_239685 - SURFACE
      ?auto_239686 - SURFACE
    )
    :vars
    (
      ?auto_239691 - HOIST
      ?auto_239689 - PLACE
      ?auto_239692 - PLACE
      ?auto_239687 - HOIST
      ?auto_239690 - SURFACE
      ?auto_239688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239691 ?auto_239689 ) ( IS-CRATE ?auto_239686 ) ( not ( = ?auto_239685 ?auto_239686 ) ) ( not ( = ?auto_239684 ?auto_239685 ) ) ( not ( = ?auto_239684 ?auto_239686 ) ) ( not ( = ?auto_239692 ?auto_239689 ) ) ( HOIST-AT ?auto_239687 ?auto_239692 ) ( not ( = ?auto_239691 ?auto_239687 ) ) ( SURFACE-AT ?auto_239686 ?auto_239692 ) ( ON ?auto_239686 ?auto_239690 ) ( CLEAR ?auto_239686 ) ( not ( = ?auto_239685 ?auto_239690 ) ) ( not ( = ?auto_239686 ?auto_239690 ) ) ( not ( = ?auto_239684 ?auto_239690 ) ) ( SURFACE-AT ?auto_239684 ?auto_239689 ) ( CLEAR ?auto_239684 ) ( IS-CRATE ?auto_239685 ) ( AVAILABLE ?auto_239691 ) ( TRUCK-AT ?auto_239688 ?auto_239692 ) ( LIFTING ?auto_239687 ?auto_239685 ) ( ON ?auto_239681 ?auto_239680 ) ( ON ?auto_239682 ?auto_239681 ) ( ON ?auto_239683 ?auto_239682 ) ( ON ?auto_239684 ?auto_239683 ) ( not ( = ?auto_239680 ?auto_239681 ) ) ( not ( = ?auto_239680 ?auto_239682 ) ) ( not ( = ?auto_239680 ?auto_239683 ) ) ( not ( = ?auto_239680 ?auto_239684 ) ) ( not ( = ?auto_239680 ?auto_239685 ) ) ( not ( = ?auto_239680 ?auto_239686 ) ) ( not ( = ?auto_239680 ?auto_239690 ) ) ( not ( = ?auto_239681 ?auto_239682 ) ) ( not ( = ?auto_239681 ?auto_239683 ) ) ( not ( = ?auto_239681 ?auto_239684 ) ) ( not ( = ?auto_239681 ?auto_239685 ) ) ( not ( = ?auto_239681 ?auto_239686 ) ) ( not ( = ?auto_239681 ?auto_239690 ) ) ( not ( = ?auto_239682 ?auto_239683 ) ) ( not ( = ?auto_239682 ?auto_239684 ) ) ( not ( = ?auto_239682 ?auto_239685 ) ) ( not ( = ?auto_239682 ?auto_239686 ) ) ( not ( = ?auto_239682 ?auto_239690 ) ) ( not ( = ?auto_239683 ?auto_239684 ) ) ( not ( = ?auto_239683 ?auto_239685 ) ) ( not ( = ?auto_239683 ?auto_239686 ) ) ( not ( = ?auto_239683 ?auto_239690 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239684 ?auto_239685 ?auto_239686 )
      ( MAKE-6CRATE-VERIFY ?auto_239680 ?auto_239681 ?auto_239682 ?auto_239683 ?auto_239684 ?auto_239685 ?auto_239686 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_239693 - SURFACE
      ?auto_239694 - SURFACE
      ?auto_239695 - SURFACE
      ?auto_239696 - SURFACE
      ?auto_239697 - SURFACE
      ?auto_239698 - SURFACE
      ?auto_239699 - SURFACE
      ?auto_239700 - SURFACE
    )
    :vars
    (
      ?auto_239705 - HOIST
      ?auto_239703 - PLACE
      ?auto_239706 - PLACE
      ?auto_239701 - HOIST
      ?auto_239704 - SURFACE
      ?auto_239702 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239705 ?auto_239703 ) ( IS-CRATE ?auto_239700 ) ( not ( = ?auto_239699 ?auto_239700 ) ) ( not ( = ?auto_239698 ?auto_239699 ) ) ( not ( = ?auto_239698 ?auto_239700 ) ) ( not ( = ?auto_239706 ?auto_239703 ) ) ( HOIST-AT ?auto_239701 ?auto_239706 ) ( not ( = ?auto_239705 ?auto_239701 ) ) ( SURFACE-AT ?auto_239700 ?auto_239706 ) ( ON ?auto_239700 ?auto_239704 ) ( CLEAR ?auto_239700 ) ( not ( = ?auto_239699 ?auto_239704 ) ) ( not ( = ?auto_239700 ?auto_239704 ) ) ( not ( = ?auto_239698 ?auto_239704 ) ) ( SURFACE-AT ?auto_239698 ?auto_239703 ) ( CLEAR ?auto_239698 ) ( IS-CRATE ?auto_239699 ) ( AVAILABLE ?auto_239705 ) ( TRUCK-AT ?auto_239702 ?auto_239706 ) ( LIFTING ?auto_239701 ?auto_239699 ) ( ON ?auto_239694 ?auto_239693 ) ( ON ?auto_239695 ?auto_239694 ) ( ON ?auto_239696 ?auto_239695 ) ( ON ?auto_239697 ?auto_239696 ) ( ON ?auto_239698 ?auto_239697 ) ( not ( = ?auto_239693 ?auto_239694 ) ) ( not ( = ?auto_239693 ?auto_239695 ) ) ( not ( = ?auto_239693 ?auto_239696 ) ) ( not ( = ?auto_239693 ?auto_239697 ) ) ( not ( = ?auto_239693 ?auto_239698 ) ) ( not ( = ?auto_239693 ?auto_239699 ) ) ( not ( = ?auto_239693 ?auto_239700 ) ) ( not ( = ?auto_239693 ?auto_239704 ) ) ( not ( = ?auto_239694 ?auto_239695 ) ) ( not ( = ?auto_239694 ?auto_239696 ) ) ( not ( = ?auto_239694 ?auto_239697 ) ) ( not ( = ?auto_239694 ?auto_239698 ) ) ( not ( = ?auto_239694 ?auto_239699 ) ) ( not ( = ?auto_239694 ?auto_239700 ) ) ( not ( = ?auto_239694 ?auto_239704 ) ) ( not ( = ?auto_239695 ?auto_239696 ) ) ( not ( = ?auto_239695 ?auto_239697 ) ) ( not ( = ?auto_239695 ?auto_239698 ) ) ( not ( = ?auto_239695 ?auto_239699 ) ) ( not ( = ?auto_239695 ?auto_239700 ) ) ( not ( = ?auto_239695 ?auto_239704 ) ) ( not ( = ?auto_239696 ?auto_239697 ) ) ( not ( = ?auto_239696 ?auto_239698 ) ) ( not ( = ?auto_239696 ?auto_239699 ) ) ( not ( = ?auto_239696 ?auto_239700 ) ) ( not ( = ?auto_239696 ?auto_239704 ) ) ( not ( = ?auto_239697 ?auto_239698 ) ) ( not ( = ?auto_239697 ?auto_239699 ) ) ( not ( = ?auto_239697 ?auto_239700 ) ) ( not ( = ?auto_239697 ?auto_239704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239698 ?auto_239699 ?auto_239700 )
      ( MAKE-7CRATE-VERIFY ?auto_239693 ?auto_239694 ?auto_239695 ?auto_239696 ?auto_239697 ?auto_239698 ?auto_239699 ?auto_239700 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_239707 - SURFACE
      ?auto_239708 - SURFACE
      ?auto_239709 - SURFACE
      ?auto_239710 - SURFACE
      ?auto_239711 - SURFACE
      ?auto_239712 - SURFACE
      ?auto_239713 - SURFACE
      ?auto_239714 - SURFACE
      ?auto_239715 - SURFACE
    )
    :vars
    (
      ?auto_239720 - HOIST
      ?auto_239718 - PLACE
      ?auto_239721 - PLACE
      ?auto_239716 - HOIST
      ?auto_239719 - SURFACE
      ?auto_239717 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239720 ?auto_239718 ) ( IS-CRATE ?auto_239715 ) ( not ( = ?auto_239714 ?auto_239715 ) ) ( not ( = ?auto_239713 ?auto_239714 ) ) ( not ( = ?auto_239713 ?auto_239715 ) ) ( not ( = ?auto_239721 ?auto_239718 ) ) ( HOIST-AT ?auto_239716 ?auto_239721 ) ( not ( = ?auto_239720 ?auto_239716 ) ) ( SURFACE-AT ?auto_239715 ?auto_239721 ) ( ON ?auto_239715 ?auto_239719 ) ( CLEAR ?auto_239715 ) ( not ( = ?auto_239714 ?auto_239719 ) ) ( not ( = ?auto_239715 ?auto_239719 ) ) ( not ( = ?auto_239713 ?auto_239719 ) ) ( SURFACE-AT ?auto_239713 ?auto_239718 ) ( CLEAR ?auto_239713 ) ( IS-CRATE ?auto_239714 ) ( AVAILABLE ?auto_239720 ) ( TRUCK-AT ?auto_239717 ?auto_239721 ) ( LIFTING ?auto_239716 ?auto_239714 ) ( ON ?auto_239708 ?auto_239707 ) ( ON ?auto_239709 ?auto_239708 ) ( ON ?auto_239710 ?auto_239709 ) ( ON ?auto_239711 ?auto_239710 ) ( ON ?auto_239712 ?auto_239711 ) ( ON ?auto_239713 ?auto_239712 ) ( not ( = ?auto_239707 ?auto_239708 ) ) ( not ( = ?auto_239707 ?auto_239709 ) ) ( not ( = ?auto_239707 ?auto_239710 ) ) ( not ( = ?auto_239707 ?auto_239711 ) ) ( not ( = ?auto_239707 ?auto_239712 ) ) ( not ( = ?auto_239707 ?auto_239713 ) ) ( not ( = ?auto_239707 ?auto_239714 ) ) ( not ( = ?auto_239707 ?auto_239715 ) ) ( not ( = ?auto_239707 ?auto_239719 ) ) ( not ( = ?auto_239708 ?auto_239709 ) ) ( not ( = ?auto_239708 ?auto_239710 ) ) ( not ( = ?auto_239708 ?auto_239711 ) ) ( not ( = ?auto_239708 ?auto_239712 ) ) ( not ( = ?auto_239708 ?auto_239713 ) ) ( not ( = ?auto_239708 ?auto_239714 ) ) ( not ( = ?auto_239708 ?auto_239715 ) ) ( not ( = ?auto_239708 ?auto_239719 ) ) ( not ( = ?auto_239709 ?auto_239710 ) ) ( not ( = ?auto_239709 ?auto_239711 ) ) ( not ( = ?auto_239709 ?auto_239712 ) ) ( not ( = ?auto_239709 ?auto_239713 ) ) ( not ( = ?auto_239709 ?auto_239714 ) ) ( not ( = ?auto_239709 ?auto_239715 ) ) ( not ( = ?auto_239709 ?auto_239719 ) ) ( not ( = ?auto_239710 ?auto_239711 ) ) ( not ( = ?auto_239710 ?auto_239712 ) ) ( not ( = ?auto_239710 ?auto_239713 ) ) ( not ( = ?auto_239710 ?auto_239714 ) ) ( not ( = ?auto_239710 ?auto_239715 ) ) ( not ( = ?auto_239710 ?auto_239719 ) ) ( not ( = ?auto_239711 ?auto_239712 ) ) ( not ( = ?auto_239711 ?auto_239713 ) ) ( not ( = ?auto_239711 ?auto_239714 ) ) ( not ( = ?auto_239711 ?auto_239715 ) ) ( not ( = ?auto_239711 ?auto_239719 ) ) ( not ( = ?auto_239712 ?auto_239713 ) ) ( not ( = ?auto_239712 ?auto_239714 ) ) ( not ( = ?auto_239712 ?auto_239715 ) ) ( not ( = ?auto_239712 ?auto_239719 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239713 ?auto_239714 ?auto_239715 )
      ( MAKE-8CRATE-VERIFY ?auto_239707 ?auto_239708 ?auto_239709 ?auto_239710 ?auto_239711 ?auto_239712 ?auto_239713 ?auto_239714 ?auto_239715 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239722 - SURFACE
      ?auto_239723 - SURFACE
      ?auto_239724 - SURFACE
      ?auto_239725 - SURFACE
      ?auto_239726 - SURFACE
      ?auto_239727 - SURFACE
      ?auto_239728 - SURFACE
      ?auto_239729 - SURFACE
      ?auto_239730 - SURFACE
      ?auto_239731 - SURFACE
    )
    :vars
    (
      ?auto_239736 - HOIST
      ?auto_239734 - PLACE
      ?auto_239737 - PLACE
      ?auto_239732 - HOIST
      ?auto_239735 - SURFACE
      ?auto_239733 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239736 ?auto_239734 ) ( IS-CRATE ?auto_239731 ) ( not ( = ?auto_239730 ?auto_239731 ) ) ( not ( = ?auto_239729 ?auto_239730 ) ) ( not ( = ?auto_239729 ?auto_239731 ) ) ( not ( = ?auto_239737 ?auto_239734 ) ) ( HOIST-AT ?auto_239732 ?auto_239737 ) ( not ( = ?auto_239736 ?auto_239732 ) ) ( SURFACE-AT ?auto_239731 ?auto_239737 ) ( ON ?auto_239731 ?auto_239735 ) ( CLEAR ?auto_239731 ) ( not ( = ?auto_239730 ?auto_239735 ) ) ( not ( = ?auto_239731 ?auto_239735 ) ) ( not ( = ?auto_239729 ?auto_239735 ) ) ( SURFACE-AT ?auto_239729 ?auto_239734 ) ( CLEAR ?auto_239729 ) ( IS-CRATE ?auto_239730 ) ( AVAILABLE ?auto_239736 ) ( TRUCK-AT ?auto_239733 ?auto_239737 ) ( LIFTING ?auto_239732 ?auto_239730 ) ( ON ?auto_239723 ?auto_239722 ) ( ON ?auto_239724 ?auto_239723 ) ( ON ?auto_239725 ?auto_239724 ) ( ON ?auto_239726 ?auto_239725 ) ( ON ?auto_239727 ?auto_239726 ) ( ON ?auto_239728 ?auto_239727 ) ( ON ?auto_239729 ?auto_239728 ) ( not ( = ?auto_239722 ?auto_239723 ) ) ( not ( = ?auto_239722 ?auto_239724 ) ) ( not ( = ?auto_239722 ?auto_239725 ) ) ( not ( = ?auto_239722 ?auto_239726 ) ) ( not ( = ?auto_239722 ?auto_239727 ) ) ( not ( = ?auto_239722 ?auto_239728 ) ) ( not ( = ?auto_239722 ?auto_239729 ) ) ( not ( = ?auto_239722 ?auto_239730 ) ) ( not ( = ?auto_239722 ?auto_239731 ) ) ( not ( = ?auto_239722 ?auto_239735 ) ) ( not ( = ?auto_239723 ?auto_239724 ) ) ( not ( = ?auto_239723 ?auto_239725 ) ) ( not ( = ?auto_239723 ?auto_239726 ) ) ( not ( = ?auto_239723 ?auto_239727 ) ) ( not ( = ?auto_239723 ?auto_239728 ) ) ( not ( = ?auto_239723 ?auto_239729 ) ) ( not ( = ?auto_239723 ?auto_239730 ) ) ( not ( = ?auto_239723 ?auto_239731 ) ) ( not ( = ?auto_239723 ?auto_239735 ) ) ( not ( = ?auto_239724 ?auto_239725 ) ) ( not ( = ?auto_239724 ?auto_239726 ) ) ( not ( = ?auto_239724 ?auto_239727 ) ) ( not ( = ?auto_239724 ?auto_239728 ) ) ( not ( = ?auto_239724 ?auto_239729 ) ) ( not ( = ?auto_239724 ?auto_239730 ) ) ( not ( = ?auto_239724 ?auto_239731 ) ) ( not ( = ?auto_239724 ?auto_239735 ) ) ( not ( = ?auto_239725 ?auto_239726 ) ) ( not ( = ?auto_239725 ?auto_239727 ) ) ( not ( = ?auto_239725 ?auto_239728 ) ) ( not ( = ?auto_239725 ?auto_239729 ) ) ( not ( = ?auto_239725 ?auto_239730 ) ) ( not ( = ?auto_239725 ?auto_239731 ) ) ( not ( = ?auto_239725 ?auto_239735 ) ) ( not ( = ?auto_239726 ?auto_239727 ) ) ( not ( = ?auto_239726 ?auto_239728 ) ) ( not ( = ?auto_239726 ?auto_239729 ) ) ( not ( = ?auto_239726 ?auto_239730 ) ) ( not ( = ?auto_239726 ?auto_239731 ) ) ( not ( = ?auto_239726 ?auto_239735 ) ) ( not ( = ?auto_239727 ?auto_239728 ) ) ( not ( = ?auto_239727 ?auto_239729 ) ) ( not ( = ?auto_239727 ?auto_239730 ) ) ( not ( = ?auto_239727 ?auto_239731 ) ) ( not ( = ?auto_239727 ?auto_239735 ) ) ( not ( = ?auto_239728 ?auto_239729 ) ) ( not ( = ?auto_239728 ?auto_239730 ) ) ( not ( = ?auto_239728 ?auto_239731 ) ) ( not ( = ?auto_239728 ?auto_239735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239729 ?auto_239730 ?auto_239731 )
      ( MAKE-9CRATE-VERIFY ?auto_239722 ?auto_239723 ?auto_239724 ?auto_239725 ?auto_239726 ?auto_239727 ?auto_239728 ?auto_239729 ?auto_239730 ?auto_239731 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_239781 - SURFACE
      ?auto_239782 - SURFACE
      ?auto_239783 - SURFACE
      ?auto_239784 - SURFACE
      ?auto_239785 - SURFACE
      ?auto_239786 - SURFACE
    )
    :vars
    (
      ?auto_239789 - HOIST
      ?auto_239790 - PLACE
      ?auto_239793 - PLACE
      ?auto_239787 - HOIST
      ?auto_239788 - SURFACE
      ?auto_239791 - TRUCK
      ?auto_239792 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239789 ?auto_239790 ) ( IS-CRATE ?auto_239786 ) ( not ( = ?auto_239785 ?auto_239786 ) ) ( not ( = ?auto_239784 ?auto_239785 ) ) ( not ( = ?auto_239784 ?auto_239786 ) ) ( not ( = ?auto_239793 ?auto_239790 ) ) ( HOIST-AT ?auto_239787 ?auto_239793 ) ( not ( = ?auto_239789 ?auto_239787 ) ) ( SURFACE-AT ?auto_239786 ?auto_239793 ) ( ON ?auto_239786 ?auto_239788 ) ( CLEAR ?auto_239786 ) ( not ( = ?auto_239785 ?auto_239788 ) ) ( not ( = ?auto_239786 ?auto_239788 ) ) ( not ( = ?auto_239784 ?auto_239788 ) ) ( SURFACE-AT ?auto_239784 ?auto_239790 ) ( CLEAR ?auto_239784 ) ( IS-CRATE ?auto_239785 ) ( AVAILABLE ?auto_239789 ) ( TRUCK-AT ?auto_239791 ?auto_239793 ) ( AVAILABLE ?auto_239787 ) ( SURFACE-AT ?auto_239785 ?auto_239793 ) ( ON ?auto_239785 ?auto_239792 ) ( CLEAR ?auto_239785 ) ( not ( = ?auto_239785 ?auto_239792 ) ) ( not ( = ?auto_239786 ?auto_239792 ) ) ( not ( = ?auto_239784 ?auto_239792 ) ) ( not ( = ?auto_239788 ?auto_239792 ) ) ( ON ?auto_239782 ?auto_239781 ) ( ON ?auto_239783 ?auto_239782 ) ( ON ?auto_239784 ?auto_239783 ) ( not ( = ?auto_239781 ?auto_239782 ) ) ( not ( = ?auto_239781 ?auto_239783 ) ) ( not ( = ?auto_239781 ?auto_239784 ) ) ( not ( = ?auto_239781 ?auto_239785 ) ) ( not ( = ?auto_239781 ?auto_239786 ) ) ( not ( = ?auto_239781 ?auto_239788 ) ) ( not ( = ?auto_239781 ?auto_239792 ) ) ( not ( = ?auto_239782 ?auto_239783 ) ) ( not ( = ?auto_239782 ?auto_239784 ) ) ( not ( = ?auto_239782 ?auto_239785 ) ) ( not ( = ?auto_239782 ?auto_239786 ) ) ( not ( = ?auto_239782 ?auto_239788 ) ) ( not ( = ?auto_239782 ?auto_239792 ) ) ( not ( = ?auto_239783 ?auto_239784 ) ) ( not ( = ?auto_239783 ?auto_239785 ) ) ( not ( = ?auto_239783 ?auto_239786 ) ) ( not ( = ?auto_239783 ?auto_239788 ) ) ( not ( = ?auto_239783 ?auto_239792 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239784 ?auto_239785 ?auto_239786 )
      ( MAKE-5CRATE-VERIFY ?auto_239781 ?auto_239782 ?auto_239783 ?auto_239784 ?auto_239785 ?auto_239786 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_239794 - SURFACE
      ?auto_239795 - SURFACE
      ?auto_239796 - SURFACE
      ?auto_239797 - SURFACE
      ?auto_239798 - SURFACE
      ?auto_239799 - SURFACE
      ?auto_239800 - SURFACE
    )
    :vars
    (
      ?auto_239803 - HOIST
      ?auto_239804 - PLACE
      ?auto_239807 - PLACE
      ?auto_239801 - HOIST
      ?auto_239802 - SURFACE
      ?auto_239805 - TRUCK
      ?auto_239806 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239803 ?auto_239804 ) ( IS-CRATE ?auto_239800 ) ( not ( = ?auto_239799 ?auto_239800 ) ) ( not ( = ?auto_239798 ?auto_239799 ) ) ( not ( = ?auto_239798 ?auto_239800 ) ) ( not ( = ?auto_239807 ?auto_239804 ) ) ( HOIST-AT ?auto_239801 ?auto_239807 ) ( not ( = ?auto_239803 ?auto_239801 ) ) ( SURFACE-AT ?auto_239800 ?auto_239807 ) ( ON ?auto_239800 ?auto_239802 ) ( CLEAR ?auto_239800 ) ( not ( = ?auto_239799 ?auto_239802 ) ) ( not ( = ?auto_239800 ?auto_239802 ) ) ( not ( = ?auto_239798 ?auto_239802 ) ) ( SURFACE-AT ?auto_239798 ?auto_239804 ) ( CLEAR ?auto_239798 ) ( IS-CRATE ?auto_239799 ) ( AVAILABLE ?auto_239803 ) ( TRUCK-AT ?auto_239805 ?auto_239807 ) ( AVAILABLE ?auto_239801 ) ( SURFACE-AT ?auto_239799 ?auto_239807 ) ( ON ?auto_239799 ?auto_239806 ) ( CLEAR ?auto_239799 ) ( not ( = ?auto_239799 ?auto_239806 ) ) ( not ( = ?auto_239800 ?auto_239806 ) ) ( not ( = ?auto_239798 ?auto_239806 ) ) ( not ( = ?auto_239802 ?auto_239806 ) ) ( ON ?auto_239795 ?auto_239794 ) ( ON ?auto_239796 ?auto_239795 ) ( ON ?auto_239797 ?auto_239796 ) ( ON ?auto_239798 ?auto_239797 ) ( not ( = ?auto_239794 ?auto_239795 ) ) ( not ( = ?auto_239794 ?auto_239796 ) ) ( not ( = ?auto_239794 ?auto_239797 ) ) ( not ( = ?auto_239794 ?auto_239798 ) ) ( not ( = ?auto_239794 ?auto_239799 ) ) ( not ( = ?auto_239794 ?auto_239800 ) ) ( not ( = ?auto_239794 ?auto_239802 ) ) ( not ( = ?auto_239794 ?auto_239806 ) ) ( not ( = ?auto_239795 ?auto_239796 ) ) ( not ( = ?auto_239795 ?auto_239797 ) ) ( not ( = ?auto_239795 ?auto_239798 ) ) ( not ( = ?auto_239795 ?auto_239799 ) ) ( not ( = ?auto_239795 ?auto_239800 ) ) ( not ( = ?auto_239795 ?auto_239802 ) ) ( not ( = ?auto_239795 ?auto_239806 ) ) ( not ( = ?auto_239796 ?auto_239797 ) ) ( not ( = ?auto_239796 ?auto_239798 ) ) ( not ( = ?auto_239796 ?auto_239799 ) ) ( not ( = ?auto_239796 ?auto_239800 ) ) ( not ( = ?auto_239796 ?auto_239802 ) ) ( not ( = ?auto_239796 ?auto_239806 ) ) ( not ( = ?auto_239797 ?auto_239798 ) ) ( not ( = ?auto_239797 ?auto_239799 ) ) ( not ( = ?auto_239797 ?auto_239800 ) ) ( not ( = ?auto_239797 ?auto_239802 ) ) ( not ( = ?auto_239797 ?auto_239806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239798 ?auto_239799 ?auto_239800 )
      ( MAKE-6CRATE-VERIFY ?auto_239794 ?auto_239795 ?auto_239796 ?auto_239797 ?auto_239798 ?auto_239799 ?auto_239800 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_239808 - SURFACE
      ?auto_239809 - SURFACE
      ?auto_239810 - SURFACE
      ?auto_239811 - SURFACE
      ?auto_239812 - SURFACE
      ?auto_239813 - SURFACE
      ?auto_239814 - SURFACE
      ?auto_239815 - SURFACE
    )
    :vars
    (
      ?auto_239818 - HOIST
      ?auto_239819 - PLACE
      ?auto_239822 - PLACE
      ?auto_239816 - HOIST
      ?auto_239817 - SURFACE
      ?auto_239820 - TRUCK
      ?auto_239821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239818 ?auto_239819 ) ( IS-CRATE ?auto_239815 ) ( not ( = ?auto_239814 ?auto_239815 ) ) ( not ( = ?auto_239813 ?auto_239814 ) ) ( not ( = ?auto_239813 ?auto_239815 ) ) ( not ( = ?auto_239822 ?auto_239819 ) ) ( HOIST-AT ?auto_239816 ?auto_239822 ) ( not ( = ?auto_239818 ?auto_239816 ) ) ( SURFACE-AT ?auto_239815 ?auto_239822 ) ( ON ?auto_239815 ?auto_239817 ) ( CLEAR ?auto_239815 ) ( not ( = ?auto_239814 ?auto_239817 ) ) ( not ( = ?auto_239815 ?auto_239817 ) ) ( not ( = ?auto_239813 ?auto_239817 ) ) ( SURFACE-AT ?auto_239813 ?auto_239819 ) ( CLEAR ?auto_239813 ) ( IS-CRATE ?auto_239814 ) ( AVAILABLE ?auto_239818 ) ( TRUCK-AT ?auto_239820 ?auto_239822 ) ( AVAILABLE ?auto_239816 ) ( SURFACE-AT ?auto_239814 ?auto_239822 ) ( ON ?auto_239814 ?auto_239821 ) ( CLEAR ?auto_239814 ) ( not ( = ?auto_239814 ?auto_239821 ) ) ( not ( = ?auto_239815 ?auto_239821 ) ) ( not ( = ?auto_239813 ?auto_239821 ) ) ( not ( = ?auto_239817 ?auto_239821 ) ) ( ON ?auto_239809 ?auto_239808 ) ( ON ?auto_239810 ?auto_239809 ) ( ON ?auto_239811 ?auto_239810 ) ( ON ?auto_239812 ?auto_239811 ) ( ON ?auto_239813 ?auto_239812 ) ( not ( = ?auto_239808 ?auto_239809 ) ) ( not ( = ?auto_239808 ?auto_239810 ) ) ( not ( = ?auto_239808 ?auto_239811 ) ) ( not ( = ?auto_239808 ?auto_239812 ) ) ( not ( = ?auto_239808 ?auto_239813 ) ) ( not ( = ?auto_239808 ?auto_239814 ) ) ( not ( = ?auto_239808 ?auto_239815 ) ) ( not ( = ?auto_239808 ?auto_239817 ) ) ( not ( = ?auto_239808 ?auto_239821 ) ) ( not ( = ?auto_239809 ?auto_239810 ) ) ( not ( = ?auto_239809 ?auto_239811 ) ) ( not ( = ?auto_239809 ?auto_239812 ) ) ( not ( = ?auto_239809 ?auto_239813 ) ) ( not ( = ?auto_239809 ?auto_239814 ) ) ( not ( = ?auto_239809 ?auto_239815 ) ) ( not ( = ?auto_239809 ?auto_239817 ) ) ( not ( = ?auto_239809 ?auto_239821 ) ) ( not ( = ?auto_239810 ?auto_239811 ) ) ( not ( = ?auto_239810 ?auto_239812 ) ) ( not ( = ?auto_239810 ?auto_239813 ) ) ( not ( = ?auto_239810 ?auto_239814 ) ) ( not ( = ?auto_239810 ?auto_239815 ) ) ( not ( = ?auto_239810 ?auto_239817 ) ) ( not ( = ?auto_239810 ?auto_239821 ) ) ( not ( = ?auto_239811 ?auto_239812 ) ) ( not ( = ?auto_239811 ?auto_239813 ) ) ( not ( = ?auto_239811 ?auto_239814 ) ) ( not ( = ?auto_239811 ?auto_239815 ) ) ( not ( = ?auto_239811 ?auto_239817 ) ) ( not ( = ?auto_239811 ?auto_239821 ) ) ( not ( = ?auto_239812 ?auto_239813 ) ) ( not ( = ?auto_239812 ?auto_239814 ) ) ( not ( = ?auto_239812 ?auto_239815 ) ) ( not ( = ?auto_239812 ?auto_239817 ) ) ( not ( = ?auto_239812 ?auto_239821 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239813 ?auto_239814 ?auto_239815 )
      ( MAKE-7CRATE-VERIFY ?auto_239808 ?auto_239809 ?auto_239810 ?auto_239811 ?auto_239812 ?auto_239813 ?auto_239814 ?auto_239815 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_239823 - SURFACE
      ?auto_239824 - SURFACE
      ?auto_239825 - SURFACE
      ?auto_239826 - SURFACE
      ?auto_239827 - SURFACE
      ?auto_239828 - SURFACE
      ?auto_239829 - SURFACE
      ?auto_239830 - SURFACE
      ?auto_239831 - SURFACE
    )
    :vars
    (
      ?auto_239834 - HOIST
      ?auto_239835 - PLACE
      ?auto_239838 - PLACE
      ?auto_239832 - HOIST
      ?auto_239833 - SURFACE
      ?auto_239836 - TRUCK
      ?auto_239837 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239834 ?auto_239835 ) ( IS-CRATE ?auto_239831 ) ( not ( = ?auto_239830 ?auto_239831 ) ) ( not ( = ?auto_239829 ?auto_239830 ) ) ( not ( = ?auto_239829 ?auto_239831 ) ) ( not ( = ?auto_239838 ?auto_239835 ) ) ( HOIST-AT ?auto_239832 ?auto_239838 ) ( not ( = ?auto_239834 ?auto_239832 ) ) ( SURFACE-AT ?auto_239831 ?auto_239838 ) ( ON ?auto_239831 ?auto_239833 ) ( CLEAR ?auto_239831 ) ( not ( = ?auto_239830 ?auto_239833 ) ) ( not ( = ?auto_239831 ?auto_239833 ) ) ( not ( = ?auto_239829 ?auto_239833 ) ) ( SURFACE-AT ?auto_239829 ?auto_239835 ) ( CLEAR ?auto_239829 ) ( IS-CRATE ?auto_239830 ) ( AVAILABLE ?auto_239834 ) ( TRUCK-AT ?auto_239836 ?auto_239838 ) ( AVAILABLE ?auto_239832 ) ( SURFACE-AT ?auto_239830 ?auto_239838 ) ( ON ?auto_239830 ?auto_239837 ) ( CLEAR ?auto_239830 ) ( not ( = ?auto_239830 ?auto_239837 ) ) ( not ( = ?auto_239831 ?auto_239837 ) ) ( not ( = ?auto_239829 ?auto_239837 ) ) ( not ( = ?auto_239833 ?auto_239837 ) ) ( ON ?auto_239824 ?auto_239823 ) ( ON ?auto_239825 ?auto_239824 ) ( ON ?auto_239826 ?auto_239825 ) ( ON ?auto_239827 ?auto_239826 ) ( ON ?auto_239828 ?auto_239827 ) ( ON ?auto_239829 ?auto_239828 ) ( not ( = ?auto_239823 ?auto_239824 ) ) ( not ( = ?auto_239823 ?auto_239825 ) ) ( not ( = ?auto_239823 ?auto_239826 ) ) ( not ( = ?auto_239823 ?auto_239827 ) ) ( not ( = ?auto_239823 ?auto_239828 ) ) ( not ( = ?auto_239823 ?auto_239829 ) ) ( not ( = ?auto_239823 ?auto_239830 ) ) ( not ( = ?auto_239823 ?auto_239831 ) ) ( not ( = ?auto_239823 ?auto_239833 ) ) ( not ( = ?auto_239823 ?auto_239837 ) ) ( not ( = ?auto_239824 ?auto_239825 ) ) ( not ( = ?auto_239824 ?auto_239826 ) ) ( not ( = ?auto_239824 ?auto_239827 ) ) ( not ( = ?auto_239824 ?auto_239828 ) ) ( not ( = ?auto_239824 ?auto_239829 ) ) ( not ( = ?auto_239824 ?auto_239830 ) ) ( not ( = ?auto_239824 ?auto_239831 ) ) ( not ( = ?auto_239824 ?auto_239833 ) ) ( not ( = ?auto_239824 ?auto_239837 ) ) ( not ( = ?auto_239825 ?auto_239826 ) ) ( not ( = ?auto_239825 ?auto_239827 ) ) ( not ( = ?auto_239825 ?auto_239828 ) ) ( not ( = ?auto_239825 ?auto_239829 ) ) ( not ( = ?auto_239825 ?auto_239830 ) ) ( not ( = ?auto_239825 ?auto_239831 ) ) ( not ( = ?auto_239825 ?auto_239833 ) ) ( not ( = ?auto_239825 ?auto_239837 ) ) ( not ( = ?auto_239826 ?auto_239827 ) ) ( not ( = ?auto_239826 ?auto_239828 ) ) ( not ( = ?auto_239826 ?auto_239829 ) ) ( not ( = ?auto_239826 ?auto_239830 ) ) ( not ( = ?auto_239826 ?auto_239831 ) ) ( not ( = ?auto_239826 ?auto_239833 ) ) ( not ( = ?auto_239826 ?auto_239837 ) ) ( not ( = ?auto_239827 ?auto_239828 ) ) ( not ( = ?auto_239827 ?auto_239829 ) ) ( not ( = ?auto_239827 ?auto_239830 ) ) ( not ( = ?auto_239827 ?auto_239831 ) ) ( not ( = ?auto_239827 ?auto_239833 ) ) ( not ( = ?auto_239827 ?auto_239837 ) ) ( not ( = ?auto_239828 ?auto_239829 ) ) ( not ( = ?auto_239828 ?auto_239830 ) ) ( not ( = ?auto_239828 ?auto_239831 ) ) ( not ( = ?auto_239828 ?auto_239833 ) ) ( not ( = ?auto_239828 ?auto_239837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239829 ?auto_239830 ?auto_239831 )
      ( MAKE-8CRATE-VERIFY ?auto_239823 ?auto_239824 ?auto_239825 ?auto_239826 ?auto_239827 ?auto_239828 ?auto_239829 ?auto_239830 ?auto_239831 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239839 - SURFACE
      ?auto_239840 - SURFACE
      ?auto_239841 - SURFACE
      ?auto_239842 - SURFACE
      ?auto_239843 - SURFACE
      ?auto_239844 - SURFACE
      ?auto_239845 - SURFACE
      ?auto_239846 - SURFACE
      ?auto_239847 - SURFACE
      ?auto_239848 - SURFACE
    )
    :vars
    (
      ?auto_239851 - HOIST
      ?auto_239852 - PLACE
      ?auto_239855 - PLACE
      ?auto_239849 - HOIST
      ?auto_239850 - SURFACE
      ?auto_239853 - TRUCK
      ?auto_239854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_239851 ?auto_239852 ) ( IS-CRATE ?auto_239848 ) ( not ( = ?auto_239847 ?auto_239848 ) ) ( not ( = ?auto_239846 ?auto_239847 ) ) ( not ( = ?auto_239846 ?auto_239848 ) ) ( not ( = ?auto_239855 ?auto_239852 ) ) ( HOIST-AT ?auto_239849 ?auto_239855 ) ( not ( = ?auto_239851 ?auto_239849 ) ) ( SURFACE-AT ?auto_239848 ?auto_239855 ) ( ON ?auto_239848 ?auto_239850 ) ( CLEAR ?auto_239848 ) ( not ( = ?auto_239847 ?auto_239850 ) ) ( not ( = ?auto_239848 ?auto_239850 ) ) ( not ( = ?auto_239846 ?auto_239850 ) ) ( SURFACE-AT ?auto_239846 ?auto_239852 ) ( CLEAR ?auto_239846 ) ( IS-CRATE ?auto_239847 ) ( AVAILABLE ?auto_239851 ) ( TRUCK-AT ?auto_239853 ?auto_239855 ) ( AVAILABLE ?auto_239849 ) ( SURFACE-AT ?auto_239847 ?auto_239855 ) ( ON ?auto_239847 ?auto_239854 ) ( CLEAR ?auto_239847 ) ( not ( = ?auto_239847 ?auto_239854 ) ) ( not ( = ?auto_239848 ?auto_239854 ) ) ( not ( = ?auto_239846 ?auto_239854 ) ) ( not ( = ?auto_239850 ?auto_239854 ) ) ( ON ?auto_239840 ?auto_239839 ) ( ON ?auto_239841 ?auto_239840 ) ( ON ?auto_239842 ?auto_239841 ) ( ON ?auto_239843 ?auto_239842 ) ( ON ?auto_239844 ?auto_239843 ) ( ON ?auto_239845 ?auto_239844 ) ( ON ?auto_239846 ?auto_239845 ) ( not ( = ?auto_239839 ?auto_239840 ) ) ( not ( = ?auto_239839 ?auto_239841 ) ) ( not ( = ?auto_239839 ?auto_239842 ) ) ( not ( = ?auto_239839 ?auto_239843 ) ) ( not ( = ?auto_239839 ?auto_239844 ) ) ( not ( = ?auto_239839 ?auto_239845 ) ) ( not ( = ?auto_239839 ?auto_239846 ) ) ( not ( = ?auto_239839 ?auto_239847 ) ) ( not ( = ?auto_239839 ?auto_239848 ) ) ( not ( = ?auto_239839 ?auto_239850 ) ) ( not ( = ?auto_239839 ?auto_239854 ) ) ( not ( = ?auto_239840 ?auto_239841 ) ) ( not ( = ?auto_239840 ?auto_239842 ) ) ( not ( = ?auto_239840 ?auto_239843 ) ) ( not ( = ?auto_239840 ?auto_239844 ) ) ( not ( = ?auto_239840 ?auto_239845 ) ) ( not ( = ?auto_239840 ?auto_239846 ) ) ( not ( = ?auto_239840 ?auto_239847 ) ) ( not ( = ?auto_239840 ?auto_239848 ) ) ( not ( = ?auto_239840 ?auto_239850 ) ) ( not ( = ?auto_239840 ?auto_239854 ) ) ( not ( = ?auto_239841 ?auto_239842 ) ) ( not ( = ?auto_239841 ?auto_239843 ) ) ( not ( = ?auto_239841 ?auto_239844 ) ) ( not ( = ?auto_239841 ?auto_239845 ) ) ( not ( = ?auto_239841 ?auto_239846 ) ) ( not ( = ?auto_239841 ?auto_239847 ) ) ( not ( = ?auto_239841 ?auto_239848 ) ) ( not ( = ?auto_239841 ?auto_239850 ) ) ( not ( = ?auto_239841 ?auto_239854 ) ) ( not ( = ?auto_239842 ?auto_239843 ) ) ( not ( = ?auto_239842 ?auto_239844 ) ) ( not ( = ?auto_239842 ?auto_239845 ) ) ( not ( = ?auto_239842 ?auto_239846 ) ) ( not ( = ?auto_239842 ?auto_239847 ) ) ( not ( = ?auto_239842 ?auto_239848 ) ) ( not ( = ?auto_239842 ?auto_239850 ) ) ( not ( = ?auto_239842 ?auto_239854 ) ) ( not ( = ?auto_239843 ?auto_239844 ) ) ( not ( = ?auto_239843 ?auto_239845 ) ) ( not ( = ?auto_239843 ?auto_239846 ) ) ( not ( = ?auto_239843 ?auto_239847 ) ) ( not ( = ?auto_239843 ?auto_239848 ) ) ( not ( = ?auto_239843 ?auto_239850 ) ) ( not ( = ?auto_239843 ?auto_239854 ) ) ( not ( = ?auto_239844 ?auto_239845 ) ) ( not ( = ?auto_239844 ?auto_239846 ) ) ( not ( = ?auto_239844 ?auto_239847 ) ) ( not ( = ?auto_239844 ?auto_239848 ) ) ( not ( = ?auto_239844 ?auto_239850 ) ) ( not ( = ?auto_239844 ?auto_239854 ) ) ( not ( = ?auto_239845 ?auto_239846 ) ) ( not ( = ?auto_239845 ?auto_239847 ) ) ( not ( = ?auto_239845 ?auto_239848 ) ) ( not ( = ?auto_239845 ?auto_239850 ) ) ( not ( = ?auto_239845 ?auto_239854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239846 ?auto_239847 ?auto_239848 )
      ( MAKE-9CRATE-VERIFY ?auto_239839 ?auto_239840 ?auto_239841 ?auto_239842 ?auto_239843 ?auto_239844 ?auto_239845 ?auto_239846 ?auto_239847 ?auto_239848 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_239899 - SURFACE
      ?auto_239900 - SURFACE
      ?auto_239901 - SURFACE
      ?auto_239902 - SURFACE
      ?auto_239903 - SURFACE
      ?auto_239904 - SURFACE
    )
    :vars
    (
      ?auto_239907 - HOIST
      ?auto_239910 - PLACE
      ?auto_239908 - PLACE
      ?auto_239909 - HOIST
      ?auto_239911 - SURFACE
      ?auto_239906 - SURFACE
      ?auto_239905 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239907 ?auto_239910 ) ( IS-CRATE ?auto_239904 ) ( not ( = ?auto_239903 ?auto_239904 ) ) ( not ( = ?auto_239902 ?auto_239903 ) ) ( not ( = ?auto_239902 ?auto_239904 ) ) ( not ( = ?auto_239908 ?auto_239910 ) ) ( HOIST-AT ?auto_239909 ?auto_239908 ) ( not ( = ?auto_239907 ?auto_239909 ) ) ( SURFACE-AT ?auto_239904 ?auto_239908 ) ( ON ?auto_239904 ?auto_239911 ) ( CLEAR ?auto_239904 ) ( not ( = ?auto_239903 ?auto_239911 ) ) ( not ( = ?auto_239904 ?auto_239911 ) ) ( not ( = ?auto_239902 ?auto_239911 ) ) ( SURFACE-AT ?auto_239902 ?auto_239910 ) ( CLEAR ?auto_239902 ) ( IS-CRATE ?auto_239903 ) ( AVAILABLE ?auto_239907 ) ( AVAILABLE ?auto_239909 ) ( SURFACE-AT ?auto_239903 ?auto_239908 ) ( ON ?auto_239903 ?auto_239906 ) ( CLEAR ?auto_239903 ) ( not ( = ?auto_239903 ?auto_239906 ) ) ( not ( = ?auto_239904 ?auto_239906 ) ) ( not ( = ?auto_239902 ?auto_239906 ) ) ( not ( = ?auto_239911 ?auto_239906 ) ) ( TRUCK-AT ?auto_239905 ?auto_239910 ) ( ON ?auto_239900 ?auto_239899 ) ( ON ?auto_239901 ?auto_239900 ) ( ON ?auto_239902 ?auto_239901 ) ( not ( = ?auto_239899 ?auto_239900 ) ) ( not ( = ?auto_239899 ?auto_239901 ) ) ( not ( = ?auto_239899 ?auto_239902 ) ) ( not ( = ?auto_239899 ?auto_239903 ) ) ( not ( = ?auto_239899 ?auto_239904 ) ) ( not ( = ?auto_239899 ?auto_239911 ) ) ( not ( = ?auto_239899 ?auto_239906 ) ) ( not ( = ?auto_239900 ?auto_239901 ) ) ( not ( = ?auto_239900 ?auto_239902 ) ) ( not ( = ?auto_239900 ?auto_239903 ) ) ( not ( = ?auto_239900 ?auto_239904 ) ) ( not ( = ?auto_239900 ?auto_239911 ) ) ( not ( = ?auto_239900 ?auto_239906 ) ) ( not ( = ?auto_239901 ?auto_239902 ) ) ( not ( = ?auto_239901 ?auto_239903 ) ) ( not ( = ?auto_239901 ?auto_239904 ) ) ( not ( = ?auto_239901 ?auto_239911 ) ) ( not ( = ?auto_239901 ?auto_239906 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239902 ?auto_239903 ?auto_239904 )
      ( MAKE-5CRATE-VERIFY ?auto_239899 ?auto_239900 ?auto_239901 ?auto_239902 ?auto_239903 ?auto_239904 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_239912 - SURFACE
      ?auto_239913 - SURFACE
      ?auto_239914 - SURFACE
      ?auto_239915 - SURFACE
      ?auto_239916 - SURFACE
      ?auto_239917 - SURFACE
      ?auto_239918 - SURFACE
    )
    :vars
    (
      ?auto_239921 - HOIST
      ?auto_239924 - PLACE
      ?auto_239922 - PLACE
      ?auto_239923 - HOIST
      ?auto_239925 - SURFACE
      ?auto_239920 - SURFACE
      ?auto_239919 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239921 ?auto_239924 ) ( IS-CRATE ?auto_239918 ) ( not ( = ?auto_239917 ?auto_239918 ) ) ( not ( = ?auto_239916 ?auto_239917 ) ) ( not ( = ?auto_239916 ?auto_239918 ) ) ( not ( = ?auto_239922 ?auto_239924 ) ) ( HOIST-AT ?auto_239923 ?auto_239922 ) ( not ( = ?auto_239921 ?auto_239923 ) ) ( SURFACE-AT ?auto_239918 ?auto_239922 ) ( ON ?auto_239918 ?auto_239925 ) ( CLEAR ?auto_239918 ) ( not ( = ?auto_239917 ?auto_239925 ) ) ( not ( = ?auto_239918 ?auto_239925 ) ) ( not ( = ?auto_239916 ?auto_239925 ) ) ( SURFACE-AT ?auto_239916 ?auto_239924 ) ( CLEAR ?auto_239916 ) ( IS-CRATE ?auto_239917 ) ( AVAILABLE ?auto_239921 ) ( AVAILABLE ?auto_239923 ) ( SURFACE-AT ?auto_239917 ?auto_239922 ) ( ON ?auto_239917 ?auto_239920 ) ( CLEAR ?auto_239917 ) ( not ( = ?auto_239917 ?auto_239920 ) ) ( not ( = ?auto_239918 ?auto_239920 ) ) ( not ( = ?auto_239916 ?auto_239920 ) ) ( not ( = ?auto_239925 ?auto_239920 ) ) ( TRUCK-AT ?auto_239919 ?auto_239924 ) ( ON ?auto_239913 ?auto_239912 ) ( ON ?auto_239914 ?auto_239913 ) ( ON ?auto_239915 ?auto_239914 ) ( ON ?auto_239916 ?auto_239915 ) ( not ( = ?auto_239912 ?auto_239913 ) ) ( not ( = ?auto_239912 ?auto_239914 ) ) ( not ( = ?auto_239912 ?auto_239915 ) ) ( not ( = ?auto_239912 ?auto_239916 ) ) ( not ( = ?auto_239912 ?auto_239917 ) ) ( not ( = ?auto_239912 ?auto_239918 ) ) ( not ( = ?auto_239912 ?auto_239925 ) ) ( not ( = ?auto_239912 ?auto_239920 ) ) ( not ( = ?auto_239913 ?auto_239914 ) ) ( not ( = ?auto_239913 ?auto_239915 ) ) ( not ( = ?auto_239913 ?auto_239916 ) ) ( not ( = ?auto_239913 ?auto_239917 ) ) ( not ( = ?auto_239913 ?auto_239918 ) ) ( not ( = ?auto_239913 ?auto_239925 ) ) ( not ( = ?auto_239913 ?auto_239920 ) ) ( not ( = ?auto_239914 ?auto_239915 ) ) ( not ( = ?auto_239914 ?auto_239916 ) ) ( not ( = ?auto_239914 ?auto_239917 ) ) ( not ( = ?auto_239914 ?auto_239918 ) ) ( not ( = ?auto_239914 ?auto_239925 ) ) ( not ( = ?auto_239914 ?auto_239920 ) ) ( not ( = ?auto_239915 ?auto_239916 ) ) ( not ( = ?auto_239915 ?auto_239917 ) ) ( not ( = ?auto_239915 ?auto_239918 ) ) ( not ( = ?auto_239915 ?auto_239925 ) ) ( not ( = ?auto_239915 ?auto_239920 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239916 ?auto_239917 ?auto_239918 )
      ( MAKE-6CRATE-VERIFY ?auto_239912 ?auto_239913 ?auto_239914 ?auto_239915 ?auto_239916 ?auto_239917 ?auto_239918 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_239926 - SURFACE
      ?auto_239927 - SURFACE
      ?auto_239928 - SURFACE
      ?auto_239929 - SURFACE
      ?auto_239930 - SURFACE
      ?auto_239931 - SURFACE
      ?auto_239932 - SURFACE
      ?auto_239933 - SURFACE
    )
    :vars
    (
      ?auto_239936 - HOIST
      ?auto_239939 - PLACE
      ?auto_239937 - PLACE
      ?auto_239938 - HOIST
      ?auto_239940 - SURFACE
      ?auto_239935 - SURFACE
      ?auto_239934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239936 ?auto_239939 ) ( IS-CRATE ?auto_239933 ) ( not ( = ?auto_239932 ?auto_239933 ) ) ( not ( = ?auto_239931 ?auto_239932 ) ) ( not ( = ?auto_239931 ?auto_239933 ) ) ( not ( = ?auto_239937 ?auto_239939 ) ) ( HOIST-AT ?auto_239938 ?auto_239937 ) ( not ( = ?auto_239936 ?auto_239938 ) ) ( SURFACE-AT ?auto_239933 ?auto_239937 ) ( ON ?auto_239933 ?auto_239940 ) ( CLEAR ?auto_239933 ) ( not ( = ?auto_239932 ?auto_239940 ) ) ( not ( = ?auto_239933 ?auto_239940 ) ) ( not ( = ?auto_239931 ?auto_239940 ) ) ( SURFACE-AT ?auto_239931 ?auto_239939 ) ( CLEAR ?auto_239931 ) ( IS-CRATE ?auto_239932 ) ( AVAILABLE ?auto_239936 ) ( AVAILABLE ?auto_239938 ) ( SURFACE-AT ?auto_239932 ?auto_239937 ) ( ON ?auto_239932 ?auto_239935 ) ( CLEAR ?auto_239932 ) ( not ( = ?auto_239932 ?auto_239935 ) ) ( not ( = ?auto_239933 ?auto_239935 ) ) ( not ( = ?auto_239931 ?auto_239935 ) ) ( not ( = ?auto_239940 ?auto_239935 ) ) ( TRUCK-AT ?auto_239934 ?auto_239939 ) ( ON ?auto_239927 ?auto_239926 ) ( ON ?auto_239928 ?auto_239927 ) ( ON ?auto_239929 ?auto_239928 ) ( ON ?auto_239930 ?auto_239929 ) ( ON ?auto_239931 ?auto_239930 ) ( not ( = ?auto_239926 ?auto_239927 ) ) ( not ( = ?auto_239926 ?auto_239928 ) ) ( not ( = ?auto_239926 ?auto_239929 ) ) ( not ( = ?auto_239926 ?auto_239930 ) ) ( not ( = ?auto_239926 ?auto_239931 ) ) ( not ( = ?auto_239926 ?auto_239932 ) ) ( not ( = ?auto_239926 ?auto_239933 ) ) ( not ( = ?auto_239926 ?auto_239940 ) ) ( not ( = ?auto_239926 ?auto_239935 ) ) ( not ( = ?auto_239927 ?auto_239928 ) ) ( not ( = ?auto_239927 ?auto_239929 ) ) ( not ( = ?auto_239927 ?auto_239930 ) ) ( not ( = ?auto_239927 ?auto_239931 ) ) ( not ( = ?auto_239927 ?auto_239932 ) ) ( not ( = ?auto_239927 ?auto_239933 ) ) ( not ( = ?auto_239927 ?auto_239940 ) ) ( not ( = ?auto_239927 ?auto_239935 ) ) ( not ( = ?auto_239928 ?auto_239929 ) ) ( not ( = ?auto_239928 ?auto_239930 ) ) ( not ( = ?auto_239928 ?auto_239931 ) ) ( not ( = ?auto_239928 ?auto_239932 ) ) ( not ( = ?auto_239928 ?auto_239933 ) ) ( not ( = ?auto_239928 ?auto_239940 ) ) ( not ( = ?auto_239928 ?auto_239935 ) ) ( not ( = ?auto_239929 ?auto_239930 ) ) ( not ( = ?auto_239929 ?auto_239931 ) ) ( not ( = ?auto_239929 ?auto_239932 ) ) ( not ( = ?auto_239929 ?auto_239933 ) ) ( not ( = ?auto_239929 ?auto_239940 ) ) ( not ( = ?auto_239929 ?auto_239935 ) ) ( not ( = ?auto_239930 ?auto_239931 ) ) ( not ( = ?auto_239930 ?auto_239932 ) ) ( not ( = ?auto_239930 ?auto_239933 ) ) ( not ( = ?auto_239930 ?auto_239940 ) ) ( not ( = ?auto_239930 ?auto_239935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239931 ?auto_239932 ?auto_239933 )
      ( MAKE-7CRATE-VERIFY ?auto_239926 ?auto_239927 ?auto_239928 ?auto_239929 ?auto_239930 ?auto_239931 ?auto_239932 ?auto_239933 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_239941 - SURFACE
      ?auto_239942 - SURFACE
      ?auto_239943 - SURFACE
      ?auto_239944 - SURFACE
      ?auto_239945 - SURFACE
      ?auto_239946 - SURFACE
      ?auto_239947 - SURFACE
      ?auto_239948 - SURFACE
      ?auto_239949 - SURFACE
    )
    :vars
    (
      ?auto_239952 - HOIST
      ?auto_239955 - PLACE
      ?auto_239953 - PLACE
      ?auto_239954 - HOIST
      ?auto_239956 - SURFACE
      ?auto_239951 - SURFACE
      ?auto_239950 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239952 ?auto_239955 ) ( IS-CRATE ?auto_239949 ) ( not ( = ?auto_239948 ?auto_239949 ) ) ( not ( = ?auto_239947 ?auto_239948 ) ) ( not ( = ?auto_239947 ?auto_239949 ) ) ( not ( = ?auto_239953 ?auto_239955 ) ) ( HOIST-AT ?auto_239954 ?auto_239953 ) ( not ( = ?auto_239952 ?auto_239954 ) ) ( SURFACE-AT ?auto_239949 ?auto_239953 ) ( ON ?auto_239949 ?auto_239956 ) ( CLEAR ?auto_239949 ) ( not ( = ?auto_239948 ?auto_239956 ) ) ( not ( = ?auto_239949 ?auto_239956 ) ) ( not ( = ?auto_239947 ?auto_239956 ) ) ( SURFACE-AT ?auto_239947 ?auto_239955 ) ( CLEAR ?auto_239947 ) ( IS-CRATE ?auto_239948 ) ( AVAILABLE ?auto_239952 ) ( AVAILABLE ?auto_239954 ) ( SURFACE-AT ?auto_239948 ?auto_239953 ) ( ON ?auto_239948 ?auto_239951 ) ( CLEAR ?auto_239948 ) ( not ( = ?auto_239948 ?auto_239951 ) ) ( not ( = ?auto_239949 ?auto_239951 ) ) ( not ( = ?auto_239947 ?auto_239951 ) ) ( not ( = ?auto_239956 ?auto_239951 ) ) ( TRUCK-AT ?auto_239950 ?auto_239955 ) ( ON ?auto_239942 ?auto_239941 ) ( ON ?auto_239943 ?auto_239942 ) ( ON ?auto_239944 ?auto_239943 ) ( ON ?auto_239945 ?auto_239944 ) ( ON ?auto_239946 ?auto_239945 ) ( ON ?auto_239947 ?auto_239946 ) ( not ( = ?auto_239941 ?auto_239942 ) ) ( not ( = ?auto_239941 ?auto_239943 ) ) ( not ( = ?auto_239941 ?auto_239944 ) ) ( not ( = ?auto_239941 ?auto_239945 ) ) ( not ( = ?auto_239941 ?auto_239946 ) ) ( not ( = ?auto_239941 ?auto_239947 ) ) ( not ( = ?auto_239941 ?auto_239948 ) ) ( not ( = ?auto_239941 ?auto_239949 ) ) ( not ( = ?auto_239941 ?auto_239956 ) ) ( not ( = ?auto_239941 ?auto_239951 ) ) ( not ( = ?auto_239942 ?auto_239943 ) ) ( not ( = ?auto_239942 ?auto_239944 ) ) ( not ( = ?auto_239942 ?auto_239945 ) ) ( not ( = ?auto_239942 ?auto_239946 ) ) ( not ( = ?auto_239942 ?auto_239947 ) ) ( not ( = ?auto_239942 ?auto_239948 ) ) ( not ( = ?auto_239942 ?auto_239949 ) ) ( not ( = ?auto_239942 ?auto_239956 ) ) ( not ( = ?auto_239942 ?auto_239951 ) ) ( not ( = ?auto_239943 ?auto_239944 ) ) ( not ( = ?auto_239943 ?auto_239945 ) ) ( not ( = ?auto_239943 ?auto_239946 ) ) ( not ( = ?auto_239943 ?auto_239947 ) ) ( not ( = ?auto_239943 ?auto_239948 ) ) ( not ( = ?auto_239943 ?auto_239949 ) ) ( not ( = ?auto_239943 ?auto_239956 ) ) ( not ( = ?auto_239943 ?auto_239951 ) ) ( not ( = ?auto_239944 ?auto_239945 ) ) ( not ( = ?auto_239944 ?auto_239946 ) ) ( not ( = ?auto_239944 ?auto_239947 ) ) ( not ( = ?auto_239944 ?auto_239948 ) ) ( not ( = ?auto_239944 ?auto_239949 ) ) ( not ( = ?auto_239944 ?auto_239956 ) ) ( not ( = ?auto_239944 ?auto_239951 ) ) ( not ( = ?auto_239945 ?auto_239946 ) ) ( not ( = ?auto_239945 ?auto_239947 ) ) ( not ( = ?auto_239945 ?auto_239948 ) ) ( not ( = ?auto_239945 ?auto_239949 ) ) ( not ( = ?auto_239945 ?auto_239956 ) ) ( not ( = ?auto_239945 ?auto_239951 ) ) ( not ( = ?auto_239946 ?auto_239947 ) ) ( not ( = ?auto_239946 ?auto_239948 ) ) ( not ( = ?auto_239946 ?auto_239949 ) ) ( not ( = ?auto_239946 ?auto_239956 ) ) ( not ( = ?auto_239946 ?auto_239951 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239947 ?auto_239948 ?auto_239949 )
      ( MAKE-8CRATE-VERIFY ?auto_239941 ?auto_239942 ?auto_239943 ?auto_239944 ?auto_239945 ?auto_239946 ?auto_239947 ?auto_239948 ?auto_239949 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_239957 - SURFACE
      ?auto_239958 - SURFACE
      ?auto_239959 - SURFACE
      ?auto_239960 - SURFACE
      ?auto_239961 - SURFACE
      ?auto_239962 - SURFACE
      ?auto_239963 - SURFACE
      ?auto_239964 - SURFACE
      ?auto_239965 - SURFACE
      ?auto_239966 - SURFACE
    )
    :vars
    (
      ?auto_239969 - HOIST
      ?auto_239972 - PLACE
      ?auto_239970 - PLACE
      ?auto_239971 - HOIST
      ?auto_239973 - SURFACE
      ?auto_239968 - SURFACE
      ?auto_239967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_239969 ?auto_239972 ) ( IS-CRATE ?auto_239966 ) ( not ( = ?auto_239965 ?auto_239966 ) ) ( not ( = ?auto_239964 ?auto_239965 ) ) ( not ( = ?auto_239964 ?auto_239966 ) ) ( not ( = ?auto_239970 ?auto_239972 ) ) ( HOIST-AT ?auto_239971 ?auto_239970 ) ( not ( = ?auto_239969 ?auto_239971 ) ) ( SURFACE-AT ?auto_239966 ?auto_239970 ) ( ON ?auto_239966 ?auto_239973 ) ( CLEAR ?auto_239966 ) ( not ( = ?auto_239965 ?auto_239973 ) ) ( not ( = ?auto_239966 ?auto_239973 ) ) ( not ( = ?auto_239964 ?auto_239973 ) ) ( SURFACE-AT ?auto_239964 ?auto_239972 ) ( CLEAR ?auto_239964 ) ( IS-CRATE ?auto_239965 ) ( AVAILABLE ?auto_239969 ) ( AVAILABLE ?auto_239971 ) ( SURFACE-AT ?auto_239965 ?auto_239970 ) ( ON ?auto_239965 ?auto_239968 ) ( CLEAR ?auto_239965 ) ( not ( = ?auto_239965 ?auto_239968 ) ) ( not ( = ?auto_239966 ?auto_239968 ) ) ( not ( = ?auto_239964 ?auto_239968 ) ) ( not ( = ?auto_239973 ?auto_239968 ) ) ( TRUCK-AT ?auto_239967 ?auto_239972 ) ( ON ?auto_239958 ?auto_239957 ) ( ON ?auto_239959 ?auto_239958 ) ( ON ?auto_239960 ?auto_239959 ) ( ON ?auto_239961 ?auto_239960 ) ( ON ?auto_239962 ?auto_239961 ) ( ON ?auto_239963 ?auto_239962 ) ( ON ?auto_239964 ?auto_239963 ) ( not ( = ?auto_239957 ?auto_239958 ) ) ( not ( = ?auto_239957 ?auto_239959 ) ) ( not ( = ?auto_239957 ?auto_239960 ) ) ( not ( = ?auto_239957 ?auto_239961 ) ) ( not ( = ?auto_239957 ?auto_239962 ) ) ( not ( = ?auto_239957 ?auto_239963 ) ) ( not ( = ?auto_239957 ?auto_239964 ) ) ( not ( = ?auto_239957 ?auto_239965 ) ) ( not ( = ?auto_239957 ?auto_239966 ) ) ( not ( = ?auto_239957 ?auto_239973 ) ) ( not ( = ?auto_239957 ?auto_239968 ) ) ( not ( = ?auto_239958 ?auto_239959 ) ) ( not ( = ?auto_239958 ?auto_239960 ) ) ( not ( = ?auto_239958 ?auto_239961 ) ) ( not ( = ?auto_239958 ?auto_239962 ) ) ( not ( = ?auto_239958 ?auto_239963 ) ) ( not ( = ?auto_239958 ?auto_239964 ) ) ( not ( = ?auto_239958 ?auto_239965 ) ) ( not ( = ?auto_239958 ?auto_239966 ) ) ( not ( = ?auto_239958 ?auto_239973 ) ) ( not ( = ?auto_239958 ?auto_239968 ) ) ( not ( = ?auto_239959 ?auto_239960 ) ) ( not ( = ?auto_239959 ?auto_239961 ) ) ( not ( = ?auto_239959 ?auto_239962 ) ) ( not ( = ?auto_239959 ?auto_239963 ) ) ( not ( = ?auto_239959 ?auto_239964 ) ) ( not ( = ?auto_239959 ?auto_239965 ) ) ( not ( = ?auto_239959 ?auto_239966 ) ) ( not ( = ?auto_239959 ?auto_239973 ) ) ( not ( = ?auto_239959 ?auto_239968 ) ) ( not ( = ?auto_239960 ?auto_239961 ) ) ( not ( = ?auto_239960 ?auto_239962 ) ) ( not ( = ?auto_239960 ?auto_239963 ) ) ( not ( = ?auto_239960 ?auto_239964 ) ) ( not ( = ?auto_239960 ?auto_239965 ) ) ( not ( = ?auto_239960 ?auto_239966 ) ) ( not ( = ?auto_239960 ?auto_239973 ) ) ( not ( = ?auto_239960 ?auto_239968 ) ) ( not ( = ?auto_239961 ?auto_239962 ) ) ( not ( = ?auto_239961 ?auto_239963 ) ) ( not ( = ?auto_239961 ?auto_239964 ) ) ( not ( = ?auto_239961 ?auto_239965 ) ) ( not ( = ?auto_239961 ?auto_239966 ) ) ( not ( = ?auto_239961 ?auto_239973 ) ) ( not ( = ?auto_239961 ?auto_239968 ) ) ( not ( = ?auto_239962 ?auto_239963 ) ) ( not ( = ?auto_239962 ?auto_239964 ) ) ( not ( = ?auto_239962 ?auto_239965 ) ) ( not ( = ?auto_239962 ?auto_239966 ) ) ( not ( = ?auto_239962 ?auto_239973 ) ) ( not ( = ?auto_239962 ?auto_239968 ) ) ( not ( = ?auto_239963 ?auto_239964 ) ) ( not ( = ?auto_239963 ?auto_239965 ) ) ( not ( = ?auto_239963 ?auto_239966 ) ) ( not ( = ?auto_239963 ?auto_239973 ) ) ( not ( = ?auto_239963 ?auto_239968 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_239964 ?auto_239965 ?auto_239966 )
      ( MAKE-9CRATE-VERIFY ?auto_239957 ?auto_239958 ?auto_239959 ?auto_239960 ?auto_239961 ?auto_239962 ?auto_239963 ?auto_239964 ?auto_239965 ?auto_239966 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_240019 - SURFACE
      ?auto_240020 - SURFACE
      ?auto_240021 - SURFACE
      ?auto_240022 - SURFACE
      ?auto_240023 - SURFACE
      ?auto_240024 - SURFACE
    )
    :vars
    (
      ?auto_240025 - HOIST
      ?auto_240028 - PLACE
      ?auto_240031 - PLACE
      ?auto_240026 - HOIST
      ?auto_240029 - SURFACE
      ?auto_240030 - SURFACE
      ?auto_240027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_240025 ?auto_240028 ) ( IS-CRATE ?auto_240024 ) ( not ( = ?auto_240023 ?auto_240024 ) ) ( not ( = ?auto_240022 ?auto_240023 ) ) ( not ( = ?auto_240022 ?auto_240024 ) ) ( not ( = ?auto_240031 ?auto_240028 ) ) ( HOIST-AT ?auto_240026 ?auto_240031 ) ( not ( = ?auto_240025 ?auto_240026 ) ) ( SURFACE-AT ?auto_240024 ?auto_240031 ) ( ON ?auto_240024 ?auto_240029 ) ( CLEAR ?auto_240024 ) ( not ( = ?auto_240023 ?auto_240029 ) ) ( not ( = ?auto_240024 ?auto_240029 ) ) ( not ( = ?auto_240022 ?auto_240029 ) ) ( IS-CRATE ?auto_240023 ) ( AVAILABLE ?auto_240026 ) ( SURFACE-AT ?auto_240023 ?auto_240031 ) ( ON ?auto_240023 ?auto_240030 ) ( CLEAR ?auto_240023 ) ( not ( = ?auto_240023 ?auto_240030 ) ) ( not ( = ?auto_240024 ?auto_240030 ) ) ( not ( = ?auto_240022 ?auto_240030 ) ) ( not ( = ?auto_240029 ?auto_240030 ) ) ( TRUCK-AT ?auto_240027 ?auto_240028 ) ( SURFACE-AT ?auto_240021 ?auto_240028 ) ( CLEAR ?auto_240021 ) ( LIFTING ?auto_240025 ?auto_240022 ) ( IS-CRATE ?auto_240022 ) ( not ( = ?auto_240021 ?auto_240022 ) ) ( not ( = ?auto_240023 ?auto_240021 ) ) ( not ( = ?auto_240024 ?auto_240021 ) ) ( not ( = ?auto_240029 ?auto_240021 ) ) ( not ( = ?auto_240030 ?auto_240021 ) ) ( ON ?auto_240020 ?auto_240019 ) ( ON ?auto_240021 ?auto_240020 ) ( not ( = ?auto_240019 ?auto_240020 ) ) ( not ( = ?auto_240019 ?auto_240021 ) ) ( not ( = ?auto_240019 ?auto_240022 ) ) ( not ( = ?auto_240019 ?auto_240023 ) ) ( not ( = ?auto_240019 ?auto_240024 ) ) ( not ( = ?auto_240019 ?auto_240029 ) ) ( not ( = ?auto_240019 ?auto_240030 ) ) ( not ( = ?auto_240020 ?auto_240021 ) ) ( not ( = ?auto_240020 ?auto_240022 ) ) ( not ( = ?auto_240020 ?auto_240023 ) ) ( not ( = ?auto_240020 ?auto_240024 ) ) ( not ( = ?auto_240020 ?auto_240029 ) ) ( not ( = ?auto_240020 ?auto_240030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_240022 ?auto_240023 ?auto_240024 )
      ( MAKE-5CRATE-VERIFY ?auto_240019 ?auto_240020 ?auto_240021 ?auto_240022 ?auto_240023 ?auto_240024 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_240032 - SURFACE
      ?auto_240033 - SURFACE
      ?auto_240034 - SURFACE
      ?auto_240035 - SURFACE
      ?auto_240036 - SURFACE
      ?auto_240037 - SURFACE
      ?auto_240038 - SURFACE
    )
    :vars
    (
      ?auto_240039 - HOIST
      ?auto_240042 - PLACE
      ?auto_240045 - PLACE
      ?auto_240040 - HOIST
      ?auto_240043 - SURFACE
      ?auto_240044 - SURFACE
      ?auto_240041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_240039 ?auto_240042 ) ( IS-CRATE ?auto_240038 ) ( not ( = ?auto_240037 ?auto_240038 ) ) ( not ( = ?auto_240036 ?auto_240037 ) ) ( not ( = ?auto_240036 ?auto_240038 ) ) ( not ( = ?auto_240045 ?auto_240042 ) ) ( HOIST-AT ?auto_240040 ?auto_240045 ) ( not ( = ?auto_240039 ?auto_240040 ) ) ( SURFACE-AT ?auto_240038 ?auto_240045 ) ( ON ?auto_240038 ?auto_240043 ) ( CLEAR ?auto_240038 ) ( not ( = ?auto_240037 ?auto_240043 ) ) ( not ( = ?auto_240038 ?auto_240043 ) ) ( not ( = ?auto_240036 ?auto_240043 ) ) ( IS-CRATE ?auto_240037 ) ( AVAILABLE ?auto_240040 ) ( SURFACE-AT ?auto_240037 ?auto_240045 ) ( ON ?auto_240037 ?auto_240044 ) ( CLEAR ?auto_240037 ) ( not ( = ?auto_240037 ?auto_240044 ) ) ( not ( = ?auto_240038 ?auto_240044 ) ) ( not ( = ?auto_240036 ?auto_240044 ) ) ( not ( = ?auto_240043 ?auto_240044 ) ) ( TRUCK-AT ?auto_240041 ?auto_240042 ) ( SURFACE-AT ?auto_240035 ?auto_240042 ) ( CLEAR ?auto_240035 ) ( LIFTING ?auto_240039 ?auto_240036 ) ( IS-CRATE ?auto_240036 ) ( not ( = ?auto_240035 ?auto_240036 ) ) ( not ( = ?auto_240037 ?auto_240035 ) ) ( not ( = ?auto_240038 ?auto_240035 ) ) ( not ( = ?auto_240043 ?auto_240035 ) ) ( not ( = ?auto_240044 ?auto_240035 ) ) ( ON ?auto_240033 ?auto_240032 ) ( ON ?auto_240034 ?auto_240033 ) ( ON ?auto_240035 ?auto_240034 ) ( not ( = ?auto_240032 ?auto_240033 ) ) ( not ( = ?auto_240032 ?auto_240034 ) ) ( not ( = ?auto_240032 ?auto_240035 ) ) ( not ( = ?auto_240032 ?auto_240036 ) ) ( not ( = ?auto_240032 ?auto_240037 ) ) ( not ( = ?auto_240032 ?auto_240038 ) ) ( not ( = ?auto_240032 ?auto_240043 ) ) ( not ( = ?auto_240032 ?auto_240044 ) ) ( not ( = ?auto_240033 ?auto_240034 ) ) ( not ( = ?auto_240033 ?auto_240035 ) ) ( not ( = ?auto_240033 ?auto_240036 ) ) ( not ( = ?auto_240033 ?auto_240037 ) ) ( not ( = ?auto_240033 ?auto_240038 ) ) ( not ( = ?auto_240033 ?auto_240043 ) ) ( not ( = ?auto_240033 ?auto_240044 ) ) ( not ( = ?auto_240034 ?auto_240035 ) ) ( not ( = ?auto_240034 ?auto_240036 ) ) ( not ( = ?auto_240034 ?auto_240037 ) ) ( not ( = ?auto_240034 ?auto_240038 ) ) ( not ( = ?auto_240034 ?auto_240043 ) ) ( not ( = ?auto_240034 ?auto_240044 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_240036 ?auto_240037 ?auto_240038 )
      ( MAKE-6CRATE-VERIFY ?auto_240032 ?auto_240033 ?auto_240034 ?auto_240035 ?auto_240036 ?auto_240037 ?auto_240038 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_240046 - SURFACE
      ?auto_240047 - SURFACE
      ?auto_240048 - SURFACE
      ?auto_240049 - SURFACE
      ?auto_240050 - SURFACE
      ?auto_240051 - SURFACE
      ?auto_240052 - SURFACE
      ?auto_240053 - SURFACE
    )
    :vars
    (
      ?auto_240054 - HOIST
      ?auto_240057 - PLACE
      ?auto_240060 - PLACE
      ?auto_240055 - HOIST
      ?auto_240058 - SURFACE
      ?auto_240059 - SURFACE
      ?auto_240056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_240054 ?auto_240057 ) ( IS-CRATE ?auto_240053 ) ( not ( = ?auto_240052 ?auto_240053 ) ) ( not ( = ?auto_240051 ?auto_240052 ) ) ( not ( = ?auto_240051 ?auto_240053 ) ) ( not ( = ?auto_240060 ?auto_240057 ) ) ( HOIST-AT ?auto_240055 ?auto_240060 ) ( not ( = ?auto_240054 ?auto_240055 ) ) ( SURFACE-AT ?auto_240053 ?auto_240060 ) ( ON ?auto_240053 ?auto_240058 ) ( CLEAR ?auto_240053 ) ( not ( = ?auto_240052 ?auto_240058 ) ) ( not ( = ?auto_240053 ?auto_240058 ) ) ( not ( = ?auto_240051 ?auto_240058 ) ) ( IS-CRATE ?auto_240052 ) ( AVAILABLE ?auto_240055 ) ( SURFACE-AT ?auto_240052 ?auto_240060 ) ( ON ?auto_240052 ?auto_240059 ) ( CLEAR ?auto_240052 ) ( not ( = ?auto_240052 ?auto_240059 ) ) ( not ( = ?auto_240053 ?auto_240059 ) ) ( not ( = ?auto_240051 ?auto_240059 ) ) ( not ( = ?auto_240058 ?auto_240059 ) ) ( TRUCK-AT ?auto_240056 ?auto_240057 ) ( SURFACE-AT ?auto_240050 ?auto_240057 ) ( CLEAR ?auto_240050 ) ( LIFTING ?auto_240054 ?auto_240051 ) ( IS-CRATE ?auto_240051 ) ( not ( = ?auto_240050 ?auto_240051 ) ) ( not ( = ?auto_240052 ?auto_240050 ) ) ( not ( = ?auto_240053 ?auto_240050 ) ) ( not ( = ?auto_240058 ?auto_240050 ) ) ( not ( = ?auto_240059 ?auto_240050 ) ) ( ON ?auto_240047 ?auto_240046 ) ( ON ?auto_240048 ?auto_240047 ) ( ON ?auto_240049 ?auto_240048 ) ( ON ?auto_240050 ?auto_240049 ) ( not ( = ?auto_240046 ?auto_240047 ) ) ( not ( = ?auto_240046 ?auto_240048 ) ) ( not ( = ?auto_240046 ?auto_240049 ) ) ( not ( = ?auto_240046 ?auto_240050 ) ) ( not ( = ?auto_240046 ?auto_240051 ) ) ( not ( = ?auto_240046 ?auto_240052 ) ) ( not ( = ?auto_240046 ?auto_240053 ) ) ( not ( = ?auto_240046 ?auto_240058 ) ) ( not ( = ?auto_240046 ?auto_240059 ) ) ( not ( = ?auto_240047 ?auto_240048 ) ) ( not ( = ?auto_240047 ?auto_240049 ) ) ( not ( = ?auto_240047 ?auto_240050 ) ) ( not ( = ?auto_240047 ?auto_240051 ) ) ( not ( = ?auto_240047 ?auto_240052 ) ) ( not ( = ?auto_240047 ?auto_240053 ) ) ( not ( = ?auto_240047 ?auto_240058 ) ) ( not ( = ?auto_240047 ?auto_240059 ) ) ( not ( = ?auto_240048 ?auto_240049 ) ) ( not ( = ?auto_240048 ?auto_240050 ) ) ( not ( = ?auto_240048 ?auto_240051 ) ) ( not ( = ?auto_240048 ?auto_240052 ) ) ( not ( = ?auto_240048 ?auto_240053 ) ) ( not ( = ?auto_240048 ?auto_240058 ) ) ( not ( = ?auto_240048 ?auto_240059 ) ) ( not ( = ?auto_240049 ?auto_240050 ) ) ( not ( = ?auto_240049 ?auto_240051 ) ) ( not ( = ?auto_240049 ?auto_240052 ) ) ( not ( = ?auto_240049 ?auto_240053 ) ) ( not ( = ?auto_240049 ?auto_240058 ) ) ( not ( = ?auto_240049 ?auto_240059 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_240051 ?auto_240052 ?auto_240053 )
      ( MAKE-7CRATE-VERIFY ?auto_240046 ?auto_240047 ?auto_240048 ?auto_240049 ?auto_240050 ?auto_240051 ?auto_240052 ?auto_240053 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_240061 - SURFACE
      ?auto_240062 - SURFACE
      ?auto_240063 - SURFACE
      ?auto_240064 - SURFACE
      ?auto_240065 - SURFACE
      ?auto_240066 - SURFACE
      ?auto_240067 - SURFACE
      ?auto_240068 - SURFACE
      ?auto_240069 - SURFACE
    )
    :vars
    (
      ?auto_240070 - HOIST
      ?auto_240073 - PLACE
      ?auto_240076 - PLACE
      ?auto_240071 - HOIST
      ?auto_240074 - SURFACE
      ?auto_240075 - SURFACE
      ?auto_240072 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_240070 ?auto_240073 ) ( IS-CRATE ?auto_240069 ) ( not ( = ?auto_240068 ?auto_240069 ) ) ( not ( = ?auto_240067 ?auto_240068 ) ) ( not ( = ?auto_240067 ?auto_240069 ) ) ( not ( = ?auto_240076 ?auto_240073 ) ) ( HOIST-AT ?auto_240071 ?auto_240076 ) ( not ( = ?auto_240070 ?auto_240071 ) ) ( SURFACE-AT ?auto_240069 ?auto_240076 ) ( ON ?auto_240069 ?auto_240074 ) ( CLEAR ?auto_240069 ) ( not ( = ?auto_240068 ?auto_240074 ) ) ( not ( = ?auto_240069 ?auto_240074 ) ) ( not ( = ?auto_240067 ?auto_240074 ) ) ( IS-CRATE ?auto_240068 ) ( AVAILABLE ?auto_240071 ) ( SURFACE-AT ?auto_240068 ?auto_240076 ) ( ON ?auto_240068 ?auto_240075 ) ( CLEAR ?auto_240068 ) ( not ( = ?auto_240068 ?auto_240075 ) ) ( not ( = ?auto_240069 ?auto_240075 ) ) ( not ( = ?auto_240067 ?auto_240075 ) ) ( not ( = ?auto_240074 ?auto_240075 ) ) ( TRUCK-AT ?auto_240072 ?auto_240073 ) ( SURFACE-AT ?auto_240066 ?auto_240073 ) ( CLEAR ?auto_240066 ) ( LIFTING ?auto_240070 ?auto_240067 ) ( IS-CRATE ?auto_240067 ) ( not ( = ?auto_240066 ?auto_240067 ) ) ( not ( = ?auto_240068 ?auto_240066 ) ) ( not ( = ?auto_240069 ?auto_240066 ) ) ( not ( = ?auto_240074 ?auto_240066 ) ) ( not ( = ?auto_240075 ?auto_240066 ) ) ( ON ?auto_240062 ?auto_240061 ) ( ON ?auto_240063 ?auto_240062 ) ( ON ?auto_240064 ?auto_240063 ) ( ON ?auto_240065 ?auto_240064 ) ( ON ?auto_240066 ?auto_240065 ) ( not ( = ?auto_240061 ?auto_240062 ) ) ( not ( = ?auto_240061 ?auto_240063 ) ) ( not ( = ?auto_240061 ?auto_240064 ) ) ( not ( = ?auto_240061 ?auto_240065 ) ) ( not ( = ?auto_240061 ?auto_240066 ) ) ( not ( = ?auto_240061 ?auto_240067 ) ) ( not ( = ?auto_240061 ?auto_240068 ) ) ( not ( = ?auto_240061 ?auto_240069 ) ) ( not ( = ?auto_240061 ?auto_240074 ) ) ( not ( = ?auto_240061 ?auto_240075 ) ) ( not ( = ?auto_240062 ?auto_240063 ) ) ( not ( = ?auto_240062 ?auto_240064 ) ) ( not ( = ?auto_240062 ?auto_240065 ) ) ( not ( = ?auto_240062 ?auto_240066 ) ) ( not ( = ?auto_240062 ?auto_240067 ) ) ( not ( = ?auto_240062 ?auto_240068 ) ) ( not ( = ?auto_240062 ?auto_240069 ) ) ( not ( = ?auto_240062 ?auto_240074 ) ) ( not ( = ?auto_240062 ?auto_240075 ) ) ( not ( = ?auto_240063 ?auto_240064 ) ) ( not ( = ?auto_240063 ?auto_240065 ) ) ( not ( = ?auto_240063 ?auto_240066 ) ) ( not ( = ?auto_240063 ?auto_240067 ) ) ( not ( = ?auto_240063 ?auto_240068 ) ) ( not ( = ?auto_240063 ?auto_240069 ) ) ( not ( = ?auto_240063 ?auto_240074 ) ) ( not ( = ?auto_240063 ?auto_240075 ) ) ( not ( = ?auto_240064 ?auto_240065 ) ) ( not ( = ?auto_240064 ?auto_240066 ) ) ( not ( = ?auto_240064 ?auto_240067 ) ) ( not ( = ?auto_240064 ?auto_240068 ) ) ( not ( = ?auto_240064 ?auto_240069 ) ) ( not ( = ?auto_240064 ?auto_240074 ) ) ( not ( = ?auto_240064 ?auto_240075 ) ) ( not ( = ?auto_240065 ?auto_240066 ) ) ( not ( = ?auto_240065 ?auto_240067 ) ) ( not ( = ?auto_240065 ?auto_240068 ) ) ( not ( = ?auto_240065 ?auto_240069 ) ) ( not ( = ?auto_240065 ?auto_240074 ) ) ( not ( = ?auto_240065 ?auto_240075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_240067 ?auto_240068 ?auto_240069 )
      ( MAKE-8CRATE-VERIFY ?auto_240061 ?auto_240062 ?auto_240063 ?auto_240064 ?auto_240065 ?auto_240066 ?auto_240067 ?auto_240068 ?auto_240069 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_240077 - SURFACE
      ?auto_240078 - SURFACE
      ?auto_240079 - SURFACE
      ?auto_240080 - SURFACE
      ?auto_240081 - SURFACE
      ?auto_240082 - SURFACE
      ?auto_240083 - SURFACE
      ?auto_240084 - SURFACE
      ?auto_240085 - SURFACE
      ?auto_240086 - SURFACE
    )
    :vars
    (
      ?auto_240087 - HOIST
      ?auto_240090 - PLACE
      ?auto_240093 - PLACE
      ?auto_240088 - HOIST
      ?auto_240091 - SURFACE
      ?auto_240092 - SURFACE
      ?auto_240089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_240087 ?auto_240090 ) ( IS-CRATE ?auto_240086 ) ( not ( = ?auto_240085 ?auto_240086 ) ) ( not ( = ?auto_240084 ?auto_240085 ) ) ( not ( = ?auto_240084 ?auto_240086 ) ) ( not ( = ?auto_240093 ?auto_240090 ) ) ( HOIST-AT ?auto_240088 ?auto_240093 ) ( not ( = ?auto_240087 ?auto_240088 ) ) ( SURFACE-AT ?auto_240086 ?auto_240093 ) ( ON ?auto_240086 ?auto_240091 ) ( CLEAR ?auto_240086 ) ( not ( = ?auto_240085 ?auto_240091 ) ) ( not ( = ?auto_240086 ?auto_240091 ) ) ( not ( = ?auto_240084 ?auto_240091 ) ) ( IS-CRATE ?auto_240085 ) ( AVAILABLE ?auto_240088 ) ( SURFACE-AT ?auto_240085 ?auto_240093 ) ( ON ?auto_240085 ?auto_240092 ) ( CLEAR ?auto_240085 ) ( not ( = ?auto_240085 ?auto_240092 ) ) ( not ( = ?auto_240086 ?auto_240092 ) ) ( not ( = ?auto_240084 ?auto_240092 ) ) ( not ( = ?auto_240091 ?auto_240092 ) ) ( TRUCK-AT ?auto_240089 ?auto_240090 ) ( SURFACE-AT ?auto_240083 ?auto_240090 ) ( CLEAR ?auto_240083 ) ( LIFTING ?auto_240087 ?auto_240084 ) ( IS-CRATE ?auto_240084 ) ( not ( = ?auto_240083 ?auto_240084 ) ) ( not ( = ?auto_240085 ?auto_240083 ) ) ( not ( = ?auto_240086 ?auto_240083 ) ) ( not ( = ?auto_240091 ?auto_240083 ) ) ( not ( = ?auto_240092 ?auto_240083 ) ) ( ON ?auto_240078 ?auto_240077 ) ( ON ?auto_240079 ?auto_240078 ) ( ON ?auto_240080 ?auto_240079 ) ( ON ?auto_240081 ?auto_240080 ) ( ON ?auto_240082 ?auto_240081 ) ( ON ?auto_240083 ?auto_240082 ) ( not ( = ?auto_240077 ?auto_240078 ) ) ( not ( = ?auto_240077 ?auto_240079 ) ) ( not ( = ?auto_240077 ?auto_240080 ) ) ( not ( = ?auto_240077 ?auto_240081 ) ) ( not ( = ?auto_240077 ?auto_240082 ) ) ( not ( = ?auto_240077 ?auto_240083 ) ) ( not ( = ?auto_240077 ?auto_240084 ) ) ( not ( = ?auto_240077 ?auto_240085 ) ) ( not ( = ?auto_240077 ?auto_240086 ) ) ( not ( = ?auto_240077 ?auto_240091 ) ) ( not ( = ?auto_240077 ?auto_240092 ) ) ( not ( = ?auto_240078 ?auto_240079 ) ) ( not ( = ?auto_240078 ?auto_240080 ) ) ( not ( = ?auto_240078 ?auto_240081 ) ) ( not ( = ?auto_240078 ?auto_240082 ) ) ( not ( = ?auto_240078 ?auto_240083 ) ) ( not ( = ?auto_240078 ?auto_240084 ) ) ( not ( = ?auto_240078 ?auto_240085 ) ) ( not ( = ?auto_240078 ?auto_240086 ) ) ( not ( = ?auto_240078 ?auto_240091 ) ) ( not ( = ?auto_240078 ?auto_240092 ) ) ( not ( = ?auto_240079 ?auto_240080 ) ) ( not ( = ?auto_240079 ?auto_240081 ) ) ( not ( = ?auto_240079 ?auto_240082 ) ) ( not ( = ?auto_240079 ?auto_240083 ) ) ( not ( = ?auto_240079 ?auto_240084 ) ) ( not ( = ?auto_240079 ?auto_240085 ) ) ( not ( = ?auto_240079 ?auto_240086 ) ) ( not ( = ?auto_240079 ?auto_240091 ) ) ( not ( = ?auto_240079 ?auto_240092 ) ) ( not ( = ?auto_240080 ?auto_240081 ) ) ( not ( = ?auto_240080 ?auto_240082 ) ) ( not ( = ?auto_240080 ?auto_240083 ) ) ( not ( = ?auto_240080 ?auto_240084 ) ) ( not ( = ?auto_240080 ?auto_240085 ) ) ( not ( = ?auto_240080 ?auto_240086 ) ) ( not ( = ?auto_240080 ?auto_240091 ) ) ( not ( = ?auto_240080 ?auto_240092 ) ) ( not ( = ?auto_240081 ?auto_240082 ) ) ( not ( = ?auto_240081 ?auto_240083 ) ) ( not ( = ?auto_240081 ?auto_240084 ) ) ( not ( = ?auto_240081 ?auto_240085 ) ) ( not ( = ?auto_240081 ?auto_240086 ) ) ( not ( = ?auto_240081 ?auto_240091 ) ) ( not ( = ?auto_240081 ?auto_240092 ) ) ( not ( = ?auto_240082 ?auto_240083 ) ) ( not ( = ?auto_240082 ?auto_240084 ) ) ( not ( = ?auto_240082 ?auto_240085 ) ) ( not ( = ?auto_240082 ?auto_240086 ) ) ( not ( = ?auto_240082 ?auto_240091 ) ) ( not ( = ?auto_240082 ?auto_240092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_240084 ?auto_240085 ?auto_240086 )
      ( MAKE-9CRATE-VERIFY ?auto_240077 ?auto_240078 ?auto_240079 ?auto_240080 ?auto_240081 ?auto_240082 ?auto_240083 ?auto_240084 ?auto_240085 ?auto_240086 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_240975 - SURFACE
      ?auto_240976 - SURFACE
    )
    :vars
    (
      ?auto_240982 - HOIST
      ?auto_240980 - PLACE
      ?auto_240984 - SURFACE
      ?auto_240979 - PLACE
      ?auto_240983 - HOIST
      ?auto_240981 - SURFACE
      ?auto_240978 - TRUCK
      ?auto_240977 - SURFACE
      ?auto_240985 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_240982 ?auto_240980 ) ( IS-CRATE ?auto_240976 ) ( not ( = ?auto_240975 ?auto_240976 ) ) ( not ( = ?auto_240984 ?auto_240975 ) ) ( not ( = ?auto_240984 ?auto_240976 ) ) ( not ( = ?auto_240979 ?auto_240980 ) ) ( HOIST-AT ?auto_240983 ?auto_240979 ) ( not ( = ?auto_240982 ?auto_240983 ) ) ( SURFACE-AT ?auto_240976 ?auto_240979 ) ( ON ?auto_240976 ?auto_240981 ) ( CLEAR ?auto_240976 ) ( not ( = ?auto_240975 ?auto_240981 ) ) ( not ( = ?auto_240976 ?auto_240981 ) ) ( not ( = ?auto_240984 ?auto_240981 ) ) ( SURFACE-AT ?auto_240984 ?auto_240980 ) ( CLEAR ?auto_240984 ) ( IS-CRATE ?auto_240975 ) ( AVAILABLE ?auto_240982 ) ( TRUCK-AT ?auto_240978 ?auto_240979 ) ( SURFACE-AT ?auto_240975 ?auto_240979 ) ( ON ?auto_240975 ?auto_240977 ) ( CLEAR ?auto_240975 ) ( not ( = ?auto_240975 ?auto_240977 ) ) ( not ( = ?auto_240976 ?auto_240977 ) ) ( not ( = ?auto_240984 ?auto_240977 ) ) ( not ( = ?auto_240981 ?auto_240977 ) ) ( LIFTING ?auto_240983 ?auto_240985 ) ( IS-CRATE ?auto_240985 ) ( not ( = ?auto_240975 ?auto_240985 ) ) ( not ( = ?auto_240976 ?auto_240985 ) ) ( not ( = ?auto_240984 ?auto_240985 ) ) ( not ( = ?auto_240981 ?auto_240985 ) ) ( not ( = ?auto_240977 ?auto_240985 ) ) )
    :subtasks
    ( ( !LOAD ?auto_240983 ?auto_240985 ?auto_240978 ?auto_240979 )
      ( MAKE-2CRATE ?auto_240984 ?auto_240975 ?auto_240976 )
      ( MAKE-1CRATE-VERIFY ?auto_240975 ?auto_240976 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_240986 - SURFACE
      ?auto_240987 - SURFACE
      ?auto_240988 - SURFACE
    )
    :vars
    (
      ?auto_240995 - HOIST
      ?auto_240990 - PLACE
      ?auto_240989 - PLACE
      ?auto_240993 - HOIST
      ?auto_240991 - SURFACE
      ?auto_240996 - TRUCK
      ?auto_240992 - SURFACE
      ?auto_240994 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_240995 ?auto_240990 ) ( IS-CRATE ?auto_240988 ) ( not ( = ?auto_240987 ?auto_240988 ) ) ( not ( = ?auto_240986 ?auto_240987 ) ) ( not ( = ?auto_240986 ?auto_240988 ) ) ( not ( = ?auto_240989 ?auto_240990 ) ) ( HOIST-AT ?auto_240993 ?auto_240989 ) ( not ( = ?auto_240995 ?auto_240993 ) ) ( SURFACE-AT ?auto_240988 ?auto_240989 ) ( ON ?auto_240988 ?auto_240991 ) ( CLEAR ?auto_240988 ) ( not ( = ?auto_240987 ?auto_240991 ) ) ( not ( = ?auto_240988 ?auto_240991 ) ) ( not ( = ?auto_240986 ?auto_240991 ) ) ( SURFACE-AT ?auto_240986 ?auto_240990 ) ( CLEAR ?auto_240986 ) ( IS-CRATE ?auto_240987 ) ( AVAILABLE ?auto_240995 ) ( TRUCK-AT ?auto_240996 ?auto_240989 ) ( SURFACE-AT ?auto_240987 ?auto_240989 ) ( ON ?auto_240987 ?auto_240992 ) ( CLEAR ?auto_240987 ) ( not ( = ?auto_240987 ?auto_240992 ) ) ( not ( = ?auto_240988 ?auto_240992 ) ) ( not ( = ?auto_240986 ?auto_240992 ) ) ( not ( = ?auto_240991 ?auto_240992 ) ) ( LIFTING ?auto_240993 ?auto_240994 ) ( IS-CRATE ?auto_240994 ) ( not ( = ?auto_240987 ?auto_240994 ) ) ( not ( = ?auto_240988 ?auto_240994 ) ) ( not ( = ?auto_240986 ?auto_240994 ) ) ( not ( = ?auto_240991 ?auto_240994 ) ) ( not ( = ?auto_240992 ?auto_240994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_240987 ?auto_240988 )
      ( MAKE-2CRATE-VERIFY ?auto_240986 ?auto_240987 ?auto_240988 ) )
  )

)

